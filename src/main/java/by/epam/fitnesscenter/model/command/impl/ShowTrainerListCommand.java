package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.entity.Trainer;
import by.epam.fitnesscenter.model.exception.CommandException;
import by.epam.fitnesscenter.model.exception.LogicException;
import by.epam.fitnesscenter.model.manager.ConfigurationManager;
import by.epam.fitnesscenter.model.service.TrainerService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.TRAINERS;

public class ShowTrainerListCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private TrainerService trainerService;

    public ShowTrainerListCommand(TrainerService trainerService) {
        this.trainerService = trainerService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) throws CommandException {

        String page;
        try {
            List<Trainer> trainers = trainerService.findAllTrainers();
            request.getSession().setAttribute(TRAINERS, trainers);
            LOG.info("List of trainers was shown.");
        } catch (LogicException e) {
            throw new CommandException(e.getMessage(), e);
        }

        page = ConfigurationManager.getProperty("path.page.showtrainerlist");
        return new CommandRouter(CommandRouter.DispatchType.REDIRECT, page);
    }
}
