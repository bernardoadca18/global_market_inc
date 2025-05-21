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
@Table(name = "player_skills", schema = "sv_game")
public class PlayerSkill {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "player_skill_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "level", nullable = false)
    private Integer level;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "xp", nullable = false)
    private Integer xp;

    @NotNull
    @Column(name = "last_updated_time", nullable = false)
    private OffsetDateTime lastUpdatedTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "skill_id_skills")
    private Skill skillIdSkills;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}