# Modularity of elliptic curves, Part II: imaginary quadratic fields

This roadmap begins with modularity of elliptic curves over ℚ, supplied by `EllipticCurveModularity:R29.6/modularity-theorem`. It develops the applications in §§6–7 of Ana Caraiani and James Newton’s *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3, read on 7 October 2026. The endpoints are their Theorem 6.1, its quadratic and density corollaries, Theorem 7.1, and Theorem 1.1: if F is imaginary quadratic and X₀(15)(F) is finite, every elliptic curve over F is modular. The finite-point hypothesis is substantial. The explicit √−10 example in IQ.8 prevents treating it as automatic.

The plan has eight layers and 68 declaration-sized nodes. Every layer is **planned** at target level. None is **closed**: the sixteen gaps specify missing general interfaces or arithmetic certificates. “Complete” describes this planning pass, not a completed formalization. Every packet node has implementation status `unchecked`.

The first part of the argument constructs modular auxiliary curves with a specified residual representation and specified ordinary, supersingular or multiplicative reduction. An independent Allen–Khare–Thorne seed makes this construction modular before the Caraiani–Newton lifting theorem is applied; this prevents a circular use of the desired endpoint. The second part analyzes exceptional residual images through four explicit modular curves. Their genus-one, genus-two and bielliptic genus-three models require different divisor arguments. The last layer combines these branches and handles the two remaining conductor-fifteen curves under the rank-zero hypothesis.

## Conventions and boundaries

An elliptic curve is represented by the existing five-coefficient `WeierstrassCurve`, with `IsElliptic` expressing invertibility of its discriminant. Over a number field, this is Δ≠0. The covariant rational Tate representation rE,p has determinant εp. The automorphic representation in the source corresponds to its **dual**, with determinant εp⁻¹. Caraiani–Newton use HT(εp)=−1; the imported arithmetic/p-adic Hodge convention uses HT(εp)=+1. The translation reverses weights, rather than replacing a representation by its dual silently. The source-normalized dual has labeled weights {0,1}.

“Modular” is the disjunction of geometric complex multiplication and a weight-zero cuspidal regular algebraic GL₂ automorphic representation realizing this dual Tate representation. If the CM field is already in the base field, the Tate representation can split and the CM branch still applies. Full Weil–Deligne compatibility includes the monodromy operator N. Equality of semisimplified Weil representations alone does not prove the potentially multiplicative Steinberg case.

Decomposed genericity is the existential rational-prime condition from `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`: one rational q≠p splits completely in the number field, and at **every** place above q the representation is unramified and the quotient of its two Frobenius eigenvalues is neither q nor q⁻¹. Distinct eigenvalues by themselves do not establish the condition. Solvable preparation retains a witness q>5 by splitting all its places. Avoidance preserves a residual image only when the corresponding residual field was included in the avoidance field.

All geometric modular curves are smooth proper models of coarse moduli curves. The mixed-level model is a normalization, not the singular raw fiber product. The subgroups contain −I and have surjective determinant. In particular, a coarse quotient does not carry an asserted universal elliptic curve. The actual nonsplit Cartan ns3° and its normalizer ns3 have different curves, joined by a degree-two map. Cusps are j⁻¹(∞). A totalized rational-function evaluation at a pole is zero in Lean’s field operations; it is not a finite geometric j-value.

Rational divisor classes represented by rational divisors and rational points of a Jacobian are distinct objects. IQ.5 gives an explicit two-element rational Picard image inside a four-element rational Jacobian group. A rational basepoint is not assumed for that genus-one curve. In the genus-two argument the canonical degree-two class moves in a projective line of effective divisors, while a noncanonical effective degree-two class has a unique representative. The bielliptic argument works in Sym², including rational sums and irreducible quadratic pairs.

The accepted paper split assigns CN §§2–5 and Theorem 5.2 to `CrystallineLocalGlobalCompatibilityCM`, and Q-curve modularity through GL₂-type abelian varieties over ℚ to `EllipticCurveModularityPartIIGL2TypeAbelianVarieties`. The crystalline sibling now plans `CL.9/thm-5-2`; its qualified theorem is imported, with the p=3,5 qualification discharged explicitly. Its review and formalization remain open (G5). The GL₂-type sibling still has no written stage or reserved node at this checkout; G10 records its exact contract. General residual-image classification is imported from R01.4; general relative symmetric Chabauty and the sieve are imported from ED.4–ED.5. The Bennett–Siksek effective-comparison sibling is separate.

The reusable Cartan/mixed compactification extension is proposed once in `ModularCurvesPartII` after R13.4a. IQ.4 owns the source-specific adapter and coordinate comparisons. Chen/de Smit–Edixhoven Jacobian comparison and the weak rank-equal pullback index theorem belong after R14.2. The independent CM ordinary/dihedral seed requires an `OrdinaryAutomorphicFormsAndModularityLifting` Part II extension. The current ℚ/Hilbert cohomological-weight stage R16.6 needs a CM extension. These proposals preserve one owner for each general construction.

Review routing note: The strengthened switching interface needs the existing geometric-CM carrier from Layer 1 together with a Layer 4 extension proving geometric CM implies potentially good reduction everywhere and Tate reduction gives nonintegral j. Retained Tate places then exclude CM of the auxiliary curve. Route this general theorem once in the local-reduction layer; the application does not prove a private CM/reduction theorem.

## Layer overview

| Layer | Objects and endpoint | Coverage |
|---|---|---|
| `IQ.1` | Modular elliptic curves over number fields | Planned; explicit gaps |
| `IQ.2` | Prescribed-type mod-3 and mod-5 switching | Planned; explicit gaps |
| `IQ.3` | CM modularity and equation density | Planned; explicit gaps |
| `IQ.4` | Cartan modular curves and explicit j-maps | Planned; explicit gaps |
| `IQ.5` | Genus-one curves and rational divisor classes | Planned; explicit gaps |
| `IQ.6` | Genus-two curves and exceptional points | Planned; explicit gaps |
| `IQ.7` | Bielliptic quartics and quadratic divisors | Planned; explicit gaps |
| `IQ.8` | Imaginary-quadratic modularity applications | Planned; explicit gaps |

## IQ.1. Modular elliptic curves over number fields

The modularity predicate provides one common endpoint for the lifting and modular-curve arguments. Its API separates geometric CM from the cuspidal branch. The all-prime comparison uses common coefficient fields and semisimple Chebotarev recognition, while local compatibility requires a purity upgrade that retains N. Isogeny and twist invariance apply over number fields; the stated descent uses a solvable CM extension.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.1`, `PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

### `Modular` — Modular elliptic curves

**Definition.** For a number field F and a Weierstrass curve E/F with Δ(E) ≠ 0, Modular(E) means: either End(E over F̄) is larger than ℤ (geometric CM), or there exist a rational prime p, an isomorphism ι:Q̄p≅ℂ and a cuspidal regular algebraic automorphic representation π of GL₂(𝔸F), cohomological of weight 0, such that rπ,ι≅rE,p∨ as continuous representations of GF. Weight 0 and the Tate-normalized local Langlands convention are those of CN §2. The CM branch does not impose cuspidality.

Hypotheses: F is a number field.; E is elliptic.

Construction or proof:
1. Use the imported geometric endomorphism algebra and GF-action on the rational Tate module of E.
2. Use the GL₂ automorphic carrier and the attached representation from R17 and AG2; make the disjunction explicit.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`, `GL2AutomorphicRepresentationsAndTransfer:R16.6`.

Uses:
- CN Lemma 6.1.3: Separates the non-CM cuspidal branch from geometric CM.
- CN Theorem 6.1 and Corollary 7.1.2: Provides the common endpoint predicate for both global and quadratic-point routes.
- ModularityAndLanglandsExtensions:ML.1: Supplies a precise theorem registry entry beyond modularity over ℚ.

API:
- `Modular.of_cm` (constructor): Geometric CM implies Modular(E), including when the CM field is contained in F.
- `Modular.non_cm_iff` (characterisation): For a non-CM E/F, Modular(E) iff the displayed existence of p, ι, π and the dual Tate-module isomorphism holds.
- `Modular.isogeny_iff` (compatibility): If E and E′ are F-isogenous elliptic curves, Modular(E) iff Modular(E′).

Unit tests:
- `Modular.test_cm` (computation): The smooth curve y²=x³+1 over ℚ(√−3) is Modular through its geometric CM, even though its Tate module splits over the CM field.
- `Modular.test_rational_base` (compatibility): Every elliptic curve E/ℚ satisfies Modular(E), by EllipticCurveModularity R29.6 with the same dual normalization.
- `Modular.test_dual_determinant` (non-example): For p=5 over a number field, det(rE,p)=εp and det(rE,p∨)=εp⁻¹ are distinct characters; an isomorphism to rE,p cannot replace the isomorphism to its dual.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, §6.1, definition before Theorem 6.1, p.87.

Atlas planet: Modular elliptic curve.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G1`.

### `automorphic_unique` — The unique automorphic representation

**Theorem.** If F is a CM field and E/F is a non-CM modular elliptic curve, there is a unique cuspidal regular algebraic π of GL₂(𝔸F) of weight 0 giving the modularity isomorphism. Its central character is trivial; π therefore descends to PGL₂. Uniqueness is up to isomorphism, not equality of a chosen model.

Hypotheses: F is imaginary CM.; E is modular and non-CM.

Construction or proof:
1. Compare characteristic polynomials at almost all good places using the Tate determinant convention.
2. Apply strong multiplicity one; use the determinant-central-character dictionary to obtain trivial central character.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `GL2AutomorphicRepresentationsAndTransfer:R16.4`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Lemma 6.1.3(1), p.88.

Atlas planet: Automorphic representation of an elliptic curve.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G1`.

### `automorphic_all_primes` — Compatibility at every prime

**Theorem.** With E/F and π as in automorphic_unique, for every rational prime p and every ι:Q̄p≅ℂ, rπ,ι≅rE,p∨ as continuous GF-representations. A common coefficient field and semisimple comparison are supplied before concluding an isomorphism.

Hypotheses: F is imaginary CM.; E is modular and non-CM.

Construction or proof:
1. Match the good-place polynomials of the compatible automorphic system with those of E.
2. Apply semisimple Chebotarev comparison and non-CM irreducibility of the Tate module; do not infer the comparison merely from the existential definition.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness`, `AutomorphicGaloisRepresentationsPartII:AG2.7`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Lemma 6.1.3(2), p.88.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G1`.

### `automorphic_wd` — Full Weil–Deligne compatibility

**Theorem.** For E/F and π as above, every p, every ι and every finite place v∤p satisfy WD(rE,p∨|GFv)F-ss≅recᵀFv(πv). Frobenius semisimplification retains the monodromy N. This is an isomorphism of Weil–Deligne representations, not just an equality of their semisimplified Weil representations.

Hypotheses: F is imaginary CM.; E is modular and non-CM.; v∤p.

Construction or proof:
1. Start from Varma’s semisimplified local–global comparison.
2. Use purity of the elliptic-curve local WD representation to upgrade and recover N, following the cited Taylor–Yoshida argument.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes`, `AutomorphicGaloisRepresentationsPartII:AG2.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`, `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

Acceptance:
- At a good place N=0; at a potentially multiplicative place the Steinberg monodromy is nonzero after the appropriate twist.
- No inference from equality of semisimple Weil representations alone is accepted.

Source: CN, Lemma 6.1.3(3) and proof, p.88.

Atlas planet: Weil–Deligne compatibility.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G2`.

### `automorphic_potentially_multiplicative_ordinary` — Ordinarity at potentially multiplicative places

**Theorem.** If E/F is non-CM modular and v|p is a place of potentially multiplicative reduction, then π is ι-ordinary at v of weight 0. For another prime ℓ≠p, full local–global compatibility identifies πv with a quadratic twist of Steinberg; transfer this local type to p-adic ordinarity.

Hypotheses: F is imaginary CM.; E is modular and non-CM.; v|p and E has potentially multiplicative reduction at v.

Construction or proof:
1. Use Tate uniformization after a quadratic extension and the ℓ-adic WD representation.
2. Apply the imported Steinberg-twist ordinarity criterion (Geraghty Lemma 5.6 as cited in CN).

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.1`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Lemma 6.1.3(4) and proof, p.88.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G2`.

### `modularity_transport` — Isogeny, twisting and solvable transport

**Theorem.** For elliptic curves over any number field, modularity is invariant under isogeny and quadratic twist, and is preserved under conjugating the number field. If L/F is a finite Galois solvable CM extension and E/L is the base change of E/F, modularity of E/L implies modularity of E/F. In the non-CM branch use irreducibility of the Tate representation over GL; CM is handled separately. Base change along a finite solvable number-field extension preserves modularity, allowing the CM branch when cuspidality fails.

Hypotheses: Number fields for isogeny, twist, conjugacy and solvable base change; CM fields for the stated solvable descent.

Construction or proof:
1. Transfer isogenies and quadratic twists on the Tate module; tensor the automorphic representation by the same quadratic idele-class character.
2. Use the imported soluble automorphic base-change/descent theorem only in its irreducible case; treat geometric CM directly.
3. Transport the whole datum along a field isomorphism.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `PotentialAutomorphyInfrastructure:PA.5/soluble-base-change-and-descent`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/functoriality-products-and-isogenies`.

Acceptance:
- The 4050.1-c3 calculation can be transported by ℚ(i)-isogeny, field conjugation and quadratic twisting.
- The local monodromy and determinant normalizations are preserved.

Source: CN, Proofs of Theorem 6.1, Corollaries 7.1.2, 7.2.5 and 7.3.4.

## IQ.2. Prescribed-type mod-3 and mod-5 switching

The fixed-pairing twist is a genuine number-field adapter of upstream’s level-moduli construction. Its genus-zero completion need not have a rational point until local preparation supplies one. Selection on the resulting open projective line must simultaneously satisfy all local open conditions and avoid thin exceptional sets. The p=5 proposition does not require ζ5∉F; the p=3 proposition does. The 2–3 seed has no imposed 5-adic reduction condition, which makes prescribed supersingular reduction at 5 possible.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `ModularCurvesPartII:R12.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`.

### `symplecticTwist` — Number-field symplectic level twists

**Construction.** For p∈{3,5}, a number field F and continuous ρ̄:GF→GL₂(𝔽p) with det ρ̄=ε̄p, construct the smooth affine twist Yρ̄/F of the fixed-pairing full-level curve. For every extension K/F its K-points classify pairs (A/K,α), up to isomorphism, where A is elliptic and α:𝔽p²≅A[p](K̄) is a GK-equivariant symplectic identification with the restriction of the given ρ̄, with the standard determinant pairing on ρ̄ matched to the Weil pairing. For p=3 the simultaneous sign automorphism and the actual rigidified moduli problem must be treated through the upstream level-structure construction; no coarse universal curve is assumed. Its smooth proper completion has geometric genus zero.

Hypotheses: p=3 or p=5.; F is a number field.; ρ̄ is continuous with cyclotomic determinant.

Construction or proof:
1. Extend the upstream fixed-pairing descent from ℚ to F without changing its moduli functor.
2. Use determinant=cyclotomic to descend the pairing and twist; identify its base change with the full-level curve.
3. Use genus zero at levels 3 and 5, keeping existence of an F-point separate from geometric rationality.

Direct prerequisites: `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`, `ModularCurvesPartII:R12.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/torsion-and-residual-representation`.

Uses:
- CN Proposition 6.1.5: Allows weak approximation in the affine genus-zero parameter curve while fixing mod-5 torsion.
- CN Proposition 6.1.6: Performs the analogous mod-3 selection with independent mod-5 control.
- EllipticCurveModularityPartII:EC.6: Shares the upstream level-quotient machinery, not the source-specific twists.

API:
- `symplecticTwist.points` (characterisation): The stated K-point classification holds naturally in K/F, with symplectic isomorphisms and the correct isomorphism relation.
- `symplecticTwist.baseChange` (functoriality): For an extension K/F the base change of Yρ̄ is canonically the twist associated to ρ̄|GK; these identifications satisfy identity and composition.
- `symplecticTwist.rational` (compatibility): If the smooth completion has an F-point, its genus-zero curve is F-isomorphic to ℙ¹, and Yρ̄ is the corresponding complement of the cusps.

Unit tests:
- `symplecticTwist.test_tautological` (compatibility): For ρ̄=A[p] in a symplectic basis, (A,id) gives an F-point of Yρ̄.
- `symplecticTwist.test_pairing` (non-example): At p=5, the change of level basis diag(2,1) multiplies the Weil pairing exponent by 2 and is not symplectic; it cannot act as a pairing-preserving identification.
- `symplecticTwist.test_local_trivial` (characterisation): Over a local field K containing μp, the trivial ρ̄ and any A with all p-torsion K-rational yield a K-point after choosing a symplectic basis; geometric genus zero alone does not assert a K-point.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proof of Proposition 6.1.5, p.89; AKT §9, twists in Lemmas 9.6–9.7.

Atlas planet: Symplectic modular curve twist.

### `solvable_preparation` — Solvable CM preparation with avoidance

**Theorem.** Let F be imaginary CM, p∈{3,5}, ρ̄:GF→GL₂(𝔽p) continuous, cyclotomic determinant and decomposed generic, and Favoid/F finite Galois. There is a finite Galois solvable CM extension L/F disjoint from Favoid such that each w|2,3,p is split over L⁺ and ρ̄|GLw is trivial; for every w|p there are local elliptic curves with good ordinary and good supersingular reduction and rational p-torsion; Lw(√−1)/Lw is unramified at w|2; a rational prime q>5 witnessing decomposed genericity splits completely in L. Local degrees and the chosen witness are part of the output. Where ζ5 must be excluded, enlarge the avoidance field by F(ζ5) before constructing L.

Hypotheses: F imaginary CM; p=3 or 5.; ρ̄ has cyclotomic determinant and is decomposed generic.; Favoid/F finite Galois.

Construction or proof:
1. Choose one decomposed-generic rational q and require all q-adic places to split, so the same local Frobenius eigenvalue ratios survive.
2. Construct solvable local extensions trivializing the finite residual images and p-torsion of ordinary/supersingular local curves; make the required places split over the real subfield.
3. Globalize the finite local conditions with disjointness from Favoid and the indicated cyclotomic field; the exact CM globalization theorem is G3.
4. Preserve the finite residual/cyclotomic image by disjointness from its field in Favoid. Do not invoke PA.5/split-test-prime-image-preservation: its enormousness and scalar hypotheses are stronger than the switching hypotheses, particularly at p=3.

Direct prerequisites: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`.

