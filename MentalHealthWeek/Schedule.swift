//
//  Schedule.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/15/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

struct Schedule {
    
    var days : [Day : [ActivityShortName : Activity]]
    let path : String
    
    init(path : String) {

        // Set path for creating files
        self.path = path + "activities/"
        
        // Initialize to empty dictionary
        self.days = [:]

        // Set up Monday
        self.days["Monday"] = [:]   // Empty dictionary for Monday to start
        
        // We know the "Monday" key exists now, so we can use force unwrapping here
        self.days["Monday"]!["Sleep"]           = Activity(longname: "Sleep in!", capacity: Int.max, filename: "monday-sleep-in.txt")
        self.days["Monday"]!["Breakfast"]       = Activity(longname: "Casual breakfast in Ketchum Hall with Ms. Totten", capacity: 160, filename: "monday-breakfast.txt")
        self.days["Monday"]!["Gym"]             = Activity(longname: "Physical activity in gym with Mr. Turner and Mr. Sarellas", capacity: 50, filename: "monday-gym.txt")
        self.days["Monday"]!["Academics"]       = Activity(longname: "Managing academics in the library with Father Donkin and Mr. Van Herk", capacity: 30, filename: "monday-academics.txt")
        self.days["Monday"]!["Yoga"]            = Activity(longname: "Yoga in the Dojo with Ms. McPhedran", capacity: 20, filename: "monday-yoga.txt")
        self.days["Monday"]!["Animals"]         = Activity(longname: "Animal therapy by the main office with Ms. Kaye and Mr. Fitzpatrick", capacity: 16, filename: "monday-animals.txt")

        // Set up Tuesday
        self.days["Tuesday"] = [:]   // Empty dictionary for Tuesday to start
        
        // We know the "Tuesday" key exists now, so we can use force unwrapping here
        self.days["Tuesday"]!["Sleep"]          = Activity(longname: "Sleep in!", capacity: Int.max, filename: "tuesday-sleep-in.txt")
        self.days["Tuesday"]!["Breakfast"]      = Activity(longname: "Casual breakfast in Ketchum Hall with Ms. Totten", capacity: 160, filename: "tuesday-breakfast.txt")
        self.days["Tuesday"]!["Gym"]            = Activity(longname: "Physical activity in gym with Mr. Turner and Mr. Sarellas", capacity: 50, filename: "tuesday-gym.txt")
        self.days["Tuesday"]!["Academics"]      = Activity(longname: "Managing academics in the library with Father Donkin and Mr. Van Herk", capacity: 30, filename: "tuesday-academics.txt")
        self.days["Tuesday"]!["Yoga"]           = Activity(longname: "Yoga in the Dojo with Ms. McPhedran", capacity: 20, filename: "tuesday-yoga.txt")
        self.days["Tuesday"]!["Animals"]        = Activity(longname: "Animal therapy by the main office with Ms. Kaye and Mr. Fitzpatrick", capacity: 16, filename: "tuesday-animals.txt")
        
        // Set up Wednesday
        self.days["Wednesday"] = [:]   // Empty dictionary for Wednesday to start
        
        // We know the "Wednesday" key exists now, so we can use force unwrapping here
        self.days["Wednesday"]!["Sleep"]        = Activity(longname: "Sleep in!", capacity: Int.max, filename: "wednesday-sleep-in.txt")
        self.days["Wednesday"]!["Breakfast"]    = Activity(longname: "Casual breakfast in Ketchum Hall with Ms. Totten", capacity: 160, filename: "wednesday-breakfast.txt")
        self.days["Wednesday"]!["Gym"]          = Activity(longname: "Physical activity in gym with Mr. Turner and Mr. Sarellas", capacity: 50, filename: "wednesday-gym.txt")
        self.days["Wednesday"]!["Relaxation"]   = Activity(longname: "Relaxation and drawing in the Chapel with Father Donkin", capacity: 160, filename: "wednesday-relaxation.txt")
        self.days["Wednesday"]!["Academics"]    = Activity(longname: "Managing academics in the library with Ms. Uhre and Mr. Van Herk", capacity: 30, filename: "wednesday-academics.txt")
        self.days["Wednesday"]!["Yoga"]         = Activity(longname: "Yoga in the Dojo with Ms. McPhedran", capacity: 20, filename: "wednesday-yoga.txt")
        self.days["Wednesday"]!["Animals"]      = Activity(longname: "Animal therapy by the main office with Ms. Kaye and Mr. Fitzpatrick", capacity: 16, filename: "wednesday-animals.txt")
        
        // Set up Thursday
        self.days["Thursday"] = [:]   // Empty dictionary for Thursday to start
        
        // We know the "Thursday" key exists now, so we can use force unwrapping here
        self.days["Thursday"]!["Sleep"]        = Activity(longname: "Sleep in!", capacity: Int.max, filename: "thursday-sleep-in.txt")
        self.days["Thursday"]!["Breakfast"]    = Activity(longname: "Casual breakfast in Ketchum Hall with Ms. Totten", capacity: 160, filename: "thursday-breakfast.txt")
        self.days["Thursday"]!["Gym"]          = Activity(longname: "Physical activity in gym with Mr. Turner and Mr. Sarellas", capacity: 50, filename: "thursday-gym.txt")
        self.days["Thursday"]!["Relaxation"]   = Activity(longname: "Relaxation and drawing in the Chapel with Father Donkin", capacity: 160, filename: "thursday-relaxation.txt")
        self.days["Thursday"]!["Academics"]    = Activity(longname: "Managing academics in the library with Ms. Uhre and Mr. Van Herk", capacity: 30, filename: "thursday-academics.txt")
        self.days["Thursday"]!["Animals"]      = Activity(longname: "Animal therapy by the main office with Ms. Kaye and Mr. Fitzpatrick", capacity: 16, filename: "thursday-animals.txt")
        self.days["Thursday"]!["MathExam"]    = Activity(longname: "Math exam – If you are taking full-year math with Mr. Doerksen Ms. Jessani or Ms. Nichols you must select this option. (Sorry)", capacity: 30, filename: "thursday-mathexam.txt")
        
        // Set up Friday
        self.days["Friday"] = [:]   // Empty dictionary for Friday to start
        
        // We know the "Friday" key exists now, so we can use force unwrapping here
        self.days["Friday"]!["Sleep"]        = Activity(longname: "Sleep in!", capacity: Int.max, filename: "friday-sleep-in.txt")
        self.days["Friday"]!["Gym"]          = Activity(longname: "Physical activity in gym with Mr. Turner and Mr. Sarellas", capacity: 50, filename: "friday-gym.txt")
        self.days["Friday"]!["Relaxation"]   = Activity(longname: "Relaxation and drawing in the Chapel with Father Donkin", capacity: 160, filename: "friday-relaxation.txt")
        self.days["Friday"]!["Academics"]    = Activity(longname: "Managing academics in the library with Ms. Uhre and Mr. Van Herk", capacity: 30, filename: "friday-academics.txt")
        self.days["Friday"]!["Animals"]      = Activity(longname: "Animal therapy by the main office with Ms. Kaye and Mr. Fitzpatrick", capacity: 16, filename: "friday-animals.txt")
        self.days["Friday"]!["Massage"]      = Activity(longname: "Massage in the Senior School Office with professional masseuses supervised by Ms. Kaye", capacity: 12, filename: "friday-massage.txt")
        
    }
    
