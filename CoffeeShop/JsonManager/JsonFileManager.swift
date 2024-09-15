//
//  JsonFileManager.swift
//  CoffeeShop
//
//  Created by Александр Богачев on 15.09.24.
//

import Foundation

class JsonFileManager {
    
    static let shared = JsonFileManager()
    
    private init() {}
    
    func save<T: Encodable>(_ items: [T], to fileName: String) {
        let jsonEncoder = JSONEncoder()
        jsonEncoder.outputFormatting = .prettyPrinted
        
        do {
            let jsonData = try jsonEncoder.encode(items)
            saveJsonToFile(jsonData: jsonData, fileName: fileName)
        } catch {
            print("Failed to encode items for file \(fileName): \(error.localizedDescription)")
        }
    }
    
    func load<T: Decodable>(from fileName: String, as type: T.Type) -> [T]? {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            do {
                let data = try Data(contentsOf: fileURL)
                let jsonDecoder = JSONDecoder()
                let items = try jsonDecoder.decode([T].self, from: data)
                return items
            } catch {
                if (error as NSError).code == NSFileReadNoSuchFileError {
                    print("No existing file found for \(fileName), a new one will be created.")
                } else {
                    print("Failed to load or decode items from \(fileName): \(error.localizedDescription)")
                }
            }
        }
        return nil
    }
    
    private func saveJsonToFile(jsonData: Data, fileName: String) {
        let fileManager = FileManager.default
        let urls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        
        if let documentDirectory = urls.first {
            let fileURL = documentDirectory.appendingPathComponent(fileName)
            do {
                try jsonData.write(to: fileURL)
                print("JSON saved to: \(fileURL.absoluteURL)")
            } catch {
                print("Failed to save JSON to file \(fileName): \(error.localizedDescription)")
            }
        }
    }
}
