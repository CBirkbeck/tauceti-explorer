# BP-KTheoryLowDegrees--U.1 — Bounded pass through the next-rank normalizer

Codex — codex-KB3j6C. Refs #764. The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/764#issuecomment-5999624590) was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/764#issuecomment-5999627409). This is a **complete bounded planning pass**, not a checkpoint. PROTOCOL §0 requires a pass to finish at about 300 nodes, retain precise open-stage coverage, and go to independent review. The packet now has exactly 300 nodes. Four stages remain partial; none is closed. Every implementationStatus remains unchecked. No formal proof or independent review is claimed. Only the four issue deliverables were changed, on the session branch; no second job was claimed.

## Delivered and preserved

Nineteen U.4 declarations continue BMS §9 through Lemma 9.6: one definition, four constructions and fourteen lemmas. They add fifteen API entries and fifteen typed tests. All 281 inherited node objects and all 475 inherited baseline records are unchanged. The eight supplier requests, restructuring proposals, resolved requests, signed Bhatt–Scholze source inventory and 44 planets are unchanged. Four native Mathlib baseline records were added. The ten inherited source findings are unchanged; E111 records the generator-parameter misprint and E112 records the known published Appendix A.23 correction. The preceding continuation audit is preserved under previousContinuationAudits.

The new contracts are:

- multiplierSubgroup is H={g | f(gx)=f(g)f(x) for every x}, for a function normalized at 1. Its restriction is a homomorphism; H is the full group exactly when the original function is multiplicative. The squaring function on the three-letter permutation group is a concrete non-example.
- conjugationStabilizer is the ambient subgroup N preserving every value of the actual relative function under conjugation. It is the adapter of the native action stabilizer, not the normalizer of an identity fibre. The faithful function at I=A has stabilizer equal to the centre, although its kernel normalizer is all GL. Native normalizers express N normalizing the included H.
- GE is the native join of the existing elementary subgroup and the closure of diagonal unit matrices. It includes arbitrary determinants; diag(−1,1) over ℤ distinguishes it from E.
- Type L lies in H by the inherited two-sided covariance. Under stable range n+1 and rank n+2≥3, an E-normalized relative subgroup containing all type-L matrices is the whole congruence group. Corollary 9.3 supplies product preservation, relative elementary kernel and GE commutator kernel **conditionally on GE⊆N**.
- Diagonal conjugators and diag(1,v,1), v∈GE_n, preserve the value. The two outer upper roots have arbitrary ring parameters t. Conjugating the middle e_last,0(s) by e₀₁(t) gives a right correction e_last,1(−st); the last upper root instead gives a left correction e_penultimate,0(ts). The coefficients are in I because s∈I. These generators give the actual upper three-block subgroup of Lemma 9.4.
- transposeImage is an anti-involution on the native image of κ, represented as a multiplicative equivalence to its opposite group. It does not assert that the arbitrary target C carries transpose. Kernel stability supplies preimage independence.
- reflectedTranspose swaps only the first and last coordinates around matrix transpose, fixing the interior coordinates. It is an anti-involution preserving the relative subgroup. It exchanges type L/R with forward/inverse cyclic corner conjugators and the corresponding cyclic row/column order. The middle root is fixed.
- The next-rank value lies in im(κ); reflection acts on it by the image anti-involution and reverses the corner order. This proves reflected stability of N. Lemma 9.6 then generates GE from the upper-block matrices, reflected roots and the **last-two-coordinate swap P**, whose membership in N remains an explicit premise. Endpoint reflection and P are different matrices.

The next-rank value is still a function. No homomorphic extension was bundled before the missing swap calculation. All new evaluation signatures retain ExtensionConditions, stable range, n≥1 and uniform transitivity over every ideal. No target commutativity or unrestricted rank-two elementary normality is asserted.

## Follow-ups after independent review

The packet is complete under the node-budget rule. Independent review can assign the open stages to follow-up packets and an assembly job; it should not reopen this as another unbounded checkpoint. Current coverage:

