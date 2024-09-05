//
//  ViewController.swift
//  Mod 1
//
//  Created by MATTHEW FITCH on 8/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    var hamburger = [UIImageView]();
    var condiments = [UIImageView]();
    let ingredientList = ["bun", "patty", "lettuce", "brick", "bacon", "bigmac", "onion", "spaghetti", "banana", "pickle"]
    let condimentList = ["ketchup", "mustard", "bbqsauce", "mayo", "soysauce", "chocolatesyrup"]
    
    var fullBurger = [String]()
    
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    let HAMBURGER_MAX = 9
    
    var firstBun = true
    
    
    
    @IBOutlet weak var hihi: UIImageView!
    
    @IBOutlet weak var scoreTextOutlet: UILabel!
    
    @IBOutlet weak var ingredientOutlet: UITextField!
    
    @IBOutlet weak var condimentOutlet: UITextField!
    
    @IBOutlet weak var hintLabelOutlet: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func itemAction(_ sender: Any) {
        
        if (HAMBURGER_MAX == hamburger.count)
        {
            createAlert(alertName: "error")
            return
        }
        
        var output: String = ingredientOutlet.text!
        
        var isGood = false
        for i in 0...ingredientList.count-1 {            if (ingredientList[i] == output)
            {
                isGood = true
            }
        }
        
        if (!isGood)
        {
            
            createAlert(alertName: "error")
            return
        }
        
        
        
        if (output == "bun")
        {
            if (!firstBun)
            {
                output = "top-bun"
            } else {
                output = "bottom-bun"
            }
            firstBun = !firstBun
        }
        
        
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x:screenWidth / 2 - 75, y:screenHeight / 2 + CGFloat(hamburger.count * -50), width:150, height:50));
            imageView.image = UIImage(named:output)
            self.view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
        hamburger.append(imageView)
        fullBurger.append(output)
    }
    @IBAction func condimentAction(_ sender: Any) {
        if (0 == hamburger.count)
        {
            createAlert(alertName: "error")
            return
        }
        
        var output: String = condimentOutlet.text!
        
        var isGood = false
        for i in 0...condimentList.count-1 {            if (condimentList[i] == output)
            {
                isGood = true
            }
        }
        
        if (!isGood)
        {
            
            createAlert(alertName: "error")
            return
        }
        
        
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x:screenWidth / 2 - 75, y:screenHeight / 2 + CGFloat((hamburger.count - 1) * -50), width:150, height:50));
            imageView.image = UIImage(named:output)
            self.view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
        condiments.append(imageView)
        fullBurger.append(output)
    }
    @IBAction func burgerScoreAction(_ sender: Any) {
        var score = 0;
        
        if (fullBurger.count == 0)
        {
            scoreTextOutlet.text = "Your score: none"
            return
        }
        
        for i in 0...fullBurger.count-1 {
            switch(fullBurger[i])
            {
            case "bun": score += 2; break;
                
            case "pickle": score += 3; break;
            
            case "patty": score += 4; break;
            
            case "lettuce": score += 1; break;
            
            case "brick": score -= 10; break;
                
            case "ketchup": score += 2; break;
                
            case "bigmac": score += 1; break;
                
            case "mustard": score += 3; break;
                
            case "bbqsauce": score += 4; break;
                
            case "mayo": score += 1; break;
                
            case "onion": score += 2; break;
                
            case "soysauce": score -= 100; break;
                
            case "chocolatesyrup": score += 2; break;
                
            case "bacon": score += 10; break;
                
            case "spaghetti": score += 1; break;
                
            case "banana": score += 100; break;
                
            default: break;
            }
            
            scoreTextOutlet.text = "Your score: \(score) " + ((score > 0) ? ":D" : "D:")
        }
        
    }
    
    
    @IBAction func resetAction(_ sender: Any) {
        if (hamburger.count == 0)
        {
            return
        }
        for i in 0...hamburger.count-1 {
            hamburger[i].image = nil
        }
        
        for i in 0...condiments.count-1 {
            condiments[i].image = nil
        }
        
        hamburger.removeAll()
        condiments.removeAll()
        fullBurger.removeAll()
        
    }
    @IBAction func hintButtonAction(_ sender: Any) {
        let randomBool = Bool.random()
        
        hintLabelOutlet.text = randomBool ? "ingredient: \(ingredientList[Int.random(in: 0..<ingredientList.count)])" : "condiment: \(condimentList[Int.random(in: 0..<condimentList.count)])"
    }
    
    func createAlert(alertName: String) async
    {
        let imageView = UIImageView(frame:CGRect(x:screenWidth / 2, y:screenHeight / 2, width:250, height:150));
            imageView.image = UIImage(named:alertName)
            self.view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
        
        sleep(4)
        imageView.image = nil
    }
}

