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
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "banks", schema = "sv_game")
public class Bank {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "bank_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @ColumnDefault("500")
    @Column(name = "reputation", nullable = false)
    private Integer reputation;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "deposit_interest_rate", nullable = false, precision = 5, scale = 4)
    private BigDecimal depositInterestRate;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "loan_interest_rate", nullable = false, precision = 5, scale = 4)
    private BigDecimal loanInterestRate;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "transaction_fee_rate", nullable = false, precision = 5, scale = 4)
    private BigDecimal transactionFeeRate;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "monthly_account_fee", nullable = false, precision = 10, scale = 2)
    private BigDecimal monthlyAccountFee;

    @NotNull
    @ColumnDefault("100.00")
    @Column(name = "stability_index", nullable = false, precision = 5, scale = 2)
    private BigDecimal stabilityIndex;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_player_bank", nullable = false)
    private Boolean isPlayerBank = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "country_id_countries")
    private Country countryIdCountries;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @OneToMany
    private Set<Debt> lender_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> current_owner_debts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "bankIdBanks")
    private Set<PlayerBankAccount> playerBankAccounts = new LinkedHashSet<>();

}