| Stage | Coverage | Remaining boundary |
| --- | --- | --- |
| Z.1 | source_decomposed | No remaining target in RS-18’s narrowed scope; existing categorical K₀ reused. |
| Z.2 | source_decomposed | No remaining target in this scoped inventory; native stalk rank reused. |
| U.1 | source_decomposed | No remaining target in this scoped inventory. |
| U.2 | source_decomposed | No remaining target in this scoped inventory. |
| U.3 | partial | LieGroups SL-to-SO retraction for the real-circle obstruction. |
| U.4 | partial | BMS §10 swap proofs, §11 relative universality/arithmetic defect, power-symbol suppliers, completions, Serre SL₂ and CG interface. |
| U.5 | partial | Classical relative K₁ versus homotopy-fibre K₁, including its preceding K₂ term and supplier cycle. |
| U.6 | partial | Relative homotopy comparison, plus-construction proof boundary and coherent determinant-loop supplier interfaces. |

The finite relative-universality gap now starts at **BMS §10, printed p.115**. Read Lemma 10.2 and the calculations that follow before adding nodes. Keep its two cases separate:

1. Proposition 8.6’s higher-rank induction has stronger stable-range/transitivity hypotheses in the smaller corner. Lemma 10.2’s two-sided reduction produces the special row pattern used by the explicit swap calculation. State all its indices and corner placement.
2. Proposition 8.5’s Dedekind rank-two extension uses Kubota Proposition 8.5’s own hypotheses. Its proof arranges a nonzero corner, uses semilocal reduction modulo that entry to choose a coprime pair, performs the relative Bézout completion, and evaluates Mennicke-symbol cancellations. Do not derive rank two by imposing Proposition 8.6’s stronger corner stable-range hypothesis.

Once P∈N is proved, combine the existing conditional Corollary 9.3, bundle the homomorphism whose function is exactly extendedValue, inherit the remaining transpose/Related kernel conditions, and iterate the genuine extension. Then decompose §11’s finite-rank relative universality in Theorem 4.1(c). Corollary 4.3 still needs r(I), transition maps and compatible roots-of-unity normalization. Stable absolute SK₁=0 and the abstract universal Mennicke group are insufficient substitutes.

Before identifying the arithmetic completion from elementary cofinality, establish finite index of every nonzero elementary level. Then decompose the completion maps, central kernel and BMS Theorem 14.1, importing generic profinite limits/topology from their owners. The finite-index containment lemmas already inherited here are not a proof of those completion statements.

All eight gaps remain:

- U.3’s precise continuous SL-to-SO retraction; its algebraic chart/Dedekind and stabilized Spin calculations are already decomposed.
- BMS tame formula A.16, product formula A.19 and power reciprocity A.21: the CA.1 → K2SymbolsBrauer T.7 cycle and transpose orientation still require the recorded restructuring. Do not add a cyclic supplier dependency.
- Higher unit-group Hilbert formulas A.17–A.18: source and fully decompose Serre, Corps locaux XIV for the totally imaginary case.
- Classical relative K₁ versus homotopy-fibre π₁: include K₂ before K₁; retain the K2SymbolsBrauer T.1:plus/T.6 and GeneralAlgebraicKTheory dependency boundary.
- Finite relative Mennicke universality and the arithmetic congruence defect, now beginning at §10 as above.
- Arithmetic/congruence completions and the central kernel.
- Serre’s SL₂ congruence-kernel theorem: r₁+r₂+|S|≥2 in this packet’s finite-place convention. A CM quartic meets the hypothesis; an imaginary quadratic field with S empty does not. His SL₂-normal relative elementary closure is not automatically U.5’s E₂-normal closure. The §2 proof and Moore classification remain to be decomposed.
- The CG localized H¹/Hecke interface: Remark 9.3’s CSP cases are GL₂ over a CM quartic and GL₃ over ℚ. Supply the SL-to-GL lattice and Hecke/Eisenstein arguments. A finite central kernel does not force every mod-p character to be congruence when p divides its order; preserve the coefficient condition or prove its localized contribution Eisenstein. The general cohomology infrastructure belongs to the consumer.

