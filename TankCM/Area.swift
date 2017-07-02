//
//  Area.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Area: GeometricPropertyEvaluting  {

    var multiplier: Double
    var solver: CubatureSolver
}

extension Area{

    init(cylinder: Cylinder) {
        multiplier = cylinder.lc
        let data = CubatureData(cylinder: cylinder)
        solver = CubatureSolver(data: data, function: _evalCircleSegmentArea)
    }
}


