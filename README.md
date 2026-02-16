# ODBCKit-swift

This is a work in progress of a full port of the ODBCKit from Objective-C to
Swift. It will eventually replace the Objective-C API.

## Building

There are a couple of options as to how to build this package. The default is 
to link to the iODBC.Framework that is installed with the Actual Technologies
ODBC Manager for macOS. However, at present it is also viable to build against
unixodbc. At present, the iODBC build can also be done, but we have not taken
the time to build all the bootstrap pieces to build it static linked to 
eliminate the need to manage .dylib distribution, or .framework distribution as 
well.

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

All of the unittests at this point run against SQL Server in a Docker container.
At some time in the future we will add PostgreSQL and MySQL to the mix.

```sh
docker run -d -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Just4Dev@" \
    -p 1433:1433 --name odbckit.sql2022 \
    --platform linux/amd64 mcr.microsoft.com/mssql/server:2022-latest
```

The database does require a unittesting database, though it can be empty. Open
your favorite data management tool and run: 

```sql
create database unittesting;
```

## Dependencies

### Swift Package Manager

*   [ODBCKit-Swift](https://www.druware.com/products/ODBCKit)
            
    
## History

2026-02-16 - Code cleanup. Added more functions and tests.

* switched from homebrew dylibs to direct linking unixodbc static libraries
* enabled default linking against iODBC.framework from [Actual Technologies](https://www.actualtech.com)
* changed the unittests to a generic test dsn name. Added docker container commands for testing
* testing a binary distribution model to eliminate the need for building the underlying libraries

2026-02-01 - Continuing Port and UnitTesting

* Added support for connections using ConnectionStrings not just DSN's
* Moved Datasources list function to static ODBC class
* Moved Drivers list function to static ODBC class
* Added unittests to all of the above
* Added documentation to the ODBC class.
                   
