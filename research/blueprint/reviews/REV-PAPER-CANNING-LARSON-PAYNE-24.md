# REV-PAPER-CANNING-LARSON-PAYNE-24 — review of the Canning–Larson–Payne extraction

**Verdict: accept, with one status corrected and one route added.** All four routes accepted.

Reviewer: Claude Code, session `cc-fb70e5`, 28 September 2026. Target:
`research/blueprint/papers/PAPER-CANNING-LARSON-PAYNE-24.result.json` (93 items: 88 missing, 4
planned, 1 library after this review; 3 routes before, 4 after) and its report
`PAPER-CANNING-LARSON-PAYNE-24.md`. The extraction is session `cc-7b31c4`'s.

**Independence.** `cc-fb70e5` appears nowhere in the extraction or its report, and I have written no
earlier review of either. Disclosure: this paper id is cross-referenced in six paper extractions I
wrote — KISIN-MADAPUSIPERA-SHIN-22, WITASZEK-22, HE-18, DUKE-IMAMOGLU-TOTH-16, CHARLES-16 and
WOOD-19 — but those cite the extraction's existence in their own route tables and are not work on
this paper; the author names Canning and Larson appear nowhere in my files. The job was released
after the maintainer closed an earlier submission because its author had also done the extraction,
so I checked this before claiming rather than after.

## Provenance

I read the LaTeX source of arXiv:2307.08830v3, the version the extraction names, and the sha256 of
its source archive is `7828f493…6bd391` — **equal to the hash the extraction records**. The two of
us read the same bytes, which is the strongest provenance available here and removes any question of
version drift. Main file `STEForumPiRevision.tex`, 1506 lines.

## What I checked

**The numbering, replayed rather than assumed.** The extraction says all theorem environments share
one counter numbered by section. They do (`\newtheorem{thm}{Theorem}[section]` with eleven
environments declared `[thm]`), so the numbering can be replayed exactly from the source: 62
numbered statements. Two consequences worth recording, because both are claims the extraction makes
and neither is self-evident. Theorem 1.1 is `thm:131415`, so section 8, headed "Proof of Theorem
\ref{thm:131415}", is indeed "Proof of Theorem 1.1" as `readSections` says. And the list of
statements `readSections` attributes to section 1 — Theorems 1.1, 1.3, 1.5, 1.6, 1.7, 1.9, 1.10,
Definition 1.2, Corollary 1.4, Conjecture 1.8 — matches the replay exactly.

**Locators: 83 of the 84 that carry a statement number match both environment and number.** The one
flag is my own regex's fault, not the extraction's: item 49's locator reads "Lemma 5.1 (Lemma 10.5
of Canning–Larson)", and 10.5 is correctly attributed to a different paper. Fifteen further items
have section-level or prose locators, which I checked individually for the load-bearing ones.

**Statements.** I checked the load-bearing items against the source. A sample of what held:

- Theorem 1.1 verbatim, including that `\lstw` is defined at line 156 as `\mathsf{L}\mathsf{S}_{12}`,
  so the brief's rendering `L·S_12` is right, and including the `g ≥ 2` restriction on the degree
  fifteen case.
- Theorem 1.3's generator set, character for character:
  `{H^{k'}(M̄_{g',n'}) : k' ≤ k, g' < (3/2)k' + 1, n' ≤ k', 4g' − 4 + n' ≥ k'}`.
- Item 44 against Lemma 4.3 and item 46 against Proposition 4.5. These two are easy to conflate —
  both concern the CKgP — and the extraction keeps them apart correctly: Lemma 4.3 is the general
  surjectivity of the cycle class map for an open substack of a smooth proper Deligne–Mumford stack,
  Proposition 4.5 the concrete `g ≤ 7, n ≤ c(g)` consequence from Table 1. The downstream items that
  say "by Proposition 4.5" echo the paper's own citations at those points, which I checked at line
  1215.
- Item 92 against Remark 2.5: "the Hodge groups `H^{k,0}(M̄_{1,k})` correspond to the space of cusp
  forms for `SL_2(Z)` of weight `k+1`" — including the `k+1`, which is easy to drop.

**The one `library` status.** Item 92 cites `mathlib:ModularForm`, `mathlib:CuspForm` and
`mathlib:SlashInvariantForm`. I opened all three at the pinned commit `082e2d37`: `ModularForm` and
`CuspForm` are at `Mathlib/NumberTheory/ModularForms/Basic.lean:74` and `:82`, `SlashInvariantForm`
at `SlashInvariantForms.lean:34`, and `CuspForm Γ k` is a `SlashInvariantForm` that is holomorphic
and zero at the cusps for a subgroup of `GL (Fin 2) ℝ`. That does provide the item. The note's
caveat is also right, and its consequence is handled: the *identification* of these spaces with the
Hodge groups is not in the libraries, and Remark 2.5's closure statement is carried by item 32 as a
missing item, so nothing is lost by the item being graded `library`.

**The `planned` statuses.** I read each cited layer's description. Three are well matched, one
exactly so: item 1 wants stable `n`-pointed curves with `ω_C(Σp_i)` ample, and StableReduction Layer
3 says "Define stability by relative ampleness of `ω(Σsᵢ)`". Item 8's Galois representations are
R19.1's business, down to the Eichler–Shimura relation it names. Item 93's projective and Grassmann
bundles are R09.1's, which constructs them with their universal properties and base-change laws; the
paper's use over Hurwitz stacks rather than schemes follows formally, so I left the status alone and
note it here.

