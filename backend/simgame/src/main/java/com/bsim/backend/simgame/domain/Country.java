package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "countries", schema = "sv_game")
public class Country {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "country_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "base_tax_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal baseTaxRate;

    @NotNull
    @Column(name = "business_tax_rate", nullable = false, precision = 5, scale = 2)
    private BigDecimal businessTaxRate;

    @NotNull
    @Column(name = "import_export_duty", nullable = false, precision = 5, scale = 2)
    private BigDecimal importExportDuty;

    @Size(max = 100)
    @NotNull
    @Column(name = "economic_system", nullable = false, length = 100)
    private String economicSystem;

    @Size(max = 100)
    @NotNull
    @Column(name = "law_system", nullable = false, length = 100)
    private String lawSystem;

    @NotNull
    @Column(name = "stability_index", nullable = false, precision = 5, scale = 2)
    private BigDecimal stabilityIndex;

    @NotNull
    @Column(name = "crime_rate_modifier", nullable = false, precision = 5, scale = 2)
    private BigDecimal crimeRateModifier;

    @NotNull
    @Column(name = "corruption_level", nullable = false, precision = 5, scale = 2)
    private BigDecimal corruptionLevel;

    @NotNull
    @Column(name = "growth_potential", nullable = false, precision = 5, scale = 2)
    private BigDecimal growthPotential;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "currency_id_currencies")
    private Currency currencyIdCurrencies;

    @OneToMany(mappedBy = "countryIdCountries")
    private Set<Bank> banks = new LinkedHashSet<>();

    @OneToMany(mappedBy = "countryIdCountries")
    private Set<NewsEvent> newsEvents = new LinkedHashSet<>();

    @OneToMany(mappedBy = "countryIdCountries")
    private Set<State> states = new LinkedHashSet<>();

}