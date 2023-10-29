package com.example.Reserva.Controller;

import com.example.Reserva.Model.Habitacion;
import com.example.Reserva.Service.HabitacionService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/habitaciones")
public class HabitacionController {


    private HabitacionService habitacionService;
    @Autowired
    public HabitacionController(HabitacionService habitacionService) {
        this.habitacionService = habitacionService;
    }

    @PostMapping
    public ResponseEntity<Habitacion> addHabitacion(@Valid @RequestBody Habitacion habitacion) {
        Habitacion created = habitacionService.addHabitacion(habitacion);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Habitacion> update(@PathVariable Integer id, @Valid @RequestBody Habitacion habitacion) {
        Habitacion updated = habitacionService.update(id, habitacion);
        return ResponseEntity.ok(updated);
    }

    @GetMapping("/disponibles")
    public ResponseEntity<List<Habitacion>> getDisponibles(){
        List<Habitacion> disponibles = habitacionService.findDisponibles();
        return ResponseEntity.ok(disponibles);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> delete(@PathVariable Integer id) {
        habitacionService.delete(id);
        return ResponseEntity.noContent().build();
    }
}