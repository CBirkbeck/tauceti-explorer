# REV-PKG-PolynomialGaloisGroupsPartII

Verdict: **accepted after corrections in place**. Reviewer: Claude (Opus 5.5), session
`claude-A3UO6l`. Date: 2026-10-14. Job: #9230. The package was written for #9186 by Codex session
`codex-37UiPL`. The plan was designed by `codex-jw5Scx` and reviewed by `codex-okRqvY`. This
reviewer took no part in the package, the plan or the plan's review.

## Scope and method

The package (`README.md`, `Suggested.lean`, `metadata.toml`) was read in full. It was checked against
the accepted plan `research/blueprint/packets/PolynomialGaloisGroupsPartII.json` (32 nodes) and the
package handoff. The method followed PACKAGE_REVIEW.md, PROTOCOL.md sections 5, 13 and 20, and
UPSTREAM_GUIDE.md. Form was compared with the upstream parent `TauCetiRoadmap/PolynomialGaloisGroups`
(README and Suggested.lean) and with the accepted package review of ArithmeticDirichletSeriesPartII.

All four cited public sources were downloaded afresh and read at every locator the README uses (table
below). Every mathematical statement was checked by hand. Three Sonnet subagents did mechanical work:

- supplier signatures at the pins, plus a duplication search of current TauCetiRoadmap and Tau Ceti;
- a plan-to-README-to-Lean comparison, node by node;
- a whole-file proofread of the corrected README.

The reviewer read their reports and verified each point used here.

## The six criteria

| Criterion | Finding |
| --- | --- |
| 1. Upstream form | Pass after a title fix. The README has the upstream shape: `# Roadmap:` title with a `**Summary.**`, then Scope and ownership, Conventions, Exact supplier contracts (per supplier) and How to read the build. Layers 0–6 follow, with `### k.n` prose subsections, each layer ending in `### Examples` and `### Dependencies`. Downstream consumers and References close it. Definitions carry API lists and `**Checks.**`, theorems carry hypotheses, locators and `*Needs:*`. There are no field lists or target-numbering tables. |
| 2. Fidelity to the plan | Pass after two completions. All 32 nodes have a subsection (0.1–6.2). Statements, hypotheses, parameter ranges, exponents and degree guards agree with the plan, as do all 38 API items and all 34 tests. Completed: the full conclusion of `equivariant_cycle_fibres` (0.4), where each cycle meets every fibre in the same number of points, and the "in each block" form of `s′` in 5.1. The README claims nothing stronger than the plan supports. Its extra API (for example `harmonicMass`), extra Checks and the 5.3 repair are all consistent with the plan's accepted source repairs. |
| 3. Own words | Pass. There are no source passages and no section-by-section summaries. Every claim carries a theorem, section and page locator; the locator corrections are listed below. |
| 4. No process | Pass. A search for packet, node, job, review, coverage, catalogue, checkpoint, accepted, plan, atlas and gap found nothing in the README or Lean. Atlas suppliers are cited by roadmap and target name with a link, as in the accepted HilbertModularVarietiesAndShimuraCurves package. |
| 5. Suggested.lean | Pass. Before edits, `lean-check` at Mathlib 082e2d3 / Tau Ceti f790474 exited 0 with 33 warnings, all `declaration uses 'sorry'`. After edits it exits 0 with 34 warnings, all `sorry` (one more example). The file is 291 lines. Twelve light definitions have real bodies (`EqualPartMerging`, `MergePerms`, `BadTransitive`, `maxFactorMultiplicity`, `TupleRootField`, `tupleRootQuotient`, `IsKFoldIrreducible`, `harmonicMass`, the Prop structure `PartitionLaw`, `GoodEvent`, `minSupport`, `orbitalDistinguishers`). Eleven theorems are end results or layer milestones, proved by `sorry`. There are 23 `example`s and one real-bodied local instance (the discrete `MeasurableSpace` on partitions). There is no sorry'd data, no `True` placeholder and no `#eval`/`#print`. `scripts/check_sorry_data.py` passes. Every definition, theorem and example was compared with the README statement it records. One real mismatch was fixed (see correction 1). Every definition target of the plan is declared. The theorem targets that are not declared are named in the closing comment. |
| 6. metadata.toml | Pass: the single line `topic = "math.NT"`. This is the topic of the parent roadmap and fits a paper on random polynomials over ℤ. |

