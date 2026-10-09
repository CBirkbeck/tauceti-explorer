# Independent review: Abelian Schemes And Arithmetic Moduli

Job **REV-AbelianSchemesAndArithmeticModuli**, issue **#340**. Reviewer **Codex — codex-Tr1NVt**, 2026-10-09. Verdict: **accepted** after in-place corrections.

This is an independent session from blueprint author Codex codex-TgpAme and inherited checkpoint author Claude cc-fb70e5. Acceptance concerns a finished target-level plan. It does not certify implementations, discharge omitted signatures or close the recorded proof obligations. All seven stages remain **planned**, none **closed**, and all implementation statuses remain **unchecked**.

## Counts and scope

| Item | Before | After |
| --- | ---: | ---: |
| Target nodes | 88 | 89 |
| Definitions / constructions | 9 / 15 | 9 / 16 |
| Theorems / lemmas / comparisons | 53 / 2 / 9 | 53 / 2 / 9 |
| Definition/construction API items | 109 | 121 |
| Definition/construction diagnostic tests | 87 | 97 |
| Planets | 27 | 27 |
| Confirmed pinned baseline declarations | 11 | 18 |
| Sources | 24 | 26 |
| Explicit proof/source gaps | 11 | 15 |
| Supplier requests | 17 | 17 |
| Independently confirmed source findings | 0 | 8 |

All 89 nodes have an individual verdict: **53 verified**, **35 corrected**, **1 added**, **0 unverifiable**. Each of the 25 definitions/constructions has at least three diagnostic tests. Planet counts for A0–A6 are 0, 3, 5, 4, 4, 5, 6, respectively; their names denote mathematical constructions or theorems. No proof is split into routine lemma nodes.

## Corrections with mathematical consequences

The canonical de Rham pairing is between the cohomology of A and its dual. A polarization induces a perfect self-pairing when its degree is invertible; a principal polarization is a sufficient case. Multiplication by p composed with a principal polarization in characteristic p supplies a diagnostic counterexample. The general Grothendieck–Messing condition is compatibility with the dual filtration; the Lagrangian self-pairing formulation is restricted to the principal case.

The new A4 **universal vector extension** target states the vector-group convention, kernel, universal pushout property, naturality and degree-one comparison. For V(F)=Spec Sym(F∨), its kernel is V(ω of the dual abelian scheme). Invariant differentials on the extension identify with H¹ de Rham of A; the Lie module identifies with the dual of that cohomology. Maculan, author v2 §2.7, Definition 2.19, Theorem 2.20 and Corollary 2.21, pp.12–13, and Illusie §4.2(iv), pp.16–17, locate the comparison. The delegated universal-property proof remains **G-vector-extension**. Five API operations and four tests distinguish the duality, zero-dimensional, elliptic and universal-pushout conventions.

The all-degree coherent/de Rham statement remains at its declared arbitrary-base scope. Anschütz–Le Bras, Proposition 4.5.1, p.53, has a bounded-prism and p-adic-completion setting; that inspected proposition alone does not prove the general target. **G-exterior** records the additional proof. Milne 2022, Theorem 15.1, Lemma 15.2 and Remark 15.4, pp.27–28, supply the separately stated prime-to-characteristic integral and mod-ell étale exterior algebra, including the characteristic-two square issue. **G-etale-exterior** records its general étale/Hopf inputs. Rosati positivity now cites that relevant exterior input.

Principalization is spread from a finite field extension which can be inseparable; an étale cover requires separately justified separable descent. The exact maximal-isotropic theta splitting and prescribed-line descent remain **G-theta-principal**. The odd-prime surface lift is a compatible principally quasi-polarized truncated-BT deformation problem, underlying finite-flat order p⁴, with **G-odd-level**; it is not a statement about every finite-flat group killed by p. Genus-two lift uniqueness is an equivalence of marked deformation functors and uniqueness up to compatible isomorphism.

Geometric Picard number is the rational dimension of geometric NS. Its API/tests distinguish dimension zero (0), an elliptic curve (1), and the square of a characteristic-zero non-CM elliptic curve (3). Ground-field line classes and geometric NS remain different objects. The advertised finite generation and rank bound are explicit outputs of A6. The native real Riemann-form signature now assumes finite dimension; positive scaling, integral pairing and a nonprincipal doubled-form test detect missing conditions.

