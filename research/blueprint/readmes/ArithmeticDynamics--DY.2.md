# Arithmetic dynamics: local Julia sets and canonical measures

This is the DY.2 follow-up to the [accepted parent plan](../packets/ArithmeticDynamics.json).
The parent’s 55 local declarations own the escape rate, local height, cycle multiplier,
reduction and canonical measures. This document completes the target-level planning pass
for their Fatou–Julia remainder and supplies source-level refinements of the complex
measure and Zieve endpoints. It adds 31 targets; it does not replace those 55 declarations.
DY.2 is **planned**. Five supplier extensions and the explicit repelling-density proof
gap prevent **closed** coverage. Every implementation status is unchecked.

The main conclusions are equality of canonical-measure support with the Julia set at
both kinds of places, and the sharp distinction between classical and Berkovich stability
at good reduction. The complex measure is also the unique invariant probability of entropy
log d. Zieve’s period bound now has a public proof reference and a concrete jet-growth
route; its odd-prime algebra preparation step is recorded precisely as a supplier gap.

## Conventions and existing objects

Over C the carrier is the Riemann sphere, topologically `OnePoint C`, with the unique
compatible compact uniformity. Mathlib’s `OnePoint.equivProjectivization` identifies its
point set with projective coordinates; it does not supply its complex charts. The current
BelyiMaps document §8.1 specifies those charts and the meromorphic comparison under its
successor owner BelyiAnalyticCovers. Its old chart instances are commented out. We import
that specification and FuchsianOrbifolds Layer 5 finite holomorphic degree theory; we
construct neither a second sphere nor a second branched-cover degree API.

For the nonarchimedean case K is complete, algebraically closed and nontrivially valued.
The carrier P¹,an_K is TB.0’s multiplicative-seminorm analytic line, compact Hausdorff with
the weak/Gelfand topology. Classical points embed as type I; ζ_G is type II. The classical
line has its chordal metric topology. The hyperbolic tree’s strong metric topology is a
third topology. No one-point compactification of K represents the Berkovich line, and no
countable-basis or metrizability hypothesis is imposed on its weak topology.

Unless stated otherwise f has algebraic degree d≥2. A pullback counts local degrees,
including inseparable multiplicity. Separable degree, the number of distinct points in a
generic fibre, is different from d. The exceptional set E always means the classical set
of finite backward orbits; the finite-grand-orbit predicate on the entire analytic line
is mentioned separately. Pure Frobenius in characteristic p has infinite classical E.

The existing measures use the following signs and normalizations:

- Nonarchimedean: μ_f=Δĝ_F+δ_G and Δlog⁺|T|=δ_G−δ∞; equivalently
  Δλ̂_F=μ_f−δ∞. This is the sign opposite Baker–Rumely’s Laplacian.
- Complex: μ_f=Δg_F+ω, where ω is normalized angular probability on the unit circle;
  Δlog|z|=δ_0 on C and Δlog⁺|z|=ω−δ∞ on the sphere. Thus on C the normalized
  Laplacian is (1/2π) times the Euclidean Laplacian.
- Both: f*μ_f=dμ_f and f_*μ_f=μ_f. Continuous potentials exclude type-I atoms;
  they do not exclude a Gauss atom. The sphere measure-Laplacian is defined on differences
  of subharmonic potentials with Riesz measures, not arbitrary continuous functions.
- Native `MeasureTheory.Measure.support` is used throughout, and native
  `Dynamics.coverEntropy` supplies topological entropy. Kolmogorov–Sinai entropy is the
  separate generic supplier contract described below.

## Ownership, dependency order and completion checks

| Route | Existing owner or target | New output |
| --- | --- | --- |
| Classical stability | DY.0 rational maps, DY.2 local expansions; native equicontinuity | Local Fatou/Julia predicates, multiplier tests, good reduction and inseparability |
| Analytic stability | TB.0 carrier and TB.1 discs, annuli and rational-map geometry | Classical trace, Gauss Julia set, finite-grand-orbit rigidity |
| Nonarchimedean support | Parent DY.2 measure, invariance and singleton atomlessness | Preimage convergence → support containment → blowing up → support equality |
| Complex support | Native sphere specification, finite holomorphic degree, spherical Montel, Banach splitting | Transfer limit → identification with the parent measure → Julia support |
| Complex entropy | Native topological entropy; PM.4 Birkhoff plus the proposed generic entropy extension | Entropy log d and uniqueness among all invariant probabilities |
| Sharp periods | Parent residue-period/multiplier factorization; Zieve’s public thesis | Weighted coefficients → jet growth → rational-cycle adapter |

The nonarchimedean proof deliberately establishes Gauss Julia directly. For separable
degree greater than one, a stable neighborhood omits a nonexceptional point, so its
normalized preimage measures vanish there; convergence gives μ_f(U)=0. For pure
Frobenius, good reduction and the direct Gauss argument handle the infinite E. Radon
regularity gives nonempty conull support. Pullback balance makes it backward invariant,
and blowing up gives the reverse support inclusion. This order avoids using an unread
Fatou-component classification merely to assert nonemptiness.

For the complex transfer proof, first work on compact backward-invariant L disjoint from
E, not on all continuous functions with a claim of equicontinuity at exceptional points.
The exceptional attracting cycles supply forward-invariant small neighborhoods, so every
compact K disjoint from E sits in such an L. The explicitly requested complex Banach almost-periodic splitting yields a
functional on C(L); its limit evaluated at a common Julia point identifies the measures
for different L. Native Riesz–Markov represents the functional. Taking L=J identifies its support with Julia. The sphere Laplacian
supplier then constructs the already-owned parent measure; balance and dominated
convergence identify it with this transfer measure.

Topological entropy uses the polynomial-times-d^n Bowen-net estimate and the generic
conditional-fibre entropy lower bound. The full measure-entropy endpoint combines that
lower bound with the resulting upper bound; there is no cyclic dependence on that
endpoint. Uniqueness among invariant probabilities is a separate theorem from uniqueness
among balanced probabilities, and requires Lyubich’s positive-set entropy argument.

**Check — two places for the same map.** For z↦z^d over C, the escaping and attracting
regions are |z|>1 (including infinity) and |z|<1. A radial perturbation of a unit-circle
point separates under iteration, so J is the unit circle. The normalized Laplacian of
log⁺|z| gives mass one there. Over K all iterates have good reduction, so the classical
Julia set is empty, while the Gauss point is the entire Berkovich Julia set and carries
mass one. For d=p^r in characteristic p, E is P¹(overline(F_p)); the infinite-omission
definition still puts Gauss in Julia. These cases jointly detect a wrong carrier,
a missing inseparability qualification, and a wrong 2π normalization.

**Check — the period exponent.** Normalize v(π)=1 and e_K=v(p). The jet variable C_1
is the valuation of the coefficient of H^(p^j)−X, hence of derivative minus one, not
of the derivative itself. For p=2 the two bounds in the jet-growth target below double
the constant and linear jets until they exceed e_K; then the term 2c_0 has uniquely least
valuation, so it cannot cancel. Over Q_p the result forbids a positive p-power exponent
for p≥5 and bounds it by one for p=2,3. Zieve’s 3-cycle (0,3,6) for
3+(5X−X²)/2 over Z_3 rules out replacing the odd-prime factor 2e_K by e_K.

## Definitions and reusable API

The three definition targets below expose both their generic light predicates and the
actual rational/analytic specialization. Their API serves the recorded source uses,
and each has four discriminating tests.


### Exceptional points

Target `ArithmeticDynamics:DY.2/exceptional-points` (definition).

For a self-map f of X, backwardOrbit(f,a)={x : ∃n≥0, f^n(x)=a} and exceptionalSet(f)={a : backwardOrbit(f,a) is finite}. The n=0 term contains a. For a surjective finite-fibre rational map of degree ≥2 this agrees with finite grand orbit; finiteness of a single fibre does not define exceptional. On the Berkovich line distinguish the classical exceptional set from the set computed on the full analytic carrier.

Uses:

- Benedetto Proposition 6.24(a), p.69: Blowing-up statements omit classical exceptional points.

- FRL Theorem A, pp.2–4 and §3.2, pp.22–25: The pullback convergence hypothesis is zero measure on the classical exceptional set.



Construction or proof:

1. Use native Nat.iterate and Set.Finite; expose the union of iterated preimages.

2. For rational maps, finite backward orbit is mapped onto itself; hence it is a finite union of cycles and includes its forward orbit. This proves equivalence with the source’s grand-orbit convention.



Direct prerequisites: `mathlib:Nat.iterate`, `ArithmeticDynamics:DY.0/rational-map-action-on-points`.

Sources: Benedetto2010, Definition 1.10 and Theorem 1.11, pp.6–7. Finite grand orbits define exceptional points; the rational-map setting identifies them with finite backward orbits. FRLergodicv3, Definition 2.7, p.14. Uses finite backward orbit, with a separate pure-inseparable alternative.

Named API:

- `mem_backwardOrbit` (characterisation): x∈backwardOrbit f a iff some n≥0 has f^n(x)=a.

- `self_mem_backwardOrbit` (simp): a∈backwardOrbit f a.

- `mem_exceptionalSet` (characterisation): a∈exceptionalSet f iff backwardOrbit f a is finite.

- `backwardOrbit_conjugate` (functoriality): For an equivalence h and g=h∘f∘h⁻¹, backwardOrbit g (h a)=h(backwardOrbit f a); exceptional sets transform by h.

- `exceptional_iff_finite_grandOrbit` (compatibility): For a surjective self-map (in particular a nonconstant rational map), finite backward orbit iff finite grand orbit {x:∃m,n≥0, f^m(x)=f^n(a)}. Surjectivity forces the finite backward set to be permuted.

- `exceptional_iterate` (relation): For any finite-fibre self-map and m≥1, exceptionalSet(f^m)=exceptionalSet(f). Rational maps have finite fibres; arbitrary self-maps need not satisfy this law.



Unit tests:

- `Exceptional.identity` (degenerate): For id on any X, E=id’s entire carrier; each backward orbit is a singleton.

- `Exceptional.integerTranslation` (non-example): For f(n)=n+1 on Z, E=∅ because each backward orbit contains a−k for every k≥0.

- `Exceptional.powerSphere` (value): For z↦z^d on P¹(C), d≥2, E={0,∞}; on affine C the same self-map has E={0}.

- `Exceptional.frobenius` (comparison): On P¹(K), K algebraically closed of characteristic p>0 and r≥1, z↦z^(p^r) has E=P¹(overline(F_p)), an infinite set.



Check: Do not remove n=0 or confuse degree with the cardinality of a fibre.

### Classical Fatou and Julia sets

Target `ArithmeticDynamics:DY.2/classical-fatou-julia` (definition).

On a uniform space X define classicalFatou f={x : ∃open U containing x, UniformEquicontinuousOn (n↦f^n) U}; classicalJulia f is its complement. For P¹(C), use the unique uniformity compatible with the compact sphere topology, equivalently its chordal metric. For P¹(K) nonarchimedean, use the chordal metric topology, not the one-point compactification topology on K. On C the local condition agrees with normality of meromorphic iterates for uniform convergence on compact subsets in the spherical target metric.

Hypotheses:

- The abstract predicate uses only a self-map and a uniform space. Rational-map conclusions assume degree ≥2 and the indicated valued field.

Uses:

