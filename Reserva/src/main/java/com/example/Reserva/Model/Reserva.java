package com.example.Reserva.Model;


import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

import java.time.LocalDate;

@Data
@Entity
@Table(name = "reservas")
public class Reserva {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo-Reserva")
    private Integer codigoReserva;
    @Column(name = "fechaReserva")
    @NotNull
    private LocalDate fecha;
    @NotNull
    @Column(name = "total-pagar")
    private Double totalPagar;

    @ManyToOne
    @JoinColumn(name = "cedulaCliente")
    private Cliente cliente;

    @ManyToOne
    @JoinColumn(name = "numeroHabitacion")
    private Habitacion habitacion;


    public Reserva() {
    }

    public Reserva(Integer codigoReserva, LocalDate fecha, Double totalPagar) {
        this.codigoReserva = codigoReserva;
        this.fecha = fecha;
        this.totalPagar = totalPagar;
    }
}
