CREATE TABLE IF NOT EXISTS resources (
    id INT AUTO_INCREMENT PRIMARY KEY,
    contributor VARCHAR(100),
    title VARCHAR(255),
    department VARCHAR(100),
    course VARCHAR(100),
    filename VARCHAR(255),
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);