# Rank-zero and rank-one Birch–Swinnerton-Dyer theory, Part II: Eisenstein converses and twist proportions

This continuation of RankZeroOneBSD proves the converse in Selmer coranks zero and one at a good odd Eisenstein prime. Its application converts finite 3-Selmer bounds into analytic-rank bounds on quadratic twists satisfying the same local hypotheses. The main route is complementary-twist nonvanishing, control at the anticyclotomic augmentation prime, the parent's Heegner index-square equality, and the complex Gross–Zagier formula. Arithmetic rank equality and finiteness of the whole Tate–Shafarevich group follow from the separately owned forward theorem after the analytic converse.

This is a complete planning pass: six planned layers, seventeen target-level nodes, three definitions, eighteen API items and twelve definition tests. None of the layers is closed or implemented. Every node has implementation status `unchecked`. One explicit shared frontier, **GAP-CT**, records that the Cassels–Tate pairing modulo divisible subgroups has existing supplier requests but no exact registered endpoint. Ten requests specify the interfaces needed from existing owners. A target ending at a requested supplier is a plan, not an existing library theorem.

## Scope and the existing owners

The aggregate design brief includes three continuations. The CM continuation already belongs to the accepted `CMRankZeroConverse` C.0–C.6 plan, whose endpoints are the newform converse, CM elliptic converses, congruent-number Goldfeld application, CM twist nonvanishing and non-descent density. The Skinner continuation already belongs to the accepted `RankOneConverse` PC.0–PC.6 plan, including Theorems A, A′, B, C and E. Those targets retain their existing owners and prerequisite chains. This continuation supplies the remaining CGLS §5.2 branch and imports the shared `CMRankZeroConverse:C.0/p-converse-property` definition.

The packet's routing proposal directs `PAPER-CASTELLA-ETAL-22/37` to EC.3 and `/38` to EC.4–EC.5. Item `/35`, modular parity, remains at `SelmerIwasawaCohomology:L4/ordinary-selmer-parity`. No CM converse, Skinner localization criterion, generic main conjecture or Selmer distribution theorem is planned again here. In particular, Skinner's residual irreducibility and p≥5 assumptions do not enter the present reducible p=3 applications.

## Conventions

Use the actual upstream Weierstrass curve E/ℚ, its conductor N, its rational cyclic isogeny ι:E→E′ and the Galois action on its kernel. At a prime p, φ is that actual kernel character and ψ=ωφ⁻¹ is the quotient character; ω is the mod-p cyclotomic character. The exclusion is φ restricted to a decomposition group at p being neither 1 nor ω. It is symmetric under duality. Good reduction at p and p>2 are separate hypotheses, retained through every application.

Selmer groups have classical Kummer local conditions on E[pⁿ] and E[p∞]. Their continuous cohomology, finite groups, cofinite generation, Sha and corank are supplier objects. Corank is the ℤ_p-rank of the Pontryagin dual after rationalization; the discrete torsion group itself tensored with ℚ_p would be zero and is not the definition. The rational finite Selmer space is the rational Tate-module limit. Finite-level Kummer conditions can retain Tamagawa terms even where the rational condition is zero.

For the anticyclotomic argument, K has odd fundamental discriminant D<−4, every prime dividing N splits, and p splits. There is no condition that p avoid the class number. Write Γ=Gal(K∞/K)≅ℤ_p, Λ=ℤ_p⟦Γ⟧ and P₀=(γ−1). CGLS's self-dual ordinary compact Selmer module is S and its rank-one discrete dual is X. The primitive Greenberg torsion module denoted X_E in the parent is a different object. All characteristic ideals at augmentation are considered in Λ[1/p]; γ−1 remains noninvertible. The characteristic-ideal and localization conventions come from `PadicMeasuresIwasawaAlgebras:L4`.

Analytic rank means the finite order of the actual arithmetic L-function at 1, with its continuation and functional equation supplied by the parent and ModularForms. The Heegner point is the trace from the Hilbert class field using a fixed modular parametrization. The same point normalization is used in the Kummer class and complex height formula. For squarefree conductor no specialization is required: the chosen general Gross–Zagier supplier includes the classical X₀(N) case with all level primes split.

Quadratic twists are counted by ℚˣ/ℚˣ², each class represented by its unique nonzero signed squarefree integer d, with height |d|. A finite local prescription gives a union of arithmetic squarefree residue classes, and its density uses their actual masses. A change of initial twist is a squareclass bijection, but its effect on this height is not ignored. Statements about analytic-rank proportions use lower limits; existence of the limiting analytic-rank density is not asserted.

## Supplier contracts and nonduplication audit

| Owner | Exact output consumed |
| --- | --- |
| RankZeroOneBSD BSD.0 | Rational newform bridge, actual L-functions, quadratic factorization, root numbers and twisting characters. |
| RankZeroOneBSD BSD.1/BSD.2/BSD.4 | Odd-primary quadratic Selmer decomposition; both complementary twist-nonvanishing branches; forward analytic-rank-at-most-one rank equality and full Sha finiteness. |
| RankZeroOneBSD BSD.7a | Good Eisenstein ordinarity, both local residual factors nontrivial, E(ℚ_p)[p]=0, and the exact CGLS primitive/Heegner main-conjecture equality under (Sel). |
| SelmerIwasawaCohomology L2/L4 | Classical Selmer/corank carriers, rational Kummer comparison and ordinary modular parity. The parity proof has supplier-owned open interfaces; this continuation does not close them. |
| SelmerIwasawaCohomology L3 | Kernel and derived control using actual localization images, invariant errors, local corrections and retained H²/Tor terms; the requested ordinary instantiation is specified below. |
| SelmerIwasawaCohomology L1–L2 | Shared elliptic Cassels–Tate pairing with divisible kernels and paired finite primary quotient: GAP-CT. |
| HeegnerPointEulerSystems HE.8 | Actual norm-compatible Heegner family, its Kummer class, normalization and rank-one pseudo-isomorphism structure. Nonzero tower class alone does not imply nonzero bottom class. |
| PadicMeasuresIwasawaAlgebras L4 | Actual completed algebra, characteristic ideals, height-one localization and the structure theorem. |
| GrossZagierAndArithmeticHeights GZ.8 | General explicit Gross–Zagier formula, specialized to ℚ, trivial ring-class character and the same two elliptic parametrizations, with positive height and nonzero constants. |
| ArithmeticStatistics ST.0/ST.5 | Squareclass families/heights, local counting and density towers; actual global Selmer ratios, signed strata, restricted-family averages, parity and low 3-Selmer bounds. |
| TauCetiRoadmap/EllipticCurves Layers 1,2,4,5,7 | Actual isogenies and torsion, local reduction and integral j, quadratic twists, finite Kummer/Selmer/Sha structures. These are imports, not replacements. |

Read the reviewed `data/library-coverage.json` AUDIT-27 entries for the parent and Selmer suppliers and AUDIT-07 ST.5. Raw elliptic L-series, finite 2-descent and Dedekind S-unit Selmer groups do not supply the analytic/p∞ objects of this proof. The current upstream roadmap tree at commit `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only on 2026-10-19, including the nine newer roadmap families omitted from the atlas snapshot. None supplies this converse or the missing pairing endpoint. The nearby EllipticCurves and ModularForms README documents were read for the carrier and L-function conventions. EllipticCurves Layer 7's Selmer/Sha and isogeny-invariance targets do not explicitly promise the alternating Cassels–Tate pairing modulo divisible subgroups; the existing SI source-extension requests remain its owner.

### Pinned baseline

The source statements below were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The suggested file uses only these existing mathematical carriers. Its one data definition has a real coefficient body. Heavy definitions and main theorems whose carriers do not exist at the pins are specified in this reader; no abstract substitute is introduced in Lean.
- `mathlib:NumberField.finite_setOfPred_logHeight₁_le` in `Mathlib.NumberTheory.Height.NumberField`: Over a number field, the set of elements of bounded logarithmic height is finite; the existing Northcott instances discharge the field-height hypothesis.
- `tauceti:WeierstrassCurve.Affine.finite_naiveHeight_le` in `TauCeti.AlgebraicGeometry.EllipticCurve.MordellWeil.NaiveHeight`: The finite-fiber x-coordinate comparison transfers Northcott from field height to point naive height; its bounded-height sets are finite.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nonneg` in `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight`: For an elliptic affine Weierstrass model over a field with admissible absolute values and decidable equality, the pinned canonical height of every point is nonnegative.
- `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` in `TauCeti.AlgebraicGeometry.EllipticCurve.CanonicalHeight`: Under the same field/ellipticity conditions and Northcott for canonical height, that height is zero exactly on points of finite additive order. The existing instances transfer Northcott from naive height.
- `mathlib:WeierstrassCurve` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The five-coefficient Weierstrass carrier over any ring; no replacement elliptic-curve carrier is introduced.
- `mathlib:WeierstrassCurve.Δ` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The exact discriminant polynomial used in both concrete computations.
- `mathlib:WeierstrassCurve.c₄` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The c₄ polynomial and hence the explicit j numerator.
- `mathlib:WeierstrassCurve.c₆` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The c₆ polynomial; for the nineteen-a3 model its value is8.
- `mathlib:WeierstrassCurve.IsElliptic` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The typeclass asserting the discriminant is a unit.
- `mathlib:WeierstrassCurve.j` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: The j-invariant using the inverse discriminant unit, with an IsElliptic instance.
- `mathlib:WeierstrassCurve.map` in `Mathlib.AlgebraicGeometry.EllipticCurve.Weierstrass`: Coefficientwise base change along a ring homomorphism.
- `tauceti:WeierstrassCurve.quadraticTwistOf` in `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist`: The existing trace/norm-parameter twist by t,n with discriminant parameter t²−4n; it is not a one-parameter raw coefficient formula.
- `tauceti:WeierstrassCurve.Δ_quadraticTwistOf` in `TauCeti.AlgebraicGeometry.EllipticCurve.QuadraticTwist`: For any commutative ring, Δ(E.quadraticTwistOf t n)=(t²−4n)⁶Δ(E).

