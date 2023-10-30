package com.example.Reserva.Controller;

import com.example.Reserva.Model.Reserva;
import com.example.Reserva.Service.ServiceReserva;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@RestController
@RequestMapping("/reservas")
public class ReservaController {

    @Autowired
    private ServiceReserva reservaService;
    public ReservaController(ServiceReserva reservaService) {
        this.reservaService = reservaService;
    }

    @PostMapping
    public ResponseEntity<Reserva> create(@Valid @RequestBody Reserva reserva) {
        Reserva created = reservaService.create(reserva);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @GetMapping
    public ResponseEntity<List<Reserva>> getAll() {
        List<Reserva> reservas = reservaService.getAll();
        return ResponseEntity.ok(reservas);
    }

 /*   @GetMapping("/cliente/{cedulaCliente}")
    public ResponseEntity<List<Reserva>> getByCliente(@PathVariable Integer cedulaCliente ){
        List<Reserva> reservas = reservaService.findByCliente(cedulaCliente);
        return ResponseEntity.ok(reservas);
    }


    @GetMapping("/disponibles")
    public ResponseEntity<List<Reserva>> getDisponibles(@RequestParam LocalDate fecha) {
        List<Reserva> disponibles = reservaService.findDisponibles(fecha);
        return ResponseEntity.ok(disponibles);
    }*/


}