`python3 research/blueprint/intake.py check-files` on the three package files: 3 files, 0 problems.

## Sources

All four public PDFs were downloaded afresh. Their printed page numbers equal the PDF page numbers.

| Source (version, SHA-256 prefix) | Locators checked | Result |
| --- | --- | --- |
| Bary-Soroker–Koukoulopoulos–Kozma, arXiv:2007.14567v3 (`adb1359d…`) | Introduction p.4 (irreducible iff transitive) and p.5 (k-fold irreducibility, the eleventh cyclotomic example, (n−2)-fold corollary); §11, (11.1) p.54; Definition 11.2 and its example, Lemma 11.3 p.56; fibre decomposition (11.6) and Claim 11.4 p.57; §11.3 pp.57–58; Proposition 12.1 (a)–(c), conclusion and (12.1) p.59; Lemmas 12.2 pp.59–60, 12.3 and 12.4 p.60, 12.5 pp.60–61 (with the `1/2 − e^γ/8` coefficient), 12.6 p.61; §12.2 notation p.61; Lemmas 12.7, 12.8 and the opening observation of 12.9 p.62; Cases 1–3 of 12.9 and the proof of 12.1 p.63 | All correct. The four inherited source findings (E1–E4 in the plan) were re-read at the source. The E1 repair, five middle-range and four large-range witnesses so that every companion part is at most `n/4`, is sound (adversarial table). |
| Babai, *Primitive coherent configurations and the order of uniprimitive permutation groups*, notes of 21 October 2018 (`0727084a…`) | §§2–4 pp.3–5 (Exercise 3.4, Exercises 4.4–4.8, 4.10); Definition 6.1 p.5; Exercise 6.2 and Theorem 6.6 p.6; §8: Lemma 8.5 and Lemma 8.7 (with `n ≥ 5`) p.7, Lemma 8.9 to Lemma 8.14 p.8, Exercise 8.16 to Corollary 8.19 p.9, closing comparison p.10; Exercise 9.5 and Corollary 9.6 p.10 | Correct after two locator rewordings (corrections 6, 7). The page image of p.7 confirms that Lemma 8.5 is about the **complement** of the symmetrized constituent; the text layer drops the overbar. |
| Schomburg, arXiv:2209.12049v1 (`6374c9c7…`) | commutator support inclusion (2.1) p.1; Lemmas 2.3–2.5 pp.3–4; standing hypothesis (no alternating subgroup, so `m > 3`) and Theorem 3.1 with its proof pp.4–5 | Correct. The inequality `n ≤ 4m + 6/(m−3)` and the use of `n ≥ 38` to force `m ≥ 10` are as stated. |
| Bary-Soroker–Kozma, arXiv:1710.05165v2 (`30e999fd…`) | §3.1, Claim 1 and its proof pp.9–10 | Correct. |

The DOI link of the published BSKK article resolves. The Babai URL serves the PDF. From this machine the
`https` form fails certificate verification because the server omits an intermediate certificate; the
link itself is fine.

## Gaps and supplier order

- Every prerequisite is one of the following: Mathlib or Tau Ceti at the pins (all signatures read; see
  below); the current Tau Ceti cycle-fibre API, which the README labels as current; the upstream parent
  PolynomialGaloisGroups Layer 1 (the imprimitivity grid); or AnalyticNumberTheory targets
  `mertens-prime-product` (AN.2) and `uniform-divisor-subpower-bound` (AN.5).
- No `FoundationsAndLibraryIntegration` or `UPSTREAM:` reference occurs.
- PolynomialGaloisGroupsPartII is outside the 94 roadmaps of `upstream/CaraianiNewton.md`.
  AnalyticNumberTheory is tier 14, merged with ArithmeticStatistics; its plan is accepted and it has no
  package. As with the accepted MordellLawrenceVenkatesh and RankZeroOneBSD packages (also outside the
  94), citing an in-order supplier is allowed, but this roadmap must follow that supplier upstream (see
  the maintainer notes).
