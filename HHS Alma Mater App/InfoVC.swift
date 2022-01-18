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
        
        infoTextView.textColor = UIColor.systemYellow
        infoTextView.backgroundColor = UIColor.clear
    }
    
    
    
    @IBAction func infoTextSizeSliderSlid(_ sender: UISlider)
    {
        selectedInfoTextSize = Float(sender.value)
        
        infoTextView.font = infoTextView.font?.withSize(CGFloat(selectedInfoTextSize))
    }
    
}
