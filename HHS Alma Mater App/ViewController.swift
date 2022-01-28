//
//  ViewController.swift
//  HHS Alma Mater App
//
//  Created by MDB  on 10/25/21.
//

import UIKit
import AVFoundation


class ViewController: UIViewController, AVSpeechSynthesizerDelegate
{
    
    @IBOutlet weak var infoButton: UIButton!
    
    @IBOutlet weak var lyricButton: UIButton!
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var playButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    @IBOutlet weak var oldLyricsLbl: UILabel!
    
    @IBOutlet weak var currentLyricsLbl: UILabel!
    
    @IBOutlet weak var nextLyricsLbl: UILabel!
    
    
    
    var fullRoundComplete = Bool()
    
    var lyrics = [String]()
    
    var utterance = AVSpeechUtterance()
    
    var currentLine = String()
    
    var timer = Timer()
    var timerTotal = Double()
    
    var player: AVAudioPlayer?
    
    var playTappedCount = Int()
    var resetTappedCount = Int()
    
    var selectedInfoTextSize = Float()
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        
        
        self.view.sendSubviewToBack(backgroundImageView)
        
        //    backgroundImageView.image = UIImage(named: "background2")
        
        playButton.setImage(UIImage(named: "playButtonYellow"), for: UIControl.State.normal)
        hideResetButton()
        
        
        self.view.backgroundColor = #colorLiteral(red: 0.7568627451, green: 0.1529411765, blue: 0.1764705882, alpha: 1)
        oldLyricsLbl.textColor = UIColor.white
        currentLyricsLbl.textColor = UIColor.systemYellow
        nextLyricsLbl.textColor = UIColor.white
        
        infoButton.tintColor = UIColor.systemYellow
        lyricButton.tintColor = UIColor.systemYellow
        
        
        oldLyricsLbl.text = ""
        currentLyricsLbl.text = "Press play!"
        currentLyricsLbl.textAlignment = .center
        nextLyricsLbl.text = ""
        
        appendLyricsToArray()
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    
    func initAudioPlayer()
    {
        let path = Bundle.main.path(forResource: "Alma Mater Audio mp3.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            player?.prepareToPlay()
        }
        catch
        {
            print("could not load song file :(")
        }
    }
    
    
    override func viewWillAppear(_ animated: Bool)
    {
        self .initAudioPlayer()
    }
    
    
    func appendLyricsToArray()
    {
        lyrics.append("")
        lyrics.append("")
        lyrics.append("Haverford High, thy praise we’ll ever sing.")
        lyrics.append("Long shall thy fame in florid accents ring.")
        lyrics.append("Pinioned in splendor, may our banners soar.")
        lyrics.append("Crimson and Gold, triumphant evermore.")
        lyrics.append("Soon, all too soon, our school day joys are gone.")
        lyrics.append("Then, with radiance of the breaking dawn,")
        lyrics.append("Ascends our love in loyalty to thee,")
        lyrics.append("And memory hold us eternally.")
        lyrics.append("Students arise, shout now with wild acclaim;")
        lyrics.append("Join in the song to the Alma Mater’s name.")
        lyrics.append("Let not one foe among her ranks be known.")
        lyrics.append("Fealty and love will ever bring us home.")
    }
    
    
    
    func playSong()
    {
        player?.play()
    }
    
    
    
    func resetTimer()
    {
        playTappedCount += 1
        playButton.setImage(UIImage(named: "playButtonYellow"), for: UIControl.State.normal)
        
        timer.invalidate()
        timerTotal = 0
        
        lyrics.remove(at: 0)
        oldLyricsLbl.text = lyrics.first
        currentLyricsLbl.text = "THE END.  Press the button to replay."
        nextLyricsLbl.text = ""
    }
    
    
    
    @objc func counter()
    {
        timerTotal += 1
        
        // print(timerTotal)
        
        
        if timerTotal < 0
        {
            resetTimer()
        }
            
        else if timerTotal == 8
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 16
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 24
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 32
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 40
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 48
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 56
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 64
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 72
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 83 //
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 88
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
            
        else if timerTotal > 97
        {
            print("24 seconds")
            resetTimer()
            fullRoundComplete = true
            
            playTappedCount = 0
        }
    }
    
    
    
