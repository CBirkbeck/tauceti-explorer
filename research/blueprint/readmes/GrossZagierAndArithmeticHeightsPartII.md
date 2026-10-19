# Roadmap: Gross–Zagier formulas and arithmetic heights, Part II — unitary cycles and the AFL

Build the arithmetic intersection theory of higher-dimensional unitary special cycles, from local Hom-lifting divisors to arithmetic Siegel–Weil formulas and the strongly regular arithmetic fundamental lemma. The local core compares derived Euler intersections with density derivatives in four distinct settings: unramified self-dual, unramified almost self-dual, ramified exotic smooth, and ramified Krämer. A second branch pairs unitary divisors with virtual fat CM one-cycles and uses modularity to recover local AFL identities. The differences between these models, including their exceptional terms and normalizations, are part of the mathematics.

## Scope and ownership

The parent `GrossZagierAndArithmeticHeights` supplies the point-height and Shimura-curve prototype: its GZ.6 arithmetic generating series, GZ.7 CM local intersection identities and GZ.9 rank-one p-adic formulas remain there. This continuation owns unitary special-cycle identities in signature (n−1,1), the model-specific strata and horizontal decompositions needed to prove them, the higher-dimensional arithmetic Siegel–Weil comparisons, and the unitary fat-CM/AFL argument. It does not reconstruct the parent’s Gross–Zagier formula.

The unitary-cycle continuation combines Li–Zhang, Li–Liu’s local inputs, He–Li–Shi–Yang’s Krämer case and Zhang’s separate global AFL argument. The other proposed continuations have distinct end theorems and are assigned the following boundaries. Their item-by-item allocations are preserved in the accompanying packet; no theorem from a separate continuation is assumed here.

| Continuation | Mathematical boundary |
|---|---|
| Unitary arithmetic inner product formula | Li–Liu I and II: arithmetic theta lifts, restricted Beilinson–Bloch heights, local indices, doubling integrals and central L-derivatives. It consumes this roadmap’s local cycle identities; its 53 + 26 routed items belong together. |
| GSpin special-divisor heights | AGHMP big-CM height formulas and SSTT exceptional reductions, with their 75 + 42 routed items. Orthogonal integral models, Kuga–Satake and special-endomorphism lift depths keep their own suppliers. |
| p-adic arithmetic inner product formula | Disegni–Liu’s 18 routed items: Selmer theta lifts and higher-rank p-adic height/L-derivative formulas, beyond the parent’s rank-one case. |
| Higher Green-function CM values | The 23 Gross–Zagier higher-Green/orthogonal CM-value items, distinct from the unitary divisor Green functions used here. |

General hermitian lattices, representation densities and their unramified polynomial identities belong to `GeometryOfNumbersAndQuadraticArithmetic` GN.2–GN.3. Generic supported K-theory, Tor, Euler and projection formulas belong to `SchemeKTheoryOperationsPartII` FK.0–FK.4. PEL moduli and integral p-divisible-group comparison remain with their existing owners. The names `UnitaryRapoportZinkSpacesAndRSZModels`, `FormalSupportedIntersections` and `JacquetRallisRelativeTraceComparison` in the paper briefs are not registered supplier roadmaps: the exact requirements are attached below to real owners, with extensions where their current scope is insufficient.

The current TauCetiRoadmap IntegralLattices and OrthogonalSpinGroups documents are broader than the atlas snapshot. Their lattice and spin foundations are not proposed again. The current Tau Ceti library was also checked for the special-cycle, local-density, formal-model and arithmetic-Chow objects used here; a generic HermitianSignature declaration does not construct any of these objects. Only the pinned polynomial API is used by the representative signatures. No unitary model or arithmetic intersection has been formalized by this document.

## Conventions

Local unramified notation is F/F0 with F0 a finite extension of Q_p, p odd, q=#k_F0 and varpi a common uniformizer. The residue size of F is q². The canonical one-dimensional signature-(0,1) object is bar E; N_n has signature (1,n−1), height-zero framing and relative dimension n−1 over Spf O_breveF. The special Hom form is h(x,y)=lambda_E^(−1)y^vee lambda_X x, linear in x. GN.2 uses conjugate-linearity in its first slot; its input is H(x,y)=h(y,x). Norms, duals and representation counts agree under this bridge. Global negative-line domains use signature (n−1,1); conjugation of the local signature is recorded when comparing conventions.

Ramified models have odd residue characteristic and an anti-invariant uniformizer u or π. They require different duals. Exotic smooth geometry uses h(x,Λ)⊂u^(−1)OE for its trace dual and the scale u^(−2) in the special Hom form; its rank is even. Krämer geometry uses the hermitian sharp dual h(x,Λ)⊂OF and a rank n−1 Lie filtration. A lattice called nondegenerate has nondegenerate rational span, even if it has rank n−1. Integral means contained in the specified dual. Valuations and types always refer to that model’s stated form.

| Local comparison | Interpolation variable | Derivative / correction |
|---|---|---|
| Unramified self-dual | X=(−q)^(−k) | −D′(1); Li–Zhang Whittaker derivative contributes log(q²). |
| Almost self-dual Y | Same unramified variable in rank n+1 | (q+1)Int_Y=∂Den_Λ−Den; auxiliary pullback omits the subtraction. |
| Exotic smooth | X=q^(−s) | −D′(1); the product formula has a factor two from (1−X²). |
| Krämer | X=q^(−2k) | Normalized −2D′(1) plus the dual-vertex correction coefficients c_(2j). |

All derived intersections retain their higher Tor terms. An Euler number is taken only on proper scheme support annihilated by a uniformizer power, so its alternating lengths are finite. A class in a supported K-group, a graded class, a numerical class and an effective cycle are different objects. In particular a vertical derived class is not identified with a vertical subscheme. Formal support products on nonaffine RZ spaces need a separate filtration theorem; the affine product theorem is insufficient.

Use the trace-hermitian Fourier pairing, a fixed unramified additive character and its self-dual Haar measure; state the induced Weil index in every Fourier eigenvalue. The nonsplit unramified and exotic curve functions below have eigenvalue −1. A q appearing inside a density polynomial is the base residue size. Li–Liu’s local Whittaker parameter gives log q in its displayed Euler formula, while Li–Zhang’s gives log(q²); their derivatives cannot be identified without the parameter conversion.

At infinity, dd^c=−(2πi)^(−1)∂∂bar and principal arithmetic divisors use −log|f|². The corrected AFL Gaussian convention pairs with −Ei(−4πa|xi|), as in Mihatsch–Zhang. Li–Zhang’s arithmetic Siegel–Weil current uses its own 2π convention, requiring a simultaneous character/Schwartz-form rescaling. Finite arithmetic degrees carry log of the actual residue size; complex degrees carry one half the sum over embeddings. The ASW reflex denominator [E:F0] and the AFL pairing denominator [E:F] are fixed separately.

## Exact supplier contracts

### From Mathlib and Tau Ceti

The pinned Mathlib commit is `082e2d37e8b0463410cdb532e111cd43d5a66174`; the pinned Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`. The real polynomial carriers `Polynomial`, `Polynomial.C`, `Polynomial.X`, `Polynomial.eval` and `Polynomial.derivative` were read at that Mathlib commit. They provide the normalization witnesses in Suggested.lean. The current library and upstream roadmap check supplements, rather than replaces, this pinned baseline. None of the heavyweight carriers below is postulated as a placeholder in that file.

### From lattice and supported-intersection roadmaps

Import `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `hermitian-dual-lattice` and `hermitian-lattice-invariants`, applying the conjugate-first convention bridge. GN.3’s `normalized-siegel-polynomial`, `cho-yamauchi-weight`, `cho-yamauchi-overlattice-formula` and `siegel-polynomial-functional-equation` have the required unramified scope. The ramified interpolation, primitive products and Krämer correction matrix are extensions of GN.3, as specified below, not consequences of those four nodes.

From `SchemeKTheoryOperationsPartII`, use FK.0 `formal-support`; FK.1 `supported-cup-product`; FK.2 `regular-supported-comparison` with its resolution-property hypothesis; FK.3 `expected-dimension-tor-vanishing`, `closed-union-decomposition` and `cartier-pullback`; and FK.4 `derived-euler-pairing`, `euler-degree`, `cartier-divisor-pairing`, `zero-dimensional-pairing` and `proper-pushforward-projection`. Their actual support and properness hypotheses remain in force. FK.2 `affine-filtration-product` is only affine. A support cokernel formula does not imply injectivity or commutation with inverse limits. This distinction is needed for the formal-space decompositions. The global virtual CM filtration instead uses the requested arithmetic-scheme dimension filtration from SF.5.

### From geometric and analytic owners

PEL M1 `unitary-of-abelian-scheme`, M3 `hermitian-hom-space` and `complex-points` supply their named objects. M6 `hodge-line-bundle` supplies the determinant Hodge line; the unitary automorphic line needs the separate comparison requested below. M6’s good-prime deformation input is not a theorem on ramified RZ functors or RSZ models. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2 and R07.4 supply Tate modules, perfect-field covariant Dieudonné modules and integral Breuil comparison. Grothendieck–Messing is requested from CrystallineCohomology CR.7; its present delegation loop with R07.2 remains unresolved. Import quasi-canonical constructions and degrees from LubinTateFormalModulesAndQuasiCanonicalLifts LT.6–LT.7 and request its missing lifting lengths below. MotivesAndAlgebraicCycles MC.2 `cycle-class-degree` and `cycle-class-of-fundamental-class` supply cycle classes and degrees, not an unrestricted Tate conjecture. SchemeAndStackFoundations SF.5 supplies the requested Chow/Chern/Riemann–Roch bridge.

ArakelovGeometryAndAbelianHeights R35.1 `arithmetic-divisors-green` and `arithmetic-degree-pairing` provide the divisor/proper-one-cycle pairing. Its relative-dimension-zero stack degree does not supply higher arithmetic Chow products on arbitrary DM models. MetaplecticAutomorphicForms MP.0, MP.2 and MP.3 provide Fourier analysis, the Weil representation and dual-pair sections. AutomorphicSpectralTheory AS.1 `induced-family`, `eisenstein-series` and AS.2 `eisenstein-continuation` provide normalized induction and continuation, not the Siegel–Weil identity. EndoscopicTransferAndUnitaryTraceComparison ET.0 is an ordinary endoscopic layer: the Jacquet–Rallis relative objects require the separate extension below.

**`PELModuli:M6`.** Extend the actual PEL model layer as PELModuli, Part II: represent polarized unramified, almost-dual, exotic-smooth and Krämer RZ functors with their signatures, heights, quasi-isogeny/polarization conditions; prove the stated regularity/smoothness/semistability, canonical one-dimensional lift and integral Hom-lifting ideals; construct the source-admissible RSZ global models and basic RZ uniformization, including relative/absolute exotic comparison. The current good-prime/abelian-model scope does not supply these assertions. Also construct the unitary automorphic line omega of Z §8.1, p.919, with its Petersson metric and comparison to the appropriate PEL Hodge eigenspaces. PELModuli:M6/hodge-line-bundle only supplies the determinant Hodge line; no identification is inferred. Include the special-cycle dimension theorem used in LZ Lemma 2.8.1, pp.13–14, giving codimension two for independent labels before applying Tor vanishing.

**`PELModuli:M4`.** Level normalization and finite Hecke correspondences on the chosen source-admissible unitary integral model: finite étale projections for the prime-to-excluded double cosets; split Drinfeld level with CM-type matching and the unramified reflex/local-reflex extension. No arbitrary higher-level smoothness is inferred.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`.** Tate modules of polarized OF-linear p-divisible groups, exact integral comparison and duality; the integral lifting criterion must retain its actual ramification/full-faithfulness hypotheses, not merely rational Tate comparison.

**`CrystallineCohomology:CR.7`.** Supply the actual Dieudonné-crystal evaluations and Grothendieck–Messing deformation equivalence over nilpotent PD thickenings, with p locally nilpotent, and transport the contravariant filtration interface to the covariant convention of these sources, respecting OF actions and polarizations. R07.2 supplies the perfect-field covariant module but delegates this theorem to CR.7; the inspected CR.7 interface delegates its construction back to R07.2. Resolve this ownership loop and prove the source-specific Hom obstruction and relative/absolute ramified comparison through the PEL extension; neither perfect-field classification nor a reciprocal stage citation supplies them.

**`FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.** Integral Tate/Breuil comparison for the exact quasi-canonical local orders used by LZ §§4.4–4.5; state which torsion-free lattices and ramification bounds allow an integral special Hom to lift. The rank-two quasi-canonical lift-length calculation is a separate unresolved source leaf.

**`MotivesAndAlgebraicCycles:MC.2`.** Etale cohomological cycle classes and Chern character with twists, localization/excision, proper trace and Poincare duality for the smooth proper unitary/exotic/symplectic strata; Frobenius equivariance and finite-extension transport. No general numerical factorization or Tate conjecture is assumed. Specific Lusztig eigenspaces/semisimplicity remain this roadmap’s proof-leaf gaps.

**`MetaplecticAutomorphicForms:MP.0`.** Schwartz–Bruhat Fourier transform for the trace-hermitian pairing, lattice indicator transform and self-dual Haar normalization; archimedean Schwartz spaces and the SL2 Heisenberg/Schrödinger model with the stated conductor.

**`MetaplecticAutomorphicForms:MP.2`.** Weil generator formulas and change-of-character/Weil-index identities with compatible self-dual measures; the local support uncertainty argument and corrected 4π Gaussian/Whittaker comparison. Fourier factors must be identified rather than absorbed into an unspecified constant.

**`MetaplecticAutomorphicForms:MP.3`.** Unitary dual-pair splitting with fixed splitting characters, standard Schwartz-to-Siegel-section map, coherent theta kernel and its admissible theta integral. Export the source-specific range and measure of the needed Siegel–Weil theorem only after that theorem is sourced; generic local theta modules alone are insufficient.

**`GeometryOfNumbersAndQuadraticArithmetic:GN.3`.** Extend the existing unramified density layer to ramified hermitian lattices: trace-dual exotic normal forms/interpolation and its finite overlattice formula; Krämer q^(−2k) interpolation, primitive product formula, normalized vertex density matrix and its invertibility, and the unique correction coefficients. Keep unramified (−q)^(−k), exotic q^(−s) and Krämer q^(−2k) separate.

**`SchemeAndStackFoundations:SF.5`.** Supported Chern character/Riemann–Roch compatible with cycle classes, regular immersions and proper finite correspondences, and Gr_1 G_0(Q)≅CH_1(Q) on proper CM supports. Supply the exact scheme/DM hypotheses and finite-pushforward filtration statement; arbitrary formal filtrations require the separate FK.2 extension. For LL1 §8 use the scheme-theoretic codimension-filtration product on the smooth proper hyperspecial model, with its p-basic test data and permitted finite étale level changes; the formal affine FK.2 theorem is not this input.

**`ArakelovGeometryAndAbelianHeights:R35.1`.** Extend arithmetic-divisor/proper-one-cycle theory to source-admissible regular DM arithmetic models, higher Green-current star products and arithmetic Chow products/degrees, with automorphism weights and half the sum over complex embeddings. Existing arithmetic-divisor and proper-one-cycle pairing nodes are already imported; stack degree in relative dimension zero alone does not give this extension.

**`AutomorphicSpectralTheory:AS.2`.** Normalized degenerate Siegel Eisenstein continuation and local/global Whittaker factorization for the unitary standard sections; separately source Ichino’s theta-integral comparison, convergence/regularization range and the global volume constant. Continuation does not imply Siegel–Weil.

**`EndoscopicTransferAndUnitaryTraceComparison:ET.0`.** A distinct relative extension is required: Jacquet–Rallis regular/strongly regular matching, local twisted orbital integrals with transfer factors, smooth/partial transfer, compatibility with the SL2 Weil action, fundamental lemma (including q=rank from an independent proof), global relative-series convergence/continuation and nilpotent terms. Ordinary endoscopy does not supply this. Propose EndoscopicTransferAndUnitaryTraceComparison, Part II, as owner; keep this an explicit missing interface until accepted.

**`SchemeKTheoryOperationsPartII:FK.2`.** Nonaffine regular formal-scheme codimension-filtration products and expected-dimension statements used on these RZ spaces, with resolution property and exhaustion/derived-limit hypotheses proved. Existing affine-filtration-product is not applicable to arbitrary nonaffine formal schemes.

**`LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7`.** Import LT.6/quasi-canonical-lift, LT.6/quadratic-level-classification and LT.7/quadratic-degree. Extend this direction by the exact unramified Gross–Keating and ramified Shi/He–Shi–Yang lifting-length formulas used in LZ §§4.4–5.4, LL2 Proposition 2.44 pp.28–29 and K Theorem 4.3 pp.27–28; compare the base-uniformizer conductor level to each source valuation and distinguish the two ramified components. Existing degree formulas alone do not give intersection lengths.

The PEL, formal-filtration, arithmetic-Chow and relative-trace extensions are substantive mathematical inputs. No theorem below is claimed closed merely because a stage id is listed as a dependency. In particular, an ordinary endoscopic transfer theorem cannot discharge a Jacquet–Rallis orbital-integral assertion.

## How to read the build

Layers 0–3 prove the unramified local identity through geometry, curve modularity and density induction. Layer 4 compares almost self-dual models and carries their exceptional correction. Layers 5–6 form the even-rank exotic smooth proof; Layers 7–8 form the Krämer proof, retaining its unresolved odd-top induction step. Layer 9 sets up the local AFL independently of the arithmetic Siegel–Weil branch. Layers 10–12 build global special cycles, virtual fat CM cycles and their modular arithmetic pairings. Layer 13 gives arithmetic Siegel–Weil targets. Layer 14 uses the global pairing and relative trace series to isolate local strongly regular AFL orbits. Each layer’s statements carry their own source locators, direct prerequisites and tests.

## Layer 0: Unramified special cycles and derived intersections

Over an odd-residue-characteristic unramified quadratic local extension, define liftability cycles on the signature (1,n−1) Rapoport–Zink functor, their derived classes and Euler intersections. Prove Cartierness, basis independence, proper full-rank support, cancellation and the rank-one normalization. Generic formal K theory and the RZ representability input are imported contracts.

### 0.1 Special Hom convention comparison

Establish `homConventions`. For the unramified framing pair (bar E,X), V=Hom^0_OF(bar E,X) has h(x,y)=lambda_E^(-1)y^vee lambda_X x, linear in x. Under the conjugate-first convention of GN.2 use H(x,y)=h(y,x). This preserves h(x,x), dual lattices, length and density counts; conjugate signature (n−1,1) gives Zhang’s convention. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§1.7–1.8,2.1–2.2, pp.7–10.)

The argument is to check Rosati conjugation on both scalars before transporting signatures or duals.

**Check.** A norm and its valuation are unchanged by the convention switch.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `PELModuli:M3/hermitian-hom-space`.

### 0.2 Unramified Kudla–Rapoport cycles

Construct `specialCycles`. On the actual RZ functor N_n over Spf O_breveF, for a finitely generated OF-submodule L⊂V define Z(L)(S) by extension of every framing quasi-homomorphism x∈L to bar E_S→X. For nonzero x set Z(x)=Z(OF x). This is a closed representable subfunctor; Z(L) depends on its generated module, not a chosen tuple. N_n is formally smooth of relative dimension n−1. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§2.1–2.3, pp.10–11.)

The argument is to apply the requested RZ representability and Hom-lifting deformation theorem, then intersect the liftability ideals.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `specialCycles.lift`: S factors through Z(L) iff all x∈L lift.
- `specialCycles.span`: Equal OF-spans give equal closed cycles.
- `specialCycles.equivariance`: gZ(L)=Z(gL) for the framing unitary action.
- `specialCycles.baseChange`: For a base change of the test scheme, pullback of Z(L) is the same simultaneous Hom-lifting locus; in particular Z(L+M)=Z(L)∩Z(M) as closed subfunctors.

**Checks.**

- Replacing a generator x by a unit multiple fixes Z(x).
- Z(0)=N_n as a liftability locus, so Cartierness must exclude x=0.
- For h(u,u)=1, Z(u) is the lower-dimensional RZ space.

*Needs:* Layer 0 `homConventions`, `PELModuli:M6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 0.3 Cartier and difference divisors

Prove `cartierDifference`. For 0≠x∈V, Z(x) is an effective Cartier divisor or empty; relative flatness is not asserted. D(x)=Z(x)−Z(x/varpi) is effective and regular, and locally finitely Z(x)=Σ_i≥0 D(x/varpi^i). For F-linearly independent x,y, Tor_i(O_Z(x),O_Z(y))=0 for i>0. The special-cycle dimension theorem supplies the codimension condition needed to apply regular-sequence comparison. ([LZ](https://arxiv.org/pdf/1908.01701v3) §2.4 p.11; Lemma 2.8.1 pp.13–14.)

The argument is to use the requested Hom obstruction, difference-divisor regularity and special-cycle dimension theorems. For two independent labels the latter gives codimension two; then apply Cohen–Macaulay regular-sequence comparison. A nonzero label can have a vertical cycle, so Cartierness must not be upgraded to relative flatness.

*Needs:* Layer 0 `specialCycles`, `SchemeKTheoryOperationsPartII:FK.3/expected-dimension-tor-vanishing`.

### 0.4 Derived KR class and Euler intersection

Define `derivedCycle`. For rank-r L with basis x_1,…,x_r, take the supported K-class of the derived tensor of O_Z(x_i). Its codimension-r graded image is LZ(L); for full rank n define Int(L) by the finite-length Euler map. The support must be a proper scheme killed by a power of the uniformizer. Graded products on this nonaffine formal space require the explicit filtration input below. ([LZ](https://arxiv.org/pdf/1908.01701v3) Definitions 2.4.1–2.4.2 p.11; Corollary 2.8.2 p.14.)

The argument is to use a finite Koszul model on each noetherian open; glue and pass through the supported Euler map after the properness theorem.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `derivedCycle.koszul`: The class is the derived tensor, including higher Tor.
- `derivedCycle.graded`: The rth graded image is functorial under restriction.
- `derivedCycle.euler`: On a finite proper support, Int is the alternating length Euler characteristic.
- `derivedCycle.baseChange`: Flat pullback of the supported perfect tensor complex is the tensor of the pulled-back special-cycle complexes; disjoint supports give the zero class.

**Checks.**

- A transverse zero-dimensional intersection gives its ordinary length.
- A self-intersection retains the negative line-bundle term O−O(−D).
- Changing a basis by an elementary OF operation preserves the derived class.

*Needs:* Layer 0 `cartierDifference`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing`, `SchemeKTheoryOperationsPartII:FK.2`.

