# ASM-PerfectoidSpaces — assembly handoff

Job: ASM-PerfectoidSpaces, issue #251. Worker: **Codex — codex-qnhDz2**. Date: 7 October 2026. Input checkout: `cbadfc81e75026022e70b016c065fc4cb9dd99d7`. Branch: `codex-qnhDz2-perfectoid-assembly`.

**Assembly tasks complete.** The combined reader and suggested file cover both current packets, P0–P9. This is a completed assembly, not a checkpoint of unfinished assembly work and not certification of the underlying partial mathematics. No second job was claimed. The full-roadmap plan remains subject to the existing P0 review and supplier gaps.

## Deliverables and preserved inputs

- `research/blueprint/readmes/PerfectoidSpaces.md`: one purpose/scope/boundaries/conventions/source/layer introduction and all 392 node sections in layer order, with exact statements, hypotheses, proof outlines, API, tests, acceptance, uses, prerequisites, library-location proposals, source locators and planets. Requests, gaps, restructuring proposals and all source-finding verdicts are appended.
- `research/blueprint/suggested/PerfectoidSpaces.lean`: one standard note, one import block (150 distinct individual modules), P0–P7 followed by P8–P9, with a single canonical perfectoid-Tate-ring class and reconciled names.
- This note collects every inherited request and restructuring record, with all gaps and the cross-part edge inventory so that the continuation does not depend on ephemeral scratch files.

The two input packets and both part readers/suggested files are unchanged. No reviewed node’s mathematics, source locator, planet, coverage record, implementation status or review verdict was edited. The combined reader is regenerated from the **current packets**, rather than concatenating stale part readers. No new baseline or source certification is claimed by the assembler.

P0’s current review remains `needs_changes`, by `independent-review-REV-FIX-RT-AREA-padic-1~2` (2 October), following bounded fixes and the unfinished broad `REV-PerfectoidSpaces--P0`. It explicitly requires completion of the baseline/source/dependency/API/test/planet review and the general-base almost-category comparison. P8’s current review remains `accepted`, by `independent-review-REV-PerfectoidSpaces--P8` (6 October), with P8 and P9 `planned`, not closed. The aggregate reader never treats P8 acceptance as certification of P0 suppliers. The P0/P1 gaps are not reasons to rerun the assembly; their owning review/planning jobs must resolve them.

## Reader synchronization and notation

The P8 independent review specifically requested regenerating the reader from its packet. The assembly incorporates the exact split prerequisite nodes, Huber category V’s true owner (anchor Layers 3.4 and 5), the generated `PerfectoidQuotientsPartII` supplier ID, the closed-immersion rather than injection gloss, corrected HJ/CHJ locators, the perfectoid L and two-step product in weight extension, and corrected examples. P0’s later regular-tower nodes and credit to pinned Mathlib `IsRegularLocalRing` are likewise included. The older false absence claim is not repeated.

Almost basic setups stay abstract in P0 and specialize to R°/R⁺ in P1 and O_C in the later descent setting. All pairs keep their plus rings. Ring actions are left actions; space actions are right actions; cocycle/twisted-section conventions are stated once. Rational, integral and almost assertions remain separate, including the source’s lim¹/flatness/integral-effectivity hypotheses.

Both packets independently number source findings `PerfectoidSpaces/E1`–`E34`. The combined reader qualifies each finding by part, preserving all 58 P0 and 34 P8 records and their individual verdicts. Do not merge this appendix by bare ID: `(P0, PerfectoidSpaces/E1)` and `(P8, PerfectoidSpaces/E1)` are different findings. P0’s existing E21/E41 and E34/E43 duplicates also retain their stable IDs. Rejected findings are explicitly labeled rejected. Source IDs/editions/hashes and inherited read provenance are retained separately by part; no new fresh-paper reads are implied.

## Suggested-file integration

The P0–P7 body is retained verbatim after its old standalone introduction. The P8–P9 body is retained with the following assembly-only signature/name changes:

1. Remove P8’s standalone perfectoid predicate and consume P1’s actual `TauCeti.Perfectoid.IsPerfectoidTateRing`. Its complete Hausdorff uniform Tate-ring assumptions and bijective Frobenius R°/ϖ → R°/ϖᵖ now govern the P8 theorem as well. Its mod-p-surjectivity criterion remains P1’s existing equivalence theorem.
2. Use outer `TauCeti`, so the packet’s `Huber.Pair`, `MulAction` and `PerfectoidSpace` prefixes do not acquire a second `Perfectoid` component. Ring invariant-perfectoid theorems are explicitly inside `TauCeti.Perfectoid`. The later ring-level torsor section is `TauCeti.TorsorDescent`. P8’s recorded module/namespace proposals are kept in the reader as part records, and the combined name convention is explained there; a future implementation should use the reconciled prefixes.
3. Qualify Mathlib `_root_.CategoryTheory` references to avoid capture by the P5 helper namespace.
4. Add `instCompleteSpaceFixedPointsSubring` for the inherited compatible additive uniformity. This registers the completeness of the closed fixed subring already stated in P8/invariant-huber-pair and is necessary to apply P1’s class to A^G. Its own A/G binders avoid overlapping topological/uniform instances. The P8 perfectoid sections use P1’s ambient uniform-space classes.

These changes reconcile proposed Lean forms of unchanged reviewed statements. An assembly reviewer should check this integration; no existing mathematical review verdict has been reused to certify a new Lean signature. Geometric operations whose carriers are not yet available remain explicit named supplier comments. No missing carrier or condition is replaced by a vacuous Prop-valued stand-in. All 392 node IDs and every one of the 864 API and 382 test names occur in the combined file, either as inherited signatures/examples or as the inherited explicitly scoped supplier obligations; occurrence is not a claim that every geometric signature elaborates today.

## Validation and compilation limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpaces--P0.json`: **0 errors, 0 warnings**.
- `python3 scripts/check_blueprint.py research/blueprint/packets/PerfectoidSpaces--P8.json`: **0 errors, 0 warnings**.
- Local graph inventory: 392 distinct node IDs; all local prerequisites resolve; no local prerequisite cycle. The 37 P8–P9 cross-part entries below resolve to 23 distinct P0–P7 nodes. Every supplier statement was read against its consuming statement. No ambiguous or missing cross-part ID required a packet edit or an additional gap. External request completion and the original P0 review were not certified anew.
- Reader coverage compared with packets: exact statements, hypotheses, proof steps, API/tests, uses, acceptance, prerequisites and source locators/match notes retained for all nodes; no duplicate explicit anchors or broken generated internal links. Source excerpts remain in the source packets.
- Suggested name/node inventory: no missing node, API or test names; one standard note, one import block and one perfectoid-Tate-ring definition. Intake file validation: **3 files, 0 problems**. `git diff --cached --check`: **passes**.

The complete suggested file **did not elaborate**: `lean-check research/blueprint/suggested/PerfectoidSpaces.lean` stopped at the first import because the existing shared build lacks the compiled object for `TauCeti.AlgebraicGeometry.AdicSpace.ResidueField`. Inspection found five unavailable compiled imports in the retained pinned import set:

- `TauCeti.AlgebraicGeometry.AdicSpace.ResidueField`
- `TauCeti.AlgebraicGeometry.AdicSpace.Spa.HuberPair`
- `TauCeti.AlgebraicGeometry.AdicSpace.Spa.RationalSubset.Basis`
- `TauCeti.AlgebraicGeometry.AdicSpace.Spa.Spectral`
- `TauCeti.RingTheory.Huber.Padic.Field`

The complete body, including P0/P8 interaction beyond the check below, is therefore **unvalidated by full elaboration**, and may still contain errors. These imports were retained; no library build, alternate project, package update/cache fetch or language server was started. Do not report a whole-file compilation success based on the bounded check.

A bounded P8–P9 integration input combined the original P8 available individual imports, `Mathlib.Topology.Algebra.UniformRing` and `TauCeti.Topology.Algebra.IsUniformGroup.Subring`, the exact P1 `section Frobenius` and `section Definition` definitions of Frobenius and the canonical class, and the **actual assembled P8–P9 body**. `lean-check` completed with exit 0 and **73 declaration-uses-sorry warnings, no other messages**. This checks the changed namespaces, canonical predicate use and fixed-subring completeness in that isolated integration input. It does not include P0’s remaining 17,000-plus-line body. The earlier bounded attempt also returned exit 0 but warned about overlapping uniform/topological instances; the binder correction above removed that warning, and the final bounded run was clean apart from sorry.

The shared build’s actual Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; actual Tau Ceti is `cf386627e9176a3827c1a5fe804989fd94a4d216`, not the packet’s source baseline `f790474821cf4256814db967cb154e7af3d0c369`. This is the same existing build used by the P8 reviewer. The current assembly makes no blanket claim that every module agrees between those Tau Ceti commits. Available memory exceeded 20 GB before compiling; checks were sequential and no compilation process remains running. Once the missing compiled modules exist in an allowed pinned build, resume with the full-file `lean-check` command above. The transient bounded input/logs are deleted with scratch after submission; this note contains its construction and result.

## Cross-part prerequisites

These identifiers are already correct in the packets. The table records the seam checks, not new proofs. The graph remains acyclic locally; pending integral perfectoidization is not routed back through P8.

