import SwiftUI

@available(iOS 13, *)
struct FullBankListPattern: View {
    
    let banks: [(id: String, name: String, logo: String)]
    let backButton: Bool
    let onBankTap: CommandWith<String>?
    let onCloseTap: Command?
    
    @Environment(\.presentationMode) var presentationMode
    
    @State private var searchText: String = ""
    @State private var bankfilterObserver = TextFieldObserver()
    
    var filteredBanks: [(id: String, name: String, logo: String)] {
        banks.filter {
            searchText.isEmpty ? true : $0.name.lowercased().contains(searchText.trimmingCharacters(in: .whitespacesAndNewlines).lowercased())
        }
    }
    
    var body: some View {
        
        VStack(spacing: 15) {
            VStack(spacing: 10) {
                Image.Icons.logo
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 50)
                
                Text(Strings.descriptionText)
                    .font(.spb(.regular, size: 14))
                    .multilineTextAlignment(.center)
                
                SearchBar(textObserver: bankfilterObserver)
            }
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 8) {
                    ForEach(filteredBanks, id: \.id) { bank in
                        BankButtonPattern(
                            id: bank.id,
                            name: bank.name,
                            logo: bank.logo,
                            onBankTap: onBankTap
                        )
                    }
                }
            }
        }
        .onReceive(bankfilterObserver.$debouncedText) { bank in
            searchText = bank
        }
        .padding(.horizontal, 16)
        .navigationBarTitle("", displayMode: .inline)
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
struct FullBankListPattern_preview: PreviewProvider {
    static var previews: some View {
        
        registerFonts()
        
        let installedApps: [(id: String, name: String, logo: String)] = [
            (id: "bank100000000111", name: "Сбербанк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000111.png"),
            (id: "bank100000000008", name: "Альфа-банк", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000008.png"),
            (id: "bank100000000015", name: "Открытие", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000015.png"),
            (id: "bank100000000004", name: "Тинькофф", logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000004.png")
        ]
        
        return Group {
            FullBankListPattern(
                banks: installedApps,
                backButton: true
            ) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            
            FullBankListPattern(
                banks: installedApps,
                backButton: false
            ) {
                print($0)
            } onCloseTap: {
                
            }
            .previewDisplayName("Installed apps")
            .previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
        }
    }
}
