package by.epam.fitnesscenter.model.command.impl;

import by.epam.fitnesscenter.model.command.Command;
import by.epam.fitnesscenter.model.command.CommandRouter;
import by.epam.fitnesscenter.model.entity.Client;
import by.epam.fitnesscenter.model.entity.Order;
import by.epam.fitnesscenter.model.entity.Trainer;
import by.epam.fitnesscenter.model.exception.CommandException;
import by.epam.fitnesscenter.model.exception.LogicException;
import by.epam.fitnesscenter.model.manager.ConfigurationManager;
import by.epam.fitnesscenter.model.manager.MessageManager;
import by.epam.fitnesscenter.model.service.ClientService;
import by.epam.fitnesscenter.model.service.OrderService;
import by.epam.fitnesscenter.model.service.TrainerService;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.*;
import static by.epam.fitnesscenter.model.validator.DataValidator.isNumberOfWorkoutCorrect;

public class OrderCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private ClientService clientService;
    private TrainerService trainerService;
    private OrderService orderService;

    public OrderCommand(ClientService clientService, TrainerService trainerService, OrderService orderService) {
        this.clientService = clientService;
        this.trainerService = trainerService;
        this.orderService = orderService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) throws CommandException {
        String page;
        String selectTypeOfWorkout = request.getParameter(SELECT_TYPE_OF_WORKOUT);
        String numberOfWorkout = request.getParameter(NUMBER_OF_WORKOUT);
        String radioSelectTrainer = request.getParameter(RADIO_SELECT_TRAINER);

        if (isNumberOfWorkoutCorrect(numberOfWorkout)) {
            Client client = (Client) request.getSession().getAttribute(CLIENT);
            Order order = new Order();
            try {
                if (radioSelectTrainer != null) {
                    Trainer trainer = trainerService.findTrainerByEmail(radioSelectTrainer);
                    order.setTypeOfWorkout(selectTypeOfWorkout);
                    order.setNumberOfWorkout(Integer.parseInt(numberOfWorkout));
                    order.setIdTrainer(trainer.getId());
                    order.setIdClient(client.getId());
                    order.setPaid(false);
                    orderService.createOrder(order);

                    LOG.info("Create order by " + client.getEmail());
                    request.setAttribute(SUCCESSFUL_ORDER, MessageManager.getProperty("messages.orderdone"));

                    List<Order> orders = clientService.findAllOrderByIdClients(client.getId());
                    request.getSession().setAttribute(ORDERS, orders);
                } else {
                    request.setAttribute(SELECT_TRAINER_RADIO, MessageManager.getProperty("messages.selectTrainerRadio"));
                }
            } catch (LogicException e) {
                throw new CommandException(e.getMessage(), e);
            }
        } else {
            LOG.info("Data isn't correct.");
            request.setAttribute(DATA_IS_NOT_CORRECT, MessageManager.getProperty("message.dataIsNotCorrect"));
            page = ConfigurationManager.getProperty("path.page.client.order");
            return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
        }
        page = ConfigurationManager.getProperty("path.page.client.order");
        return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
    }
}