| Consumer | P0–P7 supplier |
| --- | --- |
| `PerfectoidSpaces:P8/frobenius-on-invariants-of-p-group` | `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring` |
| `PerfectoidSpaces:P8/frobenius-on-invariants-of-p-group` | `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras` |
| `PerfectoidSpaces:P8/invariants-of-perfectoid-tate-ring` | `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras` |
| `PerfectoidSpaces:P8/invariants-of-perfectoid-tate-ring` | `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring` |
| `PerfectoidSpaces:P8/rational-invariants-characteristic-p` | `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids` |
| `PerfectoidSpaces:P8/rational-invariants-perfectoid` | `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt` |
| `PerfectoidSpaces:P8/rational-invariants-perfectoid` | `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids` |
| `PerfectoidSpaces:P8/rational-invariants-perfectoid` | `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets` |
| `PerfectoidSpaces:P8/affinoid-perfectoid-quotient` | `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity` |
| `PerfectoidSpaces:P8/quotient-scalar-extension` | `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces` |
| `PerfectoidSpaces:P8/free-action-quotient-is-torsor` | `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids` |
| `PerfectoidSpaces:P8/zariski-closed-embedding` | `PerfectoidSpaces:P4/perfectoid-immersion` |
| `PerfectoidSpaces:P8/zariski-closed-embedding` | `PerfectoidSpaces:P4/zariski-closed-immersion` |
| `PerfectoidSpaces:P8/zariski-closed-embedding` | `PerfectoidSpaces:P4/universal-perfectoid-zariski-closed` |
| `PerfectoidSpaces:P8/zariski-closed-embedding` | `PerfectoidSpaces:P4/zariski-closed-base-change` |
| `PerfectoidSpaces:P8/zariski-closed-embedding` | `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces` |
| `PerfectoidSpaces:P8/analytically-separated` | `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces` |
| `PerfectoidSpaces:P8/analytically-separated` | `PerfectoidSpaces:P2/fibre-products-over-analytic-base` |
| `PerfectoidSpaces:P8/analytically-separated-is-separated` | `PerfectoidSpaces:P4/separated-perfectoid-map` |
| `PerfectoidSpaces:P8/analytically-separated-is-separated` | `PerfectoidSpaces:P4/perfectoid-immersion` |
| `PerfectoidSpaces:P8/analytically-separated-affinoid-intersections` | `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces` |
| `PerfectoidSpaces:P8/limit-of-zariski-closed-embeddings` | `PerfectoidSpaces:P4/universal-perfectoid-zariski-closed` |
| `PerfectoidSpaces:P8/perfectoid-from-perfectoid-components` | `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces` |
| `PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower` | `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces` |
| `PerfectoidSpaces:P8/finite-level-affinoid-basis` | `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces` |
| `PerfectoidSpaces:P8/finite-level-affinoid-basis` | `PerfectoidSpaces:P7/represented-functor-comparison` |
| `PerfectoidSpaces:P8/finite-level-affinoid-basis` | `PerfectoidSpaces:P7/rational-subsets-from-finite-level` |
| `PerfectoidSpaces:P8/good-tower` | `PerfectoidSpaces:P7/represented-functor-comparison` |
| `PerfectoidSpaces:P8/closed-loci-in-towers` | `PerfectoidSpaces:P7/perfectoid-tilde-limit` |
| `PerfectoidSpaces:P8/closed-loci-in-towers` | `PerfectoidSpaces:P7/tilde-limit-rational-restriction` |
| `PerfectoidSpaces:P9/profinite-galois-tower` | `PerfectoidSpaces:P7/perfectoid-tilde-limit` |
| `PerfectoidSpaces:P9/profinite-galois-tower` | `PerfectoidSpaces:P7/tilde-limit-base-change` |
| `PerfectoidSpaces:P9/profinite-galois-tower` | `PerfectoidSpaces:P7/compact-open-subgroup-cofinality` |
| `PerfectoidSpaces:P9/profinite-galois-tower` | `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change` |
| `PerfectoidSpaces:P9/almost-cohomology-of-tower` | `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base` |
| `PerfectoidSpaces:P9/weight-extension-of-function-descent` | `PerfectoidSpaces:P2/fibre-products-over-analytic-base` |
| `PerfectoidSpaces:P9/approximation-of-units-at-finite-level` | `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces` |

## Follow-up ownership and review

Continue the unfinished P0 broad review and its general-base mod-ϖ comparison in the owning jobs; this assembly does not accept that packet. The pending PerfectoidQuotients Part II needs the BS22 10.11 supplier before the integral finite-tower gap is closed. The inherited reader request/gap registers below give the other precise proof and supplier actions. Apply restructuring only through the maintainer/orchestrator; no other roadmap files were edited. The old part readers remain stale but outside this assembly’s allowed deliverables; the new combined reader incorporates the current corrected packets. No claim is made that inherited requests have been fulfilled by assembling their text.

## Supplier requests

These are inherited obligations, not completed supplier work or applied restructuring. Stable request/gap numbers below are assembly references qualified by packet part.

### P0/requests-1

**supplier.** DerivedDeRhamCohomology:DD.0

**need.** (A) For every map of commutative rings R → S (and of simplicial commutative rings): the cotangent complex L_{S/R} ∈ D(S) by the standard simplicial polynomial resolution, with (a) H_0(L_{S/R}) ≅ Ω_{S/R} compatibly with Mathlib `KaehlerDifferential`; (b) the natural transitivity triangle for R → S → T (Illusie II.2.1.2); (c) the base-change isomorphism for a Tor-independent square (Illusie II.2.2.1); (d) compatibility with filtered colimits (Illusie II.1.2.3.4); (e) Ext⁰_S(L_{S/R}, M) ≅ Der_R(S, M) and Ext¹_S(L_{S/R}, M) ≅ Exal_R(S, M) (Illusie II.1.2.4.2, III.1.2.3); (f) the obstruction theory for flat square-zero deformations of a flat algebra (obstruction in Ext², torsor under Ext¹, automorphisms Ext⁰; Illusie III.2.1.2.3) and for lifting morphisms (obstruction in Ext¹, torsor under Ext⁰; Illusie III.2.2.2); (g) the quasi-isomorphism L_{S/R} ≃ L^Δ_{S_•/R_•} for simplicial resolutions and the spectral sequence H_j(L_{S[i]/R[i]}) ⇒ H_{i+j}(L^Δ) (Illusie II.1.2.6.2). PerfectoidSpaces:P0 builds the almost cotangent complex L_{B/A} := B_!! ⊗ L_{(V^a×B)!!/(V^a×A)!!} and its deformation theory on these. (B) The classical cotangent complex L_{B/A} of a ring map via simplicial polynomial resolutions, with functoriality in the pair (A → B), the transitivity triangle, derived (Tor-independent) base change and flat base change, and the identification of the effect of a map of simplicial resolutions (used for the relative Frobenius criterion L_{B/A} ≃ 0 when A(Φ) ⊗^L_A B → B(Φ) is an isomorphism, Gabber–Ramero Lemma 6.5.9). P0 builds the almost version on it.

**neededBy.**

- PerfectoidSpaces:P0/almost-cotangent-comparison-classical

- PerfectoidSpaces:P0/almost-cotangent-complex

- PerfectoidSpaces:P0/almost-exal-ext-comparison

- PerfectoidSpaces:P0/cotangent-flat-base-change

- PerfectoidSpaces:P0/cotangent-transitivity

- PerfectoidSpaces:P1/cotangent-complex-vanishing-mod-varpi

- PerfectoidSpaces:P1/deformation-lifting-of-perfectoid-mod-varpi-algebras

### P0/requests-2

**supplier.** tauceti:TauCetiRoadmap/ModularCurves#0e-effective-descent-and-spreading-out

**need.** Effective faithfully flat descent for modules and for commutative algebras along a faithfully flat ring map A → B: the functor from A-modules (A-algebras) to B-modules (B-algebras) with descent data (isomorphism p₂*N ≅ p₁*N over B ⊗_A B satisfying the cocycle condition) is an equivalence, with descent of flatness, finite generation, finite presentation, finite projectivity and (weak) étaleness. Mathlib has comonadicity of extension of scalars (`comonadicExtendScalars`) and the Amitsur equalizer for rings, but not the descent-data formulation; PerfectoidSpaces:P0 transports this statement to almost modules and almost algebras along A_!! → B_!!.

**neededBy.**

- PerfectoidSpaces:P0/almost-faithfully-flat-descent

### P0/requests-3

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras

**need.** (A) Complete Hausdorff Tate rings with their power-bounded subring A°, topologically nilpotent ideal A°°, bounded sets, pseudo-uniformizers, pairs of definition and the open mapping theorem over a Tate ring, as already pinned in Tau Ceti (TauCeti.Huber.IsTateRing, powerBoundedSubring, topologicallyNilpotentIdeal, IsBounded, IsPseudoUniformizer, PairOfDefinition, IsTateRing.isOpenMap), together with the anchor's restricted power series A⟨X⟩ (restrictedMvPowerSeriesCompletion) and completion of Huber rings. P1 uses them as stated; no new Layer-0 object is required beyond what the pinned tree has. (B) Strong noetherianness of affinoid algebras over a complete rank-one nonarchimedean field (Layer 0.5, BGR 5.2.6: K⟨X₁, …, X_n⟩ noetherian and stability under quotients), instantiated for perfectoid fields of characteristic p, so that Tau Ceti's `Huber.IsStronglyNoetherian` holds for the reduced affinoid algebras of the p-finite route. (C) Completion of Tate rings with its rings of definition: for a Tate ring A with ring of definition A₀ ∋ ϖ (ϖ a pseudouniformiser), the completion Â is a complete Tate ring with ring of definition the ϖ-adic completion Â₀ and Â = Â₀[ϖ⁻¹]; the colimit topology on a filtered colimit of Tate rings with compatible rings of definition (colim A_{i,0} a ring of definition) and its completion; ϖ-adic completeness of the rings of definition of a complete Tate ring. Used to translate Gabber–Ramero's (t, I)-adic statements into the Tate-ring statements of the henselian comparison. (D) The open mapping theorem for continuous surjections of complete Tate rings (already pinned: Tau Ceti `Huber.IsTateRing.isOpenMap`, `isQuotientMap`) in the form: a continuous surjection R → S of complete Tate rings identifies S with R/ker as topological rings. (E) Complete Tate rings with a ring of definition carrying the ϖ-adic topology built from a ϖ-adically complete ϖ-torsion-free ring A⁺ (A = A⁺[1/ϖ]), their completion, and open integrally closed subrings containing all topologically nilpotent elements.

