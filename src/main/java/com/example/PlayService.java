package com.example;

import javax.inject.Singleton;
import java.util.Arrays;
import java.util.List;
import java.util.Random;

@Singleton
public class PlayService {
    // create list of plays
    private static final List<Play> PLAYS = Arrays.asList(
            new Play("Hello GraalVM Workshop!"),
            new Play("Happy New Year!"),
            new Play("Micronaut & GraalVM"),
            new Play("Java Rules!"),
            new Play("Maven or Gradle?"),
            new Play("GraalVM Rocks!")
    );
    // to choose random play from PLAYS list
    public Play randomPlay() {
        return PLAYS.get(new Random().nextInt(PLAYS.size()));
    }
}