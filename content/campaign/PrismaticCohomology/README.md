# Prismatic cohomology: relative, absolute, Nygaard and log variants

## Scope, conventions and transfers

Construct prisms and their ringed sites, not a black-box cohomology functor.
The basic geometric theorem is Bhatt–Scholze (BS22) Theorem 1.8 for a
**bounded prism** (A,I) and a smooth p-adic formal scheme over A/I.
Further animated, absolute, coefficient and logarithmic branches below carry
their own hypotheses. A prism is not a delta-ring alone: I is an effective
Cartier divisor, A is derived (p,I)-complete and p lies in I+phi(I)A.
Boundedness means bounded p-power torsion in A/I. An orientation is a choice,
not a globally assumed generator of I.

PR.0–2 become the canonical generic owners of the delta/prism and prismatic
cohomology constructions formerly in PerfectoidQuotients Q0–Q2.
That roadmap retains its integral perfectoid algebra prefix, universal
perfectoidization/Andre theorem and closed-quotient application, with explicit
imports/reexports. No original source scope is removed.
DerivedDeRhamCohomology owns cotangent and derived completion; EDS owns the
enhanced/animated category. CrystallineCohomology owns PD/crystalline and
ordinary de Rham–Witt theory. AI owns AΩ and Lη; RefinedTraceMethods owns
the THH/TC bridge. HabiroCohomologyFoundations owns global arithmetic q-gluing.

For every comparison record both the map of coefficient rings and whether
the tensor product is derived and subsequently completed. In particular,
theta, theta∘phi^(-1), reduction modulo I and phi-twisted reduction are not
interchangeable. The present roadmap is not a claim that all future
prismatic stack, F-gauge or log comparison statements are available.

<a id="pr-0"></a>

## PR.0. Delta-rings, prisms and envelopes

Construct p-derivations/delta-rings, free delta-algebras and Frobenius lifts.
Prove their equivalence with a lift of Frobenius only in p-torsionfree rings;
a congruence modulo p alone does not determine a delta-structure with
p-torsion. Construct distinguished elements, maps of prisms, orientations,
boundedness, completed perfection and the rigidity I B=J for a prism map.

Construct prismatic envelopes by delta adjunction and derived completion,
prove their universal properties, complete flatness and regularity under the
source hypotheses. Compare with the PD envelopes already built in CR.0.
Prove the equivalence between perfect prisms and integral perfectoid rings,
using the existing integral perfectoid/tilt/A_inf construction; this is a
new theorem, not a definition declaring the categories equivalent.

Acceptance examples: (W(k),(p)), (A_inf,ker theta), the Breuil–Kisin prism
(W(k)[[u]],(E(u))), and (Z_p[[q−1]],([p]_q)) with phi(q)=q^p.
Prove each Cartier/completion/distinguished condition, and exhibit a
delta-ring that is not a prism. The q-prism ideal is [p]_q, not q−1.
Sources: BS22 §§2–3, including Lemma 3.9 and Theorem 3.10.
Only the integral-algebra prefix of Q0 is an input; Q0's old prism suffix
now imports this stage.

<a id="pr-1"></a>

## PR.1. Relative sites and the basic comparisons

For bounded (A,I) and p-completely smooth R over A/I, construct the relative
prismatic site with its complete faithfully-flat covers, structure sheaf,
reduced structure sheaf, and map to the scheme's étale site. Prove the
sheaf property and compare flat/étale computational variants where used.
Construct Cech–Alexander envelope models, hyperdescent and the Frobenius
on derived global sections; prove coordinate independence.

Prove the crystalline comparison for I=(p) using CR.2's PD Poincare lemma,
with its **phi_A-twisted** scalar extension. Prove the Hodge–Tate comparison
on affines: H^i(Δ tensor^L_A A/I) is Ω^i with twist (I/I²)^(-i).
Construct its multiplicative map and the Bockstein differential.
Prove the de Rham comparison after phi_A-twisted reduction, with its
completed tensor and differential; it is not the same as an untwisted
Hodge–Tate direct sum.

