package com.example.Reserva.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "habitaciones")
public class Habitacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "Numero-habitacion",nullable = false)
    private Integer numeroHabitacion;
    @Column(name = "precio-Habitacion", nullable = false)
    private Double precioHabitacion;

    @OneToMany(mappedBy = "habitacion")
    private List<HabitacionHasReserva> habitacionHasReservas;

    @ManyToOne
    @JoinColumn(name = "idTipoHabitacion")
    private tipoHabitacion tipoHabitacion;

    public Habitacion() {
    }

    public Habitacion(Integer numeroHabitacion, Double precioHabitacion) {
        this.numeroHabitacion = numeroHabitacion;
        this.precioHabitacion = precioHabitacion;
    }
}
