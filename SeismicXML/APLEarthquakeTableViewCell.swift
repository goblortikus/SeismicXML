//
//  APLEarthquakeTableViewCell.swift
//  SeismicXML
//
//  Created by MM on 5/6/15.
//  Copyright (c) 2015 Apple Inc. All rights reserved.
//

import Foundation
import UIKit

class APLEarthquakeTableViewCell: UITableViewCell {

    @IBOutlet var locationLabel: UILabel?
    @IBOutlet var dateLabel: UILabel?
    @IBOutlet var magnitudeLabel: UILabel?
    @IBOutlet var magnitudeImage: UIImageView?
    
    let dateFormatter: NSDateFormatter = {
        let temporaryDateFormatter = NSDateFormatter()
        temporaryDateFormatter.timeZone = NSTimeZone(forSecondsFromGMT: 0)
        temporaryDateFormatter.dateStyle = NSDateFormatterStyle.MediumStyle
        temporaryDateFormatter.timeStyle = NSDateFormatterStyle.MediumStyle
        
        return temporaryDateFormatter
    }()
    
    init() {
        super.init(style: UITableViewCellStyle.Default, reuseIdentifier: "earthquakeTableCell") // can we replace nil with a string?
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // suspecting some of these below might be stated a bit more cleanly... esp the whole self.dateLabel!.text assignment
    func configureWithEarthquake(earthquake: APLEarthquake) -> () {
        self.locationLabel!.text = earthquake.location
        self.dateLabel!.text = NSString(format: "%@", self.dateFormatter.stringFromDate(earthquake.date)) as String?
        self.magnitudeLabel!.text = NSString(format: "%.1f", earthquake.magnitude) as String
        self.magnitudeImage!.image = self.imageForMagnitude(earthquake.magnitude)
    }
    
    func imageForMagnitude(magnitude: CGFloat) -> UIImage? {
        if (magnitude >= 5.0) {
            return UIImage(named: "5.0.png")!
        }
        if (magnitude >= 4.0) {
            return UIImage(named: "4.0.png")!
        }
        if (magnitude >= 3.0) {
            return UIImage(named: "3.0.png")!
        }
        if (magnitude >= 2.0) {
            return UIImage(named: "2.0.png")!
        }
        return nil
    }
    
}
