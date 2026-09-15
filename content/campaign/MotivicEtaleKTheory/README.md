# Motivic and étale methods for arithmetic K-theory

Cycle complexes, norm-residue and K-theoretic étale comparisons.

## Canonical ownership and interfaces

- M.1–M.2 import ArithmeticGaloisDuality for compact/continuous coefficients and Poitou–Tate. Scheme small étale sites, f*, Rf*, Rf! and base-change inputs use proposed PR196 ConstructibleEtale/EtaleBaseChange; the full exceptional-adjunction/Verdier-duality package imports [EtaleDualityAndPerverseSheaves](../EtaleDualityAndPerverseSheaves/README.md). PR196 does not by itself supply the complete six-operation formalism, and the separate adic-space theory is not a substitute. This roadmap constructs motivic cycle classes and comparison maps.
- M.8 Selmer complexes and determinants are applications of the same SelmerIwasawaCohomology and PadicMeasuresIwasawaAlgebras APIs; their realizations come from actual Tate/elliptic motives.

**Campaign dependencies:** [SchemeKTheoryOperations](../SchemeKTheoryOperations/README.md), [K2SymbolsBrauer](../K2SymbolsBrauer/README.md), [SelmerIwasawaCohomology](../SelmerIwasawaCohomology/README.md), [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md). The ConstructibleEtale, EtaleBaseChange, and EllAdicRealization suppliers belong to open PR196, not the merged baseline.

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** M. **Dependencies:** H, K, S, T, ProfiniteCohomology and ClassFieldTheory. **Consumers:** L, N, R, D, I, B and ER. **References:** Handbook I.2, II.1, II.4–II.5; K-book VI; Tate, Levine, Suslin, Rost–Voevodsky, Rognes–Weibel.

## M.1 — Coefficient modules and continuous arithmetic cohomology

Import finite/continuous Tate twists and compact coefficient derived limits from [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md), and scheme étale sites/Galois comparison from PR196's ConstructibleEtale and EllAdicRealization suppliers linked above. Construct arithmetic K-theory realization maps into these carriers and prove agreement with finite/discrete cohomology, Kummer localization and transfer. Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z.

## M.2 — Local/global duality and the real places

Import local/global duality, compact support, derived limits and real-place Tate corrections from [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md). Construct exact comparison diagrams for degree-two K-theory and higher étale descent. Keep ordinary, positive and modified cohomology separate, proving each map and checking the actual virtual cohomological-dimension/finite-generation hypotheses.

## M.3 — Tate's degree-two arithmetic theorem

Construct the norm-residue/Chern map of T.7. Prove the local and global field theorem using Tate's arithmetic argument, with global reciprocity, the cohomology of roots of unity and the required limit lemmas. Establish the S-integer comparison when primes dividing the coefficient modulus are inverted.

The required public statements include the symbol formula, its compatibility with norms and residues, and, in the stated arithmetic setting,

\[
 K_2(O_{F,S})/\ell^r\cong
 H^2_{\mathrm{et}}(O_{F,S},\mu_{\ell^r}^{\otimes2}).
\]

The source theorem must be matched to its actual coefficient and S hypotheses; the ring and field formulations are separate declarations. This direct route makes the first arithmetic comparisons available without waiting for the all-degree norm-residue theorem.

## M.4 — Cycle complexes and motivic cohomology

Construct codimension-j cycles meeting all faces properly on the algebraic simplices. Prove the face/degeneracy identities and define Bloch's higher Chow groups. Construct the cubical model used by explicit symbols and regulators and prove comparison with the simplicial model.

Prove the moving lemma, localisation, homotopy invariance, products, flat pullback and proper pushforward. Use the appropriate arithmetic cycle-complex construction over a Dedekind base for S-integers; do not apply a theorem stated only for smooth varieties over a field to `Spec O_F`.

Define motivic cohomology by these cycle complexes and prove the low-weight descriptions: weight zero, units/Picard in weight one, field Milnor K-theory on the diagonal, and the weight-two Bloch/symbol comparison. Define it independently of its anticipated rational K-theory description.

## M.5 — The norm-residue theorem, with its proof dependencies

For a field F and a prime ℓ invertible in F, prove

\[
 K_j^M(F)/\ell^r\cong
 H^j(F,\mu_{\ell^r}^{\otimes j}).
\]

The all-degree proof requires a dedicated sequence of constructions: finite correspondences and their transfer formalism; Nisnevich sheaves with transfers; the effective motivic category and cancellation; motivic cohomology operations and Bocksteins; norm varieties and their degree formulas; the Rost motive and its required splitting properties; the Čech-motive computation for a symbol's splitting variety; and the induction proving the mod-ℓ statement. Each of these is a construction/proof task here, not a field asserting “Bloch–Kato holds”. Develop the required geometric existence/alteration results with their actual characteristic restrictions. Reduction to finitely generated fields and passage to filtered colimits must be proved.

