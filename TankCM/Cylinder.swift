//
//  Cylinder.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 05.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Cylinder
{
    let lc: Double
    let diameter: Diameter<Cylinder>
    let liquidLevel: Double
}

extension Cylinder
{
    func setLiquidLevel(liquidLevel: Double) -> Cylinder {
        let c = Cylinder(lc: lc, diameter: diameter, liquidLevel: liquidLevel)
        return c
    }
}

extension Cylinder: Serializable
{
    func serialaize() -> Serialization {
        return [Key.lc.rawValue: lc, Key.cyl_diameter.rawValue: diameter.value, Key.liquidLevel.rawValue: liquidLevel]
    }

    enum Key: String, SerializationKey {
        case lc, cyl_diameter,liquidLevel
    }
}
