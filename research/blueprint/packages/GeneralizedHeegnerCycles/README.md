# Generalized Heegner cycles

This roadmap constructs generalized Heegner cycles on products of Kuga–Sato varieties and CM elliptic curves, their étale and p-adic Abel–Jacobi classes, ordinary norm-compatible systems, and their explicit reciprocity laws. It then relates these classes to Selmer groups and ordinary Hida families. The final layer checks the weight-two specialization against divisors, Kummer classes and Heegner points, keeping the integral lattice and initial conductor step visible.

The geometry and its realization maps come before the Euler-system arguments. A rational correspondence identity, an integral class, a character specialization and a Selmer local condition are separate results. Every comparison below specifies its coefficient module, field, normalization and compatibility maps; none follows merely from an equality of rational ranks.

## Boundaries and conventions

**ModularCurvesPartII R14.3** supplies the modular curve, universal elliptic family, compactified and resolved classical fiber powers W_m, the classical correspondence ε_W, and the integral newform lattice comparison. **ComplexMultiplicationAndExplicitReciprocity CM.1** and **HeegnerPointEulerSystems HE.1** supply canonical CM curves, marked ideal isogenies and their reciprocity. This roadmap constructs the product with the CM factor, its projector and cycles, and the new comparisons on that product. The general Chow, Gysin, de Rham, étale, syntomic and continuous-cohomology theories remain with their cited geometric and cohomological roadmaps.

**KolyvaginSystemsAndSelmerBounds KS** owns the abstract descent machinery; **PadicHodgeRegulators L3**, with its relative Lubin–Tate and two-variable extension, supplies the local regulators, integral twisting and unramified coefficient descent specified below. **AutomorphicPadicLFunctions L3h** owns the GL₂ square-root distribution and its interpolation. **GrossZagierAndArithmeticHeights GZ.9** consumes the weight-zero GL₂ formula here and owns its quaternionic and exceptional branches. **AutomorphicIwasawaMainConjectures L2** and **BSD** consume the reciprocity and comparison maps here, and own their congruence, divisibility and control arguments. Generalized Heegner classes are not identified with Beilinson–Flach classes.

Write K for an imaginary quadratic field, H_K for its Hilbert class field, O_c=ℤ+cO_K for the order of conductor c, and K_c for the ring class field. A chosen level point may require a ray extension K̃_c; its field of definition must be retained until descent is proved. The canonical CM action is normalized by [a]*ω_A=aω_A. The conjugate eigenvector η_A satisfies ⟨ω_A,η_A⟩=1. Replacing ω_A by bω_A replaces η_A by b⁻¹η_A.

In the BDP notation m=k−2; in the Castella–Hsieh notation k=2r and m=2r−2. The product X_m=W_m×A^m has dimension 2m+1, and its graph cycle has codimension m+1. Weight two means m=0 and r=1; its homologically trivial cycle is a point minus a degree-one cusp. The graph of an automorphism acts with the correspondence and pullback conventions fixed below. The permutation sign in ε_A cancels the graded Künneth sign.

Use geometric Frobenius in the newform representation and the displayed Tate twists. Identify all coefficient fields and lattices before applying a projector. In particular p∤2Nm! does not by itself remove the newform congruence denominator. A smooth proper model of the CM factor is an independent input, not a consequence of p∤N. For small source levels N≤4, descend from an auxiliary fine level with the CM structures, projectors and denominator bounds included.

In CH statements, the standing hypotheses mean: f is a newform of weight 2r≥2 and trivial nebentypus, the coefficient field contains its Fourier coefficients, K has odd discriminant −D_K<−3, p∤2(2r−1)!Nφ(N), the character conductor is prime to N, every prime dividing N splits in K, and p splits with the selected p-adic place. Ordinarity is added where the target requires it; the critical rank-one character interval is −r<j<r. These hypotheses are those of CH22, Introduction, Hypothesis (H), pp. 1–2. The nonsplit tame-prime extension in the final export is a separate construction with its own hypotheses.

The two sources use different unit factors. Castella–Hsieh Definition 5.2 uses the full unit number |O_c×|, whereas Castella Theorem 6.5 uses u_c=|O_c×|/2. Positive-conductor normalization does not determine the initial class. A rescaling at level zero must also satisfy the first corestriction equation.

## Library starting points

Use Tau Ceti's native `TauCeti.AlgebraicGeometry.AbelianVariety`, its `End` ring, `mulBy` and `IsIsogeny` for the CM curve and its marked isogenies. The isogeny predicate concerns the finite, surjective geometric homomorphism. Kernel cardinality agrees with geometric degree only after the relevant characteristic-zero and geometric-point comparison. Use the existing Weil-divisor degree-zero and Abel–Jacobi class APIs for the divisor-level part of weight two; their class-group constructions do not supply the continuous Tate-module Kummer comparison.

Mathlib's `Module.End`, `Module.Dual`, `LinearMap.ker`, `LinearMap.range`, `Submodule.span`, quotient modules, finite character sums, smooth morphisms and proper morphisms provide the algebraic vocabulary. Use `Submodule.mapQ`, `Submodule.ker_mapQ` and `LinearMap.ker_eq_bot` for quotient comparisons, and `MulChar.sum_eq_zero_of_ne_one` for character cancellation. Apply the scheme fiber-product smoothness and properness APIs to the good-model product. Import these constructions rather than introducing private replacements.

The algebraic fixtures in [Suggested.lean](Suggested.lean) test the actual normalization operators: CM endomorphisms, signed averages, the literal conductor order, Coleman primitives, norm normalization and fixed-denominator comparison maps. They do not manufacture a geometric cohomology theory. The mathematical targets and their arithmetic hypotheses in this README are definitive.

## Source conventions

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
- **BSD erratum**: Francesc Castella, [Erratum to On the p-part of the Birch–Swinnerton-Dyer formula for multiplicative primes](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf); Five-page author erratum; acquired copy includes Theorem 2.3 and its proof.

LV16 denotes the version-one preprint, not the 2019 version of record. CH22 page numbers refer to the 40-page author revision; CH18 page numbers are journal pages. BDP13 page numbers are printed Duke pages. Castella, KO, LZ14 and the errata use the pages of the linked copies. The corrected local-condition and parity statements incorporate the cited Castella–Hsieh erratum.

## Required dependency interfaces

The citations in each target use the following precise exports. Construct these in their cited owner, and import them with the displayed coefficient conventions.

- **ModularCurvesPartII R14.3**: the canonical desingularized generalized-elliptic fiber power W_m over X₁(N), its smooth proper model over ℤ[1/N], N-torsion averaging and signed projector with denominator N^m2^m m!, projected cohomology in degree m+1, parabolic Hodge filtration, Hecke action and newform factor. The lattice comparison must specify a Hecke congruence denominator. Include auxiliary fine-level descent for N≤4, with degrees, CM marks and all denominator changes.
- **ComplexMultiplicationAndExplicitReciprocity CM.1**, with **HeegnerPointEulerSystems HE.1–HE.2**: normalized CM action and Hodge characters; marked ideal quotients, target-order classification, conductor-changing neighbors and marked-isogeny descent over H̃·H_c, including the exceptional unit fields. Identify finite geometric kernels and isogeny degrees over an algebraically closed characteristic-zero field. For B=Res_{H_K/K}A, construct the G_K action on its Tate module and the full symmetric-power character summands, including the finite-order twist χ_t, integral projector and class-inclusion denominators. Do not commute symmetric powers with induction.
- **DerivedDeRhamCohomology DD.2** and **EtaleDualityAndPerverseSheaves EDC.6**: filtered scheme-level de Rham and rational p-adic étale Künneth, cup products, cycle classes and correspondence action. For rational étale cohomology, prove the passage from finite coefficient systems with derived-limit control. Include the rational Gysin sequence, Tate twists, support enlargement and rational-equivalence independence of the cycle extension.
- **SchemeAndStackFoundations SF.5**: rational Chow groups with proper pushforward, flat pullback, products of isogeny graphs, composition and transpose of correspondences, and their base-change action. Relate this intersection theory to the degree-zero cycle complex and to the support-independent Gysin construction. Use **ArithmeticGaloisDuality R02.1** to identify continuous extension classes with H¹ by the cocycle g↦g·lift(1)−lift(1), including change of lift, restriction and coefficient naturality. The compact five-term sequence in R02.2 supplies the distinct integral descent step.
- **PadicHodgeTheory R06.2 and R06.5**: negative-weight filtered Frobenius extension comparison, Φ=Φ₀^[F:ℚ_p], the holomorphic-minus-Frobenius quotient, and the proper smooth comparison for projected X_m. Establish the geometric Abel–Jacobi finite-local condition also after finite ramified support-field extensions; retain D_cris over the maximal unramified subfield and D_dR over the full field.
- **PadicDifferentialEquationsAndRigidCohomology RD.3–RD.4**: overconvergent coefficient F-isocrystals, wide-open algebraic/rigid comparison, annular and cusp residues, the rigid residue theorem and the Čech–de Rham cup pairing. Give the actual analytic section and differential carriers, connection and F-linear Frobenius polynomial action, and prove that the modular differential lies in the admissible image used by the normalized Coleman constructor.
- **PadicHodgeRegulators D.2**: the higher-dimensional Chow-cycle syntomic Abel–Jacobi regulator for smooth proper X_m, compatible with correspondences, proper/flat maps, the étale Gysin extension and the Bloch–Kato logarithm. The regulator on Spec O_F and the K₂ curve specialization supply different comparisons.
- **PadicHodgeRegulators L1 and L3**, with the **L3 relative and two-variable extension**: logarithm naturality for quotient maps and finite local extensions, including ramified extensions, with its actual filtration quotient and differential functional; corestriction adjoint to field trace. Supply the relative Lubin–Tate integral Ω map, lattice and finite-pairing compatibility, CH Theorem 5.1 in both interpolation ranges, Castella Theorem 3.4 on the ideal J, the Yager trace module and covariance, and the localized two-variable map of Castella Theorem 3.7/Corollary 3.9. Prove the descended quotient kernel comparison and the survival of the nonzero crystalline-line pairing. At a specialization killing λ_reg, use a regular coefficient model or a proved cleared-denominator identity.
- **AutomorphicGaloisRepresentations R19.1 and R19.6**, with **PadicFamilies L0**: the newform representation and stable lattice in the geometric-Frobenius convention; the determinant-restricted big-image subgroup and its solvable-tower invariant vanishing. Supply the ordinary Hida Jacobian tower representation, rank-two freeness, rank-one ordinary sequence, determinant, trace and arithmetic specialization after critical twist. **HE.1** supplies the p-power-level CM point tower, its diamond character and degeneracy traces.
- **AutomorphicPadicLFunctions L3h**: one GL₂ square-root distribution, negative θ powers on p-depleted ordinary CM expansions, BDP toric interpolation and continuity, CH nonvanishing with the auxiliary residual hypotheses of Hsieh Theorem C, and Castella family interpolation with all periods, epsilon, Euler and gamma factors.
- **EulerSystemsAndKolyvaginSystems ES.5**: retain separate interfaces for clean Howard H0–H5 descent and CH anticyclotomic descent with bounded local errors and Nekovář constants. The latter must prove residual detection, finite–singular correction, admissible-prime supply and the p^C annihilator under CH's own hypotheses. **SelmerIwasawaCohomology L4** supplies source-qualified Greenberg/Bloch–Kato comparisons and the corrected Nekovář family parity theorem with its precise self-dual family and local plus-module assumptions.

The weight-two layer also needs explicit internal adapters: the empty fiber-power and quotient correspondence in GH.0; the finite Picard–Kummer/Gysin cocycle comparison and degree-one de Rham functional in GH.1; uniformly bounded forward and reverse lattice maps and finite-character descent in GH.3; the period, sign and group-like-factor transport in GH.4; and the integral leading-class unit in GH.5. Their extension to the nonsplit tame-prime auxiliary-form range of the corrected multiplicative BSD theorem is part of GH.8's final export target. Its p-new elliptic specialization is reached by the BSD congruence and control argument, rather than by a p-old cycle/point comparison.

<a id="layer-gh-0"></a>

## Layer GH.0: CM geometry, projectors and coefficient realizations

<a id="cm-elliptic-curve-and-its-hodge-splitting"></a>

### GH.0.1: The CM elliptic curve A and the algebraic splitting of H¹_dR(A)

A CM elliptic curve is an elliptic abelian variety A/H, with H containing the Hilbert class field of the imaginary quadratic K, and a specified isomorphism O_K ≅ End_H(A), normalized so [α]*ω=αω. For F⊇H, H¹_dR(A/F)=Fω⊕Fη, where η lies on the conjugate CM eigenline and ⟨ω,η⟩=1. At an ordinary good split prime this conjugate eigenline is the unit-root line. No good model is inferred from the level N.

**Hypotheses and conventions.**

- The normalization of the O_K-action is on differentials: [α]^*ω = αω. The opposite normalization swaps H^{1,0} and H^{0,1}.
- Existence of A over H with End_H(A) = O_K, and its descent, are HeegnerPointEulerSystems HE.1's and ComplexMultiplicationAndExplicitReciprocity CM.1's.
- The two-character coordinate fixture is a realization of the specified CM endomorphisms through A.cm, not a construction of H¹_dR. Its comparison with the geometric carrier is imported from CM.1 and the de Rham owner.

**Required API.**

- `CMCurve.h10`: The identity-character eigenvector ω lies in ker([α]*−α).
- `CMCurve.h01`: The conjugate-character eigenvector η lies in ker([α]*−ᾱ).
- `CMCurve.hodgeSplitting`: The two distinct CM eigenlines span the cohomology space and have zero intersection.
- `CMCurve.etaOfOmega`: CMCurve.etaOfOmega(b,ω,η) is b(ω,η)⁻¹η, using an actual nonzero vector on the conjugate CM eigenline.
- `CMCurve.map_eigenvector`: A linear realization map commuting with the CM action transports a character eigenvector to an eigenvector with the same character value.
- `CMCurve.etaOfOmega_spec`: When b(ω,η) is nonzero, the constructed vector pairs to 1 and is the unique scalar multiple of η that does so.

**Tests and boundary cases.**

- `cmCurve_i_action`: For a CM curve A with O_K=Z[i], realize the actual endomorphism A.cm(i) by the two characters through A.cm⁻¹. On the ordered basis it sends (1,0) to (i,0) and (0,1) to (0,−i). Conjugate the CM isomorphism on the same curve, keep A’s original realization fixed, and check the new i-endomorphism sends (1,0) to (−i,0), unequal to (i,0). This rejects the opposite CM normalization; the geometric realization identification is the CM.1/de Rham export.
- `cmCurve_normalization`: For the determinant cup pairing on C², compute CMCurve.etaOfOmega((2,0),(0,1))=(0,1/2). Check its pairing with (2,0) is 1 and the i-action has conjugate eigenvalue −i. The test calls the normalization constructor itself.
- `cmCurve_scalar_endomorphism`: The specified ring isomorphism sends the integer n to the endomorphism whose underlying map is the native mulBy(A,n), so the CM and abelian-variety scalar actions agree.

**Prerequisites.** Tau Ceti: `TauCeti.AlgebraicGeometry.AbelianVariety`; Tau Ceti: `TauCeti.AlgebraicGeometry.AbelianVariety.End`; **HeegnerPointEulerSystems**, **HE.1** — canonical model cm descent; **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**; Tau Ceti: `TauCeti.AlgebraicGeometry.AbelianVariety.mulBy`; Mathlib: `Submodule.span`; **DerivedDeRhamCohomology**, **DD.2**.

**Sources.** **BDP13**, §1.4, p. 1051; **BDP13**, §1.4, (1.4.1), p. 1051; **BDP13**, §1.4, (1.4.2), p. 1052.

<a id="cm-projector-and-symmetric-power"></a>

### GH.0.2: The projector ε_A on A^m and Lemma 1.8

For m≥0 let Ξ_m=μ₂^m⋊S_m act on A^m by inversion and permutation, and χ_m be the product of the inversion signs and the permutation sign. Define ε_A=(2^m m!)⁻¹Σ_g χ_m(g)Γ_g as a rational correspondence. Its realization is idempotent and projects H^j(A^m) to Sym^m H¹(A) in degree m and to zero otherwise. The permutation sign cancels the graded Künneth sign; it must not be replaced by unsigned geometric symmetrization.

**Hypotheses and conventions.**

- The denominator 2^m m! must be inverted. ε_A is not in ℤ[Aut(A^m)], so an integral projector needs 2 and m! invertible.
- The sign twist on S_m is essential. By the Koszul rule, geometric permutations act on H¹^{⊗m} with the sign, so the twisted sum is the symmetrization. Without the twist the sum projects to ∧^m H¹, which vanishes for m ≥ 3.
- Only μ_2 ⊂ O_K^× is used. For K = ℚ(i) or ℚ(√−3) the larger unit group gives further characters, which the character decomposition below records.

**Required API.**

- `epsA_idem`: ε_A²=ε_A for the graph action of Ξ_m.
- `epsA_image`: Its range is the χ_m-isotypic subspace of the tensor realization.
- `epsA_transpose`: The inverse-graph involution fixes ε_A.
- `epsA_natural`: An equivariant linear map intertwines the signed character average with the same average on the target realization.

**Tests and boundary cases.**

- `epsA_order`: On the eight word tensors of a rank-two vector space cubed, use the actual S_3 action ρ(σ)v(w)=sgn(σ)v(w∘σ). The signed epsA average sends e_001 to (e_001+e_010+e_100)/3 and fixes e_000. The inversion part is already identity on this all-H¹ summand of the full Ξ_3 average, whose denominator is 48.
- `epsA_weight_zero`: At m=0 the projector acts as the identity on H⁰(A⁰)=F.
- `epsA_koszul`: For that same graded S_3 action, epsA with the sign character has image dimension 4, while epsA with the trivial character is the zero operator: Λ³ of a rank-two space vanishes. This distinguishes symmetric projection from unsigned geometric averaging.

**Construction or proof route.** Idempotence: j is a character of Ξ_m, so ε_A = (1/|Ξ_m|) Σ j(ξ)ξ is the idempotent of the character j in ℚ[Ξ_m]. Künneth: H^*(A^m) = ⊕ H^{i_1} ⊗ … ⊗ H^{i_m}, and [−1] acts on H^i by (−1)^i. So the μ_2^m-part of ε_A kills every summand with some i_k ≠ 1, leaving H¹^{⊗m}. On H¹^{⊗m}, the geometric action of σ ∈ S_m is sgn(σ) times the permutation of tensor factors (odd classes anticommute). The j-twisted average is therefore the symmetrizer, with image Sym^m H¹. Use SF.5 for rational graph correspondences and their composition; use DD.2 for the correspondence-compatible de Rham realization and graded Künneth action. Other realizations require their own compatible product export.

**Prerequisites.** [GH.0.1: The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting); **SchemeAndStackFoundations**, **SF.5**; Mathlib: `LinearMap`; Mathlib: `LinearMap.range`; **DerivedDeRhamCohomology**, **DD.2**.

**Sources.** **BDP13**, §1.4, (1.4.4), p. 1052; **BDP13**, §1.4, Lemma 1.8, p. 1052; **BDP13**, §1.4, p. 1052.

<a id="cm-character-decomposition"></a>

### GH.0.3: The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters

For 0 ≤ j ≤ m, the classes ω_A^jη_A^{m−j} := ε_A(p_1^*ω_A ∧ … ∧ p_j^*ω_A ∧ p_{j+1}^*η_A ∧ … ∧ p_m^*η_A) form a basis of ε_A H^m_dR(A^m/F) = Sym^m H¹_dR(A/F). The diagonal action of α ∈ O_K on A^m acts on ω_A^jη_A^{m−j} by α^jᾱ^{m−j}. Moreover ω_A^jη_A^{m−j} = (j!(m − j)!/m!) Σ_{|I| = j} p_1^*ϖ_{1,I} ∧ … ∧ p_m^*ϖ_{m,I}, where ϖ_{i,I} = ω_A for i ∈ I and η_A otherwise.

**Hypotheses and conventions.**

- The Hodge type of ω^jη^{m−j} is (j, m − j), and Fil^m Sym^m H¹ is spanned by ω^m.
- Rescaling ω_A by λ multiplies ω^jη^{m−j} by λ^{2j−m}, because η_A scales by λ⁻¹. Formulas of GH.4 depend on this normalization.

**Tests and boundary cases.**

- m = 2: the basis is ω², ωη, η², with characters α², |α|², ᾱ².

