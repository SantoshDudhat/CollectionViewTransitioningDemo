//
//  CellColorInfo.swift
//  DemoCollectionTransitioning
//
//  Created by DREAMWORLD on 19/11/24.
//

import UIKit
import Hero

class CellColorInfo: UICollectionViewCell {

    @IBOutlet weak var vwColor: UIView!
    @IBOutlet weak var lblColorName: UILabel!
    @IBOutlet weak var lblColorCode: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.hero.isEnabled = true
    }

}
