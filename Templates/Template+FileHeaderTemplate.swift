import ProjectDescription

public extension FileHeaderTemplate {
    static var defaultTemplate: FileHeaderTemplate {
        .string(
            """
            //
            //  ___FILENAME___
            //  Package: ___PACKAGENAME___
            //
            //  Created on ___DATE___.
            //  © ___YEAR___ ___ORGANIZATIONNAME___ Limited. All rights reserved.
            //
            //  Confidential information of ___ORGANIZATIONNAME___ Limited. Unauthorized use or distribution is prohibited.
            //
            //  Your App Name
            //  Some description
            
            import Foundation
            """
        )
    }
}
