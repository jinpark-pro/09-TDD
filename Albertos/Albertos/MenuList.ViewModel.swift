//
//  MenuList.ViewModel.swift
//  Albertos
//
//  Created by Jungjin Park on 2024-07-11.
//

import Combine

extension MenuList {
    class ViewModel: ObservableObject {
        @Published var sections: Result<[MenuSection], Error> = .success([])

        private var cancellables = Set<AnyCancellable>()
        init(
            menuFetching: MenuFetching = MenuFetchingSample(),
            menuGrouping: @escaping ([MenuItem]) -> [MenuSection] = groupMenuByCategory) {
                menuFetching
                    .fetchMenu()
                    .sink(
                        receiveCompletion: { [weak self] completion in
                            guard case .failure(let error) = completion else { return }
                            self?.sections = .failure(error)
                        },
                        receiveValue: { [weak self] value in
                            self?.sections = .success(menuGrouping(value))
                        }
                    )
                    .store(in: &cancellables)
        }
    }
}
