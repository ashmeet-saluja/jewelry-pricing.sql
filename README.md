# 📜 Jewelry Sales Database

## 📌 Overview
This project contains a relational database for managing jewelry items and sales transactions. It includes structured tables, sample data, and various SQL queries for analyzing sales performance.

## 🛠️ Database Schema

### 📋 Table 1: `jewelry_items`
Stores details of different jewelry items available for sale.

- `item_id` (INT, PRIMARY KEY): Unique identifier for each item.
- `item_name` (VARCHAR): Name of the jewelry item.
- `category` (VARCHAR): Type of jewelry (e.g., Ring, Necklace, Earrings, Bracelet).
- `price` (DECIMAL): Price of the item.

### 📋 Table 2: `jewelry_sales`
Records sales transactions for jewelry items.

- `sale_id` (INT, PRIMARY KEY): Unique sale transaction ID.
- `item_id` (INT, FOREIGN KEY): References `jewelry_items.item_id`.
- `quantity` (INT): Number of items sold.
- `discount` (DECIMAL): Discount applied (in percentage).
- `sale_date` (DATE): Date of the sale.

## 🔢 Data Insertion
Sample data has been inserted into both tables for demonstration purposes.

## 📊 SQL Queries for Analysis

1. **Pricing Analysis:** Calculates discounted prices and total revenue per sale.
2. **Category-Wise Revenue Analysis:** Summarizes total revenue per category.
3. **Top-Selling Items:** Identifies best-selling jewelry based on quantity and revenue.
4. **Monthly Sales Analysis:** Aggregates revenue on a monthly basis.

## ⚖️ License
This project is licensed under the MIT License. Feel free to use, modify, and distribute it. ✨

## 📧 Contact
For any questions or contributions, reach out via email at `salujaashmeet179@gmail.com`.
