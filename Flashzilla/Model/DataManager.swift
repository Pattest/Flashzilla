//
//  CardLoader.swift
//  Flashzilla
//
//  Created by Baptiste Cadoux on 13/07/2022.
//

import Foundation

class DataManager {

    static let shared = DataManager()

    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedCards")

    func loadCards() -> [Card]{
        do {
            let data = try Data(contentsOf: savePath)
            return try JSONDecoder().decode([Card].self, from: data)
        } catch {
            return []
        }
    }

    func saveCards(_ cards: [Card]) {
        do {
            let data = try JSONEncoder().encode(cards)
            try data.write(to: savePath, options: [.atomic])
        } catch {
            print("Unable to save data.")
        }
    }
}
