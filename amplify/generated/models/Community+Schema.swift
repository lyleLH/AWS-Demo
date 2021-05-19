// swiftlint:disable all
import Amplify
import Foundation

extension Community {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case users
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let community = Community.keys
    
    model.pluralName = "Communities"
    
    model.fields(
      .id(),
      .field(community.name, is: .optional, ofType: .string),
      .hasMany(community.users, is: .optional, ofType: UserCommunity.self, associatedWith: UserCommunity.keys.community)
    )
    }
}