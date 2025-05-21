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
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "vehicletypes", schema = "sv_game")
public class Vehicletype {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "vehicletype_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 255)
    @NotNull
    @Column(name = "maker", nullable = false)
    private String maker;

    @Size(max = 50)
    @NotNull
    @Column(name = "type", nullable = false, length = 50)
    private String type;

    @NotNull
    @Column(name = "base_price", nullable = false, precision = 32, scale = 2)
    private BigDecimal basePrice;

    @NotNull
    @ColumnDefault("1")
    @Column(name = "passenger_capacity", nullable = false)
    private Integer passengerCapacity;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "cargo_capacity", nullable = false)
    private Integer cargoCapacity;

    @NotNull
    @ColumnDefault("1.0")
    @Column(name = "speed_modifier", nullable = false, precision = 5, scale = 2)
    private BigDecimal speedModifier;

    @NotNull
    @ColumnDefault("0.0")
    @Column(name = "work_efficiency_modifier", nullable = false, precision = 5, scale = 2)
    private BigDecimal workEfficiencyModifier;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Small'")
    @Column(name = "garage_size_needed", nullable = false, length = 50)
    private String garageSizeNeeded;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @OneToMany(mappedBy = "vehicletypeIdVehicletypes")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

}