### 0.5 Basis independence and finite support

Prove `basisProperness`. The derived tensor class for a lattice is basis-independent. For full-rank L, Z(L) is a proper scheme over O_breveF annihilated by a power of varpi, with reduced fibre proper over the residue field; thus Int(L) is finite. Pairwise Tor vanishing for independent labels is used in the elementary basis-change proof. ([LZ](https://arxiv.org/pdf/1908.01701v3) Corollary 2.8.2 p.14; Lemma 2.10.1 pp.14–15.)

The argument is to use elementary generators of GL_r(OF), pairwise Tor vanishing and the signature obstruction to any full-rank characteristic-zero lift. Apply the RZ proper-support criterion on finitely many reduced components; verify the resolution property before using the general supported-K comparison.

*Needs:* Layer 0 `derivedCycle`, `SchemeKTheoryOperationsPartII:FK.2/regular-supported-comparison`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, `SchemeKTheoryOperationsPartII:FK.2`.

### 0.6 Self-dual cancellation

Prove `selfdualCancellation`. If L=M⊥L_2 with M self-dual of rank 0≤r<n and L_2 integral, then Z(M)≅N_(n−r), and the restricted special Hom cycles identify with those for M^perp. For full-rank L this gives Int_n(L)=Int_(n−r)(L_2); the split summand must have the correct framing signature. ([LZ](https://arxiv.org/pdf/1908.01701v3) §2.11, Lemma 2.11.1 p.15.)

The argument is to split off the unit polarized p-divisible-group summand and apply the projection formula for its regular immersion.

*Needs:* Layer 0 `basisProperness`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`.

### 0.7 Unramified rank-one normalization

Establish `rankOne`. For n=1 and h(x,x) of odd nonnegative valuation a, the nonsplit unramified lattice has Int(OF x)=(a+1)/2 and normalized density D(X)=Σ_i=0^a (−X)^i, so −D′(1)=(a+1)/2. Negative valuation gives an empty cycle and zero intersection. This is a witness for the choice of base residue q and derivative sign. ([LZ](https://arxiv.org/pdf/1908.01701v3) Example 2.4.3 p.12; Example 3.5.2 p.18.)

The argument is to compute the finite lifting length and differentiate the finite polynomial sum.

**Check.** a=1 gives 1; a=3 gives 2; a=−1 gives 0.

*Needs:* Layer 0 `basisProperness`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `mathlib:Polynomial`, `mathlib:Polynomial.C`, `mathlib:Polynomial.X`, `mathlib:Polynomial.eval`, `mathlib:Polynomial.derivative`.

### Examples

At odd valuations a=1 and a=3, the rank-one normalized polynomials are 1−X and 1−X+X²−X³; their negative derivatives at one are 1 and 2. At a=0 the polynomial is 1 with derivative zero, but this is outside the nonsplit odd-valuation geometric case. A negative valuation is the empty-cycle boundary. These three controls distinguish the derivative sign, the parity condition and the domain of the geometric formula.

### Dependencies

Use `CrystallineCohomology:CR.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `PELModuli:M3`, `PELModuli:M6`, `SchemeKTheoryOperationsPartII:FK.1`, `SchemeKTheoryOperationsPartII:FK.2`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.

## Layer 1: Unramified strata and horizontal cycles

Identify odd-type vertex strata with unitary Deligne–Lusztig varieties, their incidence and special-cycle support. Classify primitive horizontal cycles by type-at-most-one overlattices, prove Tate-module lifting criteria and compute quasi-canonical degrees; give low-rank vertical checks.

### 1.1 Unitary Deligne–Lusztig varieties

Define `unitaryDl`. For a nondegenerate hermitian space over F_(q²) of dimension 2d+1, let Y_d classify (d+1)-planes U with U^perp⊂U. Orthogonality uses the Frobenius-twisted hermitian pairing. Y_d is smooth projective of dimension d, with closed strata indexed by rational isotropic data. ([LZ](https://arxiv.org/pdf/1908.01701v3) §2.5 p.12; §5.3 pp.25–26.)

The argument is to construct the Grassmannian incidence variety; import its standard scheme and cohomology foundations.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `unitaryDl.points`: The moduli equation is U^perp⊂U, not U⊂U^perp.
- `unitaryDl.strata`: Closed strata inherit the smaller hermitian quotient data.
- `unitaryDl.frobenius`: Frobenius preserves the rational stratification.
- `unitaryDl.baseChange`: For every extension of the residue field, points are obtained by base changing the hermitian space and Frobenius incidence equation; morphisms of test schemes pull back the tautological subbundle.

**Checks.**

- d=0 gives a point.
- d=1 gives the smooth unitary Deligne–Lusztig curve.
- Replacing q-Frobenius orthogonality by bilinear orthogonality changes the incidence equation.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `MotivesAndAlgebraicCycles:MC.2`.

### 1.2 Odd-type vertex cycles

Construct `vertices`. An unramified vertex is Λ⊆Λ^vee⊆varpi^(-1)Λ with odd type t=length(Λ^vee/Λ)=2d+1. The reduced minuscule cycle V(Λ) identifies with Y_d for Λ^vee/Λ. N_red is their union. Strata inclusions reverse lattice inclusions; V(Λ)∩V(Λ′)=V(Λ+Λ′) when the sum is a vertex, and is empty otherwise. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§2.6–2.7, pp.12–13.)

The argument is to use the RZ Dieudonné-lattice dictionary and requested Vollaard–Wedhorn stratification input.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `vertices.quotient`: The finite hermitian quotient has dimension t over the extension residue field.
- `vertices.incidence`: The intersection is indexed by a sum, not an intersection of lattices.
- `vertices.cycleSupport`: Z(L)_red is the union of V(Λ) with L⊂Λ.
- `vertices.ext`: Equality of the underlying OF-sublattices gives equality of vertices, their quotient hermitian data and their closed strata.

**Checks.**

- Type one gives a zero-dimensional stratum.
- Type three gives a curve.
- A lattice not contained in Λ does not give full containment V(Λ)⊂Z(L).

*Needs:* Layer 1 `unitaryDl`, Layer 0 `specialCycles`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`.

### 1.3 Horizontal and vertical classes

Construct `horizontalSplitting`. For rank n−1 nondegenerate Lflat, define Z(Lflat)_H by closure of the generic fibre, and the vertical derived class as LZ(Lflat)−[O_ZH] in the appropriate supported graded group. The vertical class is supported formally on N_red; it is not generally the structure sheaf of one vertical subscheme. ([LZ](https://arxiv.org/pdf/1908.01701v3) Definition 2.9.1 and Lemma 2.9.2 p.14; §§5.1–5.2 pp.23–24.)

The argument is to take generic-fibre closure, then subtract its class using the exact support/cokernel formalism.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `horizontalSplitting.horizontal`: The horizontal cycle is the flat closure of the generic fibre.
- `horizontalSplitting.vertical`: LZ(Lflat)=horizontal+vertical in the stated graded group.
- `horizontalSplitting.support`: Vertical support is formal support, not just set-theoretic support.
- `horizontalSplitting.restriction`: Restriction to the generic fiber kills the vertical class and identifies the horizontal class with the original derived intersection there.

**Checks.**

- An entirely horizontal Cartier cycle has zero vertical class.
- A component contained in the special fibre cannot enter the generic-fibre closure.
- On a proper curve C wholly contained in a Cartier D, the vertical-class pairing is deg_C O(D)|_C; discarding Tor instead gives χ(O_C) and generally disagrees.

*Needs:* Layer 0 `derivedCycle`, Layer 1 `vertices`, `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.3/closed-union-decomposition`, `SchemeKTheoryOperationsPartII:FK.2`.

### 1.4 Primitive horizontal cycles

Construct `primitiveHorizontal`. For integral nondegenerate rank n−1 M of type at most one, Z(M)^circ is its primitive quasi-canonical horizontal part. Z(Lflat)_H is the sum over integral overlattices M⊃Lflat of type at most one. Type zero contributes degree one; type one contributes vol(M)^(-1)(1+q^(-1))=q^s(1+q^(-1)), where s=val(M)>0 and q=#k_F0. Thus deg Z(Lflat)_H=vol(Lflat)^(-1)D_Lflat((−q)^(-1))=D_Lflat(−q), with the rank-(n−1) normalized unramified polynomial. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§4.1–4.2, Theorem 4.2.1 pp.19–20; Corollary 4.6.1 p.23.)

The argument is to apply the requested rank-two quasi-canonical lift theorem and the special-Tate-module criteria.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `primitiveHorizontal.primitive`: Subtract the proper intermediate lifting loci to isolate exact endomorphism order.
- `primitiveHorizontal.sum`: The horizontal cycle is indexed by type≤1 integral overlattices.
- `primitiveHorizontal.degree`: Use degree one in type zero and q^s(1+q^(-1)) in type one with s=val(M)>0.
- `primitiveHorizontal.marking`: Transport of a quasi-canonical lift through a marked LT.6 isomorphism preserves its conductor and primitive locus; LT.7 degrees are converted using the stated base-uniformizer convention.

**Checks.**

- A type-zero overlattice contributes one.
- At s=1 a type-one degree is q+1.
- An overlattice of type three contributes no primitive horizontal component.

*Needs:* Layer 1 `horizontalSplitting`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, Layer 1 `tateLifting`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree`.

### 1.5 Special Tate-module lifting criteria

Prove `tateLifting`. For z∈N_n(OK), K/breveF finite, write L=Hom_OF(T_p bar E,T_p G), which is self-dual of rank n. The rational Tate map i_K:Hom^0_OF(bar E,G)→L_F and framing-reduction map i_k:Hom^0_OF(bar E,G)→V_n satisfy Hom_OF(bar E,G)=i_K^(-1)(L). Consequently z∈Z(M) iff M⊂i_k(i_K^(-1)(L)). Separately, for any self-dual rank-n lattice L and nondegenerate hyperplane W⊂L_F, the saturated lattice W∩L has type at most one. These are the integral statements needed to enumerate horizontal lifts; rational Tate comparison alone is insufficient. ([LZ](https://arxiv.org/pdf/1908.01701v3) Lemmas 4.4.1 and 4.5.1, §§4.4–4.5 pp.21–23.)

The argument is to apply the integral Tate lifting theorem in the exact polarized OF-linear setting. For the hyperplane assertion, choose a primitive equation in the unimodular lattice and bound the radical rank of the reduced Gram form by one. Use the rank-(n−1) Breuil-module image to characterize the canonical order lift.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`.

### 1.6 Low-rank vertical multiplicities

Establish `lowRankVertical`. For n=3 and integral nondegenerate rank-two Lflat, put Lflat_Λ=span_F(Lflat)∩Λ. For each type-three vertex Λ⊃Lflat set mult_Lflat(Λ)=#{M:Lflat⊆M⊆Lflat_Λ}. Then LZ(Lflat)_V=Σ_Λ mult_Lflat(Λ)[O_V(Λ)] in Gr² K_0 with vertical support, and the same coefficients give the ordinary vertical cycle there. Theorem 5.4.1(ii) also proves Int(L)=∂Den(L) for n=2 without invoking the general induction. Corollary 5.4.6 gives the primitive-horizontal intersections used in the curve computation. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 5.4.1, Lemmas 5.4.3–5.4.4, Corollary 5.4.6 pp.27–33.)

The argument is to enumerate the finite interval of integral lattices in each saturated hyperplane lattice; split off a unit vector to compare the horizontal degrees and the curve multiplicities. Prove the rank-two identity simultaneously, retaining the minuscule instance required for the curve Fourier formula.

**Check.** A multiplicity assertion must retain the chosen numerical quotient; it must not manufacture a canonical vertical scheme.

*Needs:* Layer 1 `primitiveHorizontal`, Layer 1 `vertices`, Layer 1 `horizontalSplitting`.

### Examples

A type-one vertex has dimension zero and a type-three vertex has dimension one. A type-zero primitive horizontal lattice has degree one, while type one with val(M)=1 has degree q+1. For n=3 and Lflat_Λ/Lflat of length one, the interval of intermediate lattices has just its two endpoints, so that curve’s multiplicity is two. Saturation equal to Lflat instead gives multiplicity one.

### Dependencies

Use `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `GrossZagierAndArithmeticHeightsPartII:U0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7`, `MotivesAndAlgebraicCycles:MC.2`, `SchemeKTheoryOperationsPartII:FK.0`, `SchemeKTheoryOperationsPartII:FK.2`, `SchemeKTheoryOperationsPartII:FK.3`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.
- **Quasi-canonical rank-two lifting leaves.** Import the marked quasi-canonical construction, quadratic level classification and degree formula from LubinTateFormalModulesAndQuasiCanonicalLifts LT.6–LT.7. That packet does not state the Gross–Keating or ramified Shi/He–Shi–Yang intersection-length formulas needed here. Request those formulas as an extension of that owner, with order/conductor, component, sign and valuation dictionaries. R07.4 supplies integral comparison, not these lengths. The LZ special-Tate-module criteria and rank-three multiplicities remain U1 targets with their stated integral-comparison leaf.

## Layer 2: Tate classes and local modularity

Calculate Frobenius eigenspaces on unitary Deligne–Lusztig strata, prove boundary generation of Tate classes and numerical reduction of vertical intersections to curves. Establish curve Fourier identities, corrected Chern-character formulas and higher K-theoretic local modularity without an unjustified global formal filtration theorem.

### 2.1 Unitary Coxeter cohomology input

Prove `coxeterCohomology`. For the open Coxeter stratum in Y_d, the Frobenius eigenvalues are (−q)^m, 0≤m≤2d, in the compactly supported degree floor(m/2)+d, with the multiplicities and Tate twists of the type-²A_(2d) calculation. The eigenvalue-one parts after twists are semisimple. This is a specific finite-group/DL calculation; generic weight bounds do not imply it. ([LZ](https://arxiv.org/pdf/1908.01701v3) §5.3 p.25, cohomology input preceding Lemma 5.3.1.)

The argument is to request the full source-checked Lusztig calculation including multiplicities; apply the closed/open exact sequence. The auxiliary calculation has not been read independently and is a recorded proof leaf.

*Needs:* Layer 1 `unitaryDl`, `MotivesAndAlgebraicCycles:MC.2`.

### 2.2 Tate classes generated by strata

Prove `tateGeneration`. For 0≤i≤d, the Tate classes H^(2i)(Y_d,Q_l(i)) fixed by any positive power of geometric Frobenius are spanned by the dimension-(d−i) closed Deligne–Lusztig strata, including Y_d itself for i=0. The open complement has no Tate classes in positive cohomological degrees; its H^0 is not discarded. This generation statement is specific to Y_d. ([LZ](https://arxiv.org/pdf/1908.01701v3) Lemma 5.3.1 and Theorem 5.3.2 pp.25–26.)

The argument is to induct on closed strata using excision, the explicit eigenvalues and semisimplicity.

*Needs:* Layer 2 `coxeterCohomology`, `MotivesAndAlgebraicCycles:MC.2/cycle-class-degree`, `MotivesAndAlgebraicCycles:MC.2/cycle-class-of-fundamental-class`.

### 2.3 Numerical reduction to curves

Prove `numericalCurves`. The vertical class for rank n−1 Lflat can be represented, for its Euler pairings with special divisors, by a rational linear combination of Deligne–Lusztig curves. Equalities here are numerical after the cycle-class/Chern-character quotient. The result does not assert a canonical effective vertical 1-cycle. ([LZ](https://arxiv.org/pdf/1908.01701v3) Corollary 5.3.3 p.26; §6.3, Lemmas 6.3.1–6.3.2 pp.36–37.)

The argument is to decompose finite vertex support modulo overlaps, then use Tate generation and divisor pairings.

*Needs:* Layer 1 `horizontalSplitting`, Layer 2 `tateGeneration`, `SchemeKTheoryOperationsPartII:FK.3/closed-union-decomposition`, `SchemeKTheoryOperationsPartII:FK.4/cartier-divisor-pairing`.

### 2.4 Unramified curve intersection function

Define `curveFunction`. For a type-three vertex Λ define f_Λ(x)=χ(O_V(Λ)⊗^L O_Z(x)), extended to x=0 using the divisor-class convention. It equals −q²(1+q)1_Λ(x)+Σ_(Λ⊂Λ′,type Λ′=1)1_Λ′(x). Thus it is 1−q² on Λ, one on integral-norm vectors in Λ^vee outside Λ, and zero elsewhere. With the trace-hermitian self-dual Fourier measure, fhat_Λ=−f_Λ. ([LZ](https://arxiv.org/pdf/1908.01701v3) Lemma 6.2.1 and Corollary 6.2.2 pp.34–36.)

The argument is to use the curve degree and finite hermitian-plane incidence count, then Fourier-transform lattice indicators.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `curveFunction.values`: The three disjoint value regions are Λ, integral-norm Λ^vee minus Λ, and the complement.
- `curveFunction.fourier`: Fourier uses the trace pairing and self-dual measure.
- `curveFunction.contained`: If the curve lies in Z(x), the Euler pairing is still the Cartier line-bundle degree.
- `curveFunction.extensionUnique`: Two locally constant extensions agreeing outside span_F Lflat agree everywhere, since that proper hyperplane has empty interior.

**Checks.**

- On Λ the value is 1−q², which is negative for q>1.
- On an integral-norm x∈Λ^vee∖Λ the value is one.
- On x outside Λ^vee the value is zero.

*Needs:* Layer 1 `vertices`, `SchemeKTheoryOperationsPartII:FK.4/cartier-divisor-pairing`, `MetaplecticAutomorphicForms:MP.0`, Layer 1 `lowRankVertical`.

### 2.5 Geometric vertical Fourier identity

Prove `verticalFourier`. For nondegenerate rank n−1 Lflat, the vertical intersection function Int_V,Lflat extends to a Schwartz–Bruhat function on V and satisfies its self-dual Fourier transform equal to its negative. The horizontal function remains singular along span_F Lflat. ([LZ](https://arxiv.org/pdf/1908.01701v3) Corollary 6.3.3 p.37.)

The argument is to apply numerical curve reduction and linearity of the Fourier transform.

*Needs:* Layer 2 `numericalCurves`, Layer 2 `curveFunction`.

### 2.6 Cycle-class quotient and corrected Chern character

Define `chernQuotient`. On a proper smooth stratum V(Λ), use the rational K-group modulo the kernel of ch followed by the chosen cycle-class map. For a Cartier divisor D use [O_D]=[O]−[O(−D)] and ch(O_D)=1−exp(−c1(O(D))). Top products are evaluated with this sign; the quotient is not numerical K-theory by definition. ([LZ](https://arxiv.org/pdf/1908.01701v3) Definitions 6.4.1,6.4.3 pp.37–38; Lemmas 6.4.4–6.4.7 pp.38–41, with sign correction.)

The argument is to apply multiplicativity of ch and track the line-bundle convention before comparing top powers.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `chernQuotient.quotient`: A rational supported K-class maps to its cycle-class quotient.
- `chernQuotient.cartier`: ch(O_D)=c−c²/2+c³/6−… for c=c1(O(D)).
- `chernQuotient.pairing`: Equal classes in this quotient have equal admitted cohomological degree pairings.
- `chernQuotient.factor`: A rational linear functional on supported K-theory descends to the cycle-class quotient exactly when it kills the kernel of the specified cycle-class map.

**Checks.**

- For D=0 the Cartier class and its Chern character vanish.
- The degree-one term is +c, and the degree-two term is −c²/2.
- The class of O(−D) is exp(−c), not exp(c).

*Needs:* Layer 2 `tateGeneration`, `SchemeKTheoryOperationsPartII:FK.4/cartier-divisor-pairing`, `SchemeAndStackFoundations:SF.5`, `MotivesAndAlgebraicCycles:MC.2`.

### 2.7 Higher local modularity

Prove `higherLocalModularity`. For every odd-type vertex Λ and every rational linear functional ell on the cycle-class quotient Kbar_0(V(Λ)), the function ell(K_V(Λ)(x)), initially for x≠0, extends uniquely to a Schwartz–Bruhat function on V with Fourier transform gamma_V times itself; here gamma_V=−1 for the nonsplit unramified special Hom space. In particular the Euler functional gives the same extension and negative Fourier eigenvalue for Int_V(Λ), in every dimension covered by the stratum. Use the corrected Cartier Chern signs and the stated cycle-class quotient; this argument does not require Zhang Appendix B’s global nonaffine filtration product. ([LZ](https://arxiv.org/pdf/1908.01701v3) Corollary 6.4.8, Theorem 6.4.9 and Corollary 6.4.10 p.42.)

The argument is to reduce the functional to pairings with boundary cycles using Tate generation and the perfect graded pairing. Compute each resulting top Chern function by lattice indicators, retaining its factorial and sign, then use Fourier linearity; Riemann–Roch factors the Euler functional through the same quotient.

*Needs:* Layer 2 `chernQuotient`, Layer 2 `curveFunction`, `SchemeKTheoryOperationsPartII:FK.4/zero-dimensional-pairing`.

### Examples

For a type-three vertex there are q³+1 type-one overlattices in the indicator sum. At x∈Λ the value is −q²(1+q)+(q³+1)=1−q². At q=3 this is −8; the next integral shell has value one. The Cartier resolution gives 1−exp(−c)=c−c²/2+…, fixing both signs before any top-degree projection.

### Dependencies

Use `GrossZagierAndArithmeticHeightsPartII:U1`, `MetaplecticAutomorphicForms:MP.0`, `MotivesAndAlgebraicCycles:MC.2`, `SchemeAndStackFoundations:SF.5`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Specific Deligne–Lusztig cohomology leaves.** LZ and LL2 state the particular type-²A and type-²D Frobenius calculations they use. The underlying Lusztig results have not been read independently: acquire exact multiplicities, degrees, twists and semisimplicity before proving the boundary-generated Tate statements. Generic weights do not provide semisimplicity or all Tate classes.

## Layer 3: Unramified analytic and local identities

Import normalized unramified Siegel polynomials and their overlattice formula. Define horizontal and vertical density functions, prove analytic regularity and the restricted negative-norm Fourier vanishing, and close the local identity by induction on the difference and an uncertainty principle. Normalize the Whittaker derivative explicitly.

### 3.1 Unramified density and Whittaker normalization

Establish `densityInterface`. Let q=#k_F0. Import D_L(X) from GN.3, with D_L((−q)^(-k))=Den(1_(n+k),L)/Den(1_(n+k),1_n). For a full-rank lattice in the nonsplit space its valuation is odd, D_L(1)=0 and ∂Den(L)=−D′_L(1). With the source standard section, W′_T(0)=∂Den(L)·prod_(i=1)^n(1−(−q)^(-i))·log(q²). ([LZ](https://arxiv.org/pdf/1908.01701v3) §3.3 pp.16–17; §9.1 pp.60–62.)

The argument is to compare the standard section and Haar measures; the log is the extension residue size q², while interpolation uses base q.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.3/normalized-siegel-polynomial`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/siegel-polynomial-functional-equation`, `MetaplecticAutomorphicForms:MP.2`.

### 3.2 Unramified analytic horizontal and vertical functions

Define `analyticSplit`. For integral nondegenerate rank n−1 Lflat and x outside H=span_F Lflat, set ∂Den_Lflat(x)=∂Den(Lflat+OF x)=Σ_M m(t(M))1_M(x), over integral full-rank M containing Lflat. Here m(0)=0, m(1)=1 and m(a)=∏_(i=1)^(a−1)(1−(−q)^i) for a≥2. The sum is finite at each such x. Define ∂Den_H by retaining precisely the M with t(M∩H)≤1, and ∂Den_V=∂Den−∂Den_H. Define Int_H by the Euler pairing of the full horizontal sum of primitive cycles with Z(x), and Int_V=Int−Int_H. ([LZ](https://arxiv.org/pdf/1908.01701v3) Definitions 3.5.1–3.5.2 p.17; Definitions 6.1.1–6.1.4 pp.33–34; Definitions 7.3.1–7.3.3 pp.44–45 (type-zero extension corrected).)

The argument is to differentiate the finite overlattice expansion and identify horizontal terms via quasi-canonical degrees.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `analyticSplit.domain`: The initial domain excludes span_F Lflat.
- `analyticSplit.horizontal`: Int_H agrees with ∂Den_H under the horizontal theorem.
- `analyticSplit.vertical`: The vertical function is total minus horizontal.
- `analyticSplit.latticeExt`: Equal embedded lattices Lflat give equal total, horizontal and vertical functions on their common complement; a basis is not part of this datum.

**Checks.**

- The canonical differentiated weight is m(0)=0 and m(1)=1; in the nonsplit full-rank ambient space all contributing types are positive odd.
- No initial value on the excluded hyperplane is assigned by substitution into a singular sum.
- The rank-one odd-valuation total has derivative (a+1)/2.

*Needs:* Layer 1 `primitiveHorizontal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-overlattice-formula`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3/cho-yamauchi-weight`, Layer 3 `densityInterface`.

### 3.3 Unramified horizontal identity

Prove `horizontalIdentity`. For x outside span_F Lflat, Int_H,Lflat(x)=∂Den_H,Lflat(x). Horizontal terms are indexed by integral type≤1 overlattices, with precisely the primitive degrees in U1; primitive-horizontal/vertical-curve intersections use the same indexing. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 6.1.3 p.34.)

The argument is to match each primitive component with its differentiated density weight.

*Needs:* Layer 3 `analyticSplit`, Layer 1 `tateLifting`, Layer 1 `lowRankVertical`.

### 3.4 Analytic regularity and restricted Fourier vanishing

Prove `analyticFourier`. The unramified vertical analytic function extends uniquely to Schwartz–Bruhat on V; total and horizontal functions can have logarithmic singularities on the hyperplane. For x⊥span Lflat with val h(x,x)<0, the Fourier transform of the vertical function vanishes. Difference formulas along the normal line come from the overlattice expansion. Do not assert this initially for every negative-norm vector. ([LZ](https://arxiv.org/pdf/1908.01701v3) Proposition 7.3.4 pp.45–48; Lemmas 7.3.5–7.3.6 and Corollary 7.3.7 pp.48–51; Theorem 7.4.1 pp.51–55.)

The argument is to sum the lattice-indicator transforms; use the explicit normal-line differences and the finite counting argument.

*Needs:* Layer 3 `analyticSplit`, `MetaplecticAutomorphicForms:MP.0`.

### 3.5 Hermitian uncertainty principle

Prove `uncertainty`. Over a nonarchimedean local field of characteristic unequal to two, let f be a Schwartz–Bruhat function on a nondegenerate hermitian space. If supp f⊂{val h(x,x)>0} and supp fhat⊂{val h(x,x)≥0} for the chosen trace-self-dual transform, then f=0. The strict positive versus nonnegative distinction is essential. ([LZ](https://arxiv.org/pdf/1908.01701v3) Proposition 8.1.6 pp.56–57.)

The argument is to apply the local Weil representation relations to the two support conditions, retaining the conductor normalization.

**Check.** A lattice indicator generally fails the strict-positive support condition.

*Needs:* `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`.

### 3.6 Difference induction and unramified KR identity

Prove `differenceInduction`. For every full-rank OF-lattice L in the nonsplit unramified special Hom space, Int(L)=∂Den(L). In the inductive proof transport Φ_Lflat=Int_V,Lflat−∂Den_V,Lflat under changes of the complementary lattice, using equality in smaller valuation. Do not separately transport horizontal or vertical parts. The resulting support/Fourier conditions and U3/uncertainty kill Φ. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 8.2.1 and proof pp.58–60; Theorem 3.4.1 p.17.)

The argument is to use rank-one normalization, valuation induction, difference transport and the normal-line vanishing; pass from the difference to the total identity.

*Needs:* Layer 0 `rankOne`, Layer 0 `selfdualCancellation`, Layer 3 `horizontalIdentity`, Layer 3 `analyticFourier`, Layer 2 `verticalFourier`, Layer 3 `uncertainty`, Layer 1 `lowRankVertical`.

### Examples

For D(X)=1−X+X²−X³, D(1)=0 and −D′(1)=2. The Li–Zhang Whittaker derivative is therefore 2·prod_i(1−(−q)^(−i))·log(q²), with the product in the correct rank. A support condition with val h≥0 on both f and its transform is weaker than the strict-positive condition of the uncertainty theorem and cannot replace it.

### Dependencies

Use `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U1`, `GrossZagierAndArithmeticHeightsPartII:U2`, `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`. Each named supplier is used with the exact scope fixed above.

## Layer 4: Almost self-dual comparison

Define original almost self-dual Y-cycles and auxiliary pulled-back cycles separately. Prove the finite-flat exceptional-divisor comparison using Li–Rapoport–Zhang’s model theorem, identify the two model conventions, and derive both local density identities including the correction term and degree q+1.

### 4.1 Original and auxiliary almost self-dual cycles

Construct `almostdualCycles`. For the split n-dimensional almost-dual Hom space W_n, define Y(x) on N_n^1 by lifting the dual special Hom. Embed W_n as x0^perp in the nonsplit rank n+1 space with h(x0,x0)=varpi and put Zflat(x)=Z(x)|Z(x0). Define Int_Y(L) as the derived Euler intersection of n Y-divisors; define Int_aux(L)=χ_(Z(x0))(⊗^L O_Zflat(x_i))/(q+1). They are different numbers. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§10.1–10.3 pp.64–66.)

The argument is to construct the two actual moduli functors and restrictions using the requested RZ models; retain the normalization in the auxiliary definition.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `almostdualCycles.original`: Y-intersection is an unnormalized Euler length on N_n^1.
- `almostdualCycles.auxiliary`: Auxiliary intersection is divided by q+1.
- `almostdualCycles.density`: D_Λ(X,L)=D(X,L⊥<varpi>) uses the unramified normalized density.
- `almostdualCycles.basis`: Changing an OF-basis preserves the derived Y-intersection class and both original and normalized auxiliary Euler numbers.

**Checks.**

- An even norm valuation in W_1 is compatible with the split space.
- In the split rank-one case, valuation a=0 gives the empty Y-cycle and Int_Y=0, whereas a=2 gives Int_Y=1.
- Multiplying Int_aux by q+1 restores its integral Euler numerator.

*Needs:* Layer 0 `specialCycles`, Layer 0 `derivedCycle`, `PELModuli:M6`.

### 4.2 Almost self-dual comparison model

Construct `comparisonModel`. Identify the LZ comparison diagram Ntilde→N_n^1 and Ntilde→Z(x0) with LRZ §14’s lattice-pair model. Ntilde is regular; π1 is finite flat of degree q+1, étale away from the balloon locus and totally ramified there. π2 is proper and an isomorphism off its centers. Reduced exceptional components are disjoint P^(n−1), with normal bundle O(−1); their n-fold Euler self-intersection is (−1)^(n−1). The reduced inverse image of the balloon locus is the exceptional divisor. ([LRZ](https://arxiv.org/pdf/2404.02214v2) Theorem 14.6.2 pp.60–61; Corollary 16.1.5 p.69; §16.4 pp.70–71; [LZ](https://arxiv.org/pdf/1908.01701v3) Conjecture 10.4.1 pp.66–67 and uses in §§10.4–10.5 pp.67–72.)

The argument is to compare the signatures, polarization kernels, quasi-isogenies and lattice pairs in both moduli problems. Apply LRZ’s finite-flat theorem after this dictionary; no unnamed blowup ideal or nonreduced inverse-image identity is asserted.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `comparisonModel.dictionary`: The functor comparison preserves both projections and special Hom labels.
- `comparisonModel.degree`: π1 has finite flat degree q+1.
- `comparisonModel.exceptional`: Use reduced exceptional components and O(−1) normal bundles.
- `comparisonModel.pullback`: On corresponding special-cycle supports, pullback of the cycle complex along the comparison projection is the complex for its transported Hom label; projection degrees are applied only with the stated support hypotheses.

**Checks.**

- For a single exceptional component E, χ(O_E^⊗Ln)=(−1)^(n−1).
- For disjoint components the mixed n-fold intersection vanishes.
- The scheme-theoretic inverse image of a balloon can carry multiplicity q+1; reduction is necessary.

*Needs:* Layer 4 `almostdualCycles`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `SchemeKTheoryOperationsPartII:FK.4/proper-pushforward-projection`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 4.3 Auxiliary almost self-dual identity

Prove `auxiliaryFormula`. For a full-rank integral lattice L⊂W_n, (q+1)Int_aux(L)=∂Den_Λ(L), where ∂Den_Λ=−D′_Λ(1) and D_Λ(X,L)=D(X,L⊥<varpi>). This is the pulled-back auxiliary identity and contains no −Den(L) correction. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 10.3.1 p.66.)

The argument is to express the auxiliary intersection as the rank n+1 unramified intersection with x0.

*Needs:* Layer 4 `almostdualCycles`, Layer 3 `differenceInduction`.

### 4.4 Pullback of Y-divisors

Prove `divisorComparison`. On the comparison model, π1*Y(x)=π2*Zflat(x)−Exc(x), with the exceptional components prescribed by the integral special Hom label. The lower-dimensional cancellation diagram is compatible with these projections. The exceptional term must be retained when multiplying n Cartier classes. ([LZ](https://arxiv.org/pdf/1908.01701v3) Lemma 10.4.2 and Theorem 10.4.3 pp.67–70.)

The argument is to use the LRZ model dictionary for the geometric hypotheses; apply Grothendieck–Messing lifting ideals and compare away from, then along, each exceptional component.

*Needs:* Layer 4 `comparisonModel`, Layer 0 `selfdualCancellation`, `SchemeKTheoryOperationsPartII:FK.3/cartier-pullback`.

### 4.5 Almost self-dual Y identity

Prove `originalFormula`. For full-rank L⊂W_n, (q+1)Int_Y(L)=∂Den_Λ(L)−Den(L). In rank one, a=val h(x,x) even and nonnegative gives Int_Y=a/2, Den(L)=1 and ∂Den_Λ=1+(q+1)a/2. The q+1 and subtraction term are forced by the comparison map and exceptionals. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 10.5.1 p.70; Example 10.5.3 p.71; Remark 10.5.4 p.72.)

The argument is to expand Cartier intersections, use finite-flat projection and exceptional self-intersections; identify the remaining density term.

**Check.** a=0 gives zero original intersection and auxiliary derivative one. a=2 gives Int_Y=1 and ∂Den_Λ=q+2.

*Needs:* Layer 4 `auxiliaryFormula`, Layer 4 `divisorComparison`, `SchemeKTheoryOperationsPartII:FK.4/proper-pushforward-projection`.

### 4.6 Li–Liu local identity interface

Establish `localConsumer`. For n=2r and nonsingular T at an inert v, use q=#k_F0,v and b_n,v(0)=prod_(i=1)^n(1−(−q)^(-i))^(-1). In Li–Liu’s Whittaker parameter the self-dual Euler intersection is b_n,v(0) W′_T(phi_0)/log q. The almost self-dual identity is b_n,v(0)/log q times ((q^(2r)−1)/(q+1) W′_T(phi_1)−log q/(q+1) W_T(phi_0)). Here the place of the CM field in Li–Liu is mapped to its underlying base place when reading q. These formulas retain Li–Liu’s parameter and sections; Li–Zhang’s log(q²) formula requires an explicit reparametrization, not substitution of the logarithm alone. ([LL1](https://www.math.columbia.edu/~chaoli/AIPF.pdf) §8 local identity pp.39–40; §9 local identity pp.44–45; Notation 2.1(F1),(F4) p.10; [LZ](https://arxiv.org/pdf/1908.01701v3) Remarks 3.4.2 p.17 and 10.5.4 p.72.)

The argument is to compare Li–Liu Notation 2.1(F1),(F4), the local density normalizer and the displayed Euler identities in §§8–9. Establish the standard-section parameter comparison with Li–Zhang before transporting derivatives; retain the coherent almost-dual correction.

**Check.** The derivative uses log q_u=2log q_v; confusing the two loses a factor two.

*Needs:* Layer 3 `densityInterface`, Layer 3 `differenceInduction`, Layer 4 `originalFormula`.

### Examples

For the split rank-one Y case, a=0 gives (Int_Y,Den,∂Den_Λ)=(0,1,1), while a=2 gives (1,1,q+2). Thus the equation reads q+1=(q+2)−1. The auxiliary intersection instead equals (q+2)/(q+1); it need not be an integer. In exceptional dimension n−1=1 the two-fold self-intersection is −1, fixing the sign of the correction.

### Dependencies

Use `CrystallineCohomology:CR.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U3`, `PELModuli:M6`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Siegel–Weil and archimedean normalization leaves.** Read Ichino §6 and the Liu/Garcia–Sankaran archimedean coefficient theorem with their range, regularization, measures, splitting characters and current convention. Derive c_K and the factor one half at infinity, rather than choosing an unspecified measure to fit the answer. Separate AFL’s repaired 4π scaling from LZ’s ASW 2π scaling. Check explicitly the Li–Liu versus Li–Zhang Whittaker parameter conversion: LL1 uses log q for q the underlying base residue size, whereas LZ uses log(q²).

## Layer 5: Exotic smooth geometry

For even rank and ramified quadratic extensions, use the exotic smooth RZ model with its scaled special Hom form and trace duality. Define the zero-vector Koszul complex and modular line, prove linear invariance and Cartierness, describe even-type strata and their Tate classes, and compute the rank-two and component normalizations.

### 5.1 Exotic smooth special cycles

Construct `exoticCycles`. Let E/F be ramified of odd residue characteristic, n=2r≥2 and u^c=−u. On the exotic smooth RZ functor with polarization kernel X[u], Kottwitz polynomial (T−u)^(n−1)(T+u), wedge-square condition on iota(u)−u and nonzero spin condition at every geometric point, use h(x,y)=u^(−2)lambda_0^(−1)y^vee lambda_X x. N has relative dimension n−1 and two components. For x≠0, N(x) is the Hom-lifting cycle. Rank n−1 lattices in the functions below are nondegenerate. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) §2.1, Definitions 2.5–2.8, author pp.9–11.)

The argument is to use the requested ramified RZ representability/smoothness theorem, then the Hom obstruction ideal. Keep the u^(−2) normalization.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `exoticCycles.form`: The scaled form is integral-valued on the correct special Hom lattice.
- `exoticCycles.lift`: N(x) represents extension of the special quasi-homomorphism.
- `exoticCycles.components`: Both connected components belong to the model.
- `exoticCycles.baseChange`: The Hom-lifting subfunctor commutes with base change of test schemes and depends only on the OE-span of its labels.

**Checks.**

- Odd n is outside this exotic smooth family.
- Dropping u^(−2) shifts every norm valuation.
- At n=2 and minimal integral invariants (1,1), the total intersection is two, with one on each component.

*Needs:* `PELModuli:M6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 5.2 Exotic modular line and zero complex

Define `exoticLine`. Let L_X=image(iota(u)−u) in Lie X; this is the rank-one kernel of Lie X→epsilon D/F_X^perp. Put omega=L_X^(-1). For x≠0 let C(x)=[I_N(x)→O_N] in degrees −1,0; put C(0)=[omega→0 O_N]. Zero is a complex with zero differential, not the structure sheaf of the whole model. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Lemmas 2.36–2.37, Definition 2.38 pp.25–26; Lemma 2.41 p.26.)

The argument is to use the spin/wedge equations to identify the line and the universal Hom obstruction.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `exoticLine.line`: L_X is both the image and the stated rank-one kernel.
- `exoticLine.nonzero`: For x≠0, C(x) resolves O_N(x).
- `exoticLine.zero`: C(0) has terms omega and O with zero differential.
- `exoticLine.pullback`: Pulling back the two-term complex pulls back its ideal/line terms and differential; its class is [O]−[omega] for the zero label.

**Checks.**

- The K-class at zero is [O]−[omega].
- Setting C(0)=O gives the wrong self-intersection class.
- On a type-four curve deg omega=q−1.

*Needs:* Layer 5 `exoticCycles`.

### 5.3 Exotic Cartierness and linear invariance

Prove `exoticLinear`. Each nonzero exotic cycle is an effective relative Cartier divisor or empty. For tuples of length at most n generating the same OE-module, the homology sheaves of the tensor products of C(x_i) identify as in Howard’s linear invariance theorem; hence the derived class and its Euler intersection depend only on the module. The zero complex is required in elementary row operations. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Proposition 2.33, Corollaries 2.34–2.35 pp.24–25; Lemmas 2.39–2.40 p.26.)

The argument is to apply the obstruction-line comparison and Howard’s theorem with compatible ideal maps; prove nonverticality separately.

*Needs:* Layer 5 `exoticLine`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 5.4 Exotic trace-dual strata

Construct `exoticVertices`. For the ramified scaled form let Λ^vee={x:h(x,Λ)⊂u^(−1)OE}. Vertex type is even. The special-fibre strata V_Λ are smooth projective type-²D varieties of dimension t(Λ)/2−1 on each component; intersections follow sums of vertices. Type two gives points, type four gives a P¹ on each component. These vertices use trace duality, unlike Krämer’s hermitian sharp dual. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Definition 2.27, Proposition 2.28 p.22; Corollaries 2.30–2.31 p.23.)

The argument is to apply the requested ramified lattice classification and Wu stratification with the field-extension argument retained.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `exoticVertices.dual`: Trace integrality means h(x,Λ)⊂u^(-1)OE.
- `exoticVertices.stratum`: Type t has dimension t/2−1 on either component.
- `exoticVertices.incidence`: Intersecting strata are controlled by vertex sums.
- `exoticVertices.ext`: Equal OE-sublattices give equal vertices and strata, with the same trace dual and type.

**Checks.**

- Type two is zero-dimensional.
- Type four gives two components, each a projective line.
- Replacing the trace dual by h-integral dual changes the vertex type.

*Needs:* Layer 5 `exoticCycles`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, `MotivesAndAlgebraicCycles:MC.2`.

### 5.5 Exotic Tate reduction and modular line degree

Prove `exoticTate`. For d≥0, the d-dimensional Tate homology classes on an exotic stratum are spanned by the contained strata of type 2d+2. This includes the whole stratum in its top dimension, not only its boundary. For type t, the open type-²D compactly supported calculation has squared-Frobenius eigenvalues q^(2j) in degree j+t/2−1, for 0≤j≤t/2−1, with semisimple eigenspaces. For each type-four component C≅P¹, deg_C omega=q−1. These statements give numerical reduction of vertical classes to curves. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Lemma 2.32 p.23; Lemma 2.42 p.27.)

The argument is to use the specific Lusztig calculation and closed/open sequences, then compute the universal line on the P¹ incidence model. The external cohomology calculation remains a proof-leaf gap.

*Needs:* Layer 5 `exoticVertices`, Layer 5 `exoticLine`, `MotivesAndAlgebraicCycles:MC.2`.

### 5.6 Exotic rank-two intersection

Establish `exoticRankTwo`. For n=2 and integral lattice invariants (2b1+1,2b2+1) with 0≤b1≤b2, Int(L)=2Σ_(j=0)^b1(Σ_(i=0)^j q^i+(b2−j)q^j). The outer factor two counts both components; the inner upper bound is j. This is the geometric rank-two formula; its density comparison is made in U6 using the ramified density interface. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Proposition 2.44, author pp.28–29.)

The argument is to evaluate the quasi-canonical intersection lengths on both components. This uses the recorded rank-two lifting-length leaf; identification with the density derivative is deferred to U6, which supplies that analytic interface without a backward layer dependency.

**Check.** (b1,b2)=(0,0) gives 2; (0,1) gives 4; (1,1) gives 2(q+3).

*Needs:* Layer 5 `exoticLinear`, Layer 5 `exoticTate`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree`.

### 5.7 Exotic cancellation and component symmetry

Prove `exoticCancellation`. A trace-self-dual summand splits off and reduces the exotic special-cycle intersection to the lower even rank with the induced nonsplit complement. Pullback cycles can be empty, whole or Cartier according to the remaining label, so the zero complex must be used. The reflection x_i↦x_i (i<n), x_n↦−x_n exchanges the two components and preserves intersection classes, hence their Euler contributions are equal. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Remark 2.52 p.30; Lemma 2.56 p.34.)

The argument is to split polarized Dieudonné modules and use the reflection on the framing pair. The reflection does not negate every coordinate.

*Needs:* Layer 5 `exoticLinear`, Layer 5 `exoticVertices`, Layer 0 `selfdualCancellation`.

### Examples

The rank-two count gives 2, 4 and 2(q+3) at (b1,b2)=(0,0),(0,1),(1,1). At q=3 these are 2,4,12. A single connected component contributes exactly half only after the reflection argument. The zero-label complex has K-class [O]−[omega], whose restriction to a type-four projective line has Euler characteristic 1−q, agreeing with the curve function.

### Dependencies

Use `CrystallineCohomology:CR.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GrossZagierAndArithmeticHeightsPartII:U0`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7`, `MotivesAndAlgebraicCycles:MC.2`, `PELModuli:M6`, `SchemeKTheoryOperationsPartII:FK.1`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Quasi-canonical rank-two lifting leaves.** Import the marked quasi-canonical construction, quadratic level classification and degree formula from LubinTateFormalModulesAndQuasiCanonicalLifts LT.6–LT.7. That packet does not state the Gross–Keating or ramified Shi/He–Shi–Yang intersection-length formulas needed here. Request those formulas as an extension of that owner, with order/conductor, component, sign and valuation dictionaries. R07.4 supplies integral comparison, not these lengths. The LZ special-Tate-module criteria and rank-three multiplicities remain U1 targets with their stated integral-comparison leaf.
- **Specific Deligne–Lusztig cohomology leaves.** LZ and LL2 state the particular type-²A and type-²D Frobenius calculations they use. The underlying Lusztig results have not been read independently: acquire exact multiplicities, degrees, twists and semisimplicity before proving the boundary-generated Tate statements. Generic weights do not provide semisimplicity or all Tate classes.

## Layer 6: Exotic analytic formula and induction

Consume ramified trace-dual density polynomials and their finite overlattice formula. Define analytic and geometric horizontal/vertical parts, prove the lattice-extension cancellation and Fourier bounds, and close the exotic local identity with the special two-overlattice induction. Export the relative/absolute cycle comparison.

### 6.1 Exotic normalized density interface

Establish `exoticDensity`. For n=2r, base residue q and ramified hyperbolic trace-self-dual H, D_L(q^(−s))=Den(H_(r+s),L)/prod_(i=s+1)^(r+s)(1−q^(−2i)). D_L(1)=0 and ∂Den=−D′_L(1). Equivalently D_L(X)=Σ_integral M⊃L X^(2length(M/L))prod_(i=0)^(t(M)/2−1)(1−q^(2i)X²). Its derivative is 2Σ_M prod_(i=1)^(t(M)/2−1)(1−q^(2i)). W′/prod_(i=1)^r(1−q^(−2i))=log q·∂Den. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) §2.2, Definitions 2.14,2.16, Lemma 2.19 and Remark 2.18, author pp.13–15.)

The argument is to request ramified density interpolation, normal forms and the product formula from GN.3. This is an interface, not a second construction of generic representation densities.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `MetaplecticAutomorphicForms:MP.2`, Layer 5 `exoticCycles`.

### 6.2 Exotic horizontal and vertical functions

Define `exoticSplit`. For nondegenerate Lflat of rank n−1 and x outside its span, set the analytic total to ∂Den(Lflat+OE x). Its horizontal part is 2Σ_integral M containing Lflat+OE x, t(M∩span Lflat)=1 of 1; its vertical part is total minus horizontal. Geometrically take the primitive-horizontal sum over type-one overlattices; subtract this from the derived class in F^(n−1) to define the vertical class and its intersection function. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Definition 2.20 p.15; Definitions 2.45–2.50 pp.28–30.)

The argument is to use the ramified primitive-horizontal classification and the supported formal filtration contract.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `exoticSplit.total`: Initial domain excludes the hyperplane span Lflat.
- `exoticSplit.horizontal`: Only type-one intersections M∩span Lflat enter the analytic horizontal count.
- `exoticSplit.vertical`: Both analytic and geometric vertical objects are defined by subtraction.
- `exoticSplit.latticeExt`: The split depends on the embedded lattice, not its basis; H+V recovers the full class or function on the admitted domain.

**Checks.**

- The coefficient of each eligible horizontal overlattice is two.
- An overlattice whose hyperplane intersection has type three is excluded.
- For the zero label the Euler class is obtained with C(0)=[omega→0 O], giving [O]−[omega], rather than [O].

*Needs:* Layer 6 `exoticDensity`, Layer 5 `exoticLinear`, `SchemeKTheoryOperationsPartII:FK.0/formal-support`, `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing`, `SchemeKTheoryOperationsPartII:FK.2`.

### 6.3 Ramified lattice-extension cancellation

Prove `exoticExtensionCount`. Let Lflat be integral of rank n−1 in the even-rank exotic hermitian space V, H=span Lflat, W=H^perp, and W_int its rank-one norm-integral lattice. Full lattices M containing Lflat correspond to triples (A,δ,ε), where A=M∩H contains Lflat, the normal projection is u^δ W_int, and ε:u^δ W_int→H/A is the OE-linear extension graph map. Integrality is equivalent to A integral, image ε⊂A^vee/A and integral norm of every coset ε(x)+x. Then t(M)=t(A)+1 when image ε⊂(uA^vee+A)/A, and t(A)−1 otherwise. Put μ(t)=∏_(i=1)^(t/2−1)(1−q^(2i)) for positive even t. For each fixed integral A, Σ_(M integral,M∩H=A) q^(−δ_M)|μ(t(M))| converges. If t(A)>1 and z∉V_int, its signed version restricted by z∈M^vee is zero. For t(A)>1, also Σ_(M integral,M∩H=A,δ_M=0) μ(t(M))=0. These are cancellations of sums, not termwise vanishing. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Lemma 2.24, author pp.16–20.)

The argument is to classify the extension graph and apply the type criterion to its image. Rewrite the absolute sum as an integral over a compact norm-integral region to prove convergence; split its signed version by the two types and use the norm-shell counts. Subtract two normal-shell identities for the δ=0 consequence. The coefficient-by-coefficient ramified density leaf remains a GN.3 request.

*Needs:* Layer 6 `exoticDensity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

### 6.4 Exotic analytic Fourier support

Prove `exoticAnalyticFourier`. The exotic analytic vertical function extends to Schwartz–Bruhat and its Fourier transform is supported on the integral-norm cone V_int. The extension and support use the convergent extension-parameter sums, with self-dual trace Fourier measure; they do not follow merely from compact support of the total. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Proposition 2.22 p.15, proof pp.16–22.)

The argument is to apply the extension cancellation to lattice-indicator transforms.

*Needs:* Layer 6 `exoticSplit`, Layer 6 `exoticExtensionCount`, `MetaplecticAutomorphicForms:MP.0`.

### 6.5 Exotic geometric local modularity

Prove `exoticCurveFourier`. For a type-four curve indexed by Λ, its special-divisor Euler function is −q(1+q)1_Λ+Σ_(proper integral vertices Λ′⊃Λ)1_Λ′. It takes 1−q on Λ, one on integral-norm Λ^vee∖Λ and zero elsewhere. There are q²+1 relevant overlattices, vol Λ=q^(−2), and the Fourier eigenvalue is −1. Tate reduction implies the same negative eigenvalue for the geometric vertical function. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Lemma 2.55 pp.32–34; Proposition 2.51 p.30, proof p.34.)

The argument is to compute the line degree on each component, Fourier-transform indicators and combine the curve classes.

*Needs:* Layer 5 `exoticTate`, Layer 5 `exoticCancellation`, Layer 6 `exoticSplit`, `MetaplecticAutomorphicForms:MP.0`.

### 6.6 Exotic horizontal identity

Prove `exoticHorizontal`. The geometric and analytic horizontal functions agree. Primitive horizontal cycles are indexed by type-one rank n−1 overlattices and both component contributions are included. For primitive rank-two cycles, the predecessor subtraction is by a lattice of colength q, with exact conductor determined by the trace-dual invariants. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Corollary 2.46 p.29; Lemmas 2.53–2.54 pp.31–32.)

The argument is to reduce the primitive intersection to rank two and sum the conductor lengths.

*Needs:* Layer 6 `exoticSplit`, Layer 5 `exoticRankTwo`, Layer 5 `exoticCancellation`.

### 6.7 Exotic special two-overlattice induction

Prove `exoticSpecialInduction`. Assume r≥2, integral Lflat and isolated largest invariant a=a_(n−1)>a_(n−2), hence a odd. There are zero or two integral full lattices M±⊃Lflat with terminal invariants (a−1,a−1) and preceding invariants (a1,…,a_(n−2)). In the two case a≥3 and M±∩span Lflat=Lflat. There are orthogonal decompositions Lflat=A⊥B and M±=A⊥B±, where A has rank n−2 and the preceding invariants, B has rank one of invariant a, and B± has rank two of invariants (a−1,a−1). Define S_Lflat=M+∪M− in this case and Lflat+W_int otherwise. Outside S, Lemma 2.58 provides the strictly smaller-valuation comparison used in the induction. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Lemma 2.57 pp.34–35; Lemma 2.58 p.36.)

The argument is to use the ramified normal forms to classify the zero/two alternatives and the common orthogonal summand. In the two case use a≥3 to obtain the strict-positive support on the residual line. Apply the valuation comparison only outside the specified support set.

*Needs:* Layer 6 `exoticExtensionCount`, Layer 5 `exoticCancellation`.

### 6.8 Exotic smooth Kudla–Rapoport identity

Prove `exoticMain`. For every full-rank lattice L in the nonsplit even-rank exotic special Hom space, Int(L)=∂Den(L). The difference Φ=∂Den_V−Int_V is Schwartz, has integral Fourier support and is confined by the special induction to S_Lflat. In the ordinary case the factorization through a lattice indicator kills it; in the special case the strict-positive support on the remaining line and U3/uncertainty kill it. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Theorem 2.7 p.11; proof of §2.7 pp.37–38.)

The argument is to induct on the valuation with rank-two base and cancellation; use the two distinct support arguments.

*Needs:* Layer 5 `exoticRankTwo`, Layer 6 `exoticAnalyticFourier`, Layer 6 `exoticCurveFourier`, Layer 6 `exoticHorizontal`, Layer 6 `exoticSpecialInduction`, Layer 3 `uncertainty`.

### 6.9 Relative and absolute exotic cycle comparison

Establish `relativeCycle`. Assume the base field F/Q_p is unramified, as in LL2 §2.8. Under the relative/absolute RZ functor equivalence of LL2 Corollary 2.65, the special Hom spaces identify isometrically with their scaled forms, and the special cycles and derived classes correspond. Thus the local identity is available in the global unitary-model convention without a valuation shift. ([LL2](https://www.math.columbia.edu/~chaoli/AIPF2.pdf) Corollaries 2.65–2.66, author p.43.)

The argument is to compare the Hom-lifting functors through the relative Dieudonné equivalence; this equivalence is a requested RZ-model input.

*Needs:* Layer 5 `exoticCycles`, Layer 6 `exoticMain`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### Examples

A full-rank exotic overlattice of type two contributes 2 through the empty product; type four contributes 2(1−q²), which is negative. On the geometric type-four component the indicator sum has q²+1 terms and gives −q(1+q)+(q²+1)=1−q on Λ. The special two-overlattice case has a≥3; an isolated top invariant one is excluded from that alternative.

### Dependencies

Use `CrystallineCohomology:CR.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `GrossZagierAndArithmeticHeightsPartII:U3`, `GrossZagierAndArithmeticHeightsPartII:U5`, `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`, `SchemeKTheoryOperationsPartII:FK.0`, `SchemeKTheoryOperationsPartII:FK.2`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.
- **Ramified density extension.** GN.3’s inspected nodes are unramified. Source-check the ramified interpolation/normal forms, the weighted extension sums and the Krämer primitive formula/vertex triangular system under the two distinct dualities. This is a GN.3 extension request, not a privately duplicated density implementation.

## Layer 7: Krämer model geometry and horizontal correction

On the ramified Krämer model of either hermitian sign, construct special cycles, type-zero exceptional projective spaces and positive-type symplectic incidence strata. Prove the corrected incidence relations and deformation properties, classify horizontal lattices and define the exceptional-line correction in the graded derived cycle. Establish the parity-corrected cancellation and geometric Fourier bounds.

### 7.1 Krämer special cycles and exceptionals

Construct `kramerCycles`. For ramified F/F0, p odd, π^c=−π and n≥2, use the principally polarized Krämer RZ functor with its rank n−1 Lie filtration, signature quotient rank one, and polarization-compatible framing quasi-isogeny up to the specified unit. Z(x) is the liftability locus from the canonical signature-(0,1) lift G. For x≠0 it is Cartier. Type-zero vertices index disjoint exceptional Cartier divisors Exc_Λ≅P^(n−1). ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definitions 2.1–2.2 pp.10–11; Definitions 2.3–2.4 and Lemma 2.5 p.12, with filtration/framing corrections.)

The argument is to use the requested Krämer RZ representability theorem and Hom obstruction; keep the filtration rank and polarization compatibility explicit.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `kramerCycles.lift`: Z(L) is simultaneous extension of all special Hom labels.
- `kramerCycles.exceptional`: Type-zero components are Cartier P^(n−1).
- `kramerCycles.basis`: Howard’s compatible ideal maps give basis-independent derived classes.
- `kramerCycles.baseChange`: Pullback of the Krämer test object and its Lie filtration pulls back each special Hom-lifting locus, retaining the polarization-compatible framing.

**Checks.**

- The filtration has rank n−1, not rank one unless n=2.
- A framing quasi-isogeny that fails polarization compatibility is excluded.
- Z(0) is the entire Krämer model and has codimension zero, whereas a nonzero liftable label gives a Cartier cycle.

*Needs:* `PELModuli:M6`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 7.2 Symplectic incidence resolution

Construct `symplecticIncidence`. For a 2m-dimensional symplectic F_q-space V, S_V parametrizes Lagrangian U with dim(U∩Phi U)≥m−1. Y_V parametrizes pairs (U,U′) with dim U′=m−1 and U′⊂U∩Phi U. Y_V is smooth projective of dimension m. For m≥2 its projection resolves the rational-point singularities of S_V with exceptional P^(m−1); for m=1, S_V=P¹ and the projection is an isomorphism. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) §3.1, Propositions 3.1–3.3, author pp.16–17.)

The argument is to construct the isotropic flag incidence scheme and compute tangent spaces, separating m=1.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `symplecticIncidence.points`: The dimension inequality is on U∩Phi U.
- `symplecticIncidence.projection`: Forget U′ to obtain Y_V→S_V.
- `symplecticIncidence.smallRank`: At m=1, U′=0 and Y_V=S_V=P¹.
- `symplecticIncidence.functor`: An isometry of symplectic spaces commuting with Frobenius transports the pair U′⊂U, commutes with the projection and induces an isomorphism of incidence schemes.

**Checks.**

- m=1 is smooth and has no exceptional blowup at rational points.
- For m=2 the fibre over a rational Lagrangian is P¹.
- Replacing the ≥m−1 condition by equality removes the boundary.

*Needs:* `MotivesAndAlgebraicCycles:MC.2`.

### 7.3 Krämer vertex strata

Construct `kramerStrata`. Use hermitian sharp Λ^sharp={x:h(x,Λ)⊂OF}; a vertex obeys πΛ^sharp⊂Λ⊂Λ^sharp and has even type. For positive type 2m, N_Λ≅Y_(Λ^sharp/Λ) has dimension m; type zero gives Exc_Λ. Positive strata intersect in N_(Λ+Λ′) only if their sum is a vertex of positive type; a type-zero sum gives empty positive-stratum intersection. For integral L, Z(L) meets N_Λ iff L⊂Λ^sharp. Nonintegral L gives an empty special cycle. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definition 3.4 and point dictionary pp.17–18; Theorem 3.16 p.25; Theorem 3.19 p.26; Proposition 3.20 p.27, corrected.)

The argument is to identify lattice-pair points, prove reducedness by deformation and compare the incidence functors.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `kramerStrata.sharp`: Hermitian sharp is distinct from trace dual π^(−1)Λ^sharp.
- `kramerStrata.stratum`: Positive type 2m identifies with the dimension-m incidence variety.
- `kramerStrata.support`: The support criterion assumes L integral.
- `kramerStrata.incidence`: Stratum intersection and containment are computed using the source vertex inclusions with the hermitian sharp dual, without substituting the trace dual.

**Checks.**

- A positive-stratum sum of type zero gives empty intersection.
- Type two yields a smooth P¹-type incidence variety.
- If L has a negative norm valuation, the cycle is empty even if a careless dual containment test succeeds.

*Needs:* Layer 7 `kramerCycles`, Layer 7 `symplecticIncidence`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, Layer 7 `kramerDeformation`.

### 7.4 Krämer stratum deformation

Prove `kramerDeformation`. Define N_Λ by K Definition 3.4 before proving its incidence identification. For positive-type Λ, impose the additional Lie-image condition of Definition 3.7. Its covariant PD deformation flags satisfy F^perp rank one⊂Fil rank n⊂D rank 2n, Fil maximal isotropic, (Π+π)F^perp=0, (Π−π)Fil⊂F^perp, Fil containing (Π+π)Λ and F^perp⊂Λ^perp. There are no O/π²-valued deformations and tangent dimension≤m for type 2m>0. These imply reducedness and smoothness and hence the incidence identification. For type zero a separate no-π² argument and the infinitesimal thickening criterion remain required; the positive-type coordinate argument cannot simply be specialized to m=0. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definition 3.7, Lemmas 3.8–3.15, Theorem 3.16 pp.19–25; Proposition 3.17 pp.25–26.)

The argument is to construct the lattice-defined closed subfunctor directly from the Krämer moduli problem, without assuming the strata theorem. Apply Grothendieck–Messing and the positive-type coordinate calculation, then the no-thickening criterion. At type zero the positive-type proof chooses a coefficient required simultaneously to be a unit and zero when m=0; supply a separate argument and the cited thickening lemma as a recorded leaf.

*Needs:* Layer 7 `kramerCycles`, Layer 7 `symplecticIncidence`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-dual-lattice`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/covariant-dieudonne-module`, `CrystallineCohomology:CR.7/messing-filtration-interface`.

### 7.5 Krämer horizontal lattices and primitive cycles

Construct `kramerHorizontal`. A rank n−1 integral horizontal lattice Mflat is either unimodular, or a unimodular rank n−2 summand plus a line y whose complementary binary space is nonsplit. It has a unique containing type-zero vertex. In a nonsplit binary complement, its primitive quasi-canonical cycle is Z_s^+ disjoint-union Z_s^− for s=val(y)>0, each of degree q^s; at s=0 it is a single Z_0≅Spf O_breveF. In a split binary complement horizontality requires val(y)=0 and the primitive cycle is the single flat cycle Spf O_breveF. Sum these primitives over the horizontal overlattices to obtain Z(Lflat)_H. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definition 4.1, Lemma 4.2, Theorem 4.3, author pp.27–28.)

The argument is to use the ramified rank-two quasi-canonical classification with its sign and unit-norm hypotheses.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `kramerHorizontal.horizontal`: The binary orthogonal complement condition is part of the definition.
- `kramerHorizontal.primitive`: For nonsplit binary complement the primitive degree is one at s=0 and 2q^s at s>0; split binary complement permits only s=0 with degree one.
- `kramerHorizontal.overlattices`: Sum over horizontal overlattices only.
- `kramerHorizontal.latticeExt`: Replacing a basis of Mflat does not change its binary complement, primitive cycle or conductor-indexed degree.

**Checks.**

- A unit line in a nonsplit binary complement has one primitive component and degree one.
- At valuation s=1 in a nonsplit binary complement there are two components of degree q, so total degree 2q.
- In a split binary complement a nonunit line is not horizontal; a unit line has one primitive component of degree one.

*Needs:* Layer 7 `kramerStrata`, Layer 1 `primitiveHorizontal`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/hermitian-lattice-invariants`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6/quasi-canonical-lift`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7/quadratic-degree`.

### 7.6 Modified Krämer horizontal and vertical classes

Define `modifiedHorizontal`. Work in K/F^n for the rank n−1 derived cycle. For a horizontal Mflat put D(Mflat)=[O_Ztilde(Mflat)^circ]+alpha[O_P¹exception], where alpha=(1−(−1)^(n−1))/2 for unimodular Mflat and alpha=1 otherwise. Sum D over horizontal overlattices to define H*, and V*=LZ−H*. The correction is a class of an exceptional line, not the whole exceptional P^(n−1). ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Lemma 4.4, (4.4)–(4.6) p.28; Definitions 4.5,4.7 and Lemmas 4.6,4.9 p.29.)

The argument is to use the exceptional line pairing to modify the horizontal decomposition in the quotient.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `modifiedHorizontal.coefficient`: For unimodular Mflat, alpha is zero in odd n and one in even n.
- `modifiedHorizontal.horizontal`: H* is the finite supported sum of modified primitives.
- `modifiedHorizontal.vertical`: V*=derived−H* in the specified quotient.
- `modifiedHorizontal.projection`: The quotient map from supported K-theory sends the derived class to H*+V*; changing a representative by F^n leaves every admitted divisor pairing unchanged.

**Checks.**

- For n=3 unimodular alpha=0.
- For n=2 unimodular alpha=1.
- For nonunimodular horizontal Mflat alpha=1 in either parity.

*Needs:* Layer 7 `kramerHorizontal`, Layer 0 `derivedCycle`, `SchemeKTheoryOperationsPartII:FK.4/cartier-divisor-pairing`, `SchemeKTheoryOperationsPartII:FK.2`.

### 7.7 Parity-corrected Krämer cancellation

Prove `kramerCancellation`. Let L=I_ell⊥L_2 have total rank n=ell+r, with I_ell unimodular and L_2 of rank r. If I_r is a unimodular lattice in the complementary space containing L_2, put n(I_r,L_2)=#{M⊃L_2:M≅I_r}. Then Int_n(L)−Int_r(L_2)=n(I_r,L_2)(delta_odd(n)−delta_odd(r)). In particular Int(I_n)=delta_odd(n). It is the complementary rank r, not the removed rank ell, that appears in the second parity term. Retain the source’s admissible positive-rank complementary model. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Proposition 2.12, author p.15.)

The argument is to track exceptional intersections under the regular-immersion pullback rather than importing the unramified cancellation formula unchanged.

*Needs:* Layer 7 `kramerCycles`, Layer 7 `modifiedHorizontal`.

### 7.8 Krämer geometric Fourier bounds

Prove `kramerGeometricFourier`. For every vertex Λ and K-class supported on its proper Krämer stratum N_Λ, the special-divisor Euler function on nonzero labels extends uniquely to a Λ-invariant Schwartz–Bruhat function whose Fourier support has norm valuation≥−1. The modified geometric vertical function has the same Fourier bound. Integrating it along span Lflat gives a Schwartz function on the normal line W whose Fourier support is W_(≥−1); hence it is invariant under W_(≥0) and constant there. The Λ-translation identity for K-classes is stated only where both labels are nonzero. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definition 4.12, Lemma 4.13, Theorems 4.14–4.16, author pp.31–32.)

Howard’s linear invariance gives Λ-translation invariance of the supported K-class Euler function for nonzero labels. Proper support bounds it inside Λ^sharp; translation extends the function at zero and places its Fourier support inside the trace dual π^(−1)Λ^sharp, whose norm valuation is at least −1. Decompose the modified vertical class over its finite union of proper strata. Restrict the Fourier transform to the normal line after partial integration to obtain W_(≥0)-invariance. No Tate-class generation or curve reduction is used in this Krämer argument.

*Needs:* Layer 7 `modifiedHorizontal`, Layer 7 `kramerStrata`, Layer 7 `kramerCycles`, `SchemeKTheoryOperationsPartII:FK.3/closed-union-decomposition`, `MetaplecticAutomorphicForms:MP.0`.

### Examples

At valuation zero a nonsplit primitive horizontal cycle has one component of degree one. At valuation one it has two components of degree q, giving 2q. For a unimodular horizontal lattice the exceptional-line coefficient is one in n=2 and zero in n=3. If a unimodular rank-one summand is removed from total rank three leaving rank two and representation count one, the cancellation correction is 1−0=1.

### Dependencies

Use `CrystallineCohomology:CR.7`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U1`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.6`, `LubinTateFormalModulesAndQuasiCanonicalLifts:LT.7`, `MetaplecticAutomorphicForms:MP.0`, `MotivesAndAlgebraicCycles:MC.2`, `PELModuli:M6`, `SchemeKTheoryOperationsPartII:FK.2`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.
- **Quasi-canonical rank-two lifting leaves.** Import the marked quasi-canonical construction, quadratic level classification and degree formula from LubinTateFormalModulesAndQuasiCanonicalLifts LT.6–LT.7. That packet does not state the Gross–Keating or ramified Shi/He–Shi–Yang intersection-length formulas needed here. Request those formulas as an extension of that owner, with order/conductor, component, sign and valuation dictionaries. R07.4 supplies integral comparison, not these lengths. The LZ special-Tate-module criteria and rank-three multiplicities remain U1 targets with their stated integral-comparison leaf.
- **Krämer type-zero infinitesimal criterion.** The positive-type tangent-space argument does not prove type-zero reducedness. In the use of Lemma 3.10 with m=0, the coefficient a_(m+1) is required to be both zero and a unit, so that specialization is unavailable. Give a separate no-O/π²-point proof for the type-zero moduli functor and verify the hypotheses of the cited infinitesimal thickening criterion.

## Layer 8: Krämer density correction and proof obligation

Import ramified density polynomials with −2 derivative normalization and the uniquely determined dual-vertex correction coefficients. State primitive density products, positive-cone constancy of the analytic partial integral and the horizontal identity. Isolate the false negative-norm vanishing and the missing isolated odd-top induction case; the full Krämer identity is a target with this explicit proof gap.

### 8.1 Modified Krämer density derivative

Define `modifiedDensity`. Let D(M,L;X) interpolate Den(M⊥H^k,L) at X=q^(−2k), with H Gram matrix (0,π^(−1);−π^(−1),0). Put Den′(L)=−2 d_X D(I_n,L;1)/Den(I_n,I_n), where I_n has the opposite sign to V. Let Den_(2j)(L)=Den(Λ_(2j)^sharp,L)/Den(Λ_(2j)^sharp,Λ_(2j)^sharp). Define ∂Den=Den′+Σ_(j=1)^(tmax/2)c_(2j)Den_(2j), where the unique c satisfy ∂Den(Λ_(2i)^sharp)=0. Here tmax=n if n even and χ(V)=1, n−2 if n even and χ(V)=−1, n−1 if n odd. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definitions 1.1–1.2, (1.1)–(1.6) pp.3–4; §5.1 p.33.)

The argument is to request the ramified density polynomial and triangular coefficient system from GN.3; apply the unitriangular vertex evaluation.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `modifiedDensity.raw`: The raw derivative carries the factor −2.
- `modifiedDensity.correction`: All dual positive-vertex evaluations vanish after correction.
- `modifiedDensity.range`: The summation limit is determined by both rank and hermitian sign.
- `modifiedDensity.uniqueness`: The corrected polynomial is uniquely specified by the raw derivative and the normalized dual-vertex equations, once the requested vertex-density matrix is invertible.

**Checks.**

- For even nonsplit sign χ=−1 the top type is n−2.
- The corrected derivative vanishes on each Λ_(2i)^sharp by construction.
- Using only Den′ can give a nonzero value on a nonintegral lattice whose geometric cycle is empty.

*Needs:* `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, Layer 7 `kramerStrata`.

### 8.2 Primitive Krämer density formula

Prove `primitiveDensity`. The primitive corrected term is zero on nonintegral lattices and delta_odd(n) on unimodular lattices. For L=I_(n−t)⊥L_2 with L_2 of positive full type t it is prod_(i=1)^((t−1)/2)(1−q^(2i)) when t odd; when t even it is (1−χ(L_2)q^(t/2))prod_(i=1)^(t/2−1)(1−q^(2i)). The sign χ(L_2) is that of the full-type part L_2; I_(n−t) is the unimodular part. Summing primitive terms over integral overlattices gives ∂Den(L). ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Theorem 7.1 and Corollaries 7.2–7.3, author p.46.)

The argument is to use the ramified density combinatorics and the vertex correction system; full generic combinatorial proof is requested, not duplicated.

*Needs:* Layer 8 `modifiedDensity`, `GeometryOfNumbersAndQuadraticArithmetic:GN.3`.

### 8.3 Krämer analytic horizontal and vertical functions

Define `kramerAnalyticSplit`. For rank n−1 nondegenerate Lflat, partition the primitive-overlattice expansion of ∂Den(Lflat+OF x) according to whether M∩span Lflat is horizontal. These are ∂Den_H and ∂Den_V. Use the modified geometric H*,V* for Int_H and Int_V. On the normal line W define the partial integral by integrating the function along span Lflat with the chosen Haar measure. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Definition 8.1 p.64; Definition 9.2 p.73.)

The argument is to use the same lattice partition and measures on both sides.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `kramerAnalyticSplit.partition`: Each integral overlattice enters exactly one of H or V.
- `kramerAnalyticSplit.partial`: Partial integral integrates along the hyperplane; it is not itself a Fourier transform.
- `kramerAnalyticSplit.sum`: Horizontal plus vertical recovers the total function off the hyperplane.
- `kramerAnalyticSplit.latticeExt`: Equal embedded hyperplane lattices give equal H/V partitions and equal partial integrals for the fixed Haar measure.

**Checks.**

- A horizontal lattice contributes to H, not V.
- A constant along-hyperplane factor changes the partial integral by its Haar volume.
- In the split rank-three example of U8/kramer-analytic-bound, normal norm −π0^(−1) gives vertical partial integral 2q·vol(Lflat), not zero.

*Needs:* Layer 8 `primitiveDensity`, Layer 7 `modifiedHorizontal`, `MetaplecticAutomorphicForms:MP.0`.

### 8.4 Corrected Krämer analytic partial-integral bound

Prove `kramerAnalyticBound`. The analytic vertical partial integral is constant on W_(≥0)∖{0}, after correcting the discriminant sign in the proof of K Theorem 8.2. That theorem does not independently give analytic Fourier-support bounds. Its negative-cone vanishing assertion is false: in split rank three take Lflat=⟨e⟩⊥⟨ℓ⟩ with h(e,e)=1, h(ℓ,ℓ)=π0 and x∈W with h(x,x)=−π0^(−1). Here π0 is a base-field uniformizer and norm valuations are base-field valuations. The 2q classes α∈π0^(−1)OF/OF with π0α≡±1 modulo π give unimodular integral lattices Lflat+OF(x+αℓ). Each has hyperplane intersection Lflat and primitive weight one, so the partial integral is 2q·vol(Lflat)≠0. Only positive-cone constancy is retained for the final comparison. The analytic Schwartz conclusion of Corollary 9.8 depends on the unresolved full identity in U8/kramer-main. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Theorem 8.2 pp.64–67; proof §§8.3–8.9 pp.67–72, retaining only the corrected conclusions.)

The argument is to apply the primitive product formula and weighted extension count, using χ(−1)^n1 rather than (−1)^n1 in the orthogonal-sum discriminant calculation (8.6). The norm-shell identities handle either discriminant sign. Combine the scaling equality with OF-unit invariance to obtain positive-cone constancy. Do not import analytic Fourier or Schwartz conclusions through Corollary 9.8 before closing its dependency on Theorem 9.7.

**Check.** For q=5 and n1=1, the orthogonal-sum sign factor is χ(−1)=1, not −1. The rank-three negative-cone example has value 2q·vol(Lflat) and must not be forced to zero.

*Needs:* Layer 8 `kramerAnalyticSplit`, Layer 8 `primitiveDensity`.

### 8.5 Krämer horizontal identity

Prove `kramerHorizontal`. With modified H*, geometric and analytic horizontal functions agree for all x outside span Lflat. If Lflat itself is horizontal, Int_H equals the total geometric intersection. The proof reduces to the exact ramified rank-two quasi-canonical formulas, including exceptional-line corrections. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Lemmas 9.1,9.3–9.4 and Theorem 9.5, author pp.73–74.)

The argument is to use the rank-two calculations of Shi and He–Shi–Yang as a precise external proof leaf; then sum modified primitive classes.

*Needs:* Layer 7 `kramerHorizontal`, Layer 7 `modifiedHorizontal`, Layer 8 `kramerAnalyticSplit`, Layer 7 `kramerCancellation`.

### 8.6 Krämer Kudla–Rapoport identity and isolated odd-top obligation

Prove `kramerMain`. Target: for every full-rank lattice on the Krämer model, Int(L)=∂Den(L). The proposed proof uses rank-two base, parity-corrected cancellation, the horizontal identity and partial-integral constancy. Its remaining induction step must handle the isolated odd top invariant separately: in split rank two let H1 have Gram matrix ((0,π),(−π,0)), put Lflat=<l1+πl2> and x=l2. Then Lflat has fundamental invariant two, L=H1 has invariants (1,1), and every nondegenerate line in H1 has fundamental invariant≥2. Here fundamental invariants use the extension-field π-valuation; h(l1+πl2,l1+πl2)=−2π² has base-field norm valuation one. The projection of x onto span Lflat has coefficient 1/(2π), so it is not integral. Thus the blanket strict-decrease claim in Lemma 9.6 is false; Theorem 9.7 is not treated as proved by that argument. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Lemma 9.6 p.74; Theorem 9.7 p.75; Corollary 9.8 p.76.)

The argument is to supply a separate odd-top identity or another decreasing invariant, prove it covers the displayed counterexample, then finish the partial-integral comparison. This is an explicit gap, not a conjectural assumption silently removed.

*Needs:* Layer 7 `kramerGeometricFourier`, Layer 8 `kramerAnalyticBound`, Layer 8 `kramerHorizontal`, Layer 7 `kramerCancellation`.

### Examples

For a unimodular lattice the corrected primitive density is one in odd rank and zero in even rank. A full-type-two part contributes 1−χ(L2)q, so signs χ=±1 produce different answers. In the split plane H1, the line generated by l1+πl2 has valuation two, yet adjoining l2 gives invariants (1,1). This tests the exact gap in the blanket hyperplane-decrease argument without changing the final Krämer theorem’s target. In the separate split rank-three example Lflat=⟨e⟩⊥⟨ℓ⟩ with norms 1,π0, a normal vector of norm valuation −1 has partial integral 2q·vol(Lflat), so negative-cone vanishing is false.

### Dependencies

Use `GeometryOfNumbersAndQuadraticArithmetic:GN.3`, `GrossZagierAndArithmeticHeightsPartII:U7`, `MetaplecticAutomorphicForms:MP.0`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Quasi-canonical rank-two lifting leaves.** Import the marked quasi-canonical construction, quadratic level classification and degree formula from LubinTateFormalModulesAndQuasiCanonicalLifts LT.6–LT.7. That packet does not state the Gross–Keating or ramified Shi/He–Shi–Yang intersection-length formulas needed here. Request those formulas as an extension of that owner, with order/conductor, component, sign and valuation dictionaries. R07.4 supplies integral comparison, not these lengths. The LZ special-Tate-module criteria and rank-three multiplicities remain U1 targets with their stated integral-comparison leaf.
- **Ramified density extension.** GN.3’s inspected nodes are unramified. Source-check the ramified interpolation/normal forms, the weighted extension sums and the Krämer primitive formula/vertex triangular system under the two distinct dualities. This is a GN.3 extension request, not a privately duplicated density implementation.
- **Krämer isolated odd-top induction repair.** Lemma 9.6 of the author copy has the explicit split-plane valuation counterexample in U8/kramer-main. A separate identity for this case or another well-founded invariant must close Theorem 9.7; excluding that lattice would change the theorem. The false negative-normal-norm vanishing from Theorem 8.2 is not used.

## Layer 9: Local AFL geometry and rank reduction

Define strongly regular group and semi-Lie intersections on unramified RZ spaces, their proper support and orbit invariance. Compare graph pullbacks through the relative Cayley map, prove rank and norm-unit reductions with residue-size bounds, and prove fixed-g and joint local constancy using higher local modularity. Import the distinct Jacquet–Rallis analytic transfer contract.

### 9.1 Group AFL intersection

Define `groupIntersection`. On N_(n−1)×N_n let Δ be the graph of the unit-vector embedding δ:N_(n−1)≅Z(u0)→N_n. For relative regular semisimple g∈U(V_n), define Int(g)=χ(O_Δ⊗^L O_(1×g)Δ) over O_breveF. The intersection support is a proper scheme killed by a uniformizer power. Strong regularity additionally requires g to be semisimple for full conjugation. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §3.1 (3.7)–(3.8) p.881; Definitions 3.5–3.6 p.883.)

The argument is to use the unit-norm cycle embedding, graph intersection and the regular-semisimple properness criterion.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `groupIntersection.graph`: The translated graph is (1×g)Δ.
- `groupIntersection.euler`: Retain the derived tensor and O_breveF-length.
- `groupIntersection.strong`: Strong regularity is relative regularity plus conjugation semisimplicity.
- `groupIntersection.conjugation`: For h in the subgroup fixing the distinguished vector, conjugation g↦hgh^−1 identifies the graph-intersection complexes and preserves their finite proper Euler length.

**Checks.**

- An ordinary transverse graph intersection gives its length.
- A nontransverse intersection retains Tor terms.
- For n≥3 a regular unipotent element cyclic on the distinguished vector is relatively regular but is not semisimple, so it is outside strong regularity.

*Needs:* Layer 0 `basisProperness`, `SchemeKTheoryOperationsPartII:FK.4/derived-euler-pairing`.

### 9.2 Derived fixed locus and semi-Lie intersection

Define `semilieIntersection`. For g∈U(V_m), let N^g be the naive fixed locus and LN^g=[O_Γg⊗^L O_ΔN], transported to N. For relative regular semisimple (g,u), define Int(g,u)=χ(LN^g⊗^L O_Z(u)). Equivalently evaluate O_Γg⊗^L O_ΔZ(u) on N×N. This is invariant under simultaneous unitary conjugation; proper support is part of the regularity theorem. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §3.1 (3.11)–(3.13), Remark 3.1 p.882.)

The argument is to apply the graph/diagonal projection formula; distinguish the naive fixed scheme from its derived K-class.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `semilieIntersection.fixed`: The naive fixed scheme is only the support of the derived class.
- `semilieIntersection.projection`: The N×N graph formula equals the N formula.
- `semilieIntersection.conjugation`: Int(hgh^(-1),hu)=Int(g,u).
- `semilieIntersection.linearity`: The Euler functional is additive in supported K-classes on the common proper support; this does not make the special cycle linear in its Hom label.

**Checks.**

- A fixed component contained in Z(u) is evaluated by derived intersection.
- A nonregular pair is not assigned a finite number by this theorem.
- Replacing u by a scalar unit does not change its divisor.

*Needs:* Layer 9 `groupIntersection`, Layer 0 `derivedCycle`, `SchemeKTheoryOperationsPartII:FK.4/proper-pushforward-projection`.

### 9.3 AFL orbital-integral normalization

Establish `analyticAflInterface`. For group rank n use S_n={γ∈GL_n(F):γγbar=1} with GL_(n−1)(F0)-conjugation; the semi-Lie variant uses S_m×(F0^m⊕(F0^m)^*) with m=n−1 and GL_m. The twisted orbital integral integrates |det h|^s eta(det h), Haar vol GL_m(OF0)=1. ∂Orb includes the transfer factor omega, with group omega(γ)=tilde eta(det(γ)^(−floor(n/2)) det(γ^i e)_(i=0)^(n−1)). Matching is Jacquet–Rallis matching, not ordinary endoscopic matching. The AFL target is ∂Orb=−Int·log q, q=#k_F0. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §2.3 (2.13)–(2.18) pp.876–878; Conjecture 3.2 pp.882–883.)

The argument is to request the full relative matching, transfer factor, twisted orbital integrals and fundamental lemma from an explicit extension of the relative trace owner. The existing ordinary endoscopy stage does not already supply this.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `MetaplecticAutomorphicForms:MP.0`, Layer 9 `semilieIntersection`.

### 9.4 Relative Cayley graph comparison

Prove `cayleyGraph`. On the determinant-unit and 1−d unit open set, for g′=(h,u;w*,d) put g=h+(1−d)^(−1)uw* and relative vector u/((1−d)sqrt(epsilon)), as in the source’s fixed auxiliary unit epsilon∈OF0^× with F=F0[sqrt(epsilon)]. The extended relative Cayley map is birational. Its graph pullback is the ordinary expected-codimension pullback of the RZ graphs, and the derived projection yields Int(g′)=Int(g,u). Scalar Cayley c(x)=−(1−x)(1+x)^(−1) and inverse (1+g)(1−g)^(−1) retain their invertibility domains. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §§4.1–4.2 pp.884–890; Lemma 4.4 pp.888–889; Proposition 4.6 p.890.)

