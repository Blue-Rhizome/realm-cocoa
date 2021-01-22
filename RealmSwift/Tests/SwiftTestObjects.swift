////////////////////////////////////////////////////////////////////////////
//
// Copyright 2014 Realm Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
////////////////////////////////////////////////////////////////////////////

import Foundation
import RealmSwift
import Realm

class SwiftStringObject: Object {
    @ManagedProperty var stringCol = ""
}

class SwiftBoolObject: Object {
    @ManagedProperty var boolCol = false
}

class SwiftIntObject: Object {
    @ManagedProperty var intCol = 0
}

class SwiftInt8Object: Object {
    @objc dynamic var int8Col = 0
}

class SwiftInt16Object: Object {
    @objc dynamic var int16Col = 0
}

class SwiftInt32Object: Object {
    @objc dynamic var int32Col = 0
}

class SwiftInt64Object: Object {
    @objc dynamic var int64Col = 0
}

class SwiftLongObject: Object {
    @ManagedProperty var longCol: Int64 = 0
}

@objc enum IntEnum: Int, RealmEnum {
    case value1 = 1
    case value2 = 3
}

class SwiftObject: Object {
    @ManagedProperty var boolCol = false
    @ManagedProperty var intCol = 123
    @ManagedProperty var int8Col: Int8 = 123
    @ManagedProperty var int16Col: Int16 = 123
    @ManagedProperty var int32Col: Int32 = 123
    @ManagedProperty var int64Col: Int64 = 123
    @objc dynamic var intEnumCol = IntEnum.value1
    @ManagedProperty var floatCol = 1.23 as Float
    @ManagedProperty var doubleCol = 12.3
    @ManagedProperty var stringCol = "a"
    @ManagedProperty var binaryCol = "a".data(using: String.Encoding.utf8)!
    @ManagedProperty var dateCol = Date(timeIntervalSince1970: 1)
    @objc dynamic var decimalCol = Decimal128("123e4")
    @objc dynamic var objectIdCol = ObjectId("1234567890ab1234567890ab")
    @ManagedProperty var objectCol: SwiftBoolObject? = SwiftBoolObject()
    let arrayCol = List<SwiftBoolObject>()

    class func defaultValues() -> [String: Any] {
        return  [
            "boolCol": false,
            "intCol": 123,
            "int8Col": 123 as Int8,
            "int16Col": 123 as Int16,
            "int32Col": 123 as Int32,
            "int64Col": 123 as Int64,
            "floatCol": 1.23 as Float,
            "doubleCol": 12.3,
            "stringCol": "a",
            "binaryCol": "a".data(using: String.Encoding.utf8)!,
            "dateCol": Date(timeIntervalSince1970: 1),
            "decimalCol": Decimal128("123e4"),
            "objectIdCol": ObjectId("1234567890ab1234567890ab"),
            "objectCol": [false],
            "arrayCol": []
        ]
    }
}

class SwiftOptionalObject: Object {
    @ManagedProperty var optNSStringCol: NSString?
    @ManagedProperty var optStringCol: String?
    @ManagedProperty var optBinaryCol: Data?
    @ManagedProperty var optDateCol: Date?
    @objc dynamic var optDecimalCol: Decimal128?
    @objc dynamic var optObjectIdCol: ObjectId?
    @ManagedProperty var optIntCol: Int? = nil
    @ManagedProperty var optFloatCol: Float? = nil
    @ManagedProperty var optDoubleCol: Double? = nil
    @ManagedProperty var optBoolCol: Bool? = nil
    @ManagedProperty var optInt8Col: Int8?
    @ManagedProperty var optInt16Col: Int16?
    @ManagedProperty var optInt32Col: Int32?
    @ManagedProperty var optInt64Col: Int64?
    let optEnumCol = RealmOptional<IntEnum>()
    @objc dynamic var optObjectCol: SwiftBoolObject?
}

class SwiftRealmOptionalObject: Object {
    let optIntCol = RealmOptional<Int>()
    let optFloatCol = RealmOptional<Float>()
    let optDoubleCol = RealmOptional<Double>()
    let optBoolCol = RealmOptional<Bool>()
    let optInt8Col = RealmOptional<Int8>()
    let optInt16Col = RealmOptional<Int16>()
    let optInt32Col = RealmOptional<Int32>()
    let optInt64Col = RealmOptional<Int64>()
    let optEnumCol = RealmOptional<IntEnum>()
}

