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
@Table(name = "job_categories", schema = "sv_game")
public class JobCategory {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "category_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @OneToMany(mappedBy = "categoryIdJobCategories")
    private Set<Job> jobs = new LinkedHashSet<>();

}