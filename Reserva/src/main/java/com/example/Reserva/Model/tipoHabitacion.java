package com.example.Reserva.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "Tipo-Habitacion")
public class tipoHabitacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id-Habitacion", nullable = false)
    private Integer idTipoHabitacion;
    @Column(name = "Tipo-Habitacion", nullable = false)
    private String Habitacion;

    @OneToMany(mappedBy = "tipoHabitacion")
    private List<Habitacion> habitacions;



    public tipoHabitacion() {
    }

    public tipoHabitacion(Integer idTipoHabitacion, String habitacion) {
        this.idTipoHabitacion = idTipoHabitacion;
        Habitacion = habitacion;
    }
}
