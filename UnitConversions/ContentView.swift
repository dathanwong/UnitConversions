//
//  ContentView.swift
//  UnitConversions
//
//  Created by Dathan Wong on 5/23/20.
//  Copyright © 2020 Dathan Wong. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var baseValue: String = ""
    @State private var baseUnit: Int = 0
    @State private var outputUnit: Int = 0
    @State private var outputValue: String = ""
    var output: Measurement<UnitLength>{
        let base = Double(baseValue) ?? 0
        var measurement = Measurement(value: base, unit: UnitLength.centimeters)
        //Set up input unit
        switch units[baseUnit]{
        case "inches":
            measurement = Measurement(value: base, unit: UnitLength.inches)
        case "feet":
            measurement = Measurement(value: base, unit: UnitLength.feet)
        case "yards":
            measurement = Measurement(value: base, unit: UnitLength.yards)
        case "millimeters":
            measurement = Measurement(value: base, unit: UnitLength.millimeters)
        case "centimeters":
            measurement = Measurement(value: base, unit: UnitLength.centimeters)
        case "meters":
            measurement = Measurement(value: base, unit: UnitLength.meters)
        default:
            measurement = Measurement(value: base, unit: UnitLength.centimeters)
        }
        //Convert to output unit
        var output = measurement.converted(to: UnitLength.inches)
        switch units[outputUnit]{
        case "inches":
            output = measurement.converted(to: UnitLength.inches)
        case "feet":
            output = measurement.converted(to: UnitLength.feet)
        case "yards":
            output = measurement.converted(to: UnitLength.yards)
        case "millimeters":
            output = measurement.converted(to: UnitLength.millimeters)
        case "centimeters":
            output = measurement.converted(to: UnitLength.centimeters)
        case "meters":
            output = measurement.converted(to: UnitLength.meters)
        default:
            return output
        }
        
        return output
    }
    
    let units = ["inches", "feet", "yards", "millimeters", "centimeters", "meters"]
    
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Select a unit to convert")){
                    Picker("Input Unit", selection: $baseUnit) {
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    TextField("Input Value", text: $baseValue)
                }
                Section(header: Text("Select an Output Unit")) {
                    Picker("Output Unit", selection: $outputUnit) {
                        ForEach(0 ..< units.count){
                            Text("\(self.units[$0])")
                        }
                    }
                    Text("\(output.description)")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
