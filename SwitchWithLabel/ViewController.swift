//
//  ViewController.swift
//  SwitchWithLabel
//
//  Created by CIA on 2017/11/16.
//  Copyright © 2017年 CIA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var contentSwith: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contentSwith.addTextsInSwitch(["km","mi"])
        contentSwith.layer.cornerRadius = contentSwith.frame.size.height/2
        contentSwith.layer.masksToBounds = true;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

