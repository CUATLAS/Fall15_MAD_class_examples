//
//  ViewController.swift
//  daVinci
//
//  Created by Aileen Pierce on 8/31/15.
//  Copyright (c) 2015 Aileen Pierce. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var artImage: UIImageView!
    @IBOutlet weak var messageText: UILabel!
    
    @IBAction func chooseArt(sender: UIButton) {
        if sender.tag==1{
            artImage.image=UIImage(named: "MonaLisa.png")
            messageText.text="Mona Lisa"
        }
        else if sender.tag==2{
            artImage.image=UIImage(named: "Vitruvian.png")
            messageText.text="Vitruvian man"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

