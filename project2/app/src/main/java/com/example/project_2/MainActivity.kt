package com.example.project_2

import android.os.Bundle
import android.widget.Button
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView

class MainActivity : AppCompatActivity() {

    private var prices = arrayOf(40, 58, 371, 496, 1043, 250)

    private lateinit var layoutManager: RecyclerView.LayoutManager
    private lateinit var adapter: RecyclerView.Adapter<RecyclerAdapter.ViewHolder>
    private lateinit var recyclerView: RecyclerView
    private lateinit var totalPrice: TextView
    private lateinit var reset: Button
    private lateinit var calculate: Button
    lateinit var groceries: ArrayList<GroceryItem>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        recyclerView = findViewById(R.id.recycler_view)
        totalPrice = findViewById(R.id.total_price)
        reset = findViewById(R.id.reset)
        calculate = findViewById(R.id.calculate)

        groceries = GroceryItem.createGroceryList()

        totalPrice.setText("$0.00")

        reset.setOnClickListener {
            resetTotal()
        }

        calculate.setOnClickListener {
            updateTotal()
        }

        layoutManager = LinearLayoutManager(this)
        recyclerView.layoutManager = layoutManager
        adapter = RecyclerAdapter(groceries)
        recyclerView.adapter = adapter
    }

    private fun updateTotal() {
        var total = 0

        for (i in 0 until groceries.size) {
            var g = groceries.get(i)
            var quantity: Int
            try {
                quantity = g.quantity.toInt()
            } catch (nfe: NumberFormatException) {
                quantity = 0
            }
            total += quantity * g.price
        }

        var dollars = total / 100
        var cents = total % 100
        if (cents < 10) {
            totalPrice.setText("$$dollars.${cents}0")
        } else {
            totalPrice.setText("$$dollars.${cents}")
        }
    }
    public fun resetTotal() {
        for (i in 0 until adapter.itemCount) {
            var q: TextView
            var v = recyclerView?.findViewHolderForAdapterPosition(i)?.itemView

            if (v != null) {
                q = v.findViewById(R.id.inputtedQuantity)

                if (q != null) {
                    q.setText("")
                }
            }
        }
        totalPrice.setText("$0.00")
    }

    override fun onSaveInstanceState(outState: Bundle) {
        super.onSaveInstanceState(outState)
        outState.putString("totalPrice", totalPrice.getText().toString())
        for (i in 0 until groceries.size) {
            outState.putString("quantity$i", groceries.get(i).quantity)
        }
    }

    override fun onRestoreInstanceState(savedInstanceState: Bundle) {
        super.onRestoreInstanceState(savedInstanceState)
        totalPrice.setText(savedInstanceState.getString("totalPrice", ""))
        for (i in 0 until groceries.size) {
            groceries.get(i).quantity = savedInstanceState.getString("quantity$i", "")
        }
    }
}