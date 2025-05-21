package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.hibernate.type.SqlTypes;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "players", schema = "sv_game")
public class Player {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "player_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 50)
    @NotNull
    @Column(name = "gender", nullable = false, length = 50)
    private String gender;

    @NotNull
    @Column(name = "appearance_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> appearanceData;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "cash_balance", nullable = false, precision = 64, scale = 2)
    private BigDecimal cashBalance;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "health", nullable = false)
    private Integer health;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "happiness", nullable = false)
    private Integer happiness;

    @NotNull
    @ColumnDefault("500")
    @Column(name = "karma", nullable = false)
    private Integer karma;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "energy", nullable = false)
    private Integer energy;

    @Size(max = 100)
    @NotNull
    @ColumnDefault("'None'")
    @Column(name = "education_level", nullable = false, length = 100)
    private String educationLevel;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "education_score", nullable = false)
    private Integer educationScore;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "experience_points", nullable = false)
    private Integer experiencePoints;

    @NotNull
    @Column(name = "date_of_birth", nullable = false)
    private LocalDate dateOfBirth;

    @NotNull
    @Column(name = "age", nullable = false)
    private Integer age;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "city_id_cities")
    private City cityIdCities;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "plot_id_plots")
    private Plot plotIdPlots;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "job_id_jobs")
    private Job jobIdJobs;

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Bank> banks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Bet> bets = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Building> buildings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Company> companies = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> lender_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> borrower_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> current_owner_debts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Nft> nfts = new LinkedHashSet<>();

    @OneToOne(mappedBy = "playerIdPlayers")
    private PlayerAttribute playerAttribute;

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerBankAccount> playerBankAccounts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerCareerProgress> playerCareerProgresses = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerCryptoHolding> playerCryptoHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerCurrencyHolding> playerCurrencyHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerInventory> playerInventories = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerInvestment> playerInvestments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerNftHolding> playerNftHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerNpcRelationship> playerNpcRelationships = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerSkill> playerSkills = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerStatusEffect> playerStatusEffects = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<PlayerStockHolding> playerStockHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Plot> plots = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Rooster> roosters = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Transaction> transactions = new LinkedHashSet<>();

    @OneToMany(mappedBy = "playerIdPlayers")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

}