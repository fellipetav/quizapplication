package com.example.quizapplication

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.Button
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    var result: String = "Aracaju"
    lateinit var choice1: Button
    lateinit var choice2: Button
    lateinit var choice3: Button

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        setButtons()
        setOnClickListenerOnChoice1Button()
        setOnClickListenerOnChoice2Button()
        setOnClickListenerOnChoice3Button()
    }

    private fun setButtons() {
        choice1 = findViewById(R.id.choice1);
        choice2 = findViewById(R.id.choice2);
        choice3 = findViewById(R.id.choice3);
    }

    private fun setOnClickListenerOnChoice1Button() {
        choice1.setOnClickListener {
            if (choice1.text.equals(result))
                showToast("true")
            else
                showToast("false")
            showToastMessage(choice1.text.equals(result))
        }
    }

    private fun setOnClickListenerOnChoice2Button() {
        choice2.setOnClickListener {
            if (choice2.text.equals(result))
                showToast("true")
            else
                showToast("false")
            showToastMessage(choice2.text.equals(result))
        }
    }

    private fun setOnClickListenerOnChoice3Button() {
        choice3.setOnClickListener {
            if (choice3.text.equals(result))
                showToast("true")
            else
                showToast("false")
            showToastMessage(choice3.text.equals(result))
        }
    }

    private fun showToast(msg: String) {
        Toast.makeText(this, msg, Toast.LENGTH_SHORT).show()
    }

    private fun showToastMessage(showToastMessage: Boolean) {
        if (showToastMessage)
            showToast("Correct")
        else
            showToast("Wrong")
    }

}