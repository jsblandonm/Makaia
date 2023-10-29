package com.example.Reserva.Repository;

import com.example.Reserva.Model.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.time.LocalDate;
import java.util.List;
@Repository
public interface ReservaRepository extends JpaRepository<Reserva,Integer> {
    List<Reserva> findByClienteId(Integer cedulaCliente);
    List<Reserva> findByFechaAndHabitacionDisponible(LocalDate fechaReserva, Boolean disponible);
}
