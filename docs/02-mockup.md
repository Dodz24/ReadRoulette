# Mockup and wireframes

## Mockup

### 1. Home / Filter Screen

<img src="assets/" alt="Login" width="390" />

**What the user does here:** Selects one or more genres and a format (Manga, Manhwa, or Both) to narrow the pool of titles before generating a recommendation.

**Where each tappable thing goes:**

**Genre Chips (Romance, Action, Fantasy, etc.):** Toggle selected/unselected state in place, no navigation.
**Format Toggle (Manga / Manhwa / Both):** Switches the selected format option in place, no navigation.
**Spin the Roulette Button:** Navigates to the Result Screen.
**Bottom Nav "Roulette" (active):** Stays on the Home / Filter Screen.
**Bottom Nav "History":** Navigates to the Saved & History Screen.
---

### 2. Saved & History Screen

<img src="assets/" alt="Login" width="390" />

**What the user does here:** Browses titles they have manually saved or that were automatically logged from past spins.

**Where each tappable thing goes:**

- **"Saved" Tab:** Displays the manually bookmarked titles list (active by default).
- **"Recently Viewed" Tab:** Switches to the automatic history log.
- **Tapping Any Card:** Navigates to the Result Screen, displaying that title's already-stored data (no new spin or API fetch).
- **Bottom Nav "Roulette":** Navigates to the Home / Filter Screen.
- **Bottom Nav "History"** (active): Stays on the Saved & History Screen.

---

### 3. Result Screen

<img src="assets/" alt="Login" width="390" />

**What the user does here:** Views one randomly generated title matching their selected filters and decides whether to save it, get another, or return.

**Where each tappable thing goes:**

- **Back Arrow (Top Left):** Navigates back to the Home / Filter Screen, with previously selected genres and format still active.
- **Share Icon (Top Right):** Opens the device's native share sheet.
- **Spin Again Button:** Stays on the Result Screen, replaces the current title with a new random recommendation using the same active filters.
- **Save Button:** Stays on the Result Screen, adds the current title to the Saved list.
- **Bottom Nav "Roulette" (active):** Stays on the Result Screen.
- **Bottom Nav "History":** Navigates to the Saved & History Screen.

---

---

## Wireframes

### 1. Home / Filter Screen

<img src="assets/" alt="Login" width="390" />

| Screen | Layout Notes | Inputs | Actions → Destination | Data Shown |
|--------|--------------|--------|-----------------------|------------|
| Home/Filter | Displays the app header, a "Discover your next read" placeholder banner, a genre selection grid (Romance, Action, Fantasy, Comedy, Drama, Horror, Slice of Life), a Format toggle (Manga / Manhwa / Both), and a large "Spin the Roulette" button at the bottom. Previously selected genres and format remain active if the user navigates back from the Result screen | Genre selection (multi-select), Format toggle | Spin the Roulette → Result Screen | Selected genres, selected format |

---

### 2. Result Screen

<img src="assets/" alt="Login" width="390" />

| Screen | Layout Notes | Inputs | Actions → Destination | Data Shown |
|--------|--------------|--------|-----------------------|------------|
| Result | Displays the app header with a back arrow icon in the top-left (tapping it returns the user to the Home/Filter screen without saving or generating a new title), a large cover image placeholder, title placeholder, genre tag chips, a chapter count line, and a synopsis placeholder text block | None (view-only) | Save → stays on Result, adds to Saved tab. Spin Again → Result Screen (new title). Back button / Bottom nav → Home/Filter Screen (filters remain selected) | Title, cover image, genres, chapter count, synopsis |

---

### 3. Saved & History Screen

<img src="assets/" alt="Login" width="390" />

| Screen | Layout Notes | Inputs | Actions → Destination | Data Shown |
|--------|--------------|--------|-----------------------|------------|
| Saved & History | Displays two tabs, "Saved" and "Recently Viewed," each showing a scrollable list of horizontal cards with a thumbnail, title, year, and genre tags. | Tap tab (Saved / Recently Viewed) | Tap a card → Result Screen layout, displaying that title's stored data (no new spin or API fetch triggered)| List of saved or recently viewed titles |

---

## Screens

### 1. Home / Filter Screen

**What is on it:**
- ReadRoulette app bar
- "Discover your next read" banner card
- Select Genres tag grid (Romance, Action, Fantasy, Comedy, Drama, Horror, Slice of Life)
- Format selector (Manga / Manhwa / Both)
- "Spin the Roulette" action button
- Persistent Bottom Navigation Bar (Roulette / History) 

**What the user does:**

The user configures their reading preferences by selecting one or more genre tags and choosing a format type. Once ready, tapping "Spin the Roulette" generates a random recommendation.

**Where each action goes:**

| Action | Result |
| --- | --- |
| Genre chips | Toggles selection state in place |
| Format toggle | Selects Manga, Manhwa, or Both in place |
| Spin the Roulette | Navigates to Result Screen with active filters |
| Bottom Nav "History" | Navigates to Saved & History Screen |

### 2. Result Screen

**What is on it:**
- App bar with back arrow and optional share action
- Large cover image artwork
- Title heading
- Genre chips
- Chapter count line
- Synopsis text block
- "Spin Again" and "Save" primary/secondary buttons
- Persistent Bottom Navigation Bar

**What the user does:**

The user inspects the recommended title, reads the synopsis, and chooses to save it to their library, spin again with the same filters, or go back.

**Where each action goes:**

| Action | Result |
| --- | --- |
| Back arrow | Returns to Home / Filter Screen (filters remain active) |
| Spin Again | Generates and displays a new title on the same screen |
| Save | Adds current title to Saved tab without leaving screen |
| Bottom Nav "History" | Navigates to Saved & History Screen |

### 3. Saved & History Screen

**What is on it:**
- ReadRoulette header
- Segmented tab bar ("Saved" / "Recently Viewed")
- Scrollable list of ListItemCard widgets containing thumbnail, title, year, and genre tags
- Persistent Bottom Navigation Bar 

**What the user does:**

The user switches between manually bookmarked titles ("Saved") and automatically logged recommendations ("Recently Viewed") and taps any item to inspect its details.

**Where each action goes:**

| Action | Result |
| --- | --- |
| Tab bar | Toggles between Saved and Recently Viewed list views |
| ListItemCard | Opens Result Screen showing the selected title's stored details |
| Bottom Nav "Roulette" | Opens Result Screen showing the selected title's stored details |

### Complete navigation summary

| From | Tappable element | Leads to / Result |
| --- | --- | --- |
| Home / Filter Screen | Spin the Roulette | Result Screen (with active filter parameters) |
| Home / Filter Screen | Bottom Nav "History" | Saved & History Screen |
| Result Screen | Back arrow | Home / Filter Screen (filters preserved) |
| Result Screen | Spin Again | Result Screen (reloads with new random title) |
| Result Screen | Save | Stays on Result Screen; adds entry to Saved list |
| Result Screen | Bottom Nav "History" | Saved & History Screen |
| Saved & History Screen | ListItemCard | Result Screen (displays cached title data) |
| Saved & History Screen | Bottom Nav "Roulette" | Home / Filter Screen |

