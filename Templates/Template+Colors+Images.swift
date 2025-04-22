import UIKit

// MARK: - Color Resource Type

public struct AppColorResource {
    public let name: String
    public let bundle: Bundle
    
    public init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }
}

// MARK: - Image Resource Type

public struct AppImageResource {
    public let name: String
    public let bundle: Bundle
    
    public init(name: String, bundle: Bundle) {
        self.name = name
        self.bundle = bundle
    }
}

// MARK: - UIColor Extension

public extension UIColor {
    convenience init(resource: AppColorResource) {
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
    }
}

// MARK: - UIImage Extension

public extension UIImage {
    convenience init(resource: AppImageResource) {
        self.init(named: resource.name, in: resource.bundle, compatibleWith: nil)!
    }
}

// MARK: - Generated Color Resources

{% if catalogs %}
{% for catalog in catalogs %}
{% for asset in catalog.assets %}
{% if asset.type == "color" %}
{% set propertyName %}{{ asset.name | swiftIdentifier:"pretty" | titlecase | lowerFirstWord }}{% endset %}
public extension AppColorResource {
    static let {{ propertyName }} = AppColorResource(name: "{{ asset.name }}", bundle: .module)
}

public extension UIColor {
    static let {{ propertyName }} = UIColor(resource: AppColorResource.{{ propertyName }})
}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}

// MARK: - Generated Image Resources

{% if catalogs %}
{% for catalog in catalogs %}
{% for asset in catalog.assets %}
{% if asset.type == "image" %}
{% set propertyName %}{{ asset.name | swiftIdentifier:"pretty" | titlecase | lowerFirstWord }}{% endset %}
public extension AppImageResource {
    static let {{ propertyName }} = AppImageResource(name: "{{ asset.name }}", bundle: .module)
}

public extension UIImage {
    static let {{ propertyName }} = UIImage(resource: AppImageResource.{{ propertyName }})
}
{% endif %}
{% endfor %}
{% endfor %}
{% endif %}
