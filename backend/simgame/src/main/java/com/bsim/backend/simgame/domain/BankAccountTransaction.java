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
@Table(name = "bank_account_transactions", schema = "sv_game")
public class BankAccountTransaction {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "bank_transaction_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "transaction_type", nullable = false, length = 100)
    private String transactionType;

    @NotNull
    @Column(name = "amount", nullable = false, precision = 32, scale = 2)
    private BigDecimal amount;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @NotNull
    @Column(name = "transaction_date", nullable = false)
    private OffsetDateTime transactionDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "account_id_player_bank_accounts")
    private PlayerBankAccount accountIdPlayerBankAccounts;

}