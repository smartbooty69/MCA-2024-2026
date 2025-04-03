# Experiment 10: Working with Relational Database System (RDS) using AWS and MySQL Workbench

## 🎯 Objective
To create an RDS MySQL instance in AWS and connect to it using MySQL Workbench to interact with the database.

---

## 🔹 Part 1: Creating the RDS MySQL Instance

### Step 1: Log in to AWS Management Console
- Open your browser and go to **AWS Management Console**.
- Enter your **AWS credentials** and sign in.

### Step 2: Navigate to RDS Service
- In the AWS Console, search for **"RDS"** in the search bar.
- Click on **"RDS"** under the "Databases" category.

### Step 3: Create a New RDS Database
- In the RDS dashboard, under "Databases", click **"Create database"**.

### Step 4: Select Database Engine and Configuration
- **Database creation method**: Select **"Standard create"**.
- **Engine type**: Choose **MySQL**.
- **Templates**: Select **"Free tier"** (to avoid charges).

### Step 5: Configure Database Instance
- **DB instance identifier**: Enter a name (e.g., `my-rds-instance`).
- **Master username**: Set to `Admin`.
- **Master password**: Set a password (⚠️ Avoid special characters).

### Step 6: Configure Storage and Connectivity
- **Storage autoscaling**: Leave default settings.
- **Public access**: Set **"Yes"** (⚠️ Not recommended for production).
- **VPC & Security Groups**: Keep the default settings.

### Step 7: Create Database
- Scroll down and click **"Create database"**.
- Wait for **5-10 minutes** while AWS provisions the database.

---

## 🔹 Part 2: Connecting to RDS using MySQL Workbench

### Step 1: Install MySQL Workbench
- If not installed, download **MySQL Workbench**.
- Install and open **MySQL Workbench**.

### Step 2: Get the RDS Endpoint
- In the **AWS RDS Console**, go to **Databases**.
- Click on your **RDS instance**.
- Under the **"Connectivity & security"** tab, copy the **Endpoint** (e.g., `my-rds-instance.abcdefg.us-east-1.rds.amazonaws.com`).

### Step 3: Create a New Connection in MySQL Workbench
- Open **MySQL Workbench**.
- Click the **"+"** icon next to **"MySQL Connections"**.
- Set the connection details:
  - **Connection Name**: `My RDS Connection`
  - **Connection Method**: `Standard (TCP/IP)`
  - **Hostname**: Paste the **RDS Endpoint**.
  - **Port**: `3306`
  - **Username**: `Admin`
  - **Password**: Click **"Store in Vault"** and enter the master password.

### Step 4: Test Connection
- Click **"Test Connection"**.
- If it succeeds, click **"OK"**.
- If it fails, follow **Part 3 (Security Group Configuration)**.

---

## 🔹 Part 3: Fix Security Group Issues (If Connection Fails)

### Step 1: Open Security Group Settings
- In the **AWS Console**, go to **RDS > Databases**.
- Click on your **RDS instance**.
- Under **"Connectivity & security"**, locate **Security group**.
- Click on the **security group link**.

### Step 2: Edit Inbound Rules
- In the **Security Groups** page, click **"Inbound rules"**.
- Click **"Edit inbound rules"**.
- Click **"Add Rule"** and set:
  - **Type**: `MYSQL/Aurora`
  - **Port range**: `3306`
  - **Source**: `Anywhere (0.0.0.0/0)` (⚠️ For production, restrict this to your IP)
- Click **"Save rules"**.

### Step 3: Retry MySQL Workbench Connection
- Go back to **MySQL Workbench**.
- Click **"Test Connection"** again.
- If successful, click **"OK"**.

---

## 🔹 Part 4: Running SQL Queries

### Step 1: Open MySQL Workbench and Connect
- Double-click **"My RDS Connection"** to open it.

### Step 2: Execute SQL Queries
```sql
CREATE DATABASE LABDB;
USE LABDB;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (name, email) VALUES
('Arjun', 'clan@example.com'),
('Neha', 'mendo@example.com');

SELECT * FROM users;
```

---

### ✅ You have successfully set up an RDS MySQL instance on AWS and connected to it using MySQL Workbench!
