package com.example.Reserva.repository;

import com.example.Reserva.Model.Cliente;

import java.util.List;

public interface InterCliente {

    List<Cliente> getAllClientes();
    Cliente findClienteById(Integer id);
    Cliente addCliente (Cliente cliente);
    Cliente updateCliente(Integer id, Cliente cliente);

    void deleteCliente(Integer id);
}
