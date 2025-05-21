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
@Table(name = "career_paths", schema = "sv_game")
public class CareerPath {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "path_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @Size(max = 50)
    @NotNull
    @Column(name = "related_attribute", nullable = false, length = 50)
    private String relatedAttribute;

    @OneToMany(mappedBy = "pathIdCareerPaths")
    private Set<PlayerCareerProgress> playerCareerProgresses = new LinkedHashSet<>();

}