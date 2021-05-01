//
//  ViewController.swift
//  SlideshowApp
//
//  Created by Anna T on 2021/05/01.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageview: UIImageView!
    
    @IBOutlet weak var play: UIButton!
    
    @IBOutlet weak var previous: UIButton!
    
    @IBOutlet weak var nextbutton: UIButton!
    
    var timer: Timer!
    
    // 画像ファイル名の配列
        var imageNames = [
            "JO",
            "JY",
            "stufftrain"
        ]
    var showIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        showImage()
        // Do any additional setup after loading the view.
    }

    // showIndexの画像を表示
        func showImage() {
            imageview.image = UIImage(named: imageNames[showIndex])
        }
    @objc func updateTimer(_ timer: Timer) {
        // showIndexをカウントアップ
               showIndex += 1
               // 最終番号を超えたら0に戻す
               if showIndex >= imageNames.count {
                   showIndex = 0
               }
               // 画像表示
               showImage()
    }
    @IBAction func playtap(_ sender: Any) {
        // 動作中のタイマーを1つに保つために、 timer が存在しない場合だけ、タイマーを生成して動作させる
                if self.timer == nil {
                    self.timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
                }
    }
    
    @IBAction func previoustap(_ sender: Any) {
        // showIndexをカウントダウン
                showIndex -= 1
                // 最初より前に戻ったら最終番号にする
                if showIndex < 0 {
                    showIndex = imageNames.count - 1
                }
                // 画像表示
                showImage()
    }
    
    
    @IBAction func nexttap(_ sender: Any) {
        
        // showIndexをカウントアップ
        showIndex += 1
        // 最終番号を超えたら0に戻す
        if showIndex >= imageNames.count {
            showIndex = 0
        }
        // 画像表示
        showImage()
    
    }
    
    
}

