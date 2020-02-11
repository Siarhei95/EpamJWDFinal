package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.dto.ReviewDto;
import by.epam.fitnesscenter.model.entity.Review;
import by.epam.fitnesscenter.model.exception.CommandException;
import by.epam.fitnesscenter.model.exception.LogicException;
import by.epam.fitnesscenter.model.manager.ConfigurationManager;
import by.epam.fitnesscenter.model.service.ReviewService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.REVIEW;

public class ShowReviewListCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private ReviewService reviewService;

    public ShowReviewListCommand(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) throws CommandException {

        String page;
        try {
            List<ReviewDto> reviews = reviewService.findAllReviews();
            request.getSession().setAttribute(REVIEW, reviews);
            LOG.info("List of reviews was shown.");
        } catch (LogicException e) {
            throw new CommandException(e.getMessage(), e);
        }

        page = ConfigurationManager.getProperty("path.page.showreviewlist");
        return new CommandRouter(CommandRouter.DispatchType.REDIRECT, page);
    }
}
