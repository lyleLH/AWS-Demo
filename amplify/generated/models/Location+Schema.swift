// swiftlint:disable all
import Amplify
import Foundation

extension Location {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case latitude
    case longtitude
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let location = Location.keys
    
    model.pluralName = "Locations"
    
    model.fields(
      .field(location.latitude, is: .optional, ofType: .string),
      .field(location.longtitude, is: .optional, ofType: .string)
    )
    }
}