USE `jardinera_MAKAIA` ;

-- registros jefes

INSERT INTO `jardinera_MAKAIA`.`jefe` (`nombre`) VALUES
('Juan Pérez'),
('María López'),
('Carlos Rodríguez'),
('Ana Martínez'),
('Pedro González'),
('Laura Sánchez'),
('Luis Fernández'),
('Sara Jiménez'),
('Andrés Torres'),
('Elena Ramírez'),
('José García'),
('Carmen Ruiz'),
('Miguel Castro'),
('Isabel Vargas'),
('Fernando Díaz'),
('Silvia Ortiz'),
('Alejandro Moreno'),
('Rosa Herrera'),
('Javier Silva'),
('Patricia Gómez');

select * from jefe;

-- Registros empleados

INSERT INTO `jardinera_MAKAIA`.`empleado` (`nombre`, `apellido1`, `apellido2`, `extension`, `email`, `id_oficina`, `id_jefe`, `puesto`) VALUES
('David', 'Sánchez', 'Gómez', '453', 'david@example.com', 1, 1, 'Gerente'),
('Luisa', 'Martínez', 'Fernández', '234', 'luisa@example.com', 2, 1, 'Vendedor'),
('Andrés', 'Pérez', 'López', '567', 'andres@example.com', 3, 2, 'Vendedor'),
('Elena', 'González', 'Rodríguez', '789', 'elena@example.com', 1, 1, 'Gerente'),
('Pablo', 'Ramírez', 'Herrera', '678', 'pablo@example.com', 2, 1, 'Vendedor'),
('Carmen', 'Fernández', 'Díaz', '345', 'carmen@example.com', 3, 2, 'Vendedor'),
('Juan', 'Torres', 'Silva', '890', 'juan@example.com', 1, 1, 'Gerente'),
('María', 'Jiménez', 'Ruiz', '123', 'maria@example.com', 2, 1, 'Vendedor'),
('Carlos', 'Silva', 'García', '456', 'carlos@example.com', 3, 2, 'Vendedor'),
('Ana', 'Sánchez', 'Pérez', '678', 'ana@example.com', 1, 1, 'Gerente'),
('Pedro', 'Díaz', 'López', '987', 'pedro@example.com', 2, 1, 'Vendedor'),
('Laura', 'Ruiz', 'Martínez', '567', 'laura@example.com', 3, 2, 'Vendedor');

select * from empleado;

-- Registros oficina

INSERT INTO `jardinera_MAKAIA`.`oficina` (`ciudad`, `pais`, `region`, `codigo_postal`, `telefono`, `direccion`) VALUES
('New York', 'United States', 'East Coast', '10001', '+1 123-456-7890', '123 Main Street'),
('London', 'United Kingdom', 'England', 'SW1A', '+44 20 1234 5678', '456 Oxford Street'),
('Paris', 'France', 'Île-de-France', '75001', '+33 1 2345 6789', '789 Champs-Élysées'),
('Sydney', 'Australia', 'New South Wales', '2000', '+61 2 3456 7890', '101 George Street'),
('Tokyo', 'Japan', 'Kanto', '100-0000', '+81 3 1234 5678', '1-1-1 Shibuya'),
('Rio de Janeiro', 'Brazil', 'Southeast', '20000-000', '+55 21 2345 6789', 'Av. Copacabana 123'),
('Cape Town', 'South Africa', 'Western Cape', '8000', '+27 21 3456 7890', '45 Waterfront Road'),
('Dubai', 'United Arab Emirates', 'Dubai', '12345', '+971 4 123 4567', 'Sheikh Zayed Road'),
('Singapore', 'Singapore', 'Central Region', '123456', '+65 6 7890 1234', '1 Marina Bay Sands'),
('Moscow', 'Russia', 'Central Federal District', '101000', '+7 495 123 4567', 'Red Square 1'),
('Berlin', 'Germany', 'Berlin', '10117', '+49 30 2345 6789', 'Unter den Linden 1'),
('Rome', 'Italy', 'Lazio', '00187', '+39 06 3456 7890', 'Via del Corso 123'),
('Toronto', 'Canada', 'Ontario', 'M5H 1J8', '+1 416-789-1234', '100 King Street West'),
('Seoul', 'South Korea', 'Seoul', '04505', '+82 2 1234 5678', '123 Gangnam-daero'),
('Mexico City', 'Mexico', 'Federal District', '06700', '+52 55 3456 7890', 'Paseo de la Reforma 123'),
('Buenos Aires', 'Argentina', 'Buenos Aires', 'C1002AAQ', '+54 11 2345 6789', 'Florida Street 123'),
('Shanghai', 'China', 'Shanghai', '200000', '+86 21 1234 5678', 'Nanjing Road 123'),
('Cairo', 'Egypt', 'Cairo Governorate', '11511', '+20 2 3456 7890', 'Tahrir Square 1'),
('Mumbai', 'India', 'Maharashtra', '400001', '+91 22 2345 6789', 'Gateway of India'),
('Copenhagen', 'Denmark', 'Capital Region', '1051', '+45 12 345 678', 'Strøget 123');

