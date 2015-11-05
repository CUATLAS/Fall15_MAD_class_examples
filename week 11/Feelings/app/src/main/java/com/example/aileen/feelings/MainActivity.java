package com.example.aileen.feelings;

import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.view.View;
import android.widget.EditText;
import android.widget.Spinner;
import android.widget.TextView;

public class MainActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    public void findMood(View view){
        TextView feeling = (TextView) findViewById(R.id.feelingText);
        Spinner moodSpinner = (Spinner) findViewById(R.id.spinner);
        String moodValue = String.valueOf(moodSpinner.getSelectedItem());
        EditText name = (EditText) findViewById(R.id.name_editText);
        String nameValue = name.getText().toString();
        feeling.setText(nameValue + " is in a " + moodValue + " mood");
    }
}
