# BP-AutomorphicFormsOnReductiveGroups~2

Issue #6923. Worker: Codex, session `codex-OGlhV1`. Branch: `codex-OGlhV1-automorphic-forms-revision`. This is the completed target-level revision, submitted for independent review. No stage is mathematically closed and no implementation is claimed.

## Result and preserved material

The packet has status `complete`: AF.0, AF.1, AF.1a, AF.2, AF.3, AF.4 and AF.5 are all `planned`, with precise remaining obligations. It contains 100 nodes: 26 definitions, 25 constructions and 49 theorems; 306 API items, 207 specified tests, 30 planets, 56 checked baseline declarations, 34 sources, 43 supplier requests and 22 gaps. All ninety original node identifiers, the independent `review` object and `reviewHistory` are preserved. Every implementation status remains `unchecked`. The old review is history for the next independent reviewer to replace, not a new acceptance by this worker.

The reader is rewritten around the targets and their dependencies. It contains every node statement, hypotheses, proof route, uses, API contract, discriminating test, acceptance condition and source locator. It also contains the exact supplier requests, gap register, reading provenance and four structure proposals. Its convention and status claims now agree with the packet and the native suggested file.

Ten added nodes supply the full characteristic-zero absolute Lie complex, Kostant consumer interface, finite-corner tensor factorization, archimedean Hecke algebra, normalized real induction, central translation finiteness, fixed-central-character algebraic modular forms, local p-adic stable lattices, GL₂ algebraic weight model and cohomology with a supplied coefficient. The last three have distinct names and do not impersonate the stronger global/classified constructions.

## Mathematical changes in this round

The independent review's accepted corrections and the six required red-team findings 2, 25, 26, 29, 30 and 31 are retained and synchronized with the reader. In particular:

- The real norm needs closed image in End(E), or inverse-dual/inverse-determinant enlargement. Haar smoothing uses normalized submultiplicative inversion-invariant height, inverse-power integrability and both left/right Schwartz derivatives. Positive archimedean dimension is required for the absence of a convolution unit.
- Compatible pairs and modules now use the actual compact derivative, Lie inclusion, smooth finite-dimensional orbit spans and adjoint covariance. AF.1a remains the sole cochain owner. The noncompact Hodge stabilizer needs its split-central quotient before the compact-pair interface applies.
- SF realizations are closed countable products of complete Banach spaces, with joint continuity, smooth orbit maps and polynomial seminorm growth. Matrix coefficients are defined on an actual central Haar quotient in a supplied realization, before canonical globalization. Normalized induction has actual smooth covariance and a conditional compact picture.
- Automorphic forms retain all five carrier conditions. Subquotient occurrence and compatible isomorphism classes are native; multiplicity uses an extended natural number so infinite Hom dimension is not silently replaced by zero. Fixed-type finiteness and finite multiplicity remain arithmetic theorems.
- Restricted tensors are linear direct limits containing sums of pure tensors, and idempotent stabilization gives a nonunital ring. The corner proof generates an invariant subspace under the full algebra instead of assuming invariant complements. The archimedean distribution/balanced enveloping carrier has actual convolution, support and finite K-type equations.
- Constant terms integrate over the left arithmetic unipotent quotient, with supplied invariant probability measure. Conjugation and nested fibre/Fubini transport have explicit measure hypotheses. Cuspidal kernels retain a complete supplied proper-parabolic family; the actual arithmetic identification and Hilbert spectrum remain supplier inputs.
- Maass conventions use the positive hyperbolic Laplacian, dx dy/y², normalized divisor Hecke action, the factor 2√y in the real-parameter Bessel expansion, parity and the distinction between a(1)=1 and unit L² norm. DIT's five eigenvalues remain numerical data; the imaginary parameter branch and PGL₂ adelization remain gaps.
- Algebraic highest weights need the integral character/isogeny constraint and group-level integration; semisimple Lie highest weights alone do not supply them. Wigner uses the contragredient coefficient. Absolute ranks define ℓ₀; q₀ integrality is separate. Original arithmetic rank examples are omitted under their original names, with distinct native numerical formula tests.
- GSp₄ distinguishes split-torus ℤ³ from compact-Cartan parity, both rho coordinates, coefficient/parameter transport and compact versus noncompact walls. The Siegel Levi longest element is separated from the full Weyl longest element. E8's rejected uniqueness objection remains rejected. E10's published Harris correction prevents unsupported full-disconnected-group degree vanishing.
- Torsion systems contain a nonzero class and a separately specified eigenvalue character. Semilinear reduction requires nonzero image; finite residue fields give maximal kernels without a surjectivity assumption. Betti/lattice specialization comes from ALS and no universal characteristic-zero lift is asserted.
- Algebraic modular forms have both rational and level coefficient conventions, exact-support weighted Hecke representatives, full stabilizers, trace and canonical tensor base change. Trivial scalar forms use the pinned DoubleCoset quotient. The positive-unit-rank central-character branch uses effective stabilizers and a separately requested central-quotient finiteness theorem.

## Native signatures and validation

The final name audit finds 515 named Lean declarations and 102 labeled examples. It finds 43 of 100 packet main names, 197 of 306 API name occurrences and 102 of 207 test name occurrences. These are name counts, subject to every node's `nativePrototypeScope`, not proof counts or full-target implementation claims.

Every absent main/API/example name has a per-node `suggestedOmissions` record naming the missing native input, its owner and the full required mathematical signature. There are 256 unique-per-node omitted names across 82 nodes; main names repeated as API names are deduplicated within a node. No matching comment or weaker helper counts as the original target. The reader explains partial present contracts: the long exact sequence does not state Ext/cup products, the CE bridge currently compares degree one, chamber predicates do not construct discrete series, and the finite-corner result does not supply the global nonunital module equivalence.

