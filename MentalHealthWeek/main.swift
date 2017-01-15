//
//  main.swift
//  MentalHealthWeek
//
//  Created by Russell Gordon on 1/12/17.
//  Copyright © 2017 Russell Gordon. All rights reserved.
//

import Foundation

// Read the text file (place in your home folder)
// Path will probably be /Users/student/survey_response_sample.txt
// Obtain the data file on Haiku, Day 37
guard let reader = LineReader(path: "/Users/russellgordon/survey_response_all_data_combined_headers.csv") else {
    exit(0); // cannot open file
}

// Structures used to process data
var columnDescriptors : [String] = []
var columnDescriptorsVerbose : [String]

// Iterate over each line in the file and print to the terminal
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
        
    } else if number == 1 {
        
        // Get an array of the "long form" column descriptions
        columnDescriptorsVerbose = line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).components(separatedBy: ",")
        
    }
    
}

// Open an output file for writing, overwriting any existing data
guard let writer = LineWriter(path: "/Users/russellgordon/survey_output.txt", appending: false) else {
    print("Cannot open output file")
    exit(0); // cannot open output file
}

// Iterate over the array of column headers and print each element to the output file
for (column, descriptor) in columnDescriptors.enumerated() {
    writer.write(line: "column \(column) : \(descriptor)")
}

// Close the output file
writer.close()

