//
//  ViewController.swift
//  Calculator
//
//  Created by Patil, Yash M on 10/8/18.
//  Copyright © 2018 Patil, Yash M. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var num: Double = 0
    var previousNumber:[Double] = []
    var result: Double = 0
    var add: Bool = false
    var sub: Bool = false
    var mult: Bool = false
    var div: Bool = false
    var newNumber: Bool = false
    var check: Bool = false
    var temp: Double = 0
    
    @IBAction func input(_ sender: UIButton)
    {
        if newNumber == false
        {
            display.text = display.text! + String(sender.tag)
            num = Double(display.text!)!
        }
        if newNumber == true
        {
            display.text = ""
            display.text = display.text! + String(sender.tag)
            num = Double(display.text!)!
            newNumber = false
            check = false
        }
    }
    @IBAction func calculation(_ sender: UIButton)
    {
        if check == false
        {
            previousNumber.append(num)
        }
        if check == true
        {
            previousNumber.append(temp)
            check = false
        }
        if sender.tag == 10 //plus
        {
            add = true
        }
        if sender.tag == 11 //minus
        {
            sub = true
        }
        if sender.tag == 12 //multiply
        {
            mult = true
        }
        if sender.tag == 13 //divide
        {
            div = true
        }
        if sender.tag == 14 //equals
        {
            if add == true
            {
                for x in 0 ... previousNumber.count-1
                {
                    result += previousNumber[x]
                    print(result)
                    print(previousNumber[x])
                }
                add = false
            }
            if sub == true
            {
                for x in 0 ... previousNumber.count-1
                {
                    if (x == 0)
                    {
                        result += previousNumber[x]
                    }
                    else
                    {
                        result -= previousNumber[x]
                    }
                }
                sub = false
            }
            if mult == true
            {
                for x in 0 ... previousNumber.count-1
                {
                    if (x == 0)
                    {
                        result += previousNumber[x]
                    }
                    else
                    {
                        result *= previousNumber[x]
                    }
                }
                mult = false
            }
            if div == true
            {
                for x in 0 ... previousNumber.count-1
                {
                    if (x == 0)
                    {
                        result += previousNumber[x]
                    }
                    else 
                    {
                        result /= previousNumber[x]
                    }
                }
                div = false
            }
            let tempRoundDown = result.rounded(.towardZero)
            var inputFunction:Double = 0
            if (result < 0)
            {
                inputFunction = result + tempRoundDown
            }
            if (result == 0)
            {
                inputFunction = result
            }
            if (result > 0)
            {
                inputFunction = result - tempRoundDown
            }
            let refinedResult = refineResult(calculation: inputFunction)
            var finalResult:Double = 0
            if (result < 0)
            {
                finalResult = tempRoundDown - refinedResult
            }
            if result == 0
            {
                finalResult = result
            }
            if result > 0
            {
                finalResult = tempRoundDown + refinedResult
            }
            display.text = String(finalResult)
            previousNumber.removeAll()
            temp = finalResult
            previousNumber.append(finalResult)
            result = 0
            check = true
        }
        newNumber = true
    }
    func refineResult(calculation: Double) ->Double
    {
        var retValue:Double = calculation
        var array:[Character] = []
        let temp:String = String(calculation)
        var quit:Bool = false
        for x in temp
        {
            array.append((x))
        }
        for x in array
        {
            var count = 0
            for a in array
            {
                if a == x
                {
                    count += 1
                }
                if count > 5
                {
                    quit = true
                    break
                }
            }
            if quit == true
            {
                retValue = Double(floor(100*calculation)/100)
                break
            }
        }
        return retValue
    }
    @IBAction func changeSign(_ sender: UIButton)
    {
        if check == true
        {
            previousNumber[0] *= -1
            display.text = ""
            display.text = display.text! + String(previousNumber[0])
        }
        if check == false
        {
            num *= -1
            display.text = ""
            display.text = display.text! + String(num)
        }
    }
    @IBAction func decimalPoint(_ sender: UIButton)
    {
        let displayText:String = display.text!
        if displayText.contains(".")
        {
            display.text = "ERROR | PRESS CLEAR TO CONTINUE"
        }
        else
        {
            display.text = display.text! + String(".")
        }
    }
    @IBAction func clearButton(_ sender: UIButton)
    {
        previousNumber.removeAll()
        display.text = ""
        result = 0
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

