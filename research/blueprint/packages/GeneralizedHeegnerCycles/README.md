# Roadmap: generalized Heegner cycles and their Iwasawa variation

**Summary.** Construct generalized Heegner cycles on Kuga–Sato varieties times powers of a CM elliptic curve, their étale and p-adic Abel–Jacobi classes, ordinary norm-compatible systems and explicit reciprocity laws. Apply these systems to Selmer groups and ordinary Hida families. Compare the weight-two specialization with corrected CM divisors and Kummer classes, recording the integral lattice, differential factor and first conductor transition throughout.

## Scope and ownership

The geometric constructions precede the Euler-system applications. This roadmap owns the CM product projector, graph cycles, their Abel–Jacobi applications and the comparisons among the resulting classes. **ModularCurvesPartII R14.3** supplies modular curves and relative coefficients. Its higher-fiber-power geometry requires the three contracts below. **AutomorphicGaloisRepresentations R19.1** owns the classical Scholl projector, parabolic realization and newform lattice; its inputs must be the foundational geometry, so that the order is geometry → classical projector → CM product. Importing GH.0 back into the classical-projector input would create a cycle.

**ComplexMultiplicationAndExplicitReciprocity CM.1** and **HeegnerPointEulerSystems HE.0–HE.3** own CM fields, marked isogenies, Hecke neighbors and point Kummer naturality. **EulerSystemsAndKolyvaginSystems ES.3–ES.8** owns derivative/descent machinery and abstract bounds. **PadicHodgeRegulators L1/L3** supplies logarithms and the cyclotomic regulator; the relative and unramified ordinary constructions require the distinct **PadicHodgeRegulatorsPartII PHR2.0–PHR2.5** contracts below. GH.2, GH.4 and GH.7 verify their hypotheses on the actual coefficient line. **AutomorphicPadicLFunctions L3h** owns the GL₂ square-root distribution, interpolation and analytic nonvanishing. **GrossZagierAndArithmeticHeights GZ.9** consumes its weight-two cycle formula and owns quaternionic and exceptional branches. **AutomorphicCongruences L2** and **BSD.6a** own congruences, divisibilities and control. Their inputs here retain their source-specific ranges.

## Conventions

Let K be imaginary quadratic, H_K its Hilbert class field, O_c=ℤ+cO_K and K_c its ring class field. A level mark may require a ray extension K̃_c; retain that extension until descent is proved. Normalize the CM action by [a]*ω_A=aω_A and the conjugate eigenvector by ⟨ω_A,η_A⟩=1. Thus ω_A↦bω_A entails η_A↦b⁻¹η_A.

Use m=k−2 for the BDP fiber-power index and k=2r for the CH half-weight, so m=2r−2. The product X_m=W_m×A^m has dimension 2m+1 and its graph cycle has codimension m+1. Weight two is m=0, r=1: subtract a degree-one cusp from the CM point. Graded Künneth signs are part of the correspondence action, and the permutation sign in ε_A is essential.

Fix geometric Frobenius and the displayed Tate twists before comparing representations. An integral projector needs its geometric denominators and the newform congruence denominator. A good CM model is independent of p∤N. Auxiliary fine levels for N≤4 require descent of level marks, correspondences and denominators, rather than a change of level by notation.

The CH standing range is: a trivial-nebentypus newform f of weight 2r≥2, K of odd discriminant −D_K<−3, p∤2(2r−1)!Nφ(N), character conductor prime to N, every tame prime of N split in K, and split p with a chosen p-adic place. Ordinarity is an extra hypothesis where stated. The critical character interval is −r<j<r (CH22, Introduction, (H), pp. 1–2). The corrected BSD auxiliary range instead has a nonsplit tame prime and varying weights; GH.2/GH.5/GH.6/GH.8 require separate extension theorems for it.

CH Definition 5.2 uses the full number |O_c×|; Castella Theorem 6.5 uses |O_c×|/2. The initial conductor trace has its own unit index and degree. Every normalization change must commute with that first trace as well as the positive-conductor tail.

## Existing Mathlib and Tau Ceti used

Use the native `TauCeti.AlgebraicGeometry.AbelianVariety`, `End`, `mulBy` and finite-surjective `IsIsogeny`. These supply the geometric carrier and scalar homomorphisms; identifying a finite geometric kernel cardinality with degree requires the characteristic-zero comparison in CM.1. The current divisor-class Abel–Jacobi constructions supply divisor algebra, while the continuous Tate-module Kummer/Gysin comparison is GH.1's additional target.

Mathlib supplies `LinearMap`, `Module.Dual`, ranges, kernels, `Submodule.span`, smooth and proper morphisms and quotient modules. The existing `Submodule.mapQ`/`ker_mapQ`, `mkQ_map_self` and `LinearMap.ker_eq_bot` compute descended kernels. Use `LinearMap.dualMap_apply` and `dualMap_comp_dualMap` for the differential pairing. Finite reindexing comes from `Equiv.sum_comp` (the additive form of `Equiv.prod_comp`); scalar character orthogonality is `MulChar.sum_eq_zero_of_ne_one`, with its integral-domain target. No torsion-free hypothesis on the cohomology module is obtained from that scalar theorem.

## How to read the build

Build GH.0's CM geometry from the resolved geometric and classical inputs, then GH.1's cycles and realizations. GH.2 verifies trace and local conditions; GH.3 constructs the stabilized tower and its moments. GH.4 identifies its regulator values. GH.5 constructs a Kolyvagin system conditionally on its application hypotheses, and GH.6 supplies nonvanishing and the resulting Selmer consequences without feeding those conclusions back into the construction. GH.7 compares the family tower and regulators. GH.8 combines these maps at weight two and exports the native higher-weight inputs. Within GH.8 the raw initial-trace comparison is used before identifying complete norm-compatible systems.

[Suggested.lean](Suggested.lean) retains two light linear definitions, their four proved examples and representative comparison signatures over existing carriers. Its `etaOfOmega` is the linear formula in `CMCurve.etaOfOmega`; its `stabilizedClass` is only the positive-conductor expression. The geometric objects, all definition APIs and all arithmetic checks are specified here. A generic linear comparison does not supply its geometric instantiation. GH.6's auxiliary-form non-torsion application also uses the ordinary-line quotient comparison of GH.7, which can be constructed independently of that application.

## References and edition conventions

The reference keys distinguish editions whose theorem numbering and page numbering differ. Every target below cites its own locator.

