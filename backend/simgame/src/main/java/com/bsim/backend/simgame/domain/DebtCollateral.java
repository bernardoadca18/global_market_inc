package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "debt_collateral", schema = "sv_game")
public class DebtCollateral {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "debt_collateral_id", nullable = false)
    private UUID id;

    @Size(max = 50)
    @NotNull
    @Column(name = "collateral_type", nullable = false, length = 50)
    private String collateralType;

    @NotNull
    @Column(name = "collateral_entity_id", nullable = false)
    private UUID collateralEntityId;

    @NotNull
    @Column(name = "collateral_value_at_loan_time", nullable = false, precision = 32, scale = 2)
    private BigDecimal collateralValueAtLoanTime;

    @NotNull
    @Column(name = "is_currently_held", nullable = false)
    private Boolean isCurrentlyHeld = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "debt_id_debts")
    private Debt debtIdDebts;

}