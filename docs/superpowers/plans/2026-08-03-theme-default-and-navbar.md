# Theme Default and Navbar Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Open the site in light theme for first-time visitors, remember later choices, and make the navigation strip follow the active theme.

**Architecture:** Keep the existing single-file static architecture. Change the initial HTML theme and theme restoration logic in `index.html`, then replace hard-coded navigation colors with theme variables defined for light and dark modes.

**Tech Stack:** Static HTML, CSS custom properties, vanilla JavaScript, browser `localStorage`, GitHub/Vercel deployment.

## Global Constraints

- If no preference is stored, initialize in light theme.
- Persist and restore later visitor choices with the existing `rm_theme` key.
- Navigation colors and scroll opacity must follow the active theme.
- Preserve content, menu structure, hero, forms, desktop behavior, and mobile behavior.
- Avoid an initial dark-theme flash for first-time visitors.

---

### Task 1: Theme-aware navigation and light first visit

**Files:**
- Modify: `index.html:2,66-122,1103-1115`
- Test: `index.html` using static assertions and browser runtime checks

**Interfaces:**
- Consumes: `localStorage.getItem('rm_theme')`, `data-theme`, `.scrolled`
- Produces: `data-theme="light"` initial markup, light/dark navigation CSS variables, persisted theme selection

- [x] **Step 1: Run baseline assertions that expose the old behavior**

```powershell
$source = Get-Content -Raw index.html
if ($source -notmatch '<html lang="pt-PT" data-theme="dark">') { throw 'Expected old dark default' }
if ($source -notmatch "localStorage\.getItem\('rm_theme'\) !== 'light'") { throw 'Expected old dark fallback' }
if ($source -notmatch '#navbar\{[^}]*background:rgba\(13,13,13,.76\)') { throw 'Expected hard-coded dark navbar' }
```

Expected: PASS against the current implementation, documenting all three behaviors that must change.

- [x] **Step 2: Add theme-specific navigation variables**

In `[data-theme="dark"]`, define dark navigation background, scrolled background, border, primary text, muted text, control background, and control border values. Define corresponding light values in `[data-theme="light"]` using translucent `#F5F4F0`-based backgrounds and dark text.

- [x] **Step 3: Replace hard-coded navigation colors**

Update `#navbar`, `#navbar.scrolled`, `.nav-logo`, `.nav-links a`, `.lang-btn`, `.lang-btn.active`, `.lang-btn:hover`, `.lang-sep`, `.theme-toggle`, and `.hamburger span` to consume the new CSS variables while retaining the accent color for active and hover states.

- [x] **Step 4: Make light the safe initial and first-visit theme**

Change the root markup to `data-theme="light"`. Replace the fallback with an explicit stored-value check:

```javascript
const savedTheme = localStorage.getItem('rm_theme');
let isDark = savedTheme === 'dark';
```

Keep `applyTheme()` responsible for applying and persisting choices so existing visitors restore either valid stored choice and first-time visitors persist light.

- [x] **Step 5: Run static regression assertions**

```powershell
$source = Get-Content -Raw index.html
if ($source -notmatch '<html lang="pt-PT" data-theme="light">') { throw 'Light initial theme missing' }
if ($source -notmatch "const savedTheme = localStorage\.getItem\('rm_theme'\);") { throw 'Stored theme lookup missing' }
if ($source -notmatch "let isDark = savedTheme === 'dark';") { throw 'Light fallback missing' }
if ($source -match '#navbar\{[^}]*background:rgba\(13,13,13,.76\)') { throw 'Navbar still hard-coded dark' }
if ($source -notmatch 'background:var\(--nav-bg\)') { throw 'Theme-aware navbar missing' }
```

Expected: PASS.

- [x] **Step 6: Verify browser behavior locally**

Open the page with `rm_theme` absent and confirm light mode. Toggle dark, reload, and confirm dark mode. Toggle light, reload, and confirm light mode. In both themes, scroll beyond 60 pixels and confirm the strip gains opacity while text, controls, and hamburger retain sufficient contrast.

- [x] **Step 7: Commit the implementation**

```powershell
git add -- index.html docs/superpowers/plans/2026-08-03-theme-default-and-navbar.md
git commit -m "fix: default new visitors to light theme"
```

### Task 2: Publish and verify production

**Files:**
- No source changes expected

**Interfaces:**
- Consumes: committed `main` branch source
- Produces: updated production site at `https://renovamais.pt/`

- [ ] **Step 1: Push the validated commit**

```powershell
git push origin main
```

Expected: GitHub accepts the new `main` commit and triggers the existing production deployment.

- [ ] **Step 2: Wait for production deployment success**

Use the GitHub commit status for the pushed SHA and wait until Vercel reports success. Treat an error state as a deployment blocker and inspect its supplied details before retrying.

- [ ] **Step 3: Verify the official site**

Open `https://renovamais.pt/` with a cache-busting query. Confirm the published source has the light initial theme, test stored dark and light choices across reloads, and inspect the navigation strip before and after scroll in both themes.

