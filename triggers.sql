--建立 Trigger（每次更新 Rentals.return_date，如果晚於 due_date → 新增罰金）
CREATE TRIGGER after_return_date_update
AFTER UPDATE ON Rentals
FOR EACH ROW
BEGIN
    IF NEW.return_date IS NOT NULL AND NEW.return_date > NEW.due_date THEN
        INSERT INTO Penalties (rental_id, amount, reason)
        VALUES (NEW.rental_id, 20.00, 'Late return (trigger)');
    END IF;
END ;

-- 模擬更新 return_date 晚於 due_date，Trigger 會自動新增罰金
UPDATE Rentals SET return_date = '2024-06-20' WHERE rental_id = 2;
