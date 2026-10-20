# Independent package review: Eisenstein ideal and rational torsion

Job `REV-PKG-EisensteinIdealAndRationalTorsion~codex2`, issue #11268. Reviewer: Codex, session `codex-iqQKKS`, 2026-10-20.

**Verdict: accepted.** I reviewed the package at `6ba8aeed3cacb34a9381bad21fa28d1adbf3c1d0`, independently of its authors and previous reviewers. All 56 numbered targets, the 51 API items and 39 definition tests of the packet, the additional README Checks, and the ten named Lean declarations were checked. The four previously missing supplier contracts now cover the inputs actually consumed. I found no mathematical correction to make; README.md, Suggested.lean and metadata.toml are retained. This report and the replacement independent verdict are the review deliverables.

Acceptance concerns a mathematical roadmap, not a formal proof. The supplier PRs below were open when inspected. Their authorized targets are present at the specified revisions; this does not assert that they have already merged into upstream main. The consumer must be ported after its suppliers.

## Supplier closure, including hypotheses and ownership

I read the actual supplier README sections, rather than relying on their titles, another worker's description, or a matching identifier. The earlier independent report and the subsequent fix handoff were used to identify the claims to retest, not as evidence that those claims hold.

| Finding | Supplier version inspected | Independent result |
| --- | --- | --- |
| C1: integral differentials, duality and adjoints | [ModularCurvesPartII PR #913](https://github.com/TauCetiProject/TauCetiRoadmap/pull/913), `27ac927ca0300d6bb9e77d892efc9af96d46027f`, §§13.7–13.9 | The relative curve is proper, flat, finitely presented and Cohen–Macaulay of pure relative dimension one; invertibility requires Gorenstein fibres. The pairing and its base change retain coherent local-freeness/base-change hypotheses. The parabolic lattice uses the coarse model; the regular-resolution comparison has its narrower coefficient category. Stack/fine-chart Kodaira–Spencer and the noncuspidal A/B exceptions at 2 and 3 are explicit. The Hecke adjoint is pullback versus proper-duality trace with reversed legs, including bad and inseparable correspondences. No division by the degree or assertion that one cusp detects every composite-level component is used. |
| C2: global admissibility and dyadic groups | [FiniteFlatGroupsAndIntegralPadicHodgeTheory PR #879](https://github.com/TauCetiProject/TauCetiRoadmap/pull/879), `97297b9ce296e3155c5cd25162af1741224b1a25`, §§R07.G1–R07.G8 | The category retains the quasi-finite model and fibre at the omitted prime, not just its generic representation. Lengths count geometric points. Proposition I.1.7's cohomology bound is unconditional on a congruence for P; congruences enter elementary equalities. Rank-one classification is over all of ℤ, with k-rank distinguished from absolute rank. Odd purity is not applied to D. G7 supplies the nonsplit rank-four model; G8 supplies the amalgam with a multiplicative-type M, its rank and connected–étale comparison. Neither supplies the consumer's Hecke saturation. |
| C3: connected Néron comparisons | [NeronModelsAndSemistableAbelianVarieties PR #852](https://github.com/TauCetiProject/TauCetiRoadmap/pull/852), `8e2d6f14740eb87e75f9c1a647f7bbc51b0edb05`, §§6.4a–6.4d | Connected Kummer uses semistability and a quasi-finite flat kernel, with the multiplication transition maps. Localization keeps rational component points and the real-place defect killed by 2. The isogeny comparison gives the six-term kernel/cokernel sequence, not a fictitious short exact sequence. The cotangent theorem concerns a connected abelian-subvariety quotient of a semistable variety under strict e<p−1; it gives free modules and residue-field exactness. It is not replaced by a same-rank isogeny lattice inclusion. |
| C4: cyclotomic class obstruction | [CyclotomicClassGroupsAndStickelberger package](../packages/CyclotomicClassGroupsAndStickelberger/README.md), file at atlas commit `6948494d83330b7e1844a6aacef3643cf422d603`, §§0.2–0.3, 3.2 and 8.1–8.2 | Integral Teichmüller projectors act on the full p-primary ideal class module. The action on ideals is covariant and reciprocity matches conjugation on an unramified quotient. The Herbrand exponent is p−j, with the j=1 exception separate. At p≥5, j=p−2 uses B₂=1/6; at 3 the exceptional theorem applies. The quotient consequence requires L/ℚ Galois. Neither regularity of p nor an arbitrary module vanishing theorem is assumed. The supplier uses ClassFieldTheory and does not depend on this torsion descent. |

The C4 README SHA-256 is `193d993175b0180ca664a5bdcc63427610ea4f33794752955fa9ed8fca141ea5`. In particular, the package's eigenspace assertion concerns p-primary cyclotomic classes, whereas §8.5's full class number at level 13 is separately certified.

The ownership tests give the following concrete results.

- Mazur II Lemmas 17.5 and 17.7 remain §4.5 targets here. The conditions good l≠2, Hecke stability, containment in the ambient η-l kernel, the order-two quotient and the bound on the special étale part are retained. The group D×ℤ/2 has étale special order four and is the explicit counterexample to deriving saturation from the amalgam construction alone.
- Section 6.5 still computes the Eisenstein isogeny kernel and induced component map, factors through image sheaves, and takes the two cohomology sequences. Supplier 6.4c supplies the comparison framework, not this arithmetic computation. Both injectivity and primary nilpotence are used; an injective endomorphism of a nonzero finite group would not suffice.
- The coefficient-equals-level argument in §3.1 uses all-n Raynaud uniformization from Néron §§3.13–3.14. It does not use the distinct-prime Tate filtration or global admissibility outside its range. I read Faltings–Chai III Theorem 7.1 and Corollaries 7.2–7.4, pp.76–77, and §8, pp.77–78, in the cleared library. The generic finite-group sequence includes residue-characteristic n.
- Inseparable degrees and integral trace remain part of the modular correspondence calculation. For Frobenius on the multiplicative group in characteristic p, degree p and one geometric kernel point are different quantities. No point-count substitute for scheme degree enters the consumer.

### Boundary witnesses for the revised contracts

| Contract | Instances examined | Result |
| --- | --- | --- |
| C1 | Genus-zero levels 5,7,13; nodal residue pair a,−a in characteristic 2; P=5 in characteristic 2 and P=7 in characteristic 3 | Zero cuspidal lattices remain zero. The noncuspidal discrepancy has dimension one in the stated exceptional cases. Opposite residues still impose one relation at 2. |
| C1 | a₁=1,a₂=3,a₄=7 under T₂; characteristic P; a differential on a different bad component at level 55 | The first two transformed coefficients are 3 and 9. The bad-fibre integral lattice is retained; neither A=B at P nor detection from the single ∞ expansion is asserted. |
| C2 | Zero group; constant ℤ/ℓ; μ₂; extension by zero at P; k=𝔽(ℓ²) | The constant group's (δ,α,h⁰,h¹)=(0,1,1,0) gives −1 on both sides of the inequality; μ₂ gives (0,0,1,1). Removing the P-fibre changes δ by one without changing the generic group. k-rank one has absolute rank ℓ². |
| C2 | D; M=μ₂; M of rank four; D×ℤ/2 | The amalgam ranks are four and eight, respectively; multiplication of ranks would be wrong. D is unramified at odd P but is not pure, so the odd criterion cannot be extended to 2. |
| C3 | A=0; m=1; a Tate curve; multiplication by p on an additive fibre | The zero cases give zero Kummer groups. The Tate connected kernel has smaller special than generic rank and is not finite flat. The additive case explains the semistability hypothesis. |
| C3 | Tate isogeny E_q→E_(q^m); split product B=A×C; a lattice map ×p | On components the Tate map is r↦mr from ℤ/n to ℤ/mn, leaving cokernel ℤ/m. The product cotangent sequence splits. The ×p lattice map becomes zero modulo p and cannot replace the quotient theorem. |
| C3 | q=2,e=1; q odd,e<q−1; e=q−1 | The dyadic boundary is excluded. The formal kernel remains torsion-free for smooth Néron models with bad reduction under the strict bound. At equality ζ_q−1 is a nonzero torsion point of the multiplicative formal group. |
| C4 | p=5,j=3; p=3,j=1; a zero class group; an irregular prime; a non-normal L/ℚ | The Bernoulli and exceptional cases are separate. One vanishing eigenspace does not imply the whole class group is zero, and the non-normal example does not have the required equivariant quotient. |
| C4 | χ(g)=2 modulo 5; its Teichmüller lift 7 modulo 25 | The inverse values are 3 and 18. On an abstract ℤ/25 with action 18 the inverse quotient is the whole module; with action 7 it is zero since 7−18 is a unit. Arithmetic vanishing uses the actual class group. |

## Target, API and Check audit

Every row below includes the entire retained target and its attached API/Checks, not just the source or dependency sentence. All rows pass; no scope was weakened and no target was removed. The packet's 56 entries match the 56 numbered README subsections in order; all 51 packet API identifiers occur in the README, and all 39 packet tests are retained. New arithmetic and supplier Checks were also examined.

| Target | Adversarial instances and mathematical conclusion |
| --- | --- |
| 0.1 index | At primes 2,3,5,7,13 the index is one; at 11,17,41 it is 5,4,10. The formula uses the positive reduced numerator. At P=1 positivity would fail and the prime hypothesis excludes it. |
| 0.2 full order and ideals | The second projection fixes ℤ, so its scalar kernel is zero; the cuspidal scalar kernel at 11 is 5ℤ. The Fricke sign is −1 whereas the degree of an invertible single coset is +1. The zero cuspidal ring does not make the full order zero. |
| 0.3 integral congruence | P=11 with m=5,25,11; P=17,m=4; P=13,m=1. The criterion is m dividing n, including dyadic information. Positive modulus, P≥5, the separate holomorphic criterion, and the characteristic-P obstruction remain explicit. |
| 0.4 duality and index | T=0 and n=1 give the zero quotient ring. Local rank-one freeness of H¹ is not confused with a selected global generator or with freeness of its dual at every maximal ideal. Integral coefficients retain the 2/3 obstruction. |
| 1.1 cusp subgroup | The two distinct genus-zero cusps have the same Jacobian class; at 11 their difference is nonzero. Changing the base cusp changes the sign. Generic generation, later finite-flat closure, and base change are separate assertions. |
| 1.2 cusp eigenvalues | A scalar multiple of c satisfies T_l=(1+l) and w=−1; n=1 makes the relation zero without imposing a nonzero eigenvector. All good Hecke primes are included. |
| 1.3 components | At 11 and 17 the component orders are 5 and 4; at genus zero the group is trivial. The weighted regular graph includes the j=0 and 1728 exceptional chains, rather than counting only supersingular nodes. |
| 1.4 exact order and integral model | Odd n gives the constant cusp model. Even n retains μ₂ in the integral model and the constant quotient. Specialization at P supplies the exact order and the fibre splitting; no global constant model is inferred from a rational generator. |
| 1.5 Shimura subgroup | Deck degree one at 13 gives the trivial subgroup; at 11 the rank-five subgroup has cyclotomic action. The canonical description is Cartier duality with the deck quotient, with μ_n coordinates requiring a generator. Pullback-kernel and base-change APIs have the proper base. |
| 1.6 intersection and compatibility | Odd n gives zero intersection, even n gives μ₂ as a scheme. This prevents a false dyadic direct sum. The diamond correction in the published erratum is retained. |
| 1.7 component retraction | At 11 the generator maps to itself, zero maps to zero, and every identity-component section maps to zero. The inverse to the stated direct sum is explicitly (x−r(x),r(x)). |
| 2.1 ideal kernel | Unit ideal gives zero, scalar (5) at 11 gives generic rank 25, and containment of ideals reverses containment of kernels. The general bad-fibre closure is quasi-finite, not the full special-fibre endomorphism kernel; admissibility is required only in its Eisenstein uses. |
| 2.2 local data | n=1,5,10 gives respectively no Eisenstein maximal ideals, one at 5, and two at 2 and 5. A candidate ℓ=P is impossible because n divides P−1. Completion acts on the corresponding primary pieces. |
| 2.3 quotient | a=0 gives J and a=T gives zero. At 11, a=(5) retains J. Since [n] is surjective, J/IJ would give zero and is correctly rejected. The actual connected-image quotient has the descent and Hecke universal properties. |
| 2.4 support | Empty versus full closed support agrees with the preceding extreme ideals. The global quotient keeps the union of local supports. Good reduction away from P is inherited by quotient factors; nontriviality is not used before Layer 5 proves it. |
| 3.1 constituents | P=11,ℓ=5 versus ℓ=11, and P=17,ℓ=2. Coincident mod-2 generic characters do not identify integral models. The equal-level inertia argument uses the all-n generic sequence and global unramifiedness. An invariant vector and a nontrivial stable character line are distinguished. |
| 3.2 étale multiplicity | The rank-one dual étale factor is distinct from the rank-two total Tate module. At 2, connected–étale models still differ. The identification with C and the multiplicative quotient is used in its odd range. |
| 3.3 good primes | At (P,ℓ)=(11,5), l=2 passes and l=31 fails the half-difference test. At (17,2), 2 is a square but not a fourth power. This checks the exceptional quartic criterion and the legal inverse of 2 for odd ℓ. |
| 3.4 existence and odd multiplicity | Dirichlet is applied only to a coprime class with nonzero modulus. Odd principality and the rank-two Tate conclusion are supported by the corrected ordinary/Weil-duality argument, rather than the incomplete original proof. |
| 3.5 odd kernel | The two order-ℓ lines at 11 are constant and cyclotomic, so their intersection is zero. At 2 that reasoning would fail and the target explicitly remains odd. Integral primary pieces are included, not merely geometric dimensions. |
| 4.1 winding | The path ∞→0 fixes the sign, the order-five endpoint at 11 rules out integrality of e, and the group-ring basis gives the natural invariant-to-coinvariant map as ×2. No division by 2 in the coefficient ring is introduced. |
| 4.2 quadratic unit | Direct Bernoulli sums at 17,41,73 give B₂,χ=8,32,88 and r=2,8,22. The Fricke transformation f↦−1/f squares to the identity and has product −1. The corrected Siegel product, not equality of orders alone, supplies A=B in the 9 mod 16 branch. |
| 4.3 dyadic embedding | P=17 uses order-four cusp pieces; P=41 cannot, since the relevant C+Σ has rank two. D has nontrivial generic conjugation and only two characteristic-two geometric points, unlike a constant rank-four model. Both construction branches remain. |
| 4.4 plus separation | Scheme intersection with (1+w)J is used, not the plus eigenspace on 2-torsion. The ramified double-cover Picard injection avoids identifying those different objects. |
| 4.5 dyadic local ring | D and D×ℤ/2 separate the valid and invalid saturation cases. The ambient étale bound, good l≠2, Hecke stability and globally stable iterative connected parts remain. The full quotient factors through the minus quotient, including its dyadic factors. |
| 4.6 conjugation module | For both odd coefficients and ℤ₂ the group-ring rank is one, so the underlying rank is two. At 2 the action on D is nonscalar. The factor of two in passage from invariants survives. |
| 4.7 normalized congruence | The formula uses the selected half-lattice identification. At odd ℓ, l=2 permits 1/2; at dyadic l=2, 2=a² modulo P gives φ(a), independent of replacing a by −a. A good prime gives a generator, not a zero congruence. |
| 4.8 winding isomorphism | The odd and dyadic cases use their distinct multiplicity results. Principality and the winding isomorphism are local at every Eisenstein maximal ideal; genus-zero empty support introduces no artificial generator. |
| 5.1 quotient torsion | Zero quotient is harmless. For a nonzero quotient, torsion prime support is Eisenstein and the equivariant torsion is killed by a power of I. Rational points are not assumed to lift through a quotient map. |
| 5.2 Ogg | At 11 and 17 the orders are 5 and 4, including the 2-part. In genus zero both J(ℚ) and C are zero. Retraction and local kernels, rather than rank zero of J, prove the result. |
| 5.3 Shimura maximality | The assertion is about μ-type, with constant Cartier dual. An arbitrary multiplicative-type group with a nonconstant dual is outside that conclusion. The odd/dyadic inputs are not interchanged. |
| 5.4 quotient cusp torsion | C maps isomorphically to both minus and Eisenstein quotient torsion; the plus subvariety's rational torsion is zero. This is stronger than merely counting equal cardinalities and includes n=1. |
| 6.1 cohomology tower | Zero kernel gives zero bounds. The linear terms in δ and α are both md, so their difference is bounded independently of m. Geometric lengths and the h⁰ term are essential, including at 2. |
| 6.2 localized finiteness | The connected Kummer direct limit keeps component corrections. At 2 an inclusion into the finite-place localization kernel suffices for finiteness; equality with Sha at real places is not assumed. |
| 6.3 quotient rank | Exactness of rational points tensored with ℚ is obtained up to isogeny, rather than by lifting every rational point. Empty Eisenstein support gives rank zero of the zero quotient. |
| 6.4 rational quotient points | Rank zero combines with the preceding exact cusp-torsion identification. At n=1 the group is trivial; at 11 it is cyclic of order five. A finite group of the correct size alone would not identify the cusp map. |
| 6.5 odd Sha | Multiplication by 2 on ℤ/9 is injective but does not kill the module; multiplication by 3 is nilpotent but not injective. The actual argument has both properties. The component cokernel is retained and no dyadic vanishing is claimed. |
| 6.6 modular points | The positive-genus hypothesis excludes 2,3,5,7,13, whose rational curves have infinitely many rational points. The projection to the nonzero Eisenstein quotient is nonconstant, giving finite fibres over its finite rational group. |
| 7.1 boundary moduli | Identity-direction μ_P is the width-one ∞ cusp, and an ample subgroup through polygon components is the width-P 0 cusp. Forgetting the subgroup prevents this distinction and is correctly disallowed. |
| 7.2 valuations | Quotient Tate parameters multiply or divide the negative j-valuation by P according to the subgroup. The bare condition v(j)<0 identifies neither cusp. The denominator is a nonzero Tate parameter. |
| 7.3 semistability | The positive-genus prime range includes 11. Additive component bounds and the bounded local semistable extension give e≤6<P−1, so the finite-flat uniqueness argument applies in its stated range. |
| 7.4 small reduction | Hasse bounds and torus orders at 2 and 3 exclude identity-component P-torsion. If reduction at P is multiplicative, the separate finite-flat comparison applies. Full torsion specialization at 2 is never inferred. |
| 7.5 component escape | Distinct cusp reductions at 3 and an odd q≠P are compared in the finite Eisenstein rational group. The nonzero cusp difference and odd good specialization force the contradiction. Local split multiplicative reduction alone would not supply this global step. |
| 7.6 division field | Conjugation on Hom(μ_P,ℤ/P) has χ_P⁻¹, not χ_P. The zero extension gives L=K; the possible nonzero extension has cyclic degree P. Tate and good ordinary cases establish unramifiedness at all finite places. |
| 7.7 cyclotomic obstruction | j=P−2 uses B₂; j=1 at 3 is separate. The equivariant unramified quotient is zero even without a zero full class group. The action and normality hypotheses agree with C4. |
| 7.8 isogeny iteration | Split P-torsion permits a μ_P-isogeny while retaining a constant P-point on the next curve. The pole order at 3 is multiplied by P, distinguishing the resulting j-values and contradicting finite X₀(P)(ℚ). It is not a generic claim that isogenous curves have different j. |
| 7.9 formal immersion | Nonzero optimal new quotient, general N, generic fibre, and p∥N are retained. The reduction corollary uses squarefree N and transitivity on its cusps. At e=q−1 formal torsion gives a counterexample; at odd q below the bound the formal kernel is torsion-free even for a Tate curve. |
| 8.1 model and cusps | The explicit r,s map and inverse fix the moduli identification. Principal-divisor relations have determinant −19; point counts at 2,4,3,9 are 6,6,6,8. Two prime-to-residue injections give torsion order 19. The 21 cusp pairs yield 19 classes with three canonical representatives of one class, proving geometric intersection independently of rank zero. |
| 8.2 diamond order | γ²−γ+1=0 and γ⁶=1 have the specified generator; replacing the polynomial by x²+x+1 changes it. (3+2γ)(5−2γ)=19. Each kernel factor has dimension two inside the dimension-four 19-torsion, and the factor killing rational cusps is labeled πbar. |
| 8.3 finite-flat kernel | Rank is 19², not 19. The nonconstant order-six line is split only after the specified cover and is not admissible in the G-layer sense. Both it and μ₁₉ have zero local invariants at 13, which gives F(ℚ₁₃)=0 without making F the zero scheme. |
| 8.4 local isogeny | π is invertible on the small pro-13 formal group, with inverse πbar/19. The quotient is finite by compactness; injectivity there uses that formal inverse and the zero full local kernel. A determinant statement on the tangent space alone would be insufficient. |
| 8.5 cohomology | The degree-12 cover is prime to 19. The norm-27 element gives degree-three primes over 3, not norm-three primes. All prime ideals below the explicit Minkowski bound are covered by the listed norm elements and their Galois orbits. The global Kummer generator 13 has local valuation one modulo 19. No admissibility bound is applied to the twisted line. |
| 8.6 order 13 | A finitely generated module over the Eisenstein order, surjective under π, has zero free rank. Combining that with the separately computed rational torsion and geometric curve intersection leaves only six cusps. Rank zero alone is not substituted for the intersection calculation. |
| 8.7 occurring orders | Direct rational group addition gives exact orders 2,3,5,7 on the four displayed curves; their discriminants are 64,−27,−11,−1664. Singular cubics and the identity of order one do not supply examples. |
| 8.8 all prime torsion | The five genus-zero prime levels are split off; 13 uses its own descent, while the complementary prime range uses Layer 7. Native nonsingular Weierstrass points and ellipticity match the Lean theorem. Infinite additive order zero is not a prime order. |
| 8.9 residual consequence | For P>7 there are no rational invariant vectors in E[P]. A nontrivial stable line can still exist, as in a rational 11-isogeny; irreducibility is neither claimed nor inferred. |

## Primary-source inspection

For the required random sample I sorted the 56 numeric subsection identifiers and used `random.Random("codex-iqQKKS").sample(..., 15)`. The following are the resulting fifteen, listed in roadmap order. I opened and read the cited primary statements, including the qualifications in their proofs; locators below use printed pages. All match the package.

| Target | Source inspected |
| --- | --- |
| 1.2 | Mazur 1977 II Proposition 11.1, pp.98–99. |
| 1.4 | Mazur 1977 II Proposition 11.1 and equations 11.3–11.4, pp.98–99; §12, pp.103–104; Appendix Theorem A.1 and component calculation, pp.173–180. |
| 1.5 | Mazur 1977 II Proposition 11.6 and proof, pp.99–101. |
| 1.6 | Mazur 1977 II Propositions 11.7, 11.9 and 11.11, pp.100–104; Mazur–Wiles 1984 §8.I, pp.187–188. |
| 3.1 | Mazur 1977 II Propositions 14.1–14.2, pp.113–116, and Lemma 5.10, pp.83–85; the equal-level uniformization source is recorded above. |
| 3.3 | Mazur 1977 II §16, definition and Proposition 16.1, pp.124–125. |
| 3.4 | Mazur 1977 II Propositions 16.1 and 16.6, Corollaries 16.2–16.4, pp.124–128; Mazur–Wiles 1984 §8.I.1, p.187. |
| 4.1 | Mazur 1977 II §18, winding definition and Lemma 18.6, pp.135–137. |
| 5.4 | Mazur 1977 III Corollaries 1.4–1.5, p.143. |
| 6.1 | Mazur 1977 III Lemma 3.2, pp.148–149; I Proposition 1.7, pp.48–49. |
| 6.6 | Mazur 1977 III Theorem 4.1 and proof, pp.151–152. |
| 7.4 | Mazur 1977 III §5, Steps 2–3, pp.158–159. |
| 7.7 | Mazur 1977 I Proposition 2.8 and Corollaries 2.9–2.10, pp.52–54; III §5, third reduction, p.158. |
| 8.3 | Mazur–Tate 1973 §3 corollary, p.45, and §4 lemma, p.47. The latter supplies the finite-flat sequence, while the former is only generic. |
| 8.4 | Mazur–Tate 1973 §4, pp.46–47. |

In addition I checked the source ranges supporting C1–C4, the dyadic saturation, the normalized winding formula, the Néron cohomology descent, and both torsion descents. In particular:

- Mazur 1977 II §3, pp.67–69, §4, pp.75–77, and §§5–6 and 9 supply the integral lattice distinctions, congruence criterion and Hecke pairing. II §§12–13 and 17–18 distinguish the two dyadic branches and the normalized winding formula. III §3, pp.148–151, retains the component computation in the Sha argument.
- Mazur–Wiles 1984 §8.I, pp.187–188, corrects the ordinary/Weil-duality argument, the modular-unit relation and the diamond factor. I inspected both printed pages. The package uses the corrected assertions.
- Mazur 1978 §1(c–e), pp.135–138, especially Proposition 1.3 and Corollary 1.1, and §2(d–e), pp.140–141, supply semistable quotient cotangents and the q-expansion comparison. Proposition 3.1, pp.142–143, and Corollaries 4.3–4.4, pp.144–146, support the general-level formal immersion and squarefree reduction corollary. Bad semistable primes are included.
- Deligne–Rapoport VI §§5.1–5.3, volume pp.282–283, and VII §§1.13–1.16, 2.1–2.7, pp.296–302, were read in the cleared library. Their subgroup and Tate-polygon data support the chosen cusp labels and valuation rule.
- The [Sutherland level-13 model row](https://math.mit.edu/~drew/X1/X1opt13.txt) supplies the equation and r,s moduli map. [Bruin–Derickx–Stoll, §3, p.3](https://www.mathe2.uni-bayreuth.de/stoll/papers/cyc13-v6.pdf) confirms the cusp model and degree-two divisor argument. The package supplies the finite-count and principal-divisor calculations itself, so it does not use rank zero circularly to compute the geometric curve intersection.

Public primary PDFs inspected: [Mazur 1977](https://www.numdam.org/item/PMIHES_1977__47__33_0.pdf), [Mazur 1978](https://www.math.columbia.edu/~goldfeld/Mazur-Goldfeld1978.pdf), [Mazur–Tate 1973](https://gdz.sub.uni-goettingen.de/download/PPN356556735_0022/PPN356556735_0022___LOG_0008.pdf), and [Mazur–Wiles 1984](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0076/LOG_0020.pdf). Cleared books were read in place after consulting the library index. No book file or passage was copied, and no source quotation is committed.

## Independent arithmetic calculations

I used a scratch Python calculation with exact rational arithmetic, integer determinants and explicit finite-field arithmetic. This is independent numerical/algebraic evidence for the stated Checks, not a replacement for the roadmap's general theorem proofs.

- Gcd reduction was checked at every prime up to 10,000. The complete argument for index one is also elementary: P−1 must divide 12, leaving exactly 2,3,5,7,13.
- Direct quadratic-character sums give B₂,χ=8,32,88 at 17,41,73, respectively. Division by four gives the three displayed cusp orders.
- The five principal-divisor relations on the genus-two model give a five-by-five determinant −19, and the displayed cusp residues solve every relation modulo 19. Enumerating the 21 unordered pairs gives every class modulo 19, with only class 15 repeated, exactly three times.
- Direct finite-field enumeration gives affine counts (2,2), (2,0,2,0), (2,0,2), and (2,0,0,2,0,0,2,0,0) over 𝔽₂,𝔽₄,𝔽₃,𝔽₉. Adding two infinity points yields 6,6,6,8 and Jacobian counts 19 at both good primes. The sextic discriminant computed by a Sylvester determinant is −692224=−2¹²·13².
- As an additional model check, the r,s inverse and the Tate-normal-form point of order 13 were tested at all 93 points of the noncuspidal open over 𝔽₁₀₁. This finite-field check does not by itself prove the modular identification; that is supported by the source and the explicit birational formulas.
- Multiplication matrices in the basis 1,ζ,…,ζ¹¹ give norms 13,27,53,79,131,157 for the six elements listed in §8.5. The exact upper bound using π>3.141 and √13<3.606 is `214779077012500000000000000 / 700059811480670979181089 < 307`. Enumerating residue degrees leaves only the ramified prime 13, degree-three primes of norm 27 above 3, and split norms 53,79,131,157. A norm-27 element generates one prime of residue degree three, and its Galois orbit covers the four primes above 3; the split cases are likewise covered by conjugates. The Minkowski criterion therefore applies to every small prime ideal, not merely one prime above each rational prime.
- Exact rational addition on the four displayed Weierstrass models gives the stated prime orders. For the order-seven model the intermediate multiples are (4,8),(2,2),(2,4),(4,0),(0,4), followed by infinity. The discriminants above are nonzero.

## Libraries, duplication and dependency order

I read the actual declarations at the recorded pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These include native nonsingular Weierstrass points and their group, ellipticity as unit discriminant, additive-order conversion, primes in coprime progressions, the Hecke degree map and bundled abelian variety. The class-number criterion, ideal-class Minkowski bound, cyclotomic integral power basis and prime discriminant formula were also read. These declarations supply precisely the carriers and general inputs claimed, not the new Eisenstein arithmetic.

I checked `data/library-coverage.json` and searched every target by mathematical objects and hypotheses in current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27`, including Completed, and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. This included the nine post-snapshot roadmaps and the four named Completed additions. Searches covered ideal kernels and quotient support, cusp and Shimura subgroups, integral Hecke actions, dyadic group extensions, winding, connected cohomology, cyclotomic character components, the genus-two model, class number 13 and prime rational torsion.

The existing modular-form and symbol infrastructure, elliptic reduction and geometric torsion, abstract Hecke operators, class groups and Minkowski results are already deferrals in the package's boundaries. The current ModularCurves Mazur interface expressly leaves Eisenstein ideals and torsion arithmetic to a downstream owner. Its Shimura covering is not the Jacobian subgroup constructed here. ClassFieldTheory's Herbrand quotient is not the Herbrand class-group annihilator, the existing Stickelberger discriminant congruence is not that annihilator, and general lattice class numbers do not give the fixed cyclotomic class-number theorem. No retained target is supplied already by those current trees; no removal or replacement was needed. The read-only trees were not built or modified.

The nearby upstream roadmap models and the supplied upstream guide were used to check form: introductory summary and boundaries, conventions, explicit supplier contracts, ordered layers, source locators, definition APIs, and discriminating Checks. The README is 134059 bytes, below the issue's 200 KB ceiling; it contains no job/packet narrative or source-section synopsis. Metadata is exactly `topic = "math.NT"`.

Port order is a maintainer task: place this new consumer after the finite-flat, Néron, height, abelian-scheme, modular-curve and cyclotomic suppliers. C4 precedes both the global finite-flat class obstruction and this consumer. No ordering file or supplier file was edited. The historical packet still records nine gaps and 23 requests; it is outside this review's mutation scope. Its structural validity is not a claim that those old bookkeeping entries were rewritten or closed.

`upstreamNotes`: finite-flat R07.G5 currently contains its own cyclotomic class-obstruction argument. The new general owner is CyclotomicClassGroupsAndStickelberger §§3.2/8.1–8.2; at port the maintainer can point that input at the owner. This overlap is between suppliers, not a missing consumer hypothesis, and was not changed here.

## Lean and validation

`Suggested.lean` has 90 lines: one `import Mathlib`, one module docstring and namespace, one real-bodied definition, four index API theorems, five other milestone theorems, and two proved examples of the retained definition. There are no admitted data definitions, artificial geometric carriers, auxiliary developments or admitted examples. The closing comment identifies the heavy geometric targets that stay in the README.

All ten named signatures were compared, meeting the requested ten-signature spot check: the index definition and its four API results retain prime hypotheses; the positive-genus descent excludes exactly the five genus-zero levels and includes order 11; the class number uses the native cyclotomic field; order 13 has a separate exclusion; existence of the four allowed orders retains ellipticity; and the final prime-order theorem uses the native rational point group. Generality matches the README in each case.

- Independent `lean-check` of the unchanged Suggested.lean: **exit 0; nine warnings, all `declaration uses sorry`; no errors or other warnings**.
- Independent exact arithmetic checks described above: **passed**.
- `scripts/check_blueprint.py` on the unchanged packet: **zero errors, zero warnings**, 56 nodes and nine planned stages; no claim of packet closure.
- `research/blueprint/intake.py check-files` on all four package files plus the report and handoff: **six files, zero problems**.
- `scripts/check_sorry_data.py` on Suggested.lean: **exit 0**. `git diff --check`: **passed**.

No unresolved mathematical finding remains from this review. Other authors' files and all fetched sources were treated as data. No suspicious instruction to execute code, use credentials or mutate unrelated paths was encountered or followed.
