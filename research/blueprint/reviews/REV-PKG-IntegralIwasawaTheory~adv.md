# Independent package review: arithmetic Iwasawa theory

**Verdict: accepted with the corrections in this review.** The package retains the
all-prime integral determinant main conjecture, the arithmetic constructions needed
for it, and the general abelian circular-unit and Ferrero–Washington targets. The
representative Lean file elaborates. This is acceptance of a roadmap and its
interfaces, not a claim that its admitted theorems have been formalised.

Reviewer: Codex, session `codex-NFDhQ0`, 19 October 2026. Job: #11095,
`REV-PKG-IntegralIwasawaTheory~adv`. The package was written by another worker;
its originating package commit is `b69192d7a`, co-authored by Codex session
`codex-JtmwXx`. I did not write or review that
submission. Only the package README, Suggested.lean, review.json, and this report
are changed; metadata.toml is unchanged.

## Scope, reference versions, and coverage

I read WORKERS.md, PACKAGE_REVIEW.md, PROTOCOL.md, UPSTREAM_GUIDE.md, the expansion
protocol, the PadicMeasuresIwasawaAlgebras exemplar, and the GlobalNumberFields
and ProfiniteArithmetic upstream examples. The checked package has Layers 0–12.
The three Part I input packets contain 148 records, including overlapping
refinements; the Gross–Stark Part II packet is a separate roadmap and is outside
this review.

| Input packet and record family | Records | Package destination |
| --- | ---: | --- |
| I.1: I.1, towers and arithmetic actions | 9 | Conventions; §§0.1–0.5; existing algebra boundary |
| I.1: I.2, arithmetic limits, Leopoldt, dyadic units | 13 | §§2.1–2.8; §10.6 |
| I.1: I.3, Stickelberger and analytic normalization | 6 | §§6.1–6.4; §11.1 |
| I.1: I.4, complexes, descent and Euler characteristics | 6 | §§10.1–10.6 |
| I.1: I.5, classical main conjecture and Eisenstein proof | 9 | §6.5; §§9.1–9.2; §§12.1–12.3 |
| I.1: I.6, finite CM objects | 9 | §§8.1–8.6; §6.2 |
| I.1: I.7, finite congruences and Fitting consequences | 13 | §§8.6, 9.3–9.7, 12.5–12.6 |
| I.1: I.10, classical and dyadic endpoints | 3 | §§12.1, 12.3–12.4 |
| I.8: L0, circular units | 17 | §§1.1–1.8; existing primitive-root and CM boundaries |
| I.8: I.8, bounded complex and CM twist | 4 | §10.1; §11.1 |
| I.8: I.9, modified limits and integral theorem | 6 | §§10.6, 11.2–11.7 |
| I.8: L1, rational cyclotomic comparisons | 5 | §§2.7, 3.5, 7.2–7.4; supplied four-term sequence |
| I.8: L2, inertia control and growth | 6 | §§3.1–3.4 |
| I.8: L3, Vandiver | 5 | §§7.1–7.4 |
| I.8: L4, Leopoldt and independent μ-vanishing | 10 | Layers 4–5; §3.4 |
| L1: L1, unit and module dictionaries | 6 | §§2.4, 2.6–2.7, 3.5, 7.2–7.3 |
| L1: L2, towers, growth, rank and norm descent | 7 | §§0.2–0.3, 3.1–3.4, 6.4 |
| L1: L3, Vandiver and zeta normalization | 2 | §§7.1, 7.3–7.4 |
| L1: L4, logarithms, Sinnott, reflection and digits | 12 | Layers 4–5; Washington's non-p-part theorem is supplied by OrdinaryAutomorphicFormsAndModularityLifting §5.9 |

The last entry is an ownership deferral, not a missing Ferrero–Washington step.
Washington's theorem about primary components different from the tower prime is
a different result. The package keeps the independent all-prime arithmetic
μ-vanishing proof and its norm descent.

The library-coverage audit was checked against actual declarations. The
elaboration build reports Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
the prescribed Mathlib pin. The prescribed Tau Ceti pin is `f790474`; this file
uses no Tau Ceti declarations in Lean and imports only Mathlib. Current-library
and roadmap searches were additionally made against:

- Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`;
- its Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`;
- TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`.

I searched mathematical objects, operators and hypotheses, including completed
algebra projections, cyclotomic-root ratios, maximal real fields, class norms,
ray-unit maps, unit indices, Fitting base change, transpose conventions,
cohomology, and weighted local Ribet outputs. The nine newer roadmaps and the
four named Completed roadmaps were included. No build was run in those checkouts.

## Corrections applied

1. **Full cyclotomic character versus principal character.** The conventions had
   used one κ both for the full character and for the character on the
   torsion-free quotient. They now distinguish κ and κ_Γ. An actual Tate twist
   uses κ and must factor through the relevant group before being written in
   the Γ-coordinate. The explicit dyadic witness is K=ℚ(√−2): a generator can
   have full value 3 modulo 8 and principal value −3=5 modulo 8. Its full
   cyclotomic group is torsion-free, but its sign character is nontrivial.
   The Frobenius and Lean coordinate descriptions were corrected consistently.

2. **A weakened headline was removed from Lean.**
   `integralMainConjecture_of_finiteSelmerFitting` was an equality of two arbitrary
   principal ideals assuming equality of all their finite images. Its conclusion
   did not state an arithmetic main conjecture. It was redundant with the
   stronger ideal-continuity milestone and was deleted. The full all-prime
   `integralDeterminantMainConjecture` and `arithmeticTwoTermPresentation` remain
   in §11.7 with their actual arithmetic objects and proof route. No carrier was
   replaced by admitted data or an ad hoc encoding to force those targets into Lean.

3. **Existing cyclotomic-unit algebra is imported.** Removed the new-target claim
   for integral invertibility of the primitive ratio and for association of
   primitive differences. Mathlib already has `IsPrimitiveRoot.geom_sum_isUnit`
   and `associated_sub_one_pow_sub_one_of_coprime`. The retained arithmetic
   target computes normalized prime-ideal valuation one and then obtains the
   circular-unit generators. This is stronger arithmetic data than association.

4. **Existing real-field and CM APIs are imported.** The boundary now names
   Mathlib's maximal real subfield, cyclotomic CM structure, Hasse-index bound,
   and regulator comparison, and Tau Ceti's explicit inversion-fixed-field and
   even-character identifications. The compatible tower and relative full/real
   norm comparison remain new. The prime-power Hasse-index-one theorem also
   remains new; the general index-one assertion would be false.

5. **Existing ray-unit exactness is imported.** Tau Ceti's
   `Global.RayClass.Exact` already constructs the ordinary ray-unit sequence,
   including real signs. The package now imports its carrier and exactness
   declarations. Section 8.2 constructs the S-depleted quotient and derives
   `sRayUnitExactSequence` using S-unit localization. Its negative control now
   requires a zero *ray* class: ordinary principality alone does not imply the
   congruence needed for ray principality.

6. **Minus-class and S-class hypotheses are explicit.** Odd-prime injectivity and
   absence of finite submodules are stated for the cyclotomic CM tower, rather
   than every CM tower. The uniform S-class capitulation bound has the source's
   fixed `S⊇S_p∪S_∞` hypothesis. The ordinary wide-class statement is separate.
   The ordinary Ritter–Weiss construction now explicitly assumes `S⊇S_∞`;
   generalized placement of infinity remains in the generalized construction.

7. **Weighted Ribet supplier mismatch was repaired.** The existing
   `IntegralRibet.local_ribet` supplies the coincident-character local result;
   the existing distinct-character result has global outputs. The package now
   explicitly plans `weightedRibet_distinctLocal` with the required weighted
   local outputs. Both routes retain completeness, Hausdorff topology,
   continuity, irreducibility on reduced fraction factors, and a finite
   containing lattice with its induced adic topology. The named arithmetic
   target `eisensteinFractionLattice_bound` verifies that input. Finite quotient
   and lattice counterexamples were added; the cocycle and local generators
   are both retained in the surjectivity criterion.

8. **The transpose index has an explicit matrix direction.** The higher formula
   uses a presentation `R^r→R^{r+s}→M→0`, so s counts excess generators.
   The relation column `(2,T)` over `ℤ₂[[T]]` gives `Fitt⁰(M)=0`,
   `Fitt¹(M)=(2,T)`, and transpose cokernel `R/(2,T)`. This rules out the
   tempting unqualified equality of zeroth Fitting ideals.

9. **Noncommutative and commutative determinant outputs are separated.** The
   bounded finite Burns–Flach model keeps perfectness for general finite G.
   Its finite-coefficient unit fractional-ideal conclusion is stated for
   abelian G; the general formulation uses relative K-theory.

10. **Source locators were corrected.** The compatible cyclotomic-field paragraph
    now cites Sharifi p. 26 and §3.1, and RJW preprint §9, pp. 45–46. The earlier
    locators described different material. Rognes–Weibel's going-up statements
    are on p. 45, with proofs on pp. 48–49. The Ribet paper's title was corrected.
    The Brumer–Stark paragraph distinguishes the stronger sufficient smoothing
    condition in the displayed Theorem 1.1 from the general root-killing
    deduction using Theorem 2.4 and its proof.

11. **Discriminating checks and layer order were strengthened.** Added or expanded
    dyadic phase-sign, rational-index, logarithm-kernel, integral-character,
    pole-clearing, coefficient-ramification, S-depletion, transpose, local Ribet,
    and determinant-sign checks. Corrected the first full dyadic fields to
    ℚ, ℚ(i), ℚ(ζ₈). Lean declarations now follow their README layers; in
    particular the dyadic correction belongs to Layer 10. Heavy definitions
    remain in the README and closing comment, not as admitted Lean carriers.

No target was replaced by a smaller prime range, by an abelian-over-ℚ restriction
on the integral main conjecture, or by a μ=0 hypothesis on that theorem.

## Source verification

I sampled 15 nonflagged citation occurrences using `random.Random(11095).sample`
from the package's source-bearing paragraphs, and checked every flagged source
route G1–G3 separately. Multiple sampled occurrences in one subsection are
separate checks. Page numbers below use the README's reference versions, not PDF
viewer offsets. The inspected public sources are linked in the package References.
No source passage or source-by-source summary is included in the package.

| Sample | Target | Source actually checked | Result |
| --- | --- | --- | --- |
| 1 | §7.3, Coleman image and conditional arithmetic identification | RJW, Definition 5.18 and Remark 5.21, pp. 147–148; Theorem 12.23, pp. 188–189; Theorem 13.11, pp. 192–195 | Correct: the unit quotient is unconditional; its arithmetic identification uses Vandiver. |
| 2 | §2.1, class-group limits | Sharifi, Definitions 3.2.3, 3.2.17–3.2.18, pp. 78, 83; Kurihara §3, pp. 15–17 | Correct norm/direct-limit direction and compact/discrete distinction. |
| 3 | §12.2, induction and going up | Greenberg 1983, Propositions 1–3, pp. 78–80, identities pp. 80–83, Proposition 5, pp. 84–85; Rognes–Weibel, Theorem A.2 and Corollary A.3 | Corrected the latter statement locator to p. 45; proofs pp. 48–49. No general μ comparison is supplied by going up. |
| 4 | §11.1, integral CM twist | Kurihara, equation (11), pp. 23–24 | Correct: the full cyclotomic character changes the minus relation to the plus relation. |
| 5 | §0.4, arithmetic completed action | Sharifi, Definition 3.2.2 and Remark 3.2.5, pp. 78–79; Kolster 2009, p. 7 | Correct: conjugation is lift-independent on the abelian kernel. |
| 6 | §2.8, real-unit square classes and capitulation | NSW, Proposition 11.1.9, p. 730 and §11.2; Sharifi, Proposition 3.3.9, pp. 86–88; Kolster 1989, pp. 249–250 | Added the S-class hypothesis; retained the rank-d conclusion and finite errors. |
| 7 | §8.4, Ritter–Weiss module | Dasgupta–Kakde, Appendix A, equations (133)–(150), Definition A.2, Lemmas A.1, A.3–A.5, pp. 78–86 | Added ordinary `S⊇S_∞`; kept the generalized alternative. |
| 8 | §5.7, digit obstruction | Oesterlé, Propositions 1–2 and §§3–4, pp. 173–175 | Correct as an independent comparison, not an input from a main conjecture. |
| 9 | §1.8, circular logarithm and correction | Sinnott 1980, Propositions 4.1–4.2 and the corollary before Theorem 4.1, pp. 203–207 | Correct rational lattice index and power-of-two correction for the stated norm convention. |
| 10 | §8.2, smoothing exact sequence | Dasgupta–Kakde, §3.3, equation (37), p. 23; Kurihara §2.5, p. 11 | Correct with the image of units retained; ordinary carrier/exactness moved to its current-library boundary. |
| 11 | §1.4, cyclic real circular units | RJW, Corollary 12.19, p. 186 | Correct including sign torsion; the conjugate product is −1. |
| 12 | §5.7, dependent-root arrangement | Washington 1978, Proposition 2 and proof, printed pp. 91–92 | Checked the correct printed pages; handles the dependent-basis case rather than assuming independence of all representatives. |
| 13 | §12.5, integral Brumer–Stark units | Dasgupta–Kakde, Theorem 1.2 and equation (5), pp. 4–5; DKSW, Theorem 1.1, p. 4, Theorem 2.4 and proof, pp. 8–10 | Explained the root-killing generalization using Theorem 2.4; preserved the anti-unit and congruence conclusions. |
| 14 | §1.1, compatible fields and real subfields | RJW arXiv:2309.15692v2, §9, pp. 45–46; Sharifi, Remark 1.4.9, Definition 1.4.10, Example 1.4.11, p. 26, §3.1, pp. 75–76 | Replaced incorrect original locators. Finite-field identifications are also supplied by the libraries. |
| 15 | §5.4, odd-prime mirror step | Sharifi, Theorem 4.4.2 and proof, pp. 111–113, Proposition 3.4.3, p. 91 | Correct with CM, odd p, and μ_p in the field; no dyadic idempotent is inferred. |

| Flagged route | Original source and checked mathematics | Disposition in the package |
| --- | --- | --- |
| G1: bounded real dyadic model | Burns–Flach, equation (1.9), p. 73; Proposition 1.20, pp. 78–79; ordinary/Tate comparison p. 80; compact duality p. 86 | Section 10.1 gives the actual ordinary global-to-local cone, cancellation of real tails, dimension-shifting truncation, bounded projective resolution and comparison map. It does not substitute a complete-Tate cone. The commutative determinant scope was corrected. |
| G2: general-conductor index | Sinnott 1980, Proposition 2.3, pp. 194–195; §4, pp. 201–208, including the logarithmic and augmentation indices and Theorem 4.1 | Section 1.8 specifies U, g′, the conductor-intersection factors, generalized rational indices, and separate real/imaginary formulas. The norm-generated convention differs from intersection in a larger field, as the ℚ(√5) test shows. |
| G3: independent all-prime μ-vanishing | Sinnott 1984, Theorem 1 and proof, pp. 276–277, independence results pp. 277–279, Proposition 4.1 and final coefficient calculation pp. 279–282; Washington 1978, pp. 91–92; Ferrero 1978, pp. 9–13; Washington 1975, Lemma 4, p. 184; Oesterlé, pp. 173–180 | The rational-measure proof and canonical pole branch do not use an Iwasawa main conjecture. Reflection, the dyadic rank bound, bounded-degree norm descent, and the dependent digit arrangement are stated separately. The linear numerator coefficient is 1; the dyadic symmetrization contributes 2. |

Additional checks included Dasgupta–Kakde Appendix B, Lemma B.4, p. 93, for the
transpose direction; the weighted local Ribet theorem and Remark 2.2 in
arXiv:2310.16396v2, read from the maintainer-cleared library copy; Kurihara
§4, pp. 22–28, for the finite-to-infinite order; and Kolster 1989, pp. 248–250,
for the covariant dual, finite cokernel and full-series evaluation. The cleared
paper was read in place and was not copied into the repository or scratch.

The I.8 packet still records historical G1–G3 source-access gaps. Packets are
outside this job's write scope. The package supplies the constructions and
locators just checked; the old packet flags are not evidence of an unresolved
package gap after this review.

## Adversarial mathematics pass

Each row covers the definitions, displayed identities, named theorem targets and
API consequences in the cited subsection. I checked domain, coefficient and
map-direction hypotheses before using the examples. The table includes the
standing conventions and supplier interfaces, rather than treating them as
immune from counterexamples. Arithmetic objects not at the pins are tested in
README prose; their tests were not forced into Lean through invented carriers.

| Statements checked | Instances and computation | Result or correction |
| --- | --- | --- |
| Coefficient-ring convention | `#O/π^a=p^(fa)`; `v_π(p)=e`; zero denominator | Retain residue degree and ramification factors; exclude equal-characteristic DVRs from arithmetic coefficients. |
| Layer/exponent convention | ℚ, odd p: first full field has degree p−1; at 2 the first real layer is ℚ(√2) | Layer n and cyclotomic exponent are different. |
| Character and twist convention | ℚ(√−2), full value 3, principal value 5 modulo 8; squares agree | Split full and principal characters; require factorization for Tate twists. |
| Action/dual/Frobenius convention | Quadratic norm sum `1+σ`; three-cycle inverse translate; `χ(Θ)=L(χ⁻¹)` | Norm goes down; contragredient uses inverse; sharp is fixed independently of c. |
| Determinant convention | Differential 2 in degrees (1,2) gives inverse determinant 2; in (2,3), 1/2 | Sign and cohomological placement retained; zero differential has no acyclic trivialization. |
| Existing supplier contracts | Δ=C₂ at 2; arbitrary Fitting scalar change; real ordinary versus Tate cochains | No division by 2, flatness assumption, or real cd₂ bound is silently imported. |
| §0.1 full tower, Δ, fixed field, Teichmüller and base change | K=ℚ at p=3 and 2; μ_q in K; K=ℚ(√−2) | Full and principal character distinction corrected; Δ may be trivial although K(i) differs from K. |
| §0.2 ZpExtension, layers, norms and two compositions | n=0; m=n; quadratic σ=−1 gives extension-after-norm zero | Correct ν_{n,n}=1; norm-after-extension is the scalar degree only downstairs. |
| §0.3 general/cyclotomic ramification and disjointness | Real decomposition group order ≤2; prime norm >1 cannot be a p-adic torsion unit | General tower does not inherit cyclotomic nonsplitting at every finite prime. |
| §0.4 completed action and arithmetic projection | Nonabelian kernel changes lift action; n=0 relation T; dyadic `ω₁=2T+T²` | Abelianness required; existing completed algebra identified arithmetically. |
| §0.4 light layer and transition polynomials | `ω₀=X`; quadratic norm `2+X`; identity transition 1; mod 2 gives `X²` | No division by a possibly zero ω; mixed-characteristic term survives before reduction. |
| §0.5 integral character comparison | Δ=1; C₂ at odd p; at 2 image pairs agree modulo 2; `1−c` is a zero divisor | Added explicit image and regularity controls; characterwise integrality is insufficient. |
| §1.1 compatible fields, real fields, full/real norms | m=1,2 give ℚ; real norm −1 in ℚ(√5) becomes full norm 1; 3→9→27 | Retain e(n)/e(m) and compatible roots; import existing finite-field identifications. |
| §1.2 circular numbers, unit intersections, ratio multiplication | Primitive difference has positive valuation; ratio at exponent 1 is 1 and at 0 is 0 | Unit intersection follows generation; nonvanishing hypotheses on both denominators are present. |
| §1.3 smoothing, cocycle, primitive reduction and valuation balance | p=5,b=2 gives `ζ²+ζ³`; b=−1 gives −1; r=0 and r=a−1 | Phase/action fixed; primitive association imported; arithmetic valuation-one target retained. |
| §1.4 cyclic generation, torsion and norms | Generator conjugate product −1; odd degree norm; dyadic quadratic phase −1 at b=3 | Sign torsion retained; odd-prime norm formula not exported unchanged to 2. |
| §1.5 Hasse index, regulator determinant and unit index | Empty real-unit lattice at p=3; full versus real index; possible general CM index 2 | Prime-power index-one result distinct from supplied general bound/regulator identity. |
| §1.6 dyadic units and index | a=1 gives ℚ; a=2 real field ℚ; b=1,−1,3 | Added four explicit Checks; no inverse of 2 modulo 2^a is used. |
| §1.7 norm-generated abelian circular units | ℚ has circular rational primes but only ±1 as units; ℚ(√5) has ε² rather than ε | Norm convention not confused with intersection in a larger cyclotomic field. |
| §1.8 U, rational index, g′, logarithm and index formulas | `(ℤ:2ℤ)=2`, reverse=1/2; ℚ(i) gives g′=1; rational prime logarithm is nonzero | Generalized index may be rational; roots have zero logarithm; extra discriminating Checks added. |
| §2.1 inverse/direct/S-class limits | Constant finite identity system; a capitulating class; S empty versus killing one prime class | Finite modules survive compact limits; extension and norm systems remain separate. |
| §2.2 units, principal units, closure, defect and Leopoldt | ℚ at 2 keeps −1; residue torsion order p^f−1 dies; uniformizer has a valuation direction | Localization kernel/closed image and S-unit source are specified; defect is not a torsion-free-quotient substitute. |
| §2.3 maximal extensions, split and ramified modules, Artin comparisons | Class number 1; adding real modulus at 2; complex base gives positive ramified rank | Wide class group and real ramification retained; no identification of ramified with unramified module. |
| §2.4 local and global finiteness, direct dual | Compact local reciprocity; finite constant classes; conjugation inverted on dual | Local finiteness precedes global unit injectivity and weak Leopoldt. |
| §2.5 low-degree cohomology and homological rank | Ordinary C₂ mod-2 cohomology persists in high degrees; totally real χ₂=0 | Only degrees 0–2 and the stated rank criterion are used, not finite cd₂. |
| §2.6 weak Leopoldt and cyclotomic theorem | Real dyadic K versus K(i); r₂=0 versus 1 | Adjoining-i descent and divisible-coefficient argument retained; field-level Leopoldt is not assumed. |
| §2.7 augmented finite and infinite reciprocity, Kummer sequence | Norm of −1 across a quadratic step is 1; real signs give one Λ/2 per real place | Inverse unit torsion vanishes while the sign limit remains; discrete Kummer tensor is different. |
| §2.8 norm-minus classes and odd cyclotomic injectivity | Trivial involution on ℤ/6; exact odd idempotent; arbitrary CM tower | Restricted the stronger injectivity assertion to cyclotomic towers. |
| §2.8 uniform ordinary and S-capitulation bounds | n=m has zero kernel; passage to direct limit; S not containing p | Added source's S hypothesis; no ordinary-class injectivity inferred. |
| §2.8 real-unit radical, characteristic and cohomology | Free rank d2^n−1; finite F₂[[Γ]] summand; B=ℤ/4 gives #B[2]=2 | Rank d, not freeness; #B[2], not #B; r=1,B=0 gives vanishing indicated groups. |
| §3.1 one-prime section, control and class-zero propagation | One totally ramified prime; zero base class group; arbitrary abstract noncompact module | Compact Nakayama used only after finite generation; canonical quotient independent of inertia lift. |
| §3.2 general inertia control and kernel transition | Two primes give rank-one `(t,−t)` inertia kernel; n=m gives ν=1 | No bounded-kernel coinvariant shortcut; actual inertia-generated H_m is used. |
| §3.3 tower μ,λ,ν and arithmetic growth | Constant exponent; exponent n; vertical Λ/p^a; negative ν; initial base shift | Correct dyadic full-field list; finite errors change ν; N permits initial exceptions. |
| §3.3 native cyclotomic valuation and growth predicate | p=1 gives 0 but is excluded from theorems; m>0; eventual n−1 | General arithmetic target remains separate from native cyclotomic specialization. |
| §3.4 rank criterion and norm descent | Cyclic order p^n has rank 1; degree prime to p gives no rank correction | μ=0 does not mean bounded order; norm cokernel bounded, not always zero. |
| §3.4 Greenberg predicate | μ=0,λ=1 fails; μ=λ=0 gives eventual constant exponent | Kept conjectural; full class numbers and arbitrary towers are not asserted bounded. |
| §3.5 RJW/Greither/split-class dictionaries and Chevalley formula | Ray limit has a Γ quotient; tame augmentation removes it; ramified infinite place | Torsion ray subgroup not substituted for full ray limit; denominator uses field norms intersected with units. |
| §4.1 logarithmic map and regulator | Root of unity; α=p; nonzero residue-killing power; empty determinant=1 | Source is the unit tensor, not the full multiplicative group; rationalization removes only finite kernel. |
| §4.2 algebraic logarithm and Baker–Brumer | α=p; root of unity; nonzero unit log; ℚ_p versus algebraic coefficients | Kernel includes p-powers; independence is not asserted over all of ℚ_p. |
| §4.3 augmentation representation, cyclic unit and resolvents | G=1 gives zero augmentation; real quadratic rank 1; trivial character resolvent vanishes | Nontrivial χ hypothesis essential; rational descent included before choosing integral unit. |
| §4.4 abelian Leopoldt | Real quadratic infinite-order unit; CM field with Hasse index 2 | Rational CM reduction suffices; no integral index-one assertion for arbitrary CM fields. |
| §5.1 Γ-transform and content | δ₀ gives zero/content ∞; δ₁ gives 1; at 2, δ₁+δ_{−1} gives 2 | No averaging; ramified O uses π-content, not p-content. |
| §5.2 independence, unit restriction and Sinnott content theorem | Zero rational function; η paired with −η; p-denominator in unit restriction | Constants removed by unit support; displayed splitting-field formula does not divide an arbitrary integral measure. |
| §5.3 periodic measure, canonical numerator, μ=0 | Linear numerator coefficient 1; reflection gives twice the measure at 2; pole residue valuation 0 or 1 | Canonical clearing factor fixed; a deeper u or multiplication by p changes normalization and is excluded. |
| §5.4 relative growth and odd mirror inequality | CM field containing μ_p; p=2 lacks integral idempotent | Correct odd-prime scope, analytic proof precedes arithmetic μ conclusion. |
| §5.5 dyadic relative-to-full bound | Relative exponent O(n), full p-rank ≤ twice that exponent plus 1 | Subexponential rank suffices; no unsupported exact minus splitting. |
| §5.6 abelian Ferrero–Washington | Arbitrary p including 2; finite abelian subfield; bounded-degree norm cokernel | Full class μ-vanishing follows without main conjecture and without assuming norm surjectivity. |
| §5.7 digits, positive arrangement and obstruction | Independent/dependent torsion-root basis; p=3 direct case; base ℚ(i) | Independent comparison preserved; dependent arrangement sourced to the original proof. |
| §6.1 Stickelberger element, rationality and Euler factors | ℚ,Σ={∞} gives −1/2; split depletion zero; split smoothing 1−Nv | Minus assertion needs #Σ≥2; inverse Frobenius orientation fixed. |
| §6.2 smoothing, annihilator, clearing ideal and Serre dictionary | Smooth ℚ at 3 gives 1; at 2 gives 1/2 and fails root-killing; shifted pole γ−u | Augmentation clears g, shifted cyclotomic ideal clears θ; denominators and torsion hypothesis retained. |
| §6.3 Deligne–Ribet, numerator and Bernoulli dictionaries | Trivial pole at s=1; type-W pole moves; smoothing/depletion twists differ | Actual measure normalization and interpolation uniqueness used, not arbitrary generator choice. |
| §6.4 arithmetic twists, Euler evaluation and light coordinates | M=Λ/(T); r=0 infinite; inverse exponent; Frobenius value 2 gives 1/2 | Added full-character qualification; finite quotient needs nonzero evaluation; coefficient degree/ramification retained. |
| §6.5 weak/strong main-conjecture predicates and equivalences | Extra π-power leaves distinguished factor; p=37,k=32 gives ω^5; trivial pole | Weak predicate not promoted without μ comparison; integral character quotient retained. |
| §7.1 Vandiver and propagation | p=3 real base ℚ; p=37 irregular but Vandiver; p=2 excluded | Conditional nature and exact odd plus idempotent preserved. |
| §7.2 principal closure, completion and circular comparison | Residue order prime to p; discrete units need not be closed; Vandiver kills real class quotient | Closure lives in the same local unit group; supplied four-term sequence not re-planned. |
| §7.3 Coleman normalization and unconditional quotient | `a(T)=u/(1+T)−1`; `1−u/(1+a(T))=−T` | Denominators nonzero in the Lean scalar identity; T is not erased as a unit. |
| §7.4 conditional cyclic module and components | Nontrivial even tame χ versus trivial χ; trivial component generator TZ₁ | Unconditional unit quotient and conditional ramified identification remain distinct. |
| §8.1 integral minus, duals and lattice pairing | c=−1 gives zero relations; c=1 on ℤ/6; three-cycle; finite M=ℤ/p | Lattice dual zero versus Pontryagin dual order p; generic finite-dual Fitting equality not assumed. |
| §8.2 S-depleted ray group and S-unit sequence | T empty; adding zero/nonzero ray class; ℚ(μ₃),T={7} yields C₆ | Import ordinary ray group/sequence; clarify ray principality; retain unit image. |
| §8.2 Sinnott–Kurihara and p-modification | Trivial inertia gives unit factor; p-inertia projector nonintegral; zero module Fitting=R | Integral generator expansion, not integrality of each rational factor. |
| §8.3 arithmetic Selmer and finite valuation presentation | Σ=S∞ at odd p; auxiliary S′ not killing classes; dyadic unit-dual term | Correct exact sequence and independence require the specified S′ and smoothing hypotheses. |
| §8.4 ordinary/generalized Ritter–Weiss and projective comparison | One-by-one zero matrix; move infinite place to smoothing; change S′ twice | Added ordinary infinity hypothesis; square presentation does not imply injectivity. |
| §8.5 transpose and higher Fitting formula | One relation `(2,T)` into two generators; transpose presents R/(2,T) | Explicit excess-generator direction and negative control added. |
| §8.5 extension class and universal cocycle map | Zero cocycle, nonzero permitted local x_v; all data zero | Image needs both cocycle and local generators; all-zero map surjective only to zero. |
| §8.6 relative cardinality and inclusion-to-equality | ℚ(μ₃),T={7}: integral minus ray quotient C₂; trivial-zero component | Odd character product alone insufficient at 2; equality is a family-level argument. |
| §9.1 ordinary Eisenstein ideal, full-form duality and congruence module | ξ unit gives zero cuspidal localization; a₁(aE)=a; p=691,k=12 | First coefficient supplies saturation; full quotient Λ differs from cuspidal Λ/(ξ). |
| §9.2 ordinary Tate limit, matrix congruence, cocycle and divisibility | c=0 on ordinary inertia; ξ unit; k=0 pole branch | No integral Hecke rank-two/Gorenstein claim; full/cuspidal and source twists retained. |
| §9.3 finite-weight Hilbert spaces and three congruences | F=ℚ and odd-degree F; standard cusp zero only; dyadic auxiliary Frobenius c | General degree and all cusps retained; local x and dyadic divided theta have specified integrality inputs. |
| §9.4 Hecke homomorphism and regular-factor cancellation | x=0,A=0,J=R is a counterexample; A unit; cyclic quotient without U-test | Regularity and the stronger stabilized U-test required. |
| §9.5 representations and oldform local comparison | Repeated-root oldform algebra nonreduced; zero Hecke factor; each reduced fraction field | Absolute irreducibility and actual ordinary quotient retained before forming P_ρ. |
| §9.6 weighted local inputs, arithmetic lattice and two Ribet variants | Residual characters coincide at 2; unbounded p^(−n) has no finite lattice; P_loc empty gives weight 1 | Distinct local extension and arithmetic lattice verification explicitly named; topology hypotheses restored. |
| §9.6 finite Ribet quotient and surjection | N₀=ℤ_p,I=0,m=1 gives ℤ/p; m=0 gives zero; local y survives a zero cocycle | Tests added; p^m in (A) needed to remove coefficient error. |
| §9.7 finite keystone and modified Selmer Fitting identities | t=0; t=d; finite split-prime zero determinant; nonregular minus order | Divided theta is integrally justified; square free presentations need not be injections. |
| §10.1 finite bounded complex and perfectness | Real C₂ has nonzero H^(2j); finite coefficient ℤ/2; general nonabelian G | Real tails canceled, not denied; commutative finite determinant conclusion scoped to abelian G. |
| §10.1 tower Burns–Flach model and cohomology | F=k; cofinal subtower; H³=ℤ_p nonzero; totally real H² torsion | Intrinsic trace maps and canonical total-fraction trivialization retained. |
| §10.2 arithmetic global/compact-support instances | H⁰_Iw of Tate module zero; finite level ω_n-annihilated; real dyadic ordinary tails | General supplied complexes identified arithmetically; bounded real compact-support model used explicitly. |
| §10.3 derived descent, Tor sequence and finite errors | H³=ℤ_p has invariant term; E=ℤ/p has both terms of order p | Finite ray module larger than naive coinvariants; finite errors canceled only in Euler quotient. |
| §10.4 arithmetic Euler quotient and inverse determinant | f=T,n=0 infinite; differential 2 in two degree placements; unit/zero differential; rank zero | Nonzero evaluation and regularity stated; full π^μ retained. |
| §10.5 twisted descent and local S-enlargement | n=0 would leave inflation terms; added v away from p; p=2 always has μ₂ locally | Character factorization and derived coefficient changes retained; local factor is 1−Nv⁻¹Frob. |
| §10.6 dyadic Kummer dual and two exact sequences | H¹(C₂,D)=D[2], H²(C₂,D)=0; real-unit radical rank d; finite cokernel ℤ/2 | Distinct origin of vertical 2^d and finite error; no idempotent exactness used. |
| §10.6 dyadic correction and periodic parity | d=0,1,2 gives ideals 1,2,4; sign interchanges odd/even real cohomology | Correction is vertical; finite module alone cannot supply 2^d. |
| §11.1 CM twist and analytic square | τ(c)=−c; τ#(σ)=ε(σ)σ⁻¹; twist changes ω_n | Full ε used before real quotient; twisting does not preserve old finite-layer ideals. |
| §11.2 modified Selmer limit, top control and T-triangle | Smoothed unit torsion not killed; T∩S nonempty; finite trivial zero | H³ vanishing and derived top edge map required; inverse-limit definition alone is insufficient. |
| §11.3 joint ideals and Fitting continuity | n=0 gives T; a=0 gives R; O=ℤ₂[C₂]; M=0 and R; ideals (p,T) versus R | Closed ideals separated in actual joint quotients; no arbitrary inverse-limit Fitting claim. |
| §11.4 square presentation and relation lifting | M=0,r=0; M=R zero relation; noncofinal ideal system | Minimal cover, Artin–Rees and actual binomial decay used; injectivity requires later regularity. |
| §11.5 modified arithmetic Fitting and ramified comparison | Finite zero determinants versus infinite analytic nonvanishing; p=2 cokernel ℤ/2 | Untwisted control precedes τ; finite correction retained. |
| §11.6 height-one comparison and lattice detection | Ideal (p,T) has unit height-one localizations but is proper; nonnormal group order | Only invertible fractional lattices over reduced S₂ order are detected; no vertical DVR claim. |
| §11.7 integral main conjecture and arithmetic presentation | F=k; augmentation H³; nontrivial finite character; t=0 forbidden | Full generality retained; P₁,P₂ built from bounded complex, not postulated with desired Fitting ratio. |
| §12.1 classical/strong formulations and μ scope | Prime-to-p versus p-power character; trivial augmentation; π-content | Distinguished Wiles equality not silently treated as general μ-vanishing. |
| §12.2 induction, inflation and going up | e=0,1 generator substitutions; nonreal value of even character; moved pole | Statements/proofs locators corrected; analytic G/H, not just numerators, is induced. |
| §12.3 odd/dyadic special values | F=ℚ,n=2: v₂(ζ(−1))=−2, v₂(w₂)=3, H² order 2 | H³ denominator retained; odd-prime ω² component is not dropped. |
| §12.4 covariant module, Kolster involution and finite comparison | Apply γ↦uγ⁻¹ twice; at γ=u² evaluate u⁻¹; D with action 3 | Full f_F includes μ; discrete invariants not coinvariants; finite Tor terms retained. |
| §12.5 higher Fitting, SK and Brumer–Stark | Odd p versus 2; d=1 classical case; d=2 refined unit; general root-killing T | Full SK formula only away from 2; all-prime integral annihilation and actual anti-unit construction retained. |
| §12.6 exterior bidual and Rubin lattice | r=0; ℤ rank 1 excludes 1/2; ℤ² rank 2 excludes half a basis wedge; r>rank | Bidual saturation not assumed equal to ordinary exterior lattice over a group order. |
| §12.6 unit lattice, order map and higher-rank consequence | r=1 valuation; switch two places changes sign; move split place into S₀ gives zero factor | Split set and depletion set separate; higher-rank integrality asserted after inverting 2 only. |