Prove completed base change along bounded prism maps, and proper smooth
perfectness with hypotheses on global sections/finite dimension retained.
Sources: BS22 §§4–6, Theorems 5.2,6.3,6.4 and Corollary 4.12.
Q1 is the named compatibility export of this stage, not a second owner.
Acceptance: smooth polynomial algebra, an étale chart, a crystalline
base and a nontrivial Frobenius-twisted coefficient map.

<a id="pr-2"></a>

## PR.2. Derived extension, semiperfectoid inputs and descent

Extend the smooth-algebra functor by the coherent left Kan extension of
BS22 Construction 7.6 and derived completion. Prove independence and the
filtered derived Hodge–Tate comparison with exterior powers of the
completed cotangent complex. Distinguish the animated functor from the
classical site cohomology of pi_0; prove agreement in the stated ranges.

Prove the discrete delta/prism calculation for quasiregular semiperfectoid
inputs and the initial-prism comparison, including regular quotient and
idempotent-retract arguments in BS22 §§7.7–7.10.
Q2 retains construction of universal prisms for semiperfectoid rings and
universal perfectoidization using these generic results; Q3 then proves
Andre's stronger flat extension theorem. These later Q theorems are not
prerequisites for the present derived functor.

Use DD.5's elementary quasisyntomic cover/descent branch, prove derived
complete-flat descent and the precise base-change formulas needed by Q2–4.
Construct perfect-prismatic/perfected cohomology separately and establish
the comparison with the nonperfect theory rather than replacing one by
the other. Sources: BS22 §§7–8 and BMS2 §4.
Acceptance: regular semiperfectoid quotient, a singular quasiregular
semiperfectoid algebra, and a derived input with nonzero higher homotopy.

<a id="pr-3"></a>

## PR.3. Nygaard filtration, divided Frobenius and twists

On the discrete quasiregular semiperfectoid calculation construct Nygaard
pieces by the actual Frobenius-divisibility condition. Extend them by the
proved quasisyntomic descent and use the appropriate **Frobenius-twisted**
relative complex for the relative filtration. Construct divided Frobenius,
inclusion/canonical maps, and BK twists by descent when I is not oriented.

Prove the associated-graded description, comparison with Hodge–Tate and
de Rham filtrations, and the Lη_I Frobenius factorization in BS22 §15.
State and prove the exact completeness/exhaustiveness assertions; Nygaard
completion of Δ is not silently identified with Δ in all contexts.
Use AI.1's generic Lη, independent of the AΩ construction.

RefinedTraceMethods proves that BMS2's TC/THH filtration has these graded
pieces in its source range, including comparison with the **Nygaard-completed**
prismatic object. It does not define Δ by asserting the comparison.
Sources: BS22 §§12–15; Bhatt–Lurie §§2,5 for intrinsic twists/absolute
refinement. Acceptance: crystalline prism, perfectoid quotient and a case
where the distinction between Δ and its Nygaard completion is visible.

<a id="pr-4"></a>

## PR.4. Étale comparison and p-adic Tate twists

For a **perfect** base prism and the smooth formal scheme of BS22 §9,
construct the comparison from generic-fiber Z/p^n étale cohomology to
(Δ/p^n[1/I])^(phi=1). Define phi=1 as a derived fixed-point/fiber
construction, not fixed vectors in H^0. Establish descent, perfectoid
local calculations, coefficient compatibility and passage to Z_p with
the required derived limits.

For general bases use the specified perfected-site or scalar-extension
version and prove it; do not copy the perfect-prism formula unchanged.
Construct the syntomic/Tate-twist fibers from Nygaard pieces and divided
Frobenius with the intrinsic twists. Prove the stated truncation and
nearby-cycle/logarithmic de Rham–Witt comparisons under BS22/BMS2's
hypotheses; syntomic cohomology is not automatically all generic-fiber
étale cohomology in every degree on every singular input.

The syntomic realization is shared with RT's TC graded pieces and with
arithmetic Chern/regulator consumers. Sources: BS22 §§9,11,14;
BMS2 §10 and Bhatt–Lurie §§7–8. Acceptance: O_C, a formal torus,
a finite coefficient level and comparison of n→n−1 maps.

