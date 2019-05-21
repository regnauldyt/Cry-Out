//
//  ViewController.swift
//  Cry Out
//
//  Created by Regnauldy Tanri on 20/05/19.
//  Copyright © 2019 Regnauldy Tanri. All rights reserved.
//

import UIKit
import SpriteKit
import AVFoundation
import GameKit

class ViewController: UIViewController {
    let emRain = SKSpriteNode(fileNamed: "emitter")
    var audioPlayer = AVAudioPlayer()
    let rainSound = URL(fileURLWithPath: Bundle.main.path(forResource: "Light_Rain", ofType: "mp3")!)
    var play = false
    var btn = false
    var emitter = SKEmitterNode()
    
    
    @IBOutlet weak var btnPlayOutlet: UIButton!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    //BUAT KASIH HUJAN
    func rainDrops() {
        let sceneView = SKView(frame: view.frame)
        sceneView.backgroundColor = .clear
        sceneView.allowsTransparency = true
        self.view.addSubview(sceneView)
        
        let scene = SKScene(size: view.bounds.size)
        scene.backgroundColor = .clear
        
        emitter = SKEmitterNode(fileNamed: "Rain Drops")!
        emitter.position = sceneView.center
        scene.addChild(emitter)
        sceneView.presentScene(scene)
        view.bringSubviewToFront(btnPlayOutlet)
        
    }
    
    //BUTTON PLAY
    @IBAction func btnPlay(_ sender: Any) {
    
        rainDrops()
        if btn == false {
            btnPlayOutlet.setImage(UIImage(named: "Pause Button Copy"), for: .normal)
            btn = true
            
        } else {
            btnPlayOutlet.setImage(UIImage(named: "Play Button"), for: .normal)
            btn = false
            emitter.removeFromParent()
        }
        
        playSound()

    }
    
        //SOUND
    func playSound() {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: rainSound)
            if play == false {
                audioPlayer.play()
                play = true
            } else {
                audioPlayer.stop()
                play = false
            }
        } catch {
    
        }
    }
    
    
}
