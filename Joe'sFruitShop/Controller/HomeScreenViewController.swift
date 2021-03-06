//
//  ViewController.swift
//  Joe'sFruitShop
//
//  Created by Mac on 17/02/2022.
//

import UIKit

class HomeScreenViewController: BaseLayer {
    //let fr = {"fruits":[{"name":"Apple","image":"https://upload.wikimedia.org/wikipedia/commons/thumb/1/15/Red_Apple.jpg/265px-Red_Apple.jpg","description":"A Apple fruit","price":35},{"name":"Banana","image":"https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Bananas_white_background_DS.jpg/320px-Bananas_white_background_DS.jpg","description":"A Banana fruit","price":12},{"name":"Grapes","image":"https://upload.wikimedia.org/wikipedia/commons/thumb/b/bb/Table_grapes_on_white.jpg/320px-Table_grapes_on_white.jpg","description":"A Grape fruit","price":45},{"name":"Pineapple","image":"https://upload.wikimedia.org/wikipedia/commons/thumb/c/cb/Pineapple_and_cross_section.jpg/286px-Pineapple_and_cross_section.jpg","description":"A Pineapple fruit","price":200}],"err":0}
    
    var dictunary = [String:String]()
    //get the fruit list from struct
    var fruitData = Fruits.fetchFruit()
    //server adress
    let apiAdress = "https://dev-api.com/fruitsBT/getFruits"
    //tableview attribiuts
    let fruitsTableView = UITableView()
    var tableViewWidth = CGFloat()
    var tableViewHeigt = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSize()
        setTableView()
        getData(apiAdress)
    }
   //set the size of the table view to fit any type of screen/iphone
    func tableSize(){
        tableViewWidth = self.view.bounds.size.width - 100
        tableViewHeigt = self.view.bounds.size.height - 120
    }
    //add table view
    func setTableView(){
        fruitsTableView.backgroundColor = .black
        view.addSubview(fruitsTableView)
        fruitsTableView.frame = CGRect(x: 50, y: 60, width: tableViewWidth, height: tableViewHeigt)
        fruitsTableView.isPagingEnabled = true
        fruitsTableView.isScrollEnabled = true
        fruitsTableView.allowsSelection = true
        fruitsTableView.register(FruitCell.self, forCellReuseIdentifier: "FruitCell")
        fruitsTableView.delegate = self
        fruitsTableView.dataSource = self
    }
    //get jason from the server
    func getData(_ link:String){
        guard let url = URL(string: link) else{return}
        URLSession.shared.dataTask(with: url){
            (data, response, error)in
            guard let data = data else {return}
            do {
                let fruit = try
                JSONDecoder().decode(food.self, from: data)
                //empty struct
                print("hey")
                print(fruit)
                //self.fruitData = fruit
              //  print(fruitData.self)
                //fill struct whith new info
              // self.fruitData = fruit
//                print(fruitData)
            }catch let jsonErorr {
                print("error serilazing json", jsonErorr)
            }
        }.resume()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            self.fruitsTableView.reloadData()
        }
    }
}
// extension for the tableview
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruitCell = tableView.dequeueReusableCell(withIdentifier: "FruitCell",for: indexPath) as! FruitCell
        return fruitCell
    }
}
