//
//  CollectionListVC.swift
//  DemoCollectionTransitioning
//
//  Created by DREAMWORLD on 19/11/24.
//

import UIKit
import Hero

struct ColorDetails {
    var name: String
    var color: UIColor
    var colorCode: String
}

class CollectionListVC: UIViewController {
    
    @IBOutlet weak var collectionVw: UICollectionView!
    
    var arrColorInfo = [ColorDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hero.isEnabled = true
        setupViews()
        addColorData()
    }
    
    func setupViews() {
        collectionVw.delegate = self
        collectionVw.dataSource = self
        collectionVw.register(UINib(nibName: "CellColorInfo", bundle: nil), forCellWithReuseIdentifier: "CellColorInfo")
        
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        collectionVw.collectionViewLayout = layout
    }
    
    func addColorData() {
        arrColorInfo = [ColorDetails(name: "Black", color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), colorCode: "#000000"),
                        ColorDetails(name: "Pink", color: #colorLiteral(red: 1, green: 0.1843137255, blue: 0.5725490196, alpha: 1), colorCode: "#FF2F92"),
                        ColorDetails(name: "Turquoise", color: #colorLiteral(red: 0, green: 0.9921568627, blue: 1, alpha: 1), colorCode: "#00FDFF"),
                        ColorDetails(name: "SeaFoam", color: #colorLiteral(red: 0, green: 0.9803921569, blue: 0.5725490196, alpha: 1), colorCode: "#00FA92"),
                        ColorDetails(name: "Red", color: #colorLiteral(red: 1, green: 0.1490196078, blue: 0, alpha: 1), colorCode: "#FF2600"),
                        ColorDetails(name: "Yellow", color: #colorLiteral(red: 1, green: 0.831372549, blue: 0.4745098039, alpha: 1), colorCode: "#FFD479"),
                        ColorDetails(name: "Blue", color: #colorLiteral(red: 0, green: 0.5882352941, blue: 1, alpha: 1), colorCode: "#0096FF"),
                        ColorDetails(name: "Baby Pink", color: #colorLiteral(red: 1, green: 0.2509803922, blue: 1, alpha: 1), colorCode: "#FF40FF"),
                        ColorDetails(name: "Orange", color: #colorLiteral(red: 1, green: 0.5764705882, blue: 0, alpha: 1), colorCode: "#FF9300"),
                        ColorDetails(name: "Purple", color: #colorLiteral(red: 0.8431372549, green: 0.5137254902, blue: 1, alpha: 1), colorCode: "#D783FF"),
                        ColorDetails(name: "Dark Green", color: #colorLiteral(red: 0, green: 0.5647058824, blue: 0.3176470588, alpha: 1), colorCode: "#009051"),
                        ColorDetails(name: "Salmon", color: #colorLiteral(red: 1, green: 0.4941176471, blue: 0.4745098039, alpha: 1), colorCode: "#FF7E79"),
                        ColorDetails(name: "Light Green", color: #colorLiteral(red: 0.4509803922, green: 0.9803921569, blue: 0.4745098039, alpha: 1), colorCode: "#73FA79")]
    }
}

extension CollectionListVC: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrColorInfo.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CellColorInfo", for: indexPath) as! CellColorInfo
        cell.lblColorName.text = arrColorInfo[indexPath.item].name
        cell.vwColor.layer.cornerRadius = 10
        cell.vwColor.layer.masksToBounds = true
        cell.vwColor.backgroundColor = arrColorInfo[indexPath.item].color
        cell.lblColorCode.text = arrColorInfo[indexPath.item].colorCode
        cell.hero.id = "CellColorInfo\(indexPath.item)"
        cell.tag = indexPath.row
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CellColorInfo
        let heroId = cell.heroID
        
        let vc = CollectionSemiModalViewController.make(dataList: arrColorInfo, selectedIndex: indexPath.row)
        vc.view.backgroundColor = .black.withAlphaComponent(0.5)
        vc.view.hero.id = heroId
        let navigationController = UINavigationController(rootViewController: vc)
        navigationController.hero.isEnabled = true
        navigationController.modalPresentationStyle = .overFullScreen
        present(navigationController, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let horizontalSpace : CGFloat = 20
        let cellSize : CGFloat = view.bounds.width / 2 - horizontalSpace
        return CGSize(width: cellSize, height: cellSize)
    }
}
