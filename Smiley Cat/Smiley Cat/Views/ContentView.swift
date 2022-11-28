//
//  ContentView.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/27/22.
//

import SwiftUI
import AVKit

struct ContentView: View {    
    @State var score = 0
    @State var timeRemaining = 10
    @State var hiddenCats = Set<String>()
    
    let introPlayer = AVPlayer(url:  Bundle.main.url(forResource: "intro", withExtension: "mov")!)
    let scorePlayer = AVPlayer(url:  Bundle.main.url(forResource: "score", withExtension: "mov")!)
    
    @State var gameState = GameState.intro
    
    enum GameState {
        case intro
        case running
        case score
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            if gameState == .intro {
                IntroView(introPlayer: introPlayer) {
                    introPlayer.pause()
                    scorePlayer.pause()
                    timeRemaining = 10
                    gameState = .running
                }
            }
            
            if gameState == .running {
                RunningStateView(hiddenCats: $hiddenCats, score: $score, timeRemaining: $timeRemaining) {
                    gameState = .score
                }
            }

            if gameState == .score {
                ScoreView(score: $score, scorePlayer: scorePlayer) {
                    timeRemaining = 10
                    gameState = .running
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
