# Health Insurance Cross-Sell Prediction – SQL Analysis

This project is based on the **Health Insurance Cross-Sell Prediction** dataset, originally available on Kaggle. The goal is to analyze customer data to identify those likely to be interested in vehicle insurance.

## 📁 Tables Included

1. **train**
   - Contains customer demographic data, vehicle details, and response to previous insurance offers.
2. **test**
   - Contains similar data as `train`, but without the response column.
3. **sample_submission**
   - Used for Kaggle competition format – includes predicted responses.

## 🧩 Schema Overview

### train/test Table Columns:

| Column               | Data Type | Description                                 |
|----------------------|-----------|---------------------------------------------|
| id                   | INT       | Customer ID                                 |
| gender               | VARCHAR   | Gender of the customer                      |
| age                  | INT       | Age in years                                |
| driving_license      | BOOLEAN   | 1 if has a license                          |
| region_code          | FLOAT     | Encoded region                              |
| previously_insured   | BOOLEAN   | 1 if already insured                        |
| vehicle_age          | VARCHAR   | Age of vehicle (`< 1 Year`, `1-2 Year`)     |
| vehicle_damage       | BOOLEAN   | 1 if vehicle was damaged                    |
| annual_premium       | FLOAT     | Yearly premium in currency units            |
| policy_sales_channel | FLOAT     | Encoded sales channel                       |
| vintage              | INT       | Days customer has been associated           |
| response             | BOOLEAN   | (train only) 1 if customer is interested    |

## 📊 SQL Analysis Performed

- Interested vs Uninterested customers
- Average premium by interest
- Interest rate by gender
- Vehicle damage vs response behavior
- Vehicle age group analysis
- Top regions by interest rate
- Top 10 policy sales channels
- Average premium by vehicle damage

## 🧪 Compatibility

✅ MySQL Workbench  
✅ PostgreSQL (minor syntax changes available)

## 🚀 How to Use

1. Import the `.sql` file into your database.
2. Use the provided queries for analysis.
3. (Optional) Import your CSV using the Table Import Wizard in MySQL Workbench.

## 📂 Files Provided

- `health_insurance_mysql_script.sql` – Full schema + analysis in MySQL
- Sample CSV or insert SQL available on request

## 📬 Credits

Inspired by Kaggle's Health Insurance Cross-Sell Prediction challenge. Built for SQL practice and insurance analytics.
# health_incurance_cross_sell_analysis
