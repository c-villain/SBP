import SwiftUI

@available(iOS 13, *)
struct BankButtonPattern: View {
    
    private let model: Model
    
    public init(model: Model) {
        self.model = model
    }
    
    var body: some View {
        Button {
            model.onBankTap?(model.id)
        } label: {
            HStack(spacing: 10) {
                AsyncImage(URL(string: model.logo))
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .cornerRadius(Constants.Images.defaults)
                Text(model.name)
                    .font(.spb(.regular, size: 18))
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding(.horizontal, 10)
        }
        .buttonStyle(.sbp)
    }
}

@available(iOS 13, *)
extension BankButtonPattern {
    struct Model {
        let id: String
        let name: String
        let logo: String
        let onBankTap: CommandWith<String>?
    }
}

@available(iOS 13, *)
struct BankButtonPattern_preview: PreviewProvider {
    
    static var previews: some View {
        registerFonts()

        return BankButtonPattern(
            model: BankButtonPattern.Model(
                id: "bank100000000111",
                name: "Сбербанк",
                logo: "https://qr.nspk.ru/proxyapp/logo/bank100000000111.png",
                onBankTap: { print($0) }
            )
        )
        .padding(16)
    }
}
