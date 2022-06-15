//
//  HomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 14/12/21.
//
import SwiftUI
import CoreData

//enum DealType: Int, CaseIterable, Identifiable {
//
//    case purchase
//    case sale
//    case rent
//}
//
//extension DealType {
//
//    var id: UUID {
//        return UUID()
//    }
//
//    var name: String {
//        switch(self) {
//        case .purchase:
//            return "Purchase"
//        case .sale:
//            return "Sale"
//        case .rent:
//            return "Rent"
//        }
//    }
//}
//
//enum PaymentType: Int, CaseIterable, Identifiable {
//
//    case cash
//    case finance
//}
//
//extension PaymentType {
//
//    var id: UUID {
//        return UUID()
//    }
//
//    var name: String {
//        switch(self) {
//        case .cash:
//            return "Cash"
//        case .finance:
//            return "Finance"
//        }
//    }
//}


struct TabBarView: View {
    
    @ObservedObject var tabBarVM = TabBarViewModel()
    
    var body: some View {
        TabView(selection: $tabBarVM.selectedTab) {
            HomeView().navigationBarTitleDisplayMode(.inline)
                .tabItem {
                    Label("Home", systemImage: "house")
                        .background(.white)
                }
                .tag(TabBarViewModel.Tabs.home)
                
            
            DealDetailsView().navigationBarTitleDisplayMode(.inline)
                
                .tabItem {
                    Label("Create File", systemImage: "star")
                }
                .tag(TabBarViewModel.Tabs.dealDetailsForm)
               // .navigationBarTitleDisplayMode(.inline)
                           
            MapContentView()

                .tabItem {
                    Label("Map",systemImage: "map")
                }
                .tag(TabBarViewModel.Tabs.mapview)
                //.navigationBarTitleDisplayMode(.inline)
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle(tabBarVM.selectedTab.rawValue.capitalized)
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

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
            .previewDevice("iPhone 11")
        
    }
}



