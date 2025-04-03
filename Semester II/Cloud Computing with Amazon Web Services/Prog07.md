# Experiment 7: Creating a Virtual Machine and Cloning it in VirtualBox with Kali Linux

## Aim
To create a virtual machine in VirtualBox, install Kali Linux, and clone the VM for future use.

---

## Step 1: Download and Install VirtualBox

### 1.1 Download VirtualBox
- Open your browser and go to the official VirtualBox website.
- Click on **Downloads**.
- Choose the appropriate installer for your OS:
  - **Windows**: Windows hosts
  - **macOS**: OS X hosts
  - **Linux**: Linux distributions
- Download the installer.

### 1.2 Install VirtualBox
- Run the downloaded installer.
- Click **Next** and use the default settings unless you have specific requirements.
- Complete the installation by clicking **Install**.
- Once installed, open **VirtualBox**.

---

## Step 2: Download Kali Linux ISO

### 2.1 Download Kali Linux
- Open your browser and go to the official Kali Linux download page.
- Under the **Bare Metal** section, select **64-bit (Installer)**.
- Download the `.iso` file.

---

## Step 3: Create a Virtual Machine in VirtualBox

### 3.1 Open VirtualBox
- Launch **VirtualBox**.

### 3.2 Create a New Virtual Machine
- Click **New**.

### 3.3 Name and Configure the VM
- **Name**: Kali Linux Base
- **Type**: Linux
- **Version**: Debian (64-bit)
- Click **Next**.

### 3.4 Allocate RAM
- Set **Memory size** to **2048 MB (2GB)** (or more if your system allows).
- Click **Next**.

### 3.5 Create a Virtual Hard Disk
- Select **Create a virtual hard disk now** → Click **Create**.
- Choose **Hard Disk File Type**: VDI (VirtualBox Disk Image)
- Click **Next**.
- **Storage Type**: Dynamically allocated
- Click **Next**.
- **Set Disk Size**: 20 GB (or more if needed).
- Click **Create**.

### 3.6 Configure Processors
- Click **Settings** → **System** → **Processor**.
- Set **Processors** to **2** (or more, depending on your system).
- Click **OK**.

---

## Step 4: Install Kali Linux

### 4.1 Mount the Kali Linux ISO
- Select the **Kali Linux VM** in VirtualBox Manager.
- Click **Settings** → **Storage**.
- Under **Controller: IDE**, select **Empty (CD/DVD drive)**.
- Click the **CD icon** → **Choose a disk file**.
- Select the **Kali Linux ISO** file downloaded earlier.
- Click **OK**.

### 4.2 Start the Virtual Machine
- Select the **Kali Linux VM**.
- Click **Start**.

### 4.3 Install Kali Linux
- When prompted, select **Graphical Install**.
- Choose your **language**, **location**, and **keyboard settings**.
- Enter a **username** and **password**.
- Choose **Guided - Use entire disk** for partitioning.
- Complete the installation by following the prompts.
- When installation is done, the system will reboot.

### 4.4 Verify the Installation
- After rebooting, log in using the **username** and **password**.
- You should now have a working **Kali Linux VM**.

---

## Step 5: Clone the Virtual Machine

### 5.1 Power Off the VM
- In **VirtualBox**, right-click on the **Kali Linux VM**.
- Click **Close** → **Power Off**.

### 5.2 Clone the VM
- Right-click on **Kali Linux Base** in VirtualBox.
- Select **Clone**.

### 5.3 Configure Clone Settings
- **Name**: Kali Linux Clone 1
- **Clone Type**: Choose **Full Clone** (creates an independent VM).
- **Snapshot**: If applicable, choose the latest snapshot.
- Click **Finish**.

### 5.4 Verify the Cloned VM
- Once cloning is complete, you will see **Kali Linux Clone 1** in VirtualBox Manager.
- Start the cloned VM to check if it runs properly.

---

✅ **You have successfully created and cloned a Kali Linux Virtual Machine in VirtualBox!**
