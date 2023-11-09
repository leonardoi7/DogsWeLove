import Foundation

struct DogData: Codable, Identifiable {
    let id: UUID
    var dogName: String
    var description: String
    var age: Int
    var image: String
    
    var correctImageURL: String {
        if let range = image.range(of: ".jpg") {
            let endIndex = range.upperBound
            return String(image[..<endIndex])
        }
        return image
    }
    
    enum CodingKeys: String, CodingKey {
        case dogName
        case description
        case age
        case image
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        dogName = try container.decode(String.self, forKey: .dogName)
        description = try container.decode(String.self, forKey: .description)
        age = try container.decode(Int.self, forKey: .age)
        image = try container.decode(String.self, forKey: .image)
        id = UUID()
    }
    
    init(id: UUID = UUID(), dogName: String, description: String, age: Int, image: String) {
        self.id = id
        self.dogName = dogName
        self.description = description
        self.age = age
        self.image = image
    }
}
