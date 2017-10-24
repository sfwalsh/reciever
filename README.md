# Reciever


## Usage

Build the *Debug* Scheme to a BLE supported iOS Device, accept all the bluetooth and location service permissions and power on Bluetooth.
When you move near an iBeacon broadcasting the associated UDID, the app will execute the network request upon confirming
the beacon is in the immediate range. (It is not possible to get an exact distance with iBeacons).

### Transmitter

For convenience there is also a Transmitter build scheme, *Debug - Transmit*, which can be deployed to another iOS device to
use it as an iBeacon for testing purposes. To use, simply run *Debug - Transmit*, power on Bluetooth and accept the Bluetooth permissions.


## Project Structure

The project is split into 5 main folders, as outlined below.

### Features

This contains the four screens in the app (the main receiver screen, the profile screen plus the dummy screen & the transmitter screen)

### Models

Contains the project models

### Components

Custom UI Components (currently only the RoundImageView as a convenience class)

### Protocols

Non feature specific protocols

### API

Contains APIRouter, a class to separate the actual network requests from the interactors that execute them. Perhaps, in a production app, several features could use the same network request in different ways. Decoupling the actual request from the usage of the result helps to keep the code more scalable in this way.


## Architecture Style

For this app I've used the Model View Presenter approach towards the feature screens of the app. Each view has a presenter, which in turn has an *unowned* reference to the view. The view's only job is to update the UI components and is "dumb", as such. The presenter abstracts all of the flow logic away from the view file. This makes the code more testable as it scales, and makes it easier to read (in my opinion). Furthermore the presenter object has an interactor object attached to it. The interactor fetches and executes network requests and supplies data to the presenter. A beacon interactor object is also used, for executing all logic relating to connecting to beacons. My main goal was to make the code as modularised as possible while maintaining readability.

A ViewRouter object has also been included for completeness. In a production app this could be used to modify the flow of the app at runtime (for example if the user is logged out, a login screen would be presented at first launch). For this app, I'm using it for convenience, tidiness and for deciding which view to present based on the target executing.


## Tests

The MVP pattern allows the logic of each screen to be separated from the view. This allows unit tests to be written more easily for the view related components. However, the tests do not cover all the code. The tests are merely there for demonstrative purposes.
