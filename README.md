# Cupcake Corner
This is an iOS app for ordering cupcakes. The app allows the user to select the type and quantity of cupcakes they would like to order, specify any special requests, and provide delivery details. The app then calculates the total cost of the order and sends it to a server using JSON. The server responds with a confirmation message, which is displayed to the user.

https://github.com/Ktamim98/CupCakeCorner/assets/124142522/b9d08053-55fa-4cf1-9e93-ca8a5089d0b2



## Features
- Users can select the type of cupcakes they want to order.
- Users can select the quantity of cupcakes they want to order.
- Users can add special requests to their order, such as extra frosting or sprinkles.
- Users can enter their delivery details, such as name, address, and zip code.
- Users can view the total cost of their order in USD.
- Users can place their order and receive a confirmation message.

## Usage
Upon opening the app, users will be greeted with a screen where they can select the type and quantity of cupcakes they want to order. They can then add special requests to their order by toggling the appropriate options. After selecting their order details, users can navigate to the delivery details screen by tapping the "Delivery details" button.
On the delivery details screen, users can enter their name, address, and zip code. The "Place Order" button will become enabled only if the user has entered a valid address. After tapping the "Place Order" button, the app will send a POST request to a dummy API to place the order. If the request is successful, the user will receive a confirmation message. Otherwise, an error message will be displayed.

## Technologies Used
- Swift
- SwiftUI
- Codable
- URLSession
- JSONEncoder
- JSONDecoder
- async/await
- AsyncImage


### Codable
- The Codable protocol is used for encoding and decoding data to and from JSON. In this app, we use it to convert our Order struct to JSON before sending it to the server and convert the response from the server back to an Order struct.

### URLSession
- We use the URLSession API to send our JSON-encoded Order struct to the server and receive the response. URLSession allows us to make HTTP requests and handle responses asynchronously.

### async/await
- The async/await feature allows us to write asynchronous code in a more synchronous style. It makes it easier to reason about the flow of our code and handle errors.

### AsyncImage
-The AsyncImage view is a built-in SwiftUI view that allows us to asynchronously download and display images from a URL.

### CodingKeys
- The CodingKeys enum is used to customize the encoding and decoding of our Order struct. It allows us to map between the property names in our struct and the corresponding keys in the JSON.

### Credits
The app is based on the "100 Days of SwiftUi" tutorial by Paul Hudson.
