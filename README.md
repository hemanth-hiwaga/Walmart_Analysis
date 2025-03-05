
# Walmart Sales Analysis Case Study

## Overview
This case study analyzes Walmart sales data to extract insights into payment methods, branch performance, customer behavior, and revenue trends. The goal is to provide actionable insights that can help improve business strategies and optimize sales performance. Additionally, we explore data preprocessing techniques such as handling missing values, fixing data types, and performing feature engineering to ensure data quality before analysis.

## Data Preprocessing and Cleaning
Before performing the analysis, the dataset undergoes multiple preprocessing steps to ensure its accuracy and consistency:

1. **Loading the Dataset** - The dataset is loaded into a Pandas DataFrame from a CSV file for further processing.
2. **Exploratory Data Analysis (EDA)** - Key statistics, shape, and structure of the dataset are examined to understand its characteristics.
3. **Handling Duplicates** - Any duplicate records are identified and removed to prevent skewed analysis.
4. **Handling Missing Values** - Null values are dropped to avoid incorrect calculations in the analysis.
5. **Fixing Data Types** - Data types are corrected, such as converting the `unit_price` column from string to float after removing currency symbols.
6. **Feature Engineering** - A new `total` column is created by multiplying `unit_price` and `quantity` to calculate total sales for each transaction.

## Business Problems and Analysis

### 1. Identifying Payment Methods Usage
To understand customer payment preferences, we analyze different payment methods and their usage frequency. Identifying the most popular payment methods helps in streamlining payment processing and enhancing customer convenience. The findings from this analysis can assist Walmart in deciding which payment methods to promote further.

### 2. Total Number of Branches
A count of distinct branches is calculated to determine the business's geographical spread. This helps in understanding Walmart's market penetration and identifying areas where expansion may be beneficial. Insights from this can also help in logistics and supply chain optimization.

### 3. Number of Transactions Per Branch
Each branch's transaction count is analyzed to identify the busiest stores. This insight helps in resource allocation, ensuring that high-traffic stores have sufficient staff and inventory to meet customer demand. Branches with lower transaction counts can be examined to determine potential areas for improvement.

### 4. Payment Methods, Transactions, and Quantity Sold
The relationship between payment methods, transaction counts, and total quantity sold is studied to understand customer purchase behavior. This information can be used to promote preferred payment methods and improve the checkout experience. A branch-specific analysis can also reveal whether certain locations have a preference for particular payment methods.

### 5. Highest-Rated Category Per Branch
Branches are analyzed to find the top-rated product category based on average customer ratings. Understanding customer preferences at a category level allows Walmart to focus on stocking high-performing products and improving lower-rated ones. Categories with consistently low ratings can be targeted for quality improvements or promotional campaigns.

### 6. Busiest Day Per Branch
The busiest day of the week for each branch is determined based on transaction volume. Knowing peak business days allows for better workforce management, targeted promotions, and inventory planning. This also helps in understanding customer shopping patterns and aligning store operations accordingly.

### 7. Total Quantity of Items Sold Per Payment Method
The payment methods are analyzed to see which contribute the most to the quantity of items sold. This insight helps in optimizing payment infrastructure and encouraging the use of preferred methods. Additionally, offering targeted discounts or loyalty rewards on popular payment methods can enhance customer satisfaction.

### 8. Average, Minimum, and Maximum Category Ratings Per City
The performance of product categories in different cities is evaluated using average, minimum, and maximum ratings. This allows Walmart to tailor its product offerings to meet regional customer preferences and improve overall satisfaction. Cities with lower category ratings can be further analyzed to determine the causes of customer dissatisfaction.

### 9. Total Profit Per Category
The total profit per product category is calculated to identify the most profitable segments. Understanding which categories drive the most revenue helps in strategic pricing, promotions, and stocking decisions. This analysis also supports decisions related to supplier negotiations and marketing campaigns.

### 10. Most Common Payment Method Per Branch
For each branch, the most frequently used payment method is determined to understand customer preferences. This insight can be used to introduce branch-specific payment incentives or loyalty programs. Understanding payment trends at the branch level can also support digital payment adoption strategies.

### 11. Sales Categorization by Time Shift
Sales are categorized into Morning, Afternoon, and Evening shifts based on transaction time to understand peak shopping hours. This helps in optimizing staff schedules and planning marketing campaigns for maximum impact. For example, if the evening shift is the busiest, Walmart can introduce evening-only promotions to further drive sales.

### 12. Branches with the Highest Revenue Decrease
The five branches with the highest revenue decline from last year to the current year are identified to assess financial downturns. This analysis enables Walmart to take corrective actions such as targeted promotions, staff training, or operational adjustments to improve performance. Branches with consistent declines can be further investigated for potential causes such as competition or operational inefficiencies.

## Storing Cleaned Data and Database Integration
After the data cleaning and feature engineering process, the cleaned dataset is saved as a CSV file named `wallmart_cleandata.csv`. The column names are converted to lowercase for consistency. The cleaned dataset is then uploaded to a MySQL database named `wallmart_db` for further analysis. The database connection is established using SQLAlchemy, and the data is inserted into a table named `wallmart` for efficient querying and reporting.

## Conclusion
This case study provides key insights into Walmart's operations, helping to optimize payment strategies, product offerings, and branch performance. By leveraging these findings, Walmart can enhance customer experience and improve profitability. Strategic decisions based on data-driven insights will ensure sustained growth and competitiveness in the retail market. Additionally, maintaining high data quality through preprocessing ensures that the analysis is accurate and actionable, leading to more reliable business decisions.

