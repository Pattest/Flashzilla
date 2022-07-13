//
//  EditCards.swift
//  Flashzilla
//
//  Created by Baptiste Cadoux on 12/07/2022.
//

import SwiftUI

struct EditCards: View {
    @Environment(\.dismiss) var dismiss
    @State private var cards: [Card] = DataManager.shared.loadCards()
    @State private var newPrompt = ""
    @State private var newAnswer = ""

    @FocusState private var focusedNewPrompt

    let savePath = FileManager.documentsDirectory.appendingPathComponent("SavedCards")

    var body: some View {
        NavigationView {
            List {
                Section("Add new card") {
                    TextField("Prompt", text: $newPrompt)
                        .focused($focusedNewPrompt)
                    TextField("Answer", text: $newAnswer)
                    Button("Add card", action: addCard)
                }

                Section {
                    ForEach(0..<cards.count, id: \.self) { index in
                        VStack(alignment: .leading) {
                            Text(cards[index].prompt)
                                .font(.headline)
                            Text(cards[index].answer)
                                .foregroundColor(.secondary)
                        }
                    }
                    .onDelete(perform: removeCards)
                }
            }
            .navigationTitle("Edit Cards")
            .toolbar {
                Button("Done", action: done)
            }
            .listStyle(.grouped)
        }
    }

    func done() {
        dismiss()
    }

    func addCard() {
        let trimmedPrompt = newPrompt.trimmingCharacters(in: .whitespaces)
        let trimmedAnswer = newAnswer.trimmingCharacters(in: .whitespaces)
        guard trimmedPrompt.isEmpty == false && trimmedAnswer.isEmpty == false else { return }

        let card = Card(prompt: trimmedPrompt,
                        answer: trimmedAnswer)
        cards.insert(card, at: 0)
        DataManager.shared.saveCards(cards)

        newPrompt.removeAll()
        newAnswer.removeAll()
        focusedNewPrompt = true
    }

    func removeCards(at offsets: IndexSet) {
        cards.remove(atOffsets: offsets)
        DataManager.shared.saveCards(cards)
    }
}
struct EditCards_Previews: PreviewProvider {
    static var previews: some View {
        EditCards()
    }
}
