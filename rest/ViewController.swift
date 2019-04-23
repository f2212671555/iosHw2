//
//  ViewController.swift
//  rest
//
//  Created by 陸顥壬 on 2019/4/16.
//  Copyright © 2019 陸顥壬. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var scoreSlider: UISlider!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var numberTextField: UITextField!
    @IBOutlet weak var orderDatePicker: UIDatePicker!
    @IBOutlet weak var respectSegmentedControl: UISegmentedControl!
    @IBOutlet weak var boothUISwitch: UISwitch!
    

    var isBooth: Bool!

    @IBAction func controlScore(_ sender: Any) {
       
    
        scoreLabel.text = "\(Int(scoreSlider.value))顆星";
    }
  
    
    @IBAction func isBooth(_ sender: UISwitch) {
        if sender.isOn
        {
            isBooth = true;
        }
        else
        {
            isBooth = false;
        }
    }

    var totalNum = 50
    
    @IBAction func submit(_ sender: AnyObject) {
        let name = nameTextField.text!
        let respect = respectSegmentedControl.titleForSegment(at: respectSegmentedControl.selectedSegmentIndex)!
        let number = Int(numberTextField.text!)!
        var date = orderDatePicker.date.description
        let YYMMDD = date.components(separatedBy: " ")[0].components(separatedBy: "-")
        let hhmmss = date.components(separatedBy: " ")[1].components(separatedBy: ":")
        
        
        let randEaterNum = Int.random(in: 29...50)
        let randTimeNum = Int.random(in: 2...10)
        var message: String
        if(randEaterNum + number > totalNum) // 沒位置
        {
            message = "\(name+respect) 不好意思！\n最近都沒位子囉，可能要等個\(randTimeNum)天喔！！"
        }
        else
        {
            message = "\(name+respect) 恭喜你～\n訂位成功\n這邊跟您確認訂單\n用餐時間 \(YYMMDD[0])年\(YYMMDD[1])月\(YYMMDD[2])日\n\(hhmmss[0])時\(hhmmss[1])分\(hhmmss[2])秒！\n用餐人數 \(number)人\n"
            if(isBooth){
                message.append("包廂")
            }
        }
        print()
        
        
        let alert = UIAlertController(title: "通知", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "我知道了", style: .default) { (UIAlertAction) in self.nothing()
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    func nothing(){
        
    }
    
    @IBAction func closeKeyBoard(_ sender: Any) {
    }
    
}

