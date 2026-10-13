# Independent package review: imaginary-quadratic elliptic modularity, round 3

**Verdict: accepted after corrections.** Reviewed by Codex, session
`codex-UNXU75`, on 13 October 2026, for issue #9210. This reviewer authored none
of the three package revisions. The package is ready for the maintainer's draft
TauCetiRoadmap PR under the binding 12 October roadmap shape.

## Scope, fidelity and the previous review

Read the accepted packet, both previous package-review reports, the revision-three
handoff, the complete README and Suggested.lean, PROTOCOL, PACKAGE_REVIEW,
UPSTREAM_GUIDE and the expansion protocol. Used JacobianChallenge and
GlobalNumberFields as the two upstream models, checking both the atlas versions
and current upstream documents. The GlobalNumberFields snapshot differs from
current upstream only in its Suggested.lean link formatting.

All **68 accepted targets**, **69 API entries** and **69 original definition or
construction checks** remain in the README. The 23 objects comprise 18 definitions
and five constructions; each retains three discriminating checks. The two
comparison targets retain their exact hypotheses and comparisons. The eight
layers retain their examples, prerequisites, source locators and endpoint proofs.
Metadata remains the single line `topic = "math.NT"`. The prose is original,
organized by mathematical build order, and has no packet/job/checkpoint narrative.

Round two required four heavy objects and numerous additional APIs and theorems
to become Lean declarations. The binding 12 October rule supersedes that
requirement: statements requiring absent automorphic, compactified modular-curve,
symmetric-power or Jacobian carriers belong in the README. Revision three keeps
the mathematics there and names those boundaries in the Lean section comments
and closing comment. `Modular`, `symplecticTwist`, `cartanCurve` and
`quarticTorsionClasses` are explicitly named there. Their APIs and all earlier
geometric targets remain in the README. Adding sorry-defined carriers to satisfy
the old inventory would violate the present rule.

The 476-line Suggested.lean contains 19 light definitions with real bodies,
20 theorem signatures, three global ellipticity instances and two local
base-change ellipticity instances, and 40 examples. It imports existing Mathlib
carriers. It neither develops supplier theory nor asserts that literal coordinate
identities already construct the geometric comparisons. The broad modularity
endpoints remain exact README targets; their available arithmetic milestones are
the Lean signatures.

## Corrections made

1. Added `OrdinaryAutomorphicFormsAndModularityLifting:R21.4` to the prerequisites
   of `seed_modular`, explicitly using the independently stated AKT CM lifting
   contracts. This makes the seed's independence from the subsequent CM theorem
   visible at its use site.
2. Registered the exact Q-curve interface
   `EllipticCurveModularityPartIIGL2TypeAbelianVarieties:GT.6`. Its quadratic
   application permits a geometric conjugate isogeny. It does not require the
   isogeny to be defined over the quadratic field.
3. Added that interface and `ModularityAndLanglandsExtensions:ML.1` to both
   `genus_one_points_modular` and `genus_two_points_modular`. Their imaginary
   Q-curve arguments and real-quadratic FLHS branches now have explicit suppliers
   in their prerequisite lists.
4. Replaced the indirect Kwon locator with **Theorem 1(iii), pp.144–145**, and
   added the original paper's publicly readable text and DOI to the references.
   Checked its square conditions on the two actual Legendre models.

No mathematical target or check was removed. Suggested.lean and metadata.toml
needed no change. The accepted packet was not edited.

## Sources and locators

Fresh downloads of CN, AKT, FLHS, BOX, BF, ZYW and the five fixed-commit author
scripts all match the accepted packet's eleven SHA-256 values. Read all five
scripts, including their model, torsion, exceptional-point and sieve blocks.
The previously unavailable Zywina author PDF was obtained and Proposition 5.2,
p.6, checked against its hypotheses and its proof. Thus the previously reported
download failure is no longer an unverified locator.

The sampled targets were selected with seed 9210. Every sampled source passage
was opened and read; the table gives the verified locators in the fixed PDF
versions linked by the package. This is in addition to reading CN §§6.1–7.4,
the qualified lifting statement, and the relevant AKT and auxiliary passages.

