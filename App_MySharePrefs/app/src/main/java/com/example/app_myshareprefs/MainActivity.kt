package com.example.app_myshareprefs

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast
import com.google.android.material.textfield.TextInputEditText
import com.google.android.material.textfield.TextInputLayout

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val sharedPreferences = SharedPreferences(this)

        val btSave = findViewById<Button>(R.id.btSave)
        val btRetrieve = findViewById<Button>(R.id.btRetrieve)
        val etUser = findViewById<TextInputEditText>(R.id.etUser)
        val tvRetrieve = findViewById<TextView>(R.id.tvRetrieve)

        btSave.setOnClickListener {
            val name = etUser.text.toString()
            sharedPreferences.save("name", name)

            Toast.makeText(this, "Usuario almacenado", Toast.LENGTH_LONG).show()
        }

        btRetrieve.setOnClickListener {
            tvRetrieve.setText(sharedPreferences.getValue("name"))
        }
    }
}