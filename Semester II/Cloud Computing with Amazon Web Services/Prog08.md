# Experiment 8: Launching and Configuring an AWS EC2 Instance in AWS

## 🎯 Objective
To launch an EC2 instance in AWS and configure it for web traffic.

---

## 🔹 Part 1: Launch an EC2 Instance
### Step 1: Log in to AWS Management Console
- Open your browser and go to AWS Management Console.
- Enter your AWS account credentials and log in.

### Step 2: Navigate to EC2 Service
- In the AWS Console, search for "EC2" in the search bar.
- Click on "EC2" under the "Compute" category.

### Step 3: Launch a New Instance
- Click "Launch instances".

### Step 4: Configure Instance
#### 4.1 Name Your Instance
- **Instance Name**: `MyWebServer`

#### 4.2 Select an Amazon Machine Image (AMI)
- **AMI**: Choose "Amazon Linux 2023 AMI" (Free Tier eligible).

#### 4.3 Choose Instance Type
- **Instance Type**: `t3.micro` (Free Tier eligible).

#### 4.4 Create a Key Pair
- Under **Key pair (login)**, click "Create new key pair".
- **Key pair name**: `my-keypair`
- **Key pair type**: `RSA`
- **Private key file format**: Select `.ppk` (for PuTTY).
- Click "Create key pair".
- **Download the `.ppk` file and save it securely.**

#### 4.5 Configure Security Group
- Create a new security group with the following Inbound Rules:
  - **Rule 1 (SSH Access)**
    - **Type**: `SSH`
    - **Protocol**: `TCP`
    - **Port range**: `22`
    - **Source**: `My IP` (or "Anywhere" if needed)
  - **Rule 2 (HTTP Web Traffic)**
    - **Type**: `HTTP`
    - **Protocol**: `TCP`
    - **Port range**: `80`
    - **Source**: `Anywhere` (Allows anyone to access your web server)

### Step 5: Launch the Instance
- Click "Launch instance".

---

**Next Steps**: Once your instance is running, you can connect to it using SSH and install a web server like Apache or Nginx.
