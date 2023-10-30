package com.example.Reserva.Model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Data;

import java.util.List;

@Data
@Entity
@Table(name = "clientes")
public class Cliente {
    @NotNull
    @Column(name = "cedula-Cliente", unique = true)
    @Id
    private Integer cedulaCliente;
    @NotNull
    @Size(min= 2, max= 100)
    @Column(name = "Nombre-Cliente")
    private String nombreCliente;
    @NotNull
    @Size(min= 2, max= 100)
    @Column(name = "Apellido-Cliente")
    private String apellidoCliente;
    @NotNull
    @Size(max = 250)
    @Column(name = "Direccion-Cliente")
    private String direccionCliente;
    @NotNull
    @Column(name = "Edad-Cliente")
    private Integer edad;
    @NotNull
    @Email
    @Column(name = "Email-Cliente")
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
