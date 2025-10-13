import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class MatrixMultiplication {

    /**
     * Mapper: Reads matrix elements and emits intermediate key-value pairs.
     * For each element A(i, k) of matrix A, it emits p pairs: ((i, j), (A, k, A(i, k))) for j = 0..p-1.
     * For each element B(k, j) of matrix B, it emits m pairs: ((i, j), (B, k, B(k, j))) for i = 0..m-1.
     */
    public static class MatrixMapper extends Mapper<Object, Text, Text, Text> {
        // Dimensions of the matrices. A is m x n, B is n x p.
        // For this example, we assume 2x2 matrices.
        private int m = 2; // rows in A
        private int p = 2; // cols in B

        public void map(Object key, Text value, Context context) throws IOException, InterruptedException {
            String[] parts = value.toString().split(",");
            String matrix = parts[0];
            int row = Integer.parseInt(parts[1].trim());
            int col = Integer.parseInt(parts[2].trim());
            int val = Integer.parseInt(parts[3].trim());

            if (matrix.equals("A")) {
                for (int j = 0; j < p; j++) {
                    // Key: (row, j), Value: (A, col, value)
                    context.write(new Text(row + "," + j), new Text("A," + col + "," + val));
                }
            } else if (matrix.equals("B")) {
                for (int i = 0; i < m; i++) {
                    // Key: (i, col), Value: (B, row, value)
                    context.write(new Text(i + "," + col), new Text("B," + row + "," + val));
                }
            }
        }
    }

    /**
     * Reducer: Receives all values for a given key (i, j) and calculates the dot product.
     * The key represents a cell (i, j) in the output matrix.
     * The values are the necessary rows from A and columns from B to compute the result for that cell.
     */
    public static class MatrixReducer extends Reducer<Text, Text, Text, IntWritable> {
        public void reduce(Text key, Iterable<Text> values, Context context)
                throws IOException, InterruptedException {

            Map<Integer, Integer> mapA = new HashMap<>();
            Map<Integer, Integer> mapB = new HashMap<>();

            for (Text val : values) {
                String[] parts = val.toString().split(",");
                if (parts[0].equals("A")) {
                    mapA.put(Integer.parseInt(parts[1]), Integer.parseInt(parts[2]));
                } else {
                    mapB.put(Integer.parseInt(parts[1]), Integer.parseInt(parts[2]));
                }
            }

            int result = 0;
            // Calculate the dot product
            for (Integer k : mapA.keySet()) {
                if (mapB.containsKey(k)) {
                    result += mapA.get(k) * mapB.get(k);
                }
            }

            context.write(key, new IntWritable(result));
        }
    }

    // Driver code
    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "Matrix Multiplication");

        job.setJarByClass(MatrixMultiplication.class);
        job.setMapperClass(MatrixMapper.class);
        job.setReducerClass(MatrixReducer.class);

        job.setMapOutputKeyClass(Text.class);
        job.setMapOutputValueClass(Text.class);

        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(IntWritable.class);

        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}


