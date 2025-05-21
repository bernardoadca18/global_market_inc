package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_nft_holdings", schema = "sv_game")
public class PlayerNftHolding {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "holding_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "acquisition_date", nullable = false)
    private OffsetDateTime acquisitionDate;

    @NotNull
    @Column(name = "acquisition_price", nullable = false, precision = 32, scale = 2)
    private BigDecimal acquisitionPrice;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_listed_for_sale", nullable = false)
    private Boolean isListedForSale = false;

    @Column(name = "listing_price", precision = 32, scale = 2)
    private BigDecimal listingPrice;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "nft_id_nfts")
    private Nft nftIdNfts;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}