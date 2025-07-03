package com.bsim.backend.simgame.service;

import java.time.OffsetDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.bsim.backend.simgame.domain.Game;
import com.bsim.backend.simgame.repository.GameRepository;

import jakarta.transaction.Transactional;

@Service
public class GameTimeService {

    private final SimpMessagingTemplate messagingTemplate;
    private final GameRepository gameRepository;
    private static final DateTimeFormatter DATE_TIME_FORMATTER = DateTimeFormatter.ISO_OFFSET_DATE_TIME;
    private static final long GAME_TIME_INCREMENT_UNIT_PER_SECOND = 1;

    @Autowired
    public GameTimeService(SimpMessagingTemplate messagingTemplate, GameRepository gameRepository) {
        this.messagingTemplate = messagingTemplate;
        this.gameRepository = gameRepository;
    }

    @Scheduled(fixedRate = 1000, initialDelay = 1000)
    @Transactional
    public void advanceGameTimeAndNotify() {
        List<Game> activeGames = gameRepository.findAll();

        for (Game game : activeGames) {
            if (game.getCurrentDateTime() == null) {
                game.setCurrentDateTime(OffsetDateTime.now());
            }
        }
    }
}
