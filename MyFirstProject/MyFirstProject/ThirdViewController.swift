//
//  ThirdViewController.swift
//  MyFirstProject
//
//  Created by Zafar Ahmad on 07/08/19.
//  Copyright © 2019 Zafar Ahmad. All rights reserved.
//

import UIKit
import AVFoundation

class ThirdViewController: UIViewController {
    
    let objectOfMCQ = AllQuestionOFMCQ()
    
//    var randonQuestionGenerator = 0
//    var randomQuestion = 0
    var audioPlayer : AVAudioPlayer!
    
    var QuestionNext : Int = 0
    
    var totalScored : Float = 0.0
    
    var scored : Float = 0.0
    
    var totalTime : Int = 30
    var currentTime = 30.0
    var timer : Timer!
    
    var selectedAnswer : Int = 0
    
    
    
    

    @IBOutlet weak var ProgressView: UIProgressView!
    
    @IBOutlet weak var QuestionLabel: UILabel!
    
    @IBOutlet weak var Button1: UIButton!
    @IBOutlet weak var Button2: UIButton!
    @IBOutlet weak var Button3: UIButton!
    @IBOutlet weak var Button4: UIButton!
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        ProgressView.layer.cornerRadius = 5
        ProgressView.clipsToBounds = true
        ProgressView.layer.sublayers![1].cornerRadius = 8
        ProgressView.subviews[1].clipsToBounds = true
        ProgressView.transform = CGAffineTransform(scaleX: 1, y: 1)
        ProgressView.transform = ProgressView.transform.scaledBy(x: 1, y: 2)
        
        
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(update), userInfo: nil, repeats: true)
        perform(#selector(backwardTime), with: nil, afterDelay: 1.0)
        nextQuestion()

        // Do any additional setup after loading the view.
    }
    
    
    @objc func backwardTime() {
        currentTime -= 1
        ProgressView.progress = Float(currentTime/30.0)
        if currentTime > 0 {
            perform(#selector(backwardTime), with: nil, afterDelay: 1.0)
        }
        else {
            currentTime = 0.0
        }
        
    }
    
    @objc func update() {
        if totalTime != 0 {
            totalTime -= 1
            print("total time = \(totalTime)")
        }
        else {
            perform(#selector(backwardTime), with: nil, afterDelay: 1.0)
            backwardTime()
            QuestionNext += 1
            nextQuestion()
          
//            randomQuestionNext += 1
//            print("backward time after random question increases \(randomQuestionNext)")
        }
    }
    
    
    
    
    
    

    @IBAction func ButtonPressed(_ sender: UIButton) {
        QuestionNext += 1
        
        if (sender as AnyObject).tag == selectedAnswer {
            
            scored += 1.0
            print("Write Answer Scored -> \(scored)")
            
            
            
            
    UIView.animate(withDuration: 0.6,
        animations: {
            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.5) {
                                sender.transform = CGAffineTransform.identity
                            }
            })
            
            UIView.animate(withDuration: 1, animations: {
                
                let play = NSURL(fileURLWithPath: Bundle.main.path(forResource: "your-turn", ofType: "mp3")!)
                do {
                    self.audioPlayer = try AVAudioPlayer(contentsOf: play as URL)
                }
                catch {
                    print(error)
                }
                self.audioPlayer.play()
                
                ///**// Button zoom animation
                
                sender.backgroundColor = UIColor.green
                
                
            },completion: { _ in
                
                
                
               sender.backgroundColor = UIColor.black
            })
            
            
//            randomQuestionNext += 1
//            print("increases the random question next \(randomQuestionNext)")
//
        }
        else {
            
            scored -= 0.75
            print("Wrong Answer Scored -> \(scored)")
            
            print("Wrong answer ")
            let play = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SWOOSH #5", ofType: "mp3")!)
            do {
                self.audioPlayer = try AVAudioPlayer(contentsOf: play as URL)
            }
            catch {
                print(error)
            }
            self.audioPlayer.play()
            
            UIView.animate(withDuration: 0.6,
                           animations: {
                            sender.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
            },
                           completion: { _ in
                            UIView.animate(withDuration: 0.5) {
                                sender.transform = CGAffineTransform.identity
                            }
            })
            
            UIView.animate(withDuration: 1, animations: {
  
                sender.backgroundColor = UIColor.red
                
                
            },completion: { _ in

                sender.backgroundColor = UIColor.black
            })
            
        }
         totalScored = scored
        print("Your Total Scored: \(totalScored)")
        
        nextQuestion()
 
    }

    
    func nextQuestion() {
        totalTime = 30
        currentTime = 30.0
        ProgressView.progress = 30

        if QuestionNext < objectOfMCQ.questionList.count {
            print("\(QuestionNext)")
        QuestionLabel.text = objectOfMCQ.questionList[QuestionNext].question
        Button1.setTitle(objectOfMCQ.questionList[QuestionNext].option1, for: UIControl.State.normal)
        Button2.setTitle(objectOfMCQ.questionList[QuestionNext].option2, for: UIControl.State.normal)
        Button3.setTitle(objectOfMCQ.questionList[QuestionNext].option3, for: UIControl.State.normal)
        Button4.setTitle(objectOfMCQ.questionList[QuestionNext].option4, for: UIControl.State.normal)
        selectedAnswer = objectOfMCQ.questionList[QuestionNext].answer
        
        }
        else {
            ProgressView.progress = 0
            currentTime = 0.0
            restart()
        }
        if QuestionNext == 9 {
            
        }

    }
    func restart() {
        
        let cc = UIAlertController(title: "AWESOME", message: """
            You Completed The Challenges! End Of the Challenge.
            Your Scored: \(totalScored) "
            """, preferredStyle: UIAlertController.Style.actionSheet)
        
        let aa = UIAlertAction(title: "RESTART", style: .default, handler: { (action: UIAlertAction!) in
            self.currentTime = 30.0
            self.totalTime = Int(30.0)
            self.ProgressView.progress = 30.0
            self.perform(#selector(self.backwardTime), with: nil, afterDelay: 1.0)
            self.QuestionNext = 0
//            self.scored = 0
            self.selectedAnswer = 0
            
            // for next question
            self.nextQuestion()
            
            print("Click on RESTART button")
            
        })
        
        cc.addAction(UIAlertAction(title: "QUIT", style: .cancel, handler: { (action: UIAlertAction!) in
            //            self.timer.invalidate()
            self.dismiss(animated: true, completion: nil)
            
            
            print("Click on QUIT button")
            self.timer.invalidate()
            
        }))
        //
        cc.addAction(aa)
        
        present(cc, animated: true, completion: nil)
        self.navigationController?.popToRootViewController(animated: true)
        
        
        
        
    }
    
    
    @IBAction func QuitButtonn(_ sender: Any) {
        
        dismiss(animated: true, completion:nil)
        let play = NSURL(fileURLWithPath: Bundle.main.path(forResource: "SUSPENSE - SUDDEN #2", ofType: "mp3")!)
        do {
            self.audioPlayer = try AVAudioPlayer(contentsOf: play as URL)
        }
        catch {
            print(error)
        }
        self.audioPlayer.play()
        timer.invalidate()
    }
    
    
    }
    
    