Acceptance:
- The witness q is one rational prime and every place above it is retained, not only one selected place.
- Disjointness from Favoid preserves residual image only if the required residual field was included in Favoid.
- A retained q supplies genericity; full image preservation separately requires the residual field in the avoidance datum. No enormousness assumption is inserted at p=3.

Source: CN, Proof of Proposition 6.1.5, p.89; proof of Proposition 6.1.6, p.90, compared with AKT 9.13–9.15.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G3`.

### `seed_modular` — The 2–3 switching modularity seed

**Theorem.** Let K be imaginary CM and A/K elliptic with discriminant Δ from a chosen Weierstrass equation. Suppose: at each v|2, A is a Tate curve, Kv(√−1)/Kv is unramified, ordv Δ≡3 mod 6, and Δ/Δc is a square in Kv; at each v|3, A is a Tate curve, ordv Δ≡2 or 4 mod 6, and Δ/Δc is a cube in Kv; for M=K(ζ12,(Δ/Δc)^(1/6)), r̄A,3|GM is decomposed generic and its image on GM(ζ3) is conjugate to SL₂(𝔽3). Then A is modular. Here c is the CM involution; the choices of sixth root do not affect the field M.

Construction or proof:
1. Use AKT 9.4 to make the discriminant a real element times a sixth power after the stated solvable extension.
2. Use the 2–3 discriminant-preserving coupling of AKT 9.6: the mod-2 seed is induced/dihedral, extends over K⁺, and satisfies the precise ramified quadratic local conditions of AKT Theorem 7.1.
3. Apply the imported AKT CM 2-adic lifting theorem to the seed and AKT ordinary odd-prime Theorem 8.1 to the mod-3 transfer, then descend. These are open extension contracts G4, not classical nonsolvable dyadic lifting.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `ModularCurvesPartII:R12.4`.

Acceptance:
- No condition at places above 5 occurs; changing the 5-adic reduction does not affect this seed.
- The residue characteristic two hypothesis is dihedral, not nonsolvable; R22.6/R32.3 alone do not supply it.

Source: AKT, AKT Proposition 9.12, using Lemmas 9.4 and 9.11.

Atlas planet: Modularity seed.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G4`.

### `hilbert_local_selection` — Simultaneous local and residual specialization

**Theorem.** After solvable_preparation has made Yρ̄ an open subcurve of ℙ¹L, given nonempty open subsets Ωw⊂Yρ̄(Lw) at all the finitely many selected places and the finite covers encoding auxiliary large mod-3 or mod-5 image, there is an L-point in every Ωw outside the relevant thin exceptional sets. In the p=5 construction impose the AKT 9.7 discriminant-conjugacy, Tate valuation and large mod-3 conditions for seed_modular; independently choose at every w|5 ordinary, supersingular or split multiplicative local prototypes according to the prescribed partition. In the p=3 construction impose Tate reduction at every place above 5 for the ordinary mod-5 seed without constraining the prescribed 3-adic ordinary/supersingular/multiplicative choices.

Construction or proof:
1. Show each reduction condition is locally open on the affine parameter curve and nonempty using the selected prototypes.
2. Use AKT 9.7 to retain the Tate/discriminant conditions at 2 and 3 for p=5; for p=3 choose Tate prototypes at every place above 5. Hilbert specialization avoids auxiliary residual image drops without changing the prescribed p-adic partition.
3. Apply the number-field Hilbert irreducibility theorem with weak approximation; preserve the fixed q witness and the avoidance field.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`, `InverseGaloisAndArithmeticFundamentalGroups:IG.2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Acceptance:
- Every place over the prescribed prime is constrained, not just the chosen lift of a place.
- A point found by finite search is not a substitute for avoiding the thin set.

Source: CN, Proofs of Propositions 6.1.5–6.1.6; AKT Lemma 9.7 and Propositions 9.13–9.15.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G3`.

### `switch_five` — Mod-5 switching with prescribed reduction

**Theorem.** Let F be imaginary CM, ρ̄:GF→GL₂(𝔽5) continuous with det=ε̄5 and decomposed generic, and partition the places v|5 as S5st⊔S5ord⊔S5ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,5≅ρ̄|GL, and ρ̄|GL remains decomposed generic. ζ5∉F is not a hypothesis of this proposition. The construction also retains Tate reduction at every place above 2 and 3, independently of the prescribed 5-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.

Hypotheses: F imaginary CM.; ρ̄ continuous, det=ε̄5, decomposed generic.; The three sets partition every place above 5.; Favoid/F finite Galois.

Construction or proof:
1. Perform solvable preparation and simultaneous selection on Yρ̄ with the specified 5-adic prototypes.
2. Obtain modularity from the independent 2–3 seed; match residual mod-5 representation via the symplectic level identification.
3. Retain the q witness and disjointness; read A over Lw, correcting the printed Fw.
4. Retain the seed’s Tate places above 2 and 3 and deduce non-CM from the CM potentially-good-reduction theorem; the congruence alone does not imply non-CM.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Acceptance:
- Taking S5ss to be all 5-adic places yields an auxiliary curve with good supersingular reduction everywhere above 5.
- The modularity argument never invokes the target CN Theorem 6.1, avoiding a cycle.
- The auxiliary curve is non-CM even when every prescribed 5-adic place is supersingular: retain its Tate places above 2 and 3.

Source: CN, Proposition 6.1.5, pp.88–89.

Atlas planet: Prescribed-type mod-5 switching.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G3`.

### `switch_three` — Mod-3 switching with prescribed reduction

**Theorem.** Let F be imaginary CM with ζ5∉F, ρ̄:GF→GL₂(𝔽3) continuous with det=ε̄3 and decomposed generic, and partition all places v|3 as S3st⊔S3ord⊔S3ss. For every finite Galois Favoid/F there exist a finite Galois solvable CM extension L/F and a non-CM modular elliptic curve A/L such that L∩Favoid=F, A/Lw has respectively split multiplicative, good ordinary or good supersingular reduction for every w|v in the corresponding part, r̄A,3≅ρ̄|GL, and ρ̄|GL remains decomposed generic. The construction also retains Tate reduction at every place above 5, independently of the prescribed 3-adic partition. These Tate places force A to be non-CM because a CM elliptic curve has potentially good reduction everywhere.

Hypotheses: F imaginary CM and ζ5∉F.; ρ̄ continuous, det=ε̄3, decomposed generic.; The three sets partition every place above 3.; Favoid/F finite Galois.

Construction or proof:
1. Add F(ζ5) and the relevant residual fields to avoidance.
2. Construct an auxiliary curve on Yρ̄ with the prescribed 3-adic local prototypes, Tate reduction at every 5-adic place and large mod-5 image.
3. Use the independent ordinary mod-5 AKT 9.14 seed (Theorem 8.1) to prove the auxiliary curve modular, retaining disjointness and the 3-adic generic witness.
4. The retained Tate places above 5 force A to be non-CM; export this witness before choosing its cuspidal representation.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Acceptance:
- The ζ5 condition belongs here and is kept when invoking the ordinary mod-5 seed.
- Supersingular at 3 is allowed; ordinary modularity lifting is used at 5, not incorrectly at 3.
- The auxiliary curve is non-CM even when every prescribed 3-adic place is supersingular: retain its Tate places above 5.

Source: CN, Proposition 6.1.6, pp.89–90; AKT 9.14–9.15.

Atlas planet: Prescribed-type mod-3 switching.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G3`, `EllipticCurveModularityImaginaryQuadratic/G4`.

### `auxiliary_local_types` — Local factors of the auxiliary representation

**Theorem.** For A/L supplied by switch_five (p=5) or switch_three (p=3), A is non-CM by its retained Tate places; let π be its weight-zero cuspidal modular representation with rπ,ι≅rA,p∨. For every w|p above v of F, π is ι-ordinary if v∈Spst; πw is unramified if v∈Spord∪Spss. In the latter case the associated p-adic representation is crystalline with N=0 and is potentially ordinary precisely in the ordinary case. The prime order printed in CN Lemma 6.1.7 is reversed and corrected here.

Construction or proof:
1. Use the retained Tate places in the switching output. CM implies potentially good reduction everywhere, whereas Tate reduction has nonintegral j; hence A is non-CM and has the required cuspidal π.
2. Apply full WD compatibility at an auxiliary ℓ≠p to identify good reduction with the unramified local factor and split multiplicative with Steinberg.
3. Use local p-adic Hodge theory of elliptic curves to distinguish good ordinary from good supersingular reduction.
4. Apply potentially-multiplicative ordinarity to this non-CM A. CM of an auxiliary curve would not establish modularity of the unrelated target E.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.
- A Tate place excludes CM of A; no inference from CM of A to modularity of the target E is used.

Source: CN, Lemma 6.1.7, p.90, and Theorem 6.1 proof.

## IQ.3. CM modularity and equation density

The lifting supplier consumes the dual Tate representation, a residual automorphic point and exactly matching potentially ordinary/crystalline partitions. The theorem keeps ζ5∉F. Its quadratic corollary imports the genericity implication instead of imposing a new genericity assumption. The density theorem counts integral short equations, not curve isomorphism classes: (0,1) and (0,64) count separately despite defining isomorphic curves. Quantitative large-image control is stronger than qualitative Hilbert irreducibility.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.2`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`, `CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `EllipticCurveModularityImaginaryQuadratic:IQ.2`, `PadicHodgeTheory:R06.5`, `PadicHodgeTheory:R06.6`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.Δ`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G3`.

### `elliptic_lifting_data` — Elliptic data for CM lifting

**Comparison.** For an elliptic curve E over an imaginary CM field F and p∈{3,5}, ρ=rE,p∨ is continuous, det ρ=εp⁻¹ and unramified at almost all finite places. At every v|p it is potentially semistable with the source-normalized labeled Hodge–Tate weights {0,1}. For the extension assertion additionally assume the selected residual representation is decomposed generic, fix a witnessing rational prime q>5, and fix a finite Galois avoidance field containing the residual and cyclotomic fields. Then after a finite Galois solvable CM extension disjoint from that avoidance field and splitting every place above q, the potentially good places are Barsotti–Tate (ordinary exactly at the potentially ordinary ones), while the potentially multiplicative places become split multiplicative and the dual local representation is a noncrystalline extension of εp⁻¹ by 1. Translate the imported convention HT(εp)=+1 to CN’s HT(εp)=−1 when using R06; do not swap the covariant Tate module with its dual.

Hypotheses: The determinant, ramification and potentially semistable weight assertions require only E/F elliptic, F imaginary CM and p∈{3,5}.; The witness-preserving extension assertion additionally requires residual decomposed genericity, a fixed witnessing rational q>5 and a specified finite Galois avoidance field.

Construction or proof:
1. Use the Weil pairing for det rE,p and dualize; apply geometric p-adic comparison to E.
2. Classify local reduction into potentially ordinary good, supersingular good and multiplicative.
3. For the conditional extension assertion, choose a generic q>5 using infinitely-many-decomposed-generic-primes, then apply solvable_preparation with that witness and the specified residual/cyclotomic avoidance field. The local comparison assertions themselves remain unconditional.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `PadicHodgeTheory:R06.5`, `PadicHodgeTheory:R06.6`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `ArithmeticGaloisRepresentations:R01.6/elliptic-tate-module-comparison`, `ArithmeticGaloisRepresentations:R01.6/determinant-and-oddness`, `AutomorphicGaloisRepresentationsPartII:AG2.7/infinitely-many-decomposed-generic-primes`.

Acceptance:
- For the source convention the dual, not the covariant Tate module, has weights {0,1}.
- The potentially multiplicative case has N≠0 and cannot enter the crystalline set.
- A curve with no supplied generic witness still has the unconditional local comparison; the witness-preserving extension clause cannot be invoked for it.

Source: CN, Proof of Theorem 6.1, p.90, with Theorem 5.2, p.74.

### `cm_modularity` — CM-field elliptic modularity

**Theorem.** Let F be an imaginary CM number field with ζ5∉F and E/F elliptic. If for at least one p∈{3,5}, r̄E,p is decomposed generic and r̄E,p|GF(ζp) is absolutely irreducible, then E is modular. No Galois-over-ℚ hypothesis is imposed. Decomposed genericity has the existential rational-prime/all-places eigenvalue-nonratio meaning, not merely distinct eigenvalues.

Hypotheses: F imaginary CM with ζ5∉F.; E elliptic.; There exists p=3 or p=5 with both stated residual hypotheses.

Construction or proof:
1. Handle geometric CM directly. For a non-CM E choose a p satisfying both residual conditions and include the residual field and F(ζ5) in avoidance.
2. Produce a modular auxiliary A/L with matching residual representation and reduction partition; auxiliary_local_types supplies the unramified/ordinary local π conditions.
3. Apply CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2 (potentially_barsotti_tate_lifting_qualified) to rE,p∨|GL. Its E12 qualification is automatic here: [L(ζp):L] divides p−1, hence cannot equal 3 for p=3 or 5. Use R01.4 Lemma 6.1.4 for the exceptional p=5 projective-field condition, preserving the full residual/cyclotomic avoidance datum.
4. Descend modularity through the finite solvable CM extension using modularity_transport.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field`, `AutomorphicGaloisRepresentationsPartII:AG2.7/existential-decomposed-genericity`, `CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2`.

Acceptance:
- Theorem applies to non-Galois CM fields when the residual conditions are given.
- The final statement is never extended to ζ5∈F by deleting that hypothesis.
- The supplier’s extra condition d_cyc≠3 or projective image not A4 is discharged by d_cyc|p−1 for p=3,5; its general odd-prime theorem is not silently strengthened.

Source: CN, Theorem 6.1 and proof, pp.87,90.

Atlas planet: CM-field modularity theorem.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G5`.

### `quadratic_modularity` — Quadratic cyclotomic irreducibility criterion

**Theorem.** Let F be imaginary quadratic and E/F elliptic. If r̄E,3|GF(ζ3) or r̄E,5|GF(ζ5) is absolutely irreducible, E is modular. The quadratic-field Goursat/Chebotarev lemma supplies decomposed genericity; it is not an additional hypothesis on E. Since [ℚ(ζ5):ℚ]=4, an imaginary quadratic F does not contain ζ5.

Hypotheses: F imaginary quadratic.; E elliptic.; The restriction for p=3 or 5 is absolutely irreducible.

Construction or proof:
1. Import the quadratic-field genericity lemma from the residual-image owner, with p odd and absolute irreducibility over F(ζp).
2. Use the field-degree exclusion of ζ5 and apply cm_modularity.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity`, `ArithmeticGaloisRepresentations:R01.4`.

Acceptance:
- Absolute irreducibility is on the cyclotomic restriction; irreducibility over 𝔽p alone is not substituted here.

Source: CN, Corollary 6.1.1, p.87, and Lemma 6.2.2, pp.90–91.

Atlas planet: Quadratic irreducibility criterion.

### `shortEquationFamily` — The integral short-equation family

**Definition.** For a number field F with ring of integers 𝒪F, the equation family is the set of pairs (a,b)∈𝒪F² with 4a³+27b²≠0, representing y²=x³+ax+b via the existing five-coefficient Weierstrass curve (0,0,0,a,b). Its ordering is H(a,b)=‖(a,b)‖ for a fixed norm on the finite-dimensional real vector space ℝ⊗ℤ𝒪F² as in Zywina §1.1. Distinct coefficient pairs are counted separately, without isomorphism quotient or stabilizer weights. At X count pairs with H≤X; take the ratio of modular pairs to all nonsingular pairs and its limit as X→∞.

Construction or proof:
1. Import the lattice, norm height, bounded-height finite counting and density framework from ST.0.
2. Map the nonsingular pair into Mathlib WeierstrassCurve; prove its discriminant is −16(4a³+27b²).
3. Use counts of equations, not ℚ-minimal models or elliptic-curve isomorphism classes.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `ArithmeticStatistics:ST.0`.

Uses:
- CN Corollary 6.1.2 / Theorem 1.2: Pins the numerator, denominator and ordering of the density-one theorem.
- Zywina Proposition 5.2: Provides the quantitative exceptional-image estimate on this precise family.

API:
- `shortEquationFamily.mem` (characterisation): Membership is exactly a,b integral and 4a³+27b²≠0.
- `shortEquationFamily.discriminant` (compatibility): The associated Mathlib curve has Δ=−16(4a³+27b²), so the family condition is exactly ellipticity in characteristic zero.
- `shortEquationFamily.height_count` (compatibility): The family’s count at X equals the ST.0 unweighted count of its coefficient lattice points of norm ≤X; no curve-isomorphism quotient enters.

Unit tests:
- `shortEquationFamily.test_zero` (degenerate): (0,0) is excluded because its discriminant is zero.
- `shortEquationFamily.test_one` (computation): (0,1) is included and its discriminant is −432.
- `shortEquationFamily.test_scaling` (non-example): The pairs (0,1) and (0,64) are distinct family elements, although their curves are F-isomorphic by scaling x by 4 and y by 8; a count of isomorphism classes would identify them.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Corollary 6.1.2 proof, pp.87–88; Zywina §1.1 and Proposition 5.2.

Atlas planet: Short Weierstrass equation family.

### `density_one` — Density-one modularity over Galois CM fields

**Theorem.** Fix an imaginary CM number field F, Galois over ℚ, with ζ5∉F, and any norm height of shortEquationFamily. As X→∞, the fraction of nonsingular integral short Weierstrass equations of height ≤X defining modular elliptic curves tends to 1. For d=[F:ℚ], the bad-image fraction is O((log X)^β/X^(d/2)) for a constant β and constants depending on F and the fixed norm, by Zywina Proposition 5.2. This quantitative bound is for failure of the mod-5 image to contain SL₂(𝔽5); modularity failure is a subset. This is not a statement about all imaginary fields, or about isomorphism classes.

Hypotheses: F fixed imaginary CM, Galois over ℚ.; ζ5∉F.; Coefficient pairs are ordered by a fixed norm on ℝ⊗ℤ𝒪F².

Construction or proof:
1. Import the quantitative lattice Hilbert/large-sieve estimate for mod-5 image from ST.2, on the exact integral short-equation family.
2. Import Allen–Newton Lemma 2.3: for F/ℚ Galois, SL₂(𝔽5) in the image implies decomposed genericity; its stronger source definition implies the CN one.
3. Use perfectness of SL₂(𝔽5) and the cyclotomic determinant to retain SL₂ after restriction to F(ζ5), giving absolute irreducibility. Apply cm_modularity and squeeze the counting ratio.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family`, `EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity`, `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field`, `ArithmeticStatistics:ST.2`.

