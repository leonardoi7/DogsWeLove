import CoreData

func convertToDogDataArray(from storedDogs: [Dog]) -> [DogData] {
    return storedDogs.map { dog in
        DogData(
            id: dog.id ?? UUID(),
            dogName: dog.dogName ?? "",
            description: dog.desc ?? "",
            age: Int(dog.age),
            image: dog.image ?? ""
        )
    }
}

func saveDogsToCoreData(_ dogs: [DogData]) {
    let context = DataManager.shared.context
    dogs.forEach { dogData in
        let dog = Dog(context: context)
        dog.id = dogData.id
        dog.dogName = dogData.dogName
        dog.desc = dogData.description
        dog.age = Int32(dogData.age)
        dog.image = dogData.image
    }
    DataManager.shared.saveContext()
}
