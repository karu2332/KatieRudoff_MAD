// variables
var message : String = "Hello World"

// constants - cannot change the value of constants
let classMax: Int
classMax = 20

// type inference (providing an initial value)
var name = "Katie"

// print to the console
print("hi there")
print("hi " + name)
print("my name is \(name)")

let a = 42
let b = 0.123
// Google: Swift convert int to double
let c = Double(a) + b

/*
 multi line
 */

// tuples
let violet = ("#EE82EE", 238, 130, 238)
print("Violet is \(violet.0)")
let (hex, red, green, blue) = violet
print("violet is \(hex)")

// conditionals
let young = "you're young"
let notyoung = "you're not young"
let age = 21

if age < 21 {
    print(young)
}
else {
    print(notyoung)
}

// turn area
age < 21 ? young : notyoung

// switch statement - must be exhaustive
switch age {
    case 0...5: print("You're a wee bitty one")
    case 6...21: print("Enjoy school")
    case 22...55: print("Welcome to the real world")
    default: print("I don't know what you're doing")
}

// loops
for count in 0...age{
    print("\(count)")
}

// functions
func sayHi() {
    print("hi class")
}

sayHi()

func sayHello (first: String, last: String) {
    print("Hi \(first) \(last)")
}

sayHello(first: "Ben", last: "Adams")

func sayWhat(firstName first: String, lastName last: String) {
    print("what \(first) \(last)?")
}

sayWhat(firstName: "Ben", lastName: "Adams")

func sayWhere(_ place: String) {
    print(place)
}

sayWhere("here")

func sayWho(firstName: String, lastName: String) -> String {
    return "Who " + firstName + " " + lastName + "?"
}

let msg2 = sayWho(firstName: "Alison", lastName: "Gill")
print(msg2)

// optionals - allowed to not have a value (nill)
var score : Int?
print("Score is \(score)")
score = 80
print(score)

if score != nil {
    print("The socre is \(score!)")
}

// optional binding
// if score is not nil, assign it to the constant currentScore
if let currentScore = score {
    print("My current score is \(currentScore)")
}

// implicitely unwrapped optional
// never be used if  avriable will become nill at any point 
let newScore : Int! = 95
print("My new score is \(newScore)")



