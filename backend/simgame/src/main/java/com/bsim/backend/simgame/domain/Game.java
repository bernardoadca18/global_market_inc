package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "games", schema = "sv_game")
public class Game {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "game_id", nullable = false)
    private UUID id;

    @Column(name = "current_date_time")
    private OffsetDateTime currentDateTime;

    @NotNull
    @ColumnDefault("1.0")
    @Column(name = "game_speed_multiplier", nullable = false, precision = 3, scale = 1)
    private BigDecimal gameSpeedMultiplier;

    @Column(name = "last_save_time")
    private OffsetDateTime lastSaveTime;

    @Size(max = 255)
    @NotNull
    @Column(name = "game_name", nullable = false)
    private String gameName;

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Cockfight> cockfights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Debt> debts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Garage> garages = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<NewsEvent> newsEvents = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Nft> nfts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Npc> npcs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Player> players = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Rooster> roosters = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

    @OneToMany(mappedBy = "gameIdGames")
    private Set<Vehicletype> vehicletypes = new LinkedHashSet<>();

}