package com.mad.prog06;

import android.os.Bundle;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.Toolbar;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    EditText txtNumber;
    Button btnCalculate;
    Toolbar toolbar;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        toolbar = findViewById(R.id.toolbar);
        setSupportActionBar(toolbar);
        txtNumber = findViewById(R.id.txtNumber);
        btnCalculate = findViewById(R.id.btnCalculate); // Reference to the button

        // Set button click listener
        btnCalculate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                long n = Long.parseLong(txtNumber.getText().toString());

                // You can choose either factorial or fibonacci depending on user input
                // For demonstration, let's compute both
                String result = "Factorial: " + findFact(n) + "\nFibonacci: " + getFibonacciSeries(n);
                Toast.makeText(MainActivity.this, result, Toast.LENGTH_LONG).show();
            }
        });
    }

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        getMenuInflater().inflate(R.menu.myoptions_menu, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        long n = Long.parseLong(txtNumber.getText().toString());

        if (item.getItemId() == R.id.mnuFact) {
            Toast.makeText(this, "Factorial value is " + findFact(n), Toast.LENGTH_LONG).show();
        } else if (item.getItemId() == R.id.mnuFibonacci) {
            Toast.makeText(this, "Fibonacci series: " + getFibonacciSeries(n), Toast.LENGTH_LONG).show();
        }
        return super.onOptionsItemSelected(item);
    }

    private long findFact(long num) {
        return (num < 2) ? 1 : num * findFact(num - 1);
    }

    private String getFibonacciSeries(long n) {
        StringBuilder res = new StringBuilder();
        for (int i = 0; i < n; i++) {
            res.append(genFibo(i)).append(i < n - 1 ? ", " : "");
        }
        return res.toString();
    }

    private long genFibo(int num) {
        return (num <= 1) ? num : genFibo(num - 1) + genFibo(num - 2);
    }
}