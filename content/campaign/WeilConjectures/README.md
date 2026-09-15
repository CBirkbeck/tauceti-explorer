# Weil conjectures and cohomological zeta functions

This roadmap completes the finite-field Weil-conjectures route and exposes its
reusable arithmetic consequences. It extends the saved
CohomologicalPointCounting family,
which already owns Frobenius geometry, finite and ℓ-adic realization, the
Grothendieck–Lefschetz trace formula and rationality. Those constructions are
suppliers, not repeated targets here. This is a substantial successor, not a small
amendment to that family.

The user's private `CBirkbeck/WeilConjectures` blueprint and Lean code supply useful
proof decompositions and algebraic lemmas. Their assumptions must be discharged
using actual geometric cohomology; their conditional final theorem is not evidence
that the Weil conjectures have been formalized. See the
private repository audit.

## Mathematical contract and scope

Let k be a finite field, q its cardinality, and p its characteristic. Work with an
actual field k, including nonprime q=p^a; `ZMod q` is not the general finite-field
carrier. For a separated finite-type k-scheme X, define N_r=#X(F_{q^r}) for r≥1
using a chosen degree-r finite extension and prove independence of that choice.
The shared point-counting supplier constructs

\[
Z(X,T)=\prod_{x\in|X|}(1-T^{\deg(x)})^{-1}
       =\exp\left(\sum_{r\ge1}N_rT^r/r\right).
\]

The product is coefficientwise locally finite, not an unexplained analytic infinite
product. Its integral series has constant term one; its rational-function realization
is regular at zero. Functional equations belong in a rational-function/Laurent
setting: substitution T↦1/(q^dT) is not ordinary substitution in a formal power
series at zero.

For X smooth projective and geometrically connected of dimension d, and every
prime ℓ≠p, construct the actual finite-dimensional spaces
H^i=H^i_et(X over an algebraic closure of k,Q_ℓ), with geometric Frobenius F.
The comparison with the scheme-Frobenius pullback used in Deligne's paper is an
explicit supplier theorem. Put P_i(T)=det(1−TF | H^i) and b_i=dim H^i.
The target includes all four classical features, not only rationality:

1. Z(X,T)=∏_{i=0}^{2d}P_i(T)^{(−1)^{i+1}}; each P_i lies in Z[T], has constant
   term one and degree b_i, and is independent of ℓ.
2. The duality functional equation, including its sign and determinant factor.
3. Every reciprocal root α of P_i is an algebraic integer, and every complex
   embedding gives |α|=q^{i/2}. Roots of P_i itself have the inverse absolute value.
4. If X occurs as a fiber of an appropriate smooth proper family with a complex
   fiber, the b_i agree with that fiber's singular Betti numbers by the supplied
   base-change and Artin comparisons. No characteristic-zero lift is assumed to
   exist for every finite-field variety.

Smooth proper nonprojective varieties are a separate extension using the general
weight theorem, not an unnoticed enlargement of the Lefschetz-pencil proof.
Nonproper or singular X retains compact-support rationality and mixed-weight
estimates; it does not acquire the smooth-projective functional equation by fiat.
Disconnected cases retain Frobenius's permutation of geometric components.

## Ownership and construction order

| Supplier | Imported contract |
| --- | --- |
| PR196 FrobeniusGeometry | Finite-field points, Frobenius actions, finite-extension counting and invariance |
| PR196 ConstructibleEtale, EtaleBaseChange, CompactSupport, EllAdicRealization | Actual cohomology, functoriality, finiteness, compact support, compatible finite levels and ℓ-adic realization |
| PR196 TraceFormula | All-power trace identity, determinant/trace formal-series identity and rationality |
| [Étale duality/perverse sheaves](../EtaleDualityAndPerverseSheaves/README.md) | Smooth purity, trace, perfect pairings, Gysin/cycle maps and duality compatibility |
| [Lefschetz pencils/vanishing cycles](../LefschetzPencilsAndVanishingCycles/README.md) | Geometric constructions used to prove purity, not assumptions in the final assembly |
| [Deligne weights and purity](../DeligneWeightsAndPurity/README.md) | DWP.4 smooth-projective all-conjugates purity; DWP.7 general weight bounds and smooth-proper extension |
| PR196 ComplexComparison | Artin comparison and transport in an explicitly specified family |
| Existing AlgebraicCurves, JacobianChallenge and EllipticCurves | Curve genus, Jacobians and the independent elliptic Hasse-bound interface |

