# Experiment 2: Creating and Managing S3 Buckets and Objects on AWS

## 🎯 Aim
To create and manage S3 buckets and objects on AWS, including uploading files, configuring permissions, enabling versioning, and verifying access controls.

---

## Part 1: Creating an S3 Bucket
### Step 1: Log in to AWS Management Console
Open your web browser and go to the AWS Management Console.

Log in using your AWS credentials.

### Step 2: Open the S3 Service
In the AWS Management Console, search for S3 in the search bar.

Click on "S3" under the Storage category to open the Amazon S3 dashboard.

### Step 3: Create a New Bucket
Click the "Create bucket" button.

Configure the bucket settings:

- **Bucket Name**: Choose a unique name (e.g., my-test-bucket-123).
- **Region**: Select a region closest to your users.
- **Object Ownership**: Keep the default setting (ACLs disabled).
- **Block Public Access**: Ensure "Block all public access" is enabled.
- **Bucket Versioning**: Leave disabled (we will enable it later).
- **Default Encryption**: Leave default encryption disabled for now.
- **Advanced Settings**: Keep defaults.

Click "Create bucket" to finalize.

## Part 2: Uploading a File to the S3 Bucket
### Step 1: Open Your Bucket
In the S3 console, click on the bucket name you just created.

### Step 2: Upload a File
Click "Upload".

Click "Add files", select a file from your computer (e.g., sample.txt).

### Step 3: Configure Upload Settings
- Under "Permissions", keep the default settings.
- Under "Properties", you can set:
  - **Storage class** (keep default).
  - **Server-side encryption** (optional). If needed, select SSE-S3 (AES-256 encryption).

Click "Upload" to complete the process.

## Part 3: Verifying Access to the Uploaded Object
### Step 1: Get the Object URL
In the bucket, click on the uploaded file.

Find the "Object URL" in the object's details.

Copy this URL.

### Step 2: Test Access in a Browser
Open a web browser.

Paste and visit the Object URL.

If public access is blocked, you will see "Access Denied", confirming the bucket is secure.

## Part 4: Enabling Bucket Versioning
### Step 1: Open Bucket Properties
In the S3 console, select your bucket.

Click on the "Properties" tab.

### Step 2: Enable Versioning
Scroll down to the "Bucket Versioning" section.

Click "Edit" and select "Enable".

Click "Save changes".

## Part 5: Uploading the Same File Again (Demonstrating Versioning)
### Step 1: Upload the File Again
Repeat Part 2 by uploading the same file (sample.txt).

### Step 2: Verify Versioning
Go to your bucket and enable "Show versions" to see multiple versions of the file.

## Part 6: Deleting Objects and Permanently Deleting Versions
### Step 1: Delete an Object (Initial Delete)
In the bucket, select the file you want to delete.

Click "Delete" → Confirm by typing "delete" → Click "Delete object".

### Step 2: Permanently Delete a Version
In the bucket, enable "Show versions".

Select the specific version to delete.

Click "Delete permanently".

Type "permanently delete" and confirm.