Derive prime-power coefficients by the compatible Bockstein/induction argument, not by tensoring the mod-ℓ theorem. At the residue characteristic use the separate Bloch–Gabber–Kato logarithmic differential statement where L requires it. This is not an instance of the prime-to-characteristic theorem.

### M.5a — Transfers and motivic homotopy prerequisites

Construct finite correspondences, Nisnevich sheaves with transfers, A¹-localization, effective motivic complexes and cancellation, with the exact base-field and coefficient restrictions of the chosen proof. Prove transfer/cycle-complex compatibility and filtered-colimit reductions. This is the first major construction tranche, not bookkeeping following the norm-residue theorem.

### M.5b — Cohomology operations and norm-variety geometry

Construct motivic operations, Bocksteins and their Cartan/instability relations; prove the degree formula and existence of the required norm varieties in the source's characteristic range. Treat ℓ=2 and odd ℓ by their actual geometric arguments, then justify any extension of characteristic or coefficients. A norm variety's defining splitting property is not assumed for an arbitrary smooth projective variety.

### M.5c — Rost motives and the symbol calculation

Construct the norm-variety correspondences/projectors and Rost motive with its splitting and exact triangles. Prove the Čech-motive computation, the reduced-power/degree argument and induction yielding the mod-ℓ norm-residue isomorphism. Export the actual natural map and its compatibility with residues, products and transfers. This tranche depends on M.5a–b; a displayed group isomorphism with no map is insufficient.

### M.5d — Prime powers, positive characteristic and passage to general fields

Prove the compatible Bockstein induction for ℓ^r, filtered-colimit and inseparable/characteristic reductions in their permitted ranges. Keep the residue-characteristic Bloch–Gabber–Kato differential theorem separate. These checkpoints jointly discharge M.5; each is a substantial proof engine, and the entire tranche remains on the critical path of all-degree arithmetic K-comparisons.

A finite implementation can complete M.3 before M.5. The endpoint “all higher arithmetic comparisons” is not complete until the M.5 dependencies used in its proof are discharged.

## M.6 — Motivic spectral sequence and rational weights

Construct a filtered K-theory spectrum, identify its layers with the relevant motivic complexes, and prove the convergent spectral sequence

\[
 E_2^{a,b}=H^{a-b}(X,\mathbb Z(-b))\Longrightarrow K_{-a-b}(X).
\]

Specify the scheme class and convergence range for each formulation. Use the corrected global constructions of Levine/Friedlander–Suslin rather than assuming that the existence of a displayed E₂ page proves a spectral sequence. Compare Adams operations on the filtration, deduce rational degeneration in the proven setting, and obtain

\[
 K_m(X)_{\mathbb Q}^{(j)}\cong H^{2j-m}(X,\mathbb Q(j)).
\]

Identify the cycle-theoretic Chern character with the one constructed in S.7, including product and residue normalisations.

### M.6a — Coniveau/support filtration and layer comparison

Construct the support categories and homotopy-coniveau tower on actual K-theory spectra. Prove moving/excision and identify each associated layer with the relevant cycle complex in the specified smooth scheme setting; construct comparison with the Levine/Friedlander–Suslin global model. The tower is defined independently of the proposed E₂ page.

### M.6b — Exact couples, convergence and operations

Build the exact couple and differential maps; prove boundedness/connectivity and convergence with explicit dimension and degree ranges, including the obstruction to unjustified passage through infinite inverse limits. Compare multiplicative and Adams operations at the filtered-spectrum level. Prove rational degeneration and eigenspace identification only after the layer and convergence theorems. M.6 is the resulting assembly, not a second construction.

## M.7 — Étale K-theory and the comparison range

Construct étale K-theory through descent of finite-coefficient K-theory spectra, and the comparison from ordinary K-theory. Prove the relevant rigidity and étale descent theorems. Deduce Quillen–Lichtenbaum from M.5 and M.6 with an explicit degree range determined by the appropriate cohomological dimension.

For number fields and S-integers extract the degree-specific descriptions needed in N instead of hiding low-degree exceptions inside a general statement. At odd ℓ and j≥2 the expected arithmetic outputs identify K_{2j−1} with H¹ of twist j and K_{2j−2} with H² of twist j after the stated ℓ-adic passage. At 2 with real places, prove the corrected long exact sequences and extension data; these are not obtained by replacing ℓ by 2 in the odd-prime formula.

## M.8 — Regulators and integral structures

Construct étale Chern classes, real Deligne cycle-class maps and the rational regulator from motivic cohomology. Prove compatibility with the higher K-theory Chern character, residues, norms and products. R and ER provide the archimedean analytic identifications; D provides the syntomic comparison.

