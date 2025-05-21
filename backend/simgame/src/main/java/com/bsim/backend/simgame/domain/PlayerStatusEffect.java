package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.type.SqlTypes;

import java.time.OffsetDateTime;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_status_effects", schema = "sv_game")
public class PlayerStatusEffect {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "effect_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "type", nullable = false, length = 100)
    private String type;

    @NotNull
    @Column(name = "start_time", nullable = false)
    private OffsetDateTime startTime;

    @Column(name = "end_time")
    private OffsetDateTime endTime;

    @NotNull
    @Column(name = "modifier_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> modifierData;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}