The current library's quadratic twist is parameterized by trace and norm, t,n, with D=t²−4n. The raw twist for t=0,n=−d has discriminant parameter 4d, so it is in squareclass d but its raw discriminant scales by (4d)⁶. This distinction is checked explicitly in EC.5. Its residue-three test reduces the integral coefficient tuple; there is no ring homomorphism from ℚ to 𝔽₃.

## Layer order

| Layer | Milestone | Status |
| --- | --- | --- |
| EC.0 | Fixed-isogeny hypothesis bundle and finite-Selmer/corank comparison | planned |
| EC.1 | Complementary nonvanishing fields and Selmer corank one over K | planned |
| EC.2 | Augmentation control, normalization and non-torsion Heegner point | planned |
| EC.3 | p∞ and finite-Selmer converses, rank equality and full Sha finiteness | planned |
| EC.4 | Admissible local3 families and positive analytic-rank proportions | planned |
| EC.5 | Concrete model, density3/8 and no-good-twist diagnostic | planned |

The p∞ converse follows EC.0 → EC.1 → EC.2 → EC.3. The shared pairing is needed only for the finite-Selmer comparison and the statistical applications; it is not used to prove the p∞ converse. Each layer below lists its exact stage dependencies, and each target lists its direct dependencies. Requests are mathematical interfaces to existing owners rather than new jobs filed by this worker.

## Target catalogue

Each target has one packet node. Small argument steps remain in its proof route. The definitions list their consumers first, followed by the API and tests those consumers require. Names use the namespace `TauCeti.RankZeroOneBSDPartII`. All source descriptions and target statements are written in our own words.

## EC.0: Fixed isogenies and low-dimensional Selmer groups

Pin the actual isogeny kernel and the good odd-prime local exclusion. Import ordinarity and torsion vanishing, the canonical Selmer carriers and modular parity. Compare a zero- or one-dimensional finite Selmer group with p∞ corank using the shared Cassels–Tate pairing modulo its divisible kernels.

**Stage prerequisites:** `RankZeroOneBSD:BSD.7a`, `SelmerIwasawaCohomology:L1`, `SelmerIwasawaCohomology:L2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

### The fixed-isogeny converse hypotheses

`RankZeroOneBSDPartII:EC.0/eisenstein-converse-data` · definition · planet: **Eisenstein converse hypotheses**

**Named target:** `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData`.

EisensteinConverseData(E,p,ι) records precisely the good odd prime, the actual rational cyclic degree-p isogeny and the local exclusion in the standing hypothesis. The character is the Galois action on ker ι, not an arbitrarily selected semisimple constituent. Reuse upstream isogeny, residual-character, reduction and conductor carriers; this is a Prop-valued hypothesis bundle, not a second elliptic-curve structure. Witness equality is inherited from proof irrelevance; no separate extensionality theorem is needed.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹.

**Construction or proof route.**

1. Bundle the existing predicates and kernel-character equality. Import the Weil-pairing identity φψ=ω. Retain the actual isogeny throughout twisting and duality.

**Direct prerequisites:** `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.

**Check.** Good ordinarity and E(ℚ_p)[p]=0 are consequences supplied by BSD.7a; no irreducibility or parity condition on φ at infinity is added.

**Consumers and interface design.**

- EC.1–EC.3; CGLS Theorem 5.2.1: Fix the same kernel character for parity, auxiliary fields and the main-conjecture input.
- EC.4 admissible twists: Transport the actual isogeny and its character, retaining good reduction.

**API.**

- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.mk` (constructor): For fixed E,p,ι, proofs that p is prime and odd, E is good at p, ι is rational cyclic of degree p, and its actual kernel character avoids 1 and ω locally construct EisensteinConverseData(E,p,ι). No freely chosen residual character is an extra field.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.good_odd` (projection): p>2 is prime, E has good reduction at p, and degree(ι)=p.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.kernel_character` (projection): ker ι has character φ, ψ=ωφ⁻¹, and φ|G_p is neither 1 nor ω.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.dual` (compatibility): The dual isogeny E′→E satisfies the same local exclusion; good reduction is preserved under isogeny.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.transport` (functoriality): An isomorphism of rational isogeny diagrams transports the bundle and its actual kernel character.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.transport_refl` (simp): Transport along the identity isogeny diagram is the identity on the hypothesis bundle.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.transport_trans` (functoriality): Transport along a composite of rational isogeny-diagram isomorphisms equals successive transport, with the canonical identifications of kernel characters.

**Discriminating unit tests.**

- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.unramified_nontrivial` (computation): At p=3 a good ordinary kernel with nontrivial unramified quadratic character η is admitted; its dual has character ωη and is also admitted.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.excluded_characters` (non-example): The local characters 1 and ω are both rejected, including a good curve with a rational point of order p.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.bad_prime` (non-example): A reducible residual action at a multiplicative prime, or any p=2, fails this bundle.
- `TauCeti.RankZeroOneBSDPartII.EisensteinConverseData.extension` (compatibility): A nonsplit residual extension with the permitted actual kernel is admitted; splitting E[p] as a Galois module is not required.

**Source locators.** [CGLS] Introduction, Theorem E and standing hypotheses, pp. 517–521; Theorem 5.2.1, p. 574: The good odd Eisenstein setting and the two excluded local characters are the exact scope of the converse.

### A Selmer group of dimension zero or one

`RankZeroOneBSDPartII:EC.0/small-selmer-corank` · comparison

**Named target:** `TauCeti.RankZeroOneBSDPartII.smallSelmerCorank`.

Under EisensteinConverseData, for r∈{0,1}, dim_𝔽p Sel_p(E/ℚ)=r implies corank_ℤp Sel_{p∞}(E/ℚ)=r. More precisely, E(ℚ)[p]=0 gives Sel_p≅Sel_{p∞}[p]; the latter dimension is corank Sel_{p∞}+2 dim_𝔽p M[p] for a finite p-group M from the paired elementary divisors of the nondivisible Sha part. No finiteness of the whole Sha group is assumed.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. Use cofinite generation of Sel_{p∞} and finite-level Kummer exactness. The requested Cassels–Tate result is on Sha modulo its maximal divisible subgroup.

**Construction or proof route.**