The non-RH rationality and duality route precedes Deligne's proof. The final
integrality/ℓ-independence argument using disjoint weights follows purity. Its
conclusion must not be fed backwards into an earlier rationality lemma used to
prove purity. Abstract linear algebra can be implemented first, but there is a
separate geometric-realization obligation for every imported structure.

## Detailed milestones

### WC.0 — Source reconciliation and real geometric inputs

Map the private repository's F008/F009/F010 and B000–B015 packets onto the saved
PR196 owners before assigning implementation work. Audit the actual declarations
in `PointCounting.lean`, `ZetaFunction.lean`, `Abstract/` and `Statement.lean`:
identify which lemmas can be ported and which assumptions are realization debts.
Replace obsolete Mathlib names only after checking the chosen build pin. Preserve
the private snapshot unchanged; proposed ports belong to future implementation.

Specify X→Spec k, geometric base change, the coefficient prime, finite extensions,
the cohomological degree and Frobenius convention in every endpoint. Finite-type
point finiteness is a proved theorem, not a globally assumed Fintype instance on
the wrong point type. Register canonical translations between field-isomorphic
point sets and compatibility with finite-extension towers.

### WC.1 — Zeta arithmetic and finite-extension API

Consume the coefficientwise Euler product and determinant formula. Expose integer
coefficients, normalization at T=0, disjoint-union products, open–closed
factorization and finite-base-extension behavior. Prove the relation
N_r=∑_{m|r}m a_m, where a_m counts degree-m closed points, and the corresponding
Möbius-inversion formula, using shared arithmetic/Möbius APIs.

Recover rationality over Q from the actual integral point-count series and its
cohomological rational realization, with a normalization ensuring uniqueness of
coprime numerator and denominator. Record the Fatou/Gauss and rational-descent
lemmas needed later. If PR196 already provides a lemma, add only the missing
public interface there; do not build a competing zeta definition. None of these
claims requires the full RH theorem or the individual integrality of each P_i.

### WC.2 — Poincaré duality and exact functional equation

Use the actual Frobenius-equivariant pairing
H^i⊗H^{2d−i}→Q_ℓ(−d), with geometric Frobenius acting by q^d on the target.
Derive b_i=b_{2d−i}, invertibility of F, reciprocal eigenvalue pairing and the
polynomial reciprocity identity before passing to the zeta function. Keep degree
and leading-coefficient conventions explicit; no diagonalizability is required.

Let χ=∑_i(−1)^i b_i and Δ=∏_i det(F|H^i)^{(−1)^i}. With negative exponents
interpreted in the coefficient field, prove

\[
 Z(X,1/(q^dT))=(-1)^\chi\,\Delta\,T^\chi Z(X,T),
 \qquad \Delta^2=q^{d\chi}.
\]

Initially this is an identity after scalar extension to Q_ℓ(T). Descend the actual
multiplier to Q using rationality and normalization, then derive the usual
±q^{dχ/2} formulation with a defined sign and the needed parity statement. Do
not write a fractional power in Q without justifying its meaning. Odd middle
degree uses the alternating pairing; in characteristic-zero coefficients this
also controls evenness of its dimension, including at ℓ=2.

### WC.3 — Integral factors, all-conjugates RH and ℓ-independence

Import DWP.4's proved purity, not a `CurveRH` or `PureCohomology` assumption.
Follow Deligne I (1.7)⇒(1.6): begin with a reduced rational presentation of the
integral series; prove distinct cohomological weights prevent cancellation between
the P_i; identify each factor by the absolute values of its roots. Establish
Galois stability over Q and integrality by the normalized rational-function/Gauss
argument. Prove that this characterization is independent of ℓ.

Make the algebraic-number embeddings explicit. A statement for one arbitrary
complex embedding is not the all-conjugates assertion needed for rational descent.
Use multiplicities, not only root sets. Frobenius invertibility proves the
degree equals b_i. Do not infer semisimplicity of arithmetic Frobenius from purity.
The final theorem instantiates all abstract algebra with the constructed étale
realization and closes the earlier realization debts.