class SwiftOptionalPrimaryObject: SwiftOptionalObject {
    @ManagedProperty var id: Int?

    override class func primaryKey() -> String? { return "id" }
}

class ManagedPropertyWrapper: Object {
    @ManagedProperty(wrappedValue: 0, primaryKey: true)
    var value: Int
}

class SwiftListObject: Object {
    let int = List<Int>()
    let int8 = List<Int8>()
    let int16 = List<Int16>()
    let int32 = List<Int32>()
    let int64 = List<Int64>()
    let float = List<Float>()
    let double = List<Double>()
    let string = List<String>()
    let data = List<Data>()
    let date = List<Date>()
    let decimal = List<Decimal128>()
    let objectId = List<ObjectId>()

    let intOpt = List<Int?>()
    let int8Opt = List<Int8?>()
    let int16Opt = List<Int16?>()
    let int32Opt = List<Int32?>()
    let int64Opt = List<Int64?>()
    let floatOpt = List<Float?>()
    let doubleOpt = List<Double?>()
    let stringOpt = List<String?>()
    let dataOpt = List<Data?>()
    let dateOpt = List<Date?>()
    let decimalOpt = List<Decimal128?>()
    let objectIdOpt = List<ObjectId?>()
}

class SwiftImplicitlyUnwrappedOptionalObject: Object {
    @ManagedProperty var optNSStringCol: NSString!
    @ManagedProperty var optStringCol: String!
    @ManagedProperty var optBinaryCol: Data!
    @ManagedProperty var optDateCol: Date!
    @objc dynamic var optDecimalCol: Decimal128!
    @objc dynamic var optObjectIdCol: ObjectId!
    @ManagedProperty var optObjectCol: SwiftBoolObject!
}

class SwiftOptionalDefaultValuesObject: Object {
    @ManagedProperty var optNSStringCol: NSString? = "A"
    @ManagedProperty var optStringCol: String? = "B"
    @ManagedProperty var optBinaryCol: Data? = "C".data(using: String.Encoding.utf8)! as Data
    @ManagedProperty var optDateCol: Date? = Date(timeIntervalSince1970: 10)
    @objc dynamic var optDecimalCol: Decimal128? = "123"
    @objc dynamic var optObjectIdCol: ObjectId? = ObjectId("1234567890ab1234567890ab")
    @ManagedProperty var optIntCol: Int? = 1
    @ManagedProperty var optInt8Col: Int8? = 1
    @ManagedProperty var optInt16Col: Int16? = 1
    @ManagedProperty var optInt32Col: Int32? = 1
    @ManagedProperty var optInt64Col: Int64? = 1
    @ManagedProperty var optFloatCol: Float? = 2.2
    @ManagedProperty var optDoubleCol: Double? = 3.3
    @ManagedProperty var optBoolCol: Bool? = true
    @ManagedProperty var optObjectCol: SwiftBoolObject? = SwiftBoolObject(value: [true])
    //    let arrayCol = List<SwiftBoolObject?>()

    class func defaultValues() -> [String: Any] {
        return [
            "optNSStringCol": "A",
            "optStringCol": "B",
            "optBinaryCol": "C".data(using: String.Encoding.utf8)!,
            "optDateCol": Date(timeIntervalSince1970: 10),
            "optDecimalCol": Decimal128("123"),
            "optObjectIdCol": ObjectId("1234567890ab1234567890ab"),
            "optIntCol": 1,
            "optInt8Col": Int8(1),
            "optInt16Col": Int16(1),
            "optInt32Col": Int32(1),
            "optInt64Col": Int64(1),
            "optFloatCol": 2.2 as Float,
            "optDoubleCol": 3.3,
            "optBoolCol": true
        ]
    }
}

class SwiftOptionalIgnoredPropertiesObject: Object {
    @ManagedProperty var id = 0

