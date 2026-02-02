# Advanced E-commerce Analytics (Recursive & Window Logic)

An engineering-focused SQL repository demonstrating complex relational logic, recursive tree traversal, and customer segmentation.


<img width="634" height="58" alt="dbadvance" src="https://github.com/user-attachments/assets/0c5d8120-de51-4353-87e5-6cb4ab3a946b" />

# Advanced SQL Techniques
* **Recursive CTEs:** Implemented a multi-level referral attribution model to track indirect revenue.
* **Complex Windows:** Used `NTILE(10)` for customer decile ranking and `SUM() OVER(PARTITION BY...)` for running revenue totals.
* **Normalization:** 3NF (Third Normal Form) compliant schema design.

# Query Breakdown
1. **LTV (Lifetime Value):** Calculates cumulative spend per customer over time.
2. **Referral Trees:** Maps out the hierarchical structure of customer acquisitions.
3. **Churn Prediction:** CTE-based logic to find customers whose interval between orders exceeds the 90th percentile.

# Execution
Get-Content scripts/referral_impact.sql | .\sqlite3.exe advanced.db
