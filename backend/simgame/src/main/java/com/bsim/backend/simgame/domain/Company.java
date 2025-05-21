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
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "companies", schema = "sv_game")
public class Company {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "company_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "cash_balance", nullable = false, precision = 32, scale = 2)
    private BigDecimal cashBalance;

    @NotNull
    @Column(name = "net_worth", nullable = false, precision = 32, scale = 2)
    private BigDecimal netWorth;

    @NotNull
    @ColumnDefault("500")
    @Column(name = "reputation", nullable = false)
    private Integer reputation;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "market_share", nullable = false, precision = 5, scale = 2)
    private BigDecimal marketShare;

    @NotNull
    @Column(name = "growth_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal growthRate;

    @NotNull
    @Column(name = "founding_date", nullable = false)
    private LocalDate foundingDate;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_publicly_traded", nullable = false)
    private Boolean isPubliclyTraded = false;

    @NotNull
    @Column(name = "production_capacity", nullable = false)
    private Integer productionCapacity;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "r_and_d_level", nullable = false)
    private Integer rAndDLevel;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "marketing_level", nullable = false)
    private Integer marketingLevel;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "category_id_business_categories")
    private BusinessCategory categoryIdBusinessCategories;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "npc_id_npcs")
    private Npc npcIdNpcs;

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Building> buildings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<CompanyBuilding> companyBuildings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<CompanyFinancialHistory> companyFinancialHistories = new LinkedHashSet<>();

    @OneToOne(mappedBy = "companyIdCompanies")
    private CompanyHq companyHq;

    @OneToMany
    private Set<Debt> lender_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> borrower_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> current_owner_debts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Job> jobs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Plot> plots = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Product> products = new LinkedHashSet<>();

    @OneToOne(mappedBy = "companyIdCompanies")
    private Stock stock;

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Transaction> transactions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "companyIdCompanies")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

}