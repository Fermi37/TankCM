//
//  Extension.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 14.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

// MARK: -Range
extension Range where Bound == Double {

    func linspace(numIntervals n: Int) -> [Double] {
        let delta = (self.upperBound - self.lowerBound) / Double(n)
        let out = (0 ... n).map {self.lowerBound + delta * Double($0)}
        return out
    }
}

// MARK: -Array
extension Array {
    
    var decompose: (head: Element, tail: [Element])? {
        return (count > 0) ? (head: self[0], tail: Array(self[1 ..< self.count])) : nil
    }
}

extension Array where Element == [String: Double] {

    var  csvLine: String {
        let fileLine = header + "\n" + resultLine
        return fileLine
    }

    private var header: String {
        let keys = self[0].keys
        let str = keys.reduce("") {$0 + $1 + "\t"}
        return str
    }

    private func valuesLine(data: [String: Double]) -> String {
        let str = data.reduce("") {$0 + "\($1.value)" + "\t"}
        return str
    }

    private var resultLine:  String {
        let strs = self.map {valuesLine(data: $0)}
        let line = strs.reduce("") {$0 + $1 + "\n"}
        return line
    }
}

// MARK: -Dimension
extension Dimension {
    var coefficient: Double {
        let c = (converter as! UnitConverterLinear).coefficient
        return c
    }
}

// MARK: -Dictionary
extension Dictionary where Key == String, Value == Any {
    func value<V: SerializationValue>(forKey key: SerializationKey) -> V? {
        return self[key.stringValue] as? V
    }
}

// MARK: -Tree
extension Tree where T: Box<ComputedPropities> {

    func volume() -> Double {
        let volume =  self.all().map{$0.unbox}.reduce(0){$0 + $1.volume}
        return volume
    }


    func momentOfVolumeY() -> Double {
        let momentVolume =  self.all().map {$0.unbox.momentOfVolumeY}.reduce(0) {$0 + $1}
        return momentVolume

    }

    func centerOfMassY() -> Double {
        return momentOfVolumeY() / volume()
    }
}

// MARK: -Protocols
extension ComplexGeometricShapeType
{
    var volume: Double {
        return sructure.volume()
    }

    var momentOfVolumeY: Double {
        return sructure.momentOfVolumeY()
    }

    var centerOfMassY: Double {
        return momentOfVolumeY / volume
    }

    var computedProperties: ComputedPropities {
        return ComputedPropities(volume: volume, momentOfVolumeY: momentOfVolumeY)
    }
}


extension RawRepresentable where RawValue == String {
    var stringValue: String {
        return rawValue
    }
}

extension Bool: SerializationValue {}
extension String: SerializationValue {}
extension Int: SerializationValue {}
extension Dictionary: SerializationValue {}
extension Array: SerializationValue {}
extension Double: SerializationValue {}