**Prerequisites.** [GH.0.2: The projector ε_A on A^m and Lemma 1.8](#cm-projector-and-symmetric-power); [GH.0.1: The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting).

**Sources.** **BDP13**, §1.4, (1.4.6), p. 1053.

<a id="generalized-kuga-sato-variety-and-its-projector"></a>

### GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A

Over F⊇H form X_m=W_m×_F A^m, dim X_m=2m+1, and ε_X=ε_W ε_A using commuting factor correspondences. ε_W is the imported universal-family projector, including the N-torsion averaging and sign projector. ε_X is self-transpose and is defined over Z[1/(2N m!)] at the level of denominators; this does not assert that X_m itself has a model over Z[1/N].

**Hypotheses and conventions.**

- The denominators are those of ε_W^{(1)} (N^m), ε_W^{(2)} (2^m m!) and ε_A (2^m m!), so ε_X is integral after 2N·m! is inverted. Record this denominator before asserting an integral projector.
- Characteristic 0 only: the desingularization and smoothness of W_m are used over F ⊇ H of characteristic 0, as imported. The integral model over ℤ[1/N] (Conrad's appendix) is not used here.
- N > 4 makes the universal generalized elliptic curve over X₁(N) exist as a scheme.

**Required API.**

- `epsX_commute`: For commuting factor realizations, interchanging ε_W and ε_A leaves ε_X unchanged. The geometric factor-commutation input comes from their separate factor actions.
- `epsX_idem`: The commuting product of the two idempotents is idempotent.
- `epsX_factor`: ε_X acts by applying ε_A and then ε_W.
- `epsX_denominator`: The product-projector denominator is N^m2^{2m}(m!)²; inverting 2N m! clears it.

**Tests and boundary cases.**

- `X_dim`: At m=2, X has dimension 5 and the graph cycle has codimension 3.
- `epsX_weight_zero`: With the CM factor trivial, ε_X=ε_W.
- `epsX_factor_test`: On a supplied tensor-factor realization the action is the composite, in the displayed order.

**Prerequisites.** **ModularCurvesPartII**, **R14.3**; [GH.0.2: The projector ε_A on A^m and Lemma 1.8](#cm-projector-and-symmetric-power); **SchemeAndStackFoundations**, **SF.5**.

**Sources.** **BDP13**, §2.2, p. 1060; **BDP13**, §2.2, (2.2.1), p. 1061; **BDP13**, §2.1, (2.1.2), p. 1057.

<a id="cohomology-of-the-generalized-kuga-sato-variety"></a>

### GH.0.5: Projected middle cohomology

For m≥1, ε_X H*_dR(X_m)=ε_X H^{2m+1}_dR(X_m)=H¹_par(C,L_m,∇)⊗Sym^m H¹_dR(A). In the p-adic étale realization, ε_X H^{2m+1}_et(X_m,Fbar,Q_p)≅H¹_par(C_Fbar,𝕃_m)⊗Sym^m H¹_et(A_Fbar,Q_p), Galois-equivariantly. The projector kills every other cohomological degree. In particular ε_X H^{2m+2}(X_m)=0. The Hodge-filtration identification is the separate projected-hodge-filtration theorem.

**Hypotheses and conventions.**

- The imported Scholl realization has ε_W H*(W_m)=H¹_par(C,L_m) in degree m+1. Both product realizations and their correspondence-compatible Künneth isomorphisms are supplied.
- The degree-2m+2 vanishing is the input for GH.1 null-homology; the m=0 divisor uses its degree-zero correction.

**Tests and boundary cases.**

- For m=1 the projected H³ of the universal elliptic surface times A is H¹_par(C,L₁)⊗H¹(A), of dimension 4 dim S₃(Γ₁(N)).

**Construction or proof route.** Apply the supplied de Rham Künneth decomposition for W_m×A^m, respecting both factor projectors. The CM projector kills degrees other than m; the modular projector kills degrees other than m+1. Their surviving tensor summand is therefore in degree 2m+1. Use the rational p-adic étale Künneth export and the same graph actions to obtain the Galois-equivariant identification.

**Prerequisites.** **ModularCurvesPartII**, **R14.3**; [GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); **EtaleDualityAndPerverseSheaves**, **EDC.2:pairings** — adic and rational poincare duality; **DerivedDeRhamCohomology**, **DD.2**; **EtaleDualityAndPerverseSheaves**, **EDC.6**.

**Sources.** **BDP13**, §2.2, Proposition 2.4, p. 1061; **BDP13**, §2.2, proof of Proposition 2.4, p. 1062.

<a id="projected-hodge-filtration"></a>

### GH.0.6: Projected Hodge filtration

For m≥1 and X_m/F with its supplied de Rham realization, f⊗α↦ω_f∧α identifies S_{m+2}(Γ₁(N),F)⊗Sym^m H¹_dR(A/F) with Fil^{m+1}(ε_X H^{2m+1}_dR(X_m/F)). The entire symmetric CM factor occurs, not only its holomorphic line. This is the filtration piece used as the domain of the p-adic Abel–Jacobi dual functional.

**Hypotheses and conventions.**

- The modular projected factor has Hodge types (m+1,0) and (0,m+1), with Fil¹=Fil^{m+1}=S_{m+2}; the CM symmetric factor has Hodge filtration in degrees 0 through m.
- Use the field of definition and filtered de Rham product export of the preceding realization theorem.

**Tests and boundary cases.**

- At m=1 the filtration has dimension 2 dim S₃, and contains both ω_f⊗ω_A and ω_f⊗η_A; retaining only ω_A gives half the required space.

**Construction or proof route.** Import the modular Hodge identification from R14.3 and the filtered Künneth theorem from DD.2. The holomorphic modular summand of filtration m+1 tensored with Fil⁰ of the CM factor contributes the stated whole tensor. The antiholomorphic modular summand has filtration zero, while the CM factor has filtration at most m, so it contributes nothing to Fil^{m+1}. Identify the surviving tensor by the wedge map, preserving the specified differential normalization.

**Prerequisites.** [GH.0.5: Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); **ModularCurvesPartII**, **R14.3**; **DerivedDeRhamCohomology**, **DD.2**.

**Sources.** **BDP13**, §2.2, Proposition 2.5, p. 1062.

<a id="self-duality-of-the-projected-cohomology"></a>

### GH.0.7: Self-duality of ε_X H^{2m+1}(X_m)(m + 1)

Poincaré duality on the smooth proper (2m + 1)-dimensional X_m restricts to a perfect pairing ε_X H^{2m+1}(X_m) × ε_X H^{2m+1}(X_m) → H^{4m+2}(X_m) ≅ ℚ_p(−2m − 1) in étale cohomology (and into F in de Rham). So V := ε_X H^{2m+1}_et(X_{m,F̄}, ℚ_p)(m + 1) is self-dual up to ℚ_p(1): V ≅ V^∨(1). The pairing is the one induced by (2.2.3) on L_{m,m} = L_m ⊗ Sym^m H¹(A). V is the coefficient representation of the generalized Heegner classes, and its f-isotypic part is V_f ⊗ Sym^m H¹(A)(m + 1).

**Hypotheses and conventions.**

- ε_X^t = ε_X (target generalized-kuga-sato-variety-and-its-projector) is what makes the pairing restrict to the image.
- The twist (m + 1) is the self-dual twist of a weight 2m + 1 representation: V is pure of weight −1 at good primes.
- The f-isotypic identification uses the Hecke action on H¹_par(C, 𝕃_m) and the newform f's Galois representation V_f, imported from ModularCurvesPartII R14.3.

**Tests and boundary cases.**

- m = 0: V = H¹_par(C)(1) = V_p J₁(N), which is self-dual through the Weil pairing.

**Prerequisites.** [GH.0.5: Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); **EtaleDualityAndPerverseSheaves**, **EDC.2:pairings** — adic and rational poincare duality; [GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector).

**Sources.** **BDP13**, §2.2, (2.2.3), p. 1061; **BDP13**, §3.4, (3.4.1)–(3.4.2), p.1070.

<a id="newform-cm-projector"></a>

### GH.0.8: Newform and CM coefficient projector

For a normalized eigenform f of weight k=m+2, take the imported f-isotypic Hecke summand of ε_W cohomology and tensor the specified CM character line in Sym^m H¹(A). Extend the coefficient field enough to split both actions. Choose an integral stable lattice only after accounting for the denominators of ε_W, ε_A and the Hecke idempotent; p∤2N m! alone does not make the Hecke idempotent integral. The Tate twist is the cohomological self-dual one, V_f(r) when k=2r.

**Hypotheses and conventions.**

- N>4 for the chosen fine Γ₁ model; k≥2; supplied Hecke eigensystem and CM realization
- At original source levels N≤4, use the R14.3 fine-level descent; the displayed N>4 condition belongs to the chosen model, not to CH’s source theorem.

**Required API.**

- `coefficientProjector_factor`: The modular and CM projections compose.
- `coefficientProjector_twist`: For r≥1, the fiber-power index 2r−2 gives weight 2r and the self-dual modular twist V_f(r).
- `coefficientProjector_lattice`: A recorded integral lattice is preserved by the composite only after both factor projectors preserve that lattice.

**Tests and boundary cases.**

- `coefficientProjector_identity`: After restricting the coefficient space to the trivial CM character summand, its identity projector leaves the f summand. The trivial-character projector on the whole symmetric power need not be the identity.
- `coefficientProjector_order`: On commuting projectors the order of projection does not matter.
- `coefficientProjector_denominator`: A rational idempotent with 1/2 entries need not preserve an integral lattice: the average of (1,0) and (0,1) is (1/2,1/2).

**Prerequisites.** **ModularCurvesPartII**, **R14.3**; [GH.0.3: The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); [GH.0.7: Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology).

**Sources.** **CH22**, §4.2, pp.14–15.

<a id="cm-product-good-model"></a>

### GH.0.9: Good model comparison for the CM product

If W_m and A have smooth proper models over O_F, their product has a smooth proper model over O_F. For BDP §3 take F/Q_p finite unramified, p∤N, and a chosen good CM model; in their canonical conductor-c application also p∤c d_K. An arbitrary CM twist is not made good by p∤N. The model of W_m over Z[1/N] supplied by Conrad belongs to R14.3; it is not a global model of X_m.

**Hypotheses and conventions.**

- Both factors have supplied models; F is the local field of the chosen comparison.
- Smooth/proper product stability is already in Mathlib; this target exports the chosen arithmetic models and local comparison data to the cycle construction, rather than re-planning that stability theorem.

**Tests and boundary cases.**

- At p=5 the CM curve y²=x³−25x has bad reduction although 5∤7; the level criterion cannot apply to its CM factor.
- Positive product-model test: at p=5 the CM curve y²=x³−x has discriminant 64, a unit in Z₅. With the supplied smooth proper W_m model for level 13, the product after a common finite unramified base change is smooth proper. Smoothness and properness must be checked on both supplied factors.

**Prerequisites.** **ModularCurvesPartII**, **R14.3**; [GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); **SchemeAndStackFoundations**, **SF.2**; Mathlib: `AlgebraicGeometry.Smooth`; Mathlib: `AlgebraicGeometry.IsProper`.

**Sources.** **BDP13**, §3.2, p.1067; appendix introduction, p.1139.

<a id="layer-gh-1"></a>

## Layer GH.1: Cycles and Abel–Jacobi maps

<a id="isogenies-of-conductor-c-prime-to-n"></a>

### GH.1.1: The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]

Assume the Heegner hypothesis: there is an ideal 𝔑 ⊂ O_K with O_K/𝔑 ≅ ℤ/Nℤ. Fix A with End(A) = O_K and a Γ₁(N)-level structure t_A ∈ A[𝔑] over the field H̃ ⊇ H over which A[𝔑] becomes constant. Isog(A) is the set of isomorphism classes of pairs (φ, A′) with φ : A → A′ an isogeny over K̄. (φ, A′) has conductor c if End(A′) = O_c = ℤ + cO_K. Isog^𝔑(A) consists of the pairs with ker φ ∩ A[𝔑] = 0, and Isog_c^𝔑(A) = Isog_c(A) ∩ Isog^𝔑(A). For (φ, A′) ∈ Isog^𝔑(A), (A′, φ(t_A)) is a Γ₁(N)-structure and determines a point P_{A′} of C = X₁(N). The semigroup P(O_c) of invertible integral O_c-ideals relatively prime to 𝔑_c=𝔑∩O_c acts on Isog_c^𝔑(A) by 𝔞 ⋆ (φ, A′) = (φ_𝔞φ, A′/A′[𝔞]).

**Hypotheses and conventions.**

- The kernel condition ker φ ∩ A[𝔑] = 0 makes φ(t_A) a point of exact order N.
- The conductor c is determined by End(A′), an order of K.
- The suggested carrier uses native group-scheme rational points over the chosen field; in the degree comparison this field is algebraically closed of characteristic zero. Its target_cm field identifies the literal order Z+cO_K with End(A′), and its marked subgroup is ideal torsion generated by t_A. Generic ring parameters omit CM.1’s quadratic maximal-order classification, which remains a source hypothesis.

**Required API.**

- `IsogPair.conductor`: The conductor is the positive index c in the specified ring isomorphism O_c=Z+cO_K ≅ End(A′), and is invariant under marked-target isomorphism by the imported quadratic-order classification.
- `IsogPair.level`: On the actual group-scheme point carrier, ker(φ)∩A[𝔑]=0 and A[𝔑]=Z·t_A imply addOrder(φ(t_A))=N.
- `IsogPair.idealAction`: Compose the marked pair with the CM.1 ideal quotient isogeny, carrying its target-order identification and the prime-to-mark kernel proof. The CM.1 theorem supplies the quotient, invertible ideal condition and reciprocity square.
- `IsogPair.degree`: In the characteristic-zero geometric-point presentation, degree is the cardinality of ker(φ). The single kernel-cardinality operation is used for every map; CM.1 supplies its comparison with finite morphism degree and multiplicativity.

**Tests and boundary cases.**

- `isog_identity_conductor`: Construct IsogPair.identity with target A, c=1 and target CM order (Z+O_K)≅O_K≅End(A). Check its conductor is 1, its order identification sends 1 to 1, and its actual point map fixes the chosen cyclic level generator.
- `isog_level_failure`: For a nonzero ideal-torsion point t_A killed by N, the native multiplication-by-N endomorphism has nontrivial intersection of its point-map kernel with A[𝔑]. It therefore cannot inhabit the marked IsogPair carrier.
- `isog_degree_multiplicativity`: Use the same kernelDegree as the isogeny point map on the finite-kernel fixture Z/6→Z/3→Z/1. The actual quotient maps have kernel cardinalities 2,3 and 6, so composition has the product degree. This tests the cardinality adapter; the finite-morphism degree comparison remains a named CM.1 export, and no elliptic curve is constructed by this fixture.
- `isog_conductor_order_test`: For the literal Gaussian target order O_c=Z+cZ[i], i belongs to O_1 and is excluded from O_2, while 2i belongs to O_2. This tests the actual order used by target_cm and rejects a constant maximal-order conductor model.

**Prerequisites.** **HeegnerPointEulerSystems**, **HE.1** — canonical model cm descent; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**; Tau Ceti: `TauCeti.AlgebraicGeometry.AbelianVariety.IsIsogeny`; [GH.0.1: The CM elliptic curve A and the algebraic splitting of H¹_dR(A)](#cm-elliptic-curve-and-its-hodge-splitting).

**Sources.** **BDP13**, §1.4, Assumption 1.9, p. 1053; **BDP13**, §1.4, p. 1053; **BDP13**, §1.4, p. 1054.

<a id="generalized-heegner-cycle"></a>

### GH.1.2: The generalized Heegner cycle Δ_φ = ε_X Υ_φ

For (φ, A′) ∈ Isog^𝔑(A), the pair (A′, φ(t_A)) gives an embedding ι_{A′} : (A′)^m → W_m onto the fibre of W_m over P_{A′}. Let Υ_φ be the image of Graph(φ)^m ⊂ (A × A′)^m ≅ (A′)^m × A^m in X_m = W_m × A^m under ι_{A′} × id. It is a codimension-(m + 1) cycle. The generalized Heegner cycle is Δ_φ := ε_X Υ_φ ∈ CH^{m+1}(X_m)_ℚ, supported on the fibre π_m^{−1}(P_{A′}) ≅ (A′)^m × A^m. For m = 0, Δ_φ is the CM point P_{A′} of C, and it is replaced by P_{A′} − ∞ for a cusp ∞.

**Hypotheses and conventions.**

- The rational correspondence ε_X has clearing denominator N^m2^{2m}(m!)², the product of the W_m and A^m averaging denominators. This scalar (or an explicitly justified multiple) clears its graph-cycle denominators; (2N·m!)² need not do so. Additional f-projector and integral-lattice denominators belong to the separate coefficient comparison.
- Graph(φ)^m has dimension m in the 2m-dimensional fibre, so it has codimension m+1 in X_m of dimension 2m+1.

**Required API.**

- `gHC_codim`: The m-dimensional graph product in X_m of dimension 2m+1 has codimension m+1.
- `gHC_projector`: ε_X fixes Δ_φ.
- `gHC_rational_equivalence`: Rationally equivalent graph representatives give the same cycle class.
- `gHC_baseChange`: Base change commutes with projection when graph correspondences and the projector are transported.

**Tests and boundary cases.**

- `upsilon_codim`: At m=2 the graph has dimension 2 and codimension 3 in X₂.
- `gHC_weight_zero`: At m=0 replace the point by point minus a chosen cusp; its degree is zero.
- `gHC_projected_test`: An idempotent ε fixes gHC(ε,graph), and gHC(id,graph)=graph. Together these exclude both an unprojected graph and the identically zero construction (take a nonzero graph for the identity fixture).

**Prerequisites.** [GH.0.4: The variety X_m = W_m × A^m and the projector ε_X = ε_W ε_A](#generalized-kuga-sato-variety-and-its-projector); [GH.1.1: The sets Isog_c^𝔑(A) of CM isogenies of conductor c with kernel prime to A[𝔑]](#isogenies-of-conductor-c-prime-to-n); **SchemeAndStackFoundations**, **SF.5**.

**Sources.** **BDP13**, §2.3, p. 1062; **BDP13**, §2.3, p. 1063.

<a id="field-of-definition-of-generalized-heegner-cycles"></a>

### GH.1.3: BDP Remark 2.6: the field of definition of Δ_φ

If (φ, A′) ∈ Isog_c^𝔑(A), then Δ_φ is defined over the compositum H̃·H_c of the abelian extension H̃/K over which (A, t_A) is defined with the ring class field H_c of conductor c. So the Δ_φ are defined over abelian extensions of K.

**Hypotheses and conventions.**

- The CM main theorem supplies descent of the marked pair to H̃·H_c; use the general CM.1 export when HE.1’s restricted unit-field hypotheses do not apply.

**Tests and boundary cases.**

- c = 1: Δ_φ is defined over H̃, the field of definition of A[𝔑].

**Prerequisites.** [GH.1.2: The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); **HeegnerPointEulerSystems**, **HE.1** — canonical model cm descent; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**.

**Sources.** **BDP13**, §2.3, Remark 2.6, p. 1063.

<a id="homological-triviality-of-generalized-heegner-cycles"></a>

### GH.1.4: BDP Proposition 2.7: Δ_φ is homologically trivial

For m ≥ 1, the cycle class of Δ_φ in ε_X H^{2m+2}(X_m) vanishes in every cohomology theory (de Rham, étale, Betti), so Δ_φ ∈ CH^{m+1}(X_m)_{0,ℚ}. For m = 0, P_{A′} − ∞ is homologically trivial.

**Hypotheses and conventions.**

- The vanishing of ε_X H^{2m+2}(X_m) is the only input for m ≥ 1.
- Cycle class maps in the claimed realizations commute with correspondences. The rational étale passage from finite Gysin/cycle-class maps is supplied by EDC.6; filtered de Rham compatibility is supplied by DD.2. Betti compatibility requires the corresponding classical realization and is not inferred from torsion étale purity.

**Tests and boundary cases.**

- m = 1: cl(Δ_φ) ∈ ε_X H⁴(E × A) = 0.

**Prerequisites.** [GH.0.5: Projected middle cohomology](#cohomology-of-the-generalized-kuga-sato-variety); [GH.1.2: The generalized Heegner cycle Δ_φ = ε_X Υ_φ](#generalized-heegner-cycle); **EtaleDualityAndPerverseSheaves**, **EDC.6**; **DerivedDeRhamCohomology**, **DD.2**.

**Sources.** **BDP13**, §2.3, Proposition 2.7, p. 1063.

<a id="etale-abel-jacobi-map"></a>

### GH.1.5: BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre

For X_m/F and V=ε_XH_et^{2m+1}(X̄_m,Q_p)(m+1), the étale Abel–Jacobi map sends a projected null-homologous codimension m+1 cycle to H¹(F,V). Use the Gysin exact sequence for U=X minus its support, pull back along its cycle class in the residue term, then identify Ext¹_G(Q_p,V) with H¹(F,V). It is independent of support and representative, with restriction, proper pushforward and correspondence equivariance. For m=0 the degree-zero cusp correction is required.

**Hypotheses and conventions.**

- The exactness uses m ≥ 1: ε_X H^{2m−1}(X_P)(m) = 0, and ε_X H^{2m}(X_P)(m)^0 = ε_X H^{2m}(X_P)(m) because ε_X H^{2m+2}(X_m) = 0.
- The target is rational continuous Galois cohomology. Its Gysin sequence and Ext¹-to-H¹ identification, including support/rational-equivalence independence, are the EDC.6, R02.1 and SF.5 interfaces specified above. The integral lattice and projector denominators are the separate integral-abel-jacobi-comparison target.

**Required API.**

- `ajEt_add`: The map is additive on projected null-homologous cycles.
- `ajEt_correspondence`: A correspondence acts compatibly on cycles and the coefficient representation.
- `ajEt_restriction`: Restriction to F′ carries AJ_F(Δ) to AJ_F′(Δ_F′).
- `ajEt_extension`: The cocycle is g↦g·lift(1)−lift(1), and changing the lift adds a coboundary.

**Tests and boundary cases.**

- `ajEt_zero`: The zero cycle gives the split extension and the zero cohomology class.
- `ajEt_lift_change`: Changing the lift by b adds precisely the coboundary g·b−b, with this sign.
- `ajEt_weight_zero`: On X₀ the degree-zero divisor map agrees with Jacobian Kummer under the imported Abel–Jacobi comparison.

**Construction or proof route.** Gysin sequence for the smooth divisor X_P ⊂ X_m with complement X_m^♮, twisted by (m + 1) (finite-coefficient EDC.3 followed by the EDC.6 rational passage). Apply ε_X, which preserves X_P and X_m^♮ because it preserves the fibres of π_m. Then ε_X H^{2m−1}(X_P) = 0 (the ε_W part of the cohomology of a single fibre lives in degree m), and ε_X H^{2m+2}(X_m) = 0, giving the short exact sequence. cl_P(Δ) ∈ ε_X H^{2m}(X̄_P)(m). Pull back along the map sending 1 to it; the class in Ext¹ = H¹ of Galois cohomology (ArithmeticGaloisDuality R02.1 continuous-representation Ext/H¹ comparison) is AJ^et_F(Δ). For support enlargement and rational-equivalence independence, use the rational Gysin compatibility and Chow-cycle Abel–Jacobi comparison. BDP Remark 3.2 cites Nekovář Proposition II.2.4; compact inflation–restriction alone does not prove this comparison.

**Prerequisites.** [GH.1.4: BDP Proposition 2.7: Δ_φ is homologically trivial](#homological-triviality-of-generalized-heegner-cycles); **EtaleDualityAndPerverseSheaves**, **EDC.3** — gysin sequence; **SchemeAndStackFoundations**, **SF.5**; **ArithmeticGaloisDuality**, **R02.1**; **EtaleDualityAndPerverseSheaves**, **EDC.6**.

**Sources.** **BDP13**, §3.1, p. 1065; **BDP13**, §3.1, Definition 3.1, p. 1066; **BDP13**, §3.1, Remark 3.2, p. 1067.

<a id="extensions-of-filtered-frobenius-modules"></a>

### GH.1.6: BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight

For a negative-weight admissible filtered Frobenius module H over finite unramified F/Q_p, write Φ=Φ₀^[F:Q_p], the F-linear iterate of semilinear crystalline Frobenius. Weight separation gives 1−Φ invertible. Every extension 0→H→D→F→0 has a unique Φ-fixed lift of 1 and a lift in Fil⁰D; their difference, in the order holomorphic minus Frobenius, defines a class in H/Fil⁰H and induces Ext_ffm¹(F,H)≅H/Fil⁰H. Semilinear Φ₀-fixed elements alone do not form the required F-linear splitting.

**Hypotheses and conventions.**

- The weight hypothesis is used to make E^{Φ=1} → F an isomorphism, and to make the class independent of the lift η^frob.

**Tests and boundary cases.**

- H = F(1), the Tate twist of weight −2 (Fil⁰H = 0): Ext¹_ffm(F, F(1)) ≅ F.

**Prerequisites.** **PadicHodgeTheory**, **R06.2**; **PadicHodgeTheory**, **R06.5**.

**Sources.** **BDP13**, §3.3, p. 1068; **BDP13**, §3.3, Proposition 3.5, p. 1069.

<a id="p-adic-abel-jacobi-map"></a>

### GH.1.7: The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m

Under BDP §3’s finite unramified F/Q_p and supplied smooth proper models, AJ_et(Δ) lies in H¹_f(F,V). The crystalline extension gives the filtered Frobenius extension of the preceding target; its holomorphic-minus-Frobenius class lies in D_dR(V)/Fil⁰. Poincaré duality identifies this quotient with (S_{m+2}⊗Sym^mH¹_dR(A/F))∨, yielding AJ_F. This use of an unramified F records the selected presentation, not a claim that Bloch–Kato theory requires unramified F in general.

**Hypotheses and conventions.**

- F unramified over ℚ_p with good reduction of C and X_m (p ∤ cNd_K). The comparison and Nekovář's theorem are imported from PadicHodgeTheory R06.5.
- H = ε_X H^{2m+1}_dR(m + 1) has weight −1 < 0, as Proposition 3.5 requires.
- Negative weight gives D_cris(V)^{φ=1}=0. Consequently H¹_e(F,V)=H¹_f(F,V), so the L1 logarithm, whose supplied domain is H¹_e, applies to the geometric finite class.

**Required API.**

- `ajP_etale`: AJ_p is the crystalline/Bloch–Kato logarithm of AJ_et under the stated quotient and duality identification.
- `ajP_add`: AJ_p is additive in Δ.
- `ajP_pairing`: Evaluation on ω_f⊗ω_A^jη_A^(m−j) uses the Poincaré dual functional and the fixed Tate twist.

**Tests and boundary cases.**

- `ajP_zero`: A split étale extension has zero p-adic Abel–Jacobi functional.
- `ajP_filtration_independence`: Changing the Hodge lift by Fil⁰ does not change its quotient class.
- `ajP_sign`: The recipe is holomorphic lift minus Frobenius lift: swapping the order negates the quotient class.

**Construction or proof route.** AJ^et_F(CH^{m+1}_0) ⊆ H¹_f (Nekovář, Theorem 3.1.1; Nizioł), supplied by PadicHodgeTheory R06.5. Faltings: ε_X H^{2m+1}_et(X̄_m)(m + 1) is crystalline with D_cris equal to ε_X H^{2m+1}_dR(X_m/F)(m + 1) (R06.5). D_cris is fully faithful, and surjectivity onto Ext_ffm comes from the Bloch–Kato exponential (BDP Corollary 3.4; R06.2). Use negative weight to exclude the Frobenius eigenvalue 1, identify H¹_f with H¹_e, then use the supplied L1 logarithm. The filtration identification is the separate projected-hodge-filtration target, not Künneth alone. Proposition 3.5 with H = ε_X H^{2m+1}_dR(m + 1) of weight −1. Poincaré duality makes Fil¹ε_X H^{2m+1}(m) and Fil⁰ε_X H^{2m+1}(m + 1) exact annihilators, so H/Fil⁰H = (Fil^{m+1} ε_X H^{2m+1}_dR)^∨ (GH.0/self-duality-of-the-projected-cohomology). Fil^{m+1} ε_X H^{2m+1}_dR = S_{m+2}(Γ, F) ⊗ Sym^m H¹_dR(A) (GH.0/projected-hodge-filtration).

**Prerequisites.** [GH.1.5: BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); [GH.1.6: BDP Proposition 3.5: Ext of the unit by a filtered Frobenius module of negative weight](#extensions-of-filtered-frobenius-modules); [GH.0.9: Good model comparison for the CM product](#cm-product-good-model); **PadicHodgeTheory**, **R06.5**; **EtaleDualityAndPerverseSheaves**, **EDC.2:pairings** — adic and rational poincare duality; **PadicHodgeRegulators**, **L1** — bloch kato logarithm; [GH.0.6: Projected Hodge filtration](#projected-hodge-filtration); [GH.0.7: Self-duality of ε_X H^{2m+1}(X_m)(m + 1)](#self-duality-of-the-projected-cohomology).

**Sources.** **BDP13**, §3.2, p. 1067; **BDP13**, §3.2, Theorem 3.3, p. 1068; **BDP13**, §3.4, p. 1069; **BDP13**, §3.4, p. 1070.

<a id="integral-abel-jacobi-comparison"></a>

### GH.1.8: Integral Abel–Jacobi comparison

For p∤2N m!, invert the remaining f-projector denominator and choose the specified stable lattice T in V_f(r), m=2r−2. The cycle extension gives an integral class in H¹(K̃_c,T⊗Sym^{2r−2}T_p(A)(1−r)); its rationalization is AJ_et in the displayed self-dual twist. Descent from the ray field K̃_c to K_c uses invariance together with the compact inflation–restriction sequence and vanishing of coefficient invariants, rather than invariance alone.

**Hypotheses and conventions.**

- The coefficient lattice and the f-projector denominator are fixed; r≥1; residual invariant vanishing is stated separately.

**Tests and boundary cases.**

- Integral descent fails without the invariant-vanishing input; rationalization alone does not remove a congruence denominator.

**Prerequisites.** [GH.0.8: Newform and CM coefficient projector](#newform-cm-projector); [GH.1.5: BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); **ArithmeticGaloisDuality**, **R02.2** — compact five term.

**Sources.** **CH22**, §4.2, (4.2), pp.14–15.

<a id="character-projected-heegner-class"></a>

### GH.1.9: Character-projected Heegner class

For CH’s canonical CM A/H_K and B=Res_{H_K/K}A, use the literal full symmetric-power module S=Sym^{2r−2}T_p(B)(1−r)⊗O_F, after the required coefficient extension. For an anticyclotomic χ of type (j,−j), −r<j<r, conductor c₀p^s with (c₀,Np)=1, choose the finite-order anticyclotomic χ_t of the same conductor, unique up to a Hilbert class character, so χ is a coefficient summand of S⊗χ_t. Apply its G_K-equivariant projector to the twisted finite-level class to define z_{f,χ,c}∈H¹(K_c,T⊗χ), as in (4.6), for c divisible by the conductor. The separately weighted corestriction (4.7) defines z_{f,χ}∈H¹(K,T⊗χ). Do not identify S with Ind_{G_H_K}^{G_K}Sym^{2r−2}T_p(A)(1−r): already at m=0 the full symmetric power has rank 1, whereas the induced module has rank h=[H_K:K], so they differ when h>1. Integral projectors and the inclusion of the original A-coefficient class require the CM.1 coefficient adapter.

**Hypotheses and conventions.**

- CH §4.4 hypotheses and coefficient field containing CM and χ values.
- The literal symmetric-power carrier and the chosen character summand must be checked independently of the false Sym/Ind identification. A finite-order χ_t is not necessarily unramified: only its ambiguity is a Hilbert class character. The CM.1 adapter must control the denominators of integral eigenprojections.

**Required API.**

- `characterHeegnerClass_eigen`: With the character-projector law ρ(g)e_χ=χ(g)e_χ, the projected class satisfies ρ(g)z_χ=χ(g)z_χ. Idempotence alone asserts membership in the projector image and does not specify χ.
- `characterHeegnerClass_cores`: Corestriction commutes with the character projector after coefficient descent.
- `characterHeegnerClass_sum`: Weighted corestriction is additive in the conductor-indexed cycle classes.

**Tests and boundary cases.**

- `characterHeegnerClass_trivial`: On the already selected trivial CM character component its projector is the identity. This does not assert identity on the entire symmetric-power coefficient module.
- `characterHeegnerClass_orthogonal`: Orthogonal idempotents kill the class projected to the other character.
- `characterHeegnerClass_add_test`: The construction agrees with the linear coefficient projection on a sum of two classes.

**Prerequisites.** [GH.1.8: Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); [GH.0.3: The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**; **ArithmeticGaloisDuality**, **R02.2** — compact five term.

**Sources.** **CH22**, §4.4–4.5, (4.5)–(4.7), pp.17–20.

<a id="parabolic-residue-pairing"></a>

### GH.1.10: Parabolic residue pairing

For BDP’s punctured good-reduction curve with coefficient isocrystal L_{m,m}, a de Rham class is parabolic exactly when its annular residues vanish, including the horizontal cusp residue. For parabolic representatives ω₁,ω₂, the Poincaré pairing is Σ_j res_{V_j}⟨F_{1,j},ω₂⟩, where ∇F_{1,j}=ω₁. Changing a local primitive by a horizontal section does not change the pairing.

**Hypotheses and conventions.**

- BDP §3.5 good model, distinct residue disks, annuli and self-dual coefficient system; both classes parabolic.

**Tests and boundary cases.**

- Adding a horizontal constant changes no parabolic residue pairing.

**Prerequisites.** [GH.0.9: Good model comparison for the CM product](#cm-product-good-model); **SchemeAndStackFoundations**, **SF.2**; **EtaleDualityAndPerverseSheaves**, **EDC.2:pairings** — adic and rational poincare duality; **PadicDifferentialEquationsAndRigidCohomology**, **RD.4**; **PadicDifferentialEquationsAndRigidCohomology**, **RD.3** — overconvergent f isocrystal.

**Sources.** **BDP13**, §3.5, Propositions 3.9–3.10, pp.1074–1075.

<a id="coleman-primitive"></a>

### GH.1.11: Coleman primitive for the modular differential

For ω_f valued in L_m choose a Frobenius annihilator P killing its parabolic cohomology class, invertible on horizontal sections, with P(1)≠0. The Coleman primitive F_f is the locally analytic section with ∇F_f=ω_f and P(Φ)F_f rigid analytic on a Frobenius neighborhood. Weight separation and gluing make it choice independent; for m>0 it is unique and for m=0 unique modulo constants. Evaluation uses the specified ordinary CM residue disk and normalized basis.

**Hypotheses and conventions.**

- The good unramified local model and overconvergent Frobenius isocrystal are supplied; the weight-separation lemma applies.
- For the available section/differential prototype, supply the connection, F-linear Frobenius, annihilator polynomial P with P(1)≠0, rigid section submodule and a normalization complement disjoint from the connection kernel. The input is in the range of the connection on normalized sections satisfying P(Φ)F∈rigid. BDP Theorem 3.15 and the RD.4 comparison must produce this range witness for ω_f; the constructor does not claim every arbitrary differential is integrable.

**Required API.**

- `colemanPrimitive_differential`: For the selected datum C and its integrable differential input ω, C.connection(colemanPrimitive(C,ω))=ω.
- `colemanPrimitive_frobenius`: Evaluate the datum’s actual polynomial P on its Frobenius operator: P(Φ)colemanPrimitive(C,ω) lies in C.rigid.
- `colemanPrimitive_choice`: Any section with the same differential differs from the constructed primitive by a section in the kernel of C.connection. Within the selected normalization complement this difference vanishes; globally weight zero retains constant ambiguity.

**Tests and boundary cases.**

- `colemanPrimitive_zero`: In the affine disk fixture of sections a+bX with evaluation-at-zero normalization, the constructed primitive of the zero differential is zero.
- `colemanPrimitive_constants`: For the constructed primitive of dX, adding the actual constant section 1 preserves the connection value 1 but changes the section and makes its value at zero equal to 1. Thus the unnormalized weight-zero uniqueness claim fails.
- `colemanPrimitive_residue_test`: For the same constructed primitive of dX, a constant change c contributes c times the X⁻¹ coefficient of dX to the residue pairing. That coefficient is zero, so the change contributes zero; no assumed zero bilinear pairing replaces the residue functional.
- `colemanPrimitive_nonzero`: On affine sections a+bX, use ∇(a+bX)=b dX, Φ(X)=5X, P(T)=T−5 and F(0)=0. Compute colemanPrimitive(dX)=X, its connection is dX and P(Φ)X=0; P(1)=−4 is nonzero. An identically zero primitive fails this nonzero-input test.

**Construction or proof route.** Import overconvergent Frobenius and solve locally by an analytic primitive. Invert P(Φ) on horizontal sections to impose the rigid condition; glue and track the m=0 constant ambiguity. Express the normalized analytic construction on the image of the admissible connection, rather than claiming a right inverse for an arbitrary map. The zero-kernel complement makes this preimage unique. A finite affine-disk realization tests the operator and normalization; it does not prove the global wide-open modular input theorem.

**Prerequisites.** [GH.1.10: Parabolic residue pairing](#parabolic-residue-pairing); **PadicDifferentialEquationsAndRigidCohomology**, **RD.4**; **PadicDifferentialEquationsAndRigidCohomology**, **RD.3** — overconvergent f isocrystal.

**Sources.** **BDP13**, §3.6, Lemma 3.14, Theorem 3.15 and Remarks 3.16–3.17, pp.1076–1078.

<a id="coleman-abel-jacobi-formula"></a>

### GH.1.12: Coleman Abel–Jacobi formula

For an ordinary marked isogeny φ:A→A′ and α∈Sym^mH¹_dR(A), AJ_F(Δ_φ)(ω_f⊗α)=⟨F_f(P_{A′})⊗α,cl_{P_{A′}}Δ_φ⟩=⟨φ*F_f(P_{A′}),α⟩_A. If φ*ω′=ω and d=deg φ, then evaluation on ω_A^jη_A^{m−j} is d^jG_j(A′,t′,ω′).

**Hypotheses and conventions.**

- BDP §3.7 local hypotheses; 0≤j≤m; normalized isogeny differential.

**Tests and boundary cases.**

- At j=0 the degree factor is 1; at j=m it is d^m.

**Prerequisites.** [GH.1.7: The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m](#p-adic-abel-jacobi-map); [GH.1.11: Coleman primitive for the modular differential](#coleman-primitive); [GH.1.10: Parabolic residue pairing](#parabolic-residue-pairing).

**Sources.** **BDP13**, §3.7, Propositions 3.18, 3.21 and Lemma 3.22, pp.1078–1084.

<a id="coleman-depletion-calculation"></a>

### GH.1.13: Depleted Coleman component calculation

For the normalized components G_j=⟨F_f,ω^jη^{m−j}⟩ and f♭ the p-depletion, G_j♭=j! θ^{−1−j}f♭ on the ordinary locus. The negative power is the continuous p-adic extension of θ on p-depleted q-series. The proof uses the connection in the Tate-curve basis, the recurrence G_0♭=θ⁻¹f♭ and G_j♭=jθ⁻¹G_{j−1}♭, plus the q-expansion principle. θ, U, V, depletion and q-expansion principle belong to the modular-forms suppliers.

**Hypotheses and conventions.**

- 0≤j≤m; ordinary locus; supplied q-expansion principle and inverse θ on p-depleted forms.

**Tests and boundary cases.**

- The coefficient of q^n, p∤n, is j! a_n/n^{j+1}; at j=0 it is a_n/n.

**Prerequisites.** [GH.1.11: Coleman primitive for the modular differential](#coleman-primitive); **ModularCurvesPartII**, **R14.3**; **AutomorphicPadicLFunctions**, **L3h**.

**Sources.** **BDP13**, §3.8, Proposition 3.24, (3.8.5)–(3.8.6), pp.1086–1088.

<a id="syntomic-abel-jacobi-comparison"></a>

### GH.1.14: Syntomic Abel–Jacobi comparison

For the supplied smooth proper model of X_m and projected homologically trivial cycles, a geometric syntomic regulator and its étale comparison must identify the syntomic Abel–Jacobi image with AJ_p after Bloch–Kato logarithm and the exact Frobenius normalization. Besser’s regulator on Spec O_F, or its K₂ curve specialization, does not supply this higher-dimensional correspondence-compatible statement. Use the higher-dimensional extension of D.2, with the higher-dimensional comparison specified here.

**Hypotheses and conventions.**

- Good model, cycle support extension and the same Tate and Frobenius conventions as AJ_p.

**Tests and boundary cases.**

- At weight zero the syntomic regulator must reproduce the Abel–Jacobi/Kummer comparison, including the Frobenius factor.

**Prerequisites.** **PadicHodgeRegulators**, **D.2**; [GH.1.7: The p-adic Abel–Jacobi map AJ_F on projected cycles in X_m](#p-adic-abel-jacobi-map); [GH.0.9: Good model comparison for the CM product](#cm-product-good-model).

**Sources.** **BDP13**, §3.4, pp.1068–1070.

<a id="classical-generalized-cycle-comparison"></a>

### GH.1.15: Classical and generalized cycle comparison

For m=2r−2, the trivial CM-character projection of the generalized cycle class agrees with the classical Heegner cycle on W_m with the normalization u_{c₀}(2√−D_K)^{r−1} appearing in Castella Theorem 6.5; Castella uses u_{c₀}=|O_{c₀}×|/2. The comparison is cited there from BDP (2017), Proposition 4.1.2 with r₁=2r−2,r₂=0,u=r−1. It is not established by the 2013 homological-triviality calculation. Construct the cycle adapter using that comparison, with its unit and differential normalizations.

**Hypotheses and conventions.**

- Canonical CM data and coefficient projection; r>1 in the family comparison; period and sign choices fixed.

**Tests and boundary cases.**

- The half-unit convention is distinct from CH Definition 5.2’s full-unit convention.

**Prerequisites.** [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); [GH.1.8: Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison).

**Sources.** **Castella**, §6.2, proof of Theorem 6.5, p.28.

<a id="layer-gh-2"></a>

## Layer GH.2: Euler-system relations and local conditions

<a id="cycle-norm-relations"></a>

### GH.2.1: Heegner cycle norm relations

For CH’s classes with p∤c and split p, n>1, cor_{K_{cp^n}/K_{cp^{n−1}}}(z_{f,cp^n})=a_p z_{f,cp^{n−1}}−p^{2r−2}res(z_{f,cp^{n−2}}). For an inert ℓ∤cND_Kp, cor_{K_{cℓ}/K_c}(z_{f,cℓ})=a_ℓ z_{f,c}. These equations are transported through the character projection with the prescribed χ weights. The n=1 split relation includes units and both Artin operators; prove it by the first-step adapter in GH.3. Proposition 4.4 in CH22 states the n>1 recurrence.

**Hypotheses and conventions.**

- CH canonical CM data, p∤c, r≥1, prime-to-projector denominators and the displayed conductor exclusions.

**Tests and boundary cases.**

- For r=1 the predecessor coefficient is 1; for r=2 it is p².

**Prerequisites.** [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); [GH.1.5: BDP Definition 3.1: the étale Abel–Jacobi map on ε_X-cycles supported on a fibre](#etale-abel-jacobi-map); **HeegnerPointEulerSystems**, **HE.2** — cm hecke conductor classification.

**Sources.** **CH22**, §4.3, Proposition 4.4 and (4.3)–(4.4), pp.15–17.

<a id="cycle-conjugation"></a>

### GH.2.2: Complex conjugation of Heegner classes

With τ complex conjugation, w_f the Atkin–Lehner eigenvalue and σ_N the fixed Artin class, (z_{f,χ,c})^τ=w_f χ(σ_N)(z_{f,χ^{-1},c})^{σ_N}. The CM curve is defined over H_K^+ so τ acts on the chosen geometric cycle. Conjugation changes the coefficient character to χ^{-1}; it is not a same-character identity unless χ²=1.

**Hypotheses and conventions.**

- The decomposition N O_K=𝔑 𝔑̄ and geometric/Artin normalization are fixed.

**Tests and boundary cases.**

- At χ=1 the remaining sign is w_f and the fixed σ_N action.

**Prerequisites.** [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); **ModularCurvesPartII**, **R14.3**; **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**.

**Sources.** **CH22**, §4.4, Lemma 4.6, p.18.

<a id="cycle-frobenius-congruence"></a>

### GH.2.3: Frobenius congruence for cycle classes

For ℓ∤cND_K inert, let λ_c and λ_{cℓ} be the chosen compatible local primes. Then res_{K_{λ_{cℓ}}/K_{λ_c}}(loc_{λ_c}(z_{f,χ,c})^{Frob_ℓ})=loc_{λ_{cℓ}}(z_{f,χ,cℓ}). The anticyclotomic χ is trivial on the relevant local decomposition group. This is an equality after restriction of local classes, deduced from reduction of the conductor-changing isogeny to Frobenius; it is not equality of global classes modulo ℓ.

**Hypotheses and conventions.**

- Compatible local embeddings; good reduction at ℓ; inert conductor-changing prime.

**Tests and boundary cases.**

- The local Frobenius acts on the untwisted module because χ is trivial at this inert place.

**Prerequisites.** [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems**, **HE.2** — inert reduction frobenius congruence; **PadicHodgeTheory**, **R06.5**.

**Sources.** **CH22**, §4.4, Lemma 4.7, pp.18–19.

<a id="finite-local-abel-jacobi-class"></a>

### GH.2.4: Finite local Abel–Jacobi class

At a good unramified local model AJ_et(Δ) is crystalline and hence lies in H¹_f; outside p its unramified local class follows from the good integral support and specialization. CH Proposition 7.6’s propagation through coefficient quotients uses the corrected Fontaine–Laffaille hypothesis: the local field L must be absolutely unramified over Q_p, not just relatively unramified over K_{c,w}. A ramified conductor field requires a different argument. Bloch–Kato, Greenberg and a chosen regulator-image condition are identified only after the stated comparison is proved.

**Hypotheses and conventions.**

- Good models, admissible Hodge interval p>2r−1, and absolute unramifiedness when Fontaine–Laffaille is used.

**Tests and boundary cases.**

- A relatively unramified extension of a ramified base is still ramified over Q_p.

**Prerequisites.** [GH.0.9: Good model comparison for the CM product](#cm-product-good-model); [GH.1.8: Integral Abel–Jacobi comparison](#integral-abel-jacobi-comparison); **SelmerIwasawaCohomology**, **L4** — bloch kato condition; **SelmerIwasawaCohomology**, **L2** — condition propagation; **PadicHodgeTheory**, **R06.5**.

**Sources.** **CH22**, §7.3, Lemma 7.5 and Proposition 7.6, p.31; **CH erratum**, Second correction, p. 1.

<a id="local-condition-at-p-and-the-castella-hsieh-corrections"></a>

### GH.2.5: Corrected derivative local condition

For the specialized anticyclotomic Heegner Euler system in CH Proposition 7.8, the derivative classes satisfy axiom (E5) at p by the integral Perrin–Riou lifting and orthogonality argument of KO Lemma 4.10. At a height-one P≠pΛ, use the integral regulator image defining F_P, lift the period vector through the unramified trace, apply Ω, specialize and use the local Tate pairing; use conjugation for p̄. The proof cannot use CH Lemma 7.5 over arbitrary ramified conductor fields. The identification of F_P with the CH local condition and its integral lattice must be checked explicitly.

**Hypotheses and conventions.**

- KO Condition 2.3: p∤6h_K and, in a fixed integral basis of T_f, the Galois image contains {g∈GL₂(ℤ_p): det(g)∈(ℤ_p×)^{2r−1}}. Retain the KO setup and CH specialization hypotheses, P≠pΛ, and the matched coefficient and local regulator normalizations.

**Tests and boundary cases.**

- The same conclusion over a ramified local field cannot be deduced from the printed Fontaine–Laffaille proof.

**Construction or proof route.** Lift h∈R̃₁^{ψ=0}⊗D_cris(V_f)^{φ=α}(r) to h′ over the conductor coefficient ring using surjectivity of unramified trace. Apply the integral Ω map to h′; use norm compatibility and the finite local pairing (KO (4.49)–(4.50)). KO Lemma 4.7 makes regulator images orthogonal. Apply conjugation at p̄ and ordinary/regulator-image comparison where its hypotheses hold.

**Prerequisites.** [GH.2.4: Finite local Abel–Jacobi class](#finite-local-abel-jacobi-class); [GH.2.2: Complex conjugation of Heegner classes](#cycle-conjugation); **PadicHodgeRegulators**, **L3**.

**Sources.** **KO**, §2.4, Condition 2.3, p. 13; §4, Lemma 4.7 p.42; Lemma 4.10 pp.44–45; (4.47) p.44 and (4.49)–(4.50) p.45; **CH erratum**, Second correction, p. 1.

<a id="layer-gh-3"></a>

## Layer GH.3: Ordinary stabilization and universal norms

<a id="ordinary-stabilized-class"></a>

### GH.3.1: Ordinary stabilized Heegner class

For CH k=2r, ap a p-adic unit and α the unit root of X²−apX+p^{2r−1}, set z_{c,α}=z_c−(p^{2r−2}/α)res(z_{c/p}) when p|c. When p∤c set z_{c,α}=u_c^{-1}(1−p^{r−1}σ_p/α)(1−p^{r−1}σ_p̄/α)z_c, with CH’s u_c=|O_c×|. The factor at p∤c is a pair of Euler operators, not the same formula as at positive p-conductor.

**Hypotheses and conventions.**

- r≥1, p split, ap unit; lattice integral away from the recorded denominators; compatible Artin operators.

**Required API.**

- `stabilizedClass_upper`: At positive p-conductor the subtraction coefficient is p^{2r−2}/α.
- `stabilizedClass_bottom`: The bottom class is u_c⁻¹ times the product of the p and p̄ Euler operators.
- `stabilizedClass_trace`: With the matched first-step normalization, cor(z_{cp,α})=α z_{c,α}.
- `stabilizedClass_integral`: The normalized subtraction preserves the integral lattice when both classes and its explicitly recorded scalar action preserve that lattice.

**Tests and boundary cases.**

- `stabilizedClass_weight_two`: For r=1 the predecessor coefficient is α⁻¹.
- `stabilizedClass_zero_predecessor`: A zero predecessor leaves the current class unchanged.
- `stabilizedClass_root_relation`: The unit-root equation gives α+p^{2r−1}/α=ap, which is the coefficient identity used in the trace computation.

**Prerequisites.** [GH.2.1: Heegner cycle norm relations](#cycle-norm-relations); [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients.

**Sources.** **CH22**, §5.2, Definition 5.2, p.22.

<a id="stabilized-first-step-adapter"></a>

### GH.3.2: First-step stabilization adapter

The upper and lower formulas of CH Definition 5.2 must satisfy cor_{K_{cp}/K_c}(z_{cp,α})=α z_{c,α}. Prove the conductor-one trace from the Hecke neighbor classification with both Frobenius classes and the exact unit index. The July 2022 Proposition 4.4 states only n>1; its proof does not, by itself, discharge the n=1 assertion in Lemma 5.3. Compare CH’s full-unit and Castella’s half-unit conventions by an explicit scaling of the cycle classes.

**Hypotheses and conventions.**

- p∤c and the same geometric graph and AJ normalization in all three sources.

**Tests and boundary cases.**

- The classical weight-two first-step check must reproduce the full versus half unit scaling.

**Construction or proof route.** Import the first-step Heegner neighbor classification. Compute the unit orbit multiplicities of the higher-weight graph cycle and both split ideal terms. Substitute the unit-root relation; establish the normalization adapter before using an inverse limit.

**Prerequisites.** [GH.3.1: Ordinary stabilized Heegner class](#ordinary-stabilized-class); **HeegnerPointEulerSystems**, **HE.2** — split ramified first step recurrence; [GH.1.15: Classical and generalized cycle comparison](#classical-generalized-cycle-comparison).

**Sources.** **CH22**, §5.2, Lemma 5.3, p.22.

<a id="iwasawa-heegner-class"></a>

### GH.3.3: Iwasawa Heegner class

After the first-step adapter, the sequence (α^{-n}z_{c₀p^n,α})_n, with its compatible coefficient projections, defines z_f in H¹_Iw(K_{c₀p∞},T). Keep the finite ring-class quotient Δ distinct from the anticyclotomic Γ≅Z_p and from a possible Δ-character projection. A finite-order nontrivial character of exact p-conductor n specializes to α^{-n}z_{f,χ}; Shapiro identifies the inverse limit with cohomology of the completed coefficient representation, with the inversion convention explicit.

**Hypotheses and conventions.**

- ap unit, compatible stable lattice, trace lemma including n=0, continuous coefficient twist.

**Required API.**

- `iwasawaClass_level`: The conductor-n projection is α^{-n}z_n.
- `iwasawaClass_norm`: The normalized sequence is corestriction compatible.
- `iwasawaClass_character`: A nontrivial exact conductor-n character specialization gives α^{-n} times the weighted finite-level class.

**Tests and boundary cases.**

- `iwasawaClass_bottom`: The bottom projection has normalization α⁰=1.
- `iwasawaClass_unit_one`: If α=1 the sequence is unchanged.
- `iwasawaClass_sign`: At α=−1 level 1 changes sign; at α=2 and a nonzero class over Q it is one half of the class, not twice the class. The latter distinguishes α^{-n} from α^n.

**Prerequisites.** [GH.3.2: First-step stabilization adapter](#stabilized-first-step-adapter); **SelmerIwasawaCohomology**, **L3** — iwasawa cohomology; **SelmerIwasawaCohomology**, **L3** — iwasawa shapiro; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients.

**Sources.** **CH22**, §5.2, (5.1), (5.5) and Lemma 5.4, pp.23–24.

<a id="longo-vigni-trace-polynomials"></a>

### GH.3.4: Longo–Vigni trace polynomials

In O_p[G(n)] define ρ=p^{k/2}−a_pσ_p+p^{(k−2)/2}σ_p², its conjugate ρ̄, and Φ=ρρ̄. Let γ₀=a_p−p^{(k−2)/2}(σ_p+σ_p̄), γ₁=a_pγ₀−p^{k−2}δ and γ_m=a_pγ_{m−1}−p^{k−1}γ_{m−2} for m≥2. Here δ is the fixed ring-class-to-Γ degree in LV §4.1, not a freely chosen constant. LV Lemma 4.2 gives q_m with γ_m=q_mΦ+p^{(m−1)k/2}r_m for m≥2 and q_{m+1}≡a_pq_m mod p, q₂=1.

**Hypotheses and conventions.**

- Even k≥4, LV coefficient and tower conventions, finite quotient split from Γ; ordinary ap.

**Required API.**

- `tracePolynomial_initial`: The first two values are γ₀ and γ₁.
- `tracePolynomial_recurrence`: γ_{m+2}=a_pγ_{m+1}−p^{k−1}γ_m.
- `tracePolynomial_remainder`: The higher terms equal q_mΦ plus the explicitly p-divisible remainder.

**Tests and boundary cases.**

- `tracePolynomial_two`: The second recurrence value is apγ₁−qγ₀.
- `tracePolynomial_zero`: Zero initial values give the zero sequence.
- `tracePolynomial_error_power`: At k=4,m=2 the displayed LV remainder exponent is 2. No p⁴ divisibility follows from that displayed exponent alone; a particular remainder may have additional divisibility.

**Prerequisites.** [GH.2.1: Heegner cycle norm relations](#cycle-norm-relations); **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; Mathlib: `LinearMap`.

**Sources.** **LV16**, §4.2, Lemmas 4.1–4.2, p.12.

<a id="trace-polynomial-intersection"></a>

### GH.3.5: Trace polynomial intersection theorem

For a finitely generated O_p[G(n)]-module M in LV’s setting, ordinarity and the q_m estimates imply ΦM=⋂_m γ_mM. This is equality of images/submodules. After augmentation, eventual equality of the corresponding ideals is what is used, not literal equality γ_m=Φ.

**Hypotheses and conventions.**

- LV tower and p-adic finite coefficient ring; a_p unit; finitely generated M.

**Tests and boundary cases.**

- Multiplying a generator by a unit changes its value but not the principal ideal.

**Prerequisites.** [GH.3.4: Longo–Vigni trace polynomials](#longo-vigni-trace-polynomials).

**Sources.** **LV16**, §4.2, Corollary 4.3, p.12.

<a id="universal-norm-heegner-class"></a>

### GH.3.6: Universal norm Heegner class

Let H_m[n] be the O_p[Gal(K_m[n]/K)] submodule generated by the restrictions of z_n and by the trace classes α_j[n], j≤m, and H_∞[n]=lim_cor H_m[n]. LV Proposition 4.5 constructs β[n]∈H_∞[n] with β₀[n]=Φz_n and cor_{K_∞[nℓ]/K_∞[n]}β[nℓ]=a_ℓβ[n] for the permitted inert ℓ. The finite Δ corestriction and p∤h_K are retained; this construction is not identified with the CH α-stabilized sequence without the normalization comparison.

**Hypotheses and conventions.**

- LV admissible triple; finite quotient of order prime to p; tower control.
- The additive suggested realization takes a specific compact Hausdorff norm tower, closed level subgroups, continuous vertical/tame maps, the input z and its operator Φ. Finite solvability is joint: for every finite conductor/edge set and finite height there is a partial family satisfying membership, bottom, norm and tame equations. The source trace modules prove this finite condition before compactness supplies the infinite family. This is weaker than assuming the desired infinite lift; independent choices at each conductor are insufficient. Vertical and tame maps preserve their selected level groups and the vertical/tame corestriction square commutes.

**Required API.**

- `universalNormClass_bottom`: The constructed joint family has β₀[n]=Φz_n, using the Φ and z supplied to that construction.
- `universalNormClass_norm`: The supplied tower’s cor_m[n] sends β_{m+1}[n] to β_m[n]; these are not laws for subsequently chosen unrelated maps.
- `universalNormClass_tame`: For an edge nℓ→n of the same supplied tower, its tame corestriction sends β_m[nℓ] to a_ℓβ_m[n]. Both values belong to one simultaneously selected family.
- `universalNormClass_exists`: Joint finite solvability in a compact Hausdorff tower implies a nonempty carrier of families satisfying every bottom, membership, vertical norm and tame equation. The proof uses closed constraints and the finite intersection property.

**Tests and boundary cases.**

- `universalNormClass_bottom_test`: In the compact Z/5 fixture with Φ=2, z_0=1 and z_n=3 for n>0, the actual constructed bottom values are β_0[0]=2 and β_0[1]=1; β_0[0] differs from z_0. This detects dropping Φ.
- `universalNormClass_zero`: The constructor explicitly selects the zero family for zero geometric input, in the same fixed norm tower.
- `universalNormClass_two_steps`: In that fixture the vertical norm is multiplication by 2. The constructed components at conductor 0 are β_1=1 and β_2=3, and two applications of the actual corestriction give β_0=2. Replacing corestriction by zero fails the first nonzero bottom constraint.
- `universalNormClass_tame_test`: In the same simultaneously constructed Z/5 family, the tame edge 1→0 has identity corestriction and a_ℓ=3. At height 1, β_1[1]=3 while β_1[0]=1, so the actual tame equation is 3=3·1.

**Prerequisites.** [GH.3.5: Trace polynomial intersection theorem](#trace-polynomial-intersection); **SelmerIwasawaCohomology**, **L3** — iwasawa cohomology; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **SelmerIwasawaCohomology**, **L4** — bloch kato condition.

**Sources.** **LV16**, §4.2, Definition 4.4 and Proposition 4.5, p.13.

<a id="layer-gh-4"></a>

## Layer GH.4: Explicit reciprocity in fixed weight

<a id="bdp-special-value-formula"></a>

### GH.4.1: BDP special value formula

Under BDP Assumption 5.12 (normalized f∈S_k(Γ₀(N),ε_f), odd c prime to Nd_K, odd discriminant K with the stated Heegner ideal, split p prime to Nc, and the finite-local-sign conditions on Σ_cc), let m=k−2 and χ∈Σ_cc^(1) have infinity type (k−1−j,1+j), 0≤j≤m. Then L_p(f,χ)/Ω_p^{2(m−2j)}=(1−χ^{-1}(p̄)a_p+χ^{-2}(p̄)ε_f(p)p^{k−1})² · (c^{−j}/j! · Σ_[a]∈Pic(O_c) χ^{-1}(a)N(a) AJ_F(Δ_{φ_aφ₀})(ω_f⊗ω_A^jη_A^{m−j}))². This is a special value of the squared BDP function, not a complex derivative. Import the underlying GL₂ square-root distribution and its interpolation from L3h. GZ.9 uses the m=0 specialization and supplies the quaternionic and exceptional formulas.

**Hypotheses and conventions.**

- All five clauses of BDP Assumption 5.12; CM differential, periods, representatives and geometric reciprocity fixed.

**Tests and boundary cases.**

- At m=j=0 the factorial and c power are 1; the degree-zero correction remains. A vanishing Euler polynomial forces this special value to vanish without forcing each cycle to vanish.

**Prerequisites.** [GH.1.12: Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); [GH.1.13: Depleted Coleman component calculation](#coleman-depletion-calculation); **AutomorphicPadicLFunctions**, **L3h**.

**Sources.** **BDP13**, §5.3, Assumption 5.12 and Theorem 5.13, pp.1137–1139.

<a id="cm-differential-scaling"></a>

### GH.4.2: CM differential scaling

Under ω_A↦aω_A and η_A↦a^{-1}η_A with a≠0, the AJ evaluation on ω_A^jη_A^{m−j} scales by a^{2j−m}, and its square scales by a^{2(2j−m)}. The period Ω_p scales by a in the matching convention, so BDP’s normalized equation transforms consistently. These are signed integer exponents, not truncated natural subtraction.

**Hypotheses and conventions.**

- Nonzero a and the pairing normalization ⟨ω_A,η_A⟩=1.

**Tests and boundary cases.**

- For m=2,j=0 the evaluation scales by a^{-2}; using a^0 from natural subtraction fails.

**Prerequisites.** [GH.0.3: The eigenbasis ω_A^jη_A^{m−j} of Sym^m H¹_dR(A) and its O_K-characters](#cm-character-decomposition); [GH.4.1: BDP special value formula](#bdp-special-value-formula).

**Sources.** **BDP13**, §1.4, (1.4.2) and (1.4.6), pp.1052–1053.

<a id="ramified-character-abel-jacobi-formula"></a>

### GH.4.3: Ramified character Abel–Jacobi formula

In CH Theorem 4.9 let ψ have type (r,−r), conductor c₀ prime to Np, and φ type (r+j,−j−r), −r<j<r, with exact conductor p^n, n≥1; put χ=ψ̂^{-1}φ̂. Then L_{p,ψ}(f)(φ̂^{-1})/Ω_p^{−2j}=[g(φ_p^{-1})φ_p(p^n)c₀^{1−r}ψ̂_p^{-1}(p^n)/(r−1+j)!] · ⟨log_p z_{f,χ},ω_f⊗ω_A^{r−1+j}η_A^{r−1−j}t^{1−2r}⟩. This evaluates the linear square-root distribution, and the proof’s exact conductor cancellations cannot substitute for BDP’s unramified Euler polynomial.

**Hypotheses and conventions.**

- CH setup and critical interval; exact ramified conductor n≥1; periods and geometric reciprocity fixed.

**Tests and boundary cases.**

- At j=0 the factorial is (r−1)! and the t factor is t^{1−2r}; squaring is not part of this equation.

**Prerequisites.** [GH.1.9: Character-projected Heegner class](#character-projected-heegner-class); [GH.1.12: Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula); **AutomorphicPadicLFunctions**, **L3h**.

**Sources.** **CH22**, §4.5, Theorem 4.9, pp.19–21.

<a id="fixed-weight-regulator-adapter"></a>

### GH.4.4: Fixed-weight regulator specialization

Apply the supplier’s relative Lubin–Tate Perrin–Riou map to V=V_f(r)⊗ψ̂^{-1}, whose F⁺ line is unramified after this twist. Pair with ω_f⊗t^{−2r} and the CM period identifications η_A=t_A^{-1}t, ω_A=t_A=Ω_pt. CH Theorem 5.1’s specialization in the positive logarithmic range and the dual exponential range supplies the epsilon, Euler and factorial factors; the density argument in Theorem 5.7 uses ramified n>1 characters and the epsilon identity ε(φ̂)=g(φ_p^{-1})φ_p(−p^n). The finite unramified base change and Γ̃ finite quotient are part of the map.

**Hypotheses and conventions.**

- Theorem 5.1 hypotheses: nonnegative Hodge–Tate weights, no trivial quotient and no invariants on the relevant tower; ordinary rank-one line and matched twists.

**Tests and boundary cases.**

- The line unramified before a Tate twist need not stay unramified after the twist; ψ is part of the repair.

**Prerequisites.** **PadicHodgeRegulators**, **L3**; [GH.3.3: Iwasawa Heegner class](#iwasawa-heegner-class); [GH.4.3: Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula).

**Sources.** **CH22**, §5.1 and §5.3, Theorem 5.1, Lemma 5.5 and proof of Theorem 5.7, pp.21–25.

<a id="castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity"></a>

### GH.4.5: Castella–Hsieh explicit reciprocity law

Under CH §5, in Λ_{F̂^ur}(Γ̃), ⟨L_{p,ψ}(z_f),ω_f⊗t^{−2r}⟩=−c₀^{r−1} L_{p,ψ}(f)·σ_{−1,p}, where σ_{−1,p}=rec_p(−1)|_{K_{c₀p∞}} has order dividing 2. The analytic side is the linear square-root distribution. The sign, c₀ power and group-algebra translation remain in the identity; equality after squaring loses this normalization.

**Hypotheses and conventions.**

- Ordinary f; ψ of type (r,−r) and conductor c₀ prime to Np; the first-step class adapter and regulator interpolation checked.

**Tests and boundary cases.**

- After augmenting the Artin operator one still has −c₀^{r−1}; a measure equality without these factors is a different normalization.

**Construction or proof route.** Use the preceding regulator adapter and CH 4.9 at a dense set of exact-conductor n>1 characters with j=0. The epsilon identity contributes φ_p(−1), producing σ_{−1,p}; collect c₀^{r−1} and the sign. Use boundedness (Lemma 5.5) and Weierstrass density to conclude equality of Iwasawa algebra elements.

**Prerequisites.** [GH.4.4: Fixed-weight regulator specialization](#fixed-weight-regulator-adapter); [GH.3.3: Iwasawa Heegner class](#iwasawa-heegner-class); **AutomorphicPadicLFunctions**, **L3h**.

**Sources.** **CH22**, §5.3, Theorem 5.7 and proof, pp.24–25.

<a id="dual-exponential-special-value"></a>

### GH.4.6: Dual exponential special value

CH Corollary 5.8 gives, in the j≥r range, ⟨exp*loc(z_{f}^{χ^{-1}}),ω_f⊗ω_A^{−j−r}η_A^{j−r}⟩² = c_{f,K}(e′_p(f,χ))²(p^{2r−1}/α²)^n χ^{-1}ψ(𝔑)L_alg(f,χ,r)/Γ(j−r+1)², with c_{f,K}=8u_K²√D_K c₀^{2r−1}ε(f). For n>0 e′_p=1; for n=0 it is (1−α^{-1}χ(σ_p)p^{r−j−1})(1−α^{-1}χ(σ_p̄)p^{r−j−1}). This is the local nonvanishing input to rank zero, distinct from the logarithmic critical range.

**Hypotheses and conventions.**

- Ordinary f and CH’s locally algebraic character and period normalization; j≥r; α unit root.

**Tests and boundary cases.**

- At positive conductor there is no unramified e′_p factor; a nonzero L-value gives nonzero local dual exponential.

**Prerequisites.** [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **AutomorphicPadicLFunctions**, **L3h**; **PadicHodgeRegulators**, **L3**.

**Sources.** **CH22**, §5.3, Corollary 5.8, pp.25–26.

<a id="layer-gh-5"></a>

## Layer GH.5: Higher-weight Kolyvagin systems

<a id="longo-vigni-admissible-triple"></a>

### GH.5.1: Longo–Vigni admissible triple

LV Definition 2.1 excludes primes in Ξ: those dividing 6N(k−2)!φ(N)c_f, or for which im ρ_{f,p} does not contain {g∈GL₂(O_F⊗Z_p):det g∈(Z_p×)^{k−1}}. Require also p∤h_K, p unramified in F, p split in K, and a_p∈O_p×. Fix k≥4 even, (D_K,N)=1 with all primes of N split in K and O_K×={±1}; thus K=Q(i),Q(√−3) are excluded in this application. c_f is the integral index specified by the newform lattice, not an arbitrary normalizing scalar.

**Hypotheses and conventions.**

- LV §1–2 coefficient field and lattice conventions; all four admissibility clauses and its CM-unit restriction.

**Required API.**

- `admissibleTriple_exceptional`: Admissibility implies p∤6N(k−2)!φ(N)c_f.
- `admissibleTriple_classNumber`: Admissibility implies p∤h_K, so the bottom Hilbert class quotient has prime-to-p order; it does not assert that every auxiliary-conductor ring class quotient does.
- `admissibleTriple_ordinary`: The ordinary Fourier coefficient is a unit, not merely nonzero in F.
- `admissibleTriple_bigImage`: The source p-adic image must contain the determinant-restricted subgroup, not merely be irreducible.

**Tests and boundary cases.**

- `admissibleTriple_two`: p=2 always belongs to the excluded set.
- `admissibleTriple_class_number`: If p divides h_K the triple is excluded even when its Fourier coefficient is a unit.
- `admissibleTriple_unit`: The ordinarity projection is Mathlib’s unit predicate in O_p.

**Prerequisites.** [GH.0.8: Newform and CM coefficient projector](#newform-cm-projector); **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **AutomorphicGaloisRepresentations**, **R19.1**.

**Sources.** **LV16**, §2.2, Definition 2.1 and Remark 2.2, pp.3–4.

<a id="higher-weight-howard-hypotheses"></a>

### GH.5.2: Higher-weight Howard hypotheses

For LV’s T⊗Λ and each permitted height-one specialization S_P, verify the imported Howard H0–H5: rank two freeness; absolute residual irreducibility; the auxiliary extension and residual cohomology vanishing; Cartesian propagation of every local condition; a perfect self-dual pairing; and the τ-decomposition with its compatible sign. LV Lemma 2.4 gives A[p](K_∞)=0 from its determinant-restricted big image and solvable ring-class tower. Proposition 3.3 then verifies the specialization hypotheses. The pairing, local Cartier property and admissible auxiliary primes are actual verification obligations, not definitions of the source’s classes.

**Hypotheses and conventions.**

- LV admissibility; coefficients and τ action fixed; all hypotheses of ES.5 stated by its exact supplier target.

**Tests and boundary cases.**

- A self-dual pairing alone does not imply Cartesian propagation at p.

**Prerequisites.** [GH.5.1: Longo–Vigni admissible triple](#longo-vigni-admissible-triple); **EulerSystemsAndKolyvaginSystems**, **ES.5** — howard hypotheses; **ArithmeticGaloisDuality**, **R02.2** — compact five term.

**Sources.** **LV16**, §5.1, verification of (H.0)–(H.5), pp.18–19; Lemma 2.4, p.5.

<a id="longo-vigni-local-assumptions"></a>

### GH.5.3: Longo–Vigni local assumptions

LV Assumption 3.2 requires V crystalline at p; a rank-one ordinary filtration of T whose F⁻T has trivial inertia; F⁺T and F⁺A exact annihilators under local duality; and finiteness of H⁰(K_{∞,v},F⁻A) and H⁰(K_v,F⁻A). These clauses are kept as application hypotheses. For the self-dual higher-weight twist, the untwisted ordinary quotient’s unramifiedness is not itself proof of trivial inertia on F⁻T: its Tate character must be tracked. Resolve this with the edition’s representation convention or a stronger applicable control theorem before claiming the unconditional application.

**Hypotheses and conventions.**

- LV §3.3 Assumption 3.2, rather than ordinarity alone; explicit local representation convention.

**Tests and boundary cases.**

- Multiplying an unramified character by a nontrivial cyclotomic power usually changes its inertia action.

**Prerequisites.** [GH.5.1: Longo–Vigni admissible triple](#longo-vigni-admissible-triple); **SelmerIwasawaCohomology**, **L4** — bloch kato condition; **EulerSystemsAndKolyvaginSystems**, **ES.5** — howard hypotheses; **PadicHodgeRegulators**, **L3**.

**Sources.** **LV16**, §3.3, Assumption 3.2, p.9.

<a id="specialization-control"></a>

### GH.5.4: Specialization and exceptional-prime control

LV Proposition 3.4 compares the specialized Selmer module with the S_P Selmer group, with kernel and cokernel finite and bounded in terms of [S_P:Λ/P], away from a finite exceptional set. Use the actual H⁰ and local annihilator hypotheses of Assumption 3.2. This is the application’s control input for the ES.8 height-one patching theorem, including perturbed primes (g+p^m), rather than a blanket isomorphism at every prime.

**Hypotheses and conventions.**

- LV local assumptions, finite-exception exclusion, no residual tower invariants; finite degree specialization.

**Tests and boundary cases.**

- The pΛ prime is excluded from the unramified height-one comparison; its contribution is controlled separately.

**Prerequisites.** [GH.5.2: Higher-weight Howard hypotheses](#higher-weight-howard-hypotheses); [GH.5.3: Longo–Vigni local assumptions](#longo-vigni-local-assumptions); **SelmerIwasawaCohomology**, **L2** — galois selmer group; **ArithmeticGaloisDuality**, **R02.2** — compact five term.

**Sources.** **LV16**, §3.4, Proposition 3.4, pp.10–11.

<a id="higher-weight-kolyvagin-class"></a>

### GH.5.5: Higher-weight Kolyvagin system

Starting from LV β[n], apply D_n=∏_{ℓ|n}Σ_{i=1}^{|G_ℓ|−1}iσ_ℓ^i, sum over the specified coset representatives, reduce modulo I_n and descend uniquely using residual invariant vanishing. The raw κ_n satisfy the finite–singular relation up to units u_ℓ determined by Nekovář/CH’s local calculation. Set κ′_n=(∏_{ℓ|n}u_ℓ)^{-1}κ_n⊗⊗_{ℓ|n}σ_ℓ. This lies in the imported ES.3 Kolyvagin-system module and has κ′₁=κ₁. Transverse local membership and the p-condition are separate checks; κ₁≠0 is supplied by GH.6, not by the definition.

**Hypotheses and conventions.**

- LV admissible tower and the required local assumptions; choices of generators fixed then checked for independence; coefficient and admissible-prime ideals as in ES.5.

**Required API.**

- `correctedKolyvaginClass_unit`: The local correction is the inverse product of u_ℓ, with each u_ℓ a unit.
- `correctedKolyvaginClass_bottom`: At n=1 the correction leaves κ₁ unchanged.
- `correctedKolyvaginClass_fs`: The corrected localization satisfies the exact generic finite–singular square.
- `correctedKolyvaginClass_generator`: Changing σ_ℓ rescales the derivative coefficient and the G_ℓ tensor by reciprocal factors, preserving the intrinsic class.

**Tests and boundary cases.**

- `correctedKolyvaginClass_empty`: The empty correction product is 1 and κ′₁=κ₁.
- `correctedKolyvaginClass_minus`: A correction u=−1 negates the raw class.
- `correctedKolyvaginClass_wrong_unit`: Replacing a correction unit by 0 kills the class and cannot give an equivalent system.

**Prerequisites.** [GH.3.6: Universal norm Heegner class](#universal-norm-heegner-class); [GH.2.3: Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [GH.2.5: Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); [GH.5.2: Higher-weight Howard hypotheses](#higher-weight-howard-hypotheses); [GH.5.3: Longo–Vigni local assumptions](#longo-vigni-local-assumptions); **EulerSystemsAndKolyvaginSystems**, **ES.3** — kolyvagin system module.

**Sources.** **LV16**, §4.3, Lemma 4.6 and Theorem 4.7, pp.14–16.

<a id="longo-vigni-admissibility-and-the-lambda-adic-bound"></a>

### GH.5.6: Conditional Longo–Vigni bound

Given the verified higher-weight H0–H5, local Assumption 3.2, bounded specialization control and κ′₁≠0, import ES.5’s DVR theorem and ES.8’s Λ theorem. The pro-Selmer module is torsion free of Λ-rank one and X is pseudo-isomorphic to Λ⊕M⊕M with M torsion, char(M)=char(M)^ι and char(M) dividing char(Selhat/Λκ′₁). In ideal-containment language char(Selhat/Λκ′₁)⊆char(M). This is a conditional application of generic descent; it does not re-plan Howard’s theory or reverse the divisibility. GH.6 supplies κ′₁≠0 and identifies Λκ′₁ with H∞.

**Hypotheses and conventions.**

- All application inputs explicitly verified; generic ES.8 patching assumptions, including height-one symmetry, hold.

**Tests and boundary cases.**

- The asserted inequality is an upper bound on the torsion length; equality is the separate main conjecture.

**Prerequisites.** [GH.5.5: Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class); [GH.5.4: Specialization and exceptional-prime control](#specialization-control); **EulerSystemsAndKolyvaginSystems**, **ES.8** — self dual lambda adic kolyvagin bound.

**Sources.** **LV16**, §3.4, Theorem 3.5, p.11.

<a id="layer-gh-6"></a>

## Layer GH.6: Nonvanishing and Selmer consequences

<a id="anticyclotomic-nonvanishing"></a>

### GH.6.1: Anticyclotomic nonvanishing

Under CH Theorem 3.9’s extra (N_f,D_K)=1, the square-root measure L_{p,ψ}(f) has nonzero value at all but finitely many finite-order anticyclotomic p-power characters. Its proof chooses an auxiliary coefficient prime ℓ with absolutely irreducible residual restriction to G_K and invokes Hsieh’s Theorem C after switching the analytic tower and auxiliary prime roles; this analytic theorem is supplied by L3h. Combining nonzero values with the ramified logarithm formula gives nonzero z_{f,χφ} for all but finitely many finite-order φ in the critical interval. The analytic and algebraic conclusions retain their own hypotheses.

**Hypotheses and conventions.**

- CH §3 setup, (N_f,D_K)=1 and the auxiliary residual condition of Hsieh’s input; −r<j<r for the algebraic logarithm implication.

**Tests and boundary cases.**

- A nonzero class follows from a nonzero local logarithm; a complex simple zero alone has no such implication here.

**Prerequisites.** **AutomorphicPadicLFunctions**, **L3h**; [GH.4.3: Ramified character Abel–Jacobi formula](#ramified-character-abel-jacobi-formula).

**Sources.** **CH22**, §3, Theorem 3.9 and proof, p.14; §6, Theorem 6.1(2), p.27.

<a id="selmer-rank-one"></a>

### GH.6.2: Rank-one Selmer consequence

For CH Hypothesis (H), canonical CM data and an anticyclotomic χ of type (j,−j) with −r<j<r, if z_{f,χ}≠0 then Sel(K,V_f(r)⊗χ)=F·z_{f,χ}. Ordinarity is not required for this fixed-weight implication. CH Theorem 7.7 identifies the source local conditions with Bloch–Kato and supplies Euler-system descent; its higher-weight verification uses the actual local p-condition. The eventual nonvanishing assertion is supplied separately by the preceding target.

**Hypotheses and conventions.**

- CH (H): p∤2(2r−1)!Nφ(N), conductor χ prime to N, every prime of N split in K, p split; class nonzero; canonical CM/period setup.

**Tests and boundary cases.**

- For z=0 the conclusion cannot be inferred; the nonzero hypothesis is essential.

**Prerequisites.** [GH.2.1: Heegner cycle norm relations](#cycle-norm-relations); [GH.2.3: Frobenius congruence for cycle classes](#cycle-frobenius-congruence); [GH.2.2: Complex conjugation of Heegner classes](#cycle-conjugation); [GH.2.4: Finite local Abel–Jacobi class](#finite-local-abel-jacobi-class); **SelmerIwasawaCohomology**, **L2** — galois selmer group; **EulerSystemsAndKolyvaginSystems**, **ES.5**.

**Sources.** **CH22**, §6, Theorem 6.1(1), p.27; §7.3, Theorem 7.7, pp.31–32.

<a id="selmer-rank-zero"></a>

### GH.6.3: Rank-zero Selmer consequence

Under CH (H), for ordinary f and χ of type (j,−j) with j≥r or j≤−r, L(f,χ,r)≠0 implies Sel(K,V_f(r)⊗χ)=0. The dual-exponential special value supplies a nonzero local class in the complementary Euler-system condition; CH Theorem 7.9 and the corrected Proposition 7.8 local proof then force vanishing of the Bloch–Kato Selmer group. Use χ^{-1} and conjugation for the opposite range.

**Hypotheses and conventions.**

- Ordinary a_p; CH (H); outside the critical interval; nonzero normalized central value; corrected local condition adapter.

**Tests and boundary cases.**

- In the critical interval the root number is −1; this theorem’s nonzero central-value hypothesis applies to the opposite range.

**Prerequisites.** [GH.4.6: Dual exponential special value](#dual-exponential-special-value); [GH.2.5: Corrected derivative local condition](#local-condition-at-p-and-the-castella-hsieh-corrections); **SelmerIwasawaCohomology**, **L2** — galois selmer group; **EulerSystemsAndKolyvaginSystems**, **ES.5**.

**Sources.** **CH22**, §6, Theorem 6.2 and proof, p.27; §7.4, Theorem 7.9, p.33.

<a id="selmer-consequences-with-the-corrected-dimension-formula"></a>

### GH.6.4: Corrected Selmer growth formula

For the CH anticyclotomic ring-class p-tower, the eventual dimension is dim_F Sel(K_{p^n},V_{f,χ})=((1−ε(V_{f,χ}))/2)[K_{p^n}:K]+e with e≥0 independent of n. The root sign is −1 exactly for −r<j<r and +1 outside; thus the slope is 1 or 0. This is CH Theorem 6.3 in its corrected form, with the finite quotient and coefficient extensions in the character decomposition tracked.

**Hypotheses and conventions.**

- The fixed-weight CH setup and hypotheses used by Theorems 6.1–6.2; n sufficiently large; ordinary assumption for the rank-zero branch.

**Tests and boundary cases.**

- For ε=+1 the dimensions stabilize; for ε=−1 their leading term is the tower degree.

**Prerequisites.** [GH.6.1: Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [GH.6.2: Rank-one Selmer consequence](#selmer-rank-one); [GH.6.3: Rank-zero Selmer consequence](#selmer-rank-zero); **SelmerIwasawaCohomology**, **L3** — iwasawa shapiro; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients.

**Sources.** **CH22**, §6, Theorem 6.3, p.27; **CH erratum**, First correction, p. 1.

<a id="selmer-parity"></a>

### GH.6.5: Selmer parity

For ordinary f under CH (H), ord_{s=r}L(f,χ,s)≡dim_F Sel(K,V_f(r)⊗χ) mod 2. The proof uses Nekovář’s self-dual family parity theorem and its 2009 correction, plus one sufficiently ramified specialization whose Selmer dimension is 0 or 1 according to the root sign. The residue is (1−ε)/2 mod 2; ±1 itself cannot represent the two different residues modulo 2.

**Hypotheses and conventions.**

- Ordinary f; the self-dual induced family and its local parity hypotheses are supplied; the corrected Nekovář theorem applies.

**Tests and boundary cases.**

- The parity residue is 0 at ε=+1 and 1 at ε=−1.

**Prerequisites.** [GH.6.2: Rank-one Selmer consequence](#selmer-rank-one); [GH.6.3: Rank-zero Selmer consequence](#selmer-rank-zero); [GH.6.1: Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); **SelmerIwasawaCohomology**, **L4**.

**Sources.** **CH22**, §6.4, Theorem 6.4 and proof, pp.27–28.

<a id="universal-norm-module-rank-one"></a>

### GH.6.6: Universal norm module of rank one

For LV’s admissible triple and its verified control and local assumptions, H∞, the Λ-submodule of the pro-Selmer module generated by the norm classes, is free of rank one and is generated by κ̃₁. Theorem 4.12 uses eventual nonzero generalized cycles from CH, the Φ image/intersection calculation and a universal-norm/Nakayama argument. Merely knowing κ̃₁≠0 does not prove that it generates all of H∞ or that H∞ is saturated.

**Hypotheses and conventions.**

- LV admissibility and verified application conditions; comparison of CH classes with the LV finite Δ norm convention.

**Tests and boundary cases.**

- A nonzero element p of Λ is not a generator of Λ; nonvanishing alone cannot justify the module-generation conclusion.

**Prerequisites.** [GH.3.6: Universal norm Heegner class](#universal-norm-heegner-class); [GH.3.5: Trace polynomial intersection theorem](#trace-polynomial-intersection); [GH.6.1: Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [GH.5.4: Specialization and exceptional-prime control](#specialization-control); [GH.5.5: Higher-weight Kolyvagin system](#higher-weight-kolyvagin-class).

**Sources.** **LV16**, §4.3, Definition 4.10 and Theorem 4.12, pp.16–18.

<a id="lambda-structure-consequence"></a>

### GH.6.7: Higher-weight Iwasawa structure

With the GH.5 application hypotheses verified and GH.6’s H∞=Λκ̃₁ free of rank one, LV Theorem 1.1 follows by importing the generic Λ bound: X∞∼Λ⊕M⊕M, char(M)=char(M)^ι, char(M) divides char(Selhat/H∞). Equality of characteristic ideals is LV’s main conjecture and is not asserted here. The conclusion is conditional on the stated local-filtration and normalization comparison hypotheses.

**Hypotheses and conventions.**

- The admissible triple, H0–H5, local Assumption 3.2, control and universal-norm identification are all verified.

**Tests and boundary cases.**

- The quotient in the divisibility is Selhat/H∞ after identifying H∞, not a quotient by an arbitrary nonzero class.

**Prerequisites.** [GH.5.6: Conditional Longo–Vigni bound](#longo-vigni-admissibility-and-the-lambda-adic-bound); [GH.6.6: Universal norm module of rank one](#universal-norm-module-rank-one).

**Sources.** **LV16**, Introduction Theorem 1.1 and §5.1, pp.2,18–19.

<a id="layer-gh-7"></a>

## Layer GH.7: Ordinary families and specialization

<a id="critical-character-twist"></a>

### GH.7.1: Critical character and CM family twist

Fix the Hida component and a lift i modulo 2(p−1). Castella’s critical character is Θ=ω^{i/2}[⟨ε_cyc⟩^{1/2}]. Extend the branch to include the CM character λ, and construct Ξ and ξ=Ξ/Ξ̄ as in §2.6. The critically twisted family is T†=T⊗Θ^{-1}, with determinant ε_f ε_cyc; the self-dual convention requires trivial nebentypus ε_f=1. Keep ε_f in the general family determinant; the regulator line is in T†|_{G_K}⊗ξ^{-1}. The induced unramified rank-one character Ψ at p, its Frobenius value and λ_reg=Ψ(Fr_p)−1 must be tracked through this precise twist. ξ is not substituted for an arbitrary anticyclotomic character.

**Hypotheses and conventions.**

- Fixed branch, geometric reciprocity, square-root lift and CM character λ; ordinary residual irreducible and p-distinguished family.

**Required API.**

- `criticalTwist_apply`: The twisting character is Θ(g)^{-1}ξ(g)^{-1}.
- `criticalTwist_selfDual`: If the untwisted determinant character δ=ε_f Θ²ε_cyc, twisting by Θ⁻¹ξ⁻¹ gives determinant ε_f ε_cyc ξ⁻². Setting ε_f=1 recovers the self-dual convention; a nontrivial nebentypus factor survives the critical twist.
- `criticalTwist_specialize`: Specialization of the coefficient ring commutes with both inverse character factors.

**Tests and boundary cases.**

- `criticalTwist_trivial`: With both characters trivial the twist is trivial.
- `criticalTwist_inverse`: Multiplying the twist by Θξ gives the trivial character.
- `criticalTwist_order`: The CM and critical inverse factors commute in the coefficient unit group.
- `criticalTwist_nebentypus`: On G=Q× with ε_f the identity character and Θ=ξ=ε_cyc=1, the twisted determinant at −1 remains −1. Dropping ε_f would incorrectly give 1.

**Prerequisites.** **PadicFamilies**, **L0** — hida control theorem; **ComplexMultiplicationAndExplicitReciprocity**, **CM.1**; **AutomorphicGaloisRepresentations**, **R19.6**; **PadicHodgeRegulators**, **L3**.

**Sources.** **Castella**, §2.6, Definition 2.8, p.10; §4.1, Theorem 4.3, pp.18–19; §5.1, p.21.

<a id="howard-family-tower"></a>

### GH.7.2: Howard family class tower

On X₁(Np^s), form the ordinary divisor/Kummer classes from Howard’s CM points P_{c₀p^n,s} defined over K̃_{c₀p^n}(μ_{p^s}), with the diamond character ϑ²=ε_cyc and critical twist Θ^{-1}. The horizontal degeneracy trace is U_p; after U_p^{-s} normalization take the s-inverse limit to X_c. Then Z_{c₀,t}=U_p^{1−t}X_{c₀p^t} is corestriction compatible in t and defines Z_{c₀,∞}∈H¹_Iw(K̃_{c₀p∞},T†). It lies in the strict Greenberg condition when the required bad-prime residual ramification holds.

**Hypotheses and conventions.**

- Hida ordinary, residual irreducible and p-distinguished; fine-level CM data; bad-prime torsion freeness as in Castella Proposition 4.8.

**Required API.**

- `howardTowerClass_level`: The conductor-t class is U_p^{1−t}X_{c₀p^t}.
- `howardTowerClass_trace`: The normalized family classes are corestriction compatible.
- `howardTowerClass_greenberg`: The local family class lies in the strict Greenberg submodule under the source bad-prime hypotheses.

**Tests and boundary cases.**

- `howardTowerClass_one`: At t=1 the class is X₁.
- `howardTowerClass_two`: At t=2 the class is U_p^{-1}X₂.
- `howardTowerClass_unit`: With U_p=1 there is no renormalization.

**Prerequisites.** [GH.7.1: Critical character and CM family twist](#critical-character-twist); **HeegnerPointEulerSystems**, **HE.1** — canonical model cm descent; **AutomorphicGaloisRepresentations**, **R19.6**; **SelmerIwasawaCohomology**, **L3** — iwasawa cohomology; **ModularCurvesPartII**, **R14.3**; **HeegnerPointEulerSystems**, **HE.1**.

**Sources.** **Castella**, §4.2, Proposition 4.4, Definitions 4.5–4.6 and Proposition 4.8, pp.19–21.

<a id="family-representation-specialization"></a>

### GH.7.3: Family representation specialization

Castella’s T=lim_s e^ord T_p(J_s)⊗_h I is free of rank two under residual irreducibility and p-distinguishedness. It has trace ρ(Fr_ℓ^{-1})=a_ℓ and determinant ε_f(ℓ)[ℓ]ℓ, and its ordinary quotient is unramified with geometric Frobenius inverse eigenvalue a_p. At an arithmetic ν the critically twisted specialization identifies with T_{fν}(rν) after the specified coefficient extension and residual assumptions. This family representation and control belong to R19.6/PadicFamilies; this target compares their convention with the GH class.

**Hypotheses and conventions.**

- Normal finite-flat Hida branch and arithmetic ν of the source’s weight and character; ordinary/residual hypotheses.

**Tests and boundary cases.**

- A trace convention at Fr_ℓ^{-1} cannot be silently replaced by arithmetic Fr_ℓ.

**Prerequisites.** **AutomorphicGaloisRepresentations**, **R19.6**; **PadicFamilies**, **L0** — hida control theorem; [GH.7.1: Critical character and CM family twist](#critical-character-twist); [GH.0.8: Newform and CM coefficient projector](#newform-cm-projector).

**Sources.** **Castella**, §4.1, Theorem 4.3, p.19.

<a id="family-measure-specialization"></a>

### GH.7.4: Family square-root measure specialization

Import L_{p,ξ}(f)∈I_W[[Γ̃]] from L3h. Castella Theorem 2.11 gives for ν of weight (kν,1), kν≥1, and φ type (ℓ,−ℓ), ℓ≥0, conductor c₀p^n: ν(L_{p,ξ}(f))(φ̂)²/Ω_p^{2kν+4ℓ}=L_alg(fν/K,χνξνφ,kν−1)E_p²φ(𝔑^{-1})8c₀ε(fν)w_K²√D_K. Here ψ=ξνφ. For n=0 E_p=(1−ν(a_p)(χνψ)_p(p)p^{-kν/2})(1−(χνψ)_p(p)p^{kν/2−1}ν(a_p)^{-1}); for n≥1 E_p=ε((χνψ)_p^{-1})p^{-n}. The χν norm factor converts kν−1 to the central kν/2 convention (Remark 2.12). The measure is square-root normalized; the displayed interpolation squares it.

**Hypotheses and conventions.**

- Castella §2.3–2.7’s CM and modular measure data; exact arithmetic ν and locally algebraic φ; complete unramified coefficient extension W.
- This is the consumer normalization comparison using the imported L3h interpolation theorem, not a second owner of the family distribution or Theorem 2.11.

**Tests and boundary cases.**

- At n>0 the epsilon factor replaces the two unramified Euler factors.

**Prerequisites.** **AutomorphicPadicLFunctions**, **L3h**; **PadicFamilies**, **L0** — hida control theorem; [GH.7.1: Critical character and CM family twist](#critical-character-twist).

**Sources.** **Castella**, §2.7, Theorem 2.11 and Remark 2.12, pp.11–12.

<a id="ochiai-exponential"></a>

### GH.7.5: Ochiai exponential

The local supplier must provide Castella Theorem 3.4: with Ical=I⊗̂Z_p[[Γ_cyc]], D=(F⁺T⊗Ẑ_p^ur)^{G_Qp} and J=(Ψ(Fr_p)−1,γ₀−1), an injective E_F^cyc:J(D⊗O_F)→H¹(F,F⁺Tcal) with pseudo-null cokernel for finite unramified F/Q_p. Its arithmetic specialization, including the weight-positive exponential interpolation, differs at conductor 0 and positive conductor. This ideal-restricted domain and pseudo-null error must survive every regulator adapter.

**Hypotheses and conventions.**

- Castella ordinary deformation Definition 3.1, rank-one unramified F⁺ line, determinant convention and finite unramified F.

**Tests and boundary cases.**

- At an exceptional arithmetic character the J-specialized map can vanish; an everywhere-isomorphism claim is invalid.

**Prerequisites.** **PadicHodgeRegulators**, **L3**; [GH.7.1: Critical character and CM family twist](#critical-character-twist).

**Sources.** **Castella**, §3.2, Theorem 3.4, pp.14–15.

<a id="yager-unramified-descent"></a>

### GH.7.6: Yager module and unramified descent

The supplier’s Yager module S∞ is the inverse limit under trace of the finite unramified coefficient modules S_m generated by y_m(x)=Σ_σ x^σ[σ^{-1}]. It is free of rank one over Z_p[[U]], satisfies y^u=[u]y, and identifies with lim_trace O_{F_m}. Use this equivariance to descend the tensor of the cyclotomic local maps to the unramified×cyclotomic tower. Finite unramified base change of a cyclotomic regulator alone is not this construction.

**Hypotheses and conventions.**

- Unramified Z_p-tower with its Galois action and trace; Castella §3.3 coefficient convention.

**Tests and boundary cases.**

- The coefficient action is by [u], with σ^{-1} in the Yager sum; changing either inversion changes descent.

**Prerequisites.** **PadicHodgeRegulators**, **L3**; [GH.7.5: Ochiai exponential](#ochiai-exponential).

**Sources.** **Castella**, §3.3, Proposition 3.5 and (3.6), p.15.

<a id="two-variable-regulator"></a>

### GH.7.7: Two-variable regulator

With G=U×Γ_cyc and λ_reg=Ψ(Fr_p)−1, the supplier map of Castella Theorem 3.7 has target λ_reg^{-1}J(D⊗Ô_{F∞}[[G]]), is injective, and interpolates the logarithm for w>0 at nonexceptional characters. For a p-old arithmetic specialization ν, Corollary 3.9 gives the dual exponential range w≤0 with its factorial and Euler factors. Keep the conductor-zero exceptional denominator and the integral ideal J; the target is not an unlocalized unrestricted coefficient algebra.

**Hypotheses and conventions.**

- The rank-one unramified ordinary line, Yager covariance and nonexceptional arithmetic specialization; all §3 conventions.
- The dual-exponential conclusion of Corollary 3.9 additionally requires ν to be p-old.

**Tests and boundary cases.**

- At λ_reg=0 localization does not produce a value; exceptional arithmetic primes require a separate statement.

**Prerequisites.** **PadicHodgeRegulators**, **L3**; [GH.7.6: Yager module and unramified descent](#yager-unramified-descent); [GH.7.5: Ochiai exponential](#ochiai-exponential).

**Sources.** **Castella**, §3.4, Theorem 3.7 and Corollary 3.9, pp.16–17.

<a id="family-regulator-localization"></a>

### GH.7.8: Anticyclotomic family regulator

Castella Proposition 5.2 supplies L_ωf^Γ:H¹_Iw(K∞/F,F⁺T†⊗ξ^{-1})→I[λ_reg^{-1}]⊗W[[Γ]], injective with pseudo-null cokernel. It pairs the local map with the canonical family differential functional of Lemma 5.1. Passing from the two-variable tower to Γ uses the H² correction; the needed vanishing is checked through H⁰(K∞,F⁺T)=0. A quotient of the local regulator cannot be declared injective solely by tensoring its source and target.

**Hypotheses and conventions.**

- The critical/CM twist is the one giving Ψ; λ_reg is inverted; H⁰/H² condition and the canonical family differential are fixed.

**Tests and boundary cases.**

- The nonexceptional condition λ_reg≠0 is retained in each arithmetic specialization.

**Prerequisites.** [GH.7.7: Two-variable regulator](#two-variable-regulator); [GH.7.3: Family representation specialization](#family-representation-specialization); [GH.7.1: Critical character and CM family twist](#critical-character-twist); **SelmerIwasawaCohomology**, **L3** — iwasawa shapiro.

**Sources.** **Castella**, §5.1, Lemma 5.1 and Proposition 5.2, pp.21–22.

<a id="two-variable-explicit-reciprocity"></a>

### GH.7.9: Two-variable explicit reciprocity

In I[λ_reg^{-1}]⊗W[[Γ̃]], L_ωf^Γ(res_p Z_{c₀,∞}^{ξ^{-1}})=L_{p,ξ}(f)·σ_{−1,p}. This is Castella Theorem 5.3 with its own class/measure normalization; it has no additional −c₀^{r−1} prefactor. Its specialization must be compared with CH 5.7 through the named normalization adapter, not by identifying the two unnormalized class towers.

**Hypotheses and conventions.**

- Castella’s ordinary residual irreducible/p-distinguished family, local regulator domain, CM tower and measure; localized λ_reg.

**Tests and boundary cases.**

- Squaring conceals the class normalization; the family identity is kept linear.

**Prerequisites.** [GH.7.2: Howard family class tower](#howard-family-tower); [GH.7.8: Anticyclotomic family regulator](#family-regulator-localization); [GH.7.4: Family square-root measure specialization](#family-measure-specialization); [GH.1.12: Coleman Abel–Jacobi formula](#coleman-abel-jacobi-formula).

**Sources.** **Castella**, §5.2, Theorem 5.3, Proposition 5.4 and proof, pp.22–25.

<a id="ordinary-localization-injective"></a>

### GH.7.10: Ordinary localization injectivity

For an ordinary fixed-weight form f of even weight at least two and trivial nebentypus with residual restriction to G_K irreducible, Castella Lemma 6.4 makes the localization Sel_Gr(K_{c₀p∞}/K_{c₀},T_f(r))→H¹_Iw(local,F⁺T_f(r)) injective. The proof uses Λ-torsion freeness and infinitely many arithmetic specializations where the global rank-one class and its local logarithm are nonzero. This additional result is what turns equality of local regulator images into equality of global classes.

**Hypotheses and conventions.**

- Residual |G_K irreducibility, ordinary filtration, torsion-free global module and nonzero local classes at infinitely many finite characters.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Tests and boundary cases.**

- Equality after a local regulator gives a global equality only after this injectivity input.

**Construction or proof route.** Use the fixed-weight nonvanishing/reciprocity and Selmer rank-one result to show the finite-character localization kernels vanish. Apply torsion freeness and infinitely many specializations to kill the global kernel.

**Prerequisites.** [GH.6.1: Anticyclotomic nonvanishing](#anticyclotomic-nonvanishing); [GH.6.2: Rank-one Selmer consequence](#selmer-rank-one); [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **SelmerIwasawaCohomology**, **L2** — galois selmer group; **SelmerIwasawaCohomology**, **L3** — iwasawa cohomology; **SelmerIwasawaCohomology**, **L4**.

**Sources.** **Castella**, §6.2, Lemma 6.4, p.27.

<a id="initial-family-specialization"></a>

### GH.7.11: Initial family specialization

Under Castella Theorem 6.5, at an arithmetic ν of trivial character and weight 2rν>2 with 2rν≡k mod 2(p−1), ν(Z_{c₀,0})=(1−p^{rν−1}/ν(a_p))² AJ_et(Δ_heeg_{rν})/[u_{c₀}(2√−D_K)^{rν−1}], u_{c₀}=|O_{c₀}×|/2. Require trivial nebentypus of the fixed-weight form f, k≡2 mod p−1, residual |G_K irreducibility, p-distinguishedness and ramification at every q|(D_K,N), with Castella’s odd-discriminant Heegner and split-p setup. The weight-two p-new exceptional prime is outside this theorem.

**Hypotheses and conventions.**

- All Castella §6.2 hypotheses; α=ν(a_p) is the ordinary root; period and cycle normalization fixed.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Tests and boundary cases.**

- At a vanishing ordinary Euler factor the initial class can vanish; no exceptional-branch claim is made.

**Prerequisites.** [GH.7.9: Two-variable explicit reciprocity](#two-variable-explicit-reciprocity); [GH.7.10: Ordinary localization injectivity](#ordinary-localization-injective); [GH.7.3: Family representation specialization](#family-representation-specialization); [GH.1.15: Classical and generalized cycle comparison](#classical-generalized-cycle-comparison); [GH.3.2: First-step stabilization adapter](#stabilized-first-step-adapter).

**Sources.** **Castella**, §6.2, Theorem 6.5 and proof, p.28.

<a id="higher-weight-family-specialization"></a>

### GH.7.12: Higher-weight family specialization

Under the same source-qualified hypotheses as the initial formula, c₀^{rν−1}ν(Z_{c₀,∞})=z_{fν,c₀,α} in the strict Greenberg Iwasawa Selmer module, α=ν(a_p). The system comparison is global: it uses the family local reciprocity, CH’s fixed-weight reciprocity, exact differential and c₀ normalization, plus localization injectivity. It includes finite conductor moments through Shapiro and the specified character twists, while keeping λ_reg exceptional primes outside the localized comparison.

**Hypotheses and conventions.**

- Castella Theorem 6.5: weight and parity congruence, trivial arithmetic character, residual |G_K irreducibility, p-distinguishedness, required bad-prime ramification, odd CM discriminant, split p, c₀ prime to Np.
- The fixed-weight form f in Castella §6.2 has even weight at least two and trivial nebentypus; this is separate from the trivial arithmetic character at ν.

**Tests and boundary cases.**

- The initial cycle equality and the full system equality are different conclusions; both retain their normalization factors.

**Construction or proof route.** Compare both local regulator images at each nonexceptional arithmetic specialization with the exact c₀^{rν−1} factor. Use Lemma 6.4 localization injectivity to identify global Iwasawa classes. Project to finite conductor/character moments using the same Shapiro inversion and compare the initial formula.

**Prerequisites.** [GH.7.11: Initial family specialization](#initial-family-specialization); [GH.7.10: Ordinary localization injectivity](#ordinary-localization-injective); [GH.7.9: Two-variable explicit reciprocity](#two-variable-explicit-reciprocity); [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); **SelmerIwasawaCohomology**, **L3** — iwasawa shapiro.

**Sources.** **Castella**, §6.2, Theorem 6.5 and (6.7), p.28.

<a id="layer-gh-8"></a>

## Layer GH.8: Weight-two and integral normalization comparisons

<a id="weight-zero-cycle"></a>

### GH.8.1: The weight-two cycle is the corrected CM divisor

Let C be the modular curve used by the BDP construction, L a characteristic-zero field over which the CM point x_phi and a degree-one cusp b are rational, and identify X_0 with C by the empty-fiber-power identification. The homologically trivial weight-two cycle is [x_phi]-[b] in CH^1(C_L)_Q. After applying the chosen cuspidal Hecke correspondence e_f it is e_f([x_phi]-[b]). The raw point [x_phi] has degree one and is not the input to the degree-zero Abel--Jacobi map.

**Hypotheses and conventions.**

- BDP's fiber-power index is k-2, whereas CH writes the weight as 2r; weight two means respectively index 0 and r=1.
- Use the actual level structure and its field of definition. A ring class field alone is not asserted to define every chosen level point or cusp.
- The empty fiber-power identification and e_f are supplied by GH.0--GH.1, not new abstract carriers.

**Tests and boundary cases.**

- x_phi=b gives zero, whereas retaining [x_phi] gives degree one.
- Changing b to b_prime changes the class by [b]-[b_prime], not a literal integral independence assertion.
- Test k=2 against both source indices and retain the field extension needed for the level structure.

**Construction or proof route.** Compute the zeroth graph product in the fiber above x_phi and carry it through X_0=C. Subtract the chosen cusp and compute its degree as 1-1. On a smooth proper curve this degree-zero class has zero geometric degree-two cycle class. Apply the already constructed correspondence; do not apply the positive-fiber-power vanishing argument at index zero.

**Prerequisites.** [GH.0](#layer-gh-0); [GH.1](#layer-gh-1); **HeegnerPointEulerSystems**, **HE.1** — heegner points of conductor m and the modular parametrisation.

**Sources.** **BDP13**, Section 2.3, Proposition 2.7 and preceding paragraph, printed p. 1063.

<a id="modular-quotient-kummer"></a>

### GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient

For the preceding C, x_phi, b and L, let J=Pic^0(C), let pi:C->E be the chosen modular parametrization defined over L, and let q_pi:J->E satisfy q_pi([x]-[b])=pi(x)-pi(b). Let theta_C:V_p J -> H^1_et(C_bar,Q_p(1)) be the Picard--Kummer identification. With the corresponding f-projector on J satisfying q_pi e_f=q_pi, set gamma_pi=V_p(q_pi) composed with theta_C^{-1}. Then H^1(L,gamma_pi)(AJ_et(e_f([x_phi]-[b]))) equals kappa_E(pi(x_phi)-pi(b)) in H^1_cont(L,V_p E). Both sides may be extended to the same finite coefficient field. This is a rational-coefficient statement; it does not identify two chosen integral lattices.

**Hypotheses and conventions.**

- C is smooth, proper and geometrically connected, L has characteristic zero, and p is prime.
- Use the GH.1 Hochschild--Serre/Gysin convention, with connecting cocycle sigma(Q)-Q.
- The Picard--Kummer comparison and correspondence action must agree with that convention; use the degree-one comparison in GH.1.
- The actual quotient supplies q_pi and q_pi e_f=q_pi; equality of dimensions or eigenvalues does not.

**Tests and boundary cases.**

- For C=E, origin b and identity pi, recover the rational Kummer class.
- Replacing b by b_prime adds kappa_E(pi(b)-pi(b_prime)).
- Torsion basepoint differences vanish rationally; p-primary torsion cannot be discarded integrally.
- An isogeny of rational representations need not identify the integral Tate lattices.

**Construction or proof route.** Use the finite-level Picard--Kummer/Gysin comparison to identify the degree-one Abel--Jacobi class with the Kummer class of its divisor class in J. The sign comparison is explicitly supplied by GH.1. For a p^n-division point Q, applying q_pi takes sigma(Q)-Q to the connecting cocycle of q_pi([D]); changes of Q give corresponding coboundaries. Use compatible division points and the continuous-cochain/adic realization comparison, not an unproved interchange of H^1 and inverse limits. Apply q_pi e_f=q_pi and the preceding divisor description, retaining the basepoint translation.

**Prerequisites.** [GH.8.1: The weight-two cycle is the corrected CM divisor](#weight-zero-cycle); [GH.1](#layer-gh-1); **HeegnerPointEulerSystems**, **HE.1** — heegner points of conductor m and the modular parametrisation; **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions.

**Sources.** **BDP13**, Section 3.1, Definition 3.1 and Remark 3.2, printed pp. 1065--1066; **Castella**, Remark 6.6, p. 29.

<a id="character-sum-comparison"></a>

### GH.8.3: Character-weighted comparison without averaging

Let F/L be a finite abelian extension defining a compatible family of the preceding cycles and points, let G=Gal(F/L), and let chi:G->B^x be a character in a common coefficient field B. For the G-equivariant scalar extension gamma_* of the preceding comparison, gamma_*(sum_g chi(g) g.z)=sum_g chi(g) g.kappa_E(P). With this left-action convention each weighted sum lies in the chi^{-1}-eigenspace. No factor 1/|G| is introduced. A descent to H^1(L,V tensor chi), if used, is a further cohomological map with its own hypotheses.

**Hypotheses and conventions.**

- The coefficient representations extend to G_L, giving the quotient action on H^1(F,-).
- The parametrization, correspondence and comparison descend to L.
- chi is finite order with values in B; it is not an unspecified Hecke character or averaging idempotent.

**Tests and boundary cases.**

- The trivial character gives the trace, not the average.
- For a cyclic group of order three, check the inverse-character eigenvalue.
- When p divides |G|, the unnormalized sum is integral but division by |G| is not.

**Construction or proof route.** Apply the quotient comparison to every conjugate. Commute the equivariant linear map with the finite weighted sum. For h in G substitute t=hg; chi(h^{-1}t)=chi(h)^{-1}chi(t). An averaging projector needs |G| invertible; inflation--restriction descent is a separate argument. Identify the finite group action on continuous cohomology from GH.3; apply the coefficient-map naturality of GH.1. The weighted finite sum has the inverse-character eigenspace convention. Restriction and twisted descent must realize that convention rather than assuming invariants under the untwisted action.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`; [GH.1](#layer-gh-1); [GH.3](#layer-gh-3).

**Sources.** **CH22**, Section 5.2, character specialization after equation (5.1) and Lemma 5.4, p. 23.

<a id="positive-conductor-stabilization"></a>

### GH.8.4: Comparison of positive-conductor stabilized classes

Let p be good ordinary for a weight-two form f of trivial character, and let alpha be the unit root of X^2-a_p X+p. Put K_n=K_{c_0 p^n} with (c_0,p)=1. For n>=1 let z_n be the rational corrected cycle class and k_n=kappa_E(P_n) its image under compatible maps gamma_n. Then gamma_n(z_n-alpha^{-1} res(z_{n-1}))=k_n-alpha^{-1} res(k_{n-1}). This compares only the p-divisible-conductor branch. The alpha^{-n} normalization belongs to the tower, not to the unnormalized stabilized finite-level class.

**Hypotheses and conventions.**

- CM points, basepoints and coefficient identifications are compatible with the field inclusions.
- p splits, the imaginary quadratic discriminant is less than -3, all level primes split, and p does not divide 2N phi(N), in the weight-two CH range.
- Use the same coefficient extension containing alpha and the actual continuous-cohomology restriction.
- When invoking the existing HE.8 point-system targets, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Tests and boundary cases.**

- The coefficient is alpha^{-1}, not p/alpha.
- At n=1 the lower class is raw conductor-c_0, not an unverified stabilized bottom.
- A nonordinary alpha is rejected for integral normalization although the rational linear identity can be written.

**Construction or proof route.** At r=1, p^{2r-2}/alpha becomes alpha^{-1}. Apply the quotient comparison at n and n-1. Use restriction naturality and linearity; no initial-conductor formula is needed.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`; **HeegnerPointEulerSystems**, **HE.8** — ordinary stabilized point.

**Sources.** **CH22**, Section 5.2, Definition 5.2 and equation (5.1), pp. 22--23.

<a id="positive-tail-corestriction"></a>

### GH.8.5: Corestriction of the normalized positive-conductor tail

In the preceding ordinary split setting, assume the actual geometric trace relation cor(k_n)=a_p k_{n-1}-res(k_{n-2}) and [K_n:K_{n-1}]=p for n>=2. Define y_n=alpha^{-n}(k_n-alpha^{-1} res(k_{n-1})) for n>=1. Then cor(y_n)=y_{n-1} for every n>=2. The uniquely determined bottom term is y_0=cor(y_1). Its Euler-factor expression is specified by initial-corestriction-comparison once the distinct first trace and degree have been supplied.

**Hypotheses and conventions.**

- The lower restriction in the trace equation lands in K_{n-1}.
- The raw trace and degree are geometric results, not postulated normalized Euler-system relations.
- Corestriction after restriction is the degree; the lattice contains the raw classes and alpha is a unit for integral boundedness.
- When invoking the existing HE.8 point-system targets, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Tests and boundary cases.**

- Check n=2 without a degree-p claim for K_1/K_0.
- Using 1/alpha in place of p/alpha fails the Hecke-polynomial calculation.
- The bottom is determined before expressing it using the two Frobenius operators.
- The abstract positive-tail calculation does not prove E(K)[p]=0. Verify this separately whenever importing the present HE.8 arithmetic realization.

**Construction or proof route.** Corestriction of k_n-alpha^{-1}res(k_{n-1}) is (a_p-p/alpha)k_{n-1}-res(k_{n-2}). The Hecke polynomial gives a_p-p/alpha=alpha. Multiply by alpha^{-n}. The single equation at n=1 determines the bottom. The first-conductor comparison is distinct; GH.3 supplies the actual Iwasawa realization. If two actual positive tails are identified by comparison maps commuting with the first corestriction, their norm-compatible bottoms agree by that commutative square. This determines the bottom from the tail, but does not identify the printed conductor-zero formula without the actual initial trace and normalization map. Compare with HE.8 ordinary-stabilized-point, stabilized-corestriction and anticyclotomic-heegner-class at the actual ring-class levels before taking its anticyclotomic quotient; use the supplier’s layer shift if the p-part of the class group changes the indexing.

**Prerequisites.** [GH.8.4: Comparison of positive-conductor stabilized classes](#positive-conductor-stabilization); **HeegnerPointEulerSystems**, **HE.2** — repeated conductor predecessor recurrence; **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; [GH.3](#layer-gh-3); Mathlib: `LinearMap`; **HeegnerPointEulerSystems**, **HE.8** — stabilized corestriction; **HeegnerPointEulerSystems**, **HE.8** — anticyclotomic heegner class.

**Sources.** **CH18**, Proposition 4.4, printed pp. 591--593; Lemma 5.3, printed pp. 601--602.

<a id="differential-evaluation"></a>

### GH.8.6: The modular differential factor in the logarithm comparison

Base change the quotient comparison to a finite unramified extension L_v/Q_p with the good-reduction models used in BDP Section 3. If pi^*omega_E=c_pi omega_f for the chosen invariant and modular differentials, then log_{E,omega_E}(pi(x_phi)-pi(b))=c_pi AJ_dR(e_f([x_phi]-[b]))(omega_f), transporting the realization and f-projection through the same quotient. Replacing the Abel--Jacobi evaluation by the elliptic logarithm in a squared identity introduces c_pi^{-2}, not c_pi^{-1}. No claim that c_pi=1 or is a p-adic unit is made.

**Hypotheses and conventions.**

- Use the GH.1 and PadicHodgeRegulators L1 local realization; do not extend the inspected unramified-base theorem without proof.
- c_pi is the actual nonzero pullback scalar.
- The f-projector fixes the differential and is compatible with the quotient and pairing.
- The elliptic logarithm includes its compatible extension from the formal group to the rational Kummer image.
- To use this comparison at a ramified conductor completion E, first obtain the finite-base-change restriction and corestriction/trace squares supplied by GH.1 and PadicHodgeRegulators L1. This target retains the inspected unramified-base statement; it does not silently enlarge it.

**Tests and boundary cases.**

- Scaling omega_E by u scales the equality by u and its square by u^2.
- For c_pi=3 use 1/9, not 1/3, in the squared substitution.
- A p-divisible scalar need not preserve an integral principal ideal.
- The zero CM-power exponent at weight two does not cancel c_pi.
- A conductor c_0 p^n completion is not treated as unramified merely because the regulator coefficient extension is completed unramified. The local field and coefficient field are separate data.

**Construction or proof route.** Localize the quotient/Kummer comparison. Apply naturality of the Bloch--Kato logarithm and its formal-group comparison. Use adjunction of the de Rham quotient and differential pullback. Evaluate c_pi omega_f and square the resulting equality; cancellation uses c_pi nonzero.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [GH.1](#layer-gh-1); **PadicHodgeRegulators**, **L1**; Mathlib: `Module.Dual`; Mathlib: `LinearMap.dualMap_apply`; Mathlib: `LinearMap.dualMap_comp_dualMap`.

**Sources.** **BDP13**, Sections 3.2--3.4, printed pp. 1066--1070.

<a id="ordinary-p-old-family"></a>

### GH.8.7: Weight-two p-old specialization of the ordinary family

Use the integral Hida branch I, critically twisted representation T-dagger, and Howard class Z_{c_0,infinity} constructed in GH.7 with Castella's author-copy normalization. Let its reference form have even weight k>2 with k congruent to 2 modulo p-1, and let nu be an arithmetic specialization of weight two and trivial character with 2 congruent to k modulo 2(p-1). Suppose its form is the ordinary p-stabilization of a newform of level prime to p. With alpha=nu(a_p), the source-normalized comparison is nu(Z_{c_0,infinity})=z_{f_nu,c_0,alpha} in the identified Greenberg Iwasawa cohomology of T_{f_nu}(1). The coefficient-specialization and critical-twist identification are part of the map. This target does not identify every later version of the CH classes without a normalization map.

**Hypotheses and conventions.**

- p does not divide 6N; c_0 is prime to pN; the imaginary quadratic discriminant is odd and less than -3; p splits.
- For comparison with CH impose the all-split classical Heegner hypothesis; this is a restricted common range, not all ramified-level cases in Castella.
- The residual representation is p-distinguished and remains irreducible over G_K. Retain the source ramification condition at primes dividing (D_K,N), vacuous in this common range.
- Use the source lattices, ordinary filtration and specialization, not arbitrary rationally isomorphic representations.
- Exclude p-new/multiplicative and nonordinary weight-two specializations.

**Tests and boundary cases.**

- Admit ordinary p-stabilizations of prime-to-p newforms, not p-new forms.
- Check both weight congruences, not just evenness.
- Keep the finite ring-class component; this is not automatically the class traced to K.
- Do not infer global-class equality from scalar regulator values without both injectivity statements.
- Injectivity must survive the actual quotient: multiplication by X on Q[X] is injective but induces the zero map on Q[X]/(X), a nonzero quotient. This is a regression against an invalid general inference, not a counterexample to the arithmetic source theorem.
- Nonzero evaluation on a one-dimensional line is injective. Projection from Q^2 to its first coordinate is not: (0,1) is lost. Keep the ordinary line, its dual vector and the nonzero pairing factor.

**Construction or proof route.** Use the actual weight-two quotient/Kummer comparison to identify both inputs of Castella equation (6.6). GH.7 supplies moments, critical twists and the coefficient/regulator specialization maps of (6.8)--(6.9). For global localization injectivity, follow Castella Lemma 6.4 through GH.7: torsion-freeness of the integral Greenberg module, specialization/control of the localization kernel, nonvanishing at infinitely many characters on every finite ring-class component, and the rank-one Selmer conclusion. Irreducibility alone is not that proof. For local injectivity, GH.7 must transport the two-variable regulator of Loeffler--Zerbes Proposition 4.11, whose hypothesis is an infinite unramified direction, through CH Theorem 5.1's quotient construction. Identify the coefficient algebra and the source/target submodules P,Q before taking quotients. For its linear map f, the pinned Submodule.ker_mapQ gives the descended kernel as the image of f^{-1}(Q) in M/P. The sufficient equality f^{-1}(Q)=P is an additional arithmetic/analytic obligation; injectivity before quotienting does not imply it. After the vector regulator descends injectively, evaluate on the specified nonzero dual vector of the one-dimensional ordinary crystalline line. CH (2022) Section 5.3 supplies the nonzero projection and the period relation (5.3); GH.7 must realize that pairing and coefficient extension. Evaluation on the full two-dimensional crystalline space is not injective in general. Transport the source-version pairing and group-like factors before comparing (6.8)--(6.9). Apply local injectivity, then global localization injectivity. At weight two c_0^{r_nu-1}=1. Neither the quotient-kernel calculation nor the fixed-denominator lemmas supplies the missing period, realization or lattice maps.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [GH.3](#layer-gh-3); [GH.4](#layer-gh-4); [GH.7](#layer-gh-7); Mathlib: `Submodule.mapQ`; Mathlib: `Submodule.ker_mapQ`; Mathlib: `Submodule.mkQ_map_self`; Mathlib: `LinearMap.ker_eq_bot`.

**Sources.** **Castella**, Theorem 6.5, equations (6.8)--(6.9), p. 28; Remark 6.6, p. 29; **LZ14**, Proposition 4.11 and proof, p. 18; context Theorem 4.7, pp. 16--17; **CH22**, Theorem 5.1 and proof, pp. 21--22; Section 5.3, (5.3) and Lemma 5.5, p. 24; **Mathlib quotient modules**, Quotient/Basic.lean lines 228--229, together with 158--159 and Submodule/Ker.lean 199--200.

<a id="initial-corestriction-comparison"></a>

### GH.8.8: The initial Euler factor from the raw trace and degree

Let F be a field, M_0 and M_1 F-vector spaces, res:M_0->M_1 and cor:M_1->M_0 linear, and sigma,tau endomorphisms of M_0. Let alpha,u be nonzero scalars, and a,p,d scalars satisfying alpha^2-a alpha+p=0 and u d=p-1. If u cor(x_1)=a x_0-sigma(x_0)-tau(x_0), cor(res(x_0))=d x_0 and sigma(tau(x_0))=x_0, then cor(alpha^{-1}(x_1-alpha^{-1}res(x_0)))=u^{-1}(1-alpha^{-1}sigma)(1-alpha^{-1}tau)x_0.

**Hypotheses and conventions.**

- This is the algebraic comparison lemma. The symbols p,u,d are scalars, not implicit arithmetic objects.
- For application, HE.0 and HE.2 must identify u with the actual conductor-change unit index and d with the first field degree for the specified class convention.
- Only sigma(tau(x_0))=x_0 is needed; no unmentioned splitting or commutation theorem is assumed.

**Tests and boundary cases.**

- For sigma=tau=id the factor is u^{-1}(1-alpha^{-1})^2.
- Exact rational test: p=5, alpha=2, a=9/2, u=1, d=4, x_0=1, cor=id, res=4 and x_1=5/2 give normalized bottom 1/4. These are algebraic test data, not asserted modular-form coefficients.
- Using the full unit count 2 instead of the index 1 in that test predicts 1/8 and fails.
- No degree-p assertion is made for the initial step.

**Construction or proof route.** Read the HE.0 conductor-change-kernel and ring-class-tower-quotients together with HE.2 split-ramified-first-step-recurrence. Transport their actual point trace through HE.3 Kummer naturality, keeping any cleared Hodge/basepoint factor. The algebraic identity below applies only once u, d, sigma and tau have been identified with these maps; a published positive-conductor recurrence does not prove this initial identification. Expand corestriction by linearity, and multiply by u alpha. The raw trace and u d=p-1 yield (a-(p-1)/alpha)x_0-sigma(x_0)-tau(x_0). The root identity gives a-(p-1)/alpha=alpha+alpha^{-1}. Expand the two Euler factors and use sigma(tau(x_0))=x_0. Cancel the nonzero scalars. In the actual ring-class application the degree and raw trace must first be transported through the level maps, cusp correction and quotient. This lemma does not certify that transport.

**Prerequisites.** **HeegnerPointEulerSystems**, **HE.0** — conductor change kernel; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **HeegnerPointEulerSystems**, **HE.2** — split ramified first step recurrence; **HeegnerPointEulerSystems**, **HE.2** — repeated conductor predecessor recurrence; **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`.

**Sources.** **CH18**, Section 5.2, Definition 5.2 and Lemma 5.3, printed pp. 601--602; **Castella**, Equation (6.7), author-copy p. 28.

<a id="initial-only-rescaling-obstruction"></a>

### GH.8.9: Rescaling only the bottom breaks a nonzero norm relation

For a linear map cor:M_1->M_0 of vector spaces over a field F, suppose cor(y_1)=y_0 and y_0 is nonzero. For every scalar t different from one, cor(y_1) is not t y_0. Thus changing only the initial factor cannot be justified as a uniform change of normalization. Multiplying every level by t does preserve all norm relations.

**Hypotheses and conventions.**

- The nonzero bottom hypothesis is essential; this test cannot prove nonvanishing of an arithmetic Heegner class.

**Tests and boundary cases.**

- In the rational model of initial-corestriction-comparison, the bottom 1/4 differs from 1/8.
- For bottom zero, every initial scalar has the same value; do not report a contradiction without nonvanishing.
- Scaling the whole system by 1/2 is allowed over Q and is distinct from scaling only y_0.

**Construction or proof route.** An equality cor(y_1)=t y_0 would imply (1-t)y_0=0. Cancel 1-t in the field. For a uniform rescaling, linearity gives cor(t y_1)=t cor(y_1); the same calculation works at every step.

**Prerequisites.** [GH.8.8: The initial Euler factor from the raw trace and degree](#initial-corestriction-comparison); Mathlib: `LinearMap`.

**Sources.** **CH18**, Definition 5.2 and Lemma 5.3, printed p. 601.

<a id="uniform-coherent-kernel-bound"></a>

### GH.8.10: A common reverse comparison bounds the tower kernel

Let R be a commutative ring, M_n,N_n R-modules, f_n:M_n->N_n and g_n:N_n->M_n linear, and d one fixed scalar. If g_n f_n=d id for every n, then every sequence x_n with f_n(x_n)=0 satisfies d x_n=0 for every n. In particular, this holds for every compatible sequence and bounds the kernel of the induced comparison of integral towers.

**Hypotheses and conventions.**

- For the cycle/point application, M_n is the chosen coefficient summand on which the modular quotient is a rational isomorphism, not the entire Jacobian cohomology.
- A reverse comparison on that summand and a single d for all levels are actual supplier obligations; level-dependent rational inverses do not suffice.

**Tests and boundary cases.**

- The statement permits torsion: d x=0 need not imply x=0 unless multiplication by d is injective.
- When d is a unit the bound gives injectivity.
- A bound d_n depending on n is not the asserted uniform conclusion.

**Construction or proof route.** Apply g_n to f_n(x_n)=0. Its left side is d x_n and its right side is zero. Interpret this componentwise conclusion in the existing compatible-sequence realization. No interchange of inverse limits and cohomology is used.

**Prerequisites.** [GH.1](#layer-gh-1); [GH.3](#layer-gh-3); **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`.

**Sources.** **CH22**, Section 5.2, equation (5.1) and the preceding integral inverse-limit construction, p. 23.

<a id="uniform-coherent-lift"></a>

### GH.8.11: A common reverse comparison lifts a fixed multiple

Let M_n,N_n be R-module inverse systems with transitions mu_n and nu_n. Suppose linear f_n:M_n->N_n and g_n:N_n->M_n satisfy f_n g_n=d id for one scalar d independent of n, and mu_n g_{n+1}=g_n nu_n. Every compatible sequence y_n in N has the compatible sequence x_n=g_n(y_n) in M, with f_n(x_n)=d y_n at every level. Thus, when f is also transition-compatible, the cokernel of its tower map is annihilated by d.

**Hypotheses and conventions.**

- The conclusion uses a compatible family of reverse maps; pointwise existence of preimages of d y_n is weaker and is not substituted.
- R is a commutative ring. Neither d invertible nor module freeness is needed for the multiple-lifting statement.
- The arithmetic application must construct the same fixed coefficient comparison at each field level, restricted to the correct f-summand.

**Tests and boundary cases.**

- For constant Z towers with f=2, g=id and d=2, twice every target element lifts but 1 does not.
- No right-exactness of inverse limits is invoked.
- For d a unit the explicit inverse is d^{-1}g; for nonunit d only the bounded kernel/cokernel conclusion is asserted.

**Construction or proof route.** Set x_n=g_n(y_n) without making independent lifting choices. Naturality of g and compatibility of y give mu_n(x_{n+1})=g_n(nu_n(y_{n+1}))=x_n. The other composite identity gives f_n(x_n)=d y_n. Together with the kernel bound, localization at powers of a nonzero d gives the rationalized comparison when the coefficient ring is a domain. An integral isomorphism needs stronger input, for example d a unit.

**Prerequisites.** [GH.8.10: A common reverse comparison bounds the tower kernel](#uniform-coherent-kernel-bound); [GH.1](#layer-gh-1); [GH.3](#layer-gh-3); **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`.

**Sources.** **CH22**, Section 5.2, equation (5.1) and its integral inverse-limit carrier, p. 23.

<a id="unbounded-denominators-counterexample"></a>

### GH.8.12: Rational level isomorphisms need not compare integral limits

Take M_n=Z with transition multiplication by 2, N_n=Z with identity transitions, and f_n multiplication by 2^n. The f_n are compatible and become isomorphisms over Q at every level. Nevertheless the integral compatible sequences in M are only zero, whereas those in N are all constant integer sequences. Consequently (lim M_n) tensor Q -> (lim N_n) tensor Q is 0 -> Q and is not an isomorphism. This does not deny that the limit of the rationalized M_n has compatible sequences with increasing denominators.

**Tests and boundary cases.**

- Check the naturality identity at n=0 as well as positive n.
- Finite truncations admit nonzero integral solutions, so testing finitely many levels is not a proof about the infinite limit.
- The rational sequence 2^{-n} must be admitted in lim(M_n tensor Q) and excluded from every single bounded-denominator multiple of lim M_n.
- This is a regression example for a method, not a counterexample to the arithmetic theorems of CH.

**Construction or proof route.** Compatibility is 2^n(2x)=2^{n+1}x; the inverse over Q is multiplication by 2^{-n}. For a compatible integral sequence x and fixed n, iteration gives x_n=2^k x_{n+k} for every k. If x_n is nonzero, the pinned integer divisibility bound forces 2^k<=|x_n|. By induction 2^k>=k+1; choose k>|x_n| to contradict that bound. Thus every x_n is zero. The constant sequence 1 survives in the target and has no integral compatible preimage. After tensoring the integral limits with Q the source stays zero. In the rationalized source levels the sequence x_n=2^{-n} is compatible and maps to the constant sequence 1. Its denominators are unbounded, identifying precisely the illegitimate interchange.

**Prerequisites.** Mathlib: `LinearMap`; Mathlib: `Int.natAbs_le_of_dvd_ne_zero`.

**Sources.** **CH22**, Section 5.2, equation (5.1), order of integral inverse limit and coefficient extension, p. 23.

<a id="primitive-character-stabilization"></a>

### GH.8.13: Exact-conductor character comparison of stabilized classes

Let G be a finite abelian group, H a subgroup, R a commutative integral domain, M and N R-modules, chi:G->R^x a character with chi restricted to H nontrivial, and q:M->N R-linear. For functions a,b:G->M with b(g h)=b(g) for all h in H, every beta,c in R satisfy q(c sum_g chi(g)(a(g)-beta b(g)))=c sum_g chi(g)q(a(g)). No division by |H| or |G| and no torsion-freeness of M or N is required. For the weight-two application take G=Gal(K_n/K_0), H=Gal(K_n/K_{n-1}), n>=1, b(g)=g res(z_{n-1}), beta=alpha^{-1}, c=alpha^{-n}, with alpha a unit. This proves the finite weighted cycle/point comparison; identifying it with the actual twisted cohomological specialization is a further GH.3 map.

**Hypotheses and conventions.**

- R contains the character values; alpha and its inverse lie in R for the integral arithmetic application. Over the coefficient field the same formula holds for any nonzero alpha.
- The exact conductor condition must be translated to chi|H nontrivial for the actual ring-class quotient. A character nontrivial on G but inflated from G/H is excluded.
- HE.3 supplies the quotient Galois action and H-invariance of the restriction image. The existing modular-quotient-kummer comparison supplies q, with equivariance when a(g)=g z_n.
- This is a comparison on actual modules and finite sums, not a new character carrier, an averaging projector, an inverse-limit interchange or an assumed cohomological descent theorem.

**Tests and boundary cases.**

- For G=C2, H=G, chi(g)=(-1)^g and b constant, the lower sum is zero over Z, including after acting on a torsion Z-module.
- For G=C4 and H={0,2}, chi(g)=(-1)^g is nontrivial on G but trivial on H. With b(g)=(-1)^g, b is H-invariant and the weighted lower sum is 4. The weakened condition must be rejected.
- For G=C9, H={0,3,6}, R=F19 and chi(g)=4^g, the restriction is nontrivial and every H-invariant b has zero weighted sum. Exact finite-field computation tests the last-kernel condition independently of characteristic zero.
- The domain hypothesis is genuine: for R=Z/8, G=C2, H=G, chi(1)=3 and constant b=1, the character is nontrivial with 3^2=1 but its weighted sum is 4, not zero. This input must be rejected.
- For the trivial character, lower-conductor terms need not vanish. Ramified finite-character checks therefore do not by themselves verify the printed initial Euler factor.
- At n=1 the lower term is the raw conductor-c_0 class. No equality with an unverified stabilized bottom is used; the same alpha^{-n} scalar occurs on both sides.

**Construction or proof route.** View chi|H as the existing MulChar on the finite commutative group H (the nonunit condition is vacuous), and check it is not the trivial character. Apply the pinned MulChar.sum_eq_zero_of_ne_one to obtain the scalar equality sum_h chi(h)=0 in R. Partition G into left cosets tH and choose representatives only for this finite proof. By b(t h)=b(t) and multiplicativity, the sum over tH of chi(t h)b(t h) equals chi(t)(sum_h chi(h))b(t), hence zero. Reindexing is the existing finite-sum API; the result is independent of the temporary representatives. Sum over the cosets, expand the stabilized expression, and commute q with scalar multiplication and the finite sum. Cancellation happened in the coefficient ring before acting on M, so possible torsion of M is harmless. For n>=1, use positive-conductor-stabilization and the quotient comparison at each conjugate to identify q(a(g)). Retain alpha^{-n}; do not replace the unit-root coefficient alpha^{-1} by p/alpha. GH.3 must construct the finite-character evaluation of the integral Iwasawa class, the coefficient twist and its descent. CH Lemma 5.4 invokes Rubin Lemma 2.4.3 for this map. The finite-sum calculation is not a substitute for it and does not settle the conductor-zero branch.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [GH.8.3: Character-weighted comparison without averaging](#character-sum-comparison); [GH.8.4: Comparison of positive-conductor stabilized classes](#positive-conductor-stabilization); [GH.3](#layer-gh-3); **HeegnerPointEulerSystems**, **HE.0** — conductor change kernel; **HeegnerPointEulerSystems**, **HE.0** — ring class tower quotients; **HeegnerPointEulerSystems**, **HE.3** — kummer classes and the modified selmer conditions; Mathlib: `LinearMap`; Mathlib: `Equiv.prod_comp`; Mathlib: `MulChar.sum_eq_zero_of_ne_one`.

**Sources.** **CH18**, Lemma 5.4 and its proof, printed p. 602; exact conductor cp^n and equation (5.1); **CH22**, Section 5.2, Lemma 5.4, printed p. 23, including the citation of Rubin Lemma 2.4.3; **Mathlib character sums**, Basic.lean, section sum, theorem sum_eq_zero_of_ne_one; finite commutative-monoid and integral-domain context.

<a id="weight-two-reciprocity"></a>

### GH.8.14: Weight-two reciprocity through the modular quotient

Let f be the weight-two ordinary prime-to-p newform attached to E, with the CH standing hypotheses, p split in K and (c_0,Np)=1. Let psi have infinity type (1,-1) and conductor c_0. Use the GH.3 class z_f, its CH 2022 psi^{-1}-twist and finite-ring-class corestriction, and the GH.1 quotient coefficient map gamma_pi into V_p E. Let S_F be the completed unramified coefficient Iwasawa algebra on the same ring-class quotient used in CH Theorem 5.7. On the corresponding ordinary crystalline line let d_gamma be the induced coefficient map, and let ell_f be the CH functional written omega_f tensor t^{-2}. Transport the elliptic differential and CM generator to a functional ell_E satisfying ell_E composed with d_gamma = c_pi ell_f, where pi*omega_E=c_pi omega_f; this equality is an arithmetic comparison target. Then, for the transported vector regulator R_E and point Iwasawa class y_E=H^1_Iw(gamma_pi)(z_f), ell_E(R_E(y_E tensor psi^{-1})) = -c_pi L_{p,psi}(f) sigma_{-1,p} in S_F. The point class is identified with the HE.8 Kummer system using the actual first-corestriction square. After any defined coefficient/group-quotient homomorphism rho, the image is -rho(c_pi) rho(L_{p,psi}(f)) rho(sigma_{-1,p}). No invertibility of c_pi in the integral ring is asserted.

**Hypotheses and conventions.**

- The common range is odd discriminant -D_K<-3, all primes of N split in K, p not dividing 2N phi(N), ordinary good reduction at p, and the actual level/cusp descent from GH.0--GH.1.
- Use rational coefficients until the uniform integral comparison is supplied. The two-sided lattice maps are on the selected multiplicity-one f-factor; periods in the completed unramified extension are not automatically integral units.
- For the psi-twisted differential, equation (5.3) introduces Omega_psi. Its generator and nonzero inverse must be transported explicitly when extracting ell_f. Changing omega_E or omega_psi changes both the functional and the formula.
- The chosen coefficient map and distribution pushforward respect restriction, corestriction, twisting and crystalline duality. GH.7 supplies this anticyclotomic regulator diagram.
- Finite-conductor local fields can be ramified over the unramified BDP base. GH.1 and PadicHodgeRegulators L1 must provide the de Rham/Bloch--Kato finite-base-change squares before differential-evaluation is used there; completed unramified coefficients do not remove this obligation.
- When invoking the existing HE.8 point-system targets, retain their E(K)[p]=0 hypothesis and their actual ring-class-to-anticyclotomic trace/index maps. For auxiliary c_0 retain the finite ring-class component until its explicit corestriction; this is not an automatic identification with the c_0=1 system.

**Tests and boundary cases.**

- At r=1 the factorial and c_0 power become 1; the minus sign and sigma_{-1,p} remain.
- Replacing omega_E by b omega_E multiplies the elliptic functional and c_pi by b. The scalar reciprocity identity changes by the same factor, and a squared logarithm formula changes by b squared.
- At a character theta the group-like term evaluates to theta(sigma_{-1,p}). It can be 1 or -1 on the full ring-class quotient; projecting to a pro-p Z_p quotient may kill it and must be stated.
- A map rho killing c_pi produces a zero image identity. This gives no nonvanishing conclusion and no licence to cancel rho(c_pi).
- Check E(K)[p]=0 before the present HE.8 identification, or prove the corresponding supplier extension. The scalar transport by itself imposes no such torsion vanishing.

**Construction or proof route.** Apply the imported GH.4 CH 2022 reciprocity target at r=1: the conductor factor is c_0^0=1 and the scalar is negative, with the group-like sigma_{-1,p} retained. Identify the positive finite-level cycle and point classes with modular-quotient-kummer, positive-conductor-stabilization and primitive-character-stabilization. Use GH.3 finite-character descent and the genuine first-corestriction comparison to identify their Iwasawa classes. First apply the GH.1/PadicHodgeRegulators L1 finite-base-change restriction and corestriction/trace squares at each actual local conductor field. Then use differential-evaluation and GH.1 de Rham duality to compute the pullback of the elliptic functional. Insert the GH.4 CM-period and Tate-period maps; verify ell_E d_gamma=c_pi ell_f on the actual line. Do not apply the inspected unramified BDP theorem directly to a ramified completion. Use GH.7 regulator naturality to move gamma_pi through the vector regulator, then evaluate the functional and apply the imported reciprocity identity. Apply rho as a ring homomorphism; do not infer an integral characteristic-ideal identity from a rational scalar equation.

**Prerequisites.** [GH.8.2: Abel--Jacobi and Kummer classes under the modular quotient](#modular-quotient-kummer); [GH.8.6: The modular differential factor in the logarithm comparison](#differential-evaluation); [GH.8.5: Corestriction of the normalized positive-conductor tail](#positive-tail-corestriction); [GH.8.8: The initial Euler factor from the raw trace and degree](#initial-corestriction-comparison); [GH.8.13: Exact-conductor character comparison of stabilized classes](#primitive-character-stabilization); [GH.8.11: A common reverse comparison lifts a fixed multiple](#uniform-coherent-lift); **HeegnerPointEulerSystems**, **HE.8** — anticyclotomic heegner class; [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.3](#layer-gh-3); [GH.4](#layer-gh-4); [GH.7](#layer-gh-7); Mathlib: `LinearMap`; Mathlib: `LinearMap.dualMap_apply`; [GH.1](#layer-gh-1); **PadicHodgeRegulators**, **L1**.

**Sources.** **CH22**, Section 5.3, equations (5.3)--(5.5), Definition 5.6 and Theorem 5.7, pp. 24--25; **BDP13**, Sections 3.1--3.4, pp. 1065--1070; **CH22**, Section 4.5, de Rham base-change discussion, p. 19.

<a id="automorphic-reciprocity-export"></a>

### GH.8.15: Source-qualified ordinary inputs for automorphic congruences

Export to AutomorphicCongruences L2 the GH.4 CH 2022 scalar regulator identity and GH.7 Castella Theorem 5.3 with their actual coefficients and classes. For a Hida branch I and the character xi in the Castella author copy, set lambda=Psi(Frob_p)-1 and S_I=I[lambda^{-1}] completed tensor W. The family identity is R_Cas(loc_p(Z_{c_0,infty} tensor xi^{-1}))=L_{p,xi}(family) sigma_{-1,p} in S_I[[Gamma_tilde]], where R_Cas includes the printed finite-ring-class corestriction and group restriction. At a permitted specialization nu with nu(lambda) nonzero, the coefficient homomorphism sends the analytic distribution to the CH-convention L_{p,xi_nu}(f_nu) by Castella Theorem 2.11. The class moment is c_0^{1-r_nu} z_{f_nu,c_0,alpha} in the exact range of Theorem 6.5; the weight-two p-old extension uses ordinary-p-old-family and weight-two-reciprocity. For a continuous coefficient/group homomorphism rho defined on S_I[[Gamma_tilde]], the exact family identity transfers to rho(R_Cas(...))=rho(L_{p,xi}(family)) rho(sigma_{-1,p}). The CH identity transfers separately with its -c_0^{r-1} factor and t^{-2r} functional. Identify these source presentations only after the GH.4/GH.7 period, twist, pairing and coefficient diagram is proved.

**Hypotheses and conventions.**

- The family has p not dividing 6N, odd discriminant -D_K<-3, the classical Heegner hypothesis, split p, ordinary and p-distinguished residual representation irreducible on G_K, and residual ramification at primes of (D_K,N) for the comparison. The common CH weight-two comparison imposes the stronger all-tame-primes-split hypothesis.
- Theorem 6.5 requires a reference weight k congruent to 2 modulo p-1, weight 2r_nu>2 congruent to k modulo 2(p-1) and trivial character. At weight two use Remark 6.6 only when the specialization is p-old of prime-to-p level.
- A specialization of I need not extend to S_I. If nu(lambda)=0, GH.7 must construct an integral/regular model and its moment; no evaluation of a pole is allowed.
- The output is the native source identity and its defined transport. L2 constructs the automorphic congruence divisibility and compares its analytic function on the same lattice and character domain. Its Beilinson--Flach classes and its L2s semi-ordinary branch are separate inputs.

**Tests and boundary cases.**

- If nu(lambda)=0, a proposed map from S_I must be rejected unless a regular model has been proved. A denominator-cleared equality cannot be specialized by cancelling the zero denominator.
- Compare the positive Castella 5.3 sign with the negative CH 2022 sign and their t^{1-2r}/t^{-2r} conventions through actual maps; dropping the difference fails the export.
- Evaluate at a finite ring-class character before taking the anticyclotomic quotient, and check the image of sigma_{-1,p}; the full finite part cannot be replaced silently by a torsion-free group.
- A supersingular weight-two point does not pass the ordinary-family hypotheses. No claim about FW Beilinson--Flach classes follows from this Heegner identity.

**Construction or proof route.** Reuse GH.7 Theorems 2.11 and 5.3, including the xi^{-1} critical twist, omega_family trivialization, lambda localization and completion. Track the local-to-global corestriction and restriction through the finite ring-class component. Use GH.7 moments and ordinary-p-old-family to compare the class at admissible weights; use weight-two-reciprocity to compare the elliptic differential functional. Carry the CH and Castella pairings separately until the version diagram commutes. Apply a defined continuous ring homomorphism rho to each exact equality. Verify its action on coefficients and group generators, and its commutation with the class/regulator specialization, rather than naming two distributions equal. Hand these identities, their coefficient maps and their exact hypothesis ranges to L2. Period units, excluded height-one primes and resulting congruence divisibilities are proved by that consumer; the GH.8 export supplies no universal nonordinary specialization.

**Prerequisites.** [GH.8.7: Weight-two p-old specialization of the ordinary family](#ordinary-p-old-family); [GH.8.14: Weight-two reciprocity through the modular quotient](#weight-two-reciprocity); [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.4](#layer-gh-4); [GH.7](#layer-gh-7).

**Sources.** **Castella**, Theorem 2.11 and proof, pp. 12--13; Proposition 5.2 and Theorem 5.3, pp. 22--23; Theorem 6.5 and Remark 6.6, pp. 28--29; **CH22**, Theorem 5.7, p. 25.

<a id="corrected-bsd-input-export"></a>

### GH.8.16: Higher-weight input comparison for the corrected multiplicative BSD proof

For each auxiliary ordinary prime-to-p-level newform g_m of even weight k_m>2 in the corrected Castella multiplicative proof, export the GH.2--GH.7 Heegner system with its actual lattice T_{g_m}, Selmer local conditions, character convention and completed unramified coefficients. In the source convention used by the proof, its initial Kolyvagin class agrees with the stabilized Iwasawa class kappa_{g_m,infty} through the higher-weight GH.5 comparison on the actual GH.3 class; GH.5 supplies that unit and its inverse, not just a rational nonzero multiple. Export the CH 5.7 scalar regulator formula -c_0^{r_m-1} L_{p,psi}(g_m) sigma_{-1,p}, and GH.7 Castella 2.11/5.3 analytic moments, along their proved normalization maps. Under any specified coefficient reduction R_{g_m} to R_{g_m}/p^m, these exact identities commute with reduction. The source Selmer containment and non-torsion conclusion must be proved under the precise tame-level hypotheses used for g_m. BSD.6a supplies the congruences T_{g_m}/p^m congruent to T_pE/p^m, the analytic-function congruence, control, both divisibilities and the limit argument; GH.8 supplies their source-qualified higher-weight inputs, without claiming a p-old cycle/point comparison for the p-new multiplicative weight-two form.

**Hypotheses and conventions.**

- The corrected source has p>3, split p, an ideal M in O_K with O_K/M congruent to Z/MZ, residual irreducibility on G_K for g_m, a nonsplit q exactly dividing M, the stated nonsplit-special local automorphic type, and 2 exactly dividing M if 2 is nonsplit. The lattice congruence and rigidity arguments deriving these conditions belong to BSD.6a.
- CH standing Hypothesis (H) instead assumes all tame primes split, and its factorial restriction is weight-dependent. Longo--Vigni admissibility and its exceptional set must also be verified. The export in the corrected source range therefore requires an explicit extension/adapter from GH.0--GH.7; the all-split theorem cannot be applied by dropping these conditions.
- GH.2 must supply the CH erratum and the Kobayashi--Ota replacement for the derived local condition, not the original absolutely-unramified-only Lemma 7.5 at ramified conductor.
- For E itself retain the corrected Theorem 1.1 conditions including E(Q_p)[p]=0 and the nonsplit residually ramified multiplicative prime. The transfer to E is congruence/control in BSD.6a, not Theorem 6.5 or Remark 6.6 at a p-new point.
- Use the native higher-weight GH.3/GH.5 classes and GH.7 analytic moments directly. The all-split p-old weight-two comparison and the elliptic HE.8 class are not suppliers of the higher-weight leading-class unit. The generic fixed-denominator bounds do not replace that integral unit.

**Tests and boundary cases.**

- An all-split auxiliary level fails the corrected Theorem 2.3 nonsplit-prime requirement; the CH all-split range and the corrected range need an explicit extension, not a common-range shortcut.
- A merely nonzero lattice multiplier, for example p, cannot replace the asserted p-adic unit relating the leading Kolyvagin class and kappa_{g_m,infty}.
- Reduction modulo p^m respects the displayed scalar equation, but reduction of characteristic ideals is not inferred from it. The congruence and Fitting/control calculation remains in BSD.6a.
- A p-new multiplicative weight-two form fails Remark 6.6. Reject a direct application, while retaining its valid auxiliary higher-weight and family analytic inputs.
- The supersingular BSTW/CLW branch has its own zeta elements and signed reciprocity. This ordinary export supplies none of those conclusions.
- The dependency graph for this export does not require a weight-two point comparison at an auxiliary nonsplit tame level. Its native higher-weight supplier range is checked separately.

**Construction or proof route.** Read the corrected proof of Theorem 2.3 as an import list: CH (4.7) and Section 5.2 from GH.2/GH.3, CH Theorem 5.7 from GH.4, LV Theorem 4.7 and the integral leading-class unit from GH.5, and CH Theorem 6.1 non-torsion from GH.6. GH.7 supplies the native Castella Theorems 2.11/5.3 analytic inputs. Do not replan those systems. Prove the source-range adapter for nonsplit tame primes and weight-dependent admissibility in GH.0--GH.7. The source-range adapter is a prerequisite of this export; it must be proved independently of the consumer conclusion. Compare the selected integral coefficient lattice, Iwasawa group action (including any inversion from discrete-dual conventions) and local conditions by actual maps. GH.5 supplies the higher-weight leading-class unit, and GH.7 the analytic moment identity in a defined coefficient model. Apply coefficient reduction to the exact scalar reciprocity identities. Hand the resulting equalities and verified hypothesis packages to BSD.6a; that consumer compares with its Sigma-imprimitive analytic function and proves the congruence/control passage to the multiplicative elliptic curve.

**Prerequisites.** [GH.4.5: Castella–Hsieh explicit reciprocity law](#castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity); [GH.0](#layer-gh-0); [GH.2](#layer-gh-2); [GH.3](#layer-gh-3); [GH.4](#layer-gh-4); [GH.5](#layer-gh-5); [GH.6](#layer-gh-6); [GH.7](#layer-gh-7).

**Sources.** **BSD erratum**, Theorem 2.3 and proof, pp. 3--4; proof of Theorem 1.1 and footnote 1, p. 4; **CH erratum**, Lemma 7.5/Proposition 7.8 correction, p. 1.
