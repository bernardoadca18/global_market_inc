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
@Table(name = "player_currency_holdings", schema = "sv_game")
public class PlayerCurrencyHolding {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "holding_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "amount", nullable = false, precision = 32, scale = 2)
    private BigDecimal amount;

    @NotNull
    @Column(name = "last_updated_time", nullable = false)
    private OffsetDateTime lastUpdatedTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "currency_id_currencies")
    private Currency currencyIdCurrencies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}