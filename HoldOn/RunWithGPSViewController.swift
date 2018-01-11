//
//  RunWithGPSViewController.swift
//  HoldOn
//
//  Created by derrick·J on 2018/1/11.
//  Copyright © 2018年 Zheng Buxuan. All rights reserved.
//

import UIKit
import CoreLocation
import SnapKit

class RunWithGPSViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width
    
    var distanceLabel: UILabel!
    var timeLabel: UILabel!
    var paceLabel: UILabel!
    var pauseBtn: UIButton!
    var stopBtn: UIButton!
    
    private var run: Run?
    private let locationManager = LocationManager.shared
    private var seconds = 0
    private var timer: Timer?
    private var distance = Measurement(value: 0, unit: UnitLength.meters)
    private var locationList: [CLLocation] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        startRun()
    }
    
    func setUI() {
        distanceLabel = UILabel()
        view.addSubview(distanceLabel)
        distanceLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(view).offset(80)
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(400)
            make.height.equalTo(20)
        }
        distanceLabel.font = UIFont.systemFont(ofSize: 20)
        
        timeLabel = UILabel()
        view.addSubview(timeLabel)
        timeLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(distanceLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(400)
            make.height.equalTo(20)
        }
        timeLabel.font = UIFont.systemFont(ofSize: 20)
        
        paceLabel = UILabel()
        view.addSubview(paceLabel)
        paceLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(timeLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(32)
            make.width.equalTo(400)
            make.height.equalTo(20)
        }
        paceLabel.font = UIFont.systemFont(ofSize: 20)
        
        pauseBtn = UIButton()
        view.addSubview(pauseBtn)
        pauseBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(paceLabel.snp.bottom).offset(40)
            make.left.equalToSuperview().offset(32)
            make.width.equalTo((screenWidth - 96) / 2)
            make.height.equalTo(40)
        }
        pauseBtn.setTitle("暂停", for: .normal)
        pauseBtn.backgroundColor = .mainYellow()
        
        stopBtn = UIButton()
        view.addSubview(stopBtn)
        stopBtn.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(paceLabel.snp.bottom).offset(40)
            make.left.equalTo(pauseBtn.snp.right).offset(32)
            make.width.equalTo((screenWidth - 96) / 2)
            make.height.equalTo(40)
        }
        stopBtn.setTitle("停止", for: .normal)
        stopBtn.backgroundColor = .mainYellow()
        stopBtn.addTarget(self, action: #selector(stopRun), for: .touchUpInside)
        
    }
    
    private func startRun() {
        seconds = 0
        distance = Measurement(value: 0, unit: UnitLength.meters)
        locationList.removeAll()
        updateDisplay()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.eachSecond()
        }
        startLocationUpdates()
    }
    
    func eachSecond() {
        seconds += 1
        updateDisplay()
    }
    
    private func updateDisplay() {
        let formattedDistance = CFFormatter.distance(distance)
        let formattedTime = CFFormatter.time(seconds)
        let formattedPace = CFFormatter.pace(distance: distance,
                                             seconds: seconds,
                                             outputUnit: UnitSpeed.minutesPerMile)
        distanceLabel.text = "距离: \(formattedDistance)"
        timeLabel.text = "时间: \(formattedTime)"
        paceLabel.text = "速度: \(formattedPace)"
    }
    
    private func startLocationUpdates() {
        locationManager.delegate = self
        locationManager.activityType = .fitness
        locationManager.distanceFilter = 10
        locationManager.startUpdatingLocation()
    }
    
    @objc private func stopRun() {
        locationManager.stopUpdatingLocation()
    }
    
    private func saveRun() {
        let newRun = Run(context: CoreDataStack.context)
        newRun.distance = distance.value
        newRun.duration = Int16(seconds)
        newRun.timestamp = Date()
        for location in locationList {
            let locationObject = Location(context: CoreDataStack.context)
            locationObject.timestamp = location.timestamp
            locationObject.latitude = location.coordinate.latitude
            locationObject.longitude = location.coordinate.longitude
            newRun.addToLocations(locationObject)
        }
        
        CoreDataStack.saveContext()
        
        run = newRun
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer?.invalidate()
        locationManager.stopUpdatingLocation()
    }
    
}

extension RunWithGPSViewController: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        for newLocation in locations {
            let howRecent = newLocation.timestamp.timeIntervalSinceNow
            guard newLocation.horizontalAccuracy < 20 && abs(howRecent) < 10 else { continue }
            
            if let lastLocation = locationList.last {
                let delta = newLocation.distance(from: lastLocation)
                distance = distance + Measurement(value: delta, unit: UnitLength.meters)
            }
            
            locationList.append(newLocation)
        }
    }
}
