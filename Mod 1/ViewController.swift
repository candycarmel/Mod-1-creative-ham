//
//  ViewController.swift
//  Mod 1
//
//  Created by MATTHEW FITCH on 8/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    var hamburger = [UIImageView]();
    let ingredientList = ["bun", "patty", "lettuce"]
    
    var screenWidth = UIScreen.main.bounds.width;
    var screenHeight = UIScreen.main.bounds.height;
    
    let HAMBURGER_MAX = 6;
    
    
    
    @IBOutlet weak var hihi: UIImageView!
    
    @IBOutlet weak var ingredientOutlet: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }


    @IBAction func itemAction(_ sender: Any) {
        
        if (HAMBURGER_MAX == hamburger.count)
        {
            return
        }
        
        let output: String = ingredientOutlet.text!
        
        for i in 0...ingredientList.count {
            if (ingredientList[0] != output)
            {
                return
            }
        }
        
        if (output)
        
        
        
        var imageView : UIImageView
        imageView  = UIImageView(frame:CGRect(x:screenWidth / 2 - 75, y:screenHeight / 2 + CGFloat(hamburger.count * -75), width:150, height:50));
            imageView.image = UIImage(named:output)
            self.view.addSubview(imageView)
            imageView.translatesAutoresizingMaskIntoConstraints = false
        hamburger.append(imageView)
    }
}