**neededBy.**

- PerfectoidSpaces:P1/perfect-complete-tate-ring-is-uniform

- PerfectoidSpaces:P1/perfected-tate-algebra

- PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras

- PerfectoidSpaces:P2/p-finite-acyclicity-from-tate

- PerfectoidSpaces:P3/finite-etale-completed-direct-limit

- PerfectoidSpaces:P3/henselian-finite-etale-approximation

- PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions

- PerfectoidSpaces:P4/strongly-zariski-closed-immersion

- PerfectoidSpaces:P7/frobenius-controlled-integral-tower

- PerfectoidSpaces:P7/frobenius-tower-completion

- PerfectoidSpaces:P7/tilde-limit-from-completed-colimit

### P0/requests-4

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-4-sheafiness-and-tate-acyclicity

**need.** (A) The uniformity predicate of Layer 4.2 (Hansen–Kedlaya Definition 2.3: A° bounded) for Tate rings. P1 states uniformity as TauCeti.Huber.IsBounded (powerBoundedSubring R) and needs the anchor's predicate, when it lands, to be (propositionally) this boundedness, so that IsPerfectoidTateRing.isUniform is an equality of propositions. (B) (a) Uniform and stably uniform complete Tate pairs (Hansen–Kedlaya Definitions 2.3 and 3.13) and the pair-level Buzzard–Verberkmoes theorem that a stably uniform complete Tate pair is sheafy (Layer 4.2), consumed for perfectoid pairs; (b) the all-degree exactness of the augmented Čech complex of O_X for every finite rational covering of every rational subset of a complete strongly noetherian Tate pair (Layer 4.1), consumed for reduced affinoid algebras over a perfectoid field of characteristic p. (C) Layer 4.2: the predicate `Huber.IsUniform` (A° bounded, Hansen–Kedlaya Definition 2.3) invariant under isomorphism, used in the statements that perfectoid completed tensor products are uniform and in the dense-image criterion; stable uniformity implies sheafiness (Buzzard–Verberkmoes) enters through PerfectoidSpaces:P2/perfectoid-stably-uniform-and-sheafy. (D) The Buzzard–Verberkmoes theorem: a stably uniform complete Tate Huber pair is sheafy (used through AdicSpacesPartII:R3/stably-uniform-sheafy for the strong sheafiness of perfectoid Tate rings), and the Tate acyclicity of O on rational coverings of a sheafy Tate affinoid (used through AdicSpacesPartII:R3 for gluing finite projective modules).

**neededBy.**

- PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras

- PerfectoidSpaces:P2/completed-tensor-of-perfectoid-is-perfectoid

- PerfectoidSpaces:P2/integral-cech-cohomology-bounded-torsion

- PerfectoidSpaces:P2/p-finite-acyclicity-from-tate

- PerfectoidSpaces:P2/perfect-uniform-completed-tensor

- PerfectoidSpaces:P2/perfectoid-dense-image-criterion

- PerfectoidSpaces:P2/perfectoid-stably-uniform-and-sheafy

- PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity

- PerfectoidSpaces:P2/uniform-completed-tensor-of-perfectoid-over-any-base

- PerfectoidSpaces:P3/etale-descent-perfectoid

- PerfectoidSpaces:P3/perfectoid-tate-rings-are-strongly-sheafy

### P0/requests-5

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

**need.** The Layer 6.1 package: a complete rank-one nonarchimedean perfect field F of characteristic p with pseudo-uniformizer ϖ, A_inf = W(𝒪_F) with pair of definition (A_inf, (p,[ϖ])) and its (p,[ϖ])-adic completeness and separatedness. P1 proves that F is a perfectoid field equal to its tilt and that A_inf = W(F♭+) with the same completeness statement (P1/witt-vectors-of-perfect-plus-ring), and needs the anchor objects to be stated for a Tau Ceti nonarchimedean field so that the comparison is an identification of declarations.

**neededBy.**

- PerfectoidSpaces:P1/anchor-layer-6-compatibility

### P0/requests-6

**supplier.** TropicalAndBerkovichArithmetic:TB.0

**need.** For a commutative nonarchimedean Banach ring A (or a uniform Banach algebra over a nonarchimedean field): the Berkovich spectrum M(A) of bounded multiplicative seminorms is nonempty for A ≠ 0; f ∈ A is a unit iff α(f) ≠ 0 for all α ∈ M(A) (Berkovich Theorem 1.2.1, Corollary 1.2.4); and the spectral seminorm satisfies |f|_sp = max_{α ∈ M(A)} α(f) (Berkovich Theorem 1.3.1). These are the inputs of Kedlaya's Theorem 3.7 (Banach fields). The same maximum formula for an arbitrary nonarchimedean Banach ring B (Kedlaya AWS Lemma 1.5.21: the spectral seminorm of B equals the supremum of α over the Gel'fand spectrum M(B), attained since M(B) is compact) is used to pass between pointwise and global forms of the sharp approximation lemma for perfectoid Tate rings of any characteristic.

**neededBy.**

- PerfectoidSpaces:P1/uniform-banach-field-over-nondiscrete-field

- PerfectoidSpaces:P1/sharp-approximation-lemma

### P0/requests-7

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf

**need.** (A) (a) The presentation-independent rational localisation (O_X(U), O_X⁺(U)) of a complete Hausdorff Huber pair as a functor on the poset of rational subsets, with restriction maps satisfying the identity and composition laws (Layer 3.1), built from Tau Ceti's per-presentation `PairOfDefinition.completionLocObj`, `completedPlusSubring`, `presentationRingEquivOfEq` and `restrictionRingHomOfSubset`; (b) the homeomorphism Spa(O_X(U), O_X⁺(U)) ≅ U identifying rational subsets for the completed localisation (Tau Ceti has `spaLocalizationHomeomorph` for the uncompleted one); (c) the structure presheaves O_X, O_X⁺ on all opens of Spa(A, A⁺) with O_X(X) ≅ A (Layers 3.3, 3.5; the pinned `presentationLimitPresheaf` is not identified with O_X) and the predicate `Huber.IsSheafyPair` (Layer 3.4); (d) stalks O_{X,x}, residue fields k(x) with the valuation of x, and the completed residue affinoid field (k(x)^, k(x)^⁺) with its canonical morphism (A, A⁺) → (k(x)^, k(x)^⁺) (the κ(x) that AdicSpacesPartII:R0/adic-valuation-rings-and-centres also requests). (B) Layer 3.1-3.5: the completed rational localisation (A⟨T/s⟩, A⟨T/s⟩⁺) with its universal property among complete Huber pairs and Spa(A⟨T/s⟩) ≅ R(T/s) matching valuations and rational subsets; the structure presheaf on Spa with O_X(X) ≅ A as topological rings for complete Hausdorff pairs; the category 𝒱 with its morphisms (continuous maps, maps of presheaves of complete topological rings, local stalk maps, compatible valuations). (C) Rational localisations O(U) of a complete Tate pair as complete Tate pairs (with O⁺(U) ϖ-adically complete), their restriction maps, and for x ∈ X the directed system (O(U), O⁺(U))_{U ∋ x} with its canonical maps to (k(x)^, k(x)^⁺); no sheafiness assumed. Used by the spreading-out of finite étale algebras from the completed residue field. (D) The structure presheaf with O⁺_X(U) = {f ∈ O_X(U) : v_x(f) ≤ 1 for x ∈ U}, stalks O_{X,x} as local rings with the valuation v_x factoring through the residue field, and restriction maps of rational localizations (Layer 3.1, 3.3, 3.4). (E) The presheaf O⁺_X(U) = {f ∈ O_X(U) : v_x(f_x) ≤ 1 for all x ∈ U} with its restriction maps (Layer 3.3), on which the ϖ-adic completeness of global integral sections of a perfectoid space is proved by writing O⁺_Y(Y) as an equaliser of products over an affinoid perfectoid cover. (F) The structure presheaf on rational subsets of Spa(A, A⁺) for a complete Tate pair: O(U(T/s)) is the completion of A[1/s] with ring of definition generated by A_0[T/s], with the universal property of rational localisation, compatibly with the pinned `completionLocalization`; used to transfer density of finite-level sections to rational subsets.

**neededBy.**

- PerfectoidSpaces:P2/affinoid-perfectoid-basis

- PerfectoidSpaces:P2/affinoid-perfectoid-space

- PerfectoidSpaces:P2/almost-integral-model-of-untilted-rational-localization

- PerfectoidSpaces:P2/characteristic-p-affinoid-perfectoid-criterion

- PerfectoidSpaces:P2/completed-residue-fields

- PerfectoidSpaces:P2/integral-cech-cohomology-bounded-torsion

- PerfectoidSpaces:P2/perfectoid-pair-rational-restriction

- PerfectoidSpaces:P2/perfectoid-stably-uniform-and-sheafy

- PerfectoidSpaces:P2/products-in-perf

- PerfectoidSpaces:P2/rational-localization-in-characteristic-p

- PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids

- PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity

- PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets

- PerfectoidSpaces:P3/residue-field-finite-etale-colimit

