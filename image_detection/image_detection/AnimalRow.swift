//
//  AnimalRow.swift
//  image_detection
//
//  Created by X Y on 3/22/21.
//

import SwiftUI

struct AnimalRow: View {
    var imageLabel: String
    var confidence: Double
    
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(Color.white)
                .cornerRadius(10)
                .shadow(color: .gray, radius: 5, x: 0, y:5 )
            
            VStack {
                HStack {
                    Text(imageLabel)
                        .bold()
                    Spacer()
                    Text(
                        String(format: "%.2f%%", confidence * 100)
                    )
                    .bold()
                }
            
            
            ProgressBar(value: confidence)
                .frame(height: 10)
        }
        .padding(10)
    }
}
}

struct AnimalRow_Previews: PreviewProvider {
    static var previews: some View {
        AnimalRow(imageLabel: "Husky", confidence: 0.24)
            .previewLayout(.fixed(width: 300, height: 70))
    }
}
