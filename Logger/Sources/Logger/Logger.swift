import OSLog

public func LOG(
  _ message: String,
  subsystem: String = Bundle.main.bundleIdentifier ?? "Unknown",
  category: LogingCategory = .viewcycle,
  loggingLevel: LoggingLevel = .debug,
  privacyLevel: PrivacyLevel = .auto,
  file: String = #file,
  line: Int = #line,
  column: Int = #column
) {
  let logger = Logger(subsystem: subsystem, category: category.rawValue)
  let fileName = (file as NSString).lastPathComponent
  let formattedMessage = "[\(fileName):\(line):\(column)] \(loggingLevel.symbol) \(message)"

  switch loggingLevel {
  case .trace:
    switch privacyLevel {
    case .public:
      logger.trace("\(formattedMessage, privacy: .public)")
    case .private:
      logger.trace("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.trace("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.trace("\(formattedMessage, privacy: .auto)")
    }
  case .debug:
    switch privacyLevel {
    case .public:
      logger.debug("\(formattedMessage, privacy: .public)")
    case .private:
      logger.debug("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.debug("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.debug("\(formattedMessage, privacy: .auto)")
    }
  case .info:
    switch privacyLevel {
    case .public:
      logger.info("\(formattedMessage, privacy: .public)")
    case .private:
      logger.info("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.info("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.info("\(formattedMessage, privacy: .auto)")
    }
  case .notice:
    switch privacyLevel {
    case .public:
      logger.notice("\(formattedMessage, privacy: .public)")
    case .private:
      logger.notice("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.notice("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.notice("\(formattedMessage, privacy: .auto)")
    }
  case .warning:
    switch privacyLevel {
    case .public:
      logger.warning("\(formattedMessage, privacy: .public)")
    case .private:
      logger.warning("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.warning("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.warning("\(formattedMessage, privacy: .auto)")
    }
  case .error:
    switch privacyLevel {
    case .public:
      logger.error("\(formattedMessage, privacy: .public)")
    case .private:
      logger.error("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.error("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.error("\(formattedMessage, privacy: .auto)")
    }
  case .critical:
    switch privacyLevel {
    case .public:
      logger.critical("\(formattedMessage, privacy: .public)")
    case .private:
      logger.critical("\(formattedMessage, privacy: .private)")
    case .sensitive:
      logger.critical("\(formattedMessage, privacy: .sensitive)")
    case .auto:
      logger.critical("\(formattedMessage, privacy: .auto)")
    }
  default:
    break
  }
}
