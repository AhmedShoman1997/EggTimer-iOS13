//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var bar: UIProgressView!
    
    var player = AVAudioPlayer()
    var eggTimes = ["Soft": 3,"Medium": 4,"Hard": 7]
    var totalSeconds:Float = 0.0
    var remainSeconds:Float = 0.0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        
        timer.invalidate()
        let hardness = sender.currentTitle
        lbl.text = hardness
        remainSeconds = 0.0
        totalSeconds = Float(eggTimes[hardness!]!)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        
    }
    @objc func updateTimer()  {
        if totalSeconds > remainSeconds {
            remainSeconds += 1
            bar.progress =  remainSeconds / totalSeconds
            print(remainSeconds / totalSeconds)
            
        }
        else{
            timer.invalidate()
            lbl.text = "done"
            bar.progress = 0
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()
            
        
        }
    }
    
}


