--建立 Stored Procedure
CREATE PROCEDURE GetUserTotalPenalty(IN userEmail VARCHAR(100))
BEGIN
    SELECT u.name, SUM(p.amount) AS total_penalty
    FROM Users u
    JOIN Rentals r ON u.user_id = r.user_id
    JOIN Penalties p ON r.rental_id = p.rental_id
    WHERE u.email = userEmail
    GROUP BY u.user_id;
END ;

--呼叫範例
CALL GetUserTotalPenalty('alice01@example.com');