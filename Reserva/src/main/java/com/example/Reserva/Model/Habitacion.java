package com.example.Reserva.Model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "habitaciones")
public class Habitacion {
    @Id
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Numero-habitacion")
    @NotNull
    private Integer numeroHabitacion;
    @NotNull
    @Column(name = "precio-Habitacion", nullable = false)
    private Double precioHabitacion;

    private Boolean disponible;
    @NotNull
    @Enumerated(EnumType.STRING)
    @Column(name = "tipo-Habitacion")
    private tipoHabitacion tipo;
    public enum tipoHabitacion {
        ESTANDAR,
        PREMIUM
    }

    //@OneToMany(mappedBy = "habitacion")
    //private List<HabitacionHasReserva> habitacionHasReservas;

    //@ManyToOne
    //@JoinColumn(name = "idTipoHabitacion")
    //private tipoHabitacion tipoHabitacion;

    public Habitacion() {
    }

    public Habitacion(Integer numeroHabitacion, Double precioHabitacion, Boolean disponible, tipoHabitacion tipo) {
        this.numeroHabitacion = numeroHabitacion;
        this.precioHabitacion = precioHabitacion;
        this.disponible = disponible;
        this.tipo = tipo;
    }


}
