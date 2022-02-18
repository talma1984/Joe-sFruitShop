//
//  Fruit.swift
//  Joe'sFruitShop
//
//  Created by Mac on 17/02/2022.
//

import Foundation
import UIKit
//a struct of potential jason from the server
struct fruitStruct: Decodable{
    var name: String
    var image: String
    var description: String
    var price: Int
}

//a class of fruit list's
class Fruits{
    static func fetchFruit() ->[fruitStruct]{
        let fr = fruitStruct(name: "avocado", image: "avocadoIma", description: "the best", price: 100)
        return[fr]
    }
}
