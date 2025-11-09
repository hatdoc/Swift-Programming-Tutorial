import Foundation

enum Animals {
    case cat
    case dog
    case rabbit
    //same as
    //case cat, dog, rabbit
}

let cat = Animals.cat

if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
} else {
    "This is something else"
}

func describeAnimal (_ animal: Animals) {
    switch animal {
        
    case .cat:
        "This is a cat"
        break
    case .dog:
        "This is a dog"
        break
    default:
        "This is something else"
    }
}

describeAnimal(Animals.rabbit)

//enum Shortcut {
//    case fileOrFolder
//    case wwwUrl(path: URL)
//    case song
//}
//
//let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)
//
//switch wwwApple {
//    
//case .fileOrFolder:
//    break
//case let .wwwUrl(path):
//    path
//    break
//case .song:
//    break
//}
//
//if case let .wwwUrl(path) = wwwApple {
//    path
//}

enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    func getManufacturer() -> String {
        switch self {
        case let .car(manufacturer, model: _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
    //same as above
    var manufacturer : String {
        switch self {
        case let .car(manufacturer, model: _):
            return manufacturer
        case let .bike(manufacturer, _):
            return manufacturer
        }
    }
    //same as above
//    var manufacturer : String {
//        switch self {
//        case let .car(manufacturer, model: _),
//            let .bike(manufacturer, _):
//            return manufacturer
//        }
//    }
}

let car = Vehicle.car(manufacturer: "Tesla", model: "X")

let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)

car.getManufacturer()
car.manufacturer

enum FamilyMember: String {
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
}

FamilyMember.father.rawValue

enum FavouriteEmoji: String, CaseIterable {
    case blush = "blush"
    case rocket = "Rocket"
}

FavouriteEmoji.allCases

enum Height {
    case short, medium, long
    mutating func makeLong() {
        self = Height.long
    }
}

var myHeight = Height.medium
myHeight.makeLong()

indirect enum IntOperation {
    case add(Int, Int)
    case subtract(Int, Int)
    case freehand(IntOperation)
    
    func calculateResult(
        of operation: IntOperation? = nil
    ) -> Int {
        switch operation ?? self {
        case let .add(lhs, rhs) :
            return lhs + rhs
        case let .subtract(lhs, rhs) :
            return lhs - rhs
        case let .freehand(operation) :
            return calculateResult(of: operation)
        }
    }
}

let freeHand = IntOperation.freehand(.add(2, 4))
freeHand.calculateResult()
