//
//  StopwatchView.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/04/30.
//

import SwiftUI
import Combine

struct StopwatchView: View {
    
    @StateObject var viewModel: StopwatchViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                VStack {
                    
                    HStack {
                        
                        Spacer()
                        
                        Text(viewModel.subMilliSec.milliToTime)
                            .font(.system(size: 18, design: .monospaced))
                        
                    } // HStack
                    
                    Text(viewModel.mainMilliSec.milliToTime)
                        .font(.system(size: 48, weight: .medium, design: .monospaced))
                    
                    Spacer()
                        .frame(height: 48)
                    
                    HStack {
                        
                        Button {
                            viewModel.didTapLapButton()
                        } label: {
                            Text(viewModel.lapLabel)
                                .font(.system(size: 18))
                                .foregroundColor(viewModel.mainMilliSec == 0 ? .gray : .black)
                        }
                        .disabled(viewModel.mainMilliSec == 0)
                        
                        Spacer()
                        
                        Button {
                            viewModel.didTapStartButton()
                        } label: {
                            Text(viewModel.startLabel)
                                .font(.system(size: 18))
                                .foregroundColor(viewModel.isPlay ? .red : .green)
                        }
                        
                    } // HStack
                    .padding(.horizontal)
                    
                } // VStack
                .padding(.top, 32)
                .fixedSize()
                
                Spacer(minLength: 48)
                
                List($viewModel.laps, id: \.self) { lap in
                    
                    LapListCell(lap: lap)
                    
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
        StopwatchView(viewModel: StopwatchViewModel())
    }
}
