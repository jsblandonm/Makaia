package com.example.Reserva.Controller;

import com.example.Reserva.Service.TipoHabitacionService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping("/tipos-habitacion")
public class TipoHabitacionController {

    @Autowired
    private TipoHabitacionService service;

    @GetMapping
    public ResponseEntity<List<TipoHabitacion>> getAll() {
        List<TipoHabitacion> tipos = service.getAll();
        return ResponseEntity.ok(tipos);
    }

    @PostMapping
    public ResponseEntity<TipoHabitacion> create(@Valid @RequestBody TipoHabitacion tipo) {
        TipoHabitacion created = service.create(tipo);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    // Otros métodos
}