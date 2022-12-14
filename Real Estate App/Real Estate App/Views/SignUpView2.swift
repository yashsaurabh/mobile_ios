//
//  SignUpView2.swift
//  Real Estate App
//
//  Created by arifashraf on 25/01/22.
//

import SwiftUI

struct SignUpView2: View {
    
    @ObservedObject var signUpVM = SignUpViewModel.shared
    
    var body: some View {
        
        VStack {
            
            Text("A little bit about yourself")
                .fontWeight(.bold)
                .font(.system(size: 20))
            
            VStack {
                HStack {
                    Text("First Name")
                        .foregroundColor(.gray)
                    Text("*")
                        .foregroundColor(.red)
                    
                }
                
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                TextField("Enter First Name", text: $signUpVM.contactPersonFirstName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
            }
            
            .padding()
            
            VStack {
                HStack {
                    Text("Last Name")
                        .foregroundColor(.gray)
                    Text("*")
                        .foregroundColor(.red)
                    
                }
                
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                TextField("Enter Last Name", text: $signUpVM.contactPersonLastName)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
                
            }
            .padding()
            
            VStack{
                HStack{
                    Text("Email")
                        .foregroundColor(.gray)
                    Text("*")
                        .foregroundColor(.red)
                    
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                TextField("Enter Email Address", text: $signUpVM.contactPersonEmail)
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 0)
                                .stroke(lineWidth: 1)
                                .foregroundColor(.gray))
                    .textInputAutocapitalization(.never)
                
                HStack {
                    Text("Password")
                        .foregroundColor(.gray)
                    Text("*")
                        .foregroundColor(.red)
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top, 30)
                
                EntryField(sfSymbolName: "lock.fill", placeHolder: "Enter Password", prompt: signUpVM.passwordPrompt, field: $signUpVM.password, isSecure: true)
                
                
                HStack {
                    Text("Confirm Password")
                        .foregroundColor(.gray)
                    Text("*")
                        .foregroundColor(.red)
                }
                .padding(.top, 30)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                
                EntryField(sfSymbolName: "lock.fill", placeHolder: "Enter Password Again", prompt: signUpVM.confirmPasswordPrompt, field: $signUpVM.confirmPassword, isSecure: true)
            }
            .padding()
            
            VStack {
                NavigationLink(destination: WelcomeView().onAppear(perform: {
                    signUpVM.clear()
                }),
                               isActive: self.$signUpVM.isSignUpPartTwoValid)
                {
                    Text("SIGN UP")
                        .padding()
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .background(Color("CustomDarkBlue"))
                        .onTapGesture
                    {
                        //Determine SignUp Validity
                        let isSignUpPartTwoValid = self.signUpVM.isSignUpDetailsPartTwoComplete
                        
                        //Trigger Logic
                        if isSignUpPartTwoValid {
                            //Trigger NavigationLink
                            self.signUpVM.isSignUpPartTwoValid = true
                            self.signUpVM.save()
                            print(FileManager.default.urls(for: FileManager.SearchPathDirectory.documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask))
                        }
                        else {
                            self.signUpVM.shouldShowSignUpAlert = true //trigger Alert
                        }
                    }
                }
                .padding([.leading, .trailing], 15)
                .alert(isPresented: $signUpVM.shouldShowSignUpAlert) {
                    if signUpVM.contactPersonFirstName.isEmpty {
                        return Alert(title: Text("First Name is Empty"))
                    } else if signUpVM.contactPersonLastName.isEmpty {
                        return Alert(title: Text("Last Name is Empty"))
                    } else if signUpVM.contactPersonEmail.isEmpty {
                        return Alert(title: Text("Email is Empty"))
                    } else if !signUpVM.isEmailValid(email: signUpVM.contactPersonEmail) {
                        return Alert(title: Text("Invalid Email"))
                    } else if !signUpVM.isPasswordValid(password: signUpVM.password) {
                        return Alert(title: Text("Password must be 8 characters long"))
                    } else if signUpVM.confirmPassword.isEmpty {
                        return Alert(title: Text("Enter password again"))
                    }
                    return Alert(title: Text("All fields are mandatory to fill"))
                }
            }
        }
    }
    
}

struct SignUpView2_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView2()
    }
}
