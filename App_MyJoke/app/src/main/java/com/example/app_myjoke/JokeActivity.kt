package com.example.app_myjoke

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button
import android.widget.TextView
import retrofit2.*
import retrofit2.converter.gson.GsonConverterFactory

class JokeActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_joke)

        val btJoke = findViewById<Button>(R.id.btJoke)

        btJoke.setOnClickListener {
            loadJoke()
        }
    }

    private fun loadJoke() {
        val tvJoke =findViewById<TextView>(R.id.tvJoke)

        //tvJoke.text = "Chiste encontrado!!!..."

        //Creo una instancia de retrofit
        val retrofit = Retrofit.Builder()
            .baseUrl("https://geek-jokes.sameerkumar.website/")
            .addConverterFactory(GsonConverterFactory.create())
            .build()

        //Creo una instancia de la interfaz
        val jokeService: JokeService
        jokeService = retrofit.create(JokeService::class.java)

        //creo una variable y le asigno el servicio
        val request = jokeService.getJoke("json")

        request.enqueue(object : Callback<Joke>{
            override fun onResponse(call: Call<Joke>, response: Response<Joke>) {
                if (response.isSuccessful){
                    tvJoke.text = response.body()!!.joke
                }
            }

            override fun onFailure(call: Call<Joke>, t: Throwable) {
                Log.d("jokeActivity", t.toString())
            }

        })
    }
}