- The plan's inherited gap PG2-G1 remains real: the AN.2 reader leaves the identification of the
  Mertens constant with `γ` as an explicit unresolved input. The README states the exact contract,
  explains why an unspecified `O(log x)` bound would not do, and does not claim the analytic chain is
  closed.
- Internal order: every `*Needs:*` reference points to an earlier subsection, or, for the deterministic
  exclusions in Layer 5, to Layers 0–4 only.

Supplier signatures, from the Sonnet subagent's report, checked by the reviewer on the points used:

- Every Mathlib and pinned Tau Ceti declaration named in "Exact supplier contracts" exists at the
  stated module, with the stated hypotheses.
- `MulAction.isMultiplyPretransitive_of_le` also takes `[Finite α]`, which is harmless here.
- `IsMultiplyPretransitive.alternatingGroup_le` takes the carrier explicitly.
- The four `Function.Semiconj`/`orbitCount` declarations exist only in current Tau Ceti (a91d3aaf). The
  README already says so, and `Suggested.lean` does not use them.

## Duplication against current Tau Ceti and TauCetiRoadmap

The search was by mathematical object: equal-part merging, ramified Frobenius cycle types, root
multiplicity as a fibre count, higher irreducibility, partition laws and Łuczak–Pyber type results,
anatomy of partitions, minimal degree, Bochert, Babai, distinguishers, imprimitive cycle arithmetic,
Mertens and the divisor bound, and the largest factor multiplicity. It covered every TauCetiRoadmap README
and Suggested.lean on current main, including the nine newer roadmaps and `Completed/*`, and the current
Tau Ceti library. Results:

- **No target exists there.** No target was removed.
- **Already-recorded partial overlap.** Single-cycle fibre arithmetic is `TauCeti/GroupTheory/Perm/Semiconj.lean`, which the README already treats as a supplier. Current Tau Ceti also has the specialisation to permutation triples, `ncard_sameCycle_and_mem_mul_minimalPeriod_blockActionHom` in `Combinatorics/PermutationTriple/BlockQuotient.lean`. It is the same single-cycle formula and does not contain 5.1's invariant whole-block unions.
- **Unramified only.** The Dedekind/Frobenius cycle-type results (`NumberField/Frobenius/CycleType.lean`, `FieldTheory/GaloisGroups/Reduction.lean`) cover unramified primes. The parent README (line 1078) and `Tower.lean` leave the ramified case open, so 1.3 is new.
- **New current-library supplier.** `Polynomial.rootSet_divByMonic_X_sub_C` (current only: removing a simple base-field root deletes it from the root set) is now named in 2.1 as a current-library aid.
- **Two-transitive case.** The parent plans only `k = 2` (`TauCeti.is_two_pretransitive_iff_irreducible_divByMonic`, pinned), which the README cites.

## Unit tests

Every definition has at least three discriminating Checks:

| Subsection | Checks |
| --- | --- |
| 0.1 | 4 |
| 0.2 | 3 |
| 0.3 | 3 |
| 1.1 | 4 |
| 2.1 | 6 (field and quotient) |
| 2.2 | 4 |
| 3.1 | 6 (harmonic sum and law) |
| 3.2 | 5, one added (correction 4) |
| 4.1 | 3 |
| 4.2 | 3 |

Each was recomputed (adversarial table). The one weak spot: the existing `E₁` Check (`{2,2,4}` at
`α = 0`) rejects a distinct-values definition but not a membership-based one. The added Check (`{2,6}`
passes) catches the membership version, and it is pinned by a new `example`.

## Adversarial mathematics pass

