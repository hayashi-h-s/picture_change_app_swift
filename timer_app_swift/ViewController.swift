//
//  ViewController.swift
//  timer_app_swift
//
//  Created by haya on 2020/06/08.
//  Copyright © 2020 haya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var stopButton: UIButton!
    
    var timer =  Timer()
    
    var count = Int()
    
    var imageArray = [UIImage]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        count = 0
        
        stopButton.isEnabled = false
        
        for i in 0..<5{
            print(i)
            
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
//        imageView.image = UIImage[named: "0"]
        imageView.image = UIImage(named: "0")
    }

    
    func startTimer(){
        
        timer = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(timerUpdate),
            userInfo: nil, repeats: true)
        
    }
    
    
    @objc func timerUpdate(){
        
        count = count + 1
        
        if  count > 3 {
            count = 0
        }
        
        imageView.image = imageArray[count]
        
    }
    
    @IBAction func start(_ sender: Any) {
        
        startTimer()
        
        startButton.isEnabled = false
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        
        startButton.isEnabled = true
        stopButton.isEnabled = false
    
        timer.invalidate()
        
    }
    
}

