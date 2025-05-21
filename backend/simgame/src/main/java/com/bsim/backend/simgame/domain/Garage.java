package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "garages", schema = "sv_game")
public class Garage {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "garage_id", nullable = false)
    private UUID id;

    @NotNull
    @Column(name = "total_slots", nullable = false)
    private Integer totalSlots;

    @NotNull
    @Column(name = "available_slots", nullable = false)
    private Integer availableSlots;

    @Size(max = 50)
    @NotNull
    @Column(name = "slot_size_type", nullable = false, length = 50)
    private String slotSizeType;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "game_id_games")
    private Game gameIdGames;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "building_id_buildings")
    private Building buildingIdBuildings;

    @OneToMany(mappedBy = "garageIdGarages")
    private Set<GarageParking> garageParkings = new LinkedHashSet<>();

    @OneToMany(mappedBy = "garageIdGarages")
    private Set<Vehicle> vehicles = new LinkedHashSet<>();

}