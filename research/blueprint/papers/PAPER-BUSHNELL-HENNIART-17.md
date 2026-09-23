# Bushnell–Henniart (2017): extraction and routing

Status: **partial**. Codex, session codex-a71f92, continuing codex-c83e7a’s checkpoint in PR #2001 for issue #1153. All 140 inherited item IDs and all seventeen unreviewed source findings are preserved. This continuation adds five items: two exact pinned-library credits and three reusable local lattice-measure helpers. The result has 145 items (6 library, 10 planned, 129 missing), 350 internal dependency edges, 42 definitions/constructions with 126 API entries, 144 structured tests, six routes and nine open proof frontiers. Nothing is claimed formalized or compiled.

## What the paper proves

The paper compares two ultrametrics: A measures the first normalized simple-character intertwining depth, while Δ measures upper-ramification agreement of wild-inertia constituent orbits. Its two profiles satisfy Φ_Θ(A(Θ,Υ))=Σ_{LΘ}(Δ(LΘ,LΥ)) by equality of pair Swan conductors under classical local Langlands. The range-correct inverse Ψ_Θ=Φ_Θ^−1∘Σ_{LΘ} then transports both strict and weak inequalities. The interpolation theorem recovers Ψ from distances to character twists after tame extension. All statements and proof dependencies are itemized below.

## Continuation: the lattice-volume proof

The [published article, §4.1, pp.932–933](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n3-p05-p.pdf) defines C(β) from an exact lattice complex and leaves the minimal-parameter arithmetic to a short calculation. This continuation supplies independent conditional proofs, without crediting the unread BHK98 or BK93 proofs.

For fixed exact F-linear maps 0→U→V→V→U→0 and exact full lattice subcomplexes L,L′, choose one uniformizer power t so M_i=π^tL_i lies in both L_i and L′_i for all i. Scaling the whole complex preserves exactness. The finite quotient complexes L/M and L′/M are exact: a quotient cycle lifts to x with dx in M; exactness of M supplies a preimage m, after which x−m is a cycle in L and thus an image. This also treats the left endpoint using injectivity; surjectivity at the right descends.

Write Q=L/M and B=im(Q1→Q2). Length additivity for the two short exact sequences gives ℓ(Q0)+ℓ(Q2)=ℓ(Q1)+ℓ(Q3). Over O_F each simple finite module is the residue field: a nonzero element supplies a cyclic presentation with maximal kernel. Hence |Q|=q^ℓ(Q), by a composition series and finite fibers. Coset additivity gives μ(L_i)=[L_i:M_i]μ(M_i). The alternating cardinalities cancel, proving C(L)=C(M)=C(L′). Same-space lattice ratios are powers of q, so C=q^c for a unique integer c. Each Haar measure occurs once upstairs and downstairs, so positive rescalings cancel.

Termwise intersection is an unsafe shortcut. In the exact complex with maps x↦(x,0), (x,y)↦(y,0), (x,y)↦y, use standard lattices and a second complex differing only at position 1 by O_F(1,0)+O_F(π^−1,1). The intersection at that position maps to πO_F×{0}, whereas the next kernel is O_F×{0}. Both original complexes are exact, but their intersection is not.

The maps must stay fixed. For U=V=F and maps (identity, zero, λ·identity), lattices (O_F,O_F,O_F,λO_F) give C=|λ|_F^−1. Thus arbitrary nonunit rescaling of corestriction is not licensed by lattice-choice independence. The admissible BK normalization, its independence, and existence of the exact integral lattice sequence remain G3/G4.

Conditional on BK93 (1.4.15), let d=[E:F]=ef and m=−v_E(β)>0. The E-pure order a is a left O_E-lattice of rank d in End_F(E), while O_E has rank one. Their dilation ratios are q_F^(mfd) and q_F^(mf). Their quotient gives c(β)=mf(d−1)=mf(ef−1), including c=0 for E=F. This proves the arithmetic, not BK exactness or the adjacent-profile intercept transition.

## Ownership and baseline

The three reusable helpers are source additions to AutomorphicLFunctionsAndLocalFactors:AL.0, the existing local Haar/Fourier normalization owner. They consume LocalFieldsRamification Layer 0’s existing local-field/DVR carrier and the pinned algebraic length/index infrastructure. They concern measure of compact open subsets, not discrete real covolume (GN.0) or adelic quotient volume (AA.0). The corestriction construction and simple-character application stay in SmoothRepresentationsPartII. No new generic local-fields roadmap is proposed.

The complete current Fintzen Part II brief was re-read: its general-group tame splitting and p∤|W| restrictions remain untouched. BH17 adds a separately scoped all-p GL_n branch. The separate complex Weil-profile branch remains independent of LLC; Δ-density and its LLC application stay after comparison to avoid a construction cycle.

