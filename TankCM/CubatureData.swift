//
//  CubatureData.swift
//  TankCM
//
//  Created by Yuri Bulavin on 30.06.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct CubatureData
{
    var geometricParams: [Double]
    var xmin: [Double]
    var xmax: [Double]
}

extension CubatureData
{
    init(cylinder: Cylinder) {
        let radius: Double = cylinder.diameter.radius
        xmin = [-radius, -radius]
        xmax = [radius, -radius + cylinder.liquidLevel * cylinder.diameter.value]
        geometricParams = [radius]
    }

    init(tankBottom: TankBottom) {
        let radius: Double = tankBottom.diameter2.radius
        let radiusCyl = tankBottom.diameter.radius
        xmin = [-radius, -radiusCyl, -radius]
        xmax = [-radius + tankBottom.ho, -radiusCyl + tankBottom.liquidLevel * tankBottom.diameter.value, radius]
        geometricParams = [radius, radiusCyl]
    }
}
