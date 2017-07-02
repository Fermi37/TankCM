//
//  Storage.swift
//  TankCM
//
//  Created by Yuri Bulavin on 01.07.17.
//  Copyright © 2017 SciSolution. All rights reserved.
//

import Foundation

struct StorageController
{
//    let savingLine: String
//    let fileName: String
    let fileExtension: String = "txt"
    let manager = FileManager.default
}

extension StorageController
{
    func saveLine(savingLine: String, fileName: String) throws {
        let currentPath = manager.currentDirectoryPath
        let currentURL = URL(fileURLWithPath: currentPath)
        let fullURL = currentURL.appendingPathComponent(fileName).appendingPathExtension(fileExtension)
        try savingLine.write(to: fullURL, atomically: true, encoding: String.Encoding.utf8)
    }
}
