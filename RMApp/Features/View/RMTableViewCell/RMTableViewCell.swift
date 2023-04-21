import UIKit
import SnapKit
import AlamofireImage

class RMTableViewCell: UITableViewCell {
    
    private let title = UILabel()
    private let customDescription = UILabel()
    private let customImageView = UIImageView()
    private let randomImage = "https://as1.ftcdn.net/v2/jpg/02/57/42/72/1000_F_257427286_Lp7c9XdPnvN46TyFKqUaZpPADJ77ZzUk.jpg"
    
    enum Identifier: String {
        case custom = "RMCell"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configure() {
        addSubview(title)
        addSubview(customDescription)
        addSubview(customImageView)
        
        makeConstraints()
    }
    
    private func makeConstraints() {
        customImageView.snp.makeConstraints { make in
            make.height.equalTo(100)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(customImageView.snp.top).offset(20)
            make.right.left.equalTo(customImageView)
            make.width.height.equalTo(20)
        }
        customDescription.snp.makeConstraints { make in
            make.top.equalTo(title).offset(5)
            make.right.left.equalTo(title)
            make.bottom.equalToSuperview()
        }
    }
    
    func saveModel(model: Character) {
        title.text = model.name
        customImageView.af.setImage(withURL: (URL(string: model.image ?? randomImage) ?? URL(string: randomImage))!)
        
    }
}
