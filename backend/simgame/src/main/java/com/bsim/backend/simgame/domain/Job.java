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
import java.util.LinkedHashSet;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "jobs", schema = "sv_game")
public class Job {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "job_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "title", nullable = false)
    private String title;

    @NotNull
    @Column(name = "base_salary_per_day", nullable = false, precision = 16, scale = 2)
    private BigDecimal baseSalaryPerDay;

    @Size(max = 100)
    @NotNull
    @Column(name = "required_education_level", nullable = false, length = 100)
    private String requiredEducationLevel;

    @NotNull
    @Column(name = "required_education_score", nullable = false)
    private Integer requiredEducationScore;

    @NotNull
    @Column(name = "required_intelligence", nullable = false)
    private Integer requiredIntelligence;

    @NotNull
    @Column(name = "required_charisma", nullable = false)
    private Integer requiredCharisma;

    @NotNull
    @Column(name = "required_strength", nullable = false)
    private Integer requiredStrength;

    @NotNull
    @Column(name = "xp_per_day", nullable = false)
    private Integer xpPerDay;

    @NotNull
    @ColumnDefault("true")
    @Column(name = "is_available", nullable = false)
    private Boolean isAvailable = false;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.RESTRICT)
    @JoinColumn(name = "category_id_job_categories")
    private JobCategory categoryIdJobCategories;

    @ManyToOne(fetch = FetchType.LAZY)
    @OnDelete(action = OnDeleteAction.SET_NULL)
    @JoinColumn(name = "company_id_companies")
    private Company companyIdCompanies;

    @OneToMany(mappedBy = "jobIdJobs")
    private Set<Player> players = new LinkedHashSet<>();

}