| Statement | Instances computed | Outcome |
| --- | --- | --- |
| `EqualPartMerging` and API | Source example `{1,1,2,2,2,3}` → `{1,1,2,3,4}` at bound 2, not `{2,3,6}`; `{1,1,2}` → `{2,2}` → `{4}` but not `{1,1,2}` → `{4}` at bound 4; empty multiset at every bound; `y < 1` forces empty blocks; `y < 2` forces singletons | As stated; non-transitivity of iterated merging confirmed. |
| `MergePerms`, `BadTransitive` | identity at `y = 1`; 5-cycle in `{5}`; empty carrier (`indiscrete 0` has no parts); `BadTransitive (Fin n) = ∅` for `n ≤ 3` (degree 0, 1: only subgroup is `⊤ = A`; degree 2: `A₂ = ⊥`; degree 3: transitive subgroups are `A₃, S₃`); identity and 5-cycles via `C₅`; conjugation preserves `≠ A` since `A` is normal | As stated. |
| `equivariant_cycle_fibres` | bottom length 1, fibre 2 (identity `{1,1}`, swap `{2}`); bottom length 3, fibre 2 (`{3,3}` or `{6}`); return sizes sum to `m` | As stated. The statement now also carries "meets every fibre in `m_i` points". |
| `maxFactorMultiplicity` | `0`, `1` give 0; `(X+1)³` over `F₂` gives 3; `X(X−1)` over `F₃` gives 1; unit squarefree with value 0 | Premises `f ≠ 0`, `¬IsUnit f` in the squarefree iff are needed and present. |
| `fibre_card_eq_rootMultiplicity`, `ramified_merging` | `{0,2}` → `F₂` gives `X²`, multiplicity 2; `X² − 2` at `p = 2` (`M = 2`, both `{1,1}` and `{2}` allowed); squarefree reduction forces equality; constant `A` excluded by `natDegree > 0` | As stated; no unramifiedness premise needed (Frobenius lift exists at every prime). |
| `TupleRootField`, `tupleRootQuotient`, `IsKFoldIrreducible` | `j = 0` (field `⊥`, quotient `f`); all roots of monic separable `f` give `1`; `2X(X−1)` gives `2`; `k = 0` and `k > n` excluded; `Φ₁₁` (group `C₁₀` regular, so 1-fold, not 2-fold); `(X²−2)²` fails separability | As stated. |
| `kfold_iff_multiplyPretransitive`, `kfold_degree_sub_two` | `n = 3` (1-fold iff `A₃ ≤` image, transitive subgroups of `S₃`); `n ≥ 4`: an `(n−2)`-transitive group has order at least `n!/2`; `L/K` Galois for every tuple field `K` | As stated; `n ≥ 3` makes `n − 2 ≥ 1`. |
| `PartitionLaw`, `harmonicMass` | masses `0`, `1/2`, `3/2`; zero indicator gives `ν(univ) ≤ C`; diagonal pair at `n = 8` gives `C/4`; `ν.real` of an infinite measure is `0`, so normalisation must be separate | As stated. |
| `GoodEvent` | `{2,2,4}` fails `E₁` at `α = 0`; `{2,6}` passes (added); `n = 1` passes `E₃`; partitions of 3 fail `E₅*`; `{3,3}`, `n = 6`, `δ = 2` fails `E₂` | As stated. |
| 3.3–3.9 | uniform harmonic errors for `α ∈ [ε/2, 1/40]`, `r ≤ n^α` (lower endpoint `≥ n^(1−3α)`); `e^γ/8 ≈ 0.2226 < 1/4` via `γ < 2/3 < log 2`; `Σ_{j ≤ r/2} (nj/r)^(−δ) = O(n^(−δ) r)`; `r = 2`, `3 ≤ r ≤ log n` (exponent `≤ −4κα/3`), `log n < r ≤ n^(κα)` (`n^(2κα/r)` bounded); count `≤ 3 ≤ tL_r` | As stated. 3.4 uses only the upper Mertens bound (correction 9). |
| `minSupport`, `orbitalDistinguishers` | `S_(Fin 0)` none; `S₂` some 2; `A₃` some 3; `D(x,x) = ∅`; trivial group gives `univ`; full symmetric group gives `{x,y}`; `D(x,gx) ⊆ supp g` | As stated. The definition agrees with Babai's colour-based one: two pairs share an orbital iff some `g` maps one to the other. |
| 4.3–4.6 | uniprimitive `C₃` at `n = 3` (Theorem 6.6 holds, so `n ≥ 5` is Lemma 8.7's restriction); `√(n−1) ≤ (n−1)/2` iff `n ≥ 5`; `2(n−1)/3 > n/4`; Bochert bound `4m + 6/(m−3)` = 22, 23, 26, 29.5, 33.2, 37 for `m = 4…9`; `m ≥ 10` gives `n ≤ 4m`; `(√37 − 1)/2 ≈ 2.54 < 4`; `n/4 ≥ (√n−1)/2` | As stated. Jordan's prime-cycle theorem alone does not suffice (remark added). |
| 5.1–5.3 | fixed point (`r′ = s′ = 1`); within-block swap vs cross-block swap; `r ≤ n^(δ/2)` with `E₂`; middle range with `θ = 0`, `κ = 1`; large range `s ≤ n^α`, `1 − 3α − θ ≥ 7/8 ≥ κα`; `√n/3 < (√n−1)/2` iff `n > 9`; the power `p^(a−1)q` leaves `k/p` cycles of length `p` | One inequality fixed (correction 5); everything else holds. |
| 6.1–6.2 | `θ = 0` (bound 1, cycle type itself); `θ = δ/2 − ε` (`α = ε/2`); `κα ≤ δ/4`, `κα ≤ κ/4`; `(X²−2)²` excluded; ramified prime allowed | As stated. The Lean conclusion now places the witness in the image (correction 1). |

Generality: README and Lean agree on every domain. The settings are: arbitrary fields in Layer 2; a
commutative ring to a field in 1.2; monic `A : ℤ[X]` with separable image over `ℚ` in 1.3 and 6.2;
measures on `Nat.Partition n` with probability normalisation separate; finite carriers with
`Subgroup (Equiv.Perm α)` in Layer 4. Every denominator is nonzero where used: `kl`, `r`, `m − 3`
(since `m ≥ 4`), `n − 1`, nonzero valencies, `log n` for `n ≥ 3`.

## Corrections made in place

1. **Lean, `galois_merging_certificate`.** The README (and plan) say the witness lies in the root-action
   image; the Lean only asserted `σ ∈ BadTransitive`. Added `σ ∈ (MulAction.toPermHom …).range` to the
   conclusion and adjusted the docstring.
2. **Lean, instances and imports.** Removed the two blanket local instances (`DecidableEq α :=
   Classical.decEq α` for every type, and `Decidable p := Classical.propDecidable p`). They overrode the
   library instances inside every statement, for example `Multiset.count` on `ℕ`, and would force
   contributors to fight instance mismatches. `open Classical` remains for the propositional `if` and
   filters. Removed the unused import `TauCeti.FieldTheory.GaloisGroups.MultipleTransitivity`. The file
   elaborates identically.
3. **0.4.** The statement now gives the plan's full conclusion. Each cycle has length `d·m_i` with
   `1 ≤ m_i ≤ m` and meets every fibre in exactly `m_i` points; the `m_i` sum to `m`; hence the merging
   statement.
4. **3.2 Checks and Lean.** Added the `{2,6}` occurrence Check for `E₁` and its `example`.
5. **5.3, middle range.** `r′ ≥ ℓ/s > n^(δ/2−α) > n^(κα)` had a false final strict inequality: it is
   an equality at `θ = 0`, `κ = 1`. It is now `≥`, with the reason. The strict conclusion still holds
   via `r > n^(δ/2)`.
6. **4.2 locator.** "Definition 6.1 and Exercise 6.2, §§6–7, pp.5–6" became "§6, Definition 6.1, p.5,
   and Exercise 6.2, p.6"; §7 is the probabilistic argument.
7. **4.4 locator.** "Lemmas 8.5–8.18 and Corollary 8.19" became "§8, from Lemma 8.5 to Corollary 8.19,
   pp.7–9, with the closing comparison at the top of p.10". The locator now also notes that `n ≥ 5` is
   the hypothesis of Lemma 8.7. 8.18 is a corollary, and the final comparison is on p.10.
8. **5.1.** `s′` "counts the cycle's points in one block" became "the number of the cycle's points in each
   block it meets, the same for all of them", as in the plan.
9. **Mertens contract.** Recorded that only the upper half `∏_{p≤x}(1 − 1/p)⁻¹ ≤ e^γ log x + D` is used,
   in 3.4. A lighter supplier contract therefore suffices.
10. **`log 2 > 2/3`.** Named its Mathlib source, `Real.log_two_gt_d9` in
    `Mathlib.Analysis.Complex.ExponentialBounds`.
11. **4.5 wording.** "moving any fixed point different from `a`" became "moving any given point".
12. **4.6.** Added the plan's remark that Jordan's prime-cycle theorem alone does not give the bound.
13. **2.1.** Named the current-library aid `Polynomial.rootSet_divByMonic_X_sub_C`.
14. **Title and wording.** "Galois groups of polynomials, Part II" capitalised as in the parent. The
    4.1 heading "An optional minimum" became "Minimum support, valued in `Option ℕ`". Two "for later
    use" phrases were replaced by the subsections they feed.
15. **Consumer status.** The Scope entry for ArithmeticStatisticsPartIIRandomPolynomials now says it is
    a proposed continuation of ArithmeticStatistics. It has no plan yet; it only appears in the BSKK
    paper routing.

16. **Proofread fixes.** These came from a whole-file proofread of the corrected README. The arithmetic of every example and Check was recomputed there and is correct.
    - In the scope bullet for the parent, "Layer 5 / Layer 9" became "its Layer 5 / its Layer 9".
    - The analytic inputs are now "AN.2 for 3.4 and, through 3.4, for 3.8", no longer "3.4–3.8".
    - `C(nj/r)^(−δ)` became `C·(nj/r)^(−δ)`.
    - In 5.3 the pulled-back sub-multiset is named `V`, since `U` is the block union in 5.1.
    - In 4.4 the valencies are `v_i`, since `ρ` is the partition elsewhere.
    - Conventions now says which letters (`m`, `r`, `D`) are local to a layer.
    - The 0.4 proof paragraph and a 5.1 line were rewrapped.

    The proofread also suggested dropping `E₄` from the hypotheses of `imprimitive_exclusion`. It was
    kept: the plan states the target with all five events and notes that `E₄` is unused, and the README
    says the same.

Final SHA-256 of `Suggested.lean`: `14ffe6b836fdac643c248c1fa80cf59137f700436cf83411cc8f05afa500fad6`.

## Notes for the maintainer (no change made)

- **Upstream order.** This roadmap cites AnalyticNumberTheory AN.2 (Mertens' product theorem with
  constant `e^γ`, upper half only) and AN.5 (`τ(n) ≤ D_η n^η`). AnalyticNumberTheory is tier 14, merged
  with ArithmeticStatistics, and has no package. Its AN.2 proof leaves the identification of the
  constant open. Either this roadmap goes upstream after that package, or the two statements move down
  into a new Layer 3 subsection here. Neither is in Mathlib at the pin or in current Tau Ceti or
  TauCetiRoadmap. Mathlib does have `Real.eulerMascheroniConstant` and the behaviour of `riemannZeta`
  near 1, which the constant identification would use. Everything outside 3.4, 3.6, 3.8, 3.9 and 6.1
  is independent of these inputs.
- **Current-library dependencies at port time.** The cycle-fibre API (`Function.Semiconj.*`) and
  `Polynomial.rootSet_divByMonic_X_sub_C` are in current Tau Ceti (a91d3aaf) but not at the atlas pin.
  The README marks them as current, and `Suggested.lean` does not import them.
- **Namespace.** The plan's library names use `TauCeti.PolynomialGaloisGroupsPartII`; the package uses
  `TauCetiRoadmap.PolynomialGaloisGroupsPartII`, the upstream convention for roadmap files. No change.

## Questions for the orchestrator

None.
