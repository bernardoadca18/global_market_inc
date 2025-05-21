package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "company_hqs", schema = "sv_game")
public class CompanyHq {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "company_hq_id", nullable = false)
    private UUID id;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @OneToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "building_id_buildings")
    private Building buildingIdBuildings;

}