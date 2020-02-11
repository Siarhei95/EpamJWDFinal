package by.epam.fitnesscenter.model.dto;

import java.util.Objects;

public class ReviewDto {
    private String userName;
    private String message;

    public ReviewDto(String userName, String message) {
        this.userName = userName;
        this.message = message;
    }

    public String getUserName() {
        return userName;
    }

    public String getMessage() {
        return message;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        ReviewDto reviewDto = (ReviewDto) o;
        return Objects.equals(userName, reviewDto.userName) &&
                Objects.equals(message, reviewDto.message);
    }

    @Override
    public int hashCode() {
        return Objects.hash(userName, message);
    }

    @Override
    public String toString() {
        return "ReviewDto{" +
                "userName='" + userName + '\'' +
                ", message='" + message + '\'' +
                '}';
    }
}