<a id="pr-5"></a>

## PR.5. Absolute prismatics and geometric coefficient packages

Construct the absolute prismatic site of a p-adic formal scheme, its
structure/prism-ideal sheaves and comparison with relative sites.
Develop the Cartier–Witt divisor moduli and Cartier–Witt stack of
Bhatt–Lurie §§2–4 from the shared animated/stack objects, proving
descent and the equivalence with the source's prismatic crystals.
Distinguish the stack, its global-sections complex, its Hodge–Tate
divisor and a relative base prism.

Construct the absolute Nygaard filtration, Frobenius, BK twists and
the source's derived/filtered/syntomic packages. Prove the relative
and crystalline specializations and their compatibilities. Derived
de Rham/Hodge completions remain DD-owned; RT owns the periodic-cyclic
application and not another absolute prismatic functor.

This is a substantial later branch. State exact qcqs/boundedness and
derived-completion hypotheses in each Bhatt–Lurie theorem being imported;
its site comparison is not an assertion that every animated scheme has
the same underived site cohomology. Work first with their p-adic formal
schemes and affine polynomial/quasisyntomic tests. Sources: Bhatt–Lurie
§§2–5,7–9 and Appendices A–F. General F-gauge classification of arbitrary
torsion representations is not inferred from this package.

<a id="pr-6"></a>

## PR.6. q-crystalline charts and the AΩ comparison

Construct q-PD pairs, q-crystalline envelopes and the q-crystalline site
of BS22 §16. Prove the q-Poincare lemma, framed polynomial computation,
change of framing and cocycle descent. For p-completely smooth Z_p-algebras,
compare the p-completed framed q-de Rham complex with prismatic
cohomology after the specified Z_p[zeta_p] base change over
(Z_p[[q−1]],([p]_q)). This theorem does not by itself glue all primes
into a Habiro theory.

Construct the explicit all-coordinates comparison with AI.3's AΩ and prove
BS22 Theorem 17.2:
AΩ_R ≃ qΩ_(R/Ainf) ≃ phi_A^* Δ_(R/Ainf) for (A_inf,ker theta).
Prove Frobenius and multiplicative compatibility, including the source's
upgrade from an E1 comparison to E-infinity by discrete quasiregular
semiperfectoid descent. The Frobenius pullback is essential.
Use BS22 §18 to prove independence and compatibility of comparison maps,
not merely existence of some quasi-isomorphism.

Habiro HQ.1–2 owns global arithmetic q-de Rham and q-Hodge gluing; it imports
these exact local chart computations and DD's q=1 specialization.
AI.7/CP import the same AΩ comparison and do not reconstruct it.
Acceptance: one polynomial coordinate, a torus, two framings and the
theta/tilde-theta square. Sources: BS22 §§16–18.

<a id="pr-7"></a>

## PR.7. Prismatic F-crystals and crystalline lattices

Construct vector-bundle crystals E on the absolute site and isomorphisms
phi^*E[1/I]≃E[1/I], with actual descent, tensor and realization functors.
For a p-adic formal scheme construct étale realization on its generic
fiber and crystalline realization on its special fiber in the ranges of
Bhatt–Scholze 2106.14735 §§2–4.

Prove the equivalence specifically for Spf(O_K), where K is complete
discretely valued of mixed characteristic with perfect residue field:
finite locally free prismatic F-crystals correspond to finite free Z_p
lattices in crystalline G_K-representations. Construct the inverse,
including the BKF/Robba boundedness argument and descent over the
self-product of the perfectoid cover. The Beilinson fiber sequence
needed by the proof is an explicit RT.3b prerequisite, with its completion/
rationalization order and the suspension dictionary between AMMN's cyclic-homology
convention and the F-crystal paper's notation; it is not assumed as a terminal theorem.

