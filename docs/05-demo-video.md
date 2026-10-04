# Demo video

**File:** `demo.mp4` in this folder, or the hosted link (see below)
**Length:** aim for 3 to 5 minutes
**Recorded on:** the device you used

## What it shows

0:00 — Introduction, project overview, and the problem ReadRoulette solves
0:25 — Main app demo: Home screen, genre and format filters, random recommendation, result screen, Save, and Saved & History
1:15 — Code walkthrough: project structure, state management, reusable widgets, AniList API service, local storage, and theme
2:00 — AI usage: how Claude was used during development, including examples and mistakes
4:00 — Challenges encountered while connecting the app's filters, API, result screen, and local storage
4:20 — What I learned from the project
4:30 — What's next for ReadRoulette
4:40 — Closing

Cover, in this order: the main user journey end to end, anything that only works
on a real device (camera, GPS, sensors), and the thing you are proudest of.

## Getting it into the repo

GitHub **blocks any file over 100 MB** and warns over 50 MB, so compress before
you commit:

```bash
ffmpeg -i raw.mp4 -vcodec libx264 -crf 28 -preset slow \
       -vf scale=-2:720 -acodec aac -b:a 96k demo.mp4
```

Raise `-crf` (28 to 32) or drop to `-2:480` if it is still too large. If it still
does not fit, attach it to a **GitHub Release** or upload it unlisted and link it
here. Never commit the raw capture: git keeps it forever even after you delete
it.

## Before you record

- Real data off the screen: no classmates' names, numbers, faces or messages.
- Notifications off.
- Sensible sample data, not "asdf".
- One unbroken take per feature. Say what you are doing while you do it.
