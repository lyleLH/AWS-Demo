// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "7eecbe8db00e9022ce7d8c28a595bb12"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: Community.self)
    ModelRegistry.register(modelType: UserCommunity.self)
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Pet.self)
  }
}