//
//  DetailRow.swift
//  TrailMate
//
//  Created by SUPER CHARGE on 25/09/26.
//

import SwiftUI

struct DetailRow: View {
    let label: String
    let value: String
    
    var body: some View {
        HStack {
            Text(label)
            Spacer()
            Text(value)
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    List {
        DetailRow(label: "Region", value: "North India")
    }
}
