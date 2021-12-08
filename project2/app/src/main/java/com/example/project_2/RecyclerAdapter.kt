package com.example.project_2

import android.text.Editable
import android.text.TextWatcher
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.widget.EditText
import android.widget.ImageView
import android.widget.TextView
import androidx.recyclerview.widget.RecyclerView

class RecyclerAdapter (private val mGroceries: List<GroceryItem>): RecyclerView.Adapter<RecyclerAdapter.ViewHolder>() {

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): RecyclerAdapter.ViewHolder {
        val v = LayoutInflater.from(parent.context).inflate(R.layout.grocery_item, parent, false)
        return ViewHolder(v)
    }

    override fun onBindViewHolder(holder: RecyclerAdapter.ViewHolder, position: Int) {
        val grocery: GroceryItem = mGroceries.get(position)
        holder.itemTitle.text = grocery.title
        var dollars = grocery.price / 100
        var cents = grocery.price % 100
        var centsTwoDigit: String
        if (cents < 10) {
            centsTwoDigit = "0$cents"
        } else {
            centsTwoDigit = "$cents"
        }
        holder.itemPrice.text = "$$dollars.$centsTwoDigit"
        holder.itemImage.setImageResource(grocery.image)
        holder.inputtedQuantity.setText(grocery.quantity)
        holder.inputtedQuantity.addTextChangedListener(object : TextWatcher {
            override fun afterTextChanged(s: Editable?) {
                val grocery: GroceryItem = mGroceries.get(holder.getAdapterPosition())
                grocery.quantity = s.toString()
            }

            override fun beforeTextChanged(s: CharSequence?, start: Int, count: Int, after: Int) {
            }

            override fun onTextChanged(s: CharSequence?, start: Int, before: Int, count: Int) {
            }
        })
    }

    inner class ViewHolder(itemView: View): RecyclerView.ViewHolder(itemView) {
        var itemImage: ImageView
        var itemTitle: TextView
        var itemPrice: TextView
        var inputtedQuantity: EditText

        init {
            itemImage = itemView.findViewById(R.id.item_image)
            itemTitle = itemView.findViewById(R.id.item_title)
            itemPrice = itemView.findViewById(R.id.item_price)
            inputtedQuantity = itemView.findViewById(R.id.inputtedQuantity)
        }
    }

    override fun getItemCount(): Int {
        return mGroceries.size
    }
}