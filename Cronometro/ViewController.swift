//
//  ViewController.swift
//  Cronometro
//
//  Created by Gabriel Paschoal on 16/03/22.
//

import UIKit

class ViewController: UIViewController {
    

    
    var stopWatchmanager = StopWatchmanager()
    
    lazy var timer: UILabel = {
       
        let timer = UILabel()
        
        timer.text = "0.0"
        timer.font = UIFont(name: "", size: 40)
        timer.textAlignment = .center
        timer.translatesAutoresizingMaskIntoConstraints = false
        
        return timer
        
    }()
    
    let startTime: UIButton = {
       
        let btnStart = UIButton()
        
        btnStart.setTitle("Start", for: .normal)
        btnStart.backgroundColor = .blue
        btnStart.addTarget(self, action: #selector(startTimeButtonClick), for: .touchUpInside)
        btnStart.translatesAutoresizingMaskIntoConstraints = false
        
        return btnStart
        
    }()
    
    let stopTime: UIButton = {
       
        let btnStop = UIButton()
        
        btnStop.setTitle("Stop", for: .normal)
        btnStop.backgroundColor = UIColor(red: 0.94, green: 0.56, blue: 0.56, alpha: 1)
        btnStop.addTarget(self, action: #selector(stopTimeButtonClick), for: .touchUpInside)
        btnStop.translatesAutoresizingMaskIntoConstraints = false
        btnStop.isEnabled = false
        
        return btnStop
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setConfig()
        setConstraints()
        
        
    }

    func setConfig() {
        view.addSubview(timer)
        view.addSubview(startTime)
        view.addSubview(stopTime)
    }

    
    func setConstraints() {
        NSLayoutConstraint.activate([
            timer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            timer.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            startTime.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            startTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            startTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
            stopTime.topAnchor.constraint(equalTo: startTime.bottomAnchor,constant: 22),
            stopTime.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 32),
            stopTime.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -32),
            
        ])
    }
    
    @objc func startTimeButtonClick() {
        startTime.isEnabled = false
        stopTime.isEnabled = true
        startTime.backgroundColor = UIColor(red: 0.44, green: 0.46, blue: 1, alpha: 1)
        stopTime.backgroundColor = .red
        
        stopWatchmanager.startTime()
        
        DispatchQueue.main.async {
            self.timer.text = String(format: "%.1f" , self.stopWatchmanager.secondElapsed)
        }
         
    }    
    @objc func stopTimeButtonClick() {
        startTime.isEnabled = true
        stopTime.isEnabled = false
        startTime.backgroundColor = .blue
        stopTime.backgroundColor = UIColor(red: 0.94, green: 0.56, blue: 0.56, alpha: 1)
    }
    
}

