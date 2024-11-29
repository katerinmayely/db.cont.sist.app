CREATE TABLE proyecto_expertos.users(
    id INT PRIMARY KEY IDENTITY,
    email VARCHAR(50) NOT NULL,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    register_date DATE
)
GO

CREATE UNIQUE NONCLUSTERED INDEX INDX_Email ON proyecto_expertos.users(email);
GO

CREATE TABLE proyecto_expertos.activation_codes(
    id INT PRIMARY KEY IDENTITY,
    email VARCHAR(50) NOT NULL,
    code INT NULL,
    created_at DATETIME DEFAULT GETDATE(),
    expired_at DATETIME NULL DEFAULT DATEADD(DAY, (2), GETDATE())

    CONSTRAINT FK_EMAIL FOREIGN KEY (email) REFERENCES proyecto_expertos.users (email)
)
GO

CREATE PROCEDURE proyecto_expertos.create_user
    @Email NVARCHAR(255),
    @FirstName NVARCHAR(100),
    @LastName NVARCHAR(100)
AS
BEGIN
    SET NOCOUNT ON;

    -- Verificar si el email ya existe
    IF EXISTS (SELECT 1 FROM users WHERE email = @Email)
    BEGIN
        RAISERROR('El email ya está registrado.', 16, 1);
        RETURN;
    END

    -- Insertar el nuevo usuario
    INSERT INTO users (email, firstname, lastname, register_date)
    VALUES (@Email, @FirstName, @LastName, GETDATE());
END;
GO

CREATE PROCEDURE proyecto_expertos.generate_activation_code
    @email NVARCHAR(255),
    @code INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @N INT = ( SELECT COUNT(*) FROM proyecto_expertos.users WHERE email = @email );

    IF @N > 0
    BEGIN
        INSERT INTO proyecto_expertos.activation_codes ( email, code ) VALUES ( @email, @code );
    END

    SELECT 1 AS completed;

END;
GO

DROP PROCEDURE proyecto_expertos.generate_activation_code;

SELECT * FROM proyecto_expertos.activation_codes;
SELECT * FROM proyecto_expertos.users;

update proyecto_expertos.users set active = 1  

TRUNCATE TABLE proyecto_expertos.activation_codes
DELETE FROM proyecto_expertos.users

ALTER TABLE proyecto_expertos.users ADD active BIT DEFAULT 0;

exec proyecto_expertos.generate_activation_code @email = "correo@correo.com", @code = 243;