The worked examples and downstream promises were checked against these same
contracts: the relative norm sign, real sign versus unit limits, circular
norm/intersection distinction, augmentation pole, finite ray group C₆ and minus
C₂, noninvertible ideal (p,T), and the weight-two ℚ computation all agree with the
stated conventions. There is no theorem of Tate's thesis among the targets.

## Ten Lean signature checks

All variables and typeclasses were read with the signature. Definitions have
real bodies, all examples are proved, and there are at most two examples per
kept definition. General number-field towers, bounded complexes, arithmetic
Selmer carriers and determinant trivializations remain README targets. The
closing comment inventories those definitions; it is not an admitted
implementation.

| Signature | README match and falsification check |
| --- | --- |
| `cyclotomicRatio_mul` | §1.2; any field, ζ≠1 and ζ^b≠1. Exponent zero is allowed in the algebraic identity but not in the arithmetic unit theorem. |
| `cyclotomicClassNumberGrowth` | §3.3; prime p, positive conductor multiplier, eventual equation, natural μ and λ, integer ν. p=2 is included. |
| `bounded_iff_mu_lambda_zero` | §3.4; actual growth predicate plus primality. Initial finitely many values have a bound; eventual growth suffices. |
| `mu_zero_of_subexponential_prank` | §3.4; eventual lower bound μp^n≤r_n+C and normalized limit zero force μ=0. No equality with arithmetic μ is assumed without the rank theorem. |
| `ferreroWashington_cyclotomic` | §5.6; positive conductor, any prime including 2, eventual linear class valuation. General abelian-field descent remains in README. |
| `dyadic_rank_subexponential` | §5.5; eventual O(n) relative exponent and all-n rank inequality imply r_n/2^n→0. It is the numerical implication, not a substitute for its arithmetic input. |
| `tateCoordinate_comp` | §6.4; any field and unit u, additive integer exponents. It states scalar coordinate composition; the Tate interpretation keeps the full-character qualification. |
| `coleman_trivial_numerator_identity` | §7.3; u≠0 and 1+T≠0 ensure both divisions legitimate; simplification gives −Tz. The arithmetic Coleman image remains a separate target. |
| `cancel_regular_principal_bound` | §9.4; commutative ring, regular x, actual ideal containment. x=0 over a nonzero ring fails regularity and would give the recorded false generalization. |
| `ideal_eq_of_joint_finite_images` | §11.3; finite free commutative ℤ_p-algebra, all positive coefficient precisions and tower levels. It proves ideal separation, not the arithmetic main conjecture. |

