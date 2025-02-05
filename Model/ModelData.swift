import SwiftUI

class ModelData {
    
    @Published var images: [PreviewImage] = [
        PreviewImage(name: "preview1"),
        PreviewImage(name: "preview2"),
        PreviewImage(name: "preview3"),
        PreviewImage(name: "preview4"),
        PreviewImage(name: "preview5"),
        PreviewImage(name: "preview6"),
        PreviewImage(name: "preview7"),
        PreviewImage(name: "preview8")
    ]
    
    var citys: [Citys] = [
        Citys(name: "Москва"),
        Citys(name: "Санкт-Петербург"),
        Citys(name: "Сочи"),
        Citys(name: "Саратов"),
        Citys(name: "Красноярск"),
        Citys(name: "Омск"),
        Citys(name: "Краснодар"),
        Citys(name: "Новосибирск"),
    ]
}
