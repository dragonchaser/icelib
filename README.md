# ICElib

This is a simple ruby library to query the data of the european ICE trains (run by OEBB and DB)
which is publically available when you are logged into the onboard WiFi (WiFionICE).
This code features a small cli output tool called icewatch.rb.

# License

ICElib is released under [GPLv3](LICENSE.md).

# Usage

To use either lib or cli tool you have to be connected and authenticated with the trains WiFi network called `wifionice`.

## [icecli.rb](icecli.rb)

Just run it using

```
ruby icecli.rb
```

It should output something like this:

```
Trip Date : 2017-11-24                  Train : ICE 229
From      : Frankfurt(Main)Hbf          To : Wien Hbf
Speed     : 31 km/h
Next stop : (+1) 21:28:00 (21:27:00) Wels Hbf [track: 3]
Last stop : 20:34:00 Passau Hbf [track: 5]
```

## [icelib.rb](icelib.rb)

example see [icecli.rb](icecli.rb)

## Mock data

There is example mock data in the folder `mock`. It can be invoked into the [icecli.rb](icecli.rb) or your application by setting the environment variable
```
MOCK=true
```
