# Review: PAPER-LAWRENCE-SAWIN-25 (Lawrence–Sawin, The Shafarevich conjecture for hypersurfaces in abelian varieties)

Job `REV-PAPER-LAWRENCE-SAWIN-25` (issue #1068), by Claude Code, session `cc-d67081`, 23 September
2026. The extraction was written by session `cc-7b31c4` (issue #1067). **Verdict: accept**, after two
corrections made in place. Both routes that propose new work are accepted, and so are the three
source routes.

## What was read

- **arXiv [2004.09046](https://arxiv.org/abs/2004.09046)v5**, 121 pages, fetched into scratch. Its
  SHA-256 is `5e5f829e2841637de38852bde0d5f0a0b80183e6f9d23b60250cc2be1ee21d97` — the hash the
  extraction records.
- The main theorems and their arithmetic; the statements behind the two proposed roadmaps; every
  planned item's layer description; and a sweep of the paper's own numbering against the items.
- The extraction states that the published Annals text (202 (2025), no. 3) is paywalled and was not
  consulted, and that v5 was posted *after* publication. That is the right way round: v5 is the
  authors' latest word, and it is what the locators point at.

## Corrections made to the extraction

**1. A library citation that does not exist at the pinned commit.** The single library item cited
`mathlib:Nat.succ_mul_choose_eq`. That name has **no occurrence anywhere in Mathlib at 082e2d3** — it
is the pre-rename form. The lemma is `Nat.add_one_mul_choose_eq`,
`(n + 1) * choose n k = choose (n + 1) (k + 1) * (k + 1)`, at
`Mathlib/Data/Nat/Choose/Basic.lean:131`. Corrected, with the reason recorded in the item's note. The
item's other three declarations — `Nat.choose`, `Nat.factorial`, `Nat.choose_symm` — are all present.

This one is worth separating from the index defects reported in this session's audit reviews
(`class abbrev`, dropped namespaces, `instance (priority := …)`): those make *correct* citations look
missing, whereas this citation is genuinely wrong, and a source grep rather than an index lookup is
what settles the difference.

**2. Item 72's note understated the libraries.** It said only that the Tau Ceti Hodge structures
roadmap "is existing work and is never re-planned here". A great deal of it is already **built**:
`TauCeti.Hodge.HodgeStructure` and `HodgeStructureOn` (`Geometry/Hodge/Structure.lean`),
`TauCeti.Hodge.MixedHodgeStructure` with its weight filtration (215 declarations),
`TauCeti.Hodge.Polarization` with the Hodge form (61) and `TauCeti.Hodge.PeriodDomain.Point`. What is
**not** built is exactly the part this paper varies: there is no variation of Hodge structure and no
Griffiths transversality in either library — `VariationOfHodge` and `Griffiths` have no occurrence,
and the single source mention is an aside in `PeriodDomain.lean`'s docstring. The note now records
both halves; the status stays `planned`, since the roadmap owns the whole item.

Item 73 already drew this distinction accurately for abelian varieties ("Tau Ceti has abelian
varieties over a field with isogenies and endomorphisms … but no Néron–Severi group, no ample classes
and no intersection numbers on them"), which is the standard the amended note now meets.

## Items

- **Nothing on the way to the main theorems is missing.** I extracted all **196** paper-internal
  numbered statements and compared them with the numbers the 82 items cite, expanding the items'
  ranges ("Lemmas B.19 through B.31", "Lemmas B.2–B.9" and so on — which is how the extraction
  covers Appendix B's twelve lemmas in one item). Every statement is covered. The eleven apparent
  gaps are all citations of **other** papers — `[47, Theorem 1.4]` (Larsen), `[37, Corollary 7.4]`
  (Katz), `[48, Lemma 2.12]` (Goursat), `[19, Theorem A.1]`, `[13, Cor…]`, `[24, Cor…]`,
  `[23, Exposé III, Proposition 1.5.2]` — or Proposition B.1, which the paper itself labels
  "(Proposition 3.15)" and which item 20 covers.
- **The main theorems are stated correctly.** Item 3 gives the recursion `a(1)=1, a(2)=5,
  a(i+2)=4a(i+1)+1−a(i)` and `d(i) = C(a(i)+a(i+1), a(i))` with `d(1)=6`, `d(2)=53130`,
  `d(3)=216182590635135019896`. I computed these exactly: `C(6,1)=6`, `C(25,5)=53130`,
  `C(96,20)=216182590635135019896`, and `C(361,76) = 2.505…×10^79`, matching the paper's own
  "d(4) = 2.5 … × 10^79".

## Statuses

- **Library (1 item).** Corrected as above; after the fix all four declarations resolve at the pinned
  commits.
- **Planned (12 items).** Every cited layer plans its item, and I read each description: `EDC.5` and
  `EDC.1` for perverse sheaves and Verdier duality; `MC.6` with Tau Ceti `ReductiveGroups` layer 1 for
  Tannakian categories; `MordellLawrenceVenkatesh` `LV.1`, `LV.3` and `LV.4` for Faltings's finiteness
  lemma and the period maps; Tau Ceti `HodgeStructures` L0/L1/L3; `AbelianSchemesAndArithmeticModuli`
  `A2`; `FaltingsFinitenessAndIsogenyTheorems` `R28.5` with `HeightsRationalPointsAndObstructions`
  `RP.4` for Shafarevich; `SchemeAndStackFoundations` `SF.5` for Riemann–Roch; `LD.6` for
  o-minimality; Tau Ceti `ReductiveGroups` layers 6–8 with `ReductiveGroupsPartII` `RG2.0`;
  `WeilConjectures` `WC.3` with `DeligneWeightsAndPurity` `DWP.7`;
  `AlgebraicModuliForArithmeticGeometry` `R09.7` for resolution.
- **Missing (69 items).** Routed exactly once each. I searched the pinned index myself: perverse
  sheaves, Tannakian categories, period maps, Néron–Severi groups, Eulerian numbers, crystalline
  comparison, Shafarevich finiteness and Bakker–Tsimerman all return zero. The three large hit counts
  — `convolution` (607), `hodgeStructure` (499), `abelianVariety` (229) — are Hopf-algebra
  convolution and the Hodge and abelian-variety material the *planned* items already point at, not
  the missing ones.

## Routes

All five accepted; `PAPER-LAWRENCE-SAWIN-25.review.json` gives the reason on each. The two that
propose work are well argued, and I checked their exclusions rather than taking them on trust:
`EDC.5` really does stop short of convolution, `MC.6` really is a different Tannakian category, and
`GeometricSatakeAndFusion`'s convolution really is on affine Grassmannians.

**One fact for the orchestrator, not a mark against the route.** The Part II's parent,
`MordellLawrenceVenkatesh`, is a **draft** roadmap (`research/blueprint/roadmaps/`, status `draft`),
not an atlas roadmap. I checked the whole paper corpus: of the 76 Part II routes whose parent is not
an atlas roadmap, **75 name Tau Ceti roadmaps and this is the only one naming a draft**. The routing
is still right — the paper is the Lawrence–Venkatesh method generalized, every layer strengthens a
layer of LV.0–LV.11, and any other parent would duplicate them — but the design job for this Part II
has to be sequenced after its parent's.

## Mistakes in the paper (`sourceIssues`)

The extraction records **none**. I checked the main theorems, the recursion and the four constants
`d(1)`–`d(4)` by exact computation, and the statements behind both proposed roadmaps, and found
nothing to record. I did not read all 121 pages hunting for mistakes, and I record none — an empty
`sourceIssues` is a claim about what the extraction found, not a claim that the paper is
error-free, and this review does not turn it into one.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-LAWRENCE-SAWIN-25.result.json`
  reports ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 69 missing items, 69 routed, each exactly once.
- Every planned and route stage id resolves, in `data/atlas.json` or in the draft roadmaps.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
