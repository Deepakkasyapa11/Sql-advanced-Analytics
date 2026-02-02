-- schema/advanced_init.sql

CREATE TABLE customers (
    id INTEGER PRIMARY KEY,
    name TEXT,
    referred_by_id INTEGER, -- For Recursive CTEs
    signup_date DATE,
    FOREIGN KEY (referred_by_id) REFERENCES customers(id)
);

CREATE TABLE orders (
    id INTEGER PRIMARY KEY,
    customer_id INTEGER,
    order_date DATE,
    amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(id)
);

-- Seed Data (Referral Tree: 1 -> 2 -> 3)
INSERT INTO customers (id, name, referred_by_id, signup_date) VALUES 
(1, 'Tech Lead', NULL, '2024-01-01'),
(2, 'Senior Dev', 1, '2024-02-01'),
(3, 'Junior Dev', 2, '2024-03-01'),
(4, 'Staff Eng', NULL, '2024-01-05');

INSERT INTO orders (customer_id, order_date, amount) VALUES 
(1, '2024-01-10', 500), (1, '2024-02-10', 200),
(2, '2024-02-15', 300), (3, '2024-03-20', 150),
(4, '2024-01-20', 1000);