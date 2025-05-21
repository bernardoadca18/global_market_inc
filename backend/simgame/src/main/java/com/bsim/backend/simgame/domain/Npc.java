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

import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "npcs", schema = "sv_game")
public class Npc {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "npc_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 50)
    @NotNull
    @Column(name = "gender", nullable = false, length = 50)
    private String gender;

    @Column(name = "appearance_data")
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> appearanceData;

    @Size(max = 100)
    @Column(name = "occupation", length = 100)
    private String occupation;

    @Size(max = 255)
    @Column(name = "job_title")
    private String jobTitle;

    @NotNull
    @Column(name = "intelligence", nullable = false)
    private Integer intelligence;

    @NotNull
    @Column(name = "charisma", nullable = false)
    private Integer charisma;

    @NotNull
    @Column(name = "strength", nullable = false)
    private Integer strength;

    @NotNull
    @Column(name = "luck", nullable = false)
    private Integer luck;

    @Column(name = "personality_traits")
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> personalityTraits;

    @Size(max = 50)
    @NotNull
    @Column(name = "financial_status", nullable = false, length = 50)
    private String financialStatus;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_essential", nullable = false)
    private Boolean isEssential = false;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Available'")
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @NotNull
    @ColumnDefault("500")
    @Column(name = "karma", nullable = false)
    private Integer karma;

    @Column(name = "notes", length = Integer.MAX_VALUE)
    private String notes;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "city_id_cities")
    private City cityIdCities;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "plot_id_plots")
    private Plot plotIdPlots;

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<Building> buildings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<Company> companies = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> lender_debts = new LinkedHashSet<>();

    @OneToMany
    private Set<Debt> current_owner_debts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<Nft> nfts = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<NpcStockHolding> npcStockHoldings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<PlayerNpcRelationship> playerNpcRelationships = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<Plot> plots = new LinkedHashSet<>();

    @OneToMany(mappedBy = "npcIdNpcs")
    private Set<Rooster> roosters = new LinkedHashSet<>();

}