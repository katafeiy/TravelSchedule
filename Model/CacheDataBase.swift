import SwiftUI

@MainActor
final class CacheDataBase {
   
    static let shared = CacheDataBase()
    
    var settlements: [Settlement] = []
    
}
