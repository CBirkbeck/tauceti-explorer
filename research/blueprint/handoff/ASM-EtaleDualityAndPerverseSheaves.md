# ASM-EtaleDualityAndPerverseSheaves

Assembly job, issue #228. Completed by Codex, session `codex-r3nPoW`, on 2026-10-07, on branch `codex-r3nPoW-asm-etale-duality`. This is the completed assembly deliverable; the underlying blueprint is unaccepted and has the open obligations recorded below. It is not an unfinished assembly checkpoint.

## Deliverables and provenance

The [assembled reader](../readmes/EtaleDualityAndPerverseSheaves.md) opens with purpose, scheme scope, neighbouring ownership boundaries, coefficient/shift/Tate/projective-bundle/perversity/Frobenius conventions, sources, the pinned library baseline and the development order. It then gives every reviewed packet node with its statement, hypotheses, proof plan, exact prerequisites, uses, API, tests, acceptance examples and source locators. The requests, gaps, baseline declarations and source issues are retained. The mathematical bodies follow the current reviewed packets, correcting the stale claims in the original part readers without editing those part readers.

The [assembled suggested file](../suggested/EtaleDualityAndPerverseSheaves.lean) has one standard note and one block of 53 distinct individual Mathlib imports. Both original bodies remain in `TauCeti.EtaleDuality`. The ambient `EtaleSheaf`, `EtaleDerived` and `GeometricPoint` carriers are shared. The later `GeomPoint` is an abbreviation of `GeometricPoint`. The constructible data operations are qualified as `Dbc.pullback`, `Dbc.pushforward`, `Dbc.lowerShriek`, `Dbc.upperShriek`, `Dbc.verdierDual`, `Dbc.gysin`, `Dbc.properPushforward`, `Dbc.poincarePairing` and `Dbc.extendScalars`, distinguishing them from the ambient derived operations. The names in the packets' public API are retained. The chained method call on a correspondence remains `(c.pushforward f g).pushforward …`; qualifying that field access as a namespace would not elaborate.

Inputs are [the early packet](../packets/EtaleDualityAndPerverseSheaves--EDC.0.json), [the late packet](../packets/EtaleDualityAndPerverseSheaves--EDC.4.json), their readers and suggested files, and the two completed independent reports: [REV-EDC.0](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.0.md) and [REV-EDC.4](../reviews/REV-EtaleDualityAndPerverseSheaves--EDC.4.md). Both verdicts remain `needs_changes`. Their review objects, checked records, source witnesses, implementation statuses and coverage metadata were not changed. The reports, rather than the earlier part handoffs' completion claims, determine the remaining revision work.

The library baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The assembly read the AUDIT-18 entries and the cited declaration statements at the Mathlib pin, plus the upstream AdicSpaces and JacobianChallenge roadmaps for density and ownership. The file imports only Mathlib, so no mathematics is imported from the shared build's different Tau Ceti checkout head. The source provenance and PDF witnesses are inherited from the independent reports; this assembly does not claim a fresh reading of every cited paper or a new source erratum. Milne and Weil I aliases are grouped by URL in the reader's bibliography, with their part-specific locators retained.

## Reviewed mathematical change requiring re-review

Only one packet field changed: `acceptance[1]` of `EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps` in the early packet. Its old acceptance example incorrectly set `f = id` while claiming a non-isomorphism. The node's independently corrected statement and test already use the closed-immersion self-pullback square.

The acceptance example now uses `f = g = i : {0} → A¹`, with `f′ = g′ = id` and nonzero prime-to-characteristic torsion coefficients over an algebraically closed field. Exchange (ii) is `i^!Λ = Λ(−1)[−2] → Λ`, zero and not an isomorphism. With `f = id`, exchange (ii) is instead an isomorphism. Over the geometric point this Hom is Ext² from the rank-one free coefficient module Λ(−1) to Λ, so it vanishes; this explains the zero map. This is an alignment with the reviewed test, but it is a reviewed node's mathematical example: **schedule re-review of this node**. Its existing checked record and the overall verdict have deliberately not been overwritten.

All other packet content is unchanged. No atlas, campaign, decomposition, library-audit, link-map, supplier or review-report file was edited. No cross-part prerequisite needed correction: all 80 already use exact supplying node identifiers.

## Inventory and dependency reconciliation

| Inventory | Early part | Late part | Union |
|---|---:|---:|---:|
| Nodes | 50 | 62 | 112 |
| API items | 141 | 96 | 237 |
| Unit tests | 76 | 60 | 136 |
| Planets | 24 | 19 | 43 |
| Baseline declarations | 40 | 11 | 49 distinct |
| Supplier requests | 10 | 13 | 23 |
| Gaps | 10 | 10 | 20 |
| Restructure proposals | 3 | 5 | 8 |
| Source records | 6 | 19 | 23 distinct URLs |
| Source issues | 10 | 3 | 13 |

All 112 nodes remain `implementationStatus: unchecked`. The early packet retains status `complete` with eight `planned` coverage entries; the late packet retains status `partial` with five `partial` entries and their remaining lists. These inherited metadata describe planning coverage and do not mean mathematical closure or acceptance. The union graph has 358 internal edges, 80 across parts, no unresolved same-roadmap references, no coarse same-roadmap stage prerequisites and no cycles.

The reader orders the first part by EDC.0, the adjoint, trace/purity, biduality, pairings and cycle classes; EDC.1 and EDC.2 are collectors. The independent Jacobian/Weil-pairing curve input precedes general biduality. In the late part, the EDC.6 coefficient-category construction must precede its integral/rational consumers; its perverse extension adapter consumes EDC.5 afterward. Numeric section order therefore does not impose a whole-layer prerequisite cycle.

## Remaining work for revision and acceptance

The two independent reports provide node-by-node inventories and must accompany any revision. The assembled reader deliberately exposes all 20 inherited gaps; none is closed by this job. In particular:

- The enhanced compact-support construction needs actual compactification/localization coherence. Smooth purity needs identification with the chosen trace-adjoint normalization. Constructible biduality needs the noncircular boundary dévissage and regular-base extension. Chow descent, Tor intersection multiplicities and the cohomological normal-cone specialization remain proof gates.
- The early suggested file still has 95 API/test entries only in its named “Not typed here” comments; its detailed inventory is in REV-EDC.0. Supplying the carriers and faithful admitted signatures is revision work. The assembly preserves these comments rather than making a missing property into an admitted proposition.
- Common finite-type/base/coefficient conditions must be encoded in the late signatures, including complete integral coefficients and a chosen uniformizer. IC must take an actual lisse sheaf with its dimension shift; the current arbitrary-perverse input invalidates dense-open independence. Small-map/finite-birational targets need their geometric input data.
- Relative Lefschetz must take a chosen projective map, relatively ample line bundle and twisted Chern-class action. Primitive objects must be the specified kernels, rather than arbitrary retracts. Weight filtrations need finite indexing, uniqueness and strict functoriality; decomposition needs a simultaneous finite isomorphism with semisimple constituents.
- Correspondence composition, restriction, identity and pushforward must compare the actual morphisms under their support isomorphisms. Integration needs a proper structure map. Tame order concerns the scheme automorphism; the Frobenius carrier must be geometric cohomology. Reciprocal characteristic polynomials, algebraic multiplicities and the symmetric determinant sign still need their full signatures.
- The late packet counterexamples `TauCeti.EtaleDuality.not_isLE_iff_homology_of_bounded_below` and `TauCeti.EtaleDuality.not_unrestricted_standard_truncation` still need typed Lean examples. The canonical homology test needs a natural identification, and the recollement no-adjoints smoke test needs a discriminating replacement.
- Strong `c^*` transport of diamond duality requires an essential-image theorem; `Rc_*` recovery and full faithfulness alone do not supply it. Geometric origin, categorical graded Lefschetz data, restricted stratified specialization and coefficient descent are target-level gaps. The complete-intersection Euler formula is separate from constancy of Betti ranks.
- Stacks, perfect/equivariant coefficients, general-base nearby cycles, scheme-relative perversity/ULA, trait absolute purity and Grothendieck–Ogg–Shafarevich require the proposed ownership decisions or missing supplier contracts. Do not extend scheme theorems to these consumers solely by citation.