The argument is to use block identities, CM regular-sequence pullback and the projection formula; never extend across denominator-zero points.

*Needs:* Layer 9 `semilieIntersection`, `SchemeKTheoryOperationsPartII:FK.3/expected-dimension-tor-vanishing`, Layer 9 `analyticAflInterface`.

### 9.5 AFL rank and norm-unit reduction

Prove `aflRankReduction`. If q≥n+1, group AFL for S_n is equivalent to semi-Lie AFL on V_(n−1), on strongly regular loci. The group-to-semi-Lie direction is available at q≥n. The reverse direction at q=n needs an additional scalar-avoidance argument: besides avoiding roots of det(1−ξg′), one must require 1−ξd to be a unit. Semi-Lie AFL in rank m with unit norm follows from group AFL in rank m by the unit-vector reduction without any residue-cardinality hypothesis. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §§4.3–4.5 pp.890–896; Proposition 4.12 and Corollary 4.13 p.895.)

The argument is to transport matching and transfer factors through the relative Cayley map; compare characteristic test functions and unit-norm intersections.

*Needs:* Layer 9 `cayleyGraph`, Layer 9 `analyticAflInterface`, Layer 0 `selfdualCancellation`.

### 9.6 Local constancy and compact support

Prove `aflLocalConstancy`. For fixed g, Int(g,u) is locally constant on the relative regular semisimple locus in every dimension, by proper vertex support and higher local modularity. Its support modulo conjugation lies in a finite union of compact lattice regions. Joint local constancy follows via the rank-(m+1) graph construction in the range q≥m used in the final induction. Do not claim the rank-raised proof gives an unrestricted bound. In the rank-raised construction scalar avoidance is applied to the original rank-m g before lifting, so q+1>m suffices; it is not applied to an arbitrary rank-(m+1) matrix. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Proposition 5.2 pp.896–898; Theorem 5.5 pp.899–900.)

