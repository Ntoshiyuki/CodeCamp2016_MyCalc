//
//  GokonViewController.swift
//  MyCalc
//
//  Created by docomo on 2017/01/22.
//  Copyright © 2017年 NAGAE TOSHIYUKI. All rights reserved.
//

import UIKit

class GokonViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.0, green: 1.0, blue: 0.8, alpha: 1.0)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBOutlet weak var manLBL: UITextField!
    @IBOutlet weak var womanLBL: UITextField!
    @IBOutlet weak var hosokuLBL: UILabel!
    
    @IBOutlet weak var sumTxt: UITextField!
    @IBOutlet weak var xTxt: UITextField!
    @IBOutlet weak var yTxt: UITextField!
    
    var aveX:Float = 0
    var aveY:Float = 0
    var keiX:Int = 0
    var keiY:Int = 0
    var tani:Int = 0
    var ansx:Float = 0
    var ansy:Float = 0
    
    @IBOutlet weak var xLBL: UITextField!
    @IBOutlet weak var yLBL: UITextField!
    
    @IBAction func levelBTN(_ sender: UISlider) {
        keiX = Int(sender.value)
        keiY = 10 - keiX
        xLBL.text = "\(keiX)"
        yLBL.text = "\(keiY)"
    }
    
    @IBAction func taniBTN(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            tani = 0
        }else if sender.selectedSegmentIndex == 1{
            tani = 1
        }else if sender.selectedSegmentIndex == 2{
            tani = 2
        }else {
            tani = 3
        }
    }
    
    @IBAction func calcBTN(_ sender: Any) {
        hosokuLBL.textColor = UIColor.red
        
        var sum:Float = Float(self.sumTxt.text!)!
        var x:Float = Float(self.xTxt.text!)!
        var y:Float = Float(self.yTxt.text!)!
        aveX = sum*Float(keiX) / (Float(keiX)*x + Float(keiY)*y)
        aveY = sum*Float(keiY) / (Float(keiX)*x + Float(keiY)*y)
        
        if tani == 0 {
            
            //1円単位の割り算
            if x==0 && y==0 {
                manLBL.text="-"
                womanLBL.text="-"
            }else if x==0 {
                manLBL.text="-"
                womanLBL.text="\(round(aveY))"
                
            }else if y==0 {
                manLBL.text="\(round(aveX))"
                womanLBL.text="-"
            }else {
                manLBL.text="\(round(aveX))"
                womanLBL.text="\(round(aveY))"
            }
            var t0:Float = sum - round(aveX)*x - round(aveY)*y
            if x==0 && y==0 {
                hosokuLBL.text="人数を入れてください"
            }else if t0>0 {
                hosokuLBL.text="\(t0)円不足しています"
            }else if t0==0 {
                hosokuLBL.text="不足金額はございません"
            }else{
                hosokuLBL.text="\(-t0)円超過しています"
            }
        }else if tani == 1 {
            //100円単位の割り算
            if x==0 && y==0 {
                manLBL.text="-"
                womanLBL.text="-"
            }else if x==0 {
                manLBL.text="-"
                womanLBL.text="\((round(aveY/100))*100)"
            }else if y==0 {
                manLBL.text="\((round(aveX/100))*100)"
                womanLBL.text="-"
            }else{
                manLBL.text="\((round(aveX/100))*100)"
                womanLBL.text="\((round(aveY/100))*100)"
            }
            var t1:Float = sum - (round(aveX/100))*100*x - (round(aveY/100))*100*y
            if x==0 && y==0 {
                hosokuLBL.text="人数を入れてください"
            }else if t1>0 {
                hosokuLBL.text="\(t1)円不足しています"
            }else if t1==0 {
                hosokuLBL.text="不足金額はございません"
            }else{
                hosokuLBL.text="\(-t1)円超過しています"
            }
        }else if tani==2 {
            //500円単位の割り算
            var xx = aveX - (round(aveX/1000))*1000
            var yy = aveY - (round(aveY/1000))*1000
            
            if xx>=0{
                if xx >= 250{
                    ansx = (round(aveX/1000))*1000+500
                }else{
                    ansx = (round(aveX/1000))*1000
                }
            }else {
                if xx <= -250{
                    ansx = (round(aveX/1000))*1000-500
                }else{
                    ansx = (round(aveX/1000))*1000
                }
            }
            if yy>=0{
                if yy >= 250{
                    ansy = (round(aveY/1000))*1000+500
                }else{
                    ansy = (round(aveY/1000))*1000
                }
            }else {
                if yy <= -250{
                    ansy = (round(aveY/1000))*1000-500
                }else{
                    ansy = (round(aveY/1000))*1000
                }
            }
            if x==0 && y==0 {
                manLBL.text="-"
                womanLBL.text="-"
            }else if x==0 {
                manLBL.text="-"
                womanLBL.text="\(ansy)"
            }else if y==0 {
                manLBL.text="\(ansx)"
                womanLBL.text="-"
            }else{
                manLBL.text="\(ansx)"
                womanLBL.text="\(ansy)"
            }
            var t2:Float = sum - ansx*x - ansy*y
            if x==0 && y==0 {
                hosokuLBL.text="人数を入れてください"
            }else if t2>0 {
                hosokuLBL.text="\(t2)円不足しています"
            }else if t2==0 {
                hosokuLBL.text="不足金額はございません"
            }else{
                hosokuLBL.text="\(-t2)円超過しています"
            }
        }else if tani==3 {
            //1000円単位の割り算
            if x==0 && y==0 {
                manLBL.text="-"
                womanLBL.text="-"
            }else if x==0 {
                manLBL.text="-"
                womanLBL.text="\((round(aveY/1000))*1000)"
            }else if y==0 {
                manLBL.text="\((round(aveX/1000))*1000)"
                womanLBL.text="-"
            }else{
                manLBL.text="\((round(aveX/1000))*1000)"
                womanLBL.text="\((round(aveY/1000))*1000)"
            }
            var t3:Float = sum - (round(aveX/1000))*1000*x - (round(aveY/1000))*1000*y
            if x==0 && y==0 {
                hosokuLBL.text="人数を入れてください"
            }else if t3>0 {
                hosokuLBL.text="\(t3)円不足しています"
            }else if t3==0 {
                hosokuLBL.text="不足金額はございません"
            }else{
                hosokuLBL.text="\(-t3)円超過しています"
            }
        }else{
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