    @ManagedProperty var optNSStringCol: NSString? = "A"
    @ManagedProperty var optStringCol: String? = "B"
    @ManagedProperty var optBinaryCol: Data? = "C".data(using: String.Encoding.utf8)! as Data
    @ManagedProperty var optDateCol: Date? = Date(timeIntervalSince1970: 10)
    @objc dynamic var optDecimalCol: Decimal128? = "123"
    @objc dynamic var optObjectIdCol: ObjectId? = ObjectId("1234567890ab1234567890ab")
    @ManagedProperty var optObjectCol: SwiftBoolObject? = SwiftBoolObject(value: [true])

    override class func ignoredProperties() -> [String] {
        return [
            "optNSStringCol",
            "optStringCol",
            "optBinaryCol",
            "optDateCol",
            "optDecimalCol",
            "optObjectIdCol",
            "optObjectCol"
        ]
    }
}

class SwiftDogObject: Object {
    @ManagedProperty var dogName = ""
    let owners = LinkingObjects(fromType: SwiftOwnerObject.self, property: "dog")
}

class SwiftOwnerObject: Object {
    @ManagedProperty var name = ""
    @ManagedProperty var dog: SwiftDogObject? = SwiftDogObject()
}

class SwiftAggregateObject: Object {
    @ManagedProperty var intCol = 0
    @ManagedProperty var int8Col: Int8 = 0
    @ManagedProperty var int16Col: Int16 = 0
    @ManagedProperty var int32Col: Int32 = 0
    @ManagedProperty var int64Col: Int64 = 0
    @ManagedProperty var floatCol = 0 as Float
    @ManagedProperty var doubleCol = 0.0
    @objc dynamic var decimalCol = 0.0 as Decimal128
    @ManagedProperty var boolCol = false
    @ManagedProperty var dateCol = Date()
    @ManagedProperty var trueCol = true
    let stringListCol = List<SwiftStringObject>()
}

class SwiftAllIntSizesObject: Object {
    @ManagedProperty var int8: Int8  = 0
    @ManagedProperty var int16: Int16 = 0
    @ManagedProperty var int32: Int32 = 0
    @ManagedProperty var int64: Int64 = 0
}

class SwiftEmployeeObject: Object {
    @ManagedProperty var name = ""
    @ManagedProperty var age = 0
    @ManagedProperty var hired = false
}

class SwiftCompanyObject: Object {
    let employees = List<SwiftEmployeeObject>()
}

class SwiftArrayPropertyObject: Object {
    @ManagedProperty var name = ""
    let array = List<SwiftStringObject>()
    let intArray = List<SwiftIntObject>()
}

class SwiftDoubleListOfSwiftObject: Object {
    let array = List<SwiftListOfSwiftObject>()
}

class SwiftListOfSwiftObject: Object {
    let array = List<SwiftObject>()
}

class SwiftListOfSwiftOptionalObject: Object {
    let array = List<SwiftOptionalObject>()
}

class SwiftArrayPropertySubclassObject: SwiftArrayPropertyObject {
    let boolArray = List<SwiftBoolObject>()
}

class SwiftLinkToPrimaryStringObject: Object {
    @ManagedProperty var pk = ""
    @ManagedProperty var object: SwiftPrimaryStringObject?
    let objects = List<SwiftPrimaryStringObject>()

    override class func primaryKey() -> String? {
        return "pk"
    }
}

class SwiftUTF8Object: Object {
    // swiftlint:disable:next identifier_name
    @ManagedProperty var 柱колоéнǢкƱаم👍 = "值значен™👍☞⎠‱௹♣︎☐▼❒∑⨌⧭иеمرحبا"
}

class SwiftIgnoredPropertiesObject: Object {
    @ManagedProperty var name = ""
    @ManagedProperty var age = 0
    @objc dynamic var runtimeProperty: AnyObject?
    @objc dynamic var runtimeDefaultProperty = "property"
    @objc dynamic var readOnlyProperty: Int { return 0 }

    override class func ignoredProperties() -> [String] {
        return ["runtimeProperty", "runtimeDefaultProperty"]
    }
}

class SwiftRecursiveObject: Object {
    let objects = List<SwiftRecursiveObject>()
}

