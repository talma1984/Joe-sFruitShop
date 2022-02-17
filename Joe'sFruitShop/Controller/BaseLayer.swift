//
//  BaseLayer.swift
//  Joe'sFruitShop
//
//  Created by Mac on 17/02/2022.
//

import UIKit

class BaseLayer: UIViewController {
private let backGroundImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func backGround(){
        backGroundImage.image = UIImage(named: "back")
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        
    }
}
