#Table 1: jewelry_items

CREATE TABLE jewelry_items (
    item_id INT PRIMARY KEY,
    item_name VARCHAR(255) NOT NULL,
    category VARCHAR(100),
    price DECIMAL(10, 2) NOT NULL
);

#Table 2: jewelry_sales

CREATE TABLE jewelry_sales (
    sale_id INT PRIMARY KEY,
    item_id INT NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(5, 2) DEFAULT 0,
    sale_date DATE NOT NULL,
    FOREIGN KEY (item_id) REFERENCES jewelry_items(item_id)
);

#Insert Data into jewelry_items
INSERT INTO jewelry_items (item_id, item_name, category, price)
VALUES
(1, 'Diamond Ring', 'Ring', 5000.00),
(2, 'Gold Necklace', 'Necklace', 3000.00),
(3, 'Emerald Earrings', 'Earrings', 1500.00),
(4, 'Platinum Bracelet', 'Bracelet', 2500.00);

#Insert Data into jewelry_sales
INSERT INTO jewelry_sales (sale_id, item_id, quantity, discount, sale_date)
VALUES
(101, 1, 2, 10, '2025-01-01'),
(102, 2, 1, 5, '2025-01-03'),
(103, 3, 4, 15, '2025-01-05'),
(104, 4, 3, 20, '2025-01-07');

#Pricing Analysis (Rounded)
SELECT
    s.sale_id,
    i.item_name,
    i.category,
    i.price AS original_price,
    s.quantity,
    s.discount,
    ROUND(i.price - (i.price * s.discount / 100), 2) AS discounted_price_per_item,
    ROUND((i.price - (i.price * s.discount / 100)) * s.quantity, 2) AS total_sale_revenue,
    s.sale_date
FROM
    jewelry_sales s
JOIN
    jewelry_items i
ON
    s.item_id = i.item_id
ORDER BY
    s.sale_date;


#Category-Wise Revenue Analysis (Rounded)
SELECT
    i.category,
    ROUND(SUM((i.price - (i.price * s.discount / 100)) * s.quantity), 2) AS total_revenue
FROM
    jewelry_sales s
JOIN
    jewelry_items i
ON
    s.item_id = i.item_id
GROUP BY
    i.category
ORDER BY
    total_revenue DESC;

#Top-Selling Items (Rounded)
SELECT
    i.item_name,
    SUM(s.quantity) AS total_sold,
    ROUND(SUM((i.price - (i.price * s.discount / 100)) * s.quantity), 2) AS total_revenue
FROM
    jewelry_sales s
JOIN
    jewelry_items i
ON
    s.item_id = i.item_id
GROUP BY
    i.item_name
ORDER BY
    total_sold DESC;

#Monthly Sales Analysis (Rounded)
SELECT
    EXTRACT(MONTH FROM s.sale_date) AS sale_month,
    ROUND(SUM((i.price - (i.price * s.discount / 100)) * s.quantity), 2) AS monthly_revenue
FROM
    jewelry_sales s
JOIN
    jewelry_items i
ON
    s.item_id = i.item_id
GROUP BY
    sale_month
ORDER BY
    sale_month;

