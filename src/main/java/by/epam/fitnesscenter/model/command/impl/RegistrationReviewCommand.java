package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.entity.Review;
import by.epam.fitnesscenter.model.exception.CommandException;
import by.epam.fitnesscenter.model.exception.LogicException;
import by.epam.fitnesscenter.model.manager.ConfigurationManager;
import by.epam.fitnesscenter.model.service.ReviewService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.*;

public class RegistrationReviewCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private ReviewService reviewService;

    public RegistrationReviewCommand(ReviewService reviewService) {
        this.reviewService = reviewService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) throws CommandException {

        String id = request.getParameter(ID);
        String message = request.getParameter(MESSAGE);
        Review review = new Review(Long.parseLong(id), message);
        String page;
        try {
            reviewService.createReview(review);
            request.getSession().setAttribute(REVIEW, review);
            LOG.info("List of reviews was shown.");
        } catch (LogicException e) {
            throw new CommandException(e.getMessage(), e);
        }

        page = ConfigurationManager.getProperty("path.page.reg.rev");
        return new CommandRouter(CommandRouter.DispatchType.REDIRECT, page);
    }
}
