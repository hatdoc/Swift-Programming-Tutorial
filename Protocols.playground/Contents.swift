import Foundation

protocol CanBreathe {
    //can have function without body
    func breathe()
}

struct Animal: CanBreathe {
    func breathe() {
        "Animal breathing..."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let dog = Animal()
dog.breathe()
let foo = Person()
foo.breathe()

protocol CanJump {
    func jump()
}

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

struct Cat: CanJump {
    
}

let whiskers = Cat()
whiskers.jump()

protocol HasName {
    // this is how you use let in protocol
    var name: String { get}
    var age: Int {get set}
}

extension HasName {
    func describeMe() -> String{
        "Your name is \(name) and you are \(age) years old"
    }
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)

woof.name
woof.age
woof.describeMe()
woof.increaseAge()
woof.age

protocol Vehicle {
    var speed: Int {get set}
    mutating func increaseSpeed(by value: Int)
}

extension Vehicle {
    mutating func increaseSpeed(by value : Int) {
        self.speed += value
    }
}

struct Bike: Vehicle {
    var speed: Int
    init() {
        self.speed = 0
    }
}

var bike = Bike()
bike.speed
bike.increaseSpeed(by: 10)
bike.speed 

func describe(obj: Any) {
    if obj is Vehicle {
        "obj conforms to the Vehicle protocol"
    } else {
        "obj does NOT conform to the Vehicle Protocol"
    }
}

describe(obj: bike)

func increaseSpeedIfVehicle(obj: Any) {
    if var vehicle = obj as? Vehicle {
        vehicle.speed
        vehicle.increaseSpeed(by: 10)
        vehicle.speed
    } else {
        "This was not a vehicle"
    }
}

increaseSpeedIfVehicle(obj: bike)
