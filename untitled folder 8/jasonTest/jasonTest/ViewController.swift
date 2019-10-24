//
//  ViewController.swift
//  jasonTest
//
//  Created by kuet on 15/10/19.
//  Copyright © 2019 kuet. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageContainer: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let image = URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcShBMdrZgy-kylK2ReAu3u4axCSdsOsOCgEA9eI1FFaE_I0PRxh")!
        let task = URLSession.shared.dataTask(with:
        image) {(data,response,error)in
            if error==nil{
                let loadImage=UIImage(data:data!)
                self.imageContainer.image=loadImage
            }
        }
        task.resume();
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

