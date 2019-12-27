//
//  CardView.swift
//  RamApp
//
//  Created by José Alejandro Bravo Cedillo on 12/26/19.
//  Copyright © 2019 José Alejandro Bravo Cedillo. All rights reserved.
//

import UIKit

class CardView: UITableViewCell {

    @IBOutlet var gender: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var imageChar: UIImageView!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imageChar.layer.cornerRadius = 7
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
