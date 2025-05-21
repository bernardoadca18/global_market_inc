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

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "nfts", schema = "sv_game")
public class Nft {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "nft_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @Column(name = "contract_address")
    private String contractAddress;

    @Size(max = 255)
    @Column(name = "token_id")
    private String tokenId;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Column(name = "description", length = Integer.MAX_VALUE)
    private String description;

    @Size(max = 255)
    @Column(name = "image_path")
    private String imagePath;

    @Column(name = "generation_params")
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> generationParams;

    @NotNull
    @Column(name = "creation_date", nullable = false)
    private OffsetDateTime creationDate;

    @NotNull
    @Column(name = "initial_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal initialValue;

    @NotNull
    @Column(name = "current_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal currentValue;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "npc_id_npcs")
    private Npc npcIdNpcs;

    @OneToOne(mappedBy = "nftIdNfts")
    private PlayerNftHolding playerNftHolding;

}