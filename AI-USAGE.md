# AI usage

This project was built with AI assistance. This file is the record of it. It is
graded as the finals badge, and it is worth 100 points.

Start it in week 1 and keep it up as you go. The commit history of this file is
part of the evidence: a file written all at once the night before the deadline
looks exactly like what it is.

## 1. How I used AI

At least six entries. One per real use. Every entry needs a commit link.

### 2026-09-27 - Project dependencies

- **Tool**: ChatGPT. ClaudeAI
- **What I asked for**: Help identifying the Flutter dependencies needed for ReadRoulette, especially for connecting to the AniList API and saving data locally.
- **What it gave back:**It explained that http could be used for API requests and shared_preferences could be used for local storage.
- **What I kept, what I changed, and why:**I kept the suggested packages and added them to pubspec.yaml. I used them because ReadRoulette needs API communication and local storage.
- **Commit:** https://github.com/Dodz24/ReadRoulette/commit/b55faf45759dcf32c524454a9d8934c579ae8be5

### 2026-09-27 - Home filter state

- **Tool**: ChatGPT. ClaudeAI
- **What I asked for**: An explanation of how the existing Home Filter screen handles selected genres and the selected manga format..
- **What it gave back:**It explained how _selectedGenres, _formatIndex, and setState() work together to update the interface.
- **What I kept, what I changed, and why:**I kept the existing implementation instead of replacing it. I mainly used the explanation to understand how the current code works.
- **Commit:** https://github.com/Dodz24/ReadRoulette/commit/e0825f96f5c7494583ce12e217e97d16cb51068d

## 2. Where the AI got it wrong

Three cases. Be specific. If you write that the AI was never wrong, this section
scores zero.

### Case 1 - Oversimplified Home Filter

- **What it gave me:**AI suggested a simplified version of the Home Filter screen with fewer parts than the required ReadRoulette implementation.
- **What was wrong with it:**The simplified version removed functionality needed for genre selection, format selection, loading state, and the roulette action.
- **What I did instead:**I kept the required functionality and made sure the Home Filter screen included the genre controls, format selection, loading state, and roulette button.
- **Commit:** https://github.com/YOUR-USERNAME/YOUR-REPO/commit/SHA](https://github.com/Dodz24/ReadRoulette/commit/e0825f96f5c7494583ce12e217e97d16cb51068d

## 3. Who wrote what

At least a fifth of this project is code you wrote yourself. Name it, and explain
it in your own words.

> Group projects: give each member their own heading below, and use your GitHub
> handle as the heading. You are graded on your own section.

### Written by me

- **File:**
- **Commit:**
- **What it does and why it is built this way:**

### The AI-written part I understand best

- **File:**
- **Commit:**
- **What it does and why we kept it:**
