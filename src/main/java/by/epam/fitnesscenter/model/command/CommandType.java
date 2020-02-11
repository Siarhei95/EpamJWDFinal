package by.epam.fitnesscenter.model.command;


import by.epam.fitnesscenter.model.command.impl.*;
import by.epam.fitnesscenter.model.service.*;


public enum CommandType {
    ADMIN_BLOCK_USER(new AdminBlockUserCommand(new UserService())),
    ADMIN_SHOW_INFO(new AdminShowInfoCommand(new ClientService(), new TrainerService())),
    CLIENT_CABINET(new ClientCabinetCommand(new ClientService(), new OrderService())),
    CLIENT_UPDATE(new ClientUpdateCommand(new ClientService())),
    LOCALE(new LocaleCommand(new UserService())),
    LOGIN(new LoginCommand(new UserService(), new ClientService(), new TrainerService())),
    LOGOUT(new LogoutCommand()),
    ORDER(new OrderCommand(new ClientService(), new TrainerService(), new OrderService())),
    ORDER_PAYMENT(new OrderPaymentCommand(new ClientService(), new OrderService())),
    REGISTRATION(new RegistrationCommand()),
    REGISTRATION_REVIEW(new RegistrationReviewCommand(new ReviewService())),
    SHOW_REVIEW_LIST(new ShowReviewListCommand(new ReviewService())),
    SHOW_TRAINER_LIST(new ShowTrainerListCommand(new TrainerService())),
    TRAINER_CABINET(new TrainerCabinetCommand(new ClientService(), new OrderService())),
    TRAINER_UPDATE(new TrainerUpdateCommand(new TrainerService()));

    private Command command;

    CommandType(Command command) {
        this.command = command;
    }

    public Command getCommand() {
        return command;
    }
}