### WC.4 — Betti-number comparison in families

For a smooth proper family over a connected base on which ℓ is invertible, use
the lisse higher direct images and proper/smooth base change. Given geometric
points with finite-field and complex fibers and an étale transport path, obtain
the comparison of dimensions with singular cohomology. State which objects depend
on the path and which numerical dimensions do not. Respect stratification when
using compact supports outside the smooth-proper case.

Use existing algebraic/analytic comparison owners rather than constructing a
second analytification. This milestone is a comparison for a supplied family,
not a universal lifting theorem. Include a test where no complex fiber has been
specified: WC.3 must remain valid, while no arbitrary complex variety is assigned
as a comparison object.

### WC.5 — Point-count bounds and curves

For a smooth projective geometrically connected d-dimensional variety, derive
the all-extension estimate

\[
 \left|N_r-(1+q^{dr})\right|
 \leq\sum_{i=1}^{2d-1} b_i q^{ir/2}\quad(r\ge1).
\]

The estimate follows by taking power sums of reciprocal roots and the triangle
inequality. Handle dimension zero separately. In dimension one identify b_1=2g
using the actual curve/Jacobian cohomology supplier, obtaining
|N_r−(q^r+1)|≤2g q^{r/2}. The private prototype's displayed factor 2b_1 is not
the sharp 2g factor and must not be copied as the final contract.

Recover the elliptic Hasse bound as a compatibility theorem with the independent
EllipticCurves route. Prove the recurrence for extension-field counts from P_1,
and distinguish the zeta numerator from the characteristic polynomial of F.
Do not use the elliptic bound alone as a proof for arbitrary-genus curves or
higher-dimensional varieties.

Also retain the converse finite-spectrum lemma from private packet
`009_N_Thm5_1`: a uniform exponential bound on every positive power sum bounds
each reciprocal root's modulus. Prove it using the rational generating function
or a finite-spectrum argument that handles cancellation and multiplicities.
Combine it with duality to recover RH from suitable all-extension point-count
bounds; a single extension-field bound is insufficient.

### WC.5:power-sum-converse — Independent finite-spectrum lemma

This extracted substage owns the all-positive-power-sum converse described in
WC.5. Its inputs are finite multisets of complex numbers and elementary analysis
from FoundationsAndLibraryIntegration LI.1/LI.2. Construct the rational generating
function of the power sums and show that a bound for every positive index rules
out a pole inside the claimed convergence disc. Retain multiplicities and combine
equal roots before identifying poles. No geometric purity theorem is an input.
Test equal-modulus roots whose first several power sums cancel. This producer can
be used by the independent surface proof without importing the RH-based WC.5
point-count endpoint.

### WC.5:surface-alternative — Independent curve bound by intersection theory

Import SchemeAndStackFoundations SF.5 surface Riemann--Roch, adjunction, Hodge
index and intersections on C times C, plus WC.1's finite-extension/Frobenius
dictionary and WC.2's purity-independent duality. Construct the diagonal and graph of each Frobenius power; compute
their self-intersections and intersections with the two fibers. Apply Hodge index
with the precise sign convention to derive the bound for every finite extension.
Then use WC.5:power-sum-converse and duality to recover the curve RH statement.
This alternative construction is not an input to the independent Jacobian route
in DWP.1 or the main Deligne induction. The sources must be inspected and the
intersection calculations proved; the private packet is provenance, not a proof.

### WC.6 — Broader geometry and cohomology interfaces

Use DWP.7 to extend pure cohomology and the assembled smooth-proper conclusions
beyond projective varieties, with the properness and coefficient hypotheses from
the general weight theorem. For separated finite-type X and mixed sheaves use
compact-support weights and the existing sheaf L-function trace formula. Explain
why missing smoothness/properness changes the allowed weights and pairings.

