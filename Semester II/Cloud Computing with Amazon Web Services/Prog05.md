# Experiment 5: Hosting a Static Website Using Amazon S3  

## 🎯 Objective  
To host a static website using Amazon S3 by creating an S3 bucket, uploading website files, configuring permissions, and enabling static website hosting.

---

## 🔹 Part 1: Creating an S3 Bucket  

### Step 1: Log in to AWS Management Console  
- Open your web browser and go to **AWS Management Console**.  
- Enter your **AWS account credentials** and log in.  

### Step 2: Navigate to S3 Service  
- In the **AWS Management Console**, search for **"S3"** in the search bar.  
- Click on **"Amazon S3"** under the "Storage" category.  

### Step 3: Create a New Bucket  
- Click **"Create bucket"**.  
- Enter a **globally unique name** for your bucket (e.g., `my-static-website-123`).  
- Choose a **region** closest to your audience.  
- Scroll down to **Block Public Access settings** and uncheck **"Block all public access"**.  
- Acknowledge the warning about making your bucket public.  
- Click **"Create bucket"**.  

---

## 🔹 Part 2: Uploading Website Files  

### Step 1: Open the Created Bucket  
- In the **S3 console**, click on the bucket you just created.  
- Navigate to the **Objects** tab.  

### Step 2: Upload Website Files  
- Click **"Upload"**.  
- Click **"Add files"** and select your website files (`index.html`, `error.html`, CSS, images, etc.).  
- Click **"Upload"** to complete the process.  

---

## 🔹 Part 3: Setting Bucket Policy for Public Access  

### Step 1: Navigate to the Permissions Tab  
- Inside your bucket, click the **Permissions** tab.  
- Scroll down to **Bucket policy**.  

### Step 2: Add a Public Read Policy  
- Click **"Edit"** under **Bucket Policy**.  
- Paste the following policy (replace `your-bucket-name` with your actual bucket name):  

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::your-bucket-name/*"
        }
    ]
}
```

- Click **"Save changes"**.  

⚠️ This policy allows **anyone** to access the files in your bucket.  

---

## 🔹 Part 4: Enabling Static Website Hosting  

### Step 1: Navigate to the Properties Tab  
- Click on the **Properties** tab inside your bucket.  
- Scroll down to **Static website hosting**.  

### Step 2: Enable Static Website Hosting  
- Click **"Edit"** under **Static website hosting**.  
- Select **"Enable"**.  
- Enter `index.html` as the **Index document**.  
- Enter `error.html` as the **Error document**.  
- Click **"Save changes"**.  

### Step 3: Copy the Website Endpoint  
- After enabling **static hosting**, an **endpoint URL** will appear.  
- Copy this **URL**—this is your **live website link**.  

---

## 🔹 Part 5: Accessing the Hosted Website  

- Open your **web browser**.  
- Paste the copied **S3 Website Endpoint URL** into the address bar.  
- Press **Enter**, and your **website should load**.  

---

### ✅ You have successfully hosted a static website using Amazon S3! 🎉
