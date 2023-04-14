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
    
    var rickMortOutPut: RMOutPut? { get }
    
    func setDelegate(output: RMOutPut)
}


final class RMViewModel: IRMViewModel {
    
    var rickMortOutPut: RMOutPut?
    
    func setDelegate(output: RMOutPut) {
        rickMortOutPut = output
    }
    
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
            self?.rickMortOutPut?.saveDatas(values: self?.rickyMortyCharacters ?? [])
        }
        
    }
    
    func changeLoading() {
        isLoading = !isLoading
        rickMortOutPut?.changeLoading(isLoad: isLoading)
    }
}
