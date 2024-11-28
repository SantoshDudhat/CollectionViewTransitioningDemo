//
//  TableViewTitleCell.swift
//  CollectionViewSemiModalTransitioning
//
//  Created by 本山洋一 on 2019/07/07.
//  Copyright © 2019 Yoichi. All rights reserved.
//

import UIKit

class TableViewTitleCell: UITableViewCell {
    
    var closeTapHandler: (() -> Void)?

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var baseView: UIView!
    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupViews()
    }
    
    private func setupViews() {
        selectionStyle = .none
        backgroundColor = .clear
        baseView.layer.cornerRadius = 10
        baseView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        baseView.clipsToBounds = true
    }

    func configure(data: ColorDetails) {
        titleLabel.text = data.name
        colorView.backgroundColor = data.color
    }
    
    @IBAction func didTapClose(_ sender: Any) {
        closeTapHandler?()
    }
}
