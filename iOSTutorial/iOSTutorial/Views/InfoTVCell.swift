//
//  infoTVCell.swift
//  iOSTutorial
//

import UIKit

class InfoTVCell: UITableViewCell {

    @IBOutlet weak var infoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configCell(text: String) {
        self.infoLabel.text = text
    }
}
