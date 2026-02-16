# ODBCKit-swift

This is a work in progress of a full port of the ODBCKit from Objective-C to
Swift. It will eventually replace the Objective-C API.

## Building

There are a couple of options as to how to build this package. The default is 
to link to the iODBC.Framework that is installed with the Actual Technologies
ODBC Manager for macOS. 

This is built using the unixodbc backend by default. For our purposes, we want 
a fully static built library for inclusion into the package. If you are using 
Swift Package Manager, or building this by hand, you will want to also install 
unixodbc and build a copy for this package to build agaist. The last step is to 
ensure that the linker does not link against the .dylib easing your distrbution.

```sh
./configure --enable-static --disable-dynamic --prefix=/opt/local/odbc --sysconfdir=/Library/ODBC
make
sudo make install
sudo rm -rf /opt/local/odbc/lib/*.dylib
```

In addition, this can be built against libiodbc as well. 

## Unit Testing

```sh
docker run -d -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Just4Dev@" \
    -p 1433:1433 --name odbckit.sql2022 \
    --platform linux/amd64 mcr.microsoft.com/mssql/server:2022-latest
```


## Dependencies

### Swift Package Manager

*   [ODBCKit](https://www.druware.com/products/ODBCKit)
                
    ### Homebrew
              
    *   [libiodbc](https://formulae.brew.sh/formula/libiodbc)
    
## History

2026-02-01 - Continuing Port and UnitTesting

* Added support for connections using ConnectionStrings not just DSN's
* Moved Datasources list function to static ODBC class
* Moved Drivers list function to static ODBC class
* Added unittests to all of the above
* Added documentation to the ODBC class.
                   