    // MARK: Methods

    // Prepare files for later writes of student selections
    func setupFiles() {
        
        // Create all advisor files
        for (day, activities) in days {
            
            for (activityShortName, activity) in activities {
                
                // Open a file for this activity
                guard let writer = LineWriter(path: self.path + activity.filename, appending: false) else {
                    print("Cannot open output file for \(activityShortName) on \(day) at \(self.path + activity.filename)")
                    exit(0); // cannot open output file
                }
                
                // Write the day
                writer.write(line: "\(day)")
                var underLine = ""
                for _ in day.characters {
                    underLine += "="
                }
                writer.write(line: underLine)
                
                // Write the activity name
                writer.write(line: "\(activity.longname)")
                underLine = ""
                for _ in activity.longname.characters {
                    underLine += "-"
                }
                writer.write(line: underLine)
                
                // Close the output file
                writer.close()
            
            }
            
        }
        
    }
    
    // Identify a student's selections and then slot them in to the schedule
    mutating func slot(_ student : Student) {

        // - sort the activities for each day for a student by ranking
        // - iterate over days, then activities on a day, and add student to first activity in schedule where assigned < capacity
        //      - update the schedule dictionary to record assignment (increment assigned for the activity by 1)
        //      - write student selection to the advisor file
        //      - write student selection to the activity file
        
        // Iterate over the days
        for (day, selection) in student.selections {
            
            // Iterate over the selections in sorted order by rank
            for (activity, rank) in selection.sorted(by: { $0.value < $1.value } ) { // See http://apple.co/2jyZZCb for details on syntax here
                
                // Now slot the student in to the schedule
                if days[day]![activity]!.assigned < days[day]![activity]!.capacity {
                    
                    // Increment the assigned value for this activity
                    days[day]![activity]!.assigned += 1
                    
                    // Assign the student to this activity's file
                    assign(student: student.email, to: days[day]![activity]!.filename, on: day)
                    
                    // Stop checking possibilities for this day, so stop this for-in loop for activities on this day
                    break
                    
                }
            }

        }

    }
    
    // Add a student to an activity (write them to the file)
    private func assign(student : String, to activity: String, on day : String) {
        
        // Open a file for this activity
        guard let writer = LineWriter(path: self.path + activity, appending: true) else {
            print("Cannot open output file \(activity)) at \(self.path + activity)")
            exit(0); // cannot open output file
        }
        
        // Write the student email address
        writer.write(line: "\(student)")
        
        // Close the output file
        writer.close()
        
    }

    
}
