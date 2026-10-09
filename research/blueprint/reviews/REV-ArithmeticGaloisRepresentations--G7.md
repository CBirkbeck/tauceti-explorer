# Independent review: Arithmetic Galois representations, G7

**Accepted** as a complete target-level planning pass, with G7 **planned**, 22 named gaps and every implementation status `unchecked`. Reviewer: Codex, session `codex-warZZa`, job `REV-ArithmeticGaloisRepresentations--G7`, issue #7945. Date: 9 October 2026. This session did not author the inputs, which were submitted by `codex-hMXaBg` for #7954.

The packet records `independent-review-REV-ArithmeticGaloisRepresentations--G7` and a justified verdict for every new node: **13 verified, seven corrected, zero added, zero unverifiable**. The current target-level rule in WORKERS.md and detail.json supersedes the generated issue's earlier lemma-level setting. Acceptance verifies the mathematical statements and the honesty of their proof boundaries, rather than certifying implementations or closing the stage.

## Scope and counts

| Item | Input | Reviewed result |
|---|---:|---:|
| New nodes | 20 | 20 |
| Constructions / theorems / lemmas / comparisons | 8 / 8 / 1 / 3 | 8 / 8 / 1 / 3 |
| Imported parent G7 targets | 77 | 77 |
| Parent remaining-item dispositions | 63 | 63 |
| Construction API items / tests | 32 / 26 | 32 / 26 |
| Comparison adapter API items / tests | 6 / 4 | 14 / 10 |
| Total API items / tests | 38 / 30 | 46 / 36 |
| Pinned / current-library declarations | 26 / 5 | 26 / 5 |
| Sources / replacement planets | 13 / 6 | 13 / 6 |
| Gaps / supplier entries | 22 / 10 | 22 / 15 |
| Typed node counterparts / explicit missing-carrier nodes | 15 / 5 | 15 / 5 |

The packet checker counts API and tests only for definition/construction kinds. Its reported 32 API items and 26 tests therefore exclude the three comparison nodes' adapters; the total above includes them.

## Corrections applied

- **Framed symmetric-power comparison:** supplied the missing API, uses and three named tests for its two definitions. Degree zero gives 1, degree one gives the input matrix, and degree two sends `diag(a,b)` to `diag(a²,ab,b²)`. The last test checks both degree and monomial order without factorial normalization. The reversed input basis is correct for the pinned count-zero indexing and remains intact.
- **Residual cyclotomic comparison:** supplied its API, uses and three named tests: the identity automorphism, action on actual p-th roots with identity coefficients, and triviality at p=2. The automatic root-cardinality statement now explicitly concerns the chosen algebraic closure of a number field. An arbitrary number field need not contain p roots. The body remains an explicit composition of the existing character and coefficient units map.
- **Sen–Tannakian input:** added ReductiveGroups layer 1, which owns representations/comodules and Tannakian reconstruction, alongside layer 2's Lie interface. The tensor-derivation/Lie comparison remains gap 4. The three weights `a−b,0,b−a` now explicitly refer to the trace-zero adjoint; the full endomorphism adjoint has another zero weight.
- **Central-lift ramification:** added the existing finite-coefficient descent and stable-lattice prerequisites and ClassFieldTheory layer 7's local reciprocity. The proof sketch specifies a faithful matrix embedding and its torsion-free pro-p congruence subgroup `1+p²M_m(O_E)`, including p=2. Gap 7 now includes the comparison of these constructions with the topological algebraic-group and inertia carriers. The theorem retains an arbitrary central algebraic quotient and an already continuous lift, rather than narrowing to isogenies.
- **Derived monodromy:** added ReductiveGroups layers 4, 5 and 7 for torus character lattices, unipotent fixed vectors and maximal tori. Removed the claim that layer 6 itself supplies the Lie-element/maximal-torus comparison; that exact comparison remains gap 22. The distinct-eigenvalue argument avoids kernels of pairwise ambient representation weight differences, which need not be roots of the monodromy group. Milne Proposition 6.21 is on p.130, whereas Definition 6.24 is on p.131. The packet and reader now distinguish those pages.

- **Totally real rational weights:** added the central-lift ramification theorem specialized to `G_m→1`, which supplies finite global ramification before invoking geometric character classification. Gap 5 explicitly retains the rank-one Hodge–Tate/locally-algebraic local comparison as well as the totally-real global classification.
- **Tate vanishing:** added ClassFieldTheory layer 7 directly for the local character/Brauer-boundary step already used in its proof sketch. The finite-order global character-extension step remains gap 6.

The reader also corrects Newton–Thorne's negative cyclotomic Hodge–Tate convention to §1.2, p.8. Every mathematical, API, test, prerequisite and gap correction is synchronized across the packet, reader and suggested file where applicable. No parent packet or upstream roadmap was edited, and no source erratum is alleged for a mistaken roadmap locator.

## Sources and baseline

I retrieved all 13 public PDFs and independently checked their recorded SHA-256 hashes. Every new node's source locator and `match` was read. The main mathematical checks were:

