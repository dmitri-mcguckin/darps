# DARPS

Discord Audio Redirect Pulseaudio Stream

A workaround to streaming desktop audio alongside video in Discord video streaming.

This is a workaround, albeit very hacky, but a workaround, none-the-less.

This allows any linux-based user also using PulseAudio to ~~sacrifice their microphone to the gods~~ bind audio sinks (desktop audio) to audio sources (a microhpone), thereby allowing users to stream their desktop audio alongside a video stream.

# TODO

- [ ] Turn into a nicer python-cli program with ArgParse
- [ ] Enable remapping of both microhpone audio and sink audio into the uplink device
- [ ] Add cli options for selecting application-specific sinks instead of the default sink (usually desktop audio)

***

Honorable Mentions:

* [Humaid AlQassimi's blog post](https://huma.id/blog/pulseaudio-loopback/)
* [Victor Gaydov's documentation on PA sinks and sources](https://gavv.github.io/articles/pulseaudio-under-the-hood/#key-abstractions)
