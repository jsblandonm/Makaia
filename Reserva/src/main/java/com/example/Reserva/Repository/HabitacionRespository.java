package com.example.Reserva.Repository;

import com.example.Reserva.Model.Habitacion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
@Repository
public interface HabitacionRespository extends JpaRepository<Habitacion, Integer> {
    List<Habitacion> findByDisponible(Boolean disponible);
}
