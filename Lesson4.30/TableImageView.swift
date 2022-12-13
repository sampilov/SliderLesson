//
//  TableImageView.swift
//  Lesson4.30
//
//  Created by Сампилов Ильдар on 13.12.2022.
//

import SwiftUI

struct TableImageView: View {
    let size: CGSize
    
    var body: some View {
        Image(systemName: "table")
            .resizable()
            .frame(width: size.width, height: size.height)
    }
}

struct TableImageView_Previews: PreviewProvider {
    static var previews: some View {
        TableImageView(size: CGSize(width: 250, height: 250))
    }
}
