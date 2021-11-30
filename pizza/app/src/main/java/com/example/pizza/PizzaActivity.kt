package com.example.pizza

import android.app.Activity
import android.content.Intent
import android.net.Uri
import android.os.Bundle
import android.util.Log
import android.widget.EditText
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import com.example.pizza.databinding.ActivityPizzaBinding

class PizzaActivity : AppCompatActivity() {

    private lateinit var binding: ActivityPizzaBinding

    lateinit var pizzaShopTextView: TextView
    lateinit var feedbackEditText : EditText

    private var pizzaShopName : String? = null
    private var pizzaShopUrl: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        binding = ActivityPizzaBinding.inflate(layoutInflater)
        setContentView(binding.root)

        setSupportActionBar(binding.toolbar)

        // view
        pizzaShopTextView = findViewById(R.id.pizzaShopTextView)
        feedbackEditText = findViewById(R.id.feedbackEditText)

        // intent data
        pizzaShopName = intent.getStringExtra("pizzaShopName")
        pizzaShopUrl = intent.getStringExtra("pizzaShopUrl")

        pizzaShopName?.let { Log.i("shop received", it)};
        pizzaShopUrl?.let { Log.i("url received", it)};

        pizzaShopName?.let {pizzaShopTextView.text = "You should get pizza at $pizzaShopName "}

        binding.fab.setOnClickListener { view -> loadWebSite() }
    }

    override fun onBackPressed() {
        val data = Intent()
        data.putExtra("feedback", feedbackEditText.text.toString())
        setResult(Activity.RESULT_OK, data) // must be set before super.OnBackPressed()
        super.onBackPressed()
        finish()
    }

    private fun loadWebSite() {
        // create intent
        var intent = Intent()
        intent.action = Intent.ACTION_VIEW
        intent.data = pizzaShopUrl?.let{ Uri.parse(pizzaShopUrl)}

        startActivity(intent)
    }
}