- [tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Basic.lean#L325): For a field k, group G, normal subgroup N, and finite-dimensional irreducible k-representation V of G, Res_N V is semisimple. No finiteness of G and no Maschke characteristic condition is needed. Actual declaration statement and its namespace/hypotheses read at the pinned checkout; no compilation performed. Re-read the actual statement in continuation codex-a71f92.

- [tauceti:TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Orbit/Basic.lean#L137): Under the preceding hypotheses there is a minimal nonzero N-subrepresentation S, and every minimal N-subrepresentation is isomorphic to a G-conjugate of S. Actual declaration statement and its namespace/hypotheses read at the pinned checkout; no compilation performed. Re-read the actual statement in continuation codex-a71f92.

- [tauceti:TauCeti.Representation.exists_forall_finrank_linearMap_eq](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Multiplicity.lean#L423): Under the same hypotheses there is e>0 such that dim_k Hom_N(S,Res_N V)=e for every minimal constituent S. Over C, Schur identifies this with the ordinary multiplicity. Actual declaration statement and its namespace/hypotheses read at the pinned checkout; no compilation performed. Re-read the actual statement in continuation codex-a71f92.

- [tauceti:FDRep.clifford_restrict_finrank](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Induction/Clifford/Dimension.lean#L67): For algebraically closed k, arbitrary G, normal N, and simple W in FDRep k G, there are a simple V in FDRep k N, finite G/inertia(V), and e≠0 with Res_N W ≅ V.cliffordSum e and dim W=e [G:inertia(V)] dim V. Actual declaration statement and its namespace/hypotheses read at the pinned checkout; no compilation performed. Re-read the actual statement in continuation codex-a71f92.

- [mathlib:Module.length_eq_add_of_exact](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean#L170): Additivity of ℕ∞-valued module length for injective/surjective exact R-linear maps over an arbitrary ring. Actual statement and ring/module hypotheses read in codex-a71f92, including finite-length and composition-series APIs at lines 29–185. Not compiled.

- [mathlib:AddSubgroup.relIndex_mul_relIndex](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Index.lean#L127): Relative additive index multiplicativity for H≤K≤L; generated by to_additive. Infinite indices are zero, not usable as positive measure denominators. Read actual multiplicative theorem, explicit to_additive annotation, and index definitions in codex-a71f92. Not compiled.

The continuation read AL.0/AL.3 and AA.0 contracts/audits, SR.0/SR.2 contracts, the complete LocalFieldsRamification Layer 0 contract and reviewed audit, the four inherited Clifford declaration statements, and the two new algebraic imports at the pinned commits. Targeted whole-portfolio searches found no exact local lattice-volume helper; Euclidean covolume hits are near misses. This is a bounded audit, not a claim to have inspected all related declarations.

## Conventions and retained proof boundaries

F may have either characteristic, always with finite residue field. Representations are smooth and complex; an ℓ-adic carrier is not silently identified with them. Parameter fields F[β] are not assumed separable. Agreement on R_F(ε) means Δ<ε, while agreement on R_F^+(ε) means Δ≤ε. The truncation integer is ceil(e_a ε)−1. Φ inverse has domain [Φ(0),∞), and its composition is constructed only after Σ(0)=Φ(0). Ψ need not be convex. Total wildness means irreducibility on P_F, not a singleton constituent orbit.

The earlier occurrence proof uses finite quotient induction and Frobenius reciprocity. Its finite-quotient and smooth adapters remain G1. The Weil pair-conductor proof integrates the normalized Hom step function and remains conditional on G2. Relative index-p induction retains the specified normal subgroup. The corrected perturbation uses k<m, avoiding the Q2 top-depth obstruction. Scalar twisting uses the actual level −v_a(β+c), not an unconditional maximum; equal-depth cancellation is possible.

The four-dimensional conditional Ψ has pieces x/4, 4x−5/4, 2x−1/2, x with joins 1/3,3/8,1/2. The eight-dimensional conditional Ψ has pieces x/8,8x−21/8,x with joins 1/3,3/8. These calculations do not prove representation existence. In particular, residue F4 has only one nonzero cube class, so μ3 alone cannot guarantee the printed determinant choices. G9 also retains the unverified scalar-image normalization in the extra-special assertion; no new counterexample to that assertion is claimed.

## Read and acquisition ledger

The current worker independently read all 37 published pages (all 1789 extracted lines, including proofs and bibliography) on 2026-09-23. Primary SHA-256: `c93282637d325e422442e8c1a5721d0d13a742d392b8e78c77e2e6ddd2dc0c31`. The former worker’s selected page-image/arXiv checks are retained as their provenance, not repeated here. Their BH96 and BH14 readings were selective; neither was re-read in this continuation. The original 476-input manifest remains under inputs at its original commit; continuationInputs separately hashes fourteen targeted current inputs at `0fb51acb7bff97a8770bb6031922ea0e6e0cb90f`.

- Earlier checkpoint: [BH17 arXiv v2, 2016-07-14](https://arxiv.org/pdf/1510.01528v2). Targeted §4.3 ratio (p.17), §4.6 derivative (p.21), §5.3 endpoint (p.23), §7.4 twist (p.31), §7.6 comparison (p.33). Not a full reading. SHA-256 `b6ca0db717df5040d83abe647c935e7002d5d56c35e493b26ae84e14c6b189db`.

- Earlier checkpoint: [Local tame lifting I, IHÉS 83 (1996), 105–233](https://www.numdam.org/item/PMIHES_1996__83__105_0.pdf). Printed pp.111–114: lattice-chain/stratum setup, relative periods and critical exponent; p.112 checked visually. Selected printed pp.142–146,151–153,156–157,160,163: H-groups, minimal-character clauses, transfer, endo-equivalence and tame-lifting statements. References to BK93 remain unclosed. SHA-256 `349c45d24544a1bfc3608678713909594c6a905e2a2ea61d8c170a17dfbb1876`.

- Earlier checkpoint: [To an effective local Langlands correspondence, arXiv 1103.5316](https://arxiv.org/pdf/1103.5316). PDF pp.10–11: the acknowledged older proof and character-extension lemmas. PDF pp.41–43: ramification bijection, tame compatibility and tame parameter theorem; cited earlier proofs remain open. SHA-256 `ca3a59ca755bd584357a67d60e7e2fad3412c8ff57d85eec0c31178bf42d0e5e`.

- Earlier checkpoint: [Failed BHK98 acquisition: returned journal listing](https://www.ams.org/jams/1998-11-03/S0894-0347-98-00270-7/S0894-0347-98-00270-7.pdf). The received 25-page document was inspected at its beginning and supposed theorem pages; it is a journal listing, not the 28-page article. SHA-256 `9fa169d7ef5550d04c61b4bf5f780741510345664324d62f0d5353b9d77c0360`.

- 2026-09-23: [BHK98](https://www.ams.org/journals/jams/1998-11-03/S0894-0347-98-00270-7/S0894-0347-98-00270-7.pdf). 403 via curl and browser. The /jams/ spelling also returned 403. No article text read.

- 2026-09-23: [BHK98](https://www.jstor.org/stable/pdf/2646168.pdf). Article/download lead from the issue listing; no usable PDF acquired.

- 2026-09-23: [BHK98](https://scispace.com/pdf/local-rankin-selberg-convolutions-for-explicit-conductor-1z2cqbhfr9.pdf). Public PDF lead returned browser 429 and curl 403. No text read.

- 2026-09-23: [BH03](https://doi.org/10.1112/S0024611503014114). Publisher metadata only. Wiley PDF unavailable and Cambridge showed Get access; KCL metadata did not provide a public proof. No access controls bypassed.

- 2026-09-23: [Rejected search lead](https://cds.cern.ch/record/630839/files/sis-2003-271.pdf). Title/initial-page check identifies Henniart's different paper on exterior/symmetric-square L-functions, not either requested prerequisite; not used.

- 2026-09-23: [Correction search](https://annals.math.princeton.edu/2017/185-3/p05). Publisher metadata and a title+erratum search did not locate a linked correction. This is not an exhaustive errata search or independent review of E1–E17.

No author contact, access-control bypass, independent review, or exhaustive correction search is claimed.

## Routes

### 1. ArithmeticGaloisRepresentationsPartIIRamificationProfiles (part-ii)

The parent’s coefficient-specific conductors do not cover complex smooth Weil profiles, their orbit metric, self-twists or first-break theory. Existing geometric-monodromy and geometric-Artin proposals have different targets; use their conductor interfaces where applicable but do not claim them as this construction.

Extend Arithmetic Galois representations (ArithmeticGaloisRepresentations) with a complex smooth Weil-representation branch over every nonarchimedean local field with finite residue field, in either characteristic. Reuse the existing local field, upper ramification and Weil-group carriers from Local fields and ramification (tauceti:TauCetiRoadmap/LocalFieldsRamification) and Class field theory (tauceti:TauCetiRoadmap/ClassFieldTheory); import full equal-characteristic reciprocity from Function-field arithmetic (FunctionFieldArithmetic:FA.4). Reuse the pinned Clifford declarations and the existing finite induction/Clifford correspondence rather than rebuilding them. Import the smooth category and induction from Smooth representations of local groups (SmoothRepresentationsOfLocalGroups:SR.0,SR.2). The parent R01.1–R01.3 uses finite Q_l or finite-field coefficients: construct the complex finite-inertia specialization and comparison explicitly, not by renaming its carrier. Build finite-image reduction up to unramified twist, constituent orbits, Δ with strict R and weak R+ endpoints, finite-sum Swan calculus, Σ with its weighted-max formula, normalized Hom identities, conductor-of-a-pair formula, and tail agreement. Prove tame scaling for totally wild representations only. Then build self-twist groups, centric and imprimitivity fields, the derivative-jump criterion and the first-break theorem: for absolutely wild σ of dimension p^r>1, the first break a is min sw(χ) over nontrivial Weil self-twists and is integral; for general totally wild σ divide the corresponding minimum over its imprimitivity field by its tame ramification index. Retain the exact finite p-group and character-extension suppliers listed in G8. Do not identify a singleton constituent orbit with an irreducible restriction. Export the independent Weil profile branch before importing any LLC application; the density and uniqueness results needing LLC are owned by the types branch. Suggested modules are TauCeti/NumberTheory/Local/WeilRepresentation/{Smooth,Conductor,RamificationDistance,DecompositionFunction,SelfTwists,FirstBreak}.lean. Mandatory examples include a tame two-dimensional representation with trivial wild action, an exact break for C2, nonzero Σ(0), and tame rescaling. Every definition receives the item-level API and tests below; all implementation claims remain unchecked.

Items: ramification-cofinal, smooth-weil, finite-image-twist, ramification-orbit, slope, swan, swan-step-sum, delta, delta-separation, delta-endpoints, delta-ultrametric, delta-tame, end-invariants, normalized-hom, sigma, sigma-max, sigma-shape, swan-pair, pair-ultrametric, sigma-wild-invariance, sigma-tame, sigma-tail, totally-wild-weil, twist-distance, graded-character-torsor, commutant-growth, sigma-jump-criterion, centric-field, self-twist-groups, wild-self-twists, imprimitivity-field, tame-self-twist-trivial, wild-character-extension, self-twist-descent, imprimitivity-bound, absolutely-wild, first-break-absolute, first-break-general, degree-p-breaks, degree-p-induction, ramification-kernel, cyclic-restriction, relative-p-induction, wild-self-twists-nontrivial, weil-occurrence.

### 2. SmoothRepresentationsPartII (part-ii)

Reuse the existing Fintzen candidate for explicit local representation constructions. The all-p GL_n endo-class branch is additional work beyond SR.0–SR.6; this is not a second generic types or Bernstein roadmap.

Reuse the already proposed SmoothRepresentationsPartII candidate from PAPER-FINTZEN-21: Smooth representations of local groups, Part II: types, depth and the construction of supercuspidal representations. Add a separately scoped Bushnell–Kutzko GL_n simple-character and endo-class branch valid in every residue characteristic and for local fields of either characteristic; do not silently apply Fintzen’s p not dividing the Weyl-group-order hypothesis to this branch, or remove it from her theorem. The final targets are BH17 §6.4: for Θ, ε>0 and δ=Ψ_Θ(ε), Δ(LΘ,LΥ)<ε iff A(Θ,Υ)<δ, and the corresponding equivalence with ≤; and §7.5: for totally wild Θ there is a finite exceptional set D such that A_K(Θ_K,χΘ_K)=e Ψ_Θ(sw(χ)/e) for every tame K/F of index e and χ outside D, and these values uniquely determine Ψ among continuous increasing finite piecewise-affine functions. Include the canonical truncated-class/ramification-pair classification, general tame law Ψ_{Θ_K}(x)=eΨ_Θ(x/e), and Ψ=id iff Θ is essentially tame. Build hereditary orders, exact simple strata and critical exponents, BK simple-character recursion, transfer, potential simple characters and endo-equivalence; descend the degree/level invariants and approximation jumps; construct the normalized corestriction-volume exponent, piecewise parameter fields and continuous structure function Φ; then A, real-index truncation, the corrected interior-depth perturbation and density. Prove the explicit GL pair-conductor formula and first ramification bijection from their actual suppliers, including the previously acknowledged gap repair. Import general categories, Hecke and induction from the parent SR.0–SR.3; import classical characteristic-zero LLC from Endoscopic transfer and unitary trace comparison (EndoscopicTransferAndUnitaryTraceComparison:ET.6), the equal-characteristic classical realization from Excursion operators and spectral action (ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic), complex Rankin–Selberg factors from Automorphic L-functions and local factors (AutomorphicLFunctionsAndLocalFactors:AL.1–AL.3), and local fields/reciprocity from their existing owners. Import Δ, Σ, Swan calculus and self-twist results from ArithmeticGaloisRepresentationsPartIIRamificationProfiles. Prove the initial-value equality before defining Φ inverse on its actual range, and place rational Weil realization and Δ-density after the comparison to avoid circularity. The final examples are conditional on the unverified epipelagic and conductor-divisibility inputs and on sufficient determinant cube classes; μ3 alone does not ensure those choices over residue F4. Separate the extra-special-image claim until its scalar normalization is checked. Suggested modules are TauCeti/RepresentationTheory/Local/GeneralLinear/{SimpleStrata,SimpleCharacters,EndoClass,StructureFunction,EndoDistance,HigherRamification,Interpolation}.lean. Acceptance tests include the period-1/period-2 scaling, the Q2 top-depth obstruction, scalar cancellation in an unramified quadratic parameter, the degree-one identity, and both exact piecewise-affine examples. No new generic types roadmap or duplicate general LLC construction is proposed. Import the AL.0 local lattice-volume and exact-complex comparison helpers, retaining fixed maps and finite positive measures. The minimal exponent arithmetic is expanded independently, but the BK93 integral exactness and adjacent-profile transition remain supplier gates; do not promote G4 to closed.

Items: hereditary-order, critical-exponent, stratum-equivalence, simple-characters, character-transfer, endo-class, endo-invariants, minimal-parameter, tame-corestriction, volume-exponent, minimal-volume, rational-endo-level, approximation, jumps, jumps-invariance, profile-fields, profile-invariance, phi, phi-continuity, phi-shape, phi-breaks, phi-same-stratum, endo-dual, phi-truncation-tail, tame-endo-lift, totally-wild-endo, phi-tame, endo-distance, endo-distance-well-defined, endo-distance-basic, endo-distance-metric, phi-distance-tail, truncation, truncation-balls, perturbation, endo-density, cuspidal-endo, gl-conductor, gl-level-swan, phi-unique, endo-pair-ultrametric, endo-distance-tame, llc-swan, first-ramification, profile-comparison, herbrand-endo, herbrand-shape, rational-weil-slopes, delta-density, sigma-unique, higher-strict, higher-weak, herbrand-tail, truncated-class-to-orbit, orbit-to-truncated-class, herbrand-tame, wild-lift-exists, wild-llc, endo-character-action, scalar-twist-level, twist-invariance, tame-depth-density, interpolation, interpolation-unique, degree-one, initial-slope, terminal-slope, scalar-level-reduction, essential-tame, essential-tame-criterion, degree-p-profile, degree-p-single-break, extraspecial-image, epipelagic-input, four-dimensional-example, eight-dimensional-example, positive-jumps.

### 3. SmoothRepresentationsOfLocalGroups (source)

The finite-quotient proof of occurrence is an instance of smooth restriction/induction and Frobenius reciprocity within the existing category and induction layers.

Stages: SmoothRepresentationsOfLocalGroups:SR.0, SmoothRepresentationsOfLocalGroups:SR.2.

Items: profinite-occurrence.

### 4. AutomorphicLFunctionsAndLocalFactors (source)

Character conductor realization, Rankin–Selberg exponent conventions and the pair Swan correction belong to the existing local-factor layers; they should be exported for the types application. AL.0 owns the local additive Haar-measure adapters: compact-open lattice index, exact-complex alternating volume, and scalar dilation. They consume the existing local-field/DVR carrier and generic length/index theorems. They are not adelic quotient volumes (AA.0) or discrete real covolumes (GN.0); the BK-normalized corestriction and its application remain in the types Part II.

Stages: AutomorphicLFunctionsAndLocalFactors:AL.0, AutomorphicLFunctionsAndLocalFactors:AL.1, AutomorphicLFunctionsAndLocalFactors:AL.3.

Items: pair-epsilon, pair-swan, character-depth-exists, lattice-volume-index, exact-lattice-comparison, lattice-dilation.

### 5. EndoscopicTransferAndUnitaryTraceComparison (source)

The paper consumes the classical characteristic-zero LLC already planned here, with dimension, dual, twist and epsilon normalization; it does not supply a new proof of that correspondence.

Stages: EndoscopicTransferAndUnitaryTraceComparison:ET.6.

Items: llc-char0.

### 6. ExcursionOperatorsAndSpectralAction (source)

The existing equal-characteristic classical realization owns this comparison. The exact complex coefficient and pair-epsilon interface is an open request within its scope, not a consequence of semisimple parameter agreement alone.

Stages: ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic.

Items: llc-charp.

## Recursive proof frontiers

### G1: Finite-quotient and smooth-category adapters

Finish the finite-image comparison W_F→G_F, the finite induction/Frobenius occurrence construction on the actual smooth carriers, and extension of finite abelian characters to C×. The relative mathematical arguments are supplied; exact pinned declarations and transport lemmas remain to be enumerated.

Suppliers: SmoothRepresentationsOfLocalGroups:SR.0; SmoothRepresentationsOfLocalGroups:SR.2; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group. Consumers: profinite-occurrence, finite-image-twist, character-depth-exists, centric-field, imprimitivity-field, weil-occurrence.

### G2: Complex conductor calculus

Construct the complex finite-inertia Swan conductor, quotient independence, the upper step-sum identity, tame scaling and the induction formula. R01.3 plans ℓ-adic conductors; that is not automatically a declaration at these coefficient/topology conventions.

Suppliers: ArithmeticGaloisRepresentations:R01.3; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration. Consumers: swan, swan-step-sum, swan-pair, sigma-tame, sigma-tail, degree-p-induction, positive-jumps.

### G3: Recursive simple-character suppliers

Acquire and read BK93 Chapters 1–3 and the exact transfer/intertwining/approximation proofs. BH96 §§1,7–9 were read selectively, and their statements are recorded; the transitive proof chain, simple-stratum carrier, H-recursion and conjugacy invariance remain open.

Suppliers: SmoothRepresentationsOfLocalGroups:SR.0; SmoothRepresentationsOfLocalGroups:SR.2; EndoscopicTransferAndUnitaryTraceComparison:ET.6. Consumers: hereditary-order, critical-exponent, stratum-equivalence, simple-characters, character-transfer, endo-class, endo-invariants, tame-corestriction, rational-endo-level, approximation, jumps, jumps-invariance, profile-fields, profile-invariance, endo-dual, phi-truncation-tail, tame-endo-lift, totally-wild-endo, phi-tame, endo-distance, endo-distance-well-defined, endo-distance-metric, truncation, cuspidal-endo, endo-distance-tame, terminal-slope.

### G4: Volume transition and gluing Φ

The fixed-map lattice-choice independence and all minimal-parameter dilation arithmetic now have explicit independent proofs via common uniformizer refinement, finite quotient lengths and coset measure. Still acquire BK93 (1.4.15), BHK98 §6.4 and BH03 §3.1 to verify the normalized corestriction, its allowed choices, minimal integral exactness, and adjacent-profile intercept transition, including inseparable parameter fields. Publisher/public-copy attempts in this continuation did not yield the prerequisite texts. AL.0 proof-to-library adapters remain to be elaborated.

Suppliers: AutomorphicLFunctionsAndLocalFactors:AL.0; AutomorphicLFunctionsAndLocalFactors:AL.3. Consumers: tame-corestriction, volume-exponent, minimal-volume, profile-fields, profile-invariance, phi, phi-continuity.

### G5: Perturbation and scalar twisting

Read BK94 Simple types §2.8 and Admissible dual of SL(N) II appendix. Prove the k<m perturbation variant, the translated H-group and simple-character identity with the actual level −v_a(β+c), and the terminating scalar-level reduction. The two printed statements are not safe as black boxes.

Suppliers: SmoothRepresentationsOfLocalGroups:SR.0; SmoothRepresentationsOfLocalGroups:SR.2. Consumers: perturbation, endo-density, endo-character-action, scalar-twist-level, twist-invariance, scalar-level-reduction.

### G6: Cuspidal realization, conductor formula and first ramification

Read BH13 intertwining, BHK98 §6.5/§6.15, BH03 §8.2 with its acknowledged repair, and the complete proof chain of BH14 §6.1–6.3. Pin the rank-deg Θ cuspidal realization and tame parameter theorem. The BH17 restatements are fully extracted, but do not close these proofs.

Suppliers: EndoscopicTransferAndUnitaryTraceComparison:ET.6; ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic; AutomorphicLFunctionsAndLocalFactors:AL.3. Consumers: cuspidal-endo, gl-conductor, first-ramification, rational-weil-slopes, wild-lift-exists, wild-llc, essential-tame.

### G7: Equal-characteristic and coefficient normalization

Use FA.4 for full local reciprocity in characteristic p and ES7:equal-characteristic for its classical realization. Identify the exact complex/ℓ-adic coefficient comparison and pair-epsilon compatibility; do not infer them from semisimple excursion agreement. ET.6 supplies only F/Q_p.

Suppliers: FunctionFieldArithmetic:FA.4; ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic; EndoscopicTransferAndUnitaryTraceComparison:ET.6. Consumers: llc-charp, llc-swan, first-ramification.

### G8: Finite p-group and projective lifting interfaces

The cyclic restriction and relative index-p induction arguments are explicit. Still audit their finite group suppliers, finite p-group degree theorem, projective-to-linear scalar twist making an absolutely wild representation finite p-group-valued, and the complete BH14 §1.3 extension interface. No unexamined projective obstruction is assumed away.

Suppliers: tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group. Consumers: totally-wild-weil, graded-character-torsor, sigma-jump-criterion, wild-character-extension, self-twist-descent, absolutely-wild, first-break-absolute, degree-p-breaks, cyclic-restriction, relative-p-induction, wild-self-twists-nontrivial.

### G9: Degree-p classification and the final examples

Acquire Mœglin 1990 for the cyclic inducing field, uniqueness and the extra-special-image assertion; acquire BH14 epipelagic §§5.1–5.2 and BH01 conductor divisibility for tensor irreducibility. Resolve the scalar-image normalization and check the determinant-class existence hypotheses. The affine computations are conditional and are not existence proofs.

Suppliers: SmoothRepresentationsOfLocalGroups:SR.3; AutomorphicLFunctionsAndLocalFactors:AL.3. Consumers: degree-p-induction, degree-p-single-break, extraspecial-image, epipelagic-input, four-dimensional-example, eight-dimensional-example.

## Source findings retained for independent review

All E1–E17 remain unreviewed. The intersection warning in the continuation is our proof-design guard, not a new claim that the published source uses that shortcut. The machine-readable record preserves every earlier search, affected-item list and version comparison.

### E1 — BH17 §2.5 Proposition (1) proof, p.929

Printed: Γ^ε = Γ

Proposed correction: Replace Γ by its wild inertia Γ^{0+} for 0<ε before the first positive jump.

Reason: The chosen finite Galois extension need not be totally wildly ramified. Its positive upper groups exclude unramified and tame quotients. Separation only needs preservation of the two wild orbits.

Affects: the proof. Prior known status: new. No reviewer verdict supplied.

### E2 — BH17 §2.5 Proposition (2) proof, p.929

Printed: Δ(ξ,ζ) ≤ ε

Proposed correction: Use Δ<ε for nonzero Hom on R_F(ε); use Δ≤ε for nonzero Hom on R_F^+(ε).

Reason: A nontrivial character at a break has no invariant on R_F(a) and is trivial on R_F^+(a). The printed equivalence contradicts the proposition’s own endpoint assertion.

Affects: the proof. Prior known status: new. No reviewer verdict supplied.

### E3 — BH17 §4.3 Remark, p.934

Printed: x e_a/e_a′

Proposed correction: Use x e_a′/e_a.

Reason: For scalar β=π^−1 the unnormalized jump is the period itself. Periods 1 and 2 give jumps 1 and 2, whereas the printed factor gives 1/2. BH96 (1.4) confirms the direction of scaling.

Affects: nothing. Prior known status: new. No reviewer verdict supplied.

### E4 — BH17 §4.6 proof, p.937

Printed: φ′(x)=Φ′_Θ(x)

Proposed correction: Replace the right side by Φ′_{Θ_K}(x)=Φ′_Θ(x/e).

Reason: For φ(x)=eΦ_Θ(x/e), the chain rule gives Φ′_Θ(x/e); (4.6.2) identifies it with Φ′_{Θ_K}(x). Both PDF text spans and the page image were checked; this is not merely an OCR omission.

Affects: the proof. Prior known status: new. No reviewer verdict supplied.

### E5 — BH17 §5.3 auxiliary Lemma, p.939

Printed: 1 ≤ k ≤ m

Proposed correction: Restrict the same-top-level perturbation to 1≤k<m; if a top-depth version is needed, allow the top level of the replacement to fall and reprove its statement.

Reason: For F=Q_2, GL_1, a=Z_2 and m=1, every simple character of level 1 is the unique nontrivial character of U^1/U^2≅C2. Two such characters cannot fail to intertwine on H^1=U^1. The density proof only uses k<m and survives the repair.

Affects: a stated result. Prior known status: new. No reviewer verdict supplied.

### E6 — BH17 §7.2 explanatory equivalence, p.945

Printed: exactly one element

Proposed correction: A singleton orbit must additionally occur with multiplicity one. Retain the defining condition that σ|P_F is irreducible.

Reason: Over Q_2 the tame S3 quotient C3⋊C2 (Frobenius acts by inversion) has its irreducible standard two-dimensional complex representation. Wild inertia acts trivially, so its constituent orbit is a singleton but its restriction is two copies of the trivial character.

Affects: a stated result. Prior known status: new. No reviewer verdict supplied.

### E7 — BH17 §7.4 Lemma, p.946

Printed: m′=max{m,nk}

Proposed correction: Use the actual level m′=−v_a(β+c). If the two summand levels differ it equals max(m,e_a k). The equal-level case needs a cancellation analysis and the full character-transfer statement needs the cited appendix.

Reason: First, scalar c of valuation −k has order level e_a k, not dim_F(V) k. For an unramified quadratic parameter in a maximal order e_a=1, k=2 gives level 2, not 4. Second, even max(m,e_a k) can fail: over Q_3, E/F unramified quadratic, β=1/9+α/3, c=−1/9 gives m=k=2 but β+c=α/3 has level 1. The commutator and critical exponent are unchanged, with k_0=−1.

Affects: a stated result. Prior known status: new. No reviewer verdict supplied.

### E8 — BH17 §7.1 proof, p.945

Printed: Density Lemma of 5.2

Proposed correction: The density lemma is §5.3.

Reason: §5.2 supplies truncation, while the next subsection proves density.

Affects: nothing. Prior known status: new. No reviewer verdict supplied.

### E9 — BH17 §7.6 Proposition (2) proof, p.948

Printed: −v_F(α)/p^s

Proposed correction: Use −v_E(α)/p^s, and consequently m=−p^{r−s}v_E(α).

Reason: The element α belongs to E=F[α], not generally to F, and the denominator p^s is e(E/F) for the normalized integer valuation v_E. The next sentence already uses v_E.

Affects: the proof. Prior known status: new. No reviewer verdict supplied.

### E10 — BH17 §7.6 Proposition (2) proof, p.948

Printed: δ=min{δ_1,δ_2}

Proposed correction: Also shrink δ so that Ψ_Θ(x)>m_Θ−δ_1 whenever m_Θ−δ<x<m_Θ.

Reason: The derivative of Φ^−1 is evaluated at Ψ(x), whereas δ_1 controls an interval in the Φ argument. Continuity at Ψ(m)=m supplies the necessary further shrink; taking the minimum of the original two radii alone is not justified.

Affects: the proof. Prior known status: new. No reviewer verdict supplied.

### E11 — BH17 §8.2 Lemma 2 proof, p.951

Printed: Lemma 8.1

Proposed correction: Refer to the preceding §8.2 Lemma 1.

Reason: Injectivity of the restriction on self-twists uses the triviality of tame self-twists proved immediately above, not the character-torsor lemma of §8.1.

Affects: nothing. Prior known status: new. No reviewer verdict supplied.

### E12 — BH17 §8.4 two-break paragraph, p.952

Printed: sw(χ)=a

Proposed correction: With the stated cyclic degree-p inducing field of upper break a, use sw_K(χ)=m−(p−1)a.

Reason: Swan induction gives m=sw_K(χ)+(p−1)a. Here a is an integer by §8.3 and p∤m. The printed equality would force m=pa, a contradiction. The identification of the inducing field’s break and uniqueness proof still need the cited Mœglin source.

Affects: a stated result. Prior known status: new. No reviewer verdict supplied.

### E13 — BH17 §8.5 existence assertions preceding Examples 1 and 2, p.953

Printed: (det α′)^3 ≢ (det α)^3 (mod U_F^1)

Proposed correction: Require the indicated determinant cube classes to exist; μ_3⊂F alone is insufficient. A sufficient residue-cardinality condition for the class-count obstruction to disappear is q≥16 (with μ_3⊂F), but realization of all choices still needs the epipelagic source.

Reason: Take the unramified quadratic extension of Q_2, with residue F_4 and μ_3⊂F. The determinants of the level-one degree-two parameters all have valuation −1. Their ratios are units, and every nonzero element of F_4 has cube 1. Thus all determinant cubes are congruent modulo U_F^1, so no τ′ of the required kind exists. Numerical functions remain valid conditional on suitable choices.

Affects: a stated result. Prior known status: new. No reviewer verdict supplied.

### E14 — BH14 §1.2 Proposition proof, p.10 of arXiv 1103.5316; correction acknowledged BH17 §2.1 p.927

Printed: compactly induced

Proposed correction: Replace the cited compact-induction argument by the finite-quotient closed-subgroup occurrence construction, then use Clifford theory to identify the stabilizer field.

Reason: BH17 explicitly acknowledges that the older proof was incorrect and supplies the needed occurrence result. The earlier proof was freshly read here.

Affects: the proof. Prior known status: BH17 §2.1 Proposition 2 and acknowledgement, published p.927. No reviewer verdict supplied.

### E15 — BH03 Local tame lifting IV, §8.2 Theorem; acknowledgement in BH17 §2.1 p.927

Printed: gap

Proposed correction: Use BH17’s occurrence proposition in the earlier first-ramification proof, then inspect the full BH03 argument for the precise insertion.

Reason: The authors expressly acknowledge a gap in the proof of the earlier theorem. The acknowledgement is read; the full earlier proof has not been acquired, so no additional diagnosis is invented.

Affects: the proof. Prior known status: BH17 §2.1 Proposition 2 and acknowledgement, published p.927. No reviewer verdict supplied.

### E16 — BH17 bibliography [2], p.954

Printed: 10.1515/9781400882496

Proposed correction: The DOI of BH96 Local tame lifting I is 10.1007/BF02698646.

Reason: The Numdam publication record and original PDF identify the correct IHÉS article. The printed DOI is for the Princeton book, not this article.

Affects: nothing. Prior known status: new. No reviewer verdict supplied.

### E17 — BH17 §4.5 proof, p.936

Printed: F[γ_2]:F]

Proposed correction: Insert the opening degree bracket: [F[γ_2]:F].

Reason: Both sides compare field degrees; the published page image confirms the missing opening bracket.

Affects: nothing. Prior known status: new. No reviewer verdict supplied.

## Complete item inventory

### clifford-semisimple — Semisimplicity of normal restriction

theorem; library; BH17 §2.2, p.927; pinned Clifford/Basic.lean:325.

For a field k, group G, normal subgroup N, and finite-dimensional irreducible k-representation V of G, Res_N V is semisimple. No finiteness of G and no Maschke characteristic condition is needed.

Dependencies: none.

Pinned imports: tauceti:TauCeti.Representation.isSemisimpleRepresentation_comp_subtype.

1. Apply the pinned normal-restriction theorem.

### clifford-orbit — One conjugacy orbit of constituents

theorem; library; BH17 §2.2, p.927; pinned Clifford/Orbit/Basic.lean:137.

Under the preceding hypotheses there is a minimal nonzero N-subrepresentation S, and every minimal N-subrepresentation is isomorphic to a G-conjugate of S.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-semisimple.

Pinned imports: tauceti:TauCeti.Representation.exists_isAtom_forall_nonempty_linearEquiv_conjSubrep.

1. Apply the packaged orbit theorem, retaining the actual intertwining equivalence.

### clifford-multiplicity — Common constituent Hom dimension

theorem; library; BH17 §2.2, p.927; pinned Clifford/Multiplicity.lean:424.

Under the same hypotheses there is e>0 such that dim_k Hom_N(S,Res_N V)=e for every minimal constituent S. Over C, Schur identifies this with the ordinary multiplicity.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-orbit.

Pinned imports: tauceti:TauCeti.Representation.exists_forall_finrank_linearMap_eq.

1. Apply the pinned Hom-dimension theorem; the complex specialization uses Schur.

### clifford-dimension — Clifford decomposition with dimension identity

theorem; library; BH17 §§2.2,8.1; pinned Clifford/Dimension.lean:67.

For algebraically closed k, arbitrary G, normal N, and simple W in FDRep k G, there are a simple V in FDRep k N, finite G/inertia(V), and e≠0 with Res_N W ≅ V.cliffordSum e and dim W=e [G:inertia(V)] dim V.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-multiplicity.

Pinned imports: tauceti:FDRep.clifford_restrict_finrank.

1. Use the exported isomorphism as well as its dimension formula.

### local-fields — Local-field and normalized valuation conventions

definition; planned; BH17 notation, p.924.

F is any nonarchimedean local field with finite residue field k_F of characteristic p; v_F(F×)=Z. For a finite extension E/F, e=e(E/F), f=f(E/F), [E:F]=ef, and v_E restricted to F is e v_F. Both characteristics are allowed.

Dependencies: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions.

Existing stages: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions.

1. Import the intrinsic local-field carrier and valuation comparisons.

API `localField_residueCard` (projection): Return q=|k_F| and its residue characteristic p.

API `valuation_restrict` (compatibility): For x∈F×, v_E(x)=e(E/F)v_F(x).

API `degree_eq_ramification_mul_inertia` (relation): For finite E/F, [E:F]=ef.

Use §4.2: Normalize stratum levels by the order period.

Use §7.1: Rescale the argument of Ψ by tame ramification index.

Test `local_fields_test_1` (compatibility): F_q((t)) is allowed; no absolute ramification index of F is inserted.

Test `local_fields_test_2` (computation): An unramified quadratic extension has e=1, f=2.

Test `local_fields_test_3` (compatibility): A totally ramified degree-e extension multiplies valuations of base-field elements by e.

### unit-filtration — Principal-unit filtration

definition; planned; BH17 notation p.924 and §7.4; local-field supplier.

For an order a with radical p_a, U_a^k=1+p_a^k for k≥1. For the field order, U_F^0=O_F× and U_F^k=1+p_F^k; U_F^k/U_F^{k+1} is the additive residue field for k≥1.

Dependencies: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group.

Existing stages: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group.

1. Import field units; extend to hereditary orders in the separate stratum item.

API `unitFiltration_mono` (relation): j≥i implies U_F^j⊆U_F^i.

API `unitFiltrationGraded_equiv` (equivalence): For k≥1 and a uniformizer, U_F^k/U_F^{k+1}≅k_F additively.

API `unitFiltration_mul` (simp): Modulo U_F^{2k}, multiplication of 1+x and 1+y agrees with addition of x and y.

Use §5.3: Check the top-depth perturbation over Q_2.

Use §7.5: Construct characters of prescribed positive Swan exponent.

Test `unit_filtration_test_1` (computation): U_Q2^1/U_Q2^2 has two elements.

Test `unit_filtration_test_2` (non-example): U_F^0/U_F^1 is multiplicative k_F×, not additive k_F.

Test `unit_filtration_test_3` (computation): For k=1, retain the strict linearization condition 2v_F(x)>sw(χ).

### weil-group — Weil group and its topology

construction; planned; BH17 notation p.924 and §2.1.

W_F is the inverse image of Z under G_F→Ẑ, with its Weil topology, so inertia I_F is open and W_F/I_F≅Z. W_F is dense in G_F; for finite K/F its subgroup W_K has index [K:F].

Dependencies: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.

Existing stages: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group.

1. Import the topology and density, not the subspace topology from G_F.

API `weilDegree` (projection): The arithmetic degree map W_F→Z has kernel I_F.

API `weilToAbsolute_dense` (compatibility): The continuous injection W_F→G_F has dense image.

API `weilTransfer_index` (functoriality): For finite K/F, W_K embeds openly with index [K:F], and degree is multiplied by f(K/F).

Use §2.1 Proposition 2: Restrict finite Galois representations without losing irreducibility.

Use §2.6: Take finite coset minima under tame extension.

Test `weil_group_test_1` (non-example): Inertia is open in W_F but not in G_F.

Test `weil_group_test_2` (compatibility): An unramified degree-f extension multiplies the degree by f.

Test `weil_group_test_3` (non-example): The inclusion is not asserted to be surjective.

### upper-filtration — Upper ramification and right-limit groups

definition; planned; BH17 §1.1 pp.925–926.

For x≥0 let R_F(x)=G_F^x⊆W_F, and R_F^+(x)=closure(⋃_{y>x}R_F(y)). Thus R_F(0)=I_F and R_F^+(0)=P_F. The groups are closed, normal and decreasing; for x>0 they lie in P_F.

Dependencies: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group; PAPER-BUSHNELL-HENNIART-17/weil-group.

Existing stages: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group.

1. Import upper numbering and finite-quotient compatibility; take the indicated closed union.

API `upperRamification_zero` (simp): R_F(0)=I_F and R_F^+(0)=P_F.

API `upperRamificationPlus_le` (relation): For y>x, R_F(y)⊆R_F^+(x)⊆R_F(x).

API `upperRamification_finiteQuotient` (compatibility): Images in any finite Galois quotient give its upper filtration and right limits.

Use §2.5: Distinguish strict and weak metric balls.

Use §3.1: Define right-continuous invariant spaces.

Test `upper_filtration_test_1` (non-example): A representation with break a is trivial on R_F^+(a), but need not be trivial on R_F(a).

Test `upper_filtration_test_2` (non-example): At x=0 do not identify I_F with P_F.

Test `upper_filtration_test_3` (non-example): Taking an algebraic union without topological closure is not the definition.

### tame-filtration — Tame scaling of upper groups

theorem; planned; BH17 §1.2 Lemma 1 p.926.

For finite tame K/F of ramification index e, P_K=P_F, R_K(ex)=R_F(x) for x>0, and R_K^+(ex)=R_F^+(x) for x≥0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/upper-filtration.

Existing stages: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group.

1. Use the tame Herbrand function and quotient-compatible upper numbering.

### ramification-commutators — Commutators of upper groups

theorem; planned; BH17 §1.2 Lemma 2 p.926.

For 0<x≤y, [R_F(x),R_F(y)]⊆R_F^+(y); for x≥0, [P_F,R_F(x)]⊆R_F^+(x).

Dependencies: PAPER-BUSHNELL-HENNIART-17/upper-filtration.

Existing stages: tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

1. Apply the finite-quotient commutator estimate and then pass to the inverse limit.

### ramification-cofinal — Cofinality and left local constancy

theorem; missing; BH17 §2.1 Proposition 1 p.926.

R_F(x), x>0, is cofinal in the open subgroups of P_F. If an open subgroup U of P_F contains R_F(ε), ε>0, then it contains R_F(ε′) for some 0<ε′<ε.

Dependencies: PAPER-BUSHNELL-HENNIART-17/upper-filtration.

1. Choose a finite Galois quotient whose kernel lies in U; use its finite upper jumps. Normality of U is unnecessary after shrinking to an open normal subgroup.

### smooth-weil — Smooth finite-dimensional complex Weil representations

definition; missing; BH17 notation and §§2.1–3.1.

Use isomorphism classes of irreducible smooth complex representations σ of W_F and finite-dimensional semisimple sums. On compact subgroups smooth finite-dimensional representations factor through finite quotients. Restriction, duals, tensors, invariants and intertwiner spaces retain their smooth structures.

Dependencies: PAPER-BUSHNELL-HENNIART-17/weil-group; SmoothRepresentationsOfLocalGroups:SR.0.

1. Construct the complex specialization of the smooth category; prove the finite-kernel assertion by intersecting stabilizers of a basis.

API `smoothWeil_restrict` (functoriality): Restriction along W_K→W_F and closed inertia subgroups preserves smoothness.

API `smoothWeil_finiteImage_compact` (characterisation): The kernel on a compact subgroup is open, so the image is finite.

API `smoothWeil_dualTensorHom` (equivalence): (σ∨⊗τ)^H identifies with Hom_H(σ,τ).

Use §3.1: Translate tensor invariants into normalized Hom dimensions.

Use §8.2: Pass to finite wild-inertia images.

Test `smooth_weil_test_1` (compatibility): An unramified complex character can have infinite image.

Test `smooth_weil_test_2` (degenerate): Its restriction to inertia is trivial.

Test `smooth_weil_test_3` (compatibility): No ℓ-adic continuity hypothesis is substituted for complex smoothness.

### profinite-occurrence — Occurrence of a closed-subgroup representation

theorem; missing; BH17 §2.1 Proposition 2 and Complement p.927.

If H is closed in a profinite group G and ξ is an irreducible smooth complex representation of H, there is a finite-image irreducible smooth complex representation of G whose restriction contains ξ.

Dependencies: SmoothRepresentationsOfLocalGroups:SR.0; SmoothRepresentationsOfLocalGroups:SR.2.

1. Smooth irreducibles of a compact group are finite dimensional by spanning the finite orbit of a nonzero vector.

2. Choose open normal N◁G with N∩H⊆ker ξ; inflate ξ to HN/N.

3. Induce to the finite group G/N. A simple constituent and Frobenius reciprocity give occurrence; inflate to G.

Open frontiers: G1.

### finite-image-twist — Finite image after an unramified twist

theorem; missing; BH17 §2.2, §8.2; proof adapter.

Every irreducible smooth complex Weil representation becomes finite-image after an unramified character twist; its projectivization already has finite image. Its inertia restrictions and End representation are unaffected by this twist.

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/weil-group.

1. The inertia image is finite. A power of Frobenius centralizes that image and commutes with Frobenius, hence acts as a scalar by Schur.

2. Choose an appropriate complex root in an unramified twist to make that power the identity.

3. The twisted image is finite; its extension to G_F uses the finite-quotient comparison for W_F.

Open frontiers: G1.

### ramification-orbit — Constituent orbits and orbit maps

construction; missing; BH17 §2.2 pp.927–928 and §2.5.

For ε≥0 and irreducible σ, write [σ;ε] and [σ;ε]^+ for the W_F-conjugacy orbit of an irreducible constituent on R_F(ε), respectively R_F^+(ε). Clifford theory makes these well defined. The maps onto these orbit sets are surjective and factor through the wild orbit [σ;0]^+ when ε>0 (and for plus at ε=0).

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-semisimple; PAPER-BUSHNELL-HENNIART-17/clifford-orbit; PAPER-BUSHNELL-HENNIART-17/clifford-multiplicity; PAPER-BUSHNELL-HENNIART-17/weil-occurrence; PAPER-BUSHNELL-HENNIART-17/upper-filtration.

1. Use the actual orbit and common multiplicity results, then the occurrence lemma for surjectivity.

API `ramificationOrbit_eq_iff` (characterisation): Two classes have equal orbit at ε iff the restrictions have a common irreducible constituent.

API `ramificationOrbit_surjective` (constructor): Every W_F-orbit of smooth irreducibles of the subgroup is realized by a Weil irreducible.

API `ramificationOrbit_fromWild` (functoriality): Restriction from P_F defines the positive-depth orbit maps independently of representatives.

Use §2.5: Define Δ on the wild-orbit quotient.

Use §6.4: Express higher-ramification balls through orbit agreement.

Test `ramification_orbit_test_1` (non-example): Repeated copies do not change the orbit.

Test `ramification_orbit_test_2` (non-example): A singleton orbit does not force multiplicity one.

Test `ramification_orbit_test_3` (compatibility): The orbit maps at larger depth forget information.

### slope — Slope of an irreducible Weil representation

definition; missing; BH17 §2.3 p.928.

sl(σ)=inf{x>0:R_F(x)⊆ker σ}. It is zero precisely for tame σ; R_F^+(sl σ) lies in the kernel. When sl σ>0, σ restricted to R_F(sl σ) is a sum of nontrivial characters.

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/ramification-cofinal; PAPER-BUSHNELL-HENNIART-17/ramification-commutators.

1. Use the finite quotient filtration to attain the right endpoint. At the final break the commutator statement makes the restriction abelian.

API `slope_zero_iff` (characterisation): sl σ=0 iff P_F acts trivially.

API `upperPlus_slope_le_ker` (relation): R_F^+(sl σ)⊆ker σ.

API `slope_lastBreak_characters` (structure): For sl σ>0 the final nontrivial restriction is a direct sum of nontrivial characters.

Use §3.1: Evaluate the max formula for Σ.

Use §7.6: Show End σ becomes tame below the final slope for totally wild σ.

Test `slope_test_1` (degenerate): Tame irreducibles of dimension greater than one still have slope zero.

Test `slope_test_2` (compatibility): An upper break is killed only on the plus group at that index.

Test `slope_test_3` (non-example): The final characters need not be W_F characters.

### swan — Complex Swan conductor and normalized conductor

definition; missing; BH17 §2.4 p.928 and §3.1.

For a finite-inertia-image complex representation V, sw(V) is the additive nonnegative integer Swan conductor. For nonzero semisimple V set ς(V)=sw(V)/dim V. For irreducible σ, sw(σ)=dim(σ) sl(σ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/upper-filtration.

1. Define the finite-quotient conductor and prove independence; use the finite ramification codimension sum. This extends the coefficient scope of R01.3, not the field carrier.

API `swan_directSum` (functoriality): sw(V⊕W)=sw(V)+sw(W).

API `swan_irreducible` (characterisation): For irreducible σ, sw(σ)=dim σ·sl σ.

API `swan_tame_iff` (simp): sw(V)=0 iff wild inertia acts trivially on V.

Use §3.1: Compute Σ by constituents.

Use §6.1: Compare pair conductors across LLC.

Test `swan_test_1` (computation): sw(1)=0.

Test `swan_test_2` (compatibility): The normalized conductor can be rational although sw is integral.

Test `swan_test_3` (compatibility): Swan and Artin conductors differ by dim V−dim V^I.

Open frontiers: G2.

### swan-step-sum — Swan conductor as a finite step sum

theorem; missing; BH17 §3.1 Lemma, independent proof interface.

For finite-inertia-image V, sw(V)=∫_0^∞(dim V−dim V^{R_F(t)})dt, interpreted as the finite weighted sum over its upper break intervals. Changing finitely many endpoint values does not change the sum.

Dependencies: PAPER-BUSHNELL-HENNIART-17/swan; PAPER-BUSHNELL-HENNIART-17/upper-filtration.

1. Convert the lower-numbering finite Swan formula by the Herbrand change of variable. Prove independence of a refinement of the finite partition.

Open frontiers: G2.

### delta — Ramification distance

definition; missing; BH17 §2.5 (2.5.1),(2.5.3) p.929.

For W_F-orbits ξ,ζ of irreducible smooth P_F representations, Δ(ξ,ζ)=inf{ε>0:[ξ;ε]=[ζ;ε]}. On Weil irreducibles use their wild orbits; equivalently the infimum of ε>0 for which Hom_{R_F(ε)}(σ,τ)≠0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/ramification-orbit; PAPER-BUSHNELL-HENNIART-17/ramification-cofinal.

1. Use eventual triviality to make the defining set nonempty. Rationality is proved later, without a forward dependency here.

API `delta_symm` (relation): Δ(ξ,ζ)=Δ(ζ,ξ).

API `delta_lt_iff` (characterisation): For ε>0, Δ(ξ,ζ)<ε iff their R_F(ε)-orbits agree.

API `delta_le_iff` (characterisation): For ε>0, Δ(ξ,ζ)≤ε iff their R_F^+(ε)-orbits agree.

Use §6.4: Give the two different ball statements.

Use §7.3: Detect when a character twist produces distance strictly smaller than its Swan exponent.

Test `delta_test_1` (computation): At an exact positive break a, Δ=a gives plus agreement and non-plus disagreement.

Test `delta_test_2` (degenerate): Distinct unramified twists have distance zero.

Test `delta_test_3` (degenerate): On wild orbits, zero distance implies equality.

### delta-separation — Separation on the wild-orbit quotient

theorem; missing; BH17 §2.5 Proposition (1) p.929.

Δ(ξ,ζ)=0 iff ξ=ζ. The induced distance on Weil irreducibles is only a pseudometric.

Dependencies: PAPER-BUSHNELL-HENNIART-17/delta; PAPER-BUSHNELL-HENNIART-17/profinite-occurrence.

1. Realize both orbits in a common finite Galois quotient. Before its first positive break the upper group equals its wild inertia, not its full Galois group; unequal wild orbits remain unequal.

### delta-endpoints — Strict and weak endpoint identities

theorem; missing; BH17 §2.5 Proposition (2), corrected proof p.929.

For δ=Δ(ξ,ζ)>0, [ξ;δ]^+=[ζ;δ]^+ and [ξ;δ]≠[ζ;δ]. More generally Δ<ε is equivalent to non-plus agreement and Δ≤ε to plus agreement for ε>0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/delta; PAPER-BUSHNELL-HENNIART-17/ramification-cofinal.

1. Reduce to a common finite quotient, whose agreement set has left-open endpoint. Cofinality and left local constancy exclude non-plus agreement at the infimum.

Test `delta_endpoints_test_1` (degenerate): Exact finite C2 filtration with break 1: trivial and sign characters have Δ=1, disagree on R(1), agree on R+(1).

### delta-ultrametric — Ultrametric inequality for Δ

theorem; missing; BH17 §2.5 Proposition (3) p.929.

For any three wild orbits ξ,ζ,η, Δ(ξ,ζ)≤max(Δ(ξ,η),Δ(η,ζ)).

Dependencies: PAPER-BUSHNELL-HENNIART-17/delta-endpoints.

1. At every ε greater than the displayed maximum, orbit equality is transitive; take the infimum.

### delta-tame — Tame coset-minimum formula

theorem; missing; BH17 §2.6 Proposition p.930.

For finite tame K/F of index e=e(K/F), and ξ,ζ irreducible P_F=P_K representations, eΔ_F(W_Fξ,W_Fζ)=min_{g∈W_K\W_F}Δ_K(W_Kξ,W_K gζ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/delta-endpoints; PAPER-BUSHNELL-HENNIART-17/tame-filtration.

1. Use the finite coset decomposition of a W_F-orbit and rescale each strict agreement set.

### end-invariants — Canonical invariant summand of End σ

construction; missing; BH17 §3.1 p.930.

For irreducible σ let X=σ∨⊗σ. For δ≥0, X(δ)=X^{R_F^+(δ)} and X′(δ) is its unique sum of nontrivial R_F^+(δ)-isotypic components. Both are W_F-stable semisimple representations.

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/clifford-semisimple; PAPER-BUSHNELL-HENNIART-17/finite-image-twist.

1. Use the averaging idempotent on the finite image of R_F^+(δ); normality makes its image and kernel W_F-stable.

API `endInvariants_decompose` (structure): X=X(δ)⊕X′(δ) canonically as a W_F-representation.

API `endInvariants_mono` (relation): For δ≤ε, X(δ)⊆X(ε).

API `endInvariants_tensorHom` (equivalence): dim X(δ)=dim End_{R_F^+(δ)}(σ).

Use §3.1: Define the decomposition function.

Use §8.1: Detect derivative jumps by commutant growth.

Test `end_invariants_test_1` (compatibility): At a positive break use R^+, so the new invariants have already appeared.

Test `end_invariants_test_2` (computation): For a character σ, X=1 and X′=0.

Test `end_invariants_test_3` (non-example): A noncanonical vector-space complement is insufficient.

### normalized-hom — Normalized Hom equality above agreement

theorem; missing; BH17 §3.4 proof p.932; explicit §3.1 adapter.

Let σ,τ be irreducible of dimensions a,b and t>Δ(σ,τ). Then b Res_{R_F(t)}σ≅a Res_{R_F(t)}τ, and dim Hom_{R_F(t)}(σ,τ)/(ab)=dim End_{R_F(t)}σ/a². For 0<t<Δ the first Hom space is zero.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-dimension; PAPER-BUSHNELL-HENNIART-17/delta-endpoints.

1. Common orbit, equal constituent dimensions and common multiplicities make normalized restrictions identical; compute Hom dimensions using complex Schur. Do not assert an isomorphism of full W_F-representations.

### sigma — Decomposition function

definition; missing; BH17 §3.1 (3.1.2) p.930.

For irreducible σ of dimension n and x≥0 define Σ_σ(x)=n^−2(x dim X(x)+sw X′(x)).

Dependencies: PAPER-BUSHNELL-HENNIART-17/end-invariants; PAPER-BUSHNELL-HENNIART-17/swan.

1. Use the canonical summands so this does not depend on an arbitrary splitting.

API `sigma_zero` (simp): Σ_σ(0)=sw(σ∨⊗σ)/n².

API `sigma_deriv` (data): Off its finite break set, Σ′_σ(x)=dim End_{R_F^+(x)}σ/n².

API `sigma_isomorphic` (functoriality): Isomorphic representations give the same function.

Use §6.2: Compose with the inverse structure function.

Use §8.1: Read jumps from self-twists.

Test `sigma_test_1` (computation): For every one-dimensional σ, Σ_σ(x)=x.

Test `sigma_test_2` (non-example): Σ_σ(0) need not be zero for higher dimension.

Test `sigma_test_3` (compatibility): The right-hand derivative uses plus invariants.

### sigma-max — Finite weighted-max formula

theorem; missing; BH17 §3.1 (3.1.3) pp.930–931.

If σ∨⊗σ=⊕_i ψ_i with irreducible constituents repeated with multiplicity, Σ_σ(x)=n^−2 Σ_i dim ψ_i·max(x,sl ψ_i).

Dependencies: PAPER-BUSHNELL-HENNIART-17/sigma; PAPER-BUSHNELL-HENNIART-17/slope; PAPER-BUSHNELL-HENNIART-17/swan.

1. A constituent lies in X(x) exactly when its slope is ≤x; otherwise it lies in X′(x).

### sigma-shape — Shape of the decomposition function

theorem; missing; BH17 §3.1 Proposition and §6.2 proof.

Σ_σ is continuous, strictly increasing, convex, piecewise affine, with finitely many derivative jumps, and equals x for x≥sl σ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/sigma-max.

1. Each weighted max is convex and continuous. The trivial constituent supplies a positive slope everywhere; all End slopes are ≤sl σ, so the final sum is x.

### swan-pair — Conductor of a pair through Δ

theorem; missing; BH17 §3.1 Lemma (3.1.1), formula (3.1.4) pp.930–931.

For irreducible σ,τ and δ=Δ(σ,τ), sw(σ∨⊗τ)/(dim σ dim τ)=Σ_σ(δ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/normalized-hom; PAPER-BUSHNELL-HENNIART-17/swan-step-sum; PAPER-BUSHNELL-HENNIART-17/sigma.

1. Write the normalized Swan step sum. Below δ its integrand is 1; above δ replace normalized Hom dimensions by those of End σ.

2. The result is δ+∫_δ^∞(1−dim End_{R_F(t)}σ/(dim σ)²)dt, equal to Σ_σ(δ) by the weighted-max formula.

3. Endpoints do not affect the finite weighted sum. This supplies a relative proof without using the unread Heiermann proof.

Open frontiers: G2.

### pair-ultrametric — Ultrametric inequality for normalized pair Swan

theorem; missing; BH17 §3.1 Corollary p.931.

The symmetric pairing (σ,τ)↦sw(σ∨⊗τ)/(dim σ dim τ) satisfies the strong triangle inequality, although its diagonal can be positive.

Dependencies: PAPER-BUSHNELL-HENNIART-17/swan-pair; PAPER-BUSHNELL-HENNIART-17/sigma-shape; PAPER-BUSHNELL-HENNIART-17/delta-ultrametric.

1. Choose the largest of the two comparison distances and use the increasing profile based at the common representation.

### sigma-wild-invariance — Σ depends only on the wild orbit

theorem; missing; BH17 §3.1 concluding paragraph p.931.

If σ and τ have the same W_F-orbit on P_F, then Σ_σ=Σ_τ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/normalized-hom; PAPER-BUSHNELL-HENNIART-17/sigma-max.

1. For every positive t normalized Hom dimensions agree; integrate their common step function and use the common identity tail.

### sigma-tame — Tame scaling of Σ for totally wild representations

theorem; missing; BH17 §3.2 Proposition p.931.

If σ|P_F is irreducible and K/F is finite tame with index e, σ_K=σ|W_K is irreducible and Σ_{σ_K}(ex)=eΣ_σ(x) for x≥0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/tame-filtration; PAPER-BUSHNELL-HENNIART-17/sigma; PAPER-BUSHNELL-HENNIART-17/swan-step-sum; PAPER-BUSHNELL-HENNIART-17/totally-wild-weil.

1. Irreducibility follows already on P_K=P_F. Fixed dimensions agree at rescaled depths and Swan scales by e.

Open frontiers: G2.

### sigma-tail — Tail agreement of decomposition functions

theorem; missing; BH17 §3.4 Proposition p.932.

For irreducible σ,τ and δ=Δ(σ,τ), Σ_σ(x)=Σ_τ(x) for all x≥δ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/normalized-hom; PAPER-BUSHNELL-HENNIART-17/sigma-shape; PAPER-BUSHNELL-HENNIART-17/swan-step-sum.

1. Normalized commutant dimensions agree above δ. Their finite-step integrals from x to the identity tail agree; use continuity at x=δ.

Open frontiers: G2.

### hereditary-order — Hereditary orders, radicals and periods

definition; missing; BH17 notation p.924; BH96 §1 pp.111–112.

For finite-dimensional nonzero F-vector space V, a hereditary O_F-order a in End_F(V) is the stabilizer order of an O_F-lattice chain; write p_a=rad(a) and e_a>0 for p_F a=p_a^{e_a}. For a field E⊆End_F(V), a is E-pure when E× normalizes a.

Dependencies: PAPER-BUSHNELL-HENNIART-17/local-fields; PAPER-BUSHNELL-HENNIART-17/unit-filtration.

1. Construct the lattice-chain carrier and its order; prove the radical and period identities. This algebraic input is part of the GL_n simple-character branch.

API `hereditaryOrder_period` (data): Return p_a and e_a with p_F a=p_a^{e_a}.

API `pureOrder_normalizes` (characterisation): E-purity is E×-normalization of a.

API `pureOrder_relativePeriod` (compatibility): For b=a∩End_E(V), e_a=e(E/F)e(b/O_E).

Use §4.3: Normalize the recursion jumps.

Use §5.1: Normalize the first intertwining depth.

Test `hereditary_order_test_1` (non-example): For M_n(O_F), e_a=1, not n.

Test `hereditary_order_test_2` (compatibility): A complete lattice-chain order in M_n(F) has period n.

Test `hereditary_order_test_3` (compatibility): Changing the realization rescales levels by its period.

Open frontiers: G3.

### critical-exponent — Critical exponent and simple strata

definition; missing; BH17 notation, §4.2; BH96 §1 (1.3)–(1.5), printed p.112, scan checked.

For E=F[β] a field normalizing a, set a_β(x)=βx−xβ. If β∈F, k_0(β,a)=−∞; otherwise k_0 is the least integer k with p_a^k∩a_β(End_F(V))⊆a_β(a). A simple stratum [a,n,r,β] has n=−v_a(β)>r≥0 and r<−k_0(β,a).

Dependencies: PAPER-BUSHNELL-HENNIART-17/hereditary-order.

1. Use the image-lattice characterization from BH96; prove its equivalence with the BK93 definition before using recursion. The parameter field on the GL side is not silently assumed separable.

API `simpleStratum_level` (projection): βa=p_a^{−n} and n/e_a=−v_E(β)/e(E/F).

API `criticalExponent_scalar` (simp): k_0(β,a)=−∞ for β∈F.

API `criticalExponent_realization` (compatibility): k_0(β,a)=e(b/O_E) k_F(β), where k_F uses End_F(E).

Use §4.3: Terminate approximation by decreasing field degree.

Use §7.4: Compute the actual level after scalar twisting.

Test `critical_exponent_test_1` (computation): A maximal order has n=−v_E β when E/F is unramified.

Test `critical_exponent_test_2` (compatibility): Central translation leaves a_β unchanged but can change n.

Test `critical_exponent_test_3` (compatibility): The bound on r is strict.

Open frontiers: G3.

### stratum-equivalence — Equivalence of strata

definition; missing; BH17 §4.3 and §5.3; BH96 §1 pp.113–114.

Strata [a,n,r,β] and [a,n,r,γ] are equivalent when β−γ∈p_a^{−r}; realization of a simple pair [k,β] uses n=−e(b/O_E)v_Eβ and floor(r/e(b/O_E))=k.

Dependencies: PAPER-BUSHNELL-HENNIART-17/critical-exponent.

1. Keep the floor in the simple-pair realization; it is not an equality of unscaled integers.

API `stratumEquivalent_iff` (characterisation): Equivalence is β−γ∈p_a^{−r} for the common a,n,r.

API `simplePair_realization` (constructor): Construct a stratum from an E-pure lattice chain with the required floor relation.

API `stratumEquivalent_mono` (relation): Equivalence at r implies equivalence at every larger admissible truncation index.

Use §4.3: Choose the approximation γ at a critical jump.

Use §5.3: Perturb a character by an additive parameter.

Test `stratum_equivalence_test_1` (computation): At r=0 the difference is integral in a.

Test `stratum_equivalence_test_2` (compatibility): A floor relation permits several consecutive r values.

Test `stratum_equivalence_test_3` (non-example): No equivalence between orders of different periods is asserted without transfer.

Open frontiers: G3.

### simple-characters — Simple-character groups and character sets

construction; missing; BH17 notation p.924; BH96 §7, pp.145–146.

A simple stratum [a,n,0,β] and a level-one additive ψ_F (trivial on p_F, nontrivial on O_F) determine the BK groups H^1(β,a)⊆U_a^1 and nonempty finite C(a,β,ψ_F). Put H^k=H^1∩U_a^k; C(a,r,β) consists of restrictions to H^{r+1}, 0≤r<n.

Dependencies: PAPER-BUSHNELL-HENNIART-17/critical-exponent; PAPER-BUSHNELL-HENNIART-17/stratum-equivalence.

1. Supply the recursive BK construction, beginning with the minimal-parameter determinant and ψ_β clauses read in BH96 §7. The full nonminimal recursion and independence still require BK93.

API `simpleCharacter_restrict` (functoriality): Restriction C(a,r,β)→C(a,s,β) is defined for r≤s<n.

API `simpleCharacter_minimal_highDepth` (simp): For minimal β and r≥floor(n/2), H^{r+1}=U_a^{r+1} and the unique character is 1+x↦ψ_F(tr(βx)).

API `simpleCharacter_nonempty` (constructor): For a simple stratum the character set is finite and nonempty.

Use §5.1: Measure the first depth where two characters intertwine.

Use §7.4: Multiply by a determinant character.

Test `simple_characters_test_1` (degenerate): For GL_1(Q_2), n=1 gives the unique nontrivial character of U^1/U^2.

Test `simple_characters_test_2` (computation): Keep the plus one in H^{r+1}.

Test `simple_characters_test_3` (compatibility): A higher-depth restriction can forget the original endo-class.

Open frontiers: G3.

### character-transfer — Transfer and potential simple characters

construction; missing; BH17 notation and §4.2; BH96 §8 (8.1)–(8.2), pp.151–152.

For realizations of a fixed simple pair, canonical transfer bijections between their simple-character sets satisfy identity and composition. A potential simple character is an equivalence class under these transfers, with a unique realization on each allowed order.

Dependencies: PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/stratum-equivalence.

1. BH96 states the transfer identities, using BK93 (3.6.14). Do not replace this input by arbitrary choices of bijections.

API `simpleCharacterTransfer_id` (simp): Transfer from an order to itself is identity.

API `simpleCharacterTransfer_comp` (functoriality): Transfer a→c is the composite a→b→c.

API `potentialSimpleCharacter_realize` (projection): A potential simple character has the specified realization on every compatible order.

Use §4.2: Define realization-independent invariants.

Use §5.2: Define endo-classes of truncations.

Test `character_transfer_test_1` (compatibility): Transfer around a three-order cycle is identity.

Test `character_transfer_test_2` (non-example): The same parameter with different periods uses the normalized simple-pair index.

Test `character_transfer_test_3` (non-example): An arbitrary family of characters is not a potential simple character.

Open frontiers: G3.

### endo-class — Endo-classes, including the trivial class

definition; missing; BH17 §4.2 p.933; BH96 §8 (8.6)–(8.10), pp.154–157.

Potential simple characters are endo-equivalent when compatible realizations intertwine in a common general linear group. This is an equivalence relation; let E(F) be its quotient for untruncated characters, augmented by 0 represented on a by the trivial U_a^1-character.

Dependencies: PAPER-BUSHNELL-HENNIART-17/character-transfer.

1. Use transfer invariance of intertwining and its transitivity (BH96 §8); simple isomorphism classes on one order are not the quotient.

API `endoClass_realize` (constructor): Choose a realization θ∈C(a,β) of a nontrivial endo-class.

API `endoClass_eq_iff_intertwines` (characterisation): Equality is tested by intertwining compatible realizations.

API `endoClass_zero_realization` (simp): 0 is represented on every a by the trivial character of U_a^1.

Use §5.1: Build A on the quotient.

Use §6.1: Define the first ramification bijection.

Test `endo_class_test_1` (non-example): Transfer does not change the endo-class.

Test `endo_class_test_2` (compatibility): Conjugate realizations have the same class.

Test `endo_class_test_3` (degenerate): 0 is present even though a positive-level simple stratum is used for nontrivial classes.

Open frontiers: G3.

### endo-invariants — Degree, level and critical invariant of an endo-class

construction; missing; BH17 §4.2 (4.2.1)–(4.2.3) p.933; BH96 (8.11).

For θ∈C(a,β) of endo-class Θ≠0, deg Θ=[F[β]:F], e_Θ=e(F[β]/F), f_Θ=f(F[β]/F), m_Θ=n/e_a and k_0(Θ)=k_0(β,a)/e_a are independent of the realization and ψ_F. For 0, deg=e=f=1 and m=0; for degree one k_0=−∞.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-class; PAPER-BUSHNELL-HENNIART-17/critical-exponent.

1. Descend the invariants through intertwining and transfer using BH96 §8; preserve the extended value −∞.

API `endoInvariants_zero` (simp): deg 0=e_0=f_0=1 and m_0=0.

API `endoDegree_eq_ef` (relation): deg Θ=e_Θ f_Θ.

API `endoLevel_realization` (compatibility): For any realization [a,n,0,β], m_Θ=n/e_a.

Use §4.4: Locate the identity tail of Φ.

Use §7.7: Recognize essential tameness from e_Θ.

Test `endo_invariants_test_1` (computation): An unramified degree-n parameter has e_Θ=1 even if deg Θ=n.

Test `endo_invariants_test_2` (computation): Two periods 1 and 2 give levels n and 2n with the same m.

Test `endo_invariants_test_3` (computation): For degree>1, 0<−k_0(Θ)≤m_Θ.

Open frontiers: G3.

### minimal-parameter — Minimal field generators

definition; missing; BH17 §4.1 p.932.

For E=F[β], m=−v_Eβ>0, β is minimal over F when gcd(m,e(E/F))=1 and the residue of β^e π_F^m generates k_E/k_F.

Dependencies: PAPER-BUSHNELL-HENNIART-17/local-fields.

1. State minimality on the parameter field; the residue expression is a unit because its valuation is zero.

API `minimalParameter_residue` (projection): The normalized unit β^eπ_F^m generates the residue extension.

API `minimalParameter_coprime` (projection): gcd(m,e)=1.

API `minimalParameter_totallyRamified` (constructor): In a totally ramified degree-b extension, an element of valuation −a with gcd(a,b)=1 is minimal.

Use §4.1: Evaluate the conductor-volume exponent.

Use §4.2: Realize any positive rational normalized level.

Test `minimal_parameter_test_1` (degenerate): Scalar β with negative valuation is minimal since e=1 and the residue extension is trivial.

Test `minimal_parameter_test_2` (compatibility): For totally ramified E/F the residue-generation condition is automatic.

Test `minimal_parameter_test_3` (compatibility): A common divisor of m and e prevents minimality.

### tame-corestriction — Tame corestriction and commutator exact sequence

construction; missing; BH17 §4.1 p.932; BK93 §1.3 cited there.

For E=F[β]⊆A=End_F(E) and its E-pure order, a tame corestriction s_{E/F}:A→E, with the BK lattice normalization, gives the exact sequence 0→E→A→^{a_β}A→^{s_{E/F}}E→0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/critical-exponent.

1. Specify the E-bimodule map and the lattice normalization from BK93; a field trace alone is not the construction for inseparable parameter fields. This exact supplier remains open.

API `corestriction_exact` (relation): ker a_β=E, im a_β=ker s, and s is onto.

API `corestriction_lattice` (compatibility): The chosen normalization sends the hereditary-order lattice to O_E as in BK93.

API `corestriction_parameter_change` (functoriality): Transport along an isomorphism of the parameter algebra carries the exact sequence and lattice normalization.

Use §4.1: Define C(β) by exact lattice volumes.

Use §5.3: Lift a perturbation from the centralizer.

Test `tame_corestriction_test_1` (degenerate): For E=F, a_β=0 and the sequence reduces to the scalar case.

Test `tame_corestriction_test_2` (non-example): Arbitrary scaling of s is not silently allowed.

Test `tame_corestriction_test_3` (non-example): Purely inseparable parameters require the corestriction construction, not a nonzero trace assumption.

Open frontiers: G3, G4.

### volume-exponent — Conductor-volume exponent

definition; missing; BH17 §4.1 (4.1.1) p.932.

For exact O_F-lattices 0→l→M→^{a_β}M′→^s l′→0 define C(β)=μ_E(l)μ_A(M′)/(μ_E(l′)μ_A(M)); with tame-corestriction normalization this is choice-independent and equals q^{c(β)} for an integer c(β).

Dependencies: PAPER-BUSHNELL-HENNIART-17/tame-corestriction; PAPER-BUSHNELL-HENNIART-17/exact-lattice-comparison.

1. Apply exact-lattice-comparison to the fixed corestriction complex. Its explicit proof gives choice independence, positive Haar-rescaling invariance and a unique integral exponent without reading BHK98 as a black box.

2. The existence and normalization of the tame-corestriction map and existence of an exact full lattice subcomplex remain the BK93 supplier in G3/G4. Independence under changing admissible normalized corestrictions must still be checked in that source; arbitrary scalar rescaling is false.

API `conductorVolume_changeLattice` (compatibility): Replacing the exact lattice sequence leaves C(β) unchanged.

API `conductorVolume_changeMeasure` (relation): Rescaling either Haar measure cancels between numerator and denominator.

API `conductorVolume_eq_pow` (characterisation): There is a unique integer c(β) with C(β)=q^{c(β)}.

Use §4.4: Supply the intercept c/d² of Φ.

Use §8.4: Compute the degree-p initial value.

Test `conductorVolume_scalar_normalized` (degenerate): For E=F with corestriction the identity, the scalar complex gives c(β)=0.

Test `conductorVolume_measure_rescale` (compatibility): For λ_E,λ_A>0, replacing μ_E,μ_A by λ_Eμ_E,λ_Aμ_A leaves C(β) equal to its old value.

Test `conductorVolume_nonunit_corestriction` (non-example): For E=F, replacing the last identity map by multiplication by a uniformizer produces C=q; fixed-map lattice independence does not authorize this change of corestriction.

Open frontiers: G4.

### minimal-volume — Volume exponent of a minimal parameter

theorem; missing; BH17 §4.1 Proposition p.933.

If β is minimal, m=−v_Eβ, e=e(E/F), f=f(E/F), then c(β)=m f(ef−1).

Dependencies: PAPER-BUSHNELL-HENNIART-17/minimal-parameter; PAPER-BUSHNELL-HENNIART-17/volume-exponent; PAPER-BUSHNELL-HENNIART-17/lattice-dilation.

1. The exact integral complex 0→O_E→a→βa→βO_E→0 is the BK93 (1.4.15) supplier quoted in BH17, not established here. Also require the E-pure order a to be a full left O_E-lattice in A; for the standard E-lattice-chain realization O_E multiplication preserves each chain member.

2. Put d=[E:F]=ef. Since A=End_F(E) has F-dimension d², its left E-dimension is d. Thus a has O_E-rank d, whereas O_E has rank one.

3. Apply lattice-dilation with ranks d and 1: μ_A(βa)/μ_A(a)=q_F^(mfd), and μ_E(βO_E)/μ_E(O_E)=q_F^(mf). Their quotient is C(β)=q_F^(mf(d−1)).

4. Uniqueness of the exponent yields c(β)=mf(ef−1). This supplies the full arithmetic of the printed short calculation, conditional on the exact normalized BK lattice complex; it does not close the approximation/gluing theorem.

Test `minimalVolume_scalar` (degenerate): For e=f=1, c=0 for every positive m.

Test `minimalVolume_totally_ramified_quadratic` (computation): For e=2,f=1,m=1, the dilation ratio is q_F²/q_F=q_F and c=1.

Test `minimalVolume_unramified_quadratic` (computation): For e=1,f=2,m=1, the dilation ratio is q_F^4/q_F²=q_F² and c=2.

Open frontiers: G4.

### rational-endo-level — Every positive rational occurs as an endo level

theorem; missing; BH17 §4.2 Proposition p.933.

If a,b>0 are coprime, there is Θ with m_Θ=a/b and e_Θ=deg Θ=b.

Dependencies: PAPER-BUSHNELL-HENNIART-17/minimal-parameter; PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/endo-invariants; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

1. Choose a totally ramified degree-b extension and β of valuation −a. On End_F(E) the E-pure order has period b and simple level a. Nonempty C supplies Θ.

Open frontiers: G3.

### approximation — Degree-decreasing simple approximation

theorem; missing; BH17 §4.3 p.934, citing BK93 (2.4.1).

If [a,n,0,β] is nonminimal and r=−k_0(β,a)<n, there is γ with [a,n,r,γ] simple and equivalent to [a,n,r,β], [F[γ]:F]<[F[β]:F], and the next critical level strictly greater than r.

Dependencies: PAPER-BUSHNELL-HENNIART-17/stratum-equivalence; PAPER-BUSHNELL-HENNIART-17/critical-exponent.

1. Import the approximation theorem with its strict degree drop; do not use an unspecified choice of nearby β.

Open frontiers: G3.

### jumps — Normalized jumps of an endo-class

definition; missing; BH17 §4.3 (4.3.1) p.934.

Define S[a,β] recursively: {n} for minimal β, and S[a,γ]∪{r} for the preceding approximation at r. Set S_Θ={s/e_a:s∈S[a,β]}. This is a finite nonempty set of positive rationals for Θ≠0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/approximation; PAPER-BUSHNELL-HENNIART-17/endo-invariants.

1. Well-founded recursion uses strict field-degree drop. Scalar parameters are a base case despite k_0=−∞.

API `endoJumps_minimal` (simp): For minimal β, S_Θ={m_Θ}.

API `endoJumps_recursion` (relation): At r=−k_0, append r/e_a to the approximation jumps.

API `endoJumps_max` (data): max S_Θ=m_Θ; the least jump is m_Θ or −k_0(Θ).

Use §4.4: Partition the affine pieces of Φ.

Use §4.6: Rescale jumps under tame lifting.

Test `jumps_test_1` (computation): Period 1→2 sends unnormalized jump 1→2.

Test `jumps_test_2` (compatibility): The normalized set remains unchanged under transfer.

Test `jumps_test_3` (non-example): Do not attempt max S_0; Φ_0 is defined separately.

Open frontiers: G3.

### jumps-invariance — Independence and correct realization scaling of jumps

theorem; missing; BH17 §4.3 Remark and Lemma p.934, corrected ratio.

S_Θ is independent of θ, ψ_F, β and the realization. For another realization of the same parameter with periods e_a,e_a′, S[a′,β]=(e_a′/e_a)S[a,β].

Dependencies: PAPER-BUSHNELL-HENNIART-17/jumps; PAPER-BUSHNELL-HENNIART-17/critical-exponent; PAPER-BUSHNELL-HENNIART-17/character-transfer.

1. Scale every critical exponent by the relative period, then induct along the approximation chain; use simple-character invariance from BK93 (3.5.4).

Test `jumps_invariance_test_1` (degenerate): A scalar β=π_F^−1 has unnormalized level 1 at period 1 and 2 at period 2; normalized jumps are both {1}.

Open frontiers: G3.

### profile-fields — Piecewise parameter-field profile

construction; missing; BH17 §4.3 Definition (4.3.2) p.934.

For x≥0 outside S_Θ, use γ_x=β below the least jump, γ_x=0 above m_Θ, and otherwise an approximation at t−1 where t/e_a is the next jump above x. Put E_x=F[γ_x], d_Θ(x)=[E_x:F], e_Θ(x)=e(E_x/F), c_Θ(x)=c(γ_x).

Dependencies: PAPER-BUSHNELL-HENNIART-17/jumps; PAPER-BUSHNELL-HENNIART-17/approximation; PAPER-BUSHNELL-HENNIART-17/volume-exponent.

1. Construct on the complement of the jump set; individual fields are choices, whereas their listed numerical invariants descend.

API `endoProfile_initial` (simp): Below min S_Θ the parameter is β.

API `endoProfile_final` (simp): Above m_Θ, E_x=F, d=e=1 and c=0.

API `endoProfile_invariants` (projection): Return d_Θ(x), e_Θ(x), c_Θ(x) with their realization comparisons.

Use §4.4: Compute both slopes and intercepts of Φ.

Use §7.6: Determine the last nontrivial slope.

Test `profile_fields_test_1` (non-example): Do not evaluate a chosen γ_x at an excluded jump.

Test `profile_fields_test_2` (compatibility): Two choices of γ may give nonidentical embeddings but the same numerical invariants.

Test `profile_fields_test_3` (compatibility): The last degree can already be one before m_Θ.

Open frontiers: G3, G4.

### profile-invariance — Profile invariants are intrinsic and locally constant

theorem; missing; BH17 §4.3 Proposition p.934.

The numbers d_Θ(x), e_Θ(x), c_Θ(x) depend only on Θ and x and are constant between successive members of {0,∞}∪S_Θ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-fields; PAPER-BUSHNELL-HENNIART-17/jumps-invariance.

1. Induct through approximations and transport the invariants across equal truncated characters.

Open frontiers: G3, G4.

### phi — Structure function of an endo-class

definition; missing; BH17 §4.4 (4.4.1)–(4.4.2) p.935.

For Θ≠0 and 0<x<m_Θ outside S_Θ put Φ_Θ(x)=c_Θ(x)/d_Θ(x)²+x/d_Θ(x); put Φ_Θ(x)=x for x>m_Θ, and extend continuously. Define Φ_0(x)=x. Its inverse has domain [Φ_Θ(0),∞), not all nonnegative reals unless Φ_Θ(0)=0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-invariance; PAPER-BUSHNELL-HENNIART-17/minimal-volume.

1. The existence of the continuous extension is a theorem below, using BH03 (3.1); it must not be encoded as an assumed field.

API `structureFunction_piece` (simp): On a profile interval Φ(x)=c/d²+x/d.

API `structureFunction_tail` (simp): Φ(x)=x for x≥m_Θ.

API `structureFunction_inverse` (equivalence): Strict increase and the identity tail give an order isomorphism [0,∞)≅[Φ(0),∞).

Use §5.4: Recover the pair conductor.

Use §6.2: Define Ψ only after showing Σ(0)=Φ(0).

Test `phi_test_1` (computation): A minimal degree-p level m/p has Φ(0)=m(p−1)/p².

Test `phi_test_2` (computation): Φ_0 is identity.

Test `phi_test_3` (computation): Calling Φ onto [0,∞) would fail for a wild degree-p example.

Open frontiers: G4.

### phi-continuity — Continuous gluing of the structure function

theorem; missing; BH17 §4.4 Proposition (1) p.935.

The left and right affine limits agree at every jump in S_Θ, so Φ has a unique continuous extension to x≥0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/minimal-volume.

1. Use the conductor-volume transition identity BH03 §3.1 along each approximation; compute the minimal terminal case directly. The exact transition proof is G4.

Open frontiers: G4.

### phi-shape — Convexity and strict increase of Φ

theorem; missing; BH17 §4.4 Proposition (2),(3) p.935.

Φ_Θ is piecewise affine, convex and strictly increasing on [0,∞); its slope on a profile interval is 1/d_Θ(x).

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi-continuity; PAPER-BUSHNELL-HENNIART-17/profile-invariance.

1. Approximation field degrees strictly decrease, so positive reciprocal slopes increase; continuity glues the pieces.

### phi-breaks — Derivative breaks of Φ

theorem; missing; BH17 §4.4 Proposition (4) p.935.

The derivative breaks of Φ are precisely S_Θ, except that m_Θ is not a break if E_x=F immediately below m_Θ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi-shape; PAPER-BUSHNELL-HENNIART-17/jumps.

1. Compare consecutive reciprocal degrees; at the tail the new slope is one.

### phi-same-stratum — Simple characters on one stratum have the same Φ

theorem; missing; BH17 §4.4 Complement (1) p.935.

If θ_i∈C(a,β) have endo-classes Θ_i, then Φ_{Θ_1}=Φ_{Θ_2}.

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/profile-fields.

1. The numerical profile is defined from β.

### endo-dual — Dual simple character and dual endo-class

construction; missing; BH17 §4.4 Complement (2) p.935.

For θ∈C(a,β), θ^−1∈C(a,−β); its class Θ∨ is independent of realization and satisfies (Θ∨)∨=Θ and Φ_{Θ∨}=Φ_Θ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-class; PAPER-BUSHNELL-HENNIART-17/phi.

1. Negate parameters through the character recursion and its transfers; valuations and volume exponents do not change.

API `endoDual_realize` (constructor): The inverse character on H^1 realizes Θ∨ with parameter −β.

API `endoDual_involutive` (simp): Dualizing twice returns Θ.

API `structureFunction_endoDual` (compatibility): Φ_{Θ∨}=Φ_Θ.

Use §5.4: Use the contragredient in the pair conductor.

Use §6.1: Match Weil duality through LLC.

Test `endo_dual_test_1` (degenerate): The trivial class is self-dual.

Test `endo_dual_test_2` (non-example): Duality does not change normalized level.

Test `endo_dual_test_3` (non-example): The pair conductor uses π_1∨×π_2, not π_1×π_2.

Open frontiers: G3.

### phi-truncation-tail — Agreement of Φ after intertwining truncations

theorem; missing; BH17 §4.5 Proposition pp.935–936.

If θ_i∈C(a,β_i) intertwine after restriction to H^{t+1}(β_i,a), t≥0, then Φ_{Θ_1}(x)=Φ_{Θ_2}(x) for x≥t/e_a.

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/stratum-equivalence; PAPER-BUSHNELL-HENNIART-17/character-transfer.

1. Replace parameters by compatible approximations at t and invoke intertwining-implies-conjugacy to identify the later profiles.

Open frontiers: G3.

### tame-endo-lift — Tame lifts of endo-classes

construction; missing; BH17 §§4.6,5.5,7.1; BH96 §9 (9.7)–(9.13) pp.160–163.

For finite tame K/F, the BH96 transfer/restriction construction assigns a finite nonempty set of K/F-lifts of Θ∈E(F), independent of realizations. Lifts compose in towers; for Galois K/F they form a Gal(K/F)-orbit.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-class; PAPER-BUSHNELL-HENNIART-17/character-transfer.

1. Build lifts by E⊗_F K factors and the simple-character restriction/transfer construction; import injectivity and conjugacy from BH96 (9.8),(9.12).

API `endoLift_nonempty` (constructor): Every Θ has at least one K/F-lift.

API `endoLift_tower` (functoriality): L/K/F lifting equals composition of the two lifting operations.

API `endoLift_galoisOrbit` (characterisation): For Galois K/F, the lifts are one Gal(K/F)-orbit.

Use §5.5: Express A by a minimum over lifts.

Use §7.1: Reduce Ψ calculations to totally wild classes.

Test `tame_endo_lift_test_1` (degenerate): The trivial class lifts only to the trivial class.

Test `tame_endo_lift_test_2` (compatibility): A non-totally-wild class can have several lifts.

Test `tame_endo_lift_test_3` (non-example): A fixed choice of lift is not declared canonical in the general case.

Open frontiers: G3.

### totally-wild-endo — Totally wild endo-class

definition; missing; BH17 §4.6 p.936 and §7.1 Remark p.945.

An endo-class Θ is totally wild when e_Θ=deg Θ=p^r for some r≥0; equivalently its parameter field is totally wildly ramified. Under every finite tame K/F it has a unique lift, still totally wild of the same degree.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-invariants; PAPER-BUSHNELL-HENNIART-17/tame-endo-lift.

1. Use the tame parameter field and the E⊗K factors; degree one is included.

API `totallyWild_iff` (characterisation): e_Θ=deg Θ and that common value is a power of p.

API `totallyWild_uniqueTameLift` (constructor): Select the unique K/F-lift when Θ is totally wild.

API `totallyWild_tameLift_degree` (compatibility): Tame lifting preserves its p-power degree.

Use §7.5: State interpolation with a single Θ_K.

Use §8.4: Analyze degree-p classes.

Test `totally_wild_endo_test_1` (degenerate): Degree one is totally wild in this convention.

Test `totally_wild_endo_test_2` (non-example): An unramified parameter of degree>1 is not totally wild.

Test `totally_wild_endo_test_3` (non-example): Being of p-power degree alone is insufficient.

Open frontiers: G3.

### phi-tame — Tame scaling of Φ for totally wild classes

theorem; missing; BH17 §4.6 Proposition, Lemma and (4.6.1)–(4.6.2), pp.936–937.

For totally wild Θ and finite tame K/F with e=e(K/F), S_{Θ_K}=eS_Θ, d_{Θ_K}(ex)=d_Θ(x), and Φ_{Θ_K}(x)=eΦ_Θ(x/e).

Dependencies: PAPER-BUSHNELL-HENNIART-17/totally-wild-endo; PAPER-BUSHNELL-HENNIART-17/profile-invariance; PAPER-BUSHNELL-HENNIART-17/phi-shape.

1. On compatible orders prove equality of unnormalized jump sets by induction along β.

2. Compare rescaled degrees, giving derivative (eΦ_Θ(x/e))′=Φ′_Θ(x/e)=Φ′_{Θ_K}(x).

3. The difference is constant and vanishes on the identity tail.

Open frontiers: G3.

### endo-distance — Intertwining distance on endo-classes

definition; missing; BH17 §5.1 (5.1.1) p.937.

Realize Θ_1,Θ_2 on a common hereditary order a and let l≥0 be the least integer at which their restrictions to H^{l+1} intertwine. Define A(Θ_1,Θ_2)=l/e_a, allowing the trivial U_a^1-character to represent 0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-class; PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/character-transfer.

1. Use existence of common-order realizations and eventual triviality. Independence is a separate theorem.

API `endoDistance_realization` (compatibility): A=l/e_a on any common realization.

API `endoDistance_zeroClass` (simp): A(Θ,0)=m_Θ.

API `endoDistance_lt_iff_truncate` (characterisation): For ε>0, A(Θ,Υ)<ε iff their ε-truncated endo-classes agree.

Use §5.4: Evaluate the conductor profile at A.

Use §6.4: Compare metric balls with Δ.

Test `endo_distance_test_1` (compatibility): Changing e_a by a factor c changes the first intertwining integer by c.

Test `endo_distance_test_2` (degenerate): Equal classes have distance zero.

Test `endo_distance_test_3` (compatibility): At l/e_a the restrictions on H^l can still differ.

Open frontiers: G3.

### endo-distance-well-defined — Independence of the intertwining distance

theorem; missing; BH17 §5.1 Proposition p.938.

A is independent of all common realizations, additive characters and transfer choices.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-distance; PAPER-BUSHNELL-HENNIART-17/character-transfer; PAPER-BUSHNELL-HENNIART-17/stratum-equivalence.

1. Use transfer invariance of the first normalized intertwining depth, including the floor/period comparison.

Open frontiers: G3.

### endo-distance-basic — Distance to zero and unequal-level formula

theorem; missing; BH17 §5.1 Proposition p.938.

A(Θ,0)=m_Θ. If m_Θ≠m_Υ then A(Θ,Υ)=max(m_Θ,m_Υ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-distance-well-defined; PAPER-BUSHNELL-HENNIART-17/endo-invariants.

1. At the deeper of the two final nontrivial restrictions, only one character is nontrivial.

### endo-distance-metric — Separation and ultrametric inequality for A

theorem; missing; BH17 §5.1 Theorem p.938.

A(Θ,Υ)=0 iff Θ=Υ; A is symmetric and A(Θ,Ξ)≤max(A(Θ,Υ),A(Υ,Ξ)).

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-distance-well-defined; PAPER-BUSHNELL-HENNIART-17/endo-class.

1. Put all three classes on a common order and use transitivity of intertwining of truncated simple characters.

Open frontiers: G3.

### phi-distance-tail — Tail agreement at the endo-distance

theorem; missing; BH17 §5.1 Corollary p.938.

Φ_Θ(x)=Φ_Υ(x) whenever x≥A(Θ,Υ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-distance; PAPER-BUSHNELL-HENNIART-17/phi-truncation-tail.

1. Apply the truncation-tail theorem at the least intertwining level.

### truncation — Real-index truncation of endo-classes

construction; missing; BH17 §5.2 pp.938–939.

For ε>0 and a realization θ on period e_a put t=ceil(e_a ε)−1, so t/e_a<ε≤(t+1)/e_a. Restrict θ to H^{t+1}; its truncated endo-class tc_ε(Θ) is independent of realization, with the trivial high-depth case treated explicitly.

Dependencies: PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/character-transfer; PAPER-BUSHNELL-HENNIART-17/endo-distance-well-defined.

1. The strict left inequality fixes the ceiling convention. Descend restriction through transfer and endo-equivalence.

API `endoTruncation_level` (data): The integer t satisfies t<e_a ε≤t+1.

API `endoTruncation_eq_iff` (characterisation): tc_ε(Θ)=tc_ε(Υ) iff A(Θ,Υ)<ε.

API `endoTruncation_trans` (functoriality): Further truncation to a larger real depth factors through the smaller-depth truncation.

Use §6.5: Parametrize a truncated class by a ramification orbit and an index.

Use §5.3: Separate agreement at H^{k+1} from disagreement at H^k.

Test `truncation_test_1` (computation): If e_a ε=k is integral, t=k−1.

Test `truncation_test_2` (computation): If k<e_a ε<k+1, t=k.

Test `truncation_test_3` (degenerate): At ε=m_Θ the deepest nontrivial restriction is retained.

Open frontiers: G3.

### truncation-balls — Strict balls are truncated endo-classes

theorem; missing; BH17 §5.2 Proposition p.939.

For ε>0, A(Θ,Υ)<ε iff tc_ε(Θ)=tc_ε(Υ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/truncation; PAPER-BUSHNELL-HENNIART-17/endo-distance.

1. For the integral intertwining threshold l, l/e_a<ε iff l≤ceil(e_a ε)−1.

### perturbation — Interior-depth perturbation of a simple character

theorem; missing; BH17 §5.3 helper Lemma p.939, corrected range.

For [a,m,0,β] and θ∈C(a,β), and 1≤k<m, the corrected helper produces [a,m,0,β′] and θ′∈C(a,β′) with H^k unchanged, θ′=θ on H^{k+1}, and no intertwining on H^k. The printed inclusion of k=m is false in general.

Dependencies: PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/approximation; PAPER-BUSHNELL-HENNIART-17/tame-corestriction.

1. Reduce to a stratum simple at k−1; choose a simple centralizer stratum at k and lift its parameter by corestriction.

2. Multiply by ψ_a and apply BK94 §2.8 nonintertwining. The strict k<m keeps the original top level from cancellation.

3. G5 still asks for the full hypotheses of the cited perturbation theorem.

Test `perturbation_test_1` (degenerate): Over Q_2 in GL_1 at m=k=1, the unique nontrivial character of U^1/U^2 admits no distinct same-level character; the corrected strict range excludes this.

Open frontiers: G5.

### endo-density — Density of endo-distances

theorem; missing; BH17 §5.3 Density Lemma p.939.

For fixed Θ, {A(Θ,Υ):Υ∈E(F)} is dense in [0,∞).

Dependencies: PAPER-BUSHNELL-HENNIART-17/perturbation; PAPER-BUSHNELL-HENNIART-17/rational-endo-level; PAPER-BUSHNELL-HENNIART-17/endo-distance-basic.

1. Above m_Θ use rational-level classes. Below m_Θ choose realizations with arbitrarily divisible periods and use k/e_a with 1≤k<m.

2. The omitted endpoint k=m is unnecessary: approach m_Θ by the two open ranges. For Θ=0 the rational-level construction alone suffices.

Open frontiers: G5.

### cuspidal-endo — Endo-class of a cuspidal representation

construction; missing; BH17 §5.4 p.940, citing BH13; BH14 §6.3.

Every irreducible smooth complex cuspidal representation π of GL_n(F) contains a simple character, unique up to GL_n(F)-conjugacy. Its endo-class Θ_π is therefore well defined; every endo-class occurs for some cuspidal representation.

Dependencies: SmoothRepresentationsOfLocalGroups:SR.3; PAPER-BUSHNELL-HENNIART-17/endo-class.

1. Import the GL_n simple-character existence and intertwining theorem, rather than the tame-residue-characteristic Yu exhaustiveness theorem.

API `cuspidalEndoClass` (projection): Return the class of any simple character contained in π.

API `cuspidalEndoClass_independent` (characterisation): All simple characters occurring in π give the same class.

API `cuspidalEndoClass_surjective` (constructor): For every Θ there is a cuspidal π with Θ_π=Θ.

Use §5.4: Make conductors into functions on endo-classes.

Use §6.1: State the first ramification theorem.

Test `cuspidal_endo_test_1` (degenerate): Depth-zero cuspidals have the trivial endo-class.

Test `cuspidal_endo_test_2` (compatibility): The GL_n rank can exceed deg Θ_π.

Test `cuspidal_endo_test_3` (compatibility): Residue characteristic dividing n is allowed.

Open frontiers: G3, G6.

### pair-epsilon — Rankin–Selberg local constants

construction; planned; BH17 §5.4 p.940.

For complex cuspidal π_i of GL_{n_i}(F), ε(π_1×π_2,s,ψ) is a monomial in q^−s of degree n_1n_2 c(ψ)+Ar(π_1×π_2), with the additive-character convention fixed; Ar is independent of ψ.

Dependencies: AutomorphicLFunctionsAndLocalFactors:AL.3; SmoothRepresentationsOfLocalGroups:SR.3.

Existing stages: AutomorphicLFunctionsAndLocalFactors:AL.3.

1. Import the normalized local factors and the conductor exponent, with the contragredient convention explicit.

API `pairArtinExponent` (data): Extract the integer Ar after subtracting n_1n_2 c(ψ).

API `pairEpsilon_changeAdditive` (compatibility): Changing ψ alters the known additive-character term, not Ar.

API `pairEpsilon_isomorphic` (functoriality): Isomorphic representations have equal factors.

Use §5.4: Define pair Swan.

Use §6.1: Use LLC compatibility of local constants.

Test `pair_epsilon_test_1` (compatibility): The rank-one normalization agrees with Tate factors.

Test `pair_epsilon_test_2` (non-example): Do not confuse the exponent with the entire epsilon constant.

Test `pair_epsilon_test_3` (computation): Switching π_1 to its dual changes the pair under consideration.

### pair-swan — Swan exponent on the GL side

definition; missing; BH17 §5.4 p.940.

Let d(π_1,π_2) be the number of unramified χ with χπ_1≅π_2∨; set sw(π_1×π_2)=Ar(π_1×π_2)−n_1n_2+d(π_1,π_2). The count vanishes if n_1≠n_2.

Dependencies: PAPER-BUSHNELL-HENNIART-17/pair-epsilon; AutomorphicLFunctionsAndLocalFactors:AL.1.

1. Construct and prove finiteness of the unramified self-twist count; retain it in the equal-rank case.

API `pairSwan_def` (simp): sw=Ar−n_1n_2+d in the stated dual convention.

API `unramifiedTwistCount_rank_ne` (simp): Unequal ranks imply d=0.

API `pairSwan_normalized` (data): Normalize by n_1n_2 only for the separate pairing ς.

Use §5.4 Conductor formula: Relate the pair to Φ(A).

Use §6.1: Identify the inertia-invariant correction with the Galois Artin–Swan difference.

Test `pair_swan_test_1` (degenerate): For the trivial rank-one pair, Ar=0 and d=1 give sw=0.

Test `pair_swan_test_2` (compatibility): Dropping d would give a negative value in that test.

Test `pair_swan_test_3` (non-example): Unequal ranks remove only d, not the Artin exponent.

### gl-conductor — Explicit GL_n conductor formula

theorem; missing; BH17 §5.4 (5.4.1) p.940; BHK98 Theorem 6.5 cited.

For cuspidal π_i and Θ_i=Θ_{π_i}, sw(π_1∨×π_2)/(n_1n_2)=Φ_{Θ_1}(A(Θ_1,Θ_2))=Φ_{Θ_2}(A(Θ_1,Θ_2)).

Dependencies: PAPER-BUSHNELL-HENNIART-17/pair-swan; PAPER-BUSHNELL-HENNIART-17/cuspidal-endo; PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/endo-distance.

1. Reformulate BHK98 Theorem 6.5 in normalized endo-class language. The attempted publisher download returned a journal listing, not this article; the original proof is not credited as read.

Open frontiers: G6.

### gl-level-swan — Normalized Swan equals endo level

theorem; missing; BH17 §5.4 (5.4.2) p.940.

For cuspidal π of GL_n(F), sw(π)/n=m_{Θ_π}.

Dependencies: PAPER-BUSHNELL-HENNIART-17/gl-conductor; PAPER-BUSHNELL-HENNIART-17/endo-distance-basic; PAPER-BUSHNELL-HENNIART-17/phi.

1. Take the second representation to be the trivial GL_1-character and use the identity tail.

### phi-unique — Conductor characterization of Φ

theorem; missing; BH17 §5.4 Proposition p.940.

For fixed Θ and any cuspidal π with Θ_π=Θ, Φ_Θ is the unique continuous function on [0,∞) taking A(Θ,Θ_ρ) to sw(π∨×ρ)/(gr π·gr ρ) for every cuspidal ρ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/gl-conductor; PAPER-BUSHNELL-HENNIART-17/endo-density; PAPER-BUSHNELL-HENNIART-17/cuspidal-endo.

1. Every endo-class occurs; the prescribed arguments are dense. Apply continuity.

### endo-pair-ultrametric — Ultrametric inequality for the endo-class conductor pairing

theorem; missing; BH17 §5.4 Corollary p.941.

The pairing ς(Θ,Υ)=Φ_Θ(A(Θ,Υ)) is symmetric and obeys ς(Θ,Ξ)≤max(ς(Θ,Υ),ς(Υ,Ξ)); it need not vanish on the diagonal.

Dependencies: PAPER-BUSHNELL-HENNIART-17/gl-conductor; PAPER-BUSHNELL-HENNIART-17/phi-shape; PAPER-BUSHNELL-HENNIART-17/endo-distance-metric.

1. Choose the larger comparison distance and apply the profile based at the corresponding common class.

### endo-distance-tame — Tame minimum formula for A

theorem; missing; BH17 §5.5 Proposition p.941.

For finite tame K/F of ramification index e and all lifts Θ_i,Υ_j, e A_F(Θ,Υ)=min_{i,j}A_K(Θ_i,Υ_j)=min_j A_K(Θ_1,Υ_j) for any fixed lift Θ_1.

Dependencies: PAPER-BUSHNELL-HENNIART-17/tame-endo-lift; PAPER-BUSHNELL-HENNIART-17/endo-distance.

1. BH96 (9.8) gives one inequality for every pair of lifts; (9.12) gives a conjugate lift attaining equality. The original statements were read, but their recursive proof chain remains G3.

Open frontiers: G3.

### llc-char0 — Classical complex local Langlands in characteristic zero

theorem; planned; BH17 §6.1 (6.1.1) pp.941–942.

For F finite over Q_p, the classical LLC bijects cuspidal complex GL_n(F)-representations with n-dimensional irreducible complex Weil representations, respects duals and character twists, and preserves epsilon factors of pairs in the chosen normalization.

Dependencies: EndoscopicTransferAndUnitaryTraceComparison:ET.6; PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/pair-epsilon.

Existing stages: EndoscopicTransferAndUnitaryTraceComparison:ET.6.

1. Import ET.6’s independent classical correspondence and its normalization dictionary. Its existence is planned, not supplied by the pinned libraries.

### llc-charp — Equal-characteristic complex LLC and pair factors

theorem; missing; BH17 §6.1; ES7 equal-characteristic source interface.

For F≅F_q((t)), supply the same cuspidal/irreducible complex bijection with dimension, dual, character-twist and epsilon-of-pairs compatibility; make the coefficient transport from the ℓ-adic realization explicit.

Dependencies: ExcursionOperatorsAndSpectralAction:ES7:equal-characteristic; PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/pair-epsilon; FunctionFieldArithmetic:FA.4.

1. Use the separately owned ES7 equal-characteristic classical realization and its LRS/Hausberger suppliers.

2. Prove the complex coefficient dictionary and pair-factor normalization before using it here; the semisimple excursion parameter alone does not supply these equalities.

Open frontiers: G7.

### llc-swan — Swan compatibility of LLC

theorem; missing; BH17 §6.1 (6.1.2) p.942.

For cuspidal π,ρ over either allowed F, sw(π×ρ)=sw(Lπ⊗Lρ), hence their normalized conductors agree after dividing by ranks/dimensions.

Dependencies: PAPER-BUSHNELL-HENNIART-17/llc-char0; PAPER-BUSHNELL-HENNIART-17/llc-charp; PAPER-BUSHNELL-HENNIART-17/pair-swan; PAPER-BUSHNELL-HENNIART-17/swan.

1. Compare epsilon exponents and identify the unramified twist count with the inertia-invariant term. Handle the two characteristics through their separate suppliers.

Open frontiers: G7.

### first-ramification — First ramification bijection

construction; missing; BH17 §6.1 First ramification theorem p.942; BH14 §§6.1–6.2 pp.41–42.

The W_F-orbit LΘ=[Lπ;0]^+ depends only on Θ=Θ_π. This defines a canonical bijection E(F)≅W_F\Irr(P_F), compatible with field isomorphisms and tame lifting.

Dependencies: PAPER-BUSHNELL-HENNIART-17/cuspidal-endo; PAPER-BUSHNELL-HENNIART-17/ramification-orbit; PAPER-BUSHNELL-HENNIART-17/llc-char0; PAPER-BUSHNELL-HENNIART-17/llc-charp.

1. Use BH03 §8.2 with the repair acknowledged in BH17 §2.1; BH14 §6.1 restates the bijection and §6.2 proves the tame square using automorphic induction. Its full proof dependencies remain open.

API `endoWildEquiv` (equivalence): A bijection Θ↦LΘ between endo-classes and wild orbits.

API `endoWildEquiv_cuspidal` (compatibility): L(Θ_π) is the wild orbit of the actual LLC parameter of π.

API `endoWildEquiv_tame` (functoriality): The sets of tame lifts correspond to restriction of wild orbits from W_F to W_K.

Use §6.2: Define Σ_{LΘ} independently of π.

Use §7.1: Compare the minimizing tame lifts on both sides.

Test `first_ramification_test_1` (compatibility): Different unramified twists of π give the same wild orbit.

Test `first_ramification_test_2` (non-example): Surjectivity concerns all wild orbits, not just one-dimensional ones.

Test `first_ramification_test_3` (non-example): The canonical map is not an arbitrary bijection between sets.

Open frontiers: G6, G7.

### profile-comparison — Equality of the two conductor profiles

theorem; missing; BH17 §6.2 (6.2.1) p.942.

For Θ,Υ∈E(F), Φ_Θ(A(Θ,Υ))=Σ_{LΘ}(Δ(LΘ,LΥ)).

Dependencies: PAPER-BUSHNELL-HENNIART-17/gl-conductor; PAPER-BUSHNELL-HENNIART-17/swan-pair; PAPER-BUSHNELL-HENNIART-17/llc-swan; PAPER-BUSHNELL-HENNIART-17/first-ramification; PAPER-BUSHNELL-HENNIART-17/sigma-wild-invariance.

1. Choose cuspidal realizations, apply the GL conductor formula, transfer pair Swan through LLC, and apply the Weil formula.

### herbrand-endo — Herbrand function of an endo-class

construction; missing; BH17 §6.2 (6.2.2) pp.942–943.

Define Ψ_Θ=Φ_Θ^−1∘Σ_{LΘ}, where the inverse is taken on [Φ_Θ(0),∞). The comparison at Θ=Υ gives Σ_{LΘ}(0)=Φ_Θ(0), so the composition is defined on every x≥0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-comparison; PAPER-BUSHNELL-HENNIART-17/phi-shape; PAPER-BUSHNELL-HENNIART-17/sigma-shape.

1. First prove equality of the initial values; then construct the inverse order isomorphism onto the correct range.

API `endoHerbrand_zero` (simp): Ψ_Θ(0)=0.

API `endoHerbrand_compare` (relation): A(Θ,Υ)=Ψ_Θ(Δ(LΘ,LΥ)).

API `endoHerbrand_inverse` (equivalence): Ψ_Θ is an increasing homeomorphism [0,∞)→[0,∞) with inverse Σ_{LΘ}^−1∘Φ_Θ.

Use §6.4: Identify strict and weak balls.

Use §7.5: Recover the function by scalar twisting.

Test `herbrand_endo_test_1` (degenerate): The trivial class gives Ψ=id.

Test `herbrand_endo_test_2` (computation): Φ and Σ can have positive initial values even though Ψ(0)=0.

Test `herbrand_endo_test_3` (compatibility): The inverse composition order is reversed.

### herbrand-shape — Continuity and finite affine structure of Ψ

theorem; missing; BH17 §6.2 Proposition pp.942–943.

Ψ_Θ is continuous, strictly increasing, piecewise affine with finitely many derivative breaks, Ψ_Θ(0)=0, and Ψ_Θ(x)=x for x≥m_Θ. Convexity of Ψ is not asserted.

Dependencies: PAPER-BUSHNELL-HENNIART-17/herbrand-endo; PAPER-BUSHNELL-HENNIART-17/gl-level-swan; PAPER-BUSHNELL-HENNIART-17/sigma-shape; PAPER-BUSHNELL-HENNIART-17/phi-shape.

1. Compose the finite affine order isomorphisms; identify m_Θ=sl(Lπ) using Swan compatibility and apply both identity tails.

### rational-weil-slopes — Weil realization of every positive rational slope

theorem; missing; BH17 §2.4 Proposition and Corollary, proved §6.3 p.943.

For coprime a,b>0 there is an irreducible smooth complex Weil representation σ of dimension b and Swan exponent a.

Dependencies: PAPER-BUSHNELL-HENNIART-17/rational-endo-level; PAPER-BUSHNELL-HENNIART-17/cuspidal-endo; PAPER-BUSHNELL-HENNIART-17/llc-swan; PAPER-BUSHNELL-HENNIART-17/slope; PAPER-BUSHNELL-HENNIART-17/profinite-occurrence.

1. Choose a degree-b totally ramified endo-class of level a/b and a rank-b cuspidal realization; LLC preserves rank and Swan. The rank-b realization is the explicit G6 supplier.

Open frontiers: G6.

### delta-density — Density of ramification distances

theorem; missing; BH17 §3.3 Density Lemma, proved §6.3 p.943.

For any irreducible σ, {Δ(σ,τ):τ irreducible} is dense in [0,∞).

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-density; PAPER-BUSHNELL-HENNIART-17/first-ramification; PAPER-BUSHNELL-HENNIART-17/herbrand-shape; PAPER-BUSHNELL-HENNIART-17/profile-comparison.

1. Transport the dense A-values through the increasing homeomorphism Ψ_Θ^−1. This is deliberately placed after the comparison theorem to avoid a cycle.

### sigma-unique — Conductor characterization of Σ

theorem; missing; BH17 §3.3 Proposition p.931, completed §6.3.

Σ_σ is the unique continuous function f on [0,∞) satisfying f(Δ(σ,τ))=sw(σ∨⊗τ)/(dim σ dim τ) for every irreducible τ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/swan-pair; PAPER-BUSHNELL-HENNIART-17/delta-density; PAPER-BUSHNELL-HENNIART-17/sigma-shape.

1. Use equality on the dense set of Δ-values.

### higher-strict — Higher ramification theorem: open balls

theorem; missing; BH17 §6.4 Higher Ramification Theorem p.943.

For Θ∈E(F), ε>0 and δ=Ψ_Θ(ε), Δ(LΘ,LΥ)<ε iff A(Θ,Υ)<δ for every Υ∈E(F).

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-comparison; PAPER-BUSHNELL-HENNIART-17/herbrand-endo; PAPER-BUSHNELL-HENNIART-17/herbrand-shape.

1. Apply the strictly increasing inverse profile to the exact distance identity.

### higher-weak — Higher ramification theorem: closed balls

theorem; missing; BH17 §6.4 Higher Ramification Theorem p.943.

With the same hypotheses, Δ(LΘ,LΥ)≤ε iff A(Θ,Υ)≤Ψ_Θ(ε).

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-comparison; PAPER-BUSHNELL-HENNIART-17/herbrand-shape.

1. Order equivalence preserves non-strict inequalities as well. Keep this separate from the non-plus orbit criterion.

### herbrand-tail — Tail agreement of Herbrand functions and inverses

theorem; missing; BH17 §6.5 Lemma and Remark pp.943–944.

For x≥A(Θ,Υ), Ψ_Θ^−1(x)=Ψ_Υ^−1(x); equivalently Ψ_Θ(y)=Ψ_Υ(y) for y≥Δ(LΘ,LΥ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/higher-strict; PAPER-BUSHNELL-HENNIART-17/delta-density; PAPER-BUSHNELL-HENNIART-17/herbrand-shape.

1. Open A-balls of radius x>A coincide. Higher ramification identifies the corresponding Δ-balls.

2. Density of distances forces their radii to coincide; equal open balls alone would not imply this in an arbitrary ultrametric space. Extend to the boundary by continuity.

### truncated-class-to-orbit — A truncated endo-class determines a unique ramification pair

theorem; missing; BH17 §6.5 Corollary (1) p.944.

Given Θ and δ>0, there is a unique pair (ε,ξ), ε>0 and ξ a W_F-orbit in Irr(R_F(ε)), such that tc_δ(Θ_π)=tc_δ(Θ) iff Lπ|R_F(ε) contains ξ. Here ε=Ψ_Θ^−1(δ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/higher-strict; PAPER-BUSHNELL-HENNIART-17/truncation-balls; PAPER-BUSHNELL-HENNIART-17/herbrand-tail; PAPER-BUSHNELL-HENNIART-17/delta-density.

1. Construct ε and the constituent orbit; use the ball equivalence for existence. For uniqueness of ε use density, then uniqueness of the restriction orbit.

### orbit-to-truncated-class — Every ramification pair determines a truncated endo-class

theorem; missing; BH17 §6.5 Corollary (2) p.944.

For ε>0 and a W_F-orbit ξ in Irr(R_F(ε)), choose a Weil irreducible containing ξ, let Θ be its endo-class and δ=Ψ_Θ(ε). The equivalence in the preceding item holds, and the resulting truncated endo-class is independent of the choice.

Dependencies: PAPER-BUSHNELL-HENNIART-17/weil-occurrence; PAPER-BUSHNELL-HENNIART-17/first-ramification; PAPER-BUSHNELL-HENNIART-17/higher-strict; PAPER-BUSHNELL-HENNIART-17/herbrand-tail.

1. Occurrence supplies a center; tail agreement shows that all centers with the same orbit give the same truncation.

### herbrand-tame — Tame lifting law for every Herbrand function

theorem; missing; BH17 §7.1 Proposition pp.944–945.

For any Θ, finite tame K/F of index e, and any K/F-lift Θ_K, Ψ_{Θ_K}(x)=e Ψ_Θ(x/e) for x≥0. Unlike the separate Φ and Σ formulas, this does not require Θ totally wild.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-distance-tame; PAPER-BUSHNELL-HENNIART-17/delta-tame; PAPER-BUSHNELL-HENNIART-17/first-ramification; PAPER-BUSHNELL-HENNIART-17/profile-comparison; PAPER-BUSHNELL-HENNIART-17/endo-density.

1. Reduce to a Galois tame extension. Choose a lift minimizing A; strict monotonicity makes it minimize Δ too.

2. Apply both minimum formulas and compare at a dense set of A-values; extend by continuity, then descend from the tame Galois closure.

### wild-lift-exists — Reduction to a totally wild lift

theorem; missing; BH17 §7.1 Remark p.945; BH14 §6.3 Tame Parameter Theorem.

Every endo-class has a totally wild lift over some finite tame extension K/F.

Dependencies: PAPER-BUSHNELL-HENNIART-17/first-ramification; PAPER-BUSHNELL-HENNIART-17/tame-endo-lift.

1. Use the tame parameter field: BH14 identifies it with the stabilizer field of a wild-inertia constituent. Its construction and compatibility are G6.

Open frontiers: G6.

### totally-wild-weil — Totally wild Weil representations

definition; missing; BH17 §7.2 p.945, corrected explanatory equivalence.

An irreducible σ is totally wild precisely when σ|P_F is irreducible. Its dimension is p^r. A singleton orbit of constituents is insufficient without multiplicity one.

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/clifford-dimension.

1. Use the finite p-group image of P_F and the dimension theorem for its irreducibles; retain the irreducibility hypothesis.

API `totallyWildWeil_restrict` (characterisation): The restriction to P_F is an irreducible representation.

API `totallyWildWeil_dim` (data): There is r≥0 with dim σ=p^r.

API `totallyWildWeil_tameBaseChange` (functoriality): Restriction to any tame W_K remains irreducible and totally wild.

Use §7.3: Control distances under character twists.

Use §8.2: Study a finite self-twist group of an irreducible P_F-representation.

Test `totally_wild_weil_test_1` (compatibility): Every character is totally wild, including tame characters.

Test `totally_wild_weil_test_2` (non-example): The standard tame two-dimensional S_3 representation is not totally wild.

Test `totally_wild_weil_test_3` (non-example): Its wild constituent orbit is nevertheless the singleton trivial orbit.

Open frontiers: G8.

### wild-llc — Totally wild LLC criterion

theorem; missing; BH17 §7.2 Lemma p.945; BH14 §6.3.

An irreducible σ=Lπ is totally wild iff gr(π)=deg Θ_π and Θ_π is totally wild.

Dependencies: PAPER-BUSHNELL-HENNIART-17/totally-wild-weil; PAPER-BUSHNELL-HENNIART-17/totally-wild-endo; PAPER-BUSHNELL-HENNIART-17/first-ramification.

1. Use the tame parameter theorem and the rank formula; orbit size alone omits the tame factor and its multiplicity.

Open frontiers: G6.

### character-reciprocity — Reciprocity and Swan exponents of characters

construction; planned; BH17 §§7.3–7.5; local reciprocity input.

Identify smooth complex characters of F× with characters of W_F^ab using a fixed reciprocity normalization. For a ramified character χ, sw(χ)=k iff it is trivial on U_F^{k+1} and nontrivial on U_F^k; tame characters have Swan zero.

Dependencies: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; FunctionFieldArithmetic:FA.4; PAPER-BUSHNELL-HENNIART-17/unit-filtration.

Existing stages: tauceti:TauCetiRoadmap/ClassFieldTheory#layer-7-the-absolute-local-artin-map-its-normalizations-and-conductors; tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group; FunctionFieldArithmetic:FA.4.

1. Use characteristic-zero CFT and the separate FA.4 equal-characteristic construction; changing arithmetic to geometric reciprocity inverts the character but not its conductor.

API `localCharacterWeilEquiv` (equivalence): Reciprocity induces the normalized character correspondence.

API `characterSwan_unitFiltration` (characterisation): For k>0, exact Swan k is nontriviality on U^k and triviality on U^{k+1}.

API `characterSwan_tameRestriction` (functoriality): Under tame K/F of index e, sw(χ|W_K)=e sw(χ).

Use §7.5: Use K×-characters in the Weil twisting calculation.

Use §8.3: Measure self-twists by integer Swan exponents.

Test `character_reciprocity_test_1` (degenerate): An unramified character has Swan zero.

Test `character_reciprocity_test_2` (degenerate): A tame ramified character also has Swan zero.

Test `character_reciprocity_test_3` (non-example): In characteristic p use the full local reciprocity supplier, not only its prime-to-p quotient.

### twist-distance — Distance under a character twist

theorem; missing; BH17 §7.3 Proposition pp.945–946.

For totally wild σ and a character χ with sw(χ)=c>0, Δ(σ,χ⊗σ)≤c. If Σ′_σ is continuous at c, equality holds.

Dependencies: PAPER-BUSHNELL-HENNIART-17/totally-wild-weil; PAPER-BUSHNELL-HENNIART-17/delta-endpoints; PAPER-BUSHNELL-HENNIART-17/sigma; PAPER-BUSHNELL-HENNIART-17/character-reciprocity.

1. The two restrictions agree on R_F^+(c). Strict inequality means χ|R_F(c) occurs in End σ; its disappearance on the plus group forces a derivative jump of Σ. If c>sl σ the new slope is c directly.

### endo-character-action — Character action on endo-classes

construction; missing; BH17 §7.4 p.946.

A smooth character χ of F× acts by multiplying a realization θ(h) by χ(det h). In degree one this is multiplication of characters of U_F^1; in higher degree the scalar-translation construction realizes the product. The resulting class χΘ is independent of realization and Θ_{χπ}=χΘ_π.

Dependencies: PAPER-BUSHNELL-HENNIART-17/simple-characters; PAPER-BUSHNELL-HENNIART-17/cuspidal-endo; PAPER-BUSHNELL-HENNIART-17/character-reciprocity.

1. Use the scalar-twist theorem from BK94 appendix with the actual translated level and transport of the H-groups. The printed maximum level is not safe in a cancellation case.

API `endoCharacterAction_one` (simp): The trivial character acts identically.

API `endoCharacterAction_mul` (functoriality): (χ_1χ_2)Θ=χ_1(χ_2Θ).

API `endoCharacterAction_cuspidal` (compatibility): Θ_{χπ}=χΘ_π, with χ acting through determinant.

Use §7.5: Sample Ψ by distances to character twists.

Use §7.6: Remove a scalar leading approximation without changing Ψ.

Test `endo_character_action_test_1` (degenerate): Degree-one inverse twisting can produce the trivial endo-class.

Test `endo_character_action_test_2` (degenerate): A tame χ acts trivially on the pro-p realization group.

Test `endo_character_action_test_3` (compatibility): Central cancellation can lower the stratum level.

Open frontiers: G5.

### scalar-twist-level — Actual level of the translated simple stratum

theorem; missing; BH17 §7.4 Lemma p.946, corrected necessary level; BH96 (1.3)–(1.4).

In the setup of §7.4 with deg Θ>1, choose c∈F× linearizing χ on 2v_F(x)>k=sw χ. The translated parameter β+c has the same field and commutator as β. Its level must be m′=−v_a(β+c); if m≠e_a k then m′=max(m,e_a k), whereas equal leading depths can cancel.

Dependencies: PAPER-BUSHNELL-HENNIART-17/critical-exponent; PAPER-BUSHNELL-HENNIART-17/endo-character-action.

1. Scalar translation preserves a_β and the field. Use the nonarchimedean valuation law for unequal values; inspect cancellation separately at equality.

2. The full assertion about C(a,β+c) and its H-domain remains G5 until the appendix is checked.

Test `scalar_twist_level_test_1` (computation): For unramified quadratic E/Q_3, maximal a, β=3^−2+α3^−1 and c=−3^−2 with residue-generating α, the translated level is 1, below the printed maximum 2.

Open frontiers: G5.

### twist-invariance — Φ, Σ and Ψ are unchanged by character twisting

theorem; missing; BH17 §7.4 Proposition p.946.

For every Θ and smooth χ of F×, Φ_{χΘ}=Φ_Θ, Σ_{L(χΘ)}=Σ_{LΘ}, and Ψ_{χΘ}=Ψ_Θ. Total wildness of Θ is preserved.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-character-action; PAPER-BUSHNELL-HENNIART-17/herbrand-endo; PAPER-BUSHNELL-HENNIART-17/first-ramification.

1. On the Weil side End(χ⊗σ)=End σ. On the simple-character side scalar translation preserves the non-scalar approximation profile and the structure function, though m_Θ itself may change.

Open frontiers: G5.

### character-depth-exists — Characters of prescribed positive Swan exponent

theorem; missing; BH17 §7.5 uniqueness proof, expanded supplier.

For any local field K and integer k≥1, there is a smooth character of K× of exact Swan k.

Dependencies: PAPER-BUSHNELL-HENNIART-17/unit-filtration; PAPER-BUSHNELL-HENNIART-17/character-reciprocity.

1. Choose a nontrivial complex character of U_K^k/U_K^{k+1}. Extend it to the finite abelian group O_K×/U_K^{k+1}, using divisibility of C× or the finite abelian structure theorem.

2. Extend over K×=π^Z×O_K× and apply the unit-conductor formula. This is a separate construction from extending an arbitrary higher-dimensional representation.

Open frontiers: G1.

### tame-depth-density — Dense character depths after tame rescaling

theorem; missing; BH17 §7.5 uniqueness argument, expanded supplier.

As K/F ranges over finite tame extensions with e=e(K/F) and χ over smooth K×-characters, the positive values sw(χ)/e are dense in [0,∞). Removing any finite set preserves density.

Dependencies: PAPER-BUSHNELL-HENNIART-17/character-depth-exists; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

1. For arbitrarily large e prime to p, the Eisenstein extension generated by a root of X^e−π is finite tame of index e. Use characters of every positive integer Swan exponent and approximate a real number by k/e. Galoisness and roots of unity are not required for this existence argument.

### interpolation — Interpolation theorem: sampling formula

theorem; missing; BH17 §7.5 Interpolation Theorem (3) pp.946–947.

For totally wild Θ there is a finite D⊂R_{>0} such that for every finite tame K/F with index e, its unique lift Θ_K, and every character χ of K× with sw(χ)/e∉D, A_K(Θ_K,χΘ_K)=e Ψ_Θ(sw(χ)/e). One may take D to contain precisely all derivative breaks of Σ_{LΘ}.

Dependencies: PAPER-BUSHNELL-HENNIART-17/wild-llc; PAPER-BUSHNELL-HENNIART-17/phi-tame; PAPER-BUSHNELL-HENNIART-17/sigma-tame; PAPER-BUSHNELL-HENNIART-17/twist-distance; PAPER-BUSHNELL-HENNIART-17/gl-conductor; PAPER-BUSHNELL-HENNIART-17/llc-swan; PAPER-BUSHNELL-HENNIART-17/endo-character-action.

1. Choose a rank-deg Θ cuspidal realization. Off D the twist distance is sw χ. Compare conductors through LLC and apply both totally-wild scaling formulas. For sw χ=0 use triviality on the realization pro-p group.

### interpolation-unique — Interpolation determines Ψ uniquely

theorem; missing; BH17 §7.5 uniqueness and Remark p.947.

Continuity, strict increase, finite piecewise affine structure and the preceding sampling rule outside some finite exceptional set determine Ψ_Θ uniquely. The exceptional set need not contain all breaks of Ψ′_Θ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/interpolation; PAPER-BUSHNELL-HENNIART-17/tame-depth-density; PAPER-BUSHNELL-HENNIART-17/herbrand-shape.

1. For two candidates remove the union of their finite exceptional sets; their values agree on the remaining dense set. Continuity gives equality everywhere.

### degree-one — Degree-one profiles are identity

theorem; missing; BH17 §7.6 (7.6.1) p.947.

If deg Θ=1, then Φ_Θ(x)=Σ_{LΘ}(x)=Ψ_Θ(x)=x for every x≥0, even when Θ has positive level.

Dependencies: PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/wild-llc; PAPER-BUSHNELL-HENNIART-17/sigma-max; PAPER-BUSHNELL-HENNIART-17/herbrand-endo.

1. The scalar parameter gives c=0,d=1. A rank-one Weil representative has trivial End, so both profiles are identity.

### initial-slope — Initial slope in the totally wild case

theorem; missing; BH17 §7.6 Proposition (1) p.948.

For totally wild Θ of degree p^r with r≥1, Ψ′_Θ(x)=p^−r for all sufficiently small x>0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/totally-wild-endo; PAPER-BUSHNELL-HENNIART-17/wild-llc; PAPER-BUSHNELL-HENNIART-17/sigma; PAPER-BUSHNELL-HENNIART-17/phi-shape; PAPER-BUSHNELL-HENNIART-17/ramification-cofinal.

1. Near zero σ|R_F(x) remains irreducible, so Σ′=p^−2r; the first profile degree gives Φ′=p^−r. Divide the two slopes.

### terminal-slope — Slope immediately below the endo level

theorem; missing; BH17 §7.6 Proposition (2) p.948.

Suppose Θ is totally wild of degree p^r, r≥1, and m_Θ=a p^{t−r} with p∤a and 0≤t<r. Then Ψ′_Θ(x)=p^{r−t} for x<m_Θ sufficiently close to m_Θ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/profile-fields; PAPER-BUSHNELL-HENNIART-17/ramification-commutators; PAPER-BUSHNELL-HENNIART-17/herbrand-shape; PAPER-BUSHNELL-HENNIART-17/phi-shape.

1. The last minimal approximation has degree p^{r−t}, with m/e_a=−v_E(α)/p^{r−t}.

2. At the final break total wildness and the commutator relation make the restriction scalar, so End is already trivial just below m_Θ and Σ′=1.

3. Shrink the x-neighborhood also through Ψ^−1 to ensure Ψ(x) lies in the final Φ interval. Divide the slopes.

Open frontiers: G3.

### scalar-level-reduction — Removing an integral leading scalar level

theorem; missing; BH17 §7.6 Remark and §7.7 proof pp.948–949.

If a totally wild Θ of degree p^r>1 has m_Θ=a p^{t−r} with p∤a and t≥r, its last approximation lies in F. A character twist can lower m_Θ without changing Ψ. Repetition reaches a level with 0≤t<r.

Dependencies: PAPER-BUSHNELL-HENNIART-17/endo-character-action; PAPER-BUSHNELL-HENNIART-17/twist-invariance; PAPER-BUSHNELL-HENNIART-17/profile-fields.

1. Choose a character canceling the scalar leading approximation, using the scalar-twist supplier; descend the positive discrete level of a fixed realization until it is no longer integral in this sense.

Open frontiers: G5.

### essential-tame — Essentially tame endo-class

definition; missing; BH17 §7.7 p.948.

Θ is essentially tame when it has a degree-one lift over some finite tame extension; equivalently e_Θ is prime to p.

Dependencies: PAPER-BUSHNELL-HENNIART-17/tame-endo-lift; PAPER-BUSHNELL-HENNIART-17/endo-invariants.

1. Use the tame parameter field and the degree of its totally wild lift.

API `essentiallyTame_iff_primeTo` (characterisation): Θ is essentially tame iff gcd(e_Θ,p)=1.

API `essentiallyTame_lift` (constructor): Choose a finite tame extension with a degree-one lift.

API `essentiallyTame_characterTwist` (compatibility): Character twisting preserves essential tameness.

Use §7.7 Corollary: Classify identity Herbrand functions.

Use §8.4: Separate the degree-p tame case from the wild case.

Test `essential_tame_test_1` (degenerate): Degree one is essentially tame.

Test `essential_tame_test_2` (compatibility): An unramified parameter is essentially tame even if its degree is divisible by p.

Test `essential_tame_test_3` (non-example): A totally wild class of degree>1 is not essentially tame.

Open frontiers: G6.

### essential-tame-criterion — Identity Herbrand function characterizes essential tameness

theorem; missing; BH17 §7.7 Corollary pp.948–949.

For Θ, the following are equivalent: Ψ_Θ=id; Ψ′_Θ is continuous throughout 0<x<m_Θ; Θ is essentially tame.

Dependencies: PAPER-BUSHNELL-HENNIART-17/essential-tame; PAPER-BUSHNELL-HENNIART-17/wild-lift-exists; PAPER-BUSHNELL-HENNIART-17/herbrand-tame; PAPER-BUSHNELL-HENNIART-17/degree-one; PAPER-BUSHNELL-HENNIART-17/initial-slope; PAPER-BUSHNELL-HENNIART-17/terminal-slope; PAPER-BUSHNELL-HENNIART-17/scalar-level-reduction.

1. Pass to a totally wild lift. The tame case has degree one. In the non-tame case twist to the terminal-slope hypotheses; the different initial and terminal slopes force an interior break.

### graded-character-torsor — Character torsor over an irreducible restriction

theorem; missing; BH17 §8.1 Lemma p.949.

Let ε>0 and let σ_ε be irreducible on R_F(ε), remaining irreducible on R_F^+(ε). Twisting σ_ε gives a bijection from the smooth characters of R_F(ε)/R_F^+(ε) onto irreducible smooth representations of R_F(ε) containing that plus-restriction.

Dependencies: PAPER-BUSHNELL-HENNIART-17/ramification-commutators; PAPER-BUSHNELL-HENNIART-17/clifford-dimension; PAPER-BUSHNELL-HENNIART-17/smooth-weil.

1. Use the multiplicity-space action on Hom of the common irreducible plus-restriction. The quotient is abelian; irreducibility forces that multiplicity space to be one-dimensional. Schur gives uniqueness.

Open frontiers: G8.

### commutant-growth — Commutant dimensions and a ramification break

theorem; missing; BH17 §8.1 proof pp.949–950.

For σ irreducible, let l_ε and m_ε be the number and common multiplicity of its R_F(ε)-constituents, and similarly l_ε^+,m_ε^+. Then d_ε=dim End_{R_F(ε)}σ=l_ε m_ε² and d_ε^+=l_ε^+(m_ε^+)². Σ′ is continuous at ε iff d_ε=d_ε^+.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-dimension; PAPER-BUSHNELL-HENNIART-17/sigma; PAPER-BUSHNELL-HENNIART-17/slope.

1. Compute the endomorphism algebra of a semisimple complex direct sum and compare the finite left and right values of the invariant dimension.

### sigma-jump-criterion — Character-twist criterion for a break of Σ

theorem; missing; BH17 §8.1 Proposition and Remark pp.949–950.

For ε>0 and an irreducible constituent σ_ε on R_F(ε), Σ′_σ is continuous at ε iff no nontrivial character χ of R_F(ε)/R_F^+(ε) has χ⊗σ_ε W_F-conjugate to σ_ε. Under this condition σ_ε remains irreducible on the plus group.

Dependencies: PAPER-BUSHNELL-HENNIART-17/graded-character-torsor; PAPER-BUSHNELL-HENNIART-17/commutant-growth.

1. If the plus restriction is reducible the commutant grows. Otherwise count the c character twists lying in the same W_F-orbit: l_ε=c l_ε^+, m_ε^+=c m_ε and d_ε^+=c d_ε. Equality is exactly c=1.

Open frontiers: G8.

### centric-field — Centric and tame centric fields

construction; missing; BH17 §8.2 p.950.

For irreducible σ of dimension>1, the finite projective representation barσ:W_F→PGL(V) has kernel W_E for a finite Galois extension E/F, its centric field. The maximal tame subextension T/F of E/F is the tame centric field.

Dependencies: PAPER-BUSHNELL-HENNIART-17/finite-image-twist; PAPER-BUSHNELL-HENNIART-17/weil-group; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group.

1. Extend the finite projective quotient to G_F and use the Galois correspondence; define T as the fixed field of wild inertia in that quotient.

API `centricField_kernel` (characterisation): ker barσ=W_E.

API `centricField_characterTwist` (compatibility): Tensoring σ by a character does not change E or T.

API `tameCentricField` (projection): T is the maximal tame subextension of E/F.

Use §8.3: Define absolute wildness.

Use §8.2 Proposition: Bound the imprimitivity field by T.

Test `centric_field_test_1` (degenerate): A scalar twist leaves projectivization unchanged.

Test `centric_field_test_2` (compatibility): E is finite even when σ itself has infinite unramified image.

Test `centric_field_test_3` (computation): T=F means E/F is totally wildly ramified.

Open frontiers: G1.

### self-twist-groups — Weil and wild self-twist groups

definition; missing; BH17 §8.2 Definition p.950.

For totally wild σ, D(σ)={χ∈Hom_sm(W_F,C×):χ⊗σ≅σ} and D_0(σ)={φ∈Hom_sm(P_F,C×):φ⊗σ|P_F≅σ|P_F}. Restriction gives a homomorphism D(σ)→D_0(σ).

Dependencies: PAPER-BUSHNELL-HENNIART-17/totally-wild-weil; PAPER-BUSHNELL-HENNIART-17/smooth-weil.

1. Close under multiplication and inverses by composing representation isomorphisms; define the restriction map with its proof of membership.

API `selfTwist_iff_endComponent` (characterisation): A character is a self-twist iff it occurs in the appropriate End representation.

API `selfTwist_restrict` (functoriality): Restrict a Weil self-twist to wild inertia.

API `selfTwist_one` (simp): The trivial character is the identity element in both groups.

Use §8.2: Construct the imprimitivity field.

Use §8.3: Find the first derivative break from the least self-twist conductor.

Test `self_twist_groups_test_1` (degenerate): Degree one has only the trivial self-twist.

Test `self_twist_groups_test_2` (non-example): The groups depend on isomorphisms, not equality of matrix functions.

Test `self_twist_groups_test_3` (compatibility): No extension of an arbitrary wild character to W_F is assumed.

### wild-self-twists — Finiteness of wild self-twists

theorem; missing; BH17 §8.2 p.950.

For totally wild σ of dimension n, |D_0(σ)|≤n².

Dependencies: PAPER-BUSHNELL-HENNIART-17/self-twist-groups; PAPER-BUSHNELL-HENNIART-17/clifford-dimension.

1. Distinct self-twist characters occur in the n²-dimensional End representation, each with positive multiplicity.

### imprimitivity-field — Imprimitivity field

construction; missing; BH17 §8.2 p.950.

W_F acts by conjugation on the finite group D_0(σ), with P_F acting trivially. Its action kernel is W_{T_I} for a finite tame Galois extension T_I/F, called the imprimitivity field.

Dependencies: PAPER-BUSHNELL-HENNIART-17/wild-self-twists; PAPER-BUSHNELL-HENNIART-17/weil-group; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group.

1. Each character stabilizer is an open finite-index Weil subgroup; intersect the finitely many stabilizers and identify the finite tame Galois field.

API `imprimitivityField_kernel` (characterisation): W_{T_I}=ker(W_F→Aut D_0(σ)).

API `imprimitivityField_tameGalois` (structure): T_I/F is finite, tame and Galois.

API `imprimitivityField_fixedCharacters` (simp): Every wild self-twist is fixed by W_{T_I}.

Use §8.2 Proposition: Relate wild and Weil self-twists over T_I.

Use §8.3 Corollary: Compute a p-integral first break.

Test `imprimitivity_field_test_1` (degenerate): Trivial D_0 would give T_I=F.

Test `imprimitivity_field_test_2` (compatibility): The kernel is an intersection of stabilizers, so it is normal.

Test `imprimitivity_field_test_3` (non-example): T_I is defined from D_0, not from a chosen inducing character.

Open frontiers: G1.

### tame-self-twist-trivial — A tame self-twist of a totally wild representation is trivial

theorem; missing; BH17 §8.2 Lemma 1 p.951; BH14 §1.3 Lemma 1 p.10.

If σ|P_F is irreducible and χ is a tame character of W_F with χ⊗σ≅σ, then χ=1.

Dependencies: PAPER-BUSHNELL-HENNIART-17/self-twist-groups.

1. An intertwiner commutes with σ(P_F), hence is a nonzero scalar by Schur; the intertwining equation forces χ(g)=1 for every g.

### wild-character-extension — Extension of an invariant wild character

theorem; missing; BH17 §8.2 Lemma 2 proof p.951; BH14 §1.3 pp.10–11.

If K/F is finite tame and φ is a W_K-invariant smooth character of P_F, φ extends to a character of W_K; two extensions differ by a tame character. More generally BH14 §1.3 extends an irreducible wild representation to its stabilizer Weil group, uniquely up to tame twist.

Dependencies: PAPER-BUSHNELL-HENNIART-17/weil-occurrence; PAPER-BUSHNELL-HENNIART-17/weil-group.

1. On finite inertia quotients extend across a cyclic tame quotient, normalize the determinant to p-power order, then extend across the infinite cyclic Frobenius quotient. Schur proves the tame-twist uniqueness.

Open frontiers: G8.

### self-twist-descent — Self-twists over a tame extension

theorem; missing; BH17 §8.2 Lemma 2 p.951.

For totally wild σ and finite tame K/F, restriction identifies D(σ|W_K) with D_0(σ)^{W_K}.

Dependencies: PAPER-BUSHNELL-HENNIART-17/wild-character-extension; PAPER-BUSHNELL-HENNIART-17/tame-self-twist-trivial; PAPER-BUSHNELL-HENNIART-17/self-twist-groups.

1. Injectivity is the preceding tame-self-twist lemma. Extend an invariant wild self-twist to W_K; compare its twist with σ_K, then remove the unique residual tame character.

Open frontiers: G8.

### imprimitivity-bound — The imprimitivity field lies in the tame centric field

theorem; missing; BH17 §8.2 Proposition pp.950–951.

For totally wild σ with tame centric T and imprimitivity T_I, T_I⊆T, and D(σ|W_{T_I})→D_0(σ) is an isomorphism.

Dependencies: PAPER-BUSHNELL-HENNIART-17/centric-field; PAPER-BUSHNELL-HENNIART-17/imprimitivity-field; PAPER-BUSHNELL-HENNIART-17/self-twist-descent.

1. W_T=P_F W_E acts trivially on the wild self-twists, because W_E acts projectively trivially and P_F acts by inner conjugation. Apply the fixed-point description.

### absolutely-wild — Absolute wildness

definition; missing; BH17 §8.3 p.951.

A totally wild σ of dimension>1 is absolutely wild when its tame centric field is F, equivalently its centric field E/F is totally wildly ramified. Up to a character twist it can be represented through a finite p-group.

Dependencies: PAPER-BUSHNELL-HENNIART-17/centric-field; PAPER-BUSHNELL-HENNIART-17/totally-wild-weil.

1. Use the projective quotient and the character-twist construction needed to remove the tame scalar part; the required lifting argument is retained in G8.

API `absolutelyWild_iff_tameCentric` (characterisation): The tame centric field equals F.

API `absolutelyWild_finitePGroupTwist` (constructor): After a character twist obtain a finite p-group image.

API `absolutelyWild_overTameCentric` (functoriality): Restriction to the tame centric field is absolutely wild.

Use §8.3 Theorem: Apply finite p-group induction at the first break.

Use §8.4: Treat the degree-p two-break case.

Test `absolutely_wild_test_1` (degenerate): Absolute wildness is invariant under scalar character twists.

Test `absolutely_wild_test_2` (non-example): Total wildness alone does not force T=F.

Test `absolutely_wild_test_3` (non-example): The finite-image representative is chosen, not canonical.

Open frontiers: G8.

### first-break-absolute — First break of an absolutely wild representation

theorem; missing; BH17 §8.3 Theorem pp.951–952.

For absolutely wild σ of dimension p^r, r≥1, the least positive derivative break a of Σ_σ is an integer and a=min{sw(χ):χ∈D(σ), χ≠1}.

Dependencies: PAPER-BUSHNELL-HENNIART-17/absolutely-wild; PAPER-BUSHNELL-HENNIART-17/wild-self-twists; PAPER-BUSHNELL-HENNIART-17/sigma-jump-criterion; PAPER-BUSHNELL-HENNIART-17/self-twist-descent; PAPER-BUSHNELL-HENNIART-17/character-reciprocity; PAPER-BUSHNELL-HENNIART-17/relative-p-induction; PAPER-BUSHNELL-HENNIART-17/wild-self-twists-nontrivial.

1. Let c be the least self-twist Swan; each such character in End σ forces a break, so a≤c.

2. Before a the restrictions stay irreducible; at a the plus restriction becomes reducible.

3. In the finite p-group quotient induce from an index-p subgroup containing that plus group. Its quotient character has Swan≤a and is a self-twist, giving c≤a.

Open frontiers: G8.

### first-break-general — First break from the imprimitivity field

theorem; missing; BH17 §8.3 Corollary p.952.

For totally wild σ of dimension>1, let e=e(T_I/F). Its first derivative break is a=min{sw(χ)/e:χ∈D(σ|W_{T_I}),χ≠1}; in particular a is p-integral (its denominator is prime to p).

Dependencies: PAPER-BUSHNELL-HENNIART-17/first-break-absolute; PAPER-BUSHNELL-HENNIART-17/imprimitivity-bound; PAPER-BUSHNELL-HENNIART-17/sigma-tame; PAPER-BUSHNELL-HENNIART-17/character-reciprocity.

1. Pass to T where σ is absolutely wild. Descend self-twists uniquely to T_I and divide their conductors by the tame ramification factors.

### degree-p-profile — Structure function in totally wild degree p

theorem; missing; BH17 §8.4 p.952.

For totally wild Θ of degree p with m_Θ=m/p and p∤m, Φ_Θ(0)=m(p−1)/p² and Φ′_Θ=1/p on (0,m/p); Ψ′ and Σ′ have identical break locations in that interval.

Dependencies: PAPER-BUSHNELL-HENNIART-17/minimal-volume; PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/herbrand-endo.

1. Coprimality makes the degree-p parameter minimal. Compose the affine inverse of Φ on its non-tail range.

### degree-p-breaks — One or two decomposition breaks in degree p

theorem; missing; BH17 §8.4 p.952.

For a totally wild σ of dimension p and Swan exponent m with p∤m, the possible slopes of Σ are p^−2,p^−1,1, and there are one or two positive derivative breaks. In the two-break case a<b, σ|R_F(a) is irreducible, its plus restriction is a sum of p distinct characters, and σ|R_F^+(b) is scalar.

Dependencies: PAPER-BUSHNELL-HENNIART-17/swan; PAPER-BUSHNELL-HENNIART-17/commutant-growth; PAPER-BUSHNELL-HENNIART-17/sigma-jump-criterion.

1. On a finite p-group restriction, write p=e l d, with constituent dimension d, orbit size l and multiplicity e all powers of p. The commutant dimensions l e² can only be 1,p,p².

2. They increase from 1 to p², so there are one or two jumps. In the intermediate p-dimensional commutant case e=1,l=p,d=1, giving p distinct characters. This argument needs the finite p-group dimension supplier in G8, not the unread Mœglin classification.

Open frontiers: G8.

### degree-p-induction — Cyclic induction in the absolutely wild two-break case

theorem; missing; BH17 §8.4 p.952, corrected conductor statement.

In the two-break situation a<b with σ absolutely wild, σ is induced from a character χ of W_K for a uniquely determined cyclic degree-p extension K/F, with χ unique up to Gal(K/F). The Swan induction relation is sw(σ)=sw_K(χ)+(p−1)a when K/F has upper break a; hence sw_K(χ)=m−(p−1)a, not the printed a.

Dependencies: PAPER-BUSHNELL-HENNIART-17/degree-p-breaks; PAPER-BUSHNELL-HENNIART-17/first-break-absolute; PAPER-BUSHNELL-HENNIART-17/swan; tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration.

1. Use the index-p stabilizer of the distinct characters and Mackey theory for uniqueness; verify the extension break.

2. For the conductor apply a_F(Ind χ)=a_K(χ)+d(K/F), d=(p−1)(a+1), and subtract dimensions. Recursive induction-conductor and uniqueness details remain G9.

Open frontiers: G2, G9.

### degree-p-single-break — Location of the single break in degree p

theorem; missing; BH17 §8.4 pp.952–953.

In the one-break case, the break is a=m/(p+1). The source additionally describes σ(P_F) as extra special of class two; the precise scalar-image hypothesis and invariance under character twists require further verification before exporting that stronger assertion.

Dependencies: PAPER-BUSHNELL-HENNIART-17/degree-p-profile; PAPER-BUSHNELL-HENNIART-17/sigma-shape; PAPER-BUSHNELL-HENNIART-17/degree-p-breaks.

1. The slopes change from 1/p² to 1. Since Σ(0)=m(p−1)/p² and the tail is identity, continuity gives a=m/(p+1).

2. Keep the extra-special-image assertion as a separate unresolved source-level target below, not as an inferred consequence of the graph.

Open frontiers: G9.

### extraspecial-image — Extra-special-image assertion: verification target

theorem; missing; BH17 §8.4 first paragraph p.953.

BH17 §8.4 asserts, in the degree-p one-break case, that the finite p-group σ(P_F) is extra special of class two. An export must specify whether a scalar twist/normalization is intended and establish this exact finite-image assertion; this checkpoint does not certify it.

Dependencies: PAPER-BUSHNELL-HENNIART-17/degree-p-single-break; PAPER-BUSHNELL-HENNIART-17/finite-image-twist.

1. Acquire the precise Mœglin statement and test scalar twists, which preserve End σ and its breaks but can alter the scalar image. No counterexample or corrected theorem is claimed here.

Open frontiers: G9.

### epipelagic-input — Conditional epipelagic tensor input

theorem; missing; BH17 §8.5 p.953; BH14 epipelagic §§5.1–5.2 cited there.

For p=2, take totally wild two-dimensional τ,τ′ of Swan 1 attached to level-one strata with (det α′)^3 not congruent to (det α)^3 modulo U_F^1. Under these choices BH17 asserts τ⊗τ′ irreducible of dimension 4, Swan 2, with the unique Σ break 1/3. The mere assumption μ_3⊂F does not ensure such choices exist.

Dependencies: PAPER-BUSHNELL-HENNIART-17/wild-llc; PAPER-BUSHNELL-HENNIART-17/degree-p-single-break.

1. Check the cited epipelagic classification and determinant criterion before asserting existence. The q=4 obstruction is recorded separately.

Open frontiers: G9.

### four-dimensional-example — Four-dimensional Herbrand example

theorem; missing; BH17 §8.5 Example 1 p.953.

Conditional on the tensor input, its endo-class Ξ has m_Ξ=1/2, Φ_Ξ(0)=5/16, and Φ slopes 1/4 on (0,1/4), 1/2 on (1/4,1/2), then 1. Ψ_Ξ(x)=x/4 up to 1/3; 4x−5/4 on [1/3,3/8]; 2x−1/2 on [3/8,1/2]; then x.

Dependencies: PAPER-BUSHNELL-HENNIART-17/epipelagic-input; PAPER-BUSHNELL-HENNIART-17/phi; PAPER-BUSHNELL-HENNIART-17/herbrand-endo.

1. The asserted simple stratum has degree 4 and critical level −1. Compute Φ from this profile, Σ(x)=5/16+x/16 up to 1/3 and Σ(x)=x afterwards. Invert Φ interval by interval.

Test `four_dimensional_example_test_1` (computation): Check continuity at 1/3,3/8,1/2 and the identity Φ(Ψ(x))=Σ(x) at rational sample points and all breakpoints.

Open frontiers: G9.

### eight-dimensional-example — Eight-dimensional tensor example

theorem; missing; BH17 §8.5 Example 2 p.953.

With a third such τ″ whose determinant cube class differs from both preceding ones, BH17 asserts ρ=τ⊗τ′⊗τ″ irreducible, totally wild, dimension 8, Swan 3. For its class Υ, m_Υ=3/8 and Ψ′_Υ,Σ′_ρ each have just one break in (0,3/8), at 1/3. Conditionally Ψ=x/8 up to 1/3, 8x−21/8 up to 3/8, then x.

Dependencies: PAPER-BUSHNELL-HENNIART-17/epipelagic-input; PAPER-BUSHNELL-HENNIART-17/minimal-volume; PAPER-BUSHNELL-HENNIART-17/herbrand-endo.

1. The existence and irreducibility input uses BH01 conductor divisibility and the epipelagic classification, still G9. Given these, degree 8 and Swan 3 force a minimal profile with Φ(0)=21/64; combine with the claimed one Σ break to compute the affine pieces.

Test `eight_dimensional_example_test_1` (computation): Check Ψ(1/3)=1/24 and Ψ(3/8)=3/8; distinguish conditional arithmetic existence from numerical consistency.

Open frontiers: G9.

### ramification-kernel — A smooth ramification representation kills a deeper group

theorem; missing; BH17 §2.1 Proposition 2(1) and Complement p.927.

For ε>0 and ξ irreducible smooth on R_F(ε), ker ξ contains R_F(δ) for some δ>ε. The analogous assertion holds on R_F^+(ε), ε≥0.

Dependencies: PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/ramification-cofinal.

1. The kernel is open in the compact subgroup. Extend its defining neighborhood to an open subgroup of P_F and apply cofinality, then increase δ past ε.

### clifford-correspondence — Clifford correspondence for a finite group

theorem; planned; BH17 §§8.2–8.3 finite p-group argument; upstream InductionRestriction Layer 5.

For finite G, normal N and an irreducible complex representation V of N, induction from its inertia group T bijects irreducible T-representations lying over V with irreducible G-representations lying over V. It does not identify these with ordinary representations of T/N without an extension of V.

Dependencies: tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup.

Existing stages: tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-5-clifford-theory-over-a-normal-subgroup.

1. Import the existing correspondence with its actual inertia subgroup and induced representation.

### cyclic-restriction — Restriction across a normal subgroup of prime index

theorem; missing; BH17 §§8.2–8.3, explicit finite-quotient adapter.

For finite G, N◁G with G/N cyclic of prime order p, and irreducible complex ρ, either ρ|N is irreducible or it is a sum of p distinct irreducibles permuted transitively by G.

Dependencies: PAPER-BUSHNELL-HENNIART-17/clifford-correspondence; PAPER-BUSHNELL-HENNIART-17/clifford-dimension.

1. The inertia group is N or G. In the invariant case extend a constituent: choose an intertwiner for a quotient generator and rescale it by a complex p-th root to satisfy the generator-power relation.

2. All irreducibles over that constituent differ by a character of the cyclic quotient, so multiplicity is one. In the other case Clifford correspondence gives p distinct constituents.

Open frontiers: G8.

### relative-p-induction — Index-p induction retaining a normal subgroup

theorem; missing; BH17 §8.3 proof p.952, expanded finite-quotient adapter.

For a finite p-group G, irreducible complex ρ, and normal H◁G such that ρ|H is reducible, there is a normal subgroup M of index p containing H and an irreducible τ of M with ρ≅Ind_M^G τ.

Dependencies: PAPER-BUSHNELL-HENNIART-17/cyclic-restriction; PAPER-BUSHNELL-HENNIART-17/clifford-correspondence.

1. Take a G-normal series from H to G with successive order-p quotients. Choose the first step where restriction of ρ becomes irreducible.

2. The preceding cyclic-restriction lemma gives p distinct constituents at the previous step. G acts transitively on them, so their inertia subgroup M has index p and contains H.

3. The Clifford correspondence realizes ρ as induction from M. A subgroup of index p in a finite p-group is normal.

Open frontiers: G8.

### positive-jumps — The positive absolute upper jumps are exactly rational

theorem; missing; BH17 §2.4 Corollary p.929, justified §6.3.

For every real x>0, R_F(x)≠R_F^+(x) iff x is rational.

Dependencies: PAPER-BUSHNELL-HENNIART-17/rational-weil-slopes; PAPER-BUSHNELL-HENNIART-17/slope; PAPER-BUSHNELL-HENNIART-17/swan; PAPER-BUSHNELL-HENNIART-17/weil-occurrence.

1. Every positive rational is a slope by the preceding realization theorem and hence gives a nontrivial upper jump. Conversely, a nontrivial smooth character of a nontrivial graded ramification quotient occurs in a Weil irreducible whose slope is x; the slope equals integral Swan divided by dimension.

Open frontiers: G2.

### wild-self-twists-nontrivial — A higher-dimensional totally wild representation has a nontrivial self-twist

theorem; missing; BH17 §8.2 p.950.

If σ is totally wild of dimension n>1 then D_0(σ) is nontrivial.

Dependencies: PAPER-BUSHNELL-HENNIART-17/self-twist-groups; PAPER-BUSHNELL-HENNIART-17/relative-p-induction.

1. Pass to a finite p-group image of P_F. Apply relative index-p induction with H=1, since the restriction is n copies of the trivial representation and is reducible. Any nontrivial character of the index-p quotient twists the induced representation to itself.

Open frontiers: G8.

### weil-occurrence — Weil realization of a ramification constituent

theorem; missing; BH17 §2.1 Proposition 2(2) and Complement p.927.

Every smooth irreducible representation of R_F(ε), ε>0, or of R_F^+(ε), ε≥0, occurs in the restriction of an irreducible smooth complex Weil representation.

Dependencies: PAPER-BUSHNELL-HENNIART-17/profinite-occurrence; PAPER-BUSHNELL-HENNIART-17/weil-group; PAPER-BUSHNELL-HENNIART-17/smooth-weil; PAPER-BUSHNELL-HENNIART-17/upper-filtration.

1. Apply the closed-profinite-subgroup occurrence theorem inside G_F and restrict its finite-image representation to dense W_F. The image in the finite quotient is unchanged, so irreducibility is preserved.

Open frontiers: G1.

### length-additivity — Existing additivity of module length

theorem; library; Mathlib/RingTheory/Length.lean:170 at 082e2d3; helper for BH17 §4.1.

For a ring R and R-linear maps f:N→M, g:M→P, if f is injective, g is surjective and Function.Exact f g, then Module.length R M = Module.length R N + Module.length R P in ℕ∞.

Dependencies: none.

Pinned imports: mathlib:Module.length_eq_add_of_exact.

1. Apply the pinned theorem; for the finite quotients used here first establish finite length, then take the corresponding natural-number equality.

### relative-index-tower — Existing relative additive index tower law

theorem; library; Mathlib/GroupTheory/Index.lean:127, to_additive of Subgroup.relIndex_mul_relIndex at 082e2d3.

For additive subgroups H≤K≤L of an additive group, H.relIndex K * K.relIndex L = H.relIndex L. In a finite-index situation this is [K:H][L:K]=[L:H].

Dependencies: none.

Pinned imports: mathlib:AddSubgroup.relIndex_mul_relIndex.

1. Import the additive theorem generated by the pinned to_additive declaration. Infinite index is represented by zero; prove finiteness before using positive real division.

### lattice-volume-index — Local additive lattice measure and finite index

theorem; missing; BH17 §4.1 pp.932–933; independent expansion of the volume argument.

Let F be a nonarchimedean local field with residue cardinal q, V a finite-dimensional F-vector space with its finite-dimensional topology, and μ a nonzero additive Haar measure. For full O_F-lattices N⊆L⊆V, the quotient L/N is finite of finite O_F-length ℓ and μ(L)/μ(N)=[L:N]=q^ℓ. For arbitrary full lattices L,L′ the ratio μ(L)/μ(L′) is an integral power of q.

Dependencies: PAPER-BUSHNELL-HENNIART-17/local-fields; PAPER-BUSHNELL-HENNIART-17/length-additivity; PAPER-BUSHNELL-HENNIART-17/relative-index-tower; AutomorphicLFunctionsAndLocalFactors:AL.0.

1. A full lattice means a finitely generated O_F-submodule spanning V. As O_F is a DVR, it is free of rank dim_F V; a lattice basis identifies it with O_F^r, hence it is compact open. Thus 0<μ(L)<∞. Use the existing local-field topology and algebra, not a new local-field carrier.

2. Express a finite generating set of L in a lattice basis of N and bound the finitely many denominators: π^t L⊆N for some t≥0. The quotient is a quotient of (O_F/π^t)^r. Each successive π-adic quotient of O_F/π^t is k_F, so it is finite. This also proves finite length.

3. A finite module over the local ring O_F has a composition series. For a simple factor S, any nonzero element gives a surjection O_F→S; its kernel is the unique maximal ideal, so S≅k_F. In a finite short exact sequence every fiber of the surjection has cardinality the kernel. Induction gives |L/N|=q^length(L/N), using the imported length additivity and length of a composition series.

4. Choose the finitely many additive cosets of N in L. They are disjoint measurable translates of N, all of measure μ(N), so finite additivity gives μ(L)=[L:N]μ(N). This is volume of a compact open subset, not covolume of a discrete real lattice.

5. For arbitrary L,L′ take a full sublattice N contained in both (a sufficiently deep uniformizer multiple of L). Divide their two finite-index identities: μ(L)/μ(L′)=q^(length(L/N)−length(L′/N)). The index tower law proves invariance under further common refinement.

Test `latticeVolume_uniformizer_rank_two` (computation): For V=F² and L=O_F², μ(πL)/μ(L)=q^−2.

Test `latticeVolume_equal_lattices` (degenerate): For N=L the quotient has one element, length zero and measure ratio one.

Test `latticeVolume_not_discrete_covolume` (non-example): For N=πO_F⊊L=O_F, μ(N)<μ(L), whereas the covolume ratio for discrete real lattices would have the reverse containment direction.

### exact-lattice-comparison — Choice independence of an exact lattice volume ratio

theorem; missing; BH17 §4.1 pp.932–933; independent expansion of the volume argument.

Fix an exact F-linear complex 0→U→V→V→U→0 with finite-dimensional U,V, fixed maps, and fixed nonzero additive Haar measures μ_U,μ_V. For any full O_F-lattice subcomplex L=(L0,L1,L2,L3) exact at every position, C(L)=μ_U(L0)μ_V(L2)/(μ_V(L1)μ_U(L3)) is independent of L and of the two Haar normalizations, and is a unique integral power of the residue cardinal q.

Dependencies: PAPER-BUSHNELL-HENNIART-17/lattice-volume-index; PAPER-BUSHNELL-HENNIART-17/length-additivity.

1. For exact full lattice complexes L,L′, choose t≥0 so M_i=π^t L_i⊆L_i∩L′_i for all four i. F-linearity makes multiplication by π^t an isomorphism of L onto M, so M is exact. Termwise intersection itself need not be exact.

2. The quotient complex Q=L/M is exact: if dx∈M_{i+1}, exactness of M supplies m∈M_i with dm=dx; then x−m∈ker d in L, hence is an image in L. At the left endpoint the same argument and injectivity give zero kernel; surjectivity at the right endpoint descends. The same applies to L′/M. Every quotient is finite.

3. Let B=im(Q1→Q2). The short exact sequences 0→Q0→Q1→B→0 and 0→B→Q2→Q3→0 give ℓ(Q0)+ℓ(Q2)=ℓ(Q1)+ℓ(Q3) by the pinned length theorem. Consequently |Q0||Q2|=|Q1||Q3|.

4. Apply the four measure/index identities and cancel the alternating quotient cardinalities. This gives C(L)=C(M)=C(L′). Positivity and finiteness justify all divisions.

5. Each same-space ratio μ_U(L0)/μ_U(L3) and μ_V(L2)/μ_V(L1) is a power of q by lattice-volume-index, so their product is q^c for c∈Z. Since q>1 this integer is unique. Each measure appears once upstairs and downstairs, so independent positive rescalings cancel.

6. This compares lattice choices for fixed maps. It does not show that an arbitrary rescaling of the final map preserves C. In the scalar complex with first map identity, middle zero and last map λ·identity, C=|λ|_F^−1; nonunit λ changes it.

Test `exactLattice_intersection_failure` (non-example): In 0→F→F²→F²→F→0 with i(x)=(x,0), d(x,y)=(y,0), s(x,y)=y, let L have standard lattices and let L′ differ only at position 1, where it is O_F(1,0)+O_F(π^−1,1). Both are exact, but d(L1∩L′1)=πO_F×{0} differs from ker(s|L2∩L′2)=O_F×{0}.

Test `exactLattice_common_scaling` (compatibility): For exact L, M=π^t L is exact and C(M)=C(L), since the alternating dimensions are zero.

Test `exactLattice_last_map_scaling` (non-example): For U=V=F and maps (identity,zero,λ·identity), take lattices (O_F,O_F,O_F,λO_F); C=|λ|_F^−1, so λ=π gives C=q, not 1.

### lattice-dilation — Scalar dilation of a local-field lattice

theorem; missing; BH17 §4.1 pp.932–933; independent expansion of the volume argument.

Let E/F be a finite extension of nonarchimedean local fields with residue degree f and q_E=q_F^f. Let W be an r-dimensional E-vector space and Λ a full O_E-lattice. For β∈E× with v_E(β)=−m, m∈Z, and an additive Haar measure on W, μ(βΛ)/μ(Λ)=q_E^(mr)=q_F^(fmr).

Dependencies: PAPER-BUSHNELL-HENNIART-17/lattice-volume-index; PAPER-BUSHNELL-HENNIART-17/local-fields.

1. Choose an O_E-basis of Λ. Write β=π_E^−m u for u∈O_E×; multiplication by u preserves Λ.

2. For m≥0 the filtration from Λ to π_E^−mΛ has m successive quotients of cardinality q_E^r, one residue coordinate per basis vector. Apply the measure/index identity repeatedly.

3. For m<0 reverse the containment and take reciprocals; m=0 is the unit case. Convert q_E to q_F^f using the residue-field degree.

Test `latticeDilation_unit` (degenerate): A unit β preserves Λ and its Haar measure.

Test `latticeDilation_unramified_quadratic` (computation): For unramified quadratic E/F, r=2 and v_E(β)=−1, the volume ratio is q_F^4.

Test `latticeDilation_sign` (computation): For β=π_E and r=1, the ratio is q_E^−1, not q_E.

## Validation

Five new diagnostic groups passed 1,317 finite/rational cases: 81 exact cyclic p-power quotient complexes, 330 signed dilation cases, 768 conditional minimal exponents, 72 sheared-intersection integer cases, and 66 last-map-rescaling cases. These are not formal proofs or an implementation of local fields/Haar measure. The earlier eight diagnostic groups (10,680 cases) are preserved as earlier-worker provenance and were not rerun. The paper schema checker passes; intake reports three files and zero problems. Structural checks pass for all 145 items/350 edges, 42 definition/construction APIs and tests, routing, request coverage, construction order, thirteen current non-self input hashes and six pinned declaration hashes. The inherited pre-edit result hash remains provenance. All 48 relevant regression tests pass (9 paper, 3 paper-queue, 7 source-issue, 29 intake).

No Lean file is authorized by this paper issue, and no Lean compilation is claimed. All proposed signatures, API items and tests remain planning outlines. The nine open gates prevent a completion claim.
