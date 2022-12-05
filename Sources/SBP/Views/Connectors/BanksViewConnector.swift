import SwiftUI

@available(iOS 13, *)
enum ViewState {
    case loading
    case loaded
}

@available(iOS 13, *)
struct BanksViewConnector: Connector {
    
    @State var banks: [Bank] = []
    @State var state: ViewState = .loading
    
    let onBankTap: CommandWith<String>?
    let onCloseTap: Command
    
    func map() -> some View {
        NavigationView {
            Group {
                switch state {
                case .loading:
                    Skeleton()
                case .loaded:
                    if banks.filter { $0.isInstalled }.count > 0 {
                        BanksView(apps: banks.filter { $0.isInstalled }.map { ($0.id, $0.name, $0.logoURL, $0.isInstalled)},
                                  onBankTap: onBankTap,
                                  onCloseTap: onCloseTap,
                                  allBanksList: {
                            fullBankList(backButton: true)
                                .background(Color.Background.primary.expandViewOutOfSafeArea())
                        })
                    } else {
                        fullBankList()
                    }
                }
            }
            .background(Color.Background.primary.expandViewOutOfSafeArea())
            .navigationBarHidden (true)
        }
        .onAppear {
            Task {
                /*
                state = .loading
                
                banks = Mock.API.checkApps(for: Array(Mock.API.getBankApplications()))
                state = .loaded
                 */
                let allBanks = try await API.getBankApplications()
                DispatchQueue.main.async {
                    banks = API.checkApps(for: allBanks)
                    state = .loaded
                }
            }
        }
    }
    
    @ViewBuilder
    func fullBankList(backButton: Bool = false) -> some View {
        FullBankList(banks: banks.map { ($0.id, $0.name, $0.logoURL)},
                     backButton: backButton,
                     onBankTap: onBankTap,
                     onCloseTap: onCloseTap)
    }
}

@available(iOS 13, *)
struct BanksViewConnector_preview: PreviewProvider {
    static var previews: some View {
        
        let banks = Array(Mock.API.getBankApplications().prefix(10))
        
        return Group {
            BanksViewConnector(banks: banks) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            
            BanksViewConnector(banks: banks) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}

