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
public class ReservaService {

    @Autowired
    private ReservaRepository reservaRepo;
    @Autowired
    private HabitacionRespository habitacionRepo;

    public List<Reserva> findByCliente(Integer cedulaClinte){
        return reservaRepo.findByClienteId(cedulaClinte);
    }

    public List<Reserva> findDisponibles(LocalDate fechaReserva){
        return reservaRepo.findByFechaAndHabitacionDisponible(fechaReserva,true);
    }

    public Reserva create(Reserva reserva){
        Habitacion habitacion = habitacionRepo.findById(reserva.getCodigoReserva())
                .orElseThrow(() -> new EntityNotFoundException());

        Double precio = calcularPrecio(habitacion, reserva.getFechaReserva());

        reserva.setTotalPagar(precio);

        Reserva reservaCreada = reservaRepo.save(reserva);

        habitacion.setDisponible(false);
        habitacionRepo.save(habitacion);

        return reservaCreada;
    }

   public Double calcularPrecio(Habitacion habitacion, LocalDate fechaReserva){
        // aplicar descuentos
        return habitacion.getPrecioHabitacion();
    }


    public List<Reserva> getAll() {
        return null;
    }
}