- Benedetto Propositions 4.22–4.24, pp.39–40: Distinguishes good reduction, inseparability and multiplier behavior in the classical line.
- Lyubich Theorem 1, pp.358–362: Identifies the support of the transfer-limit measure with the irregular set.

Construction or proof:

1. Use the native UniformEquicontinuousOn predicate on the whole neighborhood, rather than EquicontinuousAt at its center.
2. Shrink to relatively compact neighborhoods on the complex sphere. Native Arzelà–Ascoli compares compact-open relative compactness of continuous maps with local uniform equicontinuity. The sphere charts and meromorphic-limit comparison in the normal-family supplier identify these limits with holomorphic sphere maps, including constant infinity; a set equivalence alone supplies none of this analytic structure.

Direct prerequisites: `mathlib:UniformEquicontinuousOn`, `mathlib:Nat.iterate`, `mathlib:uniformSpaceOfCompactR1`, `mathlib:OnePoint.equivProjectivization`, `mathlib:BoundedContinuousFunction.arzela_ascoli₁`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`, `ConformalMappingPartII:V0`.

Sources: Benedetto2010, Definition 4.16 and Remark 4.20, pp.36,38. Defines local uniform equicontinuity and explains why normality is an equivalent complex definition but can fail over non-locally-compact fields. Lyubich1983, §3, pp.354–355. Normality of meromorphic iterates defines the complex regular set.

Named API:

- `mem_classicalFatou` (characterisation): Membership is the displayed open-neighborhood UniformEquicontinuousOn condition.
- `classicalJulia_eq_compl` (simp): classicalJulia f=(classicalFatou f)ᶜ.
- `isOpen_classicalFatou` (structure): classicalFatou f is open for every self-map.
- `isClosed_classicalJulia` (structure): classicalJulia f is closed for every self-map.
- `classicalFatou_uniformConjugate` (functoriality): For a uniform equivalence h, Fatou(h∘f∘h⁻¹)=h(Fatou f), and likewise Julia.
- `classicalFatou_complex_normal` (compatibility): On P¹(C), membership iff iterates are normal on some neighborhood in the compact-open spherical topology. This needs the complex analytic supplier, not only a set equivalence.

Unit tests:

- `ClassicalFatou.identity` (degenerate): On any uniform space the identity has Fatou=X and Julia=∅.
- `ClassicalFatou.constant` (value): Any constant self-map has Fatou=X: the n=0 identity and constant positive iterates form an equicontinuous family.
- `ClassicalJulia.realDoubling` (non-example): For f(x)=2x on Euclidean R, Julia=R, including 0; fixing the center does not make the family locally uniformly equicontinuous.
- `ClassicalJulia.complexPower` (comparison): For z↦z^d on the complex sphere, Julia={z∈C:|z|=1}, and infinity lies in Fatou.

Checks:

- Euclidean equicontinuity on affine C alone is not the sphere predicate.
- A pointwise condition without a neighborhood is rejected.

### Berkovich Fatou and Julia sets

Target `ArithmeticDynamics:DY.2/berkovich-fatou-julia` (definition).

For a topological self-map f on X put forwardSaturation(f,U)=⋃_{n≥0} f^n(U). A dynamically stable open set U has infinite complement XorwardSaturation(f,U). The omission Fatou set is the union of such U and the omission Julia set is its complement. On the weak/Gelfand topology of P¹,an_K these are F_Ber and J_Ber. Define on the actual seminorm carrier from TB.0; the strong tree metric and the classical chordal topology are distinct topologies. Do not define stability by omitting only two points or even three points in arbitrary characteristic.

Hypotheses: K is complete, algebraically closed and nontrivially nonarchimedean for the Berkovich specialization.

Uses:

- DKY §2.4, p.9: The local canonical measure has support the Berkovich Julia set.

- Benedetto Propositions 6.23–6.24 and Corollary 6.25, pp.68–69: Good reduction, blowing up and singleton/perfect dichotomy use dynamically stable neighborhoods.



Construction or proof:

1. The generic predicates are real-bodied Set predicates over an existing topological carrier.

2. Apply them to the native projective analytic line and rational-map analytification supplied by TB.0; keep the classical embedding and Gauss point visible.



Direct prerequisites: `mathlib:Nat.iterate`, `TropicalAndBerkovichArithmetic:TB.0`.

Sources: Benedetto2010, Definition 6.14, p.63. Uses infinitely many omitted points for the Berkovich definition. FRLergodicv3, Definitions 2.7–2.8, pp.14–15. Explains the exceptional-set qualification, especially for inseparable maps.

Named API:

- `mem_forwardSaturation` (characterisation): y∈forwardSaturation f U iff ∃n≥0, ∃x∈U, f^n(x)=y.

- `subset_forwardSaturation` (simp): U⊆forwardSaturation f U, including the n=0 term.

- `forwardSaturation_mono` (relation): U⊆V implies forwardSaturation f U⊆forwardSaturation f V.

- `mem_omissionFatou` (characterisation): x∈F iff an open U containing x has infinite omitted complement.

- `omissionJulia_eq_compl` (simp): J=Fᶜ.

- `isOpen_omissionFatou` (structure): F is open, hence J is closed, for every topological self-map.

- `omissionFatou_homeomorph` (functoriality): For a homeomorphism h and g=h∘f∘h⁻¹, F(g)=h(F(f)), and likewise J.

- `berkovichJulia_carrier` (compatibility): The Berkovich predicate is the omission predicate on TB.0’s weak-topology carrier, not on OnePoint K or the strong-metric line.



Unit tests:

- `OmissionFatou.finiteCarrier` (degenerate): On any finite topological X, omission Fatou=∅ for every f, including id.

- `OmissionFatou.realIdentity` (value): For id on R, omission Fatou=R: each point has an open bounded interval with infinite complement.

- `OmissionFatou.integerTranslation` (non-example): For n↦n+1 on discrete Z, omission Fatou=Z: the forward orbit of a singleton omits the infinite lower ray.

- `BerkovichJulia.goodReduction` (comparison): For z↦z² over K, classical Julia=∅ but Berkovich Julia={ζ_G}; ζ_G is a nonclassical type-II point.



Check: Identity on a finite discrete carrier has empty omission Fatou set although its classical equicontinuity Fatou set is the whole carrier. Use arbitrary open neighborhoods, not only classical discs.

## Classical local dynamics

### Classical exceptional-set dichotomy

Target `ArithmeticDynamics:DY.2/exceptional-classification` (theorem).

Over an algebraically closed field, a degree-d≥2 rational map has either at most two classical exceptional points, or characteristic p>0 and a PGL₂ conjugacy to z↦z^(p^r) for r≥1. In the latter case E is the conjugate of P¹(overline(F_p)) and is countably infinite. In particular E is Borel and countable for every valued field here; in characteristic zero it has at most two points. Every degree-at-least-two map of separable degree one belongs to the Frobenius alternative.

Hypotheses:

- Algebraically closed field; the absolute value is irrelevant to classification.

Construction or proof:

1. Surjectivity permutes every finite backward orbit. If there are three exceptional points, a common iterate fixes all three and each has a singleton inverse fibre. Normalize them to 0,1,∞. Factorization of the zero and pole forms makes that iterate z↦z^D; its singleton fibre above 1 forces z^D−1=(z−1)^D, so D is a power of the characteristic.
2. Write f as a separable rational map composed with a Frobenius power. Separable degrees multiply under composition, so the preceding iterate forces separable degree one. A degree-d map of separable degree one has d+1 distinct fixed points: its local derivative is zero, so each fixed-point equation has a simple zero. Normalize three fixed points to 0,1,∞. In these coordinates f=M∘Frobenius^r and M fixes 0,1,∞, hence M is the identity.
3. For Frobenius, a finite backward orbit is equivalent to algebraicity over the finite prime field. Transport by conjugacy. If the three-point alternative fails there are at most two exceptional points. No characteristic-zero critical-point theorem is used.

Direct prerequisites: `ArithmeticDynamics:DY.2/exceptional-points`, `ArithmeticDynamics:DY.0/binary-form-factorisation`, `ArithmeticDynamics:DY.0/homogeneous-lift-comp`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`, `ArithmeticDynamics:DY.0/fixed-points-of-a-rational-map`.

Sources: Benedetto2010, Theorem 1.11(a), pp.6–7. Classifies the case with more than two exceptional points. FRLergodicv3, Definition 2.7 and ensuing classification, p.14. Separates topological degree from total degree and describes the infinite Frobenius exceptional set.

Checks:

- The bound |E|≤2 is never asserted without excluding the pure Frobenius case.

### Classical invariance laws

Target `ArithmeticDynamics:DY.2/classical-fatou-julia-properties` (theorem).

For a nonconstant rational map on P¹(C) or P¹(K) with the corresponding chordal uniformity, F and J are open/closed complements, completely invariant: f⁻¹F=f(F)=F and f⁻¹J=f(J)=J. They are unchanged by replacing f with f^m, m≥1, and are transported by PGL₂ conjugacy. These rational-map assertions are not universal laws for arbitrary topological self-maps.

Hypotheses: Either the complex sphere case, or the complete algebraically closed nontrivially nonarchimedean chordal case; f is nonconstant in that case.

Construction or proof:

1. Openness follows from the local definition. For backward invariance restrict to inverse neighborhoods; for forward invariance use openness of the finite holomorphic/rational map and its local normal form.

2. For iterate invariance write each exponent as mn+i; the finitely many rational maps f^i have uniform Lipschitz bounds in chordal metrics.

3. PGL₂ maps and inverses have finite chordal Lipschitz constants, so they transport the local uniform condition.



Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `TropicalAndBerkovichArithmetic:TB.1`, `ArithmeticDynamics:DY.0/conjugacy-of-rational-maps`.

Sources: Benedetto2010, Proposition 4.21, pp.38–39. Proves the nonarchimedean invariance and conjugacy laws together. Lyubich1983, §3, pp.354–355. Uses the corresponding complex normal-family invariances.

Check: The complex and nonarchimedean cases have separate field assumptions, not simultaneous hypotheses.

### Disc criterion for classical stability

Target `ArithmeticDynamics:DY.2/nonarchimedean-disc-criterion` (theorem).

For a family G of rational functions on P¹(K), local chordal uniform equicontinuity at x is equivalent to the existence of a projective disc D containing x such that, for every g∈G, g(D) lies in one residue class. For the family of iterates, x∈F_I iff some sufficiently small disc has this property. Equivalently there is a disc whose forward saturation omits an infinite set of classical points.

Hypotheses:

- K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Normalize a target residue class. The pole-free rational expansion and ultrametric coefficient bound give a common chordal Lipschitz constant on a smaller disc. Conversely a common small chordal image bound places each image in the residue class of its center (Lemmas 4.18–4.19).
2. For the converse omitted-value criterion, move two omitted values to a finite point and infinity. Disc images of pole-free expansions are discs; an omitted finite value gives the common Lipschitz bound of Theorem 4.27 and Corollary 4.28. Infinite omission in particular provides two distinct values.
3. For a stable disc D, no returned image can strictly contain D: the coefficient giving strict expansion would force some further returned image to leave its residue class (Lemma 4.30). If D never meets a positive iterate, shrink to D′⊊D and the saturation omits D∖D′. Otherwise some return image is contained in D, and all forward images lie in finitely many residue classes; a different residue class is omitted. Both complements are uncountable (Theorem 4.29).

Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: Benedetto2010, Lemmas 4.18–4.19, pp.37–38; Theorem 4.29, pp.41–42. Relates equicontinuity, residue-disc images and infinite omitted sets.

