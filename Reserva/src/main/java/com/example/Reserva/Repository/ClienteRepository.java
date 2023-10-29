package com.example.Reserva.Repository;

import com.example.Reserva.Model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Integer> {

    //List<Cliente> findByNombre(String nombreCliente);

    //List<Cliente> findByApellido(String apellidoCliente);

}
