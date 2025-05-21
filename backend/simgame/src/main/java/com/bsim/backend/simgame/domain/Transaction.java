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
@Table(name = "transactions", schema = "sv_game")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "transaction_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "type", nullable = false, length = 100)
    private String type;

    @NotNull
    @Column(name = "amount", nullable = false, precision = 32, scale = 2)
    private BigDecimal amount;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @NotNull
    @Column(name = "transaction_date", nullable = false)
    private OffsetDateTime transactionDate;

    @Column(name = "related_entity_id")
    private UUID relatedEntityId;

    @Size(max = 255)
    @Column(name = "related_entity_type")
    private String relatedEntityType;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "currency_id_currencies")
    private Currency currencyIdCurrencies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "account_id_player_bank_accounts")
    private PlayerBankAccount accountIdPlayerBankAccounts;

}