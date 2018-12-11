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

    lazy var floatingView: SwiftyFloatingView = {
        let normalButton:UIButton = UIButton(type: UIButton.ButtonType.system)
        normalButton.backgroundColor = .red
        normalButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        normalButton.layer.cornerRadius = 50
        normalButton.addTarget(self, action: #selector(ViewController.printer), for: .touchUpInside)
        var floatingView = SwiftyFloatingView(with: normalButton)
        floatingView.delegate = self
        floatingView.setFrame(CGRect(x: (UIScreen.main.bounds.width - normalButton.frame.width)/2, y: yPosition, width: normalButton.frame.width, height: normalButton.frame.height))
        return floatingView
    }()
    
    private var isCircle: Bool = true
    private let yPosition: CGFloat = 120.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        floatingView.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    @objc func printer() {
        print("Button Called")
    }

    @IBAction func show(_ sender: Any) {
        floatingView.show()
    }
    
    @IBAction func hide(_ sender: Any) {
        floatingView.hide()
    }
    
    @IBAction func changeStyle(_ sender: Any) {
        
        isCircle = !isCircle
        if isCircle {
            let normalButton:UIButton = UIButton(type: UIButton.ButtonType.system)
            normalButton.backgroundColor = .red
            normalButton.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
            normalButton.layer.cornerRadius = 50
            normalButton.addTarget(self, action: #selector(ViewController.printer), for: .touchUpInside)
            floatingView.setContentView(normalButton)
            floatingView.setFrame(CGRect(x: (UIScreen.main.bounds.width - normalButton.frame.width)/2, y: yPosition, width: normalButton.frame.width, height: normalButton.frame.height))
        }else {
            let normalButton:UIButton = UIButton(type: UIButton.ButtonType.system)
            normalButton.backgroundColor = .green
            normalButton.frame = CGRect(x: 0, y: 0, width: 60, height: 100)
            normalButton.addTarget(self, action: #selector(ViewController.printer), for: .touchUpInside)
            floatingView.setContentView(normalButton)
            floatingView.setFrame(CGRect(x: (UIScreen.main.bounds.width - normalButton.frame.width)/2, y: yPosition, width: normalButton.frame.width, height: normalButton.frame.height))
        }
        
        floatingView.show()
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