The standard note in the merged suggested file reports these limitations. Successful elaboration with `sorry` tests the written types; it does not validate overscoped or vacuous signatures and does not change either review verdict.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: zero errors, zero warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.4.json`: zero errors, zero warnings.
- `lean-check research/blueprint/suggested/EtaleDualityAndPerverseSheaves.lean`: exit 0 at the pinned Mathlib; 394 warnings, all “declaration uses sorry”, no errors. Available memory exceeded 20 GB; checks were sequential and left no background process.
- A field-by-field assembly check found all 112 statements, hypotheses, proof steps and acceptance examples, plus all 237 API items and 136 tests, in the reader. All 132 explicit node/gap anchors are unique; all internal anchor links resolve. The union prerequisite graph was checked for exact reference resolution and cycles.
- The JSON diff contains exactly the one acceptance field described above; both review objects are unchanged. `git diff --check` and `python3 research/blueprint/intake.py check-files` on the four changed deliverables passed.

No warnings from the packet validators remain. The mathematical and prototype limitations are the inherited gaps, not hidden validator failures. All durable context is in this note, the reader, the packets and the linked independent reports; no scratch files are needed by the next worker.
## Collected supplier requests

The following 23 requests retain their exact packet statements, order and consuming node IDs. A repeated supplier is not a fulfilled request. Ownership and source-specific hypotheses are not weakened by collection.

### EDC.0-R1 — `SchemeAndStackFoundations:SF.2`

From ConstructibleEtale (CohomologicalPointCounting, PR196), integrated by SF.2: (i) constructible sheaves of Λ-modules on X_ét for X noetherian and Λ noetherian torsion (finite stratification by locally closed constructible subschemes on which the sheaf is locally constant with finitely generated stalks), forming a weak Serre subcategory stable under f^* and ⊗; (ii) the sheaf μ_n for n invertible and the exactness of the Kummer sequence 0 → μ_n → G_m → G_m → 0 on X_ét, with H¹(X_ét, G_m) = Pic(X) naturally in X; (iii) the exact pullback f^* and the right derived functors Rf_* and RΓ on the unbounded D(X_ét, Λ) (K-injective resolutions); (iv) topological invariance: a nilpotent thickening Z_red → Z induces an equivalence of étale sites.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-tate-twist); [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-first-chern-class).

### EDC.0-R2 — `SchemeAndStackFoundations:SF.2`

From CompactSupport (PR196), integrated by SF.2: for f : X → S separated of finite type with S quasi-compact quasi-separated and Λ torsion, the functor Rf_! : D(X_ét, Λ) → D(S_ét, Λ) on unbounded complexes, defined through a Nagata compactification as R f̄_* ∘ j_! and independent of it, with: the composition isomorphism R(gh)_! ≅ Rg_!Rh_! satisfying the cocycle condition; proper base change g^*Rf_! ≅ Rf′_!g′^* (SGA 4 XVII 5.2.6); stalks (R^q f_!F)_s̄ = H^q_c(X_s̄, F) (5.2.8); R^q f_!F = 0 for q > 2d when the fibres have dimension ≤ d (5.2.8.1); the projection formula Rf_!(E ⊗^L f^{-1}K) ≅ Rf_!E ⊗^L K (5.2.9; Stacks 0GL5); the Künneth isomorphism (5.4.3); the localization sequence for U open with closed complement (5.1.16.2); Rf_! = f_! left adjoint to f^* for f étale (6.2.11); Rf_! = Rf_* for f proper; preservation of finite Tor-dimension (5.2.10) and of D^b_c.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/compact-pushforward-amplitude-and-colimits`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-compact-pushforward-amplitude-and-colimits); [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-coefficient-change); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-sheafified-adjunction); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-base-change-exchange-maps); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/quasi-finite-flat-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-quasi-finite-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-flat-trace).

### EDC.0-R3 — `SchemeAndStackFoundations:SF.2`

From EtaleBaseChange (PR196), integrated by SF.2: proper base change for Rf_* along proper f, the smooth base change theorem and its acyclicity lemma (SGA 4 XV 2.1 and 2.6) in the form used by SGA 4 XVIII 1.6.9, and the finiteness theorem: Rf_* preserves D^b_c(−, Λ) for f of finite type between schemes of finite type over a field or over a regular noetherian base of dimension ≤ 1 (SGA 4½ [Th. finitude] 1.1 and 4.3), with finiteness of H^q(X_k̄, F) and H^q_c(X_k̄, F) for constructible F.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-effacement-lemma`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-effacement-lemma); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-relative-and-geometric-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-poincare-duality-torsion); [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-cup-product-trace-pairing); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-sequence).

### EDC.0-R4 — `SchemeAndStackFoundations:SF.2`

Cohomology of curves over an algebraically closed field k (Stacks 03RM-03RR), n invertible: for a proper curve X, H²(X, μ_n) ≅ Pic(X)/n ≅ (ℤ/n)^{irreducible components} via degrees of line bundles (and through X_red), H^q(X, μ_n) = 0 for q ≥ 3, H¹(X, μ_n) ≅ Pic(X)[n]; for a smooth affine curve H^q(X, μ_n) = 0 for q ≥ 2; for a closed point x of a smooth curve C, H^q_x(C, μ_n) is ℤ/n for q = 2 and 0 otherwise (Kummer on the henselization). Also the identification, owned by TraceFormula Layer 8 (RS-17), of the cup product H¹(X, μ_n) × H¹(X, μ_n) → H²(X, μ_n^{⊗2}) ≅ μ_n with the Weil pairing on Jac(X)[n] (Milne LEC 14.8).

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-trace); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-h1-duality); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-first-chern-class).

### EDC.0-R5 — `SchemeAndStackFoundations:SF.2`

From EllAdicRealization (PR196), integrated by SF.2: for E/ℚ_ℓ finite and a lisse O_E-sheaf F = (F_m) on X of finite type over a separably closed field, the groups H^i(X, F) := lim_m H^i(X, F_m) and H^i_c(X, F) are finitely generated O_E-modules with lim¹ = 0, RΓ(X, F) and RΓ_c(X, F) are perfect O_E-complexes with RΓ(X, F) ⊗^L O_E/π^m ≅ RΓ(X, F_m), compatibly with the Galois action and with extension of coefficients to E and ℚ̄_ℓ.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality).

### EDC.0-R6 — `SchemeAndStackFoundations:SF.0`

The projective bundle π : P(E) = Proj Sym(E^∨) → X of a locally free sheaf E of rank m + 1 on a scheme X, with O_{P(E)}(1), the tautological exact sequence, local triviality P(E)|_U ≅ U × P^m over trivializing opens, and the complete flag bundle as an iterated projective bundle (for the splitting principle).

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-bundle-freeness); [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-chern-classes); [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-self-intersection-formula).

### EDC.0-R7 — `SchemeAndStackFoundations:SF.5`

For X smooth (quasi-projective where intersections are taken) over a field: the group Z^r(X) of codimension-r cycles (Mathlib AlgebraicCycle restricted to codimension r), rational equivalence and CH^r(X); flat pullback; proper pushforward compatible with Mathlib's AlgebraicCycle.map; the intersection product of properly intersecting cycles with Serre's Tor multiplicities and the moving lemma making CH*(X) a ring; the degree of 0-cycles on proper X; and the deformation to the normal cone of a closed immersion.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-self-intersection-formula).

### EDC.0-R8 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Line bundles and the Picard group Pic(X) of a scheme as an abelian group under ⊗, natural under pullback, divisors and O(D), and the degree deg : Pic(X) → ℤ of a line bundle on a proper curve over a field, additive, with principal divisors of degree zero and deg O_{P¹}(1) = 1.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/first-chern-class`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-first-chern-class); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-trace).

