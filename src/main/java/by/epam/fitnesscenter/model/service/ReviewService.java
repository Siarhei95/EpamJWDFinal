package by.epam.fitnesscenter.model.service;

import by.epam.fitnesscenter.model.dao.ReviewDao;
import by.epam.fitnesscenter.model.dao.TrainerDao;
import by.epam.fitnesscenter.model.dao.impl.ReviewDaoImpl;
import by.epam.fitnesscenter.model.dao.impl.TrainerDaoImpl;
import by.epam.fitnesscenter.model.dto.ReviewDto;
import by.epam.fitnesscenter.model.entity.Review;
import by.epam.fitnesscenter.model.entity.Trainer;
import by.epam.fitnesscenter.model.exception.DaoException;
import by.epam.fitnesscenter.model.exception.LogicException;
import by.epam.fitnesscenter.model.util.MD5;

import java.util.List;

public class ReviewService {

    private ReviewDao reviewDAO = new ReviewDaoImpl();

    public void createReview(Review review) throws LogicException {
        try {
            reviewDAO.createReview(review);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public List<ReviewDto> findAllReviews() throws LogicException {
        try {
            return reviewDAO.findAllReviews();
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public void updateReview(Review review) throws LogicException {
        try {
            reviewDAO.updateReview(review);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public void deleteReviewById(long id) throws LogicException {
        try {
            reviewDAO.deleteReviewById(id);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }
}