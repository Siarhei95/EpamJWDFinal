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
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

import static by.epam.fitnesscenter.model.constant.ConstantNameFromJsp.*;
import static by.epam.fitnesscenter.model.validator.DataValidator.isDescriptionCorrect;
import static by.epam.fitnesscenter.model.validator.DataValidator.isEquipmentCorrect;

public class TrainerCabinetCommand implements Command {
    private static final Logger LOG = LogManager.getLogger();

    private ClientService clientService;
    private OrderService orderService;

    public TrainerCabinetCommand(ClientService clientService, OrderService orderService) {
        this.clientService = clientService;
        this.orderService = orderService;
    }

    @Override
    public CommandRouter execute(HttpServletRequest request) throws CommandException {
        Trainer trainer = (Trainer) request.getSession().getAttribute(TRAINER);
        String radioSelectOrder = request.getParameter(SELECT_ORDER);
        String actionUpdateOrder = request.getParameter(UPDATE_ORDER);

        String page;
        try {
            if (radioSelectOrder != null) {
                if (actionUpdateOrder != null) {
                    Order order = orderService.findOrderById(Long.parseLong(radioSelectOrder));
                    if (order.getIdTrainer() == trainer.getId()) {
                        if (!order.isPaid()) {
                            String equipment = request.getParameter(EQUIPMENT);
                            String description = request.getParameter(DESCRIPTION);

                            if (isEquipmentCorrect(equipment) && isDescriptionCorrect(description)) {
                                order.setEquipment(equipment);
                                order.setDescription(description);
                                orderService.updateOrder(order);

                                LOG.info("Trainer " + trainer.getEmail() + " update order with id " + order.getId());

                                List<Client> newClients = clientService.findAllClientsByIdTrainer(trainer.getId());
                                for (Client client : newClients) {
                                    List<Order> ordersOfClient = clientService.findAllOrderByIdClients(client.getId());
                                    client.setOrderList(ordersOfClient);
                                }
                                request.getSession().setAttribute(CLIENTS, newClients);
                            } else {
                                request.setAttribute(
                                        DATA_IS_NOT_CORRECT, MessageManager.getProperty("message.dataIsNotCorrect"));
                            }
                            page = ConfigurationManager.getProperty("path.page.trainer.cabinet");
                            return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
                        } else {
                            request.setAttribute(
                                    CANNOT_CHANGE_PAID_ORDER, MessageManager.getProperty("messages.cannotChangePaidOrder"));
                            page = ConfigurationManager.getProperty("path.page.trainer.cabinet");
                            return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
                        }
                    } else {
                        request.setAttribute(CANNOT_CHANGE_ORDER_OF_ANOTHER_TRAINER,
                                MessageManager.getProperty("messages.cannotChangeOrderOfAnotherTrainer"));
                        page = ConfigurationManager.getProperty("path.page.trainer.cabinet");
                        return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
                    }
                }
            } else {
                request.setAttribute(SELECT_WORKOUT_RADIO, MessageManager.getProperty("messages.selectWorkoutRadio"));
                page = ConfigurationManager.getProperty("path.page.trainer.cabinet");
                return new CommandRouter(CommandRouter.DispatchType.FORWARD, page);
            }
        } catch (LogicException e) {
            throw new CommandException(e.getMessage(), e);
        }

        page = ConfigurationManager.getProperty("path.page.trainer.cabinet");
        return new CommandRouter(CommandRouter.DispatchType.REDIRECT, page);
    }
}