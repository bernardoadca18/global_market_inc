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
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "player_investments", schema = "sv_game")
public class PlayerInvestment {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "player_investment_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "amount_invested", nullable = false, precision = 32, scale = 2)
    private BigDecimal amountInvested;

    @NotNull
    @Column(name = "investment_date", nullable = false)
    private OffsetDateTime investmentDate;

    @NotNull
    @Column(name = "expected_return_amount", nullable = false, precision = 32, scale = 2)
    private BigDecimal expectedReturnAmount;

    @NotNull
    @Column(name = "actual_return_amount", nullable = false, precision = 32, scale = 2)
    private BigDecimal actualReturnAmount;

    @Size(max = 50)
    @NotNull
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @NotNull
    @Column(name = "completion_date", nullable = false)
    private OffsetDateTime completionDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "opportunity_id_investment_opportunities")
    private InvestmentOpportunity opportunityIdInvestmentOpportunities;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

}