//
//  ContactsView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct Contact: Identifiable {
    let id = UUID()
    let name: String
    let type: String
}

struct ContactsView: View {
    let contacts: [Contact] = [
            Contact(name: "Johnson & Sons LLC", type: "Legal Entity"),
            Contact(name: "Smith & Co. Law Firm", type: "Legal Entity"),
            Contact(name: "Williams Group Holdings", type: "Legal Entity"),
            Contact(name: "Anderson Corporation", type: "Legal Entity"),
            Contact(name: "Brown Investments Ltd.", type: "Legal Entity"),
            Contact(name: "XYZ Legal Services", type: "Legal Entity"),
            Contact(name: "ABC Consulting Group", type: "Legal Entity"),
            Contact(name: "Global Ventures Inc.", type: "Legal Entity"),
            Contact(name: "Evergreen Enterprises", type: "Legal Entity"),
            Contact(name: "Peak Performance Partners", type: "Legal Entity"),
            Contact(name: "John Smith", type: "Person"),
            Contact(name: "Emily Johnson", type: "Person"),
            Contact(name: "David Williams", type: "Person"),
            Contact(name: "Sarah Brown", type: "Person"),
            Contact(name: "Michael Anderson", type: "Person"),
            Contact(name: "Jessica Taylor", type: "Person"),
            Contact(name: "Daniel White", type: "Person"),
            Contact(name: "Olivia Clark", type: "Person"),
            Contact(name: "Matthew Martinez", type: "Person"),
            Contact(name: "Sophia Lee", type: "Person"),
            Contact(name: "James Wilson", type: "Person"),
            Contact(name: "Grace Harris", type: "Person"),
            Contact(name: "Christopher Evans", type: "Person"),
            Contact(name: "Ava Rodriguez", type: "Person"),
            Contact(name: "Liam Garcia", type: "Person"),
            Contact(name: "Charlotte Thomas", type: "Person"),
            Contact(name: "Lucas Walker", type: "Person")
        ]
    
    var body: some View {
        NavigationView {
            List(contacts) { contact in
                VStack(alignment: .leading) {
                    Text(contact.name)
                        .font(.headline)
                    Text(contact.type)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
            }
            .navigationBarTitle("Contacts")
        }
    }
}


#Preview {
    ContactsView()
}
