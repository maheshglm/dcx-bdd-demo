package com.dcx.app.utils;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ThreadUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(ThreadUtils.class);

    public void sleep(int seconds) {
        try {
            LOGGER.debug("Sleeping {} seconds", seconds);
            Thread.sleep(seconds*1000L);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }

    public void debug() {
        System.out.println("pause");
    }
}
