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
@Table(name = "exchange_rate_history", schema = "sv_game")
public class ExchangeRateHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "history_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "exchange_rate", nullable = false, precision = 16, scale = 4)
    private BigDecimal exchangeRate;

    @NotNull
    @Column(name = "record_time", nullable = false)
    private OffsetDateTime recordTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "currency_id_currencies")
    private Currency currencyIdCurrencies;

}