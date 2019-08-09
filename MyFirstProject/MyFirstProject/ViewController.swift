//
//  ViewController.swift
//  MyFirstProject
//
//  Created by Zafar Ahmad on 07/08/19.
//  Copyright © 2019 Zafar Ahmad. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func LoginPressed(_ sender: UIButton!) {

    
        let play = NSURL(fileURLWithPath: Bundle.main.path(forResource: "INTRO SOUND EFFECT", ofType: "mp3")!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: play as URL)
        }
        catch {
            print(error)
        }
        self.audioPlayer.play()
    
}

}
