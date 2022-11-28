//
//  IntroView.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/28/22.
//

import SwiftUI
import AVKit

struct IntroView: View {
    let introPlayer: AVPlayer
    let startPressed: () -> Void
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 320)
            
            Spacer()
            
            VideoPlayer(player: introPlayer)
                .frame(width: 280, height: 280)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .onAppear {
                    introPlayer.play()
                }
            
            Text("Help your Pup Commander")
                .foregroundColor(.yellow)
                .font(.custom("Marker Felt", size: 22))
                .bold()
                .frame(width: 280)
                .padding([.top, .bottom], 10)
            
            Text("These cute cats are taking over!\n\nPop as many cats as you can in 10 seconds!\n\nIf you run out of cats, tap the \"Cat Nip\" button to get more cats!")
                .foregroundColor(.white)
                .font(.custom("Marker Felt", size: 16))
                .frame(width: 280)
            
            Spacer()
            
            Button {
                startPressed()
            } label: {
                Text("Start")
                    .font(.custom("Marker Felt", size: 30))
                    .foregroundColor(.white)
            }
            .padding()
            .frame(width: 200, height: 60)
            .background(Color.pink)
            .clipShape(Capsule())
            
            Spacer()
        }
        .padding()
    }
}

struct IntroView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            IntroView(introPlayer: AVPlayer(url:  Bundle.main.url(forResource: "intro", withExtension: "mov")!), startPressed: {
                /// Start Pressed
            })
        }
    }
}
