//
//  detailTable.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/26/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import UIKit

class DetailTable: UITableViewController {

    
    @IBOutlet var id: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var location: UILabel!
    @IBOutlet var originname: UILabel!
    @IBOutlet var Species: UILabel!
    @IBOutlet var status: UILabel!

    var idData: String?
    var genderData: String?
    var locationData: String?
    var originnameData: String?
    var speciesData: String?
    var statusData: String?
    override func viewDidLoad() {
        super.viewDidLoad()        
    }
    
    func setdata(data: Model) {
        id.text = String(data.id)
        gender.text = data.gender
        location.text = data.location.name
        originname.text = data.origin.name
        Species.text = data.species
        status.text = data.status
    }

}
