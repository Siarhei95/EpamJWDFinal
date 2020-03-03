package by.epam.fitnesscenter.model.tag;

import by.epam.fitnesscenter.model.entity.User;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;
import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

@SuppressWarnings("serial")
public class HelloUserTag extends TagSupport {
    private static final String CHANGE_LANGUAGE = "changeLanguage";
    private static final String LOCALE = "locale";
    private static final String ADMIN_ROLE = "admin";
    private static final String TRAINER_ROLE = "trainer";
    private static final String EN_US = "en_US";
    private static final String RU_ru = "ru_RU";
    private static final String BY_BE = "be_BY";
    private static final String DE_DE = "de_DE";

    private User user;

    public void setUser(User user) {
        this.user = user;
    }

    @Override
    public int doStartTag() throws JspException {
        String locale = (String) pageContext.getSession().getAttribute(CHANGE_LANGUAGE);
        Locale current;
        if (EN_US.equals(locale)) {
            current = new Locale("en", "US");
        }else if (RU_ru.equals(locale)) {
            current = new Locale("ru", "RU");
        }else if (BY_BE.equals(locale)) {
            current = new Locale("be", "BY");
        }else
            current = new Locale("de", "DE");


        ResourceBundle bundle = ResourceBundle.getBundle(LOCALE, current);
        StringBuilder buffer = new StringBuilder();
        if (user != null) {
            try {
                buffer.append("<b>").append(user.getName()).append(" ")
                        .append(user.getSurname()).append("</b>").append("<br/>");
                System.out.println(user.getRole());
                if (user.getRole().equals(ADMIN_ROLE)) {
                    buffer.append("<i>").append(bundle.getString("label.userRoleAdmin")).append("</i>");
                } else if (user.getRole().equals(TRAINER_ROLE)) {
                    buffer.append("<i>").append(bundle.getString("label.userRoleTrainer")).append("</i>");
                } else {
                    buffer.append("<i>").append(bundle.getString("label.userRoleClient")).append("</i>");
                }
                pageContext.getOut().write(buffer.toString());
            } catch (IOException e) {
                throw new JspException(e.getMessage());
            }
        }
        return SKIP_BODY;
    }

    @Override
    public int doEndTag() {
        return EVAL_PAGE;
    }
}
