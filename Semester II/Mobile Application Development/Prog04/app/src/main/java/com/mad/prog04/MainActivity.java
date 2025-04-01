package com.mad.prog04;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.view.View;
import android.widget.Toast;
import java.text.MessageFormat;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText ta, tb, tr;
    Button plus, minus, multiply, divide;
    double a, b, r;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ta = findViewById(R.id.txtA);
        tb = findViewById(R.id.txtB);
        tr = findViewById(R.id.txtRes);
        plus = findViewById(R.id.btnPlus);
        minus = findViewById(R.id.btnMinus);
        multiply = findViewById(R.id.btnMultiply);
        divide = findViewById(R.id.btnDivide);

        plus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    a = Double.parseDouble(ta.getText().toString());
                    b = Double.parseDouble(tb.getText().toString());
                    r = a + b;
                    tr.setText(MessageFormat.format("{0}", r));
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Invalid input", Toast.LENGTH_SHORT).show();
                }
            }
        });

        minus.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    a = Double.parseDouble(ta.getText().toString());
                    b = Double.parseDouble(tb.getText().toString());
                    r = a - b;
                    tr.setText(MessageFormat.format("{0}", r));
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Invalid input", Toast.LENGTH_SHORT).show();
                }
            }
        });

        multiply.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    a = Double.parseDouble(ta.getText().toString());
                    b = Double.parseDouble(tb.getText().toString());
                    r = a * b;
                    tr.setText(MessageFormat.format("{0}", r));
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Invalid input", Toast.LENGTH_SHORT).show();
                }
            }
        });

        divide.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                try {
                    a = Double.parseDouble(ta.getText().toString());
                    b = Double.parseDouble(tb.getText().toString());
                    if (b == 0) {
                        tr.setText("Cannot divide by zero");
                    } else {
                        r = a / b;
                        tr.setText(MessageFormat.format("{0}", r));
                    }
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Invalid input", Toast.LENGTH_SHORT).show();
                }
            }
        });
    }
}