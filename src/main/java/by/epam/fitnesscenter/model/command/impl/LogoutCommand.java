package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.entity.User;
import by.epam.fitnesscenter.model.manager.ConfigurationManager;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.PARAM_CHANGE_LANGUAGE;
import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.USER;

public class LogoutCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    public LogoutCommand() {
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) {
        User user = (User) request.getSession().getAttribute(USER);
        Object locale = request.getSession().getAttribute(PARAM_CHANGE_LANGUAGE);
        String page = ConfigurationManager.getProperty("path.page.login");

        request.getSession().invalidate();
        request.getSession().setAttribute(PARAM_CHANGE_LANGUAGE, locale);
        if (user == null) {
            LOG.info("Empty log out. Nobody log out.");
        } else {
            LOG.info(user.getEmail() + " log out!");
        }
        return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
    }
}
