We can setup different environments for development, staging and production using configurations & schemes. This allows us to easily switch between environments and create builds.

### Setup

1. Rename the existing configurations from `Debug` & `Release` to `Debug Dev` & `Release Dev`. These will be the debug configurations.
2. Duplicate the debug configuration twice and create `Debug Stag` & `Debug Prod`. Do the same thing again for `Release Stag` & `Release Prod`.
3. Add a User defined setting, called `BASE_URL`, and set the values for each configuration.
4. Open the Info.plist and add a key called `BaseUrl` with the value `$(BASE_URL)`. This will allow us to read the value of the user defined setting in the app code
5. Rename the current scheme from the app name to `Dev`, and create two new schemes `Stag` & `Prod`. Make sure all the schemes are Shared so they get commited to source control.
6. Edit each scheme and set the correct Build Configuration for each step. Run, Test & Analyze should have the Debug configurations, Profile and Archive Release.
7. After this is done we can read baseUrl value in the app code from the main bundle info dictionary.

Example

```
if let info = Bundle.main.infoDictionary, let baseUrl = info["BaseUrl"] as? String {
            print(baseUrl)
        }
```

### Options

There are a lot of options that can be different between app environments

- Different bundle ids for diffrent environments. This will allow us to have multiple environments of the app installed side by side on the same device. The only issue with this approach is that we will not be able to distribute dev & stag builds to testers via Testflight since it requires an app to be created on AppStore connect.
- Different app names or icons are a great name to easily distinguish which version we have installed.
- Preprocessor macros can be used to toggle parts of the code for each environment.
