import Foundation
import CoreData


extension Klients {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Klients> {
        return NSFetchRequest<Klients>(entityName: "Klients")
    }

    @NSManaged public var name: String?
    @NSManaged public var surname: String?
    @NSManaged public var phone: String?
    @NSManaged public var issue: String?

}

extension Klients : Identifiable {

}