- PerfectoidSpaces:P4/intersection-of-rational-subsets

- PerfectoidSpaces:P4/isomorphism-from-homeomorphism-and-residue-pairs

- PerfectoidSpaces:P4/residue-field-point-injection

- PerfectoidSpaces:P4/stalk-of-plus-sheaf-modulo-pseudouniformizer

- PerfectoidSpaces:P5/integral-sections-are-varpi-complete

- PerfectoidSpaces:P7/good-affinoid-perfectoid-basis

- PerfectoidSpaces:P7/tilde-limit-implies-residue-field-tilde-limit

- PerfectoidSpaces:P7/tilde-limit-rational-restriction

### P0/requests-8

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-2-affinoid-spectra-and-rational-subsets

**need.** (A) (a) Wedhorn Proposition 7.48: for an affinoid ring A the map Spa Â → Spa A is a homeomorphism identifying rational subsets (Huber 1994 Proposition 2.11 in Sch12); (b) Wedhorn Proposition 8.2(2): a rational subset of a rational subset is rational in the ambient spectrum; (c) the normal form of a rational subset of a Tate affinoid with numerators and denominator in A⁺ and one numerator a power of a pseudo-uniformizer (Sch12 Remark 2.8), assembled from Tau Ceti's `rationalSubset_insert_of_forall_vle`, `rationalSubset_image_mul_right` and quasi-compactness. (B) Layer 2.3: O⁺ as the sub-unit locus, A⁺ = {a : v(a) ≤ 1 for all v ∈ Spa(A, A⁺)} (Wedhorn Proposition 7.52(1)), and the covering of the analytic locus by rational subsets with Tate coordinate rings. (Spectrality of Spa, the rational basis and analyticity of Tate spectra are already in the pinned Tau Ceti tree and are cited as baseline.) (C) Quasi-compactness (spectrality) of Spa(A, A⁺) and the basis of rational subsets; the description A⁺ = {a ∈ A : |a(x)| ≤ 1 for all x ∈ Spa(A, A⁺)} (Huber, Wedhorn Proposition 7.52), in particular A° = {a : |a(x)| ≤ 1 for all x ∈ Spa(A, A°)} for uniform A; the completed residue field k(x)^ of a point and the valuation topology. Used for the finite rational coverings of the tilting equivalence and for the trace bound of finite étale algebras over uniform rings. (D) For a complete Tate Huber pair (A, A⁺) and x ∈ Spa(A, A⁺): every generalization of x is a vertical generalization, the generalizations of x form a chain in bijection with the valuation subrings V of the completed residue field with K(x)⁺ ⊆ V ⊆ K(x)°, and x has a unique rank-one generalization; rational subsets {|f| ≤ 1} of Spa(K, K⁺) for an affinoid field are the Spa(K, K⁺[f]). The quotient-pair closed embedding (Wedhorn 7.38) is already in the pinned tree (Tau Ceti `Huber.Pair.Hom.isClosedEmbedding_spaComap_quotientHom`). (E) Completion does not change the adic spectrum (Wedhorn Lemma 7.47 and Proposition 7.48 = Huber 1993 Proposition 3.9): for a Huber pair (A, A⁺) with completion Â, the closure Â⁺ of the image of A⁺ is a ring of integral elements of Â, and the map Spa(Â, Â⁺) → Spa(A, A⁺) induced by A → Â is a homeomorphism under which rational subsets correspond (R(T/s) ↦ R(T/s) with T, s read in Â). Layer 2 cites Wedhorn §§7.2–7.7 but does not list 7.48 as a target; the same statement is requested by AdicSpacesPartII:R0 (request (b) of its part R0a). (F) For a Huber pair (A, A⁺) with completion (Â, Â⁺): Spa(Â, Â⁺) → Spa(A, A⁺) is a homeomorphism identifying rational subsets (Huber, Wedhorn Proposition 7.48); and for a complete Tate pair, an element is a unit if it vanishes at no point of Spa(A, A⁺) and is topologically nilpotent if |f(x)| < 1 at every point (Wedhorn Proposition 7.52(2) and Corollary 7.33 type statements; the pinned `isUnit_of_forall_not_vle_zero` assumes open maximal ideals and is vacuous for Tate rings).

**neededBy.**

- PerfectoidSpaces:P2/affinoid-perfectoid-space

- PerfectoidSpaces:P2/approximation-lemma

- PerfectoidSpaces:P2/completed-direct-limits-of-p-finite-affinoids

- PerfectoidSpaces:P2/fibre-products-over-analytic-base

- PerfectoidSpaces:P2/p-finite-acyclicity-from-tate

- PerfectoidSpaces:P2/perfectoid-pair-rational-restriction

- PerfectoidSpaces:P2/products-in-perf

- PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets

- PerfectoidSpaces:P2/tilting-map-of-spectra

- PerfectoidSpaces:P3/finite-etale-over-uniform-is-uniform

- PerfectoidSpaces:P3/finite-etale-tilting-equivalence

- PerfectoidSpaces:P3/residue-field-finite-etale-colimit

- PerfectoidSpaces:P4/affinoid-perfectoid-field-points

- PerfectoidSpaces:P4/anchor-closed-immersion-comparison

- PerfectoidSpaces:P4/maps-of-perfectoid-spaces-are-generalizing

- PerfectoidSpaces:P4/quasicompact-and-quasiseparated-maps

- PerfectoidSpaces:P4/strongly-zariski-closed-immersion

- PerfectoidSpaces:P4/zariski-closed-immersion

- PerfectoidSpaces:P5/limit-underlying-space-homeomorphism

- PerfectoidSpaces:P5/spa-of-filtered-colimit-of-tate-pairs

- PerfectoidSpaces:P7/strong-completion

- PerfectoidSpaces:P7/tilde-limit-from-completed-colimit

- PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness

### P0/requests-9

**supplier.** AdicSpacesPartII:R0

**need.** Rational localisations of a reduced affinoid algebra over a complete rank-one nonarchimedean field are reduced affinoid algebras (Bosch–Güntzer–Remmert 7.3.2 Corollary 10), so that, with AdicSpacesPartII:R0/reduced-affinoid-supremum-norm, reduced affinoid algebras are stably uniform. Needed over perfectoid fields of characteristic p.

**neededBy.**

- PerfectoidSpaces:P2/p-finite-acyclicity-from-tate

### P0/requests-10

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry

**need.** (A) (a) The category of adic spaces (objects of Huber's category 𝒱 locally isomorphic to Spa of a sheafy Huber pair) as a Lean category in which Mathlib's `ObjectProperty.FullSubcategory`, `CategoryTheory.Over`, `HasPullbacks` and `IsPullback` can be stated; (b) open adic subspaces (U, O_X|_U, (v_x)) with the universal property of open immersions (Wedhorn Remark 8.23(2)) and the existence, for open affinoid U, V and x ∈ U ∩ V, of an open W ∋ x rational in both (Wedhorn Remark 8.23(3)); (c) gluing of adic spaces along open subspaces and gluing of morphisms (morphisms form a sheaf, Wedhorn Remark 8.24); (d) Wedhorn Proposition 8.25 (Huber 1994 Proposition 2.1): for an adic space X and a complete sheafy Huber pair (A, A⁺), Hom(X, Spa(A, A⁺)) ≅ Hom((A, A⁺), (O_X(X), O_X⁺(X))) naturally; (e) the discrete adic space Spa(𝔽_p, 𝔽_p) as an object. PerfectoidSpaces P2 defines perfectoid spaces as a full subcategory of this category and introduces no second carrier. (B) The category of adic spaces with open immersions, open covers, gluing of spaces and morphisms, affinoid adic spaces Spa(A, A⁺) for sheafy pairs, and the identification of morphisms X → Spa(A, A⁺) with continuous maps of pairs into global sections; perfectoid spaces are the full subcategory of these locally of the form Spa(R, R⁺) with R perfectoid (PerfectoidSpaces:P2/perfectoid-space), and the finite étale and étale morphisms of this stage are A1's classes on it. (C) (a) The category of adic spaces with its morphisms (Wedhorn's 𝒱: continuous map, morphism of structure sheaves, local on stalks, compatible with the stalk valuations), in which Perfd is a full subcategory; an isomorphism is a homeomorphism with an isomorphism of structure sheaves compatible with the valuations. (b) The universal property of affinoid adic spaces: for an adic space W and a complete sheafy Huber pair (A, A⁺), morphisms W → Spa(A, A⁺) correspond to morphisms of Huber pairs (A, A⁺) → (O_W(W), O⁺_W(W)) (Huber 1994 Proposition 2.1). (c) Open subspaces X|_U with the universal property that a morphism Z → X factors (uniquely) through X|_U iff |Z| lands in U; gluing of morphisms along open covers. (d) Closed immersions defined affinoid-locally by quotient pairs with closed ideal and sheafy quotient, independent of the cover (Layer 5.1). (D) The category of adic spaces with its open subspaces and gluing along open subspaces (Layer 5.1 and 5.3), of which perfectoid spaces form a full subcategory (PerfectoidSpaces:P2/perfectoid-space): the limit of a cofiltered diagram of affinoid perfectoid spaces is formed in this category, and qcqs étale spaces descended piece by piece are glued along quasicompact open subspaces at a finite stage. (E) Analytic adic spaces with their structure sheaves, open subspaces and gluing along open subspaces, and the description of morphisms into an affinoid adic space: for an adic space Y and a sheafy complete Huber pair (A, A⁺), Hom(Y, Spa(A, A⁺)) = Hom((A, A⁺), (O(Y), O⁺(Y))) (continuous maps of pairs). Used to glue perfectoid tilde-limits and to construct maps into them.

**neededBy.**

