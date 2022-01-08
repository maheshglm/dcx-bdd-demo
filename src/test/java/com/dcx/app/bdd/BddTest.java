package com.dcx.app.bdd;

import com.intuit.karate.junit5.Karate;

public class BddTest {

    @Karate.Test
    Karate testAll() {
        return Karate.run().relativeTo(getClass());
    }
}
