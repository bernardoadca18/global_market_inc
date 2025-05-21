package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
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
@Table(name = "debts", schema = "sv_game")
public class Debt {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "debt_id", nullable = false)
    private UUID id;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Loan'")
    @Column(name = "debt_type", nullable = false, length = 50)
    private String debtType;

    @NotNull
    @Column(name = "original_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal originalValue;

    @Column(name = "current_debt", precision = 32, scale = 2)
    private BigDecimal currentDebt;

    @NotNull
    @Column(name = "interest_rate", nullable = false, precision = 5, scale = 4)
    private BigDecimal interestRate;

    @NotNull
    @Column(name = "start_date", nullable = false)
    private OffsetDateTime startDate;

    @NotNull
    @Column(name = "end_date", nullable = false)
    private OffsetDateTime endDate;

    @Size(max = 50)
    @NotNull
    @Column(name = "payment_frequency", nullable = false, length = 50)
    private String paymentFrequency;

    @Column(name = "next_payment_date")
    private OffsetDateTime nextPaymentDate;

    @Column(name = "minimum_next_payment_amount", precision = 32, scale = 2)
    private BigDecimal minimumNextPaymentAmount;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Active'")
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player lender_playerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players1")
    private Player borrower_playerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players2")
    private Player current_owner_playerId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies")
    private Company lender_companyId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies1")
    private Company borrower_companyId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies2")
    private Company current_owner_companyId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "npc_id_npcs")
    private Npc lender_npcId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "npc_id_npcs1")
    private Npc current_owner_npcId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "bank_id_banks")
    private Bank lender_bankId;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "bank_id_banks1")
    private Bank current_owner_bankId;

    @OneToMany(mappedBy = "debtIdDebts")
    private Set<Bet> bets = new LinkedHashSet<>();

    @OneToMany(mappedBy = "debtIdDebts")
    private Set<DebtCollateral> debtCollaterals = new LinkedHashSet<>();

}