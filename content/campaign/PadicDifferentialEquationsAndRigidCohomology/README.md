# p-adic differential equations, rigid cohomology and p-adic weights

## Scope and status

Use a complete discretely valued characteristic-zero coefficient field with residue characteristic p and a specified Frobenius lift whenever required. Overconvergent coefficients, rational crystalline coefficients and integral prismatic coefficients are different categories. Local p-adic differential monodromy is a proven analytic theorem; the general geometric weight--monodromy conjecture is not a consequence of its name.

Status: curriculum specification, with established theorem targets and explicitly source-gated extensions. This document does not certify formalized proofs or a complete proof-interior source audit. Each AI proof ticket must replace its source route by an inspected theorem/lemma locator, enumerate intermediate lemmas, search the pinned library, and prove the actual geometric or analytic object has the exported properties. A structure field assuming the conclusion is not completion.

## Stages

### RD.0. Dagger algebras and Robba rings

**Inputs:** `PadicHodgeTheory:P7:annulus-foundations`, `AdicSpacesPartII:F1`.

**Construction and export:** Construct overconvergent power-series algebras as unions over strict radii, their weak completion maps and differential forms. Build bounded and full Robba rings with their radius-indexed norms and topology. Prove the flatness, faithful descent and base-change lemmas actually used later; do not identify an overconvergent algebra with its affinoid completion. Construct compatible Frobenius lifts and explain coordinate-change dependence.

**Acceptance:** An analytic function converging only on the closed unit disc separates completion from overconvergence; a change of annulus radius tests restriction and derivative continuity.

**Source route:** Kedlaya analytic differential-equation foundations; existing P7 early analytic contract and F1 dagger geometry.

### RD.1. Differential modules, radii and Frobenius slopes

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.0`.

**Construction and export:** Define finite projective differential modules and horizontal Frobenius structures over the chosen Robba ring. Construct generic radii, cyclic-vector reductions in their permitted characteristic-zero setting, Frobenius pullback and slope filtrations. Prove existence/uniqueness and descent of the filtration with its coefficient extensions recorded. Differential irregularity and Frobenius slope are distinct invariants; compatibility must be proved before one controls the other.

**Acceptance:** A trivial connection, a rank-one exponential connection and a nonzero-slope Frobenius module distinguish radius, irregularity and slope conventions.

**Source route:** Kedlaya local-monodromy paper and differential-equation lecture/book route; exact lemmas fixed per proof ticket.

### RD.2. Local monodromy with Frobenius

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.1`.

**Construction and export:** Prove the p-adic local monodromy theorem: a differential module with Frobenius structure becomes unipotent after the finite coefficient/Robba extension allowed by the theorem. Construct the resulting filtration and logarithmic solutions, and prove their descent and compatibility rather than merely asserting an eventual form. Export this analytic result to R06.3, which separately proves the p-adic-representation to differential-module bridge and deduces potentially semistable consequences.

**Acceptance:** A unipotent logarithmic extension checks the nilpotent residue; removing Frobenius from the hypotheses must not leave the theorem available.

**Source route:** Kedlaya arXiv:math/0110124; Andre/Mebkhout alternatives require separate source and convention choices.

### RD.3. Overconvergent isocrystals and frames

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.0`, `SchemeAndStackFoundations:SF.0`.

**Construction and export:** Define a frame X inside a compactification inside a smooth formal ambient space, its tube and strict neighborhoods. Construct overconvergent isocrystals as compatible coherent modules with integrable connection/descent, then add Frobenius pullback isomorphisms. Prove independence from embeddings by explicit comparison and descent. Define restriction to convergent isocrystals and state full-faithfulness only in the proven source range; overconvergence at a boundary is real extra data.

**Acceptance:** Two embeddings of affine space must yield canonically equivalent categories; a punctured curve tests the boundary and why ordinary convergence is insufficient.

**Source route:** Berthelot frame construction; Kedlaya coefficient theory. Any full-faithfulness theorem is a separate located leaf.

### RD.4. Rigid cohomology and compact support

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.3`.

**Construction and export:** Construct the overconvergent de Rham complex on frames, derived global sections and compactly supported sections. Prove independence of frames/compactifications, localization triangles, excision and proper/smooth comparison maps with actual functoriality. Establish Frobenius on cohomology by comparing different lifts. Separate geometric construction from finite-dimensionality: a named finite-dimensional output type cannot replace the finiteness proof.

**Acceptance:** Compute affine space and G_m with ordinary versus compact support, including Tate twists; a change of lift of Frobenius must induce the same canonical cohomological operator.

