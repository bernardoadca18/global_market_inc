package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "currencies", schema = "sv_game")
public class Currency {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "currency_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 10)
    @NotNull
    @Column(name = "symbol", nullable = false, length = 10)
    private String symbol;

    @Size(max = 3)
    @NotNull
    @Column(name = "iso_code", nullable = false, length = 3)
    private String isoCode;

    @NotNull
    @Column(name = "exchange_rate_to_base_currency", nullable = false, precision = 16, scale = 2)
    private BigDecimal exchangeRateToBaseCurrency;

    @NotNull
    @Column(name = "volatility", nullable = false, precision = 5, scale = 2)
    private BigDecimal volatility;

    @OneToMany(mappedBy = "currencyIdCurrencies")
    private Set<Country> countries = new LinkedHashSet<>();

    @OneToMany(mappedBy = "currencyIdCurrencies")
    private Set<ExchangeRateHistory> exchangeRateHistories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "currencyIdCurrencies")
    private Set<PlayerBankAccount> playerBankAccounts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "currencyIdCurrencies")
    private Set<PlayerCurrencyHolding> playerCurrencyHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "currencyIdCurrencies")
    private Set<Transaction> transactions = new LinkedHashSet<>();

}