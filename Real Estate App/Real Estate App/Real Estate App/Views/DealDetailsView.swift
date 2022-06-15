//
//  DealDetailsView.swift
//  Real Estate App
//
//  Created by arifashraf on 28/12/21.
//

import SwiftUI
import Combine

struct DealDetailsView: View {
    @ObservedObject var detailVM = DealDetailsViewModel()
    @Environment(\.dismiss) var dismiss
    @State private var isShowPhotoLibrary = false
   
    
    var body: some View {
        
        ScrollView {
            
            VStack{
                
                Divider()
                    .frame(minWidth: 0,maxWidth:100)
                    .background(Color("CustomDarkBlue"))
                    .foregroundColor(.gray)
                
                    .padding()
                
                VStack {
                    HStack{
                        Text("File Number")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    }
                    TextField("SP-05-AT-16122021", text: $detailVM.fileNumber)
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                        .keyboardType(.numberPad)
                }
                .padding()
                
                VStack{
                    HStack{
                        Text("Property Type")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedPropertyType,
                        label: Text(detailVM.selectedPropertyType),
                        content: {
                            ForEach(detailVM.propertyType,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding()
                
                VStack{
                    HStack{
                        Text("Transaction Type")
                            .foregroundColor(.gray)
                    }
                    .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                    Picker(
                        selection: $detailVM.selectedTransactionType,
                        label: Text(detailVM.selectedTransactionType),
                        content: {
                            ForEach(detailVM.transactionType,id: \.self) { option in
                                Text(option)
                                    .tag(option)
                            }
                        })
                        .pickerStyle(MenuPickerStyle())
                        .padding()
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .border(Color.gray)
                    
                }
                .padding()
                // SWITCH Controller
                VStack {
                    Toggle(isOn: $detailVM.isToggle){
                        Text("Cash only")
                            .foregroundColor(Color.gray)
                    }
                }
                .padding()
                VStack{
                    Toggle(isOn: $detailVM.isToggle1){
                        Text("Cash+Finance")
                            .foregroundColor(Color.gray)
                    }
                }
                .padding()
                
                
            }
            
            VStack{
                HStack {
                    
                    Text("Sales Price")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                }
                TextField("$ 0,000,000.00", text: $detailVM.salesPrice)
                    .padding()
                    .keyboardType(.numberPad)
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
            }
            .padding()
            
            VStack{
                
                HStack{
                    
                    Text("Loan Amount")
                        .foregroundColor(.gray)
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                TextField("$ 0,000,000.00", text: $detailVM.loanAmount)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
                    .keyboardType(.numberPad)
            }
            .padding()
            
            VStack{
                
                Text("Booking Date")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                DatePicker("Select a date:", selection: $detailVM.selectedBookingDate, displayedComponents: [.date])
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
                
            }
            
            .padding()
            VStack{
                
                Text("Deal Closing Date")
                    .foregroundColor(.gray)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                DatePicker("Select a date:", selection: $detailVM.selectedDealClosingDate, displayedComponents: [.date])
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
                    .datePickerStyle(.compact)
            }
            .padding()
            
            
            VStack{
                HStack{
                    Text("Finance Institute")
                        .foregroundColor(.gray)
                    
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                TextField("Select", text: $detailVM.financeInstitute)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
            }
            .padding()
            
            
            VStack{
                
                VStack {
                    
                    Text("Contact Details       --")
                    
                    VStack {
                        HStack{
                            Text("Deal Agent Name")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("Enter here...", text: $detailVM.dealAgentName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    .padding()
                    
                    VStack{
                        HStack {
                            Text("Agency Owner Name")
                                .foregroundColor(.gray)
                            
                            
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("Enter here...", text: $detailVM.agencyOwnerName)
                        
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    
                    .padding()
                    
                    VStack{
                        HStack{
                            
                            Text("Mobile Number of Deal Agent")
                                .foregroundColor(.gray)
                            
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        
                        TextField("XXX-XXX-XXXX", text:$detailVM.mobileNoDealAgent)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    
                    VStack{
                        HStack {
                            
                            Text("Agency Contact Number")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                        }
                        TextField("XXX-XXX-XXXX", text: $detailVM.agencyContactNumber)
                            .padding()
                            .keyboardType(.numberPad)
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    .padding()
                    
                    VStack {
                        
                        Text("Property Details       --")
                        
                        VStack {
                            HStack{
                                Text("Select property")
                                    .foregroundColor(.gray)
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Select", text: $detailVM.selectProperty)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                        
                        VStack{
                            HStack {
                                Text("Property Address")
                                    .foregroundColor(.gray)
                                
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Enter here..", text: $detailVM.propertyAddress)
                            
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        
                        .padding()
                        
                        VStack {
                            HStack{
                                Text("City")
                                    .foregroundColor(.gray)
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Enter", text: $detailVM.city)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                        
                        VStack{
                            HStack {
                                Text("State")
                                    .foregroundColor(.gray)
                                
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Select", text: $detailVM.state)
                            
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        
                        .padding()
                        
                        VStack{
                            HStack{
                                
                                Text("Zip code")
                                    .foregroundColor(.gray)
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            
                            TextField("XXXXX", text:$detailVM.zipcode)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                                .keyboardType(.numberPad)
                                .onReceive(Just(self.detailVM.zipcode)) { inputValue in
                                    if inputValue.count > 6 {
                                        self.detailVM.zipcode.removeLast()
                                    }
                                }
                        }
                        .padding()
                        
                        VStack{
                            HStack {
                                
                                Text("Country")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                
                            }
                            TextField("Enter", text: $detailVM.country)
                                .padding()
                            
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                        
                        VStack {
                            HStack{
                                Text("Municipality")
                                    .foregroundColor(.gray)
                                
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            }
                            TextField("Enter", text: $detailVM.municipality)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                    }
                    
                    VStack{
                        HStack {
                            Text("Subdivision")
                                .foregroundColor(.gray)
                            
                            
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        TextField("Enter", text: $detailVM.subdivision)
                        
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    .padding()
                    
                    VStack{
                        HStack{
                            
                            Text("Lot")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        }
                        
                        TextField("Enter", text:$detailVM.lot)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    
                }
                VStack{
                    VStack{
                        HStack {
                            
                            Text("Parcel ID")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            
                        }
                        TextField("Enter", text: $detailVM.parcel)
                            .padding()
                            .keyboardType(.numberPad)
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    .padding()
                    
                    // property Image
                    
                    VStack {
                        Text("Property Image")
                            .foregroundColor(.gray)
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .padding()
                        
                        HStack {
                            
                            Button(action: {
                                self.isShowPhotoLibrary = true
                            }) {
                                VStack {
                                    Image(systemName: "square.and.arrow.up")
                                        .font(.system(size: 20))
                                    
                                    Text("Upload Photo")
                                        .font(.body)
                                    
                                }
                                .frame(width: 100, height: 100, alignment: .center)
                                .background(.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .padding(.trailing,90)
                            }
                            
                            
                            Image(uiImage:detailVM.image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100, alignment: .trailing)
                                .cornerRadius(10)
                               
                                
                        }
                        
                    }.sheet(isPresented: $isShowPhotoLibrary) {
                        ImagePicker(sourceType: .photoLibrary, selectedImage: $detailVM.image)
                    }
                    
                   
                    VStack{
                        
                        HStack{
                            Text("Buyer Details   -")
                                .padding()
                        }
                        
                        VStack{
                            HStack{
                                Text("Buyer Type")
                                    .foregroundColor(.gray)
                            }
                            
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            Picker(
                                selection: $detailVM.selectedBuyerType,
                                label: Text(detailVM.selectedBuyerType),
                                content: {
                                    ForEach(detailVM.buyerType,id: \.self) { option in
                                        Text(option)
                                            .tag(option)
                                    }
                                })
                                .pickerStyle(MenuPickerStyle())
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .border(Color.gray)
                            
                        }
                        .padding()
                        
                        VStack{
                            HStack{
                                Text("First Name")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                            TextField("Enter",text: $detailVM.buyerFirstName)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                            
                        }
                        .padding()
                        
                        VStack{
                            HStack{
                                Text("Middle Name")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                            TextField("Enter",text: $detailVM.buyerMiddleName)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                        
                        VStack{
                            HStack{
                                Text("Last Name")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                            
                            TextField("Enter",text: $detailVM.buyerLastName)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                        
                        
                        
                        HStack{
                            Text("Seller Details     -")
                                .padding()
                        }
                        
                        VStack{
                            HStack{
                                Text("Seller Type")
                                    .foregroundColor(.gray)
                            }
                            .frame(minWidth: 0,maxWidth: .infinity,alignment: .leading)
                            Picker(
                                selection: $detailVM.selectedSellerType,
                                label: Text(detailVM.selectedSellerType),
                                content: {
                                    ForEach(detailVM.sellerType,id: \.self) { option in
                                        Text(option)
                                            .tag(option)
                                    }
                                })
                                .pickerStyle(MenuPickerStyle())
                                .padding()
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .border(Color.gray)
                            
                        }
                        .padding()
                        
                        VStack {
                            Text("First Name")
                                .foregroundColor(.gray)
                                .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                            
                            TextField("Enter",text: $detailVM.sellerFirstName)
                                .padding()
                                .overlay(RoundedRectangle(cornerRadius: 0)
                                            .stroke(lineWidth: 1)
                                            .foregroundColor(.gray))
                        }
                        .padding()
                    }
                    
                    VStack{
                        HStack{
                            Text("Middle Name")
                                .foregroundColor(.gray)
                        }
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                        TextField("Enter",text: $detailVM.sellerMiddleName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                        
                    }
                    .padding()
                    
                    
                    VStack{
                        HStack{
                            Text("Last Name")
                                .foregroundColor(.gray)
                        }
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                        TextField("Enter",text: $detailVM.sellerLastName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                        
                    }
                    .padding()
                    
                    HStack{
                        Text("Lender Details   -")
                            .padding()
                    }
                    
                    VStack{
                        HStack{
                            Text("Lender Name")
                                .foregroundColor(.gray)
                        }
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                        TextField("Enter",text: $detailVM.lenderName)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                    }
                    .padding()
                    
                    VStack{
                        HStack{
                            Text("Loan Number")
                                .foregroundColor(.gray)
                        }
                        .frame(minWidth:0,maxWidth:.infinity,alignment: .leading)
                        TextField("Enter",text: $detailVM.loanNumber)
                            .padding()
                            .overlay(RoundedRectangle(cornerRadius: 0)
                                        .stroke(lineWidth: 1)
                                        .foregroundColor(.gray))
                            .keyboardType(.numberPad)
                    }
                    .padding()
                    
                    VStack {
                        NavigationLink(destination: HomeView(),
                                       isActive: self.$detailVM.isDealDetailValid)
                        {
                            Text("SIGN UP")
                                .padding()
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color("CustomDarkBlue"))
                                .onTapGesture
                            {
                                //Determine DealDetail Validity
                                
                                let isDealdetailValid = self.detailVM.isDealDetailsComplete
                                
                                //Trigger Logic
                                if isDealdetailValid {
                                    //Trigger NavigationLink
                                    self.detailVM.isDealDetailValid = true
                                    self.detailVM.saveDeals()
                                    print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
                                }
                                else {
                                    self.detailVM.shouldShowDealDetailAlert = true //trigger Alert
                                }
                            }
                        }
                        .padding([.leading, .trailing], 15)
                        .alert(isPresented: $detailVM.shouldShowDealDetailAlert) {
                            Alert(title: Text("All fields are mandatory to fill"))
                        }
                    }
                        .padding()
                }
            }
        }
    }
}
struct DealDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DealDetailsView()
    }
}