Checks:

- Disc images and coefficient estimates use nonarchimedean analysis; do not import complex Montel for this proof.

### Periodic points and multipliers

Target `ArithmeticDynamics:DY.2/nonarchimedean-periodic-dichotomy` (theorem).

A classical periodic point a of f over K is in J_I iff its cycle multiplier λ satisfies |λ|>1; it is in F_I iff |λ|≤1. This includes indifferent points. Through the type-I embedding the same alternatives locate a in J_Ber or F_Ber.

Hypotheses:

- K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Replace f by the return iterate and move a to 0. If |λ|≤1 choose a small invariant disc using the convergent local expansion. Iterates are uniformly Lipschitz there.
2. If |λ|>1, every punctured sufficiently small disc is eventually expanded outside itself; take initial points arbitrarily close to a to contradict local uniform equicontinuity.
3. The Berkovich statement uses the classical-trace comparison, not a multiplier definition on nonclassical points.

Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.2/nonarchimedean-disc-criterion`, `ArithmeticDynamics:DY.2/berkovich-classical-trace`, `ArithmeticDynamics:DY.2/multiplier-of-a-periodic-cycle`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: Benedetto2010, Proposition 4.24, pp.39–40. Proves both alternatives by invariant and expanding discs.

Checks:

- Over C an indifferent periodic point need not be Fatou; this endpoint is restricted to the nonarchimedean field.

### Empty classical Julia set at good reduction

Target `ArithmeticDynamics:DY.2/classical-julia-good-reduction` (theorem).

If f has good reduction over K, F_I=P¹(K) and J_I=∅. The same holds for potentially good reduction after PGL₂ transport.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted. Good reduction or potentially good reduction, respectively.

Construction or proof:

1. Good reduction preserves chordal distances up to a factor ≤1; all iterates still have good reduction. Hence the entire family is uniformly equicontinuous on P¹(K).

2. Use classical conjugacy invariance for potential good reduction.



Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: Benedetto2010, Proposition 4.22, p.39. All iterates of a good-reduction map are chordal nonexpanding.

Check: The Berkovich Julia set of the same map is a singleton, not empty.

### Inseparable maps have empty classical Julia set

Target `ArithmeticDynamics:DY.2/classical-julia-inseparable` (theorem).

If char K=p>0 and f∈K(z^p) is inseparable, all classical periodic multipliers vanish and J_I=∅. This does not assert potential good reduction or a singleton Berkovich Julia set for every inseparable map.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted. Positive characteristic and inseparability, not merely residue characteristic p.

Construction or proof:

1. Write f=ψ∘(z↦z^p); ψ has a finite chordal Lipschitz constant C.

2. Chordal distance under Frobenius is its p-th power. On a disc of radius at most C^(-1/(p−1)), f contracts or preserves each distance; this property persists under iteration.

3. The chain rule gives multiplier zero for every periodic cycle.



Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/multiplier-chain-rule`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: Benedetto2010, Proposition 4.23, p.39. Explains the local contraction of inseparable maps and empty type-I Julia set.

Check: This is not a residue-characteristic-zero theorem or a converse to good reduction.

## Berkovich dynamics and support

### Berkovich invariance laws

Target `ArithmeticDynamics:DY.2/berkovich-fatou-julia-properties` (theorem).

On P¹,an_K the Fatou/Julia sets are open/closed complements and are completely invariant under f. PGL₂ conjugacy transports them. Every classical exceptional point is in F_Ber. The iterate law is proved separately by the canonical-measure comparison below.

Hypotheses:

- K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Let U be stable and A the infinite complement of its forward saturation S(U). The analytic map is open, so f(U) is open and still omits A. The set A is backward invariant. Finite fibres and surjectivity make f⁻¹(A) infinite; it misses both f⁻¹(U) and S(U), hence the whole saturation of f⁻¹(U). This proves forward and backward stability without an iterate argument.
2. PGL₂ acts by homeomorphisms on the analytic carrier, so it transports open neighborhoods, saturations and infinite complements.
3. If E is finite, its cycles have singleton inverse fibres and full local degree, hence zero return multiplier. The nonarchimedean periodic dichotomy and classical-trace comparison put them in F_Ber. In the Frobenius alternative every classical point is stable by the inseparable-map theorem, and the same trace comparison applies.

Direct prerequisites: `ArithmeticDynamics:DY.2/berkovich-fatou-julia`, `ArithmeticDynamics:DY.2/exceptional-classification`, `ArithmeticDynamics:DY.2/nonarchimedean-disc-criterion`, `TropicalAndBerkovichArithmetic:TB.0`, `TropicalAndBerkovichArithmetic:TB.1`, `ArithmeticDynamics:DY.2/nonarchimedean-periodic-dichotomy`, `ArithmeticDynamics:DY.2/berkovich-classical-trace`, `ArithmeticDynamics:DY.2/classical-julia-inseparable`.

Sources: Benedetto2010, Proposition 6.15(a),(b),(d), p.63; Proposition 6.24(a), p.69. Records invariance and exclusion of classical exceptional points; carrier in 6.15(a) is corrected to the analytic line.

Checks:

- Do not put type-II finite-grand-orbit points into the classical exceptional set.

### Classical trace of Berkovich stability

Target `ArithmeticDynamics:DY.2/berkovich-classical-trace` (comparison).

If ι:P¹(K)→P¹,an_K is the type-I embedding, ι⁻¹(F_Ber)=F_I and ι⁻¹(J_Ber)=J_I. This compares subsets through the native type-I embedding, whose subspace topology agrees with the classical chordal topology. The full analytic line also contains nonclassical points and is not OnePoint K.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. For x∈F_I choose a disc with infinitely many omitted classical points. Its Berkovich disc has the same images on type-I points, so remains stable.

2. For a type-I point in F_Ber shrink its stable weak-open neighborhood to a Berkovich disc. Select two omitted points and a separating type-II point.

3. An image disc containing that separator would contain one omitted point; hence all image discs stay in residue classes at the separator. The disc criterion gives x∈F_I.



Direct prerequisites: `ArithmeticDynamics:DY.2/berkovich-fatou-julia`, `ArithmeticDynamics:DY.2/nonarchimedean-disc-criterion`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: Benedetto2010, Theorem 6.16 and proof, pp.63–64. Proves the set-theoretic trace comparison using image discs and a type-II separator.

Check: The analytic carrier is essential; no compactification of the classical point set is substituted.

### Nonclassical finite grand orbits

Target `ArithmeticDynamics:DY.2/berkovich-finite-grand-orbit` (theorem).

If a point ζ of type II, III or IV has finite grand orbit under f on P¹,an_K, there is exactly one nonclassical point with this property; it is type II, fixed and totally invariant. Moving ζ to ζ_G by any PGL₂ transformation makes f have good reduction.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Pass to an iterate fixing all points in the finite orbit; the inverse fibre of each is a singleton and the local degree equals the full degree.

2. Two such points would bound an annulus whose logarithmic modulus is multiplied by d^n under the iterate. Fixed endpoints force its positive modulus to equal d^n times itself, a contradiction.

3. The full-degree local branch excludes type III/IV; normalize the unique type-II point to Gauss. Every residue component maps into one component, so zeros and poles cannot share a component; the resultant is a unit.



Direct prerequisites: `ArithmeticDynamics:DY.2/exceptional-points`, `TropicalAndBerkovichArithmetic:TB.1`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`.

Sources: Benedetto2010, Proposition 6.20 and proof sketch, pp.66–67. Uses full-degree annulus stretching and the zero/pole criterion for good reduction. FRLergodicv3, Proposition 2.11, pp.15–16. Records the same nonclassical exceptional-point rigidity.

Check: The needed exact annulus-stretching and point-type assertions are in the TB.1 request; a reference to an unread Fatou-component classification is not a substitute.

### Gauss Julia set at good reduction

Target `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction` (theorem).

For a degree-d≥2 good-reduction map over K, J_Ber={ζ_G}. Every point outside ζ_G lies in F_Ber. If f has potentially good reduction, the Julia set is the transported type-II point.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted. Good reduction, with the potential-good-reduction conclusion obtained by conjugacy.

Construction or proof:

1. A residue component either has a periodic forward itinerary, omitting all other components, or has a wandering itinerary, omitting a predecessor component. Thus every point outside Gauss has a stable neighborhood.

2. Prove Gauss is Julia directly: a weak-open neighborhood contains all but finitely many residue components. Any components omitted by all its forward images form a finite backward-invariant residue set.

3. After an iterate each omitted residue direction is fixed with full local degree; forward images of the neighborhood’s thin annulus fill that component except at most one classical point. The omitted complement is therefore finite, even for pure Frobenius.

4. Transport under PGL₂. This direct proof does not depend on Julia nonemptiness from Fatou-component classification.



Direct prerequisites: `ArithmeticDynamics:DY.2/berkovich-fatou-julia-properties`, `ArithmeticDynamics:DY.2/exceptional-classification`, `TropicalAndBerkovichArithmetic:TB.1`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`.

Sources: Benedetto2010, Proof of Theorem 6.19, p.65; Proposition 6.23, p.68. The Gauss-neighborhood annulus argument and residue-component proof give the singleton without invoking Theorem 6.21.

Check: For z^(p^r) the infinite classical exceptional set does not make Gauss Fatou.

### Nonarchimedean preimage equidistribution

Target `ArithmeticDynamics:DY.2/berkovich-preimage-equidistribution` (theorem).

Let μ_f be the parent canonical Radon probability on P¹,an_K, and E the classical exceptional set. For every Radon probability ρ with ρ(E)=0, d^(-n)(f^n)*ρ converges weakly to μ_f. Conversely, convergence implies ρ(E)=0. Pullbacks count analytic local degrees, including inseparable multiplicity. In particular normalized preimages of any a outside E converge, and μ_f is the unique balanced probability assigning E mass zero.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Identify the parent Δg_F+δ_G measure with the telescoping pullback construction of FRL Proposition-Definition 3.1: their potential difference is constant by uniqueness.

2. Represent ρ−δ_G=Δu with u≤0, possibly singular. Prove d^(-n)u∘f^n→0 on the hyperbolic line, then use Hartogs and weak Laplacian convergence.

3. Near exceptional attracting cycles use ρ’s arbitrarily small mass in small discs. Outside those basins and for separable degree >1, pass to an iterate and use diam(fζ)≥C diam(ζ)^(d−1); the resulting (d−1)^n growth is dominated by d^n.

4. For separable degree one normalize to a Frobenius power. The residue orbit is periodic or wanders through disjoint classes; in the latter case their ρ-masses tend to zero. This handles the infinite exceptional set without an at-most-two assertion.

5. Any positive ρ-mass on the countable classical E gives positive mass to a finite exceptional cycle. Its periodic atomic pullback part cannot converge to the parent measure, which has no type-I atoms. For balanced exceptional-null ρ, convergence of its constant normalized-pullback sequence proves uniqueness.



Direct prerequisites: `ArithmeticDynamics:DY.2/canonical-measure`, `ArithmeticDynamics:DY.2/canonical-measure-invariance`, `ArithmeticDynamics:DY.2/green-function-uniqueness`, `ArithmeticDynamics:DY.2/canonical-measure-is-probability`, `ArithmeticDynamics:DY.2/exceptional-classification`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: FRLergodicv3, Proposition-Definition 3.1 and equations (3.1)–(3.2), pp.20–21; Theorem A and its proof in §3.2, pp.22–25. Constructs the same balanced measure and proves convergence through the exceptional-basin, diameter-growth and Frobenius cases.

