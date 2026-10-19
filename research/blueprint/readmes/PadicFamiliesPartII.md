# Hida and Coleman families, Part II: higher coherent cohomology

A p-adic family in one degree does not capture singular coherent weights: classes can move between adjacent degrees, and the obstruction to a classical form can be a differential between supported cohomology groups. This roadmap extends **PadicFamilies** in that direction. Its concrete outputs are PEL small-slope continuation, mixed Hilbert ordinary complexes and weight-two doubling, a completed-cohomology Eichler–Shimura filtration, the singular Sen–Cousin comparison, and four finite projective genus-two Hida modules.

The [packet](../packets/PadicFamiliesPartII.json) is a complete target-level planning pass. Every stage is **planned**; none is closed. A target whose proof uses a recorded gap is a target for the future library, not an established consequence of the supplied dependencies. Every implementation status is unchecked. The 14 gaps and 21 supplier requests below are part of the result and determine what must be settled before a stage can close.

The general machinery already has an owner: [HigherHidaAndColemanTheory](HigherHidaAndColemanTheory.md). Its 66-node packet supplies dynamical ordinary cohomology, supported integral Siegel complexes, the general higher-Coleman sheaves and families, eigenvarieties, Serre duality and the core singular Klingen complex. This reader imports those declarations by identifier. It does not reconstruct that roadmap or the abstract Fredholm/eigenvariety machine of PadicFamilies. The two Part II identifiers arose from the same five paper routes; the packet proposes an eventual assembly under one identity while retaining existing supplier identifiers.

No period-module or family L-function construction is added merely because it occurs in the parent title. The assigned five continuations concern higher coherent cohomology. Potential modularity, Taylor–Wiles patching, the stronger Hilbert auxiliary vanishing theorem of BCGP21 §5.9, and torsion conjectures are consumers or separate targets, rather than conclusions here.

## Starting point and ownership

