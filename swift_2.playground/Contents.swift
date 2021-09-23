//class

// Side Note: Optionals (?) do not need to have a value, but you must check if the variable is nil before assigning

class Vehicle {
    var wheelNum = 4
    var speed = 25
    var mpg = 20
    let tankCapacity = 20
    var name: String?
    
    func changeSpeed(amount: Int) {
        speed = speed + amount
    }
    
    func changeEfficiency(newSpeed: Int, newmpg: Int) {
        speed = newSpeed
        mpg = newmpg
    }
    
    // initializers
     init(vehicleName vname: String) {
          name = vname
     }
     init() {
     }
}
 
// instance
    
let myJeep = Vehicle()
myJeep.mpg
myJeep.speed
myJeep.name

let mySubaru = Vehicle()
mySubaru.speed

    
// initialization

let myHybrid = Vehicle(vehicleName: "Prius")
myHybrid.name

if myHybrid.name != nil {
    print(myHybrid.name!)
}

// methods
    
myJeep.changeSpeed(amount: 10)
myJeep.speed
myJeep.changeEfficiency(newSpeed: 35, newmpg: 25)
myJeep.speed
myJeep.mpg

// inheritance
// class Bicycle inherits class Vehicle (has all properties of the class Vehicle)

class Bicycle: Vehicle {
    var reflectors : Bool
    
    init(_ ref: Bool) {
        reflectors = ref
        super.init()
    }
}

var bike = Bicycle(false)
bike.wheelNum
bike.wheelNum = 2
bike.wheelNum
bike.reflectors


// classes are references types

var new_bike = bike
new_bike.reflectors
new_bike.reflectors = true
new_bike.reflectors
bike.reflectors

// struct are value types
struct Skateboard {
    var color: String
    var type: String
}

var board = Skateboard(color: "black", type: "longboard")
board.color
var new_board = board
new_board.color
new_board.color = "purple"
new_board.color
board.color

// arrays

var myList2 : [String] // create an array of type string, has NOT been initialized yet
var myList = [String]() // create an array of type string, create and initialize (empty)
var shoppingList = ["cereal", "milk"] // create an array of type string
print(shoppingList[0])

// modifying an array
shoppingList.append("bread") // insert item at end of the array

if shoppingList.isEmpty {
    print("there's nothing you need")
} else {
    print("You need \(shoppingList.count)" + " items")
}

let item = shoppingList.removeLast()
print("\(shoppingList.count)")

shoppingList.insert("coffee", at: 0)
shoppingList.remove(at: 1)

// dictionaries
// Unordered set of key value pairs

var newList:[String: String]
var classes = [String: String] = ["4120":"MAD", "2200":"Web]







    
    

