//
//  main.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/12/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

// Used to make dictionary declarations more readable
typealias Day = String
typealias ActivityShortName = String
typealias Ranking = Int

// Initialize activity output files
var schedule = Schedule(path: "/Users/russellgordon/mhw/output/")
schedule.setupFiles()

// Open the input file
guard let reader = LineReader(path: "/Users/russellgordon/mhw/survey_response_all_data_combined_headers.csv") else {
    exit(0); // cannot open file
}

// Structures used to process data
var columnDescriptors : [String] = []

// Process each line of the input file
for (number, line) in reader.enumerated() {
    
    // Look for first line and build an array of column descriptors
    if number == 0 {
        
        // Get an array of all the information on the first line
        // "Explode" the string into an array of smaller strings using a comma as a delimiter
        columnDescriptors = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: ",")
        
        // Iterate over the array of column headers and print to the console
        for (column, descriptor) in columnDescriptors.enumerated() {
            print("column \(column) : \(descriptor)")
        }
        
    } else if number > 1 {
        
        // Process a "real data" line

        // Thoughts about data structures needed:
        // ✔︎  need a dictionary for Advisors [ String : String ] i.e. [ Advisor : Filename ]
        // ✔︎  initialize all advisor output files
        // ✔︎ need a structure for an Activity
        //      - day
        //      - longname
        //      - capacity
        //      - assigned
        //      - filename
        // ✔︎ multi-level dictionary for schedule [ String [ String : Activity ] ] i.e. [ Day [ ActivityShortName : Activity ] ]
        // ✔︎ initialize all activity output files
        
        // Thoughts about approach per line:
        // ✔︎ get the grade from column 9
        // ✔︎ get the advisor from column 10
        // ✔︎ write the student currently being processed to the advisor file
        // ✔︎ populate multi-level dictionary with rankings for this student [ String [ String : Integer ] ] ie. [ Day [ ActivityShortName : Ranking ] ]
        // - ALSO: Remember to put ICS4U students at top of list! :)
        var data = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: ",")
        var student = Student(dayAndActivities: columnDescriptors, details: data)
        
        // Identify the student whose selections are being processed
        schedule.slot(student)        
        
    }
    
}

// Open an output file for writing, overwriting any existing data
guard let writer = LineWriter(path: "/Users/russellgordon/mhw/survey_output.txt", appending: false) else {
    print("Cannot open output file")
    exit(0); // cannot open output file
}

// Iterate over the array of column headers and print each element to the output file
for (column, descriptor) in columnDescriptors.enumerated() {
    writer.write(line: "column \(column) : \(descriptor)")
}

// Close the output file
writer.close()

