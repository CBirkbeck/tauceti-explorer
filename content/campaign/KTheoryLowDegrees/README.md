# Explicit K₀: projectives, rank and determinant

Ring, scheme and arithmetic Part II of GrothendieckEulerForms.

## Canonical ownership and interfaces

- This owner constructs ring/projective rank, Picard/determinant and stable-matrix K₁ calculus. Generic categorical K₀ presentations, exact structures and Euler pairings remain upstream.
- Z.5 owns the general regular-curve rank/determinant theorem. EllipticKTheory supplies only its Picard specialization and the elliptic scheme/point comparison. All comparison maps preserve classes, determinants and transfer.

**Campaign dependencies:** [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** Z. **Dependencies:** existing categorical K₀ and module theory; K only for the higher-theory comparison. **References:** K-book I–II; Handbook I.5 §5.2 and II.2.

## Z.1 — Finitely generated projectives and their presentations

Develop the equivalence between finitely generated projective modules and direct summands of finite free modules. Make the complement, splitting maps and idempotent matrix available. Prove the correspondence between idempotent matrices up to stabilised equivalence and projective isomorphism classes. This is a presentation of the actual projective category, not a replacement for it.

Use the existing split/exact K₀ universal property to define ring K₀. Supply object-class induction, equality of classes by stable isomorphism, scalar extension and Morita functoriality. Prove that direct-sum relations suffice because every short exact sequence of projectives with projective quotient splits.

## Z.2 — Rank in the correct generality

For a commutative ring define the rank of a finitely generated projective as a locally constant integer-valued function on `Spec A`. Prove finite image and compatibility with localisation and base change. On a connected spectrum this becomes an integer; on a disconnected spectrum it must not be collapsed to a single rank.

Prove `K₀(F) ≅ Z` for fields and division rings by dimension. Prove the finite-product formula and compute `K₀(F × F) ≅ Z²` as a test of the locally constant rank interface. For local rings prove finite projectives are free, using Nakayama and finite presentation. State the semilocal decomposition only with the appropriate connected-component information.

## Z.3 — Tensor products, exterior powers and determinant

For commutative rings construct the K₀ ring structure by tensor product. Define exterior powers of finite projectives and prove the filtration formula for an extension. Deduce the λ-ring identities on K₀, including their extension from actual modules to virtual classes. Define determinant on a projective of locally constant rank componentwise and compare tensor/determinant operations with the Picard group.

The determinant has an additive-group homomorphism `K₀(A) → Pic(A)` with tensor product as the Picard operation. It is not a ring homomorphism with an invented multiplication on Pic. Define the augmentation/rank kernel and its relation with the γ-filtration. Higher Adams operations belong to S, but their degree-zero normalisation is fixed here.

## Z.4 — Dedekind domains and S-integers

Prove the Steinitz classification: a positive-rank finite projective over a Dedekind domain is isomorphic to a free summand plus an invertible ideal. Prove `I ⊕ J ≅ A ⊕ IJ` in the required form, and identify

\[
 K_0(A)\xrightarrow{(\mathrm{rank},\det)}\mathbb Z\oplus\mathrm{Pic}(A).
\]

Include the zero module separately. Construct the inverse and its independence from ideal representatives. Compare Pic with the existing ideal class group. Specialise to `O_F` and `O_{F,S}`, using the actual localised ring and the quotient of the class group by classes of primes in S.

Compute the induced maps under localisation, extension of number fields and finite-flat restriction of scalars. The transfer of an ideal class requires the determinant/norm formula; it is not just multiplication by the extension degree on every summand.

## Z.5 — Vector bundles and curves

Apply the categorical construction to finite locally free sheaves, consuming the vector-bundle interface specified in INTEGRATION. For a connected regular noetherian curve prove rank and determinant give `K₀(X) ≅ Z ⊕ Pic(X)`. Establish the structure-sheaf and skyscraper-sheaf class formulas through the K/G comparison, so that a divisor class agrees with the line-bundle class.

For an elliptic curve with origin, E proves `Pic(E) ≅ Z ⊕ E(F)` on line-bundle classes over the base field; combine this with rank to obtain `K₀(E) ≅ Z² ⊕ E(F)`. The origin provides the splitting of degree. Do not use the same conclusion for an arbitrary genus-one curve without a rational point.

## Z.6 — Degree-zero comparison and tests

Prove that these definitions and maps agree with `π₀K` from K. In particular, localisation sends a projective class to its localised class and a perfect complex to its Euler class. Compare the Cartan map to G₀ with the existing general Cartan map, rather than defining a second one.

Required tests are fields, `Z`, a product of two fields, a Dedekind domain with a nonprincipal ideal represented by an actual class, and `P¹_F`. Verify `K₀(P¹_F) ≅ Z²` by the projective-bundle construction and by rank/Pic; prove the two bases are related as expected. A rank-only implementation fails the nonprincipal-ideal and elliptic tests.

## Complementary construction layers


**Prefix:** U. **Dependencies:** matrix groups, group colimits, module theory; K and H for comparison. **References:** K-book III §1; Handbook I.5 §5.2; Bass–Milnor–Serre.

## U.1 — Stabilisation and elementary groups

Define `GL(A)` as the filtered colimit of the finite general linear groups with embedding `g ↦ diag(g,1)`. Retain finite representatives and prove equality after a common stabilisation. Construct block sums and the elementary matrices `e_ij(a)` in the actual general linear groups.

Define the stable elementary subgroup E(A). Prove the elementary commutator identities, normality, perfectness and Whitehead's identity `[GL(A),GL(A)] = E(A)`. Rank bounds in finite matrix statements are explicit; the stable theorem must not be incorrectly exported for `SL₂`.

## U.2 — K₁ and its calculus

Define classical K₁ as `GL(A)/E(A)` and compare it with group abelianisation. Prove functoriality for ring homomorphisms, multiplication/block-sum compatibility, stabilisation invariance, and the fact that elementary matrices have trivial class. Define the K₁ class of an automorphism of a finite projective by adding a projective complement and prove independence from the complement.

Prove additivity for an automorphism preserving a projective filtration, and compatibility with direct sums and scalar extension. This interface is needed by transfers, determinants of complexes and Euler products; it is not confined to invertible matrices over a field.

## U.3 — Determinant, units and SK₁

For commutative A construct the stable determinant and its section from `Aˣ`. Define `SK₁(A)` as its kernel and prove the split decomposition as abelian groups. Prove SK₁ vanishing for fields and commutative semilocal rings by explicit elementary reduction. For a division ring use the Dieudonné determinant with target the abelianisation of its multiplicative group, rather than a nonexistent commutative determinant.

The equality `K₁(A)=Aˣ` is not a general commutative-ring simplification rule. In particular, the S-integer case below needs its arithmetic theorem. The scheme group K₁(E) is not the unit group of global functions.

## U.4 — S-integers and the arithmetic theorem

Prove the Bass–Milnor–Serre result needed for `SK₁(O_{F,S})=0`, with F a number field and S finite. Develop stable elementary generation via unimodular rows, Mennicke symbols and the arithmetic norm/congruence arguments in the cited proof. Use class-field-theory inputs with their actual statements where the argument requires them. An arbitrary Dedekind-domain SK₁ vanishing theorem is not an acceptable substitute.

Combine determinant with Dirichlet's S-unit theorem to identify

\[
 K_1(O_{F,S})\cong O_{F,S}^{\times},\qquad
 O_{F,S}^{\times}\cong\mu(F)\oplus\mathbb Z^{r_1+r_2+|S|-1}
\]

where the second decomposition depends on a choice of fundamental units. The first is canonical. Compare finite-field and local-ring specialisations and the unit inclusion into `K₁(F)`.

## U.5 — Relative K₁ and maps

Construct congruence subgroups and relative elementary subgroups for `(A,I)`, and prove the appropriate comparison with the homotopy-fibre definition of relative K₁. Include the beginning of the relative exact sequence and explicitly identify any extra K₂ boundary term. Do not define relative K₁ simply as the kernel of `K₁(A) → K₁(A/I)` and then assert the entire relative sequence.

For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. Prove the projection formula against K₀, and the boundary map from a discrete valuation field's units to `K₀` of its residue field equals the valuation with the chosen convention.

## U.6 — Homotopy comparison and tests

Use H.3 and K.2 to identify `π₁ BGL(A)⁺` with the explicit quotient. Compare the class of a loop represented by a matrix with its quotient class; the comparison must identify determinant and transfer, not merely provide an abstract isomorphism.

Compute K₁ of `Z`, finite fields, `Z[1/p]`, and a product of fields. Check that a triangular matrix has the product of its diagonal units as determinant class; `diag(g,g⁻¹)` has trivial class after stabilisation; and the valuation boundary of a uniformiser is 1. The higher-group comparison and arithmetic SK₁ theorem are separately recorded completion items.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-k0classical"></a>

**KU-k0classical — Projective-module and arithmetic K0.** Readiness checkpoint for original `k0classical`: verify completion and map-level compatibility of [KTheoryLowDegrees:Z.1](README.md), [KTheoryLowDegrees:Z.2](README.md), [KTheoryLowDegrees:Z.3](README.md), [KTheoryLowDegrees:Z.4](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. 

<a id="stage-KU-matrices"></a>

**KU-matrices — Stable matrices and elementary groups.** Readiness checkpoint for original `matrices`: verify completion and map-level compatibility of [KTheoryLowDegrees:U.1](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `existing`. 

<a id="stage-KU-k1classical"></a>

**KU-k1classical — Classical K1 and determinant calculus.** Readiness checkpoint for original `k1classical`: verify completion and map-level compatibility of [KTheoryLowDegrees:U.2](README.md), [KTheoryLowDegrees:U.3](README.md), [KTheoryLowDegrees:U.4](README.md), [KTheoryLowDegrees:U.5](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `matrices`, `existing`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `Z.4` | Construct the determinant norm for finite projective restriction of scalars, including the determinant of the algebra itself; derive the Picard-coordinate transfer rather than degree multiplication on all coordinates. |
| `Z.5` | Build the divisor-to-line-bundle and point-class maps and their exact degree comparison. The Picard computation must use line bundles defined over the base, with the rational-origin descent theorem for elliptic curves. |
| `U.5` | Retain the K2 boundary into relative K1 and prove when relative K1 maps injectively to the absolute group; export the full exact fragment to localization consumers. |

**Producer–consumer handoff.** ArithmeticKTheory N.1 consumes norm-compatible K0/K1 comparisons; EllipticKTheory E.2 consumes the regular-curve theorem and adds the origin-dependent splitting.

**Acceptance.** Use a nonprincipal ideal and a disconnected ring to test determinant and locally constant rank; verify a uniformizer has valuation boundary one.

**Source-readiness boundary.** Resolve the exact Bass–Milnor–Serre arithmetic SK1 source passage and its S-integer scope.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
