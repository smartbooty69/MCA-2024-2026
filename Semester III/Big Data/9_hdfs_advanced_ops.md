### Program 9: Advanced HDFS and VM operations (Cloudera)

#### a) Share a folder from Windows to Cloudera (VirtualBox)
1. With VM powered off: Settings → Shared Folders → Add.
2. Folder Path: pick your Windows folder; Folder Name: `windows_share`.
3. Check Auto-mount and Make Permanent → OK.
4. In Cloudera terminal:
```bash
mkdir -p ~/Desktop/windows_folder
sudo mount -t vboxsf windows_share ~/Desktop/windows_folder
```

#### b) Display space used by files in an HDFS directory
```bash
hdfs dfs -du -h /user/cloudera
```

#### c) Append data to an existing HDFS file
```bash
hdfs dfs -appendToFile local_file.txt /user/cloudera/hdfs_file.txt
```

#### d) Use -put and -copyToLocal
- Upload to HDFS:
```bash
hdfs dfs -put worddata.txt /user/cloudera/
```
- Download from HDFS:
```bash
hdfs dfs -copyToLocal /user/cloudera/worddata.txt ~/Desktop/
```

#### e) Move or rename a file within HDFS
```bash
hdfs dfs -mkdir -p /user/cloudera/documents
hdfs dfs -mv /user/cloudera/worddata.txt /user/cloudera/documents/
```

#### f) Delete a file (or directory) from HDFS
- Delete file:
```bash
hdfs dfs -rm /user/cloudera/documents/worddata.txt
```
- Delete directory recursively (careful):
```bash
hdfs dfs -rm -r /path/to/dir
```