The argument is to reduce fixed-g classes to proper strata; use local constancy of their Euler functions without Appendix B’s global filtration product, then apply relative Cayley in rank m+1. In the invariant-map differential use cyclicity: delta↦(h(delta,(−x)^j u))_j is an F-linear isomorphism; project to conjugation eigenspaces. Do not assume the compressed algebra F[x] is etale.

*Needs:* Layer 2 `higherLocalModularity`, Layer 1 `vertices`, Layer 9 `cayleyGraph`, Layer 9 `semilieIntersection`.

### 9.7 Maximal-order AFL input

Prove `maximalOrder`. For an unramified quadratic local extension of odd residue characteristic and semi-Lie dimension m=n−1, Proposition 3.9 supplies the maximal-order strongly regular AFL under p>n=m+1, with OF[g] maximal. This is a restricted arithmetic input. Do not use it in semi-Lie dimension m under the weaker bound p≥m; the final global comparison enlarges the exceptional coefficient set instead. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Proposition 3.9 p.884; use in §§14–15 pp.966–969.)

The argument is to request/read Mihatsch’s Corollary 9.9 and check the p>n/index convention before using it as the final induction leaf.

*Needs:* Layer 9 `analyticAflInterface`, Layer 9 `semilieIntersection`.

### Examples

