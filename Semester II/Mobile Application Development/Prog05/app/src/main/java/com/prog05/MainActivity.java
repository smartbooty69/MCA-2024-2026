package com.prog05;

import android.os.Bundle;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import android.widget.Button;
import android.widget.PopupMenu;
import android.widget.EditText;
import android.widget.Toast;

public class MainActivity extends AppCompatActivity {
    Button btnShowPopup;
    EditText ta,tb;
    String option;
    int a,b,hcf,lcm;
    // Your Code Ends Here
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        // Your Code Begins Here
        // Step 3: Instantiate the Button Object
        btnShowPopup= findViewById(R.id.btnShowPopupMenu);
        ta= findViewById(R.id.txtA);
        tb= findViewById(R.id.txtB);
        // Step 4: Add or Set listener to the Button
        btnShowPopup.setOnClickListener(v -> {
            // Step 5: Creating and instantiating
            // the instance of PopupMenu
            PopupMenu popup = new PopupMenu(MainActivity.this,
                    btnShowPopup);
            //Step 6: Inflating the Popup using xml file
            popup.getMenuInflater().inflate(R.menu.mypopup_menu,
                    popup.getMenu());
            //Step 7: Registering popup with OnMenuItemClickListener
            popup.setOnMenuItemClickListener(item -> {
                a=Integer.parseInt(ta.getText().toString());
                b=Integer.parseInt(tb.getText().toString());
                option = (String) item.getTitle();
                if (option != null && option.equalsIgnoreCase("Find HCF")) {
                    hcf = findHCF(a,b);
                    Toast.makeText(MainActivity.this,"HCF is " + hcf,
                            Toast.LENGTH_SHORT).show();
                }
                assert option != null;
                if (option.equalsIgnoreCase("Find LCM")) {
                    lcm = findLCM(a,b,hcf);
                    Toast.makeText(MainActivity.this,"LCM is " + lcm,
                            Toast.LENGTH_SHORT).show();
                }
                return false;
            });
            //Step 8: Showing popup menu
            popup.show();
        }); // Closing the setOnClickListener method
        // Your Code Ends Here
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main),
                (v, insets) -> {
                    Insets systemBars =
                            insets.getInsets(WindowInsetsCompat.Type.systemBars());
                    v.setPadding(systemBars.left, systemBars.top, systemBars.right,
                            systemBars.bottom);
                    return insets;
                });
    }
    public static int findHCF(int a, int b)
    {
        if(a==0)
            return b;
        else
            return findHCF(b%a,a);
    }
    public static int findLCM(int a, int b, int hcf)
    {
        return (a*b)/hcf;
    }
}

