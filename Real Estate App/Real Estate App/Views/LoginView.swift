//
//  Login.swift
//  Real Estate App
//
//  Created by arifashraf on 08/12/21.
//

import SwiftUI

struct LoginView: View
{
    @ObservedObject var loginVM = LoginViewModel()
    
    var body: some View
    {
        NavigationView
        {
            ScrollView
            {
                VStack
                {
                    VStack {
                        Image("CompanyLogo")
                            .resizable()
                            .frame(width: 250, height: 50, alignment: .top)
                            .padding(.vertical, -50)
                            .padding(.bottom, 50)
                    }
                    
                    Text("Login")
                        .padding()
                    VStack(alignment: .leading, spacing: 8, content:
                            {
                        Text("Email Address")
                            .foregroundColor(.gray)
                        HStack
                        {
                            Image(systemName: "person")
                            TextField("Enter Email Address", text: $loginVM.email)
                                .textInputAutocapitalization(.never)
                                .keyboardType(.emailAddress)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                    })
                        .padding()
                    VStack(alignment: .center, spacing: 8, content:
                            {
                        HStack
                        {
                            Text("Password")
                                .foregroundColor(.gray)
                            Button(action: {}, label:
                                    {
                                Text("Forgot Password?")
                                    .hidden()
                            })
                                .frame(maxWidth: .infinity, alignment: .trailing)
                                .foregroundColor(Color("CustomDarkBlue"))
                        }
                        HStack
                        {
                            Image(systemName: "lock")
                            SecureField("Enter Password",text: $loginVM.password)
                        }
                        .padding()
                        .overlay(RoundedRectangle(cornerRadius: 0)
                                    .stroke(lineWidth: 1)
                                    .foregroundColor(.gray))
                        
                        //MARK: RememberMe Checkbox UI
                        Button(action:
                                {
                            //1. Save state
                            loginVM.checkState = !loginVM.checkState
                            print("State : \(loginVM.checkState) ")                       //self.loginVM.saveData()
                            
                        }) {
                            
                            HStack(alignment: .top, spacing: 10) {
                                
                                //2. Will update according to state
                                Rectangle()
                                    .fill(loginVM.checkState ? Color.secondary : Color.white)
                                    .background(loginVM.checkState ? Image(systemName: "checkmark") : Image(systemName: "square.fill"))
                                    .frame(width:20, height:20, alignment: .center)
                                    .cornerRadius(5)
                                    .border(.gray)
                                Text("Remember Me")
                                    .foregroundColor(.gray)
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .hidden()
                    })
                        .padding()
                    
                    //Login Validation, Navigation and Saving & Retrieving Data in User Defaults.
                    if loginVM.isLoginComplete {
                        NavigationLink(destination: TabBarView().onAppear() {
                            loginVM.saveData()
                        }, label: {
                            Text("SIGN IN")
                                .padding()
                                .foregroundColor(.init(UIColor.systemBackground))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color("CustomDarkBlue"))
                                .font(.body.bold())
                            
                        })
                            .padding([.leading, .trailing], 15)
                    }
                    
                    else {
                        NavigationLink(destination: TabBarView(), label: {
                            Text("SIGN IN")
                                .padding()
                                .foregroundColor(.white)
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .background(Color("CustomDarkBlue"))
                                .font(.body.bold())
                                .onTapGesture {
                                    let isLoginValid = self.loginVM.isLoginComplete
                                    if isLoginValid {
                                        self.loginVM.isLoginValid = true //trigger
                                    } else {
                                        self.loginVM.shouldShowLoginAlert = true //trigger Alert
                                        loginVM.saveData()
                                    }
                                    
                                }
                        })
                            .padding([.leading, .trailing], 15)
                            .alert(isPresented: $loginVM.shouldShowLoginAlert) {
                                if loginVM.email.isEmpty || loginVM.password.isEmpty {
                                    return Alert(title: Text("Email and Password is Mandatory"))
                                } else if !loginVM.isEmailValid(email: loginVM.email) {
                                    return Alert(title: Text("Invalid Email"))
                                } else if !loginVM.isPasswordValid(password: loginVM.password) {
                                    return Alert(title: Text("Invalid Password"))
                                } else if !loginVM.fetch(email: loginVM.email, password: loginVM.password) {
                                    return Alert(title: Text("User Does Not Exist"))
                                }
                                return Alert(title: Text("Email and Password is Mandatory"))
                            }
                    }
                    
                    Divider()
                        .padding([.leading, .trailing], 15)
                        .padding(.top, 20)
                    
                    VStack(alignment: .center, spacing: 8)
                    {
                        Text("New to the System?")
                            .frame(width: 186, height: 23, alignment: .center)
                            .foregroundColor(Color.gray)
                        NavigationLink(destination: SignUpView(), label:
                                        {
                            Text("SIGN UP NOW")
                                .padding()
                                .foregroundColor(Color("CustomDarkBlue"))
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .border(Color.gray)
                                .font(.body.bold())
                        })
                            .background(.white)
                    }
                    .padding([.leading, .trailing, .bottom], 15)
                    
                    HStack {
                        Image(systemName: "c.circle")
                        
                        Text("2021 UnicornC")
                    }
                    .foregroundColor(Color("CustomDarkBlue"))
                    .padding(.top, 100)
                    .font(.footnote)
                    .padding(.bottom, 100)
                }
                .onAppear(perform: {
                    loginVM.getData()
                })
            }
        }
        .navigationBarBackButtonHidden(true)
        .environment(\.horizontalSizeClass, .compact)
    }
}

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .previewDevice("iPhone 11")
                .previewInterfaceOrientation(.portrait)
            LoginView()
                .previewDevice("iPhone SE (2nd generation)")
                .previewInterfaceOrientation(.portrait)
            LoginView()
                .previewDevice("iPhone 8")
                .previewInterfaceOrientation(.portrait)
        }
    }
}
