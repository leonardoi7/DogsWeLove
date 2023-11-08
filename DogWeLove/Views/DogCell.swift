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
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text(dogData.description)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text("\(dogData.age)")
                        .font(.subheadline)
                        .padding(.bottom)
                        .padding(.leading, 16)
                }
                .padding()
            }
            .background(Color(.systemBackground))
            .clipShape(RoundedRectangle(cornerRadius: 14))
            .padding(.horizontal)
            
            HStack {
                Image("Rex")
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 14))
                    .frame(width: 150)
                Spacer()
            }
            .padding(.leading)
        }
        .padding(.vertical)
        .background(Color(.secondarySystemBackground))
        .navigationTitle("Dog We Love")
    }
}


#Preview {
    let dogData = DogData(dogName: "Chief", description: "Black (formerly) White with black spots, he don't trust anyone", age: 2, image: "Rex")
    return DogCell(dogData: dogData)
}
