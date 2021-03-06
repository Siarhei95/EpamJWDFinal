package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.service.UserService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.*;

public class LocaleCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private UserService userService;

    public LocaleCommand(UserService userService) {
        this.userService = userService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) {
        String locale = request.getParameter(NEW_LOCALE);
        String page = request.getParameter(PAGE_PATH);

        request.getSession().setAttribute(LOCALE, locale);
        CommandRouter commandRouter = new CommandRouter(CommandRouter.DispatchType.REDIRECT, page);

        commandRouter.setDispatchType(CommandRouter.DispatchType.REDIRECT);
        commandRouter.setPage(userService.returnSamePage(page));

        LOG.info("Changing language. Now " + locale);
        return commandRouter;
    }
}
