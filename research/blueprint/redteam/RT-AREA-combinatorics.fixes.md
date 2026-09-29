# RT-AREA-combinatorics: fixes

Fixer: Claude Code, session `cc-39fac3`, 29 September 2026 (issue #3989, job FIX-RT-AREA-combinatorics).
- Findings: `RT-AREA-combinatorics.result.json`, 44 findings (5 high, 22 medium, 17 low), by `cc-2aeb03`.
- Verdicts: `RT-AREA-combinatorics.review.json` and `research/blueprint/reviews/REV-RT-AREA-combinatorics.md`, by
  `codex-7e92bd`: 36 confirmed and 8 rejected (/1, /10, /11, /19, /20, /23, /28, /31).
- Everything below was checked at origin/main `701638e0`. The graph checks use the atlas as `scripts/build.py`
  assembles it at that commit (2840 stages, 7792 stage edges). "The cycle test for A → B" asks whether that graph has
  a path B → … → A; "acyclic" means it has none.

## How to read this report

The job has three deliverables, and this pull request changes all three:
- **This report.**
- **`research/blueprint/papers/PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json`**, edited directly for the findings that
  name it.
- **`research/blueprint/restructure/RS-03.result.json`**, edited directly for the findings that name it.

Every other fix is an exact edit for the maintainer or for the blueprint jobs of these roadmaps. Two of the three
roadmaps, AlgebraicCodingTheory and DenseGraphLimits, are Tau Ceti roadmaps: snapshots of the upstream
TauCetiRoadmap repository. Under PROTOCOL.md section 15 the atlas never re-plans them, so their fixes are **notes for
the Tau Ceti maintainer**, with replacement wording for the upstream README. The snapshot and the atlas stage
descriptions are then regenerated from upstream.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason. Rejected
findings are recorded without change.

**Disclosure.** This session did not write the red team or its verification. It did extract
PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 (PR #1948), which two findings correct; the corrections follow the verifier's
reasons and nothing else.

## Summary

| # | Finding | Fix |
|---|---|---|
| /1, /10, /11, /19, /20 | AdditiveCombinatorics | rejected; no change |
| /2 | medium, missing | AC.2 names the arithmetic removal lemma (Král'–Serra–Vena) with its directed removal input (open obligation) |
| /3 | medium, library-claim | **RS-03 edited:** an AC.2 `narrow` entry imports Mathlib's Roth, Behrend and van der Waerden; AC.2 keeps the quantitative, correspondence, k ≥ 4 and removal work |
| /4 | high, other | AC.3's source route and coverage record name the actual inverse-theorem sources and what was read |
| /5 | high, missing | **ALPOGE-BHARGAVA-SHNIDMAN-26 edited:** item /35's note and route 3's reason list what Kai's proof consumes; AC.5 gets a Kai branch without AC.4 (maintainer edit) |
| /6 | medium, error | **ALPOGE-BHARGAVA-SHNIDMAN-26 edited:** item /33, route 5 and gap G1 record that Kai's proof still needs the Siegel-corrected Mitsui theorem (Kai v5 Prop. 6.4, supplier AN.4); one prerequisite added |
| /7 | medium, missing | AC.5's inputs gain AC.3, AN.3, AN.4, FF.2 and SV.2 (all acyclic) |
| /8 | high, error | AC.4's text and acceptance follow the decomposed Green–Tao 2008 route; Conlon–Fox–Zhao is an optional branch |
| /9 | medium, error | the edge SV.3 → AC.4 is removed (RS-07 link, maintainer) |
| /12 | medium, missing | AC.1 plans Bohr sets and the Freiman-type inverse results over ℤ; the John's-theorem supplier for the general case stays open |
| /13 | medium, duplicate | a new stage AC.3a (nilmanifold carrier), consumed by AC.3 and ALS.2 |
| /14 | medium, duplicate | AC.0 owns the finite-abelian Fourier interface with one convention; **RS-03 edited:** link AC.0 → ER.4 and ER.4 in the owner's `formerly` |
| /15 | low, error | AC.0's inputs: CA.2 → AC.0 and LI.2 → AC.0 removed; GN.1 → AC.1 added |
| /16 | low, error | **RS-03 edited:** AUDIT-06 → AUDIT-16 (twice) |
| /17, /18 | low | two decomposition nodes corrected (Szemerédi set form; Gowers inner product) |
| /21 | medium, error | AlgebraicCodingTheory Layer 6: Type II codes over ℤ/(2k) for every k ≥ 1, with the Construction A iff (Harada–Miezaki §§2.1, 2.4) |
| /22 | medium, missing | Layer 7 plans the finite-family lattice sum and power its interface needs |
| /23, /28 | AlgebraicCodingTheory | rejected; no change |
| /24 | medium, error | 17 dependency edges between the coding layers, each with its evidence in the consumer layer (all acyclic) |
| /25 | low, error | Layer 1 keeps the raw constructions; the dual, distance and enumerator statements move to Layers 2 and 3 |
| /26, /27 | low, library-claim | the README names the pinned coding declarations (with the bilinear and even gluing cases kept apart); the audit's matrix citations reach the coverage |
| /29 | low, other | conditional on the Construction A reading: GN.4 imports coding Layer 6 and owns the real interface (covolume m^{n/2}/#C, minimum min(m, d_E(C)/m) for nonzero C); link ACT-L11; ACT-O03/ACT-R02 closed |
| /30 | low, error | Layer 3 states 2·dim C = n, the self-dual identity over ℤ, and the normalized form over ℝ only |
| /31 | DenseGraphLimits | rejected; no change |
| /32–/36 | medium, missing/error | Layers 9c, 0/4/5/6a, 4, 3 and 8b get the named inputs and routes from Lovász's *Large Networks and Graph Limits* (LNGL), Janson, Lovász–Szegedy 2006 and the pin |
| /37, /39 | medium, duplicate | OptimalTransport Layer 0 owns couplings and gluing (bridge contract); Layer 9a owns finite densities; the energy and weak-regularity overlap goes to the maintainer |
| /38 | medium, missing | upstream PR #66 (arity-3 regularity) is named with its actual scope; no AC.2 edge |
| /40 | medium, other | child stages 6a/6b and a 28-row edge table (all acyclic); no status fields changed |
| /41–/44 | low | Layer 9b uses the pinned projective-limit theorem; locators and references corrected; Janson A.9 is Mathlib's `exists_measurable_map_eq`; the triangle inequality and GraphonSpace move into Layer 2 |

## AdditiveCombinatorics, RS-03 and ALPOGE-BHARGAVA-SHNIDMAN-26 (/1–/20): conventions

Fifteen findings are confirmed (/2–/9, /12–/18) and five rejected (/1, /10, /11, /19, /20).

**Edits made in this pull request.**
- `research/blueprint/papers/PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26.result.json`: /5 and /6.
  This session (Claude Code, `cc-39fac3`) wrote that extraction, so correcting it here is allowed and expected.
- `research/blueprint/restructure/RS-03.result.json`: /3, /14 and /16.

Both files keep their original serialisation (two-space indent, non-ASCII kept, final newline), so their diffs show only these edits. The promoted mirror `data/restructure/RS-03.result.json` is regenerated from the edited file when it is promoted.

**Edits for the maintainer.** Everything else is an exact edit for the maintainer:
- `content/campaign/AdditiveCombinatorics/README.md` and the matching stage `description`s in `data/atlas.json`, which are the README text between each stage's context lines;
- `data/atlas.json` stage `requires`/`consumers`, `stageEdges` and `edges`;
- `data/decompositions/AdditiveCombinatorics.json`;
- `data/library-coverage.json`;
- RS-07 (both copies) and `research/blueprint/restructure/RS-03.md`;
- the EllipticRegulators and ArithmeticLocallySymmetricSpaces READMEs.

Quotations ignore line wrapping. README line numbers are at `701638e0`.

**State since the verification (24 September).** None of these files changed after it, except RS-07: FIX-RT-RS-07 (29 September) withheld the AN.3 narrowing in `research/blueprint/restructure/RS-07.result.json`. Its SV.3 → AC.4 link is unchanged in both copies.

**Acyclicity.** Every edge change below was checked together in the assembled graph (`701638e0`, 7792 edges): 9 edges added, 2 removed (LI.2 → AC.0 is already dropped by the retirement), no cycle. Each added edge was also checked on its own (no path from its target back to its source).

## /1 (high, error): rejected; no change
The verifier found that the claimed cycle is not forced: AC.2 owns the prerequisites of a route still to be selected. The decomposition gap "Szemeredi's theorem has no read proof anywhere in EXT-08" remains the obligation.

## /2 (medium, missing): AC.2 names its arithmetic removal lemma and owns its directed removal input

### What the verifier corrected
- The fix must name the equation or system, its exact hypotheses and the selected proof, and assign the counting/removal input once.
- Kráľ–Serra–Vena (KSV) §2, pp. 5–6, apply removal for a fixed directed graph (their Lemma 6) to a directed cycle. §3 uses an arc-coloured variant for graph-representable systems.
- Mathlib has only undirected triangle removal. Its undirected regularity lemma gives no directed or coloured removal theorem without adapters.
- Not every system needs hypergraph removal: the graph-representable ones do not.

### State on main (701638e0)
- **README, AC.2, line 41:** "Formalize Roth/Szemeredi and arithmetic removal through one selected complete proof route; include ergodic/combinatorial infrastructure as owned prerequisites." No removal statement and no input are named.
- **Decomposition, coverage of AC.2:** "Arithmetic removal lemmas: no source read."
- **AUDIT-16, AC.2 target "Arithmetic removal through a selected proof route"** (partial): "Triangle removal (and its corners application) exists; general graph removal, hypergraph removal and Green's arithmetic removal lemma are absent."
- **At the pin:**
  - `SimpleGraph.triangle_removal` (Mathlib/Combinatorics/SimpleGraph/Triangle/Removal.lean:161) is undirected and for triangles only.
  - `szemeredi_regularity` (SimpleGraph/Regularity/Lemma.lean:76) is undirected.

### Fix (maintainer edit: README, AC.2)
Insert after line 41:

> **Arithmetic removal (selected target and route).** Kráľ–Serra–Vena, *A combinatorial proof of the Removal Lemma for Groups*, arXiv:0804.4847v1, Theorem 2 (p. 2).
> - **Setting.** G is a finite group of order N, m ≥ 2, A_1, …, A_m ⊆ G and g ∈ G.
> - **Statement.** For every δ > 0 there is δ′(δ, m), independent of N and of the structure of G, with δ′ → 0 as δ → 0, such that the following holds. If x_1x_2⋯x_m = g has fewer than δN^{m−1} solutions with x_i ∈ A_i, then there are A_i′ ⊆ A_i with |A_i \ A_i′| ≤ δ′N for which the equation has no solution with x_i ∈ A_i′.
> - **The abelian case.** For abelian G, g = 0 and m ≥ 3 this is Green's removal lemma (KSV Theorem 1).
> - **Proof (KSV §2, pp. 4–6).**
>   1. Build the directed graph H_0 on G × {1, …, m}. It has an arc (x, i) → (xa_i, i+1) for each a_i ∈ A_i (i < m), and an arc (x, m) → (xa_mg^{−1}, 1) for each a_m ∈ A_m.
>   2. Each solution gives N arc-disjoint directed m-cycles, and each directed m-cycle gives a solution.
>   3. Apply removal for the directed m-cycle, then pigeonhole from o(N²) arcs to o(N) elements.
> - **Graph input, owned here once.** Removal for a fixed directed graph H on h vertices (KSV Lemma 6, quoting Alon–Shapira, Lemma 4.1): a directed graph on n vertices with o(n^h) copies of H becomes H-free after deleting o(n²) arcs.
>   - The pins have only undirected triangle removal (`SimpleGraph.triangle_removal`, Removal.lean:161) and the undirected `szemeredi_regularity`.
>   - The directed lemma needs its own regularity and counting argument, or an explicit adapter.
>   - Acquiring Alon–Shapira's proof is a source task.
> - **Optional extension.** KSV Theorem 3 (p. 3) covers the graph-representable systems (1) over a finite abelian group, through the arc-coloured Lemma 7 (p. 7). These systems need no hypergraph removal. Systems that are not graph-representable stay out of scope until a source is selected.

In the Acceptance paragraph (line 45), append: "The removal constant δ′ depends only on δ and m, not on N or on G."

### Not done, and why
- Alon–Shapira's Lemma 4.1 was not read. It stays a source obligation of AC.2.
- No removal node is added to the decomposition: that packet reads only Green–Tao 2008, which does not use removal.

## /3 (medium, library-claim): AC.2 imports pinned Roth, Behrend and van der Waerden, recorded as an RS-03 narrowing

### What the verifier corrected
- AC.2's instruction to formalize Roth was never narrowed to consume Mathlib's Corner/Roth.lean:137, 163, 196, Behrend.lean:481 and HalesJewett.lean:459.
- AC.2 keeps the genuinely stronger quantitative, correspondence and k ≥ 4 work.
- The ThreeAPFree convention stays explicit.
- The audit's Roth evidence and its partly-built verdict are already right. Only missing useful citations are added. This is not an erroneous absence verdict.

### State on main (701638e0)
- **README line 41:** as quoted under /2.
- **RS-03:** `RS-03.result.json` has no AC.2 layer entry. `RS-03.md` line 110 reads "| AC.2 | Complete Roth/Szemeredi/removal proof routes unchanged. |".
- **AUDIT-16, AC.2:** verdict "partly built". Its evidence is `roth_3ap_theorem` (Roth.lean:137), `roth_3ap_theorem_nat` (:163) and `corners_theorem` (:79).
- **Read at Mathlib 082e2d3:**
  - `roth_3ap_theorem` (Combinatorics/Additive/Corner/Roth.lean:137). Hypotheses: G a finite additive commutative group, 0 < ε, `cornersTheoremBound ε ≤ card G`, `ε * card G ≤ #A`. Conclusion: `¬ ThreeAPFree (A : Set G)`.
  - `roth_3ap_theorem_nat` (:163): the same for `A ⊆ range n`, with `cornersTheoremBound (ε / 3) ≤ n`.
  - `rothNumberNat_isLittleO_id` (:196): `rothNumberNat N = o(N)`.
  - `Behrend.roth_lower_bound` (AP/Three/Behrend.lean:481): `N * exp (-4 * √(log N)) ≤ rothNumberNat N`.
  - `Combinatorics.exists_mono_homothetic_copy` (HalesJewett.lean:459): for a finite colouring of a commutative additive monoid and a finite S, some a • S + b with a > 0 is monochromatic.
  - `ThreeAPFree` (AP/Three/Defs.lean:72, the additive form of `ThreeGPFree`): a + c = b + b implies a = b. In a group of exponent two a + a = b + b always holds, so every set with two elements fails it.

### Fix
1. **Made in this pull request: `RS-03.result.json`, new layer `AdditiveCombinatorics:AC.2`, action `narrow`.**
   - **keeps:** "Szemeredi's theorem for every k >= 4 through one selected complete proof route, with its ergodic/combinatorial prerequisites owned here; quantitative k = 3 statements beyond the imported tower-type bound (cornersTheoremBound); the Varnavides count and the proved correspondence between the finite quantitative and the infinite positive-upper-density forms (the pins have no upper or Banach density); and the named arithmetic removal lemma (Kral'-Serra-Vena, arXiv:0804.4847v1, Theorem 2) with its directed fixed-graph removal input. Roth's theorem in finite abelian groups and in [n] with its o(N) form, Behrend's lower bound and van der Waerden (a monochromatic homothetic copy, via Hales-Jewett) are imported with their stated hypotheses. The ThreeAPFree convention stays explicit: in a group of exponent two a + a = b + b, so a repeated endpoint (a, b, a) with a != b witnesses failure."
   - **suppliedBy:** "UPSTREAM:Mathlib Roth, corners, Behrend and Hales-Jewett/van der Waerden theorems (AUDIT-16; pin 082e2d37e8b0463410cdb532e111cd43d5a66174)".
   - **reason:** cites this finding and the five declarations with file:line. It also records that the partly-built verdict is unchanged.
   - **When applied.** On promotion, `scripts/restructure.py` records the narrowing on the stage. No other restructuring has an AC.2 entry.
   - **No forwarding link.** The supplier is UPSTREAM, so no §15 forwarding link is needed; REV-RS-03 decided the same for its other UPSTREAM suppliers.
2. **Maintainer edit: README line 41.** Replace the sentence with:
   > Import Roth's theorem (`roth_3ap_theorem`, `roth_3ap_theorem_nat`, `rothNumberNat_isLittleO_id`; Mathlib Combinatorics/Additive/Corner/Roth.lean:137, 163, 196, with the tower-type `cornersTheoremBound`), Behrend's lower bound (`Behrend.roth_lower_bound`, AP/Three/Behrend.lean:481) and van der Waerden (`Combinatorics.exists_mono_homothetic_copy`, HalesJewett.lean:459) with their stated hypotheses; do not re-prove them. Keep Mathlib's `ThreeAPFree` convention explicit: in a group of exponent two a + a = b + b, so (a, b, a) with a ≠ b witnesses failure. Formalize Szemerédi's theorem for k ≥ 4, and any k = 3 bound stronger than the imported one, through one selected complete proof route, with its ergodic/combinatorial infrastructure as owned prerequisites; formalize arithmetic removal as below.
3. **Maintainer edit: `research/blueprint/restructure/RS-03.md` line 110.** Replace the row with: "| AC.2 | Roth, Behrend and van der Waerden imported from Mathlib; the k ≥ 4 route, stronger k = 3 bounds, the Varnavides correspondence and arithmetic removal retained. |"
4. **Maintainer edit: `data/library-coverage.json`, `layers["AdditiveCombinatorics:AC.2"].evidence`.** Append:
   ```json
   {"target": "Roth's theorem (3-term progressions) in finite and integer form with a quantified density", "name": "rothNumberNat_isLittleO_id", "library": "mathlib", "file": "Mathlib/Combinatorics/Additive/Corner/Roth.lean", "line": 196, "fit": "exact"},
   {"target": "Szemeredi's theorem for progressions of every length k (and van der Waerden)", "name": "Combinatorics.exists_mono_homothetic_copy", "library": "mathlib", "file": "Mathlib/Combinatorics/HalesJewett.lean", "line": 459, "fit": "more general"}
   ```
   The verdict stays "partly built".

### Not done, and why
- `Behrend.roth_lower_bound` and `triangle_removal` get no evidence entry. No AC.2 target matches either with fit "exact" or "more general", and the removal target's note already names triangle removal.
- `RS-03.review.notes` still counts "21 narrow". That count predates this edit and belongs to the review record.

## /4 (high, other): AC.3's source route becomes Leng–Sah–Sawhney, with corrected GTZ as a cross-check

### What the verifier corrected
- **GTZ errata.**
  - GTZ v5, p. 72, footnote 7, corrects the filtration in Lemma 13.2.
  - The April 2024 erratum (pp. 1–2) handles other filtration issues and Proposition 8.3.
  - The polynomial-orbits erratum corrects the multiparameter input.
- **Qualitative against quantitative.** GTZ's Appendix A works with limit objects, while LSS Theorem 1.2 exports quasipolynomial bounds. Kai §2.3 consumes LSS together with Leng, so a qualitative-only AC.3 does not close that accepted consumer.
- **What to do.**
  - Pin corrected versions and add the quantitative and box interfaces.
  - LSS may be the primary route.
  - GTZ may stay only if its extra prerequisites and the separate quantitative obligation are planned.

### State on main (701638e0)
- **README line 59:** "**Source route.** Green-Tao-Ziegler inverse theorem arXiv:1009.3998 plus April 2024 erratum; full proof and corrected nilsequence argument required. The announcement alone is insufficient."
- **Decomposition, `coverage[AC.3].remaining[1]`:** "The inverse theorem for the Gowers U^{s+1} norm and nilsequences (the stage's own named source route: Green-Tao-Ziegler arXiv:1009.3998 plus the April 2024 erratum) was NOT acquired or read. …"
- **arXiv API, 29 September 2026:**
  - 1009.3998v5 was updated 23 April 2026, with the comment "This version corrects a mistake in the proof of Lemma 13.2 (the wrong filtration was specified)".
  - The polynomial-orbits erratum 1311.6170 is now at v3 (14 August 2015). The verifier read v2; v3 adds the small-N_i restriction.

### Fix (maintainer edits)
1. **README line 59.** Replace it with:
   > **Source route.**
   > - **Primary proof: Leng–Sah–Sawhney**, *Quasipolynomial bounds on the inverse theorem for the Gowers U^{s+1}[N]-norm*, arXiv:2402.17994v3 (10 August 2024), Theorem 1.2.
   >   - **Hypotheses:** 1-bounded f : [N] → ℂ with ‖f‖_{U^{s+1}[N]} ≥ δ, δ ∈ (0, 1/2).
   >   - **Conclusion:** there is a nilmanifold of degree s and dimension ≤ log(1/δ)^{O_s(1)}, a K-Lipschitz F and a polynomial sequence g with |E_{n∈[N]} f(n)F(g(n)Γ)| ≥ ε, where ε^{−1}, K and the complexity are ≤ exp(log(1/δ)^{O_s(1)}).
   >   - **Equidistribution input:** Leng, *Efficient equidistribution of nilsequences*, arXiv:2312.10772v5.
   > - **Box versions on [±N]^n,** needed by AC.5's Kai branch: Kai, arXiv:2306.16983v5, Appendix A (Theorem A.1 by Kronecker substitution, Proposition A.2, Theorem A.3), and the generalized von Neumann theorem on boxes (Appendix D, Theorem D.3).
   > - **Cross-check, qualitative only: Green–Tao–Ziegler**, arXiv:1009.3998v5 (23 April 2026). Its p. 72, footnote 7 corrects the filtration in the proof of Lemma 13.2. Use it together with the April 2024 erratum, which makes the filtrations taut, corrects Proposition 8.3 and fixes points in §§9–12 and Appendix E.
   > - **GTZ's equidistribution input:** Green–Tao, *The quantitative behaviour of polynomial orbits on nilmanifolds* (Ann. of Math. 175 (2012)), as corrected by arXiv:1311.6170v3 (14 August 2015). Its Theorem 8.6 holds as deduced only when N_1 = ⋯ = N_t, or with every N_i ≥ Cδ^{−C}.
   > - **If GTZ is used as a proof,** this stage also plans GTZ's ultralimit framework (Appendix A: a non-principal ultrafilter, limit objects and internal sets, overspill, Lemma A.5).
2. **README line 57 (Acceptance).** Append: "The inverse theorem is exported with explicit quasipolynomial bounds, for intervals [N] and for boxes [±N]^n."
3. **Decomposition, `coverage[AC.3].remaining[1]`.** Replace "(the stage's own named source route: Green-Tao-Ziegler arXiv:1009.3998 plus the April 2024 erratum)" with "(primary route after RT-AREA-combinatorics/4: Leng-Sah-Sawhney arXiv:2402.17994v3 with Leng arXiv:2312.10772v5; cross-check Green-Tao-Ziegler arXiv:1009.3998v5 plus the April 2024 erratum)".

### Not done, and why
- The proofs in LSS and Leng are not decomposed; that is AC.3's source work.
- No ultralimit layer is added. It is needed only if GTZ is chosen as a proof.
- The erratum's journal version is not cited: only arXiv v3 was checked.
- The LSS and GTZ versions of the U^{s+1} definitions go into the AC.3 node under /18.

## /5 (high, missing): AC.5 gains a named Kai branch with its own suppliers

### What the verifier corrected
- The accepted route 3 of PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 sends item /35 to AC.5. AC.5's text and its sole input AC.4 omit the number-field branch.
- Kai v5 §§2.1–2.6, Proposition 6.4, Lemma 7.1 and Theorems 12.1/13.1 confirm the branch's inputs:
  - box norms;
  - quantitative inverse theory and equidistribution;
  - Siegel zeros and Mitsui's theorem;
  - a character-sum bound;
  - Vaughan's decomposition over ideals.
- §2.3 dispenses with the pseudorandom majorant.
- What to do:
  - add a named Kai branch with the exact torsion-cokernel, local-factor and region hypotheses;
  - add supplier requests to AC.3, AN.4, FF.2 and the Type I/II owner;
  - keep AC.4 for AC.5's other branches.

### State on main (701638e0)
- **README AC.5:**
  - line 77: "Add finite-complexity systems of linear equations in primes and Mobius/nilsequence orthogonality via their separate source proofs. State local factors and exclude proportional degeneracies."
  - line 79: "**Inputs.** `AdditiveCombinatorics:AC.4`"
  - line 83: "New primary-proof acquisition: Green-Tao Mobius-nilsequence orthogonality and Linear equations in primes, …"
- **Atlas:** AC.5 requires only AC.4.
- **Paper, route 3 (AC.5, item /35):** accepted. Its reason did not say that AC.5 lacks the branch.

### Fix
**Maintainer edit: README AC.5.** Replace lines 77–83 with the section below. It also carries /7's Möbius inputs.

> **Construct and export.** Add finite-complexity systems of linear equations in primes and Mobius/nilsequence orthogonality via their separate source proofs. State local factors and exclude proportional degeneracies. Three branches, each closed by its own source proof:
> - **Linear equations in primes over ℤ (Green–Tao).** Uses AC.4's transference, AC.3's inverse theorem and the Möbius branch.
> - **Möbius–nilsequence orthogonality.** Green–Tao, arXiv:0807.1736v4, Theorem 1.1 (p. 2).
>   - **Setting.** G/Γ is a nilmanifold of dimension m ≥ 1 with a filtration of degree d ≥ 1 and a Q-rational Mal'cev basis (Q ≥ 2); g ∈ poly(ℤ, G_•); F : G/Γ → [−1, 1] is Lipschitz.
>   - **Statement.** |E_{n∈[N]} μ(n)F(g(n)Γ)| ≪_{m,d,A} Q^{O_{m,d,A}(1)}(1 + ‖F‖_Lip) log^{−A} N for all A > 0 and N ≥ 2. The implied constant is ineffective because of Siegel zeros.
>   - **Inputs** (supplied as below):
>     - the Type I/II dichotomy in Vaughan's form (Proposition 3.1, pp. 6–7);
>     - the Möbius progression estimates (Propositions A.1–A.2, p. 21): E_{n∈[N]} μ(n)χ(n) ≪_A q^{1/2} log^{−A} N for every Dirichlet character χ mod q; hence E_{n∈[N]} μ(n)f(n) ≪_A q log^{−A} N for 1-bounded f of period q. These are used with q ≪ log^{O(1)} N (p. 6).
>   - **Scope of Siegel–Walfisz.** The Siegel–Walfisz estimate for Λ with modulus log^{O(1)} N (§7, p. 19) serves only the prime-return-time application (Theorem 7.1), not Theorem 1.1.
> - **Linear patterns of prime elements in number fields (Kai).** Kai, arXiv:2306.16983v5, Theorem 13.1 (pp. 56–57), the localized form of Theorem 12.1 (pp. 54–55).
>   - **Setting.**
>     - K is a number field of degree n; S is a finite set of nonzero prime ideals; a is a nonzero fractional ideal; t, d ≥ 1.
>     - ψ_1, …, ψ_t : ℤ^d → a[S^{−1}] are affine-linear with torsion cokernels. For i ≠ j, ψ_i restricted to ker ψ_j also has torsion cokernel.
>     - A > 1 and N ≫_{Ψ,K,S,A} 1.
>     - Ω ⊆ [±N]^d has boundary of Lipschitz class Lip(d, Z, L_0N).
>   - **Statement.** Σ_{x∈Ω∩ℤ^d} ∏_i Λ^a_{O_K[S^{−1}]}(ψ_i(x)) = C_{S,Ψ} Vol(Ω)/res_{s=1}(ζ_K(s))^t + O_{K,S,Ψ,Z,L_0,A}(N^d (log N)^{−A}).
>     - C_{S,Ψ} = ∏_p (p^n/φ_K(p))^t (1 − p^{−d}|⋃_i ⋃_{𝔭|p, 𝔭∉S} ψ_{i,𝔭}^{−1}(0)|).
>     - C_{S,Ψ} is positive under the local condition (13.1).
>   - Freeze these hypotheses, the local factor and the region class exactly.
>   - This branch does not use AC.4: Kai §2.3 says the Leng–Sah–Sawhney and Leng bounds "eliminate the need of the so-called pseudorandom majorant".
>   - PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 item /35 (route 3) lands here.
>
> **Inputs.** `AdditiveCombinatorics:AC.4` (ℤ linear-equations branch), `AdditiveCombinatorics:AC.3`, `SieveMethodsAndPrimePatterns:SV.2`, `AnalyticNumberTheory:AN.3`, `AnalyticNumberTheory:AN.4`, `FiniteFieldsAndCharacterSums:FF.2`
>
> **Supplier requests.**
> - **AC.3.**
>   - Complex Gowers norms on boxes (Kai Definition 2.1, pp. 6–7).
>   - The quantitative inverse theorem on ℤ^n (Kai Theorem A.1, from LSS Theorem 1.2 by Kronecker substitution) and its converse (Proposition A.2).
>   - Leng's quantitative Leibman theorem on ℤ^n (Theorem A.3) with the factorization results of Appendix A.
>   - The generalized von Neumann theorem on boxes (Theorem D.3).
>   - For the Möbius branch: Q-rational Mal'cev bases and the equidistribution theory of polynomial orbits used there.
> - **AN.4 (Kai).**
>   - At most one exceptional zero for Hecke L-functions of conductor norm < Q (Kai Theorem 6.1, p. 22).
>   - The Siegel-corrected Mitsui theorem (Kai Proposition 6.4, p. 23): the sum of Λ^a_K − Λ^a_{Siegel,Q} over a convex body in a residue class mod qa, for N(q) < exp((log N)^{1/200}), is ≪_K N^n exp(−(log N)^{1/201}). Kai proves it from Kai, arXiv:2209.11816 (cited as Theorem 5.1; Theorem 3.1.1 in v3).
>   - Mertens' theorem for number fields (Proposition B.1, p. 64).
> - **FF.2 (Kai).** The Weil bound for a real multiplicative character of a finite field evaluated at a polynomial that is not a square. This is the input of Kai Lemma 7.1 (pp. 28–29), which cites Iwaniec–Kowalski Theorem 11.23 with n = 1.
> - **SV.2 (both branches).**
>   - Vaughan's identity and the Type I/II dichotomy over ℤ, in Green–Tao's form (Proposition 3.1 of arXiv:0807.1736v4).
>   - The same over the monoid of nonzero ideals of O_K (Kai §8, Definitions 8.2–8.3).
>   - The estimates of the Type I/II sums against nilsequences stay here (Green–Tao §3; Kai §§10–11).
>   - If SV.2 does not widen to ideals, this stage owns the ideal form.
> - **AN.3 (Möbius branch).**
>   - Green–Tao Proposition A.1 for every Dirichlet character mod q, with its ineffective A-dependence (they cite Iwaniec–Kowalski Proposition 5.29), and Proposition A.2.
>   - The Λ form of Siegel–Walfisz, only if Theorem 7.1 is exported.
>
> **Acceptance.** Admissibility and finite complexity are checked at the use site; polynomial and unrestricted prime patterns remain separately scoped targets. Each branch names its source theorem and closes its own inputs; the Möbius branch records its ineffectivity.
>
> **Source route.** New primary-proof acquisition: Green-Tao Mobius-nilsequence orthogonality and Linear equations in primes, with exact complexity/correlation hypotheses; Green-Tao 2008 prime progressions alone is insufficient. Kai branch: Kai, arXiv:2306.16983v5, with Kai, arXiv:2209.11816v3 for Proposition 6.4.

**Maintainer edit: `data/atlas.json`.**
- Add `AdditiveCombinatorics:AC.3`, `AnalyticNumberTheory:AN.4` and `FiniteFieldsAndCharacterSums:FF.2` to AC.5's `requires` (the edges for /7 are listed there).
- Add AC.5 to each of their `consumers`.
- Add the three `stageEdges`.
- Cycle check: acyclic for each of AC.3 → AC.5, AN.4 → AC.5 and FF.2 → AC.5 (no path from AC.5 back to AC.3, AN.4 or FF.2).

**Made in this pull request: the paper extraction.**
- **Item /35 `note`:** now lists what Kai's proof consumes. The list is the one above, and it notes that §2.3 removes the majorant, so AC.4 is not an input of this theorem.
- **Route 3 `reason`:** now says that AC.5 on main covers only ℤ with AC.4 as its only input, that this fix adds the Kai branch with its four suppliers, and that the route lands in that branch.

### Not done, and why
- Kai's §§3–5 and 9–11 (norm-length compatible bases, the recollection of nilsequences, the Cramér model, and the comparison of Λ_K with its models through the Type I and Type II cases) are the branch's own work and are not decomposed here.
- The analytic proofs in Kai and in Kai's Mitsui notes were not re-verified.
- The ℤ linear-equations branch keeps AC.4 as the verifier requires; Green–Tao's *Linear equations in primes* was not re-read.

## /6 (medium, error): the extraction now says that the Kai route consumes Siegel-corrected Mitsui

### What the verifier corrected
- The item /33 note and the Part II brief hid a necessary input of Kai's proof. Kai v5 §2.4 and Proposition 6.4 (pp. 23–24) use Mitsui's theorem with a possible Siegel zero, citing Kai 2209.11816 Theorem 5.1.
- The note must separate the application-level replacement of item /33 by Kai from Kai's own analytic closure.
- The supplier request must state Kai's exact Siegel-corrected theorem and its modulus range; item /33's schematic statement is not that theorem.
- The two application routes stay separate.
- Nothing may claim that closing the old G1 supplies the stronger input.

### State on main (701638e0)
- **Item /33 `note`, last sentence:** "The Kai route to item 34 does not consume item 33."
- **Route 5 (part-ii) `brief`:** "Mitsui’s AN.4 route remains separate and requires G1; it is not needed if the exact Kai proof is used."
- **G1 `statement`, last sentence:** "Route 1 can instead use the precise Kai theorem."

### Fix (made in this pull request; this session wrote the extraction)
Five changes to the extraction:
- **Item /33 note.**
  - Kai replaces this item only at the application level.
  - It states Kai v5 Proposition 6.4 (p. 23; proof pp. 24–28), with its setting:
    - a nonzero fractional ideal a and a convex body Ω ⊂ (K⊗ℝ)_{≤N·N(a)^{1/n}};
    - an ideal q with N(q) < exp((log N)^{1/200}) and a class mod qa;
    - the sum of Λ^a_K − Λ^a_{Siegel,Q} is O_K(N^n exp(−(log N)^{1/201})), where the Siegel model (Definition 6.2) carries the possible exceptional zero of Theorem 6.1.
  - It names the source, Kai, arXiv:2209.11816. Kai v5 cites it as Theorem 5.1; v3 (8 September 2026) states it as Theorem 3.1.1, for N(q) < exp(√(log N)/O_K(1)).
  - It places this input in AC.5's Kai branch, with supplier AN.4. It is not G1, and closing G1 would not supply it.
- **Route 5 brief.** The sentence becomes: "Mitsui’s AN.4 route (item 33) remains a separate application-level proof of Proposition 3.1 and requires G1. The exact Kai theorem avoids item 33 at the application level, but not Mitsui's theorem: Kai's own proof consumes the Siegel-corrected Mitsui theorem (Kai v5 Proposition 6.4), which sits inside AC.5's closure with supplier AN.4."
- **G1.** It now adds that the Kai route does not discharge Mitsui's theorem.
- **New prerequisite.** Kai, *Notes on Mitsui's Prime Number Theorem with Siegel zeros*, arXiv:2209.11816.
- **Provenance.** A `readSections` entry records this reading.

The AN.4 request appears in the AC.5 text under /5.

### Not done, and why
- Route 2 (item /33 to AN.4) stays "revise"; G1 is unchanged in substance.
- Items, statuses, routes and gap ids are not changed.
- Whether v3's Theorem 3.1.1 is word for word the Theorem 5.1 that Kai v5 cites was not checked, because the older version was not read. The request pins v3.

## /7 (medium, missing): AC.5's Möbius branch records its SV.2 and AN.3 inputs

### What the verifier corrected
- Green–Tao 0807.1736v4 §3 (p. 6) names the Type I/II method in Vaughan's form, and the reduction also uses Proposition A.2. §7 (p. 19) uses Siegel–Walfisz for Λ, and Theorem 1.1 (p. 2) records ineffectivity from Siegel zeros.
- RS-07 gives the bilinear decompositions to SV.2 and the uniform progression applications to AN.3, but AC.5 has no link to either.
- What to do:
  - add exact requests and edges for the forms actually consumed, including the Möbius progression estimate and its constants;
  - do not treat the p. 19 Λ application as the proof of the Möbius theorem.

### State on main (701638e0)
- **AC.5 inputs:** AC.4 only (README line 79; atlas `requires`).
- **RS-07 owners:** "Large-sieve inequalities and Vaughan/Type I-II decompositions" → SV.2.
- **AN.3's scope:** AN.3's README text still has "arithmetic-progression applications only within their proved ranges". FIX-RT-RS-07 withheld the AN.3 narrowing in the research copy; the promoted copy's narrowing keeps "source-scoped short-interval/uniform progression applications".

### Fix
The Möbius bullet and the SV.2 and AN.3 requests in the AC.5 text under /5 are this finding's contract:
- Proposition 3.1 (Type I/II);
- Propositions A.1–A.2, with q^{1/2} log^{−A} N and q log^{−A} N, ineffective;
- q ≪ log^{O(1)} N;
- the Λ form only for Theorem 7.1.

**Maintainer edit: `data/atlas.json`.**
- Add `SieveMethodsAndPrimePatterns:SV.2` and `AnalyticNumberTheory:AN.3` to AC.5's `requires`.
- Add AC.5 to their `consumers`.
- Add the `stageEdges` SV.2 → AC.5 and AN.3 → AC.5. Cycle check: both acyclic (no path from AC.5 to SV.2 or AN.3).

### Not done, and why
- Green–Tao's *Quadratic uniformity of the Möbius function*, the source of Proposition 3.1, and Iwaniec–Kowalski Proposition 5.29 were not read. The requests name them as the locators Green–Tao give.

## /8 (high, error): AC.4 selects the decomposed Green–Tao 2008 route; Conlon–Fox–Zhao becomes an optional branch

### What the verifier corrected
- AC.4 asks for dense-model and relative-counting theorems, but its decomposition follows GT2008's dual-function and Koopman–von Neumann route with the correlation condition. The requested theorems are not decomposed.
- CFZ 1305.5440v2 p. 2, CFZ 1403.2957v4 §8 and footnote 9, and Green–Tao's *Linear equations in primes* Appendix D justify a lighter optional route.
- What to do:
  - choose one route explicitly, or separate the two branches and close every promised target;
  - dense-model language does not force CFZ, and GT2008 is not false;
  - remove analytic dependencies only from a branch whose complete replacement proof no longer uses them.

### State on main (701638e0)
- **README AC.4:**
  - line 65: "Construct pseudorandom majorants, dense-model and relative counting theorems, then implement the Green-Tao prime-progression proof."
  - line 69: "Every linear-forms/correlation condition is proved for the chosen majorant; sparse primes do not directly satisfy a positive-density hypothesis."
  - line 71: "Selected sources: GREEN-TAO, TAO-VU. …"
- **Decomposition:** its AC.4 nodes are GT2008 Lemma 5.2, Proposition 5.3, Definitions 3.1–3.3, Theorem 3.5, Proposition 8.1, the W-trick majorant and the endgame.

### Fix (maintainer edits: README AC.4)
1. **Line 65.** Replace it with:
   > Along the selected route, Green–Tao 2008 (arXiv:math/0404188v6; decomposed in `data/decompositions/AdditiveCombinatorics.json`):
   > 1. construct the W-tricked Goldston–Yıldırım truncated-divisor-sum majorant;
   > 2. prove it k-pseudorandom (Definition 3.3);
   > 3. prove the relative Szemerédi theorem (Theorem 3.5) from the generalised von Neumann theorem (Proposition 5.3) and the Koopman–von Neumann structure theorem (Proposition 8.1);
   > 4. deduce the Green–Tao theorem (Theorem 1.1).
   >
   > Dense-model and relative-counting theorems are not targets of this route.
   >
   > **Alternative branch, not a target until separately decomposed.** Conlon–Fox–Zhao, arXiv:1305.5440v2, Theorem 1.2 (p. 2), with the exposition arXiv:1403.2957v4.
   > - It proves the relative Szemerédi theorem under the k-linear forms condition alone, without the correlation condition.
   > - It uses a dense model theorem (exposition §5) and a relative counting lemma (§6).
   > - The linear-forms estimate for its smooth-cutoff majorant (Propositions 8.3–8.4, proved in §9) uses ζ(s) = (s−1)^{−1} + O(1) for Re s > 1 (pp. 22–23).
   > - Footnote 9 (p. 17) replaces Dirichlet's theorem and the prime number theorem by a Chebyshev-type lower bound and a pigeonholed residue class.
   > - Its analytic obligations may be dropped only on that branch, once it is completely decomposed.
2. **Line 69.** Replace it with: "The (k·2^{k−1}, 3k−4, k)-linear forms condition and the 2^{k−1}-correlation condition (Green–Tao 2008, Definitions 3.1–3.3) are proved for the chosen majorant; sparse primes do not directly satisfy a positive-density hypothesis."
3. **Line 71.** Replace it with: "**Source route.** Selected source: Green–Tao, arXiv:math/0404188v6. Its unread interior and analytic inputs are the decomposition's gaps: Section 10 and Appendix A beyond Lemma A.3; Titchmarsh Chapters 3 and V; Dirichlet's theorem for the growing modulus W(N); the maximal order of d(n)."

### Not done, and why
- No CFZ nodes are added, and no analytic edge is removed. AN.2 → AC.4 and SV.1 → AC.4 stay, because the selected route uses them.
- GT's *Linear equations in primes* Appendix D was not re-read.
- AUDIT-16's AC.4 target "Dense model theorem, relative counting and relative Szemeredi theorem" keeps its absent verdict.

## /9 (medium, error): the SV.3 → AC.4 edge is deleted

### What the verifier corrected
- The selected GT majorant/transference route does not consume Bombieri–Vinogradov; RS-07 kept SV.3 → AC.4 without a consuming theorem.
- What to do:
  - remove that edge;
  - align the README and the imported restructuring with the actual route;
  - keep the justified SV.1 and AN inputs.
- The finding's universal and zero-hit claims are not needed.

### State on main (701638e0)
- **README AC.4, line 67:** "**Inputs.** `AdditiveCombinatorics:AC.3`, `SieveMethodsAndPrimePatterns:SV.3`".
- **Atlas:** AC.4 `requires` includes SV.3; there is a `stageEdges` SV.3 → AC.4.
- **RS-07 (both copies), link:** SV.3 → AC.4, "Retain the recorded prime-distribution input, without pretending BV proves the majorant linear-forms conditions."
- **Decomposition gap:** "The atlas edge SieveMethodsAndPrimePatterns:SV.3 -> AdditiveCombinatorics:AC.4 does not match what the source consumes".

### Fix (maintainer edits)
1. **README line 67.** Replace it with "**Inputs.** `AdditiveCombinatorics:AC.3`, `AnalyticNumberTheory:AN.2`, `SieveMethodsAndPrimePatterns:SV.1`". AN.2 and SV.1 are RS-07's accepted links.
2. **`data/atlas.json`.** Remove `SieveMethodsAndPrimePatterns:SV.3` from AC.4's `requires` and AC.4 from SV.3's `consumers`, and delete the `stageEdges` record SV.3 → AC.4. `scripts/restructure.py` cannot delete an edge, so this and step 3 go together.
3. **RS-07.** In `research/blueprint/restructure/RS-07.result.json` and `data/restructure/RS-07.result.json`, delete that link.
4. **Decomposition.** Append to that gap's `detail`: " Resolved by RT-AREA-combinatorics/9: the edge is deleted from data/atlas.json and from RS-07's links."

### Not done, and why
- The roadmap-level edge SieveMethodsAndPrimePatterns → AdditiveCombinatorics stays: SV.1 → AC.4 and the new SV.2 → AC.5 keep it.

## /10 (medium, other): rejected; no change
The verifier held that newer PFR results and the external PFR project do not make AC.1's source-scoped Freiman target obsolete. They remain optional prior art.

## /11 (medium, other): rejected; no change
The verifier held that AC.2's acceptance quantifies length and density without promising the best known bound, and that the stronger bounds are optional targets, not a demonstrated closure failure.

## /12 (medium, missing): AC.1 states its Bohr/progression contract and takes Minkowski II from GN.1

### What the verifier corrected
- On the Tao–Vu route, Proposition 4.23 (pp. 168–169) uses Minkowski's second theorem. GN.1 owns that theorem, the pin lacks it, and no GN.1 → AC.1 edge exists.
- The cyclic bound is (ρ/d)^d N for 0 < ρ < 1/2 with the phase-distance convention, not a rank-free (ρ/2π)^d|G|.
- A general group needs the coset-progression Lemma 4.22, with its subgroup and its own bound.

### State on main (701638e0)
- **README AC.1:**
  - line 29: "… define Bohr sets, regularity and density increments with quantitative losses."
  - line 31: "**Inputs.** `AdditiveCombinatorics:AC.0`"
- **Atlas:** no GN.1 → AC.1 edge. GN.1's text is "Prove Blichfeldt and Minkowski first/second theorems with measurable convex symmetric bodies …".
- **AUDIT-16:** "No Bohr sets".

### Fix
**Maintainer edit: README AC.1.** After line 29 insert:
> **Bohr sets and progressions (Tao–Vu route).**
> - **Definition.** Let Z be a finite additive group with the pairing ξ·x ∈ ℝ/ℤ (on ℤ_N, ξ·x = ξx/N), S ⊆ Ẑ a set of frequencies and ρ > 0. Then Bohr(S, ρ) := {x ∈ Z : sup_{ξ∈S} ‖ξ·x‖_{ℝ/ℤ} < ρ}, of rank |S| (Tao–Vu, *Additive Combinatorics*, Definition 4.17, p. 166).
> - **Exports,** with d = |S| and 0 < ρ < 1/2:
>   - **Cyclic groups** (Proposition 4.23, pp. 168–169): for Z = ℤ_N, Bohr(S, ρ) contains a symmetric proper progression of rank d and cardinality at least (ρ/d)^d N.
>   - **Finite abelian groups** (Lemma 4.22, p. 168): there is a proper symmetric coset progression P + H of rank 0 ≤ d′ ≤ d with H = S^⊥ and Bohr(S, d′^{−2d′}ρ) ⊆ P + H ⊆ Bohr(S, ρ); hence P_Z(P + H) ≥ ρ^d d^{−4d²}.
> - **Inputs of the proofs.**
>   - The cyclic proof applies Minkowski's second theorem (Theorem 3.30, p. 135) to a cube and the lattice ℤ·(ξ/N) + ℤ^d. It is requested from GN.1.
>   - The general proof uses the discrete John theorem (Lemma 3.36, pp. 141–142), which needs John's theorem and Corollary 3.35. John's theorem has no identified supplier yet.

Line 31: replace it with "**Inputs.** `AdditiveCombinatorics:AC.0`, `GeometryOfNumbersAndQuadraticArithmetic:GN.1`".

**Request to GN.1.** Minkowski's second theorem in the form of Tao–Vu Theorem 3.30:
- **Setting:** a full-rank lattice Λ ⊂ ℝ^d and a symmetric convex body B with successive minima λ_1 ≤ ⋯ ≤ λ_d.
- **Conclusion:**
  - linearly independent v_1, …, v_d ∈ Λ with v_j on the boundary of λ_j·B;
  - 2^d|Λ/(ℤ^d·v)|/d! ≤ λ_1⋯λ_d mes(B)/mes(ℝ^d/Λ) ≤ 2^d.

**Maintainer edit: `data/atlas.json`.** Add GN.1 to AC.1's `requires`, AC.1 to GN.1's `consumers`, and the `stageEdges` record GN.1 → AC.1. Cycle check: acyclic (no path AC.1 → GN.1).

### Not done, and why
- John's theorem and the Mahler-basis corollary have no owner here. They stay open inputs of the general-group form.
- Freiman's theorem itself is not decomposed.

## /13 (medium, duplicate): one nilmanifold carrier, consumed by AC.3 and ALS.2

### What the verifier corrected
- AC.3 and ALS.2 both need a nilmanifold carrier. The accepted LieGroups link map gives global nilpotent exp/BCH and smooth homogeneous quotients to a LieGroups Part II, and leaves rational Mal'cev data, filtrations and complexity with AC.3.
- What to do:
  - keep that allocation;
  - specify the unfiltered quotient/lattice carrier once, for both consumers;
  - do not make ALS.2 wait for AC.3's inverse theorem;
  - do not call local BCH sufficient;
  - add supplier edges only for exact imported constructions.

### State on main (701638e0)
- **README AC.3, line 53:** "… inverse theorems in their proved settings and nilmanifold/nilsequence complexity."
- **ALS README line 21 (ALS.2):** "Prove boundary strata are fibrations with nilmanifold fibers over Levi arithmetic quotients; …"
- **Link map `data/links/tauceti_TauCetiRoadmap_RepresentationTheory_LieGroups.json`:** its overlaps propose "Lie groups and the Lie algebra correspondence, Part II". That Part II would take the global BCH group law and exponential diffeomorphism, and the homogeneous quotient G/H for closed H. The Part II is not in the atlas.
- **AC.3 inputs:** AC.2 only, so ALS.2 cannot consume AC.3 without waiting for Szemerédi.

### Fix (maintainer edits)
1. **README.** Insert before `### AC.3`:
   > ### AC.3a Nilmanifold carrier
   >
   > **Construct and export.** Define a nilmanifold once: G a connected, simply connected nilpotent real Lie group and Γ ≤ G a discrete cocompact subgroup, as in Green–Tao–Ziegler v5 §1 (p. 3) and Kai v5 §2.3 (p. 8). Export:
   > - the compact quotient G/Γ with its G-action and G-invariant probability measure;
   > - the comparison with the left quotient Γ\G through g ↦ g^{−1}.
   >
   > Mal'cev's rational criterion for the existence of lattices, rational Mal'cev bases, filtrations G_•, polynomial sequences, nilsequences and quantitative complexity are not part of the carrier; they stay in AC.3, as the accepted LieGroups link map allocates. Cocompactness of the arithmetic subgroups that ALS.2 uses is ALS.2's own input.
   >
   > **Inputs.** No atlas stage yet. Two requests go to "Lie groups and the Lie algebra correspondence, Part II", which the accepted link map proposes but the atlas does not yet contain:
   > 1. the finite BCH polynomial of a finite-dimensional real nilpotent Lie algebra, its global group law and the exponential diffeomorphism of the connected simply connected nilpotent group;
   > 2. the smooth quotient G/H for closed H, from the upstream closed-subgroup theorem.
   >
   > Until that Part II exists these are open prerequisites. Local BCH (LieGroups Layer 3) alone is not sufficient.
   >
   > **Acceptance.** The two quotient conventions are compared, not identified silently. The carrier depends on neither AC.0–AC.2 nor any inverse theorem.
   >
   > **Execution state:** specification; source-to-Lean decomposition and theorem-level dependency verification required.
2. **README AC.3.**
   - Line 53: replace "nilmanifold/nilsequence complexity" with "filtered nilmanifolds on the carrier of AC.3a, rational Mal'cev bases, polynomial sequences, nilsequences and their quantitative complexity".
   - Line 55: replace it with "**Inputs.** `AdditiveCombinatorics:AC.2`, `AdditiveCombinatorics:AC.3a`".
3. **ALS README line 21.** Replace "Prove boundary strata are fibrations with nilmanifold fibers over Levi arithmetic quotients;" with "Prove boundary strata are fibrations with nilmanifold fibers over Levi arithmetic quotients, using the nilmanifold carrier of AdditiveCombinatorics:AC.3a (it does not wait for AC.3's filtrations or inverse theorem);".
4. **`data/atlas.json`.**
   - Add the stage record `{"id": "AdditiveCombinatorics:AC.3a", "owner": "AdditiveCombinatorics", "key": "AC.3a", "title": "Nilmanifold carrier", "requires": [], "consumers": ["AdditiveCombinatorics:AC.3", "ArithmeticLocallySymmetricSpaces:ALS.2"], "sourcePath": "content/campaign/AdditiveCombinatorics/README.md", "status": "needs_source_decomposition", "origin": "campaign", "parentStageId": null, "isLeaf": true}`, with the remaining fields and line numbers as for the other AC stages.
   - Add it to the roadmap's `stages`.
   - Add AC.3a to the `requires` of AC.3 and of ALS.2.
   - Add the `stageEdges` AC.3a → AC.3 and AC.3a → ALS.2.
   - The new stage has no inputs, so neither edge can close a cycle.

### Not done, and why
- **No edge from LieGroups Layers 0, 2, 3 or 5.** The verifier forbids adding them mechanically. Each reaches the carrier only through the Part II units, which the link map allocates.
- **No Part II is created here.** Creating a Part II is not this job.
- **AC.3 keeps AC.2 as an input.** The verifier rejected /1's re-ordering.

## /14 (medium, duplicate): AC.0 owns one finite Fourier convention; ER.4 specializes it

### What the verifier corrected
- RS-03 gives the general finite-abelian Fourier interface to AC.0, while ER.4 separately plans a finite transform on C-torsion with no reuse contract; the specialization and the normalization must be reconciled.
- **Already built at the pins:**
  - AddChar's basis and orthogonality, and ZMod.dft;
  - Tau Ceti CharacterOrthogonality.lean:104;
  - a Haar-normalized Parseval ingredient: PeterWeyl.lean:599 with Compact/Finite.lean:212.
- Add the missing audit citation and the comparison obligations, consuming the upstream coding and modular-form specializations. Rebuilding the generic character theory is not allowed, and neither is a whole-stage coding prerequisite.

### State on main (701638e0)
- **README AC.0, line 17:** "Build sumsets, additive energy, convolution and Fourier analysis on finite abelian groups; …"
- **EllipticRegulators README line 65 (ER.4):** "Establish the finite Fourier transform on C-torsion and the odd-function identities of Lecture 10."
- **Same README line 87 (under ER.5):** "The finite Fourier transform is normalized by **1/C**, with kernel exp(2πi(−aℓ+bk)/C) at x=a+bτ and dual argument k+ℓτ (11.1.1); it is not the ordinary 1/C² average."
- **RS-03:** links AC.0 → FF.1 and AC.0 → FF.2 only.
- **AUDIT-16, AC.0:** the note for the Fourier target does not cite Tau Ceti's column orthogonality.
- **Read at the pins:**
  - `AddChar.complexBasis` (Mathlib/Analysis/Fourier/FiniteAbelian/PontryaginDuality.lean:125);
  - `AddChar.sum_apply_eq_ite` (:188: Σ_ψ ψ a = card α if a = 0, else 0);
  - `ZMod.dft` (Analysis/Fourier/ZMod.lean:88, counting measure, inverse with 1/N) and `ZMod.dft_dft` (:177);
  - `CommGroup.sum_monoidHom_apply_eq_ite` (TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104: Σ_{χ : G →* Mˣ} χ g = Nat.card G if g = 1, else 0, for a finite commutative group with enough roots of unity in the domain M);
  - `hasSum_norm_sq_peterWeylCoeff` (RepresentationTheory/Compact/PeterWeyl.lean:599);
  - `haarProb_eq_smul_count` (Compact/Finite.lean:212: `haarProb G = (Nat.card G)⁻¹ • Measure.count` on a finite discrete group).

### Fix
1. **Made in this pull request: `RS-03.result.json`.**
   - A new link AC.0 → EllipticRegulators:ER.4. Its reason: ER.4 keeps the C-torsion identification, Lecture 11's 1/C normalization and the odd-function identities, and imports inversion and Parseval from AC.0.
   - `EllipticRegulators:ER.4` is added to the `formerly` list of the owner entry "Missing arbitrary finite-abelian Fourier normalization/comparison interface".
   - When promoted, `scripts/restructure.py` adds the edge. Cycle check AC.0 → ER.4: acyclic (no path ER.4 → AC.0).
   - RS-03 gets no ER.4 layer entry. EllipticRegulators is not an RS-03 member, and RS-18 touches ER.4 only through links, so ER.4's narrowing is the README edit in step 3.
2. **Maintainer edit: README AC.0.** After line 17 insert:
   > **Finite Fourier interface (owner under RS-03).** For a finite abelian group G with dual Ĝ = AddChar G ℂ, fix one convention: f̂(χ) = E_{x∈G} f(x)\overline{χ(x)} and f∗g(x) = E_{y∈G} f(y)g(x − y).
   > - **Prove** inversion f = Σ_χ f̂(χ)χ, Parseval E_x|f(x)|² = Σ_χ|f̂(χ)|² and (f∗g)^ = f̂ĝ, with scalar comparison lemmas for the counting-measure normalization and the unitary normalization |G|^{−1/2}.
   > - **State compatibility with, and do not rebuild:**
   >   - Mathlib's `ZMod.dft` (Analysis/Fourier/ZMod.lean:88; `dft_dft` :177), `AddChar.complexBasis` and `AddChar.sum_apply_eq_ite` (FiniteAbelian/PontryaginDuality.lean:125, 188);
   >   - Tau Ceti's `CommGroup.sum_monoidHom_apply_eq_ite` (GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104);
   >   - the Haar-normalized Parseval `hasSum_norm_sq_peterWeylCoeff` (RepresentationTheory/Compact/PeterWeyl.lean:599) on a finite discrete group, where `haarProb_eq_smul_count` (Compact/Finite.lean:212) identifies `haarProb` with the normalized counting measure.
   > - **Upstream specializations.** The finite Fourier lemma of AlgebraicCodingTheory Layer 3 (a linear subspace and its Euclidean dual) and the finite Fourier inversion of ModularForms Layer 0 are upstream specializations.
   >   - This stage states their comparison with the interface once they exist.
   >   - It re-proves neither, and neither is a prerequisite of this stage.
   > - FF.1, FF.2 and EllipticRegulators:ER.4 consume this interface.
3. **Maintainer edit: EllipticRegulators README line 65.** Replace the sentence with:
   > Specialize the finite-abelian Fourier interface of AdditiveCombinatorics:AC.0 to the C-torsion, identified with its dual by the kernel exp(2πi(−aℓ+bk)/C) at x = a+bτ and dual argument k+ℓτ recorded under ER.5 ((11.1.1)). The factor 1/C there is AC.0's unitary normalization on a group of order C², not the averaging 1/C². Import inversion and Parseval from AC.0; prove here the C-torsion identification and the odd-function identities of Lecture 10.
4. **Maintainer edit: `data/library-coverage.json`, AUDIT-16 AC.0.** Append to the note of the target "Convolution and Fourier analysis on finite abelian groups …": " Tau Ceti also has column orthogonality for the characters of a finite commutative group (CommGroup.sum_monoidHom_apply_eq_ite, TauCeti/GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104)." The verdict stays "partly built".

### Not done, and why
- **No evidence entry.** The target is partial, and the audit lists only exact or more-general evidence.
- **No coding or modular-forms edge.** The verifier forbids a whole-stage coding prerequisite.
- **Bloch's Lecture 10 was not read.** The ER.4 wording relies only on the normalization already recorded in that README.

## /15 (low, error): AC.0 loses its spurious and retired inputs; the snapshot summary reaches AC.5

### What the verifier corrected
- CA.2's recurrence and generating-function targets supply no theorem that AC.0 uses.
- LI.2 is still present despite the retirement register.
- The summary stops at AC.3.
- What to do:
  - remove both inputs and update the summary;
  - record the pinned character/energy imports and the missing comparison suppliers;
  - add no blanket CompactGroups prerequisite unless a particular comparison is selected.

### State on main (701638e0)
- **README line 19:** "**Inputs.** `ClassicalArithmeticCompletion:CA.2`, `FoundationsAndLibraryIntegration:LI.2`".
- **`data/atlas.json`:**
  - AC.0 `requires` is both of these; `stageEdges` CA.2 → AC.0 and LI.2 → AC.0 exist.
  - `edges` has ClassicalArithmeticCompletion → AdditiveCombinatorics and FoundationsAndLibraryIntegration → AdditiveCombinatorics (`stage_supported`).
  - The roadmap `prerequisites` are ["ClassicalArithmeticCompletion", "FoundationsAndLibraryIntegration", "SieveMethodsAndPrimePatterns"].
  - The roadmap `summary` ends "Stages cover Sumsets and energy; Structure and randomness; Progressions and removal; Gowers norms and nilsequences."
- **Displayed summary.** The build replaces the snapshot summary with `data/roadmap-summaries.json`, whose entry already mentions transference and linear patterns; only the snapshot's text is stale.
- **Retirement.** LI.2 → AC.0 is already dropped by the retirement at build time.

### Fix (maintainer edits)
1. **README line 19.** Replace it with:
   > **Inputs.** No atlas stage. Imports at the pins (AUDIT-16), each with its `@[to_additive]` version:
   > - pointwise sumsets `Finset.mul`/`Finset.npow` (Algebra/Group/Pointwise/Finset/Basic.lean:323, 703);
   > - `Finset.mulEnergy` and `Finset.le_card_mul_mul_mulEnergy` (additive `le_card_add_mul_addEnergy`; Combinatorics/Additive/Energy.lean:58, 154);
   > - `Finset.pluennecke_ruzsa_inequality_pow_div_pow_mul` (PluenneckeRuzsa.lean:236), `Finset.ruzsa_triangle_inequality_div_div_div` (:54), `Finset.ruzsa_covering_mul` (RuzsaCovering.lean:32) and `Finset.small_pow_of_small_tripling` (SmallTripling.lean:177);
   > - the character results named in the Fourier paragraph.
   >
   > The Haar comparison uses built Tau Ceti declarations and adds no CompactGroups stage edge. The coding and modular-form comparisons are upstream specializations, not prerequisites.
2. **`data/atlas.json`.**
   - Set AC.0 `requires` to [].
   - Remove AC.0 from the `consumers` of CA.2 and LI.2.
   - Delete the two `stageEdges` and the two roadmap-level `edges` above. `refresh_roadmap_links` keeps existing `edges` entries, so these must be deleted by hand.
   - Set the roadmap `prerequisites` to what the snapshot's stage edges give after /5, /7, /9 and /12: AnalyticNumberTheory, FiniteFieldsAndCharacterSums, GeometryOfNumbersAndQuadraticArithmetic and SieveMethodsAndPrimePatterns. The build recomputes these, and the `consumers`, from the stage edges.
   - Replace the summary's last sentence with "Stages cover Sumsets and energy; Structure and randomness; Progressions and removal; Nilmanifold carrier; Gowers norms and nilsequences; Transference to primes; Linear patterns and multiplicative orthogonality."

### Not done, and why
- No CompactGroups edge is added, as the verifier requires.

## /16 (low, error): RS-03 cites AUDIT-16, not AUDIT-06

### What the verifier corrected
- Replace the wrong audit identifier in the canonical restructuring and in its generated mirror.
- Keep the declaration-level imports and the current pin.
- This corrects provenance and does not change the partial Fourier verdict.

### State on main (701638e0)
- `RS-03.result.json` line 42 (`layers["AdditiveCombinatorics:AC.0"].suppliedBy`) and line 596 (`owners[…].owner`) both read "UPSTREAM:Mathlib audited cyclic Fourier, additive energy and Plunnecke-Ruzsa baseline (AUDIT-06; canonical audit pins)".
- The promoted mirror has the same text.
- AUDIT-16 is the job recorded on AC.0 in `data/library-coverage.json`.

### Fix
- **Made in this pull request.** Both strings in `research/blueprint/restructure/RS-03.result.json` now read "(AUDIT-16; canonical audit pins)". The mirror `data/restructure/RS-03.result.json` follows when it is promoted.
- **Maintainer edit.** In `research/blueprint/restructure/RS-03.md`, line 32, replace "particularly AUDIT-06, AUDIT-17 and AUDIT-18" with "particularly AUDIT-16, AUDIT-17 and AUDIT-18".

### Not done, and why
- The supplier string does not list the declarations: the audit record holds them, and the verifier asks to keep the imports as they are.

## /17 (low, error): the Szemerédi set form binds prime N and a nonzero difference

### What the verifier corrected
- The set form needs a nonzero difference or distinct terms.
- The hypotheses already mention the prime convention, but the exported statement must bind it.
- Require N prime, sufficiently large and in particular N ≥ k, with r ≠ 0, so that the k terms are distinct.
- The existing r = 0 acceptance check does not repair the set statement.

### State on main (701638e0)
- **Decomposition node `AdditiveCombinatorics:AC.2/szemeredi-set-form-and-functional-form`, `statement`:** "(Set form, Proposition 2.1) For every real delta > 0 and integer k >= 3 there is a minimal N_0(delta,k) < infinity such that whenever N >= N_0(delta,k) and A is a subset of Z_N := Z/NZ of cardinality at least delta N, A contains an arithmetic progression of length k. …"
- **`hypotheses[0]`:** "N is a positive integer; throughout the source N is additionally assumed prime …"
- **Source:** GT2008 footnote 1 (p. 3): "We always assume for convenience that N is prime."

### Fix (maintainer edits: `data/decompositions/AdditiveCombinatorics.json`)
1. **`statement`.** Replace the set-form sentence (up to "length k.") with: "(Set form, Proposition 2.1, under the source's standing convention that N is prime, footnote 1 on printed p. 3) For every real delta > 0 and integer k >= 3 there is a minimal N_0(delta,k) < infinity such that whenever N is a prime with N >= max(k, N_0(delta,k)) and A is a subset of Z_N := Z/NZ with |A| >= delta N, there are x, r in Z_N with r != 0 and x + jr in A for 0 <= j <= k-1; since N is prime and N >= k, these k terms are distinct."
2. **`hypotheses[0]`.** Replace it with: "N is prime (the source's standing convention, footnote 1 on printed p. 3, 'We always assume for convenience that N is prime'); the exported set form binds this hypothesis and N >= k rather than leaving them to a side condition".
3. **`acceptance`.** Append: "Degenerate readings are excluded: with r = 0 every nonempty A would qualify, and for composite N a nonzero r of small order repeats terms (N = 2m, r = m, k = 3 gives x, x+m, x). The set form requires N prime, N >= k and r != 0."

### Not done, and why
- No integer-interval form is added, and none is claimed equivalent. The verifier allows either form, and the prime-cyclic form is the one this source states.

## /18 (low, other): the Gowers definition node becomes the complex finite-abelian one, with interval and box comparisons

### What the verifier corrected
- The only decomposed definition is the real prime-cyclic specialization.
- GTZ v5 (1.1), p. 2, defines complex-valued norms on finite abelian groups and the normalized interval version. Kai v5 Definition 2.1 uses complex box norms.
- What to do:
  - define the conjugated cube product in enough generality;
  - keep U^1 as a seminorm;
  - prove the interval and box comparisons;
  - keep GT2008's real formula as a specialization.

### State on main (701638e0)
- **Node `AdditiveCombinatorics:AC.3/gowers-inner-product-and-uniformity-norm`:**
  - title: "Gowers inner product, its positivity, and the U^d norms on Z_N";
  - hypotheses[0]: "The ambient group is Z_N with N prime; …";
  - hypotheses[1]: "f_omega in L^infinity(Z_N) and real-valued in the source's usage".

### Fix (maintainer edits: `data/decompositions/AdditiveCombinatorics.json`)
1. **`title`.** Replace it with "Gowers inner product and U^d norms on finite abelian groups, with interval and box normalizations".
2. **`statement`.** Replace it with:
   > For a finite abelian group G, d >= 1 and functions f_omega : G -> C (omega in {0,1}^d), <(f_omega)>_{U^d(G)} := E_{x in G, h in G^d} prod_omega C^{|omega|} f_omega(x + omega.h), where C is complex conjugation and |omega| = omega_1 + ... + omega_d, and ||f||_{U^d(G)} := <(f)>_{U^d(G)}^{1/2^d}. Equivalently ||f||_{U^d(G)} = (E_{x,h_1,...,h_d} Delta_{h_1}...Delta_{h_d} f(x))^{1/2^d} with Delta_h f(x) = f(x+h) conj(f(x)) (Green-Tao-Ziegler (1.1)). U^1 is only a seminorm (||f||_{U^1} = |E f|); U^d is a norm for d >= 2.
   > - Interval normalization: for f : [N] -> C, ||f||_{U^d[N]} := ||f~||_{U^d(Z/N~Z)} / ||1_[N]||_{U^d(Z/N~Z)} for any N~ >= 2^d N, where f~ extends f by zero; this is independent of N~ (GTZ p. 2; Leng-Sah-Sawhney Definition 1.1 and remark).
   > - Box normalization: for a finite subset A of an abelian group Z, ||f||_{U^{s+1}(A)}^{2^{s+1}} := E over (x, h) in Z x Z^{s+1} with x + omega.h in A for all omega of prod_omega C^{|omega|} f(x + omega.h) (Kai v5 Definition 2.1), used for A = [-N,N]^n in Z^n.
   > - The real form of Green-Tao 2008 Definition 5.1 on Z_N, N prime, is the specialization G = Z_N with real f_omega.
3. **`hypotheses[0]` and `hypotheses[1]`.** Replace them with:
   - "G is any finite abelian group; averages use normalized counting measure. The Green-Tao 2008 setting (G = Z_N, N prime) is a specialization."
   - "f_omega : G -> C; the conjugation C^{|omega|} is part of the definition, and real-valued f_omega recover the source's formula".
4. **`acceptance`.** Append:
   - "Check that U^1 is a seminorm and U^d a norm for d >= 2 in the complex setting."
   - "Check that ||f||_{U^d[N]} does not depend on N~ >= 2^d N."
   - "Check the box/interval comparison used by Kai (proof of Theorem A.1, (A.1)): under x -> sum_i (5N)^{i-1} x_i, the ratio of the U^{s+1} norms of f on [-N,N]^n and of its zero extension on [-(5N)^n,(5N)^n] is bounded above and below in terms of n and s."
5. **`sources` of this node.** Add:
   ```json
   {"sourceId": "gtz-v5", "locator": "(1.1) and the definition of ||f||_{U^d[N]}, p. 2", "excerpt": "If G is a finite abelian group, d >= 1 is an integer, and f : G -> C is a function then we define ||f||_{U^d(G)} := (E_{x,h_1,...,h_d in G} Delta_{h_1} ... Delta_{h_d} f(x))^{1/2^d}, (1.1) where Delta_h f is the multiplicative derivative Delta_h f(x) := f(x+h) conj(f(x)) ... It is easy to see that this definition is independent of the choice of N~.", "match": "The complex finite-abelian definition and the interval normalization."},
   {"sourceId": "kai-v5", "locator": "Definition 2.1, pp. 6-7", "excerpt": "Let A be a finite abelian group and f : A -> C be a function. The Gowers U^{s+1}-norm ... where C is the complex conjugate operation ... if A is a finite subset of an abelian group Z ... we define ||f||_{U^{s+1}(A)} ... We will use this norm mainly for A = O_{K,<=N} in O_K.", "match": "The box normalization consumed by AC.5's Kai branch."}
   ```
6. **Top-level `sources`.** Add:
   ```json
   {"id": "gtz-v5", "title": "An inverse theorem for the Gowers U^{s+1}[N]-norm", "authors": "Ben Green, Terence Tao and Tamar Ziegler", "edition": "arXiv:1009.3998v5, 23 April 2026 (116 pp.)", "url": "https://arxiv.org/abs/1009.3998v5", "sha256": "24b5b74b1c4f31986bfc75955f8528e81753efc0c45bd99bc23fee58171a4711", "readSections": ["Section 1, pp. 1-3; p. 72 footnote 7; Appendix A opening, p. 77 (read 2026-09-29 for RT-AREA-combinatorics/4 and /18)"]},
   {"id": "kai-v5", "title": "Linear patterns of prime elements in number fields", "authors": "Wataru Kai", "edition": "arXiv:2306.16983v5, 12 March 2026 (84 pp.)", "url": "https://arxiv.org/abs/2306.16983v5", "sha256": "c5e9e91fd7c698d0296a5412620a4556cf56f39ed964d353e423802c7ab495a7", "readSections": ["Section 2 with Definition 2.1, pp. 6-10; Appendix A.1-A.2, pp. 59-61 (read 2026-09-29 for RT-AREA-combinatorics/5 and /18)"]}
   ```

### Not done, and why
- The Gowers–Cauchy–Schwarz inequality is not re-derived for the complex case: the existing proof steps (5.5)–(5.7) carry over with conjugations, and are to be checked when AC.3 is decomposed.
- No new decomposition links: the node's two links into AC.4 remain valid through the specialization.

## /19 (low, duplicate): rejected; no change
The verifier found that PM.5 promises no second proof of Möbius–nilsequence orthogonality. A thematic overlap is neither a duplicate owner nor a needed consumer edge.

## /20 (low, missing): rejected; no change
The verifier noted that the paper review already rejected route 8 of PAPER-HARPAZ-WITTENBERG-16. The finding is guidance for a resubmission, not a present error in AC.5.

## AlgebraicCodingTheory (/21–/30): conventions

- **Roadmap.** `content/tau-ceti/AlgebraicCodingTheory/README.md` is a snapshot (last rebuilt 16 September, 3d890fef) of the upstream `TauCetiRoadmap/AlgebraicCodingTheory/README.md`. Between the review freeze (f9236b81) and origin/main 701638e0 it did not change, and neither did the coding link map, `data/library-coverage.json`, `data/atlas.json` or the GeometryOfNumbers README. Upstream main (TauCetiRoadmap ca2f063, read 29 September) has the same text apart from one hyperlink on line 7, so every passage quoted below is still there upstream.
- **Quotations** ignore the README's line wrapping. Each old passage occurs exactly once in the snapshot. Line numbers are the snapshot's. The replacements were applied together to a copy of the README; every old passage matched once, and the result reads correctly.
- **Cycle tests** use the atlas as `scripts/build.py` assembles it at 701638e0 (2840 stages, 7792 stage edges). "Acyclic" means the graph has no path back from the target to the source. The 18 edges added in this group were also added together, and the graph stays acyclic (7810 edges).
- **Library claims** are about Mathlib `082e2d3` and Tau Ceti `f790474`; each declaration was read at that pin. Later Tau Ceti and TauCetiRoadmap files are marked **post-pin**. They were read on public GitHub as prior art and never change a pinned verdict.

## /21 (medium, error): Type II codes are defined for every even modulus, with the Construction A iff

### What the verifier corrected
- Harada–Miezaki (arXiv:1205.6947v2, §§2.1 and 2.4) define Type II codes over `Z/(2k)` for **every** positive `k` and state the equivalence with even unimodular Construction A lattices, citing Bannai–Dougherty–Harada–Oura. The roadmap's restriction to `Z/(2^r)` is wrong, and so is Suggested.lean. A post-pin library docstring repeats the error.
- **What to do.** Correct the literature and scope statement. Generalize the named even-modulus predicate and the iff through the layer's existing residue criteria, and keep the two-power result as a special case.
- **The correction to the red team's sentence.** An odd modulus rules out an even Construction A lattice only when there is a coordinate. With no coordinates the lattice is `0`, which is even.

### State on main (701638e0)
Unchanged since the verification.
- **Layer 6, lines 333–335:** "The Type II theorem of Dougherty--Gulliver--Harada is used only for codes over `Z/(2^r)`: do not extrapolate its named Type II/even-lattice result to arbitrary composite moduli."
- **Layer 6, lines 356–359:** "- For the published higher-modulus terminology, separately define a Type II `Z/(2^r)` code as a self-dual code whose Euclidean weights are divisible by `2^(r+1)`, and prove the corresponding Construction-A lattice is even unimodular. Do not install “Type II” as a predicate on every `ZMod m` code."
- **References, lines 459–460 (Dougherty–Gulliver–Harada):** "This is the source for Type II codes over `Z/(2^r)` and their even-unimodular Construction-A lattices; its modulus restriction is retained."
- **Suggested.lean.** Upstream `TauCetiRoadmap/AlgebraicCodingTheory/Suggested.lean` still has "/-- The published higher-modulus Type II notion is restricted to `Z/(2^r)`. -/" at line 471, on both main ca2f063 and 2172af4.
- **Tau Ceti.** At the pin, Tau Ceti has no Type II or Construction A declaration: `TauCeti/InformationTheory/Coding/` holds only `Basic.lean` and `Matrix.lean`.
  - Post-pin, `TauCeti/InformationTheory/Coding/TwoPowTypeII.lean:21–22`, on both b3decc7 and main 30f0492, reads: "The notion is specific to moduli which are powers of two, so the predicate is stated only for codes over `ℤ/2^r`; it is not a predicate on codes over an arbitrary `ℤ/m`."
  - The same trees already prove the general criterion `isEven_integralLattice_iff_euclideanWeight (hm : Even m)` (`TauCeti/LinearAlgebra/IntegralLattice/ConstructionA/Even.lean:104`): evenness ↔ `∀ x ∈ C, 2 * m ∣ euclideanWeight x`.

### Fix

#### The mathematics, from the source read
- **The definition.** Harada–Miezaki, §2.1, p. 4: "For general k, Type II Z2k-codes were defined in [2] as self-dual codes with the property that all Euclidean weights are divisible by 4k". Here a `Z_k`-code is a `Z_k`-submodule of `Z_k^n` (p. 3), which is the same as an additive code.
- **The equivalence.** §2.4, pp. 6–7: "Moreover, C is a Type II Z2k-code if and only if A2k(C) is an even unimodular lattice [2]."
- **The residue criterion.** The layer's even-`m` criterion gives the equivalence directly. For `m = 2k`, `(2k−a)² − a² = 4k(k−a)`. So `∑ lift(c_i)² ≡ wt_E(c) (mod 4k)`, and `q_{2k}(c) = wt_E(c)/(4k) mod ℤ`.
  - Evenness of `P_{2k}(C)` is therefore `4k ∣ wt_E` on `C`.
  - Unimodularity is `C = C^⊥` (line 345).
  - Dougherty–Gulliver–Harada is the case `k = 2^(r−1)` (`4k = 2^(r+1)`), and binary Type II is `k = 1`.
- **Odd moduli.** For odd `m` and nonempty `ι`, the vector `m e_i` has `B_m`-norm `m`, which is odd. For empty `ι`, `P_m(C) = 0`.

#### Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`, Layer 6 and References
1. **Lines 333–335.** Replace the quoted sentence with:
   > Type II codes are defined for every even modulus. Following Bannai--Dougherty--Harada--Oura, as restated in Harada--Miezaki §§2.1 and 2.4, a Type II code over `Z/(2k)`, `k ≥ 1`, is a self-dual code all of whose Euclidean weights are divisible by `4k`, and a code is Type II exactly when its Construction A lattice is even unimodular. Dougherty--Gulliver--Harada's `Z/(2^r)` theorem is the case `k = 2^(r-1)`, and binary Type II is `k = 1`. There is no odd-modulus notion: for odd `m` and nonempty `ι` no Construction A lattice is even (proved below), while for empty `ι` the lattice is `0`, which is even.
2. **Lines 356–359.** Replace the bullet with:
   > - For `k ≥ 1`, define a Type II code over `ZMod (2k)` as an additive code `C` with `C = C^⊥` whose Euclidean weights `wt_E(c) = ∑ i, min(val c_i, 2k - val c_i)^2` are all divisible by `4k`. Prove `(2k - a)^2 ≡ a^2 (mod 4k)`, so that `q_{2k}(c) = wt_E(c)/(4k) mod ℤ`, and deduce from the criteria above that `C` is Type II **if and only if** `C ≤ C^⊥` and the integral lattice `P_{2k}(C)` is even and unimodular. Record Dougherty--Gulliver--Harada's `Z/(2^r)` codes (`k = 2^(r-1)`, weights divisible by `2^(r+1)`) and binary Type II codes (`k = 1`, where the Euclidean weight is the Hamming weight) as specializations. The predicate is stated for even moduli only; odd moduli are covered by the non-evenness theorem above.
3. **References, lines 459–460.** Replace "This is the source for Type II codes over `Z/(2^r)` and their even-unimodular Construction-A lattices; its modulus restriction is retained." with the text below. It ends the Dougherty–Gulliver–Harada entry and adds two entries.
   > It treats Type II codes over `Z/(2^r)` and their even-unimodular Construction-A lattices, the case `k = 2^(r-1)` of the even-modulus notion of Layer 6.
   > - E. Bannai, S. T. Dougherty, M. Harada, and M. Oura, “Type II codes, even unimodular lattices, and invariant rings,” *IEEE Trans. Inform. Theory* **45** (1999), 1194--1205, [DOI](https://doi.org/10.1109/18.761269). Cited by Harada--Miezaki for the definition of Type II codes over `Z/(2k)`, `k ≥ 1`, and their equivalence with even unimodular Construction-A lattices.
   > - M. Harada and T. Miezaki, “On the existence of extremal Type II `Z_{2k}`-codes,” [arXiv:1205.6947v2](https://arxiv.org/abs/1205.6947v2). §2.1 (p. 4) states the `Z/(2k)` definition and §2.4 (pp. 6--7) the Construction-A equivalence and the minimum norm `min{k, d_E(C)/k}` of `A_k(C)` for self-dual `C`.

#### Note for the Tau Ceti maintainer: `Suggested.lean` and the library docstring
- **Suggested.lean, line 471.** Replace the docstring and add the general predicate beside `IsTypeIIZModTwoPower`. The declarations below are uncompiled, and they reuse the file's own `zmodDual`, `zmodEuclideanWeight` and `constructionA`:
  ```lean
  /-- Type II codes over `ℤ/(2k)`, `k ≥ 1` (Bannai–Dougherty–Harada–Oura; Harada–Miezaki §2.1):
  Euclidean self-dual codes all of whose Euclidean weights are divisible by `4k`. There is no
  odd-modulus notion. -/
  def IsTypeIIZModEven (k : ℕ) (hk : 1 ≤ k) (C : AdditiveCode (ZMod (2 * k)) ι) : Prop :=
    let hm : 2 ≤ 2 * k := by omega
    C = zmodDual (2 * k) hm C ∧ ∀ c ∈ C, 4 * k ∣ zmodEuclideanWeight (2 * k) hm c

  /-- A code over `ℤ/(2k)` is Type II exactly when its Construction-A lattice is even unimodular. -/
  theorem isTypeIIZModEven_iff_constructionA (k : ℕ) (hk : 1 ≤ k)
      (C : AdditiveCode (ZMod (2 * k)) ι) :
      let hm : 2 ≤ 2 * k := by omega
      IsTypeIIZModEven k hk C ↔ ∃ hself : C ≤ zmodDual (2 * k) hm C,
        (constructionA (2 * k) hm C hself).IsEven ∧
          (constructionA (2 * k) hm C hself).IsUnimodular := sorry
  ```
  Give `IsTypeIIZModTwoPower` the docstring "Dougherty–Gulliver–Harada's Type II codes over `ℤ/(2^r)`: the case `k = 2^(r-1)` of `IsTypeIIZModEven`." Keep `constructionA_typeIIZModTwoPower_even_unimodular`; it is now the special case.
- **Tau Ceti library (post-pin), `Coding/TwoPowTypeII.lean:21–22`.** Replace the two quoted sentences with:
  > Type II codes are defined over `ℤ/2k` for every `k ≥ 1` (Bannai, Dougherty, Harada, and Oura, 1999), with Euclidean weights divisible by `4k`; this file treats the powers of two `2k = 2^r` of Dougherty, Gulliver, and Harada. There is no odd-modulus notion.

  Generalizing that library predicate is the library maintainer's decision. The existing `isEven_integralLattice_iff_euclideanWeight` (`ConstructionA/Even.lean:104`, post-pin) is already the even-modulus criterion it needs.

### Not done, and why
- **Bannai–Dougherty–Harada–Oura was not read.** Only its Crossref record was checked (DOI 10.1109/18.761269; *IEEE Trans. Inform. Theory* 45(4), 1999, pp. 1194–1205). The mathematics above rests on Harada–Miezaki, which is read and quoted, and on the elementary congruence. Harada–Miezaki's own bibliography lists [2] as pp. 257–269; the Crossref pages are used.
- **The layer's other statements are unchanged.** That includes the binary `m = 2` bullet and the odd-`m` non-evenness, which already carries "`ι` is nonempty".

## /22 (medium, missing): Layer 7 plans the finite-family lattice sum its interface needs

### What the verifier corrected
- **What exists at `f790474`.** Binary lattice sums and their discriminant isometries: `OrthogonalSum.lean` and `Discriminant/Operations.lean:139, 162, 228`. `CoordinatePower.lean` gives alphabet powers, not the lattice-side comparison.
- **Who owns the iteration.** ACT-L10 leaves the finite-family iteration to coding, and Layer 7 names only the resulting interface.
- **What to do.**
  - Expand the obligation into finite-family targets: carrier and form, dual, discriminant, and coordinate-power compatibility. Reuse the binary APIs and the finite-form products.
  - State nondegeneracy and evenness wherever the bundled discriminant isometries need them.
  - Do not duplicate IntegralLattices, and do not claim the iteration is built.

### State on main (701638e0)
- **Layer 7, lines 401–403:** "- State the reusable interface for an isometry from a coordinate finite quadratic module to the discriminant module of an orthogonal lattice sum. Its input subgroup remains an `AddSubgroup`; field-linearity is used only when separately proved for a named code." No layer plans the finite-family sum.
- **What the pin has, all binary** (Tau Ceti `f790474`, `TauCeti/LinearAlgebra/...`):
  - **The sum.** `IntegralLattice.orthogonalSum` (`IntegralLattice/OrthogonalSum.lean:80`), on `V × W`. With it: `finrank_orthogonalSum` (:250), `determinant_orthogonalSum` (:274), `discriminant_orthogonalSum` (:284), `isEven_orthogonalSum_iff` (:291), `nondegenerate_orthogonalSum_iff` (:336) and `signature_orthogonalSum` (:389).
  - **Its dual and discriminant.**
    - `dualCarrier_orthogonalSum` (`Discriminant/Operations.lean:89`), with no hypotheses.
    - `discriminantGroupOrthogonalSumEquiv` (:139).
    - `discriminantBilinearIsometryOrthogonalSum` (:162), under `[L.IsNondegenerate] [M.IsNondegenerate]`.
    - `discriminantQuadraticIsometryOrthogonalSum` (:228), which also needs `hL : L.IsEven` and `hM : M.IsEven`.
  - **The finite-form products.** `FiniteBilinearModule.prod` (`FiniteBilinearModule/Basic.lean:567`) and `FiniteQuadraticModule.prod` (`Quadratic.lean:435`).
  - **The constant-family alphabet power.** `FiniteBilinearModule.coordinatePower` (`CoordinatePower.lean:58`), `FiniteQuadraticModule.coordinatePower` (:157), and their coordinatewise isometries `Isometry.coordinatePower` (:130, :204).
- **What is absent.** No family-indexed lattice sum or lattice power exists; a search of `IntegralLattice/` and `FiniteBilinearModule/` finds none. The coverage note for Layer 7 target 5 already says so: "Only the two-summand isometry A_{L perp M} = A_L x A_M exists; there are no finite lattice powers and no identification with a coordinate power."
- **Edges.** The two stage edges the red team proposed are already in the assembled graph, as reviewed links from the accepted coding link map:
  - `tauceti:Completed/IntegralLattices#layer-1-lattices-with-forms` → Layer 7 (ACT-L10);
  - `tauceti:Completed/IntegralLattices#layer-2-duality-and-the-finite-discriminant-group` → Layer 7 (ACT-L04).

### Fix

#### Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`, Layer 7
Replace the bullet at lines 401–403 with:

> - State the reusable interface for an isometry from a coordinate finite quadratic module to the discriminant module of an orthogonal lattice sum. Its input subgroup remains an `AddSubgroup`; field-linearity is used only when separately proved for a named code. The integral-lattices roadmap supplies binary orthogonal sums only (`IntegralLattice.orthogonalSum`, `discriminantBilinearIsometryOrthogonalSum`, `discriminantQuadraticIsometryOrthogonalSum`), so iterate them here rather than planning a second lattice-sum theory:
>   - the orthogonal sum `⊕_{i:κ} L_i` of a finite family of integral lattices, on `Π i, V_i` with carrier `Π i, L_i` and form `∑ i, B_i`, and the power `L^κ` on `κ → V`; its rank and signature (sums), determinant and discriminant (products), evenness (exactly when every `L_i` is even), nondegeneracy (exactly when every `L_i` is nondegenerate), and agreement with the binary `orthogonalSum` for a two-element index type along the canonical coordinate equivalence;
>   - its dual carrier, `(⊕ L_i)^∨ = Π i, L_i^∨`;
>   - for nondegenerate `L_i`, the isometry `A_{⊕ L_i} ≅ Π i, A_{L_i}` of finite bilinear modules, and of finite quadratic modules when every `L_i` is even, with the product the iterated `FiniteBilinearModule.prod` (resp. `FiniteQuadraticModule.prod`); for a power, the isometry `A_{L^κ} ≅ (A_L)^κ` onto the coordinate power;
>   - its composite with the coordinatewise isometry `FiniteQuadraticModule.Isometry.coordinatePower` of an alphabet isometry `A ≅ A_L`. This is the interface, applied to `A₂` and `D₄` with the alphabets fixed above.

Each item is the finite-family form of a binary declaration read at the pin, with that declaration's hypotheses: nondegeneracy for the bilinear isometry, and nondegeneracy and evenness for the quadratic one. No new edge is needed, since ACT-L10 and ACT-L04 are already in the graph.

### Not done, and why
- **Where the generic sum lives.** The finite-family sum is generic lattice theory. The accepted ACT-L10 assigns its iteration to coding, so it is planned in Layer 7. If the maintainer would rather host it in the integral-lattices library (a Completed roadmap), it moves there as an addition to that library, and coding imports it. It is not planned in both places.
- **No rank-24 statements.** The bullet claims no glue tables and no rank-24 lattice identifications, as the layer's own scope requires.

## /23 (low, other): rejected; no change
The verifier rejected it because the finding agrees the audit is correct at the binding `f790474` pin and only asks the orchestrator to move the pin, which is not an error in the pinned verdicts.

## /24 (medium, error): the coding layers get their internal dependency edges

### What the verifier corrected
- **The state the verifier found.** The frozen atlas has seven coding stages, with empty `requires`/`consumers` and no stage edges. The accepted link packet holds ACT-L01–L10, and the README's ordering consumes earlier code APIs.
- **What to do.**
  - Import the accepted cross-roadmap links.
  - Record the justified internal dependencies after moving the forward-reference clauses (/25).
  - Regenerate the extract and the roadmap-level relations from the resulting graph.
- **What the edges mean.** They are planning dependencies. Built declarations stay imports, and no new proof of upstream lattice gluing is implied.

### State on main (701638e0)
- **The cross-roadmap part is already done by the build.** The accepted packet was promoted to `data/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json` on 23 September (82fcae63), before the review freeze. `scripts/build.py` merges it. In the assembled graph:
  - all ten links ACT-L01–L10 are `reviewed_link` stage edges;
  - the roadmap's `prerequisites` are `[tauceti:Completed/IntegralLattices]` and its `consumers` are `[FiniteFieldsAndCharacterSums]`, which is what the red team asked for.
- **What is still stale.**
  - `data/atlas.json` still has 0 coding stage edges and empty roadmap relations. That is expected, since the links are merged at build time.
  - The extract `research/blueprint/atlas/roadmaps/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json` (16 September) still shows `"prerequisites": []`, `"consumers": []` and `"stageEdges": []`. `research/blueprint/make_atlas_extracts.py` builds extracts from `data/atlas.json` with only retirements applied, so the extract never shows the merged links.
- **The internal part is still missing.** The assembled graph has no edge between two coding layers. The only Tau Ceti intra-roadmap edges in the atlas, those of ConformalMapping and OneParameterSemigroups, come from the explicit-dependency list in `scripts/snapshot/build_data.py` (lines 422–438). Each edge there carries a quoted README phrase.

### Fix
**The 17 internal edges.** Each needle below is a phrase in the consumer layer that uses the producer's objects. Each occurs in the snapshot text, and also in the text after the /21, /22, /25, /26, /27 and /30 notes are applied. In both texts, its first occurrence in the README lies in the consumer layer. Every cycle test is acyclic.

| Edge | What the consumer uses | Needle (consumer text) | Cycle test |
|---|---|---|---|
| L1 → L2 | puncture, shorten, direct sum; generator/check matrices | "`(puncture C s)^⊥ = shorten (C^⊥) s`" | acyclic |
| L1 → L3 | monomial equivalences, direct sum | "direct-sum product" | acyclic |
| L2 → L3 | Euclidean dual, minimum distance | "Establish the finite-character orthogonality lemma for a linear subspace and its Euclidean dual" | acyclic |
| L1 → L4 | direct sum, coordinate permutations | "preservation under coordinate permutation" | acyclic |
| L2 → L4 | self-dual through `C^⊥` | "For a binary self-dual code, prove that every word has even weight" | acyclic |
| L3 → L4 | MacWilliams | "Specialize MacWilliams to Type II codes" | acyclic |
| L1 → L5 | generator matrices, puncturing, permutation equivalence | "permutation-equivalent to `G₂₄`" | acyclic |
| L2 → L5 | Hermitian and Euclidean duals, distance | "is **Hermitian** self-dual" | acyclic |
| L3 → L5 | weight enumerators | "For all four codes, evaluate the finite sum defining the enumerator" | acyclic |
| L4 → L5 | self-dual, doubly-even | "self-duality, doubly-evenness" | acyclic |
| L1 → L6 | coordinate permutations, monomial equivalences | "Prove naturality under coordinate permutations" | acyclic |
| L2 → L6 | dual and dimension of a linear code over `ZMod p`; Hamming weight | "For a linear `[n,k]` code over `ZMod p`" | acyclic |
| L4 → L6 | Type II codes | "Construction A lattice of a Type II code" | acyclic |
| L5 → L6 | `G₂₄` | "Apply this to the explicit `G₂₄`" | acyclic |
| L2 → L7 | coordinate powers of finite forms | "coordinate powers and coordinatewise isometries for other discriminant alphabets" | acyclic |
| L5 → L7 | tetracode, `G₁₂`, hexacode | "Verify that the tetracode and `G₁₂` become quadratic-isotropic, Lagrangian subgroups" | acyclic |
| L6 → L7 | `P_m(C)`, `q_m` | "`A_{P_m(C)} ≅ C^⊥/C`" | acyclic |

Here `Lk` is `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#` followed by the Layer k anchor, as in `data/atlas.json`. Every edge runs from a lower layer to a higher one, so none of them depends on a clause that /25 moves.

**Where to record them.** Add them to the snapshot builder's explicit-dependency list, where the other Tau Ceti intra-roadmap edges live. A hand edit of `data/atlas.json` alone would be lost at the next snapshot rebuild. In `scripts/snapshot/build_data.py`, after line 433 (`stage_dep('ConformalMapping', p, c, needle)`), insert:
```python
    # AlgebraicCodingTheory: each layer's named use of an earlier layer's objects.
    for p, c, needle in [
            ('Layer 1', 'Layer 2', '`(puncture C s)^⊥ = shorten (C^⊥) s`'),
            ('Layer 1', 'Layer 3', 'direct-sum product'),
            ('Layer 2', 'Layer 3', 'Establish the finite-character orthogonality lemma for a linear subspace and its Euclidean dual'),
            ('Layer 1', 'Layer 4', 'preservation under coordinate permutation'),
            ('Layer 2', 'Layer 4', 'For a binary self-dual code, prove that every word has even weight'),
            ('Layer 3', 'Layer 4', 'Specialize MacWilliams to Type II codes'),
            ('Layer 1', 'Layer 5', 'permutation-equivalent to `G₂₄`'),
            ('Layer 2', 'Layer 5', 'is **Hermitian** self-dual'),
            ('Layer 3', 'Layer 5', 'For all four codes, evaluate the finite sum defining the enumerator'),
            ('Layer 4', 'Layer 5', 'self-duality, doubly-evenness'),
            ('Layer 1', 'Layer 6', 'Prove naturality under coordinate permutations'),
            ('Layer 2', 'Layer 6', 'For a linear `[n,k]` code over `ZMod p`'),
            ('Layer 4', 'Layer 6', 'Construction A lattice of a Type II code'),
            ('Layer 5', 'Layer 6', 'Apply this to the explicit `G₂₄`'),
            ('Layer 2', 'Layer 7', 'coordinate powers and coordinatewise isometries for other discriminant alphabets'),
            ('Layer 5', 'Layer 7', 'Verify that the tetracode and `G₁₂` become quadratic-isotropic, Lagrangian subgroups'),
            ('Layer 6', 'Layer 7', '`A_{P_m(C)} ≅ C^⊥/C`')]:
        stage_dep('AlgebraicCodingTheory', p, c, needle)
```
The stage keys are `Layer 1` … `Layer 7`, and `by_short` finds the roadmap as `AlgebraicCodingTheory`.

**The resulting internal `requires`**, alongside the link-supplied IntegralLattices inputs:

| Layer | Requires |
|---|---|
| L2 | L1 |
| L3 | L1, L2 |
| L4 | L1, L2, L3 |
| L5 | L1–L4 |
| L6 | L1, L2, L4, L5 |
| L7 | L2, L5, L6 |

**Then** rebuild `data/atlas.json` and regenerate the extract. The extract generator reads only `data/atlas.json`, so it omits all build-time merges (links, restructurings, decompositions) for every roadmap, not only this one. Having it read the assembled graph is a tooling change for the maintainer.

### Not done, and why
- **Link merging.** It is not repeated, because the build already merges the accepted packet.
- **Link-map entries for the internal edges.** None are added: PROTOCOL §10 makes link maps record dependencies between roadmaps only.
- **Stage status.** No stage status is changed; the statuses come from the pinned library audit.

## /25 (low, error): Layer 1 keeps the raw constructions; dual, distance and enumerator consequences move to Layers 2 and 3

### What the verifier corrected
- **The forward references.** Layer 1 asks for generator/check statements involving `C^⊥` and for invariance of distance and weight enumerators, before Layer 2 defines the dual and distance and Layer 3 the enumerator.
- **What to do.** Keep the raw carrier, matrix and equivalence constructions in Layer 1. Move the dual and distance consequences to Layer 2 and the enumerator consequences to Layer 3, sharing rather than duplicating the invariance proofs.
- **Hamming primitives.** Mathlib's Hamming primitives may be used early. Do not create reverse edges to support the later consequences.

### State on main (701638e0)
Unchanged.
- **Layer 1, lines 146–148:** "Relate a generator for `C` to a check matrix for `C^⊥`. Develop systematic form relative to a chosen information set and verify directly that `[I | A]` and `[-Aᵀ | I]` generate/check orthogonal codes."
- **Lines 157–159:** "Prove preservation of dimension, support cardinality, weight, distance, and weight enumerator by the appropriate equivalences."
- **Layer 2, line 172:** "Prove invariance under Hamming isometries and the sharp deleted-coordinate bound for puncturing."
- **Layer 3, lines 200–203:** "…has `A_0=1`, and is invariant under monomial equivalence. Define the one-variable and homogeneous weight enumerators and prove … direct-sum product, …".
- **Mathlib `082e2d3` supplies** `hammingNorm` (`InformationTheory/Hamming.lean:138`) and `hammingDist` (:41).
- **The "orthogonal codes" clause.** The systematic-form clause of lines 147–148 is the same kind of forward reference, since "orthogonal codes" means `C` and `C^⊥`. It is rewritten below as the matrix statement Layer 1 can prove, which the pinned `Matrix.generatedBy_le_checkedBy_iff` (`Coding/Matrix.lean:143`, `G.generatedBy ≤ H.checkedBy ↔ H * Gᵀ = 0`) already supports.

### Fix

#### Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`
1. **Layer 1, lines 146–148.** Replace "Relate a generator for `C` to a check matrix for `C^⊥`. Develop systematic form relative to a chosen information set and verify directly that `[I | A]` and `[-Aᵀ | I]` generate/check orthogonal codes." with:
   > Develop systematic form relative to a chosen information set and verify directly that `[-Aᵀ | I]` is a parity-check matrix for the code generated by `[I | A]` (the matrix identity `[-Aᵀ | I] * [I | A]ᵀ = 0` and complementary ranks); the dual-code form of this is Layer 2's.

   "Do not assert that a canonical information set exists." stays.
2. **Layer 1, lines 157–159.** Replace "Prove preservation of dimension, support cardinality, weight, distance, and weight enumerator by the appropriate equivalences." with:
   > Prove preservation of dimension, support cardinality, and Hamming weight (Mathlib's `hammingNorm`) by the appropriate equivalences. Layers 2 and 3 derive the preservation of minimum distance and of the weight distribution and enumerator from this, where those invariants are defined.
3. **Layer 2, line 172.** Replace "Prove invariance under Hamming isometries and the sharp deleted-coordinate bound for puncturing." with:
   > Prove invariance under Hamming isometries; in particular the permutation, monomial, and semilinear equivalences of Layer 1 preserve minimum distance, by their weight preservation proved there. Prove the sharp deleted-coordinate bound for puncturing.
4. **Layer 2, line 182.** After "`dim C + dim C^⊥ = #ι`, and `#C · #C^⊥ = (#F)^(#ι)`." add:
   > Relate a generator for `C` to a check matrix for `C^⊥`: `G` is a generator matrix for `C` exactly when it is a parity-check matrix for `C^⊥`, so the systematic `[I | A]` and `[-Aᵀ | I]` of Layer 1 generate `C` and `C^⊥`.
5. **Layer 3, lines 200–203.** Replace "has `A_0=1`, and is invariant under monomial equivalence. Define the one-variable and homogeneous weight enumerators and prove their coefficient formulae, finite support, homogeneity, evaluation at `(1,1)`, direct-sum product," with:
   > has `A_0=1`, and is invariant under the permutation, monomial, and semilinear equivalences of Layer 1 (from their weight preservation). Define the one-variable and homogeneous weight enumerators and prove their coefficient formulae, finite support, homogeneity, evaluation at `(1,1)`, invariance under the same equivalences (from that of the weight distribution), direct-sum product,

**Checks.**
- **The generator/check-dual statement.** `ker G.mulVecLin = (rowspan G)^⊥`, so `rowspan G = C` gives `ker G = C^⊥`. Conversely, `ker G = C^⊥` gives `rowspan G = C^⊥⊥ = C`. Upstream Suggested.lean states it after `dual` as `generator_iff_check_dual`.
- **The systematic pair.** `[-Aᵀ | I][I | A]ᵀ = -Aᵀ + Aᵀ = 0`, and the ranks are `k` and `n−k`.

After these edits, Layer 1 names neither `C^⊥`, nor minimum distance, nor the enumerator.

### Not done, and why
- **No edge is added here.** The forward edges of /24 cover these uses.
- **AUDIT-16.** Its Layer 1 target 2 still lists "generator of C = check matrix of C^perp" (see /27). If this note is applied upstream, the clause moves to Layer 2's dual target when the audit is next refreshed. That audit refresh is not part of this job.

## /26 (low, library-claim): the gluing construction is named by its pinned API, with bilinear and even cases kept apart

### What the verifier corrected
- **The name does not exist at the pin.** No `ofIsotropicSubgroup` declaration occurs at `f790474`.
- **The actual construction.** It is `intermediateCarrierOfDiscriminantSubgroup` followed by `IntermediateCarrier.IsIntegral.toIntegralLattice`, with its lattice and integrality hypotheses. The even order isomorphism is another valid interface. The subgroup isometries are in the Bilinear and Quadratic OrthogonalQuotient files (lines 267 and 305).
- **What to do.**
  - Correct the README and the completion criterion to these APIs.
  - Keep nondegeneracy.
  - Distinguish bilinear isotropy from quadratic isotropy and evenness.
  - Do not introduce a second gluing constructor.

### State on main (701638e0)
- **The snapshot is unchanged.** The name appears at four places:
  - **Line 121:** "isotropic subgroups, `IntegralLattice.ofIsotropicSubgroup`, and the isometry `A_{L_H} ≅ H^⊥/H`";
  - **Line 382:** "and the preimage lattice `L₀.ofIsotropicSubgroup` is isometric to `P_m(C)`";
  - **Line 407:** "and as `IntegralLattice.ofIsotropicSubgroup`";
  - **Line 421:** "without the `ofIsotropicSubgroup`/`C^⊥/C` comparison".
- **Read at the pin** (Tau Ceti `f790474`, `TauCeti/LinearAlgebra/IntegralLattice/Overlattice/`):
  - `intermediateCarrierOfDiscriminantSubgroup` (`Basic.lean:127`): the inverse image of `H` in `L^∨`. Every intermediate carrier is a full lattice when `L` is nondegenerate, by `instIsLatticeIntermediateCarrier` (:245).
  - `IntermediateCarrier.IsIntegral.toIntegralLattice` (`Isotropic.lean:144`), under `[M.1.IsLattice ℚ]`, keeping the ambient form. `IsEven.isEven_toIntegralLattice` (:168) says that an even carrier gives an even lattice.
  - Under `[L.IsNondegenerate]`:
    - `isIntegral_intermediateCarrierOfDiscriminantSubgroup_iff` (:296): integral ↔ bilinear-isotropic.
    - `isEven_intermediateCarrierOfDiscriminantSubgroup_iff` (:305): for `hL : L.IsEven`, even ↔ quadratic-isotropic.
    - `integralIntermediateCarrierOrderIsoIsotropicSubgroup` (:315) and `evenIntermediateCarrierOrderIsoIsotropicSubgroup` (:343).
  - `discriminantBilinearOrthogonalQuotientIsometryOfSubgroup` (`OrthogonalQuotient/Bilinear.lean:267`), for a bilinear-isotropic `H` over nondegenerate `L`.
  - `discriminantOrthogonalQuotientIsometryOfSubgroup` (`OrthogonalQuotient/Quadratic.lean:305`), for even `L` and quadratic-isotropic `H`.
  - `IntermediateCarrier.dual_eq_self_iff_isLagrangian` (`Dual.lean:232`): unimodular ↔ Lagrangian.
  - Mathlib `082e2d3` has no overlattice or gluing declarations.
- **Upstream changes after the pin.**
  - **The library (2026-09-18).** Tau Ceti added `IntegralLattice.ofIsotropicSubgroup (hL : L.IsEven) (H) (hH : quadratic-isotropic)` in PR #7203 (commit 0555df799), read at main 30f0492, `Overlattice/Isotropic.lean:379`, under `[L.IsNondegenerate]`. It is defined as `IsIntegral.toIntegralLattice` applied to the even inverse-image carrier, so it is exactly the pinned composite, in the even case only.
  - **The roadmap (2026-09-27).** On 27 September, after the verification, upstream Suggested.lean switched `constructionAAsGluing` to that name (TauCetiRoadmap a775d124f, #424). So the review's "as the Suggested file already does" now describes Suggested.lean at 2172af4, not main.
  - **What still holds.** At the pin the README's name resolves to nothing. Even after the pin it covers only even `L` and quadratic-isotropic `H`. Line 382 asks for it for every `m`, including the bilinear, odd-`m` case.

### Fix

#### Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`
1. **Lines 119–122.** Replace "The integral-lattices roadmap supplies `IntegralLattice`, finite bilinear and quadratic modules, discriminant forms, isotropic subgroups, `IntegralLattice.ofIsotropicSubgroup`, and the isometry `A_{L_H} ≅ H^⊥/H`." with:
   > The integral-lattices roadmap supplies `IntegralLattice`, finite bilinear and quadratic modules, discriminant forms, isotropic subgroups, the lattice `L_H` glued along a subgroup `H` of `A_L`, and the isometry `A_{L_H} ≅ H^⊥/H`, all for nondegenerate `L`. At Tau Ceti commit `f790474`, `L_H` is the inverse-image carrier `L.intermediateCarrierOfDiscriminantSubgroup H` made into an integral lattice by `IntermediateCarrier.IsIntegral.toIntegralLattice`. Its integrality is bilinear isotropy of `H` (`isIntegral_intermediateCarrierOfDiscriminantSubgroup_iff`); for even `L` its evenness is quadratic isotropy (`isEven_intermediateCarrierOfDiscriminantSubgroup_iff`, with the even correspondence `evenIntermediateCarrierOrderIsoIsotropicSubgroup`). The isometry is `discriminantBilinearOrthogonalQuotientIsometryOfSubgroup`, and for even `L` and quadratic-isotropic `H` also `discriminantOrthogonalQuotientIsometryOfSubgroup`. Later Tau Ceti names the even case `IntegralLattice.ofIsotropicSubgroup hL H hH`, defined as this same composite; there is no second gluing construction, and none is to be built here.
2. **Lines 381–382.** Replace "and the preimage lattice `L₀.ofIsotropicSubgroup` is isometric to `P_m(C)`." with:
   > and, when `C ≤ C^⊥`, the lattice glued over `L₀` along this subgroup (bilinear case above) is `P_m(C)`, with the same carrier and form in `ℚ^ι`; for even `m` and `q_m|_C=0` it is also the even glued lattice.

   This holds because `L₀^∨ = ℤ^ι` and the inverse image of the transported `C` in `ℤ^ι` is `ρ_m⁻¹(C) = P_m(C)`, with the same form `B_m`.
3. **Lines 406–407.** Replace "constructs the same lattice both as Construction A and as `IntegralLattice.ofIsotropicSubgroup`, and obtains evenness," with:
   > constructs the same lattice both as Construction A and as the even lattice glued over `L₀(2,ι)` along the transported code, and obtains evenness,

   `L₀(2,ι) = 2ℤ^ι` with `B_2` is even, since `B_2(2y,2y) = 2∑y_i²`.
4. **Lines 420–421.** Replace "or proving even unimodularity without the `ofIsotropicSubgroup`/`C^⊥/C` comparison, is not completion." with:
   > or proving even unimodularity without the glued-lattice and `C^⊥/C` comparison of Layer 7, is not completion.

### Not done, and why
- **Upstream Suggested.lean is left as it is.** Its post-pin name is correct for the even case it uses. The README note names the pinned composite, and records the later name as that composite.
- **No new edge.** The IntegralLattices Layer 4 → Layer 7 link (ACT-L06) is already in the graph.

## /27 (low, library-claim): the README lists the coding layer Tau Ceti already has; the audit carries its matrix citations to coverage

### What the verifier corrected
- **What the pin already has.** `Coding/Basic.lean`'s aliases, and `Coding/Matrix.lean`'s generated and checked codes, matrix predicates, rank results and row counts. So the README's absolute absence sentence is stale.
- **The coverage gap.** The coverage note recognizes the partial implementation, but its evidence lists only the aliases and the cardinality formula.
- **What to do.**
  - Add representative matrix declarations to the canonical audit and regenerate coverage.
  - Keep the "partly built" verdict and the remaining operations and dual gaps.
  - A matrix lemma is exact only for its own subtarget, not for the whole composite target.

### State on main (701638e0)
- **README line 118:** "Tau Ceti has no general coding-theory layer."
- **Read at the pin.** All of the following are sorry-free.
  - `TauCeti.LinearCode` (`TauCeti/InformationTheory/Coding/Basic.lean:31`) and `TauCeti.AdditiveCode` (:35).
  - In `Coding/Matrix.lean`:
    - `Matrix.generatedBy` (:46, the range of `vecMulLinear`) and `Matrix.checkedBy` (:50, the kernel of `mulVecLin`);
    - `LinearCode.IsGeneratorMatrix` (:64) and `IsParityCheckMatrix` (:68);
    - `Matrix.mem_generatedBy_iff` (:89) and `mem_checkedBy_iff` (:107);
    - `finrank_generatedBy` (:128, `= G.rank`) and `finrank_checkedBy` (:135, `= Fintype.card ι - H.rank`);
    - `generatedBy_le_checkedBy_iff` (:143, `↔ H * G.transpose = 0`);
    - `card_eq_finrank_of_isGeneratorMatrix_of_linearIndependent` (:186), `exists_isGeneratorMatrix` (:196) and `card_eq_card_sub_finrank_of_isParityCheckMatrix_of_linearIndependent` (:217);
    - `IsGeneratorMatrix.mul_transpose_eq_zero` (:229).
  - `FiniteBilinearModule/CoordinatePower.lean`:
    - `FiniteBilinearModule.coordinatePower` (:58) and `IsNondegenerate.coordinatePower` (:101);
    - `mem_orthogonalComplement_coordinatePower_iff` (:117);
    - `FiniteQuadraticModule.coordinatePower` (:157) and `isIsotropic_coordinatePower_iff` (:191);
    - the coordinatewise isometries `Isometry.coordinatePower` (:130, :204).
- **Mathlib `082e2d3`** has no linear-code, generator-matrix or parity-check declarations. Its `InformationTheory/Coding/` holds only Kraft–McMillan and prefix-free codes.
- **Why coverage misses the matrix API.** The canonical audit, `research/blueprint/audit/AUDIT-16.result.json`, already cites five Matrix.lean declarations under coding Layer 1 target 2. But `scripts/merge_library_audit.py` copies a declaration into coverage evidence only when its target's `library` is `mathlib`, `tauceti` or `both`. Target 2 is `"partial"`, so none of them reaches `data/library-coverage.json`, whose Layer 1 evidence is still the two aliases and `Module.card_eq_pow_finrank`. Adding more declarations to target 2 would change nothing; the target has to be split.
- **Coverage predates a later audit edit.** Coverage was generated on 21 September, before FIX-RT-AUDIT-16 (d5731e0a) edited other AUDIT-16 targets.

### Fix
**1. The audit.** In `research/blueprint/audit/AUDIT-16.result.json`, under `roadmaps["tauceti:TauCetiRoadmap/AlgebraicCodingTheory"].layers["…#layer-1-finite-codes-matrices-and-elementary-constructions"].targets`, replace element 1 with two elements.
- **Element 1, old (abridged):** `"target": "Codes generated and checked by a matrix, generator/parity-check predicates, existence from bases, row-span and syndrome criteria, rank/dimension formulas, row counts k and n-k, invariance under invertible row operations, generator of C = check matrix of C^perp"`, `"library": "partial"`, five declarations, and the note beginning "Tau Ceti has checkedBy and IsParityCheckMatrix (lines 50, 68)…".
- **New element 1a:**
  ```json
  {"target": "Codes generated and checked by a matrix (range of vecMulLinear, kernel of mulVecLin), generator/parity-check predicates, row-span and syndrome membership criteria, rank/dimension formulas, existence of a full-rank generator matrix from a basis, row counts k and n-k for linearly independent generator/check matrices, and generatedBy G <= checkedBy H iff H * G^T = 0",
   "library": "tauceti",
   "declarations": [
    {"name": "Matrix.generatedBy", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 46, "fit": "exact"},
    {"name": "Matrix.checkedBy", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 50, "fit": "exact"},
    {"name": "TauCeti.LinearCode.IsGeneratorMatrix", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 64, "fit": "exact"},
    {"name": "TauCeti.LinearCode.IsParityCheckMatrix", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 68, "fit": "exact"},
    {"name": "Matrix.finrank_generatedBy", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 128, "fit": "exact"},
    {"name": "Matrix.finrank_checkedBy", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 135, "fit": "exact"},
    {"name": "Matrix.generatedBy_le_checkedBy_iff", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 143, "fit": "exact"},
    {"name": "TauCeti.LinearCode.exists_isGeneratorMatrix", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 196, "fit": "exact"},
    {"name": "TauCeti.LinearCode.card_eq_card_sub_finrank_of_isParityCheckMatrix_of_linearIndependent", "library": "tauceti", "file": "TauCeti/InformationTheory/Coding/Matrix.lean", "line": 217, "fit": "exact"}],
   "note": "Each declaration is exact for its own clause of this subtarget. Also built: Matrix.mem_generatedBy_iff (line 89) and Matrix.mem_checkedBy_iff (107), the membership criteria; TauCeti.LinearCode.card_eq_finrank_of_isGeneratorMatrix_of_linearIndependent (186), the row count k; TauCeti.LinearCode.IsGeneratorMatrix.mul_transpose_eq_zero (229). None contains sorry."}
  ```
- **New element 1b:**
  ```json
  {"target": "Invariance of the generated code under invertible row operations, deletion of dependent rows, existence of parity-check matrices, and generator of C = check matrix of C^perp",
   "library": "partial",
   "declarations": [],
   "note": "Deleting dependent rows is available only generically (Mathlib's exists_linearIndependent' for the family of rows, with generatedBy_eq_span_rows), and Tau Ceti's span_rowReduce covers only Gauss-Jordan elimination. Missing: invariance of the generated code under an arbitrary invertible row operation, existence of parity-check matrices, and the generator/dual-code check-matrix statement (no dual code is defined)."}
  ```
- **What stays.** The layer `verdict` stays `"partly built"`. The other targets (old elements 0 and 2–5) are unchanged. Element 1b's note is the old note's missing-items text.

**2. Regenerate coverage.** Rerun `scripts/merge_library_audit.py`. Simulated on the edited audit, the Layer 1 evidence becomes 12 entries, exactly the script's cap: the three existing ones and the nine above, in that order. Regeneration also picks up the FIX-RT-AUDIT-16 edits.

**3. Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`, lines 118–119.** Replace "Tau Ceti has no general coding-theory layer. Its finite-field, matrix, polynomial, and root-data material is input, not an alternative representation of codes." with:
> Tau Ceti already has the start of the coding layer, which this roadmap imports rather than rebuilds. At Tau Ceti commit `f790474`:
>
> - `TauCeti/InformationTheory/Coding/Basic.lean`: the aliases `TauCeti.LinearCode` and `TauCeti.AdditiveCode` (Layer 1);
> - `TauCeti/InformationTheory/Coding/Matrix.lean`: `Matrix.generatedBy` and `Matrix.checkedBy`, the predicates `LinearCode.IsGeneratorMatrix` and `LinearCode.IsParityCheckMatrix`, the row-span and syndrome membership criteria, `Matrix.finrank_generatedBy` (dimension = rank), `Matrix.finrank_checkedBy` (dimension = `#ι - rank`), `Matrix.generatedBy_le_checkedBy_iff` (`H * Gᵀ = 0`), `LinearCode.exists_isGeneratorMatrix`, and the row counts `k` and `n-k` of linearly independent generator and check matrices (Layer 1);
> - `TauCeti/LinearAlgebra/FiniteBilinearModule/CoordinatePower.lean`: bilinear and quadratic coordinate powers, their nondegeneracy, the orthogonal-complement and isotropy criteria for subgroups of words, and coordinatewise isometries (Layers 2 and 7).
>
> Tau Ceti's finite-field, matrix, polynomial, and root-data material is input, not an alternative representation of codes.

The list states the pin. The upstream library has grown since, and the maintainer may extend the list to the current library. The coordinate-power import instruction for Layers 2 and 7 is already the accepted request ACT-R01; this note does not repeat it.

### Not done, and why
- **No pin move.** The audit is not re-run at a later Tau Ceti commit (see the rejection of /23).
- **No verdict changes.** No other Layer 1 target changes. The remaining gaps are kept word for word.

## /28 (low, duplicate): rejected; no change
The verifier rejected it because the accepted ACT-O02 already names coding Layer 3, AC.0 and FF.1 together and fixes their roles and shared normalization, so the proposed unconditional coding-L3 → AC.0 edge is not established.

## /29 (low, other): GN.4 names Construction A as its lattice-code construction and owns the real interface

### What the verifier corrected
- **The gap.** GN.4 refers to lattice codes "through FF.4", but FF.4 supplies no code-to-lattice construction; it lists finite evaluation, residue, BCH and Reed–Solomon families. ACT-O03/ACT-R02 already record the unresolved consumer contract.
- **What to do.** Resolve the contract. If Construction A is intended, import coding Layer 6 and plan the real scalar-extension, norm and covolume interface at GN.4; otherwise specify the intended meaning. The edge stays conditional on that decision.
- **The minimum-norm formula.** It needs positive dimension and a convention for the zero code; do not apply it blindly to the zero code or empty coordinates.

### State on main (701638e0)
- **The GN.4 text is unchanged.** `content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md` line 65 (GN.4, "Construct and export") ends: "Include packing/covering and nonconvex star-body problems, transference and Siegel mean-value formulas with their actual covolume/integrability assumptions; connect lattice codes through FF.4."
- **The link map is unchanged.** In the accepted coding link map, ACT-O03 has `"resolutionStatus": "requires_consumer_contract"` and ACT-R02 has `"status": "unresolved_consumer_contract"`.
- **No edge yet.** Layer 6 → GN.4 does not exist; GN.4's only input is GN.3.
- **Support for the Construction A reading.**
  - The GeometryOfNumbers blueprint packet (`research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json`, status `partial`, last changed 27 September) already says, in `gaps[4].detail`: "Coding Construction A is AlgebraicCodingTheory layer 6".
  - ACT-O03 itself identifies Construction A as the only code-to-lattice construction in the atlas.

### Fix

#### The mathematics, from the source read and elementary checks
- **The minimum norm, self-dual case.** Harada–Miezaki §2.4, pp. 6–7, with `A_k(C) = (1/√k){ρ(C) + kZ^n}`: "If C is a self-dual Zk-code of length n, then the lattice … is a unimodular lattice in dimension n … The minimum norm of Ak(C) is min{k, dE(C)/k}." Here `d_E(C)` is the least Euclidean weight of a nonzero codeword (§2.1, p. 4).
- **The general case.** The same argument works for any `C`, with `n ≥ 1`. A nonzero vector of `P_m(C)` either lies in `mℤ^n`, with norm at least `m²`, attained by `m e_i`. Or it reduces to a nonzero codeword `c`, with norm at least `wt_E(c)`, attained by the least-residue lift. Dividing by `m` gives `min(m, d_E(C)/m)`.
  - The formula needs `C ≠ 0`. For `C = 0` the lattice is `√m ℤ^n`, with minimum `m`.
  - For `n = 0` the lattice is `0` and has no minimum.
- **The covolume.** `P_m(C)/mℤ^n ≅ C` gives `[ℤ^n : P_m(C)] = m^n/#C`. So `P_m(C)` has covolume `m^n/#C`, and `m^{-1/2}P_m(C)` has covolume `m^{n/2}/#C`. This agrees with Harada–Miezaki's unimodularity for self-dual `C` (`#C = m^{n/2}`) and with Layer 6's `disc(P_m(C)) = m^(#ι)/(#C)^2`.

#### The edits
**Decision: Construction A.** The four edits below go together. If the GeometryOfNumbers owner means another lattice-code notion, none of them is applied and ACT-R02 stays open until that meaning is written into GN.4.

**1. GN.4 text.** In `content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md`, line 65, replace "Include packing/covering and nonconvex star-body problems, transference and Siegel mean-value formulas with their actual covolume/integrability assumptions; connect lattice codes through FF.4." with:
> Include packing/covering and nonconvex star-body problems, transference and Siegel mean-value formulas with their actual covolume/integrability assumptions. Lattices from codes are Construction A lattices, imported from `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`: for `m ≥ 2` and an additive code `C ≤ (ZMod m)^ι`, the lattice `P_m(C)` in `ℚ^ι` with form `B_m = dot/m`. FF.4 supplies code families, not lattices; a code over a prime field `ZMod p` becomes a lattice only through this construction. GN.4 owns the real interface: the scalar extension of `(ℚ^ι, B_m)` to Euclidean `ℝ^ι`, which carries `P_m(C)` to `m^(-1/2) P_m(C)`; its covolume `m^(#ι/2)/#C`, from the index `m^(#ι)/#C` of `P_m(C)` in `ℤ^ι`; its minimum norm `min(m, d_E(C)/m)` for nonempty `ι` and nonzero `C`, where `d_E(C)` is the least Euclidean weight of a nonzero codeword (the zero code gives `m`, and for empty `ι` the lattice is `0` and has no minimum); and the packing density these give.

The GN.4 stage description in `data/atlas.json` mirrors this line and is regenerated from it.

**2. The link.** Append to `links` in `data/links/tauceti_TauCetiRoadmap_AlgebraicCodingTheory.json`, and in its identical copy under `research/blueprint/links/`:
```json
{"id": "ACT-L11",
 "source": "tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses",
 "target": "GeometryOfNumbersAndQuadraticArithmetic:GN.4",
 "reason": "Coding Layer 6 constructs the Construction A lattice P_m(C) in Q^iota with form B_m = dot/m, for m >= 2 and an additive code C <= (ZMod m)^iota. GN.4 imports it for lattices from codes and owns the real interface: the scalar extension to m^(-1/2) P_m(C), its covolume m^(#iota/2)/#C, its minimum norm min(m, d_E(C)/m) for nonempty iota and nonzero C, and the packing density. Resolves ACT-O03/ACT-R02. FF.4 supplies code families, not lattices, so no FF.4 -> GN.4 edge is implied.",
 "confidence": "explicit",
 "evidence": [
  {"stageId": "tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses",
   "quote": "Let `m ≥ 2` and let `C ≤ (ZMod m)^ι` be an additive code.  Define its standard dual by the\n`ZMod m` dot product and construct `P_m(C)` and `B_m` using the standing convention.",
   "path": "content/tau-ceti/AlgebraicCodingTheory/README.md", "lineStart": 325, "lineEnd": 326},
  {"stageId": "GeometryOfNumbersAndQuadraticArithmetic:GN.4",
   "quote": "Lattices from codes are Construction A lattices, imported from `tauceti:TauCetiRoadmap/AlgebraicCodingTheory#layer-6-construction-a-with-exact-hypotheses`",
   "path": "content/campaign/GeometryOfNumbersAndQuadraticArithmetic/README.md", "lineStart": 65, "lineEnd": 65}]}
```
The cycle test for Layer 6 → GN.4 is acyclic. GN.4 has 8 ancestors (GN.0–GN.3 and four Tau Ceti layers), none of them a coding layer. Layer 6 has no descendants in the assembled graph, and the joint test with the /24 edges is acyclic too. The roadmap's `consumers` then gain GeometryOfNumbersAndQuadraticArithmetic.

**3. Close the contract in the same two files.**
- ACT-O03: `resolutionStatus` changes from `"requires_consumer_contract"` to `"resolved_construction_a"`. Add `"resolution": "GN.4 names Construction A (coding Layer 6) and owns the real scalar-extension, covolume and minimum-norm interface; link ACT-L11 (RT-AREA-combinatorics/29)."`
- ACT-R02: `status` changes from `"unresolved_consumer_contract"` to `"resolved"`, with the same `resolution`.
- `summary`: append " ACT-L11 (coding Layer 6 → GN.4) was added when GN.4 fixed its Construction A contract (RT-AREA-combinatorics/29)."
- `review` and `reviewValidation` stay as they are: they record the 23 September review of ten links. ACT-L11 rests on this finding's verification.

**4. The GN packet.** When the GeometryOfNumbers packet next revises GN.4, the four interface items above become GN.4 nodes. Its `gaps[4]` already points to Layer 6.

### Not done, and why
- **No FF.4 → GN.4 edge.** FF.4 builds no lattices.
- **No packing-density formula written out.** GN.4's own packing theory owns the density. The note fixes only its two inputs, the covolume and the minimum norm.
- **The GN packet is not edited.** It is not in this job's intake.

## /30 (low, error): the self-dual invariance is stated over ℤ, and over ℝ after normalizing the variables

### What the verifier corrected
- **The gap.** Layer 3 leaves implicit the coefficient ring of the self-dual normalized transform, whose `√q` its integral and rational forms do not contain.
- **What to do.**
  - For a Euclidean self-dual linear code, first prove `2·dim C = n`, so `n` is even and `#C = q^(n/2)`.
  - State the division-free identity over `ℤ`, and divide the variables by the positive real `√q` only after base change to `ℝ` (or a named extension).
  - Keep the rational normalization by `#C` distinct from the variable normalization by `√q`.
  - Add no square root to the integral MacWilliams theorem.

### State on main (701638e0)
- **Unchanged.** Layer 3, lines 213–214: "Derive the rational normalized form, the coefficient/Krawtchouk formula, and invariance of the enumerator of a self-dual code under the normalized transform."
- **The rings elsewhere are pinned.** Lines 208–211 state MacWilliams "in the integral, division-free form", and Layer 4 (lines 234–236) pins `ℤ[X,Y]` and `ℤ[i][X,Y]`.
- **The source.** Sloane, arXiv:math/0612535v1, §3, p. 3:
  - "Theorem 1. For a code C over Fq, WC⊥(x, y) = 1/|C| WC(x + (q −1)y, x −y)";
  - "Corollary. If C is self-dual, WC(x, y) is fixed under the “MacWilliams” transformation (x, y) ↦ (1/√q)(x + (q−1)y, x − y)".
- **The derivation.** With `C = C^⊥`, Layer 2's `dim C + dim C^⊥ = #ι` gives `#C = q^(#ι/2)`. The integral identity then reads `W_C(X+(q−1)Y, X−Y) = q^(#ι/2) W_C`. By homogeneity of degree `#ι`, dividing both variables by `√q` gives the normalized form.

### Fix

#### Note for the Tau Ceti maintainer: `AlgebraicCodingTheory/README.md`, Layer 3, lines 213–214
Replace the quoted sentence with:
> Derive the rational normalized form `W_{C^⊥}(X,Y) = (1/#C) · W_C(X+(q-1)Y, X-Y)` in `ℚ[X,Y]` and the coefficient/Krawtchouk formula. For a Euclidean self-dual code (`C = C^⊥`), first prove `2 · dim C = #ι` from `dim C + dim C^⊥ = #ι` (Layer 2), so that `#ι` is even and `#C = q^(#ι/2)`. Then state the self-dual invariance division-free in `ℤ[X,Y]`,
>
> `W_C(X+(q-1)Y, X-Y) = q^(#ι/2) · W_C(X,Y)`,
>
> and in normalized variables only after base change to `ℝ[X,Y]` (or another named coefficient ring containing a square root of `q`), with `√q` the positive real square root:
>
> `W_C((X+(q-1)Y)/√q, (X-Y)/√q) = W_C(X,Y)`.
>
> The rational form divides by `#C`; the normalized-variable form divides the variables by `√q`. No square root enters the integral MacWilliams identity.

The following sentence ("Check the identity on the zero, whole-space, repetition, and single-parity-check codes.") stays.

### Not done, and why
- **Layer 4's binary forms and Suggested.lean are unchanged.** Suggested.lean has no general-`q` self-dual statement, and its binary `typeII_macWilliams_invariance` is already division-free in `ℤ`.
- **No edge.** The use of Layer 2's dimension formula is covered by the /24 edge L2 → L3.

## DenseGraphLimits (/31–/44): conventions

- **The roadmap is unchanged.** `content/tau-ceti/DenseGraphLimits/README.md` has not changed since 16 September. Upstream `TauCetiRoadmap/DenseGraphLimits/README.md` at `main` (29 September) has sha256 `814e7690…`, equal to the atlas `sourceSha256`. So every quotation below also holds upstream.
- **Line numbers** are those of the snapshot at `701638e0`. Quotations ignore line wrapping, and each quoted old text occurs exactly once unless the section says otherwise.
- **`Suggested.lean`** is upstream's `TauCetiRoadmap/DenseGraphLimits/Suggested.lean` at `main`, since the atlas has no copy.
- **Stage names.** `L0` … `L9c` are the 13 stages `tauceti:TauCetiRoadmap/DenseGraphLimits#layer-…`. `OT0` is `tauceti:TauCetiRoadmap/OptimalTransport#layer-0-transport-plans-maps-kernels-and-gluing`.
- **Declarations** were read at Mathlib `082e2d3` and Tau Ceti `f790474`. Post-pin upstream files are cited only as information for the maintainer. They never upgrade a pinned verdict.
- **File paths.** A Tau Ceti path without a `TauCeti/` prefix is relative to `TauCeti/Combinatorics/DenseGraphLimits/`. Mathlib paths start with `Mathlib/`.

## /31 (high, error): rejected; no change

The verifier rejected the claim that every route to the separation converse goes through the sampling lemma: Janson Thm 8.10 also cites Borgs–Chayes–Lovász's uniqueness proof (§§5.3–5.4), which does not use Layer 9c. The confirmed parts are handled in /32, /40 and /42.

## /32 (medium, missing): Layer 9c's in-probability mode names its sampled-cut, equipartition, frequency, rounding and concentration inputs

### What the verifier corrected
- The in-probability branch cites LNGL Lemma 10.16. Its proof uses the kernel sampling estimate 10.6 and the equipartition approximation of Lemma 9.15.
- **Why a naive union bound fails.** Lemmas 10.7–10.9 bound a supremum over sampled cuts. Vertex-exposure Azuma plus a naive union bound does not supply them, and the pinned migration source says so.
- **What to add.** Named sampled-cut expectation and high-probability inputs, and equipartition and rounding inputs, each with its hypotheses and estimates. Then apply the existing bounded-differences engine.
- The gap is real whatever route the separation converse takes.

### State on main (701638e0)
- **README, Layer 9c, lines 530–533.** "`sampleGraph_cutDist_tendsto_inProbability`, the second sampling lemma `δ□(G(n,W), W) → 0` (LNGL Lemma 10.16), a statement about the marginals alone, via the two-stage first-sampling-lemma decomposition: point sampling (the analytic Azuma step on the weighted sampled graphon) plus Bernoulli edge rounding (a finite union bound over cuts)".
- **`Suggested.lean`, line 655,** has the same "point sampling (the genuinely analytic Azuma step, on the weighted sampled graphon)".
- **What no layer names:** LNGL 10.6–10.9, 9.15(b), 10.11, or the concentration step.
- **Pins.** Tau Ceti has two of the ingredients:
  - McDiarmid, `TauCeti.Probability.hasSubgaussianMGF_of_bounded_differences` (`TauCeti/Probability/McDiarmid.lean:357`), for a function on a finite i.i.d. product;
  - the padded exposure `exposureMeasure` (`Sampling/Exposure.lean:84`) with its law identification `map_exposedSample` (`:248`).

  No file under `Sampling/` mentions `cutDist` or `cutNorm`, and neither library has a sampled cut-norm estimate. `data/library-coverage.json` classes the second sampling lemma as `absent`. Nothing has changed since the verification.
- **Reading note.** In the LNGL draft, Lemma 10.7 (printed p. 160) displays `‖·‖□`, but the sentence before it and its proof concern the one-sided `‖·‖⁺□`.

### Fix
**Note for the Tau Ceti maintainer: README, Layer 9c, first bullet.** Replace "via the two-stage first-sampling-lemma decomposition: point sampling (the analytic Azuma step on the weighted sampled graphon) plus Bernoulli edge rounding (a finite union bound over cuts)" with:

> via LNGL's proof of Lemma 10.16 (printed pp. 165–166), which bounds the expectation of the cut distance and then concentrates it. Each input is a named target:
> 1. **Equipartition approximation** (LNGL Lemma 9.15(b), p. 147).
>    - The statement: on `(I, volume)`, for every `m`-part partition `Q` there is an equipartition `P` into `k` classes with `‖W − W_P‖□ ≤ 2‖W − W_Q‖□ + 2m/k`.
>    - With Layer 2's weak regularity it gives the equipartition 10.16 uses: `m = ⌈k^{1/4}⌉` classes and `‖W − W_P‖□ ≤ 8/√(log k)`.
>    - It needs an atomless carrier. A standard Borel carrier is reached by pulling back along a measure-preserving map from `(I, volume)`. That changes neither the cut class nor `sampleGraph W n`; the second invariance is its own node.
> 2. **The sampled cut-norm estimate:** the First Sampling Lemma for kernels (LNGL Lemma 10.6, p. 160).
>    - The statement: let `U : [0,1]² → [−1,1]` be symmetric and measurable, and let `X` be `k` independent uniform points. Then with probability at least `1 − 4e^{−√k/10}`,
>      `−3/k ≤ ‖U[X]‖□ − ‖U‖□ ≤ 8/k^{1/4}`,
>      where `U[X] = (U(Xᵢ, Xⱼ))ᵢⱼ` and `‖A‖□ = k⁻² max_{S,T⊆[k]} |Σ_{i∈S, j∈T} Aᵢⱼ|`.
>    - Its own nodes:
>      - the one-sided form for `‖·‖⁺□` (Lemma 10.7, with probability at least `1 − 2e^{−√k/10}`), applied to `U` and to `−U`;
>      - Lemma 10.8: for `B = U[X]`, `S₁, S₂ ⊆ [k]` and a random `q`-subset `Q`, `B(S₁, S₂) ≤ E_Q B((Q ∩ S₂)⁺, S₂) + k²/√q`;
>      - Lemma 10.9: `‖B‖⁺□ ≤ k⁻² E_{Q₁,Q₂} max_{Rᵢ⊆Qᵢ} B(R₂⁺, R₁⁺) + 2/√q` (pp. 161–162).
>    - **The lower bound** is an expectation computation followed by concentration.
>    - **The upper bound is not vertex-exposure concentration plus a union bound over the `4^k` cuts.** Those tails are `exp(−cε²k)` and lose to `4^k`. Lemmas 10.8–10.9 first reduce the maximum to `4^q` cuts with `q = ⌊√k/4⌋`. Only then are concentration and a union bound applied.
> 3. **Cell frequencies** (p. 165). `W_P` and the step graphon of the sample `W_P[S]` differ only in their step masses `1/m + rᵢ`. So `δ□(W_P, W_P[S]) ≤ Σᵢ |rᵢ|`, with expectation at most `√((m−1)/k)`.
> 4. **Bernoulli edge rounding** (LNGL Lemma 10.11, p. 163). Let `H` be an edge-weighted graph on `q` nodes with weights in `[0,1]`, and let `ε ≥ 10/√q`. Then `P(d□(G(H), H) > ε) ≤ e^{−ε²q²/100}`, by a union bound over the `3^q` pairs of disjoint sets. Hence `E d□(G(H), H) ≤ 11/√q`.
> 5. **Concentration.**
>    - Items 1–4 give `E δ□(G(k, W), W) ≤ 20/√(log k)`.
>    - A bounded-differences step then gives `δ□(G(k, W), W) ≤ 22/√(log k)` with probability at least `1 − exp(−k/(2 log k))`. LNGL applies its Sample Concentration Theorem 10.3 (p. 159) to `f(G) = v(G)·δ□(G, W)`.
>    - Here that step is Tau Ceti's McDiarmid inequality on the padded vertex exposure (`exposureMeasure`, `map_exposedSample`). Its own node is a bounded-differences bound for `G ↦ δ□(G, W)` when the edges at one vertex change.

The rest of the bullet ("— with the Mathlib-idiomatic joint packaging …") stays.

**`Suggested.lean`, docstring of `sampleGraph_cutDist_tendsto_inProbability` (lines 653–658).** Replace "via the **two-stage first-sampling-lemma decomposition**: point sampling (the genuinely analytic Azuma step, on the weighted sampled graphon) + Bernoulli edge rounding (a finite union bound over cuts)" with:

> via LNGL's proof of Lemma 10.16. An expectation bound comes from the equipartition approximation (9.15(b)), the First Sampling Lemma for kernels (10.6, through 10.7–10.9), cell frequencies and edge rounding (10.11); bounded-differences concentration follows. See `README.md`, Layer 9c.

The atlas edge L2 → L9c that this introduces is row 14 of /40's table.

### Not done, and why
- **No route is chosen here.** This does not decide how the separation converse is proved (/31 is rejected). Splitting 9c waits for that choice (/40).
- **The constants are LNGL's.** A Tau Ceti statement may use other explicit constants.
- **The Lemma 10.7 display is not logged as an erratum,** because the published book was not checked.

## /33 (medium, error): the atomless mod-null equivalence moves to Layer 0 and gates only Layer 4; Layer 5 and the Layer 6a reduction do not use it

### What the verifier corrected
- **The defect.** Layer 5 houses the atomless mod-null equivalence for Layer 4 and calls itself non-blocking. The Ordering wrongly gates the coupling/map identity on that equivalence.
- **The pin.** At f790474, `cutDist_eq_cutDistPullback` is proved for standard Borel carriers, atoms allowed, via the A.9 map. `unitIntervalModel` uses the same map.
- **What to do.**
  - Separate the general atomless isomorphism prerequisite, record its compactness consumer, and correct the Ordering.
  - For the arbitrary-carrier representation, keep Janson 7.3's two-coordinate factorization before applying A.9. The standard-Borel theorem alone is not the carrier-free result.
  - Do not mark Layer 5 complete merely by moving one target.

### State on main (701638e0)
- **README.**
  - Layer 5, lines 304–308: "The proof rests on that map (`exists_measurePreserving_from_unitInterval`, build it here); the stronger **atomless mod-null equivalence** (`exists_mpModNull_equiv_unitInterval`) is also built here, as the transport the compactness realignment (Layer 4) runs on. Independent of the spine, so it runs in parallel; it does not block the other layers."
  - Ordering, lines 676–678: "Layer 5 (coupling↔map) runs in parallel, gated on the measure-preserving mod-null equivalence, and must not block the others."
- **`Suggested.lean`.** Line 424 calls the mod-null target a "**Layer 4/5 prerequisite**". The Janson 7.1 docstring (lines 434–440) says "`Ω × [0,1]` then reaches `(I, volume)` by the atomless transport".
- **Pins.**
  - `cutDist_eq_cutDistPullback [StandardBorelSpace Ω₁] [StandardBorelSpace Ω₂]` is at `CutMetric/Pullback/Basic.lean:263`. Line 80 of that file says the mod-null equivalence "is the layer's other target and is not built here".
  - `unitIntervalModel` (`CutMetric/UnitIntervalModel.lean:66`) is `V.comap` along the A.9 map, and gives `exists_graphon_unitInterval_cutDist_eq_zero_of_standardBorel` (`:82`). The file header says that the arbitrary-carrier theorem (Janson 7.1) "is not proved here".
  - Neither library has a measure-isomorphism theorem. Nothing has changed since the verification.
- **Janson v3, proof of Thm 7.1 (p. 20).** Lemma 7.3 gives `W ≅ V` on a Borel space. Then "let Ω2 := Ω×[0, 1] … by Theorem A.7 there exists a measure-preserving bijection ψ : [0, 1] → Ω2. Hence U := V_2^ψ". Only the pull-back is used, so the measure-preserving map of Thm A.9 (p. 52) serves.

### Fix
**Notes for the Tau Ceti maintainer: README.**
1. **Layer 0.** Replace "and the standard-Borel plumbing." with:
   > and the standard-Borel plumbing, including the **atomless mod-null equivalence** with `(I, volume)` (`exists_mpModNull_equiv_unitInterval`; Janson, Thm A.7, even gives a measure-preserving bijection), whose consumer is Layer 4.
2. **Layer 5.** Replace the passage quoted above (lines 304–308) with the following, which also carries /43:
   > The proof rests on that map. Mathlib already proves it (`MeasureTheory.Measure.exists_measurable_map_eq`, for a nonempty standard Borel space), and Tau Ceti packages it as `MeasurePreserving` without the `Nonempty` hypothesis (`exists_measurePreserving_from_unitInterval`). The atomless mod-null equivalence is not an input of this layer: it is a Layer 0 prerequisite of Layer 4. This layer is independent of the spine, so it runs in parallel and does not block the other layers. Its validation gate (the Dirac, finite-atomic and mixed regressions against `cutDist_eq_cutDistPullback`) stays.
3. **Layer 6a.** After "Janson, Thm 7.1, every graphon is at cut distance zero from one on `(I, volume)`" insert:
   > — by Janson's Lemma 7.3 factorization through a Borel carrier (the kernel is measurable for a countably generated sub-σ-algebra), then a pull-back along a measure-preserving map from `(I, volume)` (Janson, Thm A.9); no atomless mod-null equivalence is needed
4. **Ordering.** Replace "Layer 5 (coupling↔map) runs in parallel, gated on the measure-preserving mod-null equivalence, and must not block the others." with:
   > Layer 5 (coupling↔map) runs in parallel and must not block the others. It needs only the measure-preserving map of Janson Thm A.9, which Mathlib supplies. The atomless mod-null equivalence (Layer 0) gates only Layer 4.
5. **Layer 4 and the two prerequisite lists.** Layer 4's new text (/34) ends with the transport through the Layer 0 equivalence. The prerequisite lists are corrected in /43.

**`Suggested.lean`.**
- Line 424: replace "**Layer 4/5 prerequisite (mod-null transport, atomless).**" with "**Layer 0 prerequisite of Layer 4 (mod-null transport, atomless).**".
- Lines 437–438: replace "(Janson, Lemma 7.3), and `Ω × [0,1]` then reaches `(I, volume)` by the atomless transport." with:
  > (Janson, Lemma 7.3), and that Borel carrier then reaches `(I, volume)` by pulling back along a measure-preserving map from `(I, volume)` (Janson, Thm A.9), which leaves the cut class unchanged. Janson passes through `Ω × [0,1]` and Thm A.7 only to produce such a pull-back.

**Atlas.** Edge L0 → L4, taken once note 1 lands (row 6 of /40's table).

### Not done, and why
- **Layer 5 is not marked complete.** Its regression gate stays, and stage statuses come from the Tau Ceti Progress page (/40).
- **The equivalence is still unbuilt at the pin.** This note only rehomes it. Upstream's `STATUS.md` of 26 September reports the atomless mod-null transport as proved after the pin; that is not used here.

## /34 (medium, missing): Layer 4 states its compactness route as named construction targets

### What the verifier corrected
- **The gap.** Layer 4 does not state its realignment or conditional-expectation/martingale construction contracts.
- **LNGL's route.** Thm 9.23 (printed pp. 149–150) uses compatible nested step approximants, subsequential limiting block data and a bounded martingale.
- **The migration source** records why unrestricted bijective map alignment, and alignment of partitions with unequal cell masses, are false.
- **The contract.** State a complete chosen route:
  - compatible finite partition data;
  - null cells;
  - limiting refinement and tower identities;
  - a strict graphon representative;
  - `L¹` and cut convergence.
- **What is not enough.** Interval blocks alone are not the proof: the limit compatibility must also be proved. Mathlib's `Submartingale.ae_tendsto_limitProcess` is an input, not the graphon assembly.

### State on main (701638e0)
- **README, Layer 4, lines 293–298.** "The two analytic inputs are a measure-preserving **realignment** of cut-distance-Cauchy sequences (Birkhoff–von Neumann / Rokhlin) and a dyadic **conditional-expectation + martingale `L¹`-Cauchy** approximation; Mathlib's `condExp` and martingale convergence are the engine."
- **Pin: Layer 4 itself.** The layer's only material is `totallyBounded_graphonSpaceI` (`GraphonSpace/TotallyBounded.lean:69`). `data/library-coverage.json` classes Layer 4 as `not built`.
- **Pin: the inputs the route below uses.**
  - `exists_refinement_energy_add_sq_le` (`StepGraphon/Regularity.lean:62`): one measurable refinement `Q ≤ P` with at most four times as many parts and energy at least `ε²` higher;
  - `graphonPartitionEnergy_le_one` (`StepGraphon/Energy.lean:275`);
  - `Graphon.ofMatrix` (`Graphon/OfMatrix.lean:64`) and `exists_ofMatrix_eq_comap_of_factorsThrough` (`:91`);
  - `cutDist_comap_right` (`CutMetric/Triangle.lean:211`);
  - `exists_graphon_repr` (`AEEqFun.lean:276`, no standard-Borel hypothesis);
  - `cutNorm_le_integral_abs` (`Kernel/CutNorm.lean:214`);
  - Mathlib's `MeasureTheory.Submartingale.ae_tendsto_limitProcess` (`Mathlib/Probability/Martingale/Convergence.lean:209`).
- **LNGL Thm 9.23, proof (pp. 149–150).**
  - The approximants satisfy "(i) ‖Wn − Wn,k‖□ ≤ 1/k, (ii) The partition Pn,k+1 refines Pn,k, (iii) |Pn,k| = mk depends only on k".
  - The proof then says: "we can rearrange the points of [0, 1] for every fixed n by a measure preserving bijection so that every partition class in every Pn,k is an interval".
  - The limits satisfy the tower identity (9.10), `Uk = (Ul)Pk`, and "the Martingale Convergence Theorem A.12" finishes.
- **Migration source** (`cameronfreer/graphon` at `6eccca5`, `Graphon/CutDistance.lean`, about lines 1038–1057): "Map alignment via bijections is FALSE"; "Arbitrary-partition alignment is FALSE unless the cell measures match"; "Controlled cell alignment needs `[NullSingletonClass μ]`".

### Fix
**Note for the Tau Ceti maintainer: README, Layer 4.** Replace the sentence quoted above ("The two analytic inputs are … are the engine.") with:

> The route is LNGL Thm 9.23 (printed pp. 149–150), with each step a named target:
> 1. **Refining weak regularity** (LNGL Lemma 9.15(a)). For a graphon `W`, a measurable finite partition `Q` and `ε > 0`, there is a measurable refinement `P ≤ Q` with `|P| ≤ 4^{⌈1/ε²⌉+1}·|Q|` and `‖W − stepGraphonAvg P W‖□ ≤ ε`. It is proved by iterating Layer 2's `exists_refinement_energy_add_sq_le`, since the energy stays in `[0, 1]`.
> 2. **Compatible finite partition data.** For a sequence `(Wₙ)` on `(I, volume)`, take partitions `P_{n,1} ≥ P_{n,2} ≥ ⋯` with `‖Wₙ − (Wₙ)_{P_{n,k}}‖□ ≤ 1/k`.
>    - They are indexed by one finite tree: level `k` has `m_k` cells, and each cell of level `k+1` has a fixed parent. `m_k` and the parent map do not depend on `n`.
>    - Cells may be empty or null. On null blocks, block values follow `stepGraphonAvg`'s set-average convention.
> 3. **Interval realignment, without a bijection.**
>    - Block data `(a, b)` are cell masses `aᵢ ≥ 0` summing to `1` and symmetric values `bᵢⱼ ∈ [0,1]`.
>    - `V_{a,b}` is the step graphon on `(I, volume)` equal to `bᵢⱼ` on `Jᵢ × Jⱼ`. Here `J₁, …, J_m` are consecutive intervals of lengths `a₁, …, a_m`, ordered along the tree so that the intervals of level `k+1` refine those of level `k`.
>    - The target: every step graphon with block data `(a, b)` on any probability carrier is at cut distance `0` from `V_{a,b}`. Both are pullbacks of `Graphon.ofMatrix` on `(Fin m, a)` along measure-preserving index maps (`exists_ofMatrix_eq_comap_of_factorsThrough`, `cutDist_comap_right`).
>    - This replaces LNGL's measure-preserving bijection. Two things would be false: an unrestricted bijective alignment of maps, and an alignment of partitions whose cell masses differ. No measure-isomorphism theorem is needed.
> 4. **Convergent block data.** A diagonal subsequence along which, for every `k`, all masses `a_{n,k,i}` and values `b_{n,k,ij}` converge (LNGL Claim 9.24). The limits define interval step graphons `U_k`, and `V_{n,k} → U_k` almost everywhere and in `L¹`, because the interval endpoints converge.
> 5. **Limit tower identity.** `U_k = (U_l)_{J_k}` for `k < l`, where `J_k` is the limiting interval partition; cells whose mass tends to `0` become null cells. Equivalently, `U_k =ᵐ E[U_l | σ(J_k × J_k)]`, by Layer 3's identification of block averages with conditional expectation (LNGL (9.10)).
> 6. **Martingale limit.** `(U_k)` is a martingale for the filtration `σ(J_k × J_k)` on `(I × I, volume)`, bounded in `[0,1]`. So it converges almost everywhere and in `L¹` (Mathlib's `Submartingale.ae_tendsto_limitProcess`). The limit is a.e. symmetric and `[0,1]`-valued, and has a strict graphon representative `U` (Layer 3's `exists_graphon_repr`).
> 7. **Assembly.**
>    - The estimate is `δ□(U, Wₙ) ≤ ‖U − U_k‖₁ + ‖U_k − V_{n,k}‖₁ + δ□(V_{n,k}, Wₙ)`, by Layer 1's cut-norm `L¹` bound and the triangle inequality, with `δ□(V_{n,k}, Wₙ) ≤ 1/k`.
>    - So every sequence in `GraphonSpaceI` has a convergent subsequence.
>
> Other atomless standard Borel carriers are reached through the atomless mod-null equivalence of Layer 0.

The sentence "Pinned: `instance : CompactSpace GraphonSpaceI` …" stays.

**Two prerequisite lists.** "reusable **conditional-expectation / dyadic-martingale `L¹`-convergence** lemmas (Layer 4)" occurs twice (lines 206 and 572). In both, replace "dyadic-martingale `L¹`-convergence" with "martingale `L¹`-convergence along a refining sequence of finite partitions".

**Atlas.** Step 1 names Layer 2 and step 5 names Layer 3, so the edges L2 → L4 and L3 → L4 of /40 are explicit once this text lands.

### Not done, and why
- **Nothing here is built at the pin,** and no proof is claimed. The realignment of step 3 replaces LNGL's bijection by a comparison at cut distance zero; steps 4–7 are still required.
- **Post-pin,** upstream reports `GraphonSpaceI.instCompactSpace` proved. Its route was not checked.

## /35 (medium, missing): Layer 3 gains the bridge from block averages to conditional expectation, with its tower corollary

### What the verifier corrected
- **The gap.** Layer 2 defers the identification of `stepGraphonAvg` with conditional expectation to Layer 3, but Layer 3 lists only the `AEEqFun` and observable-invariance targets. At the pin, `Energy.lean:41` still defers it, and no such theorem exists.
- **What to add.** The a.e. equality with the conditional expectation onto the σ-algebra of partition rectangles, and its refinement (tower) corollary. The sub-σ-algebra, measurability and integrability hypotheses must be explicit. Place it before the Layer 4 martingale route.
- **The audit.** Keep the old `built` classification of Layer 3's existing targets. Record the added target as missing; do not retroactively declare those proofs absent.

### State on main (701638e0)
- **README, Layer 2, lines 267–268.** "**Layer 3** later relates this to the general AE / conditional-expectation interface."
- **README, Layer 3, lines 283–290.** It lists `toAEEqFun`, a measurable-representative section, `homDensity_congr_ae`, `cutNorm_congr_ae` and `cutDist_eq_zero_of_aeEq`. None of them makes the identification.
- **Pin.** `StepGraphon/Energy.lean:41` says: "the identification with `MeasureTheory.condExp` belongs to the later a.e. layer, and nothing here needs it". `condExp` occurs nowhere else under `Combinatorics/DenseGraphLimits`.
- **Coverage.** `data/library-coverage.json`, Layer 2: "Not yet identified with MeasureTheory.condExp, which the roadmap defers to Layer 3/4". Layer 3: `built`. Nothing has changed since the verification.

### Fix
**Note for the Tau Ceti maintainer: README, Layer 3.** After "proving the observables factor through the a.e. class." insert:

> The layer also owns the **block-average bridge** (suggested name `stepGraphonAvg_ae_eq_condExp`). Let `P` be a finite partition of `Ω` into measurable parts, let `W` be a graphon, and let `σ(P × P)` be the σ-algebra on `Ω × Ω` generated by the rectangles `p ×ˢ q` (`p, q ∈ P`). This σ-algebra lies below the product σ-algebra, and `μ ⊗ μ` is finite on it.
> - **The bridge:** `stepGraphonAvg P W =ᵐ[μ ⊗ μ] (μ ⊗ μ)[W | σ(P × P)]`.
>   - The statement carries the sub-σ-algebra, the measurability of the parts and the integrability of `W` as explicit hypotheses.
>   - The proof is Mathlib's `ae_eq_condExp_of_forall_setIntegral_eq`, fed by the block-integral identity `stepGraphonAvg_rectIntegral`, null rectangles included.
> - **Its tower corollary.** For a refinement `Q ≤ P`:
>   - `stepGraphonAvg P (stepGraphonAvg Q W) = stepGraphonAvg P W` holds as strict equality, from `stepGraphonAvg_rectIntegral_of_le_of_le`;
>   - `(μ ⊗ μ)[stepGraphonAvg Q W | σ(P × P)] =ᵐ stepGraphonAvg P W`.
>
> These are the inputs that make Layer 4's step functions a martingale.

**The library and the coverage.**
- **Mathlib.** `MeasureTheory.ae_eq_condExp_of_forall_setIntegral_eq` (`Mathlib/MeasureTheory/Function/ConditionalExpectation/Basic.lean:254`) and `MeasureTheory.condExp_condExp_of_le` (`:345`).
- **Tau Ceti.** `stepGraphonAvg_rectIntegral` (`StepGraphon/Average.lean:167`) and `stepGraphonAvg_rectIntegral_of_le_of_le` (`StepGraphon/Energy.lean:137`).
- **Coverage.** When the README change lands, the next audit of this roadmap adds the target to Layer 3 as `absent`. The four existing Layer 3 targets keep `tauceti`. The layer verdict then follows the audit's rule for a layer with an absent target, which records a new target and not a defect in the old ones. `data/library-coverage.json` is generated and is not edited now.

**Atlas.** Edge L3 → L4 (row 4 of /40's table, already explicit in the README).

### Not done, and why
The bridge is not built at the pin, and nothing is claimed proved. The strict tower identity is stated as a target with its route.

## /36 (medium, missing): Layer 8b pins the easy direction — reflection positivity of `t(·, W)` — with a regression showing that the `[0,1]` range is needed

### What the verifier corrected
- **The proof.** LS06 (arXiv math/0408173v2, §5.5, p. 21) proves reflection positivity through nonnegative supergraph weights with factors `W` and `1 − W`. Simple-graph gluing merges shared labeled edges.
- This is a missing named part of the iff's easy direction, not merely multiplicativity.
- **The counterexample.** The two fully labeled graphs give the matrix `[[1,2],[2,2]]`, whose quadratic form is `−2` at `(−2, 1)`. So the `[0,1]` restriction matters.
- **What to add.** `isReflectionPositive_homDensity`, combined with the built isomorphism, disjoint-union and normalization lemmas. The regression parameter counts each unordered edge once.

### State on main (701638e0)
- **The roadmap.** README Layer 8b pins a spine for the hard direction only (lines 374–400). Nothing names the easy direction. `Suggested.lean`, lines 1218–1219, says only: "The easy direction checks the four axioms for `t(·, W)`."
- **Pin: what exists.**
  - `IsReflectionPositive` (`Representability/ConnectionMatrix.lean:137`), whose only negative regression is `not_isReflectionPositive_neg_one` (`:247`);
  - `homDensity_eq_of_iso` (`HomDensity/Structural.lean:100`), `homDensity_sum` (`:192`) and `homDensity_bot` (`:89`).
- **Pin: what is missing.** No theorem proves `IsReflectionPositive` for `homDensity`. `data/library-coverage.json`, Layer 8b: "even the easy direction … is only available through ingredients such as homDensity_sum and homDensity_eq_of_iso". Nothing has changed since the verification.
- **The sources.**
  - LS06 §2.3 (p. 5) defines gluing "and then cancelling the resulting multiplicities of edges".
  - LS06 §5.5 (p. 21) uses `Ŵ(F) = ∏_{E(F)} W(xᵢ,xⱼ) ∏_{E(F̄)} (1 − W(xᵢ,xⱼ)) ≥ 0` and `W(F) = Σ_{H⊃F} Ŵ(H)`.
  - LNGL Prop 7.1 (printed pp. 118–119): the simple-graph parameter `t(·, W)` "is reflection positive if W ∈ W0". The proof ends: "nonnegative by the assumption that 0 ≤ W ≤ 1".

### Fix
**Note for the Tau Ceti maintainer: README, Layer 8b.** Before "**The proof spine, pinned**" insert:

> **The easy direction, pinned.** `isReflectionPositive_homDensity`: for a graphon `W` on any probability carrier, the graph parameter `(n, F) ↦ homDensity F W` is reflection positive.
> - **Why it is not the bare Cauchy–Schwarz argument.** Gluing merges the edges two labeled graphs share among their labeled vertices, so the product of two partial integrals is not enough.
> - **The proof** (Lovász–Szegedy, *Limits of dense graph sequences*, §5.5, (b)⇒(c); LNGL Prop 7.1) expands the product over the labeled edges as a sum, over supergraphs `H` on the labels, of the nonnegative weights `∏_{E(H)} W · ∏_{E(H̄)} (1 − W)`. It uses `0 ≤ W ≤ 1`.
> - **With the built lemmas** — `homDensity_eq_of_iso` (isomorphism invariance), `homDensity_sum` (multiplicativity, reindexed along `finSumFinEquiv`) and `homDensity_bot` (normalization) — it gives the easy direction of `lovasz_szegedy_representability`.
> - **Regression.** The parameter `(n, F) ↦ 2^{|E(F)|}`, counting each unordered edge once (`Nat.card F.edgeSet`), is isomorphism invariant, multiplicative and normalized, but not reflection positive. For `k = 2`, take the two fully labeled graphs on the two labels, without and with the edge. The edge merges when glued with itself, so the connection matrix is `[[1, 2], [2, 2]]`, whose quadratic form is `−2` at `(−2, 1)`. The `[0,1]` range of `W` is essential.

**`Suggested.lean`, lines 1218–1219.** Replace "The easy direction checks the four axioms for `t(·, W)`." with:

> The easy direction is `isReflectionPositive_homDensity`, with `homDensity_eq_of_iso`, `homDensity_sum` and `homDensity_bot`.

### Not done, and why
The theorem is unbuilt at the pin, and nothing is claimed proved. No atlas edge is needed: Layer 8b already receives Layer 1 through L1 → L9b → L8b (/40).

## /37 (medium, duplicate): one coupling relation, owned by OptimalTransport Layer 0, with a bridge from the second predicate

### What the verifier corrected
- **The pin has the same marginal condition twice.**
  - `TauCeti.MeasureTheory.IsCoupling mu1 mu2 pi` is a conjunction.
  - `TauCeti.IsCoupling pi mu nu` is a Prop-valued structure with fields `fst_eq` and `snd_eq`.
- **The triangle uses both.** The cut-metric triangle imports OptimalTransport's gluing and converts the same marginal data. No roadmap edge reconciles ownership.
- **What to add.** The coupling/gluing supply, and a canonical bridge/reuse contract, with a maintainer note for any library consolidation.
- **Both are Props, and neither is a typeclass.** A Prop-valued structure is no mathematical obstruction. Deprecation or renaming is the maintainer's choice, not required atlas work.

### State on main (701638e0)
- **DenseGraphLimits README.**
  - Layer 1, line 244: "(with `IsCoupling` and `overlayDiff`)".
  - Convention 5, lines 60–61: "`IsCoupling` is a **named `Prop`** (deliberately not a structure or typeclass — a coupling of given marginals is not canonical)".
  - The same position appears in the Suggested-signatures paragraph (lines 652–654) and in the reviewer checklist (line 829).
- **OptimalTransport README, Layer 0.** Item 1 (line 350): "Define the raw coupling relation for arbitrary measures and the bundled probability coupling space". Item 4 (line 369): "Prove the gluing lemma".
- **Pin: the two predicates.**

  | Predicate | Location | Form | Swap | Product coupling |
  |---|---|---|---|---|
  | `TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π` | `TauCeti/MeasureTheory/Measure/Coupling/Basic.lean:68` | `def … : Prop := π.fst = μ₁ ∧ π.snd = μ₂` | `:116` | `:110` |
  | `TauCeti.IsCoupling π μ ν` | `TauCeti/MeasureTheory/OptimalTransport/Coupling.lean:102` | `structure … : Prop` with `fst_eq`, `snd_eq` | `:204` | `:312` |

  The first file's header calls it "the carrier-independent coupling API used by the dense graph limit theory". The second says "This is Layer 0, item 1 of the optimal-transport roadmap".
- **Pin: the triangle inequality.** `CutMetric/Triangle.lean` imports `TauCeti.MeasureTheory.OptimalTransport.Gluing`. It uses `exists_glue_of_countable_middle` (`TauCeti/MeasureTheory/OptimalTransport/Gluing.lean:388`), which is stated on raw marginals `π.snd = σ.fst`, and converts through `isCoupling_iff`. No lemma relates the two predicates.
- **Atlas and audit.** No stage edge joins the two roadmaps. The AUDIT-16 duplicate note on Layer 1 names only the gluing lemma.

### Fix
**Ownership.** OptimalTransport Layer 0 is the single owner of the coupling relation (item 1) and of gluing (item 4). DenseGraphLimits Layer 1 consumes both. Neither roadmap plans a second relation.

**Notes for the Tau Ceti maintainer.**
1. **DenseGraphLimits README.**
   - **Convention 5.** Replace "`IsCoupling` is a **named `Prop`** (deliberately not a structure or typeclass — a coupling of given marginals is not canonical)" with:
     > `IsCoupling` is a **`Prop`** (never a typeclass or a data-carrying structure — a coupling of given marginals is not canonical). It is the coupling relation of the optimal-transport roadmap (Layer 0, item 1), not a second definition
   - **Layer 1.** Replace "(with `IsCoupling` and `overlayDiff`)" with the following; /44's Layer 1 replacement already carries it:
     > (with `overlayDiff`, over the coupling relation `IsCoupling` that [OptimalTransport Layer 0](../OptimalTransport/README.md) owns, item 1)
   - **Suggested signatures.** Replace "An `IsCoupling` *structure/class* is **deliberately not** introduced — a coupling of given marginals is not canonical, so typeclass resolution would pick an arbitrary one; the `Prop` + `isProbabilityMeasure_of_isCoupling` is the right pattern." with:
     > No `IsCoupling` typeclass is introduced: a coupling of given marginals is not canonical, so typeclass resolution would pick an arbitrary one. The relation is a `Prop`; OptimalTransport's Prop-valued structure `TauCeti.IsCoupling` qualifies. It is used with `isProbabilityMeasure_of_isCoupling`.
   - **Reviewer checklist.** Replace "Is `IsCoupling` a named `Prop` (not a structure/typeclass), matching the vocabulary and docstring?" with:
     > Is `IsCoupling` a `Prop` (not a typeclass), consumed from OptimalTransport Layer 0 rather than defined a second time?
2. **OptimalTransport README, Layer 0.** Before "Acceptance checks: a coupling of two Dirac measures is unique;" insert:
   > **Consumers outside this roadmap.** The dense-graph-limits roadmap uses:
   > - the coupling relation of item 1, for its coupling cut distance;
   > - the countable-middle case of the gluing lemma of item 4, for the cut-distance triangle inequality;
   > - the countable projective-family extension theorem of item 4, for its finite-to-infinite exchangeable graph laws (/41).
   >
   > It defines none of them again.
3. **Library contract.**
   - A bridge `TauCeti.MeasureTheory.IsCoupling μ₁ μ₂ π ↔ TauCeti.IsCoupling π μ₁ μ₂`. Both sides are `π.fst = μ₁ ∧ π.snd = μ₂`, so the coupling lemmas of either file apply to the other.
   - The gluing lemma is consumed as it is now.
   - Deprecating or renaming one predicate is the maintainer's choice.

**Atlas.**
- **The link.** OT0 → L1, recorded as a stage link in a DenseGraphLimits link map (row 26 of /40's table), reviewed under PROTOCOL §10. After the /44 relocation it also applies to L2 (row 28).
- **The duplicate note (optional).** `research/blueprint/audit/AUDIT-16.result.json`, `roadmaps["tauceti:TauCetiRoadmap/DenseGraphLimits"].layers["…#layer-1--core-objects-and-their-basic-api"].duplicates[0].note`:
  - old: "Proves the gluing lemma for couplings that the cut-distance triangle inequality rests on."
  - new: "Owns the coupling relation (TauCeti.IsCoupling, MeasureTheory/OptimalTransport/Coupling.lean:102) and proves the gluing lemma the cut-distance triangle inequality rests on (exists_glue_of_countable_middle, MeasureTheory/OptimalTransport/Gluing.lean:388). The pin also has a second, argument-reordered predicate TauCeti.MeasureTheory.IsCoupling (MeasureTheory/Measure/Coupling/Basic.lean:68) used by cutDist; no bridge between them is stated."

### Not done, and why
No library change or deprecation is required by the atlas, so none is proposed as atlas work.

## /38 (medium, missing): the companion regularity roadmap (TauCetiRoadmap PR #66) is named and tracked with its actual scope

### What the verifier corrected
- **The gap.** The DenseGraphLimits README delegates finite regularity and the comparison adapters to a companion roadmap that is absent from the atlas.
- **The companion's scope.** The Regularity README at PR #66 head `7ffda51` explicitly owns those adapters and the programme of strong graph regularity and arity-3 complexes.
- **What to do.** Track the open upstream proposal with its actual scope and provenance. Attach consumer links only to the interfaces that use DenseGraphLimits.
- **No all-arities supplier.** An arity-3 endpoint is not an all-arities hypergraph-removal supplier for arbitrary-length Szemerédi. A future AC.2 removal route must request the arities and the counting/removal statements it needs.

### State on main (701638e0)
- **README, Szemerédi bullet, lines 165–169.** "it is the subject of the companion **graph-regularity roadmap**, which *consumes* this roadmap's `cutNorm`, `stepGraphon`, and `weak_regularity_frieze_kannan` through finite adapters and never redefines them — so those names and shapes are load-bearing beyond this roadmap."
- **README, Layer 9a, lines 409–412.** "Both finite estimators have a natural consumer: the companion graph-regularity roadmap **owns** any adapters aligning its plain-graph densities with `homDensityFin` / `injHomDensity`, as named milestones there; neither roadmap depends on those adapters."
- **Atlas.** No roadmap covers graph or hypergraph regularity, and nothing links DenseGraphLimits to one.
- **PR #66 on 29 September.**
  - It is open, still at head `7ffda51c239fcceaee33c6f3e4e3b49a3b56f756`, with the title "Add roadmap: graph regularity, finite weak regularity, and arity-3 hypergraph complexes". Its `Regularity/README.md` has the same sha256 as the red team's copy (`060c48e9…`).
  - **Its scope.**
    - Layers 0–4 are finite graph regularity. Layer 3's finite Frieze–Kannan has "no graphon imports or analytic prerequisites anywhere in the layer".
    - Layers 5–9 are arity-3 hypergraph complexes, up to induced counting.
    - "Consumer roadmaps own induced removal and arithmetic applications; this roadmap ends at counting."
  - **Its interface.** Its "Required interoperability results" sit under "## Interfaces exported to other roadmaps", not under a layer heading. They compare its objects with `cutDiscrepancy`/Frieze–Kannan, `graphonPartitionEnergy_finiteGraphGraphon` and `homDensityFin`/`injHomDensity`.

### Fix
1. **Note for the Tau Ceti maintainer: README, lines 165–169.** Replace the quoted sentence with:
   > it is the subject of the companion graph-regularity roadmap (TauCetiRoadmap pull request #66, `TauCetiRoadmap/Regularity`, open). That roadmap proves its finite weak regularity independently, with no graphon imports, and owns the comparison results with this roadmap's public API: `stepGraphonAvg` and `graphonPartitionEnergy`, `weak_regularity_frieze_kannan`, `finiteGraphGraphon`, and the finite densities `homDensityFin` / `injHomDensity`. So those names and shapes are load-bearing beyond this roadmap. Its hypergraph endpoint is arity 3 and ends at counting; it is not a hypergraph removal lemma for all arities.

   Layer 9a's sentence (lines 409–412) is replaced in /39.
2. **Atlas (orchestrator): tracking.**
   - At the next snapshot refresh, merge `pull/66/head` on the snapshot branch (step 1 of `scripts/snapshot/README.md`), as for other open roadmap pull requests.
   - Record its provenance: PR #66, head `7ffda51`, open.
   - Its title and summary say what it covers: finite graph regularity, arity-3 complexes, ending at counting.
3. **Atlas: consumer links.** The comparisons consume three DenseGraphLimits stages: L1 (`finiteGraphGraphon`), L2 (`stepGraphonAvg`, `graphonPartitionEnergy`, `weak_regularity_frieze_kannan`) and L9a (`homDensityFin`, `injHomDensity`).
   - These links go to the Regularity stage that holds its interoperability results. At `7ffda51` that section is under no layer heading, so the snapshot gives it no stage, and no link can be recorded yet.
   - **Note for the Tau Ceti maintainer:** put the section under a layer heading, for example a final "Layer 10 — comparison with the dense-graph-limits API".
   - Record no link from DenseGraphLimits to Regularity Layers 0–9: they import no graphon API.
4. **AC.2.** No supplier edge. An AdditiveCombinatorics hypergraph-removal route must request the arities and the counting and removal statements it needs. PR #66 supplies arity-3 regularity and counting only.

### Not done, and why
- **PR #66 is not added to the atlas now.** Tracking happens at a snapshot refresh, which this job does not run.
- **No AC.2 link is added,** as the verifier requires.

## /39 (medium, duplicate): the finite densities have one owner (DenseGraphLimits Layer 9a); the finite and analytic energy and weak-regularity theorems go to the maintainer for reconciliation

### What the verifier corrected
- **The overlap is real.**
  - PR #66 Layer 0 restates the finite hom and injective densities already defined at f790474 in the graphon-free `HomDensity/Finite.lean`.
  - Its weighted energy and its finite weak regularity match specializations of the carrier-generic graphon APIs.
- **What to record.** A single owner, and explicit finite normalization and comparison contracts.
- **Do not override the design.** The companion deliberately requires an independent finite proof with no analytic imports. The fix must not silently remove that constraint or move library modules.
- **What to do instead.** Raise a maintainer reconciliation (Part II) note, reuse the graphon-free density declarations directly, and settle ownership of the finite/analytic theorems with the maintainer.
- **The empty host** needs separate handling wherever the uniform probability measure is used.

### State on main (701638e0)
- **DenseGraphLimits at the pin.**
  - `homDensityFin` (`HomDensity/Finite.lean:99`) is the hom count over `|W|^{|V|}`.
  - `injHomDensity` (`:108`) is the injective count over `(Fintype.card W).descFactorial (Fintype.card V)`.
  - `card_injective_hom_eq_labelledCopyCount` (`:140`) identifies that injective count with Mathlib's `labelledCopyCount`.
  - The file imports only Mathlib and `TauCeti.Combinatorics.SimpleGraph.Counting`, so it has no graphon import.
  - `graphonPartitionEnergy` (`StepGraphon/Energy.lean:177`), `_increment` (`:237`) and `_mono` (`:249`).
  - `weak_regularity_frieze_kannan` (`StepGraphon/Regularity.lean:175`), on any probability carrier, with `4 ^ (⌈1/ε²⌉ + 1)` parts.
- **PR #66 at `7ffda51`.**
  - Layer 0: "Ordinary homomorphism densities count graph homomorphisms and normalize by powers of the host size. Injective densities count `SimpleGraph.Copy` and normalize by `Nat.descFactorial`".
  - Layer 1: `weightedEnergy` and `weightedEnergy_mono_of_refines`.
  - Layer 3: `frieze_kannan`, with at most `4^(⌈1/ε²⌉+1)` parts.
  - "the finite and analytic theorems are **independent formulations, neither derived from the other**".
  - Interoperability: "name alignment of the Layer-0 hom/injective densities with the graphon roadmap's `homDensityFin` / `injHomDensity`".

### Fix
**Ownership, as the verifier requires.**
- **(a) The finite ordinary and injective densities.** One owner: DenseGraphLimits Layer 9a, built and graphon-free.
  - **Note for the maintainer of PR #66:** Layer 0 uses `homDensityFin` and `injHomDensity` directly, since importing `HomDensity/Finite.lean` brings no graphon or analytic module, and the "name alignment" item is dropped.
  - If the maintainer keeps the rule that the DenseGraphLimits API is consumed only in comparison results, the Layer 0 densities remain a second definition, and the alignment must be an equality theorem, not a naming convention.
  - No module moves.
- **(b) Energy and (c) finite Frieze–Kannan.** The maintainer settles ownership; the atlas does not choose. The two options:
  - keep PR #66's independent finite proofs, which is its stated design;
  - derive them from the carrier-generic theorems at `(V, uniform)`, which drops PR #66's "no graphon imports".

  Until then the atlas records a deliberate parallel formulation: the finite side is PR #66 Layers 1 and 3, the analytic side is DenseGraphLimits Layer 2. The two are joined by comparison results that PR #66 owns, under these explicit normalization contracts, each for a **nonempty** finite `V`:
  - **Energy.** `weightedEnergy G P` equals `graphonPartitionEnergy` of the 0/1 graphon of `G` on `(V, uniform)` at `P`. The block value is `edgeDensity` over ordered pairs, with diagonal blocks included, and the weights are `|A||B|/|V|²`. PR #66's own form is `graphonPartitionEnergy_finiteGraphGraphon` on `I`, for `G : SimpleGraph (Fin m)` with `0 < m`.
  - **Weak regularity.** `cutDiscrepancy G P = |V|² · cutNorm (W_G − stepGraphonAvg P W_G)` on `(V, uniform)`, through the set form (`cutNorm_eq_cutNormSet`, `Kernel/CutNorm.lean:110`). Both theorems carry the bound `4^(⌈1/ε²⌉+1)`.
  - **The empty host.** A uniform probability measure needs `Nonempty V`, so the empty host is stated separately. On the finite side, densities and energy are `0` by the zero-denominator convention; there is no graphon side.

**Note for the Tau Ceti maintainer: DenseGraphLimits README, Layer 9a.** Replace "Both finite estimators have a natural consumer: the companion graph-regularity roadmap **owns** any adapters aligning its plain-graph densities with `homDensityFin` / `injHomDensity`, as named milestones there; neither roadmap depends on those adapters." with:

> Both finite estimators are graphon-free (`HomDensity/Finite.lean` imports no graphon module). They have a natural consumer: the companion graph-regularity roadmap (TauCetiRoadmap pull request #66) should use them directly for its finite densities rather than define a second pair. Until its maintainer settles this, that roadmap owns the comparison with them. Neither roadmap's proofs depend on the comparison.

**Atlas.** Once PR #66 is tracked (/38), record two overlaps in a DenseGraphLimits link map (PROTOCOL §10):
- `[L9a, Regularity Layer 0]`, recommendation `rescope`: "Regularity Layer 0 imports homDensityFin/injHomDensity instead of defining a second pair."
- `[L2, Regularity Layers 1 and 3]`, recommendation `keep`: "A deliberate parallel finite formulation, with comparison results owned by Regularity. Ownership is to be settled by the maintainer."

### Not done, and why
- **No library module is moved,** and PR #66's finite-only design is not overridden.
- **The comparison theorems are unbuilt,** and nothing is claimed.

## /40 (medium, other): the 13 DenseGraphLimits stages get the README's dependency graph, 6a and 6b become child stages, and the stale status snapshot is refreshed

### What the verifier corrected
- **The defect.** The frozen atlas has 13 graph-limit stages, all `unknown`, with empty `requires` and no incident edges. This despite the README's explicit ordering and AUDIT-16's detailed coverage. The embedded old status is also stale.
- **What to do.** Import the justified dependency graph, and refresh the status provenance and the coverage presentation.
- **Corrections to the proposed graph.**
  - /31 is rejected, so do not force sampling before separation; first select the proof route.
  - Split stages where needed for /44 and for the distinct 6a/6b obligations.
- **Audit verdicts are not statuses.** They are coverage classifications. Use the atlas's schema, do not mark partly built stages complete, and claim no Lean compilation.

### State on main (701638e0)
- **The records.** In `data/atlas.json`, the 13 records have `status: "unknown"`, `requires: []` and `consumers: []`, and no `stageEdges` touch them. All 656 Tau Ceti stages carry `unknown`, because statuses are laid over them at build time.
- **The embedded report.** The roadmap record's `statusMarkdown` is `STATUS.md` at `8745177` (1 September); so is `content/tau-ceti/DenseGraphLimits/STATUS.md`.
- **Changed since the verification.**
  - **The new overlay.** Since commits `b3870169` and `6697027d` (28–29 September), `scripts/build.py` overlays each Tau Ceti layer's state from the Tau Ceti Progress page (`data/tauceti-progress.json`, data of 29 September).
  - **What the assembled atlas now shows.** Layers 0, 1, 3, 4, 6, 7, 8a, 8b, 9a, 9b and 9c are `complete`, and Layers 2 and 5 are `in_progress`. Each carries the basis "Tau Ceti Progress page, from the roadmap's latest report (data of 2026-09-29)".
  - **What those statuses are.** They are upstream's post-pin reports (its `STATUS.md` is now at `759eb3e`, 26 September), not pinned verdicts. The old 8745177 mapping in `data/stage-status-reports.json` is superseded at build.
  - **The pinned coverage is unchanged.** The AUDIT-16 classes: built for 1, 3 and 9a; partly built for 0, 2, 5, 6, 7, 8a, 9b and 9c; not built for 4 and 8b.

### Fix
**1. Status.** No edit to the `status` fields, which the schema leaves `unknown`.
- The stale part is the embedded report. At the next snapshot refresh, take `STATUS.md` from upstream (`759eb3e` or later). This refreshes `statusMarkdown`, `statusSha256` and `content/tau-ceti/DenseGraphLimits/STATUS.md`.
- Regenerate or drop the 13 DenseGraphLimits entries of `data/stage-status-reports.json`, which map the 8745177 report.
- The atlas makes no completion claim of its own. The Progress page is the maintainers' report, and AUDIT-16 stays the pinned coverage classification.
- The coverage presentation already shows AUDIT-16's 13 verdicts apart from status (the assembled `libraryCoverage`), so it needs no change.

**2. Two child stages under Layer 6** (the verifier's 6a/6b split). Add to `data/atlas.json` `stages`, after the Layer 6 record:
```json
{"id": "tauceti:TauCetiRoadmap/DenseGraphLimits#milestone-layer-6a--separation--inverse-counting",
 "owner": "tauceti:TauCetiRoadmap/DenseGraphLimits", "key": "Layer 6a",
 "title": "Layer 6a — separation / inverse counting",
 "description": "<README lines 313–329, verbatim>",
 "requires": ["<source of row 8>"], "consumers": ["<targets of rows 11 and 20>"], "depth": 0,
 "sourcePath": "content/tau-ceti/DenseGraphLimits/README.md", "sourceLine": 313,
 "contextStartLine": 313, "contextEndLine": 330, "status": "unknown", "origin": "tauceti",
 "repositoryPath": "TauCetiRoadmap/DenseGraphLimits/README.md",
 "anchor": "milestone-layer-6a--separation--inverse-counting", "sectionKind": "bold_milestone", "headingLevel": 4,
 "parentStageId": "tauceti:TauCetiRoadmap/DenseGraphLimits#layer-6--separation-and-convergence-equivalence-the-analytic-summit",
 "statusSnapshot": "<as on the Layer 6 record>", "firstAction": "<as on the Layer 6 record>", "isLeaf": true}
```
- **Layer 6b** is the same record with these values:
  - id `…#milestone-layer-6b--convergence-equivalence`;
  - key `Layer 6b`, title "Layer 6b — convergence equivalence";
  - description: README lines 331–335;
  - `sourceLine` 331, `contextStartLine` 331, `contextEndLine` 336;
  - anchor `milestone-layer-6b--convergence-equivalence`.
- **The parent record.** Layer 6's `isLeaf` goes from `true` to `false`. Add both ids to the roadmap record's `stages`, after the Layer 6 id.
- **Status.** The Progress overlay gives children the state of their `Layer 6` parent; see `scripts/tauceti_progress.py` (`apply` walks the leaves).

**3. Stage edges.** Add each edge to `data/atlas.json` `stageEdges`, append the source to the target's `requires`, and append the target to the source's `consumers`.
- **Within-roadmap edges** follow the record format of the six existing Tau Ceti edges: `{"source", "target", "origin": "tauceti", "evidence": {"sourcePath", "sourceLine", "text", "match", "verification", "snapshotHead": "faa5423b…"}}`. Here `match` is the needle below, and `text` is the README paragraph containing it.
- **What "Kind" means.**
  - *explicit:* the README names the dependency, and `verification` is `explicit_readme_statement`.
  - *inferred:* the consumer uses a declaration that the supplier's text builds, by exact name. The supplier's quote is given, and the `verification` value is the maintainer's to choose.
- **Cross-roadmap edges** (rows 26–28) go into a DenseGraphLimits link map (`links-v1`), with evidence from both roadmaps, and are reviewed under PROTOCOL §10.

| # | Edge | Evidence needle (README line) | Kind | When |
|---|---|---|---|---|
| 1 | L0 → L1 | "The elementary lemmas the later layers stand on" (233) | explicit | now |
| 2 | L1 → L2 | "The **forward counting lemma**" (256); supplier "`cutNorm` with its seminorm laws" (242) | inferred | now |
| 3 | L1 → L3 | "a map `toAEEqFun : Graphon Ω μ → ((Ω × Ω) →ₘ[μ ⊗ μ] ℝ)`" (283) | inferred | now |
| 4 | L3 → L4 | "Built here as the prerequisite for Layer 4" (289) | explicit | now |
| 5 | L2 → L4 | "Completeness and compactness of `GraphonSpace` over atomless standard Borel" (293); supplier "density of step graphons in `δ□` and total boundedness of `(GraphonSpace, δ□)`" (276) | inferred; explicit after /34 | now |
| 6 | L0 → L4 | "whose consumer is Layer 4" (/33's new Layer 0 text) | explicit | after /33 |
| 7 | L1 → L5 | "`cutDist` (coupling form) `=` the classical measure-preserving-map infimum" (301) | inferred | now |
| 8 | L2 → 6a | "the easy counting direction via `counting_lemma_coupling`" (317); supplier "`counting_lemma_coupling` (the cross-carrier engine)" (257) | inferred | now |
| 9–11 | L2 → 6b, L4 → 6b, 6a → 6b | "using counting (Layer 2) + compactness (Layer 4) + separation (6a)" (332) | explicit | now |
| 12–13 | L9a → L9c, 6b → L9c | "This layer consumes Layer 9a's objects and the Layer-6b convergence equivalence only" (564) | explicit | now |
| 14 | L2 → L9c | "With Layer 2's weak regularity" (/32's new Layer 9c text) | explicit | after /32 |
| 15 | L1 → L9a | "The `W`-random graph law `sampleGraph W n`" (403) | inferred | now |
| 16–17 | L9a → L9b, L4 → L9b | "Layer 9b itself consumes Layer 9a's sampling objects, Layer 4's compactness" (681) | explicit | now |
| 18–20 | L1 → L9b, L2 → L9b, 6a → L9b | "the hom-density continuity/separation algebra of Layers 1–2 and 6a" (682) | explicit | now |
| 21 | L0 → L8a | "8a is independent and can land any time after Layer 0" (684) | explicit | now |
| 22 | L8a → L8b | "the route from the Layer-8a predicates to the summit" (375) | explicit | now |
| 23 | L9b → L8b | "so Layer 9b precedes 8b" (680) | explicit | now |
| 24 | L1 → L7 | "Named extremal consequences as acceptance tests" (338) | inferred | now |
| 25 | L9a → L7 | "the W-random sampling-expectation lemma `E[t(F, G(n,W))] → t(F,W)`" (339); supplier row 15 | inferred | now |
| 26 | OT0 → L1 | DenseGraphLimits "(with `IsCoupling` and `overlayDiff`)" (244); OptimalTransport "Define the raw coupling relation for arbitrary measures" (350), "Prove the gluing lemma" (369) | inferred; explicit after /37 | now |
| 27 | OT0 → L9b | DenseGraphLimits "the projective-limit extension of consistent marginals" (437); OptimalTransport "prove the arbitrary countable standard-Borel projective-family extension theorem" (381) | inferred; explicit after /41 | now |
| 28 | OT0 → L2 | gluing for the triangle inequality, once /44 moves it into Layer 2 | explicit | after /44 |

**The rows that exist now**, as rows for the `stage_dep` list of `scripts/snapshot/build_data.py`, so that a snapshot refresh keeps them (as it keeps ConformalMapping's). Rows 6 and 14 are added once their text lands. Rows 26–28 belong to the link map, row 28 once /44's text lands.
```python
for p, c, needle in [
    ('Layer 0', 'Layer 1', 'The elementary lemmas the later layers stand on'),
    ('Layer 1', 'Layer 2', 'The **forward counting lemma**'),
    ('Layer 1', 'Layer 3', 'a map `toAEEqFun :'),
    ('Layer 3', 'Layer 4', 'Built here as the prerequisite for Layer 4'),
    ('Layer 2', 'Layer 4', 'Completeness and compactness of `GraphonSpace`'),
    ('Layer 1', 'Layer 5', '`cutDist` (coupling form) `=`'),
    ('Layer 2', 'Layer 6a', 'the easy counting direction via `counting_lemma_coupling`'),
    ('Layer 2', 'Layer 6b', 'using counting (Layer 2)'),
    ('Layer 4', 'Layer 6b', 'compactness (Layer 4)'),
    ('Layer 6a', 'Layer 6b', 'separation (6a)'),
    ('Layer 9a', 'Layer 9c', "This layer consumes Layer 9a's objects"),
    ('Layer 6b', 'Layer 9c', 'the Layer-6b convergence equivalence only'),
    ('Layer 1', 'Layer 9a', 'The `W`-random graph law `sampleGraph W n`'),
    ('Layer 9a', 'Layer 9b', "Layer 9b itself consumes Layer 9a's sampling objects"),
    ('Layer 4', 'Layer 9b', "Layer 4's compactness, and the hom-density"),
    ('Layer 1', 'Layer 9b', 'algebra of Layers 1–2 and 6a'),
    ('Layer 2', 'Layer 9b', 'algebra of Layers 1–2 and 6a'),
    ('Layer 6a', 'Layer 9b', 'algebra of Layers 1–2 and 6a'),
    ('Layer 0', 'Layer 8a', 'can land any time after Layer 0'),
    ('Layer 8a', 'Layer 8b', 'the route from the Layer-8a predicates to the summit'),
    ('Layer 9b', 'Layer 8b', 'so Layer 9b precedes 8b'),
    ('Layer 1', 'Layer 7', 'Named extremal consequences as acceptance tests'),
    ('Layer 9a', 'Layer 7', 'the W-random sampling-expectation lemma'),
]:
    stage_dep('DenseGraphLimits', p, c, needle)
```
**Persisting the child stages.** The keys `Layer 6a` and `Layer 6b` exist at a refresh only if the builder emits the two child stages. Two ways to arrange it:
- extend its bold-label rule to "**Layer 6a — …**" and "**Layer 6b — …**" under the Layer 6 heading;
- or have upstream promote them to `###` headings, as 8a/8b and 9a–9c already are. That would re-key the Layer 6 stage, so the coverage and Progress keys would need to follow.

**Cycle checks** (assembled graph at `701638e0`).
- **Each edge alone.** For every row between existing stages, the cycle test (is there a path from the target back to the source?) reports "acyclic". Neither DenseGraphLimits nor OT0 has any stage edge today.
- **All together.** All rows, including the two child stages and rows 6, 14 and 28, were added to the assembled graph's 7,792 edges at once. The graph stays acyclic: a topological sort of the resulting edge graph succeeds.
- **Three counter-checks close a cycle once the rows are in:**
  - a bare L2 → L1 (/44);
  - L9c → 6a without splitting 9c;
  - L9b → 6a.

**4. The route of the separation converse: the maintainer selects it first.** The README names two routes (/42): LNGL's Lemma 10.32/Cor 10.34, and BCL Thm 2.1(ii). Only if the sampling route is chosen, apply the following.
- **Split 9c** into two child stages:
  - 9c-i: `sampleGraph_cutDist_tendsto_inProbability` with /32's inputs;
  - 9c-ii: `infiniteSampleLaw_tendstoInMeasure_cutDist` and `infiniteSampleLaw_ae_tendsto_cutDist`.
- **Replace rows 12–14** by L9a → 9c-i, L2 → 9c-i, 9c-i → 6a, 6b → 9c-ii and 9c-i → 9c-ii. Acyclic, checked the same way.
- **Put the lemma "equal densities ⇒ equal sampling laws" in Layer 9a,** not 9b. It follows from `sum_sampleMass_supergraph_eq_homDensity` (`Sampling/Unbiased.lean:63`) and `MeasureTheory.Measure.ext_of_Ici_of_finite` (`TauCeti/MeasureTheory/Measure/FiniteOrder.lean:42`). Routing it through Layer 9b's `ExchangeableGraphLaw` API would need L9b → 6a, a cycle.

### Not done, and why
- **The route is not selected here.** The maintainer's evidence: post-pin, Tau Ceti `main` (29 September) proves the converse through the second sampling lemma (`Separation/Inverse.lean`, module header). That is not a pinned fact, and the README still names both routes.
- **No 8a → 9b edge.** The Ordering's "8a → 9b → 8b" is a build order. 9b's stated inputs are 9a, 4, 1–2 and 6a, and "8a is independent".
- **Row 25 qualifies "Layers 0–2 and 7 first"** only for Layer 7's sampling-expectation check.
- **No `status` field is edited,** and nothing is marked complete by the atlas.

## /41 (low, missing): Layer 9b consumes the countable projective-limit theorem of OptimalTransport Layer 0

### What the verifier corrected
- **What the target needs.** The finite-to-infinite graph-law target needs a projective-family extension plus a coordinate/window comparison.
- **The supplier.** Tau Ceti's `ProjectiveLimit/Countable.lean:167` supplies existence for countable standard-Borel coordinates, and belongs to OptimalTransport Layer 0. Mathlib's general projective interface at the pin does not supply this existence theorem.
- **What to do.**
  - Consume it.
  - Identify `SimpleGraph ℕ` with the countable Bool product over unordered edges.
  - Prove that the window marginals give the required family over arbitrary finite coordinate sets.
  - Record the dependency OT0 → graph laws.
- **Not the sampler.** The joint graphon sampler alone does not extend an arbitrary exchangeable law.

### State on main (701638e0)
- **README, Layer 9b, lines 435–439.** The finite↔infinite extension is "the projective-limit extension of consistent marginals". No supplier is named.
- **OptimalTransport Layer 0, item 4 (line 381).** "prove the arbitrary countable standard-Borel projective-family extension theorem".
- **Pin: Tau Ceti.**
  - `TauCeti.Measure.exists_isProjectiveLimit_of_countable` (`TauCeti/MeasureTheory/Measure/ProjectiveLimit/Countable.lean:167`). It takes `[Countable ι] [∀ i, StandardBorelSpace (X i)]`, a family `P : ∀ I : Finset ι, Measure (∀ i : I, X i)` of probability measures, and `hP : IsProjectiveMeasureFamily P`, and gives `∃ μ, IsProbabilityMeasure μ ∧ IsProjectiveLimit μ P`.
  - Its header: "the arbitrary-countable-index existence bridge required by `TauCetiRoadmap/OptimalTransport/README.md`, Layer 0, item 4".
- **Pin: Mathlib.** It has uniqueness, `MeasureTheory.IsProjectiveLimit.unique` (`Mathlib/MeasureTheory/Constructions/Projective.lean:150`). Its other `IsProjectiveLimit` statements concern:
  - `infinitePi` (`Mathlib/Probability/ProductMeasure.lean:210, 364`);
  - Ionescu-Tulcea trajectories (`Mathlib/Probability/Kernel/IonescuTulcea/Traj.lean:484`);
  - laws of processes (`Mathlib/Probability/Process/FiniteDimensionalLaws.lean:54`).

  There is no general existence theorem.
- **The coordinate bridge exists** (`ExchangeableGraphLaw/Coordinates.lean`): `EdgeIndex` (`:56`), `graphCoordEquiv` (`:59`), measurable in both directions (`:107`, `:120`).
- **Coverage.** Layer 9b: "Only a generic countable projective-limit (Kolmogorov extension) theorem exists." Nothing has changed since the verification.

### Fix
**Note for the Tau Ceti maintainer: README, Layer 9b.** After "the projective-limit extension of consistent marginals, **distinct from** the graphon-mixture extraction below, which the previous phrase "compactness extension plus the mixture representation" conflated." insert:

> Its existence input is the countable standard-Borel projective-limit theorem of [OptimalTransport Layer 0](../OptimalTransport/README.md), item 4 (Tau Ceti `TauCeti.Measure.exists_isProjectiveLimit_of_countable`), consumed here and not rebuilt. Mathlib supplies only uniqueness (`MeasureTheory.IsProjectiveLimit.unique`). The graph-specific work is the transport:
> - identify `SimpleGraph ℕ` with the countable Boolean product `EdgeIndex → Bool` (`graphCoordEquiv`, measurable both ways);
> - show that the window laws on `SimpleGraph (Fin k)` induce a projective family on the finite coordinate sets `J ⊆ EdgeIndex`. Each `J` lies in the edge set of some window, and consistency along label injections makes the induced law independent of the window;
> - relabelling invariance of the extension follows from that consistency and uniqueness.
>
> The joint sampler `infiniteSampleLaw` alone does not extend an arbitrary exchangeable law.

The OptimalTransport README's consumer sentence is in /37.

**Atlas.** The stage link OT0 → L9b (row 27 of /40's table).

### Not done, and why
The extension and the window-to-coordinate comparison are unbuilt at the pin, and nothing is claimed.

## /42 (low, error): the separation and convergence locators are corrected, and BCL, the BCLSV venues and LS06 Thm 2.7 are added

### What the verifier corrected
- **The wrong locator.** LNGL Theorem 11.3 concerns convergence of finite graph sequences. Lemma 10.32 and Corollary 10.34 give inverse counting and separation. Theorem 11.5 is the graphon convergence equivalence (printed pp. 169–170, 174).
- **What to correct.** The README and `Suggested.lean` locators. Include the omitted sections: compactness, counting, sampling and reflection positivity.
- **What to add.** The BCL uniqueness source, which the text already invokes. LS06 Theorem 2.7 (p. 10) supplies the local/consistent random-graph-model characterization.
- **No route is committed.** This repair does not commit separation to the sampling proof over the BCL proof.

### State on main (701638e0)
- **README, Layer 6a, line 320.** "(LNGL Thm 11.3 on `[0,1]`; Janson, Thm 8.10, for arbitrary carriers, after the Borgs–Chayes–Lovász uniqueness theorem)". `Suggested.lean` lines 457–458 have the same text.
- **Layer 6b (lines 331–335)** has no locator.
- **References.**
  - Line 768: "- L. Lovász, *Large Networks and Graph Limits* (2012), Part 3 (§7.1, §8.2, §9.2, Ch. 11, Ch. 13)."
  - Lines 773–774: "- C. Borgs, J. Chayes, L. Lovász, V. Sós, K. Vesztergombi, *Convergent sequences of dense graphs I–II*."
  - BCL is not listed.
- **Layer 9b's attribution (lines 483–489)** cites Diaconis–Janson Thm 5.3, Cor 5.4 and Thm 5.5, but not LS06 Thm 2.7.
- **What the sources say.**
  - **LNGL** (printed pages):
    - Thm 11.3 (p. 174): "A sequence (Gn) of simple graphs with v(Gn) →∞ is convergent if and only if it is a Cauchy sequence in the metric δ□". Its proof applies the Inverse Counting Lemma 10.32.
    - Lemma 10.32 (p. 169) and Cor 10.34 (p. 170). The proof of Lemma 10.31 applies the Second Sampling Lemma 10.16.
    - Thm 11.5 (p. 174) and Remark 11.4, the compactness argument.
  - **Janson v3, Thm 8.10 (p. 27):** "(iv) ⇒ (ii): See [14] or, for a different proof, [13]". Here [13] is BCL, GAFA 19 (2010), 1597–1619, and [14] is BCLSV I, Adv. Math. 219 (2008), 1801–1851.
  - **BCL:** Thm 2.1(ii) (p. 6), proved in §§5.3–5.4 (pp. 26–30) by coupling anchor sequences.
  - **LS06:** Thm 2.7 (p. 10).

### Fix
**Notes for the Tau Ceti maintainer: README.**
1. **Layer 6a, line 320.** Replace "(LNGL Thm 11.3 on `[0,1]`; Janson, Thm 8.10, for arbitrary carriers, after the Borgs–Chayes–Lovász uniqueness theorem)" with:
   > (on `[0,1]`, either LNGL Lemma 10.32, the Inverse Counting Lemma, with Corollary 10.34, whose proof goes through the Second Sampling Lemma 10.16; or Borgs–Chayes–Lovász, *Moments of two-variable functions and the uniqueness of graph limits*, Theorem 2.1(ii), by moments and coupled anchor sequences. For arbitrary carriers, Janson, Thm 8.10, (iv) ⇒ (ii), which cites both)
2. **Layer 6b.** After "a sequence converges in `δ□` iff all `t(F, ·)` converge" insert " (LNGL Thm 11.5; the route is the compactness argument of Remark 11.4)".
3. **References, line 768.** Replace the LNGL entry with:
   > - L. Lovász, *Large Networks and Graph Limits*, AMS Colloquium Publications 60 (2012), Parts 2–3: §4.2 (connection matrices and reflection positivity), §7.1–7.2 (Prop 7.1: `t(·, W)` is reflection positive for graphons), §8.2, §9.2–9.3 (Lemma 9.15; Thm 9.23, compactness), Ch. 10 (the First and Second Sampling Lemmas 10.6 and 10.16, the Counting Lemma 10.23, Lemmas 10.31–10.32 and Cor 10.34), Ch. 11 (Thms 11.3 and 11.5), Ch. 13.
4. **References, lines 773–774.** Replace the BCLSV entry with:
   > - C. Borgs, J. Chayes, L. Lovász, V. Sós, K. Vesztergombi, *Convergent sequences of dense graphs I: Subgraph frequencies, metric properties and testing*, Adv. Math. 219 (2008), 1801–1851 ([doi:10.1016/j.aim.2008.07.008](https://doi.org/10.1016/j.aim.2008.07.008); [arXiv:math/0702004](https://arxiv.org/abs/math/0702004)); *II. Multiway cuts and statistical physics*, Ann. of Math. 176 (2012), 151–219 ([doi:10.4007/annals.2012.176.1.2](https://doi.org/10.4007/annals.2012.176.1.2)).
   > - C. Borgs, J. Chayes, L. Lovász, *Moments of two-variable functions and the uniqueness of graph limits*, GAFA 19 (2010), 1597–1619 ([doi:10.1007/s00039-010-0044-0](https://doi.org/10.1007/s00039-010-0044-0); [arXiv:0803.1244](https://arxiv.org/abs/0803.1244)) — the uniqueness theorem (Thm 2.1) behind Janson Thm 8.10's second proof of separation (Layer 6a).
5. **References, the LS06 entry.** Replace "the representability characterization (Thm 2.2: normalized + multiplicative + reflection-positive, Layer 8b)." with:
   > the representability characterization (Thm 2.2: normalized + multiplicative + reflection-positive, Layer 8b) and the random-graph-model characterization (Thm 2.7, Layer 9b).
6. **Layer 9b, after "never cite 5.5 alone for general mixing-measure uniqueness."** Insert:
   > The extremality target `exists_graphon_of_isDissociated` is also Lovász–Szegedy's Theorem 2.7 (*Limits of dense graph sequences*, p. 10): a random graph model is `G(n, W)` for some `W` iff it is invariant under relabelling, consistent under deleting the last node, and has independent induced subgraphs on `[k]` and `{k+1, …, n}`.

**`Suggested.lean`, lines 457–458.** Replace "LNGL Thm 11.3 on `[0,1]`; Janson, Thm 8.10, for arbitrary carriers, after the Borgs–Chayes–Lovász uniqueness theorem" with:

> LNGL Lemma 10.32 and Cor 10.34 on `[0,1]`, or Borgs–Chayes–Lovász Thm 2.1(ii); Janson, Thm 8.10, for arbitrary carriers

### Not done, and why
- **§6.2 is not added, unlike the finding's suggestion.** It was read: it concerns reflection-positive parameters of finite connection rank. Reflection positivity is defined in §4.2 (p. 44), and Prop 7.1 (pp. 118–119) is the statement for graphons, so those are cited.
- **No route is chosen** (/40, item 4).
- **BCLSV I and II were not read.** Their venues and DOIs are from Crossref, and the arXiv id of I is from the arXiv API. No arXiv id is given for II, because none was verified.

## /43 (low, library-claim): Janson A.9 is in Mathlib, with a Tau Ceti wrapper, and the `NullSingletonClass` path is corrected

### What the verifier corrected
- **Mathlib has A.9.** `Mathlib/Probability/Kernel/Representation.lean:126` proves `exists_measurable_map_eq` for a nonempty standard Borel probability carrier.
- **Tau Ceti wraps it.** `UnitIntervalMap.lean:64` derives nonemptiness and packages the map as `MeasurePreserving` in three lines.
- **What to do.**
  - The README's blanket claim that the measure-preserving refinements are unavailable is too broad. Cite the theorem and the wrapper.
  - Keep the separate atomless mod-null equivalence as missing.
  - `NoAtoms.lean` is deprecated since 2026-06-19 in favour of `NullSingletonClass`; update the path.

### State on main (701638e0)
- **README, General-purpose prerequisites, lines 201–205.** "… — Mathlib has the measurable equivalence (`PolishSpace.measurableEquivOfNotCountable`), not these measure-preserving refinements (inputs to Layers 4–5);"
- **Line 178:** "`NullSingletonClass` (`MeasureTheory/Measure/Typeclasses/NoAtoms`)".
- **Layer 5, line 304:** "(`exists_measurePreserving_from_unitInterval`, build it here)".
- **Lines 570–571,** Reusable beyond graphons: the same two prerequisites, attributed to "(Layer 5)".
- **Pins.**
  - **Mathlib's A.9.** `MeasureTheory.Measure.exists_measurable_map_eq (μ : Measure Y) [IsProbabilityMeasure μ] : ∃ (f : I → Y), Measurable f ∧ volume.map f = μ`, under `[Nonempty Y] … [StandardBorelSpace Y]` (`Mathlib/Probability/Kernel/Representation.lean:126`; the variables are at lines 40–41).
  - **Tau Ceti's wrapper.** `MeasureTheory.Measure.exists_measurePreserving_from_unitInterval` (`TauCeti/MeasureTheory/Measure/UnitIntervalMap.lean:64`) gets `Nonempty` from `nonempty_of_isProbabilityMeasure`, then applies `exists_measurable_map_eq`.
  - **The deprecation.** `Mathlib/MeasureTheory/Measure/Typeclasses/NoAtoms.lean` is `deprecated_module "use Mathlib.MeasureTheory.Measure.Typeclasses.NullSingletonClass instead" (since := "2026-06-19")`. `class NullSingletonClass` is at `Mathlib/MeasureTheory/Measure/Typeclasses/NullSingletonClass.lean:31`, and `NoAtoms` is a deprecated alias (`:35`).
  - **The measurable equivalence.** `PolishSpace.measurableEquivOfNotCountable` (`Mathlib/MeasureTheory/Constructions/Polish/Basic.lean:1146`).
  - **Neither library** has a measure-preserving mod-null equivalence.
- **Coverage.** `data/library-coverage.json` Layer 5 already classes A.9 as `both`. Nothing has changed since the verification.

### Fix
**Notes for the Tau Ceti maintainer: README.**
1. **General-purpose prerequisites, lines 201–205.** Replace the first bullet, from "the **measure-preserving map from `(I, volume)`** to any standard Borel probability space (a measurable map with the prescribed pushforward" to "not these measure-preserving refinements (inputs to Layers 4–5);", with:
   > the **measure-preserving map from `(I, volume)`** to any standard Borel probability space (a measurable map with the prescribed pushforward — not pointwise surjectivity) — atoms allowed (Janson, Thm A.9; input to Layer 5). Mathlib already proves it as `MeasureTheory.Measure.exists_measurable_map_eq` (for a nonempty standard Borel space), and Tau Ceti's `exists_measurePreserving_from_unitInterval` is its `MeasurePreserving` wrapper without `Nonempty`. The other prerequisite is the **measure-preserving mod-null equivalence** with `(I, volume)` in the atomless case (Janson, Thm A.7; a Layer 0 input of Layer 4 only). Mathlib has only the measurable equivalence (`PolishSpace.measurableEquivOfNotCountable`), not this measure-preserving refinement;
2. **Line 178.** Replace "`NullSingletonClass` (`MeasureTheory/Measure/Typeclasses/NoAtoms`)" with "`NullSingletonClass` (`MeasureTheory/Measure/Typeclasses/NullSingletonClass`)".
3. **Layer 5.** See /33 item 2, which removes "build it here".
4. **Reusable beyond graphons, lines 570–571.** Replace "the **measure-preserving map from `(I, volume)`** to any standard Borel probability space (a measurable map with the prescribed pushforward — not pointwise surjectivity), and the **measure-preserving mod-null equivalence** with `(I, volume)` in the atomless case (Layer 5);" with:
   > the **measure-preserving map from `(I, volume)`** to any standard Borel probability space (Layer 5; in Mathlib, with a Tau Ceti `MeasurePreserving` wrapper), and the **measure-preserving mod-null equivalence** with `(I, volume)` in the atomless case (Layer 0, consumed by Layer 4);

**`Suggested.lean`, line 416** (docstring of `exists_measurePreserving_from_unitInterval`). After "**Layer 5 prerequisite (measure-preserving map from `I`).**" insert:

> Mathlib proves it as `MeasureTheory.Measure.exists_measurable_map_eq` (with `Nonempty`); Tau Ceti's `MeasureTheory.Measure.exists_measurePreserving_from_unitInterval` is the wrapper.

### Not done, and why
The mod-null equivalence stays recorded as missing from both libraries at the pin.

## /44 (low, other): the triangle inequality and `GraphonSpace` move after Layer 2's weak regularity, which records the acyclic order

### What the verifier corrected
- **The pin.** At f790474, `cutDist_triangle` (`Triangle.lean:189`) directly invokes `weak_regularity_frieze_kannan` to replace the middle graphon by a finite step graphon, and `GraphonSpace/Basic` imports `Triangle`.
- **The roadmap** puts those outputs in Layer 1 and weak regularity in Layer 2.
- **Why a bare edge fails.** A Layer 2 → Layer 1 edge would create a cycle, because Layer 2 needs Layer 1's kernels, graphons and cut norms.
- **What to do.** Either split the core from the triangle/quotient endpoint and split Layer 2's weak regularity from its quotient-level outputs, or relocate the step-approximation input before the triangle. Record the actual acyclic declaration order.
- The baseline theorems remain built.

### State on main (701638e0)
- **README, Layer 1, lines 243–251:** "the **coupling-primary, cross-carrier** `cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)` (with `IsCoupling` and `overlayDiff`) and its **triangle inequality on arbitrary probability carriers** (Janson, Lemma 6.5; …); and the fixed-carrier quotient `GraphonSpace Ω μ` …".
- **README, Layer 2, line 258** has the descent to `GraphonSpace`. Weak regularity is at line 259, and density and total boundedness at lines 275–276.
- **The import order at f790474** (`public import` lines; no Layer 2 → Layer 1 dependency except through the endpoint):
  - **Layer 1 core.** `Kernel/*`, `Graphon/*`, `HomDensity/Basic`, then `CutMetric/{Coupling, Distance, Stability}`. `Stability.lean` imports only `Distance` and gives `abs_cutDist_sub_le_cutNorm_add_cutNorm` (`:125`).
  - **Layer 2, before the triangle.** `Counting.lean` imports `CutMetric.Distance`. `StepGraphon/{Basic, Average, Energy, Regularity}` import only kernel, graphon and partition files, and no `CutMetric` module.
  - **The triangle.** `CutMetric/Triangle.lean` imports `CutMetric.Stability`, `StepGraphon.Regularity` and `OptimalTransport.Gluing`, and its header says "Frieze--Kannan weak regularity replaces the middle graphon by a finite step graphon".
  - **After the triangle.** `GraphonSpace/Basic.lean` imports `CutMetric.Triangle`. Then come `GraphonSpace/HomDensity` (with `Counting`), `StepGraphon/Density` and `GraphonSpace/Density` (both after `Triangle`), and `GraphonSpace/TotallyBounded`, which is after `UnitIntervalModel` and so after `Triangle`.
  - **What imports only `Distance`.** `AEEqFun.lean` (Layer 3) and `CutMetric/Pullback/Basic.lean` (Layer 5), not `Triangle`.
- Nothing has changed since the verification.

### Fix
The verifier's second option: the step-approximation input comes before the triangle. The triangle and `GraphonSpace` move into Layer 2, after weak regularity. Headings are unchanged, so stage ids, coverage keys and Progress keys stay.

**Notes for the Tau Ceti maintainer: README.**
1. **Layer 1.** Replace the passage from "the **coupling-primary, cross-carrier** `cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)`" to "not a quotient bundling all carriers." (lines 243–251) with the following. It includes /37's parenthesis.
   > the **coupling-primary, cross-carrier** `cutDist (U : Graphon Ω₁ μ₁) (W : Graphon Ω₂ μ₂)` (with `overlayDiff`, over the coupling relation `IsCoupling` that [OptimalTransport Layer 0](../OptimalTransport/README.md) owns, item 1), with its symmetry, its diagonal bound, and its stability under cut-norm approximation of either argument, `|δ□(U, W) − δ□(U′, W′)| ≤ ‖U − U′‖□ + ‖W − W′‖□` (Janson, Lemma 6.4). The **triangle inequality on arbitrary probability carriers** and the quotient `GraphonSpace` are built in Layer 2, after weak regularity, because their proof replaces the middle graphon by a step graphon.
2. **Layer 2, the descent.** Replace "and its **coupling / cut-distance form** `counting_lemma_coupling` (the cross-carrier engine); the descent of `t(F, ·)` to `GraphonSpace` (`homDensityOnSpace`); the **Frieze–Kannan weak regularity lemma**" with:
   > and its **coupling / cut-distance form** `counting_lemma_coupling` (the cross-carrier engine); the **Frieze–Kannan weak regularity lemma**
3. **Layer 2, the endpoint.** Replace "Then density of step graphons in `δ□` and total boundedness of `(GraphonSpace, δ□)`." with:
   > **The cut metric.** Weak regularity is the step-approximation input of the **triangle inequality on arbitrary probability carriers** (`cutDist_triangle`; Janson, Lemma 6.5).
   > - **The proof.** The middle graphon is replaced by its Frieze–Kannan step graphon `stepGraphonAvg`. Its finitely many blocks form a countable middle carrier for the gluing lemma of OptimalTransport Layer 0. Layer 1's stability estimate removes the replacement error.
   > - **What follows.** `cutDist` is a pseudometric with no carrier hypotheses. The fixed-carrier quotient `GraphonSpace Ω μ` (a genuine metric quotient over any probability carrier) and the canonical compact space `GraphonSpaceI`, the unit-interval version, are built here. Cross-carrier equality is `cutDist U W = 0`, not a quotient bundling all carriers.
   > - **Janson's own proof** uses the `L¹` density of step functions (Remark 4.6) instead of weak regularity. Either way the step-approximation input comes before the triangle inequality.
   >
   > Then the descent of `t(F, ·)` to `GraphonSpace` (`homDensityOnSpace`), the density of step graphons in `δ□`, and the total boundedness of `(GraphonSpace, δ□)`.

The recorded order is: Layer 1 core → Layer 2's counting and weak regularity → triangle inequality → `GraphonSpace` → descent, density and total boundedness.

**Atlas.**
- **The edge.** L1 → L2 only (row 2 of /40's table). OT0 → L2 (row 28) is added once this text lands.
- **Why the relocation.** A bare L2 → L1 edge closes a cycle with row 2 (checked; /40). With the relocation, no Layer 1 or Layer 2 child stages are needed.

### Not done, and why
- **The coverage is not re-keyed now.** AUDIT-16 lists the triangle inequality and `GraphonSpace` under Layer 1. The next audit of this roadmap moves them to Layer 2. Their classification is unchanged: built at the pin.
- **No child stages for Layers 1 and 2,** because the relocation records the order in the text.

## Sources read

### For AdditiveCombinatorics, RS-03 and ALPOGE-BHARGAVA-SHNIDMAN-26 (/1–/20)

All sources were read on 29 September 2026 and fetched with the tauceti-worker user agent. arXiv ids and versions were checked through the arXiv API the same day.

- **arXiv papers** (pages are printed pages unless stated):
  - W. Kai, *Linear patterns of prime elements in number fields*, arXiv:2306.16983v5 (12 March 2026, 84 pp.), https://arxiv.org/pdf/2306.16983v5, SHA-256 `c5e9e91fd7c698d0296a5412620a4556cf56f39ed964d353e423802c7ab495a7`. Read: §1.2.2, §§2–2.8 (pp. 6–10), §3 opening (p. 11), §§5–6 openings with Theorem 6.1, Definition 6.2 and Proposition 6.4 (pp. 16, 22–24), Lemma 7.1 and its proof opening (pp. 28–29), §8 to Definition 8.3 (pp. 32–33), Theorems 12.1 and 13.1 (pp. 54–57), Appendix A.1–A.2 (pp. 59–61), Proposition B.1 (p. 64), Appendix D statement headings (p. 71).
  - W. Kai, *Notes on Mitsui's Prime Number Theorem with Siegel zeros*, arXiv:2209.11816v3 (8 September 2026, 30 pp.), SHA-256 `f835d20e95b6f8738fd29b7bd7abf38b33b2560e05414ca34da41d44bef95e42`. Read: pp. 1–3 and Theorem 3.1.1 (p. 10).
  - B. Green, T. Tao, T. Ziegler, arXiv:1009.3998v5 (23 April 2026, 116 pp.), SHA-256 `24b5b74b1c4f31986bfc75955f8528e81753efc0c45bd99bc23fee58171a4711`. Read: pp. 1–3, p. 72 (footnote 7), p. 77 and Lemma A.5 (p. 80).
  - Green–Tao–Ziegler, erratum (April 2024), https://terrytao.wordpress.com/wp-content/uploads/2024/04/erratum-4.pdf (6 pp.), SHA-256 `20854b64a0ff60b8df6bea9a22afb2c26306aff51c827067e2db25930a11af41`. Read: pp. 1–2.
  - B. Green, T. Tao, *On the quantitative distribution of polynomial nilsequences – erratum*, arXiv:1311.6170v3 (14 August 2015, 21 pp.), SHA-256 `0930ad0e0cb4bdf9ea72463fd31c45e1002c5a3528162d892113d089a0040f3d`. Read: pp. 1–3.
  - J. Leng, A. Sah, M. Sawhney, arXiv:2402.17994v3 (10 August 2024, 100 pp.), SHA-256 `12439e0bda174047274fa49d0c578fad528b25a7205c172c70ca683d1fba6005`. Read: pp. 1–3 (Definition 1.1, Theorem 1.2).
  - J. Leng, *Efficient equidistribution of nilsequences*, arXiv:2312.10772v5: identified through the arXiv API only, not read.
  - B. Green, T. Tao, *The Möbius function is strongly orthogonal to nilsequences*, arXiv:0807.1736v4 (23 pp.), SHA-256 `1983964ece08526e3ceca872c011d1fd6d95d689670e3715bcc6c3a20749d577`. Read: pp. 1–2, 5–7, 19 and 21 (Proposition A.1, Proposition A.2).
  - D. Conlon, J. Fox, Y. Zhao, *A relative Szemerédi theorem*, arXiv:1305.5440v2 (22 pp.), SHA-256 `653a46b8e4427eff014e5e18f3e8579bb2c9d0e9276621ef445623d97abf342c`. Read: pp. 1–2.
  - Conlon–Fox–Zhao, *The Green–Tao theorem: an exposition*, arXiv:1403.2957v4 (26 pp.), SHA-256 `a5664e46390c7dc3165068a8c815f251ed33a864aeff027928bc1f0c18488ad1`. Read: pp. 1–2, 17–19 and 22–23 (§8, footnote 9, §9's pole estimate).
  - D. Kráľ, O. Serra, L. Vena, arXiv:0804.4847v1 (11 pp.), SHA-256 `dea848ae1941e898b390aa71b1b32efbc404a46b7016747dea0e1359831dba1b`. Read: pp. 1–8.
  - B. Green, T. Tao, arXiv:math/0404188v6 (56 pp.), SHA-256 `d03dd6156165fc92e488b3fec35a574c8f7c9df55125cec0f3eebdf95d7256e1` (the decomposition's hash). Read: pp. 3–4 and 9 (Definition 3.3).
- **Book.** T. Tao, V. Vu, *Additive Combinatorics* (Cambridge University Press, 2006), read in the copy the verifier cites, https://math.bme.hu/~gabor/oktatas/SztoM/TaoVu.AddComb.pdf (SHA-256 `585c1720e78496b258891eafe84c1abe0cebf0d1197ab1c1fd9b894803bc0b8b`). Read: printed pp. 135 (Theorem 3.30), 141–142 (Corollary 3.35, Lemma 3.36), 166 (Definition 4.17) and 168–169 (Lemma 4.22, Proposition 4.23).
- **Declarations read at the pins,** with the hypotheses in scope:
  - Mathlib 082e2d3: Corner/Roth.lean:74, 79, 137, 163, 196; AP/Three/Defs.lean:72; AP/Three/Behrend.lean:481; HalesJewett.lean:459; SimpleGraph/Triangle/Removal.lean:161; SimpleGraph/Regularity/Lemma.lean:76; Energy.lean:58, 154; PluenneckeRuzsa.lean:236; RuzsaCovering.lean:32; FiniteAbelian/PontryaginDuality.lean:125, 188; Fourier/ZMod.lean:88, 177.
  - Tau Ceti f790474: GroupTheory/FiniteAbelian/CharacterOrthogonality.lean:104; RepresentationTheory/Compact/Finite.lean:212; RepresentationTheory/Compact/PeterWeyl.lean:599.

### For AlgebraicCodingTheory (/21–/30)

All read on 29 September 2026, fetched with the worker User-Agent.
- **M. Harada and T. Miezaki**, "On the existence of extremal Type II Z2k-codes", arXiv:1205.6947v2 (24 July 2012; id and version checked with the arXiv API), https://arxiv.org/pdf/1205.6947v2, 29 pp., SHA-256 `a4d57ff80e213610b099b11d23fb69920beba6236bca191c8fd2f83f4b0fcf06`. Read pp. 2–7 (§§1, 2.1, 2.3, 2.4) and the bibliography, p. 27.
- **N. J. A. Sloane**, "Gleason's theorem on self-dual codes and its generalizations", arXiv:math/0612535v1 (19 December 2006; checked with the arXiv API), https://arxiv.org/pdf/math/0612535v1, 19 pp., SHA-256 `79cd5647b3da97e9787586894c0b06b1499d308c393ed7686cb4fbd3a298029f`. Read §§2–5, pp. 2–4.
- **Crossref** record for DOI 10.1109/18.761269 (Bannai–Dougherty–Harada–Oura): metadata only. The paper was not read.
- **TauCetiRoadmap** (public GitHub), `TauCetiRoadmap/AlgebraicCodingTheory/`:
  - README at main ca2f063;
  - Suggested.lean at main ca2f063 and at 2172af4 (lines 13–17, 36–80, 195–262, 400–500, 575–590);
  - commit messages and diffs of a775d124f (#424) and 843d66f17 (#404).
- **Tau Ceti `f790474`** (pinned):
  - `InformationTheory/Coding/Basic.lean` and `Matrix.lean`, in full;
  - `LinearAlgebra/FiniteBilinearModule/CoordinatePower.lean` (lines 1–240), `Basic.lean:567` and `Quadratic.lean:435`;
  - in `LinearAlgebra/IntegralLattice/`:
    - `OrthogonalSum.lean` (lines 1–90, declaration list);
    - `Discriminant/Operations.lean` (lines 1–245);
    - `StandardCoordinates.lean` (header);
    - `Overlattice/Basic.lean` (lines 1–140, 237–251), `Isotropic.lean` (in full) and `Dual.lean:232`;
    - `Overlattice/OrthogonalQuotient/Bilinear.lean` (lines 10–315) and `Quadratic.lean` (lines 295–330).
- **Tau Ceti post-pin** (public GitHub, prior art only):
  - `LinearAlgebra/IntegralLattice/Overlattice/Isotropic.lean` at main 30f0492 (lines 280–415), with its commit history (0555df799, #7203);
  - `InformationTheory/Coding/TwoPowTypeII.lean` at b3decc7 and 30f0492 (lines 1–60);
  - `LinearAlgebra/IntegralLattice/ConstructionA/Even.lean:104` at both.
- **Mathlib `082e2d3`**: `InformationTheory/Hamming.lean` (`hammingDist` :41, `hammingNorm` :138), the `InformationTheory/Coding/` directory, and a search for code, matrix-presentation and overlattice declarations (none).
- **The atlas at origin/main 701638e0:**
  - the coding README snapshot;
  - the coding link map (both copies);
  - `research/blueprint/audit/AUDIT-16.result.json` (coding layers) and `data/library-coverage.json`;
  - the GeometryOfNumbers README and packet;
  - `scripts/build.py`, `scripts/decompositions.py` (`merge_links`), `scripts/merge_library_audit.py`, `scripts/snapshot/build_data.py` (lines 255–460) and `research/blueprint/make_atlas_extracts.py`;
  - PROTOCOL.md §§10 and 15.

### For DenseGraphLimits (/31–/44)

All read on 29 September 2026, with the header `User-Agent: tauceti-worker (mailto:worker@example.org)`.
- **L. Lovász, *Large Networks and Graph Limits*,** author's draft, <https://www.cs.elte.hu/~lovasz/bookxx/hombook-almost.final.pdf>, sha256 `2d1f1ed87a75d0d137bfc67e61dd1b86f8b69f16078966846afceb103af0f088`.
  - Printed pages read: 44, 88–89, 118–119, 146–150, 158–166, 169–170, 173–174 and 193–194.
  - The statements used: Lemmas 9.12, 9.15, 10.6–10.9, 10.11, 10.16, 10.31, 10.32; Thms 9.23, 10.3, 11.3, 11.5, 11.52; Prop 7.1; Cor 10.34; Remark 11.4; the table of contents.
  - **The version:** the published book, AMS Colloquium Publications 60, has chapter 11 on pp. 173–199 per Crossref (doi 10.1090/coll/060/11); only the draft was read.
- **S. Janson,** *Graphons, cut norm and distance, couplings and rearrangements*, <https://arxiv.org/pdf/1009.2376v3>, sha256 `15f05ba9…ba867`.
  - Pages read: Remark 4.6 (p. 7), Lemmas 6.4–6.5 (p. 12), Thm 7.1 and Lemma 7.3 (pp. 20–21), Thm 8.10 (p. 27), Thms A.7 (p. 50) and A.9 (p. 52), and bibliography entries [13] and [14].
- **C. Borgs, J. Chayes, L. Lovász,** *Moments of two-variable functions and the uniqueness of graph limits*, <https://arxiv.org/pdf/0803.1244v2> (8 December 2008), sha256 `c63367ea…1e941`. Read: Thm 2.1 (p. 6), §5.3 (p. 26) and §5.4 (p. 30). Venue from Crossref: GAFA 19(6) (2010) 1597–1619, doi 10.1007/s00039-010-0044-0.
- **L. Lovász, B. Szegedy,** *Limits of dense graph sequences*, <https://arxiv.org/pdf/math/0408173v2>, sha256 `cf354b99…89a03`. Read: §2.3 (p. 5), Thm 2.2 (p. 8), Thm 2.7 (p. 10) and §5.5 (p. 21). Venue from Crossref: JCTB 96(6) (2006) 933–957, doi 10.1016/j.jctb.2006.05.002.
- **P. Diaconis, S. Janson,** *Graph limits and exchangeable random graphs*, <https://arxiv.org/pdf/0712.2749> (v1), sha256 `03f744d0…ac3fe6c`. Read: Thm 5.3 (p. 13), Cor 5.4 and Thm 5.5 (p. 14).
- **BCLSV I and II** were not read.
  - I: Crossref gives Adv. Math. 219(6) (2008) 1801–1851, doi 10.1016/j.aim.2008.07.008. The arXiv API gives `math/0702004v1` with that title.
  - II: Crossref gives Ann. of Math. 176(1) (2012) 151–219, doi 10.4007/annals.2012.176.1.2.
- **TauCetiRoadmap.**
  - Pull request #66, open, head `7ffda51c239fcceaee33c6f3e4e3b49a3b56f756`: `TauCetiRoadmap/Regularity/README.md` (sha256 `060c48e9…`) and `Suggested.lean` at that head.
  - `main` at `ca2f063` (29 September): `TauCetiRoadmap/DenseGraphLimits/{README.md, Suggested.lean, STATUS.md}`.
- **Post-pin, for information only:** Tau Ceti `main` at `949127e` (29 September), the header of `TauCeti/Combinatorics/DenseGraphLimits/Separation/Inverse.lean`.
- **Migration source:** `cameronfreer/graphon` at `6eccca5bbe5c9df46d7129bf59575b8b9b1d6699`. Read: `Graphon/CutDistance.lean` (about lines 1030–1075) and `Graphon/SamplingPointwise.lean` (lines 1–60).
- **Libraries at the pins,** each statement read in full.
  - Mathlib `082e2d3`: the files cited in /34, /35, /41 and /43.
  - Tau Ceti `f790474`: the files cited in each section.
