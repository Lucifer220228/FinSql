-- 使用者
CREATE TABLE Users (
  user_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL,
  register_date DATE DEFAULT CURRENT_DATE
);

-- 影集
CREATE TABLE Series (
  series_id INT AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(100) NOT NULL,
  director VARCHAR(50),
  release_year INT
);

-- 類別
CREATE TABLE Genres (
  genre_id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL
);

-- 多對多：影集與類別
CREATE TABLE SeriesGenres (
  series_id INT,
  genre_id INT,
  PRIMARY KEY (series_id, genre_id),
  FOREIGN KEY (series_id) REFERENCES Series(series_id),
  FOREIGN KEY (genre_id) REFERENCES Genres(genre_id)
);

-- 租借紀錄
CREATE TABLE Rentals (
  rental_id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT,
  series_id INT,
  rent_date DATE NOT NULL,
  due_date DATE NOT NULL,
  return_date DATE,
  FOREIGN KEY (user_id) REFERENCES Users(user_id),
  FOREIGN KEY (series_id) REFERENCES Series(series_id)
);

-- 罰金
CREATE TABLE Penalties (
  penalty_id INT AUTO_INCREMENT PRIMARY KEY,
  rental_id INT,
  amount DECIMAL(5,2) NOT NULL,
  reason VARCHAR(100),
  FOREIGN KEY (rental_id) REFERENCES Rentals(rental_id)
);
