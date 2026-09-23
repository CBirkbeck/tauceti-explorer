# REV-PAPER-DISEGNI-LIU-24

Independent review of the extraction of Daniel Disegni and Yifeng Liu, *A p-adic arithmetic inner
product formula*, Inventiones Mathematicae **236** (2024), no. 1, 219–371
(doi 10.1007/s00222-024-01243-7, open access; arXiv 2204.09239).

Issue [#1229](https://github.com/CBirkbeck/tauceti-explorer/issues/1229). Reviewer: Claude Code,
session cc-d67081, 23 September 2026.

**Verdict: accept.** All seven routes accepted. No item, status, route, locator or quotation changed.

## The source, with a limitation

The paper is open access and the extraction records the published PDF's SHA-256. As with every
Springer-published paper I have reviewed today, **that hash could not be re-verified here**: the PDF
endpoint returns a JavaScript challenge page to every request. I read the published text through a
rendering proxy and rebuilt the journal page map from the running heads — **146 marks running from
p. 220 to p. 371**, consistent with the stated 219–371 — and checked every finding at its recorded
page. Crossref records no correction.

## Mistakes

All **7** findings were checked at their locators. **All 7 are confirmed.** Every one is a misprint
affecting nothing, and the record says so: this is a long, careful paper, and what the extraction
found is a handful of notational slips rather than defects.

Most are settled by their own neighbourhood:

| id | the slip | what settles it |
|----|----------|-----------------|
| **E1** | `V^{(v)}_F` (p. 248), twice | `v` is the index of the product being decomposed; the footnote on p. 222 defines `V^{(w)}_F` |
| **E2** | Definition 3.21 names the property "Panchishkin" | Lemma 3.22, the next statement on the same page, says "Panchishkin **unramified**", and Lemma 4.14 (p. 281) cites *this* definition by the fuller name |
| **E3** | "(Notation 4.33)" (p. 304) | the object is introduced in Notation 4.32; 4.33 is the proposition on local heights away from p |
| **E4** | "the choice of `x`"; `ν^q(y^q)`; `E^q_L` | the lemma fixes `a`; `b^q` is introduced one line above and used correctly two words later; Appendix A has no complex `E` |
| **E5** | vanishing clause written with `L(d)` | the source of `κ_{c′}` carries `L(d−1)`, and the next sentence applies `κ_{c′}(1)`, not `κ_{c′}`, to the `L(d)` of (A.2) |
| **E6** | `H^{2d−1}_c(Ū_t, L(d))` (p. 347) | Proposition B.11 (p. 344) concludes over `Ū`; the subscript also collides with the `t := t₁t₂` of the same sentence |
| **E7** | seven typographical slips | e.g. "the corresponding **edges maps**", followed four words later by "the corresponding **edge maps**" |

### One substantive item inside E7

Worth separating from the typography: **Lemma A.4 is stated for `C ∈ D⁺_G(S, Z_{p•})`** while
Definition A.3 and Lemma A.5 are over `W_•`, and the lemma is applied on p. 363 to an object of
`D⁺_{G_K}(X_ét, W_•)` — so its hypothesis as printed is narrower than its use. The extraction is
right that the proof works verbatim over `W_•`.

Grouping that with six typographical slips in one entry is defensible, but it makes the register
entry harder to read than it needs to be. I confirmed it as recorded rather than splitting it, since
splitting would renumber the findings.

## Items, statuses, routes

**62 items: no library items, 14 planned targets, 53 missing.** Every missing item is routed exactly
once and all dependencies resolve. That there is no library item is plausible here: p-adic height
pairings on unitary Shimura varieties, log rigid cohomology and the doubling method have no
counterpart at the pins. All ten stage ids cited by the routes, and all fourteen planned targets,
exist in the atlas index.

Seven routes, all accepted. The two **Part IIs** divide the paper correctly: the arithmetic inner
product formula and the Selmer theta lifts extend *Gross–Zagier formulas and arithmetic heights*,
while the bi-extensions of cycles and the decomposition of the p-adic height pairing extend *Selmer
groups, continuous integral cohomology, and Iwasawa cohomology*. Both titles are exact prefix
extensions and both ids are free. Splitting them is the right call — the height machinery is
reusable and the inner product formula is not — and it also puts four of the seven findings (E4, E5
and the Lemma A.4 hypothesis inside E7) with the layer that will formalise them.

The five source routes place the imported apparatus with its owners: `L4`/`L5` for the doubling
method and the p-adic L-function (§3, and with it E1–E3), `MP.2`/`MP.3` for the Weil representation
and local theta modules, `RD.4` for log rigid cohomology with proper support, `CR.4`/`CR.5`/`CR.6`
for the rigid de Rham–Witt apparatus of Appendix B.2, and `R06.1` for the period rings reviewed on
p. 348.

## Checks

- `python3 scripts/check_paper.py …` — **ok**
- `python3 research/blueprint/intake.py check-files …` — **4 files, 0 problems**
- **No Lean was written or compiled.**
