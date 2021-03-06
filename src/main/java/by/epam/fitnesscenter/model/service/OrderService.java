package by.epam.fitnesscenter.model.service;

import by.epam.fitnesscenter.model.dao.ClientDao;
import by.epam.fitnesscenter.model.dao.OrderDao;
import by.epam.fitnesscenter.model.dao.ReviewDao;
import by.epam.fitnesscenter.model.dao.TrainerDao;
import by.epam.fitnesscenter.model.dao.impl.ClientDaoImpl;
import by.epam.fitnesscenter.model.dao.impl.OrderDaoImpl;
import by.epam.fitnesscenter.model.dao.impl.TrainerDaoImpl;
import by.epam.fitnesscenter.model.entity.Order;
import by.epam.fitnesscenter.model.entity.Trainer;
import by.epam.fitnesscenter.model.exception.DaoException;
import by.epam.fitnesscenter.model.exception.LogicException;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.util.List;
import java.util.Optional;

public class OrderService {

    private static final Logger LOG = LogManager.getLogger();
    private OrderDao orderDAO = new OrderDaoImpl();

    public void createOrder(Order order) throws LogicException {
        try {
            orderDAO.createOrder(order);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public List<Order> findAllOrders() throws LogicException {
        try {
            return orderDAO.findAllOrders();
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public List<Order> findAllOrdersByIdTrainer(long id) throws LogicException {
        try {
            return orderDAO.findAllOrdersByIdTrainer(id);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public Order findOrderById(Long id) throws LogicException {
        try {
            return orderDAO.findOrderById(id).get();
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public void updateOrder(Order order) throws LogicException {
        try {
            orderDAO.updateOrder(order);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public void deleteOrderById(long id) throws LogicException {
        try {
            orderDAO.deleteOrderById(id);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public void payOrderWithDiscount(Order order, double discount) throws LogicException {
        ClientDao clientDAO = new ClientDaoImpl();
        try {
            long idClient = order.getIdClient();
            orderDAO.payOrder(order);
            clientDAO.updateDiscount(idClient, discount);
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }

    public double calculatePriceByIdOrder(long idOrder) throws LogicException {
        TrainerDao trainerDAO = new TrainerDaoImpl();
        try {
            Order order = findOrderById(idOrder);
            int numberOfWorkout = order.getNumberOfWorkout();

            long idTrainer = order.getIdTrainer();
            Optional<Trainer> trainer = trainerDAO.findTrainerById(idTrainer);
            double costPerOneWorkout = trainer.map(Trainer::getCostPerOneWorkout).orElse(10.0);
            LOG.debug("Cost per one workout (trainer) - " + trainer);

            return numberOfWorkout * costPerOneWorkout;
        } catch (DaoException e) {
            throw new LogicException(e);
        }
    }
}
