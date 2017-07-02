//
//  MomentOfVolumeY.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation


struct MomentOfVolumeY: GeometricPropertyEvaluting {

    var multiplier: Double
    var solver: CubatureSolver
}

extension MomentOfVolumeY {

    init(tankBottom: TankBottom) {
        let data = CubatureData(tankBottom: tankBottom)
        solver = CubatureSolver(data: data, function: _evalSphereSegmentMomentY)
        multiplier = 1
    }

    init(cylinder: Cylinder) {
        let a = MomentOfAreaY(cylinder: cylinder)
        multiplier = a.multiplier
        solver = a.solver
    }
}