Acceptance:
- The denominator is the number of nonsingular integral equations, not the number of isomorphism classes.
- For F=ℚ(i), the statement yields the specified equation density, while the stronger unconditional curve theorem uses the separate X₀(15) route.

Source: CN, Corollary 6.1.2, pp.87–88 (=Theorem 1.2); Zywina Proposition 5.2.

Atlas planet: Density-one modularity theorem.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G6`.

## IQ.4. Cartan modular curves and explicit j-maps

These coordinates are fixed by the source. In particular the b5 numerator has coefficient 250, and the nonsplit level-five j-function takes value 8000 at infinity. The integer degree of a rational function is not the degree of its map on proper curves. The mixed quotient is the elliptic curve B:y²−y=x³+1. Its rational group is rank one and torsion-free; a saturated generator is an input to the index bounds in IQ.7.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`, `ModularCurvesPartII:R13.4a`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`, `mathlib:RatFunc.mk`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:WeierstrassCurve.Affine.Point.mk`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.Δ`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`.

### `cartanCurve` — Compactified Cartan modular curves

**Construction.** Over ℚ, for a prime p and H⊂GL₂(𝔽p) containing −I with surjective determinant, X(H) is the smooth proper compactification of the imported affine coarse curve YH; j:X(H)→X(1)=ℙ¹ extends its j-map. For distinct primes p₁,p₂ and such H₁,H₂, X(H₁,H₂) is the smooth projective normalization of X(H₁)×X(1)X(H₂). Cusps are exactly j⁻¹(∞). The application subgroups are Borel bp, split and nonsplit normalizers sp,nsp, and actual nonsplit Cartan ns3°. The same formula cannot identify ns3° with the normalizer ns3.

Hypotheses: pᵢ prime, distinct in mixed level.; −I∈Hᵢ and det Hᵢ=𝔽pᵢ×.; Base ℚ, and number-field points in characteristic zero.

Construction or proof:
1. Import YH and the genuine finite group/subgroup carriers. Extend the full-level compactification/finite quotient method to Cartan H, rather than rebuilding quotient or normalization theory.
2. Use the existing relative normalization of the finite map to the j-line and the characteristic-zero regular proper curve dictionary to get the smooth compactification.
3. For mixed coprime level take the normalization of the coarse fiber product and extend all projections and j. The generic extension is proposed once in ModularCurvesPartII; this node specifies the source-specific adapter required by the accepted brief.

Direct prerequisites: `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`, `ModularCurvesPartII:R13.4a`, `mathlib:AlgebraicGeometry.Scheme.Hom.normalization`, `ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers`.

Uses:
- CN §7.1 and Propositions 7.2.1, 7.3.1, 7.4.3: Identifies the explicit models as smooth compactified modular curves, including cusps.
- EllipticCurveModularityPartII:EC.6: Needs the same generic Cartan/mixed compactification extension at rational-isogeny level; no second general construction is appropriate.

API:
- `cartanCurve.j` (projection): There is a finite j-morphism to ℙ¹ℚ extending the affine coarse j-map; its inverse image of infinity is exactly the cusps.
- `cartanCurve.mixed` (characterisation): The mixed curve, with both projections, is uniquely the smooth proper normal model of the coarse fiber product’s function field; on its dense open it is the original mixed level moduli curve.
- `cartanCurve.points` (compatibility): An elliptic E/F with a simultaneous H₁×H₂ orbit of torsion bases fixed by GF gives a noncuspidal F-point with j=j(E). Conversely a geometric coarse point is such a geometric isomorphism class with a GF-fixed orbit; for non-CM j≠0,1728 one may choose an F-model and any two have the same quadratic-twist class. This is a coarse statement, not a fine universal elliptic curve over X(H₁,H₂).

Unit tests:
- `cartanCurve.test_borel` (compatibility): X(b3,b5) is the compactified X₀(15), with cusps j=∞ and rational noncuspidal points representing rational cyclic 15-isogeny level.
- `cartanCurve.test_index_two` (non-example): The map X(ns3°)→X(ns3) has degree two; treating Cartan as its normalizer would give degree one and destroy the branched genus-one/quartic models.
- `cartanCurve.test_distinct_primes` (characterisation): A mixed point from E has ηᵢ⁻¹r̄E,pᵢ(GF)ηᵢ⊂Hᵢ separately for i=1,2; it does not use one residual prime in both conditions.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, §7.1, pp.92–93, definition of X(H) and X(H₁,H₂).

Atlas planet: Cartan modular curve.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G7`.

### `b3J` — b3 j-invariant

**Definition.** Define b3J∈RatFunc ℚ by the rational expression (x+27)(x+3)³/x, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b3) only through the identification in small_curve_models. Its morphism degree is 4; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.

Direct prerequisites: `mathlib:RatFunc.mk`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`.

Uses:
- CN Proposition 7.1.3: Supplies the low-level coarse j-map in a fixed coordinate.
- CN §§7.2–7.4 and accompanying Magma inputs: Forms the mixed-level fiber-product equations and recovers the underlying elliptic j-value.

API:
- `b3J_fraction` (characterisation): b3J is exactly the displayed RatFunc.mk expression (x+27)(x+3)³/x.
- `b3J_eval` (simp): For a characteristic-zero field K, x∈K and the denominator x nonzero, evaluating b3J along ℚ→K at x gives (x+27)(x+3)³/x.
- `b3J_intDegree` (compatibility): RatFunc.intDegree(b3J)=3; the actual geometric j-morphism degree is 4, proved with small_curve_models.

Unit tests:
- `b3J_test_one` (computation): b3J evaluated at x=1 is 1792.
- `b3J_test_zero_j` (computation): b3J evaluated at x=−3 is 0.
- `b3J_test_cusp` (non-example): The reduced denominator of b3J vanishes at 0; totalized field evaluation there is 0 but the geometric j-map has a pole, not a j=0 point.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(1), p.94.

### `b5J` — b5 j-invariant

**Definition.** Define b5J∈RatFunc ℚ by the rational expression (x²+250x+3125)³/x⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(b5) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 1, a different invariant. Cusp evaluation is never read as a finite field quotient.

Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.

Direct prerequisites: `mathlib:RatFunc.mk`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`.

Uses:
- CN Proposition 7.1.3: Supplies the low-level coarse j-map in a fixed coordinate.
- CN §§7.2–7.4 and accompanying Magma inputs: Forms the mixed-level fiber-product equations and recovers the underlying elliptic j-value.

API:
- `b5J_fraction` (characterisation): b5J is exactly the displayed RatFunc.mk expression (x²+250x+3125)³/x⁵.
- `b5J_eval` (simp): For a characteristic-zero field K, x∈K and the denominator x⁵ nonzero, evaluating b5J along ℚ→K at x gives (x²+250x+3125)³/x⁵.
- `b5J_intDegree` (compatibility): RatFunc.intDegree(b5J)=1; the actual geometric j-morphism degree is 6, proved with small_curve_models.

Unit tests:
- `b5J_test_one` (computation): b5J evaluated at x=1 is 38477541376.
- `b5J_test_minus_five` (computation): b5J evaluated at x=−5 is -2194880.
- `b5J_test_cusp` (non-example): The reduced denominator of b5J vanishes at 0, which is a cusp rather than a finite j-value.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(2), p.94.

### `ns3J` — ns3 j-invariant

**Definition.** Define ns3J∈RatFunc ℚ by the rational expression x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns3) only through the identification in small_curve_models. Its morphism degree is 3; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.

Direct prerequisites: `mathlib:RatFunc.mk`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`.

Uses:
- CN Proposition 7.1.3: Supplies the low-level coarse j-map in a fixed coordinate.
- CN §§7.2–7.4 and accompanying Magma inputs: Forms the mixed-level fiber-product equations and recovers the underlying elliptic j-value.

API:
- `ns3J_fraction` (characterisation): ns3J is exactly the displayed RatFunc.mk expression x³.
- `ns3J_eval` (simp): For a characteristic-zero field K, x∈K and the denominator 1 nonzero, evaluating ns3J along ℚ→K at x gives x³.
- `ns3J_intDegree` (compatibility): RatFunc.intDegree(ns3J)=3; the actual geometric j-morphism degree is 3, proved with small_curve_models.

Unit tests:
- `ns3J_test_zero` (computation): ns3J evaluated at x=0 is 0.
- `ns3J_test_two` (computation): ns3J evaluated at x=2 is 8.
- `ns3J_test_polynomial` (compatibility): ns3J has reduced denominator 1 and intDegree=3; infinity is its unique pole.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(3), p.94.

### `ns5J` — ns5 j-invariant

**Definition.** Define ns5J∈RatFunc ℚ by the rational expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(ns5) only through the identification in small_curve_models. Its morphism degree is 10; its RatFunc.intDegree (numerator degree minus denominator degree) is 0, a different invariant. Cusp evaluation is never read as a finite field quotient.

Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.

Direct prerequisites: `mathlib:RatFunc.mk`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`.

Uses:
- CN Proposition 7.1.3: Supplies the low-level coarse j-map in a fixed coordinate.
- CN §§7.2–7.4 and accompanying Magma inputs: Forms the mixed-level fiber-product equations and recovers the underlying elliptic j-value.

API:
- `ns5J_fraction` (characterisation): ns5J is exactly the displayed RatFunc.mk expression 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
- `ns5J_eval` (simp): For a characteristic-zero field K, x∈K and the denominator (x²+x−1)⁵ nonzero, evaluating ns5J along ℚ→K at x gives 125x(2x+1)³(2x²+7x+8)³/(x²+x−1)⁵.
- `ns5J_intDegree` (compatibility): RatFunc.intDegree(ns5J)=0; the actual geometric j-morphism degree is 10, proved with small_curve_models.

Unit tests:
- `ns5J_test_zero` (computation): ns5J evaluated at x=0 is 0 and this is not a cusp.
- `ns5J_test_minus_half` (computation): ns5J evaluated at x=−1/2 is 0.
- `ns5J_test_infinity` (non-example): ns5J has intDegree=0 and finite value 8000 at infinity; its poles are the two roots of x²+x−1, not infinity.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(4), p.94.

Atlas planet: Nonsplit Cartan j-invariant.

### `s3J` — s3 j-invariant

**Definition.** Define s3J∈RatFunc ℚ by the rational expression 27(x+1)³(x−3)³/x³, using RatFunc.mk of its displayed numerator and denominator polynomials. It represents the j-morphism of X(s3) only through the identification in small_curve_models. Its morphism degree is 6; its RatFunc.intDegree (numerator degree minus denominator degree) is 3, a different invariant. Cusp evaluation is never read as a finite field quotient.

Construction or proof:
1. Use the source numerator and denominator as polynomials over ℚ and form their fraction in RatFunc.
2. Check coprimality, degree and the behavior at zero and infinity; identify this function with the geometric j-map only in small_curve_models.

Direct prerequisites: `mathlib:RatFunc.mk`, `mathlib:RatFunc.eval`, `mathlib:RatFunc.intDegree`.

Uses:
- CN Proposition 7.1.3: Supplies the low-level coarse j-map in a fixed coordinate.
- CN §§7.2–7.4 and accompanying Magma inputs: Forms the mixed-level fiber-product equations and recovers the underlying elliptic j-value.

API:
- `s3J_fraction` (characterisation): s3J is exactly the displayed RatFunc.mk expression 27(x+1)³(x−3)³/x³.
- `s3J_eval` (simp): For a characteristic-zero field K, x∈K and the denominator x³ nonzero, evaluating s3J along ℚ→K at x gives 27(x+1)³(x−3)³/x³.
- `s3J_intDegree` (compatibility): RatFunc.intDegree(s3J)=3; the actual geometric j-morphism degree is 6, proved with small_curve_models.

Unit tests:
- `s3J_test_one` (computation): s3J evaluated at x=1 is −1728.
- `s3J_test_minus_one` (computation): s3J evaluated at x=−1 is 0.
- `s3J_test_cusp` (non-example): The reduced denominator of s3J vanishes at 0 and intDegree=3; 0 and infinity are poles.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(6), p.94.

### `B` — The elliptic quotient 225A1

**Definition.** Let B/ℚ be the existing WeierstrassCurve with coefficients (0,0,−1,0,1), so its equation is y²−y=x³+1. Its discriminant is −675 and its j-invariant is 0. Its use as X(ns3,ns5), and its Mordell–Weil group, are comparison/arithmetic theorems rather than fields of this definition.

Construction or proof:
1. Specify the five coefficients in the baseline carrier.
2. Compute b-invariants, Δ and j; Δ≠0 gives the IsElliptic instance.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:WeierstrassCurve.Affine.Point.mk`.

Uses:
- CN Proposition 7.1.3(5): Identifies the mixed normalizer curve with a concrete elliptic curve.
- CN Propositions 7.4.3–7.4.5: Supplies the rank-one elliptic target and its pullbacks for the relative symmetric sieve.

API:
- `B_coefficients` (data): B has a₁=a₂=a₄=0, a₃=−1 and a₆=1.
- `B_discriminant` (simp): B.Δ=−675 and therefore B is elliptic over ℚ.
- `B_baseChange` (functoriality): For a characteristic-zero field K with ℚ-algebra structure, B.baseChange K has the same coefficients and equation; identity and composite coefficient changes agree.

Unit tests:
- `B_test_j` (computation): The Mathlib j-invariant of B is 0.
- `B_test_point` (computation): (x,y)=(1,2) satisfies the actual B Weierstrass equation: 2²−2=1³+1.
- `B_test_sign` (non-example): B.a₃=−1, not +1; (1,2) would fail the unshifted equation y²+y=x³+1.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(5), p.94; ns3ns5-elliptic.m.

Atlas planet: Elliptic quotient 225A1.

### `small_curve_models` — Genus-zero modular curve models

**Theorem.** There are ℚ-isomorphisms X(b3), X(b5), X(ns3), X(ns5), X(s3)≅ℙ¹ with j-functions b3J, b5J, ns3J, ns5J, s3J respectively. Under the b5 coordinate the Fricke involution w5 sends x to 125/x. The j-map degrees are respectively 4,6,3,10,6, with the pole multiplicities read from the displayed rational functions. These degrees include infinity and are not RatFunc.intDegree.

Construction or proof:
1. Import the genus-zero models of the relevant Borel/Cartan quotient owner and compare the coordinate with CN’s cited tables (Sutherland–Zywina, McMurdy, Chen).
2. Normalize the j coordinate by matching the source rational function and cusp divisor.
3. For b5 derive the Fricke formula and verify that it is an involution; it is an isogeny correspondence on elliptic classes, not invariance of j.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/b3-j`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/b5-j`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/ns5-j`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/s3-j`, `ModularCurvesPartII:R13.4a`.

Acceptance:
- The b5 coefficient is 250 in this coordinate, not the coefficient 10 of another standard X₀(5) coordinate.
- The ns5 value at infinity is 8000, so infinity is noncuspidal.

Source: CN, Proposition 7.1.3(1)–(4),(6), p.94.

Atlas planet: Genus-zero modular curve models.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G7`.

### `mixed_elliptic_model` — The mixed nonsplit elliptic model

**Theorem.** X(ns3,ns5) is ℚ-isomorphic to B. On a dense affine model x³=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵, put A(t)=t²+t−1 and D(t)=(2t+1)(2t²+7t+8). The source map is [U:V:W]=[−(x/5)A(t)²:D(t):tD(t)], on the standard homogeneous Weierstrass equation V²W−VW²=U³+W³ of B. On V≠0,A(t)≠0 its inverse is t=W/V, x=−5(U/V)D(t)/A(t)². These are inverse rational maps and extend uniquely between the smooth proper normalizations. The raw singular affine fiber product is not itself B.

Construction or proof:
1. Check the cubic identity after clearing denominators on the stated dense open.
2. Verify the displayed rational inverse on the dense open, then identify the homogeneous cubic directly with B’s projective Weierstrass equation.
3. Extend the birational equivalence uniquely over smooth proper curves; export all maps used by the quartic quotients.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.1.3(5) and proof, p.94; ns3ns5-elliptic.m.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G8`.

### `B_mordell_weil` — Mordell–Weil group of the elliptic quotient

**Theorem.** B(ℚ) is infinite cyclic, with rank 1 and trivial torsion. A saturated generator D is part of the output; pullback arguments must not silently use an unsaturated nontorsion point as a generator. The source labels B as Cremona 225A1.

Construction or proof:
1. Certify a nonzero rational point and a rank upper bound by descent.
2. Determine torsion by good reduction and division polynomials; certify generator saturation.
3. Export the actual generator and its basepoint-compatible divisor class for the quartic pullbacks.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/elliptic-quotient`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Rank 1 alone is not a certificate that a point generates the full group.

Source: CN, Proposition 7.1.3(5), p.94; Proposition 7.4.4, p.100.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G8`.

### `nonsplit_cartan_conic` — The actual level-three Cartan conic

**Comparison.** X(ns3°) is the smooth projective conic Y²+3X²+36XZ+432Z²=0 over ℚ. Its degree-two map to X(ns3) sends [X:Y:Z] to [X:Z], with j=(X/Z)³ on Z≠0 and cusp fiber at Z=0 defined over ℚ(√−3). It has no ℚ-point: its equation is Y²+3(X+6Z)²+324Z²=0. This source-specific comparison distinguishes the actual Cartan from its rational normalizer curve.

Construction or proof:
1. Use the j=1728 branch divisor to write the double cover as y²=d(x²+12x+144).
2. At x=12 the CM j=1728 fiber has field ℚ(√−1), giving squareclass d=−3.
3. Homogenize and check smoothness and the infinity fiber; positivity of the completed-square expression excludes rational points.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/ns3-j`, `ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers`.

Acceptance:
- The cover has geometric genus zero but no rational point. It cannot be replaced by ℙ¹ℚ.

Source: CN, Proof of Proposition 7.2.1, p.95; Proposition 7.4.3 proof, p.100; ns3ons5.m opening.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G7`.

## IQ.5. Genus-one curves and rational divisor classes

