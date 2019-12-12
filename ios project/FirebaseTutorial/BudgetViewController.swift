//
//  BudgetViewController.swift
//  FirebaseTutorial
//
//  Created by kuet on 1/12/19.
//  Copyright © 2019 AppCoda. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class BudgetViewController: UIViewController {
    var dest : Spots?
    
    @IBAction func back(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Details") as! DetailsViewController
        vc.id = self.dest
        self.present(vc, animated: true, completion: nil)
        
    }
    @IBAction func gotocal(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "calc") as! calculatorMain
        vc.sc = self.dest
        self.present(vc, animated: true, completion: nil)
    }
    
    
    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var output: UILabel!
    
    @IBAction func action1(_ sender: Any) {
        output.text = input.text
        UserDefaults.standard.set(input.text, forKey: "myBalance")
        input.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidAppear(_ animated: Bool) {
        if let x = UserDefaults.standard.object(forKey: "myBalance") as? String
        {
            output.text = x
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
