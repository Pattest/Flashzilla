//
//  FileManager-DocumentsDirectory.swift
//  Flashzilla
//
//  Created by Baptiste Cadoux on 13/07/2022.
//

import Foundation

extension FileManager {

    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(
            for: .documentDirectory,
            in: .userDomainMask)
        return paths[0]
    }

}
