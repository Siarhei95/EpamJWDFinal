package by.epam.fitnesscenter.model.command;

import by.epam.fitnesscenter.model.exception.CommandException;

import javax.servlet.http.HttpServletRequest;

public interface Command {
    CommandRouter execute(HttpServletRequest request) throws CommandException;
}