- PerfectoidSpaces:P2/affinoid-perfectoid-basis

- PerfectoidSpaces:P2/affinoid-perfectoid-pairs-tilting-equivalence

- PerfectoidSpaces:P2/affinoid-perfectoid-space

- PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces

- PerfectoidSpaces:P2/fibre-products-over-analytic-base

- PerfectoidSpaces:P2/open-subspaces-of-perfectoid-spaces

- PerfectoidSpaces:P2/perfectoid-fibre-product-universal-property

- PerfectoidSpaces:P2/perfectoid-space

- PerfectoidSpaces:P2/perfectoid-spaces-and-glued-tilting

- PerfectoidSpaces:P2/perfectoid-spaces-over-a-perfectoid-field-comparison

- PerfectoidSpaces:P2/products-in-perf

- PerfectoidSpaces:P2/tilting-slice-equivalence

- PerfectoidSpaces:P3/etale-morphism-of-perfectoid-spaces

- PerfectoidSpaces:P3/finite-etale-morphism-of-perfectoid-spaces

- PerfectoidSpaces:P4/affinoid-perfectoid-field-points

- PerfectoidSpaces:P4/anchor-closed-immersion-comparison

- PerfectoidSpaces:P4/injection-of-perfectoid-spaces

- PerfectoidSpaces:P4/intersection-of-rational-subsets

- PerfectoidSpaces:P4/isomorphism-from-homeomorphism-and-residue-pairs

- PerfectoidSpaces:P4/open-immersion-comparison

- PerfectoidSpaces:P4/quasicompact-and-quasiseparated-maps

- PerfectoidSpaces:P4/residue-field-point-injection

- PerfectoidSpaces:P4/strongly-zariski-closed-is-zariski-closed

- PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces

- PerfectoidSpaces:P5/qcqs-etale-essential-surjectivity

- PerfectoidSpaces:P7/perfectoid-tilde-limit

- PerfectoidSpaces:P7/preperfectoid-space

- PerfectoidSpaces:P7/strong-completion

- PerfectoidSpaces:P7/tilde-limit-gluing

- PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness

### P0/requests-11

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-1-valuation-spectra-and-continuous-valuations

