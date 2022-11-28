//
//  SoundService.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import AVFoundation

 class SoundService {

   static var player: AVAudioPlayer?

   static func playSounds(soundfile: String) {

       if let path = Bundle.main.path(forResource: soundfile, ofType: nil) {
           do {
               player = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
               player?.prepareToPlay()
               player?.play()
           } catch {
               debugPrint("Unable to play audio")
           }
       }
    }
 }
