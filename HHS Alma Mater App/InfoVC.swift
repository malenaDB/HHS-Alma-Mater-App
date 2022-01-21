//
//  InfoVC.swift
//  HHS Alma Mater App
//
//  Created by Malena on 12/15/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class InfoVC: UIViewController
{
    
    @IBOutlet weak var infoTextView: UITextView!
    
    @IBOutlet weak var infoTextSizeSlider: UISlider!
    
    var selectedInfoTextSize = Float()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.1529411765, blue: 0.1764705882, alpha: 1)
        
        infoTextView.textColor = UIColor.systemYellow
        infoTextView.backgroundColor = UIColor.clear
    }
    
    
    
    @IBAction func infoTextSizeSliderSlid(_ sender: UISlider)
    {
        selectedInfoTextSize = Float(sender.value)
        
        infoTextView.font = infoTextView.font?.withSize(CGFloat(selectedInfoTextSize))
    }
    
}
