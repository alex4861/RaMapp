//
//  GeneralTableViewController.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/24/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import UIKit

class GeneralTableViewController: UITableViewController {

    var chargeEvent = ViewModel()
    @IBOutlet weak var tableServices: UITableView!

    var data = [Model]()
    var detailData = [Model]()
    var info = [infoModel]()
    var count = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.modalTransitionStyle = .crossDissolve
        let url = "https://rickandmortyapi.com/api/character/"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Previous", style: .done, target: self, action: #selector(prevGesture))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Next", style: .done, target: self, action: #selector(nextGesture))

        self.tableServices.register(UINib(nibName: "cardView", bundle: nil), forCellReuseIdentifier: "cardView")
        reloadData(url: url)
    }
    
    @objc func nextGesture() {
            reloadData(url: (info.first?.next)!)
    }

    @objc func prevGesture() {
            reloadData(url: (info.first?.prev)!)
    }
    
    
    @objc func reloadData(url: String) {
                chargeEvent.getData(setURL: url) { (response) in
            if let response = response as? ResponseModel{
                self.data = response.results
                self.info = [response.info]
                DispatchQueue.main.async {
                    self.tableServices.reloadData()
                    if self.info.first?.next == ""{
                        self.navigationItem.rightBarButtonItem?.isEnabled = false
                    } else{
                        self.navigationItem.rightBarButtonItem?.isEnabled = true
                    }
                    if self.info.first?.prev == ""{
                        self.navigationItem.leftBarButtonItem?.isEnabled = false
                    } else{
                        self.navigationItem.leftBarButtonItem?.isEnabled = true
                    }
                }
            }
            else{
                self.alert(message: response! as! String)
            }

        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var count = 0
        if (self.data.count != 0){
            count = self.data.count
        }
        return count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cardView", for: indexPath) as! CardView
        let tabledata = data[indexPath.row]
        cell.name.text = tabledata.name
        cell.imageChar.load(url: (tabledata.image))
        cell.gender.text = tabledata.gender
        cell.status.text = tabledata.status
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chargeEvent.getCharacter(id: data[indexPath.row].id) { (data) in
            if let data = data as? Model{
                self.detailData = [data]
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "detail", sender: nil)
                }

            }
            else{
                self.alert(message: data as! String)
            }

        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let Destination = segue.destination as? ViewController{
            Destination.data = detailData
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }
    func alert(message: String) {
        let alert = UIAlertController(title: "error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true)
    }

}