protocol SwiftPrimaryKeyObjectType {
    associatedtype PrimaryKey
    static func primaryKey() -> String?
}

class SwiftPrimaryStringObject: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var intCol = 0

    typealias PrimaryKey = String
    override class func primaryKey() -> String? {
        return "stringCol"
    }
}

class SwiftPrimaryOptionalStringObject: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol: String? = ""
    @ManagedProperty var intCol = 0

    typealias PrimaryKey = String?
    override class func primaryKey() -> String? {
        return "stringCol"
    }
}

class SwiftPrimaryIntObject: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var intCol = 0

    typealias PrimaryKey = Int
    override class func primaryKey() -> String? {
        return "intCol"
    }
}

class SwiftPrimaryOptionalIntObject: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var intCol: Int?

    typealias PrimaryKey = RealmOptional<Int>
    override class func primaryKey() -> String? {
        return "intCol"
    }
}

class SwiftPrimaryInt8Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int8Col: Int8 = 0

    typealias PrimaryKey = Int8
    override class func primaryKey() -> String? {
        return "int8Col"
    }
}

class SwiftPrimaryOptionalInt8Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int8Col: Int8?

    typealias PrimaryKey = RealmOptional<Int8>
    override class func primaryKey() -> String? {
        return "int8Col"
    }
}

class SwiftPrimaryInt16Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int16Col: Int16 = 0

    typealias PrimaryKey = Int16
    override class func primaryKey() -> String? {
        return "int16Col"
    }
}

class SwiftPrimaryOptionalInt16Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int16Col: Int16?

    typealias PrimaryKey = RealmOptional<Int16>
    override class func primaryKey() -> String? {
        return "int16Col"
    }
}

class SwiftPrimaryInt32Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int32Col: Int32 = 0

    typealias PrimaryKey = Int32
    override class func primaryKey() -> String? {
        return "int32Col"
    }
}

class SwiftPrimaryOptionalInt32Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int32Col: Int32?

    typealias PrimaryKey = RealmOptional<Int32>
    override class func primaryKey() -> String? {
        return "int32Col"
    }
}

class SwiftPrimaryInt64Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int64Col: Int64 = 0

    typealias PrimaryKey = Int64
    override class func primaryKey() -> String? {
        return "int64Col"
    }
}

class SwiftPrimaryOptionalInt64Object: Object, SwiftPrimaryKeyObjectType {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var int64Col: Int64?

    typealias PrimaryKey = RealmOptional<Int64>
    override class func primaryKey() -> String? {
        return "int64Col"
    }
}

class SwiftIndexedPropertiesObject: Object {
    @ManagedProperty var stringCol = ""
    @ManagedProperty var intCol = 0
    @ManagedProperty var int8Col: Int8 = 0
    @ManagedProperty var int16Col: Int16 = 0
    @ManagedProperty var int32Col: Int32 = 0
    @ManagedProperty var int64Col: Int64 = 0
    @ManagedProperty var boolCol = false
    @ManagedProperty var dateCol = Date()

    @ManagedProperty var floatCol: Float = 0.0
    @ManagedProperty var doubleCol: Double = 0.0
    @ManagedProperty var dataCol = Data()

    override class func indexedProperties() -> [String] {
        return ["stringCol", "intCol", "int8Col", "int16Col", "int32Col", "int64Col", "boolCol", "dateCol"]
    }
}

class SwiftIndexedOptionalPropertiesObject: Object {
    @ManagedProperty var optionalStringCol: String? = ""
    @ManagedProperty var optionalIntCol: Int?
    @ManagedProperty var optionalInt8Col: Int8?
    @ManagedProperty var optionalInt16Col: Int16?
    @ManagedProperty var optionalInt32Col: Int32?
    @ManagedProperty var optionalInt64Col: Int64?
    @ManagedProperty var optionalBoolCol: Bool?
    @ManagedProperty var optionalDateCol: Date? = Date()

    @ManagedProperty var optionalFloatCol: Float?
    @ManagedProperty var optionalDoubleCol: Double?
    @ManagedProperty var optionalDataCol: Data? = Data()

