# Customer Churn & Retention Analysis
### Tools: Python (Pandas) · SQLite · Tableau Public

---

## Problem
A telecom company is losing customers at an alarming rate. This analysis identifies **who is churning, why, and how much revenue is at risk** — and provides data-driven recommendations to improve retention.

---

## Tools Used
| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning & feature engineering |
| SQLite (DB Browser) | SQL querying & database analysis |
| Tableau Public | Interactive dashboard & what-if analysis |
| GitHub | Version control & portfolio documentation |

---

## Dataset
- **Source:** [Telco Customer Churn — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
- **Size:** 7,043 customers, 21 features
- **Target Variable:** `Churn` (Yes/No → 1/0)

---

## Project Structure
```
customer-churn-analysis/
│
├── data/
│   ├── unrefinedData.csv        # Original raw dataset
│   └── cleanedData.csv          # Cleaned & engineered dataset
│
├── notebooks/
│   └── DS_Cleaning.ipynb        # Python cleaning & feature engineering
│
├── sql/
│   └── myProjectStatements.sql  # All SQL queries
│
├── dashboard/
│   └── dashboard_screenshot.png # Tableau dashboard preview
│
└── README.md
```

---

## Phase 1: Data Cleaning (Python)
**Key steps taken:**
- Converted Yes/No binary columns to `0`/`1` for SQL compatibility
- Resolved blank spaces in `TotalCharges` — filled with `0` (new customers with no billing history)
- Encoded `gender` as `0`/`1`
- **Engineered `TenureGroup`** — segmented customers into 4 lifecycle stages (0–12, 13–24, 25–48, 49+ months)
- **Engineered `RevenueAtRisk`** — calculated as `MonthlyCharges × Churn` to quantify financial impact per customer

---

## Phase 2: SQL Analysis
**Key queries written:**
- Overall churn rate across all customers
- Churn rate by Tenure Group (CTE)
- Churn rate by Contract Type (CTE)
- Customer segments ranked by revenue lost (Window Function)
- Churn rate by Payment Method

---

## Key Findings

### 1. New Customers Churn at Nearly 5x the Rate of Long-Term Customers
| Tenure Group | Churn Rate |
|---|---|
| 0–12 months | 47.44% |
| 13–24 months | 28.71% |
| 25–48 months | 20.39% |
| 49+ months | 9.51% |

### 2. Month-to-Month Contracts Drive the Most Revenue Risk
- Month-to-month customers account for **~$120K** in revenue at risk
- One year contracts account for only **~$15K**
- Two year contracts account for only **~$3K**

### 3. Electronic Check Users Churn at 3x the Rate of Auto-Pay Users
| Payment Method | Churn Rate |
|---|---|
| Electronic check | 45.29% |
| Mailed check | 19.11% |
| Bank transfer (automatic) | 16.71% |
| Credit card (automatic) | 15.24% |

---

## Recommendations
1. **Invest in early retention programs** — nearly half of all new customers churn within the first year. Onboarding incentives and check-in touchpoints during months 1–12 could significantly reduce this rate.
2. **Incentivize long-term contracts** — discounts or loyalty perks for switching from month-to-month to annual contracts would reduce the largest source of revenue risk.
3. **Promote auto-pay enrollment** — customers on automatic payment methods churn at roughly one-third the rate of electronic check users. A simple nudge campaign could have outsized retention impact.

---

## What-If Analysis
The Tableau dashboard includes an interactive **Churn Reduction % parameter** that projects how much revenue is saved if churn is reduced by any amount between 1%–50%.

👉 [https://public.tableau.com/views/CustomerChurnAnalysis_17732647732610/CustomerChurnAnalysis?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link](url) 

---

## About
This project was built to demonstrate end-to-end data analyst skills across the full data lifecycle — from raw data to actionable business insight.
