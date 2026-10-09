# Galois representations attached to modular and Hilbert modular forms

The goal is a reusable arithmetic interface between a cuspidal eigenform, its
geometric realisations, its rank-two Galois representations and the integral
Hecke algebra acting on them. The interface should work over coefficient fields,
their completions and stable lattices, and should retain the monodromy operator
at ramified places. It supplies the representations used by Serre-weight
arguments, modularity lifting, compatible systems, ordinary refinements,
generalized Heegner cycles and crystalline regulators.

There are two complementary constructions. Parabolic cohomology and newform
projectors give the classical higher-weight representations and the geometric
Hilbert cases. Congruences between Hilbert eigensystems give representations
without a finite discrete-series component. Weight one has a separate finite-image
construction: an integral eigenvalue lattice, a sparse-prime estimate and a
finite-group lifting argument precede the Artin representation. Neither the
geometric construction nor its weight-one replacement is just a prescription of
Frobenius traces.

The six layers are:

| Layer | Mathematical output |
| --- | --- |
| R19.1 | Classical cohomological factors, integral realisations, and the weight-one Artin construction |
| R19.2 | Hilbert representations, the normalization dictionary, and CM/ordinary identifications |
| R19.3 | Ramanujan bounds, large image, purity and the fixed-form compatible family |
| R19.4 | Full local parameters away from the coefficient characteristic, including conductors and monodromy |
| R19.5 | Coefficient-prime comparison, ordinary lattice intersections and crystalline/Wach realisations |
| R19.6 | Residual representations, full Hecke algebras, determinant laws and deformation-ring maps |

Layer order organizes the mathematical interfaces. Proof order also follows the
specific dependencies below: in particular, the full strict family and its
all-place purity use both local-compatibility layers. The generic compatible-system
carrier is an early import; potential modularity is not needed to construct this
fixed-form family. The coefficient-prime theorem does not serve as an input to
the independent geometric weight theorem used in its own proof.

## Boundaries and imported mathematics

This roadmap owns the arithmetic extraction and identification of eigenform
representations. It uses the existing form spaces, operators, coefficient fields
and modular-symbol period lines. In Lean, classical forms start with Mathlib's
[`ModularForm`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/ModularForms/Basic.lean)
and `CuspForm`; the latter vanishes at cusps. The character, level and rational
structures on these spaces come from Tau Ceti's ModularForms roadmap. Do not
introduce a second analytic form space or select a numerical period from an
unspecified lattice.

| Supplier | Interface used here |
| --- | --- |
| Tau Ceti ModularForms, layers 0, 4, 8, 8W and 8G | Nebentypus, Eisenstein and newform decomposition, oldform operators, coefficient fields, modular-symbol rational structures and period lines; the weight-one integral lattice and conjugate eigensystems |
| ModularCurvesPartII:R14.2–R14.6 | Hecke actions on curves/Jacobians, parabolic coefficient cohomology, modular abelian quotients, special-fibre Eichler–Shimura |
| GeneralizedHeegnerCycles:GH.0 | Fine-level Kuga–Sato fibre powers, equivariant smooth compactification, resolution and boundary comparison |
| HilbertModularVarietiesAndShimuraCurves:R18.2, R18.4, R18.5 | Integral/bad-reduction models, coefficient sheaves and automorphic multiplicity spaces, Drinfeld and supersingular geometry |
| GL2AutomorphicRepresentationsAndTransfer:R16.2, R16.3, R16.6, R17.3–R17.5 | Local classification/Langlands, multiplicity one, Jacquet–Langlands, base change and quadratic induction |
| ArithmeticGaloisRepresentations:R01.1–R01.6 | Continuous carriers, lattices, recognition, Weil–Deligne functors, finite/Lie-group tools and Tate modules |
| PadicHodgeTheory:R06.2, R06.3, R06.5, P7 | Period functors and their dual/twist laws, crystalline lifting, geometric comparison, period continuation and Wach modules |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3–R07.4 | Integral small-weight comparison and the precise weight-two potentially Barsotti–Tate criterion |
| WeightsInEtaleCohomology:R34.4–R34.6 | Surface weight-monodromy, good-reduction purity and the independent Saito geometric weight theorem |
| LefschetzPencilsAndVanishingCycles:LPV.0, LPV.7:semistable-curves | Vanishing-cycle sequences and the normalization-kernel form of Picard–Lefschetz |
| PotentialModularityAndCompatibleSystems:R24.5:operations and its character-system interface | Early system carrier/operations and the converse from labelled Hodge–Tate characters to algebraic Hecke characters |
| IntegralHeckeAndGaloisDeterminants:IHG.1, IHG.4 | Generic reconstruction and whole-ring integral determinant descent |
| OrdinaryAutomorphicFormsAndModularityLifting:R21.3 | Exact ordinary graded characters and the specified invariant line |
| LocalGaloisDeformationRings:R08.3; GlobalGaloisDeformations:R04.3 | Local condition quotients, finite-algebra period families and universal global deformation rings |
| SerreWeightAndLevelOptimisation:R20.2, R20.6 | Level lowering and weight-two level optimization with their residual hypotheses |
| AutomorphicGaloisRepresentationsPartII:AG2.0–AG2.2 | Algebraic Hecke characters and early unitary/GL₃ geometric realisations and transfers |
| PadicFamilies:L2a, L2 | Generic eigenvariety gluing and its totally definite quaternionic instance over a totally real field |
| AutomorphicLFunctionsAndLocalFactors:AL.3; Tau Ceti Chebotarev and ArithmeticDirichletSeries | Rankin–Selberg estimates, holomorphy/nonvanishing, prime sums, density and Euler logarithms |

The AG2 imports are the early geometric and character exports. Its later rank-two
comparisons consume this roadmap and cannot supply its construction. Likewise,
the totally real quaternionic eigenvariety input must include that group and base
field; an eigencurve over Q alone is insufficient. Global transfers that identify
almost all Satake parameters must be strengthened to the specified local
restriction statements before use in the nonnormal cubic step.

The pinned mathematical baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Besides form spaces, the starting
algebra includes `Representation`, `Submodule.restrictScalars`, `DualNumber.eps`
and `Matrix.det_fin_two`. Finite-group lifting uses
`Subgroup.exists_right_complement'_of_coprime` for a normal subgroup whose order
is coprime to its index, then `nonempty_sections_of_finite_inverse_system` for
nonempty finite stages over a directed preorder. `Matrix.card_GL_field` counts
the full linear group, not a subgroup selected by a modular eigensystem.

For the weight-one analytic argument, `DirichletCharacter.LFunction_apply_one_ne_zero`
requires a nontrivial complex Dirichlet character, `riemannZeta_residue_one`
gives the residue limit at 1, and `NumberField.Embeddings.finite_of_norm_le`
requires integrality and a bound at every embedding. Tau Ceti's
[`TauCeti.LSeries.landau`](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LSeries/Landau.lean)
requires nonnegative coefficients and equality of the actual finite abscissa of
absolute convergence with the real boundary. These existing theorems do not by
themselves give the required prime-sum logarithms: the Euler-log expansion,
uniform prime-power remainder and density normalization are separate imports.

## Conventions shared by every layer

Let F be totally real, d=[F:Q], and π a cuspidal representation of GL₂(A_F).
Its infinity type `(k,w)` means that at each real embedding τ its component is
the discrete series D_{k_τ,w}, with k_τ≥2, k_τ≡w modulo 2, and central character
`t ↦ sgn(t)^{k_τ}|t|^{-w}`. Parallel weight is asserted only when stated.
For a coefficient number field E and λ|ℓ, representations are continuous over
E_λ; enlarge E when needed. No minimal field of definition is built into the
Hilbert constructor.

At an unramified finite v, write q_v for the residue cardinality and ϖ_v for a
uniformiser. The eigenvalues t_v and s_v are those of the double cosets
`diag(ϖ_v,1)` and `ϖ_v I₂`, respectively. Local class field theory sends ϖ_v to
**geometric** Frobenius. The cyclotomic character ε_ℓ therefore has value q_v⁻¹
there, and corresponds to the norm character `|·|_v`.

The single Hilbert object used throughout is ρ_{π,λ}, characterized at good
geometric Frobenius by

`P_v(X)=X²−t_vX+q_vs_v`.

Its determinant is χ_{π,λ}ε_ℓ⁻¹. Here χ_{π,λ} is the Galois character of π's
central character. A twist by an algebraic Hecke character η multiplies the
representation by η_λ. In particular, π⊗|det|⁻¹ has type `(k,w+2)` and its
representation is ρ_{π,λ}⊗ε_ℓ⁻¹. Its good polynomial is
`X²−q_vt_vX+q_v³s_v`.

| Source object | Expression in this convention |
| --- | --- |
| Carayol σ_λ(π) | ρ_{π,λ}⊗χ_{π,λ}⁻¹ = ρ_{π^∨,λ} = ρ_{π,λ}^∨⊗ε_ℓ⁻¹ |
| Saito ρ_{f,λ} | Carayol σ_λ(π_f), with Saito weight w_S translated by w=2−w_S |
| Kisin ρ_{π,λ} and Skinner ρ_π | ρ_{π,λ} itself |
| Classical cohomological M_{f,λ}, type `(k,k−2)` | ρ_{π_f,λ} |
| Deligne's classical arithmetic representation | M_{f,λ}^∨ |
| Skinner–Wiles arithmetic representation | σ_λ(π)^∨ = ρ_{π,λ}⊗ε_ℓ |
| Khare–Wintenberger arithmetic representation | ρ_{π,λ}^∨ in their type `(k,k−2)` setup |
| CDN ρ_Π, whose cohomology multiplicity is ρ_Π(−1) | ρ_{π,λ}^∨ for the corresponding GL₂ transfer |

Saito and Carayol use inverse-uniformiser operators. Their eigenvalues are
`τ_v=t_v/s_v` and `r_v=s_v⁻¹`; `X²−τ_vX+q_vr_v` describes σ_λ(π), not ρ_{π,λ}.
The Skinner–Wiles polynomial at arithmetic Frobenius has these same coefficients.
A dual alone does not convert Carayol to the global object: the cyclotomic twist
is part of the identity.

Use the grading `D_HT(V)=⊕_n(V⊗C_p(n))^{G}`. In that grading ε_ℓ has degree −1,
and H¹_ét of an elliptic curve has degrees 0 and 1. At τ the degrees of
ρ_{π,λ} are

`((w−k_τ+2)/2, (w+k_τ)/2)`.

Both are integral by parity, and their difference is k_τ−1. The good-place
Frobenius weight is w+1. If cyclotomic Hodge–Tate weight is instead declared +1,
the corresponding weights are the negatives of these degrees. Skinner's printed
pair `((w−k_τ)/2,(w+k_τ−2)/2)` requires the shift w↦w+2 to express our type;
it must not be combined unshifted with his central-character parameter. For Δ,
type `(12,10)` gives degrees 0,11 and weight 11; for weight two, type `(2,0)`
gives degrees 0,1.

For Weil–Deligne data at geometric Frobenius F, use `FNF⁻¹=q_v⁻¹N`.
Frobenius-semisimplification keeps N. Thus a Steinberg parameter cannot be
replaced by the semisimple sum of its two characters. The cohomological local
parameter is `Rec_v(π_v⊗|·|_v⁻¹/²)`; its L-factor is `L(s−1/2,π_v)` and its
conductor is that of π_v. In Carayol's convention use π_v^∨ in this L-factor.

For a classical normalized newform of weight k, level N and nebentypus ψ,
`t_p=a_p` and `s_p=ψ(p)p^{k−2}`. The cohomological polynomial at geometric
Frobenius, and the arithmetic-dual polynomial at arithmetic Frobenius, are both
`X²−a_pX+ψ(p)p^{k−1}`. The cohomological polynomial at arithmetic Frobenius
instead has inverse roots. Diamond–Flach–Guo's initial factor realizes the
conjugate eigensystem; the ψ⁻¹ twist below identifies our M_f. Test this with a
character of order greater than two, where ψ and ψ⁻¹ differ.

Reduction always means choose a stable lattice, reduce, then semisimplify.
Only this last object is lattice independent. Residual recognition uses full
characteristic polynomials, including in characteristic two. Distinguish
characteristic-zero global absolute irreducibility, residual absolute
irreducibility, strong irreducibility after restriction to open subgroups, and
local reducibility in an ordinary filtration.

All proposed API names below are in `TauCeti.ModularGalois`. Their tests specify
the full arithmetic interfaces. The accompanying Suggested.lean gives Lean
forms for the portions expressible using existing carriers; the README specifies
the constructions, including the geometric and local objects supplied by the
other roadmaps.

## R19.1 — Classical representations and their realisations

### Coefficient cohomology and the classical existence theorem

**Coefficient Eichler–Shimura.** At a fine level n≥3, put r=k−2 and take p∤nℓ. On parabolic cohomology with Sym^r of the universal elliptic H¹, construct the geometric pull–push operators and prove T_p=F+I_p^*V, FV=p^{r+1}, and R_p=p^rI_p^*. Consequently `1−T_pX+pR_pX²=(1−FX)(1−I_p^*VX)`. The diamond factor I_p^* is essential away from level one. The underlying special-fibre correspondence comes from R14.6; this target transports it through coefficients. Its fibre tests distinguish p+1 lines in the étale situation away from p, one supersingular subgroup scheme, and the connected/étale pair μ_p and Z/p at an ordinary characteristic-p fibre.

*Inputs:* `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`; `ModularCurvesPartII:R14.3`; `ArithmeticGaloisRepresentations:R01.6`; `ModularCurvesPartII:R14.6`.