**Route bookkeeping was exact** before my change and is exact after: 87 missing and 87 routed
before, 88 and 88 after, with nothing routed twice, nothing missing left unrouted, and nothing
non-missing routed.

**The new roadmap, justified by re-running the justification.** Route 1 asks for a new roadmap on
the ground that the atlas has no moduli of curves at all. That is an absence-by-search claim, so I
ran it myself over all 1968 stages: nothing for 'moduli of curves', 'moduli space of curves',
'tautological ring', 'tautological class', 'Chow ring', 'Borel–Moore', 'Brill–Noether', 'symplectic
local system', 'mapping class group', 'psi class', 'kappa class' or 'moduli of stable'. I then
chased every near hit, since a clean search is not evidence:

- `AlgebraicModuliForArithmeticGeometry` — the name is promising and R09.4 does mention
  Deligne–Mumford, but the roadmap owns general algebraic spaces, stacks, coarse spaces and
  representability "for generalised elliptic curves and polarised abelian schemes". Not M̄_{g,n}. It
  is a genuine supplier, and the brief already names R09.1, R09.4 and R09.5 as imports.
- `tauceti:…/StableReduction#layer-9-marked-stabilization-and-stable-pointed-reduction` — the only
  hit for 'Mbar'. Stable pointed curves, not their moduli stack. The brief already names Layers 1, 3
  and 9.
- The 32 hits for 'gonality' are almost all the substring of **orthogonality**, and the hits for
  'Teichm' and 'Hurwitz' are unrelated senses.

So the claim holds and a new roadmap rather than a Part II is right. Every stage the brief names as
an import exists, and the Tau Ceti layer titles match the content claimed against them.

## The correction

**Item 14, Poincaré duality on a smooth proper Deligne–Mumford stack: `planned` → `missing`, and
routed.** The item asserts the duality pairing, and the hard Lefschetz injections used for
top-heaviness, for M̄_{g,n} as a smooth proper Deligne–Mumford stack. It was planned at
`SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.9` and HodgeStructures L1. Reading
those three:

- SF.2 is titled "Sites and **scheme** cohomology" and constructs sheaf cohomology, localisation,
  proper and smooth base change and compact support — for schemes.
- DWP.9 states hard Lefschetz "For X **projective** smooth of pure dimension d over an algebraically
  closed field", which is neither the stack case nor even the merely proper case.
- HodgeStructures L1 supplies polarisation and Hodge–Riemann semisimplicity, which is genuinely what
  it says and is unaffected by this correction.

Searching all 1968 stages returns nothing for 'cohomology of a stack', 'stack cohomology', 'duality
for stacks', 'smooth proper Deligne' or 'Chow group of a stack'; the twelve hits for 'Poincaré
duality' are all scheme or adic-space layers. The extraction's own note conceded the point — "The
Deligne–Mumford stack case is used throughout the paper without comment" — but the status did not
follow the note.

What makes this a correction rather than a difference of taste is that **the extraction is
inconsistent with itself here.** It meets the same scheme-versus-stack gap twice more and handles it
the other way both times: item 12 routes the Chow groups of algebraic stacks to SF.5 as a source
route, and item 13 routes the cycle class map for a Deligne–Mumford stack to MC.2 as a source route,
each as a *missing* item in the generality the moduli application needs. Item 14 is the same shape
and should be treated the same way.

So I set the status to `missing` and added route 4, a source route to `SchemeAndStackFoundations:SF.2`,
recording in its reason that the hard Lefschetz half is DWP.9's obligation and must be stated there
for Deligne–Mumford stacks rather than assumed. Both changes are recorded in the item's note and in
the extraction's report.

## The mistake in the paper

**`sourceIssues` E1 — confirmed.** Theorem 1.5(3) states "`H_{k}(\Mb_{g,n})`, for even `$k \leq 14$`"
(line 236) and the proof opens "We now show that `$H_k(\Mb_{g,n})$` is tautological for even
`$k \geq 14$`" (line 1207). The extraction's supporting reasoning also checks out verbatim: two
sentences later the proof says "When `$g\geq 3$`, in all of these cases with `$k\leq 14$` we know
that `$\M_{g,n}$` has the CKgP" (line 1215), and Conjecture 1.8 does concern "even `$k \leq 20$`"
(line 262), so with `≥` the sentence would assert the statement in degrees where it is open. A
misprint whose intended meaning is clear, correctly graded `affects: nothing`. The verdict is
recorded in the entry.

I add no mistake of my own. That is a statement about what I checked, not a claim that none exists:
I read Sections 1, 2, 4, 6, 7 and 8 and the numbered statements they contain, and I did not
re-derive the genus seven geometry of Section 5, where a slip would be hardest to see.

## Assessment

This is careful work, and the checks that could have caught it out did not. Its quotations are
accurate where I could compare them, its locators resolve, its route bookkeeping is exact, and it
distinguishes cases that invite conflation — Lemma 4.3 against Proposition 4.5, the cusp form spaces
against their identification with Hodge groups, a new roadmap against a Part II. The brief for the
new roadmap is the strongest part: it states five groups of final theorems exactly and names
seventeen supplier stages, every one of which exists and says what it is cited for.

The single defect is a status that the extraction's own note already doubted and that its own
treatment of two sibling items contradicts. That is the kind of thing an independent reading is for,
and it is why the verdict is accept rather than revise: the mathematics and the routing are sound,
and the fix was clear enough to apply in place.
