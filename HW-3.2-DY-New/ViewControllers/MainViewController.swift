//
//  MainViewController.swift
//  HW-3.2-DY
//
//  Created by Denis Yarets on 11/11/2023.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    var fruits = [Fruit]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Register cell classes
        //        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        let dataService = DataService.shared
        fruits = dataService.fruits
    }
}

// MARK: UICollectionViewDataSource
extension MainViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        fruits.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellFruit", for: indexPath) as? MainItemViewCell else { return UICollectionViewCell() }
        cell.layer.cornerRadius = 15
        cell.label.text = fruits[indexPath.item].description
        
        return cell
    }
}

// MARK: UICollectionViewDelegate
extension MainViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (UIScreen.main.bounds.width - 50) / 2, height: 100)
    }
    
}
