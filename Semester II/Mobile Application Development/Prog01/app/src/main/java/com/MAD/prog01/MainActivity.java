package com.mad.prog01;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

/** @noinspection ALL*/
public class MainActivity extends AppCompatActivity {
    
    EditText ta, tb, tc;
    Button findBig, findSmall;
    double a, b, c, big, small;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ta = findViewById(R.id.txtA);
        tb = findViewById(R.id.txtB);
        tc = findViewById(R.id.txtC);
        findBig = findViewById(R.id.btnFindBiggest);
        findSmall = findViewById(R.id.btnFindSmallest);

        findBig.setOnClickListener(v -> {
            try {
                a = Double.parseDouble(ta.getText().toString());
                b = Double.parseDouble(tb.getText().toString());
                c = Double.parseDouble(tc.getText().toString());
            } catch (NumberFormatException e) {
                Toast.makeText(getApplicationContext(), "Invalid input! Please enter valid numbers.", Toast.LENGTH_SHORT).show();
                return;
            }

            if (a > b && a > c)
                big = a;
            else if (b > c)
                big = b;
            else
                big = c;

            Toast.makeText(getApplicationContext(), "Biggest Number among " + a + ", " + b + " and " + c + " is " + big, Toast.LENGTH_SHORT).show();
        });

        findSmall.setOnClickListener(v -> {
            try {
                a = Double.parseDouble(ta.getText().toString());
                b = Double.parseDouble(tb.getText().toString());
                c = Double.parseDouble(tc.getText().toString());
            } catch (NumberFormatException e) {
                Toast.makeText(getApplicationContext(), "Invalid input! Please enter valid numbers.", Toast.LENGTH_SHORT).show();
                return;
            }

            if (a < b && a < c)
                small = a;
            else if (b < c)
                small = b;
            else
                small = c;

            Toast.makeText(getApplicationContext(), "Smallest Number among " + a + ", " + b + " and " + c + " is " + small, Toast.LENGTH_SHORT).show();
        });
    }
}