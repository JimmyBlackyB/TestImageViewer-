//
//  CollectionViewCell.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 16.02.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var previewImage: UIImageView!{
        didSet {
            previewImage.layer.cornerRadius = 15
        }
    }
    
    @IBOutlet weak var userName: UILabel!
    
    
     var viewModel: CollectionCellViewModelType? {
        willSet(viewModel) {
            guard let viewModel = viewModel else {return}
            DispatchQueue.main.async {
                self.userName.text = viewModel.user
                if let url = viewModel.previewURL {
                    self.previewImage.loadImageUsingCacheWithURLString(url, placeHolder: UIImage(named: "placeholder"))
                }
            }
        }
            
    }
    
    
}

