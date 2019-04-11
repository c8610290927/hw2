//
//  ViewController.swift
//  hw2
//
//  Created by User20 on 2019/4/10.
//  Copyright © 2019 ouo. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,UITextFieldDelegate{

    var number = Int.random(in:5...25)
    var looper: AVPlayerLooper?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let url = URL(string: "https://r1---sn-un57en7e.googlevideo.com/videoplayback?ratebypass=yes&c=WEB&itag=18&id=o-AH0xtuiRbQ3Vls9ZnC73VELAglb40IszlA_r7n6XoRsW&lmt=1549040515323900&source=youtube&ei=Aw-vXKW7I9qh7gP_3ZmIAw&dur=77.067&gir=yes&ip=2a01%3A4f8%3A191%3A1ac%3A%3A2&expire=1554998115&sig=ALgxI2wwRgIhAI1pHTJ3wcJxF6oo7kmtZOKvSqEwECFCLoyrzu3fH6BaAiEAwE6IaTZ8fLwJEWrLT_qup10k7VtDq2oePrD9llBWlv0%3D&sparams=expire%2Cei%2Cip%2Cmime%2Cid%2Crequiressl%2Citag%2Clmt%2Cipbits%2Cratebypass%2Csource%2Cgir%2Cdur%2Cclen&clen=5518054&txp=2211222&fvip=1&ipbits=0&mime=video%2Fmp4&requiressl=yes&title=[BGM][%E6%81%8B%E4%B8%8E%E5%88%B6%E4%BD%9C%E4%BA%BA]%20Wedding&redirect_counter=1&cm2rm=sn-5njj-u2xl7z&req_id=a590a7c63ed4a3ee&cms_redirect=yes&mip=140.121.196.88&mm=29&mn=sn-un57en7e&ms=rdu&mt=1554976417&mv=m&pl=16&lsparams=mip,mm,mn,ms,mv,pl&lsig=AHylml4wRQIgbvmUtM_MO-Juz4v17S23ESyW1PmLJIDZ7W2LTouVEKQCIQCD66AKNPdulzUUrCuN-E3FaRBvYzN-sHwicdNx2A5UIQ==") {
            let player = AVQueuePlayer()
            let item = AVPlayerItem(url: url)
            looper = AVPlayerLooper(player: player, templateItem: item)
            player.play()
            
            let images = [UIImage(named: "capoo0")!, UIImage(named: "capoo1")!, UIImage(named: "capoo2")!, UIImage(named: "capoo3")!, UIImage(named: "capoo4")!, UIImage(named: "capoo5")!, UIImage(named: "capoo6")!]
            let animatedImage = UIImage.animatedImage(with: images, duration: 0.8)
            gif.image = animatedImage
        }
    }
    
    @IBOutlet weak var changeImage: UIImageView!
    @IBOutlet weak var gif: UIImageView!
    
    @IBOutlet weak var name: UITextField?
    @IBOutlet weak var upTitle: UILabel!
    @IBOutlet weak var GrowingSlider: UISlider!
    @IBOutlet weak var growingRate: UILabel!
    @IBOutlet weak var turnBack: UIButton!
    @IBOutlet weak var sure: UIButton!
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    @IBAction func ChangeBack(_ sender: UIButton) {
        number = Int.random(in:5...25)
        upTitle.text = "～屬於你的帥哥偵測器～"
        changeImage.image = UIImage(named: "小F4")
        growingRate.isHidden = true
        GrowingSlider.isHidden = true
        turnBack.isHidden = true
        sure.isHidden = false
    }
    @IBAction func SureToChange(_ sender: UIButton) {
        print(number)
        if number <= 9{
            upTitle.text = "白起"
            if (GrowingSlider.value*100) <= 30{
                changeImage.image = UIImage(named: "小白起")
            }
            else if (GrowingSlider.value*100) > 30 && (GrowingSlider.value*100) <= 70{
                changeImage.image = UIImage(named: "中白起")
            }
            else{
                changeImage.image = UIImage(named: "大白起")
            }
        }
        else if number > 15 && number <= 21{
            upTitle.text = "     李澤言"
            if (GrowingSlider.value*100) <= 30{
                changeImage.image = UIImage(named: "小總裁")
            }
            else if (GrowingSlider.value*100) > 30 && (GrowingSlider.value*100) <= 70{
                changeImage.image = UIImage(named: "中總裁")
            }
            else{
                changeImage.image = UIImage(named: "大總裁")
            }
        }
        else if number > 20{
            upTitle.text = "     許墨"
            if (GrowingSlider.value*100) <= 30{
                changeImage.image = UIImage(named: "小教授")
            }
            else if (GrowingSlider.value*100) > 30 && (GrowingSlider.value*100) <= 70{
                changeImage.image = UIImage(named: "中教授")
            }
            else{
                changeImage.image = UIImage(named: "大教授")
            }
        }
        else{
            upTitle.text = "     周棋洛"
            if (GrowingSlider.value*100) <= 30{
                changeImage.image = UIImage(named: "小棋洛")
            }
            else if (GrowingSlider.value*100) > 30 && (GrowingSlider.value*100) <= 70{
                changeImage.image = UIImage(named: "中棋洛")
            }
            else{
                changeImage.image = UIImage(named: "大棋洛")
            }
        }
        growingRate.isHidden = false
        GrowingSlider.isHidden = false
        turnBack.isHidden = false
        sure.isHidden = true
    }
    @IBAction func GoodMan(_ sender: UISwitch) {
        if sender.isOn{
            number = number-8
        }
        else{
            number = number+8
        }
    }
    @IBAction func BadMan(_ sender: UISwitch) {
        if sender.isOn{
            number = number+10
        }
        else{
            number = number-9
        }
    }
    @IBAction func GrowingRate(_ sender: UISlider) {
        //print(sender.value)
        growingRate.text = String(Int(sender.value*100))
        if number <= 9{
            if (sender.value*100) <= 30{
                changeImage.image = UIImage(named: "小白起")
            }
            else if (sender.value*100) > 30 && (sender.value*100) <= 70{
                changeImage.image = UIImage(named: "中白起")
            }
            else{
                changeImage.image = UIImage(named: "大白起")
            }
        }
        else if number > 15 && number <= 21{
            if (sender.value*100) <= 30{
                changeImage.image = UIImage(named: "小總裁")
            }
            else if (sender.value*100) > 30 && (sender.value*100) <= 70{
                changeImage.image = UIImage(named: "中總裁")
            }
            else{
                changeImage.image = UIImage(named: "大總裁")
            }
        }
        else if number > 20{
            if (sender.value*100) <= 30{
                changeImage.image = UIImage(named: "小教授")
            }
            else if (sender.value*100) > 30 && (sender.value*100) <= 70{
                changeImage.image = UIImage(named: "中教授")
            }
            else{
                changeImage.image = UIImage(named: "大教授")
            }
        }
        else{
            if (sender.value*100) <= 30{
                changeImage.image = UIImage(named: "小棋洛")
            }
            else if (sender.value*100) > 30 && (sender.value*100) <= 70{
                changeImage.image = UIImage(named: "中棋洛")
            }
            else{
                changeImage.image = UIImage(named: "大棋洛")
            }
        }
    }
}

