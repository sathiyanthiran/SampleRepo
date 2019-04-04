import UIKit

var str = "Hello, playground"

class Orange {
    var name = "sathiy"
    static var address = "Covai"
    static let fruit = Orange()
}
Orange.address = ""

class Boss {
    let a = Orange.fruit
    func name() {
        print(a)
        let name = a.name
    }
    //Orange.address
}

var b = Boss()

class Vehicle {
    var carName = "Audi"
    static var carModel = "Q6"
}
Vehicle.carModel = "q5"
Vehicle.carModel

extension Int {
    mutating func square() {
        self = self * self
    }
}
var a = 5
a.square()

protocol 