Check: No claim of atom-freeness at all Berkovich points: a Gauss atom is allowed. The requested TB.1 Hartogs theorem must permit singular potentials, not only bounded continuous ones.

### Canonical support lies in the Berkovich Julia set

Target `ArithmeticDynamics:DY.2/canonical-support-contained-julia` (theorem).

For the parent μ_f, supp μ_f⊆J_Ber and J_Ber is nonempty. This holds in arbitrary characteristic and does not assume countable metrizability of P¹,an_K.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. When separable degree >1, a stable open U has an infinite omitted set A, so some a∈A is outside the finite classical E. Each normalized pullback δ_a assigns U mass zero.

2. Use preimage convergence and the open-set inequality μ_f(U)≤liminf μ_n(U)=0. Equivalently test compactly supported continuous nonnegative functions in U; this version works on general compact Hausdorff spaces. Native support membership excludes U.

3. In the pure Frobenius case conjugate to good reduction; the parent measure is Dirac at the transported Gauss point and the direct Gauss Julia theorem supplies containment.

4. Radon inner regularity makes support conull; probability mass one implies nonempty support. Thus Julia is nonempty without importing the Fatou-component classification in Benedetto Theorem 6.21.



Direct prerequisites: `ArithmeticDynamics:DY.2/berkovich-fatou-julia`, `ArithmeticDynamics:DY.2/berkovich-preimage-equidistribution`, `ArithmeticDynamics:DY.2/exceptional-classification`, `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction`, `ArithmeticDynamics:DY.2/canonical-measure-of-good-reduction`, `ArithmeticDynamics:DY.2/canonical-measure-conjugation`, `mathlib:MeasureTheory.Measure.support`, `mathlib:MeasureTheory.Measure.support_mem_ae_of_innerRegular`.

Sources: FRLergodicv3, Theorem A, pp.2–4; support discussion at start of §3.2, p.22. States Julia support; here its support-containment step is derived from the proved convergence to avoid a classification dependency. Benedetto2010, Definition 6.14, p.63; proof of Theorem 6.19, p.65. The omission definition and direct Gauss argument handle the two cases.

Check: Atomlessness does not imply that E is disjoint from the support; the argument uses a null open neighborhood instead.

### Berkovich blowing up and minimality

Target `ArithmeticDynamics:DY.2/berkovich-blowing-up-minimality` (theorem).

If an open U meets J_Ber, ⋃_{n≥0}f^n(U) contains P¹,an_K\E, with E the classical exceptional set. Consequently J_Ber is contained in every closed backward-invariant S with S\E nonempty; the Julia set is the smallest nonempty closed completely invariant set not contained in E. If J_Ber has at least two points, it has no isolated point.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. If U meets J, its forward saturation has finite complement A by the definition. Since A is backward invariant, every point of A has finite grand orbit.

2. Classical points in A belong to E. A nonclassical point in A forces potential good reduction by finite-grand-orbit rigidity. The singleton Julia point would then lie in U, contradicting its omission.

3. For a∈S\E every U meeting J contains a backward iterate of a. Closedness and backward invariance imply J⊆S.

4. If a Julia point were isolated, apply blowing up to a neighborhood meeting J only there. Complete invariance then forces its backward orbit to be finite, and the nonclassical rigidity forces a singleton Julia set.



Direct prerequisites: `ArithmeticDynamics:DY.2/berkovich-fatou-julia-properties`, `ArithmeticDynamics:DY.2/berkovich-finite-grand-orbit`, `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction`, `ArithmeticDynamics:DY.2/canonical-support-contained-julia`.

Sources: Benedetto2010, Proposition 6.24(a),(c),(d),(e), pp.68–69. The shared blowing-up argument gives minimality and the no-isolated-point alternative.

Check: Use S\E≠∅, not merely |S|≥3, in the inseparable case.

### Berkovich canonical measure has Julia support

Target `ArithmeticDynamics:DY.2/canonical-measure-julia-support` (theorem).

For every f of degree ≥2 over K, the native measure support of the parent canonical measure is exactly J_Ber: supp μ_f=J_Ber. The support is nonempty and compact, f⁻¹(supp μ_f)=supp μ_f=f(supp μ_f), and μ_f gives the classical exceptional set mass zero.

Hypotheses:

- K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. The previous containment theorem gives supp μ⊆J and nonempty support.
2. Local-degree measure pullback has support f⁻¹(supp μ); balance f*μ=dμ gives backward invariance of support. Closedness comes from the native support theorem; compactness follows from the native compact analytic carrier.
3. The parent canonical-measure-is-probability theorem gives no type-I atoms; E is countable, so μ(E)=0. Conull support then has a point outside E.
4. Apply Julia minimality to S=supp μ for the reverse containment. Pushforward invariance and surjectivity give the image equality.

Direct prerequisites: `ArithmeticDynamics:DY.2/canonical-support-contained-julia`, `ArithmeticDynamics:DY.2/berkovich-blowing-up-minimality`, `ArithmeticDynamics:DY.2/exceptional-classification`, `ArithmeticDynamics:DY.2/canonical-measure-invariance`, `ArithmeticDynamics:DY.2/canonical-measure-is-probability`, `mathlib:MeasureTheory.Measure.isClosed_support`, `mathlib:MeasureTheory.Measure.support_mem_ae_of_innerRegular`, `TropicalAndBerkovichArithmetic:TB.0`, `TropicalAndBerkovichArithmetic:TB.1`.

Sources: DKYv2, §2.4, p.9. Legendre Lattès specialization and local canonical-measure normalization; this consuming family is not a proof of the general rational-map theorem. FRLergodicv3, Theorem A, pp.2–4; §3.2, p.22. Identifies the equilibrium measure support with Julia.

Checks:

- Good reduction yields a type-II Dirac mass, compatible with no type-I atoms.

### Berkovich Julia sets under iteration

Target `ArithmeticDynamics:DY.2/berkovich-julia-iterate` (theorem).

For every m≥1, μ_{f^m}=μ_f, J_Ber(f^m)=J_Ber(f) and F_Ber(f^m)=F_Ber(f).

Hypotheses:

- K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. The parent escape-rate-iterate-lift theorem identifies the normalized escape-rate potentials of a lift and its m-fold composition. Applying the already-owned canonical-measure construction gives μ_{f^m}=μ_f.
2. Apply canonical-measure Julia-support equality to f and f^m. Their native supports agree; taking complements gives the Fatou equality. This uses no unproved implication from finite fibres to iterate stability.

Direct prerequisites: `ArithmeticDynamics:DY.2/escape-rate-iterate-lift`, `ArithmeticDynamics:DY.2/canonical-measure`, `ArithmeticDynamics:DY.2/canonical-measure-julia-support`.

Sources: Benedetto2010, Proposition 6.15(c), p.63. States equality of the Berkovich Fatou and Julia sets for positive iterates. FRLergodicv3, Proposition-Definition 3.1, equations (3.1)–(3.2), pp.20–21; §3.2, p.22. The equilibrium limit for an iterate is the corresponding subsequence of the same normalized pullback construction; its support is Julia.

Checks:

- The proof runs through measure support after support equality, not as a prerequisite of that equality.

### Singleton and perfect Julia sets

Target `ArithmeticDynamics:DY.2/berkovich-julia-singleton-dichotomy` (theorem).

The following are equivalent: J_Ber is a singleton; J_Ber is at most countable; J_Ber has an isolated point; f has potentially good reduction. In that case the point is type II and μ_f is its Dirac mass. Otherwise J_Ber is nonempty, uncountable and perfect.

Hypotheses: K complete and algebraically closed with a nontrivial nonarchimedean absolute value; f∈K(z), degree d≥2; arbitrary characteristic unless restricted.

Construction or proof:

1. Potential good reduction gives the transported Gauss singleton. A countable nonempty compact Hausdorff space has an isolated point by the Baire theorem: without isolated points it would be a countable union of nowhere-dense singletons.

2. An isolated Julia point forces a singleton by blowing up. Complete invariance then gives a nonclassical finite grand orbit, since classical exceptional points are Fatou; rigidity gives potential good reduction.

3. Alternatively singleton support of a Radon probability is Dirac, and the parent point-mass criterion gives the same converse.



Direct prerequisites: `ArithmeticDynamics:DY.2/canonical-measure-julia-support`, `ArithmeticDynamics:DY.2/berkovich-blowing-up-minimality`, `ArithmeticDynamics:DY.2/berkovich-finite-grand-orbit`, `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction`, `ArithmeticDynamics:DY.2/potential-good-reduction-iff-point-mass`.

Sources: Benedetto2010, Corollary 6.25 and proof, p.69. Connects countability, isolated points, singleton Julia and potential good reduction.

Check: Perfect means closed with no isolated points in the weak topology; no second-countability assumption is introduced.

## Complex support and entropy

### Repelling periodic points are dense in Julia

Target `ArithmeticDynamics:DY.2/complex-repelling-periodic-density` (theorem).

For a rational map on the complex sphere of degree at least two, the closure of its repelling periodic points is exactly the classical Julia set.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. At a repelling periodic point the derivatives of return iterates grow without bound, ruling out a normal neighborhood; hence repelling periodic points lie in Julia.
2. The reverse inclusion is the density theorem used in Lyubich §3. The cited paper states this classical input without its proof. Record its full dynamical proof as the explicit gap below; do not infer density from Montel alone or use the downstream uniform blowing-up theorem to prove its own input.

Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.2/multiplier-of-a-periodic-cycle`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`, `ConformalMappingPartII:V0`.

Sources: Lyubich1983, §3, density theorem, p.355; its use in Proposition 1, p.356. States density of repelling periodic points (called sources) and uses it to obtain uniform blowing up.

Checks:

- This is a justified source statement with an explicitly open proof prerequisite; it does not assert closed coverage.

### Complex blowing up and inverse branches

Target `ArithmeticDynamics:DY.2/complex-julia-blowing-up` (theorem).

For f on P¹(C), J is nonempty, perfect and completely invariant; E has at most two points and lies in F. For every open U meeting J and every compact K⊆P¹(C)∖E, there exists N with K⊆f^n(U) for all n≥N. For each a outside E, J is contained in the closure of its backward orbit (with equality if a∈J). Any family of holomorphic inverse branches of f^m defined on a domain U is spherical normal. If U meets J, their image diameters on every V compactly contained in U tend uniformly to zero as m→∞. Write Z_ℓ=⋃_{j=1}^ℓ f^j(Crit f) and τ=#f(Crit f). On any simply connected U disjoint from Z_ℓ, the number σ_m(U) of inverse branches satisfies σ_m(U)≥d^m(1−2τd^(−ℓ)) for m,ℓ≥1.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. Meromorphic Montel bounds the permanent omitted values of forward images of a Julia neighborhood by two; backward invariance of this finite omitted set puts it in E. Exceptional cycles are superattracting and lie in F. If J were empty, compactness would give a uniformly convergent subsequence of global iterates. Uniformly close sphere maps are homotopic, contradicting deg(f^n)=d^n. Backward density and E⊂F rule out isolated Julia points.
2. For uniform blowing up choose a repelling periodic point in U by the density theorem. A small V⊆U satisfies f^p(V)⊃V for its period p. Enlarge K to compact L outside E with f(L)⊃L using invariant exceptional-neighborhood bases. Montel for f^p and equality of exceptional sets under iteration show ⋃_{j≥0}f^{pj}(V) covers L. These open sets increase, so a single one covers L. Applying f(L)⊃L gives the claimed inclusion for every sufficiently large exponent.
3. For normality of all inverse branches, locally choose a periodic orbit of at least three points avoiding the domain neighborhood. Every inverse branch omits this orbit, since its forward image is outside the orbit. Montel applies; disjointness of branch images is not the omitted-value hypothesis.
4. If U meets J and an inverse-branch subsequence of increasing order has a nonconstant limit, Hurwitz gives a neighborhood Y of the limiting image of a Julia point with Y contained in each branch image of a smaller domain U′. Complete invariance and closedness put that limiting image in J. Thus f^{m_j}(Y)⊆U′, contradicting uniform blowing up to a nonexceptional point outside U′. Normality then gives uniform shrinking on compact V.
5. There are d^m branches when m≤ℓ. At each later step at most τ of the mutually disjoint branch images contain a critical value; the rest each admit d further branches. Induction gives d^m−σ_m≤τ∑_{i=1}^{m−ℓ}d^i≤2τd^{m−ℓ}.

