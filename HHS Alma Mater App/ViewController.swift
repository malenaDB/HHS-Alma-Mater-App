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
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()

       
        self.view.sendSubviewToBack(backgroundImageView)
        
        backgroundImageView.image = UIImage(named: "background2")
        
        playButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)

        self.view.backgroundColor = #colorLiteral(red: 0.8233039975, green: 0, blue: 0.1372188032, alpha: 1)
        oldLyricsLbl.textColor = UIColor.white
        currentLyricsLbl.textColor = UIColor.yellow
        nextLyricsLbl.textColor = UIColor.white
        
        infoButton.tintColor = UIColor.systemYellow
        lyricButton.tintColor = UIColor.systemYellow
        
    
        oldLyricsLbl.text = ""
        currentLyricsLbl.text = "Press play!"
        currentLyricsLbl.textAlignment = .center
        nextLyricsLbl.text = ""
        
        appendLyricsToArray()
//        lyrics.append("fdsafsfd")
//        lyrics.append("fjdlfjkdlja")
//        lyrics.append("ssssssssss")
//        lyrics.append("mmlmlmlmlmfkdls")
//        lyrics.append("aaaajjaajja")
//        lyrics.append("iiiiiiiiiiii")
//        lyrics.append("beep boop bop")
//        lyrics.append("hello hello hello hello")
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
    }
    
    func appendLyricsToArray()
    {
        lyrics.append("")
        lyrics.append("")
        lyrics.append("For the first time in forever")
        lyrics.append("There'll be music, there'll be light")
        lyrics.append("For the first time in forever")
        lyrics.append("I'll be dancing through the night")
    }
    
    
    func playSong()
    {
        // play song
        let path = Bundle.main.path(forResource: "ForTheFirstTimeInForever.mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        do
        {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        }
        catch
        {
            print("could not load song file :(")
        }
    }
    
    
    
    func resetTimer()
    {
        playTappedCount += 1
        playButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
        
        timer.invalidate()
        timerTotal = 0
        
        lyrics.remove(at: 0)
        oldLyricsLbl.text = lyrics.first
        currentLyricsLbl.text = "THE END"
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
            
        else if timerTotal == 5
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 9
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        else if timerTotal == 14
        {
            print(timerTotal)
            setLabelsWithLyrics()
        }
        
//        else if timerTotal == 14
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 10
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 12
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 14
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 16
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 18
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 20
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 21
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//        else if timerTotal == 22
//        {
//            print(timerTotal)
//            setLabelsWithLyrics()
//        }
//
            
        else if timerTotal > 24
        {
            print("24 seconds")
            resetTimer()
            fullRoundComplete = true
        }
        
    }
    
    
    
    @IBAction func playButtonTapped(_ sender: UIButton)
    {
        currentLyricsLbl.textAlignment = .left
        
        playTappedCount += 1
        print (playTappedCount)
        
        if playTappedCount == 1
        {
            playButton.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
                
            setLabelsWithLyrics()
            playSong()
            
            timerTotal = 0
            timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            
            if fullRoundComplete == true
            {
                appendLyricsToArray()
            }
        }
            
        else if playTappedCount % 2 == 0
        {
            playButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            
            setLabelsWithLyrics()
            
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
             playButton.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
            
            if playTappedCount != 1
            {
//                timer.invalidate()
//                player?.stop()
                
                playSong()
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(counter), userInfo: nil, repeats: true)
            }
        }
        
        
        
        
        
      //  if playButton.currentImage == UIImage(systemName: "pause.fill")
        //        {
        //            playButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
        //        }
        //        else if playButton.currentImage == UIImage(systemName: "play.fill")
        //        {
        //            playButton.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
        //        }
    }
    
    
    
    
    
    func setLabelsWithLyrics()
    {
        
        currentLine = currentLyricsLbl.text ?? ""
        
        if lyrics.count > 0
        {
            lyrics.remove(at: 0)
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
    
}
