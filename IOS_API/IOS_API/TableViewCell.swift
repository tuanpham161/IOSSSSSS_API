//
//  TableViewCell.swift
//  IOS_API
//
//  Created by tuan.anhpham on 9/1/20.
//  Copyright © 2020 tuan.anhpham. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imageVew: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var age: UILabel!
    @IBOutlet weak var gender: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setup( persion: Person){
        self.name.text = (persion.userName)
        self.location.text = (persion.location)
        self.age.text = "\(persion.age)"
        self.gender.text = (persion.gender)
        
        
        let imgURL = URL( string : persion.image)
        let task = URLSession.shared.dataTask(with: imgURL!) { (data, response, error) in
                if error == nil {
                    guard let imageData = data else {return}
                    let loadedImage = UIImage(data: imageData)
                    DispatchQueue.main.async {
                        self.imageView?.image = loadedImage
                    }
                }
            }
            task.resume()
        }
        
    }
    
