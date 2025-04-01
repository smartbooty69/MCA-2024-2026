package com.mad.prog07;

import android.app.DatePickerDialog;
import android.os.Bundle;
import android.widget.Button;
import android.widget.DatePicker;
import android.widget.EditText;
import android.widget.TextView;
import androidx.appcompat.app.AppCompatActivity;
import java.time.LocalDate;
import java.time.Period;
import java.util.Calendar;

public class MainActivity extends AppCompatActivity {
    EditText txtName;
    Button btnSelectDOB, btnCalculate;
    TextView txtResult;
    LocalDate dob;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtName = findViewById(R.id.txtName);
        btnSelectDOB = findViewById(R.id.btnSelectDOB);
        btnCalculate = findViewById(R.id.btnCalculate);
        txtResult = findViewById(R.id.txtResult);

        btnSelectDOB.setOnClickListener(v -> showDatePicker());
        btnCalculate.setOnClickListener(v -> calculateAge());
    }

    private void showDatePicker() {
        Calendar calendar = Calendar.getInstance();
        new DatePickerDialog(this, (DatePicker view, int year, int month, int day) -> {
            dob = LocalDate.of(year, month + 1, day);
            btnSelectDOB.setText(day + "/" + (month + 1) + "/" + year);
        }, calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH), calendar.get(Calendar.DAY_OF_MONTH)).show();
    }

    private void calculateAge() {
        if (dob == null || txtName.getText().toString().isEmpty()) {
            txtResult.setText("Please enter your name and select DOB!");
            return;
        }
        Period age = Period.between(dob, LocalDate.now());
        txtResult.setText(txtName.getText().toString() + "'s Age: " + age.getYears() + " Years, " + age.getMonths() + " Months, " + age.getDays() + " Days");
    }
}