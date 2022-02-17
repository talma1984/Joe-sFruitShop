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
    //set the background image of the main screen
    func backGround(){
        backGroundImage.image = UIImage(named: "back")
        backGroundImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backGroundImage)
        backGroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backGroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backGroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        view.sendSubviewToBack(backGroundImage)
    }
}