Direct prerequisites: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.2/exceptional-classification`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `ConformalMappingPartII:V0`, `mathlib:ArzelaAscoli.isCompact_of_equicontinuous`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`, `ArithmeticDynamics:DY.2/complex-repelling-periodic-density`, `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l0--the-local-mapping-engine`.

Sources: Lyubich1983, §3, Propositions 1–4, pp.354–358. Proposition 1 uses the separately recorded density theorem for uniform compact blowing up; Propositions 2–3 give normality and shrinking with a Julia point in the domain; Proposition 4 gives the stated branch-count deficit.

Checks:

- The ConformalMapping L1 bounded holomorphic-family theorem alone is not meromorphic Montel with three omitted sphere values.

### Lyubich transfer limit

Target `ArithmeticDynamics:DY.2/complex-transfer-limit` (theorem).

For f on P¹(C) define the native continuous-function operator Aψ(z)=d⁻¹∑_{f(w)=z}deg_w(f)ψ(w). There is a Radon probability ν_f such that A^nψ converges to the constant ∫ψ dν_f uniformly on every compact subset of P¹(C)\E. It is atom-free and balanced and supp ν_f=J. In particular d⁻n(f^n)*δ_a converges weakly to ν_f for a outside E. No new transfer-operator carrier is required; use continuous linear maps on native continuous functions.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. Finite local-degree branches make Aψ continuous even across critical values and give ||A||≤1, positivity and A1=1.
2. First use a compact L⊆P¹(C)∖E with f⁻¹L⊆L. Inverse-branch counting and normality prove equicontinuity of A_L^nψ. At critical preimages use continuous roots; at a nonexceptional period-r point the return multiplicity t<d^r makes the unresolved branch weight (t/d^r)^k tend to zero. Arzelà–Ascoli gives relatively compact orbits in C(L).
3. Use the almost-periodic Banach contraction splitting of Lyubich §2. Peripheral eigenfunctions must be constant and eigenvalue 1: a modulus maximizer and backward-density force equality on J. The transient part tends to zero.
4. The exceptional cycles have forward-invariant neighborhood bases. Every compact K outside E lies in such a compact backward-invariant L. Julia is contained in each L by backward density. The measures constructed on different L agree by evaluating the same transfer limit at a fixed Julia point, so uniform convergence descends to K.
5. The positive normalized limit functional on C(L) is represented by a Radon probability using native Riesz–Markov. Duality gives balance and normalized preimage convergence.
6. Construct the same limit on L=J, which is compact, backward invariant and disjoint from E. Independence of L gives ν=ν_J, hence supp ν⊆J. Conversely, for nonnegative ψ on J positive at a chosen Julia point, uniform blowing up makes A^Nψ strictly positive everywhere on J; compactness gives a positive minimum. The limit functional is therefore positive on ψ, proving J⊆supp ν. A maximal positive atom of a balanced invariant probability must have full local degree along its forward orbit; the finite critical set then forces a finite grand orbit, so the atom would belong to E, disjoint from J. Thus ν is atom-free.

Direct prerequisites: `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `mathlib:ArzelaAscoli.isCompact_of_equicontinuous`, `mathlib:MeasureTheory.ProbabilityMeasure`, `mathlib:RealRMK.rieszMeasure`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`, `mathlib:RealRMK.integral_rieszMeasure`.

Sources: Lyubich1983, Theorem 1 with Lemmas 1–2, pp.358–362; Theorem 2, pp.362–364; §2, pp.352–354. Proves the transfer limit, support and normalized preimage convergence via almost-periodic splitting.

Checks:

- The generic Banach splitting and Radon functional representation are explicit supplier contracts, not hidden in the term convergence.

### Complex canonical measure comparison and support

Target `ArithmeticDynamics:DY.2/archimedean-measure-identification` (comparison).

The parent archimedean measure μ_{f,∞}=Δg_F+ω equals ν_f from the complex transfer limit. Hence its native support is the classical Julia set, and it is the unique atom-free balanced Radon probability. More generally it is the unique balanced Radon probability with zero mass on E, and every nonexceptional point has normalized preimages converging to μ_{f,∞}.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.
- The sphere measure-valued Laplacian supplier must first construct the parent measure and establish its positivity, mass one, atomlessness and balance.

Construction or proof:

1. The parent measure is atom-free, hence μ(E)=0 because E is finite. For each continuous ψ, balance says ∫A^nψ dμ=∫ψ dμ.
2. Transfer convergence holds at every point outside E and |A^nψ|≤||ψ||; dominated convergence identifies ∫ψdμ with ∫ψdν. Equality of Radon measures on continuous tests proves μ=ν.
3. The same reasoning proves uniqueness for every exceptional-null balanced probability. Support equality and preimage convergence now transport through the equality.

Direct prerequisites: `ArithmeticDynamics:DY.2/archimedean-canonical-measure`, `ArithmeticDynamics:DY.2/archimedean-canonical-measure-properties`, `ArithmeticDynamics:DY.2/complex-transfer-limit`, `ArithmeticDynamics:DY.2/exceptional-classification`, `tauceti:TauCetiRoadmap/PDE#lane-c-maximum-principles-and-potential-theory`, `mathlib:MeasureTheory.Measure.support`, `mathlib:MeasureTheory.Measure.ext_of_integral_eq_on_compactlySupported`.

Sources: BakerRumely2004v2, Theorem 2.1, p.4; Proposition 3.36(B), p.18. The potential-theoretic measure is identified with Lyubich’s measure in the archimedean case; balance and the exceptional-null preimage characterization give the comparison. Lyubich1983, Theorems 1–2, pp.358–364. The transfer limit identifies the balanced exceptional-null measure. DKYv2, §2.4, p.9. Legendre Lattès specialization and local canonical-measure normalization; this consuming family is not a proof of the general rational-map theorem.

Checks:

- This is a refinement supplying the parent endpoints, not a second canonical-measure construction.

### Polynomial-size Bowen nets for rational sphere maps

Target `ArithmeticDynamics:DY.2/complex-bowen-net-bound` (theorem).

For every δ>0 there is a constant C_δ>0 such that, for every integer m≥1, the compact complex sphere has a finite net in the spherical Bowen metric max_{0≤j<m}Δ(f^j x,f^j y), of radius δ and cardinality at most C_δ m⁵d^m. The constant may depend on f and δ, but not on m.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. Fix a finite spherical net X containing the critical points and at least three distinct values. Inverse branches on discs avoiding X_m=⋃_{j=1}^m f^j(X) omit X. Normalize each source disc to the unit disc. The requested spherical Montel theorem gives equicontinuity on a smaller disc, hence a uniform shrink factor k for this fixed omitted net; this replaces the Koebe-based proof of Lyubich Proposition 8 without planning a new distortion theory.
2. Use the planar annulus-cover estimate of §6 and a finite smooth sphere atlas: outside an ε-neighborhood of a finite set Z there is a variable-radius net of size ≤C|Z|²(log(δ/ε)+A)+R, with radii bounded by k times distance to Z (Proposition 7). For Z=X_m, |X_m|=O(m), and ε_m=δ/(2L^m) for a spherical Lipschitz bound L>1, this gives O(m³) centers.
3. For each orbit, record the last time outside the critical-net neighborhood, a center at that time, a branch of the preceding iterate, and the next nearby point of X_m. Inverse-branch equicontinuity controls the earlier orbit and the Lipschitz bound controls the later orbit. There are at most C(δ)m⁵d^m such records, hence a spherical Bowen net of that size (Theorem 7).

Direct prerequisites: `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ConformalMappingPartII:V0`, `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`.

Sources: Lyubich1983, §6, planar covering lemma and Proposition 7, pp.368–372; Proposition 8, pp.372–374; net construction and Theorem 7, pp.374–376. The cover construction gives O(m⁵d^m) full-sphere Bowen nets. The fixed omitted-net branch estimate is derived here from the separately requested spherical Montel theorem.

Checks:

- Use full-sphere nets, including critical and exceptional orbits; estimates only off the postcritical set do not bound global entropy.
- The variable-radius covering argument is part of this key dynamical estimate; no missing Koebe theorem is assumed.

### Degree and topological entropy

Target `ArithmeticDynamics:DY.2/complex-topological-entropy` (theorem).

For the rational self-map f of the native compact sphere, Dynamics.coverEntropy f Set.univ equals the EReal image of the natural logarithm log d.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. Apply the polynomial-size Bowen-net bound. Native covering/net entropy comparison and limsup of logarithmic growth give the upper bound log d, since log(C_δ m⁵)/m tends to zero.
2. Balance and atomlessness of the transfer probability give uniform weights 1/d on almost every inverse fibre. The generic conditional-entropy inequality gives h_ν(f)≥log d, and the measure-to-topological inequality gives the matching lower bound. This does not use the downstream entropy-equality endpoint.

Direct prerequisites: `ArithmeticDynamics:DY.2/complex-bowen-net-bound`, `ArithmeticDynamics:DY.2/complex-transfer-limit`, `mathlib:Dynamics.coverEntropy`, `ProbabilisticAndMetricNumberTheory:PM.4`.

Sources: Lyubich1983, §6, planar covering lemma and Proposition 7, pp.368–372; Proposition 8, pp.372–374; Theorem 7 and proof, pp.375–376; Theorem 4, p.367. Gives the variable-radius nets and polynomial-times-degree Bowen bound. The fixed-net inverse-branch estimate can instead use spherical Montel as described here; Theorem 4 supplies the fibre-entropy lower bound.

Checks:

- The entropy is for the full compact sphere and the logarithm is natural. A polynomial count factor vanishes after division by n.

### Entropy of the canonical measure

Target `ArithmeticDynamics:DY.2/complex-canonical-measure-entropy` (theorem).

The invariant probability ν_f=μ_{f,∞} has Kolmogorov–Sinai entropy h_{ν_f}(f)=log d. The Kolmogorov–Sinai entropy carrier and partition API belong to the generic ergodic supplier; this packet does not define a competing entropy.

Hypotheses: f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.

Construction or proof:

1. Pushforward invariance follows by duality from balance. Critical points have zero mass since ν is atom-free.

2. Disintegrate ν over the inverse fibres; almost every fibre has d distinct noncritical points, each conditional weight 1/d. The fibre entropy is log d.

