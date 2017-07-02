//
//  Volume.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Volume: GeometricPropertyEvaluting  {
    var multiplier: Double
    var solver: CubatureSolver
}

extension Volume{

    init(tankBottom: TankBottom) {
        multiplier = 1
        let data = CubatureData(tankBottom: tankBottom)
        solver = CubatureSolver(data: data, function: _evalSphereSegmentVolume)
    }

    init(cylinder: Cylinder) {
        let a = Area(cylinder: cylinder)
        multiplier = a.multiplier
        solver = a.solver
    }
}
