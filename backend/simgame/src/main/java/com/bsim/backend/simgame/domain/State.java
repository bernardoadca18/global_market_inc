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
@Table(name = "states", schema = "sv_game")
public class State {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "state_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @ColumnDefault("0.00")
    @Column(name = "additional_regional_tax_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal additionalRegionalTaxRate;

    @NotNull
    @Column(name = "zoning_regulations_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> zoningRegulationsData;

    @NotNull
    @Column(name = "environmental_regulations_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> environmentalRegulationsData;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "country_id_countries")
    private Country countryIdCountries;

    @OneToMany(mappedBy = "stateIdStates")
    private Set<City> cities = new LinkedHashSet<>();

}