package by.epam.fitnesscenter.model.manager;

import java.util.Locale;
import java.util.ResourceBundle;

public enum LocaleType {
    EN(ResourceBundle.getBundle("messages", new Locale("en", "US"))),
    BE(ResourceBundle.getBundle("messages", new Locale("be", "BY"))),
    DE(ResourceBundle.getBundle("messages", new Locale("de", "DE"))),
    RU(ResourceBundle.getBundle("messages", new Locale("ru", "RU")));

    private ResourceBundle bundle;

    LocaleType(ResourceBundle bundle) {
        this.bundle = bundle;
    }

    public String getProperty(String key) {
        return bundle.getString(key);
    }
}