The general integral Hodge structure, polarization, dual and weight-one Riemann criterion are imported from the inspected native library. Nondegenerate integral polarization does not imply unimodularity. For the homological weight −1 convention used here, C=−J and the native integral form is Q=−E; the geometric dual/sign comparison is additional work. Likewise the native real Lie exponential and its local-diffeomorphism theorem are imports. The complex geometric analytification and holomorphic adapter remain A5 targets.

The characteristic-polynomial integrality route uses finite integral End and the determinant trick, followed by the Tate eigenvalue comparison; mere integer-valuedness is insufficient. Rosati positivity has no artificial odd-characteristic exclusion. Its intersection formula is stated for positive dimension and integral endomorphisms before clearing rational denominators. The field image required for projector constructions and curve-generated subvarieties is an explicit **G-abelian-image**, rather than an unproved import. A point on the normalization above the marked curve point is chosen.

## Sources and locator checks

I inspected the source segments recorded in the packet, retaining restrictions when a public text delegates a proof. The maintainer-cleared Faltings–Chai volume was read in place; no file or extract from it was retained. Uncleared books cited by the inspected public papers were not opened. Statements, source findings and this report use original mathematical formulations. Author-copy pagination and published pagination are distinguished in the source records.

Corrected locators include Faltings–Chai I.1.3 p.1 (cube), I.1.9 pp.5–7 (Raynaud), I.1.10(a) p.7 (projectivity), I.3 pp.14–15 (PD), and the I.5 introduction p.25 (theta group); Milne, Abelian Varieties, Proposition 14.4 p.62 and Lemma 14.5 p.63; Milne 2022 Corollary 12.8 p.22; and Conrad Remark 2.4 p.7 and the Pic⁰ kernel discussion p.8. Fresh public versions are recorded for Kisin17 author pp.69–70, Pilloni20 author pp.38–40, FKW24 v2 pp.17–18 and 24, Charles16 published p.516, and ABS26 published pp.1131 and 1137–1138. Maculan and Illusie are new sources; Milne 2022's read extent now includes the étale exterior proof. The packet preserves source URLs, editions, read extents and the relevant version fingerprints.

All six inherited source findings have an individual confirmed verdict and reason. The characteristic-two automorphism counterexample is explicit, and the compactness, commuting-nilpotence, degree-bound, finite-dimensional norm and anti-involution corrections retain their mathematical conditions. Two new confirmed findings concern BCGP25 v1 Lemma 9.3.4 p.200 (finite-flat order p⁴ in place of the erroneous size) and Lemma 10.3.1 p.215 (the dyadic conclusion refers to 2-torsion, order 16). These are findings in the inspected version, not a claim about later editions or a separately executed errata job.

## Baseline and upstream boundaries

Every baseline citation was opened at Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** or Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369**, including its surrounding variables. The original eleven citations are retained with independent statement confirmation; seven existing native imports are added. No baseline citation was removed.

