package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "stock_markets", schema = "sv_game")
public class StockMarket {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "market_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "opening_time", nullable = false)
    private LocalTime openingTime;

    @NotNull
    @Column(name = "closing_time", nullable = false)
    private LocalTime closingTime;

    @OneToMany(mappedBy = "marketIdStockMarkets")
    private Set<Stock> stocks = new LinkedHashSet<>();

}