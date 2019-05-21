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
    var btn = 1
    var emitter = SKEmitterNode()
    var sceneView = SKView()
    var scene = SKScene()
    var counter = 0
    
    @IBOutlet weak var btnPlayOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    
    //BUAT KASIH HUJAN
    func rainDrops() {
        sceneView = SKView(frame: view.frame)
        sceneView.backgroundColor = .clear
        sceneView.allowsTransparency = true
        self.view.addSubview(sceneView)
        
        scene = SKScene(size: view.bounds.size)
        scene.backgroundColor = .clear
        
        emitter = SKEmitterNode(fileNamed: "Rain Drops")!
        emitter.position = sceneView.center
        scene.addChild(emitter)
        sceneView.presentScene(scene)
        view.bringSubviewToFront(btnPlayOutlet)
    }
    
    //BUTTON PLAY
    @IBAction func btnPlay(_ sender: Any) {
        counter += 1
        if counter % 2 == 0 {
            btnPlayOutlet.setImage(UIImage(named: "Play Button"), for: .normal)
            scene.removeAllChildren()
        } else {
            btnPlayOutlet.setImage(UIImage(named: "Pause Button Copy"), for: .normal)
            rainDrops()
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