### EDC.0-R9 — `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

The Jacobian J = Pic⁰ of a smooth projective connected curve X over an algebraically closed field, an abelian variety of dimension g with J(k)[n] = Pic⁰(X)[n] ≅ (ℤ/n)^{2g} for n invertible, and its canonical principal polarization.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-h1-duality).

### EDC.0-R10 — `AbelianSchemesAndArithmeticModuli:A3`

The Weil pairing e_n : A[n] × A^∨[n] → μ_n of an abelian variety over an algebraically closed field (n invertible) and, for a principal polarization λ, perfectness and alternation of the induced pairing on A[n]; applied to the Jacobian of a curve.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/curve-h1-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-curve-h1-duality).

### EDC.4-R1 — `SchemeAndStackFoundations:SF.2`

Artin's affine vanishing (SGA 4 XIV, Théorème 3.1 and Corollaire 3.2), from CohomologicalPointCounting's constructible-sheaf toolkit integrated by SF.2: for f : X → Y an affine morphism of schemes of finite type over a field and F a torsion sheaf with d(F) := max dim of the closures of points in Supp F ≤ n, one has d(R^qf_*F) ≤ n − q; in particular cd(X) ≤ dim X for X affine of finite type over a separably closed field (torsion coefficients prime to the characteristic). Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-affine-perverse-artin-vanishing).

### EDC.4-R2 — `SchemeAndStackFoundations:SF.2`

Proper base change for Rf_* along proper f and for Rf_! (SGA 4 XII 5.1, XVII 5.2.6), already requested by part EDC.0; here used for the fibres of a blow-up, of a semismall map and of correspondences, and the projection formula for Rf_!. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-blowup-direct-images); [`EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-pullback-injective-blowup-bundle); [`EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-semismall-pushforward-perverse); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-composition).

### EDC.4-R3 — `SchemeAndStackFoundations:SF.2`

The ℓ-adic formalism of EllAdicRealization (CohomologicalPointCounting): Ekedahl's normalized λ-adic systems and the triangulated category D^b_c(X, O_E) := 2-lim D_ctf(X, O_E/λ^m) for X of finite type over a field (or a regular base of dimension ≤ 1), its reduction functors, the six operations computed levelwise, finiteness of H^i(X, K) as O_E-modules, perfectness of RΓ_c(X, K) with RΓ_c(X, K) ⊗^L O_E/λ^m ≅ RΓ_c(X, K ⊗^L O_E/λ^m), and D^b_c(X, E) := D^b_c(X, O_E) ⊗ E. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-weak-lefschetz-integral); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-classical-and-proetale-adic-categories).

### EDC.4-R4 — `SchemeAndStackFoundations:SF.2`

Smooth and proper base change for a smooth proper family over a connected base (R^qf_*Λ lisse, with specialization isomorphisms), and the generic base change and spreading-out of constructible complexes over a finitely generated ℤ-algebra (SGA 4½ [Th. finitude] 2.13 and the limit arguments of EGA IV §8 for constructible sheaves). Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complete-intersection-betti-comparison); [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-spreading-out-to-finite-fields).

### EDC.4-R5 — `SchemeAndStackFoundations:SF.2`

ComplexComparison (CohomologicalPointCounting, layers 10–12): Artin's comparison theorem H^q(X_ét, F) ≅ H^q(X(ℂ), F) and (R^qf_{ét*}F)^an ≅ R^qf_{cl*}F^an for f of finite type over ℂ and F constructible (SGA 4 XVI 4.1), and the compatibility of the Kummer sequence with the exponential sequence under μ_n ≅ ℤ/n, e^{2πik/n} ↦ k, so that the étale and topological first Chern classes agree. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-trace-orientation-comparison).

### EDC.4-R6 — `SchemeAndStackFoundations:SF.2`

Topological invariance of the étale site (already requested by part EDC.0) and finiteness of étale cohomology of constructible sheaves on schemes of finite type over a separably closed field, used to compare a hypersurface section with its reduced subscheme and to make vanishing subspaces finite-dimensional. Any finite-generation assertion about cohomology over a field is for geometric cohomology over a separably closed field, unless an explicit arithmetic finiteness hypothesis is supplied.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-ample-divisor-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-vanishing-and-restriction-subspaces).

### EDC.4-R7 — `SchemeAndStackFoundations:SF.0`

Blow-ups along regular immersions of smooth schemes: for Z ⊂ X a smooth closed subscheme of pure codimension c of a smooth k-scheme, Bl_Z X is smooth and proper over X, an isomorphism over X − Z, the exceptional divisor E = π^{-1}(Z) is the projective bundle P(N_{Z/X}) over Z with O_{Bl}(−E)|_E ≅ O_E(1) (Stacks, Divisors, blowing up along a regular immersion).

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-blowup-direct-images).

### EDC.4-R8 — `SchemeAndStackFoundations:SF.0`

For f : X → S universally closed (e.g. X proper over a field) and ℒ f-ample, X_s → S is affine for every s ∈ Γ(X, ℒ) (Stacks, Tag 0EKE); and the Veronese re-embedding of P^N by O(r), under which degree-r hypersurfaces are hyperplane sections.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-ample-divisor-weak-lefschetz).

### EDC.4-R9 — `SchemeAndStackFoundations:SF.0`

The parameter scheme of smooth complete intersections of a given multidegree in P^N over ℤ[1/ℓ]: an open subscheme of a product of projective spaces of forms, smooth with geometrically irreducible fibres over Spec ℤ[1/ℓ], over which the universal complete intersection is smooth and proper.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complete-intersection-betti-comparison).

### EDC.4-R10 — `AdicCoefficientsAndComparisons:L2`

The extension of the scheme Rf_! to separated finite-type morphisms of qcqs schemes, compatible with the Noetherian one (input of ECD 27.4).

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).

### EDC.4-R11 — `AdicCoefficientsAndComparisons:L3`

