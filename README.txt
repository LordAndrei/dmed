SAMPLE MARVEL DOWNLOAD APP


This app is in fulfillment of the application process for a position in DMED. 

LOCATION:
The location for this project is in Github at https://github.com/LordAndrei/dmed


INTERNALS:
To save time the app makes use of two Cocoapods. It was deemed that the process of how to do the networking was not as essential as the processing and presentation of the data so these convenience libraries were elected to make for more readable code.

	AlamoFire is used as a wrapper on networking.
	SDWebImageSwiftUI is used to deal with loading images from the network.


MARVEL SDK DEVELOPER KEYS:
A utility class DmedUtils takes care of processing the header block. Within DmedUtils is a static function called getHeaders(). Within there should be clear denotation for where the keys should be entered. The Keys should be entered as a text string containing the Hex values.


