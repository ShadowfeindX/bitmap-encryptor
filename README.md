##Updates
- [x] Command line usage added
- [x] File processing heavily optimized

#The Cryptomatic 9000!
Have you ever had an image that you wanted to offload to an external drive or upload to the cloud,
but you were afraid of it falling into the wrong hands?

#Introducing the Cryptomatic 9000!
This ingenious piece of software will tear up your picture and re-arrange it into an entirely new image!
And this isn't simple shredding either. The Cryptomatic 9000 will split your image at the molecular level
into MILLIONS of pixels before regrouping them in a completely RANDOM order! Not only that, but it also recalculates
a new RGB(hex) value for each pixel it scans, making it impossible for onlookers to even attempt to identify even the
original colors, much less the image itself.  
###Behold the 3 S's of the Cryptomatic!

##Secure!
Normal encryption programs provide you with a master key that will allow you to decrypt any images encrypted with that key,
but that leaves a gaping security hole if someone were to obtain or even generate that key on their own.

Each image encrypted by the Cryptomatic also has a unique key generated that will only decrypt that image. What's more
the key is also an image (a very very tiny image) so you won't have to remember any long hex-keys or the like!

##Safe!
In order to start the encryption process, you must first input your own cryptokey and the name of the file you wish to encrypt.
This prevents you from accidentally encrypting the wrong image!

##Super Cool!
Not only does the Cryptomatic allow you to protect whatever images you may have, but it does so without any lossy features, like compression,
and without exposing any unnecessary security flaws. PLUS, the images it generates look pretty cool too!

#Usage Info
*Disclaimer*: Currently only supports bitmap images! Not packaged for release!

If you have a version of Ruby installed you can download the source and run it with `rake` or `rake start`  
You can also run the main script directly using `ruby bin/main` from the project folder.  
You can also use the script as a command line tool! Run `ruby bin/main -h` for more usage info.

#Example Images
[img1_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img1.bmp "Test Image 1 (Original)"
[img2_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img2.bmp "Test Image 2 (Original)"
[img3_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img3.bmp "Test Image 3 (Original)"
[img4_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img4.bmp "Test Image 4 (Original)"
[img5_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img5.bmp "Test Image 5 (Original)"
[img6_o]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img6.bmp "Test Image 6 (Original)"

[img1_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img1_enc.bmp "Test Image 1 (Encrypted)"
[img2_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img2_enc.bmp "Test Image 2 (Encrypted)"
[img3_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img3_enc.bmp "Test Image 3 (Encrypted)"
[img4_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img4_enc.bmp "Test Image 4 (Encrypted)"
[img5_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img5_enc.bmp "Test Image 5 (Encrypted)"
[img6_e]: https://github.com/ShadowfeindX/bitmap-encryptor/raw/master/tests/img6_enc.bmp "Test Image 6 (Encrypted)"

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