The Cayley map is undefined at a block with d=1; graph comparison therefore requires a unit denominator on the integral locus. For norm-unit u, the special cycle is the lower-rank RZ embedding and the norm-unit reduction has no scalar-avoidance bound. In semi-Lie rank m, the maximal-order leaf printed in Proposition 3.9 needs p>m+1. At q=n, counting n eigenvalue residues alone leaves no guaranteed room for the additional forbidden d-residue.

### Dependencies

Use `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U1`, `GrossZagierAndArithmeticHeightsPartII:U2`, `MetaplecticAutomorphicForms:MP.0`, `SchemeKTheoryOperationsPartII:FK.3`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Jacquet–Rallis relative comparison supplier.** The proposed JacquetRallisRelativeTraceComparison supplier is not registered, and ET ordinary endoscopy does not cover it. The exact ET.0 extension request must receive an accepted owner and source decomposition, including the independent FL at q=rank, nilpotent transfer and SL2 strong approximation used by Lemma 13.6.
- **AFL maximal-order and base-case source leaves.** Read Mihatsch’s maximal-order Corollary 9.9 with the artinian/FL hypotheses rather than weakening Proposition 3.9’s printed bound. Read or compute the semi-Lie dimension-one base in Zhang [46] with transfer and Haar factors. The local KR rank-one length alone does not compute the orbital integral.
- **Boundary q=rank in the reverse Cayley argument.** At q=n, avoiding the n eigenvalue residues can exhaust all but the additional forbidden residue d^(-1). The group-to-semi-Lie direction survives; the reverse needs an additional argument or independently read theorem. Preserve the published p≥n final target, but mark this step open instead of silently strengthening it to p>n.

