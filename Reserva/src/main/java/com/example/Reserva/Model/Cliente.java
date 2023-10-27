package com.example.Reserva.Model;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "clietes")
public class Cliente {
    @Id
    @Column(name = "cedula-Cliente",nullable = false)
    private Integer cedulaCliente;
    @Column(name = "Nombre-Cliente",nullable = false)
    private String nombreCliente;
    @Column(name = "Apellido-Cliente", nullable = false)
    private String apellidoCliente;
    @Column(name = "Direccion-Cliente", nullable = false)
    private String direccionCliente;
    @Column(name = "Edad-Cliente", nullable = false)
    private Integer edad;
    @Column(name = "Email-Cliente", nullable = false)
    private String email;


    @OneToMany(mappedBy = "cliente")
    private List<Reserva> reservas;

    public Cliente() {
    }

    public Cliente(Integer cedulaCliente, String nombreCliente, String apellidoCliente, String direccionCliente, Integer edad, String email) {
        this.cedulaCliente = cedulaCliente;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.direccionCliente = direccionCliente;
        this.edad = edad;
        this.email = email;
    }

    @Override
    public String toString() {
        return "Cliente{" +
                "cedulaCliente=" + cedulaCliente +
                ", nombreCliente='" + nombreCliente + '\'' +
                ", apellidoCliente='" + apellidoCliente + '\'' +
                ", direccionCliente='" + direccionCliente + '\'' +
                ", edad=" + edad +
                ", email='" + email + '\'' +
                '}';
    }


}
