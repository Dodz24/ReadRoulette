AI usage
This project was built with AI assistance. This file is the record of how I used it.
1. How I used AI
2026-09-27 - Project dependencies
Tool: Chatgpt, ClaudeAI
What I asked for: Help identifying the packages needed for the ReadRoulette project and what each package would be used for.
What it gave back: Suggestions for packages such as http for API requests and shared_preferences for local storage.
What I kept, what I changed, and why: I kept the packages that were actually needed for the project. I checked the suggestions against the professor's starter project instead of replacing the original project setup.
Commit: https://github.com/Dodz24/ReadRoulette/commit/b55faf45759dcf32c524454a9d8934c579ae8be5
2026-09-27 - Home filter state
Tool: Chatgpt, ClaudeAI
What I asked for: Help implementing the genre and format selection logic for the Home and Filter screen.
What it gave back: Suggestions for using setState(), a Set<String> for selected genres, and an index for the selected format.
What I kept, what I changed, and why: I kept the general state approach but adjusted the implementation to fit my screen and the way the filters are passed to the API.
Commit: https://github.com/Dodz24/ReadRoulette/commit/e0825f96f5c7494583ce12e217e97d16cb51068d
2026-09-27 - Result card
Tool: Chatgpt, ClaudeAI
What I asked for: Help organizing the result information into a reusable Flutter widget.
What it gave back: A structure for a reusable result card that receives manga information and displays the cover, title, genres, chapters, and synopsis.
What I kept, what I changed, and why: I kept the reusable widget approach and adjusted the styling and displayed information to match the ReadRoulette design.
Commit: https://github.com/Dodz24/ReadRoulette/commit/b91ff72f481205fb59f3a3300f77d4ba98a21fd9
2026-09-27 - Result screen actions
Tool: AI assistant
What I asked for: Help with the Result screen logic, including displaying the current result, Spin Again, and Save.
What it gave back: Suggestions for keeping the current MangaTitle in state and updating it when another result is returned.
What I kept, what I changed, and why: I kept the general state approach but adjusted it to work with my MangaTitle model, API service, and navigation structure.
Commit: https://github.com/Dodz24/ReadRoulette/commit/31ca886a98a8011b46c90742b0cd9b85d026fa40
2026-09-27 - Local title storage
Tool: AI assistant
What I asked for: Help implementing local storage for saved and recently viewed titles.
What it gave back: A TitleStore structure using shared_preferences, JSON encoding, and JSON decoding.
What I kept, what I changed, and why: I kept the storage approach and adapted it to the MangaTitle model. I also added checks to avoid saving duplicate titles and limited recently viewed titles to 50 items.
Commit: https://github.com/Dodz24/ReadRoulette/commit/6e81fcf68041dca66e58e7eb8b156edba8329dab
2026-10-02 - Debugging and project testing
Tool: Chatgpt, ClaudeAI
What I asked for: Help understanding the errors and warnings shown by flutter analyze after the project was completed.
What it gave back: An explanation of the widget test error and the informational analyzer messages.
What I kept, what I changed, and why: I updated the widget test so that it tests ReadRouletteApp instead of the original template application. I also checked the analyzer output and separated actual errors from informational warnings.

2. Where the AI got it wrong
Case 1 - Home filter implementation
What it gave me: AI suggestions for handling the Home Filter selections and passing the selected filters to the API.
What was wrong with it: Some of the suggestions were too general and did not completely match the way my HomeFilterScreen and AniListService were structured.
What I did instead: I adjusted the implementation so the selected genres and format were stored correctly and passed to the API using my actual project structure.
Commit: https://github.com/Dodz24/ReadRoulette/commit/e0825f96f5c7494583ce12e217e97d16cb51068d
Case 2 - Result screen implementation
What it gave me: AI suggestions for handling the current result and the Spin Again and Save actions.
What was wrong with it: Some of the suggestions did not directly match the way my MangaTitle model and screen navigation were structured.
What I did instead: I changed the implementation to work with my actual MangaTitle object, AniListService, and Result screen state.
Commit: https://github.com/Dodz24/ReadRoulette/commit/31ca886a98a8011b46c90742b0cd9b85d026fa40
Case 3 - Project setup assumptions
What it gave me: AI sometimes assumed a more standard Flutter project setup when suggesting changes.
What was wrong with it: ReadRoulette was based on the professor's starter template, so some suggestions did not match the actual project configuration.
What I did instead: I checked the actual starter files and kept the professor's project structure and dependencies where appropriate, changing only what was needed for ReadRoulette.
Commit: https://github.com/Dodz24/ReadRoulette/commit/b55faf45759dcf32c524454a9d8934c579ae8be5
Note: The default test/widget_test.dart was part of the professor's original starter template. It was not an AI-generated mistake. I updated it because it was still testing the template's original MyApp counter application instead of ReadRouletteApp.

3. Who wrote what
Written by me
File: lib/screens/home_filter_screen.dart
Commit: https://github.com/Dodz24/ReadRoulette/commit/e0825f96f5c7494583ce12e217e97d16cb51068d
What it does and why it is built this way: This screen handles the user's genre and format selections and starts the random title search. I understand how _selectedGenres, _formatIndex, setState(), and the selected filters work together.
File: lib/widgets/genre_chip.dart
Commit: https://github.com/Dodz24/ReadRoulette/commit/22f44108c2828521c036b20671f756e355df95f6
What it does and why it is built this way: This is a reusable widget for the genre selections. It receives a label, selected state, and tap callback so the Home Filter screen can reuse the same UI for every genre.
File: test/widget_test.dart
Commit: https://github.com/Dodz24/ReadRoulette/commit/edaf7936de71ccaa491c5d08227059699f53403f
What it does and why it is built this way: I updated the starter widget test so that it builds ReadRouletteApp instead of the original template application.
The AI-written part I understand best
File: lib/storage/title_store.dart
Commit: https://github.com/Dodz24/ReadRoulette/commit/6e81fcf68041dca66e58e7eb8b156edba8329dab
What it does and why we kept it: This handles the local Saved and Recently Viewed data. It uses shared_preferences and JSON so the MangaTitle objects can be stored and loaded again.
File: lib/services/anilist_service.dart
Commit: https://github.com/Dodz24/ReadRoulette/commit/0764c16961a1b6f0ebaaee5619de45af05abf6da
What it does and why we kept it: This handles communication with the AniList GraphQL API. It sends the selected filters, receives title data, and converts the response into MangaTitle objects that the rest of the application can use.

