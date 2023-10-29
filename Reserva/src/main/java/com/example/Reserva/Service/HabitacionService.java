package com.example.Reserva.Service;

import com.example.Reserva.Model.Habitacion;
import com.example.Reserva.Repository.HabitacionRespository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class HabitacionService {


    private HabitacionRespository habitacionRepo;
    @Autowired
    public HabitacionService(HabitacionRespository habitacionRepo) {
        this.habitacionRepo = habitacionRepo;
    }

    public List<Habitacion> findDisponible(){
        return habitacionRepo.findByDisponible(true);
    }

    public void updateDisponibilidad(Integer id, Boolean disponible){
        Habitacion habitacion = habitacionRepo.findById(id).orElseThrow(() -> new EntityNotFoundException());
        habitacion.setDisponible(disponible);
        habitacionRepo.save(habitacion);
    }

    public Habitacion addHabitacion(Habitacion habitacion) {
        return  null;
    }

    public Habitacion update(Integer id, Habitacion habitacion) {
        return null;
    }

    public List<Habitacion> findDisponibles() {
        return null;
    }

    public void delete(Integer id) {

    }
}