ECD Propositions 27.1–27.4: c_X^* commutes with ⊗ and pullback, is fully faithful with right adjoint Rc_{X*} commuting with RHom and pushforward, and Rf^◇_!c_Y^* ≅ c_X^*Rf_!, Rf^!Rc_{X*} ≅ Rc_{Y*}Rf^{◇!} for f separated of finite type between qcqs schemes of characteristic p. This is the edge AdicCoefficientsAndComparisons:L3 → EDC.6 of the confirmed finding RT-AREA-etale/17. These identities recover scheme duality by Rc_*; they do not by themselves give c^*Rf^! or c^*RHom comparisons.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-diamond-transport-of-duality).

### EDC.4-R12 — `AdicCoefficientsAndComparisons:L4`

ECD Proposition 27.5: the Rf_!/f^! comparison for separated maps of schemes of finite type over a complete DVR with perfect residue field.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).

### EDC.4-R13 — `AdicCoefficientsAndComparisons:L6`

ECD Propositions 27.6–27.7: commutation of c^* with Rf_* and full faithfulness on constructible complexes with finite coefficients prime to p, for schemes of finite type over O.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index).

## Collected restructure proposals

All eight original proposal records follow, retaining their provenance and consumers. The two stack records and the two perfect-space records are endorsements of the same respective Part II, not four new roadmaps. The maintainer/orchestrator decides whether to enact them. The Euler-characteristic sublayer, precise edge changes and abstract/perverse split are likewise proposals; the assembly changes no current atlas ownership or edges.

### EDC.0-S1 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `GlobalShtukasAndFunctionFieldLanglands`, `EndoscopicTransferAndUnitaryTraceComparison`, `WeilConjectures`.

Finding: Confirmed red-team finding RT-AREA-etale/3: no layer plans ℓ-adic sheaf theory on Artin or Deligne-Mumford stacks, while EDC is scheme-only and accepted routes apply EDC.5/7/8 outputs on stacks.

Proposal: Create 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne-Mumford stacks' with EtaleDualityAndPerverseSheaves as first prerequisite and EnhancedDerivedSheaves E2-E3 (smooth descent, coherent diagrams) as inputs. Layers: (1) lisse-étale site, D_c(𝒳, Λ) and the Laszlo-Olsson / Liu-Zheng enhanced six operations on Artin stacks, extending EDC.0's enhanced Rf_! and EDC.1:adjoint's f^! by smooth descent; (2) dualizing complex, smooth purity and biduality on stacks (from EDC.1-EDC.2); (3) the perverse t-structure and IC on Artin stacks (from EDC.5); (4) the decomposition theorem for proper representable maps of DM stacks (from EDC.7); (5) correspondences and trace formulas on DM stacks (Varshavsky, Behrend; from EDC.8). Edges from it to GlobalShtukas GS.1 and GS.3, ET.2b, the EDC.8 stack items and WC.6's DM-stack purity node; the shtuka and ramified geometric class field theory Part II briefs import it, and LAFFORGUE-18/48 is re-routed there as missing.

### EDC.0-S2 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `GeometricSatakeAndFusion`.

Finding: Confirmed red-team finding RT-AREA-etale/16: PAPER-ZHU-17 route 7 adds about twenty items outside EDC's declared scope (six operations, Verdier duality, perversity, IC and Chern classes on perfect pfp spaces; equivariant perverse sheaves and Borel equivariant cohomology; Braden hyperbolic localization).

Proposal: Create 'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization', importing GeometricSatakeAndFusion GS0:Witt-geometry's perfect-space carrier and the perfection invariance of the étale site, with layers: (1) D^b_c on separated pfp perfect spaces through finite-type models, with the six operations, biduality and the trace/fundamental classes of EDC.0-EDC.3 transported (Zhu A.3.1, A.3.3, items E01-E03, E07), including the model-independence proof gate; (2) Chern and characteristic classes of torsors on perfect spaces (A.3.2, E14) from EDC.3/chern-classes; (3) finite-level equivariant perverse sheaves and Borel equivariant cohomology (A.3.5, E10-E13), sharing its equivariant part with the stacks Part II; (4) scheme-level Braden hyperbolic localization (E09). Keep only the finite-type items (E06) as sources of EDC.7. Within this packet, EDC.0-EDC.3 plan the finite-type scheme statements those transports start from.

### EDC.0-S3 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `FiniteFieldsAndCharacterSums`.

Finding: The Grothendieck-Ogg-Shafarevich Euler characteristic formula for lisse sheaves on curves is used by FiniteFieldsAndCharacterSums FF.2 and by KloostermanMomentsAndPotentialAutomorphy, and no stage states it (RT-AREA-finitefields/3, confirmed). The FiniteFieldsAndCharacterSums packet already proposes a sub-stage of this roadmap.

Proposal: Endorse that proposal: add EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2:pairings (inputs EDC.2:pairings/extreme-degree-cohomology, EDC.2:pairings/poincare-duality-torsion and ArithmeticGaloisRepresentations:R01.3 in equal characteristic), stating χ_c(X, F) = rk F · χ_c(X) − Σ_{s} Sw_s(F) for F lisse on a dense open X of a smooth projective connected curve over an algebraically closed field, with χ_c = χ, sourced to Raynaud (Séminaire Bourbaki 286, Numdam) or SGA 5 X; link it to FF.2.

### EDC.4-S1 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `GlobalShtukasAndFunctionFieldLanglands`, `EndoscopicTransferAndUnitaryTraceComparison`, `ShtukaSpecialCyclesAndHigherSiegelWeil`, `RamifiedGeometricClassFieldTheory`.

Finding: Confirmed finding RT-AREA-etale/3, for the stages of this part: EDC.5, EDC.7 and EDC.8 are scheme-only, yet GlobalShtukas GS.1 and GS.3, ET.2b and the EDC.8 stack items (YUN-ZHANG-17/35, YUN-ZHANG-19/120, LAFFORGUE-18/48) apply their outputs on stacks.

Proposal: Endorse part EDC.0's proposal 'Étale duality, cycle classes and perverse sheaves, Part II: Artin and Deligne–Mumford stacks'. Its perverse layer imports EDC.5/perverse-t-structure, EDC.5/intermediate-extension and EDC.5/intersection-complex by smooth descent; its decomposition layer imports EDC.7/proper-direct-image-decomposition for proper representable maps of DM stacks; its trace layer imports EDC.8/cohomological-correspondence, EDC.8/correspondence-trace and EDC.8/lefschetz-verdier-formula (Varshavsky, Behrend). Edges from the Part II to GS.1, GS.3, ET.2b; LAFFORGUE-18/48 is re-routed there as missing. The same stack Part II supplies the stack sheaf/IC/trace inputs to ShtukaSpecialCyclesAndHigherSiegelWeil and RamifiedGeometricClassFieldTheory; their sources do not become scheme-only theorems by citation.

### EDC.4-S2 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `GeometricSatakeAndFusion`.

Finding: Confirmed finding RT-AREA-etale/16: PAPER-ZHU-17 route 7 adds perfect-scheme, equivariant and hyperbolic-localization items outside EDC's scope.

Proposal: Endorse part EDC.0's proposal 'Étale duality, cycle classes and perverse sheaves, Part II: perfect schemes, equivariant coefficients and hyperbolic localization', importing GeometricSatakeAndFusion:GS0:Witt-geometry's perfect-space carrier and AdicCoefficientsAndComparisons L2's perfection invariance. It receives Zhu E01–E03, E07–E14, the equivariant items, characteristic-classes-of-torsors, E09 (Braden's hyperbolic localization for schemes, planned nowhere else) and PAPER-HANSEN-KALETHA-WEINSTEIN-22/091. Zhu E04, E05, E06 stay as sources of EDC.5/perverse-t-structure, EDC.5/intersection-complex and EDC.7/proper-direct-image-decomposition on finite-type models; IC-stalk-parity moves to GeometricSatakeAndFusion.