select * from oficina;

-- registros pago

INSERT INTO `jardinera_MAKAIA`.`pago` (`id_transaccion`, `fk_pago_cliente`, `forma_pago`, `fecha_pago`, `total`) VALUES
('TRANS-001', 41, 'Tarjeta de crédito', '2023-09-15 14:30:00', 500.00),
('TRANS-002', 42, 'PayPal', '2023-09-16 15:45:00', 750.00),
('TRANS-003', 43, 'Transferencia bancaria', '2023-09-17 16:00:00', 1000.00),
('TRANS-004', 44, 'Cheque', '2023-09-18 17:15:00', 1250.00),
('TRANS-005', 45, 'Tarjeta de crédito', '2023-09-19 18:30:00', 1500.00),
('TRANS-006', 46, 'PayPal', '2023-09-20 19:45:00', 1750.00),
('TRANS-007', 47, 'Transferencia bancaria', '2023-09-21 20:00:00', 2000.00),
('TRANS-008', 48, 'Cheque', '2023-09-22 21:15:00', 2250.00),
('TRANS-009', 49, 'Tarjeta de crédito', '2023-09-23 22:30:00', 2500.00),
('TRANS-010', 50, 'PayPal', '2023-09-24 23:45:00', 2750.00),
('TRANS-011', 51, 'Transferencia bancaria', '2023-09-25 00:00:00', 3000.00),
('TRANS-012', 52, 'Cheque', '2023-09-26 01:15:00', 3250.00),
('TRANS-013', 45, 'Tarjeta de crédito', '2023-09-27 02:30:00', 3500.00),
('TRANS-014', 47, 'PayPal', '2023-09-28 03:45:00', 3750.00),
('TRANS-015', 48, 'Transferencia bancaria', '2023-09-29 04:00:00', 4000.00),
('TRANS-016', 41, 'Cheque', '2023-09-30 05:15:00', 4250.00),
('TRANS-017', 52, 'Tarjeta de crédito', '2023-10-01 06:30:00', 4500.00),
('TRANS-018', 43, 'PayPal', '2023-10-02 07:45:00', 4750.00),
('TRANS-019', 50, 'Transferencia bancaria', '2023-10-03 09:00:00', 5000.00),
('TRANS-020', 41, 'Cheque', '2023-10-04 10:15:00', 5250.00);

select * from pago;

-- registros clientes 

INSERT INTO `jardinera_MAKAIA`.`cliente` (`nombre`,`nombre_contacto`,`apellido_contacto`,`telefono`,`fax`,`direccion1`,`direccion2`,`ciudad`,`region`,`pais`,`codigo_postal`,`id_empleado`,`limite_credito`) VALUES
('Santiago', 'Carmen', 'Hernandez', '+1234567890', '+9876543210', '123 Main St', 'Apt. 1A', 'New York', 'NY', 'USA', '10001', 1, 1000.00),
('Carmen', 'Pedro', 'Ramirez', '+2345678901', '+8765432109', '456 Elm St', 'Apt. 2B', 'Los Angeles', 'CA', 'USA', '90001', 2, 1500.00),
('Pedro', 'Santiago', 'Valderrama', '+3456789012', '+7654321098', '789 Oak St', 'Apt. 3C', 'Chicago', 'IL', 'USA', '60601', 3, 2000.00),
('Maria', 'Juan', 'Gomez', '+4567890123', '+6543210987', '101 Pine St', 'Apt. 4D', 'Miami', 'FL', 'USA', '33101', 4, 2500.00),
('Luis', 'Ana', 'Lopez', '+5678901234', '+5432109876', '202 Cedar St', 'Apt. 5E', 'Dallas', 'TX', 'USA', '75201', 5, 3000.00),
('Ana', 'Sergio', 'Perez', '+6789012345', '+4321098765', '303 Maple St', 'Apt. 6F', 'Phoenix', 'AZ', 'USA', '85001', 6, 3500.00),
('Sergio', 'Luisa', 'Gonzalez', '+7890123456', '+3210987654', '404 Birch St', 'Apt. 7G', 'San Francisco', 'CA', 'USA', '94101', 7, 4000.00),
('Juan', 'María', 'Fernandez', '+8901234567', '+2109876543', '505 Spruce St', 'Apt. 8H', 'Boston', 'MA', 'USA', '02101', 8, 4500.00),
('Luisa', 'Luis', 'Torres', '+9012345678', '+1098765432', '606 Cedar St', 'Apt. 9I', 'Seattle', 'WA', 'USA', '98101', 9, 5000.00),
('Carlos', 'Sofia', 'Sanchez', '+1234567890', '+9876543210', '707 Oak St', 'Apt. 10J', 'Denver', 'CO', 'USA', '80201', 10, 5500.00),
('Sofia', 'Carlos', 'Rivera', '+2345678901', '+8765432109', '808 Elm St', 'Apt. 11K', 'Philadelphia', 'PA', 'USA', '19101', 11, 6000.00),
('María', 'Pedro', 'Martinez', '+3456789012', '+7654321098', '909 Maple St', 'Apt. 12L', 'Houston', 'TX', 'USA', '77001', 12, 6500.00);

