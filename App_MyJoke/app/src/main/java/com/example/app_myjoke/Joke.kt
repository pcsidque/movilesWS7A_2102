package com.example.app_myjoke

import com.google.gson.annotations.SerializedName

class Joke (
    @SerializedName("joke")
    var joke: String
        )