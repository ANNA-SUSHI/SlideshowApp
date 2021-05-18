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
                    // ボタンをスライドショー開始状態にする
                          play.setTitle("Stop", for: .normal)
                } else {
                    // スライドショー停止
                    timer.invalidate()
                    timer = nil
                    play.setTitle("Play", for: .normal)
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
    @IBAction  func  unwind (_  segue :  UIStoryboardSegue )  {
    }
    @IBAction func showpicture(_ sender: Any) {
        let resultViewController = self.storyboard?.instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
                self.present(resultViewController, animated: true, completion: nil)
        
        resultViewController.image = imageview.image
                self.present(resultViewController, animated: true, completion: nil)
    }
    
    // 画面遷移時の処理
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            // スライドショーを停止してから画面遷移する
            if timer != nil {
                // スライドショー停止
                timer.invalidate()
                timer = nil
                // ボタンをスライドショー停止状態にする
                play.setTitle("再生", for: .normal)
            }
            // 表示中の画像を引き継ぎ
            let imageViewController = segue.destination as! ResultViewController
            imageViewController.image = imageview.image
        }
    
}

