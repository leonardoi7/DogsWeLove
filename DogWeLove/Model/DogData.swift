import Foundation

struct DogData: Codable, Identifiable {
    let id: UUID
    var dogName: String
    var description: String
    var age: Int
    var image: String
    
    init(id: UUID = UUID(), dogName: String, description: String, age: Int, image: String) {
        self.id = id
        self.dogName = dogName
        self.description = description
        self.age = age
        self.image = image
    }
}
