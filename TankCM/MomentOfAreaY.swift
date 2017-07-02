//
//  MomentOfAreaY.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct MomentOfAreaY: GeometricPropertyEvaluting {

    var multiplier: Double
    var solver: CubatureSolver
}

extension MomentOfAreaY {

    init(cylinder: Cylinder) {
        let data = CubatureData(cylinder: cylinder)
        solver = CubatureSolver(data: data, function: _evalCircleSegmentMomentY)
        multiplier = cylinder.lc
    }
}
