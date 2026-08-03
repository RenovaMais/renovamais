# Global Theme and Legal Footer Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Give every public page one remembered light/dark theme and a consistent, professional legal footer containing the Renova Mais identity, IMPIC alvará verification, and access to the official electronic complaints platform.

**Architecture:** Add one shared theme script and one shared legal-footer stylesheet, then connect all five static HTML pages to those shared resources. Keep footer markup in each page because the project has no templating/build layer, while using shared classes to ensure visual consistency and reduce future maintenance.

**Tech Stack:** Static HTML, CSS custom properties, vanilla JavaScript, browser `localStorage`, PowerShell regression tests, GitHub/Vercel deployment.

## Global Constraints

- All pages start with `data-theme="light"` and use the `rm_theme` storage key.
- A missing preference opens in light theme; a stored valid choice is restored on every page.
- Every footer shows Renova Mais, Lda.; NIF/NIPC 519467892; alvará 122856-PAR; full address; telephone; and email.
- The IMPIC element describes alvará consultation only and must not imply approval, certification, partnership, or endorsement.
- The complaints link uses neutral wording and points to the official Digital Complaints Book platform without claiming operator registration.
- Existing offers, forms, service copy, portfolio content, and imagery remain unchanged.

---

### Task 1: Shared theme behavior

**Files:**
- Create: `js/site-theme.js`
- Modify: `index.html`
- Modify: `remodelacao-casas-de-banho.html`
- Modify: `privacy.html`
- Modify: `obrigado.html`
- Modify: `404.html`
- Test: `tests/global-theme-and-legal-footer.ps1`

**Interfaces:**
- Consumes: `[data-theme-toggle]`, optional `[data-theme-icon-sun]`, optional `[data-theme-icon-moon]`, and `localStorage['rm_theme']`
- Produces: a `light` or `dark` `data-theme` attribute shared by all pages and an accessible toggle state

- [x] **Step 1: Write failing global-theme assertions**

Create `tests/global-theme-and-legal-footer.ps1` with assertions that every HTML file starts with `data-theme="light"`, includes `/js/site-theme.js`, contains a `[data-theme-toggle]` control, and does not use `rm_landing_theme`.

- [x] **Step 2: Run the test and verify the expected failure**

Run: `& ./tests/global-theme-and-legal-footer.ps1`

Expected: FAIL because the utility pages do not yet declare a theme or shared script.

- [x] **Step 3: Implement the shared theme script**

Create `js/site-theme.js` that reads `rm_theme`, accepts only `dark` as the dark choice, applies light otherwise, binds every `[data-theme-toggle]` button, updates `aria-pressed` and `aria-label`, and shows optional sun/moon icons according to the active state.

- [x] **Step 4: Connect all pages to the shared theme**

Set the root `data-theme` to light, add a `defer` script reference, convert existing toggles to the shared data attributes, add compact toggles to `privacy.html`, `obrigado.html`, and `404.html`, and remove duplicated inline theme persistence from the home and bathroom pages.

- [x] **Step 5: Run theme assertions**

Run: `& ./tests/global-theme-and-legal-footer.ps1`

Expected: The theme checks pass; legal footer checks added in Task 2 still fail.

### Task 2: Shared legal footer presentation

**Files:**
- Create: `css/legal-footer.css`
- Modify: `index.html`
- Modify: `remodelacao-casas-de-banho.html`
- Modify: `privacy.html`
- Modify: `obrigado.html`
- Modify: `404.html`
- Test: `tests/global-theme-and-legal-footer.ps1`

**Interfaces:**
- Consumes: page theme variables with safe fallbacks and `.legal-footer` markup
- Produces: responsive full and compact legal footer layouts

- [x] **Step 1: Extend the failing test with legal requirements**

Assert that every page includes `/css/legal-footer.css`, `.legal-footer`, `122856-PAR`, `519467892`, the full Massamá address, `tel:+351912911081`, `mailto:geral@renovamais.pt`, an official `impic.pt` link, an official `livroreclamacoes.pt` link, and `/privacy`.

- [x] **Step 2: Run the test and verify legal assertions fail**

Run: `& ./tests/global-theme-and-legal-footer.ps1`

Expected: FAIL on the missing common footer requirements.

- [x] **Step 3: Create responsive shared footer styles**

Create `css/legal-footer.css` with full and compact layouts, readable theme-aware colors, a restrained typographic IMPIC consultation badge, a visually prominent red complaints-book link, accessible focus styles, and stacked mobile behavior.

- [x] **Step 4: Add complete legal footers to the main pages**

Update `index.html` and `remodelacao-casas-de-banho.html` with the common identity, address, contacts, alvará text, IMPIC consultation link, complaints platform link, privacy link, and the shared stylesheet.

- [x] **Step 5: Add compact legal footers to utility pages**

Update `privacy.html`, `obrigado.html`, and `404.html` with the same required legal facts and links using the compact modifier. Adjust their viewport layout so the footer remains reachable on small screens.

- [x] **Step 6: Run full static assertions**

Run: `& ./tests/global-theme-and-legal-footer.ps1`

Expected: PASS with five pages checked and zero failures.

- [x] **Step 7: Commit the implementation**

```powershell
git add -- index.html remodelacao-casas-de-banho.html privacy.html obrigado.html 404.html css/legal-footer.css js/site-theme.js tests/global-theme-and-legal-footer.ps1 docs/superpowers/plans/2026-08-03-global-theme-and-legal-footer.md
git commit -m "feat: unify theme and legal identity across site"
```

### Task 3: Browser verification and publication

**Files:**
- No source changes expected

**Interfaces:**
- Consumes: committed `main` source
- Produces: verified production pages at `https://renovamais.pt/`

- [x] **Step 1: Verify locally in Chrome**

Open all five local routes. Confirm first-visit light mode, toggle persistence between routes, footer contrast in both themes, valid destinations, and reachable compact footers at desktop and mobile widths.

- [ ] **Step 2: Integrate into `main` and rerun tests**

Merge the isolated branch into `main` and run `& ./tests/global-theme-and-legal-footer.ps1` again before publishing.

- [ ] **Step 3: Push and wait for hosting success**

Push `main`, poll the Vercel commit status until success or failure, and stop on a reported deployment error.

- [ ] **Step 4: Verify the official website**

Check the published HTML for the shared assets and legal details, then use Chrome to verify theme persistence between the home, bathroom, privacy, thank-you, and 404 pages. Leave the official home page open in light theme.

