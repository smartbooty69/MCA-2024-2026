# Experiment 6: Creating a Virtual Machine and Working with Snapshots in VirtualBox

## 🎯 Aim
To create a virtual machine using VirtualBox, install Kali Linux, take snapshots, and perform file operations within the VM.

---

## 🔹 Part 1: Downloading and Installing VirtualBox

### Step 1: Download VirtualBox
- Open your web browser and go to the [official VirtualBox website](https://www.virtualbox.org/).
- Navigate to the "Downloads" section.
- Select the appropriate VirtualBox package for your operating system (Windows, macOS, Linux, etc.).
- Download the installer.

### Step 2: Install VirtualBox
- Run the downloaded installer.
- Follow the on-screen instructions and use the default settings unless specific configurations are required.
- Complete the installation and ensure VirtualBox is successfully installed.

---

## 🔹 Part 2: Downloading the Kali Linux ISO File

### Step 1: Download Kali Linux ISO
- Open your browser and go to the [official Kali Linux download page](https://www.kali.org/get-kali/).
- Choose the appropriate Kali Linux ISO file for your system architecture (typically 64-bit).
- Download the ISO file.

---

## 🔹 Part 3: Creating a Virtual Machine

### Step 1: Open VirtualBox
- Launch the VirtualBox application.

### Step 2: Create a New Virtual Machine
- Click the **"New"** button in VirtualBox Manager.

### Step 3: Name and Configure the VM
- **Name:** Enter "Kali Linux VM".
- **Type:** Select "Linux".
- **Version:** Select "Debian (64-bit)".
- Click **"Next"**.

### Step 4: Allocate Memory
- Allocate at least **2048 MB (2GB)** of RAM.
- Click **"Next"**.

### Step 5: Create a Virtual Hard Disk
- Select **"Create a virtual hard disk now"**.
- Click **"Create"**.

### Step 6: Choose Hard Disk File Type
- Select **"VDI (VirtualBox Disk Image)"**.
- Click **"Next"**.

### Step 7: Storage on Physical Hard Disk
- Select **"Dynamically allocated"**.
- Click **"Next"**.

### Step 8: File Location and Size
- Choose the location to store the virtual hard disk file.
- Set the disk size to **20GB**.
- Click **"Create"**.

### Step 9: Configure Processors
- Select the created VM in VirtualBox Manager.
- Click **"Settings" → "System" → "Processor"**.
- Set **Processors to 2** (or more if supported).
- Click **"OK"**.

---

## 🔹 Part 4: Installing Kali Linux

### Step 1: Mount the ISO File
- Select the VM in VirtualBox Manager.
- Click **"Settings" → "Storage"**.
- Under **"Storage Devices"**, select **"Empty"** (CD/DVD drive).
- Click the **CD icon** → **"Choose a disk file"**.
- Select the **Kali Linux ISO** file downloaded earlier.
- Click **"OK"**.

### Step 2: Start the VM
- Select the VM in VirtualBox Manager.
- Click **"Start"**.

### Step 3: Install Kali Linux
- Choose **"Graphical Install"**.
- Follow the installation prompts.
- Set up a **username** and **password**.
- Select **"Guided - Use entire disk"** for partitioning.
- Complete the installation process.
- After installation, the system will reboot into Kali Linux.

---

## 🔹 Part 5: Taking a Snapshot

### Step 1: Start the VM
- If the VM is not running, start it from VirtualBox Manager.

### Step 2: Take a Snapshot
- Go to the **"Machine"** menu in the VM window.
- Select **"Take Snapshot"**.

### Step 3: Name the Snapshot
- Enter a descriptive name such as **"Clean Install"**.
- Click **"OK"**.

---

## 🔹 Part 6: Performing File Operations within the VM

### Step 1: Open the Terminal
- Log in to Kali Linux.
- Open the **Terminal** application.

### Step 2: Create a File and Perform Operations
```bash
ls                    # List files and directories
mkdir testdir         # Create a directory named "testdir"
cd testdir            # Change directory to "testdir"
pwd                   # Print working directory
vi testfile.txt       # Create and edit a file named "testfile.txt"
cat testfile.txt      # Display the contents of "testfile.txt"
```

---

## 🔹 Part 7: Restoring the Snapshot

### Step 1: Shutdown the VM
- Shut down Kali Linux from within the VM.

### Step 2: Restore the Snapshot
- Select the VM in **VirtualBox Manager**.
- Click **"Snapshots"**.
- Select the snapshot **"Clean Install"**.
- Click **"Restore"**.
- Confirm the restore operation.

### Step 3: Start the VM
- Start the VM.

### Step 4: Verify File Operations
- Open the **Terminal** and verify that the files and directories created in Part 6 are no longer present.

---

### ✅ You have successfully created a Virtual Machine, installed Kali Linux, worked with snapshots, and performed file operations!