| Source | Checked support |
|---|---|
| CHT, pp.7–10 and Definition 2.5.1 p.55 | Disconnected group, pairing dictionary, adjoints and generalized eigenprojection |
| BLGGT, §1.1 pp.11–13; §2.1 p.31 | Component sign, tensor multiplier, rank-one transfer and polarized pairs |
| Berger, II.1.1–II.1.2 pp.7–9 | Completed action/decompletion, logarithmic Sen normalization and semisimple-integral criterion |
| Patrikis, Theorem 2.1.1 pp.15–16; §2.2.2 pp.23–24; Lemmas 2.3.15, 2.3.17 pp.31–32 | Discrete Q/Z vanishing, Lie/Sen comparison and rational weights of totally real characters |
| Conrad, Lemmas 5.1–5.2 pp.14–15; Proposition 5.3 pp.15–16 | Finite coefficient descent, ramification of a central lift and central-torus existence |
| Gan–Takeda, Lemma 6.1 pp.1859–1860 | Equivariant isotypic classification of alternating forms with fixed multiplier |
| Newton–Thorne, §1.2 pp.7–8; Lemma 2.3 p.11; Lemma 4.7 pp.33–34 | Cyclotomic convention, symmetric-power images and derived monodromy |
| ACC+, Definition 6.2.29 and Remark 6.2.31 pp.1044–1045; Gee–Newton, Remark 3.2.2 and Lemma 3.2.3 p.15 | Trace-zero obstruction and generalized eigenprojector conventions |
| Milne, §§1c,1g pp.18–20,28; Cartier 3.23 pp.70–71; Theorem 5.39 pp.108–109; Proposition 6.21 p.130; Definition 6.24 p.131 | Point closures, images, characteristic-zero smoothness and derived groups |
| BCGNT, Definition 5.2.1 and Lemma 5.2.2 pp.50–51 | Joint residual/cyclotomic image and stronger decomposed-genericity base-change assumptions |
| Guralnick–Herzig–Tiep, Corollary 9.4 pp.50–51; BCGP, §7.5 pp.198–202 | Checks of the retained finite-group boundary and distinct residual image conventions |

The extra power, trace and matrix adapter statements use the cited Lean constructions as their algebraic source; the papers motivate their consumers. In particular, BLGGT's component conventions justify the power-multiplier formula but do not assert a general integral symmetric-power pairing theorem.

All 26 baseline declarations were read with their ambient hypotheses at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The 19 cited module files also match the pinned build byte for byte. **No baseline citation was removed, replaced or added.** The updated `checked` fields record this independent verification. Finite-projective dual-tensor duality is available, but Mathlib trace's free branch does not supply projective trace. The eigenspace and projection suppliers have the stated field/complement hypotheses. The finite-Galois surjectivity theorem requires the displayed intersection hypothesis and does not construct the absolute joint-kernel comparison automatically.

I also read all five cited current Tau Ceti declarations at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and checked ownership against TauCetiRoadmap `5a7b3a4fd66441748be2dfa961e8f140f995cb03`. Generic continuous transfer, algebraic tensor induction, image factorization, derived ideals and the component-group fppf projection are existing work. The component projection does not alone assert finite étale representability. ReductiveGroups and ClassFieldTheory provide the corrected supplier routes; the arithmetic comparisons remain consumer proof tasks. The current LocalGaloisGroups, ProfiniteArithmetic, OrthogonalSpinGroups and IntegralHeckeAndGaloisDeterminants boundaries remain intact.

The reviewed AUDIT-31 G7 entry in `data/library-coverage.json` marks algebraic powers and endomorphism actions as partial suppliers and points reconstruction to IHG.1. The packet respects those owners. Its older tensor-induction absence note is superseded by the independently read current declaration.

The follow-up has no `sourceIssues` entries or source excerpts. Its 77 imports explicitly retain the accepted parent's statements, APIs, tests and source findings. This review does not claim a fresh edition collation or recomputation of those findings; the unread/certification boundaries remain gaps 9–20.

## Closure, interfaces and validation

All 77 imports match the parent G7 IDs exactly. Each of the 63 parent remaining entries has one indexed disposition. Applying the eight dependency replacements and 13 additions to the parent plus follow-up gives an acyclic graph of **347 nodes**. Each removed dependency actually exists in the parent's consumer. New G7 nodes avoid the higher-tier PadicHodgeTheory and ArithmeticGaloisDuality routes. The parent remains unchanged, so assembly must apply the recorded transformations.

All 11 nodes defining constructions or comparison adapters have an API, consumer uses and at least three discriminating tests. I checked the mathematical meaning and hypotheses of the signatures as well as correspondence of all 46 API names and 36 test labels. The five missing-carrier targets remain exact mathematical statements in comments; arbitrary propositions or freely chosen operators would not express them. The 22 gap entries agree with coverage. The six mathematical planets replace, rather than append to, the parent G7 selection.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticGaloisRepresentations--G7.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/ArithmeticGaloisRepresentations--G7.lean`: successful elaboration, 74 declaration-uses-`sorry` warnings, no other compiler diagnostics.
- Independent import/disposition/dependency, graph, API/test correspondence and reader-anchor checks: passed.

There are no unresolved contradictions or questions requiring the manager before acceptance. The next worker should assemble the corrected planning documents while preserving the named gaps and existing supplier ownership. None of the finite-group computations or analytic Sen proofs has become a certified implementation through this review.
