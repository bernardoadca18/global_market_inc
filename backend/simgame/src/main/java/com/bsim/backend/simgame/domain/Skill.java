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
@Table(name = "skills", schema = "sv_game")
public class Skill {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "skill_id", nullable = false)
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

    @OneToMany(mappedBy = "skillIdSkills")
    private Set<Cours> courses = new LinkedHashSet<>();

    @OneToMany(mappedBy = "skillIdSkills")
    private Set<PlayerSkill> playerSkills = new LinkedHashSet<>();

}