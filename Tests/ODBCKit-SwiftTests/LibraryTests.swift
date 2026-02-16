//
//  Untitled.swift
//  ODBCKit-Swift
//
//  Created by Andrew Satori on 2/16/26.
//

import Testing
@testable import ODBCKit_Swift

@Test func testIdentifyLibrary() async throws {
    
    // discover if we are using iodbc, unixodbc, or one of these via homebrew.
    
    // ActualTech manager installs to /Library/ODBC and keeps it's .ini files
    // there.
    
    // HomeBrew - iodbc
    // HomeBrew - unixodbc
    //
    //
    // iODBC - default ( libiodbc, /opt/lib /opt/local/lib, /usr/local/lib )
    //      default config in /usr/local/etc and ~/
    //          opt/etc and
    //          /opt/local/etc
    // unixodbc - default ( libodbc, /opt/lib /opt/local/lib, /usr/local/lib )
    //      default config in /usr/local/etc and ~/
    //          opt/etc and
    //          /opt/local/etc
    
    
    
    
    
}
