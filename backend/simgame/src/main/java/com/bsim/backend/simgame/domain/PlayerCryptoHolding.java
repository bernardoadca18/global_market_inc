package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_crypto_holdings", schema = "sv_game")
public class PlayerCryptoHolding {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "holding_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "amount", nullable = false, precision = 24, scale = 8)
    private BigDecimal amount;

    @NotNull
    @Column(name = "average_purchase_price", nullable = false, precision = 16, scale = 2)
    private BigDecimal averagePurchasePrice;

    @NotNull
    @Column(name = "last_updated_time", nullable = false)
    private OffsetDateTime lastUpdatedTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "crypto_id_cryptocurrencies")
    private Cryptocurrency cryptoIdCryptocurrencies;

}