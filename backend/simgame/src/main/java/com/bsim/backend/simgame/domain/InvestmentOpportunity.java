package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "investment_opportunities", schema = "sv_game")
public class InvestmentOpportunity {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "opportunity_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @NotNull
    @Column(name = "risk_level", nullable = false, precision = 5, scale = 2)
    private BigDecimal riskLevel;

    @NotNull
    @Column(name = "expected_return_min", nullable = false, precision = 5, scale = 2)
    private BigDecimal expectedReturnMin;

    @NotNull
    @Column(name = "expected_return_max", nullable = false, precision = 5, scale = 2)
    private BigDecimal expectedReturnMax;

    @NotNull
    @Column(name = "duration_days", nullable = false)
    private Integer durationDays;

    @NotNull
    @Column(name = "min_investment", nullable = false, precision = 32, scale = 2)
    private BigDecimal minInvestment;

    @NotNull
    @Column(name = "max_investment", nullable = false, precision = 32, scale = 2)
    private BigDecimal maxInvestment;

    @NotNull
    @ColumnDefault("true")
    @Column(name = "is_active", nullable = false)
    private Boolean isActive = false;

    @NotNull
    @Column(name = "start_date", nullable = false)
    private LocalDate startDate;

    @NotNull
    @Column(name = "end_date", nullable = false)
    private LocalDate endDate;

    @OneToMany(mappedBy = "opportunityIdInvestmentOpportunities")
    private Set<PlayerInvestment> playerInvestments = new LinkedHashSet<>();

}