1. Use the coefficient sequence E[p]→E[p∞] and rational p-torsion vanishing to identify the p-torsion Selmer group.
2. Apply the shared pairing with its divisible kernels to the finite nondivisible p-primary Sha quotient. Its paired elementary divisors contribute an even number to the p-torsion dimension; the divisible Selmer part contributes its corank.
3. For r=0 or 1, nonnegativity in r=corank+2s forces s=0 and corank=r. This also shows the p∞ Selmer group is respectively zero or a divisible line.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `SelmerIwasawaCohomology:L2/elliptic-selmer-instance`, `SelmerIwasawaCohomology:L2/corank`, `SelmerIwasawaCohomology:L1`, `SelmerIwasawaCohomology:L2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Check.** A finite cyclic group of order p² has square order but cannot have a perfect alternating pairing; square order alone is not the needed argument. For a divisible line plus a paired finite part with dim M[p]=1, dim Sel_p=3 and corank=1; equality of dimension and corank is not asserted in higher dimension.

**Source locators.** [CGLS] Corollary 5.2.2 and preceding paragraph, p. 575: Finite Selmer dimension gives the same low-rank converse; the coefficient identification requires the paired-primary structure to finish the corank argument. [PS] §1, p. 2; §6, Theorem 8 and Corollary 9, pp. 11–12: Alternation is perfect after quotienting by the divisible kernel and yields paired finite primary factors.

**Coverage and remaining work:** planned. Register and prove the shared Cassels–Tate modulo-divisible endpoint GAP-CT and its finite-Selmer dimension interface.

## EC.1: Complementary twists and Heegner fields

Use the imported ordinary modular parity and both twist-nonvanishing branches to choose imaginary quadratic K with all level primes and p split, odd D<−4 and analytic twist rank1−r. Apply the forward theorem to the twist and odd-primary quadratic descent to establish corank Sel(E/K)=1 before using a main conjecture.

**Stage prerequisites:** `RankZeroOneBSDPartII:EC.0`, `RankZeroOneBSD:BSD.0`, `RankZeroOneBSD:BSD.1`, `RankZeroOneBSD:BSD.2`, `RankZeroOneBSD:BSD.4`, `SelmerIwasawaCohomology:L4`, `RankZeroOneBSD:BSD.7a`, `SelmerIwasawaCohomology:L2`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

### Auxiliary Heegner fields selected from Selmer parity

`RankZeroOneBSDPartII:EC.1/auxiliary-fields` · theorem · planet: **Complementary Heegner fields**

**Named target:** `TauCeti.RankZeroOneBSDPartII.auxiliaryHeegnerFields`.

Under EisensteinConverseData, if corank Sel_{p∞}(E/ℚ)=r∈{0,1}, infinitely many K satisfy the displayed Heegner/split/discriminant conditions and analyticRank(E^K/ℚ)=1−r. In the r=1 case this means L(E^K,1)≠0; in the r=0 case it means a simple central zero of the twist. No analytic-rank assumption on E enters the choice.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. The rational Selmer corank is r=0 or r=1.

**Construction or proof route.**

1. BSD.7a supplies ordinarity. Apply the modular parity theorem to the weight-two realization, using the rational newform bridge and elliptic Kummer comparison: w(E)=(−1)^r.
2. Apply the value branch of BSD.2/bfh-nonvanishing for w(E)=−1, and its derivative branch for w(E)=+1. In the finite splitting set include every prime dividing N and both 2 and p.
3. The sign of the negative discriminant is correct in each branch; splitting at 2 makes it odd. Infinitude excludes D=−3,−4. Splitting at every level prime gives (D,N)=1 and the classical Heegner hypothesis.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `SelmerIwasawaCohomology:L4/ordinary-selmer-parity`, `SelmerIwasawaCohomology:L4/elliptic-finite-kummer`, `SelmerIwasawaCohomology:L2/corank`, `RankZeroOneBSD:BSD.0/rational-newform-bridge`, `RankZeroOneBSD:BSD.2/bfh-nonvanishing`, `RankZeroOneBSD:BSD.0/twist-root-number`.

**Check.** The r=0 branch uses a simple-zero twist and the r=1 branch a nonzero-value twist. Every level prime is split. Skinner’s residual nonsplit-prime auxiliary field is a different input and cannot be substituted here.

**Source locators.** [CGLS] Proof of Theorem 5.2.1, pp. 574–575, conditions (a)–(d) and (d′): Parity determines which of the two complementary nonvanishing branches supplies K.

### The selected field has Selmer corank one

`RankZeroOneBSDPartII:EC.1/selmer-corank-over-k` · comparison

**Named target:** `TauCeti.RankZeroOneBSDPartII.selmerCorankOverHeegnerField`.

For E,p,r and any K selected in EC.1/auxiliary-fields, corank_ℤp Sel_{p∞}(E/K)=1 and E(K)[p]=0. Thus the precise additional (Sel) hypothesis of CGLS Corollary 4.2.3 is satisfied before the Heegner main conjecture is applied.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. corank Sel_{p∞}(E/ℚ)=r∈{0,1} and analyticRank(E^K)=1−r.

**Construction or proof route.**

1. Apply the forward rank-at-most-one theorem only to E^K, whose analytic rank is already known. It gives its Mordell–Weil rank 1−r and finite Sha, hence that Selmer corank.
2. Use the odd-primary quadratic Selmer decomposition to add the two coranks: r+(1−r)=1.
3. Because p splits in K, its completions are ℚ_p. The imported local character exclusion kills local p-torsion and therefore E(K)[p].

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.1/auxiliary-fields`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Check.** Full Sha finiteness for E is not an input. The forward theorem is used on the twist at this point.

**Source locators.** [CGLS] Theorem 5.2.1 proof, pp. 574–575: The complementary twist and quadratic decomposition establish (Sel) without assuming the desired conclusion for E.

**Coverage and remaining work:** planned. Implement the imported modular parity, two nonvanishing branches and quadratic Selmer comparison on the same arithmetic carriers.

## EC.2: Augmentation control and the bottom Heegner point

Prove rational ordinary control at P₀=(γ−1), with finite local errors and the compact specialization kernel explicit. Under corank1 show v_P₀(char X_tors)=0. Apply the parent’s CGLS Heegner index-square equality in Λ[1/p], identify the precise stabilized bottom-class factor and deduce a non-torsion classical Heegner point and a simple zero over K.

**Stage prerequisites:** `RankZeroOneBSDPartII:EC.0`, `RankZeroOneBSDPartII:EC.1`, `RankZeroOneBSD:BSD.7a`, `HeegnerPointEulerSystems:HE.8`, `SelmerIwasawaCohomology:L3`, `PadicMeasuresIwasawaAlgebras:L4`, `GrossZagierAndArithmeticHeights:GZ.8`, `SelmerIwasawaCohomology:L4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`, `GrossZagierAndArithmeticHeights:GZ.0`, `RankZeroOneBSD:BSD.0`.

### Corank-one control at the augmentation prime

`RankZeroOneBSDPartII:EC.2/augmentation-control` · theorem · planet: **Augmentation control**

**Named target:** `TauCeti.RankZeroOneBSDPartII.augmentationControl`.

Under EisensteinConverseData and the Heegner conditions, suppose corank Sel_{p∞}(E/K)=1. Write Λ=ℤ_p⟦Γ⟧, P₀=(γ−1), M_E=T_pE⊗Λ∨ with inverse tautological action, T=M_E∨(1), S=H¹_FΛ(K,T), and X=H¹_FΛ(K,M_E)∨ in CGLS’s ordinary, self-dual convention. The Pontryagin-dual discrete control map has finite kernel and cokernel, so dim_ℚp((X/P₀X)⊗ℚ_p)=1. Together with the supplied rank-one pseudo-isomorphism X∼Λ⊕M⊕M, this gives length_(Λ_P₀)(X_tors,P₀)=0 and v_P₀(char X_tors)=0. Moreover the specialization S/P₀S→H¹_f(K,V_pE) is injective after inverting p.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. Use the exact ordinary local conditions and contragredient action in CGLS §3.4, not the torsion Greenberg dual X_E. Corank Sel_{p∞}(E/K)=1.

**Construction or proof route.**

1. Apply SI’s restriction-control diagram to the actual global and local images. The prime-to-p quotient characters stay nontrivial over a pro-p tower, killing the relevant p-adic invariant terms. At v|p use both nontrivial residual factors. Away from p retain the finite local Kummer/Tamagawa and localization-image errors; prove they have ℤ_p-corank zero, rather than assuming localization surjective.
2. Dualize the resulting finite-kernel/cokernel control and tensor ℚ_p. Localize the supplied pseudo-isomorphism at P₀: pseudo-null errors disappear and Λ_P₀ is a DVR. A nonzero finite-length torsion summand has a nonzero residue quotient, whereas the free rank-one summand already accounts for the entire one-dimensional quotient.
3. For compact specialization, the global coefficient exact sequence gives the kernel as (γ−1) times the same ordinary compact Selmer module after rationalization. Check saturation of the local conditions using the same local diagrams. The derived-control H²/Tor term can contribute to the cokernel and is retained; no surjectivity is claimed.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.1/selmer-corank-over-k`, `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L4/elliptic-finite-kummer`, `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `SelmerIwasawaCohomology:L3`.

**Check.** X denotes the rank-one ordinary dual throughout; replacing it by the Λ-torsion X_E changes the argument. For Λ⊕Λ/P₀ the rational coinvariant dimension is 2, so corank one excludes this example. Neither γ−1 nor P₀ is inverted. Finite p-power errors disappear after inverting p, which leaves P₀ available.

**Source locators.** [CGLS] §3.4, Corollary 3.4.2 and proof, p. 566; Theorem 5.2.1 proof, p. 574: Corank one kills the augmentation-primary ordinary torsion; this is the control input used for nonzero specialization.

### The bottom Heegner class and its normalization

`RankZeroOneBSDPartII:EC.2/heegner-specialization-factor` · comparison

**Named target:** `TauCeti.RankZeroOneBSDPartII.heegnerSpecializationFactor`.

