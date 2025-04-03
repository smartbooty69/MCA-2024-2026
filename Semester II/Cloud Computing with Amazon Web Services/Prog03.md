# Experiment 3: Creating an S3 Bucket with an Object and Applying a Bucket Policy

### 🎯 Aim
To create an Amazon S3 bucket, upload an object, and apply a bucket policy to enforce server-side encryption.

---

## **Part 1: Creating an S3 Bucket**

### **Step 1: Log in to AWS Management Console**
- Open your web browser and navigate to the [AWS Management Console](https://aws.amazon.com/console/).
- Enter your AWS account credentials and log in.

### **Step 2: Navigate to the S3 Service**
- In the AWS Management Console, search for **"S3"** in the search bar or find it under the **Storage** category.
- Click on **"S3"** to open the Amazon S3 dashboard.

### **Step 3: Create a New Bucket**
- Click the **"Create bucket"** button.
- Configure the bucket settings as follows:
  - **Bucket Name**: Enter a globally unique name (e.g., `my-secure-bucket-123`).
  - **AWS Region**: Select a region closest to your users.
  - **Object Ownership**: Leave the default setting (**ACLs disabled**).
  - **Block Public Access**: Ensure that **"Block all public access"** is enabled.
  - **Bucket Versioning**: Leave **disabled** for now.
  - **Default Encryption**: Leave **encryption disabled** (we will enforce it later using a bucket policy).
  - **Advanced Settings**: Leave everything as default.
- Click **"Create bucket"** to complete the setup.

## **Part 2: Uploading an Object to the Bucket**

### **Step 1: Select the Created Bucket**
- In the S3 console, click on the bucket name that you just created.

### **Step 2: Upload a File to the Bucket**
- Click the **"Upload"** button.
- Click **"Add files"** and select a file from your local computer (e.g., `test-file.txt`).
- Click **"Upload"** to store the file in the bucket.

## **Part 3: Applying a Bucket Policy to Enforce Encryption**

### **Step 1: Navigate to the Permissions Tab**
- In your bucket’s settings, click on the **"Permissions"** tab.
- Scroll down to the **"Bucket Policy"** section.
- Click the **"Edit"** button to modify the bucket policy.

### **Step 2: Create a Bucket Policy**
This policy will enforce **AES-256** server-side encryption for all uploaded objects.

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "EnforceSSE",
      "Effect": "Deny",
      "Principal": "*",
      "Action": "s3:PutObject",
      "Resource": "arn:aws:s3:::your-bucket-name/*",
      "Condition": {
        "StringNotEquals": {
          "s3:x-amz-server-side-encryption": "AES256"
        }
      }
    }
  ]
}
```

### **Step 3: Apply the Policy**
- Replace `your-bucket-name` with the actual name of your bucket.
- Copy and paste the updated JSON policy into the **Bucket Policy Editor** in the S3 console.
- Click **"Save changes"** to apply the policy.

## **Part 4: Verifying the Bucket Policy**

### **Step 1: Upload a New Object with Encryption**
- Go back to your S3 bucket and click **"Upload"**.
- Select a file from your computer.
- Under **"Properties"**, expand the **"Server-side encryption"** section.
- Choose **"AES-256"** encryption.
- Click **"Upload"**.
- Verify the uploaded file by checking its properties—encryption should be **AES-256**.

### **Step 2: Test Upload Without Encryption (Should Fail)**
- Try uploading another file but do **not** specify encryption.
- The upload should fail with an **Access Denied** error, confirming that the policy is working.
