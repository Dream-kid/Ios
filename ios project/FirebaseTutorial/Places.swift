//
//  Places.swift
//  FirebaseTutorial
//
//  Created by kuet on 27/10/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
class Places: UITableViewCell {
    @IBOutlet var namelb: UILabel!
    @IBOutlet var imagelb: UIImageView!
    
    //  @IBAction func tap(_ sender: UIButton) { }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
