//
//  RMViewModel.swift
//  RMApp
//
//  Created by macbook pro on 14.04.2023.
//

protocol IRMViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickyMortyCharacters: [Character] { get set }
    var rickMortyService: IRMAPIService { get }
}


struct RMViewModel: IRMViewModel {
    func fetchItems() {
        <#code#>
    }
    
    func changeLoading() {
        <#code#>
    }
    
    var rickyMortyCharacters: [Character]
    
    var rickMortyService: IRMAPIService
}
