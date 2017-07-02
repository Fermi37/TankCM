//
//  Sphere.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 05.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation


struct TankBottom
{
    let ho: Double
    let diameter: Diameter<Cylinder>
    let liquidLevel: Double
}

extension TankBottom
{
    func setLiquidLevel(liquidLevel: Double) -> TankBottom {
        let c = TankBottom(ratioR2: ratioR2, diameter: diameter, liquidLevel: liquidLevel)
        return c
    }
}

extension TankBottom
{
    var diameter2: Diameter<TankBottom> {
        let R2 = diameter.value * ratioR2
        let D2 = 2.0 * R2
        return Diameter<TankBottom>(value: D2)
    }
    
    var ho: Double {
        let D2 = diameter2.value
        let alpha = asin(diameter.value / D2)
        let ho = D2 * (1 - cos(alpha)) / 2.0
        return ho
    }
}

extension TankBottom: Serializable
{
    func serialaize() -> Serialization {
        return [Key.ratioR2.rawValue: ratioR2, Key.bottom_diameter.rawValue: diameter2.value, Key.ho.rawValue: ho, Key.liquidLevel.rawValue: liquidLevel]
    }

    enum Key: String, SerializationKey {
        case ratioR2, ho, liquidLevel, bottom_diameter
    }
}


