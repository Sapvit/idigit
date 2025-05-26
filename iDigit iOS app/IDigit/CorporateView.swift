//
//  CorporateView.swift
//  IDigit
//
//  Created by Nikolay Khort on 26.03.2024.
//

import SwiftUI

struct Company {
    let name: String
    let role: String
    let LEINumber: String
    let registrationNumber: String
    let VATNumber: String
    let dateOfIncorporation: String
    let legalAddress: String
    let website: String
    let contactPhone: String
    let contactEmail: String
    let CEOName: String
    let attachments: [Attachment]
}

struct Attachment: Hashable {
    let name: String
    let image: String // This could be the image name or URL
}

struct CorporateView: View {
    let companies: [Company] = [
        Company(name: "GlobalTech Solutions Inc.",
                role: "CEO",
                LEINumber: "GT123456",
                registrationNumber: "GT-REG-123",
                VATNumber: "VAT-GT-789",
                dateOfIncorporation: "01/01/2015",
                legalAddress: "123 Main Street, Anytown, USA",
                website: "www.globaltech.com",
                contactPhone: "+1 (555) 123-4567",
                contactEmail: "info@globaltech.com",
                CEOName: "John Smith",
                attachments: [
                    Attachment(name: "Commercial Register Extract", image: "commercial_register"),
                    Attachment(name: "UBO Extract", image: "ubo_extract"),
                    Attachment(name: "Articles of Association", image: "articles_of_association")
                ]),
        Company(name: "Prime Financial Services Ltd.",
                role: "Administrator",
                LEINumber: "PF987654",
                registrationNumber: "PF-REG-456",
                VATNumber: "VAT-PF-456",
                dateOfIncorporation: "05/15/2018",
                legalAddress: "456 Oak Avenue, Metropolis, USA",
                website: "www.primefinancial.com",
                contactPhone: "+1 (555) 987-6543",
                contactEmail: "info@primefinancial.com",
                CEOName: "Sarah Johnson",
                attachments: [
                    Attachment(name: "Commercial Register Extract", image: "commercial_register"),
                    Attachment(name: "UBO Extract", image: "ubo_extract"),
                    Attachment(name: "Articles of Association", image: "articles_of_association")
                ])
    ]
    
    var body: some View {
//        NavigationView {
            List(companies, id: \.name) { company in
                NavigationLink(destination: CompanyDetailsView(company: company)) {
                    VStack(alignment: .leading) {
                        Text(company.name)
                            .font(.headline)
                        Text("Role: \(company.role)")
                            .font(.subheadline)
                    }
                }
            }
            .navigationBarTitle("Companies")
//        }
    }
}

struct CompanyDetailsView: View {
    let company: Company
    @State private var isAttachmentDetailViewPresented = false
    @State private var selectedAttachment: Attachment?
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Text(company.name)
                .font(.largeTitle)
                .bold()
            
            VStack(alignment: .leading, spacing: 15) {
//                Text("Company Information")
//                    .font(.title)
//                    .foregroundColor(.blue)
                Group {
                    InfoRow(title: "LEI Number", value: company.LEINumber)
                    InfoRow(title: "Registration Number", value: company.registrationNumber)
                    InfoRow(title: "VAT Number", value: company.VATNumber)
                    InfoRow(title: "Date of Incorporation", value: company.dateOfIncorporation)
                    InfoRow(title: "Legal Address", value: company.legalAddress)
                    InfoRow(title: "Website", value: company.website)
                    InfoRow(title: "Contact Phone", value: company.contactPhone)
                    InfoRow(title: "Contact Email", value: company.contactEmail)
                    InfoRow(title: "CEO", value: company.CEOName)
                }
            }
            
            Divider()
            
            HStack(spacing: 15) {
                Text("My Role:")
                    .font(.headline)
                    .foregroundColor(.blue)
                Text(company.role)
                    .font(.headline)
            }
            
            Spacer()
            
            HStack {
                Text("Attachments")
                    .font(.headline)
                    .foregroundColor(.blue)
                Spacer()
                Image(systemName: "plus.circle")
                    .font(.title)
                    .foregroundColor(.blue)
                    .onTapGesture {
                    }
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(company.attachments, id: \.self) { attachment in
                        AttachmentView(attachment: attachment)
                            .frame(width: 150)
                    }
                }
                .padding(.horizontal)
            }
            .sheet(isPresented: $isAttachmentDetailViewPresented) {
                if let attachment = selectedAttachment {
                    AttachmentDetailedView(attachment: attachment)
                }
            }
                
            Spacer()
            }
            .padding()
        }
//        .navigationBarTitle(company.name)
        .navigationBarItems(trailing:
        Button(action: {
            // Edit button action
        }) {
            Image(systemName: "pencil")
            }
        )
    }
}

struct AttachmentView: View {
    let attachment: Attachment
    
    var body: some View {
        VStack {
            Image(attachment.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 100)
                .cornerRadius(8)
                .padding(.bottom, 5)
            Text(attachment.name)
                .font(.caption)
        }
    }
}

struct AttachmentDetailedView: View {
    let attachment: Attachment
    
    var body: some View {
        VStack {
            if let image = UIImage(named: attachment.image) { // Attempt to load the image from name
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            } else {
                Text("Image not found") // Handle the case where the image couldn't be loaded
            }
            Text(attachment.name)
                .font(.title)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Attachment Details")
    }
}

struct InfoRow: View {
    var title: String
    var value: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.headline)
                .foregroundColor(.blue)
            Spacer()
            Text(value)
                .font(.body)
        }
    }
}



#Preview {
    CorporateView()
}

struct CompanyDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let company = Company(
            name: "Tech Innovations Inc.",
            role: "CEO",
            LEINumber: "1234567890",
            registrationNumber: "REG123456",
            VATNumber: "VAT123456",
            dateOfIncorporation: "January 1, 2000",
            legalAddress: "123 Main Street, City, Country",
            website: "https://techinnovations.com",
            contactPhone: "+1 (123) 456-7890",
            contactEmail: "info@techinnovations.com",
            CEOName: "John Smith",
            attachments: [
                Attachment(name: "Commercial Register Extract", image: "commercial_register"),
                Attachment(name: "UBO Extract", image: "ubo_extract"),
                Attachment(name: "Articles of Association", image: "articles_of_association")
            ]
        )
        
        return NavigationView {
            CompanyDetailsView(company: company)
        }
    }
}
