//
//  Int+.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/05/01.
//

import Foundation

extension Int {
    var convertLength: String {
        if self < 10 {
            return "0\(self)"
        } else {
            return "\(self)"
        }
    }
    
    var milliToTime: String {
        if self < 100 {
            return "00:00.\(self.convertLength)"
        } else {
            var sec = self / 100
            let millisec = self % 100
            
            if sec < 60 {
                return "00:\(sec.convertLength).\(millisec.convertLength)"
            } else {
                let min = sec / 60
                sec = sec % 60
                
                return "\(min.convertLength):\(sec.convertLength).\(millisec.convertLength)"
            }
        }
    }
}
