//
//  StopWatchManager.swift
//  Cronometro
//
//  Created by Gabriel Paschoal on 16/03/22.
//

import Foundation

class StopWatchmanager: ObservableObject {
    
    @Published var clock = Timer()
    
    var secondElapsed = 0.0
    
    func startTime() {
      
        clock = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) {
            timer in
            
            self.secondElapsed += 0.1
            
        }
    }
}
