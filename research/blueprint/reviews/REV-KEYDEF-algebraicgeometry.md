# REV-KEYDEF-algebraicgeometry

Independent review of the key-definition survey `KEYDEF-algebraicgeometry` (area "Schemes, curves and moduli") for
issue #5272. The survey is by Codex, session `codex-rtOQ9t` (issue #5271, PR #5297).

Reviewer: Claude Code, session `cc-c2c06b`, 1 October 2026. I did not write the survey or its input.

**The account requirement.** §19 asks for a reviewer "running on a different account". The survey was written on the
Codex account; this review runs on the Claude Code account, so the requirement is met. (The earlier
REV-KEYDEF-algebraicnt was Codex reviewing Codex, which is why it stopped at needs_changes.)

**Verdict: accepted, after corrections in place.** Every entry, as corrected, meets the five criteria. Owner gaps and
duplications are recorded, as §19 requires; they do not block acceptance.

## How the review was done

I split the work into five parallel checks run by this session, then merged and applied their results myself:
- four checks of five entries each;
- one check of the 295-item accounting, the 34 reserve groups, the 18 elsewhere records and the routine items.

**The checks.** Each entry check:
- read every cited catalogue item (`data/items/<n>.json`);
- searched the whole catalogue (207 papers, 28,537 records) for further instances;
- read every cited declaration in the Mathlib (`082e2d3`) and Tau Ceti (`f790474`) source trees, and searched both for
  missed declarations;
- recomputed every API example, and tested every counterexample against the plausible wrong definition it names;
- read the owner stages in `data/atlas.json`, and checked dependencies and sizes.

**What I checked myself:**
- the owner leads, against the stage texts;
- the eight new entries' API statements. For example:
  - W₂(F_p[x]) is not flat over Z/p², since (0, x) is p-torsion but not in p·W₂;
  - ℓ(A/m^{n+1}) = n + 2 for k[[x,y]]/(xy, y²), so e = 1 but A is not regular;
  - k[t², t⁵] ≠ k + t²k[t];
  - the henselization of Z_(p) is countable.
- the checker, run with the declaration index.

## Corrections made

### 1. Paper counts

The survey counted papers only within its input, but §19 counts over the whole catalogue. Every entry gained papers:

| Entry | Before | After |
|---|---:|---:|
| Chow groups and refined intersections | 13 | 19 |
| Flat torsors | 8 | 19 |
| Normal crossings | 5 | 12 |
| Coarse moduli | 3 | 9 |
| Scheme Brauer groups | 3 | 9 |
| Quotient stacks, coherent duality, scheme perfection, supports | 3–5 | 8 each |
| Numerical equivalence, algebraic spaces | 3–4 | 7 each |
| Hilbert/Quot, moduli of curves | 4 | 6 each |
| Weil restriction | 3 | 5 |
| Gerbes | 3 | 4 |
| Galois gerbs, inertia, relative spectrum | 2 | 3 each |

The entries are re-sorted by paper count.

**Items that were not instances.** Nine cited items were moved to routine, each with a reason:
- HARPAZ-WITTENBERG-20/33 is a theorem;
- CESNAVICIUS-19/brauer-residue and BENOIST-19/10 concern field Brauer groups;
- BENOIST-WITTENBERG-20/support-theory is the axiomatic CHK theory;
- ZHU-17/A01 is an fpqc sheaf, not an algebraic space;
- BRESCIANI-24/38, /121 and /149 are a generic fibered-category notion, a superseded item and a presentation lemma;
- CANNING-LARSON-PAYNE-24/5 is about tautological classes.

Each paper concerned is still counted through another item.

**A double count.** VANHOFTEN-24/F01 was cited under both algebraic spaces and perfection. It now counts for perfection
only.

### 2. Library claims

The libraries already have parts of several notions, and the entries now say so:
- **Chow groups:** Tau Ceti's divisor class group of a Noetherian integral scheme, with its injection into line-bundle
  classes. That is rational equivalence in codimension one.
- **Flat torsors:**
  - Mathlib's `PresheafOfGroups.H1`: Čech H¹ for one fixed family, without the colimit over covers;
  - `Scheme.fppfTopology`, fpqc descent of isomorphisms and the set-level `Torsor`.
