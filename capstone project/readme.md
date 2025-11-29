# SQL Murder Mystery – Capstone Project

## 🔍 Overview:
This capstone project solves the SQL Murder Mystery, a data-driven investigation where the goal is to identify the killer using structured SQL analysis.
The project demonstrates how to trace evidence across datasets and eliminate suspects through SQL logic.

## 🎯 Objectives:
You act as the lead data analyst assigned to solve the case using SQL.
All necessary clues are hidden inside the company's internal databases, including:
- Keycard logs
- Phone call records
- Alibis
- Evidence found in different rooms

### 📂 Project Structure:

Capstone_Project/

│── README.md

│── SQL_Murder_Mystery_Solution.sql

│── SQL_Murder_Mystery_Presentation.pptx

│── SQL_Murder_Mystery_Video.mp4   ← simple screen recording of the slides


### 🗂️ Dataset Description:
Tables used in the investigation:
- Alibis
- calls
- Employees
- Evidence
- Keycard_logs

## 🧠 Investigation Approach :

1. Identify the Crime Window
Determined the exact crime window using evidence timestamps, confirming the murder occurred in the CEO Office between 20:50 and 21:00.

2. Track Room Access
Analyzed keycard activity to see who entered the CEO Office during this window. Only one employee accessed the room at the critical time.

3. Verify Alibis
Cross-checked each employee’s claimed location with actual keycard movements. One employee showed a clear mismatch between their alibi and their logged presence.

4. Analyze Suspicious Calls
Reviewed call activity around the incident. Found a call made by the same employee moments before the crime, aligning with other suspicious patterns.

5. Match Evidence With Movements
Connected timestamps from physical evidence with movement logs. Only one employee’s timeline aligned perfectly with all indicators.

6. Combine All Findings
Integrated data from all sources. Every dataset consistently pointed to the same individual, with no conflicting evidence.

##📎 Files Included :
PPTX Presentation – complete summary of the investigation
Video File – only a screen recording of the PPTX slides
SQL File – clean, structured SQL solution covering each analysis step

## 🗃️ SQL Concepts Practiced:
- Multi-table JOINs
- Common Table Expressions (CTEs)
- Time-based filtering
- Evidence correlation across datasets
- Building a complete case narrative using SQL only

## 📢 About This Capstone:
This project is part of the 21-Day SQL Challenge, designed to demonstrate structured problem-solving, analytical reasoning, and practical SQL investigation skills.