## Layer 10: Global special cycles and local degrees

Construct generic and integral unitary KR cycles and their derived K-classes on the source-admissible RSZ models, identify uniformizations and local Euler sums with their log-residue and reflex-degree normalizations, and compare with Li–Liu’s cycle interfaces. Keep the integral model hypotheses explicit at every bad place.

### 10.1 Global unitary special cycles

Construct `globalCycles`. For a CM extension F/F0 and signature (n−1,1) at one distinguished place, fix the PEL datum, polarization lattice and rigidified level K. Z(T,phi) classifies (A0,A,x_1,…,x_r) with hermitian Gram T and prime-to-level Tate label in the support of phi. The Hom form is lambda_0^(-1)y^vee lambda x. For positive definite nonsingular T the forgetful map to the model is finite unramified; for r=1 the positive-norm cycle is étale-locally Cartier and flat under the stated RSZ hypotheses. For an equivalence (ϕ0,ϕ) of moduli pairs with common polarization similitude, transport a tuple x:A0^r→A as x′=ϕ∘x∘(ϕ0^r)^(-1), and transport its Tate label by the same conjugation. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§11.1–11.4 pp.72–77; §13.3 pp.81–82; [Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §§7.1–7.3 pp.907–909; [LL1](https://www.math.columbia.edu/~chaoli/AIPF.pdf) Lemma 5.2, Definition 5.3 and Lemma 5.4, author pp.26–27.)

The argument is to construct the actual Hom-lifting stack with Tate-level labels; apply the requested admissible integral-model and special-cycle representability theorem.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `globalCycles.moduli`: A point includes the Hom tuple and its Gram/level equations.
- `globalCycles.forget`: Equivalences (ϕ0,ϕ) transport the Hom tuple by x′=ϕ∘x∘(ϕ0^r)^(-1), with the same common polarization similitude and corresponding Tate-level transport.
- `globalCycles.finite`: Finite unramified does not mean finite étale over the arithmetic base.
- `globalCycles.baseChange`: Pulling back the abelian objects, Hom tuple and prime-to-level label identifies the special-cycle functor over the new base; the Gram matrix is preserved.

**Checks.**

- A Gram matrix with a negative definite entry has no generic positive-signature cycle of the specified type.
- A change of tuple basis transports T by hermitian congruence.
- Transport by both ϕ0 and ϕ gives x′=ϕ∘x∘(ϕ0^r)^(-1); with ϕ0=id this reduces to postcomposition.

*Needs:* `PELModuli:M1/unitary-of-abelian-scheme`, `PELModuli:M3/hermitian-hom-space`, `PELModuli:M3/complex-points`, `PELModuli:M6`.

### 10.2 Integral cycle K-classes

Construct `globalKClass`. On the smooth proper hyperspecial model of LL1 §8, for a p-basic factorizable characteristic Schwartz function phi=⊗_(j=1)^r phi_j and nonsingular T with diagonal t_j, define the T-supported component of ⊗^L O_Z(t_j,phi_j). It belongs to F^r K_0^Z and extends the generic codimension-r cycle; extend linearly in phi after the source-permitted shrinking of level. The construction needs coherent finite Tor and the codimension-filtration theorem for this arithmetic scheme. An extension to more general integral models needs a separate comparison. ([LL1](https://www.math.columbia.edu/~chaoli/AIPF.pdf) §8 (8.3) and footnote 17, author pp.37–38.)

The argument is to use the Gram-matrix component decomposition on the smooth proper hyperspecial model and the requested scheme-theoretic Gillet–Soulé filtration theorem. Extend through the finite étale changes of level away from the source’s fixed nonsplit places. This does not assert the same result for arbitrary ramified regular models or invoke an affine formal-scheme product there.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `globalKClass.component`: The T-supported summand retains off-diagonal Hom pairings.
- `globalKClass.linearity`: Extend the characteristic-function construction linearly.
- `globalKClass.generic`: The class restricts to the generic special-cycle class.
- `globalKClass.level`: For a permitted finite étale level change, flat pullback preserves the T-supported summand and its codimension filtration.

**Checks.**

- For r=1 recover the Cartier structure class.
- The product length is r, not the ambient half-rank.
- Distinct off-diagonal T with the same diagonal must not be merged.

*Needs:* Layer 10 `globalCycles`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `SchemeAndStackFoundations:SF.5`.

### 10.3 Formal special-cycle uniformization

Establish `globalUniformization`. At an admissible nonsplit place v, the formal completion of the global KR cycle is the weighted orbit sum of local RZ cycles Z(x) times the away-v level cosets, indexed by the nearby global hermitian group and tuples with Gram T. Derived K-classes pull back to the local derived tensors, with finite multiplicities and automorphism/level weights retained. This includes the r-tuple Li–Liu interface. ([LZ](https://arxiv.org/pdf/1908.01701v3) §13.3 pp.81–82; [LL1](https://www.math.columbia.edu/~chaoli/AIPF.pdf) §8 (8.3), author pp.37–38.)

The argument is to apply the requested RZ uniformization of the actual RSZ model; identify Hom labels and the stabilizer quotient, then pull back Cartier complexes.

*Needs:* Layer 10 `globalKClass`, Layer 0 `derivedCycle`, Layer 6 `relativeCycle`, `PELModuli:M6`.

### 10.4 Local arithmetic degrees

Define `localDegree`. For a nonsingular T with special-fibre-supported intersection, at v0 define Int_(T,v0) as the sum over reflex places ν|v0 of finite derived Euler lengths times log q_ν, divided by [E:F0]. At almost self-dual level specify whether auxiliary cycles are used and divide their pullback degrees by deg π1=q+1. Global finite Int_T sums these local degrees; it is not automatically the naive arithmetic Chow degree of the Y-cycles. ([LZ](https://arxiv.org/pdf/1908.01701v3) §13.5 p.83; §14.4 p.86.)

The argument is to apply proper finite-support Euler degree, account for reflex-place multiplicities and comparison degree.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `localDegree.place`: Each ν contributes its own log q_ν.
- `localDegree.normalization`: The reflex normalization is [E:F0].
- `localDegree.almostdual`: Auxiliary pullbacks carry the finite-flat degree correction.
- `localDegree.additive`: The normalized local degree is additive in the supported derived K-class on a fixed proper special-fiber support.

**Checks.**

- For one reduced rational residue point at ν the numerator is log q_ν.
- A residue extension of degree f multiplies the log by f.
- The AFL pairing’s [E:F] denominator is a different convention and must not be substituted here.

*Needs:* Layer 10 `globalUniformization`, `SchemeKTheoryOperationsPartII:FK.4/euler-degree`, Layer 4 `comparisonModel`.

### Examples

A rank-one integral KR class is the Cartier structure class. For a tuple of rank r, the derived tensor has r factors even when the ambient dimension is larger. A rational residue point over a degree-f extension has finite degree log(q^f)=f log q; passing from the comparison cover to almost-dual auxiliary degree divides by q+1.

### Dependencies

Use `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U4`, `GrossZagierAndArithmeticHeightsPartII:U6`, `PELModuli:M1`, `PELModuli:M3`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.5`, `SchemeKTheoryOperationsPartII:FK.1`, `SchemeKTheoryOperationsPartII:FK.4`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.

## Layer 11: Fat CM and derived Hecke cycles

Define the possibly nonmaximal CM order, twisted fat CM moduli and their derived Hecke realization. Prove finite unramified forgetfulness, properness, good-order étaleness, characteristic-polynomial decomposition and formal orbit uniformization; realize the derived class as a proper one-cycle via its virtual filtration, without asserting actual dimension one.

### 11.1 CM order and fat CM moduli

Construct `cmOrder`. Let alpha∈OF[1/d][T] be monic, integral, self-reciprocal and irreducible over F, and require F′=F[T]/alpha to be CM. Set R_alpha=OF[1/d][T]/alpha, not necessarily maximal. Fat CM_alpha classifies the unitary PEL object with R_alpha-action compatible with Rosati and the alpha-endomorphism’s twisted level condition. It may have positive-dimensional vertical fibres. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §7.4, Definitions 7.5–7.8 pp.910–911.)

The argument is to construct the endomorphism/level moduli functor and impose the order relations without normalizing the order.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `cmOrder.order`: Retain R_alpha and its nonmaximal localizations.
- `cmOrder.moduli`: The endomorphism is Rosati-unitary with the prescribed twisted level.
- `cmOrder.goodOrder`: Étaleness over the base is asserted only off the nonmaximal-order and excluded places.
- `cmOrder.baseChange`: Base change transports the R_alpha action and twisted level, and preserves the characteristic-polynomial condition; it does not enlarge the order to its normalization.

**Checks.**

- When R_alpha,v is a proper suborder of OF′,v, the action required by CM_alpha is only by R_alpha,v; imposing all OF′,v-endomorphisms defines a smaller moduli condition.
- Irreducibility alone does not establish the required CM property; it is a hypothesis.
- A vertical fat fibre need not be zero-dimensional.

*Needs:* Layer 10 `globalCycles`, `PELModuli:M6`.

### 11.2 Fat CM finiteness and properness

Prove `cmProper`. The fat CM forgetful map to the unitary model is finite unramified. The fat CM stack is proper over the arithmetic base; it is finite étale over the base outside the excluded set and Ram(alpha), where the order is maximal. Finiteness over the ambient model does not imply finiteness over the base at bad orders. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Proposition 7.9 pp.911–912.)

The argument is to apply rigidity of endomorphisms, the valuative criterion and the good-order deformation calculation.

*Needs:* Layer 11 `cmOrder`, Layer 10 `globalCycles`.

### 11.3 Hecke fixed loci and characteristic decomposition

Construct `heckeCharacteristic`. For an admissible finite-level Hecke double coset define Hk→M×M with finite correspondence and finite étale projections under the source hypotheses. A fixed point’s endomorphism has an integral self-reciprocal characteristic polynomial independent of ell and locally constant. Its alpha-component is open and closed. Define the derived CM_alpha class as the alpha-component of O_Hk⊗^L O_Δ. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Lemmas 7.10–7.15, §7.5 pp.912–915.)

The argument is to use the trace/Tate polynomial criterion, decompose the fixed locus, and take the supported graph-diagonal tensor.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `heckeCharacteristic.polynomial`: Characteristic polynomial is independent of auxiliary ell.
- `heckeCharacteristic.component`: The fixed alpha component is open and closed.
- `heckeCharacteristic.derived`: Take the derived Hecke/diagonal intersection on that component.
- `heckeCharacteristic.restriction`: The derived Hecke class restricts to each open-and-closed characteristic-polynomial component, compatibly with the permitted finite étale change of level.

**Checks.**

- Changing ell cannot change alpha.
- A different self-reciprocal alpha labels a disjoint component.
- A nontransverse fixed locus retains derived excess terms.

*Needs:* Layer 11 `cmOrder`, Layer 11 `cmProper`, `SchemeKTheoryOperationsPartII:FK.1/supported-cup-product`, `PELModuli:M4`.

### 11.4 Virtual one-cycle from derived CM

Establish `cmVirtualCycle`. The derived CM class lies in filtration F_1 K′_0 of its proper support, hence maps through Gr_1 G_0(Q)≅CH_1(Q) to a proper rational one-cycle. This is virtual dimension one; the naive fat CM support can have larger vertical dimension. Pairing this class with arithmetic divisors uses proper pushforward and the graded projection. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §7.6 pp.915–916; §9.1 pp.924–926.)

The argument is to use the scheme-theoretic dimension filtration on the finite Hecke correspondence over the arithmetic model and its finite-pushforward compatibility, then rational Riemann–Roch. The SF.5 extension request supplies this exact input. The affine formal product theorem and formal-scheme proper pushforward are not citations for it.

*Needs:* Layer 11 `heckeCharacteristic`, Layer 11 `cmProper`, `SchemeAndStackFoundations:SF.5`.

### 11.5 Formal Hecke and CM uniformization

Establish `cmUniformization`. After basic uniformization at a good inert v, the formal Hecke correspondence decomposes over rational delta and away-v cosets with h^(−1)delta h∈KgK. Naive CM gives local fixed schemes N^delta; derived CM gives the graph-diagonal K-class LN^delta. The alpha condition restricts the rational characteristic polynomial in every summand. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §7.7, Proposition 7.16 p.916; §7.8, Proposition 7.17 pp.917–918.)

The argument is to identify the Hecke action on the uniformization quotient and apply graph base change with proper supported projection.

*Needs:* Layer 11 `heckeCharacteristic`, Layer 10 `globalUniformization`, Layer 9 `semilieIntersection`.

### Examples

If the alpha-order is nonmaximal at v, replacing it by the maximal order can remove a vertical fat component and is not an innocent change of notation. A derived CM support can have vertical dimension greater than one while its projected virtual cycle belongs to CH_1. A transverse Hecke fixed point has its ordinary class; a nontransverse point retains Tor, so the naive fixed scheme cannot replace the derived class.

### Dependencies

Use `GrossZagierAndArithmeticHeightsPartII:U10`, `GrossZagierAndArithmeticHeightsPartII:U9`, `PELModuli:M4`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.5`, `SchemeKTheoryOperationsPartII:FK.1`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Nonaffine supported filtration and resolution property.** FK.2 supplies the regular-supported comparison only with resolution property and its product theorem only for affine formal schemes. Prove a version on the actual nonaffine RZ exhaustions, or replace each use by local arguments with descent. Inverse limits of support cokernels cannot be replaced by the cokernel of inverse limits without a separate exactness proof. U2/U9’s higher local constancy route deliberately avoids the global product assumption.

## Layer 12: Modular divisors, Green functions and AFL pairings

Construct Chow and arithmetic-divisor series with their nonzero and automorphic-line constant terms, complex orbit formulas and Green metrics. Prove the source-scoped modularity and Green comparison over Q, pair with the proper derived CM one-cycle, and derive finite inert and archimedean orbit formulas with the correct factor two and normalization.

### 12.1 Chow-valued unitary divisor series

Construct `chowSeries`. On the generic-fiber canonical unitary model over E, let omega be the unitary automorphic line of Z §8.1. Its comparison with PEL Hodge eigenspaces and its Petersson metric are requested; it is not identified with the determinant Hodge line supplied by PELModuli:M6/hodge-line-bundle. Put Z_0(phi)=−phi(0)c1(omega) and Z_xi(phi) equal to the positive-norm KR divisor class for totally positive xi. Define the parallel weight-n Chow-valued series with its adelic archimedean Whittaker factor. Its coefficients use the same level and Hom convention as U10. Modularity of this generic-fiber series does not assert integral Chow modularity. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §8.1 (8.1)–(8.3), Theorem 8.1, pp.918–919.)

The argument is to use the generic-fiber special divisors, construct and descend the specified automorphic line through the requested PEL comparison, then apply the source-scoped unitary Chow modularity input. The determinant Hodge line is not substituted for this line.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `chowSeries.positive`: Positive coefficients are KR divisor classes.
- `chowSeries.constant`: The zero coefficient is −phi(0)c1(omega).
- `chowSeries.adelic`: The q-series and adelic series differ by the specified weight-n Whittaker factor.
- `chowSeries.linearity`: Every Fourier coefficient and the whole Chow-valued series depend Q-linearly on the rational Schwartz input at the fixed level.

**Checks.**

- If phi(0)=0 the automorphic-line constant term vanishes.
- For nonzero phi(0), omitting the constant term changes the modular series.
- On the generic fiber only totally positive nonzero xi contribute KR divisors; at xi=0 the coefficient is the automorphic-line Chern class instead.

*Needs:* Layer 10 `globalCycles`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.5`, `MetaplecticAutomorphicForms:MP.2`.

### 12.2 Complex uniformization and CM fixed point

Establish `complexOrbits`. At each complex embedding of the reflex field, use the nearby hermitian space of signature (n−1,1) and its negative-line domain D. The KR divisor is the weighted rational orbit sum of hyperplanes z⊥u with the finite level cosets. For irreducible CM alpha, the CM element delta fixes a unique negative line z_delta; a cyclic nonzero u cannot be orthogonal to that line. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §8.2, Proposition 8.2 pp.919–921; §10.1, Theorem 10.1 pp.929–930.)

The argument is to use the canonical-model complex uniformization and decompose the CM field action into eigenspaces; irreducibility gives the cyclic-vector exclusion.

*Needs:* Layer 10 `globalCycles`, Layer 11 `cmOrder`, `PELModuli:M3/complex-points`.

### 12.3 Kudla Green function and metric convention

Define `kudlaGreen`. For a>0, a negative line z outside D(u) and nonzero u, let R(u,z) be the norm of its negative projection, so R≤0. With the repaired additive-character scaling use G_K(u,a,z)=−Ei(4πaR(u,z)); at u=0 set G_K(0,a)=−log|a|. The divisor current equation is stated with dd^c=−(2πi)^(-1)∂∂bar, after the matching rescaling of the Kudla–Millson form. The function extends as a Green current across D(u). In the orthogonal convention of MZ, the corresponding nonnegative projection function is −2R(u,z), since the real pairing is the trace of the hermitian pairing. The Petersson automorphic-line metric and the archimedean Whittaker factor must use the same scaling. ([MZ](https://ems.press/content/serial-article-files/31452) §6.6, (6.6) and footnote 4 p.37; §7.2, Proposition 7.4 and footnote 5 p.48; compare Z §8.3 (8.9)–(8.12) pp.921–922; [Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §8.3 pp.921–922, with MZ correction.)

The argument is to rescale Zhang’s 2π convention as in MZ before pairing with the repaired Gaussian orbital integral. Request the exact metric/Schwartz form comparison.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `kudlaGreen.projection`: R is nonpositive, and vanishes precisely on the hyperplane incidence.
- `kudlaGreen.singularity`: G_K has the required logarithmic Green singularity.
- `kudlaGreen.zero`: The zero-vector convention is −log|a|.
- `kudlaGreen.currentEquation`: With the same rescaled Kudla–Millson form, dd^c[G_K(u,a)]+δ_D(u)=[omega_KM(u,a)]; this is a current identity across the divisor for u≠0.

**Checks.**

- Off the divisor, R<0 and Ei is evaluated at a negative real argument.
- At u=0 and a=e, the assigned Green value is −1, rather than a divergent Ei(0).
- Replacing 4π by 2π without changing the Gaussian breaks the archimedean comparison.

*Needs:* Layer 12 `complexOrbits`, `ArakelovGeometryAndAbelianHeights:R35.1/arithmetic-divisors-green`, `MetaplecticAutomorphicForms:MP.2`.

### 12.4 Arithmetic divisor series and Green correction

Construct `arithmeticSeries`. Let G_B be the source regularized-theta Green function and define the arithmetic class Zhat_B(xi,phi)=(Z_xi(phi),G_B) for xi>0 and Zhat_B(0,phi)=−phi(0)chat1(omega,Pet). Principal arithmetic divisors are (div f,−log|f|²). Define the correction series from G_K−G_B with the same weight-n Whittaker coefficients, in the reduced arithmetic Chow group over OE[1/d]. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §8.3 (8.14), §8.4 (8.15)–(8.17), pp.922–924.)

The argument is to import regularized-theta Green functions and arithmetic-divisor equivalence; pin the zero coefficient and metric comparison.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `arithmeticSeries.positive`: Attach the regularized-theta Green function to each KR divisor.
- `arithmeticSeries.zero`: The zero coefficient is the metrized automorphic-line Chern class with a minus sign.
- `arithmeticSeries.correction`: The Kudla version differs by the G_K−G_B series.
- `arithmeticSeries.principal`: Changing an arithmetic-divisor representative by (div f,−log|f|²) preserves its reduced arithmetic Chow class and every proper-cycle pairing.

**Checks.**

- A principal class with −log|f|² vanishes.
- Using −log|f| instead gives the wrong arithmetic relation.
- Changing the metric changes the zero coefficient and the correction together.

*Needs:* Layer 12 `chowSeries`, Layer 12 `kudlaGreen`, `ArakelovGeometryAndAbelianHeights:R35.1/arithmetic-divisors-green`.

### 12.5 Scoped divisor and Green modularity

Prove `modularity`. The Chow series has parallel weight n under the source’s general totally real assumptions. For F0=Q, the arithmetic G_B series is holomorphic of weight n at a level supported in the excluded primes, and the G_K−G_B series is a weight-n modular function in the source’s moderate/exponential-growth space. No arithmetic modularity over arbitrary F0 is inferred from this theorem. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Theorems 8.1,8.4,8.6, pp.919,922,924.)

The argument is to use the precise Borcherds/regularized-theta modularity theorems. Those auxiliary proof leaves must be read and decomposed before closure.

*Needs:* Layer 12 `arithmeticSeries`, Layer 12 `chowSeries`, `MetaplecticAutomorphicForms:MP.2`.

### 12.6 Normalized CM intersection series

Define `cmPairing`. Pair arithmetic divisors with the proper virtual CM one-cycle in R_S=R/span_Q{log p:p lies below an excluded place}. Define Int(h,Phi)=(Zhat_B(h,phi),LCM(alpha,phi0))/(tau(Z^Q)[E:F]). Add the similarly normalized G_K−G_B pairing to obtain Int_K. For vertical curves the pairing is degree O(D) times log residue size; complex contributions use half the sum over embeddings. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §9.1 (9.1)–(9.8), pp.924–926; §10 (10.9)–(10.10) pp.931–932.)

The argument is to apply the imported arithmetic-divisor/proper-one-cycle pairing, then the torus and reflex normalization.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `cmPairing.quotient`: The value is taken modulo the Q-span of excluded prime logarithms.
- `cmPairing.normalization`: The denominator is tau(Z^Q)[E:F], not [E:F0].
- `cmPairing.proper`: The CM class used for pairing is a proper one-cycle.
- `cmPairing.bilinear`: The divisor/one-cycle pairing is Q-bilinear and factors through arithmetic rational equivalence and the stated quotient of R by excluded prime logarithms.

**Checks.**

- A vertical component contributes its line-bundle degree times log q.
- A principal arithmetic divisor pairs to zero in R_S.
- Replacing [E:F] by [E:F0] changes the degree by a factor two.

*Needs:* Layer 11 `cmVirtualCycle`, Layer 12 `arithmeticSeries`, `ArakelovGeometryAndAbelianHeights:R35.1/arithmetic-degree-pairing`.

### 12.7 CM intersection modularity

Prove `pairingModular`. For F0=Q, Int(h,Phi) is a holomorphic weight-n modular form valued in R_S, and Int_(K−B) is modular in the corresponding growth space. Their coefficient functions are well-defined because the CM class is proper. The nilpotent/constant coefficient remains part of the generating series even when the local comparison is extracted at xi≠0. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §9.1 after (9.8), pp.925–926; Corollary 10.4 p.932.)

The argument is to pair the coefficient-valued modularity statements with the fixed proper one-cycle.

*Needs:* Layer 12 `cmPairing`, Layer 12 `modularity`.

### 12.8 Finite local CM–KR orbit formula

Prove `finiteOrbits`. For xi≠0, the CM and KR supports do not meet generically; at a good split place their intersection is empty, and at a good inert place it is basic. Under the chosen Haar normalization, Int_v(xi,Phi)=2log q_v Σ_(delta,u) Int_v(delta,u) Orb((delta,u),Phi^v), for the rational nearby-unitary orbits with characteristic alpha and norm xi. Bad places are not declared zero. The factor two comes from the unramified extension residue degree after reflex normalization. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §§9.2–9.4, Theorem 9.4 and (9.11), pp.926–928.)

The argument is to use the cyclic/irreducible CM condition to exclude generic intersection; at inert places apply formal uniformization and the derived projection formula.

**Check.** A split good place gives zero, but the same conclusion is not asserted at an excluded place.

*Needs:* Layer 11 `cmUniformization`, Layer 12 `cmPairing`, Layer 9 `semilieIntersection`.

### 12.9 Refined CM invariant and archimedean orbit formula

Establish `archimedeanOrbits`. The CM field action makes the nearby space a rank-one F′/F′0-hermitian space with trace form the original pairing. Set xi′=q′(u), Tr_(F′0/F0)xi′=xi. Exactly one archimedean place v′ has negative xi′, and R(u,z_delta)=v′(xi′). The repaired archimedean intersection is the orbit sum of −Ei(−4πa|xi′|_(v′)) times the away-archimedean orbital factor, with coefficients divided by their weight-n Whittaker factor. ([MZ](https://ems.press/content/serial-article-files/31452) §§6.6,7.2,8.5, pp.37,48,56–57; Z §10.2 and Corollary 10.3 pp.930–932; [Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §10.2 and Corollary 10.3 pp.930–932.)

The argument is to refine the trace form to F′0, evaluate at the unique negative fixed line and use MZ’s rescaling. Do not mix the 2π and 4π formulas.

*Needs:* Layer 12 `complexOrbits`, Layer 12 `kudlaGreen`, Layer 12 `cmPairing`.

### Examples

At phi(0)=0 the automorphic-line constant coefficient vanishes; otherwise its negative sign is required. A principal divisor pairs to zero only with the −log|f|² Green relation. A good inert residue extension has degree two, giving the factor 2 log q_v in the orbit formula; a good split place contributes zero under the stated irreducible CM assumptions. At infinity 4π and 2π require different Gaussian scalings.

### Dependencies

Use `ArakelovGeometryAndAbelianHeights:R35.1`, `GrossZagierAndArithmeticHeightsPartII:U10`, `GrossZagierAndArithmeticHeightsPartII:U11`, `GrossZagierAndArithmeticHeightsPartII:U9`, `MetaplecticAutomorphicForms:MP.2`, `PELModuli:M3`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.5`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Arithmetic Chow/Green foundations and modularity leaves.** Read the Gillet–Soulé/Gillet arithmetic-current/DM theory used for products and the regularized-theta/Borcherds/Green-comparison modularity theorems. R35.1’s inspected divisor and one-cycle nodes are enough for their pairing but not for higher star products or general DM arithmetic Chow products. Arithmetic modularity in the AFL proof is restricted to F0=Q. The generic-fiber Chow constant term uses the unitary automorphic line, not an unproved identification with the determinant Hodge line; the precise PEL eigenspace/descent and Petersson-metric comparison is an additional requested leaf.

## Layer 13: Arithmetic Siegel–Weil identities

Specialize the unitary Siegel section and incoherent Diff-set factorization, state source-admissible global model conditions, and prove semi-global and global coefficient identities. Construct Green star products and arithmetic degrees with the half-archimedean normalization. State the unramified full formula and the modified ramified formula with its inherited Krämer proof obligation.

### 13.1 Unitary Siegel Eisenstein specialization

Construct `siegelSeries`. For split skew-hermitian W of dimension 2n over F/F0, P its Siegel parabolic and a Hecke character chi of F with chi restricted to A_F0^× equal to eta_(F/F0)^n, map phi∈S(V^n) to its standard section f_phi(g,s) in normalized induction I(s,chi)=Ind_P^U(chi|det|_F^s), equivalently unnormalized induction with exponent s+n/2. Define E(g,s,phi)=Σ_(P(F0)∖U(W)(F0))f_phi(gamma g,s), initially in the convergence chamber and by continuation. E_T is its unipotent Fourier coefficient with self-dual measures; E′ is d/ds at zero. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§12.1–12.2 pp.77–79.)

The argument is to use generic normalized induction and continuation, then specialize the Weil section and Fourier integral without dropping modulus characters.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `siegelSeries.section`: The standard section uses the fixed splitting character and Schwartz input.
- `siegelSeries.fourier`: T-coefficients integrate against the fixed additive character.
- `siegelSeries.factorization`: Nonsingular coefficients factor into local Whittaker integrals in the admitted region and continuation.
- `siegelSeries.equivariance`: For p in the Siegel parabolic, the section satisfies f_s(pg)=chi(det a(p))|det a(p)|_F^(s+n/2) f_s(g), with normalized induction and the same splitting character.

**Checks.**

- A pure tensor section has the product local nonsingular coefficient.
- Changing additive character rescales the local Haar/Whittaker comparison.
- A singular T cannot be assigned the nonsingular product formula without a separate theorem.

*Needs:* `AutomorphicSpectralTheory:AS.1/induced-family`, `AutomorphicSpectralTheory:AS.1/eisenstein-series`, `AutomorphicSpectralTheory:AS.2/eisenstein-continuation`, `MetaplecticAutomorphicForms:MP.3`.

### 13.2 Incoherent Diff set and coefficient derivative

Define `incoherence`. Take V positive definite at every archimedean place with prescribed finite local hermitian spaces, and assume its invariants are incoherent. For nonsingular T define Diff(T,V)={v:V_v does not represent T}. E(g,0,phi)=0. A derivative coefficient with nonzero contribution has a unique obstructing nonsplit place, where the Whittaker derivative is taken, and ordinary factors elsewhere. A test function nonsingular at two split places kills all singular T contributions. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§12.3–12.4, (12.3.0.2), (12.4.0.2)–(12.4.0.3), pp.79–81.)

The argument is to apply the local functional equations and global sign product, then the support condition for the two nonsingular local inputs.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `incoherence.diff`: Diff records failure to represent, not the ramified places alone.
- `incoherence.derivative`: The unique obstructing local factor is differentiated.
- `incoherence.singular`: Two nonsingular split supports remove singular global coefficients.
- `incoherence.localIsometry`: Replacing each local hermitian space by a specified isometric one preserves Diff and the ordinary/derivative factor assignment.

**Checks.**

- Diff with more than one forced zero factor gives zero first derivative.
- A single archimedean obstruction is allowed.
- A nonsplit finite obstruction need not be a ramified prime.

*Needs:* Layer 13 `siegelSeries`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2/integral-hermitian-lattice`.

### 13.3 Admissible RSZ global models

Define `modelAdmissibility`. Fix the global PEL datum and lattice Λ. Require: dyadic places unramified in F; inert split local spaces with self-dual Λ and its stabilizer, and at a ramified base prime the CM type descends from the maximal unramified subfield; inert nonsplit local spaces with v/Q_p unramified, almost self-dual Λ and its stabilizer; ramified quadratic places with v/Q_p unramified and Λ unimodular; split places with self-dual Λ, maximal level for m_v=0, and principal congruence level for m_v>0 with CM-type matching and unramified reflex/local-reflex extension. Impose H1 CM-torus moduli, H2 exact polarization-kernel size, H3 sign/Eisenstein conditions and H4 rank n−1 Krämer filtration. Normalize higher split levels in the generic cover. The resulting model is regular and semistable in the source’s range. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) §10.2 (G0)–(G5),(H1)–(H4), author pp.77–79.)

The argument is to this is a source-specific input datum and model interface. General representability, semistability and uniformization require the explicit PEL Part II extension; they do not follow from the good-prime PEL deformation node.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `modelAdmissibility.local`: Record the appropriate lattice and level at every place.
- `modelAdmissibility.reflex`: Positive split level includes CM matching and the unramified local-reflex extension.
- `modelAdmissibility.model`: The model carries the actual universal abelian objects and Lie filtration.
- `modelAdmissibility.witnesses`: An admissibility witness exports its local lattice, stabilizer and CM/reflex compatibility at each place; equality of a generic model alone is not such a witness.

**Checks.**

- At an inert nonsplit place, a self-dual lattice is not substituted for the prescribed almost-dual one.
- A ramified quadratic place over a ramified base prime fails the stated unramified-base condition.
- Unramified dyadic allowance here is weaker than the split-dyadic hypothesis of the full generating-series theorem.

*Needs:* `PELModuli:M6`, `PELModuli:M4`, Layer 10 `globalCycles`.

### 13.4 Coherent theta integral comparison input

Establish `siegelWeilInput`. For the nearby coherent unitary space in the nonsingular Fourier calculation, the regularized/convergent theta integral equals the source normalized Siegel Eisenstein value in the range used in LZ §13.6. Its local density factors and global measure must give c_K=(−1)^n vol(K), independent of T and phi. Generic Eisenstein continuation alone does not imply this theta-integral identity. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 13.6.1 proof pp.83–84, citing Ichino §6; Theorem 15.3.1 proof p.88.)

The argument is to read Ichino’s precise range, convergence/regularization and measure comparison; this is a recorded external proof-leaf gap.

*Needs:* Layer 13 `siegelSeries`, `MetaplecticAutomorphicForms:MP.3`, `AutomorphicSpectralTheory:AS.2`.

### 13.5 Semi-global and inert global identities

Prove `semiglobal`. At an admissible inert v0 with p>2 and positive definite integral nonsingular T, Int_(T,v0)(phi)q^T=c_K E′_(T,v0)(z,phi), c_K=(−1)^n vol(K). At almost self-dual level use the auxiliary degree convention of U10. For inert-admissible phi and nonsingular T with Diff a singleton inert nondyadic place, summing the local formula gives Int_T(phi)q^T=c_K E′_T(z,phi). ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 13.6.1 pp.83–84; Theorem 14.5.1 and Corollary 14.5.2 p.86.)

The argument is to uniformize, substitute the local KR identity, evaluate the remaining point count by the coherent theta integral and compare product factors.

*Needs:* Layer 10 `localDegree`, Layer 10 `globalUniformization`, Layer 3 `differenceInduction`, Layer 4 `auxiliaryFormula`, Layer 13 `incoherence`, Layer 13 `siegelWeilInput`.

### 13.6 Green star products and arithmetic degrees

Construct `greenStarDegree`. For nonsingular tuple x=(x1,…,xm), take the iterated star product of its divisor Green currents: [g(x)]*[g(y)]=[g(x)]δ_D(y)+[omega(x)]g(y). It satisfies dd^c g(x)+δ_D(x)=omega(x1)∧…∧omega(xm), with compatible current conventions. Define Int_(T,phi)=one half the complex integral at each CM-type embedding, and deghat_T=Int_T+Σ_phi Int_(T,phi). In a proper hyperspecial model, these nonsingular terms agree with the Gillet–Soulé arithmetic product degree; no such identification is assumed for auxiliary almost-dual cycles. ([LZ](https://arxiv.org/pdf/1908.01701v3) §§15.2–15.4 pp.87–89.)

The argument is to request arithmetic Chow products for regular DM models and Green currents; use the exact local-current equation and conjugate-embedding normalization. Convert the repaired AFL 4π convention back to the ASW source’s 2π convention before comparison.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `greenStarDegree.star`: The current product has the stated divisor/current terms.
- `greenStarDegree.archimedean`: Use one half at each CM-type complex integral.
- `greenStarDegree.arithmetic`: Hyperspecial proper arithmetic products recover the nonsingular deghat_T.
- `greenStarDegree.equivalence`: The admitted current-equivalence relation makes the proper hyperspecial arithmetic degree independent of Green representatives; arbitrary products of currents outside the admitted wavefront/regularity range are not asserted.

**Checks.**

- A conjugate pair of embeddings contributes exactly one full integral after the half factors.
- A contained divisor uses the current/product theory, not an undefined ordinary intersection of supports.
- In the rank-one almost-dual example a=2, auxiliary Int=(q+2)/(q+1) differs from the naive Y-intersection 1, so their arithmetic degrees cannot be identified without correction.

*Needs:* Layer 10 `localDegree`, Layer 12 `kudlaGreen`, `ArakelovGeometryAndAbelianHeights:R35.1`, `SchemeAndStackFoundations:SF.5`.

### 13.7 Archimedean arithmetic Siegel–Weil coefficient

Prove `archimedeanAsw`. For nonsingular T, K-invariant phi and each CM-type embedding, Int_(T,phi)(y,phi_K)q^T=c_K E′_(T,phi)(z,phi_K), with the same c_K as the finite formula. The source’s Kudla Green/Whittaker scaling and the half-complex integral must be fixed together; the archimedean local identity is an independently requested analytical input. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 15.3.1 p.88.)

The argument is to apply the archimedean local Whittaker/Green integral identity of Liu/Garcia–Sankaran, unfold and compare the finite normalization.

*Needs:* Layer 13 `greenStarDegree`, Layer 13 `siegelWeilInput`, Layer 13 `incoherence`.

### 13.8 Unramified arithmetic Siegel–Weil formula

Prove `unramifiedAsw`. Under the admissible global model hypotheses, if F/F0 is unramified at every finite place and split above two, phi is inert-admissible and nonsingular at two split places, then Σ_(det T≠0)deghat_T(y,phi)q^T=c_K E′(z,phi). This unramified CM extension forces F0≠Q and properness in this setup. The two nonsingular supports remove singular Fourier terms. ([LZ](https://arxiv.org/pdf/1908.01701v3) Theorem 15.5.1 and Remarks 15.5.2–15.5.3 p.89.)

The argument is to for each nonsingular T use its unique obstructing place and the appropriate finite or archimedean coefficient identity.

*Needs:* Layer 13 `semiglobal`, Layer 13 `archimedeanAsw`, Layer 13 `modelAdmissibility`, Layer 13 `incoherence`.

### 13.9 Modified ramified Eisenstein derivative

Define `modifiedEisenstein`. At ramified v add Σ_j c_(2j) times the normalized coherent Eisenstein series for the dual vertex lattice Λ_(2j)^sharp, with the local volume factor vol(K_G,v)/vol(K_(Λ_(2j)^sharp)) and log q_v. At an almost-dual inert v add c0 E_v^coh with c0=−1/(q_v+1) and log(q_v²). Define ∂Eis=Eis′+(−1)^nΣ_v correction_v. The exact local sections are those paired with U8/modified-density; they are not arbitrary coherent test functions. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) (1.7)–(1.11), author pp.4–6.)

The argument is to transport the ramified and original-Y correction terms through the normalized local Whittaker identities.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `modifiedEisenstein.ramified`: Use the same c_(2j) as in the corrected local density.
- `modifiedEisenstein.almostdual`: The almost-dual coefficient is −1/(q+1), with log q².
- `modifiedEisenstein.sign`: The total derivative has the outside factor (−1)^n on the sum of coherent corrections.
- `modifiedEisenstein.linearity`: The modified series is linear in the factorizable test data and compatible local coherent replacements, with the fixed lattice-volume ratios and correction coefficients.

**Checks.**

- A place with no local correction contributes zero to the correction sum.
- An almost-dual correction has a negative coefficient.
- Replacing log q² by log q changes the correction by a factor two.

*Needs:* Layer 8 `modifiedDensity`, Layer 4 `originalFormula`, Layer 13 `siegelSeries`, Layer 13 `modelAdmissibility`.

### 13.10 Modified arithmetic Siegel–Weil target

Prove `ramifiedAsw`. On the admissible Krämer/RSZ model, for nonsingular T with Diff(T,V)={v}, v nonsplit and nondyadic, and admissible phi, deghat_T q^T=c_K∂Eis_T. If additionally every dyadic place splits and phi is nonsingular at two split places, then deghat(z,phi)=c_K∂Eis(z,phi). Finite ramified coefficients inherit the isolated odd-top proof gap in U8; the almost-dual comparison is supplied by LRZ through U4. ([K](https://www.math.columbia.edu/~chaoli/Kramer.pdf) Theorems 10.1–10.2, author pp.79–80.)

The argument is to apply the appropriate local identity at the unique Diff place and sum coefficients. This target is not marked closed while the Krämer induction repair and auxiliary measure inputs remain open.

*Needs:* Layer 8 `kramerMain`, Layer 4 `originalFormula`, Layer 13 `modifiedEisenstein`, Layer 13 `archimedeanAsw`, Layer 10 `localDegree`.

### Examples

If Diff(T,V)={v0} is inert and nondyadic, exactly the v0 Whittaker factor is differentiated. If the unique obstructing place is archimedean, the half-complex Green integral supplies that coefficient. At an almost-dual inert place c0=−1/(q+1), and replacing log(q²) by log q changes the correction by two. A Schwartz function nonsingular at two split places removes singular Fourier coefficients from the total formula.

### Dependencies

Use `ArakelovGeometryAndAbelianHeights:R35.1`, `AutomorphicSpectralTheory:AS.1`, `AutomorphicSpectralTheory:AS.2`, `GeometryOfNumbersAndQuadraticArithmetic:GN.2`, `GrossZagierAndArithmeticHeightsPartII:U10`, `GrossZagierAndArithmeticHeightsPartII:U12`, `GrossZagierAndArithmeticHeightsPartII:U3`, `GrossZagierAndArithmeticHeightsPartII:U4`, `GrossZagierAndArithmeticHeightsPartII:U8`, `MetaplecticAutomorphicForms:MP.3`, `PELModuli:M4`, `PELModuli:M6`, `SchemeAndStackFoundations:SF.5`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **RZ/RSZ models and canonical lifts.** The proposed UnitaryRapoportZinkSpacesAndRSZModels supplier is not a registered roadmap. PELModuli M6 and its good-prime deformation node do not give these ramified formal moduli spaces. The precise M6 extension request above must be accepted and source-checked, including canonical lift, Cartier Hom obstruction, regular difference divisors, Wu/Vollaard–Wedhorn stratifications and uniformization. Do not substitute an arbitrary proposition or structure for the moduli functor. The special-cycle dimension theorem (codimension two for independent labels) is part of this extension. The current R07.2/CR.7 delegation loop does not yet supply Grothendieck–Messing; the CR.7 request records the precise evaluation, nilpotent-PD hypotheses and covariant conversion needed here.
- **Krämer isolated odd-top induction repair.** Lemma 9.6 of the author copy has the explicit split-plane valuation counterexample in U8/kramer-main. A separate identity for this case or another well-founded invariant must close Theorem 9.7; excluding that lattice would change the theorem. The false negative-normal-norm vanishing from Theorem 8.2 is not used.
- **Arithmetic Chow/Green foundations and modularity leaves.** Read the Gillet–Soulé/Gillet arithmetic-current/DM theory used for products and the regularized-theta/Borcherds/Green-comparison modularity theorems. R35.1’s inspected divisor and one-cycle nodes are enough for their pairing but not for higher star products or general DM arithmetic Chow products. Arithmetic modularity in the AFL proof is restricted to F0=Q. The generic-fiber Chow constant term uses the unitary automorphic line, not an unproved identification with the determinant Hodge line; the precise PEL eigenspace/descent and Petersson-metric comparison is an additional requested leaf.
- **Siegel–Weil and archimedean normalization leaves.** Read Ichino §6 and the Liu/Garcia–Sankaran archimedean coefficient theorem with their range, regularization, measures, splitting characters and current convention. Derive c_K and the factor one half at infinity, rather than choosing an unspecified measure to fit the answer. Separate AFL’s repaired 4π scaling from LZ’s ASW 2π scaling. Check explicitly the Li–Liu versus Li–Zhang Whittaker parameter conversion: LL1 uses log q for q the underlying base residue size, whereas LZ uses log(q²).

## Layer 14: Global comparison and strongly regular AFL

Consume source-scoped Jacquet–Rallis transfer, Gaussian and fundamental-lemma inputs; define the corrected holomorphic derivative and compare it with the modular CM series over Q. Separate local logarithms, isolate a strongly regular orbit and perform the final induction for the published Q_p range. Record the q=n Cayley boundary proof obligation and retain arbitrary regular semisimple AFL only as a conjecture.

### 14.1 Relative trace and Gaussian inputs

Establish `relativeAnalyticInput`. For fixed irreducible CM alpha, import the Jacquet–Rallis relative orbital series J(h,Phi′,s), its entire continuation, nonzero-norm Fourier orbit expansion and derivative decomposition ∂J=∂Orb_nil+Σ_v∂J_v. Partial transfer at fixed alpha commutes with the SL2 Weil action. At infinity use the corrected partial Gaussians of MZ; for xi<0 their derivative is one half the weight-one Whittaker factor times Ei(−4πa|xi|). Nonsingular local characteristic functions match by the Jacquet–Rallis fundamental lemma, independently sourced at the q=rank boundary. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) §§11.3–12.7, (12.32)–(12.38), Theorem 12.14 pp.938–953; Appendix A Theorem A.1 pp.969–972; MZ Proposition 7.4 p.48; [MZ](https://ems.press/content/serial-article-files/31452) §3.6 fn3 p.18; Proposition 7.4 and fn5 p.48; §8.5 pp.56–57.)

The argument is to request exact relative-series convergence, transfer and FL proof leaves. Include regular nilpotent orbits in the constant term. The ordinary endoscopic comparison is insufficient.

*Needs:* Layer 9 `analyticAflInterface`, `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

### 14.2 Corrected holomorphic derivative

Define `holomorphicDerivative`. For F0=Q define ∂J_hol=2∂J+Int_(K−B), and Eflat=∂J_hol+Int_B=2∂J+Int_K. Both use the same fixed alpha, matching rational finite test data and repaired Gaussian normalization. The printed second factor two in front of ∂J_hol in §14.3 is removed. Constant and nilpotent terms are retained. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Proposition 14.5 pp.963–965; §14.3 p.965 and proof of Theorem 14.6 p.966, corrected.)

The argument is to cancel the archimedean exponential-integral terms and logarithmic constants using the nilpotent transfer identity.

Expose the following operations and identities so consumers can use the object without unfolding its construction:

- `holomorphicDerivative.holomorphic`: ∂J_hol has the coefficient two on ∂J.
- `holomorphicDerivative.comparison`: Eflat has coefficient one on ∂J_hol.
- `holomorphicDerivative.archimedean`: Int_K,arch=−2∂J_arch with the repaired Whittaker scaling.
- `holomorphicDerivative.expansion`: Substituting the definitions gives Eflat=2∂J+Int_K coefficientwise, including the constant and nilpotent terms.

**Checks.**

- Expanding Eflat gives exactly 2∂J+Int_K.
- Doubling ∂J_hol would give 4∂J and fail the finite local identity.
- The nilpotent logarithm must cancel the zero-vector Green logarithm.

*Needs:* Layer 12 `pairingModular`, Layer 12 `archimedeanOrbits`, Layer 14 `relativeAnalyticInput`.

### 14.3 Fourier vanishing criterion

Prove `fourierVanishing`. Let B be a finite set of finite places of F0 and let phi be continuous, left SL2(F0)-invariant and right K-invariant, with K_v=m(varpi_v^c_v)^(-1)SL2(OF0,v)m(varpi_v^c_v) for v∈B, where m(t)=diag(t,1) belongs to GL2 and conjugates SL2, and c_v is the largest integer for which psi_v is trivial on varpi_v^(−c_v)OF0,v. If all nonzero Fourier coefficients with v(xi)=0 for every v∈B vanish identically at infinity, phi is constant. If its nonzero parallel weight is n, phi=0. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Lemma 13.6 pp.956–957.)

The argument is to induct on B by a unipotent finite difference, use the conductor-adjusted level to enlarge invariance, then strong approximation. Request the strong-approximation input with its exact SL2 scope.

*Needs:* `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`.

### 14.4 Conditional global arithmetic comparison

Prove `globalComparison`. For F0=Q, S containing all model/level and small-residue primes, matching rational finite test data and the prescribed Gaussians, assume group AFL for S_m at all p∉S. Then Eflat=0. To use the printed maximal-order input in semi-Lie dimension m, enlarge B by the finitely many inert p∉S with p≤m+1 as well as nonmaximal-order places. At these extra places use the norm-unit reduction, whose proof requires no residue bound. Then each good v and xi≠0 satisfies −2∂J_v(xi)=Int_v(xi) in Q log p_v. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Theorem 14.6 pp.966–967, with maximal-order-bound repair.)

The argument is to show coefficients with (xi,B)=1 vanish by maximal-order or norm-unit AFL; apply modular vanishing. Separate the finite sum by Q-linear independence of distinct prime logarithms in R_S.

*Needs:* Layer 14 `holomorphicDerivative`, Layer 14 `fourierVanishing`, Layer 9 `maximalOrder`, Layer 9 `aflRankReduction`, Layer 12 `finiteOrbits`.

### 14.5 Orbitwise semi-Lie AFL from global comparison

Prove `orbitIsolation`. At a good inert v, for a strongly regular global pair (delta,u) with characteristic alpha and q(u)≠0, the conditional global comparison gives −∂Orb((gamma,u′),1_integral)=Int_v(delta,u)log q_v for its matching linear pair. Choose the away-v matching functions to isolate the prescribed quotient neighbourhood and give a nonzero common orbital factor; cancel it only after proving nonvanishing. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Corollary 14.8 pp.967–968; orbit isolation Lemma 13.7 and Proposition 13.8 pp.957–958.)

The argument is to use compactness modulo conjugation, local constancy and a nonnegative away-v orbital test function.

*Needs:* Layer 14 `globalComparison`, Layer 9 `aflLocalConstancy`, Layer 12 `finiteOrbits`.

### 14.6 Strongly regular AFL target over Q_p

Prove `strongAfl`. Target of Zhang Theorem 15.1: for F0=Q_p, p odd and p≥n, Conjecture 3.8(a) holds for matching strongly regular elements of S_n and U(V_n), and 3.8(b) holds for matching strongly regular pairs on S_(n−1)×V′_(n−1) and U(V_(n−1))×V_(n−1). In each case ∂Orb=−Int log p with the transfer factor included. The n=1 semi-Lie base input, maximal-order calculation, generic relative inputs and the q=n reverse Cayley reduction must be supplied. The straightforward source proof covers the reverse reduction with q≥n+1; p=n remains an explicit proof obligation here. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Theorem 15.1 and proof pp.968–969; Conjecture 3.8 pp.883–884.)