All eight explicit requests remain **open supplier contracts**, unchanged:

| Supplier | Needed input |
| --- | --- |
| ClassFieldTheory layer 5 | Degree-m local Hilbert pairing with the packet’s orientation and specified laws. |
| ClassFieldTheory layer 12 | Ray-class Artin factorization, splitting law and surjectivity. |
| ClassFieldTheory layer 13 | Ray class field and its Artin-normalized Galois identification. |
| Chebotarev layer 10 | Infinitely many unramified primes with prescribed abelian Frobenius. |
| Chebotarev layer 4 | Arithmetic cyclotomic Frobenius ζ↦ζ raised to the prime norm. |
| GlobalNumberFields layer 7 | Ray-subgroup cofinality and ray-class dictionary. |
| GlobalNumberFields layer 6 | Idèle norm and compactness of the norm-one class subgroup. |
| LieGroups layer 9 | Continuous retraction SL_N(ℝ)→SO_N for every N≥2, with coordinates and base-point compatibility. |

The other imported plus/spectra/determinant contracts retain their existing owners and the precise U.6 remaining list. The 21-item BS determinant inventory remains unchanged: signed graded braiding is retained, and forgetting grading is not assumed symmetric monoidal. U.3 supplies the stable determinant/semilocal comparison to companion Z.3 and must not depend on that consumer. The companion’s needs_changes review was neither accepted nor re-reviewed here.

Accepted RS-18 ownership and the inherited confirmed red-team fixes remain intact: /9 assigns U.6’s K₁, companion Z.6’s K₀ and K2SymbolsBrauer T.5’s degree-two calculations once, with N.6 owning certificates; /24 has the existing S-unit theorem and chosen fundamental S-units with rank r₁+r₂+|S|−1; /25 retains the precise CFT/Chebotarev/number-field inputs and the separately recorded reciprocity cycle. No atlas edges or other owners’ files were changed.

## Sources and pinned library evidence

