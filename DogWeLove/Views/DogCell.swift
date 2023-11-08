import SwiftUI

struct DogCell: View {
    var body: some View {
        ZStack (alignment: .bottom) {
            HStack {
                Spacer()
                    .frame(width: 130)
                VStack (alignment: .leading) {
                    Text("Chief")
                        .font(.title2)
                        .foregroundColor(.primary)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text("Black (formerly) White with black spots, he don't trust anyone")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .padding(.bottom, 10)
                        .padding(.leading, 16)
                    Text("Almost 2 years")
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
    DogCell()
}
