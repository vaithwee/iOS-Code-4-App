//
//  MediaPlayer-ViewController.swift
//  Learning Base UIKit By Swift
//
//  Created by OrangeLife on 16/5/30.
//  Copyright © 2016年 Shenme Studio. All rights reserved.
//

import UIKit
import MediaPlayer

class MediaPlayer_ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    var audioPlayer:MPMoviePlayerController = MPMoviePlayerController();
    var timer:NSTimer?;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        onSetAudio("http://m8.music.126.net/20160530161752/dadc5078b4b7e21e7d71690e0a7568a5/ymusic/8681/58ac/348e/86f3d361b474273ca656f5937566c0c7.mp3");
        // Do any additional setup after loading the view.
    }
    
    func onSetAudio(urlString:String) {
        self.audioPlayer.stop();
        self.audioPlayer.contentURL = NSURL(string: urlString);
        timer?.invalidate();
        timeLabel.text = "00:00";
        timer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: #selector(MediaPlayer_ViewController.onUpdate), userInfo: nil, repeats: true);
    }
    
    func onUpdate()
    {
        let c = audioPlayer.currentPlaybackRate;
        if c > 0.0
        {
            let t = audioPlayer.duration;
            let p:CFloat = CFloat(c) / CFloat(t);
            progressBar.setProgress(p, animated: true);
            
            let all:Int = Int(c);
            let m:Int = all % 60;
            let f:Int = Int(all / 60);
            var time:String = "";
            if f<10{
                time="0\(f):"
            }else {
                time="\(f)"
            }
            if m<10{
                time+="0\(m)"
            }else {
                time+="\(m)"
            }
            //更新播放时间
            timeLabel.text = time;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
