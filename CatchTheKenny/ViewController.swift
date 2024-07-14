//
//  ViewController.swift
//  CatchTheKenny
//
//  Created by Selim on 13.07.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var KennyArray = [UIImageView]() //ArrayList oluşturduk
    var timer = Timer()
    var KennyTimer = Timer()
    var counter = 0
    var score = 0
    var highScore = 0
    let defaults = UserDefaults.standard

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
      let storedScore =  defaults.object(forKey: "score") as? Int
        
        if highScore == nil {
            highScore = 0
            HighScoreLabel.text = "High Score : \(highScore)"
        }
        
        if let score = storedScore {
            highScore = score
            HighScoreLabel.text = "High Score : \(highScore)"
        }
        
        KennyArray = [Image1,Image2,Image3,Image4,Image5,Image6,Image7,Image8,Image9]
        counter = 30
        
        Image1.isUserInteractionEnabled = true
        Image2.isUserInteractionEnabled = true
        Image3.isUserInteractionEnabled = true
        Image4.isUserInteractionEnabled = true
        Image5.isUserInteractionEnabled = true
        Image6.isUserInteractionEnabled = true
        Image7.isUserInteractionEnabled = true
        Image8.isUserInteractionEnabled = true
        Image9.isUserInteractionEnabled = true
        
        
        var kenny1 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny2 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny3 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny4 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny5 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny6 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny7 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny8 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        var kenny9 = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        
        Image1.addGestureRecognizer(kenny1)
        Image2.addGestureRecognizer(kenny2)
        Image3.addGestureRecognizer(kenny3)
        Image4.addGestureRecognizer(kenny4)
        Image5.addGestureRecognizer(kenny5)
        Image6.addGestureRecognizer(kenny6)
        Image7.addGestureRecognizer(kenny7)
        Image8.addGestureRecognizer(kenny8)
        Image9.addGestureRecognizer(kenny9)
        
        TimeLabel.text = "\(counter)"
        
   
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(TimerFunc), userInfo: nil, repeats: true)
        
        KennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(hideKenny), userInfo: nil, repeats: true)
        
        
    }
    
    
    
    @objc func tapAction() {
        score += 1
        ScoreLabel.text = "\(score)"
    }
    
    
    @objc func TimerFunc(){
        let myInt = defaults.integer(forKey: "score")
        TimeLabel.text = "\(counter)"
        counter -= 1
        hideKenny()
        
        if counter == 0 {
            let message = MessageBuilder(title: "Congratulations",message: "Time is over. Your score is \(score)")
            
            TimeLabel.text = "0"
            timer.invalidate() // Stopping the timer and process
            KennyTimer.invalidate() // Stopping the Kenny and process
            
            
           
        }
    }
    
    @objc func MessageBuilder(title : String, message : String)
    {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        
        let replay = UIAlertAction(title: "Replay", style: .default) { UIAlertAction in
            self.score = 0
            self.ScoreLabel.text = "\(self.score)"
            self.counter = 30
            self.TimeLabel.text = "\(self.counter)"
            
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.TimerFunc), userInfo: nil, repeats: true)
            
            self.KennyTimer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(self.hideKenny), userInfo: nil, repeats: true)
            
        }
        
        alert.addAction(action)
        alert.addAction(replay)
        
        self.present(alert, animated: true, completion: nil)
        
    
        
    }
    
    
   @objc func hideKenny() {
        
        for kenny in KennyArray {
            kenny.isHidden = true
        }
        
        var number  =  arc4random_uniform(UInt32(KennyArray.count - 1))
        KennyArray[Int(number)].isHidden = false
        
    }
   
    
    
    
    @IBOutlet weak var HighScoreLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet weak var TimeLabel: UILabel!
    @IBOutlet weak var Image1: UIImageView!
    
    @IBOutlet weak var Image2: UIImageView!
    
    @IBOutlet weak var Image3: UIImageView!

   
    @IBOutlet weak var Image4: UIImageView!
    @IBOutlet weak var Image5: UIImageView!
    @IBOutlet weak var Image6: UIImageView!
    @IBOutlet weak var Image7: UIImageView!
    @IBOutlet weak var Image8: UIImageView!
    @IBOutlet weak var Image9: UIImageView!
    
    
    
}


