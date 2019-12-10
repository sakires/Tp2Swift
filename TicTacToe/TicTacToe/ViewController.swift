//
//  ViewController.swift
//  TicTacToe
//
//  Created by local192 on 09/12/2019.
//  Copyright © 2019 local192. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var bu1: UIButton!
    @IBOutlet weak var bu2: UIButton!
    @IBOutlet weak var bu3: UIButton!
    @IBOutlet weak var bu4: UIButton!
    @IBOutlet weak var bu5: UIButton!
    @IBOutlet weak var bu6: UIButton!
    @IBOutlet weak var bu7: UIButton!
    @IBOutlet weak var bu8: UIButton!
    @IBOutlet weak var bu9: UIButton!
    
    @IBOutlet weak var autoPlaySwitch: UISwitch!
    
    @IBOutlet weak var labelJoueur: UILabel!
    
    
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
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buSelect:UIButton){
        if activePlayer == 1 {
            buSelect.setTitle("X", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 102/255, green: 41/255, blue: 152/255, alpha: 0.5)
            player1.append(buSelect.tag)
            print(player1)
            buSelect.isEnabled = false
            activePlayer = 2
            let winner = findWinner()
            if winner != -1 {
                viewWinner(winner:winner)
            }else if autoPlaySwitch.isOn{
                autoPlay()
            }
            
        }else{
            buSelect.setTitle("O", for: UIControl.State.normal)
            buSelect.backgroundColor = UIColor(red: 200/255, green: 0/255, blue: 41/255,alpha: 0.5)
            player2.append(buSelect.tag)
            buSelect.isEnabled = false
            print(player2)
            activePlayer = 1
            let winner = findWinner()
            viewWinner(winner:winner)
        }
        labelJoueur.text = "tour de joueur \(activePlayer)"
    }

    func viewWinner(winner: Int){
        if (winner == 1 || winner == 2){
            let msg = "vainqueur joueur \(winner)"
            //print(msg)
            let alert = UIAlertController(title: "TicTacToe", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            reset()
        }
    }
    func findWinner() -> Int {
        var winner = -1
        //Row
        if ( ( player1.contains(1) &&
                player1.contains(2) &&
                player1.contains(3)
        )
            ||
            (   player1.contains(4) &&
                player1.contains(5) &&
                player1.contains(6)
            )
            ||
            (   player1.contains(7) &&
                player1.contains(8) &&
                player1.contains(9)
            )
            ){
            winner = 1
        }
        //Column
        if ( ( player1.contains(1) &&
            player1.contains(4) &&
            player1.contains(7)
            )
            ||
            (   player1.contains(2) &&
                player1.contains(5) &&
                player1.contains(8)
            )
            ||
            (   player1.contains(3) &&
                player1.contains(6) &&
                player1.contains(9)
            )
            ){
            winner = 1
        }
        // Diagonale
        if ( ( player1.contains(1) &&
            player1.contains(5) &&
            player1.contains(9)
            )
            ||
            (   player1.contains(3) &&
                player1.contains(5) &&
                player1.contains(7)
            )
            ){
            winner = 1
        }
        //Row
        if ( ( player2.contains(1) &&
            player2.contains(2) &&
            player2.contains(3)
            )
            ||
            (   player2.contains(4) &&
                player2.contains(5) &&
                player2.contains(6)
            )
            ||
            (   player2.contains(7) &&
                player2.contains(8) &&
                player2.contains(9)
            )
            ){
            winner = 2
        }
        //Column
        if ( ( player2.contains(1) &&
            player2.contains(4) &&
            player2.contains(7)
            )
            ||
            (   player2.contains(2) &&
                player2.contains(5) &&
                player2.contains(8)
            )
            ||
            (   player2.contains(3) &&
                player2.contains(6) &&
                player2.contains(9)
            )
            ){
            winner = 2
        }
        // Diagonale
        if ( ( player2.contains(1) &&
            player2.contains(5) &&
            player2.contains(9)
            )
            ||
            (   player2.contains(3) &&
                player2.contains(5) &&
                player2.contains(7)
            )
            ){
            winner = 2
        }
        return winner
    }

    func autoPlay(){
        var emptyCells = [Int]()
        for index in 1...9 {
            if ( !(player1.contains(index) || player2.contains(index))){
                emptyCells.append(index)
            }
        }
        if emptyCells.count > 0 {
            let randIndex = arc4random_uniform(UInt32(emptyCells.count))
            print("rand = \(randIndex) ")
            print(  "tableau vide \(emptyCells)")
            let cellId = emptyCells[Int(randIndex)]
            
            var buSelect : UIButton
            switch cellId {
            case 1:
                buSelect = bu1
            case 2:
                buSelect = bu2
            case 3:
                buSelect = bu3
            case 4:
                buSelect = bu4
            case 5:
                buSelect = bu5
            case 6:
                buSelect = bu6
            case 7:
                buSelect = bu7
            case 8:
                buSelect = bu8
            case 9:
                buSelect = bu9
            default:
                buSelect = bu1
            }
            playGame(buSelect: buSelect)
        }else {
            let msg = "Pas de vainqueur"
            //print(msg)
            let alert = UIAlertController(title: "TicTacToe", message: msg, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            reset()
        }

    }
    
    func reset(){
        activePlayer = 1
        player1.removeAll()
        player2.removeAll()
        bu1.setTitle("", for: UIControl.State.normal)
        bu1.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu1.isEnabled = true
        
        bu2.setTitle("", for: UIControl.State.normal)
        bu2.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu2.isEnabled = true
        
        bu3.setTitle("", for: UIControl.State.normal)
        bu3.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu3.isEnabled = true
        
        bu4.setTitle("", for: UIControl.State.normal)
        bu4.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu4.isEnabled = true
        
        bu5.setTitle("", for: UIControl.State.normal)
        bu5.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu5.isEnabled = true
        
        bu6.setTitle("", for: UIControl.State.normal)
        bu6.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu6.isEnabled = true
        
        bu7.setTitle("", for: UIControl.State.normal)
        bu7.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu7.isEnabled = true
        
        bu8.setTitle("", for: UIControl.State.normal)
        bu8.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu8.isEnabled = true
        
        bu9.setTitle("", for: UIControl.State.normal)
        bu9.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255,alpha: 1)
        bu9.isEnabled = true
        
        
    }
}

