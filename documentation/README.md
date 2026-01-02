# 🏢 CRM Sales Dashboard - Power BI Project

A comprehensive sales analytics dashboard built with Power BI, showcasing SQL skills, data modeling, and business intelligence capabilities.

## 📊 Project Overview
- **Purpose**: Demonstrate SQL and Power BI skills for CRM analytics
- **Technologies**: Power BI, SQL Server, DAX, Excel
- **Features**: Interactive dashboard with KPI cards, trend analysis, and customer segmentation

## 🗂️ Project Structure
crm-sales-dashboard/
├── data/ # Data sources and SQL scripts
├── powerbi/ # Power BI files and exports
├── documentation/ # Project documentation
└── screenshots/ # Dashboard screenshots

## 📈 Dashboard Features
1. **KPI Metrics**: Total Revenue, Profit, Average Sale Value
2. **Interactive Visuals**: 
   - Sales by Status (Pie Chart)
   - Monthly Sales Trend (Line Chart)
   - Top Customers (Bar Chart)
   - Product Category Performance (Donut Chart)
3. **Dynamic Filters**: Date range, Customer Type, Product Category
4. **Data Model**: Star schema with Customers, Products, Sales tables

## 🛠️ Setup Instructions

### Prerequisites
- Power BI Desktop (Free)
- SQL Server Management Studio (Mandatory)

### Quick Start
1. Open `powerbi/CRM_Sales_Dashboard.pbix` in Power BI Desktop
2. Refresh data connection if needed
3. Explore interactive dashboard

## 📊 Data Model
Customers (1) → (∞) Sales
Products (1) → (∞) Sales

## 📋 Key DAX Measures
```dax
Total Revenue = SUM(Sales[TotalAmount])
Total Profit = SUMX(Sales, Sales[TotalAmount] - (RELATED(Products[Cost]) * Sales[Quantity]))
Profit Margin % = DIVIDE([Total Profit], [Total Revenue])
Average Sale = DIVIDE([Total Revenue], COUNTROWS(Sales))