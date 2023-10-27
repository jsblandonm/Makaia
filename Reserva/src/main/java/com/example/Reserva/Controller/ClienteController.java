package com.example.Reserva.Controller;

import com.example.Reserva.Model.Cliente;
import com.example.Reserva.Service.ServiceCliente;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/clientes")
public class ClienteController {

    @Autowired
    private ServiceCliente serviceCliente;

    @PostMapping
    public ResponseEntity<Cliente> addCliente(@Valid @RequestBody Cliente cliente) {
        Cliente clienteGuardado = serviceCliente.addCliente(cliente);
        return new ResponseEntity<>(clienteGuardado, HttpStatus.CREATED);
    }

    @GetMapping
    public ResponseEntity<List<Cliente>> getAllClientes() {
        List<Cliente> clientes = serviceCliente.getAllClientes();
        return new ResponseEntity<>(clientes, HttpStatus.OK);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cliente> findClienteById(@PathVariable Integer id) {
        Cliente cliente = serviceCliente.findClienteById(id);
        if (cliente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> updateCliente(@PathVariable Integer id, @Valid @RequestBody Cliente cliente) {
        Cliente clienteActualizado = serviceCliente.updateCliente(id, cliente);
        if (clienteActualizado == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(clienteActualizado, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteCliente(@PathVariable Integer id) {
        serviceCliente.deleteCliente(id);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

}