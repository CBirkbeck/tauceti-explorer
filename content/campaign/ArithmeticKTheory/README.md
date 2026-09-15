# K-theory of number fields and S-integers

Number fields, S-integers, ranks, torsion and certificates.

## Canonical ownership and interfaces

- N.3 finite generation precedes the lattice theorem in BorelRegulators; the rank formula consumes only Borel's stable rational cohomology layer. This milestone split breaks the apparent reciprocal dependency.
- N.7 cyclotomic unit/class-number arguments import IntegralIwasawaTheory's early finite layers; no main conjecture or special-value endpoint is used to certify the independent K₂ examples.

**Campaign dependencies:** [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md), [KTheoryLowDegrees](../KTheoryLowDegrees/README.md), [K2SymbolsBrauer](../K2SymbolsBrauer/README.md), [K3BlochGroups](../K3BlochGroups/README.md), [KTheoryFiniteLocalFields](../KTheoryFiniteLocalFields/README.md), [MotivicEtaleKTheory](../MotivicEtaleKTheory/README.md), [BorelRegulators](../BorelRegulators/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

**Prefix:** N. **Dependencies:** K, Z, U, T, V, L, M; R supplies ranks and regulators. **References:** Handbook I.5 in full, especially §§5.2 and 5.7–5.9; K-book VI; Quillen; Borel; Soulé; Rognes–Weibel.

## N.1 — Arithmetic carriers and degree zero/one

Use the existing number-field, ring-of-integers, prime-ideal and localisation carriers. Let S be a finite set of finite primes; archimedean places are included separately in cohomological notation. Prove independence of a chosen presentation of `O_{F,S}` as a localisation and compatibility with enlarging S.

Import Z and U to obtain `K₀(O_{F,S}) ≅ Z ⊕ Cl(O_{F,S})` and the determinant isomorphism `K₁(O_{F,S}) ≅ O_{F,S}ˣ`. Compare norms and extension of ideals with K-theory transfer and pullback. Keep `K₁(F)=Fˣ` distinct from the finitely generated S-unit group.

## N.2 — Localisation and finite support

Construct the full localisation sequence

\[
\cdots\to\bigoplus_{\mathfrak p\notin S}K_n(k(\mathfrak p))
\to K_n(O_{F,S})\to K_n(F)
\to\bigoplus_{\mathfrak p\notin S}K_{n-1}(k(\mathfrak p))\to\cdots.
\]

Prove finite support for the maps to the direct sum, compatibility with extensions of fields, and the interpretation in degrees 0–2. Derive the tame-kernel exact sequence, the S-unit valuation sequence and the ideal-class-group sequence from this one construction.

Do not infer injectivity of every map `K_n(O_{F,S}) → K_n(F)` from exactness. Prove the particular injectivity/isomorphism theorems using their arithmetic inputs. In particular the odd-degree isomorphism for n≥3 is an additional theorem.

## N.3 — Finiteness and ranks

<a id="stage-N.3:finite-generation"></a>

**Finiteness (N.3:finite-generation).** Prove finite generation of `K_n(O_{F,S})` for every n≥1. Develop the arithmetic-group finiteness and finite-type homotopy input in Quillen's proof, with the relation to stable general linear groups. Obtain finite generation for S-integers using localisation and the finite-field calculation.

<a id="stage-N.3:ranks"></a>

**Rank comparison (N.3:ranks).** Apply R's independent stable cohomology theorem to deduce, for n≥2,

\[
\operatorname{rank} K_n(O_{F,S})=
\begin{cases}
r_1+r_2& n\equiv1\pmod4,\\
r_2& n\equiv3\pmod4,\\
0& n\text{ even}.
\end{cases}
\]

Thus positive even groups of S-integers are finite. The rank of K₁ is the S-unit rank, not the n≡1 formula. The positive even groups of the field itself are generally infinite torsion groups, as N.2 makes visible.

## N.4 — Roots of unity with twists

Define `W_j(F)=H⁰(F,Q/Z(j))` and prove finiteness for positive j, together with its prime-primary decomposition. Compute it from the cyclotomic character and prove restriction/transfer formulas. Write `w_j(F)=|W_j(F)|` only after finiteness.

Compute `w₂(Q)=24`, and establish the general cyclotomic-subfield tests for divisibility by prime powers. Distinguish this invariant from `|μ(F)|`. At 2 retain the exceptional-field and real-embedding distinctions; the description by a single cyclic tower at odd primes does not cover every dyadic case.

## N.5 — Odd groups, including extension data

Prove `K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F)` for j≥2. Establish the integral group structures of Handbook I.5, not merely their ranks or completions. For a totally imaginary field the abstract group is

\[
\mathbb Z^{r_2}\oplus\mathbb Z/w_j(F).
\]

For r₁>0, with n=2j−1≥3, the four classes n modulo 8 give

\[
\begin{array}{c|l}
1&\mathbb Z^{r_1+r_2}\oplus\mathbb Z/w_j(F)\\
3&\mathbb Z^{r_2}\oplus\mathbb Z/(2w_j(F))\oplus(\mathbb Z/2)^{r_1-1}\\
5&\mathbb Z^{r_1+r_2}\oplus\mathbb Z/(w_j(F)/2)\\
7&\mathbb Z^{r_2}\oplus\mathbb Z/w_j(F).
\end{array}
\]

Prove the divisibility needed in the n≡5 row. The direct-sum decompositions need not be natural, but the e-invariant/Chern maps, their kernels and the extension classes used to obtain them must be natural. The proof includes the real 2-primary calculation and is not assembled merely by matching cardinalities.

## N.6 — Even groups and arithmetic cohomology

For each prime ℓ identify the relevant finite cohomological descriptions from M, with the inverse-limit, real-place and exceptional-field corrections. Compute their orders from certified arithmetic cohomology, units, local norm groups and class-group data where the comparison provides this. Retain extension information when a spectral sequence determines only a filtration.

Develop tame and wild kernels as distinct objects, and compare localisation to completions, divisible subgroups of field K-theory and the relevant Selmer/cohomological kernels. Do not assert equality of the wild kernel and divisible subgroup in all exceptional dyadic cases without the extra theorem.

Construct certificate-driven computations: supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound. This is a reusable calculation method, not an oracle defining the group order from a zeta value.

## N.7 — Regular primes and Bernoulli numbers

Use the arithmetic Bernoulli convention `B₁=−1/2`. Prove conversion from the alternative topologists' numbering used in parts of the Handbook. Relate finite cyclotomic character eigenspaces to class groups, Bernoulli numerators and the Kummer regular-prime criterion, using actual character projectors with their denominator restrictions.

As an initial concrete theorem, for an odd regular prime ℓ prove the vanishing of the ℓ-primary part of the tame kernel of `Q(ζ_ℓ)` by Tate's comparison, the cyclotomic class-group result and the local Brauer calculation. Explain why inverting the unique prime above ℓ does not introduce an ℓ-primary residue-field-unit term.

Develop the higher cyclotomic/regular-prime torsion consequences with explicit degree and character indices, using N.5, M and I as needed. Keep theorems conditional on Vandiver or a class-group vanishing statement separate from unconditional results; never make those conditions implicit in the definition of “regular”.

## N.8 — Certified examples

The required first examples are Q, Q(i), and at least one real quadratic field. Compute the first four groups of `Z`; compute `K₂(Z[i])=0` and `K₃(Q(i)) ≅ Z ⊕ Z/24`; demonstrate the S-integer exact sequence for `Z[1/p]`. For Q, verify explicitly that the field's K₂ is infinite while the integral tame kernel has order 2.

For a quadratic field give a certificate for the arithmetic data and tame-kernel presentation before checking Birch–Tate. A group order deduced from B is a valid corollary, but it is labelled as such and cannot serve as the independent test of B.

## Completion

All K-groups of number fields have the general definition; S-integer finiteness, ranks, odd-group structure and even-primary comparison are proved. Low groups have explicit calculations and maps, and arithmetic computations carry certificates. Neither “number-field K-theory” nor “torsion” is restricted silently to odd primes.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-finitegeneration"></a>

**KU-finitegeneration — Arithmetic K-theory finite generation.** Readiness checkpoint for original `finitegeneration`: verify completion and map-level compatibility of [ArithmeticKTheory:N.1](README.md), [ArithmeticKTheory:N.2](README.md), [ArithmeticKTheory:N.3:finite-generation](README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `arithmeticgroups`, `finitefields`, `fundamental`, `k0classical`, `k1classical`. 

<a id="stage-KU-arithmeticstructure"></a>

**KU-arithmeticstructure — Twists, odd groups, even components and regular primes.** Readiness checkpoint for original `arithmeticstructure`: verify completion and map-level compatibility of [ArithmeticKTheory:N.4](README.md), [ArithmeticKTheory:N.5](README.md), [ArithmeticKTheory:N.6](README.md), [ArithmeticKTheory:N.7](README.md), [ArithmeticKTheory:N.8](README.md), [K3BlochGroups:V.5](../K3BlochGroups/README.md), [K3BlochGroups:V.6](../K3BlochGroups/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `etalehigher`, `finitegeneration`, `borelranks`, `tate2`, `blochk3`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `N.3:finite-generation` | Build the finite-type arithmetic-group argument independently of regulator lattices, then deduce S-integer finite generation from finite-field localization. |
| `N.5` | Recover odd-group torsion and extension data primewise, retaining the real-place mod-8 table. Compare the natural localization/Chern maps before selecting any abstract splitting. |
| `N.6` | For a tame-kernel certificate prove the finite presentation maps surjectively, certify the relation kernel with an independent cohomological bound, and keep wild-kernel/dyadic comparisons separate. |

**Producer–consumer handoff.** BorelRegulators R.4 may invoke finite generation only after N.3; SpecialValuesBirchTate B.3 consumes independently certified K2 examples and N.4 twisted roots.

**Acceptance.** For Q and Q(i), test W2 separately from roots of unity. The real quadratic test must establish arithmetic input before comparing its zeta value.

**Source-readiness boundary.** Full arithmetic finiteness and real/dyadic extension proofs remain source-decomposition work.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
