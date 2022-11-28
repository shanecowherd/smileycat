//
//  ScoreView.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/28/22.
//

import SwiftUI
import AVKit
import ConfettiSwiftUI

struct ScoreView: View {
    @Binding var score: Int
    @State var confettiToggle: Int = 0
    
    let scorePlayer: AVPlayer
    let startPressed: () -> Void
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 320)
            
            Spacer()
            
            VideoPlayer(player: scorePlayer)
                .frame(width: 280, height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onAppear {
                    scorePlayer.play()
                }
            
            Text("You popped \(score) cats!")
                .foregroundColor(.white)
                .font(.custom("Marker Felt", size: 30))
                .padding()
            
            Spacer()
            
            Button {
                score = 0
                startPressed()
                scorePlayer.pause()
                scorePlayer.seek(to: .zero)
            } label: {
                Text("Play Again!")
                    .font(.custom("Marker Felt", size: 30))
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 260, height: 60)
            .background(Color.pink)
            .clipShape(Capsule())
            .padding(.top, 20)
            .confettiCannon(counter: $confettiToggle, repetitions: 2)
            .onAppear {
                scorePlayer.play()
                confettiToggle += 1
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            ScoreView(score: .constant(10), scorePlayer: AVPlayer(url:  Bundle.main.url(forResource: "score", withExtension: "mov")!), startPressed: {
                /// Start Pressed
            })
        }
    }
}
