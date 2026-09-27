# BP-ColemanPowerSeries: algebraic cyclotomic integers and their quotient

Codex — codex-7e92bd. Issue699; exact fresh claim5857835668 confirmed by bot5857836757.
Whole issue read before and after claiming. Partial checkpoint; every status unchecked.

## Delivered

158 nodes:2 definitions,110 lemmas,20 theorems,9 comparisons,17 constructions.
94 API items (88 on definitions/constructions),121 packet tests (63 on those
objects),123 typed examples,12 planets and203 baseline declarations.
Six gaps,twelve requests,thirteen source findings and zero closed stages remain.

Fifteen new L0 nodes prove the planned algebraic description
integralClosure ℤ_p K_n=ℤ_p[ζ_n−1], construct a native integral power basis and
the root in that ring, identify its minimal polynomial, and construct the
explicit quotient by ζ_n−1 as ZMod p. Denominator clearing is separated from
the Eisenstein cancellation that requires integrality. The reduction kernel
is proved using the native power-basis scalar congruence, not just vanishing
on the generator. Thirteen new typed tests retain the bottom dyadic generator
−2, basis dimension1, quotient cardinality2 and the ternary dimension2.

All143 predecessor nodes,181 baseline objects,13 findings,11 old planets and
all predecessor Lean bytes are preserved. Generic local fields and Eisenstein
ramification remain owned by LocalFieldsRamification. Its third request is
narrowed to the remaining valuation-ring, residue-field and uniformizer
comparison. No topology, localness or DVR structure on the algebraic integral
closure is asserted. No new source finding or independent review verdict.

## Sources, native interfaces and checks

Reviewed AUDIT24 all five layers, accepted RS16 and the owning local-field
finite-extension/integer-ring contracts checked. Binding protocols and the
LocalFieldsRamification/Multiquadratic upstream models have continuous read
provenance, with unchanged input hashes. Published RJW printed161–164/PDF62–65
read freshly; SHA25678d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6.
The algebraic adapters are worker deductions from pinned library statements.
No whole-paper extraction, finite-level series interpolation or ramification
closure claim is made. Twenty-two newly cited indexed native declarations and
their ambient assumptions were read. The function-field-place Eisenstein
criterion was read and rejected as a direct mixed-characteristic supplier.
A bounded GitHub search found no open Mathlib PR with Eisenstein in its title;
this is not an exhaustive absence claim.

Indexed blueprint: zero errors/warnings. Versioned errata check passes with
all findings unchanged. Preservation, full reader/signature/test parity and
scope checks pass. The dependency graph has229 reachable nodes,967 edges,
271 native leaves and no unresolved stage leaf or cycle. Four exact small
shifted cyclotomic polynomials check the p=2,3 and n=0,1 conventions.

The full suggested file compiles with zero errors and332 expected proof-placeholder warnings only. The actual276-node PMIA supplier compiles with zero errors and584 such warnings. The transitive import audit reaches2,844 byte-verified pinned Mathlib modules, three pinned Tau Ceti modules reused from existing artifacts, and one actual supplier. No library was rebuilt. Suggested-file SHA256: `928066a24440b06d68646743ee905c9baabe962294b7e5f4a5ced27f2b5c06ab`.

The actual PMIA supplier remains276 nodes; its existing statements are imported,
not replaced by assumptions. Since the starting base, Dirichlet grew184→190:
all184 prior objects are unchanged. Six new L2 records were screened in full:
tame translation, exact finite masses, field/integral psi eigenrelations,
ambient unit restriction and ordinary unit-moment Euler factor. Their
characteristic-zero finite-cycle hypothesis is explicit; the inverse-weight
and special-value comparisons remain there. They neither alter a consumed
Coleman statement nor introduce a reverse dependency. The other52 binding
input hashes and all four predecessor deliverables were unchanged at the
publication-input check.

One existing checkout and the worker's own branch are used. Existing pinned
native artifacts are reused through scratch links. No Lake project, cache
fetch or library build. Only one Lean process is run by this job at a time.
Scratch evidence retained under the job label coleman-integer-uniformizers:
input/claim/publication records, new-baseline-index.json, new-nodes.json,
append.lean, compile_seed.py and compilation logs/source audit,
verification.json, polynomial-tests.json, dirichlet-input-delta.json and the
four published files under handoff-evidence. The RJW PDF remains in the
previous coleman-residue-image evidence. No repository snapshot is made.

## Resume

