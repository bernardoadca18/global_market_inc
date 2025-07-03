package com.bsim.backend.simgame.repository;

import java.util.UUID;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import com.bsim.backend.simgame.domain.Game;

public interface GameRepository extends JpaRepository<Game, UUID>, JpaSpecificationExecutor<Game> {

}
