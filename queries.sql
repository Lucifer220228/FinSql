--每部影集被租借了幾次
SELECT s.title, COUNT(r.rental_id) AS rental_count
FROM Series s
LEFT JOIN Rentals r ON s.series_id = r.series_id
GROUP BY s.series_id, s.title
ORDER BY rental_count DESC;

--每位使用者總罰金
SELECT u.name, u.email, SUM(p.amount) AS total_penalty
FROM Users u
JOIN Rentals r ON u.user_id = r.user_id
JOIN Penalties p ON r.rental_id = p.rental_id
GROUP BY u.user_id
ORDER BY total_penalty DESC;

--建立 VIEW：熱門影集排行榜（租借次數 >= 2）
CREATE VIEW HotSeries AS
SELECT s.series_id, s.title, COUNT(r.rental_id) AS rental_count
FROM Series s
JOIN Rentals r ON s.series_id = r.series_id
GROUP BY s.series_id, s.title
HAVING COUNT(r.rental_id) >= 2;