The argument is to induct using the group/semi-Lie reduction. Globalize the local CM order over an imaginary quadratic field, arrange det(1−g) a unit and nonzero norm, approximate by a rational pair and use local constancy. Close the boundary scalar-avoidance gap or cite an independently read theorem covering it.

*Needs:* Layer 14 `orbitIsolation`, Layer 9 `aflRankReduction`, Layer 9 `aflLocalConstancy`, Layer 9 `maximalOrder`, Layer 0 `rankOne`.

### 14.7 General regular-semisimple AFL boundary

Record `generalAflConjecture`. Record Conjecture 3.2 for arbitrary relative regular semisimple group and semi-Lie data over an odd-residue-characteristic unramified quadratic local extension: the same derivative equals −Int log q. It is a conjectural target in the source; neither strong regularity nor the Q_p and residue-size hypotheses of Theorem 15.1 may be removed by citing that theorem. This roadmap provides no proof in the larger range. ([Z](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf) Conjecture 3.2 pp.882–883; contrast Theorem 15.1 p.968.)

The argument is to export the conjecture as a documented boundary with no unconditional implementation claim.

**Check.** A relative regular but non-semisimple group element remains outside the proved strongly regular target.

*Needs:* Layer 9 `groupIntersection`, Layer 9 `semilieIntersection`, Layer 9 `analyticAflInterface`.

