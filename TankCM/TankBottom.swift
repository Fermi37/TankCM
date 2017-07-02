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
        let c = TankBottom(ho: ho, diameter: diameter, liquidLevel: liquidLevel)
        return c
    }
}

extension TankBottom
{
    var diameter2: Diameter<TankBottom> {
        let a = diameter.radius
        let D2 = (pow(a, 2) / ho + ho)
        return Diameter<TankBottom>(value: D2)
    }

}

extension TankBottom: Serializable
{
    func serialaize() -> Serialization {
        return [Key.bottom_diameter.rawValue: diameter2.value, Key.ho.rawValue: ho, Key.liquidLevel.rawValue: liquidLevel]
    }

    enum Key: String, SerializationKey {
        case ho, liquidLevel, bottom_diameter
    }
}


