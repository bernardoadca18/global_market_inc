package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "roosters", schema = "sv_game")
public class Rooster {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "rooster_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "age_days", nullable = false)
    private Integer ageDays;

    @NotNull
    @Column(name = "strength", nullable = false)
    private Integer strength;

    @NotNull
    @Column(name = "speed", nullable = false)
    private Integer speed;

    @NotNull
    @Column(name = "aggression", nullable = false)
    private Integer aggression;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "health", nullable = false)
    private Integer health;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Available'")
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "win_count", nullable = false)
    private Integer winCount;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "loss_count", nullable = false)
    private Integer lossCount;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "draw_count", nullable = false)
    private Integer drawCount;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "kill_count", nullable = false)
    private Integer killCount;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_deceased", nullable = false)
    private Boolean isDeceased = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "npc_id_npcs")
    private Npc npcIdNpcs;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "plot_id_plots")
    private Plot plotIdPlots;

    @OneToMany(mappedBy = "roosterIdRoosters")
    private Set<Cockfight> cockfights_home = new LinkedHashSet<>();

    @OneToMany(mappedBy = "roosterIdRoosters1")
    private Set<Cockfight> cockfights_away = new LinkedHashSet<>();

}