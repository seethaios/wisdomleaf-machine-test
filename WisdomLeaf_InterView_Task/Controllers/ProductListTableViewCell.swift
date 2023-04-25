//
//  ProductListTableViewCell.swift
//  WisdomLeaf_InterView_Task
//
//  Created by Ragulkumar K V on 25/04/23.
//

import UIKit
import SDWebImage

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var prductTitleLabel: UILabel!
    @IBOutlet weak var noRatingLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var prductCategoryLabel: UILabel!
    @IBOutlet weak var prductAmountLabel: UILabel!
    @IBOutlet weak var orderButton: UIButton!
    @IBOutlet weak var checkBoxImage: UIImageView!

    var singleData: ProductDataModel? {
        didSet {
            prductTitleLabel.text = singleData?.title
            prductCategoryLabel.text = singleData?.description
            prductAmountLabel.text = "₹ " + String(singleData?.price ?? 0.0)
            if let url = singleData?.image {
                setImage(urlString: url)
            }
            let rating = singleData?.rating?.rate
            setRatingLbl(rating: Int(rating!))
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         orderButton.layer.cornerRadius = 5
         productImage.layer.cornerRadius = 15
    }

    func setImage(urlString: String) {
        
        let urls = URL(string: urlString)
        productImage.sd_setImage(with:urls)
    }
    
    func setRatingLbl(rating:Int) {
        
        if rating == 1 {
            noRatingLabel.text = "⭐ 1 Rating"
        }
        else if rating == 2 {
            noRatingLabel.text = "⭐⭐ 2 Ratings"
        }
        else if rating == 3 {
            noRatingLabel.text = "⭐⭐⭐ 3 Ratings"
        }
        else if rating == 4 {
            noRatingLabel.text = "⭐⭐⭐⭐ 4 Ratings"
        }
        else if rating == 5 {
            noRatingLabel.text = "⭐⭐⭐⭐⭐ 5 Ratings"
        }
        else {
            noRatingLabel.text = "No Ratings !!"
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