- **Algebraic spaces:** `Functor.relativelyRepresentable` with base-change stability, and the étale topologies. The
  survey's claim that representable sheaf morphisms are missing was wrong.
- **Supports:** `localCohomology`, whose computation is the API's affine-line example.
- **Relative spectrum:** `AffineZariskiSite.relativeGluingData` and `algSpec` already glue a quasi-coherent algebra into
  a scheme. The entry is now size M, for the sheaf-of-algebras bridge, the universal property and the vector-bundle
  case.
- **Weil restriction:** `ExponentiableMorphism`. **Galois gerbs:** the group-extension API.
- **Smaller additions:**
  - numerical equivalence: Tau Ceti's numerical-quotient API;
  - scheme perfection: `PerfectClosure.lift`;
  - scheme Brauer: Tau Ceti's field Brauer group and Mathlib's `IsAzumaya.matrix`;
  - inertia: the categorical pullback.

None of these makes a notion already present: each entry's "missing" text states what remains.

### 3. Owners

**Owners corrected:**
- **Chow and Chern operations:** SchemeKTheoryOperations:S.7 plans Chern classes, excess intersection and GRR alongside
  SF.5. This is now a recorded duplication.
- **Scheme perfection:** GeometricSatakeAndFusion:GS0:Witt-geometry plans the perfect-space carrier. It is no longer a
  gap.
- **Supports:** EtaleDualityAndPerverseSheaves:EDC.0 plans cohomology with support. This is a duplication with SF.2.
- **Weil restriction:** AbelianSchemesAndArithmeticModuli:A6 plans the restriction functor. This is a duplication with
  R09.3.
- **Numerical equivalence:** MotivesAndAlgebraicCycles:MC.0 plans numerical equivalence of cycles. The relative spaces,
  cones and Pic^τ remain a gap.
- **Gerbes:** no stage mentions gerbes, and SF.1 plans stacks only in general. Owners are now empty: a gap.
- **Coherent duality:** the draft AnalyticStacks AS.3 is a partial supplier (solid quasi-coherent six functors). The
  entry records it in its "missing" text, together with the Nagata-compactification prerequisite.

**Remaining gaps (13):**
- excellent schemes;
- scheme Brauer groups (RP.2 only consumes them);
- coherent duality;
- moduli of curves;
- gerbes;
- henselization;
- equivariant sheaf cohomology;
- Galois gerbs;
- Higgs/parameter connections;
- root stacks;
- étale K(π,1);
- Ferrand pushouts;
- Hilbert–Samuel multiplicity.

**Remaining duplications (6):**
- Chow (SF.5 and S.7);
- quotient stacks, algebraic spaces and inertia (R09.x and SF.1);
- supports (SF.2 and EDC.0);
- Weil restriction (R09.3 and A6).

### 4. API statements

Twenty statements were replaced or added:

| Entry | Statement | Problem | Change |
|---|---|---|---|
| algebraic spaces | 0 | "Exactly one k-point" is false over C or F_p(t), since Hom(Spec k, Spec k) = End(k) | replaced |
| algebraic spaces | 4, 5 | definitional, or already a Mathlib lemma | replaced: A¹/Z (not quasi-separated) and fibre products |
| normal crossings | 2 | the cusp test was weak | adds the nodal cubic (normal crossings, not strict) and three concurrent lines (not normal crossings) |
| coherent duality | 4 | involutivity is part of the definition | replaced: the Cohen–Macaulay criterion via the single nonzero cohomology of ω•, failing for k[x,y]/(x², xy) |
| quotient stacks | new | nothing tested stackification | B(Z/2) over R has two isomorphism classes of R-points, while the unstackified groupoid has one object |
| flat torsors | 6 | the free-action clause named no example | the empty scheme satisfies E ×_S G ≅ E ×_S E but is not a torsor |
| scheme perfection | 5, 6 | the counterexample only asserted failure | made concrete: the inverse-limit `Perfection` of F_p[t] is F_p, while the perfect closure is F_p[t^{1/p^∞}] |
| Hilbert/Quot | 4 | definitional | replaced by concrete tests |
| moduli of curves | 4 | definitional | replaced by Knudsen's universal-curve theorem |
| numerical equivalence | 4 | definitional | replaced by Kleiman's criterion with Mumford's example |
| coarse moduli | 5 | an uncheckable "outside that setting" clause | replaced by base change of the Z/2-quotient of A¹_Z to F₂ |
| Galois gerbs | 6 | a design instruction | replaced by the Kottwitz gerbe test |

