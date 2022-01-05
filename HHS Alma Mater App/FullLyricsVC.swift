//
//  FullLyricsVC.swift
//  HHS Alma Mater App
//
//  Created by Malena on 12/14/21.
//  Copyright © 2021 MDB. All rights reserved.
//

import UIKit

class FullLyricsVC: UIViewController
{
    @IBOutlet weak var fullLyricsTextView: UITextView!
    
    @IBOutlet weak var textSizeSlider: UISlider!

    var selectedTextSize = Float()

    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        fullLyricsTextView.textColor = UIColor.systemYellow
    }
    
    
    @IBAction func textSizeSliderSlid(_ sender: UISlider)
    {
        selectedTextSize = Float(sender.value)
        
        fullLyricsTextView.font = fullLyricsTextView.font?.withSize(CGFloat(selectedTextSize))
    }
    
    
}
