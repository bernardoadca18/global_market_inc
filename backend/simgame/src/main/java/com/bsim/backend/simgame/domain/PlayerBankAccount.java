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
@Table(name = "player_bank_accounts", schema = "sv_game")
public class PlayerBankAccount {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "account_id", nullable = false)
    private UUID id;

    @Size(max = 50)
    @NotNull
    @Column(name = "account_number", nullable = false, length = 50)
    private String accountNumber;

    @Size(max = 50)
    @NotNull
    @Column(name = "account_type", nullable = false, length = 50)
    private String accountType;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "balance", nullable = false, precision = 32, scale = 2)
    private BigDecimal balance;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_primary", nullable = false)
    private Boolean isPrimary = false;

    @NotNull
    @Column(name = "created_date", nullable = false)
    private OffsetDateTime createdDate;

    @NotNull
    @Column(name = "last_activity_date", nullable = false)
    private OffsetDateTime lastActivityDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "bank_id_banks")
    private Bank bankIdBanks;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "currency_id_currencies")
    private Currency currencyIdCurrencies;

    @OneToMany(mappedBy = "accountIdPlayerBankAccounts")
    private Set<BankAccountTransaction> bankAccountTransactions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "accountIdPlayerBankAccounts")
    private Set<Transaction> transactions = new LinkedHashSet<>();

}