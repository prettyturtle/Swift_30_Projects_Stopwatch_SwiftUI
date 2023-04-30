//
//  StopwatchViewModel.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/05/01.
//

import SwiftUI

final class StopwatchViewModel: ObservableObject {
    
    @Published var isPlay: Bool = false
    
    @Published var lapLabel: String = "Lap"
    @Published var startLabel: String = "Start"
    
    @Published var mainTimer: Timer?
    
    @Published var mainMilliSec: Int = 0
    @Published var subMilliSec: Int = 0
    
    @Published var laps: [Lap] = []
    
    @Published var currentLap: Int = 1
    
    func didTapStartButton() {
        isPlay.toggle()
        
        startLabel = isPlay ? "Stop" : "Start"
        
        if isPlay {
            play()
        } else {
            stop()
        }
    }
    
    func didTapLapButton() {
        if isPlay {
            saveLap()
        } else {
            reset()
        }
    }
    
}

private extension StopwatchViewModel {
    
    func play() {
        lapLabel = "Lap"
        mainTimer = Timer.scheduledTimer(
            withTimeInterval: 0.01,
            repeats: true
        ) { [weak self] _ in
            self?.mainMilliSec += 1
            self?.subMilliSec += 1
        }
    }
    
    func stop() {
        lapLabel = "Reset"
        mainTimer?.invalidate()
    }
    
    func saveLap() {
        let lap = Lap(id: currentLap, millisec: mainMilliSec)
        
        laps = [lap] + laps
        
        currentLap += 1
        subMilliSec = 0
    }
    
    func reset() {
        currentLap = 0
        mainMilliSec = 0
        subMilliSec = 0
        lapLabel = "Lap"
        mainTimer = nil
        laps = []
    }
    
}
