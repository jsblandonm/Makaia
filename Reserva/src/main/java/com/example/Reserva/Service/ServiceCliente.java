package com.example.Reserva.Service;
import com.example.Reserva.Model.Cliente;
import com.example.Reserva.Model.Reserva;

import com.example.Reserva.Repository.ClienteRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.ErrorResponseException;

import java.util.List;


@Service
public class ServiceCliente {

    @Autowired
    private ClienteRepository clienteRepository;

    public Cliente create(Cliente cliente) {
        validarCliente(cliente);
        return clienteRepository.save(cliente);
    }

    public List<Cliente> findAll() {
        return clienteRepository.findAll();
    }

    public Cliente findById(Integer cedulaCliente) {
        return clienteRepository.findById(cedulaCliente)
                .orElseThrow(() -> new EntityNotFoundException());
    }

    public Cliente update(Integer cedulaCliente, Cliente clienteActualizado) {
        Cliente cliente = findById(cedulaCliente);
        validarCliente(clienteActualizado);
        cliente.setNombreCliente(clienteActualizado.getNombreCliente());
        cliente.setApellidoCliente(clienteActualizado.getApellidoCliente());
        cliente.setEmail(clienteActualizado.getEmail());
        return clienteRepository.save(cliente);
    }

    public void delete(Integer cedulaCliente) {
        Cliente cliente = findById(cedulaCliente);
        if(cliente.getReservas() != null && !cliente.getReservas().isEmpty()) {
            throw new ExceptionInInitializerError("No se puede eliminar cliente con reservas existentes");
        }
        clienteRepository.delete(cliente);
    }

    private void validarCliente(Cliente cliente) {
        if(cliente.getNombreCliente() == null || cliente.getNombreCliente().isEmpty()) {
            throw new ExceptionInInitializerError("El nombre del cliente es obligatorio");
        }
        if(cliente.getApellidoCliente() == null || cliente.getApellidoCliente().isEmpty()) {
            throw new ExceptionInInitializerError("El apellido del cliente es obligatorio");
        }
        // más validaciones necesarias
    }

    public List<Reserva> getReservasByCliente(Integer cedulaCliente) {
        return clienteRepository.findById(cedulaCliente).get().getReservas();
    }

    /*public List<Cliente> buscarPorNombre(String nombreCliente) {
        return clienteRepository.findByNombre(nombreCliente);
    }*/

}