The conductor-fifteen curves reduce the final finite-point theorem to torsion. The Gaussian field supplies eight extra torsion points on X₀(15), requiring a specific modularity comparison. The other genus-one curve is a weighted quartic with scalar −3 and no ℚ3-point. Its Jacobian exists over ℚ despite the absence of a rational point on the curve. Rational linear systems descend to conics; the empty conics distinguish the two rational Jacobian classes that have no rational divisor representatives.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4`, `ArithmeticGaloisRepresentations:R01.5`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `ComputationalNumberTheory:CN.5`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`, `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `EllipticCurveModularityImaginaryQuadratic:IQ.4`, `ModularCurvesPartII:R13.4a`, `mathlib:Polynomial.X`, `mathlib:Polynomial.eval`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:WeierstrassCurve.Affine.Point.mk`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.Δ`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

### `E15` — E15 Legendre model

**Definition.** Define E15/ℚ as WeierstrassCurve with coefficients (0,41,0,400,0), whose equation is y²=x(x+16)(x+25). Its discriminant is 207360000≠0. Identification with the modular curve and the rational group are separate theorems.

Construction or proof:
1. Use the existing Weierstrass carrier with exactly the displayed five coefficients.
2. Compute its discriminant; keep the identification with the modular curve separate.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:WeierstrassCurve.Affine.Point.mk`.

Uses:
- CN Corollary 7.1.2: Reduces the remaining residual cases to the torsion over an imaginary quadratic field.
- CN §1 and IQ.8 acceptance tests: Computes the field-dependent rank-zero input and a positive-rank non-example.

API:
- `E15_coefficients` (data): The five coefficients are (0,41,0,400,0).
- `E15_discriminant` (simp): Δ(E15)=207360000 and E15 is elliptic.
- `E15_baseChange` (functoriality): The coefficientwise base change to any characteristic-zero field has equation y²=x(x+16)(x+25), compatibly with identity and composition.

Unit tests:
- `E15_test_zero` (computation): (0,0) satisfies the E15 equation and gives a nonidentity point of order two.
- `E15_test_roots` (computation): The three distinct roots of the cubic are 0,−16,−25.
- `E15_test_delta` (non-example): Its discriminant is 207360000, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proof of Corollary 7.1.2, p.93.

### `Es35` — Es35 Legendre model

**Definition.** Define Es35/ℚ as WeierstrassCurve with coefficients (0,17,0,16,0), whose equation is y²=x(x+1)(x+16). Its discriminant is 921600≠0. Identification with the modular curve and the rational group are separate theorems.

Construction or proof:
1. Use the existing Weierstrass carrier with exactly the displayed five coefficients.
2. Compute its discriminant; keep the identification with the modular curve separate.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.Affine.Equation`, `mathlib:WeierstrassCurve.Affine.Point.mk`.

Uses:
- CN Corollary 7.1.2: Reduces the remaining residual cases to the torsion over an imaginary quadratic field.
- CN §1 and IQ.8 acceptance tests: Computes the field-dependent rank-zero input and a positive-rank non-example.

API:
- `Es35_coefficients` (data): The five coefficients are (0,17,0,16,0).
- `Es35_discriminant` (simp): Δ(Es35)=921600 and Es35 is elliptic.
- `Es35_baseChange` (functoriality): The coefficientwise base change to any characteristic-zero field has equation y²=x(x+1)(x+16), compatibly with identity and composition.

Unit tests:
- `Es35_test_zero` (computation): (0,0) satisfies the Es35 equation and gives a nonidentity point of order two.
- `Es35_test_roots` (computation): The three distinct roots of the cubic are 0,−1,−16.
- `Es35_test_delta` (non-example): Its discriminant is 921600, not the discriminant of the other Legendre curve; the two equations are distinct although their elliptic curves are isogenous.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proof of Corollary 7.1.2, p.93.

### `level_fifteen_models` — The two conductor-fifteen curves

**Theorem.** There are ℚ-isomorphisms X(b3,b5)=X₀(15)≅E15 and X(s3,b5)≅Es35, with Cremona labels 15A1 and 15A3 respectively. Both have ℚ-points ℤ/2⊕ℤ/4 and rank zero, and they are ℚ-isogenous. In particular X₀(15)(F) is finite iff X(s3,b5)(F) is finite for any number field F. The maps must carry j and the cusp divisors, not just identify the abstract elliptic curves.

Construction or proof:
1. Import the original modular-curve Weierstrass models and their j-maps, then verify the transformations to the CN Legendre coordinates.
2. Certify rational torsion and rank zero, and the isogeny between them.
3. Use the isogeny to preserve rank over F and finite generation to equate rank zero with finiteness.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/e15-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/es35-model`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`, `EffectiveDiophantineMethods:ED.3`.

Acceptance:
- The j-map and cusp divisor are transported along the coordinate changes; the Legendre equation alone does not supply them.

Source: CN, Corollary 7.1.2 proof, p.93; FLHS arXiv v4 Lemmas 15.3–15.4, p.29 (published locators cited by CN are Lemmas 5.6–5.7).

Atlas planet: Conductor-fifteen modular curves.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G9`.

### `quadratic_level_fifteen_torsion` — Quadratic torsion of the level-fifteen curves

**Theorem.** Among quadratic number fields F, E15(F)tors strictly contains E15(ℚ) precisely for F=ℚ(i) or ℚ(√5); Es35(F)tors strictly contains Es35(ℚ) precisely for F=ℚ(√5). For the imaginary exception E15(ℚ(i)) has eight new torsion points beyond its eight rational points. Thus, under the rank-zero input for an imaginary F, Es35(F)=Es35(ℚ) and E15(F)=E15(ℚ) unless F=ℚ(i). No assertion of rank zero over an arbitrary F is part of this theorem.

Construction or proof:
1. Use the exact quadratic torsion-growth theorem or certify the needed special cases directly by division polynomials and halving the rational two-torsion points.
2. List the eight new Gaussian torsion points and their j-values through the actual modular j-map.
3. Use finite generation only after the separately given rank-zero assumption; correct the printed X₀(15) in the Es35 paragraph.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- ℚ(√5) is real and therefore is excluded by the final imaginary-field hypothesis.
- The Es35 imaginary exception is empty, not ℚ(i).

Source: CN, Corollary 7.1.2 proof, p.93, citing Kwon Theorem 1.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G9`.

### `gaussianExceptional` — The Gaussian exceptional curve

**Definition.** For a characteristic-zero field K and i∈K with i²=−1, define gaussianExceptional(K,i) as WeierstrassCurve with coefficients (i,1,1,6+i,10−15i). Over ℚ(i) this is the LMFDB curve 4050.1-c3. Its discriminant is 58752+107136i and its j-invariant is (−47709+15363i)/256. These coefficient identities do not certify modularity.

Construction or proof:
1. Map the displayed long Weierstrass equation into the Mathlib carrier.
2. Compute Δ and c₄³/Δ using i²=−1 and characteristic zero; retain the chosen embedding of ℚ(i).

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.baseChange`.

Uses:
- CN Corollary 7.1.2: Supplies the single exceptional Gaussian modular curve class up to isogeny, conjugacy and quadratic twist.
- LMFDB Faltings–Serre modularity computation: Pins the exact equation and coefficient-field comparison for the certificate request.

API:
- `gaussianExceptional_coefficients` (data): The five coefficients are (i,1,1,6+i,10−15i).
- `gaussianExceptional_discriminant` (simp): If i²=−1 in characteristic zero, Δ=58752+107136i≠0.
- `gaussianExceptional_j` (compatibility): With the resulting IsElliptic instance, the Mathlib j-invariant equals (−47709+15363i)/256.

Unit tests:
- `gaussianExceptional_test_a1` (computation): Its a₁ coefficient is i, not zero; it is a long Weierstrass model.
- `gaussianExceptional_test_conjugate` (compatibility): Changing i to −i gives the coefficientwise conjugate curve, with conjugate discriminant and j.
- `gaussianExceptional_test_j_nonrational` (non-example): Over ℚ(i) the coefficient of i in j is 15363/256≠0; the curve is not covered by the rational-j argument.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: LMF-GAUSS, LMFDB 4050.1-c3, curve data; CN Corollary 7.1.2 proof, p.93.

### `gaussian_exceptional_modular` — Modularity of Gaussian torsion j-values

**Theorem.** The curve gaussianExceptional over ℚ(i) is modular. Every noncuspidal j-value at the eight new E15(ℚ(i))-torsion points is the j-value of an elliptic curve obtained from gaussianExceptional by an ℚ(i)-isogeny, coefficient-field conjugation or quadratic twisting, and consequently is modular. Provide the explicit orbit/matching table and a Faltings–Serre comparison certificate for the one exceptional curve.

Construction or proof:
1. Produce the eight j-values from the certified torsion points and modular j-map.
2. Match them to the isogeny/conjugacy/twist orbit of the displayed curve.
3. Supply a finite Faltings–Serre representation-comparison certificate, including the automorphic eigenform and the exhaustive test-prime argument; transport modularity by modularity_transport.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-exceptional-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EffectiveDiophantineMethods:ED.6`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `ArithmeticGaloisRepresentations:R01.5`, `ComputationalNumberTheory:CN.5`.

Acceptance:
- A database flag or conductor match is not a proof of modularity.
- The mod-3 and mod-5 images are Borel in the database example, so quadratic_modularity cannot be invoked to bypass this certificate.

Source: CN, Proof of Corollary 7.1.2, p.93, citing DGP10 and LMFDB 4050.1-c3.

Atlas planet: Gaussian exceptional modularity.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G9`.

### `ns3b5Quartic` — The genus-one Cartan quartic

**Definition.** Define ns3b5Quartic=−3(X⁴+2X³−X²+10X+25)∈ℚ[X]. Its geometric model is the weighted projective equation Y²=−3(X⁴+2X³Z−X²Z²+10XZ³+25Z⁴) in ℙ(1,2,1); Y has weight 2, so ordinary projective homogenization is incorrect. The scalar −3 is a genuine quadratic twist fixed by the cusp field, not a removable normalization.

Construction or proof:
1. Specify the quartic polynomial over ℚ.
2. Use the weights (1,2,1) for its smooth projective double-cover model; the identification theorem supplies the modular interpretation.

Direct prerequisites: `mathlib:Polynomial.X`, `mathlib:Polynomial.eval`.

Uses:
- CN Proposition 7.2.1: Fixes the model, ramification and Fricke coordinate.
- CN Proposition 7.2.2 and accompanying ns3ob5.m: Computes the rational divisor-class obstruction and degree-two fibers.

API:
- `ns3b5Quartic_formula` (characterisation): The polynomial is exactly −3(X⁴+2X³−X²+10X+25).
- `ns3b5Quartic_degree` (compatibility): Its degree is 4 and its leading coefficient is −3; the two points over infinity require a square root of −3.
- `ns3b5Quartic_fricke` (relation): For x≠0, x⁴·ns3b5Quartic(5/x)=25·ns3b5Quartic(x), giving the coordinate part of the Fricke involution.

Unit tests:
- `ns3b5Quartic_test_zero` (computation): ns3b5Quartic(0)=−75.
- `ns3b5Quartic_test_minus_two` (computation): ns3b5Quartic(−2)=−3.
- `ns3b5Quartic_test_minus_five_half` (computation): ns3b5Quartic(−5/2)=−75/16, agreeing with y=5√−3/4.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.2.1(1) and proof, pp.94–95.

Atlas planet: Genus-one Cartan quartic.

### `genus_one_model` — Genus-one model and Fricke involution

**Theorem.** The smooth weighted quartic C with Y²=ns3b5Quartic(X,Z) is ℚ-isomorphic to X(ns3°,b5) and has genus 1. Its map to X(ns3,b5)≅ℙ¹ has degree 2 and coordinate x; the latter j-function is (x⁶+250x³+3125)³/x¹⁵. The Fricke w5 sends x to 5/x. The double cover is ramified at the four simple roots of X⁴+2X³−X²+10X+25, and its cusp field is ℚ(√−3), fixing the scalar −3.

Construction or proof:
1. Factor the fiber of the j-map at 1728 exactly as in CN and distinguish its possible ramification divisors using the nonsplit Cartan image.
2. Identify the twist scalar from the cusp field or the j=1728 fiber on X(ns3°).
3. Check smoothness and the degree-two cover; extend w5 across the weighted charts.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic`, `ModularCurvesPartII:R13.4a`, `ArithmeticGaloisRepresentations:R01.4`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic`.

Acceptance:
- The j-function is b5J(x³), not b5J(x); the denominator is x¹⁵.

Source: CN, Proposition 7.2.1(1)–(2) and proof, pp.94–95.

### `genusOneSpecialPoints` — Five points over the cusp field

**Construction.** For a characteristic-zero field K and s∈K with s²=−3, define the list of weighted homogeneous coordinates ∞+=(1:s:0), ∞−=(1:−s:0), 0+=(0:5s:1), P₁=(−2:−s:1), P₂=(−5/2:5s/4:1). The construction consists of literal triples together with their lifts to C(K) via genus_one_model. Over K=ℚ(√−3) they are the points used to describe rational Jacobian classes.

Construction or proof:
1. Construct the nonzero triples and check the weighted quartic equation using s²=−3.
2. Use the weighted model’s point dictionary to lift them, fixing the sign convention for ∞−.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quartic`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`.

Uses:
- CN Proposition 7.2.2: D₀=0+−∞−, D₁=P₁−∞−, D₂=P₂−∞− identify the three nonzero rational two-torsion Jacobian classes.
- CN Proposition 7.2.4: The base degree-two divisor ∞++∞− fixes the rational linear system.

API:
- `genusOneSpecialPoints_coordinates` (data): The five triples have exactly the coordinates displayed in the definition, in that order.
- `genusOneSpecialPoints_on_curve` (compatibility): All five triples satisfy the weighted quartic equation and define points on C under genus_one_model.
- `genusOneSpecialPoints_conjugate` (functoriality): Changing s to −s exchanges ∞+ with ∞− and gives the coefficientwise conjugates of the three affine points; the construction commutes with field embeddings.

Unit tests:
- `genusOneSpecialPoints_test_infinity` (non-example): The first two triples have Z=0 and opposite nonzero Y=±s; the weighted equation is Y²=−3X⁴, not the ordinary cubic equation.
- `genusOneSpecialPoints_test_zero` (computation): For 0+, (5s)²=−75=ns3b5Quartic(0).
- `genusOneSpecialPoints_test_p2` (computation): For P₂, (5s/4)²=−75/16=ns3b5Quartic(−5/2).

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Points displayed before Proposition 7.2.2, p.95.

### `genus_one_jacobian` — Jacobian and local obstruction of the quartic

**Theorem.** For C as above, JacC is ℚ-isomorphic to the elliptic curve y²=x³+3x²−720x−8100 (45A2), and JacC(ℚ)≅ℤ/2⊕ℤ/2. C(ℚ3)=∅, hence C(ℚ)=∅. Under the ℚ(√−3) identification P↦[P]−[∞−], its three nonzero rational classes are D₀,D₁,D₂ from genusOneSpecialPoints, each of order 2 and D₀+D₁=D₂. This identifies the Jacobian over ℚ without identifying the pointless genus-one curve C with it over ℚ.

Construction or proof:
1. Use the binary-quartic invariant formula to construct the Jacobian model and its ℚ-isomorphism.
2. Certify rank zero by two-descent and torsion by reduction; verify the three classes and addition relation.
3. Prove the local obstruction on both weighted charts at 3, including infinity.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- The Abel–Jacobi point ∞− is only defined over ℚ(√−3); JacC/ℚ still exists by the imported relative Picard construction.

Source: CN, Proposition 7.2.1(3) and points discussion, p.95; ns3ob5.m.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G11`.

### `genus_one_rational_picard` — Rational divisors in rational classes

**Theorem.** Let Pic⁰(C) denote degree-zero ℚ-rational divisors modulo ℚ-rational linear equivalence, mapped injectively into JacC(ℚ). Its image is {0,D₀}≅ℤ/2, and D₁,D₂ are rational Jacobian points not represented by rational divisors. For Ei=Di+∞++∞−, corrected ℚ(√−3) Riemann–Roch bases are {1,fi} with f₀=(y+s x²+5s)/x, f₁=(y+s x²−5s)/(x+2), f₂=(y+s x²−5s)/(x+5/2). The source prints an extra factor y in these numerators; the following fiber equations and the Magma calculation require its removal. The associated rational descent conics for E₁,E₂ are u²+3v²+6v+15=0 and u²+3v²+6v+12=0, both empty over ℚ; E₀’s conic u²+3v²+6v−33=0 has the rational point (3,2).

Construction or proof:
1. Use the imported rational-divisor-to-Jacobian map and the Brauer–Severi descent of a complete linear system, not an equality Pic⁰(C)=JacC(ℚ).
2. Verify the corrected Riemann–Roch bases, poles and fiber equations (7.2.1)–(7.2.3) by substitution into the quartic.
3. Descent yields the stated conics. Complete the square: the last two have respectively u²+3(v+1)²+12 and u²+3(v+1)²+9, so have no rational point. E₀ has (3,2).

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- The rational Picard image has order 2 while JacC(ℚ) has order 4.
- The quotient by the base divisor gives degree-zero classes; no rational base point of C is assumed.

Source: CN, Proposition 7.2.2 and Remark 7.2.3, pp.95–96; Bruin–Flynn §2; ns3ob5.m.

Atlas planet: Rational divisor-class obstruction.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G11`.

### `genus_one_quadratic_points` — Quadratic points of the genus-one quartic

**Theorem.** For any quadratic number field F, P∈C(F) other than the two points at infinity satisfies x(P)∈ℚ or x(P)x(σP)=5, where σ is the nontrivial automorphism of F/ℚ. The proof uses that P+σP is a rational effective divisor of degree 2 and its difference from ∞++∞− is either 0 or D₀ in the rational Picard image. In the nontrivial case the fiber equation (6−2sα)x²+(α²−33)x+(30−10sα)=0 has product of roots 5, with the degenerate leading-coefficient case handled separately.

Construction or proof:
1. Classify the rational degree-two divisor using genus_one_rational_picard.
2. In the zero class use the hyperelliptic linear system, yielding rational x.
3. In the D₀ class use the corrected f₀ fiber and constant/leading ratio 5. Handle poles, degree loss, ramification and the excluded infinity points separately.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Acceptance:
- P=(1+2i,3+6i) on C/ℚ(i) is the nonrational-x case with xσ(x)=5.

