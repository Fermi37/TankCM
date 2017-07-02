//
//  RangedProperties.swift
//  TankCM
//
//  Created by Yuri Bulavin on 01.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct RangedProperties
{
    var properties: [ComputedPropities]
}

extension RangedProperties
{
    init(cylinder: Cylinder, fluidLevel: [Double]) {
        let cs = fluidLevel.map(cylinder.setLiquidLevel)
        properties = cs.map(ComputedPropities.init(cylinder:))
    }

    init(tankBottom: TankBottom, fluidLevel: [Double]) {
        let cs = fluidLevel.map(tankBottom.setLiquidLevel)
        properties = cs.map(ComputedPropities.init(tankBottom:))
    }

    init(cisterns: [Cisterna]) {
        properties = cisterns.map(ComputedPropities.init(cisterna: ))
    }
}
