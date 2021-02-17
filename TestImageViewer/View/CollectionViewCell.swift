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
            userName.text = viewModel.user
            let data = Data(count: 0)
            guard let urlPreview = URL(string: viewModel.previewURL!) else {return}
            if let imagePreview = UIImage(data: viewModel.imagePreview ?? data) {
                previewImage.image = imagePreview
            } else {
                do {
                    let data = try Data(contentsOf: urlPreview)
                    previewImage.image = UIImage(data: data)
                } catch {
                   
                } 
            }
            
        }
    }
}
