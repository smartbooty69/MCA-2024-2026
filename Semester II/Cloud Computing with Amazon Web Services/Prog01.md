# Experiment 1: Creating a VPC with Subnets and Resources in AWS  

## 🎯 Aim  
To create a Virtual Private Cloud (VPC) with public and private subnets, configure networking resources, and ensure secure communication within AWS.

---

### Part 1: Configuring Basic VPC Settings  
#### 1. Log in to AWS Management Console  
- Open your web browser and go to the **AWS Management Console**.  
- Enter your AWS account credentials and log in.  

#### 2. Navigate to the VPC Service  
- In the AWS Management Console, search for **"VPC"** in the search bar.  
- Click on **VPC** under the "Networking & Content Delivery" category.  

#### 3. Start VPC Creation Wizard  
- In the VPC Dashboard, click **"Create VPC"**.  
- Select **"VPC and more"** from the options.  

#### 4. Set Name and CIDR Block  
- **Name Tag:** Enter a name for your VPC (e.g., `MyCustomVPC`).  
- **IPv4 CIDR Block:** Choose one of the following:  
  - Auto-generate (AWS will assign a CIDR block).  
  - Custom CIDR Block (e.g., `10.0.0.0/16`).  
- **IPv6 CIDR Block (Optional):**  
  - If you need IPv6, select **Amazon-provided IPv6 CIDR block**.  

### Part 2: Configuring Instance Tenancy and Subnets  
#### 1. Choose Instance Tenancy  
- **Default:** Instances run on shared hardware (**Recommended**).  
- **Dedicated:** Instances run on dedicated hardware (**More expensive**).  

#### 2. Configure Subnets  
- **Availability Zones (AZs):** Select at least **2 AZs** for redundancy.  
- **Number of Subnets:**  
  - **Public Subnets:** Select the number of public subnets.  
  - **Private Subnets:** Select the number of private subnets.  
- **Subnet CIDR Block:**  
  - Expand **"Automatic subnet CIDR block"** and modify if needed.  

  **Example:**  
  - Public Subnet 1: `10.0.1.0/24`  
  - Private Subnet 1: `10.0.2.0/24`  

### Part 3: Configuring Optional Components  
#### 1. Add NAT Gateway (Optional)  
- If private subnet instances need internet access, enable **NAT Gateway**.  
- Select **"1 per AZ"** for redundancy.  

#### 2. Add S3 Gateway (Optional)  
- If instances in private subnets need access to **S3**, enable **S3 Gateway**.  

#### 3. Enable VPC Endpoints for S3 (Optional)  
- If you want a VPC Endpoint for S3, enable it.  
- Select the **S3 Gateway** created earlier.  

#### 4. Add Tags (Optional)  
- Click **"Add new tag"** and enter key-value pairs:  
  - **Key:** `Name`  
  - **Value:** `MyVPC`  

### Part 4: Review and Create VPC  
#### 1. Review Configuration  
- Verify all settings in the preview panel.  
- Ensure that all subnets and networking components are correctly configured.  

#### 2. Create the VPC  
- If everything is correct, click **"Create VPC"**.  
- AWS will now provision your VPC and its associated resources.  
