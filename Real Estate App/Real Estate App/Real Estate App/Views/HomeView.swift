//
//  HomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 14/12/21.
//
import SwiftUI
import CoreData

enum DealType: Int, CaseIterable, Identifiable {
    
    case purchase
    case sale
    case rent
}

extension DealType {
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        switch(self) {
        case .purchase:
            return "Purchase"
        case .sale:
            return "Sale"
        case .rent:
            return "Rent"
        }
    }
}

enum PaymentType: Int, CaseIterable, Identifiable {
    
    case cash
    case finance
}

extension PaymentType {
    
    var id: UUID {
        return UUID()
    }
    
    var name: String {
        switch(self) {
        case .cash:
            return "Cash"
        case .finance:
            return "Finance"
        }
    }
}

enum Tabs: String {
    case home
    case dealDetailsForm = "Deal Details Form"
}

struct HomeView: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedTab: Tabs = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            HomeView1()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(Tabs.home)
      
            DealDetailsView()
                .tabItem {
                    Label("Create File", systemImage: "star")
                }
                .tag(Tabs.dealDetailsForm)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(selectedTab.rawValue.capitalized)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            NavigationLink(destination: LoginView().navigationBarHidden(true)
                            .onAppear(perform: {
                LoggedInUser.shared.currentUser = nil
            }), label: {
                Text("Log Out")
            })
        }
    }
    
}

struct HomeView1: View {
    
    @ObservedObject var homeVM = HomeViewModel()
    
    @State var selectedDealType: DealType = .purchase
    @State var selectedPaymentType: PaymentType = .cash
    
    var body: some View {
        Text("Existing Deals")
        
        
        
    }
    
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .previewDevice("iPhone 11")
        
    }
}


