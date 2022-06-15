//
//  WelcomeView.swift
//  Real Estate App
//
//  Created by arifashraf on 15/12/21.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        
        VStack {
            Image("WelcomeLogo")
                .padding(.top, 200)
            
            Text("Congratulations! Your Registration is complete")
                .padding()
            
            
            Text("Contact Us")
                .padding()
            
            HStack {
                Image(systemName: "phone")
                Text("800-034-2525")
                    .foregroundColor(Color("CustomDarkBlue"))
            }
            .padding()
            
            HStack {
                Image(systemName: "envelope")
                Text("support@unicornc.com")
                    .foregroundColor(Color("CustomDarkBlue"))
            }
            .padding()
            
            Spacer(minLength: 50)
            
            NavigationLink(destination: LoginView().navigationBarHidden(true), label: {
                Text("Close")
                
            })
                .frame(minWidth: 0, maxWidth: .infinity)
                .padding()
                .border(.gray, width: 1)
                .foregroundColor(Color("CustomDarkBlue"))
                .background(.white)
                .navigationBarBackButtonHidden(true)
        }
        .padding()
        
        
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
