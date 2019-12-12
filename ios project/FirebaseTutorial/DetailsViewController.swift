//
//  DetailsViewController.swift
//  FirebaseTutorial
//
//  Created by kuet on 25/11/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class DetailsViewController: UIViewController {
    var id : Spots?
  
    @IBAction func routeaction(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Route") as! RouteViewController
        vc.dest = self.id
        
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func bgtac(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Budget") as! BudgetViewController
        vc.dest = self.id
        
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func needact(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Need") as! NeedViewController
        vc.dest = self.id
        
        self.present(vc, animated: true, completion: nil)
    }
    @IBOutlet var imgl: UIImageView!
    @IBOutlet var deslb: UILabel!
    @IBOutlet var nmlb: UILabel!
    var st1 : String = ""
     var st2 : String = ""
     var st3 : String = ""
     var st4 : String = ""
     var st5 : String = ""
     var str : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let image = URL(string : (id?.imgurl)!){
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: image)
                if let data = data {
                    let img = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imgl.image = img
                        let xy = self.id?.name
                        print(xy! + "*")
                        self.nmlb.text = xy
                    }
                }
            }
        }
        st2 = "\t1. "+(self.id?.tourist[0])! + "\n\t2. "+(self.id?.tourist[1])!
        st1 = "\n\t3. "+(self.id?.tourist[2])! + "\n\t4. "+(self.id?.tourist[3])! + "\n\t5. "
        st5 = st2 + st1 + (self.id?.tourist[4])! + "\n"
        st3 = "Description: \n"
        st4 = "\n\nNear places that you can also visit:\n" + st5
        str = st3 + (self.id?.description)! + st4
        print(str)
        print((self.id?.description)!)
        print(self.id?.name ?? "#")
       self.deslb.lineBreakMode = .byWordWrapping
        self.deslb.numberOfLines = 0
        self.deslb.text = str
        // Do any additional setup after loading the view.
    }

    /*override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
