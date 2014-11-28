//
//  ViewController.swift
//  Stopwatch
//
//  Created by ben on 27/11/2014.
//  Copyright (c) 2014 Ben Chamla. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var second = 0
    var min = 0
    var play = 0
    
    var timer = NSTimer()
    
    @IBOutlet weak var TimeLabel: UILabel!
    @IBAction func PlayButton(sender: AnyObject) {
        if (play == 0){
           timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("result"), userInfo: nil, repeats: true)
        }
        
        play = 1
    }
    @IBAction func PauseButton(sender: AnyObject) {
        timer.invalidate()
        play = 0
    }
    @IBAction func RestartButton(sender: AnyObject) {
        second = 0
        min = 0
        timer.invalidate()
        TimeLabel.text = "00:00"
        play = 0 
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        TimeLabel.text = "00:00"
    
    }
    
    
    func result() {
        if (second<9){
     second++
            TimeLabel.text = "0\(min):0\(second)"
        }else if(second>8 && second<59){
            
            second++
            TimeLabel.text = "0\(min):\(second)"
        }else if(second==59){
            second=0
            min = min + 1
            TimeLabel.text = "\(min):0\(second)"
        }
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

