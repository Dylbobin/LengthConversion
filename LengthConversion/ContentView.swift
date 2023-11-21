//
//  ContentView.swift
//  LengthConversion
//
//  Created by Dylan Silva on 11/21/23.
//

import SwiftUI

struct ContentView: View {
    @State private var baseLength: Double = 20
    @State private var beginUnit: String = "meters"
    @State private var conversionUnit: String = "meters"
    
    let measureUnits = ["meters", "km", "feet", "yards", "miles"]
    
    var outputLength: Double {
        // convert  to base - meters
        var baseUnit: Double {
            switch beginUnit {
            case "meters":
                return baseLength
            case "km":
                return baseLength*1000
            case "feet":
                return baseLength*0.3048
            case "yards":
                return baseLength*0.9144
            case "miles":
                return baseLength*1609.34
            default:
                return baseLength
            }
            /*
            if beginUnit == "meters" {
                return baseLength
            } else if beginUnit == "km" {
                return baseLength*1000
            } else if beginUnit == "feet" {
                return baseLength*0.3048
            } else if beginUnit == "yards" {
                return baseLength*0.9144
            } else if beginUnit == "miles" {
                return baseLength*1609.34
            } else {
                return baseLength
            } */
        }
        // convert from meters to rest of unit
        if conversionUnit == "km" {
            return baseUnit/1000
        } else if conversionUnit == "feet" {
            return baseUnit/0.3048
        } else if conversionUnit == "yards" {
            return baseUnit/0.9144
        } else if conversionUnit == "miles" {
            return baseUnit/1609.34
        } else {
            return baseUnit
        }
        
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Length to Convert") {
                    TextField("Enter Length", value: $baseLength, format: .number)
                }
                Section("Input Unit") {
                    Picker("Unit", selection: $beginUnit) {
                        ForEach(measureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Output Unit") {
                    Picker("Unit", selection: $conversionUnit) {
                        ForEach(measureUnits, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                Section("Converted Length") {
                    Text(outputLength, format: .number)
                }
            }
            .navigationTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