### EDC.4-S3 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `GeometricSatakeAndFusion`, `GlobalShtukasAndFunctionFieldLanglands`, `AdicCoefficientsAndComparisons`, `VStackSheavesAndLisseCategories`.

Finding: Confirmed finding RT-AREA-geomlanglands/18 and two mis-addressed requests: the stage edge EDC.4 → GeometricSatakeAndFusion:GS1 carries nothing (EDC.4 is weak Lefschetz, projective bundles and blow-ups), GeometricSatakeAndFusion--GS0 requests the perverse t-structure and recollement from EDC.4, and GlobalShtukasAndFunctionFieldLanglands requests perverse sheaves, IC, the decomposition theorem and the smallness criterion from EDC.4.

Proposal: Drop the edge EDC.4 → GS1 and keep EDC.5 → GS1 (already present). GS0/GS1's request is supplied by EDC.5/perverse-t-structure, EDC.5/perverse-recollement and EDC.5/intermediate-extension; GlobalShtukas GS.1's by EDC.5/perverse-sheaves, EDC.5/intersection-complex, EDC.5/small-map-intersection-complex and EDC.7/proper-direct-image-decomposition (edge EDC.7 → GS.1 to add; acyclic, since EDC.7 does not depend on GlobalShtukas). Relative perversity and ULA are not EDC's (see gaps). Complete RT-AREA-geomlanglands/18 by adding AdicCoefficientsAndComparisons:L1 → GS1 and L3 → GS1 for the diamond carrier and comparison, and dropping VStackSheavesAndLisseCategories:VS3 → GS2:correspondences and VS3 → GS3:fusion: GS2 correspondences use the six-functor owner and fusion uses ULA/nearby cycles, not the VS3 Hecke-stack-equivalence theorem. These are orchestrator proposals, not edits to those roadmaps.

### EDC.4-S4 — rescope

Roadmaps: `EtaleDualityAndPerverseSheaves`, `AdicCoefficientsAndComparisons`, `ClassicalAdicEtaleCohomology`.

Finding: Confirmed finding RT-AREA-etale/17: EDC.6 uses ECD 27.1–27.4, owned by AdicCoefficientsAndComparisons:L3, which is not among EDC.6's ancestors.

Proposal: Add AdicCoefficientsAndComparisons:L3 → EtaleDualityAndPerverseSheaves:EDC.6, the missing edge in RT-AREA-etale/17. L4 is already an ancestor via L6/L5 and H5 via L2, so do not report those two transitive dependencies as missing edges. Keep the precise node prerequisites and requests.

### EDC.4-S5 — split

Roadmaps: `EtaleDualityAndPerverseSheaves`.

Finding: EDC.5 holds both the abstract BBD chapter 1 formalism (hearts, t-exactness, recollement, intermediate extension in a recollement) and the perverse t-structure on schemes; the former is general triangulated-category theory that no other layer of the atlas plans and that Mathlib has only in part (the heart is not yet abelian at the pin).

Proposal: Divide EDC.5 into two sub-layers for the atlas: 'EDC.5:t-structures — hearts, t-exactness and recollement' with nodes EDC.5/t-structure-heart-abelian, EDC.5/t-cohomology-functor, EDC.5/t-exact-functor, EDC.5/recollement-data, EDC.5/glued-t-structure, EDC.5/abstract-intermediate-extension; and 'EDC.5:perverse — perverse sheaves and intersection complexes' with the remaining fourteen EDC.5 nodes. EDC.5 owns the first sub-layer unless a foundational triangulated-categories roadmap is created, in which case it moves there.

## Retained gaps

These 20 entries retain their part provenance, precise detail and consumers. The full registers also appear beside the node bodies in the assembled reader. The two broad signature gaps refer to the independent reports for the finer inventory.

### EDC.0-G1 — Purity over a trait and regular-immersion fundamental classes are not in EDC.0-EDC.3

LPV.7 requests from EDC.2:trace-purity and EDC.3 the relative fundamental class Λ ≅ Rf^!Λ(−d)[−2d] for a strict semistable trait morphism (Saito 2003, Proposition 1.1.1(2)) and fundamental classes of the regular intersection strata over the trait (Saito 2003, Lemma 1.1.4). These are purity statements for regular pairs over a discrete valuation ring (Gabber's absolute purity and its semistable special case), which EDC.2's text excludes ('This proves smooth purity, not the unrelated general Gabber absolute-purity theorem') and EDC.3 restricts to smooth pairs over a field. This packet plans smooth purity (EDC.2:trace-purity/smooth-purity) and smooth-pair purity (EDC.3/smooth-pair-purity) only. Absolute purity for regular pairs (Gabber; Riou's exposé in Astérisque 363-364, XVI) needs an owner: a new layer after EDC.3, or the trait geometry of LefschetzPencilsAndVanishingCycles. Recorded for the maintainer.

Needed by: `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-nearby-cycle-description`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves/snc-restriction-gysin-differential`; `LefschetzPencilsAndVanishingCycles:LPV.7:invariant-cycles/localization-duality-cross`.

### EDC.0-G2 — ℓ-adic sheaf theory on algebraic stacks (RT-AREA-etale/3) has no layer

EDC.0-EDC.3 are planned for schemes only. Consumers on Artin and Deligne-Mumford stacks (shtuka, Hitchin, Bun_G and root-Picard stacks; WC.6's smooth proper DM stacks; FunctionFieldArithmeticPartII's tame coarse comparisons) need the Laszlo-Olsson / Liu-Zheng enhanced six operations on stacks, which this packet does not plan. The restructure entry proposes the Part II that the confirmed red-team finding asks for. The scheme-level objects of this packet (the enhanced Rf_! and f^!, the dualizing complex, smooth purity) are what that Part II extends by smooth descent. Explicit RT-AREA-etale/3 paper routes: EDC.8 YUN-ZHANG-17/35, YUN-ZHANG-19/120 and LAFFORGUE-18/48; the two named Part IIs are consumers, not scheme-level completions.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`; `GlobalShtukasAndFunctionFieldLanglands:GS.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`; `WeilConjectures:WC.6/purity-for-smooth-proper-dm-stacks`; [`EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-17/35`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-YUN-ZHANG-17-35); [`EtaleDualityAndPerverseSheaves:EDC.8/YUN-ZHANG-19/120`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-YUN-ZHANG-19-120); [`EtaleDualityAndPerverseSheaves:EDC.8/LAFFORGUE-18/48`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-LAFFORGUE-18-48); `ShtukaSpecialCyclesAndHigherSiegelWeil`; `RamifiedGeometricClassFieldTheory`.

### EDC.0-G3 — Perfect schemes and finite-level equivariant coefficients (RT-AREA-etale/16) are not planned here

PAPER-ZHU-17 routes to EDC.0, EDC.1:adjoint, EDC.1:biduality, EDC.2:trace-purity and EDC.3 the items E01-E03, E07, E14 and characteristic-classes-of-torsors: constructible coefficients, six operations, Verdier biduality, fundamental classes and Chern classes on separated perfectly-finitely-presented perfect algebraic spaces, through finite-type models (Zhu, Appendix A.3). The confirmed finding RT-AREA-etale/16 classifies these as new layers. This packet plans the finite-type scheme statements those transports start from (and E07(a)'s finite-type trace isomorphism, EDC.2:trace-purity/top-degree-compact-cohomology), and records the perfect-space transport in the Part II proposed under restructure. Zhu's A.3 orientation problem (independence of the model in E07) stays a proof gate of that Part II.

Needed by: `GeometricSatakeAndFusion:GS0`; `GeometricSatakeAndFusion:GS3`.

### EDC.0-G4 — The Grothendieck-Ogg-Shafarevich formula has no layer

FiniteFieldsAndCharacterSums requests χ_c(X, F) = rk F · χ_c(X) − Σ_s Sw_s(F) from EDC.2 (RT-AREA-finitefields/3, confirmed). It is not among EDC.2's stated targets and needs Swan conductors (ArithmeticGaloisRepresentations:R01.3) and the Euler-characteristic computation of SGA 5 X / Raynaud (Séminaire Bourbaki 286). This packet endorses the FiniteFieldsAndCharacterSums proposal of a sub-stage EtaleDualityAndPerverseSheaves:EDC.2:euler-characteristic after EDC.2 (restructure entry), with inputs EDC.2:pairings and R01.3.

Needed by: `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`; `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`; `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`.

### EDC.0-G5 — Enhanced compactification and localization coherence still require a supplier contract

A termwise Godement functor need not land in K-injective complexes. Construct it on complexes, prove preservation of quasi-isomorphisms, descend to the dg localization, and compare to the K-injective presentation using EnhancedDerivedSheaves E1. E3 supplies mates abstractly, not by itself a contractible coherent diagram of compactifications. Specify the comparison and all localization choices (SGA XVIII 3.1.9, editor note 37) before claiming the enhanced lift coherent.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-upper-shriek-pseudofunctor); [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-base-change-exchange-maps).

### EDC.0-G6 — Constructible biduality dévissage and the regular-base extension are not closed

XVIII 3.2.6 proves the smooth local-system calculation, not general constructible biduality. The supplied induction uses D_X Rj_* ≅ j_!D_U, itself obtained from biduality in the next node, without a separate proof of the boundary step. Establish that step without circularity. Over a regular base of dimension one, the field smooth-stratum argument does not cover vertical strata; define the actual dualizing object on the base and prove its purity/duality input. SF.2 coherent O-module biduality is a different theorem, and the finiteness request alone does not supply this étale input.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms); [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions).

### EDC.0-G7 — Cycle-class descent to Chow groups and intersection multiplicities need a proof

The direct additive map from fundamental classes is justified. For rational equivalence on a singular W of codimension r−1, Sing(W) may have codimension r in X, not r+1. Semi-purity therefore does not make restriction on H^{2r} injective; the proposed reduction to W_reg is insufficient. Supply a normalization/proper-pushforward or deformation argument with the required trace multiplicities. The Tor intersection comparison is non-routine; the reference to SGA 4½ [Cycle] 2.3.8 is not a registered public source in this packet. Milne 23.4 explicitly withholds its proof. Do not claim these compatibilities closed by that citation.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-cycle-class-map); [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology).

