// swiftlint:disable all
import Amplify
import Foundation

extension UserCommunity {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case user
    case community
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let userCommunity = UserCommunity.keys
    
    model.pluralName = "UserCommunities"
    
    model.fields(
      .id(),
      .belongsTo(userCommunity.user, is: .required, ofType: User.self, targetName: "userID"),
      .belongsTo(userCommunity.community, is: .required, ofType: Community.self, targetName: "communityID")
    )
    }
}