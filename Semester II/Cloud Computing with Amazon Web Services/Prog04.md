# Experiment 4: Setting up a Lifecycle Rule for an Object in Amazon S3

## 🎯 Aim
To configure a lifecycle rule in Amazon S3 to automate the transition of objects between different storage classes over time, optimizing cost and efficiency.

## Part 1: Creating or Selecting an S3 Bucket
### Step 1: Log in to AWS Management Console
- Open your web browser and go to AWS Management Console.
- Enter your AWS account credentials and log in.

### Step 2: Navigate to S3 Service
- In the AWS Management Console, search for "S3" in the search bar.
- Click on "Amazon S3" under the Storage category.

### Step 3: Create a New Bucket (If Necessary)
- Click the "Create bucket" button.
- Enter a unique name for your bucket (e.g., `my-lifecycle-bucket`).
- Choose a region closest to your users.
- Configure other settings as required (leave defaults if unsure).
- Click "Create bucket".

### Step 4: Select an Existing Bucket (If Available)
- If you already have a bucket, select it from the list.

## Part 2: Uploading an Object to the Bucket
### Step 1: Open the Selected Bucket
- In the S3 console, click on the bucket name you created or selected.

### Step 2: Upload an Object
- Click the "Upload" button.
- Click "Add files" and select the file you want to upload from your local system.
- Configure necessary upload settings (leave defaults if unsure).
- Click "Upload" to complete the process.

## Part 3: Navigating to Lifecycle Rules
### Step 1: Open the S3 Management Console
- If you're not already there, navigate to Amazon S3 from the AWS Console.

### Step 2: Select the Bucket
- Click on the name of the bucket where you uploaded the object.

### Step 3: Open the Management Tab
- Inside the bucket, click on the "Management" tab.

### Step 4: Locate the Lifecycle Rule Section
- Scroll down to "Lifecycle Rules".

### Step 5: Create a New Lifecycle Rule
- Click the "Create lifecycle rule" button.

## Part 4: Creating the Lifecycle Rule
### Step 1: Enter a Rule Name
- Provide a descriptive name for your lifecycle rule (e.g., `Archive-Old-Files`).

### Step 2: Define the Scope of the Rule
- **Apply to all objects in the bucket**: Select this option if the rule should apply to every object in the bucket.
- **Limit to specific prefixes or tags**: If you want to apply the rule only to specific objects, use prefixes or tags.

## Part 5: Setting Transition Actions
### Step 1: Add a Transition Action to Intelligent-Tiering
- Click "Add transition".
- Select "Transition to Intelligent-Tiering".
- Set the number of days after object creation when the transition should occur (e.g., 60 days).

> **Note**: The "60/30" in some AWS documentation suggests an initial transition after 60 days, followed by a move within Intelligent-Tiering (e.g., from frequent to infrequent access after 30 days).

### Step 2: Add a Transition Action to Glacier for Archival
- Click "Add transition" again.
- Select "Transition to Glacier".
- Set the number of days after object creation when the transition should occur (e.g., 365 days).

> **Note**: The "34/60" in some references might be a typo or refer to a different workflow. The standard practice is transitioning to Glacier after 365 days for long-term storage.

## Part 6: Saving and Reviewing the Lifecycle Rule
### Step 1: Review the Rule
- Carefully review the lifecycle rule settings, ensuring the transition actions and their timing are correct.

### Step 2: Save Changes
- Click "Create rule" to save and apply the lifecycle rule.

### Step 3: Verify the Rule
- After the specified number of days, check if objects have transitioned to the expected storage classes:
  - Open the S3 Console.
  - Select the bucket.
  - Click on an object’s properties to verify its storage class.
