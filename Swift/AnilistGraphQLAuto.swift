//  This file was automatically generated and should not be edited.

import Apollo

/// Media list watching/reading status enum.
public enum MediaListStatus: RawRepresentable, Equatable, Hashable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  /// Currently watching/reading
  case current
  /// Planning to watch/read
  case planning
  /// Finished watching/reading
  case completed
  /// Stopped watching/reading before completing
  case dropped
  /// Paused watching/reading
  case paused
  /// Re-watching/reading
  case repeating
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "CURRENT": self = .current
      case "PLANNING": self = .planning
      case "COMPLETED": self = .completed
      case "DROPPED": self = .dropped
      case "PAUSED": self = .paused
      case "REPEATING": self = .repeating
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .current: return "CURRENT"
      case .planning: return "PLANNING"
      case .completed: return "COMPLETED"
      case .dropped: return "DROPPED"
      case .paused: return "PAUSED"
      case .repeating: return "REPEATING"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: MediaListStatus, rhs: MediaListStatus) -> Bool {
    switch (lhs, rhs) {
      case (.current, .current): return true
      case (.planning, .planning): return true
      case (.completed, .completed): return true
      case (.dropped, .dropped): return true
      case (.paused, .paused): return true
      case (.repeating, .repeating): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class GetAllFromLibraryQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetAllFromLibrary($userId: Int!) {\n  MediaListCollection(userId: $userId, status_in: [CURRENT, PLANNING, COMPLETED, DROPPED, PAUSED], type: ANIME) {\n    __typename\n    lists {\n      __typename\n      entries {\n        __typename\n        media {\n          __typename\n          title {\n            __typename\n            romaji\n          }\n        }\n        progress\n        status\n      }\n    }\n  }\n}"

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("MediaListCollection", arguments: ["userId": GraphQLVariable("userId"), "status_in": ["CURRENT", "PLANNING", "COMPLETED", "DROPPED", "PAUSED"], "type": "ANIME"], type: .object(MediaListCollection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mediaListCollection: MediaListCollection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "MediaListCollection": mediaListCollection.flatMap { (value: MediaListCollection) -> ResultMap in value.resultMap }])
    }

    /// Media list collection query, provides list pre-grouped by status & custom lists. User ID and Media Type arguments required.
    public var mediaListCollection: MediaListCollection? {
      get {
        return (resultMap["MediaListCollection"] as? ResultMap).flatMap { MediaListCollection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "MediaListCollection")
      }
    }

    public struct MediaListCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["MediaListCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lists", type: .list(.object(List.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lists: [List?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaListCollection", "lists": lists.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Grouped media list entries
      public var lists: [List?]? {
        get {
          return (resultMap["lists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [List?] in value.map { (value: ResultMap?) -> List? in value.flatMap { (value: ResultMap) -> List in List(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }, forKey: "lists")
        }
      }

      public struct List: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaListGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("entries", type: .list(.object(Entry.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(entries: [Entry?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaListGroup", "entries": entries.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Media list entries
        public var entries: [Entry?]? {
          get {
            return (resultMap["entries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Entry?] in value.map { (value: ResultMap?) -> Entry? in value.flatMap { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }, forKey: "entries")
          }
        }

        public struct Entry: GraphQLSelectionSet {
          public static let possibleTypes = ["MediaList"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("progress", type: .scalar(Int.self)),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(media: Medium? = nil, progress: Int? = nil, status: MediaListStatus? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaList", "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "progress": progress, "status": status])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          /// The amount of episodes/chapters consumed by the user
          public var progress: Int? {
            get {
              return resultMap["progress"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progress")
            }
          }

          /// The watching/reading status
          public var status: MediaListStatus? {
            get {
              return resultMap["status"] as? MediaListStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["Media"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .object(Title.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: Title? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The official titles of the media in various languages
            public var title: Title? {
              get {
                return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "title")
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes = ["MediaTitle"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("romaji", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(romaji: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The romanization of the native language title
              public var romaji: String? {
                get {
                  return resultMap["romaji"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "romaji")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetPlannedQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetPlanned($userId: Int!) {\n  MediaListCollection(userId: $userId, status_in: [PLANNING], type: ANIME) {\n    __typename\n    lists {\n      __typename\n      entries {\n        __typename\n        media {\n          __typename\n          title {\n            __typename\n            userPreferred\n          }\n        }\n        progress\n      }\n    }\n  }\n}"

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("MediaListCollection", arguments: ["userId": GraphQLVariable("userId"), "status_in": ["PLANNING"], "type": "ANIME"], type: .object(MediaListCollection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mediaListCollection: MediaListCollection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "MediaListCollection": mediaListCollection.flatMap { (value: MediaListCollection) -> ResultMap in value.resultMap }])
    }

    /// Media list collection query, provides list pre-grouped by status & custom lists. User ID and Media Type arguments required.
    public var mediaListCollection: MediaListCollection? {
      get {
        return (resultMap["MediaListCollection"] as? ResultMap).flatMap { MediaListCollection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "MediaListCollection")
      }
    }

    public struct MediaListCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["MediaListCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lists", type: .list(.object(List.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lists: [List?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaListCollection", "lists": lists.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Grouped media list entries
      public var lists: [List?]? {
        get {
          return (resultMap["lists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [List?] in value.map { (value: ResultMap?) -> List? in value.flatMap { (value: ResultMap) -> List in List(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }, forKey: "lists")
        }
      }

      public struct List: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaListGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("entries", type: .list(.object(Entry.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(entries: [Entry?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaListGroup", "entries": entries.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Media list entries
        public var entries: [Entry?]? {
          get {
            return (resultMap["entries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Entry?] in value.map { (value: ResultMap?) -> Entry? in value.flatMap { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }, forKey: "entries")
          }
        }

        public struct Entry: GraphQLSelectionSet {
          public static let possibleTypes = ["MediaList"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("progress", type: .scalar(Int.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(media: Medium? = nil, progress: Int? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaList", "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "progress": progress])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          /// The amount of episodes/chapters consumed by the user
          public var progress: Int? {
            get {
              return resultMap["progress"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progress")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["Media"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .object(Title.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: Title? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The official titles of the media in various languages
            public var title: Title? {
              get {
                return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "title")
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes = ["MediaTitle"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("userPreferred", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(userPreferred: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaTitle", "userPreferred": userPreferred])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GetCurrentWatchingQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetCurrentWatching($userId: Int!) {\n  MediaListCollection(userId: $userId, status_in: [CURRENT], type: ANIME) {\n    __typename\n    lists {\n      __typename\n      entries {\n        __typename\n        media {\n          __typename\n          title {\n            __typename\n            userPreferred\n            english\n          }\n        }\n        progress\n        status\n      }\n    }\n  }\n}"

  public var userId: Int

  public init(userId: Int) {
    self.userId = userId
  }

  public var variables: GraphQLMap? {
    return ["userId": userId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("MediaListCollection", arguments: ["userId": GraphQLVariable("userId"), "status_in": ["CURRENT"], "type": "ANIME"], type: .object(MediaListCollection.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(mediaListCollection: MediaListCollection? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "MediaListCollection": mediaListCollection.flatMap { (value: MediaListCollection) -> ResultMap in value.resultMap }])
    }

    /// Media list collection query, provides list pre-grouped by status & custom lists. User ID and Media Type arguments required.
    public var mediaListCollection: MediaListCollection? {
      get {
        return (resultMap["MediaListCollection"] as? ResultMap).flatMap { MediaListCollection(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "MediaListCollection")
      }
    }

    public struct MediaListCollection: GraphQLSelectionSet {
      public static let possibleTypes = ["MediaListCollection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("lists", type: .list(.object(List.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(lists: [List?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaListCollection", "lists": lists.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// Grouped media list entries
      public var lists: [List?]? {
        get {
          return (resultMap["lists"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [List?] in value.map { (value: ResultMap?) -> List? in value.flatMap { (value: ResultMap) -> List in List(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [List?]) -> [ResultMap?] in value.map { (value: List?) -> ResultMap? in value.flatMap { (value: List) -> ResultMap in value.resultMap } } }, forKey: "lists")
        }
      }

      public struct List: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaListGroup"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("entries", type: .list(.object(Entry.selections))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(entries: [Entry?]? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaListGroup", "entries": entries.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Media list entries
        public var entries: [Entry?]? {
          get {
            return (resultMap["entries"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Entry?] in value.map { (value: ResultMap?) -> Entry? in value.flatMap { (value: ResultMap) -> Entry in Entry(unsafeResultMap: value) } } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Entry?]) -> [ResultMap?] in value.map { (value: Entry?) -> ResultMap? in value.flatMap { (value: Entry) -> ResultMap in value.resultMap } } }, forKey: "entries")
          }
        }

        public struct Entry: GraphQLSelectionSet {
          public static let possibleTypes = ["MediaList"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("media", type: .object(Medium.selections)),
            GraphQLField("progress", type: .scalar(Int.self)),
            GraphQLField("status", type: .scalar(MediaListStatus.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(media: Medium? = nil, progress: Int? = nil, status: MediaListStatus? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaList", "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }, "progress": progress, "status": status])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var media: Medium? {
            get {
              return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "media")
            }
          }

          /// The amount of episodes/chapters consumed by the user
          public var progress: Int? {
            get {
              return resultMap["progress"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "progress")
            }
          }

          /// The watching/reading status
          public var status: MediaListStatus? {
            get {
              return resultMap["status"] as? MediaListStatus
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public struct Medium: GraphQLSelectionSet {
            public static let possibleTypes = ["Media"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("title", type: .object(Title.selections)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(title: Title? = nil) {
              self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The official titles of the media in various languages
            public var title: Title? {
              get {
                return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "title")
              }
            }

            public struct Title: GraphQLSelectionSet {
              public static let possibleTypes = ["MediaTitle"]

              public static let selections: [GraphQLSelection] = [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("userPreferred", type: .scalar(String.self)),
                GraphQLField("english", type: .scalar(String.self)),
              ]

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(userPreferred: String? = nil, english: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "MediaTitle", "userPreferred": userPreferred, "english": english])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The currently authenticated users preferred title language. Default romaji for non-authenticated
              public var userPreferred: String? {
                get {
                  return resultMap["userPreferred"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "userPreferred")
                }
              }

              /// The official english title
              public var english: String? {
                get {
                  return resultMap["english"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "english")
                }
              }
            }
          }
        }
      }
    }
  }
}

public final class GraphgetAnimeByMalIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query GraphgetAnimeByMalId($malId: Int!) {\n  Media(idMal: $malId) {\n    __typename\n    id\n    title {\n      __typename\n      romaji\n    }\n    episodes\n    mediaListEntry {\n      __typename\n      progress\n      status\n    }\n  }\n}"

  public var malId: Int

  public init(malId: Int) {
    self.malId = malId
  }

  public var variables: GraphQLMap? {
    return ["malId": malId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Media", arguments: ["idMal": GraphQLVariable("malId")], type: .object(Medium.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes = ["Media"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("episodes", type: .scalar(Int.self)),
        GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: Title? = nil, episodes: Int? = nil, mediaListEntry: MediaListEntry? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "episodes": episodes, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the media
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaTitle"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("romaji", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(romaji: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaList"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("progress", type: .scalar(Int.self)),
          GraphQLField("status", type: .scalar(MediaListStatus.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(progress: Int? = nil, status: MediaListStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "progress": progress, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? {
          get {
            return resultMap["progress"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "progress")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }
    }
  }
}

public final class GraphGetAnimeByIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query GraphGetAnimeById($Id: Int!) {\n  Media(id: $Id) {\n    __typename\n    id\n    title {\n      __typename\n      romaji\n    }\n    episodes\n    mediaListEntry {\n      __typename\n      progress\n      status\n    }\n  }\n}"

  public var Id: Int

  public init(Id: Int) {
    self.Id = Id
  }

  public var variables: GraphQLMap? {
    return ["Id": Id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Media", arguments: ["id": GraphQLVariable("Id")], type: .object(Medium.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes = ["Media"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("episodes", type: .scalar(Int.self)),
        GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: Title? = nil, episodes: Int? = nil, mediaListEntry: MediaListEntry? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "episodes": episodes, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the media
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaTitle"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("romaji", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(romaji: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaList"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("progress", type: .scalar(Int.self)),
          GraphQLField("status", type: .scalar(MediaListStatus.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(progress: Int? = nil, status: MediaListStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "progress": progress, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? {
          get {
            return resultMap["progress"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "progress")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }
    }
  }
}

public final class GetAnimeByNameQuery: GraphQLQuery {
  public let operationDefinition =
    "query GetAnimeByName($animeTitle: String!) {\n  Media(search: $animeTitle) {\n    __typename\n    id\n    title {\n      __typename\n      romaji\n    }\n    episodes\n    mediaListEntry {\n      __typename\n      progress\n      status\n    }\n  }\n}"

  public var animeTitle: String

  public init(animeTitle: String) {
    self.animeTitle = animeTitle
  }

  public var variables: GraphQLMap? {
    return ["animeTitle": animeTitle]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Media", arguments: ["search": GraphQLVariable("animeTitle")], type: .object(Medium.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(media: Medium? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
    }

    /// Media query
    public var media: Medium? {
      get {
        return (resultMap["Media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Media")
      }
    }

    public struct Medium: GraphQLSelectionSet {
      public static let possibleTypes = ["Media"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("title", type: .object(Title.selections)),
        GraphQLField("episodes", type: .scalar(Int.self)),
        GraphQLField("mediaListEntry", type: .object(MediaListEntry.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, title: Title? = nil, episodes: Int? = nil, mediaListEntry: MediaListEntry? = nil) {
        self.init(unsafeResultMap: ["__typename": "Media", "id": id, "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }, "episodes": episodes, "mediaListEntry": mediaListEntry.flatMap { (value: MediaListEntry) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the media
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The official titles of the media in various languages
      public var title: Title? {
        get {
          return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "title")
        }
      }

      /// The amount of episodes the anime has when complete
      public var episodes: Int? {
        get {
          return resultMap["episodes"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "episodes")
        }
      }

      /// The authenticated user's media list entry for the media
      public var mediaListEntry: MediaListEntry? {
        get {
          return (resultMap["mediaListEntry"] as? ResultMap).flatMap { MediaListEntry(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "mediaListEntry")
        }
      }

      public struct Title: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaTitle"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("romaji", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(romaji: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The romanization of the native language title
        public var romaji: String? {
          get {
            return resultMap["romaji"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "romaji")
          }
        }
      }

      public struct MediaListEntry: GraphQLSelectionSet {
        public static let possibleTypes = ["MediaList"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("progress", type: .scalar(Int.self)),
          GraphQLField("status", type: .scalar(MediaListStatus.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(progress: Int? = nil, status: MediaListStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "MediaList", "progress": progress, "status": status])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The amount of episodes/chapters consumed by the user
        public var progress: Int? {
          get {
            return resultMap["progress"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "progress")
          }
        }

        /// The watching/reading status
        public var status: MediaListStatus? {
          get {
            return resultMap["status"] as? MediaListStatus
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }
      }
    }
  }
}

public final class MutateListEntryMutation: GraphQLMutation {
  public let operationDefinition =
    "mutation mutateListEntry($animeId: Int, $progress: Int, $status: MediaListStatus) {\n  SaveMediaListEntry(mediaId: $animeId, progress: $progress, status: $status) {\n    __typename\n    id\n    progress\n    status\n    media {\n      __typename\n      title {\n        __typename\n        romaji\n      }\n    }\n  }\n}"

  public var animeId: Int?
  public var progress: Int?
  public var status: MediaListStatus?

  public init(animeId: Int? = nil, progress: Int? = nil, status: MediaListStatus? = nil) {
    self.animeId = animeId
    self.progress = progress
    self.status = status
  }

  public var variables: GraphQLMap? {
    return ["animeId": animeId, "progress": progress, "status": status]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Mutation"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("SaveMediaListEntry", arguments: ["mediaId": GraphQLVariable("animeId"), "progress": GraphQLVariable("progress"), "status": GraphQLVariable("status")], type: .object(SaveMediaListEntry.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(saveMediaListEntry: SaveMediaListEntry? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "SaveMediaListEntry": saveMediaListEntry.flatMap { (value: SaveMediaListEntry) -> ResultMap in value.resultMap }])
    }

    /// Create or update a media list entry
    public var saveMediaListEntry: SaveMediaListEntry? {
      get {
        return (resultMap["SaveMediaListEntry"] as? ResultMap).flatMap { SaveMediaListEntry(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "SaveMediaListEntry")
      }
    }

    public struct SaveMediaListEntry: GraphQLSelectionSet {
      public static let possibleTypes = ["MediaList"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
        GraphQLField("progress", type: .scalar(Int.self)),
        GraphQLField("status", type: .scalar(MediaListStatus.self)),
        GraphQLField("media", type: .object(Medium.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int, progress: Int? = nil, status: MediaListStatus? = nil, media: Medium? = nil) {
        self.init(unsafeResultMap: ["__typename": "MediaList", "id": id, "progress": progress, "status": status, "media": media.flatMap { (value: Medium) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the list entry
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The amount of episodes/chapters consumed by the user
      public var progress: Int? {
        get {
          return resultMap["progress"] as? Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "progress")
        }
      }

      /// The watching/reading status
      public var status: MediaListStatus? {
        get {
          return resultMap["status"] as? MediaListStatus
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      public var media: Medium? {
        get {
          return (resultMap["media"] as? ResultMap).flatMap { Medium(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "media")
        }
      }

      public struct Medium: GraphQLSelectionSet {
        public static let possibleTypes = ["Media"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("title", type: .object(Title.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(title: Title? = nil) {
          self.init(unsafeResultMap: ["__typename": "Media", "title": title.flatMap { (value: Title) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The official titles of the media in various languages
        public var title: Title? {
          get {
            return (resultMap["title"] as? ResultMap).flatMap { Title(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "title")
          }
        }

        public struct Title: GraphQLSelectionSet {
          public static let possibleTypes = ["MediaTitle"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("romaji", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(romaji: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "MediaTitle", "romaji": romaji])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The romanization of the native language title
          public var romaji: String? {
            get {
              return resultMap["romaji"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "romaji")
            }
          }
        }
      }
    }
  }
}

public final class GetOwnAnilistUserIdQuery: GraphQLQuery {
  public let operationDefinition =
    "query getOwnAnilistUserId {\n  Viewer {\n    __typename\n    id\n  }\n}"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("Viewer", type: .object(Viewer.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(viewer: Viewer? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "Viewer": viewer.flatMap { (value: Viewer) -> ResultMap in value.resultMap }])
    }

    /// Get the currently authenticated user
    public var viewer: Viewer? {
      get {
        return (resultMap["Viewer"] as? ResultMap).flatMap { Viewer(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "Viewer")
      }
    }

    public struct Viewer: GraphQLSelectionSet {
      public static let possibleTypes = ["User"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(Int.self))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: Int) {
        self.init(unsafeResultMap: ["__typename": "User", "id": id])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the user
      public var id: Int {
        get {
          return resultMap["id"]! as! Int
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }
    }
  }
}