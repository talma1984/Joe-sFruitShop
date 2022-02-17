//
//  ViewController.swift
//  Joe'sFruitShop
//
//  Created by Mac on 17/02/2022.
//

import UIKit

class HomeScreenViewController: BaseLayer {
    //server adress
    let jsonUrlString = "https://dev-api.com/fruitsBT/getFruits"
    //tableview attribiuts
    let fruitsTableView = UITableView()
    var tableViewWidth = CGFloat()
    var tableViewHeigt = CGFloat()
    var fruitsData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableSize()
        setTableView()
    }
   //set the size of the table view
    func tableSize(){
        tableViewWidth = self.view.bounds.size.width - 100
        tableViewHeigt = self.view.bounds.size.height - 120
    }
    //add table view
    func setTableView(){
        fruitsTableView.backgroundColor = .black
        view.addSubview(fruitsTableView)
        //fruitsTableView.delegate = self
      //  fruitsTableView.dataSource = self
        fruitsTableView.frame = CGRect(x: 50, y: 60, width: tableViewWidth, height: tableViewHeigt)
        fruitsTableView.isPagingEnabled = true
        fruitsTableView.isScrollEnabled = true
        fruitsTableView.allowsSelection = true
        fruitsTableView.register(FruitCell.self, forCellReuseIdentifier: "FruitCell")
        fruitsTableView.delegate = self
        fruitsTableView.dataSource = self
    }
    //get jason from the server
}
// extension for the tableview
extension HomeScreenViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruitsData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fruitCell = tableView.dequeueReusableCell(withIdentifier: "FruitCell",for: indexPath) as! FruitCell
        return fruitCell
    }
}
