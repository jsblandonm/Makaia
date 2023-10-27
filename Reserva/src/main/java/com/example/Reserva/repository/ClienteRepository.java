package com.example.Reserva.repository;

import com.example.Reserva.Model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;


public interface ClienteRepository extends JpaRepository<Cliente ,Integer> {

}
