//
//  ViewController.swift
//  Demo
//
//  Created by SiwftyKit on 2018/7/6.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
import SwiftyTextView

class ViewController: UIViewController {
    @IBOutlet weak var textView: SwiftyTextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 0.5
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

