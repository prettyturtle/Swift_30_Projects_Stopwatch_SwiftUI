//
//  StopwatchView.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/04/30.
//

import SwiftUI
import Combine

struct StopwatchView: View {
    
    @State var isPlay: Bool = false
    
    @State var lapLabel: String = "Lap"
    @State var startLabel: String = "Start"
    
    @State var mainTimer: Timer?
    
    @State var mainMilliSec: Int = 0
    
    @State var laps: [Lap] = []
    
    @State var currentLap: Int = 1
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("00:00.00")
                            .font(.system(size: 18, design: .monospaced))
                        
                    } // HStack
                    
                    Text(mainMilliSec.milliToTime)
                        .font(.system(size: 48, weight: .medium, design: .monospaced))
                    
                    Spacer()
                        .frame(height: 48)
                    
                    HStack {
                        
                        Button {
                            
                            if isPlay {
                                let lap = Lap(id: currentLap, millisec: mainMilliSec)
                                
                                laps = [lap] + laps
                                
                                currentLap += 1
                            } else {
                                currentLap = 0
                                mainMilliSec = 0
                                lapLabel = "Lap"
                                mainTimer = nil
                                laps = []
                            }
                            
                        } label: {
                            Text(lapLabel)
                                .font(.system(size: 18))
                                .foregroundColor(mainMilliSec == 0 ? .gray : .black)
                        }
                        .disabled(mainMilliSec == 0)
                        
                        Spacer()
                        
                        Button {
                            isPlay.toggle()
                            
                            startLabel = isPlay ? "Stop" : "Start"
                            
                            if isPlay {
                                lapLabel = "Lap"
                                mainTimer = Timer.scheduledTimer(
                                    withTimeInterval: 0.01,
                                    repeats: true
                                ) { _ in
                                    mainMilliSec += 1
                                }
                            } else {
                                lapLabel = "Reset"
                                mainTimer?.invalidate()
                            }
                        } label: {
                            Text(startLabel)
                                .font(.system(size: 18))
                                .foregroundColor(isPlay ? .red : .green)
                        }
                        
                    } // HStack
                    .padding(.horizontal)
                    
                } // VStack
                .padding(.top, 32)
                .fixedSize()
                
                Spacer(minLength: 48)
                
                List($laps, id: \.self) { lap in
                    
                    HStack {
                        
                        Text("Lap \(lap.wrappedValue.id)")
                            .font(.system(size: 18))
                        
                        Spacer()
                        
                        Text(lap.wrappedValue.millisec.milliToTime)
                            .font(.system(size: 18, design: .monospaced))
                        
                    } // HStack
                    .padding()
                    .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                } // List
                .listStyle(.plain)
                
            } // VStack
            
            .navigationTitle("Stopwatch")
            .navigationBarTitleDisplayMode(.inline)
            
        } // NavigationView
        
    }
}

struct StopwatchView_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
