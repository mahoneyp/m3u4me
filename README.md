[![](design/readme_banner.jpg)](design/readme_banner.jpg)

# m3u4me: Self-hosted M3U playlist manager

> Forked from [andrei-savin/m3u4me](https://github.com/andrei-savin/m3u4me) by andrei-savin, with Docker support added.

m3u4me is your IPTV playlists' new home. Your streams don't leave your local network, you are in charge, nobody can see or control your playlists.

> [!WARNING]
> m3u4me does NOT provide ANY streams! It is purely a M3U playlist manager. You must bring your own content.

> [!NOTE]
> This app aims to be a self-hosted alternative to <https://m3u4u.com/> - as you can see, m3u4me's name is obviously referencing them. The projects are not related in any way. No harm intended!

## AI Disclosure

> [!NOTE]
> This app's code was AI-generated, with minor interventions from me. I am a graphic designer with very limited coding knowledge; I do not support pointless usage of AI and I am fully aware of the harm it can cause.
>
> m3u4me started out as something that was intended only for personal use - I am sharing it only because I believe it is an useful app which might help many other IPTV enthusiasts. **It will always be entirely free**.
>
> I fully encourage any developer who comes across this app and wants to turn it into something human-made, without AI involvement.
>
> AI was not used for **anything** else besides writing the actual code of the app.

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://www.gnu.org/licenses/gpl-3.0)
[![Docker Ready](https://img.shields.io/badge/Docker-Ready-2496ED?logo=docker&logoColor=white)](https://github.com/mahoneyp/m3u4me)

## Features

- **Multiple playlist support:** Add as many playlists as you like! You can start from scratch or from an existing playlist.
- **Logo editing:** Add/edit/remove your channels' logos.
- **EPG tvg-id editing:** Add/edit/remove your EPG IDs.
- **Stream checker** (Not recommended): Basic stream checking functionality, not recommended due to some IPTV providers not reacting nicely to any sort of bulk checking. Use at your own risk!
- **Bulk actions:** Move, delete or check multiple channels at once.
- **Late import from M3U:** Forgot a source? Import new channels from a M3U file inside of an existing playlist, without overwriting your existing channels & categories.
- **Auto-saving:** You don't need to remember to save your changes or push your playlist. Everything happens instantly, automatically.
- **Undo delete:** Deleted a channel by mistake? Hit the "Undo" button which appears on the bottom of your screen and bring it back without a hassle.
- **Simple playlist link structure:** No more typing huge links on your TV. Playlists get assigned a numerical ID, which means that your download links look like this: `http://IP:port/1` for your first playlist, `http://IP:port/2` for the second one, and so on.
- **Global search:** Search for any channel, stream link, or EPG ID across all of your playlists at once.
- **Keyboard shortcuts**: Delete your channels with `DEL`, select everything with `Cmd+A`, make your work easier overall. Full list of commands is available inside the app.

### Cosmetic UI features

- **Light mode, Dark mode & AMOLED Dark mode**
- **Custom accent colours**
- **Channel logo background colour presets**: Choose between light gray, white, black or transparency. *(Only for previewing. Does not affect the actual logos in the playlist.)*
- **Hide stream URLs**: Useful for sharing screenshots.

### What is not yet supported

- **Xtream Codes API:** You can not import channels using a Xtream Codes source.
- **Managing EPG sources:** You need to gather your EPG IDs separately and then add them in m3u4me.

I plan to implement these features in future versions.

## Installation

> [!NOTE]
> Runs happily on very modest hardware — as little as 512MB of RAM.

**1. Clone the repo:**

```
git clone https://github.com/mahoneyp/m3u4me.git
cd m3u4me
```

**2. Build and start the container:**

```
docker compose up -d --build
```

m3u4me runs on port 8080 by default — change the `ports:` line in `docker-compose.yml` if you'd rather use a different one.

All done! You can now use m3u4me at <http://localhost:8080> [replace `localhost` with the IP of your server]. Playlists, channels, EPG cache and auth data are kept in the `data/` folder next to `docker-compose.yml`, so they survive rebuilds and updates.

### Updating

To pull in the latest image after making changes:

```
docker compose up -d --build
```

Your data in `./data` is untouched by rebuilds.

## Bug reports & feature requests

If you encounter any AI slop, or other sort of error, feel free to create a GitHub issue. I will reply ASAP.
You can also open issues for any feature requests. However, I can not guarantee that they will be accepted.
