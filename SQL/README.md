# FreshMart Retail Insights Project

## Overview
FreshMart is a comprehensive SQL database project designed to manage retail operations for a fresh produce and grocery store. This project demonstrates database design, data manipulation, and business intelligence reporting.

## Project Structure

### Database: FreshMart

#### Tables

1. **Categories**
   - `category_id` (INT, PRIMARY KEY, AUTO_INCREMENT)
   - `category_name` (VARCHAR(50))
   - Stores product categories like Fruits, Dairy, Snacks, Beverages

2. **Products**
   - `product_id` (INT, PRIMARY KEY, AUTO_INCREMENT)
   - `product_name` (VARCHAR(100))
   - `category_id` (INT, FOREIGN KEY)
   - `price` (DECIMAL(10,2))
   - `stock_count` (INT)
   - `expiry_date` (DATE)
   - Stores product details with inventory and expiry tracking

3. **SalesTransactions**
   - `transaction_id` (INT, PRIMARY KEY, AUTO_INCREMENT)
   - `product_id` (INT, FOREIGN KEY)
   - `quantity_sold` (INT)
   - `total_amount` (DECIMAL(10,2))
   - `sale_date` (DATE)
   - Records all sales transactions for analytics

## Features

### Sample Data
- 4 pre-defined product categories
- 7 sample products with pricing and expiry dates
- 8 sales transaction records

### Business Intelligence Reports

1. **Expiring Products Report**
   - Identifies products expiring within the next 7 days
   - Filters products with stock count > 50
   - Useful for inventory management and promotional planning

2. **Dead Stock Analysis**
   - Finds products with no sales in the last 60 days
   - Helps identify slow-moving inventory
   - Supports decision-making for stock clearance

3. **Category Revenue Report**
   - Calculates total revenue by category for the previous month
   - Sorted by revenue in descending order
   - Supports business performance analysis

## How to Use

1. **Create the Database:**
   ```sql
   CREATE DATABASE FreshMart;
   USE FreshMart;
   ```

2. **Run the Script:**
   - Execute all CREATE TABLE statements to set up the schema
   - Execute all INSERT statements to populate sample data

3. **Run Reports:**
   - Execute any of the SELECT statements to generate business insights

## Technology Stack
- **Database:** MySQL
- **Language:** SQL
- **Concepts:** Relational Database Design, Joins, Aggregations, Date Functions

## Use Cases
- Inventory management and expiry tracking
- Sales performance analysis
- Product category profitability analysis
- Dead stock identification
- Retail business insights

## Author
Created as part of Virtusa Mini Projects

## License
Open source - Feel free to use and modify
