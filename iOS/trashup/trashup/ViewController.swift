//
//  ViewController.swift
//  trashup
//
//  Created by Mohammadreza on 1/27/19.
//  Copyright © 2019 Mark Mohades. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {
    

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var qouteLabel: UILabel!
    let url = "http://localhost:5000/qoute"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profilePic.image = #imageLiteral(resourceName: "Mark")

        profilePic.layer.masksToBounds = true
        profilePic.layer.cornerRadius = 32 / 2
        update_qoute()
        

    }

    
    func updateGui(){
        
        self.qouteLabel.sizeToFit()
        
        
    }
    
    func update_qoute(){
        
        Alamofire.request(url, method: .get)
            .responseJSON { response in
                if response.result.isSuccess {
                    
                    print("Sucess!")
                    
                    if let qoute : String = JSON(response.result.value!)["qoute"].string!{
                        
                        self.qouteLabel.text = qoute
                        self.updateGui()
                        
                    }
                    
                
                    
                }
                    
                else {
                    print("Error: \(String(describing: response.result.error))")
                    
                    self.qouteLabel.text = "Connection issues."
                }
        }
        
        
    }
    
    

}

