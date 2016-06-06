#Cryptomatic 9000!
Have you ever had an image that you wanted to offload to an external drive or upload to the cloud,
but you were afraid of it falling into the wrong hands?

###Introducing the Cryptomatic 9000!
This ingenious piece of software will tear up your picture and re-arrange it into an entirely new image!
And this isn't simple shredding either. The Cryptomatic 9000 will split your image at the molecular level
into MILLIONS of pixels before regrouping them in a completely RANDOM order, making it impossible for onlookers
to even attempt to identify even the original colors, much less the image itself. Behold the 3 S's of the Cryptomatic!

###Secure!
Normal encryption programs provide you with a master key that will allow you to decrypt any images encrypted with that key,
but that leaves a gaping security hole if someone were to obtain or even generate that key on their own.

Each image encrypted by the Cryptomatic also has a unique key generated that will only decrypt that image. What's more
the key is also an image (a very very tiny image) so you won't have to remember any long hex-keys or the like!

###Safe!
In order to start the encryption process, you must first input your own cryptokey and the name of the file you wish to encrypt.
This prevents you from accidentally encrypting the wrong image! Batch encrypting/decrypting is also not currently implemented
for the same reasons.

###Super Cool!
Not only does the Cryptomatic allow you to protect whatever images you may have, but it does so without any lossy features, like compression,
and without exposing any unnecessary security flaws. PLUS, the images it generates look pretty cool too!

#Usage Info
*Disclaimer*: Currently only supports bitmap images! Not packaged for release!
The project is still runnable, just currently optimizing some things and cleaning spaghetti code.

If you have a version of Ruby installed you can download the source and run it with
`rake` or `rake start`  
You can also run the main script directly from the bin folder but that may cause some issues.
I'm planning to port this over to JRuby to get the use of real threads/fibers so if you want
to use the future releases of this you may want to install JRuby or at least the JRE.

#Example Images
[img1_o]:
[img2_o]:
[img2_o]:
[img2_o]:
[img2_o]:
[img2_o]:

[img1_e]:
[img2_e]:
[img2_e]:
[img2_e]:
[img2_e]:
[img2_e]:

| Original          | Encrypted         |
|:-----------------:|:-----------------:|
|![alt text][img1_o]|![alt text][img1_e]|
|![alt text][img2_o]|![alt text][img2_e]|
|![alt text][img3_o]|![alt text][img3_e]|
|![alt text][img4_o]|![alt text][img4_e]|
|![alt text][img5_o]|![alt text][img5_e]|
|![alt text][img6_o]|![alt text][img6_e]|

#Coming Soon: The Cryptomatic 9001!
It's the same thing...but over 9000!

Oh, it also adds audio file encryption.

And multi-threading, did I mention that?
