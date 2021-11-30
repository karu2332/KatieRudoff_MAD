package com.example.pizza

data class PizzaShop(var name: String="", var url: String="") {
    fun suggestPizzaShop(position:Int) {
        setPizzaShopName(position)
        setPizzaShopUrl(position)
    }

    private fun setPizzaShopName(position:Int) {
        when (position) {
            0 -> name="Boss Lady"
            1 -> name="Cosmos"
            2 -> name="Blackjack"
            else -> name="Pizza shop of your choice"
        }
    }

    private fun setPizzaShopUrl(position:Int) {
        when (position) {
            0 -> url = "https://bossladypizza.com/"
            1 -> url = "http://cosmospizza.com/"
            2 -> url = "https://blackjackpizza.hungerrush.com/"
            else -> url = "https://www.tripadvisor.com/Restaurants-g33324-c31-Boulder_Colorado.html"
        }
    }
}