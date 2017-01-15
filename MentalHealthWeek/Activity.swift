//
//  Activity.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/15/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

struct Activity {
    
    // MARK: Properties
    var longname    : String
    var capacity    : Int
    var assigned    : Int
    var filename    : String
    
    // MARK: Initializer
    init(longname : String, capacity : Int, assigned : Int = 0, filename : String) {
        self.longname = longname
        self.capacity = capacity
        self.assigned = assigned
        self.filename = filename
    }
    
}
