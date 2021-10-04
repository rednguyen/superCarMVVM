//
//  secondViewController.swift
//  carAPI
//
//  Created by Red Nguyen on 10/3/21.
//

import UIKit

class secondViewController: UIViewController {

    
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    var value1:String = ""
    var value2:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.label1.text = value1
//        self.label2.text = value2
        self.label1.backgroundColor = .blue
        self.label2.backgroundColor = .green
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
