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


-- INSERT ADMINS
INSERT INTO Admin (name, email, password) VALUES
('Super Admin', 'admin1@gmail.com', 'admin123'),
('Content Moderator', 'admin2@gmail.com', 'mod123'),
('Finance Admin', 'finance@gmail.com', 'fin123'),
('Tech Admin', 'techadmin@gmail.com', 'tech123'),
('HR Admin', 'hr@gmail.com', 'hr123'),



-- 5 MEN'S CLOTHING
INSERT INTO Product (product_id, name, price, discount, stock, image_url, category) VALUES
(1, 'Casual T-Shirt (Blue)', 500.00, 15.00, 120, 'https://images.pexels.com/photos/428338/pexels-photo-428338.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 'Clothing'),
(2, 'Formal Shirt (White)', 1200.00, 10.00, 80, 'https://uspoloassn.in/cdn/shop/files/1_14b5a2b0-345e-4106-a935-597edfbdde1a.jpg', 'Clothing'),
(3, 'Denim Jeans (Regular Fit)', 2000.00, 12.00, 60, 'https://m.media-amazon.com/images/I/91el-HjR+YL._UY1100_.jpg', 'Clothing'),
(4, 'Hoodie (Grey)', 1500.00, 10.00, 90, 'https://m.media-amazon.com/images/I/71EfXs5jxUL._UY1100_.jpg', 'Clothing'),
(5, 'Bomber Jacket (Olive)', 2999.00, 20.00, 50, 'https://encrypted-tbn0.gstatic.com/shopping?q=tbn:ANd9GcRKodNXHcAsllrQ3gq6skmfgxRtGrD50J3WgIj_XH7axlnlusZo_QMZ7_rlcuAKpUwJXUF9L3lLPnvWacKwFjcrJdUzSYlRXZw6VjNSm5RA', 'Clothing');

-- 5 WOMEN'S CLOTHING
INSERT INTO Product (product_id, name, price, discount, stock, image_url, category) VALUES
(6, 'Summer Dress (Floral)', 1800.00, 8.00, 70, 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcTAL43F-68WMizDeDzUsPT7t4eqtrscABnhkneCL72Lf_pL5Nhhe033Xupafb4VfZf_FfKOZYWbYYbYkOKK6Xew5cjD5uVwrkd6CXOzsQZ9frsJNLoMzAPP', 'Clothing'),
(7, 'Elegant Saree (Georgette)', 2599.00, 10.00, 40, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRa0OjBeWKsVXfIASzQDfCAGM2IFZhM1186kA&s', 'Clothing'),
(8, 'Kurti Set (Embroidered)', 2299.00, 12.00, 55, 'https://staticm247.kalkifashion.com/media/catalog/product/p/i/pink_embroidered_kurti_set_with_butti_work_on-sg273342_6_.jpg?w=500', 'Clothing'),
(9, 'Casual Top (Striped)', 899.00, 8.00, 120, 'https://media.landmarkshops.in/cdn-cgi/image/h=730,w=540,q=85,fit=cover/max-new/1000014161406-Beige-IVORY-1000014161406_01-2100.jpg', 'Clothing'),
(10, 'Evening Gown (Red)', 3499.00, 22.00, 45, 'https://www.jovani.com/wp-content/uploads/06538-RED-205-scaled.jpg', 'Clothing');

-- 5 FOOTWEAR
INSERT INTO Product (product_id, name, price, discount, stock, image_url, category) VALUES
(11, 'Sneakers (White/Black)', 3000.00, 20.00, 100, 'https://images.pexels.com/photos/267320/pexels-photo-267320.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 'Footwear'),
(12, 'Sandals (Brown Leather)', 1200.00, 12.00, 75, 'https://bugattishoes.in/cdn/shop/files/328-AJ482-1100-6100_008.jpg?crop=center&height=1080&v=1746782374&width=1080', 'Footwear'),
(13, 'Running Shoes (Performance)', 3499.00, 25.00, 90, 'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2', 'Footwear'),
(14, 'Party Heels (Stiletto)', 2499.00, 18.00, 80, 'https://m.media-amazon.com/images/I/711ZtOPi8SL._UY1000_.jpg', 'Footwear'),
(15, 'Ankle Boots (Suede)', 2799.00, 20.00, 70, 'https://img.tatacliq.com/images/i20//658Wx734H/MP000000024244231_658Wx734H_202410290648471.jpeg', 'Footwear');




-- INSERT ORDERS

INSERT INTO `Order` (user_id, order_date, total_amount, status) VALUES
(1, '2025-08-01', 1000.00, 'Completed'), -- (2 * Product 1 Price)
(2, '2025-08-02', 2000.00, 'Pending'),   -- (1 * Product 3 Price)
(3, '2025-08-03', 8997.00, 'Shipped'),   -- (3 * Product 5 Price)
(1, '2025-08-04', 2599.00, 'Completed'), -- (1 * Product 7 Price)
(4, '2025-08-05', 6000.00, 'Cancelled'), -- (2 * Product 11 Price)
(5, '2025-08-06', 2400.00, 'Completed'), -- (2 * Product 2 Price)
(2, '2025-08-07', 1800.00, 'Shipped'),   -- (1 * Product 6 Price)
(3, '2025-08-08', 6000.00, 'Completed'), -- (4 * Product 4 Price)
(4, '2025-08-09', 2299.00, 'Pending'),   -- (1 * Product 8 Price)
(5, '2025-08-10', 6000.00, 'Completed'); -- (5 * Product 12 Price)

-- INSERT ORDER ITEMS
INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES
(1, 1, 2, 500.00),     -- Casual T-Shirt (ID 1)
(2, 3, 1, 2000.00),    -- Denim Jeans (ID 3)
(3, 5, 3, 2999.00),    -- Bomber Jacket (ID 5)
(4, 7, 1, 2599.00),    -- Elegant Saree (ID 7)
(5, 11, 2, 3000.00),   -- Sneakers (ID 11)
(6, 2, 2, 1200.00),    -- Formal Shirt (ID 2)
(7, 6, 1, 1800.00),    -- Summer Dress (ID 6)
(8, 4, 4, 1500.00),    -- Hoodie (ID 4)
(9, 8, 1, 2299.00),    -- Kurti Set (ID 8)
(10, 12, 5, 1200.00);  -- Sandals (ID 12)