The pinned baseline is Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` with Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The actual statements of `LinearMap.prod`, `LinearMap.coprod`, `LinearMap.eventually_isCompl_ker_pow_range_pow` and `Module.Projective` were read at those pins. The first two build the companion-operator prototype. The Fitting theorem assumes both Artinian and Noetherian conditions on the module; it does not supply a derived ordinary projector. Projectivity is the existing splitting property, not a new record carrying the desired finiteness theorem.

The reviewed audit is `data/library-coverage.json`, AUDIT-15, especially PadicFamilies L0–L5 and the overconvergent coefficient layers O0–O8. Its positive Fitting finding was confirmed in source. The current read-only Tau Ceti tree was also searched at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` (current Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`). No implementation of the new higher coherent-family or Sen–Cousin carriers was found in that search. This is a scoped source-search result, not an assertion that an index is exhaustive.

Current upstream AdicSpaces and AlgebraicVectorBundles were read in full. The former supplies Huber/adic-space foundations, with the analytic/formal comparison requested from AdicSpacesPartII; the latter owns ordinary vector-bundle foundations. Current IntegralHeckeAndGaloisDeterminants already plans finite Hecke images, derived ordinary summands, telescope comparisons and the ghost-nilpotence bound for bounded finite complexes. Current SmoothRepresentationsOfLocalGroups already plans the positive genus-two Klingen Hecke algebra. Those generic constructions stay with their owners. The new geometric formulas below must match their conventions. The algebraic Verma stage of current LieHighestWeight was checked: its Lie algebra is finite-dimensional, but Verma modules need not be. It does not provide the canonical completion/continuous-dual analytic localization required here. That missing continuation is explicit, and the unrelated nilpotent-orbit roadmap is not used as its substitute.

The following exact imported declarations organize the interface. Each is a planned declaration of its supplier, with that supplier’s hypotheses and open obligations; it is not a baseline implementation.

| Needed interface | Existing owner |
| --- | --- |
| Shifted weights, support orders and scalar normalization | HigherHidaAndColemanTheory:A0/weight-dictionary, A0/slope-conditions, A0/scalar-normalization |
| Derived ordinary summands and supported Cousin formalism | HigherHidaAndColemanTheory:D1/ordinary-localization, D1/supported-cousin |
| Fixed integral Siegel theory and full-torus control | HigherHidaAndColemanTheory:H2/regular-control, I3/iwasawa-complex, I3/derived-control |
| Integral genus-two amplitudes and family pairing | HigherHidaAndColemanTheory:I3/integral-amplitudes, I3/family-duality |
| Supported geometric Coleman theory and analytic families | HigherHidaAndColemanTheory:C4/bruhat-cousin, C4/geometric-vanishing, F5/analytic-sheaves, F5/perfect-slopes, F5/automorphic-bgg |
| Ordinary Coleman/Hida comparison and sharp Siegel bounds | HigherHidaAndColemanTheory:B7/family-comparison, B7/sharp-siegel |
| Four C₂ weights and the one-variable Klingen complex | HigherHidaAndColemanTheory:X8/c2-weight-table, X8/klingen-complex, X8/klingen-control |
| Derived completed tower and classical analytic comparison | CompletedCohomologyPartII:CC.2/derived-completed-tower, CC.6/analytic-classical-comparison, CC.7/derived-completed-support-triangle |
| Coherent shriek functor and finite duality | SchemeAndStackFoundations:key/coherent-duality; the integral fundamental-class refinements still need SF.2 |

## Conventions that survive every comparison

Use cohomological grading, so Hⁱ(C[r])=Hⁱ⁺ʳ(C). Derived fibers are derived tensors until concentration and flatness are proved. A finite-slope block means a finite nonzero-eigenvalue window. The multi-place local operators act jointly on such a block; local compactness on the full complex is asserted only where a radius-improvement argument supplies it. Valuations have v_p(p)=1.

A boundary divisor is denoted D, so the subcanonical coefficient is ω^κ(−D). Cuspidal and canonical support have different integral amplitude bounds and are never interchanged through a change of notation. Neatness, fan refinement, polarization elements and finite-character components are retained in every geometric correspondence.

For Siegel coherent weights the imported dictionary is κ_w(ν)=−w₀,M w(ν+ρ)−ρ and ν_w(κ)=−w⁻¹w₀,M(κ+ρ)−ρ. The BP family specializes at −ν. Section F8 explicitly transports the coefficient ring by [t]↦[t⁻¹] to compare with BCGP’s +λ convention, and still includes E(−λ). A finite-order character is handled through its level/diamond action, not by inserting an analytic character into an absolute Weyl-group formula. The full finite torus at p=2 is not made semisimple.

Integral higher-Hida sharp amplitudes are used only in genus one and two. All-genus rational amplitudes and general higher-Coleman statements keep their supplier’s separate hypotheses. In the completed-cohomology comparison, the general datum is Hodge type and locally quasi-split. The arithmetic Sen convention has Q_p(1) of Hodge–Tate weight −1 and Sen value +1.

The PEL continuation branch allows the BPS unramified type-A/C data; the Hilbert branch instead assumes p>2 split completely in a totally real F and specifies the common-similitude descent restriction. F8 allows every prime p. A hypothesis stated for one branch does not silently propagate to the others.

## Layer map

- **P0 — PEL degrees and normalized correspondences.** Fix Morita-normalized degrees, the multi-place Iwahori correspondences and their scalar factors. Prove degree monotonicity and the uniform progress estimate used by continuation.
- **P1 — PEL analytic continuation and classicality.** Construct the bad-complement filtration and Kassaei path sums. Prove bounded gluing and algebraization under an explicit positive-weight strict inequality; state the boundary and dimension hypotheses.
- **K2 — Singular Siegel weight: spherical and slope refinements.** Extend the imported Klingen complex by the spherical operator, rank-zero nilpotence and special-fiber rank-open amplitude, a corrected BGG slope comparison, and the localized Euler theorem. Keep the stronger torsion claim as a conjectural boundary.
- **H3 — Hilbert partial-ordinary Hida complexes.** Build the multivariable height-one tower, universal coefficient sheaf and normalized commuting operators. Prove cuspidal amplitude on the spherical special-fiber mixed-rank open and, separately, integral derived family control, keeping the H⁰/H¹ global restriction endpoints.
- **D4 — Hilbert weight-two doubling.** Define partial Frobenius on the interior special fiber and its normalized integral trace actions. Prove the quadratic relation, generalized-eigenspace doubling injection and two unit-root projectors; retain the domains when extending the cohomological action.
- **C5 — Hilbert higher Coleman families and comparison.** Use analytic coefficient torsors on all mixed loci, finite perfect slope blocks and corrected relative BGG scaling. Prove multi-place small-slope continuation, then the rational one-Klingen-place ordinary comparison.
- **E6 — Completed cohomology and Eichler–Shimura.** Bind the completed tower to analytic localization of O(𝔤,𝔟)_{λ-alg} through its canonical completion and continuous dual. Construct the higher-Coleman spectral sequence and arithmetic Sen action, with ordinary degree indexing and the genus-two boundary localization explicit.
- **S7 — Singular Sen operator and classicality.** At λ=(1,1;w), construct the repeated Sen block. Identify its nilpotent map with the supported Cousin differential and deduce classicality for a de Rham eigenpacket under the independent four-piece balance assumption of BCGP25 Theorem 4.12.4(3).
- **F8 — Four integral projective Hida modules.** Extract the four finite projective genus-two modules from the imported ordinary complexes. Prove classical and higher-Coleman specialization, integral duality, tame group-ring projectivity and fixed-central-character base change.

The following targets carry their exact packet identifiers. Proposed declaration names and tests on heavy carriers are specifications for the future library; the compact Lean file includes only light statements available at the pins.

## P0 — PEL degrees and normalized correspondences

**Standing hypotheses.**

Use a PEL datum of type A or C satisfying BPS Hypothesis 1.1.1: the totally real field is unramified at p; in type A each p-adic place splits in the CM field; the algebra is a product of matrix algebras over unramified p-adic fields with maximal order and perfect integral pairing. The prime p splits completely in the reflex field.

Fix a sufficiently large p-adic coefficient field, neat tame level, compatible toroidal fans, a polarization convention and totally positive elements x_i with valuation one at the selected p-adic place and zero at the others. Type-A signatures (a_i,b_i) are constant at embeddings over a place.

### Morita degrees — `P0/degree`

At a place i of residue degree d_i let δ_i(x)=deg(H_{i,a_i}) for the Morita component of the distinguished isotropic Iwahori subgroup, with valuation v_p(p)=1. It lies in [0,d_i a_i]. In type A use one member of the polarization-paired factors. Degrees are invariant under extension of complete valued fields and additive in exact sequences of finite flat groups.

**Proof plan.** Import the PEL moduli, finite-flat degree and polarization-paired Morita equivalence. Apply additivity before restoring the residue-degree factor; retain the integral model in the valuation domains.

**Direct inputs.** `PELModuli:M4`; `HodgeTateAndCanonicalSubgroups:T0`.

**Source.** BPS, §§1.1–1.2, pp. 976–984; §3.1, pp. 991–992. The degree is the coordinate measuring approach to the multiplicative Iwahori locus.

**API.**

- `TauCeti.PadicFamiliesPartII.pelDegree` (data): δ_i is the degree of the selected Morita component.

- `TauCeti.PadicFamiliesPartII.pelDegree_bounds` (relation): 0≤δ_i≤d_i a_i.

- `TauCeti.PadicFamiliesPartII.pelDegree_baseChange` (functoriality): δ_i is unchanged by complete valued-field extension.

- `TauCeti.PadicFamiliesPartII.pelDegree_exact` (compatibility): A short exact sequence gives the sum of degrees.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.pelDegree_etale` (computation): An étale Morita component has δ_i=0.

- `TauCeti.PadicFamiliesPartII.pelDegree_multiplicative` (computation): A multiplicative component of height d_i a_i has δ_i=d_i a_i.

- `TauCeti.PadicFamiliesPartII.pelDegree_morita` (non-example): Matrix multiplicity is removed: for a matrix algebra of size m the coordinate is the component degree, not m times that number.

**Consumers.** BPS Proposition 3.2.1: Defines the closed degree bands. BPS Theorem 5.3.1: Identifies the initial ordinary neighborhood.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### PEL normalized U operators — `P0/hecke`

For the complement correspondence at i set U_i=p^(−n_i)Tr_{p₁}∘π_i^*∘p₂^*, where n_i=d_i a_i b_i in type A and n_i=d_i a_i(a_i+1)/2 in type C. The coefficient pullback uses the chosen isogeny and polarization element x_i. The operators commute at distinct places; they preserve δ_j for j≠i. Their definition includes the tame-level and fan transition, rather than assuming a single fan is invariant.

**Proof plan.** Construct quotient isogenies on the imported PEL correspondence. Use finite étale generic projections and coefficient pullback; compare refinements of fans. Identify iterated quotients for distinct primary factors to prove commutation.

**Direct inputs.** `PadicFamiliesPartII:P0/degree`; `PELModuli:M4`.

**Source.** BPS, §2, pp. 985–991; Proposition 3.1.1, p. 991. Fixes the scalar and polarization dependence of each operator.

**API.**

- `TauCeti.PadicFamiliesPartII.pelU` (constructor): The normalized trace-pullback map on ω^κ sections.

- `TauCeti.PadicFamiliesPartII.pelU_apply` (simp): Evaluation sums the coefficient pulls over admissible complements and multiplies by p^(−n_i).

- `TauCeti.PadicFamiliesPartII.pelU_commute` (relation): U_i U_j=U_j U_i for i≠j.

- `TauCeti.PadicFamiliesPartII.pelU_changeFan` (functoriality): The map agrees under a common fan refinement.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.pelU_genusOne` (computation): Type C with d=a=1 has n=1.

- `TauCeti.PadicFamiliesPartII.pelU_genusTwo` (computation): Type C with d=1,a=2 has n=3.

- `TauCeti.PadicFamiliesPartII.pelU_unitChoice` (non-example): Changing x_i by a positive unit requires its induced action on the coefficient/polarization datum; equality without that identification is not the definition.

**Consumers.** BPS Theorem 4.4.1: Splits iterates into good and bad paths. BPS Theorem 5.3.1: Measures the eigenvalue against precisely n_i.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Degree monotonicity and rigidity — `P0/degree-monotonicity`

If y occurs in U_i(x), then δ_i(y)≥δ_i(x), with all other degree coordinates fixed. Equality forces the corresponding p-torsion extension to split as a truncated Barsotti–Tate group and forces δ_i(x) to be an integer.

**Proof plan.** Apply additivity to the kernel and quotient under the isogeny. Use the polarization to identify the complementary degree. Analyze equality through the BT₁ splitting criterion.

**Direct inputs.** `PadicFamiliesPartII:P0/hecke`; `HodgeTateAndCanonicalSubgroups:T0`.

**Source.** BPS, Propositions 3.1.1 and 3.1.3, pp. 991–993. Equality is the rigidity input for a positive degree gap.

**Acceptance.** The multiplicative endpoint is fixed; equality at a nonintegral degree is excluded by the BT₁ criterion.

### Uniform progress on degree bands — `P0/uniform-progress`

For an integer 0≤n≤d_i a_i−1 and rational 0<η≤ν<1, one iterate U_i^N, with N uniform on the quasi-compact domain, sends the band [d_i a_i−n−ν,d_i a_i] into [d_i a_i−n−η,d_i a_i]. Other coordinates remain fixed.

**Proof plan.** Restrict to a compact band away from the integral equality locus. Use monotonicity and quasi-compactness to bound the positive increment from below. Take N exceeding the band length divided by that increment. Exhaust any half-open conditions in other coordinates by closed rational boxes.

**Direct inputs.** `PadicFamiliesPartII:P0/degree-monotonicity`.

**Source.** BPS, Proposition 3.2.1, pp. 993–994. Provides uniform continuation rather than a point-dependent iteration.

**Acceptance.** N is uniform on each closed rational band, while its existence is not deduced from quasi-compactness of a half-open auxiliary strip.

**Layer status: planned.** Obtain exact supplier nodes for PELModuli:M4 Obtain exact supplier nodes for HodgeTateAndCanonicalSubgroups:T0.

## P1 — PEL analytic continuation and classicality

**Standing hypotheses.**

Use a PEL datum of type A or C satisfying BPS Hypothesis 1.1.1: the totally real field is unramified at p; in type A each p-adic place splits in the CM field; the algebra is a product of matrix algebras over unramified p-adic fields with maximal order and perfect integral pairing. The prime p splits completely in the reflex field.

Fix a sufficiently large p-adic coefficient field, neat tame level, compatible toroidal fans, a polarization convention and totally positive elements x_i with valuation one at the selected p-adic place and zero at the others. Type-A signatures (a_i,b_i) are constant at embeddings over a place.

### PEL strict slope region — `P1/strict-slope`

For each place put c_i=min_j k_{i,j} in type C and c_i=min_j(k_{i,j}+l_{i,j}) in type A, using the terminal dominant entries. With s_i=v_p(α_i)≥0, the admitted region is s_i+n_i<c_i. Equivalently choose rational ε∈(0,1) with n_i+s_i−(1−ε)c_i<0. This forces c_i>0.

**Proof plan.** Use the weight ordering to bound all coefficients by the terminal entries. Choose ε by the strict inequality. The sign c_i>0 makes multiplication of a degree lower bound legitimate.

**Direct inputs.** `PadicFamiliesPartII:P0/hecke`.

**Source.** BPS, Lemma 4.4.5, p. 1004; Theorem 5.3.1, p. 1011. Makes the norm-estimate sign hypothesis explicit.

**API.**

- `TauCeti.PadicFamiliesPartII.pelSmallSlope` (data): For rational c,s and n∈N, pelSmallSlope n c s means s+n<c.

- `TauCeti.PadicFamiliesPartII.pelSmallSlope_iff` (characterisation): The region uses a strict inequality; its boundary is excluded.

- `TauCeti.PadicFamiliesPartII.pelSmallSlope_mono` (relation): Increasing c or decreasing s preserves the region.

- `TauCeti.PadicFamiliesPartII.pelSmallSlope_positive` (relation): If s≥0 and the region holds, then c>0.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.pelSlope_inside` (computation): n=3,c=4,s=0 lies in the region.

- `TauCeti.PadicFamiliesPartII.pelSlope_boundary` (non-example): n=3,c=3,s=0 does not lie in the region.

- `TauCeti.PadicFamiliesPartII.pelSlope_fraction` (computation): n=3,c=4,s=1/2 lies in the region.

**Consumers.** BPS Lemma 4.4.5: Makes all-bad paths contracting. BPS Theorem 5.3.1: States the classicality threshold.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

**Open proof leaves.** Scope of the signed PEL estimate.

### Finite-slope first extension — `P1/first-extension`

A simultaneous U_i-eigensection with every α_i≠0, initially defined near the multiplicative Iwahori locus, extends uniquely to all δ_i>d_i a_i−1. This first step needs nonzero eigenvalues, with no small-slope restriction.

**Proof plan.** Use uniform progress to pull every compact sub-band into the original domain. Define the extension by α_i^(−N)U_i^N f; compare different N by the eigenrelation. Extend one place at a time, using commutation to retain the other eigenrelations.

**Direct inputs.** `PadicFamiliesPartII:P0/uniform-progress`.

**Source.** BPS, Proposition 4.2.1, pp. 996–997. Separates finite-slope continuation from contracting continuation.

**Acceptance.** Changing N after the image enters the original domain gives the same extension, and the nonzero eigenvalue hypothesis cannot be removed.

### Bad-complement filtration — `P1/bad-filtration`

On a quasi-compact degree box let N(x,β) count complements of Morita degree at least 1−β, and V_k={N(x,β)≥k}. These form a decreasing finite sequence of quasi-compact opens. Let B_k parametrize all ordered k-tuples of distinct complements, with ambient finite étale projection p_k:B_k→X. The bad-degree subdomain B_{k,β} is quasi-compact open and has image V_k; its restriction to V_k is not asserted finite. On V_k∖V_{k+1}, constant fiber cardinality makes the bad and good first projections finite étale. Each quotient coordinate q_j:B_k→X is used separately; B_k→X^k is not asserted finite étale.

**Proof plan.** Realize ordered distinct complement tuples in a finite correspondence. Express degree conditions as closed rational bounds and use separatedness for finite intersections. Use the ambient finite étale p_k to descend quasi-compact images. Restrict to a constant-count stratum before applying the finite-étale splitting criterion. Enlarge β to obtain strict neighborhoods.

**Direct inputs.** `PadicFamiliesPartII:P0/degree`; `PadicFamiliesPartII:P0/hecke`.

**Source.** BPS, Definitions 4.3.2–4.3.5, Lemma 4.3.6, Proposition 4.3.7, pp. 997–999; Lemma 4.4.3, p. 1003. Supplies the finite filtration with a corrected quasi-compactness argument.

**API.**

- `TauCeti.PadicFamiliesPartII.badCount` (data): Counts complements satisfying deg L≥1−β.

- `TauCeti.PadicFamiliesPartII.badFiltration` (projection): V_k is the locus badCount≥k.

- `TauCeti.PadicFamiliesPartII.badFiltration_antitone` (relation): V_{k+1}⊆V_k and V_0 is the initial domain.

- `TauCeti.PadicFamiliesPartII.badTuple_coordinate` (functoriality): Each q_j separately gives a quotient point and degree pullback.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.badFiltration_zero` (degenerate): No bad complements implies V_1 is empty and U is entirely good.

- `TauCeti.PadicFamiliesPartII.badFiltration_one` (computation): Exactly one bad complement puts a point in V_1\V_2.

- `TauCeti.PadicFamiliesPartII.badFiltration_cover` (non-example): The differences V_k\V_{k+1} alone are not the admissible open cover used for gluing.

**Consumers.** BPS Theorem 4.4.1: Indexes first-good paths. BPS Proposition 4.5.6: Supplies admissible strict neighborhoods for gluing.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### First-good path decomposition — `P1/path-decomposition`

For N≥1, partition every length-N correspondence path by its first good step: T_j consists of j bad steps followed by one good step, for 0≤j<N, and R_N consists of N bad steps. In the source’s correspondence-composition convention, U_i^N=Σ_{j=0}^{N−1}U_i^{N−1−j}∘T_j+R_N, where the left factor supplies the remaining arbitrary steps. After contravariant pullback the first-good terms give the ordered bad-then-good section operators in the Kassaei sum. The labels form a finite ordered tree compatible with the bad-count strata and their strict neighborhoods.

**Proof plan.** Induct on N by replacing each all-bad remainder by its next good and bad parts. Use the strict-neighborhood preservation of Proposition 4.3.10 to make every composed correspondence defined. Use individual coordinate maps to verify quasi-compactness at every finite level.

**Direct inputs.** `PadicFamiliesPartII:P1/bad-filtration`; `PadicFamiliesPartII:P1/first-extension`.

**Source.** BPS, Proposition 4.3.10 and Theorem 4.4.1, pp. 1000–1001; Lemma 4.4.3, p. 1003. Makes iterated operators and their domains explicit.

**Acceptance.** At N=2 the four good/bad words all occur exactly once; the first-good term at step j+1 has N−j−1 further steps. Domains and operator order are checked before passing from correspondences to sections.

### Bad-path contraction — `P1/contraction`

On a branch whose bad complements have degree at least 1−ε, the normalized bad map has norm at most p^(n_i−(1−ε)c_i). Therefore α_i⁻¹U_i^bad has norm at most q_i=p^(n_i+s_i−(1−ε)c_i)<1 in the admitted slope region.

**Proof plan.** Apply the coefficient representation bound to each weight component. Use c_i>0 before inserting the degree lower bound. The nonarchimedean trace bound and scalar normalization give the displayed exponent.

**Direct inputs.** `PadicFamiliesPartII:P1/strict-slope`; `PadicFamiliesPartII:P1/path-decomposition`.

**Source.** BPS, Lemma 4.4.5, p. 1004; Lemmas 4.5.3 and 4.5.5, pp. 1005–1006. Identifies the contraction and overlap-decay constants.

**Acceptance.** In genus two n=3,c=4,s=0, choosing 0<ε<1/4 makes the exponent negative. With c=3,s=0 it does not.

**Open proof leaves.** Scope of the signed PEL estimate.

### Kassaei path sums — `P1/kassaei`

Define f_N by summing α_i^(−j−1) times each j-bad-then-good path applied to f, for 0≤j<N. These sections are uniformly bounded and their discrepancies on overlaps are at most Mq_i^N. Choose integers A_N→∞ below the resulting valuation bound; reducing A_N by the fixed loss n_i+s_i makes the reductions compatible from N+1 to N.

**Proof plan.** Use the path decomposition and eigenrelation to bound the remainder. Choose admissible strict neighborhoods of the bad strata, and glue modulo p^{A_N}. Pass to the inverse limit of integral bounded sections, then invert p.

**Direct inputs.** `PadicFamiliesPartII:P1/contraction`.

**Source.** BPS, Definition 4.5.2, Lemmas 4.5.3 and 4.5.5, and Propositions 4.5.6–4.5.7, pp. 1005–1008. Constructs the contracting extension and its compatibility.

**API.**

- `TauCeti.PadicFamiliesPartII.kassaeiPartialSum` (constructor): The finite first-good path sum f_N.

- `TauCeti.PadicFamiliesPartII.kassaeiPartialSum_bound` (relation): A uniform bound independent of N.

- `TauCeti.PadicFamiliesPartII.kassaeiPartialSum_overlap` (compatibility): Differences on admissible overlaps have norm at most Mq_i^N.

- `TauCeti.PadicFamiliesPartII.kassaeiPartialSum_refine` (functoriality): Refining neighborhoods preserves the reductions at all common precisions.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.kassaei_noBad` (degenerate): When the bad part is zero, f_1=α_i⁻¹U_i f and all sums f_N for N≥1 agree.

- `TauCeti.PadicFamiliesPartII.kassaei_firstTerm` (computation): The N=1 term is α_i⁻¹U_i^good f.

- `TauCeti.PadicFamiliesPartII.kassaei_precision` (non-example): A fixed precision A is insufficient; the inverse-limit extension uses A_N tending to infinity.

**Consumers.** BPS Lemma 4.5.7: Provides a compatible bounded extension. BPS Theorem 5.3.1: Crosses the remaining integral degree walls.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Bounded continuation across all walls — `P1/bounded-extension`

The compatible path sums give a unique bounded analytic section on each complete degree box. Exhaust the half-open auxiliary degree conditions by closed rational boxes and glue by uniqueness. Iterating over integral walls and places extends the original eigensection to the full Iwahori rigid variety.

**Proof plan.** Invoke bounded integral-section completeness and the modulo-p^A gluing theorem on admissible covers. Use cofinal closed boxes to avoid asserting quasi-compactness of half-open strips. Compatibility on overlaps follows from the original eigenrelation and the contracting uniqueness argument.

**Direct inputs.** `PadicFamiliesPartII:P1/kassaei`; `PadicFamiliesPartII:P1/first-extension`; `AdicSpacesPartII:R3`.

**Source.** BPS, Proposition 4.1.2, p. 995; Proposition 4.5.7, p. 1008; §5.1, pp. 1008–1009. Separates bounded gluing from the correspondence combinatorics.

**Acceptance.** Two continuations agree on overlapping closed boxes by the same uniqueness argument, so exhaustion changes neither the section nor its Hecke eigenrelations.

### PEL small-slope classicality — `P1/classicality`

Assume every connected component has complex dimension greater than one. A simultaneous overconvergent U_i-eigensection of dominant weight, with s_i≥0 and s_i+n_i<c_i for all i, is the analytification of an algebraic automorphic form at Iwahori level. A cuspidal section remains cuspidal. The modular-curve dimension-one case is imported separately; other dimension-one PEL reductions are a recorded gap.

**Proof plan.** Use bounded continuation on the whole interior. Apply integral Koecher extension on the normal Iwahori compactification, pass through the formal inverse limit, and apply proper GAGA. Normality must come from the actual local model, not replacement by a normalization with changed sections.

**Direct inputs.** `PadicFamiliesPartII:P1/bounded-extension`; `ShimuraCompactifications:C5`; `AdicSpacesPartII:R3/proper-gaga`.

**Source.** BPS, Propositions 5.2.1 and 5.2.4, Corollaries 5.2.2–5.2.3, pp. 1009–1011; Theorem 5.3.1, p. 1011. Algebraizes the continued section with explicit dimension and sign restrictions.

**Acceptance.** The algebraic section analytifies to the original section, and subcanonical boundary vanishing is preserved. Every component satisfies the stated dimension condition.

**Open proof leaves.** Scope of the signed PEL estimate; Dimension-one PEL reduction.

**Layer status: planned.** Scope of the signed PEL estimate Dimension-one PEL reduction Obtain exact supplier nodes for AdicSpacesPartII:R3 Obtain exact supplier nodes for ShimuraCompactifications:C5.

## K2 — Singular Siegel weight: spherical and slope refinements

**Standing hypotheses.**

Use the genus-two Siegel variety over Q with neat tame level prime to p, its compatible toroidal/minimal compactifications and boundary D. The coefficient sheaf is Ω(k,r)=Sym^k(ω)⊗det(ω)^r, with k≥0; each result specifies the extra bound on r.

The singular Klingen Iwasawa complex and its one-variable character convention are imported from HigherHidaAndColemanTheory:X8/klingen-complex and klingen-control. The affinoid-height-one Igusa maps are affine étale, not asserted finite.

### Singular spherical T — `K2/spherical`

For k≥0,r≥2 define T₁=p^(−2−r)T₁′ and T₂=p⁻¹T₂′ on RΓ(X,Ω(k,r)(−D)); T₁′ uses the coefficient pullback and fundamental-class trace along the p-isogeny correspondence, while T₂′ uses the dual factor. Put T=T₁T₂. On the generic fiber T=p^(3−r)(T_{p,1}+(1+p+p²+p³)T_{p,0}). The individual integral correspondence maps need not be finite flat on rank-zero or boundary strata.

**Proof plan.** Use the supplied lci/fundamental-class trace and coefficient map. Prove divisibilities p^{2+r} and p before dividing; extend from the smooth dense locus by normality. Descend over common fan refinements and preserve the subcanonical boundary ideal.

**Direct inputs.** `HigherHidaAndColemanTheory:X8/klingen-complex`; `SchemeAndStackFoundations:key/coherent-duality`; `SchemeAndStackFoundations:SF.2`.

**Source.** P20, §§7.1–7.3, pp. 37–42. Constructs the integral spherical operator used for singular-weight localization.

**API.**

- `TauCeti.PadicFamiliesPartII.singularSphericalT` (constructor): T is the product of the two integrally normalized factors.

- `TauCeti.PadicFamiliesPartII.singularSphericalT_generic` (compatibility): On the generic fiber T=p^(3−r)(T_{p,1}+(1+p+p²+p³)T_{p,0}).

- `TauCeti.PadicFamiliesPartII.singularSphericalT_boundary` (functoriality): T preserves the subcanonical complex and is independent of fan refinement.

- `TauCeti.PadicFamiliesPartII.singularSphericalT_commute` (relation): The factors commute with the Hecke action away from p.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.singularT_r3` (computation): At r=3 the generic scalar is one.

- `TauCeti.PadicFamiliesPartII.singularT_genusTwoDegree` (computation): The spherical T_{p,1} correspondence has degree p(1+p+p²+p³).

- `TauCeti.PadicFamiliesPartII.singularT_trace` (non-example): An unnormalized finite-flat trace on the entire integral correspondence does not define T₁′; the fundamental class is required.

**Consumers.** Pilloni Proposition 8.2.1: Controls the rank≥1 ordinary complex. Pilloni Theorem 14.8.1: Compares the spherical and Klingen theories.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

**Open proof leaves.** Integral fundamental-class trace extension.

### Rank-zero nilpotence — `K2/rank-zero`

There is C(p), independent of tame level, such that for k≥C(p),r≥p²+p the operator T₁ is zero on the rank-zero stratum modulo p. Together with Hasse-invariant commutations this yields nilpotence of the appropriate powers on its thickenings.

**Proof plan.** On p-rank zero every rank-p³ subgroup contains the Frobenius kernel. Factor the isogeny through Frobenius to obtain the extra coefficient divisibility. Apply Artin–Rees to the fundamental-class lattice and a finite cover to make C independent of tame level.

**Direct inputs.** `PadicFamiliesPartII:K2/spherical`.

**Source.** P20, Proposition 7.4.2.2, pp. 49–50; Lemma 7.4.2.6, p. 50. The key vanishing behind the two-term spherical complex.

**Acceptance.** The nilpotence bound is independent of tame level, and passage to a thickening retains a quantitative power rather than asserting immediate vanishing there.

### Spherical ordinary amplitude — `K2/spherical-amplitude`

Write X₁ for the spherical special fiber over F_p and X₁^{≥1} for its p-rank≥1 open. For k>p+1,r≥2 the T-action on RΓ(X₁^{≥1},Ω(k,r)(−D)) is locally finite. For k≥C(p),r≥2 its ordinary part e(T)RΓ(X₁^{≥1},Ω(k,r)(−D)) is a perfect F_p-complex of amplitude [0,1]. The restriction from the global spherical X₁ ordinary complex is a quasi-isomorphism when r≥3; at r=2 it is an isomorphism on H⁰ and injective on H¹. Thus the same global amplitude follows here only for r≥3. No integral global amplitude is inferred from this special-fiber theorem.

**Proof plan.** Build the two-term Hasse resolution over the minimal compactification. Use relative acyclicity and affine rank-one/rank-two minimal strata. Remove the rank-zero contribution by nilpotence and use the exact support sequence; retain the r=2 endpoint.

**Direct inputs.** `PadicFamiliesPartII:K2/rank-zero`; `HigherHidaAndColemanTheory:D1/ordinary-localization`; `ShimuraCompactifications:C5`.

**Source.** P20, Lemma 8.2.1, pp. 52–53; Proposition 8.2.1, pp. 53–54. The local-finiteness and [0,1] conclusions concern X₁^{≥1}; the separate restriction statement has the r=2 endpoint.

**Acceptance.** The [0,1] assertion is on the spherical rank≥1 special fiber. For r=2 the global-to-open map supplies only H⁰-isomorphism and H¹-injectivity; higher global cohomology is not discarded.

### Klingen extension threshold — `K2/extension-bound`

For k,r∈Z put b(k,r)=k+2r−3. For k,r≥0, the strict finite-slope range s<b(k,r) is the torsion-analytic extension range. The relative GL₂ BGG comparison imposes the separate all-degree range s<k−2, and its H⁰/H¹ edge range s<k+1.

**Proof plan.** Read the exponent obtained from the normalized Klingen trace. Keep the geometric and analytic-induction bounds separate before taking their minimum.

**Direct inputs.** `HigherHidaAndColemanTheory:X8/klingen-complex`.

**Source.** P20, §13.3, pp. 88–90; Theorem 14.7.1 and Corollary 14.7.1, pp. 99–100. Pins the two distinct slope thresholds.

**API.**

- `TauCeti.PadicFamiliesPartII.klingenClassicalBound` (data): b(k,r)=k+2r−3.

- `TauCeti.PadicFamiliesPartII.klingenClassicalBound_r2` (simp): b(k,2)=k+1.

- `TauCeti.PadicFamiliesPartII.klingenClassicalBound_shift` (relation): b(k,r+1)=b(k,r)+2.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.klingenBound_02` (computation): b(0,2)=1.

- `TauCeti.PadicFamiliesPartII.klingenBound_32` (computation): b(3,2)=4.

- `TauCeti.PadicFamiliesPartII.klingenBound_01` (computation): b(0,1)=−1; a nonnegative slope never satisfies s<−1.

**Consumers.** Pilloni Theorem 14.7.1: Controls extension from a tube. Pilloni Corollary 14.7.1: Intersects with the BGG bound.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Corrected Klingen BGG scaling — `K2/bgg-scaling`

On germs of analytic induction radii there is the exact sequence Ω(k,r)→F(k,w⁻)det^r→F(−2−k,w⁻)det^{k+r+1}, whose differential is D^{k+1}. With the source/target normalized operators, D^{k+1}U_source=p^{k+1}U_target D^{k+1}. The lower U-slope is −3 in every cohomological degree and 0 in H⁰. Hence algebraic-to-analytic comparison is an isomorphism in all degrees for s<k−2, and is H⁰-isomorphic/H¹-injective for s<k+1.

**Proof plan.** Use the relative GL₂ analytic-induction exact sequence after passing to germs; fixed-radius surjectivity is not claimed. Check D^{k+1}f(pz)=p^{k+1}(D^{k+1}f)(pz), fixing the source diagram sign. Bound p³U on the Čech lattice and use the H⁰ q-expansion lattice for the sharper edge bound.

**Direct inputs.** `PadicFamiliesPartII:K2/extension-bound`; `HigherHidaAndColemanTheory:F5/automorphic-bgg`; `AutomorphicBundles:B5`; `ShimuraCompactifications:C5`.

**Source.** P20, Proposition 13.3.1.1, §13.3.2, and Proposition/Corollary 13.3.3.1, pp. 88–90. Corrects the scaling and derives the two exclusion ranges.

**Acceptance.** A source slope s shifts to s−(k+1) under D^{k+1}; combining with target slope ≥−3 yields the all-degree cutoff s<k−2.

**Open proof leaves.** Klingen integral analytic lattice estimates.

### Torsion continuation and tube comparison — `K2/torsion-continuation`

For k,r≥0, 0≤ε<1 and a nonzero finite U-slope block whose roots all have valuation <b(k,r), global cohomology maps quasi-isomorphically to the height-one tube cohomology. The statement holds for canonical and subcanonical coefficients. Intersecting with the BGG ranges gives all-degree algebraic comparison for s<min(b,k−2), and H⁰-isomorphism/H¹-injectivity for s<min(b,k+1).

**Proof plan.** Choose ε′>0 small enough that b−2ε′(k+r)−s>0 for every root in the finite block. Extend modulo precision growing linearly with the number of bad iterates; lose only a fixed constant on compatibility. For P(X) annihilating a finite block with P(0)≠0, set Q(X)=−(P(X)−P(0))/(XP(0)); this is a polynomial and UQ(U)=1 on the block. Apply this inverse polynomial at every extension step. Use bounded lattices and a continuous finite-block projection to prove completion injectivity; use finite global cohomology for surjectivity.

**Direct inputs.** `PadicFamiliesPartII:K2/bgg-scaling`; `PadicFamiliesPartII:K2/extension-bound`; `ShimuraCompactifications:C5`.

**Source.** P20, §14.6, pp. 97–99; Lemma and Theorem 14.7.1, pp. 99–100. Extends eigenvectors and generalized finite-slope blocks through increasing torsion precision.

**Acceptance.** A nonzero-slope block with a nontrivial Jordan part uses the inverse polynomial modulo its annihilator, rather than an inverse of a single selected eigenvalue. For P=X²+2X+1 and U=−1, R=−(P−P(0))/P(0) satisfies R(U)=1; omitting the coefficient 2 in its linear term gives 0. This distinguishes the continuation polynomial R=XQ from the inverse polynomial Q.

**Open proof leaves.** Finite-block topology in torsion comparison; Klingen integral analytic lattice estimates.

### Localized Klingen Euler characteristic — `K2/euler-zero`

Let m be an away-from-Np Hecke maximal ideal whose residual representation is absolutely irreducible, unramified outside Np, with det(1−Xρ̄(Frob_ℓ)) equal to the normalized degree-four Hecke polynomial and multiplier ℓ³Θ(T_{ℓ,0}). Then χ_Λ(M_m)=0 on each character component of the one-variable Klingen algebra. This asserts zero virtual rank, not torsion of both cohomology modules.

**Proof plan.** Use the imported perfect two-term complex and choose a sufficiently large classical weight in each component. Use the matching finite Satake eigenspace/ordinary projector in the spherical-to-Klingen comparison. At that same finite representation, the localized holomorphic and generic limits of discrete series have balanced coherent multiplicities. Derived base change gives equal virtual rank at every weight of a component; treat p=2 by its full local Iwasawa algebra rather than semisimple finite characters.

**Direct inputs.** `HigherHidaAndColemanTheory:X8/klingen-control`; `PadicFamiliesPartII:K2/spherical-amplitude`; `AutomorphicBundles:B5`; `SmoothRepresentationsOfLocalGroups:SR.4`; `AutomorphicSpectralTheory:AS.5`; `PadicFamiliesPartII:K2/away-hecke`.

**Source.** P20, §15.1, p. 106; Theorem 15.2.1, Proposition 15.2.4.1 and §15.2.5, pp. 107–109. Proves the Euler conclusion, separating the stronger conjecture.

**Acceptance.** The conclusion is equality of alternating ranks on each weight component; it does not assert either individual cohomology module is torsion.

**Open proof leaves.** Euler characteristic versus torsion.

### Away-from-p Hecke action — `K2/away-hecke`

For ℓ∤Np the three genus-two spherical Hecke operators act on the Klingen family and commute with the ordinary projector and derived character specialization. In Pilloni’s convention T_{ℓ,2} is ℓ⁻³ times the raw trace and T_{ℓ,0},T_{ℓ,1} are ℓ⁻⁶ times their raw traces; T_{ℓ,0} acts invertibly. The residual Frobenius polynomial and multiplier in the Euler theorem use precisely this normalization.

**Proof plan.** Import the spherical coefficient/trace convention and integral Hecke action on complexes. Compare the étale ℓ-isogenies with the height-one tower and determinant-square coefficient. Use correspondence commutation before applying the ordinary projector, then specialize.

**Direct inputs.** `HigherHidaAndColemanTheory:X8/klingen-complex`; `IntegralHeckeAndGaloisDeterminants:IHG.3`.

**Source.** P20, §15.1, p. 106; §15.2, pp. 107–108. Pins the away-from-p polynomial convention.

**Acceptance.** At a prime ℓ away from Np the two raw trace scalars are ℓ⁻³ and ℓ⁻⁶ respectively, and the normalized operators commute with the same local ordinary projector.

**Layer status: planned.** Finite-block topology in torsion comparison Euler characteristic versus torsion Klingen integral analytic lattice estimates Integral fundamental-class trace extension Obtain exact supplier nodes for ShimuraCompactifications:C5 Obtain exact supplier nodes for AutomorphicBundles:B5 Obtain exact supplier nodes for SmoothRepresentationsOfLocalGroups:SR.4 Obtain exact supplier nodes for AutomorphicSpectralTheory:AS.5 Obtain exact supplier nodes for IntegralHeckeAndGaloisDeterminants:IHG.3 Obtain exact supplier nodes for SchemeAndStackFoundations:SF.2.

## H3 — Hilbert partial-ordinary Hida complexes

**Standing hypotheses.**

Let F be totally real, p>2 split completely in F, S_p=I⊔Iᶜ, and G₁=Res_{F/Q}GSp₄. At v∈I take Klingen level; at v∈Iᶜ take Iwahori level. Fix neat tame level, compatible compactifications and polarization elements x_v.

Write ω^κ=⊗_v Sym^{k_v−l_v}(ω_v)det(ω_v)^{l_v}, k_v≥l_v, k_v≡l_v mod 2. The geometric rank conditions and the chosen multiplicative flags are retained. For integral descent to the common-similitude group impose p∤|Δ| for the finite unit/deck quotient; G₁ statements do not require this restriction.

### Hilbert mixed ordinary locus — `H3/mixed-locus`

For I⊆S_p let X^{≥1,I} be the spherical locus of p-rank at least one at v∈I and ordinary at v∈Iᶜ. At mixed Klingen/Iwahori level select the open subscheme with distinguished H_v multiplicative for v∈I and the specified ordinary flag for v∈Iᶜ. It is strictly smaller than the unrestricted inverse image of the rank locus. Let the partial Igusa tower trivialize T_p(H_{∞,v}ᴰ) at every v and T_p((G_v^m/H_{∞,v})ᴰ) additionally at v∈Iᶜ.

**Proof plan.** Use the height-one maximal multiplicative p-divisible subgroup over the imported rank strata. Form the affine étale tower and its torsor of Tate-module trivializations. Retain the selected multiplicative-flag open and boundary log structure.

**Direct inputs.** `PELModuli:M2`; `HodgeTateAndCanonicalSubgroups:T5`.

**Source.** BCGP21, §4.1, pp. 73–74; §4.3.4, pp. 96–97. Defines the selected multiplicative-flag open and the partial tower; no clopen decomposition of the full rank-locus preimage is asserted.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertMixedLocus` (constructor): The selected multiplicative-flag component of the mixed-level rank locus.

- `TauCeti.PadicFamiliesPartII.hilbertIgusa_torus` (structure): Its Igusa group is ∏_{v∈I}Z_p× times ∏_{v∈Iᶜ}(Z_p×)².

- `TauCeti.PadicFamiliesPartII.hilbertMixedLocus_baseChange` (functoriality): The component and tower commute with complete coefficient extension.

- `TauCeti.PadicFamiliesPartII.hilbertMixedLocus_boundary` (projection): The pulled-back toroidal divisor defines the subcanonical ideal.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.hilbertMixed_allKlingen` (degenerate): I=S_p gives one character coordinate per place.

- `TauCeti.PadicFamiliesPartII.hilbertMixed_allIwahori` (degenerate): I=∅ gives two coordinates per place and the ordinary flag locus.

- `TauCeti.PadicFamiliesPartII.hilbertMixed_component` (non-example): A rank≥1 point with a nonmultiplicative distinguished Klingen subgroup is excluded.

**Consumers.** BCGP21 Theorem 4.6.1: Defines the formal family complex. BCGP21 Theorem 5.8.6: Provides the doubling domain and ordinary target.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Hilbert universal coefficients — `H3/universal-coefficients`

Write T_I=T_fin×T₀ and Λ_I=Z_p[[T₀]], with rank(T₀)=|I|+2|Iᶜ|. The universal sheaf is the T_I-diagonal invariant subsheaf of π_*O_Igusa completed-tensored with the continuous universal Λ_I module, followed by ⊗_v det(ω_v)². Its classical specialization at δ_κ evaluates x_v^{k_v−2}, and y_v^{l_v−2} for v∈Iᶜ; require l_v=2 for v∈I and k_v≡l_v≡2 mod p−1. The highest-weight map ω^κ→Ω^{κ_I} is generally a projection.

**Proof plan.** Descend the equivariant universal module on the tower. Insert the determinant-square twist before comparing algebraic characters. For descent from G₁ to common-similitude G, modify the positive-unit action by d(x)=[√x₀]; squaring on the pro-p part is invertible for p>2. Under p∤|Δ|, take the deck invariants as a direct factor.

**Direct inputs.** `PadicFamiliesPartII:H3/mixed-locus`; `HodgeTateAndCanonicalSubgroups:T5`.

**Source.** BCGP21, §§4.3–4.4, pp. 95–99. Defines the finite-character component, determinant shift and descent correction.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertUniversalSheaf` (constructor): The diagonal-equivariant sheaf with determinant-square twist.

- `TauCeti.PadicFamiliesPartII.hilbertWeight_specialize` (compatibility): At κ, the universal character evaluates to x^{k−2}y^{l−2} on the stated coordinates.

- `TauCeti.PadicFamiliesPartII.hilbertHighestWeightMap` (projection): ω^κ maps to the specialized sheaf by the highest-weight functional.

- `TauCeti.PadicFamiliesPartII.hilbertUnit_descent` (relation): The corrected unit action is the tautological action multiplied by d(x).

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.hilbertWeight_scalar2` (computation): At every (k_v,l_v)=(2,2) the pro-p character is trivial.

- `TauCeti.PadicFamiliesPartII.hilbertWeight_dimension` (computation): For two split places and |I|=1, the character dimension is 3.

- `TauCeti.PadicFamiliesPartII.hilbertWeight_projection` (non-example): For k_v>l_v the rank k_v−l_v+1 algebraic coefficient is not identified with a rank-one highest-weight quotient.

**Consumers.** BCGP21 Theorem 4.6.1: Interpolates formal coherent cohomology. BCGP21 Theorem 6.3.16: Identifies the connected classical weight region.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

**Open proof leaves.** Integral Hilbert descent with p-torsion deck quotient.

### Hilbert commuting U operators — `H3/operators`

On the universal coefficient complex use U_{v,1} at Iwahori places, normalized by p⁻³, and U_{v,2} as the product of the two quotient/dual factors whose raw trace divisors are p² and p. The determinant coefficient contributes p^{−l_v} at weight κ. The total ordinary operator is U^I=∏_{v∈I}U_{v,2}∏_{v∈Iᶜ}U_{v,1}U_{v,2}. All displayed operators commute as maps of the enhanced complex. The Klingen U_{v,1} and Iwahori U_{v,1} remain different operators.

**Proof plan.** Construct coefficient pullback on each local primary quotient. Check the two-factor U_{v,2} normalization on integral highest-weight lattices. Use the faithful injection of the Hasse Čech/Cousin terms into the interior localization to descend commutation of correspondences; cohomological commutation alone does not suffice.

**Direct inputs.** `PadicFamiliesPartII:H3/universal-coefficients`; `HodgeTateAndCanonicalSubgroups:T5`.

**Source.** BCGP21, §4.5, pp. 100–104; Lemma 4.5.15, p. 104. Provides the integral commuting action used by the projector.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertOrdinaryOperator` (constructor): U^I is the indicated mixed product.

- `TauCeti.PadicFamiliesPartII.hilbertU_commute` (relation): The local factors commute on the enhanced coefficient complex.

- `TauCeti.PadicFamiliesPartII.hilbertU_specialize` (compatibility): The universal action specializes to the weight-normalized geometric trace.

- `TauCeti.PadicFamiliesPartII.hilbertU_fan` (functoriality): Common fan refinement intertwines all local factors.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.hilbertU_emptyI` (degenerate): I=∅ uses ∏_v U_{v,1}U_{v,2}.

- `TauCeti.PadicFamiliesPartII.hilbertU_fullI` (degenerate): I=S_p uses ∏_v U_{v,2}.

- `TauCeti.PadicFamiliesPartII.hilbertU_klingenDistinct` (non-example): The Iwahori first operator is not substituted for the Klingen first operator in doubling.

**Consumers.** BCGP21 Theorem 4.6.1: Defines the ordinary summand. BCGP21 §6.3: Identifies the compact analytic operator.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Hilbert fixed-weight amplitude — `H3/fixed-amplitude`

Let X_{G₁,1}^{I} denote the spherical special-fiber open of rank≥1 at v∈I and ordinary at v∈Iᶜ. There is C(p,F), independent of tame level, such that l_v≥2 everywhere, k_v−l_v≥C for v∈I and l_v≥C for v∈Iᶜ imply local finiteness of T^I=∏_{v∈I}T_v∏_{v∈Iᶜ}T_{v,1} on its cuspidal cohomology and perfect ordinary F_p-cohomology of amplitude [0,|I|]. Restriction from the global spherical special fiber to this open is H⁰-isomorphic and H¹-injective; it is a quasi-isomorphism if l_v≥3 for every v∈I. The generalized ≤1/≥1/ordinary partial strata in Theorem 4.2.12 have the stated perfectness and support-dependent endpoint comparisons, without an additional uniform numerical amplitude claim. Integral formal-family control is a separate theorem in H3.

**Proof plan.** Use partial Hasse invariants and their companion sections to form the |I|+1-term supported resolution. Use relative minimal-compactification acyclicity and affineness of its rank strata. Eliminate rank-zero pieces by local nilpotence and trace the support triangle; do not assert the cuspidal amplitude for arbitrary canonical coefficients.

**Direct inputs.** `PadicFamiliesPartII:H3/operators`; `PadicFamiliesPartII:K2/rank-zero`; `ShimuraCompactifications:C5`.

**Source.** BCGP21, Theorems 4.2.1 and 4.2.12, pp. 77–82; §4.2.30, Lemma 4.2.31, Proposition 4.2.33 and Remark 4.2.34, pp. 92–94. Establishes multivariable fixed-weight control with correct endpoints.

**Acceptance.** The numerical [0,|I|] bound is for cuspidal ordinary cohomology of the spherical mixed-rank special-fiber open. The l_v=2 global comparison has only the stated H⁰/H¹ endpoints. Generalized supported strata retain their own perfectness and comparison conclusions.

### Hilbert Hida family complex — `H3/family-complex`

Define M_I=e(U^I)RΓ(formal mixed-level infinite height-one tower,Ω^{κ_I}(−D)), as a derived Λ_I-module. The limit and completion are those of the equivariant integral sheaf, not an underived limit of cohomology. At a classical character use derived tensor with Λ_I/ker δ_κ, and retain its Tor terms until perfect control is established.

**Proof plan.** Take the enhanced inverse system on the affine étale tower. Apply the supplied derived ordinary summand construction. Descend to Λ_I and compare finite-level Hasse resolutions.

**Direct inputs.** `PadicFamiliesPartII:H3/universal-coefficients`; `PadicFamiliesPartII:H3/operators`; `HigherHidaAndColemanTheory:D1/ordinary-localization`.

**Source.** BCGP21, Theorem 4.6.1 and §4.6.1, pp. 105–108. Defines the multivariable formal complex.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertHidaComplex` (constructor): The U^I-ordinary derived formal global section complex.

- `TauCeti.PadicFamiliesPartII.hilbertHidaComplex_specializationMap` (projection): There is a derived character-specialization map to formal fixed-weight cohomology.

- `TauCeti.PadicFamiliesPartII.hilbertHidaComplex_hecke` (structure): Away-from-level Hecke maps and all commuting U factors act.

- `TauCeti.PadicFamiliesPartII.hilbertHidaComplex_changeLevel` (functoriality): Pullback and trace along compatible tame levels intertwine the coefficient action.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.hilbertComplex_Iempty` (degenerate): For I=∅ the stated amplitude is [0,0].

- `TauCeti.PadicFamiliesPartII.hilbertComplex_FQ` (compatibility): For F=Q,I={p}, compare with the imported singular Klingen complex after base change from its full Z_p[[Z_p×]] to the trivial finite-character component used by Λ_I=Z_p[[1+pZ_p]], and match the determinant and character convention.

- `TauCeti.PadicFamiliesPartII.hilbertComplex_derived` (non-example): Before flatness, ordinary H^j⊗κ is not substituted for the derived fiber.

**Consumers.** BCGP21 Theorem 4.6.1: Provides a family in |I|+2|Iᶜ| variables. BCGP21 Theorem 6.6.4: Compares a one-Klingen-place fiber with overconvergent cohomology.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

**Open proof leaves.** Integral Hilbert descent with p-torsion deck quotient.

### Trace congruence and Hasse devissage — `H3/trace-control`

For the ordinary spherical-to-mixed-level comparison the relevant finite étale special-stratum cover has degree (p+1)^{|Jᶜ|}. For n sufficiently large, Tr∘∏_{w∈Jᶜ}U_{w,2}^n∘i is congruent to p^{|Jᶜ|}(∏_{w∈Jᶜ}T̃_w)^n modulo p^{min_w(k_w−l_w)}. Under the stated large-weight bounds it gives the ordinary comparison on the Hasse resolution.

**Proof plan.** Use the finite étale cover and the explicit normalized quotient correspondence. Track the factor p^{|Jᶜ|}; a sufficient source bound is k_w−l_w>p^{|Jᶜ|}. Devise one Hasse exponent at a time using regularity after all other powers and the corresponding twists. Never use a two-variable powers quotient with a one-dimensional kernel.

**Direct inputs.** `PadicFamiliesPartII:H3/fixed-amplitude`; `PadicFamiliesPartII:H3/family-complex`; `ShimuraCompactifications:C5`.

**Source.** BCGP21, Proposition 4.6.9, Lemmas 4.6.16–4.6.17 and Proposition 4.6.19, pp. 109–114. Supplies trace comparison with corrected multivariable devissage.

**Acceptance.** For one auxiliary place the trace cover has degree p+1 and the comparison retains its leading factor p. The corrected powers argument works for two independent Hasse parameters.

**Open proof leaves.** Multivariable Hasse powers.

### Hilbert derived ordinary control — `H3/derived-control`

M_I is perfect over Λ_I of amplitude [0,|I|]. For every classical κ in the specified component, its derived δ_κ-fiber is e(U^I)RΓ of the formal mixed-level variety with Ω^κ(−D). For all k_v−l_v sufficiently large, and l_v sufficiently large on Iᶜ, the spherical comparison is H⁰-isomorphic/H¹-injective. No full classical quasi-isomorphism for arbitrary |I| is inferred.

**Proof plan.** Compare one witness of sufficiently large weight at all relevant places. Show the product U^I is divisible by p on the highest-weight kernel; an assertion for each individual factor at every place is unnecessary. Apply the trace comparison and the imported derived Nakayama criterion to obtain perfectness and character control. Transport from the witness to all characters by derived control; keep the spherical endpoint strength separate.

**Direct inputs.** `PadicFamiliesPartII:H3/trace-control`; `PadicFamiliesPartII:H3/family-complex`; `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** BCGP21, Theorem 4.6.1, pp. 105–106; Lemmas 4.6.22–4.6.27, pp. 114–117. Proves the multivariable family theorem at its actual strength.

**Acceptance.** All residue fibers detect the stated perfect amplitude. Classical specialization retains Tor until concentration or flatness is independently supplied.

**Open proof leaves.** Integral Hilbert descent with p-torsion deck quotient; Multivariable Hasse powers.

**Layer status: planned.** Integral Hilbert descent with p-torsion deck quotient Multivariable Hasse powers Obtain exact supplier nodes for ShimuraCompactifications:C5 Obtain exact supplier nodes for PELModuli:M2 Obtain exact supplier nodes for HodgeTateAndCanonicalSubgroups:T5 Obtain exact supplier nodes for DeformationAndDerivedPatchingAlgebra:P7.

## D4 — Hilbert weight-two doubling

**Standing hypotheses.**

Let F be totally real, p>2 split completely in F, S_p=I⊔Iᶜ, and G₁=Res_{F/Q}GSp₄. At v∈I take Klingen level; at v∈Iᶜ take Iwahori level. Fix neat tame level, compatible compactifications and polarization elements x_v.

Write ω^κ=⊗_v Sym^{k_v−l_v}(ω_v)det(ω_v)^{l_v}, k_v≥l_v, k_v≡l_v mod 2. The geometric rank conditions and the chosen multiplicative flags are retained. For integral descent to the common-similitude group impose p∤|Δ| for the finite unit/deck quotient; G₁ statements do not require this restriction.

### Klingen and Iwahori first operators — `D4/first-operator`

At w∈I write U_Kli=p^{−min(3,l_w+1)} times the raw first trace, U_Iw=p⁻³ times the étale part and Z=p^{−l_w−1} times the multiplicative–étale part. For l_w≥2, U_Kli=U_Iw+p^{l_w−2}Z; for l_w≤2, U_Kli=p^{2−l_w}U_Iw+Z. In particular l_w=2 gives U_Kli=U_Iw+Z.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Split the first correspondence by its interaction with the distinguished multiplicative line. Track coefficient pullback and trace divisibility on each component. Compare the two scalar regimes at their common endpoint.

**Direct inputs.** `PadicFamiliesPartII:H3/operators`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source.** BCGP21, §§5.2–5.4, pp. 119–124. The local decomposition at scalar weight two.

**Acceptance.** Both normalization regimes give U_Kli=U_Iw+Z at l_w=2; at l_w=3 the first formula gives U_Kli=U_Iw+pZ.

### Partial Frobenius on the rank-one divisor — `D4/partial-frobenius`

Work on the interior Y₁^I of the mixed multiplicative-flag special fiber, and let D_w=Y₁^{I,=w1} be its nonordinary rank-one divisor. The map F_w:Y₁^I→Y₁^I quotients by ker(Frob G_w) at w and by A[v] at v≠w, with polarization descended from p²x_wλ and tame marking p⁻¹πη, where π is the quotient isogeny. It is finite flat of degree p³ on Y₁^I and p² on D_w, and F_w^*ω_w≃ω_w^p. The polarization and tame identifications remain part of the map. Extending these finite-flat statements to a toroidal boundary is not asserted.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Use the partial-primary quotient and its polarization. Compute the kernel at each place and the induced map on the determinant Hodge bundle. Check finite-flat degrees on the ambient locus and on its rank-one divisor.

**Direct inputs.** `PadicFamiliesPartII:H3/mixed-locus`.

**Source.** BCGP21, Definition 5.6.2 and Proposition 5.6.3, p. 126. The map and both finite-flat degree assertions are on the interior special fiber and its rank-one divisor.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertPartialFrobenius` (constructor): The polarized partial-primary quotient with its level transport.

- `TauCeti.PadicFamiliesPartII.hilbertPartialFrobenius_degree` (data): Its degrees are p³ on the interior Y₁^I and p² on its divisor D_w.

- `TauCeti.PadicFamiliesPartII.hilbertPartialFrobenius_hodge` (compatibility): F_w^*ω_w≃ω_w^p.

- `TauCeti.PadicFamiliesPartII.hilbertPartialFrobenius_otherPlace` (functoriality): For v≠w, F_w^*ω_v≃ω_v via the canonical identification A[v∞]/A[v]≃A[v∞]; this uses the quotient identification, not an undivided p-isogeny differential.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.partialFrobenius_FQ` (compatibility): For F=Q this is the rank-one Siegel partial Frobenius with the stated polarization convention.

- `TauCeti.PadicFamiliesPartII.partialFrobenius_divisorDegree` (computation): The restricted degree is p², not the ambient p³.

- `TauCeti.PadicFamiliesPartII.partialFrobenius_level` (non-example): The tame-level map includes the p⁻¹ isogeny transport and is not the identity on the marking.

**Consumers.** BCGP21 Proposition 5.6.7: Computes the boundary trace operator γ₁. BCGP21 Proposition 5.7.3: Identifies the second correspondence with F_w² on D_w.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Isogeny-compatible Kodaira–Spencer scaling — `D4/kodaira-spencer`

The O_F-linear Kodaira–Spencer identification of the canonical sheaf with the product of determinant Hodge cubes has the isogeny compatibility of BCGP21 Proposition 5.5.1 for prime-to-p quasi-isogenies over Z_(p). For the first p-correspondence, first form its normalized cohomological trace integrally using Propositions 5.5.2–5.5.3 and 5.6.1. The factor Norm(x_w)³/p³ is an integral unit. After reduction to the interior rank-one divisor and the coefficient identifications of §5.6, Ha_w U_Iw restricts to the normalized partial-Frobenius trace γ₁. A raw inseparable differential is not substituted into the prime-to-p statement.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Use the de Rham pairing and prime-to-p quasi-isogeny compatibility of Kodaira–Spencer with its polarization factor. Form the normalized integral correspondence trace before reduction; track the norm-cube and p³ factors through the canonical-sheaf map. Use the partial-Frobenius identification on the interior divisor and finite-flat duality to identify γ₁.

**Direct inputs.** `PadicFamiliesPartII:D4/partial-frobenius`; `PadicFamiliesPartII:D4/first-operator`; `SchemeAndStackFoundations:key/coherent-duality`; `AutomorphicBundles:B2`; `SchemeAndStackFoundations:SF.2`.

**Source.** BCGP21, Propositions 5.5.1–5.5.3, pp. 123–124; Proposition 5.6.1, p. 125; Propositions 5.6.4–5.6.7, pp. 127–128. Identifies the special-fiber trace through an integral normalization, not through an unnormalized inseparable pullback.

**Acceptance.** The prime-to-p quasi-isogeny compatibility and the normalized integral p-correspondence are separate steps. The factor Norm(x_w)³/p³ is retained before reduction to the partial-Frobenius trace.

**Open proof leaves.** Integral fundamental-class trace extension.

### Second operator on the rank-one divisor — `D4/second-operator`

On the interior formal locus Y^I, the U_{w,2} correspondence has first projection finite flat of degree p⁴. On the interior special-fiber divisor D_w=Y₁^{I,=w1}, its second projection is an isomorphism and its first projection identifies with F_w². The isogeny differential divided by p gives the determinant unit δ; with this unit retained, the normalized restriction satisfies U_{w,2}=γ₂γ₁. The finite-flat degree assertion is not extended to the toroidal boundary.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Classify the admissible order-p⁴ isotropic subgroups by their p-torsion and étale rank. Identify the quotient on D_w and compute both determinant pullbacks. Compose the two normalized Frobenius traces; do not discard the determinant unit.

**Direct inputs.** `PadicFamiliesPartII:D4/kodaira-spencer`; `PadicFamiliesPartII:H3/operators`; `SchemeAndStackFoundations:key/coherent-duality`; `SchemeAndStackFoundations:SF.2`.

**Source.** BCGP21, Lemma 5.7.2 and Proposition 5.7.3, p. 129; Proposition 5.7.4, p. 130; Proposition 5.7.9, pp. 131–132. Provides the factorization needed for the operator relation.

**Acceptance.** The ambient degree p⁴ agrees with the degree of F_w² on the divisor, where F_w has degree p². The determinant unit is included in the coefficient comparison.

**Open proof leaves.** Integral fundamental-class trace extension.

### Quadratic operator relation — `D4/quadratic`

On the scalar-weight-two ordinary locus U_Iw Z=U_{w,2}. Combined with U_Kli=U_Iw+Z and commutation, this gives U_Iw²−U_Kli U_Iw+U_{w,2}=0 and the analogous relation for Z. The operators on the three relevant domains are linked by restriction, not silently identified as endomorphisms of global sections.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Compare the two composed isogeny correspondences on the interior. Use the coefficient and boundary trace calculations to extend the equality. Substitute the first-operator decomposition.

**Direct inputs.** `PadicFamiliesPartII:D4/first-operator`; `PadicFamiliesPartII:D4/second-operator`; `SmoothRepresentationsOfLocalGroups:SR.4`.

**Source.** BCGP21, Lemma 5.8.1, p. 133. The quadratic identity underlying doubling.

**Acceptance.** Substituting Z=U_Kli−U_Iw into U_Iw Z=U_{w,2} reproduces the displayed quadratic with the positive constant term.

### Doubling companion operator — `D4/companion`

For commuting linear endomorphisms T,U of an R-module M define C_{T,U}(x,y)=(Tx+Uy,−x) on M⊕M. Its polynomial is C²−diag(T)C+diag(U)=0. If U is invertible, C⁻¹(x,y)=(−y,U⁻¹x+U⁻¹Ty). For geometric doubling, T=U_Kli and U=U_{w,2} act on global sections, whereas the map (f,g)↦f+Zg has target the ordinary-locus sections.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Use existing linear-map product and coproduct operations. Expand both coordinates to verify the polynomial and inverse formulas. Separate this light algebraic model from the heavy geometric injection.

**Direct inputs.** `mathlib:LinearMap.prod`; `mathlib:LinearMap.coprod`; `PadicFamiliesPartII:D4/quadratic`.

**Source.** BCGP21, Theorem 5.8.6 and its displayed companion action, pp. 134–135. Pins the signs in the doubling action.

**API.**

- `TauCeti.PadicFamiliesPartII.doublingOperator` (constructor): C_{T,U}(x,y)=(Tx+Uy,−x).

- `TauCeti.PadicFamiliesPartII.doublingOperator_apply` (simp): Evaluation has the two displayed coordinates.

- `TauCeti.PadicFamiliesPartII.doublingOperator_polynomial` (relation): If TU=UT then C²−diag(T)C+diag(U)=0.

- `TauCeti.PadicFamiliesPartII.doublingOperator_inverse` (equivalence): If U is invertible, the displayed inverse is a two-sided inverse.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.doublingOperator_numeric` (computation): Over Z, T=5,U=6 sends (2,3) to (28,−2).

- `TauCeti.PadicFamiliesPartII.doublingOperator_zero` (degenerate): T=U=0 sends (x,y) to (0,−x), and its square is zero.

- `TauCeti.PadicFamiliesPartII.doublingOperator_sign` (non-example): The second coordinate is −x; replacing it by x changes the characteristic polynomial to X²−TX−U.

**Consumers.** BCGP21 Theorem 5.8.6: Intertwines the doubled source with U_Iw. BCGP21 Remark 5.8.7: Separates the two unit-root refinements.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### No everywhere-regular simultaneous eigenvector — `D4/no-global-eigenvector`

In scalar weight two, an eigenform regular on the whole mixed rank open X_{G₁,1}^{I} satisfying U_Kli=α+β, U_Iw=α, U_{w,2}=αβ with αβ≠0 is zero. The same excludes a nonzero generalized-eigenspace kernel of the geometric doubling map.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** If restriction to D_w is zero, divide by the partial Hasse invariant; the resulting weight is 3−p≤0 and the multiplicative–étale Z-action cannot have a nonzero eigenvalue. Otherwise restriction makes γ₁ vanish through Ha_w U_Iw, contradicting γ₂γ₁=U_{w,2}. Reduce a nonzero finite generalized-eigenspace kernel to an eigenvector after coefficient extension.

**Direct inputs.** `PadicFamiliesPartII:D4/quadratic`; `PadicFamiliesPartII:D4/kodaira-spencer`; `PadicFamiliesPartII:D4/second-operator`.

**Source.** BCGP21, Proposition 5.4.3 and Corollary 5.4.5, pp. 122–123; Theorem 5.8.4, p. 134. The vanishing actually needed for the injection, without the stronger §5.9 theorem.

**Acceptance.** The two cases of vanishing and nonvanishing restriction to D_w exhaust the possibilities; the argument treats a generalized Hecke kernel by extracting a genuine eigenvector.

### Weight-two doubling injection — `D4/doubling-injective`

For ω^{(2,2)}(−D), the map Δ(f,g)=f+Zg gives an injection from e(U_{w,2})H⁰(X_{G₁,I,1},ω^{(2,2)}(−D))² to e(U_Iw U_{w,2})H⁰(the w-ordinary open,ω^{(2,2)}(−D)). It intertwines C_{U_Kli,U_{w,2}} with U_Iw. These are distinct global and ordinary-open section spaces, so the formal identity ker(f+Zg)={(−Zg,g)} for a common module does not contradict geometric injectivity.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Verify equivariance using U_Iw Z=U_{w,2} and U_Kli=U_Iw+Z. The kernel is stable under the finite ordinary Hecke algebra and the companion action. Use the no-global-eigenvector result on a finite generalized eigenspace.

**Direct inputs.** `PadicFamiliesPartII:D4/companion`; `PadicFamiliesPartII:D4/no-global-eigenvector`.

**Source.** BCGP21, Theorem 5.8.6, pp. 134–135. Proves the geometric doubled injection.

**Acceptance.** The map is equivariant for the companion action and has distinct global-source and ordinary-open-target domains. Its injectivity is proved after that domain distinction.

### Two unit-root projectors — `D4/two-roots`

On a finite Artinian Hecke block where X²−TX+U has distinct unit residual roots, Hensel lifting gives roots α,β with α−β a unit. The companion vectors v_ξ=(f,−ξ⁻¹f) give the two refinements. Their doubling images are (1−β U_Iw⁻¹)f and (1−α U_Iw⁻¹)f respectively, with generalized nilpotents retained.

Additional hypothesis: The geometric Frobenius, rank-divisor, quadratic and doubling assertions in this layer are on the special fiber in characteristic p, after constructing the normalized correspondence maps integrally. Write X₁ for that special fiber; the abstract companion calculation alone works over any commutative coefficient ring.

**Proof plan.** Use the imported complete finite Hecke algebra and Hensel factorization. Construct the coprime polynomial idempotents; do not assume the block semisimple. Substitute the companion eigenvectors and the quadratic relation to compute their images.

**Direct inputs.** `PadicFamiliesPartII:D4/doubling-injective`.

**Source.** BCGP21, Remark 5.8.7, pp. 135–136. Separates the two ordinary refinements in the presence of nilpotents.

**Acceptance.** For T=5,U=6 the two roots are 2 and 3; the refinement formulas use the opposite root. Integral projectors require α−β to be a unit, not merely nonzero.

**Layer status: planned.** Integral fundamental-class trace extension Obtain exact supplier nodes for SmoothRepresentationsOfLocalGroups:SR.4 Obtain exact supplier nodes for AutomorphicBundles:B2 Obtain exact supplier nodes for SchemeAndStackFoundations:SF.2.

## C5 — Hilbert higher Coleman families and comparison

**Standing hypotheses.**

Let F be totally real, p>2 split completely in F, S_p=I⊔Iᶜ, and G₁=Res_{F/Q}GSp₄. At v∈I take Klingen level; at v∈Iᶜ take Iwahori level. Fix neat tame level, compatible compactifications and polarization elements x_v.

Write ω^κ=⊗_v Sym^{k_v−l_v}(ω_v)det(ω_v)^{l_v}, k_v≥l_v, k_v≡l_v mod 2. The geometric rank conditions and the chosen multiplicative flags are retained. For integral descent to the common-similitude group impose p∤|Δ| for the finite unit/deck quotient; G₁ statements do not require this restriction.

### Hilbert analytic family complex — `C5/analytic-complex`

For a weight affinoid A in the specified Λ_I component and radii (n,ε,w), descend the analytic highest-weight coefficient sheaf from the Hodge–Tate modified frame torsor. The modified lattice obeys p^{1/(p−1)}ω⊂ω^mod⊂ω. Define C_cusp(n,ε,w,κ_A) by derived sections of the analytic coefficient sheaf with det(ω^mod)²(−D); the input analytic character is κ−(2,2). H† is the filtered colimit over admissible radii, never a fixed-radius surjectivity assertion.

**Proof plan.** Import the canonical-subgroup Hodge–Tate frame torsor and analytic induction. Descend with the determinant-square twist. Use the mixed-level compactification and support conditions to define derived sections and transition maps.

**Direct inputs.** `PadicFamiliesPartII:H3/mixed-locus`; `PadicFamiliesPartII:H3/universal-coefficients`; `HigherHidaAndColemanTheory:F5/analytic-sheaves`; `HodgeTateAndCanonicalSubgroups:T5`.

**Source.** BCGP21, §6.1, pp. 138–145; §6.3, pp. 147–152. Defines the specific multivariable Coleman family.

**API.**

- `TauCeti.PadicFamiliesPartII.hilbertColemanComplex` (constructor): The radius-dependent derived analytic coefficient complex.

- `TauCeti.PadicFamiliesPartII.hilbertColemanTransition` (functoriality): Shrinking radii gives compatible transition maps and the filtered system.

- `TauCeti.PadicFamiliesPartII.hilbertColemanAlgebraicMap` (compatibility): The highest-weight algebraic map uses κ_A=κ−(2,2).

- `TauCeti.PadicFamiliesPartII.hilbertColemanSubcanonical` (projection): The coefficient includes the transported ideal of D.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.hilbertColeman_weight2` (computation): At scalar weight (2,2), κ_A is the trivial analytic character.

- `TauCeti.PadicFamiliesPartII.hilbertColeman_lattice` (non-example): The Hodge–Tate modified lattice need not equal ω integrally.

- `TauCeti.PadicFamiliesPartII.hilbertColeman_radii` (compatibility): At a common smaller radius the two transition paths give the same coefficient map.

**Consumers.** BCGP21 Proposition 6.2.6: Computes cohomological amplitude. BCGP21 Theorem 6.5.8: Compares classical small-slope cohomology.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Mixed Coleman amplitude — `C5/analytic-amplitude`

For admissible n≥max n_ε, the cuspidal analytic complex is concentrated in [0,|I|]. Use the 2^{|I|} cube of affinoid charts indexed by [2,3]^I on the minimal compactification, with every finite intersection acyclic for the pushed-forward coefficient sheaf; relative toroidal-to-minimal acyclicity is part of the assertion.

**Proof plan.** Identify the cube cover and all of its intersections. Apply relative Lan acyclicity before computing the Čech complex. Use the cubical resolution of length |I|; counting 2^{|I|} charts alone does not give the amplitude.

**Direct inputs.** `PadicFamiliesPartII:C5/analytic-complex`; `ShimuraCompactifications:C5`.

**Source.** BCGP21, Theorem 6.2.6, pp. 145–146. Proves the degree bound from the precise acyclic cover.

**Acceptance.** For |I|=1 the cube gives a two-term complex; every overlap is acyclic. The number of charts alone is not used as an amplitude bound.

**Open proof leaves.** Finite-block completion and analytic intersections.

### Compact mixed U action — `C5/compact-action`

The operator U_{v,2} improves analytic radii for v∈I. For v∈Iᶜ the composite U_{v,1}U_{v,2}, rather than U_{v,2} alone, improves radii; its kernel type is (p,p²,p³), compared with (p,p,p²) for the second operator at I. The raw trace factors are p⁻⁶ and p⁻³ respectively. Thus the total U^I is compact on a projective Banach complex and its finite nonzero slope blocks are perfect over A.

**Proof plan.** Classify the quotient kernels and the associated canonical subgroup after the isogeny. Track the radius gain and the coefficient normalization. Feed the resulting completely continuous chain map into the imported finite-slope perfect-complex theorem.

**Direct inputs.** `PadicFamiliesPartII:C5/analytic-amplitude`; `PadicFamiliesPartII:H3/operators`; `HigherHidaAndColemanTheory:F5/perfect-slopes`; `HodgeTateAndCanonicalSubgroups:T5`.

**Source.** BCGP21, §6.3, pp. 147–152, especially Propositions 6.3.4–6.3.14. Identifies the compact operator actually used by the family machine.

**Acceptance.** At an Iwahori place the compactness argument uses U_{v,1}U_{v,2}; replacing it by U_{v,2} alone must fail the specified kernel/radius check.

### Hilbert relative BGG comparison — `C5/hilbert-bgg`

On germs of analytic radii, use the product of the GL₂ relative BGG sequences. For reflection at v the differential θ_v has order k_v−l_v+1 and obeys θ_v U_source=p^{k_v−l_v+1}U_target θ_v. The lower cohomological slope is −3, sharpened to 0 in H⁰. Hence the algebraic/analytic map is H⁰-isomorphic and H¹-injective in the ordinary range; H¹ is an isomorphism when all gaps k_v−l_v≥3. Higher-degree exclusions retain the degree-dependent gap bounds of the product BGG spectral sequence.

**Proof plan.** Use the germ-level exactness and multi-index filtration. Verify the derivative scaling on a local analytic coordinate, correcting the reversed printed relation. Apply the lower slope bound to each reflected term and then the spectral sequence; a degree-N all-term exclusion uses the corresponding gaps ≥3N.

**Direct inputs.** `PadicFamiliesPartII:K2/bgg-scaling`; `PadicFamiliesPartII:C5/analytic-complex`; `HigherHidaAndColemanTheory:F5/automorphic-bgg`.

**Source.** BCGP21, §6.4, pp. 153–154. Fixes the operator direction and degree-dependent comparison.

**Acceptance.** At gap k_v−l_v=3, the reflected all-degree ordinary contribution is excluded by the ≥−3 bound; H⁰ uses the stronger lower bound 0.

### Multi-place small-slope continuation — `C5/multi-continuation`

On a joint finite nonzero slope block, restriction of classical coherent cohomology to H† is a quasi-isomorphism if v_p(U_{v,2})<k_v+l_v−3 for v∈I and v_p(U_{v,1})<l_v−3 for v∈Iᶜ. This uses the relevant commuting local operators on the finite block; it does not claim each local operator is compact on the full multi-place complex.

**Proof plan.** Use untruncated finite-flat degree to prove monotonicity and classify equality at the integral walls. On closed degree bands use quasi-compactness for uniform progress. Use the all-roots polynomial inverse Q(X)=−(P(X)−P(0))/(XP(0)) on each finite block and construct compatible torsion sections at cofinal precision. Complete with a continuous bounded block projection and extend one place at a time; the other degree coordinates and eigenrelations are preserved.

**Direct inputs.** `PadicFamiliesPartII:C5/compact-action`; `PadicFamiliesPartII:C5/hilbert-bgg`; `PadicFamiliesPartII:K2/torsion-continuation`; `PadicFamiliesPartII:P0/uniform-progress`.

**Source.** BCGP21, Theorem 6.5.8, p. 156; Lemmas 6.5.12–6.5.28, pp. 157–164. Provides cohomological continuation in the actual local slope coordinates.

**Acceptance.** The inequalities are strict at every relevant place. All other degree coordinates and joint finite-block actions survive each successive continuation.

**Open proof leaves.** Finite-block completion and analytic intersections.

### Ordinary Euler characteristic in families — `C5/euler-family`

The alternating rank of the U^I-ordinary finite perfect block is locally constant on the classical weight region l_v=2 for v∈I and k_v≡l_v≡2 mod p−1. After localization at a non-Eisenstein residual ideal, the #I=1 analytic and formal complexes have equal Euler characteristic, conditional on the specified coherent automorphic multiplicity comparison and individual-operator integrality.

**Proof plan.** Apply finite-perfect-block base change to compute a locally constant virtual rank. Choose large weights with every relevant gap large. Use small-slope continuation, ordinary product-to-individual unit slopes, and the localized automorphic comparison at the witness. Return to all weights in the connected component; do not infer constancy of individual cohomology dimensions.

**Direct inputs.** `PadicFamiliesPartII:C5/compact-action`; `PadicFamiliesPartII:C5/multi-continuation`; `PadicFamiliesPartII:H3/derived-control`; `PadicFamiliesPartII:K2/euler-zero`; `AutomorphicSpectralTheory:AS.5`; `AutomorphicBundles:B5`.

**Source.** BCGP21, Theorem 6.3.16, pp. 152–153; Proposition 6.6.2 and Remark 6.6.3, pp. 165–167. Relates virtual ranks without asserting false flatness.

**Acceptance.** Only the alternating rank is constant on a connected weight component; individual cohomology dimensions can jump.

### One-place ordinary comparison — `C5/one-place-comparison`

Assume |I|=1 and a non-Eisenstein localization with the residual irreducibility and packet-balance inputs. The actual restriction map r:K†_κ→M_I⊗^L_{δ_κ}C_p is H⁰-injective and H¹-surjective. Both sides have amplitude [0,1] and equal Euler characteristic, so r is a quasi-isomorphism. If l_v=2 on I and l_v≥4 on Iᶜ, this yields the rational global-classical ordinary comparison. The conclusion is over C_p (and by faithful flatness the compatible p-adic field), not an integral quasi-isomorphism at every tame level.

**Proof plan.** Use the two-affine-cover density argument and a continuous ordinary projector to prove the edge maps for r. For the real direction r, set a=dim coker H⁰(r) and b=dim ker H¹(r); equality of Euler characteristics gives a+b=0. Use the small-slope bound and proper GAGA to pass to global classical cohomology in the indicated weights.

**Direct inputs.** `PadicFamiliesPartII:C5/euler-family`; `PadicFamiliesPartII:C5/analytic-amplitude`; `PadicFamiliesPartII:H3/derived-control`.

**Source.** BCGP21, Proposition 6.6.1, pp. 164–165; Theorems 6.6.4–6.6.5, p. 167. Repairs the printed map-direction/Euler argument and retains the one-place bound.

**Acceptance.** For the actual map direction, the two nonnegative defects a and b satisfy χ(K†)−χ(M_I)=−a−b, so equality forces both to vanish.

**Open proof leaves.** Finite-block completion and analytic intersections; Strength of Hilbert rational comparison.

**Layer status: planned.** Finite-block completion and analytic intersections Strength of Hilbert rational comparison Obtain exact supplier nodes for ShimuraCompactifications:C5 Obtain exact supplier nodes for AutomorphicBundles:B5 Obtain exact supplier nodes for AutomorphicSpectralTheory:AS.5 Obtain exact supplier nodes for HodgeTateAndCanonicalSubgroups:T5.

## E6 — Completed cohomology and Eichler–Shimura

**Standing hypotheses.**

Use a Hodge-type Shimura datum with G/Q_p quasi-split, B⊂P, torus T, coefficient field E containing the reflex and splitting fields, neat tame level and compatible compactifications. Work with derived locally Q_p-analytic vectors of the completed tower; do not replace them by locally analytic vectors of individual completed cohomology groups.

The higher Coleman complexes, weights κ_w(λ)=−w₀,M w(λ+ρ)−ρ, support orders, nonzero finite-slope windows and normalized torus action are those of HigherHidaAndColemanTheory. Coefficients lie in the BGG category O(𝔤,𝔟)_{λ-alg}: their weights differ from λ by algebraic torus characters. Analytic localization uses the canonical enveloping-algebra completion and its continuous dual, with the λ-action twist. This completion comparison, analytic localization and solid automorphic vector-bundle functors are requested inputs, not baseline objects.

### Coherent completed-cohomology functor — `E6/completed-functor`

For M∈O(𝔤,𝔟)_{λ-alg}, define CC_λ(M)=RHom_𝔤(M,RΓ_completed^{la}); the cuspidal version uses the compact-support completed tower. Here M is the algebraic BGG object; its analytic realization uses M̂=M⊗_{U(𝔤)}Û(𝔤) and the continuous dual M̂∨, with the required λ-twist and completion comparison. Derived locally analytic vectors and the derived-Hom comparison are imported functors. The arithmetic Galois action is inherited from the tower. No extension to arbitrary topological coefficient modules is asserted.

**Proof plan.** Import the derived completed tower and its compact-support triangle. Use M∈O(𝔤,𝔟)_{λ-alg}, the derived locally analytic tower and the canonical completion/continuous-dual comparison for Lie-algebra derived Hom. Transport the canonical Hecke and Galois actions through the actual functors.

**Direct inputs.** `CompletedCohomologyPartII:CC.2/derived-completed-tower`; `CompletedCohomologyPartII:CC.6/analytic-classical-comparison`; `LocallyAnalyticDistributions:L0`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

**Source.** BCGP25, Definition 3.4.5 and Proposition 3.4.3, p. 53; §4.7 and Theorem 4.7.1, p. 99. The automorphic functor has BGG domain O(𝔤,𝔟)_{λ-alg}; completion supplies its analytic realization.

**API.**

- `TauCeti.PadicFamiliesPartII.coherentCompletedFunctor` (constructor): M in O(𝔤,𝔟)_{λ-alg} maps to the derived RHom_𝔤 complex of the derived locally analytic completed tower.

- `TauCeti.PadicFamiliesPartII.coherentCompletedFunctor_map` (functoriality): A map M→N gives CC_λ(N)→CC_λ(M), with identity and composition laws.

- `TauCeti.PadicFamiliesPartII.coherentCompletedFunctor_cusp` (compatibility): The compact-support tower gives the cuspidal variant and its map to the full functor.

- `TauCeti.PadicFamiliesPartII.coherentCompletedFunctor_actions` (structure): Galois and prime-to-p Hecke actions commute with functorial maps.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.coherentCompleted_finiteDimensional` (compatibility): For finite-dimensional algebraic M=W∨ the comparison agrees with the supplied classical completed-cohomology comparison.

- `TauCeti.PadicFamiliesPartII.coherentCompleted_zero` (degenerate): The zero coefficient object gives the zero complex.

- `TauCeti.PadicFamiliesPartII.coherentCompleted_triangle` (characterisation): A short exact sequence 0→M₁→M₂→M₃→0 in O(𝔤,𝔟)_{λ-alg} induces the distinguished triangle CC_λ(M₃)→CC_λ(M₂)→CC_λ(M₁)→CC_λ(M₃)[1]; the connecting morphism is induced by its Yoneda extension class.

**Consumers.** BCGP25 Theorem 4.7.2: Abuts the Bruhat spectral sequence. BCGP25 Theorem 4.10.12: Retains the extension whose Sen operator measures classicality.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

**Open proof leaves.** Completed analytic localization carrier.

### Completed-to-coherent localization — `E6/localization-comparison`

For M∈O(𝔤,𝔟)_{λ-alg}, CC_λ(M)⊗_E C_p is naturally equivalent to RΓ(VB_red(Loc(M))). The same comparison with the compact-support tower yields the cuspidal functor. The Galois Sen action corresponds to the horizontal µ-action on the localized equivariant sheaf.

**Proof plan.** Use the canonical completion and continuous-dual localization of the BGG coefficient; invoke non-Liouville conditions only for the exactness statements that require them. Use the solid vector-bundle functor on the Hodge–Tate period space and its Chevalley–Eilenberg compatibility. Identify horizontal µ with arithmetic Sen through the period-map comparison; retain all topological tensor completions.

**Direct inputs.** `PadicFamiliesPartII:E6/completed-functor`; `HigherHidaAndColemanTheory:C4/finite-level-geometry`; `LocallyAnalyticDistributions:L0`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`; `PerfectoidShimuraVarieties:S3`.

**Source.** BCGP25, Theorem 4.7.1, p. 99; Theorem 4.5.20, pp. 86–87. Binds the analytic localization to the completed tower.

**Acceptance.** The comparison is functorial in M, preserves Hecke and Galois actions, and identifies arithmetic Sen with horizontal µ using Sen(Q_p(1))=+1.

**Open proof leaves.** Completed analytic localization carrier.

### Higher Eichler–Shimura spectral sequence — `E6/spectral-sequence`

For the non-Liouville parameter λ and coefficient M∈O(𝔤,𝔟)_{λ-alg}, there is a finite Bruhat spectral sequence E₁^{p,q}=⊕_{ℓ(w)=p} H^{p+q}(HC_{w,λ}(E⊗^L_{𝔲_{P_w}}M))⇒H^{p+q}(CC_λ(M)⊗C_p). The horizontal wµ action on each term gives the arithmetic Sen action. The coefficient Lie homology is derived; higher terms are not discarded.

**Proof plan.** Filter the localized sheaf by Bruhat supports using the imported supported Cousin formalism. Identify each associated graded with its supplied higher-Coleman coefficient functor. Apply derived global sections and the completed-to-coherent comparison, keeping total degrees.

**Direct inputs.** `PadicFamiliesPartII:E6/localization-comparison`; `HigherHidaAndColemanTheory:C4/bruhat-cousin`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

**Source.** BCGP25, Theorem 4.7.2, pp. 99–100. Constructs the filtered comparison, including Sen and degree conventions.

**Acceptance.** The coefficient E⊗^L_{𝔲_{P_w}}M retains all Lie-homology degrees, and the abutment is indexed by total degree p+q.

**Open proof leaves.** Completed analytic localization carrier.

### Ordinary Eichler–Shimura degrees — `E6/ordinary-degrees`

Let λ be non-Liouville and use the BGG Verma coefficient M(𝔤)_λ. If the Shimura variety is proper or Siegel, its finite-slope completed functor and its cuspidal variant have nonnegative normalized slopes. On the ordinary part there is a spectral sequence E₁^{p,q}=⊕_{ℓ(w)=p}H^{2p+q−d}(HC^{ord}_{w,λ}(M(𝔪_w)_{λ+w⁻¹w₀,Mρ+ρ}))⇒H^{p+q}(CC_λ(M(𝔤)_λ)^{ord}⊗C_p), and the cuspidal analogue. If the variety is proper, the ordinary abutment is concentrated in degree d, without an antidominance restriction. Separately, for proper varieties and antidominant λ the unspecialized spectral sequence also gives middle-degree concentration and its higher-Coleman filtration. Properness is retained in both middle-degree assertions.

**Proof plan.** Specialize the general spectral sequence to the BGG Verma module with its canonical analytic completion, whose derived nilpotent homology is computed by the supplied Verma comparison. Use the nonnegative finite-slope estimates and insert the Bruhat/duality shift to obtain 2p+q−d on the ordinary part. For proper varieties, use the sharp support-dependent amplitude bounds to force the single total degree. For the separate unspecialized antidominant assertion, use the corresponding Verma vanishing and degeneration.

**Direct inputs.** `PadicFamiliesPartII:E6/spectral-sequence`; `HigherHidaAndColemanTheory:B7/sharp-siegel`; `HigherHidaAndColemanTheory:C4/geometric-vanishing`.

**Source.** BCGP25, Corollary 4.7.3, Theorem 4.7.5 and Corollary 4.7.6, printed p. 100. Separates general, ordinary and proper middle-degree variants.

**Acceptance.** The ordinary formula is specialized to M(𝔤)_λ with the shifted Levi-Verma coefficient. Proper middle-degree concentration and the separate antidominant nonordinary assertion are distinguished.

### Genus-two non-Eisenstein boundary vanishing — `E6/boundary`

For the ordinary genus-two completed tower, the map from compact-support to full coherent completed cohomology becomes an isomorphism after localization at an away-from-p ideal with absolutely irreducible residual four-dimensional representation. The Igusa boundary normalizes into ordinary GL₂ boundary towers whose Hecke eigensystems are Eisenstein, so they vanish at that ideal.

**Proof plan.** Use the support triangle of the supplied completed tower. Identify normalization of the Igusa boundary and its lower-rank coefficient/Hecke factors. Show every boundary Hecke polynomial is reducible of Eisenstein type and exclude it by residual absolute irreducibility.

**Direct inputs.** `PadicFamiliesPartII:E6/completed-functor`; `CompletedCohomologyPartII:CC.7/derived-completed-support-triangle`; `AutomorphicBundles:B3`.

**Source.** BCGP25, Theorem 4.9.4, Corollary 4.9.5 and Lemma 4.9.6, pp. 104–105. Allows nonproper Siegel middle-degree concentration after localization.

**Acceptance.** The ordinary boundary H⁰ is excluded by its lower-rank reducible Hecke polynomial; the full completed-support comparison uses the source’s completed boundary theorem as well.

### Genus-two four-piece filtration — `E6/four-pieces`

For GSp₄ and an absolutely irreducible residual Hecke ideal, V=RHom_𝔟(λ,RΓ_completed^{la})^{ord}_m is concentrated in degree 3. Its four graded pieces are the degree-i ordinary higher-Coleman modules of coherent weight −w₀,M(i_w·λ+2ρ_M), with torus twist C_p(−i_w⁻¹w₀,Mρ−ρ). For i=3,2,1,0 their scalar Sen values are respectively −(λ₁+λ₂+w)/2, −(2−λ₁+λ₂+w)/2, −(4−λ₂+λ₁+w)/2, −(6−λ₁−λ₂+w)/2.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3 and the four representatives i_w of lengths i=0,1,2,3. Let λ=(λ₁,λ₂;w) be a non-Liouville torus parameter; for an integral algebraic character retain λ₁+λ₂≡w mod 2. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation. The singular parameter λ=(1,1;w), w even, is the specialization used in S7.

**Proof plan.** Apply the ordinary spectral sequence and localized boundary vanishing. Use sharp genus-two supported amplitudes to force total degree 3. Compute the four twists from the root datum, with Q_p(1) of Sen weight +1.

**Direct inputs.** `PadicFamiliesPartII:E6/ordinary-degrees`; `PadicFamiliesPartII:E6/boundary`; `HigherHidaAndColemanTheory:X8/c2-weight-table`.

**Source.** BCGP25, Theorem 4.9.9, pp. 105–106. Gives the ordinary completed filtration with its explicit weights.

**Acceptance.** At λ=(1,1;2), the four scalar Sen values in descending degree are −2,−2,−3,−3; this detects the sign of the central parameter.

**Layer status: planned.** Completed analytic localization carrier Obtain exact supplier nodes for LocallyAnalyticDistributions:L0 Obtain exact supplier nodes for tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ Obtain exact supplier nodes for PerfectoidShimuraVarieties:S3 Obtain exact supplier nodes for AutomorphicBundles:B3.

## S7 — Singular Sen operator and classicality

**Standing hypotheses.**

Use a Hodge-type Shimura datum with G/Q_p quasi-split, B⊂P, torus T, coefficient field E containing the reflex and splitting fields, neat tame level and compatible compactifications. Work with derived locally Q_p-analytic vectors of the completed tower; do not replace them by locally analytic vectors of individual completed cohomology groups.

The higher Coleman complexes, weights κ_w(λ)=−w₀,M w(λ+ρ)−ρ, support orders, nonzero finite-slope windows and normalized torus action are those of HigherHidaAndColemanTheory. Coefficients lie in the BGG category O(𝔤,𝔟)_{λ-alg}: their weights differ from λ by algebraic torus characters. Analytic localization uses the canonical enveloping-algebra completion and its continuous dual, with the λ-action twist. This completion comparison, analytic localization and solid automorphic vector-bundle functors are requested inputs, not baseline objects.

### Singular two-term Cousin complex — `S7/cousin-complex`

At λ=(1,1;w) the ordinary classical complex RΓ(X,ω(1,1;−w)) is represented in degrees 2,3 by H²_{2_w}(ω†(1,1;−w))⊗C_p(2,0;0)→H³_{3_w}(ω†(1,1;−w)), with the common B-action twist C_p(1,1;w) in the identification. The other Bruhat pieces are excluded by their ordinary slopes.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

**Proof plan.** Use the supported Cousin filtration and the sharp genus-two bounds. Check the weight-transport twists rather than identifying both terms as untwisted modules. Identify the differential as the boundary map of the two-stratum exact triangle.

**Direct inputs.** `PadicFamiliesPartII:E6/four-pieces`; `HigherHidaAndColemanTheory:C4/interior-cousin`.

**Source.** BCGP25, §4.10 and Proposition 4.10.6, pp. 106–108. Identifies the classical obstruction complex.

**Acceptance.** The two terms occupy degrees 2 and 3, and the degree-two coefficient retains C_p(2,0;0) together with the common B-action twist.

### Repeated Sen block — `S7/sen-block`

At λ=(1,1;w) put a=−1−w/2. The generalized a-eigenspace V_a is killed by (Θ−a)² and sits in 0→Gr³V→V_a→Gr²V→0. The induced nilpotent operator N_a:Gr²V→Gr³V is defined by Θ−a, which vanishes on both end pieces. The other repeated eigenvalue is −2−w/2 on Gr¹V and Gr⁰V. The four coherent weights are (1,1),(1,1),(2,2),(2,2), in descending degree.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

**Proof plan.** Compute the four Sen values at the singular weight. Take the generalized eigenspace using the coprime two-eigenvalue polynomial factors. Because Θ−a kills the subobject and quotient, factor it through quotient-to-subobject.

**Direct inputs.** `PadicFamiliesPartII:E6/four-pieces`.

**Source.** BCGP25, §4.10.8, pp. 107–108; Remark 4.10.7. Defines the nilpotent map and corrects the repeated weight typo.

**API.**

- `TauCeti.PadicFamiliesPartII.singularSenBlock` (constructor): The generalized a-eigenspace with its two-step filtration.

- `TauCeti.PadicFamiliesPartII.singularSenBlock_nilpotent` (relation): (Θ−a)²=0 on V_a.

- `TauCeti.PadicFamiliesPartII.singularSenBlock_boundary` (projection): N_a is the unique Gr²→Gr³ map inducing Θ−a on V_a.

- `TauCeti.PadicFamiliesPartII.singularSenBlock_functorial` (functoriality): Hecke-compatible Galois maps preserve the block and N_a.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.senBlock_w2` (computation): At w=2 the scalar eigenvalues are −2,−2,−3,−3; a sign reversal of w gives the wrong values.

- `TauCeti.PadicFamiliesPartII.senBlock_semisimple` (degenerate): If Θ acts semisimply on V_a, N_a=0.

- `TauCeti.PadicFamiliesPartII.senBlock_jordan` (non-example): A nontrivial 2×2 Jordan block with diagonal a has N_a≠0 despite having the same two scalar graded eigenvalues.

**Consumers.** BCGP25 Theorem 4.10.12: Compares N_a with the Cousin differential. BCGP25 Theorem 4.12.4: Uses de Rham semisimplicity to kill the obstruction.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Rank-one singular localization comparison — `S7/rank-one-localization`

On the union of the adjacent GSp₄ Bruhat strata for the Klingen root β, the extension obtained by derived invariants of horizontal µ−µ₀ agrees with the higher-Coleman sheaf extension up to the B-character λ−η and a nonzero scalar, where η=(0,−1;1) and µ₀=−1−w/2. This assertion includes nonvanishing of the gluing comparison on both strata and their overlap.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

**Proof plan.** Use the requested completed-Verma localization triangle and the two-step Chevalley–Eilenberg complex for EX_β⊕EH_β. At the closed orbit the displayed operator x∂_x+1 is injective on power-series germs in characteristic zero. At the overlap the printed (x+1)∂_x+1 kills 1/(1+x); its claimed injectivity is therefore not justified on the ambient analytic germs. Identify the actual constrained fiber and prove the kernel germ is excluded there, or supply a different nonzero comparison map. Once nonvanishing is established, the scalar endomorphism property identifies the gluing up to E×. This is an open proof obligation, not an asserted solution.

**Direct inputs.** `PadicFamiliesPartII:E6/localization-comparison`; `PadicFamiliesPartII:S7/sen-block`.

**Source.** BCGP25, Theorem 3.6.9 and Proposition 3.6.15, pp. 62–67. Supplies the local extension comparison rather than assuming matching eigenvalues imply matching extensions.

**Acceptance.** The overlap comparison must be nonzero on the actual constrained fiber. The ambient analytic kernel germ 1/(1+x) is explicitly addressed rather than excluded without proof.

**Open proof leaves.** Singular localization overlap kernel.

### Sen–Cousin comparison — `S7/sen-cousin`

Under the natural identification of the two graded modules, N_a is a nonzero scalar multiple of the Cousin differential in the singular two-term complex. The scalar ambiguity is harmless for its kernel, image and vanishing. This is a comparison of extension classes, not merely equality of the scalar Sen values on associated gradeds.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

**Proof plan.** Represent the repeated block by the cone of Θ−a and compare its two exact triangles. Use the rank-one localization comparison and the solid vector-bundle functor to identify the connecting extension. Transport to ordinary global cohomology and the supported Cousin boundary map, retaining B-action twists.

**Direct inputs.** `PadicFamiliesPartII:S7/rank-one-localization`; `PadicFamiliesPartII:S7/cousin-complex`; `PadicFamiliesPartII:S7/sen-block`; `PadicHodgeTheory:R06.2`.

**Source.** BCGP25, Theorem 4.10.12, pp. 108–109. Identifies the infinitesimal Galois obstruction with the coherent boundary.

**Acceptance.** The comparison identifies the extension class up to a nonzero scalar; equality of the graded scalar Sen characters alone does not pass this check.

**Open proof leaves.** Singular localization overlap kernel.

### Balanced eigenpacket exactness — `S7/multiplicity-balance`

Let f be an ordinary overconvergent weight-(2,2;−w) eigenform with attached globally irreducible ρ_f. Assume its Zariski closure contains Sp₄, or contains SL₂×SL₂ with reducibility on an index-two subgroup, as in the source. Then V[m_f]≃ρ_f⊗W with n=dim W>0 and dim V[m_f]=4n. Assume separately that dim_{C_p}(Gr^i V_{C_p})[m_f]=n for every i=0,1,2,3, as in Theorem 4.12.4(3). Under this balance assumption, the two-step repeated-block sequence remains exact after taking m_f-annihilated eigenspaces. The image alternatives alone do not prove the four graded dimensions.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

Additional hypothesis: Assume independently the four-piece dimension balance of BCGP25 Theorem 4.12.4(3); Lemma 4.12.3 and its global-image alternatives do not establish that balance.

**Proof plan.** Use the Eichler–Shimura polynomial relation and the specified semisimplicity/multiplicity theorem to identify V[m_f]≃ρ_f⊗W. Keep the four equal graded dimensions as an independent assumption. If separately supplied multiplicity-one bounds each graded eigenspace by one, total dimension a positive multiple of four forces n=1; this is the conditional verification in Remark 4.12.5. The filtration on V[m_f] injects on each graded into (Gr^i V_{C_p})[m_f]. Equality of the sum of these upper bounds with dim V[m_f]=4n forces equality at every step and exactness on the repeated block.

**Direct inputs.** `PadicFamiliesPartII:E6/four-pieces`; `PadicFamiliesPartII:S7/sen-block`; `AutomorphicGaloisRepresentationsPartII:AG2.1a`; `AutomorphicSpectralTheory:AS.5`.

**Source.** BCGP25, Propositions 4.11.1–4.11.2, pp. 109–112; Lemma 4.12.3 and Theorem 4.12.4(3), p. 113; Remark 4.12.5, p. 114. Lemma 4.12.3 supplies the tensor multiplicity; Theorem 4.12.4 assumes the graded balance independently.

**Acceptance.** The global-image assumptions supply total dimension 4n, while the four graded dimensions n are a separate hypothesis. Their sum forces exactness after taking m_f-annihilated eigenspaces. A claim deriving the graded balance solely from the image alternatives fails this check.

**Open proof leaves.** Exact eigenpacket and packet balance.

### De Rham ordinary classicality — `S7/de-rham-classicality`

In the preceding residual, global-image and ordinary-weight setting, assume the independent balance dim(Gr^i V_{C_p})[m_f]=n for all four i, dim V[m_f]=4n, and that ρ_f|G_{Q_p} is de Rham. Then f is classical. Indeed the arithmetic Sen operator is semisimple on V[m_f]=ρ_f⊗W, so N_a vanishes on this packet. The Sen–Cousin comparison kills the singular obstruction, and the balanced classical packet has enough degree-zero forms to contain f.

Additional hypothesis: Specialize to GSp₄/Q, ρ=(−1,−2;0), d=3, the four representatives i_w of lengths i=0,1,2,3, and λ=(1,1;w) with w even. Localize at a prime-to-p Hecke maximal ideal with absolutely irreducible residual four-dimensional Galois representation.

Additional hypothesis: Use the arithmetic Sen normalization in which Q_p(1) has Hodge–Tate weight −1 and Sen eigenvalue +1. Multiplicity assertions concern finite-dimensional eigenpackets after the explicitly stated localization.

Additional hypothesis: Assume independently the four-piece dimension balance of BCGP25 Theorem 4.12.4(3); Lemma 4.12.3 and its global-image alternatives do not establish that balance.

**Proof plan.** Use de Rham Hodge–Tate semisimplicity on the actual finite-dimensional eigenpacket, not on the whole completed space. Use the dimension balance to retain exactness after taking eigenspaces and conclude the Cousin map vanishes there. Use the localized stable-packet coherent multiplicity comparison to identify the resulting classical weight-two eigenspace of dimension n. Match the ordinary refinements and conclude that the given eigenform lies in it.

**Direct inputs.** `PadicFamiliesPartII:S7/sen-cousin`; `PadicFamiliesPartII:S7/multiplicity-balance`; `AutomorphicSpectralTheory:AS.5`; `PadicHodgeTheory:R06.2`.

**Source.** BCGP25, Theorem 4.12.4, pp. 113–114. Exports the source’s classicality theorem with its indispensable packet hypotheses.

**Acceptance.** The independent four-piece balance of Theorem 4.12.4(3) is checked before applying Sen semisimplicity to the finite-dimensional eigenpacket and matching the ordinary refinement in the classical eigenspace.

**Open proof leaves.** Exact eigenpacket and packet balance; Singular localization overlap kernel.

**Layer status: planned.** Exact eigenpacket and packet balance Singular localization overlap kernel Obtain exact supplier nodes for AutomorphicSpectralTheory:AS.5 Obtain exact supplier nodes for AutomorphicGaloisRepresentationsPartII:AG2.1a Obtain exact supplier nodes for PadicHodgeTheory:R06.2.

## F8 — Four integral projective Hida modules

**Standing hypotheses.**

Use the integral Siegel GSp₄ datum, p any prime, coefficient DVR O, full Λ=O[[T(Z_p)]] including its finite-order part, neat tame level and all four Weyl strata. The integral genus-two amplitude theorem is available; no assertion of integral sharp amplitudes in genus ≥3 is made.

Transport the imported BP family along the ring involution ι([t])=[t⁻¹]. Thus the BCGP convention evaluates at +λ while the imported BP convention evaluates at −λ. All comparisons include the algebraic torus twist E(−λ) and the transposed torus action in duality.

### Four projective Hida modules — `F8/four-modules`

Let M_w^BP be the imported supported integral Iwasawa complex, and M_w^BC its base change along ι([t])=[t⁻¹]. For ℓ(w)=0,1 use cuspidal support and define 𝓜_w=H^{ℓ(w)}(M_w^BC); for ℓ(w)=2,3 use canonical support and the same degree. This definition precedes the proof that the complex is concentrated in that degree. Neither its flatness nor projectivity is included as defining data.

**Proof plan.** Transport the existing universal complexes rather than constructing a second family. Choose cusp/canonical support according to the length. Take the specified cohomology module with its Λ and Hecke actions.

**Direct inputs.** `HigherHidaAndColemanTheory:I3/iwasawa-complex`; `HigherHidaAndColemanTheory:I3/derived-control`; `HigherHidaAndColemanTheory:I3/integral-amplitudes`; `PadicMeasuresIwasawaAlgebras:L1`.

**Source.** BCGP25, §7.3, pp. 163–164; Theorem 7.3.1(1). Names the four modules extracted from the existing integral theory.

**API.**

- `TauCeti.PadicFamiliesPartII.fourHidaModule` (constructor): 𝓜_w is the length-degree cohomology of the transported supported complex.

- `TauCeti.PadicFamiliesPartII.fourHidaModule_support` (characterisation): Use cusp for lengths 0,1 and canonical for lengths 2,3.

- `TauCeti.PadicFamiliesPartII.fourHidaModule_character` (compatibility): Evaluation +λ in the transported convention equals evaluation −λ before ι.

- `TauCeti.PadicFamiliesPartII.fourHidaModule_hecke` (structure): The inherited Λ-linear Hecke action is independent of choices under the supplied comparison maps.

**Definition tests.**

- `TauCeti.PadicFamiliesPartII.fourHida_length0` (degenerate): The length-zero module uses H⁰ of the cuspidal complex.

- `TauCeti.PadicFamiliesPartII.fourHida_length3` (compatibility): The length-three module uses canonical H³ and is dual to the transported length-zero module.

- `TauCeti.PadicFamiliesPartII.fourHida_sign` (non-example): For a nonquadratic character χ, evaluation χ differs from χ⁻¹; omitting ι changes the specialization.

**Consumers.** BCGP25 Theorem 7.3.1(2)–(3): Provides all four chamber specializations. BCGP25 Theorem 7.3.1(5): Provides tame-level modules for patching.

**Acceptance.** All maps retain the stated level, boundary condition, scalar normalization and coefficient action.

### Integral concentration and projectivity — `F8/projectivity`

For each of the four w, the transported supported complex is quasi-isomorphic to 𝓜_w[−ℓ(w)], and 𝓜_w is finite projective over full Λ. This includes p=2 and does not decompose a p-power finite torus quotient by averaging. Genus-two integral amplitude alone is insufficient: the length-one cuspidal H⁰ vanishes, and duality gives the corresponding length-two canonical concentration.

**Proof plan.** Use the imported genus-two integral amplitude bounds. Prove H⁰ of a sheaf with the length-one support condition vanishes; use duality for the complementary case. Apply derived control at all characters/residue fibers and the supplied perfect-fiber concentration criterion, including the finite-torus cofinal system.

**Direct inputs.** `PadicFamiliesPartII:F8/four-modules`; `HigherHidaAndColemanTheory:I3/family-duality`; `DeformationAndDerivedPatchingAlgebra:P7`.

**Source.** BCGP25, Theorem 7.3.1(1) and proof, pp. 164–165. Extracts projective modules from bounded supported complexes.

**Acceptance.** The length-one cusp H⁰ and its complementary dual obstruction vanish before concentration is asserted. The test includes the full finite torus at p=2.

**Open proof leaves.** Full-torus and tame descent refinement.

### Four-chamber classical specialization — `F8/classical-specialization`

Let λ be algebraic G-dominant and κ=−w₀,M w(λ+ρ)−ρ. Then 𝓜_w⊗_{Λ,λ}E(−λ) is H^{ℓ(w)}(Sh_Iw,ω^κ(−D))^{ord} for lengths 0,1, and the canonical variant for lengths 2,3. All other cohomology of the supported derived fiber vanishes. This is an isomorphism of normalized Hecke and torus modules.

**Proof plan.** Use derived character control after the involution transport. Apply the regular chamber classicality comparison of the imported integral theory. Use concentration/projectivity to replace derived tensor by ordinary tensor and insert E(−λ).

**Direct inputs.** `PadicFamiliesPartII:F8/projectivity`; `HigherHidaAndColemanTheory:H2/regular-control`; `HigherHidaAndColemanTheory:X8/c2-weight-table`.

**Source.** BCGP25, Theorem 7.3.1(2) and Remark 7.3.3, pp. 164–166. Specializes in the classical chamber without losing the character sign.

**Acceptance.** A nonquadratic character distinguishes evaluation at λ from evaluation at −λ. The coefficient involution and E(−λ) twist must yield the stated classical weight.

### Four-chamber Coleman specialization — `F8/coleman-specialization`

For algebraic λ with κ=−w₀,M w(λ+ρ)−ρ merely M-dominant, the same specialization is the degree-ℓ(w) ordinary higher-Coleman group with the appropriate cusp/canonical support and T(Z_p)-invariance after E(−λ). No G-dominant classical global identification is asserted at such a weight.

**Proof plan.** Use the ordinary-overconvergent family comparison. Identify the normalized positive torus operators using Remark 7.3.3. Retain the torus invariants and support convention before taking the concentrated degree.

**Direct inputs.** `PadicFamiliesPartII:F8/projectivity`; `HigherHidaAndColemanTheory:B7/family-comparison`.

**Source.** BCGP25, Theorem 7.3.1(3) and Remark 7.3.3, pp. 164–166. Supplies the nonclassical chamber specialization.

**Acceptance.** A weight that is M-dominant but not G-dominant still gives the higher-Coleman fiber, without an unsupported global classical identification.

### Integral four-module duality — `F8/perfect-pairing`

For w*=w₀,M w w₀ there is a perfect Λ-valued pairing 𝓜_w×𝓜_{w*}→Λ after the specified torus-involution transport, matching the Serre coefficient twist and the adjoint normalized Hecke action. The complex shift [−3] becomes complementary degrees ℓ(w)+ℓ(w*)=3; it is not an additional shift on the modules.

**Proof plan.** Start with the imported integral family duality and its transpose t↦w₀t⁻¹. Transport both coefficient actions through ι and the Serre weight identification. Use finite projectivity and concentration to take the complementary degree pairing.

**Direct inputs.** `PadicFamiliesPartII:F8/projectivity`; `HigherHidaAndColemanTheory:I3/family-duality`.

**Source.** BCGP25, Theorem 7.3.1(4), printed p. 164; BP26 Theorems 5.5.1–5.5.2, author pp. 56–57. Descends the existing derived pairing to projective modules.

**Acceptance.** Lengths 0 and 3, and lengths 1 and 2, pair after the prescribed torus transport. No extra complex shift is attached to either module.

### Tame group-ring projectivity — `F8/tame-projectivity`

For normal neat tame levels K₁⊂K₂ with finite Δ=K₂/K₁, 𝓜_{w,K₁} is finite projective over Λ[Δ]. Pullback identifies 𝓜_{w,K₂} with Δ-invariants, and trace identifies the coinvariants with 𝓜_{w,K₂}. The result allows p∣|Δ|; it uses prime-to-p geometric boundary stabilizers and derived descent, not division by |Δ|.

**Proof plan.** Use the compatible tame-level torsor in the interior and analyze boundary stabilizers on toroidal charts. Prove the required derived coinvariants are concentrated in degree zero, also after residue-field reduction. Apply the supplied group-ring/Sylow projectivity criterion and identify trace and pullback.

**Direct inputs.** `PadicFamiliesPartII:F8/projectivity`; `DeformationAndDerivedPatchingAlgebra:P7`; `ShimuraCompactifications:C3`.

**Source.** BCGP25, Theorem 7.3.1(5) and Lemma 7.3.2, pp. 164–165. Provides integral group-ring projectivity at arbitrary finite tame deck groups.

**Acceptance.** The derived-coinvariant residue-fiber test includes Δ of order divisible by p and identifies both pullback invariants and trace coinvariants.

**Open proof leaves.** Full-torus and tame descent refinement.

### Fixed-central-character specialization — `F8/central-character`

Base change the full-torus modules along the BCGP two-variable Galois-weight map, defined by the root-datum/central-character identity of Lemmas 7.3.5–7.3.6; interpret the half-ρ notation through that integral identity, not arbitrary half-powers of characters. Fixing central action |·|² gives finite projective two-variable group-ring modules at the neat auxiliary level of Lemma 7.3.8. Choose r>5,r≠p, with p∤(r−1) if p is odd, and 4∤(r−1) if p=2. The final central invariants factor through F_r×/{±1}, of order prime to p.

**Proof plan.** Use the universal diagonal Galois character and its multiplier relation to define the torus-ring map. Base change the finite projective tame module. Use Iw₁(r) to retain neatness when enlarging the tame center, and take the prime-to-p quotient invariants as a direct summand. Keep the two cases for r separate; the printed odd-prime condition is impossible when imposed literally at p=2.

**Direct inputs.** `PadicFamiliesPartII:F8/tame-projectivity`; `PadicFamiliesPartII:F8/perfect-pairing`; `PadicMeasuresIwasawaAlgebras:L1`.

**Source.** BCGP25, Lemmas 7.3.5–7.3.8 and Remark 7.3.7, pp. 166–167. Defines the central-character modules used by patching.

**Acceptance.** At p=2 choose r≡3 mod 4 so (r−1)/2 is odd; imposing the odd-prime condition 2∤r−1 would have no solution.

**Open proof leaves.** Full-torus and tame descent refinement.

**Layer status: planned.** Full-torus and tame descent refinement Obtain exact supplier nodes for DeformationAndDerivedPatchingAlgebra:P7 Obtain exact supplier nodes for ShimuraCompactifications:C3 Obtain exact supplier nodes for PadicMeasuresIwasawaAlgebras:L1.

## Checks across the layers

The smallest PEL normalization check is the modular-curve type-C case d=a=1, where n=1; for GSp₄, d=1,a=2 gives n=3. With terminal weight c=4 and eigenvalue slope s=0, choose ε<1/4: n+s−(1−ε)c<0. At c=3 the strict inequality fails. These examples catch a missing trace scalar, an endpoint mistake and the sign issue in the bad-branch norm estimate.

At singular genus-two weight Ω(k,2), the geometric extension threshold is k+1 while the all-degree analytic-induction threshold is k−2. For k=0 the former is 1 and the latter is −2. The distinction explains why a degree-zero control statement does not automatically give all-degree finite-slope control. The corrected derivative identity must reproduce both bounds.

For doubling, the numerical companion operator T=5,U=6 sends (2,3) to (28,−2). Its characteristic polynomial is X²−5X+6, with roots 2 and 3. The minus sign in the second coordinate is essential. The abstract map (f,g)↦f+Zg on one common module has a large kernel. The geometric injection uses different global and ordinary-open spaces and needs the no-everywhere-regular-eigenvector argument; a formal 2×2 calculation alone cannot prove it.

For a single Klingen place, if r:A→B is H⁰-injective and H¹-surjective between finite two-term complexes, then χ(A)−χ(B)=−dim coker H⁰(r)−dim ker H¹(r). Equality of Euler characteristics forces both defects to vanish. This sign check is the repair used in C5. A four-term complex does not admit the same two-defect argument, so the conclusion is not extended to arbitrary |I|.

At the repeated Sen weight w=2, the four scalar values are −2,−2,−3,−3. This nonzero central parameter detects the sign of the central twist. A nontrivial Jordan block still has these graded scalar values. The Sen–Cousin theorem therefore needs the extension-class calculation; comparing scalar characters is insufficient. In the local overlap calculation, the analytic germ 1/(1+x) is killed by (x+1)∂_x+1, so the actual constrained fiber must be identified before its claimed injectivity can be used.

For F8 the length-zero cusp and length-three canonical modules pair. The complex shift [−3] becomes the equality of complementary degrees; an additional module shift would be wrong. A nonquadratic character distinguishes evaluation at χ and χ⁻¹ and detects a lost Iwasawa inversion. At p=2, neither the finite torus nor a p-divisible tame deck group can be handled by averaging. The group-ring projectivity proof instead uses derived coinvariants and geometric stabilizers.

## Supplier contracts and open proof leaves

These contracts extend existing owners where an exact supplying node was not found. A stage link records the owner of the required mathematics, not proof that the owner already supplies it. The first-column identifiers are the packet’s actual prerequisites.


- **`PELModuli:M4`.** Supply the integral type-A/C Iwahori complement moduli and quotient isogenies with the BPS local hypotheses, including Morita/polarization and fan transitions. Consumers: `P0/degree`, `P0/hecke`.

- **`HodgeTateAndCanonicalSubgroups:T0`.** Supply the finite-flat degree, additivity, polarization duality and BT₁ equality criterion over complete rank-one valuation rings. Consumers: `P0/degree`, `P0/degree-monotonicity`.

- **`AdicSpacesPartII:R3`.** Supply Bartenwerfer bounded-section completeness and gluing of coherent integral lattices modulo increasing precision on the admissible strict-neighborhood covers used in BPS Proposition 4.1.2. Consumers: `P1/bounded-extension`.

- **`ShimuraCompactifications:C5`.** Supply normality of the actual type-A/C Iwahori local models and integral Koecher extension for the coefficient sheaves on each dimension>1 component, including the cuspidal variant. Supply partial Hasse regular sequences on the supported Hilbert–Siegel formal strata, including regularity after arbitrary powers of the other partial Hasse equations and the required relative acyclicity. Supply the mixed-locus 2^{|I|} affinoid cube with all finite intersections acyclic after toroidal-to-minimal pushforward of the analytic coefficients. For all Klingen levels p^n supply the coefficient/++-lattice higher-direct-image vanishing and a uniform bounded-torsion Čech-to-derived comparison on the chosen analytic torsor cover, including completed sums and finite-level invariants. Supply the two-affine rank≥1 minimal-special-fiber cover and the relative cuspidal acyclicity used for P20 Proposition 8.2.1 and BCGP21 Theorem 4.2.1; these give the numerical amplitudes on the rank opens, not an integral global amplitude. Consumers: `P1/classicality`, `H3/fixed-amplitude`, `H3/trace-control`, `C5/analytic-amplitude`, `K2/bgg-scaling`, `K2/torsion-continuation`, `K2/spherical-amplitude`.

- **`AutomorphicBundles:B5`.** Supply integral q-expansion injection and p³U-stability for the Klingen H⁰ lattice, plus normalized away-from-Np Hecke commutation. Supply integrality of each selected U_{v,1},U_{v,2} on the relevant ordinary cohomology lattices, sufficient to infer individual unit slopes from a unit product. Consumers: `K2/bgg-scaling`, `K2/euler-zero`, `C5/euler-family`.

- **`SmoothRepresentationsOfLocalGroups:SR.4`.** Supply the spherical-to-Klingen comparison on the selected ordinary Satake root with only its necessary eigenvalue separation; do not assume pairwise distinct Satake roots or compare different finite representations. Supply the geometric-to-positive-Hecke operator identification for the Hilbert Klingen/Iwahori local factors, retaining the chosen symplectic convention. Consumers: `K2/euler-zero`, `D4/first-operator`, `D4/quadratic`.

- **`AutomorphicSpectralTheory:AS.5`.** Supply the localized genus-two coherent automorphic decomposition and the balanced holomorphic/generic limit-of-discrete-series multiplicities at the same finite representation used in Pilloni Proposition 15.2.4.1 and §15.2.5. Supply the non-Eisenstein Hilbert coherent automorphic Euler comparison at the large-weight witness, including the Arthur input of BCGP21 Theorem 3.10.1(2). Supply the localized stable-packet coherent multiplicity computation at weight (2,2), with the same finite representation and ordinary refinements, used in BCGP25 Theorem 4.12.4. The four graded eigenspace dimensions in Theorem 4.12.4(3) remain an independent hypothesis: supply them, or the separate multiplicity-one bounds of Remark 4.12.5, for any application claiming them. The stable classical-packet comparison is another input, not a proof of this completed graded balance. Consumers: `K2/euler-zero`, `C5/euler-family`, `S7/multiplicity-balance`, `S7/de-rham-classicality`.

- **`PELModuli:M2`.** Supply Hilbert–Siegel integral models, the height-one maximal multiplicative subgroup on the rank≥1 locus and the selected Klingen/Iwahori flag components, with the log/toroidal extension. Consumers: `H3/mixed-locus`.

- **`HodgeTateAndCanonicalSubgroups:T5`.** Supply the partial Igusa torsors and their determinant-compatible quotient isogenies, including affine étaleness outside the fully ordinary locus. Supply the Hilbert mixed canonical-subgroup frame torsor, modified Hodge lattice and radius-change estimates with determinant and boundary compatibility. Consumers: `H3/mixed-locus`, `H3/universal-coefficients`, `H3/operators`, `C5/analytic-complex`, `C5/compact-action`.

- **`DeformationAndDerivedPatchingAlgebra:P7`.** Supply derived Nakayama for a complete multivariable Iwasawa algebra, detection of perfect amplitude by all residue fibers, and concentration-implies-projectivity criteria with no finite-character semisimplicity assumption. Supply the finite group-ring/Sylow projectivity criterion and derived-coinvariant residue-fiber test of BCGP25 Lemma 7.3.2, also when p divides the deck-group order. Consumers: `H3/derived-control`, `F8/projectivity`, `F8/tame-projectivity`.

- **`AutomorphicBundles:B2`.** Supply O_F-linear Kodaira–Spencer compatibility for prime-to-p quasi-isogenies over Z_(p), followed by the normalized integral p-correspondence identities of BCGP21 Propositions 5.5.2–5.5.3 and 5.6.1. Retain Norm(x_w)³/p³ and reduce only after constructing the integral trace; do not infer compatibility of a raw inseparable differential. Consumers: `D4/kodaira-spencer`.

- **`LocallyAnalyticDistributions:L0`.** Supply continuous derived locally Q_p-analytic vectors and Lie-algebra derived Hom on the completed tower, with completed tensor/base-change and Chevalley–Eilenberg comparison. Consumers: `E6/completed-functor`, `E6/localization-comparison`.

- **`tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.** The algebraic Verma theory for a finite-dimensional Lie algebra is an existing input. A dedicated continuation must supply O(𝔤,𝔟)_{λ-alg}, canonical completion M⊗_{U(𝔤)}Û(𝔤), its continuous dual and λ-twist, completion/Lie-homology comparison, analytic localization, non-Liouville exactness and dual-Verma fibers (BCGP25 Theorem 2.2.39, §3.4, Theorem 3.5.11 and Theorem 4.7.2). The automorphic comparison is stated on this BGG domain. The current Verma stage supplies neither this analytic realization nor a theorem for arbitrary completed topological coefficients. Consumers: `E6/completed-functor`, `E6/localization-comparison`, `E6/spectral-sequence`.

- **`PerfectoidShimuraVarieties:S3`.** Supply the solid analytic automorphic vector-bundle functor VB_red, its localization/Chevalley–Eilenberg comparison, and the arithmetic-Sen/horizontal-µ identification (BCGP25 Theorem 4.5.20 and Theorem 4.7.1). Consumers: `E6/localization-comparison`.

- **`AutomorphicBundles:B3`.** Supply the Igusa-boundary normalization and coefficient support triangle with the lower-rank Hecke factorization needed to exclude absolutely irreducible residual ideals. Consumers: `E6/boundary`.

- **`AutomorphicGaloisRepresentationsPartII:AG2.1a`.** Supply the Eichler–Shimura characteristic-polynomial relation on the genus-two completed tower and its Nekovář-style multiplicity consequence under the stated Zariski-image alternatives, exactly as BCGP25 §4.11 and Lemma 4.12.3 require; an arbitrary attached Galois representation alone does not supply it. Consumers: `S7/multiplicity-balance`.

- **`PadicHodgeTheory:R06.2`.** Supply the arithmetic Sen comparison, de Rham implies Hodge–Tate with semisimple Sen action, and the normalization Sen(Q_p(1))=+1 for the finite-dimensional eigenpacket. Consumers: `S7/sen-cousin`, `S7/de-rham-classicality`.

- **`ShimuraCompactifications:C3`.** Supply tame-level descent on toroidal strata with prime-to-p geometric stabilizers and the exact coefficient trace/pullback compatibility needed for full Λ[Δ]-projectivity. Consumers: `F8/tame-projectivity`.

- **`PadicMeasuresIwasawaAlgebras:L1`.** Supply full-torus completed group rings, the inversion base-change functor including finite-order characters at p=2, and the integral universal-character map of BCGP25 Lemmas 7.3.5–7.3.6. Consumers: `F8/four-modules`, `F8/central-character`.

- **`IntegralHeckeAndGaloisDeterminants:IHG.3`.** Supply the normalized genus-two spherical trace/Hecke-polynomial dictionary with multiplier and duality conventions, as used in Pilloni §15.1. Consumers: `K2/away-hecke`.

- **`SchemeAndStackFoundations:SF.2`.** The coherent-duality construction is already a written supplier node and is imported by its exact identifier. Its general shriek/finite-duality API does not alone provide the integral fundamental-class divisibilities, compatible Kodaira–Spencer maps or all required base-change identities for these singular correspondences. Request those precise extensions in SF.2; do not treat duality as baseline or replace it with a data assumption. Consumers: `K2/spherical`, `D4/kodaira-spencer`, `D4/second-operator`.

The following gaps remain even though every stage has a target-level plan. Supplier gaps inherited from HigherHidaAndColemanTheory and CompletedCohomologyPartII also remain inherited; importing their nodes does not close them.

- **Scope of the signed PEL estimate.** The BPS degree lower bound cannot be multiplied by a negative terminal weight without reversing its direction. This plan proves the stated positive-terminal-weight region with nonnegative eigenvalue slopes; extending to the paper’s unrestricted signed-weight formulation needs a separate estimate. Affected targets: `P1/strict-slope`, `P1/contraction`, `P1/classicality`.

- **Dimension-one PEL reduction.** The original source invokes modular-curve continuation in dimension one. A classification/reduction covering every possible dimension-one PEL factor has not been supplied; the new theorem is restricted to components of dimension>1. Affected targets: `P1/classicality`.

- **Finite-block topology in torsion comparison.** The source’s bounded-cocycle argument must be strengthened by continuity and boundedness of the finite-slope projection on cohomology modulo boundaries. The target records this proof obligation; bounded cocycles alone do not prove the required bounded classes. Affected targets: `K2/torsion-continuation`.

- **Euler characteristic versus torsion.** Pilloni Remark 1.4 and Remark 15.2.1 formulate stronger torsion/support-dimension predictions. No torsion theorem is inferred from virtual rank zero; packet-balance and local-level comparison remain explicit supplier contracts. Affected targets: `K2/euler-zero`.

- **Integral Hilbert descent with p-torsion deck quotient.** The direct-factor descent used in BCGP21 Proposition 4.4.3 needs derived invariants if the deck/unit quotient has p-torsion. Neatness does not imply p∤|Δ|. The integral common-similitude theorem here imposes p∤|Δ|; extending to all levels requires a separate descent argument. Affected targets: `H3/universal-coefficients`, `H3/family-complex`, `H3/derived-control`.

- **Multivariable Hasse powers.** The simultaneous-powers exact sequence invoked in Proposition 4.6.19 fails for two independent parameters. The corrected single-exponent induction needs the precise regular-sequence and supported-acyclicity input requested from C5; until supplied, this control proof is not closed. Affected targets: `H3/trace-control`, `H3/derived-control`.

- **Finite-block completion and analytic intersections.** The exact continuous finite-block projection on the completed Čech complex, and acyclicity of every cube intersection for the analytic coefficient, are needed for injectivity and amplitude. Neither follows merely from projectivity of charts. Supplier statements and proof obligations are explicit. Affected targets: `C5/analytic-amplitude`, `C5/multi-continuation`, `C5/one-place-comparison`.

- **Strength of Hilbert rational comparison.** The two-term Euler argument applies to |I|=1 after non-Eisenstein localization and individual-operator integrality. A full classical comparison for arbitrary |I| or an integral comparison without the stated deck condition is not a consequence of these sources. Affected targets: `C5/one-place-comparison`.

- **Completed analytic localization carrier.** The current algebraic highest-weight roadmap does not supply the canonical completion, continuous dual, λ-action twist and analytic localization of O(𝔤,𝔟)_{λ-alg}. Their completion and non-Liouville exactness comparisons need a dedicated LieHighestWeight continuation before E6 closes. No comparison for arbitrary topological coefficients is inferred. Affected targets: `E6/completed-functor`, `E6/localization-comparison`, `E6/spectral-sequence`.

- **Exact eigenpacket and packet balance.** Taking m-annihilated eigenspaces is not exact. BCGP25 Theorem 4.12.4(3) assumes four equal graded eigenspace dimensions independently of the image hypotheses; Lemma 4.12.3 proves only total tensor multiplicity. The corrected classicality target retains that balance as a hypothesis. Applying it requires a separate verification, such as the multiplicity-one bounds in Remark 4.12.5, as well as the stable classical automorphic-packet comparison. Affected targets: `S7/multiplicity-balance`, `S7/de-rham-classicality`.

- **Full-torus and tame descent refinement.** The projectivity argument needs the cofinal full-torus integral control and tame-boundary stabilizer calculation, including p=2 and p-divisible Δ. These are requested explicitly; semisimple finite-character splitting or averaging would not close this stage. Affected targets: `F8/projectivity`, `F8/tame-projectivity`, `F8/central-character`.

- **Singular localization overlap kernel.** BCGP25 Proposition 3.6.15 uses injectivity of (x+1)∂_x+1 at an overlap fiber. The germ 1/(1+x) is an ambient kernel element. Its membership in the constrained fiber is not established, so this is a proof gap rather than a counterexample to the proposition. Supply the missing fiber restriction or a different nonzero intertwiner before closing the Sen–Cousin theorem or its classicality application. This independently reproduces the reviewed extraction finding PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E015. Affected targets: `S7/rank-one-localization`, `S7/sen-cousin`, `S7/de-rham-classicality`.

- **Klingen integral analytic lattice estimates.** Pilloni §13.3.1 needs the higher-Klingen-level vanishing for the ++ sheaf and a bounded-torsion Čech-to-derived comparison for its completed analytic coefficient lattice, not only the finite-rank O⁺ case. These are the substantive obligations behind reviewed extraction findings E115–E116; the requested toroidal/radius estimates must include them. Affected targets: `K2/bgg-scaling`, `K2/torsion-continuation`.

- **Integral fundamental-class trace extension.** The coherent-duality construction is already a written supplier node and is imported by its exact identifier. Its general shriek/finite-duality API does not alone provide the integral fundamental-class divisibilities, compatible Kodaira–Spencer maps or all required base-change identities for these singular correspondences. Request those precise extensions in SF.2; do not treat duality as baseline or replace it with a data assumption. Affected targets: `K2/spherical`, `D4/kodaira-spencer`, `D4/second-operator`.

## Source corrections

Every description here is in the roadmap’s own words. The packet field named `printed` records a paraphrase, honoring the standing prohibition on source passages. Existing reviewed extraction findings are credited; no priority claim is made. None of the proof gaps is presented as a counterexample to a final theorem.

- **E01 (error): BPS Lemma 4.4.3, journal p. 1003.** Use each coordinate quotient map separately; take finite intersections of its quasi-compact inverse images and then the finite étale p_k-image. For k>1 the source and product target have different dimensions in positive dimension. Coordinate finiteness suffices for the required quasi-compactness. Reach: the proof. Reviewed extraction PAPER-BIJAKOWSKI-PILLONI-STROH-16 sourceIssues; repair verified here.

- **E02 (gap): BPS Lemma 4.4.5, journal p. 1004.** Require c_i≥0 for that insertion; this plan uses s_i≥0 and s_i+n_i<c_i, which force c_i>0. Multiplying a lower bound by a negative number reverses its direction. The contraction argument here is valid in the explicitly restricted positive-weight region. Reach: a stated result. Reviewed BPS extraction; signed-weight extension remains unresolved.

- **E03 (gap): BPS §4.5–§5.1, journal pp. 1006–1009.** Exhaust the auxiliary conditions by closed rational boxes and glue their uniquely continued sections. A half-open interval of valuations is not automatically a quasi-compact analytic domain. Reach: the proof. Reviewed BPS extraction; compact-box repair incorporated.

- **E04 (misprint): P20 diagram 13.3.3.1, author p. 90.** Use D^{k+1}U_source=p^{k+1}U_target D^{k+1}. Differentiating f(pz) k+1 times gives p^{k+1}; combining with the −3 slope floor gives the stated k−2 threshold. Reach: the proof. PAPER-PILLONI-20/E119; checked against the original.

- **E05 (gap): P20 Lemma 14.7.1, author p. 99.** Provide a continuous bounded projection to the finite-slope cohomology block modulo boundaries. Bounded representatives in a complex alone do not establish a bounded set of cohomology classes or closedness of the boundary image. Reach: the proof. Reviewed P20 extraction; supplier obligation retained.

- **E06 (misprint): P20 §15.2.2 and §15.2.4, author pp. 108–109.** Use λ₁=−k−1<0 in the high-weight specialization and the same root convention throughout. The stated substitution with k≥0 has negative first parameter; changing its sign changes the chamber. Reach: the proof. Reviewed P20 extraction; corrected in the Euler target.

- **E07 (gap): P20 proof of Theorem 15.2.1, author p. 109.** Take a sufficiently large witness in every finite-character component; at p=2 use the full local algebra. For odd p the Iwasawa algebra has p−1 components, and one arithmetic point determines only its component’s virtual rank. Reach: the proof. PAPER-PILLONI-20/E165; repair incorporated.

- **E08 (error): BCGP21 Proposition 4.6.19 proof, arXiv v3 pp. 113–114; published pp. 289–290.** Induct in one exponent at a time with the correct twists and regularity after arbitrary powers. In k[x,y], length k[x,y]/(x^n,y^n)=n², whereas the proposed recurrence would give (n−1)²+1. Reach: the proof. Reviewed BCGP21 extraction; corrected induction still needs the requested regular-sequence input.

- **E09 (gap): BCGP21 Proposition 4.4.3, arXiv v3 p. 99, published p. 272; Proposition 3.8.3 and Lemma 3.8.5, arXiv v3 pp. 57–58, published p. 220.** For this integral theorem impose p∤|Δ|; unrestricted descent requires derived invariants or a cohomological-triviality argument. Neat tame level does not exclude p-torsion in the finite deck quotient, and averaging is then unavailable. Reach: a stated result. Reviewed BCGP21 extraction; restricted theorem recorded.

- **E10 (misprint): BCGP21 §6.4, arXiv v3 p. 154; published pp. 338–339.** Use θ_v U_source=p^{k_v−l_v+1}U_target θ_v. The local derivative calculation fixes the direction and the slope gain. Reach: the proof. Reviewed BCGP21 extraction; same check as P20/E119.

- **E11 (error): BCGP21 Theorem 6.6.4 proof, arXiv v3 p. 167; published p. 355 (compare Proposition 6.6.2, arXiv v3 pp. 165–166, published pp. 353–354).** Use the actual restriction r:K†→M; H⁰(r) injective and H¹(r) surjective imply χ(K†)−χ(M)=−a−b. Equality forces a=b=0. Here a is the dimension of coker H⁰(r) and b of ker H¹(r), both nonnegative. The opposite map is not supplied. Reach: the proof. Reviewed BCGP21 extraction; finite-dimensional linear-algebra repair incorporated.

- **E12 (gap): BCGP21 §6.5.1, arXiv v3 p. 154; published p. 339.** Use the untruncated determinant valuation in Fargues degree calculations, and only then pass to bounded Hasse coordinates. Truncation can lose information for p²-kernel groups, so it cannot determine their total finite-flat degree. Reach: the proof. Reviewed BCGP21 extraction; untruncated degree required.

- **E13 (misprint): BCGP25 Remark 4.10.7, printed p. 107.** Use (2,2;−w) for the degree-zero piece, as in §4.10.8. The four Weyl-weight formulas give two (1,1) and two (2,2) pieces. Reach: nothing. Corrected here using the four Weyl-weight formulas and §4.10.8; no separate published erratum located.

- **E14 (gap): BCGP25 Proposition 3.6.15 proof, printed pp. 66–67.** Identify the constrained fiber excluding the kernel germ, or prove the needed nonzero intertwiner another way. The ambient analytic germ 1/(1+x) is killed by (x+1)∂_x+1. Membership in the constrained fiber has not been established; no counterexample to the proposition is claimed. Reach: the proof. PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E015, independently confirmed by its review; reproduced here.

- **E15 (misprint): BCGP25 choice before Lemma 7.3.8, printed p. 167.** Read the conditions by cases: p odd needs p∤r−1; p=2 needs 4∤r−1. Every odd prime is 1 modulo 2, so the literal conjunction has no solution at p=2. The quotient (F_r×)/{±1} has odd order precisely in the second case. Reach: the proof. Reviewed BCGP25 extraction; casewise repair incorporated.

- **E16 — continuation polynomial (P20 Corollary 14.6.2 proof, author p. 99).** The final linear term of its displayed continuation polynomial omits a₁. Use R=−(P−P(0))/P(0) and Q=R/X: R(U)=1 and UQ(U)=1 on the P-annihilated block. For P=X²+2X+1,U=−1, the correct continuation value is 1; dropping the coefficient 2 gives 0. This is a version-scoped misprint, confirmed by the independent review. The corrected inverse polynomial was already in K2/torsion-continuation.

## Routed coverage and source editions

The packet preserves all 727 assigned source-item identifiers. They are retrieval leads, not 727 independent declarations: source proof steps are gathered into target-level nodes or imported from their unique owner. The ownership disposition is as follows.

| Assigned extraction | Items | Disposition |
| --- | ---: | --- |
| PAPER-BIJAKOWSKI-PILLONI-STROH-16 | 25 | P0–P1 cover the continuation targets; finite-flat degree, PEL moduli, boundary extension and analytic gluing are supplier contracts. Signed weights and general dimension-one reduction are explicit gaps. |
| PAPER-BOXER-PILLONI-26 | 247 | All general dynamical, integral Siegel, weight-control, duality and Coleman-comparison targets are imported from the existing 66-node HigherHidaAndColemanTheory packet; F8 extracts only the additional four projective genus-two modules of BCGP25. Source-level refinements and source issues remain inherited from that supplier. |
| PAPER-PILLONI-20 | 271 | The universal Klingen complex/control and general analytic coefficient machinery are imported by exact HigherHidaAndColemanTheory nodes; K2 adds spherical normalization, rank-zero nilpotence, corrected BGG/torsion extension and Euler characteristic. General compactification/duality/local-Hecke prerequisites are requests to their owners; conjectural torsion is a recorded gap. |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-21 | 85 | H3, D4 and C5 cover the mixed Hilbert family, doubling and one-Klingen-place rational comparison. Generic ordinary, Fredholm, Igusa and deformation machinery is imported. The stronger §5.9 vanishing is not needed by doubling. Missing descent and multivariable-power arguments are recorded gaps. |
| PAPER-BOXER-CALEGARI-GEE-PILLONI-25 | 99 | E6 and S7 cover the completed-cohomology/Sen comparisons; F8 covers §7.3 projective modules. General higher-Coleman objects and sharp genus-two amplitudes are imported. Completed category O, arithmetic boundary and eigenpacket multiplicities are precise supplier requests; the singular overlap proof remains a gap. |

BP26’s complete general backbone is imported, not re-summarized here. Each new node gives its own theorem/section/page locator. The five normative source editions and integrity hashes are:

- **BPS — Stéphane Bijakowski, Vincent Pilloni and Benoît Stroh, Classicité de formes modulaires surconvergentes.** Annals of Mathematics 183 (2016), no. 3, 975–1014; DOI 10.4007/annals.2016.183.3.5. Locators use journal pagination. Read 2026-10-19. [Source](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p05-p.pdf). SHA-256: `13c159cde16c09c98de6b29ed1cf0e293ae78e5dc250399a1ee9203b3601d92c`. Accessed 2026-10-19.

- **BP26 — George Boxer and Vincent Pilloni, Higher Hida theory for Siegel modular forms.** Author version of 5 November 2025, 65 printed pages; Inventiones mathematicae 244 (2026), 45–141, DOI 10.1007/s00222-025-01393-2. Page locators use the author version. Read 2026-10-19. [Source](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/higherhidaSiegel.pdf). SHA-256: `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. Accessed 2026-10-19.

- **P20 — Vincent Pilloni, Higher coherent cohomology and p-adic modular forms of singular weights.** Cleared author PDF dated 17 June 2019, 113 printed pages. Duke Mathematical Journal 169 (2020), no. 9, 1647–1807, DOI 10.1215/00127094-2019-0075. Locators use the author PDF, not journal pagination. Read in place 2026-10-19. [Source](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf). SHA-256: `4c05724efeab1dbbb108f980ec9a722127d2a8cd2abf6e8c2a6a2251cf0f9f58`. Accessed 2026-10-19.

- **BCGP21 — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Abelian surfaces over totally real fields are potentially modular.** arXiv:1812.09269v3, 28 November 2021; Publ. Math. IHÉS 134 (2021), 153–501, DOI 10.1007/s10240-021-00128-2. Locators use the printed page numbers of arXiv v3. [Source](https://arxiv.org/pdf/1812.09269v3). SHA-256: `7c8d74b0628d8b9cc841a853372ca2d0bc18c086ab46d138f75afd15f35689ed`. Accessed 2026-10-19.

- **BCGP25 — George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, Modularity theorems for abelian surfaces.** arXiv:2502.20645v1, 28 February 2025, 230-page PDF. Locators use its printed pages. Read 2026-10-19; the version-history check returned only v1. [Source](https://arxiv.org/pdf/2502.20645v1). SHA-256: `51d7eacca6eae394943f09ab72dfe09ee9aa6da27f563be8237c416e5da4e95c`. Accessed 2026-10-19.

The cleared Pilloni author PDF was read in place; neither the PDF nor an extracted text copy is a deliverable. Public PDFs were confined to scratch storage. Page numbers never switch silently between author and journal editions. In particular, the correct Pilloni journal citation is Duke 169 (2020), no. 9, 1647–1807; the different bibliographic pagination in the existing supplier packet does not change the hashed author edition used here.

## Suggested Lean and handoff boundary

[PadicFamiliesPartII.lean](../suggested/PadicFamiliesPartII.lean) follows the current worker shape: light real-bodied definitions over existing carriers, selected end statements and examples. It does not define a fake Shimura variety, family complex, completed category-O object or Sen filtration by filling a data field with an admitted term. The three light definitions are the rational strict-slope predicate, the integer Klingen threshold, and the companion linear operator. Their API names and examples match the packet. Heavy definitions, their 56 remaining API specifications and 42 tests remain reader targets until their carriers exist.

The packet proposes an assembly of the two Part II identities with an explicit node-alias map, and a dedicated analytic-localization continuation of LieHighestWeight for the BGG coefficient domain. These remain decisions for the orchestrator. The independent review checked gap propagation in S7, finite-character inversion in F8, multivariable devissage in H3 and quasi-compact bad domains in P1; the unresolved mathematical inputs remain in the gap and request lists.

## Independent review refinements

The independent review retains all 62 targets, 14 explicit gaps and 21 requests. In particular, the spherical amplitude bounds belong to the indicated special-fiber rank opens; the integral family theorem is separate. Singular de Rham classicality assumes the four-piece balance in BCGP25 Theorem 4.12.4(3). Its global-image alternatives supply total tensor multiplicity and do not supply the graded balance.

All 16 source findings were checked. Findings E08–E12 were also compared with the published BCGP21 PDF: Lemma 3.8.5 p. 220, Proposition 4.4.3 p. 272, Proposition 4.6.19 pp. 289–290, §6.4 pp. 338–339, §6.5.1 p. 339 and Theorem 6.6.4 p. 355. They remain present in those passages. Other P20 findings are scoped to the cleared 17 June 2019 author copy; no unread published text is claimed to have been checked. The packet records version URLs, access dates and hashes.