- **BDP13**: M. Bertolini, H. Darmon, K. Prasanna; appendix B. Conrad, [Generalized Heegner cycles and p-adic Rankin L-series](https://www.math.mcgill.ca/darmon/pub/Articles/Research/51.BDP1/duke-publishedversion.pdf); Published Duke Math. J. 162 (2013), 1033–1148; 116 pages.
- **CH22**: F. Castella, M.-L. Hsieh, [Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf); Author copy dated July 2, 2022, 40 pages; distinct from Math. Ann. 370 (2018).
- **CH erratum**: F. Castella, M.-L. Hsieh, [Erratum to Heegner cycles and p-adic L-functions](https://www.math.ntu.edu.tw/~mlhsieh/research/erratum2.pdf); One-page author-hosted erratum.
- **LV16**: M. Longo, S. Vigni, [Kolyvagin systems and Iwasawa theory of generalized Heegner cycles](https://arxiv.org/pdf/1605.03168v1); arXiv:1605.03168v1, May 10, 2016; The citations refer to this edition.
- **Castella**: F. Castella, [On the p-adic variation of Heegner points](https://web.math.ucsb.edu/~castella/Heegner.pdf); 31-page author-hosted copy of J. Inst. Math. Jussieu 19 (2020), 2127–2164.
- **KO**: S. Kobayashi, K. Ota, [Anticyclotomic main conjecture for modular forms and integral Perrin-Riou twists](https://www.math.keio.ac.jp/~kurihara/20.ASPMstyle.pdf); Author-hosted proceedings copy, 58 pages, cited by CH erratum.
- **CH18**: F. Castella, M.-L. Hsieh, [Heegner cycles and p-adic L-functions](https://web.math.ucsb.edu/~castella/HeegnerCycles-print.pdf); Publisher-formatted Math. Ann. 370 (2018), 567–628; author-hosted 62-page print copy.
- **LZ14**: David Loeffler; Sarah Livia Zerbes, [Iwasawa theory and p-adic L-functions over Z_p^2-extensions](https://arxiv.org/pdf/1108.5954v3); arXiv:1108.5954v3, 22 April 2014; 45-page accepted-version preprint, distinct from the journal typesetting.
- **Mathlib quotient modules**: Mathlib contributors, [Mathlib quotient modules and kernels](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Quotient/Basic.lean); Commit 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **Mathlib character sums**: Mathlib contributors, [Finite sums and multiplicative-character orthogonality](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/MulChar/Basic.lean); Commit 082e2d37e8b0463410cdb532e111cd43d5a66174.
- **BDP17**: M. Bertolini, H. Darmon, K. Prasanna, [p-adic L-functions and the coniveau filtration on Chow groups](https://www.math.mcgill.ca/darmon/pub/Articles/Research/57.BDP5-coniveau/crelle.pdf), J. reine angew. Math. 731 (2017), 21–86.
- **Hsieh14**: M.-L. Hsieh, [Special values of anticyclotomic Rankin–Selberg L-functions](https://www.maths.tcd.ie/EMIS/journals/DMJDMV/vol-19/24.pdf), Documenta Math. 19 (2014), 709–767.
- **Scholl**: A. J. Scholl, [Motives for modular forms](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf), ten-page author preprint; locators below use its own pages, rather than Invent. Math. 100 (1990), 419–430.
- **BSD erratum**: Francesc Castella, [Erratum to On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf); Five-page author erratum; acquired copy includes Theorem 2.3 and its proof.

LV16 denotes the version-one preprint, not the 2019 version of record. CH22 page numbers refer to the 40-page author revision; CH18 page numbers are journal pages. BDP13 page numbers are printed Duke pages. Castella, KO, LZ14 and the errata use the pages of the linked copies. The corrected local-condition and parity statements incorporate the cited Castella–Hsieh erratum.

## Geometric and regulator supplier contracts

The following contracts specify the mathematics required from the named owners. The higher-fiber-power targets in R14.3 and the distinct local Part II still require construction in those owners; dependent targets below are conditional on these interfaces. The classical projector remains exclusively in AGR R19.1.

For **ModularCurvesPartII R14.3**, the required interfaces are:

- `ks-canonical-resolution`: for fine n>4 and m≥0, construct W_m over X₁(n) with dimension m+1, smooth proper characteristic-zero generic fiber, and the integral good-model range of Conrad's appendix. Extend torsion translations, inversions, permutations and the level/Hecke correspondences. This interface supplies the carrier before any projector is applied. BDP13 §2.1, pp. 1055–1059 and Conrad appendix, pp. 1139–1141 give the geometric range. Scholl §§1.0–1.1, pp. 1–2, Proposition 2.1.1, p. 4 and Theorem 3.1.0(i), p. 7 give the full-level local resolution and equivariance; transporting from full level to Γ₁(n) is part of the geometric interface.
- `ks-boundary-realisation`: give strata of the resolved boundary, their equivariance, excision sequences and weight calculations before applying the signed projector. AGR then proves its image is parabolic and concentrated in degree m+1. Scholl Lemma 1.3.1 and Theorem 1.3.3, p. 3, Propositions 2.4.1–2.4.4, pp. 5–6 and Theorem 3.1.0(ii)–(iii), p. 7 provide the boundary calculation. Retain its coefficient and duality hypotheses and the m=0 Jacobian boundary separately.
- `ks-fine-level-descent`: for any source N≥1 choose fine n divisible by N, descend the specified level-N summand and prove rational independence of the choice. Record degree, stabilizer, torsion and projector denominators individually. Extra primes of n need not be harmless at p. AGR's `integral-structure-of-the-newform-premotive` then records a fixed nonzero d_f with d_f e_f preserving its lattice; integral isomorphism requires the relevant denominators to be units. BDP13 §2.1, pp. 1055–1059 and Scholl §§1.1–1.2, p. 2 provide the projector context; the integral fine-level descent is an additional theorem to supply.

For **PadicHodgeRegulatorsPartII**, take L1/L3's logarithm and cyclotomic theory as inputs and require:

<a id="supplier-phr2-0"></a>

- **PHR2.0, `integral-twists`**: the actual integral Ω map, crystalline lattices, bounded twist denominators, finite coefficient extension and period-pairing compatibility. KO Lemma 4.10, pp. 44–45 uses trace lifting, Ω specialization and the vanishing pairing of Lemma 4.7; the application must retain their lattice and twist ranges.
<a id="supplier-phr2-1"></a>

- **PHR2.1, `relative-lubin-tate`**: CH22 Theorem 5.1, pp. 21–22, over its finite unramified base and relative Lubin–Tate tower. Specify integral source, distribution target, nonnegative Hodge–Tate weights, no trivial quotient and no tower invariants, with both interpolation ranges and their epsilon/Euler/factorial factors.
<a id="supplier-phr2-2"></a>

- **PHR2.2, `ochiai-ideal-exponential`**: for the rank-one unramified ordinary deformation and Ical=I⊗̂ℤ_p[[Γ_cyc]], construct the injective map J(D⊗O_F)→H¹(F,F⁺Tcal), J=(Ψ(Fr_p)−1,γ₀−1), with pseudo-null cokernel and conductor-dependent specialization (Castella Theorem 3.4, pp. 14–15).
<a id="supplier-phr2-3"></a>

- **PHR2.3, `yager-trace-module`**: construct S∞=lim_trace S_m≅lim_trace O_Fm, prove rank-one freeness over ℤ_p[[U]] and y^u=[u]y, and verify finite-level corestriction before tensoring regulators (Castella (3.6), Proposition 3.5, p. 15; LZ14 §3.2, pp. 11–13).
<a id="supplier-phr2-4"></a>

- **PHR2.4, `two-variable-ordinary-regulator`**: combine those maps over the unramified×cyclotomic tower, retaining target λ⁻¹J(D⊗Ô_F∞[[G]]), λ=Ψ(Fr_p)−1. Prove injectivity and positive-weight logarithm interpolation, plus dual-exponential interpolation at p-old specializations (Castella Theorem 3.7 and Corollary 3.9, pp. 16–17). LZ14 Proposition 4.11, p. 18 supplies injectivity in the infinite-unramified range before taking a quotient.
<a id="supplier-phr2-5"></a>

- **PHR2.5, `quotient-and-specialisation`**: construct the actual one-variable coefficient/distribution quotient and cohomological specialization sequence. Compute the H² error from the tower H⁰ condition; prove the regulator's inverse image of the target quotient submodule equals the source quotient submodule, or compute the descended kernel. Preserve the nonzero pairing on the identified rank-one period line, pseudo-null error and restriction/corestriction diagrams (Castella Lemma 5.1 and Proposition 5.2, pp. 21–22; CH22 Theorem 5.1, pp. 21–22). A coefficient map from a λ-localization requires nonzero image of λ. At λ=0 supply a regular model or a cleared-denominator identity with a separately proved moment.

## Other imported interfaces

- **ComplexMultiplicationAndExplicitReciprocity CM.1**, with **HeegnerPointEulerSystems HE.1–HE.2**: normalized CM action and Hodge characters; marked ideal quotients, target-order classification, conductor-changing neighbors and marked-isogeny descent over H̃·H_c, including the exceptional unit fields. Identify finite geometric kernels and isogeny degrees over an algebraically closed characteristic-zero field. For B=Res_{H_K/K}A, construct the G_K action on its Tate module and the full symmetric-power character summands, including the finite-order twist χ_t, integral projector and class-inclusion denominators. Do not commute symmetric powers with induction.

- **DerivedDeRhamCohomology DD.2** and **EtaleDualityAndPerverseSheaves EDC.6**: filtered scheme-level de Rham and rational p-adic étale Künneth, cup products, cycle classes and correspondence action. For rational étale cohomology, prove the passage from finite coefficient systems with derived-limit control. Include the rational Gysin sequence, Tate twists, support enlargement and rational-equivalence independence of the cycle extension.

- **SchemeAndStackFoundations SF.5**: rational Chow groups with proper pushforward, flat pullback, products of isogeny graphs, composition and transpose of correspondences, and their base-change action. Relate this intersection theory to the degree-zero cycle complex and to the support-independent Gysin construction. Use **ArithmeticGaloisDuality R02.1** to identify continuous extension classes with H¹ by the cocycle g↦g·lift(1)−lift(1), including change of lift, restriction and coefficient naturality. The compact five-term sequence in R02.2 supplies the distinct integral descent step.

- **PadicHodgeTheory R06.2 and R06.5**: negative-weight filtered Frobenius extension comparison, Φ=Φ₀^[F:ℚ_p], the holomorphic-minus-Frobenius quotient, and the proper smooth comparison for projected X_m. Establish the geometric Abel–Jacobi finite-local condition also after finite ramified support-field extensions; retain D_cris over the maximal unramified subfield and D_dR over the full field.

- **PadicDifferentialEquationsAndRigidCohomology RD.3–RD.4**: overconvergent coefficient F-isocrystals, wide-open algebraic/rigid comparison, annular and cusp residues, the rigid residue theorem and the Čech–de Rham cup pairing. Give the actual analytic section and differential carriers, connection and F-linear Frobenius polynomial action, and prove that the modular differential lies in the admissible image used by the normalized Coleman constructor.

- **PadicHodgeRegulators D.2**: the higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m, compatible with correspondences, proper/flat maps, the étale Gysin extension and the Bloch–Kato logarithm. The regulator on Spec O_F and the K₂ curve specialization supply different comparisons.

- **AutomorphicGaloisRepresentations R19.1 and R19.6**, with **PadicFamilies L0**: the newform representation and stable lattice in the geometric-Frobenius convention; the determinant-restricted big-image subgroup and its solvable-tower invariant vanishing. Supply the ordinary Hida Jacobian tower representation, rank-two freeness, rank-one ordinary sequence, determinant, trace and arithmetic specialization after critical twist. **HE.1** supplies the p-power-level CM point tower, its diamond character and degeneracy traces.

- **AutomorphicPadicLFunctions L3h**: one GL₂ square-root distribution, negative θ powers on p-depleted ordinary CM expansions, BDP toric interpolation and continuity, CH nonvanishing with the auxiliary residual hypotheses of Hsieh Theorem C, and Castella family interpolation with all periods, epsilon, Euler and gamma factors.

- **EulerSystemsAndKolyvaginSystems ES.5**: retain separate interfaces for clean Howard H0–H5 descent and CH anticyclotomic descent with bounded local errors and Nekovář constants. The latter must prove residual detection, finite–singular correction, admissible-prime supply and the p^C annihilator under CH's own hypotheses. **SelmerIwasawaCohomology L4** supplies source-qualified Greenberg/Bloch–Kato comparisons and the corrected Nekovář family parity theorem with its precise self-dual family and local plus-module assumptions.

The degree-one Picard–Kummer and local conductor-field comparisons and the uniform selected-factor lattice maps belong to GH.1. GH.3 owns exact-character moments; GH.4 owns period/twist transport; GH.7 verifies the actual regulator quotient and weight-two p-old localization. The auxiliary nonsplit-level local condition, leading-class unit and non-torsion are the separate GH.2/GH.5/GH.6 inputs to GH.8's BSD adapter. The p-new multiplicative weight-two specialization is reached through BSD.6a congruence/control.

<a id="layer-gh-0"></a>

## Layer GH.0: CM geometry, projectors and coefficient realizations

<a id="cm-elliptic-curve-and-its-hodge-splitting"></a>

### GH.0.1: The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.

Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.

The two-character coordinate fixture is a realization of the specified CM endomorphisms through A.cm, not a construction of H¹_dR. Its comparison with the geometric carrier is imported from CM.1 and the de Rham owner.

The construction must provide the following operations and identities.

- `CMCurve.h10`: The identity-character eigenvector ω lies in ker([α]*−α).
- `CMCurve.h01`: The conjugate-character eigenvector η lies in ker([α]*−ᾱ).
- `CMCurve.hodgeSplitting`: The two distinct CM eigenlines span the cohomology space and have zero intersection.
- `CMCurve.etaOfOmega`: CMCurve.etaOfOmega(b,ω,η) is b(ω,η)⁻¹η, using an actual nonzero vector on the conjugate CM eigenline.
- `CMCurve.map_eigenvector`: A linear realization map commuting with the CM action transports a character eigenvector to an eigenvector with the same character value.
- `CMCurve.etaOfOmega_spec`: When b(ω,η) is nonzero, the constructed vector pairs to 1 and is the unique scalar multiple of η that does so.

O_K acts on H¹_dR(A/F) through the two characters α and ᾱ, which are distinct since K is imaginary quadratic. The two eigenlines split the space, and the α-eigenline is Ω¹, because [α]^* acts on differentials by α.

Functoriality: morphisms commuting with O_K preserve the eigenlines.

Over ℂ, H^{0,1} = conj(Ω¹) is the ᾱ-eigenline, and over ℂ_p for ordinary A the unit-root line is O_K-stable and different from Ω¹.

Fixes the normalized eigenbasis and prevents a free choice of complementary line. This is used in [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition).

Tracks the power of a when the CM differential is rescaled. This is used in [BDP special value formula](#bdp-special-value-formula).

**Checks.**

- `cmCurve_i_action`: For a CM curve A with O_K=Z[i], realize the actual endomorphism A.cm(i) by the two characters through A.cm⁻¹. On the ordered basis it sends (1,0) to (i,0) and (0,1) to (0,−i). Conjugate the CM isomorphism on the same curve, keep A’s original realization fixed, and check the new i-endomorphism sends (1,0) to (−i,0), unequal to (i,0). This rejects the opposite CM normalization; the geometric realization identification is the CM.1/de Rham export.
- `cmCurve_normalization`: For the determinant cup pairing on C², compute CMCurve.etaOfOmega((2,0),(0,1))=(0,1/2). Check its pairing with (2,0) is 1 and the i-action has conjugate eigenvalue −i. The test calls the normalization constructor itself.
- `cmCurve_scalar_endomorphism`: The specified ring isomorphism sends the integer n to the endomorphism whose underlying map is the native mulBy(A,n), so the CM and abelian-variety scalar actions agree.
- A = ℂ/O_K for K = ℚ(i): [i]^* dz = i dz on Ω¹, and [i]^* dz̄ = −i dz̄ on H^{0,1}.

Use Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.End`; **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`; Mathlib `Submodule.span`; **DerivedDeRhamCohomology DD.2**.

The source for this target is **BDP13**, §1.4, p. 1051; **BDP13**, §1.4, (1.4.1), p. 1051; **BDP13**, §1.4, (1.4.2), p. 1052.

<a id="cm-projector-and-symmetric-power"></a>

### GH.0.2: The projector ε_A on A^m and Lemma 1.8

For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

The denominator 2^m m! must be inverted. ε_A is not in ℤ[Aut(A^m)], so an integral projector needs 2 and m! invertible.

The sign twist on S_m is essential. By the Koszul rule, geometric permutations act on H¹^{⊗m} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^m H¹, which vanishes for m ≥ 3.

Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the CM character decomposition records.

The construction must provide the following operations and identities.

- `epsA_idem`: ε_A²=ε_A for the graph action of Ξ_m.
- `epsA_image`: Its range is the χ_m-isotypic subspace of the tensor realization.
- `epsA_transpose`: The inverse-graph involution fixes ε_A.
- `epsA_natural`: An equivariant linear map intertwines the signed character average with the same average on the target realization.

Idempotence: j is a character of Ξ_m, so ε_A = (1/|Ξ_m|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_m].

Künneth: H^*(A^m) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_m}, and [−1] acts on H^i by (−1)^i. So the μ_2^m-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗m}.

On H¹^{⊗m}, the geometric action of σ ∈ S_m is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^m H¹.

Use SF.5 for rational graph correspondences and their composition; use DD.2 for the correspondence-compatible de Rham realization and graded Künneth action. Other realizations require their own compatible product export.

Eliminates all CM-factor cohomology except middle symmetric power. This is used in [Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety).

Projects products of isogeny graphs without changing the intended symmetric tensor. This is used in [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle).

**Checks.**

- `epsA_order`: On the eight word tensors of a rank-two vector space cubed, use the actual S_3 action ρ(σ)v(w)=sgn(σ)v(w∘σ). The signed epsA average sends e_001 to (e_001+e_010+e_100)/3 and fixes e_000. The inversion part is already identity on this all-H¹ summand of the full Ξ_3 average, whose denominator is 48.
- `epsA_weight_zero`: At m=0 the projector acts as the identity on H⁰(A⁰)=F.
- `epsA_koszul`: For that same graded S_3 action, epsA with the sign character has image dimension 4, while epsA with the trivial character is the zero operator: Λ³ of a rank-two space vanishes. This distinguishes symmetric projection from unsigned geometric averaging.
- m = 2: ε_A H²(A²) = Sym² H¹(A), of dimension 3, while H²(A²) has dimension 6.
- At m=3 the signed average has rank 4 on the eight-dimensional all-H¹ tensor space; omitting its permutation character gives rank 0. Both are computed from the same action, not a detached sign identity.

Use [The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting); **SchemeAndStackFoundations SF.5**; Mathlib `LinearMap`; Mathlib `LinearMap.range`; **DerivedDeRhamCohomology DD.2**.

The source for this target is **BDP13**, §1.4, (1.4.4), p. 1052; **BDP13**, §1.4, Lemma 1.8, p. 1052; **BDP13**, §1.4, p. 1052.

<a id="cm-character-decomposition"></a>

### GH.0.3: The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters

For 0 ≤ j ≤ m, the classes ω_A^jη_A^{m−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_m^*η_A) form a basis of ε_A H^m_dR(A^m/F) = Sym^m H¹_dR(A/F). The diagonal action of α ∈ O_K on A^m acts on ω_A^jη_A^{m−j} by α^jᾱ^{m−j}. Moreover ω_A^jη_A^{m−j} = (j!(m − j)!/m!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_m^*ϖ_{m,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

The Hodge type of ω^jη^{m−j} is (j, m − j), and Fil^m Sym^m H¹ is spanned by ω^m.

Rescaling ω_A by λ multiplies ω^jη^{m−j} by λ^{2j−m}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

ε_A applied to a pure tensor of ω's and η's averages over S_m, with the sign twist compensating the Koszul sign. Each subset I with |I| = j arises from j!(m − j)! permutations.

The normalized CM eigenbasis gives the usual monomial basis of the symmetric power, of dimension m+1. Its joint algebraic CM characters have distinct bidegrees (j,m−j). Do not claim that their values at every α∉ℤ are distinct: for K=ℚ(i), α=i and m=2 the j=0 and j=2 values coincide.

The O_K-action on p_i^*ω is by α and on p_i^*η by ᾱ (the CM Hodge splitting).

**Checks.**

- m = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

Use [The projector ε_A on A^m and Lemma 1.8](#cm-projector-and-symmetric-power); [The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting).

The source for this target is **BDP13**, §1.4, (1.4.6), p. 1053.

<a id="generalized-kuga-sato-variety-and-its-projector"></a>

### GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A

Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

The denominators are those of ε_W^{(1)} (N^m), ε_W^{(2)} (2^m m!) and ε_A (2^m m!), so ε_X is integral after 2N·m! is inverted. Record this denominator before asserting integral preservation.

Characteristic 0 only: the desingularization and smoothness of W_m are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.

N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

The construction must provide the following operations and identities.

- `epsX_commute`: For commuting factor realizations, interchanging ε_W and ε_A leaves ε_X unchanged. The geometric factor-commutation input comes from their separate factor actions.
- `epsX_idem`: The commuting product of the two idempotents is idempotent.
- `epsX_factor`: ε_X acts by applying ε_A and then ε_W.
- `epsX_denominator`: The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it.

X_m is a product of smooth proper F-varieties, so it is smooth and proper of dimension (m + 1) + m.

π_m = (W_m → C) ∘ pr_1, whose fibres are those of W_m times A^m.

ε_W acts on the first factor and ε_A on the second, so they commute, and both preserve the fibres of π_m.

Transpose: the transpose of Σ c_g·g is Σ c_g·g⁻¹, and the coefficient functions of ε_W^{(1)}, ε_W^{(2)} and ε_A are invariant under g ↦ g⁻¹ (j(ξ⁻¹) = j(ξ)), so ε_X^t = ε_X.

Defines the ambient projected Chow group. This is used in [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle).

Self-transposition passes Poincaré duality to the image. This is used in [Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology).

**Checks.**

- `X_dim`: At m=2, X has dimension 5 and the graph cycle has codimension 3.
- `epsX_weight_zero`: With the CM factor trivial, ε_X=ε_W.
- `epsX_factor_test`: On a supplied tensor-factor realization the action is the composite, in the displayed order.
- m = 0: X_0 = W_0 = C, and ε_X = 1.
- m = 1: X_1 = E × A, of dimension 3, a threefold fibred over X₁(N).

Use **ModularCurvesPartII R14.3**; [The projector ε_A on A^m and Lemma 1.8](#cm-projector-and-symmetric-power); **SchemeAndStackFoundations SF.5**; **AutomorphicGaloisRepresentations R19.1/scholl-projector**.

The source for this target is **BDP13**, §2.2, p. 1060; **BDP13**, §2.2, (2.2.1), p. 1061; **BDP13**, §2.1, (2.1.2), p. 1057.

<a id="cohomology-of-the-generalized-kuga-sato-variety"></a>

### GH.0.5: Projected middle cohomology

For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

The imported Scholl realization has ε_W H*(W_m)=H¹_par(C,L_m) in degree m+1. Both product realizations and their correspondence-compatible Künneth isomorphisms are supplied.

The degree-2m+2 vanishing is the input for GH.1 null-homology; the m=0 divisor uses its degree-zero correction.

Apply the supplied de Rham Künneth decomposition for W_m×A^m, respecting both factor projectors.

The CM projector kills degrees other than m; the modular projector kills degrees other than m+1. Their surviving tensor summand is therefore in degree 2m+1.

Use the rational p-adic étale Künneth export and the same graph actions to obtain the Galois-equivariant identification.

**Checks.**

- For m=1 the projected H³ of the universal elliptic surface times A is H¹_par(C,L₁)⊗H¹(A), of dimension 4 dim S₃(Γ₁(N)).

Use **ModularCurvesPartII R14.3**; [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; **DerivedDeRhamCohomology DD.2**; **EtaleDualityAndPerverseSheaves EDC.6**; **AutomorphicGaloisRepresentations R19.1/scholl-projector**.

The source for this target is **BDP13**, §2.2, Proposition 2.4, p. 1061; **BDP13**, §2.2, proof of Proposition 2.4, p. 1062.

<a id="projected-hodge-filtration"></a>

### GH.0.6: Projected Hodge filtration

For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

The modular projected factor has Hodge types (m+1,0) and (0,m+1), with Fil¹=Fil^{m+1}=S_{m+2}; the CM symmetric factor has Hodge filtration in degrees 0 through m.

Use the field of definition and filtered de Rham product export of the preceding realization theorem.

Import the classical modular Hodge identification from AGR R19.1 and the filtered Künneth theorem from DD.2.

The holomorphic modular summand of filtration m+1 tensored with Fil⁰ of the CM factor contributes the stated whole tensor. The antiholomorphic modular summand has filtration zero, while the CM factor has filtration at most m, so it contributes nothing to Fil^{m+1}.

Identify the surviving tensor by the wedge map, preserving the specified differential normalization.

**Checks.**

- At m=1 the filtration has dimension 2 dim S₃, and contains both ω_f⊗ω_A and ω_f⊗η_A; retaining only ω_A gives half the required space.

Use [Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); **ModularCurvesPartII R14.3**; **DerivedDeRhamCohomology DD.2**; **AutomorphicGaloisRepresentations R19.1/scholl-projector**.

The source for this target is **BDP13**, §2.2, Proposition 2.5, p. 1062.

<a id="self-duality-of-the-projected-cohomology"></a>

### GH.0.7: Self-duality of ε_X H^{2m+1}(X_m)(m + 1)

Poincaré duality on the smooth proper (2m + 1)-dimensional X_m restricts to a perfect pairing ε_X H^{2m+1}(X_m) × ε_X H^{2m+1}(X_m) → H^{4m+2}(X_m) ≅ ℚ_p(−2m − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2m+1}_et(X_{m,F̄}, ℚ_p)(m + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{m,m} = L_m ⊗ Sym^m H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^m H¹(A)(m + 1).

ε_X^t = ε_X (the product-projector construction) is what makes the pairing restrict to the image.

The twist (m + 1) is the self-dual twist of a weight 2m + 1 representation: V is pure of weight −1 at good primes.

The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_m) and the newform f's Galois representation V_f, imported from AutomorphicGaloisRepresentations R19.1.

Poincaré duality on X_m pairs H^{2m+1} with itself into H^{4m+2} = ℚ_p(−2m − 1) (EtaleDualityAndPerverseSheaves EDC.2).

For correspondences, ⟨εx, y⟩ = ⟨x, ε^t y⟩, and ε_X^t = ε_X. So ε_X H^{2m+1} is orthogonal to (1 − ε_X)H^{2m+1}, and the pairing restricts to a perfect pairing on ε_X H^{2m+1}.

Twisting by (m + 1) turns the target ℚ_p(−2m − 1) into ℚ_p(1).

Under the projected middle-cohomology identification, the pairing is the tensor product of the pairing on H¹_par(C, L_m) and the one on Sym^m H¹(A), which is (2.2.3).

**Checks.**

- m = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

Use [Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector).

The source for this target is **BDP13**, §2.2, (2.2.3), p. 1061; **BDP13**, §3.4, (3.4.1)–(3.4.2), p.1070.

<a id="newform-cm-projector"></a>

### GH.0.8: Newform and CM coefficient projector

For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

N>4 for the chosen fine Γ₁ model; k≥2; supplied Hecke eigensystem and CM realization

At original source levels N≤4, use the R14.3 fine-level descent contract; the displayed N>4 condition belongs to the chosen model, not to CH’s source theorem.

The construction must provide the following operations and identities.

- `coefficientProjector_factor`: The modular and CM projections compose.
- `coefficientProjector_twist`: For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r).
- `coefficientProjector_lattice`: A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice.

Import the Hecke action and f projector from AGR R19.1.

Apply the explicit CM character decomposition, record localization denominators, and use Poincaré duality for the twist.

Fixes the coefficient lattice and denominator assumptions before integral descent. This is used in [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison).

**Checks.**

- `coefficientProjector_identity`: After restricting the coefficient space to the trivial CM character summand, its identity projector leaves the f summand. The trivial-character projector on the whole symmetric power need not be the identity.
- `coefficientProjector_order`: On commuting projectors the order of projection does not matter.
- `coefficientProjector_denominator`: A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2).
- A congruence prime for f can divide the Hecke denominator even if p avoids 2N m!.

Use **ModularCurvesPartII R14.3**; [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); [Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology); **AutomorphicGaloisRepresentations R19.1/scholl-projector**; **AutomorphicGaloisRepresentations R19.1/integral-structure-of-the-newform-premotive**.

The source for this target is **CH22**, §4.2, pp.14–15.

<a id="cm-product-good-model"></a>

### GH.0.9: Good model comparison for the CM product

If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

Both factors have supplied models; F is the local field of the chosen comparison.

Smooth/proper product stability is already in Mathlib; the additional target is the chosen arithmetic models and their local comparison data for cycles.

Base change the universal-family model.

Use stability of smoothness and properness under products and the independently supplied model of A.

**Checks.**

- At p=5 the CM curve y²=x³−25x has bad reduction although 5∤7; the level criterion cannot apply to its CM factor.
- Positive product-model test: at p=5 the CM curve y²=x³−x has discriminant 64, a unit in Z₅. With the supplied smooth proper W_m model for level 13, the product after a common finite unramified base change is smooth proper. Smoothness and properness must be checked on both supplied factors.

Use **ModularCurvesPartII R14.3**; [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); **SchemeAndStackFoundations SF.2**; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `AlgebraicGeometry.IsProper`.

The source for this target is **BDP13**, §3.2, p.1067; appendix introduction, p.1139.

### Examples

For m=2, dim X_m=5 and the graph codimension is 3. The signed CM projector has rank 3 on H²(A²); unsigned averaging would give the exterior rather than symmetric power.

### Dependencies

Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety`; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.End`; **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`; Mathlib `Submodule.span`; **DerivedDeRhamCohomology DD.2**; **SchemeAndStackFoundations SF.5**; Mathlib `LinearMap`; Mathlib `LinearMap.range`; **ModularCurvesPartII R14.3**; **AutomorphicGaloisRepresentations R19.1/scholl-projector**; **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; **EtaleDualityAndPerverseSheaves EDC.6**; **AutomorphicGaloisRepresentations R19.1/integral-structure-of-the-newform-premotive**; **SchemeAndStackFoundations SF.2**; Mathlib `AlgebraicGeometry.Smooth`; Mathlib `AlgebraicGeometry.IsProper`.

<a id="layer-gh-1"></a>

## Layer GH.1: Cycles and Abel–Jacobi maps

<a id="isogenies-of-conductor-c-prime-to-n"></a>

### GH.1.1: The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^𝔑(A) consists of the pairs with ker φ ∩ A[𝔑] = 0, and Isog_c^𝔑(A) = Isog_c(A) ∩ Isog^𝔑(A). For (φ, A′) ∈ Isog^𝔑(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible integral O_c-ideals relatively prime to 𝔑_c=𝔑∩O_c acts on Isog_c^𝔑(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

The kernel condition ker φ ∩ A[𝔑] = 0 makes φ(t_A) a point of exact order N.

The conductor c is determined by End(A′), an order of K.

Use native group-scheme rational points over the chosen field; in the degree comparison this field is algebraically closed of characteristic zero. The target-order condition identifies the literal order Z+cO_K with End(A′), and its marked subgroup is ideal torsion generated by t_A. Generic ring parameters omit CM.1’s quadratic maximal-order classification, which remains a source hypothesis.

The construction must provide the following operations and identities.

- `IsogPair.conductor`: The conductor is the positive index c in the specified ring isomorphism O_c=Z+cO_K ≅ End(A′), and is invariant under marked-target isomorphism by the imported quadratic-order classification.
- `IsogPair.level`: On the actual group-scheme point carrier, ker(φ)∩A[𝔑]=0 and A[𝔑]=Z·t_A imply addOrder(φ(t_A))=N.
- `IsogPair.idealAction`: Compose the marked pair with the CM.1 ideal quotient isogeny, carrying its target-order identification and the prime-to-mark kernel proof. The CM.1 theorem supplies the quotient, invertible ideal condition and reciprocity square.
- `IsogPair.degree`: In the characteristic-zero geometric-point presentation, degree is the cardinality of ker(φ). The single kernel-cardinality operation is used for every map; CM.1 supplies its comparison with finite morphism degree and multiplicativity.

The endomorphism ring of an isogenous curve is an order of K, hence O_c for a unique c ≥ 1.

φ is injective on A[𝔑] and t_A has order N, so φ(t_A) has order N.

For an invertible integral O_c-ideal 𝔞 relatively prime to 𝔑_c, the quotient isogeny φ_𝔞 preserves the marked cyclic level subgroup and the target endomorphism order. Import the ideal-action theorem from CM.1, including exceptional unit fields; primality to the whole integer cN is not the definition of P(O_c).

For degree, use the geometric-point exact kernel sequence for two surjective finite isogenies. Kernel cardinalities multiply; the characteristic-zero finite-morphism degree comparison is supplied by CM.1. Never quantify over unrelated numerical degree functions.

Specifies the graph in the fiber over the transported CM pair. This is used in [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle).

Conductor-changing ideal isogenies index Hecke neighbors. This is used in [Heegner cycle norm relations](#cycle-norm-relations).

**Checks.**

- `isog_identity_conductor`: Construct IsogPair.identity with target A, c=1 and target CM order (Z+O_K)≅O_K≅End(A). Check its conductor is 1, its order identification sends 1 to 1, and its actual point map fixes the chosen cyclic level generator.
- `isog_level_failure`: For a nonzero ideal-torsion point t_A killed by N, the native multiplication-by-N endomorphism has nontrivial intersection of its point-map kernel with A[𝔑]. It therefore cannot inhabit the marked IsogPair carrier.
- `isog_degree_multiplicativity`: Use the same kernelDegree as the isogeny point map on the finite-kernel fixture Z/6→Z/3→Z/1. The actual quotient maps have kernel cardinalities 2,3 and 6, so composition has the product degree. This tests the cardinality adapter; the finite-morphism degree comparison remains a named CM.1 export, and no elliptic curve is constructed by this fixture.
- `isog_conductor_order_test`: For the literal Gaussian target order O_c=Z+cZ[i], i belongs to O_1 and is excluded from O_2, while 2i belongs to O_2. This tests the actual order used by target_cm and rejects a constant maximal-order conductor model.
- K = ℚ(i), N = 5 = (2 + i)(2 − i): 𝔑 = (2 + i), with O_K/𝔑 ≅ ℤ/5ℤ.
- For A = ℂ/O_K, z ↦ cz defines an isogeny ℂ/O_K → ℂ/O_c with cyclic kernel c⁻¹O_c/O_K ≅ ℤ/cℤ, and End(ℂ/O_c) = O_c: a pair of conductor c.

Use **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; [The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting).

The source for this target is **BDP13**, §1.4, Assumption 1.9, p. 1053; **BDP13**, §1.4, p. 1053; **BDP13**, §1.4, p. 1054.

<a id="generalized-heegner-cycle"></a>

### GH.1.2: The generalized Heegner cycle Δ_φ = ε_X Υ_φ

For (φ, A′) ∈ Isog^𝔑(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

The rational correspondence ε_X has clearing denominator N^m2^{2m}(m!)², the product of the W_m and A^m averaging denominators. This scalar (or an explicitly justified multiple) clears its graph-cycle denominators; (2N·m!)² need not do so. Additional f-projector and integral-lattice denominators belong to the separate coefficient comparison.

Graph(φ)^m has dimension m in the 2m-dimensional fibre, so it has codimension m+1 in X_m of dimension 2m+1.

The construction must provide the following operations and identities.

- `gHC_codim`: The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1.
- `gHC_projector`: ε_X fixes Δ_φ.
- `gHC_rational_equivalence`: Rationally equivalent graph representatives give the same cycle class.
- `gHC_baseChange`: Base change commutes with projection when graph correspondences and the projector are transported.

ι_{A′} identifies (A′)^m with the fibre of the fibre-power E^m over P_{A′}, which lies in the smooth locus of W_m since P_{A′} is not a cusp.

Graph(φ) ⊂ A × A′ is a curve. Its m-th power is an m-dimensional subvariety of (A × A′)^m, reordered as (A′)^m × A^m.

Apply the correspondence ε_X (GH.0) on Chow groups with ℚ-coefficients (SchemeAndStackFoundations SF.5). ε_X preserves the fibres of π_m, so the support stays in π_m^{−1}(P_{A′}).

Provides the null-homologous Chow input to the Gysin extension. This is used in [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map).

Provides the isogeny-indexed cycle whose Abel–Jacobi image occurs in the formula. This is used in [BDP special value formula](#bdp-special-value-formula).

**Checks.**

- `upsilon_codim`: At m=2 the graph has dimension 2 and codimension 3 in X₂.
- `gHC_weight_zero`: At m=0 replace the point by point minus a chosen cusp; its degree is zero.
- `gHC_projected_test`: An idempotent ε fixes gHC(ε,graph), and gHC(id,graph)=graph. Together these exclude both an unprojected graph and the identically zero construction (take a nonzero graph for the identity fixture).
- m = 1: Υ_φ = Graph(φ) ⊂ A′ × A = the fibre of E × A over P_{A′}, a curve in the threefold X_1.

Use [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]](#isogenies-of-conductor-c-prime-to-n); **SchemeAndStackFoundations SF.5**.

The source for this target is **BDP13**, §2.3, p. 1062; **BDP13**, §2.3, p. 1063.

<a id="field-of-definition-of-generalized-heegner-cycles"></a>

### GH.1.3: BDP Remark 2.6: the field of definition of Δ_φ

If (φ, A′) ∈ Isog_c^𝔑(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

The CM main theorem supplies descent of the marked pair to H̃·H_c; use the requested general CM.1 export when HE.1’s restricted unit-field hypotheses do not apply.

The CM main theorem makes (A′, φ(t_A)) and φ defined over H̃·H_c for (φ, A′) of conductor c (HE.1 under its hypotheses, otherwise the CM.1 request).

W_m, A and ε_X are defined over H (GH.0), so ι_{A′}, Υ_φ and Δ_φ are defined over H̃·H_c.

**Checks.**

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

Use [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **ComplexMultiplicationAndExplicitReciprocity CM.1**.

The source for this target is **BDP13**, §2.3, Remark 2.6, p. 1063.

<a id="homological-triviality-of-generalized-heegner-cycles"></a>

### GH.1.4: BDP Proposition 2.7: Δ_φ is homologically trivial

For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2m+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

The vanishing of ε_X H^{2m+2}(X_m) is the only input for m ≥ 1.

Cycle class maps in the claimed realizations commute with correspondences. The rational étale passage from finite Gysin/cycle-class maps is part of the EDC.6 request; filtered de Rham compatibility is requested from DD.2. Betti compatibility requires the corresponding classical realization and is not inferred from torsion étale purity.

cl(Δ_φ) = cl(ε_X Υ_φ) = ε_X cl(Υ_φ) ∈ ε_X H^{2m+2}(X_m) (requested rational EDC.6 and de Rham DD.2 correspondence compatibilities, with a separate Betti realization comparison).

ε_X H^{2m+2}(X_m) = 0 for m ≥ 1 (GH.0/cohomology-of-the-generalized-kuga-sato-variety).

m = 0: a degree-zero divisor on a curve is homologically trivial.

**Checks.**

- m = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

Use [Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); **EtaleDualityAndPerverseSheaves EDC.6**; **DerivedDeRhamCohomology DD.2**.

The source for this target is **BDP13**, §2.3, Proposition 2.7, p. 1063.

<a id="etale-abel-jacobi-map"></a>

### GH.1.5: BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

The exactness uses m ≥ 1: ε_X H^{2m−1}(X_P)(m) = 0, and ε_X H^{2m}(X_P)(m)^0 = ε_X H^{2m}(X_P)(m) because ε_X H^{2m+2}(X_m) = 0.

The target is rational continuous Galois cohomology. Its Gysin sequence and Ext¹-to-H¹ identification, including support/rational-equivalence independence, are explicit EDC.6, R02.1 and SF.5 requests. The integral lattice and projector denominators are the separate integral-abel-jacobi-comparison node.

The construction must provide the following operations and identities.

- `ajEt_add`: The map is additive on projected null-homologous cycles.
- `ajEt_correspondence`: A correspondence acts compatibly on cycles and the coefficient representation.
- `ajEt_restriction`: Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′).
- `ajEt_extension`: The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary.

Gysin sequence for the smooth divisor X_P ⊂ X_m with complement X_m^♮, twisted by (m + 1) (finite-coefficient EDC.3 followed by the requested EDC.6 rational passage).

Apply ε_X, which preserves X_P and X_m^♮ because it preserves the fibres of π_m. Then ε_X H^{2m−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree m), and ε_X H^{2m+2}(X_m) = 0, giving the short exact sequence.

cl_P(Δ) ∈ ε_X H^{2m}(X̄_P)(m). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (requested ArithmeticGaloisDuality R02.1 continuous-representation Ext/H¹ comparison) is AJ^et_F(Δ).

For support enlargement and rational-equivalence independence, use the requested rational Gysin compatibility and Chow-cycle Abel–Jacobi comparison. BDP Remark 3.2 cites Nekovář Proposition II.2.4; compact inflation–restriction alone does not prove this comparison.

The finite local condition is imposed on actual cohomology classes. This is used in [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections).

Fixes the cycle class normalization being compared with Howard’s point tower. This is used in [Higher-weight family specialization](#higher-weight-family-specialization).

**Checks.**

- `ajEt_zero`: The zero cycle gives the split extension and the zero cohomology class.
- `ajEt_lift_change`: Changing the lift by b adds precisely the coboundary g·b−b, with this sign.
- `ajEt_weight_zero`: On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison.
- m = 0 analogue: for P − ∞ on a curve, AJ^et is the Kummer class of the point of the Jacobian.

Use [BDP Proposition 2.7: Δ_φ is homologically trivial](#homological-triviality-of-generalized-heegner-cycles); **EtaleDualityAndPerverseSheaves EDC.3/gysin-sequence**; **SchemeAndStackFoundations SF.5**; **ArithmeticGaloisDuality R02.1**; **EtaleDualityAndPerverseSheaves EDC.6**.

The source for this target is **BDP13**, §3.1, p. 1065; **BDP13**, §3.1, Definition 3.1, p. 1066; **BDP13**, §3.1, Remark 3.2, p. 1067.

<a id="extensions-of-filtered-frobenius-modules"></a>

### GH.1.6: BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

Since H^{Φ=1} = 0, the map E^{Φ=1} → F^{Φ=1} = F is injective, and it is surjective because the extension of φ-modules splits (Φ − 1 is bijective on H by the weight hypothesis). This gives a φ-module splitting E = H ⊕ F with η^frob = (0, 1).

The filtration on E is determined by Fil⁰E = Fil⁰H + F·η^hol, with η^hol = (h, 1). Two choices give the same filtration iff h − h′ ∈ Fil⁰H.

Hence the class of h in H/Fil⁰H classifies the extension.

**Checks.**

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

Use **PadicHodgeTheory R06.2**; **PadicHodgeTheory R06.5**.

The source for this target is **BDP13**, §3.3, p. 1068; **BDP13**, §3.3, Proposition 3.5, p. 1069.

<a id="p-adic-abel-jacobi-map"></a>

### GH.1.7: The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m

Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding node; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

For the BDP §3.2 comparison, F/ℚ_p is finite unramified and C and X_m have specified smooth proper models over O_F. These are separate local hypotheses, imported with crystalline comparison and Nekovář’s containment theorem from PadicHodgeTheory R06.5.

In BDP’s selected conductor-c CM application, p∤cNd_K permits the stated choice of F and good models; the numerical condition is not a good-reduction certificate for an arbitrary CM twist. GH.0/cm-product-good-model supplies the product only after the W_m and A factors have their own models over the same O_F.

H = ε_X H^{2m+1}_dR(m + 1) has weight −1 < 0, as Proposition 3.5 requires.

Negative weight gives D_cris(V)^{φ=1}=0. Consequently H¹_e(F,V)=H¹_f(F,V), so the L1 logarithm, whose supplied domain is H¹_e, applies to the geometric finite class.

The construction must provide the following operations and identities.

- `ajP_etale`: AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification.
- `ajP_add`: AJ_p is additive in Δ.
- `ajP_pairing`: Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist.

AJ^et_F(CH^{m+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), requested from PadicHodgeTheory R06.5.

Faltings: ε_X H^{2m+1}_et(X̄_m)(m + 1) is crystalline with D_cris equal to ε_X H^{2m+1}_dR(X_m/F)(m + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2).

Use negative weight to exclude the Frobenius eigenvalue 1, identify H¹_f with H¹_e, then use the supplied L1 logarithm. The filtration identification is the separate projected-hodge-filtration node, not Künneth alone.

Proposition 3.5 with H = ε_X H^{2m+1}_dR(m + 1) of weight −1.

Poincaré duality makes Fil¹ε_X H^{2m+1}(m) and Fil⁰ε_X H^{2m+1}(m + 1) exact annihilators, so H/Fil⁰H = (Fil^{m+1} ε_X H^{2m+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology).

Fil^{m+1} ε_X H^{2m+1}_dR = S_{m+2}(Γ, F) ⊗ Sym^m H¹_dR(A) (GH.0/projected-hodge-filtration).

Allows the analytic primitive to evaluate the cycle extension. This is used in [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula).

Fixes the functional and periods in the squared formula. This is used in [BDP special value formula](#bdp-special-value-formula).

**Checks.**

- `ajP_zero`: A split étale extension has zero p-adic Abel–Jacobi functional.
- `ajP_filtration_independence`: Changing the Hodge lift by Fil⁰ does not change its quotient class.
- `ajP_sign`: The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class.
- m = 0: AJ_F(P − ∞)(ω_f) = ∫_∞^P ω_f, the Coleman integral, which BDP §3.6 recovers.
- Reject the inference from p∤N alone: y²=x³−25x at p=5 is a bad CM twist even when N=7; it does not satisfy the supplied-model hypothesis of this Abel–Jacobi comparison.
- For y²=x³−x at p=5 and level N=13, use its unit discriminant 64 and the supplied W_m model to form X_m over a common finite unramified O_F; pass those same model data to the GH.1 comparison.

Use [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); [BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight](#extensions-of-filtered-frobenius-modules); [Good model comparison for the CM product](#cm-product-good-model); **PadicHodgeTheory R06.5**; **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; **PadicHodgeRegulators L1/bloch-kato-logarithm**; [Projected Hodge filtration](#projected-hodge-filtration); [Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology).

The source for this target is **BDP13**, §3.2, pp.1067–1068; introduction, p.1040; **BDP13**, §3.2, Theorem 3.3, p. 1068; **BDP13**, §3.4, p. 1069; **BDP13**, §3.4, p. 1070.

<a id="integral-abel-jacobi-comparison"></a>

### GH.1.8: Integral Abel–Jacobi comparison

For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

The coefficient lattice and the f-projector denominator are fixed; r≥1; residual invariant vanishing is stated separately.

Track the localization of every correspondence in the Gysin sequence.

Use AGR R19.1’s integral newform-lattice comparison, then HS/compact-five-term to descend.

**Checks.**

- Integral descent fails without the invariant-vanishing input; rationalization alone does not remove a congruence denominator.

Use [Newform and CM coefficient projector](#newform-cm-projector); [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); **ArithmeticGaloisDuality R02.2/compact-five-term**.

The source for this target is **CH22**, §4.2, (4.2), pp.14–15.

<a id="character-projected-heegner-class"></a>

### GH.1.9: Character-projected Heegner class

For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, use the literal full symmetric-power module S=Sym^{2r−2}T_p(B)(1−r)⊗O_F, after the required coefficient extension. For an anticyclotomic χ of type (j,−j), −r<j<r, conductor c₀p^s with (c₀,Np)=1, choose the finite-order anticyclotomic χ_t of the same conductor, unique up to a Hilbert class character, so χ is a coefficient summand of S⊗χ_t. Apply its G_K-equivariant projector to the twisted finite-level class to define z_{f,χ,c}∈H¹(K_c,T⊗χ), as in (4.6), for c divisible by the conductor. The separately weighted corestriction (4.7) defines z_{f,χ}∈H¹(K,T⊗χ). Do not identify S with Ind_{G_H_K}^{G_K}Sym^{2r−2}T_p(A)(1−r): the printed isomorphism has unequal ranks: at r=1, Sym⁰ of the Weil-restricted Tate module has rank 1, whereas the induced Sym⁰ module has rank [H_K:K]. Integral projectors and the inclusion of the original A-coefficient class require the recorded CM.1 adapter.

CH §4.4 hypotheses and coefficient field containing CM and χ values.

The literal symmetric-power carrier and the chosen character summand must be checked independently of the false Sym/Ind identification. A finite-order χ_t is not necessarily unramified: only its ambiguity is a Hilbert class character. Integral eigenprojection requires a denominator calculation in CM.1.

The construction must provide the following operations and identities.

- `characterHeegnerClass_eigen`: With the character-projector law ρ(g)e_χ=χ(g)e_χ, the projected class satisfies ρ(g)z_χ=χ(g)z_χ. Idempotence alone asserts membership in the projector image and does not specify χ.
- `characterHeegnerClass_cores`: Corestriction commutes with the character projector after coefficient descent.
- `characterHeegnerClass_sum`: Weighted corestriction is additive in the conductor-indexed cycle classes.

Import the Weil restriction Tate module and CM characters, extend coefficients, and decompose the full symmetric power into monomial character lines; do not commute Sym with induction.

Use the chosen χ line in S⊗χ_t to project the finite-level class, following (4.5)–(4.6). Establish the requested integral projector and class inclusion separately.

Apply (4.7)’s weighted corestriction for the global class, retaining the distinction between z_{f,χ,c} and z_{f,χ}.

Provides the correctly twisted class whose local logarithm is evaluated. This is used in [Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula).

Supplies the actual nonzero class generating the Selmer space. This is used in [Rank-one Selmer consequence](#selmer-rank-one).

**Checks.**

- `characterHeegnerClass_trivial`: On the already selected trivial CM character component its projector is the identity. This does not assert identity on the entire symmetric-power coefficient module.
- `characterHeegnerClass_orthogonal`: Orthogonal idempotents kill the class projected to the other character.
- `characterHeegnerClass_add_test`: The construction agrees with the linear coefficient projection on a sum of two classes.
- A class merely valued in Sym^mT_p(A) is not yet a G_K class when A is only defined over H_K.

Use [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); **ComplexMultiplicationAndExplicitReciprocity CM.1**; **ArithmeticGaloisDuality R02.2/compact-five-term**.

The source for this target is **CH22**, §4.4–4.5, (4.5)–(4.7), pp.17–20.

The Weil restriction supplies a G_K action that A/H alone does not have.

<a id="parabolic-residue-pairing"></a>

### GH.1.10: Parabolic residue pairing

For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

BDP §3.5 good model, distinct residue disks, annuli and self-dual coefficient system; both classes parabolic.

Import the rigid/algebraic comparison and residue theorem.

Use the Cech–de Rham description and zero residue to eliminate dependence on horizontal constants.

**Checks.**

- Adding a horizontal constant changes no parabolic residue pairing.

Use [Good model comparison for the CM product](#cm-product-good-model); **SchemeAndStackFoundations SF.2**; **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; **PadicDifferentialEquationsAndRigidCohomology RD.4**; **PadicDifferentialEquationsAndRigidCohomology RD.3/overconvergent-f-isocrystal**.

The source for this target is **BDP13**, §3.5, Propositions 3.9–3.10, pp.1074–1075.

<a id="coleman-primitive"></a>

### GH.1.11: Coleman primitive for the modular differential

For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

The good unramified local model and overconvergent Frobenius isocrystal are supplied; the weight-separation lemma applies.

For the normalized section/differential construction, supply the connection, F-linear Frobenius, annihilator polynomial P with P(1)≠0, rigid section submodule and a normalization complement disjoint from the connection kernel. The input is in the range of the connection on normalized sections satisfying P(Φ)F∈rigid. BDP Theorem 3.15 and the requested RD.4 comparison must produce this range witness for ω_f; the constructor does not claim every arbitrary differential is integrable.

The construction must provide the following operations and identities.

- `colemanPrimitive_differential`: For the selected datum C and its integrable differential input ω, C.connection(colemanPrimitive(C,ω))=ω.
- `colemanPrimitive_frobenius`: Evaluate the datum’s actual polynomial P on its Frobenius operator: P(Φ)colemanPrimitive(C,ω) lies in C.rigid.
- `colemanPrimitive_choice`: Any section with the same differential differs from the constructed primitive by a section in the kernel of C.connection. Within the selected normalization complement this difference vanishes; globally weight zero retains constant ambiguity.

Import overconvergent Frobenius and solve locally by an analytic primitive.

Invert P(Φ) on horizontal sections to impose the rigid condition; glue and track the m=0 constant ambiguity.

Express the normalized analytic construction on the image of the admissible connection, rather than claiming a right inverse for an arbitrary map. The zero-kernel complement makes this preimage unique. A finite affine-disk realization tests the operator and normalization; it does not prove the global wide-open modular input theorem.

Computes the holomorphic extension term and kills the Frobenius term. This is used in [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula).

Relates component pairings to p-depleted modular forms. This is used in [Depleted Coleman component calculation](#coleman-depletion-calculation).

**Checks.**

- `colemanPrimitive_zero`: In the affine disk fixture of sections a+bX with evaluation-at-zero normalization, the constructed primitive of the zero differential is zero.
- `colemanPrimitive_constants`: For the constructed primitive of dX, adding the actual constant section 1 preserves the connection value 1 but changes the section and makes its value at zero equal to 1. Thus the unnormalized weight-zero uniqueness claim fails.
- `colemanPrimitive_residue_test`: For the same constructed primitive of dX, a constant change c contributes c times the X⁻¹ coefficient of dX to the residue pairing. That coefficient is zero, so the change contributes zero; no assumed zero bilinear pairing replaces the residue functional.
- `colemanPrimitive_nonzero`: On affine sections a+bX, use ∇(a+bX)=b dX, Φ(X)=5X, P(T)=T−5 and F(0)=0. Compute colemanPrimitive(dX)=X, its connection is dX and P(Φ)X=0; P(1)=−4 is nonzero. An identically zero primitive fails this nonzero-input test.
- For m=0 an arbitrary constant remains; at m>0 no global horizontal section remains.

Use [Parabolic residue pairing](#parabolic-residue-pairing); **PadicDifferentialEquationsAndRigidCohomology RD.4**; **PadicDifferentialEquationsAndRigidCohomology RD.3/overconvergent-f-isocrystal**.

The source for this target is **BDP13**, §3.6, Lemma 3.14, Theorem 3.15 and Remarks 3.16–3.17, pp.1076–1078.

<a id="coleman-abel-jacobi-formula"></a>

### GH.1.12: Coleman Abel–Jacobi formula

For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

BDP §3.7 local hypotheses; 0≤j≤m; normalized isogeny differential.

Use the parabolic residue formula on the extension defining AJ_p.

The holomorphic term is the evaluation at the CM point (Lemma 3.19). The Frobenius term vanishes by P(1)≠0 and the rigid residue theorem (Lemma 3.20).

Apply the projection formula to the isogeny graph and φ*η′=dη.

**Checks.**

- At j=0 the degree factor is 1; at j=m it is d^m.

Use [The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m](#p-adic-abel-jacobi-map); [Coleman primitive for the modular differential](#coleman-primitive); [Parabolic residue pairing](#parabolic-residue-pairing).

The source for this target is **BDP13**, §3.7, Propositions 3.18, 3.21 and Lemma 3.22, pp.1078–1084.

<a id="coleman-depletion-calculation"></a>

### GH.1.13: Depleted Coleman component calculation

For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

0≤j≤m; ordinary locus; supplied q-expansion principle and inverse θ on p-depleted forms.

Use the connection and unit-root splitting to obtain the component recurrence.

Check the q-expansion and apply the imported q-expansion principle.

**Checks.**

- The coefficient of q^n, p∤n, is j! a_n/n^{j+1}; at j=0 it is a_n/n.

Use [Coleman primitive for the modular differential](#coleman-primitive); **ModularCurvesPartII R14.3**; **AutomorphicPadicLFunctions L3h**.

The source for this target is **BDP13**, §3.8, Proposition 3.24, (3.8.5)–(3.8.6), pp.1086–1088.

<a id="syntomic-abel-jacobi-comparison"></a>

### GH.1.14: Syntomic Abel–Jacobi comparison

For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. Require this higher-dimensional extension of D.2 with its precise comparison.

Good model, cycle support extension and the same Tate and Frobenius conventions as AJ_p.

Import the generic syntomic complex and Chern class formalism.

Obtain the higher-dimensional cycle regulator and compare its Gysin extension with the étale one. The regulator is used only after this comparison is supplied.

**Checks.**

- At weight zero the syntomic regulator must reproduce the Abel–Jacobi/Kummer comparison, including the Frobenius factor.

Use **PadicHodgeRegulators D.2**; [The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m](#p-adic-abel-jacobi-map); [Good model comparison for the CM product](#cm-product-good-model).

The source for this target is **BDP13**, §3.4, pp.1068–1070.

<a id="classical-generalized-cycle-comparison"></a>

### GH.1.15: Classical and generalized cycle comparison

Put r1≥r2≥0 of the same parity, u=(r1−r2)/2, X_r1,r2=W_r1×A^r2, and let a be prime to N. BDP17 Proposition 4.1.1 supplies a rational algebraic correspondence P:X_r1,r1 → X_r1,r2 with P_*Delta_r1,a=(Na)^u Delta_r1,r2,a. At a place of good reduction and for 0≤j≤r2, Proposition 4.1.2 gives (Na)^u beta_v(Delta_r1,r2,a)[omega wedge omega_A^j eta_A^(r2−j)] = (2 sqrt(−D_K))^u beta_v(Delta_r1,a)[omega wedge omega_A^(j+u) eta_A^(r2−j+u)]. For r1=2r−2,r2=0,u=r−1 this is the classical/generalized Abel–Jacobi evaluation adapter used by Castella Theorem 6.5. Global etale transport uses the actual P and Abel–Jacobi functoriality; the displayed scalar evaluation alone does not identify integral global classes. The half-unit u_c0=|O_c0^times|/2 in Castella is a separate tower/trace normalization.

BDP17 §4.1 ideal Heegner hypothesis, CM level point, r1≥r2 of equal parity, a prime to N, and a number field defining all objects; both varieties have good reduction at v. The normalized CM differential and conjugate line satisfy their fixed cup pairing.

The correspondence is rational. Any integral class comparison records its projector, isogeny-degree and lattice denominators; a scalar identity in de Rham functionals does not make those denominators units.

Use the graph of sqrt(−D_K) on each of the u paired CM factors to form P, as in BDP17 Proposition 4.1.1. Verify the graph intersections and signed projectors give (Na)^u, retaining rational coefficients.

By functoriality move P from the cycle to the test differential. The projected Kunneth class of the transpose CM graph contributes 2 sqrt(−D_K) per pair; the pure-factor cup terms vanish under the sign projector. This is Proposition 4.1.2, pp.40–41.

Specialize r2=0 and compare the actual etale realization of P through GH.1 integral comparison before applying the family class theorem. Compute the full/half CM-unit trace factor independently at conductor zero.

**Checks.**

- u=0 gives the identity correspondence and scalar 1. At r=2,r2=0, the single CM pair contributes 2 sqrt(−D_K), not its inverse. No arbitrary nonzero factor is declared a p-adic unit.

Use [Character-projected Heegner class](#character-projected-heegner-class); [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison).

The source for this target is **BDP17**, §4.1, Proposition 4.1.1, pp.38–40; Proposition 4.1.2, equation (4.1.5) and proof, pp.40–41; **Castella**, §6.2, proof of Theorem 6.5, p.28, equations (6.7)–(6.8).

<a id="degree-one-picard-kummer-comparison"></a>

### GH.1.16: Degree-one Picard–Kummer and Gysin comparison

For a smooth proper geometrically connected curve C/L of characteristic zero with L-rational basepoint and J=Pic0(C), let D=sum_s n_s[s] be a Galois-stable degree-zero divisor. Under J[p^a]=H1_et(C_bar,mu_p^a), the finite Gysin extension boundary associated to (n_s mod p^a)_s equals the Kummer cocycle of [O(D)] in H1(L,J[p^a]), with Gysin and connecting homomorphisms normalized by sigma(Q)−Q for p^a Q=[D]. Passing compatibly in a and then rationalizing identifies GH.1 AJ_et(D) with kappa_J([D]) in H1(L,V_pJ). For an actual quotient q:J→E this gives q_* AJ_et(D)=kappa_E(q[D]).

D is defined over L, or its finite support is treated as a Galois set; the support degree map includes residue degrees. Normalize the Poincare bundle at the basepoint and use the same Weil-pairing/Tate-twist convention in both exact sequences.

J and q are the actual Picard variety and modular quotient supplied by the curve/Jacobian owners. Continuous inverse limits require their cochain/derived-limit comparison; only the rational comparison is asserted before lattice bounds.

Choose a p^a-division line bundle M with M^(p^a)=O(D), and a trivialization on U=C minus support(D). Compute sigma(M)/M and the change of trivialization; the resulting cocycle is sigma(Q)−Q in Pic0[p^a].

Compare this cocycle with the extension obtained from the residue/Gysin sequence of U, retaining its degree-zero kernel and the same sign. Changing M or trivialization changes it by a coboundary.

Check transitions a+1→a, Galois descent and rational-equivalence independence; use the continuous comparison to pass to TpJ. Apply multiplication/Kummer naturality for q.

**Checks.**

- For D=[x]−[x0], obtain the Kummer class of aj(x), with sign fixed by sigma(Q)−Q. A principal divisor gives zero; changing x0 translates by the actual divisor degree and hence leaves degree-zero D unchanged.

Use [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); **ModularCurvesPartII R14.3**; **EtaleDualityAndPerverseSheaves EDC.6**.

The source for this target is **BDP13**, §2.3, Remark 2.6 and index-zero paragraph, pp.1062–1063; §§3.1–3.2, pp.1065–1068.

<a id="uniform-integral-factor-transport"></a>

### GH.1.17: Uniform integral transport on the selected newform factor

For the multiplicity-one f-factor selected in H1_et(C_bar,Qp) and its actual modular-quotient realization V, choose stable lattices T and Tprime. Construct Galois-equivariant integral maps a:T→Tprime and b:Tprime→T and a single nonzero d in O with ba=d id_T and ab=d id_Tprime. The maps induced on H1(E,−) for every finite ring-class E commute with restriction and corestriction, with the same d for all E. Consequently each induced kernel and cokernel, and their coherent inverse-limit versions, is annihilated by d. This asserts a bounded integral comparison, not an integral isomorphism unless d is a unit.

The chosen rational coefficient map is an isomorphism on this f-factor; no reverse identity on the whole Jacobian is claimed. The lattices are finite free over the same complete DVR after a fixed coefficient extension.

Track the auxiliary fine-level degree, rational idempotent denominator and modular quotient isogeny/congruence denominator in d. None may depend on the ring-class level.

Import the rational selected-factor map from AGR and the modular quotient. In fixed finite lattice bases clear denominators of this map and its inverse once; multiply the clearing scalars to obtain d and the two integral maps.

Galois equivariance passes to continuous cochain complexes; naturality gives restriction/corestriction commutativity at every field.

Apply the two composite identities on cochains, then cohomology. In inverse limits use the compatible reverse map to lift d times a coherent class; no right-exactness of inverse limit is assumed.

**Checks.**

- On O^2 take a=diag(pi,1), b=diag(1,pi), d=pi: both composites are pi id but a is not an O-isomorphism. The maps diag(pi^n,1) with varying n fail a fixed nonzero bound.

Use [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); **AutomorphicGaloisRepresentations R19.1/integral-structure-of-the-newform-premotive**; **ModularCurvesPartII R14.3**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**.

The source for this target is **BDP13**, §2.3, pp.1062–1063; §3.1, pp.1065–1066; **Mathlib quotient modules**, LinearAlgebra/Quotient/Basic.lean: Submodule.mapQ, ker_mapQ; Algebra/Module/Submodule/Ker.lean: LinearMap.ker_eq_bot.

<a id="degree-one-local-realisation"></a>

### GH.1.18: Local degree-one comparison over conductor fields

For every finite extension E/L_v in the ring-class tower, including ramified E, and every E-rational degree-zero divisor D on the good-reduction curve, the Picard–Kummer/Gysin comparison over E agrees with the Bloch–Kato logarithm after the canonical map D_dR,Lv(V) tensor E ≅ D_dR,E(V). Pairing with the quotient differential satisfies log_E(q_*AJ_et,E(D))(omega_E)=c_pi AJ_dR,E(D)(omega_f) when pi*omega_E=c_pi omega_f. Restriction on finite local cohomology commutes with scalar extension of log, and corestriction is adjoint to field trace under this pairing.

Good reduction/de Rham and the actual H1_f logarithm domain are retained. An E-rational divisor need not descend to Lv. The BDP13 finite-unramified F comparison is used only with its own model hypotheses; it is not invoked over arbitrary ramified E without the local comparison theorem.

The quotient map, comparison isomorphisms, filtration quotient and differential functional are fixed geometrically, not by an arbitrary nonzero linear functional.

Apply the finite Picard–Kummer comparison over E itself and the supplier Bloch–Kato/crystalline comparison in the degree-one good-reduction range.

Use functoriality for q and the equality of pulled-back differentials to compute the scalar c_pi.

Prove restriction/log and corestriction/trace squares on the cochain/comparison maps, then check their pairings before taking any tower limit.

**Checks.**

- Over E=Lv recover the original differential comparison. Under a finite ramified extension, compute the E-rational CM divisor directly, not solely the restriction of an Lv-class. Squaring a comparison with c_pi gives c_pi^−2 in the inverse squared-log formula.

Use [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Good model comparison for the CM product](#cm-product-good-model); **PadicHodgeRegulators L1**; **PadicHodgeTheory R06.5**.

The source for this target is **BDP13**, §§3.2–3.4, pp.1067–1070.

### Examples

For C=E, basepoint the origin and quotient the identity, the corrected divisor [P]−[0] maps to the rational Kummer class of P. Pulling back 3ω_f gives a factor 3 in the logarithm and 1/9 in the inverse squared-log substitution.

### Dependencies

**HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; Tau Ceti `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; [The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting); [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); **SchemeAndStackFoundations SF.5**; [Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); **EtaleDualityAndPerverseSheaves EDC.6**; **DerivedDeRhamCohomology DD.2**; **EtaleDualityAndPerverseSheaves EDC.3/gysin-sequence**; **ArithmeticGaloisDuality R02.1**; **PadicHodgeTheory R06.2**; **PadicHodgeTheory R06.5**; [Good model comparison for the CM product](#cm-product-good-model); **EtaleDualityAndPerverseSheaves EDC.2:pairings/adic-and-rational-poincare-duality**; **PadicHodgeRegulators L1/bloch-kato-logarithm**; [Projected Hodge filtration](#projected-hodge-filtration); [Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology); [Newform and CM coefficient projector](#newform-cm-projector); **ArithmeticGaloisDuality R02.2/compact-five-term**; [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); **SchemeAndStackFoundations SF.2**; **PadicDifferentialEquationsAndRigidCohomology RD.4**; **PadicDifferentialEquationsAndRigidCohomology RD.3/overconvergent-f-isocrystal**; **ModularCurvesPartII R14.3**; **AutomorphicPadicLFunctions L3h**; **PadicHodgeRegulators D.2**; **AutomorphicGaloisRepresentations R19.1/integral-structure-of-the-newform-premotive**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **PadicHodgeRegulators L1**.

<a id="layer-gh-2"></a>

## Layer GH.2: Euler-system relations and local conditions

<a id="cycle-norm-relations"></a>

### GH.2.1: Heegner cycle norm relations

For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators and requires an additional normalization check; it is not asserted by Proposition 4.4 in the 2022 copy.

CH canonical CM data, p∤c, r≥1, prime-to-projector denominators and the displayed conductor exclusions.

Classify conductor-changing Hecke neighbors using HE.2.

Compare graph cycles in the Néron–Severi group: the predecessor term contributes p^{2r−2}; use the torsion-translation invariance of the projected graph.

Apply the f-projector, AJ functoriality and CM coefficient projection.

**Checks.**

- For r=1 the predecessor coefficient is 1; for r=2 it is p².

Use [Character-projected Heegner class](#character-projected-heegner-class); [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); **HeegnerPointEulerSystems HE.2/cm-hecke-conductor-classification**.

The source for this target is **CH22**, §4.3, Proposition 4.4 and (4.3)–(4.4), pp.15–17.

<a id="cycle-conjugation"></a>

### GH.2.2: Complex conjugation of Heegner classes

With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

The decomposition N O_K=𝔑 𝔑̄ and geometric/Artin normalization are fixed.

Apply the Atkin–Lehner correspondence to the conjugate graph; the cycle comparison has N^{r−1}.

Use CH Lemma 4.5’s weighted Galois action to absorb the norm factor.

**Checks.**

- At χ=1 the remaining sign is w_f and the fixed σ_N action.

Use [Character-projected Heegner class](#character-projected-heegner-class); **ModularCurvesPartII R14.3**; **ComplexMultiplicationAndExplicitReciprocity CM.1**.

The source for this target is **CH22**, §4.4, Lemma 4.6, p.18.

<a id="cycle-frobenius-congruence"></a>

### GH.2.3: Frobenius congruence for cycle classes

For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

Compatible local embeddings; good reduction at ℓ; inert conductor-changing prime.

Import the geometric CM reduction congruence from HE.2.

Apply the graph correspondence, smooth specialization, AJ functoriality and local restriction.

**Checks.**

- The local Frobenius acts on the untwisted module because χ is trivial at this inert place.

Use [Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems HE.2/inert-reduction-frobenius-congruence**; **PadicHodgeTheory R06.5**.

The source for this target is **CH22**, §4.4, Lemma 4.7, pp.18–19.

<a id="finite-local-abel-jacobi-class"></a>

### GH.2.4: Finite local Abel–Jacobi class

At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

Good models, admissible Hodge interval p>2r−1, and absolute unramifiedness when Fontaine–Laffaille is used.

Use the geometric crystalline extension theorem at p and proper smooth specialization away from p.

Import propagation and lattice comparison of local conditions; use CH Lemma 7.5 only with its erratum hypothesis.

**Checks.**

- A relatively unramified extension of a ramified base is still ramified over Q_p.

Use [Good model comparison for the CM product](#cm-product-good-model); [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); **SelmerIwasawaCohomology L4/bloch-kato-condition**; **SelmerIwasawaCohomology L2/condition-propagation**; **PadicHodgeTheory R06.5**.

The source for this target is **CH22**, §7.3, Lemma 7.5 and Proposition 7.6, p.31; **CH erratum**, Second correction, entire one-page erratum.

<a id="local-condition-at-p-and-the-castella-hsieh-corrections"></a>

### GH.2.5: Corrected derivative local condition

For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

KO Condition 2.3 requires p∤6h_K and, in a fixed integral basis of T_f, a Galois image containing {g∈GL₂(ℤ_p): det(g)∈(ℤ_p×)^{2r−1}}. Retain the KO setup and CH specialization hypotheses, P≠pΛ, and the matched coefficient and local regulator normalizations. Apply the integral Ω and twisting interface PHR2.0, rather than inferring its integral image from the cyclotomic L3 map.

Lift h∈R̃₁^{ψ=0}⊗D_cris(V_f)^{φ=α}(r) to h′ over the conductor coefficient ring using surjectivity of unramified trace.

Apply the integral Ω map to h′; use norm compatibility and the finite local pairing (KO (4.49)–(4.50)).

KO Lemma 4.7 makes regulator images orthogonal. Apply conjugation at p̄ and ordinary/regulator-image comparison where its hypotheses hold.

**Checks.**

- The same conclusion over a ramified local field cannot be deduced from the printed Fontaine–Laffaille proof.

Use [Finite local Abel–Jacobi class](#finite-local-abel-jacobi-class); [Complex conjugation of Heegner classes](#cycle-conjugation); **PadicHodgeRegulators L3**; [PadicHodgeRegulatorsPartII PHR2.0 contract](#supplier-phr2-0).

The source for this target is **KO**, §2.4, Condition 2.3, p. 13; §4, Lemma 4.7 p.42; Lemma 4.10 pp.44–45; (4.47) p.44 and (4.49)–(4.50) p.45; **CH erratum**, Second correction, p.1.

<a id="auxiliary-form-local-range"></a>

### GH.2.6: Local conditions in the BSD auxiliary-form range

Let g be an ordinary newform of weight k=2r≥2, p not dividing tame M, in exactly the ideal-Heegner/special-local range of Castella Birch erratum Theorem 2.3. Construct the graph/projected coefficient classes at this level and prove their stabilized/derived classes lie in the canonical self-dual Selmer local conditions: finite away from p except the specified transverse auxiliary condition, and the corrected finite/ordinary condition at p. The nonsplit tame primes permitted here are ramified in K and divide M exactly once; inert primes cannot satisfy O_K/mathfrak M ≅ Z/MZ. This theorem extends the all-split source range and is not an instance of CH (H).

p>3, p split in K, M≥3, ideal mathfrak M with O_K/mathfrak M ≅ Z/MZ; residual g|G_K irreducible; some nonsplit q exactly divides M; if 2 is nonsplit then 2 exactly divides M; at each nonsplit ell exactly dividing M, the source’s special representation is an unramified twist with ell sent to −ell^(r−1).

Keep all projector/lattice/integral-twist restrictions explicit. The condition p not dividing (2r−1)! cannot be imposed silently on unbounded congruence weights; either establish an integral construction without it or prove a source-valid replacement for the actual weight set.

Use BDP17 §4.1 ideal-Heegner CM level geometry, where ramified tame primes of exponent one are allowed, and the requested fine-level geometry/lattice interface. Construct actual integral coefficient maps and record denominators.

Extend the tame norm/Frobenius calculation at good auxiliary primes and compute the bad ramified-tame local condition using the stated special type and residual ramification/control; the all-split calculation is not treated as that proof.

Apply the CH erratum via KO20 Lemma 4.10 at p, verifying the integral Ω/twist hypotheses for this coefficient lattice and conductor field. The actual nonsplit local and unbounded-weight integral verifications are additional local and integral obligations.

**Checks.**

- A level containing an inert prime fails the ideal Heegner input. An all-split level cannot simultaneously supply the required nonsplit q. For fixed p, arbitrarily high r makes p divide (2r−1)!, rejecting a uniform appeal to CH (H).

Use [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); **AutomorphicGaloisRepresentations R19.1**; **ModularCurvesPartII R14.3**.

The source for this target is **BSD erratum**, Theorem 2.3 and proof, pp.3–4; **BDP17**, §4.1, p.38; **CH erratum**, Lemma 7.5/Proposition 7.8 correction, p.1.

Precise auxiliary-form range and local theorem calls; does not independently prove the range extension.

### Examples

At an inert auxiliary ℓ, the norm relation gives a_ℓ times the lower class; membership in the p-local finite condition is a separate assertion. A ramified conductor field requires the KO replacement for the derivative argument.

### Dependencies

[Character-projected Heegner class](#character-projected-heegner-class); [BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); **HeegnerPointEulerSystems HE.2/cm-hecke-conductor-classification**; **ModularCurvesPartII R14.3**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; **HeegnerPointEulerSystems HE.2/inert-reduction-frobenius-congruence**; **PadicHodgeTheory R06.5**; [Good model comparison for the CM product](#cm-product-good-model); [Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); **SelmerIwasawaCohomology L4/bloch-kato-condition**; **SelmerIwasawaCohomology L2/condition-propagation**; **PadicHodgeRegulators L3**; [PadicHodgeRegulatorsPartII PHR2.0 contract](#supplier-phr2-0); [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); **AutomorphicGaloisRepresentations R19.1**.

<a id="layer-gh-3"></a>

## Layer GH.3: Ordinary stabilization and universal norms

<a id="ordinary-stabilized-class"></a>

### GH.3.1: Ordinary stabilized Heegner class

For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

r≥1, p split, ap unit; lattice integral away from the recorded denominators; compatible Artin operators.

The construction must provide the following operations and identities.

- `stabilizedClass_upper`: At positive p-conductor the subtraction coefficient is p^{2r−2}/α.
- `stabilizedClass_bottom`: The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators.
- `stabilizedClass_trace`: With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}.
- `stabilizedClass_integral`: The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice.

Use the unit-root factorization and the split predecessor relation.

Separate the bottom conductor case and track the source’s full-unit convention; the first-step trace adapter must also be proved.

Multiplying the conductor-n class by α^{-n} gives norm compatibility. This is used in [Iwasawa Heegner class](#iwasawa-heegner-class).

Tracks the unit convention before identifying Howard’s specialization. This is used in [Initial family specialization](#initial-family-specialization).

**Checks.**

- `stabilizedClass_weight_two`: For r=1 the predecessor coefficient is α⁻¹.
- `stabilizedClass_zero_predecessor`: A zero predecessor leaves the current class unchanged.
- `stabilizedClass_root_relation`: The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation.
- At r=1 the upper-layer subtraction is α⁻¹z_{c/p}; the bottom layer still has two Artin operators.

Use [Heegner cycle norm relations](#cycle-norm-relations); [Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**.

The source for this target is **CH22**, §5.2, Definition 5.2, p.22.

<a id="stabilized-first-step-adapter"></a>

### GH.3.2: First-step stabilization adapter

The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

p∤c and the same geometric graph and AJ normalization in all three sources.

Import the first-step Heegner neighbor classification.

Compute the unit orbit multiplicities of the higher-weight graph cycle and both split ideal terms.

Substitute the unit-root relation; establish the normalization adapter before using an inverse limit.

**Checks.**

- The classical weight-two first-step check must reproduce the full versus half unit scaling.

Use [Ordinary stabilized Heegner class](#ordinary-stabilized-class); **HeegnerPointEulerSystems HE.2/split-ramified-first-step-recurrence**; [Classical and generalized cycle comparison](#classical-generalized-cycle-comparison).

The source for this target is **CH22**, §5.2, Lemma 5.3, p.22.

States the trace that needs the bottom-layer calculation.

<a id="iwasawa-heegner-class"></a>

### GH.3.3: Iwasawa Heegner class

After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

ap unit, compatible stable lattice, trace lemma including n=0, continuous coefficient twist.

The construction must provide the following operations and identities.

- `iwasawaClass_level`: The conductor-n projection is α^{-n}z_n.
- `iwasawaClass_norm`: The normalized sequence is corestriction compatible.
- `iwasawaClass_character`: A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class.

Normalize by α^{-n}; use the exact trace equation at every layer.

Use IW and iwasawa-shapiro rather than rebuilding Iwasawa cohomology.

Take the finite Δ projection or corestriction before passing to the Γ module.

Supplies the functional class in the reciprocity law. This is used in [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity).

Supplies the inverse-limit class to which derivative operators are applied. This is used in [Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class).

**Checks.**

- `iwasawaClass_bottom`: The bottom projection has normalization α⁰=1.
- `iwasawaClass_unit_one`: If α=1 the sequence is unchanged.
- `iwasawaClass_sign`: At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n.
- Corestriction of α^{-(n+1)}z_{n+1,α} equals α^{-n}z_{n,α}.

Use [First-step stabilization adapter](#stabilized-first-step-adapter); **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **SelmerIwasawaCohomology L3/iwasawa-shapiro**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**.

The source for this target is **CH22**, §5.2, (5.1), (5.5) and Lemma 5.4, pp.23–24.

<a id="longo-vigni-trace-polynomials"></a>

### GH.3.4: Longo–Vigni trace polynomials

In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

Even k≥4, LV coefficient and tower conventions, finite quotient split from Γ; ordinary ap.

The construction must provide the following operations and identities.

- `tracePolynomial_initial`: The first two values are γ₀ and γ₁.
- `tracePolynomial_recurrence`: γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m.
- `tracePolynomial_remainder`: The higher terms equal q_mΦ plus the explicitly p-divisible remainder.

Obtain the raw trace sequence from the cycle norm recurrence and finite quotient corestriction.

Apply the polynomial recurrence and LV Lemma 4.2’s inductive division.

Controls the stable image of the corestriction sequence. This is used in [Trace polynomial intersection theorem](#trace-polynomial-intersection).

Pins the bottom universal-norm class Φz_n. This is used in [Universal norm Heegner class](#universal-norm-heegner-class).

**Checks.**

- `tracePolynomial_two`: The second recurrence value is apγ₁−qγ₀.
- `tracePolynomial_zero`: Zero initial values give the zero sequence.
- `tracePolynomial_error_power`: At k=4,m=2 the displayed LV remainder exponent is 2. No p⁴ divisibility follows from that displayed exponent alone; a particular remainder may have additional divisibility.
- γ₂ has leading term Φ; the error has p^{k/2} divisibility.

Use [Heegner cycle norm relations](#cycle-norm-relations); **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; Mathlib `LinearMap`.

The source for this target is **LV16**, §4.2, Lemmas 4.1–4.2, p.12.

<a id="trace-polynomial-intersection"></a>

### GH.3.5: Trace polynomial intersection theorem

For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

LV tower and p-adic finite coefficient ring; a_p unit; finitely generated M.

Reduce q_m modulo p, showing the successive q_m are units.

Use the increasingly p-divisible remainder and p-adic completeness to compute the stable intersection.

**Checks.**

- Multiplying a generator by a unit changes its value but not the principal ideal.

Use [Longo–Vigni trace polynomials](#longo-vigni-trace-polynomials).

The source for this target is **LV16**, §4.2, Corollary 4.3, p.12.

<a id="universal-norm-heegner-class"></a>

### GH.3.6: Universal norm Heegner class

Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

LV admissible triple; finite quotient of order prime to p; tower control.

The additive compactness construction takes a specific compact Hausdorff norm tower, closed level subgroups, continuous vertical/tame maps, the input z and its operator Φ. Finite solvability is joint: for every finite conductor/edge set and finite height there is a partial family satisfying membership, bottom, norm and tame equations. The source trace modules prove this finite condition before compactness supplies the infinite family. This is weaker than assuming the desired infinite lift; independent choices at each conductor are insufficient. Vertical and tame maps preserve their selected level groups and the vertical/tame corestriction square commutes.

The construction must provide the following operations and identities.

- `universalNormClass_bottom`: The constructed joint family has β₀[n]=Φz_n, using the Φ and z supplied to that construction.
- `universalNormClass_norm`: The supplied tower’s cor_m[n] sends β_{m+1}[n] to β_m[n]; these are not laws for subsequently chosen unrelated maps.
- `universalNormClass_tame`: For an edge nℓ→n of the same supplied tower, its tame corestriction sends β_m[nℓ] to a_ℓβ_m[n]. Both values belong to one simultaneously selected family.
- `universalNormClass_exists`: Joint finite solvability in a compact Hausdorff tower implies a nonempty carrier of families satisfying every bottom, membership, vertical norm and tame equation. The proof uses closed constraints and the finite intersection property.

Use LV Corollary 4.3 and the presented trace modules in Proposition 4.5 to lift Φx at every finite height. This verifies finite solvability, not surjectivity of arbitrary corestriction maps.

For a fixed finite divisor set, transport a common presented-module lift through its conductor maps. Their commuting tame squares give a jointly compatible family; separate conductor-by-conductor choices do not provide this.

Use compactness first for the height limit and then for all finite divisor sets. Closed coordinate constraints give a family in the actual inverse-limit carrier with the prescribed bottom and tame laws. Apply this compactness argument to the varying Galois cohomology carriers and coefficient-linear transitions supplied by SelmerIwasawaCohomology L3.

Provides conductor-indexed universal norms for differentiation. This is used in [Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class).

Defines the generator module H∞ whose nonvanishing is established separately. This is used in [Universal norm module of rank one](#universal-norm-module-rank-one).

**Checks.**

- `universalNormClass_bottom_test`: In the compact Z/5 fixture with Φ=2, z_0=1 and z_n=3 for n>0, the actual constructed bottom values are β_0[0]=2 and β_0[1]=1; β_0[0] differs from z_0. This detects dropping Φ.
- `universalNormClass_zero`: The constructor explicitly selects the zero family for zero geometric input, in the same fixed norm tower.
- `universalNormClass_two_steps`: In that fixture the vertical norm is multiplication by 2. The constructed components at conductor 0 are β_1=1 and β_2=3, and two applications of the actual corestriction give β_0=2. Replacing corestriction by zero fails the first nonzero bottom constraint.
- `universalNormClass_tame_test`: In the same simultaneously constructed Z/5 family, the tame edge 1→0 has identity corestriction and a_ℓ=3. At height 1, β_1[1]=3 while β_1[0]=1, so the actual tame equation is 3=3·1.
- The bottom class is Φz_n, not simply z_n.

Use [Trace polynomial intersection theorem](#trace-polynomial-intersection); **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **SelmerIwasawaCohomology L4/bloch-kato-condition**.

The source for this target is **LV16**, §4.2, Definition 4.4 and Proposition 4.5, p.13.

<a id="finite-character-moment-descent"></a>

### GH.3.7: Finite-character moments and exact conductor

Retain G_n=Gal(K_c0p^n/K) and its finite class component. For an O-valued finite-order character chi of exact last conductor n, the continuous Shapiro evaluation of the integral inverse-limit class is the descent of alpha^−n sum_{g in G_n} chi(g) z_n^g in the specified chi^−1 coefficient convention. If H_n is the last conductor kernel and the restricted lower class is H_n-invariant, the weighted lower term of z_n−(p^(2r−2)/alpha) res(z_n−1) at weight 2r vanishes when chi|H_n is nontrivial. No cancellation of a nonzero scalar in a torsion cohomology module is used. Finite-component traces and unit indices remain explicit.

Choose coefficients containing all chi values and the fixed Shapiro inversion convention; exact conductor means nonfactorization through G_n−1, as supplied by HE.0.

The stable integral system, bottom normalization and coefficient projections already exist. Use the actual quotient action, restriction and twisted descent, not a formal group sum in an unrelated module.

Apply the Iwasawa Shapiro map and evaluate the coefficient character on continuous cochains; compare the finite quotient formula with the unnormalized weighted class.

Use the ring-class conductor kernel theorem to translate exact conductor into nontriviality on H_n; prove the lower restriction image is H_n-fixed by restriction naturality.

Sum over H_n cosets. Apply existing scalar character orthogonality in an integral-domain coefficient ring and only then let the zero scalar act on the possibly torsion module.

**Checks.**

- For C4 and H={0,2}, the character (−1)^g is nontrivial on C4 but trivial on H; an H-invariant lower term need not cancel. Over Z and a Z/8-module, cancellation for the C2 sign character holds coefficientwise.

Use [Iwasawa Heegner class](#iwasawa-heegner-class); [Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems HE.0/conductor-change-kernel**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **SelmerIwasawaCohomology L3/iwasawa-shapiro**; Mathlib `MulChar.sum_eq_zero_of_ne_one`; Mathlib `Equiv.prod_comp`.

The source for this target is **CH22**, §5.2, equation (5.1) and Lemma 5.4, p.23.

Finite-character moment and primitive cancellation; Rubin’s lemma cited there does not replace construction of the actual coefficient map.

### Examples

At weight two, p=5 and α=2, the positive expression on z=5 and lower=4 is 3; at weight four it is −45. For the initial algebraic fixture of GH.8 the normalized bottom is 1/4, so the first trace cannot be replaced by a degree-p tail formula.

### Dependencies

[Heegner cycle norm relations](#cycle-norm-relations); [Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **HeegnerPointEulerSystems HE.2/split-ramified-first-step-recurrence**; [Classical and generalized cycle comparison](#classical-generalized-cycle-comparison); **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **SelmerIwasawaCohomology L3/iwasawa-shapiro**; Mathlib `LinearMap`; **SelmerIwasawaCohomology L4/bloch-kato-condition**; **HeegnerPointEulerSystems HE.0/conductor-change-kernel**; Mathlib `MulChar.sum_eq_zero_of_ne_one`; Mathlib `Equiv.prod_comp`.

<a id="layer-gh-4"></a>

## Layer GH.4: Explicit reciprocity in fixed weight

<a id="bdp-special-value-formula"></a>

### GH.4.1: BDP special value formula

Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. The underlying GL₂ square-root distribution and its interpolation are imported from L3h. GZ.9 consumes the m=0 specialization of this one owner; quaternionic formulas and exceptional branches remain in GZ.9.

All five clauses of BDP Assumption 5.12; CM differential, periods, representatives and geometric reciprocity fixed.

Import BDP’s p-adic modular interpolation and continuity from L3h; approximate the noninterpolating character by characters in Σ_cc^(2).

Apply the depleted Coleman component calculation to the continued negative θ power.

Use the p-depletion Euler identity, change the ideal class variables, and apply the isogeny degree d=cN(a) in the Coleman AJ formula.

**Checks.**

- At m=j=0 the factorial and c power are 1; the degree-zero correction remains. A vanishing Euler polynomial forces this special value to vanish without forcing each cycle to vanish.

Use [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); [Depleted Coleman component calculation](#coleman-depletion-calculation); **AutomorphicPadicLFunctions L3h**.

The source for this target is **BDP13**, §5.3, Assumption 5.12 and Theorem 5.13, pp.1137–1139.

<a id="cm-differential-scaling"></a>

### GH.4.2: CM differential scaling

Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

Nonzero a and the pairing normalization ⟨ω_A,η_A⟩=1.

Use multilinearity of the symmetric tensor evaluation and the reciprocal normalization of η.

Square and compare the signed period exponent on the other side.

**Checks.**

- For m=2,j=0 the evaluation scales by a^{-2}; using a^0 from natural subtraction fails.

Use [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); [BDP special value formula](#bdp-special-value-formula).

The source for this target is **BDP13**, §1.4, (1.4.2) and (1.4.6), pp.1052–1053.

<a id="ramified-character-abel-jacobi-formula"></a>

### GH.4.3: Ramified character Abel–Jacobi formula

In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

CH setup and critical interval; exact ramified conductor n≥1; periods and geometric reciprocity fixed.

Relate the weighted corestriction class to the CM sum using Lemma 4.5.

Use the CM expansion of the p-adic L-function, the Gauss sum identity and the Coleman AJ evaluation.

For the cancellation using exact conductor n>1, establish the n=1 boundary separately; the boundary is a separate boundary calculation.

**Checks.**

- At j=0 the factorial is (r−1)! and the t factor is t^{1−2r}; squaring is not part of this equation.

Use [Character-projected Heegner class](#character-projected-heegner-class); [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); **AutomorphicPadicLFunctions L3h**.

The source for this target is **CH22**, §4.5, Theorem 4.9, pp.19–21.

<a id="fixed-weight-regulator-adapter"></a>

### GH.4.4: Fixed-weight regulator specialization

Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

Theorem 5.1 hypotheses: nonnegative Hodge–Tate weights, no trivial quotient and no invariants on the relevant tower; ordinary rank-one line and matched twists.

Apply the relative Lubin–Tate supplier contract PHR2.1 to the specified ordinary line; L3 supplies only its cyclotomic input.

Match the de Rham differential and t powers, then compare the interpolation factor at exact ramified characters.

**Checks.**

- The line unramified before a Tate twist need not stay unramified after the twist; ψ is part of the repair.

Use **PadicHodgeRegulators L3**; [Iwasawa Heegner class](#iwasawa-heegner-class); [Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula); [PadicHodgeRegulatorsPartII PHR2.1 contract](#supplier-phr2-1).

The source for this target is **CH22**, §5.1 and §5.3, Theorem 5.1, Lemma 5.5 and proof of Theorem 5.7, pp.21–25.

<a id="castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity"></a>

### GH.4.5: Castella–Hsieh explicit reciprocity law

Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

Ordinary f; ψ of type (r,−r) and conductor c₀ prime to Np; the first-step class adapter and regulator interpolation checked.

Use the preceding regulator adapter and CH 4.9 at a dense set of exact-conductor n>1 characters with j=0.

The epsilon identity contributes φ_p(−1), producing σ_{−1,p}; collect c₀^{r−1} and the sign.

Use boundedness (Lemma 5.5) and Weierstrass density to conclude equality of Iwasawa algebra elements.

**Checks.**

- After augmenting the Artin operator one still has −c₀^{r−1}; a measure equality without these factors is a different normalization.

Use [Fixed-weight regulator specialization](#fixed-weight-regulator-adapter); [Iwasawa Heegner class](#iwasawa-heegner-class); **AutomorphicPadicLFunctions L3h**.

The source for this target is **CH22**, §5.3, Theorem 5.7 and proof, pp.24–25.

<a id="dual-exponential-special-value"></a>

### GH.4.6: Dual exponential special value

CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

Ordinary f and CH’s locally algebraic character and period normalization; j≥r; α unit root.

Use the dual-exponential specialization of the regulator.

Combine CH 5.7 with the analytic interpolation and functional equation; square to express the normalized central complex value.

**Checks.**

- At positive conductor there is no unramified e′_p factor; a nonzero L-value gives nonzero local dual exponential.

Use [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **AutomorphicPadicLFunctions L3h**; **PadicHodgeRegulators L3**.

The source for this target is **CH22**, §5.3, Corollary 5.8, pp.25–26.

The squared exponential formula and the n=0/n>0 Euler factors are separate.

<a id="source-period-and-twist-transport"></a>

### GH.4.7: Transport of source periods, twists and differentials

Construct the coefficient/twist and de Rham-dual diagrams comparing CH22 Theorem 5.7 with Castella20 Theorem 5.3 at a permitted specialization. CH uses the functional omega_f tensor t^(−2r), the CM identities eta_A=t_A^−1 t and omega_A=t_A=Omega_p t, and scalar −c0^(r−1); the family source uses its xi^−1 twist, canonical omega_family pairing and a positive native reciprocity scalar. The transport must explain each Tate-period power, CM generator, full/half-unit and c0 factor through maps. At weight two, pullback of the elliptic functional is c_pi times the CH functional in the same completed coefficient ring. Each source equality is exported separately until this diagram is established.

Use precisely the arithmetic weights, tame/CM characters, Frobenius and geometric Artin conventions of the cited versions. A Tate-period vector is not a scalar unit in the coefficient ring.

Any localization coefficient map is defined only if the inverted lambda has nonzero image; primitive and squared/square-root conventions are fixed.

Write bases of the actual one-dimensional CM and Tate twists and their duals; compute the induced maps on tensors and pairings. Compare the printed t^(1−2r) family-proof presentation and CH22 t^(−2r) after their CM factor identification.

Use the geometric pullback pi*omega_E=c_pi omega_f and the CM generator identity CH (5.3) to compute the scalar functional, without selecting a new arbitrary basis to force equality.

Compute class tower normalization separately from analytic measure normalization; check −c0^(r−1), sigma_(−1,p), gamma/Euler factors and source periods on a common exact-character domain. Extend only by a proved density/control result.

**Checks.**

- At r=1 the c0-power is 1 but the CH minus sign remains. Rescaling omega_E by 3 multiplies the scalar log by 3; omitting sigma_(−1,p) changes its value at the sign character.

Use [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); [Finite-character moments and exact conductor](#finite-character-moment-descent); **AutomorphicPadicLFunctions L3h**.

The source for this target is **CH22**, §5.3, (5.3), Definition 5.6 and Theorem 5.7, pp.24–25; **Castella**, §5.1–5.2, Lemma 5.1 and Theorem 5.3, pp.21–25; §6.2 proof, pp.28–29.

### Examples

At r=1 the CH reciprocity scalar is −1, with σ_(−1,p) retained. A finite character taking value −1 on that Artin element reverses its evaluated sign. At m=2,j=0, differential rescaling contributes b⁻² to the evaluation.

### Dependencies

[Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); [Depleted Coleman component calculation](#coleman-depletion-calculation); **AutomorphicPadicLFunctions L3h**; [The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); [Character-projected Heegner class](#character-projected-heegner-class); **PadicHodgeRegulators L3**; [Iwasawa Heegner class](#iwasawa-heegner-class); [PadicHodgeRegulatorsPartII PHR2.1 contract](#supplier-phr2-1); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); [Finite-character moments and exact conductor](#finite-character-moment-descent).

<a id="layer-gh-5"></a>

## Layer GH.5: Higher-weight Kolyvagin systems

<a id="longo-vigni-admissible-triple"></a>

### GH.5.1: Longo–Vigni admissible triple

LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

LV §1–2 coefficient field and lattice conventions; all four admissibility clauses and its CM-unit restriction.

The construction must provide the following operations and identities.

- `admissibleTriple_exceptional`: Admissibility implies p∤6N(k−2)!φ(N)c_f.
- `admissibleTriple_classNumber`: Admissibility implies p∤h_K, so the bottom Hilbert class quotient has prime-to-p order; it does not assert that every auxiliary-conductor ring class quotient does.
- `admissibleTriple_ordinary`: The ordinary Fourier coefficient is a unit, not merely nonzero in F.
- `admissibleTriple_bigImage`: The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible.

Import the newform lattice and residual representation from AGR R19.1.

Form the actual exceptional set and check each arithmetic and image condition separately.

Provides the residual and finite-quotient input to H0–H5. This is used in [Higher-weight Howard hypotheses](#higher-weight-howard-hypotheses).

Limits the higher-weight Iwasawa application to the actual source hypotheses. This is used in [Higher-weight Iwasawa structure](#lambda-structure-consequence).

**Checks.**

- `admissibleTriple_two`: p=2 always belongs to the excluded set.
- `admissibleTriple_class_number`: If p divides h_K the triple is excluded even when its Fourier coefficient is a unit.
- `admissibleTriple_unit`: The ordinarity projection is Mathlib’s unit predicate in O_p.
- Ordinary a_p alone is insufficient; p∤h_K and the specified big image are independent requirements.

Use [Newform and CM coefficient projector](#newform-cm-projector); **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **AutomorphicGaloisRepresentations R19.1**.

The source for this target is **LV16**, §2.2, Definition 2.1 and Remark 2.2, pp.3–4.

<a id="higher-weight-howard-hypotheses"></a>

### GH.5.2: Higher-weight Howard hypotheses

For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

LV admissibility; coefficients and τ action fixed; all hypotheses of ES.5 stated by its exact supplier node.

Use the residual representation and solvable tower to show invariant vanishing.

Apply compact inflation–restriction to propagate this to specializations.

Check each local condition and pairing against ES.5/howard-hypotheses and use its auxiliary-prime theorem.

**Checks.**

- A self-dual pairing alone does not imply Cartesian propagation at p.

Use [Longo–Vigni admissible triple](#longo-vigni-admissible-triple); **EulerSystemsAndKolyvaginSystems ES.5/howard-hypotheses**; **ArithmeticGaloisDuality R02.2/compact-five-term**.

The source for this target is **LV16**, §5.1, verification of (H.0)–(H.5), pp.18–19; Lemma 2.4, p.5.

<a id="longo-vigni-local-assumptions"></a>

### GH.5.3: Longo–Vigni local assumptions

LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

LV §3.3 Assumption 3.2, rather than ordinarity alone; explicit local representation convention.

Write the local ordinary characters before and after the Tate twist.

Compare annihilators with the exact local duality pairing.

Check the two H⁰ groups and the control input; verify the twist on the actual local representation before applying control.

**Checks.**

- Multiplying an unramified character by a nontrivial cyclotomic power usually changes its inertia action.

Use [Longo–Vigni admissible triple](#longo-vigni-admissible-triple); **SelmerIwasawaCohomology L4/bloch-kato-condition**; **EulerSystemsAndKolyvaginSystems ES.5/howard-hypotheses**; **PadicHodgeRegulators L3**.

The source for this target is **LV16**, §3.3, Assumption 3.2, p.9.

<a id="specialization-control"></a>

### GH.5.4: Specialization and exceptional-prime control

LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

LV local assumptions, finite-exception exclusion, no residual tower invariants; finite degree specialization.

Use compact inflation–restriction and local-condition propagation to construct the specialization map.

Bound both global and local error terms and identify the finite exceptional set.

Feed the bounded comparison to ES.8’s patching hypothesis.

**Checks.**

- The pΛ prime is excluded from the unramified height-one comparison; its contribution is controlled separately.

Use [Higher-weight Howard hypotheses](#higher-weight-howard-hypotheses); [Longo–Vigni local assumptions](#longo-vigni-local-assumptions); **SelmerIwasawaCohomology L2/galois-selmer-group**; **ArithmeticGaloisDuality R02.2/compact-five-term**.

The source for this target is **LV16**, §3.4, Proposition 3.4, pp.10–11.

<a id="higher-weight-kolyvagin-class"></a>

### GH.5.5: Higher-weight Kolyvagin system

Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

LV admissible tower and the required local assumptions; choices of generators fixed then checked for independence; coefficient and admissible-prime ideals as in ES.5.

The construction must provide the following operations and identities.

- `correctedKolyvaginClass_unit`: The local correction is the inverse product of u_ℓ, with each u_ℓ a unit.
- `correctedKolyvaginClass_bottom`: At n=1 the correction leaves κ₁ unchanged.
- `correctedKolyvaginClass_fs`: The corrected localization satisfies the exact generic finite–singular square.
- `correctedKolyvaginClass_generator`: Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class.

Apply the derivative norm identity and residual invariant vanishing to obtain descent.

Use the tame Frobenius congruence for finite–singular comparison and CH’s K2 correction units.

Verify local conditions at p and auxiliary primes, then apply the unit correction to obtain a genuine generic KS.

Supplies the nontrivial higher-weight input to generic Howard descent. This is used in [Conditional Longo–Vigni bound](#longo-vigni-admissibility-and-the-lambda-adic-bound).

Its leading class generates H∞ after the nonvanishing proof. This is used in [Universal norm module of rank one](#universal-norm-module-rank-one).

**Checks.**

- `correctedKolyvaginClass_empty`: The empty correction product is 1 and κ′₁=κ₁.
- `correctedKolyvaginClass_minus`: A correction u=−1 negates the raw class.
- `correctedKolyvaginClass_wrong_unit`: Replacing a correction unit by 0 kills the class and cannot give an equivalent system.
- At n=1 the empty derivative and unit products are 1, so the initial class is unchanged.

Use [Universal norm Heegner class](#universal-norm-heegner-class); [Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); [Higher-weight Howard hypotheses](#higher-weight-howard-hypotheses); [Longo–Vigni local assumptions](#longo-vigni-local-assumptions); **EulerSystemsAndKolyvaginSystems ES.3/kolyvagin-system-module**.

The source for this target is **LV16**, §4.3, Lemma 4.6 and Theorem 4.7, pp.14–16.

The corrected classes form the KS; nonzero leading term has a separate proof.

<a id="longo-vigni-admissibility-and-the-lambda-adic-bound"></a>

### GH.5.6: Conditional Longo–Vigni bound

Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

All application inputs explicitly verified; generic ES.8 patching assumptions, including height-one symmetry, hold.

Apply the imported generic DVR bound at each permitted S_P.

Use the finite exceptional-set and perturbed-prime control to patch and establish characteristic-ideal symmetry.

Keep κ′₁ nonzero as a hypothesis here to avoid a dependency cycle with GH.6.

**Checks.**

- The asserted inequality is an upper bound on the torsion length; equality is the separate main conjecture.

Use [Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class); [Specialization and exceptional-prime control](#specialization-control); **EulerSystemsAndKolyvaginSystems ES.8/self-dual-lambda-adic-kolyvagin-bound**.

The source for this target is **LV16**, §3.4, Theorem 3.5, p.11.

<a id="auxiliary-form-leading-class-unit"></a>

### GH.5.7: Integral auxiliary-form Kolyvagin system and leading unit

For each auxiliary g in auxiliary-form-local-range, construct its integral Lambda-adic Kolyvagin system from the actual stabilized generalized-cycle Iwasawa class kappa_g,infty. With the lattice, finite ring-class trace and Shapiro convention fixed, identify an explicit v_g in O_g^times with kappa_g,1=v_g kappa_g,infty and give v_g^−1. The local finite–singular correction factors u_ell are units; their empty product at n=1 is 1. A fixed nonzero denominator d_g or a rational isomorphism does not replace the leading unit.

All generic ES hypotheses needed for the chosen descent theorem are verified in this auxiliary range. LV16 admissibility is an all-split, exceptional-prime package and cannot be silently applied here.

The LV19 Theorem 4.7 invoked by the erratum must be collated in its version of record, or an independently applicable construction proved. Denominator and weight conditions are checked on the actual auxiliary forms, not assumed from the elliptic weight-two form.

Extend the integral norm-compatible class with the local conditions from auxiliary-form-local-range and import ES.3 derivative/descent machinery. Prove residual invariant vanishing and finite–singular compatibility for this representation.

Compute every coefficient, finite-component trace and tower-index normalization relating the leading derivative to kappa_g,infty. Apply inverse unit corrections at auxiliary primes; the empty-product normalization itself introduces no factor at n=1.

Collate LV19 Theorem 4.7 and its hypotheses against this construction. LV16 Theorem 4.7, pp.15–16, is a model for the correction calculation only; its hypotheses do not prove the nonsplit/varying-weight claim.

**Checks.**

- Taking v_g=p is rejected even though it is nonzero rationally. At n=1 the correction unit product equals 1; any extra initial scalar must come from an explicitly computed tower/lattice map.

Use [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Iwasawa Heegner class](#iwasawa-heegner-class); **EulerSystemsAndKolyvaginSystems ES.3/kolyvagin-system-module**.

The source for this target is **BSD erratum**, Proof of Theorem 2.3, pp.3–4; **LV16**, §4.3, Theorem 4.7 and its proof, pp.15–16.

### Examples

For n=1 the derivative, auxiliary tensor and correction products are empty, so κ′₁=κ₁. This identity supplies neither a unit comparison with a differently normalized tower nor nonvanishing. A multiplier p has no integral inverse.

### Dependencies

[Newform and CM coefficient projector](#newform-cm-projector); **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **AutomorphicGaloisRepresentations R19.1**; **EulerSystemsAndKolyvaginSystems ES.5/howard-hypotheses**; **ArithmeticGaloisDuality R02.2/compact-five-term**; **SelmerIwasawaCohomology L4/bloch-kato-condition**; **PadicHodgeRegulators L3**; **SelmerIwasawaCohomology L2/galois-selmer-group**; [Universal norm Heegner class](#universal-norm-heegner-class); [Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); **EulerSystemsAndKolyvaginSystems ES.3/kolyvagin-system-module**; **EulerSystemsAndKolyvaginSystems ES.8/self-dual-lambda-adic-kolyvagin-bound**; [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Iwasawa Heegner class](#iwasawa-heegner-class).

<a id="layer-gh-6"></a>

## Layer GH.6: Nonvanishing and Selmer consequences

<a id="anticyclotomic-nonvanishing"></a>

### GH.6.1: Anticyclotomic nonvanishing

Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is requested from L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

CH §3 setup, (N_f,D_K)=1 and the auxiliary residual condition of Hsieh’s input; −r<j<r for the algebraic logarithm implication.

Import the precise mod-ℓ central-value nonvanishing theorem from L3h.

Show the bounded one-variable measure is not identically zero and apply p-adic Weierstrass preparation.

Use the nonzero interpolation constants in CH 4.9 to deduce nonzero localized class, hence nonzero global class.

**Checks.**

- A nonzero class follows from a nonzero local logarithm; a complex simple zero alone has no such implication here.

Use **AutomorphicPadicLFunctions L3h**; [Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula); [Hsieh nonvanishing hypothesis transport](#nonvanishing-hypothesis-transport).

The source for this target is **CH22**, §3, Theorem 3.9 and proof, p.14; §6, Theorem 6.1(2), p.27.

<a id="selmer-rank-one"></a>

### GH.6.2: Rank-one Selmer consequence

For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding node.

CH (H): p∤2(2r−1)!Nφ(N), conductor χ prime to N, every prime of N split in K, p split; class nonzero; canonical CM/period setup.

Use the cycle norm, Frobenius and conjugation relations to verify CH’s anticyclotomic Euler-system axioms.

Use the existing ES.4/rational-anticyclotomic-descent interface and verify its Bloch–Kato local conditions via Theorem 7.7. Do not substitute the stronger clean Howard hypotheses for CH (H).

The resulting dimension bound plus a nonzero Selmer class gives equality with its one-dimensional span.

**Checks.**

- For z=0 the conclusion cannot be inferred; the nonzero hypothesis is essential.

Use [Heegner cycle norm relations](#cycle-norm-relations); [Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [Complex conjugation of Heegner classes](#cycle-conjugation); [Finite local Abel–Jacobi class](#finite-local-abel-jacobi-class); **SelmerIwasawaCohomology L2/galois-selmer-group**; **EulerSystemsAndKolyvaginSystems ES.4/rational-anticyclotomic-descent**.

The source for this target is **CH22**, §6, Theorem 6.1(1), p.27; §7.3, Theorem 7.7, pp.31–32.

<a id="selmer-rank-zero"></a>

### GH.6.3: Rank-zero Selmer consequence

Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

Ordinary a_p; CH (H); outside the critical interval; nonzero normalized central value; corrected local condition adapter.

Apply the dual-exponential formula and nonvanishing interpolation constants.

Verify the specialized anticyclotomic Euler-system local axioms by the KO replacement.

Use local duality and the existing ES.4/rational-anticyclotomic-descent interface to eliminate the Bloch–Kato subspace; the clean Howard big-image package is not a stated hypothesis of CH Theorem 6.2.

**Checks.**

- In the critical interval the root number is −1; this theorem’s nonzero central-value hypothesis applies to the opposite range.

Use [Dual exponential special value](#dual-exponential-special-value); [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); **SelmerIwasawaCohomology L2/galois-selmer-group**; **EulerSystemsAndKolyvaginSystems ES.4/rational-anticyclotomic-descent**.

The source for this target is **CH22**, §6, Theorem 6.2 and proof, p.27; §7.4, Theorem 7.9, p.33.

<a id="selmer-consequences-with-the-corrected-dimension-formula"></a>

### GH.6.4: Corrected Selmer growth formula

For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

The fixed-weight CH setup and hypotheses used by Theorems 6.1–6.2; n sufficiently large; ordinary assumption for the rank-zero branch.

Use finite-level Shapiro and decompose into characters of the finite abelian tower quotient, extending coefficients and accounting for multiplicities.

Apply eventual nonvanishing and the rank-one/rank-zero results; finitely many exceptional characters contribute the constant e.

Insert the corrected factor (1−ε)/2 from the erratum.

**Checks.**

- For ε=+1 the dimensions stabilize; for ε=−1 their leading term is the tower degree.

Use [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [Rank-one Selmer consequence](#selmer-rank-one); [Rank-zero Selmer consequence](#selmer-rank-zero); **SelmerIwasawaCohomology L3/iwasawa-shapiro**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**.

The source for this target is **CH22**, §6, Theorem 6.3, p.27; **CH erratum**, First correction, p.1.

<a id="selmer-parity"></a>

### GH.6.5: Selmer parity

For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

Ordinary f; the self-dual induced family and its local parity hypotheses are supplied; the corrected Nekovář theorem applies.

Form the induced self-dual family and track its local plus-submodule in each j range.

Use nonvanishing and the two fixed-weight Selmer theorems to choose a known parity specialization.

Apply the supplier’s corrected parity invariance theorem and the complex functional-equation sign.

**Checks.**

- The parity residue is 0 at ε=+1 and 1 at ε=−1.

Use [Rank-one Selmer consequence](#selmer-rank-one); [Rank-zero Selmer consequence](#selmer-rank-zero); [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); **SelmerIwasawaCohomology L4**.

The source for this target is **CH22**, §6.4, Theorem 6.4 and proof, pp.27–28.

<a id="universal-norm-module-rank-one"></a>

### GH.6.6: Universal norm module of rank one

For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

LV admissibility and verified application conditions; comparison of CH classes with the LV finite Δ norm convention.

Use CH nonvanishing to find a nonzero norm class at a finite level.

Compute the stable augmentation image using the trace-polynomial ideal equality.

Apply the cited universal-norm argument and Nakayama to show generation by κ̃₁, then use torsion freeness.

**Checks.**

- A nonzero element p of Λ is not a generator of Λ; nonvanishing alone cannot justify the module-generation conclusion.

Use [Universal norm Heegner class](#universal-norm-heegner-class); [Trace polynomial intersection theorem](#trace-polynomial-intersection); [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [Specialization and exceptional-prime control](#specialization-control); [Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class).

The source for this target is **LV16**, §4.3, Definition 4.10 and Theorem 4.12, pp.16–18.

<a id="lambda-structure-consequence"></a>

### GH.6.7: Higher-weight Iwasawa structure

With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. This conditional structure consequence retains the local-filtration and normalization gaps until the supplier and source comparison obligations are discharged.

The admissible triple, H0–H5, local Assumption 3.2, control and universal-norm identification are all verified.

Supply κ̃₁≠0 and H∞=Λκ̃₁ from the preceding theorem.

Apply the already imported generic Howard Λ theorem through the GH.5 adapter.

**Checks.**

- The quotient in the divisibility is Selhat/H∞ after identifying H∞, not a quotient by an arbitrary nonzero class.

Use [Conditional Longo–Vigni bound](#longo-vigni-admissibility-and-the-lambda-adic-bound); [Universal norm module of rank one](#universal-norm-module-rank-one).

The source for this target is **LV16**, Introduction Theorem 1.1 and §5.1, pp.2,18–19.

<a id="nonvanishing-hypothesis-transport"></a>

### GH.6.8: Hsieh nonvanishing hypothesis transport

In the F=Q, all-split tame-level CH setup with (N_f,D_K)=1, choose an auxiliary coefficient prime ell different from the anticyclotomic tower prime p. Translate Hsieh14 Theorem C to nonzero central values modulo ell for all but finitely many p-power characters, then use the imported L3h interpolation to show the bounded p-adic square-root measure is nonzero. Nonzero bounded one-variable power series has only finitely many torsion-character zeros. This supplies GH.6 nonvanishing with its extra discriminant-level hypothesis.

Hsieh Theorem C: ordinary CM type at the coefficient prime, square-free nonsplit conductor n−, Hypothesis A epsilon*=+1 at v|n−, coprimality of coefficient/tower primes with n c_chi D_K, absolutely irreducible residual restriction to G_K and coefficient prime not dividing the specified local finite character orders.

For the CH all-split specialization n−=1, Hypothesis A and square-free n− hold automatically. Choose ell outside pND_K and the finite factors at nonsplit character conductor (including 1+q as in the CH proof), with the CM type ell-ordinary and the required residual irreducibility; this prime-existence input is part of the L3h request. Hsieh’s coefficient prime and tower prime are switched; the conclusion is not a mod-p claim for the original fixed form.

Read the Theorem C package with the roles of p and ell renamed before specializing F=Q. In local-degree one its almost-all conclusion means a finite exceptional set.

Check each local root-number, conductor and residual condition under the CH auxiliary-prime choice, rather than applying a bare nonvanishing citation.

Transport the algebraic central values through the L3h period/Euler interpolation, conclude nonidentity of the p-adic measure, and apply the existing Weierstrass-preparation supplier.

**Checks.**

- Nontriviality of a distribution alone does not establish a Selmer rank. In a multivariable or local-degree>1 tower, Theorem C does not assert a finite exceptional set; use its dense-set formulation instead.

Use **AutomorphicPadicLFunctions L3h**; **AutomorphicGaloisRepresentations R19.1**.

The source for this target is **Hsieh14**, Introduction, Hypothesis A and (ord), pp.710–711; Theorem C, p.713; Theorem 7.1 and proof, pp.759–764; **CH22**, Theorem 3.9 and proof, p.14.

<a id="auxiliary-form-nontorsion"></a>

### GH.6.9: Non-torsion in the auxiliary-form source range

For g in auxiliary-form-local-range, prove kappa_g,infty is non-torsion over the specified anticyclotomic Iwasawa algebra. Realize the square-root analytic distribution in the same coefficient/twist convention, prove its nonvanishing with the local-root-number/conductor conditions at ramified tame primes, and prove the source-qualified reciprocity formula on the integral class. For a nonzero scalar functional of the localized class, conclude the class is nonzero; use the established torsion-free Selmer/Iwasawa module to obtain non-torsion.

The special nonsplit local types of the erratum and all residual/ordinary assumptions are retained. CH Theorem 3.9 has the extra (N_f,D_K)=1 and cannot prove this ramified-tame extension. Hsieh Hypothesis A is a local sign condition to verify here, not automatically vacuous.

The regulator map is defined at the selected nonexceptional specializations; period/Euler factors are nonzero. Exceptional multiplicative specialization is an analytic regular-model problem in the consumer route, not a p-old class theorem.

Request from L3h Hsieh Theorem C/interpolation with exact special-local test-vector and sign checks at the ramified tame primes of the auxiliary form.

Extend the generalized-cycle reciprocity calculation in GH.4 to the same source range using the local range theorem and the fixed regulator/twist maps; do not use all-split CH5.7 without this adapter.

Combine analytic nonvanishing and the nonzero-line regulator pairing with torsion freeness of the actual global module. This is the non-torsion input used by the corrected BSD proof; the source-range reciprocity verification remains explicit.

**Checks.**

- Do not apply CH3.9 when a ramified tame q divides both M and D_K. Nonzero local reciprocity value implies nonzero global class, while the reverse need not hold without injectivity.

Use [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Integral auxiliary-form Kolyvagin system and leading unit](#auxiliary-form-leading-class-unit); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); **AutomorphicPadicLFunctions L3h**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**.

The source for this target is **BSD erratum**, Proof of Theorem 2.3, pp.3–4; **Hsieh14**, Hypothesis A, p.710; Theorem C, p.713; Theorem 7.1, pp.759–764.

### Examples

The corrected growth slope is 0 for root sign +1 and 1 for −1. A nonzero element p in Λ does not generate Λ, so nonvanishing alone cannot prove H∞=Λκ̃₁.

### Dependencies

**AutomorphicPadicLFunctions L3h**; [Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula); [Heegner cycle norm relations](#cycle-norm-relations); [Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [Complex conjugation of Heegner classes](#cycle-conjugation); [Finite local Abel–Jacobi class](#finite-local-abel-jacobi-class); **SelmerIwasawaCohomology L2/galois-selmer-group**; **EulerSystemsAndKolyvaginSystems ES.4/rational-anticyclotomic-descent**; [Dual exponential special value](#dual-exponential-special-value); [Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); **SelmerIwasawaCohomology L3/iwasawa-shapiro**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **SelmerIwasawaCohomology L4**; [Universal norm Heegner class](#universal-norm-heegner-class); [Trace polynomial intersection theorem](#trace-polynomial-intersection); [Specialization and exceptional-prime control](#specialization-control); [Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class); [Conditional Longo–Vigni bound](#longo-vigni-admissibility-and-the-lambda-adic-bound); **AutomorphicGaloisRepresentations R19.1**; [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Integral auxiliary-form Kolyvagin system and leading unit](#auxiliary-form-leading-class-unit); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); **SelmerIwasawaCohomology L3/iwasawa-cohomology**.

<a id="layer-gh-7"></a>

## Layer GH.7: Ordinary families and specialization

<a id="critical-character-twist"></a>

### GH.7.1: Critical character and CM family twist

Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The critically twisted family is T†=T⊗Θ^{-1}, with determinant ε_f ε_cyc; the self-dual convention requires trivial nebentypus ε_f=1. Keep ε_f in the general family determinant; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

Fixed branch, geometric reciprocity, square-root lift and CM character λ; ordinary residual irreducible and p-distinguished family.

The construction must provide the following operations and identities.

- `criticalTwist_apply`: The twisting character is Θ(g)^{-1}ξ(g)^{-1}.
- `criticalTwist_selfDual`: If the untwisted determinant character δ=ε_f Θ²ε_cyc, twisting by Θ⁻¹ξ⁻¹ gives determinant ε_f ε_cyc ξ⁻². Setting ε_f=1 recovers the self-dual convention; a nontrivial nebentypus factor survives the critical twist.
- `criticalTwist_specialize`: Specialization of the coefficient ring commutes with both inverse character factors.

Import the Hida branch and continuous character algebra from PadicFamilies.

Apply the critical half-weight twist, then the CM anticyclotomic twist.

Compute the resulting local rank-one Frobenius character from the ordinary exact sequence.

Makes the actual plus line unramified for the supplier regulator. This is used in [Anticyclotomic family regulator](#family-regulator-localization).

Pins the self-dual representation identified with V_fν(rν). This is used in [Higher-weight family specialization](#higher-weight-family-specialization).

**Checks.**

- `criticalTwist_trivial`: With both characters trivial the twist is trivial.
- `criticalTwist_inverse`: Multiplying the twist by Θξ gives the trivial character.
- `criticalTwist_order`: The CM and critical inverse factors commute in the coefficient unit group.
- `criticalTwist_nebentypus`: On G=Q× with ε_f the identity character and Θ=ξ=ε_cyc=1, the twisted determinant at −1 remains −1. Dropping ε_f would incorrectly give 1.
- Different lifts of i modulo 2(p−1) can change the half-weight character; a square-root choice must be fixed.
- A nontrivial ε_f remains in det(T†); the general family reciprocity does not imply a trivial-nebentypus global self-duality theorem.

Use **PadicFamilies L0/hida-control-theorem**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; **AutomorphicGaloisRepresentations R19.6**; **PadicHodgeRegulators L3**.

The source for this target is **Castella**, §2.6, Definition 2.8, p.10; §4.1, Theorem 4.3, pp.18–19; §5.1, p.21.

<a id="howard-family-tower"></a>

### GH.7.2: Howard family class tower

On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

Hida ordinary, residual irreducible and p-distinguished; fine-level CM data; bad-prime torsion freeness as in Castella Proposition 4.8.

The construction must provide the following operations and identities.

- `howardTowerClass_level`: The conductor-t class is U_p^{1−t}X_{c₀p^t}.
- `howardTowerClass_trace`: The normalized family classes are corestriction compatible.
- `howardTowerClass_greenberg`: The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses.

Import Howard’s CM point tower from HE and the family representation from R19.6.

Apply the Kummer maps and ordinary control with the U_p^{-s} normalization.

Use the vertical trace relation to normalize by U_p^{1−t}; apply the local Greenberg verification at p and at bad primes.

Supplies the global class to the localized regulator. This is used in [Two-variable explicit reciprocity](#two-variable-explicit-reciprocity).

Fixes the precise bottom point class whose specialization is evaluated. This is used in [Initial family specialization](#initial-family-specialization).

**Checks.**

- `howardTowerClass_one`: At t=1 the class is X₁.
- `howardTowerClass_two`: At t=2 the class is U_p^{-1}X₂.
- `howardTowerClass_unit`: With U_p=1 there is no renormalization.
- The t=1 class has U_p⁰ normalization; omitting the +1 in 1−t changes its initial comparison.

Use [Critical character and CM family twist](#critical-character-twist); **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **AutomorphicGaloisRepresentations R19.6**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **ModularCurvesPartII R14.3**; **HeegnerPointEulerSystems HE.1**.

The source for this target is **Castella**, §4.2, Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8, pp.19–21.

<a id="family-representation-specialization"></a>

### GH.7.3: Family representation specialization

Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; compare their convention with the GH class.

Normal finite-flat Hida branch and arithmetic ν of the source’s weight and character; ordinary/residual hypotheses.

Import the family representation, ordinary exact sequence and arithmetic specialization.

Compare geometric Frobenius, determinant and critical twist with the fixed-weight coefficient projector.

**Checks.**

- A trace convention at Fr_ℓ^{-1} cannot be silently replaced by arithmetic Fr_ℓ.

Use **AutomorphicGaloisRepresentations R19.6**; **PadicFamilies L0/hida-control-theorem**; [Critical character and CM family twist](#critical-character-twist); [Newform and CM coefficient projector](#newform-cm-projector).

The source for this target is **Castella**, §4.1, Theorem 4.3, p.19.

<a id="family-measure-specialization"></a>

### GH.7.4: Family square-root measure specialization

Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. Here ψ=ξνφ. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

Castella §2.3–2.7’s CM and modular measure data; exact arithmetic ν and locally algebraic φ; complete unramified coefficient extension W.

This is the consumer normalization comparison using the imported L3h interpolation theorem, not a second owner of the family distribution or Theorem 2.11.

Import the family CM modular measure and its toric interpolation from L3h.

Check specialization of χν, ξν, periods, gamma factors and the ramified/unramified Euler cases.

Match the fixed-weight CH distribution with the family measure at the chosen branch; do not define a second BDP measure in GH.7.

**Checks.**

- At n>0 the epsilon factor replaces the two unramified Euler factors.

Use **AutomorphicPadicLFunctions L3h**; **PadicFamilies L0/hida-control-theorem**; [Critical character and CM family twist](#critical-character-twist).

The source for this target is **Castella**, §2.7, Theorem 2.11 and Remark 2.12, pp.11–12.

<a id="ochiai-exponential"></a>

### GH.7.5: Ochiai exponential

The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

Castella ordinary deformation Definition 3.1, rank-one unramified F⁺ line, determinant convention and finite unramified F.

Request the generic Ochiai exponential as a Part II extension of the cyclotomic regulator theory.

Verify the actual GH critical twist satisfies its local ordinary deformation input, and retain J and its specialization error.

**Checks.**

- At an exceptional arithmetic character the J-specialized map can vanish; an everywhere-isomorphism claim is invalid.

Use **PadicHodgeRegulators L3**; [Critical character and CM family twist](#critical-character-twist); [PadicHodgeRegulatorsPartII PHR2.2 contract](#supplier-phr2-2).

The source for this target is **Castella**, §3.2, Theorem 3.4, pp.14–15.

<a id="yager-unramified-descent"></a>

### GH.7.6: Yager unramified descent

The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

Unramified Z_p-tower with its Galois action and trace; Castella §3.3 coefficient convention.

Request Yager’s trace module and free rank-one basis/covariance theorem from the PHR local Part II owner.

Use trace compatibility and covariance to obtain the local two-variable map; retain finite-level corestriction checks.

**Checks.**

- The coefficient action is by [u], with σ^{-1} in the Yager sum; changing either inversion changes descent.

Use **PadicHodgeRegulators L3**; [Ochiai exponential](#ochiai-exponential); [PadicHodgeRegulatorsPartII PHR2.3 contract](#supplier-phr2-3).

The source for this target is **Castella**, §3.3, Proposition 3.5 and (3.6), p.15.

<a id="two-variable-regulator"></a>

### GH.7.7: Two-variable regulator

With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. For a p-old arithmetic specialization ν, Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

The rank-one unramified ordinary line, Yager covariance and nonexceptional arithmetic specialization; all §3 conventions.

The dual-exponential conclusion of Corollary 3.9 additionally requires ν to be p-old.

Combine the requested exponential and Yager module into the two-variable regulator.

Check logarithmic and dual-exponential interpolation against the same twists before passing to the anticyclotomic quotient.

**Checks.**

- At λ_reg=0 localization does not produce a value; exceptional arithmetic primes require a separate statement.

Use **PadicHodgeRegulators L3**; [Yager unramified descent](#yager-unramified-descent); [Ochiai exponential](#ochiai-exponential); [PadicHodgeRegulatorsPartII PHR2.4 contract](#supplier-phr2-4).

The source for this target is **Castella**, §3.4, Theorem 3.7 and Corollary 3.9, pp.16–17.

<a id="family-regulator-localization"></a>

### GH.7.8: Anticyclotomic family regulator

Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

The critical/CM twist is the one giving Ψ; λ_reg is inverted; H⁰/H² condition and the canonical family differential are fixed.

Pair the imported map with the family ω functional and descend to Γ.

Use the specialization exact sequence and the H² correction to prove injectivity and the pseudo-null bound.

**Checks.**

- The nonexceptional condition λ_reg≠0 is retained in each arithmetic specialization.

Use [Two-variable regulator](#two-variable-regulator); [Family representation specialization](#family-representation-specialization); [Critical character and CM family twist](#critical-character-twist); **SelmerIwasawaCohomology L3/iwasawa-shapiro**; [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [PadicHodgeRegulatorsPartII PHR2.5 contract](#supplier-phr2-5).

The source for this target is **Castella**, §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22.

<a id="two-variable-explicit-reciprocity"></a>

### GH.7.9: Two-variable explicit reciprocity

In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

Castella’s ordinary residual irreducible/p-distinguished family, local regulator domain, CM tower and measure; localized λ_reg.

Verify the local restriction is in the plus-line Iwasawa source.

At a dense set of weight-two arithmetic specializations with sufficiently ramified φ, compute the Coleman evaluation and period-normalized CM measure (Proposition 5.4).

Apply family control and density; the local epsilon sign gives σ_{−1,p}.

**Checks.**

- Squaring conceals the class normalization; the family identity is kept linear.

Use [Howard family class tower](#howard-family-tower); [Anticyclotomic family regulator](#family-regulator-localization); [Family square-root measure specialization](#family-measure-specialization); [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula).

The source for this target is **Castella**, §5.2, Theorem 5.3, Proposition 5.4 and proof, pp.22–25.

<a id="ordinary-localization-injective"></a>

### GH.7.10: Ordinary localization injectivity

For an ordinary fixed-weight form f of even weight at least two and trivial nebentypus with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

Residual |G_K irreducibility, ordinary filtration, torsion-free global module and nonzero local classes at infinitely many finite characters.

The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

Use the fixed-weight nonvanishing/reciprocity and Selmer rank-one result to show the finite-character localization kernels vanish.

Apply torsion freeness and infinitely many specializations to kill the global kernel.

**Checks.**

- Equality after a local regulator gives a global equality only after this injectivity input.

Use [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [Rank-one Selmer consequence](#selmer-rank-one); [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **SelmerIwasawaCohomology L2/galois-selmer-group**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **SelmerIwasawaCohomology L4**.

The source for this target is **Castella**, §6.2, Lemma 6.4, p.27.

<a id="initial-family-specialization"></a>

### GH.7.11: Initial family specialization

Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require trivial nebentypus of the fixed-weight form f, k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

All Castella §6.2 hypotheses; α=ν(a_p) is the ordinary root; period and cycle normalization fixed.

The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

Specialize family reciprocity and match it with CH’s fixed-weight identity using the normalization adapter.

Use the classical/generalized cycle comparison and its half-unit convention.

Use ordinary localization injectivity to promote the local equality to the global initial class.

**Checks.**

- At a vanishing ordinary Euler factor the initial class can vanish; no exceptional-branch claim is made.

Use [Two-variable explicit reciprocity](#two-variable-explicit-reciprocity); [Ordinary localization injectivity](#ordinary-localization-injective); [Family representation specialization](#family-representation-specialization); [Classical and generalized cycle comparison](#classical-generalized-cycle-comparison); [First-step stabilization adapter](#stabilized-first-step-adapter).

The source for this target is **Castella**, §6.2, Theorem 6.5 and proof, p.28.

<a id="higher-weight-family-specialization"></a>

### GH.7.12: Higher-weight family specialization

Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

Castella Theorem 6.5: weight and parity congruence, trivial arithmetic character, residual |G_K irreducibility, p-distinguishedness, required bad-prime ramification, odd CM discriminant, split p, c₀ prime to Np.

The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

Compare both local regulator images at each nonexceptional arithmetic specialization with the exact c₀^{rν−1} factor.

Use Lemma 6.4 localization injectivity to identify global Iwasawa classes.

Project to finite conductor/character moments using the same Shapiro inversion and compare the initial formula.

**Checks.**

- The initial cycle equality and the full system equality are different conclusions; both retain their normalization factors.

Use [Initial family specialization](#initial-family-specialization); [Ordinary localization injectivity](#ordinary-localization-injective); [Two-variable explicit reciprocity](#two-variable-explicit-reciprocity); [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **SelmerIwasawaCohomology L3/iwasawa-shapiro**.

The source for this target is **Castella**, §6.2, Theorem 6.5 and (6.7), p.28.

<a id="ordinary-regulator-quotient-application"></a>

### GH.7.13: Ordinary-line application of regulator quotient descent

For the actual critically twisted ordinary line F+Tdagger tensor xi^−1, verify the hypotheses of the requested local Part II and construct the anticyclotomic quotient regulator in the source completion. If q_M and q_N are the actual source/target quotient maps and Ltilde is the two-variable regulator, prove Ltilde^−1(ker q_N)=ker q_M before claiming injectivity of the descended map. Verify H0 of the tower ordinary line vanishes in the source’s range, hence the required H2 correction, and prove the canonical omega_family pairing is nonzero on its rank-one period line after scalar extension. Retain J, lambda localization and the pseudo-null error.

This is the GH application of the PHR2.1–PHR2.5 supplier contracts, not a second construction of local Iwasawa theory. LZ14 injectivity before quotient and a generic mapQ lemma alone do not provide the arithmetic preimage equality.

The rank-one line has the exact unramified character Psi after all twists. Verify nonnegative Hodge–Tate, no trivial quotient and no tower invariants before using CH5.1; the p-old condition is required for Castella Corollary 3.9.

Identify the actual coefficient and distribution quotient submodules and their pushforwards from the supplied local regulator. Use the Galois-cohomology specialization sequence to compute the H2 error.

Prove the preimage equality, then apply the existing Mathlib quotient kernel formula. Pair only after proving a nonzero functional on a specified one-dimensional period line; a scalar projection on a rank-two space is insufficient.

Check interpolation at nonexceptional arithmetic points and the domain of each coefficient map. If nu(lambda)=0, construct and prove a regular model/cleared-denominator moment as a separate obligation; never evaluate lambda^−1 there.

**Checks.**

- Multiplication by X is injective on Q[X] but induces zero on Q[X]/(X); this rejects passing injectivity through a quotient. A nonzero functional on an identified line is injective, whereas a projection Q^2→Q is not.

Use [Critical character and CM family twist](#critical-character-twist); [Family representation specialization](#family-representation-specialization); [Two-variable regulator](#two-variable-regulator); **PadicHodgeRegulators L3**; Mathlib `Submodule.mapQ`; Mathlib `Submodule.ker_mapQ`; Mathlib `LinearMap.ker_eq_bot`; [PadicHodgeRegulatorsPartII PHR2.1 contract](#supplier-phr2-1); [PadicHodgeRegulatorsPartII PHR2.2 contract](#supplier-phr2-2); [PadicHodgeRegulatorsPartII PHR2.3 contract](#supplier-phr2-3); [PadicHodgeRegulatorsPartII PHR2.4 contract](#supplier-phr2-4); [PadicHodgeRegulatorsPartII PHR2.5 contract](#supplier-phr2-5).

The source for this target is **Castella**, §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22; **CH22**, §5.1, Theorem 5.1 quotient proof, pp.21–22; **LZ14**, Proposition 4.11 and proof, p.18.

Injectivity requires the infinite unramified direction; quotient injectivity needs the additional preimage calculation.

<a id="weight-two-p-old-localization"></a>

### GH.7.14: Localization injectivity at weight-two p-old points

In the common all-split CH/ordinary-family range, extend the localization comparison used in Castella Remark 6.6 to a weight-two p-old specialization: on each retained finite ring-class component, the strict Greenberg global Iwasawa Selmer module maps injectively to the ordinary local H1_Iw module. Together with source-period-and-twist-transport and ordinary-regulator-quotient-application this permits equality of local reciprocity images to identify the global p-old cycle/point class.

Residual restriction to G_K irreducible, p-distinguished ordinary representation, the actual torsion-free Greenberg module/control statements, infinitely many nonzero specialized local classes and their rank-one Selmer bounds. Retain E(K)[p]=0 when importing the HE.8 integral point system.

The form is p-old of level prime to p. No conclusion for the multiplicative p-new weight-two point or an exceptional lambda-zero specialization is asserted.

Repeat the argument of Castella Lemma 6.4 on each finite ring-class component using the weight-two CH nonvanishing and rank-one specialization theorem with their own hypotheses.

Use torsion freeness/control to deduce the global kernel vanishes from the characterwise vanishing; retain bad-prime local errors.

Apply the already constructed regulator and period diagrams. The additional infinite-unramified quotient check is independent of this global localization argument.

**Checks.**

- A p-new multiplicative elliptic specialization fails the p-old input. Equality of two local images without the injectivity theorem cannot imply equality of global classes.

Use [Ordinary localization injectivity](#ordinary-localization-injective); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [Rank-one Selmer consequence](#selmer-rank-one).

The source for this target is **Castella**, §6.2, Lemma 6.4 and proof, p.27; Remark 6.6, pp.28–29.

### Examples

Multiplication by X is injective on Q[X] and induces zero on Q[X]/(X). Therefore quotient injectivity requires the preimage calculation. A weight-two p-new multiplicative point also fails the p-old specialization input.

### Dependencies

**PadicFamilies L0/hida-control-theorem**; **ComplexMultiplicationAndExplicitReciprocity CM.1**; **AutomorphicGaloisRepresentations R19.6**; **PadicHodgeRegulators L3**; **HeegnerPointEulerSystems HE.1/canonical-model-cm-descent**; **SelmerIwasawaCohomology L3/iwasawa-cohomology**; **ModularCurvesPartII R14.3**; **HeegnerPointEulerSystems HE.1**; [Newform and CM coefficient projector](#newform-cm-projector); **AutomorphicPadicLFunctions L3h**; [PadicHodgeRegulatorsPartII PHR2.2 contract](#supplier-phr2-2); [PadicHodgeRegulatorsPartII PHR2.3 contract](#supplier-phr2-3); [PadicHodgeRegulatorsPartII PHR2.4 contract](#supplier-phr2-4); **SelmerIwasawaCohomology L3/iwasawa-shapiro**; [PadicHodgeRegulatorsPartII PHR2.5 contract](#supplier-phr2-5); [Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); [Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [Rank-one Selmer consequence](#selmer-rank-one); [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **SelmerIwasawaCohomology L2/galois-selmer-group**; **SelmerIwasawaCohomology L4**; [Classical and generalized cycle comparison](#classical-generalized-cycle-comparison); [First-step stabilization adapter](#stabilized-first-step-adapter); Mathlib `Submodule.mapQ`; Mathlib `Submodule.ker_mapQ`; Mathlib `LinearMap.ker_eq_bot`; [PadicHodgeRegulatorsPartII PHR2.1 contract](#supplier-phr2-1); [Transport of source periods, twists and differentials](#source-period-and-twist-transport).

<a id="layer-gh-8"></a>

## Layer GH.8: Weight-two and integral normalization comparisons

<a id="weight-zero-cycle"></a>

### GH.8.1: The weight-two cycle is the corrected CM divisor

Let C be the modular curve used by the BDP construction, L a characteristic-zero field over which the CM point x_phi and a degree-one cusp b are rational, and identify X_0 with C by the empty-fiber-power identification. The homologically trivial weight-two cycle is [x_phi]-[b] in CH^1(C_L)_Q. After applying the chosen cuspidal Hecke correspondence e_f it is e_f([x_phi]-[b]). The raw point [x_phi] has degree one and is not the input to the degree-zero Abel--Jacobi map.

BDP's fiber-power index is k-2, whereas CH writes the weight as 2r; weight two means respectively index 0 and r=1.

Use the actual level structure and its field of definition. A ring class field alone is not asserted to define every chosen level point or cusp.

The empty fiber-power identification and e_f are supplied by GH.0--GH.1, not new abstract carriers.

Compute the zeroth graph product in the fiber above x_phi and carry it through X_0=C.

Subtract the chosen cusp and compute its degree as 1-1. On a smooth proper curve this degree-zero class has zero geometric degree-two cycle class.

Apply the already constructed correspondence; do not apply the positive-fiber-power vanishing argument at index zero.

**Checks.**

- x_phi=b gives zero, whereas retaining [x_phi] gives degree one.
- Changing b to b_prime changes the class by [b]-[b_prime], not a literal integral independence assertion.
- Test k=2 against both source indices and retain the field extension needed for the level structure.

Use [The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [Newform and CM coefficient projector](#newform-cm-projector); [Good model comparison for the CM product](#cm-product-good-model); [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); **HeegnerPointEulerSystems HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation**.

The source for this target is **BDP13**, Section 2.3, Proposition 2.7 and preceding paragraph, printed p. 1063.

<a id="modular-quotient-kummer"></a>

### GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient

For the preceding C, x_phi, b and L, let J=Pic^0(C), let pi:C->E be the chosen modular parametrization defined over L, and let q_pi:J->E satisfy q_pi([x]-[b])=pi(x)-pi(b). Let theta_C:V_p J -> H^1_et(C_bar,Q_p(1)) be the Picard--Kummer identification. With the corresponding f-projector on J satisfying q_pi e_f=q_pi, set gamma_pi=V_p(q_pi) composed with theta_C^{-1}. Then H^1(L,gamma_pi)(AJ_et(e_f([x_phi]-[b]))) equals kappa_E(pi(x_phi)-pi(b)) in H^1_cont(L,V_p E). Both sides may be extended to the same finite coefficient field. This is a rational-coefficient statement; it does not identify two chosen integral lattices.

C is smooth, proper and geometrically connected, L has characteristic zero, and p is prime.

Use the GH.1 Hochschild--Serre/Gysin convention, with connecting cocycle sigma(Q)-Q.

The Picard--Kummer comparison and correspondence action must agree with that convention; see the GH.1 request.

The actual quotient supplies q_pi and q_pi e_f=q_pi; equality of dimensions or eigenvalues does not.

Use the finite-level Picard--Kummer/Gysin comparison to identify the degree-one Abel--Jacobi class with the Kummer class of its divisor class in J. The sign comparison is explicitly requested from GH.1.

For a p^n-division point Q, applying q_pi takes sigma(Q)-Q to the connecting cocycle of q_pi([D]); changes of Q give corresponding coboundaries.

Use compatible division points and the continuous-cochain/adic realization comparison, not an unproved interchange of H^1 and inverse limits.

Apply q_pi e_f=q_pi and the preceding divisor description, retaining the basepoint translation.

**Checks.**

- For C=E, origin b and identity pi, recover the rational Kummer class.
- Replacing b by b_prime adds kappa_E(pi(b)-pi(b_prime)).
- Torsion basepoint differences vanish rationally; p-primary torsion cannot be discarded integrally.
- An isogeny of rational representations need not identify the integral Tate lattices.

Use [The weight-two cycle is the corrected CM divisor](#weight-zero-cycle); [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); **HeegnerPointEulerSystems HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation**; **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**.

The source for this target is **BDP13**, Section 3.1, Definition 3.1 and Remark 3.2, printed pp. 1065–1066; **Castella**, Remark 6.6, p. 29.

Supplies the extension realization; the finite Picard comparison is a separate requested proof.

<a id="character-sum-comparison"></a>

### GH.8.3: Character-weighted comparison without averaging

Let F/L be a finite abelian extension defining a compatible family of the preceding cycles and points, let G=Gal(F/L), and let chi:G->B^x be a character in a common coefficient field B. For the G-equivariant scalar extension gamma_* of the preceding comparison, gamma_*(sum_g chi(g) g.z)=sum_g chi(g) g.kappa_E(P). With this left-action convention each weighted sum lies in the chi^{-1}-eigenspace. No factor 1/|G| is introduced. A descent to H^1(L,V tensor chi), if used, is a further cohomological map with its own hypotheses.

The coefficient representations extend to G_L, giving the quotient action on H^1(F,-).

The parametrization, correspondence and comparison descend to L.

chi is finite order with values in B; it is not an unspecified Hecke character or averaging idempotent.

Apply the quotient comparison to every conjugate.

Commute the equivariant linear map with the finite weighted sum.

For h in G substitute t=hg; chi(h^{-1}t)=chi(h)^{-1}chi(t).

An averaging projector needs |G| invertible; inflation--restriction descent is a separate argument.

Identify the finite group action on continuous cohomology from GH.3; apply the coefficient-map naturality of GH.1. The weighted finite sum has the inverse-character eigenspace convention. Restriction and twisted descent must realize that convention rather than assuming invariants under the untwisted action.

**Checks.**

- The trivial character gives the trace, not the average.
- For a cyclic group of order three, check the inverse-character eigenvalue.
- When p divides |G|, the unnormalized sum is integral but division by |G| is not.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`; [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent).

The source for this target is **CH22**, Section 5.2, character specialization after equation (5.1) and Lemma 5.4, p.23.

<a id="positive-conductor-stabilization"></a>

### GH.8.4: Comparison of positive-conductor stabilized classes

Let p be good ordinary for a weight-two form f of trivial character, and let alpha be the unit root of X^2-a_p X+p. Put K_n=K_{c_0 p^n} with (c_0,p)=1. For n>=1 let z_n be the rational corrected cycle class and k_n=kappa_E(P_n) its image under compatible maps gamma_n. Then gamma_n(z_n-alpha^{-1} res(z_{n-1}))=k_n-alpha^{-1} res(k_{n-1}). This compares only the p-divisible-conductor branch. The alpha^{-n} normalization belongs to the tower, not to the unnormalized stabilized finite-level class.

CM points, basepoints and coefficient identifications are compatible with the field inclusions.

p splits, the imaginary quadratic discriminant is less than -3, all level primes split, and p does not divide 2N phi(N), in the weight-two CH range.

Use the same coefficient extension containing alpha and the actual continuous-cohomology restriction.

When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

At r=1, p^{2r-2}/alpha becomes alpha^{-1}.

Apply the quotient comparison at n and n-1.

Use restriction naturality and linearity; no initial-conductor formula is needed.

**Checks.**

- The coefficient is alpha^{-1}, not p/alpha.
- At n=1 the lower class is raw conductor-c_0, not an unverified stabilized bottom.
- A nonordinary alpha is rejected for integral normalization although the rational linear identity can be written.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`; **HeegnerPointEulerSystems HE.8/ordinary-stabilized-point**.

The source for this target is **CH22**, Section 5.2, Definition 5.2 and equation (5.1), pp. 22–23.

Separates positive-conductor stabilization from tower normalization.

<a id="positive-tail-corestriction"></a>

### GH.8.5: Corestriction of the normalized positive-conductor tail

In the preceding ordinary split setting, assume the actual geometric trace relation cor(k_n)=a_p k_{n-1}-res(k_{n-2}) and [K_n:K_{n-1}]=p for n>=2. Define y_n=alpha^{-n}(k_n-alpha^{-1} res(k_{n-1})) for n>=1. Then cor(y_n)=y_{n-1} for every n>=2. The uniquely determined bottom term is y_0=cor(y_1). Its Euler-factor expression is specified by initial-corestriction-comparison once the distinct first trace and degree have been supplied.

The lower restriction in the trace equation lands in K_{n-1}.

The raw trace and degree are geometric results, not postulated normalized Euler-system relations.

Corestriction after restriction is the degree; the lattice contains the raw classes and alpha is a unit for integral boundedness.

When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

Corestriction of k_n-alpha^{-1}res(k_{n-1}) is (a_p-p/alpha)k_{n-1}-res(k_{n-2}).

The Hecke polynomial gives a_p-p/alpha=alpha.

Multiply by alpha^{-n}.

The single equation at n=1 determines the bottom. The first-conductor comparison is distinct; GH.3 supplies the actual Iwasawa realization.

If two actual positive tails are identified by comparison maps commuting with the first corestriction, their norm-compatible bottoms agree by that commutative square. This determines the bottom from the tail, but does not identify the printed conductor-zero formula without the actual initial trace and normalization map.

Compare with HE.8 ordinary-stabilized-point, stabilized-corestriction and anticyclotomic-heegner-class at the actual ring-class levels before taking its anticyclotomic quotient; use the supplier’s layer shift if the p-part of the class group changes the indexing.

**Checks.**

- Check n=2 without a degree-p claim for K_1/K_0.
- Using 1/alpha in place of p/alpha fails the Hecke-polynomial calculation.
- The bottom is determined before expressing it using the two Frobenius operators.
- The abstract positive-tail calculation does not prove E(K)[p]=0. Verify this separately whenever importing the present HE.8 arithmetic realization.

Use [Comparison of positive-conductor stabilized classes](#positive-conductor-stabilization); **HeegnerPointEulerSystems HE.2/repeated-conductor-predecessor-recurrence**; **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); Mathlib `LinearMap`; **HeegnerPointEulerSystems HE.8/stabilized-corestriction**; **HeegnerPointEulerSystems HE.8/anticyclotomic-heegner-class**.

The source for this target is **CH18**, Proposition 4.4, printed pp. 591–593; Lemma 5.3, printed pp. 601–602.

The split recurrence is explicitly in the positive range; it is not a computation of the initial split case.

<a id="differential-evaluation"></a>

### GH.8.6: The modular differential factor in the logarithm comparison

Base change the quotient comparison to a finite unramified extension L_v/Q_p with the good-reduction models used in BDP Section 3. If pi^*omega_E=c_pi omega_f for the chosen invariant and modular differentials, then log_{E,omega_E}(pi(x_phi)-pi(b))=c_pi AJ_dR(e_f([x_phi]-[b]))(omega_f), transporting the realization and f-projection through the same quotient. Replacing the Abel--Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_pi^{-2}, not c_pi^{-1}. No claim that c_pi=1 or is a p-adic unit is made.

Use the GH.1 and PadicHodgeRegulators L1 local realization; do not extend the inspected unramified-base theorem without proof.

c_pi is the actual nonzero pullback scalar.

The f-projector fixes the differential and is compatible with the quotient and pairing.

The elliptic logarithm includes its compatible extension from the formal group to the rational Kummer image.

To use this comparison at a ramified conductor completion E, first obtain the finite-base-change restriction and corestriction/trace squares requested from GH.1 and PadicHodgeRegulators L1. The present comparison is over the stated unramified base; ramified base change needs those additional squares.

Localize the quotient/Kummer comparison.

Apply naturality of the Bloch--Kato logarithm and its formal-group comparison.

Use adjunction of the de Rham quotient and differential pullback.

Evaluate c_pi omega_f and square the resulting equality; cancellation uses c_pi nonzero.

**Checks.**

- Scaling omega_E by u scales the equality by u and its square by u^2.
- For c_pi=3 use 1/9, not 1/3, in the squared substitution.
- A p-divisible scalar need not preserve an integral principal ideal.
- The zero CM-power exponent at weight two does not cancel c_pi.
- A conductor c_0 p^n completion is not treated as unramified merely because the regulator coefficient extension is completed unramified. The local field and coefficient field are separate data.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); **PadicHodgeRegulators L1**; Mathlib `Module.Dual`; Mathlib `LinearMap.dualMap_apply`; Mathlib `LinearMap.dualMap_comp_dualMap`.

The source for this target is **BDP13**, Sections 3.2–3.4, printed pp. 1066–1070.

<a id="ordinary-p-old-family"></a>

### GH.8.7: Weight-two p-old specialization of the ordinary family

Use the integral Hida branch I, critically twisted representation T-dagger, and Howard class Z_{c_0,infinity} constructed in GH.7 with Castella's author-copy normalization. Let its reference form have even weight k>2 with k congruent to 2 modulo p-1, and let nu be an arithmetic specialization of weight two and trivial character with 2 congruent to k modulo 2(p-1). Suppose its form is the ordinary p-stabilization of a newform of level prime to p. With alpha=nu(a_p), the source-normalized comparison is nu(Z_{c_0,infinity})=z_{f_nu,c_0,alpha} in the identified Greenberg Iwasawa cohomology of T_{f_nu}(1). The coefficient-specialization and critical-twist identification are part of the map. This target does not identify every later version of the CH classes without a normalization map.

p does not divide 6N; c_0 is prime to pN; the imaginary quadratic discriminant is odd and less than -3; p splits.

For comparison with CH impose the all-split classical Heegner hypothesis; this is a restricted common range, not all ramified-level cases in Castella.

The residual representation is p-distinguished and remains irreducible over G_K. Retain the source ramification condition at primes dividing (D_K,N), vacuous in this common range.

Use the source lattices, ordinary filtration and specialization, not arbitrary rationally isomorphic representations.

Exclude p-new/multiplicative and nonordinary weight-two specializations.

Use the actual weight-two quotient/Kummer comparison to identify both inputs of Castella equation (6.6). GH.7 supplies moments, critical twists and the coefficient/regulator specialization maps of (6.8)--(6.9).

For global localization injectivity, follow Castella Lemma 6.4 through GH.7: torsion-freeness of the integral Greenberg module, specialization/control of the localization kernel, nonvanishing at infinitely many characters on every finite ring-class component, and the rank-one Selmer conclusion. Irreducibility alone is not that proof.

For local injectivity, GH.7 must transport the two-variable regulator of Loeffler--Zerbes Proposition 4.11, whose hypothesis is an infinite unramified direction, through CH Theorem 5.1's quotient construction. Identify the coefficient algebra and the source/target submodules P,Q before taking quotients. For its linear map f, the pinned Submodule.ker_mapQ gives the descended kernel as the image of f^{-1}(Q) in M/P. The sufficient equality f^{-1}(Q)=P is an additional arithmetic/analytic obligation; injectivity before quotienting does not imply it.

After the vector regulator descends injectively, evaluate on the specified nonzero dual vector of the one-dimensional ordinary crystalline line. CH (2022) Section 5.3 supplies the nonzero projection and the period relation (5.3); GH.7 must realize that pairing and coefficient extension. Evaluation on the full two-dimensional crystalline space is not injective in general.

Transport the source-version pairing and group-like factors before comparing (6.8)--(6.9). Apply local injectivity, then global localization injectivity. At weight two c_0^{r_nu-1}=1. Neither the quotient-kernel calculation nor the fixed-denominator lemmas supplies the missing period, realization or lattice maps.

**Checks.**

- Admit ordinary p-stabilizations of prime-to-p newforms, not p-new forms.
- Check both weight congruences, not just evenness.
- Keep the finite ring-class component; this is not automatically the class traced to K.
- Do not infer global-class equality from scalar regulator values without both injectivity statements.
- Injectivity must survive the actual quotient: multiplication by X on Q[X] is injective but induces the zero map on Q[X]/(X), a nonzero quotient. This is a regression against an invalid general inference, not a counterexample to the arithmetic source theorem.
- Nonzero evaluation on a one-dimensional line is injective. Projection from Q^2 to its first coordinate is not: (0,1) is lost. Keep the ordinary line, its dual vector and the nonzero pairing factor.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Higher-weight family specialization](#higher-weight-family-specialization); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [Localization injectivity at weight-two p-old points](#weight-two-p-old-localization); Mathlib `Submodule.mapQ`; Mathlib `Submodule.ker_mapQ`; Mathlib `Submodule.mkQ_map_self`; Mathlib `LinearMap.ker_eq_bot`.

The source for this target is **Castella**, Theorem 6.5, equations (6.8)–(6.9), p. 28; Remark 6.6, p. 29; **LZ14**, Proposition 4.11 and proof, p. 18; context Theorem 4.7, pp. 16–17; **CH22**, Theorem 5.1 and proof, pp. 21–22; Section 5.3, (5.3) and Lemma 5.5, p. 24; **Mathlib quotient modules**, Quotient/Basic.lean lines 228–229, together with 158–159 and Submodule/Ker.lean 199–200.

<a id="initial-corestriction-comparison"></a>

### GH.8.8: The initial Euler factor from the raw trace and degree

Let F be a field, M_0 and M_1 F-vector spaces, res:M_0->M_1 and cor:M_1->M_0 linear, and sigma,tau endomorphisms of M_0. Let alpha,u be nonzero scalars, and a,p,d scalars satisfying alpha^2-a alpha+p=0 and u d=p-1. If u cor(x_1)=a x_0-sigma(x_0)-tau(x_0), cor(res(x_0))=d x_0 and sigma(tau(x_0))=x_0, then cor(alpha^{-1}(x_1-alpha^{-1}res(x_0)))=u^{-1}(1-alpha^{-1}sigma)(1-alpha^{-1}tau)x_0.

This is the algebraic comparison lemma. The symbols p,u,d are scalars, not implicit arithmetic objects.

For application, HE.0 and HE.2 must identify u with the actual conductor-change unit index and d with the first field degree for the specified class convention.

Only sigma(tau(x_0))=x_0 is needed; no unmentioned splitting or commutation theorem is assumed.

Read the HE.0 conductor-change-kernel and ring-class-tower-quotients together with HE.2 split-ramified-first-step-recurrence. Transport their actual point trace through HE.3 Kummer naturality, keeping any cleared Hodge/basepoint factor. The algebraic identity below applies only once u, d, sigma and tau have been identified with these maps; a published positive-conductor recurrence does not prove this initial identification.

Expand corestriction by linearity, and multiply by u alpha. The raw trace and u d=p-1 yield (a-(p-1)/alpha)x_0-sigma(x_0)-tau(x_0).

The root identity gives a-(p-1)/alpha=alpha+alpha^{-1}.

Expand the two Euler factors and use sigma(tau(x_0))=x_0. Cancel the nonzero scalars.

In the actual ring-class application the degree and raw trace must first be transported through the level maps, cusp correction and quotient. This lemma does not certify that transport.

**Checks.**

- For sigma=tau=id the factor is u^{-1}(1-alpha^{-1})^2.
- Exact rational test: p=5, alpha=2, a=9/2, u=1, d=4, x_0=1, cor=id, res=4 and x_1=5/2 give normalized bottom 1/4. These are algebraic test data, not asserted modular-form coefficients.
- Using the full unit count 2 instead of the index 1 in that test predicts 1/8 and fails.
- No degree-p assertion is made for the initial step.

Use **HeegnerPointEulerSystems HE.0/conductor-change-kernel**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **HeegnerPointEulerSystems HE.2/split-ramified-first-step-recurrence**; **HeegnerPointEulerSystems HE.2/repeated-conductor-predecessor-recurrence**; **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`.

The source for this target is **CH18**, Section 5.2, Definition 5.2 and Lemma 5.3, printed pp. 601–602; **Castella**, Equation (6.7), author-copy p. 28.

New explicit algebraic comparison of the two branches; the paper is not claimed to supply the missing initial raw trace proof.

The half-unit normalization is a comparison target, not a substitute for identifying the raw geometric classes.

<a id="initial-only-rescaling-obstruction"></a>

### GH.8.9: Rescaling only the bottom breaks a nonzero norm relation

For a linear map cor:M_1->M_0 of vector spaces over a field F, suppose cor(y_1)=y_0 and y_0 is nonzero. For every scalar t different from one, cor(y_1) is not t y_0. Thus changing only the initial factor cannot be justified as a uniform change of normalization. Multiplying every level by t does preserve all norm relations.

The nonzero bottom hypothesis is essential; this test cannot prove nonvanishing of an arithmetic Heegner class.

An equality cor(y_1)=t y_0 would imply (1-t)y_0=0. Cancel 1-t in the field.

For a uniform rescaling, linearity gives cor(t y_1)=t cor(y_1); the same calculation works at every step.

**Checks.**

- In the rational model of initial-corestriction-comparison, the bottom 1/4 differs from 1/8.
- For bottom zero, every initial scalar has the same value; do not report a contradiction without nonvanishing.
- Scaling the whole system by 1/2 is allowed over Q and is distinct from scaling only y_0.

Use [The initial Euler factor from the raw trace and degree](#initial-corestriction-comparison); Mathlib `LinearMap`.

The source for this target is **CH18**, Definition 5.2 and Lemma 5.3, printed p. 601.

New negative test for a proposed normalization change. It does not assert a second independently established source error.

<a id="uniform-coherent-kernel-bound"></a>

### GH.8.10: A common reverse comparison bounds the tower kernel

Let R be a commutative ring, M_n,N_n R-modules, f_n:M_n->N_n and g_n:N_n->M_n linear, and d one fixed scalar. If g_n f_n=d id for every n, then every sequence x_n with f_n(x_n)=0 satisfies d x_n=0 for every n. In particular, this holds for every compatible sequence and bounds the kernel of the induced comparison of integral towers.

For the cycle/point application, M_n is the chosen coefficient summand on which the modular quotient is a rational isomorphism, not the entire Jacobian cohomology.

A reverse comparison on that summand and a single d for all levels are actual supplier obligations; level-dependent rational inverses do not suffice.

Apply g_n to f_n(x_n)=0. Its left side is d x_n and its right side is zero.

Interpret this componentwise conclusion in the existing compatible-sequence realization. No interchange of inverse limits and cohomology is used.

**Checks.**

- The statement permits torsion: d x=0 need not imply x=0 unless multiplication by d is injective.
- When d is a unit the bound gives injectivity.
- A bound d_n depending on n is not the asserted uniform conclusion.

Use [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`.

The source for this target is **CH22**, Section 5.2, equation (5.1) and the preceding integral inverse-limit construction, p.23.

<a id="uniform-coherent-lift"></a>

### GH.8.11: A common reverse comparison lifts a fixed multiple

Let M_n,N_n be R-module inverse systems with transitions mu_n and nu_n. Suppose linear f_n:M_n->N_n and g_n:N_n->M_n satisfy f_n g_n=d id for one scalar d independent of n, and mu_n g_{n+1}=g_n nu_n. Every compatible sequence y_n in N has the compatible sequence x_n=g_n(y_n) in M, with f_n(x_n)=d y_n at every level. Thus, when f is also transition-compatible, the cokernel of its tower map is annihilated by d.

The conclusion uses a compatible family of reverse maps; pointwise existence of preimages of d y_n is weaker and is not substituted.

R is a commutative ring. Neither d invertible nor module freeness is needed for the multiple-lifting statement.

The arithmetic application must construct the same fixed coefficient comparison at each field level, restricted to the correct f-summand.

Set x_n=g_n(y_n) without making independent lifting choices.

Naturality of g and compatibility of y give mu_n(x_{n+1})=g_n(nu_n(y_{n+1}))=x_n.

The other composite identity gives f_n(x_n)=d y_n.

Together with the kernel bound, localization at powers of a nonzero d gives the rationalized comparison when the coefficient ring is a domain. An integral isomorphism needs stronger input, for example d a unit.

**Checks.**

- For constant Z towers with f=2, g=id and d=2, twice every target element lifts but 1 does not.
- No right-exactness of inverse limits is invoked.
- For d a unit the explicit inverse is d^{-1}g; for nonunit d only the bounded kernel/cokernel conclusion is asserted.

Use [A common reverse comparison bounds the tower kernel](#uniform-coherent-kernel-bound); [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`.

The source for this target is **CH22**, Section 5.2, equation (5.1) and its integral inverse-limit carrier, p.23.

New explicit comparison proof for fixed denominator data; the actual geometric data remain requested.

<a id="unbounded-denominators-counterexample"></a>

### GH.8.12: Rational level isomorphisms need not compare integral limits

Take M_n=Z with transition multiplication by 2, N_n=Z with identity transitions, and f_n multiplication by 2^n. The f_n are compatible and become isomorphisms over Q at every level. Nevertheless the integral compatible sequences in M are only zero, whereas those in N are all constant integer sequences. Consequently (lim M_n) tensor Q -> (lim N_n) tensor Q is 0 -> Q and is not an isomorphism. This does not deny that the limit of the rationalized M_n has compatible sequences with increasing denominators.

Compatibility is 2^n(2x)=2^{n+1}x; the inverse over Q is multiplication by 2^{-n}.

For a compatible integral sequence x and fixed n, iteration gives x_n=2^k x_{n+k} for every k. If x_n is nonzero, the pinned integer divisibility bound forces 2^k<=|x_n|.

By induction 2^k>=k+1; choose k>|x_n| to contradict that bound. Thus every x_n is zero.

The constant sequence 1 survives in the target and has no integral compatible preimage. After tensoring the integral limits with Q the source stays zero.

In the rationalized source levels the sequence x_n=2^{-n} is compatible and maps to the constant sequence 1. Its denominators are unbounded, identifying precisely the illegitimate interchange.

**Checks.**

- Check the naturality identity at n=0 as well as positive n.
- Finite truncations admit nonzero integral solutions, so testing finitely many levels is not a proof about the infinite limit.
- The rational sequence 2^{-n} must be admitted in lim(M_n tensor Q) and excluded from every single bounded-denominator multiple of lim M_n.
- This is a regression example for a method, not a counterexample to the arithmetic theorems of CH.

Use Mathlib `LinearMap`; Mathlib `Int.natAbs_le_of_dvd_ne_zero`.

The source for this target is **CH22**, Section 5.2, equation (5.1), order of integral inverse limit and coefficient extension, p.23.

New explicit counterexample to replacing that order by levelwise rationalization without uniform control; not an example attributed to the source.

<a id="primitive-character-stabilization"></a>

### GH.8.13: Exact-conductor character comparison of stabilized classes

Let G be a finite abelian group, H a subgroup, R a commutative integral domain, M and N R-modules, chi:G->R^x a character with chi restricted to H nontrivial, and q:M->N R-linear. For functions a,b:G->M with b(g h)=b(g) for all h in H, every beta,c in R satisfy q(c sum_g chi(g)(a(g)-beta b(g)))=c sum_g chi(g)q(a(g)). No division by |H| or |G| and no torsion-freeness of M or N is required. For the weight-two application take G=Gal(K_n/K_0), H=Gal(K_n/K_{n-1}), n>=1, b(g)=g res(z_{n-1}), beta=alpha^{-1}, c=alpha^{-n}, with alpha a unit. This proves the finite weighted cycle/point comparison; identifying it with the actual twisted cohomological specialization is a further GH.3 map.

R contains the character values; alpha and its inverse lie in R for the integral arithmetic application. Over the coefficient field the same formula holds for any nonzero alpha.

The exact conductor condition must be translated to chi|H nontrivial for the actual ring-class quotient. A character nontrivial on G but inflated from G/H is excluded.

HE.3 supplies the quotient Galois action and H-invariance of the restriction image. The existing modular-quotient-kummer comparison supplies q, with equivariance when a(g)=g z_n.

This is a comparison on actual modules and finite sums, not a new character carrier, an averaging projector, an inverse-limit interchange or an assumed cohomological descent theorem.

View chi|H as the existing MulChar on the finite commutative group H (the nonunit condition is vacuous), and check it is not the trivial character. Apply the pinned MulChar.sum_eq_zero_of_ne_one to obtain the scalar equality sum_h chi(h)=0 in R.

Partition G into left cosets tH and choose representatives only for this finite proof. By b(t h)=b(t) and multiplicativity, the sum over tH of chi(t h)b(t h) equals chi(t)(sum_h chi(h))b(t), hence zero. Reindexing is the existing finite-sum API; the result is independent of the temporary representatives.

Sum over the cosets, expand the stabilized expression, and commute q with scalar multiplication and the finite sum. Cancellation happened in the coefficient ring before acting on M, so possible torsion of M is harmless.

For n>=1, use positive-conductor-stabilization and the quotient comparison at each conjugate to identify q(a(g)). Retain alpha^{-n}; do not replace the unit-root coefficient alpha^{-1} by p/alpha.

GH.3 must construct the finite-character evaluation of the integral Iwasawa class, the coefficient twist and its descent. CH Lemma 5.4 invokes Rubin Lemma 2.4.3 for this map. The finite-sum calculation is not a substitute for it and does not settle the conductor-zero branch.

**Checks.**

- For G=C2, H=G, chi(g)=(-1)^g and b constant, the lower sum is zero over Z, including after acting on a torsion Z-module.
- For G=C4 and H={0,2}, chi(g)=(-1)^g is nontrivial on G but trivial on H. With b(g)=(-1)^g, b is H-invariant and the weighted lower sum is 4. The weakened condition must be rejected.
- For G=C9, H={0,3,6}, R=F19 and chi(g)=4^g, the restriction is nontrivial and every H-invariant b has zero weighted sum. Exact finite-field computation tests the last-kernel condition independently of characteristic zero.
- The domain hypothesis is genuine: for R=Z/8, G=C2, H=G, chi(1)=3 and constant b=1, the character is nontrivial with 3^2=1 but its weighted sum is 4, not zero. This input must be rejected.
- For the trivial character, lower-conductor terms need not vanish. Ramified finite-character checks therefore do not by themselves verify the printed initial Euler factor.
- At n=1 the lower term is the raw conductor-c_0 class. No equality with an unverified stabilized bottom is used; the same alpha^{-n} scalar occurs on both sides.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [Character-weighted comparison without averaging](#character-sum-comparison); [Comparison of positive-conductor stabilized classes](#positive-conductor-stabilization); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); **HeegnerPointEulerSystems HE.0/conductor-change-kernel**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`; Mathlib `Equiv.prod_comp`; Mathlib `MulChar.sum_eq_zero_of_ne_one`.

The source for this target is **CH18**, Lemma 5.4 and its proof, printed p. 602; exact conductor cp^n and equation (5.1); **CH22**, Section 5.2, Lemma 5.4, printed p. 23, including the citation of Rubin Lemma 2.4.3; **Mathlib character sums**, Basic.lean, section sum, theorem sum_eq_zero_of_ne_one; finite commutative-monoid and integral-domain context.

The source uses exact conductor before dropping the lower term; the comparison spells out the last-kernel condition and supplies an integral coset proof. The separate specialization is not claimed constructed.

Separates the finite weighted-sum calculation from the cohomological evaluation/descent used by the source.

<a id="weight-two-reciprocity"></a>

### GH.8.14: Weight-two reciprocity through the modular quotient

Let f be the weight-two ordinary prime-to-p newform attached to E, with the CH standing hypotheses, p split in K and (c_0,Np)=1. Let psi have infinity type (1,-1) and conductor c_0. Use the GH.3 class z_f, its CH 2022 psi^{-1}-twist and finite-ring-class corestriction, and the GH.1 quotient coefficient map gamma_pi into V_p E. Let S_F be the completed unramified coefficient Iwasawa algebra on the same ring-class quotient used in CH Theorem 5.7. On the corresponding ordinary crystalline line let d_gamma be the induced coefficient map, and let ell_f be the CH functional written omega_f tensor t^{-2}. Transport the elliptic differential and CM generator to a functional ell_E satisfying ell_E composed with d_gamma = c_pi ell_f, where pi*omega_E=c_pi omega_f; this equality is an arithmetic comparison target. Then, for the transported vector regulator R_E and point Iwasawa class y_E=H^1_Iw(gamma_pi)(z_f), ell_E(R_E(y_E tensor psi^{-1})) = -c_pi L_{p,psi}(f) sigma_{-1,p} in S_F. The point class is identified with the HE.8 Kummer system using the actual first-corestriction square. After any defined coefficient/group-quotient homomorphism rho, the image is -rho(c_pi) rho(L_{p,psi}(f)) rho(sigma_{-1,p}). No invertibility of c_pi in the integral ring is asserted.

The common range is odd discriminant -D_K<-3, all primes of N split in K, p not dividing 2N phi(N), ordinary good reduction at p, and the actual level/cusp descent from GH.0--GH.1.

Use rational coefficients until the uniform integral comparison is supplied. The two-sided lattice maps are on the selected multiplicity-one f-factor; periods in the completed unramified extension are not automatically integral units.

For the psi-twisted differential, equation (5.3) introduces Omega_psi. Its generator and nonzero inverse must be transported explicitly when extracting ell_f. Changing omega_E or omega_psi changes both the functional and the formula.

The chosen coefficient map and distribution pushforward respect restriction, corestriction, twisting and crystalline duality. GH.7 supplies this anticyclotomic regulator diagram.

Finite-conductor local fields can be ramified over the unramified BDP base. GH.1 and PadicHodgeRegulators L1 must provide the de Rham/Bloch--Kato finite-base-change squares before differential-evaluation is used there; completed unramified coefficients do not remove this obligation.

When invoking the existing HE.8 point-system nodes, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

Apply the GH.4 CH22 reciprocity theorem at r=1: the conductor factor is c_0^0=1 and the scalar is negative, with the group-like sigma_{-1,p} retained.

Identify the positive finite-level cycle and point classes with modular-quotient-kummer, positive-conductor-stabilization and primitive-character-stabilization. Use GH.3 finite-character descent and the genuine first-corestriction comparison to identify their Iwasawa classes.

First apply the GH.1/PadicHodgeRegulators L1 finite-base-change restriction and corestriction/trace squares at each actual local conductor field. Then use differential-evaluation and GH.1 de Rham duality to compute the pullback of the elliptic functional. Insert the GH.4 CM-period and Tate-period maps; verify ell_E d_gamma=c_pi ell_f on the actual line. Do not apply the inspected unramified BDP theorem directly to a ramified completion.

Use GH.7 regulator naturality to move gamma_pi through the vector regulator, then evaluate the functional and apply the imported reciprocity identity. Apply rho as a ring homomorphism; do not infer an integral characteristic-ideal identity from a rational scalar equation.

**Checks.**

- At r=1 the factorial and c_0 power become 1; the minus sign and sigma_{-1,p} remain.
- Replacing omega_E by b omega_E multiplies the elliptic functional and c_pi by b. The scalar reciprocity identity changes by the same factor, and a squared logarithm formula changes by b squared.
- At a character theta the group-like term evaluates to theta(sigma_{-1,p}). It can be 1 or -1 on the full ring-class quotient; projecting to a pro-p Z_p quotient may kill it and must be stated.
- A map rho killing c_pi produces a zero image identity. This gives no nonvanishing conclusion and no licence to cancel rho(c_pi).
- Check E(K)[p]=0 before the present HE.8 identification, or request and prove a supplier extension. The scalar transport by itself imposes no such torsion vanishing.

Use [Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [The modular differential factor in the logarithm comparison](#differential-evaluation); [Corestriction of the normalized positive-conductor tail](#positive-tail-corestriction); [The initial Euler factor from the raw trace and degree](#initial-corestriction-comparison); [Exact-conductor character comparison of stabilized classes](#primitive-character-stabilization); [A common reverse comparison lifts a fixed multiple](#uniform-coherent-lift); **HeegnerPointEulerSystems HE.8/anticyclotomic-heegner-class**; [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Higher-weight family specialization](#higher-weight-family-specialization); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [Localization injectivity at weight-two p-old points](#weight-two-p-old-localization); Mathlib `LinearMap`; Mathlib `LinearMap.dualMap_apply`; [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); **PadicHodgeRegulators L1**.

The source for this target is **CH22**, Section 5.3, equations (5.3)–(5.5), Definition 5.6 and Theorem 5.7, pp. 24–25; **BDP13**, Sections 3.1–3.4, pp. 1065–1070; **CH22**, Section 4.5, de Rham base-change discussion, p. 19.

Functorial realization and its de Rham dual determine the sign and differential map; elliptic logarithm naturality is a supplier obligation.

States the de Rham scalar-extension identification. The additional Abel--Jacobi, Bloch--Kato logarithm and trace squares are explicit supplier requests, not conclusions inferred from this vector-space identity.

<a id="automorphic-reciprocity-export"></a>

### GH.8.15: Source-qualified ordinary inputs for automorphic congruences

Export to AutomorphicCongruences L2 the GH.4 CH 2022 scalar regulator identity and GH.7 Castella Theorem 5.3 with their actual coefficients and classes. For a Hida branch I and the character xi in the Castella author copy, set lambda=Psi(Frob_p)-1 and S_I=I[lambda^{-1}] completed tensor W. The family identity is R_Cas(loc_p(Z_{c_0,infty} tensor xi^{-1}))=L_{p,xi}(family) sigma_{-1,p} in S_I[[Gamma_tilde]], where R_Cas includes the printed finite-ring-class corestriction and group restriction. At a permitted specialization nu with nu(lambda) nonzero, the coefficient homomorphism sends the analytic distribution to the CH-convention L_{p,xi_nu}(f_nu) by Castella Theorem 2.11. The class moment is c_0^{1-r_nu} z_{f_nu,c_0,alpha} in the exact range of Theorem 6.5; the weight-two p-old extension uses ordinary-p-old-family and weight-two-reciprocity. For a continuous coefficient/group homomorphism rho defined on S_I[[Gamma_tilde]], the exact family identity transfers to rho(R_Cas(...))=rho(L_{p,xi}(family)) rho(sigma_{-1,p}). The CH identity transfers separately with its -c_0^{r-1} factor and t^{-2r} functional. Identify these source presentations only after the GH.4/GH.7 period, twist, pairing and coefficient diagram is proved.

The family has p not dividing 6N, odd discriminant -D_K<-3, the classical Heegner hypothesis, split p, ordinary and p-distinguished residual representation irreducible on G_K, and residual ramification at primes of (D_K,N) for the comparison. The common CH weight-two comparison imposes the stronger all-tame-primes-split hypothesis.

Theorem 6.5 requires a reference weight k congruent to 2 modulo p-1, weight 2r_nu>2 congruent to k modulo 2(p-1) and trivial character. At weight two use Remark 6.6 only when the specialization is p-old of prime-to-p level.

A specialization of I need not extend to S_I. If nu(lambda)=0, GH.7 must construct an integral/regular model and its moment; no evaluation of a pole is allowed.

The output is the native source identity and its defined transport. L2 constructs the automorphic congruence divisibility and compares its analytic function on the same lattice and character domain. Its Beilinson--Flach classes and its L2s semi-ordinary branch are separate inputs.

Reuse GH.7 Theorems 2.11 and 5.3, including the xi^{-1} critical twist, omega_family trivialization, lambda localization and completion. Track the local-to-global corestriction and restriction through the finite ring-class component.

Use GH.7 moments and ordinary-p-old-family to compare the class at admissible weights; use weight-two-reciprocity to compare the elliptic differential functional. Carry the CH and Castella pairings separately until the version diagram commutes.

Apply a defined continuous ring homomorphism rho to each exact equality. Verify its action on coefficients and group generators, and its commutation with the class/regulator specialization, rather than naming two distributions equal.

Hand these identities, their coefficient maps and their exact hypothesis ranges to L2. Period units, excluded height-one primes and resulting congruence divisibilities are proved by that consumer; the GH.8 export supplies no universal nonordinary specialization.

**Checks.**

- If nu(lambda)=0, a proposed map from S_I must be rejected unless a regular model has been proved. A denominator-cleared equality cannot be specialized by cancelling the zero denominator.
- Compare the positive Castella 5.3 sign with the negative CH 2022 sign and their t^{1-2r}/t^{-2r} conventions through actual maps; dropping the difference fails the export.
- Evaluate at a finite ring-class character before taking the anticyclotomic quotient, and check the image of sigma_{-1,p}; the full finite part cannot be replaced silently by a torsion-free group.
- A supersingular weight-two point does not pass the ordinary-family hypotheses. No claim about FW Beilinson--Flach classes follows from this Heegner identity.

Use [Weight-two p-old specialization of the ordinary family](#ordinary-p-old-family); [Weight-two reciprocity through the modular quotient](#weight-two-reciprocity); [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Higher-weight family specialization](#higher-weight-family-specialization); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [Localization injectivity at weight-two p-old points](#weight-two-p-old-localization).

The source for this target is **Castella**, Theorem 2.11 and proof, pp. 12–13; Proposition 5.2 and Theorem 5.3, pp. 22–23; Theorem 6.5 and Remark 6.6, pp. 28–29; **CH22**, Theorem 5.7, p. 25.

<a id="corrected-bsd-input-export"></a>

### GH.8.16: Higher-weight input comparison for the corrected multiplicative BSD proof

For each auxiliary ordinary prime-to-p-level newform g_m of even weight k_m>2 in the corrected Castella multiplicative proof, export the GH.2--GH.7 Heegner system with its actual lattice T_{g_m}, Selmer local conditions, character convention and completed unramified coefficients. In the source convention used by the proof, its initial Kolyvagin class agrees with the stabilized Iwasawa class kappa_{g_m,infty} through the higher-weight GH.5 comparison on the actual GH.3 class; GH.5 supplies that unit and its inverse, not just a rational nonzero multiple. Export the CH 5.7 scalar regulator formula -c_0^{r_m-1} L_{p,psi}(g_m) sigma_{-1,p}, and GH.7 Castella 2.11/5.3 analytic moments, along their proved normalization maps. Under any specified coefficient reduction R_{g_m} to R_{g_m}/p^m, these exact identities commute with reduction. The source Selmer containment and non-torsion conclusion must be proved under the precise tame-level hypotheses used for g_m. BSD.6a supplies the congruences T_{g_m}/p^m congruent to T_pE/p^m, the analytic-function congruence, control, both divisibilities and the limit argument; GH.8 supplies their source-qualified higher-weight inputs, without claiming a p-old cycle/point comparison for the p-new multiplicative weight-two form.

The corrected source has p>3, split p, an ideal M in O_K with O_K/M congruent to Z/MZ, residual irreducibility on G_K for g_m, a nonsplit q exactly dividing M, the stated nonsplit-special local automorphic type, and 2 exactly dividing M if 2 is nonsplit. The lattice congruence and rigidity arguments deriving these conditions belong to BSD.6a.

CH standing Hypothesis (H) instead assumes all tame primes split, and its factorial restriction is weight-dependent. Longo--Vigni admissibility and its exceptional set must also be verified. The export in the corrected source range therefore requires an explicit extension/adapter from GH.0--GH.7; the all-split theorem cannot be applied by dropping these conditions.

GH.2 must supply the CH erratum and the Kobayashi--Ota replacement for the derived local condition, not the original absolutely-unramified-only Lemma 7.5 at ramified conductor.

For E itself retain the corrected Theorem 1.1 conditions including E(Q_p)[p]=0 and the nonsplit residually ramified multiplicative prime. The transfer to E is congruence/control in BSD.6a, not Theorem 6.5 or Remark 6.6 at a p-new point.

Use the native higher-weight GH.3/GH.5 classes and GH.7 analytic moments directly. The all-split p-old weight-two comparison and the elliptic HE.8 class are not suppliers of the higher-weight leading-class unit. The generic fixed-denominator bounds do not replace that integral unit.

Read the corrected proof of Theorem 2.3 as an import list: CH (4.7) and Section 5.2 from GH.2/GH.3, CH Theorem 5.7 from GH.4, LV Theorem 4.7 and the integral leading-class unit from GH.5, and CH Theorem 6.1 non-torsion from GH.6. GH.7 supplies the native Castella Theorems 2.11/5.3 analytic inputs. Do not replan those systems.

Prove the source-range adapter for nonsplit tame primes and weight-dependent admissibility in GH.0--GH.7. Until it is supplied, retain the extension as a hypothesis of this export; the corrected consumer conclusion is not a proof of the adapter.

Compare the selected integral coefficient lattice, Iwasawa group action (including any inversion from discrete-dual conventions) and local conditions by actual maps. GH.5 supplies the higher-weight leading-class unit, and GH.7 the analytic moment identity in a defined coefficient model.

Apply coefficient reduction to the exact scalar reciprocity identities. Hand the resulting equalities and verified hypothesis packages to BSD.6a; that consumer compares with its Sigma-imprimitive analytic function and proves the congruence/control passage to the multiplicative elliptic curve.

**Checks.**

- An all-split auxiliary level fails the corrected Theorem 2.3 nonsplit-prime requirement; the CH all-split range and the corrected range need an explicit extension, not a common-range shortcut.
- A merely nonzero lattice multiplier, for example p, cannot replace the asserted p-adic unit relating the leading Kolyvagin class and kappa_{g_m,infty}.
- Reduction modulo p^m respects the displayed scalar equation, but reduction of characteristic ideals is not inferred from it. The congruence and Fitting/control calculation remains in BSD.6a.
- A p-new multiplicative weight-two form fails Remark 6.6. Reject a direct application, while retaining its valid auxiliary higher-weight and family analytic inputs.
- The supersingular BSTW/CLW branch has its own zeta elements and signed reciprocity. This ordinary export supplies none of those conclusions.
- The dependency graph for this export does not require a weight-two point comparison at an auxiliary nonsplit tame level. Its native higher-weight supplier range is checked separately.

Use [Source-qualified auxiliary inputs for the corrected BSD export](#bsd-auxiliary-range-adapter).

The source for this target is **BSD erratum**, Theorem 2.3 and proof, pp. 3–4; proof of Theorem 1.1 and footnote 1, p. 4; **CH erratum**, Lemma 7.5/Proposition 7.8 correction, p. 1.

<a id="bsd-auxiliary-range-adapter"></a>

### GH.8.17: Source-qualified auxiliary inputs for the corrected BSD export

For the actual sequence g_m of prime-to-p-level ordinary forms of even weights k_m>2 used in Castella Birch erratum, assemble the integral classes/local conditions of auxiliary-form-local-range, the leading-class unit of auxiliary-form-leading-class-unit and non-torsion of auxiliary-form-nontorsion. Supply the source-qualified higher-weight scalar reciprocity identity and native Castella analytic moments in coefficient models where reduction modulo p^m is defined. Record the precise allowed weight set and all denominators; an unbounded sequence cannot satisfy a fixed-p factorial exclusion. At a lambda-zero multiplicative point construct the required analytic regular model/cleared-denominator specialization, rather than applying the p-old cycle comparison. This adapter is the exact GH input to BSD.6a; BSD owns coefficient congruences, characteristic-ideal/control comparison and the limit argument.

Theorem 2.3’s ideal Heegner, special nonsplit local types, condition at 2, split p and residual irreducibility hold for each g_m. The consumer supplies the actual congruence sequence and lattices, not arbitrary weight specializations.

The new auxiliary local/system/non-torsion theorem targets and regular analytic model are proved before this export is applied. Their construction is a hypothesis of this export; the erratum’s conclusion supplies no proof of these inputs.

Identify the class in the three auxiliary targets with the source’s Section 5.2 stabilized class through exact lattice/tower maps and the computed unit v_g.

Prove the corresponding nonsplit-range scalar reciprocity comparison and identify its distribution with the native Castella analytic moment in a regular coefficient model; retain all unit, sign, period and finite-component maps.

Apply the defined reduction maps to the exact equalities. Hand the resulting identities and unit inverses to BSD.6a, which performs the congruence/control transfer to the p-new multiplicative elliptic form.

**Checks.**

- All-split CH/LV and nonsplit auxiliary hypotheses cannot be conflated. Reduction of v_g preserves a unit, while reduction of an arbitrary nonzero scalar can annihilate the leading class.

Use [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Integral auxiliary-form Kolyvagin system and leading unit](#auxiliary-form-leading-class-unit); [Non-torsion in the auxiliary-form source range](#auxiliary-form-nontorsion); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Family square-root measure specialization](#family-measure-specialization); [Two-variable explicit reciprocity](#two-variable-explicit-reciprocity).

The source for this target is **BSD erratum**, Theorem 2.3 and proof, pp.3–4; proof of Theorem 1.1 and footnote 1, p.4.

Exact import list, auxiliary congruence weights and analytic transfer; the missing source-range adapter is stated separately.

### Examples

With p=5, α=2, a=9/2, u=1, d=4, x₀=1, cor=id, res=4 and x₁=5/2 the normalized initial class is 1/4. Replacing u by the full unit count 2 predicts 1/8. In constant Z towers f=2 and g=id lift twice every class, while 1 itself need not lift.

### Dependencies

[The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [Newform and CM coefficient projector](#newform-cm-projector); [Good model comparison for the CM product](#cm-product-good-model); [Degree-one Picard–Kummer and Gysin comparison](#degree-one-picard-kummer-comparison); [Uniform integral transport on the selected newform factor](#uniform-integral-factor-transport); [Local degree-one comparison over conductor fields](#degree-one-local-realisation); **HeegnerPointEulerSystems HE.1/heegner-points-of-conductor-m-and-the-modular-parametrisation**; **HeegnerPointEulerSystems HE.3/kummer-classes-and-the-modified-selmer-conditions**; Mathlib `LinearMap`; [Iwasawa Heegner class](#iwasawa-heegner-class); [First-step stabilization adapter](#stabilized-first-step-adapter); [Finite-character moments and exact conductor](#finite-character-moment-descent); **HeegnerPointEulerSystems HE.8/ordinary-stabilized-point**; **HeegnerPointEulerSystems HE.2/repeated-conductor-predecessor-recurrence**; **HeegnerPointEulerSystems HE.8/stabilized-corestriction**; **HeegnerPointEulerSystems HE.8/anticyclotomic-heegner-class**; **PadicHodgeRegulators L1**; Mathlib `Module.Dual`; Mathlib `LinearMap.dualMap_apply`; Mathlib `LinearMap.dualMap_comp_dualMap`; [Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [Transport of source periods, twists and differentials](#source-period-and-twist-transport); [Higher-weight family specialization](#higher-weight-family-specialization); [Ordinary-line application of regulator quotient descent](#ordinary-regulator-quotient-application); [Localization injectivity at weight-two p-old points](#weight-two-p-old-localization); Mathlib `Submodule.mapQ`; Mathlib `Submodule.ker_mapQ`; Mathlib `Submodule.mkQ_map_self`; Mathlib `LinearMap.ker_eq_bot`; **HeegnerPointEulerSystems HE.0/conductor-change-kernel**; **HeegnerPointEulerSystems HE.0/ring-class-tower-quotients**; **HeegnerPointEulerSystems HE.2/split-ramified-first-step-recurrence**; Mathlib `Int.natAbs_le_of_dvd_ne_zero`; Mathlib `Equiv.prod_comp`; Mathlib `MulChar.sum_eq_zero_of_ne_one`; [Local conditions in the BSD auxiliary-form range](#auxiliary-form-local-range); [Integral auxiliary-form Kolyvagin system and leading unit](#auxiliary-form-leading-class-unit); [Non-torsion in the auxiliary-form source range](#auxiliary-form-nontorsion); [Family square-root measure specialization](#family-measure-specialization); [Two-variable explicit reciprocity](#two-variable-explicit-reciprocity).
