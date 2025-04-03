# Experiment 4: Setting up a Lifecycle Rule for an Object in Amazon S3

### 🎯 Aim
To configure a lifecycle rule for an object stored in an Amazon S3 bucket to transition it between different storage classes based on a specified schedule.

---

### Part 1: Creating or Selecting an S3 Bucket

#### Log in to AWS Management Console:
- Open your web browser and navigate to the AWS Management Console.
- Enter your AWS account credentials and log in.

#### Navigate to S3 Service:
- In the AWS Management Console, search for "S3" or find it under the "Storage" category and click on it.

#### Create a New Bucket (if necessary):
- If you don't have an existing bucket, click the **Create bucket** button.
- Provide a unique name for your bucket.
- Select the appropriate AWS region.
- Configure other settings as needed (leave defaults if unsure).
- Click **Create bucket**.

#### Select an Existing Bucket (if available):
- If you already have a bucket, select it from the list of buckets.

---

### Part 2: Uploading an Object to the Bucket

#### Open the Bucket:
- Click on the name of your bucket to open it.

#### Upload an Object:
- Click the **Upload** button.
- Click **Add files** and select the file you want to upload from your local computer.
- Configure any necessary upload settings (leave defaults if unsure).
- Click **Upload**.

---

### Part 3: Navigating to Lifecycle Rules

#### Go to the S3 Management Console:
- You should already be in the S3 Management Console.

#### Select the Bucket:
- Click on the name of the bucket where you uploaded the object.

#### Navigate to the Management Tab:
- In the bucket's details, click on the **Management** tab.

#### Find the Lifecycle Rule Section:
- Look for the **Lifecycle rules** section.

#### Create a New Rule:
- Click the **Create lifecycle rule** button.

---

### Part 4: Creating the Lifecycle Rule

#### Enter a Rule Name:
- Provide a descriptive name for your lifecycle rule.

#### Scope of the Rule:
- **Apply to all objects in the bucket:** Select this option if you want the rule to apply to all objects in the bucket.
- **Limit to specific prefixes or tags:** If you want to apply the rule to specific objects, you can use prefixes or tags.

---

### Part 5: Setting Transition Actions

#### Add a Transition Action to Intelligent-Tiering:
- Click **Add transition**.
- Select **Transition to Intelligent-Tiering**.
- Specify the number of days after object creation that the transition should occur (e.g., 60 days).

#### Add a Transition Action to Glacier for Archival:
- Click **Add transition** again.
- Select **Transition to Glacier**.
- Specify the number of days after object creation that the transition should occur (e.g., 365 days).

---

### Part 6: Saving Changes and Reviewing the Rule

#### Review the Rule:
- Carefully review the lifecycle rule you have created, including the transition actions and their timing.

#### Save Changes:
- Click the **Create rule** button to save the lifecycle rule.

#### Verify the Rule:
- After the specified number of days, verify that the objects have been transitioned to the correct storage classes. You can do this by checking the object's properties in the S3 console.