**need.** (A) (a) Layer 1.3: a pro-constructible subspace of a spectral space is spectral (for the intersection of rational subsets). (b) Layer 1.5: for a continuous valuation x on a Tate ring with pseudouniformizer ϖ, the powers |ϖ(x)|ⁿ are eventually below every element of the value group (cofinality), and continuous valuations send topologically nilpotent elements below 1. (B) The cofinality form of continuity for Tate rings (Wedhorn Remark 7.11(1), the content of the proof of Theorem 7.10 that Layer 1.5 plans and Tau Ceti proves as `ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`): for a Tate ring A with ring of definition A₀ and pseudouniformiser ϖ ∈ A₀, a valuation v on A is continuous if and only if v(ϖ) is cofinal in the value group Γ_v; together with v(A⁺) ≤ 1 this characterises the points of Spa(A, A⁺). (C) The valuation spectrum Spv A of a commutative ring as the type of valuative relations on A, with a point determined by its relation vle (extensionality), and the adic spectrum Spa(A, A⁺) as a subset of Spv A. The pinned tree already contains exactly this (TauCeti.ValuationSpectrum, TauCeti.ValuationSpectrum.ext', TauCeti.ValuationSpectrum.spa); P6 uses it only to bound #Spa(A, A⁺) ≤ 2^{#A·#A} (ECD proof of Proposition 4.4) and asks for no further Layer 1 object. (D) Continuous valuations and their restriction along continuous ring maps, with rank-one (maximal) points computing spectral seminorms of Tate rings; continuity of a valuation on a Huber ring detected on generators of an ideal of definition.

**neededBy.**

- PerfectoidSpaces:P4/affinoid-perfectoid-field-points

- PerfectoidSpaces:P4/intersection-of-rational-subsets

- PerfectoidSpaces:P4/maps-of-perfectoid-spaces-are-generalizing

- PerfectoidSpaces:P4/zariski-closed-immersion

- PerfectoidSpaces:P5/spa-of-filtered-colimit-of-tate-pairs

- PerfectoidSpaces:P6/adic-spectrum-cardinality

- PerfectoidSpaces:P7/good-affinoid-uniform-completion

- PerfectoidSpaces:P7/tilde-limit-from-completed-colimit

- PerfectoidSpaces:P7/tilde-limit-perfectoid-uniqueness

### P0/requests-12

**supplier.** ClassicalAdicEtaleCohomology:H0

**need.** The general Huber tilde-limit predicate (topology and affinoid density as separate conditions, Huber Definition 2.4.2) stated for a cofiltered system of analytic adic spaces whose transition maps are quasicompact and quasiseparated (the X_i themselves not required qcqs; Scholze–Weinstein Definition 2.4.1 generality) and a compatible analytic adic space X that need not be qcqs or locally noetherian, so that PerfectoidSpaces:P7/perfectoid-tilde-limit is its restriction to perfectoid X; together with Huber's Corollary 2.4.6 for locally noetherian X, against which the perfectoid comparison of PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison is stated as compatible.

**neededBy.**

- PerfectoidSpaces:P7/perfectoid-tilde-limit

- PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison

### P0/requests-13

**supplier.** DiamondsAndVStacks:D0

**need.** Projective limits of coherent topoi (SGA 4 VI.8.2.3, VI.8.7.3 and VI.8.7.7): for a filtered colimit of coherent sites whose transition functors preserve finite limits and coverings, the topos of the colimit site is the projective limit of the fibred topos, and for sheaves (of sets, groups, abelian groups) pulled back from a stage the cohomology of the limit is the colimit of the cohomologies in degrees 0, ≤ 1, all n respectively.

**neededBy.**

- PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison

### P8/requests-1

**supplier.** DiamondsAndVStacks:D2

**need.** Quotients by finite groups computed as sheaves: for a finite group G acting on a v-sheaf (in particular a diamond) X, the quotient v-sheaf X/G with X × G ⇉ X → X/G a coequalizer, its compatibility with base change, and agreement of the pro-étale and v-sheaf quotients when X is a diamond. That O, O⁺ are v-sheaves and the v-site is subcanonical (ECD Theorem 8.7) is DiamondsAndVStacks:D2/v-descent-of-functions, cited as a node.

**neededBy.**

- PerfectoidSpaces:P8/invariant-quotient-v-sheaf-presentation

- PerfectoidSpaces:P8/free-action-quotient-is-torsor

### P8/requests-2

**supplier.** DiamondsAndVStacks:D4

**need.** For a finite group G acting on a diamond X: the pro-étale quotient X/G is a diamond, and for a G-stable open subdiamond U ⊆ X, U/G → X/G is the open subdiamond with |U/G| = |U|/G. Quotient presentations and the open-subfunctor correspondence themselves are DiamondsAndVStacks:D4/quotient-presentations-of-diamonds and DiamondsAndVStacks:D4/underlying-topological-space.

**neededBy.**

- PerfectoidSpaces:P8/quotient-diamond-comparison

### P8/requests-3

**supplier.** DiamondsAndVStacks:D5

**need.** ECD Lemma 11.27 (a spatial diamond all of whose connected components are affinoid perfectoid is affinoid perfectoid) and ECD Proposition 13.6 (a separated map of v-stacks is quasi-pro-étale if and only if it is representable in locally spatial diamonds and pro-étale over every Spa(C, O_C)). ECD 11.11, 11.13, 11.23(iii), 11.29 and 12.11 are cited as the nodes D4/isomorphism-criteria-for-v-sheaves-and-stacks, D4/underlying-topological-space, D5/limits-and-finite-stage-comparisons, D5/quasi-pro-etale-and-fibre-product-permanence and D4/spaces-and-surjectivity-for-small-v-stacks.

**neededBy.**

- PerfectoidSpaces:P8/invariant-quotient-v-sheaf-presentation

- PerfectoidSpaces:P8/perfectoid-from-perfectoid-components

### P8/requests-4

**supplier.** AdicSpacesPartII:R0

**need.** Classical affinoid algebras over a complete nonarchimedean field: Weierstrass division by monic polynomials with power-bounded coefficients (K⟨Y⟩⟨X⟩/(P) is free over K⟨Y⟩ of rank deg P), the invariant-ring statement BGR §6.3.3 as cited by Hansen and CHJ, and the intersection of two affinoids in a separated rigid space is affinoid (BGR 9.6.1/6, used by Hansen 1.3(ii) and HJ 5.3). Finite algebras over noetherian affinoids, closedness of submodules of finite modules and base change of finite algebras are the existing nodes R0/finite-algebra-over-affinoid, R0/noetherian-rod-module-complete and R0/finite-algebra-tensor-complete, cited directly. Also import completed-tensor-banach-module and banach-countable-type-orthogonal-basis. Extend the coordinate interface to weighted c₀ and arbitrary-cardinal residue bases over a discretely valued field. Supply the general saturated-completion/generic-fibre interface specified in P9/invariants-of-completed-lattice-tensor: quotient torsion-freeness, π-regular completion and its mod-πⁿ comparison, completion exactness for a regular quotient, completed-lattice saturation/localization intersection, and canonical generic-fibre comparison natural on elementary tensors. Use Mathlib AdicCompletion and flatness over valuation domains; map_exact’s Noetherian finite hypotheses are unavailable. Tests include zero lattices, nonsaturated πO ⊂ O, and the rescaled Q₂ unit-ball counterexample. These are proposed helper targets, not fabricated supplier node IDs.

**neededBy.**

- PerfectoidSpaces:P8/invariants-of-affinoid-algebra

- PerfectoidSpaces:P8/rigid-finite-quotient

- PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower

- PerfectoidSpaces:P9/invariants-of-completed-tensor-with-banach-space

- PerfectoidSpaces:P9/invariants-of-completed-lattice-tensor

- PerfectoidSpaces:P8/quotient-scalar-extension

### P8/requests-5

**supplier.** AdicSpacesPartII:R1

**need.** Analytification of quasi-projective varieties with closed immersions and ideal sheaves; rigid GAGA for projective varieties, in particular that a rigid space finite over the analytification of a projective variety is the analytification of a projective variety.

**neededBy.**

- PerfectoidSpaces:P8/closed-subvariety-pullback-is-zariski-closed

- PerfectoidSpaces:P8/good-tower

- PerfectoidSpaces:P8/good-towers-under-finite-maps

### P8/requests-6

**supplier.** AdicSpacesPartII:R5

**need.** Import the exact existing nodes profinite-flat-pseudobasis, mixed-completed-tensor, mixed-completed-tensor-product-formula, mixed-tensor-finite-projective-base-change, completed-coefficient-sheaf, coefficient-sheaf-local-equalizer, coefficient-sheaf-loc, coefficient-sheaf-tate-acyclicity, affinoid-weight-coefficient-sheaf and the sousperfectoid product nodes. For coefficient-sheaf-kiehl respect the finite-pseudobasis range: its infinite-pseudobasis existence assertion is explicitly open. The missing general coefficient-flatness, quotient compatibility and globalization inputs are the recorded R5 gap. For the Banach integral tensor application supply the coefficient sheaf condition with the same π-adic lattice completion as R0, rather than identify it with geometric O⁺.

**neededBy.**

- PerfectoidSpaces:P9/invariants-of-completed-tensor-with-profinite-module

- PerfectoidSpaces:P9/twisted-character-sheaf

- PerfectoidSpaces:P9/weight-extension-of-function-descent

- PerfectoidSpaces:P9/finite-level-character-sheaf-comparison

- PerfectoidSpaces:P9/coefficient-change-by-regular-element

- PerfectoidSpaces:P9/derived-coefficient-change

- PerfectoidSpaces:P9/integral-matrix-coboundary-effectivity

- PerfectoidSpaces:P9/weight-extension-sheaf-equalizer

### P8/requests-7

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-3-rational-localisation-and-the-structure-presheaf

**need.** Wedhorn's category 𝒱 of spaces with a sheaf of complete separated topological rings, local stalks and residue-field valuations (Tau Ceti AdicSpaces §3.4), as the category in which the categorical quotient X/G = (|X|/G, (q_*O_X)^G, (v_y)) is formed and proved universal.

**neededBy.**

- PerfectoidSpaces:P8/categorical-quotient

### P8/requests-8

**supplier.** tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry

**need.** Adic spaces as the objects of 𝒱 covered by affinoid adic spaces (Tau Ceti AdicSpaces Layer 5), with restriction to open subspaces, so that a quotient covered by affinoid quotients is an adic space.

**neededBy.**

- PerfectoidSpaces:P8/categorical-quotient

## Gaps

These are inherited obligations, not completed supplier work or applied restructuring. Stable request/gap numbers below are assembly references qualified by packet part.

### P0/gaps-1

**title.** GR §4.3 inputs of the rank decomposition not read

**neededBy.**

- PerfectoidSpaces:P0/rank-decomposition-of-finite-projective

**detail.** GR Proposition 4.3.27 is proved by induction from Lemma 4.3.12 (rank ≤ 1 case) and Lemma 4.3.26 (Λ²(Λ^{r−1}P) = 0); Lemmas 4.3.12-4.3.26 were not read. GR Lemma 2.3.7(vi) (uniform continuity of Λ^r under condition (B)), used in Remark 4.3.10(i), is stated with its proof 'left to the reader'. Next action: read arXiv v3 §4.3 pp. 85-88 and write the proof of 2.3.7(vi).

### P0/gaps-2

**title.** GR Theorem 5.2.4 and Lemma 5.2.1 proofs not read

**neededBy.**

- PerfectoidSpaces:P0/unramified-lifts-from-complete-reduction

**detail.** Part (iii) of the node (GR Corollary 5.2.15, tight I ⊆ rad(A), B almost finite) uses Theorem 5.2.12(iii)-(iv), whose proofs rest on Lemma 5.2.1 and Theorem 5.2.4 (idempotent generation of idempotent almost finitely generated ideals, Claims 5.2.5-5.2.10); only the statements and Claim 5.2.5 were read. Parts (i)-(ii), which the lifting theorem uses, rest on Theorem 5.2.12(ii) and Claim 5.3.29, which were read with proofs.

### P0/gaps-3

**title.** Classical local flatness criterion (Matsumura, Commutative Ring Theory, Theorem 22.3) not read

**neededBy.**

- PerfectoidSpaces:P0/almost-local-flatness-criterion

**detail.** GR (3.2.19) and Lemma 3.2.6 cite [54, Th. 22.3]; the node plans the nilpotent case (J² = 0) with the standard dévissage, which is not in the pinned Mathlib and was not checked against Matsumura's text.

### P0/gaps-4

**title.** Bourbaki, Algèbre commutative I §2 Prop. 10 (used in GR Lemma 2.4.29 (i.a), (ii.a)) not read

**neededBy.**

- PerfectoidSpaces:P0/tensor-hom-comparison-almost-projective

**detail.** The cases 'E flat and F almost finitely generated (presented)' of GR Lemma 2.4.29 reduce to Bourbaki's classical statement, which was not read; the cases used by the trace (E or F almost finite projective) are proved from ε-factorisations in GR and were read.

### P0/gaps-5

**title.** Berkovich spectral theory for Kedlaya's Banach-field theorem

**neededBy.**

- PerfectoidSpaces:P1/uniform-banach-field-over-nondiscrete-field

- PerfectoidSpaces:P1/perfectoid-ring-field-is-perfectoid-field

**detail.** Kedlaya, Banach fields, Theorem 3.7 (read in full, pp. 9–11) uses Berkovich's theorems that M(A) is nonempty, detects units, and computes the spectral seminorm as a maximum (Berkovich, Spectral theory, Theorems 1.2.1 and 1.3.1), which were not read and are not in the pinned libraries; requested from TropicalAndBerkovichArithmetic:TB.0. The characteristic-0 step of Kedlaya's Theorem 4.2 (homeomorphism M(A) ≅ M(A♭)) is replaced in this layer by the spectral-gauge comparison P1/spectral-norm-under-sharp, which needs no Berkovich theory.

### P0/gaps-6

**title.** Illusie–Gabber–Ramero almost deformation theory and the almost cotangent complex

**neededBy.**

- PerfectoidSpaces:P1/cotangent-complex-vanishing-mod-varpi

- PerfectoidSpaces:P1/deformation-lifting-of-perfectoid-mod-varpi-algebras

**detail.** Sch12 Theorems 5.11–5.12 cite Illusie III.2.1.2.3, III.2.2.2 and Gabber–Ramero Propositions 3.2.9, 3.2.16 (arXiv numbering; read as statements, Corollary 3.2.11 quoted); the almost cotangent complex and its transitivity triangle ("Theorem 2.5.36" of the book, not the arXiv 2.5.36) are P0/almost-cotangent-complex and P0/almost-deformation-theory, built on DD.0. The general-base equivalence P1/perfectoid-mod-varpi-equivalence does not use deformation theory. Off the critical path of P1 since FIX-RT-AREA-padic-1: both P1 nodes are an optional alternative route. P0's own finite-étale lifting still uses P0/almost-deformation-theory (through P0/nilpotent-lifting-of-etale-almost-algebras and P0/finite-etale-lifting-along-complete-flat-almost-algebras), so P0 keeps the almost cotangent/deformation extension; this answers the question RT-AREA-padic-1/5 left to P0's blueprint.

### P0/gaps-7

**title.** Sch12 Lemmas 6.4 and 6.5 over a perfectoid Tate base are not written out in any source

**neededBy.**

- PerfectoidSpaces:P2/almost-integral-model-of-untilted-rational-localization

- PerfectoidSpaces:P2/approximation-on-perfectoid-polydisc

- PerfectoidSpaces:P2/approximation-lemma

**detail.** ECD states after Theorem 3.13 that Scholze's proofs of 3.12-3.13 'work in general'; the proof steps of the three nodes carry out Scholze's argument over a perfectoid Tate ring R (resp. R₀) instead of a perfectoid field, using only the grading of R₀°⟨T^{1/p^∞}⟩, the model of O(U♯), and additivity of ♯ modulo ϖ; Bhatt's §9.2 gives the same argument over a field with R⁺ in place of R°. The independent general proofs read here are Kedlaya–Liu II Lemma 3.2.7 with Theorems 3.3.16 and 3.3.18(i), and Kedlaya AWS Lemmas 2.6.9, 2.6.17, 2.8.8 (Witt-vector Euclidean division), which avoid the polydisc. Next action: a reviewer checks the general-base steps, or the nodes switch to the Witt-vector route through PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals.

### P0/gaps-8

**title.** Reducedness of rational localisations of reduced affinoid algebras (BGR 7.3.2 Corollary 10) not read

**neededBy.**

- PerfectoidSpaces:P2/p-finite-acyclicity-from-tate

**detail.** Sch12 Proposition 6.10(ii) cites Bosch–Güntzer–Remmert 7.3.2 Corollary 10 through Huber 1994 Proposition 4.3; the book is not public and no packet node states the result. Requested from AdicSpacesPartII:R0. The other rigid inputs of the p-finite route are now supplied: uniformity of reduced affinoid algebras (AdicSpacesPartII:R0/reduced-affinoid-supremum-norm, for BGR 6.2.4 Theorem 1), Tate acyclicity in all degrees (anchor Layer 4.1, for BGR 8.2.1 Theorem 1), Spa of the completion (anchor Layer 2, Wedhorn Proposition 7.48, for Huber Proposition 2.11); Tate's theorem [31] Theorem 5.2 is avoided by taking S_I⁺ to be an integral closure.

### P0/gaps-9

**title.** Tilt of completed residue fields is implicit in the sources

**neededBy.**

- PerfectoidSpaces:P2/completed-residue-fields

**detail.** Sch12 Corollary 6.7(ii) and Kedlaya AWS Corollary 2.5.7 prove that k(x)^ is perfectoid but do not state (k(x)^)♭ ≅ k(x♭)^; Kedlaya–Liu I proof of Theorem 3.6.14(a) identifies o_{H(α)}/(p) with o_{H(β)}/(z) for corresponding rank-one points, and Kedlaya–Liu II Theorem 3.3.16 reduces to analytic fields. The node assembles the identification from Kedlaya–Liu II Corollary 3.3.22 and Theorem 3.3.18(ii)(b); that tilting commutes with completed filtered colimits (through R♭° = lim_Φ R°/ϖ) is asserted, not sourced. Next action: read Kedlaya–Liu II §3.3 case (ii) of Theorem 3.3.18(a) in full, or ECD §8-§9 where residue fields of diamonds are compared.

### P0/gaps-10

**title.** Representability of Hom between finite étale schemes (Gabber–Ramero Proposition 8.2.23) is not read

**neededBy.**

- PerfectoidSpaces:P3/henselian-finite-etale-approximation

**detail.** The full-faithfulness half of Gabber–Ramero Proposition 5.4.54 applies the orbit comparison to the functor Z ↦ Hom_Z(Z ×_X Y₁, Z ×_X Y₂) for finite étale Y₁, Y₂ over X = Spec R[t⁻¹], which Gabber–Ramero represent by a finite étale X-scheme (their Proposition 8.2.23, not read). Equivalently: morphisms of finite étale algebras correspond to idempotents of the tensor product (Kedlaya–Liu Lemma 1.2.3), and the scheme of idempotents of a finite étale algebra is finite étale over the base. Neither statement is in the pinned libraries or in a packet node; the node records the argument, and this representability is an open proof obligation of the node.

### P0/gaps-11

**title.** Detailed estimates of Elkik's noetherian approximation are recorded at the level of the source's steps

**neededBy.**

- PerfectoidSpaces:P3/elkik-noetherian-henselian-approximation

**detail.** Elkik's Théorème 2 bis is decomposed along its proof (Théorème 1 for complete rings, Tougeron's Lemme 2, the conormal-bundle Lemme 3, the principal case Lemme 4, induction on the number of generators). The exponent bookkeeping (the choice of n₀, r, the auxiliary element h in Lemme 4 and the Artin–Rees constant) is transcribed from the numdam text layer, which renders hats and script letters imperfectly; a formalisation should work from the printed article (Ann. Sci. ENS 6 (1973), pp. 558–567).

