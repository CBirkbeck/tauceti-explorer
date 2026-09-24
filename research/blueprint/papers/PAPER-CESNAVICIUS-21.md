# PAPER-CESNAVICIUS-21 — Macaulayfication of Noetherian schemes

Kęstutis Česnavičius, *Macaulayfication of Noetherian schemes*, Duke Mathematical Journal **170** (2021),
no. 7, 1419–1455, doi [10.1215/00127094-2020-0063](https://doi.org/10.1215/00127094-2020-0063).

Issue #2184 · Claude Code · session `cc-7b31c4` · 2026-09-23 · **complete**.

61 items (2 library, 2 planned, 57 missing), three routes taking all 57 missing items exactly once, three
recorded source issues, fifteen prerequisites. No formalisation is claimed; no Lean file is part of this
job.

## The source read

The paper was read in full in **arXiv:1810.04493v2** (3 September 2020), whose abstract page describes it
as "24 pages; final version, to appear in Duke Mathematical Journal" and which is the latest version.
Three files were used:

* the e-print archive of v2, sha256 `8704c071cf1029ba386764f13841d3871ea79d49c2b2af920086da4789dbd088`,
  whose two files are `macaulayfication.tex` (2045 lines) and `bibliography.ltb`;
* the compiled arXiv PDF of v2, sha256 `a07d62e6ef1e4c2126c172426391e97031d28006b92ccb6c5f3afd9c2ddb07b9`;
* the author's copy of the published version,
  `https://webusers.imj-prg.fr/~kestutis.cesnavicius/macaulayfication.pdf`, sha256
  `55ded201a17ae161400c1989d67ad7a09356c23f87b2e88eef2e763632939ac6`, read 2026-09-23, whose entry on the
  author's publications page carries the Duke reference.

**Version check.** The two PDFs were compared word by word after extracting their text from the PDF
content streams — not from a lossy text layer. Apart from line breaking and hyphenation they agree: no
statement, hypothesis or reference differs, and both carry the two misprints recorded below. The
`numberingbase` counter of the class is an alias for `subsection`, so theorems, propositions, lemmas,
corollaries, definitions, examples, remarks and the unnamed numbered paragraphs all share one counter per
section, the items of the `\brems` and `\begs` lists step it through `\addtocounter`, and equations are
numbered within it. Re-deriving the numbering from the LaTeX gives **53 numbered items**, of which 42 are
named statements; every one of those 42 was found at its predicted number in the PDF, and the four
initially not found are exactly the four remarks that are list items inside `\brems` blocks and are
therefore printed as bare numbers.

**Mechanical audits**, all clean: no duplicate `\lab`, no undefined `\ref`/`\Cref`, and no cross-reference
whose introducing word disagrees with the environment carrying the target label — the six apparent
mismatches are `\remi` list items correctly called Remarks.

## What the paper does

A **Macaulayfication** of a scheme X is a proper birational X̃ → X with X̃ Cohen–Macaulay that is an
isomorphism over the Cohen–Macaulay locus CM(X). It is the Cohen–Macaulay analogue of Grothendieck's
resolution conjecture, proposed by Faltings, and it reduces resolution of singularities to the
Cohen–Macaulay case.

* **Theorem 1.6 / Theorem 5.3.** Every CM-quasi-excellent Noetherian scheme has a Macaulayfication, with
  the map projective, and finitely many prescribed coherent modules can be carried along. The
  factorisation is precise: a finite birational (S₂)-ification X' → X followed by **one** blowing up
  along a centre disjoint from the Cohen–Macaulay locus.
* **CM-quasi-excellence** — Cohen–Macaulay formal fibres plus a nonempty Cohen–Macaulay open in every
  integral closed subscheme — is weaker than quasi-excellence, so the theorem is new even for
  ℚ-schemes; **Proposition 5.5** shows it is exactly the right hypothesis.
* **Corollaries 1.8, 1.10, 1.11**: proper flat Cohen–Macaulay integral models over a Dedekind base,
  Cohen–Macaulay principalisation, Cohen–Macaulay compactifications.

The proof has three parts. **§2** builds a noncanonical (S₂)-ification: an (S₁)-ification always exists
(Theorem 2.9), and for an (S₂)-quasi-excellent scheme a finite birational (S₂) modification exists
(Theorem 2.13, Corollary 2.14), constructed by Noetherian induction, formal patching and Kollár's
coherence criterion for `j_*`. That reduces everything to CM-excellent, locally equidimensional schemes,
via Ratliff's theorem and the fact that an (S₂) scheme with (S₂) formal fibres is formally
equidimensional (Lemma 2.5). **§3** reviews Kawasaki's theory: secant and CM-secant sequences, the
annihilator identity against a normalized dualizing complex (Lemma 3.6), d-sequences and the
Goto–Yamagishi equalities, and the theorem that for a CM-secant sequence the strict transform `Bl_I(M)`
along `I = ∏_i (r_1,…,r_i)` is Cohen–Macaulay (Theorem 3.14) — the paper's **only** source of
Cohen–Macaulayness, and a striking one, since even for Cohen–Macaulay R the blowing up at a maximal ideal
need not be Cohen–Macaulay. **§§4–5** run the induction: over a complete local base, with the special
fibre already a divisor and its complement Cohen–Macaulay, one builds a decreasing chain of
biequidimensional subschemes using the Gabber–Liu–Lorenzini avoidance lemma so that the local generators
form a CM-secant sequence at every point, and applies Theorem 3.14 to the product ideal (Proposition 4.4);
Noetherian induction and the composition of blowing ups globalise it (Proposition 5.2).

The key trick of §4, isolated in §1.13, is to regard a large power of the ideal of the special fibre as an
extra — and *first* — hypersurface in the Kawasaki-style collection. That is legitimate because that ideal
is locally principal and Cohen–Macaulayness is local, and it is what keeps the centre disjoint from the
part of the scheme that is already Cohen–Macaulay.

## Routing

1. **Part II of `SchemeAndStackFoundations`: `MacaulayficationOfNoetherianSchemes`** — 40 items, area
   `algebraicgeometry`. SF.4 plans deformations, models and birational geometry and says that resolution
   is a theorem only in a named proved setting, without naming one; Macaulayfication is such a setting,
   proved unconditionally in all characteristics. Nothing in the atlas defines quasi-excellence or
   catenarity, nothing plans the openness of the (S_n) or Cohen–Macaulay loci, and no layer plans an
   (S₂)-ification or a Macaulayfication. The route carries §§1, 2, 4 and 5: the excellence variants and
   their examples and stability, catenarity and equidimensionality with Ratliff's theorem, the descent of
   (S_n) from the completion, the openness of the loci, the (S₁)- and (S₂)-ifications, biequidimensionality
   and dualizing complexes on schemes, the avoidance lemma, and the local and global Macaulayfications
   with the main theorem, its corollaries and its converse.
2. **Part II of `DeformationAndDerivedPatchingAlgebra`: `LocalCohomologyAndDualizingComplexes`** — 16
   items, area `commutative`. R03.3 plans regular sequences, depth, Cohen–Macaulay modules and
   equidimensionality, and P9 depth and support for perfect complexes, but neither plans local cohomology
   beyond Mathlib's definition nor dualizing complexes over a Noetherian ring; the only dualizing
   complexes in the catalogue are the perverse-sheaf ones of `EtaleDualityAndPerverseSheaves`, a different
   object. This route carries §3 in full: dualizing complexes and the annihilator identity, secant,
   CM-secant and d-sequences with Schenzel's and Goto–Yamagishi's results, blowing up modules and strict
   transforms, and Kawasaki's Proposition 3.11 and Theorem 3.14 with the two local-cohomology claims of
   its proof. This is reusable local algebra with consumers well beyond this paper, which is why it is not
   folded into route 1.
3. **Source of `SchemeAndStackFoundations` SF.0** — 1 item: the Nagata compactification. SF.0 owns
   schemes and morphisms with separatedness and properness stated as properties of named morphisms, and
   the theorem is used three times here. The atlas has it only in two restricted forms that cannot be
   reused: `AlgebraicModuliForArithmeticGeometry` R09.7d is a characteristic-zero smooth compactification
   interface that explicitly says no general Nagata compactification is assumed, and
   `AdicCoefficientsAndComparisons` L4 follows Nagata compactification for finite-type schemes over a
   complete DVR without owning it.

## Library and planned items

Two items are **library**:

* **regular sequences** — `mathlib:RingTheory.Sequence.IsRegular`, `IsWeaklyRegular` and their
  localisation and flat base-change stability;
* **local cohomology** — `mathlib:localCohomology` as the colimit of Ext over the ideal-powers diagram,
  with `localCohomology.ofSelfLERadical` and `isoOfSameRadical` giving the independence of the ideal up to
  radical. What Mathlib does **not** have, and what §3 actually uses, is the Čech-complex computation, the
  composition spectral sequence `H^j_𝔞(H^{j'}_𝔟) ⇒ H^{j+j'}_{𝔞+𝔟}` (Stacks 0BJC) and the identification
  `H^1_{(r)}(M) = colim_m M/r^mM` (Stacks 0A6R); the item's note and route 2's brief say so.

Two items are **planned**: the Serre conditions and Cohen–Macaulayness of modules
(`DeformationAndDerivedPatchingAlgebra` R03.3 for depth, Cohen–Macaulay modules, associated primes and
support; `SchemeAndStackFoundations` SF.0 for coherent modules), and blowing up with its universal
property, affine charts and flat base change (`AlgebraicModuliForArithmeticGeometry` R09.7a, which plans
exactly this by the Rees algebra, in a characteristic-zero resolution context but for the same
construction; SF.0 for relative Proj).

**Nothing else in this paper is in the pinned libraries.** There is no depth, no Cohen–Macaulay predicate,
no catenarity or excellence, no dualizing complex and no blowup in Mathlib or Tau Ceti at the pinned
commits, and the atlas has no layer for any of them.

## Source issues

Three findings, all new.

* **E1** (misprint, affects nothing) — Corollary 1.11 ends "such that X̄ \\ X is a (possibly nonreduced)
  divisor **in X**"; it must be "in **X̄**", since X̄ \\ X is disjoint from X. This is not an artefact of
  text extraction: in the content stream of the published PDF each overlined X is a letter preceded by an
  explicitly drawn rule, and the rule is present before the first X of "X̄ \\ X" and **absent** before the
  final X. The LaTeX of the final arXiv version likewise has `\ov{X}` twice and a bare `$X$` here.
* **E2** (misprint, affects nothing) — §1.13 prints "an inductive construction of an
  '(S₂)-**ificaiton**'"; the object is the (S₂)-ification of §2, called that everywhere else.
* **E3** (gap, affects nothing) — the final clause of Lemma 2.11, that 𝓜' may be chosen to be (S₂) itself
  when the punctured spectra at the relevant points have no isolated points, is never returned to in the
  proof; its only trace is a parenthesis in the middle of the dim X ≥ 2 case. The clause is true and the
  argument is two lines — after the reductions one may assume X local with U the punctured spectrum, the
  direct sum arises only from the summand U₀ of isolated points of U, the hypothesis says U₀ = ∅ once
  dim X ≥ 2, and for dim X = 1 the extension produced is (S₁) and hence (S₂) because its support has
  dimension ≤ 1 — but a formalisation has to supply them.

One further curiosity was noticed and **not** recorded, because it is not mathematics: the preamble
contains `\newcommand{\csub[1]}{…}` with the argument count inside the braces instead of after them. The
macro is never used.

## Notes for the reviewer and for later blueprint work

* **Quasi-excellence and CM-quasi-excellence are different conditions.** The theorem is new even for
  ℚ-schemes precisely because the second is weaker, and Example 1.3 turns on the fact that a
  discrete valuation ring can fail to be excellent but never fails to be CM-excellent. A blueprint that
  silently assumes excellence loses the point of the paper.
* **A Macaulayfication that does not preserve CM(X) is a strictly weaker statement** and was already
  known in several cases (§1.12). Every corollary needs the isomorphy over CM(X).
* Secant, CM-secant, d-sequence and regular sequence are **four different conditions**, and the proofs of
  §3 turn on exactly which one is available at each step. The definition of CM-secant is not symmetric in
  the `r_i`, and the reversal `r_s,…,r_1` in Proposition 3.11(i) is not a typographical convenience.
* Lemma 2.11 produces, in the (S₂) case, "a finite direct sum of (S₂) modules", **not** an (S₂) module: a
  direct sum of (S₂) modules whose supports have different dimensions at a point need not be (S₂). The
  statement is deliberate; do not simplify it. (For the *algebra* case the direct sum is a product of
  algebras, so the resulting scheme is a disjoint union of (S₂) schemes and is (S₂).)
* Proposition 4.4's proof is where the whole construction lives; it should be planned as a construction
  with its chain `X ⊃ X_1 ⊃ ⋯ ⊃ X_d`, not as a black box. Item 55 records it separately from the
  statement for that reason, and likewise item 58 for the Noetherian induction of Proposition 5.2.
* Both Part IIs depend on each other's exports in one direction only: route 1 imports Kawasaki's theorem
  and the strict-transform formalism from route 2. If the design jobs are scheduled, route 2 should come
  first.
* EGA IV is used by number in about thirty places and the Stacks Project in about twenty; the prerequisite
  list records them. They are not folklore and a decomposition cannot treat them as such.

## Checks

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json` reports `ok`,
and `python3 research/blueprint/intake.py check-files` reports no problems on the two deliverables. The
structural checks run while generating the result — every missing item routed exactly once, every planned
item naming layers that exist in the atlas, every library item citing declarations at the pinned commits,
the source route naming a layer owned by the roadmap it names, the Part II titles matching their parents
and their areas being galaxy ids — do not certify the mathematics. No Lean file is authorised or compiled
for this job.

## Review (REV-PAPER-CESNAVICIUS-21, 24 September 2026)

The review accepted the extraction after corrections made in place. It was done by Claude Code (session cc-38267a), and the full record is `research/blueprint/reviews/REV-PAPER-CESNAVICIUS-21.md`. Three checkers read the paper against the arXiv TeX and page renders of both PDFs: §§1–2, §§3–5 with the bibliography, and every status and route. They opened every cited declaration at the pinned commits and read every cited layer. The coordinator settled their disagreements at the TeX and checked every new mistake there.

Several statements above are superseded:

- **Blowing up is not R09.7a's.** R09.7a plans only smooth base change, and the paper uses flat base change. Blowups are planned in Tau Ceti StableReduction Layer 4, with finitely generated relative Proj in Layer 2 (RS-25).
- **The Nagata compactification is planned** in AdicCoefficientsAndComparisons L2.
- **The atlas does have layers for depth, catenarity and excellence as hypotheses** (R03.3), for dualizing complexes (AnalyticStacks AS.1, by accepted routes of PAPER-HACON-WITASZEK-23 and PAPER-BHATT-ETAL-23), and for blowups.

The changes:

- **Items: 61 became 81** (3 library, 5 planned, 73 missing).
  - The expository §§1.12–1.13 (items 14, 15) were removed.
  - Items 17, 20, 21, 29, 34 and 38 were split.
  - Items 13, 16, 43, 45, 49, 55 and 58 were corrected.
  - The inputs the proofs use without an item were added. They include:
    - Kollár's coherence criterion;
    - formal patching;
    - Zariski's main theorem;
    - Ratliff's theorem;
    - the local cohomology calculus;
    - local duality;
    - Grothendieck's depth criterion;
    - Zariski's connectedness theorem;
    - divisors, birational morphisms and schematic images.
- **Routes: six, all accepted as corrected.**
  1. **MacaulayficationOfNoetherianSchemes.** The brief now states the final theorems verbatim and names its imports by title and id.
  2. **KawasakiCohenMacaulayBlowingUps**, renamed from LocalCohomologyAndDualizingComplexes. It is narrowed to CM-secant sequences, d-sequences, module blowups and Theorem 3.14.
  3. **Source of SF.0 and SF.4.** It carries the extension of coherent submodules (EGA I 9.4.7) and Kollár's criterion.
  4. **New source of R03.3.** It carries secant sequences, local cohomology, the depth criterion, the injective hull, flat depth and catenary (S₂) equidimensionality.
  5. **New source of AS.1.** It carries the dualizing complexes.
  6. **SchemeAndStackFoundationsPartIIArithmeticPresentation, reused.** It carries the avoidance lemma, with the accepted route's full brief, because make_queue.py keeps the later paper's brief for a shared id.
- **Source issues.**
  - E1–E3 are confirmed. E3's locator is pp. 7–8, and its correction now covers the use of the clause in Theorem 2.13.
  - E4–E9 are new: misprints in §1.14, Remark 3.9, Proposition 3.11(iii), I_s and (3.14.10), and an error in (4.4.1). There the product of annihilators must be taken in O_X, not as a preimage; the repair is one line.
  - No stated result changes.
- **Prerequisites.** These are corrected:
  - the Gabber–Liu–Lorenzini and Kollár papers, which were the wrong ones;
  - the Deligne DOI;
  - the §1.12 names (Honsen, Mordasini, Heinrich);
  - the Ogoma and Heitmann references;
  - the Cuong link.
