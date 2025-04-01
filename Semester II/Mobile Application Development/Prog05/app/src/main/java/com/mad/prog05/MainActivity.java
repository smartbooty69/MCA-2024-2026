package com.mad.prog05;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.PopupMenu;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {

    Button btnShowPopup;
    EditText ta, tb;
    String option;
    int a, b, hcf, lcm;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        // Initialize UI elements
        btnShowPopup = findViewById(R.id.btnShowPopupMenu);
        ta = findViewById(R.id.txtA);
        tb = findViewById(R.id.txtB);

        // Set click listener for the button to show popup menu
        btnShowPopup.setOnClickListener(v -> {
            PopupMenu popup = new PopupMenu(MainActivity.this, btnShowPopup);
            popup.getMenuInflater().inflate(R.menu.mypopup_menu, popup.getMenu());

            // Handle menu item clicks
            popup.setOnMenuItemClickListener(item -> {
                try {
                    // Get values from EditText fields
                    a = Integer.parseInt(ta.getText().toString());
                    b = Integer.parseInt(tb.getText().toString());
                } catch (NumberFormatException e) {
                    Toast.makeText(MainActivity.this, "Please enter valid numbers", Toast.LENGTH_SHORT).show();
                    return false;
                }

                // Perform action based on selected menu item
                option = (String) item.getTitle();
                if (option != null && option.equalsIgnoreCase("Find HCF")) {
                    hcf = findHCF(a, b);
                    Toast.makeText(MainActivity.this, "HCF is " + hcf, Toast.LENGTH_SHORT).show();
                } else if (option.equalsIgnoreCase("Find LCM")) {
                    lcm = findLCM(a, b, hcf);
                    Toast.makeText(MainActivity.this, "LCM is " + lcm, Toast.LENGTH_SHORT).show();
                }
                return false;
            });

            // Show the popup menu
            popup.show();
        });
    }

    // Method to find HCF (Highest Common Factor)
    public static int findHCF(int a, int b) {
        if (b == 0)
            return a;
        return findHCF(b, a % b);
    }

    // Method to find LCM (Least Common Multiple)
    public static int findLCM(int a, int b, int hcf) {
        return (a * b) / hcf;
    }
}