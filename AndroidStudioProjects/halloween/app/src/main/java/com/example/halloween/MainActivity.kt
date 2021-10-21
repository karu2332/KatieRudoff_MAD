package com.example.halloween

import android.os.Bundle
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity

class MainActivity : AppCompatActivity() {
    lateinit var editName:EditText

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        val editName = findViewById<EditText>(R.id.editTextName)
    }

    fun sayBoo(view: android.view.View) {
        val booText = findViewById<TextView>(R.id.textMessage)
        val name = editName.text
        booText.text = "Happy Halloween " + name + "!"

        val imageGhost = findViewById<ImageView>(R.id.imageView)
        imageGhost.setImageResource(R.drawable.ghost)
    }
}