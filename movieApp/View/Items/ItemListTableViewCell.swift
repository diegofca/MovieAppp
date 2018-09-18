//
//  ItemListTableViewCell.swift
//  movieApp
//
//  Created by Devp.ios on 18/09/18.
//  Copyright © 2018 Devp.ios. All rights reserved.
//

import UIKit

class ItemListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameMovieTxt: UILabel?
    @IBOutlet weak var genderMovieTxt: UILabel!
    @IBOutlet weak var detailBtn: UIButton!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.viewShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