    override class func indexedProperties() -> [String] {
        return ["optionalStringCol", "optionalIntCol", "optionalInt8Col", "optionalInt16Col",
            "optionalInt32Col", "optionalInt64Col", "optionalBoolCol", "optionalDateCol"]
    }
}

class SwiftCustomInitializerObject: Object {
    @ManagedProperty var stringCol: String

    init(stringVal: String) {
        stringCol = stringVal
        super.init()
    }

    required override init() {
        stringCol = ""
        super.init()
    }
}

class SwiftConvenienceInitializerObject: Object {
    @ManagedProperty var stringCol = ""

    convenience init(stringCol: String) {
        self.init()
        self.stringCol = stringCol
    }
}

class SwiftObjectiveCTypesObject: Object {
    @ManagedProperty var stringCol: NSString?
    @ManagedProperty var dateCol: NSDate?
    @ManagedProperty var dataCol: NSData?
}

class SwiftComputedPropertyNotIgnoredObject: Object {
    // swiftlint:disable:next identifier_name
    @ManagedProperty var _urlBacking = ""

    // Dynamic; no ivar
    @objc dynamic var dynamicURL: URL? {
        get {
            return URL(string: _urlBacking)
        }
        set {
            _urlBacking = newValue?.absoluteString ?? ""
        }
    }

    // Non-dynamic; no ivar
    var url: URL? {
        get {
            return URL(string: _urlBacking)
        }
        set {
            _urlBacking = newValue?.absoluteString ?? ""
        }
    }
}

@objc(SwiftObjcRenamedObject)
class SwiftObjcRenamedObject: Object {
    @ManagedProperty var stringCol = ""
}

@objc(SwiftObjcRenamedObjectWithTotallyDifferentName)
class SwiftObjcArbitrarilyRenamedObject: Object {
    @ManagedProperty var boolCol = false
}

class SwiftCircleObject: Object {
    @ManagedProperty var obj: SwiftCircleObject?
    let array = List<SwiftCircleObject>()
}

// Exists to serve as a superclass to `SwiftGenericPropsOrderingObject`
class SwiftGenericPropsOrderingParent: Object {
    var implicitlyIgnoredComputedProperty: Int { return 0 }
    let implicitlyIgnoredReadOnlyProperty: Int = 1
    let parentFirstList = List<SwiftIntObject>()
    @ManagedProperty var parentFirstNumber = 0
    func parentFunction() -> Int { return parentFirstNumber + 1 }
    @ManagedProperty var parentSecondNumber = 1
    var parentComputedProp: String { return "hello world" }
}

// Used to verify that Swift properties (generic and otherwise) are detected properly and
// added to the schema in the correct order.
class SwiftGenericPropsOrderingObject: SwiftGenericPropsOrderingParent {
    func myFunction() -> Int { return firstNumber + secondNumber + thirdNumber }
    @objc dynamic var dynamicComputed: Int { return 999 }
    var firstIgnored = 999
    @ManagedProperty var dynamicIgnored = 999
    @ManagedProperty var firstNumber = 0                   // Managed property
    class func myClassFunction(x: Int, y: Int) -> Int { return x + y }
    var secondIgnored = 999
    lazy var lazyIgnored = 999
    let firstArray = List<SwiftStringObject>()          // Managed property
    @ManagedProperty var secondNumber = 0                  // Managed property
    var computedProp: String { return "\(firstNumber), \(secondNumber), and \(thirdNumber)" }
    let secondArray = List<SwiftStringObject>()         // Managed property
    override class func ignoredProperties() -> [String] {
        return ["firstIgnored", "dynamicIgnored", "secondIgnored", "thirdIgnored", "lazyIgnored", "dynamicLazyIgnored"]
    }
    @ManagedProperty var firstOptionalNumber: Int?      // Managed property
    var thirdIgnored = 999
    @objc dynamic lazy var dynamicLazyIgnored = 999
    let firstLinking = LinkingObjects(fromType: SwiftGenericPropsOrderingHelper.self, property: "first")
    let secondLinking = LinkingObjects(fromType: SwiftGenericPropsOrderingHelper.self, property: "second")
    @ManagedProperty var thirdNumber = 0                   // Managed property
    @ManagedProperty var secondOptionalNumber: Int?     // Managed property
}