3. Use the generic conditional-entropy formula to obtain hν(f)≥log d; combine with the measure-to-topological entropy inequality and the native topological entropy result to obtain equality.



Direct prerequisites: `ArithmeticDynamics:DY.2/archimedean-measure-identification`, `ArithmeticDynamics:DY.2/complex-topological-entropy`, `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`, `ProbabilisticAndMetricNumberTheory:PM.4`.

Sources: Lyubich1983, Proposition 5 and Theorem 4, pp.366–367; Theorem 7, pp.375–376. Computes fibre weights and entropy, then matches the topological upper bound.

Check: Balance alone is not a definition of maximal entropy; the generic entropy formulas must be supplied.

### Unique maximal-entropy measure

Target `ArithmeticDynamics:DY.2/complex-maximal-entropy-uniqueness` (theorem).

If η is any f-invariant Borel probability on P¹(C) with h_η(f)=log d, then η=ν_f=μ_{f,∞}. Thus the parent archimedean maximal-entropy endpoint is supplied by the identification, the entropy value and this uniqueness theorem.

Hypotheses:

- f∈C(z), algebraic degree d≥2, acting holomorphically on the compact Riemann sphere with spherical topology.
- Invariant means pushforward invariance, not balance; competitors need not be atom-free.

Construction or proof:

1. For a distinct ergodic η, singularity with ν and local inverse branches produce a positive-η set whose preferred inverse-branch blocks occur with frequency above the uniform 1/N threshold.
2. Apply the existing Birkhoff node to the indicator of this positive-η set. Count branch words with this excessive frequency using binomial estimates/Stirling: their growth rate is θ<N.
3. The critical-disc Bowen-net construction contributes only a polynomial factor. Lyubich’s positive-measure-set entropy lemma, proved using Shannon–McMillan–Breiman, gives hη(f)<log d.
4. For general invariant η use the generic ergodic decomposition and entropy integration theorem; almost every ergodic component of a maximizing η must maximize and thus equal ν.

Direct prerequisites: `ArithmeticDynamics:DY.2/complex-canonical-measure-entropy`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ProbabilisticAndMetricNumberTheory:PM.4/birkhoff-pointwise-ergodic`, `ProbabilisticAndMetricNumberTheory:PM.4`, `ArithmeticDynamics:DY.2/complex-bowen-net-bound`.

Sources: Lyubich1983, §7, Lemma 1 and Theorem 9 with proof, pp.379–384. Uses positive-measure Bowen entropy, excess-frequency branch-word counting and ergodic decomposition for uniqueness.

Checks:

- A uniqueness proof restricted to balanced measures does not prove this theorem.

### Power-map acceptance across places

Target `ArithmeticDynamics:DY.2/power-map-julia-measure-comparison` (application).

For f(z)=z^d, d≥2, on P¹(C), J is the unit circle and μ is normalized angular probability there; F consists of |z|<1 and |z|>1 including infinity, and E={0,∞}. On P¹(K) the same map has good reduction, J_I=∅, J_Ber={ζ_G}, and μ=δ_{ζ_G}. In characteristic p and d=p^r, the nonarchimedean classical exceptional set is P¹(overline(F_p)), even though the Berkovich Julia set remains the Gauss singleton.

Hypotheses:

- Separate complex and nonarchimedean specializations of the same power map; d≥2.

Construction or proof:

1. The parent escape-rate formula is log max(|z|,1). Its complex normalized Laplacian is angular probability on the unit circle; its nonarchimedean Laplacian is Gauss Dirac minus infinity Dirac.
2. Iterates converge to 0 or infinity off the complex unit circle, while radial perturbations on the circle are eventually separated.
3. Use good reduction for the nonarchimedean conclusions and exceptional classification for the characteristic-p warning.

Direct prerequisites: `ArithmeticDynamics:DY.6/power-map`, `ArithmeticDynamics:DY.2/escape-rate-of-good-reduction`, `ArithmeticDynamics:DY.2/canonical-measure-of-good-reduction`, `ArithmeticDynamics:DY.2/classical-julia-good-reduction`, `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction`, `ArithmeticDynamics:DY.2/archimedean-measure-identification`, `ArithmeticDynamics:DY.2/exceptional-classification`, `tauceti:TauCetiRoadmap/PDE#lane-c-maximum-principles-and-potential-theory`.

Sources: Benedetto2010, Proposition 4.22, p.39 and Proposition 6.23, p.68. Computes the contrasting classical and Berkovich good-reduction behavior. DKYv2, §2.4, p.9. Legendre Lattès specialization and local canonical-measure normalization; this consuming family is not a proof of the general rational-map theorem.

Checks:

- Test total mass one and Δlog⁺|z|=ω−δ∞ on the sphere; using 2π times angular mass fails.
- This imports the existing power-map object; no new power-map definition is introduced.

## Sharp period refinement

### Weighted divisibility for p-fold composition

Target `ArithmeticDynamics:DY.2/zieve-weighted-coefficient-divisibility` (theorem).

Let p be an odd prime and H=X+∑b_iX^i be the generic polynomial over Z[b_0,…,b_D]. For 0≤β≤p−1, every monomial c∏b_i^α_i with coefficient c not divisible by p in [X^β](H^p−X) satisfies ∑_{i=0}^{p−1}α_i≥p and 2α_0+α_1≥p−1. Every composition monomial has weight ∑(i−1)α_i=β−1. For β=0 the only monomials with α_0=1 are binom(p,l+1)b_0b_1^l; in particular the term p b_0 is distinguished. Here H^p means p-fold composition, not ordinary multiplication.

Hypotheses:

- Generic finite-degree polynomial; p odd prime.

Construction or proof:

1. Track substitution monomials by weighted degree to obtain ∑(i−1)α_i=β−1 and the β=0 binomial exceptions (Lemma 42).
2. Reduce modulo p; high-index coefficients i≥p cannot occur in the relevant low-degree monomials with α_0<p (Lemma 39).
3. For total low-index degree use the substitution matrix on R[X]/(X^p), with R=F_p[b_0,…,b_{p−1}]/(b_0,…,b_{p−1})^p. The operator is I+N with N^p=0, so its p-th power is I (Lemma 40).
4. For weighted low degree embed b_0=u b_1² modulo b_1^(p−1), invert b_2, and use nilpotent quadratic preparation to find a root δ in the ideal (b_1) after a monic quadratic extension.
5. Translate X by δ: substitution becomes triangular with diagonal 1,(1+ε),…,(1+ε)^(p−1), ε^(p−1)=0. The cyclotomic product gives characteristic polynomial t^p−1; Cayley–Hamilton gives the required identity (Lemma 41). The exact preparation step is retained as an algebra supplier gap.

Direct prerequisites: `mathlib:Polynomial.comp`, `mathlib:Polynomial.coeff`, `mathlib:Nat.iterate`.

Sources: Zieve1996, Lemmas 29–30, pp.22–23; Lemmas 39–42 and proofs, pp.28–31. The monomial constraints separate p-divisible terms from terms whose coefficient valuation is controlled by low jets.

Checks:

- Keep p-fold composition distinct from the polynomial power.
- This node refines the parent valuation recursion rather than reproducing its bound.

### Sharp p-power jet growth

Target `ArithmeticDynamics:DY.2/zieve-jet-growth` (theorem).

Let R be a characteristic-zero DVR of residue characteristic p, v(π)=1 and e_K=v(p)≥1. For H∈R[X] with H(0)∈m and H′(0)≡1 mod m, write c_i(j)=[X^i](H^(p^j)−X), C_i(j)=v(c_i(j)), with v(0)=∞. If p is odd and p^(j−1)≤2e_K/(p−1), then C_0(j),C_1(j)≥(p^j+1)/2 and C_i(j)≥(p^j−1)/2 for 2≤i≤p−1. At the first index ℓ with p^ℓ>2e_K/(p−1), any finite C_0(ℓ) remains finite and then increases by exactly e_K per p-fold iteration. If p=2, C_0(j),C_1(j)≥2^j while 2^(j−1)≤e_K; at the first ℓ with 2^ℓ>e_K a finite C_0(ℓ) likewise grows by exactly e_K. Therefore a point in m of exact H-period p^n, n≥1, satisfies p^(n−1)≤2e_K/(p−1), sharpened to 2^(n−1)≤e_K when p=2.

Hypotheses:

- DVR in mixed characteristic; H is integral and tangent to the identity modulo m; conjugate the selected cycle point to 0.

Construction or proof:

1. Odd p: apply weighted coefficient divisibility to bound the next jet by the minimum of p-divisible terms and weighted non-p-divisible monomials. Induct on j as in Proposition 31.
2. Past the first threshold, every constant-term summand except p c_0 has valuation strictly greater than e_K+C_0; Proposition 32 gives exact noncancelling linear valuation growth and persistence of the other jet bounds.
3. For p=2 give the short direct argument omitted by the source: if H=X+c_0+c_1X+… then C_0(next)≥min(e_K+C_0,C_0+C_1,2C_0), and C_1(next)≥min(e_K+C_1,2C_1,e_K+C_0,2C_0). The term with i=2 in the derivative carries the factor 2; i≥3 contributes at least 2C_0.
4. Those inequalities double both lower bounds up to the threshold. Once C_0,C_1>e_K, only 2c_0 can have the least constant-term valuation, so C_0(next)=e_K+C_0 and C_1 stays >e_K.
5. A periodic 0 eventually has C_0=∞. Finite noncancelling growth past ℓ contradicts that, forcing its period to divide p^ℓ. Translate ℓ into the displayed inequalities.

Direct prerequisites: `ArithmeticDynamics:DY.2/zieve-weighted-coefficient-divisibility`.

Sources: Zieve1996, Propositions 31–32, p.24; Theorem 33, p.25; Theorem 8, pp.8,21. Gives the odd-prime induction and sharp bound. The p=2 conclusion is stated with modifications; the displayed two-jet inequalities supply that modification explicitly.

Checks:

- For e_K=1 obtain n=0 for p≥5 and n≤1 for p=2,3.
- Zieve Example 35, p.26: 3+(5X−X²)/2 has the cycle (0,3,6) over Z_3; a claimed universally stronger e_K/(p−1) bound for odd p fails.

### Polynomial realization of a rational cycle

Target `ArithmeticDynamics:DY.2/zieve-rational-cycle-adapter` (comparison).

For a mixed-characteristic DVR R and P,Q∈R[X], let h=P/Q∈Frac(R)(z). Suppose a finite cycle σ lies in R and Q(a) is a unit for every a∈σ. There exists θ∈R[X] with θ(a)=h(a) on σ and with the same reduced return multiplier when the cycle has more than one point in a residue class. For a good-reduction projective rational map, apply this to its residue-return cycle after a PGL₂(R) coordinate change or reciprocal chart. Combining the parent residue-period and multiplier-order factorization with sharp jet growth proves the existing parent Zieve endpoint; it is not a new copy of that endpoint.

Hypotheses: Finite K/Q_p for the parent consequence; more generally a DVR and good reduction at every point in the selected projective cycle suffice.

Construction or proof:

1. For the finite set S={Q(a):a∈σ} of units, construct a polynomial Ψ with 1−tΨ(t)=∏_{s∈S}(1−t/s). Then θ=P·Ψ(Q) agrees with h on σ.

