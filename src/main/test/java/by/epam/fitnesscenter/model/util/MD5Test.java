package by.epam.fitnesscenter.model.util;

import org.testng.annotations.Test;

import static org.testng.Assert.assertEquals;

public class MD5Test {

    @Test
    public void testEncrypt() {

        String actualPassword = MD5.encrypt("administrator");
        assertEquals(actualPassword, "200ceb26807d6bf99fd6f4f0d1ca54d4");
    }
}