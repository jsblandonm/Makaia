package com.example.Reserva.Service;
import com.example.Reserva.Model.Cliente;
import com.example.Reserva.repository.ClienteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;


@Service
public class ServiceCliente {

    @Autowired
    private ClienteRepository clienteRepository;

    public Cliente addCliente(Cliente cliente) {
        validarCliente(cliente);
        return clienteRepository.save(cliente);
    }

    public List<Cliente> getAllClientes() {
        return clienteRepository.findAll();
    }

    public Cliente findClienteById(Integer id) {
        return clienteRepository.findById(id)
                .orElseThrow(() -> new ExceptionInInitializerError("Cliente no encontrado"));
    }

    public Cliente updateCliente(Integer id, Cliente clienteActualizado) {
        Cliente cliente = findClienteById(id);
        validarCliente(clienteActualizado);
        cliente.setNombreCliente(clienteActualizado.getNombreCliente());
        cliente.setApellidoCliente(clienteActualizado.getApellidoCliente());
        cliente.setEmail(clienteActualizado.getEmail());
        return clienteRepository.save(cliente);
    }

    public void deleteCliente(Integer id) {
        Cliente cliente = findClienteById(id);
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

}