### P0/gaps-12

**title.** Algebraic closedness of the completion of an algebraic closure in characteristic p

**neededBy.**

- PerfectoidSpaces:P4/algebraically-closed-extension-of-affinoid-field

**detail.** Mathlib `IsAlgClosed.of_denseRange` assumes CharZero. For a perfectoid field K of characteristic p the completed algebraic closure is algebraically closed by the classical continuity-of-roots (Krasner) argument (Bosch–Güntzer–Remmert 3.4.1, Proposition 3), which is not in the sources read and not in the pinned libraries. The lemma is needed for tests on algebraically closed (C, C⁺) in characteristic p.

### P0/gaps-13

**title.** Countable-type reduction and Schauder bases in Kedlaya–Liu Lemma 2.2.9

**neededBy.**

- PerfectoidSpaces:P4/completed-tensor-over-analytic-field-kernel

**detail.** KL15 Lemma 2.2.9 says all three parts 'reduce immediately' to Banach modules with dense subspaces of countable dimension and then cites [Ked10, Lemma 1.3.11] (Kedlaya, p-adic differential equations) for Schauder bases. The reduction (it needs that the completed tensor norm of countable-type subspaces is computed inside them, a Hahn–Banach-type property of countable-type subspaces over a non-spherically-complete field) and the cited lemma were not read. AdicSpacesPartII:R3/countable-type-closed-subspace-section supplies the countable-type splitting.

### P0/gaps-14

**title.** Huber's §2.4 arguments behind Scholze 2012 Proposition 7.16, Theorem 7.17 and Corollary 7.19 (Huber 1996 is not public)

**neededBy.**

- PerfectoidSpaces:P7/residue-field-tilde-limit-etale-base-change

- PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison

- PerfectoidSpaces:P7/etale-topos-invariance-under-inseparable-towers

**detail.** Scholze 2012 proves Proposition 7.16 by 'the same proof as for Remark 2.4.3 of [20]', Theorem 7.17 by 'the same proof as for Proposition 2.4.4 of [20]' with the local open-immersion/finite-étale factorisation, Corollary 7.18 as Huber's Corollary 2.4.6, and Corollary 7.19 by 'the remark after Proposition 2.3.7 of [20]'. None of these Huber passages was read. The nodes give a proof route through public inputs: pointwise finite étale descent from Berkeley Lemma 7.4.6 and Theorem 7.4.8, the graph argument of ECD Proposition 6.4, Stacks Lemmas 5.23.3, 5.24.5-5.24.6, and SGA 4 VI.8. Two steps remain tied to Huber's text: the claim that bijectivity of |X| → lim |X_i| with dense residue fields already gives a homeomorphism (the route through DiamondsAndVStacks:D0/generalizing-surjection-is-quotient is sketched in the node and not checked against Huber's argument), and the invariance of the étale site of a locally noetherian analytic adic space under homeomorphic morphisms with purely inseparable residue-field extensions used in Corollary 7.19. Next action: read Huber, Étale cohomology of rigid analytic varieties and adic spaces (Aspects of Math. E30, 1996) §2.3-2.4, or locate the invariance statement in a public source (e.g. Huber's Proposition 2.3.7 as cited in subsequent public work).

### P0/gaps-15

**title.** Perfectoidness of the limit of a tilde-limit of affinoids from representability of the diamond limit

**neededBy.**

- PerfectoidSpaces:P7/represented-functor-comparison

**detail.** Scholze's survey Proposition 2.26 (every X ~ lim Spa(R_i, R_i⁺) is affinoid perfectoid with lim R_i dense) is proved there only assuming Conjecture 2.24 (perfectoidness of (A, A⁺) with p-adic topology on A⁺ from a rational cover by perfectoid rational localisations). The node PerfectoidSpaces:P7/represented-functor-comparison therefore states density as a separate clause and identifies it with perfectoidness of the uniformisation of the finite-level colimit; whether representability of lim X_i^◇ by a perfectoid space forces this density was not settled in the sources read. Consumers that need density (PerfectoidSpaces:P8/closed-loci-in-towers) assume the tilde-limit explicitly.

### P0/gaps-16

**title.** Root-annihilator criterion and the general-base mod-pseudouniformizer category

**neededBy.**

- PerfectoidSpaces:P1/frobenius-inverse-limit-lifting-in-characteristic-p

- PerfectoidSpaces:P1/perfectoid-mod-varpi-equivalence

**detail.** Added by REV-PerfectoidSpaces--P0. The original mod-ϖ node used Z[x^{1/p^∞}]/(x), over which its nonzero characteristic-p objects cannot be flat. The coefficient ring is corrected to F_p[x^{1/p^∞}]/(x), and the predicate is root-ideal almost flatness, matching the elementwise almost annihilator condition in the suggested file. Still supply a declaration-level proof of the equivalence between that criterion and almost flatness, its invariance under almost elements, and its comparison with flat K°a/ϖ-algebras for a perfectoid field K. A route is the flatness criterion on finitely generated ideals, which are generated by root monomials in the truncated root ring, followed by the almost scalar-restriction/base-change comparison. The cited field-base statements alone do not establish this generalization. For ECD Proposition 9.3 specifically, Proposition 7.23 already supplies flatness over the totally disconnected base; do not use arbitrary perfectoid quotients as counterexamples to that proposition.

### P0/gaps-17

**title.** Cohen presentations and regular finite-flat tower comparison theorems need suppliers

**neededBy.**

- PerfectoidSpaces:P7/regular-finite-flat-residue-tower

- PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower

**detail.** Česnavičius’s Lemmas 5.1–5.2 use the three Cohen presentations for complete regular local rings (Matsumura 29.3, 29.7 and the proofs of 29.1 and 29.8(ii)), and regularity/normality of power-series rings, the ramified quotients and the selected filtered colimits. Mathlib already defines IsRegularLocalRing and some regular-ring polynomial results at the pin; this existing predicate is credited, not planned anew. The Cohen presentations and these particular comparison theorems were not established by this review. Matsumura was not read; these citations are Česnavičius’s. Next action: identify the general commutative-algebra supplier and precise missing theorem interfaces, reusing the baseline definition. The reader must remove its obsolete absence claim and synchronize the stage-zero negative test.

### P8/gaps-1

**title.** Integral-algebra perfectoidization awaits the routed PerfectoidQuotients Part II

**neededBy.**

- PerfectoidSpaces:P8/integral-extension-of-perfectoid-pair

- PerfectoidSpaces:P8/finite-tower-over-perfectoid-tower

- PerfectoidSpaces:P8/good-towers-under-finite-maps

