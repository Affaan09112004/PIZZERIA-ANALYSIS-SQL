
# **Pizzeria Sales Analysis** 🍕  

This project focuses on analyzing a pizza restaurant's sales data to uncover valuable business insights such as revenue trends, top-selling pizzas, customer ordering patterns, and category performance.  
The analysis was carried out using **MySQL**, with structured queries designed to answer a variety of business questions.

---

## **📂 Project Structure**
The dataset consists of **4 tables**:

1. **`orders`** – Stores order date and time.  
2. **`order_details`** – Stores quantity and pizza reference for each order.  
3. **`pizzas`** – Contains pizza details such as price and size.  
4. **`pizza_types`** – Contains pizza categories and names.  

> **Note**: Only a few rows of data are included here for illustration purposes.  
> For the **complete dataset** and **MySQL Workbench file**, please refer to the GitHub link provided below.


**Explanation:**  
- Each **pizza type** can have multiple **pizzas** with different sizes.  
- Each **order** can contain multiple **order details**.  
- The **order details** table acts as a bridge between orders and pizzas.

---

## **🗄️ Analysis Performed**

### **1. Overall Sales & Performance**
- Total number of orders placed.  
- Total pizzas sold.  
- Total types of pizzas available.  
- Unique pizza sizes available.  
- Total **revenue generated** from pizza sales.  
- Highest-priced pizza identified.

---

### **2. Revenue Insights**
- **Top 3 pizzas** based on revenue.  
- **Revenue contribution percentage** of each pizza category.  
- **Cumulative revenue growth** over time.  

---

### **3. Customer Ordering Trends**
- Most commonly ordered **pizza size**.  
- **Top 5 pizza types** based on quantity sold.  
- Order distribution by **hour of the day**.  
- **Average number of pizzas ordered per day**.

---

### **4. Category Performance**
- **Category-wise distribution of pizzas**.  
- Total quantity ordered per **pizza category**.  
- Top 3 pizza types **per category** based on revenue.

---

## **📊 Key Findings**
- **Medium-sized pizzas** were the most popular choice among customers.  
- *Classic* and *Supreme* categories generated **the highest sales and revenue**.  
- Peak ordering hours were observed in the **evening time slots**.  
- A small group of pizza types contributed to **most of the restaurant’s revenue and sales volume**.

---

## **🛠️ Tools Used**
- **SQL (MySQL Workbench)** – For running and analyzing queries.  
- **GitHub** – For sharing project files and dataset.  

---