Provide an interface to crystalline Frobenius over finite fields, but distinguish
what is already proved by the current crystalline roadmap from a new comparison
obligation. Equality of ℓ-adic and crystalline Frobenius characteristic polynomials
requires its own source-qualified theorem and construction; it does not follow
by specializing a characteristic-zero p-adic comparison map. No new universal
crystalline/étale equivalence is included as a shortcut. Likewise the finite-field
functional equation makes no assertion about analytic continuation of a global
Hasse–Weil L-function over a number field.

### WC.7 — Worked realizations and final assembly

Verify projective spaces (P_{2i}=1−q^iT, P_{2i+1}=1), finite étale schemes with
nontrivial component permutation, smooth curves, elliptic curves and products
via Künneth. Check the sign for P^2, negative Euler characteristic for genus>1,
and a nonprime field cardinality. Compare the product identity for zeta functions
with the tensor-product action on cohomology rather than multiplying zeta
functions of unrelated factors.

Publish separate rationality, functional-equation, integral-factor/RH,
Betti-comparison and general-weight APIs, followed by their assembled theorem.
Every geometric conclusion must use the actual scheme and cohomology, with no
uninstantiated Weil-cohomology structure and no theorem assumption equal to the
desired RH conclusion. Record source/version and dependency closure for the final
assembly; a passing `Suggested.lean` alone does not meet this gate.

## Sources, available work and review obligations

- Deligne, *La conjecture de Weil I* (1974), especially (1.4)–(1.7), §2 and §§6–7:
  saved PDF,
  [primary publication](https://numdam.org/item/PMIHES_1974__43__273_0/).
- Deligne, *La conjecture de Weil II* (1980), especially the general weight
  theorem and its smooth-proper consequences:
  saved PDF. Exact theorem contracts
  and restrictions are owned by DeligneWeightsAndPurity.
- SGA 4½,
  SGA 4 XVII–XVIII and
  SGA 7 II, downloaded from Deligne's
  IAS archive, support the existing and new geometric suppliers.
- The private repository includes Freitag–Kiehl and further source books/notes.
  Their exact identities, paths and hashes are recorded in the source catalogue.
  Its proof packets are planning evidence to audit against those sources, not
  substitutes for primary proofs or evidence of completed formalization.

The private packet's alternative curve proof through surface Riemann–Roch,
adjunction and Hodge index on C×C has a canonical construction owner:
[SchemeAndStackFoundations SF.5](../SchemeAndStackFoundations/README.md).
WC.5 owns its diagonal/Frobenius-graph application and the all-power-sum converse.
This is a planned alternative proof with explicit dependencies, alongside the
Jacobian/Deligne route. EDC.3's restricted cycle/Gysin interface is not claimed
to supply surface Riemann–Roch or Hodge index by itself.

`Suggested.lean` provides concrete root-factor/point-bound interface seeds on
existing Mathlib carriers. Advanced geometric signatures remain explicit contracts
until their real suppliers exist. Sources and private snapshots are local research
material, not assets for public redistribution. No PR is authorized by this roadmap.

## Completion contracts added on 2026-09-15

**Applies to:** `WC.1`, `WC.2`, `WC.3`, `WC.5`, `WC.6`, `WC.7`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

Turn the inherited alternative surface route into an owned construction: SchemeAndStackFoundations SF.5 supplies surface Riemann–Roch, adjunction, the Hodge index theorem and divisor intersections on C×C. Construct the diagonal and Frobenius-graph intersection numbers, prove positivity/inequalities with their sign convention and deduce the all-extension curve bound. Combine with WC.5's all-positive-power-sum lemma to recover the spectral-radius bound; this is an alternative proof branch, not an input to Deligne's noncircular purity proof.

### Producer–consumer contract

WC.6 imports PadicDifferentialEquationsAndRigidCohomology RD.7 for finite-field crystalline characteristic-polynomial comparison through rational rigid/crystalline trace and purity. Until that proof is complete no p-adic comparison map over a lift supplies it. The standard ℓ≠p Weil endpoint remains independent.

### Acceptance and source route

Retain P^2's functional-equation sign, genus>1 negative Euler characteristic, a finite étale scheme with permuted components, F_4, and two equal-modulus roots whose first power sum cancels.

**Source route:** Weil I 1.4–1.7 and §2; Weil II 3.3; private packet 009_N_Thm5_1 is provenance only; SF.5 and RD.7 own the additional proofs. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