### EDC.0-G8 — Self-intersection specialization needs a cohomological comparison

SF.5 is requested for the deformation-to-the-normal-cone geometry and is now a direct prerequisite. The general self-intersection proof additionally needs a cohomological specialization/homotopy comparison for the deformation pair, compatible with purity and its normalization. Smoothness of the family alone does not identify cohomology of nonproper fibres. The two Milne citations prove normalization and projection formula, not this missing comparison.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-self-intersection-formula).

### EDC.0-G9 — Suggested Lean declarations do not yet implement every packet signature

The input lists 95 of its 217 API/test entries only in Not typed here comments. Section 13 requires actual Lean statements, with honest data stand-ins when appropriate. Several existing statements also omit compactifiability/quasi-compactness, torsion hypotheses, condition (*)_d for trace, codimension for fundamentalClass/cycleClass, or smoothness and the dimension difference for properPushforward. The review corrects the cartesian-square arguments, the false base-change test, smooth-pair dimensions and some duality coefficient hypotheses. The remaining declarations require a systematic carrier/hypothesis revision rather than fabricated Prop stand-ins. See the review report for the explicit inventory. The localization-triangle prototypes also need the actual relation that j is the open complement of i, rather than two unrelated immersion arguments.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.0/cohomology-with-supports`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-cohomology-with-supports); [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-constructible-ctf-complexes); [`EtaleDualityAndPerverseSheaves:EDC.0/enhanced-compact-pushforward`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-enhanced-compact-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/flat-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-flat-trace); [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-fundamental-class); [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map); [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-cycle-class-map).

### EDC.0-G10 — Trace compatibility in the proposed replacement purity proof remains to be checked

The published smooth-purity theorem is not contradicted. The packet claims to replace the problematic proof of XVIII 3.2.3 by the stalk formula and effacement. Establish that the two neighbourhood pro-systems and their transition maps are identified through the chosen trace, and that the induced cohomology isomorphism is precisely the adjoint t_f. Merely obtaining isomorphic stalk groups does not verify that normalization. E1 confirms the author remark, not the packet’s claimed repair.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-smooth-purity).

### EDC.4-G1 — ℓ-adic sheaf theory on Artin and Deligne–Mumford stacks (confirmed finding RT-AREA-etale/3)

This part is scheme-only, like part EDC.0. Perverse sheaves and IC on Artin stacks, the decomposition theorem for proper representable maps of DM stacks, and correspondences/trace formulas on DM stacks (the EDC.8 stack items YUN-ZHANG-17/35, YUN-ZHANG-19/120, LAFFORGUE-18/48) are planned nowhere. The first `restructure` entry endorses part EDC.0's Part II proposal for stacks and assigns these items to it.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`; `GlobalShtukasAndFunctionFieldLanglands:GS.3`; `EndoscopicTransferAndUnitaryTraceComparison:ET.2b`; `EtaleDualityAndPerverseSheaves:EDC.8`.

### EDC.4-G2 — Perfect schemes, equivariant perverse sheaves and hyperbolic localization (confirmed finding RT-AREA-etale/16)

Zhu's E01–E03, E07–E14, the equivariant items (equivariant-perverse-sheaves-pfp, equivariant-cohomology-borel, equivariant-cohomology-free-quotient), characteristic-classes-of-torsors, the Braden hyperbolic localization E09, IC-stalk-parity (a statement about Witt Grassmannians that belongs to GeometricSatakeAndFusion) and HKW's perfect-scheme local terms (PAPER-HANSEN-KALETHA-WEINSTEIN-22/091) need the Part II on perfect schemes proposed by part EDC.0 and endorsed in `restructure`. The finite-type statements they transport (E04 perverse t-structure, E05 IC, E06 decomposition) are nodes here.

Needed by: `GeometricSatakeAndFusion:GS1`; `GeometricSatakeAndFusion:GS3`; `GeometricSatakeAndFusion:GS4`.

### EDC.4-G3 — Relative perverse t-structures and universal local acyclicity over a base

