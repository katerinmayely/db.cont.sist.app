------------------------------------------------ SENTENCIAS
ALTER TABLE proyecto_expertos.activation_codes
DROP COLUMN actived_at;

ALTER TABLE proyecto_expertos.transactions ADD current_balance DECIMAL(10,2);
ALTER TABLE proyecto_expertos.users ALTER COLUMN actived_at DATETIME;

ALTER TABLE proyecto_expertos.accounts ADD user_id INT FOREIGN KEY (user_id) REFERENCES proyecto_expertos.users(id)

DROP PROCEDURE proyecto_expertos.generate_activation_code;

SELECT * FROM proyecto_expertos.activation_codes;
SELECT * FROM proyecto_expertos.USERS;

update proyecto_expertos.transactions set current_balance = 1000, total = 5000 where email = 'kattsambula@gmail.com' 

TRUNCATE TABLE proyecto_expertos.activation_codes
DELETE FROM proyecto_expertos.users

select active from proyecto_expertos.users where email = 'kattsambula@gmail.com';

SELECT GETDATE() AS fecha

SELECT DATEDIFF(MINUTE, actived_at, GETDATE()) AS timeTrans
FROM proyecto_expertos.users
WHERE email = 'katerinmayely@gmail.com';

select * from proyecto_expertos.transaction_tags
select * from proyecto_expertos.tags
select * from proyecto_expertos.transaction_tags

SELECT T.id, T.name
                    FROM proyecto_expertos.transaction_tags TT
                    LEFT JOIN proyecto_expertos.tags T ON TT.tag_id = T.id
                    LEFT JOIN proyecto_expertos.transactions TR ON TT.transaction_id = TR.id
                    WHERE 1 = 1
                    AND TR.user_id = 63

SELECT TT.tag_id, name, COUNT(*) AS transactions
FROM proyecto_expertos.transaction_tags TT
INNER JOIN proyecto_expertos.tags T ON TT.tag_id = T.id
INNER JOIN proyecto_expertos.transactions TR ON TT.transaction_id = TR.id
WHERE TR.user_id = 63
GROUP BY tag_id, name