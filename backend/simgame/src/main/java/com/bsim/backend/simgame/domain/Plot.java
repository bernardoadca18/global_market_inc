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
@Table(name = "plots", schema = "sv_game")
public class Plot {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "plot_id", nullable = false)
    private UUID id;

    @NotNull
    @ColumnDefault("true")
    @Column(name = "is_available_for_sale", nullable = false)
    private Boolean isAvailableForSale = false;

    @NotNull
    @Column(name = "purchase_price", nullable = false, precision = 32, scale = 2)
    private BigDecimal purchasePrice;

    @NotNull
    @Column(name = "current_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal currentValue;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Not Zoned'")
    @Column(name = "zoning_type", nullable = false, length = 50)
    private String zoningType;

    @NotNull
    @ColumnDefault("true")
    @Column(name = "is_empty", nullable = false)
    private Boolean isEmpty = false;

    @NotNull
    @Column(name = "last_update_time", nullable = false)
    private OffsetDateTime lastUpdateTime;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "city_id_cities")
    private City cityIdCities;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "building_id_buildings")
    private Building buildingIdBuildings;

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

    @OneToMany(mappedBy = "plotIdPlots")
    private Set<Npc> npcs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "plotIdPlots")
    private Set<Player> players = new LinkedHashSet<>();

    @OneToMany(mappedBy = "plotIdPlots")
    private Set<Rooster> roosters = new LinkedHashSet<>();
    @OneToMany(mappedBy = "plotIdPlots")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

/*
 TODO [Reverse Engineering] create field to map the 'coordinates' column
 Available actions: Define target Java type | Uncomment as is | Remove column mapping
    @Column(name = "coordinates", columnDefinition = "point not null")
    private Object coordinates;
*/
}