Let κ∞ be the stabilized Heegner class used in CGLS Corollary 4.2.3, P_K=Tr_(K[1]/K)π(x₁), and α the p-adic unit root of X²−a_pX+p. Its bottom specialization is κ₀=u_K⁻¹(1−α⁻¹)²·Kummer(P_K) in H¹(K,V_pE), where u_K=#O_Kˣ/2=1 for D<−4. For the Howard-normalized class κ₁^Hg, pr_K(κ₁^Hg)=u_K α²(β−1)² κ₀ with β=pα⁻¹. The two tower classes generate the same Λ-line. Under the local exclusion both displayed scalar factors are p-adic units.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. Use the same modular parametrization and ring-class trace in the class and the complex Gross–Zagier formula.

**Construction or proof route.**

1. Import the actual norm-compatible Heegner family and its Kummer/Shapiro map from HE.8. At split p take the trace of (1−α⁻¹σ_v)(1−α⁻¹σ_v̄)P[1]/u_K; the Artin actions disappear after the full ring-class trace.
2. Use CGLS Remark 4.1.3, equations (4.4)–(4.5), to compare the Howard and stabilized normalizations. Keep α, β and u_K explicit.
3. Ordinarity and the two excluded residual factors imply a_p≠1 modulo p, hence α−1 is a unit; β is divisible by p and β−1 is a unit. The same comparison handles p dividing the ring-class number without division by that number.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSD:BSD.7a/eisenstein-ordinary-local-exclusion`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `HeegnerPointEulerSystems:HE.8/initial-euler-factor`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Check.** Nonzero tower class alone does not imply nonzero bottom class; EC.2/augmentation-control and the equality are still required. The normalization uses (1−α⁻¹)² after the full trace; it is not the finite group-ring initial factor before trace.

**Source locators.** [CGLS] Remark 4.1.3, equations (4.4)–(4.5), pp. 568–569: The exact norm-compatible stabilization and comparison identify the actual bottom Kummer class.

### The Heegner point is non-torsion from corank one

`RankZeroOneBSDPartII:EC.2/heegner-point-nontorsion` · theorem · planet: **Heegner point from Selmer corank**

**Named target:** `TauCeti.RankZeroOneBSDPartII.heegnerPoint_nontorsion`.

Under EisensteinConverseData and the Heegner conditions, corank Sel_{p∞}(E/K)=1 implies that the specified classical trace point P_K has infinite order. In particular ord_(s=1)L(E/K,s)=1.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. K/ℚ is imaginary quadratic with odd fundamental discriminant D<−4, every prime dividing N splits in K, and p splits as v v̄. No class-number restriction is imposed. The Heegner point, ordinary modules and stabilized class have the normalization fixed in EC.2/heegner-specialization-factor.

**Construction or proof route.**

1. Apply the parent’s CGLS prototype equality, including its explicit (Sel) hypothesis, to obtain char(X_tors)=char(S/Λκ∞)² in Λ[1/p], with S and X of Λ-rank one.
2. EC.2/augmentation-control gives valuation zero on the left. At P₀ this equality forces S_P₀=Λ_P₀ κ∞. In particular κ∞ has nonzero image in (S/P₀S)⊗ℚ_p.
3. Use the injective compact specialization map and the exact bottom factor to obtain Kummer(P_K)≠0, hence P_K is non-torsion. Use the existing canonical-height nonnegativity and zero-iff-torsion statements; number-field Northcott and the finite-fiber x-coordinate comparison discharge their finiteness hypothesis. Import GZ.0’s pinned/Poincaré height normalization, which changes this height only by explicit positive factors. Apply the classical X₀(N) Gross–Zagier formula with all level primes split and nonzero normalization to get L′(E/K,1)≠0. Its root number is −1, so the order is exactly one.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.2/augmentation-control`, `RankZeroOneBSDPartII:EC.2/heegner-specialization-factor`, `RankZeroOneBSD:BSD.7a/cgls-prototype-main-conjecture`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `GrossZagierAndArithmeticHeights:GZ.8/explicit-gross-zagier-formula`, `GrossZagierAndArithmeticHeights:GZ.0/pinned-height-normalization-comparison`, `mathlib:NumberField.finite_setOfPred_logHeight₁_le`, `tauceti:WeierstrassCurve.Affine.finite_naiveHeight_le`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_nonneg`, `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.

**Check.** A divisibility after inverting γ−1 cannot yield this conclusion. The equality is used at P₀ before specialization. Do not use the rank-one BSD control formula whose hypotheses already include Mordell–Weil rank one and finite Sha.

**Source locators.** [CGLS] Corollary 4.2.3, p. 570; Theorem 5.2.1 proof, p. 574: The main-conjecture equality at augmentation proves nonzero classical Heegner specialization and then a simple analytic zero.

**Coverage and remaining work:** planned. Discharge the requested ordinary-control instantiation, its local finite errors and compact saturation; implement the imported characteristic equality and actual Heegner/Gross–Zagier normalizations.

## EC.3: The Eisenstein-prime converses

For r=0,1 prove corank Sel_(p∞)(E/ℚ)=r implies analyticRank(E)=r by subtracting the complementary twist’s order from the simple base-change order. Import the shared p-converse proposition. Deduce equality of Mordell–Weil rank and full Sha finiteness from the forward theorem, then the finite-Selmer version without assuming Sha finite.

**Stage prerequisites:** `RankZeroOneBSDPartII:EC.0`, `RankZeroOneBSDPartII:EC.1`, `RankZeroOneBSDPartII:EC.2`, `CMRankZeroConverse:C.0`, `RankZeroOneBSD:BSD.0`, `RankZeroOneBSD:BSD.4`.

### The Eisenstein-prime p-converse

`RankZeroOneBSDPartII:EC.3/p-converse` · theorem · planet: **Eisenstein-prime p-converse**

**Named target:** `TauCeti.RankZeroOneBSDPartII.eisenstein_pConverse`.

Under EisensteinConverseData, for each r∈{0,1}, corank_ℤp Sel_{p∞}(E/ℚ)=r implies analyticRank(E)=r. Equivalently the shared CMRankZeroConverse:C.0/p-converse-property holds for r=0 and r=1 under these hypotheses. The analytic rank is the order of the actual arithmetic L-function at 1.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. r is a natural number equal to 0 or 1.

**Construction or proof route.**

1. Choose K by EC.1/auxiliary-fields and establish its Selmer corank one by EC.1/selmer-corank-over-k.
2. Apply EC.2/heegner-point-nontorsion to obtain analyticRank(E/K)=1.
3. Use the parent’s quadratic L-factorization and addition of central analytic orders: 1=analyticRank(E)+analyticRank(E^K). Subtract the already known complementary twist order 1−r.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.1/auxiliary-fields`, `RankZeroOneBSDPartII:EC.1/selmer-corank-over-k`, `RankZeroOneBSDPartII:EC.2/heegner-point-nontorsion`, `RankZeroOneBSD:BSD.0/base-change-central-identities`, `CMRankZeroConverse:C.0/p-converse-property`.

**Check.** For r=0 the conclusion is L(E,1)≠0; for r=1 it is a simple zero. There is no squarefree-conductor, residual irreducibility, large-p or extra global parity assumption on the kernel character.

**Source locators.** [CGLS] Theorem 5.2.1, pp. 574–575: The two complementary-twist choices prove both low-corank converses.

### Arithmetic rank equality and finite Sha

`RankZeroOneBSDPartII:EC.3/rank-and-sha` · application

**Named target:** `TauCeti.RankZeroOneBSDPartII.eisenstein_rank_and_sha`.

Under EisensteinConverseData and corank Sel_{p∞}(E/ℚ)=r∈{0,1}, rank_ℤ E(ℚ)=analyticRank(E)=r and Sha(E/ℚ) is finite as a whole group. This conclusion is stronger than finiteness of only Sha[p∞], but it asserts no BSD leading-coefficient or p-valuation identity.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. corank Sel_{p∞}(E/ℚ)=r∈{0,1}.

**Construction or proof route.**

1. First apply the p-converse to establish analytic rank r.
2. Apply the existing forward analytic-rank-at-most-one theorem over ℚ. Its separate outputs give the rank and full Sha finiteness.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.3/p-converse`, `RankZeroOneBSD:BSD.4/analytic-rank-at-most-one-theorem`.

**Check.** Sha finiteness is an output reached after the analytic converse. It is never an assumption on E.

**Source locators.** [CGLS] Theorem 5.2.1, p. 574, final conclusions: The forward Gross–Zagier–Kolyvagin theorem supplies the arithmetic consequences of the converse.

### The finite-Selmer converse

`RankZeroOneBSDPartII:EC.3/mod-p-converse` · theorem · planet: **Finite-Selmer p-converse**

**Named target:** `TauCeti.RankZeroOneBSDPartII.eisenstein_modp_converse`.

