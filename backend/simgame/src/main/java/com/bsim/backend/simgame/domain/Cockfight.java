package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.OffsetDateTime;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "cockfights", schema = "sv_game")
public class Cockfight {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "cockfight_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "date_time", nullable = false)
    private OffsetDateTime dateTime;

    @Size(max = 50)
    @Column(name = "outcome", length = 50)
    private String outcome;

    @Column(name = "loser_died")
    private Boolean loserDied;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Scheduled'")
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "building_id_buildings")
    private Building buildingIdBuildings;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "rooster_id_roosters")
    private Rooster roosterIdRoosters;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "rooster_id_roosters1")
    private Rooster roosterIdRoosters1;

    @OneToMany(mappedBy = "cockfightIdCockfights")
    private Set<Bet> bets = new LinkedHashSet<>();

}