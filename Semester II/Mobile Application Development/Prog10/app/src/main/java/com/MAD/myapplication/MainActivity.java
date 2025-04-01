package com.MAD.myapplication;

import android.database.Cursor;
import android.database.sqlite.SQLiteDatabase;
import android.database.sqlite.SQLiteStatement;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    EditText txtId, txtName;
    SQLiteDatabase db;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        txtId = findViewById(R.id.txtStudentRNo);
        txtName = findViewById(R.id.txtStudentName);
        db = openOrCreateDatabase("StudentDB", MODE_PRIVATE, null);
        db.execSQL("CREATE TABLE IF NOT EXISTS students (id INTEGER PRIMARY KEY, name TEXT)");

        findViewById(R.id.btnInsert).setOnClickListener(v -> executeSQL("INSERT INTO students VALUES(?,?)", "Inserted!"));
        findViewById(R.id.btnUpdate).setOnClickListener(v -> executeSQL("UPDATE students SET name=? WHERE id=?", "Updated!"));
        findViewById(R.id.btnDelete).setOnClickListener(v -> executeSQL("DELETE FROM students WHERE id=?", "Deleted!"));
        findViewById(R.id.btnView).setOnClickListener(v -> viewData());
    }

    private void executeSQL(String query, String successMsg) {
        if (txtId.getText().toString().isEmpty() || (query.contains("?,")) && txtName.getText().toString().isEmpty()) {
            showToast("Fields cannot be empty!");
            return;
        }

        SQLiteStatement stmt = db.compileStatement(query);
        stmt.bindString(1, txtId.getText().toString());
        if (query.contains("?,")) stmt.bindString(2, txtName.getText().toString());
        stmt.execute();
        showToast(successMsg);
    }

    private void viewData() {
        Cursor c = db.rawQuery("SELECT * FROM students", null);
        if (c.getCount() == 0) { showToast("No Records Found"); return; }

        StringBuilder data = new StringBuilder();
        while (c.moveToNext()) data.append("ID: ").append(c.getInt(0)).append("\nName: ").append(c.getString(1)).append("\n\n");
        c.close();
        showToast(data.toString());
    }

    private void showToast(String msg) { Toast.makeText(this, msg, Toast.LENGTH_LONG).show(); }
}