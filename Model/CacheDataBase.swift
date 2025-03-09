import SwiftUI

final class CacheDataBase {
   
    static let shared = CacheDataBase()
    
    var settlements: [Settlement] = []
    
}
