//
//  ViewController.swift
//  PrettyDate
//
//  Created by 1 on 20/02/2019.
//  Copyright © 2019 Sung hyun. All rights reserved.
//

import UIKit
import Then
import Localize_Swift

class MainViewController: UIViewController {
    @IBOutlet weak var nowLabel: UILabel!
    @IBOutlet weak var minuteLabel: UILabel!
    @IBOutlet weak var hourLabel: UILabel!
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weekLabel: UILabel!
    @IBOutlet weak var monthLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    
    let dateFormatter = DateFormatter().then{
        $0.dateFormat = "yyyy-MM-dd HH:mm"
        $0.locale = Locale(identifier: "ko_KR")
    }
    
    let languageArray = [("한국어","ko"), ("ENGLISH", "en"), ("日本語", "ja")]
    var alert: UIAlertController?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setLabels()
    }

}

extension MainViewController{
    @IBAction func changeLanguage(_ sender: Any) {
        if alert == nil {
            alert = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
            
            languageArray.forEach{
                let language = $0.0
                let code = $0.1
                
                let action = UIAlertAction(title: language, style: .default, handler: {[weak self] (_) in
                    guard let self = self else { return }
                    Localize.setCurrentLanguage(code)
                    self.setLabels()
                })
                self.alert!.addAction(action)
            }
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            self.alert!.addAction(cancelAction)
        }

        guard let alertController = self.alert else { return }
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    func setLabels(){
        guard let currentDate = dateFormatter.date(from: dateFormatter.string(from: Date())) else { return }
        print("currentDate : \(currentDate)")
        nowLabel.text = currentDate.offsetString()
        minuteLabel.text = currentDate.addingTimeInterval(-60).offsetString()
        hourLabel.text = currentDate.addingTimeInterval(-3600).offsetString()
        dayLabel.text = currentDate.addingTimeInterval(-86400).offsetString()
        weekLabel.text = currentDate.addingTimeInterval(-604800).offsetString()
        monthLabel.text = currentDate.addingTimeInterval(-2678400).offsetString()
        yearLabel.text = currentDate.addingTimeInterval(-31536000).offsetString()
    }
}
