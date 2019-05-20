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
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        
    }
    //BUTTON PLAY
    @IBAction func btnPlay(_ sender: Any) {
    //BUAT KASIH HUJAN
    func rainDrops() {
        let sceneView = SKView(frame: view.frame)
        sceneView.backgroundColor = .clear
        sceneView.allowsTransparency = true
        self.view.addSubview(sceneView)
        
        let scene = SKScene(size: view.bounds.size)
        scene.backgroundColor = .clear
        
        let emitter = SKEmitterNode(fileNamed: "Rain Drops")
        emitter?.position = sceneView.center
        scene.addChild(emitter!)
        sceneView.presentScene(scene)
        
     }
        //MANGGIL HUJAN
        rainDrops()
    
        do {
        audioPlayer = try AVAudioPlayer(contentsOf: rainSound)
        audioPlayer.play()
        } catch{
            
        }

    
    }
}
