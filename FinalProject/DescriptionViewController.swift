//
//  DescriptionViewController.swift
//  FinalProject
//
//  Created by Bryan Okada on 5/14/16.
//  Copyright © 2016 Bryan Okada. All rights reserved.
//

import UIKit

class DescriptionViewController: UIViewController {

    @IBOutlet var pic_descrip: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.pic_descrip.image = UIImage(named: "description")
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func btn_b(sender: AnyObject) {
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
