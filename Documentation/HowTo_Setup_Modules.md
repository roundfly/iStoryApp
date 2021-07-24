# How to work with modules structure
Sometimes a part of an application is complex and large enough to be treated as a product of its own, we may label this product as a module.
By the module, we can define:
- An application screen with finalized business functionality (`Authentication`, `Settings`, `Activity`, etc.)
- A functional service which provides some unique functionality (`StoryClient`, `NetworkClient`, etc.)
- A shared service which provides functions or resources for other modules (`Analytics`, `DesignSystem`, etc.)
The approach consists of having a single workspace that contains multiple projects or targets exposed as libraries from a local Swift package. One project for the final product (the app) and one project or package for each module. The app depends on the modules and the modules can depend on each other. Each module compiles as a framework that is used by the application target. Modules can depend on each other (no circular dependencies though) and on 3rd party SDKs, handled by Swift Package Manager.
Each feature module should have 4 targets: Framework target, UnitTests target, Test application target to be able to test the screen and iterate on the related feature as well as a UI tests target to cover the screen by UI tests.

## How to create a new module
To create a new module you should first understand the purpose of this module - screen/feature modules should be done as an Xcode project but services, either functional or utility, can be located inside the `iStoryKit` package or can be a separate Xcode project, Xcode project is preferable for feature modules which have need of build scripts and more than 2 configurations since SPM still lacks these capabilities, otherwise you can create just a target in the iStoryKit package.

Service modules should receive names with `Client` suffix. e.g. `StoryClient`. Sometimes we may also decouple the implementation and interface (protocols and domain models) of a service module, in this case please add the `API` suffix to the module name. e.g. `StoryClientAPI`. The purpose of this decoupling is related to the fact that in order to promote a horizontal dependency graph and for Xcode cache to not be needlessly reinvalidated. 

All feature modules will link the interface modules (ones with API suffix e.g. `PageClientAPI`) while from the main app target we will link and inject the live implementation into the modules themselves (e.g. `PageClient`). This for us provides a guarantee that the cache won't be often invalidated since a public API is not expected to change while we're free to iterate on the implementation freely. Other benefits of this approach is near instantenous build times of feature modules and that it enables us to stub out all the live implementations with mock ones at will.

### How to create a new Xcode project module
1. Open new project dialog in Xcode ( File -> New -> Project -> Framework template )
2. Bundle identifier of the project should be `com.iStory.iStoryApp.{name_of_the_module}`
3. Name should clearly represent the product purpose of the module (Example: wrong - ISAuth, right - Authentication)
4. Save the project to the root of the repository
5. Move project file into `iStoryApp.xcworkspace`, keep alphabetic sort order
6. Open project settings and make `Version` library equal to the version of the app, also change deployment target to the deployment target for the app and target devices to `iPhone` and `iPad`
7. Added unit tests target into `iStoryApp.xctestplan`
* Further actions are needed only if your module is a screen/feature module 
8. Open new target dialog in Xcode ( File -> New -> Project -> App template )
9. Name should be `{name_of_the_module}TestApp`
10. Don't forget to include tests
11. Save the target in the same project as the framework
12. Open project settings
13. Remove unit tests for the test app, only UI tests should be available for the test app
14. Open `Build Phases` of the test app and add your module framework into `Dependencies`
15. Create a simple app to show your screen. You can take any screen module as an example
### How to create a new package module
1. Open `iStoryKit` package
2. Create a new folder in `Sources` with the name of your module
3. The name should clearly represent the product purpose of the module (Example: wrong - ISNWClient, right - NetworkClient)
4. Create a new folder in `Tests` with a name of `{your_module_name}Tests`
5. Add your module into `Package.swift` and also add a short description into `README.md` file
* Further actions are needed only if your module is a service that accesses a remote or local data source (DB / backend API) or if it links a third party dependency. (e.g. `StoryClient`, `NetworkClient`)
6. Create a new folder in `Sources` which matches the name of the previously created target, but append the `API` suffix to the end of its name (e.g. NetworkClientAPI)
7. Add this newly created module to the dependencies array of the related `{your_module_name}Client` target in the package manifest. (e.g. NetworkClientAPI should be added to the dependencies array of the NetorkClient target)
8. In the products array of the package manifest, expose both libraries (e.g. NetworkClient and NetworkClientAPI) as dynamic
9. Import the related abstractions in the implementations module and conform to them
```swift
import Alamofire
import Combine
import NetworkClientAPI

public struct NetworkClient: NetworkClientService {
    public init() {}
    public func perform<T: Codable>(_ request: NetworkRequest) -> AnyPublisher<T, Error> {
        // perform a network request with Alamofire
    }
}
```
10. In the main app link the live implementation while in the feature modules only link the interface module which has the API suffix
## How to version modules
All modules must have the same version as the app, so the only source of truth is the `AppVersion.xcconfig` file. Regretfully Swift Package Manager doesn't support a manual setup for a version and takes a tag from the git, so it's always important to set tags in git. But for the Xcode project, we're able to set it up.
### How to version an Xcode project module
1. Create `Configs` group at the root of the project
2. Move `Developer.xcconfig` and `Release.xcconfig` files from the `Configuration` folder into your `Configs` group without coping and including it in any target
3. Open project settings
4. Open `Info` of your project (not the target) 
5. Open `Debug` and `Release` in the `Configurations` section
6. Select `Developer` configuration for the project (not a target) in `Debug`, select `Release` configuration for the project (not a target) in `Release`
7. Open `Info.plist` of your module
8. Change `Bundle version string (short)` from `$(MARKETING_VERSION)` to `$(APP_VERSION)`

## How to add dependencies
### How to add dependencies to your module
Some modules require dependencies such as other screen modules or services. For package modules, you can just simply edit `Package.swift` of `iStoryKit`. For the Xcode project module use these actions:
1. Create `Dependencies` group at the root of the project
2. Move Xcode projects you want to have "imports" from to `Dependencies`. Without this import, Xcode will not see a framework you want to import, and code highlighting won't work for the module you import
3. Open project settings
4. Open `Build Phases` of your module and add frameworks you want to have "imports" from into `Dependencies`, it will allow recompiling dependencies together with your module if needed
5. Do not embed any frameworks into your module, only the main app can do it! Dynamic libraries such as interface modules must be embedded without codesigning.
If you want to have "imports" from a package module just:
1. Open project settings
2. Open `General` of your framework
3. Add libraries you need into `Frameworks and Libraries`. You don't need additional hacks to make Xcode see libraries like in the case with Xcode project modules
### How to add dependencies to the main app
In the end, all modules should be connected to the main app - iStoryApp application.
To add dependencies to the main app you should:
1. Follow the instruction on how to add a dependency to your module, the main app is also a kind of module so all the steps are the same
1. Open project settings of the app
2. Open `General`
3. Add all dependencies you need into `Frameworks and Libraries`
3. Mark all Xcode frameworks as `Embed & Sign`
