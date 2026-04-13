import Foundation
import Combine

class ProductViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var searchText: String = ""
    
    init() {
        loadMockProducts()
    }
    
    func loadMockProducts() {
        
        products = [
            Product(
                id: UUID(),
                name: "Pepsi Max 1.5L",
                ean: "5449000131805",
                brand: "Pepsi",
                imageURL: nil,
                prices: [
                    StorePrice(store: .ica, price: 19.50),
                    StorePrice(store: .coop, price: 19.95),
                    StorePrice(store: .willys, price: 19.90)
                ]
            )
        ]
    }
    
    var filteredProducts: [Product] {
        
        if searchText.isEmpty {
            return products
        }
        
        return products.filter {
            $0.name.localizedCaseInsensitiveContains(searchText) ||
            $0.brand.localizedCaseInsensitiveContains(searchText)
        }
    }
}
