//
//  GeometricFigure.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 14.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation




protocol GeometricPropertyEvaluting {

    var multiplier: Double {get}
    var solver: CubatureSolver {get}
    func value() -> Double
}

extension GeometricPropertyEvaluting {

    func value() -> Double {
        return solver.run().value * multiplier
    }
}