2. For two distinct points in one residue class with matching images, the first-order difference quotient shows the derivatives of the corresponding return polynomials agree modulo m. Apply it to θ’s return map and the polynomial realization of h’s return; the derivative of Ψ at a denominator value gives the rational chain-rule derivative modulo m (Lemma 46).

3. Use the parent reduction of periodic points to pass to the residue-return orbit, all in one residue disc, and normalize it to m. Unit denominators follow from pointwise good reduction; reciprocal coordinates handle a disc at infinity.

4. The parent period theorem supplies the order r of the reduced multiplier. Replace the return map by its r-th iterate and use the polynomial realization to reach the tangent-to-identity hypotheses of sharp jet growth.

5. Insert p^(n−1)≤2e_K/(p−1) (and p=2 sharpening) in the parent zieve-period-exponent-bound. No assertion that global polynomial interpolation preserves exact characteristic-zero multipliers is needed.



Direct prerequisites: `ArithmeticDynamics:DY.2/zieve-jet-growth`, `ArithmeticDynamics:DY.2/periods-under-good-reduction`, `ArithmeticDynamics:DY.2/reduction-of-periodic-points`, `ArithmeticDynamics:DY.2/multiplier-reduction`, `ArithmeticDynamics:DY.0/good-reduction-of-a-rational-map`.

Sources: Zieve1996, Proposition 44 and Lemma 45, p.34; Lemma 46, pp.35–36; Corollaries 48–49, p.37; Theorem 50 and proof, p.38. The finite-cycle interpolation and reduced-multiplier comparison transfer the bound to projective rational maps.

Check: Source access is resolved by the author PDF; the odd-prime coefficient proof still depends on the precisely named preparation gap. Do not use the unrestricted formal-composition assertion warned against in §2.4, p.32.

## Parent refinement map

Keep the parent ids and its measure APIs. An integration or follow-up pass applies these
specific dependency refinements, after supplier planning and review; this job changes
only its own packet, reader, suggested file and handoff.

| Existing parent endpoint | Refinement |
| --- | --- |
| `DY.2/archimedean-canonical-measure` | Import the proposed PDE Part II sphere Riesz/Laplacian contract; restrict the Laplacian’s domain to differences of subharmonic potentials. Preserve Δg_F+ω and its normalization. |
| `DY.2/archimedean-canonical-measure-properties` | Use the same supplier for positivity, total mass, pullback and atomlessness; use the native sphere and finite holomorphic degree interfaces for multiplicities. |
| `DY.2/archimedean-canonical-measure-is-maximal-entropy-measure` | Add this packet’s `archimedean-measure-identification`, `complex-canonical-measure-entropy` and `complex-maximal-entropy-uniqueness`; these expose the exact Montel, Banach and generic entropy gaps. |
| `DY.2/zieve-period-exponent-bound` | Replace the inaccessible-source note with Zieve Theorem 50, p.38, and this packet’s `zieve-rational-cycle-adapter` → `zieve-jet-growth` → `zieve-weighted-coefficient-divisibility`. Retain the precise nilpotent-preparation gap. |

The already-planned local escape, measure, multiplier, Hutz and residue-period targets
are imported by exact id. The parent’s two archimedean source gaps are narrowed and
routed here. Its Zieve source-access gap is resolved as access, while its remaining
algebra dependency is explicit. None of these supplier gaps is called closed.

## Supplier contracts and gaps


### Request to `TropicalAndBerkovichArithmetic:TB.0`

Native projective analytic line of multiplicative seminorms with compact Hausdorff weak topology, dense type-I embedding with the classical chordal subspace topology and Gauss type-II point; rational-map analytification continuous, open and finite with total local-degree sum d, composition and PGL₂ transport. Keep arbitrary-characteristic inseparable multiplicity. This extends the parent request, not a second analytic carrier.

Consumers: `ArithmeticDynamics:DY.2/berkovich-fatou-julia`, `ArithmeticDynamics:DY.2/berkovich-fatou-julia-properties`, `ArithmeticDynamics:DY.2/canonical-measure-julia-support`.

### Request to `TropicalAndBerkovichArithmetic:TB.1`

Discs/affinoids map with their type-I traces; separating type-II points, residue components and weak-open Gauss neighborhoods; chordal rational Lipschitz and analytic disc coefficient estimates. Full-degree annulus maps multiply log modulus by full degree; classify singleton inverse-fibre type II/III/IV points and show finite omitted residue directions’ thin annuli fill except at most one point. For the measure argument supply local-degree pullback on Radon measures, supp(f*ρ)=f⁻¹suppρ, integration duality, BDV potentials with Δlog⁺|T|=δ_G−δ∞, harmonic uniqueness, singular-potential Hartogs and weak Laplacian convergence. These are explicit extensions of the parent TB.1 request and exceed the current tree-only target list. The pole-free convergent local expansion and its small invariant/expanding-disc bounds are required for arbitrary rational maps, without global good reduction.

Consumers: `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.2/nonarchimedean-disc-criterion`, `ArithmeticDynamics:DY.2/nonarchimedean-periodic-dichotomy`, `ArithmeticDynamics:DY.2/classical-julia-good-reduction`, `ArithmeticDynamics:DY.2/classical-julia-inseparable`, `ArithmeticDynamics:DY.2/berkovich-fatou-julia-properties`, `ArithmeticDynamics:DY.2/berkovich-classical-trace`, `ArithmeticDynamics:DY.2/berkovich-finite-grand-orbit`, `ArithmeticDynamics:DY.2/berkovich-julia-good-reduction`, `ArithmeticDynamics:DY.2/berkovich-preimage-equidistribution`, `ArithmeticDynamics:DY.2/canonical-measure-julia-support`.

### Request to `tauceti:TauCetiRoadmap/FuchsianOrbifolds#layer-5-compact-surface-degree-theory-and-fuchsian-applications`

Finite nonconstant holomorphic sphere maps: local analytic normal forms, positive local multiplicities, finite fibres with degree sum, critical values, inverse branches off critical values, composition. Use the current FuchsianOrbifolds independent lower compact-surface degree module; do not reconstruct it in arithmetic dynamics.

Consumers: `ArithmeticDynamics:DY.2/classical-fatou-julia-properties`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ArithmeticDynamics:DY.2/complex-transfer-limit`, `ArithmeticDynamics:DY.2/complex-canonical-measure-entropy`.

### Request to `tauceti:TauCetiRoadmap/BelyiMaps#layer-8-riemann-surfaces-and-analytic-riemann-existence`

Import the sphere two-chart ChartedSpace/IsManifold instances and the meromorphic-to-holomorphic comparison specified in the current BelyiMaps retained §8.1. Its current owner is successor BelyiAnalyticCovers, absent from this atlas snapshot; route this request to that owner when its stage id is published. Do not implement another sphere atlas or claim the commented former Suggested instances are built.

Consumers: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/complex-repelling-periodic-density`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ArithmeticDynamics:DY.2/complex-transfer-limit`, `ArithmeticDynamics:DY.2/complex-bowen-net-bound`.

### Request to `ConformalMappingPartII:V0`

Extend the value-distribution direction with spherical meromorphic Montel for three omitted fixed values, constant-infinity limits and compact-open normality/equicontinuity comparison. This is an extension proposal and the named gap, not a claim that present V0 includes the theorem.

Consumers: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/complex-repelling-periodic-density`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ArithmeticDynamics:DY.2/complex-bowen-net-bound`.

### Request to `tauceti:TauCetiRoadmap/PDE#lane-c-maximum-principles-and-potential-theory`

Route the stated sphere Riesz/Laplacian contract to PDE, Part II: complex potential theory. Existing lane C supplies only its Euclidean potential-theory background; it does not supply a measure Laplacian of an arbitrary continuous function.

Consumers: `ArithmeticDynamics:DY.2/archimedean-measure-identification`, `ArithmeticDynamics:DY.2/power-map-julia-measure-comparison`.

### Request to `ProbabilisticAndMetricNumberTheory:PM.4`

Keep PM.4 Birkhoff and conditional-expectation APIs; route the explicit finite-partition entropy, conditional fibre formula, measure/topological inequality, Shannon–McMillan–Breiman positive-set bound and ergodic entropy decomposition to Probabilistic and metric number theory, Part II. Do not cite the current PM.4 exact-system predicate as defining entropy.

Consumers: `ArithmeticDynamics:DY.2/complex-topological-entropy`, `ArithmeticDynamics:DY.2/complex-canonical-measure-entropy`, `ArithmeticDynamics:DY.2/complex-maximal-entropy-uniqueness`.

### Request to `tauceti:TauCetiRoadmap/ConformalMapping#milestone-l0--the-local-mapping-engine`

Import current ConformalMapping L0 Hurwitz and its local open-mapping/degree consequences to pass from a nonconstant locally uniform inverse-branch limit to a common image neighborhood. This is the existing local-mapping owner, not another Hurwitz plan. The registered atlas stage id is retained; in the current README its locator is the L0 bullet under Layers.

Consumers: `ArithmeticDynamics:DY.2/complex-julia-blowing-up`.

### Sphere Riesz measures and normalized distributional Laplacian

Inherited analytic gap, narrowed to an exact supplier contract. On native OnePoint C with its complex charts, construct Δ on differences of subharmonic functions with Radon Riesz measures; Δlog|z|=δ_0 on C, Δlog⁺|z|=ω−δ∞ on the sphere, total mass zero, local positivity, divisor Poincaré–Lelong, weak continuity under locally uniform potential limits, pullback Δ(u∘f)=f*Δu with local-degree multiplicity, harmonic uniqueness modulo constants and continuous-potential atomlessness. Arbitrary continuous functions do not have measure-valued Laplacians: require differences of subharmonic potentials. Current PDE lane C is C² Euclidean potential theory; propose PDE, Part II rather than claiming that lane already supplies these statements. Existing parent nodes remain authoritative until this extension is planned and reviewed.

Needed by: `ArithmeticDynamics:DY.2/archimedean-measure-identification`, `ArithmeticDynamics:DY.2/power-map-julia-measure-comparison`, `ArithmeticDynamics:DY.2/archimedean-canonical-measure`, `ArithmeticDynamics:DY.2/archimedean-canonical-measure-properties`.

### Spherical meromorphic Montel beyond bounded holomorphic normal families

Require normality in the compact-open spherical topology for meromorphic maps on a plane domain omitting three fixed distinct sphere values, allowing the constant-infinity limit. Current ConformalMapping L1 covers locally bounded holomorphic families. ConformalMappingPartII:V0 is a value-distribution owner but does not currently state this exact theorem. Route the extension there; identify spherical normality with local uniform equicontinuity using compact-domain Arzelà–Ascoli and the already specified sphere charts, not a new Riemann-sphere construction. Include closure under locally uniform spherical limits as holomorphic sphere maps via charts and Hurwitz, and compact-subdomain derivative control; import ConformalMapping L0 rather than duplicating it.

