//
//  StopwatchView.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/04/30.
//

import SwiftUI

struct StopwatchView: View {
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text("00:00.00")
                            .font(.system(size: 18))
                        
                    } // HStack
                    
                    Text("00:00.00")
                        .font(.system(size: 48, weight: .medium))
                    
                    Spacer()
                        .frame(height: 48)
                    
                    HStack {
                        
                        Button {
                            print("didTapLapButton")
                        } label: {
                            Text("Lap")
                                .font(.system(size: 18))
                                .foregroundColor(.black)
                        }
                        
                        Spacer()
                        
                        Button {
                            print("didTapStartButton")
                        } label: {
                            Text("Start")
                                .font(.system(size: 18))
                                .foregroundColor(.red)
                        }
                        
                    } // HStack
                    .padding(.horizontal)
                    
                } // VStack
                .padding(.top, 32)
                .fixedSize()
                
                Spacer(minLength: 48)
                
                List((0..<5).reversed(), id: \.self) { i in
                    
                    HStack {
                        
                        Text("Lap \(i + 1)")
                            .font(.system(size: 18))
                        
                        Spacer()
                        
                        Text("00:00.00")
                            .font(.system(size: 18))
                        
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
