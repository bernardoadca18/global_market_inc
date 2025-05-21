package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "education_institutions", schema = "sv_game")
public class EducationInstitution {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "institution_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @Size(max = 100)
    @NotNull
    @Column(name = "type", nullable = false, length = 100)
    private String type;

    @OneToMany(mappedBy = "institutionIdEducationInstitutions")
    private Set<Cours> courses = new LinkedHashSet<>();

}