GlobalShtukasAndFunctionFieldLanglands requested from EDC.4 'the perverse t-structure relative to a base' and 'universal local acyclicity'. Neither is in the text of EDC.4–EDC.8 (EDC.5 is the absolute perverse t-structure over a field). The relative perverse t-structure of Hansen–Scholze is owned on the diamond side by GeometricSatakeAndFusion:GS1 (FS VI.7) and ULA by VStackSheavesAndLisseCategories:VS1; the scheme-theoretic relative version over a curve has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.1`.

### EDC.4-G4 — Nearby cycles over general bases and compactification boundary machinery requested from EDC.5/EDC.6

GlobalShtukasAndFunctionFieldLanglands requested nearby cycles over general bases with Orgogozo's finiteness theorem (from EDC.6) and 'compactifications and boundary strata in the étale setting' (from EDC.5). Neither is in the text of EDC.5 or EDC.6; nearby cycles belong to LefschetzPencilsAndVanishingCycles:LPV.0/LPV.6 (over a trait) and the general-base version (Orgogozo, Lu–Zheng) has no owner.

Needed by: `GlobalShtukasAndFunctionFieldLanglands:GS.6`; `GlobalShtukasAndFunctionFieldLanglands:GS.7`.

### EDC.4-G5 — Euler characteristic of smooth complete intersections

The hypersurface formula b_m^0 = ((d − 1)^{m+2} + (−1)^m(d − 1))/d needs χ(X) = deg c_m(T_X) (a Gauss–Bonnet / Riemann–Roch statement in étale cohomology, or the topological computation over ℂ). Neither SchemeAndStackFoundations:SF.5 nor any EDC stage states it; the field-independence of b_m^0 is planned without it.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complete-intersection-betti-comparison).

### EDC.4-G6 — Strong exceptional-pullback and duality transport to diamonds

The stage asks for c^*K_X and c^*D_X comparisons, but ECD 27.1–27.4 supply only Rc_* recovery. Supply a theorem from AdicCoefficientsAndComparisons:L3 proving the required essential-image preservation/counit isomorphism (with exact geometric and coefficient hypotheses), or explicitly rescope the target. Do not infer it from full faithfulness.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-diamond-transport-of-duality).

**addedBy.** REV-EtaleDualityAndPerverseSheaves--EDC.4

### EDC.4-G7 — Geometric origin as a target-level definition

BBD 6.2.4 defines the smallest collection of simple perverse complex sheaves containing the constant sheaf on a point and closed under simple constituents of perverse cohomology of the six operations, tensor product and RHom; semisimple complexes of geometric origin are finite direct sums of shifts of these simple objects. This key definition needs its own target-level node, API and at least three discriminating tests; it is not optional lemma-level refinement.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-characteristic-zero-decomposition).

**addedBy.** REV-EtaleDualityAndPerverseSheaves--EDC.4

### EDC.4-G8 — Categorical graded Lefschetz operator and primitive decomposition

Define the bounded graded object with Tate twist and chosen degree-two operator in an abelian category, its primitive kernels, and the hard-Lefschetz kernel splitting/decomposition theorem. DWP.9 provides only the vector-space version. The suggested existential retract with arbitrary P is satisfied by P=0 and does not express this target.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-relative-primitive-decomposition).

**addedBy.** REV-EtaleDualityAndPerverseSheaves--EDC.4

### EDC.4-G9 — Stratified specialization and coefficient-descent closure

Request the exact BBD 6.1.8–6.1.10 restricted T,L-category and trait specialization construction from the scheme/sheaf owner; generic base change alone does not supply it. Prove the rational or ℓ-adic coefficient descent required beyond the source complex-coefficient decomposition statement.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-characteristic-zero-decomposition).

**addedBy.** REV-EtaleDualityAndPerverseSheaves--EDC.4

### EDC.4-G10 — Suggested signatures do not yet realize several packet targets

The independent report lists the affected signatures and counterexamples per node. Missing finite-type/base/coefficient hypotheses, the IC input local system and shift, Tate twists and chosen ample class, complete decomposition isomorphisms, and correspondence coherence/proper integration must be represented in the suggested file. Elaboration with admitted proofs does not verify these mathematical statements.

Needed by: [`EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-affine-vanishing-hypercohomology); [`EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-compact-support-vanishing-smooth-affine); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-weak-lefschetz-gysin); [`EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-weak-lefschetz-integral); [`EtaleDualityAndPerverseSheaves:EDC.4/ample-divisor-weak-lefschetz`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-ample-divisor-weak-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-complete-intersection-cohomology); [`EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-projective-bundle-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-blowup-direct-images); [`EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-blowup-formula); [`EtaleDualityAndPerverseSheaves:EDC.4/pencil-axis-blowup`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-pencil-axis-blowup); [`EtaleDualityAndPerverseSheaves:EDC.4/pullback-injective-blowup-bundle`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-pullback-injective-blowup-bundle); [`EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.4-vanishing-and-restriction-subspaces); [`EtaleDualityAndPerverseSheaves:EDC.5/t-cohomology-functor`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-t-cohomology-functor); [`EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-recollement-data); [`EtaleDualityAndPerverseSheaves:EDC.5/glued-t-structure`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-glued-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/abstract-intermediate-extension`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-abstract-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-perverse-t-structure); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-sheaves`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-lisse-shift-is-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-perverse-recollement); [`EtaleDualityAndPerverseSheaves:EDC.5/intermediate-extension`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-intermediate-extension); [`EtaleDualityAndPerverseSheaves:EDC.5/intersection-complex`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/simple-perverse-sheaves`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-simple-perverse-sheaves); [`EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-verdier-duality-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/affine-perverse-artin-vanishing`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-affine-perverse-artin-vanishing); [`EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-perverse-amplitude-estimates); [`EtaleDualityAndPerverseSheaves:EDC.5/generic-degree-concentration`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-generic-degree-concentration); [`EtaleDualityAndPerverseSheaves:EDC.5/semismall-pushforward-perverse`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-semismall-pushforward-perverse); [`EtaleDualityAndPerverseSheaves:EDC.5/small-map-intersection-complex`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-small-map-intersection-complex); [`EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.5-integral-perverse-torsion-pair); [`EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-scheme-adic-diamond-operation-comparisons-index); [`EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-classical-and-proetale-adic-categories); [`EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-adic-transport-of-duality-and-classes); [`EtaleDualityAndPerverseSheaves:EDC.6/rational-perverse-coefficient-extension`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-rational-perverse-coefficient-extension); [`EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complex-analytic-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-trace-orientation-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/complete-intersection-betti-comparison`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-complete-intersection-betti-comparison); [`EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.6-diamond-transport-of-duality); [`EtaleDualityAndPerverseSheaves:EDC.7/weights-and-perverse-truncation`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-weights-and-perverse-truncation); [`EtaleDualityAndPerverseSheaves:EDC.7/mixed-perverse-weight-filtration`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-mixed-perverse-weight-filtration); [`EtaleDualityAndPerverseSheaves:EDC.7/geometric-semisimplicity`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-geometric-semisimplicity); [`EtaleDualityAndPerverseSheaves:EDC.7/pure-complex-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-pure-complex-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/proper-direct-image-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-proper-direct-image-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-relative-hard-lefschetz); [`EtaleDualityAndPerverseSheaves:EDC.7/relative-primitive-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-relative-primitive-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.7/spreading-out-to-finite-fields`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-spreading-out-to-finite-fields); [`EtaleDualityAndPerverseSheaves:EDC.7/characteristic-zero-decomposition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.7-characteristic-zero-decomposition); [`EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-cohomological-correspondence); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-pushforward); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-restriction); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-composition); [`EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-correspondence-trace); [`EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-lefschetz-verdier-formula); [`EtaleDualityAndPerverseSheaves:EDC.8/local-terms-finite-order`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-local-terms-finite-order); [`EtaleDualityAndPerverseSheaves:EDC.8/similitude-reciprocal-charpoly`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-similitude-reciprocal-charpoly); [`EtaleDualityAndPerverseSheaves:EDC.8/middle-degree-determinant`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-middle-degree-determinant); [`EtaleDualityAndPerverseSheaves:EDC.8/poincare-pairing-reciprocity-export`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.8-poincare-pairing-reciprocity-export).

