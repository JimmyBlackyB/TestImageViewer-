//
//  FullImageVC.swift
//  TestImageViewer
//
//  Created by Сергей Верховский on 17.02.2021.
//

import UIKit

class FullImageVC: UIViewController {
    
    var fullImageTap = FullImage(dateInfo: "", imageFull: "")
    
    @IBOutlet weak var fullImage: UIImageView!
    
    @IBOutlet weak var dateImage: UILabel! {
        didSet {
            dateImage.text = fullImageTap?.dateInfo
        }
    }
    
    @IBAction func cancelView(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlImage()
    }
    
    func urlImage () {
    
        guard let url = URL(string: (fullImageTap?.imageFull)!) else {return}
        DispatchQueue.main.async { [self] in
            do {
                let data = try Data(contentsOf: url)
                fullImage.image = UIImage(data: data)
            } catch {
                fullImage.loadImageUsingCacheWithURLString((fullImageTap?.imageFull)!, placeHolder: #imageLiteral(resourceName: "placeholder"))
            }
        }
    }
}
