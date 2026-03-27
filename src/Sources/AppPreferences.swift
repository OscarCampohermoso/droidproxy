import Foundation

enum AppPreferences {
    static let forceMaxOpus46EffortKey = "forceMaxOpus46Effort"
    static let defaultForceMaxOpus46Effort = true
    static let proxyPortKey = "proxyPort"
    static let backendPortKey = "backendPort"
    static let defaultProxyPort = 8417
    static let defaultBackendPort = 8418
    static let validPortRange = 1024...65535

    static var forceMaxOpus46Effort: Bool {
        let defaults = UserDefaults.standard
        guard defaults.object(forKey: forceMaxOpus46EffortKey) != nil else {
            return defaultForceMaxOpus46Effort
        }
        return defaults.bool(forKey: forceMaxOpus46EffortKey)
    }

    static var proxyPort: Int {
        normalizedPort(UserDefaults.standard.object(forKey: proxyPortKey) as? Int, fallback: defaultProxyPort)
    }

    static var backendPort: Int {
        normalizedPort(UserDefaults.standard.object(forKey: backendPortKey) as? Int, fallback: defaultBackendPort)
    }

    static func normalizedPort(_ candidate: Int?, fallback: Int) -> Int {
        guard let candidate, validPortRange.contains(candidate) else {
            return fallback
        }
        return candidate
    }

    static func areValidPorts(proxyPort: Int, backendPort: Int) -> Bool {
        validPortRange.contains(proxyPort) &&
        validPortRange.contains(backendPort) &&
        proxyPort != backendPort
    }

    static func savePorts(proxyPort: Int, backendPort: Int) {
        let defaults = UserDefaults.standard
        defaults.set(proxyPort, forKey: proxyPortKey)
        defaults.set(backendPort, forKey: backendPortKey)
    }
}
