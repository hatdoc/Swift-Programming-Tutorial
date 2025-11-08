import Foundation

//func add(_ lhs: Int, _ rhs: Int) -> Int{
//    lhs + rhs
//}

let add: (Int, Int) -> Int = { (lhs: Int , rhs: Int) -> Int in lhs + rhs
    
}

add(1, 2)

func customAdd( _ lhs: Int, _ rhs: Int, using function: (Int,Int) -> Int) -> Int {
    function(lhs, rhs)
}

customAdd(20, 30, using: { (lhs: Int, rhs:Int) -> Int in
    (lhs + rhs)
})

//same as
customAdd(20, 30) {
    (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

//same as
customAdd(20, 30) {
    (lhs, rhs) in
    lhs + rhs
}

//same as
customAdd(20, 30) {
    $0 + $1
}

let ages = [30, 20, 19, 40]
ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs > rhs
})

//same as
ages.sorted(by: >)

func customAdd2( using function: (Int,Int) -> Int, _ lhs: Int, _ rhs: Int) -> Int {
    function(lhs, rhs)
}
customAdd2(using: { (lhs, rhs) in lhs + rhs}, 20,30)

func add10To(_ value: Int) -> Int {
    value + 10
}

func add20To(_ value: Int) -> Int {
    value + 20
}

func doAddtion(
    on value: Int,
    using function: (Int) -> Int
)-> Int {
    function(value)
}

doAddtion(on: 20) {(value) in value + 30}
doAddtion(on: 20, using: add10To(_:))