Under EisensteinConverseData, if dim_𝔽p Sel_p(E/ℚ)=r∈{0,1}, then analyticRank(E)=rank_ℤ E(ℚ)=r and Sha(E/ℚ) is finite.

**Hypotheses and conventions.** E/ℚ is a Weierstrass curve with IsElliptic, conductor N; p is prime, p>2 and p∤N; ι:E→E′ is a rational cyclic isogeny of degree p. Its actual kernel character φ:G_ℚ→𝔽_pˣ satisfies φ|G_p∉{1,ω}, with ω the mod-p cyclotomic character. The residual quotient character is ψ=ωφ⁻¹. The finite-level Selmer group uses the Kummer local conditions, not a chosen abstract F_p-vector space.

**Construction or proof route.**

1. Use EC.0/small-selmer-corank, including the Cassels–Tate modulo-divisible pairing, to obtain the correct p∞ corank.
2. Apply EC.3/p-converse and EC.3/rank-and-sha.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.0/small-selmer-corank`, `RankZeroOneBSDPartII:EC.3/p-converse`, `RankZeroOneBSDPartII:EC.3/rank-and-sha`.

**Check.** A one-dimensional Sel_p does not give corank one by the coefficient identification alone; the paired finite-part argument is essential. The theorem includes p=3. It does not import Skinner’s p≥5, irreducible residual localization criterion.

**Source locators.** [CGLS] Corollary 5.2.2, p. 575: The low-dimensional finite-Selmer hypothesis gives the same complete conclusion.

**Coverage and remaining work:** planned. Implement the EC.0–EC.2 prerequisites and import the parent forward theorem; GAP-CT is required for the finite-Selmer endpoint.

## EC.4: Admissible quadratic twists and positive proportions

Define the local 3 admissible subset of the existing squareclass-height twist family. Under existence of a good-at-3 twist, choose zero and odd Selmer-ratio strata while holding an admissible3-adic class fixed. Import BKLOS’s restricted-family 1/2 and 5/6 Selmer bounds, apply the finite-Selmer converse, and state positive absolute lower proportions with all denominator factors.

**Stage prerequisites:** `RankZeroOneBSDPartII:EC.0`, `RankZeroOneBSDPartII:EC.3`, `ArithmeticStatistics:ST.0`, `ArithmeticStatistics:ST.5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `RankZeroOneBSD:BSD.0`.

### The admissible three-isogeny twist family

`RankZeroOneBSDPartII:EC.4/admissible-twists` · definition · planet: **Admissible Eisenstein twists**

**Named target:** `TauCeti.RankZeroOneBSDPartII.admissibleTwists`.

Fix an actual rational cyclic 3-isogeny ι:E→E′ with kernel character φ. Inside the existing unweighted family ℚˣ/ℚˣ² set A₃(E,ι)={d : E^d has good reduction at 3 and (φχ_d)|G₃∉{1,ω}}. Here χ_d is the quadratic character of ℚ(√d), and the twisted isogeny has kernel character φχ_d. Count each squareclass once through its unique nonzero signed squarefree integer representative, ordered by |d|. A₃ is determined solely by its allowed local squareclasses at 3.

**Hypotheses and conventions.** E/ℚ is elliptic and ι is an actual degree-3 isogeny. No existence of a good-at-3 twist is built into the definition.

**Construction or proof route.**

1. Pull back the good-reduction and local-character conditions along localization ℚˣ/ℚˣ²→ℚ₃ˣ/ℚ₃ˣ². Use upstream quadratic twisting and the existing squareclass-height family.
2. Good reduction and the local kernel character depend only on the local isogeny diagram, so the subset is independent of representatives.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `RankZeroOneBSD:BSD.0/quadratic-field-character`.

**Check.** The family includes good reduction as well as the character exclusion. A rational 3-isogeny alone does not imply it is nonempty.

**Consumers and interface design.**

- EC.4 restricted statistical bounds: Keep the same local conditions on the family to which the converse is applied.
- EC.5 19a3 calculation and no-good-twist diagnostic: Distinguish a positive local family from an empty one and compute the actual denominator.

**API.**

- `TauCeti.RankZeroOneBSDPartII.mem_admissibleTwists_iff` (characterisation): Membership is exactly good reduction at 3 plus the displayed restricted kernel-character exclusion.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_squareclass` (compatibility): Replacing d by d·u², u∈ℚˣ, preserves membership and the associated isogeny diagram up to isomorphism.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_translate` (functoriality): For a fixed initial twist d₀, d∈A₃(E^d₀,ι^d₀) iff d₀d∈A₃(E,ι). This is a squareclass bijection; no height-preservation assertion is made.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_dual` (compatibility): The dual isogeny on E′ gives the same admissible squareclasses, using ψχ_d=ω(φχ_d)⁻¹ and isogeny invariance of good reduction.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_local` (characterisation): A₃ is the inverse image of a subset of the four local squareclasses ℚ₃ˣ/ℚ₃ˣ².
- `TauCeti.RankZeroOneBSDPartII.mem_admissibleTwists_iff_converseData` (compatibility): For every squareclass d, d∈A₃(E,ι) iff EisensteinConverseData(E^d,3,ι^d). This supplies the hypothesis bundle used by the finite-Selmer converse directly from family membership, and conversely constructs membership from the bundle.

**Discriminating unit tests.**

- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_good_rational_kernel` (computation): For good ordinary E at 3 with rational isogeny kernel, local classes represented by 1,2,3,6 have exactly the class 2 admissible: class 1 fails exclusion, and classes 3,6 fail good reduction.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_square_multiple` (compatibility): For that E the signed squareclasses of 2 and 18 are equal and both admissible; counting both as distinct is rejected.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_no_good_twist` (degenerate): If v₃(j(E))<0 then A₃(E,ι) is empty, regardless of its residual character twists.
- `TauCeti.RankZeroOneBSDPartII.admissibleTwists_nontrivial_unramified` (non-example): If E is good ordinary and φ|G₃ is nontrivial unramified, the identity squareclass is admissible and the unramified nonsquare twist becomes excluded. The rule d≡2 mod3 is not universal.

**Source locators.** [CGLS] Corollary 5.2.3 and proof, p. 575: The converse is applied only on twists satisfying its good-prime and local-character hypotheses. [BKLOS] §2, family and height conventions, pp. 2–3: The denominator is unweighted squareclasses ordered by the norm product of primes with odd valuation, which over ℚ is the absolute squarefree representative.

### Positive Selmer-ratio strata within the admissible family

`RankZeroOneBSDPartII:EC.4/admissible-ratio-strata` · theorem · planet: **Admissible Selmer-ratio strata**

**Named target:** `TauCeti.RankZeroOneBSDPartII.admissible_ratio_strata`.

Suppose E/ℚ has a rational 3-isogeny and at least one quadratic twist with good reduction at 3. For the fixed isogeny write T_m={d:c(ι^d)=3^m} using the signed convention. Then A₃∩T₀ and A₃∩(T₁∪T₋₁) each contain a nonempty finite-local-condition family and have positive density among all signed squarefree parameters ordered by |d|.

**Hypotheses and conventions.** ι:E→E′ is a rational cyclic 3-isogeny. There exists d₀ with E^d₀ good at 3. No explicit numerical lower density independent of E is asserted.

**Construction or proof route.**

1. At 3 fix a local squareclass d₀u for which the twist is good ordinary and the kernel character is allowed: among the two unramified twists of a good model exactly one avoids both 1 and ω. This also kills local 3-torsion on E and E′.
2. Use the existing local Selmer-ratio formula: at 3 the good-model ratio is 1 or 3, depending on whether the kernel lies in the formal group. It stays fixed on this chosen local class. At each bad prime ℓ≠3 choose a local twist with c_ℓ=1 by BKLOS Proposition 10.7; outside 3N every twist has ratio 1.
3. At the real place the two signs give ratios 1 and 1/3. Hence the two choices give global ratios (1,1/3) or (3,1), providing both the zero and an odd signed stratum while preserving the chosen 3-adic class.
4. Weak approximation makes each compatible finite local prescription nonempty. Apply the rational squarefree local-density count with its nonuniform local squareclass masses to obtain positive density. The argument is directly on E’s family; translating by d₀ is not assumed to preserve height.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.4/admissible-twists`, `ArithmeticStatistics:ST.5/selmer-ratio-of-an-isogeny`, `ArithmeticStatistics:ST.5`, `ArithmeticStatistics:ST.0/squarefree-integers-in-residue-classes`, `ArithmeticStatistics:ST.0/family-defined-by-local-conditions`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Check.** The local class at 3 is fixed before applying statistics, and cannot be changed independently after selecting a Selmer-rank set. If the finite-place ratio is 1, the odd stratum obtained is T₋₁; if it is 3, it is T₁. Both are covered by the absolute-ratio-one bound.

