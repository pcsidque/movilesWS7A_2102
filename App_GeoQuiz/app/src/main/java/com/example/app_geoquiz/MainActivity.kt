package com.example.app_geoquiz

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import android.widget.Toast

class MainActivity : AppCompatActivity() {
    lateinit var questions: ArrayList<Question>
    var indice = 0

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        loadQuestions()
        setupViews()
    }

    private fun loadQuestions() {
        questions = ArrayList()
        var question = Question("Es Quito capital de Ecuador", true)
        questions.add(question)

        questions.add(Question("Es Bolivia capital de Perú", false))
        questions.add(Question("Es La Paz capital de Perú", false))
        questions.add(Question("Es Bolivia capital de Perú", false))
        questions.add(Question("Es La Paz capital de Bolivia", true))
        questions.add(Question("Es Santiago capital de Ecuador", false))
        questions.add(Question("Es Bs As capital de Perú", false))
    }

    private fun setupViews() {
        val btYes = findViewById<Button>(R.id.btYes)
        val btNo = findViewById<Button>(R.id.btNo)
        val tvSentence = findViewById<TextView>(R.id.tvSentence)
        val btNext = findViewById<Button>(R.id.btNext)

        tvSentence.text = questions[indice].sentence

        btYes.setOnClickListener {
            if (questions[indice].answer)
            {
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        btNo.setOnClickListener {
            if (!questions[indice].answer)
            {
                Toast.makeText(this, "Correcto", Toast.LENGTH_LONG).show()
            }
            else{
                Toast.makeText(this, "Incorrecto", Toast.LENGTH_LONG).show()
            }
        }

        btNext.setOnClickListener {
            indice++
            tvSentence.text = questions[indice].sentence
        }
    }
}