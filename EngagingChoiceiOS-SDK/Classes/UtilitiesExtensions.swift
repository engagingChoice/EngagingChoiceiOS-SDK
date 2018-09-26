//
//  UtilitiesExtensions.swift
//  FabricSell
//
//  Created by KiwiTech on 10/09/18.
//

import UIKit

enum EngagingChoiceName:String {
    case poweredBy = "Powered by"
     case validTill = "Valid Till"
    case profileSubTitle = "Your Profile not complete yet, Please complete your profile first and get more offers."
    case alertMessage = "Please fill all fields"
}
enum EngagingChoiceGridCell:CGFloat {
    case cellHeight = 200
}
enum EngagingChoiceAPIBaseURL:String {
    case QAOfferListURL = "https://funn-qa.kiwireader.com/publisherapi"
    case DevOfferListURL = "https://funn-dev.kiwireader.com/publisherapi"
    case StagOfferListURL = "https://funn-staging.kiwireader.com/publisherapi"
    static var baseURL: String {
        return EngagingChoiceAPIBaseURL.DevOfferListURL.rawValue
    }
}
enum EngagingChoiceAPIEndPoint:String {
    case offerList = "/offer-list"
    case contentList = "/content-list"
    case viewCount = "/view-count"
    case updatUserInfo = "/user-update-info"
    case offerAction = "/offer-action"
}
enum FormatterDate:String {
    case MMDY = "MMM dd, yyyy"
    case YYMdHHm = "yyyy-MM-dd HH:mm:ss"
}
enum EngaingChoiceAPIKey:String {
    case id = "id"
    case mobile = "mobile_no"
    case email = "email"
    case type = "type"
    case offerId = "offer_id"
    case action = "action"
}

enum EngagingChoiceTypeValue: Int {
    case contentValueType = 1, offerValueType
}
// MARK: - Later Action
enum EngagingChoiceOfferAction: Int {
    case getOffer = 1, later, skip
}
extension UIFont {
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            //print("Error registering font: maybe it was already registered.")
            return false
        }
        
        return true
    }
}
extension UIFont {
    static func loadFonts() {
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-SemiBold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Bold", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-Regular", fontExtension: "ttf")
        _ = UIFont.registerFont(bundle: Bundle.bundle, fontName: "OpenSans-LightItalic", fontExtension: "ttf")
    }
}
extension UIImage {
    static var poweredByIcon:UIImage? {
        return UIImage(named: "icon", in: Bundle.bundle, compatibleWith: nil)
    }
    static var poweredByWithText:UIImage? {
        return UIImage(named: "logoWithEngagingChoice", in: Bundle.bundle, compatibleWith: nil)
    }
    static var pauseImage:UIImage? {
        return UIImage(named: "pause-icon", in: Bundle.bundle, compatibleWith: nil)
    }
    static var playImage:UIImage? {
        return UIImage(named: "play-icon", in: Bundle.bundle, compatibleWith: nil)
    }
    static var cellShimmer:UIImage? {
        return UIImage(named: "cellShimmer", in: Bundle.bundle, compatibleWith: nil)
    }
}
extension UIColor {
    static var poweredByColor:UIColor {
        return UIColor(red: 52/255, green: 62/255, blue: 74/255, alpha: 1.0)
    }
}
extension Bundle {
    static var bundle:Bundle {
        let podBundle = Bundle(for: ECOfferTableViewCell.self)
        let bundleURL = podBundle.url(forResource: "FabricSell", withExtension: "bundle")
        return Bundle(url: bundleURL!)!
    }
}
