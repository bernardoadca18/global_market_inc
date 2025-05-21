package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.OffsetDateTime;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "stocks", schema = "sv_game")
public class Stock {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "stock_id", nullable = false)
    private UUID id;

    @Size(max = 10)
    @NotNull
    @Column(name = "ticker_symbol", nullable = false, length = 10)
    private String tickerSymbol;

    @NotNull
    @Column(name = "current_price", nullable = false, precision = 16, scale = 2)
    private BigDecimal currentPrice;

    @NotNull
    @Column(name = "shares_outstanding", nullable = false)
    private Long sharesOutstanding;

    @NotNull
    @Column(name = "volatility", nullable = false, precision = 5, scale = 2)
    private BigDecimal volatility;

    @NotNull
    @Column(name = "last_trade_time", nullable = false)
    private OffsetDateTime lastTradeTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "market_id_stock_markets")
    private StockMarket marketIdStockMarkets;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @OneToMany(mappedBy = "stockIdStocks")
    private Set<NpcStockHolding> npcStockHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "stockIdStocks")
    private Set<PlayerStockHolding> playerStockHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "stockIdStocks")
    private Set<StockPriceHistory> stockPriceHistories = new LinkedHashSet<>();

}