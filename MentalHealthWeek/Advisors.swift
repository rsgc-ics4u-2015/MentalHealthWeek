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
    var path : String
    
    // MARK: Initializer
    init(path : String) {
        
        // Initialize property for path
        self.path = path
        
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
        advisors["Lambersky"] = "lambersky.txt"
        advisors["Newton"] = "newton.txt"
        advisors["O'Leary"] = "oleary.txt"
        advisors["Rankin"] = "rankin.txt"
        advisors["Seale"] = "seale.txt"
        advisors["Spacie"] = "spacie.txt"
        advisors["Stevens"] = "stevens.txt"
        advisors["Totten"] = "totten.txt"
        advisors["Van Herk"] = "vanherk.txt"
        advisors["Vivares"] = "vivares.txt"
        
    }
    
    // MARK: Methods
    
    // Prepare files for later writes of student selections
    func setupFiles() {
    
        // Create all advisor files
        for (advisor, filename) in advisors {
            
            // Open a file and write a couple of lines
            guard let writer = LineWriter(path: self.path + filename, appending: false) else {
                print("Cannot open output file for \(advisor) at \(self.path + filename)")
                exit(0); // cannot open output file
            }
            
            // Iterate over the array of column headers and print each element to the output file
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

    
}
