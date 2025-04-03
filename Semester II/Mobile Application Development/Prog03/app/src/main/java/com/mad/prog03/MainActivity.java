package com.mad.prog03;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;
import java.util.Stack;

public class MainActivity extends AppCompatActivity {

    EditText postfix;
    Button evaluate;
    String exp;
    int result;

    static int evaluatePostfix(String exp) {
        
        Stack<Integer> stack = new Stack<>();
        String[] tokens = exp.split(" ");  

        for (String token : tokens) {
            if (token.isEmpty()) continue;  

            if (isNumeric(token)) {
                stack.push(Integer.parseInt(token));
            } else {
                
                int val1 = stack.pop();
                int val2 = stack.pop();

                switch (token) {
                    case "+":
                        stack.push(val2 + val1);
                        break;
                    case "-":
                        stack.push(val2 - val1);
                        break;
                    case "*":
                        stack.push(val2 * val1);
                        break;
                    case "/":
                        if (val1 != 0) {
                            stack.push(val2 / val1);
                        } else {
                            return Integer.MIN_VALUE;  
                        }
                        break;
                }
            }
        }
        return stack.pop();  
    }

    static boolean isNumeric(String str) {
        try {
            Integer.parseInt(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        
        postfix = findViewById(R.id.txtPostFix);
        evaluate = findViewById(R.id.btnEvaluate);

        evaluate.setOnClickListener(v -> {
            
            exp = postfix.getText().toString().trim();
            result = evaluatePostfix(exp);

            if (result == Integer.MIN_VALUE) {
                Toast.makeText(getApplicationContext(), "Error in expression (possibly division by zero)", Toast.LENGTH_SHORT).show();
            } else {
                Toast.makeText(getApplicationContext(), "Evaluation of Postfix Expression: " + exp + " = " + result, Toast.LENGTH_SHORT).show();
            }
        });
    }
}