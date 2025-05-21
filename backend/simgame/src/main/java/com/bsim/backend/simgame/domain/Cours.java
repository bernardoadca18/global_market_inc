package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.math.BigDecimal;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "courses", schema = "sv_game")
public class Cours {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "course_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @NotNull
    @Column(name = "cost", nullable = false, precision = 16, scale = 2)
    private BigDecimal cost;

    @NotNull
    @Column(name = "duration_days", nullable = false)
    private Integer durationDays;

    @Size(max = 50)
    @NotNull
    @Column(name = "related_attribute", nullable = false, length = 50)
    private String relatedAttribute;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "institution_id_education_institutions")
    private EducationInstitution institutionIdEducationInstitutions;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "skill_id_skills")
    private Skill skillIdSkills;

}