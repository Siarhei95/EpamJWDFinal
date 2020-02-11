package by.epam.fitnesscenter.model.dao;

import by.epam.fitnesscenter.model.dto.ReviewDto;
import by.epam.fitnesscenter.model.entity.Review;
import by.epam.fitnesscenter.model.entity.Trainer;
import by.epam.fitnesscenter.model.exception.DaoException;

import java.util.List;
import java.util.Optional;

/**
 * The Interface ReviewDao.
 */
public interface ReviewDao {

    /**
     * Creates the review.
     *
     * @param review the review
     * @throws DaoException the dao exception
     */
    void createReview(Review review) throws DaoException;

    /**
     * Finds all trainers.
     *
     * @return the list of trainers
     * @throws DaoException the dao exception
     */
    List<ReviewDto> findAllReviews() throws DaoException;

    /**
     * Finds trainer by id.
     *
     * @param id the id of trainer
     * @return the optional trainer
     * @throws DaoException the dao exception
     */
    Optional<ReviewDto> findReviewById(long id) throws DaoException;

    /**
     * Finds trainer by email.
     *
     * @param email the email of trainer
     * @return the optional trainer
     * @throws DaoException the dao exception
     */
    Optional<ReviewDto> findReviewByEmail(String email) throws DaoException;

    /**
     * Updates trainer.
     *
     * @param review the trainer
     * @throws DaoException the dao exception
     */
    void updateReview(Review review) throws DaoException;

    /**
     * Deletes trainer by id. (deprecated)
     *
     * @param id the id of trainer
     * @throws DaoException the dao exception
     */
    void deleteReviewById(long id) throws DaoException;
}
