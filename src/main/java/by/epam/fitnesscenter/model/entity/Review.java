package by.epam.fitnesscenter.model.entity;

import java.util.Objects;

public class Review {
    private long id;
    private long userId;
    private String message;

    public Review() {
    }

    public Review(long userId, String message) {
        this.userId = userId;
        this.message = message;
    }

    public Review(long id, long userId, String message) {
        this.id = id;
        this.userId = userId;
        this.message = message;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Review review = (Review) o;
        return id == review.id &&
                userId == review.userId &&
                Objects.equals(message, review.message);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, userId, message);
    }

    @Override
    public String toString() {
        return "Review{" +
                "id=" + id +
                ", userId=" + userId +
                ", message='" + message + '\'' +
                '}';
    }
}