Fresh reads on 5 October 2026: [BMS’s published scan](https://www.numdam.org/item/10.1007/BF02684586.pdf), §§8–10 pp.107–119, with pp.113–114 inspected as images; the original Appendix A.23 statement/proof pp.90–91 were also inspected as images against [Serre’s published 1974 erratum](https://www.numdam.org/item/10.1007/BF02685884.pdf), read in full, pp.241–244. Hashes:

- BMS: b455790cdaeba5e3a313f1bd4dddfe2892e8a2035067bcdef434ef717edfb996.
- Serre erratum: 2f52d05a0f1ff1563d9da85efd8b224d1e110d9f67c940f3d9c0bbd2051184f9.

E111 is the published Lemma 9.4 generator sentence’s ideal parameter, corrected to arbitrary A; the proof itself already uses the correct parameter. Its known-correction search included the published erratum and primary publication records. E112 is **known**, not a discovery: Serre’s Theorem 1 disproves A.23(b)’s numerical exponent formula and restores A.23(c) by transfer. The norm-defined exponent is not determined by extension degree and root orders alone. No current node uses the false numerical formula. The ten older source findings were preserved; their entire source evidence was not freshly reverified in this run.

Binding worker/blueprint/expansion/upstream instructions, the whole issue before and after claim, the previous handoff, accepted RS-18 scope, the eight reviewed AUDIT-29 rows, roadmap/stage descriptions and touching links were read. GrothendieckEulerForms and Chebotarev supplied upstream-style readings. No existing Tau Ceti roadmap was replanned.

Pins: Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The four additions are finRotate, Matrix.transpose_permMatrix, Subgroup.normalizer and MulAction.stabilizer. Each native statement and surrounding proof was read, and file bytes matched its pinned Git blob. Modules, line ranges and blobs are in continuationAudit. Pinned Tau Ceti and the relevant pinned Mathlib group/matrix sources have no Mennicke next-rank normalizer argument; generic native subgroup, action and matrix infrastructure is reused. This does not claim the entire inherited baseline was freshly audited.

## Checks and reproduction

Totals: **300 nodes** — 22 definitions, 48 constructions, 147 lemmas, 64 theorems, nine comparisons and ten applications; **502 raw API entries, 287 packet tests, 297 typed examples, 44 planets, 479 baseline records, twelve source findings, eight gaps and eight requests**. The checker counts 498 API entries and 279 tests on definitions/constructions. Internal graph: 883 edges, 1656 total prerequisites, no cycle.

The explicit-index packet check passes with zero errors and warnings: run scripts/check_blueprint.py on this packet with the existing baseline declarations.tsv passed through --index. Exact inherited-node/baseline preservation, unchanged request/restructure/routing inventories, reader statement/proof/API/test parity, new Lean names, native-pin bytes, allowed paths and git diff --check pass.

The **full suggested file did not elaborate**. lean-check fails at import loading because the shared build lacks the object for TauCeti.CategoryTheory.Exact.Functor. No build was attempted. A separate lean-check harness using exact inherited carriers and the exact continuation sections elaborates with autoImplicit disabled and **only expected proof-placeholder warnings**. It checks all nineteen new node declarations, fifteen API names and fifteen new typed examples. Fully qualified name checks confirm that evaluation theorems retain ExtensionConditions and that the final GE inclusion retains the last-swap premise. These are signature checks, not formal proofs or full-file compilation.

To reproduce the fragment without that unavailable Tau Ceti import:

1. Extract the exact definitions glReindex, diagUnit, permGL, glMap, elementary, elementarySubgroup, stabiliseMatrix, stabiliseMonoidHom, stabilise, HasStableRange, dedekind_stable_range_two, congruenceSubgroup, relElementary, relElementary_eq_commutator, W, Move, QEquiv, W_mono, MennickeSymbol, comp and restrict, retaining their namespaces and variables. No carrier is replaced and no axiom is added.
2. Append the entire “Kubota continuation”, “Relative standard forms and the next-rank value”, and “The multiplier subgroup and the conjugation stabilizer” sections from the suggested file exactly once.
3. Use the individual pinned Mathlib imports LinearAlgebra.Matrix.GeneralLinearGroup.Defs, LinearAlgebra.Matrix.SpecialLinearGroup, RingTheory.DedekindDomain.Basic, RingTheory.Spectrum.Maximal.Defs, Algebra.Group.Subgroup.Lattice, GroupTheory.Commutator.Basic, LinearAlgebra.Matrix.Transvection, LinearAlgebra.Matrix.Permutation, Logic.Equiv.Fin.Rotate and Tactic. Open the Matrix and commutatorElement scopes; declare universes u/v/w, a noncomputable section and autoImplicit false. Add fully qualified name checks for the new node/API names from the packet.
4. Run lean-check on the ordinary scratch file in the existing shared build. This uses no new Lake project or library build.

Independent arithmetic checks use the actual coordinate formulas over ℤ/m, 2≤m≤13, in ranks three through six: 3,272 first-root corrections, 3,272 last-root corrections and 3,272 fixed middle roots; 2,880 each of left/right cyclic reflection, reflected involution and reversed products. The cycle permutation matrix has a 1 at (i,i+1 mod m); reflection swaps only endpoint indices. An exhaustive three-letter permutation screen gives the squaring function’s multiplier subgroup size one. Closure of the rank-three F₂ upper-root, last-swap and reflected generators has size 168. These check polynomial and finite-group formulas, not Lean proofs. The earlier continuation audits retain their older numerical evidence separately.

Before each sequential lean-check there were 94–96 GB available. No library build, cache download, repository copy or language server was started, and no compile remains running. Scratch papers, images, scripts and logs are deleted after the pull request opens; all information needed by a follow-up is retained here and in the packet.
