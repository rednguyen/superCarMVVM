//
//  ViewController.swift
//  carAPI
//
//  Created by Red Nguyen on 10/2/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var listOfCar : [carModel] = []
    {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        let carRequest = supercarRequest()
        carRequest.getSuperCar{[weak self] result in
            switch result {
            case .success(let carModel):
                self?.listOfCar = carModel
            case .failure(_):
                return
            }
        }
    }

    
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfCar.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell") as? CustomTableViewCell
//        let label = cell?.contentView.viewWithTag(101) as? UILabel
        cell?.label.text =  listOfCar[indexPath.row].name
        return cell ?? CustomTableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let price = listOfCar[indexPath.row].price
        let year = listOfCar[indexPath.row].year
        let vc = storyboard?.instantiateViewController(identifier: "second_vc") as? secondViewController
        vc?.value1 = price
        vc?.value2 = year
        vc?.title = "Pick One"
        navigationController?.pushViewController(vc ?? UIViewController(), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}

