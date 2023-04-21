import Foundation

protocol IRMViewModel {
    func changeLoading()
    func fetchItems()
    
    var RMCharacters: [Character] { get set }
    var RMService: IRMAPIService { get }
}

class RMViewModel: IRMViewModel {
    
    var RMCharacters: [Character] = []
    private var isLoading = false
    let RMService: IRMAPIService
    
    init() {
        RMService = RMAPIService()
    }
    
    
    func fetchItems() {
        changeLoading()
        RMService.fetchData { response in
            self.changeLoading()
            self.RMCharacters = response ?? []
        }
    }
    
    func changeLoading() {
    
    }
}