select * from cliente;

-- registros productos
INSERT INTO `jardinera_MAKAIA`.`producto` (`nombre`,`gama`,`dimensiones`,`proveedor`,`descripcion`,`cantidad_stock`,`precio_venta`,`precio_porveedor`) VALUES
('Pan Bimbo', 1, '10x20 cm', 'Grupo Bimbo', 'Pan blanco suave y fresco', 100, 1.99, 1.29),
('Coca-Cola', 2, '355 ml', 'The Coca-Cola Company', 'Refresco de cola carbonatado', 80, 1.49, 0.99),
('iPhone 13', 3, '6.1 pulgadas', 'Apple Inc.', 'Teléfono inteligente de última generación', 120, 799.99, 699.99),
('Samsung Galaxy S21', 1, '6.2 pulgadas', 'Samsung Electronics', 'Teléfono Android de alta gama', 90, 699.99, 599.99),
('HP Pavilion Laptop', 2, '15.6 pulgadas', 'HP Inc.', 'Portátil para trabajo y entretenimiento', 70, 549.99, 449.99),
('Sony Bravia 4K TV', 3, '55 pulgadas', 'Sony Corporation', 'Televisor 4K con pantalla LED', 110, 799.99, 699.99),
('Nike Air Max 90', 1, 'Tallas 7-13', 'Nike, Inc.', 'Zapatillas deportivas icónicas', 85, 129.99, 99.99),
('Adidas Superstar', 2, 'Tallas 5-12', 'Adidas AG', 'Zapatillas de estilo clásico', 75, 79.99, 59.99),
('Dell XPS 13 Laptop', 3, '13.3 pulgadas', 'Dell Technologies', 'Portátil ultradelgado y potente', 105, 999.99, 899.99),
('Pepsi', 1, '355 ml', 'PepsiCo, Inc.', 'Refresco de cola carbonatado', 85, 1.49, 0.99),
('MacBook Air', 2, '13.3 pulgadas', 'Apple Inc.', 'Portátil ultradelgado y ligero', 65, 1299.99, 1099.99),
('LG OLED TV', 3, '65 pulgadas', 'LG Electronics', 'Televisor OLED con calidad de imagen excepcional', 115, 1499.99, 1299.99),
('Reebok Classic Leather', 1, 'Tallas 6-14', 'Reebok International Ltd.', 'Zapatillas de cuero clásicas', 95, 89.99, 69.99),
('Acer Aspire Laptop', 2, '15.6 pulgadas', 'Acer Inc.', 'Portátil versátil para tareas diarias', 75, 449.99, 369.99),
('LG Refrigerator', 3, '26 cu. ft.', 'LG Electronics', 'Refrigerador espacioso y eficiente', 125, 999.99, 899.99),
('Samsung Galaxy Watch', 1, '42 mm', 'Samsung Electronics', 'Reloj inteligente con seguimiento de actividad', 92, 199.99, 159.99),
('Sony PlayStation 5', 2, 'Consola de videojuegos', 'Sony Interactive Entertainment', 'La última consola de PlayStation', 68, 499.99, 449.99),
('Asus ROG Gaming Laptop', 3, '15.6 pulgadas', 'AsusTek Computer Inc.', 'Portátil de alto rendimiento para juegos', 102, 1199.99, 999.99),
('Puma Suede Classic', 1, 'Tallas 6-13', 'Puma SE', 'Zapatillas de ante icónicas', 92, 79.99, 59.99),
('Dell Alienware Gaming PC', 2, 'Torre de juegos', 'Dell Technologies', 'PC de escritorio para juegos de alto rendimiento', 78, 1499.99, 1299.99);

