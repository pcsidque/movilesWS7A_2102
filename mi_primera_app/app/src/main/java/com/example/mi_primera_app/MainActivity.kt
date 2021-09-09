package com.example.mi_primera_app

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import android.widget.EditText

const val EXTRA_MESS = "com.example.mi_primera_app.message"

class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun sendMessage(view: View){
        val editText = findViewById<EditText>(R.id.etCorreo)
        val message = editText.text.toString()
        val intent = Intent(this, DisplayMess::class.java).apply {
            putExtra(EXTRA_MESS, message)
        }
        startActivity(intent)
    }
}