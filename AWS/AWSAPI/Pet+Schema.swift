// swiftlint:disable all
import Amplify
import Foundation

extension Pet {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case userID
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let pet = Pet.keys
    
    model.pluralName = "Pets"
    
    model.fields(
      .id(),
      .field(pet.name, is: .optional, ofType: .string),
      .field(pet.userID, is: .optional, ofType: .string)
    )
    }
}