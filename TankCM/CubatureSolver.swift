//
//  CubatureSolver.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 12.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct CubatureSolver
{
    var data: CubatureData

    let function: (_ fdata: UnsafeMutableRawPointer, _ xmin: UnsafePointer<Double>, _ xmax: UnsafePointer<Double>, _ reqRelError: Double, _ val: UnsafeMutablePointer<Double>, _ err: UnsafeMutablePointer<Double>) -> Int32
    
    func run() -> CubatureResult {
        let radius: Double = data.geometricParams[0]
        var fdata = radius
        let xmin = data.xmin
        let xmax  = data.xmax
        var val: Double = 0
        var err: Double = 0
        let _ =  function(&fdata, xmin, xmax, 1e-3, &val, &err)
        return CubatureResult(value: val, error: err)
    }
}
