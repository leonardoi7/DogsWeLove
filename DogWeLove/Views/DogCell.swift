import SwiftUI

struct DogCell: View {
    let dogData: DogData
    var body: some View {
        ZStack (alignment: .bottom) {
            HStack {
                Spacer()
                    .frame(width: 130)
                VStack (alignment: .leading) {
                    Text(dogData.dogName)
                        .font(.title2)
                        .foregroundColor(color333333)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text(dogData.description)
                        .multilineTextAlignment(.leading)
                        .font(.subheadline)
                        .foregroundColor(color666666)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text("Almost \(dogData.age + 1) years old")
                        .foregroundColor(color333333)
                        .bold()
                        .font(.subheadline)
                        .padding(.bottom)
                        .padding(.leading, 16)
                }
                .frame(minHeight: 150)
                .padding()
            }
            .background(colorF8F8F8)
            .clipShape(RoundedRectangle(cornerRadius: 14))
            
            HStack {
                AsyncImage(url: URL(string:dogData.correctImageURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .frame(width: 150)
                    } else if phase.error != nil {
                        Image("No-Image-Placeholder")
                            .resizable()
                            .scaledToFit()
                            .clipShape(RoundedRectangle(cornerRadius: 14))
                            .frame(width: 150)
                    } else {
                        ProgressView()
                            .frame(width: 150, height: 150)
                    }
                }
                Spacer()
            }
        }
        .padding(.vertical)
        .navigationTitle("Dog We Love")
    }
}


#Preview {
    let dogData = DogData(dogName: "Chief", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex")
    return DogCell(dogData: dogData)
}