| Confirmed declaration | Scope relevant to this plan |
| --- | --- |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny` | A homomorphism of abelian varieties over a field is an isogeny when its scheme morphism is finite and surjective. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.mulBy` | The endomorphism [n] of an abelian variety, the n-th power for the group law. |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.End` | The endomorphism ring End A = Additive (A ⟶ A) of an abelian variety over a field, with its Ring instance. |
| `mathlib:Polynomial.funext` | Over an infinite domain, polynomials with the same values everywhere are equal: uniqueness of P_α. |
| `mathlib:instModuleFinite_of_discrete_submodule` | A discrete ℤ-submodule of a finite-dimensional real normed space is a finite ℤ-module: the lattice step for End(A). |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety.prod` | The product of two abelian varieties over a field, with its projections and binary-product structure. |
| `mathlib:isSemisimpleRing_iff_pi_matrix_divisionRing` | Artin–Wedderburn: a ring is semisimple iff it is a finite product of matrix rings over division rings. |
| `tauceti:TauCeti.FiniteLocallyFreeCommAffineGroupSchemeCat.cartierDualBaseChangeIso` | For finite locally free commutative affine groups, identifies base change of the native Cartier dual with the Cartier dual of base change. Its two objects expose the same native cartierDual operation in FiniteLocallyFree.lean. |
| `mathlib:DividedPowers` | Divided-power data on an ideal, with the factorial, sum, scalar, product and iteration laws; PD-nilpotence is extra. |
| `mathlib:IsZLattice` | For a discrete integral submodule of a normed K-space, full span over K; use K=R for the underlying real complex space. |
| `tauceti:TauCeti.AlmostComplexStructure.hodgeStructure` | The native complex structure supplies effective weight-one HodgeStructureOn on the complexification; homological weight −1 is its dual. |
| `tauceti:TauCeti.Hodge.HodgeStructure` | The integral-lattice specialization of HodgeStructureOn with conjugation from an IsBaseChange complexification; weight is an integer parameter. Finite lattice and geometric realization are additional conditions. |
| `tauceti:TauCeti.Hodge.IsPolarization` | Integral bilinear form satisfying weight symmetry, nondegeneracy, Hodge orthogonality and Hodge–Riemann positivity on a native integral Hodge structure. Nondegeneracy is not integral unimodularity. |
| `tauceti:TauCeti.Hodge.Polarization` | Bundles the integral form and IsPolarization proof on the existing HodgeStructure; a principal abelian polarization adds lattice unimodularity. |
| `tauceti:TauCeti.Hodge.HodgeStructureOn.dual` | Dual Hodge structure on the complex linear dual, of weight −n, with filtration the annihilator of F(1−p). The integral geometric realization and polarization sign comparison are additional work. |
| `tauceti:TauCeti.Hodge.isPolarization_of_weilOperator_invariant_on_realPoints_of_pos` | For an effective weight-one native integral Hodge structure, a nondegenerate antisymmetric integral form invariant under the Weil operator and positive on (C x,x) for nonzero real x is a native IsPolarization. Effectivity and nondegeneracy are genuine hypotheses. |
| `tauceti:lieExp` | Canonical exponential of a finite-dimensional smooth real Lie group, with its existing manifold, boundaryless and Hausdorff hypotheses; its domain is left-invariant derivations. |
| `tauceti:isLocalDiffeomorphAt_lieExp_zero` | For a finite-dimensional smooth boundaryless Hausdorff real Lie group, the native exponential is a smooth local diffeomorphism at zero. This does not itself construct an abelian analytification or its holomorphic comparison. |

The library audit and current read-only upstream interfaces were checked. Current TauCetiRoadmap main was **cc01c9d0680a0d02a83b04cae85bff9a7f0eb98e** and current Tau Ceti was **a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039**. JacobianChallenge D/E and ModularCurves 0B/1C/1D/2D contracts were checked against their actual statements. Requests now distinguish exact field, relative elliptic, finite-flat quotient/Cartier and differential/pairing interfaces. Current AlgebraicVectorBundles L0B/L0C/L2A/L2B supplies finite locally free sheaves, duals, arbitrary pullback, exterior powers, determinants and vector-group total spaces. Since that roadmap is absent from the atlas snapshot, it is recorded explicitly in `upstreamImports` and the reader, rather than as a fabricated pinned declaration. IntegralLattices supplies general lattice operations; A2 retains the alternating geometric polarization adapter.

The inspected native Cartier base-change theorem is over affine bases; arbitrary-base gluing is a supplier contract. The inspected discrete-submodule finiteness theorem needs finite real dimension, whereas IsZLattice alone does not supply it. The Hodge Riemann criterion needs effective weight one, nondegeneracy, invariance and positivity. Each near-miss is handled by the additional geometric hypotheses/adapter, rather than by weakening the existing theorem.

## Confirmed red-team inputs

| Finding | Review disposition |
| --- | --- |
| RT-AREA-arithmeticgeometry-1/1 | Every-degree A4 coherent/de Rham targets are explicit; G-exterior records the actual general-base gap. The integral/mod-ell étale exterior target is also explicit. Planning coverage is not claimed proof closure. |
| RT-AREA-algebraicgeometry/8 | Geometric NS, Picard number, rational symmetric Hom, rank/finite generation and diagnostic examples are explicit. The advertised consumer can import these interfaces; general SF.3 and unrelated consumer edits are outside this job. |
| RT-AREA-algebraicgeometry/27 | Existing native Hodge structures, polarizations, duals and the weight-one criterion are cited directly. A5 plans the abelian geometric comparison and sign/duality adapter. Global stage-edge changes for the other named roadmaps are outside the authorized files. |

