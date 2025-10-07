### Program 10: Hadoop Word Count (Cloudera VM)

1) Create Java source
```bash
gedit WordCount.java
```
Paste the code from `WordCount.java` in this repo, save and close.

2) Create input and upload to HDFS
```bash
gedit Input.txt
```
Paste:
```
Hello Hadoop Hello World
This is a test of the Hadoop Word Count program
Counting words is the Hello World of Hadoop
```
Then:
```bash
hdfs dfs -mkdir /input
hdfs dfs -put Input.txt /input
```

3) Compile and package
```bash
javac -classpath $(hadoop classpath) WordCount.java
jar -cvf wordcount.jar *.class
```

4) Run MapReduce job
```bash
hadoop jar wordcount.jar WordCount /input /output
```

5) Check and download results
```bash
hdfs dfs -ls /output
hdfs dfs -cat /output/part-r-00000
hdfs dfs -copyToLocal /output/part-r-00000 ~/Desktop/
```

Open `~/Desktop/part-r-00000` to view word counts.


