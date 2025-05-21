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
@Table(name = "cryptocurrencies", schema = "sv_game")
public class Cryptocurrency {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "crypto_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 10)
    @NotNull
    @Column(name = "symbol", nullable = false, length = 10)
    private String symbol;

    @NotNull
    @Column(name = "current_price", nullable = false, precision = 16, scale = 2)
    private BigDecimal currentPrice;

    @NotNull
    @Column(name = "volatility", nullable = false, precision = 5, scale = 2)
    private BigDecimal volatility;

    @Column(name = "supply_limit")
    private Long supplyLimit;

    @NotNull
    @Column(name = "circulating_supply", nullable = false)
    private Long circulatingSupply;

    @NotNull
    @Column(name = "mining_difficulty", nullable = false, precision = 16, scale = 2)
    private BigDecimal miningDifficulty;

    @OneToMany(mappedBy = "cryptoIdCryptocurrencies")
    private Set<CryptoPriceHistory> cryptoPriceHistories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "cryptoIdCryptocurrencies")
    private Set<PlayerCryptoHolding> playerCryptoHoldings = new LinkedHashSet<>();

}