//
//  RMViewModel.swift
//  RMApp
//
//  Created by macbook pro on 14.04.2023.
//
import Foundation

protocol IRMViewModel {
    func fetchItems()
    func changeLoading()
    
    var rickyMortyCharacters: [Character] { get set }
    var rickMortyService: IRMAPIService { get }
}


class RMViewModel: IRMViewModel {
    
    var isLoading = false
    var rickyMortyCharacters: [Character] = []
    let rickMortyService: IRMAPIService
    
    init() {
        rickMortyService = RMAPIService()
    }
    
    func fetchItems() {
        self.changeLoading()
        rickMortyService.fetchData { [weak self] characters in
            self?.changeLoading()
            self?.rickyMortyCharacters = characters ?? []
        }
        
    }
    
    func changeLoading() {
        
    }
}
