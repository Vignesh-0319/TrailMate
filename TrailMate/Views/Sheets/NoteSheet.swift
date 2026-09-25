//
//  NoteSheet.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct NoteSheet: View {
    let trailName: String
    @Environment(\.dismiss) private var dismiss
    @State private var note = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            Text("Note for \(trailName)")
                .font(.headline)
            TextField("What should you remember?", text: $note)
                .textFieldStyle(.roundedBorder)
            Button("Done") {
                dismiss()
            }
            Spacer()
        }
        .padding()
    }
}

#Preview {
    NoteSheet(trailName: "Triund Ridge")
}