Checks completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`: zero errors and zero warnings; all seven stages planned, zero closed. JSON validity, references, the internal acyclic graph, API/test minima, planets and coverage pass.
- `lean-check research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`: exit zero, no errors, and only the expected proof-placeholder warnings. The full final file was compiled, including the new p-adic continuity counterexample, logarithmic GL₁ growth test and canonical scalar double-coset equivalence. Available memory exceeded 20 GB. No build, cache fetch, language server or private Lake project was started.
- The suggested file uses the shared Mathlib commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti source statements were read at `f790474821cf4256814db967cb154e7af3d0c369`; the shared build does not provide those pinned modules, so the Tau Ceti module comparisons were not compiled. The native test file imports individual Mathlib modules.
- The original-node, independent-review/history and unchecked-status preservation checks pass. The reader contains all 100 nodes, 306 API items and 207 specified tests and agrees with the omission/scope inventory. Deliverable/private-path intake and whitespace checks pass.

Elaboration checks signatures and hypotheses only. The packet and reader contain mathematical prose, with no Lean code or implementation claims.

## Sources and findings

The cleared Corvallis volume was read in place: Borel–Jacquet §§1.1–1.8, 2.1–2.2 and 3.1–4.8, pp.189–198; Flath pp.179–183, including the algebraic corner proofs and the distinct Hilbert formulation. No cleared file or passage was copied or extracted anywhere. Borel–Jacquet referrals to the original Harish-Chandra reconstruction/finiteness/rapid-decay proofs do not close those proof gaps.

This run also read the exact target portions of public Kostant (pp.333–337, 341, 346–347 and 348–364, including Theorems 4.4 and 5.14), Bernstein–Krötz (§4, pp.21–23; §9.3, pp.39–40, Proposition 9.6 proof), Getz 2015 (§§6–8, pp.29–40), Wockel (§3, pp.11–14), BCGP25 (§5.7.2, pp.130–132), DIT (§5, pp.961–963), CG18 (§8.4, p.80), CG20 (preprint §§2.0.1–2.0.2, pp.6–9; §5.3, pp.21–23), the CGH standalone appendix (§3.1, pp.4–5) and Harder–Raghuram (§§2.3.1–2.3.4, pp.13–15; §§3.1.4–3.1.5, pp.17–19; §§4.2.1–4.2.3, pp.25–27). Exact versions, hashes and locators are in the packet and reader. Earlier independent-review readings, including Knapp and the Harris/Goldring–Koskivirta correction, remain explicitly attributed to those reviews rather than this run.

E1–E10 preserve nine confirmed findings and E8's rejection. E11–E15 are new and unreviewed: Getz's real norm properness, linear restricted-tensor carrier, corner complement argument, missing irreducibility in the converse factorization, and CG20's Levi/full longest-element label. The primary published CG20 PDF fetch failed; E15 is scoped to the read preprint and makes no claim of having read that published PDF.

## What must happen for closure

The reader's 22 gaps and 43 exact requests are the durable worklist; no scratch file is needed to resume. Each stage's coverage record contains its concrete refinements:

| Stage | Required closure work |
|---|---|
| AF.0 | Prove strict LF/completeness/joint continuity and smoothing/Fubini identities; obtain actual arithmetic height, inverse-power Haar integrability, local restricted-Hecke tensor and rational-parabolic adapters. |
| AF.1a | Obtain manifold de Rham and embedded maximal-compact/component geometry; construct van Est and the relative PBW/Koszul resolution, cup/restriction and central-balanced Hodge comparison; complete compatible Levi action and characteristic-zero descent. |
| AF.1 | Import native algebraic real points/reductive Cartan/parabolic/classification data; refine original Casselman, discrete-series, Langlands, Dixmier–Malliavin and Vogan proofs; finish Bernstein–Krötz goodness/globalization and integrated GL₂/O₂ comparisons. |
| AF.2 | Refine Harish-Chandra reconstruction and fixed-type finiteness; complete finite-level arithmetic dictionaries, central translation finiteness, finite multiplicity, archimedean PBW and restricted nonunital factorization/Satake exports. |
| AF.3 | Obtain actual rational parabolic quotient/probability/fibre data; prove arithmetic rapid decay and the AS central-character L²/discrete spectrum interfaces; finish SL₂ Fourier/generation and Maass adelization/imaginary branch. |
| AF.4 | Obtain group-level algebraic weight integration, global coefficient lattices and coherent Hodge/component/central data; read the remaining original cohomological/classification/rationality proofs; discharge ALS/AS Betti/Hecke and finite-part rational-model requests. |
| AF.5 | Finish genuine GL₁/GL₂ component, slash/diamond, normalized Hecke and conductor dictionaries; prove ordinary and central-quotient class/stabilizer finiteness, compact-infinity automorphic comparison and actual Weil-restriction/product transport. |

Integrate the recorded prefixes without creating a second owner: AF.1a supplies cochains; the single AF.1b real-representation proposal contains Casselman embedding/classification/globalization; AA.3 supplies height comparisons to AF; an early AF.4 local-weight prefix precedes ALS/AS comparison, while rationality/torsion applications follow it. The packet's internal graph passes, but external stage cycles are not declared resolved before these proposals and native supplier exports are integrated.

This revision is ready for its independent review. The follow-up starts from these exact mathematical/source/signature obligations, retaining the reviewed identifiers and rejected-finding history. No second job was claimed.
