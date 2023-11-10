import CoreData

class DataManager: ObservableObject {
    static let shared = DataManager()
    
    let container: NSPersistentContainer
    var context: NSManagedObjectContext { container.viewContext }
    
    init() {
        container = NSPersistentContainer(name: "Dogs")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    func fetchDogs() -> [Dog] {
        let request: NSFetchRequest<Dog> = Dog.fetchRequest()
        do {
            return try context.fetch(request)
        } catch {
            print("Error fetching dogs: \(error)")
            return []
        }
    }
    
    func saveContext() {
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