## Closure, tests and suggested file

Every node's direct dependencies, proof route and source scope were inspected, including the referenced supplier statements. The checker finds no unresolved references or cycles. The stages are honestly planned: source delegations and nonroutine missing inputs are explicitly listed in the fifteen gaps. None is falsely closed. Supplier requests are specific contracts rather than requests for an entire theory.

The packet, reader and exact named omission manifest agree on all 89 targets, 121 API items and 97 tests. Native coefficient identity/composition/coefficient-change, scalar-two inverse, square-zero inverse and the positive-dimensional zero nonunit tests were added or checked. Native Riemann-form hypotheses, scaling and homological sign have elaborating signatures/tests. Unavailable relative/PD/analytic carriers have named mathematical omission records, not arbitrary proposition placeholders. Such records do not elaborate and are not certified by compilation.

Validation: `python3 scripts/check_blueprint.py research/blueprint/packets/AbelianSchemesAndArithmeticModuli.json --index <pinned declaration index>` reports **0 errors, 0 warnings**. `lean-check research/blueprint/suggested/AbelianSchemesAndArithmeticModuli.lean` exits **0**, with only **declaration uses sorry** warnings. The bodies remain prototypes. Synchronization, source-finding verdicts, review coverage and `git diff --check` were also checked. No broader build or library update was run.

## Node-by-node verdicts

Each entry below corresponds exactly to the packet's `review.checked` record. Its mathematical statement and precise source locator remain in the synchronized packet and reader.

