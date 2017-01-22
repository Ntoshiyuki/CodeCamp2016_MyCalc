//
//  ViewController.swift
//  MyCalc
//
//  Created by docomo on 2017/01/22.
//  Copyright © 2017年 NAGAE TOSHIYUKI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var lbl: UILabel!
    var input:Float32 = 0
    var input2:Float32 = 0
    var calc:String = ""
    var shisoku:Int = 0
    var count:Int = 0
    
    @IBAction func plus(_ sender: Any) {
        if shisoku == 0{
            input += input2
        }else if shisoku == 1{
            input += input2
        }else if shisoku == 2{
            input -= input2
        }else if shisoku == 3{
            input *= input2
        }else if shisoku == 4{
            input /= input2
        }else {
        }
        input2 = 0
        count = 0
        shisoku = 1
        calc += "+"
        lbl.text = calc
    }
    
    @IBAction func mainus(_ sender: Any) {
        if shisoku == 0{
            input += input2
        }else if shisoku == 1{
            input += input2
        }else if shisoku == 2{
            input -= input2
        }else if shisoku == 3{
            input *= input2
        }else if shisoku == 4{
            input /= input2
        }else {
        }
        input2 = 0
        count = 0
        shisoku = 2
        calc += "-"
        lbl.text = calc
    }
    
    @IBAction func multi(_ sender: Any) {
        if shisoku == 0{
            input += input2
        }else if shisoku == 1{
            input += input2
        }else if shisoku == 2{
            input -= input2
        }else if shisoku == 3{
            input *= input2
        }else if shisoku == 4{
            input /= input2
        }else {
        }
        input2 = 0
        count = 0
        shisoku = 3
        calc += "×"
        lbl.text = calc
    }
    
    @IBAction func div(_ sender: Any) {
        if shisoku == 0{
            input += input2
        }else if shisoku == 1{
            input += input2
        }else if shisoku == 2{
            input -= input2
        }else if shisoku == 3{
            input *= input2
        }else if shisoku == 4{
            input /= input2
        }else {
        }
        input2 = 0
        count = 0
        shisoku = 4
        calc += "÷"
        lbl.text = calc
    }
    
    @IBAction func finish(_ sender: Any) {
        if shisoku == 0{
            input += input2
        }else if shisoku == 1{
            input += input2
        }else if shisoku == 2{
            input -= input2
        }else if shisoku == 3{
            input *= input2
        }else if shisoku == 4{
            input /= input2
        }else {
        }
        input2 = 0
        count = 0
        shisoku = 0
        lbl.text = String(input)
        calc = String(input)
    }
    
    @IBAction func reset(_ sender: Any) {
        input = 0
        input2 = 0
        count = 0
        calc = ""
        lbl.text = calc
        shisoku = 0
    }
    
    @IBAction func numeric(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if count == 0 {
                input2 += 0
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 0
            }else{
            }
            calc += "0"
            lbl.text = calc
            
        case 1:
            if count == 0 {
                input2 += 1
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 1
            }else{
            }
            calc += "1"
            lbl.text = calc
            
        case 2:
            if count == 0 {
                input2 += 2
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 2
            }else{
            }
            calc += "2"
            lbl.text = calc
            
        case 3:
            if count == 0 {
                input2 += 3
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 3
            }else{
            }
            calc += "3"
            lbl.text = calc
            
        case 4:
            if count == 0 {
                input2 += 4
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 4
            }else{
            }
            calc += "4"
            lbl.text = calc
            
        case 5:
            if count == 0 {
                input2 += 5
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 5
            }else{
            }
            calc += "5"
            lbl.text = calc
            
        case 6:
            if count == 0 {
                input2 += 6
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 6
            }else{
            }
            calc += "6"
            lbl.text = calc
            
        case 7:
            if count == 0 {
                input2 += 7
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 7
            }else{
            }
            calc += "7"
            lbl.text = calc
            
        case 8:
            if count == 0 {
                input2 += 8
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 8
            }else{
            }
            calc += "8"
            lbl.text = calc
            
        case 9:
            if count == 0 {
                input2 += 9
                count = 1
            }else if count == 1 {
                input2 = input2*10 + 9
            }else{
            }
            calc += "9"
            lbl.text = calc
            
        default:
            print("どのボタンでもありません")
        }
    }
}


