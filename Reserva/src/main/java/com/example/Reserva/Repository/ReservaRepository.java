package com.example.Reserva.Repository;

import com.example.Reserva.Model.Reserva;
import org.springframework.data.jpa.repository.JpaRepository;

import java.time.LocalDate;
import java.util.List;

public interface ReservaRepository extends JpaRepository<Reserva, Integer> {

    //List<Reserva> findByClienteId(Integer cedulaCliente);



}
