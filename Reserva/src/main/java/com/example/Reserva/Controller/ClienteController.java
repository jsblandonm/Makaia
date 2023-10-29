package com.example.Reserva.Controller;

import com.example.Reserva.Model.Cliente;
import com.example.Reserva.Model.Reserva;
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
    
    private final ServiceCliente serviceCliente;
    @Autowired
    public ClienteController(ServiceCliente serviceCliente) {
        this.serviceCliente = serviceCliente;
    }

    @PostMapping
    public ResponseEntity<Cliente> create(@Valid @RequestBody Cliente cliente) {
        Cliente clienteGuardado = serviceCliente.create(cliente);
        return ResponseEntity.status(HttpStatus.CREATED).body(clienteGuardado);
    }
    @GetMapping
    public ResponseEntity<List<Cliente>> getAll() {
        List<Cliente> clientes = serviceCliente.findAll();
        return ResponseEntity.ok(clientes);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Cliente> getById(@PathVariable Integer cedulaCliente) {
        Cliente cliente = serviceCliente.findById(cedulaCliente);
        if (cliente == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(cliente, HttpStatus.OK);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> update(@PathVariable Integer cedulaCliente, @Valid @RequestBody Cliente cliente) {
        Cliente clienteActualizado = serviceCliente.update(cedulaCliente, cliente);
        if (clienteActualizado == null) {
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return new ResponseEntity<>(clienteActualizado, HttpStatus.OK);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer cedulaCliente) {
        serviceCliente.delete(cedulaCliente);
        return new ResponseEntity<>(HttpStatus.NO_CONTENT);
    }

    @GetMapping("/{cedulaCliente}/reservas")
    public ResponseEntity<List<Reserva>> getReservasByCliente(@PathVariable Integer cedulaCliente){
        List<Reserva> reservas = serviceCliente.getReservasByCliente(cedulaCliente);
        return ResponseEntity.ok(reservas);
    }

}