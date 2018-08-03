//
//  ViewController.swift
//  Demo
//
//  Created by SiwftyKit on 2018/7/6.
//  Copyright © 2018年 apple. All rights reserved.
//

import UIKit
import SwiftyFloatingView

class ViewController: UIViewController {

    lazy var floatingView : SwiftyFloatingView = {
        let normalButton:UIButton = UIButton(type: UIButtonType.system)
        normalButton.backgroundColor = .red
        normalButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        normalButton.layer.cornerRadius = 50
        normalButton.addTarget(self, action: #selector(ViewController.printer), for: .touchUpInside)
        var floatingView = SwiftyFloatingView(with: normalButton)
        floatingView.delegate = self
        return floatingView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController:FloatingViewDelegate {
    
    func viewDraggingDidBegin(view: UIView, in window: UIWindow?) {
        UIView.animate(withDuration: 0.4) {
            view.alpha = 0.8
        }
    }
    
    func viewDraggingDidEnd(view: UIView, in window: UIWindow?) {
        (view as? UIButton)?.cancelTracking(with: nil)
        UIView.animate(withDuration: 0.4) {
            view.alpha = 1.0
        }
    }
    
}

