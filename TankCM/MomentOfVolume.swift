//
//  VolumeMoment.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 12.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

import Foundation


public class UnitMomentOfVolume: Dimension {
    override public class func baseUnit() -> UnitMomentOfVolume {
        return UnitMomentOfVolume.metersCubeMeters
    }
    public static let metersCubeMeters = UnitMomentOfVolume(symbol: "m·m³", converter: UnitConverterLinear(coefficient: 1))
}


func == (lhs: UnitMomentOfVolume, rhs: UnitMomentOfVolume) -> Bool {
    return lhs.symbol == rhs.symbol &&
        lhs.converter == rhs.converter
}

extension UnitMomentOfVolume {
    
    static func make(with units: [Dimension]) -> UnitMomentOfVolume {
        let symbol = units[0].symbol + "·" + units[1].symbol
        let coef = units[0].coefficient * units[1].coefficient
        let result = UnitMomentOfVolume(symbol: symbol, converter: UnitConverterLinear(coefficient: coef))
        return result
    }
}


