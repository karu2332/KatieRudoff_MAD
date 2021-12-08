package com.example.project_2

// GroceryItem: all fields associated with a grocery item
// price is in pennies to avoid floating point rounding issues
//
// in a real app, this would be loaded up from a file

class GroceryItem(val title: String, val price: Int, val image: Int, var quantity: String) {
    companion object {
        fun createGroceryList(): ArrayList<GroceryItem> {
            val groceries = ArrayList<GroceryItem>()
            groceries.add(GroceryItem("Apple", 40, R.drawable.apples, ""))
            groceries.add(GroceryItem("Bananas", 58, R.drawable.bananas, ""))
            groceries.add(GroceryItem("Milk", 371, R.drawable.milk, ""))
            groceries.add(GroceryItem("Peanut Butter", 496, R.drawable.peanutbutter, ""))
            groceries.add(GroceryItem("Steak", 1043, R.drawable.steak, ""))
            groceries.add(GroceryItem("Bread", 250, R.drawable.bread, ""))
            return groceries
        }
    }
}
