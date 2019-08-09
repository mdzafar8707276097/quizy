//
//  AllQuestionOfMCQ.swift
//  MyFirstProject
//
//  Created by Zafar Ahmad on 07/08/19.
//  Copyright © 2019 Zafar Ahmad. All rights reserved.
//

import Foundation

class AllQuestionOFMCQ {
    
    var questionList = [Question]()
    //        var optionList = [Question]()
    init() {
        
        let item = Question(questionText: "Swift Is a Markup Language", correctAnswer: 1, options1 : "yes", options2: "No", options3: "It is a Programming Language", options4: "Scripting Language")
        questionList.append(item)
        let item2 = Question(questionText: "Arab Country is Beautyful ", correctAnswer: 2, options1: "No", options2: "Yes", options3: "NO Its Not", options4: "Yes it is")
        questionList.append(item2)
        let item3 = Question(questionText: "Swift language Is Faster than python", correctAnswer: 3, options1: "It is the Slower than Python", options2: "Swift is Faster", options3: "No its not", options4: "yes it is")
        questionList.append(item3)
        let item4 = Question(questionText: "Swift is smart language", correctAnswer: 4, options1: "No", options2: "It is smarter than python", options3: "It is a scritp type language", options4: "Yes")
        questionList.append(item4)
        let item5 = Question(questionText: """
                                           What is the Oouput of the following code
                                           x = 4
                                           print(x)
                                           """, correctAnswer: 1, options1: "4", options2: "4.0", options3: "error", options4: "4.0000")
        questionList.append(item5)
        let item6 = Question(questionText: "How do you declare an Iboutlet property?", correctAnswer: 2, options1: "A. IBOutlet var button:UIButton",    options2:"B. var button:UIButton(IBOutlet)", options3: "C. var button:UIButtonoutlet", options4: "D. None of the mentioned");            questionList.append(item6)
        
        
        let item7 = Question(questionText: "4. What are the control transfer statements used in Swift?", correctAnswer: 3, options1: "A. Continue", options2: "B. Break", options3: "C. Fallthrough", options4: "D. All of these")
        questionList.append(item7)
        
        let item8 = Question(questionText: "7. What type of integer is denoted by Int8?", correctAnswer: 4, options1: "A. Open", options2: "B. Signed", options3: "C. Unsigned", options4: "D. Close")
        questionList.append(item8)
        
        let item9 = Question(questionText: "8. Given : var stringValue:String = “Justin Gif”. What is the result of stringValue = nil?", correctAnswer: 1, options1: "A. stringValue == nil", options2: "B. stringValue == “Justin Gif”", options3: "C. the compiler won't allow it", options4: "D. None")
        questionList.append(item9)
        
        let item10 = Question(questionText: "9. What are the collection types in Swift?", correctAnswer: 2, options1: "A. Dictionary and array", options2: "B. Array and library", options3: "C. Dictionary and library", options4: "D. Library, dictionary and array")
        questionList.append(item10)
        
        
        
    }
}