**Source route:** Berthelot constant-coefficient construction; Kedlaya coefficient extension and frame descent.

### RD.5. Finiteness, duality and Kunneth

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.4`.

**Construction and export:** For a separated finite-type scheme over the residue field and an overconvergent F-isocrystal, prove finite-dimensionality of H^i and H_c^i. Develop the relative curve pushforward and relative local-monodromy input used in Kedlaya's proof, then devissage and alterations/descent. For smooth pure dimension d construct the perfect compact-support duality pairing with the dual coefficient and twist; prove Kunneth with the exact smoothness/support conditions. Do not infer finiteness for arbitrary non-Frobenius coefficients.

**Acceptance:** A smooth nonproper curve checks H_c^2, the dual twist and Euler characteristic; tensor products must match the geometric Kunneth map.

**Source route:** Kedlaya arXiv:math/0208027, including corrections in the final version; relative monodromy is an additional construction beyond RD.2.

### RD.6. Trace formula, Fourier transform and p-adic weights

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.5`.

**Construction and export:** Over F_q, construct the rigid Lefschetz trace formula for all finite extensions, normalize q-Frobenius and Tate twists, and define algebraic/iota weights using an embedding of algebraic coefficient eigenvalues into C. Build the p-adic Fourier transform and conductor/radius estimates needed for Kedlaya's Weil II theorem. Prove sharp compact-support weight inequalities for the specified overconvergent F-isocrystals, then smooth-proper purity. Retain algebraicity/all-conjugates restrictions where asserted.

**Acceptance:** The constant coefficient on P^1 gives eigenvalues 1 and q; on G_m distinguish mixed compact-support degrees. An additive-character coefficient checks Fourier normalization.

**Source route:** Kedlaya arXiv:math/0210149; trace formula and Fourier-transform sublemmas require separate source locators.

### RD.7. Crystalline comparison and Weil-factor export

**Inputs:** `PadicDifferentialEquationsAndRigidCohomology:RD.6`, `CrystallineCohomology:CR.3`, `DeligneWeightsAndPurity:DWP.4`, `WeilConjectures:WC.1`.

**Construction and export:** For smooth proper X/F_q, construct rational rigid--crystalline comparison and show compatibility with the f-th iterate of semilinear p-Frobenius when q=p^f. Compare rigid/crystalline and ell-adic zeta expressions for every finite extension; use purity and disjoint absolute values by degree to identify each characteristic polynomial, not merely the alternating product. Export equality in Q[T] and the separately justified integral factors to WC.6. A de Rham comparison over a lift alone does not prove this finite-field Frobenius statement.

**Acceptance:** P^1, an ordinary elliptic curve and a supersingular elliptic curve test the distinction between p-adic slopes and complex weights. Certified point-count algorithms must include precision and integral-reconstruction bounds.

**Source route:** Berthelot rigid--crystalline comparison, Kedlaya p-adic weights, DWP.4 ell-adic purity and WC.1 common trace/zeta expression; no dependency on WC.6.

## Sources and readiness

- **KEDLOCAL:** [Kedlaya, A p-adic local monodromy theorem](https://arxiv.org/abs/math/0110124). Primary abstract inspected; Frobenius slope-filtration/local-monodromy route selected.
- **BERTHELOT:** [Berthelot, Finitude et purete cohomologique en cohomologie rigide](https://perso.univ-rennes1.fr/pierre.berthelot/publis/Finitude.pdf). Introduction excerpt inspected; constant-coefficient frame construction and finiteness route only.
- **KEDFINITE:** [Kedlaya, Finiteness of rigid cohomology with coefficients](https://arxiv.org/abs/math/0208027). Primary abstract inspected: separated finite type, overconvergent F-isocrystals, finite dimensionality, duality and Kunneth; proof interior not audited.
- **KEDWEIL:** [Kedlaya, Fourier transforms and p-adic Weil II](https://arxiv.org/abs/math/0210149). Primary abstract inspected: p-adic Weil II through differential equations and Fourier transforms; proof interior not audited.
- **EXISTING:** Campaign primary source registry. Reuse precise source routes and bounded inspection ledger in cohomology_review.json; existing references do not mean existing proofs.

## Integration and completion

The machine-readable stage graph is in cohomology_extensions.json. Preserve each stage identifier when refining tickets. Construction examples are acceptance obligations, not claims of currently available Lean declarations. `Suggested.lean` records the implementation discipline without introducing axioms or placeholder theorem proofs.
