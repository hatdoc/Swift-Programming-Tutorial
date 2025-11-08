import Foundation

struct Person {
    let name: String
    let age: Int
}

let foo = Person(name: "Foo", age: 20)

foo.name
foo.age

struct CommodoreComputer {
    let name: String
    let manufacturer: String
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

//or
//struct CommodoreComputer {
//    let name: String
//    let manufacturer = "Commodore"
//}

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer

//Not so good ways to do it
struct Person2 {
    let firstName: String
    let lastName: String
    let fullName: String
    init(
        firstName: String,
        lastName: String
    ) {
        self.firstName = firstName
        self.lastName = lastName
        self.fullName = "\(firstName) \(lastName)"
    }
}

struct Person3 {
    let firstName: String
    let lastName: String
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let fooBar = Person3(firstName: "Foo", lastName: "Bar")
fooBar.fullName

struct Car {
    var currentSpeed: Int
    mutating func drive (speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

var immutableCar = Car(currentSpeed: 10)
//immutableCar.drive(speed: 20)

var mutableCar = Car(currentSpeed: 10)
let copy = mutableCar
mutableCar.drive(speed: 30)
mutableCar.currentSpeed
copy.currentSpeed

//cannot Inherit struct
struct LivingThing {
    init() {
        "I'm a living thing"
    }
}

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    func copy(currentSpeed: Int) -> Bike{
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
}

let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
var bike2 = bike1.copy(currentSpeed: 30)
bike2.currentSpeed