For arithmetic schemes keep integral motivic groups, their torsion-free lattices, and rational “integral parts” as different objects. The determinant of a lattice regulator needs an integral lattice and chosen comparison of real determinant lines. Tensoring an arbitrary Q-subspace by R does not construct that lattice.

Export the Galois realisations of the Tate and elliptic objects actually constructed, with their Frobenius Euler polynomials. Define norm-compatible families of K-theory/cohomology classes with the precise Euler-factor relations, and prove that the étale regulator carries the former relations to the latter. This is the common interface for Euler-system constructions; it does not assert the existence of every such system.

For the associated Tate and elliptic representations, construct Selmer complexes from explicit local conditions (unramified away from p and the required crystalline/semistable condition at p), their determinant lines and the local/global regulator maps. The p-adic comparison input for those local conditions is assigned to D.2/D.5. These supply the statement infrastructure for the Bloch–Kato Tamagawa-number conjecture in these cases. Keep that conjecture distinct from the norm-residue theorem also historically called Bloch–Kato; M.5 proves the latter, not the former.

## Tests

Recover Kummer theory in weight one, Matsumoto/Tate in weight two, and the finite-field calculation under étale comparison. Check the degree shift `H²(−,Q(2)) ↔ K₂^{(2)}` and `H¹(−,Q(2)) ↔ K₃^{(2)}`. Test real-place corrections using Q at 2. Check every inverse-limit comparison against the Bockstein term before claiming a completed group equals a tensor product.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-continuous"></a>

**KU-continuous — Finite and continuous arithmetic coefficient complexes.** Readiness checkpoint for original `continuous`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.1](README.md), [ArithmeticGaloisDuality:R02.1](../ArithmeticGaloisDuality/README.md), [ArithmeticGaloisDuality:D7](../ArithmeticGaloisDuality/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `spectra`, `existing`. 

<a id="stage-KU-duality"></a>

**KU-duality — Arithmetic duality, compact support and real-place conventions.** Readiness checkpoint for original `duality`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.2](README.md), [ArithmeticGaloisDuality:R02.4](../ArithmeticGaloisDuality/README.md), [ArithmeticGaloisDuality:D7](../ArithmeticGaloisDuality/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `continuous`, `existing`. 

<a id="stage-KU-tate2"></a>

**KU-tate2 — Tate degree-two arithmetic comparison.** Readiness checkpoint for original `tate2`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.3](README.md), [K2SymbolsBrauer:T.7](../K2SymbolsBrauer/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `duality`, `k2classical`, `pluscomparison`. 

<a id="stage-KU-motivic"></a>

**KU-motivic — Higher Chow groups and motivic complexes.** Readiness checkpoint for original `motivic`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `operations`. 

<a id="stage-KU-normresidue"></a>

**KU-normresidue — Full norm-residue proof and its geometric prerequisites.** Readiness checkpoint for original `normresidue`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.5a](README.md), [MotivicEtaleKTheory:M.5b](README.md), [MotivicEtaleKTheory:M.5c](README.md), [MotivicEtaleKTheory:M.5d](README.md), [MotivicEtaleKTheory:M.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `motivic`, `continuous`. 

<a id="stage-KU-motivicspectral"></a>

**KU-motivicspectral — Motivic filtration and spectral sequence.** Readiness checkpoint for original `motivicspectral`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.6a](README.md), [MotivicEtaleKTheory:M.6b](README.md), [MotivicEtaleKTheory:M.6](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `motivic`, `schemek`, `spectra`. 

<a id="stage-KU-etalehigher"></a>

**KU-etalehigher — Higher etale K-theory comparison.** Readiness checkpoint for original `etalehigher`: verify completion and map-level compatibility of [MotivicEtaleKTheory:M.7](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `normresidue`, `motivicspectral`, `rigidity`, `duality`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `M.5a` | Construct the transfer action on the actual cycle complex and prove the base-field comparison before applying cancellation; retain characteristic restrictions and purely inseparable passage separately. |
| `M.6b` | Build the exact-couple differential and convergence proof from the support tower; Adams-weight rational degeneration is a later theorem on that filtered object. |
| `M.7` | State finite coefficient, derived-completed and tensor-product comparisons as separate morphisms. At real dyadic places retain modified cohomology and extension data in the degree-specific arithmetic output. |

**Producer–consumer handoff.** MotivesAndAlgebraicCycles extends motive categories and conjectural standard/Tate/Hodge statements; this owner remains responsible for the norm-residue proof and K-theory comparison.

**Acceptance.** Check H1(Q(2)) corresponds to K3 weight two and H2(Q(2)) to K2 weight two. Include a Bockstein torsion term and real-place dyadic test.

**Source-readiness boundary.** Norm-variety existence, Rost-motive geometry and all-degree descent need primary proof decomposition; the roadmap is a curriculum, not ready proof leaves.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
