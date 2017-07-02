//
//  Functions.swift
//  CenterOfMass
//
//  Created by Yuri Bulavin on 05.03.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

// FIXME: need refactor to stride


func agregateRows<T> (matrix: [[T]], transform: (T, T) -> T, initialValue: T) -> [T] {
    let initialValues = Array(repeating: initialValue, count: matrix[0].count)
    let outs = matrix.reduce(initialValues) {(_result, xs) -> [T] in
        let _out = zip(_result, xs).map {transform($0.1, $0.0)}
        return _out
    }
    return outs
}


class Box<T> {
    let unbox: T
    init(_ value: T) { self.unbox = value }
}

func += <K, V> ( left: inout [K:V], right: [K:V]) {
    for (k, v) in right {
        left[k] = v
    }
}

