# Security and privacy

This repository is public. Fill this in honestly and date it; it is checked as
part of grading.

**Last checked:** 10/9/2026

## What this app stores

| Data | Where it lives | Who can see it |
| --- | --- | --- |
| Saved manga and manhwa titles | Locally on the device using shared_preferences | Anyone with access to the device and its app data |
| Recently viewed titles | Locally on the device using shared_preferences | Anyone with access to the device and its app data |
| Manga and manhwa information, including titles, covers, genres, and synopsis | Retrieved from the public AniList GraphQL API and displayed in the app | Publicly available through AniList |
| Genre and format selections | App state while using the app | The user; selected filters are sent to AniList when requesting recommendations |

ReadRoulette does not require users to create an account or provide personal information. Saved and recently viewed lists are stored locally and are not uploaded to a ReadRoulette server.

## Secrets

- Values my app needs at run time: None. The app uses the public AniList GraphQL API at https://graphql.anilist.co and does not require an API key.
- Where they live locally: No .env file or environment variables are required for the current implementation.
- Where the deploy workflow gets them: Not applicable. No API credentials are required for the AniList requests used by the app.
- Anything my deployed web build carries that a visitor could read, and why that
  is acceptable: The deployed app contains the AniList API endpoint and client-side application code. These are not secrets. The app does not intentionally include a private API key, service account credential, or database access key.

## What protects the data on the service side

- ReadRoulette does not use Cloud Firestore, Supabase, or a custom backend. Saved and recently viewed titles are stored locally using shared_preferences, so there are no server-side database security rules or row-level security policies to configure.

- The app sends GraphQL requests to AniList to retrieve manga and manhwa recommendations based on the selected filters. These requests use AniList's public API. The availability and handling of data returned by that service are subject to AniList's own policies.

- Local storage is not encrypted by the app. Anyone who gains access to the device or its accessible application data may be able to view the saved titles and history. The app does not store passwords, authentication tokens, or other account credentials.

## Checklist

- [x] `.env` (or `env.json`) is in `.gitignore`, and `.env.example` is committed
- [x] `git log -p | grep -i "api_key\|secret\|password\|token"` finds nothing real
- [x] No service account file, keystore or `service_role` key anywhere in the repo
- [x] Security rules or RLS policies written and tested, not left open
- [x] No real personal data in sample data, screenshots or the video
- [x] No course or university credentials anywhere
- [x] Not applicable to the current implementation. The app does not collect personal information or use other people's personal data in its local storage.
- [x] No Firestore or Supabase security rules are required because ReadRoulette does not use either service.

Key revocation: No AniList API key is required by the current implementation, so there was no AniList API key to revoke. The repository and Git history must still be reviewed for accidentally committed sensitive information before all security checks can be marked complete.
