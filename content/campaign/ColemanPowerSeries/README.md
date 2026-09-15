# Coleman power series, local units, and cyclotomic-unit quotients

Local units, norm-compatible power series and Coleman exact sequences.

## Canonical ownership and interfaces

- IntegralIwasawaTheory's finite unit/index layer is the supplier; it does not consume this roadmap until its later Iwasawa class-field sequence. This is an acyclic milestone order.
- Keep Col₀ and Col=−Col₀ as distinct maps with a proved sign comparison. Semilocal coefficient extension has explicit norm/Frobenius data and never silently extends an unramified theorem to arbitrary ramification.

**Campaign dependencies:** [PadicMeasuresIwasawaAlgebras](../PadicMeasuresIwasawaAlgebras/README.md), [DirichletPadicLFunctions](../DirichletPadicLFunctions/README.md), [IntegralIwasawaTheory](../IntegralIwasawaTheory/README.md).

The source-label dictionary and audit resolves H/K/Z/U/T/V/S/M/L/N/R/P/D/I/B/E/ER/HB and R01–R16 references below. The shared conventions are part of this specification. Suggested.lean contains non-exhaustive prototypes; the complete targets are here.

## Scope and dependencies

Develop RJW §§9–12, from genuine local cyclotomic fields through the fundamental exact sequence and the local unit/cyclotomic-unit quotient. Depend on R01/R03 and the existing LocalFieldsRamification and ProfiniteProPGroups roadmaps. Global cyclotomic fields and the finite cyclotomic-unit index theorem are provided by R06.L0; this early layer depends only on the pre-existing number-field roadmaps and not on this roadmap. The apparent cross-reference is therefore not a cycle.

Keep G=Gal(Q(mu_{p∞})/Q) distinct from its pro-p factor Gamma and from G^+=G/{±1}. Use n≥1 for the field Q(mu_{p^n}); the Z_p-extension indexing in Appendix A is translated by an explicit theorem.

## L0. Towers and genuine modules

Construct K_n=Q_p(mu_{p^n}), integral rings, primitive compatible roots, uniformizers, degrees, total ramification, residue fields and norm maps. Prove the field-theoretic norm identities, transitivity and continuity. Define norm-compatible units as the actual inverse limit; principal units form its compact Z_p-module. Extend the G-action to a continuous completed-group-ring action via R01.

Do not put a Z_p-module structure on all local units: their prime-to-p torsion remains. Prove U_infty=mu_{p−1}×U_infty,1 for odd p and identify the Tate-module subgroup Z_p(1). Supply coefficient extension and the semilocal version for an unramified coefficient extension. Further ramification has an explicit field and norm operator, not a formal copy of the Q_p theorem.

## L1. The Coleman norm operator

Prove that O[[T]] is finite free over the image of phi in the required cyclotomic situation, with an explicit basis. Define norm by the determinant of multiplication and trace by linear algebra. Only after adjoining p-th roots of unity identify the determinant with the product over T↦xi(1+T)−1. These substitutions are not automorphisms over Z_p before adjoining xi.

Prove integrality of the normalized trace, its identification with psi, norm/trace compatibility with evaluations at xi_{p^n}−1, all four congruences in Lemma 10.11, and continuity in the correct topology. Prove uniqueness of an interpolating unit power series via Weierstrass preparation. Construct it by compactness and norm iteration and prove the group isomorphism

    U_infty ≃ {f∈Z_p[[T]]^× : N(f)=f}.

This is Theorem 10.13, not merely an injective map with interpolation assumed.

## L2. The Coleman map and its sign

Define Delta(f)=∂f/f and the pipeline

    Col_0 = A^−1 ◦ ∂^−1 ◦ (1−phi psi) ◦ Delta ◦ Coleman.

The inverse of ∂ here is defined on psi=0 through multiplication by x^−1 on units; no arbitrary integration constant occurs. For c_n(a)=(xi_{p^n}^a−1)/(xi_{p^n}−1), compute Delta(f_c)=a−1−F_a and hence

    Col_0(c(a)) = −([a]−1) zeta_p.

Define Col=−Col_0 if a positive explicit reciprocity identity is desired, and prove the comparison rather than altering zeta_p. The source's Theorem 10.15 has the opposite sign from its preceding definitions; this change is recorded in CONVENTIONS.md.

Prove additivity, continuity, Z_p-linearity on principal units and G-equivariance. The factors a and a^−1 in the logarithmic derivative and the inverse derivative must cancel explicitly.

## L3. Kernel and cokernel

