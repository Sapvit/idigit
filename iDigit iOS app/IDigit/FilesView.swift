//
//  FilesView.swift
//  IDigit
//
//  Created by Nikolay Khort on 21.03.2024.
//

import SwiftUI

struct File {
    let name: String
    let dateUploaded: String
    let category: String
    let destination: AnyView // Destination view
    let imageName: String
}

struct FilesView: View {
    let files: [File] = [
            File(name: "Register extract", dateUploaded: "Jan 14, 2024", category: "Personal documents", destination: AnyView(DetailedFileView(file: File(name: "Register extract", dateUploaded: "Jan 14, 2024", category: "Personal documents", destination: AnyView(Text("Detail view for Register extract")), imageName: "register_extract_image"))), imageName: "register_extract_image"),
            File(name: "TIN", dateUploaded: "Nov 23, 2016", category: "Personal documents", destination: AnyView(DetailedFileView(file: File(name: "TIN", dateUploaded: "Nov 23, 2016", category: "Personal documents", destination: AnyView(Text("Detail view for TIN")), imageName: "tin_image"))), imageName: "tin_image"),
            File(name: "Car docs", dateUploaded: "Feb 28, 2021", category: "Car documents", destination: AnyView(DetailedFileView(file: File(name: "Car docs", dateUploaded: "Feb 28, 2021", category: "Car documents", destination: AnyView(Text("Detail view for Car docs")), imageName: "car_docs_image"))), imageName: "car_docs_image"),
            File(name: "Car insurance", dateUploaded: "Feb 29, 2021", category: "Car documents", destination: AnyView(DetailedFileView(file: File(name: "Car insurance", dateUploaded: "Feb 29, 2021", category: "Car documents", destination: AnyView(Text("Detail view for Car insurance")), imageName: "car_insurance_image"))), imageName: "car_insurance_image"),
            File(name: "Power of Attorney", dateUploaded: "Sep 09, 2018", category: "Other", destination: AnyView(DetailedFileView(file: File(name: "Power of Attorney", dateUploaded: "Sep 09, 2018", category: "Other", destination: AnyView(Text("Detail view for Power of Attorney")), imageName: "power_of_attorney_image"))), imageName: "power_of_attorney_image"),
            File(name: "Car rental agreement", dateUploaded: "Apr 05, 2023", category: "Travel documents", destination: AnyView(DetailedFileView(file: File(name: "Car rental agreement", dateUploaded: "Apr 05, 2023", category: "Travel documents", destination: AnyView(Text("Detail view for Car rental agreement")), imageName: "car_rental_agreement_image"))), imageName: "car_rental_agreement_image"),
            File(name: "Booking confirmation", dateUploaded: "Apr 10, 2023", category: "Travel documents", destination: AnyView(DetailedFileView(file: File(name: "Booking confirmation", dateUploaded: "Apr 10, 2023", category: "Travel documents", destination: AnyView(Text("Detail view for Booking confirmation")), imageName: "booking_confirmation_image"))), imageName: "booking_confirmation_image")
        ]

    var body: some View {
        List {
            ForEach(files.reduce(into: [String: [File]]()) { dict, file in
                dict[file.category, default: []].append(file)
            }.sorted(by: { $0.key < $1.key }), id: \.key) { category, files in
                Section(header: Text(category)) {
                    ForEach(files, id: \.name) { file in
                        NavigationLink(destination: file.destination) {
                            VStack(alignment: .leading) {
                                Text(file.name)
                                    .font(.headline)
                                Text(file.dateUploaded)
                                    .italic()
                                    .foregroundColor(.gray)
                                    .font(.footnote)
                            }
                        }
                    }
                }
            }
        }
        .navigationBarTitle("Files")
        .navigationBarItems(trailing:
            Button(action: {
                
            }) {
                Image(systemName: "plus")
            }
        )
    }
}


#Preview {
    FilesView()
}


struct DetailedFileView: View {
    let file: File
    
    var body: some View {
        VStack {
            Text(file.name)
                .font(.title)
                .padding()
            Text("Uploaded: \(file.dateUploaded)")
                .foregroundColor(.gray)
                .italic()
                .padding(.bottom)
            Image(file.imageName) // Replace "document_image_name" with the name of the image in your assets
                .resizable()
                .scaledToFit()
                .padding()
            Spacer()
        }
        .navigationBarTitle("Document Details")
    }
}
