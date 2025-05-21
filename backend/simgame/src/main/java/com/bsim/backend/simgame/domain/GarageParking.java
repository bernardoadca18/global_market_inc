package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "garage_parking", schema = "sv_game")
public class GarageParking {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "garage_parking_id", nullable = false)
    private UUID id;

    @Size(max = 50)
    @Column(name = "parking_spot_number", length = 50)
    private String parkingSpotNumber;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "garage_id_garages")
    private Garage garageIdGarages;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "vehicle_id_vehicles")
    private Vehicle vehicleIdVehicles;

}