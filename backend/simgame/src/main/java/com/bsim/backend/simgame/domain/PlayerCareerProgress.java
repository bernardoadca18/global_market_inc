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
@Table(name = "player_career_progress", schema = "sv_game")
public class PlayerCareerProgress {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "progress_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "level", nullable = false)
    private Integer level;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "xp_in_path", nullable = false)
    private Integer xpInPath;

    @NotNull
    @Column(name = "last_level_up_date", nullable = false)
    private OffsetDateTime lastLevelUpDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "path_id_career_paths")
    private CareerPath pathIdCareerPaths;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}