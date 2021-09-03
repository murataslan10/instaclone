//
//  FeedCellTableViewCell.swift
//  instaClone
//
//  Created by Murat Aslan  on 2.09.2021.
//

import UIKit
import Firebase

class FeedCellTableViewCell: UITableViewCell {
    @IBOutlet weak var emailUserLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        
        let fireStoreDatabase = Firestore.firestore()
        
        if let likeCount = Int(likeLabel.text!){
            
            let likeStore = ["likes": likeCount + 1 ] as [String : Any]
            
            fireStoreDatabase.collection("Post").document(documentLabel.text!).setData(likeStore, merge: true)
        }
        
    }
    
    
}
