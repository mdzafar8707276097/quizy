//
//  QuestionOFMCQ.swift
//  MyFirstProject
//
//  Created by Zafar Ahmad on 07/08/19.
//  Copyright © 2019 Zafar Ahmad. All rights reserved.
//

import Foundation

class Question {
    
    var question : String
    var answer : Int
    var option1 : String
    var option2 : String
    var option3 : String
    var option4 : String
    
    init(questionText : String, correctAnswer : Int,options1 : String, options2 : String, options3 : String, options4 : String) {
        question = questionText
        answer = correctAnswer
        option1 = options1
        option2 = options2
        option3 = options3
        option4 = options4
        
    }
    
    //    init(options1 : String, options2 : String, options3 : String, options4 : String){
    //        option1 = options1
    //        option2 = options2
    //        option3 = options3
    //        option4 = options4
    //    }
    
}
