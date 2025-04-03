# Experiment 9: Setting Up an EC2 Instance and Connecting with PuTTY

## Objective
To create a security group, launch an EC2 instance, and connect to it using PuTTY.

---

## 🔹 Part 1: Create a Security Group
A Security Group acts as a firewall, allowing or denying access to your instance.

### Step 1: Log in to AWS
- Open your browser and go to AWS Management Console.
- Enter your AWS account credentials and log in.

### Step 2: Navigate to VPC
- In the AWS Console, search for "VPC" in the search bar.
- Click on **VPC** under the **Networking & Content Delivery** section.

### Step 3: Create a Security Group
- In the left menu, click **Security Groups**.
- Click **Create security group**.

### Step 4: Configure Security Group
- **Security group name:** `ALLOWPORTS`
- **Description:** Allows SSH access
- **VPC:** Select the default VPC or the one you want to use.

### Step 5: Add an Inbound Rule for SSH
- Under **Inbound rules**, click **Add rule**.
- **Type:** Select `SSH`
- **Protocol:** TCP
- **Port range:** `22`
- **Source:** Select `My IP` (only your IP will be allowed access, making it secure).
- Click **Create security group**.

---

## 🔹 Part 2: Launch an EC2 Instance

### Step 1: Navigate to EC2
- In AWS Console, search for **EC2**.
- Click **EC2** under the **Compute** category.

### Step 2: Launch an Instance
- Click **Launch instances**.

### Step 3: Configure EC2 Instance
#### 3.1 Set Instance Name
- **Name:** `MyPuTTYInstance`

#### 3.2 Select an Amazon Machine Image (AMI)
- Choose `Amazon Linux 2023 AMI` (Free Tier eligible).

#### 3.3 Select Instance Type
- Choose `t3.micro` (Free Tier eligible).

#### 3.4 Create a Key Pair
- Under **Key pair (login)**, click **Create new key pair**.
- **Key pair name:** `my-putty-key`
- **Key pair type:** `RSA`
- **Private key file format:** Select `.ppk` (for PuTTY).
- Click **Create key pair**.
- **Download the .ppk file and save it securely.**

#### 3.5 Configure Security Group
- Select **Choose existing security group**.
- Select the **ALLOWPORTS** security group you created earlier.

### Step 4: Launch the Instance
- Click **Launch instance**.

---

## 🔹 Part 3: Connect to the EC2 Instance with PuTTY

### Step 1: Install PuTTY (If Not Installed)
- Download PuTTY and PuTTYgen from the official site.
- Install PuTTY.

### Step 2: Convert the Key Using PuTTYgen
- Open **PuTTYgen**.
- Click **Load**.
- Select the `.ppk` key file you downloaded (`my-putty-key.ppk`).
- Click **Save private key** (Optional: Save without a passphrase).
- Save it as `my-private-key.ppk`.

### Step 3: Get the Public IP of EC2
- In the EC2 dashboard, click **Instances**.
- Copy the **Public IPv4 address** (e.g., `54.123.45.67`).

### Step 4: Open PuTTY
- Open **PuTTY**.
- Under **Host Name (or IP Address):**
  - Enter: `ec2-user@your-public-ip-address`
  - Example: `ec2-user@54.123.45.67`
- **Port:** `22`
- **Connection Type:** `SSH`

### Step 5: Load Private Key
- In the left menu, expand **SSH → Click Auth**.
- Click **Browse**, select `my-private-key.ppk`, and click **Open**.

### Step 6: Connect to EC2
- Click **Open**.
- If prompted about security, click **Yes**.
- You should now see a terminal window connected to your EC2 instance.

---

## 🔹 Part 4: Run Commands on EC2

### Step 1: Check Current Directory
```bash
pwd
```

### Step 2: Create a Script to Show Date & Time
```bash
echo "Current Date and Time: " > date-time.sh
```

### Step 3: Make the Script Executable
```bash
chmod +x date-time.sh
```

### Step 4: Run the Script
```bash
./date-time.sh
```