select * from producto;

-- Registros gama-producto
INSERT INTO `jardinera_MAKAIA`.`gama_producto` (`gama`,`descripcion`,`imagen`) VALUES
('1', 'Gama económica de productos', 'imagen001'),
('2', 'Gama estándar de productos', 'imagen002'),
('3', 'Gama premium de productos', 'imagen003');

select * from gama_producto;

-- Registro detalle-pedido
INSERT INTO `jardinera_MAKAIA`.`detalle_pedido` (`id_pedido`,`id_producto`,`cantidad`,`precio_unidad`) VALUES
(21, 21, 5, 19.99),
(21, 22, 3, 34.99),
(21, 23, 2, 799.99),
(22, 24, 4, 699.99),
(22, 25, 2, 549.99),
(22, 26, 1, 799.99),
(23, 27, 6, 129.99),
(23, 28, 3, 79.99),
(23, 29, 2, 999.99),
(24, 30, 4, 1.49),
(24, 31, 2, 1299.99),
(24, 32, 1, 1499.99),
(25, 33, 5, 89.99),
(25, 34, 3, 449.99),
(25, 35, 2, 999.99),
(26, 36, 6, 1.49),
(26, 37, 3, 1299.99),
(26, 38, 1, 1499.99),
(27, 39, 5, 89.99),
(27, 40, 3, 449.99);

select * from detalle_pedido;

-- registros pedido
INSERT INTO `jardinera_MAKAIA`.`pedido` (`fecha_pedido`,`fecha_espera`,`fecha_entrega`,`estado`,`comentarios`,`id_cliente`
) VALUES
('2023-09-01 10:00:00', '2023-09-03 14:00:00', '2023-09-04 12:00:00', 'En proceso', 'Pedido urgente', 41),
('2023-09-02 11:30:00', '2023-09-04 15:30:00', '2023-09-05 11:30:00', 'En tránsito', NULL, 42),
('2023-09-03 12:45:00', '2023-09-05 16:45:00', '2023-09-06 13:15:00', 'Entregado', NULL, 43),
('2023-09-04 14:20:00', '2023-09-06 18:20:00', '2023-09-07 14:45:00', 'En proceso', 'Pedido regular', 44),
('2023-09-05 15:55:00', '2023-09-07 19:55:00', '2023-09-08 15:20:00', 'En tránsito', NULL, 45),
('2023-09-06 17:10:00', '2023-09-08 21:10:00', '2023-09-09 16:55:00', 'Entregado', 'Pedido urgente', 46),
('2023-09-07 18:25:00', '2023-09-09 22:25:00', '2023-09-10 17:30:00', 'En proceso', NULL, 47),
('2023-09-08 20:40:00', '2023-09-10 00:40:00', '2023-09-11 18:10:00', 'En proceso', 'Pedido regular', 48),
('2023-09-09 22:05:00', '2023-09-11 02:05:00', '2023-09-12 19:45:00', 'En tránsito', NULL, 49),
('2023-09-10 23:30:00', '2023-09-12 03:30:00', '2023-09-13 21:20:00', 'En proceso', 'Pedido urgente', 50),
('2023-09-11 01:15:00', '2023-09-13 05:15:00', '2023-09-14 22:35:00', 'En proceso', NULL, 51),
('2023-09-12 02:50:00', '2023-09-14 06:50:00', '2023-09-15 23:50:00', 'En tránsito', 'Pedido regular', 52),
('2023-09-13 04:05:00', '2023-09-15 08:05:00', '2023-09-16 20:15:00', 'En proceso', NULL, 47),
('2023-09-14 05:20:00', '2023-09-16 09:20:00', '2023-09-17 18:40:00', 'En proceso', 'Pedido urgente', 48),
('2023-09-15 06:35:00', '2023-09-17 10:35:00', '2023-09-18 17:25:00', 'Entregado', NULL, 41),
('2023-09-16 07:50:00', '2023-09-18 11:50:00', '2023-09-19 16:55:00', 'En proceso', 'Pedido regular', 42),
('2023-09-17 09:05:00', '2023-09-19 13:05:00', '2023-09-20 15:30:00', 'En tránsito', NULL, 43),
('2023-09-18 10:20:00', '2023-09-20 14:20:00', '2023-09-21 14:15:00', 'En proceso', 'Pedido regular', 49),
('2023-09-19 11:35:00', '2023-09-21 15:35:00', '2023-09-22 12:50:00', 'En proceso', NULL, 50),
('2023-09-20 12:50:00', '2023-09-22 16:50:00', '2023-09-23 11:05:00', 'Entregado', 'Pedido urgente', 45);

select * from pedido;