- PerfectoidSpaces:P8/quotient-of-good-tower

**detail.** Hansen–Johansson Lemma 5.10 needs, for a perfectoid R and an integral R⁺ → S⁺, the universal integral perfectoid S⁺-algebra S⁺_perfd (BS22 v4 Theorem 1.17(1), proved in Theorem 10.11 with the universal property from Corollary 8.14). PerfectoidQuotients Q4 owns only the semiperfectoid case (Theorem 7.4, Remark 7.5), which covers closed immersions but not finite maps. The paper extraction PAPER-BHATT-SCHOLZE-22 routes Theorem 10.11 to a Part II of PerfectoidQuotients (perfectoidization of integral algebras and almost purity along arbitrary ideals) that is not yet an atlas roadmap. When that roadmap exists, its node for Theorem 10.11 is the prerequisite of the integral-extension lemma. Confirmed finding RT-AREA-padic-1/1 called this Q5. The accepted paper route 3 named it PerfectoidQuotientsPartIIIntegralPerfectoidization, but the confirmed finding RT-PAPER-BHATT-SCHOLZE-22/5 retires that name: the queue generates one Part II per parent, PerfectoidQuotientsPartII ("Perfectoid quotients and their prismatic prerequisites, Part II"), designed by DESIGN-PerfectoidQuotientsPartII (issue #3362, not yet designed). Neither Q5 nor that roadmap is installed. Import its theorem once that roadmap exists; do not route the proof through P8, adic almost purity, or Q4 and create a cycle.

### P8/gaps-2

**title.** Descent of functions along towers over seminormal (non-smooth) rigid bases

**neededBy.**

- PerfectoidSpaces:P9/function-descent-seminormal-base

- PerfectoidSpaces:P9/weight-extension-sheaf-equalizer

**detail.** KL II Theorem 8.2.3 and proof, pp. 162–163, supplies O_Y ≅ ν_proet* Ô_Y for seminormal rigid spaces over arbitrary complete analytic fields of mixed characteristic. Its proof requires the restricted-toric comparison, perfectoid-field scalar descent and the seminormalization/birational comparison, which uses Temkin's desingularization of the reduced affinoid (KL II Remark 8.1.2) and rigid GAGA (Remark 8.1.4). The current PadicHodgeTheory P8:local-rational supplier gives the smooth discretely valued special case only. A Part II of that foundational direction is proposed below. P9 plans the application node and leaves this exact input as a gap; it does not reconstruct the foundational theorem.

### P8/gaps-3

**title.** Sheaf equalizer on nonproduct rational opens after smooth base change

**neededBy.**

- PerfectoidSpaces:P9/weight-extension-sheaf-equalizer

**detail.** BHW Lemma 3.7 states a sheaf equality on the whole smooth product. Product-affinoid equalities do not suffice because products are not a basis. Establish fixed-point compatibility on arbitrary rational affinoid subdomains (with mixed defining functions), or a general sousperfectoid ringed-site descent theorem implying it. R5 owns the product and coefficient sheaf, P9 owns this torsor comparison. The finite-group rational-localisation theorem is not a proof for an infinite Γ.

### P8/gaps-4

**title.** R5 infinite-pseudobasis globalization and coefficient base change

**neededBy.**

- PerfectoidSpaces:P9/finite-level-character-sheaf-comparison

- PerfectoidSpaces:P9/coefficient-change-by-regular-element

- PerfectoidSpaces:P9/derived-coefficient-change

**detail.** The current R5/coefficient-sheaf-kiehl node explicitly leaves CHJ Theorem 6.20’s existence assertion open for small coefficients with an infinite pseudobasis, because its proof uses the false Banach-density Lemma 6.19(2). Local finite-level Galois descent survives. Global Loc/acyclicity and the coefficient-flatness/quotient comparisons are imported only in the established range or as explicit hypotheses. The mixed tensor is a product/bounded-family construction; it cannot be replaced by a rational c₀ completion to prove flatness. These general coefficient inputs stay with R5, not a duplicate P9 Kiehl theory.

## Ownership notes and restructuring proposals

These are inherited obligations, not completed supplier work or applied restructuring. Stable request/gap numbers below are assembly references qualified by packet part.

### P0/restructure-1

**action.** rescope

**roadmaps.**

- PerfectoidSpaces

- AdicEtaleGeometry

**detail.** Two general commutative-algebra lemmas are planned twice: henselian pairs under filtered colimits (AdicEtaleGeometry:A4/henselian-pairs-filtered-colimit, part of PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions) and finite étale algebras over a filtered colimit of rings (AdicEtaleGeometry:A4/finite-etale-algebras-filtered-colimit = PerfectoidSpaces:P3/finite-etale-filtered-colimit-of-rings). P3 uses both inside almost purity, and A4 comes after P3 in the atlas.

**proposal.** PerfectoidSpaces P3 owns both lemmas; AdicEtaleGeometry A4 imports PerfectoidSpaces:P3/henselian-pairs-colimits-and-completions and PerfectoidSpaces:P3/finite-etale-filtered-colimit-of-rings and drops its two copies (a correction of the AdicEtaleGeometry packet by its author once this packet is on main).

### P0/restructure-2

**action.** rescope

**roadmaps.**

- PerfectoidSpaces

- DiamondsAndVStacks

**detail.** PerfectoidSpaces:P5/quasicompact-opens-in-limits-of-spectral-spaces (Stacks 0A2Y, 0A30: quasicompact opens of a cofiltered limit of spectral spaces come from a finite stage) is a statement about spectral spaces alone. It sits beside DiamondsAndVStacks:D0/cofiltered-limits-of-spectral-spaces, whose statement omits it, and AdicEtaleGeometry:A1/pro-etale-quasicompact-opens already attributes it to D0.

**proposal.** Move the lemma to DiamondsAndVStacks D0 as a part of D0/cofiltered-limits-of-spectral-spaces (or a new D0 lemma); P5 and AdicEtaleGeometry A1 then cite the D0 node.

### P0/restructure-3

**action.** rescope

**roadmaps.**

- PerfectoidSpaces

- DiamondsAndVStacks

**detail.** Several DiamondsAndVStacks nodes cite PerfectoidSpaces node ids of the earlier decomposition for statements that this packet splits into separate declarations: D6/spd-of-a-tate-pair cites P2/perfectoid-spaces-and-glued-tilting for the slice equivalence (now PerfectoidSpaces:P2/tilting-slice-equivalence); D4/diamond and D4/quotient-presentations-of-diamonds cite P2/fibre-products-of-perfectoid-spaces for absolute products X × Y (now PerfectoidSpaces:P2/products-in-perf); D1/pro-constructible-generalizing-subsets-are-affinoid, D1/w-localization and D6/spd-is-a-spatial-diamond cite the P5 limit node for |lim X_i| = lim |X_i| (now PerfectoidSpaces:P5/limit-underlying-space-homeomorphism). The kept nodes still name their successors, so no citation is broken.

**proposal.** When DiamondsAndVStacks is next revised, re-point these citations to the split nodes named here.

### P0/restructure-4

**action.** rescope

**roadmaps.**

- PerfectoidSpaces

- DiamondsAndVStacks

**detail.** ECD Proposition 4.4 (κ-smallness via covers, and stability under finite products) fails for singular κ, and the example κ(ω₁) built in ECD's proof of Lemma 4.1 is singular (source issue recorded in this packet). PerfectoidSpaces P6 states the corrected forms with uniformly κ-small perfectoid spaces. DiamondsAndVStacks:D2/cutoff-independence and the big sites of D2 quote ECD 4.4 as stated.

**proposal.** DiamondsAndVStacks D2 works with uniformly κ-small perfectoid spaces (PerfectoidSpaces:P6/uniformly-kappa-small-perfectoid-space) or with the affinoid basis, and cites P6's corrected cover criterion.

### P8/restructure-1

**kind.** note-stage-text

**title.** P8's stage text attributes the invariant affinoid-cover hypothesis to Hansen–Johansson §5

**detail.** The hypothesis is that of Hansen 2016 (Theorems 1.1, 1.3(i), 1.4). Hansen–Johansson §5.1 removes it: their Theorems 5.3 and 5.8 assume separation (resp. analytic separation) and that closures of rank-one points lie in affinoids, and show that the quotient then has an invariant affinoid cover. A future revision of the stage text could say 'Under Hansen's invariant affinoid-cover hypothesis, and under Hansen–Johansson's analytic separation hypothesis'. No change of structure is proposed.

### P8/restructure-2

**kind.** note-general-algebra

**title.** General valuation conjugacy and the finite-group descent dictionary

**detail.** The normal-algebraic valuation conjugacy lemma has no foundational owner and is planned here for its quotient consumer. Finite-group module descent is now a comparison to the pinned comonadicExtendScalars theorem and R3 finite-projective descent; no general faithfully flat descent theory is replanned.

### P8/restructure-3

**kind.** note-owner

**title.** Rigid finite quotients are planned in P8

**detail.** Finite quotients of rigid spaces (Hansen Theorems 1.3 and 3.4, CHJ §6.4, HJ Theorem 5.3) are used at finite level by the good-tower quotient theorem and have no other owner, so P8 plans them alongside the perfectoid quotients.

### P8/restructure-4

**action.** rescope

**roadmaps.**

- PadicHodgeTheory

- PerfectoidSpaces

**detail.** The smooth discretely valued pro-étale structure comparison does not supply KL II Theorem 8.2.3 for general seminormal rigid bases.

**proposal.** A Part II of PadicHodgeTheory’s local pro-étale structural direction should own the general Ax–Sen–Tate/seminormal comparison and its prerequisites; P9 imports it for function descent. This proposal creates no stage or prerequisite ID.
