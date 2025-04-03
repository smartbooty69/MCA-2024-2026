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

        btnShowPopup = findViewById(R.id.btnShowPopupMenu);
        ta = findViewById(R.id.txtA);
        tb = findViewById(R.id.txtB);

        btnShowPopup.setOnClickListener(v -> {
            PopupMenu popup = new PopupMenu(MainActivity.this, btnShowPopup);
            popup.getMenuInflater().inflate(R.menu.mypopup_menu, popup.getMenu());

            popup.setOnMenuItemClickListener(item -> {

                    a = Integer.parseInt(ta.getText().toString());
                    b = Integer.parseInt(tb.getText().toString());

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
            
            popup.show();
        });
    }

    public static int findHCF(int a, int b) {
        if (b == 0)
            return a;
        return findHCF(b, a % b);
    }

    public static int findLCM(int a, int b, int hcf) {
        return (a * b) / hcf;
    }
}