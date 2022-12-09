import SwiftUI

@available(iOS 13, *)
struct BanksViewPattern<Content: View>: View {
    
    private let apps: [(id: String, name: String, logo: String, isInstalled: Bool)]
    private let onBankTap: CommandWith<String>?
    private let onCloseTap: Command?
    private let allBanksList: Content
    
    init(apps: [(id: String, name: String, logo: String, isInstalled: Bool)],
         onBankTap: CommandWith<String>?,
         onCloseTap: Command?,
         @ViewBuilder allBanksList: () -> Content) {
        self.apps = apps
        self.onBankTap = onBankTap
        self.onCloseTap = onCloseTap
        self.allBanksList = allBanksList()
    }
    
    @State private var showAll: Bool = false
    
    var body: some View {
        ZStack {
            Image.Icons.close
                .frame(width: 24.0, height: 24)
                .hTrailing()
                .vTop()
                .onTapGesture {
                    onCloseTap?()
                }
                .padding(16)
                .zIndex(1)
            
            VStack(alignment: .leading, spacing: 15) {

                Text("Выберите банк для оплаты")
                    .font(.system(size: 20))
                    .fontWeight(.bold)
                
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(apps, id: \.id) { bank in
                            BankButtonPattern(id: bank.id,
                                       name: bank.name,
                                       logo: bank.logo,
                                       onBankTap: onBankTap)
                        }
                        
                        Button {
                            showAll.toggle()
                        } label: {
                            NavigationLink(destination: allBanksList) {
                                HStack(spacing: 10) {
                                    Text(Strings.chooseOtherBank)
                                        .font(.system(size: 18))
                                        .fontWeight(.regular)
                                        .foregroundColor(.primary)
                                }
                                .padding(.horizontal, 10.0)
                            }
                        }
                        .buttonStyle(SbpButtonStyle())
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 48)
        }
    }
}

@available(iOS 13, *)
struct BanksViewPattern_preview: PreviewProvider {
    static var previews: some View {
        
        let apps: [(id: String, name: String, logo: String, isInstalled: Bool)] = [
            (id: "bank100000000111", name: "Сбербанк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000111.png", isInstalled: true),
             (id: "bank100000000008", name: "Альфа-банк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000008.png", isInstalled: true),
            (id: "bank100000000015", name: "Открытие", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000015.png", isInstalled: true),
            (id: "bank100000000004", name: "Тинькофф", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000004.png", isInstalled: true)
        ]
    
        return Group {
            BanksViewPattern(apps: apps) {
                print($0)
            } onCloseTap: {
                
            } allBanksList: {
                FullBankListPattern_preview.previews
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            
            BanksViewPattern(apps: apps) {
                print($0)
            } onCloseTap: {
                
            } allBanksList: {
                FullBankListPattern_preview.previews
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
