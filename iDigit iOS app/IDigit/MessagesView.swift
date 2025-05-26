//
//  MessagesView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct Message: Identifiable {
    let id = UUID()
    let from: String
    let date: String
    var isRead: Bool
}

struct MessageRow: View {
    let message: Message
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(message.from)
                    .font(.headline)
                Text(message.date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
            if !message.isRead {
                Circle()
                    .fill(Color.blue)
                    .frame(width: 10, height: 10)
            }
        }
        .padding()
    }
}

struct MessagesView: View {
    @State private var selectedTab: String = "Documents"
    
    let incomingDocuments: [Message] = [
        Message(from: "Law Offices of Johnson & Smith", date: "Mar 12, 2024", isRead: false),
        Message(from: "ABC Corporation", date: "Mar 11, 2024", isRead: true),
        Message(from: "XYZ Law Firm", date: "Mar 10, 2024", isRead: true),
        Message(from: "Global Investments Inc.", date: "Mar 9, 2024", isRead: true),
        Message(from: "Miller & Co. Legal Consultants", date: "Mar 8, 2024", isRead: true),
        Message(from: "International Business Alliance", date: "Mar 7, 2024", isRead: true)
    ]

    let qrScansHistory: [Message] = [
        Message(from: "Department of Homeland Security", date: "Mar 12, 2024", isRead: true),
        Message(from: "Federal Bureau of Investigation", date: "Mar 11, 2024", isRead: true),
        Message(from: "State Department of Motor Vehicles", date: "Mar 10, 2024", isRead: true),
        Message(from: "City Health Department", date: "Mar 9, 2024", isRead: true)
    ]

    let kycUpdateRequests: [Message] = [
        Message(from: "Bank of America", date: "Mar 12, 2024", isRead: false),
        Message(from: "J.P. Morgan Chase & Co.", date: "Mar 11, 2024", isRead: false),
        Message(from: "Coinbase", date: "Mar 10, 2024", isRead: true),
        Message(from: "Goldman Sachs", date: "Mar 9, 2024", isRead: true),
        Message(from: "Wells Fargo", date: "Mar 8, 2024", isRead: true),
        Message(from: "Morgan Stanley", date: "Mar 7, 2024", isRead: true),
        Message(from: "Citibank", date: "Mar 6, 2024", isRead: true),
        Message(from: "Robinhood", date: "Mar 5, 2024", isRead: true)
    ]

    
    var body: some View {
        TabView(selection: $selectedTab) {
            MessageListView(messages: incomingDocuments, iconName: "doc.on.doc.fill", tabName: "Documents")
                .tabItem {
                    Image(systemName: "doc.on.doc.fill")
                }
                .tag("Documents")
            
            MessageListView(messages: qrScansHistory, iconName: "qrcode", tabName: "QR requests")
                .tabItem {
                    Image(systemName: "qrcode")
                }
                .tag("QR requests")
            
            MessageListView(messages: kycUpdateRequests, iconName: "person.crop.circle.badge.checkmark", tabName: "KYC requests")
                .tabItem {
                    Image(systemName: "person.crop.circle.badge.checkmark")
                }
                .tag("KYC requests")
        }
        .navigationBarTitle(selectedTab)
    }
}


struct MessageListView: View {
    let messages: [Message]
    let iconName: String
    let tabName: String
    
    var body: some View {
        List(messages) { message in
            MessageRow(message: message)
        }
        .listStyle(PlainListStyle())
        .navigationBarTitle(Text(tabName), displayMode: .inline)
    }
}


#Preview {
    MessagesView()
}
