package com.example.lab_6

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView


class MainActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    fun pressPlay(view: android.view.View) {
        val songText = findViewById<TextView>(R.id.songText)
        val editSong = findViewById<EditText>(R.id.editSong)
        val song = editSong.text

        // images
        val imageBeats = findViewById<ImageView>(R.id.music)
        imageBeats.setImageResource(R.drawable.music)

        songText.setText("Now playing " + song + " !")
    }
}