| Target | Verdict | Check or correction |
| --- | --- | --- |
| `A6/degree-of-an-endomorphism` | verified | Degree is finite locally free rank for an isogeny and zero otherwise, with equal dimensions and the zero-dimensional identity convention preserved. |
| `A6/degree-is-a-polynomial-function` | verified | Cube/intersection arguments give the homogeneous degree polynomial on the rational endomorphism space; the integer and rational extensions are distinguished. |
| `A6/characteristic-polynomial-of-an-endomorphism` | corrected | Removed stale missing-Hom/integrality conditions. Finite integral End and the determinant trick, followed by the Tate eigenvalue comparison, justify integral coefficients; integer-valuedness alone does not. |
| `A6/endomorphisms-of-simple-abelian-varieties` | corrected | A nonzero endomorphism of a simple field abelian variety is an isogeny and hence invertible after rationalization. Replaced the false field-anchor image attribution by the direct G-abelian-image obligation. |
| `A6/poincare-complete-reducibility` | corrected | The image of an integral multiple of the rational projector must be an abelian subvariety over the original field. Recorded G-abelian-image rather than attributing that missing image theorem to JacobianChallenge. |
| `A6/hom-to-tate-module-homs-is-injective` | verified | Prime-to-characteristic torsion density detects a morphism; this is injectivity, not the Tate surjectivity theorem over an arbitrary field. |
| `A6/hom-is-free-of-finite-rank` | verified | The finite-subspace degree-polynomial/discrete-lattice route uses the inspected finite-dimensional real baseline. Saturation and Tate divisibility give the rank bound before assuming global finite dimension, so the proof does not depend circularly on Rosati or integral characteristic polynomials. |
| `A6/endomorphism-algebra-is-semisimple` | verified | Complete reducibility and division endomorphism algebras give finite matrix factors, using the inspected Artin–Wedderburn theorem rather than planning it again. |
| `A6/polynomials-determined-by-l-adic-values` | verified | Polynomial uniqueness uses infinitely many values over an infinite domain; the native Polynomial.funext statement was checked. |
| `A6/multiplicative-polynomial-functions` | verified | Multiplicativity and homogeneity give the field norm exponent after separable splitting; the source's geometric multiplicity is retained. |
| `A6/characteristic-polynomial-on-tate-module` | verified | The degree polynomial is the integral prime-to-characteristic Tate determinant, with its normalization and independence of the auxiliary prime. |
| `A6/trace-and-degree-on-a-subfield` | verified | Field trace/norm occur with exponent 2g divided by the field degree; this avoids treating reduced trace as geometric trace. |
| `A6/degree-formulas-for-polarized-isogenies` | corrected | Corrected Milne's locator to Proposition 14.4 and Lemma 14.5, pp.62–63. Pullback polarization degree includes the square of the isogeny degree, including inseparable degree. |
| `A6/rosati-positivity` | corrected | Removed the artificial odd-characteristic restriction. The intersection formula is for integral endomorphisms in positive dimension; rational denominators are then cleared and dimension zero is vacuous. Added the integral/mod-ell étale exterior input and its gap. |
| `A6/automorphisms-of-polarized-abelian-varieties` | corrected | The rational Rosati positivity proof works in characteristic two as well. Integral units preserving the polarization form a discrete bounded set, not the entire real compact isometry group. |
| `A2/rosati-involution` | corrected | The rational inverse of a nonprincipal polarization is legitimate. Removed the stale unread-positivity condition and retained the anti-involution, pullback and principal/nonprincipal conventions. |
| `A6/weil-restriction-functor` | verified | The functor uses the universal Weil restriction with its adjunction and base-change API; existence is a separate target. |
| `A6/weil-restriction-of-quasi-projective-schemes` | verified | Quasi-projectivity is the stated representability hypothesis, not existence for every scheme and extension. |
| `A6/weil-restriction-over-a-separable-extension-splits` | verified | The product decomposition is after a splitting extension and requires separability; inseparable extensions are excluded. |
| `A6/finite-etale-weil-restriction-of-abelian-schemes` | verified | Finite étale base change ensures the split product argument transports properness, smoothness and geometrically connected fibres. It does not assert arbitrary finite-flat Weil restriction is abelian. |
| `A6/tate-module-of-a-weil-restriction` | verified | The finite-index induced Tate representation is the geometric adapter owned here; the general representation/induction interface stays with its supplier. |
| `A0/field-and-elliptic-boundary` | verified | Checked the exact JacobianChallenge E and ModularCurves field/elliptic imports. The node compares carriers and does not re-plan field abelian varieties or elliptic schemes. |
| `A1/relative-products-and-dimension` | verified | Relative products preserve the abelian-scheme conditions and add locally constant fibre dimensions; the existing field product is an import. |
| `A1/relative-rigidity-comparison` | verified | The relative rigidity statement retains its base and properness hypotheses and the supplier's theorem, rather than using field rigidity without a base argument. |
| `A1/relative-invariant-forms` | verified | Invariant differentials are the pullback of the identity cotangent bundle, with arbitrary base change. General finite locally free bundle operations come from current AlgebraicVectorBundles. |
| `A1/relative-seesaw` | verified | Fibrewise triviality plus rigidification is used to recover a line from the base; the relative hypotheses remain attached to the supplier. |
| `A1/relative-cube-and-power` | corrected | Corrected the cube locator to Faltings–Chai I.1.3, p.1. The symmetric rigidified line's n-squared pullback and its nonsymmetric variant remain distinct. |
| `A1/torsion-restriction-of-rigidified-lines` | verified | The restriction statement retains its torsion, rigidification and multiplication hypotheses; it is not a claim that every line is canonically trivial on torsion. |
| `A2/raynaud-scheme-representability` | corrected | Corrected Faltings–Chai I.1.9 to pp.5–7. The normal-base scheme representability and polarization/projectivity inputs are separately stated. |
| `A2/normalized-poincare-comparison` | verified | Poincaré rigidifications on both axes fix the normalization, and biduality/base change use the relative Picard supplier with G-picard-dual recorded. |
| `A2/mumford-map-and-biextension` | verified | The line-to-dual morphism and its biextension comparison retain the normalization and additivity; the graph pullback has the reviewed factor two. |
| `A2/polarization-representatives-and-graph` | corrected | Corrected Conrad Remark 2.4 to p.7. Étale-local line representatives and the global polarization morphism are distinguished; graph pullback produces the doubled morphism. |
| `A2/ample-cohomology-and-degree` | verified | The ample vanishing/Euler characteristic and degree-square relationship preserve the hypotheses on the line and fibres, with nonprincipal polarizations allowed. |
| `A2/projective-presentation-over-normal-bases` | corrected | Corrected Faltings–Chai I.1.10(a) to p.7. Normal-base ample extension/projective-normality remain the precise G-projective-normality obligation, not a global arbitrary-base assertion. |
| `A2/nef-normalized-lines-over-curves` | verified | Nefness is for the normalized line in the stated curve-family setting; the paper's admissible base and positivity conditions are retained. |
| `A2/abelian-neron-severi` | corrected | Added the geometric Picard number, with zero, elliptic and characteristic-zero non-CM elliptic-square tests. Geometric NS is distinguished from the rational group of line classes defined over the ground field; corrected the kernel locator to Conrad p.8. |
| `A2/polarization-type-and-pfaffian` | verified | Alternating elementary divisors and the Pfaffian encode polarization type and degree. The geometric adapter does not duplicate IntegralLattices' general lattice/Smith framework. |
| `A2/principal-quotient-and-spreading` | corrected | A field model may require a finite inseparable extension; an étale cover is justified only by separable descent data. Recorded G-theta-principal for the exact theta splitting and prescribed-line descent. |
| `A2/divisor-ample-criterion` | verified | The divisor stabilizer/positivity criterion remains on abelian varieties with its stated effective-divisor and nondegeneracy assumptions. |
| `A3/relative-isogeny` | verified | Finite locally free surjective relative homomorphisms, rank/degree, base change and kernel APIs are separate from the native field IsIsogeny; the tests distinguish étale and inseparable examples. |
| `A3/nonaffine-abelian-quotient` | corrected | Uses the precise ModularCurves finite-flat quotient/descent interfaces rather than an affine Cartier theorem as a nonaffine quotient. Field and family comparisons keep the scheme-theoretic kernel. |
| `A3/multiplication-and-density` | verified | Multiplication has rank n^(2g), including p-primary finite-flat torsion; only prime-to-characteristic torsion is used in the density proof. |
| `A3/dual-isogeny-and-cartier-kernel` | corrected | Corrected the Milne degree locator and checked the native Cartier base-change isomorphism's affine scope. Arbitrary-base finite-flat gluing is a supplier contract. |
| `A3/polarized-weil-pairing` | verified | The pairing retains the finite-flat formulation at bad primes and the polarization-dependent perfectness hypothesis, instead of silently using only geometric torsion points. |
| `A3/torsion-divisibility` | verified | Kernel containment is scheme theoretic, so all-prime divisibility is geometric and does not depend upward on an integral Dieudonné classification. |
| `A3/theta-group` | corrected | Corrected the Faltings–Chai locator to the I.5 introduction, p.25. The central extension, commutator, isotropic splitting and line descent remain distinct API operations. |
| `A3/genus-two-two-torsion` | verified | The genus-two two-torsion description preserves the marked curve and characteristic hypotheses; dyadic lifting is a separate later target. |
| `A4/etale-tate-module` | verified | The compatible prime-to-characteristic inverse limit, rank 2g and base-change/local-system maps are owned here; homological covariance is retained. |
| `A4/abelian-h1-de-rham` | corrected | Canonical A/A-dual de Rham duality is perfect. A polarization induces a perfect self-pairing when its degree is invertible; multiplication by p in characteristic p is the counter-test. Added the universal vector extension dependency. |
| `A4/all-degree-exterior-cohomology` | corrected | Retained every-degree coherent/de Rham targets over the declared base. Anschütz–Le Bras Proposition 4.5.1 is restricted to bounded prisms and p-adic completion and cannot close G-exterior. Added integral and mod-ell étale exterior statements with G-etale-exterior. |
| `A4/p-divisible-group` | verified | A compatible finite-flat BT tower of arbitrary height is the minimal definition moved down to A4. General integral classification and slope theory stay with their higher owners. |
| `A4/pd-first-cohomology` | corrected | Corrected Faltings–Chai I.3 to pp.14–15 and separated native DividedPowers from extra nilpotence. Added the universal vector extension dependency; the exact degree-one PD comparison remains G-pd. |
| `A4/grothendieck-messing` | corrected | For nonprincipal polarizations retain a morphism compatible with the dual filtration. A perfect symplectic self-pairing and Lagrangian formulation require the principal case; G-pd records the lifting proof. |
| `A4/serre-tate-equivalence` | verified | The nilpotent deformation equivalence compares the abelian scheme and its BT tower with markings and polarization compatibility. It does not define an abelian deformation as an arbitrary finite-flat group. |
| `A4/ordinary-serre-tate-coordinates` | verified | The character/étale pairing gives ordinary coordinates with functoriality and polarized symmetry; p-rank-one surfaces are outside the ordinary coordinate chart. |
| `A4/ordinary-frobenius-and-weighted-polarization` | corrected | Corrected the inherited nilpotence/source status wording. The Frobenius lift and weighted pairing retain ordinary and polarization hypotheses, with no extension to the nonordinary locus. |
| `A4/polarized-effectivity` | corrected | Distinguished the principal perfect pairing from general polarization preservation. The polarization is the effectivity input, and the request to SchemeAndStackFoundations remains genuinely higher dimensional. |
| `A4/odd-prime-finite-level-lifting` | corrected | Narrowed the carrier to the compatible principally quasi-polarized truncated-BT deformation problem, underlying order p^4. An arbitrary finite-flat group killed by p is insufficient; G-odd-level records the missing criterion/lift. |
| `A4/ordinary-dyadic-finite-level-lifting` | verified | The order-16 principally quasi-polarized ordinary 2-torsion lift retains ordinary hypotheses and G-dyadic. It does not cover every dyadic surface. |
| `A4/genus-two-jacobian-lifting` | corrected | Uniqueness is for marked deformation functors up to compatible isomorphism, not literal equality of curves. The chosen special-fibre Jacobian identification is part of the data. |
| `A5/complex-lattice-realization` | corrected | Added inspected native real lieExp and its local-diffeomorphism theorem as imports. The geometric real/complex Lie adapter, holomorphicity, cocompact lattice and algebraic/analytic Hom comparison remain this target's work. |
| `A5/riemann-form` | corrected | Made finite real dimension explicit; imported existing Hodge carriers. Added integral pairing, positive scaling, extensionality and a nonprincipal doubling test. Under the homological convention C=-J and native Q=-E; integral nondegeneracy is weaker than unimodularity. |
| `A5/appell-humbert-and-algebraicity` | verified | The Hermitian/semicharacter data and positivity condition give the line bundle and algebraicity comparison; G-appell honestly retains the theta-separation proof. |
| `A5/polarized-hodge-equivalence` | corrected | Imported native integral HodgeStructure, IsPolarization, Polarization, HodgeStructureOn.dual and the effective weight-one Riemann criterion. The geometric lattice/duality/sign and morphism comparisons are adapters, not new general Hodge theory. |
| `A5/analytic-families-and-comparison` | verified | The relative period/lattice comparison retains its family and descent hypotheses and G-family; a pointwise Appell–Humbert theorem does not establish the family equivalence. |
| `A5/siegel-analytic-family` | verified | The framed Siegel family, deck action and level-frame conjugation are explicit; quotient and algebraic comparison remain on their actual analytic/moduli suppliers. |
| `A4/realization-conventions` | corrected | Made the homological weight -1, cohomological dual weight +1, native Weil operator and polarization sign explicit. Frobenius and covariant/contravariant conventions are not silently identified. |
| `A2/rational-ns-and-ample-cone` | corrected | Distinguished geometric NS from ground-field line descent and recorded the correct Pic0 kernel discussion on Conrad p.8. Rosati-symmetric Hom and the positive cone retain rational normalization. |
| `A6/neron-severi-rank` | corrected | Added explicit geometric Picard-number output, finite generation/rank bound dependency and corrected Milne 2022 Corollary 12.8 to p.22. This is the advertised A2-to-consumer rank interface. |
| `A6/reduced-trace-comparison` | verified | Geometric trace includes simple-factor multiplicity; the source's reduced trace is not substituted without its comparison factor. |
| `A6/polarization-orbits` | verified | Polarizations are acted on by integral automorphisms through Rosati conjugation; the positive real cone is not the same orbit problem as integral units or CM units. |
| `A6/coefficient-hom-and-units` | corrected | Added the identity API and actual coefficient identity/composition/base-change/scalar-unit tests. Coefficient extension stays distinct from geometric base change, and the unit functor works for nonfield coefficient algebras. |
| `A6/coefficient-isom-torsors` | verified | The affine Hom/unit functors and their isomorphism torsor preserve the coefficient algebra and source/target data; no rational point is inferred from torsor existence. |
| `A6/real-isometries-and-polarized-torsors` | verified | The real positive-involution isometry comparison retains the two polarization forms and distinguishes real triviality from rational or integral triviality. |
| `A6/frobenius-semisimplicity` | verified | The finite-field Frobenius semisimplicity statement uses the field, polarization and prime-to-characteristic Tate realization, not a general arbitrary-base Frobenius. |
| `A6/relative-hom-and-normal-extension` | verified | Finite unramified relative Hom and normal-base extension retain their hypotheses; G-normal-extension records the higher-dimensional extension proof rather than importing the elliptic statement as sufficient. |
| `A6/hom-descent-at-full-level` | corrected | Corrected the inspected Pilloni author-copy locator to pp.38–40. The full-level/Galois hypotheses used in Hom descent remain in the statement. |
| `A6/localized-isogeny-category` | verified | Localization records the allowed primes and actual invertible isogenies, retaining category composition and realization compatibility; it is not indiscriminate rationalization. |
| `A6/abelian-torsor-twist` | verified | The tensor/localized twist and its descent use the actual group action; G-twist retains representability and projective descent rather than assuming a rationally defined twist is an abelian scheme. |
| `A6/twist-realizations-polarizations-and-level` | corrected | Corrected the fresh Kisin author-copy locator to pp.69–70. Pairing and level changes retain frame conjugation and the localized twist conditions. |
| `A6/weak-localized-polarization` | verified | The symmetric localized morphism, positivity and allowed denominator condition are genuine data; an arbitrary rational isomorphism is not a weak polarization. |
| `A6/quadratic-twists-and-restriction` | verified | The quadratic character, twist and separable restriction comparison retain their field and localization conditions, with the zero-character and split-extension tests distinguishing the construction. |
| `A6/curve-generated-subvariety` | corrected | Choose a point on the normalization above the marked curve point. The image-generated subgroup must descend over the original field, with G-abelian-image retained; the general Albanese construction remains imported. |
| `A6/morikawa-endomorphism` | verified | The curve/divisor construction uses its normalization and cycle/intersection inputs, with composition and base-change APIs and tests that distinguish the curve class and zero input. |
| `A6/cm-isotypic-boundary` | verified | The CM/isotypic conclusion retains the marked Hodge-factor hypotheses and G-cm; it is not a blanket consequence of every polarized Hodge structure. |
| `A6/hodge-determinant-and-moduli-export` | verified | The Hodge determinant uses current AlgebraicVectorBundles dual/determinant/pullback operations and the declared moduli suppliers; it does not introduce another general determinant line. |
| `A0/relative-moduli-imports` | corrected | Replaced generic field/elliptic supplier wording with exact JacobianChallenge D/E and ModularCurves 0B/1C/1D/2D contracts; current AlgebraicVectorBundles is an explicit upstream import absent from the atlas snapshot. |
| `A1/relative-elliptic-equivalence` | verified | Checked the actual ModularCurves elliptic scheme and differential/pairing interface. The genus-one comparison reuses it and does not replace it with a newly defined relative field carrier. |
| `A4/universal-vector-extension` | added | Added the missing construction with addedBy. For V(F)=Spec Sym(F-dual), the kernel is V(omega of A-dual), universal pushout represents Ext1, omega(E(A)) is H1dR(A), and Lie(E(A)) is its dual. Public sources' delegation of the universal-property proof is retained as G-vector-extension; five APIs and four diagnostic tests are supplied. |

## Orchestrator follow-ups

No unanswered question prevents accepting this pass. Packaging should preserve the explicit proof obligations and the native/upstream ownership boundaries. The handoff records tier moves and the global consumer/stage-edge changes that require another authorized job. It also names the exact source-delegated inputs that remain open; the review does not request another breadth pass merely because those proofs are not closed.