## Validation and handoff

The final `lean-check` run exited 0 with exactly ten warnings, all
`declaration uses sorry`, one per theorem. There are no admitted examples,
admitted data definitions, placeholder propositions, auxiliary-theory chains,
or unused Tau Ceti imports. The file has 298 lines, below the 5,000-line limit.

Read-only input validation also passed:

| Command/input | Result |
| --- | --- |
| `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.1.json` | 68 records; 0 errors, 0 warnings |
| `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--I.8.json` | 53 records; 0 errors, 0 warnings; its three historical source-access flags were checked above |
| `python3 scripts/check_blueprint.py research/blueprint/packets/IntegralIwasawaTheory--L1.json` | 27 records; 0 errors, 0 warnings |

Submission validation passed: `python3 research/blueprint/intake.py check-files`
reported 5 files and 0 problems for all five allowed deliverables, including the
unchanged metadata file. `git diff --check` also passed.

The removals/deferred duplicates are: primitive-ratio invertibility;
primitive-difference association; general CM Hasse-index bound and regulator
ratio; finite inversion-fixed maximal-real-field identifications; ordinary ray
class carrier and unit sequence; and the redundant weakened Lean main-conjecture
surrogate. The first five have explicit existing-library suppliers in the
README. Generic completed algebra, Fitting base change, the supplied rational
odd-prime class/unit sequence, Coleman construction, and Washington's non-p-part
theorem remain supplier boundaries. The stronger arithmetic variants are
explained beside their retained targets. The weighted distinct-character *local*
Ribet extension and arithmetic containing-lattice verification are owned here;
the existing coincident local and distinct global results are not planned again.
No packet or other roadmap was edited and no upstream ownership move was silently
made.

No unresolved mathematical or source-access defect was found in the corrected
package within this review. Implementation of the listed arithmetic constructions
and proofs is future formalisation work, as for every accepted roadmap.
No suspicious instructions were encountered in untrusted issue or source text.
This report contains the durable handoff; source downloads and transient logs are
scratch only and need not be preserved by the next worker.
