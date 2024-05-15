//
//  ViewController.swift
//  myCalcul01
//
//  Created by Ivan Maslennikov on 15.05.2024.
//

import UIKit

class ViewController: UIViewController {
    
//    var firstNumber = 0
//    var resultNumber = 0
//    var currentOperations: Operation? // ??
    
    var firstNumber: Double = 0
    var secondNumber: Double = 0
    var currentOperation: String = ""
    // Переменные для хранения состояния калькулятора
    
    // Это IBOutlet для отображения текста на экране калькулятора
    
    @IBOutlet weak var displayLabel: UILabel!
    // Это IBOutlet требуется для отображения текста на экране калькулятора
    
    // IBAction служит для обработки нажатия кнопок
    @IBAction func numberPressed(_ sender: UIButton) {
        guard let numberText = sender.currentTitle else { return }

        if displayLabel.text == "0" {
            displayLabel.text = numberText
        } else if let text = displayLabel.text {
            displayLabel.text = text + numberText
        }
    }

    
    
    
    @IBAction func operationPressed(_ sender: UIButton) {
        // Эта переменная хранит текущую выбранную операцию
        currentOperation = sender.currentTitle!
        
        // Сохраняем текущее число из displayLabel в переменную, преобразуя его из String в Double
        if let number = Double(displayLabel.text!) {
            firstNumber = number
            displayLabel.text = "0" // Сброс после выполнения операции
        }
    }
    
    
    
    
    @IBAction func equalsPressed(_ sender: UIButton) {
        // Второе число, с которым будет проведена операция
        
        if let number = Double(displayLabel.text!) {
            secondNumber = number
            
            // 'result' - Результат операции, которое станет новым значением displayLabel.text
            var result: Double
            switch currentOperation {
            case "+":
                result = firstNumber + secondNumber
            case "-":
                result = firstNumber - secondNumber
            case "*":
                result = firstNumber * secondNumber
            case "/":
                result = secondNumber == 0 ? Double.nan : firstNumber / secondNumber
            default:
                return
            }
            
            displayLabel.text = String(result)
            
        }
    }

    
    
    
    @IBAction func clearPressed(_ sender: UIButton) {
        
        firstNumber = 0
        secondNumber = 0
        currentOperation = ""
        displayLabel.text = "0"
//        userIsInTheMiddleOfTyping = false
    }

    
    
    

}

