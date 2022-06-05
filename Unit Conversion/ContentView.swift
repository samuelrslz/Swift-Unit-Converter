//
//  ContentView.swift
//  Unit Conversion
//
//  Created by Samuel Ríos-Lazo on 6/1/22.
//

import SwiftUI

struct ContentView: View {   // Telling Swift that we want to draw on the screen.
    
    @State private var inputValue = ""
    @State private var outputValue = ""
    
    @State private var inputUnitValue = 2
    let inputUnits = ["meters", "kilometers", "feet", "miles"]   // List of units we want to choose from.
    
    @State private var outputUnitValue = 2
    let outputUnits = ["meters", "kilometers", "feet", "miles"]   // List of units we want to choose from.
    
    var inputUnitAfterConversionToOutput: String {   // Does all the calculations using Measurement class.
        
        var output = ""
        var input = Measurement(value: 0, unit: UnitLength.meters)   // Default value of our input.
        
        switch inputUnits[inputUnitValue] {   // Gives us the chance to pick from options.
        case "meters":
            input = Measurement(value: Double(inputValue) ?? 0, unit:   // Takes the value and makes sure that it will be treated as the right unit.
                                    UnitLength.meters)
        case "kilometers":
            input = Measurement(value: Double(inputValue) ?? 0, unit:
                                    UnitLength.kilometers)
        case "feet":
            input = Measurement(value: Double(inputValue) ?? 0, unit:
                                    UnitLength.feet)
        case "miles":
            input = Measurement(value: Double(inputValue) ?? 0, unit:
                                    UnitLength.miles)
        default:
            input = Measurement(value: Double(inputValue) ?? 0, unit:
                                    UnitLength.meters)
        }
        
        switch outputUnits[outputUnitValue] {   // Takes the input and converts it to the selected output unit.
        case "meters":
            output = String(describing: input.converted(to: UnitLength.meters))
        case "kilometers":
            output = String(describing: input.converted(to: UnitLength.kilometers))
        case "feet":
            output = String(describing: input.converted(to: UnitLength.feet))
        case "miles":
            output = String(describing: input.converted(to: UnitLength.miles))
        default:
            output = String(describing: input.converted(to: UnitLength.meters))
        }
        
        return output
    }
        
        
    var body: some View {
        NavigationView {
            Form {
                Section(header:Text("Enter Input value here")) {
                    TextField("Input Value",text:$inputValue)
                }
                
                Section(header:Text("INPUT UNIT")) {
                    Picker("Input Unit - ",selection:$inputUnitValue){
                        ForEach(0..<inputUnits.count) {
                            Text("\(inputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("OUTPUT UNIT")) {
                    Picker("Output Unit - ",selection:$outputUnitValue){
                        ForEach(0..<outputUnits.count) {
                            Text("\(outputUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header:Text("Check Output value here")) {
                    Text(inputUnitAfterConversionToOutput)
                }
            }
            .navigationTitle("Unit Conversions")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