Compare evaluation on the Breuil–Kisin prism with R07's Kisin functor,
including uniformizer dependence and full faithfulness in the source
range. Finite-free crystals do not classify all torsion or derived
Galois representations; a statement about all F-gauges requires a
separate source theorem. Sources: BS F-crystals §§5–7, Theorem 5.6;
AMMN Theorem 6.17 via RT.3b; Corollary 3.9 supplies an underlying pullback-square input, not the stated final rigidity theorem.

<a id="pr-8"></a>

## PR.8. Logarithmic prismatics and exact comparison ranges

Import CR.5's integral log structures and DD.6's log cotangent complexes.
Construct delta_log structures, bounded prelog prisms, associated-log
invariance, strict/exact thickenings, log envelopes and the log prismatic
site. Build the derived log extension and log-quasisyntomic descent,
using Koshikawa–Yao §§2–4, not unverified ordinary descent on underlying rings.

The geometric comparison family has a bounded prelog prism (A,I,M_A)
with integral M_A and an integral log p-adic formal scheme smooth in
Koshikawa's Appendix A sense; the global statements impose qcqs.
Prove Hodge–Tate and completed base change in this scope. For crystalline
comparison require I=(p) and Cartier type. For de Rham comparison and
Frobenius-isogeny/Lη factorization require the mod-p fiber of Cartier type.
These are not conclusions for arbitrary fs log schemes.

For the Kummer-étale comparison require the associated log prism to be
perfect and the scheme to descend from the fs log-smooth/Cartier-type
data and fs monoid M_0 in Koshikawa–Yao Theorem 2(5).
Construct the log-diamond generic fiber and its Kummer-étale site,
refining the early log-adic/Kummer inputs of HodgeTateAndCanonicalSubgroups:T6:log-sites (not T0, and not its later rational comparison);
the underlying pre-adic generic fiber need not be sheafy. Prove
Corollary 7.30's derived phi-fixed comparison and the relevant base-change
maps. Do not replace Kummer-étale cohomology by ordinary étale cohomology
without proving that the log structure is trivial in the case at hand.

Construct log Nygaard and the BKF/coefficient realization comparisons
only at the exact scope of §§5–8. Apply them to the standard semistable
chart and compare with AI.6/CR.6 on their overlap. No universal semistable
F-crystal classification is inferred from the ordinary theorem of PR.7.
Sources: Koshikawa I §§2–6/Appendix A and Koshikawa–Yao II §§2–8.
Suggested.lean tests elementary Frobenius-divisibility
algebra; the constructions above remain full proof targets.
See the reference register.

## Completion contracts added on 2026-09-15

**Applies to:** `PR.0`, `PR.1`, `PR.2`, `PR.3`, `PR.4`, `PR.6`, `PR.7`. Existing stage identifiers remain stable. These are required construction and validation tasks; they do not assert that the mathematics has been formalized.

### Intermediate constructions

For a bounded prism map write the target ideal and the derived (p,J)-completion on the base-change morphism. Distinguish ordinary reduction from Frobenius-twisted reduction in the Hodge–Tate and de Rham comparisons. For PR.4 construct phi=1 as the fiber of phi−1 after the indicated inversion, and prove the coefficient tower compatibility before passing to Z_p. PR.7 constructs the inverse realization by descent, not by declaring crystalline lattices to be crystals.

### Producer–consumer contract

The PR.7 equivalence is finite locally free crystals on Spf(O_K) versus finite free Z_p lattices whose rational representation is crystalline. Torsion F-gauges, arbitrary bases and semistable logarithmic classification have separate contracts. PR.6 exports the Frobenius pullback AΩ comparison.

### Acceptance and source route

The crystalline prism, q-prism ([p]_q), Breuil–Kisin prism, a singular derived input and a Nygaard-completion example must distinguish all four operations.

**Source route:** BS22 Theorem 1.8, §§7/9/15/17; BS F-crystals Theorem 5.6 and its stated scope. The revision source ledger distinguishes freshly inspected passages from inherited locators and pending proof-interior checks. Before implementing a leaf, record its exact source statement, proof dependencies and comparison with the current Tau Ceti/Mathlib types; do not replace a missing producer by an assumed theorem field.
