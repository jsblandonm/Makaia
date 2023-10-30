package com.example.Reserva.Service;

import com.example.Reserva.Model.Habitacion;
import com.example.Reserva.Model.Reserva;
import com.example.Reserva.Repository.HabitacionRespository;
import com.example.Reserva.Repository.ReservaRepository;
import jakarta.persistence.EntityNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
public class ServiceReserva {

    @Autowired
    private ReservaRepository reservaRepo;
    @Autowired
    private HabitacionRespository habitacionRepo;

    /*public List<Reserva> findByCliente(Integer cedulaClinte){
        return reservaRepo.findByClienteId(cedulaClinte);
    }

    /*public List<Reserva> findDisponibles(LocalDate fecha){
        return reservaRepo.findByFechaAndHabitacionDisponible(fecha, true);
    }*/

    public Reserva create(Reserva reserva){
        Habitacion habitacion = habitacionRepo.findById(reserva.getCodigoReserva())
                .orElseThrow(() -> new EntityNotFoundException());

        Double precio = calcularPrecio(habitacion, reserva.getFecha());

        reserva.setTotalPagar(precio);

        Reserva reservaCreada = reservaRepo.save(reserva);

        habitacion.setDisponible(false);
        habitacionRepo.save(habitacion);

        return reservaCreada;
    }

    public Double calcularPrecio(Habitacion habitacion, LocalDate fecha){

        double precio = habitacion.getPrecioHabitacion();

        // Descuento por antelaciÃ³n

        if (fecha.isAfter(LocalDate.now().plusDays(15))){
            precio = precio *0.8; // 20% de descuento
        }

        // Descuento por tipo premium
        if(habitacion.getTipo() == Habitacion.tipoHabitacion.PREMIUM) {
            precio = precio * 0.95; // 5% de descuento adicional
        }

        if(habitacion.getTipo() == Habitacion.tipoHabitacion.ESTANDAR) {
            precio = precio * 0.02; // 5% de descuento adicional
        }

        return precio;

    }
    public List<Reserva> getAll() {
        return null;
    }


}


