//
//  SignUpViewModel.swift
//  Real Estate App
//
//  Created by arifashraf on 16/12/21.
//
import SwiftUI
import CoreData

class SignUpViewModel: ObservableObject {
    
    //SignUp Field Properties
    @Published var agencyName: String = ""
    @Published var agencyAddress: String = ""
    @Published var city: String = ""
    @Published var zipCode: String = ""
    @Published var numberOfEmployees: String = ""
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var email: String = ""
    @Published var isSignUpValid: Bool = false
    @Published var shouldShowSignUpAlert: Bool = false
    @Published var contactPersonFirstName: String = ""
    @Published var contactPersonLastName: String = ""
    @Published var contactPersonEmail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    //Picker Logic
    @Published var selectedState: String = "Select"
    @Published var selectedContactMe: String = "Select"
    @Published var selectedBusinessType: String = "Select"
    @Published var selectedDealsType: String = "Select"
    @Published var selectedDealingState: String = "Select"
    @Published var selectedBusinessLocation: String = "String"
    
    //Sign Up Validation
    
    func isEmailValid() -> Bool {
        let emailTest = NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}")
        return emailTest.evaluate(with: email)
    }
    
    func isPasswordValid() -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", ".{8,}")
        return passwordTest.evaluate(with: password)
    }
    
    var isSignUpComplete: Bool {
        if !isEmailValid() ||
            !isPasswordValid() || self.agencyName.isEmpty || self.agencyAddress.isEmpty || self.city.isEmpty || self.selectedState.isEmpty || self.zipCode.isEmpty || self.selectedBusinessType.isEmpty || self.selectedDealsType.isEmpty || self.selectedBusinessLocation.isEmpty || self.selectedDealingState.isEmpty || self.numberOfEmployees.isEmpty || self.firstName.isEmpty || self.lastName.isEmpty || self.email.isEmpty || self.selectedContactMe.isEmpty || self.contactPersonFirstName.isEmpty || self.contactPersonLastName.isEmpty || self.contactPersonEmail.isEmpty ||  self.password.isEmpty || self.confirmPassword.isEmpty || self.password != self.confirmPassword {
            return false
        }
        return true
    }
    
    //MARK: Validation Prompt
//    var emailPrompt: String {
//        if isEmailValid() {
//            return ""
//        } else {
//            return "Enter a valid email address"
//        }
//    }
//
//    var passwordPrompt: String {
//        if isPasswordValid() {
//            return ""
//        } else {
//            return ""
//        }
//    }
    
    //MARK: Picker View Properties
    let contactMe = ["Select",
                     "Yes",
                     "No"
    ]
    
    let businessType = ["Select",
                         "Buider",
                         "Property Broker"
    ]
    
    let dealsType = ["Select",
                     "Buy/Sell",
                     "Rent"
    ]
    
    let states: [String] = ["Select",
                  "Andaman and Nicobar Island",
                  "Andhra Pradesh",
                  "Arunachal Pradesh",
                  "Assam",
                  "Bihar",
                  "Chandigarh",
                  "Chhattisgarh",
                  "Delhi",
                  "Goa",
                  "Gujarat",
                  "Haryana",
                  "Himachal Pradesh",
                  "Jammu and Kashmir",
                  "Jharkhand",
                  "Karnataka",
                  "Kerala",
                  "Ladakh",
                  "Lakshadweep",
                  "Madhya Pradesh",
                  "Maharashtra",
                  "Manipur",
                  "Meghalaya",
                  "Mizoram",
                  "Nagaland",
                  "Odisha",
                  "Puducherry",
                  "Punjab",
                  "Rajasthan",
                  "Sikkim",
                  "Tamil Nadu",
                  "Telangana",
                  "Tripura",
                  "Uttarakhand",
                  "Uttar Pradesh",
                  "West Bengal"
    ]
    
    let businessLocation: [String] = ["Select",
                  "Andaman and Nicobar Island",
                  "Andhra Pradesh",
                  "Arunachal Pradesh",
                  "Assam",
                  "Bihar",
                  "Chandigarh",
                  "Chhattisgarh",
                  "Delhi",
                  "Goa",
                  "Gujarat",
                  "Haryana",
                  "Himachal Pradesh",
                  "Jammu and Kashmir",
                  "Jharkhand",
                  "Karnataka",
                  "Kerala",
                  "Ladakh",
                  "Lakshadweep",
                  "Madhya Pradesh",
                  "Maharashtra",
                  "Manipur",
                  "Meghalaya",
                  "Mizoram",
                  "Nagaland",
                  "Odisha",
                  "Puducherry",
                  "Punjab",
                  "Rajasthan",
                  "Sikkim",
                  "Tamil Nadu",
                  "Telangana",
                  "Tripura",
                  "Uttarakhand",
                  "Uttar Pradesh",
                  "West Bengal"
    ]
    
    let dealingStates: [String] = ["Select",
                  "Andaman and Nicobar Island",
                  "Andhra Pradesh",
                  "Arunachal Pradesh",
                  "Assam",
                  "Bihar",
                  "Chandigarh",
                  "Chhattisgarh",
                  "Delhi",
                  "Goa",
                  "Gujarat",
                  "Haryana",
                  "Himachal Pradesh",
                  "Jammu and Kashmir",
                  "Jharkhand",
                  "Karnataka",
                  "Kerala",
                  "Ladakh",
                  "Lakshadweep",
                  "Madhya Pradesh",
                  "Maharashtra",
                  "Manipur",
                  "Meghalaya",
                  "Mizoram",
                  "Nagaland",
                  "Odisha",
                  "Puducherry",
                  "Punjab",
                  "Rajasthan",
                  "Sikkim",
                  "Tamil Nadu",
                  "Telangana",
                  "Tripura",
                  "Uttarakhand",
                  "Uttar Pradesh",
                  "West Bengal"
    ]
    

    func save() {
        let user = User(context: CoreDataManager.shared.viewContext)
        
        user.contactPersonEmail = contactPersonEmail
        user.password = password
        user.agencyName = agencyName
        user.agencyAddress = agencyAddress
        user.city = city
        user.state = selectedState
        user.zipCode = zipCode
        user.businessType = selectedBusinessType
        user.dealsType = selectedDealsType
        user.businessLocation = selectedBusinessLocation
        user.dealingStates = selectedDealingState
        user.numberOfEmployees = numberOfEmployees
        user.firstName = firstName
        user.lastName = lastName
        user.email = email
        user.contactMe = selectedContactMe
        user.contactPersonFirstName = contactPersonFirstName
        user.contactPersonLastName = contactPersonLastName
        
        CoreDataManager.shared.save()
        
        let fetchRequest = LoggedInUser.shared.fetch
        let users = try? CoreDataManager.shared.viewContext.fetch(fetchRequest)
        LoggedInUser.shared.currentUser = users?.last
        if users == [] {
            print("No data")
        } else {
            print("Data available")
            print(users as Any)
        }
    }

    
}
