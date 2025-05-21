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
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "products", schema = "sv_game")
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "product_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "base_production_cost", nullable = false, precision = 16, scale = 2)
    private BigDecimal baseProductionCost;

    @NotNull
    @Column(name = "current_market_price", nullable = false, precision = 16, scale = 2)
    private BigDecimal currentMarketPrice;

    @NotNull
    @ColumnDefault("50")
    @Column(name = "quality", nullable = false)
    private Integer quality;

    @NotNull
    @Column(name = "demand", nullable = false, precision = 5, scale = 2)
    private BigDecimal demand;

    @NotNull
    @Column(name = "supply", nullable = false, precision = 5, scale = 2)
    private BigDecimal supply;

    @NotNull
    @Column(name = "production_rate_per_day", nullable = false, precision = 16, scale = 2)
    private BigDecimal productionRatePerDay;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "category_id_business_categories")
    private BusinessCategory categoryIdBusinessCategories;

}