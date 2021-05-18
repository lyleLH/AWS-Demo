// swiftlint:disable all
import Amplify
import Foundation

extension User {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case catchPhrase
    case creationDate
    case age
    case weight
    case nicknames
    case gender
    case location
    case Pets
    case Communities
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let user = User.keys
    
    model.pluralName = "Users"
    
    model.fields(
      .id(),
      .field(user.name, is: .optional, ofType: .string),
      .field(user.catchPhrase, is: .optional, ofType: .string),
      .field(user.creationDate, is: .optional, ofType: .dateTime),
      .field(user.age, is: .optional, ofType: .int),
      .field(user.weight, is: .optional, ofType: .double),
      .field(user.nicknames, is: .optional, ofType: .embeddedCollection(of: String.self)),
      .field(user.gender, is: .optional, ofType: .enum(type: Gender.self)),
      .field(user.location, is: .optional, ofType: .embedded(type: Location.self)),
      .hasMany(user.Pets, is: .optional, ofType: Pet.self, associatedWith: Pet.keys.userID),
      .hasMany(user.Communities, is: .optional, ofType: UserCommunity.self, associatedWith: UserCommunity.keys.user)
    )
    }
}