//
//  DetailView.swift
//  Species
//
//  Created by Ramar Parham on 7/24/23.
//

import SwiftUI

struct DetailView: View {
    let species: Species
    var body: some View {
        VStack(alignment: .leading) {
            Text(species.name)
                .font(.largeTitle)
                .bold()
            
            Rectangle()
                .frame(height: 2)
                .frame(maxWidth: .infinity)
                .foregroundColor(.gray)
            Group {
                HStack(alignment: .top) {
                    Text("Classification:")
                        .bold()
                    Text(species.classification)
                }
                
                HStack(alignment: .top) {
                    Text("Designation:")
                        .bold()
                    Text(species.designation)
                }
                
                HStack(alignment: .top) {
                    Text("Height:")
                        .bold()
                    Text(species.average_height)
                    Spacer()
                    Text("Lifespan:")
                        .bold()
                    Text(species.average_lifespan)
                    
                    HStack(alignment: .top) {
                        Text("Language:")
                            .bold()
                        Text(species.language)
                    }
                    
                    HStack(alignment: .top) {
                        Text("Skin Color:")
                            .bold()
                        Text(species.skin_colors)
                    }
                    
                    HStack(alignment: .top) {
                        Text("Hair Colors:")
                            .bold()
                        Text(species.hair_colors)
                    }
                    
                    HStack(alignment: .top) {
                        Text("Eye Colors:")
                            .bold()
                        Text(species.eye_colors)
                    }
                
            }
            }
            .font(.title2)
            
            VStack {
                AsyncImage(url: URL(string: returnSpeciesURL())) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .cornerRadius(15)
                        .shadow(radius: 15)
                        .animation(.default, value: image)
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
            }
            }
            .frame(maxWidth: .infinity)
            
            
            Spacer()
        }
        .padding()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func returnSpeciesURL() -> String {
        var newName = species.name.replacingOccurrences(of: " ", with: "-")
        newName = newName.replacingOccurrences(of: "'", with: "")
        return "https://gallaugher.com/wp-content/uploads/2023/04/\(newName).jpg"
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(species: Species(name: "Swifter", classification: "Coder",designation: "sentient", average_height: "175", average_lifespan: "83", language: "Swift", skin_colors: "various", hair_colors: "various or none", eye_colors: "blue, green, brown, black, hzel, gray, or violent"))
    }
}
