//
//  LapListCell.swift
//  Swift_30_Projects_Stopwatch
//
//  Created by yc on 2023/05/01.
//

import SwiftUI

struct LapListCell: View {
    
    @Binding var lap: Lap
    
    var body: some View {
        HStack {
            
            Text("Lap \(lap.id)")
                .font(.system(size: 18))
            
            Spacer()
            
            Text(lap.millisec.milliToTime)
                .font(.system(size: 18, design: .monospaced))
            
        } // HStack
        .padding()
        .listRowInsets(.init(
            top: 0,
            leading: 0,
            bottom: 0,
            trailing: 0
        ))
    }
}

struct LapListCell_Previews: PreviewProvider {
    static var previews: some View {
        LapListCell(lap: .constant(Lap(id: 0, millisec: 16278)))
    }
}
