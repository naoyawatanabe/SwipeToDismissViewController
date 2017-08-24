//
//  ViewController.swift
//  SwipeToDismissViewController
//
//  Created by naoya.watanabe on 2017/08/24.
//  Copyright © 2017年 naoya.watanabe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let threshold: CGFloat = 20.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func panGestureRecognizerHandler(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: self.view.superview)
        let rect = self.view.frame

        switch sender.state {
        case .changed:
            if translation.y < 0 { return }
            self.view.frame = CGRect(x: 0, y: translation.y, width: rect.width, height: rect.height)
        case .ended:
            if translation.y > self.threshold {
                self.dismiss(animated: true, completion: nil)
            } else {
                UIView.animate(withDuration: 0.3, animations: { 
                    self.view.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height )
                })
            }
        default:
            break
        }
    }
}

