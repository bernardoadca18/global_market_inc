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
@Table(name = "bets", schema = "sv_game")
public class Bet {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "bet_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "type", nullable = false, length = 100)
    private String type;

    @NotNull
    @Column(name = "amount_bet", nullable = false, precision = 16, scale = 2)
    private BigDecimal amountBet;

    @NotNull
    @Column(name = "outcome_amount", nullable = false, precision = 16, scale = 2)
    private BigDecimal outcomeAmount;

    @NotNull
    @Column(name = "bet_date", nullable = false)
    private OffsetDateTime betDate;

    @NotNull
    @Column(name = "details", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> details;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "debt_id_debts")
    private Debt debtIdDebts;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "cockfight_id_cockfights")
    private Cockfight cockfightIdCockfights;

}