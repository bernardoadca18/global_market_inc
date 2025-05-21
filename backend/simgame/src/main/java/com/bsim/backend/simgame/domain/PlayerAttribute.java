package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.OffsetDateTime;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_attributes", schema = "sv_game")
public class PlayerAttribute {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "attribute_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "strength", nullable = false)
    private Integer strength;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "intelligence", nullable = false)
    private Integer intelligence;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "charisma", nullable = false)
    private Integer charisma;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "luck", nullable = false)
    private Integer luck;

    @NotNull
    @Column(name = "last_updated_time", nullable = false)
    private OffsetDateTime lastUpdatedTime;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}