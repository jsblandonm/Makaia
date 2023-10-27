package com.example.Reserva.Model;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.Date;
import java.util.List;

@Data
@Entity
@Table(name = "reservas")
public class Reserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo-Reserva",nullable = false)
    private Integer codigoReserva;
    @Size(max = 100)
    @Column(name = "fecha-reserva", nullable = false)
    private Date fechaReserva;
    @Column(name = "Habitacion", nullable = false)
    private Integer habitacion;
    @Column(name = "total-pagar",nullable = false)
    private Double totalPagar;

    @ManyToOne
    @JoinColumn(name = "cedulaCliente")
    private Cliente cliente;

    @OneToMany(mappedBy = "reserva")
    private List<HabitacionHasReserva> habitacionHasReservas;


    public Reserva() {
    }

    public Reserva(Integer codigoReserva, Date fechaReserva, Integer habitacion, Double totalPagar) {
        this.codigoReserva = codigoReserva;
        this.fechaReserva = fechaReserva;
        this.habitacion = habitacion;
        this.totalPagar = totalPagar;
    }
}
