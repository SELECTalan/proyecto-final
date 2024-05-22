USE                      equipo_de_futbol_bastardmunchen;

DELIMITER $$
CREATE TRIGGER Audit_Jugadores
AFTER INSERT ON JUGADORES
FOR EACH ROW
BEGIN
    INSERT INTO Auditoria_Jugadores (accion, jugador_id, fecha)
    VALUES ('INSERCION', NEW.JUGADORID, NOW());
END $$
DELIMITER ;
 
DELIMITER $$
CREATE TRIGGER Limite_Salario
BEFORE INSERT ON JUGADORES
FOR EACH ROW
BEGIN
    DECLARE salario_maximo DECIMAL(10,2);
    SET salario_maximo = 10000000.00;
    
    IF NEW.SALARIO > salario_maximo THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El salario excede el límite permitido';
    END IF;
END $$
DELIMITER ;