| Sampled target | Verified primary passage | Result |
|---|---|---|
| `genus_one_rational_picard` | CN Proposition 7.2.2 and Remark 7.2.3, pp.95–96; BF §2, author PDF pp.2–4; ns3ob5.m | Rational Picard image has order two; Jacobian has four rational points. Corrected additive Riemann–Roch numerators agree with the script and fiber equations. |
| `ns3J` | CN Proposition 7.1.3(3), p.94 | Normalizer coordinate gives x³, separate from the actual Cartan conic. |
| `hilbert_local_selection` | CN proofs of Propositions 6.1.5–6.1.6, pp.89–90; AKT Lemma 9.7, pp.75–76, Propositions 9.13–9.15, pp.79–81 | Local conditions, residual-image avoidance and independent seed agree. |
| `mixed_elliptic_model` | CN Proposition 7.1.3(5), p.94; ns3ns5-elliptic.m | Proper normalization and the displayed rational map to B agree. |
| `quadratic_modularity` | CN Corollary 6.1.1, p.87, Lemma 6.2.2, pp.90–91 | Imaginary-quadratic cyclotomic absolute irreducibility supplies genericity. |
| `b5J` | CN Proposition 7.1.3(2), p.94 | Numerator, fifth-power denominator and degree six agree. |
| `Modular` | CN §6.1, p.87, definition preceding Theorem 6.1 | Dual Tate normalization and geometric CM branch retained. |
| `E15` | CN Corollary 7.1.2 proof, p.93 | Legendre form x(x+16)(x+25) retained. |
| `genus_one_points_modular` | CN Corollary 7.2.5, p.97; FLHS §12, pp.18–19 | Geometric Q-curve argument agrees; the lift sign is not inferred from x alone. |
| `automorphic_potentially_multiplicative_ordinary` | CN Lemma 6.1.3(4), p.88 | Auxiliary-prime Steinberg comparison gives p-adic ordinarity. |
| `quadratic_level_fifteen_torsion` | CN Corollary 7.1.2 proof, p.93; Kwon Theorem 1(iii), pp.144–145 | E15 grows over ℚ(i) and ℚ(√5); Es35 only over ℚ(√5). Direct citation added. |
| `elevenExceptional` | CN Corollary 7.3.4 proof, p.98; b3ns5.m final block | Five coefficients use a²−a+3=0; conductor-label conjugacy remains a separate comparison. |
| `automorphic_wd` | CN Lemma 6.1.3(3) and proof, p.88 | Frobenius semisimplification retains monodromy. |
| `gaussianExceptional` | LMFDB 4050.1-c3 curve data; CN Corollary 7.1.2 proof, p.93 | Equation, discriminant and j agree with independent computation. |
| `second_quartic_points_modular` | CN Corollary 7.4.6(2), p.102 | Imaginary restriction and the two CM exceptional pairs agree. |

Also read CN Definition 2.1.27, p.25, and **Theorem 5.2 in §5.1, pp.73–74**;
AKT Theorems 7.1, p.67, and 8.1, pp.71–72; FLHS Theorem 1, p.2;
BOX §2.4 and §3.3, Proposition 3.1, pp.5–6,8–9; and ZYW §1.1, pp.1–2,
and Proposition 5.2, p.6. The CN lifting locator is correctly in §5.1; the
theorem number is not a section number. BOX is used only for the weak 2J
pullback inclusion, as the README specifies.

