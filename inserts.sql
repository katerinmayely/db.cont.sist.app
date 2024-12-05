-- Obtener el ID del usuario basado en el correo electrónico
DECLARE @UserId INT;
SELECT @UserId = id FROM proyecto_expertos.users WHERE email = 'katerinmayely@gmail.com';

-- Insertar las cuentas
INSERT INTO proyecto_expertos.accounts (account_name, total, user_id)
VALUES ('Banco Atlántida', 5000, @UserId);
INSERT INTO proyecto_expertos.accounts (account_name, total, user_id)
VALUES ('Banco de Occidente', 5000, @UserId);
INSERT INTO proyecto_expertos.accounts (account_name, total, user_id)
VALUES ('BAC', 5000, @UserId);
INSERT INTO proyecto_expertos.accounts (account_name, total, user_id)
VALUES ('Efectivo', 5000, @UserId);

-- Insertar etiquetas
INSERT INTO proyecto_expertos.tags (name)
VALUES ('vacaciones');
INSERT INTO proyecto_expertos.tags (name)
VALUES ('cena familiar');
INSERT INTO proyecto_expertos.tags (name)
VALUES ('visita a la abuela');
INSERT INTO proyecto_expertos.tags (name)
VALUES ('chequeo medico');
INSERT INTO proyecto_expertos.tags (name)
VALUES ('universidad');

-- Insertar transacciones
-- Transacción 1
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-01', 
    'Pago de vacaciones', 
    500.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'Banco Atlántida'), 
    @UserId
);

-- Transacción 2
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-01', 
    'Cena familiar', 
    150.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'Banco de Occidente'), 
    @UserId
);

-- Transacción 3
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-01', 
    'Visita a la abuela', 
    80.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'BAC'), 
    @UserId
);

-- Transacción 4
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-01', 
    'Chequeo médico', 
    120.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'Efectivo'), 
    @UserId
);

-- Transacción 5
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-01', 
    'Pago universidad', 
    200.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'Banco Atlántida'), 
    @UserId
);

-- Transacción 6
INSERT INTO proyecto_expertos.transactions (transaction_date, description, amount, account_id, user_id)
VALUES (
    '2024-12-04', 
    'Pago repo', 
    100.00, 
    (SELECT id FROM proyecto_expertos.accounts WHERE account_name = 'Banco Atlántida'), 
    @UserId
);
-- Relacionar las etiquetas con las transacciones
-- Etiquetas para la transacción de "Pago de repo"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Pago repo' AND user_id = 63),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'universidad')
);

INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Pago repo' AND user_id = 63),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'vacaciones')
);

-- Etiquetas para la transacción de "Pago de vacaciones"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Pago de vacaciones' AND user_id = @UserId),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'vacaciones')
);

INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Pago de vacaciones' AND user_id = 63),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'cena familiar')
);

-- Etiquetas para la transacción de "Cena familiar"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Cena familiar' AND user_id = @UserId),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'cena familiar')
);

-- Etiquetas para la transacción de "Visita a la abuela"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Visita a la abuela' AND user_id = @UserId),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'visita a la abuela')
);

-- Etiquetas para la transacción de "Chequeo médico"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Chequeo médico' AND user_id = @UserId),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'chequeo medico')
);

-- Etiquetas para la transacción de "Pago universidad"
INSERT INTO proyecto_expertos.transaction_tags (transaction_id, tag_id)
VALUES (
    (SELECT id FROM proyecto_expertos.transactions WHERE description = 'Pago universidad' AND user_id = @UserId),
    (SELECT id FROM proyecto_expertos.tags WHERE name = 'universidad')
);