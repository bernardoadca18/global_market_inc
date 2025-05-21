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
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "vehicles", schema = "sv_game")
public class Vehicle {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "vehicle_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "purchase_price", nullable = false, precision = 32, scale = 2)
    private BigDecimal purchasePrice;

    @NotNull
    @Column(name = "current_value", nullable = false, precision = 32, scale = 2)
    private BigDecimal currentValue;

    @NotNull
    @ColumnDefault("100")
    @Column(name = "condition_percentage", nullable = false)
    private Integer conditionPercentage;

    @NotNull
    @ColumnDefault("0")
    @Column(name = "mileage", nullable = false)
    private Integer mileage;

    @Size(max = 50)
    @NotNull
    @ColumnDefault("'Parked'")
    @Column(name = "status", nullable = false, length = 50)
    private String status;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "garage_id_garages")
    private Garage garageIdGarages;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "vehicletype_id_vehicletypes")
    private Vehicletype vehicletypeIdVehicletypes;

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
    @JoinColumn(name = "plot_id_plots")
    private Plot plotIdPlots;

    @OneToOne(mappedBy = "vehicleIdVehicles")
    private GarageParking garageParking;

}