Source: CN, Proposition 7.2.4, p.96.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G11`.

### `genus_one_points_modular` — Modularity from genus-one quadratic points

**Theorem.** For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(ns3°,b5) is modular. In the imaginary case rational x gives rational j through the degree-two quotient. For a nonrational affine x the classification gives x(P)x(σP)=5, so the images of P and σP in X(ns3,b5) are related by its specified Fricke w5. The quotient moduli dictionary gives a geometric degree-5 isogeny between E and its conjugate and hence a Q-curve; the Q-curve modularity supplier applies. This does not assert σP=w5P for a chosen lift on the genus-one double cover. Infinite-coordinate points use the quotient/cusp dictionary. For real quadratic F use the imported FLHS modularity theorem.

Construction or proof:
1. Separate cusps and the infinity charts using the j-map.
2. For rational j use a ℚ-curve with that j, base change and quadratic twisting (the CM cases j=0,1728 use Modular.of_cm).
3. For nonrational affine x, use the norm-five equation only on the quotient X(ns3,b5), where Fricke is x↦5/x. The modular interpretation gives the geometric 5-isogeny and Q-curve endpoint without selecting either sign of a Fricke lift to the quartic.
4. For real quadratic F invoke the imported FLHS theorem; G10 records the exact owner extension needed.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularity:R29.6/modularity-theorem`.

Acceptance:
- On the quartic h(x)=−3(x⁴+2x³−x²+10x+25), both (x,y)↦(5/x,±5y/x²) induce the same quotient action. The norm-five equation alone does not choose a sign.
- For P=(1+2i,3+6i), σP equals the plus lift and differs from the minus lift; this is a regression against an inference from x alone, not identification of the actual modular lift.

Source: CN, Corollary 7.2.5, p.97.

Atlas planet: Genus-one quadratic-point modularity.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G10`.

## IQ.6. Genus-two curves and exceptional points

The sextic has two rational infinity points and a finite twenty-element rational Jacobian. Riemann–Roch isolates the moving canonical class; the nineteen nonzero classes are then enumerated by effective divisors. Only two nonzero classes have imaginary quadratic support, over ℚ(√−11). The exceptional elliptic curve needs a full nonsplit-normalizer mod-5 image certificate. Containment alone would not prove cyclotomic absolute irreducibility.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`, `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `EllipticCurveModularityImaginaryQuadratic:IQ.3`, `EllipticCurveModularityImaginaryQuadratic:IQ.4`, `ModularCurvesPartII:R13.4a`, `mathlib:Polynomial.X`, `mathlib:Polynomial.eval`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.baseChange`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.Δ`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

### `b3ns5Sextic` — The genus-two Cartan sextic

**Definition.** Define b3ns5Sextic=9X⁶−6X⁵−35X⁴+40X²+12X−8∈ℚ[X]. Let C₂gen denote its smooth projective hyperelliptic model y²=b3ns5Sextic(x), with Y of weight 3 and two rational points at infinity Y/X³=±3. Identification with X(b3,ns5) is separate; a singular raw fiber product is not this smooth model.

Construction or proof:
1. Use the literal sextic in the baseline polynomial ring.
2. Use the imported smooth hyperelliptic curve construction and its affine/infinity point dictionary; prove squarefreeness.

Direct prerequisites: `mathlib:Polynomial.X`, `mathlib:Polynomial.eval`.

Uses:
- CN Proposition 7.3.1: Fixes the genus-two equation.
- CN Lemma 7.3.2 and Proposition 7.3.3: Uses the canonical divisor at infinity and Mumford representatives to classify quadratic points.

API:
- `b3ns5Sextic_formula` (characterisation): The polynomial equals the displayed degree-six expression, with zero coefficient of X³.
- `b3ns5Sextic_degree` (simp): Its degree is 6 and leading coefficient is 9; the infinity points therefore have Y/X³=±3 over ℚ.
- `b3ns5Sextic_squarefree` (compatibility): The sextic is squarefree over ℚ, so the smooth proper double cover has genus 2 and agrees with its imported hyperelliptic normalization.

Unit tests:
- `b3ns5Sextic_test_zero` (computation): b3ns5Sextic(0)=−8.
- `b3ns5Sextic_test_roots` (computation): b3ns5Sextic(−1)=b3ns5Sextic(1/3)=b3ns5Sextic(2)=0, giving three distinct rational Weierstrass points.
- `b3ns5Sextic_test_degree` (non-example): Its degree is 6 with nonzero leading coefficient 9, not degree 5; its smooth completion has two points at infinity.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.3.1(1), p.97; b3ns5.m.

Atlas planet: Genus-two Cartan sextic.

### `genus_two_model` — Genus-two model and Fricke involution

**Theorem.** The smooth hyperelliptic curve y²=b3ns5Sextic(x) is ℚ-isomorphic to X(b3,ns5). Under this isomorphism the Fricke involution w3 is exactly (x,y)↦(x,−y), exchanging the two rational infinity points. The j-map is transported from the explicit normalized fiber product of b3J and ns5J; it is not the x-coordinate.

Construction or proof:
1. Construct the mixed-level affine fiber product from the two j-functions and its normalization.
2. Export the birational maps used by IsHyperelliptic/SimplifiedModel and extend them over the smooth projective models.
3. Prove w3 has six fixed points by the level interpretation, or certify the order-two automorphism group and show w3 is nontrivial.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-sextic`, `ModularCurvesPartII:R13.4a`.

Acceptance:
- The transported Fricke action is certified, not inferred from the existence of some order-two automorphism.

Source: CN, Proposition 7.3.1(1)–(2) and proof, p.97; b3ns5.m.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G12`.

### `genus_two_jacobian` — The finite genus-two Jacobian

**Theorem.** For the curve in genus_two_model, Jac(C₂gen)(ℚ)≅ℤ/2⊕ℤ/10. A full table of twenty rational divisor classes in a fixed Mumford/base-divisor convention, with group operations and principal-function witnesses, is part of the arithmetic output. The group has rank zero and four rational two-torsion elements.

Construction or proof:
1. Certify the two-Selmer upper bound matching rational two-torsion, so the rank is zero.
2. Produce independent order-2 and order-10 classes; use good reductions at 7 and 13 to bound torsion (the scripts give ℤ/2⊕ℤ/20 and ℤ/2⊕ℤ/90 respectively).
3. Use the certified hyperelliptic group law to enumerate exactly twenty classes and verify completeness.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- The sextic has three rational roots and one irreducible cubic factor; these account for exactly four rational two-torsion classes.
- No rank conclusion is based solely on a point search.

Source: CN, Proposition 7.3.1(3) and proof, p.97; b3ns5.m.

Atlas planet: Finite genus-two Jacobian.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G12`.

### `genus_two_divisor_dichotomy` — The genus-two divisor dichotomy

**Theorem.** Write D∞=∞++∞−, the canonical hyperelliptic degree-two divisor on C₂gen. For a quadratic point P with conjugate σP, if [P+σP]=[D∞], then x(P) lies in ℙ¹(ℚ): on the affine chart P=(x,±√b3ns5Sextic(x)) with x∈ℚ; infinity is treated as x=∞. If [P+σP−D∞]≠0, P+σP is the unique effective divisor in its degree-two class because its Riemann–Roch space has dimension 1. The conclusion includes the distinction between a rational divisor and a merely rational divisor class.

Construction or proof:
1. The canonical class is D∞ and L(D∞)=⟨1,x⟩, giving a rational fiber in its linear system.
2. For a noncanonical degree-two class use genus-two Riemann–Roch to obtain dimension 1 and uniqueness of the effective divisor.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Acceptance:
- The zero class has a moving one-dimensional projective linear system and must not be enumerated as one unique effective divisor.

Source: CN, Lemma 7.3.2 and proof, p.98.

### `genus_two_quadratic_points` — Imaginary quadratic points of the genus-two curve

**Theorem.** If F is imaginary quadratic and P∈C₂gen(F) is affine, then x(P)∈ℚ or F=ℚ(√−11) and, up to conjugation, P=((−5+s)/6,±(17−s)/6) with s²=−11. Among the nineteen nonzero rational Jacobian classes, the complete effective-divisor table has nine rational-x classes, two infinity-supported classes, two classes supported on the stated imaginary quadratic pairs and six classes supported on real quadratic points. This enumeration is not a classification of real-quadratic points by the imaginary exceptional set.

Hypotheses: F imaginary quadratic.; P affine on C₂gen.

Construction or proof:
1. Enumerate all nineteen nonzero classes using the certified finite Jacobian group.
2. Use uniqueness from genus_two_divisor_dichotomy and the Mumford polynomial to determine degree and discriminant of each support field.
3. Verify the two exceptional ideals (6X+5Z)²+11Z²=0 and Y=±(X−2Z)Z²; recover the stated coordinates and the complete class counts.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Substitution with s²=−11 verifies both signs of the stated y-coordinate; replacing it by another rational expression fails the sextic equation.

Source: CN, Proposition 7.3.3 and proof, p.98; b3ns5.m.

Atlas planet: Genus-two quadratic points.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G12`.

### `elevenExceptional` — The exceptional curve over ℚ(√−11)

**Definition.** For a characteristic-zero field K and a∈K satisfying a²−a+3=0, define elevenExceptional(K,a) with Weierstrass coefficients (a,0,1+a,−24−6a,56+13a). Its discriminant is 4512−736a≠0 and j=(11155375a+3126750)/32. Over ℚ(√−11), a=(1+√−11)/2. This is the script’s exceptional curve. The paper labels its conjugacy orbit 8100.2-a2, while the script comment uses 8100.3-a2; the exact conjugate-conductor label comparison is an explicit certificate gap, not an asserted source error.

Construction or proof:
1. Specify the source equation in the Weierstrass carrier, with the integral generator a satisfying its minimal polynomial.
2. Reduce the invariant formulas using a²=a−3 to compute Δ and j; prove Δ≠0 in characteristic zero.

Direct prerequisites: `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.baseChange`.

Uses:
- CN Corollary 7.3.4: Checks modularity of the two exceptional genus-two classes by their mod-5 image.
- b3ns5.m: Matches the singular fiber-product point with the normalized exceptional point.

API:
- `elevenExceptional_coefficients` (data): The five coefficients are (a,0,1+a,−24−6a,56+13a).
- `elevenExceptional_discriminant` (simp): If a²−a+3=0 in characteristic zero, Δ=4512−736a≠0.
- `elevenExceptional_j` (compatibility): The resulting Mathlib j-invariant is (11155375a+3126750)/32.

Unit tests:
- `elevenExceptional_test_a2` (computation): Its a₂ coefficient is 0, not 1; a is the generator satisfying a²−a+3=0.
- `elevenExceptional_test_conjugate` (compatibility): Replacing a by 1−a gives the coefficientwise conjugate curve and the conjugate j-value.
- `elevenExceptional_test_j_nonrational` (non-example): Over ℚ(√−11), the coefficient of a in j is 11155375/32≠0, so rational-j modularity does not apply.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: MAGMA-b3ns5, b3ns5.m, final exceptional-curve block; Corollary 7.3.4 proof, p.98.

### `eleven_exceptional_modular` — The exceptional mod-5 comparison

**Theorem.** Over F=ℚ(√−11), elevenExceptional has full mod-5 image conjugate to the normalizer of a nonsplit Cartan. Thus its restriction to GF(ζ5) is absolutely irreducible, and quadratic_modularity proves it modular. The point of the affine singular fiber product with coordinates x=32a−96 and t=(−a−15)/9 has b3J(x)=ns5J(t)=j(elevenExceptional); after the certified normalization map it yields one of the two exceptional pairs in genus_two_quadratic_points. Both signs and field conjugates follow by w3 and modularity_transport.

Construction or proof:
1. Certify the full nonsplit normalizer image using a finite residual-image certificate, not just containment.
2. Compute its determinant-one subgroup and prove absolute irreducibility of the cyclotomic restriction.
3. Verify both j identities and export the normalization map on the exceptional point; compare the paper’s and script’s conjugate labels.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `ArithmeticGaloisRepresentations:R01.4/cartan-subgroups-and-normalisers`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Containment in the nonsplit normalizer alone does not imply cyclotomic absolute irreducibility.
- No Faltings–Serre calculation is necessary here once the full-image certificate is available.

Source: CN, Corollary 7.3.4 proof, p.98; b3ns5.m final block.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G13`.

### `genus_two_points_modular` — Modularity from genus-two quadratic points

**Theorem.** For every quadratic number field F, every elliptic E/F giving a noncuspidal point P of X(b3,ns5) is modular. For imaginary F first handle rational P, including both infinity points, by the rational j-map and rational modularity, base change and twisting. A nonrational affine P of exact degree two with rational x satisfies σP=w3P and gives a geometric degree-3 Q-curve. The ℚ(√−11) exceptions are covered by eleven_exceptional_modular. The real-quadratic branch uses the imported FLHS endpoint, not Proposition 7.3.3 outside its imaginary hypothesis.

Construction or proof:
1. If P is rational, including either infinity point, its noncuspidal j-value is rational; use the parent rational modularity theorem and twisting/base change, handling j=0,1728 through CM. If P is nonrational affine with rational x, exact degree two gives y(σP)=−y(P), so the certified Fricke dictionary gives the geometric 3-isogeny and Q-curve modularity.
2. Handle the imaginary exceptional orbit by eleven_exceptional_modular and isogeny/conjugacy/twist invariance.
3. For real F invoke the external FLHS modularity theorem through G10.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularity:R29.6/modularity-theorem`.

Acceptance:
- At infinity t=1/x,v=y/x³ gives v=±3 at t=0. Each point is rational and Galois-fixed, while w3 exchanges them. The proof must use rational j there.
- For nonrational affine P with x∈ℚ, σ sends y to −y; do not apply this assertion to an arbitrary rational P in C(F).

Source: CN, Corollary 7.3.4, p.98.

Atlas planet: Genus-two quadratic-point modularity.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G10`.

## IQ.7. Bielliptic quartics and quadratic divisors

The first and second quartics are handled separately. Their involutions act projectively: the second coordinate matrix squares to 25I and scales its quartic by 625. The first Jacobian’s rational torsion embeds into (ℤ/2)²; equality is not needed or asserted. For the second Jacobian explicit classes give (ℤ/2)⊕(ℤ/10). A single-prime relative criterion at 43 proves the first classification; the second uses the sieve at 11 and 43 and retains all sixteen exceptional degree-two divisors.

Direct layer dependencies: `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty`, `EffectiveDiophantineMethods:ED.4/symmetric-chabauty`, `EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve`, `EffectiveDiophantineMethods:ED.6`, `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `EllipticCurveModularityImaginaryQuadratic:IQ.4`, `EllipticCurveModularityImaginaryQuadratic:IQ.5`, `ModularCurvesPartII:R13.4a`, `ModularCurvesPartII:R14.2`, `mathlib:MvPolynomial.X`, `mathlib:MvPolynomial.eval₂`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`.

### `quartic1` — The bielliptic quartic C1

**Definition.** Define quartic1=9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C1 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.

Construction or proof:
1. Use the literal homogeneous polynomial in the baseline multivariable polynomial ring.
2. Take the projective zero locus through the imported proper-curve construction; its smoothness and genus are certified by quartic_models.

Direct prerequisites: `mathlib:MvPolynomial.X`, `mathlib:MvPolynomial.eval₂`.

Uses:
- CN Proposition 7.4.3: Fixes a smooth proper genus-three model with a specified coordinate convention.
- CN Propositions 7.4.4–7.4.5: Supplies rational divisor, reduction and vanishing-differential computations for the sieve.

API:
- `quartic1_formula` (characterisation): The polynomial is precisely 9X⁴+19X²Y²+Y⁴+9X³Z+19X²YZ+22XY²Z+2Y³Z+10X²Z²+22XYZ²+13Y²Z²+7XZ³+12YZ³+11Z⁴.
- `quartic1_homogeneous` (compatibility): Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
- `quartic1_affine` (projection): On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.

Unit tests:
- `quartic1_test_1` (computation): quartic1 evaluated at (0,0,1) is 11.
- `quartic1_test_2` (computation): quartic1 evaluated at (1,0,0) is 9.
- `quartic1_test_3` (computation): quartic1 evaluated at (0,1,0) is 1.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.3(1), p.100; ns3ons5.m.

Atlas planet: Bielliptic plane quartic C1.

### `quartic1Coordinates` — The bielliptic involution w1

**Definition.** For a commutative ℚ-algebra K, define quartic1Coordinates: (Fin 3→K)→(Fin 3→K) by (X,−Y−Z,Z). Its square is 1 times the identity and quartic1(quartic1Coordinates(v))=quartic1(v). Thus it induces an order-two automorphism w1 of C1. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.

Construction or proof:
1. Check the coordinate substitution and square as polynomial identities.
2. Use the nonzero square scalar to descend to a projective automorphism preserving the quartic.
3. Match this involution to the modular degree-two quotient in quartic_models.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1`, `mathlib:MvPolynomial.eval₂`.

Uses:
- CN Proposition 7.4.3: Identifies the quotient action in the exact projective coordinates.
- CN Proposition 7.4.5 and Box code: Separates pullback divisors and supplies trace-zero vanishing differentials; the script transposes its matrix for that interface.

API:
- `quartic1Coordinates_coordinates` (data): The three coordinates are (X,−Y−Z,Z).
- `quartic1Coordinates_square` (compatibility): For every vector v, quartic1Coordinates(quartic1Coordinates(v))=1•v.
- `quartic1Coordinates_preserves` (compatibility): For every vector v in a commutative ℚ-algebra, quartic1(quartic1Coordinates(v))=1quartic1(v).

Unit tests:
- `quartic1Coordinates_test_basis0` (computation): The image of the j=0 coordinate basis vector is (1,0,0).
- `quartic1Coordinates_test_basis1` (computation): The image of the j=1 coordinate basis vector is (0,−1,0).
- `quartic1Coordinates_test_basis2` (computation): The image of the j=2 coordinate basis vector is (0,−1,1).

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.3(1), p.100.

### `quartic2` — The bielliptic quartic C2

**Definition.** Define quartic2=−X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴ in MvPolynomial (Fin 3) ℚ, with variables X,Y,Z indexed 0,1,2. Its geometric carrier C2 is the smooth projective plane curve cut out by this homogeneous polynomial, not an affine zero-set. Identification with the modular curve and smoothness are stated separately in quartic_models.

Construction or proof:
1. Use the literal homogeneous polynomial in the baseline multivariable polynomial ring.
2. Take the projective zero locus through the imported proper-curve construction; its smoothness and genus are certified by quartic_models.

Direct prerequisites: `mathlib:MvPolynomial.X`, `mathlib:MvPolynomial.eval₂`.

Uses:
- CN Proposition 7.4.3: Fixes a smooth proper genus-three model with a specified coordinate convention.
- CN Propositions 7.4.4–7.4.5: Supplies rational divisor, reduction and vanishing-differential computations for the sieve.

API:
- `quartic2_formula` (characterisation): The polynomial is precisely −X⁴+2X³Y+X²Y²+8X³Z+2X²YZ−2XY²Z−Y³Z−3X²Z²−3XYZ²+3Y²Z²+2XZ³−3YZ³+Z⁴.
- `quartic2_homogeneous` (compatibility): Every monomial has total degree 4; evaluating at λv gives λ⁴ times the evaluation at v over any commutative ℚ-algebra.
- `quartic2_affine` (projection): On Z=1, its equation is the affine polynomial of CN 7.4.3, with all Z powers replaced by 1.

Unit tests:
- `quartic2_test_1` (computation): quartic2 evaluated at (0,0,1) is 1.
- `quartic2_test_2` (computation): quartic2 evaluated at (0,1,1) is 0.
- `quartic2_test_3` (computation): quartic2 evaluated at (-3,7,1) is 0.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.3(2), p.100; s3ns5.m.

Atlas planet: Bielliptic plane quartic C2.

### `quartic2Coordinates` — The bielliptic involution w2

**Definition.** For a commutative ℚ-algebra K, define quartic2Coordinates: (Fin 3→K)→(Fin 3→K) by (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z). Its square is 25 times the identity and quartic2(quartic2Coordinates(v))=625quartic2(v). Thus it induces an order-two automorphism w2 of C2. For i=2 the linear map does not square to the identity: projectivization removes the nonzero scalar 25. The characteristic-zero hypothesis is essential for its inverse.

Construction or proof:
1. Check the coordinate substitution and square as polynomial identities.
2. Use the nonzero square scalar to descend to a projective automorphism preserving the quartic.
3. Match this involution to the modular degree-two quotient in quartic_models.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2`, `mathlib:MvPolynomial.eval₂`.