    @IBAction func playButtonTapped(_ sender: UIButton)
    {
        currentLyricsLbl.textAlignment = .left
        print(playTappedCount)
        playTappedCount += 1
        print (playTappedCount)
        
        
        if resetTappedCount >= 1
        {
            if playButton.currentImage == UIImage(named: "pauseButtonYellow")
            {
                player?.pause()
                
                playButton.setImage(UIImage(named: "playButtonYellow"), for: UIControl.State.normal)
                
                timer.invalidate()
                
                if fullRoundComplete == true
                {
                    appendLyricsToArray()
                }
            }
            else if playButton.currentImage == UIImage(named: "playButtonYellow")
            {
                playButton.setImage(UIImage(named: "pauseButtonYellow"), for: UIControl.State.normal)
                
                if playTappedCount != 1
                {
                    playSong()
                    
                    timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
                }
            }
        }
            
        else if playTappedCount == 1
        {
            showResetButton()
            
            playButton.setImage(UIImage(named: "pauseButtonYellow"), for: UIControl.State.normal)
            
            setLabelsWithLyrics()
            playSong()
            
            timerTotal = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            
            appendLyricsToArray()
            
            if fullRoundComplete == true
            {
                appendLyricsToArray()
            }
        }
            
        else if playTappedCount % 2 == 0
        {
            playButton.setImage(UIImage(named: "playButtonYellow"), for: UIControl.State.normal)
            
            //  UIImage(named: "background2")
            
            // setLabelsWithLyrics()
            
            //playSong()
            player?.pause()
            
            //timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            timer.invalidate()
            
            
            if fullRoundComplete == true
            {
                appendLyricsToArray()
            }
        }
        else if playTappedCount % 2 != 0
        {
            playButton.setImage(UIImage(named: "pauseButtonYellow"), for: UIControl.State.normal)
            
            if playTappedCount != 1
            {
                //                timer.invalidate()
                //                player?.stop()
                
                playSong()
                
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
                
            }
        }
    }
    
    
    @IBAction func resetButtonTapped(_ sender: UIButton)
    {
        currentLyricsLbl.textAlignment = .left
        print(resetTappedCount)
        resetTappedCount += 1
        print (resetTappedCount)
        
        playButton.setImage(UIImage(named: "pauseButtonYellow"), for: UIControl.State.normal)
        
        lyrics.removeAll()
        appendLyricsToArray()
        setLabelsWithLyrics()
        
        player?.stop()
        initAudioPlayer()
        player?.play()
        
        timer.invalidate()
        timerTotal = 0
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
        
        
        //        if fullRoundComplete == true
        //        {
        //            appendLyricsToArray()
        //        }
    }
    
    
    
    
    
    
    
    func setLabelsWithLyrics()
    {
        
        currentLine = currentLyricsLbl.text ?? ""
        
        if lyrics.count > 0
        {
            //            if resetTappedCount > 0 //COME BACK AND FIX THIS!!!
            //            {
            //                print("resetTappedCount > 0")
            //            }
            //            else ///this is the normal situation for when you press button and it is NOT a replay
            //            {
            lyrics.remove(at: 0)
            // }
        }
        else
        {
            print("not going to remove bc count == 0")
        }
        
        
        if lyrics.count > 1
        {
            currentLine = String(lyrics[1])
        }
        else
        {
            currentLine = ""
        }
        
        
        if lyrics.count > 2
        {
            //lyrics.remove(at: 0)
            oldLyricsLbl.text = lyrics.first
            currentLyricsLbl.text = lyrics[1]
            nextLyricsLbl.text = lyrics[2]
        }
        else if lyrics.count == 2
        {
            //lyrics.remove(at: 0)
            oldLyricsLbl.text = lyrics.first
            currentLyricsLbl.text = lyrics[1]
            nextLyricsLbl.text = ""
        }
        else if lyrics.count > 0 && lyrics.count <= 2
        {
            //lyrics.remove(at: 0)
            oldLyricsLbl.text = lyrics[0]
            currentLyricsLbl.text = ""
            nextLyricsLbl.text = ""
        }
        else if lyrics.count == 0
        {
            oldLyricsLbl.text = ""
            currentLyricsLbl.text = ""
            nextLyricsLbl.text = ""
        }
    }
    
    
    @IBAction func textSizeSliderSlid(_ sender: UISlider)
    {
        selectedInfoTextSize = Float(sender.value)
        
        oldLyricsLbl.font = oldLyricsLbl.font?.withSize(CGFloat(selectedInfoTextSize))
        currentLyricsLbl.font = currentLyricsLbl.font?.withSize(CGFloat(selectedInfoTextSize))
        nextLyricsLbl.font = nextLyricsLbl.font?.withSize(CGFloat(selectedInfoTextSize))
    }
    
    func hideResetButton()
    {
        resetButton.isHidden = true
    }
    
    func showResetButton()
    {
        resetButton.isHidden = false
    }
}