**addedBy.** REV-EtaleDualityAndPerverseSheaves--EDC.4

## Exact cross-part prerequisites

Each heading is the consuming node; its list contains all prerequisites supplied by the other part. These 80 existing edges were checked together with the other 278 internal edges. No substitution or new coarse stage edge was required.

### `EtaleDualityAndPerverseSheaves:EDC.4/affine-vanishing-hypercohomology`

- [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-constructible-ctf-complexes)
- [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-etale-derived-category)

### `EtaleDualityAndPerverseSheaves:EDC.4/compact-support-vanishing-smooth-affine`

- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-poincare-duality-torsion)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)

### `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-galois-frobenius-equivariance)

### `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-gysin`

- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-sequence`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-sequence)
- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)

### `EtaleDualityAndPerverseSheaves:EDC.4/weak-lefschetz-integral`

- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)

### `EtaleDualityAndPerverseSheaves:EDC.4/complete-intersection-cohomology`

- [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-poincare-duality-torsion)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)
- [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-tate-twist)

### `EtaleDualityAndPerverseSheaves:EDC.4/projective-bundle-decomposition`

- [`EtaleDualityAndPerverseSheaves:EDC.3/projective-bundle-freeness`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-bundle-freeness)
- [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-chern-classes)
- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)
- [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-galois-frobenius-equivariance)
- [`EtaleDualityAndPerverseSheaves:EDC.0/tate-twist`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-tate-twist)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)

### `EtaleDualityAndPerverseSheaves:EDC.4/blowup-direct-images`

- [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology)
- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)
- [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-self-intersection-formula)

### `EtaleDualityAndPerverseSheaves:EDC.4/blowup-formula`

- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)
- [`EtaleDualityAndPerverseSheaves:EDC.3/self-intersection-formula`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-self-intersection-formula)

### `EtaleDualityAndPerverseSheaves:EDC.4/vanishing-and-restriction-subspaces`

- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/poincare-duality-torsion`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-poincare-duality-torsion)
- [`EtaleDualityAndPerverseSheaves:EDC.3/projective-space-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-projective-space-cohomology)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)

### `EtaleDualityAndPerverseSheaves:EDC.5/recollement-data`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions)

### `EtaleDualityAndPerverseSheaves:EDC.5/perverse-t-structure`

- [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-constructible-ctf-complexes)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-verdier-dual)

### `EtaleDualityAndPerverseSheaves:EDC.5/lisse-shift-is-perverse`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme)
- [`EtaleDualityAndPerverseSheaves:EDC.3/smooth-pair-purity`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-smooth-pair-purity)

### `EtaleDualityAndPerverseSheaves:EDC.5/perverse-recollement`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions)

### `EtaleDualityAndPerverseSheaves:EDC.5/verdier-duality-perverse`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/dualizing-complex-of-smooth-scheme`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-dualizing-complex-of-smooth-scheme)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-verdier-dual)

### `EtaleDualityAndPerverseSheaves:EDC.5/perverse-amplitude-estimates`

- [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-smooth-purity)

### `EtaleDualityAndPerverseSheaves:EDC.5/integral-perverse-torsion-pair`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)

### `EtaleDualityAndPerverseSheaves:EDC.6/scheme-adic-diamond-operation-comparisons-index`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-dualizing-complex)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality)

### `EtaleDualityAndPerverseSheaves:EDC.6/classical-and-proetale-adic-categories`

- [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-coefficient-change)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-exceptional-inverse-image)
- [`EtaleDualityAndPerverseSheaves:EDC.0/constructible-ctf-complexes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-constructible-ctf-complexes)

### `EtaleDualityAndPerverseSheaves:EDC.6/adic-transport-of-duality-and-classes`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)
- [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/smooth-purity`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-smooth-purity)
- [`EtaleDualityAndPerverseSheaves:EDC.3/gysin-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-gysin-map)
- [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-cycle-class-map)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)
- [`EtaleDualityAndPerverseSheaves:EDC.0/coefficient-change`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-coefficient-change)

### `EtaleDualityAndPerverseSheaves:EDC.6/complex-analytic-comparison`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-verdier-dual)

### `EtaleDualityAndPerverseSheaves:EDC.6/trace-orientation-comparison`

- [`EtaleDualityAndPerverseSheaves:EDC.2:trace-purity/top-degree-compact-cohomology`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-trace-purity-top-degree-compact-cohomology)
- [`EtaleDualityAndPerverseSheaves:EDC.3/cycle-class-map`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-cycle-class-map)
- [`EtaleDualityAndPerverseSheaves:EDC.3/fundamental-class`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-fundamental-class)

### `EtaleDualityAndPerverseSheaves:EDC.6/diamond-transport-of-duality`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/dualizing-complex`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-dualizing-complex)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)

### `EtaleDualityAndPerverseSheaves:EDC.7/relative-hard-lefschetz`

- [`EtaleDualityAndPerverseSheaves:EDC.3/chern-classes`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.3-chern-classes)

### `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/exceptional-inverse-image`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-exceptional-inverse-image)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/sheafified-adjunction`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-sheafified-adjunction)
- [`EtaleDualityAndPerverseSheaves:EDC.0/etale-derived-category`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.0-etale-derived-category)

### `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-pushforward`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-base-change-exchange-maps)

### `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-restriction`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/recollement-adjunctions`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-recollement-adjunctions)

### `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-composition`

- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-base-change-exchange-maps)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/upper-shriek-pseudofunctor`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-upper-shriek-pseudofunctor)

### `EtaleDualityAndPerverseSheaves:EDC.8/correspondence-trace`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/constructible-biduality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-constructible-biduality)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/duality-exchange-isomorphisms`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-duality-exchange-isomorphisms)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/verdier-dual`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-verdier-dual)
- [`EtaleDualityAndPerverseSheaves:EDC.1:adjoint/base-change-exchange-maps`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-adjoint-base-change-exchange-maps)
- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-relative-and-geometric-duality)

### `EtaleDualityAndPerverseSheaves:EDC.8/lefschetz-verdier-formula`

- [`EtaleDualityAndPerverseSheaves:EDC.1:biduality/relative-and-geometric-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.1-biduality-relative-and-geometric-duality)

### `EtaleDualityAndPerverseSheaves:EDC.8/poincare-pairing-reciprocity-export`

- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/galois-frobenius-equivariance`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-galois-frobenius-equivariance)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/adic-and-rational-poincare-duality`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-adic-and-rational-poincare-duality)
- [`EtaleDualityAndPerverseSheaves:EDC.2:pairings/cup-product-trace-pairing`](../readmes/EtaleDualityAndPerverseSheaves.md#node-EDC.2-pairings-cup-product-trace-pairing)
