import SwiftUI

struct DogDetail: View {
    let dogData: DogData
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                HStack {
                    Spacer()
                    Image(dogData.image)
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 14))
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