// Only exists to allow linking object properties on `SwiftGenericPropsNotLastObject`.
class SwiftGenericPropsOrderingHelper: Object {
    @ManagedProperty var first: SwiftGenericPropsOrderingObject?
    @ManagedProperty var second: SwiftGenericPropsOrderingObject?
}

class SwiftRenamedProperties1: Object {
    @ManagedProperty var propA = 0
    @ManagedProperty var propB = ""
    let linking1 = LinkingObjects(fromType: LinkToSwiftRenamedProperties1.self, property: "linkA")
    let linking2 = LinkingObjects(fromType: LinkToSwiftRenamedProperties2.self, property: "linkD")

    override class func _realmObjectName() -> String { return "Swift Renamed Properties" }
    override class func _realmColumnNames() -> [String: String] {
        return ["propA": "prop 1", "propB": "prop 2"]
    }
}

class SwiftRenamedProperties2: Object {
    @ManagedProperty var propC = 0
    @ManagedProperty var propD = ""
    let linking1 = LinkingObjects(fromType: LinkToSwiftRenamedProperties1.self, property: "linkA")
    let linking2 = LinkingObjects(fromType: LinkToSwiftRenamedProperties2.self, property: "linkD")

    override class func _realmObjectName() -> String { return "Swift Renamed Properties" }
    override class func _realmColumnNames() -> [String: String] {
        return ["propC": "prop 1", "propD": "prop 2"]
    }
}

class LinkToSwiftRenamedProperties1: Object {
    @ManagedProperty var linkA: SwiftRenamedProperties1?
    @ManagedProperty var linkB: SwiftRenamedProperties2?
    let array1 = List<SwiftRenamedProperties1>()

    override class func _realmObjectName() -> String { return "Link To Swift Renamed Properties" }
    override class func _realmColumnNames() -> [String: String] {
        return ["linkA": "link 1", "linkB": "link 2", "array1": "array"]
    }
}

class LinkToSwiftRenamedProperties2: Object {
    @ManagedProperty var linkC: SwiftRenamedProperties1?
    @ManagedProperty var linkD: SwiftRenamedProperties2?
    let array2 = List<SwiftRenamedProperties2>()

    override class func _realmObjectName() -> String { return "Link To Swift Renamed Properties" }
    override class func _realmColumnNames() -> [String: String] {
        return ["linkC": "link 1", "linkD": "link 2", "array2": "array"]
    }
}

class EmbeddedParentObject: Object {
    @objc dynamic var object: EmbeddedTreeObject1?
    let array = List<EmbeddedTreeObject1>()
}

class EmbeddedPrimaryParentObject: Object {
    @ManagedProperty var pk: Int = 0
    @objc dynamic var object: EmbeddedTreeObject1?
    let array = List<EmbeddedTreeObject1>()

    override class func primaryKey() -> String? {
        return "pk"
    }
}

protocol EmbeddedTreeObject: EmbeddedObject {
    var value: Int { get set }
}

class EmbeddedTreeObject1: EmbeddedObject, EmbeddedTreeObject {
    @ManagedProperty var value = 0
    @objc dynamic var child: EmbeddedTreeObject2?
    let children = List<EmbeddedTreeObject2>()

    let parent1 = LinkingObjects(fromType: EmbeddedParentObject.self, property: "object")
    let parent2 = LinkingObjects(fromType: EmbeddedParentObject.self, property: "array")
}

class EmbeddedTreeObject2: EmbeddedObject, EmbeddedTreeObject {
    @ManagedProperty var value = 0
    @objc dynamic var child: EmbeddedTreeObject3?
    let children = List<EmbeddedTreeObject3>()

    let parent3 = LinkingObjects(fromType: EmbeddedTreeObject1.self, property: "child")
    let parent4 = LinkingObjects(fromType: EmbeddedTreeObject1.self, property: "children")
}

class EmbeddedTreeObject3: EmbeddedObject, EmbeddedTreeObject {
    @ManagedProperty var value = 0

    let parent3 = LinkingObjects(fromType: EmbeddedTreeObject2.self, property: "child")
    let parent4 = LinkingObjects(fromType: EmbeddedTreeObject2.self, property: "children")
}
