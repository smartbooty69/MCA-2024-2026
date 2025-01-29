package com.postfixexpression;

import android.os.Bundle;
import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
//Import UI Control classes and Stack class from Packages
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import android.view.View;
import java.util.Stack;
/** @noinspection ALL*/
public class MainActivity extends AppCompatActivity {
    // Your Code Begins Here
    // Creating Objects (Instances) for UI Control classes
    EditText postfix;
    Button evaluate;
    String exp;
    int result;
    // Method to evaluate value of a postfix expression
    static int evaluatePostfix(String exp)
    {
        // Create a stack
        Stack<Integer> stack = new Stack<>();
        // Scan all characters one by one
        for(int i = 0; i < exp.length(); i++)
        {
            char c = exp.charAt(i);
            if(c == ' ') {
                continue;
                // If the scanned character is an operand
                // (number here),extract the number
                // Push it to the stack.
            }
            else if(Character.isDigit(c))
            {
                int n = 0;
                // Extract the characters and store it in num
                while(Character.isDigit(c))
                {
                    n = n*10 + (int)(c-'0');
                    i++;
                    c = exp.charAt(i);
                }
                // Push the number in stack
                stack.push(n);
            }
            // If the scanned character is an operator, pop two
            // elements from stack apply the operator
            else
            {
                int val1 = stack.pop();
                int val2 = stack.pop();
                switch(c)
                {
                    case '+':
                        stack.push(val2 + val1);
                        break;
                    case '-':
                        stack.push(val2 - val1);
                        break;
                    case '/':
                        stack.push(val2 / val1);
                        break;
                    case '*':
                        stack.push(val2 * val1);
                        break;
                }
            }
        }
        return stack.pop();
    }
    // Your Code Ends Here
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_main);
        // Your Code Begins Here
        // Instantiating the objects by capturing the UI Controls from Layout
        postfix = (EditText)findViewById(R.id.txtPostFix);
        evaluate = (Button) findViewById(R.id.btnEvaluate);
        evaluate.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                // Obtaining values from the Objects (Instances) of UI Controls
                // exp = 100 200 + 2 / 5 * 7 +
                exp=postfix.getText().toString();
                result=evaluatePostfix(exp);
                // Display the result using Toast
                Toast.makeText(getApplicationContext(),"Evaluation of Postfix Expression "+exp+" is "+result,Toast.LENGTH_SHORT).show();
            }
        });
        // Your Code Ends Here
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main)
                , (v, insets) -> {
                    Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
                    v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
                    return insets;
                });
    }
}