//
//  HomeViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 29/12/21.
//

import Foundation

class HomeViewModel: ObservableObject {
    
    @Published var propertyAddress: String = ""
    @Published var dealNumber: String = ""
    
    
    func fetch() {
        
    }
}