**Source locators.** [BKLOS] Proposition 10.1, p. 14; Theorem 10.5, pp. 15–16; Proposition 10.7, p. 17; §11 proof of Theorem 2.6, p. 18: Local ratios and the real sign produce nonempty zero and odd strata. The present application keeps an admissible good-reduction local class at 3 fixed. [CGLS] Corollary 5.2.3 proof, p. 575: Restricting the statistical input to the local family is the additional compatibility check required by the converse.

### Analytic-rank bounds in prescribed admissible families

`RankZeroOneBSDPartII:EC.4/relative-proportion-bounds` · theorem · planet: **Twist-proportion bounds**

**Named target:** `TauCeti.RankZeroOneBSDPartII.admissible_relative_proportions`.

Let Σ⊂A₃ be a nonempty family defined by finitely many local conditions. Put Σ₀=Σ∩T₀ and Σ₁=Σ∩(T₁∪T₋₁). For either nonempty stratum, the lower proportion within Σ₀ of twists with analytic rank and Mordell–Weil rank 0 and finite Sha is at least 1/2, and the lower proportion within Σ₁ with both ranks 1 and finite Sha is at least 5/6. Relative to all signed squarefree twists these give lower bounds (1/2)μ(Σ₀) and (5/6)μ(Σ₁), with μ the same height density.

**Hypotheses and conventions.** ι:E→E′ is a rational cyclic 3-isogeny. The finite local prescriptions defining Σ are globally compatible. Each displayed conditional proportion is asserted only when its denominator stratum is nonempty.

**Construction or proof route.**

1. Import ST.5’s restricted-family 3-Selmer-rank-zero and rank-one bounds, with their signed/absolute ratio convention.
2. For d∈A₃ the local exclusion gives E^d(ℚ)[3]=0, so the supplier’s adjusted 3-Selmer rank equals the actual F₃ dimension. Apply EC.3/mod-p-converse to the zero- and one-dimensional subsets.
3. Use the existing relative-density tower theorem. The stratum densities exist by finite local conditions; multiplication by their fixed density yields the absolute lower bounds, without asserting existence of an analytic-rank limiting density.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.4/admissible-twists`, `RankZeroOneBSDPartII:EC.3/mod-p-converse`, `ArithmeticStatistics:ST.5/three-selmer-rank-zero-in-selmer-ratio-one-twists`, `ArithmeticStatistics:ST.5/three-selmer-rank-one-in-odd-selmer-ratio-twists`, `ArithmeticStatistics:ST.0/relative-density`, `ArithmeticStatistics:ST.0/relative-density-is-multiplicative-in-towers`.

**Check.** Keep the Σ₀ and Σ₁ denominators, and multiply by their actual densities before reporting percentages among all twists. These are lower proportions, not exact Goldfeld densities or percentages for the original unrestricted ratio strata.

**Source locators.** [BKLOS] Theorem 2.5, p. 4; §9.1–§9.2, p. 14: The average/parity argument gives the 1/2 and 5/6 bounds on finite local subfamilies. [CGLS] Corollaries 5.2.2–5.2.3, p. 575: The finite-Selmer converse converts the correctly restricted statistical subsets to analytic-rank subsets.

### Positive proportions of rank-zero and rank-one twists

`RankZeroOneBSDPartII:EC.4/positive-twist-proportions` · theorem · planet: **Positive low-rank twist proportions**

**Named target:** `TauCeti.RankZeroOneBSDPartII.positive_low_rank_twist_proportions`.

Let E/ℚ admit a rational cyclic 3-isogeny and at least one quadratic twist with good reduction at 3. Among the distinct nonzero signed squarefree integers d ordered by |d|, a positive lower proportion have rank E^d(ℚ)=analyticRank(E^d)=0 and finite Sha(E^d/ℚ), and a positive lower proportion have the analogous rank-one conclusion.

**Hypotheses and conventions.** Existence of a good-at-3 twist is an explicit hypothesis. The family is the unweighted squareclass family, not discriminants ordered by their absolute value or minimal curves ordered by naive height.

**Construction or proof route.**

1. Use EC.4/admissible-ratio-strata to find positive-density finite-local-condition families in the two relevant admissible strata.
2. Apply EC.4/relative-proportion-bounds and multiply their positive densities by 1/2 or 5/6. These products are strictly positive.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.4/admissible-ratio-strata`, `RankZeroOneBSDPartII:EC.4/relative-proportion-bounds`, `ArithmeticStatistics:ST.0/quadratic-twist-squareclass-family`.

**Check.** No analytic-rank conclusion is claimed for the complement of A₃ by this argument. No result about density one-half for either rank is asserted.

**Source locators.** [CGLS] Corollary 5.2.3, p. 575, with the good-at-3 scope made explicit: The restricted method proves positive proportions under the good-twist hypothesis; the larger printed scope is recorded in sourceIssues. [BKLOS] Theorems 2.5–2.6, pp. 4–5; §11, p. 18: Positive finite-local-condition Selmer strata combine with the converse.

**Coverage and remaining work:** planned. Implement the local 3 admissibility dictionary and fixed-class ratio construction; discharge the exact rational local-family counting interface; GAP-CT propagates through the mod-p converse.

## EC.5: Concrete models and scope diagnostics

Specify nineteenA3 on Mathlib’s Weierstrass carrier with invariant, twist-normalization and rational 3-torsion tests. Compute its local admissible density 3/8 and the resulting ceiling on this method’s conversion set. Exhibit y²+xy+3y=x³ with v₃(j)=−3, proving that a rational 3-isogeny does not guarantee any good-at-3 quadratic twist.

**Stage prerequisites:** `RankZeroOneBSDPartII:EC.4`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `ArithmeticStatistics:ST.0`.

### The nineteen-a3 Weierstrass model

`RankZeroOneBSDPartII:EC.5/nineteen-a3-model` · definition · planet: **Nineteen-a3 model**

**Named target:** `TauCeti.RankZeroOneBSDPartII.nineteenA3`.

Define nineteenA3:WeierstrassCurve ℚ by (a₁,a₂,a₃,a₄,a₆)=(0,1,1,1,0), so its equation is y²+y=x³+x²+x. This is only a concrete diagnostic model on the existing carrier; it introduces no database label, elliptic-curve type or new twist operation.

**Hypotheses and conventions.** The model is over ℚ. Its nonzero discriminant is a theorem, not a data placeholder.

**Construction or proof route.**

1. Fill the five existing coefficient fields and compute with the existing invariant formulas.

**Direct prerequisites:** `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.c₄`, `mathlib:WeierstrassCurve.c₆`, `mathlib:WeierstrassCurve.IsElliptic`, `mathlib:WeierstrassCurve.j`, `mathlib:WeierstrassCurve.map`, `tauceti:WeierstrassCurve.quadraticTwistOf`, `tauceti:WeierstrassCurve.Δ_quadraticTwistOf`.

**Check.** The coefficient a₂ is 1 and a₃ is 1. Replacing this by a short Weierstrass equation changes both the model and the tests.

**Consumers and interface design.**

- EC.5 local admissibility and CGLS Remark 5.2.4: Compute reduction and the actual local 3 family behind the claimed twist percentages.
- Suggested file: Provide a concrete existing-carrier signature and discriminating tests without fabricating missing Selmer or analytic carriers.

**API.**

- `TauCeti.RankZeroOneBSDPartII.nineteenA3_coefficients` (projection): The five coefficients are exactly (0,1,1,1,0).
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_invariants` (simp): Δ=−19, c₄=−32 and c₆=8.
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_isElliptic` (compatibility): The model is elliptic over ℚ because its discriminant is a nonzero rational number.
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_j` (compatibility): For any IsElliptic instance its existing Mathlib j is 32768/19.
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_map` (functoriality): For every ring homomorphism f:ℚ→+*F into a commutative ring, map f gives the same five integer coefficients in F.

**Discriminating unit tests.**

- `TauCeti.RankZeroOneBSDPartII.nineteenA3_discriminant_test` (computation): The existing discriminant formula gives −19, not +19 or −19².
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_residue_three_test` (computation): Reducing the integral coefficient tuple modulo3 gives an equation over F₃ with affine point count5; adding infinity gives 6 and a₃(Frobenius)=−2. The coefficient a₃ of the equation remains 1.
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_twist_parameter_test` (compatibility): The existing two-parameter twist nineteenA3.quadraticTwistOf(0,−2) has discriminant −19·8⁶. Its squareclass is 2; the raw discriminant does not equal −19·2⁶ without a change of variables.
- `TauCeti.RankZeroOneBSDPartII.nineteenA3_origin_tangent_test` (computation): At the point (0,0) the tangent is y=x, and substitution gives x³=0. The point is a nonidentity rational point of order 3.

**Source locators.** [CGLS] Remark 5.2.4, p. 575: The displayed curve is the worked family used to test the local scope and denominator.

### The actual local family for nineteen-a3

