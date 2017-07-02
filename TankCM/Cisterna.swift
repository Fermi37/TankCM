//
//  CenterOfMass.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 06.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct Cisterna: ComplexGeometricShapeType
{
    var sructure: Tree<Box<ComputedPropities>>
    var shapeData: Serialization
}

extension Cisterna
{
    //    init(cylinder: Cylinder, tankBottom: TankBottom) {
    //        let c = ComputedPropities(cylinder: cylinder)
    //        let b = ComputedPropities(tankBottom: tankBottom)
    //        sructure = Tree(data: Box(c)).addLeftLeaf(Box(b)).addRightLeaf(Box(b))
    //    }

    init(cylinder: Cylinder, tankBottom: TankBottom, liquidLevel: Double) {

        let c = ComputedPropities(cylinder: cylinder.setLiquidLevel(liquidLevel: liquidLevel))
        let b = ComputedPropities(tankBottom: tankBottom.setLiquidLevel(liquidLevel: liquidLevel))
        shapeData = cylinder.serialaize()
        shapeData += tankBottom.serialaize()
        shapeData[Cylinder.Key.liquidLevel.rawValue] = liquidLevel
        sructure = Tree(data: Box(c)).addLeftLeaf(Box(b)).addRightLeaf(Box(b))
    }
}

extension Cisterna: Serializable
{
    func serialaize() -> Serialization {
        var s = shapeData
        s += computedProperties.serialaize()
        return s
    }
}

