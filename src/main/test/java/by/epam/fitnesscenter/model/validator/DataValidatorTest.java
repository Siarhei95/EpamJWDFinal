package by.epam.fitnesscenter.model.validator;

import org.testng.annotations.Test;

import java.util.regex.Pattern;

import static org.testng.Assert.*;

public class DataValidatorTest {
    private static final String NAME_REGEX = "^([A-Z][a-z]{2,20})|([А-Я][а-я]{2,20})$";
    private static final String SURNAME_REGEX = "^([A-Z][a-z]{2,30})|([А-Я][а-я]{2,30})$";
    private static final String EMAIL_REGEX = "^([a-z0-9_.-]+)@([a-z0-9_.-]+)\\.([a-z]{2,5})$";
    private static final String PASSWORD_REGEX = "^([A-Za-z0-9_-]{8,40})$";
    private static final String USER_YEARS_OLD_REGEX = "^([1-9][0-9]?)$";

    @Test
    public void isNameCorrect() {
        String username = "Sergei";
        boolean actual = Pattern.matches(NAME_REGEX, username);
        assertTrue(actual);
    }

    @Test
    public void isNameNotCorrect() {
        String username = "S";
        boolean actual = Pattern.matches(NAME_REGEX, username);
        assertFalse(actual);
    }

    @Test
    public void isSurnameCorrect() {
        String username = "Pashkouski";
        boolean actual = Pattern.matches(SURNAME_REGEX, username);
        assertTrue(actual);
    }

    @Test
    public void isSurnameNotCorrect() {
        String username = "P";
        boolean actual = Pattern.matches(SURNAME_REGEX, username);
        assertFalse(actual);
    }

    @Test
    public void isEmailCorrect() {
        String example = "pashkouski@mail.ru";
        boolean actual = Pattern.matches(EMAIL_REGEX, example);
        assertTrue(actual);
    }

    @Test
    public void isEmailNotCorrect() {
        String example = "pashkouski.mail.ru";
        boolean actual = Pattern.matches(EMAIL_REGEX, example);
        assertFalse(actual);
    }

    @Test
    public void isPasswordCorrect() {
        String example = "123Ifabip";
        boolean actual = Pattern.matches(PASSWORD_REGEX, example);
        assertTrue(actual);
    }

    @Test
    public void isPasswordNotCorrect() {
        String example = "1234";
        boolean actual = Pattern.matches(PASSWORD_REGEX, example);
        assertFalse(actual);
    }

    @Test
    public void isYearsOldCorrect() {
        long old = 33;
        boolean actual = Pattern.matches(USER_YEARS_OLD_REGEX, String.valueOf(old));
        assertTrue(actual);
    }

    @Test
    public void isYearsOldNotCorrect() {
        long old = 333333;
        boolean actual = Pattern.matches(USER_YEARS_OLD_REGEX, String.valueOf(old));
        assertFalse(actual);
    }
}