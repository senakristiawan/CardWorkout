//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Sena Kristiawan on 13/08/24.
//

import UIKit

class CardSelectionVC: UIViewController {

    //Udah pake UICollection, jadi jangan lupa hapus referencing outletsnya
//    @IBOutlet var stopButton: UIButton!
//    @IBOutlet var restartButton: UIButton!
//    @IBOutlet var RulesButton: UIButton!
    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
//    var cards: [UIImage] = []
    var cards: [UIImage] = Card.allValues
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startTimer()
        //Sebelum menggunakan OutletCollection
//        stopButton.layer.cornerRadius       = 8
//        restartButton.layer.cornerRadius    = 8
//        RulesButton.layer.cornerRadius      = 8
        
        //Setelah
        for button in buttons{
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage(){
//        print("Timer fired odd")
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
        
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        //Buat ngetes
//        stopButton.setTitle("I've been tapped", for: .normal)
        
        timer.invalidate()
        
    }
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    //Ga butuh karena udah dipake dari storyboard
//    @IBAction func rulesButtonTapped(_ sender: UIButton) {
//    }
}