*Reference:* [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 4.8 and Theorem 4.9, printed pp. 166–167; [Pierre Deligne](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf) — Proposition 3.18(ii), printed p. 158.

**Higher-weight classical existence.** Let f≠0 be an eigenform of weight k≥2 and type (k,ψ), not necessarily cuspidal, over a number field containing its good eigenvalues and character values. For every finite λ construct the continuous semisimple arithmetic representation of G_Q, unramified outside Nℓ, with good polynomial `X²−a_pX+ψ(p)p^{k−1}`. Full good polynomials characterize it up to isomorphism. For cusp forms use the arithmetic dual of the geometric factor; for Eisenstein forms use the two Galois characters supplied by the cusp/Eisenstein decomposition. If eigenforms f,f′ of weights k,k′≥2 and levels N,N′ have a_p=a′_p on a density-one prime set, then k=k′, ψ=ψ′ and all good coefficients agree for p∤NN′; neither eigenform need be cuspidal. The weight-two branch uses a modular abelian quotient; Scholl's higher-weight theorem excludes that branch.

*Inputs:* `R19.1/geometric-construction-and-the-eichler-congruence-relation`; `R19.1/newform-rank-two-realisation`; `ArithmeticGaloisRepresentations:R01.1`; `R19.1/newform-projector-and-coefficient-descent`; `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Theoreme 6.1, printed p. 520; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 6.2, printed p. 521; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — footnote (1) to 3.1, printed p. 513; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Introduction, printed p. 507; [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Higher-coefficient Eichler–Shimura congruence relation:

- `higherCoefficientHeckeAction` (constructor): Pull–push of the imported R14 correspondence on Sym^r coefficients and parabolic cohomology.
- `higherCoefficientHeckeAction_level` (functoriality): Level change intertwines the higher-coefficient action.
- `higherCoefficientEichlerShimura` (relation): T_q=F+I_q^*V, FV=q^{r+1}, R_q=q^r I_q^*.
- `higherCoefficientEichlerShimura_factorisation` (compatibility): 1−T_qX+qR_qX²=(1−FX)(1−I_q^*VX).

Concrete tests for this interface:

- `HeckeCorrespondence.fibre_q1_card_of_char_ne` (computation): For char k(s) ≠ p the fibre of q_1 has p + 1 points (the p + 1 lines of E_s[p] ≅ (Z/p)²).
- `HeckeCorrespondence.fibre_q1_supersingular` (degenerate): Over a supersingular point in characteristic p the fibre is the single point ker F.
- `HeckeCorrespondence.fibre_q1_ordinary` (non-example): Over an ordinary point in characteristic p the fibre has two points: a definition that keeps only ker F is wrong.
- `eichlerShimura_level_one` (compatibility): At level one I_q^*=1 and for r=k−2 the relation is 1−T_q X+q^{r+1}X²=(1−FX)(1−VX). For r=0 (classical weight two) it agrees with the imported R14.6 Eichler–Shimura relation.

### Parabolic structures and integral newform factors

**Parabolic realisations.** Package the image of H¹_c→H¹ with Sym^{k−2} coefficients as M(N,ψ)_!, with Betti conjugation, filtered de Rham and every λ-adic realisation and their comparisons. At an auxiliary fine level M≥3 with N|M and the same excluded prime set, require canonical change-of-level identifications. For each coefficient embedding its rank is twice the dimension of the corresponding ψ-cusp space; its top filtration has the cusp-space dimension. After tensoring over Q with C the top filtration is the product of those cusp spaces over all coefficient embeddings. The twisted Fricke pairing takes values in M_ψ(1−k) and is rationally perfect. Transport the full Hecke action with the DFG ψ⁻¹ convention. Integral/crystalline comparisons are restricted by the excluded set; λ-adic existence is not. The parabolic image excludes Eisenstein boundary classes.

Here k≥2, N≥1 and ψ has conductor dividing N and values in K. The excluded
set is S_N={ℓ:ℓ divides Nk!}, and the fine level satisfies S_M=S_N.
For DFG's action, T_p is the double coset of diag(p,1) multiplied by
ψ(p_p)⁻¹; for p∤N the scalar-p double coset multiplied by ψ(p_p)⁻²
acts by ψ(p_p)⁻¹p^{k−2}. These conventions hold on the entire parabolic
structure, before selecting a newform factor.

*Inputs:* `ModularCurvesPartII:R14.3`; `GeneralizedHeegnerCycles:GH.0`; `mathlib:ModularForm`; `mathlib:CuspForm`.

*Reference:* [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Theorem 2.4, p. 24 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, (28) and Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Proposition 5.6, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.2, Lemma 5.2 and formula (29), pp. 53–54 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.3, p. 12 (arXiv v2).

**Rank-two newform realisation.** For a normalized cusp newform g, take the common kernel of its Hecke ideal in the rational parabolic realisation. It has rank two over the coefficient field. DFG's factor M_g^DFG realizes the conjugate form, with geometric good polynomial `X²−ψ(p)⁻¹a_pX+ψ(p)⁻¹p^{k−1}`. Define our cohomological factor by `M_g=M_g^DFG⊗M_{ψ⁻¹}`; its polynomial becomes `X²−a_pX+ψ(p)p^{k−1}` and its arithmetic dual is the classical Galois representation. Identify the top Hodge line with Kg and show oddness at every λ. Rational irreducibility has its own target in R19.3. For k=2 use the modular abelian quotient, and for k>2 use the Kuga–Sato projector.

The restricted Fricke pairing on M_g^DFG is alternating and perfect, giving
`∧²_K M_g^DFG ≅ M_ψ(1−k)`. After the twist,
`∧²_K M_g ≅ M_{ψ⁻¹}(1−k)`. Thus the arithmetic dual satisfies
`ρ_{g,λ} ≅ M_{g,λ}^DFG(k−1)` and
`det ρ_{g,λ}=ψχ_ℓ^{k−1}`, with ψ interpreted by arithmetic reciprocity.
It is continuous and unramified outside Nℓ, and complex conjugation is
conjugate to diag(1,−1). These rational statements hold at every finite λ.

*Inputs:* `R19.1/parabolic-realisation-premotive`; `R19.1/geometric-construction-and-the-eichler-congruence-relation`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.6`; `R19.1/newform-projector-and-coefficient-descent`.

*Reference:* [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — Lemma 5.7, p. 58 (arXiv v2); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86 (revision of 9 September 2007); [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4(i), p. 2, with 1.0.0, p. 1, and 4.2.2, p. 9; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.5, pp. 59–60, and p. 96 (arXiv v2).

**Integral newform structures.** Over O_K and the localization O_S with S containing primes dividing Nk!, construct finitely generated Betti, filtered de Rham and λ-adic integral modules, comparison maps and the Hecke-ideal kernel. Rationalization gives M_g^DFG and, after the ψ⁻¹ twist, M_g. Identify the top de Rham module with integral q-expansions and identify it with Hom_{O_S}(T,O_S) by f↦(T↦a₁(Tf)). Outside S the stable torsion-free lattices carry Fontaine–Laffaille comparison with 0≤k−1≤ℓ−2. Inside S retain the module, then explicitly take its image/torsion-free quotient when a lattice is required; freeness or integral perfection is not automatic. The normalized coefficient a₁(g)=1 detects whether a scalar multiple is integral.

*Inputs:* `R19.1/parabolic-realisation-premotive`; `R19.1/newform-rank-two-realisation`; `ModularCurvesPartII:R14.3`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

*Reference:* [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, p. 9 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §4.5, Lemma 4.12, p. 51 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.3, Lemma 5.5, p. 56 (arXiv v2); [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §5.4, p. 58 (arXiv v2).

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

The parabolic realisation of weight-k modular forms of level N and character ψ:

- `ParabolicPremotive` (structure): M(N, ψ)_! with Betti realisation M_B (with complex conjugation), de Rham realisation M_dR with Hodge filtration Fil^•, λ-adic realisations M_λ (every finite λ; crystalline comparison only for λ ∉ S_N) and the comparison isomorphisms I_∞, I_λ.
- `ParabolicPremotive.filTopEquivCuspForms` (equivalence): C ⊗_Q Fil^{k−1} M_{!,dR} ≃ S_k(N, ψ)^{I_K}, compatible with q-expansions (Lemma 4.12).
- `ParabolicPremotive.pairing` (data): The duality pairing M(N, ψ)_! ⊗ M(N, ψ)_! → M_ψ(1 − k) of formula (29) in PM_K^S, perfect after tensoring with Q.
- `ParabolicPremotive.heckeAction` (instance): Module structure over the Hecke algebra T, compatible with every realisation and comparison; T_p ↔ [U(p 0; 0 1)U]ψ(p_p)^{−1}.
- `ParabolicPremotive.levelChange` (functoriality): Independence of the auxiliary level M (N | M, S_M = S_N) up to canonical isomorphism (§3.6).

Concrete tests for this interface:

- `ParabolicPremotive.weight_two_trivial_character` (degenerate): For k = 2 and ψ = 1 the λ-adic realisation is H^1_et(X_0(N)_{Q̄}, K_λ).
- `ParabolicPremotive.dim_dR` (computation): dim_K M_{!,dR} = 2 dim S_k(N, ψ); for N = 11, k = 2, ψ = 1 it is 2.
- `ParabolicPremotive.fil_compat_mathlib` (compatibility): The isomorphism with S_k(N, ψ) lands in Mathlib's CuspForm space for Γ_1(N) with character ψ (level and weight agree).
- `ParabolicPremotive.no_eisenstein` (non-example): An Eisenstein series of weight k lies in Fil^{k−1} M_dR but not in Fil^{k−1} M_{!,dR}: the parabolic part excludes the boundary.

The S-integral structure of the premotive of a newform: lattices in every realisation:

- `IntegralPremotive` (structure): An S-integral premotivic structure over O_K: finitely generated integral modules 𝓜_B, 𝓜_dR (over O_S, filtered), 𝓜_λ, the Fontaine–Laffaille objects 𝓜_{λ-crys} (λ ∉ S) and integral comparison isomorphisms.
- `IntegralPremotive.kernel` (constructor): 𝓜[I] for an O_K-submodule I of End 𝓜, the common kernel of generators of I.
- `integralParabolic` (constructor): 𝓜(N, ψ)_{M,!} as an S-integral premotivic structure for S ⊇ S_N^K, with K ⊗ 𝓜(N, ψ)_{M,!} = M(N, ψ)_{M,!}.
- `integralParabolic_filTop` (characterisation): Fil^{k−1}𝓜(N, ψ)_{M,!,dR} = the cusp forms with q-expansion in O_S[[q]].
- `integralParabolic_heckeDuality` (characterisation): f ↦ (T ↦ a₁(Tf)) is an isomorphism Fil^{k−1}𝓜(N, ψ)_{M,!,dR} ≅ Hom_{O_S}(𝕋, O_S).
- `integralNewformPremotive` (constructor): 𝓜_g := 𝓜(N, ψ)_{M,!}[I_g].
- `integralNewformPremotive_rational` (compatibility): K ⊗ 𝓜_g = M_g^{DFG}, and K ⊗ (𝓜_g ⊗ 𝓜_{ψ^{−1}}) = M_g (R19.1/newform-rank-two-realisation).

Concrete tests for this interface:

- `integralNewformPremotive_level_eleven` (computation): For 11a1 (N = 11, k = 2, ψ = 1, S = {2, 11}): Fil¹𝓜_{g,dR} = ℤ[1/22]·f.
- `integralParabolic_bad_set` (non-example): For k=2 the prime 2 lies in S: the chosen Fontaine–Laffaille comparison requires k−1≤ℓ−2 and does not apply at 2. This says nothing against a separate crystalline realisation at a good prime 2.
- `integralNewformPremotive_rational_test` (compatibility): K ⊗ 𝓜_g recovers the rank-two M_g^{DFG} with Fil^{k−1} = Kg; for trivial ψ this is M_g itself.
- `integralParabolic_filTop_scalar` (degenerate): If c ∈ K and cg has q-expansion in O_S[[q]] then c ∈ O_S, since a₁(g) = 1.

### Kuga–Sato and rational newform projectors

**Scholl's projector.** For k>2, r=k−2≥1 and n≥3, use the imported smooth resolved Kuga–Sato fibre power and the action of `Γ_r=((Z/n)²⋊μ₂)^r⋊S_r`. The character ε is trivial on translations, the product of the inversion signs on μ₂^r, and the sign on permutations. Define the rational average `e_ε=|Γ_r|⁻¹Σ_g ε(g)g` on each realisation, prove idempotence and identify its degree-(r+1) image with parabolic H¹(Sym^r). It commutes with Hecke correspondences and fine-level transport. The sign on S_r compensates for graded Künneth signs; dropping it is incorrect. Invert 2n·r! and hence the averaging denominators before asserting integrality. This construction provides cohomological/homological projectors, not an unconditional individual-newform Chow motive.

*Inputs:* `GeneralizedHeegnerCycles:GH.0`; `ModularCurvesPartII:R14.3`.

*Reference:* [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — §1.0–1.3, Theorems 1.2.1 and 1.2.4, author-copy pp. 1–3; [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — §4.1, 4.1.1–4.1.4, p. 8.

**Rational orbit projector and coefficient descent.** In the semisimple rational new Hecke quotient form the central idempotent e_[f] for the Galois orbit of f. Its image on Betti, de Rham and λ-adic realisations has rank two over K_f; extension along an embedding σ:K_f→L identifies the σ(f) eigenspace. Construct the K_f-action on the factor itself: traces in K_f alone do not constitute coefficient descent. With Scholl's transposed Hecke action recover the cohomological trace a_p, and with the other action apply the DFG conjugate-form correction. Compare Betti ± lines with the existing modular-symbol period lines. Intersect with the fixed integral module and state any saturation/torsion-freeness requirements. The full old Hecke algebra is not the semisimple new quotient used to select e_[f].

*Inputs:* `R19.1/scholl-projector`; `R19.1/parabolic-realisation-premotive`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `ModularCurvesPartII:R14.3`; `ModularCurvesPartII:R14.5/modular-quotient`; `ModularCurvesPartII:R14.5/modular-quotient-dimension`.

*Reference:* [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4 and Remark 1.2.6, pp. 2–3; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Exercise 1.18, p. 30.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Scholl’s symmetric-power projector:

- `schollProjector` (constructor): The ε-idempotent acting on all imported realisations.
- `schollProjector_idempotent` (relation): e_ε²=e_ε.
- `schollProjector_parabolic` (equivalence): Its degree-(r+1) image is parabolic H¹(Sym^r R¹f_*).
- `schollProjector_hecke` (compatibility): It intertwines the geometric Hecke action.
- `schollProjector_level` (functoriality): Transport through fine-level change commutes with the projector.

Concrete tests for this interface:

- `schollProjector_weight_three` (computation): r=1: translations act trivially and inversion acts by −1 on H¹ of the elliptic fibre.
- `schollProjector_transposition` (non-example): r=2: omitting sign(S₂) changes the graded Künneth action and fails to recover Sym².
- `schollProjector_denominators` (computation): For n=3,r=2, |Γ_r|=(2·3²)²·2!=648; the averaging projector is rational, not an integral operator at 2 or 3.
- `schollProjector_boundary` (compatibility): The ε-part of the cohomology of the smooth compactification is the parabolic image, not the cohomology of the open curve; the ε-part of compactly supported cohomology of the open fibre power is H¹_c, which is larger.

Newform projector and coefficient-field descent:

- `newformOrbitProjector` (constructor): The central idempotent e_[f] of the rational new Hecke algebra.
- `newformOrbitProjector_idempotent` (relation): e_[f]²=e_[f] and θ_f(e_[f])=1.
- `newformFactor` (data): The K_f-linear image on every realisation.
- `newformFactor_baseChange` (functoriality): Extension along σ:K_f→L identifies the factor with the σ(f)-eigenspace.
- `newformFactor_rank` (characterisation): Its K_f-dimension is two.
- `newformFactor_periodLines` (compatibility): The Betti ± lines and modular-symbol rational structure agree with the imported period lines.
- `newformFactor_lattice` (constructor): Intersect with the imported integral module and retain torsion-freeness and saturation hypotheses explicitly.

Concrete tests for this interface:

- `newformFactor_level23` (computation): The degree-two coefficient field gives rational dimension four, not two.
- `newformFactor_delta` (computation): For Δ the factor has rank two over Q and is realised in degree eleven Kuga–Sato cohomology.
- `newformFactor_orbit` (non-example): Before scalar extension a single embedding of Q(√5) cannot replace the rational Galois-orbit factor.
- `newformFactor_periodScaling` (characterisation): Changing a generator of a period line by a K_f-unit preserves the line; an unspecified lattice cannot select a numerical period.
- `newformFactor_oldNilpotents` (non-example): The old Hecke algebra of 11a1 at level 88 (the case N = 88, p = 2 of Darmon–Diamond–Taylor Exercise 1.18) has nilpotents and is not the semisimple rational new quotient used by this projector.

### Residual eigensystems and sparse weight-one coefficients

**Residual eigensystems before characteristic-zero eigenforms.** For k≥1, start with a nonzero mod-λ eigenform arising from an integral form and eigenvalues away from Nℓ. A characteristic-zero simultaneous eigenvector is not assumed. Weight shifting and the finite-free commuting-Hecke lifting lemma give a continuous semisimple rank-two representation, unramified outside Nℓ, with the reduced good characteristic polynomials. Descend it to the finite field generated by the eigenvalues and character values. Keep the general reduction-image/integrality argument when ℓ divides the level or the form is noncuspidal; the prime-to-level cuspidal subset of R15.5 alone is insufficient. Uniqueness retains determinants in characteristic two.

*Inputs:* `R19.1/lambda-adic-representation-of-a-weight-k-eigenform`; `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`; `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `AlgebraicModularFormsAndSerreWeights:R15.5`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Théorème 6.7, printed pp. 521–522; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 6.9, printed p. 522; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 6.13 and its proof, printed p. 523.

**Rankin's prime estimate.** For a cuspidal eigenform of weight k≥1 and real s>k, prove `Σ_{p∤N}|a_p|²p^{-s} ≤ log(1/(s−k))+O(1)` as s decreases to k. Import the Rankin–Selberg continuation and pole statement, and reduce away-from-level eigensystems to newforms. The output is an upper estimate, not an equality deduced without Ramanujan–Petersson. At weight one it will rule out a two-character cuspidal representation, whose prime sum has leading coefficient two.

*Inputs:* `AutomorphicLFunctionsAndLocalFactors:AL.3`; `tauceti:TauCeti.LSeries.landau`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — §5, Proposition 5.1, printed p. 518; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Démonstration 5.2, printed p. 519.

**Finite eigenvalue sets off sparse primes.** For a weight-one cuspidal eigenform, first obtain algebraic-integral good eigenvalues in one Galois coefficient field from the weight-one lattice and its conjugate eigensystems. For every η>0 construct a prime set X_η of upper Dirichlet density at most η and a finite set Y_η of possible a_p for p∉X_η. Apply the Rankin estimate to every conjugate, and then finiteness of algebraic integers bounded at every embedding. These inputs precede the Artin representation; its finite image is not available as a proof of this statement.

*Inputs:* `R19.1/rankin-bound-for-a-cuspidal-eigenform`; `mathlib:NumberField.Embeddings.finite_of_norm_le`; `tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization`; `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`; `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 5.5, printed pp. 519–520; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 5.6, printed p. 520.

### Finite semisimple images and prime-to-order lifting

**Deligne–Serre Condition C.** For a finite subgroup G of GL₂(F_ℓ), define C(η,M) by the existence of H⊆G with |H|≥(1−η)|G| and at most M polynomials det(1−hT), h∈H. Define semisimplicity of G by semisimplicity of its identity action on F_ℓ²: each invariant line has an invariant complement. Condition C is monotone in η and M, and restriction to an index-two subgroup gives C(2η,M). Count invertible two-by-two matrices with a fixed monic quadratic of nonzero constant term: the fibre cardinalities are ℓ²+ℓ, ℓ² and ℓ²−ℓ when there are two, one or no distinct roots over F_ℓ. The later order bound assumes η<1/2; that inequality is not part of the definition.

*Inputs:* `mathlib:Matrix.card_GL_field`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 7.1, printed p. 523.

**Bounded finite semisimple images.** For each η<1/2 and M, find a bound A(η,M) independent of ℓ for |G| whenever the identity action of G⊆GL₂(F_ℓ) is semisimple and satisfies C(η,M). Use the characteristic-polynomial fibres and Dickson's alternatives: a subgroup containing SL₂, a Cartan, a Cartan normalizer, or an exceptional projective image A₄, S₄ or A₅. Include diagonalizable reducible subgroups. The index-two restriction changes η to 2η in the normalizer argument; handle the inequalities with that loss. The exceptional projective orders are at most 60, while scalar fibres still need the Condition C bound.

*Inputs:* `R19.1/deligne-serre-condition-c`; `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`; `ArithmeticGaloisRepresentations:R01.4`; `mathlib:Matrix.card_GL_field`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 7.2 and its proof, printed p. 524; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Proposition 7.2, case (d), printed p. 524.

**A bound uniform in splitting coefficient primes.** Fix a weight-one cuspidal eigensystem and a Galois number field K containing its coefficients. For the infinitely many rational ℓ splitting completely in K, the residual coefficient field is F_ℓ. Use Chebotarev and the sparse-prime result to give its residual image C(η,M) with a single M independent of ℓ; count the finite set of Frobenius polynomials before reduction. The finite set of excluded primes Nℓ does not affect the density comparison. The finite-group bound then gives one A for every such residual image.

*Inputs:* `R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`; `R19.1/weight-one-eigenvalues-outside-a-sparse-set`; `R19.1/deligne-serre-condition-c`; `R19.1/bounded-semisimple-subgroups-of-gl2`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`; `tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.2, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 8.3 and its proof, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Lemme 8.4, printed p. 525.

**Prime-to-residue-characteristic lifting.** Let O be a complete DVR with finite residue field κ of characteristic ℓ, Γ a finite group with ℓ∤|Γ|, and r:Γ→GL_n(κ). Construct a lift Γ→GL_n(O), retaining faithfulness when r is faithful. Apply Schur–Zassenhaus to successive additive congruence kernels and choose compatible lifts through the finite inverse system; O-completeness identifies the limit. This is a lifting theorem for a specified finite group, not a reconstruction theorem for an arbitrary Galois pseudorepresentation. The prime-to-order hypothesis is substantive: for ℓ≥5 an order-ℓ unipotent in GL₂(F_ℓ) cannot lift as an order-ℓ element of GL₂(Z_ℓ).

*Inputs:* `mathlib:Subgroup.exists_right_complement'_of_coprime`; `mathlib:nonempty_sections_of_finite_inverse_system`; `ArithmeticGaloisRepresentations:R01.1`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.6, printed p. 526.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

The condition C(η, M) on a subgroup of GL₂(F_ℓ), and semisimple subgroups (Deligne–Serre 7.1):

- `ConditionC` (data): ConditionC ℓ G η M : Prop, for G : Subgroup (GL (Fin 2) (ZMod ℓ)), η : ℝ and M : ℕ.
- `IsSemisimpleSubgroup` (data): Every G-stable submodule of F_ℓ² has a G-stable complement.
- `ConditionC.mono` (relation): C(η, M) implies C(η′, M′) whenever η ≤ η′ and M ≤ M′.
- `ConditionC.of_index_two` (compatibility): If G′ ≤ G has index 2 and G satisfies C(η, M), then G′ satisfies C(2η, M): H ∩ G′ has at least (1 − η)|G| − |G|/2 = (1 − 2η)|G′| elements (Deligne–Serre 7.2, case (c)).
- `card_charpoly_fibre` (characterisation): For a monic quadratic Q=X²−tX+d over F_ℓ with d≠0, the number of elements of GL₂(F_ℓ) of characteristic polynomial Q is ℓ²+ℓ, ℓ² or ℓ²−ℓ according as Q has 2, 1 or 0 distinct roots in F_ℓ. No assertion is made for other polynomials or d=0.

Concrete tests for this interface:

- `conditionC_top` (computation): GL₂(F_ℓ) satisfies C(0, ℓ(ℓ − 1)) and not C(0, M) for M < ℓ(ℓ − 1): its elements have exactly the ℓ(ℓ − 1) characteristic polynomials T² − tT + d with d ≠ 0.
- `not_conditionC_zero` (degenerate): For η < 1 no subgroup satisfies C(η, 0): H would have no polynomials, so H = ∅ and 0 ≥ (1 − η)|G| > 0.
- `not_conditionC_cyclic_five` (non-example): The subgroup of GL₂(F₅) generated by diag(2, 1) has order 4 and four characteristic polynomials (T − 2ⁱ)(T − 1), so it fails C(0, 3); it satisfies C(1/4, 3).
- `conditionC_split_cartan_three` (non-example): The split Cartan subgroup of GL₂(F₃), also of order 4, satisfies C(0, 3): diag(1, 2) and diag(2, 1) share a characteristic polynomial. A definition that counted elements instead of polynomials would treat it like the cyclic group of order 4 above.
- `card_charpoly_fibre_three` (compatibility): For ℓ = 3 the fibres have sizes 12, 9 and 6, over 1, 2 and 3 polynomials, and 1·12 + 2·9 + 3·6 = 48 = |GL₂(F₃)| agrees with Mathlib's Matrix.card_GL_field.

### The finite-image Artin construction

**A characteristic-zero weight-one lift.** Enlarge K to contain roots of unity of orders at most A. Uniform image bounds imply a finite common list of possible Frobenius polynomials; discard the finite set of coefficient primes at which two distinct list members collide after reduction. Infinitely many residual congruences then force every good characteristic-zero polynomial onto that list. Lift one residual finite image at ℓ>A by the prime-to-order theorem and compare another coefficient prime to remove ramification at the first ℓ. Realize the resulting finite representation over algebraic numbers and then C. This procedure does not use a topological embedding Q_ℓ→C.

*Inputs:* `R19.1/uniformly-bounded-residual-images-in-weight-one`; `R19.1/lifting-representations-of-groups-of-order-prime-to-l`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.5, printed p. 525; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.6, printed p. 526.

**Weight-one cuspidal irreducibility.** A reducible finite-image two-dimensional representation is a sum of two finite-order characters. The odd determinant makes them distinct. Euler logarithms, the bounded higher-prime-power remainder, nonvanishing of nontrivial character L-values at 1 and the zeta residue then give the coefficient-two prime estimate. It contradicts Rankin's coefficient-one bound for a cusp form. This proves irreducibility of the characteristic-zero lift; the reverse direction for an Eisenstein eigensystem belongs to the Artin identification.

*Inputs:* `R19.1/rankin-bound-for-a-cuspidal-eigenform`; `R19.1/weight-one-characteristic-zero-lift`; `mathlib:DirichletCharacter.LFunction_apply_one_ne_zero`; `mathlib:riemannZeta_residue_one`; `tauceti:TauCetiRoadmap/Chebotarev#layer-3-prime-sums-and-density-normalization`; `tauceti:TauCetiRoadmap/ArithmeticDirichletSeries#layer-3-local-factors-and-euler-products`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.7, printed p. 526; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — 8.7, printed p. 527.

**The weight-one Artin representation.** For a nonzero weight-one eigensystem of odd nebentypus ψ, combine the cuspidal lift with the Eisenstein character sum to attach a semisimple finite-image representation over C, unramified outside N, whose good trace is a_p and determinant is ψ(p). It is unique up to isomorphism and irreducible exactly for a cusp form. Complex conjugation has eigenvalues 1 and −1; all Frobenius eigenvalues are roots of unity, so |a_p|≤2. The cusp form η(z)η(23z) gives the dihedral S₃ example. Weight-one lattices and conjugate eigensystems are inputs, not consequences of this representation.

*Inputs:* `R19.1/lambda-adic-representation-of-a-weight-k-eigenform`; `AlgebraicModularFormsAndSerreWeights:R15.5`; `R19.1/weight-one-characteristic-zero-lift`; `R19.1/weight-one-cuspidal-irreducibility`; `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

*Reference:* [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Theoreme 4.1, printed pp. 513-514; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Corollaire 4.2, printed p. 514; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — Remarque 6.5, printed p. 521; [Pierre Deligne and Jean-Pierre Serre](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf) — section 8, opening and 8.1, printed p. 525.

## R19.2 — Hilbert representations and arithmetic identifications

### The unrestricted constructor and its conventions

**The unrestricted Hilbert constructor.** For every π of type (k,w) as fixed above, construct a continuous semisimple ρ_{π,λ} over a sufficiently large E_λ for every finite λ, unramified outside S_π and ℓ, with good geometric polynomial P_v. No finite discrete-series place is required when d is even. In the geometric branch twist Carayol's representation; in the other branch use auxiliary μ_s-new congruences modulo λ^s and compatible trace/determinant reconstruction. The auxiliary prime can vary with s and imposes no hypothesis on π. Prove independence of construction, extension/conjugation of coefficients, twist compatibility and agreement with the classical M_f. Good polynomials characterize the semisimple representation, while minimal descent to Q(π)_λ is a separate assertion not made here.

*Inputs:* `R19.2/carayol-theorem-b`; `R19.2/carayol-twisting-and-determinant`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

*Reference:* [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Proof of Theorem 4.3, p. 544; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242, after equation (1); [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410.

**The representation dictionary as a theorem.** Prove all identities in the convention table, the inverse-uniformiser eigenvalue conversion, the determinant/twist formulas, the labelled Hodge degrees and the classical specialization. The essential local identity is the duality relation for GL₂ between π_v and its central-character inverse twist. Apply the de Rham algebraic-Hecke-character comparison when transporting this identity at v|ℓ. The L-factor and conductor translations apply at every place where local–global compatibility has been established. Test both a norm twist of a weight-two form and a nonquadratic nebentypus; otherwise inverse/dual errors can accidentally cancel.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/carayol-theorem-b`; `R19.2/carayol-twisting-and-determinant`; `R19.1/newform-rank-two-realisation`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.4–0.5, printed pp. 409–410; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 255; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9; (3.1′), p. 30; (3.2)–(3.3), pp. 38–39; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §1.2, p. 5; §7, pp. 59–60; §9.1.1, p. 80 (authors' final version); [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1, pp. 44–45.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Galois representation of every cohomological Hilbert eigenform:

- `hilbertGaloisRep` (constructor): The continuous semisimple ρ_{π,λ}: G_F → GL₂(E_λ) attached to π of infinity type (k,w) and λ.
- `hilbertGaloisRep_charpoly` (characterisation): For v ∉ S_π, v ∤ ℓ: charpoly ρ_{π,λ}(Frob_v^{geom}) = X² − t_vX + q_vs_v, with t_v, s_v the eigenvalues of T_v and S_v defined by ϖ_v.
- `hilbertGaloisRep_det` (relation): det ρ_{π,λ} = χ_{π,λ}·ε_ℓ^{−1}, where χ_{π,λ} is the λ-adic character of the central character and ε_ℓ the cyclotomic character.
- `hilbertGaloisRep_twist` (functoriality): For an algebraic Hecke character χ of F: ρ_{π⊗(χ∘det),λ} ≅ ρ_{π,λ} ⊗ χ_λ; in particular ρ_{π⊗|det|^{−1},λ} ≅ ρ_{π,λ} ⊗ ε_ℓ^{−1}, and π ⊗ |det|^{−1} has infinity type (k, w+2).
- `hilbertGaloisRep_carayol` (compatibility): Carayol's σ_λ(π) ≅ ρ_{π,λ} ⊗ χ_{π,λ}^{−1} ≅ ρ_{π^∨,λ} (R19.2/hilbert-normalisation-dictionary).
- `hilbertGaloisRep_arithmeticDual` (compatibility): ρ_{π,λ}^∨ has characteristic polynomial X² − t_vX + q_vs_v at an arithmetic Frobenius, and ρ_{π,λ}^∨ ≅ σ_λ(π) ⊗ ε_ℓ.
- `hilbertGaloisRep_unique` (extensionality): Two continuous semisimple representations with the polynomials X² − t_vX + q_vs_v at a set of places of density one are isomorphic.
- `hilbertGaloisRep_coefficients` (functoriality): Extension of E and conjugation: for σ ∈ Aut(C), ρ_{π^σ,σ(λ)} is the σ-conjugate of ρ_{π,λ}.
- `hilbertGaloisRep_auxiliaryCongruence` (data): In the congruence branch, compatible traces and determinants modulo λ^s on μ_s-new Hecke quotients.
- `hilbertGaloisRep_classical` (compatibility): For F = Q and a newform f of weight k, the automorphic representation π_f of infinity type (k, k−2) has ρ_{π_f,λ} ≅ M_{f,λ}, the cohomological realisation of R19.1/newform-rank-two-realisation.

Concrete tests for this interface:

- `hilbertGaloisRep_ellipticCurve` (computation): F = Q, E = 11a1 with its unitary π_E of infinity type (2,0): t_3 = a_3 = −1, s_3 = 1, so the geometric Frobenius polynomial at 3 is X² + X + 3, that of H¹_ét(E_Q̄, Q_ℓ).
- `hilbertGaloisRep_delta` (computation): F = Q, π_Δ of infinity type (12,10): t_2 = τ(2) = −24, s_2 = 2^{10}, polynomial X² + 24X + 2048.
- `hilbertGaloisRep_normTwist` (characterisation): Replacing π by π ⊗ |det|^{−1} replaces (t_v, s_v) by (q_vt_v, q_v²s_v) and the polynomial by X² − q_vt_vX + q_v³s_v, whose roots are q_v times the old roots: the twist by ε_ℓ^{−1}.
- `hilbertGaloisRep_inverseUniformiser` (non-example): The polynomial X² − τ_vX + q_vρ_v built from Saito's inverse-uniformiser eigenvalues τ_v = t_v/s_v, ρ_v = s_v^{−1} is that of σ_λ(π), not of ρ_{π,λ}: for π_E ⊗ |det|^{−1} at p = 3 the two polynomials are X² + 3X + 27 and X² + X/3 + 1/3.
- `hilbertGaloisRep_branches` (compatibility): For π with a finite discrete-series place, the congruence branch and Carayol's branch give isomorphic representations.
- `hilbertGaloisRep_parity` (non-example): A multiweight with k_τ ≢ w mod 2 for some τ is not an infinity type (k,w) and is not covered.

### The geometric Hilbert branch

**The quaternionic multiplicity space.** Choose B/F split at one real place τ₁ and ramified at all the others, and split at every finite place except for one finite discrete-series place when d is even. Choose a finite Galois E/Q containing F and the coefficients of π and splitting B. Form the coefficient representation `⊗_τ det^{(w−k_τ+2)/2}Sym^{k_τ−2}`, of dimension ∏_τ(k_τ−1), whose center acts by the norm to the power w, and its lisse sheaf. Extract σ_λ as Hom from the finite automorphic factor to H¹ of the Shimura curve. Matsushima–Shimura multiplicity gives dimension two. Prove compatibility with level change and the direct-limit decomposition into π_f⊗σ_λ. If F=Q, take the parabolic image rather than all H¹; the boundary cannot be absorbed into a cuspidal multiplicity space.

*Inputs:* `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.3, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.2.4, p. 420; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 2.3, p. 421.

**Twisting and the exact determinant.** Twisting π by a character with component t↦t^{-u} on the positive real scalars changes w to w+2u. Carayol's multiplicity space changes contravariantly by that character's inverse. Establish `det σ_λ=χ_{π,λ}⁻¹ε_ℓ⁻¹`. A calculation of the square of the determinant leaves a quadratic ambiguity; remove it using the source's global comparison, rather than claiming the squared identity already proves the determinant formula.

*Inputs:* `R19.2/carayol-sigma-lambda-construction`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 3.3, Proposition, p. 422; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.5, pp. 428–429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.6.1, p. 429.

**Carayol's geometric Hilbert theorem.** For π of type (k,w), require additionally a finite essentially square-integrable place if d is even. After enlarging the coefficient field construct Carayol's σ_λ system with the Hecke-correspondence local representation at every finite v of residue characteristic different from λ. The auxiliary-place and extraordinary-place exclusions of Theorem B are removed by base change and the primitive-restriction argument; the even-degree existence hypothesis is retained. Translate σ_λ to ρ_{π,λ} by the dictionary. This geometric theorem is distinct from the unrestricted Hilbert construction above.

*Inputs:* `HilbertModularVarietiesAndShimuraCurves:R18.4`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `R19.1/newform-rank-two-realisation`; `R19.2/carayol-theorem-b`; `R19.2/carayol-primitive-restriction-lemma`; `R19.2/carayol-cubic-base-change-of-extraordinary`; `R19.2/carayol-twisting-and-determinant`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; `ArithmeticGaloisRepresentations:R01.1`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.3 and Theoreme (A), printed pp. 409–411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theoreme (B), printed p. 411; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.11, printed p. 412; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.1, pp. 458–459; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.3.2, p. 459.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Carayol's construction of σ_λ(π) from the cohomology of Shimura curves (§2):

- `Carayol.sigmaLambda` (constructor): σ_λ(π) = Hom_{H(G(𝔸^f),K)}(π_f^K, H¹(M_K ⊗ F̄, F_λ)) for π ∈ C.
- `Carayol.sigmaLambda_finrank` (characterisation): dim_{E_λ} σ_λ(π) = 2.
- `Carayol.sigmaLambda_level_indep` (characterisation): σ_λ(π) does not depend on K with π_f^K ≠ 0.
- `Carayol.cohomology_decomposition` (relation): lim_K H¹(M_K ⊗ F̄, F_λ) ⊗ Ē_λ ≅ ⊕_{π∈C} π^f ⊗ σ(π) as G(𝔸^f) × Gal(F̄/F)-modules.

Concrete tests for this interface:

- `Carayol.sigmaLambda_finrank_two` (computation): For every π ∈ C, σ_λ(π) has dimension 2.
- `Carayol.coefficient_rank` (computation): dim_E W = ∏_i (k_i − 1); with all k_i = 2 it is 1.
- `Carayol.parabolic_needed_over_Q` (non-example): For F = ℚ, using the full H¹ of the open modular curve adds Eisenstein classes, so σ(π) must be taken in parabolic cohomology.

### Bad reduction and local geometric multiplicities

Throughout these geometric local arguments, the finite place v has residue
characteristic different from λ and differs from the auxiliary quaternionic
ramification place v₀ when that place is present. Theorem A removes the
v₀ exclusion by its separate base-change argument.

**Vanishing-cycle filtration.** At the bad place, identify the two-step filtration of σ_λ furnished by vanishing cycles and the further decomposition of its first piece into supersingular and normalized-curve contributions. If the normalized contribution σ̃₁ is nonzero, π_v is principal series. If dim σ̃₁=2, then σ_v=σ̃₁ and it is the full local parameter. At a smooth unramified place the multiplicity is already the two-dimensional normalized cohomology. Import bad-reduction models and equivariant vanishing cycles, and retain the distinction between these geometrically defined pieces and residual characters. The weight-two exception in the cohomological argument must be retained.

*Inputs:* `R19.2/carayol-sigma-lambda-construction`; `R19.2/carayol-twisting-and-determinant`; `HilbertModularVarietiesAndShimuraCurves:R18.2`; `LefschetzPencilsAndVanishingCycles:LPV.0`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 5.6, p. 429; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, p. 449.

**Special local components.** If π_v=χ·Sp, identify the parameter as the indecomposable special representation with characters χ⁻¹ and χ⁻¹ε_ℓ⁻¹ in Carayol's convention. The normalized contribution is zero and the supersingular piece supplies the kernel line. Picard–Lefschetz makes N nonzero, with image the kernel of pullback from special-fibre H¹ to the H¹ of its normalization. The target is this kernel, not the opposite cokernel. Semisimplifying the two characters would erase the extension and give an incorrect special parameter.

*Inputs:* `R19.2/carayol-vanishing-cycle-filtration`; `R19.2/carayol-twisting-and-determinant`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `LefschetzPencilsAndVanishingCycles:LPV.7:semistable-curves`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Proposition, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 6.7, Remarque, p. 432; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.4, Proposition, p. 451.

**The local fundamental representation.** The vanishing-cycle quotient σ₂ is nonzero if and only if π_v is essentially discrete series. Identify π_v⊗σ₂ with the π̄_v^∨-isotypic part of the representation U of the product of the local Weil group, GL₂(F_v) and the division-quaternion group. U comes from the Drinfeld/supersingular geometry of R18.5. This identifies the local Galois parameter independently of the global eigenform and supplies the cuspidal part of the geometric proof.

*Inputs:* `R19.2/carayol-vanishing-cycle-filtration`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `HilbertModularVarietiesAndShimuraCurves:R18.5`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 10.6, Proposition, pp. 448–449.

**Ordinary cuspidal local components.** Here “ordinary cuspidal” means the dihedral local representation, not p-ordinary. For the quadratic local extension L and character ξ, identify Carayol's parameter with `Ind ξ⁻¹|·|⁻¹/²`. Globalize it by quadratic automorphic induction with the necessary prescribed local component and nonsplit auxiliary place, then compare global representations. This step imports the induction and globalization theorem; it does not construct a second induction functor.

*Inputs:* `R19.2/carayol-local-fundamental-representation`; `R19.2/carayol-vanishing-cycle-filtration`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `R19.2/carayol-special-places`; `ArithmeticGaloisRepresentations:R01.1`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

**Carayol's Theorem B.** For the fixed geometric construction and auxiliary discrete-series place v₀, identify σ_λ|W_v at every v≠v₀ away from λ except the extraordinary cuspidal case. Combine normalized cohomology for principal series, the special monodromy argument and the ordinary-cuspidal globalization. Both exclusions belong to the conclusion of this intermediate theorem and are discharged by the subsequent comparison steps.

*Inputs:* `R19.2/carayol-vanishing-cycle-filtration`; `R19.2/carayol-special-places`; `R19.2/carayol-local-fundamental-representation`; `R19.2/carayol-ordinary-cuspidal-places`; `R19.2/carayol-twisting-and-determinant`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.1, pp. 449–450; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 11.3, p. 450.

### Primitive restriction and cubic base change

**Primitive two-dimensional restriction.** For the extraordinary dyadic local case, the finite projective image is A₄ or S₄. A local Galois quotient is solvable, so A₅ does not occur here. Restrict to the cubic extension fixed by a 2-Sylow subgroup: it is normal in the A₄ case and can be nonnormal in the S₄ case. The restricted representation is irreducible and monomial. Prove that matching restrictions together with matching determinants identify the original representations. The determinant condition is indispensable to this recognition.

*Inputs:* `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.1.3, p. 456.

**The extraordinary cubic step.** Carry out base change along the chosen degree-at-most-three extension and compare the resulting local parameter with restriction of the Galois representation. Use cyclic base change in the normal case and the separate nonnormal cubic theorem in the other case. At the chosen place the transferred principal/special/ordinary-cuspidal parameter must agree with restriction, not merely at almost all places. Globalize the primitive local representation using the tetrahedral/octahedral inputs, apply Theorem B upstairs and descend with the preceding restriction lemma. This also provides the final comparison at the auxiliary place.

The local statement applies to every extension L/F_v of degree at most three
and every extraordinary cuspidal π_v: its base-change lift corresponds to
the irreducible restriction of its Weil representation to W_L. The comparison
also holds in the Hecke normalization.

*Inputs:* `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/nonnormal-cubic-base-change`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.2, Proposition, p. 457; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 12.2.3, p. 458.

### Hodge–Tate degrees and global arithmetic properties

**Hilbert Hodge–Tate property.** At v|ℓ all unrestricted Hilbert representations have exactly the two labelled degrees specified above. When d is odd, there is a finite discrete-series place, some k_τ>2, or π is CM, obtain de Rham comparison from geometric cohomology up to an algebraic character twist, or from the induced CM character. In the remaining even-degree, parallel-weight-two, everywhere-principal-series, non-CM case, make a totally real abelian base change and a twist to w=0. Its symmetric-square realization comes from a unitary Shimura variety for GU(Φ), over a CM field E=FE₀ with E₀ imaginary quadratic and ℓ split, with signature (2,1) at the distinguished archimedean place and (3,0) at the others. At the chosen good place the symmetric square is crystalline with degrees 0,1,2; lifting along GL₂→GL₂/{±1} gives a crystalline rank-two representation, with the original a possibly nontrivial quadratic twist. Hodge degrees survive this twist. Identification of its WD parameter with π_v requires the full coefficient-prime theorem, not just the symmetric-square argument.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/carayol-sigma-lambda-construction`; `PadicHodgeTheory:R06.5`; `PadicHodgeTheory:R06.2`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`; `AutomorphicGaloisRepresentationsPartII:AG2.1`; `AutomorphicGaloisRepresentationsPartII:AG2.2`; `ArithmeticGaloisRepresentations:R01.1`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

*Reference:* [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, p. 252.

**Determinant, total oddness and absolute irreducibility.** For the unrestricted ρ_{π,λ}, prove determinant χ_{π,λ}ε_ℓ⁻¹, determinant −1 at complex conjugation at each real place, and absolute irreducibility. Use the exact determinant comparison to remove quadratic ambiguity. If a global decomposition existed, Hodge–Tate characters would be algebraic Hecke characters and the source's L-function pole argument would contradict cuspidality. Prove uniqueness from good Frobenius polynomials and identify totally real solvable cuspidal base change with restriction. Absolute irreducibility of the global representation does not rule out a reducible ordinary local restriction, nor does it imply residual irreducibility.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/carayol-twisting-and-determinant`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/hilbert-hodge-tate-property`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `AutomorphicLFunctionsAndLocalFactors:AL.3`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`; `PotentialModularityAndCompatibleSystems:R24.5/character-system`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — §§3.1–3.3, printed pp. 421–422; §5.5, printed pp. 428–429; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — §2, p. 9 of the arXiv version.

### CM and strong irreducibility

**The CM predicate.** On an existing regular Hilbert eigensystem define CM by π_f=AI_L^F(α), for a totally imaginary quadratic L/F and the matching infinity type. The infinity exponents of α are half-integral; the algebraic character is α′=α|·|_L⁻¹/². Its λ-adic induction is our ρ, and α′_λ must differ from its conjugate to give cuspidality and irreducibility. Carayol's inducing character is `(α⁻¹|·|_L⁻¹/²)_λ`; the arithmetic dual uses `(α′_λ)⁻¹`. Supply the inducing field, split/inert trace formulas and compatibility with twists and coefficient extension. The regular k_τ≥2 definition does not silently include the different finite-order weight-one case.

At a complex embedding above τ, the prescribed component of α is
`z^{(k_τ−1−w)/2} z̄^{(−k_τ+1−w)/2}`, or its conjugate. Twisting by
`|·|_L⁻¹/²` makes both exponents integral because k_τ≡w modulo 2.

*Inputs:* `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `R19.2/all-cohomological-hilbert-representation`; `ArithmeticGaloisRepresentations:R01.5`; `R19.2/hilbert-normalisation-dictionary`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

*Reference:* [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, p. 66, CM definition; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Introduction, p. 2, Remarks (i)–(ii).

**Virtual reducibility characterizes CM.** Suppose the regular, absolutely irreducible attached rank-two representation becomes reducible on an open subgroup. Compact semisimple Clifford theory and the infinite projective image forced by distinct labelled Hodge–Tate degrees give induction from a character of a quadratic extension. The algebraic character and archimedean parameter force that extension to be totally imaginary. Thus f is CM, and a non-CM regular form remains irreducible on every open subgroup. The infinite-projective-image condition and regular weight exclude the exceptional finite-image possibilities; the CM-field conclusion is not asserted for weight-one dihedral forms.

*Inputs:* `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; `R19.2/cm-hilbert-eigenform`; `ArithmeticGaloisRepresentations:R01.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `R19.2/hilbert-hodge-tate-property`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`; `PotentialModularityAndCompatibleSystems:R24.5/character-system`.

*Reference:* [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf) — Theorem 2.3 and proof, printed pp. 251–252; [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf) — Remark (ii), p. 2; [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — §9.1, Lemma 9.1, p. 66, with its proof on p. 67.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

CM Hilbert eigenform:

- `IsCMHilbert` (characterisation): Existence of L/F and α with π_f=AI(α) and the matching induced Galois representation.
- `IsCMHilbert.inducingField` (data): A CM quadratic inducing extension, recorded with its embedding and nontrivial automorphism.
- `IsCMHilbert.trace_inert` (simp): Trace is zero at unramified primes inert in L.
- `IsCMHilbert.trace_split` (simp): At a split prime the trace is α′_λ(Frob_w)+(α′_λ)^c(Frob_w), for geometric Frobenius elements.
- `IsCMHilbert.twist` (functoriality): A compatible algebraic character twist preserves CM, with inducing character multiplied by its restriction.
- `IsCMHilbert.coefficientExtension` (compatibility): CM is invariant under extending the coefficient field.

Concrete tests for this interface:

- `IsCMHilbert_Qi` (computation): The weight-two form of y²=x³−x, conductor 32, is induced from Q(i); unramified primes 3 mod 4 have trace zero.
- `IsCMHilbert_twist` (characterisation): A finite-order character twist of this form has the same quadratic inducing field.
- `IsCMHilbert_delta` (non-example): The level-one form Δ has no CM quadratic self-twist.
- `IsCMHilbert_splitTrace` (computation): A split Frobenius acts diagonally by α′_λ and (α′_λ)^c; determinant is their product, whereas an inert Frobenius has trace zero.
- `IsCMHilbert_halfIntegralShift` (computation): For y²=x³−x and 5=(2+i)(2−i): a_5=−2, and the values of α′_λ at the two geometric Frobenius elements above 5 are −1±2i, of absolute value 5^{1/2} and sum −2; the values of α or of α|·|_L^{−1} there have absolute value 1 or 5.

### Nearly ordinary representations and CM lines

**The nearly ordinary Hilbert construction.** Let p be odd, F totally real of even degree, U⊆GL₂(O_F⊗Ẑ) open compact, n the product of its nonmaximal primes, and π nearly ordinary of parallel κ≥2 with Hecke eigencharacter λ. Attach Skinner–Wiles's continuous irreducible arithmetic representation. It is odd, unramified away from np, with trace λ(T(v)) and determinant Nv·λ(S(v)) at good arithmetic Frobenius, and determinant λ(S_x)ε_p(x) for central x∈Z(U). At each v|p its upper-triangular quotient character ψ₂ has ψ₂(y)=λ(T_y) on local units and ψ₂(ϖ_v)=λ(T₀(v)). Import the graded-character theorem from R21.3. A finite character twist makes the relevant form ordinary, giving the nearly ordinary construction from the ordinary one. Under their arithmetic reciprocity and inverse Hecke action the representation is `σ_λ(π)^∨=ρ_{π,λ}⊗ε_ℓ`; retain that twist in every later comparison.

*Inputs:* `OrdinaryAutomorphicFormsAndModularityLifting:R21.2/nearly-ordinary-representations`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.1/quaternionic-nearly-ordinary-hecke-algebra`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.2), p. 38 (Numdam PDF page 35; printed page = PDF page + 3); [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9, and (3.1′), p. 30.

**Ordinary CM primes split.** For a regular cohomological CM form induced from L/F and ordinary at every v|p, prove each such v splits in L and the inducing character has a compatible p-ordinary CM type. For the Hara–Ochiai converse keep its infinity-type/ordinary-CM-type condition; splitting alone is not that iff criterion. Distinct regular-weight local characters are part of the argument. Local induction from an arbitrary index-two subgroup need not be irreducible.

*Inputs:* `R19.2/cm-hilbert-eigenform`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `R19.2/hilbert-hodge-tate-property`.

*Reference:* [Takashi Hara and Tadashi Ochiai](https://arxiv.org/pdf/1507.07309v2) — Appendix A Proposition A.3 and proof, pp. 70–71; §2.1 (ord); [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 proof, p. 67.

**Complex conjugation moves the ordinary CM line.** For the regular p-ordinary CM form, choose the ordinary line V_{v,f} specified by R21.3. At the split v it is one of the two global G_L-character lines, distinguished by the source's ramified/unramified local characters. Any element of G_F inducing the nontrivial conjugation of L interchanges these lines, so V_{v,f} is not stable under it. Keep k>1 and the distinct-character hypotheses. A freely chosen invariant line when the characters coincide need not have this property.

*Inputs:* `R19.2/ordinary-cm-primes-split`; `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`.

*Reference:* [Samit Dasgupta and Mahesh Kakde](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf) — Lemma 9.2 and proof, p. 67.

## R19.3 — Purity, compatible systems and large image

### Geometric and general weight statements

**Geometric weight-monodromy and strict compatibility.** For Saito's geometric Hilbert range g>1, w_S≥k_τ≥2 with matching parity, and a finite discrete-series place when g is even, prove strict compatibility away from the coefficient characteristic. Prove monodromy purity for both the étale WD representation away from λ and the log-crystalline D_pst representation at the coefficient characteristic. His cohomological representation has weight w_S−1; when N≠0 its kernel and cokernel have weights w_S−2 and w_S. In the fixed ρ-convention these become weight 3−w_S=w+1, kernel weight w and cokernel weight w+2. Include the classical geometric weight theorem with its separate source. The imported log-crystalline/étale weight theorem is independent of the coefficient-prime application; otherwise the proof would be circular. This scope is narrower than the all-Hilbert purity target.

*Inputs:* `R19.2/carayol-sigma-lambda-construction`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `WeightsInEtaleCohomology:R34.3/saito-semistable-comparison-model`; `WeightsInEtaleCohomology:R34.6`; `WeightsInEtaleCohomology:R34.6/arithmetic-realization-transport`; `ArithmeticGaloisRepresentations:R01.2`.

*Reference:* [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Remark after Theorem 2, p. 13 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

**Hilbert Ramanujan–Petersson.** For every regular cohomological cuspidal π, its unitary twist π⊗|det|^{w/2} is tempered at every finite place. At an unramified place all roots of P_v have complex absolute value q_v^{(w+1)/2}, and |t_v|≤2q_v^{(w+1)/2} at every embedding. Exclude complementary-series parameters using the integrality of geometric weights and the local classification. In the remaining parallel-weight-two case use the degree-two cohomology of the quaternionic Shimura surface and weight-monodromy for surfaces; other geometric cases use the curve/unitary realisations. No residual irreducibility or finite discrete-series place is part of the theorem.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/carayol-sigma-lambda-construction`; `WeightsInEtaleCohomology:R34.5`; `WeightsInEtaleCohomology:R34.4`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R16.2`; `AutomorphicGaloisRepresentationsPartII:AG2.1`; `GL2AutomorphicRepresentationsAndTransfer:R17.5`; `ArithmeticGaloisRepresentations:R01.2`.

*Reference:* [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Theorem 1, p. 1 (arXiv v1); [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §2.2, p. 15; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §4.2, p. 21; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.1, Remark, p. 252; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 2, p. 11, and Proposition 5, pp. 16–17.

**Purity of the entire family.** For the unrestricted Hilbert representation, the Frobenius-semisimple local parameter at every finite place is pure of weight w+1, including D_pst at the coefficient prime. Combine Ramanujan–Petersson with full local–global compatibility on both sides of the coefficient characteristic. If N=0 all eigenvalues have the weight w+1. If N≠0, the monodromy kernel and cokernel have weights w and w+2. Distinguish this theorem from the narrower Saito geometric weight input: it does not acquire that input's degree or discrete-series hypotheses.

*Inputs:* `R19.4/all-hilbert-local-global-compatibility`; `R19.5/skinner-full-hilbert-coefficient-prime`; `R19.3/hilbert-ramanujan-conjecture`; `R19.2/hilbert-normalisation-dictionary`; `ArithmeticGaloisRepresentations:R01.2`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`.

*Reference:* [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Corollary 7, p. 20; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — Proposition 5, p. 16; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 1, printed p. 429 (page image).

### Irreducibility and large images

**Classical characteristic-zero irreducibility.** For a classical cuspidal newform of k≥2, prove absolute irreducibility at every λ. Distinct Hodge–Tate degrees, the algebraic-Hecke-character description of a hypothetical rank-one constituent and the Ramanujan/purity argument exclude a decomposition. This concerns the characteristic-zero global representation; it neither forces a residual representation to be irreducible nor prevents an ordinary decomposition group from preserving a line.

*Inputs:* `R19.1/newform-rank-two-realisation`; `R19.1/scholl-projector`; `R19.1/newform-projector-and-coefficient-descent`; `PadicHodgeTheory:R06.5`; `PotentialModularityAndCompatibleSystems:R24.5/character-system`; `WeightsInEtaleCohomology:R34.6/eigenform-purity-and-ramanujan-bound`.

*Reference:* [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Remark, p. 256; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(a)–(c), p. 86 (revision of 9 September 2007).

**Dimitrov's residual large image.** For a fixed regular non-CM Hilbert form, exclude a finite set of rational characteristics depending on the form, coefficient field, level and weights. For every remaining relevant λ|ℓ, after conjugacy its residual image contains SL₂(F_q) for a finite subfield F_q⊆κ_λ and lies in κ_λ×GL₂(F_q). In particular it contains a conjugate of SL₂(F_ℓ). Retain the coefficient embeddings and sufficiently large tame-inertia weight conditions used in the exclusions. The conclusion is a large subgroup with its subfield structure, not the entire GL₂(κ_λ).

*Inputs:* `R19.2/cm-hilbert-eigenform`; `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; `ArithmeticGaloisRepresentations:R01.4`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`; `R19.3/fixed-eigenform-compatible-family`.

*Reference:* [Mladen Dimitrov](https://arxiv.org/pdf/math/0411152v1) — Proposition 3.1, p. 22; Proposition 3.5, p. 24; Proposition 3.8, p. 25; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2212.03595v2) — Proof of Lemma 5.7, printed p. 41.

**Ribet–Momose classical large image.** For a fixed non-CM classical cusp newform k≥2, the characteristic-zero Zariski closure contains SL₂ over the algebraic closure for every λ. Residual absolute irreducibility holds outside a finite set of λ; residual image contains a conjugate of SL₂(F_ℓ) outside a finite set of rational ℓ, including the sufficiently large split primes used by symmetric-power applications. Preserve the inner-twist fixed field and quaternion algebra in the open-image formulation. These can constrain coefficients and determinants, so full GL₂(O_{K,λ}) is not the general conclusion.

*Inputs:* `R19.1/newform-rank-two-realisation`; `R19.2/cm-hilbert-eigenform`; `ArithmeticGaloisRepresentations:R01.4`; `R19.3/fixed-eigenform-compatible-family`; `R19.3/classical-newform-irreducibility`; `R19.4/conductor-and-local-factors-classical`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`.

*Reference:* [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1 pp. 188–190; §3 and Theorem 3.1 pp. 190–192; [James Newton and Jack A. Thorne](https://arxiv.org/pdf/2009.07180v2) — Proof of Theorem 3.1, printed p. 26.

### The strict fixed-form family and ordinary-prime selection

**The fixed-eigenform compatible family.** Use the early R24.5:operations carrier over one sufficiently large coefficient field E. Its λ-member is ρ_{π,λ}, its bad set is S_π, its good polynomial is P_v∈E[X], its labelled degrees are the fixed pair above, and at every finite v its local parameter is `Rec_v(π_v⊗|·|⁻¹/²)`, with N retained. Full coefficient-prime compatibility together with away-prime compatibility proves strict compatibility; Ramanujan gives purity of weight w+1. If only good polynomials have been supplied, the family is merely weakly compatible. Kisin alone covers the residually absolutely irreducible coefficient primes and Saito alone his geometric range. Weight-one finite-image systems use their Artin construction, not this regular-weight carrier instance.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.1/newform-rank-two-realisation`; `R19.4/all-hilbert-local-global-compatibility`; `R19.5/skinner-full-hilbert-coefficient-prime`; `R19.3/monodromy-weight-purity-of-the-family`; `PotentialModularityAndCompatibleSystems:R24.5:operations`.

*Reference:* [Luis Victor Dieulefait and Ariel Martin Pacetti](https://arxiv.org/pdf/2108.07577v2) — Definition 1.10 and following paragraph, pp. 6–7; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and equation (1), p. 242.

**Density-one ordinary primes for the fixed weight-two form.** Fix a non-CM weight-two newform of squarefree level N and trivial nebentypus. The rational primes p∤N at which some λ|p is ordinary have density one. For all sufficiently large such rational primes, every λ|p has absolutely irreducible residual representation ramified at each q|N. The norm/trace-zero density argument provides ordinarity; large image supplies irreducibility and level lowering supplies ramification. Thus one can choose p≥5 and an ordinary λ while retaining all residual conditions. Preserve the different “some λ” and “every λ” quantifiers, and exclude the finite coefficient-ramification and small-prime exceptions.

*Inputs:* `R19.3/ribet-momose-classical-large-image`; `ArithmeticGaloisRepresentations:R01.5`; `SerreWeightAndLevelOptimisation:R20.2`; `GL2AutomorphicRepresentationsAndTransfer:R16.6`; `R19.3/fixed-eigenform-compatible-family`.

*Reference:* [Christopher Skinner](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf) — §3, p. 350, first three paragraphs; [Kenneth A. Ribet](https://math.berkeley.edu/~ribet/Articles/rankin.pdf) — Theorem 2.1, pp. 188–190.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Compatible family of a fixed eigenform:

- `fixedEigenformFamily` (constructor): The compatible family {ρ_{π,λ}}_λ over one coefficient field E with ramification set S_π.
- `fixedEigenformFamily_member` (projection): Its λ-member is ρ_{π,λ} of R19.2/all-cohomological-hilbert-representation.
- `fixedEigenformFamily_goodPolynomial` (data): P_v(X) = X² − t_vX + q_vs_v ∈ E[X] for v ∉ S_π.
- `fixedEigenformFamily_localParameter` (data): At every finite v the parameter ιRec_v(π_v ⊗ |·|_v^{−1/2}), with N.
- `fixedEigenformFamily_coeffChange` (functoriality): Enlarging E or conjugating by σ ∈ Aut(C) gives the family of π^σ.
- `fixedEigenformFamily_strict` (characterisation): The family satisfies the strict predicate of R24.5:operations and is pure of weight w + 1.

Concrete tests for this interface:

- `fixedEigenformFamily_delta` (computation): For Δ (infinity type (12,10)): P_2(X) = X² + 24X + 2048 for every λ ∤ 2, and the family is pure of weight 11.
- `fixedEigenformFamily_steinberg` (compatibility): For 11a1 at v = 11 the parameter is the twist of Steinberg with N ≠ 0, for every λ ∤ 11, and agrees with the Tate-curve representation H¹_ét.
- `fixedEigenformFamily_weakNotStrict` (non-example): The family defined only by its good polynomials, without the local parameters at bad places and at λ, is weakly but not thereby strictly compatible.
- `fixedEigenformFamily_evenHilbert` (degenerate): For d even and π principal series everywhere the strict family still exists; it does not rely on a discrete-series place.

## R19.4 — Local–global compatibility away from the coefficient prime

### Parameter normalization and unrestricted compatibility

**Hecke versus Langlands normalization.** For every local π_v, Carayol's parameter σ(π_v) is the contragredient of the Langlands parameter after the |·|^{1/2} twist; characterize it by all twisted L- and ε-factors. For a unitary-induced principal series Ind(ξ₁,ξ₂) it is `ξ₁⁻¹|·|⁻¹/² ⊕ ξ₂⁻¹|·|⁻¹/²`. Prove `det σ(π_v)=χ_{π_v}⁻¹|·|⁻¹` and `σ(ηπ_v)=η⁻¹σ(π_v)`, and compatibility with coefficient automorphisms. In Carayol's geometric range, Theorem A identifies the actual λ-adic Weil representations at every v∤ℓ; this includes the monodromy operator, not just good Frobenius traces. Translate by the global dictionary to the parameter of ρ and deduce conductor and local-factor identities.

*Inputs:* `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:R01.2`.

*Reference:* [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5, printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.5(a), printed p. 410; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8 Corollaire, printed p. 411.

**All-Hilbert compatibility away from λ.** For every π of type (k,w), including even degree and principal series at every finite place, prove at every finite v∤ℓ that `WD(ρ_{π,λ}|G_{F_v})^{F-ss} ≅ Rec_v(π_v⊗|·|⁻¹/²)`. Retain the monodromy operator under Frobenius-semisimplification. Deduce equality of Artin conductors, the shifted automorphic L-factor and N≠0 precisely for a Steinberg twist. Carayol supplies the geometric case via the dictionary; the general assertion uses the unrestricted construction and its transfer compatibility. Equality of traces or semisimplified inertia is weaker than this target.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `ArithmeticGaloisRepresentations:R01.2`.

*Reference:* [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 242; [Don Blasius](https://arxiv.org/pdf/math/0511007v1) — §3, p. 18; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — Theorem A, printed pp. 410–411; §§12.2–12.3, printed pp. 457–459.

**Nearly ordinary compatibility away from p.** For that same Skinner–Wiles representation and every finite v∤p, prove the source's local formula with arithmetic reciprocity and its inverse inducing characters. In geometric reciprocity it becomes `Rec_v(π_v⊗|·|^{1/2})=σ_h(π_v)^∨`. This identifies the full local representation, not just its determinant, and keeps the same twist used by the global nearly ordinary construction.

*Inputs:* `R19.2/wiles-ordinary-hilbert-representation`; `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3, (3.3), p. 39; [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §2.1, p. 9.

### Conductors and quaternionic local characters

**Classical conductors and bad Euler factors.** For the arithmetic representation of a classical k≥2 newform of level N, the Artin conductor away from ℓ is the prime-to-ℓ part of N. At p≠ℓ with p∥N and p∤cond ψ, its local matrix is an extension with diagonal χ_uχ_ℓ,χ_u, where χ_u is unramified with arithmetic Frobenius a_p and the extension has nonzero monodromy. If p∥N and p|cond ψ, the local representation is `χ_u⁻¹χ_ℓ^{k−1}ψ′ ⊕ χ_u`, where ψ′ is the Galois character of ψ. On the inertia invariants of the cohomological dual, geometric Frobenius gives Euler factors `(1−a_pp⁻ˢ+ψ(p)p^{k−1−2s})⁻¹` for p∤N and `(1−a_pp⁻ˢ)⁻¹` for p|N. At a Steinberg place the arithmetic representation's own invariant line instead has arithmetic Frobenius a_pp. For rational weight two identify the associated elliptic curve's conductor N and L-function with those of f.

*Inputs:* `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `R19.6/weight-two-tate-module-decomposition`; `GL2AutomorphicRepresentationsAndTransfer:R16.3`; `ArithmeticGaloisRepresentations:R01.6`; `R19.4/all-hilbert-local-global-compatibility`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(d), p. 86 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 3.1(e), p. 86; [Henri Carayol](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf) — 0.8, Corollaire, p. 411 (transcribed from the page image).

**A fixed character at quaternionic ramification places.** Take the quaternionic Hecke setting of R19.6: F totally real of even degree, p unramified in F, D definite with finite ramification Σ of even cardinality, parallel k≥2 (k=2 if p=2), and Σ disjoint from p when k>2, with the specified ψ-coefficient action. At its non-Eisenstein maximal ideal take U_v=O_{D_v}× for v∈Σ if p>2, and U_v=D_v× if p=2. For p>2 and v∈Σ away from p, impose `Nv≢−1 mod p`, or require that ρ̄_m|G_{F_v} is not a direct sum of two unramified characters. Then one unramified γ_v, independent of the eigenform in the localization, satisfies γ_v²=ψ_v and gives arithmetic local form `(χ_pγ_v,*;0,γ_v)`. In the fixed cohomological convention the diagonal characters are γ_v⁻¹ and γ_v⁻¹χ_p⁻¹. Read γ_v at arithmetic Frobenius from right translation by a quaternion uniformiser; inverse translation gives its inverse. If v|p, only the allowed weight-two/discrete-series branch supplies the comparison. At `Nv≡−1 mod p` with an unramified split residual representation the two signs can agree residually: a fixed sign cannot be inferred from the original localization. An integral family needs a finite-projective invariant line in addition to these eigenform identities.

*Inputs:* `R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `R19.4/conductor-and-local-factors-classical`; `R19.6/hecke-algebra-representation-quaternionic`; `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.2 and its proof, pp. 60–61 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Remark after Lemma 7.2, p. 61.

## R19.5 — Coefficient-prime comparison and integral refinements

### Geometric, residual and unrestricted comparison routes

**Geometric coefficient-prime comparison.** In the classical k≥2 branch, at every λ|p identify the potentially semistable cohomological realisation and its full WD parameter with the corresponding local automorphic parameter. For Hilbert forms in Saito's range retain g>1, w_S≥k_τ, parity and the even-degree discrete-series place. Transport his representation through the dictionary. At a good prime the representation is crystalline, with the Euler-root polynomial and labelled Hodge filtration. The finite-extension comparison and Weil-action trace calculation must identify the monodromy operator as well. Weight-two Barsotti–Tate consequences require the separate p-divisible-group comparison and do not extend to all weights.

*Inputs:* `R19.1/scholl-projector`; `R19.1/newform-projector-and-coefficient-descent`; `R19.2/hilbert-modular-compatible-system-carayol-theorem-A`; `R19.3/strict-compatibility-and-the-monodromy-weight-purity`; `PadicHodgeTheory:R06.5/crystalline-comparison-good-reduction`; `PadicHodgeTheory:R06.5`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `ModularCurvesPartII:R14.5/modular-quotient`; `R19.2/hilbert-normalisation-dictionary`; `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`.

*Reference:* [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Theorem 1, p. 12 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Claim 1, p. 12 of the arXiv version; [Takeshi Saito](https://arxiv.org/pdf/math/0612077v2) — Abstract, p. 1 of the arXiv version; [Takeshi Saito](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf) — Theorem 3, printed pp. 429–430 (page image); [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Introduction, p. 243.

**Kisin's coefficient-prime theorem.** For π of arbitrary regular cohomological multiweight over a totally real F, λ|p and absolutely irreducible semisimplified residual representation, every v|p is potentially semistable with the prescribed labelled degrees and full Frobenius-semisimple WD parameter `Rec_v(π_v⊗|·|⁻¹/²)`. No parallel-weight, unramified-base or finite discrete-series assumption is imposed. In the proof the fixed-type quotient and finite-projective period module are defined over complete Noetherian local coefficient algebras, and are tested on finite Q_p-algebras with nilpotents. Do not substitute equality at field-valued points for this quotient property. The residual assumption belongs to this proof route and is removed by the next theorem.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `LocalGaloisDeformationRings:R08.3/semistable-height-quotient`; `LocalGaloisDeformationRings:R08.3/pst-quotient-in-families`; `IntegralHeckeAndGaloisDeterminants:IHG.1`.

*Reference:* [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 4.3 and proof, pp. 543–544; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 2.5.5, pp. 530–531; Theorem 2.7.6, p. 534; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — §4.1, p. 542.

**Skinner's full coefficient-prime theorem.** For the unrestricted Hilbert representation and every v|p, prove potential semistability, the labelled degrees and the full local parameter, without residual irreducibility or a discrete-series place. After the geometric/CM cases, reduce the remaining parallel-weight-two case by abelian base change. The symmetric-square geometric realization and crystalline lifting give the parameter up to quadratic twist; the quaternionic eigenvariety and analytic continuation of a crystalline period remove that ambiguity. At v|p the continuation input uses φ^{f_v} and a Sen polynomial P(X)=XQ(X) with Q(0) not a zero divisor. Require this condition on the family, not merely at selected classical points. Import generic periods, unitary geometry, eigenvariety gluing and their exact coefficient hypotheses. An equality of Hodge numbers alone does not discharge this target.

*Inputs:* `R19.2/all-cohomological-hilbert-representation`; `R19.2/hilbert-normalisation-dictionary`; `R19.2/hilbert-hodge-tate-property`; `R19.2/hilbert-uniqueness-determinant-oddness-irreducibility`; `R19.4/all-hilbert-local-global-compatibility`; `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `PadicHodgeTheory:R06.3`; `PadicHodgeTheory:R06.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4/adjoint-lift`; `AutomorphicGaloisRepresentationsPartII:AG2.1`; `AutomorphicGaloisRepresentationsPartII:AG2.2`; `PadicFamilies:L2a`; `PadicFamilies:L2`.

*Reference:* [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — Theorem 1 and Hodge–Tate definition, p. 242; proof strategy pp. 243–244; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4, p. 251; [Christopher Skinner](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf) — §2.4.2, p. 254.

### Local forms and endpoint weights

**The KW coefficient-prime local forms.** Retain p unramified in F, parallel weights and the residual absolute-irreducibility assumptions of the KW application. An unramified local automorphic component gives a crystalline representation, including higher weights. In the weight-two tame-type branch the norm-factor character hypotheses give a potentially Barsotti–Tate representation; retain those character hypotheses separately from residual weight. For an unramified twist of Steinberg in weight two obtain semistability with nonzero N and arithmetic diagonal χ_pγ,γ, Hodge weights 0,1, hence failure of crystallinity. Import the exact ordinary inertia characters from R21.3 and the weight-two equivalence from R07.4. These conclusions do not identify all higher-weight representations as Barsotti–Tate.

*Inputs:* `R19.5/kisin-hilbert-coefficient-prime`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Lemma 7.7, p. 67 (authors' final version); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8(i), p. 67; [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, Steinberg case, p. 68.

**The endpoint-weight local contract.** At a good classical prime with k=p+1, characteristic-zero comparison still gives crystallinity and arithmetic Hodge weights 0,p with the full parameter. The integral Fontaine–Laffaille interval [0,k−1] is outside [0,p−2], so that chosen small-weight integral comparison does not apply. Weight p+1 does not make this representation Barsotti–Tate and does not prescribe a residual ordinary/flat lift from a_p. A weight-two potentially Barsotti–Tate conclusion must specify a different lift, its residual weight/type comparison and every R07/R20/R21 hypothesis. Keep characteristic-zero Hodge type, residual Serre weight and deformation-lift type separate.

*Inputs:* `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `R19.5/hilbert-local-behaviour-at-p`; `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.4`; `SerreWeightAndLevelOptimisation:R20.6`.

*Reference:* [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — Corollary 7.8, pp. 67–68; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

### Ordinary and nonordinary integral realisations

**Ordinary refinement and the fixed lattice.** For a classical k≥2 newform, p∤N and a_p a λ-adic unit, choose the unit Euler root α. In the arithmetic representation R21.3 supplies `0→V⁺→V→V⁻→0`, with unramified quotient having arithmetic Frobenius α and subcharacter ψχ_p^{k−1}(V⁻)⁻¹. For the fixed stable lattice T define T⁺=T∩V⁺ and T⁻=T/T⁺. Prove saturation, torsion-freeness and rank one of T⁻ and compatibility with flat coefficient extension and the existing rational period line. On the cohomological realisation the ordinary line is instead the unramified subrepresentation at geometric Frobenius; use the annihilator under duality. For Hilbert multiweights import the labelled character formula rather than applying the Q-formula.

*Inputs:* `R19.1/newform-projector-and-coefficient-descent`; `R19.1/integral-structure-of-the-newform-premotive`; `OrdinaryAutomorphicFormsAndModularityLifting:R21.3`; `ArithmeticGaloisRepresentations:R01.1`.

*Reference:* [C. M. Skinner and A. J. Wiles](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf) — §3.3 equation (3.2), pp. 38–39; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §4.5, pp. 50–51; §§5.3–5.4, pp. 56–59.

**Good-prime crystalline and Wach factors.** For every classical k≥2 at p∤N, identify D_cris of M_f with the projector factor, with degrees 0,k−1 and φ-polynomial `X²−a_pX+ψ(p)p^{k−1}`. No ordinarity or Fontaine–Laffaille range is required for characteristic-zero crystallinity. For a fixed lattice import its P7 Wach module after declaring the precise dual/Tate twist needed by P7's weight convention. The quotient N(T)/π is an integral lattice; only after inverting p does it equal D_cris(T[1/p]). Transport φ and filtration. A chosen semilinear Frobenius matrix changes by `U⁻¹Pφ(U)`, not ordinary conjugation. Match the Euler roots used by regulator applications after a splitting coefficient extension, and require distinct roots before separating eigenlines or dividing by their difference.

*Inputs:* `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `R19.1/integral-structure-of-the-newform-premotive`; `PadicHodgeTheory:P7/wach-dcris-comparison`; `PadicHodgeTheory:P7`.

*Reference:* [A. J. Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf) — Theorem 1.2.4, p. 2; [F. Diamond, M. Flach and L. Guo](https://arxiv.org/pdf/2512.02348v2) — §1.2, pp. 8–10; §5.4, pp. 58–59.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Ordinary refinement and saturated lattice:

- `ordinaryRefinement` (constructor): The unit root α and the imported ordinary filtration of the fixed representation.
- `ordinaryRefinement_quotient` (projection): The unramified quotient character with arithmetic Frob eigenvalue α.
- `ordinaryRefinement_subcharacter` (characterisation): The subcharacter is εχ_p^{k−1} times the inverse quotient character.
- `ordinaryLatticePlus` (constructor): T∩V⁺ as an invariant O_λ-submodule.
- `ordinaryLatticePlus_saturated` (structure): T/T⁺ is torsion-free of rank one.
- `ordinaryRefinement_coeffChange` (functoriality): Flat coefficient extension transports the line and lattice intersection with the appropriate saturation comparison.
- `ordinaryRefinement_period` (compatibility): Use the already specified rational period line under the realisation comparison.

Concrete tests for this interface:

- `ordinaryRefinement_11a1_three` (computation): X²+X+3 has one 3-adic unit root; choose that root for the unramified quotient.
- `ordinaryRefinement_11a1_two` (non-example): X²+2X+2 at 2 has no unit root; ordinary refinement is not defined.
- `ordinaryLatticePlus_saturation` (non-example): In T=O² with V⁺=Ke₁ the intersection is Oe₁; pOe₁ has torsion quotient and fails the contract.
- `ordinaryRefinement_determinant` (compatibility): The two characters multiply to εχ_p^{k−1}, including the unramified unit-root factor.

Nonordinary crystalline and Wach realisation:

- `eigenformDcris` (constructor): The crystalline factor of the cohomological eigenform realisation.
- `eigenformDcris_charpoly` (characterisation): φ has the Hecke Euler-root polynomial in the stated cohomological convention.
- `eigenformWach` (constructor): The P7 Wach module of the fixed lattice in its declared dual/twist convention.
- `eigenformWach_modParameter` (equivalence): The quotient N(T)/π is an integral O_λ-lattice; after inverting p it identifies with D_cris(T[1/p]), compatibly with φ and the declared filtration convention.
- `eigenformWach_changeBasis` (functoriality): A semilinear matrix changes by U⁻¹Pφ(U).
- `eigenformWach_roots` (compatibility): After coefficient extension the regulator roots coincide with the crystalline roots; separate distinct and repeated roots.

Concrete tests for this interface:

- `eigenformDcris_11a1_two` (computation): At 2 the polynomial X²+2X+2 has slopes 1/2,1/2 and gives a good nonordinary example.
- `eigenformWach_twist` (compatibility): Dual/Tate-twist transport changes φ eigenvalues and Hodge degrees according to the imported period-functor laws.
- `eigenformWach_basis` (characterisation): Changing the basis preserves the φ-module under semilinear conjugation, not under ordinary matrix conjugation alone.
- `eigenformWach_repeatedRoot` (non-example): For a two-dimensional Jordan φ-module with repeated root, the two formal roots do not provide two independent eigenlines.
- `eigenformWach_integralQuotient` (non-example): For a rank-one trivial crystalline Z_p-lattice, N(T)/π≅Z_p while D_cris(Q_p)≅Q_p. They identify after inverting p, not as integral modules.

### Period multiplicities in a Shimura-curve tower

**Shimura-curve Hyodo–Kato/de Rham multiplicity.** In the CDN setup take a local field F/Q_p, a totally real E with E_𝔭=F, the quaternion algebra B̌ ramified at 𝔭 and split at one real place, and its inner form B split at 𝔭 and compact at infinity, with the other prescribed invariants. For a two-dimensional supercuspidal (φ,N,G_F)-module M in ΦN^ϖ, require ϖ trivial on JL(M), choose n with JL(M) trivial on 1+ϖ_D^nO_D, and choose Π̌∈SD_{2,n} with local factor JL(M). The real distinguished factor is holomorphic weight two with trivial central character there, and the other real factors are trivial; a globally trivial central character is not assumed. Extract `Hom_{Ǧ(A_f^p)}(Π_f^p,L⊗H¹_HK(Sh_n)) ≅ JL(M)⊗M`. For K containing E and F through the fixed embeddings the de Rham multiplicity is `JL(M)⊗(K⊗_F M_dR)`. Keep the coefficient completions, comparison map and group actions, and allow the source's globalization twist and extension of L. The étale multiplicity is ρ_Π(−1), hence the CDN ρ_Π is the arithmetic dual in our dictionary. This identifies a multiplicity space rather than the whole cohomology.

*Inputs:* `R19.5/skinner-full-hilbert-coefficient-prime`; `R19.4/all-hilbert-local-global-compatibility`; `HilbertModularVarietiesAndShimuraCurves:R18.4`; `PadicHodgeTheory:R06.5`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `GL2AutomorphicRepresentationsAndTransfer:R16.6`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf) — §5.2.1 Proposition 5.2 and proof, pp. 43–45.

## R19.6 — Residual representations and integral Hecke families

### Weight-two Tate modules and residual factors

**Weight-two Tate-module decomposition.** For a weight-two newform f, its modular abelian variety A_f has V_ℓ(A_f) free of rank two over K_f⊗Q_ℓ. Decompose along λ|ℓ and identify each factor with the arithmetic representation of f, giving Q_ℓ-dimension 2[K_f:Q]. This requires the coefficient action, Weil-pairing adjointness and Eichler–Shimura, not just an equality of Hecke traces. The abelian quotient is specific to weight two; it is not a construction for arbitrary higher weight.

Use the imported quotient `A_f=J₁(N)/𝔭_fJ₁(N)`. The λ-factor is
`K_{f,λ}⊗_{K_f⊗Q_ℓ}V_ℓ(A_f)`, and the direct sum of these factors is
an isomorphism of Q_ℓ[G_Q]-modules preserving the K_f-action. For K_f=Q,
A_f is the elliptic curve E_f.

*Inputs:* `ModularCurvesPartII:R14.5/modular-quotient`; `ModularCurvesPartII:R14.5/modular-quotient-dimension`; `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`; `R19.1/newform-rank-two-realisation`; `ArithmeticGaloisRepresentations:R01.6`; `R19.3/classical-newform-irreducibility`; `ModularCurvesPartII:R14.2`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Lemma 1.48, p. 46 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.1, (3.1.1), p. 85; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Theorem 1.41, pp. 42–43, with Lemma 1.38, p. 41.

**Residual newform representation.** Choose a stable lattice in the arithmetic ρ_{f,λ} and define its semisimplified reduction over κ_λ. Its prime-to-ℓ conductor divides N. It is unramified outside Nℓ, has trace a_p modulo λ and determinant ψ̄χ̄_ℓ^{k−1}, and is independent of the lattice up to isomorphism. In odd residue characteristic it is odd. Prove uniqueness from good characteristic polynomials; full polynomials are required even for semisimple representations in characteristic two. A globally irreducible characteristic-zero representation may have reducible reduction. At weight two with rational coefficients compare it with E_f[ℓ]^{ss}, keeping nonsplit lattice reductions distinct before semisimplification.

For odd ℓ, irreducibility of this residual representation is equivalent to
absolute irreducibility. At every good arithmetic Frobenius p∤Nℓ the full
polynomial is `X²−(a_p mod λ)X+(ψ(p)p^{k−1} mod λ)`; both coefficients
are part of the recognition statement. The identity `det ρ̄(c)=−1` holds
in κ_λ for complex conjugation, including when ℓ=2 and −1=1.

*Inputs:* `R19.1/newform-rank-two-realisation`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`; `R19.3/classical-newform-irreducibility`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.1, "Mod ℓ representations", p. 87 (revision of 9 September 2007).

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

The residual representation of a newform:

- `residualRep` (data): ρ̄_{f,λ}: G_Q → GL_2(k_λ), semisimple, defined up to isomorphism.
- `residualRep_trace` (characterisation): tr ρ̄(Frob_p) = a_p mod λ for p ∤ Nℓ.
- `residualRep_det` (simp): det ρ̄ = ψ̄ χ̄_ℓ^{k−1}.
- `residualRep_lattice_indep` (extensionality): Any two stable lattices give isomorphic semisimplified reductions.
- `residualRep_unique_charpoly` (extensionality): A semisimple representation with the same good-prime characteristic polynomials is isomorphic to residualRep; retain determinant information also in characteristic two.

Concrete tests for this interface:

- `residualRep_11a1_five` (computation): For 11a1 and λ = 5, ρ̄ ≅ 1 ⊕ χ̄_5.
- `residualRep_det_weight_two` (degenerate): For k = 2 and ψ = 1, det ρ̄ = χ̄_ℓ.
- `residualRep_eq_torsion` (compatibility): For K_f = Q, ρ̄_{f,ℓ} ≅ E_f[ℓ]^{ss} as G_Q-modules.
- `residualRep_not_reduction_without_ss` (non-example): For 11a1, λ = 5, different lattices give non-isomorphic reductions before semisimplification: the Tate modules of the isogenous curves 11a3 and 11a2 give the non-split (1 ∗; 0 χ̄_5) and (χ̄_5 ∗; 0 1), and that of 11a1 itself gives the split 1 ⊕ χ̄_5.
- `residualRep_trace_char_two` (non-example): Over F₄, let χ:C₃→F₄× have order three. The semisimple representations 1⊕1 and χ⊕χ both have identically zero trace, but determinant characters 1 and χ² differ. Full characteristic polynomials distinguish them.

### Full and reduced Hecke algebras

**The full weight-two Hecke algebra.** For Γ_H(N), take T_Z generated by all T_n and diamond operators, and extend coefficients to R. It is finite free and acts faithfully on the weight-two space and the Jacobian. V_ℓ(J_Γ) is free of rank two over the full rational Hecke algebra; “full” retains generalized oldform eigenspaces and possible nilpotents. Its arithmetic Galois action has good polynomial `X²−T_pX+p〈p〉`. Field factors give characteristic-zero representations, while for odd ℓ reduction gives a semisimple representation depending only on the maximal ideal. A newform factor agrees with the previously constructed representation. Empty cusp spaces give the zero ring, not a rank-two representation over an invented coefficient field.

For an old eigenform the field-factor representation is the scalar extension
of the representation of its associated newform. Thus passing to an old level
does not construct a new Galois representation unrelated to that newform.

*Inputs:* `R19.1/geometric-construction-and-the-eichler-congruence-relation`; `R19.1/newform-rank-two-realisation`; `R19.6/weight-two-tate-module-decomposition`; `ModularCurvesPartII:R14.2`; `ArithmeticGaloisRepresentations:R01.6`; `ArithmeticGaloisRepresentations:R01.1`; `AlgebraicModularFormsAndSerreWeights:R15.2`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, p. 107 (revision of 9 September 2007); [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §1.6, Lemma 1.39, p. 42; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "Associated Galois representations", p. 109; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, "The structure of TK", p. 110.

**The specified reduced localization.** At `N_Σ=ℓ^δ∏_{p|N(ρ̄)}p∏_{p∈Σ\{ℓ}}p²`, modify each optimized newform's old coefficients by a_p(g)=a_p(f) if p∤N_Σ/N_f, by zero at p≠ℓ dividing N_Σ/N_f, and at ℓ by the unit root of `X²−a_ℓ(f)X+ℓ` when ℓ|N_Σ/N_f. The common residual eigenform has a_p=tr(Frob_p on ρ̄'s I_p-coinvariants) for p=ℓ or p∉Σ and a_p=0 otherwise. It defines m in the full Hecke algebra, and the resulting localization is T_Σ≅T_m. This particular T_m is reduced: over a sufficiently large K it is the product of the optimized newform fields, with T_p=0 at p∈Σ\{ℓ} and the unit-root choice at ℓ∈Σ. At p|N(ρ̄)ℓ^δ the arithmetic Frobenius on the representation's inertia coinvariants is T_p. This reduced statement depends on the prescribed Σ and residual localization; a full old Hecke algebra at an unrelated level may contain nilpotents.

Retain all hypotheses of the classical type-Σ Hecke-representation theorem
below, including odd ℓ, modular irreducible ρ̄ with cyclotomic determinant,
semistability at ℓ, the inertia-order condition away from ℓ and the allowed
set Σ. These hypotheses are part of the reduced-localization theorem.

*Inputs:* `R19.6/hecke-algebra-representation-classical`; `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations`; `R19.4/conductor-and-local-factors-classical`; `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `AlgebraicModularFormsAndSerreWeights:R15.2`; `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Lemma 4.6, p. 112; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.2, Proposition 4.7, p. 113; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, Lemma 4.4, p. 111.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

The full weight-two Hecke algebra, its representation on the Tate module and the residual representations ρ_m:

- `fullHeckeAlgebra` (data): 𝕋_R = 𝕋_ℤ ⊗ R for Γ_H(N) in weight two, generated by the T_n and ⟨d⟩.
- `fullHeckeAlgebra_free` (characterisation): 𝕋_R is finite free over R and acts faithfully on S₂(Γ, R).
- `tateModule_free_rank_two` (characterisation): T_ℓ(J_Γ) ⊗ ℚ_ℓ is free of rank 2 over 𝕋_{ℚ_ℓ}.
- `heckeRep` (constructor): ρ_𝔭 : G_ℚ → GL₂(𝕋_K/𝔭) for a maximal ideal 𝔭 of 𝕋_K.
- `heckeRep_charpoly` (characterisation): For p ∤ Nℓ, the characteristic polynomial of ρ_𝔭(Frob_p) is X² − T_pX + p⟨p⟩ mod 𝔭.
- `residualHeckeRep` (constructor): For ℓ odd, ρ_𝔪 : G_ℚ → GL₂(𝕋_𝒪/𝔪), semisimple, depending only on 𝔪.
- `heckeRep_newform` (compatibility): If 𝔭 corresponds to a newform g, 𝕋_K/𝔭 ≅ K′_g and ρ_𝔭 ≅ ρ_g.

Concrete tests for this interface:

- `fullHeckeAlgebra_level_eleven` (computation): For Γ₀(11) and ℓ = 5: 𝕋_ℤ = ℤ, 𝔪 = (5) and ρ_𝔪 ≅ 1 ⊕ χ̄₅.
- `fullHeckeAlgebra_not_reduced_level_88` (non-example): For Γ₀(88), T₂ on the old space of 11a1 generates K[u]/(u²(u² + 2u + 2)), in which u(u² + 2u + 2) is a nonzero nilpotent.
- `fullHeckeAlgebra_genus_zero` (degenerate): For Γ₀(N) with N ≤ 10, S₂(Γ₀(N)) = 0, so 𝕋_ℤ = 0 and there are no maximal ideals.
- `heckeRep_newform_compat` (compatibility): For a newform g of level N, ρ_𝔭 agrees with R19.1/newform-rank-two-realisation.

### Whole-ring determinant descent and reconstruction

**The geometric Hecke determinant.** Let O be a complete DVR and T_m a completed local finite O-flat Hecke algebra, including possible nilpotents. From the actual cohomology multiplicity construct a faithful generic rank-two T_m[1/p]-module with commuting continuous G_{F,S}-action. Descend its degree-two determinant law to all of T_m, with good geometric coefficients T_v,NvS_v, and prove continuity and compatibility with every finite quotient and coefficient change. O-flatness makes T_m→T_m[1/p] injective even with nilpotents. In weight two this module is H¹, dual to DDT's Tate module; its residual law is the dual of the arithmetic residual law. Use the full generalized oldform eigenspaces. Reduced eigenform points cannot supply the nilpotent coefficients; torsion/non-flat cohomological determinant construction is not implied by this flat-family theorem.

*Inputs:* `R19.1/newform-projector-and-coefficient-descent`; `R19.2/carayol-sigma-lambda-construction`; `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `ArithmeticGaloisRepresentations:R01.5`; `HilbertModularVarietiesAndShimuraCurves:R18.4`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §4.1, the structure of the full Hecke algebra, pp. 109–110, and Lemmas 1.37–1.39; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 4.3 proof, pp. 543–544; [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — §§1.1–1.5, pp. 7–8; §1.10, p. 12.

**From a determinant law to a Hecke representation.** Let T be complete local and let D be a continuous degree-two determinant over its entire group algebra. Suppose its residual law is split and comes from a specified absolutely irreducible rank-two representation over the finite residue field. Import henselian Cayley–Hamilton reconstruction to obtain a continuous representation into GL₂(T), unique up to conjugacy and up to strict equivalence with fixed residual identification. The residue field need not be algebraically closed. Specialize through all coefficient quotients, including nilpotent ones. The good geometric polynomial is `X²−T_vX+Nv S_v`; take the arithmetic dual before a map to an arithmetic universal deformation problem.

*Inputs:* `IntegralHeckeAndGaloisDeterminants:IHG.1/henselian-irreducible`; `R19.6/geometric-hecke-determinant`; `R19.6/residual-representation-of-a-newform`.

*Reference:* [Gaetan Chenevier](https://arxiv.org/pdf/0809.0415v2) — Theorem 2.22(i), printed p. 34; split residual determinant definitions in §2.18–2.22.

**Construction APIs and tests.** The names describe the mathematical contracts above; the namespace prefix is `TauCeti.ModularGalois`.

Geometric determinant over the integral Hecke algebra:

- `geometricHeckeDeterminant` (constructor): The integral degree-two law from the actual geometric generic rank-two Hecke family.
- `geometricHeckeDeterminant_goodFrob` (simp): Its characteristic polynomial at good geometric Frobenius has coefficients T_v,Nv S_v.
- `geometricHeckeDeterminant_continuous` (structure): Compatible continuous laws over all finite quotients T_m/m^n.
- `geometricHeckeDeterminant_coeffChange` (functoriality): Coefficient quotient/extension commutes with the geometric determinant.
- `geometricHeckeDeterminant_residual` (compatibility): Reduction identifies with det ρ̄ of the residual eigensystem, ρ̄ being taken in the geometric convention (the dual of the arithmetic residual representation).
- `geometricHeckeDeterminant_wholeRing` (characterisation): All identities hold over T_m, including its nilpotents, rather than only T_m,red.

Concrete tests for this interface:

- `geometricHeckeDeterminant_dualNumbers` (non-example): Over A=k[ε]/ε², diag(1+ε,1) and identity have the same reduced point but different determinant at the generator of an infinite cyclic group.
- `geometricHeckeDeterminant_finiteQuotients` (compatibility): Reduction from T_m/m^{n+1} to T_m/m^n agrees with the n-th law.
- `geometricHeckeDeterminant_characteristicTwo` (computation): The cross coefficient tr(g)tr(h)−tr(gh) is integral in characteristic two; no 1/2 formula is used.
- `geometricHeckeDeterminant_oldspace` (computation): Retain the nonzero nilpotent u(u²+2u+2) in the level-88 old Hecke factor instead of replacing that factor by its reduced quotient.

### Arithmetic representations over Hecke algebras

**Quaternionic Hecke-algebra representations.** Use the Khare–Wintenberger setting: F totally real of even degree, p unramified in F, D definite at infinity and ramified at a finite even-cardinality set Σ, forms S_{k,ψ}(U,O), and the Hecke algebra generated outside a bad set S. Take k≥2 parallel, k=2 if p=2; exclude Σ∩{v|p} if k>2. Choose a sufficiently large p-adic coefficient field containing the embeddings of F, splitting D at p, and a coefficient action with central restriction ψ⁻¹ and ψ on sufficiently small p-units equal to the norm power 2−k. For noncompact U at p=2 specify the extension of the weight-two trivial action from the maximal compact subgroup. S includes infinity, p, Σ, nonmaximal level and nontrivial coefficient action. At a non-Eisenstein maximal ideal, whose residual representation is absolutely irreducible, construct the arithmetic representation over the completed local Hecke algebra, unramified outside S with good polynomial `X²−T_vX+Nvψ(ϖ_v)`. Identify every eigenform specialization and construct the fixed-determinant deformation map; additional local conditions must be named individually.

The level `U=∏_v U_v` is open and compact modulo the centre in
`(D⊗_F A_F^∞)×`, and ψ is an O-valued character of
`F×\(A_F^∞)×`. The representation is unique up to conjugacy, or up to
strict equivalence once its residual identification is fixed.

*Inputs:* `R19.6/determinants-and-representability-over-a-hecke-algebra`; `GL2AutomorphicRepresentationsAndTransfer:R17.3`; `IntegralHeckeAndGaloisDeterminants:IHG.1`; `R19.2/all-cohomological-hilbert-representation`; `ArithmeticGaloisRepresentations:R01.1`; `IntegralHeckeAndGaloisDeterminants:IHG.4`; `GlobalGaloisDeformations:R04.2/universal-deformation-ring`; `GlobalGaloisDeformations:R04.2/fixed-determinant-rings`; `GlobalGaloisDeformations:R04.3`; `R19.2/hilbert-normalisation-dictionary`.

*Reference:* [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §9.1.1, p. 80 (authors' final version, 30 May 2009); [C. Khare and J.-P. Wintenberger](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) — §9.1.1, p. 80.

**Classical type-Σ Hecke representation.** Let ℓ be odd, K/Q_ℓ finite, O its integers and κ its residue field. Let ρ̄:G_Q→GL₂(κ) be continuous, irreducible and modular, with det ρ̄=χ̄_ℓ, semistable at ℓ, and #ρ̄(I_p) dividing ℓ for p≠ℓ. These hypotheses give absolute irreducibility on G_L for `L=Q(√((-1)^{(ℓ−1)/2}ℓ))`. Choose a finite Σ in the allowed set: p=ℓ is allowed only if ρ̄ is good and ordinary there, and p≠ℓ only if ρ̄ is unramified there. The optimized newforms have weight two, trivial character, residual representation ρ̄ after coefficient extension, and level dividing `ℓ^δ N(ρ̄)∏_{p∈Σ\{ℓ}}p^{dim ρ̄^{I_p}}`, with ℓ²∤N_f. Here δ=0 if ρ̄ is good at ℓ and ℓ∉Σ, and δ=1 otherwise; R20.6 supplies nonemptiness. The O-algebra T_Σ generated by T_p for p∉Σ, p∤ℓN(ρ̄), inside the product of coefficient integer rings is reduced, local, complete, Noetherian, finite free and has residue field κ. Construct its arithmetic representation, unramified with trace T_p at those good primes, lifting ρ̄ with type Σ, and the unique surjection R_Σ↠T_Σ carrying the universal lift to it. Enlargement Σ⊆Σ′ gives T_Σ′↠T_Σ; extension K⊆K′ gives T_Σ⊗_O O_{K′}; projection to an eigenform factor gives its representation.

*Inputs:* `R19.1/newform-rank-two-realisation`; `R19.6/residual-representation-of-a-newform`; `R19.6/full-weight-two-hecke-algebra-and-its-galois-representations`; `R19.4/conductor-and-local-factors-classical`; `R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; `GlobalGaloisDeformations:R04.3`; `SerreWeightAndLevelOptimisation:R20.6`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, p. 93; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.26, p. 94; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, Lemma 3.27, p. 94; [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — §3.3, proof of Lemma 3.27, p. 95.

### Local deformation conditions in families

**Local conditions on the entire Hecke family.** For the reconstructed representation with specified absolutely irreducible residual object, verify determinant and ramification conditions over T_m and each finite quotient. For each chosen local deformation functor show factorization through its representing quotient: fixed determinant, minimal/unramified, ordinary with a chosen saturated flag, or potentially semistable with specified Hodge/inertial type. Combine these to construct the global universal deformation-ring map. Vanishing at characteristic-zero field points tests only the reduced generic fibre; for O-flat T_m, use the whole generic algebra, including nilpotents, before descending a defining ideal. Ordinary/flat conditions on torsion quotients require their exact functor argument. N≠0 is not a substitute for a deformation condition at every Artinian point, and Artinian Hecke quotients do not automatically embed into products of eigenform field quotients. For the particular reduced T_Σ, the quotients by T_Σ∩∏_f λ_f^n are cofinal and embed in products of eigenform quotients; that argument is not available for a nilpotent family.

*Inputs:* `R19.6/geometric-hecke-determinant`; `R19.6/determinants-and-representability-over-a-hecke-algebra`; `R19.5/ordinary-refinement-and-saturated-lattice`; `R19.5/kisin-hilbert-coefficient-prime`; `GlobalGaloisDeformations:R04.3`; `LocalGaloisDeformationRings:R08.3`.

*Reference:* [H. Darmon, F. Diamond and R. Taylor](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf) — Lemma 3.27 and proof, pp. 94–95; [Mark Kisin](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf) — Theorem 2.5.5, printed pp. 530–531; Theorem 2.7.6, printed p. 534; §4.3, printed pp. 543–544.

## References and page conventions

Citations above use printed journal pages for the published scans and internal pages for the specified author or arXiv versions. Those are different from the published page ranges when an author version is used.

- [Pierre Deligne and Jean-Pierre Serre, *Formes modulaires de poids 1*](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf). Ann. Sci. École Norm. Sup. (4) 7 (1974), 507–530; printed journal pages in the Numdam scan.
- [Pierre Deligne, *Formes modulaires et representations l-adiques*](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf). Séminaire Bourbaki, 1968/69, exposé 355, published 1971, 139–172; printed pages in the Numdam scan.
- [Henri Carayol, *Sur les representations l-adiques associees aux formes modulaires de Hilbert*](https://www.numdam.org/article/ASENS_1986_4_19_3_409_0.pdf). Ann. Sci. École Norm. Sup. (4) 19 (1986), 409–468; printed journal pages in the Numdam scan.
- [Takeshi Saito, *Hilbert modular forms and p-adic Hodge theory*](https://arxiv.org/pdf/math/0612077v2). arXiv:math/0612077v2 (11 December 2006), internal pages; published in Compositio Math. 145 (2009), 1081–1113.
- [Gaetan Chenevier, *The p-adic analytic space of pseudocharacters of a profinite group and pseudorepresentations over arbitrary rings*](https://arxiv.org/pdf/0809.0415v2). arXiv:0809.0415v2 (18 July 2013), internal pages.
- [Luis Victor Dieulefait and Ariel Martin Pacetti, *A simplified proof of Serre's conjecture*](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2 (3 May 2022), internal pages.
- [F. Diamond, M. Flach and L. Guo, *Adjoint motives of modular forms and the Tamagawa number conjecture*](https://arxiv.org/pdf/2512.02348v2). arXiv:2512.02348v2 (11 December 2025), internal pages; revised author version of Ann. Sci. École Norm. Sup. 37 (2004), 663–727.
- [H. Darmon, F. Diamond and R. Taylor, *Fermat's Last Theorem*](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf). Author revision of 9 September 2007, internal pages; article originally published in Current Developments in Mathematics 1995.
- [C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author final version of 30 May 2009, internal pages; published in Invent. Math. 178 (2009), 505–586.
- [C. M. Skinner and A. J. Wiles, *Residually reducible representations and modular forms*](http://www.numdam.org/item/PMIHES_1999__89__5_0.pdf). Publ. Math. IHÉS 89 (1999), 5–126; printed journal pages in the Numdam scan.
- [A. J. Scholl, *Motives for modular forms*](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/mf.pdf). Author copy of Invent. Math. 100 (1990), 419–430; internal author-copy pages.
- [Mark Kisin, *Potentially semi-stable deformation rings*](https://www.ams.org/journals/jams/2008-21-02/S0894-0347-07-00576-0/S0894-0347-07-00576-0.pdf). J. Amer. Math. Soc. 21 (2008), 513–546; printed journal pages in the AMS PDF.
- [Christopher Skinner, *A note on the p-adic Galois representations attached to Hilbert modular forms*](https://content.ems.press/assets/public/full-texts/serials/dm/14/8965206/online/10.4171-dm-272.pdf). Documenta Math. 14 (2009), 241–258; printed journal pages in the EMS PDF.
- [Mladen Dimitrov, *Galois representations modulo p and cohomology of Hilbert modular varieties*](https://arxiv.org/pdf/math/0411152v1). arXiv:math/0411152v1, internal pages; published in Ann. Sci. École Norm. Sup. 38 (2005), 505–551.
- [Samit Dasgupta and Mahesh Kakde, *On the Brumer–Stark conjecture*](https://math.iisc.ac.in/~maheshkakde/brumerstark.pdf). Author copy of Ann. Math. 197 (2023), 289–388; internal pages.
- [Baskar Balasubramanyam, Eknath Ghate and Vinayak Vatsal, *On local Galois representations associated to ordinary Hilbert modular forms*](https://mathweb.tifr.res.in/~eghate/hilbertCM.pdf). Author copy of Manuscripta Math. 142 (2013), 513–524; internal pages.
- [Takashi Hara and Tadashi Ochiai, *The cyclotomic Iwasawa main conjecture for Hilbert cuspforms with complex multiplication*](https://arxiv.org/pdf/1507.07309v2). arXiv:1507.07309v2, internal pages; published in Kyoto J. Math. 58 (2018), 1–100.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms*](https://math.berkeley.edu/~ribet/Articles/invent_28.pdf). Invent. Math. 28 (1975), 245–275; printed journal pages in the author-hosted scan.
- [Kenneth A. Ribet, *On l-adic representations attached to modular forms II*](https://math.berkeley.edu/~ribet/Articles/rankin.pdf). Glasgow Math. J. 27 (1985), 185–194; printed journal pages in the author-hosted scan.
- [Pierre Colmez, Gabriel Dospinescu and Wiesława Nizioł, *Cohomologie p-adique de la tour de Drinfeld: le cas de la dimension 1*](https://webusers.imj-prg.fr/~wieslawa.niziol/GPW5.pdf). Author copy GPW5, internal pages 43–45 for the Shimura-curve comparison.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for holomorphic modular forms, II*](https://arxiv.org/pdf/2009.07180v2). arXiv:2009.07180v2, internal pages; published in Publ. Math. IHÉS 134 (2021), 1–152.
- [James Newton and Jack A. Thorne, *Symmetric power functoriality for Hilbert modular forms*](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (19 February 2025), internal pages; published in Ann. Math. 203 (2026), no. 1.
- [Christopher Skinner, *A converse to a theorem of Gross, Zagier, and Kolyvagin*](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n2-p01-s.pdf). Ann. Math. 191 (2020), 329–354; printed journal pages in the published PDF.
- [Don Blasius, *Hilbert modular forms and the Ramanujan conjecture*](https://arxiv.org/pdf/math/0511007v1). arXiv:math/0511007v1 (1 November 2005), internal pages; published in Noncommutative Geometry and Number Theory, Aspects Math. E37 (2006), 35–56.
- [Takeshi Saito, *Weight-monodromy conjecture for ℓ-adic representations associated to modular forms. A supplement to the paper [10]*](https://www.ms.u-tokyo.ac.jp/~t-saito/pp/weightmonodromy.pdf). The Arithmetic and Geometry of Algebraic Cycles (2000), 427–431; printed pages in the author-hosted scan.
