package com.example.pizza

import android.app.Activity
import android.content.Intent
import android.os.Bundle
import android.util.Log
import android.widget.*
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    lateinit var messageTextView: TextView // stores the "message" variable
    lateinit var layoutRoot : ConstraintLayout
    lateinit var radioGroup : RadioGroup
    lateinit var switch : SwitchMaterial
    lateinit var spinner : Spinner
    lateinit var locationButton : Button
    lateinit var reviewTextView : TextView

    var pizzaId = -1
    private var myPizzaShop = PizzaShop();
    private var selectedLocationPosition = 0
    private val REQUEST_CODE = 1

    var message: String = "" //
    var review: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // views
        messageTextView = findViewById<TextView>(R.id.messageTextView)
        layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)
        radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        switch = findViewById<SwitchMaterial>(R.id.glutenSwitch)
        spinner = findViewById<Spinner>(R.id.spinner)
        locationButton = findViewById<Button>(R.id.locationButton)
        reviewTextView = findViewById<TextView>(R.id.reviewTextView)

        // event listener
        locationButton.setOnClickListener {
            selectedLocationPosition = spinner.selectedItemPosition
            myPizzaShop.suggestPizzaShop(selectedLocationPosition)
            Log.i("shop suggested", myPizzaShop.name);
            Log.i("url suggested", myPizzaShop.url);

            // create intent
            val intent = Intent(this, PizzaActivity:: class.java)
            intent.putExtra("pizzaShopName", myPizzaShop.name)
            intent.putExtra("pizzaShopUrl", myPizzaShop.url)
            startActivityForResult(intent, REQUEST_CODE)
        }
    }

    fun orderPizza(view: android.view.View) {
        var pizza : CharSequence = ""
        pizzaId = radioGroup.checkedRadioButtonId // returns in Int for the radio button that's selected

        if (pizzaId == -1){
            // snackbar
            val pizzaSnackbar = Snackbar.make(layoutRoot, "Please select a pizza", Snackbar.LENGTH_SHORT)
            pizzaSnackbar.show()
        } else {
            pizza = findViewById<RadioButton>(pizzaId).text
            val location = spinner.selectedItem
            if (switch.isChecked) {
                pizza = switch.text.toString() + " $pizza"
            }
            // textview
            message = "Order Placed! Your $pizza pizza from $location is on its way."
            updateUI()
        }
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if((requestCode == REQUEST_CODE) && (resultCode == Activity.RESULT_OK)) {
            review = data?.let{data.getStringExtra("feedback")}.toString()
            reviewTextView.text = review
        }
    }

    fun updateUI() {
        //TextView
        messageTextView.text = message
        reviewTextView.text = review
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
        outState.putString("review", review)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        review = savedInstanceState.getString("review", "")
        updateUI()
    }
}