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
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_npc_relationships", schema = "sv_game")
public class PlayerNpcRelationship {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "relationship_id", nullable = false)
    private UUID id;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Neutral'")
    @Column(name = "relationship_type", nullable = false, length = 50)
    private String relationshipType;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "level", nullable = false)
    private Integer level;

    @Column(name = "last_interaction_date")
    private OffsetDateTime lastInteractionDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "npc_id_npcs")
    private Npc npcIdNpcs;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}