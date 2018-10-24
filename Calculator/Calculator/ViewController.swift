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
    var startOffWithDecimal: Bool = false
    
    @IBOutlet weak var roundCorners5: UIButton!
    @IBOutlet weak var roundCorners6: UIButton!
    @IBOutlet weak var roundCorners4: UIButton!
    @IBOutlet weak var roundCorners7: UIButton!
    @IBOutlet weak var roundCorners9: UIButton!
    @IBOutlet weak var roundCorners8: UIButton!
    @IBOutlet weak var roundCorners1: UIButton!
    @IBOutlet weak var roundCorners2: UIButton!
    @IBOutlet weak var roundCorners3: UIButton!
    @IBOutlet weak var roundCornersClear: UIButton!
    @IBOutlet weak var roundCornersChangeSign: UIButton!
    @IBOutlet weak var roundCornersPlus: UIButton!
    @IBOutlet weak var roundCornersMinus: UIButton!
    @IBOutlet weak var roundCornersMultiply: UIButton!
    @IBOutlet weak var roundCornersDivide: UIButton!
    @IBOutlet weak var roundCornersEqual: UIButton!
    @IBOutlet weak var roundCornersDecimal: UIButton!
    @IBOutlet weak var roundCorners0: UIButton!
    @IBAction func input(_ sender: UIButton)
    {
        if newNumber == false
        {
            display.text = display.text! + String(sender.tag)
            num = Double(display.text!)!
            check = false
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
        if display.text == "."
        {
            display.text = "ERROR"
        }
        if check == false
        {
            previousNumber.append(num)
        }
        if check == true
        {
            if previousNumber.isEmpty == true
            {
                previousNumber.append(temp)
            }
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
            if display.text == "."
            {
                display.text = "ERROR"
            }
            if add == false && sub == false && div == false && mult == false
            {
                result = Double(display.text!)!
            }
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
            let tempRoundDown = result.rounded(.towardZero) //rounds it down
            var finalResult:Double = 0
            if tempRoundDown != result
            {
                var inputFunction:Double = 0
                inputFunction = abs(result) - abs(tempRoundDown)
                let refinedResult = refineResult(calculation: inputFunction) //formats decimal
                if (result < 0) //adds new formatted decimal to result
                {
                    finalResult = tempRoundDown - refinedResult
                }
                if result == 0
                {
                    finalResult = result
                }
                if result > 0 //adds new formatted decimal to result
                {
                    finalResult = tempRoundDown + refinedResult
                }
            }
            else
            {
                finalResult = result
            }
            if ((finalResult - finalResult.rounded(.towardZero)) == 0)
            {
                display.text = String(Int(finalResult))
            }
            else if (finalResult - finalResult.rounded(.towardZero)) != 0
            {
                display.text = String(finalResult)
            }
            previousNumber.removeAll() //clears array
            temp = finalResult //sets a temporary value of the result
            result = 0
            check = true
        }
        newNumber = true
    }
    func refineResult(calculation: Double) ->Double
    {
        var retValue:Double = calculation
        var array:[Character] = []
        let temp:String = String(abs(calculation))
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
        return abs(retValue)
    }
    @IBAction func changeSign(_ sender: UIButton)
    {
        var changeSign: Double = 0
        if display.text != String(0)
        {
            if check == true
            {
                changeSign = Double(display.text!)!
                changeSign *= -1
                previousNumber.append(changeSign)
                display.text = ""
                if (previousNumber[0] - previousNumber[0].rounded(.towardZero)) == 0
                {
                    display.text = display.text! + String(Int(previousNumber[0]))
                }
                else
                {
                    display.text = display.text! + String(previousNumber[0])
                }
            }
            if check == false
            {
                num *= -1
                display.text = ""
                if (num - num.rounded(.towardZero)) == 0
                {
                    display.text = display.text! + String(Int(num))
                }
                else
                {
                    display.text = display.text! + String(num)
                }
            }
        }
    }
    @IBAction func decimalPoint(_ sender: UIButton)
    {
        let displayText:String = display.text!
        if check == true
        {
            display.text = ""
            display.text = "."
            newNumber = false
        }
        if check == false
        {
            if displayText.contains(".")
            {
                display.text = "ERROR"
            }
            else
            {
                display.text = display.text! + String(".")
            }
        }
    }
    @IBAction func clearButton(_ sender: UIButton)
    {
        previousNumber.removeAll()
        display.text = ""
        result = 0
    }
    override func viewDidLoad() {
        display.backgroundColor = UIColor.white
        display.textColor = UIColor.black
        display.font = UIFont(name: "Futura-Medium", size: 60)
        roundCornersClear.design()
        roundCornersChangeSign.design()
        roundCornersPlus.design()
        roundCorners1.design()
        roundCorners2.design()
        roundCorners3.design()
        roundCornersMinus.design()
        roundCorners4.design()
        roundCorners5.design()
        roundCorners6.design()
        roundCornersMultiply.design()
        roundCorners7.design()
        roundCorners8.design()
        roundCorners9.design()
        roundCornersDivide.design()
        roundCorners0.design()
        roundCornersDecimal.design()
        roundCornersEqual.design()
        display.layer.shadowColor = UIColor(red: 197/255, green: 239/255, blue: 247/255, alpha: 1).cgColor
        display.layer.shadowRadius = 3
        display.layer.shadowOpacity = 1
        display.layer.shadowOffset = CGSize(width: 0, height: 0)
        roundCornersMinus.titleLabel?.font = UIFont(name: "Futura-Medium", size: 45)
        roundCornersDecimal.titleLabel?.font = UIFont(name: "Futura-Medium", size: 55)
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

