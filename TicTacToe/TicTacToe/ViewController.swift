//
//  ViewController.swift
//  TicTacToe
//
//  Created by local192 on 09/12/2019.
//  Copyright © 2019 local192. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buSelectEvent(_ sender: Any) {
        let buSelect = sender as! UIButton
        print ( buSelect.tag)
        playGame(buSelect: buSelect)
    }
    
    var activePlayer = 1
    var player1 =  [Int]()
    var player2 = [Int]()
    func playGame(buSelect:UIButton){
        if activePlayer == 1 {
            buSelect.setTitle("X", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 102/255, green: 41/255, blue: 152/255, alpha: 0.5)
            player1.append(buSelect.tag)
            print(player1)
            activePlayer = 2
        }else{
            buSelect.setTitle("O", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 200/255, green: 0/255, blue: 41/255, alpha: 0.5)
            player2.append(buSelect.tag)
            print(player2)
            activePlayer = 1
        }
    }
}