Uses:
- CN Proposition 7.4.3: Identifies the quotient action in the exact projective coordinates.
- CN Proposition 7.4.5 and Box code: Separates pullback divisors and supplies trace-zero vanishing differentials; the script transposes its matrix for that interface.

API:
- `quartic2Coordinates_coordinates` (data): The three coordinates are (3X+Y+2Z,8X+Y−8Z,4X−2Y+Z).
- `quartic2Coordinates_square` (compatibility): For every vector v, quartic2Coordinates(quartic2Coordinates(v))=25•v.
- `quartic2Coordinates_preserves` (compatibility): For every vector v in a commutative ℚ-algebra, quartic2(quartic2Coordinates(v))=625quartic2(v).

Unit tests:
- `quartic2Coordinates_test_basis0` (computation): The image of the j=0 coordinate basis vector is (3,8,4).
- `quartic2Coordinates_test_basis1` (computation): The image of the j=1 coordinate basis vector is (1,1,−2).
- `quartic2Coordinates_test_basis2` (computation): The image of the j=2 coordinate basis vector is (2,−8,1).

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.3(2), p.100.

### `quartic_models` — Modular quartic models and elliptic quotients

**Theorem.** C1=V(quartic1) and C2=V(quartic2) are smooth nonhyperelliptic projective curves of genus 3 over ℚ, ℚ-isomorphic respectively to X(ns3°,ns5) and X(s3,ns5). Their displayed involutions are the unique nonidentity ℚ-automorphisms, and their degree-two quotient morphisms πi:Ci→B agree with the modular maps through X(ns3,ns5) under mixed_elliptic_model. All j-maps, normalization maps, quotient maps and rational base divisors are exported together.

Construction or proof:
1. Normalize the singular mixed-level fiber products, using nonsplit_cartan_conic and the s3J/ns5J functions.
2. Certify canonical maps and inverse isomorphisms to the smooth plane quartics, including j compatibility.
3. Certify the order-two ℚ-automorphism group and that the displayed action is nontrivial. Construct the quotient map and its isomorphism to B on all charts.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-1-involution`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2-involution`, `ModularCurvesPartII:R13.4a`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic`.

Acceptance:
- The fractional affine formula for w2 has poles; its homogeneous coordinate map extends there.
- An automorphism with a genus-one quotient alone does not establish compatibility with the modular quotient.

Source: CN, Proposition 7.4.3(1)–(2) and proof, p.100; ns3ons5.m and s3ns5.m.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G14`.

### `quarticImaginaryPoints` — The quartic points over ℚ(√−55)

**Construction.** For a characteristic-zero field K and s∈K with s²=−55, define quarticImaginaryPoints(K,s) as the ordered pair of projective coordinate triples P1=((1+s)/28,(27−s)/56,1), P2=((3−s)/4,(3+3s)/4,1). Both lie on C2. Under the certified modular j-map both have j=−32768. The polynomial substitution is separate from the modular-map comparison; changing s to −s gives the conjugate pair.

Construction or proof:
1. Define the two literal coordinate triples and check the quartic identity modulo s²+55.
2. Use the source places on the singular model and the certified canonical normalization map to compare j-values.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-2`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`.

Uses:
- CN Proposition 7.4.3(3): Identifies the two imaginary exceptional quadratic pairs.
- CN Corollary 7.4.6(2): Their rational CM j-value gives modularity despite failure to map to B(ℚ).

API:
- `quarticImaginaryPoints_coordinates` (data): The ordered coordinate triples are exactly the displayed P1,P2, both with Z=1.
- `quarticImaginaryPoints_on_curve` (compatibility): If s²=−55 in characteristic zero, evaluating quartic2 at either triple is zero.
- `quarticImaginaryPoints_j` (compatibility): Under quartic_models and its modular j-map, both points have j=−32768, the rational CM j-value of discriminant −11.

Unit tests:
- `quarticImaginaryPoints_test_first` (computation): Substituting P1 into quartic2 gives zero when s²=−55.
- `quarticImaginaryPoints_test_second` (computation): Substituting P2 into quartic2 gives zero when s²=−55.
- `quarticImaginaryPoints_test_field` (non-example): Over ℚ(√−55), both points are nonrational, distinct and have nonzero Z; conjugation sends s to −s, not s.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.3(3), p.100; s3ns5.m exceptional-place block.

Atlas planet: Quartic points over ℚ(√−55).

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G14`.

### `quartic_jacobian_ranks` — Rank-one quartic Jacobians

**Theorem.** For both i=1,2, rk Jac(Ci)(ℚ)=rk B(ℚ)=1. The source-specific Chen/de Smit–Edixhoven comparison gives Jac(C1) isogenous to the new part of Jac(X₀(225)/w25), with elliptic factors 225c,225a,225d of ranks 0,1,0. For C2 use the 5-new part of Jac(X₀(225)/⟨w9,w25⟩): the factors are 225a,75c,75a of ranks 1,0,0; w9 has characteristic polynomial T²−1 on each level-75 oldspace. These are isogeny/rank computations, not analytic-rank assertions.

Construction or proof:
1. Import the general Cartan Jacobian isogeny and Hecke/new-old decomposition, then specialize it to the two mixed-level curves.
2. Certify the dimensions, rational eigenform decomposition and associated elliptic isogeny classes in the source normalizations.
3. Certify algebraic ranks of the five rational elliptic factors by descent, and transport rank through the explicit isogenies.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`, `ModularCurvesPartII:R14.2`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- The relevant space for C1 has dimension 3. The C2 level-75 contributions are retained.

Source: CN, Proposition 7.4.4(1) and proof, pp.100–101.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G14`.

### `quarticTorsionClasses` — Explicit quartic torsion classes

**Construction.** In Jac(C2)(ℚ), define D10=[(0:1:1)]−[(-3:7:1)] and D2=5([(0:1:0)]+[(-1/2:-1/2:1)]+Pl2−2Pl1), where Pl1 is the degree-two place cut out in Z=1 by u²−5u+1=0,v+2u−1=0, and Pl2 by u²+u−1=0,v+3u−3=0. The degrees are 1+1+2−2·2=0. These rational divisor classes have exact orders 10 and 2 and D2∉⟨D10⟩. The places here are real quadratic and are distinct from quarticImaginaryPoints.

Construction or proof:
1. Use genuine divisors and the degree-zero Picard/Jacobian comparison; check each support lies on C2 and each place has the claimed degree.
2. Provide principal-function witnesses for 10D10 and 2D2 and nonprincipality witnesses for 5D10,2D10,D2,D2−5D10.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`, `EffectiveDiophantineMethods:ED.6`.

Uses:
- CN Proposition 7.4.4(2): Exhibits the full twenty-element torsion subgroup of the second Jacobian.
- CN Proposition 7.4.5(2): Gives the two order-two sieve generators D2 and 5D10.

API:
- `quarticTorsionClasses_divisors` (data): The two classes are the images of the displayed rational degree-zero divisors, in the named place convention.
- `quarticTorsionClasses_orders` (characterisation): D10 has exact order 10 and D2 has exact order 2.
- `quarticTorsionClasses_independent` (compatibility): The homomorphism ℤ/10⊕ℤ/2→Jac(C2)(ℚ) sending the generators to D10,D2 is injective.

Unit tests:
- `quarticTorsionClasses_test_ten` (computation): 10D10=0, 5D10≠0 and 2D10≠0.
- `quarticTorsionClasses_test_two` (computation): 2D2=0 and D2≠0.
- `quarticTorsionClasses_test_independence` (non-example): D2−5D10≠0, so the subgroup has order 20 rather than 10.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.4(2) proof, p.101; s3ns5.m torsion block.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G15`.

### `quartic_jacobian_torsion` — Torsion of the quartic Jacobians

**Theorem.** Jac(C1)(ℚ)tors is isomorphic to a subgroup of ℤ/2⊕ℤ/2; no equality is asserted. Jac(C2)(ℚ)tors≅ℤ/2⊕ℤ/10, generated by quarticTorsionClasses. Good reductions at 7,11,13 give gcd of group orders 4 for C1 and 20 for C2; Jac(C1)(𝔽13)≅ℤ/2⊕ℤ/1710, which excludes order-4 cyclic rational torsion.

Construction or proof:
1. Certify smooth good reductions and finite Jacobian group orders at the three primes.
2. Use prime-to-p torsion injectivity at multiple primes to get the full rational torsion bound.
3. Use the 2-primary comparison at the good prime 13 for C1 and the independent twenty-element subgroup for C2.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.4(2) and proof, p.101.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G15`.

### `quartic_pullback_indices` — The quartic pullback index bounds

**Theorem.** Choose a saturated generator D of B(ℚ)≅ℤ, viewed in Jac(B)(ℚ), and set Gi=⟨πi*D⟩⊂Jac(Ci)(ℚ). Then 2Jac(Ci)(ℚ)⊂⟨Gi,Jac(Ci)(ℚ)tors⟩ for i=1,2. Consequently 4Jac(C1)(ℚ)⊂2G1 and 10Jac(C2)(ℚ)⊂⟨5G2,Jac(C2)(ℚ)[2]⟩. The source prints G1 in the second inclusion; the correct group is G2.

Construction or proof:
1. Import only the general weak inclusion required from the rank-equal degree-two pullback/norm theorem. On the free quotient the involution acts as +1 and π^*π_*=1+w, so twice a class is a pullback modulo torsion.
2. Use the torsion exponents 2 and 10 to obtain the two displayed inclusions.
3. Keep each generator inside its own Jacobian; do not identify G1 and G2.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`, `ModularCurvesPartII:R14.2`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.4(3) and proof, pp.100–101; Box Proposition 3.1.

### `first_quartic_quadratic_divisors` — Quadratic divisors on the first quartic

**Theorem.** For C1 and its modular quotient π1:C1→B, Sym²(C1)(ℚ)=π1*B(ℚ). Apply the imported relative symmetric sieve with G=⟨2π1*D⟩, I=4, a rational degree-two base divisor pulled back from the origin of B, good prime 43, and L of eight pullback divisors. The reduced group red43(G) is cyclic of order 7, and iota43⁻¹(red43(G)) has exactly seven degree-two divisor classes. L covers all seven, each satisfying the relative Chabauty criterion; hence the bad set is empty.

Construction or proof:
1. Export the quotient/base divisor and certified I·Jac(C1)(ℚ)⊂G from quartic_pullback_indices.
2. Give all eight rational pullback divisors, the seven finite-field possibilities and exact reduction group certificates.
3. For each class certify the trace-zero vanishing differential nonzero first coefficient condition of the imported relative criterion. Then the single-prime sieve has no bad coset.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds`, `EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty`, `EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.5(1), p.101; ns3ons5.m sieve block.

Atlas planet: First quartic quadratic divisors.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G15`.

### `second_quartic_quadratic_divisors` — Exceptional quadratic divisors on the second quartic

**Theorem.** For C2 and π2:C2→B, Sym²(C2)(ℚ)=π2*B(ℚ)∪L16, with L16 sixteen rational effective degree-two divisors not pulled back. Eight are sums of rational points not interchanged by w2; eight are conjugate pairs of quadratic points. Precisely two quadratic pairs are imaginary, the pairs of quarticImaginaryPoints over ℚ(√−55); six are real. Use G=⟨5π2*D,D2,5D10⟩, I=10 and good primes 11,43. The intersection of the two lifted bad-coset sets is empty after the imported symmetric/relative local criteria. A search bound alone is not the completeness proof.

Construction or proof:
1. Export all sixteen degree-two divisors with support fields and distinguish rational sums from irreducible quadratic places.
2. Use the exact finite-index group and base divisor from the script; correct G1 to G2 in the source narrative.
3. Certify reduction maps, trace-zero annihilator differentials and local rank criteria, and enumerate the empty intersection in a finite quotient by the intersection of reduction kernels.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds`, `EffectiveDiophantineMethods:ED.4/symmetric-chabauty`, `EffectiveDiophantineMethods:ED.4/relative-symmetric-chabauty`, `EffectiveDiophantineMethods:ED.5/relative-symmetric-sieve`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Proposition 7.4.5(2), p.101; s3ns5.m sieve block.

Atlas planet: Second quartic quadratic divisors.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G15`.

### `first_quartic_points_modular` — Modularity from the first quartic

**Theorem.** For every quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(ns3°,ns5), E is modular. Its degree-two divisor is pulled back from B(ℚ) by first_quartic_quadratic_divisors, so its j-value is rational. A rational-j curve over a quadratic field is a quadratic twist of a ℚ-model unless j is 0 or 1728; those cases are geometrically CM. Apply rational modularity, base change and twist invariance, or the CM branch.

Construction or proof:
1. Use the divisor classification and the fact that the j-map factors through π1.
2. Handle rational j with the existing ℚ modularity theorem and soluble base change/twisting; use geometric CM for the special j-values.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularity:R29.6/modularity-theorem`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Corollary 7.4.6(1), p.102.

### `second_quartic_points_modular` — Modularity from the second quartic

**Theorem.** For every imaginary quadratic number field F and elliptic curve E/F underlying a noncuspidal F-point of X(s3,ns5), E is modular. All relevant irreducible quadratic pairs are pullbacks from B(ℚ), except quarticImaginaryPoints and their conjugates, which have rational CM j=−32768. Rational degree-two sums contribute only rational points and also have rational j. No conclusion for arbitrary real-quadratic exceptional pairs is inferred from this classification.

Hypotheses: F imaginary quadratic.

Construction or proof:
1. Use imaginary F to discard the six real quadratic exceptional pairs.
2. Apply rational-j modularity to pullbacks and rational points; apply the geometric CM definition at the two exceptional pairs.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularity:R29.6/modularity-theorem`.

Acceptance:
- Verify every quantified hypothesis and the stated comparison against the cited passage.

Source: CN, Corollary 7.4.6(2), p.102.

## IQ.8. Imaginary-quadratic modularity applications

The residual-image theorem assumes irreducibility over the prime field, which is weaker than absolute irreducibility. Its mod-3 exclusion concerns the whole split Cartan normalizer up to conjugacy, not containment in a split normalizer. The finite-X₀(15) theorem removes all residual restrictions on the curve but retains the field-dependent finite-point hypothesis. Algebraic rank certificates establish the four positive applications; the explicit √−10 point verifies a negative test of that hypothesis.

Direct layer dependencies: `ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`, `EllipticCurveModularityImaginaryQuadratic:IQ.1`, `EllipticCurveModularityImaginaryQuadratic:IQ.3`, `EllipticCurveModularityImaginaryQuadratic:IQ.4`, `EllipticCurveModularityImaginaryQuadratic:IQ.5`, `EllipticCurveModularityImaginaryQuadratic:IQ.6`, `EllipticCurveModularityImaginaryQuadratic:IQ.7`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

### `imaginary_quadratic_residual_modularity` — The imaginary-quadratic residual-image criterion

**Theorem.** Let F be an imaginary quadratic number field and E/F an elliptic curve. If GF acts irreducibly on E[5] over 𝔽5 (absolute irreducibility is not required), or GF acts irreducibly on E[3] over 𝔽3 and its image is not conjugate to the whole normalizer of a split Cartan, then E is modular. The mod-3 exclusion is equality up to conjugacy with the whole normalizer, not containment in some split normalizer.

Hypotheses: F imaginary quadratic.; Either of the two displayed residual-image conditions.

