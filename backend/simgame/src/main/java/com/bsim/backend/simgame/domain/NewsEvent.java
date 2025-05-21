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

import java.time.OffsetDateTime;
import java.util.Map;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "news_events", schema = "sv_game")
public class NewsEvent {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "event_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "title", nullable = false)
    private String title;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @Size(max = 100)
    @NotNull
    @Column(name = "event_type", nullable = false, length = 100)
    private String eventType;

    @NotNull
    @Column(name = "impact_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> impactData;

    @NotNull
    @Column(name = "event_date", nullable = false)
    private OffsetDateTime eventDate;

    @NotNull
    @ColumnDefault("false")
    @Column(name = "is_global", nullable = false)
    private Boolean isGlobal = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "country_id_countries")
    private Country countryIdCountries;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "city_id_cities")
    private City cityIdCities;

}