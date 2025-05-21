package com.bsim.backend.simgame.domain;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.JdbcTypeCode;
import org.hibernate.type.SqlTypes;

import java.math.BigDecimal;
import java.util.LinkedHashSet;
import java.util.Map;
import java.util.Set;
import java.util.UUID;

@Getter
@Setter
@Entity
@Table(name = "items", schema = "sv_game")
public class Item {
    @Id
    @GeneratedValue(strategy = GenerationType.UUID)
    @Column(name = "item_id", nullable = false)
    private UUID id;

    @Size(max = 255)
    @NotNull
    @Column(name = "name", nullable = false)
    private String name;

    @NotNull
    @Column(name = "description", nullable = false, length = Integer.MAX_VALUE)
    private String description;

    @Size(max = 100)
    @NotNull
    @Column(name = "type", nullable = false, length = 100)
    private String type;

    @NotNull
    @Column(name = "value", nullable = false, precision = 16, scale = 2)
    private BigDecimal value;

    @NotNull
    @Column(name = "effect_data", nullable = false)
    @JdbcTypeCode(SqlTypes.JSON)
    private Map<String, Object> effectData;

    @OneToMany(mappedBy = "itemIdItems")
    private Set<PlayerInventory> playerInventories = new LinkedHashSet<>();

}