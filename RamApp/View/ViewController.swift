//
//  ViewController.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet var image: UIImageView!
    @IBOutlet var name: UILabel!
    
    var data = [Model]()
    override func viewDidLoad() {
        super.viewDidLoad()
        let dataDetail = data.first!
        image.load(url: dataDetail.image)
        image.layer.cornerRadius = 20

        name.text = dataDetail.name
        if let childVC = self.children.first as? DetailTable {
            childVC.setdata(data: dataDetail)
        }
        
        navigationController?.modalTransitionStyle = .crossDissolve

        // Do any additional setup after loading the view.
    }
    
    func alert(message: String) {
        let alert = UIAlertController(title: "Ocurrio un error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "aceptar", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }


}

