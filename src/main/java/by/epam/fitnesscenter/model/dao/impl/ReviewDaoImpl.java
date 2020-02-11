package by.epam.fitnesscenter.model.dao.impl;

import by.epam.fitnesscenter.model.dao.ReviewDao;
import by.epam.fitnesscenter.model.dto.ReviewDto;
import by.epam.fitnesscenter.model.entity.Review;
import by.epam.fitnesscenter.model.entity.User;
import by.epam.fitnesscenter.model.exception.DaoException;
import by.epam.fitnesscenter.model.exception.PoolException;
import by.epam.fitnesscenter.model.pool.ConnectionPool;
import by.epam.fitnesscenter.model.pool.ProxyConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.*;

public class ReviewDaoImpl implements ReviewDao {

    private static final String CREATE_REVIEW =
            "INSERT INTO review (user_id, message)  VALUES (?, ?);";

    private static final String FIND_ALL_REVIEW =
            "select review.message as message, user.name as name from review " +
                    "inner join user on user.id = review.user_id;";

    private static final String FIND_REVIEW_BY_ID =
            "select review.message as message, user.name as name from review " +
                    "inner join user on user.id = review.user_id " +
                    "where review.id = ?;";

    private static final String FIND_REVIEW_BY_EMAIL =
            "select review.message as message, user.name as name from review " +
                    "inner join user on user.id = review.user_id " +
                    "where user.email = ?;";

    private static final String UPDATE_REVIEW =
            "UPDATE review SET message=?  WHERE review.id=?;";

    private static final String SELECT_USER_FROM_REVIEW_TABLE = "SELECT user_id FROM review WHERE review.id=?;";

    private static final String DELETE_REVIEW_BY_ID = "DELETE FROM review WHERE id=?;";

    @Override
    public void createReview(Review review) throws DaoException {

        try (ProxyConnection connection = ConnectionPool.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(CREATE_REVIEW)) {

            statement.setLong(1, review.getUserId());
            statement.setString(2, review.getMessage());
            statement.executeUpdate();
        } catch (SQLException | PoolException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public List<ReviewDto> findAllReviews() throws DaoException {
        try (Connection connection = ConnectionPool.getInstance().getConnection();
             Statement statement = connection.createStatement()) {

            List<ReviewDto> reviews;
            try (ResultSet resultSet = statement.executeQuery(FIND_ALL_REVIEW)) {
                reviews = new ArrayList<>();
                while (resultSet.next()) {
                    reviews.add(createReviewFromResult(resultSet));
                }
            }
            return reviews;
        } catch (SQLException | PoolException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public Optional<ReviewDto> findReviewById(long id) throws DaoException {
        try (Connection connection = ConnectionPool.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_REVIEW_BY_ID)) {

            statement.setLong(1, id);
            Optional<ReviewDto> reviewOptional = Optional.empty();
            ;
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    reviewOptional = Optional.of(createReviewFromResult(resultSet));
                }
            }
            return reviewOptional;
        } catch (SQLException | PoolException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public Optional<ReviewDto> findReviewByEmail(String email) throws DaoException {
        try (Connection connection = ConnectionPool.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(FIND_REVIEW_BY_EMAIL)) {

            statement.setString(1, email);
            Optional<ReviewDto> reviewOptional = Optional.empty();
            ;
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    reviewOptional = Optional.of(createReviewFromResult(resultSet));
                }
            }
            return reviewOptional;
        } catch (SQLException | PoolException e) {
            throw new DaoException(e);
        }
    }

    @Override
    public void updateReview(Review review) throws DaoException {
//        User user = createUserFromReview(review);
//        new UserDaoImpl().updateUser(user);
//        try (ProxyConnection connection = ConnectionPool.getInstance().getConnection();
//             PreparedStatement statement = connection.prepareStatement(UPDATE_REVIEW)) {
//
//            statement.setString(1, review.getMessage());
//            statement.setLong(2, review.getId());
//            statement.executeUpdate();
//        } catch (SQLException | PoolException e) {
//            throw new DaoException(e);
//        }
    }

    @Override
    public void deleteReviewById(long id) throws DaoException {
        User user = new ClientDaoImpl().selectUserFromClientTable(id, SELECT_USER_FROM_REVIEW_TABLE);
        new UserDaoImpl().deleteUserById(user.getId());
        try (ProxyConnection connection = ConnectionPool.getInstance().getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_REVIEW_BY_ID)) {

            statement.setLong(1, id);
            statement.executeUpdate();
        } catch (SQLException | PoolException e) {
            throw new DaoException(e);
        }
    }

    //from db to entity
    private ReviewDto createReviewFromResult(ResultSet resultSet) throws SQLException {
        String message = resultSet.getString("message");
        String userName = resultSet.getString("name");

        return new ReviewDto(userName, message);
    }
}
