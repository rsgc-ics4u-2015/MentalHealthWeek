//
//  Support.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/15/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

// Handles writes to advisor files
class Advisors {
    
    // MARK: Properties
    var advisors : [ String : String ] = [:]
    let path : String
    
    // MARK: Initializer
    init(path : String) {
        
        // Initialize property for path
        self.path = path + "advisors/"
        
        // Set up filenames
        advisors["Bader Shaw"] = "bader-shaw.txt"
        advisors["Beatty"] = "beatty.txt"
        advisors["Bibby"] = "bibby.txt"
        advisors["Chow"] = "chow.txt"
        advisors["Darvasi"] = "darvasi.txt"
        advisors["DeBlois"] = "deblois.txt"
        advisors["Doerksen"] = "doerksen.txt"
        advisors["Donnelly"] = "donnelly.txt"
        advisors["Enfield"] = "enfield.txt"
        advisors["Evans"] = "evans.txt"
        advisors["Farrar"] = "farrar.txt"
        advisors["Fitz"] = "fitz.txt"
        advisors["Ghoreshy"] = "ghoreshy.txt"
        advisors["Girvan"] = "girvan.txt"
        advisors["Gledhill"] = "gledhill.txt"
        advisors["Gordon"] = "gordon.txt"
        advisors["Hart"] = "hart.txt"
        advisors["Hutton"] = "hutton.txt"
        advisors["Kotecha"] = "kotecha.txt"
        advisors["Jessani"] = "jessani.txt"
        advisors["Lambersky"] = "lambersky.txt"
        advisors["Newton"] = "newton.txt"
        advisors["O'Leary"] = "oleary.txt"
        advisors["Rankin"] = "rankin.txt"
        advisors["Ruscitti"] = "ruscitti.txt"
        advisors["Seale"] = "seale.txt"
        advisors["Spacie"] = "spacie.txt"
        advisors["Stevens"] = "stevens.txt"
        advisors["Totten"] = "totten.txt"
        advisors["Uhre"] = "uhre.txt"
        advisors["Van Herk"] = "vanherk.txt"
        advisors["Vivares"] = "vivares.txt"
        
    }
    
    // MARK: Methods
    
    // Prepare files for later writes of student selections
    func setupFiles() {
    
        // Create all advisor files
        for (advisor, filename) in advisors {
            
            // Open the advisor output file
            guard let writer = LineWriter(path: self.path + filename, appending: false) else {
                print("Cannot open output file for \(advisor) at \(self.path + filename)")
                exit(0); // cannot open output file
            }
            
            // Write the advisor name to this file
            writer.write(line: "\(advisor)")
            var underLine = ""
            for _ in advisor.characters {
                underLine += "="
            }
            writer.write(line: underLine)
            
            // Close the output file
            writer.close()
        }
    
    }
    
    // Add the student being processed to the file
    func add(_ student : Student) {
        
        guard let filename = advisors[student.advisor] else {
            print("Could not find a provided advisor, \(student.advisor), in the list of advisors.")
            exit(0)
        }
        
        // Open the advisor output file
        guard let writer = LineWriter(path: self.path + filename, appending: true) else {
            print("Cannot open output file for \(student.advisor) at \(self.path + filename)")
            exit(0); // cannot open output file
        }
        
        // Write the student email to this advisor's file
        writer.write(line: "")
        writer.write(line: "\(student.email)")
        var underLine = ""
        for _ in student.email.characters {
            underLine += "-"
        }
        writer.write(line: underLine)
        
        // Close the output file
        writer.close()
        
    }
    
    // Add the student's selection to the file
    func assign(student : String, with advisor : String, to activity : String, on day : String) {

        guard let filename = advisors[advisor] else {
            print("Could not find a provided advisor, \(advisor), in the list of advisors.")
            exit(0)
        }

        // Open the file for this advisor
        guard let writer = LineWriter(path: self.path + filename, appending: true) else {
            print("Cannot open output file for \(advisor) at \(self.path + filename)")
            exit(0); // cannot open output file
        }
        
        // Write the day and activity to the file
        writer.write(line: "\(day) : \(activity)")
        
        // Close the output file
        writer.close()
    }

    
}
