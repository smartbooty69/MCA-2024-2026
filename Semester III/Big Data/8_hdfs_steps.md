### Program 8: HDFS steps (Cloudera terminal)

1) Open terminal
- Start a new terminal window in your Cloudera VM.

2) Check and disable Safe Mode
- Check: `hdfs dfsadmin -safemode get`
- If ON, disable: `hdfs dfsadmin -safemode leave`

3) Create a local sample file
- Create file: `echo "Hello Hadoop!" > sample.txt`
- Append:
  - `echo "This is the second line." >> sample.txt`
  - `echo "This is the third line." >> sample.txt`
  - `echo "Welcome to HDFS." >> sample.txt`
- Verify: `cat sample.txt`

4) Create HDFS directory and upload
- Make dir: `hdfs dfs -mkdir /HDFS-Folder`
- Upload: `hdfs dfs -put sample.txt /HDFS-Folder/`
- List: `hdfs dfs -ls /HDFS-Folder/`

5) View the file from HDFS
- Full content: `hdfs dfs -cat /HDFS-Folder/sample.txt`
- First 2 lines: `hdfs dfs -cat /HDFS-Folder/sample.txt | head -2`
- Last 2 lines: `hdfs dfs -cat /HDFS-Folder/sample.txt | tail -2`

6) Copy inside HDFS
- Create dir: `hdfs dfs -mkdir /Test`
- Copy+rename: `hdfs dfs -cp /HDFS-Folder/sample.txt /Test/samplecopy.txt`
- Verify: `hdfs dfs -ls /Test/`

7) Download back to local
- Download: `hdfs dfs -get /Test/samplecopy.txt`
- Verify locally: `ls`