The [LMFDB record](https://www.lmfdb.org/EllipticCurve/2.0.4.1/4050.1/c/3)
also lists Borel images at both 3 and 5. It supplies the equation and comparison
data, not a shortcut through residual irreducibility. The original
[Kwon paper](https://www.researchgate.net/publication/238854907_Torsion_Subgroups_of_Elliptic_Curves_over_Quadratic_Extensions)
was read directly, rather than inferred from CN's citation. No restricted book
or copied source passage was used.

## Prerequisites and current ownership

Read the reviewed library audit, including the elliptic and Jacobian records.
Read the baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`; distinguished the packet's Tau Ceti
pin `f790474821cf4256814db967cb154e7af3d0c369` from the current library used
for the duplication check below. In particular, checked the real
definitions and hypotheses of WeierstrassCurve, Δ, IsElliptic, j, baseChange,
Affine.Equation, Affine.Point.mk, RatFunc.mk/eval/intDegree, Polynomial.X/eval,
MvPolynomial.X/eval₂ and Scheme.Hom.normalization. Unit discriminant over a
ring is not silently replaced by nonzero discriminant; the latter equivalence
is used over fields. Relative normalization uses quasi-compactness and
quasi-separatedness.

Compared the mathematical objects and hypotheses against current TauCetiRoadmap
at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, including the nine newer roadmaps
and Completed documents. Read the relevant current elliptic Tate-module,
divisor/Picard and rigidified-Picard declarations and the modular-curve twist
and coarse-quotient interfaces. General local Galois and profinite arithmetic
remain supplied by their current roadmaps.

The README already consumes the current divisor-to-line-bundle equivalences,
degree-zero equivalence, rigidified Picard functor and integral Tate representation.
Their Noetherian/integral/DVR, properness, finite-H¹ and section hypotheses are
retained. They do not supply a Jacobian variety for a pointless curve or an
identification of every rational Jacobian point with a rational divisor class.
The existing Tate representation is integral and covariant; it is an ingredient
of the separately stated rational-dual comparison. The retained explicit
mixed-level arithmetic is not a second construction of these general theories.

Walked every target's prerequisites through the eight layers and the supplier
table. No FoundationsAndLibraryIntegration or UPSTREAM bookkeeping IDs remain.
The CM lifting supplier is tier 27, the real-quadratic endpoint tier 26 and
rational elliptic modularity tier 25, all preceding this tier-28 application.
The Q-curve Part II is an explicitly accepted ownership split outside the
94-roadmap ordering; its GT.5–GT.6 route uses rational modularity, GL₂-type
abelian varieties and soluble transport, and does not depend on this application.
The README imports that route rather than moving it here. The CM ordinary,
full-level discriminant, compactification, Picard and certified arithmetic
extensions have named owners and exact outputs, not unqualified title references.

**Removals: none. Ownership moves: none.** The four prerequisite corrections
make existing ownership explicit. Porting still follows the programme's supplier
order; acceptance of this application is not a claim that its suppliers or its
certificate targets have been formalized.

## Adversarial mathematics pass

Every target is named in the following table. The controls distinguish the
stated contracts from plausible stronger or incorrectly normalized alternatives.
Kept checks and source-hypothesis repairs from earlier revisions were independently
rechecked. The only new corrections needed were the supplier and citation edits
listed above.

| Statements and conventions checked | Instances, calculations and boundaries | Change/result |
|---|---|---|
| `Modular`; `automorphic_unique`; `automorphic_all_primes` | Geometric CM is separated from the non-CM cuspidal branch. If covariant Frobenius eigenvalues multiply to q, the dual determinant is q⁻¹; HT(ε)=−1 gives the dual weights {0,1}. Uniqueness means isomorphism class and all-prime comparison uses common coefficients and semisimplicity. | Kept determinant, dual and CM conventions. No claim that an arbitrary p=2 residual input meets the p=3,5 endpoint. |
| `automorphic_wd`; `automorphic_potentially_multiplicative_ordinary` | Good reduction has N=0; a Tate/Steinberg place has nonzero N. Equal semisimple Weil representations alone miss this distinction. The ordinarity argument compares at ℓ≠p before transferring local type. | Kept full Frobenius-semisimplified WD comparison and auxiliary-prime condition. |
| `modularity_transport` | Isogeny, conjugation, quadratic twisting and soluble base change are separate operations. Soluble descent uses a Galois CM extension and non-CM irreducibility; CM is handled separately when a base change ceases to be cuspidal. | No unrestricted descent or cuspidality claim. |
| `symplecticTwist` | The pairing fixes det=ε̄; p=3 retains its sign/rigidification issue. Geometric genus zero is weaker than a chosen ℙ¹ over the base field. Points encode a genuine moduli problem, not a universal family on a coarse curve. | Three checks retain determinant, pairing and genus/local-point distinctions. |
| `solvable_preparation`; `hilbert_local_selection` | Avoidance includes residual and cyclotomic fields; one generic q>5 is split at every relevant place. Local trivialization and disjointness are separate from preserving a generic witness. Nonempty local opens and thin-set avoidance precede global selection. | Kept all local/split/disjointness hypotheses. |
| `seed_modular` | Dyadic image is dihedral, not nonsolvable. At 2 the discriminant valuation is 3 modulo 6 and its conjugate ratio a square; at 3 the valuation is 2 or 4 modulo 6 and the ratio a cube. Changing reduction at 5 does not change this seed. | Added the independent R21.4 supplier; no circular appeal to `cm_modularity`. |
| `switch_five`; `switch_three`; `auxiliary_local_types` | Empty parts of the reduction partition are allowed. The five-switch requires no ζ₅ exclusion; the three-switch does. Retained Tate places force non-CM. Good ordinary and good supersingular have N=0 but differ in potential ordinarity; the prescribed prime is respectively 5 and 3. | Kept correct prime pairing and reduction conditions. |
| `elliptic_lifting_data`; `cm_modularity`; `quadratic_modularity` | Potentially good and potentially multiplicative branches are prepared separately; cyclotomic absolute irreducibility is not ordinary irreducibility. The CM lifting supplier's degree-three/A₄ qualification cannot arise at p=3 or 5, since the cyclotomic degree divides p−1. The separate p=5 projective-field condition remains. | Qualified lifting route retained. Imaginary quadratic genericity is a theorem, not an extra assumption added to its corollary. |
| `shortEquationFamily`; `density_one` | (0,0) is singular; (0,1) is nonsingular. Distinct pairs (0,1) and (0,64) remain separately counted despite scaling-isomorphic curves. Height is a norm on the real coefficient space, with finite lattice counts; nonpositive bounds give no nonsingular pairs. The mod-5 estimate is applied to coefficient pairs, with the nonsingular denominator asymptotic. | Kept literal norm/count and large-height asymptotic scope; no stabilizer weights or undefined ratio at height zero. |
| `cartanCurve`; `nonsplit_cartan_conic` | H contains −I and has surjective determinant. The actual nonsplit Cartan at 3 has conic y²+3x²+36xz+432z²=0; completing the square gives y²+3(x+6z)²+324z², excluding rational points. Its normalizer instead has a rational ℙ¹ coordinate. Mixed curves require proper normalization. | Three checks reject the Cartan/normalizer substitution and the coarse universal-family error. |
| `b3J`; `b5J`; `ns3J`; `ns5J`; `s3J`; `small_curve_models` | Reduced numerator/denominator pairs are coprime. Geometric degrees are (4,6,3,10,6), integer degrees (3,1,3,0,3). Values are b3(1)=1792, b5(1)=38477541376, ns3(2)=8, ns5(0)=0, s3(1)=−1728. ns5(∞)=8000. Poles in field evaluation totalize to zero while the proper map goes to infinity. | Each definition retains three value/pole/degree controls. No function-field degree is inferred from intDegree. |
| `B`; `mixed_elliptic_model`; `B_mordell_weil` | B has a₃=−1, Δ=−675, j=0; (1,2) lies on it and fails the a₃=+1 equation. For A=t²+t−1 and D=(2t+1)(2t²+7t+8), substitute U=−xA²/5, V=D, W=tD into the homogeneous equation; the residual is A⁶(ns5J(t)−x³)/125. Inverse ratios use V≠0 and A≠0. A doubled generator is not saturated. | Exact map identity and inverse formulas checked; omitted charts require proper extension. B's theorem is about its actual point group, with a bijective ℤ-multiple map. |
| `E15`; `Es35`; `level_fifteen_models`; `quadratic_level_fifteen_torsion` | Δ values are 207360000 and 921600. The three nonidentity two-torsion x-values are roots of the respective cubics. Kwon's conditions with (M,N)=(16,25) yield Gaussian growth from 25−16=9 and √5 growth from 4+5=9; (1,16) yields only √5 growth from 1+4=5. Rank zero is an additional hypothesis when replacing the full point group by torsion. | Three checks per model retained; direct Kwon locator added. |
| `gaussianExceptional`; `gaussian_exceptional_modular` | Reducing i²=−1 gives Δ=58752+107136i and j=(−47709+15363i)/256, nonzero discriminant and nonrational j. Conjugating i conjugates all coefficients and invariants. Borel images at both small primes rule out the residual shortcut; the eight new Gaussian torsion orbits require the named Faltings–Serre comparison certificate. | Three coefficient/conjugacy/nonrational checks retained; modularity remains a separate certified target. |
| `ns3b5Quartic`; `genus_one_model` | The −3 factor is a real twist. gcd(h,h′)=1. h(0)=−75, h(−2)=−3, h(−5/2)=−75/16. The projective equation has Y of weight two; x⁴h(5/x)=25h(x) for x≠0. | Three scalar/evaluation/projective controls retained; no ordinary-projective homogenization. |
| `genusOneSpecialPoints`; `genus_one_jacobian` | With s²=−3, the two infinity points have Y=±s and the three affine triples satisfy the weighted equation. Infinity points are geometric, not rational. The Jacobian is 45A2 with four rational points; this does not give a rational basepoint on C. | Coordinate construction and Jacobian comparison remain separate. Three checks retain field and chart distinctions. |
| `genus_one_rational_picard`; `genus_one_quadratic_points` | Rational Picard image has size two, not four. All three corrected additive Riemann–Roch functions give the stated quadratic fibers by substitution. At α=−s their common quadratic leading coefficient vanishes, so one must not divide by it. Descent conics with constants 15 and 12 have no rational point; the −33 conic has (3,2). | Degenerate fibers remain explicitly handled; no identification Pic⁰(C)(ℚ)=Jac(C)(ℚ). |
| `genus_one_points_modular` | For P=(1+2i,3+6i), xσ(x)=5 and σP equals the plus Fricke lift; the minus lift differs. The quotient x-relation yields the geometric degree-five conjugate isogeny without determining the lift sign. Real fields use FLHS. | Added GT.6 and ML.1 prerequisites; retained the sign negative control. |
| `b3ns5Sextic`; `genus_two_model`; `genus_two_jacobian` | Sextic is squarefree, has constant −8 and roots −1,1/3,2. In the infinity chart its leading square 9 gives two rational points with v=±3, exchanged by w₃. Direct counts give #C(𝔽7)=5, #C(𝔽49)=69 and #Jac(𝔽7)=40; at 13 the counts are 13,217 and 180. Their gcd is 20, consistent with the stated torsion. Rank zero still needs its descent certificate. | Three polynomial/model checks retained; point counts supplement, rather than replace, the source's full group and rank certificates. |
| `genus_two_divisor_dichotomy`; `genus_two_quadratic_points` | Sym² includes rational sums and infinity divisors. The canonical degree-two class has its x-fiber family; a noncanonical effective degree-two divisor has a one-dimensional Riemann–Roch space and is unique in its class. The remaining 19 classes split as nine rational-x, two infinity, two imaginary and six real. The exceptional pair satisfies x=(−5+s)/6, y=±(17−s)/6, s²=−11. | Kept exact-degree, field and canonical/noncanonical distinctions. |
| `elevenExceptional`; `eleven_exceptional_modular` | Modulo a²−a+3, Δ=4512−736a and j=(11155375a+3126750)/32. At x=32a−96, t=(−a−15)/9 both small-level j-functions agree with this value, with denominators nonzero in the quadratic field. a↦1−a conjugates the equation. Full normalizer image, not mere containment, supplies cyclotomic absolute irreducibility. | Three coefficient/conjugacy/nonrational controls retained; the script's conductor label and its conjugate are explicitly compared rather than conflated. |
| `genus_two_points_modular` | Galois fixes each rational infinity point while w₃ exchanges them, so σP=w₃P fails there. Rational points use rational j. That equality is used only for nonrational affine points of exact degree two with rational x. Real fields use FLHS. | Added GT.6 and ML.1; kept the corrected rational-infinity branch. |
| `quartic1`; `quartic1Coordinates`; `quartic2`; `quartic2Coordinates`; `quartic_models` | All polynomial monomials have total degree four. M₁²=I and F₁(M₁v)=F₁(v); M₂²=25I and F₂(M₂v)=625F₂(v). det(M₂)=−125, so characteristic five cannot support the projective inverse. Basis-vector evaluations fix coefficients and signs. | Three tests per definition retained. Linear identities may use ring carriers; the geometric involution uses a characteristic-zero field and a nonzero projective vector. |
| `quarticImaginaryPoints` | Both triples reduce to zeros of F₂ under s²=−55; they are distinct and nonrational, with Z=1. Denominators 4,28,56 are invertible in characteristic zero. Their CM j=−32768 requires the separately certified modular map. | Three equation/conjugacy/j-comparison checks retained; a literal substitution is not a j-map proof. |
| `quartic_jacobian_ranks` | The factors have ranks (0,1,0) for C₁ and (1,0,0) for C₂. New/old projectors and w₉'s oldspace polynomial T²−1 matter to the second calculation. | Kept algebraic isogeny/rank certificates, without replacing them by analytic rank. |
| `quarticTorsionClasses`; `quartic_jacobian_torsion` | All four rational support points satisfy F₂. Both quadratic places reduce to F₂=0 and have degree two. D₂ has degree 5(1+1+2−4)=0. Exact orders 10 and 2 and independence require principal-divisor witnesses. C₁ torsion only embeds in (ℤ/2)²; equality is not asserted. | Three divisor/order/independence checks retained; real quadratic support is distinguished from the imaginary exceptional points. |
| `quartic_pullback_indices` | Rank equality plus norm/pullback yields only 2J⊆G+tors. For C₁ the consequence is 4J₁⊆2G₁; for C₂ it is 10J₂⊆5G₂+J₂[2]. G₁ belongs to the other Jacobian. | Kept the weak input and correctly typed G₂ consequence. |
| `first_quartic_quadratic_divisors`; `second_quartic_quadratic_divisors` | First sieve uses I=4, prime 43, reduced order seven and eight divisors covering seven classes. Second uses I=10, primes 11 and 43 and sixteen exceptional divisors: eight rational sums and eight quadratic pairs, two imaginary and six real. The lifted bad-coset intersection must be empty. | Completeness uses the named finite/local certificates; a bounded search cannot replace them. |
| `first_quartic_points_modular`; `second_quartic_points_modular` | First endpoint holds for all quadratic fields via rational j. Second uses the imaginary restriction to discard six real exceptional pairs; its two imaginary exceptions have rational CM j. j=0,1728 need the CM branch instead of the generic quadratic-twist argument. | Field restrictions and CM branches retained. |
| `imaginary_quadratic_residual_modularity` | Ordinary irreducibility at 5 suffices; absolute irreducibility is not imposed here. At 3 the excluded image is the whole split normalizer up to conjugacy, not every subgroup contained in it. | Kept the stronger final criterion and exact exclusion. |
| `finite_level_fifteen_modularity`; `small_imaginary_quadratic_modularity` | Finiteness means all compactified F-points and equals rank zero for E15. For d=1,2,3,5 both rational and −d-twist ranks are zero. Gaussian extra torsion does not imply positive rank. | Kept all-curves modularity conditional on the finite-point hypothesis; no universal imaginary-quadratic claim. |
| `sqrt_minus_ten_infinite_level_fifteen` | At (−1,6s), s²=−10, both sides are −360; dropping s gives 36 and fails the equation. This is a nonrational actual elliptic point. The torsion-growth theorem leaves only rational torsion over this field, so the point is nontorsion. | Kept the concrete negative control to finiteness, without making a nonmodularity claim. |

The independent scratch calculation passed **87 exact arithmetic controls**.
It used rational polynomial reduction and finite-field enumeration, not floating
point approximations. For genus two, the reported Jacobian order follows from
N₁=#C(𝔽q), N₂=#C(𝔽q²), a₁=q+1−N₁ and
a₂=(N₂−q²−1+a₁²)/2, giving
1−a₁+a₂−qa₁+q². These computations independently check the displayed equations,
scalars, field relations and reduction data. They do not prove the proposed
rank, saturation, principal-divisor or sieve-completeness theorems.

## Lean signatures and validation

Spot-checked more than the required ten signatures against the README. The
following representative checks include every layer with declarations:

| Lean signature | Fidelity check |
|---|---|
| `shortEquationFamily.discriminant` | Ring-of-integers pairs map to a number field; field ellipticity and the −16 discriminant agree. |
| `shortEquationFamily.height_count` | Uses a norm on ℝ⊗ℤ O² and actual finite subtype cardinality; no Nat.card-of-an-infinite-set shortcut. |
| `b3J_functionFieldDegree` | finrank over ℚ(b3J) equals four, rather than integer degree three. |
| `ns5J_functionFieldDegree` | Extension degree ten, despite integer degree zero and finite value at infinity. |
| `B_mordell_weil` | An actual affine point and bijective ℤ-multiple map state an infinite cyclic, saturated rational point group. |
| `quadratic_level_fifteen_torsion` | Degree-two number field and actual point groups; growth is compared with rational points via base change. |
| `gaussianExceptional_j` | Characteristic zero, i²=−1 and IsElliptic are present; this is an invariant identity, not modularity. |
| `ns3b5Quartic_fricke` | Nonzero x and characteristic zero cover division and the scalar 25. |
| `genusOneSpecialPoints_on_curve` | Weight-two equation and s²=−3 are present; no unsupported smooth proper carrier is introduced. |
| `b3ns5Sextic_squarefree` | Polynomial squarefreeness is separated from geometric modular identification. |
| `elevenExceptional_j` | a²−a+3=0, characteristic zero and ellipticity are explicit. |
| `quartic_involutions` | Ring identities are over a commutative ℚ-algebra and retain scalar 25/625; projectivization is a separate comparison. |
| `quarticImaginaryPoints_on_curve` | s²=−55 and characteristic zero suffice for coordinate substitution; j is not inferred. |
| `small_imaginary_quadratic_level_fifteen_finite` | Quadratic degree and d∈{1,2,3,5} are explicit; conclusion is finiteness of the actual E15 point type. |
| `sqrt_minus_ten_infinite_level_fifteen` | Actual Point.mk, infinite-order predicate, nonrational y-coordinate and infinite point group, with degree-two field and s²=−10. |

Validation results:

- `lean-check` on package Suggested.lean: exit **0**, **zero errors** and
  **60 warnings**, all `declaration uses sorry`, at the exact pinned Mathlib.
  Lean was run through the shared wrapper; no library build, update, cache
  download or language server was started.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit **0**.
- `python3 scripts/check_blueprint.py` on the unchanged accepted packet:
  **zero errors and zero warnings**; 68 nodes, 69 API entries, 69 tests.
- Independent exact arithmetic: **87 controls passed**.
- Final intake file validation and `git diff --check`: **zero problems**.

## Remaining work

No package-review defect remains. The substantive future formalization targets
are still stated honestly: the supplier adapters and geometric model/j-map
comparisons, rank and saturation certificates, rational Picard descent,
principal-divisor torsion witnesses, full residual-image and Gaussian
Faltings–Serre comparisons, and the two finite sieve certificates. This review
read the source computations and checked their statements and exact elementary
data; it did not rerun Magma or reconstruct those complete arithmetic proofs.
They are the roadmap's planned mathematics, not existing formalization or an
unfinished package review.
