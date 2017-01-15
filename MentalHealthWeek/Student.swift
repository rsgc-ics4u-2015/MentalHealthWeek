//
//  Student.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/15/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

class Student {
    
    // MARK: Properties
    var selections : [Day : [ActivityShortName : Ranking]]
    var grade : Int
    var advisor : String
    var email : String
    
    // MARK: Initializer(s)
    init(dayAndActivities : [String], details : [String]) {

        // Get grade
        guard let grade = Int(details[9]) else {
            print("Could not cast grade to integer.")
            exit(0)
        }
        self.grade = grade
        
        // Get advisor
        advisor = details[10]
        
        // Get email
        email = details[5]
        
        // Initialization of selections with days
        self.selections = [:]
        selections["Monday"] = [:]
        selections["Tuesday"] = [:]
        selections["Wednesday"] = [:]
        selections["Thursday"] = [:]
        selections["Friday"] = [:]
        
        // Iterate over range of selections and activities depending on grade
        var lower = 0
        var upper = 0
        switch grade {
        case 9:
            lower = 11
            upper = 38
        case 10:
            lower = 39
            upper = 66
        case 11:
            lower = 67
            upper = 94
        case 12:
            lower = 95
            upper = 123
        default:
            print("Could not identify grade.")
            exit(0)
        }
        
        // Parse student selections from a range of columns into the dictionary
        for selection in lower...upper {
            
            // Get the current day and activity for this column
            let column = explode(header: dayAndActivities[selection])
            
            // Populate the student's rankings for activities on this day
            guard let rank = Int(details[selection]) else {
                print("Could not cast ranking to integer.")
                exit(0)
            }
            selections[column.day]![column.activityShortName] = rank
            
        }
                
    }

    // Gets the day and activity from the column header
    func explode(header : String) -> (day: String, activityShortName : String) {
        
        let data = header.components(separatedBy: "_")
        
        return (data[0], data[2])
        
    }
    
    
}
