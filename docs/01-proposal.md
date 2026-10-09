# ReadRoulette

Final version, 2026-10-09.

## The problem, in one sentence

I have a backlog of dozens of manga and manhwa I want to read, but every time I open a reading app I end up scrolling through genre lists for ten minutes without picking anything, and I close the app without reading at all.

## Who it is for

A manga and manhwa reader, like myself, who reads several titles a month and usually knows the genre they are in the mood for, but cannot settle on one title without spending ten or more minutes scrolling through ranking sites or social media. Today these readers keep scrolling until something catches their eye, ask for recommendations in Discord servers or subreddits, or give up and reread something they have already finished.

## Core features

| # | Feature | What happens |
|---|---|---|
| 1 | Genre and format filter | The user picks one or more genres and Manga, Manhwa, or Both. The selection stays in place when they come back from a result. |
| 2 | Spin the roulette | The app asks AniList for titles matching the filters and picks one at random. |
| 3 | Result card | Shows the cover, title, genres, chapter count, and synopsis of the picked title. |
| 4 | Spin again | Fetches a new random title with the same filters. |
| 5 | Save | Keeps the current title in the Saved list on the device. |
| 6 | Recently viewed | Every title the user spins is logged automatically, newest first, up to 50. |

The app has three screens: Home and Filter, Result, and Saved and History. Tapping a stored title reopens it on the Result layout from saved data, with no new request.

## Out of scope, and why

- Reading the manga itself. ReadRoulette is a discovery tool. It shows titles, covers, and synopses and does not host or display chapters, which is a different app and not the problem I set out to solve.
- User accounts and syncing between devices. One person's saved list on one device is enough for this problem, and a server would add a week of setup for no feature the app needs.
- A chapter length filter and a preview of the titles in the pool. Both appeared when I painted the mockup in and were cut: neither was in the plan, and a preview of the pool would spoil the surprise that makes a roulette worth using.
- Reading progress, ratings, and per title menus. They imply tracking the app does not do, so they were removed from the mockup.
- An AI generated reading time estimate. It would only multiply the chapter count by a reading pace, which is plain arithmetic and does not justify a second API.
- A share button and an option to exclude titles already read. Both were stretch goals and are left as ideas for a later version.

## Data the app remembers, and where it is saved

| Thing | Fields | Where it is saved |
|---|---|---|
| Selected filters | genres, format (Manga, Manhwa, or Both) | In memory only, kept while the app is running |
| Current result | id, title, cover URL, synopsis, genres, chapter count, country of origin | In memory only, replaced on each spin |
| Saved titles | the same fields plus the date saved | `shared_preferences`, key `savedTitles`, as a list of JSON strings |
| Recently viewed | the same fields as a saved title | `shared_preferences`, key `recentlyViewed`, as a list of JSON strings, newest first, capped at 50 |

Storage choice: `shared_preferences`. Two people installing the app should not see each other's data, and a realistic week of use is well under 100 records, so a database or a server such as Firebase or Supabase would be setup cost with no payoff. The tradeoff I accepted is that the data lives only on the device: clearing site data or uninstalling deletes it, and it cannot sync to another device.

## Risks

1. Random picks that still respect the filters. AniList can filter or return something random, but not both in one request, so the app asks for the page count, picks a random page, and then picks a random title from it. This risk is smaller than it was at the start, because the two step fetch works. What remains is that very narrow filter combinations can return few or no titles, in which case the app shows an error message instead of a result.
2. Saving and loading titles correctly. Stored titles must read back the same way they were written, and a mismatch between the save code and the load code fails silently. The model reads every field with a default value, so an old or incomplete record cannot crash the app.
3. Depending on AniList. The app has no backend of its own, so if AniList is slow or unavailable, Spin fails. The app shows a message instead of crashing, and the saved list still opens from the device.

## Changes since the last version

- 2026-07-29: First proposal. Four core features, three screens, AniList as the only data source, and no persistence decision yet.
- 2026-09-18: Revised after building the Module 4 and 5 apps. Added named Flutter widgets and hour estimates for each feature (about 9 hours in total), chose `shared_preferences` for the reasons above, added a second risk, and added a share button as an optional extra.
- 2026-09-20: Painted the mockup in. Cut a chapter length slider, a preview of candidate titles, per title menus, reading progress text, and star ratings, because none were in the plan.
- 2026-09-27: Started the build on the course template, replacing its counter screen with ReadRoulette's screens and keeping its `device_preview` wrapper.
- 2026-10-09: Final version. Saved and Recently Viewed moved from a stretch goal into the finished app, so all three screens are built, and this document now records what was cut and why.