Construction or proof:
1. If the p=3 or 5 cyclotomic restriction is absolutely irreducible, apply quadratic_modularity.
2. Otherwise import the precise Cartan classification: for p=3, the image is the whole split normalizer or a subgroup of the actual nonsplit Cartan; for p=5 and [F(ζ5):F]=4, it is contained in a nonsplit normalizer. Every imaginary quadratic field has this degree-4 p=5 extension.
3. If the other residual representation is reducible use its Borel level; otherwise use its applicable Cartan normalizer. The four remaining branches are X(ns3°,b5), X(b3,ns5), X(ns3°,ns5), X(s3,ns5), whose modularity the preceding layers prove.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-modularity`, `ArithmeticGaloisRepresentations:R01.4/restriction-to-the-cyclotomic-field`.

Acceptance:
- Ordinary irreducibility over 𝔽p is distinguished from absolute irreducibility after coefficient extension and from absolute irreducibility of GF(ζp).
- The p=3 image excluded by equality may have irreducible proper subgroups; these are not excluded by this theorem.

Source: CN, Theorem 7.1, p.91; Lemma 7.1.1, pp.92–93; conclusion p.102.

Atlas planet: Imaginary-quadratic residual modularity.

### `finite_level_fifteen_modularity` — Modularity under finite X₀(15)-points

**Theorem.** For an imaginary quadratic number field F with finite X₀(15)(F), every elliptic curve E/F is modular. Finite here means the full set of F-rational points of the compactified curve; since it is an elliptic curve over ℚ with a rational origin, this is equivalent to Mordell–Weil rank zero over F. The statement imposes no restriction on the residual images of E. It is CN Theorem 1.1 and Corollary 7.1.2, not unconditional modularity over every imaginary quadratic field.

Hypotheses: F imaginary quadratic.; X₀(15)(F) finite.

Construction or proof:
1. By imaginary_quadratic_residual_modularity only X(b3,b5)=X₀(15) and X(s3,b5) remain.
2. Use the rational isogeny between their elliptic models to transfer rank zero and finiteness. Every F-point is torsion.
3. Use quadratic_torsion_growth: imaginary torsion growth for X₀(15) occurs only at ℚ(i), while X(s3,b5) has no imaginary growth. Rational points give rational j; the eight new Gaussian points are handled by gaussian_exceptional_modular.
4. Handle geometric CM separately and transport each non-CM geometric coarse class by its quadratic twist.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.8/residual-image-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`.

Acceptance:
- Cusps are discarded when associating an elliptic curve but remain in the finite point set.
- The Gaussian exception is tied to the full eight-point orbit certificate and Faltings–Serre comparison, not an unsupported database label.

Source: CN, Theorem 1.1, p.2; Corollary 7.1.2 and proof, p.93.

Atlas planet: Imaginary-quadratic modularity theorem.

### `small_imaginary_quadratic_modularity` — Small-field modularity applications

**Theorem.** For F=ℚ(√−d) with d∈{1,2,3,5}, X₀(15)(F) is finite and hence every elliptic curve over F is modular. Each application includes a certified rank-zero calculation for the rational elliptic model E15 and its quadratic twist by −d: rk E15(F)=rk E15(ℚ)+rk E15^(−d)(ℚ)=0. The Gaussian field retains its extra torsion without acquiring positive rank.

Construction or proof:
1. Use the quadratic-extension rank decomposition for the elliptic curve E15.
2. Certify rank zero of each of the four twists with descent/Selmer upper bounds.
3. Apply finite_level_fifteen_modularity separately for each field.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`, `EffectiveDiophantineMethods:ED.3`, `EffectiveDiophantineMethods:ED.6`.

Acceptance:
- Rank computations use algebraic rank bounds; a finite search or numerical L-value is insufficient.

Source: CN, §1 after Theorem 1.1, p.2.

Open inputs: `EllipticCurveModularityImaginaryQuadratic/G16`.

### `sqrt_minus_ten_infinite_level_fifteen` — A field outside the finite-point hypothesis

**Theorem.** Let F=ℚ(√−10) and s²=−10. The point (x,y)=(-1,6s) on E15:y²=x(x+16)(x+25) is nontorsion. It is not rational, and quadratic_torsion_growth shows that E15(F)tors=E15(ℚ) because F is neither ℚ(i) nor ℚ(√5). Hence X₀(15)(F) is infinite. This gives a concrete field to which finite_level_fifteen_modularity does not apply; it says nothing against modularity of particular curves over that field.

Construction or proof:
1. Verify (6s)²=−360=(-1)·15·24 and s∉ℚ.
2. Use the exact torsion-growth theorem to show this nonrational point cannot be torsion.
3. Use the E15/X₀(15) isomorphism to infer an infinite rational point group over F.

Direct prerequisites: `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`.

Acceptance:
- Changing y to 6 or dropping the factor √−10 fails the curve equation.
- The finite-point hypothesis is not asserted for all imaginary quadratic fields.

Source: CN, Corollary 7.1.2 torsion-growth proof, p.93; explicit substitution in its E15 equation.

## Supplier contracts and certificate obligations

A request names the existing supplier whose statement is consumed or whose direction needs an extension. A request does not assert that its theorem has been formalized. The two concurrent sibling contracts without IDs are listed in the gap ledger. Every gap is linked to its exact consumers in the packet.

### `GL2AutomorphicRepresentationsAndTransfer:R16.4`

GL₂(𝔸F) cuspidal regular algebraic representations for a CM number field; weight 0, Tate-normalized determinant/central-character dictionary and strong multiplicity one.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness`.

### `AutomorphicGaloisRepresentationsPartII:AG2.7`

Use the genuine rπ,ι and compatible-system coefficients, invariant lattices and residual semisimplification, not a private carrier; existential decomposed genericity means one rational q split in F with every place above q satisfying the eigenvalue-ratio exclusions.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes`.

### `AutomorphicGaloisRepresentationsPartII:AG2.5`

Varma local–global compatibility and pure WD upgrade, retaining monodromy, in the exact CN Lemma 6.1.3 elliptic-curve application.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

Local Tate uniformization, good ordinary/supersingular reduction, potential reduction trichotomy and the associated elliptic WD representations over finite extensions of p-adic fields. Required extension: geometric CM implies potentially good reduction at every finite place; a Tate place has nonintegral j and therefore excludes CM. This supplies the non-CM auxiliary witness independently of the prescribed p-adic partition.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

Purity for the unramified elliptic Tate representation (the Hasse bound), with the local WD purity input needed to recover N at bad places explicitly separated.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`.

### `OrdinaryAutomorphicFormsAndModularityLifting:R21.1`

Extend ordinary automorphic conventions to CM GL₂ and the Geraghty Lemma 5.6 weight-zero Steinberg-twist criterion used in CN Lemma 6.1.3(4).

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary`.

### `GL2AutomorphicRepresentationsAndTransfer:R17.4`

Solvable cyclic base change and descent for GL₂ over CM fields, with the irreducibility/cuspidality hypotheses and quadratic-character twisting compatibility.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`

An isogeny induces an isomorphism of rational Tate modules over the number field; use the upstream isogeny carrier. Expose the geometric CM endomorphism predicate and its isogeny compatibility. The CM potentially-good-reduction theorem is requested from EllipticCurves Layer 4; these are interfaces to the same CM carrier.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modularity-invariance`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types`.

### `tauceti:TauCetiRoadmap/ModularCurves#5c-the-twisted-curve-yρ`

Number-field fixed-pairing full-level twist at p=3,5. The upstream stage is over ℚ; this packet owns its number-field adapter and imports the existing moduli construction.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist`.

### `ModularCurvesPartII:R12.4`

Extend fixed-pairing twists to the AKT 9.6 mod-2/mod-3 discriminant-preserving coupling and the AKT 9.4 CM sixth-power descent needed by the switching seed, with all local and equivariance hypotheses.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`.

### `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`

Weak approximation at a finite set of places of a number field, including real sign control and its ℙ¹ form.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`.

### `InverseGaloisAndArithmeticFundamentalGroups:IG.2`

Hilbert irreducibility on an open ℙ¹ over a number field with finite local open conditions and disjoint specialization; distinguish this from the missing CM solvable-globalization contract G3.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`

The symplectic torsion basis and Weil pairing under GF-action over a number field.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/symplectic-twist`.

### `ArithmeticGaloisRepresentations:R01.4`

CN Lemma 6.2.2: for quadratic F/ℚ and odd p, a continuous ρ̄:GF→GL₂(𝔽p) absolutely irreducible on GF(ζp) is decomposed generic, by Goursat and Chebotarev simultaneously at both conjugate places. Also Allen–Newton Lemma 2.3: over F/ℚ finite Galois a mod-5 image containing SL₂(𝔽5) is decomposed generic. Import these group/genericity results rather than planning them here.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.3/quadratic-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one`.

### `PadicHodgeTheory:R06.5`

Geometric comparison for elliptic rational Tate modules, with the covariant/dual Hodge–Tate convention translated explicitly to CN HT(εp)=−1.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data`.

### `PadicHodgeTheory:R06.6`

Good-reduction crystalline and semistable Tate-curve comparison for elliptic curves; ordinary iff good ordinary, and split multiplicative gives the stated noncrystalline extension.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/elliptic-lifting-data`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types`.

### `ArithmeticStatistics:ST.0`

Use the unweighted integral short-Weierstrass coefficient family over a fixed number field, fixed norm on ℝ⊗ℤ𝒪F², finite bounded-height counts and the density limit. No isomorphism quotient.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/short-weierstrass-family`.

### `ArithmeticStatistics:ST.2`

Zywina Proposition 5.2 for mod-5 image containing SL₂, giving O((log X)^β/X^(d/2)) exceptional fraction for the ST.0 coefficient lattice; also the nonzero denominator asymptotic after deleting Δ=0.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one`.

### `tauceti:TauCetiRoadmap/ModularCurves#layer-9-γ_h-quotients-quotient-regularity-and-coarse-moduli`

Consume the affine coarse quotient YH for Borel/Cartan level, including finite quotient and geometric coarse point dictionary; the compactification extension is G7.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`.

### `ModularCurvesPartII:R13.4a`

Extend its full/Γ₁/Γ₀ coarse compactification to the shared Cartan/mixed compactification contract G7 once; this source-specific adapter and effective-comparisons EC.6 both consume it. Also supply the normalized genus-zero Borel and Cartan coordinate comparisons in CN 7.1.3.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`.

### `tauceti:TauCetiRoadmap/EllipticCurves#layer-6-the-mordellweil-theorem-aec-viii`

Mordell–Weil finite generation over a number field, in the existing elliptic point-group carrier. Finiteness iff Mordell–Weil rank zero for the two rational-origin conductor-15 models; quadratic rank decomposition for E15 and its twist.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples`, `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-modularity`.

### `EffectiveDiophantineMethods:ED.3`

Certified rational elliptic descent, torsion bounds and saturation for B=225A1; rank cannot be inferred from an analytic L-value alone. Certified genus-two 2-descent, Mumford torsion arithmetic and good-reduction torsion bounds for the finite Jacobian of CN 7.3.1. Certify algebraic ranks and good-reduction torsion bounds for the exact elliptic factors and genus-three Jacobians in CN 7.4.4. Certified rank-zero descent/Selmer bounds for the four rational twists of E15 in the applications to ℚ(√−1),ℚ(√−2),ℚ(√−3),ℚ(√−5).

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion`, `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples`.

### `EffectiveDiophantineMethods:ED.6`

Proof-producing arithmetic and birational-map certificate checking for the source-specific computations; exact outputs are enumerated by G8–G16. Exact hyperelliptic normalization, group/table certificates and residual-image/matching certificate for the exceptional ℚ(√−11) point, as enumerated in G12–G13. Proof-producing verification of all quartic model, quotient, rank, torsion, divisor, differential and finite-sieve certificates detailed in G14–G15. Check the complete rank-zero certificates required by G16, retaining the Gaussian torsion growth.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-a-line-bundles-divisors-picard-group-degree`

Use rational divisors and rational linear equivalence, plus the map of degree-zero rational divisor classes into the relative Picard/Jacobian; do not identify it with all rational Jacobian points without descent. Canonical/hyperelliptic degree-two divisors and rational divisor classes for the genus-two model.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-special-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-b-coherent-cohomology-over-k-genus-riemannroch-serre-duality`

Riemann–Roch and complete linear systems for the smooth genus-one model, including the corrected explicit degree-two bases and quadratic conjugate effective divisors. Genus-two Riemann–Roch: noncanonical degree-two class has dimension 1; canonical linear system is ⟨1,x⟩.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`

The symmetric-square/effective degree-two divisor dictionary, conjugation descent and base change. Quadratic closed points as conjugation-invariant effective degree-two divisors and the infinity chart.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-divisor-dichotomy`.

### `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`

Jacobian existence without a rational basepoint, and the rational Picard/Brauer–Severi obstruction of a complete linear system as in Bruin–Flynn §2; record any required extension of the current roadmap in upstreamNotes. Use the genuine Jacobian of the smooth proper genus-two curve and its rational point/divisor-class comparison.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil`.

### `EllipticCurveModularity:R29.6/modularity-theorem`

Unconditional modularity over ℚ, used only for rational-j representatives and the parent comparison, with the dual Tate-module normalization.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity`.

### `ModularCurvesPartII:R14.2`

Extend the Jacobian correspondence layer once with the general Chen/de Smit–Edixhoven Cartan isogeny/new-old projector comparison and the weak rank-equal bielliptic inclusion 2J⊂⟨π*JC,torsion⟩. This packet owns only its CN 7.4 applications, not the general statements.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-index-bounds`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.3`

Tate-normalized rank-two LLC, determinant/central-character relation, character twisting and Steinberg monodromy, with source normalization matched explicitly.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`.

### `GL2AutomorphicRepresentationsAndTransfer:R16.6`

Extend the current ℚ/Hilbert cohomological-specialization layer with CM weight-zero conventions and the rational-Q newform/CM automorphic bridge. Its present Hilbert scope alone does not define the CM weights.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`.

### `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`

The CM extension proposed here must supply the independent AKT Theorems 7.1 and 8.1 with every hypothesis stated in G4; the current classical ordinary layer does not supply these CM seed theorems.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`.

### `ArithmeticGaloisRepresentations:R01.5`

Extend characteristic-zero Frobenius comparison with the general proof-producing Faltings–Serre finite-prime criterion, including residual comparison field and exhaustive test-set bound; all Gaussian-specific data remain here in G9.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity`.

### `ComputationalNumberTheory:CN.5`

Reuse database certificate schemas for the 4050.1-c3 equation, modular form eigenvalues, residual extension and exact finite comparison-prime table; the algebraic comparison theorem is requested from R01.5.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity`.

### `ModularityAndLanglandsExtensions:ML.1`

Register the source-scoped endpoints proved here by citation; supply or route separately the FLHS real-quadratic endpoint required only by the universal quadratic Corollaries 7.2.5 and 7.3.4. This does not make ML.1 the owner of the CM proof or its switching/curve arguments.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity`.

### `CrystallineLocalGlobalCompatibilityCM:CL.9/thm-5-2`

Import CL.9/thm-5-2 (CrystallineCM.potentially_barsotti_tate_lifting_qualified), now written but not independently accepted or formalized at this checkout. The d_cyc=3/A4 qualification is automatic for p=3,5; G5 retains the carrier/formalization gap.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity`.

### `EllipticCurveModularityImaginaryQuadratic/G1` — Automorphic and geometric-CM carriers

The pinned libraries have the Weierstrass curve but no complete number-field GL₂ automorphic representation/rπ carrier, weight-zero predicate or geometric-CM comparison needed for Modular. R16.4, the requested CM extension of R16.6, AG2.7, R01.6 and EllipticCurves are imported; the suggested file records the full declarations as named comments until those genuine carriers exist. No arbitrary proposition fields or phantom representation types are introduced.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/all-primes`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/automorphic-uniqueness`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/modular`.

### `EllipticCurveModularityImaginaryQuadratic/G2` — Monodromy upgrade and p-adic ordinarity

AG2.5 supplies Varma semisimplified compatibility and monodromy bounds, not automatically the full CN 6.1.3(3) isomorphism for E. Request the pure elliptic WD comparison at all finite places and the Geraghty Steinberg-twist ordinarity criterion with coefficient/weight conventions. The source proof has been read; their full foundational declarations have not been located in the baseline.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.1/multiplicative-ordinary`, `EllipticCurveModularityImaginaryQuadratic:IQ.1/weil-deligne`.

### `EllipticCurveModularityImaginaryQuadratic/G3` — CM globalization and Hilbert local conditions

Supply a proof-level globalization lemma for finite solvable local extensions and split CM places, avoiding a specified finite Galois field while splitting the retained generic prime. IG.2 supplies Hilbert specialization but its current stage alone does not establish this local CM globalization. Also supply nonemptiness/openness for the AKT 9.7 discriminant conditions with each prescribed p-adic prototype. The conditions and consumers above specify the exact work; a formaliser cannot replace this by unconstrained solvable base change. The retained Tate places must exclude CM of each switching output. Request the general CM-potentially-good-everywhere theorem and the Tate nonintegral-j criterion from EllipticCurves Layers 1/4; neither a congruence nor the Tate carrier alone proves non-CM.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/hilbert-local-selection`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/solvable-preparation`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-five`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/auxiliary-local-types`.

### `EllipticCurveModularityImaginaryQuadratic/G4` — Independent AKT CM lifting seed

The AKT Theorem 7.1 CM dihedral 2-adic theorem is not supplied by the classical nonsolvable R22.6/R32.3 statements. Its hypotheses are decomposed-generic dihedral residual image with quadratic field M/K, extension to GK⁺→GL₂(𝔽2), almost-everywhere unramified ρ, ordinary weight-zero triangular local shape (α,*;0,ε⁻¹β) with α,β unramified, unipotently ramified WD at 2, Mv=Kv(√u) with odd valuation u, and Kv(√−1)/Kv unramified at every v|2. AKT Theorem 8.1 needs det ε⁻¹, almost-unramified, ordinary weight λ, residual ordinary automorphy, decomposed genericity, cyclotomic absolute irreducibility and its p=5 PSL₂ exception. Propose an OrdinaryAutomorphicFormsAndModularityLifting Part II CM extension for these general theorems; do not silently claim R21.4 supplies them. AKT 9.6 discriminant-preserving mod-2/mod-3 coupling and 9.4 sixth-power descent are requested from the modular-curve twist owner. For AKT 7.1 the quadratic residual field is ramified at every v|2 and ρ is valued in Q̄₂. For AKT 8.1, λ lies in (ℤ²_{+,0})^Hom(K,Q̄p), π is cuspidal on PGL₂(𝔸K), cohomological and ι-ordinary, and its residual rπ is isomorphic to ρ̄; the output has weight ιλ. The source-specific application uses weight zero. For AKT 9.6 the discriminants of A,E agree modulo (K×)⁶ and E[3] is irreducible; the coupling curve has symplectic 2-torsion A[2] and symplectic 3-torsion E[3], and the same discriminant squareclass modulo sixth powers.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.2/seed-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.2/switch-three`.

### `EllipticCurveModularityImaginaryQuadratic/G5` — Planned qualified CM lifting supplier

