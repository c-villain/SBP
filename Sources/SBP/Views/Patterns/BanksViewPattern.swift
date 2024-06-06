import SwiftUI

@available(iOS 13, *)
struct BanksViewPattern<Content: View>: View {
    
    private let apps: [(id: String, name: String, logo: String, isInstalled: Bool)]
    private let onBankTap: CommandWith<String>?
    private let onCloseTap: Command?
    private let allBanksList: Content
    
    init(
        apps: [(id: String, name: String, logo: String, isInstalled: Bool)],
        onBankTap: CommandWith<String>?,
        onCloseTap: Command?,
        @ViewBuilder allBanksList: () -> Content
    ) {
        self.apps = apps
        self.onBankTap = onBankTap
        self.onCloseTap = onCloseTap
        self.allBanksList = allBanksList()
    }
    
    @State private var showAll: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            
            Text(Strings.selectBank)
                .font(.spb(.bold, size: 20))
                .fontWeight(.bold)
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(apps, id: \.id) { bank in
                        BankButtonPattern(
                            model: BankButtonPattern.Model(
                                id: bank.id,
                                name: bank.name,
                                logo: bank.logo,
                                onBankTap: onBankTap
                            )
                        )
                    }
                    
                    NavigationLink(destination: allBanksList) {
                        HStack(spacing: 10) {
                            Text(Strings.chooseOtherBank)
                                .font(.spb(.regular, size: 18))
                                .fontWeight(.regular)
                                .foregroundColor(.primary)
                        }
                        .padding(.horizontal, 10.0)
                    }
                    .buttonStyle(.sbp)
                    .navigationBarTitle("", displayMode: .inline)
                }
            }
        }
        .padding(.horizontal, 16)
        .navigationBarItems(trailing: closeBtn)
    }
    
    var closeBtn: some View {
        Image.Icons.close
            .frame(width: 24.0, height: 24)
            .onTapGesture {
                onCloseTap?()
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
