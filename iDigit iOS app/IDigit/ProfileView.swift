//
//  ProfileView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        VStack {
            HStack {
                Text("Jon Doe")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                .padding()
                Spacer()
            }
            HStack {
                Text("Date of Birth: June 04, 1992")
                    .padding(.horizontal)
                Spacer()
            }
            Divider()
            VStack(alignment: .leading, spacing: 10) {
                Text("About Me:")
                    .font(.headline)
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec at felis sit amet metus lacinia euismod. Ut tristique massa a nulla dictum, a euismod neque eleifend. Sed nec aliquam nunc. Integer quis libero sit amet justo laoreet ultrices. Fusce nec metus id velit pretium tempus. Nullam sit amet sem ut est vehicula consequat in nec ante. Aenean fermentum augue at dolor venenatis, vel vehicula nisi tristique. Aliquam erat volutpat.")
            }
            .padding()
            Divider()
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Contact Information:")
                        .font(.headline)
                    Text("Email: jon.doe@example.com")
                    Text("Phone: +1 (555) 123-4567")
                }
                .padding()
                Spacer()
            }
            Spacer()
        }
        .navigationBarTitle("Profile")
        .navigationBarItems(trailing:
            Button(action: {
                // Edit button action
            }) {
                Image(systemName: "pencil")
            }
        )
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
