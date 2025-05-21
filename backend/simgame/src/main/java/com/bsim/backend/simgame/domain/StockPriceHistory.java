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
@Table(name = "stock_price_history", schema = "sv_game")
public class StockPriceHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "history_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "record_time", nullable = false)
    private OffsetDateTime recordTime;

    @NotNull
    @Column(name = "price", nullable = false, precision = 16, scale = 2)
    private BigDecimal price;

    @NotNull
    @Column(name = "volume", nullable = false)
    private Long volume;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "stock_id_stocks")
    private Stock stockIdStocks;

}