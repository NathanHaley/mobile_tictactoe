//
//  ViewController.swift
//  tictactoe
//
//  Created by user4355 on 10/31/15.
//  Copyright © 2015 blah. All rights reserved.
//


// TODO: Need to do something about disabling remaining fields when there is an early winner

// TODO: Put finishing touches on display by adding constraints



import UIKit

class ViewController: UIViewController {
    
    var showX = true
    
    var board = [[Int]]()
    
    var rounds = 0
    
    var haveWinner = false
    
    var buttonArray = [UIButton]()
    
    @IBOutlet weak var gameOverText: UILabel!
    
    @IBAction func newGameAction(sender: AnyObject) {
        
        newGameHandler()
        
    }
    
    @IBAction func button1(sender: AnyObject) {
        
        gameHandler(sender, row: 0, col: 0)
        
    }
    
    @IBAction func button2(sender: AnyObject) {
        
        gameHandler(sender, row: 0, col: 1)
    }
    
    @IBAction func button3(sender: AnyObject) {
        
        gameHandler(sender, row: 0, col: 2)
    }
    
    @IBAction func button4(sender: AnyObject) {
        
        gameHandler(sender, row: 1, col: 0)
    }
    
    @IBAction func button5(sender: AnyObject) {
        
        gameHandler(sender, row: 1, col: 1)
    }
    
    @IBAction func button6(sender: AnyObject) {
        
        gameHandler(sender, row: 1, col: 2)
    }
    
    @IBAction func button7(sender: AnyObject) {
        
        gameHandler(sender, row: 2, col: 0)
    }
    
    @IBAction func button8(sender: AnyObject) {
        
        gameHandler(sender, row: 2, col: 1)
    }
    
    @IBAction func button9(sender: AnyObject) {
        
        gameHandler(sender, row: 2, col: 2)
    }
    
    func newGameHandler() {
        // Reset for new game
        rounds = 0
        newBoard()
        haveWinner = false
        showX = true
        
        // hide message
        gameOverText.text = ""
        gameOverText.hidden = true
        
        // Remove all images and reenable
        for button in buttonArray {
            
            button.setImage(UIImage(), forState: .Normal)
            button.userInteractionEnabled = true
        }

    }
    
    func buttonHandler(sender: AnyObject) {
    
        let button = sender as! UIButton
        
        buttonArray.append(button)
        
        var image = UIImage()
        
        
        if showX {
            
            image = UIImage(named: "cross.png")!
            
        } else {
            
            image = UIImage(named: "nought.png")!
 
        }
        
        button.setImage(image, forState: .Normal)
        button.userInteractionEnabled = false
        
    }
    
    func boardHandler(row: Int, col: Int) {
        let x = 1
        let o = 4
        var playerValue = Int()
        
        if showX {
            
            playerValue = x
            
        } else {
            
            playerValue = o
            
        }
        
         board[row][col] = playerValue
        
    }
    
    func newBoard() {
    
        board = [[0,0,0],[0,0,0],[0,0,0]]
    
    }
    
    func scoreHandler(){
        
        var winPaths = [Int]()
        
        
        winPaths.append(board[0][0] + board[0][1] + board[0][2])
        winPaths.append(board[1][0] + board[1][1] + board[1][2])
        winPaths.append(board[2][0] + board[2][1] + board[2][2])
        winPaths.append(board[0][0] + board[1][0] + board[2][0])
        winPaths.append(board[0][1] + board[1][1] + board[2][1])
        winPaths.append(board[0][2] + board[1][2] + board[2][2])
        winPaths.append(board[0][0] + board[1][1] + board[2][2])
        winPaths.append(board[2][0] + board[1][1] + board[0][2])

        for x in winPaths {
            
            if x - 3 == 0 {
                
                gameOverText.text = "Crosses win! Play again."
                
                haveWinner = true
                
                break
            }
            
            if x - 12 == 0 {
                
                gameOverText.text = "Naughts win! Play again."
                
                haveWinner = true
                
                break
            }
            
        }
    }
    
    func gameHandler(sender: AnyObject, row: Int, col: Int){
        
        if rounds < 9 && haveWinner{
            
            newGameHandler()
            
        } else {
        
            buttonHandler(sender)
            boardHandler(row, col: col)
            scoreHandler()
            
            rounds++
            
            if showX {
                showX = false
            } else {
                showX = true
            }
            
            if((self.haveWinner) || (!self.haveWinner && self.rounds == 9)) {
                UIView.animateWithDuration(0.25, animations: { () -> Void in
                    
                    if self.rounds == 9 && !self.haveWinner {
                        self.gameOverText.text = "It's a draw!! Play again."
                    }
                    
                    // fade in
                    self.gameOverText.hidden = false
                    
                    
                })
            }
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        newBoard()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        //print("Hiding")
        // hide
        //gameOverText.hidden = true
        //gameOverText.text = ""
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        // nothing yet
        
    }


}