Needed by: `ArithmeticDynamics:DY.2/classical-fatou-julia`, `ArithmeticDynamics:DY.2/complex-repelling-periodic-density`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`, `ArithmeticDynamics:DY.2/complex-bowen-net-bound`.

### Almost-periodic Banach contraction decomposition

Lyubich §2, pp.352–354 uses the following generic result, not covered by the current Hilbert self-adjoint OperatorTheory family: a continuous linear contraction on a complex Banach space with every orbit relatively compact splits into the closed span of unimodular eigenvectors and a subspace whose iterates tend to zero. If only the constant eigenvectors at eigenvalue 1 survive, iterates converge to the corresponding projection. The source proof uses a compact abelian closure of operator powers, Haar averaging and characters. This must be supplied as a Banach/Markov extension of OperatorTheory, Part II; the dynamical inverse-branch and eigenfunction steps are planned here. No Hilbert spectral theorem is cited as supplying it.

Needed by: `ArithmeticDynamics:DY.2/complex-transfer-limit`.

### Generic measure entropy and maximizing-measure machinery

PM.4 plans native ergodicity, exactness, conditional expectations and Birkhoff, but not Kolmogorov–Sinai entropy. Need finite measurable partition entropy with natural logs and 0log0=0, joins and h(T,P)=lim n⁻¹H(∨_{j<n}T⁻ʲP), hμ(T)=sup_P h(T,P), fibre disintegration and conditional-entropy lower bound, hμ(T)≤Dynamics.coverEntropy T univ, Shannon–McMillan–Breiman and its positive-measure Bowen-set bound (Lyubich §7 Lemma 1), ergodic decomposition and integration of entropy. Propose Probabilistic and metric number theory, Part II; keep the existing PM.4 Birkhoff owner. Until this contract is planned, the Lyubich dynamical entropy proofs are planned but not closed.

Needed by: `ArithmeticDynamics:DY.2/complex-topological-entropy`, `ArithmeticDynamics:DY.2/complex-canonical-measure-entropy`, `ArithmeticDynamics:DY.2/complex-maximal-entropy-uniqueness`, `ArithmeticDynamics:DY.2/archimedean-canonical-measure-is-maximal-entropy-measure`.

### Nilpotent quadratic preparation in Zieve’s weighted coefficient proof

Source access to Zieve’s thesis is resolved. The residual algebra step is precise: in S=F_p[u,b_1,…,b_D,b_2⁻¹]/(b_1^(p−1)), b_0=u b_1², factor g(T)=∑b_iT^i by a monic quadratic T²+b′_1T+b′_0 with b′_1∈(b_1), b′_0∈(b_1²), times a unit formal series. After a monic extension adjoin a root δ∈(b_1). Zieve Lemma 41, pp.29–30 invokes Newton polygons for this preparation over a nilpotent coefficient ring. The current AdicSpaces Weierstrass theorem is over complete valued fields and does not supply this ring statement. A finite nilpotent-ideal lifting proof, with injectivity of the embedding and monic root extension, is needed; it is not claimed as a library baseline fact. This replaces the broad inaccessible-source gap with a localized algebra supplier gap.

Needed by: `ArithmeticDynamics:DY.2/zieve-weighted-coefficient-divisibility`, `ArithmeticDynamics:DY.2/zieve-jet-growth`, `ArithmeticDynamics:DY.2/zieve-rational-cycle-adapter`.

### Complex repelling-periodic density proof

Lyubich §3, p.355 states that repelling periodic points are dense in the Julia set and Proposition 1, p.356 uses it. The local derivative-growth inclusion is elementary; the reverse inclusion needs a full classical dynamical density proof and its precise inputs. It is not supplied by the cited section, by bounded holomorphic Montel, or by the downstream blowing-up result. The owner is ArithmeticDynamics DY.2; the next refinement must read a proof, outline any additional key theorem it uses, and import the existing complex-analysis owners. No converse to repelling-implies-Julia is asserted.

Needed by: `ArithmeticDynamics:DY.2/complex-repelling-periodic-density`, `ArithmeticDynamics:DY.2/complex-julia-blowing-up`.

## Suggested Lean and acceptance boundary

[ArithmeticDynamics--DY.2.lean](../suggested/ArithmeticDynamics--DY.2.lean) gives real bodies
for backward orbits, exceptional sets, classical local uniform stability and the generic
infinite-omission predicates, with their abstract API and examples. It uses the native
iterates, native uniform equicontinuity, an actual equivalence/homeomorphism and the
locally installed compatible compact uniformity on the complex sphere. It elaborates
at the stated pins with only proof-placeholder warnings.

The file names the two omitted compatibility APIs explicitly:
`classicalFatou_complex_normal` and `berkovichJulia_carrier`. Specializing the generic
finite-grand-orbit laws to the native rational-map action is a reader target. Two tests
requiring unavailable native carriers or interfaces, `Exceptional.frobenius` and
`BerkovichJulia.goodReduction`, remain
reader tests and are named in omission comments. The complex power-map tests use actual
functions on native C and OnePoint C; their polynomial/rational-map comparison is a
reader target. All other analytic, measure, entropy and DVR endpoint signatures are
listed in the file’s omission inventory and stated fully above. No desired conclusion
is installed as a field or an assumed premise to make those targets type-check.

A finished implementation must prove the abstract tests, supply the actual analytic
carriers and complete each request, then elaborate the corresponding endpoint statements
using those public declarations. The three predicates’ API includes compatibility with
the native iterates and UniformEquicontinuousOn by construction. Native measure support,
probability measures, uniform-space Arzelà–Ascoli, Riesz–Markov and topological entropy
are imported capabilities, not new nodes. The baseline declaration inventory and read
locations are in the packet.

## Source discipline and findings

Sources were read on 14 October 2026. Printed page numbers are used above. Zieve’s thesis
has five preliminary PDF pages before printed p.1; the rendered proof pages were read
because its text encoding is unsuitable for extraction. No text or image from that PDF
is included here. No cleared private source was needed. Source hashes and exact editions
are recorded in the packet.

Two confirmed findings concern the standalone Benedetto AWS lecture notes dated
9 March 2010; a third concerns proof headings in the Zieve author thesis PDF:


- `ArithmeticDynamics/E801`, Proposition 6.15(a), printed p.63, AWS notes 9 March 2010: The openness and closedness of the Berkovich sets are stated on P¹(K). The ambient carrier is P¹,an_K with its weak topology. Definition 6.14 constructs subsets of the analytic line and includes type-II points. The good-reduction Julia singleton in Proposition 6.23 is not a classical subset.

- `ArithmeticDynamics/E802`, Proposition 6.24(f), printed p.69, AWS notes 9 March 2010: For a polynomial the displayed conclusion is K_φ=∂J_φ,Ber. The intended boundary relation is J_φ,Ber=∂K_φ, with K_φ the Berkovich filled Julia set. The proof discusses ∂K⊆J, indicating the reversal. For z² of good reduction, K is the full closed Berkovich unit disc whereas J is only ζ_G; the boundary of that singleton is itself. This follow-up does not require a filled-Julia node, so none is added.


- `ArithmeticDynamics/E803`, Proof headings following Lemma 47, printed p.37, and Theorem 50, printed p.38, author thesis PDF (1996): Both proof headings refer to Lemma 46 instead of the result just stated. The p.37 proof belongs to Lemma 47; the p.38 proof belongs to Theorem 50. The first proof uses the common cycle and Q_G(x) hypotheses of Lemma 47. The second starts with a projective cycle and proves the sharp period bound of Theorem 50. Lemma 46 is the earlier return-polynomial derivative comparison on pp.35–36.

The Zieve author PDF, homepage and publications page were also checked for corrections.
No correction of those proof headings was located. All three findings are independently
confirmed in the packet.

The AWS source archive, author homepage and author’s book errata dated 31 August 2026
were checked for existing corrections. No correction of these lecture-note locators
was located. The finding in 6.24(f) does not introduce a filled-Julia target into this
follow-up; it records a mistake encountered while reading a required source.

## Sources and current upstream audit


- [Robert L. Benedetto, *Non-archimedean dynamics in dimension one: lecture notes*](https://swc-math.github.io/aws/2010/2010BenedettoNotes-09Mar.pdf), AWS lecture notes, 9 March 2010; read 14 October 2026. Read: §1.4, Theorem 1.11, pp.6–7; §4.4, Definition 4.16, Lemmas 4.18–4.19 and Propositions 4.21–4.24, pp.36–40; §4.5, omitted-value and minimality proofs, pp.40–43; §6.4, Definition 6.14, Propositions 6.15–6.20 and 6.23–6.24, Corollary 6.25, pp.62–69.

- [Laura DeMarco, Holly Krieger, Hexi Ye, *Uniform Manin-Mumford for a family of genus 2 curves*](https://arxiv.org/pdf/1901.09945v2), arXiv:1901.09945v2; read 14 October 2026. Read: §2.4, p.9, the Legendre Lattès family’s local canonical measures and Julia support; the general rational-map proofs use FRL and Lyubich.

- [Charles Favre, Juan Rivera-Letelier, *Théorie ergodique des fractions rationnelles sur un corps ultramétrique*](https://arxiv.org/pdf/0709.0092v3), arXiv:0709.0092v3; read 14 October 2026. Read: §1.1, Theorem A, pp.2–4; §2.2, Propositions 2.4 and 2.6, pp.12–14; §2.3, Definitions 2.7–2.8 and Propositions 2.9–2.11, pp.14–16; §2.4, potential-theory and Hartogs interfaces, pp.16–19; §3.1, Proposition-Definition 3.1, equations (3.1)–(3.2), Proposition 3.3, pp.20–22; §3.2, proof of Theorem A and Lemma 3.4, pp.22–25.

- [M. Yu. Lyubich, *Entropy properties of rational endomorphisms of the Riemann sphere*](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/7326EA7C0A92B304EF4068A39C1D0910/S0143385700002030a.pdf/entropy-properties-of-rational-endomorphisms-of-the-riemann-sphere.pdf), Ergodic Theory and Dynamical Systems 3 (1983), 351–385, publisher PDF; read 14 October 2026. Read: §2, almost-periodic operator splitting, pp.352–354; §3, Propositions 1–4, pp.354–358; §4, Theorems 1–2 and proofs, pp.358–364; §5, Proposition 5 and Theorem 4, pp.366–367; §6, geometric covering and inverse-branch bounds with Theorem 7, pp.368–376; §7, Lemma 1 and Theorem 9 with proof, pp.379–384.

- [Matthew Baker, Robert Rumely, *Equidistribution of small points, rational dynamics, and potential theory*](https://arxiv.org/pdf/math/0407426v2), arXiv:math/0407426v2; read 14 October 2026. Read: Theorem 2.1, p.4; complex dynamical measure comparison; Proposition 3.36, p.18; local measure normalization.

- [Michael E. Zieve, *Cycles of polynomial mappings*](https://websites.umich.edu/~zieve/papers/ucthesis.pdf), Berkeley PhD thesis, 1996, University of Michigan author copy; read 14 October 2026. Read: §2.1, Proposition 1, Corollary 4 and Theorem 8, pp.5–9; §2.3.1–2.3.4, Lemmas 29–30 and 39–42, Propositions 31–32 and Theorem 33, pp.21–31; §2.4, composition warning and Theorem 43, pp.32–34; §2.5, Proposition 44, Lemmas 45–47, Corollaries 48–49 and Theorem 50, pp.34–38.


The read-only current TauCetiRoadmap checkout was audited at commit
`0d144d044dacebca17b654695b6f1ad58f159b27`, beyond the atlas snapshot. The ConformalMapping
and FuchsianOrbifolds documents were read as full neighboring models; BelyiMaps §8.1,
OperatorTheory’s family scope and the current Tau Ceti library were checked for the
specific interfaces. There is no new Fatou/Julia or canonical-measure construction in
those current files. Their sphere, degree and normal-family work is imported through
the boundaries above. ArithmeticDynamics is outside the current tiers 1–4 focus; no
higher-tier definition was moved or re-planned.