`RankZeroOneBSDPartII:EC.5/nineteen-a3-admissibility` · theorem · planet: **Nineteen-a3 admissible density**

**Named target:** `TauCeti.RankZeroOneBSDPartII.nineteenA3_admissibility`.

For nineteenA3 with the cyclic isogeny generated by P=(0,0), the admissible signed squarefree parameters are exactly d≡2 modulo 3. Their density among all signed squarefree d ordered by |d| is 3/8. In particular a rank-one analytic subset obtained solely by EC.3/mod-p-converse at p=3 inside this family has upper density at most 3/8 in the full family; the number 41.6% cannot be obtained by that restricted conversion.

**Hypotheses and conventions.** Use the exact model, its actual rational kernel P, and signed squarefree parameters. This statement puts no upper bound on the actual full rank-one twist set.

**Construction or proof route.**

1. Compute Δ=−19, hence good reduction at 3. Count six points on E(F₃), giving a₃=−2 and ordinary reduction; the tangent calculation certifies P has order3, so φ is trivial.
2. The two unit squareclasses at 3 preserve good reduction, but only the nonsquare unit changes the local kernel character to the allowed nontrivial unramified one. The ramified squareclasses have bad reduction. Thus membership is precisely 3∤d and d mod3=2.
3. Apply the existing squarefree coprime-residue count with modulus3 separately to positive and negative parameters. The count of 3∤d is 3/4 of all squarefree parameters, and each unit residue accounts for half of it: density 3/8.
4. Any subset of this admissible family has upper density at most 3/8. For valid analytic lower bounds use the intersections with T₀ and T₁∪T₋₁ from EC.4; no unrestricted numerical percentages are transferred.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.5/nineteen-a3-model`, `RankZeroOneBSDPartII:EC.4/admissible-twists`, `RankZeroOneBSDPartII:EC.4/relative-proportion-bounds`, `ArithmeticStatistics:ST.0/squarefree-integers-in-residue-classes`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`, `ArithmeticStatistics:ST.0/relative-density`.

**Check.** The density is 3/8 in signed squarefree parameters, not 1/2 from uniform weighting of the two unramified local classes. P=(0,0) is a point distinct from the group identity at infinity. The diagnostic rejects the proposed argument for the published percentages; it does not disprove those percentages for the full twist family.

**Source locators.** [CGLS] Remark 5.2.4, p. 575: Its explicit example requires an admissible-family denominator before applying the converse. [BKLOS] §2, pp. 2–5; §9.2, p. 14: The Selmer-rank estimates must be restricted to the local family with the same counting measure.

### A three-isogeny does not guarantee a good-at-three twist

`RankZeroOneBSDPartII:EC.5/no-good-three-twist` · theorem · planet: **Good-reduction scope test**

**Named target:** `TauCeti.RankZeroOneBSDPartII.no_good_three_twist`.

The rational Weierstrass curve W:y²+xy+3y=x³ has a rational cyclic 3-isogeny, but no quadratic twist has good reduction at3. Indeed (0,0) has order3, Δ(W)=−2160, c₄(W)=−71, and j(W)=357911/2160 has 3-adic valuation−3. Every quadratic twist has the same j; good reduction would make j integral. Thus A₃(W,ι)=∅.

**Hypotheses and conventions.** W has coefficients (1,0,3,0,0) over ℚ and ι is the isogeny with kernel generated by (0,0).

**Construction or proof route.**

1. The tangent at (0,0) is y=0; its intersection with the cubic has multiplicity3, proving the nonidentity point has order3. Use upstream quotient-by-stable-kernel to obtain the actual isogeny.
2. Compute the invariant formulas and v₃(j)=−3. Use existing twist invariance of j and the local integral-j consequence of good reduction to exclude every twist.
3. Apply the definition of A₃. This is a counterexample to the claim that the converse method’s good-reduction hypotheses can always be reached by quadratic twisting, not to the full printed analytic density conclusion by other methods.

**Direct prerequisites:** `RankZeroOneBSDPartII:EC.4/admissible-twists`, `mathlib:WeierstrassCurve`, `mathlib:WeierstrassCurve.Δ`, `mathlib:WeierstrassCurve.c₄`, `mathlib:WeierstrassCurve.j`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.

**Check.** Twisting can change the residual kernel character, but it cannot change j or make a negative valuation integral.

**Source locators.** [CGLS] Corollary 5.2.3 proof, p. 575; standing good-reduction hypothesis, pp. 517–519: The assertion that the local hypotheses can be arranged by twisting needs a separate good-reduction condition. The explicit invariant calculation supplies a diagnostic.

**Coverage and remaining work:** planned. Implement the local good/ramified-twist and point-order dictionaries; connect the elementary suggested model computations to the actual local-family carrier.

## Source findings and the boundaries of the applications

These two findings are recorded against the published author PDF and collated with arXiv v2. They concern gaps in the displayed conversion argument. Neither finding disproves the stated full-family density conclusion by all possible methods.

### RankZeroOneBSDPartII/E1: Published author PDF, Corollary 5.2.3 and proof, p. 575; standing good-reduction condition, pp. 517–519

**Finding.** The density conclusion is stated for every rational 3-isogeny, and the proof arranges the character exclusion by twisting before invoking the good-prime converse.

**Scope used here.** For the proof developed here, assume that some quadratic twist is good at3, then keep a good, character-admissible3-adic squareclass fixed throughout the statistical argument. EC.4 proves this scoped conclusion. The unrestricted theorem would require an additional input for curves having no good-at-3 twist.

**Reason.** For y²+xy+3y=x³, the point(0,0) gives a rational 3-isogeny, but j=357911/2160 has v₃=−3 and is invariant under twisting. Good reduction would force integral j. Thus twisting cannot always arrange the good-reduction hypothesis needed by Corollary5.2.2.

**Correction search.** Previously recorded as PAPER-CASTELLA-ETAL-22/E2; rechecked against the published author PDF. No separate correction located in the checked listings. This finding does not assert the unrestricted density conclusion is false.

### RankZeroOneBSDPartII/E2: Published author PDF, Remark 5.2.4, p.575

**Finding.** The example19a3 is assigned rank-one and rank-zero analytic lower proportions41.6% and25% by transferring BKLOS bounds through the converse.

**Scope used here.** Use only the intersections of the statistical ratio strata with A₃. The valid absolute lower bounds are(5/6)μ(A₃∩(T₁∪T₋₁)) and(1/2)μ(A₃∩T₀), or the corresponding explicitly chosen finite local subfamilies. No numerical evaluation of these intersections is asserted here.

**Reason.** For y²+y=x³+x²+x and its rational isogeny kernel, admissible signed squarefree parameters satisfy d≡2 mod3, a family of density 3/8. Any rank-one subset produced solely by the p=3 admissible conversion has upper density at most37.5%, below41.6%. A full-family Selmer bound cannot be transferred without tracking this intersection. The argument also supplies no unrestricted25% analytic rank-zero bound.

**Correction search.** Previously recorded as PAPER-CASTELLA-ETAL-22/E33; rechecked against the published author PDF. No separate correction located in the checked listings. Neither numerical statement is disproved for the full actual analytic-rank sets.

The explicit local calculation is also a guard against a plausible incorrect shortcut. Over ℚ₃, the two unit squareclasses do not each have mass1/2 among all squarefree twists: the total unramified mass is3/4 and each unit class has mass3/8. A lower bound within a Selmer-ratio stratum must therefore retain its intersection with the admissible class. The alternative example W has negative 3-adic j valuation, so its admissible set is empty despite the rational3-isogeny.

## Shared frontier and supplier requests

**GAP-CT.** The existing `PAPER-SKINNER-20/83–86` extension and the accepted RankOneConverse requests place the elliptic Cassels–Tate pairing with divisible kernels at SI L1–L2. Its current packet has no target stating the exact paired-primary endpoint. This roadmap imports that ownership and records the interface; it does not construct another pairing. Quotienting out the maximal divisible subgroup is essential: assuming the whole Sha finite at the start would assume part of the desired conclusion.

The finite nondivisible odd-primary quotient must have paired elementary divisors, not just square cardinality. A cyclic group of order p² illustrates the distinction. With rational p-torsion zero, the paired finite part contributes an even number to dim Sel_p, while the divisible line contributes its corank. This is the missing supplier interface used by EC.0 and EC.3. The converse from p∞ corank has its own proof and avoids this frontier.

1. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.** Reuse actual coordinate-pullback isogenies, duals, degree and quotient by the Galois-stable cyclic subgroup. Supply the chord/tangent-to-order3 check for the two diagnostic points; no new isogeny carrier is planned here. Consumers: `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSDPartII:EC.5/nineteen-a3-admissibility`, `RankZeroOneBSDPartII:EC.5/no-good-three-twist`.

2. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.** Reuse the torsion module, its Weil-pairing determinant identity and the isogeny kernel Galois character. The diagonal product of the two residual characters is the mod-p cyclotomic character. Consumers: `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSDPartII:EC.5/nineteen-a3-admissibility`.

3. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.** Reuse good reduction, ordinary reduction, finite-flat connected/étale kernel dichotomy at3, and good reduction ⇒ integral j. Export that for good ordinary reduction at3 the two unramified quadratic twists give exactly one allowed kernel-character class, whereas ramified twists of a good model have bad reduction; isogeny preserves good reduction. Consumers: `RankZeroOneBSDPartII:EC.0/eisenstein-converse-data`, `RankZeroOneBSDPartII:EC.4/admissible-twists`, `RankZeroOneBSDPartII:EC.4/admissible-ratio-strata`, `RankZeroOneBSDPartII:EC.5/nineteen-a3-admissibility`, `RankZeroOneBSDPartII:EC.5/no-good-three-twist`.

4. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-5-twists-aec-x2-x5`.** Reuse actual quadratic twists and twisted isogenies; ker(ι^d) has character φχ_d; j is unchanged and local isomorphism types depend on the local squareclass. The two-parameter raw twist uses t²−4n, as in the pinned library. Consumers: `RankZeroOneBSDPartII:EC.4/admissible-twists`, `RankZeroOneBSDPartII:EC.4/admissible-ratio-strata`, `RankZeroOneBSDPartII:EC.5/nineteen-a3-admissibility`, `RankZeroOneBSDPartII:EC.5/no-good-three-twist`.

5. **`tauceti:TauCetiRoadmap/EllipticCurves#layer-7-selmer-groups-and-sha-aec-x4`.** Finite-level and p∞ Kummer/Selmer sequences, finiteness of Sel_p, cofinite generation, and the coefficient exact sequence identifying Sel_p with Sel_(p∞)[p] under E(ℚ)[p]=0. Use the existing Sha carrier. Consumers: `RankZeroOneBSDPartII:EC.0/small-selmer-corank`, `RankZeroOneBSDPartII:EC.1/selmer-corank-over-k`, `RankZeroOneBSDPartII:EC.2/heegner-specialization-factor`, `RankZeroOneBSDPartII:EC.2/heegner-point-nontorsion`.

6. **`SelmerIwasawaCohomology:L1`.** Export the shared elliptic Cassels–Tate pairing, with both kernels the maximal divisible subgroups and elliptic alternation, on the existing Sha carrier; its finite odd-primary nondivisible quotient has paired elementary divisors. This is the existing PAPER-SKINNER-20/83–86 and RankOneConverse request, not a second pairing construction. See GAP-CT. Consumers: `RankZeroOneBSDPartII:EC.0/small-selmer-corank`.

7. **`SelmerIwasawaCohomology:L2`.** Export cofinite p-primary module structure and the Kummer-compatible comparison dim Sel_p=corank Sel_(p∞)+2 dim M[p] when rational p-torsion vanishes, using the shared pairing modulo divisible kernels. Whole Sha finiteness is not required. See GAP-CT. Consumers: `RankZeroOneBSDPartII:EC.0/small-selmer-corank`.

8. **`SelmerIwasawaCohomology:L3`.** Instantiate the existing kernel-control and derived-control targets for the CGLS self-dual ordinary anticyclotomic local conditions: finite rational discrete-control errors under both nontrivial local residual factors, ordinary compact specialization kernel equal to P₀S after inverting p, and retention of all H²/Tor cokernel terms. EC.2 proves the corank-one consequence and its use in the converse. Consumers: `RankZeroOneBSDPartII:EC.2/augmentation-control`.

9. **`ArithmeticStatistics:ST.5`.** Use the existing global Selmer ratio and signed T_m convention. Export BKLOS local calculations: c∞ is1 or1/3 with both signs attainable; for ℓ≠3 some local twist has cℓ=1 and all twists have cℓ=1 away from3N; at good ordinary3 the ratio is1 or3 by the connected/étale kernel. Keep the chosen admissible3-adic class fixed and use the already planned restricted-family Selmer bounds. Consumers: `RankZeroOneBSDPartII:EC.4/admissible-ratio-strata`.

10. **`ArithmeticStatistics:ST.0/family-defined-by-local-conditions`.** For ℚ and finitely many specified local squareclasses, use weak approximation and squarefree residue counts to give positive height density for each compatible nonempty local family, with signed representatives and additive-Haar-induced local masses. In particular a fixed unit nonsquare class at3 has mass3/8 among all signed squarefree parameters. No general-number-field denominator theorem is assumed. Consumers: `RankZeroOneBSDPartII:EC.4/admissible-twists`, `RankZeroOneBSDPartII:EC.4/admissible-ratio-strata`.

## Suggested-file boundary and acceptance

The compact suggested file gives `nineteenA3`, its five API signatures, four model-test signatures and one numerical scope diagnostic, all on existing pinned carriers. It elaborated through `lean-check` at the pinned libraries on 2026-10-19 with zero errors and only ten proof-placeholder warnings. Its coefficient definition is real-bodied. Elaboration checks the signatures; it does not prove the asserted mathematics.

The other two definitions, their thirteen API items and eight tests, plus the arithmetic theorems, remain reader targets because the requisite actual isogeny/reduction/Selmer/analytic/family interfaces are supplier targets. The model's tangent test is represented by its exact polynomial substitution in Lean; identifying the flex as a nonidentity order-three point and deriving the local admissibility set use the specified upstream point and local-reduction interfaces. No fabricated analytic rank, Selmer module, Galois character, density or Heegner point stands in for those missing carriers.

Before implementation can be considered complete, establish each supplier contract on its canonical carrier, resolve GAP-CT at its single owner, verify ordinary local control and compact saturation with all error terms, and connect the exact Heegner normalization to the general Gross–Zagier formula. Then prove the converse and carry the same local restrictions into each statistical application. Every definition must pass the listed discriminating tests; the density diagnostics must retain their actual denominator and the no-good-twist example must remain outside the positive-proportion theorem's hypotheses.

## Sources read

Locators for CGLS use published pages. BKLOS and Poonen–Stoll locators use the stated author PDFs, whose pagination differs from their journal versions. Public PDF hashes, dates, precise sections and the correction-search record are retained in the packet. No restricted book source is needed for this continuation.

- **[CGLS]** Francesc Castella, Giada Grossi, Jaehoon Lee and Christopher Skinner, *On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes*. Inventiones Mathematicae 227 (2022), 517–580; published author PDF, 64 pages; DOI 10.1007/s00222-021-01072-y. [Version read](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), accessed 2026-10-19. Introduction, standing good-reduction/Eisenstein assumptions, pp. 517–521; §3.4, Theorem 3.4.1 and Corollary 3.4.2, pp. 564–566; §4.1, Theorems 4.1.1–4.1.2 and Remark 4.1.3, pp. 566–569; §4.2, Proposition 4.2.1, Theorem 4.2.2 and Corollary 4.2.3, pp. 569–570; §5.2, Theorem 5.2.1 and Corollaries 5.2.2–5.2.3, Remark 5.2.4, pp. 573–575.

- **[BKLOS]** Manjul Bhargava, Zev Klagsbrun, Robert J. Lemke Oliver and Ari Shnidman, *Three-isogeny Selmer groups and ranks of abelian varieties in quadratic twist families over a number field*. Public author version, 25 pages; Duke Mathematical Journal 168 (2019), 2951–2989. [Version read](https://lemkeoliver.github.io/papers/19-3IsogenySelmer.pdf), accessed 2026-10-19. §2, squareclass height, local-condition families and Theorems 2.1, 2.5–2.6, pp. 2–5; §9.1–§9.2, Cassels ratio and restricted-family rank estimates, p. 14; §10, Propositions 10.1–10.4, Theorem 10.5 and Proposition 10.7, pp. 14–17; §11, proof of Theorem 2.6, p. 18. All locators refer to this author version.

- **[PS]** Bjorn Poonen and Michael Stoll, *The Cassels–Tate pairing on polarized abelian varieties*. Author version dated 6 November 1998, minor correction 23 August 2014, 32 pages; published Annals of Mathematics 150 (1999), 1109–1149. [Version read](https://math.mit.edu/~poonen/papers/sha.pdf), accessed 2026-10-19. §1, elliptic alternation and divisible kernels, p. 2; §2, primary and nondivisible parts, pp. 3–4; §6, Theorem 8 and Corollary 9, pp. 11–12. Pairing construction is a shared supplier obligation, not a construction in this roadmap.

- **CGLS collation:** [arXiv:2008.02571v2](https://arxiv.org/pdf/2008.02571v2), §5.2, pp.31–32, read 2026-10-19. The relevant converse, density statement and example persist in the published author PDF. The author publication listing and journal page were checked for a separate correction; none was located in those listings.
