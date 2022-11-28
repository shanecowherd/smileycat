//
//  RunningStateView.swift
//  Smiley Cat
//
//  Created by Shane Cowherd on 11/28/22.
//

import SwiftUI
import RealmSwift
import SDWebImageSwiftUI

struct RunningStateView: View {
    @StateObject var catService = CatService()
    @ObservedResults(Cat.self) var cats
    
    /// Keep track of the popped cats.
    @Binding var hiddenCats: Set<String>
    
    @Binding var score: Int
    @Binding var timeRemaining: Int
    let gameEnded: () -> Void
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: 320)
            
            HStack {
                HStack {
                    Spacer()
                    Text("Popped Cats:")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt", size: 18))
                    
                    Text("\(score)")
                        .foregroundColor(.yellow)
                        .bold()
                        .font(.custom("Marker Felt", size: 30))
                    Spacer()
                }
                
                Spacer()
                
                HStack {
                    Spacer()
                    Text("Time:")
                        .foregroundColor(.white)
                        .font(.custom("Marker Felt", size: 18))
                    
                    Text("\(timeRemaining)")
                        .foregroundColor(.red)
                        .bold()
                        .font(.custom("Marker Felt", size: 30))
                        .onReceive(timer) { _ in
                            if timeRemaining > 0 {
                                timeRemaining -= 1
                            } else {
                                gameEnded()
                            }
                        }
                    Spacer()
                }
            }
            .padding()
            
            if catService.all().count == hiddenCats.count {
                Spacer()
                
                Button {
                    hiddenCats.removeAll()
                } label: {
                    Text("🤍 Use Cat Nip!")
                        .font(.custom("Marker Felt", size: 30))
                        .foregroundColor(.white)
                }
                .padding()
                .frame(width: 260, height: 60)
                .background(Color.pink)
                .clipShape(Capsule())
                .padding(.top, 20)
                
                Spacer()
            } else {
                ScrollView(.vertical) {
                    let columns = [
                      GridItem(.adaptive(minimum: 100), alignment: .leading)
                    ]
                    
                    LazyVGrid(columns: columns) {
                        ForEach(cats) { cat in
                            
                            if hiddenCats.contains(cat.sourceId) == false {
                                AnimatedImage(url: URL(string: cat.sourceUrl), isAnimating: .constant(true))
                                    .resizable()
                                    .placeholder {
                                        ZStack {
                                            
                                            /// Allow placeholders to appear different
                                            switch cat.placeholderColorNumber {
                                            case 1:
                                                Color.white
                                            case 2:
                                                Color.black
                                            case 3:
                                                Color.red
                                            case 4:
                                                Color.pink
                                            case 5:
                                                Color.green
                                            case 6:
                                                Color.blue
                                            case 7:
                                                Color.teal
                                            case 8:
                                                Color.orange
                                            case 9:
                                                Color.yellow
                                            case 10:
                                                Color.brown
                                            case 11:
                                                Color.cyan
                                            case 12:
                                                Color.purple
                                            case 13:
                                                Color.gray
                                            case 14:
                                                Color.indigo
                                            default:
                                                Color.black
                                            }
                                            Text("😺")
                                                .font(.system(size: 50))
                                        }
                                    }
                                    .indicator(SDWebImageActivityIndicator.whiteLarge)
                                    .transition(.fade)
                                    .scaledToFill()
                                    .clipShape(Circle())
                                    .overlay(
                                        
                                        /// Rainbow Circle
                                        Circle()
                                            .stroke(LinearGradient(colors: [.red, .orange, .yellow, .green, .blue, .indigo, .purple], startPoint: .top, endPoint: .bottom), lineWidth: 4)
                                            
                                    )
                                    .padding(5)
                                
                                    .onTapGesture {
                                        score += 1
                                        hiddenCats.insert(cat.sourceId)
                                        
                                        /// Haptic Feedback
                                        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
                                        impactMed.impactOccurred()
                                        
                                        /// Meow Sound attribution
                                        /// https://soundbible.com/1290-Cat-Meowing.html
                                        /// https://soundbible.com/1286-Kitten-Meow.html
                                        
                                        let random = Int.random(in: 1..<100)
                                        SoundService.playSounds(soundfile: random > 50 ? "meow1.wav" : "meow2.wav")
                                    }
                            }
                        }
                    }
                    .padding()
                }
                /// This prevents the scrollview from trying to scroll when popping cats with two fingers.
                .environment(\.isScrollEnabled, false)
            }
        }
        .onAppear {
            hiddenCats.removeAll()
        }
    }
}

struct RunningStateView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            RunningStateView(hiddenCats: .constant(Set<String>()), score: .constant(10), timeRemaining: .constant(10), gameEnded: {
                
            })
        }
    }
}