CrystallineLocalGlobalCompatibilityCM now plans CL.9/thm-5-2, Lean name CrystallineCM.potentially_barsotti_tate_lifting_qualified. Its packet has no accepted independent review at this checkout and is not formalized. Import its exact CN Theorem 5.2 contract: odd p, imaginary CM F, continuous almost-unramified ρ with determinant εp⁻¹ and potentially semistable labeled weights {0,1}; residual decomposed generic and absolutely irreducible on GF(ζp); exceptional p=5 projective-field condition; matching weight-zero cuspidal PGL₂ residual lift with the stipulated crystalline monodromy-zero/potential ordinarity equivalence and noncrystalline ordinary conditions elsewhere. The supplier adds the E12 qualification [F(ζp):F]≠3 or full projective residual image not A4. For this application p=3,5 its cyclotomic degree divides p−1 and is never 3. Preserve the complete residual/cyclotomic avoidance field. No CN §§2–5 proof is replanned here; the remaining gap is realizing the named planned supplier, not inventing a missing roadmap.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/cm-modularity`.

### `EllipticCurveModularityImaginaryQuadratic/G6` — Number-field quantitative Hilbert image estimate

Read Zywina Proposition 5.2: its large-image estimate is required for the fixed mod-5 exceptional set with coefficient norm height over F. ST.2 needs this source-scoped extension, plus the lattice denominator asymptotic and negligibility of the singular locus. R01.4 needs the Allen–Newton 2.3 Galois-field genericity corollary; no declaration currently gives that exact contract. These inputs cannot be replaced by qualitative Hilbert irreducibility.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.3/density-one`.

### `EllipticCurveModularityImaginaryQuadratic/G7` — Shared Cartan compactification and genus-zero coordinate certificates

Upstream ModularCurves layer 9 gives affine coarse quotients; its layer 10 is diamond-level and R13.4a is full/Γ₁/Γ₀ compactification. The general Cartan and mixed-level extension is not present. This packet specifies its source-specific adapter, and proposes placing the reusable extension once in ModularCurvesPartII for both this roadmap and effective-comparisons EC.6. Need normal/geometrically integral fibers, finite quotient descent, smooth proper extension of all maps and cusp/j comparisons, plus proof-level coordinate normalizations of the five genus-zero models. No fine universal curve over a −I coarse quotient is asserted.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/cartan-curves`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/nonsplit-cartan-conic`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/small-models`.

### `EllipticCurveModularityImaginaryQuadratic/G8` — Elliptic quotient map and generator certificate

The Magma source has been read, not run. Export and verify the birational inverse of the mixed model and its direct projective Weierstrass identification on all charts, together with an exact rank/torsion/saturation certificate for B(ℚ). A database label and a printed MordellWeilGroup output are insufficient as proof inputs.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.4/mixed-elliptic-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.4/quotient-mordell-weil`.

### `EllipticCurveModularityImaginaryQuadratic/G9` — Level-fifteen torsion and Gaussian comparison certificates

Kwon’s original theorem was not obtained in this run; CN’s cited special cases have been read, and FLHS v4 15.3–15.4 give the original models, but exact coordinate changes, j-maps, division-polynomial quadratic torsion enumeration and the eight Gaussian j-value orbit table still require certificates. The public LMFDB curve equation was read; its Faltings–Serre proof object, automorphic eigenform, residual comparison extension and exhaustive finite test-prime certificate were not available. Need these exact artifacts, including justification of the prime bound, not just a finite list of matching traces.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/gaussian-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/level-fifteen-identification`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/quadratic-torsion-growth`.

### `EllipticCurveModularityImaginaryQuadratic/G10` — Concurrent Q-curve and real-quadratic endpoints

EllipticCurveModularityPartIIGL2TypeAbelianVarieties has no written stage or reserved node here. Its accepted split owns: a non-CM elliptic Q-curve over a quadratic field F, isogenous over F̄ to its ℚ-conjugate, is modular over F, via a modular GL₂-type abelian variety over ℚ and the coefficient/endomorphism descent. The degree-3 and degree-5 Fricke instances below consume that theorem, never replan it. The all-quadratic Corollaries 7.2.5, 7.3.4 require the known FLHS real-quadratic endpoint, which is outside this imaginary-CM roadmap; ML.1 must register or route this separate real-quadratic supplier before marking those universal statements closed.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-modularity`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-modularity`.

### `EllipticCurveModularityImaginaryQuadratic/G11` — Genus-one Jacobian and rational linear-system certificates

Supply a proof-producing binary-quartic Jacobian transformation to 45A2, two-descent rank upper bound, explicit rational divisor classes/principal functions and the weighted local 3-adic obstruction. Check the corrected RR bases as bases of the complete linear systems, not merely algebraic fiber identities; this includes all pole charts and the degenerate leading-coefficient case in 7.2.1. Bruin–Flynn §2 supplies the conceptual Brauer–Severi descent; its general construction belongs to JacobianChallenge, not a private Picard group here.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-jacobian`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/genus-one-quadratic-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.5/rational-divisor-classes`.

### `EllipticCurveModularityImaginaryQuadratic/G12` — Genus-two model, Jacobian and enumeration certificates

The complete b3ns5.m file was read but no Magma run was performed. Needed: birational maps and their inverse over the smooth normalization; j and w3 compatibility; certified two-descent rank upper bound and independent torsion generators; exact finite-field group certificates; the full twenty-class Mumford table and effective representatives. The counts 9+2+2+6=19 are source conclusions, not an exported exhaustive certificate. The six real classes are kept separate.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-model`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-mordell-weil`, `EllipticCurveModularityImaginaryQuadratic:IQ.6/genus-two-quadratic-points`.

### `EllipticCurveModularityImaginaryQuadratic/G13` — Exceptional image and conjugate-label certificate

Need a proof-producing full mod-5 normalizer-image certificate, determinant-one absolute irreducibility calculation, and normalization-map evaluation for the source point. LMFDB 8100.2-a2 could not be read because its public page required an anti-bot challenge; 8100.3-a2 also could not be independently retrieved. The source equation and its j-identity were read in the author script. Establish the exact conjugate-conductor label relation; do not infer that either source has a typo from differing labels.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.6/eleven-exceptional-comparison`.

### `EllipticCurveModularityImaginaryQuadratic/G14` — Quartic normalization, quotient and rank certificates

The author scripts were read in full but not run, including their calls into external quartic/hyperelliptic packages. Needed: certified smoothness, canonical maps and inverse model isomorphisms; ℚ-automorphism-group order; all projective quotient and j-maps; source-point comparison for j=−32768; Cartan/Hecke isogeny specializations; exact elliptic factor rank certificates. The literal polynomial and linear-coordinate identities can be prototyped independently of these gaps.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-imaginary-points`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-models`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-ranks`.

### `EllipticCurveModularityImaginaryQuadratic/G15` — Quartic torsion and finite sieve certificates

Needed: principal/nonprincipal function witnesses for D10,D2; exact Jacobian reductions at 7,11,13; saturated B generator and base divisor; the eight first-curve pullbacks and all sixteen second-curve exceptions with support fields; reduction group maps; annihilator differential reductions and local symmetric/relative ranks; finite bad-coset tables and the empty intersection at 11,43. No Magma output or dependency-package version/certificate was exported in this design run.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.7/first-quartic-sieve`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/quartic-torsion-classes`, `EllipticCurveModularityImaginaryQuadratic:IQ.7/second-quartic-sieve`.

### `EllipticCurveModularityImaginaryQuadratic/G16` — Small-field rank-zero certificates

Need exact algebraic rank-zero certificates for the twists of E15 by −1,−2,−3,−5 and the quadratic-extension rank comparison in the point-group convention. CN states these four applications; no descent output was produced in this design run.

Consumers: `EllipticCurveModularityImaginaryQuadratic:IQ.8/finite-level-fifteen-examples`.

## Source corrections

These seven corrections are scoped to arXiv:2301.10509v3, whose page images and accompanying scripts were checked where indicated. The packet records the short printed fragment, corrected statement, reason and search for an existing correction. Findings E4, E5, E9 and E17 were also confirmed by the earlier independent paper extraction review. This completed independent review confirms all seven findings, including E18–E20. The differing ℚ(√−11) database labels are a comparison gap, not a claimed source mistake.

- `EllipticCurveModularityImaginaryQuadratic/E4` (Propositions 6.1.5 (3) and 6.1.6 (3), pp.89–90, in arXiv:2301.10509v3 (27 March 2025); page image checked): E_{L_w} E is an elliptic curve over L, so its reduction type is that of E_{L_w}; the proof itself speaks of E_{L_w}.

- `EllipticCurveModularityImaginaryQuadratic/E5` (Proof of Corollary 7.1.2, last paragraph, p.93, in arXiv:2301.10509v3 (27 March 2025); page image checked): the only quadratic field F with X(s3,b5)(Q) ⊊ X(s3,b5)(F)^{tors} is F = Q(√5) The paragraph is about X(s3,b5) (Legendre form y² = x(x+1)(x+16)); for X₀(15) the previous paragraph lists both Q(√−1) and Q(√5).

- `EllipticCurveModularityImaginaryQuadratic/E9` (Proposition 7.4.4 (3) and proof of Proposition 7.4.5, pp.100–101, in arXiv:2301.10509v3 (27 March 2025); page image checked): ⟨5G₂, Jac_{C₂}(Q)[2]⟩ G_i = ⟨π_i^* D⟩ ⊂ Jac_{C_i}(Q); for the curve C₂ the relevant subgroup is G₂ (G₁ lies in Jac_{C₁}).

- `EllipticCurveModularityImaginaryQuadratic/E17` (§7.1, definition of X(H₁,H₂), p.93, in arXiv:2301.10509v3 (27 March 2025); page image checked): such that the image of G_F under r̄_{E,p₁} × r̄_{E,p₂}, conjugated by η, lies in H₁ × H₂ (that is, η_i^{−1} r̄_{E,p_i}(G_F) η_i ⊂ H_i for the components η_i of η) η is a product of isomorphisms F²_{p_i} ≅ E[p_i](Q̄) and H_i ⊂ GL₂(F_{p_i}); the prime must be p_i.

- `EllipticCurveModularityImaginaryQuadratic/E18` (Lemma 6.1.7 opening, p.90, arXiv:2301.10509v3; page image checked): Read p=5 or 3 respectively, when referring to Propositions 6.1.5 and 6.1.6. The propositions have prescribed primes 5 and 3 respectively; the local partition and residual isomorphism in the lemma must use that same prime.

- `EllipticCurveModularityImaginaryQuadratic/E19` (Proof of Proposition 7.2.2, displayed Riemann–Roch basis on p.96, arXiv:2301.10509v3; page image and ns3ob5.m checked): Remove the final y from this numerator term, giving f₀=(y+sx²+5s)/x. Apply the same correction to the terms with −5s in f₁,f₂. The following quadratic fiber equations (7.2.1)–(7.2.3) require addition of sx²±5s to y. The author’s Magma functions use precisely this additive numerator, and substitution in the quartic verifies those equations.

- `EllipticCurveModularityImaginaryQuadratic/E20` (Corollary 7.3.4 proof, printed p.98, arXiv:2301.10509v3 (27 March 2025); read with Proposition 7.3.1 on p.97. Both page images inspected 2026-10-07.): Handle rational points, including both infinity points, through rational j. Use σ(P)=w₃(P) only for nonrational affine points of exact degree two with rational x-coordinate. For f(x)=9x^6−6x^5−35x^4+40x^2+12x−8, the infinity chart t=1/x, v=y/x^3 has v^2=9−6t−35t^2+40t^4+12t^5−8t^6. Its smooth infinity points (0,3),(0,−3) are Q-rational. Galois fixes each, whereas w3 sends v to −v. Thus the asserted equality fails there; the rational-j branch repairs the proof without changing its endpoint.

## Source versions and verification

Public versions were read on 7 October 2026. PDF hashes below identify the actual text. Only the relevant primary statements and proof passages listed here are claimed read. The complete five author calculation files and their README were read at the recorded commit. No Magma execution, numerical rank computation or exported geometric/sieve certificate is claimed.

- **CN**: Ana Caraiani and James Newton, *On the modularity of elliptic curves over imaginary quadratic fields*, arXiv:2301.10509v3, 27 March 2025. [Public source](https://arxiv.org/pdf/2301.10509v3). Read: §1; Theorem 5.2 (supplier contract); §§6–7, including proofs.
  SHA-256: `57abc79ad46875b0ea432ce1193f517b8dbb0ad0448cb51942bc20ed95ffd0c3`.

- **AKT**: Patrick B. Allen, Chandrashekhar Khare and Jack A. Thorne, *Modularity of GL₂(Fp)-representations over CM fields*, arXiv:1910.12986v2, 2 September 2022; Cambridge Journal of Mathematics 11 (2023), 1–158; preprint read. [Public source](https://arxiv.org/pdf/1910.12986v2). Read: Theorems 7.1, 8.1 and A.14 (statements); §9, Lemmas 9.1 and 9.3–9.7, Propositions 9.11–9.15.
  SHA-256: `230de16e9688931b1d4a8ea4ba765f1f5f262d32e94ccf92083062fd1d9b4d44`.

- **FLHS**: Nuno Freitas, Bao V. Le Hung and Samir Siksek, *Elliptic Curves over Real Quadratic Fields are Modular*, arXiv:1310.7088v4, 18 July 2014. [Public source](https://arxiv.org/pdf/1310.7088v4). Read: Theorem 1 statement; §15, Lemmas 15.3–15.4 and low-level curve models (published §§5 locators cited in CN).
  SHA-256: `aea71f7698edac25fedaf03627b7703c0ed6138e4e9c012b06b41822819d0403`.

- **BOX**: Josha Box, *Quadratic points on modular curves with infinite Mordell–Weil group*, Author PDF, 17 July 2019. [Public source](https://warwick.ac.uk/fac/sci/maths/people/staff/box/quadratic_points_4.pdf). Read: §§1–2; Proposition 3.1 and proof; only the weaker 2J inclusion used here.
  SHA-256: `63dccc6175f6da57135eefd602d54699fafca760b6bf38797d45af101a8cb645`.

- **BF**: Nils Bruin and E. Victor Flynn, *Rational Divisors in Rational Divisor Classes*, Author PDF; Algorithmic Number Theory, ANTS VI (2004), pp.132–139. [Public source](https://people.maths.ox.ac.uk/flynn/arts/art24.pdf). Read: §§1–2, complete linear systems and the Brauer–Severi obstruction.
  SHA-256: `efd0361bc5a8b7e2675fbcd854a26a353c9ce6ebca917177849daa245554557a`.

- **ZYW**: David Zywina, *Elliptic curves with maximal Galois action on their torsion points*, Bulletin of the London Mathematical Society 42 (2010), 811–826, author PDF. [Public source](https://pi.math.cornell.edu/~zywina/papers/MaximalGalois.pdf). Read: §1.1, coefficient height convention; Proposition 5.2 and proof inputs.
  SHA-256: `00ec51280a131feb82dba5a3328c1be48c310081d5cb46284e679191ff80250c`.

- **MAGMA-b3ns5**: Ana Caraiani and James Newton, *Caraiani–Newton accompanying Magma calculations: b3ns5.m*, modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81. [Public source](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/b3ns5.m). Read: Complete file; read, not executed. Generated maps and finite outputs are not proof certificates..
  SHA-256: `8f2f8ccf22cbcfc72a5e50be81baad80e81774ec8228e5d3283604d18a3ab240`.

- **MAGMA-ns3ob5**: Ana Caraiani and James Newton, *Caraiani–Newton accompanying Magma calculations: ns3ob5.m*, modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81. [Public source](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ob5.m). Read: Complete file; read, not executed. Generated maps and finite outputs are not proof certificates..
  SHA-256: `04da9d9260d653ac87b0683003e9fb906fb6cc301d23074d99adccbcddd8303f`.

- **MAGMA-ns3ons5**: Ana Caraiani and James Newton, *Caraiani–Newton accompanying Magma calculations: ns3ons5.m*, modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81. [Public source](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ons5.m). Read: Complete file; read, not executed. Generated maps and finite outputs are not proof certificates..
  SHA-256: `8a75af855a4a58f143f32be283232bed9005b0c467223b0313f635f482018323`.

- **MAGMA-s3ns5**: Ana Caraiani and James Newton, *Caraiani–Newton accompanying Magma calculations: s3ns5.m*, modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81. [Public source](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/s3ns5.m). Read: Complete file; read, not executed. Generated maps and finite outputs are not proof certificates..
  SHA-256: `5be5870fb6761340bff1ee41b13d8c5e945a50c60470ee551ec9fd9f5600fc91`.

- **MAGMA-ns3ns5**: Ana Caraiani and James Newton, *Caraiani–Newton accompanying Magma calculations: ns3ns5-elliptic.m*, modularity-iqf commit e6e2e9014f55f91e1d27a23e225a5f474d2e1d81. [Public source](https://raw.githubusercontent.com/jjmnewton/modularity-iqf/e6e2e9014f55f91e1d27a23e225a5f474d2e1d81/ns3ns5-elliptic.m). Read: Complete file; read, not executed. Generated maps and finite outputs are not proof certificates..
  SHA-256: `6761d6db51c97f3811351298b9d46f70f230d6877a77d60c691cea26d537f4a3`.

- **LMF-GAUSS**: The LMFDB collaboration, *Elliptic curve 4050.1-c3 over ℚ(i)*, Public database record accessed 7 October 2026. [Public source](https://www.lmfdb.org/EllipticCurve/2.0.4.1/4050.1/c/3). Read: Weierstrass coefficients, j, discriminant and modularity record; no independent Faltings–Serre certificate downloaded..

The Kwon original torsion-growth theorem and the DGP Faltings–Serre original comparison theorem were not read; the exact CN specializations and certificate gaps are recorded instead. The ℚ(√−11) LMFDB pages could not be independently retrieved because of the public anti-bot response. External code loaded by the author Magma scripts was not downloaded or executed. These are inputs to verify, not an inferred proof from a database flag.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. There is no reviewed library-audit entry for this new roadmap. The supplying audits, genuine Weierstrass/rational-function/polynomial/normalization declarations, existing packet nodes and upstream roadmap layers were checked. The suggested file uses existing Mathlib carriers for every expression it can faithfully type; named full statements requiring absent carriers remain in a comment ledger. It introduces no private surrogate automorphic, Jacobian or modular-curve type and no arbitrary proposition standing for a missing condition.

The suggested file is a signature prototype, with proof holes, and does not certify the arithmetic calculations. Its compile result and exact baseline limitation are in the handoff note. Packet validation checks the dependency graph, references, definitions’ APIs and tests, stage coverage and planet limits. Independent mathematical review must check the source comparisons and all sixteen recorded gaps before declaring layers closed.