- ColemanPowerSeries:L0 (partial): The algebraic cyclotomic tower, signed relative norms, integralClosure ℤ_p K_n=ℤ_p[ζ_n−1], its native integral power basis and the explicit quotient by ζ_n−1 equal to ZMod p now have nodes. Import the general local-field structures, integerRing_eq_integralClosure and Eisenstein uniformizer/total-ramification interfaces, then prove their cyclotomic specializations and identify the algebraic quotient with the canonical residue field. No topology, localness, DVR instance or ramification index on the new integral closure is asserted here. Construct the full and principal norm-compatible unit inverse limits, continuity of transitions, closedness/compactness, G-action, Tate-module inclusion, and the norm-compatible Teichmüller splitting. Prove principal-unit pro-p hypotheses before importing the ℤ_p-module construction; full units are not a ℤ_p-module. Verify completed action hypotheses and source the explicitly unramified/semilocal coefficient extension with Frobenius and norm data. No arbitrary ramified coefficient extension is justified by this checkpoint.
- ColemanPowerSeries:L1 (partial): The integral trace/PMIA bounded-psi comparison, zeroth Frobenius coordinate and embedded root-sum formula are supplied. The determinant/root-product comparison and uniqueness now have exact nodes using the actual PMIA translations and native Tau Ceti evaluation/substitution. Arithmetic norm/evaluation compatibility remains required; general coefficient extensions remain supplier work. The four RJW Lemma10.11 congruences, inverse-coordinate/norm/trace continuity, and the norm-fixed invertible limit with uniform precision and continuity are supplied. Prove the arithmetic norm/evaluation compatibility and the actual finite-level lifts before using this limit in tower interpolation. The series construction does not itself supply an arithmetic interpolation map. Import pinned Weierstrass through PMIA L4 with its nonzero hypothesis; prove interpolation uniqueness, finite-level lifting, compact successive approximation and surjectivity onto the entire norm-compatible tower. Recover Theorems10.2 and10.13, and specify the unramified coefficient/Frobenius variants exactly. The present algebraic basis proof is over ℤ_p only.
- ColemanPowerSeries:L2 (partial): Identify the explicit f_a with the Coleman series of the actual unit tower c(a), proving membership, relative norm compatibility and interpolation; the local algebraic nodes do not construct the tower. The signed-integer and p-adic logarithmic derivative identities are specified. Import the P7 cyclotomic unit-exponent action with its exact coefficient/topology identification. The PMIA inverse-weight-dilation node now supplies the a⁻¹ factor for the existing unit pushforward. Establish the actual tower action, interpolation compatibility, norm-fixed restriction and the measure-action/substitution comparison before combining it with the factor a in the logarithmic derivative. Consume the exact PMIA nodes mahler-derivation-value, amice-phi, psi-series, series-unit-restriction, inverse-weight, inverse-weight-unique, inverse-mahler-intertwining and inverse-mahler-unique. They supply the integral operators and the unique inverse on kerψ; PMIA L0/clopen-restriction, L0/clopen-restriction-section and L0/clopen-support-characterization supply the generic algebraic clopen comparison; L2/intrinsic-unit-restriction, L2/intrinsic-unit-restriction-section and L2/intrinsic-unit-extension-projector identify the actual unit-domain maps and ambient projector. The exact PMIA L0 weak clopen homeomorphism and field-valued strong-topology nodes and L2 unit-measure-kernel-weak-homeomorphism, integral-amice-weak-homeomorphism and unit-measure-amice-weak-homeomorphism now supply these topology comparisons under their stated hypotheses. Only the integral-lattice/operator-norm comparison remains requested from PMIA L0. Dirichlet now supplies exact series-psi-fixed, measure-psi-fixed, unit-smoothed-measure, unit-smoothed-difference, smoothed-numerator and numerator-amice nodes. The ψ-invariance chain now imports the exact generic root-average and rational-descent supplier nodes. Import these nodes; the Coleman normalized-trace and logarithmic-derivative/norm comparisons are now supplied, including the actual continuous map on norm-fixed units. Pseudomeasure normalization and the remaining Coleman composite are still required. Then prove equality of actual measures for raw Col₀ and normalized Col=−Col₀ using the existing Dirichlet denominator and series-cleared-equation. No new measure carrier or Col map is defined in this checkpoint. Establish additivity, continuity, principal-unit ℤ_p-linearity and full G-equivariance of the actual Coleman map. The formal Δ identity supplies the factor a; identify it with the imported cyclotomic action and combine it with the inverse-derivative factor a⁻¹ on the actual measures.
- ColemanPowerSeries:L3 (partial): The characteristic-p coefficient completion, Euler corrections, native infinite product, coefficient precision and pole-free residue decomposition now give the actual residue image theorem. Combined with the preceding compact lifting, normFixedLogDeriv is surjective without a residual image hypothesis; the already stated μ_(p−1) kernel gives Theorem12.9. The actual arithmetic Coleman interpolation and composite, its full G-action, kernel μ_(p−1)×Z_p(1), cyclotomic-moment cokernel and Theorem12.17 for principal units still require source decomposition and topological/algebraic module comparisons. Combine those arithmetic maps with the existing fixed-space five-term sequence. Finite-flat coefficient extension must tensor every term and prove the completed-tensor comparison.
- ColemanPowerSeries:L4 (not_read): Read and decompose RJW §11 and §12.3 through Theorem 12.23 with their cited sources. Import actual global cyclotomic subgroups, finite-conductor real generators and their finite index from IntegralIwasawaTheory:L0. Prove local embeddings, the Teichmüller-adjusted compatible generator, closure equals ℤ_p-span, finite-level generation and the compactness argument for inverse-limit cyclicity. Retain −1 at finite real level where required. Compute the closed cyclotomic tower's Coleman image and U_(∞,1)^+/C_(∞,1)^+ ≃ Λ(G^+)/(I(G^+)ζ_p) for odd p; transport the unit quotient itself under coefficient extension. This is not the Galois main conjecture.
