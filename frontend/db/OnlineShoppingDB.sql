CREATE DATABASE OnlineShoppingDB;
USE OnlineShoppingDB;

-- USER TABLE
CREATE TABLE User (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL,
    phone VARCHAR(15),
    date_joined DATE
);

-- ADMIN TABLE
CREATE TABLE Admin (
    admin_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(100) NOT NULL
);

-- PRODUCT TABLE
CREATE TABLE Product (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    discount DECIMAL(5,2),
    stock INT,
    image_url VARCHAR(255),
    category VARCHAR(255)
);

-- ORDER TABLE
CREATE TABLE `Order`  (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    total_amount DECIMAL(10,2),
    order_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
);

-- ORDER ITEM TABLE
CREATE TABLE OrderItem (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES `Order` (order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- INSERT USERS
INSERT INTO User (name, email, password, phone, date_joined) VALUES
('Alice Sharma', 'alice@gmail.com', 'alice123', '9876543210', '2023-01-10'),
('Rohit Verma', 'rohit@gmail.com', 'rohit123', '9123456780', '2023-02-12'),
('Priya Singh', 'priya@gmail.com', 'priya123', '9988776655', '2023-03-05'),
('Manish Gupta', 'manish@gmail.com', 'manish123', '9876500011', '2023-04-15'),
('Sneha Kapoor', 'sneha@gmail.com', 'sneha123', '9112233445', '2023-05-20'),
('Vikas Jain', 'vikas@gmail.com', 'vikas123', '9822112233', '2023-06-01'),
('Neha Reddy', 'neha@gmail.com', 'neha123', '9776655443', '2023-07-03'),
('Kunal Mehta', 'kunal@gmail.com', 'kunal123', '9888877766', '2023-08-10'),
('Divya Patel', 'divya@gmail.com', 'divya123', '9556677889', '2023-09-05'),
('Arjun Nair', 'arjun@gmail.com', 'arjun123', '9665544332', '2023-10-01');

-- INSERT ADMINS
INSERT INTO Admin (name, email, password) VALUES
('Super Admin', 'admin1@gmail.com', 'admin123'),
('Content Moderator', 'admin2@gmail.com', 'mod123'),
('Finance Admin', 'finance@gmail.com', 'fin123'),
('Tech Admin', 'techadmin@gmail.com', 'tech123'),
('HR Admin', 'hr@gmail.com', 'hr123'),
('Sales Admin', 'sales@gmail.com', 'sales123'),
('Inventory Admin', 'inventory@gmail.com', 'inv123'),
('Customer Care', 'support@gmail.com', 'support123'),
('Legal Admin', 'legal@gmail.com', 'legal123'),
('Marketing Admin', 'marketing@gmail.com', 'market123');

-- INSERT PRODUCTS (using the same images shown on the UI)
INSERT INTO Product (name, price, discount, stock, image_url, category) VALUES
('Casual T-Shirt', 500.00, 15.00, 120, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Formal Shirt', 1200.00, 10.00, 80, 'https://images.unsplash.com/photo-1520975429432-7b30f6e6f927?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Denim Jeans', 2000.00, 12.00, 60, 'https://images.unsplash.com/photo-1503342217505-b0a15cf70489?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Summer Dress', 1800.00, 8.00, 70, 'https://images.unsplash.com/photo-1520974735194-9e0ce827c014?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Hoodie', 1500.00, 10.00, 90, 'https://images.unsplash.com/photo-1513377882215-6a5d71ed7f09?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Jacket', 3500.00, 15.00, 50, 'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Saree', 2500.00, 5.00, 40, 'https://images.unsplash.com/photo-1600635926720-64318a0f9b07?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kurta Set', 2200.00, 10.00, 55, 'https://images.unsplash.com/photo-1580654243920-61ab681f0a4b?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Sneakers', 3000.00, 20.00, 100, 'https://images.unsplash.com/photo-1519744792095-2f2205e87b6f?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Sandals', 1200.00, 12.00, 75, 'https://images.unsplash.com/photo-1520975922993-6e04a0bd0bfc?q=80&w=1200&auto=format&fit=crop', 'Footwear');

-- ADDITIONAL PRODUCTS (Men)
INSERT INTO Product (name, price, discount, stock, image_url, category) VALUES
('Checked Shirt', 1299.00, 10.00, 80, 'https://images.unsplash.com/photo-1541099649105-f69ad21f3246?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Casual Chinos', 1599.00, 8.00, 70, 'https://images.unsplash.com/photo-1516826957135-700dedea698c?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Graphic Tee', 799.00, 15.00, 120, 'https://images.unsplash.com/photo-1521337586325-6bfe10ce785f?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Bomber Jacket', 2999.00, 20.00, 50, 'https://images.unsplash.com/photo-1495121605193-b116b5b09a42?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Running Shoes', 3499.00, 25.00, 90, 'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Slim Fit Jeans', 2099.00, 12.00, 60, 'https://images.unsplash.com/photo-1503342217505-b0a15cf70489?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Polo T-Shirt', 999.00, 10.00, 110, 'https://images.unsplash.com/photo-1583743814966-8936f5b7be1a?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Denim Jacket', 3299.00, 18.00, 55, 'https://images.unsplash.com/photo-1503341455253-b2e723bb3dbb?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Formal Trousers', 1899.00, 10.00, 75, 'https://images.unsplash.com/photo-1582738412003-fc01f3273fe2?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Leather Loafers', 2799.00, 15.00, 65, 'https://images.unsplash.com/photo-1580984969071-1af9da6afdd1?q=80&w=1200&auto=format&fit=crop', 'Footwear');

-- ADDITIONAL PRODUCTS (Women)
INSERT INTO Product (name, price, discount, stock, image_url, category) VALUES
('Floral Dress', 1999.00, 20.00, 70, 'https://images.unsplash.com/photo-1519741497674-611481863552?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Party Heels', 2499.00, 18.00, 80, 'https://images.unsplash.com/photo-1520974735194-9e0ce827c014?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Kurti Set', 2299.00, 12.00, 55, 'https://images.unsplash.com/photo-1580654243920-61ab681f0a4b?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Elegant Saree', 2599.00, 10.00, 40, 'https://images.unsplash.com/photo-1600635926720-64318a0f9b07?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Denim Skirt', 1399.00, 10.00, 65, 'https://images.unsplash.com/photo-1520975922371-1b309c0a87ae?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Casual Top', 899.00, 8.00, 120, 'https://images.unsplash.com/photo-1520975429432-7b30f6e6f927?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Ankle Boots', 2799.00, 20.00, 70, 'https://images.unsplash.com/photo-1517777596323-6e3c6c1f1b47?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Straight Jeans', 1999.00, 10.00, 60, 'https://images.unsplash.com/photo-1503342217505-b0a15cf70489?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Evening Gown', 3499.00, 22.00, 45, 'https://images.unsplash.com/photo-1512436991641-6745cdb1723f?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Women Blazer', 2899.00, 14.00, 50, 'https://images.unsplash.com/photo-1521335629791-ce4aec67dd47?q=80&w=1200&auto=format&fit=crop', 'Clothing');

-- ADDITIONAL PRODUCTS (Kids)
INSERT INTO Product (name, price, discount, stock, image_url, category) VALUES
('Kids T-Shirt', 599.00, 10.00, 120, 'https://images.unsplash.com/photo-1519235106638-30cc49f0b417?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Dress', 1299.00, 12.00, 90, 'https://images.unsplash.com/photo-1530253132539-1c1df2b4d1a5?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Sneakers', 1499.00, 15.00, 100, 'https://images.unsplash.com/photo-1519744792095-2f2205e87b6f?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Kids Hoodie', 999.00, 10.00, 110, 'https://images.unsplash.com/photo-1591047139829-d91aecb6caea?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Shorts', 699.00, 8.00, 130, 'https://images.unsplash.com/photo-1520975922993-6e04a0bd0bfc?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Sandals', 899.00, 12.00, 100, 'https://images.unsplash.com/photo-1544620347-c4fd4a3d5957?q=80&w=1200&auto=format&fit=crop', 'Footwear'),
('Kids Jacket', 1799.00, 10.00, 60, 'https://images.unsplash.com/photo-1618354691438-b6f1bb111f58?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Joggers', 1199.00, 10.00, 100, 'https://images.unsplash.com/photo-1593032457866-4ad8eb49c1a4?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Kurta Set', 1199.00, 10.00, 80, 'https://images.unsplash.com/photo-1593032457892-9f0c7d4f1c85?q=80&w=1200&auto=format&fit=crop', 'Clothing'),
('Kids Track Shoes', 1399.00, 12.00, 90, 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?q=80&w=1200&auto=format&fit=crop', 'Footwear');

-- INSERT ORDERS
INSERT INTO `Order`  (user_id, order_date, total_amount, status) VALUES
(1, '2025-08-01', 1400.00, 'Completed'),
(2, '2025-08-02', 900.00, 'Pending'),
(3, '2025-08-03', 1800.00, 'Shipped'),
(1, '2025-08-04', 750.00, 'Completed'),
(4, '2025-08-05', 2100.00, 'Cancelled'),
(5, '2025-08-06', 1200.00, 'Completed'),
(2, '2025-08-07', 600.00, 'Shipped'),
(3, '2025-08-08', 3200.00, 'Completed'),
(4, '2025-08-09', 450.00, 'Pending'),
(5, '2025-08-10', 2750.00, 'Completed');

-- INSERT ORDER ITEMS
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 1400.00),
(2, 3, 1, 900.00), 
(3, 5, 3, 1800.00),
(4, 7, 1, 750.00),
(5, 9, 2, 2100.00),
(6, 2, 2, 1200.00),
(7, 4, 1, 600.00),
(8, 6, 4, 3200.00),
(9, 8, 1, 450.00),
(10, 10, 5, 2750.00);
