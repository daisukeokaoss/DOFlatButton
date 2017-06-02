//
//  ViewController.swift
//  DOFlatButtonProj
//
//  Created by 岡大輔 on 2017/05/31.
//  Copyright © 2017年 岡大輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let button1:DOFlatButton = DOFlatButton(type: UIButtonType.custom)
        
        button1.frame = CGRect(x: 60, y: 164 - 20 - 40, width: 200, height: 60)
    
        
        button1.faceColor = UIColor(red: 86.0/255.0, green: 161.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        button1.sideColor = UIColor(red: 79.0/255.0, green: 127.0/255.0, blue: 179.0/255.0, alpha: 1.0)
        button1.radius = 8.0
        button1.margin = 4.0
        button1.depth  = 3.0
        
        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        
        button1.setTitleColor(UIColor.white, for: UIControlState.normal)
        button1.setTitle("DOFlatButton", for: UIControlState.normal)
        
        self.view.addSubview(button1)
        
        let button2 = DOFlatButton(type: UIButtonType.custom)
        button2.frame = CGRect(x: 60, y: 224, width: 200, height: 60)
        button2.faceColor = UIColor(red: 243.0/255.0, green: 152.0/255.0, blue: 0, alpha: 1.0)
        button2.sideColor = UIColor(red: 170.0/255.0, green: 105.0/255.0, blue: 0, alpha: 1.0)
        button2.radius = 6.0
        button2.margin = 7.0
        button2.depth  = 6.0
        
        button2.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button2.setTitleColor(UIColor.white, for: UIControlState.normal)
        

        button2.setTitle("DOFlatButton", for: UIControlState.normal)
        
        self.view.addSubview(button2)
        
        
        let button3:DOFlatButton = DOFlatButton(type: UIButtonType.custom)
        button3.frame = CGRect(x :60,y:284 + 20,width:200,height:60)
    
        button3.faceColor = UIColor(red: 86.0/255.0, green: 161.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        button3.sideColor = UIColor(red: 86.0/255.0, green: 161.0/255.0, blue: 217.0/255.0, alpha: 1.0)
        button3.borderColor = UIColor(red: 79.0/255.0, green: 127.0/255.0, blue: 179.0/255.0, alpha: 1.0)
        button3.radius = 8.0
        button3.margin = 4.0
        button3.depth = 4.0
        button3.borderWidth = 2.0
        
        button3.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button3.setTitleColor(UIColor.white, for: UIControlState.normal)
        button3.setTitle("DOFlatButton", for: UIControlState.normal)
        
        
        
        self.view.addSubview(button3)
        
        let button4:DOFlatButton = DOFlatButton(type: UIButtonType.custom)
        button4.frame = CGRect(x:60,y:344 + 20 + 40,width:200,height:60)
        button4.faceColor = UIColor(white: 0.75, alpha: 1.0)
        button4.sideColor = UIColor(white: 0.55, alpha: 1.0)
        button4.radius = 8.0
        button4.margin = 4.0
        button4.depth  = 3.0
        
        button4.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button4.setTitleColor(UIColor.white, for: UIControlState.normal)
        button4.setTitle("DOFlatButton", for: UIControlState.normal)
        
        button4.isEnabled = false;
        
        self.view.addSubview(button4)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