### Examples

Expanding the corrected holomorphic series gives Eflat=(2∂J+Int_(K−B))+Int_B=2∂J+Int_K. A second coefficient two would instead give 4∂J and fail the finite AFL sign. Enlarging B by finitely many small inert primes preserves the vanishing criterion; at coefficients unit at those primes use norm-unit reduction. Distinct prime logarithms remain Q-linearly independent, so the finite local terms can then be separated.

### Dependencies

Use `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `GrossZagierAndArithmeticHeightsPartII:U0`, `GrossZagierAndArithmeticHeightsPartII:U12`, `GrossZagierAndArithmeticHeightsPartII:U9`, `MetaplecticAutomorphicForms:MP.0`, `MetaplecticAutomorphicForms:MP.2`, `MetaplecticAutomorphicForms:MP.3`. Each named supplier is used with the exact scope fixed above.

The following proof inputs must be established to obtain the full assertions of this layer:

- **Jacquet–Rallis relative comparison supplier.** The proposed JacquetRallisRelativeTraceComparison supplier is not registered, and ET ordinary endoscopy does not cover it. The exact ET.0 extension request must receive an accepted owner and source decomposition, including the independent FL at q=rank, nilpotent transfer and SL2 strong approximation used by Lemma 13.6.
- **AFL maximal-order and base-case source leaves.** Read Mihatsch’s maximal-order Corollary 9.9 with the artinian/FL hypotheses rather than weakening Proposition 3.9’s printed bound. Read or compute the semi-Lie dimension-one base in Zhang [46] with transfer and Haar factors. The local KR rank-one length alone does not compute the orbital integral.
- **Boundary q=rank in the reverse Cayley argument.** At q=n, avoiding the n eigenvalue residues can exhaust all but the additional forbidden residue d^(-1). The group-to-semi-Lie direction survives; the reverse needs an additional argument or independently read theorem. Preserve the published p≥n final target, but mark this step open instead of silently strengthening it to p>n.
- **General-field and nonstrong AFL boundary.** Conjecture 3.2 is documented, not proved by Theorem 15.1. This run uses the selected MZ passages only for normalization; it does not claim the stronger general-field results of that paper or remove strong regularity.

## Representative normalization signatures

Suggested.lean uses the existing rational-polynomial carrier for two exact normalization calculations. It does not model an RZ space, arithmetic Chow group or orbital integral. The signatures `rankOneDensity` and `densityDerivative` name P_a(X)=Σ_(i=0)^a(−X)^i and the linear functional P↦−P′(1). The first exposes `rankOneDensity_zero`, `rankOneDensity_succ` and `rankOneDensity_eval_neg_one`; the second exposes `densityDerivative_C`, `densityDerivative_add` and `densityDerivative_X_pow` for constants, addition and monomials. Checks use a=0,1,3, the zero derivative of a constant, and the negative derivative of X². The milestone `rankOne_odd_derivative` gives b+1 for a=2b+1, exactly the local rank-one value.

The finite sum `exoticRankTwoCount` is the rational polynomial in q displayed in Layer 5, with geometric interpretation only for 0≤b1≤b2 and odd residue size q. Its API is `exoticRankTwoCount_zero_left`, `exoticRankTwoCount_one_one` and `exoticRankTwoCount_at_zero`, giving b1=0, (b1,b2)=(1,1) and evaluation at q=0; the last is an algebraic specialization, not a residue field. Checks give 2,4,12 at q=3 for the three rank-two cases above. The milestone `exoticRankTwoCount_at_one` at q=1 is another polynomial specialization, 2(b1+1)(b2+1), outside the geometric range. Every heavyweight definition and theorem remains an authoritative target in this reader and is named in the closing comment of Suggested.lean.

## Downstream consumers

The separate unitary arithmetic inner product continuation consumes the global r-tuple classes and local identities in Layers 3–6 and 8–10. It must retain its own automorphic representation hypotheses, restricted height domain and doubling normalization; those are not consequences of a local KR identity. Arithmetic Chow extensions feed the higher-star-product ASW branch, while the AFL branch needs only the stated divisor/proper-one-cycle pairing plus modularity and relative transfer. No higher-Green CM-value or GSpin height theorem follows from the unitary divisor formulas.

The current local source obligations include resolving the CR.7/R07.2 Grothendieck–Messing delegation and the quasi-canonical owner’s missing rank-two intersection-length extension, as well as the specific type-²A/type-²D Frobenius calculations, the ramified density extension and Krämer type-zero infinitesimal criterion. The Krämer odd-top induction and reverse Cayley q=n boundary require separate arguments. Global closure also needs the source-exact arithmetic-current/modularity, coherent theta-integral, archimedean coefficient and Jacquet–Rallis inputs, together with the base and maximal-order AFL cases. The prescribed final targets retain their published ranges; these proof obligations are not silently removed or replaced by stronger hypotheses.

## Source correction boundaries

The packet records 24 source findings with independent verdicts. Proposition 2.44 of Li–Liu II already has the correct inner summation limit; the alleged statement misprint is rejected (E5), while an undefined index in its proof is recorded separately (E24). A sufficient extra hypothesis in Zhang’s norm-unit reduction is not a source error (E19); the bound-free strengthening follows from its proof. The type-zero weight discrepancy in Li–Zhang is harmless on the nonsplit full-rank lattices but is recorded for the canonical weight API (E23). The remaining entries distinguish corrected misprints, repaired arguments, acknowledged conditional inputs and unresolved proof obligations. The author-copy findings make no claim about uncollated publisher versions.

## References

All locators above refer to the following exact copies, read on 19 October 2026. Li–Zhang and Li–Rapoport–Zhang use preprint pagination; Zhang uses published pagination; Li–Liu I/II and Krämer use the specified author-copy pagination. The latter are not collated page-for-page with their publishers. Source correction records in the packet distinguish misprints, corrected arguments and proof obligations; they are expressed in our own words.

- **LZ.** Chao Li and Wei Zhang, [Kudla–Rapoport cycles and derivatives of local densities](https://arxiv.org/pdf/1908.01701v3). arXiv:1908.01701v3, 2 December 2020; journal JAMS 35 (2022), 705–797. Used: Conventions and §§1–8; selected counting arguments in §7.4; §§9.1–9.2, 10–15.

- **Z.** Wei Zhang, [Weil representation and Arithmetic Fundamental Lemma](https://archive.ymsc.tsinghua.edu.cn/pacm_download/21/12000-annals.2021.193.3.5.pdf). Annals of Mathematics 193 (2021), 863–978, DOI 10.4007/annals.2021.193.3.5. Used: §§2.3, 3–5, 7–10, 14–15, Appendix A; §§11–13: analytical input statements and vanishing criterion; proof leaves requested from the relative trace comparison owner.

- **LL1.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, I](https://www.math.columbia.edu/~chaoli/AIPF.pdf). Author final, 20 October 2021; Annals 194 (2021), 817–901. Used: Lemma 5.2, Definition 5.3 and Lemma 5.4, pp.26–27; §§8–9 local cycle/K-class construction and the local identity interfaces, pp.37–45; Notation 2.1(F1),(F4), p.10: underlying-place residue sizes and local b factors.

- **LL2.** Chao Li and Yifeng Liu, [Chow groups and L-derivatives of automorphic motives for unitary groups, II](https://www.math.columbia.edu/~chaoli/AIPF2.pdf). Author copy, 16 January 2022, 72 pages; Forum Math. Pi 10 (2022), e5 has different pagination. Used: §2.1–2.7, including proofs of lattice parametrization and induction; §2.8, Corollaries 2.65–2.66.

- **K.** Qiao He, Chao Li, Yousheng Shi and Tonghai Yang, [A proof of Kudla–Rapoport conjecture for Krämer models](https://www.math.columbia.edu/~chaoli/Kramer.pdf). Author final, 21 July 2023, 82 pages; Inventiones 234 (2023), 721–817, publisher copy not collated. Used: §§1–4 including all of §3; §7.1 primitive formulas; §§8–10 including §9 induction; §§5–7 remaining density combinatorics are supplier inputs, not independently verified proofs.

- **LRZ.** Chao Li, Michael Rapoport and Wei Zhang, [Quasi-canonical AFL and arithmetic transfer conjectures at parahoric levels](https://arxiv.org/pdf/2404.02214v2). arXiv:2404.02214v2, May 2026. Used: §§14.1–14.6, pp.55–61; §§16.1–16.5, pp.65–71.

- **MZ.** Andreas Mihatsch and Wei Zhang, [On the Arithmetic Fundamental Lemma conjecture over a general p-adic field](https://ems.press/content/serial-article-files/31452). Journal of the European Mathematical Society, DOI 10.4171/JEMS/1375. Used: §3.6 footnote 3, p.18; §6.6 footnote 4, p.37; §7.2 Proposition 7.4 and footnote 5, p.48; §8.5, pp.56–57, normalized Fourier coefficients.
