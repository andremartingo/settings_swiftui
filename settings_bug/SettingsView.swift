//
//  SettingsView.swift
//  settings_bug
//
//  Created by Andre Martingo on 19.06.20.
//  Copyright © 2020 Andre Martingo. All rights reserved.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    
    @ObservedObject
    var viewModel: ViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.state.info) { section in
                Section(header: Text(" ")) {
                    ForEach(section.cells) { element in
                        VStack {
                            Text(element.title)
                                .frame(height: 50)
                       }
                    }
                }
           }
        }.listStyle(GroupedListStyle())
    }
}

#if DEBUG
struct SettingsView_Previews : PreviewProvider {
    
    static var previews: some View {
        SettingsView(viewModel: ViewModel())
            .previewLayout(.device) // iPhone SE landscape size

    }
}
#endif


