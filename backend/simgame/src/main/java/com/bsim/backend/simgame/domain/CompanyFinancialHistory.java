package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "company_financial_history", schema = "sv_game")
public class CompanyFinancialHistory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "record_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "record_date", nullable = false)
    private LocalDate recordDate;

    @NotNull
    @Column(name = "revenue", nullable = false, precision = 32, scale = 2)
    private BigDecimal revenue;

    @NotNull
    @Column(name = "expenses", nullable = false, precision = 32, scale = 2)
    private BigDecimal expenses;

    @NotNull
    @Column(name = "profit", nullable = false, precision = 32, scale = 2)
    private BigDecimal profit;

    @NotNull
    @Column(name = "net_worth_snapshot", nullable = false, precision = 32, scale = 2)
    private BigDecimal netWorthSnapshot;

    @NotNull
    @Column(name = "employees_count", nullable = false)
    private Integer employeesCount;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

}