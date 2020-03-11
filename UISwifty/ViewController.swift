//
//  ViewController.swift
//  UISwifty
//
//  Created by Mahmoud on 2/29/20.
//  Copyright © 2020 Mahmoud. All rights reserved.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    //Outlets
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet var pressed: [UIButton]!
    var player = 1
    var state = [0,0,0,0,0,0,0,0,0]
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameActive = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        shake()
        
     resultLabel.isHidden = true
    }

   
    
    @IBAction func pressed(_ sender: AnyObject) {
        
        if state[sender.tag - 1] == 0 {
            //print(sender.tag - 1)
            state[sender.tag - 1] = player
        if player == 1 {
            sender.setImage(UIImage(named: "o"), for: .normal)
            shake()
            player = 2
        }else{
            sender.setImage(UIImage(named: "x"), for: .normal)
            player = 1
        }
           print(state)
            for combination in winningCombinations
            {
               // print(combination[0])
                if state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]]
                    
                {
                    
                    gameActive = false
                    if state[combination[0]] == 1{
                        resultLabel.text = "O has won!"
                        self.view.isUserInteractionEnabled = false
                    }else {
                        resultLabel.text = "X has won!"
                        self.view.isUserInteractionEnabled = false

                    }
                    print(state[combination[0]])
                    resultLabel.isHidden = false
                                     
                }
                if state[0] != 0 && state[1] != 0 && state[2] != 0 && state[3] != 0 && state[4] != 0 && state[5] != 0 && state[6] != 0 && state[7] != 0 && state[8] != 0 {
                            
                    if state[combination[0]] != 0 && state[combination[0]] == state[combination[1]] && state[combination[1]] == state[combination[2]]{
                        return
                    }
                    resultLabel.isHidden = false
                    resultLabel.text = "Draw!👹"
                }
    
            }
}
    }
    @IBAction func restartButtn(_ sender: AnyObject) {
        for i in pressed{
            i.setImage(nil, for: .normal)
        }
        player = 1
        state = [0,0,0,0,0,0,0,0,0]
        gameActive = true
        resultLabel.isHidden = true
        self.view.isUserInteractionEnabled = true
        
        for i in 1...9{
          let button =  view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
        
    }
    
    func shake() {
//        if UIDevice.current.name == "iPhone 11 Pro Max" {
//            for i in pressed {
//
//        }
          //  }
}


}
