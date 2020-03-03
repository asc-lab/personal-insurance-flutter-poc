# Personal Insurance Flutter PoC

An example Flutter project with a lot of shenanigans commonly encountered in business apps.




## Blog Post

https://altkomsoftware.pl/blog/flutter-dart-quickly-build-mobile-app-without-losing-much-hair/



# Dependecy

The application attempts to access a running Mockoon Mock API at startup. If the local server is not running, application will simply fail with a blank screen. 

- Mockoon
  - https://mockoon.com/
  - https://github.com/mockoon/mockoon
  - - e.g. MacOS Install: `brew cask install mockoon`



# Running

- Ensure Mockoon Environment is configured with `mockoon_environment` - (import JSON into Mockoon UI). 
- Ensure Mockoon APIs are running locally
- Ensure API routes are accessible on `0.0.0.0` i.e. `localhost`, `127.0.0.1`
- - e.g. http://localhost:3000/personalInsuranceFlutter/getDicts
- Ensure the `apiURL` static field in `lib/services/Helper` class is correctly set
  - Localhost setting for `apiURL` for The Android and iOS will differ, see below. 



## Android

- Ensure the emulator can access `localhost` via `10.0.2.2` in Dart code. 
  
  - Special alias to your host loopback interface (i.e., 127.0.0.1 on your development machine) 
  - https://developer.android.com/studio/run/emulator-networking.html
  



## iOS

The iOS Simulator uses the host machine network so you should be able to just use `localhost` or your machines IP address, whichever IP your web service is listening on.

More info on https://stackoverflow.com/questions/6077888/how-do-i-access-the-host-machine-itself-from-the-iphone-simulator

You will need to add the following to the project's `Info.plist`.

```
<key>NSAppTransportSecurity</key>
<dict>
    <key>NSAllowsArbitraryLoads</key>
        <true/>
</dict>  
```

Otherwise this error is going to happen.

```
Cannot start load of Task <xx-xx>.<x> since it does not conform to ATS policy.
```



## Author

Wojtek Suwala - https://github.com/wojteksuwala

Altkom Software & Consulting - https://github.com/asc-lab



## License

The MIT License (MIT)