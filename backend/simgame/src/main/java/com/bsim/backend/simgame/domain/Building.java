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
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "buildings", schema = "sv_game")
public class Building {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "building_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "building_type", nullable = false, length = 100)
    private String buildingType;

    @NotNull
    @Column(name = "construction_cost", nullable = false, precision = 32, scale = 2)
    private BigDecimal constructionCost;

    @NotNull
    @Column(name = "current_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal currentValue;

    @NotNull
    @Column(name = "rent_per_month", nullable = false, precision = 5, scale = 2)
    private BigDecimal rentPerMonth;

    @NotNull
    @Column(name = "capacity", nullable = false)
    private Integer capacity;

    @NotNull
    @Column(name = "maintenance_cost_per_month", nullable = false, precision = 16, scale = 2)
    private BigDecimal maintenanceCostPerMonth;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "condition_percentage", nullable = false)
    private Integer conditionPercentage;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "upgrade_level", nullable = false)
    private Integer upgradeLevel;

    @NotNull
    @Column(name = "customization_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> customizationData;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_player_home", nullable = false)
    private Boolean isPlayerHome = false;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_company_headquarters", nullable = false)
    private Boolean isCompanyHeadquarters = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "player_id_players")
    private Player playerIdPlayers;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "npc_id_npcs")
    private Npc npcIdNpcs;

    @OneToMany(mappedBy = "buildingIdBuildings")
    private Set<Cockfight> cockfights = new LinkedHashSet<>();

    @OneToMany(mappedBy = "buildingIdBuildings")
    private Set<CompanyBuilding> companyBuildings = new LinkedHashSet<>();

    @OneToOne(mappedBy = "buildingIdBuildings")
    private CompanyHq companyHq;

    @OneToOne(mappedBy = "buildingIdBuildings")
    private Garage garage;

    @OneToOne(mappedBy = "buildingIdBuildings")
    private Plot plot;

}