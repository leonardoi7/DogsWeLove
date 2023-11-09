import SwiftUI

struct DogDetail: View {
    let dogData: DogData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    AsyncImage(url: URL(string:dogData.correctImageURL)) { phase in
                        if let image = phase.image {
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        } else if phase.error != nil {
                            Image("No-Image-Placeholder")
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 14))
                        } else {
                            ProgressView()
                                .frame(width: 150, height: 150)
                        }
                    }
                    Spacer()
                }
                
                Text(dogData.dogName)
                    .font(.title)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                Text("\(dogData.age) years old")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .padding(.horizontal)
                
                Text(dogData.description)
                    .font(.body)
                    .padding(.horizontal)
                
                Spacer()
            }
        }
        .navigationTitle(dogData.dogName)
    }
}
