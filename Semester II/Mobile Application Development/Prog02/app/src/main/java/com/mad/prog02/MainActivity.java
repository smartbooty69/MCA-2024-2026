package com.mad.prog02;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import android.view.View;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText principal, rate, period;
    Button sint, cint, sintp, cintp;
    double p, r, t, si, ci, sip, cip;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        principal = findViewById(R.id.txtPrincipal);
        rate = findViewById(R.id.txtIntRate);
        period = findViewById(R.id.txtPeriod);
        sint = findViewById(R.id.btnSInt);
        cint = findViewById(R.id.btnCInt);
        sintp = findViewById(R.id.btnSIntP);
        cintp = findViewById(R.id.btnCIntP);

        sint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                p = Double.parseDouble(principal.getText().toString());
                r = Double.parseDouble(rate.getText().toString());
                t = Double.parseDouble(period.getText().toString());
                si = (p * t * r) / 100;
                Toast.makeText(getApplicationContext(), "Simple Interest is " + si, Toast.LENGTH_SHORT).show();
            }
        });
        
        cint.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                p = Double.parseDouble(principal.getText().toString());
                r = Double.parseDouble(rate.getText().toString());
                t = Double.parseDouble(period.getText().toString());
                double amount = p * Math.pow((1 + r / 100), t);
                ci = amount - p;
                Toast.makeText(getApplicationContext(), "Compound Interest is " + ci, Toast.LENGTH_SHORT).show();
            }
        });

        sintp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                p = Double.parseDouble(principal.getText().toString());
                r = Double.parseDouble(rate.getText().toString());
                t = Double.parseDouble(period.getText().toString());
                sip = ((p * t * r) / 100) + p;
                Toast.makeText(getApplicationContext(), "Simple Interest with Principal Amount is " + sip, Toast.LENGTH_SHORT).show();
            }
        });

        cintp.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                p = Double.parseDouble(principal.getText().toString());
                r = Double.parseDouble(rate.getText().toString());
                t = Double.parseDouble(period.getText().toString());
                cip = p * Math.pow((1 + r / 100), t);
                Toast.makeText(getApplicationContext(), "Compound Interest with Principal Amount is " + cip, Toast.LENGTH_SHORT).show();
            }
        });
    }
}