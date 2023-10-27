package com.example.Reserva.Model;

import jakarta.persistence.*;
import lombok.Data;

@Data
@Entity
@Table(name = "tabla-Conexion")
public class HabitacionHasReserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;
    @Column(name = "conexion-table-habitacion",nullable = false)
    private Integer habitacion_idHabitacion;
    @Column(name = "conexion-table-Reserva",nullable = false)
    private Integer reserva_idReserva;

    @ManyToOne
    @JoinColumn(name = "codigoReserva")
    private Reserva reserva;

    @ManyToOne
    @JoinColumn(name = "numeroHabitacion")
    private Habitacion habitacion;

    public HabitacionHasReserva() {
    }

    public HabitacionHasReserva(Integer id, Integer habitacion_idHabitacion, Integer reserva_idReserva) {
        this.id = id;
        this.habitacion_idHabitacion = habitacion_idHabitacion;
        this.reserva_idReserva = reserva_idReserva;
    }
}
