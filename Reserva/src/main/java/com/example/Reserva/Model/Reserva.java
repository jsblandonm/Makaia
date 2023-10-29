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
    @NotNull
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "codigo-Reserva")
    private Integer codigoReserva;
    @NotNull
    @Column(name = "fecha_Reserva")
    private LocalDate fechaReserva;
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

    public Reserva(Integer codigoReserva, LocalDate fechaReserva, Double totalPagar) {
        this.codigoReserva = codigoReserva;
        this.fechaReserva = fechaReserva;
        this.totalPagar = totalPagar;
    }
}
