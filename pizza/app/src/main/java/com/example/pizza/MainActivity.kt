package com.example.pizza

import android.os.Bundle
import android.widget.RadioButton
import android.widget.RadioGroup
import android.widget.Spinner
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.constraintlayout.widget.ConstraintLayout
import com.google.android.material.snackbar.Snackbar
import com.google.android.material.switchmaterial.SwitchMaterial

class MainActivity : AppCompatActivity() {
    lateinit var messageTextView: TextView
    var message: String = ""

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
        messageTextView = findViewById<TextView>(R.id.messageTextView)
    }

    fun orderPizza(view: android.view.View) {
        val radioGroup = findViewById<RadioGroup>(R.id.radioGroup)
        val pizzaId = radioGroup.checkedRadioButtonId // returns in Int for the radio button that's selected
        var pizza : CharSequence = ""
        val layoutRoot = findViewById<ConstraintLayout>(R.id.root_layout)
        val spinner = findViewById<Spinner>(R.id.spinner)
        val switch = findViewById<SwitchMaterial>(R.id.glutenSwitch)

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

    fun updateUI() {
        //TextView
        messageTextView.text = message
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("message", message)
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        message = savedInstanceState.getString("message", "")
        updateUI()
    }
}