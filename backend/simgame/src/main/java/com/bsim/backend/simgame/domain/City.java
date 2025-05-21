package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
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
@Table(name = "cities", schema = "sv_game")
public class City {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "city_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "population", nullable = false)
    private Long population;

    @Size(max = 100)
    @NotNull
    @Column(name = "city_type", nullable = false, length = 100)
    private String cityType;

    @NotNull
    @Column(name = "size_modifier", nullable = false, precision = 5, scale = 2)
    private BigDecimal sizeModifier;

    @NotNull
    @Column(name = "cost_of_living_index", nullable = false, precision = 5, scale = 2)
    private BigDecimal costOfLivingIndex;

    @NotNull
    @Column(name = "local_crime_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal localCrimeRate;

    @NotNull
    @Column(name = "unemployment_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal unemploymentRate;

    @Size(max = 255)
    @Column(name = "procedural_seed")
    private String proceduralSeed;

    @NotNull
    @Column(name = "map_config_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> mapConfigData;

    @NotNull
    @Column(name = "generated_map_layout", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> generatedMapLayout;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "state_id_states")
    private State stateIdStates;

    @OneToMany(mappedBy = "cityIdCities")
    private Set<NewsEvent> newsEvents = new LinkedHashSet<>();

    @OneToMany(mappedBy = "cityIdCities")
    private Set<Npc> npcs = new LinkedHashSet<>();

    @OneToMany(mappedBy = "cityIdCities")
    private Set<Player> players = new LinkedHashSet<>();

    @OneToMany(mappedBy = "cityIdCities")
    private Set<Plot> plots = new LinkedHashSet<>();

}