Prove the logarithmic derivative exact sequence, including the mod-p logarithmic derivative calculation, lifting from mod p and its compactness argument. Prove the exact sequence for 1−phi on psi=1, using the convergent sum of phi iterates and evaluation at T=0.

Identify the full kernel of Col_0 with mu_{p−1}×Z_p(1). Identify its cokernel with Z_p(1), with quotient map the cyclotomic moment. For the sign-adjusted Col the same quotient map still defines an exact sequence, and the identification of the first kernel map is unchanged. The endpoint on principal units is

    0 → Z_p(1) → U_infty,1 → Z_p[[G]] → Z_p(1) → 0.

This display uses RJW's Z_p coefficients. A finite-flat coefficient extension O requires tensoring every term over Z_p (and the two end terms become O(1)); prove flatness/exactness and the completed-tensor comparison before asserting that extension.

Prove exactness as a sequence of topological modules and as ordinary modules, not just as a statement about cardinalities. Recover Theorem 12.17.

## L4. Cyclotomic units and inverse-limit generators

Use the actual global subgroup D_n generated by roots of unity and cyclotomic differences, intersected with units. Prove the real generators gamma_{n,a}, all identities in §12.3, and the passage from a finitely generated integer subgroup of principal units to its Z_p-span as its closure. Correct the real-unit generator statement by retaining −1 at finite level where required; prime-to-p torsion disappears only on taking principal p-adic parts.

Construct the principal Teichmuller-adjusted compatible generator w gamma_{n,a}. Prove its membership, norm compatibility, finite-level spanning and the **inverse-limit** cyclicity theorem. A family of cyclic finite-level modules is not automatically cyclic on inverse limits with an arbitrary chosen generator: establish the compatible generator and surjectivity by compactness/finite-level compatibility.

Compute the image of the closed cyclotomic tower under Col using continuity and the completed action. Conclude Theorem 12.23, including

    U_infty,1^+ / C_infty,1^+ ≃ Z_p[[G^+]] / (I(G^+) zeta_p).

The O-coefficient version tensors the unit quotient as well as the Iwasawa algebra; an unchanged Z_p-unit module cannot be identified with an O-module quotient by merely changing the middle coefficient ring.

This theorem is about local units. Naming it `iwasawa_theorem` does not make it the Galois-theoretic main conjecture of §13.

**Acceptance:** Theorems 10.2/10.13/10.15 (with recorded sign comparison), 11.9, 12.9/12.17/12.23; every equivariance and closure comparison; reproduction of the finite-level cyclotomic generators inside actual number fields.

## Shared conventions and sources

The programme conventions, dependency contracts, and source register are part of this specification. References such as RJW, Rubin, SU, and FW denote the precise sources and versions listed there. The mathematical milestones above, not a source-code inventory, define completion.

## Public API and review contract

Every construction supplies extensionality, constructor/eliminator lemmas, identity/composition, equivalence invariance and scalar-extension or base-change compatibility wherever defined. Quotients have universal properties and map-level comparison theorems. Finiteness, flatness, admissibility, convergence, perfectness and integral-lattice hypotheses are stated and proved in each unconditional application.

A completed target includes the intrinsic construction, its working API, the stated comparisons and the worked tests above. Matching abstract groups with different maps, rational substitutes for integral statements, or an expected equality stored in an unconstrained structure do not discharge the contract. Check current Mathlib/Tau Ceti APIs before selecting names. Suggested signatures involving unavailable higher objects remain explicit comments; no stand-in theorem asserts their conclusions.

## Sources and evidence

The source register and machine-readable references fix source versions and download checks. Source theorem numbers refer to those versions. A bibliographic citation does not claim the result is formalized.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `L1` | Prove the finite-free φ-coordinate basis and trace divisibility before defining integral ψ. Construct the interpolating series through compatible finite-level norms and compactness. |
| `L2` | Compare the raw logarithmic-derivative map Col0 with Col=−Col0 on a nontrivial smoothed unit and prove the resulting measure equality, not only equality of generated ideals. |
| `L3` | Transport all four exact-sequence terms through finite-flat coefficient extension; distinguish full-unit torsion, principal units and the O(1) endpoint lattices. |

**Producer–consumer handoff.** IntegralIwasawaTheory L1 uses the same closed global/cyclotomic unit subgroups; PadicHodgeRegulators L3 must match the Tate-twist and sign of this rank-one map.

**Acceptance.** Check a smoothing parameter other than −1, a finite-layer generator and the cyclotomic-moment cokernel. Do not replace closure by algebraic span.

**Source-readiness boundary.** The sign comparison should be rederived from the displayed RJW definitions during proof transcription.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
