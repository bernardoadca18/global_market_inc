package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_inventory", schema = "sv_game")
public class PlayerInventory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "inventory_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "quantity", nullable = false)
    private Integer quantity;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "equipped", nullable = false)
    private Boolean equipped = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "item_id_items")
    private Item itemIdItems;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}