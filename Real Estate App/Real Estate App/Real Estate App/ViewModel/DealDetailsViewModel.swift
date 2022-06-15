//
//  DealDetailsViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 28/12/21.
//
import SwiftUI
import CoreData

class  DealDetailsViewModel : ObservableObject {
    // DealDetail  field property
    @Published var fileNumber: String = ""
    @Published var cashOnly: String = ""
    @Published var cashAndFinance: String = ""
    @Published var salesPrice: String = ""
    @Published var loanAmount: String  = ""
    @Published var bookingDate: String = ""
    @Published var dealClosingDate: String = ""
    @Published var financeInstitute: String = ""
    @Published var dealAgentName: String = ""
    @Published var agencyOwnerName: String = ""
    @Published var mobileNoDealAgent: String = ""
    @Published var agencyContactNumber: String = ""
    @Published var selectProperty: String = ""
    @Published var propertyAddress: String = ""
    @Published var city: String = ""
    @Published var state: String = ""
    @Published var zipcode: String = ""
    @Published var country: String = ""
    @Published var municipality: String = ""
    @Published var subdivision: String = ""
    @Published var lot: String = ""
    @Published var parcel: String = ""
    @Published var selectedBookingDate: Date = Date()
    @Published var selectedDealClosingDate: Date = Date()
    @Published var isToggle: Bool = true
    @Published var isToggle1: Bool = false
    @Published var shouldShowDealDetailAlert: Bool = false
    @Published var isDealDetailValid: Bool = false
    
    
    @Published var buyerFirstName: String = ""
    @Published var buyerMiddleName: String = ""
    @Published var buyerLastName: String = ""
    @Published var sellerFirstName: String = ""
    @Published var sellerMiddleName: String = ""
    @Published var sellerLastName: String = ""
    @Published var lenderName: String = ""
    @Published var loanNumber: String = ""
    
    // picker Logic
    @Published var selectedBuyerType: String = "Select"
    @Published var selectedSellerType: String = "Select"
    // Image property
    @Published var image = UIImage()
    
    @Published var selectedPropertyType: String = "Select"
    @Published var selectedTransactionType: String = "Select"
    
let propertyType = ["Select",
                    "Flat",
                    "Plot",
                    "Office"
]
    
    let transactionType = ["Select",
                           "Cash",
                           "Loan",
                           "Cash + Loan"
    ]
    
let sellerType = ["Select",
                  "Individual",
                  "Organization"
]


    var buyerType = ["Select",
                 "Individual",
                 "Organization"
]

    var isDealDetailsComplete: Bool {
        if self.fileNumber.isEmpty || self.salesPrice.isEmpty || self.loanNumber.isEmpty || self.bookingDate.isEmpty || self.dealClosingDate.isEmpty || self.financeInstitute.isEmpty || self.dealAgentName.isEmpty || self.agencyOwnerName.isEmpty || self.mobileNoDealAgent.isEmpty || self.agencyContactNumber.isEmpty || self.selectProperty.isEmpty || self.propertyAddress.isEmpty || self.city.isEmpty || self.state.isEmpty || self.zipcode.isEmpty || self.country.isEmpty || self.municipality.isEmpty || self.subdivision.isEmpty || self.lot.isEmpty || self.parcel.isEmpty || self.buyerFirstName.isEmpty || self.buyerMiddleName.isEmpty || self.buyerLastName.isEmpty || self.sellerFirstName.isEmpty || self.sellerMiddleName.isEmpty || self.sellerLastName.isEmpty || self.lenderName.isEmpty || self.loanNumber.isEmpty {
            return false
        }
        return true
    }
    
    
    
    func saveDeals() {
                
        let deal = Deal(context: CoreDataManager.shared.viewContext)
        
        deal.fileNumber = fileNumber
        deal.agencyContactNumber = agencyContactNumber
        deal.agencyOwnerName = agencyOwnerName
        deal.bookingDate = bookingDate
        deal.buyerFirstName = buyerFirstName
        deal.buyerLastName = buyerLastName
        deal.buyerMiddleName = buyerMiddleName
        deal.buyerType = selectedBuyerType
        deal.dealAgentMobileNumber = mobileNoDealAgent
        deal.dealAgentName = dealAgentName
        deal.dealClosingDate = dealClosingDate
        deal.financeInstitute = financeInstitute
        deal.lenderLoanNumber = loanNumber
        deal.lenderName = lenderName
        deal.loanAmount = loanAmount
        deal.propertyAddress = propertyAddress
        deal.propertyCity = city
        deal.propertyCountry = country
        deal.propertyLot = lot
        deal.propertyMunicipality = municipality
        deal.propertyParcelID = parcel
        deal.propertyState = state
        deal.propertySubdivision = subdivision
        deal.propertyType = selectedPropertyType
        deal.propertyZipCode = zipcode
        deal.salesPrice = salesPrice
        deal.selectProperty = selectProperty
        deal.sellerFirstName = sellerFirstName
        deal.sellerLastName = sellerLastName
        deal.sellerMiddleName = sellerMiddleName
        deal.sellerType = selectedSellerType
        deal.transactionType = selectedTransactionType

        
        LoggedInUser.shared.currentUser?.addToDeals(deal)
    
        CoreDataManager.shared.save()
    }
}
