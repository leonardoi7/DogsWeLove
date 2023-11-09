import Foundation

class APIManager {
    static let shared = APIManager()
    
    let urlString = "https://jsonblob.com/api/1151549092634943488"
    
    func fetchDogs(completion: @escaping ([DogData]?, Error?) -> Void) {
        guard let url = URL(string: urlString) else {
            completion(nil, NSError(domain: "APIManager", code: 1, userInfo: [NSLocalizedDescriptionKey: "Invalid URL"]))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(nil, error)
            } else if let data = data {
                do {
                    #if DEBUG
                    print(String(data: data, encoding: .utf8)!)
                    #endif
                    let dogs = try JSONDecoder().decode([DogData].self, from: data)
                    completion(dogs, nil)
                } catch {
                    completion(nil, error)
                }
            }
        }
        
        task.resume()
    }
}
