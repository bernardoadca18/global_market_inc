package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "company_buildings", schema = "sv_game")
public class CompanyBuilding {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "company_building_id", nullable = false)
    private UUID id;

    @Size(max = 100)
    @NotNull
    @Column(name = "role", nullable = false, length = 100)
    private String role;

    @NotNull
    @ColumnDefault("true")
    @Column(name = "is_active", nullable = false)
    private Boolean isActive = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "building_id_buildings")
    private Building buildingIdBuildings;

}