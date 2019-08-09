//
//  SecondViewController.swift
//  MyFirstProject
//
//  Created by Zafar Ahmad on 07/08/19.
//  Copyright © 2019 Zafar Ahmad. All rights reserved.
//

import UIKit
import AVFoundation

class SecondViewController: UIViewController {
    
//   let objectofThird = ThirdViewController()
//
//    var allQuestions : Array<Any>!
    var audioPlayer : AVAudioPlayer!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func MCQBUtton(_ sender: Any) {
        
        
        let play = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SUSPENSE - SUDDEN #2", ofType: "mp3")!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: play as URL)
        }
        catch {
            print(error)
        }
        self.audioPlayer.play()
    }
    

        
    @IBAction func TestYourCode(_ sender: Any) {
    }
    
    
    
    
    
}
