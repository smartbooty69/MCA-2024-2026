### Program 11: Hadoop Matrix Multiplication (2x2) - Steps

1) Create Java source
```bash
gedit MatrixMultiplication.java
```
Paste the code from `MatrixMultiplication.java`, save and close.

2) Create input and upload to HDFS
```bash
gedit matdata.txt
```
Paste:
```
A,0,0,1
A,0,1,2
A,1,0,3
A,1,1,4
B,0,0,5
B,0,1,6
B,1,0,7
B,1,1,8
```
Then:
```bash
hdfs dfs -mkdir /matrix_input
hdfs dfs -put matdata.txt /matrix_input
```

3) Compile and package
```bash
javac -classpath $(hadoop classpath) MatrixMultiplication.java
jar -cvf matrix.jar *.class
```

4) Run MapReduce job
```bash
hadoop jar matrix.jar MatrixMultiplication /matrix_input /matrix_output
```

5) Check and download results
```bash
hdfs dfs -ls /matrix_output
hdfs dfs -cat /matrix_output/part-r-00000
hdfs dfs -copyToLocal /matrix_output/part-r-00000 ~/Desktop/
```

Expected contents of `part-r-00000`:
```
0,0	19
0,1	22
1,0	43
1,1	50
```


