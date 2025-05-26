//
//  DocumentView.swift
//  IDigit
//
//  Created by Nikolay Khort on 15.03.2024.
//

import SwiftUI

struct Document: Identifiable, Equatable {
    let id = UUID()
    let name: String
    let fullName: String
    let birthDate: String
    let issueDate: String
    let validTillDate: String
    let issuedBy: String
    let imageName: String

    static func == (lhs: Document, rhs: Document) -> Bool {
        return lhs.id == rhs.id
    }
}

struct DocumentsView: View {
    let documents: [Document] = [
        Document(name: "ID", fullName: "John Doe", birthDate: "06/04/1992", issueDate: "01/15/2015", validTillDate: "01/15/2025", issuedBy: "Government", imageName: "id_image"),
        Document(name: "Passport", fullName: "John Doe", birthDate: "06/04/1992", issueDate: "06/01/2013", validTillDate: "06/01/2023", issuedBy: "Passport Office", imageName: "passport_image"),
        Document(name: "Driver's License", fullName: "John Doe", birthDate: "06/04/1992", issueDate: "06/15/2014", validTillDate: "05/15/2024", issuedBy: "Department of Motor Vehicles", imageName: "license_image"),
        Document(name: "Social Security Card", fullName: "John Doe", birthDate: "06/04/1992", issueDate: "06/30/2016", validTillDate: "Permanent", issuedBy: "Social Security Administration", imageName: "social_security_image")
    ]

    let colors: [Color] = [.gray, .teal, .indigo, .blue] // Example colors
    @State private var isNewDocumentViewPresented = false
    
    var body: some View {
        let screenWidth = UIScreen.main.bounds.width
//        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ForEach(documents) { document in
                        NavigationLink(destination: DocumentsDetailedView(document: document)) {
                            DocumentCard(document: document, cardWidth: screenWidth - 30, cardColor: colors[documents.firstIndex(of: document)! % colors.count])
                        }
                    }
                }
                .padding()
            }
            .navigationBarTitle("Documents")
            .navigationBarItems(trailing:
                Button(action: {
                    self.isNewDocumentViewPresented.toggle()
                }) {
                    Image(systemName: "plus")
                }
            )
            .sheet(isPresented: $isNewDocumentViewPresented) {
                NewDocumentView(isNewDocumentViewPresented: $isNewDocumentViewPresented)
            }
//        }
    }
}

struct DocumentCard: View {
    let document: Document
    let cardWidth: CGFloat
    let cardColor: Color

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                Text(document.name)
                    .font(.headline)
                    .foregroundColor(.white)
                Text("Exp.: \(document.validTillDate)")
                    .foregroundColor(validityColor(for: document.validTillDate))
            }
            .padding()
            .frame(maxWidth: cardWidth * 0.8, alignment: .leading)

            Image(document.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 80, height: 80)
                .foregroundColor(.white)
                .padding()
        }
        .frame(width: cardWidth, alignment: .leading)
        .background(cardColor)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
    
    private func validityColor(for date: String) -> Color {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let validTillDate = formatter.date(from: date) {
            let today = Date()
            let twoMonthsFromNow = Calendar.current.date(byAdding: .month, value: 2, to: today) ?? today
            if today > validTillDate {
                return .red
            } else if validTillDate < twoMonthsFromNow {
                return .yellow
            }
        }
        return .black // Default color
    }
}

struct DocumentsDetailedView: View {
    let document: Document
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
                Text("\(document.name)")
                    .font(.title)
                    .bold()
                    .padding(.bottom, 5)
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text("Name: \(document.fullName)")
                        .font(.headline)
                    Text("BirthDate: \(document.birthDate)")
                        .font(.headline)
                    Text("Issue date: \(document.issueDate)")
                        .font(.headline)
                    Text("Expiry date: \(document.validTillDate)")
                        .font(.headline)
                        .foregroundColor(validityColor(for: document.validTillDate))
                }
                Spacer()
                Image("qr_code_image")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 100)
                    .padding()
//                Spacer()
            }
//            .padding(.vertical)
            Image(document.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding()
            Spacer()
            Text("Verified by iDigit: \(getVerificationDate())")
                .italic()
                .foregroundColor(.green)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private func getVerificationDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: Date())
    }
    
    private func validityColor(for date: String) -> Color {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        if let validTillDate = formatter.date(from: date) {
            let today = Date()
            let twoMonthsFromNow = Calendar.current.date(byAdding: .month, value: 2, to: today) ?? today
            if today > validTillDate {
                return .red
            } else if validTillDate < twoMonthsFromNow {
                return .yellow
            }
        }
        return .black // Default color
    }
    
}



#Preview {
    DocumentsView()
}

struct DocumentsDetailedView_Previews: PreviewProvider {
    static var previews: some View {
        let document = Document(name: "ID", fullName: "John Doe", birthDate: "06/04/1992", issueDate: "01/15/2015", validTillDate: "01/15/2025", issuedBy: "Government", imageName: "id_image")
        return DocumentsDetailedView(document: document)
    }
}