Further wording fixes:
- gerbes: "n ≥ 2";
- supports: a test against restriction cohomology;
- Weil restriction: smoothness needs only finite locally free;
- Higgs connections: tensor products keep λ;
- relative spectrum: g*A, not A|X′;
- equivariant sheaf cohomology: a base-moving test, ℤ acting on ℝ.

### 5. New entries

**Promoted from the reserve.** Seven reserve groups failed their stated reason ("one paper only"), because a second
paper needs the notion. They are now entries, each with at least six API statements:

| Entry | Papers | Owner | Notes |
|---|---:|---|---|
| Excellent rings and schemes | 10 | gap | The reserve counted only papers restating the definition. §19 counts papers that need the notion, and excellence is a hypothesis in definition items of nine more papers. Neither library has G-rings, J-2 or universal catenarity; Tau Ceti's own `NormalizationFinite.lean` notes the absence. |
| Henselization of pairs and local rings | 4 | gap | Only the henselian-pair predicate exists. |
| Geometric quotients | 4 | SF.1 | Includes Witaszek's finite equivalence relations. |
| Witt schemes and Witt sheaves | 2 | CrystallineCohomology:CR.4 | BHATT-SCHOLZE-17 and HACON-WITASZEK-23. |
| Root stacks | 2 | gap | BRESCIANI-24 and YUN-ZHANG-19. |
| Étale K(π,1) | 2 | gap | FARB-KISIN-WOLFSON-24 and SCHMIDT-STIX-16. |
| Ferrand pushouts | 2 | gap | WITASZEK-22 and SCHROER-23. WITASZEK-22/conductor-square moves here from routine. |

**From routine.** Hilbert–Samuel multiplicity (CARO-PASTEN-23 and IYENGAR-KHARE-MANNING-24): neither library has it.

**Reserve review.** The other 27 reserve reasons hold. Hurwitz stacks of tetragonal curves moved from elsewhere to the
reserve: IG.5 plans Galois covers, not degree-4 Hurwitz stacks.

### 6. Elsewhere records

- **Variations of Hodge structure.** The owner was a README section about an unwritten upstream successor. It is now
  ShimuraData:D3, which plans the VHS carrier.
- **Lisse sheaves.** The owner `CohomologicalPointCounting#…` does not resolve; it is an unmerged upstream pull request,
  recorded in the atlas only as external contracts. The owner is now SF.2, their atlas integration owner.
- **Symmetric powers.** ModularCurves 0C glues quotients only for free actions. The owner is now the geometric-quotients
  entry.
- **Curve model over a base.** GILLE-PARIMALA-26/64 now points to StableReduction layer 5. BRESCIANI-24/1 stays with
  AlgebraicCurves layer 12.

The other 13 records are right.

## Accounting and checks

**Accounting.** All 295 input items are accounted for once:
- 113 support entries;
- 27 are elsewhere;
- 53 are in the reserve;
- 102 are routine.

**Checker.** `check_keydefs.py`, run with `TAUCETI_BASELINE` pointing at the pinned declaration index, reports 0 errors
and 21 warnings, which are the 13 gaps and 6 duplications above, plus two citations shared with the algebraicnt survey:
- HARPAZ-WITTENBERG-16/4, which is both an instance of Chow groups and an input of the adelic zero-cycle complex;
- ZAVYALOV-25/31.

Sharing an item across two notions is allowed; neither is a duplicate notion.

The survey's report (`KEYDEF-algebraicgeometry.md`) has regenerated tables and a section summarising this review.

## For the orchestrator

- **Log pairs.** Log pairs, discrepancies and klt/lc singularities (BHATT-ETAL-23, HACON-WITASZEK-23, WITASZEK-22) are a
  likely key definition, but they are absent from this input. Two papers' routes give the birational-geometry roadmap
  different areas, and the slicer in `make_queue` keeps the first one it reads, so these items landed in the
  not-yet-enabled arithmeticgeometry area. They should be surveyed there, or the routing fixed. I did not add them,
  because §19 adds only missed definitions of the input.
- **Owners to assign.** The 13 gaps and 6 duplications need owner decisions. Excellent schemes, at 10 papers, is the
  most urgent gap.
