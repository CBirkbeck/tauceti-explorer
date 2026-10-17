# Roadmap: modularity and Langlands extensions

**Summary.** Build modularity and automorphy results beyond classical GL₂ over ℚ: weight-one and totally real Artin representations, simultaneous potential automorphy over totally real and CM fields, symmetric power functoriality and its analytic consequences, and classical-group packet comparisons. The final layer states the precise Langlands conjectures used by conditional implications. Normalize every realization and Euler factor explicitly, and carry the trace formula hypotheses through the symplectic and unitary classifications.

The starting objects are actual continuous Galois representations, automorphic representations, their local parameters and compatible systems. The intermediate results connect these objects by all-place comparisons and controlled field extensions. The principal consequences are symmetric power lifts for non-CM modular and Hilbert modular forms, purity and Sato–Tate for parallel-weight rank-two CM systems, and the packet and descent statements used in Siegel modularity.

## Scope and ownership

This roadmap owns the endpoint implications, their normalization comparisons and the additional prerequisites explicitly constructed below. It builds on the general deformation, automorphic, local-factor and cohomological theories at the imported scope specified in each supplier contract.

TauCetiRoadmap.RepresentationTheory.ClassicalGroups, Layers 0–1, supplies the standard representations and functorial tensor, symmetric and exterior powers. TauCetiRoadmap.RepresentationTheory.CompactGroups, Layers 5–6 and its SU(2) engine, supplies Peter–Weyl, characters, Haar probability measure, the classification of the SU(2) irreducibles and Weyl integration. Sato–Tate here consumes these results to identify arithmetic conjugacy classes and prove equidistribution. The finite-field projective-image condition is a specialization of Mathlib's projective general and special linear groups; no projective-group foundation is introduced.

The current Tau Ceti elliptic library supplies `WeierstrassCurve.tateModuleGaloisRepresentation`, its continuous action for elliptic curves, and `TauCeti.det_tateModuleGaloisRepresentation` under the separably closed and characteristic hypotheses of that theorem. These are the Tate-module representation and its cyclotomic determinant. This roadmap consumes them through the rational cohomological dual comparison. The current newform API also supplies `HeckeRing.GL2.Newform.satakeParameters`, `satakeParameters_eq_pair_iff`, `satakeAngle` and `satakeParameters_eq_exp_satakeAngle` in `TauCeti.NumberTheory.ModularForms.Newforms.Satake`: the last comparison assumes prime p, trivial local nebentypus and the Ramanujan bound. It is an imported classical rational special case; it supplies neither that bound nor the CM-field Sato–Tate theorem. TauCetiRoadmap.LocalGaloisGroups and ProfiniteArithmetic supply their local and profinite foundations; their tame-module and character-compatible-system statements do not assert the automorphic comparisons specified here.

ClassicalSerreModularity and EllipticCurveModularity own classical rational modularity. GL2AutomorphicRepresentationsAndTransfer owns rank-two local Langlands, soluble Artin cases and rank-two base change. PotentialModularityAndCompatibleSystems owns compatible-system objects and their general operations and L-functions. The consumer comparisons below distinguish all-place automorphy from weak automorphy, and cuspidal automorphy from an isobaric direct sum.

AutomorphicGaloisRepresentationsPartII owns the actual Galois realization, Weil–Deligne and Hodge–Tate comparisons. AutomorphicFormsOnReductiveGroups owns archimedean local Langlands, algebraic weights, purity and real cohomological packet constructions. EndoscopicTransferAndUnitaryTraceComparison supplies its stated local factors, cyclic base change and weak cyclic automorphic induction. AutomorphicLFunctionsAndLocalFactors supplies its stated standard and Rankin–Selberg results and Langlands–Shahidi factor definitions. The stronger induction, analytic and trace comparisons required here have separate local targets below.

This roadmap owns the symmetric-power propagation, level-raising, tensor-lifting and auxiliary-curve arguments in Layer 4. Their deformation, eigenvariety and representation-theoretic foundations are imported at their actual scope; the additional comparison theorems are targets here. Layer 2 similarly owns the Dwork eigenprojectors, coefficient-prime ordinary comparison and the finite local prescriptions used in the open-image argument. The polarized lifting, theta and spectral-action constructions are local targets, with exact lower-tier inputs stated before their consumers.

PadicHodgeTheory §3.6 owns labelled ordinary flags, their coefficient-valued crystalline characters, the consecutive-Hodge-list/maximal-monodromy criterion and descent of regular ordinarity through finite extensions. CrystallineCohomology §§CR.6.1–CR.6.3 owns the log differential boundary, Hyodo–Kato comparison and one-parameter logarithmic comparison. Layer 2 imports these constructions and proves their H₀-equivariant Dwork specialization. PotentialModularityAndCompatibleSystems §8.6 supplies rank-two ordinary lifting and finiteness; the higher-rank polarized assertions below extend that case.

TauCetiRoadmap.PadicFunctionalAnalysis and CompactOperators own the Banach-module, orthonormalizable and complete-continuity foundations. LocallyAnalyticDistributions owns the locally convex limits, strictness, completed tensors, analytic compact-type duality and distribution/character-space comparison; RigidAnalyticGeometry owns coherent quasi-Stein sheaves. The additional targets in §4.3 are Emerton’s relative compactness on general and compact-type modules, the Fréchet–Stein/coadmissibility comparisons, the contracting Jacquet system and its automorphic applications. They import those analytic foundations.

## Conventions

Number fields come with specified algebraic closures and actual embeddings for restriction and base change. A coefficient prime λ belongs to a fixed coefficient number field M; coefficient extension uses the stated embedding M→M_λ→ℚ̄_ℓ. A residual representation means semisimple reduction of a stable lattice. Every irreducibility condition specifies the subgroup on which it is imposed. Dimensions are positive in cuspidal automorphy assertions; zero-dimensional examples belong to compatible-system or finite linear-algebra checks.

Use geometric Frobenius and local reciprocity sending a uniformizer to geometric Frobenius. In BLGGT's Hodge–Tate convention HT(ε_ℓ)={−1}. For a rank-n automorphic representation use recᵀ(π_v)=rec(π_v⊗|det|_v^{(1−n)/2}). A representation of weight a has HT numbers a_{ιτ,i}+n−i. If a_{τ,i}+a_{τc,n+1−i}=w_alg, its motivic purity weight is w_mot=w_alg+n−1. The polarization sign uses w_alg in (−1)^{n+w_alg}; Frobenius magnitudes and gamma factors use w_mot. Below each use of w follows the local definition in its statement. The rank-one trivial representation has Frobenius 1 and HT number 0; its cyclotomic twist has geometric Frobenius q_v⁻¹ and HT number −1. Arithmetic Frobenius evaluates the same representation at the inverse group element.

For an elliptic curve write V_{E,ℓ}=T_ℓ(E)⊗ℚ_ℓ and H_{E,ℓ}=H¹_et(E_{F̄},ℚ_ℓ)=V_{E,ℓ}∨. Then det V_{E,ℓ}=ε_ℓ, while det H_{E,ℓ}=ε_ℓ⁻¹ and HT(H_{E,ℓ})={0,1}. The finite geometric Frobenius on H has polynomial X²−a_vX+q_v. Sym^m H has rank m+1, HT numbers {0,…,m} and determinant ε_ℓ^{−m(m+1)/2}. References using a Tate-module symbol are translated by this duality dictionary, never by changing Frobenius alone.

For a pure system of weight w, Frobenius roots have absolute value q_v^{w/2}. Its characteristic polynomial Q_v is monic of degree n, and its Euler denominator is P_v(T)=TⁿQ_v(T⁻¹). Thus Q=X−1 gives P=1−T, and Q=X²−aX+q gives P=1−aT+qT². At T=1/2 the first pair takes values −1/2 and +1/2 respectively. Every inverse evaluation in this identity requires a nonzero argument. Norms of finite primes exceed 1.

Set Γ_ℝ(s)=π^{−s/2}Γ(s/2) and Γ_ℂ(s)=2(2π)^{−s}Γ(s). A pure weakly compatible system gives its good-place partial Euler product. Full finite and infinite factors require strict compatibility with coherent Weil–Deligne and real-sign data. At a real place each paired Hodge type h<w/2 contributes Γ_ℂ(s−h); a middle line h=w/2 contributes Γ_ℝ(s−h) if c acts by (−1)^h, and Γ_ℝ(s−h+1) otherwise. For regular odd rank n, the corrected determinant conversion is

```text
d± = (n ± (−1)^(w/2+(n−1)/2) det(R)(c))/2.
```

The rank correction is needed because each exchanged two-dimensional Hodge pair has determinant −1. For H¹(E), c exchanges e and ē. On Sym² H¹, it exchanges e² and ē² and fixes eē: trace +1 and determinant −1. Since h=1 on the middle line, the middle factor is Γ_ℝ(s), and the complete real factor is Γ_ℝ(s)Γ_ℂ(s). For the trivial real character the factor is Γ_ℝ(s); for the sign character it is Γ_ℝ(s+1).

For elliptic symmetric powers the motivic completed function includes N_m^{s/2}. The factor is entire and nowhere zero since N_m is a positive integer and N_m^{s/2}=exp((s/2)log N_m). A unitary automorphic normalization uses the variable s−m/2. In particular a weight-two elliptic form has motivic center 1 and unitary center 1/2. Removing the conductor factor preserves entireness but changes the displayed functional equation.

Use ⊞ for the isobaric operation specified by the appropriate local or global Langlands classification, and ⊠ for an Arthur tensor summand. ν_b denotes the irreducible SL₂(ℂ)-module of dimension b, so ν₁ is orthogonal and ν₂ symplectic. Component-group signs are written additively in ℤ/2 when taking a determinant-one kernel: an odd-dimensional block contributes its coordinate, an even-dimensional block contributes zero. The central quotient is performed after this kernel. All parabolic inductions in the packet assertions are normalized inductions, and every Whittaker normalization names its datum.

The known, conditional and conjectural assertion types distinguish a theorem from an implication and from an unproved statement. In particular TWFL is a hypothesis of the classifications below, and Calegari–Geraghty's Conjecture B is a hypothesis of its potential-modularity consequences. Langlands functoriality and reciprocity are statements to define, not theorem-producing typeclass instances.

**Checks.**

- For the trivial rank-one Frobenius polynomial, reversing X−1 gives 1−X; at X=1/2 the values are −1/2 and 1/2. The empty matrix and the zero matrix of size two both have Euler denominator 1.
- Sym²H¹(E) has Hodge list [0,1,2] and determinant ε⁻³. Its conjugation matrix exchanges the first and third basis vectors and fixes the second, giving trace 1 and determinant −1.
- For residue cardinality q=9 the scale q^(3/2) is 27. Replacing q by the coefficient prime p=5 gives 5√5, whose square is 125 rather than 729.
- At z=−1 the angular character z/|z| has value −1, while z/z̄ has value 1. These functions cannot be interchanged in the weight-two real parameter.
- Rank n=1 means Sym⁰ and rank n=3 means Sym². The distinct pair (1,−1) has symmetric-square list (1,−1,1), so distinct roots alone do not imply all higher regularity conditions.
- In the GSp₄ boundary chamber, λ=(1,0;2) obeys λ₁−3≡c mod 2 and has minimal Sp₄ K-type (2,2); λ=(1,0;1) fails parity.

## Exact supplier contracts

### From Mathlib and the elliptic library

Use `Polynomial.reverse` and `Polynomial.eval₂_reverse_mul_pow` with their actual degree and nonzero-evaluation hypotheses. For every square matrix over a commutative ring, `Matrix.charpolyRev` is `det(1 − X • M.map C)` and `Matrix.reverse_charpoly` identifies it with the reverse characteristic polynomial. This includes singular matrices and the empty matrix; invertibility is not required. `Matrix.charpolyRev_eval_zero` gives constant term one. For `M=0` in dimension two, `charpoly(M)=X²` while `charpolyRev(M)=1`; treating the reversed polynomial as still monic of degree two would be wrong. Import these declarations rather than defining a second Euler-polynomial operation. Use `Matrix.trace` for the real-sign witnesses. Use `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.ProjGenLinGroup.map` and `Matrix.ProjectiveSpecialLinearGroup.toPGL` for the projective image inclusions. The last map is injective, the quotient map is surjective, and scalar extension is the induced map on central quotients. The finite sign kernel uses `AddSubgroup`, finite sums and `ZMod 2`. No algebraically closed, topological or Galois structure is inferred from these algebraic objects alone.

The elliptic library's Tate-module action and determinant are consumed with the cohomological comparison and characteristic-zero coefficient extension just described. Each theorem about H_{E,ℓ} must refer to that same representation; a detached matrix with the right determinant is insufficient.

### From the nonarchimedean analytic roadmaps

Use TauCetiRoadmap.PadicFunctionalAnalysis §§1.4,2.2–2.6 for finite Banach modules, potentially orthonormalizable modules, (Pr), countable-type splitting and bounded coefficient maps. CompactOperators §§0.1,0.4–0.5,1.7 supply finite-image approximation, the comparison with compactoid images over fields and completed scalar-extension laws, retaining their Noetherian, lifting and scalar-ring hypotheses. Complete continuity over an algebra means finite rank over that algebra; it is not finite rank over its coefficient field. These are imports, not operator-theory targets here.

For finite coefficient K/ℚ_p, import [LocallyAnalyticDistributions](https://github.com/TauCetiProject/TauCetiRoadmap/pull/854) §§0.0,0.2–0.3 for locally convex limits, Hausdorff quotients, strictness, completed tensor products and the analytic compact-type/strong-dual comparisons. Its §3.3 gives the distribution Mellin/character-space comparison. RigidAnalyticGeometry §7.3 supplies coherent sheaves on quasi-Stein exhaustions and their section comparison. These imports do not assert that the dagger distribution stages of Emerton’s construction are Noetherian Banach algebras, or prove his finite-slope coadmissibility criterion. Those relative comparisons and the Jacquet transition system are constructed in §4.3.

### Actual objects and comparison laws

The following contracts specify the common mathematical inputs of the layer statements. They require the same objects in the definition and in every law, with coefficient embeddings and localizations fixed.


<a id="contract-c-galois"></a>
#### C-GALOIS: from AutomorphicGaloisRepresentationsPartII, Layer AG2.2

Actual continuous representations of the absolute Galois group in finite coefficient fields and their algebraic closures; coefficient extension, restriction along actual number-field embeddings, integral lattices and semisimple residual reduction; Weil–Deligne realization of the same representation at each finite place. Realization π↦r_{π,ι} must commute with isomorphism, twists, duals and permitted base change, with the stated rec^T and Hodge–Tate identities. Complex conjugation, polarization multiplier and Hodge/sign data refer to that realization. Frobenius inversion is evaluation at inverse elements; a separate cohomological-duality dictionary is required before changing Hodge signs.

<a id="contract-c-automorphic"></a>
#### C-AUTOMORPHIC: from AutomorphicFormsOnReductiveGroups, Layer AF.1

Actual isomorphism classes of irreducible admissible local representations and global automorphic representations with a fixed field, reductive group and rank. Cuspidal, isobaric, regular algebraic, weight, local component, central character, twist and contragredient refer to those objects. Isobaric sums preserve multiplicities and their local parameters are direct sums. Local rec commutes with twists/duals and the all-place functorial-lift predicate uses the same components. The Langlands quotient over ℝ/ℂ and the archimedean Weil group have the specified LLC source scope; a rank label cannot supply these laws.

<a id="contract-c-system"></a>
#### C-SYSTEM: from PotentialModularityAndCompatibleSystems, Layer R24.5

A system consists of one number field, coefficient field, rank and finite bad set; actual continuous semisimple r_λ; monic Q_v and Hodge multisets. For each λ, r_λ is unramified away from the bad set and residue characteristic and has Frobenius characteristic polynomial equal to Q_v through the specified coefficient embedding. Purity constrains the roots of those same Q_v under every complex embedding. Symmetric powers, tensors, duals, twists, restriction and direct sums are the operations on r_λ and determine the new Q_v, rank, Hodge multiset and pairing; a constituent decomposition is an actual isomorphism at every λ. Strict compatibility additionally supplies coherent ramified WD and real-sign data. The L-function is the Euler product of these Q_v, with the reciprocal conversion above, and its conductor/gamma/epsilon factors use those WD and real data. For a cohomological Dwork fibre, good-place comparison identifies only the global semisimplification. Match coefficient embeddings; require semisimplicity separately before transferring a maximal local monodromy block.

<a id="contract-c-artin"></a>
#### C-ARTIN: from AnalyticNumberTheory, Layer AN.4

The full Artin L-function is constructed from the same finite-image continuous complex representation: finite local factors are the determinants on inertia invariants, with the specified Frobenius, and infinity factors use its complex-conjugation eigenspaces. Strong Artin matching supplies local parameters and all these factors at every place; weak almost-everywhere matching supplies only a partial product. Twists, direct sums and automorphic comparisons commute with these constructions. Entireness excludes the trivial rank-one representation.

<a id="contract-c-local-deformation"></a>
#### C-LOCAL-DEFORMATION: local components and lifting extensions

LocalGaloisDeformationRings supplies the framed fixed-residual generic fibres and their Hodge/type loci. The relation “connects” means that the two lifts define points on the same geometric irreducible component in that specified locus; it is not equality of residual representations alone. PotentialAutomorphyInfrastructure §§5.22–5.23 supplies ACC+'s Fontaine–Laffaille and ordinary lifting theorems. The additional [weight-zero connects theorem](#component-connects-lifting), [potentially semistable rank-two theorem](#potentially-semistable-cm-lifting) and [conditional general-field theorem](#general-number-field-lifting) are targets of Layer 2 below. Their hypotheses are not inferred from ordinary or Fontaine–Laffaille lifting. The Hilbert-field potentially Barsotti–Tate input is the actual GL2ModularityLifting §5.7 export, including the refined ordinary quotient condition.

<a id="contract-c-moduli"></a>
#### C-MODULI: from PotentialModularityAndCompatibleSystems, Layer R23.1

Moret–Bailly uses a smooth geometrically connected scheme over an actual number field; local open subsets of its base changes; and a returned point whose images lie in those opens under the returned field embeddings and completion isomorphisms. The extension has the stated Galois, disjointness and local properties. The twisted modular curve is descended from full level via the actual E[q] Galois cocycle, with Weil-pairing multiplier ε̄, and its points represent symplectic isomorphisms of the specified torsion modules.

<a id="contract-c-arthur"></a>
#### C-ARTHUR: from EndoscopicTransferAndUnitaryTraceComparison, Layer ET.3

Actual admissible L/Arthur homomorphisms into the specified L-group; centralizers and component-group quotients derived from those homomorphisms; finite local packet multisets with retained repetitions; Whittaker/inner-twist pairings; global restricted products and multiplicities as natural numbers. Orthogonal parameters satisfy the determinant-one relation before quotienting by the centre. Refined endoscopic character identities and global multiplicity formulas refer to these packets. Assume TWFL with the exact twisted stabilization, transfer factors and test-function normalizations specified above. KMSW 2014 generic pure-inner scope and its two nongeneric local inputs are kept distinct. Mœglin–Renard membership uses the two explicit branches stated at its node, with their separate quantifiers.

<a id="contract-c-coherent-geometry"></a>
#### C-COHERENT-GEOMETRY: from AutomorphicFormsOnReductiveGroups, Layer AF.4

The actual coherent cohomology eigensystem and attached GSp₄ Galois representation, with a number-field action on an actual abelian variety and its H¹ eigenspaces, are required for the two frontier predicates. The Hodge list is an independent numerical construction and does not prove the expected de Rham/crystalline claims. For Bianchi forms use actual Fourier coefficients, Hecke eigensystems and the Harder parabolic-cohomology comparison, not unrelated coefficient functions.

<a id="contract-c-equidistribution"></a>
#### C-EQUIDISTRIBUTION: from TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6

Compact-group characters and Haar probability are supplied by the existing CompactGroups roadmap, including its separate SU₂ symmetric-power classification and class-function completeness. Frobenius classes are the normalized semisimple classes of the same pure Galois realization. The norm is the actual number-field norm and multiplicity is bounded at each norm. The analytic criterion consumes Euler products of those classes with continuation and boundary nonvanishing for every nontrivial irreducible character; free classes/functions cannot supply equidistribution.

<a id="contract-c-categorical"></a>
#### C-CATEGORICAL: the geometric categories

The [categorical local construction](#categorical-llc-construction) owns the Bun_G coefficient categories, parameter stack, support conditions and spectral action needed to formulate Fargues–Scholze I.10.2, using the general stable-category foundations of EnhancedDerivedSheaves. A semisimple parameter map is a specialization of that construction. It does not supply these carriers or the conjectural equivalence. The torus specialization retains condensed group homology and the character gerbe.
### Required exports from neighbouring theories

Each assertion below is the exact export consumed here. A named layer supplies only its stated scope; when the export extends that scope it belongs to the corresponding Part II extension. The hypotheses on fields, local components, residual images and coefficient primes travel with the theorem.

#### From AnalyticNumberTheory, Layer AN.2

The Wiener–Ikehara/Tauberian prime number theorem for Euler products continuing to a neighbourhood of Re s ≥ 1 with no zeros or poles except at s = 1: Σ_{N(x)≤n} χ(x) = c·n/log n + o(n/log n) with −c the order at 1 (Kedlaya Theorem 24.2).

#### From AnalyticNumberTheory, Layer AN.4

Artin L-functions L(ρ, s) of continuous representations ρ : G_K → GL_n(ℂ) with finite image, their Euler products and their comparison with automorphic L-functions (used to state Langlands' conjecture for Artin representations).

Use the [C-ARTIN contract](#contract-c-artin) above.

#### From ArithmeticLocallySymmetricSpaces, Layer ALS.3

Use the Bianchi quotient, coefficient local systems, Hecke correspondences and cuspidal/parabolic cohomology in [upstream PR #871](https://github.com/TauCetiProject/TauCetiRoadmap/pull/871). The [Bianchi comparison](#bianchi-eichler-shimura) below constructs the missing Fourier-to-parabolic-cohomology identification; Hecke chain correspondences alone do not imply it.

#### From AutomorphicFormsOnReductiveGroups, §§5.5, 5.7 and 6.3–6.5

[Upstream PR #1037](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1037) supplies Clozel's purity lemma at its algebraic cuspidal scope, rationality and Aut(ℂ)-conjugation for regular algebraic cuspidal GLₙ, and the chamber, full-group and coherent-cohomology constructions for discrete series and their nondegenerate limits. The integral cohomological exponents differ from raw Weil exponents by `(1−n)/2`; the conversion is retained in [the purity application](#parallel-weight-and-clozel-purity). These are consumed, not re-planned. The full Adams–Johnson construction is a separate local target.

#### From AutomorphicGaloisRepresentations, Layer R19.2

Use the cohomological Hilbert/quaternionic realizations of [upstream PR #1007](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1007) with their actual field, weight, determinant and local–global conditions. Parallel weight one and finite-image Artin comparison are the [weight-one realization target](#hilbert-weight-one-realization) here; weight at least two does not provide them. One-dimensional realizations use global class field theory.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.0

Regular algebraic and polarized automorphic representations (π, χ) of GL_n(𝔸_F) for F CM or totally real, with BLGGT's conditions (χ_v(−1) independent of v | ∞, π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det), χ_v(−1) = (−1)^{n+w} for F imaginary with algebraic purity parameter w_alg=w), weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}_w and the level conditions (prime / potentially prime to l). Use the polarization and realization conventions above.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.2

BLGGT v4 Theorem 2.1.1: for regular algebraic cuspidal polarized (π, χ), a semisimple r_{l,ı}(π) with (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) totally odd polarized, local–global compatibility ıWD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) pure of motivic weight w_alg+n−1 at v ∤ l (Caraiani), de Rham with HT_τ = {a_{ıτ,i} + n − i}, and the same compatibility at v | l when π_v has Iwahori-fixed vectors; plus Geraghty's ordinarity comparisons (6)–(7). Also: r_{π,ι} for RAESDC and RAECSDC π over totally real and CM fields with local–global compatibility at every finite place (Caraiani), as used by Newton–Thorne 2026 §1.2 and Lemma 2.1, and the compatible systems R_π of ACC+ §7.1 (Harris–Lan–Taylor–Thorne, Scholze, Varma) for regular algebraic cuspidal π over CM fields.

Use the [C-GALOIS contract](#contract-c-galois) above.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.3

Import the Chenevier–Harris definite-unitary eigenvariety at AG2.3's stated scope: even rank, even totally real degree, a single varying p-place, the specified tame Bernstein component and spherical level at nonsplit places. The all-p-place completed-forms/Jacquet eigenvariety E_n of Newton–Thorne I §2 is the separate [construction target](#symmetric-power-method-prerequisites) here.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.5

Varma's local–global compatibility (semisimplified, with the monodromy bound) for regular algebraic cuspidal π over CM fields, used for temperedness at ramified places in BCGNT Theorem 7.1.1. In Qian’s Steinberg argument compare at the auxiliary prime λ′≠l where the fibre is semisimple; preserve the maximal Jordan-block conclusion. Transport at λ alone identifies its global semisimplification.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.2

Godement–Jacquet: for cuspidal π on GL_n(𝔸_F), L^S(π, s) is entire (n ≥ 2) and satisfies the standard functional equation, with twists by finite-order characters; used through a Brauer-induction argument in BLGGT Corollary 5.4.3. Also: the Jacquet–Shalika bound for Satake parameters of unitary cuspidal representations (AL.2/jacquet-shalika-satake-bound), used for purity from symmetric powers (BCGNT Lemma 6.1.3, ACC+ Corollary 7.1.13).

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.3

For unitary cuspidal π, π′ on GL_n, GL_{n′}, L^S(π×π′^∨,s) is meromorphic and is holomorphic and nonzero at s=1 unless n=n′ and π≅π′, when it has a simple pole. For nontrivial norm twists track the shifted pole location explicitly (Jacquet–Shalika 1981, Shahidi 1981); used in BLGGT Theorem 5.5.2. Also: L(Π, s) ≠ 0 on Re s = 1 for cuspidal Π on GL_n (Jacquet–Shalika), used for Sato–Tate. Also: strong multiplicity one for cuspidal and isobaric representations (AL.3/strong-multiplicity-one) and the simple pole of L^S(s, π × π^∨) at s = 1 (Jacquet–Shalika), used for the symplectic/orthogonal dichotomy and the uniqueness of functorial lifts.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.4

[Upstream PR #924](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924) supplies the unramified L-group factor construction and its convergence domain. Analytic continuation, functional equations, poles and boundary nonvanishing require the separate [Langlands–Shahidi analytic target](#langlands-shahidi-analytic-inputs) below. They are not consequences of the factor definition.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer 4 (legacy ET.3)

Import ordinary smooth matching and the twisted ordinary fundamental lemma from §§4.7 and 4.10. The additional weighted transfer and stabilization enter through [TraceClassificationInputs](#weighted-trace-classification-inputs); retain TWFL and its non-split weighted and non-standard weighted inputs as hypotheses; the additional weighted constructions and their conditional proofs are specified there.

Use the [C-ARTHUR contract](#contract-c-arthur) above.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer 6 (legacy ET.4)

Import the restricted simple unitary comparison and the elliptic stabilization of §6.18 with their test-function hypotheses. The full twisted weighted stabilization of Mœglin–Waldspurger is the extra [local target](#weighted-trace-classification-inputs), not an export of that simple comparison.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer 10 (legacy ET.6)

The local Langlands correspondence for GL_n over p-adic fields (Harris–Taylor, Henniart, Scholze), rec_K, with its compatibility with twists, duals, central characters and L/ε-factors of pairs, used to define local parameters of automorphic representations and functorial lifts.

#### From EndoscopicTransferAndUnitaryTraceComparison, §§6.24, 6.26–6.27 (legacy ET.7a)

Import strong cyclic base change and descent from §6.24, and weak cyclic automorphic induction with its orbit criterion from §6.26. The [induction comparison](#automorphic-induction-register) specifies the additional all-place requirement. Labesse's unitary base change is consumed with its stated local conditions in the Steinberg-at-q and unitary-descent arguments.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R16.3

The local Langlands correspondence for GL₂ (parameters of principal series, Steinberg and supercuspidal representations), as used by Gelbart–Jacquet's lift and by Gan–Takeda.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R17.5

Automorphic induction of Hecke characters of quadratic fields to GL₂ and the soluble (dihedral, tetrahedral, octahedral) Artin modularity for weight one, with the Kim–Shahidi inputs for the icosahedral case as they are stated there; used for Newton–Thorne II Theorem A.1.

#### From GL2ModularityLifting, §5.7

Import Kisin's odd-prime potentially Barsotti–Tate theorem over a totally real field: continuous geometric rank two, cyclotomic-times-finite-order determinant, strong residual modularity, residual absolute irreducibility over the cyclotomic extension, residue field 𝔽ₚ at non-potentially-ordinary p-places, and the p=5 projective PGL₂ exception. For split ordinary residual characters the modular witness must match the quotient character, or satisfy the indecomposable/trivial reduction arrangement used by Kisin. This is the actual [§5.7 contract](../GL2ModularityLifting/README.md), sourced by Kisin (3.5.4)–(3.5.5), pp.72–73; residual modularity alone does not discharge strong residual modularity. [The mod-5 application](#non-solvable-residual-modularity) explains the local choices and soluble descent.

#### From GlobalGaloisDeformations, Layer R04.2 (universal deformation ring)

Under Φ_p and Schur residual representation (here absolutely irreducible), the strict-equivalence deformation functor is pro-represented by a complete local Noetherian ring. Finite-image tangent-space vanishing in CG Lemma4.14 is a separate class-field argument, not part of this representability theorem.

#### Theta and descent interfaces

The [local theta construction](#theta-and-metaplectic-descent) below owns the oscillator representation and isometry-pair Howe duality; [the local descent target](#local-descent-mp2n) owns the metaplectic descent and its globalization. The real compact-theta and similitude extensions are recorded with their separate source boundaries. Their full local-field scope cannot be obtained from elementary theta modules or an outside-order roadmap name.

#### From PadicFamilies, Layer L2

Finite-slope eigenvarieties: the Coleman–Mazur eigencurve E for GL₂/ℚ (tame level N, prime p) with its weight map κ, slope map and the classical points (f, α); and the abstract finite-slope machine in §§2a.10–2a.14 of [PR #1019](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1019). AG2.3 of [PR #1006](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1006) gives the Chenevier–Harris definite-unitary instance, with its even-rank, even-degree, one varying p-place and spherical nonsplit-place conditions. Newton–Thorne’s completed-forms/Jacquet construction at all p-places is the additional [local target](#symmetric-power-method-prerequisites); neither supplier is claimed to give that instance.

#### From PotentialAutomorphyInfrastructure, Layer PA.2

ACC+ Theorem 5.5.1 (local–global compatibility at p for ordinary parts over CM fields, decomposed generic residual representation) and the ordinarity comparison of ACC+ Corollary 5.5.2.

#### From PotentialAutomorphyInfrastructure, Layers 2–5

Import soluble CM base change and descent, residual-image/disjointness preservation, ordinary local–global compatibility, and ACC+ Theorems 6.1.1–6.1.2 from §§5.22–5.23 with every image, scalar, weight, level and prime condition. The Fontaine–Laffaille theorem uses p>n² and p unramified in the field; the ordinary theorem uses p>n and its ordinary regular local conditions. The [additional lifting targets](#component-connects-lifting) are distinct. Layer 2 here owns the polarized ordinary/potentially diagonalizable comparisons and Dwork construction needed beyond these exports.

#### From PotentialModularityAndCompatibleSystems, Layer R23.1

Moret-Bailly's theorem: points of a smooth geometrically connected variety over a Galois extension unramified at a given set, with prescribed local behaviour and linear disjointness (used for Dwork-family points, twisted modular curves X_E(q) and auxiliary elliptic curves).

Use the [C-MODULI contract](#contract-c-moduli) above.

#### From PotentialModularityAndCompatibleSystems, Layer R24.5:operations

Weakly, very weakly and extremely weakly compatible systems of l-adic representations (BLGGT §5.1; ACC+ §7.1), purity, symmetric powers and duals of systems, and their partial L-functions.

#### From TauCetiRoadmap.Chebotarev, Layer 10

Chebotarev density in Dirichlet density form, to compare Galois representations through traces of Frobenius and to choose auxiliary primes of density one.

#### From TauCetiRoadmap.ClassFieldTheory, Layer 11

Finite archimedean reciprocity sends ℝ× to Gal(ℂ/ℝ), with kernel ℝ_{>0}, and ℂ× to the trivial absolute Galois group, as in ACC+'s finite-order conventions. This is distinct from Weil abelianization: W_ℝ^ab≅ℝ× and W_ℂ=ℂ×, which supplies all archimedean characters for local Langlands and gamma factors through AutomorphicLFunctionsAndLocalFactors's archimedean theory.

#### From TauCetiRoadmap.ClassFieldTheory, Layer 7

The local Artin map Art_K normalised so that uniformisers go to geometric Frobenius, for the definition of L(ρ) in BCGP Definition 2.3.1.

#### From TauCetiRoadmap.ModularCurves, Layer 10

The compactified modular curve X(q) and its cusps, for the twisted modular curve X_E(q).

#### From TauCetiRoadmap.ModularCurves, Layer 5

The fine moduli scheme Y(q) of elliptic curves with full level-q structure (q ≥ 3) over ℤ[1/q], twisted by E[q] to give Y_E(q).

#### From TauCetiRoadmap.ReductiveGroups, Layer 6

Connected reductive groups over local and global fields, quasi-split forms and their (Langlands) dual groups and L-groups, for the definitions of L-parameters and the statements of functoriality.

#### From TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5

The Peter–Weyl matrix-coefficient theorem. The character completeness needed for Serre's criterion is the class-function result of Layer 6 below; finite linear combinations are dense, rather than equal to all continuous class functions.

#### From TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6

Characters and Haar measure of compact groups such as U₂(ℝ)_a, for the Sato–Tate groups of BCGNT §7.2.

Use the [C-EQUIDISTRIBUTION contract](#contract-c-equidistribution) above.

#### From PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions)

Reuse the completed L-function definition, strict/pure/regular and real-sign hypotheses, monic-to-reciprocal Euler conversion, and corrected odd-rank determinant sign. No duplicate completed-function definition belongs to Layer 0.

#### From EllipticCurveModularity, Layer R29.6

Modularity of every elliptic curve over ℚ with full local-factor comparison, to apply NT non-CM symmetric powers in the Sato–Tate criterion.

#### From PotentialModularityAndCompatibleSystems, Layer R24.5

Import weak-system carriers, their actual operations, the BLGGT extremely regular decomposition, and completed L-functions with strict ramified and real data. The [Patrikis–Taylor constituent theorem](#patrikis-taylor-potential-automorphy) here extends the decomposition to pure regular polarized systems and a common extension for a finite family. It does not assert that a reducible sum is cuspidal.

#### Comparisons constructed in this roadmap

The [refinement definition](#accessible-regular-refinement) precedes the [Layer 4 method targets](#symmetric-power-method-prerequisites). The [Adams–Johnson construction](#adams-johnson-construction) precedes the real-packet comparison, and the [categorical construction](#categorical-llc-construction) precedes the categorical conjecture. The [abelian-surface implication](#regular-weight-serre-implies-abelian-surface-modularity) consumes the full classification hypotheses; it is not an additional export from a neighbouring theory.

### Conventions and imported comparisons

<a id="blggt-normalization-register"></a>
#### Polarization and the automorphic realization

Import polarized regular algebraic cuspidal automorphic pairs (π,χ) from AutomorphicGaloisRepresentationsPartII, Layers AG2.0 and AG2.2. For imaginary CM F, πᶜ ≅ π∨ ⊗ (χ∘N_{F/F⁺}∘det), with χ a character of (F⁺)×\𝔸_{F⁺}× and its archimedean sign independent of the real place. If the dominant weight a satisfies a_{τ,i}+a_{τc,n+1−i}=w, use χ_v(−1)=(−1)^{n+w}. The infinitesimal character is that of Ξ_a∨. The associated representation has Hodge–Tate multiset {a_{ιτ,1}+n−1,…,a_{ιτ,n}}, multiplier ε_ℓ^{1−n}r_{ℓ,ι}(χ), and is totally odd. For v∤ℓ its Frobenius-semisimplified Weil–Deligne parameter is rec(π_v⊗|det|_v^{(1−n)/2}); the same comparison at v|ℓ requires the stated Iwahori hypothesis. Changing the coefficient isomorphism uses Clozel's conjugate representation σπ, with σ acting on the finite part and permuting the archimedean weights, followed by the AG2.2 compatibility and Chebotarev comparison. Changing ι need not preserve π. These are the imported conventions of BLGGT §2.1, pp. 32–34.

For imaginary CM F, n = 2 and pure weight w = 0, χ_v(−1) = +1 and ε_l^{−1}r_{l,ı}(χ) is −1 at complex conjugation. Repeat with w = 1: χ_v(−1) = −1, while r_{l,ı}(χ)(c_v) = (−1)^wχ_v(−1) = +1, so the multiplier is again −1. At weight 0, HT_τ = {n − 1, …, 0}; at pure weight w the signs must use n+w rather than n alone.

([BLGGT](#ref-blggt-2014-v4), §2.1, p. 32 (arXiv v4); [BLGGT](#ref-blggt-2014-v4), §2.1, Theorem 2.1.1, pp. 33–34 (arXiv v4); [Clozel](#ref-clozel-1990), Theorem 3.13, p. 112, proof pp. 112–129.)

*Needs:* AutomorphicGaloisRepresentationsPartII, Layer AG2.0; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-GALOIS](#contract-c-galois).

<a id="blggt-version-register"></a>
#### BLGGT edition concordance

The BLGGT citations use arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014), 501–609. PotentialModularityAndCompatibleSystems part R24.3 cites arXiv v1 (2010). Correspondence: v1 §2.2 (minimal lifting, Theorem 2.2.1) = v4 §2.3 (Theorem 2.3.1); v1 §2.3 (ordinary lifting, Theorem 2.3.1) = v4 §2.4 (Theorem 2.4.1, now also for totally real F); v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Proposition 5.2.2) = v4 §5.3 (Lemma 5.3.1, Proposition 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Theorem 5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4) = v4 §5.4 (Theorem 5.4.1 with Corollary 5.4.2, Corollary 5.4.3, Corollary 5.4.4, Proposition 5.4.6); v1 §5.4 (Theorems 5.4.1–5.4.3) = v4 §5.5 (Theorems 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states the lifting theorems for polarized (r, µ) with the "potentially diagonalizably automorphic" hypothesis.

([BLGGT](#ref-blggt-2014-v4), title page and table of contents, p. 1 (arXiv v4).)

*Needs:* [Polarization and the automorphic realization](#blggt-normalization-register); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="arthur-dependency-gate"></a>
#### The twisted weighted fundamental lemma

Use the twisted weighted fundamental lemma in the precise form of Mœglin–Waldspurger II.4.4 as a named hypothesis, abbreviated TWFL. Its reduction requires the weighted Lie-algebra lemma for non-split groups and the non-standard weighted variant. The unweighted fundamental lemma does not imply TWFL. Arthur’s Hypothesis 3.2.1 requires stabilization of the twisted trace formula for GL_N and SO_{2n}; Mœglin–Waldspurger supply this stabilization and the input [A24]. Atobe–Gan–Ichino–Kaletha–Mínguez–Shin supply the local intertwining inputs [A25]–[A27]. Their arXiv v3, §0.4, p. 15 distinguishes the proved unweighted lemma from the remaining weighted assumptions. The classifications and their consequences below are implications from TWFL together with these specified trace formula and intertwining theorems.

([BCGP, potential modularity](#ref-bcgp-2021), §1.4.1 'The work of Arthur', p. 14 (arXiv v3); [BCGP, modularity](#ref-bcgp-2025), §1.6 'The work of Arthur', pp. 7–8 (arXiv v1); [Local intertwining relations and co-tempered A-packets of classical groups](#ref-agikms-2024), Abstract, p. 1 (arXiv v3); [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript).)

*Needs:* [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTHUR](#contract-c-arthur).

<a id="nt26-normalisation-bridge"></a>
#### Frobenius inversion and cohomological duality

Newton–Thorne §1.2 and BLGGT use the same geometric Frobenius, HT(ε)={−1} and Tate-normalized recᵀ(π_v)=rec(π_v⊗|det|_v^{(1−n)/2}). Evaluating a representation at arithmetic Frobenius inverts the Frobenius matrix. It does not change the representation into its dual and leaves its Hodge–Tate multiset unchanged. A cohomological comparison with r∨ is a separate isomorphism of representations; only that isomorphism negates Hodge–Tate numbers. Require the realization dictionary from AutomorphicGaloisRepresentationsPartII rather than infer it from reciprocity.

([Newton–Thorne, Hilbert](#ref-nt-2026), §1.2 Notation, p. 8 (arXiv v2) (geometric-Frobenius Art_K, rec^T, r_{π,ι}, HT convention); Frob_v convention p. 7.)

*Needs:* [Polarization and the automorphic realization](#blggt-normalization-register); AutomorphicGaloisRepresentationsPartII, Layer AG2.0; [C-GALOIS](#contract-c-galois).

<a id="weight-one-separation-register"></a>
#### Field and weight boundaries

ClassicalSerreModularity, Layer R27.6, supplies rational weight-one descent and odd Artin modularity; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, supplies the soluble cases. Its R17.4 supplies rank-two base change. EllipticCurveModularity supplies elliptic modularity over ℚ and its Galois comparison. The retained results extend to totally real weight one, irregular compatible systems, non-solvable residual representations, and the stated imaginary-quadratic modularity criterion. Over an arbitrary number field the elliptic conclusion is potential modularity, with Calegari–Geraghty’s Conjecture B kept as a hypothesis where required.

([Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.1, paragraph after Theorem 10.1, p. 20 (author copy results.pdf).)

*Needs:* [ClassicalSerreModularity §R27.6, rational odd Artin modularity](../ClassicalSerreModularity/README.md); [The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images](#totally-real-odd-artin); [Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton)](#imaginary-quadratic-elliptic-modularity); [Assertions with explicit hypotheses](#endpoint-status-register); [Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))](#irregular-systems-weight-one); [Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant](#non-solvable-residual-modularity); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="trace-formula-inputs-register"></a>
#### Trace formula and intertwining inputs

Import the invariant trace formula from AutomorphicSpectralTheory AS.6, ordinary smooth transfer and twisted ordinary fundamental lemma from EndoscopicTransferAndUnitaryTraceComparison §§4.7, 4.10, its GL Rankin–Selberg normalization §5.2 and elliptic stabilization §6.18. These exports are not the entire Mœglin–Waldspurger twisted weighted stabilization. The [local trace-classification input target](#weighted-trace-classification-inputs) constructs the weighted stabilization and the stated co-tempered intertwining extension. TWFL remains a hypothesis. Any inner-form or archimedean intertwining input required by a classification is retained at that classification’s explicit group and parameter scope; the nonarchimedean quasi-split theorem is not promoted to it.

*Needs:* AutomorphicSpectralTheory AS.6; EndoscopicTransferAndUnitaryTraceComparison §§4.7, 4.10, 5.2, 6.18; [TWFL](#arthur-dependency-gate); [weighted and local intertwining target](#weighted-trace-classification-inputs).

<a id="symplectic-branch-status"></a>
#### The classification input for the symplectic branch

Gee–Taïbi’s discrete-spectrum classification of GSp₄ uses Arthur’s classification for Sp₄ and SO₅, restriction to Sp₄, and the similitude character. The descent, reducibility and packet-switching consequences therefore assume TWFL and the trace formula inputs just specified. The unitary classifications alone do not provide this symplectic classification. The same hypotheses accompany the modularity implications for abelian surfaces.

([BCGP, potential modularity](#ref-bcgp-2021), §1.4.1, p. 14 (arXiv v3).)

*Needs:* [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="automorphic-induction-register"></a>
#### Automorphic induction and its cuspidality criterion

Import weak cyclic automorphic induction from EndoscopicTransferAndUnitaryTraceComparison §6.26 ([PR #999](https://github.com/TauCetiProject/TauCetiRoadmap/pull/999)). Arthur–Clozel III Definition 6.1 and Theorem 6.2, p.215, define and prove the almost-everywhere matching. In prime degree, invariance gives an isobaric sum of character twists of a descent, and a noninvariant cuspidal input gives a cuspidal induction; Lemmas 6.3–6.4, pp.217–218, prove the alternatives. Corollary 6.5, pp.218–219, handles the stabilizer decomposition in general cyclic degree. The cuspidality criterion is a full orbit of size [L:F], not merely noninvariance under one chosen generator in composite degree.

The strengthening constructed here is `automorphicInduction_allPlace`. For a cyclic extension L/F of degree d and a unitary cuspidal σ on GL_m(𝔸_L), its unique isobaric induction satisfies, at **every** place v,

`rec(AI_L/F(σ)_v) = ⊕_{w|v} Ind_{W′_{L_w}}^{W′_{F_v}} rec(σ_w)`.

At nonarchimedean places use Weil–Deligne parameters, including monodromy; at real and complex places use the archimedean Weil group. Extend the construction to unitary isobaric sums by additivity, and to essentially unitary cuspidal inputs by a common norm twist. This is the ordinary LLC normalization. The rank-dependent Tate twists in C-GALOIS are required when translating it into a statement about Galois representations.

[Henniart, global induction](#ref-henniart-induction), Theorems 3 and 5, pp.5,7, and §3.7 with its Remark, p.16, supply this all-place strengthening. The proof first constructs the unique global isobaric object by base change and the κ-self-twist condition (§2.6, pp.11–12). At each finite place, Theorem 6 characterizes local induction among **generic unitary** representations by those same two conditions. Prove the necessary local base-change transitivity by globalization with a second cuspidal place (§§3.1–3.2, pp.13–14). Prove the image and fibres on generic unitary representations by separating their essentially square-integrable constituents and their real exponents (§§3.4–3.5, p.15). Globalize the square-integrable constituents to identify that characterized object with local induction (§3.6, p.16). Theorem 5 now follows from the global construction and local characterization. The Remark in §3.7 applies the archimedean version of the same characterization. These are explicit additional targets over the weak supplier; almost-everywhere uniqueness alone does not prove them.

Include the exact local-factor normalization in the export. With ψ_w=ψ_v∘Tr_{L_w/F_v}, the induced parameter has L-factor `∏_{w|v} L(s,rec(σ_w))` and epsilon factor `∏_{w|v} λ(L_w/F_v,ψ_v)^m ε(s,rec(σ_w),ψ_w)`, where λ is the induction constant for the trivial one-dimensional parameter (the ratio of its induced epsilon factor to its epsilon factor over L_w). Thus ramified induction includes its induction constant; it does not assert an uncorrected equality of epsilon factors. The archimedean equality includes the resulting Γ_ℝ and Γ_ℂ factors. Quadratic Hecke-character induction is already supplied by ET §13.3 and the GL₂ monomial theorem and is imported there.

**Checks.**

- In degree one induction is the identity.
- In prime degree an invariant cuspidal input gives d constituents, rather than a cuspidal rank-md object.
- In degree four a representation with stabilizer of order two has orbit two and is not cuspidal after induction.
- Almost-everywhere Euler matching by itself does not specify a ramified WD monodromy operator.

([Arthur–Clozel](#ref-arthur-clozel-1989), III §6, pp.214–219; [Henniart, global induction](#ref-henniart-induction), §§1.12,2.6–2.7,3, pp.6,11–16.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison §§6.24, 6.26 and 13.3; AutomorphicLFunctionsAndLocalFactors, strong multiplicity one and local functional equations; GL2AutomorphicRepresentationsAndTransfer R17.4–R17.5; [C-GALOIS](#contract-c-galois).

## How to read the build

Layer 0 fixes assertion logic and numerical realization comparisons. Layer 1 defines all-place lifts and establishes the weight-one and low-rank cases, including the concrete projective-image condition. Layer 2 constructs controlled potential-automorphy extensions and compatible-system consequences. Layer 3 supplies the classical-group packet and descent comparisons, with their explicit trace formula assumptions. Layer 4 constructs the symmetric-power methods and combines them with these inputs to obtain full functoriality, purity and equidistribution results. Layer 5 gives generic transfers and precise Langlands conjectural predicates and implications. Mathematical objects whose full carriers require the supplier theories are specified here in prose; Suggested.lean records only representative signatures on existing list, polynomial, weight, projective-group and sign-vector objects.

## Layer 0: assertions and realization comparisons

<a id="endpoint-status-register"></a>
### 0.1 Assertions with explicit hypotheses

Define an assertion record for a proposition P with its source and locator, a finite list H of named mathematical hypotheses, and references to the statements supplying its inputs. The three constructors are known, conditional and conjectural. A known assertion includes a proof of P and has H empty. A conditional assertion includes a proof of (∀ h ∈ H, h) → P. A conjectural assertion contains the statement without a proof. The conditional-to-known operation takes proofs of every member of H; it preserves P and its citation. An empty list makes the implication unconditional, although it does not change the original constructor. References to supplying statements are annotations; the mathematical implications must actually be proved.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.EndpointRecord`: The proof-carrying assertion record just defined.
- `TauCeti.LanglandsRegister.Status`: The three statuses known, conditional and conjectural.
- `TauCeti.LanglandsRegister.EndpointRecord.holds_of_hypotheses`: For a conditional record, (∀ h ∈ H, h) → P.
- `TauCeti.LanglandsRegister.EndpointRecord.upgrade`: From a conditional record and proofs of all its hypotheses, a known record with the same statement.
- `TauCeti.LanglandsRegister.EndpointRecord.known_holds`: A known record yields a proof of P.

Use a sum of proof-carrying constructors. Project the stored proof in the known case and apply the stored implication in the conditional case; the conjectural constructor has no proof projection.

**Checks.**

- The assertion 2+2=4 with its proof has tag known and an empty hypothesis list.
- A conditional record of 3=4 with the explicit named hypothesis 1=2 retains the conditional tag and its single hypothesis. The implication is proved from that concrete hypothesis; there is no proof of the assertion alone.
- A conjectural assertion 3=4 can be recorded without a proof; constructing this record does not imply 3=4.
- A known record of 2=2 cannot satisfy the missing hypothesis 1=2 of a conditional record. The upgrade interface takes proofs of the actual listed assertions; an unrelated known record is not such an argument.
- For a conditional record with H = [], holds_of_hypotheses proves its assertion without inputs and upgrade can produce a known record; the original conditional tag need not equal known.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429.)

*Needs:* [BLGGT edition concordance](#blggt-version-register).

<a id="compatible-system-automorphic-l-function-comparison"></a>
### 0.2 L-functions of the compatible system of an automorphic representation

Let π be regular algebraic cuspidal and let R_π be its attached compatible system. Unramified local–global compatibility implies L^S(R_π,s)=L^S(π,s+(1−n)/2) on a right half-plane, hence on any common meromorphic continuation. For equality at infinity in the ACC+ argument require R_π pure and the density-one generic-irreducibility hypothesis of ACC+ Theorem 7.1.1 (and its applicable field setting); matching Hodge weights alone does not supply real signs. Equality of full completed functions additionally requires compatibility at every ramified finite place and coherent epsilon factors. Under these named hypotheses Λ(R_π,s) inherits the corresponding shifted automorphic continuation and functional equation.

π regular algebraic cuspidal; R_π attached through the appropriate AG2.2 realization and local–global compatibility. For the archimedean comparison via ACC+ Theorem 7.1.1: purity and its density-one generic-irreducibility condition. For the completed comparison: all finite Weil–Deligne and epsilon-factor compatibilities.

State the resulting comparison as `TauCeti.LanglandsRegister.completedL_automorphic`.

Use the reciprocal Euler polynomial obtained from unramified local–global compatibility, with the shift (1−n)/2. Use ACC+ Theorem 7.1.1 only with its purity and density-one generic-irreducibility inputs; use the exact AG2 ramified comparison in addition to almost-everywhere equality. Apply AL.2 to the full matched automorphic function. The typed realization and local-factor compatibilities are exactly the C-GALOIS/C-SYSTEM/C-AUTOMORPHIC supplier contracts.

For n = 2 and π attached to an elliptic curve E/ℚ: L(R_π, s) = L(E, s) and Λ(E, s) = N^{s/2}Γ_ℂ(s)L(E, s) satisfies Λ(E, s) = ±Λ(E, 2 − s).

([ACC+](#ref-acc-2023), §7.1, paragraph after the proof of Lemma 7.1.10 (before Theorem 7.1.11), arXiv v2 p. 200 (Annals p. 1095).)

*Needs:* [PotentialModularityAndCompatibleSystems §R24.5, system L-functions](../PotentialModularityAndCompatibleSystems/README.md); [Polarization and the automorphic realization](#blggt-normalization-register); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois).

<a id="nt26-automorphy-predicate"></a>
### 0.3 Automorphic Galois representations in Newton–Thorne's sense

Let F be a totally real or CM number field and p a prime. A continuous representation ρ : G_F → GL_n(Q̄_p) is automorphic if there are a RAESDC or RAECSDC (regular algebraic, essentially (conjugate) self-dual, cuspidal) automorphic representation π of GL_n(𝔸_F) and an isomorphism ι : Q̄_p ≅ ℂ with ρ ≅ r_{π,ι}, normalised as in [Frobenius inversion and cohomological duality](#nt26-normalisation-bridge). The definition forces ρ to be (conjugate-)self-dual up to twist and conjecturally irreducible; Newton–Thorne note that it is not the most general one could adopt.

F totally real or CM; p prime; π RAESDC or RAECSDC, so that r_{π,ι} exists (AutomorphicGaloisRepresentationsPartII AG2.2).

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.IsAutomorphicNT`: ρ≅r_{π,ι} for some regular algebraic essentially (conjugate) self-dual CUSPIDAL π and an isomorphism ι:Q̄_p≅ℂ. An isobaric sum does not qualify.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.of_iso`: Invariant under isomorphism of ρ.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.twist`: ρ automorphic and χ an algebraic Hecke character's Galois character ⇒ ρ ⊗ r_ι(χ) automorphic.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.iff_blggt`: For an irreducible polarized pair (ρ,µ) with the actual compatible automorphic polarization character in the BLGGT convention: IsAutomorphicNT ρ iff the pair (ρ,µ) is BLGGT-automorphic. The multiplier/Hecke-character comparison is part of the supplier contract; irreducibility alone is not asserted to make an unspecified multiplier unique.
- `TauCeti.LanglandsRegister.IsAutomorphicNT.irreducible`: Conjectural consequence: the cuspidal realization is expected irreducible in general. No theorem asserting this is proposed; use proved rank-two irreducibility or the precise density/regularity results when applicable.

Use the automorphy definition in the paragraph before Newton–Thorne Lemma 2.1, in the pinned realization conventions of Layer 0. Compare with the actual BLGGT polarized-pair definition from PL.0. Fix the Hecke polarization character and its realized multiplier, then use strong multiplicity one and Chebotarev on the same representation; retain that character compatibility in the exported comparison.

**Checks.**

- For E/ℚ, the cohomological realization H¹_et(E_{ℚ̄},Q̄_p) (the dual of the usual Tate module) is automorphic via its weight-two form, in the NT convention HT(ε_p)={−1}; the Tate-module duality is explicit.
- n = 1: ρ is automorphic iff ρ = r_ι(χ) for an algebraic Hecke character χ (class field theory).
- ρ = 1 ⊕ ε_p^{−1} is not automorphic in this sense: an isobaric sum is not cuspidal.
- The Galois representation of a weight-one newform is not automorphic in this sense: π is not regular algebraic.

The predicate depends only on ρ up to isomorphism and is independent of ι when π is cohomological (r_ι(π) for another ι′ is r_{ι′}(π′) for a Galois conjugate π′).

([Newton–Thorne, Hilbert](#ref-nt-2026), §2 ('Some comforting lemmas'), opening paragraph immediately before Lemma 2.1, p. 9 (arXiv v2).)

*Needs:* [Frobenius inversion and cohomological duality](#nt26-normalisation-bridge); AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized automorphic representation); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-GALOIS](#contract-c-galois).

<a id="singular-weight-hodge-list"></a>
### 0.4 The four predicted Hodge numbers

For k∈ℕ and r∈ℤ define singularWeightHodgeList(k,r)=[0,r−2,r+k−1,k+2r−3] as a list, retaining all four positions and any repetitions. It is duplicate-free exactly when r≠2, k+r≠1 and k+2r≠3. Nonnegativity of k makes the fourth pairwise difference k+1 nonzero. The list is the explicit numerical input to the singular-weight Hodge prediction; realization as Hodge–Tate weights is a separate conjectural assertion.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.singularWeightHodgeList`: The stated list, with four positions even when values coincide.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_length`: Its length equals four.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_nodup_iff`: No repeated entries iff the three exclusions hold, for k≥0.
- `TauCeti.LanglandsRegister.singularWeightHodgeList_r_two`: H(k,2)=[0,0,k+1,k+1].

Compare the six pairwise differences. Three independent exclusions remain because k+1 is positive; the duplicated differences give the same equations.

**Checks.**

- H(2,1)=[0,−1,2,1], with no repetition.
- H(3,2) repeats entries.
- H(0,2)=[0,0,1,1].
- H(0,1)=[0,−1,0,−1] repeats entries through k+r=1, even though r≠2.

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), Remark 5.3.2, pp. 25–26, author manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="expected-crystallinity-newton-above-hodge"></a>
### 0.5 Expected de Rham and crystalline properties of GSp₄ Galois representations in singular weight (Pilloni Remark 5.3.2)

ExpectedSingularWeightHodge is the proposition: for a system of Hecke eigenvalues Θ occurring in the coherent cohomology H^i(S^tor_{K,Σ}, Ω^{(k,r)}), (k, r) ∈ ℤ_{≥0} × ℤ (or its cuspidal version), of the Siegel threefold, the attached semisimple ρ_{Θ,λ} : G_ℚ → GL₄(E_λ) is de Rham at p with Hodge–Tate weights (0, r − 2, r + k − 1, k + 2r − 3) (cyclotomic character of weight −1), and crystalline at p if (N,p)=1. When (N,p)=1, the Newton polygon of the p-local Hecke parameters lies above the stated Hodge polygon, with equal endpoints. Status: conjectural in general; at good p in cohomological weight (r ≠ 2, k+r ≠ 1, k+2r ≠ 3), Pilloni cites V. Lafforgue for this Newton inequality. That cited conclusion does not certify the entire expected de Rham/crystalline assertion.

Frontier assertion: conjectural in general. The cited known Newton inequality requires (N,p)=1 and cohomological weight; it is distinct from the full de Rham/crystalline assertion.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge`: The proposition stated.
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.hodgeTate`: The expected Hodge–Tate weights are (0, r − 2, r + k − 1, k + 2r − 3).
- `TauCeti.LanglandsRegister.ExpectedSingularWeightHodge.cohomological`: For k ≥ 0 in cohomological weight the Hodge–Tate weights are pairwise distinct.

Definition of the proposition only.

**Checks.**

- k = 2, r = 1 (a cohomological weight: r ≠ 2, k + r ≠ 1, k + 2r ≠ 3): the expected weights (0, −1, 2, 1) are distinct.
- r = 2: the weights (0, 0, k + 1, k + 1) repeat, so the weight is not cohomological.
- k = 0, r = 2: the weights are (0, 0, 1, 1), those of H¹ of an abelian surface.

Pilloni Theorem 5.3.1 constructs ρ_{Θ,λ}; the expectation concerns its p-adic Hodge theory.

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §5.3, Remark 5.3.2, p. 25 (author version); [Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §5.3, Remark 5.3.2, p. 26 (author version).)

*Needs:* PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified); [Assertions with explicit hypotheses](#endpoint-status-register); [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry).

### Examples

For k=2,r=1 the four predicted numbers are [0,−1,2,1], while k=0,r=2 gives [0,0,1,1]. The numerical list alone cannot establish a crystalline realization. For the trivial rank-one Frobenius, reversing X−1 gives 1−T; the good-prime Euler denominator is therefore 1−q^{−s}. A record of 3=4 conditional on 1=2 contains a valid implication but cannot be upgraded without a proof of 1=2.

### Dependencies

The layer uses the exact supplier contracts above, AutomorphicGaloisRepresentationsPartII, Layer AG2.2, AutomorphicLFunctionsAndLocalFactors, Layer AL.2, AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized automorphic representation), `Polynomial.reverse`, `Polynomial.eval₂_reverse_mul_pow`, `Matrix.charpoly`, PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified).

## Layer 1: weight one, low-rank lifts and residual image conditions

<a id="accessible-regular-refinement"></a>
### 1.1 Accessible and n-regular refinements

For a definite unitary group G_d over F⁺ and an automorphic π of G_d(𝔸_{F⁺}), identify its split p-adic factors with GL_d(F_ṽ). An accessible refinement is a tuple of smooth torus characters χ_v : T_d(F_ṽ) → Q̄_p^× occurring in the normalized Jacquet module ι⁻¹r_{N_d}(π_v), equivalently admitting π_v ↪ i_{B_d}^{GL_d}ιχ_v. For a rank-two input and a separate symmetric-power rank n ≥ 2, the refinement is n-regular when (χ_{v,1}/χ_{v,2})^i ≠ 1 for every 1 ≤ i ≤ n−1 and every v∈S_p. The group rank d=2 does not force n=2. For π on GL₂(𝔸_ℚ), π_l admits an accessible refinement exactly when its Jacquet module is nonzero, equivalently when π_l is not supercuspidal.

G_d is the definite unitary group of NT §1; T_d⊂B_d⊂GL_d. The n-regular ratio criterion displayed here is for d=2 and arbitrary n≥2.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.IsAccessibleRefinement`: χ_v a subquotient of the normalised Jacquet module at each v ∈ S_p.
- `TauCeti.SymmetricPower.IsNRegular`: For a rank-two refinement and n≥2, (χ_{v,1}/χ_{v,2})^i ≠ 1 for all 1≤i≤n−1 and all v∈S_p.
- `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal`: An accessible refinement exists iff π_l is not supercuspidal.
- `TauCeti.SymmetricPower.isNRegular_mono`: n-regular ⇒ m-regular for m ≤ n.

Construct this refinement interface here from the normalized Jacquet functor and Frobenius reciprocity of SmoothRepresentationsOfLocalGroups. The n-regular predicate is imposed on the actual torus characters, and symmetric powering sends the ordered pair to (χ₁^{n−1},χ₁^{n−2}χ₂,…,χ₂^{n−1}).

**Checks.**

- π_l unramified with Satake parameters {α, β}: when α≠β and the principal series is irreducible, the two distinct refinements are (α, β) and (β, α); if α=β these orderings give the same character; n-regular iff (α/β)^i ≠ 1 for i < n.
- π_l a twist of Steinberg has exactly one accessible refinement.
- π_l supercuspidal has no accessible refinement (the hypothesis of NT I Theorem B).
- α/β = −1 is 2-regular but not 3-regular: (α/β)² = 1.

Check that an n-regular refinement excludes the ratio being an i-th root of unity for i < n: the condition keeps Sym^{n−1} of the refinement regular.

([Newton–Thorne I](#ref-newton-thorne-I), §2, p. 34, and Definition 2.23, p. 40 (arXiv v3).)

*Needs:* SmoothRepresentationsOfLocalGroups, normalized induction and Jacquet modules; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="strong-artin-conjecture"></a>
### 1.2 Langlands' conjecture for Artin representations (the strong Artin conjecture)

For a continuous irreducible finite-image complex representation ρ:G_K→GL_n(ℂ), the strong Artin predicate requires a cuspidal π on GL_n(𝔸_K) with rec(π_v)≅ρ|_{W_{K_v}} at every place, including ramified and infinite ones, so full L- and epsilon-factors match. Godement–Jacquet then implies entireness for nontrivial ρ. Almost-everywhere matching is a separate weak Artin predicate: strong multiplicity one gives uniqueness of π, but does not repair missing bad Euler factors or imply entireness of the full Artin function.

K a number field; ρ continuous, irreducible, n-dimensional over ℂ.

The interface should expose the following operations and comparisons.

- `TauCeti.WeightOne.IsAutomorphicArtin`: ρ has a cuspidal π matching its local Weil parameter at every place (strong Artin), rather than merely outside a finite set.
- `TauCeti.WeightOne.IsAutomorphicArtin.lFunction_entire`: IsAutomorphicArtin ρ and ρ non-trivial ⇒ L(ρ, s) extends to an entire function.
- `TauCeti.WeightOne.IsAutomorphicArtin.of_iso`: Invariant under isomorphism of ρ.
- `TauCeti.WeightOne.IsAutomorphicArtin.twist`: IsAutomorphicArtin ρ ⇒ IsAutomorphicArtin (ρ ⊗ χ) for a finite-order character χ.
- `TauCeti.WeightOne.IsAutomorphicArtin.dim_one`: Every one-dimensional ρ is automorphic (class field theory).
- `TauCeti.WeightOne.IsAutomorphicArtin.unique`: The cuspidal π is unique (strong multiplicity one).

Define full local matching using the Artin/automorphic local-factor suppliers. Apply Godement–Jacquet after equality of the full functions. Strong multiplicity one proves uniqueness from the unramified places; it supplies no ramified comparison.

**Checks.**

- For a finite-order Hecke character χ, its finite-image Galois character through global Artin reciprocity is automorphic with π=χ.
- ρ = Ind_{G_L}^{G_ℚ} χ for L imaginary quadratic and χ ≠ χ^c is automorphic, with π the automorphic induction of χ (weight-one theta series).
- ρ = 1 ⊕ 1 is not irreducible: the matching representation 1 ⊞ 1 is isobaric, not cuspidal, and L(ρ, s) = ζ(s)² has a pole.
- For f a weight-one newform, the Deligne–Serre representation ρ_f (AutomorphicGaloisRepresentations R19.1) is automorphic with π = π_f.

n = 1 is class field theory; the proved two-dimensional cases are [ClassicalSerreModularity §R27.6, rational odd Artin modularity](../ClassicalSerreModularity/README.md) and [The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images](#totally-real-odd-artin).

([Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.2 PDF p.20; [Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.2, PDF/printed p.20 (author copy results.pdf).)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); AnalyticNumberTheory, Layer AN.4; TauCetiRoadmap.Chebotarev, Layer 10; [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTIN](#contract-c-artin).

<a id="irregular-systems-weight-one"></a>
### 1.3 Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))

Let (ρ_ι) be a two-dimensional compatible system of representations of G_ℚ (E-rational, continuous, semisimple, finitely ramified ρ_ι : G_ℚ → GL₂(Q̄_ℓ) for every ℓ and ι : E ↪ Q̄_ℓ, with Weil–Deligne compatibility at q ∤ ℓ and crystalline at q | ℓ with Hodge–Tate weights (a, b) for ℓ ≫ 0) which is irregular (a = b), irreducible and odd. Then, up to twist, (ρ_ι) arises from a newform of weight one; in particular, after twisting to Hodge–Tate weights (0, 0), every ρ_ι has finite image.

The compatible system in Khare–Wintenberger's sense (§5): weakly compatible, crystalline only for ℓ ≫ 0.

State the resulting comparison as `TauCeti.WeightOne.weightOne_of_irregular`.

Twist so that the weights are (0, 0); Sen–Fontaine gives unramifiedness at ℓ for almost all ℓ. Use residual irreducibility from PotentialModularityAndCompatibleSystems R24.6, the strong Serre theorem, and Gross/Coleman–Voloch weight lowering to obtain Katz cuspidal weight-one eigensystems at one level N for infinitely many rational primes ℓ. These mod-ℓ forms need not individually lift at every ℓ. Import the two precise ClassicalSerreModularity R27.6 results `weight-one-reduction-is-onto-for-almost-all-primes` and `weight-one-descent-from-infinitely-many-primes`: put N′=N for N≥5 and N′=5N otherwise, and discard the finitely many primes supporting torsion in H¹(X₁(N′),ω(−cusps)), together with primes dividing 2N′. The remaining eigensystems lie in the reduction of the finite free characteristic-zero section module. Deligne–Serre eigenvalue lifting gives characteristic-zero eigensystems in that module. There are finitely many such systems, so one occurs for infinitely many rational primes. For each fixed r∤N′, clear the fixed denominator of the difference between its eigenvalue and the compatible-system trace in their coefficient-field compositum. The resulting algebraic integer vanishes at primes above infinitely many rational primes and is therefore zero. Newform theory gives level dividing N′, and Chebotarev identifies the semisimple representations. No lifting at the omitted primes, equality of bad Hecke eigenvalues, or level exactly N is asserted. This uses the coherent-cohomology proof of the supplier descent statement rather than an uncorrected weight-one lifting assertion.

The converse: newforms of weight one give irregular irreducible odd compatible systems (Deligne–Serre).

([Serre's modularity conjecture (I)](#ref-kw-2009-I), Theorem 10.1(ii), §10.1, p. 20 (author copy results.pdf); [Serre's modularity conjecture (I)](#ref-kw-2009-I), Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf); [Serre's modularity conjecture (I)](#ref-kw-2009-I), §5, p. 8 (author copy results.pdf).)

*Needs:* ClassicalSerreModularity, Layer R27.6 (weight one descent from infinitely many primes); ClassicalSerreModularity, Layer R27.6 (unramified residual representations arise in weight one); ClassicalSerreModularity, Layer R27.6 (full classical serre theorem); PotentialModularityAndCompatibleSystems, Layer R24.6 (residual members); PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified); SerreWeightAndLevelOptimisation, Layer R20.3 (weight one forms unramified at p); AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="non-solvable-residual-modularity"></a>
### 1.4 Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant

Let E be totally real with 5 unramified, and ϱ̄:G_E→GL₂(F₅) totally odd with det ϱ̄=ε̄^{−1} and nonsolvable projective image. The residual representation is modular, by the elliptic-curve construction, solvable base change and descent used in BCGP Proposition 10.1.3. Applying Pilloni–Stroh Proposition 2.1.3 requires first twisting the determinant to ε̄ and passing to a solvable totally real extension where the projective image is PSL₂(F₅); it is not a direct application to PGL₂(F₅). Separately, Snowden Theorem 7.2.1 constructs finitely many weight-two lifts for a specified lifting problem exactly when that problem has local solutions at every designated place. It does not promise lifts of incompatible types or determinants.

Residual modularity: E totally real, 5 unramified, det ϱ̄=ε̄^{−1}, total oddness and nonsolvable projective image. Lifting subclaim: Snowden assumptions (A1),(A2), an odd residual representation, a finite set Σ containing ramification and the places above 5, a finite-order ψ lifting det ϱ̄/ε̄, definite local types and inertial types, and a local weight-two lift of determinant ψε at every v∈Σ. The projective-PGL₂(F₅) exceptional case needs [E(ζ₅):E]=4. Assumption (A1) is absolute irreducibility after restriction to G_{E(ζ₅)}; (A2) is that degree-four condition in the projective-PGL₂(F₅) case.

State the resulting comparison as `TauCeti.WeightOne.mod5_nonsolvable_modular`.

Residual modularity: SBT/Taylor's moduli of elliptic curves with ϱ̄ ≅ E[5] and Moret-Bailly over a solvable extension, then solvable descent of modularity (BCGP cite Pilloni–Stroh Proposition 2.1.3). Lifts: Snowden Theorem 7.2.1; modularity of lifts: Kisin's theorem (GL2ModularityLifting).

The p = 5 case of BCGP Proposition 10.1.3.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [Surconvergence, ramification et modularité](#ref-pilloni-stroh-2016), §2.1, Lemmas 2.1.1–2.1.2 and Proposition 2.1.3, pp. 9–10; [On two dimensional weight two odd representations of totally real fields](#ref-snowden-2009), §7.2, Theorem 7.2.1 and definition of a lifting problem, pp. 20–21; §3.1, (A1)–(A2), p. 6.)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R23.1; AutomorphicGaloisRepresentations, Layer R19.2; GL2ModularityLifting, Layer R22.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="buzzard-taylor-hypotheses"></a>
### 1.5 Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 and the Buzzard–Taylor remark)

Let F be a number field, k a finite field of characteristic p, S a finite set of places not containing any v | p, and ρ̄ : G_{F,S} → GL₂(k) continuous and absolutely irreducible with universal deformation ring R. If the Galois representation of every Q̄_p-point of R has finite image and R has only finitely many Q̄_p-points, then R[1/p] is reduced. For F = ℚ and ρ̄ modular these hypotheses can often be deduced from Buzzard–Taylor and Buzzard (companion forms and analytic continuation of overconvergent weight-one forms), which is how Calegari–Geraghty's weight-one modularity results connect to the classical ones.

Unramified-at-p deformation problem (S contains no place above p); ρ̄ absolutely irreducible.

State the resulting comparison as `TauCeti.WeightOne.reduced_of_finitePoints`.

Calegari–Geraghty's proof: the points of R[1/p] with finite image are unobstructed (H¹ of a finite-image representation in characteristic 0 is computed by inflation–restriction), so R[1/p] is étale at them. The remark: Buzzard–Taylor show that unramified-at-p lifts of modular ρ̄ come from weight-one forms, which have finite image and are finite in number.

The remark only says 'often'; the hypotheses are not claimed in general.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Lemma 4.14, §4.2, p. 52 (arXiv v2) = Invent. pp. 366–367; proof pp. 52–53 = Invent. pp. 367–368; [Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §4.2, remark after the proof of Lemma 4.14, p. 53 (arXiv v2) = Invent. p. 368.)

*Needs:* AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation); GlobalGaloisDeformations, Layer R04.2 (universal deformation ring); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="functorial-lift"></a>
### 1.6 Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N

Let F be a number field, π a cuspidal automorphic representation of GL_n(𝔸_F) and R : GL_n → GL_N an algebraic representation. A functorial lift of π along R is an automorphic representation R(π) of GL_N(𝔸_F) (isobaric) such that for every place v the Langlands parameter of R(π)_v is R ∘ rec(π_v), where rec is the local Langlands correspondence for GL_n(F_v) (Harris–Taylor, Henniart at finite v; Langlands at infinite v). By strong multiplicity one for isobaric representations R(π) is unique if it exists. A weak lift asks the matching only at almost all v; CKPSS's 'functorial lift' from classical groups asks it at the archimedean places and at almost all unramified finite places.

F a number field; π cuspidal on GL_n(𝔸_F); R algebraic.

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.IsFunctorialLift`: Π is a functorial lift of π along R: rec(Π_v) ≅ R ∘ rec(π_v) at every place.
- `TauCeti.Functoriality.IsWeakLift`: The same at almost all unramified places (Satake parameters).
- `TauCeti.Functoriality.IsFunctorialLift.unique`: Two functorial lifts of π along R are isomorphic (strong multiplicity one).
- `TauCeti.Functoriality.IsFunctorialLift.toWeak`: A functorial lift is a weak lift.
- `TauCeti.Functoriality.IsFunctorialLift.comp`: If Π is a lift of π along R, Π lies in the input domain of the second lift, and Π′ is a lift of Π along R′, then Π′ is a lift of π along R′∘R. For the cuspidal input definition this requires Π cuspidal; isobaric composition uses the supplied extension to that domain.
- `TauCeti.Functoriality.IsFunctorialLift.id`: π is its own lift along the identity.
- `TauCeti.Functoriality.IsFunctorialLift.lFunction`: L(s, R(π)) = L(s, π, R), the Langlands L-function of π along R.

Local parameters: the local Langlands correspondence for GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6) and archimedean Layer 0. Uniqueness: Jacquet–Shalika strong multiplicity one for isobaric sums (AutomorphicLFunctionsAndLocalFactors AL.3).

**Checks.**

- R = det on GL₂: the lift of π is the central character ω_π (a Hecke character), by local class field theory.
- n = 1, R = χ ↦ χ^k: the lift of a Hecke character χ is χ^k.
- For π = AI_{K/F}(θ) dihedral, Sym²π exists but is not cuspidal: it is AI(θ²) ⊞ θ|_{𝔸_F^×} (whereas Ad(π) = AI(θ/θ^σ) ⊞ η_{K/F}).
- R = std: the lift of π is π itself, and IsFunctorialLift agrees with equality of rec at every place.

R = Sym^{n−1} on GL₂ recovers [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); R = std ⊗ std′ on GL₂ × GL₂ is Ramakrishnan's lift.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, 'Context', p. 1 (arXiv:1912.11261v3).)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [AutomorphicLFunctionsAndLocalFactors, archimedean GL_n parameters](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="projective-image-sandwich"></a>
### 1.7 The finite-field projective image condition

Let G be a group, k a finite field embedded by ι into a field K, and ρ:G→GL₂(K). ProjectiveImageSandwich(p,a,n,ι,ρ) means: p prime, a≥1, n≥1, #k=p^a>max(5,2n−1), and for one c∈PGL₂(K), the conjugate by c of the range of Pρ contains the embedded PSL₂(k) and is contained in the embedded PGL₂(k). Both embeddings use ι. Specialization to K=F̄_p gives exactly the residual-image hypothesis of NT II Theorem 2.1. The definition does not assert automorphy lifting or require p>n.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.ProjectiveImageSandwich`: The explicit conjunction and two subgroup inclusions.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.bound`: The hypothesis gives p^a>max(5,2n−1).
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.mono`: For 1≤m≤n the same data satisfy the rank-m bound.
- `TauCeti.SymmetricPower.ProjectiveImageSandwich.conjugation`: Conjugating the actual GL₂ representation preserves the condition.

Compose the actual GL₂ representation with the central quotient and conjugate by one element of PGL₂(K). Compare its subgroup image with the images of PSL₂(k) and PGL₂(k) under the same field embedding. Use the strict size inequality for monotonicity in rank.

**Checks.**

- The identity representation of GL₂(F₇) satisfies the condition with p=7,a=1,n=3.
- Over F₅ the strict bound fails for every representation when a=1.
- No data satisfy the condition with a=0.
- p=2,a=3,n=4 passes the cardinality bound since 8>7, although p≤n. This tests the bound only, not an unspecified representation.

([Newton–Thorne II](#ref-newton-thorne-II), Theorem 2.1, pp. 5–6, arXiv v2.)

*Needs:* `Matrix.ProjGenLinGroup`; `Matrix.ProjGenLinGroup.mk`; `Matrix.ProjGenLinGroup.map`; `Matrix.ProjectiveSpecialLinearGroup.toPGL`.

<a id="hilbert-weight-one-realization"></a>
### 1.8 Hilbert finite-slope gluing and weight-one realization

Let F be totally real, p any prime and X the disjoint union, over polarization-ideal classes, of Hilbert modular varieties with the tame level of Pilloni–Stroh §8. For integer k, define classical forms as `H⁰(X,ω^k)`, p-adic forms as sections on the ordinary tube, and overconvergent forms as sections extending to a strict neighborhood. The finite-slope subspace consists of vectors killed by a polynomial P(U_p) with P(0)≠0. Define φ from the canonical-subgroup quotient correspondence, on these same sections. The full finite-slope gluing theorem is
`H is classical ↔ φ(H) is overconvergent and finite slope`.
It permits arbitrary ramification of p in F and all integral k; its geometric argument permits p=2.

For the modularity application impose p odd, ρ:G_F→GL₂(ℤ̄_p) continuous geometric, totally odd, with both Hodge–Tate weights zero, residual restriction to F(ζ_p) irreducible, ordinarily modular residual representation, and, if p=5 with projective residual image PGL₂(𝔽₅), `[F(ζ₅):F]=4`. Then the output is a normalized cuspidal parallel-weight-one Hilbert form with the unramified Hecke traces and determinant of ρ. This is Pilloni–Stroh Theorem 0.4, pp.2–3. Theorem 0.3 removes the auxiliary-prime hypotheses for finite-image complex ρ by the residual argument and soluble descent; that endpoint is [the odd Artin target](#totally-real-odd-artin), not a second result here.

**API.**

- `HilbertClassicalSections / HilbertOverconvergentSections` are sections of the same automorphic bundle on the algebraic variety and strict neighborhoods of its ordinary tube; restriction respects Hecke action and q-expansion.
- `finiteSlopeSubspace / canonicalFrobeniusPullback` retain the compact U-operators and the specified canonical-quotient pullback; the comparison uses polynomials with nonzero constant term.
- `companion_generalized_eigenspace` is the displayed rank-one module over the product Hecke-polynomial algebra, including repeated roots.
- `classical_iff_frobenius_finiteSlope / weightOne_gluing_realization` identify the same sections and eigensystems by the stated gluing and modularity theorem. The U_v-module in Theorem 7.2.4 is free of rank one over `E[X_v:v|p]/(P_v(X_v))`; retain generalized eigenvectors when P_v has a double root. Proposition 7.2.6 constructs H,G with φ(H)=G, including this repeated-root case. The analytic extension across the nonordinary locus then gives classicality and the actual same Hecke eigensystem.

**Checks.**

- If P_v=(X−a)² with a≠0, the companion algebra has dimension two and a nonzero nilpotent class X−a; a list of two distinct eigencharacters loses this case.
- P=X has P(0)=0 and does not certify finite slope; P=X−1 does.
- Ordinary slope zero is a special case, not the definition of finite slope.
- At p=2 the gluing theorem remains available, while the stated modularity-lifting theorem requires odd p.
- The zero section is classical, but the normalized cusp output has first Fourier coefficient one.

([Pilloni–Stroh](#ref-pilloni-stroh-2016), Theorem 7.2.4 and Proposition 7.2.6, pp.33–35; Theorem 8.2 and Corollary 8.4, pp.35–37; analytic-extension proof §§10.3–10.6, pp.65–74.)

The forward construction `hilbertWeightOneArtinRep(f)` takes an arbitrary normalized cuspidal parallel-weight-one Hilbert eigenform over F, with finite-order central character, and gives an irreducible finite-image totally odd representation over its algebraic coefficient closure, characterized by the good Hecke polynomials. This construction is independent of the modularity-lifting hypotheses on ρ above. In particular it does not require an ordinary residual representation or odd [F:ℚ]. Its conjugate coefficient embeddings give the corresponding conjugate representation.

For this target use the following version of the Deligne–Serre argument. Rogawski–Tunnell Proposition 2.8 constructs, at fixed tame level, integral parallel Hasse lifts H_ℓ whose q-expansions are 1 modulo ℓ and whose weights are multiples of ℓ−1. Multiply f by H_ℓ, and apply eigenvalue lifting to obtain a characteristic-zero cuspidal eigensystem of regular parallel weight, congruent to f away from a fixed finite set and ℓ. Use **AutomorphicGaloisRepresentations §3.10, the unrestricted regular Hilbert constructor**, for these high-weight eigensystems. This replaces the quaternionic realizations in Rogawski–Tunnell Proposition 3.4(a), which alone require odd degree or a finite discrete-series place. Restrict to the infinitely many degree-one coefficient primes λ, so that Nλ=ℓ; the degree-one condition is needed in the finite-subgroup estimate. Their Proposition 3.3 and Lemma 3.5 give residual representations over that fixed residue field of type C(η,M), with M independent of ℓ. The finite-group bounded-image argument in their proof of Theorem 3.1(a) and Proposition 3.6 lifts a subsequence to one complex finite-image representation with the required good polynomials. If the resulting finite-image representation were a sum of characters, class field theory would factor its partial L-function into two finite-order Hecke L-functions. Twisting by the inverse of one constituent gives a zeta pole at 1 and a nonzero second factor (or a second pole), contradicting the entire cuspidal GL₂ L-function. The determinant comparison gives total oddness. Thus the modern unrestricted regular constructor removes the even-degree restriction at the exact point where their proof uses it; it is not an assertion that the original Theorem 3.1(a) had unrestricted scope. For the local comparison, globalize any character at the chosen finite place and make it sufficiently ramified at the other bad places. The global functional equations, agreement at good places and the stability of the other local gamma factors isolate equality of the chosen twisted gamma factors; the GL₂ local converse theorem then identifies its Weil–Deligne parameter. At real places total oddness gives the weight-one parameter 1⊕sgn, up to its central finite character. The all-place comparison is this additional deduction, whereas good polynomials already characterize the finite-image construction.

**Forward checks.** For F=ℚ recover Deligne–Serre. For even-degree F and a form with no finite discrete-series component the construction still applies through the unrestricted regular constructor. The parallel-weight-two representation has infinite cyclotomic determinant and does not satisfy the finite-image conclusion. Conjugating the coefficients conjugates every good characteristic polynomial, rather than leaving an arbitrary chosen embedding fixed.

([Rogawski–Tunnell, On Artin L-functions associated to Hilbert modular forms of weight one](https://gdz.sub.uni-goettingen.de/id/PPN356556735_0074), Invent. Math. 74 (1983), Proposition 2.8 p.25; Theorem 3.1 pp.28–29; Proposition 3.3 pp.29–30, Lemma 3.5 p.31 and Proposition 3.6 with the proof of Theorem 3.1(a) p.32. The replacement of Proposition 3.4(a) is the deduction just described.)

*Needs:* HilbertModularVarietiesAndShimuraCurves, Hilbert varieties, automorphic line bundles and q-expansion; PadicFamilies, overconvergent sections and compact operators; HodgeTateAndCanonicalSubgroups, canonical subgroup; GL2ModularityLifting, ordinary patching; AutomorphicGaloisRepresentations §3.10, unrestricted regular Hilbert realization, and §3.14, its determinant/oddness; ClassicalSerreModularity R27.6, Deligne–Serre eigenvalue lifting; ArithmeticGaloisRepresentations, finite-image coefficient descent and Chebotarev; AutomorphicLFunctionsAndLocalFactors, comparison of twisted local factors; [C-GALOIS](#contract-c-galois).

<a id="totally-real-odd-artin"></a>
### 1.9 The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images

Let E be a totally real field and ϱ : G_E → GL₂(ℂ) a continuous irreducible finite-image totally odd representation (det ϱ(c) = −1 for every complex conjugation c), in particular one with projective image A₅. Then ϱ is automorphic: it arises from a Hilbert modular eigenform of parallel weight one (Pilloni–Stroh, Theorem 0.3), so ϱ satisfies Langlands' and Artin's conjectures. Boxer–Calegari–Gee–Pilloni apply it to a characteristic-zero totally odd lift with finite image (Tate) of a mod 3 representation ϱ̄₃ : G_E → GL₂(F₉) with projective image A₅.

E totally real; ϱ:G_E→GL₂(ℂ) continuous, irreducible and of finite image; det ϱ(c_v)=−1 for every real place v. No unramified-at-p assumption is present in Pilloni–Stroh Theorem 0.3.

State the resulting comparison as `TauCeti.WeightOne.oddArtin_totallyReal`.

Pilloni–Stroh (Astérisque 382): companion forms and analytic continuation of overconvergent Hilbert modular forms of parallel weight one (after Buzzard–Taylor, Kassaei, Sasaki), with modularity lifting for the residual representations. Tate: a projective representation with finite image lifts to a representation with finite image; oddness is preserved.

The non-solvable vast case of BCGP Proposition 10.1.3 for p = 3.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, §10.1, p. 266 (arXiv v3); [Surconvergence, ramification et modularité](#ref-pilloni-stroh-2016), Theorem 0.3, §0, printed p. 2.)

*Needs:* [Langlands' conjecture for Artin representations (the strong Artin conjecture)](#strong-artin-conjecture); [Hilbert finite-slope gluing and weight-one realization](#hilbert-weight-one-realization); GL2AutomorphicRepresentationsAndTransfer, Layer R17.5; [C-ARTIN](#contract-c-artin).

<a id="symmetric-power-lift-over-number-fields"></a>
### 1.10 Symmetric power lifts Sym^{n−1}π over a number field

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and n ≥ 1. Sym^{n−1}π exists if there is an automorphic representation Π of GL_n(𝔸_F) with rec_{F_v}(Π_v) ≅ Sym^{n−1} ∘ rec_{F_v}(π_v) for every place v ([Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift) with R = Sym^{n−1}). For F totally real and π regular algebraic (classical Hilbert, weights ≥ 2 of constant parity) and non-CM, Clozel–Thorne phrase it Galois-theoretically: there is a regular algebraic cuspidal Π with Sym^{n−1} r_l(π) ≅ r_l(Π) for every l; [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion) shows the two agree. The rational-field definition is this definition specialized at F=ℚ.

F a number field; π cuspidal on GL₂(𝔸_F).

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.SymPowerExists`: ∃ Π with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at all v.
- `TauCeti.SymmetricPower.SymPowerExists.one`: n = 1: Sym⁰π is the trivial character.
- `TauCeti.SymmetricPower.SymPowerExists.two`: n = 2: Sym¹π = π.
- `TauCeti.SymmetricPower.SymPowerExists.iff_galois`: For π RAESDC non-CM over totally real F: SymPowerExists π n ↔ Sym^{n−1} r_{π,ι} automorphic for one (every) ι.
- `TauCeti.SymmetricPower.SymPowerExists.baseChange`: For soluble L/F, if Sym^{n−1}π exists and BC_{L/F}(π) remains cuspidal, then Sym^{n−1}BC_{L/F}(π) exists. When base change is noncuspidal, use the explicitly extended isobaric-domain predicate and its constituent operations, rather than applying the cuspidal-domain definition.

Definition through [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); Galois form through the automorphy predicate of [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate).

**Checks.**

- n = 3: Sym²π exists for every cuspidal π (Gelbart–Jacquet), cuspidal iff π is not dihedral.
- For π = AI(θ) dihedral, Sym²π exists but is not cuspidal; existence does not mean cuspidality.
- n = 1 gives the trivial GL₁ character at every place, including ramified places of π; n = 2 gives π itself with its original ramified local parameters.
- For F = ℚ it agrees with [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields).

Over ℚ it is [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields).

([Clozel–Thorne III](#ref-ct-2017), §1 Introduction, manuscript p. 2.)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="ramakrishnan-tensor-product"></a>
### 1.11 Ramakrishnan: the automorphic tensor product GL₂ × GL₂ → GL₄

For cuspidal π,π′ on GL₂(𝔸_F), Ramakrishnan Theorem M constructs an isobaric π⊠π′ on GL₄ with local Rankin–Selberg L- and epsilon-factors at all finite places and L-factors at infinity. If neither is dihedral, it is cuspidal iff π′ is not a Hecke-character twist of π. If π′=AI_{K/F}(μ) for quadratic K/F, it is cuspidal iff BC_K(π) is cuspidal and is not isomorphic to BC_K(π)⊗(μ∘θ)μ^{−1}, θ the nontrivial automorphism. This latter criterion is not replaced by a blanket exclusion of only both-dihedral pairs.

F a number field; π₁, π₂ cuspidal on GL₂(𝔸_F).

State the resulting comparison as `TauCeti.Functoriality.ramakrishnan`. For the all-place parameter form used in §4.13, Kim 2003, Propositions 5.1.3–5.1.5, pp.159–161, completes the factor statement: globalize the three local two-dimensional Weil representations with solvable image, isolate the designated γ-factor by highly ramified twists elsewhere, and apply the GL₄ local converse theorem with ranks 1 and 2. Two omitted good places and isobaric strong multiplicity one patch the global tensor product. This preserves the full Weil–Deligne parameters, not just their standard Euler factors.

Ramakrishnan (Ann. of Math. 2000): Rankin–Selberg theory for GL₂ × GL₂ twisted by GL₂ and GL₁, and the converse theorem of Cogdell–Piatetski-Shapiro for GL₄.

Newton–Thorne II Appendix A use GL₂ × GL₂ → GL₄ for icosahedral weight-one forms.

([Newton–Thorne II](#ref-newton-thorne-II), Appendix A, proof of Theorem A.1, p. 28 (arXiv:2009.07180v2); [Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](#ref-ramakrishnan-2000), §3, Theorem M, p. 54 (Ann. of Math. 152; arXiv:math/0007203v1).)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="sp-statement"></a>
### 1.12 The statement SP_n (Newton–Thorne, Conjecture B)

For n ≥ 1, SP_n is the proposition: for every totally real field F and every cuspidal regular algebraic automorphic representation π of GL₂(𝔸_F) without CM, the lift Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in any of the equivalent senses of [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion). (Every cuspidal regular algebraic π of GL₂ over a totally real field is RAESDC.) Newton–Thorne prove SP_n for all n ([Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers)).

n ≥ 1.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.SP`: The proposition SP_n.
- `TauCeti.SymmetricPower.SP.one`: SP 1 holds.
- `TauCeti.SymmetricPower.SP.two`: SP 2 holds.
- `TauCeti.SymmetricPower.SP.of_le_five`: SP n for n ≤ 5 (low-rank transfers).
- `TauCeti.SymmetricPower.SP.all`: SP n for all n (Newton–Thorne Theorem 6.4).

Definition of the proposition.

**Checks.**

- SP 1: Sym⁰π is the trivial character, cuspidal on GL₁.
- SP 3 is Gelbart–Jacquet's theorem for non-CM π.
- SP_n says nothing about CM π, whose symmetric powers (n ≥ 3) are not cuspidal.

SP₁, SP₂ are trivial; SP₃ is Gelbart–Jacquet; SP₄, SP₅ are Kim–Shahidi and Kim ([Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers)).

([Newton–Thorne, Hilbert](#ref-nt-2026), Conjecture B, §1 (Introduction), p. 3 (arXiv v2); restated after Theorem 3.2, p. 13.)

*Needs:* [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="kim-shahidi-sym3"></a>
### 1.13 Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube

Let F be a number field, π a cuspidal automorphic representation of GL₂(𝔸_F) and σ one of GL₃(𝔸_F). Then the functorial product π ⊠ σ exists as an automorphic representation of GL₆(𝔸_F), and Sym³π exists as an automorphic representation of GL₄(𝔸_F); Sym³π is cuspidal unless π is dihedral or tetrahedral (Ad(π) ≅ Ad(π) ⊗ χ for a cubic χ).

F a number field; π cuspidal on GL₂(𝔸_F), σ cuspidal on GL₃(𝔸_F).

State the resulting comparison as `TauCeti.Functoriality.kimShahidi`.

For the GL₂×GL₃ transfer Kim–Shahidi use triple-product L-functions from the exceptional cases D₅−2, E₆−1 and E₇−1 of the Langlands–Shahidi method (Introduction pp. 839–840), followed by the GL₆ converse theorem (§3, Theorem 3.8) and the local comparison in §5, Theorem 5.1. For non-dihedral π, Sym²π is cuspidal; identify the GL₆ product π⊠Sym²π with Sym³π⊞(π⊗ω_π) and construct the GL₄ summand using §6. Handle the dihedral case through automorphic induction separately, since its Sym² is noncuspidal. Theorem 5.1 gives the tensor product’s matching local factors at every place; §6 gives the symmetric-cube lift and its dihedral/tetrahedral cuspidality exceptions. Places above 2 and 3 are not excluded in this theorem; that qualification belongs to Kim’s exterior-square result.

For π attached to a non-CM elliptic curve over ℚ, Sym³π is cuspidal of symplectic type with multiplier ω_π³.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, 'Context', p. 1 (arXiv:1912.11261v3); [Functorial products for GL2 × GL3 and the symmetric cube for GL2](#ref-kim-shahidi-2002), Introduction, Theorem A, p. 838 (= Theorem 5.1) (Ann. of Math. 155; arXiv:math/0409607v1); [Functorial products for GL2 × GL3 and the symmetric cube for GL2](#ref-kim-shahidi-2002), Introduction, Theorem B, PDF pp.2–3 (printed pp.838–839).)

*Needs:* [GL2AutomorphicRepresentationsAndTransfer §R17.4.13](https://github.com/TauCetiProject/TauCetiRoadmap/pull/931); [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="kim-sym4"></a>
### 1.14 Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)

Let F be a number field. (a) For Π cuspidal on GL₄(𝔸_F), ∧²Π exists as an automorphic representation of GL₆(𝔸_F) (Kim 2003, with local compatibility at the places over 2 and 3 completed by Henniart 2009, so that ∧²Π is a functorial lift in the sense of [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift) at every place). (b) For π cuspidal on GL₂(𝔸_F), Sym⁴π exists as an automorphic representation of GL₅(𝔸_F) (Kim 2003), cuspidal unless π is dihedral, tetrahedral or octahedral (Kim–Shahidi).

F a number field.

State the resulting comparison as `TauCeti.Functoriality.kim_exteriorSquare`.

**Construction and analytic input.** Use unitary normalization, then recover essentially unitary inputs by twisting. For the maximal parabolics of Spin(2n), 4≤n≤7, the derived Levi is SL_{n−3}×SL₄. Its two adjoint summands are `r₁=Std_{n−3}⊗∧²Std₄` and `r₂=∧²Std_{n−3}⊗det Std₄`. The second summand matters: it cannot be dropped from the Eisenstein normalizing factor. Define local L, ε and γ factors through the Whittaker local coefficient; for tempered inputs the L-factor is the reciprocal of its normalized denominator, and extend using Langlands classification and multiplicativity. At infinity compute on one-dimensional Weil characters and two-dimensional induced characters, using Γ_ℝ and Γ_ℂ and the fixed additive character. Shahidi's rank-one factorization reduces to SL₂(ℝ), SL₂(ℂ) and SU(2,1); their explicit integrals, the real/complex root classification and the Harish–Chandra parameter identify these factors with Artin factors. Keep the Langlands λ(C/ℝ,ψ) scalars in the local coefficient before extracting the individual factors ([Shahidi 1985](#ref-shahidi-real), Theorems 3.1/3.13, pp.990–1003).

For twists by cusp forms of GL_m, 1≤m≤4, normalize the local intertwiner by both adjoint factors. Tempered holomorphy and the unitary classification give holomorphy and nonvanishing for Re(s)≥1/2: the inducing exponents are strictly below 1/2; when the two largest GL₄ exponents coincide, factor through the smaller D-type Levi and two GL rank-one operators instead of applying the strict-root inequality to that case. A character χ with χ_v^{24} ramified at a chosen finite place prevents Weyl self-association for all four m. The global intertwiner is then holomorphic; nonvanishing of the r₂ factor on Re(s)≥1 and of the local normalized operators proves entireness of the r₁ L-function. Its functional equation and vertical-strip boundedness give the hypotheses of the GL₆ converse theorem (Kim, Propositions 3.1/3.4 and Theorem 3.5, pp.149–151).

**Weak lift and unitarization.** First suppose that no finite component of Π is supercuspidal. Local multiplicativity identifies the factors needed for the converse theorem, producing an isobaric weak exterior-square lift. To prove that its constituents have exponent zero, compare the four possible unitary GL₄ Satake shapes. The trace Rankin–Selberg estimate makes the one-complementary-pair shape with exponent bounded away from zero have density zero. Weak Ramanujan for cuspidal GL₂/GL₃, including the positive-density tempered GL₂ places, then leaves only GL₁ as a possible constituent with nonzero exponent. A negative minimal exponent would give a pole of the twisted exterior-square L-function in Re(s)>1, contrary to its Jacquet–Shalika integral; the weighted sum of exponents is zero, so all vanish (Lemmas 4.1.3–4.1.5 and Proposition 4.1.6, pp.153–155).

For a general Π use the induction on local solvable-base-change complexity in §4.2, pp.156–158, and the isobaric descent in Appendix 1, pp.171–175. Here is the needed precise choice of cyclic extensions. Order the local complexity and its largest first cyclic prime lexicographically, as in Kim §4.2. Choose p maximal among the places of maximal complexity, and prescribe the complexity-lowering degree-p extension at precisely the places attaining both maxima. This decreases the ordered complexity after base change; it does not require all bad places to admit the same first prime. For each good place v construct infinitely many global degree-p extensions with those prescriptions and with v split, requiring ramification at a fresh auxiliary place unramified in all previously chosen extensions. Prime-degree Grunwald and class field theory make them distinct. Enumerate these choices over all v; discard the finitely many extensions giving a cuspidal self-twist of Π. On pairwise composita the lifts agree by their unramified parameters and isobaric strong multiplicity one, so the descent criterion applies. Every fixed good v still splits in infinitely many remaining extensions and hence its descended parameter is ∧²rec(Π_v). This construction avoids the incorrect general assertion that any finite family of cyclic extensions has a prime inert in all its members; the three quadratic subextensions of a biquadratic extension already disprove that assertion.

**Strong local comparison, including residue characteristics 2 and 3.** Kim's Lemma 5.2.1 and Propositions 5.2.3–5.2.4, pp.162–164, first compare the rank-m twisted factors for nonsupercuspidal inputs by multiplicativity, for a globalization with just one bad place by a functional-equation comparison, and for the remaining monomial supercuspidals by induction of Weil characters. Globalize the testing supercuspidal of GL_m and twist trivially at the designated place and highly ramified at every other bad place. Cancellation in the two global functional equations isolates the desired local γ-factor. The local converse theorem uses tests of ranks 1 through 4; equality for characters alone is insufficient for GL₆. Two choices of a good omitted place in the converse theorem and isobaric strong multiplicity one patch the lift (Theorem 5.3.1, p.165). This proves compatibility at infinity and at the finite places other than the outstanding wild supercuspidals above 2 and 3.

For those places use [Henniart 2009](#ref-henniart-2009), not a conjectural factor identity. Construct an auxiliary quartic local Weil representation S with ∧²S irreducible. Take an A₄-extension M/K above 2, its index-four subgroup C₃, and an invariant character of a normal-basis unit lattice. Choose the character to distinguish its V₄-conjugates and their pairwise products; pro-2 vanishing of H¹(C₃,−) extends it, so induction from the quartic subfield gives S. The six distinct characters in ∧²S form one A₄-orbit. CM-globalize this monomial datum with regular infinity type: known automorphic induction and the regular algebraic Galois construction identify its exterior-square transfer and prove that the auxiliary transfer is cuspidal (Henniart §§2.2–2.6, pp.38–40).

Now CM-globalize an arbitrary designated GL₄ supercuspidal, up to an unramified twist, together with this auxiliary component at a second place. Choose distinct infinity weights a₁>⋯>a₄ with a₁+a₄>a₂+a₃; their six pair sums are distinct. The auxiliary local component forces Kim's global lift to be cuspidal, and both global representations are regular conjugate self-dual. Their compatible Galois representations agree, after the prescribed dual/Tate normalization, as `r₆≅∧²r₄⊗ν` by unramified compatibility and Chebotarev. Full finite-place local–global compatibility, including monodromy, gives the equality of local Weil–Deligne parameters at the designated place. Remove the auxiliary unramified twist with its square. This proves the comparison in all residue characteristics (Henniart §§3.1–3.4, pp.41–43). The archimedean assertion is already Kim's and Shahidi's, rather than a consequence of this p-adic argument.

**Symmetric fourth and cuspidality.** Set A₃=Sym³π⊗ω_π^{−1}. On local parameters,
`∧²A₃=(Sym⁴π⊗ω_π^{−1})⊕ω_π`.
If A₃ is cuspidal, Kim's pole calculation (Theorem 7.3.1, p.168) identifies ω_π as an isobaric constituent of its exterior square. Remove it and twist by ω_π. Equality of the direct-sum local parameters permits cancellation of that character even at wild places, giving the all-place Sym⁴ lift. If π is dihedral use the explicit quadratic-induction decomposition; if it is tetrahedral with Ad(π)⊗η≅Ad(π), η³=1, use `Sym⁴π⊗ω_π^{−1}=Sym²π⊞ω_πη⊞ω_πη²` (Kim §7.1, p.167). For the cuspidal A₃ case the only possible failure is a GL₂⊞GL₃ decomposition. A pole of its GL₂ Rankin–Selberg test, the generic GSp₄ descent of A₃, and the Sp₈ Eisenstein/intertwining calculation force a nontrivial quadratic η with A₃⊗η≅A₃. Quadratic base change then reduces to the tetrahedral case; conversely that self-twist gives the pole and both constituents. Thus the exceptions are exactly dihedral, tetrahedral and octahedral ([Kim–Shahidi 2002](#ref-kim-shahidi-cuspidality), Proposition 3.3.6, Theorem 3.3.7 and Proposition 3.3.8, pp.183–186).

**API.** `exteriorSquareCandidate / exteriorSquareCandidate_local / exteriorSquareCandidate_twist` construct the restricted tensor product of local LLC images, compute its local parameter, and send a twist χ to a twist χ². `spinAdjointFactors / normalizedSpinIntertwiner` expose the two summands, normalized operators, multiplicativity and the stated holomorphic nonzero region. `auxiliaryExteriorSquareCuspidal` constructs the quartic auxiliary representation with its irreducible exterior square, and `exteriorSquare_local_allPlaces` supplies the final parameter equality. `symmetricFourth / symmetricFourth_local / symmetricFourth_cuspidal_iff` construct the GL₅ summand, compute its parameters and state the three precise exceptions. These operations use the existing local LLC and global isobaric sum interfaces, with uniqueness from local LLC and strong multiplicity one.

**Checks.**

- For diagonal parameter (a,b,c,d), the exterior square has eigenvalues ab,ac,ad,bc,bd,cd; its determinant is (abcd)³. Thus its central character is ω_Π³, including for scalar parameters. The exponent 2 printed in several places of Henniart 2009 fails this dimension-six test.
- A character twist χ of a four-dimensional parameter twists its exterior square by χ², and ∧²(U⊕V)=∧²U⊕(U⊗V)⊕∧²V. For a special Weil–Deligne block retain the induced nonzero monodromy; semisimplifying the Weil representation alone fails this check.
- For m=1 the second adjoint summand is zero, whereas for m=2 it is det Std₂⊗det Std₄. At Re(s)=1/2 allow the equal-largest-exponent factorization; a character χ whose 24th power is unramified does not meet the global entireness hypothesis.
- In the auxiliary A₄ construction the six characters must be distinct and have a transitive orbit; inducing from a character with equal V₄-conjugates does not give the claimed irreducible ∧²S. Distinct a_i alone do not ensure distinct pair sums: (3,2,1,0) fails, while (8,4,1,0) works. Its CM conjugate place must also be included in the polarization data.
- ∧²(Sym³V⊗det(V)^{−1}) has dimensions 5+1 and the displayed determinant twist; the tetrahedral GL₅ decomposition has dimensions 3+1+1. For V=χ⊕χ the two sides have scalar eigenvalues χ² with multiplicities six and five-plus-one, respectively. In the dihedral case Sym⁴ has its middle character and is noncuspidal, whereas a non-solvable-polyhedral input has cuspidal Sym⁴. These test extraction, twisting and the cusp criterion separately.
- Over ℝ the factors of an induced two-dimensional Weil character use Γ_ℂ and its λ(C/ℝ,ψ) multiplier; over ℂ they are products of character factors. A twist test only at unramified finite places cannot establish either comparison.

For π attached to a non-CM elliptic curve over ℚ, Sym⁴π is cuspidal on GL₅.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Theorem 9.3.1, §9.3, p. 258 (arXiv v3); [Arthur's multiplicity formula for GSp4 and restriction to Sp4](#ref-gee-taibi-2019), §1.1, p. 2 (arXiv v1); [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](#ref-kim-2003), §1, Theorem A, p. 139 (= Theorem 5.3.1) (J. Amer. Math. Soc. 16); [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](#ref-kim-2003), Introduction, Theorem B, PDF p.2 (printed p.140).)

*Needs:* [Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube](#kim-shahidi-sym3); [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="low-rank-symmetric-powers"></a>
### 1.15 Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)

Let F be a totally real field and π a cuspidal regular algebraic automorphic representation of GL₂(𝔸_F) without CM. Then for 1 ≤ n ≤ 5 the lift Sym^{n−1}π exists as a regular algebraic essentially self-dual cuspidal automorphic representation of GL_n(𝔸_F): this is the statement SP_n of Newton–Thorne for n ≤ 5, the base case of their induction.

F totally real; π regular algebraic cuspidal non-CM.

State the resulting comparison as `TauCeti.Functoriality.sp_le_five`.

n ≤ 3: π itself and Gelbart–Jacquet (cuspidal since non-CM ⇒ non-dihedral). n = 4, 5: Kim–Shahidi and Kim; cuspidality since a regular algebraic non-CM π is not tetrahedral or octahedral (its Galois representations have open image, Ribet). Regular algebraic and essentially self-dual: Sym^{n−1}π ≅ (Sym^{n−1}π)^∨ ⊗ ω_π^{n−1}; regularity from the Hodge–Tate weights of Sym^{n−1} r_ι(π). Newton–Thorne take the base case as known without citation.

Newton–Thorne 2026 §1: SP_n is known for 1 ≤ n ≤ 5.

([Newton–Thorne, Hilbert](#ref-nt-2026), Proof of Theorem 6.4, §6, p. 50 (arXiv:2212.03595v2); [Newton–Thorne, Hilbert](#ref-nt-2026), §1, p. 3 (arXiv:2212.03595v2).)

*Needs:* [GL2AutomorphicRepresentationsAndTransfer §R17.4.13](https://github.com/TauCetiProject/TauCetiRoadmap/pull/931); [Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube](#kim-shahidi-sym3); [Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)](#kim-sym4); [The statement SP_n (Newton–Thorne, Conjecture B)](#sp-statement); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

### Examples

For the identity representation of GL₂(𝔽₇), the projective image is PGL₂(𝔽₇), containing PSL₂(𝔽₇). At rank n=3 the strict bound is 7>max(5,5), so the sandwich holds. For 𝔽₅, equality with the lower threshold excludes the hypothesis. A dihedral automorphic representation has a noncuspidal symmetric-square lift; this is an isobaric transfer, not an instance of the cuspidal SP predicate.

### Dependencies

The layer uses the exact supplier contracts above, AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), AnalyticNumberTheory, Layer AN.4, TauCetiRoadmap.Chebotarev, Layer 10, Layer 0, ClassicalSerreModularity, Layer R27.6 (weight one descent from infinitely many primes), ClassicalSerreModularity, Layer R27.6 (unramified residual representations arise in weight one), ClassicalSerreModularity, Layer R27.6 (full classical serre theorem), PotentialModularityAndCompatibleSystems, Layer R24.6 (residual members), PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified), SerreWeightAndLevelOptimisation, Layer R20.3 (weight one forms unramified at p), AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation), PotentialModularityAndCompatibleSystems, Layer R23.1, AutomorphicGaloisRepresentations, Layer R19.2, GL2ModularityLifting, Layer R22.5, GlobalGaloisDeformations, Layer R04.2 (universal deformation ring), [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2), EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.ProjGenLinGroup.map`, `Matrix.ProjectiveSpecialLinearGroup.toPGL`, GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, GL2AutomorphicRepresentationsAndTransfer, Layer R16.3, AutomorphicLFunctionsAndLocalFactors, Layer AL.4.

## Layer 2: controlled potential automorphy and compatible systems

<a id="potential-diagonalizability"></a>
### 2.1 Potential diagonalizability and its criteria

For a continuous integral potentially crystalline representation ρ:G_K→GL_n(O), call ρ diagonalizable when it connects, on the fixed residual and labelled-Hodge crystalline lifting space, to a direct sum of crystalline characters. Call it potentially diagonalizable if this holds after restriction to some finite K′/K. The residual model, Hodge multisets and common field of crystallinity are part of the comparison. Use LocalGaloisDeformationRings §6.8 for connects and its operations. This definition does not identify different Hodge types or replace a component by its set of all points.

**API.**

- `IsDiagonalizable / IsPotentiallyDiagonalizable` compare the actual crystalline lift, its Hodge type and residual model with a direct sum of crystalline characters on the same irreducible component, before or after finite restriction.
- `potentiallyDiagonalizable_restrict / _extendCoefficients / _connects` transport that component witness under the permitted restrictions, coefficient extensions and connects relation.
- `potentiallyDiagonalizable_sum / _tensor / _dual / _twist` carry the residual model, Hodge lists and component comparison through the corresponding representation operations.
- `potentiallyDiagonalizable_flag / _fontaineLaffaille` supply the two sufficient criteria stated above, including the integral interval bound and its repeated weights. Prove that a potentially crystalline representation with a full invariant flag of character quotients is potentially diagonalizable. Also prove the Fontaine–Laffaille criterion: K/ℚ_ℓ unramified, ρ crystalline and HT_τ(ρ)⊂[a_τ,a_τ+ℓ−2] for every τ imply potential diagonalizability, without a distinctness assumption. The proof lifts a residual character flag in the exact Fontaine–Laffaille category and uses its crystalline-component comparison.

**Checks.**

- A crystalline character is diagonalizable in rank one.
- The two trivial characters have repeated weights and are still diagonalizable.
- Over an unramified 5-adic field the crystalline weight list {0,3} meets the interval criterion, whereas {0,4} does not follow from it.
- A noncrystalline Tate-curve extension is semistable ordinary but fails the potentially crystalline premise; calling every semistable ordinary representation potentially diagonalizable is false.

([BLGGT](#ref-blggt-2014-v4), §1.4 pp.26–29, Lemmas 1.4.1–1.4.3; the last criterion is Lemma 1.4.3 p.29.)

*Needs:* LocalGaloisDeformationRings §6.8, connects and component operations; PadicHodgeTheory, potentially crystalline representations; FiniteFlatGroupsAndIntegralPadicHodgeTheory, Fontaine–Laffaille category and exact fully faithful Galois functor.

<a id="polarized-lifting-extensions"></a>
### 2.2 Polarized component-preserving and ordinary lifting

Import the rank-two ordinary implication and finiteness from PotentialModularityAndCompatibleSystems §8.6. Construct the component-preserving implication and the higher-rank ordinary extension as these two **separate** statements on actual polarized representations; residual automorphy refers to a lift of the same residual pair, rather than automorphy of the given characteristic-zero representation.

1. BLGGT Theorem 2.3.1: F imaginary CM, ℓ odd, ζ_ℓ∉F, (r,µ) algebraic polarized of rank n≥1; r̄ irreducible with adequate cyclotomic restriction. Suppose the residual pair has a regular algebraic cuspidal polarized seed (π,χ) potentially prime to ℓ, and r connects to r_ι(π) at **every** finite place, with equal Hodge lists at ℓ. Then (r,µ) is automorphic potentially prime to ℓ. If π is prime to ℓ and r is crystalline, obtain level prime to ℓ.
2. Theorem 2.4.1: F CM or totally real, ℓ odd, ζ_ℓ∉F, (r,µ) algebraic polarized with the same irreducibility/adequacy assumptions; r ordinary at every ℓ-place and its residual pair ordinarily automorphic. Then r is ordinarily automorphic, with the prime-to-ℓ and potentially-prime-to-ℓ refinements when r is respectively crystalline or potentially crystalline.


State `polarized_component_lifting` and `polarized_ordinary_lifting`. Construct the minimal/ordinary polarized global deformation problems and their arithmetic finite-ring and automorphic support theorems, with adequacy replacing older bigness (Theorems 2.3.2 and 2.4.2). For rank two the ordinary construction is the cited supplier; for general rank use its higher-rank ordinary Hecke modules and support comparison. These are arithmetic applications of the lower-tier patching algebra, rather than algebraic consequences of it alone. Soluble descent concerns the same representation. Ordinary ACC+ lifting over non-self-dual CM fields is a different imported theorem. The ordinary finiteness assertion is available here before the Dwork construction and prescribed lifts.

**Checks.**

- Equal residual reductions alone do not discharge (1)'s local component conditions.
- An ordinary noncrystalline lift meets (2)'s ordinary conclusion but gains no crystalline level guarantee.
- ℓ=2 is excluded from both assertions.
- An adequate image condition is imposed on the specified cyclotomic restriction, rather than on an unrelated residual image.

([BLGGT](#ref-blggt-2014-v4), Theorems 2.3.1–2.3.2 pp.38–39, 2.4.1–2.4.2 pp.39–40.)

*Needs:* PotentialModularityAndCompatibleSystems §8.6, rank-two ordinary lifting and finiteness; LocalGaloisDeformationRings, potentially crystalline and ordinary component rings; GlobalGaloisDeformations, polarized deformation problems; DeformationAndDerivedPatchingAlgebra, patched support and finiteness; PotentialAutomorphyInfrastructure Layer 2, soluble descent; PotentialAutomorphyInfrastructure Layer 5, the imported patching and soluble descent inputs.

<a id="integral-cm-degree-shifting"></a>
### 2.3 Integral P-ordinary control and degree shifting

Construct the **actual arithmetic** P-ordinary complexes for the Siegel parabolic P of the quasi-split U(n,n) over F⁺, with Levi Res_{F/F⁺}GL_n. Use CN's good compact opens, parahorics P(b,c), integral dominant coefficient lattices, unnormalized Satake map and rescaled Siegel operator Ũ_n. The ordinary part inverts Ũ_n alone; Q-ordinarity imposes invertibility of every selected partial-block operator. For a torsion coefficient exponent m construct the smooth completed boundary tower and `POrd=ord RΓ(U₀,−)` with its Δ⁺ transfer action. Prove finite-level recovery by compact Levi derived invariants, coefficient weight independence, and the Hecke-equivariant split boundary summand of CN Corollary 4.1.9. These use derived smooth invariants and integral transfer, rather than a characteristic-zero Jacquet calculation.

**API.**

- `CMOrdinaryComplex / CMOrdinaryBoundary` are the actual finite and completed ordinary complexes, compatible with level maps and coefficient reduction.
- `ordinaryProjector / compactLeviRecovery` localize the rescaled Siegel action and identify its derived compact-Levi invariants with finite level.
- `SiegelBoundarySummand` is the Hecke-equivariant split boundary summand with the stated Satake normalization and dual twist.

Prove the degree-shifting comparison in both ranges of cohomological degree: ordinary boundary classes from GL_n map into unitary middle degree after adding sufficiently many p-adic places, with a uniform nilpotent Hecke kernel. For q<⌊dim(X_K)/2⌋ use Poincaré duality and the untwisted Satake map, keeping the r̄(−n) lower block distinct from the upper r̄ block. In the upper range use the w₀^P-twisted Satake map and the upper block. Prove the generic unitary eigensystem is cuspidal and Q-ordinary; use AG2.6 for its crystalline blocks. The residual separating character must force the selected block's irreducible constituents to be those of r̄_m, and not those of r̄_m^{∨,c}(1−2n). Apply IntegralHeckeAndGaloisDeterminants' **integral** constituent reconstruction and Carayol descent to the same Hecke algebra. This yields finite-flat local lifts modulo a bounded nilpotent ideal, in each degree and coefficient exponent; it does not assert that every torsion class lifts globally to one automorphic form.

**Checks.**

- For Ũ_n=1 the ordinary complex is the entire complex; for Ũ_n=0 it is zero; for diag(1,0) on 𝔽₃² in degree zero it is the first coordinate.
- Inverting only Ũ_n need not invert a second partial operator: with the latter zero, POrd is nonzero and QOrd is zero.
- The lower-degree dual argument has lower block r̄(−n), whose twist back has the original weights; omitting that twist shifts every weight.
- Degree-zero control alone does not provide the all-degree theorem.

([Caraiani–Newton](#ref-caraiani-newton-2023), §§1.2–1.3 pp.13–19; Theorem 2.2.8, Propositions 2.2.17 and 2.3.11, pp.32–44; Corollary 4.1.9 pp.56–57; Propositions 4.2.2 and 4.2.8, pp.58–65; Proposition 4.2.13 and its separating-character proof, pp.67–71.)

*Needs:* PotentialAutomorphyInfrastructure Layers 1–4, unitary towers and integral Siegel boundary; SmoothRepresentationsOfLocalGroups, smooth monoid localization, derived compact invariants and contracting open-cell vanishing; ArithmeticLocallySymmetricSpaces, finite-level Hecke complexes and Poincaré duality; EnhancedDerivedSheaves, derived limits and smooth coefficient categories; IgusaVarietiesAndTorsionConcentration, decomposed-generic middle-degree concentration; IntegralHeckeAndGaloisDeterminants, integral constituent reconstruction; AutomorphicGaloisRepresentationsPartII §AG2.6, characteristic-zero crystalline local–global compatibility.

<a id="integral-cm-local-global"></a>
### 2.4 Crystalline and semistable-ordinary integral Hecke representations

Let F be imaginary CM containing an imaginary quadratic subfield in which p splits. Let T contain the p-adic places, be stable under c, and satisfy: for each v∉T of residue characteristic ℓ, either T has no ℓ-adic place and ℓ is unramified in F, or ℓ splits in an imaginary quadratic subfield of F. Let K be good and hyperspecial outside T, λ dominant, and v̄≠v̄′ two p-adic places of F⁺. Require
`Σ_{ū≠v̄,v̄′}[F⁺_{ū}:ℚ_p] ≥ [F⁺:ℚ]/2`.
Choose Q_{v̄}⊂P_{v̄}, put K_{v̄}=Q_{v̄}∩GL_n(F⊗F⁺_{v̄}), and let 𝔪 be a non-Eisenstein decomposed-generic maximal ideal in the support of H*(X_K,V_λ), with all rescaled operators indexed by X_{Q_{v̄}} invertible at 𝔪. Then the **derived integral** localized Hecke algebra modulo an ideal J, J^N=0 for N depending only on n and [F⁺:ℚ], carries a continuous r_𝔪 with the good-place polynomials. The local deformation maps factor as follows: Q=P gives crystalline lifts at both conjugate places; Q=B_{2n} gives semistable-ordinary lifts at both; Q of type (n,1,…,1) gives ordinary at the selected place and crystalline at its conjugate. Weights are {λ_{τ,n},…,λ_{τ,1}+n−1} in each case. If p∤n and an O-valued crystalline determinant ψ of the required summed weights is fixed, these maps factor through the fixed-determinant quotients.

State `CMHeckeRepresentation.local_type` and `CMHeckeRepresentation.fixedDet`. Apply [integral degree shifting](#integral-cm-degree-shifting) to each torsion exponent and every cohomological degree; bounded nilpotence and the derived-Hecke inverse-limit comparison assemble the result. The finite-flat local lift is used with the scheme-theoretic characterizing property of the local lifting ring, including finite nonreduced coefficient algebras. Pointwise crystallinity over fields is insufficient for this conclusion.

**Checks.**

- There is no lower bound on p, nor a Fontaine–Laffaille interval in this theorem.
- A ramified p-adic local field is permitted.
- Two distinguished p-adic places alone fail the degree inequality, since the left side is zero.
- Killing the nilpotent ideal is part of the conclusion; asserting J=0 is stronger.
- Fixed determinant needs p∤n even though the unfixed assertion does not.

([Caraiani–Newton](#ref-caraiani-newton-2023), Theorem 4.2.15 and proof pp.71–72; Corollary 4.2.16 p.72; lifting-ring characterizations §3.3.)

*Needs:* [integral P-ordinary control and degree shifting](#integral-cm-degree-shifting); LocalGaloisDeformationRings, crystalline and semistable-ordinary lifting rings over finite coefficient algebras; IntegralHeckeAndGaloisDeterminants, inverse limits and bounded nilpotence.

<a id="component-connects-lifting"></a>
### 2.5 Weight-zero lifting on a specified crystalline component

Let F be imaginary CM or totally real, p>n prime and ρ:G_F→GL_n(ℚ̄_p) continuous, unramified at almost every place. At every v|p require ρ crystalline with every labelled Hodge multiset {0,1,…,n−1}. Require ρ̄ absolutely irreducible and decomposed generic, ρ̄(G_{F(ζ_p)}) adequate after a sufficiently large residual coefficient extension, and a σ∈G_F\G_{F(ζ_p)} with ρ̄(σ) scalar. Suppose π is cuspidal, regular algebraic of weight zero, with r̄_ι(π)≅ρ̄, π_v unramified for v|p, and r_ι(π)|G_{F_v} connecting to ρ|G_{F_v} on the weight-zero crystalline lifting ring. Then ρ≅r_ι(Π) for a regular algebraic cuspidal Π of weight zero. It is unramified at v|p and at every finite v where both ρ and π are unramified. Ramification of F at p is allowed.

State `TauCeti.PotentialAutomorphy.weightZero_of_connects`. Import the *definition and operations* on connects from LocalGaloisDeformationRings §6.8, not a theorem identifying all components. Construct the arithmetic lifting extension here: BCGNT §3.2 first proves the CM patching statement with sufficiently many p-adic places; use the characteristic-zero cohomology comparison and the weight-zero crystalline local–global theorem of Caraiani–Newton §4.3 to put the seed on the specified local components. Patch the component-restricted complexes using DeformationAndDerivedPatchingAlgebra's amplitude/codimension theorem and the ACC+ Taylor–Wiles construction. Soluble CM base change supplies the extra local-degree hypotheses; descend with PotentialAutomorphyInfrastructure Layer 2. The totally real case passes through a CM extension. Adequacy, decomposed genericity and the scalar-outside-cyclotomic condition must be preserved under the chosen disjoint extensions. These are arithmetic steps owned by this target, rather than an enlargement of the imported ordinary theorem.

**Checks.**

- For n=2 the labelled weights are {0,1}; a pair {0,2} is outside the theorem.
- Two lifts of the same residual representation lying on different crystalline components do not meet the seed hypothesis.
- A ramified p-adic base field is permitted; replacing p>n by p≥n is not.
- At a place where only ρ is unramified the stated level guarantee does not follow.

([BCGNT](#ref-bcgnt-2025), Theorem 3.2.1 and Remark 3.2.2, arXiv v3 pp.35–36; Theorem 3.2.5 and proof pp.37–41; [Caraiani–Newton](#ref-caraiani-newton-2023), Theorem 4.3.1, p.73.)

*Needs:* LocalGaloisDeformationRings §6.8; PotentialAutomorphyInfrastructure Layers 2 and 5; DeformationAndDerivedPatchingAlgebra, patched complexes and codimension concentration; ArithmeticLocallySymmetricSpaces, localized cohomology complexes; AutomorphicGaloisRepresentationsPartII, crystalline weight-zero local–global compatibility; [C-GALOIS](#contract-c-galois).

<a id="potentially-semistable-cm-lifting"></a>
### 2.6 Rank-two potentially semistable lifting over a CM field

Let F be imaginary CM, p odd and ρ:G_F→GL₂(ℚ̄_p) continuous, finitely ramified, with det ρ=ε_p⁻¹. For every v|p suppose ρ is potentially semistable with labelled weights {0,1}. Require ρ̄ decomposed generic and ρ̄|G_{F(ζ_p)} irreducible. If p=5 and the projective image of this restriction is PSL₂(𝔽₅), require that the field cut out by the projective representation of G_F does not contain ζ₅. Suppose π is a cuspidal PGL₂(𝔸_F) representation, regular algebraic of weight zero, with r̄_ι(π)≅ρ̄ and the following local matching at each v|p. Where ρ is potentially crystalline, r_ι(π) is potentially ordinary of weight zero exactly when ρ is, and N(rec(π_v))=0. Where ρ is not potentially crystalline, π is ι-ordinary of weight zero and r_ι(π) is not potentially crystalline. Then ρ≅r_ι(Π) for a cuspidal PGL₂(𝔸_F) representation Π of weight zero.

State `TauCeti.PotentialAutomorphy.potentiallySemistableCM`. This is Caraiani–Newton **Theorem 5.2**, not their Theorem 1.3. Construct its arithmetic extension of ACC+ patching: §5.3 sets up the two local components and fixed inverse-cyclotomic determinant; §§5.4–5.5 prove the ordinary/nonordinary and crystalline/noncrystalline component comparisons and generic reducedness of the special fibres; §5.6 performs the modified patching and Ihara avoidance. Use their integral local–global comparison to identify the seed components. Import the local rings, Hecke complexes and abstract patching algebra, but own these component and support arguments here. Neither a polarization of ρ nor an enormous residual image nor a scalar outside G_{F(ζ_p)} is an extra hypothesis of this theorem.

**Checks.**

- A potentially ordinary crystalline lift cannot use a nonordinary crystalline seed.
- A noncrystalline semistable lift needs a noncrystalline ordinary seed, so an unramified seed does not suffice there. p=3 with residual SL₂(𝔽₃) is included when the listed hypotheses hold; adding adequacy would wrongly remove it.
- For p=5 the exceptional projective-kernel condition is tested on G_F, not just on its cyclotomic subgroup.

([Caraiani–Newton](#ref-caraiani-newton-2023), Theorem 5.2 and Remarks 5.2.1–5.2.3, arXiv v3 pp.73–74; §§5.3–5.6 pp.74–86.)

*Needs:* LocalGaloisDeformationRings, potentially semistable/ordinary loci; PotentialAutomorphyInfrastructure §5.23, for the underlying ACC+ ordinary patching framework; DeformationAndDerivedPatchingAlgebra; ArithmeticLocallySymmetricSpaces; [integral CM local–global compatibility](#integral-cm-local-global); [C-GALOIS](#contract-c-galois).

<a id="cg-conjecture-b"></a>
### 2.7 The complete Calegari–Geraghty Hecke-cohomology hypothesis

Define `CGConjectureB` for the GL_n locally symmetric spaces, coefficient ring O, levels Y₁(Q), auxiliary characters ψ and Taylor–Wiles deformation problems of Calegari–Geraghty §9.1. For each Hecke maximal ideal it specifies a continuous semisimple residual Galois representation with unramified characteristic polynomial

```text
X^n + Σ_{i=1}^n (−1)^i N(v)^{i(i−1)/2} T_{v,i} X^{n−i}.
```

For every non-Eisenstein ideal it requires a lift over the completed Hecke algebra with the same polynomials. With the residual representation and Taylor–Wiles sets of §8.5 fixed, retain **all five further requirements**: (1) Fontaine–Laffaille local representations at p with weights {0,…,n−1}; (2) the specified local deformation type at each x∈Q; (3) at each v∈R the characteristic polynomial on inertia is the product of the prescribed ψ_{v,i}∘Art_v⁻¹; (4) localized cohomology modulo every power of the uniformizer vanishes outside [q₀,q₀+l₀], and localized Borel–Serre boundary cohomology vanishes in every degree; (5) the product of the projectors lim_k Q_x(V_x)^{k!} identifies the localized base-level cohomology with the chosen eigensummand at Y₀(Q). Here (X−α_x)Q_x(X) is the residual Frobenius polynomial and the chosen auxiliary maximal ideal also imposes V_x−α_x. The conjecture is an input proposition, not a field declaring these assertions proved.

**API.**

- `cgResidualRealization / cgCompletedHeckeRealization` refer to the residual maximal ideal and completed Hecke action on the same cohomology complexes.
- `cgLocalConditions / cgAmplitude / cgBoundaryVanishing` project the stated local, cohomological and non-Eisenstein clauses, with their uniform bounds.
- `cgTaylorWilesComparison / cgCharacterDeformation` give the level and character-deformed comparison maps; the induced global deformation map is surjective onto that Hecke algebra. Keep the local deformation problems and the Hecke operators on the actual complexes; a collection of unrelated representations does not meet the contract.

**Checks.**

- For n=2 the good polynomial is X²−T_{v,1}X+N(v)T_{v,2}, not X²−T_{v,1}X+T_{v,2}.
- A system satisfying only residual Galois existence fails the amplitude and boundary clauses.
- An Eisenstein ideal does not acquire the completed irreducible lift from the non-Eisenstein clause.
- The empty Taylor–Wiles set makes the product projector the identity, but retains the cohomology-vanishing requirements.

([Calegari–Geraghty](#ref-cg-2018), Conjecture B, §9.1, arXiv v2 pp.86–87; Remark 9.5 p.87.)

*Needs:* ArithmeticLocallySymmetricSpaces, Borel–Serre boundary and integral Hecke complexes; GlobalGaloisDeformations, local deformation problems and their global representability; LocalGaloisDeformationRings, Fontaine–Laffaille loci. This target defines the conjectural hypothesis only.

<a id="general-number-field-lifting"></a>
### 2.8 Conditional weight-zero lifting over an arbitrary number field

Assume [CGConjectureB](#cg-conjecture-b). In the **native Calegari–Geraghty convention**, with HT(ε)={+1}, let F be any number field, p>n unramified in F, O a finite p-adic coefficient ring and r:G_F→GL_n(O) continuous and finitely ramified. Require r crystalline at p with every labelled weight {0,…,n−1}; r̄|G_{F(ζ_p)} absolutely irreducible; F(ad⁰ r̄) not containing F(ζ_p); and r̄ big in CHT Definition 2.5.1. At every real place require tr r(c)∈{−1,0,1}. At every ramified finite x require unipotent inertia, and, if r̄ is unramified there, N(x)≡1 mod p. Require det r=ε^{n(n−1)/2}. Finally either (a) there is a cuspidal π₀ of trivial infinitesimal character, unramified at p, whose native Galois representation has the same residual representation and satisfies that same unipotent/norm condition; or (b) r̄ is Serre modular of minimal level N(r̄), and r has no ramification beyond that of r̄. Then there is a regular algebraic cuspidal π of trivial infinitesimal character with the full L-function equality of Theorem 5.16.

State `TauCeti.PotentialAutomorphy.cg_generalField` with the conjecture as an explicit argument. For use with the cohomological convention of this roadmap apply it to the dual representation: its determinant is ε^{−n(n−1)/2} and its positive Hodge list is {0,…,n−1}. Carry the dual local-factor dictionary in the conclusion as well; changing just the determinant is insufficient. A mod-p cohomology class in branch (b) is not assumed to lift to characteristic zero.

The proof is the arithmetic application of DeformationAndDerivedPatchingAlgebra: construct the integral minimal and character-deformed complexes and Taylor–Wiles levels of §§7–8; the five clauses of Conjecture B give the local deformation maps, amplitude, boundary removal and level comparison. Theorem 9.19 establishes the needed support and faithfulness by patching, using the local dimension formula and character deformation to compare components. Theorem 5.16 follows. This target owns these arithmetic verifications and does not enlarge an ordinary CM lifting theorem to all fields.

**Checks.**

- F may have both real and complex places.
- At n=2 the native determinant is ε and the dual determinant ε⁻¹.
- A prime where r is ramified and r̄ is unramified must have norm 1 modulo p; the opposite congruence is wrong.
- Dropping boundary vanishing from Conjecture B leaves the patching application unproved.
- Without the conjecture the conclusion remains conditional.

([Calegari–Geraghty](#ref-cg-2018), Theorem 5.16, arXiv v2 pp.64–65; Theorem 9.19 and proof pp.94–96; §10 pp.96–98.)

*Needs:* [CGConjectureB](#cg-conjecture-b); DeformationAndDerivedPatchingAlgebra, perfect complexes and codimension concentration; LocalGaloisDeformationRings, integral unipotent and Fontaine–Laffaille loci; GlobalGaloisDeformations; ArithmeticLocallySymmetricSpaces, integral Hecke complexes; [C-GALOIS](#contract-c-galois).

<a id="dwork-eigenrealizations"></a>
### 2.9 Dwork eigenrealizations and their common Frobenius data

Fix N>1, a coefficient embedding of M=ℚ(ζ_N), and the smooth family over `T₀=ℙ¹∖(µ_N∪{∞})` given by `Σ X_i^N=Nt∏X_i`. Let `H₀=ker(µ_N^N→µ_N)/µ_N`, with the diagonal subgroup in the denominator. A tuple a with `Σa_i=0` modulo N defines a character χ of H₀; tuples differing by a constant define the same character. For λ of residue characteristic different from N's prime divisors, define `DworkEigenrealization(N,χ,λ,t)` as the χ-eigensummand of the actual middle étale cohomology of the fibre, after coefficient extension. Its projector is `|H₀|⁻¹Σ_h χ(h)⁻¹h`; the integral lattice is specified over the coefficient localization where |H₀| is invertible. For the character chosen in Qian §3 its rank is n and its labelled Hodge numbers are consecutive, with the source's explicit character twist retained.

**API.**

- `fibre / symmetryAction / eigenprojector` take actual middle cohomology, its H₀-action and the displayed character-weighted projector; the projector is idempotent and distinct character projectors compose to zero.
- `eigenlattice / rank / hodgeMultiset` retain an integral projector where |H₀| is invertible, and compute rank and labelled Hodge multiset for Qian’s chosen character.
- `baseChange / goodFrobeniusPolynomial` identify the eigenrealizations after field extension and construct the common polynomial by symmetry-twisted Frobenius traces. The last polynomial is constructed by traces of symmetry elements composed with Frobenius, not by assigning independent polynomials to different λ. Its comparison with cohomology gives a common good-place polynomial under the chosen coefficient embeddings; it does not assert semisimplicity of the cohomology representation.

**Checks.**

- Multiplication of a representative `(ξ_i)` by a diagonal ζ multiplies its character value by `ζ^(Σa_i)=1`; omitting the sum-zero condition prevents descent.
- Adding b to every a_i multiplies the value by `(∏ξ_i)^b=1` on the product-one subgroup. This checks the quotient relation, independently of the diagonal check.
- For the trivial character the projector is averaging and fixes the invariant subspace. For two distinct characters the composite projectors are zero; the identity projector on the whole cohomology fails this test.
- At a residue characteristic dividing N the displayed integral projector is unavailable; this construction does not claim integral eigensplitting there. A smooth point of T₀ and a specified eigensummand are required.

([Qian, potential automorphy](#ref-qian-2023), §3, Lemmas 3.1–3.10, arXiv v1 pp.9–21; [Qian, ordinarity](#ref-qian-ordinarity), §1, pp.1–2; [Qian's thesis](#ref-qian-thesis-2023), Lemma 3.0.11, pp.53–55.)

*Needs:* EtaleCohomology, proper smooth base change and trace formula; PadicHodgeTheory, proper smooth de Rham comparison; representation-theoretic finite-group projectors over coefficients in which |H₀| is invertible.

<a id="dwork-semistable-log-comparison"></a>
### 2.10 Equivariant semistable models and the log-monodromy comparison

Let K/ℚ_p be finite, containing ζ_N, with p∤2N, and let s∈T₀(K) satisfy v(s)<0. After a finite totally ramified extension K′/K, construct an H₀-equivariant proper semistable model of the fibre at s. The extension and its ramification index are part of the output. Locally its charts have a product of coordinates equal to a uniformizer. This is potential semistability; semistability over K itself is not asserted.

For the log-smooth lift over `W(k)[T]` in Qian Proposition 1.5, apply CrystallineCohomology §CR.6.3’s proper one-parameter logarithmic comparison in every cohomological degree i. Its N is the supplied log differential boundary of §CR.6.1. Prove that these supplied maps commute with the actual H₀-action and hence restrict to the χ-eigenprojector. Over ℂ, algebraic-to-analytic log de Rham comparison commutes with that boundary map. Relate it to the residue of the Gauss–Manin connection and to the logarithm of topological monodromy. Tsuji's semistable comparison then identifies the χ-eigensummand with `D_st(V_λ,s)` for λ|p, for every embedding of the maximal unramified subfield. All comparisons commute with H₀; coefficient conjugation changes χ to the corresponding conjugate character.

**API.**

- `equivariantSemistableModel` returns the finite extension, its ramification index, the proper semistable model and the extension of the actual H₀-action.
- `dwork_hyodoKato_eigenprojector` restricts the imported comparison to each character summand and commutes with finite coefficient extension.
- `dwork_logGAGA_boundary / dwork_topologicalMonodromy_comparison` identify the log boundary, connection residue and topological logarithm, with the stated ramification scaling. The general log triangle and Hyodo–Kato map remain imports. The comparison is first proved for all i; only its middle χ-summand is specialized to the Dwork application.

**Checks.**

- A ramified extension `T↦T^e` rescales the logarithm of unipotent monodromy by e. In characteristic zero a nonzero e preserves the nilpotence index; reducing that scalar modulo p would not justify this argument.
- For `N₂=[[0,1],[0,0]]`, `N₂²=0` and `N₂≠0`; rescaling by 2 preserves index two over ℚ. Replacing N by zero loses the rank-two ordinary argument.
- Degree zero has trivial monodromy. The general comparison includes it; the later ordinary criterion imposes its own Hodge list and positive rank and does not declare all degree-zero objects rank n.
- Changing λ to a different coefficient prime is not this p-adic comparison. It requires the separate good-place transport and, for ramified N, strict compatibility.

([Qian, ordinarity](#ref-qian-ordinarity), Theorems 1.4, 1.6 and 1.8, pp.3–4; Proposition 1.5, p.3; §§2–3; proof of Theorem 1.1 and Lemma 4.3, pp.20–23.)

*Needs:* [Dwork eigenrealizations](#dwork-eigenrealizations); CrystallineCohomology §§CR.6.1–CR.6.3, monodromy, Hyodo–Kato and proper one-parameter logarithmic comparison; PadicHodgeTheory, semistable comparison; logarithmic differentials and algebraic/analytic de Rham comparison on the stated proper log-smooth lift.

<a id="coefficient-prime-dwork-ordinarity"></a>
### 2.11 Coefficient-prime ordinary Dwork fibres

With the same K,N,χ and positive rank n, require the consecutive labelled Hodge lists of the chosen Qian eigensummand, and a crystalline character twist making each list {0,…,n−1}. Suppose that the topological monodromy at infinity on every coefficient conjugate of the χ-eigensummand has minimal polynomial `(X−1)^n`. Then for every finite K₀/K and s∈T₀(K₀) of negative valuation, the actual λ-adic fibre at s, for λ|p, is de Rham, potentially semistable and regular ordinary. Here regular ordinary means a full Galois-stable flag by characters whose algebraic inertia exponents have one strict order at every embedding, with the labelled Hodge weights and finite-order factors of Qian Definition 1.2. In that definition the i-th inertia character has exponent `−(λ_{τ,n−i+1}+i−1)` and its Hodge number is `λ_{τ,n−i+1}+i−1`.

Import from PadicHodgeTheory §3.6 the weight-zero local criterion: a semistable n-dimensional representation with every labelled Hodge list {0,…,n−1}, whose N has nilpotence index n on every embedding of its `D_st`, is ordinary of weight zero. Its crystalline-character and dual/twist dictionary gives the version for translated consecutive lists, transporting the character as well as the Hodge numbers. Translate the supplier’s negative Hodge convention to the positive cohomological lists used here through that dictionary. The Hodge hypothesis is essential; maximal N alone does not imply ordinarity for arbitrary Hodge lists. Apply the log comparison, the maximal topological monodromy assumption and the criterion over K′; descend the ordinary flag to K₀. Use the supplier’s finite-extension descent theorem, whose proof uses uniqueness of the extreme-weight line and induction on the quotient. The geometrically constructed flag exists before global semisimplification or comparison with an automorphic representation.

The new theorem is `dwork_coefficientPrime_ordinary`; its output is the imported `RegularOrdinary` structure on this actual fibre, with subrepresentations, characters and labelled weights. The general criterion, character interpolation and descent are not reconstructed here.

**Checks.**

- Rank one with Hodge weight zero has N=0 and nilpotence index one, so it meets the criterion; a specified crystalline twist treats other character weights. Rank zero is excluded from the exponent-n assertion.
- A rank-two semistable object of weights {0,1} with one size-two N-block meets the criterion; two trivial characters have N=0 and are outside that sufficient criterion, although they can separately be ordinary. The criterion is sufficient, not an iff.
- Over ℚ₅ take φ=diag(5,25), N(e₂)=e₁, N(e₁)=0 and Fil¹=Fil²=Fil³=⟨e₁+e₂⟩. Then Nφ=5φN, t_N=t_H=3 and the only proper (φ,N)-stable line has t_H=0<t_N=1. This weakly admissible object has weights {0,3}, maximal N and no Galois-stable line; it refutes the criterion without its consecutive-weight hypothesis.
- For λ of residue characteristic p and s of negative p-adic valuation, the proof uses `D_st` at p. An auxiliary λ′≠p and its Weil–Deligne parameter cannot replace this step.
- The hypothesis is imposed on every conjugate χ, because the semistable comparison changes the coefficient embedding. Checking a single chosen complex embedding does not supply the other labelled N-blocks.

([Qian, ordinarity](#ref-qian-ordinarity), Theorem 1.1, p.2; Lemmas 4.1–4.2, pp.19–20; proof pp.20–23. The local criterion is [BLGHT](#ref-blght-2011) Lemma 2.2(2), published pp.44–45, including its weight-zero premise. Qian v1 Lemma 4.2 prints a broader assertion; only the BLGHT scope and its explicit character twists are used here. Qian, potential automorphy, Definition 1.2, pp.1–2.)

*Needs:* [Equivariant semistable and log comparison](#dwork-semistable-log-comparison); PadicHodgeTheory §3.6, labelled ordinary flags, crystalline characters, consecutive-list criterion and finite-extension descent; its exact de Rham/semistable realizations.

<a id="ordinary-subquotient-semisimplification"></a>
### 2.12 Ordinary subquotients, global semisimplification and residual lattices

For a regular ordinary representation of G_K with a fixed strict ordering of its character weights at every embedding, every stable subrepresentation and quotient is ordinary with the corresponding ordered subset of the weights. De Rham and potentially semistable representations are closed under these subquotients. In a short exact sequence the Hodge multiset of the middle term is the multiset union of those of the endpoints. Thus, for a global representation V that is regular ordinary locally, every global composition factor has an induced ordinary flag at that place, and the direct sum of those factors is again regular ordinary. Merge their flags in the original strict order. It has exactly V's Hodge multiset, with multiplicities. This proves ordinarity of the global semisimplification without assuming V itself semisimple.

Construct the induced flags by intersections and quotient images. For a stable integral lattice L, intersect with each subrepresentation and take saturated quotients; after residue-field extension, the semisimplification of the union of the graded reductions is the semisimple reduction of L. This assertion is independent of the chosen stable lattice. It concerns semisimple reduction, not an isomorphism of possibly nonsplit residual extensions.

**API.**

- `ordinary_subrepresentation / ordinary_quotient` construct flags by intersections and images, with the corresponding ordered subsets of characters.
- `ordinary_globalSemisimplification / hodgeMultiset_exact` merge the induced flags in the original strict weight order and preserve the full Hodge multiset.
- `saturated_graded_lattice / residual_semisimplification_preserved` produce integral graded lattices and compare their semisimple reductions with that of the original lattice, independently of its choice.

**Checks.**

- A two-step flag with distinct Hodge weights {0,1} gives the singleton subsets on a stable line and quotient, and gives {0,1} again on their sum. Repeating the weight zero on both factors fails the regularity conclusion.
- A nonsplit ordinary extension and its split semisimplification can have different N. For the Tate-curve representation `0→ℚ_p(1)→V→ℚ_p→0`, N has index two whereas N on its local semisimplification is zero. Neither N nor nonsplit extension data are claimed to survive semisimplification.
- The zero subrepresentation has the empty flag and empty Hodge multiset; the full quotient retains the original list. No fictitious rank-one character is attached to the zero object.
- Two stable lattices can have different nonsplit reductions. Their residual semisimplifications agree; demanding equality before semisimplification would be false.

([Qian, potential automorphy](#ref-qian-2023), Definition 1.2 and the semisimple transport in §4, pp.1–2,24–26; [Qian, ordinarity](#ref-qian-ordinarity), Lemma 4.1, pp.19–20. The flag/subquotient and lattice statements are the exact linear-algebra deductions needed to pass from these geometric fibres to that transport.)

*Needs:* [Coefficient-prime Dwork ordinarity](#coefficient-prime-dwork-ordinarity); PadicHodgeTheory, exactness of de Rham and potentially semistable representations; finite-length representation theory and Brauer–Nesbitt.

<a id="moret-bailly-galois-control"></a>
### 2.13 Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)

Let K^{(avoid)}/K/K₀ be number fields with K^{(avoid)}/K and K/K₀ Galois, S a finite set of places of K₀, and for v ∈ S_K a finite Galois L′_v/K_v with L′_{σv} = σL′_v. Let T/K be smooth and geometrically connected with non-empty Gal(L′_v/K_v)-invariant open Ω_v ⊆ T(L′_v). Then there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from K^{(avoid)} over K, and L_w ≅ L′_v with P ∈ Ω_v for w | v ∈ S_K.

Places and extensions as stated.

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_point_galois_control`.

Enlarge S (Weil bounds and Hensel give K_v-points for almost all v) so that each simple Galois subextension of K^{(avoid)}/K is non-split at some v ∈ S_K with L′_v = K_v; this gives linear disjointness. Reduce to L′_v = K_v by a soluble extension with prescribed completions (CHT Lemma 4.1.2) and its normal closure over K₀. Apply Moret-Bailly's Théorème 1.3 and take the normal closure over K₀.

Check the role of Ω_v: the point lies in the prescribed open at every place above S, which is what the Dwork-family argument needs at l_i, l′ and ∞.

([BLGGT](#ref-blggt-2014-v4), §3.1, Proposition 3.1.1, p. 41 (arXiv v4).)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R23.1 (moret bailly theorem incomplete skolem data have integral points); [C-MODULI](#contract-c-moduli).

<a id="polarized-dwork-potential-automorphy"></a>
### 2.14 Simultaneous residual symplectic potential automorphy

Let F/F₀ be finite Galois totally real, I finite, n_i positive even, ℓ_i odd, and r̄_i:G_F→GSp_{n_i}(𝔽̄_{ℓ_i}) continuous with open kernel and multiplier ε̄_{ℓ_i}^{1−n_i}. For a finite Galois avoidance extension F^av/F, construct one totally real F′/F, Galois over F₀ and disjoint from F^av over F, and regular algebraic cuspidal polarized pairs (π_i,χ_i) over F′ whose residual polarized representations are (r̄_i|G_{F′},ε̄_{ℓ_i}^{1−n_i}); every π_i is ι_i-ordinary of weight zero. No irreducibility of r̄_i is assumed.

State `residual_symplectic_potential_automorphy`. Construct the symplectic Dwork summands V_{n_i} over ℚ(ζ_N)⁺, with alternating perfect pairing after twist ((N−1−n_i)/2), and their paired trivialization covers at ℓ_i and one large auxiliary ℓ′. Retain the pairing and determinant in these moduli; an arbitrary χ-eigenspace with no self-duality witness cannot replace them. Prove the covers smooth and geometrically connected by their full geometric monodromy and coprime-level product, and their real and local nonemptiness by the prescribed −1 similitude and Dwork fibre comparisons. The auxiliary ℓ′-representation is induced from a character of a cyclic CM field of degree n_i, with separated infinity types, ordinary Hodge lists, adequate residual image and Steinberg local behaviour at ℓ_i. Moret–Bailly gives one point on the product cover. The ordinary lifting theorem 2.4.1 transports automorphy at ℓ′; the Steinberg component implies the original ℓ_i-ordinary assertion. This proof uses only the ordinary part of the preceding lifting target, not the later prescribed-lift or potentially-diagonalizable conclusions.

**API.**

- `pairedDworkSheaf / pairedTrivializationScheme` retain the actual sheaf, alternating form and multiplier, and represent isomorphisms preserving them.
- `pairedTrivialization_forget / _baseChange` give the map to the Dwork parameter scheme and its functoriality for field and coefficient extension.
- `pairedDwork_connected / _localPoints` prove the connectedness and real and finite-place nonemptiness required by Moret–Bailly.
- `pairedDwork_specialize` produces all residual identifications and ordinary automorphic seeds over the one returned extension. The unitary χ-family below has its own projector and need not be symplectic.

**Checks.**

- At n_i=2 the multiplier is ε̄⁻¹ and the ordinary Hodge list is {0,1}.
- Odd n_i is excluded from an alternating nondegenerate pairing.
- The empty family imposes only the field-extension constraints.
- A scalar-only residual image is allowed; adequacy is required of the constructed auxiliary seed, rather than imposed on every input r̄_i.

([BLGGT](#ref-blggt-2014-v4), Theorem 3.1.2 and proof pp.41–44, using BLGHT Lemmas 5.1 and 5.3 and Theorem 6.3 as identified there; the equivariant coefficient-prime comparison is [the Dwork comparison](#coefficient-prime-dwork-ordinarity).)

*Needs:* [Moret–Bailly](#moret-bailly-galois-control); [Dwork eigenrealizations](#dwork-eigenrealizations); [coefficient-prime Dwork ordinarity](#coefficient-prime-dwork-ordinarity); PotentialModularityAndCompatibleSystems, rank-one systems and cyclic character induction; EndoscopicTransferAndUnitaryTraceComparison §6.26, weak automorphic induction, and [its all-place comparison](#automorphic-induction-register); the ordinary part of [polarized lifting](#polarized-lifting-extensions).

<a id="prescribed-polarized-ordinary-lifts"></a>
### 2.15 Ordinary polarized lifts with prescribed local components

Let F imaginary CM, ℓ odd, ζ_ℓ∉F; let S contain the ℓ-adic and ramified places of F⁺ and consist of places split in F, with one selected ṽ|v. Fix an odd crystalline multiplier µ:G_{F⁺}→ℚ̄_ℓ×, unramified outside S, with HT_τ(µ)={w}; for each τ:F→ℚ̄_ℓ fix n distinct integers H_τ with H_{τc}={w−h:h∈H_τ}. Let r̄:G_{F⁺}→𝒢_n(𝔽̄_ℓ) have multiplier µ̄, identity-component preimage G_F and ramification in S. Require its GL_n restriction irreducible over F(ζ_ℓ), and ℓ≥2(d+1) for the maximal constituent dimension on the subgroup of G_{F⁺} generated by Sylow pro-ℓ subgroups. At ℓ assume an ordinary crystalline lift with weights H_τ exists; away from ℓ prescribe a lift ρ_v. Then there is a global lift r with multiplier µ, ordinary crystalline at ℓ of the chosen weights, connecting to ρ_v at each selected v∤ℓ, and unramified outside S.

State `prescribed_polarized_ordinary_lift`. The proof uses symplectic induction, residual Dwork potential automorphy, and the ordinary deformation-ring finiteness theorem of BLGGT 2.4.2, followed by the Khare–Wintenberger dimension argument. This does not use the conclusion of the preceding diagonalizable lifting theorem; it is its earlier ordinary input. Record this logical distinction in the implementation order.

**Checks.**

- A prescribed ordinary local ring with no point does not yield a global lift.
- The relation H_{τc}=w−H_τ is needed for the multiplier; {0,1} paired with {0,1} uses w=1.
- Specifying a non-ℓ component permits different points on that component, not an arbitrary exact equality to ρ_v.

([BLGGT](#ref-blggt-2014-v4), Proposition 3.2.1 and proof pp.45–48; §1.5 gives 𝒢_n and the polarized deformation problem.)

*Needs:* [residual symplectic Dwork construction](#polarized-dwork-potential-automorphy); GlobalGaloisDeformations, symplectic induction and dimension inequality; LocalGaloisDeformationRings, ordinary component rings; DeformationAndDerivedPatchingAlgebra; the ordinary finiteness assertion in BLGGT 2.4.2 of [polarized lifting](#polarized-lifting-extensions).

<a id="polarized-pd-lifting"></a>
### 2.16 Potentially diagonalizable polarized lifting

Theorem 4.2.1: F imaginary CM, ℓ odd, (r,µ) regular algebraic irreducible polarized, r potentially diagonalizable at ℓ, r̄|G_{F(ζ_ℓ)} irreducible, ζ_ℓ∉F and ℓ≥2(d+1), where d is the largest irreducible constituent dimension on the closed subgroup generated by the Sylow pro-ℓ subgroups. If the residual pair is ordinarily or potentially diagonalizably automorphic, then r is potentially diagonalizably automorphic, potentially prime to ℓ.

State `polarized_pd_lifting`. Construct the tensor-product comparison of BLGGT Proposition 4.1.1 using two prescribed ordinary lifts with separated tensor Hodge lists, verify their common local components, and apply the earlier component-preserving lifting theorem followed by soluble descent. This proof uses the ordinary finiteness and prescribed-lift targets; neither depends on this potentially diagonalizable conclusion.

**Checks.**

- ℓ=2 is excluded.
- The integer d is the maximal constituent dimension on the specified Sylow-generated subgroup; a smaller chosen constituent gives no valid bound.
- A crystalline character is potentially diagonalizable, but a noncrystalline Tate-curve extension fails this premise.
- Equal residual representations without the stated automorphic seed do not imply this theorem.

([BLGGT](#ref-blggt-2014-v4), Proposition 4.1.1 pp.48–53 and Theorem 4.2.1 pp.53–55.)

*Needs:* [potential diagonalizability](#potential-diagonalizability); [prescribed ordinary lifts](#prescribed-polarized-ordinary-lifts); [polarized component-preserving lifting](#polarized-lifting-extensions); PotentialAutomorphyInfrastructure Layer 2, soluble descent.

<a id="potential-ordinary-automorphy"></a>
### 2.17 Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: l_i odd with ζ_{l_i} ∉ F; µ_i totally odd de Rham (HT {w_i}); r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible with (r̄_i, µ̄_i) totally odd polarized, r̄_i|_{G_{F(ζ_{l_i})}} irreducible and l_i ≥ 2(d_i + 1); sets H_{i,τ} of n_i distinct integers with H_{i,τ∘c} = {w_i − h}; a finite Galois-stable S ⊇ primes above l_i and ramification; lifts ρ_{i,v} (v ∤ l_i) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}; and F^{(avoid)}. Then there are F′/F finite CM, Galois over F₀ and linearly disjoint from F^{(avoid)}, and regular algebraic cuspidal polarized (π_i, χ_i) over F′ with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, π_i unramified above l_i and outside S, ı_i-ordinary, HT_τ(r_{l_i,ı_i}(π_i)) = H_{i,τ|_F}, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S, u ∤ l_i.

F/F₀ finite Galois of imaginary CM fields; n_i≥1; d_i is the largest dimension of an irreducible subrepresentation of r̄_i on the subgroup generated by all Sylow pro-l_i subgroups. All other data and hypotheses are those displayed in the statement, including the fixed ι_i for each i.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy`.

Combine dwork-potential-ordinary-automorphy (applied to a symplectic induction of r̄_i to the totally real subfield) with ordinary-lifts-with-local-conditions and ordinary-automorphy-lifting over the resulting extension.

Check that the output is ı-ordinary with prescribed Hodge–Tate numbers: the input needed by Theorem 4.5.1 to start the potentially diagonalizable lifting.

([BLGGT](#ref-blggt-2014-v4), §3.3, Proposition 3.3.1, pp. 47–48 (arXiv v4).)

*Needs:* [residual symplectic Dwork construction](#polarized-dwork-potential-automorphy); [prescribed ordinary lifts](#prescribed-polarized-ordinary-lifts); [polarized lifting](#polarized-lifting-extensions); AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="auxiliary-elliptic-primes"></a>
### 2.18 Ordinary auxiliary primes with full residual elliptic image

For a non-CM elliptic curve E/ℚ, a fixed number field L and an integer A≥1, all sufficiently large primes ℓ have `r̄_{E,ℓ}(G_L)=GL₂(𝔽_ℓ)`. The good ordinary primes of E have density one. Consequently the progression ℓ≡1 modulo A contains infinitely many primes satisfying both conditions and any fixed finite set of exclusions. The first assertion includes the determinant: for large ℓ, `L∩ℚ(ζ_ℓ)=ℚ`.

Apply Serre 1972, §4.2 Theorem 2, pp.294–299, directly to E over L: geometric non-CM is preserved under base change, so its action on E[ℓ] is surjective for all sufficiently large ℓ. This avoids inferring surjectivity after restriction merely from surjectivity over ℚ. The proof reduces to semistable reduction, excludes infinitely many Cartan-normalizer images by the unramified quadratic characters and trace-zero Frobenius argument, and excludes infinitely many reducible images using the compatible abelian-character criterion of §3.6. Then use §8.2 Theorem 20 and Corollary 2 of Serre 1981, pp.188–190: non-CM Frobenius traces equal to zero occur with density zero. For good primes ℓ>3 the Hasse bound implies that supersingularity, equivalently ℓ|a_ℓ, forces a_ℓ=0. Dirichlet density of the progression is positive.

**Checks.**

- A CM curve is excluded: inert primes can be supersingular with positive density and its residual image lies in a Cartan normalizer.
- For ℓ=7 and u=2, `det(uI₂)=4≠1`; full image over L supplies a scalar outside `G_{L(ζ_ℓ)}`.
- A congruence progression of positive density survives deletion of a density-zero set, whereas two arbitrary infinite prime sets need not intersect.

([Serre 1972](#ref-serre-1972), §4.2 Theorem 2 and proof, pp.294–299; §4.4 Theorem 3 and Corollary 1, pp.299–300; [Serre 1981](#ref-serre-1981), §8.2, pp.188–190; [Qian](#ref-qian-2023), §4, proof of Proposition 4.1, pp.20–21.)

*Needs:* TauCetiRoadmap.Chebotarev, density and finite exclusions; elliptic Tate representations and determinant ε; the semistable inertia and compatible abelian-character arguments of Serre §§1–3; AnalyticNumberTheory, primes in progressions. The full-image and ordinary-prime combination is owned here.

<a id="qian-auxiliary-prime"></a>
### 2.19 Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)

Use Qian’s Theorem 1.1 data F, F^av, n≥2, l and the continuous semisimple residual representation r̄:G_F→GL_n(F_{l^s}). Fix a non-CM elliptic curve E₀/ℚ and write n=l^a m with l∤m. Let k′⊂F̄_l be generated by the m-th roots of all elements of F_{l^s}. Choose an odd N>100n+100 divisible by none of the prime factors of ln, none of the primes ramified in F^av or the residual fixed field, and none of the bad primes of E₀. Require F_{l²}k′⊂F_l(ζ_N); for n=2 require that field to have even degree d over F_l and F_{l²}k′ to lie in the residue field of ℚ(ζ_N)^+. If F_l(ζ_N)=F_{l^d} with d even, require N∤l^(d/2)+1. Let F^avoid be the ℚ-normal closure of F^av F̄^{ker r̄}(ζ_l). Then ℚ(ζ_N) and F^avoid are linearly disjoint over ℚ. There is a rational prime l′≡1 mod Nn with l′>2ln+5, unramified in F^avoid, for which E₀ has good ordinary reduction, r̄_{E₀,l′}(G_{F̃})=GL₂(F_{l′}) with F̃ the normal closure of F, and some σ∈G_F−G_{F(ζ_l′)} has scalar image.

Theorem 1.1 data as displayed; the finite field k′ is distinct from every number-field extension denoted F′. The elliptic residual realization is cohomological H¹ in the pinned convention.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime`.

Use Qian Lemma 2.3 for the modulus and all finite exclusions. Disjoint ramification makes the cyclotomic/avoidance intersection unramified over ℚ and hence trivial. The progression l′≡1 mod Nn has positive Dirichlet density since gcd(N,n)=1. Remove the finite bad, ramified and bounded primes and the density-zero supersingular exceptions. Serre open image over F̃ supplies the full residual image. Choose u∈F_{l′}× with u²≠1 and an element σ∈G_{F̃} mapping to uI₂. Its cyclotomic determinant is nontrivial, so σ∉G_{F(ζ_l′)}. Use [the auxiliary elliptic prime theorem](#auxiliary-elliptic-primes).

The conditions are all of density one or open, so l′ exists.

([Potential automorphy for GL_n](#ref-qian-2023), Proposition 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22 (arXiv v1); §4 opening (choice of E, N, F^avoid), p. 21; Invent. pp. 1268–1269 per routed locators.)

*Needs:* TauCetiRoadmap.Chebotarev, Layer 10; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="steinberg-ordinarity-lemma"></a>
### 2.20 Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)

At a place v|l of the chosen Dwork point require v(t)<0. Suppose V_{λ,t}^{ss}≅r_{l,ι}(π) for a regular algebraic cuspidal π and that the auxiliary-prime V_{λ′,t} is semisimple. The latter holds in the construction because its residual twist is an absolutely irreducible elliptic symmetric power. Match the coefficient embeddings. The monodromy of V_{λ′,t} at v is a single unipotent Jordan block of size n. Varma’s bound for its actual automorphic realization then forces π_v to be an unramified twist of Steinberg. The Hodge weights at τ are M(a_τ),…,M(a_τ)+n−1, so the constant automorphic weight is +λ_τ with λ_τ=M(a_τ). The central-character slope is +nλ_τ, and its j-th partial slope is +jλ_τ, giving ι-ordinarity by Geraghty. This proves ι-ordinarity of π. Galois ordinarity and potential semistability of V_{λ,t}^{ss} require the separate Dwork geometry and subquotient argument; they do not follow from good-place compatibility with V_{λ′,t}. No semisimplicity of the original l-adic fibre is asserted.

v(t)<0 at each relevant l-adic place; λ′ lies over an odd prime different from l and prime to N; V_{λ′,t} is semisimple; matched coefficient embeddings and the displayed semisimplified automorphic realization.

State the resulting comparison as `TauCeti.PotentialAutomorphy.steinbergOrdinary`.

Use Qian’s corrected monodromy lemma at λ′, which requires v(t)<0. Global semisimplicity at λ′ preserves the maximal local Jordan block when comparing with r_{l′,ι′}(π). Use Varma’s local–global monodromy bound. The partition (n) is maximal; local LLC identifies the component as Steinberg twisted by an unramified character. Compute the central character from det r_{l,ι}(π)·ε_l^(n(n−1)/2). Its τ-Hodge weight is nλ_τ; geometric reciprocity makes the Galois value a unit and gives the positive valuation exponent +nλ_τ. Divide by n and multiply by j to obtain +jλ_τ, then apply Geraghty’s ordinary criterion.

The ordinarity needed to apply ordinary lifting at l.

([Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); ≈ published Lemma 4.3, Invent. p. 1273; [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); the published Lemma 4.3 (Invent. p. 1273) is NOT in arXiv v1.)

*Needs:* PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="galois-ordinarity-from-automorphic"></a>
### 2.21 Galois ordinarity from automorphic ordinarity (ACC+ Corollary 5.5.2; Qian Remark 4.4)

Let F be an imaginary CM field, ι : Q̄_p ≅ ℂ and π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight ιλ. If π is ι-ordinary at every v ∈ S_p and r̄_ι(π) is decomposed generic and irreducible, then r_ι(π)|_{G_{F_v}} is ordinary of weight λ for every v ∈ S_p: upper triangular with the diagonal characters determined by λ and the Hecke eigenvalues of the ordinary U_p-operators. Qian's Remark 4.4 uses it to recover Galois ordinarity of the automorphic Dwork realisation. The Remark 4.4 application is restricted to the irreducible, decomposed-generic residual branch of Theorem 1.4. It does not recover ordinarity for arbitrary semisimple residual input in Theorem 1.1.

F imaginary CM; decomposed generic irreducible residual representation.

State the resulting comparison as `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary`.

Use ACC+ Corollary 5.5.2, derived from Theorem 5.5.1 after soluble CM base change disjoint from the residual fixed field; check irreducibility and decomposed genericity before applying it to the Dwork realization.

Converse direction to PL.0/iota-ordinary-implies-ordinary of the supplier, which is stated over totally real or polarized settings.

([ACC+](#ref-acc-2023), ACC+ Corollary 5.5.2 from Theorem 5.5.1; Qian Remark 4.4, published p. 1274 (arXiv v1 final paragraph of §4); [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4, Invent. p. 1274.)

*Needs:* PotentialAutomorphyInfrastructure, Layer PA.2; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-auxiliary-primes"></a>
### 2.22 The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)

In the proof of ACC+ Theorem 7.1.11 (F/F₀ Galois CM, F₀^avoid, 𝓛₀, strongly irreducible rank-2 very weakly compatible systems R_i with Hodge–Tate numbers {0, 1} and S_i ∩ 𝓛₀ = ∅, integers m_i > 0), one chooses a non-CM E/ℚ with good reduction above 𝓛₀, distinct primes l₁, l₂ and λ_i | l₂ with: (1) l₂ splits completely in each M_i; (2) the image of G_F on E[l₁] contains SL₂(F_{l₁}) and r̄_{i,λ_i}(G_F) ⊇ SL₂(F_{l₂}); (3) l₁, l₂ unramified in F; (4) E has good reduction above l₁, l₂; (5) l₁, l₂ under no prime of S_i; (6) l₁, l₂ > 2m_i + 3, together with (6′) l₁, l₂ > (m_i + 1)² and (7) r_{i,λ_i} crystalline with Hodge–Tate numbers {0, 1} above l₂. Such primes exist since all conditions hold for a set of primes of density one except the first for l₂, which holds for a positive-density set.

Data of ACC+ Theorem 7.1.11.

State the resulting comparison as `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes`.

Chebotarev and the density statements of ACC+ Lemma 7.1.3 (residual irreducibility and large image for density one).

Feeds the l₁–l₂ switch in the proof of Theorem 7.1.11.

([ACC+](#ref-acc-2023), §7.2.5, proof of Theorem 7.1.11, Assumption 7.2.6, arXiv v2 p. 208 (Annals p. 1103).)

*Needs:* TauCetiRoadmap.Chebotarev, Layer 10; PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); PotentialModularityAndCompatibleSystems, Layer R24.5:operations; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="twisted-modular-curve"></a>
### 2.23 The twisted modular curve X_E(q)

Let K be a number field, E/K an elliptic curve and q ≥ 3 a prime. X_E(q) is the smooth projective curve over K (the compactification of the fine moduli space Y_E(q) for q ≥ 3) parametrising pairs (A, φ) of an elliptic curve A with a symplectic isomorphism φ : A[q] ≅ E[q] (compatible with the Weil pairings); it is a twist of the modular curve X(q) by the Galois action on E[q], geometrically connected, and of genus 0 for q ≤ 5. Calegari–Geraghty only say that the auxiliary curve 'follows easily from Prop. 6.2 of [BLGHT11], now applied to twists of a modular curve'.

q ≥ 3 prime (fine moduli); K a number field.

The interface should expose the following operations and comparisons.

- `TauCeti.PotentialAutomorphy.TwistedModularCurve`: The curve X_E(q) over K.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.moduli`: For L/K, the non-cuspidal L-points of X_E(q) are the pairs (A/L, φ : A[q] ≅ E[q] symplectic) up to isomorphism (q ≥ 3).
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.geometricallyConnected`: X_E(q) is geometrically connected.
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.baseChange`: X_E(q) ×_K L = X_{E_L}(q).
- `TauCeti.PotentialAutomorphy.TwistedModularCurve.point_E`: (E, id) is a K-point.

Define Y_E(q) by descent of the full symplectic level-q moduli problem, using E[q] as a finite étale group scheme with its Weil pairing. A chosen geometric basis gives a GL₂(F_q) Galois representation with cyclotomic determinant; it is not in general an SL₂ cocycle over K unless μ_q⊂K. Compactify by the ModularCurves owner. Geometric fibers are the fixed-pairing component of X(q), hence geometrically connected; (E,id) gives a K-point. Exact twist/descent and compactification exports remain requested rather than supplied by an untwisted X(q) citation alone.

**Checks.**

- q = 3: X_E(3) has genus 0 (X(3) does), and it has the K-point (E, id), so X_E(3) ≅ ℙ¹_K.
- If the Galois action on E[q] is trivial (E[q] ⊂ E(K) and μ_q ⊂ K), X_E(q) ≅ X(q)_K.
- X_E(q) is not X₀(q) as a moduli problem: a point carries a full level-q structure identified with E[q], not a cyclic subgroup; already at q=7 the curves differ (genus of X(7) is 3, of X₀(7) is 0), while for q = 3, 5 both are ℙ¹_K.

Moret-Bailly's theorem applied to X_E(q) gives points over extensions with prescribed local behaviour.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §10, general case, p. 97 (arXiv v2) = Invent. p. 429.)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R23.1; TauCetiRoadmap.ModularCurves, Layer 5; TauCetiRoadmap.ModularCurves, Layer 10; [C-MODULI](#contract-c-moduli).

<a id="p-r-switch"></a>
### 2.24 The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)

BCGNT Proposition 6.2.3 is a sufficient-condition theorem: with the auxiliary systems and all conditions (1)–(17) below, Sym^{n−1}R is weakly automorphic of level prime to X₀. It does not assert an iff between residual automorphy at p and r of a single CM-tensored system.

F imaginary CM, m≥2, n≥1, X₀ a finite set of finite places; R=(M,S,{Q_v},{r_λ},{H_τ}) very weakly compatible of rank 2. (1) H_τ={0,m}. (2) det r_λ=ε^{−m}. (3) R strongly irreducible. (4) X₀∩S=∅. (5) F/ℚ Galois containing an imaginary quadratic F₀. Fix M↪ℂ. (6) E/ℚ cyclic totally real of degree m, disjoint from F; L=EF and Ψ:𝔸_L^×→M^×. Choose τ₀:F₀↪ℂ and τ₁,…,τ_m:EF₀↪ℂ extending τ₀, with Ψ(α)=∏_{i=1}^m τ_i(N_{L/EF₀}α)^{m−i}cτ_i(N_{L/EF₀}α)^{i−1} on L^×. R_CM=Ind_{G_L}^{G_F}Ψ has H_CM,τ={0,…,m−1} and det r_CM,λ=ε^{−m(m−1)/2}. Its bad set is the places ramified in L or above ramification of Ψ. (7) Distinct primes p,r not dividing places of S and chosen coefficient places above them. (8) A weakly compatible rank-m R_aux, pure of weight m−1, bad set avoiding X₀∪{v|pr}, det=ε^{−m(m−1)/2}, HT={0,…,m−1}. (9) A weakly compatible rank-nm S_UA, pure of weight nm−1, bad set avoiding X₀∪{v|pr}, det=ε^{−nm(nm−1)/2}, HT={0,…,nm−1}, weakly automorphic of level prime to X₀∪{v|pr}. Put S_aux=Sym^{n−1}R⊗R_aux and S_CM=Sym^{n−1}R⊗R_CM. (10) L/F and Ψ unramified above X₀∪{v|pr}. (11) p>2nm+1 and [F(ζ_p):F]=p−1. (12) r>2nm+1, r splits completely in EF₀, [L(ζ_r):L]=r−1. (13) Up to conjugacy SL₂(F_p)≤r̄_p(G_F)≤GL₂(F_p), likewise at r. For m>2, r̄_aux,p has image GU_m(F_{p²}) and multiplier ε^{1−m}; for m=2 its image is GL₂(F_p). r̄_CM,r restricted to G_{F(ζ_r)} is irreducible. For m=2 the projective extensions cut out by r̄_p and r̄_aux,p over F(ζ_p) are disjoint. (14) s̄_UA,p≅s̄_aux,p and r̄_aux,r≅r̄_CM,r. (15) The p-adic places split as Σ_ord⊔Σ_ss; each F_v contains ℚ_{p²}, r̄_p|G_{F_v} and ρ̄_{2,m,0}|G_{F_v} are trivial. On Σ_ord, r_p is crystalline ordinary; on Σ_ss, r_p connects to ρ_{2,m,0}. (16) On Σ_ord, r̄_aux,p is trivial and r_aux,p,s_UA,p crystalline ordinary. On Σ_ss, r̄_aux,p is trivial, r_aux,p,s_UA,p crystalline, and they connect to ρ_{m,1,0},ρ_{nm,1,0} respectively. (17) At every v|r, r̄_aux,r≅r̄_CM,r is trivial and r_aux,r is crystalline ordinary. The connects relation and ρ_{a,b,c} are BCGNT Definitions 5.1.1 and the local deformation component relation, not unnamed propositions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.prSwitch`.

Apply the [weight-zero connects lifting theorem](#component-connects-lifting) at p to S_aux, using the S_UA seed, Taylor–Wiles image conditions (13) and local connects relations (15)–(16). Apply the same theorem at r to S_CM using S_aux, (14), (17), and ordinary connectedness; obtain weak automorphy of S_CM. The order-m self-twist of its automorphic π gives automorphic induction from GL_n(𝔸_L). Compare compatible systems at an irreducible member, undo Ψ, and descend cyclically to F (ACC+ Proposition 6.5.13). Use the local tensor identities of BCGNT §5.1 to verify these specific connects relations. Soluble Galois descent is PotentialAutomorphyInfrastructure Layer 2, with the compatible-system identity proving descent of the same representation.

Input to [Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)](#potential-weak-automorphy-symmetric-powers).

([BCGNT](#ref-bcgnt-2025), Proposition 6.2.3 and proof, §6.2, arXiv v3 pp. 61–63 (published pp. 54–57; arXiv pagination differs) PDF p.62.)

*Needs:* [all-place cyclic automorphic induction and descent](#automorphic-induction-register); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="pd-lifts-with-local-conditions"></a>
### 2.25 Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)

Let n ≥ 1, l be an odd prime, and F be an imaginary CM field with ζ_l ∉ F. Let S be a finite set of finite places of F⁺, split in F and containing every place above l, with chosen ṽ above each v. Let µ : G_{F⁺} → Q̄_l^× be continuous algebraic, unramified outside S and satisfy µ(c_v)=−1 at every real place. Let r̄ : G_{F⁺} → G_n(F̄_l) be continuous, unramified outside S, with ν∘r̄=µ̄ and r̄⁻¹(G_n⁰)=G_F. For each v∈S choose a lift ρ_v of r̄̆|G_{F_ṽ}. Define d as the largest dimension of an irreducible subrepresentation of r̄̆ restricted to the closed subgroup generated by the Sylow pro-l subgroups. Suppose r̄̆|G_{F(ζ_l)} is irreducible, l ≥ 2(d+1), and at v|l the chosen ρ_v is potentially diagonalizable with n distinct labeled Hodge–Tate numbers. Then there is a lift r : G_{F⁺} → G_n(O_{Q̄_l}), unramified outside S, with ν∘r=µ and r̆|G_{F_ṽ} ∼ ρ_v at every v∈S. Theorem 4.3.1 assumes no pre-existing residual automorphy.

The CM, odd-prime, rank, multiplier, component-preimage, residual restriction, dimension bound and chosen local lifts are the data in the statement. The group is G_n=(GL_n×GL_1)⋊{1,j} of BLGGT §1.1.

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_pd_lift`.

As in Theorem 4.2.1: the deformation ring with the components of the ρ_v has dimension ≥ 1; potential automorphy of r̄ (potential-ordinary-automorphy) and pd-automorphy-lifting over the extension make it finite over O; so it has Q̄_l-points.

Check that this strengthens ordinary-lifts-with-local-conditions: ordinary crystalline ρ_v are potentially diagonalizable.

([BLGGT](#ref-blggt-2014-v4), §4.3, Theorem 4.3.1, p. 55 (arXiv v4).)

*Needs:* [potentially diagonalizable lifting](#polarized-pd-lifting); [Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)](#potential-ordinary-automorphy); LocalGaloisDeformationRings §6.8, connects; [potential diagonalizability](#potential-diagonalizability); GlobalGaloisDeformations, Layer G7 (polarized representability); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-theorem"></a>
### 2.26 Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: n_i, d_i ≥ 1, l_i odd with l_i ≥ 2(d_i + 1) and ζ_{l_i} ∉ F, ı_i; (r_i, µ_i) a totally odd, regular algebraic, n_i-dimensional polarized l_i-adic representation of G_F with d_i the maximal dimension of an irreducible constituent of r̄_i restricted to the subgroup generated by the Sylow pro-l_i-subgroups; F^{(avoid)}/F finite Galois. Assume r_i is potentially diagonalizable at each prime of F above l_i and r̄_i|_{G_{F(ζ_{l_i})}} is irreducible. Then there are a finite CM F′/F, Galois over F₀ and linearly disjoint from F^{(avoid)} over F, and regular algebraic cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}), unramified above l_i, with (r_{l_i,ı_i}(π_i), r_{l_i,ı_i}(χ_i)ε_{l_i}^{1−n_i}) ≅ (r_i|_{G_{F′}}, µ_i|_{G_{(F′)⁺}}).

The potentially diagonalizable local conditions are imposed at every place of F above ℓ_i.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy`.

potential-ordinary-automorphy gives F′ (Galois over F₀, disjoint from ∩ ker r̄_i · F^{(avoid)}(ζ_{∏l_i})) and ı_i-ordinary (π′_i, χ′_i) with r̄_{l_i,ı_i}(π′_i) ≅ r̄_i|_{G_{F′}}, unramified above l_i. pd-automorphy-lifting over F′ (hypotheses preserved: potential diagonalizability restricts, and r̄_i|_{G_{F′(ζ_{l_i})}} stays irreducible by disjointness).

Check the Fontaine–Laffaille special case: l_i unramified in F⁺, r_i crystalline above l_i with HT in [a_τ, a_τ + l − 2] (potential-diagonalizability-criteria (2)). Check that the output is automorphy over F′ only: descent to F needs automorphy-twist-and-soluble-base-change and holds only for soluble F′/F.

([BLGGT](#ref-blggt-2014-v4), §4.5, Theorem 4.5.1 and proof, pp. 59–60 (arXiv v4).)

*Needs:* [Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)](#potential-ordinary-automorphy); [potentially diagonalizable lifting](#polarized-pd-lifting); AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation); [potential diagonalizability](#potential-diagonalizability); PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-symplectic-potential-automorphy"></a>
### 2.27 Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)

Let F/F₀ be a finite Galois extension of totally real fields, 𝓘 finite, and for i ∈ 𝓘 let n_i be even, l_i odd primes, ı_i : Q̄_{l_i} ≅ ℂ, and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}, unramified above a finite set 𝓛 of primes unramified in F and ≠ l_i; let F^avoid/F be finite Galois. Then there are finite Galois F^suffices/F₀ and F₁^avoid/ℚ with F ⊂ F^suffices, F^suffices linearly disjoint from F^avoid F₁^avoid over F, F₁^avoid and F^avoid linearly disjoint over ℚ, F^suffices unramified above 𝓛, such that for every finite totally real F′/F^suffices linearly disjoint from F₁^avoid each r̄_i|_{G_{F′}} is ordinarily automorphic of weight 0 and level prime to 𝓛. It strengthens [BLGGT residual symplectic potential automorphy](#polarized-dwork-potential-automorphy) by the extra disjointness F₁^avoid.

As in the statement.

State the resulting comparison as `TauCeti.PotentialAutomorphy.acc_symplectic`.

The Dwork family and the scheme T̃ of BLGGT §3 with Moret-Bailly ([Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control)), as in [the residual Dwork construction](#polarized-dwork-potential-automorphy), keeping track of F₁^avoid = the field cut out by the auxiliary residual representations.

The input to [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed) and [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers).

([ACC+](#ref-acc-2023), §7.2.1, Proposition 7.2.3 and its parenthetical proof, arXiv v2 pp. 204–205 (Annals pp. 1099–1100).)

*Needs:* [residual symplectic Dwork construction](#polarized-dwork-potential-automorphy); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-with-steinberg-place"></a>
### 2.28 Residual potential automorphy with a Steinberg place (Fakhruddin–Khare–Patrikis, proof of Proposition 9.1)

Let F be totally real, p ≫_n 0, ρ̄ : Γ_F → GSp_{2n}(k) with similitude κ̄^{1−2n} and ρ̄|_{Γ_{F(ζ_p)}} absolutely GSp_{2n}-irreducible (ρ̄ may be GL_{2n}-reducible), and v₀ a place with ρ̄|_{Γ_{F_{v₀}}} = 1 and N(v₀) ≡ 1 mod p. Then there are a Galois totally real F′/F linearly disjoint from F(ρ̄, ζ_p) and a regular algebraic self-dual cuspidal Π_{F′} of GL_{2n}(𝔸_{F′}) with r̄_ι(Π_{F′}) ≅ ρ̄|_{Γ_{F′}} and Π_{F′,w} an unramified twist of Steinberg for every w | v₀: run BLGGT Theorem 3.1.2 with the additional Moret-Bailly condition v(t(P)) < 0 at the places above v₀.

Retain the hypotheses of FKP Proposition 9.1: [F(ζ_p):F]>a_{GSp_{2n}} of FKP19 Lemma A.6, ρ̄ is not induced from a proper subgroup as a GL_{2n}-representation, and at every v|p there is an ordinary GSp_{2n}-lift with similitude κ^{1−2n}. Every GL_{2n} constituent of ρ̄ is self-dual with this multiplier and remains irreducible on Γ_{F(ζ_p)}. The Steinberg local component is π_w for each w|v₀.

State the resulting comparison as `TauCeti.PotentialAutomorphy.withSteinbergPlace`.

[BLGGT residual symplectic potential automorphy](#polarized-dwork-potential-automorphy) with the Moret-Bailly step [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control) including the local condition at v₀. v(t) < 0 forces maximal unipotent monodromy of the Dwork fibre at w | v₀, hence a Steinberg local component.

Used in FKP Proposition 9.1 to produce geometric lifts with Zariski-dense image.

The same construction accepts a finite set T of auxiliary trivial places away from p: prescribe v(t(P))<0 at every place above T in the Moret–Bailly step. Choose v₀,v₁∈T with different residue characteristics. Chebotarev supplies trivial places outside any finite set, so the second characteristic can be chosen different from the first. For the characteristic-zero lift, put both places in the finite local-condition set S of FKP Theorem E and prescribe sufficiently close approximations to formally smooth Steinberg lifts at both. The argument on FKP pp. 41–42 then retains both Steinberg components; these are simultaneous conditions, not two unrelated lifts or extensions. This finite-set variant is a deduction from the local-condition construction, whereas Proposition 9.1 itself is stated using one place.

For a coefficient prime equal to the residue characteristic of v₀, v₁ is still available for an off-coefficient-prime monodromy comparison. Two places with the same residue characteristic would not have this property.

([Lifting and automorphy of reducible mod p Galois representations over global fields](#ref-fkp-2022), Theorem E, pp. 5–6, and §9, Proposition 9.1 and proof, arXiv v5 pp. 41–43 (finite local prescriptions and the residual automorphy argument on p. 42).)

*Needs:* [residual symplectic Dwork construction](#polarized-dwork-potential-automorphy); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="cm-three-five-switch"></a>
### 2.29 Residual modularity with prescribed p-adic elliptic types

Let F be imaginary CM, p∈{3,5}, and r̄:G_F→GL₂(𝔽_p) decomposed generic with det r̄=ε̄_p. In the p=3 branch require ζ₅∉F. Partition the places above p into T_st,T_ord,T_ss. For any finite avoidance extension construct a **soluble CM** L/F disjoint from it and a modular elliptic curve A/L with symplectic A[p]≅r̄|G_L, split multiplicative reduction above T_st, good ordinary reduction above T_ord and good supersingular reduction above T_ss. Preserve decomposed genericity. The cohomological representation is H¹(A)=V_A∨, so its residual is r̄∨ and determinant ε̄_p⁻¹; dualize the input when producing a seed for inverse-cyclotomic lifting.

State `CMResidual.modular_curve_with_types`. The local moduli are the twisted open genus-zero curve Y_{r̄}; its identification with an open of ℙ¹ uses the specified Weil-pairing orientation. AKT Lemma 9.7 supplies weak approximation with an independent auxiliary residual representation of full SL₂ image and an auxiliary decomposed-generic split prime. In the modularity step use the p=3 Tate-curve construction of AKT Proposition 9.12, then the local conditions of CN Lemmas 6.1.5–6.1.7. Keep the auxiliary conditions at 2 and 3: at 2 the curve is Tate over the unramified extension adjoining i, with discriminant valuation 3 modulo 6 and locally square Δ/Δc; at 3 its Tate discriminant valuation is 2 or 4 modulo 6 and Δ/Δc is locally a cube. Over F(ζ₁₂,(Δ/Δc)^{1/6}) the independent mod-3 image and decomposed genericity establish modularity. This argument supplies modular A independently of its prescribed p-adic reduction, including the p=3 branch; it is not a circular application of the target elliptic curve's modularity.

Together with [potentially semistable lifting](#potentially-semistable-cm-lifting), obtain CN Theorem 6.1: if ζ₅∉F and either E[3] or E[5] is cyclotomically irreducible and decomposed generic, E is modular. Over imaginary quadratic F, cyclotomic irreducibility implies decomposed genericity by the Goursat/Chebotarev argument of Lemma 6.2.2. For F CM Galois over ℚ with ζ₅∉F, the mod-5 full-image condition holds for density one of integral Weierstrass equations in the paper's height ordering; ArithmeticStatistics' quantitative Hilbert irreducibility and CN's conjugate-constituent argument give Corollary 6.1.2. The density assertion concerns equations in that ordering, not an undefined uniform measure on isomorphism classes.

**Checks.**

- At a supersingular p-place the seed must be nonordinary, so an all-ordinary auxiliary curve does not serve.
- The determinant of A[p] is ε̄_p, while that of its cohomological dual is ε̄_p⁻¹.
- A soluble extension disjoint from the residual kernel preserves the needed image; a field killing the residual representation would destroy irreducibility.
- For p=3 the ζ₅ exclusion remains.
- Equality of j-invariants identifies quadratic twists, not necessarily the curves themselves.

([Allen–Khare–Thorne](#ref-akt), Lemma 9.7 pp.75–76 and Propositions 9.12–9.13 pp.79–80, arXiv v2; [Caraiani–Newton](#ref-caraiani-newton-2023), Theorem 6.1 and Corollaries 6.1.1–6.1.3 pp.87–88, Lemmas 6.1.4–6.1.7 pp.88–90 and Lemma 6.2.2 pp.90–91.)

*Needs:* [potentially semistable CM lifting](#potentially-semistable-cm-lifting); ModularCurvesPartII, twisted full-level moduli and Weil pairing; PotentialModularityAndCompatibleSystems, Moret–Bailly; PotentialAutomorphyInfrastructure Layer 2, soluble descent of the same representation; ArithmeticStatistics, quantitative Hilbert irreducibility; TauCetiRoadmap.Chebotarev.

<a id="exceptional-modular-curves"></a>
### 2.30 Explicit exceptional modular curves and their arithmetic certificates

For p=3,5 let b_p,s_p,ns_p denote a Borel, split-Cartan normalizer and nonsplit-Cartan normalizer in GL₂(𝔽_p); ns3° is the nonsplit Cartan itself. Construct the smooth projective normalizations of the six fibre products X(b3,b5), X(s3,b5), X(ns3°,b5), X(b3,ns5), X(ns3°,ns5), X(s3,ns5), with their forgetful maps and j-functions. These curves classify the residual cases left by [the 3–5 theorem](#cm-three-five-switch). Define `CNExceptionalCurveData(F)` to contain the explicit arithmetic inputs specified below: the model identifications, proved finite group/divisor data, local residue tables with their acceptance conditions, and the exceptional ℚ(i) Galois comparison certificate. It contains neither the point-classification theorem nor modularity of arbitrary elliptic curves over F. The individual modularity endpoint is conditional on these data; the density-one endpoint does not use them.

**Models and API.** As part of the explicit input, `exceptionalCurveModel / exceptionalCurveJMap` identify the normalization with the models below, provide inverse function-field maps, and prove that the modular j-function commutes with them. The component and cusp data belong to the normalization, including points at poles of affine coordinates. Use
`j_b3(t)=(t+27)(t+3)³/t`, `j_b5(t)=(t²+250t+3125)³/t⁵`, `j_ns3(t)=t³`, `j_ns5(t)=125t(2t+1)³(2t²+7t+8)³/(t²+t−1)⁵` and `j_s3(t)=27(t+1)³(t−3)³/t³`. The double cover X(ns3°)→X(ns3) has equation z²=−3(t²+12t+144). The first two fibre products have models `y²=x(x+16)(x+25)` and `y²=x(x+1)(x+16)` respectively. For the remaining four:

| Curve | Smooth projective model (affine chart z=1) | Involution / quotient |
| --- | --- | --- |
| X(ns3°,b5) | y²=−3(x⁴+2x³−x²+10x+25) | w₅:x↦5/x on the quotient coordinate |
| X(b3,ns5) | y²=9x⁶−6x⁵−35x⁴+40x²+12x−8 | w₃ is the hyperelliptic involution |
| X(ns3°,ns5)=C₁ | 9x⁴+19x²y²+y⁴+9x³+19x²y+22xy²+2y³+10x²+22xy+13y²+7x+12y+11=0 | (x,y)↦(x,−y−1) |
| X(s3,ns5)=C₂ | −x⁴+2x³y+x²y²+8x³+2x²y−2xy²−y³−3x²−3xy+3y²+2x−3y+1=0 | (x,y)↦((3x+y+2)/(4x−2y+1),(8x+y−8)/(4x−2y+1)) |

Both plane quartics have quotient D:y²−y=x³+1, with D(ℚ)≅ℤ. Extend the displayed rational involution on C₂ to the projective curve. The genus-one quartic is in weighted projective space ℙ(1,2,1), not an ordinary plane quartic. Its quotient j-function is `(x⁶+250x³+3125)³/x¹⁵`; the coefficient 3125 is 5⁵. Identify the double cover by its branch divisor and its cusp field, which determines the twist −3.

`exceptionalDivisorCertificate(C)` consists of exact divisor representatives, Riemann–Roch bases, principal-divisor witnesses, proved rank and torsion bounds, finite-index inclusions, good-reduction maps and finite residue-class tables. These are mathematical input facts and witnesses; no unverified program output supplies them. It does not contain the desired point classification as a field. Import the general finite-index and relative Chabauty verifiers from **EffectiveDiophantineMethods §§3.21–3.22, 4.20–4.22 and 5.24, 5.27–5.28**. For the following specific arithmetic inputs, prove `exceptionalCurve_point_classification` by those verifiers. Producing the input arithmetic data is outside this roadmap; their statements and their proof obligations remain explicit.

- **Genus one (CN Proposition 7.2.2).** Two-descent gives Jac(C)(ℚ)≅(ℤ/2)² for `v²=u³+3u²−720u−8100`; C(ℚ)=∅ already over ℚ₃. Over ℚ(a), a²=−3, use ∞±=(1:±a:0), (0:5a:1), (−2:−a:1), (−5/2:5a/4:1) to represent the three nonzero rational Jacobian classes, relative to ∞−. Compute their descent cocycles, not merely Galois-invariant divisor classes: the group of rational degree-zero divisors modulo rational principal divisors is only ℤ/2, because of the Brauer obstruction. Adding ∞++∞− gives degree-two Riemann–Roch spaces generated by 1 and the functions used in CN (7.2.1)–(7.2.3). Write their parameter as α=α₀+aα₁. Rationality of the divisor requires the conics `α₀²+3α₁²+6α₁+c=0`, with c=−33,15,12 respectively. The latter two have no ℚ₃-point. In the first case the quadratic in x has constant coefficient five times its leading coefficient. Hence any quadratic point P satisfies x(P)∈ℚ or x(P)x(P^σ)=5, with poles treated in the projective fibre. The second alternative yields the degree-five ℚ-curve isogeny of Corollary 7.2.5.
- **Genus two (CN Proposition 7.3.3).** Two-descent gives rank zero; good-reduction orders 40 at 7 and 180 at 13, together with exhibited torsion, give J(ℚ)≅ℤ/2⊕ℤ/10. Enumerate all 19 nonzero reduced Mumford classes, translate by the rational degree-two divisor at infinity, and enumerate their effective representatives. The zero class is the hyperelliptic pencil and gives x∈ℚ. Of the other representatives nine have rational x, two are supported at infinity, six are real quadratic, and two are the conjugate pair with x=(−5+√−11)/6, y=±(17−√−11)/6. Keep real/imaginary and cuspidal/noncuspidal tests in this enumeration. For a quadratic point with rational x, w₃ is its Galois conjugation, so the modular interpretation gives a degree-three isogeny from E to its conjugate. This branch gives a geometric ℚ-curve, rather than an assertion that its j-invariant is rational (CN Corollary 7.3.4, p.98).
- **Plane quartic rank and saturation (CN Proposition 7.4.4).** The Chen isogeny decompositions and certified descents on their elliptic factors give rank one for each J_i; do not replace this by an analytic-rank computation. Pull back a proved generator of D(ℚ), giving G_i∈J_i(ℚ). Good reduction at 7,11,13 bounds torsion by 4 and 20 respectively; for C₁ its 2-primary reduction at 13 has invariants (2,2), and for C₂ exhibit independent torsion of orders 10 and 2. Box's pullback/norm argument yields `4J₁(ℚ)⊂⟨2G₁⟩` and `10J₂(ℚ)⊂⟨5G₂,J₂(ℚ)[2]⟩`. The second inclusion uses G₂. These are proved inclusions, rather than guessed saturation indices.
- **Plane quartic sieve (CN Proposition 7.4.5).** For C₁ use I=4, subgroup ⟨2G₁⟩ and good prime 43. Its reduced subgroup is cyclic of order seven and the preimage under the scaled degree-two Abel–Jacobi map has seven residue classes. Eight explicit pullback divisors cover them; verify the nonzero relative differential coefficient in each class. EffectiveDiophantineMethods §4.22 then makes every rational degree-two divisor a pullback from D(ℚ). For C₂ use I=10, subgroup ⟨5G₂,J₂[2]⟩ and primes 11,43. Enumerate the sixteen nonpullback candidate divisors (eight sums of rational points and eight quadratic divisors); certify the local uniqueness/pullback conditions and that the simultaneous remaining cosets are empty. Represent finite quotients by Smith normal forms and check **every** preimage under reduction, as in EffectiveDiophantineMethods §5.24. Of the quadratic candidates six are real and two lie over ℚ(√−55): in that field, with a²=−55, representatives are ((1+a)/28,(27−a)/56) and ((3−a)/4,(3+3a)/4), together with their conjugates. Their j-invariant is −32768. Thus every imaginary quadratic point on either quartic gives a ℚ-curve or rational j. A point search only supplies the candidate list; the empty-coset and differential certificates prove completeness.

`exceptional_at_sqrtMinus11_modular` identifies the remaining genus-two curve over K=ℚ(a), a²−a+3=0, as the twist class of `[a,0,1+a,−24−6a,56+13a]`, with j=(11155375a+3126750)/32. Its point on X(b3,ns5) gives containment in the nonsplit normalizer at 5. At the primes a≡14 mod37 and a≡37 mod89, direct point counts give #E(𝔽₃₇)=42 and #E(𝔽₈₉)=75. The first Frobenius has mod-5 order 24 and generates the nonsplit Cartan. The second has trace 0 and determinant 4 mod5, hence distinct eigenvalues 1,−1 and lies outside that Cartan. The image is consequently the full normalizer of order 48. Its determinant-one subgroup has order 12 and is absolutely irreducible, establishing cyclotomic irreducibility; [the residual theorem](#cm-three-five-switch) gives modularity. Transport modularity to quadratic twists.

`exceptional_at_i_modular` verifies and consumes the remaining finite Galois comparison certificate over K=ℚ(i). The representative is
`E₀: y²+i xy+y=x³+x²+(6+i)x+10−15i`, with conductor ideal (63i−9), norm 4050, and j=(−47709+15363i)/256. The input supplies an actual cuspidal automorphic Bianchi weight-two newform, with rational Hecke field, of level (63i−9) singled out in CN §7.1 (database identifier 2.0.4.1-4050.1-c), identified by exact cuspidal-cohomology Hecke matrices; attach its Galois representation using AutomorphicGaloisRepresentationsPartII's imaginary-quadratic realization. Use arithmetic Frobenius realizations on both sides: T₂(E₀) and the dual of the cohomological weight-two Bianchi realization, with common determinant ε₂ and trivial finite central character. Supply stable lattices over a common finite extension A/ℚ₂ with residue field 𝔽₂. Coefficient-field descent is part of the input: rational Hecke eigenvalues alone do not prove the realization has such a model. DGP Remark 5, p.6, gives a sufficient check using two Frobenius root fields with residue degree one at 2 and the coefficient-field containment theorem. The **finite Dieulefait–Guerberoff–Pacetti comparison certificate** for this pair has the following exact obligations: factor the 2-division polynomial to choose the actual residual-image branch; use ray-class moduli supported at 2,3,5 and the conjugate level, with exponent 2e(𝔭|2)+1 at 2, ⌊3e(𝔭|3)/2⌋+1 at 3, and 1 elsewhere. The certificate records the ray-class generators and character evaluations, residual-image recognition tests, the resulting finite prime set, and the exact Hecke-eigenvalue/point-count equalities there. For an S₃ image enumerate the S₃×C₂ and S₄ obstruction extensions over the 2-torsion field (DGP §2.1); for trivial/C₂ image use the even-trace recognition and a noncubic set for Livné's theorem (§2.2); for C₃ image identify its cubic field and apply the even-trace comparison there, with descent (§2.3). Check local factors at the remaining bad primes separately. DGP §5 proves these finite tests sound; the explicit arithmetic hypothesis is a successful certificate for this specified pair, not an arbitrary algorithm assumed to return success. Transport the comparison through the isogenies, conjugation and twists accounting for the eight extra X₀(15)(ℚ(i))-points. The database identifier locates the objects; it is not the proof of their comparison.

Finally `exceptionalCurve_modular` combines these results. The first two genus-one curves have rational torsion ℤ/2⊕ℤ/4 and are isogenous. The quadratic torsion-growth calculation in CN Corollary 7.1.2 leaves, among imaginary fields, only the eight additional ℚ(i)-points on X₀(15); the split-normalizer curve acquires new torsion only over the real field ℚ(√5). If X₀(15)(F) is finite, its F-points are torsion, so these finite lists exhaust this branch. Rational j gives a twist of a base-changed modular rational elliptic curve; the degree-three and degree-five ℚ-curve branches use the existing ℚ-curve modularity export. The residual alternatives above cover the remaining noncuspidal points. CM points use Hecke characters. Thus `CNExceptionalCurveData.point_classification` and `exceptionalCurve_modular` are consequences of the specific arithmetic data. This supplies the exceptional branch of the conditional individual endpoint below.

**Checks.**

- The two genus-one models y²=x(x+16)(x+25) and y²=x(x+1)(x+16) have distinct torsion-growth lists. Their being isogenous does not identify their points.
- On the genus-one quartic, replacing 3125 by 55 changes the j-map; replacing rational divisor classes by all of J(ℚ) loses the Brauer obstruction. The first conic has the rational point (α₀,α₁)=(3,2), whereas the other two fail locally at 3.
- A zero Jacobian class on the genus-two curve gives a whole pencil. The nineteen nonzero classes give the finite exceptional list; omitting the zero class or one nonzero class invalidates completeness.
- The √−11 Frobenius checks use two different types: an order-24 element alone proves Cartan containment may be equality, whereas the split nonscalar involution forces the full normalizer. A scalar involution would not do so.
- In the C₁ sieve two distinct known pullbacks can have the same reduction; the eight divisors covering seven classes are intentional. Injectivity of the scaled Abel–Jacobi map is not a hypothesis of the sieve theorem.
- For C₂ the points over √−55 are not rational, although their j-invariant is rational. Deleting one candidate or weakening the multiplier inclusion leaves an unchecked coset.
- A rational-x quadratic point on the genus-two model gives a degree-three ℚ-curve; it need not have rational j.
- A DGP certificate needs the common cyclotomic determinant, the residue-𝔽₂ coefficient models and stable lattices. Matching traces at an arbitrary list of small primes fails acceptance unless the character-evaluation spanning/noncubic conditions hold. Matching residual representations alone does not identify the 2-adic representations. A bad local factor is an additional check even after the good-prime comparison.

([Caraiani–Newton](#ref-caraiani-newton-2023), Theorem 7.1.1 and Corollary 7.1.2 pp.92–94; Proposition 7.1.3 p.94; Propositions 7.2.2–7.2.4 and Corollary 7.2.5 pp.95–97; Proposition 7.3.3 pp.97–98; Propositions 7.4.1, 7.4.4–7.4.5 and Corollary 7.4.6 pp.98–102. [Dieulefait–Guerberoff–Pacetti](https://arxiv.org/pdf/0804.2302v2), algorithms §§2.1–2.3 pp.2–5, Galois realization Theorem 3.1 p.6, finite comparison §4 pp.6–8, correctness proof §5 pp.8–16. [Box](https://arxiv.org/pdf/1906.05206v3), Theorems 2.1, 2.4 and 2.6, pp.4–7, Proposition 3.1 pp.8–9; general theorems imported through EffectiveDiophantineMethods.)

*Needs:* ModularCurvesPartII, Cartan/normalizer modular interpretations, normalization and j-maps; EffectiveDiophantineMethods, the exact certificate and relative Chabauty exports specified above; ArithmeticGaloisRepresentations, finite-image recognition; TauCetiRoadmap.ClassFieldTheory, ray-class characters; ArithmeticLocallySymmetricSpaces, finite Hecke complexes; the actual Bianchi form and its exact Hecke data are part of the arithmetic input, not inferred from an unrelated matrix eigensystem; AutomorphicGaloisRepresentationsPartII, imaginary-quadratic Galois realization; GL2AutomorphicRepresentationsAndTransfer, soluble base change; [EllipticCurveModularityPartIIGL2TypeAbelianVarieties GT.6/quadratic-q-curves-modular](https://github.com/TauCetiProject/TauCetiRoadmap/pull/1036), modularity of geometric ℚ-curves over quadratic fields; [residual 3–5 construction](#cm-three-five-switch).

<a id="cg18-odd-symmetric-powers"></a>
### 2.31 Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)

Assume Conjecture B. Let A/K be an elliptic curve over a number field with End_ℂ(A) = ℤ and r = Sym^{2n−1}ρ_{A,p}. (Special case) If there is a prime p, totally split in K, with p + 1 divisible by an integer N₂ > 2n + 1 prime to the conductor of A, ρ̄_{A,p} surjective, A with good reduction at all v | p and ρ̄_A|_{G_{ℚ_p}} ≅ Ind ω₂, then r is potentially modular: the Dwork family point (BLGHT II Proposition 6.2) links r̄ to an induced representation, and two applications of CG's Theorem 5.16 give modularity. (General case) An auxiliary elliptic curve A′ with A′[q] ≅ A[q] (a point of the twisted modular curve X_A(q), [The twisted modular curve X_E(q)](#twisted-modular-curve)) satisfying the special-case hypothesis reduces the general case to it.

Assume Conjecture B. In the auxiliary construction require N₂>2n+1 and use the local and coefficient conditions of BLGHT II Proposition 6.2.

State the resulting comparison as `TauCeti.PotentialAutomorphy.cg18_oddSymPowers`.

Special case: [the Dwork eigenrealization](#dwork-eigenrealizations), [coefficient-prime ordinarity](#coefficient-prime-dwork-ordinarity) and Moret–Bailly; CG Theorem 5.16 twice. General case: Moret-Bailly on X_A(q) for the auxiliary curve; then the special case.

Odd symmetric powers are the input to the tensor-product trick for Theorem 1.1.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §10, proof of Theorem 1.1, 'extra hypothesis' bullet, p. 97 (arXiv v2) = Invent. p. 428 [sub-item sec10-special-case]; [Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §10, general case, pp. 97–98 (arXiv v2) = Invent. p. 429 [sub-items sec10-general-case, sec10-auxiliary-curve-lemma].)

*Needs:* [The twisted modular curve X_E(q)](#twisted-modular-curve); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="change-of-weight-and-level"></a>
### 2.32 Change of weight and level (Theorem 4.4.1)

Let F be imaginary CM, l > 2(n + 1) with ζ_l ∉ F and primes above l split over F⁺, S a finite split set of finite places of F⁺ containing those above l, µ algebraic, and r̄ : G_F → GL_n(F̄_l) with (r̄, µ̄) polarized, unramified outside S, ordinarily or potentially diagonalizably automorphic, and r̄|_{G_{F(ζ_l)}} irreducible. For v ∈ S let ρ_v be a lift of r̄|_{G_{F_ṽ}}, potentially diagonalizable with n distinct τ-Hodge–Tate numbers when v | l. Then there is a regular algebraic cuspidal polarized (π, χ) with r̄_{l,ı}(π) ≅ r̄, r_{l,ı}(χ)ε_l^{1−n} = µ, level potentially prime to l, unramified outside S, and ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}} for v ∈ S.

Every ρ_v is a lift of r̄|_{G_{F_ṽ}} with the indicated coefficient lattice.

State the resulting comparison as `TauCeti.PotentialAutomorphy.change_of_weight_and_level`.

pd-lifts-with-local-conditions gives a lift r with the local conditions ρ_v; pd-automorphy-lifting makes it automorphic; local–global compatibility (blggt-normalization-register (3)) gives ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}}.

Check the Serre-weight reading: r̄ is automorphic in every potentially diagonalizable weight and type it admits locally.

([BLGGT](#ref-blggt-2014-v4), §4.4, Theorem 4.4.1, pp. 58–59 (arXiv v4).)

*Needs:* [Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)](#pd-lifts-with-local-conditions); [potentially diagonalizable lifting](#polarized-pd-lifting); [Polarization and the automorphic realization](#blggt-normalization-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-totally-real"></a>
### 2.33 Potential automorphy over totally real fields (Corollary 4.5.2)

Let F⁺ be totally real, l ≥ 2(n + 1), and (r, µ) a totally odd, regular algebraic, n-dimensional polarized l-adic representation of G_{F⁺}, potentially diagonalizable at each prime above l, with r̄|_{G_{F⁺(ζ_l)}} irreducible. Then there is a Galois totally real F^{+,′}/F⁺ such that (r|_{G_{F^{+,′}}}, µ|_{G_{F^{+,′}}}) is automorphic of level prime to l.

F⁺ totally real.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal`.

Choose an imaginary quadratic F/F⁺ in which primes above l split, disjoint from (F̄⁺)^{ker ad r̄}(ζ_l); apply potential-automorphy-theorem to r|_{G_F}; descend from the CM field F′ to (F′)⁺ by automorphy-twist-and-soluble-base-change.

Check against KW/Taylor over ℚ: for n = 2 this recovers potential modularity of odd regular 2-dimensional representations with PD local conditions.

([BLGGT](#ref-blggt-2014-v4), §4.5, Corollary 4.5.2, p. 60 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-mod-l"></a>
### 2.34 Potential automorphy of mod l representations with prescribed local lifts (Corollary 4.5.3)

In the situation of Theorem 4.5.1 but with r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible, (r̄_i, µ_i) polarized (µ_i totally odd de Rham), r̄_i|_{G_{F(ζ_{l_i})}} irreducible, S a Gal(F/F⁺)-stable finite set of primes containing those above l_i and the ramification, and lifts ρ_{i,v} (v ∈ S) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}, potentially diagonalizable with n_i distinct Hodge–Tate numbers when v | l_i: there are F′ (as in 4.5.1) and (π_i, χ_i) with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, level potentially prime to l_i, unramified outside S, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S.

The local lift for index i and place v is ρ_{i,v} of dimension n_i; at a place u of F′ above v compare its restriction to G_{F′_u}.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_residual`.

Reduce to S split over F⁺ as in potential-ordinary-automorphy; pd-lifts-with-local-conditions gives lifts r_i with r_i|_{G_{F_v}} ∼ ρ_{i,v}; apply potential-automorphy-theorem.

Check that it strengthens Proposition 3.3.1: the local conditions may be any potentially diagonalizable types, not only ordinary.

([BLGGT](#ref-blggt-2014-v4), §4.5, Corollary 4.5.3, pp. 60–61 (arXiv v4).)

*Needs:* [Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)](#pd-lifts-with-local-conditions); [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="compatible-systems-potentially-automorphic"></a>
### 2.35 Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)

Let F/F₀ be finite Galois of CM (resp. totally real) fields and F^{(avoid)}/F finite Galois. If (ℛ_i, ℳ_i), i = 1, …, r, are totally odd, polarized weakly compatible systems of l-adic representations of G_F with each ℛ_i regular and irreducible, then there is a finite CM (resp. totally real) F′/F, linearly disjoint from F^{(avoid)} and Galois over F₀, such that each (ℛ_i|_{G_{F′}}, ℳ_i|_{G_{(F′)⁺}}) is automorphic. In particular (Corollary 5.4.2) a single such system becomes automorphic over a finite Galois CM (resp. totally real) F′/F.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem`.

Totally real case from the CM case by automorphy-twist-and-soluble-base-change, choosing F′ disjoint from the fields F_i¹ of Lemma 5.3.1 (rank-two-reducibility-independent-of-lambda) so that ℛ_i stays irreducible (Lemma A.2.1). Take M common; L = ∩_i(L_{i,1} ∩ L_{i,2}) of density 1, with L_{i,1} from residual-irreducibility-density-one and L_{i,2} the primes where ℛ_i is irreducible (Lemma A.1.7). Remove finitely many l: l ≥ 2(dim ℛ_i + 1), l unramified in F and not below the bad primes, Hodge–Tate numbers in some [a, a + l − 2]. potential-diagonalizability-criteria (2) makes r_{i,λ} potentially diagonalizable; apply potential-automorphy-theorem to the r_{i,λ} for one λ | l ∈ L.

Check the density-one bookkeeping: the intersection of finitely many density-one sets has density one. Check the Fontaine–Laffaille step: for l large the Hodge–Tate range (fixed by the system) has length < l − 2.

([BLGGT](#ref-blggt-2014-v4), §5.4, Theorem 5.4.1, Corollary 5.4.2 and proof, p. 74 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [potential diagonalizability](#potential-diagonalizability) (pd criteria); PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda); PotentialModularityAndCompatibleSystems, Layer R24.5 (weakly compatible system rank n); PotentialModularityAndCompatibleSystems, Layer R24.5 (compatible system predicates); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="constituents-potentially-automorphic"></a>
### 2.36 Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)

Let F be CM and (ℛ, ℳ) a totally odd, polarized weakly compatible system with ℛ pure and extremely regular; write r_λ = r_{λ,1} ⊕ ⋯ ⊕ r_{λ,j_λ} into irreducibles. There is a set L of rational primes of Dirichlet density 1 such that for λ | l ∈ L there is a finite CM Galois F′/F with each (r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{(F′)⁺}}) irreducible and automorphic.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic`.

Lemma 5.4.5 (PM R24.5/constituents-essentially-self-dual, v1 Lemma 5.2.3): each (r_{λ,α}, µ_λ) is totally odd polarized. L from residual-irreducibility-density-one, minus finitely many l (l ≥ 2(dim ℛ + 1), unramified, Fontaine–Laffaille range); potential-diagonalizability-criteria (2); potential-automorphy-theorem with F^{(avoid)} the compositum of the F̄^{ker r̄_{λ,α}}.

Check that irreducibility over F′ comes from the choice of F^{(avoid)}: r̄_{λ,α}|_{G_{F′}} stays irreducible, hence so does r_{λ,α}|_{G_{F′}}.

([BLGGT](#ref-blggt-2014-v4), §5.4, Lemma 5.4.5 and Proposition 5.4.6, pp. 76–77 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [potential diagonalizability](#potential-diagonalizability) (pd criteria); PotentialModularityAndCompatibleSystems, Layer R24.5 (constituents essentially self dual); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="cg18-conditional-potential-modularity"></a>
### 2.37 Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))

Assume the complete [Calegari–Geraghty Hecke-cohomology hypothesis](#cg-conjecture-b), including its local conditions, amplitude, boundary vanishing and level comparison. Let F be any number field and E/F an elliptic curve. Then E is potentially modular. This is an implication from that conjectural hypothesis, not a proof of the hypothesis.

Hypothesis: Conjecture B (status conjectural). F arbitrary; E arbitrary.

State the resulting comparison as `TauCeti.PotentialAutomorphy.cg18_potentialModularity`.

Odd symmetric powers Sym^{2n−1} of E are potentially modular ([Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers)), using CG's minimal modularity lifting beyond Taylor–Wiles (their Theorem 5.16, which assumes Conjecture B). Harris–Shepherd-Barron–Taylor's reduction from odd symmetric powers to E itself (tensor product trick).

The conclusion concerns potential modularity; it does not assert modularity over F itself. Its Conjecture B hypothesis is shared with the odd-symmetric-power and Sato–Tate consequences.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429.)

*Needs:* [Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers); [Assertions with explicit hypotheses](#endpoint-status-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-weak-automorphy-symmetric-powers"></a>
### 2.38 Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 2) and det r_λ = ε^{−m}. Let v₀ ∉ S. Then for each n ≥ 1 there is a CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is weakly automorphic of level prime to the places above v₀. The proof uses a semistable elliptic curve A/ℚ, good ordinary at an auxiliary prime q > 2nm + 1 with surjective mod q image, and the automorphy of Sym^{nm−1} of A over a CM field F₆ (ACC+).

State the resulting comparison as `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower`.

[The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)](#p-r-switch) with the CM-induced system S_CM and the elliptic-curve seed (ACC+ Theorem 7.1.11 / [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers) for the symmetric powers of A). Moret-Bailly to find the auxiliary data over F_n.

Feeds BCGNT Theorem 6.2.1 and the purity Lemma 6.1.3.

([BCGNT](#ref-bcgnt-2025), Theorem 6.2.4 and proof (incl. the elliptic curve A/ℚ and the automorphy of Sym^{nm−1}ρ_{A,q}|G_{F₆}), §6.2, arXiv v3 pp. 64–68 (published pp. 57–61; arXiv pagination differs).)

*Needs:* [The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)](#p-r-switch); [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); PotentialModularityAndCompatibleSystems, Layer R23.1; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-elliptic-symmetric-powers"></a>
### 2.39 Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)

Let 𝓜 be a finite set of positive integers, E/ℚ a non-CM elliptic curve, 𝓛 a finite set of primes of good reduction and F^avoid/ℚ finite. There are a finite Galois F₂^avoid/ℚ linearly disjoint from F^avoid and a finite totally real Galois F^suffices/ℚ unramified above 𝓛 and linearly disjoint from F^avoid F₂^avoid, such that for every finite totally real F′/F^suffices linearly disjoint from F₂^avoid and every m ∈ 𝓜 there is a regular algebraic cuspidal polarizable π of GL_{m+1}(𝔸_{F′}) of weight 0 with Sym^m H_{E,ℓ}|_{G_{F′}} ≅ r_{l,ı}(π) (unramified above 𝓛; the same compatible-system realization holds for every l and ι, without asserting ordinarity at all residual characteristics).

Here V_{E,ℓ}=T_ℓ(E)⊗ℚ_ℓ and H_{E,ℓ}=V_{E,ℓ}∨=H¹_et(E_{ℚ̄},ℚ_ℓ), with HT(H_{E,ℓ})={0,1} and determinant ε_ℓ⁻¹.

State the resulting comparison as `TauCeti.SymmetricPower.acc_ellipticSymPowers`.

[Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy) applied to Sym^m of E[l] twisted by an induced character ψ_m of a CM field to make the residual representation symplectic, then the residual symplectic Dwork target here lifting.

The seed of Qian's argument ([An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed)) and of ACC+ Theorem 7.1.11.

([ACC+](#ref-acc-2023), §7.2.1, Corollary 7.2.4, arXiv v2 pp. 205–206 (Annals pp. 1100–1101); proof pp. 206–208 (Annals pp. 1101–1103).)

*Needs:* [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); [polarized lifting](#polarized-lifting-extensions); [C-SYSTEM](#contract-c-system).

<a id="compatible-system-l-function-continuation"></a>
### 2.40 Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)

Under the hypotheses of Corollary 5.4.2: (1) for ı : M ↪ ℂ, L^S(ıℛ, s) converges uniformly absolutely on compact subsets of a right half plane and continues meromorphically to ℂ; (2) ℛ is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s); (3) if F is totally real, n is odd and v | ∞, then tr r_λ(c_v) = ±1 is independent of λ.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.lFunction_meromorphic`.

Strict purity: Theorem 5.4.1, Theorem 2.1.1 (purity of WD at v ∤ l for automorphic members) and Brauer's theorem as in the proof of part-of-compatible-system (the Grothendieck-ring argument of PM R24.5/galois-grothendieck-ring). Continuation and functional equation: over each soluble F′/F_i in a Brauer decomposition 1 = Σ n_i Ind ψ_i the system is automorphic, so L^S(ıℛ, s) = ∏ L^S(π_i ⊗ ψ_i, s)^{n_i} (HSBT10 Theorem 4.2 argument), each factor meromorphic with the standard functional equation; nontrivial rank≥2 cuspidal standard factors are entire, while the rank-one trivial factor has a pole (AL.2). (3): reduce to the automorphic case, Taylor 2012 (the Calegari observation); cited.

Check that the Γ- and ε-factors are those of PM R24.5/system-l-functions, so (2) is the functional equation that node could not claim. Check the example of an elliptic curve over a totally real field: L(E, s) continues and satisfies its functional equation (the system is regular, irreducible, polarized).

([BLGGT](#ref-blggt-2014-v4), §5.4, Corollary 5.4.3 and proof, pp. 74–75 (arXiv v4).)

*Needs:* [Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)](#compatible-systems-potentially-automorphic); PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions); PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicLFunctionsAndLocalFactors, Layer AL.2; `Matrix.trace`; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="part-of-compatible-system"></a>
### 2.41 A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)

Let F be CM, l ≥ 2(n + 1) with ζ_l ∉ F, and (r, µ) an n-dimensional totally odd regular algebraic polarized l-adic representation of G_F, potentially diagonalizable above l with r̄|_{G_{F(ζ_l)}} irreducible. Then r is part of a strictly pure compatible system of l-adic representations of G_F.

F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_compatibleSystem`.

potential-automorphy-theorem gives F′/F Galois CM, disjoint from F⁰F̄^{ker r̄} (F⁰ cut out by the component group of the Zariski closure of r), and (π, χ) over F′ with r_{l,ı}(π) = r|_{G_{F′}}; soluble descent gives π(F″) for F′/F″ soluble. For each (l′, ı′), decompose r_{l′,ı′}(π) into irreducibles; the component groups are independent of l′ (Lemma 5.3.1), so the pieces descend to each F″. Brauer: 1 = Σ n_i Ind_{F′_i}ψ_i with F′/F′_i soluble; set A_{l′,ı′,α} = Σ n_i ind_{F′_i/F}([r_{l′,ı′}(π(F′_i))_α][ı′^{−1}ψ_i]) in Rep_{F,l′}; dim A = dim r_{l′,ı′}(π)_α and (A, A) = 1, so A = [r_{l′,ı′,α}] is a genuine irreducible representation (PM R24.5/galois-grothendieck-ring). r_{l′,ı′} = ⊕_α r_{l′,ı′,α} has r_{l,ı} ≅ r; its Weil–Deligne representations are pure (Theorem 2.1.1, Lemma 1.3.6) and have l′-independent traces, so the system is strictly pure and compatible.

Check the Grothendieck-ring step: (A, A) = 1 with dim A ≥ 0 is exactly the criterion in PM R24.5/galois-grothendieck-ring (4).

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.1 and proof, pp. 79–81 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [Potential automorphy over totally real fields (Corollary 4.5.2)](#potential-automorphy-totally-real); PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="patrikis-taylor-potential-automorphy"></a>
### 2.42 Simultaneous potential automorphy of pure regular polarized systems

Let F/F₀ be finite Galois of CM fields, F^avoid/F finite Galois and {(R_i,M_i)} a finite family of totally odd polarized weakly compatible systems over F. Suppose every R_i is pure and regular. After finite coefficient extensions there are decompositions R_i≅⊕_j R_{i,j} into weakly compatible systems and **one** finite CM extension F′/F, Galois over F₀ and linearly disjoint from F^avoid over F, such that every polarized constituent system R_{i,j}|G_{F′} is realized by a regular algebraic cuspidal polarized automorphic representation. The whole R_i is thus isobarically automorphic. Neither irreducibility nor extreme regularity is a hypothesis. In Patrikis–Taylor's terminology CM includes totally real fields. Their Theorem A gives the totally real version: an odd essentially self-dual pure regular system, symplectic with totally odd multiplier or orthogonal with totally even multiplier, has a Galois totally real automorphy extension. The multiplier must itself be a compatible rank-one system.

State `TauCeti.PotentialAutomorphy.patrikisTaylor` with the finite family, decomposition, common field and avoidance data in its conclusion. This package owns the missing pure-regular constituent argument. First enlarge M_i to a CM full field of definition. Lemma 1.6 uses purity and the actual pairing to show that every irreducible constituent at a conjugation-invariant coefficient prime is polarized and totally odd with the specified multiplier. Chebotarev supplies a positive-density set of such coefficient primes. Intersect with the density-one sets for residual cyclotomic irreducibility, remove the finite bad sets, and arrange the Fontaine–Laffaille ranges and the BLGGT dimension bounds. Apply [potentially diagonalizable potential automorphy](#potential-automorphy-theorem) simultaneously, putting every selected residual kernel and cyclotomic field into F^avoid. The compatible-system construction of [BLGGT 5.5.1](#part-of-compatible-system) extends each selected constituent to all coefficient primes; Frobenius polynomials and semisimplicity give the original direct-sum identity. This is the extension of R24.5 needed here; that supplier's extreme-regular theorem does not prove it.

**Checks.**

- A reducible pure regular system may have several cuspidal constituents; its direct sum is not declared cuspidal.
- Regularity alone, without purity, does not provide the conjugation-invariant-prime polarization lemma.
- Two systems use the same returned F′, not two unrelated extensions.
- The avoidance field is over F and disjointness is over F; Galoisness is over F₀.
- Extreme regularity is not reintroduced in the proof.

([Patrikis–Taylor](#ref-patrikis-taylor-2015), Lemma 1.6, p.9; Theorem 2.1 and proof pp.12–13; Theorem A p.2. Fresán–Sabbah–Yu Theorem 5.38 is an application, not the primary proof.)

*Needs:* PotentialModularityAndCompatibleSystems, R24.5 compatible-system operations and R24.6 residual irreducibility; [potentially diagonalizable potential automorphy](#potential-automorphy-theorem); [compatible-system construction](#part-of-compatible-system); TauCetiRoadmap.Chebotarev, Layer 10; [C-SYSTEM](#contract-c-system).

<a id="irreducibility-density-one"></a>
### 2.43 Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)

Let F be CM and π a regular algebraic, polarizable, cuspidal automorphic representation of GL_n(𝔸_F) of extremely regular weight. Then there is a set L of rational primes of Dirichlet density 1 such that r_{l,ı}(π) is irreducible for every l ∈ L and ı : Q̄_l ≅ ℂ.

F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

State the resulting comparison as `TauCeti.PotentialAutomorphy.irreducible_density_one`.

Apply constituents-potentially-automorphic to ℛ = {r_{l,ı}(π)}; for l ∈ L write r_{l,ı}(π) = ⊕_{α=1}^j r_{l,ı}(π)_α, each potentially automorphic. ord_{s=1}L^S(ı(ℛ ⊗ ℛ^∨), s) = ord_{s=1}L^S(π × π^∨, s) = −1 (Jacquet–Shalika, Shahidi; requested from AL.3). On the other hand, using the potential automorphy of the constituents and Brauer induction, the order is −j; hence j = 1.

For unitary cuspidal π,π′, the Rankin–Selberg function L^S(π×π′^∨,s) has a simple pole at s=1 exactly when π≅π′, and is holomorphic and nonzero there otherwise. A nontrivial unitary twist can move the pole; being a twist alone is not the criterion at the fixed point s=1.

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.2 and proof, pp. 81–82 (arXiv v4).)

*Needs:* [Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)](#constituents-potentially-automorphic); AutomorphicLFunctionsAndLocalFactors, Layer AL.3; PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="elliptic-symmetric-power-seed"></a>
### 2.44 An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)

In the situation of [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime) there are a finite Galois F_2^avoid/ℚ and a finite totally real Galois F^suff/ℚ unramified above the prime divisors of N, with F_2^avoid ∩ F^avoid = ℚ, F^suff ∩ F^avoid F_2^avoid = ℚ, ℚ̄^{ker r̄_{E,l′}} ⊂ F_2^avoid, F^avoid and F_2^avoid unramified above N, such that for every finite totally real F′/F^suff with F′ ∩ F_2^avoid = ℚ, Sym^{n−1} H_{E,ℓ′}|_{G_{F′}} is automorphic.

E/ℚ non-CM; l′ as in [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime).

State the resulting comparison as `TauCeti.PotentialAutomorphy.ellipticSeed`.

ACC+ Corollary 7.2.4 (potential automorphy of the symmetric powers of a non-CM elliptic curve over totally real fields with prescribed disjointness, [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers) states it over totally real F′) gives the seed. Qian's proof checks the extra ramification and disjointness conditions.

Used once, in the proof of [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy).

([Potential automorphy for GL_n](#ref-qian-2023), Proposition 4.1 (second list and final assertion), §4, p. 21; proof p. 22 (arXiv v1); Invent. pp. 1269–1270 per routed locator.)

*Needs:* [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime); [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="multiple-product-l-functions"></a>
### 2.45 Tensor products of non-CM modular forms (Corollary 5.4.4)

Let K ⊆ ℤ_{>0} be finite with the 2^{#K} partial sums of its elements distinct, and f_k (k ∈ K) non-CM newforms of weight k + 1 with automorphic π_k. Then there are a totally real Galois F/ℚ and a regular algebraic polarizable cuspidal Π on GL_{2^{#K}}(𝔸_F) with rec(Π_v|det|^{(1−2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{−1/2}))|_{W_{F_v}} for almost all v; in particular L(×_k π_k, s) continues meromorphically to ℂ.

f_k non-CM; the partial-sum condition gives regularity of ⊗_k r_{k,λ}.

State the resulting comparison as `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic`.

Apply compatible-systems-potentially-automorphic to ⊗_K r_{k,λ}. Irreducibility (Goursat): the Zariski closure H̄ of (∏ r_{k,λ})(G_ℚ) in PGL_2^K surjects onto each factor; as PGL_2 is simple with only inner automorphisms, H̄ = PGL_2^I with K = ⊔ K_i mapping diagonally; #K_i > 1 would give r_{k,λ} ≅ r_{k′,λ} ⊗ χ with χ de Rham, contradicting Hodge–Tate numbers; so H ⊇ SL_2^K, whose tensor representation is irreducible.

Check the partial-sum condition on K = {1, 2, 4}: the 8 subset sums 0, …, 7 are distinct; on K = {1, 2, 3} they are not (1 + 2 = 3).

([BLGGT](#ref-blggt-2014-v4), §5.4, Corollary 5.4.4 and proof, pp. 75–76 (arXiv v4).)

*Needs:* [Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)](#compatible-systems-potentially-automorphic); [Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation); PotentialModularityAndCompatibleSystems, Layer R24.5 (linear algebra operations on systems); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="decomposition-into-irreducible-systems"></a>
### 2.46 Splitting a polarized system into irreducible systems (Theorem 5.5.3)

Let F be CM and ℛ a pure, extremely regular, totally odd, polarizable weakly compatible system of G_F. Then ℛ = ℛ_1 ⊕ ⋯ ⊕ ℛ_s with each ℛ_i an irreducible, strictly pure, totally odd, polarizable compatible system.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems`.

Choose L of density 1 for residual-irreducibility-density-one and constituents-potentially-automorphic; pick λ | l ∈ L with l ≥ 2(n + 1), unramified, Fontaine–Laffaille Hodge–Tate range; decompose r_λ = ⊕ r_{λ,α}. part-of-compatible-system puts each r_{λ,α} in a strictly pure compatible system ℛ_α; over F′ it is the system of an extremely regular π_α, so irreducibility-density-one makes ℛ_α irreducible on a density-one set. Compare Frobenius polynomials: ⊕ℛ_α and ℛ agree at r_λ, hence everywhere.

Check the degenerate case s = 1: an irreducible system is its own decomposition, with the added conclusion of strict purity.

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.3 and proof, p. 82 (arXiv v4).)

*Needs:* [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system); [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); [Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)](#constituents-potentially-automorphic); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="dwork-fibre-automorphy-transport"></a>
### 2.47 Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)

Let t∈F′ be the chosen Dwork point, with its fixed eigenprojector and realizations V_{λ,t}, V_{λ′,t}. The auxiliary-prime ordinary lifting theorem gives V_{λ′,t}≅r_{l′,ι′}(π) for a regular algebraic cuspidal π, after the Teichmüller character twist. At good places the eigenprojector gives a common Frobenius polynomial over ℚ(ζ_N), or its real subfield when n=2. Choose ι and ι′ to induce the same embedding of that coefficient field into ℂ, conjugating π if necessary. Then V_{λ,t}^{ss}≅r_{l,ι}(π). For the arbitrary semisimple residual input of Theorem 1.1, neither semisimplicity of V_{λ,t} nor ramified monodromy compatibility follows from this comparison. If its residual representation χ̄₁⊗r̄|G_{F′} is absolutely irreducible, as in Theorem 1.4, then V_{λ,t} is irreducible and the semisimplification may be removed.

The Dwork point and auxiliary-prime lifting hypotheses of Qian §4; matched coefficient embeddings; the character twist is the actual Teichmüller lift used by the ordinary lifting output.

State the resulting comparison as `TauCeti.PotentialAutomorphy.dworkTransport`.

Apply ACC+ Theorem 6.1.2 at l′ with ordinary regular weights, enormous image, decomposed genericity and the scalar element. Retain the resulting cuspidal representation and the actual character twist. Obtain coefficient-independent good-place eigenprojector traces by the Lefschetz trace formula applied to symmetry elements composed with Frobenius. Match the coefficient embeddings. Use Chebotarev and Brauer–Nesbitt to identify the global semisimplification with the same automorphic member. A graded stable lattice reduces to the original semisimple residual module. The auxiliary-prime Steinberg argument proves ι-ordinarity of π; potential semistability and Galois ordinarity of V_{λ,t}^{ss} use [the coefficient-prime comparison](#coefficient-prime-dwork-ordinarity) and [ordinary subquotient stability](#ordinary-subquotient-semisimplification). Absolutely irreducible residual input forces the original fibre to be irreducible.

The transport between coefficient primes is the step where the compatible system of the Dwork motive is used.

([Potential automorphy for GL_n](#ref-qian-2023), §4, proof of Theorem 1.1, p. 24 (arXiv v1); Invent. pp. 1272–1273 per routed locator; [ACC+](#ref-acc-2023), §6.1, Theorem 6.1.2, hypothesis (5), arXiv v2 p. 134 (Annals p. 1031); the theorem begins on arXiv p. 133; [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); geometric explanation in §1, p. 4; [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [coefficient-prime ordinarity](#coefficient-prime-dwork-ordinarity); [ordinary subquotient and semisimplification comparison](#ordinary-subquotient-semisimplification); [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed); [polarized lifting](#polarized-lifting-extensions); TauCetiRoadmap.Chebotarev, Layer 10; PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system).

<a id="compatible-system-from-potential-automorphy"></a>
### 2.48 A potentially automorphic geometric GSp_{2n}-lift lies in a strictly pure compatible system (FKP, after BLGGT 5.5.1)

Let F be totally real, n ≥ 1, and ρ : Γ_F → GSp_{2n}(O′) geometric with Zariski-dense image and cyclotomic similitude κ^{1−2n}. Retain the auxiliary Steinberg place v₀ of FKP Proposition 9.1: WD(ρ|_{Γ_{F_{v₀}}}) has a regular nilpotent monodromy operator (an unramified twist of the rank-2n Steinberg parameter). Suppose that ρ|_{Γ_{F′}} ≅ r_ι(Π_{F′}) for a RAESDC Π_{F′} of GL_{2n}(𝔸_{F′}), F′/F Galois totally real. Then ρ belongs to a strictly pure compatible system {ρ_{ι′}} of ℓ-adic representations of Γ_F indexed by primes ℓ and ι′ : ℂ ≅ Q̄_ℓ. For Zariski density at every coefficient prime, take the two-place variant of [the Steinberg construction](#potential-automorphy-with-steinberg-place): both v₀ and v₁ are away from the original coefficient prime p, their residue characteristics q₀,q₁ are distinct, and both local monodromy operators are regular nilpotent. Together with the compatible symplectic pairing and ℓ-independent formal character, this gives Zariski-dense image for every member.

State the resulting comparison as `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic`.

Use the argument of BLGGT Theorem 5.5.1 ([A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system)): Brauer's induction over the soluble subextensions of F′/F, with soluble descent (PotentialAutomorphyInfrastructure Layer 2). For any coefficient prime ℓ, choose j∈{0,1} with ℓ≠q_j. Strict compatibility at v_j identifies the Frobenius-semisimplified Weil–Deligne parameter, including its monodromy operator, with that of the original p-adic member. Thus every member has regular nilpotent monodromy at a place away from its coefficient prime. This uses strict ramified compatibility, rather than good-place Euler polynomials alone. FKP's regular-unipotent argument and the symplectic pairing reduce the Zariski closure to a principal GL₂ or GSp_{2n}; independence of formal character excludes the principal GL₂ alternative when n>1. At n=1, GSp₂ is already GL₂.

**Checks.**

- For ℓ=q₀ use v₁; for ℓ=q₁ use v₀; for ℓ outside {q₀,q₁} either place works.
- If q₀=q₁, the selection fails at that prime, explaining the distinct-characteristic requirement.
- The one-place construction alone still needs a separate comparison at its own residue characteristic.

The GSp-valued refinement of [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system).

([Lifting and automorphy of reducible mod p Galois representations over global fields](#ref-fkp-2022), §9, proof of Proposition 9.1, arXiv v5 pp. 42–43.)

*Needs:* [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system); [Residual potential automorphy with a Steinberg place](#potential-automorphy-with-steinberg-place), including its simultaneous finite-place variant; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="patrikis-taylor-l-function-consequences"></a>
### 2.49 Strict purity and functional equations for pure regular polarized systems

Let F be CM and (R,µ) a totally odd polarized weakly compatible system with R pure and regular. For each coefficient embedding ι:M→ℂ the partial L-function converges uniformly absolutely on compact subsets of some right half-plane and continues meromorphically to ℂ. R is strictly pure, including coherent pure Weil–Deligne parameters at bad places, and the completed factors satisfy

```text
Λ(ιR,s)=ε(ιR,s) Λ(ιR∨,1−s).
```

This is the dual form of the functional equation; for an actual geometric self-duality R∨≅R(w), it becomes the motivic reflection s↦1+w−s. It does not assert entireness for a system with trivial constituents. State `TauCeti.PotentialAutomorphy.patrikisTaylor_analytic` over every CM F, not only ℚ.

Apply the preceding [pure regular potential automorphy theorem](#patrikis-taylor-potential-automorphy) to its actual constituent systems. Brauer induction over the single Galois automorphy extension and soluble base change give meromorphic continuation and the dual functional equation. Pure local–global compatibility for the cuspidal constituents, transported by restriction and Frobenius comparison, supplies strict purity at every finite place; retain the actual archimedean sign data. The general L-function operations are R24.5's exports; the removal of extreme regularity and the constituent argument are the local extension above.

**Checks.**

- For the trivial line the function has its zeta pole.
- For H¹ of an elliptic curve the geometric self-duality has w=1 and the motivic center is 1.
- A weak good-prime system alone does not specify the ramified factors used in the completed equation.
- A regular but non-extremely-regular pure polarized system is within the theorem.

([Patrikis–Taylor](#ref-patrikis-taylor-2015), Corollary 2.2 and proof p.13; strict purity defined after Lemma 1.6, pp.9–10; Corollary 2.3 p.13.)

*Needs:* [pure regular potential automorphy](#patrikis-taylor-potential-automorphy); PotentialModularityAndCompatibleSystems R24.5, strict systems and L-functions; AutomorphicLFunctionsAndLocalFactors, standard functional equations; PotentialAutomorphyInfrastructure Layer 2, soluble base change; [C-SYSTEM](#contract-c-system).

<a id="qian-residual-potential-automorphy"></a>
### 2.50 Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)

Let F be a CM number field, F^av/F a finite extension, n ≥ 2, l a prime and r̄ : G_F → GL_n(F_{l^s}) a continuous semisimple representation. Then there is a finite CM Galois extension F′/F, linearly disjoint from F^av over F, such that r̄|_{G_{F′}} is ordinarily automorphic: it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal on GL_n(𝔸_{F′}) and r|_{G_{F′_v}} potentially semistable and ordinary with regular Hodge–Tate weights for all v | l. No polarization, oddness or residual image hypothesis is imposed.

F CM; r̄ semisimple, of any dimension n ≥ 2 and any residual characteristic l.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_residual`.

Choose the auxiliary data E, N, F^avoid and an ordinary auxiliary prime l′ ([Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime)). Automorphy of Sym^{n−1} of the elliptic curve at l′ over a totally real F^suff ([An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed)). Moret-Bailly gives a point t of the Dwork family over F′ with the l-adic fibre lifting r̄ ⊗ (twist) and the l′-adic fibre congruent to Sym^{n−1} of E (the residual symplectic Dwork target here; PotentialModularityAndCompatibleSystems R23.1). Apply ACC+ Theorem 6.1.2 at l′ and compare common good-place Frobenius polynomials with matched coefficient embeddings to obtain V_{λ,t}^{ss}≅r_{l,ι}(π). At the l-adic places v(t)<0, Qian’s separate ordinarity theorem, with the equivariant semistable model and log-monodromy comparisons above, gives potential semistability and an ordinary regular filtration of V_{λ,t} geometrically at the coefficient prime. Thesis Remark 3.0.13 distinguishes this from the auxiliary-prime argument. These properties pass to G_{F′_v}-stable subquotients and hence to the global semisimplification; retain the union of the distinct Hodge weights. Separately, auxiliary-prime semisimplicity and the Steinberg slope argument prove that π is ι-ordinary. The semisimple reduction of a saturated graded stable lattice is the original semisimple r̄; no unsplit residual extension is recovered. ACC+ Corollary 5.5.2’s irreducible-residual converse is used only in Theorem 1.4, never to obtain Galois ordinarity in the general Theorem 1.1 branch.

The conclusion is automorphy over the extension F′. Descent to F requires an additional theorem.

([Potential automorphy for GL_n](#ref-qian-2023), Theorem 1.1, §1, p. 1 (arXiv v1); Invent. pp. 1239–1240 per routed locator; proof §4, pp. 21–24 (arXiv v1); [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); geometric explanation in §1, p. 4; [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime); [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed); [Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)](#dwork-fibre-automorphy-transport); [Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)](#steinberg-ordinarity-lemma); PotentialModularityAndCompatibleSystems, Layer R23.1; [polarized lifting](#polarized-lifting-extensions); [C-MODULI](#contract-c-moduli).

<a id="qian-ordinary-potential-automorphy"></a>
### 2.51 Potential automorphy of ordinary l-adic representations over CM fields (Qian, Theorem 1.4)

Let F be a CM field, F^av/F finite, n ≥ 2, l > n a prime, ι : Q̄_l ≅ ℂ and r : G_F → GL_n(Q̄_l) continuous with (i) r unramified almost everywhere; (ii) r|_{G_{F_v}} potentially semistable and ordinary with regular Hodge–Tate weights for each v | l; (iii) r̄ absolutely irreducible and decomposed generic, with r̄(G_{F(ζ_l)}) enormous; (iv) some σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar. Then there is a finite CM Galois F′/F, linearly disjoint from F^av over F, such that r|_{G_{F′}} is ordinarily automorphic.

As in the statement; F^av arbitrary.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_ordinary`.

Apply [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy) to r̄ with F^av enlarged to contain F̄^{ker r̄}(ζ_l). Conclude by ACC+ Theorem 6.1.2 (ordinary automorphy lifting over CM fields), supplied by PotentialAutomorphyInfrastructure Layer 5, §5.23 with all its hypotheses.

Specialises to Qian's Theorem 1.1 lifts when r is itself ordinary.

([Potential automorphy for GL_n](#ref-qian-2023), Theorem 1.4, §1, p. 2 (arXiv v1); Invent. p. 1241 per routed locator; proof: last paragraph of §4, p. 26 (arXiv v1).)

*Needs:* [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="imaginary-quadratic-elliptic-modularity"></a>
### 2.52 Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton)

Assume [CNExceptionalCurveData(F)](#exceptional-modular-curves). Let F be an imaginary quadratic field such that the Mordell–Weil group X₀(15)(F) is finite (for example F = ℚ(√−d), d = 1, 2, 3, 5). Then every elliptic curve E/F is modular: there is a cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight 2 (or, when E has CM by a field embedding in F, an isobaric sum ψ ⊞ ψ^c of Hecke characters of F) with L(E,s)=L(π,s−1/2) in unitary automorphic normalization (and the analogous sum of the two CM Hecke factors). If F is an imaginary CM field, Galois over ℚ with ζ₅ ∉ F, then 100% of Weierstrass equations over F, ordered by height, define modular elliptic curves.

For the first implication require F imaginary quadratic, X₀(15)(F) finite and the explicit arithmetic data CNExceptionalCurveData(F). For the density implication require F imaginary CM Galois over ℚ with ζ₅ ∉ F; no exceptional-curve point classification enters that argument.

State the resulting comparison as `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic`.

Apply the [potentially semistable CM lifting theorem](#potentially-semistable-cm-lifting), with its exact residual and local seed conditions. The [3–5 residual construction](#cm-three-five-switch) supplies that seed after a soluble extension. The [exceptional modular-curve analysis](#exceptional-modular-curves) treats the cases outside the residual theorem. The 100% statement additionally uses the height-density and decomposed-genericity argument specified at the residual construction.

The explicit arithmetic inputs and their verified exceptional-curve consequences supply the finite branch of this individual implication. CN prove these arithmetic inputs; the statement here retains them as hypotheses. The density-one result uses only the preceding residual construction and quantitative Hilbert irreducibility.

([On the modularity of elliptic curves over imaginary quadratic fields](#ref-caraiani-newton-2023), §1, Theorem 1.1 (Corollary 7.1.2), p. 2 (arXiv:2301.10509v3); [On the modularity of elliptic curves over imaginary quadratic fields](#ref-caraiani-newton-2023), §1, Theorem 1.2 (Corollary 6.1.2), p. 3 (arXiv:2301.10509v3).)

*Needs:* [CM residual 3–5 construction](#cm-three-five-switch); [exceptional modular-curve certificate](#exceptional-modular-curves); [potentially semistable CM lifting](#potentially-semistable-cm-lifting); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); PotentialModularityAndCompatibleSystems, Layer R23.1; [Assertions with explicit hypotheses](#endpoint-status-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

### Examples

For a finite collection of polarized systems the extension in simultaneous potential automorphy must be common to all members and disjoint from the one prescribed avoidance field. Separate extensions with no disjointness control cannot be substituted. In the elliptic seed H_{E,ℓ} has determinant ε_ℓ⁻¹; Sym² H has determinant ε_ℓ⁻³ and Hodge numbers {0,1,2}. Qian’s determinant twists and the Dwork realization must be compared in this same convention.

### Dependencies

The layer uses the exact supplier contracts above, PotentialModularityAndCompatibleSystems, Layer R23.1 (moret bailly theorem incomplete skolem data have integral points), [residual symplectic Dwork construction](#polarized-dwork-potential-automorphy), [prescribed ordinary lifts](#prescribed-polarized-ordinary-lifts), [polarized lifting](#polarized-lifting-extensions), AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation), TauCetiRoadmap.Chebotarev, Layer 10, PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons, AutomorphicGaloisRepresentationsPartII, Layer AG2.2, AutomorphicGaloisRepresentationsPartII, Layer AG2.5, PotentialAutomorphyInfrastructure, Layer PA.2, PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one), PotentialModularityAndCompatibleSystems, Layer R24.5:operations, [polarized lifting](#polarized-lifting-extensions), PotentialModularityAndCompatibleSystems, Layer R23.1, TauCetiRoadmap.ModularCurves, Layer 5, TauCetiRoadmap.ModularCurves, Layer 10, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), LocalGaloisDeformationRings §6.8, connects, [potential diagonalizability](#potential-diagonalizability), GlobalGaloisDeformations, Layer G7 (polarized representability), PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons, PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons, PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons, [potential diagonalizability](#potential-diagonalizability) (pd criteria), PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda), PotentialModularityAndCompatibleSystems, Layer R24.5 (weakly compatible system rank n), PotentialModularityAndCompatibleSystems, Layer R24.5 (compatible system predicates), PotentialModularityAndCompatibleSystems, Layer R24.5 (constituents essentially self dual), Layer 0, [polarized lifting](#polarized-lifting-extensions), PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions), PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring), AutomorphicLFunctionsAndLocalFactors, Layer AL.2, `Matrix.trace`, AutomorphicLFunctionsAndLocalFactors, Layer AL.3, PotentialModularityAndCompatibleSystems, Layer R24.5 (linear algebra operations on systems), PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting).

## Layer 3: classical-group packets and symplectic descent

<a id="theta-and-metaplectic-descent"></a>
### 3.1 Oscillator representations and local Howe duality

Let F be a nonarchimedean local field of characteristic different from two, E=F or a quadratic extension, W a nondegenerate (−ε)-Hermitian E-space and V a nondegenerate ε-Hermitian E-space. Construct the symplectic tensor space, its Heisenberg group, Stone–von Neumann representation for a specified nontrivial additive character ψ, the metaplectic cover and the resulting Weil representation ω_ψ of the isometry dual pair. Include the splitting characters when the construction requires them. When an odd-dimensional orthogonal factor occurs, retain the metaplectic double cover of the symplectic factor; its representations are genuine. For irreducible admissible π define the big lift by the maximal π-isotypic quotient `ω_ψ↠π⊠Θ_ψ(π)` and the small lift as its maximal semisimple quotient θ_ψ(π).

The full Howe theorem is: θ_ψ(π) is zero or irreducible and `dim Hom(θ_ψ(π),θ_ψ(π′))≤δ_{π,π′}`. It holds in arbitrary residue characteristic, including two. It does not assert that every lift is nonzero or that the big lift is always irreducible. The split quadratic-algebra GL dual-pair case is treated separately by the source's cited Minguez theorem; quaternionic pairs require the Hermitian/unitary restriction in Gan–Takeda Theorem 1.3 and are not included in the unrestricted theorem.

**API.**

- `HeisenbergGroup / oscillatorRepresentation / metaplecticCover` construct the Heisenberg extension, its Stone–von Neumann representation and the genuine symplectic cover action.
- `WeilRepresentation / bigThetaLift / smallThetaLift` restrict to the specified dual pair and form the maximal isotypic quotient and its maximal semisimple quotient.
- `smallTheta_zero_or_irreducible / smallTheta_injective_on_nonzero` give full Howe duality with the stated zero-lift and local-field qualifications.
- `genuine_centralSign / globalThetaKernel` pin the central sign and construct the global theta kernel using the rational splitting in the stated convergence regimes.
- `realFockModel / pluriharmonicType / gaussianIntertwiner` construct the harmonic multiplicity module, retain the O(k) extension and compare its highest K-type with the Schrödinger model; `realCompactTheta_decomposition` is the Hilbert direct-sum identity below.
- `similitudeWeilAction / similitudeOscillator / theta_restrict_isometries` construct the R₀ action, its compact induction and restriction comparison, with the specified central character; `realPositiveSimilitudeExtension / realFullSimilitudeInduction` retain the positive-multiplier subgroup and its index-two induction.

For the real compact pair O(k)×Mp₂ₙ(ℝ), k,n≥1, construct the Schrödinger model on L²(Mₙ,ₖ(ℝ)) and its polynomial Fock module. Fix Kashiwara–Vergne's additive character and positive-root convention. Put H=⋂ᵢⱼ ker(Σᵥ ∂²/∂xᵢᵥ∂xⱼᵥ). For an irreducible O(k)-module τ, let H(τ) be the τ-equivariant vector-valued pluriharmonic polynomials, and let t(τ) be their GLₙ-module under left inverse translation. The nonzero H(τ) are irreducible, and τ↦t(τ) is injective. Construct t(τ) from the highest-weight minors in KV II.6.6/6.11: ordinary minors give one O(k) extension, the complementary minors give its determinant twist; II.6.7/6.12 impose their rank bounds. This retains the O(k), rather than SO(k), character. The Gaussian Fourier–Laplace transform of II.4.2 identifies the τ-isotypic multiplicity space with the irreducible highest-weight module of highest K-type t(τ)⊗det^(−k/2). Thus L²(Mₙ,ₖ) is the Hilbert direct sum of τ⊠Lₖ(τ), with multiplicity one as a pair and multiplicity dim τ on restriction to Mp₂ₙ. In the contragredient lowest-weight convention, the trivial τ has lowest U(n)-type (k/2,…,k/2). Retain the double cover when k is odd. Prove the comparison by the Gaussian integral intertwining the three symplectic generators (KV II.4.4–4.5), harmonic generation and injectivity (II.5.3–5.12), then the highest-weight decomposition (II.7.2, pp.27–28). Howe's polynomial proof gives the more general real small-lift uniqueness: joint harmonics generate, their lowest degrees determine corresponding compact types, and the mutual-commutant argument rules out two irreducible quotients (Howe Theorem 2.1, §§2–5, pp.537–550).

For the nonarchimedean orthogonal–symplectic similitude construction with dim V=k even and dim W=2n, use Gan–Takeda's normalization. Set GSp(W)⁺={g:λ_W(g)∈λ_V(GO(V))}, R=GO(V)×GSp(W)⁺ and R₀={(h,g):λ_V(h)λ_W(g)=1}. In a fixed polarization put g₁=g·diag(λ_W(g)⁻¹Iₙ,Iₙ). Extend the isometry Weil action by
`ω(h,g)φ=|λ_V(h)|^(−kn/4) ω(1,g₁)(φ∘h⁻¹)`
and form Ω=c-Ind_R₀^R ω. In particular (t·I_V,t⁻¹·I_W) acts by χ_V(t)^n; the similitude lift has central character χ_V^n·ω_π. The quotient R/R₀ is not generally finite, so compact induction is part of the construction. Establish the formula using the conjugation identity and the normalized change of variables; Roberts Proposition 3.3–3.5, pp.303–304, compares the equal-multiplier convention with induction, while Gan–Takeda §2, pp.1847–1849, fixes the inverse-multiplier convention and proves the restriction comparison. Restriction of Θ(π) to the isometry group is the sum of the Θ_ψ(τ) for the constituents τ of π's restriction. Full isometry Howe duality, multiplicity-free restriction and this comparison give the corresponding nonzero small-lift uniqueness. Use Gan–Takeda's later full Howe theorem at residue characteristic two, rather than the odd-residue-characteristic restriction of the older Roberts proof. Do not extend the formula to odd k without the corresponding similitude metaplectic cover.

Construct global theta lifts using the rational splitting and the convergent/cuspidal regimes specified by the subsequent theorems. At a definite real orthogonal place every orthogonal similitude has positive multiplier. Extend the real oscillator representation to the inverse-multiplier subgroup by the same change-of-variables formula, with the positive square root; the real Schwartz/Fock models replace smooth compact induction. On the multiplier-positive symplectic subgroup this preserves the compact theta decomposition. If a representation of full GSp is needed, induce from that index-two subgroup: a negative multiplier exchanges the holomorphic and antiholomorphic constituents. Specify that induction and its central character at each real consumer; nonarchimedean smooth Howe duality alone does not identify real modules.

**Checks.**

- The central kernel element in the genuine oscillator representation acts by −1, not +1. Θ can have a nonzero radical even when θ is irreducible.
- Equal nonzero small lifts force equal irreducible inputs; two zero lifts provide no injectivity conclusion.
- The theorem includes residue characteristic two but excludes local-field characteristic two.
- A quaternionic skew-Hermitian pair is outside its unrestricted scope.
- For n=k=1 the even and odd Hermite polynomials give the two O(1) characters and lowest Mp₂ weights 1/2 and 3/2. Dropping the cover loses both genuine representations.
- The trivial O(k) type gives the Gaussian with lowest weight (k/2,…,k/2); using SO(k) alone would identify its determinant twist incorrectly. The determinant O(k) type first occurs only when n≥k, through the size-k minor.
- R₀ has inverse multipliers. Inserting equal multipliers in its action fails the symplectic tensor-space condition; the central pair (t,t⁻¹) must have the displayed χ_V(t)^n action.
- At a positive definite real place, λ_V(GO(V))=ℝ₊, so GSp⁺ has index two in GSp. A negative-multiplier element exchanges the two holomorphic signs.

([Gan–Takeda](#ref-howe-duality), §1 Theorem 1.2, pp.1–3; construction conventions §2 and proof §§3–5, pp.4–18, arXiv v3; [Gan–Ichino](#ref-gan-ichino-2018), §2.2, published pp.974–975. [Kashiwara–Vergne](#ref-kashiwara-vergne), Chapter II §§1–7, pp.9–28; [Howe](#ref-howe-real), Theorems 1/1A/2.1 and §§2–5, pp.535–550; [Roberts](#ref-roberts-similitudes), §§2–4, pp.295–310; [Gan–Takeda, GSp₄](#ref-gan-takeda-2011), §2, pp.1846–1849.)

*Needs:* SmoothRepresentationsOfLocalGroups, smooth admissible representations and Jacquet functors; TauCetiRoadmap.ReductiveGroups and OrthogonalSpinGroups, actual isometry groups; Fourier/Haar theory and harmonic analysis from AutomorphicSpectralTheory; [C-AUTOMORPHIC](#contract-c-automorphic). The Heisenberg/oscillator and dual-pair constructions are new here, not an elementary-theta export from an outside-order roadmap.

<a id="weighted-trace-classification-inputs"></a>
### 3.2 Weighted stabilization and local intertwining comparisons

The classifications below are implications from explicitly named `TraceClassificationInputs`: invariant trace formula, smooth matching, TWFL in Mœglin–Waldspurger II.4.4, the twisted weighted stabilization for GL_N⋊θ and even special orthogonal groups required by Arthur Hypothesis 3.2.1, and the appropriate normalized local intertwining identities. The first ordinary ingredients are imported from AS.6 and ET §§4.7,4.10,5.2,6.18. The extra weighted distributions, their transfer and stabilization are owned here. TWFL remains an assumption; it is not a consequence of ordinary matching or of the argument below.

Fix the local or global twisted datum (G̃,ω), measures, transfer factors, Levi spaces and the source's archimedean K-finiteness conditions. Construct the weighted orbital distributions J_M̃^G̃ using the (G,M)-family weight, and their invariant versions I_M̃^G̃ by subtracting the contributions of proper Levi spaces. Construct I_M̃^{G̃,E} by transferring the stable weighted distributions on relevant endoscopic data, with the coefficients i(M̃,M′). Retain the Weyl-group quotients in global sums. A constant term of a function and an endoscopic transfer of a weighted distribution are distinct operations. For each proper M̃ the local target is I_M̃^G̃=I_M̃^{G̃,E}; the global target is the corresponding geometric and discrete spectral stabilization. The induction is on the group and its proper Levi spaces, with the twisted fundamental lemma supplied at the unramified places.

The essential intermediate construction is the cuspidal error map ε_M̃^G̃(f), characterized by the difference of the invariant and endoscopic weighted orbital distributions. Mœglin–Waldspurger X §3.4 uses local Paley–Wiener separation to construct it away from the exceptional elements. Its transfer to a relevant M′ is multiplication of the transferred constant term by a scalar ε(M′,δ). The second key assertion is that the sum of these scalars over the places of a globalized elliptic δ is zero. These are proved without assuming stabilization for all global functions: choose two auxiliary places at which the torus's splitting Galois group is preserved, separate the finitely many possible endoscopic data and their characters there, and choose M̃-cuspidal functions. Proper-Levi geometric induction reduces the difference of the global geometric sides to the trace formula for ε_M̃^G̃(f). Proper-Levi spectral induction and multipliers isolate its infinitesimal and spherical characters. Absolute convergence permits the multiplier limit, and the extra split-center dimension makes the error tend to zero. This gives stabilization for these restricted functions (§§5.9,7.1–7.3), enough for the two auxiliary places to isolate a single local orbital distribution and then its scalar (§§7.4–7.7).

To conclude local vanishing, the local trace formula makes the scalar purely imaginary; in the real-transfer-factor, quadratic-character case conjugation makes it real as well. The remaining cases are reduced by the global zero-sum relation and suitable base changes to this case or to the split-torus character calculation. At a split torus the required character is a coboundary (1−θ)μ after the stated extension, so twisting removes it. This is the content of the conditional argument in §3.5 and its reductions in §§3.6–3.9, rather than an assumption that ε vanishes. Weighted characters are obtained from the geometric result by the θ maps, induction and meromorphic continuation near the unitary central-character locus (§§4.5–4.8); nonrelevant inducing data give zero. This supplies the weighted spectral terms needed in the global splitting formula.

Mœglin–Waldspurger X §8.1, pp.106–108, now proves the discrete spectral identity
`I_disc(ω,f)=Σ_{G′}i(G̃,G′)SI_disc^{G′}(f^{G′})`
for the twisted data of §2, with fixed measures and transfer factors. After fixing V containing V_ram, infinitesimal character ν and spherical Hecke character c^V, its refined form is equality in the Grothendieck group, summing relevant elliptic endoscopic data unramified outside V and all (ν′,c′^V) mapping to (ν,c^V). The proof first kills the exceptional geometric terms on functions with an appropriate zero elliptic component; averaging by adjoint automorphic characters at an added unramified place extends the identity to every test function. Section 8.5, pp.112–113, closes the induction and §8.6 gives geometric stabilization. The globalizations used here prescribe the local torus and endoscopic data and the two auxiliary places; weak approximation and class field theory supply them, as in §7.4 and §9. In §9 the extension of the twisting character is constructed with the hypercohomology of T_sc→(1−θ)T: the connected-torus norm image has compact quotient, and the product formula gives the needed compatibility of local characters before extension. Their existence is a construction target, not extra stabilization data.

A precise proved local extension available for this target is AGIKMS Theorem 1.10.5. For its quasi-split classical groups over a nonarchimedean characteristic-zero field (odd special orthogonal, symplectic, even orthogonal with the stated outer-automorphism conventions, and unitary), assume Hypothesis 1.10.4: endoscopic character identities and Arthur LIR for all tempered parameters of G and all parameters of strictly smaller standard dimension. For co-tempered ψ, construct a multiplicity-free packet with the two endoscopic character identities. If `ψ_M=ψ_t⊕⋯⊕ψ_1⊕ψ_0` on a Levi, with each GL summand irreducible conjugate-self-dual and ψ_M co-tempered, then for each irreducible summand π of normalized induction from π_M,
`⟨ũ,π̃_M⟩R_P(w_u,π̃_M,ψ_M)|_π=⟨s_u,π⟩_ψ·id`.
Retain the normalizer lift ũ and Whittaker/endoscopic normalization; no arbitrary inner-form extension is asserted. Lemma 1.10.2 and Corollary 1.10.7 turn this into Arthur's distribution identity. Theorems 1.8.1 and 1.9.1 separately compare Whittaker normalization and the twisted GL_N Arthur operator.

Construct these operators from the meromorphic unnormalized integrals, normalized by the Artin L- and ε-factors for the adjoint action on the appropriate unipotent Lie algebra. In rank one the square representation is Sym² for odd special orthogonal groups, ∧² for symplectic/even orthogonal groups, and the appropriate signed Asai representation for unitary groups; retain the unitary λ-factor and trace additive character. The local-coefficient comparison reduces generic representations to square-integrable ones by Langlands classification and multiplicativity. Globalize a supercuspidal representation with spherical components at the other finite places, compare the automorphic functional equation with its lower-dimensional GL transfer, and vary the additive character to identify the remaining scalar. The square-integrable case uses the auxiliary-place/division-algebra globalization in Appendix A.4. This establishes the Whittaker normalization of Theorem 1.8.1. On twisted GL, order the segment blocks into a standard module. The normalized compositions descend through its unique Langlands quotient by multiplicity one. Commutativity is first proved for meromorphic families on the tempered locus and then continued. An auxiliary operator can have a pole at the desired specialization: descend the regular composites through the quotient, rather than specializing that singular operator. This is the comparison in §§3.3–3.5 behind Theorem 1.9.1.

For the co-tempered packet, swap the two SL₂ factors of a tempered parameter φ and use Aubert duality on its packet. Construct the Aubert functor by the alternating parabolic induction/Jacquet complex, including its degree sign. Its effect on pairings is not the identity: for an endoscopic decomposition φ=φ⁺⊕φ⁻,
`⟨ŝ,π̂⟩_φ̂=(−1)^{r(φ)−r(φ⁺)−r(φ⁻)}⟨s,π⟩_φ`.
Here r counts the paired conjugate-dual blocks in the semisimplified W_E representation obtained by evaluating the SL₂ factors on the norm diagonal, as in §4.1, pp.80–81. Prove this sign comparison using the compatibility of Aubert duality with endoscopy. For a tempered packet, highest Jacquet derivatives remove paired blocks or shorten its lowest even block; the remaining alternating, gap-free case is supercuspidal. The resulting parity calculation proves Proposition 5.1.2, which gives the two co-tempered endoscopic character relations (§§5.2–5.4).

For the LIR, multiplicativity reduces the normalizer calculation to a maximal parabolic. Aubert duality and tempered LIR show that the two possible constituents have opposite normalizer signs, so it suffices to compute a highly non-tempered constituent. The even orthogonal case also requires comparing the two outer components. Use its multiplicity-one Jacquet constituent to realize the required quotient of a standard module (§6.4); the quotient comparison of §6.5 reduces the scalar to an explicit quotient of Artin factors. In this calculation `γ_A(s,ρ)=ε(s,ρ)L(1+s,ρ)/L(s,ρ)` has the paper's intertwining normalization, and must not be replaced by the functional-equation γ-factor with 1−s and the dual. Pair the opposite nontrivial unramified characters; their contributions cancel. The remaining trivial-character order and sign telescope to the packet pairing (§7.3). Induct on the block data: removing an even repeated block can leave a parameter which is not co-tempered. Use Corollary 4.5.3 and the smaller-packet multiplicity/disjointness in Lemma 7.6.1 in that case; assuming the current-rank classification would be circular. The three induction cases in §§7.4–7.6 complete the scalar calculation, and the opposite-sign argument gives the other constituent. These are proof obligations for the constructed packets and operators, under precisely Hypothesis 1.10.4.

**API.**

- `NormalizedSelfIntertwiner / parameterNormalizerLift` retain the chosen normalizer lift, Whittaker datum, transfer normalization and actual induced representation.
- `endoscopicCharacterIdentity / coTemperedPacket` construct the stated packet and its two endoscopic character relations under Hypothesis 1.10.4.
- `coTempered_localIntertwining` identifies the normalized self-intertwiner on each irreducible induced summand with its actual packet-pairing scalar.
- `weightedStabilizationInputs` names the weighted distributions, matching functions and twisted stabilization statements required by the global multiplicity formulas.
- `weightedOrbitalIntegral / invariantWeightedDistribution / endoscopicWeightedDistribution` construct J, its recursive invariant version I and the stable-transfer sum, including descent and product splitting.
- `weightedErrorMap / weightedErrorScalar / globalizeEllipticDatum` construct the cuspidal error, its scalar transfer and the two-auxiliary-place globalization; `weightedError_zero / weightedSpectralTransfer / refinedDiscreteStabilization` give the local vanishing, weighted-character comparison and (ν,c^V)-refined global identity.
- `AubertComplex / aubertPairingSign` construct the induction/Jacquet complex and its pairing comparison; `standardModuleIntertwiner_descent / highlyNonTemperedSummand` give the quotient and Jacquet-module constructions used by the LIR.

Pairing evaluations refer to the same constructed packet and same inducing representation; an arbitrary operator/pairing with an assumed equality is not a theorem.

**Checks.**

- For the identity Weyl element, the normalized operator and character value are one.
- Changing an unnormalized intertwiner by −1 changes the scalar, so the normalization datum cannot be suppressed.
- The co-tempered packet is constructed by Aubert duality; at this stage its unitarity is not a conclusion (Remark 1.10.6).
- A general inner form or archimedean field is outside this AGIKMS theorem's scope.
- Ordinary unweighted matching does not imply the weighted transfer hypothesis.
- When M̃=G̃ the weight is one and the invariant weighted orbital distribution is the ordinary invariant orbital integral; for a torus there is no proper-Levi subtraction; in positive semisimple rank the recursive subtraction includes the proper-Levi terms and their Weyl coefficients. These test both the weight and the invariantization.
- The error map has zero proper constant terms; at an unramified fundamental-lemma place its scalar is zero; its global sum is zero for the prescribed elliptic datum. An arbitrary function with matching ordinary orbital integrals need not satisfy any of these three properties.
- Refined spectral stabilization retains the infinitesimal character and the unramified Hecke character, sums only preimages of both, and has zero contribution from nonrelevant endoscopic data. Omitting either refinement or including a nonrelevant term fails these checks.
- Aubert duality exchanges a GL₂ Steinberg representation and its one-dimensional dual, exchanges the two SL₂ factors of a tempered parameter, and changes a block-generator pairing by −(−1)^m for an odd block occurring among m blocks of the same Weil type (by +1 for an even block). A sign-free permutation of packet labels fails the last test.
- A standard-module comparison descends to its multiplicity-one Langlands quotient; for a highly non-tempered summand its chosen Jacquet constituent occurs once; a meromorphic auxiliary operator with a pole cannot be evaluated merely because the descended composite is regular. These distinguish the quotient construction from a formal cancellation of singular operators.
- In the Artin-factor calculation a nontrivial unramified character and its inverse cancel, the trivial character contributes its actual pole order, and an even repeated block invokes the smaller non-co-tempered packet. Treating all three cases as the almost-supercuspidal initial case gives the wrong sign.

([AGIKMS](#ref-agikms-2024), Theorems 1.8.1 p.27 and 1.9.1 p.28; Lemma 1.10.2, Hypothesis 1.10.4 and Theorem 1.10.5, pp.31–33; operator comparisons §§2–3, pp.33–78; sign Corollaries 4.4.5 and 4.5.3, pp.91–96; packet and LIR proofs §§5–7, pp.97–137; Appendix A.2/A.4, pp.139–145, arXiv v3. [Mœglin–Waldspurger X](#ref-mw-spectral), local error and vanishing §§3.2–3.9, pp.12–37, weighted characters §§4.5–4.8, pp.61–66, spectral reduction §5.9 p.81, restricted stabilization and globalization §§7.1–7.7 pp.89–105, final stabilization §§8.1,8.5–8.6 pp.106–108,112–113; [Arthur](#ref-arthur-2013), Hypothesis 3.2.1 p.137.)

*Needs:* AutomorphicSpectralTheory AS.6; EndoscopicTransferAndUnitaryTraceComparison §§4.7,4.10,5.2,6.18 and its actual tempered packet/transfer exports; SmoothRepresentationsOfLocalGroups, normalized induction and Jacquet modules; [TWFL](#arthur-dependency-gate), as a hypothesis. The additional inner-form/archimedean comparisons needed by a particular classification must accompany that classification; this local theorem supplies neither by itself.

<a id="langlands-shahidi-analytic-inputs"></a>
### 3.3 Twisted square factors on the unitary boundary

Let F be a number field, m≥1, π a unitary cuspidal representation of GL_m(𝔸_F), χ a unitary Hecke character and S contain all archimedean and ramified places. Construct the meromorphic continuation of the incomplete factors L^S(s,π,Sym²⊗χ) and L^S(s,π,∧²⊗χ), and compare their unramified factors with AL §4. They have no zeros on Re(s)=1 (poles are permitted). This is Shahidi Theorem 1.1 for arbitrary m and χ, including a quadratic χ which need not have a Hecke-character square root. Boundary nonvanishing means the order is nonpositive, and does not assert that the value is finite.

For m=2n and π≅π∨⊗χ⁻¹, the Rankin–Selberg factorization
`L^S(s,π×π⊗χ)=L^S(s,π,Sym²⊗χ)L^S(s,π,∧²⊗χ)`
and its simple pole at s=1 imply that exactly one square factor has a simple pole there and the other is holomorphic and nonzero there. Indeed their meromorphic orders a,b are nonpositive by boundary nonvanishing and satisfy a+b=−1, forcing {a,b}={−1,0}. A separate upper bound on pole orders is unnecessary for this deduction. For m=4, BCGP Proposition 8.3.2 gives the application on p.247.

For continuation use Belt Theorems 5.2 and 6.2: the global Jacquet–Shalika integral is meromorphic by its Eisenstein series, and factors into the partial exterior-square product and finitely many local integrals. Theorem 2.2 supplies local meromorphic integrals nonzero at a chosen point, with poles allowed at archimedean places; the finite product is not identically zero. Dividing gives the continuation. In odd rank the global integral is entire and the local choices give an entire exterior-square product. In rank one that product is 1. Define the symmetric continuation by dividing the Rankin–Selberg continuation by this exterior continuation; equality with its Euler product on the initial half-plane makes it canonical. This argument supplies meromorphic continuation, without asserting that a quotient is holomorphic at zeros of its denominator. Shahidi’s boundary nonvanishing then applies to those same factors.

**API.**

- `twistedSquareContinuation / twistedSquare_boundary_nonzero` continue the same twisted square Euler factors and give the stated nonvanishing on Re(s)=1, allowing their prescribed poles.
- `localCoefficient_changeCharacter` transports the local-coefficient normalization under change of additive character.
- `square_rankinSelberg_factorization / square_poleOrder_atOne` identify the tensor product with the two square factors and deduce the pole dichotomy from the additive order formula and boundary nonvanishing.

Meromorphic functions are identified by continuation of the same Euler product. The missing analytic proofs cannot be replaced by records containing arbitrary functions.

**Checks.**

- The empty exterior square of a rank-one character has factor 1.
- For a GL₂ parameter diag(α,β), the exterior factor is `(1−αβχ(ϖ)q⁻ˢ)⁻¹`, while the symmetric factor has the three roots α²,αβ,β².
- A simple pole at s=1 satisfies boundary nonvanishing and fails holomorphy.
- Nonpositive integral orders summing to −1 must be (−1,0) or (0,−1); orders (−2,1) would require a zero and fail boundary nonvanishing.
- A nonsquare quadratic χ must not be silently rewritten as a twist π⊗χ₀.

([Shahidi 1997](#ref-shahidi-1997), Theorem 1.1 p.312, even-rank proof §2 pp.313–317, odd-rank reduction §3 pp.317–320 and the completed functional equation Theorem 4.1 p.321; [Belt](#ref-belt-square), Theorem 2.2 p.5, proofs pp.30–32 and 36–37; Theorem 5.2 and proof pp.41–42, Theorem 6.2 p.45; [BCGP](#ref-bcgp-2021), proof of Proposition 8.3.2 p.247.)

*Needs:* AutomorphicLFunctionsAndLocalFactors §4, unramified L-group factors, and §3, Rankin–Selberg continuation/poles; SmoothRepresentationsOfLocalGroups, normalized induction and meromorphic intertwiners; AutomorphicSpectralTheory, Eisenstein-series functional equations. The integral continuation comparison is owned here; AL §4 supplies its unramified Euler factors.

<a id="self-dual-cuspidal-type"></a>
### 3.4 Symplectic and orthogonal type of a self-dual cuspidal representation

Let π be a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨, and S a finite set of places containing the archimedean places and those where π ramifies. π is of symplectic type if the partial exterior-square L-function L^S(s, π, ∧²) has a pole at s = 1, and of orthogonal type if L^S(s, π, Sym²) has a pole at s = 1. Exactly one of the two holds: L^S(s, π × π) = L^S(s, π, Sym²)·L^S(s, π, ∧²) has a simple pole at s = 1 because π ≅ π^∨, and neither factor vanishes at s = 1. Symplectic type forces N even and ω_π = 1. Arthur's Theorem 1.5.3 identifies the type with the dual group from which π is a twisted-endoscopic transfer: symplectic type exactly when π comes from a generic parameter of split SO_{N+1} (Ĝ = Sp_N(ℂ)), orthogonal type exactly when π comes from Sp_{N−1} (N odd) or from the quasi-split SO_N attached to ω_π (N even).

F a number field; π a unitary cuspidal automorphic representation of GL_N(𝔸_F) with π ≅ π^∨. The type does not depend on S: the local factors at finitely many places are holomorphic and non-zero at s = 1.

The interface should expose the following operations and comparisons.

- `TauCeti.Arthur.IsSymplecticType`: π is of symplectic type: L^S(s, π, ∧²) has a pole at s = 1.
- `TauCeti.Arthur.IsOrthogonalType`: π is of orthogonal type: L^S(s, π, Sym²) has a pole at s = 1.
- `TauCeti.Arthur.selfDual_type_dichotomy`: For π ≅ π^∨ cuspidal unitary: exactly one of IsSymplecticType π and IsOrthogonalType π holds.
- `TauCeti.Arthur.IsSymplecticType.even`: IsSymplecticType π implies N is even.
- `TauCeti.Arthur.IsSymplecticType.centralCharacter_eq_one`: IsSymplecticType π implies ω_π = 1.
- `TauCeti.Arthur.IsSymplecticType.independent_of_S`: The pole at s = 1 does not depend on the finite set S.
- `TauCeti.Arthur.selfDualType_iff_transfer`: Arthur Theorem 1.5.3: IsSymplecticType π iff π is the transfer of a simple generic parameter of split SO_{N+1}.

Factorisation L^S(s, π × π^∨) = L^S(s, π, Sym²) L^S(s, π, ∧²) of unramified Euler factors, from Sym²V ⊕ ∧²V = V ⊗ V. Jacquet–Shalika: L^S(s, π × π^∨) has a simple pole at s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3). Shahidi: L^S(s, π, Sym²) and L^S(s, π, ∧²) are non-zero at s = 1 and have at most simple poles there (Langlands–Shahidi method), so exactly one of them has the pole. Arthur, Theorem 1.5.3: the pole determines the twisted-endoscopic group G with π = ψ for a simple generic ψ ∈ Ψ_2(G).

**Checks.**

- N = 1: a Hecke character χ with χ² = 1 is of orthogonal type (L^S(s, χ²) = ζ_F^S(s) has a pole; ∧² of a line is 0).
- N = 2: a cuspidal π with ω_π = 1 is of symplectic type, since ∧²π = ω_π and L^S(s, ω_π) = ζ_F^S(s).
- The unitary cuspidal π_E of GL₂(𝔸_ℚ) attached to an elliptic curve E/ℚ (with or without CM) is of symplectic type.
- A Hecke character χ of order 3 is not self-dual, and neither L^S(s, χ²) nor L^S(s, ∧²χ) = 1 has a pole.

The type of a quadratic Hecke character (N = 1) is orthogonal; that of a cuspidal GL₂ representation with trivial central character is symplectic; a non-self-dual π has no type.

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, Theorem 1.5.3 and the paragraph before it, pp. 47–48 (2011 manuscript).)

*Needs:* [twisted square continuation and boundary nonvanishing](#langlands-shahidi-analytic-inputs); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gan-takeda-llc-gsp4"></a>
### 3.5 The local Langlands correspondence for GSp₄ (Gan–Takeda)

Let K be a non-archimedean local field of characteristic 0. There is a surjective finite-to-one map rec_GT : π ↦ φ_π from irreducible smooth complex representations of GSp₄(K) to GSp₄(ℂ)-conjugacy classes of L-parameters WD_K → GSp₄(ℂ) such that: (i) π is essentially discrete series iff φ_π does not factor through a proper Levi subgroup; (ii) the fibre (L-packet) L_φ is parametrised by the characters of A_φ = π₀(Z(Im φ)/Z_{GSp₄}), which is trivial or ℤ/2ℤ, and when A_φ = ℤ/2ℤ exactly one member, the one indexed by the trivial character, is generic; (iii) the similitude character of φ_π is ω_π; (iv) φ_{π ⊗ (χ ∘ ν)} = φ_π ⊗ χ; (v) for π generic or non-supercuspidal and every irreducible σ of GL_r(K), the γ-, L- and ε-factors of π × σ (Shahidi) equal those of φ_π ⊗ φ_σ; (vi) the analogous identity of Plancherel measures for non-generic supercuspidal π; (vii) L_φ contains a generic representation iff the adjoint L-factor L(s, ad ∘ φ) is holomorphic at s = 1; (viii) the map is uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. BCGP normalise it so that rec_GT(π ⊗ (χ ∘ ν)) = rec_GT(π) ⊗ rec(χ) and ν ∘ rec_GT(π) = rec(ω_π), and the Roberts–Schmidt parameters of constituents of unramified principal series agree with it (Gan–Takeda 2011b, Proposition 13.1).

K non-archimedean of characteristic 0 (BCGP use K/ℚ_l finite); complex coefficients (BCGP transport to Q̄_p through ı, [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet)).

State the resulting comparison as `TauCeti.Arthur.recGT`.

Gan–Takeda construct rec_GT through the theta correspondences for (GSp₄, GO(V)) with dim V = 4, 6 and the LLC for GL₂, GL₄ (Harris–Taylor, Henniart) and for the inner forms, and prove the properties by computing γ-factors. Unramified principal series: comparison with Roberts–Schmidt's tables (Gan–Takeda 2011b, Proposition 13.1); BCGP Proposition 2.4.6 records the consequences (Sally–Tadić irreducibility criterion and rec_GT of constituents).

Check BCGP Proposition 2.4.6: χ₁ × χ₂ ⋊ σ is irreducible iff none of χ₁, χ₂, χ₁χ₂^{±1} is |·|^{±1}, and rec_GT(π)^{ss} = σ ⊗ (χ₁χ₂ ⊕ χ₁ ⊕ χ₂ ⊕ 1) (characters through Art_K^{−1}) for every constituent π.

([BCGP, potential modularity](#ref-bcgp-2021), §2.3, p. 18 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 2.4.22, §2.4.21, p. 25 (arXiv v3); [The local Langlands conjecture for GSp(4)](#ref-gan-takeda-2011), Main Theorem, parts (i)–(vii), pp. 1842–1843; discussion following it, p. 1843.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; GL2AutomorphicRepresentationsAndTransfer, Layer R16.3; [theta and metaplectic descent](#theta-and-metaplectic-descent); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="orthogonal-sign-kernel"></a>
### 3.6 The determinant constraint on sign vectors

For a finite index set I and dimensions d_i∈ℕ define the additive subgroup of (ℤ/2)^I by Σ_i(d_i mod 2)s_i=0. Under s_i↦(−1)^{s_i} this is ∏_i sign_i^{d_i}=1, the determinant-one constraint on orthogonal summands. It is the pre-central-quotient sign group, not the whole Arthur component group. A single odd-dimensional summand gives the trivial group; all even dimensions impose no condition.

The interface should expose the following operations and comparisons.

- `TauCeti.Arthur.orthogonalSignKernel`: The actual additive subgroup cut out by the weighted mod-two sum.
- `TauCeti.Arthur.orthogonalSignKernel_mem_iff`: Membership is exactly the weighted sum being zero.
- `TauCeti.Arthur.orthogonalSignKernel_even`: If every d_i is even the subgroup is the full function group.
- `TauCeti.Arthur.orthogonalSignKernel_one_odd`: For I a singleton and d odd the subgroup is zero.

Take the kernel of the weighted-sum additive homomorphism (ℤ/2)^I→ℤ/2. Additivity proves closure under addition and negation. Reduce every dimension modulo two to obtain the even-block and singleton comparisons.

**Checks.**

- For one dimension-three summand the kernel is zero.
- The empty index set has the full (already trivial) sign group.
- For two odd-dimensional summands membership is s₀=s₁.
- For dimensions (1,2), membership is exactly s₀=0; the even block’s sign remains free.

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.4, (1.4.8)–(1.4.9), p. 35, 2011 manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="gsp4-galois-l-packet"></a>
### 3.7 The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)

Fix for every prime p an isomorphism ı : ℂ ≅ Q̄_p (it fixes square roots in Q̄_p of the positive rationals, the images of the positive real ones). Let K/ℚ_l be finite and ρ : G_K → GSp₄(Q̄_p) continuous with p ≠ l. L(ρ) is the set of isomorphism classes of irreducible smooth Q̄_p-representations π of GSp₄(K) with rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}, where rec_{GT,p} is Gan–Takeda's correspondence ([The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4) is its owner; it is registered here only through its use) conjugated by ı. For a Weil–Deligne representation (r, N), n((r, N)) is the rank of N; for π irreducible admissible of GL_n(K) (resp. GSp₄(K)), n(π) := n(rec(π)) (resp. n(rec_GT(π))). Boxer–Calegari–Gee–Pilloni use the ı-independence of L(ρ) only for unramified representations and for the rank of the monodromy of representations with Iwahori-fixed vectors.

K/ℚ_l finite, p ≠ l; ı fixed; the twist |ν|^{−3/2} uses the square root of the residue cardinality q of K fixed by ı.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.GSp4.lPacketOf`: L(ρ) as a set of irreducible smooth Q̄_p-representations.
- `TauCeti.LanglandsRegister.GSp4.mem_lPacketOf`: π ∈ L(ρ) ↔ rec_{GT,p}(π ⊗ |ν|^{−3/2}) ≅ WD(ρ)^{F-ss}.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_twist`: L(ρ ⊗ χ) = L(ρ) ⊗ (χ ∘ Art ∘ ν) for a character χ.
- `TauCeti.LanglandsRegister.GSp4.lPacketOf_nonempty`: L(ρ) is non-empty and has 1 or 2 elements.
- `TauCeti.LanglandsRegister.monodromyRank`: n(π), the rank of the monodromy of rec(π) or rec_GT(π).

Transport rec_GT to Q̄_p-coefficients through ı. Independence of ı in the two cases used: unramified representations (Satake parameters are algebraic) and the rank of N for Iwahori-spherical representations (explicit from Roberts–Schmidt's tables).

**Checks.**

- For ρ unramified with ρ(Frob) of eigenvalues q^{3/2}·(α₁, α₂, α₃, α₄) (q the residue cardinality of K), L(ρ) is the unramified constituent of the principal series with Satake parameters (α_i).
- For π unramified, n(π) = 0.
- For the Steinberg representation of GSp₄(K), n(π) = 3 (N regular nilpotent in GSp₄(ℂ)).
- For a tempered parameter with A_φ = ℤ/2ℤ, L(ρ) has two elements, exactly one of them generic: L(ρ) is not a singleton.

Check the twist on unramified principal series: for π = χ₁ × χ₂ ⋊ σ unramified, L(ρ) ∋ π iff ρ(Frob) has eigenvalues the Satake parameters shifted by q^{3/2}, where q is the residue cardinality of K. For residue cardinality q = 9 and coefficient prime p = 5 the scalar is 27, independently of p; using 5^{3/2} fails this comparison.

([BCGP, potential modularity](#ref-bcgp-2021), Definition 2.3.1, §2.3 PDF p.19; [BCGP, potential modularity](#ref-bcgp-2021), Remark 2.3.2, §2.3, p. 19 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), §2.3, after Remark 2.3.3, p. 19 (arXiv v3).)

*Needs:* TauCetiRoadmap.ClassFieldTheory, Layer 7; GL2AutomorphicRepresentationsAndTransfer, Layer R16.3; [Assertions with explicit hypotheses](#endpoint-status-register); [The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4); [C-GALOIS](#contract-c-galois).

<a id="global-arthur-parameter"></a>
### 3.8 Discrete global Arthur parameters of a quasi-split classical group

A discrete global Arthur parameter for G is a formal unordered sum ψ = μ₁ ⊠ ν_{b₁} ⊞ ⋯ ⊞ μ_r ⊠ ν_{b_r}, where μ_i is a unitary cuspidal automorphic representation of GL_{m_i}(𝔸_F) with μ_i ≅ μ_i^∨, ν_b is the b-dimensional irreducible representation of SL₂(ℂ), Σ m_i b_i = N, the pairs (μ_i, b_i) are pairwise distinct, every summand μ_i ⊠ ν_{b_i} has the parity of Ĝ (for Ĝ symplectic: μ_i of symplectic type with b_i odd or of orthogonal type with b_i even; for Ĝ orthogonal: μ_i of orthogonal type with b_i odd or of symplectic type with b_i even), and ∏_i ω_{μ_i}^{b_i} = η_G. Ψ_2(G) denotes the set of these (for G = SO_{2n} taken up to the outer automorphism, Ψ̃_2(G)). ψ is generic when every b_i = 1. Its global component group S_ψ is the sign group on the summands, restricted by ∏_i s_i^{m_i b_i}=1 when Ĝ is special orthogonal, then quotiented by the image of Z(Ĝ)^Γ; the determinant-one constraint can remove a generator before the central quotient, and Arthur attaches a sign character ε_ψ through the adjoint decomposition in (1.5.6): on the symplectic constituents with root number −1 it multiplies the corresponding determinant characters of S_ψ. At each place v, ψ localises to ψ_v : L_{F_v} × SL₂(ℂ) → ^LG through the local Langlands correspondence for the GL_{m_i}.

F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively).

The interface should expose the following operations and comparisons.

- `TauCeti.Arthur.GlobalParameter`: The finite multiset of pairs (μ_i, b_i) with the dimension, distinctness, parity and central-character conditions.
- `TauCeti.Arthur.GlobalParameter.IsGeneric`: Every b_i equals 1.
- `TauCeti.Arthur.GlobalParameter.componentGroup`: Sign vectors on summands, with determinant-one kernel for orthogonal Ĝ, modulo Z(Ĝ)^Γ; not an unrestricted (ℤ/2)^r quotient.
- `TauCeti.Arthur.GlobalParameter.signCharacter`: Arthur's character ε_ψ : S_ψ → {±1}.
- `TauCeti.Arthur.GlobalParameter.localize`: ψ_v : L_{F_v} × SL₂(ℂ) → ^LG obtained from rec(μ_{i,v}) ⊗ ν_{b_i}.
- `TauCeti.Arthur.GlobalParameter.toIsobaric`: The isobaric automorphic representation ⊞_i Speh(μ_i, b_i) of GL_N(𝔸_F) attached to ψ.
- `TauCeti.Arthur.GlobalParameter.ofSelfDualCuspidal`: A unitary self-dual cuspidal μ of GL_N(𝔸_F) of the type of Ĝ (with ω_μ = η_G) is a simple generic parameter.
- `TauCeti.Arthur.GlobalParameter.signCharacter_generic_trivial_of_rootNumbers`: If every symplectic root number ε(1/2, μ_i × μ_j) occurring in ε_ψ equals 1 then ε_ψ = 1; in particular ε_ψ = 1 for generic ψ.

The parity condition is the condition that ψ, viewed as an N-dimensional representation of L_F × SL₂(ℂ), preserves a form of the type of Ĝ: ν_b is symplectic for b even and orthogonal for b odd, and types multiply. S_ψ is the group of components of the centraliser of the image of ψ in Ĝ, modulo Z(Ĝ)^Γ; each self-dual irreducible summand of the right type contributes one factor ℤ/2ℤ. Decompose Ad∘ψ into irreducible summands λ_α⊗μ_α⊗ν_α as in (1.5.6), retaining multiplicities. Arthur’s (1.5.7) evaluates ε_ψ at x represented by s as the product of det λ_α(s) over symplectic μ_α with ε(1/2,μ_α)=−1. Pairwise Rankin–Selberg factors must carry their SL₂ multiplicities; an unweighted product over pairs is not the character. For generic ψ the character is trivial.

**Checks.**

- For G=SO₃≅PGL₂ (dual Sp₂), ψ=1⊠ν₂ is discrete and S_ψ=1. Identifying its automorphic packet is a separate classification application, not this definition test.
- For G=SO₃, a unitary cuspidal μ on GL₂ gives the simple generic parameter μ⊠ν₁ iff ω_μ=1, with self-duality and exterior-square/Hecke comparison supplied.
- N = 0 (G = SO₁, the trivial group): Ψ_2(G) consists of the empty sum only.
- μ ⊠ ν₁ ⊞ μ ⊠ ν₁ (a repeated summand) is not a discrete parameter: discrete parameters are multiplicity free.
- For G = SO₃, the summand χ ⊠ ν₁ ⊞ χ′ ⊠ ν₁ of two quadratic characters is not in Ψ_2(SO₃): each χ ⊠ ν₁ is orthogonal while Ĝ = SL₂ = Sp₂ is symplectic.
- For dual Ĝ=SO₃ and a single dimension-3 orthogonal cuspidal summand with b=1, the determinant-one sign condition forces s=+1 and S_ψ is trivial; the unrestricted sign-group formula would give ℤ/2.

For G = SO₃ ≅ PGL₂ (N = 2) the parameter 1 ⊠ ν₂ is discrete and its packet is the trivial representation; a generic μ ∈ Ψ_2(SO₃) is exactly a cuspidal GL₂ representation with trivial central character.

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.4, (1.4.3)–(1.4.9), pp. 30–35; §1.5, (1.5.6)–(1.5.7), pp. 46–47 (2011 manuscript); [Endoscopic classification of representations of quasi-split unitary groups](#ref-mok-2015), §2.3, p. 15 (arXiv v5).)

*Needs:* [Symplectic and orthogonal type of a self-dual cuspidal representation](#self-dual-cuspidal-type); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [C-ARTHUR](#contract-c-arthur).

<a id="gsp4-discrete-spectrum-types"></a>
### 3.9 Discrete automorphic representations of GSp₄: symplectic type, general type and transfer

An automorphic representation π of GSp₄(𝔸_F) is discrete if it occurs in the discrete spectrum of L² automorphic forms with central character ω_π (every cuspidal one is). A cuspidal Π of GL₄(𝔸_F) is of symplectic type with multiplier χ if L^S(s, Π, ∧² ⊗ χ^{−1}) has a pole at s = 1 for some (equivalently every) finite S; then Π ≅ Π^∨ ⊗ χ. A discrete π is of general type if there is a cuspidal Π of GL₄(𝔸_F) of symplectic type with multiplier ω_π such that, for every place v, the L-parameter of π_v (rec_GT(π_v) at finite v, the archimedean Langlands parameter at infinite v) composed with GSp₄(ℂ) ⊂ GL₄(ℂ) is rec(Π_v); Π is then the transfer of π. Arthur's classification divides the discrete spectrum into six families (a)–(f), (a) being general type and (b)–(f) the Yoshida, Soudry, Saito–Kurokawa, Howe–Piatetski-Shapiro and one-dimensional types (Gee–Taïbi Remark 6.1.4 list S_ψ = 1, ℤ/2ℤ, 1, ℤ/2ℤ, ℤ/2ℤ, 1 respectively, with ε_ψ non-trivial only in the Saito–Kurokawa case with ε(1/2, π ⊗ η^{−1}) = −1).

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π.

The interface should expose the following operations and comparisons.

- `TauCeti.Arthur.GSp4.IsDiscrete`: π occurs in L²_disc(GSp₄(F)\GSp₄(𝔸_F), ω_π).
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith`: Π cuspidal on GL₄ with L^S(s, Π, ∧² ⊗ χ^{−1}) having a pole at s = 1.
- `TauCeti.Arthur.GSp4.IsGeneralType`: π has a cuspidal transfer Π of symplectic type with multiplier ω_π.
- `TauCeti.Arthur.GSp4.transfer`: The transfer Π of a general-type π (unique by strong multiplicity one).
- `TauCeti.Arthur.GSp4.IsSymplecticTypeWith.selfDual`: IsSymplecticTypeWith Π χ ⇒ Π ≅ Π^∨ ⊗ χ.
- `TauCeti.Arthur.GSp4.ArthurType`: The six types (a)–(f) of a discrete π.
- `TauCeti.Arthur.GSp4.isGeneralType_iff_typeA`: IsGeneralType π ↔ ArthurType π = (a).

The six types are read off from the transfer π̃ of π to GL₄ under Arthur's classification: (a) π̃ cuspidal and χ_π-self-dual; (b) μ₁ ⊞ μ₂ with μ_i distinct cuspidal on GL₂ with central characters χ_π; (c) μ|·|^{1/2} ⊞ μ|·|^{−1/2} with μ cuspidal of orthogonal type; (d) λ|·|^{1/2} ⊞ λ|·|^{−1/2} ⊞ μ with χ_μ = λ² = χ_π; (e), (f) isobaric sums of Hecke characters. At archimedean places BCGP's 'rec_GT(π_v)' is read as the archimedean Langlands parameter.

**Checks.**

- A Yoshida lift (transfer μ₁ ⊞ μ₂ of two distinct weight-2 newforms with equal central characters) is discrete but not of general type.
- The one-dimensional representation χ ∘ ν of GSp₄(𝔸_F) is discrete, of type (f), with transfer χ|·|^{3/2} ⊞ χ|·|^{1/2} ⊞ χ|·|^{−1/2} ⊞ χ|·|^{−3/2}.
- For π cuspidal on GL₂ non-dihedral and non-tetrahedral, Sym³π ([Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube](#kim-shahidi-sym3)) is cuspidal on GL₄ of symplectic type with multiplier ω_π³.
- For GL₂ (the analogue for GSp₂ = GL₂), every cuspidal Π is of symplectic type with multiplier ω_Π, since ∧²Π = ω_Π.

The cuspidal π of a non-endoscopic genus-2 Siegel eigenform of weight (k, j) ≥ (3, 0) is of general type; a Yoshida lift is of type (b).

([BCGP, potential modularity](#ref-bcgp-2021), §2.9, p. 38 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), §2.9, definition of general type, p. 38 (arXiv v3); [Arthur's multiplicity formula for GSp4 and restriction to Sp4](#ref-gee-taibi-2019), Remark 6.1.4, p. 35 (arXiv v1).)

*Needs:* [Symplectic and orthogonal type of a self-dual cuspidal representation](#self-dual-cuspidal-type); [The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4); [AutomorphicLFunctionsAndLocalFactors, archimedean GL_n parameters](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="weight-22-abelian-variety-conjecture"></a>
### 3.10 Conjecture: weight (2,2) Siegel eigenforms come from abelian varieties with real multiplication (conjectural endpoint)

WeightTwoTwoConjecture is the proposition: for every stable general-type cuspidal Siegel modular eigenform of genus 2 and weight (2, 2) over ℚ (in Calegari–Geraghty's normalisation) there are a totally real field E of degree n and an abelian variety M/ℚ of dimension 2n with E ↪ End_ℚ(M) ⊗ ℚ whose λ-adic Galois representations, restricted to the E-eigenspaces, are those of the eigenform. Status: conjectural; Calegari–Geraghty state it as a heuristic (§5.4) suggesting that residual representations of type U₃ at x with σ = (2, 2) admit no minimal lifts, and no proof uses it.

The stable/general-type qualification excludes CAP and endoscopic systems with rank-one constituents. The source is a heuristic, not a theorem; the precise Galois/abelian comparison is this roadmap’s frontier specification.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture`: The proposition stated.
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.dim`: Under the conjecture, dim M = 2[E : ℚ].
- `TauCeti.LanglandsRegister.WeightTwoTwoConjecture.semistable_unipotent`: Under the conjecture, inertia at a semistable prime acts with (σ − 1)² = 0 (Grothendieck), so type U₃ cannot occur.

Definition of the proposition only.

**Checks.**

- A proposed eigenform realization must return an abelian variety of dimension 2[E:ℚ] and four-dimensional E_λ-eigenspaces, rather than a two-dimensional total Tate module.
- n = 1: the statement is that weight (2, 2) eigenforms with rational eigenvalues come from abelian surfaces over ℚ.
- A minimal local lift with a size-three unipotent block, (σ−1)²≠0 persisting after finite extension, cannot be the H¹ of an abelian variety with semistable reduction: Grothendieck’s square-zero inertia condition fails.

Known instance: paramodular forms attached to abelian surfaces over ℚ (BCGP's potential modularity runs the other way, abelian variety ⇒ form).

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), §5.4 'Torsion classes', publ. p. 831; quoted from arXiv v1 §5.4 p. 24 PDF p.31.)

*Needs:* [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet); [Assertions with explicit hypotheses](#endpoint-status-register); [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry).

<a id="regular-weight-serre-implies-abelian-surface-modularity"></a>
### 3.11 A regular-weight Serre conjecture for GSp₄ implies modularity of abelian surfaces over ℚ (BCGP 2025, Lemma 10.4.1)

Suppose that for every prime p and every ρ̄ : G_ℚ → GSp₄(F̄_p) with multiplier ε̄^{−1}, absolutely irreducible, and with (ρ̄|_{G_{ℚ_p}})^{ss} a direct sum of characters, there is an ordinary cuspidal automorphic representation π of GSp₄/ℚ of regular weight, level prime to p and central character |·|² with ρ̄_{π,p} ≅ ρ̄. Then every abelian surface A/ℚ is modular. (Remark 10.4.2: the hypothesis may be weakened, e.g. to p sufficiently large.) This is a conditional endpoint: its hypothesis is a conjecture.

Hypothesis: the regular-weight Serre statement above (status conjectural); the proof also uses Arthur's classification through BCGP's main theorems ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre`.

Choose p with ρ̄_{A,p} absolutely irreducible and ordinary-type at p; the hypothesis gives an ordinary regular-weight π. Move from regular weight to parallel weight 2 by BCGP's Hida-theoretic and modularity lifting theorems, giving modularity of A (the analogue of Khare's deduction of Artin's conjecture from Serre's).

The analogy: [ClassicalSerreModularity §R27.6, rational odd Artin modularity](../ClassicalSerreModularity/README.md) follows from Serre's conjecture.

([BCGP, modularity](#ref-bcgp-2025), Lemma 10.4.1, §10.4, p. 222 (arXiv v1); [BCGP, modularity](#ref-bcgp-2025), Remark 10.4.2, p. 222 (arXiv v1).)

*Needs:* [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="mok-unitary-classification"></a>
### 3.12 Endoscopic classification for quasi-split unitary groups (Mok)

Let E/F be a quadratic extension of number fields and G = U_{E/F}(N) the quasi-split unitary group. Global parameters are formal sums ψ = ⊞_i μ_i ⊠ ν_{b_i} with μ_i conjugate-self-dual unitary cuspidal representations of GL_{m_i}(𝔸_E), Σ m_i b_i = N, pairwise distinct, each μ_i ⊠ ν_{b_i} conjugate-self-dual of sign (−1)^{N−1} (through the standard base change embedding ξ_{χ₊}). Then (local) for every place v there are packets Π_{ψ_v} with characters ⟨·, π_v⟩ of S_{ψ_v} satisfying the endoscopic character identities, and the tempered packets give the local Langlands correspondence for U(N)(F_v); and (global) L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ_2(G, ξ_{χ₊})} ⊕_{π ∈ Π_ψ(ε_ψ)} π, with Π_ψ(ε_ψ) a multiset retaining repetitions; for generic ψ, multiplicity one holds (Mok Remark 2.5.3). No multiplicity-one assertion is made here for every non-generic ψ.

E/F a quadratic extension of number fields; G = U_{E/F}(N) quasi-split; Whittaker datum fixed. Conditional exactly as Arthur's book on which Mok's proof depends ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.mok_multiplicity_formula`.

Mok follows Arthur's method: comparison of the stabilised twisted trace formula of R_{E/F}GL_N ⋊ θ with the stable trace formulas of the unitary groups U(N₁) × U(N₂). Mok Theorem 2.5.2 is a decomposition using global packet multisets; Remark 2.5.3 asserts multiplicity one for generic parameters. Absence of the even-orthogonal outer-automorphism ambiguity does not remove non-generic packet repetitions.

Check the sign convention: for N = 1, U(1) parameters are conjugate-orthogonal characters μ of 𝔸_E^×/E^× (μ|_{𝔸_F^×} = 1), and the multiplicity formula is Hilbert 90 / Pontryagin duality for U(1)(F)\U(1)(𝔸_F).

([Endoscopic classification of representations of quasi-split unitary groups](#ref-mok-2015), §2.5, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35 (arXiv v5).)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-ARTHUR](#contract-c-arthur).

<a id="extended-langlands-parameter"></a>
### 3.13 Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group

Let F be a non-archimedean local field of characteristic 0 and G° a quasi-split classical group over F (symplectic, special orthogonal or unitary). A Langlands parameter is a Ĝ°-conjugacy class of admissible homomorphisms ϱ : W_F × SL₂(ℂ) → ^LG°; its component group S_ϱ = π₀(Cent_{Ĝ°}(ϱ)/Z(Ĝ°)^{Γ_F}) is an elementary abelian 2-group. An extended Langlands parameter is a pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ, and Lang(G°) is the set of extended parameters. The local Langlands correspondence of Arthur and Mok, normalised by a Whittaker datum, is a bijection LL : Irr(G°) → Lang(G°) (for even special orthogonal groups, up to the outer automorphism), under which the L-packet Π_ϱ is the fibre over ϱ.

F non-archimedean of characteristic 0; G° quasi-split classical; a Whittaker datum fixed (it normalises χ_ϱ).

The interface should expose the following operations and comparisons.

- `TauCeti.Arthur.ExtendedParameter`: A pair (ϱ, χ_ϱ) with χ_ϱ a character of S_ϱ.
- `TauCeti.Arthur.ExtendedParameter.parameter`: The underlying Langlands parameter ϱ.
- `TauCeti.Arthur.ExtendedParameter.character`: The character χ_ϱ of S_ϱ.
- `TauCeti.Arthur.componentGroup_elementaryAbelianTwo`: S_ϱ is an elementary abelian 2-group.
- `TauCeti.Arthur.lPacket_equiv_characters`: For G° quasi-split, LL restricts to a bijection Π_ϱ ≃ Ŝ_ϱ.
- `TauCeti.Arthur.ExtendedParameter.generic_iff`: For tempered ϱ, the generic member of Π_ϱ (for the fixed Whittaker datum) is the one with χ_ϱ = 1.

Decompose the parameter into irreducibles. Every good-parity summand with positive multiplicity contributes an O(m_i) centralizer and hence a component, including even m_i. Odd multiplicity governs the image of the central element, not whether that component exists; apply the SO determinant relation and central quotient when appropriate. Use tempered local packets and the Langlands classification, with the exact classical-group enhancement and outer-automorphism conventions.

**Checks.**

- G° = SL₂, p odd, ϱ with image the Klein four-group in SO₃(ℂ): S_ϱ ≅ (ℤ/2ℤ)², so |Π_ϱ| = 4.
- G° = split SO₂ ≅ GL₁: every S_ϱ is trivial and, with even orthogonal groups taken up to the outer automorphism, Lang(G°) ≅ Hom(F^×, ℂ^×)/(χ ∼ χ^{−1}) (local class field theory).
- G° = SL₂: a parameter ϱ : W_F → SO₃(ℂ) ≅ PGL₂(ℂ) lifting to an irreducible dihedral Ind_{W_E}^{W_F} θ with θ/θ^c not quadratic has S_ϱ ≅ ℤ/2ℤ and an L-packet of size 2, not a singleton as for GL₂.
- An unramified tempered ϱ of Sp_{2n} whose standard representation is a sum of distinct characters has S_ϱ = 1 and Π_ϱ is the unramified representation.

For G° = SL₂ = Sp₂, a parameter ϱ : W_F → SO₃(ℂ) with image the Klein four-group has S_ϱ ≅ (ℤ/2ℤ)² and an L-packet of four supercuspidal representations (Labesse–Langlands).

([Endo-parameters for p-adic classical groups](#ref-kss-2021), §1.20, p. 8 (arXiv v3); p. 604 in the version of record.)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; TauCetiRoadmap.ReductiveGroups, Layer 6; [C-ARTHUR](#contract-c-arthur).

<a id="shahidi-exterior-square"></a>
### 3.14 Twisted exterior-square L-functions at s = 1 (Shahidi)

Let Π be unitary cuspidal on GL₄(𝔸_F) (or GL_{2n}) and ω unitary. At s=1, L^S(s,Π,∧²⊗ω) has either a simple pole or a finite nonzero limit; the pole is equivalent to symplectic type with multiplier ω^{−1}. For cyclic prime-degree F′/F with Π′=BC(Π) cuspidal, in the factorization over the unitary quotient characters ψ at most one factor L^S(s,Π,∧²⊗ωψ) has a pole at 1 and the others have nonzero limits there. This assertion is at s=1; it does not assert absence of poles at all other points of Re s=1.

F a number field; Π unitary cuspidal on GL₄ or GL_{2n}; ω unitary; S contains the ramified places. Belt Theorem 5.2 gives meromorphic continuation with at most simple poles for the even-rank partial exterior square, with the norm-character shifts retained; Shahidi Theorem 1.1 gives nonvanishing at 1. The cyclic base-change consequence requires BC(Π) cuspidal. Two different pole-producing twists would give a nontrivial self-twist by a character trivial after base change; this contradicts the assumed cuspidality of BC(Π).

State the resulting comparison as `TauCeti.Arthur.exteriorSquare_nonvanishing`.

Use [twisted square continuation and boundary nonvanishing](#langlands-shahidi-analytic-inputs) at s=1 for unitary cuspidal Π and unitary ω, with the integral continuation comparison proved there. AL.4 supplies the unramified L-group factors. Shahidi 1997 gives boundary nonvanishing in all ranks; BCGP p.247 supplies the GL₄ application. A pole of the exterior square and nonvanishing of the symmetric square force a pole of the Rankin–Selberg product, hence Π≅Π∨⊗ω⁻¹. Apply this to both twists to obtain the self-twist used in the cyclic argument. Pole criterion: definition of symplectic type ([Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types)). Factorisation: base change of unramified local factors.

BCGP Lemma 8.3.2 deduces from this that a GSp₄ representation over F′ whose transfer is a base change descends to F.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Lemma 8.3.2, §8.3, p. 247 (arXiv v3).)

*Needs:* [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="local-arthur-packets"></a>
### 3.15 Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)

Let F be a local field of characteristic 0, G a quasi-split Sp_{2n}, SO_{2n+1} or SO_{2n} over F with a fixed Whittaker datum, and ψ : L_F × SL₂(ℂ) → ^LG a local Arthur parameter whose restriction to L_F is bounded. Then there are a finite multiset Π̃_ψ of irreducible unitary representations of G(F) (for SO_{2n}, orbits under the outer automorphism) and a map π ↦ ⟨·, π⟩ from Π̃_ψ to the characters of S_ψ such that: (a) the distribution f ↦ Σ_{π ∈ Π̃_ψ} ⟨s_ψ, π⟩ f_G(π) is stable and is the transfer of the twisted character of the representation of GL_N(F) ⋊ θ attached to ψ; (b) for every endoscopic datum (G′, s) through which ψ factors as ψ′, f′(ψ′) = Σ_{π ∈ Π̃_ψ} ⟨s_ψ x, π⟩ f_G(π) (the endoscopic character identities); (c) if ψ = φ is trivial on SL₂(ℂ) (a tempered L-parameter) then Π̃_φ is a set of tempered representations, π ↦ ⟨·, π⟩ is injective, and bijective onto Ŝ_φ when F is p-adic; the packets Π̃_φ for φ ∈ Φ̃_bdd(G) are disjoint and exhaust the tempered dual. Part (c) is the local Langlands correspondence for G.

F local of characteristic 0; G quasi-split symplectic or special orthogonal over F with a fixed Whittaker datum. The statement is conditional with hypotheses in [The twisted weighted fundamental lemma](#arthur-dependency-gate): Arthur's proof uses the stabilisation of the twisted trace formula and results he announces in [A24]–[A27].

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.localPacket`.

Arthur's proof (2013, Chapters 2–7) is a long induction comparing the stabilised twisted trace formula of GL_N ⋊ θ with the stable trace formulas of the twisted endoscopic groups G, using the local intertwining relation. The packets are defined by (a) and (b) through the twisted transfer of characters of GL_N (Mœglin–Waldspurger stabilisation; Waldspurger's transfer; the fundamental lemma). Use the conditional classification with the ordinary and twisted stabilization, orbital-integral transfer, weighted fundamental lemma and local intertwining identities specified above, with the same test functions and transfer normalizations.

The identities (a) and (b) are Arthur Theorem 2.2.1, §2.2, pp. 65–66; Theorem 1.5.1 supplies the packet and tempered assertions. The packets of a tempered φ with S_φ = 1 are singletons; for G = SL₂-type groups the packet sizes are |Ŝ_φ| ∈ {1, 2, 4}.

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, Theorem 1.5.1 and the paragraph before it, pp. 41–43 (2011 manuscript; Theorem 1.5.1 on p. 42); [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, after Theorem 1.5.1, pp. 42–43 (2011 manuscript); [Endoscopic classification of representations of quasi-split unitary groups](#ref-mok-2015), §2.5, Theorem 2.5.1 PDF p.32.)

*Needs:* [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [C-ARTHUR](#contract-c-arthur).

<a id="kmsw-inner-forms"></a>
### 3.16 Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)

For an extended pure inner twist Ξ of U_{E/F}(N) and a bounded tempered local parameter φ, KMSW Theorem 1.6.1 gives finite packets with the pairing determined by Ξ and refined endoscopic character identities. At nonarchimedean places the packet maps bijectively to Irr(S_φ^♮,χ_Ξ). At real places this is a bijection only after taking the disjoint union over the specified pure inner forms; a fixed real form need not realize every character. For a global PURE inner twist and a generic discrete parameter ψ, the ψ-part of the discrete spectrum is the sum over Π_ψ(G,Ξ,ε_ψ). For nongeneric ψ or general inner twists, the version printed as Theorem* 1.7.1 uses the two explicitly stated inputs of Chapter 5: the local classification at each ψ_v (Hypothesis 3.6.3) and the local intertwining relation (Theorem* 2.6.2) at every place. Retain these two local inputs as hypotheses in the nongeneric or general-inner-twist scope.

Quadratic extension E/F, fixed Whittaker datum on the quasi-split form and extended pure inner twist Ξ with its associated central character χ_Ξ. Proved global scope in the cited KMSW edition: generic parameter and pure inner twist, together with the specified Mok/Arthur external classification hypothesis. The more general statement is conditional on the actual local classification and local intertwining identities for each localization, with their actual parameter and inner-twist scope.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.kmsw_multiplicity_formula`.

KMSW compare the trace formula of G with the stable trace formulas of the endoscopic groups, using Mok's results for the quasi-split inner form and the theory of extended pure inner twists (Kottwitz's B(G)). The global statement is proved for generic parameters; non-tempered local packets of inner forms are not constructed.

Check the degenerate case: for G quasi-split the statement is Mok's ([Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification)).

([Endoscopic Classification of Representations: Inner Forms of Unitary Groups](#ref-kmsw-2014), §1.6.1, Theorem* 1.6.1 and the sentence before it, p. 80 (arXiv v3); [Endoscopic Classification of Representations: Inner Forms of Unitary Groups](#ref-kmsw-2014), Theorem* 1.6.1(5), pp. 80–81; Theorem* 1.7.1 and discussion, p. 89; Chapter 5 and Theorem 5.0.5, pp. 205–206.)

*Needs:* [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur).

<a id="arthur-multiplicity-formula"></a>
### 3.17 Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)

Let G be as in [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter). Then L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃_2(G)} ⊕_{π ∈ Π̃_ψ(ε_ψ)} m_ψ π, where Π̃_ψ = ⊗'_v Π̃_{ψ_v} is the global packet (π_v unramified with ⟨·, π_v⟩ = 1 for almost all v; the local components ψ_v lie in Ψ̃⁺_unit(G_v), not necessarily bounded since the Ramanujan conjecture is unknown, and their packets are defined from the bounded case by Arthur's (1.5.1)–(1.5.2)), Π̃_ψ(ε_ψ) is the set of π = ⊗π_v ∈ Π̃_ψ whose character ⟨·, π⟩ = ∏_v ⟨·, π_v⟩, restricted to S_ψ, equals ε_ψ, and m_ψ ∈ {1, 2} is Arthur's multiplicity (m_ψ = 2 exactly when N is even, Ĝ = SO(N, ℂ) and every N_i = m_i b_i is even; otherwise m_ψ = 1). In particular every discrete automorphic representation of G has a parameter ψ, its transfer to GL_N(𝔸_F) is the isobaric representation of ψ, and the summands with generic ψ are the discrete representations whose transfer is a sum of distinct self-dual cuspidals.

F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively). Conditional with hypotheses in [The twisted weighted fundamental lemma](#arthur-dependency-gate).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.multiplicity_formula`.

Arthur, Theorem 2.2.1, §2.2, pp. 65–66, supplies the stable transfer and character identities with the distinguished element s_ψ in the pairing. Chapters 3–8 establish the comparison of the stable multiplicity formula with the discrete part of the stabilised trace formula of G and the twisted trace formula of GL_N, by induction on N. The local packets and the pairing ⟨·, π_v⟩ are those of [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets). The global sign ε_ψ arises from the global intertwining operators normalised by Langlands–Shahidi; its computation uses the root numbers of the Rankin–Selberg products.

Recover the trivial representation of PGL₂ = SO₃ from ψ = 1 ⊠ ν₂, and the cuspidal spectrum of PGL₂ from the generic parameters of [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter)'s test so3_generic_iff (multiplicity one for SL₂-packets after restriction is not claimed: SL₂ is not SO₃).

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, Theorem 1.5.2 and (1.5.3)–(1.5.7), pp. 45–48 (2011 manuscript).)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-ARTHUR](#contract-c-arthur).

<a id="vogan-packets-so-v"></a>
### 3.18 Vogan packets for odd special orthogonal groups of all quadratic spaces

Let F be a local field of characteristic 0 and φ : L_F → Sp_{2n}(ℂ) an L-parameter. For each (2n+1)-dimensional quadratic space V over F with trivial discriminant there is a (possibly empty) L-packet Π_φ(SO(V)), and Irr SO(V) = ⊔_φ Π_φ(SO(V)); moreover there is a bijection ⊔_V Π_φ(SO(V)) ↔ Ŝ_φ, σ_η ↔ η, onto the characters of the component group S_φ of the centraliser of Im φ in Sp_{2n}(ℂ), where σ_η is a representation of SO(V) only if η(z_φ) = ε(V) (the normalised Hasse–Witt invariant), with equality of the two conditions for F non-archimedean or F = ℂ. σ ∈ Π_φ(SO(V)) is square-integrable iff φ is multiplicity-free and of good parity, and tempered iff φ is tempered.

F local of characteristic 0; V of odd dimension 2n + 1 with trivial discriminant (SO(V⁺) split, SO(V⁻) its pure inner form). Conditional: the split case is Arthur's ([The twisted weighted fundamental lemma](#arthur-dependency-gate)); the non-split case is Mœglin–Renard's, which assumes Arthur-type results for inner forms (proved for generic parameters by Ishimoto).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.voganPacket_so`.

Split SO(V⁺): [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets) (c) for SO_{2n+1}. Non-split SO(V⁻): Mœglin–Renard, with Ishimoto's local intertwining relation and endoscopic character relations for generic parameters; Gan–Ichino (5.3) record the combined statement. Square-integrability and temperedness criteria follow from the packet construction (Mœglin).

For n = 1: SO(V⁺) ≅ PGL₂ and SO(V⁻) ≅ D^×/F^× for the quaternion division algebra D; the Vogan packet of a discrete parameter φ with S_φ = ℤ/2ℤ is {the discrete series of PGL₂, its Jacquet–Langlands transfer to D^×/F^×}.

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.2, (5.3), p. 17 (arXiv v3); published p. 987; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §1.2, p. 4 (arXiv v3); published p. 969.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="xu-gsp2n-packets"></a>
### 3.19 Xu's packets for general-rank symplectic similitude groups

Let F be a local field of characteristic zero, n≥1, G=Sp_{2n}, and G̃=GSp_{2n}. For a bounded parameter φ of G fix a character ζ̃ of Z_{G̃}(F) extending the central character of Arthur's packet Π_φ. The coarse packet C(φ,ζ̃) consists of tempered irreducible G̃(F)-representations with central character ζ̃ whose restriction to G(F) has constituents in Π_φ. Put X=Hom(G̃(F)/Z_{G̃}(F)G(F),ℂ×). This is the group of similitude characters trivial on central scalars. The dual central-extension boundary gives α:S_φ→X; write S_{φ̃}=ker α. Component groups here use the quotient by the invariant dual center, as in Xu §2.2; an unreduced centralizer is not S_φ.

There is a refined packet Π_{φ̃}⊂C(φ,ζ̃), unique up to X-twist, with disjoint decomposition
`C(φ,ζ̃) = ⨆_{ω∈X/α(S_φ)} Π_{φ̃}⊗ω`.
Restriction identifies a refined packet with Π_φ/G̃(F). Its pairing with S_{φ̃} is obtained by restricting Arthur's character of any constituent of π̃|_G. It is injective, and for nonarchimedean F it is a bijection Π_{φ̃}≃Ŝ_{φ̃}. Do not assert surjectivity onto all characters for one real form. The sum of the packet characters is stable. For endoscopic datum (G′,φ′)→(φ,s), ω=α(s), the transferred stable character equals the sum of the (id,ω)-twisted characters of Π_{φ̃}. Normalize each intertwiner by its restriction to Z_{G̃}(F)G(F), weighted by the Arthur pairing, exactly as Xu (4.3); when ω=1 this gives the usual component-character weighted identity (4.4). Each member's X-self-twist group is α(S_φ).

The symbol φ̃ in this construction labels a refinement up to twist; it does not canonically assign a specific dual-group lift to that refinement. For real F use Langlands' real packets. Extend to Xu's class Φ⁺_unit by normalized parabolic induction from the bounded Levi packet and the specified positive real exponents. This class includes the localizations of generic global parameters used below; no local Ramanujan hypothesis is inserted. The same construction applies to Xu's products of symplectic and quasi-split even orthogonal groups with a common similitude. In the even orthogonal factors retain Σ₀-outer-conjugacy classes and replace the stabilizer by α(S_φ^{Σ₀}); removing these qualifications would strengthen the result.

Assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register) for these groups and their endoscopic and Levi groups.

**API and construction.**

- `xuCoarsePacket / xuTwistGroup / xuBoundary`: construct the fixed-central-character set, the actual quotient-character group, and the dual boundary map; expose `boundary_kernel`, `restriction_orbits` and `selfTwist_iff_boundary`. Changing ζ̃ changes the coarse-packet input.
- `xuPacket` chooses a refinement; `xuPacket_twist_decomposition`, `xuPacket_restrict` and `xuPacket_pairing` give the disjoint union, restriction and component-character comparison. A choice is retained throughout any comparison.
- `xuPacket_stable / xuPacket_twisted_transfer` compare distributions on matching test functions, with the normalized intertwiners and compatible Haar measures, rather than only matching spherical Hecke eigenvalues.
- `xuPacket_parabolic / xuPacket_real / xuPacket_projective` give, respectively, the Φ⁺_unit extension, agreement with the real correspondence, and descent to PGSp_{2n} when ζ̃ is trivial.

Build restriction and self-twists by Clifford theory and the boundary exact sequence (Xu §2.1–2.2, pp.4–14, Lemma 4.1, Corollary 4.2 and Proposition 4.4, pp.26–27). For a non-discrete bounded parameter induce from a proper Levi (Lemma 6.2, pp.59–60). For a discrete one, the auxiliary global parameter of Lemma 6.18, pp.70–72, must preserve the local component group, have trivial lifted global component group, and satisfy strong multiplicity one at the chosen place. These are construction requirements, not assumptions on the original local parameter. Extract its local stable distribution by fixing all other test functions and using character independence (Theorem 6.4, pp.60–61). Treat the quadratic-character exceptional cases explicitly (Lemma 6.20), then isolate and normalize the twisted character identity by test functions supported on Z_{G̃}(F)G(F) (Theorems 6.21–6.22, pp.72–75). Restriction from products proves the common-similitude case (Corollary 6.23, p.75). Thus globalization, stable extraction and normalization are required intermediate theorems of this target; an abstract finite packet does not supply them.

**Checks.**

- n=1 gives GSp₂=GL₂: the refined packet is a singleton and the self-twist group may still be nontrivial, so packet size is not the order of the self-twist group.
- An unramified member pairs trivially with S_{φ̃}; changing its central character cannot leave it in C(φ,ζ̃).
- Twisting by ω∈α(S_φ) fixes each member; a character outside α(S_φ) gives a disjoint refinement. The quotient by α(S_φ) is essential.
- Real packets on one group form give the injective character map, rather than the nonarchimedean bijection. An even orthogonal outer orbit cannot be replaced by a selected representation without further data.
- For trivial ζ̃, descent gives PGSp_{2n} packets. At n=3 this recovers the PGSp₆/Sp₆ packet and quadratic-twist ambiguity in Gan–Savin §7(a)–(e), pp.22–23. It leaves the matching to Spin₇-valued lifts noncanonical; their G₂ specialization supplies additional information.

For n=2 compare with [Gan–Takeda's GSp₄ correspondence](#gan-takeda-llc-gsp4), retaining the twist ambiguity. Source: [Xu, local](#ref-xu-local), Proposition 4.4, Theorem 4.6 and Remark 4.7, pp.26–27; proof §§6.1–6.4, pp.59–75 (arXiv v4).

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="adams-johnson-construction"></a>
### 3.20 Adams–Johnson induction and parameter data

For a connected real reductive algebraic group G with a compact Cartan T and maximal compact K, retain a Cartan involution and a θ-stable parabolic q=l+u. Its real Levi L centralizes a compact torus. An induction datum contains an actual one-dimensional unitary representation ξ of L, λ=dξ, ρ_q=ρ(l)+ρ(u) after choosing positive Levi roots, and the weak good-range inequalities Re⟨α,λ+ρ_q⟩≥0 for all roots α in u. Construct the derived Zuckerman module A(q,ξ)=R_q^S(ξ), S=dim_C(u∩k), with its Harish–Chandra module and unitary globalization. The relevant degree agrees with half the dimension of k/(l∩k). In this range A(q,ξ) is irreducible and unitary, as in AJ Lemma 2.10. The carrier retains ξ itself and the inner-form transport; an infinitesimal character alone does not determine ξ.

An AJ parameter datum additionally contains an admissible embedding {}^LL→{}^LG and a factorization of ψ:W_ℝ×SL₂(ℂ)→{}^LG through {}^LL such that the ℂ× image is central there, the SL₂ image is principal, and the associated ordinary parameter ψ∘j corresponds to the specified character of the quasi-split inner form L*. Transport this character by AJ §2.5 to each admissible real Levi and choose the θ-stable parabolic satisfying the range inequalities. Define the packet from the resulting nonzero A(q,ξ), modulo the actual isomorphism relation, and retain the finite indexing map; do not assume its component pairing is injective. For the AMR comparison below impose its regular integral infinitesimal-character and classical-group hypotheses separately. The noncompact-Cartan extension uses AJ §10's reduction to M=Z_G(A) and normalized real parabolic induction.

**API.**

- `AJInductionDatum / AJParameterDatum` retain the actual θ-stable parabolic, Levi character, range conditions and parameter embedding; conjugation transports all of them.
- `zuckermanModule / weakGoodRange_unitary_irreducible` construct cohomological induction in the specified degree and prove its irreducibility and unitarity with infinitesimal character λ+ρ_q.
- `ajPacket / ajPacket_membership / ajPacket_innerForm` form the stated double-coset-indexed packet and transport it to inner forms without assuming that its component-group pairing is injective.

Use AutomorphicFormsOnReductiveGroups §§6.1–6.5 for the Harish–Chandra, root/chamber and cohomological representation foundations; construct the cohomological-induction functor and its range theorem here.

**Checks.**

- For a compact group q=g, u=0 and S=0, so induction returns ξ.
- A θ-stable proper q with a failed range inequality does not satisfy the irreducibility theorem by definition.
- A root pairing equal to zero satisfies AJ's displayed weak inequality; a pairing equal to −1 fails it. Replacing ≥0 by a strict inequality would change this induction datum.
- Distinct characters with the same differential on a disconnected L must remain distinct input data.
- A finite packet can be larger than its component group; no general injectivity theorem is inferred from the indexing.
- Ordinary Langlands parameter ψ∘j and the original Arthur parameter retain different SL₂ data.

([Adams–Johnson](#ref-adams-johnson-1987), (2.1)–(2.2) p.277, Lemma 2.5 and character transport pp.278–280, Definitions 2.9/2.11 and Lemma 2.10 p.281, §3 pp.285–287, and §10 Theorem 10.3/Proposition 10.4 pp.305–308.)

*Needs:* AutomorphicFormsOnReductiveGroups §§6.1–6.5, Harish–Chandra modules and real cohomology; EnhancedDerivedSheaves E0/E5, derived functors; construct the relative Lie algebra cohomology and cohomological induction comparison in this target; [actual local parameter objects](#contract-c-arthur).

<a id="adams-johnson-packets"></a>
### 3.21 Archimedean Arthur packets of cohomological parameters are Adams–Johnson packets

For a quasi-split real symplectic, special orthogonal or unitary group G, take ψ satisfying the full Adams–Johnson parameter conditions of AJ87. AMR Theorem 1.1 identifies the Whittaker-normalized twisted transfer of the stable Adams–Johnson character with the twisted GL_N character of Std∘ψ. Its Arthur packet therefore equals the Adams–Johnson multiset of cohomologically induced modules A_𝔮(λ), with the multiplicity-one consequence used by Chenevier–Taïbi. Use the full parameter definition of [the local construction](#adams-johnson-construction): AMR §8.1 gives necessary consequences (regular integral infinitesimal character, centralizer Levi and a unitary-character factorization with principal SL₂), which are insufficient to define this scope.

G is quasi-split over ℝ and ψ is an actual Adams–Johnson parameter. Its full defining conditions belong to the preceding local construction; regular integral infinitesimal character alone is insufficient. Global applications (Chenevier–Taïbi; Ichino–Prasanna) are conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate); Ichino–Prasanna use KMSW Theorem* 1.7.1 for non-generic parameters, which KMSW prove only for generic ones.

Use the actual induction data and parameter factorizations of [the preceding construction](#adams-johnson-construction), including inner-form character transport, the double-coset indexing and the §10 reduction.

**Checks.**

- L=T recovers the discrete-series construction; L=G has 𝔲=0 and one Weyl double coset, giving the one-dimensional character.
- A choice violating the root inequality is excluded even if its infinitesimal character is regular integral.
- A group without compact Cartan requires the §10 construction rather than the compact-Cartan formula.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.adamsJohnson_eq_arthurPacket`.

Import AMR Theorem 1.1 at the exact AJ87 parameter scope. The proof compares stable sums of cohomological characters with the Whittaker-normalized twisted GL_N trace, using tempered spectral transfer and resolutions by standard modules. Request the complete parameter definition and cohomological induction objects, then expose the equality as a packet/multiset comparison. The higher-rank non-quasi-split global application separately retains KMSW’s actual nongeneric local hypotheses.

Chenevier–Taïbi (5.2.1): for Sp_{2g} and holomorphic discrete series ρ_k (k_g > g), ρ_k ∈ Π(ψ_ℝ) iff d_{i₀} = 1, with the character values given there.

([Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.1, p. 303 (published); [Hodge classes and the Jacquet–Langlands correspondence](#ref-ichino-prasanna-2023), §11.2, p. 70 (arXiv v2); published p. 81; [Paquets d’Arthur des groupes classiques et unitaires](#ref-amr-2018), Theorem 1.1, §1, printed p. 3; [Adams–Johnson](#ref-adams-johnson-1987), (2.1)–(2.2), p. 277, (2.5), pp. 279–280, Definition 2.9, Lemma 2.10 and Definition 2.11, pp. 280–281; §3, pp. 285–286; §10, Theorem 10.3 and Proposition 10.4, pp. 305–308.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); [Adams–Johnson construction](#adams-johnson-construction) (discrete series); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="moeglin-renard-packets"></a>
### 3.22 Arthur packets of Sp_{2g}(ℝ) containing scalar unitary highest weight modules (Mœglin–Renard)

Let ψ=ψ_u⊕⊕_j(δ_{t_j}⊠R[a_j]) be an Arthur parameter of Sp_{2g}(ℝ), with ψ_u=⊕_i χ_i⊠R[a′_i], χ_i∈{1,sgn}, a′_i odd, one or three unipotent summands, t_j>0 and t_j+a_j odd. Put a(ψ_u)=max_i a′_i. For 0≤k≤g assume that the infinitesimal character is {k−1,…,k−g,−(k−1),…,−(k−g),0}. The scalar highest-weight module π_g(k) belongs to Π_ψ exactly in either of these cases: (i) dim ψ_u=1, 2k>g+1, and the closed intervals [(t_i−a_i+1)/2,(t_i+a_i−1)/2] are pairwise disjoint; (ii) ψ=(sgn^{(2g+1−a(ψ_u))/2}⊠R[a(ψ_u)])⊕ψ′, where ψ′ is a parameter for the compact even orthogonal group O(0,2g+1−a(ψ_u)), its packet contains a finite-dimensional E_{ψ′}, and the Howe lift of E_{ψ′} is π_g(k). In either case π_g(k) has multiplicity one. The refinement for k≥1 has a(ψ_u)=2(g−k)+1 or 2(g−k)+3 in the theta branch; the latter requires 2k≥g+2. The packet character is a separate assertion of Proposition 18.3, whose formula remains a requested export.

Here π_g(k) uses Mœglin–Renard's highest-weight convention: its generating K-type has highest weight (−k,…,−k). A scalar holomorphic Siegel form with positive lowest K-type (k,…,k) gives the contragredient representation; transport the parameter and packet by contragredience when making that comparison. The local criterion has the parameter decomposition and infinitesimal-character condition above as hypotheses. Global uses also carry the explicit external classification assumptions.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.moeglinRenard_packet`.

Construct the real scalar packet membership comparison here from Mœglin–Renard Theorems 7.1–7.2 with the displayed parameter decomposition and infinitesimal character. Use AF §§6.3–6.5 for the already planned real cohomological modules. Its theta branch uses [the local real compact-theta extension](#theta-and-metaplectic-descent), with the Fock character and highest-weight comparison specified there.

**Checks.**

- For g=1 and k=0, ψ=1⊠R[3] contains the trivial representation π₁(0): the theta branch uses O(0,0), while the first branch fails 2k>g+1.
- For g=2 and k=2, ψ=1⊕(δ₁⊠R[2]) has infinitesimal character {1,0,0,0,−1}; dim ψ_u=1, 2k=4>3 and the sole interval is [0,1], so the first branch contains π₂(2) with multiplicity one. Here δ₁ is the two-dimensional Weil representation in the source's notation.
- The same ψ has the infinitesimal character of π₂(1), but does not contain it: 2k=2≤3 excludes the first branch, and a(ψ_u)=1 is neither 2(g−k)+1=3 nor 2(g−k)+3=5. Matching infinitesimal character alone is insufficient.

Used by Chenevier–Taïbi to count level-one Siegel modular forms of small weight.

([Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.2, pp. 303–305 (published); [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.2, case (H), p. 305 (published); [Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](#ref-moeglin-renard-2018), Theorems 7.1–7.2, §7, p. 19; notation and contragredient convention §1, pp. 1–6.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur).

<a id="amf-nonsplit-so-v"></a>
### 3.23 Arthur's multiplicity formula for non-split odd orthogonal groups, generic parameters (Gan–Ichino's hypothesis (6.1))

Let F be a number field and V a (2n+1)-dimensional quadratic space with trivial discriminant. The near-equivalence decomposition L²_disc(SO(V))=⊕_ΦL²_Φ(SO(V)) ranges over all elliptic A-parameters, including non-generic ones. For a generic elliptic Φ only, Gan–Ichino hypothesis (6.1) gives L²_Φ(SO(V))=⊕_ηm_ηΣ_η through its Vogan packets, where m_η=1 if Δ*η=1 and 0 otherwise. The decomposition and the generic multiplicity formula have different quantifier scopes. The split case follows from Arthur; the non-split generic result uses the stated external inner-form classification.

F a number field; V odd-dimensional with trivial discriminant; Φ generic elliptic. For split SO(V) this is Arthur's Theorem 1.5.2; for non-split SO(V) Gan–Ichino assume it (their hypothesis (6.1) with the decomposition of §3.1), and Ishimoto proves it for generic parameters; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.multiplicity_formula_so_nonsplit`.

Split case: [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula). Non-split case: comparison of the trace formula of SO(V) with that of its quasi-split inner form (Ishimoto, following Kaletha–Mínguez–Shin–White's method for unitary groups), using the local results of [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v).

Gan–Ichino's Theorem 1.4 (the multiplicity formula for Mp_{2n}) is stated under this hypothesis; retain this hypothesis in each application.

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §6.2, (6.1), p. 22 (arXiv v3); published p. 993; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §3.1, p. 10 (arXiv v3); published p. 977.)

*Needs:* [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)](#kmsw-inner-forms); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="packet-member-irreducibility"></a>
### 3.24 Irreducibility of the induced representations building almost tempered packets (Gan–Ichino, Lemmas 5.1 and 5.5)

(Lemma 5.1) Let F be local of characteristic 0, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀ an almost tempered symplectic parameter, V = H^k ⊕ V₀ (k = dim ϕ), Q ⊂ SO(V) the parabolic with Levi GL_k × SO(V₀) and τ ∈ Irr GL_k(F) attached to ϕ. Then Ind_Q^{SO(V)}(τ ⊗ σ₀) is irreducible for every σ₀ ∈ Π_{φ₀}(SO(V₀)). (Lemma 5.5) Let φ′ = φ ⊕ S_{2r−2n} with φ a 2n-dimensional almost tempered symplectic representation of L_F, 2n < r − 1, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀, φ′₀ = φ₀ ⊕ S_{2r−2n}, Q′ ⊂ SO_{2r+1} with Levi GL_k × SO_{2r−2k+1}. Then Ind_{Q′}^{SO_{2r+1}}(τ ⊗ σ′₀) is irreducible for every irreducible subrepresentation σ′₀ of every member of the A-packet Π_{φ′₀}(SO_{2r−2k+1}).

F local of characteristic 0; 'almost tempered' as in Gan–Ichino §5.2: ϕ with exponents in (−1/2, 1/2) after the tempered part is split off. In both lemmas φ=ϕ⊕ϕ^∨⊕φ₀ is the canonical bad/good decomposition: φ₀ consists of the symplectic irreducible summands and ϕ selects the non-symplectic dual pairs. An arbitrary choice of a symplectic subparameter φ₀ does not satisfy the source hypothesis.

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.induced_irreducible_of_almostTempered`.

Lemma 5.1: for nonarchimedean F use Mœglin–Waldspurger §2.14 and the Gross–Prasad–Rallis input of Gan–Ichino. For F=ℝ use Speh–Vogan [83], and for F=ℂ use the known irreducibility of the almost-tempered induced representation. These are separate real/complex inputs, not an application of Arthur’s refined inductive property. Lemma 5.5: use Mœglin for nonarchimedean F and Mœglin–Renard for F=ℂ. For F=ℝ the canonical bad/good decomposition yields disjoint half-integral infinitesimal-character supports for the inducing factors; the Kazhdan–Lusztig input [22] in Gan–Ichino’s proof gives irreducibility. The real input is not omitted.

The lemmas are what makes the members σ_η of almost tempered packets irreducible (Gan–Ichino Proposition 5.4).

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.2, Lemma 5.1 and proof, p. 18 (arXiv v3); published p. 987; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.4, Lemma 5.5 and proof, p. 20 (arXiv v3); published p. 990.)

*Needs:* [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="generic-packets-standard-modules"></a>
### 3.25 Members of generic L-packets of classical groups are irreducible standard modules (Jiang–Zhang, Proposition B.1)

Let F be a local field of characteristic 0, G a classical group over F (quasi-split, or a pure inner form) and φ a generic L-parameter (its L-packet contains a generic member for some Whittaker datum of the quasi-split form). Then every member of the L-packet Π_φ(G) is an irreducible standard module, i.e. the full induced representation from the tempered data of its Langlands quotient is irreducible.

F local of characteristic 0; G classical (symplectic, orthogonal or unitary, or a pure inner form); φ generic. Conditional through the packets used ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.genericPacket_standardModule`.

Mœglin–Waldspurger (generic packets and standard modules), Gan–Ichino (the Gross–Prasad–Rallis conjecture), Heiermann (the standard module conjecture for classical groups), Adams–Barbasch–Vogan (archimedean case), as assembled in Jiang–Zhang Appendix B.

For G = GL_n (not classical, but the model case) the statement is Zelevinsky's standard module result for generic representations.

([Arthur parameters and cuspidal automorphic modules of classical groups](#ref-jiang-zhang-2020), Appendix B, Proposition B.1 and proof, p. 85 (arXiv v4); published p. 818.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-arthur-classification"></a>
### 3.26 Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)

Let F be a totally real number field. Every discrete automorphic representation π of GSp₄(𝔸_F) has a transfer π̃ to GL₄(𝔸_F) (its global parameter) of one of the six types (a)–(f) of [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types), and the discrete spectrum is described by Arthur's multiplicity formula for GSp₄. In particular: (i) the transfer is compatible with rec_GT at every finite place; (ii) for a parameter ψ = π̃ ⊠ 1 of general type the global component group S_ψ is trivial, so for every choice of local packet members π′_v ∈ Π_{ψ_v} (π′_v unramified for almost all v) ⊗′_v π′_v is automorphic; (iii) such representations occur with multiplicity one; and for a general-type ψ the archimedean packet Π_{ψ_∞} is the L-packet of the archimedean parameter.

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π. Conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate): Gee–Taïbi prove Arthur's 2004 announcement from Arthur 2013 for Sp₄ and SO₅, and the result is only as unconditional as Arthur 2013 and Mœglin–Waldspurger's stabilisation. The BCGP §2.9 statement used here has F totally real; a version over an arbitrary number field needs a separately checked Gee–Taïbi export.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.GSp4.classification`.

Gee–Taïbi: restrict from GSp₄ to Sp₄ and use Arthur's classification for Sp₄ (Ĝ = SO₅) and for SO₅ ≅ PGSp₄ (Ĝ = Sp₄), together with the similitude character, and prove compatibility with rec_GT. Parts (ii)–(iii) for general type: ψ is stable (S_ψ = 1), so ε_ψ = 1 and every member of the global packet occurs once.

Calegari–Geraghty Theorem 7.11 and Pilloni Proposition 15.2.4.1 use exactly (ii) and (iii) to move between the holomorphic and generic limits of discrete series at infinity.

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 7.11, §7.2, publ. p. 854; arXiv v1 p. 40; [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 7.11, publ. p. 855 (copy p. 55); [BCGP, potential modularity](#ref-bcgp-2021), §2.9 'Arthur's classification', first paragraph PDF p.38.)

*Needs:* [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4); [The classification input for the symplectic branch](#symplectic-branch-status); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="xu-multiplicity-formula"></a>
### 3.27 Xu's multiplicity formula for generic global parameters of GSp_{2n}

Let F be a number field, n≥1, G=Sp_{2n} and G̃=GSp_{2n}. Let φ be a generic discrete global Arthur parameter of G: its Arthur SL₂ is trivial. Fix an extension ζ̃ of its central character to Z_{G̃}(𝔸_F). Put
`Y=Hom(G̃(𝔸_F)/(G̃(F)Z_{G̃}(𝔸_F)G(𝔸_F)),ℂ×)`
and let α:S_φ→Y be the global boundary map, S_{φ̃}=ker α. There is a restricted-product packet Π_{φ̃}=⊗′_vΠ_{φ̃_v}, unique up to Y-twist, containing a discrete automorphic member, and
`L²_disc,φ(G̃(F)\G̃(𝔸_F),ζ̃) ≅ ⊕_{ω∈Y/α(S_φ)} ⊕_{π̃∈Π_{φ̃}⊗ω, ⟨·,π̃⟩=1} π̃`.
The character ⟨·,π̃⟩ of S_{φ̃} is the product of the local pairings restricted by localization. Thus each displayed occurrence has multiplicity one for GSp; retain the twist-indexed direct sum rather than assuming distinct twists always give nonisomorphic representations. For the common-similitude/even orthogonal extension use Xu Theorem 4.1 with its factor m_φ and Σ₀-conjugacy convention.

Generic refers to the global Arthur SL₂. It does not assert that each local component is tempered, and does not assert that each packet member is Whittaker-generic. Use the local Φ⁺_unit packets of §3.19 at possibly non-tempered localizations. This target does not classify parameters with nontrivial Arthur SL₂. Trivial ζ̃ gives the PGSp_{2n} formula.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.xu_multiplicity_formula`.

**API.** Construct `xuGlobalBoundary` and its localizations, `xuGlobalPacket` with its spherical restricted-product basepoints, `xuGlobalPairing` by the finite product of nontrivial local characters, and `xu_multiplicity_formula` with the displayed twist quotient and character condition. Expose invariance under a Y-twist, `globalPairing_local_product`, `xu_multiplicity_trivial_kernel`, and `xu_projective_descent`. Adelic quotient characters without the G̃(F)-triviality condition form the larger group X; X and Y are distinct inputs.

Use Arthur's restriction-spectrum formula and the local twisted identities. The global comparison needed in the induction is Xu's weak comparison Theorem 4.7, not the general endoscopic functoriality conjecture. For the GL-type orthogonal summands, the endoscopic coefficient is the multiplicity ratio times 2. Summing unordered decompositions gives the recursion `a_m=(1/2)∑_{k=1}^{m−1}a_k a_{m−k}` for the stable discrete distribution. Fix all but one local test function, then use the stable local character basis and linear independence to propagate occurrence from one automorphic member to all members with the same global pairing. Restriction formula (2.19) supplies the multiplicities (§6, pp.19–21). For general summands compare the stabilized distributions of §7, pp.21–24; their component-group fibres account for the different 1/2 and 1/4 factors. This does not presuppose full functorial transfer.

The compatible lifting of §8, pp.25–34, is additional mathematical data. Decompose the orthogonal blocks and GL-pairs. Compare their Clifford GPin lifts with the lift along an endoscopic factorization. The resulting central 2-cocycles are split by Weil-group 1-cochains; GL-pairs require their character corrections as well. Two factorizations differ by a μ₂-cochain, and Proposition 8.4 makes the correction a character well-defined modulo `Hom(Γ_{L/F},μ₂)⊂α(S_φ)`. Proposition 8.7 transfers this compatibility to representations: at spherical places use the fundamental lemma; for nonelliptic parameters compare Levi induction and endoscopy, including triply repeated blocks. For elliptic parameters globalize with global component group equal to the designated local one and with trivial lifted global component group. Bound the other ramified-place character ambiguities and use strong multiplicity one globally to identify the lift at the designated place. Corollary 8.8 gives independence of the endoscopic chain, rather than postulating a compatible family.

In §9, pp.34–39, induction first treats symplectic and then even orthogonal rank. Add the negative-pairing discrete distributions with coefficient 2C to make a stable distribution; a member with pairing 1 is already in the original discrete spectrum and hence occurs. Linear independence in the twisted trace comparison forces the claimed multiplicity and the quotient Y/α(S_φ). In the remaining boundary case, replace one block φ₁ by 2φ₁ in an auxiliary parameter. Its standard rank can increase; the relevant decomposition complexity decreases. The two stabilized comparisons then express the same defect with opposite pairings, forcing it to vanish. Keep their coefficient d throughout. This is not an invocation of the desired multiplicity theorem at a larger rank. The self-twist comparison in Appendix A, pp.40–43, uses the quadratic-induced dual datum and automorphic induction to detect the full stabilizer, including characters beyond those trivial on G.

Global endoscopic transfer of packets up to a Y-twist has the additional hypothesis of Theorem 1.2/4.5: at least one input factor contains no GL-type orthogonal simple summand. That condition is automatic for GSp₄ and GSp₆, but is not deleted at general rank. It is separate from the multiplicity formula itself. Add `xuCompatibleLift / xuLift_factorizationChange / xuLift_chainIndependent` to the API: these construct the Weil cochain correction, its character modulo α(S_φ), and the resulting packet independent of the factorization chain.
**Checks.**

- S_{φ̃}=1 makes the character condition empty, so every member of the selected packet occurs. This only needs the lifted kernel trivial; S_φ=1 is sufficient.
- A nontrivial global pairing excludes the corresponding member. A trivial pairing at one place alone does not imply its global product is trivial.
- A generic global parameter with a complementary-series localization still belongs to this formula. A nontrivial global Arthur SL₂ does not.
- In the n=3 projective specialization with S_φ=1, recover the consequence used in Gan–Savin §12.8, pp.39–40: every member of the packet containing Σ is automorphic. The conclusion alone does not establish cuspidality for every member.

- Changing a lifting cochain by a character in α(S_φ) gives the same twist coset; changing by a character outside it need not. A change of endoscopic chain must preserve that coset, including the GL-pair correction.
- A rational similitude in G̃(F) evaluates to 1 under every member of Y; a character of the larger group X which violates this is excluded.
- For two GL-type orthogonal blocks retain the unordered-partition coefficient and its multiplicity ratio; counting ordered partitions doubles the contribution.

Source: [Xu, global](#ref-xu-global), Theorem 1.1, pp.1–2, Theorem 4.1, pp.12–13; proof inputs Theorem 4.7, pp.14–15, §§6–9, pp.19–39 and Appendix A, pp.40–43 (arXiv v2). The corrected comparison proof is essential; the thesis announcement is not a substitute.

*Needs:* [Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)](#xu-gsp2n-packets); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="non-general-type-reducible"></a>
### 3.28 Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)

Let F be totally real and π a discrete automorphic representation of GSp₄(𝔸_F) such that for each v | ∞, π_v has the infinitesimal character of the L-packet of φ_{(2; k_v−1, l_v−2)} with k_v ≡ l_v (mod 2) and k_v ≥ l_v ≥ 2. If π is not of general type, there is a compatible system of reducible Galois representations ρ_{π,p} : G_F → GSp₄(Q̄_p) with WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for all but finitely many v. Pilloni (§5.1.7) records the same for F = ℚ and discrete-series π_∞: in types (b)–(f), ρ_{π,λ} is a sum of representations attached to GL₁ and regular algebraic GL₂ forms. For general type, irreducibility of ρ_{π,p} is only expected (BCGP Remark 2.9.2).

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π. The archimedean condition of the lemma; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.reducible_of_not_generalType`.

By [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification), π falls into one of the classes (b)–(f). In each class the transfer is an isobaric sum of Hecke characters and cuspidal GL₂ representations (possibly twisted by |·|^{±1/2}), all regular algebraic or algebraic by the archimedean condition; take the sum of their Galois representations (class field theory; AutomorphicGaloisRepresentations for Hilbert modular forms). In class (b) the GL₂ constituents have central character ω_π.

Check case (b): a Yoshida lift has ρ_{π,p} = ρ_{μ₁,p} ⊕ ρ_{μ₂,p}.

([BCGP, potential modularity](#ref-bcgp-2021), Lemma 2.9.1, §2.9, p. 38 (arXiv v3); [Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019).)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet); AutomorphicGaloisRepresentations, Layer R19.2; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-archimedean-limit-packets"></a>
### 3.29 The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)

Let λ=(p,0;c)∈X*(T)+(2,1;0), p>0. The archimedean L-packet containing the holomorphic limit of discrete series of full GSp₄(ℝ) consists of two members π(λ)^h and π(λ)^g, the latter generic. Construct this packet directly through normalized Klingen induction and the real LLC, using the following comparison. This is also the description attributed to Blasius–Harris–Ramakrishnan Proposition 5.3.7 by Pilloni and Calegari–Geraghty; the construction here uses the primary computations of Muić and Schmidt.

First remove the prescribed positive central character by a norm twist. Let D_p be the GL₂(ℝ) discrete series with lowest SL₂-weight p+1 and positive central character one. On Sp₄(ℝ), `1⋊D_p⁺` is the sum of the holomorphic limit with minimal U(2)-type (p+1,2) and the generic limit with minimal U(2)-type (p+1,0). Muić Lemma 8.1(i), pp.371–372, obtains this from the tempered classification, Langlands disjointness and the principal-series relations of Corollary 5.2. The negative-multiplier element of GSp₄ exchanges each limit with its antiholomorphic partner. Induction from the multiplier-positive subgroup therefore combines four Sp₄ limits into **two** full-GSp₄ representations, and `1⋊D_p=π^h⊕π^g` (Schmidt §2.5, equation (2.23), p.2394). Both have the same parameter, the symplectic similitude representation R_p⊕R_p, where R_p=Ind_{ℂ×}^{W_ℝ}(z/|z|)^p and det R_p=sgn^(p+1). In a basis e₁,e₂ for R_p one can take j(e₁)=e₂ and j(e₂)=(−1)^p e₁. Give its multiplicity space the nondegenerate symmetric form; tensoring this with the alternating similitude form on R_p gives the four-dimensional alternating form. The centralizer is GO₂(ℂ) on the multiplicity space, so its component group modulo the scalar center is C₂. Schmidt §3.3, equations (3.11)–(3.14), pp.2398–2399, explicitly conjugates this parameter to the singular discrete-series parameter. The real tempered classification and this centralizer calculation identify precisely the two Klingen summands as its packet. Restore the same norm twist on the representations and parameters to recover c. A shared infinitesimal character without the displayed parameter would not identify a packet.

For a global parameter ψ of general type the identification of its archimedean Arthur packet with this L-packet uses the separate classification inputs below. In Calegari–Geraghty's notation the two members are {π(λ,C₀),π(λ,C₁)}, λ=(a−1,0;4−a).
λ=(λ₁,0;c) ∈ X*(T)+(2,1;0) with λ₁>0. In the integral triple convention this includes λ₁−3 ≡ c (mod 2). The character-lattice parity is Pilloni §5.1.1, author p. 20. For λ=(1,0;2) the holomorphic minimal Sp₄ K-type is (2,2); λ₁=0 is excluded, and λ=(1,0;1) fails the parity condition. The identification of Π_{ψ_∞} with the L-packet uses Arthur's classification ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

**API.**

- `GSp4.limitPacket / klingenLimitDecomposition` construct the two full-GSp₄ summands of normalized induction with the specified central twist.
- `limitPacket_restrictSp / limitPacket_minimalKType` identify their two Sp₄ constituents and the minimal compact types (p+1,2) and (p+1,0).
- `limitPacket_parameter / limitPacket_componentGroup` give R_p⊕R_p with its actual alternating form and the component group C₂.
- `limitPacket_generic / limitPacket_holomorphic` distinguish the generic and holomorphic members; `limitPacket_arthur_generalType` uses the classification gate only for the global Arthur comparison.

**Checks.**

- At p=1 the holomorphic minimal type is (2,2), whereas the generic one is (2,0); they cannot be identified.
- Restriction to Sp₄ gives four limits in total, but full GSp₄ has two members. A negative multiplier interchanges each holomorphic sign.
- At the different wall λ=(p,−p), p>0, Schmidt (2.24) and (3.15) give a singleton full-GSp₄ packet with parameter 1⊕R₂ₚ⊕sgn. The two-member assertion applies only to (p,0).
- p=0 is excluded. The lattice parity excludes (1,0;1), and retains (1,0;2).

([Muić](#ref-muic-2009), §8 and Lemma 8.1, pp.371–372, with Corollary 5.2, pp.362–363; [Schmidt](#ref-schmidt-hodge), §§2.3,2.5,3.3, pp.2390–2391,2393–2394,2398–2400; [Pilloni](#ref-pilloni-2020), §15.2.4, author p.109; [Calegari–Geraghty](#ref-cg-2020), Theorem 7.11 and proof point (2), published pp.854–855.)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [AutomorphicLFunctionsAndLocalFactors, archimedean GL_n parameters](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="unitary-descent-of-gl4-transfer"></a>
### 3.30 The symplectic pairing through unitary descent

For a general-type cuspidal Siegel eigenform, construct the symplectic pairing on its Galois realization as in Calegari–Geraghty Lemma 6.9; an absolutely irreducible residual realization inherits the symplectic pairing. The unitary route must exhibit the algebraic twist producing a conjugate-self-dual parameter over a CM field, choose that CM restriction so that absolute irreducibility is preserved, apply the exact unitary descent theorem, and transport the Bellaïche–Chenevier pairing through the twist and restriction. Essential self-duality Π≅Π∨⊗ω by itself does not supply conjugate self-duality. The comparison maps and the pairing-transport theorem are targets of this assertion, with their specified coefficient and polarization data.

f of general type; K imaginary quadratic with r_f|_{G_K} absolutely irreducible. Conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate) (the transfer and Mok's descent).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent`.

Use the GSp₄→GL₄ transfer and its archimedean normalization. Apply the exact twist and unitary descent contract of ET.7, then transport the pairing and compare the residual form on a stable lattice.

The conclusion used by CG: r̄_m symplectic when absolutely irreducible.

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Lemma 6.9, §6.2, publ. p. 840 (copy p. 40); arXiv v1 p. 30.)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="limit-discrete-series-packet-types"></a>
### 3.31 Global packets with a holomorphic limit of discrete series at infinity are of general, Yoshida or Saito–Kurokawa type

Let π = π_f ⊗ π(λ)^h be a discrete automorphic representation of GSp₄(𝔸_ℚ) with λ = (λ₁, 0; c) ∈ X*(T)+(2,1;0), λ₁ > 0. Then its global Arthur packet is of general, Yoshida or Saito–Kurokawa type (Schmidt 2018, §§1.1–1.2, compared with the archimedean parameters of π(λ)^h in Schmidt 2017). If moreover the Hecke eigensystem of π_f is congruent to a non-Eisenstein maximal ideal (residual Galois representation irreducible), the packet is of general type, and then π_f ⊗ π(λ)^h is automorphic iff π_f ⊗ π(λ)^g is, both with multiplicity one (Pilloni, Proposition 15.2.4.1).

F = ℚ; λ ∈ X*(T)+(2,1;0), λ₁ > 0; the finite part is unramified outside Np with its Hecke character congruent to the fixed non-Eisenstein eigensystem of Pilloni §15.2; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries`.

Compare the archimedean parameter of π(λ)^h with the archimedean components allowed in each of Arthur's six types (Schmidt's tables). Yoshida and Saito–Kurokawa types give reducible Galois representations ([Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)](#non-general-type-reducible)), contradicting irreducibility of the residual representation. For general type: [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets) and parts (ii)–(iii) of [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification). The conclusion uses triviality of ψ on the Arthur SL₂ and does not assert the full Ramanujan temperedness of Π.

Calegari–Geraghty's proof of Theorem 7.11 excludes classes (b)–(f) by the same reducibility argument in weight (a, 2).

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §15.2.4, Proposition 15.2.4.1 and proof, p. 109 (author version); [Schmidt, archimedean aspects](#ref-schmidt-2017), §2.3, pp. 2390–2391 (author PDF pp. 10–11); [Schmidt, packet structure](#ref-schmidt-2018), §§1.1–1.2, pp. 3088–3092.)

*Needs:* [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets); [Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)](#non-general-type-reducible); [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-gl4-archimedean-transfer"></a>
### 3.32 Infinitesimal character of the transfer of π_∞ from GSp₄(ℝ) to GL₄(ℝ) (Calegari–Geraghty Theorem 5.6)

Let µ = (a, b; c) be a dominant weight, w = −(a + b + 2c), and π = π^∞ ⊗ π_∞ a discrete automorphic representation of GSp₄(𝔸_ℚ) contributing to the coherent cohomology H^i(X, W_µ)_(2). Then (1) π_∞ has infinitesimal character χ_{(a−1, b−2; −w)}; (2) the transfer π̃_∞ of π_∞ to GL₄(ℝ) (the archimedean parameter composed with the spin embedding GSp₄(ℂ) ⊂ GL₄(ℂ)) has infinitesimal character χ_τ with τ = ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2); (3) if π_∞ is tempered it is the (limit of) discrete series π((a−1, b−2; −w), C_i) for a chamber C_i.

F = ℚ; Calegari–Geraghty's normalisation of weights and of coherent cohomology (§5.3).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter`.

(1) from the (𝔭, K)-cohomology computation of π_∞ ⊗ V_σ (Harris; CG §5.3). (2) the weights of the spin representation: with (λ₁, λ₂; λ₀) = (a−1, b−2; −w), τ = ((λ₁+λ₂+λ₀)/2, (λ₁−λ₂+λ₀)/2, (−λ₁+λ₂+λ₀)/2, (−λ₁−λ₂+λ₀)/2) (Sorensen §2.1.2). (3) tempered representations with regular-or-singular integral infinitesimal character are (limits of) discrete series.

CG Remark 5.12: for µ = (a, b), w = a + b − 6, τ = (0, −(b−2), −(a−1), −(a+b−3)) + (3/2)(1, 1, 1, 1), consistent with (2).

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Theorem 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 PDF p.29; [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 5.6, publ. p. 829 (copy p. 29).)

*Needs:* [AutomorphicLFunctionsAndLocalFactors, archimedean GL_n parameters](https://github.com/TauCetiProject/TauCetiRoadmap/pull/924); [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

### Examples

For G=SO₃ the dual is Sp₂. The block 1⊠ν₂ has the required symplectic parity and trivial component group. Two one-dimensional quadratic blocks with b=1 have orthogonal parity and are excluded. For dual SO₃ a single odd-dimensional block has determinant-one sign kernel {0}; imposing only the central quotient would leave a spurious ℤ/2. With two odd blocks, the kernel is the diagonal {(0,0),(1,1)}. With no blocks it is the trivial full group.

### Dependencies

The layer uses the exact supplier contracts above, AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), AutomorphicLFunctionsAndLocalFactors, Layer AL.4, AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula), EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, GL2AutomorphicRepresentationsAndTransfer, Layer R16.3, [theta and metaplectic descent](#theta-and-metaplectic-descent), TauCetiRoadmap.ClassFieldTheory, Layer 7, Layer 0, TauCetiRoadmap.ReductiveGroups, Layer 6, AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series), AutomorphicGaloisRepresentations, Layer R19.2, AutomorphicFormsOnReductiveGroups, Layer AF.4, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, AutomorphicGaloisRepresentationsPartII, Layer AG2.2.

## Layer 4: symmetric powers, purity and equidistribution

<a id="enormous-adjoint-selmer"></a>
### 4.1 Characteristic-zero enormous image and adjoint Selmer vanishing

For H⊂GL_n(O), O the integers of a p-adic coefficient field E, n≥1, define `IsEnormousCharZero(H)` by the following condition: for every simple E[H]-submodule V of End_E(E^n) under conjugation, there are h∈H with n distinct E-eigenvalues and an eigenvalue α such that `tr(e_{h,α}V)≠0`, where e is the spectral projector. Allow coefficient enlargement as in the source. This is the characteristic-zero condition, with no residual group-cohomology vanishing clauses inserted.

If F is CM, π regular algebraic cuspidal of unitary type and `r_{π,ι}(G_{F(ζ_{p^∞})})` enormous, then `H¹_f(F⁺,ad r_{π,ι})=0`. Here ad is the full End representation extended to G_{F⁺} by `c·X=−X*` using the perfect symmetric polarization; the local conditions are crystalline Bloch–Kato at p and unramified away from p. Theorem B gives vanishing for non-CM Hilbert forms and non-CM elliptic curves over totally real fields at every prime p. It does not require a large residual image.

**API.**

- `IsEnormousCharZero / spectralProjector_trace_detects` express the full-End simple-module condition using the actual regular element and spectral projector.
- `enormous_absoluteIrreducible` deduces absolute irreducibility after the coefficient extension required to split the regular element.
- `polarizedAdjoint` extends the full End action to G_(F⁺) with the displayed negative-transpose involution.
- `adjointSelmer_eq_zero` annihilates the Bloch–Kato group for this adjoint under the enormous-image automorphic hypotheses. The proof uses trace/pseudodeformation comparison up to bounded torsion, integral Hecke comparison and the characteristic-zero Taylor–Wiles pre-patched module. Import general deformation/patching foundations; the enormous-image detection and this Selmer comparison are additional targets here.

**Checks.**

- In rank one the sole spectral projector is 1 and detects the scalar module.
- A scalar subgroup in rank two has no regular element and fails the definition.
- On scalars X=aI, c acts as −aI, so the full adjoint is not ad⁰ with a trivially acted-on extra line.
- At p=2 the coefficient field still has characteristic zero and −1≠1; trivial residual image does not contradict the theorem.

([Newton–Thorne, adjoint Selmer](#ref-nt-selmer), Theorems A–B, p.2; Definition 2.23 and Lemma 2.25, pp.20–21; Theorem 4.28 p.39 and applications §5, pp.39–43, arXiv v3.)

*Needs:* GlobalGaloisDeformations, polarized deformations and pseudocharacters; DeformationAndDerivedPatchingAlgebra, patching modules; ArithmeticGaloisDuality, Bloch–Kato Selmer conditions; [C-GALOIS](#contract-c-galois).

<a id="residually-reducible-ordinary-lifting"></a>
### 4.2 Ordinary lifting with several residual constituents

Let F be imaginary CM, n≥2, ℓ>3 with ℓ∤n, and ρ:G_F→GL_n(ℚ̄_ℓ) continuous semisimple, finitely ramified, ordinary of dominant weight λ, with `ρ^c≅ρ∨ε^{1−n}`. Require all of the following:

- `ρ̄^{ss}=⊕_{i=1}^d ρ̄_i`, where the constituents are distinct absolutely irreducible and **each** satisfies `ρ̄_i^c≅ρ̄_i∨ε̄^{1−n}`.
- At a place v₀∤ℓ, `ρ|_{G_{F_v₀}}^{ss}=⊕_{i=1}^n ψ ε^{n−i}` for an unramified ψ.
- There is an ι-ordinary RACSDC seed π with `r̄_{π,ι}^{ss}≅ρ̄^{ss}` and π_v₀ an unramified Steinberg twist.
- `F(ζ_ℓ)⊄F^{ker ad(ρ̄^{ss})}`, `F⊄F⁺(ζ_ℓ)`; the ρ̄_i remain absolutely irreducible and distinct over F(ζ_ℓ); ρ̄^{ss} is primitive and its image has no quotient of order ℓ.

Then ρ is the realization of an ι-ordinary RACSDC Π. Semisimple reduction is not substituted for the characteristic-zero local shape. The proof plans the µ₂^d-action on the Schur deformation ring, its invariant pseudodeformation subring, étaleness on the irreducible locus, a dimension bound on the reducible locus from v₀, and connectedness of the finite ordinary deformation ring. These are the missing reducible-lifting extensions of the general deformation foundations.

**Checks.**

- Polarization of the whole residual direct sum need not polarize each constituent; a pair exchanged by duality fails the stated input.
- Matching the seed's residual representation without its Steinberg v₀ component is insufficient.
- The theorem allows d>2 but excludes n=1 and ℓ|n.
- Finite ramification and ordinary local flags concern ρ, not an arbitrary representation with the same residual trace.

([Allen–Newton–Thorne](#ref-ant), Theorem 1.1, pp.1–2; §3.3 pp.11–13; Theorem 5.1 pp.15–17; Theorem 6.1 pp.17–19, arXiv v2.)

*Needs:* [polarized ordinary lifting](#polarized-lifting-extensions); GlobalGaloisDeformations, Schur/pseudodeformation rings; DeformationAndDerivedPatchingAlgebra, ordinary Hecke comparison; EndoscopicTransferAndUnitaryTraceComparison, definite-unitary transfer; [C-GALOIS](#contract-c-galois).

<a id="symmetric-power-method-prerequisites"></a>
### 4.3 Definite-unitary eigenvarieties and the trianguline comparison

For the definite unitary group, tame level U^p and residual conjugate-self-dual pseudocharacter τ of Newton–Thorne I §2.18, construct completed p-adic algebraic automorphic forms by varying **all** p-levels, their locally analytic vectors and the normalized torus Jacquet module. Its strong dual gives a coherent sheaf M on the character space of the product of local diagonal tori. Adjoin the tame Hecke action and form the relative rigid spectrum E_n. Include its weight map, Hecke pseudocharacter and closed realization in `X_ps×T_n`. If κ is the highest algebraic weight and χ the smooth normalized accessible refinement, its character is `ν=κ·χ·ι⁻¹δ_B^{−1/2}`; the trianguline parameter is `j_n(ν)=ν·(1,ε⁻¹∘Art,…,ε^{1−n}∘Art)`. The finite character map of the raw Jacquet-sheaf spectrum is twisted by δ_B⁻¹ to obtain ν (NT I (2.18.1) and construction pp.35–37). The interpolation map of ordered torus characters is `χ↦(χ₁^{n−1},χ₁^{n−2}χ₂,…,χ₂^{n−1})`, together with the symmetric-power map on pseudocharacters.

The local deformation input also belongs to this construction. Let K/ℚ_p be finite and E contain its embeddings. For a trianguline E-representation ρ with a saturated full flag F and rank-one parameters δ₁,…,δ_n, assume that for i<j the ratio δ_i/δ_j is never ∏_τσ_τ^{m_τ} with every m_τ≥0. On local Artin E-algebras with residue E, the deformation functor preserving a lifted flag and its varying parameters maps injectively to D_ρ and is relatively representable. If ρ is absolutely irreducible, it is represented by a quotient R_{ρ,F,δ} of R_ρ. The same assertion for E-B-pairs needs only End(W)=E for prorepresentability. Nakamura Lemma 2.35, Proposition 2.37 and Corollary 2.38, pp.493–495, prove uniqueness by vanishing of rank-one H⁰ between successive graded pieces, then glue flags over Artin fibre products and descend the first line under injective coefficient maps; induction gives the whole flag. The equivalence between étale B-pairs and étale (φ,Γ)-modules transports this result to ρ. If ρ is de Rham and wt_τ(δ₁)<⋯<wt_τ(δ_n), the kernel of the differential of restriction to unit characters lies in H¹_g(K,adρ). Fixed unit-character restrictions are locally algebraic of these same weights. Hellmann–Schraen Proposition 2.6, p.10 of the author manuscript, proves de Rhamness by induction on the flag and vanishing of the positive-weight Γ-cohomology obstruction. Over an Artin E-algebra the same operators remain invertible because their residual operators are invertible; this is the extension used in NT I Lemma 2.7, pp.26–27. For p=2 take invariants under the finite torsion subgroup first. Hellmann–Schraen use HT(ε)=+1, so reverse their weight signs when applying their strongly dominant inequality in the present HT(ε)=−1 convention.

The analytic foundation in this target is at the general reductive-group level. For a connected reductive G over a finite extension of ℚ_p and a parabolic P=MN, form compact-type locally analytic representations and the essentially admissible subcategory via coadmissible distribution modules with central-character space. For a contracting central monoid Z_M⁺ and compact open N₀⊂N, define the finite-slope functor by continuous Z_M⁺-equivariant maps from analytic functions on the rigid character space. Its evaluation map has the right-adjoint property for extending Z_M⁺ to Z_M. Give V^{N₀} its averaged positive-monoid action and set J_P(V)=(V^{N₀})_fs. Prove independence of N₀, extension to M and left exactness. Emerton Theorem 4.2.32 proves essential admissibility by the coadmissibility of the strong dual, using the contracting analytic Iwahori subgroups and the compact transitions of Corollary 4.2.26 and the factorization of Proposition 4.2.28. For a Borel the Levi is a torus, so this dual is a coherent character-space sheaf. On admissible smooth V the functor is V_N; on X⊗W with W finite-dimensional algebraic and X admissible smooth over End_G(W), it is X_N⊗W^N. Apply the explicit modulus-character normalization of NT I to this unnormalized functor when forming refined points. Source: Emerton, Definitions 3.2.1 and 3.4.5, Propositions 3.2.4 and 4.3.4–4.3.6, Theorem 4.2.32; author draft pp.24–25,34–35,57,63–64.

Use a finite coefficient extension K/ℚ_p containing the base p-adic field, and the imported compact-type, strictness, completed-tensor and analytic strong-dual interfaces specified above. The additional functional analysis here concerns distribution-algebra modules and the finite-slope coadmissibility theorem. A weak Fréchet–Stein presentation first allows the compact-type distribution stages appearing here; Emerton's analytic-vector construction supplies a cofinal refinement by Banach Fréchet–Stein stages. Its weak coadmissible systems are compared under that refinement and under cofinal changes, using the completeness and hereditary completeness hypotheses of Definitions 1.2.6–1.2.11. Do not declare the dagger distribution stages A_n below to be Noetherian Banach algebras. A Fréchet–Stein presentation has Noetherian Banach stages and flat transition maps; a coadmissible module is a compatible inverse system of finite stage modules with the stage base-change isomorphisms. Prove independence under cofinal presentations and the coherent-sheaf comparison for functions on the character space. Use the imported rigid and p-adic Lie foundations; the weak-to-genuine Fréchet–Stein and coadmissibility comparisons specified here are additional targets, rather than consequences of smooth admissibility. Source: [Emerton, analytic vectors](#ref-emerton-vectors), Definition 1.1.16 and Theorem 1.1.17 pp.14–15, §1.2 pp.21–28.

On orthonormalizable Banach A-modules, use the imported finite-A-image approximation predicate. Emerton’s relative A-compactness for arbitrary Banach modules is the additional definition by orthonormalizable covers; do not replace it by a norm-limit definition on the arbitrary modules themselves. Compare on orthonormalizable modules, then prove its cover independence, composition, completed base-change and quotient laws, and finite generation after inverting the compact operator on a sufficiently small annulus (Emerton Definition 2.2.3, Lemma 2.2.4 and Propositions 2.2.5–2.2.6, pp.15–18). Construct the compact-type version by factorization through an A-generated compact-type module; prove the same stability and annular finite-generation assertions (Definition 2.3.3, Lemma 2.3.4 and Proposition 2.3.5, pp.18–21). Power-boundedness is equicontinuity of the powers, with its Tate-algebra action and strict-quotient descent (Propositions 2.1.6–2.1.10, pp.13–14).

The coadmissibility proof must construct its transition system. Choose good analytic subgroups H_n with rigid Iwahori decompositions and a central z contracting the opposite unipotent one stage (Proposition 4.1.6 and proof, pp.43–45). For A_n=O(Ẑ_G,n)^† ⊗̂ D(M_n^∘,M₀), form U_n from V′ by distribution base change and **Hausdorff** N₀-coinvariants, as in (4.2.6), pp.49–50. Establish `(V^{N₀})′ ≅ lim U_n`. The distribution Iwahori decomposition and its untwisting identify the coinvariant transition with the compact restriction on the opposite-unipotent factor (Proposition 4.2.22, pp.53–54). Finite coadmissible-stage presentations, completed tensor products and quotient stability then give the A_n-compact transition of **Corollary** 4.2.26, pp.54–55. Conjugation and the finite coset averaging maps give the z-action (Lemmas 4.2.11,4.2.19,4.2.21, pp.51–53). The contracted Iwahori decomposition supplies its factorization through the next transition, first on finite free modules, then on finite presentations in the Hausdorff locally convex category (Proposition 4.2.28, pp.55–57). It is not an assertion of algebraic exactness of coinvariants. Proposition 3.2.24, pp.29–31, now inverts z to prove stage base change and uses annular finite generation to prove coadmissibility. Theorem 4.2.32, p.57, identifies the two central actions and descends to O(Ẑ_M)⊗̂D(M₀), giving the desired essential admissibility.

The family input is not a pointwise triangulation assertion. For a reduced rigid L-space X with irreducible connected components, a rank-d family M of (φ,Γ_K)-modules and ordered characters δ₁,…,δ_d, assume a Zariski-dense set of points where M is strictly trianguline with those parameters. Construct a proper birational f:X′→X and a filtration of f*M by coherent (φ,Γ)-stable submodules. Each graded piece embeds in R_{X′,K}(δ_i) tensored with a line bundle; its cokernel is locally killed by a power of t and supported on a closed exceptional locus disjoint from the prescribed dense points. The first graded piece is an isomorphism with its line model. Use the admissible-affinoid-cover definition of Zariski density in KPX Definition 6.3.2; for the ordinary rigid Zariski-density convention apply the enlargement argument of NT I Remark 2.16, pp.33–34, using the open rank-one H⁰/base-change locus. Off that locus the filtration is the specified strict triangulation; on a smooth curve one may take X′=X. KPX Theorem 6.3.9 and Corollary 6.3.10, arXiv v3 pp.68–72, prove this by flattening the perfect cohomology complexes, constructing a rank-one quotient from H⁰, controlling its t-torsion cokernel and inducting on rank. Their Theorems 4.4.3 and 4.4.5, pp.42–43, give finiteness, derived base change, Euler characteristic and Tate duality for the Herr complexes. NT I Proposition 2.15, pp.32–34, then descends the local triangulation deformation quotient from the birational model to the tangent space of the closed trianguline locus. A global filtration on every original fibre without the exceptional locus is not this theorem.

**API.**

- `coadmissible_stageBaseChange / coadmissible_characterSheaf` give presentation independence and the coherent-sheaf comparison with their completeness and flatness hypotheses, using the imported analytic duality.
- `analyticIwahoriSystem / jacquetTransition_compact / jacquetTransition_contracts` construct the distribution modules and both hypotheses of the finite-slope coadmissibility criterion.
- `AnalyticFiniteSlope / analyticJacquet / analyticJacquet_coherent` give the finite-slope right adjoint, the locally analytic Jacquet functor and the coadmissible/coherent strong-dual comparison with independence of compact open subgroup.
- `TriangulineDeformation / triangulineDeformation_quotient / fixedWeightTrianguline_to_H1g` specify the Artin deformation subfunctor, its representing quotient under the endomorphism hypothesis and the noncritical fixed-weight tangent comparison.
- `FamilyTriangulation / exceptionalLocus / gradedCharacterLine` construct the proper birational model, coherent filtration and exceptional-locus comparison; retain the line-bundle twists and t-torsion error.
- `CompletedUnitaryForms / analyticJacquetSheaf` form the completed spaces at all p-levels, their locally analytic Jacquet module and its coherent strong dual on torus-character space.
- `UnitaryEigenvariety / weightMap / HeckePseudocharacter` take the relative Hecke spectrum of that sheaf and retain its actual weight and pseudocharacter maps.
- `classicalRefinedPoint / closedRealization` identify classical accessible refinements and their normalized characters inside the closed subspace of X_ps×T_n.
- `symPowerCharacterMap / symPowerPseudocharacterMap` send the ordered pair to the displayed symmetric monomials and intertwine the corresponding pseudocharacters.
- `triangulineTangent_injective` compares the tangent of this closed realization with the specified trianguline deformation problem; the displayed Selmer and noncriticality hypotheses imply weight-tangent injectivity. The construction uses the abstract PadicFamilies machine and AG2.3's existing restricted unitary instance where its hypotheses apply; the general Emerton/Jacquet comparison required here is additional. It is not inferred from the existence of a rigid space carrying a weight map.

For the tangent statement use the polarized deformation datum of NT I §2.10 and regular trianguline parameters δ at every p-place. Assume ρ is de Rham there, WD(ρ_v) generic at every v∈S, the triangulations noncritical with strictly increasing labelled weights, and `H¹_f(F⁺,adρ)=0`. Then the weight differential on `H¹_{tri,δ}(F_S/F⁺,adρ)` is injective, and its dimension is at most dim W. The kernel maps to the stated Bloch–Kato group. NT I Theorems 2.24 and 2.27 use this bound, classical-point density and the closed realizations to prove finite-slope and ordinary component propagation, respectively. The [propagation theorem](#eigenvariety-propagation) gives their eigencurve consequence.

**Checks.**

- For n=1 the character map is the singleton (1); for n=2 it is the original pair; for n=3 it is `(α²,αβ,β²)`.
- For α=1, β=−1, n=3 the first and last characters coincide, so 3-regularity fails.
- A critical refinement fails the strict weight hypothesis even when its representation is de Rham.
- Equal parameters have ratio 1, an excluded algebraic character; their flags are not asserted unique. In rank one there is a single full flag, so the subfunctor is the entire deformation functor.
- On GL₂ at diag(9,1), δ_B=1/9 and δ_B^{−1/2}=3, whereas the δ_B⁻¹ spectrum twist is 9; the two normalization steps differ.
- If the adjoint Selmer group is nonzero, the kernel argument no longer gives injectivity.
- A one-p-place varying family is not silently identified with the all-p-place construction.
- For a torus P=G, N=1 and J_P preserves an essentially admissible locally analytic representation; for a smooth supercuspidal GL₂ representation its proper-Borel Jacquet module is zero.
- The smooth comparison gives coinvariants; averaging invariants without the finite-slope step is not the same construction.
- For a finite-dimensional coefficient space, the identity is compact; on an infinite-dimensional Banach space the identity fails compactness. Finite slope therefore cannot manufacture coherence from an arbitrary continuous monoid action.
- A nonclosed image must be replaced by its closure in the Hausdorff quotient. Exactness only after this replacement is the property used in the transition factorization.
- If z does not contract one analytic stage, Proposition 4.2.28 cannot be applied; compactness of unrelated transitions is insufficient.
- In rank one the family filtration has a single character line. In higher rank the closed exceptional locus is retained even when classical triangulations form a dense set.

([Newton–Thorne I](#ref-newton-thorne-I), Proposition 2.11, p.30; construction §2.18.1, pp.36–39; Theorems 2.24, 2.27, pp.40–44; §2.22 and Theorem 2.33, pp.47–51, arXiv v3.)

*Needs:* TauCetiRoadmap.PadicFunctionalAnalysis §§1.4,2.2–2.6; TauCetiRoadmap.CompactOperators §§0.1,0.4–0.5,1.7; LocallyAnalyticDistributions §§0.0,0.2–0.3,3.3; TauCetiRoadmap.RigidAnalyticGeometry §7.3; PadicFamilies §§2a.10–2a.14, abstract finite-slope machine; SmoothRepresentationsOfLocalGroups, locally analytic vectors and normalized Jacquet operations at their stated scope; LocalGaloisDeformationRings, local deformations; GlobalGaloisDeformations, pseudocharacters; [accessible refinements](#accessible-regular-refinement); [adjoint Selmer vanishing](#enormous-adjoint-selmer); [C-GALOIS](#contract-c-galois). The analytic finite-slope/Jacquet and family-triangulation constructions just specified are owned here beyond the imported smooth scope. Their additional functional-analytic prerequisites are Emerton’s relative-compactness, distribution-algebra and coadmissibility comparisons in §§2 and 4.1–4.2, over the imported locally convex and operator foundations, and their local Galois prerequisites are the Robba/Herr theory of KPX §§2–5; these are part of the construction chain, not an assertion that a coarse smooth-representation layer already exports them. The local deformation subfunctor and its noncritical H¹_g comparison are the Nakamura/Hellmann–Schraen constructions just specified, as used in NT I Proposition 2.6 and Lemma 2.7; they are not imports from an unspecified eigenvariety owner.

<a id="unitary-level-raising-method"></a>
### 4.4 Unitary level raising and its odd-rank local types

Let E/F be CM and everywhere unramified, n≥1, ℓ a prime and ι fixed. Let w₀∤ℓ split over F; all ℓ-adic places of F split in E. Let π₁,π₂ be cuspidal conjugate-self-dual on GL_n(𝔸_E), with π=π₁⊞π₂ regular algebraic, ramification only at split places, and `π_{i,w₀}=St_n(ξ_i)` with ξ_i unramified and `ι⁻¹(ξ₁(ϖ)/ξ₂(ϖ))≡q_{w₀}^n mod m`. Require `r̄_{π,ι}` not a character twist of `1⊕ε̄⁻¹⊕⋯⊕ε̄^{1−2n}`. For a totally real quadratic F′/F split at w₀, put E′=EF′ and require the same exclusion after restriction to E′. Then a RACSDC Π on GL_{2n}(𝔸_E′) exists with the same **residual** representation, the same infinity infinitesimal character, a Steinberg twist at one w′₀|w₀ and ramification only at split places. Ordinary input gives ordinary output.

Use the definite inner form with local GL₂(D) at w₀. Its degeneracy-map injectivity follows from strong approximation; the quadratic extension makes the multiplicity positive. Compare the congruent Hecke eigensystems by the exact Jacquet–Langlands and endoscopic multiplicity formulas. The odd-rank construction is a separate assertion. Fix n=2k+1≥3, a CM field F with F/F⁺ everywhere unramified and [F⁺:ℚ] even, a prime p and an isomorphism ι. Fix a finite set S of split places containing all p-places, a unitary group compact at infinity and quasi-split at finite places, and the Hecke-character normalization of NT I §1. Let π₂ and π_{n−2} be cuspidal conjugate-self-dual representations with π=π₂⊞π_{n−2} regular algebraic and ι-ordinary. Choose disjoint nonempty T₁,T₂,T₃ outside S, all of odd residue cardinality, and require π unramified outside S∪T. Impose these separate local conditions:

- At v∈T₁, v is inert, q_v modulo p has order 6 and the residue characteristic exceeds n. Write π₂,v=St₂(χ_v) and π_{n−2,v}=⊞_{i=0}^{2k−2}χ_{v,i}, where χ_v and χ_{v,0} are unramified and every χ_{v,i} for i>0 restricts on units to the quadratic character ω_v. The conjugate-self-dual sign forces χ_v to be the nontrivial unramified quadratic character and χ_{v,0}=1.
- At v∈T₂, v splits, q_v modulo p has order 2, π₂,v contains the finite GL₂ type λ(Θ_v) for an order-p regular torus character, and π_{n−2,v} contains ω_v∘det.
- At v∈T₃, v splits, q_v modulo p has order n−2, π_{n−2,v} contains the finite GL_{n−2} type λ(Θ_v) of an order-p regular torus character, and π₂,v contains ω_v∘det.

Construct the finite types by Deligne–Lusztig induction with the actual character and parahoric data. For T₁ let k(v)_d be the degree-d extension of k(v), take the U₃ torus with `C(k(v))=ker(N_{k(v)_6/k(v)_3}:k(v)_6×→k(v)_3×)`, and choose θ_v:C(k(v))→ℂ× of order p and set λ(θ_v)=−R_C^{U₃}(θ_v). Its GL₃ counterpart uses the character z↦θ_v(z/z^c), where c is the q_v³-power involution of k(v)_6/k(v)_3. Inflate the product with the prescribed quadratic torus characters to the parahorics with U₃ or GL₃ Levi block. At T₂,T₃ the GL_d cuspidal type is (−1)^{d−1}R_{k_d×}^{GL_d}(Θ_v), with d=2 or n−2; inflate its product with ω_v∘det on the complementary block. These constructions retain both the lattices giving the mod-p congruence and their characteristic-zero constituents.

For every totally real quadratic L⁺/F⁺ split at S∪T, put L=L⁺F. NT I Theorem 4.1 gives a RACSDC Π on GL_n(𝔸_L), ordinary and unramified outside S∪T, with r̄_{Π,ι}≅r̄_{π,ι}|_{G_L}. At T₁ it contains the inflated GL₃ type just specified; at T₂,T₃ it contains the parahoric type with the respective d-block. Its proof first uses the T₂,T₃ types to restrict the possible isobaric partitions to [n] and [n−2,2] (Lemma 4.5). Quadratic base change and the multiplicity calculation of Proposition 4.6 supply a nonzero space of forms. Congruent integral type lattices and exactness of ordinary algebraic forms transfer the eigensystem. Finally the T₁ type forces a GL₃ supercuspidal support, incompatible with the second partition, so the output is cuspidal. Source: NT I §§1.8, 1.17, pp.16–20, Propositions 1.16 and 1.18–1.22, and §4 Theorem 4.1 and proof pp.59–66. For n=3, the T₃ block has dimension one: define its finite GL₁ type directly as the order-p character Θ_v of k(v)×, with sign (−1)⁰=1 and trivial Weyl group. Here q_v≡1 mod p supplies that character. Its local support comparison is local class field theory; the higher-dimensional Deligne–Lusztig statement of §1.17 is used only when d≥2. This supplies the rank-three boundary without applying Proposition 1.18 outside its stated range.

The congruence step reused by Clozel–Thorne III §6 is also part of this target. In Clozel–Thorne II §6 fix ℓ≥5 and a finite Galois K/ℚ, and assume SP_{ℓ−1}(K(ζ_ℓ)) as defined in its Conjecture 6.1. Theorem 6.2 applies to weight-zero ordinary RAESDC π on GL₂ over a totally real field, with irreducible r̄_{π,ι} containing a conjugate of SL₂(𝔽_{ℓ^a}), a>1, and a Steinberg place v where q_v is primitive modulo ℓ and r̄_{π,ι} is ramified. It makes Sym^ℓ r_{π,ι} automorphic. Proposition 6.3 supplies a congruent π′ and an auxiliary p>2(ℓ+2) for which these extra local conditions hold and existence of the symmetric-power lift is equivalent for π and π′. Its proof uses an auxiliary dihedral type of order t>ℓ² to exclude dihedral residual image, a finite list of fixed-level weight-zero forms, and Chebotarev to raise the level modulo p while excluding level raising for every member of that list modulo ℓ. Level lowering then forces residual ramification at v. Potentially Barsotti–Tate diagonalizability and polarized lifting transfer the symmetric-power automorphy across the p-congruence. Theorem 6.2 itself uses the ordinary residually reducible seed of §5, adequate constituents, cyclotomic avoidance and soluble descent. Thus this is a method for reaching a specially ramified seed, with its smaller-rank premise, rather than an unconditional ordinary lifting theorem. Source: Clozel–Thorne II, Theorem 6.2 and Proposition 6.3 with proofs, pp.345–349.

**Checks.**

- The output is residual matching, not equality with the characteristic-zero isobaric sum.
- At n=1 the local congruence is ξ₁/ξ₂≡q; this has the usual rank-two level-raising shape.
- If the excluded character-twist representation occurs, the discrete GL_{2n} output could be one-dimensional and the argument for cuspidality fails.
- The exclusion must be checked again after base change.
- For n=3 the T₃ type is an order-p GL₁ character and the T₁ complement has no ramified quadratic characters. For the odd construction n=7, the split block dimensions are 2 and 5; identifying T₂ and T₃ would discard one of the two independent support constraints.
- If p=2 or 3, no element modulo p has order 6, so the T₁ hypotheses cannot hold.
- The finite GL_d type has sign (−1)^{d−1}: it is −R for the d=2 block and +R for the d=5 block when n=7.
- In the Clozel–Thorne argument a=1 is excluded, and omitting residual ramification at v loses the required ℓ-unipotent element.

([Anastassiades–Thorne](#ref-at), Theorem 5.1 and proof, pp.19–20; the group-side Theorem 4.1, pp.14–18, arXiv v2; [Newton–Thorne I](#ref-newton-thorne-I), §4 pp.59–66; [Clozel–Thorne II](#ref-ct-2015), §6 pp.345–349.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, unitary transfer/multiplicity and Jacquet–Langlands at the stated inner forms; SmoothRepresentationsOfLocalGroups, normalized induction; [trace-classification inputs](#weighted-trace-classification-inputs); [residually reducible lifting](#residually-reducible-ordinary-lifting).

<a id="eigenvariety-propagation"></a>
### 4.5 Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2. E₀ the Coleman–Mazur eigencurve; construct the required definite-unitary E_n in [the method prerequisite target](#symmetric-power-method-prerequisites).


Check the ordinary variant: an ordinary refinement is automatically numerically non-critical, and Hida families replace eigencurve components.

([Newton–Thorne I](#ref-newton-thorne-I), §2, Theorem 2.33, pp. 50–51 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="buzzard-kilford-eigencurve"></a>
### 4.6 The tame-level-one 2-adic eigencurve near the boundary (Buzzard–Kilford)

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w).

p = 2, tame level 1.


Check the consequence used: every irreducible component of E₀ meets κ^{−1}(W₀(b)), so it contains some X_i.

([Newton–Thorne I](#ref-newton-thorne-I), §3, Theorem 3.2, pp. 53–54 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="level-one-ping-pong"></a>
### 4.7 Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.


Check the key numerical identity v₂(α) + v₂(β) = k − 1 for the two roots of X² − a₂X + 2^{k−1}, which gives i + i′ = (k − 1)/v₂(w).

([Newton–Thorne I](#ref-newton-thorne-I), §3, Theorem 3.1, p. 53; Introduction pp. 3–4 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="steinberg-level-raising"></a>
### 4.8 Level raising to Steinberg for symmetric powers of theta series (NT I Theorems 4.1, 6.1, 7.1)

Fix K=ℚ(i) and σ₀, the unique cuspidal newform of level Γ₁(4) and weight 5, obtained by automorphic induction of the unramified Hecke character of K of infinity type (4,0). Let n≥3, let p be a prime with p≡1 (mod 48·n!), choose ι : Q̄_p≅ℂ, and let q≠p be a prime. Let X₀ be a finite set of places of K prime to 2pq, and let ω : G_K→Q̄_p^× be de Rham with ωω^c=ε³ and unramified at X₀. Then there is a soluble CM extension F/K, split at X₀, and a RACSDC ι-ordinary Π on GL_n(𝔸_F), with r̄_{Π,ι}≅ω̄^{n−1}|G_F⊗Sym^{n−1}r̄_{σ₀,ι}|G_F and HT_τ(r_{Π,ι})=HT_τ(ω^{n−1}|G_F⊗Sym^{n−1}r_{σ₀,ι}|G_F), and Π_v an unramified Steinberg twist at some v|q. NT I Theorem 7.1 uses Proposition 7.4 for odd n and Anastassiades–Thorne for even n. The matching is residual; it does not identify the characteristic-zero lift with the reducible theta-series symmetric power.

The fixed K=ℚ(i), weight-five level-four σ₀, primes p and q, embedding ι, X₀ and ω are the data in Theorem 7.1. No arbitrary imaginary-quadratic theta seed or prior congruence with a level-one form is a hypothesis.


Check that a character-zero isomorphism to the reducible theta symmetric power would contradict cuspidality/irreducibility here, while residual matching does not. Check the arithmetic condition p ≡ 1 (mod 48·n!) on a small case: for n = 3, 48·3! = 288 and p = 577 is a prime ≡ 1 (mod 288).

([Newton–Thorne I](#ref-newton-thorne-I), §7, Theorem 7.1 and the fixed seed, pp. 82–83; §4 Theorem 4.1, pp. 59–60; §6 Theorem 6.1, pp. 75–76 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="one-level-one-symmetric-power"></a>
### 4.9 One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.


Check that the strategy uses small residual image and large p, in contrast to Clozel–Thorne's large image and small p.

([Newton–Thorne I](#ref-newton-thorne-I), §7, Theorem 7.6, p. 90; Introduction p. 4 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="n-regular-congruences"></a>
### 4.10 Congruences to n-regular forms (NT I Proposition 8.3)

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.


Check the numerical bound p > (n − 1)k: it keeps Sym^{n−1} of the residual representation in the Fontaine–Laffaille range.

([Newton–Thorne I](#ref-newton-thorne-I), §8, Proposition 8.3, pp. 92–93 (arXiv v3).)

*Needs:* [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="symmetric-power-automorphy-lifting"></a>
### 4.11 Automorphy lifting for symmetric powers (NT II Theorem 2.1)

Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power.

All hypotheses in the statement, including weight two, non-CM and nonordinarity for BOTH π and π′. The projective image is a subgroup of PGL₂(F̄_p); the sandwich uses one embedded finite field and one conjugation.


Check that the theorem avoids killing the dual Selmer group of Sym^{n−1}r̄, which fails when p ≤ n.

([Newton–Thorne II](#ref-newton-thorne-II), §2, Theorem 2.1 and proof, pp. 5–6 (arXiv v2).)

*Needs:* [The finite-field projective image condition](#projective-image-sandwich); [The local symmetric-power method prerequisites](#symmetric-power-method-prerequisites); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="level-one-symmetric-powers"></a>
### 4.12 Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)

For every n ≥ 2 and every regular algebraic cuspidal automorphic representation π of GL₂(𝔸_ℚ) of level 1, Sym^{n−1}π exists as a regular algebraic cuspidal automorphic representation of GL_n(𝔸_ℚ).

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2. π everywhere unramified.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_levelOne`.

n = 2 is trivial; for n ≥ 3 combine one-level-one-symmetric-power with level-one-ping-pong, then symmetric-power-lifting (Galois criterion).

Check on Δ (weight 12, level 1): Sym^{n−1}Δ exists for every n, so L(Sym^{n−1}Δ, s) is entire.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, Theorem A, p. 2; §7, Theorem 7.7, p. 91 (arXiv v3).)

*Needs:* [One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)](#one-level-one-symmetric-power); [Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)](#level-one-ping-pong); [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="cm-and-weight-one-symmetric-powers"></a>
### 4.13 Symmetric powers of CM and weight-one forms (NT II Theorem A.1)

Let π be cuspidal on GL₂(𝔸_ℚ) with π_∞ a holomorphic limit of discrete series, or π the automorphic induction of a Hecke character of a quadratic field. Then Sym^nπ exists for every n ≥ 1 (usually not cuspidal).

π as stated.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_CM_weightOne`.

CM case: decompose Sym^n of a quadratic induction into quadratic inductions of characters and, in even degree, its middle character. The non-CM weight-one case has finite Artin image. For a dihedral projective image use the same quadratic-induction decomposition. For tetrahedral or octahedral projective image, first enlarge the scalar centre by the finitely many square roots of the determinant values. The resulting finite matrix group contains the binary tetrahedral or octahedral subgroup in SL₂ and is its central product with the enlarged scalar centre. Extend ρ by scalar multiplication, decompose there, and restrict back to H; this also covers central extensions which were not themselves the binary groups. Classify the binary-polyhedral irreducibles with their central character: in the tetrahedral case the dimensions are 1,1,1,2,2,2,3, and in the octahedral case 1,1,2,2,2,3,3,4, before adding the scalar centre. Every constituent of dimension three is a character twist of Sym²ρ; the dimension-four octahedral type is a character twist of Sym³ρ. Check these identifications on the finite conjugacy classes; the square sums are 24 and 48. With a larger scalar centre the ratio of the required scalar character and that of the displayed expression is trivial on the intersection of the centre with the derived group, so it extends to the abelianization. Use that character, rather than choosing a square root of det ρ. Rank-one constituents use class field theory, rank-two constituents use the solvable two-dimensional Artin theorem, and the dimension-three/four expressions use §§1.13 and Gelbart–Jacquet. Thus no higher-dimensional general solvable Artin theorem is being assumed. For the icosahedral case the following finite-group construction supplies the arbitrary-degree step; it supplies the finite-image step without an additional quintic-induction theorem.

For H=im ρ with projective image A₅, its derived group is B≅SL₂(𝔽₅), its scalar center is μ₂ₘ, and H=(B×μ₂ₘ)/⟨(−1,−1)⟩. Prove this by taking determinants on [H,H], using the perfectness of A₅ and its non-split double cover; H/B is detected by det ρ. An irreducible H-module is an irreducible B-module together with a scalar character whose value at −1 equals that B-module's central sign. Construct this correspondence by restriction and the central-product quotient. On B the nine irreducibles are
`1, τ, τ′, Sym²τ, Sym²τ′, Sym³τ, τ⊗τ′, Sym⁴τ, τ⊗Sym²τ′`,
of dimensions `1,2,2,3,3,4,4,5,6`. Verify their characters on the nine conjugacy classes and use the sum of squares 120 for completeness. The two 4-dimensional modules have opposite central signs. In particular the 6-dimensional module has central sign −1; the +6 at −I in Wang's displayed table on p.5 is inconsistent with the tensor description on p.6 and must not be propagated.

Choose a cyclotomic automorphism σ which interchanges τ and τ′ and acts on μ₂ₘ by ζ↦ζ^a. The odd integer a is a unit modulo 2m. Then ρ^σ is a representation of the same abstract H and is automorphic by coefficient conjugation of the weight-one eigenform and Deligne–Serre. The nine modules above extend to the corresponding expressions in ρ and ρ^σ. Their scalar exponents b are respectively `0,1,a,2,2a,3,1+a,4,1+2a`. Every irreducible constituent of Sym^nρ has scalar exponent n and one of these B-types. Its central parity gives n−b even, so solve `2k≡n−b (mod 2m)` and twist the appropriate expression by (det ρ)^k. This is an explicit finite character calculation for every n; it never requires a square root of the determinant character. Sym⁵ρ, for example, is `ρ⊗Sym²ρ^σ⊗(det ρ)^{2−a}`.

The expressions of dimensions at most five are automorphic by Gelbart–Jacquet and §§1.13–1.14; the other 4-dimensional type uses the GL₂×GL₂ transfer, and the 6-dimensional type uses GL₂×GL₃. Class field theory supplies all determinant twists. Thus the finite direct-sum decomposition gives the required isobaric lift in every degree, with the same all-place local parameters as those operations. For an irreducible finite-image constituent, Brauer induction and the nonvanishing of nontrivial finite-order Hecke L-functions at 1 make its Rankin–Selberg self-pairing have a simple pole; the isobaric pole-order formula then makes its lift cuspidal. This is Wang's alternative proof, Proposition 3.1 and Theorem D, pp.12–14. It does not assert cuspidality of every Sym^nρ.

**API.** `icosahedralCentralProduct / centralProductIrrep / icosahedralIrrepBasis` construct H's quotient description, its parity-compatible irreducibles and the character basis; `symPower_centralDecomposition` computes the multiplicities and determinant twists; `symPower_CM_weightOne` assembles their isobaric automorphic lifts.

**Checks.**

- In the CM quadratic induction, Sym² has the quadratic-induced square-character term and the middle character; it is not cuspidal.
- The nine B-dimensions have square sum 120, the two dimension-four central signs differ, and the dimension-six central sign is −1. A dimension-only list or a list with the table's erroneous +6 fails these tests.
- For m=1 the allowed scalar characters are fixed by parity; for m=2 an odd scalar exponent has no character square root compatible with an even B-type; changing n by 2 shifts the determinant twist by one. These test the central-product quotient and congruence solver.
- Sym⁰ρ is trivial, Sym⁵ρ is the twisted irreducible dimension-six tensor above, and Sym⁶τ restricts to `Sym²τ′⊕(τ⊗τ′)`, of dimensions 3+4. An algorithm declaring every symmetric power irreducible fails in degree six.
- On a scalar ζ, every computed constituent of Sym^nρ acts by ζ^n; the multiplicity sum weighted by dimensions is n+1; the sum of its characters equals the symmetric-power character on each of the nine B-classes. These are checks for arbitrary n, not just the first five degrees.

([Newton–Thorne II](#ref-newton-thorne-II), Appendix A, Theorem A.1 and proof, p.28, arXiv v2; [Wang](#ref-wang-icosahedral), §1 Proposition 1.1 and Corollaries 1.2–1.3, pp.5–8, and Proposition 3.1/Theorem D and their proofs, pp.12–14, arXiv v3. The reduction is credited there to Kim's non-normal quintic induction paper; no proof of the quintic induction itself is required here.)

*Needs:* [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); [GL₂ tensor product](#ramakrishnan-tensor-product); [GL₂×GL₃ and symmetric cube](#kim-shahidi-sym3); [symmetric fourth](#kim-sym4); TauCetiRoadmap.ClassFieldTheory; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="l-function-equidistribution-criterion"></a>
### 4.14 Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)

Let K be a compact group with conjugacy-class space X, and let x_i ∈ X have integer norms N(x_i) ≥ 2. Assume ∏(1 − N(x_i)^{−s})^{−1} converges absolutely for Re s > 1 and continues to a neighbourhood of Re s ≥ 1 with no zeros or poles except a simple pole at 1, and for each irreducible ρ, L(s, ρ) = ∏ det(1 − ρ(x_i)N(x_i)^{−s})^{−1} converges absolutely for Re s > 1 and continues likewise with no zeros or poles on Re s ≥ 1 except possibly at 1. Then #{i : N(x_i) ≤ n} ~ n/log n and Σ_{N(x_i)≤n}χ(x_i) = c(χ)n/log n + o(n/log n), with −c(χ) the order of vanishing of L(s, ρ) at 1. If at most boundedly many x_i share a norm, enumerate them in nondecreasing order of norm. This ordered sequence is Haar-equidistributed iff c(χ) = 0 for every nontrivial irreducible χ (Peter–Weyl/Weyl criterion). The norm-cutoff asymptotic does not assert equidistribution of every reordering.

K a compact group (a compact Lie group in the application); ρ irreducible continuous representations.

State the resulting comparison as `TauCeti.SymmetricPower.equidistributed_of_lFunctions`.

Prime-number-theorem argument for each L(s, ρ): logarithmic derivative, Wiener–Ikehara (AnalyticNumberTheory AN.2), Kedlaya Theorem 24.2. Peter–Weyl: finite linear combinations of irreducible characters are dense in the continuous class functions; orthogonality gives the integrals.

**Checks.**

- For the trivial character, the simple pole has c(1)=1 and recovers the counting asymptotic n/log n, rather than zero.
- For K=C₂, the nontrivial character takes values +1 and −1. Its c(χ)=0 forces each class to have asymptotic proportion 1/2, recovering the Chebotarev instance of Kedlaya §22.5.
- If at most M terms share a norm, cutting a norm-ordered sequence partway through a tie changes a character sum by at most M·dim ρ. After division by the number of terms this tends to zero. An arbitrary reordering has no such bound, so the norm-order hypothesis is essential for this deduction.

([Notes on analytic number theory](#ref-kedlaya-ant-2025), §§24.1–24.3, Theorem 24.1, Theorem 24.2 and Conjecture 24.3, printed pp. 133–134.)

*Needs:* AnalyticNumberTheory, Layer AN.2; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6; `Matrix.trace`; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="one-prime-criterion"></a>
### 4.15 One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)

Let F be totally real and π a non-CM RAESDC automorphic representation of GL₂(𝔸_F) (π ≇ π ⊗ (χ ∘ det) for every non-trivial Hecke character χ), and n ≥ 1. The following are equivalent: (1) there is a cuspidal Π of GL_n(𝔸_F) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v; (2) for every prime p and ι : Q̄_p ≅ ℂ, Sym^{n−1} r_{π,ι} is automorphic; (3) for some p and ι, Sym^{n−1} r_{π,ι} is automorphic ([Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate)).

F totally real; π non-CM RAESDC.

State the resulting comparison as `TauCeti.SymmetricPower.onePrime`.

Newton–Thorne Lemma 2.1 uses Clozel Theorem 3.13: a regular algebraic cuspidal π has a finite part defined over a number field, and σπ_f is the finite part of a regular algebraic cuspidal representation with σ-conjugated infinity type. Changing ι can therefore replace π by σπ. Compare compatible Frobenius traces and use Chebotarev; fixing π while changing ι is not automatic.

Reduces symmetric power functoriality to automorphy of a single Galois representation.

([Newton–Thorne, Hilbert](#ref-nt-2026), Lemma 2.1, §2, p. 9; proof pp. 9–10 (arXiv v2); [Clozel](#ref-clozel-1990), Theorem 3.13, p. 112, proof pp. 112–129.)

*Needs:* [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate); [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; TauCetiRoadmap.Chebotarev, Layer 10; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="large-residual-image-density-one"></a>
### 4.16 Large residual image for a density-one set of primes (Clozel–Thorne, Lemma 7.5)

Let E be an imaginary CM field and π a RACSDC automorphic representation of GL₂(𝔸_E) with Sym²π cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all l ∈ L and ι : Q̄_l ≅ ℂ, r̄_ι(π) is irreducible with image containing a conjugate of SL₂(F_l).

E imaginary CM; π RACSDC with Sym²π cuspidal.

State the resulting comparison as `TauCeti.SymmetricPower.largeImage`.

Irreducibility of r_ι(π) for density-one l ([Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one)) and the classification of subgroups of GL₂(F_l) (large image unless dihedral/exceptional, excluded by Sym²π cuspidal and potential diagonalizability inputs of BLGGT).

Used for the adequacy hypotheses in Proposition 7.6.

([Clozel–Thorne III](#ref-ct-2017), §7, Lemma 7.5 and proof, manuscript p. 48.)

*Needs:* [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="completed-symmetric-power-l-function"></a>
### 4.17 The completed symmetric power L-function Λ(Sym^n E, s)

For an elliptic curve E/ℚ and n ≥ 1, Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s), where L(Sym^n E, s) = ∏_p L_p(Sym^n E, s) is the Euler product of the local factors of Sym^n of the Weil–Deligne representation at p (at all p, including the bad ones), N_n is the conductor of Sym^n, and γ_n(s) is the archimedean factor of Sym^n of the Hodge structure of E (a product of Γ_ℂ(s − j) and, for n even, a Γ_ℝ factor), as in Dummigan–Martin–Watkins (2009). Removing the nowhere-vanishing entire factor N_n^{s/2} does not affect entireness but changes the functional equation's normalisation.

E/ℚ an elliptic curve; n ≥ 1.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.completedL`: Λ(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_eq`: Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_entire_iff`: Λ(Sym^n E, s) is entire iff N_n^{−s/2}Λ(Sym^n E, s) is (the conductor factor never vanishes).
- `TauCeti.SymmetricPower.completedL_eq_automorphic`: If Sym^nπ_E exists, Λ(Sym^n E, s) = Λ(Sym^nπ_E, s − n/2) (with the unitary normalisation shift).

Local factors from the Weil–Deligne representation of Sym^n(H¹(E)) (Grothendieck's ℓ-adic monodromy). Archimedean factor from [PotentialModularityAndCompatibleSystems §R24.5, system L-functions](../PotentialModularityAndCompatibleSystems/README.md) applied to Sym^n of the compatible system of E. Use Dummigan–Martin–Watkins §§2–3 for finite factors and conductors, and Martin–Watkins §4.2 for the real factor. At n=2 the conjugation sign on the middle line and the degree shift give Γ_ℝ(s)Γ_ℂ(s).

**Checks.**

- n = 1: Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s).
- n = 0: Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s), not entire.
- For n=2, γ₂(s)=Γ_ℝ(s)Γ_ℂ(s). Complex conjugation exchanges e and ē on H¹; it fixes the symmetric vector eē on the (1,1) line, so the middle sign is +1. Relative to (−1)¹ this selects Γ_ℝ(s−1+1)=Γ_ℝ(s). The exchanged (2,0),(0,2) pair supplies Γ_ℂ(s).
- Omitting a ramified Euler factor changes the completed function. For the modified expression no functional equation with the specified conductor and epsilon factor is guaranteed; agreement away from bad primes does not identify Λ.

For n = 1, Λ(Sym¹E, s) = N^{s/2}Γ_ℂ(s)L(E, s).

([Newton–Thorne II](#ref-newton-thorne-II), §1 Introduction, Corollary B, arXiv v2 p. 2 (Publ. IHÉS 134, p. 118); [Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](#ref-dmw-2009), §§2–3, PDF pp.4–7 (printed pp.1314–1317); [Symmetric powers of elliptic curve L-functions](#ref-martin-watkins-2006), §4.2, PDF p.7.)

*Needs:* [PotentialModularityAndCompatibleSystems §R24.5, system L-functions](../PotentialModularityAndCompatibleSystems/README.md); [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); [C-SYSTEM](#contract-c-system).

<a id="parallel-weight-and-clozel-purity"></a>
### 4.18 Parallel weight and the imaginary-quadratic consequence of purity

Let F be a number field and π a regular algebraic representation of GL₂(𝔸_F) of weight λ = (λ_{τ,1} ≥ λ_{τ,2})_τ. π has parallel weight if λ_{τ,1} − λ_{τ,2} is independent of τ, equivalently if π has a regular algebraic twist of weight (m − 1, 0)_τ for some m ≥ 1; it has parallel weight k ≥ 2 if that twist has weight (k − 2, 0)_τ. Clozel's purity lemma: for F imaginary CM and π cuspidal regular algebraic on GL₂(𝔸_F), λ_{τ,1} + λ_{τc,2} = w is independent of τ, so π is of parallel weight when F is imaginary quadratic (BCGNT §1.6).

F a number field (CM for the purity lemma); π regular algebraic.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.IsParallelWeight`: For an actual weight function λ:Hom(F,ℂ)→ℤ², the difference λ_{τ,1}−λ_{τ,2} is independent of τ. The Lean form is over any embedding-index type; attachment to π is supplied by AF.4.
- `TauCeti.SymmetricPower.parallelWeight`: At an embedding τ define k=λ_{τ,1}−λ_{τ,2}+2. For dominant weights k≥2; under IsParallelWeight it is independent of the chosen embedding.
- `TauCeti.SymmetricPower.IsParallelWeight.twist`: Adding the same algebraic character weight a_τ to both coordinates at τ preserves the weight-difference predicate, in both directions.
- Import the purity identity from AutomorphicFormsOnReductiveGroups §5.5; do not redeclare it here. The new theorem is the weight-difference consequence in the following item.
- `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic`: F imaginary quadratic ⇒ every cuspidal regular algebraic π on GL₂ has parallel weight.
- `TauCeti.SymmetricPower.parallelWeight_independent`: If the actual weight function is parallel, k computed at τ equals k computed at σ.

Definition by the weight λ; purity lemma: Clozel 1990, Lemme 4.9, pp. 144–145 (also stated before Theorem 3.13 on p. 112; supplier: AutomorphicFormsOnReductiveGroups §5.5). In the normalization above, its motivic purity weight is w+1 for GL₂. This is an archimedean weight identity; finite-place Ramanujan bounds require [the symmetric-power purity argument](#purity-from-symmetric-powers). For an imaginary quadratic field, write the two equal cross-sums λ_{τ,1}+λ_{τc,2}=λ_{τc,1}+λ_{τ,2}; subtraction gives equality of the two weight differences. For a general CM field this proves equality within each conjugate pair, rather than equality between all pairs.

**Checks.**

- On the one-element embedding-index type, every weight function has constant difference.
- The weight function (0,0) on two embeddings is parallel and has k=2. The elliptic-curve comparison requires its actual attached weight, not a supplied equality assumption.
- On two embeddings, weights (0,0) and (2,0), corresponding to Hilbert weights (2,4), fail the parallel predicate.
- For conjugate embeddings with weights (2,0) and (3,1), both cross-sums equal 3 and both differences equal 2, giving parallel weight k=4. The pure weights need not agree coordinate by coordinate.
- On two distinct conjugate pairs, weights (0,0),(0,0) and (1,−1),(1,−1) have common cross-sum 0 but differences 0 and 2. The purity identity alone does not force parallel weight over a higher-degree CM field.

Every cuspidal regular algebraic Bianchi π (F imaginary quadratic) has parallel weight.

([BCGNT](#ref-bcgnt-2025), Definition 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation, arXiv v3 p. 13 (= Definition 1.5.1, §1.5, published p. 11: arXiv numbering and pagination differ); [Clozel](#ref-clozel-1990), Lemme 4.9 and proof, pp. 144–145.)

*Needs:* AutomorphicFormsOnReductiveGroups, Layer AF.4; AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (regular algebraic of weight); [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="purity-from-symmetric-powers"></a>
### 4.19 Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)

Let R be a very weakly compatible system of rank 2 of G_F with H_τ = {0, m} for all τ, and v₀ ∉ S a finite place. If for infinitely many n ≥ 1 there is a finite Galois F_n/F such that Sym^{n−1}R|_{F_n} is weakly automorphic of level prime to the places above v₀, then the roots α₁, α₂ of Q_{v₀}(X) satisfy |ια_i|² = q_{v₀}^m for every ι.

State the resulting comparison as `TauCeti.SymmetricPower.purity_of_symPowers`.

Jacquet–Shalika bound for the unitary cuspidal constituents of the weakly automorphic Sym^{n−1}R|_{F_n} at places above v₀ (AutomorphicLFunctionsAndLocalFactors AL.2/jacquet-shalika-satake-bound): |α|^{n−1} ≤ q^{(n−1)m/2 + 1/2} for infinitely many n, hence |α|² = q^m (using det).

The mechanism of [Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)](#symmetric-power-functoriality-implies-ramanujan) in the potential setting.

([BCGNT](#ref-bcgnt-2025), Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, arXiv v3 p. 58 (published p. 52; arXiv pagination differs).)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound); PotentialModularityAndCompatibleSystems, Layer R24.5:operations; [C-SYSTEM](#contract-c-system).

<a id="non-supercuspidal-symmetric-powers"></a>
### 4.20 Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)

Let π be a non-CM regular algebraic cuspidal π of GL₂(𝔸_ℚ) such that π_l has nonzero Jacquet module for every prime l. Then for every n ≥ 3, Sym^{n−1}r_{π,ι} is automorphic, so Sym^{n−1}π exists. In particular (Corollary C) for a semistable elliptic curve E/ℚ and each n≥1 the completed Λ(Sym^nE, s) is entire.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_of_not_supercuspidal`.

Proposition 8.2 (all ramified refinements n-regular) by induction on the number of ramified primes, reducing ramification along l-adic eigencurves (eigenvariety-propagation) down to level one (level-one-symmetric-powers). General π: n-regular-congruences gives π′ satisfying 8.2 with r̄_{π,ι} ≅ r̄_{π′,ι} and large image; pd-automorphy-lifting (BLGGT Theorem 4.2.1) transfers automorphy of Sym^{n−1}r_{π′,ι} to Sym^{n−1}r_{π,ι}. Corollary C: semistable E is modular (BCDT, Wiles) with Γ₀(N), N squarefree, so every π_l is unramified or Steinberg; Λ(Π, s) is entire for cuspidal Π (Godement–Jacquet, AL.2).

Check that Γ₀(N) with N squarefree gives only unramified or Steinberg π_l, never supercuspidal.

([Newton–Thorne I](#ref-newton-thorne-I), §8, Theorem 8.1, p. 91; Introduction, Theorem B and Corollary C, p. 2 (arXiv v3).)

*Needs:* [Congruences to n-regular forms (NT I Proposition 8.3)](#n-regular-congruences); [Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)](#eigenvariety-propagation); [Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)](#level-one-symmetric-powers); [potentially diagonalizable lifting](#polarized-pd-lifting); [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bcgnt-potential-automorphy-det-cyclotomic"></a>
### 4.21 Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 1) and det r_λ = ε^{−m}. Then R is pure of weight m, and for each n ≥ 1 there is a finite CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is automorphic. For m = 1 the argument simplifies to ACC+ Corollary 7.1.12 (Remark 6.2.2). Here automorphic has BCGNT Definition 6.1.2(2): all finite v outside S are unramified and match the common characteristic polynomial. Matching at the bad places is a separate requirement.

State the resulting comparison as `TauCeti.SymmetricPower.bcgnt_detCyclotomic`.

Theorem 6.2.4 supplies weak automorphy of arbitrarily high symmetric powers with a chosen good place kept unramified. Lemma 6.1.3 gives purity. Lemma 6.1.4 uses Chebotarev and Varma Theorem 1 to match at every v outside the original bad set S: purity makes the unramified principal series irreducible. This is automorphic in Definition 6.1.2(2), not a claim of full Weil–Deligne matching at bad places or strict compatibility there.

The heart of BCGNT's Theorem C.

([BCGNT](#ref-bcgnt-2025), Theorem 6.2.1 and proof, Remark 6.2.2, §6.2, arXiv v3 pp. 59–60 (published p. 53); ACC+ inputs also in the proof of Theorem 7.1.1, arXiv p. 69 (published p. 61).)

*Needs:* [Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)](#potential-weak-automorphy-symmetric-powers); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers); AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="clozel-thorne-reductions"></a>
### 4.22 Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1

Let F be totally real, π a non-CM RAESDC representation of GL₂(𝔸_F), p≥5 prime and 0<r<p. Newton–Thorne Proposition 6.1 produces a soluble totally real E/F, ι:ℚ̄_p≅ℂ and RAESDC π′ on GL₂(𝔸_E) with all eight conditions: (1) Sym^{p+r−1}r_{π,ι} is automorphic exactly when Sym^{p+r−1}r_{π′,ι} is; (2) π′ has weight 0 and at each v|p is an unramified twist of Steinberg, hence ι-ordinary; (3) det r_{π′,ι}=ε⁻¹; (4) at some v₀, q_{v₀}≡−1 mod p and π′ is tamely dihedral of order p; (5) at some v₁, q_{v₁}≡1 mod p and π′ is an unramified twist of Steinberg; (6) π′_v is potentially unramified for v∤pv₁; (7) there are primes t₁,t₂>p^{a₀(p)} and places w₁,w₂ of residue characteristics p₁,p₂>3, unramified in E, such that π′_{wᵢ} is tamely dihedral of order tᵢ and p₁,p₂,t₁,t₂ are pairwise distinct; (8) let H/E be the ray class field of modulus (8) times all real places, and let S exclude w₁,w₂ and include the primes where π′ is ramified, where E/ℚ is ramified, or whose characteristic is 2 or 3. Then w₁ splits in H·E(S), and w₂ splits in H·E(S∪{w₁}). Here E(S) is the maximal abelian exponent-two extension unramified outside S, as in §5, p. 38; a₀(p)≥3 is a threshold with the adequacy property of Lemma 2.3, p. 11. None of these local conditions is replaced by potential diagonalizability.

For a fixed degree d≥1, Clozel–Thorne Theorem 7.1 assumes symmetric-power automorphy for every non-CM RAESDC GL₂ representation over F, and concludes a cuspidal GL_{d+1} lift for every non-CM cuspidal π essentially square-integrable at infinity. Its local comparison is at every finite place. This yields the analytic continuation and functional equation of its symmetric-power L-function.

Lemma 7.4 starts with such π and a quadratic imaginary CM E/F for which π_E is cuspidal. It produces a continuous Hecke character χ making π_E⊗χ RACSDC. After a unitary normalization, its infinity type is (z/|z|)^{m_τ}, with p_v+m_τ odd and χχᶜ=ω_π⁻¹∘N_{E/F}; χ itself need not be algebraic. Proposition 7.6 assumes degree-d automorphy for all non-CM RAESDC GL₂ representations over F and concludes it for every non-induced RACSDC GL₂ representation over E. Its proof chooses ℓ>2(d+2), split in E and unramified in the field and representation, with residual image containing a conjugate of SL₂(𝔽_ℓ) and Hodge span at most ℓ−2. A finite character φ makes r̄(Π)⊗φ invariant under complex conjugation and supplies an odd extension to G_F. The potentially diagonalizable lifting and soluble descent theorems then apply to that representation. For discrete-series infinity, non-CM induction is equivalent to a cuspidal symmetric square.

State the resulting comparison as `TauCeti.SymmetricPower.clozelThorne_reductions`.

Soluble base change and descent (EndoscopicTransferAndUnitaryTraceComparison ET.7a; PotentialAutomorphyInfrastructure Layer 2); BLGGT Theorem 4.2.1 (PL.5/pd-automorphy-lifting) and Theorems 4.4.1, 5.5.2 ([Change of weight and level (Theorem 4.4.1)](#change-of-weight-and-level), [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one)). Moret-Bailly to realise the local conditions at v₀, v₁ over a soluble extension.

Every symmetric-power endpoint over totally real or CM fields uses one of these reductions.

([Newton–Thorne, Hilbert](#ref-nt-2026), Proposition 6.1, §6, pp. 45–46; proof pp. 46–49 (arXiv v2); also proof of Theorem 6.5, p. 50; [Clozel–Thorne III](#ref-ct-2017), §7, Lemma 7.4, manuscript p. 47; [Clozel–Thorne III](#ref-ct-2017), §7, Proposition 7.6 and proof, manuscript p. 49; [Clozel–Thorne III](#ref-ct-2017), Theorem 7.1, manuscript p. 46; Lemma 7.4 and proof, pp. 47–48; Proposition 7.6 and proof, p. 49.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons; [polarized lifting](#polarized-lifting-extensions); [Change of weight and level (Theorem 4.4.1)](#change-of-weight-and-level); [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="tensor-functoriality-lifting"></a>
### 4.23 Tensor-product functoriality lifting over totally real fields

Let F be totally real, r≥1, p any prime, and π,π′ on GL₂ and σ on GL_r be RAESDC. Assume π,π′ have weight zero and are non-CM; `r̄_π≅r̄_π′`; `r̄_π(G_F)` contains a conjugate of SL₂(𝔽_{p^a}) with p^a>5. At every v|p require the same ordinary status and the same potentially crystalline status for both, and if p=2 require both potentially crystalline. At v∤p require Steinberg-twist status to agree. Require a perfect subgroup H of `(r̄_π⊗r̄_σ)^{ss}(G_F)` containing an element with 2r distinct eigenvalues; labelled HT(r_σ)={0,2,…,2r−2}; automorphy and strong irreducibility of `r_π⊗r_σ`; irreducibility of `r_π′⊗r_σ`. Then the latter tensor product is automorphic.

This is the exact functoriality-lifting input of NT Hilbert Theorem 4.1, pp.25–26. Its proof patches at both the rank-two and rank-2r levels with the tensor map between their deformation rings; the p=2 proof uses the modified Khare–Wintenberger argument in pp.35–36. The perfect subgroup condition persists after soluble base change and is not merely a cardinality bound.

The twisted-tensor application is NT Hilbert Theorem 5.9, pp.44–45. For p≥5, 0<r<p, M>p^{a₀(p)}, assume SP_{r−1},SP_r,SP_{r+1}, and take **all** local conditions (1)–(8) of [the reduction target](#clozel-thorne-reductions), with t₁,t₂>M and the same ray-class splitting conditions. Then the p-residual image contains SL₂(𝔽_{p^a}) with p^a>M, and `ϕ_p r_π⊗Sym^{r−1}r_π` is the realization of an ordinary RAESDC representation on GL_{2r}; ϕ_p acts on coefficients as an arithmetic Frobenius lift. First Theorem 5.5 proves it using the stronger all-primes residual-image condition; Theorem 5.9 supplies that condition from the two good-dihedral places. The induction step must use this theorem with its neighboring SP hypotheses, not assume arbitrary tensor-product functoriality.

**Checks.**

- At r=1, HT(r_σ)={0} and the tensor rank is two.
- At r=2, `{0,1}+{0,2}={0,1,2,3}`, so the resulting weight is zero; replacing σ-weights by {0,1} gives repetitions.
- At p=2 the field-size bound can hold over 𝔽₈, but the extra potentially crystalline condition remains.
- A subgroup with nontrivial abelianization is not automatically perfect.
- The coefficient twist ϕ_p is not evaluation of a Galois representation at a Frobenius element.

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem 4.1 and proof, pp.25–36; Theorem 5.5 pp.40–41; Theorem 5.9 pp.44–45, arXiv v2.)

*Needs:* [symmetric-power lifting](#symmetric-power-automorphy-lifting); DeformationAndDerivedPatchingAlgebra, patching supports; LocalGaloisDeformationRings, tensor morphisms and components; GL2ModularityLifting, local weight-zero lifting; [C-GALOIS](#contract-c-galois); the ray-class constructions of [the reduction target](#clozel-thorne-reductions).

<a id="acc-purity-rank-two"></a>
### 4.24 Purity and analytic continuation for rank-two systems of weight zero over CM fields (ACC+, Corollary 7.1.13)

ACC+ Corollary 7.1.13: for a CM field F and an irreducible rank-2 very weakly compatible system R with H_τ={0,1}, R is pure of weight 1. For every m≥0 the partial symmetric-power L-function has meromorphic continuation and the completed function with the stated degree≤m+1 bad factors satisfies a functional equation. If R is strongly irreducible and m>0, then L^S(ι Sym^m R,s) is holomorphic and nonzero for Re s≥1+m/2. The m=0 function has the Dedekind-zeta pole at s=1; it is not covered by nonvanishing/holomorphy. The non-CM elliptic-curve specialization supplies Sato–Tate with its compact-group criterion.

F CM; R irreducible of rank 2 with Hodge–Tate numbers {0, 1}.

State the resulting comparison as `TauCeti.SymmetricPower.acc_purity`.

Potential automorphy of all Sym^m R (ACC+ Theorem 7.1.11, Corollary 7.1.12, assembled from [The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)](#acc-auxiliary-primes) and [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers)). Purity: unitary cuspidal π_{ι,m} and the Jacquet–Shalika bound ([Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers)).

Over ℚ this recovers Sato–Tate for elliptic curves ([The Sato–Tate theorem for elliptic curves over ℚ](#sato-tate-elliptic-curves)). Negative control: m=0 gives ζ_F and its pole at 1, so unconditional holomorphy on Re s≥1 would be false.

([ACC+](#ref-acc-2023), §7.1, Corollary 7.1.13, arXiv v2 p. 201 (Annals p. 1096); [ACC+](#ref-acc-2023), §7.1, proof of Corollary 7.1.13, arXiv v2 p. 202 (Annals p. 1097).)

*Needs:* [The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)](#acc-auxiliary-primes); [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers); [Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers); [PotentialModularityAndCompatibleSystems §R24.5, system L-functions](../PotentialModularityAndCompatibleSystems/README.md); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="serre-equidistribution-criterion"></a>
### 4.25 Serre's equidistribution criterion through L-functions of representations of ST(π)

Let ST be a compact group and ([π_v])_{v ∉ S} conjugacy classes indexed by the finite places. For an irreducible representation ρ of ST put L^S(π, ρ, s) = ∏_{v ∉ S} det(1 − q_v^{−s}ρ([π_v]))^{−1}, absolutely convergent for Re s > 1. If for every non-trivial irreducible ρ, L^S(π, ρ, s) has meromorphic continuation to ℂ, holomorphic and non-vanishing on Re s = 1, then the [π_v] are equidistributed for the Haar probability measure of ST (Serre, Ch. I, Appendix). This is the general form of [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion).

ST compact; L-functions as stated.

State the resulting comparison as `TauCeti.SymmetricPower.serre_criterion`.

Peter–Weyl: finite linear combinations of irreducible characters are uniformly dense in the continuous conjugation-invariant functions (Tau Ceti CompactGroups layers 5–6). Character limits and uniform approximation give the general class-function limit. Wiener–Ikehara/Tauberian theorem for each L^S(π, ρ, s) (AnalyticNumberTheory AN.2).

For ST = SU(2) and ρ = Sym^n it is [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion).

([BCGNT](#ref-bcgnt-2025), Proof of Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62; arXiv pagination differs).)

*Needs:* [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); AnalyticNumberTheory, Layer AN.2; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="bianchi-eichler-shimura"></a>
### 4.26 Bianchi Fourier and parabolic-cohomology comparison

For an imaginary quadratic F, nonzero ideal n and k≥2, let Y₁(n) be the adelic Bianchi quotient, with all h_F ideal-class components, and V_{k−2}=Sym^{k−2}(ℂ²)⊗conj(Sym^{k−2}(ℂ²)), with the same central-character twist as the form. Construct the degree-one cuspidal de Rham comparison from weight-k Bianchi cusp forms to H¹_par(Y₁(n),V_{k−2}). It is a Hecke-equivariant isomorphism at this degree with the corresponding cuspidal cohomology. On a normalized eigenform its unramified T_𝔭 eigenvalue is the Fourier coefficient c(𝔭,f), with c(O_F,f)=1. Prove the reverse eigensystem assertion as well; a one-way map alone does not imply a bound for every cohomology eigenvalue.

Define H¹_par as the kernel of boundary restriction, equivalently the image of compactly supported cohomology. On a single Γ₁(n) component, the elementary double-coset operator diag(ϖ,1) only defines the operator for a principal prime 𝔭=(ϖ). For arbitrary ideals use the maps between all ideal-class components. Unequal coefficient weights (k,l) have zero cuspidal parabolic cohomology here. The proof constructs the differential form using the explicit archimedean Whittaker function and relative Lie algebra cohomology, establishes square integrability/cuspidality and the inverse harmonic-form comparison, and checks restriction–conjugation–trace against the Fourier normalization.

**API.**

- `bianchiCuspToParabolic / bianchiParabolicEquiv` construct the cuspidal differential-form map and its inverse on parabolic H¹ of the full adelic quotient.
- `hecke_equivariant / fourierCoeff_eq_heckeEigenvalue` compare the actual Hecke correspondences with the normalized Fourier–Whittaker coefficients.
- `singleComponent_principalHecke / classGroup_componentHecke` separate the principal-component action from the ideal-class-changing correspondences. Use ALS's actual local systems, Borel–Serre boundary and Hecke chains.

**Checks.**

- At k=2 the coefficient module is trivial.
- For class number greater than one a nonprincipal prime generally changes the component and gives no scalar operator on just the principal component.
- Removing the boundary-kernel condition would include Eisenstein cohomology and invalidate the cuspidal correspondence.
- At q=N𝔭=9 and k=2 the Ramanujan consequence is |c(𝔭,f)|≤6, not 2√3.

For the comparison, identify adelic de Rham cochains with relative Lie algebra cochains as in Harder §3.1, pp.59–61. The cuspidal summand injects into boundary-kernel cohomology by (3.1.4). The one-dimensional residual contribution is described by (3.2.4)–(3.2.5), pp.62–65: over an imaginary quadratic field its possible cochain degrees are 0 and 3, and (3.2.4)(iii) kills the top-degree contribution. In particular it contributes nothing to degree 1 even when k=2. Formula (3.6.2.2), p.74, gives the one-dimensional archimedean cohomology in degrees 1 and 2 for each matching GL₂(ℂ) representation; (3.6.1) excludes unequal weights. Taking finite-level invariants in the displayed adelic decomposition gives the degree-one isomorphism. The GL₂(𝔸_f)-equivariance supplies the Hecke action; the explicit Fourier normalization is that of BCGNT §1.3.

([Harder](#ref-harder-1987), §§3.1–3.2, pp.59–65, and §3.6, pp.73–74, especially (3.6.1) and (3.6.2.2); [BCGNT](#ref-bcgnt-2025), §1.3 pp.9–11.)

*Needs:* ArithmeticLocallySymmetricSpaces §5b.6 and its cohomology/Hecke/boundary layers; AutomorphicFormsOnReductiveGroups, relative Lie algebra cohomology; GL2AutomorphicRepresentationsAndTransfer, archimedean Whittaker models. The Fourier/harmonic-form comparison is owned here, rather than imported from Hecke-chain construction alone.

<a id="bianchi-modular-forms"></a>
### 4.27 Bianchi modular forms, their Fourier coefficients and parabolic cohomology

Let F be imaginary quadratic. A cuspidal Bianchi modular eigenform of weight k ≥ 2 and level 𝔫 is a vector-valued function on GL₂(𝔸_F) generating a regular algebraic cuspidal automorphic representation π of parallel weight k (the infinitesimal character of π_∞ is that of (Sym^{k−2} ⊗ \overline{Sym^{k−2}})^∨), with Fourier expansion f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F, f) W(αt_∞) e_F(αz), coefficients c(I, f) vanishing unless I ⊂ O_F and normalised by c(O_F, f) = 1. Its Hecke eigenvalues occur in the parabolic cohomology of the adelic locally symmetric space, with all ideal-class components and coefficient module Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}, through [the Eichler–Shimura–Harder comparison](#bianchi-eichler-shimura). The single Γ₁(𝔫) component alone gives only the principal-prime Hecke comparison.

F imaginary quadratic; k ≥ 2; 𝔫 a non-zero ideal.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.BianchiEigenform`: A cuspidal Bianchi eigenform of weight k and level 𝔫.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff`: The Fourier coefficient c(I, f).
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_one`: c(O_F, f) = 1.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue`: For 𝔭 ∤ 𝔫, c(𝔭, f) is the T_𝔭-eigenvalue.
- `TauCeti.SymmetricPower.BianchiEigenform.toAutRep`: The cuspidal automorphic representation of GL₂(𝔸_F) generated by f (parallel weight k).

Definition through the automorphic representation (Clozel's purity forces parallel weight; [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity)). Fourier expansion via the Whittaker model (Hida; Williams). Comparison with cohomology uses [the local Eichler–Shimura–Harder target](#bianchi-eichler-shimura), built on ALS's cohomology and Hecke chains.

**Checks.**

- A modular elliptic curve over F of conductor 𝔫 without CM by F gives a weight-2 Bianchi eigenform with c(𝔭, f) = N(𝔭) + 1 − #E(F_𝔭).
- c(I, f) = 0 for I ⊄ O_F.
- Bianchi forms are not holomorphic functions on a Hermitian domain: ℍ³ is not Hermitian, so there is no q-expansion in holomorphic exponentials; the expansion involves the Bessel-type Whittaker function W.

The objects of Theorems E–G.

([BCGNT](#ref-bcgnt-2025), §1.3 Bianchi Modular Forms, arXiv v3 pp. 9–11 (published pp. 8–10; arXiv pagination differs).)

*Needs:* [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity); [Eichler–Shimura–Harder comparison](#bianchi-eichler-shimura); ArithmeticLocallySymmetricSpaces, Layer ALS.3; [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry).

<a id="cg18-conditional-sato-tate"></a>
### 4.28 Conditional Sato–Tate for elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(2))

Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic curve. Then the Sato–Tate conjecture holds for E. Status: conditional ([Assertions with explicit hypotheses](#endpoint-status-register)).

Hypothesis: Conjecture B.

State the resulting comparison as `TauCeti.SymmetricPower.cg18_satoTate`.

Potential automorphy of all symmetric powers ([Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers) with the tensor product trick and [Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))](#cg18-conditional-potential-modularity)) and the equidistribution criterion ([Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion)) with Brauer induction.

The conclusion requires Conjecture B and the analytic continuation and nonvanishing used by the equidistribution criterion.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(2), §1, p. 3 (arXiv v2) = Invent. p. 300; reduction in §10, p. 97 (arXiv v2) = Invent. p. 428.)

*Needs:* [Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))](#cg18-conditional-potential-modularity); [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); [Assertions with explicit hypotheses](#endpoint-status-register); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="non-cm-symmetric-powers"></a>
### 4.29 Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)

Let π be a regular algebraic, cuspidal, non-CM automorphic representation of GL₂(𝔸_ℚ). Then for every n ≥ 1, Sym^nπ exists as a regular algebraic cuspidal automorphic representation of GL_{n+1}(𝔸_ℚ). In particular (Corollary B), for every elliptic curve E/ℚ without CM and n ≥ 2, Λ(Sym^nE, s) is entire.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 1. The n=1 case is π itself; Corollary B is quoted in its stated range n ≥ 2.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_nonCM`.

Induction on #sc(π), the primes where π_p is supercuspidal; sc(π) = ∅ is non-supercuspidal-symmetric-powers. Killing ramification: a "seasoned" good-dihedral π′ (with an auxiliary Steinberg prime r so that r_{π′,ι_q} has large image) congruent to π with sc(π′) = sc(π) ∖ {p}; symmetric-power-automorphy-lifting transfers automorphy (NT II Theorem 3.1, Propositions 3.7–3.11). Corollary B: modularity of elliptic curves over ℚ (BCDT) and Godement–Jacquet.

Check the scope: CM forms and weight-one forms are excluded here and handled by cm-and-weight-one-symmetric-powers.

([Newton–Thorne II](#ref-newton-thorne-II), Introduction, Theorem A and Corollary B, pp. 1–2; §3, Theorem 3.1, p. 20 (arXiv v2).)

*Needs:* [Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers); [Automorphy lifting for symmetric powers (NT II Theorem 2.1)](#symmetric-power-automorphy-lifting); [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="all-regular-symmetric-powers"></a>
### 4.30 Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)

SP_n holds for all n ≥ 2: for every totally real F and every non-CM cuspidal regular algebraic π of GL₂(𝔸_F), Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in each of the senses of [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion).

F totally real; π non-CM, cuspidal, regular algebraic.

State the resulting comparison as `TauCeti.SymmetricPower.sp_all`.

Induction on n ≥ 6, with the cases n ≤ 5 known ([Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers)). Write n = p + r with p ≥ 5 prime and 0 < r < p (Bertrand); Proposition 6.1 ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)) reduces to π′ with the local conditions; [the local level-raising](#unitary-level-raising-method) and [tensor-lifting](#tensor-functoriality-lifting) targets give automorphy of Sym^{p+r−1}r_{π′,ι} from SP_p, SP_r and SP_{p−r}.

SP_6 recovers Clozel–Thorne's Sym⁵ without their disjointness hypothesis.

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem 6.4 and its proof, §6, p. 50 (arXiv v2).)

*Needs:* [The statement SP_n (Newton–Thorne, Conjecture B)](#sp-statement); [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sym6-sym8"></a>
### 4.31 Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)

Let F be totally real and (π, χ) a RAESDC automorphic representation of GL₂(𝔸_F) not automorphically induced from a quadratic CM extension. (1) If F ∩ ℚ(ζ₅) = ℚ, Sym⁶π exists as a cuspidal automorphic representation of GL₇(𝔸_F). (2) If F ∩ ℚ(ζ₇) = ℚ, Sym⁸π exists as a cuspidal automorphic representation of GL₉(𝔸_F). Theorem 6.1 is reduced to Theorem 6.2 (level raising for Sym^{n−1} of a Steinberg-at-q form) by reference to Clozel–Thorne II §6; the level-raising proof is a separate obligation of [the local method target](#unitary-level-raising-method), with its congruence and local-type construction specified there.

F totally real with the stated disjointness; π RAESDC, not CM.

State the resulting comparison as `TauCeti.SymmetricPower.sym6_sym8`.

Reduction to Theorem 6.2 ([CT15, §6]) and potential automorphy inputs from BLGGT (Layer 2) — use [the local level-raising target](#unitary-level-raising-method), including its smaller-rank premise and residual-ramification argument.

Superseded for totally real F by [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers), which removes the disjointness.

([Clozel–Thorne III](#ref-ct-2017), §6, Theorem 6.1 (= Theorem 1.1), manuscript p. 44 (Theorem 1.1 on p. 2).)

*Needs:* [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="nt21-semistable-l-functions"></a>
### 4.32 Analytic continuation of symmetric power L-functions of semistable elliptic curves (Newton–Thorne I, Corollary C)

Let E/ℚ be a semistable elliptic curve. Then for every n ≥ 2 the completed symmetric power L-function Λ(Sym^n E, s) ([The completed symmetric power L-function Λ(Sym^n E, s)](#completed-symmetric-power-l-function)) admits an analytic continuation to ℂ.

E/ℚ semistable (hence non-CM).

State the resulting comparison as `TauCeti.SymmetricPower.semistable_entire`.

Theorem B of Newton–Thorne I ([Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers)): no local component of π_E is supercuspidal. Godement–Jacquet for the cuspidal Sym^nπ_E and the comparison of completed L-functions (Layer 0).

Superseded by Newton–Thorne II Corollary B (all non-CM E).

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, Corollary C, arXiv v3 p. 2 (Publ. IHÉS 134, p. 2).)

*Needs:* [Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers); [The completed symmetric power L-function Λ(Sym^n E, s)](#completed-symmetric-power-l-function); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bcgnt-symmetric-powers-purity"></a>
### 4.33 Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)

Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m}, m ≥ 1. Then R is pure of weight m and for each n ≥ 1 there is a finite CM F′/F, Galois over ℚ, with Sym^{n−1}R|_{G_{F′}} automorphic. If R is irreducible but not strongly irreducible, R is pure of weight m and each Sym^{n−1}R is a direct sum of automorphic compatible systems of dimension ≤ 2.

F CM; R as stated.

State the resulting comparison as `TauCeti.SymmetricPower.bcgnt_theoremC`.

Follow BCGNT Theorem 7.2.1: normalize the determinant using the rank-one Hecke character, the finite-order square after quadratic CM base change, and twisting, as in Theorem 7.1.1. Apply Theorem 6.2.1 and undo the twist on the resulting automorphic systems. In the irreducible but not strongly irreducible branch use ACC+ Lemma 7.1.2 to express the system as induction of algebraic Hecke characters. Distinct Hodge–Tate weights exclude Artin up to twist. Decompose each symmetric power into induced rank-two systems and, in even symmetric degree, a rank-one system; use rank-one purity and automorphic induction.

Theorem C of BCGNT.

([BCGNT](#ref-bcgnt-2025), Theorem 7.2.1 and proof, §7.2, arXiv v3 p. 69 (published pp. 61–62); Theorem C, §1, arXiv p. 4 (published p. 4).)

*Needs:* [Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)](#bcgnt-potential-automorphy-det-cyclotomic); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sato-tate-elliptic-curves"></a>
### 4.34 The Sato–Tate theorem for elliptic curves over ℚ

Let E/ℚ be an elliptic curve without complex multiplication, and for good p let α_p be the root of X² − a_pX + p with nonnegative imaginary part and θ_p = arg(α_p/√p) ∈ [0, π]. Then (θ_p) is equidistributed for (2/π)sin²θ dθ, the push-forward of Haar measure on SU(2).

E/ℚ non-CM (End E = ℤ).

State the resulting comparison as `TauCeti.SymmetricPower.satoTate_elliptic`.

K = SU(2): classes are diag(e^{iθ}, e^{−iθ}), Haar measure is the Sato–Tate measure, and the irreducible representations are the Sym^n (Kedlaya §24.5). L(s, Sym^n) = L(Sym^nE, s + n/2) (shift of the abscissa by n/2) is the L-function of the cuspidal Sym^nπ_E (non-cm-symmetric-powers), hence entire and nonvanishing on Re s ≥ 1 after the shift (Jacquet–Shalika, AL.3); for n ≥ 1 there is no pole, so c(χ) = 0. Apply l-function-equidistribution-criterion. (Historically: Clozel–Harris–Shepherd-Barron–Taylor for non-integral j via potential automorphy; Barnet-Lamb–Geraghty–Harris–Taylor for all non-CM E over totally real fields.)

Check the Haar-measure computation: the Weyl integration formula for SU(2) gives (2/π)sin²θ dθ on [0, π] using ∫₀^π sin²θ dθ = π/2. Check that potential automorphy suffices: meromorphic continuation with no zeros or poles on Re s ≥ 1 (Layer 2) already gives Sato–Tate; Newton–Thorne's entireness is not needed.

([Notes on analytic number theory](#ref-kedlaya-ant-2025), §§24.4–24.5, Conjecture 24.4 and Theorems 24.5–24.6, printed pp. 134–135.)

*Needs:* [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); [Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)](#non-cm-symmetric-powers); AutomorphicLFunctionsAndLocalFactors, Layer AL.3; [Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation); EllipticCurveModularity, Layer R29.6; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="hilbert-symmetric-powers"></a>
### 4.35 Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))

Let F be totally real and π a cuspidal automorphic representation of GL₂(𝔸_F) without CM such that π_∞ is essentially square-integrable (each π_v, v | ∞, a twist of a discrete series of weight k_v ≥ 2; the parity of k_v may vary). Then for every n ≥ 2 there is a cuspidal automorphic representation Π_n of GL_n(𝔸_F) with rec(Π_{n,v}) ≅ Sym^{n−1} ∘ rec(π_v) at every place v. These π are those of cuspidal non-CM Hilbert modular forms of weights k_v ≥ 2.

F totally real; π non-CM with discrete-series archimedean components (mixed parity allowed).

State the resulting comparison as `TauCeti.SymmetricPower.hilbert`.

Same parity: π is regular algebraic up to twist; [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers). Mixed parity: Clozel–Thorne Theorem 7.1 reduces to the RAESDC case over a CM extension ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)).

For F = ℚ it recovers Newton–Thorne II Theorem A ([Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)](#non-cm-symmetric-powers)).

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem A, §1, p. 1 = Theorem 6.5(1), §6, p. 50 (arXiv v2).)

*Needs:* [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); AutomorphicGaloisRepresentations, Layer R19.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="cm-field-symmetric-powers"></a>
### 4.36 Symmetric powers of conjugate self-dual GL₂ representations over CM fields (Newton–Thorne, Theorem 6.5(2))

Let E be a CM field and π a RAECSDC automorphic representation of GL₂(𝔸_E) not automorphically induced from a quadratic extension. Then for every n ≥ 2 Sym^{n−1}π exists: there is a cuspidal Π_n of GL_n(𝔸_E) with rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w) for every place w.

E CM; π RAECSDC, not dihedral.

State the resulting comparison as `TauCeti.SymmetricPower.cmField`.

Clozel–Thorne Proposition 7.6: descend to the maximal totally real subfield via an auxiliary character and an odd extension, apply [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers) there, and base change back ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)).

Over an imaginary quadratic field this covers conjugate self-dual Bianchi forms, not general Bianchi forms ([The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)](#bianchi-sato-tate) covers those up to potential automorphy).

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem 6.5(2) and its proof, §6, p. 50 (arXiv v2).)

*Needs:* [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="symmetric-powers-up-to-eight"></a>
### 4.37 Symmetric powers up to eight and holomorphy of L(s, Sym^n π) (Clozel–Thorne, Corollary 7.2)

Let F be totally real, π cuspidal on GL₂(𝔸_F) with π_∞ essentially square-integrable, not induced from a quadratic CM extension. Then there is a cuspidal Π on GL_{r+1}(𝔸_F) with Sym^r rec(π_v) ≅ rec(Π_v) for all finite v in each case: (1) any F, 1 ≤ r ≤ 4; (2) F ∩ ℚ(ζ₅) = ℚ, r ∈ {5, 6}; (3) F ∩ ℚ(ζ₃₅) = ℚ, r = 7; (4) F ∩ ℚ(ζ₇) = ℚ, r = 8. Consequently (Corollary 1.3) L(s, Sym^n π) is entire with the expected functional equation for n ≤ 8 under the corresponding disjointness.

State the resulting comparison as `TauCeti.SymmetricPower.upToEight`.

(1): [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); (2)–(4): [Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)](#sym6-sym8) and the reductions of Theorem 7.1 (mixed parity). Holomorphy: Godement–Jacquet for the cuspidal Π (AutomorphicLFunctionsAndLocalFactors AL.2).

Superseded by [Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))](#hilbert-symmetric-powers), which needs no disjointness.

([Clozel–Thorne III](#ref-ct-2017), §7, Corollary 7.2, manuscript pp. 46–47 (Corollaries 1.2, 1.3 on p. 2).)

*Needs:* [Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)](#sym6-sym8); [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-ramanujan"></a>
### 4.38 The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)

Let F be an imaginary CM field and π a regular algebraic cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight. Then π_v is essentially tempered at every finite place v. After the algebraic Hecke-character twist that makes the weight (k−2,0) at every embedding, with k≥2, its unramified rec^T Satake eigenvalues α_v,β_v have absolute value N(v)^((k−1)/2). In the untwisted statement write w=λ_{τ,1}+λ_{τc,2}; the eigenvalues of rec(π_v)(Frob_v), normalized by q_v^(−w/2), have absolute value one. Parallel weight determines the difference of the two λ-coordinates, not their sum before the twist.

F imaginary CM; π cuspidal regular algebraic of parallel weight.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_ramanujan`.

Clozel purity gives λ_{τ,1}+λ_{τc,2}=w. Parallel weight then makes λ_{τ,2}+λ_{τc,2} constant, so an algebraic Hecke-character twist normalizes the weights to (k−2,0). After a quadratic CM base change the finite-order central character is a square; a further finite-order twist normalizes the determinant to ε^(1−k). Use the rank-two classification into strongly irreducible, induced and Artin-up-to-twist systems. Distinct Hodge–Tate weights exclude the Artin branch. Rank-one purity handles induction, and BCGNT Theorem 6.2.1 handles the strongly irreducible branch. The proof of Theorem 7.1.1 makes a further soluble base change to reduce the ramified-place assertion to unramified purity, using ACC+ Corollary 7.1.15. Import the exact local–global compatibility and soluble base-change exports; do not infer full ramified WD compatibility merely from good-place purity.

Weight 2 recovers ACC+ Theorem 1.0.2.

([BCGNT](#ref-bcgnt-2025), Theorem 7.1.1 and proof, §7.1, arXiv v3 pp. 68–69 (published p. 61); Theorem A, §1, arXiv p. 3 (published p. 3).)

*Needs:* [Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity); [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sato-tate-group"></a>
### 4.39 The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field

Let F be imaginary CM and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of weight λ, not CM, with λ_{τ,1} + λ_{τc,2} = w and ω_π = |·|^{−w}ψ, ψ unitary of type A₀. ST(π) = U₂(ℝ)_a := {g ∈ U₂(ℝ) : det(g)^a = 1} if ψ has finite order a, and ST(π) = U₂(ℝ) otherwise. It is a compact subgroup of GL₂(ℂ), and for π_v unramified and essentially tempered the conjugacy class of q_v^{−w/2} rec(π_v)(Frob_v) meets ST(π) in a unique ST(π)-conjugacy class [π_v] (Lemma 7.2.2).

F imaginary CM; π non-CM cuspidal regular algebraic on GL₂.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.SatoTateGroup`: ST(π) ⊂ GL₂(ℂ).
- `TauCeti.SymmetricPower.SatoTateGroup.isCompact`: ST(π) is compact.
- `TauCeti.SymmetricPower.SatoTateGroup.ofFiniteOrder`: ψ of finite order a ⇒ ST(π) = {g ∈ U₂(ℝ) : det(g)^a = 1}.
- `TauCeti.SymmetricPower.satoTateClass`: [π_v] ∈ ST(π)/conjugacy for π_v unramified and essentially tempered.
- `TauCeti.SymmetricPower.satoTateClass_unique`: The class [π_v] is unique (Lemma 7.2.2).

Define the subgroup by the actual central character order. Compactness follows from the closed determinant condition in U₂. For an unramified essentially tempered component, its two Satake eigenvalues have equal absolute value; their product is ψ(ϖ_v)q_v^w. After normalization they are unitary and satisfy the determinant condition. GL₂-conjugate unitary elements are SU₂-conjugate, giving uniqueness (Lemma 7.2.2). Essential temperedness is an explicit input to the local class constructor. [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan) supplies that input when π has parallel weight; the definition of the group does not assert Ramanujan for all nonparallel weights.

**Checks.**

- For π of a non-CM elliptic curve over F, ψ = 1 and ST(π) = SU(2) = U₂(ℝ)₁.
- If ψ has infinite order, ST(π) = U₂(ℝ).
- For a CM representation the non-CM Sato–Tate group formula does not apply: the identity component is toral, and the full group can be a torus or its normalizer depending on the field of definition of the endomorphisms.

For a non-CM elliptic curve, ψ is trivial (a = 1) and ST(π) = SU(2).

([BCGNT](#ref-bcgnt-2025), Definition of ST(π) and Lemma 7.2.2 with proof, §7.2, arXiv v3 pp. 69–70 (published p. 62; arXiv pagination differs).)

*Needs:* [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan); [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="bianchi-fourier-ramanujan"></a>
### 4.40 The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)

Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level 𝔫 and weight k normalised by c(O_F, f) = 1, and 𝔭 a prime ideal not dividing 𝔫. Then |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_coeff_bound`.

c(𝔭, f) = α + β with α, β the Satake parameters scaled by N(𝔭)^{(k−1)/2}; [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan) gives |α| = |β|.

Weight 2 gives the Hasse-type bound |c(𝔭, f)| ≤ 2√N(𝔭).

([BCGNT](#ref-bcgnt-2025), Theorem E, §1.3, arXiv v3 p. 10 (published p. 8; arXiv pagination differs).)

*Needs:* [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-mass-equidistribution"></a>
### 4.41 Mass equidistribution for level-one Bianchi eigenforms of growing weight (BCGNT Theorem G)

Let F be imaginary quadratic of class number one and Γ = SL₂(O_F). For any sequence of level-one Bianchi eigenforms f of weight tending to ∞, the normalised measures μ_f on Γ\ℍ³ (Marshall) converge weakly to the normalised hyperbolic volume.

F imaginary quadratic of class number one; level one.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_massEquidistribution`.

Marshall's Corollary 3 is conditional on the Ramanujan bound for the forms involved; [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan) supplies it.

An application of Theorem A to quantum unique ergodicity in the weight aspect.

([BCGNT](#ref-bcgnt-2025), Theorem G and proof, §1.3, arXiv v3 p. 11 (published p. 10; arXiv pagination differs).)

*Needs:* [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-sato-tate"></a>
### 4.42 The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)

Let F be an imaginary CM field and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of parallel weight, not CM, with ω_π = |·|^{−w}ψ. Let S_π be the set of finite places where π is ramified. Then the classes [π_v] ∈ ST(π), v ∉ S_π, are equidistributed for the Haar probability measure of ST(π).

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_satoTate`.

Serre's criterion ([Serre's equidistribution criterion through L-functions of representations of ST(π)](#serre-equidistribution-criterion)): for non-trivial irreducible ρ of ST(π), ρ is (a twist of) Sym^{n−1} ⊗ det^k; potential automorphy of Sym^{n−1}R_π ([Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity)) with Brauer induction and the Jacquet–Shalika non-vanishing on Re s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3) give the analytic properties.

For elliptic curves over CM fields it recovers ACC+ Theorem 1.0.1's Sato–Tate.

([BCGNT](#ref-bcgnt-2025), Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62); Theorem B, §1, arXiv p. 3 (published p. 3).)

*Needs:* [The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field](#sato-tate-group); [Serre's equidistribution criterion through L-functions of representations of ST(π)](#serre-equidistribution-criterion); [Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="bianchi-parabolic-cohomology-ramanujan"></a>
### 4.43 The Ramanujan bound for Hecke eigenvalues on parabolic cohomology of Bianchi groups (BCGNT Theorem F)

Let F be imaginary quadratic, 𝔫 ≠ 0, k ≥ 2, and H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (or the sum over the components when h_F > 1). For a principal prime 𝔭 ∤ 𝔫 and an eigenvalue a_𝔭 of T_𝔭 on H_par, |a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_cohomology_bound`.

Eichler–Shimura–Harder: H_par is spanned by Bianchi eigenforms ([Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms)); apply [The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)](#bianchi-fourier-ramanujan).

The cohomological form used for computations.

([BCGNT](#ref-bcgnt-2025), Theorem F, §1.3, arXiv v3 p. 11 (published p. 9; arXiv pagination differs).)

*Needs:* [The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)](#bianchi-fourier-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

### Examples

For a non-CM elliptic curve, the degree-two motivic symmetric power has real factor Γ_ℝ(s)Γ_ℂ(s), and the automorphic GL₃ function uses s−1. Degree zero instead gives the completed zeta function and has poles. At SU(2) the standard conjugacy class diag(e^{iθ},e^{−iθ}) has trace 2cos θ; Haar pushes forward to (2/π)sin²θ dθ on [0,π]. Integrating 1 gives one, and the nontrivial SU(2) characters have mean zero. Determinant characters of ST(π) must also be tested when the determinant has nontrivial finite order.

### Dependencies

The layer uses the exact supplier contracts above, GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, AnalyticNumberTheory, Layer AN.2, TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5, TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6, `Matrix.trace`, Layer 0, Layer 1, AutomorphicGaloisRepresentationsPartII, Layer AG2.2, TauCetiRoadmap.Chebotarev, Layer 10, Layer 2, PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one), AutomorphicFormsOnReductiveGroups, Layer AF.4, AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (regular algebraic of weight), AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound), PotentialModularityAndCompatibleSystems, Layer R24.5:operations, [polarized lifting](#polarized-lifting-extensions), AutomorphicLFunctionsAndLocalFactors, Layer AL.2, [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the exact lifting targets of Layer 2), AutomorphicGaloisRepresentationsPartII, Layer AG2.5, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, PotentialAutomorphyInfrastructure Layer 2, soluble automorphy comparisons, ArithmeticLocallySymmetricSpaces, Layer ALS.3, AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet), AutomorphicLFunctionsAndLocalFactors, Layer AL.3, EllipticCurveModularity, Layer R29.6, AutomorphicGaloisRepresentations, Layer R19.2, AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing).

## Layer 5: generic transfers and Langlands conjectures

<a id="ckpss-generic-transfer"></a>
### 5.1 Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)

Let k be a number field, G_n = SO_{2n+1}, SO_{2n} (n ≥ 2) or Sp_{2n} split over k, and N = 2n, 2n, 2n + 1. Every globally generic cuspidal automorphic representation π of G_n(𝔸) has a functorial lift Π to GL_N(𝔸) (local lift at every archimedean place and at almost all unramified finite places). For G_n = SO_{2n+1}: Π = Π₁ ⊞ ⋯ ⊞ Π_d with Π_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{N_i}(𝔸) such that L^T(s, Π_i, ∧²) has a pole at s = 1 (symplectic type), and conversely every such Π is the lift of some π; for Sp_{2n} (resp. SO_{2n}) the same holds with L^T(s, Π_i, Sym²) having a pole at s = 1 (orthogonal type) and trivial central character of the total lift Π (not necessarily of each Π_i) (CKPSS Theorems 7.1, 7.2, the image being Ginzburg–Rallis–Soudry's).

k a number field; G_n split; π globally generic cuspidal (with respect to a fixed splitting).

State the resulting comparison as `TauCeti.Functoriality.ckpss`.

CKPSS: Langlands–Shahidi L-functions of G_n × GL_m and the converse theorem for GL_N. Image: Ginzburg–Rallis–Soudry's descent ([Automorphic descent of Ginzburg–Rallis–Soudry (with Jiang–Soudry's irreducibility)](#grs-descent)). Arthur remarks that the generic cases of his seed theorems follow from CKPSS and GRS, though he does not use them.

Boxer–Calegari–Gee Remark 2.5 apply Theorem 7.2 to self-dual level-one cuspidal π of GL₁₀₅ to get a globally generic cuspidal representation of Sp₁₀₄/ℚ; 'level one' needs a local input CKPSS does not give.

([Functoriality for the classical groups](#ref-ckpss-2004), Theorem 1.1, §1, p. 169 (Publ. Math. IHÉS 99); [Functoriality for the classical groups](#ref-ckpss-2004), Theorem 7.1, §7.1, p. 195 (Publ. Math. IHÉS 99); [Cuspidal cohomology classes for GL_n(Z)](#ref-bcg-2025), Remark 2.5, §2, p. 8 (arXiv:2309.15944v3); journal p. 515; [Functoriality for the classical groups](#ref-ckpss-2004), Theorem 7.2, PDF p.34 (printed p.196).)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); [Symplectic and orthogonal type of a self-dual cuspidal representation](#self-dual-cuspidal-type); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

<a id="functoriality-conjecture"></a>
### 5.2 Langlands' principle of functoriality (frontier statement)

Let F be a global field, G, G′ connected reductive groups over F with G quasi-split, and ρ : ᴸG′ → ᴸG an L-homomorphism (compatible with the projections to the Galois group). Functoriality(G′, G, ρ) is the proposition: for every automorphic representation π′ of G′(𝔸_F) there is an automorphic representation π of G(𝔸_F) with c_v(π) = ρ(c_v(π′)) (Satake parameters) for all places v outside a finite set where π and π′ are unramified. The refined form asks local compatibility through local Langlands at every place. The statement is a conjecture; this roadmap uses it only as a named hypothesis of conditional implications, and its known cases are the theorem nodes of Layer 5.

G is quasi-split and ρ is an L-homomorphism. This assertion has conjectural status in the assertion logic of Layer 0.

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.Functoriality`: The proposition Functoriality(G′, G, ρ).
- `TauCeti.Functoriality.Functoriality.comp`: Functoriality(G′, G, ρ) and Functoriality(G, G″, ρ′) imply Functoriality(G′, G″, ρ′ ∘ ρ) (weak form).
- `TauCeti.Functoriality.Functoriality.id`: Functoriality(G, G, id) holds.
- `TauCeti.Functoriality.Functoriality.of_gelbartJacquet`: Gelbart–Jacquet supplies the cuspidal GL₂ case of the Sym² weak functoriality assertion. Extension to noncuspidal isobaric GL₂ inputs uses the direct-sum/Hecke-character transfer and automorphic isobaric assembly; it is not an extra assertion of the cuspidal theorem.
- `TauCeti.Functoriality.Functoriality.sym`: General symmetric-power functoriality for arbitrary cuspidal GL₂ representations remains a frontier assertion. Layer 4 proves the specified regular algebraic, Hilbert discrete-series and monomial/weight-one cases, rather than this unrestricted assertion.

Definition of the proposition; no proof.

**Checks.**

- G′ = {1}, G = GL₁: Functoriality is the statement that the trivial character is automorphic (true).
- G′ = GL_n, G = GL₁, ρ = det: Functoriality holds, the lift of π being ω_π.
- For G′={1}, the domain L-group is W_F (with the finite quotient Gal(E/F) through which r factors), and the L-homomorphism is w↦(r(w),w). Weak functoriality asks almost-everywhere Artin matching. All-place compatibility is the separate strong refinement.
- For GL₁ the proposed map (z,w)↦(z,1) on ℂ^××W_F fails the projection-to-W_F condition. A map on dual-group parameters alone cannot be accepted as the L-homomorphism input of Functoriality.

A known instance (e.g. G′ = GL₂, G = GL₃, ρ = Sym²: [GL2AutomorphicRepresentationsAndTransfer §R17.4.13](https://github.com/TauCetiProject/TauCetiRoadmap/pull/931)) proves Functoriality for that triple only.

([The principle of functoriality](#ref-arthur-2003), §4, Conjecture (Langlands [L1]), pp. 44–45 (Bull. AMS 40 (2003)).)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); [Assertions with explicit hypotheses](#endpoint-status-register); TauCetiRoadmap.ReductiveGroups, Layer 6; [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="local-langlands-conjecture-general"></a>
### 5.3 The local Langlands conjecture for a general reductive group (frontier statement)

LLC(G, F_v) is the proposition: for G quasi-split over a local field F_v there is a surjective finite-to-one map π ↦ φ_π from irreducible admissible smooth representations of G(F_v) in the nonarchimedean case, and irreducible admissible (𝔤,K)-modules in the archimedean case to Ĝ-conjugacy classes of L-parameters φ : L_{F_v} → ᴸG (L_{F_v} = W_{F_v} archimedean, W_{F_v} × SU(2) non-archimedean), compatible with central characters, twisting, parabolic induction and the L- and ε-factors wherever the relevant local-factor theory is supplied, bijective for GL_n. Known: archimedean F_v (Langlands); GL_n (Harris–Taylor, Henniart, Scholze); quasi-split classical groups ([Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets), conditionally); GSp₄ ([The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4)).

Frontier statement; status conjectural except in the listed cases. Known GL_n finite-place exports are for characteristic-zero local fields in ET.6. General residual/archimedean fields need their own stated source scope; the GSp₄ factor characterization distinguishes generic and nongeneric supercuspidal representations.

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.LocalLanglands`: The proposition LLC(G, F_v).
- `TauCeti.Functoriality.LocalLanglands.gl`: LLC for GL_n over characteristic-zero nonarchimedean local fields is the ET.6 export (Harris–Taylor, Henniart); other field scopes require their own separately checked export.
- `TauCeti.Functoriality.LocalLanglands.archimedean`: LLC(G, ℝ) holds (Langlands).
- `TauCeti.Functoriality.LocalLanglands.gsp4`: LLC for GSp₄ over characteristic-zero nonarchimedean local fields is Gan–Takeda’s correspondence with its exact generic, nongeneric and Plancherel characterization.

Definition of the proposition.

**Checks.**

- G = GL₁: LLC is local class field theory (Hom(F_v^×, ℂ^×) ≅ Hom(W_{F_v}, ℂ^×)).
- For G = SL₂ the map is not injective: L-packets of size 2 and 4 occur ([Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter)).
- For GL₂ and an unramified principal series χ₁ × χ₂, φ = χ₁ ⊕ χ₂ through Art^{−1}.

A semisimple parametrisation π ↦ φ_π^{ss} (Fargues–Scholze) is weaker and does not prove LLC(G, F_v).

([The principle of functoriality](#ref-arthur-2003), §5, p. 47 (Bull. AMS 40 (2003)).)

*Needs:* [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [Assertions with explicit hypotheses](#endpoint-status-register); TauCetiRoadmap.ReductiveGroups, Layer 6; EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

<a id="grs-descent"></a>
### 5.4 Automorphic descent of Ginzburg–Rallis–Soudry (with Jiang–Soudry's irreducibility)

Let F be a number field and φ = τ₁ ⊞ ⋯ ⊞ τ_r a generic global parameter for the split group SO_{2n+1}: τ_i pairwise non-isomorphic unitary self-dual cuspidal representations of GL_{n_i}(𝔸_F) of symplectic type, Σ n_i = 2n. The automorphic descent (a Fourier–Jacobi or Bessel coefficient of the residual Eisenstein representation E_τ with parameter (τ₁, 2) ⊞ ⋯ ⊞ (τ_r, 2)) is a non-zero cuspidal globally generic automorphic representation π₀ of SO_{2n+1}(𝔸_F) whose functorial lift to GL_{2n} is τ₁ ⊞ ⋯ ⊞ τ_r; it is irreducible (Jiang–Soudry) and is the generic member of the global packet Π̃_φ. The analogous descents for the other quasi-split classical groups give non-zero cuspidal generic representations whose structure depends on the uniqueness of local Bessel models over Vogan packets.

F a number field; φ generic for split SO_{2n+1}.

State the resulting comparison as `TauCeti.Functoriality.grsDescent`.

Ginzburg–Rallis–Soudry (2011 monograph): non-vanishing and cuspidality of the descent via unfolding of Fourier–Jacobi coefficients of residual Eisenstein series. Jiang–Soudry (Ann. of Math. 2003): irreducibility for SO_{2n+1} via the local converse theorem. Jiang–Zhang record the general structure, with the exact local Bessel-model uniqueness scope and separate irreducibility theorem.

The descent inverts [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer) on its image.

([Arthur parameters and cuspidal automorphic modules of classical groups](#ref-jiang-zhang-2020), §1.1, p. 6 (arXiv v4); published p. 744; [Arthur parameters and cuspidal automorphic modules of classical groups](#ref-jiang-zhang-2020), §7.2, p. 75 (arXiv v4); published p. 809.)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer); AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

<a id="local-descent-mp2n"></a>
### 5.5 Local descent to Mp_{2n} and globalisation of square-integrable representations of GL_{2n} (Gan–Ichino Appendix A)

(Local descent) For F_v nonarchimedean of characteristic zero, n≥1 and a fixed nontrivial additive character ψ_v, let Irr_msqr(GL_{2n}) consist of normalized inductions τ₁×⋯×τ_k, where the τ_i are pairwise inequivalent square-integrable representations of GL_{2n_i}(F_v), Σn_i=n and each L(s,τ_i,∧²) has a pole at zero. The Fourier–Jacobi descent D_ψ, formed from the normalized intertwiner at 1/2 and the oscillator integral, gives a bijection from this set to genuine ψ-generic square-integrable representations of Mp_{2n}. For D_{ψ⁻¹}(τ), its Rankin–Selberg gamma factors against every generic GL_m representation, m≥1, equal those of τ. The same statement over ℝ is established in ILM Appendix B. In particular it applies to a single square-integrable symplectic τ_v. (Proposition A.1) Given a number field F, a non-empty finite set S of non-archimedean places, v₀ ∉ S non-archimedean and such τ_v for v ∈ S ∪ {v₀} with τ_{v₀} supercuspidal, there is an irreducible cuspidal T on GL_{2n}(𝔸_F) with T_v = τ_v there, T_v principal series at the other finite places outside S_∞, L(s, T, ∧²) having a pole at s = 1 and L(1/2, T) ≠ 0.

In Proposition A.2 the local genuine ψ_v-generic representations are square-integrable, π_{v₀} is supercuspidal and, when n=1, π_{v₀} is not the odd Weil representation for ψ_{v₀}. The conclusion globalizes these π_v and is principal series at every other finite place. Supercuspidality of the theta lift is used in the deduction of A.1; it is not a replacement for the stated A.2 hypotheses.

**API.**

- `MetaplecticSquareIntegrableInput` retains the actual inducing blocks, their pairwise inequivalence, exterior-square poles and chosen additive character.
- `fourierJacobiDescent`, `descent_nonzero` and `descent_bijective` construct and characterize the genuine generic square-integrable output.
- `gammaFactor_descent` compares the factors with the inverse-character convention above for every generic GL_m test representation.
- `globalize_genericMetaplectic` and `globalize_symplecticGL` retain all prescribed places, the auxiliary supercuspidal component and the central-value conclusion.

**Checks.**

- A single symplectic square-integrable block is allowed; an orthogonal block with no exterior-square pole is excluded.
- Two distinct symplectic blocks give a square-integrable metaplectic descent although their GL induction is not square-integrable. Repeating a block is outside Irr_msqr.
- In rank one the odd Weil representation is excluded at the auxiliary supercuspidal globalization place, precisely as in A.2.
- The gamma comparison for D_{ψ⁻¹} uses ψ on both sides; changing only the descent character loses this convention.
- The local ℝ result does not create a nonarchimedean auxiliary place or remove the global finite-place hypotheses.

Descend τ_v locally, globalise the generic square-integrable genuine representations of Mp_{2n} (Gan–Ichino Proposition A.2), lift through the theta correspondence to SO_{2n+1} and then by [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer) to GL_{2n}. Ichino–Lapid–Mao Proposition 4.6 compares the theta and descent maps; its Theorem 3.1 gives the local descent bijection. Proposition 4.3 in that edition is a Bessel-model/genericity statement, not an all-place transfer theorem.

Used by Gan–Ichino to produce cuspidal T with non-vanishing central value for their Theorem 1.4.

([Ichino–Lapid–Mao](#ref-ilm), Theorem 3.1 pp.10–11, Proposition 4.6 and its proof pp.20–21, Appendix B pp.28–32, arXiv v2; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), Appendix A, proof of Proposition A.1, pp. 29–30 (arXiv v3); published pp. 1001–1002; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), Appendix A, proof of Proposition A.1, p. 30 (arXiv v3); published p. 1002.)

*Needs:* [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer); [theta and metaplectic descent](#theta-and-metaplectic-descent); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

<a id="global-langlands-reciprocity-conjecture"></a>
### 5.6 Global Langlands reciprocity for GL_n (frontier statement)

Reciprocity(F,n) is the strong Artin assertion: every continuous irreducible finite-image r:G_F→GL_n(ℂ) has a cuspidal π of GL_n(𝔸_F) whose local parameter at EVERY place matches r|_{W_{F_v}}. The weak assertion of almost-everywhere Satake matching is stated separately and does not, by uniqueness alone, supply the bad factors. For nontrivial r the strong assertion implies entireness of its full Artin L-function; the trivial rank-one representation has the Dedekind-zeta pole. Its regular geometric ℓ-adic refinement is a separate frontier conjecture. Known cases used here: rank one through class field theory; the odd rank-two ℚ case through Langlands–Tunnell and Khare–Wintenberger; totally odd finite-image rank two over totally real fields through Pilloni–Stroh.

Frontier statement; status conjectural in [Assertions with explicit hypotheses](#endpoint-status-register).

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.Reciprocity`: The proposition Reciprocity(F, n).
- `TauCeti.Functoriality.Reciprocity.one`: Reciprocity(F, 1) holds (class field theory).
- `TauCeti.Functoriality.Reciprocity.of_functoriality`: The refined functoriality assertion for finite-image irreducible r, including all-place local compatibility and a cuspidal lift, implies the strong Reciprocity assertion. Weak matching alone is a distinct conclusion.
- `TauCeti.Functoriality.Reciprocity.implies_artin`: Strong Reciprocity for a NONTRIVIAL irreducible finite-image r implies entireness of the full Artin L-function by Godement–Jacquet. For r=1 the corresponding function is Dedekind zeta and has a pole.

Definition of the proposition; the known cases are theorem nodes of Layer 1 and the GL₂ roadmap.

**Checks.**

- n = 1: Reciprocity(F, 1) is Artin reciprocity.
- For K/ℚ quadratic and a finite-order character χ of G_K with χ≠χ^c, the irreducible Ind_{G_K}^{G_ℚ}χ corresponds to the cuspidal automorphic induction of the associated Hecke character.
- For reducible r = χ₁ ⊕ χ₂ the matching π is the isobaric χ₁ ⊞ χ₂, not cuspidal: irreducibility is needed.

Finite-image all-place comparisons instantiate the strong Artin predicate. BLGGT and Newton–Thorne realizations belong to the separate regular-geometric refinement, and use the stated normalization and full local-comparison hypotheses.

([The principle of functoriality](#ref-arthur-2003), §4, Conjecture (Langlands [L1]) for G′ = {1}, p. 45 (Bull. AMS 40 (2003)).)

*Needs:* [Langlands' principle of functoriality (frontier statement)](#functoriality-conjecture); [Langlands' conjecture for Artin representations (the strong Artin conjecture)](#strong-artin-conjecture); [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTIN](#contract-c-artin).

<a id="fs-bundles-and-lisse-category"></a>
### 5.7 Bundles on the relative curve and their lisse categories

For a local field E of residue characteristic p and a connected reductive E-group G, construct Bun_G as the v-stack sending a perfectoid S in characteristic p to G-torsors on the relative Fargues–Fontaine curve X_S. Use the existing relative-curve and diamond foundations; the G-torsor stack, its descent and Hecke correspondences are additional constructions here. Retain its Newton stratification by B(G), the trivial-bundle basic stratum Bun_G¹≃[*/G(E)], and the inclusions of the strata. For ℓ≠p and the coefficient rings of FS Chapter VII, construct D_lis(Bun_G,Λ) as the lisse, solid ℓ-adic stable ∞-category, with pullback, extension by zero and the compact-object subcategory. Its restriction to the trivial stratum recovers the derived smooth G(E)-representation category. The union of all strata is not replaced by this one stratum.

Construct the local Hecke stacks of modifications at finite lists of legs, their convolution/fusion and the geometrical Satake sheaves. Their cohomological transforms give exact commuting Hecke functors with coherent Weil actions and coalescence of legs. These are the actual functors on D_lis, rather than operators on its Grothendieck group. The general stable-category, Ind-completion and adjoint-functor foundations are imported from EnhancedDerivedSheaves E0 and E5 (upstream PR #908); the Bun_G coefficient-category and Hecke/Satake realization are owned here, moved from the later geometrization direction.

Define D_lis inside solid complexes as the localizing subcategory generated by f♮Λ for separated representable cohomologically smooth f. Here f♮ is the left adjoint of pullback; solidification of the v-site left adjoint constructs it, with base change and the projection formula. On a stratum b its pullback identifies D_lis with derived smooth G_b(E)-modules. Compactness on Bun_G is equivalent to finite Newton support and compact restriction on every stratum; the generators are the f_{b,K}♮Λ attached to open pro-p subgroups K⊂G_b(E). Thus neither a solid category alone nor an assertion about the trivial stratum supplies this category.

For geometric Satake, use bounded-support, coefficient-flat perverse sheaves universally locally acyclic over the leg space. Construct fusion by extension from distinct legs, retaining the parity correction in its commutativity constraint. The fibre functor takes values in continuous Weil representations; relative Tannakian reconstruction and the rank-one PGL₂ calculation identify its group with Ĝ, including the cyclotomic pinning. A chosen √q removes that pinning twist. The global transform is `T_V(A)=p₂♮(p₁* A ⊗ S′_V)` with the normalized Satake kernel S′_V. Dualizability supplies its two adjoints and hence compact preservation; the Weil action comes from descent along the leg space. These constructions include arbitrary connected reductive G and finitely many legs.

The Satake construction has three intermediate targets. First, hyperbolic localization and the codimension bound for the collision diagonal show that restriction to distinct legs is fully faithful on the flat perverse ULA category. Proper convolution pushforward extends the exterior product and remains flat perverse ULA; this defines fusion and its associativity, and the parity of the connected component corrects commutativity. Second, construct the left adjoint to the fibre functor on each bounded Schubert support. Highest-cell cohomology gives finite free fibres: a uniform annihilator of the torsion in the lower-cell contributions makes the successive coefficient lifts stabilize. The resulting Peter–Weyl objects and relative monadic descent reconstruct the Hopf algebra, with the multi-leg tensor-product comparison. Third, identify the integral group. Constant terms embed the dual torus, the rank-one ℙ¹ calculation determines its root lines and their Tate twists, and highest weights identify the generic and special reductive fibres. Apply the integral-closure argument in VI.11 with its prime-2 exception: reduction to adjoint G gives simply connected dual group, so the exceptional odd-orthogonal derived factor cannot occur. This reduction is necessary before using the integral reductivity criterion. Recover the pinning from the flag variety and its degree-two root-line cohomology, then descend the construction with its Weil action.

For the transform, construct relative Verdier duals of ULA objects and the comparison between the solid left adjoint and torsion étale !-pushforward on those kernels (VII.5.1–VII.5.2). Testing on étale extension-by-zero generators and duality proves that comparison; it is not an identification of the two operations on every solid object. Apply it to the normalized dual Satake kernel. Demazure resolutions reduce preservation of D_lis to proper cohomologically smooth correspondences. The dual representation gives both adjoints of T_V, so T_V preserves compact objects. Descent of the legs from the divisor space to B W_E supplies the coherent Weil action.

**API.**

- `BunG / newtonStratum / trivialStratum` classify torsors with v-descent, retain their Newton type and identify the trivial stratum with [*/G(E)].
- `DLisBunG / compactObjects` form the lisse solid coefficient category and its compact subcategory with restriction and extension-by-zero operations.
- `HeckeModification / satakeSheaf / HeckeFunctor` give the actual correspondence, coefficient sheaf and resulting transform; the transform preserves compact objects in the stated coefficient setting.
- `SatakeFlatULA / satakeFusion / collisionRestriction_fullyFaithful` retain coefficient flatness, the collision bound and the parity-corrected symmetric constraint.
- `satakeFibre / boundedPeterWeyl / satakeTannakaGroup / pinnedDualComparison` construct the fibre functor, its bounded-support adjoints and the integral pinned dual-group comparison, with the prime-2 reduction just described.
- `relativeULADual / normalizedSatakeKernel / heckeTransform_preservesDLis` supply the relative duality comparison and the actual normalized transform.
- `HeckeFunctor_coalescence / _fusion / _weilAction` give coherent leg-coalescence and composition identities and commuting Weil action, not merely identities in K₀. Prove the neutral-stratum smooth-representation comparison and preservation of compact objects by the Hecke action in the stated coefficient setting.

**Checks.**

- For G=GL₁ the degree strata are indexed by ℤ, and the trivial-bundle stratum has automorphism group E×.
- A modification by the standard rank-one character changes degree; confining every Hecke functor to degree zero would fail.
- The zero sheaf is compact and every exact Hecke functor sends it to zero.
- Two legs and their transposition give coherently commuting transforms, rather than merely equal classes in K₀.
- The PGL₂ minuscule Schubert variety is ℙ¹, with fibre-functor cohomology Λ⊕Λ(−1). Omitting the Tate twist would give the wrong Weil pinning.
- A complex with infinitely many nonzero Newton-stratum restrictions is not compact, even if each restriction separately is compact.

- Fusion with the tensor unit leaves the kernel unchanged; restricting three distinct legs and fusing in either order gives the same kernel; exchanging two odd-parity components contributes the parity sign. An uncorrected symmetric constraint fails the third check.
- On a point Schubert support the Peter–Weyl adjoint is the coefficient ring; on ℙ¹ its two finite free cohomology groups survive reduction modulo ℓ; coefficient base change of their fibre must agree with first reducing the sheaf. A rational-only fibre calculation cannot establish these integral comparisons.
- The trivial relative ULA kernel has itself as dual; the dual of the standard Satake kernel is the contragredient kernel with its normalization; the evaluation and coevaluation composites are identities. These test the duality used to obtain both adjoints of the Hecke transform.

([Fargues–Scholze](#ref-fargues-scholze-2021), Definition III.1.2 and Proposition III.1.3 pp.88–89, Theorem III.2.4 pp.91–92 and Theorem IV.1.19 pp.112–113; Definition VI.9.1 and Proposition VI.9.4 pp.226–230, Propositions VI.10.1–VI.10.3 pp.230–234, Theorem VI.11.1 and proof pp.235–239; Proposition VII.3.1 pp.257–258, Definition VII.6.1 pp.268–269, Propositions VII.7.1–VII.7.4 pp.271–274; Proposition IX.2.1, Theorem IX.2.2 and Corollaries IX.2.3–IX.2.4 pp.321–324, arXiv v4.)

*Needs:* FarguesFontaineDiamonds, relative curve and v-stacks; DiamondsAndVStacks, v-descent; DiamondEtaleCohomology, étale operations; DiamondSixOperations and AdicCoefficientsAndComparisons, their stated coefficient operations; EnhancedDerivedSheaves E0 and E5, stable ∞-categories and Ind-completion; TauCetiRoadmap.ReductiveGroups, G-torsors and dual groups. The extra Bun_G, Satake and Hecke constructions just specified are targets here; the lower diamond theory is not claimed to supply them.

<a id="fs-parameter-stack"></a>
### 5.8 The Weil cocycle stack and its coherent support

Fix a pinned action of W_E on Ĝ through a finite quotient Q. Construct the scheme Z¹(W_E,Ĝ)_Λ of continuous cocycles, with continuity in the relatively discrete condensed Λ-algebra sense, and its quotient Par_G=Z¹(W_E,Ĝ)_Λ/Ĝ. It is a union of open-and-closed affine levels Z¹(W_E/P,Ĝ), P an open wild-inertia subgroup, each flat local complete intersection over ℤ_ℓ. Form Perf(Par_G), its subcategory Perf_qc of quasicompactly supported perfect objects and the bounded coherent quasicompactly supported category. Construct the cotangent/obstruction-space description and the nilpotent cone defining singular support; D_coh,Nilp^{b,qc} is the full subcategory with that support condition. Nilpotent singular support is automatic with characteristic-zero coefficients or at banal ℓ, and is not silently removed integrally at a bad prime.

At a parameter φ the tangent complex is `RΓ(W_E,ĝ_φ)[1]`; Weil duality gives the cotangent complex `RΓ(W_E,ĝ*_φ(1))[1]`. Define the cone of singularities from H¹ of the dual cotangent complex. On a syntomic affine chart X over a regular noetherian base S, Hochschild cohomology acts on the self-Ext of a bounded coherent complex, giving a module over the functions on this cone. Its support is singular support. Prove coherence, smooth descent to Par_G and the criterion that zero-section support is equivalent to perfectness. Define the nilpotent locus using the coadjoint cone in ĝ*: its orbit closures contain zero. An identification ĝ≅ĝ* is an additional hypothesis, not an integral convention. For coherence work locally with B=R/(f₁,…,f_c), a regular sequence in a regular noetherian smooth algebra R over the regular base. Construct the commuting degree-two complete-intersection operators on Ext*_B(M,N). Gulliksen Theorem 3.1(ii), pp.174–175, makes this graded module finite over B[u₁,…,u_c] when Ext*_R(M,N) is finite as a total R-module. Localization gives that hypothesis here; truncation triangles extend it to bounded coherent complexes. In the proof, the Koszul resolution gives degree-two connecting maps, their commutation follows from the signed two-variable exact diagram, and induction over the sequence proves finite generation (Lemma 3.2 and proof of Theorem 3.1, pp.175–180). Identify these operators with the Hochschild action and quotient by the relations coming from the differential of the cotangent complex to obtain coherence over O(Sing). Arinkin–Gaitsgory Appendix D, Theorem D, pp.135–136 of arXiv v3, gives the corresponding codimension-one induction over a characteristic-zero field; it is not by itself the integral theorem. For perfectness, Jorgensen Corollary 1.2, p.2 of the 2007 author preprint, states: over a local complete intersection of codimension c, Ext^i_B(M,M)=0 for n≤i≤n+c, n≥1, is equivalent to pd_B(M)<n for a finitely generated module M. Theorem 1.1 proves this by induction on a regular sequence using the change-of-rings long exact sequence; completion and Tor-rigidity over the regular local ambient ring give the corollary. FS VIII.2.9 reduces a bounded coherent complex to such a module modulo a perfect cone. Since B is locally a complete intersection and hence Gorenstein, the two long exact Ext sequences transfer eventual self-Ext vanishing to the module; the corollary then gives finite projective dimension. This uses both the complete-intersection and Gorenstein properties of the charts, rather than asserting the self-Ext criterion for every Gorenstein ring.

Construct the cocycle levels using a finite wild quotient P and a tame Frobenius/inertia presentation. The relation σ⁻¹τσ=τ^q gives a derived relation fibre; sufficiently divisible tame powers become unipotent, so the binomial formula extends the discrete cocycle continuously. The wild kernel is locally constant because a prime-to-ℓ finite-order matrix sufficiently close to the identity is the identity. The deformation complex is continuous Weil cohomology, of cohomological dimension two and Euler characteristic zero. To prove the expected dimension of a level in characteristic ℓ, fix the prime-to-ℓ inertial type, pass to its reductive centralizer, and stratify its tame unipotent part by the finitely many unipotent orbits. The dimension of an orbit plus its centralizer is dim Ĝ. The resulting dimension bound and the relation presentation prove flatness and the local-complete-intersection assertion, rather than assuming unobstructedness.

The perfect-generation theorem used by the next target requires ℓ∤|π₁(Ĝ)_tor|. Plan its modular representation input here. Define a good filtration by the dual Weyl modules ∇(λ), with criterion H^i(Ĝ,V⊗∇(λ))=0 for i>0. Kempf vanishing, the tensor-product theorem and the good-filtration t-structure control the equivariant bar resolutions; ordinary characteristic-zero semisimplicity cannot replace them. For the tame relation fibre, the identity section is generated by algebraic representations precisely under the stated prime restriction. Prove this by a prime-to-ℓ simply connected cover, trace splitting, and the equivariant flag-divisor resolution; pullback by (g₁,g₂)↦g₁g₂⁻¹ gives the diagonal resolution. This proves perfect generation for twisted powers Ĝ^n and their relation fibre products. For a finite wild p-group, induct through cyclic subquotients: its centralizer has reductive identity component and component group of order prime to ℓ; restriction preserves good filtrations. The formal completion along the fixed locus of a prime-order automorphism admits the averaging retraction given by the unique prime-to-ℓ root of its norm. Its extra degeneracy contracts the bar resolution. These steps give generation after each wild centralizer reduction. Finally, animated group presentations by free groups and descent identify the colimit of the free-group cocycle algebras with the actual continuous-cocycle algebra in Ind Perf(BĜ). This is the integral assertion of VIII.5.1, with VIII.5.2–VIII.5.21 providing its intermediate targets.

**API.**

- `GoodFiltration / goodFiltration_cohomologyCriterion / goodFiltration_tensor / goodFiltration_centralizerRestriction` give the modular filtration, acyclicity, tensor stability and solvable prime-to-ℓ centralizer comparisons used above.
- `identitySection_perfGenerated / twistedPower_perfGenerated / relationFibre_perfGenerated / wildLevel_perfGenerated` retain the prime restriction and the tame-to-wild induction, including derived relation fibres.
- `weilCocycleScheme / parameterStack / levelOpenClosed` construct continuous cocycles, the conjugation quotient and its finite-wild-inertia levels, respecting coefficient base change.
- `universalParameterTorsor` is the universal Ĝ⋊Q-torsor with its W_E-equivariance; it retains stabilizers in the quotient.
- `perfectQC / coherentBoundedQC / nilpotentSingularSupport` form the stated categories and support predicate; level restriction and extension preserve the specified support bounds.
- `parameter_invariantBaseChange / parameter_perfGeneration` supply FS I.8.2 under its prime restriction for constructing the spectral action. A coarse space of semisimple conjugacy classes does not carry this universal torsor or these categories.

**Checks.**

- A rank-one unramified cocycle is determined by its Frobenius value, with its nontrivial Ĝ stabilizer retained in the quotient.
- A noncompact union of levels need not have a quasicompactly supported structure sheaf.
- The two GL₂ Weil–Deligne representations with the same semisimple Weil part and zero versus rank-one N give the monodromy distinction that a semisimple-class map forgets.
- A bounded coherent complex with non-nilpotent singular support fails the integral support predicate even when it has quasicompact support.
- For B=k[[x,y]]/(xy) and M=(x), odd positive self-Ext can vanish while pd_B(M) is infinite (Jorgensen Remark 1.6, pp.3–4); one vanishing odd degree cannot replace eventual vanishing. A finite projective module has zero positive self-Ext and zero-section singular support.

- The trivial Ĝ-module and each ∇(λ) have a good filtration, and tensoring two such filtered modules preserves it. For Ĝ=SL₂ in characteristic 2, Sym² of the standard module has the stable submodule spanned by x²,y² and is not semisimple; good filtration must allow this example.
- For Ĝ=PGL_ℓ the torsion in π₁(Ĝ) has order ℓ, so the identity-section generation theorem's integral hypothesis fails. For a split torus that torsion is zero. Inverting ℓ in the first example recovers the rational statement.
- A free group on zero generators gives BĜ and on one generator gives Ĝ/Ĝ with conjugation. Imposing one relation takes a derived fibre: its excess tangent/obstruction space must agree with continuous H¹/H² of the corresponding Weil deformation problem.
- Averaging for a cyclic group of order p≠ℓ uses the inverse of p and fixes invariant elements; it commutes with coefficient reduction. For a cyclic group of order ℓ over characteristic ℓ that inverse is absent, so the same contraction cannot be used.

([Fargues–Scholze](#ref-fargues-scholze-2021), Theorems VIII.1.3 and VIII.5.1 with proofs, pp.278–281 and 293–315; Proposition VIII.2.1–Corollary VIII.2.3 pp.281–282, Definitions VIII.2.6/VIII.2.8 and Theorems VIII.2.7/VIII.2.9 pp.283–284, Proposition VIII.2.11 pp.284–285; §I.10 pp.37–38 for the conjectural support convention, arXiv v4.)

*Needs:* SchemeAndStackFoundations, quotient stacks; EnhancedDerivedSheaves E5, stable categories and Ind-completion; ReductiveGroups, dual root data; LocalGaloisGroups, Weil groups. The parameter-stack cotangent calculation is owned here, rather than asserted to be an export of a general enhanced-category target. The complete-intersection operators, finite generation, perfectness criterion and smooth descent just specified construct the singular-support specialization on these syntomic parameter-stack charts.

<a id="categorical-llc-construction"></a>
### 5.9 The spectral action and canonical Whittaker adjunction

Let Λ be the ring of integers of a finite extension of ℚ_ℓ(√q), ℓ≠p and ℓ∤|π₀Z(G)|. On a small idempotent-complete Λ-linear stable ∞-category C, construct the equivalence between compactly supported Perf(Par_G)-actions and systems, functorial in finite I and compatible with coalescence, of exact Rep_Λ(Q^I)-linear monoidal functors
`Rep_Λ((Ĝ⋊Q)^I) → End_Λ(C)^{B W_E^I}`.
Compact support means that the action on each X∈C factors through one level Z¹(W_E/P,Ĝ)/Ĝ; the level may depend on X. The universal equivariant torsor supplies one direction. Prove the reverse through the generators, relations and invariant-base-change theorem of the preceding target. Over a field containing ℚ_ℓ the same assertion holds for any ℓ≠p, as in FS I.10.1.

For rational coefficients first present the parameter anima over BQ as a sifted colimit of finite simplicial Q-sets. Reductive representation semisimplicity makes Perf of the corresponding quotient commute with these colimits. Finite-set Yoneda and the tensor product of module categories then identify an action with the displayed monoidal functors and their coalescence maps (X.1.1–X.1.3). For integral coefficients this colimit argument is false without modification. Construct the animated universal category from finite Q-torsor sets instead; highest-weight tensor products establish its universal property. A free group on n generators gives the module category for O(Ĝ^n) by the circle pushout, and a general group is a sifted colimit of free groups. The integral perfect-generation theorem of the preceding target identifies this animated category with Perf of the continuous parameter stack (X.3.1–X.3.4). Retain the finite-wild-level bound object by object when applying this equivalence to the geometric Hecke functors. Idempotent completion and the integral prime restriction are hypotheses of the construction.

Apply this equivalence to the geometrically constructed Hecke action on C=D_lis(Bun_G,Λ)^ω, extend by colimits, and construct its central excursion operators and semisimple parameter assignment. For quasi-split G and fixed Whittaker data, extend the coefficient ring to O_L[1/d], d=|π₀Z(G)|, and define W_ψ by extension by zero of c-Ind_U(E)^G(E) ψ from Bun_G¹. Define Φ(M)=Act_M(W_ψ) on Ind Perf_qc and construct its canonical right adjoint R by presentability. The assertion that R restricts to the stated coherent equivalence is the **next conjectural target**, rather than a property included in this construction.

**API.**

- `animatedParameterCategory / freeGroupParameterModule / animatedToContinuousPerf` construct the integral universal category and its comparison with actual parameter-stack perfect complexes, rather than applying rational semisimplicity integrally.
- `spectralActionEquiv / compactlySupportedAction` identify Perf-actions with the displayed coalescent systems of Weil-equivariant monoidal functors, with a level bound for each object.
- `geometricSpectralAction / excursionOperator / semisimpleParameter` apply the equivalence to the actual Hecke functors and extract their central operators and parameter assignment.
- `whittakerSheaf / whittakerActionFunctor / whittakerRightAdjoint` form extension by zero of compact induction and its canonical action adjunction, with unit, counit and Perf-linearity. The functor and its right adjoint are fixed by this construction; an arbitrary equivalence of unrelated categories cannot witness the conjecture.

**Checks.**

- Acting by the tensor unit gives the identity endofunctor.
- After the indicated colimit extension, the spectral structure sheaf acts on W_ψ as W_ψ, without claiming global quasicompact support.
- A single X can admit a finite wild-inertia level without one level working uniformly for all X.
- If ℓ|d, the integral coefficient statement has not been proved until d is inverted.
- Adjunction alone neither proves full faithfulness nor identifies the essential image.

- The animated construction on the empty free generating set recovers Rep(Ĝ); one free generator recovers modules over O(Ĝ) with conjugation; a free generating set of size n recovers O(Ĝ^n). Discarding the diagonal conjugation action changes all three quotient categories.
- Permuting two free generators permutes the two algebra factors; coalescing their legs agrees with the multiplication prescribed by the universal monoidal functor; imposing a group relation agrees with the derived relation fibre in §5.8. These test the relations, rather than only objectwise existence of an action.
- At an integral bad prime a non-split algebraic-representation extension remains an extension in the animated category. Replacing it by its semisimplification before constructing the universal functor does not satisfy the integral universal property.

([Fargues–Scholze](#ref-fargues-scholze-2021), Theorem I.10.1 pp.37–38 and the construction preceding Conjecture I.10.2 p.38; Theorems X.0.1–X.0.2 pp.339–340, Propositions X.1.1–X.1.3 pp.341–344 and Propositions X.3.1–X.3.4 pp.348–350, arXiv v4. The categorical and geometric constructions are the targets in the two preceding sections.)

*Needs:* [Bun_G and its Hecke category](#fs-bundles-and-lisse-category); [the parameter stack](#fs-parameter-stack); EnhancedDerivedSheaves E5:presentability and E5:abstract, Ind-completion, exact monoidal actions and adjoints.

<a id="categorical-local-langlands-conjecture"></a>
### 5.10 The categorical local Langlands conjecture of Fargues–Scholze (frontier statement)

Fargues–Scholze Conjecture I.10.2. Let E be a nonarchimedean local field with residue characteristic p and cardinality q, ℓ≠p, and G quasi-split. Choose a Borel B, a generic character ψ:U(E)→O_L^× for an algebraic L/ℚ_ℓ, and √q∈O_L. If d=|π₀Z(G)|, put Λ=O_L[1/d]. Let W_ψ on the neutral stratum Bun_G^1 be the sheaf of c-Ind_{U(E)}^{G(E)}ψ. Extend the spectral action on W_ψ by colimits to Φ:Ind Perf^{qc}(Z¹(W_E,Ĝ)_Λ/Ĝ)→D_lis(Bun_G,Λ). Its canonical right adjoint is fully faithful on compact objects and induces the Perf(Z¹(W_E,Ĝ)_Λ/Ĝ)-linear equivalence D_lis(Bun_G,Λ)^ω≃D_coh,Nilp^{b,qc}(Z¹(W_E,Ĝ)_Λ/Ĝ). The target consists of bounded complexes with coherent cohomology, quasicompact support and nilpotent singular support. This is a conjecture about stable ∞-categories and a specified adjunction. The established semisimple parameter map does not supply it. The torus case is known in Zou Theorem 6.4.1 over ℤ_ℓ (ℓ≠p), using the canonical action on the unique Whittaker sheaf; Theorem 6.4.5 proves t-exactness and Remark 6.4.7 gives scalar extension. For tori the square-root choice is unnecessary. This known specialization does not settle the assertion for a general quasi-split group.

Exactly the field, group, Whittaker, square-root and coefficient conditions in the statement. Inverting d is necessary for the spectral action constructed in the cited edition.

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.CategoricalLLC`: The canonical Whittaker spectral-action right adjoint induces the compact/coherent equivalence with the stated singular-support and coefficient conditions.
- `TauCeti.Functoriality.CategoricalLLC.implies_semisimple`: CatLLC is compatible with the semisimple parametrisation of Fargues–Scholze (part of the statement).
- `TauCeti.Functoriality.CategoricalLLC.torus`: Zou Theorem 6.4.1: for any E-torus T and ℓ≠p, the canonical Whittaker spectral-action functor identifies the bounded coherent quasicompact nilpotent-support side with compact D_lis(Bun_T,ℤ_ℓ). It is t-exact (6.4.5), extends by scalars (6.4.7), and needs no √q.

Definition of the proposition as stated by Fargues–Scholze, Conjecture I.10.2; the objects are constructed in the three preceding targets, using the lower-tier enhanced-category and diamond foundations.

**Checks.**

- For GL₁, Bun strata are indexed by ℤ. The canonical equivalence identifies a compact complex on a fixed degree stratum with a perfect complex on the corresponding character-gerbe weight piece; the parameter and Bernstein-center actions agree with local class field theory.
- For GL₂, the Weil–Deligne data with r=|·|^{1/2}⊕|·|^{−1/2} and N=0 or N of rank one have the same semisimple Weil part and different monodromy. The categorical parameter/support interface must distinguish these points; the semisimple assignment alone cannot supply that distinction.
- After Ind-completion or restriction to a connected component, the structure sheaf is sent to the Whittaker sheaf by Φ. Neither global sheaf is falsely required to have quasicompact support on all components.

No instance of LLC(G, E) or of Functoriality is inferred from it in this roadmap.

([Geometrization of the local Langlands correspondence](#ref-fargues-scholze-2021), §I.10, Conjecture I.10.2, p. 38 (arXiv:2102.13459v4); [The categorical form of Fargues’ conjecture for tori](#ref-zou-2024), Theorems 6.4.1, 6.4.5 and Remark 6.4.7, pp. 25–27.)

*Needs:* [The local Langlands conjecture for a general reductive group (frontier statement)](#local-langlands-conjecture-general); [the spectral-action construction](#categorical-llc-construction); [Assertions with explicit hypotheses](#endpoint-status-register); [C-CATEGORICAL](#contract-c-categorical).

<a id="symmetric-power-functoriality-implies-ramanujan"></a>
### 5.11 Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)

Let π be a unitary cuspidal automorphic representation of GL₂(𝔸_F). If for every n ≥ 1 the lifts Symⁿπ and Symⁿπ^∨ have compatible unitary cuspidal realizations, or isobaric realizations all of whose cuspidal constituents are unitary (it suffices to have such realizations over finite extensions of F), then π_v is tempered at every place v where π is unramified (Ramanujan): from the Rankin–Selberg L-functions L(s, Symⁿπ × Symⁿπ^∨) and the Jacquet–Shalika bound |α| < q_v^{1/2} for the Satake parameters of unitary cuspidal representations of GL_{n+1} one gets |α_v|^n < q_v^{1/2} for all n, hence |α_v| = 1.

π unitary cuspidal on GL₂. For unbounded positive n, Sym^nπ has a compatible unitary cuspidal realization, or an isobaric realization whose constituents are all unitary cuspidal; the potential version has such realizations over finite extensions. Arbitrary nonunitary isobaric automorphy alone is insufficient for the Satake bound.

State the resulting comparison as `TauCeti.Functoriality.ramanujan_of_symPower`.

Apply the Jacquet–Shalika bound to unitary cuspidal constituents, with the actual unramified local symmetric-power compatibility. This bounds |α_v|^n by q_v^{1/2} for unbounded n. For a place w|v of residue degree f in a potential field, the parameters become α_v^f and the norm becomes q_v^f; cancel f from |α_v|^{fn}<q_v^{f/2}. Base change does not preserve raw absolute values. Apply the same estimate to both Satake parameters (or to the dual) and use unitarity of the determinant to conclude |α_v|=1.

ACC+ prove Ramanujan for weight-zero regular algebraic π over CM fields this way; BCGNT for Bianchi forms (Layer 4).

([ACC+](#ref-acc-2023), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2); [ACC+](#ref-acc-2023), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2).)

*Needs:* [Langlands' principle of functoriality (frontier statement)](#functoriality-conjecture); [Symmetric power lifts over number fields](#symmetric-power-lift-over-number-fields); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound); [EndoscopicTransferAndUnitaryTraceComparison §6.24, cyclic base change](https://github.com/TauCetiProject/TauCetiRoadmap/pull/999); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

### Examples

The identity L-homomorphism fixes each Satake conjugacy class, and composition of two all-place lifts composes their local parameters. For a character of GL₁ the local parameter is one-dimensional; for SL₂ packet fibers can have several members, so a bijection is not the general local Langlands predicate. Cyclic induction from a Galois-invariant character is noncuspidal and cannot supply the generic cuspidal conclusion of descent.

### Dependencies

The layer uses the exact supplier contracts above, Layer 1, Layer 3, AutomorphicLFunctionsAndLocalFactors, Layer AL.4, Layer 0, TauCetiRoadmap.ReductiveGroups, Layer 6, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula), [theta and metaplectic descent](#theta-and-metaplectic-descent), [the spectral-action construction](#categorical-llc-construction), AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound).

## Downstream consumers

Siegel modularity and abelian-surface modularity consume the classical packet, descent, weight-change and symplectic-pairing comparisons. Automorphic L-function applications consume the common-extension potential-automorphy and all-place symmetric-power results. Rank-two CM arithmetic consumes the purity and Sato–Tate conclusions. Each consumer keeps the field, irreducibility, local-condition and trace formula hypotheses of the theorem it uses.

## References

<a id="ref-howe-duality"></a>
- Wee Teck Gan and Shuichiro Takeda, *A proof of the Howe duality conjecture*, arXiv:1407.1995v3, Theorem 1.2, pp.1–3. [Primary text](https://arxiv.org/abs/1407.1995v3).

<a id="ref-ilm"></a>
- Atsushi Ichino, Erez Lapid and Zhengyu Mao, *On the formal degrees of square-integrable representations of odd special orthogonal and metaplectic groups*, arXiv:1404.2909v2, Theorem 3.1 and Proposition 4.6. [Primary text](https://arxiv.org/abs/1404.2909v2).

<a id="ref-shahidi-1997"></a>
- Freydoon Shahidi, *On non-vanishing of twisted symmetric and exterior square L-functions for GL(n)*, Pacific J. Math., Special Issue (1997), pp.311–322. [Primary PDF](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p17-s.pdf).

<a id="ref-qian-ordinarity"></a>
- Lie Qian, *Ordinarity of local Galois representations arising from Dwork motives*, arXiv:2103.00106v1 (2021), Theorems 1.1, 1.4, 1.6, 1.8 and §4. [Primary text](https://arxiv.org/abs/2103.00106v1).

<a id="ref-akt"></a>
- Patrick Allen, Chandrashekhar Khare and Jack Thorne, *Modularity of GL₂ over imaginary CM fields*, arXiv:1910.12986v2, §9. [Primary text](https://arxiv.org/abs/1910.12986v2).

<a id="ref-ant"></a>
- Patrick Allen, James Newton and Jack Thorne, *Automorphy lifting for residually reducible l-adic Galois representations, II*, arXiv:1912.11269v2, Theorems 1.1 and 6.1. [Primary text](https://arxiv.org/abs/1912.11269v2).

<a id="ref-nt-selmer"></a>
- James Newton and Jack Thorne, *Adjoint Selmer groups of automorphic Galois representations of unitary type*, arXiv:1912.11265v3, Theorems A–B and Definition 2.23. [Primary text](https://arxiv.org/abs/1912.11265v3).

<a id="ref-at"></a>
- Christos Anastassiades and Jack Thorne, *Raising the level of automorphic representations of GL₂ₙ of unitary type*, arXiv:1912.11267v2, Theorem 5.1, pp.19–20. [Primary text](https://arxiv.org/abs/1912.11267v2).

<a id="ref-serre-1981"></a>
- Jean-Pierre Serre, *Quelques applications du théorème de densité de Chebotarev*, Publ. Math. IHÉS 54 (1981), §8.2, Theorem 20 and Corollary 2, pp.188–190. [Primary text](https://www.numdam.org/item/PMIHES_1981__54__123_0/).

<a id="ref-blggt-2014-v4"></a>
- Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4 (9 December 2013), 93 pages; published in Ann. of Math. (2) 179 (2014), 501–609. Printed page = PDF page.

<a id="ref-newton-thorne-I"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for holomorphic modular forms](https://arxiv.org/pdf/1912.11261v3). arXiv:1912.11261v3 (27 September 2021), 101 pages; published in Publ. Math. IHÉS 134 (2021), 1–116. Printed page = PDF page.

<a id="ref-newton-thorne-II"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for holomorphic modular forms, II](https://arxiv.org/pdf/2009.07180v2). arXiv:2009.07180v2 (27 September 2021), 30 pages; published in Publ. Math. IHÉS 134 (2021), 117–152.

<a id="ref-kedlaya-ant-2025"></a>
- Kiran S. Kedlaya. [Notes on analytic number theory](https://kskedlaya.org/papers/ant-ptx.pdf). Author PreTeXt PDF, last modified 21 December 2025, 154 PDF pages.

<a id="ref-acc-2023"></a>
- P. B. Allen, F. Calegari, A. Caraiani, T. Gee, D. Helm, B. V. Le Hung, J. Newton, P. Scholze, R. Taylor, J. A. Thorne. [Potential automorphy over CM fields](https://arxiv.org/pdf/1812.09999v2). arXiv:1812.09999v2 (16 Jun 2022; accepted version) / Ann. of Math. 197 (2023), no. 3, 897–1113

<a id="ref-agikms-2024"></a>
- Hiraku Atobe, Wee Teck Gan, Atsushi Ichino, Tasho Kaletha, Alberto Mínguez, Sug Woo Shin. [Local intertwining relations and co-tempered A-packets of classical groups](https://arxiv.org/pdf/2410.13504v3). arXiv:2410.13504v3 (24 Jul 2026; v1 17 Oct 2024)

<a id="ref-arthur-2003"></a>
- James Arthur. [The principle of functoriality](https://www.claymath.org/library/cw/arthur/pdf/57.pdf). Bull. Amer. Math. Soc. (N.S.) 40 (2003), no. 1, 39–53 (electronically published 10 October 2002) Author archive at Clay; printed pages 39–53, 15 PDF pages.

<a id="ref-arthur-2013"></a>
- James Arthur. [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](http://web.archive.org/web/20120511125150id_/http://claymath.org/cw/arthur/pdf/Book.pdf). Book manuscript (pdfTeX, dated 30 May 2011, 535 pp.) formerly posted at claymath.org/cw/arthur/pdf/Book.pdf; published as AMS Colloquium Publications 61 (2013). Wayback Machine snapshot of 11 May 2012.

<a id="ref-arthur-clozel-1989"></a>
- James Arthur and Laurent Clozel. [Simple algebras, base change, and the advanced theory of the trace formula](https://www.claymath.org/library/cw/arthur/pdf/30.pdf). Annals of Mathematics Studies 120 (1989). Author archive at Clay; Chapter III, §6, pp. 214–219, supplies cyclic automorphic induction and its cuspidality criterion.

<a id="ref-bcg-2025"></a>
- George Boxer, Frank Calegari, Toby Gee. [Cuspidal cohomology classes for GL_n(Z)](https://arxiv.org/pdf/2309.15944v3). arXiv:2309.15944v3 (12 Sep 2024); published J. Amer. Math. Soc. 38 (2025)

<a id="ref-bcgnt-2025"></a>
- George Boxer, Frank Calegari, Toby Gee, James Newton, Jack A. Thorne. [The Ramanujan and Sato–Tate conjectures for Bianchi modular forms](https://arxiv.org/pdf/2309.15880v3). arXiv:2309.15880v3 [math.NT] (27 Mar 2025); published as Forum Math. Pi (2025), doi:10.1017/fmp.2024.29

<a id="ref-bcgp-2021"></a>
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. [Abelian surfaces over totally real fields are potentially modular](https://arxiv.org/pdf/1812.09269v3). arXiv:1812.09269v3 (28 Nov 2021, final version, 292 pp.) / Publ. Math. IHÉS 134 (2021), 153–501

<a id="ref-bcgp-2025"></a>
- George Boxer, Frank Calegari, Toby Gee, Vincent Pilloni. [Modularity theorems for abelian surfaces](https://arxiv.org/pdf/2502.20645v1). arXiv:2502.20645v1 (28 Feb 2025; only version)

<a id="ref-caraiani-newton-2023"></a>
- A. Caraiani, J. Newton. [On the modularity of elliptic curves over imaginary quadratic fields](https://arxiv.org/pdf/2301.10509v3). arXiv:2301.10509v3 (27 March 2025)

<a id="ref-cg-2018"></a>
- Frank Calegari, David Geraghty. [Modularity lifting beyond the Taylor–Wiles method](https://arxiv.org/pdf/1207.4224v2). arXiv:1207.4224v2 (16 Jul 2017) / published Invent. Math. 211 (2018) 297–433

<a id="ref-cg-2020"></a>
- Frank Calegari, David Geraghty. [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](http://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Duke Math. J. 169 (2020), no. 5, 801–896 (Duke typeset advance-publication copy, 96 pp., paginated 1–96) and arXiv:1907.08691v1 .

<a id="ref-chenevier-taibi-2020"></a>
- Gaëtan Chenevier, Olivier Taïbi. [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](https://pmihes.centre-mersenne.org/item/10.1007/s10240-020-00115-z.pdf). Publ. Math. IHÉS 131 (2020), 261–323 (open access, published version); arXiv:1907.08783v1

<a id="ref-ckpss-2004"></a>
- J. W. Cogdell, H. H. Kim, I. I. Piatetski-Shapiro, F. Shahidi. [Functoriality for the classical groups](https://www.numdam.org/item/PMIHES_2004__99__163_0.pdf). Publ. Math. IHÉS 99 (2004) 163–233 (Numdam scan with text layer)

<a id="ref-ct-2017"></a>
- L. Clozel, J. A. Thorne. [Level-raising and symmetric power functoriality, III](https://www.repository.cam.ac.uk/bitstreams/dc59bf8c-174b-4034-9f2f-070974d101af/download). Accepted manuscript dated December 10, 2015 (Apollo, Cambridge repository) / Duke Math. J. 166 (2017), no. 2, 325–402; not on arXiv

<a id="ref-fargues-scholze-2021"></a>
- Laurent Fargues, Peter Scholze. [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4 (27 Nov 2024)

<a id="ref-fkp-2022"></a>
- N. Fakhruddin, C. Khare, S. Patrikis. [Lifting and automorphy of reducible mod p Galois representations over global fields](https://arxiv.org/pdf/2008.12593v5). arXiv:2008.12593v5 (15 Oct 2021; final version) / Invent. Math. 228 (2022), 415–492

<a id="ref-fsy-2022"></a>
- J. Fresán, C. Sabbah, J.-D. Yu. [Hodge theory of Kloosterman connections](https://arxiv.org/pdf/1810.06454v5). arXiv:1810.06454v5 (13 Jun 2022) / Duke Math. J. 171 (2022)

<a id="ref-gan-ichino-2018"></a>
- Wee Teck Gan, Atsushi Ichino. [The Shimura–Waldspurger correspondence for Mp_2n](https://arxiv.org/pdf/1705.10106v3). arXiv:1705.10106v3 (3 August 2018); Ann. of Math. (2) 188 (2018), no. 3, 965–1016

<a id="ref-gan-savin-2023-g2"></a>
- Wee Teck Gan, Gordan Savin. [The local Langlands conjecture for G_2](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/2479D805B0F248C91A33671F3A03752E/S2050508623000276a.pdf/the-local-langlands-conjecture-for-dollarg2dollar.pdf). Forum Math. Pi 11 (2023), e28 (open access, CC BY 4.0); arXiv:2209.07346v2 (17 Dec 2022)

<a id="ref-gee-taibi-2019"></a>
- Toby Gee, Olivier Taïbi. [Arthur's multiplicity formula for GSp4 and restriction to Sp4](https://arxiv.org/pdf/1807.03988v1). arXiv:1807.03988v1 (11 Jul 2018; the only arXiv version) / J. Éc. polytech. Math. 6 (2019), 469–535 (journal pagination)

<a id="ref-gelbart-jacquet-1978"></a>
- Stephen Gelbart, Hervé Jacquet. [A relation between automorphic representations of GL(2) and GL(3)](https://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf). Ann. Sci. École Norm. Sup. (4) 11 (1978), no. 4, 471–542 (Numdam scan)

<a id="ref-ichino-prasanna-2023"></a>
- Atsushi Ichino, Kartik Prasanna. [Hodge classes and the Jacquet–Langlands correspondence](https://arxiv.org/pdf/1806.10563v2). arXiv:1806.10563v2 (10 July 2023, revised after referee reports); Forum Math. Pi 11 (2023), e22

<a id="ref-jiang-zhang-2020"></a>
- Dihua Jiang, Lei Zhang. [Arthur parameters and cuspidal automorphic modules of classical groups](https://arxiv.org/pdf/1508.03205v4). arXiv:1508.03205v4 (19 November 2019); Ann. of Math. (2) 191 (2020), no. 3, 739–827

<a id="ref-kim-2003"></a>
- Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak). [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf). J. Amer. Math. Soc. 16 (2003), no. 1, 139–183 (publisher PDF; an [archived publisher copy](https://web.archive.org/web/20150105224455id_/http://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf) is also available)

<a id="ref-kim-shahidi-2002"></a>
- Henry H. Kim, Freydoon Shahidi. [Functorial products for GL2 × GL3 and the symmetric cube for GL2](https://arxiv.org/pdf/math/0409607v1). Ann. of Math. 155 (2002) 837–893; arXiv:math/0409607v1 (30 Sep 2004) = the published text with journal pagination

<a id="ref-kmsw-2014"></a>
- Tasho Kaletha, Alberto Minguez, Sug Woo Shin, Paul-James White. [Endoscopic Classification of Representations: Inner Forms of Unitary Groups](https://arxiv.org/pdf/1409.3731v3). arXiv:1409.3731v3 (3 December 2014); not published in a journal

<a id="ref-kss-2021"></a>
- Robert Kurinczuk, Daniel Skodlerack, Shaun Stevens. [Endo-parameters for p-adic classical groups](https://arxiv.org/pdf/1611.02667v3). arXiv:1611.02667v3 (31 August 2020); Invent. Math. 223 (2021), no. 2, 597–723

<a id="ref-kw-2009-I"></a>
- Chandrashekhar Khare, Jean-Pierre Wintenberger. [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). author copy results.pdf (23 pp., PDF created 31 May 2009); published Invent. Math. 178 (2009) 485–504

<a id="ref-mok-2015"></a>
- Chung Pang Mok. [Endoscopic classification of representations of quasi-split unitary groups](https://arxiv.org/pdf/1206.0882v5). arXiv:1206.0882v5 (22 June 2013); published Mem. Amer. Math. Soc. 235 (2015), no. 1108

<a id="ref-nt-2026"></a>
- James Newton and Jack A. Thorne. [Symmetric power functoriality for Hilbert modular forms](https://arxiv.org/pdf/2212.03595v2). arXiv:2212.03595v2 (19 Feb 2025); published Ann. of Math. 203 (2026)

<a id="ref-pilloni-2020"></a>
- Vincent Pilloni. [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~pilloni/complexhidatheorygsp4.pdf). Author manuscript dated 17 June 2019, 113 pp.; Duke Math. J. 169 (2020), no. 9, 1647–1807, doi:10.1215/00127094-2019-0075. Locators use the author manuscript.

<a id="ref-qian-2023"></a>
- Lie Qian. [Potential automorphy for GL_n](https://arxiv.org/pdf/2104.09761v1). arXiv:2104.09761v1 (20 April 2021); Invent. Math. 231 (2023), 1239–1275, doi:10.1007/s00222-022-01161-6. Locators use arXiv v1.

<a id="ref-qian-thesis-2023"></a>
- Lie Qian. [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](https://stacks.stanford.edu/file/druid:yn815wp7042/Thesis%20Final%20Version-augmented.pdf). Stanford PhD thesis, June 2023, 78 pp. Numbering X.0.Y: Theorem 1.0.10 corresponds to published Theorem 1.1; Theorem 1.0.13 to Theorem 1.4; Lemma 3.0.11 to arXiv v1 Lemma 3.10(1)–(3); Lemma 3.0.12 and Remark 3.0.13 to published Lemma 3.12 and Remark 3.13; Proposition 4.0.1 to Proposition 4.1.

<a id="ref-ramakrishnan-2000"></a>
- Dinakar Ramakrishnan. [Modularity of the Rankin–Selberg L-series, and multiplicity one for SL(2)](https://arxiv.org/pdf/math/0007203v1). Ann. of Math. 152 (2000) 45–111; arXiv:math/0007203v1 (1 Jul 2000) with the Annals pagination

<a id="ref-dmw-2009"></a>
- Neil Dummigan, Phil Martin and Mark Watkins. [Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](https://archive.intlpress.com/site/pub/files/_fulltext/journals/pamq/2009/0005/0004/PAMQ-2009-0005-0004-a005.pdf). Pure Appl. Math. Q. 5 (2009), 1311–1341; public journal PDF, 31 pages.

<a id="ref-martin-watkins-2006"></a>
- Phil Martin and Mark Watkins. [Symmetric powers of elliptic curve L-functions](https://magma.maths.usyd.edu.au/~watkins/papers/antsVII.pdf). Public author PDF, 15 pages; ANTS VII (2006).

<a id="ref-pilloni-stroh-2016"></a>
- Vincent Pilloni and Benoît Stroh. [Surconvergence, ramification et modularité](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Artinfinal.pdf). Author final manuscript, published Astérisque 382 (2016), pp. 195–266; manuscript pagination used

<a id="ref-snowden-2009"></a>
- Andrew Snowden. [On two dimensional weight two odd representations of totally real fields](https://arxiv.org/pdf/0905.4266v1). arXiv:0905.4266, edition dated May 26, 2009

<a id="ref-moeglin-renard-2018"></a>
- Colette Mœglin and David Renard. [Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](https://arxiv.org/pdf/1802.04611v4). arXiv:1802.04611v4, 30 January 2019

<a id="ref-amr-2018"></a>
- Nicolas Arancibia, Colette Mœglin and David Renard. [Paquets d’Arthur des groupes classiques et unitaires](https://arxiv.org/pdf/1507.01432v2). arXiv:1507.01432v2, 31 January 2017; manuscript underlying the 2018 publication

<a id="ref-gan-takeda-2011"></a>
- Wee Teck Gan and Shuichiro Takeda. [The local Langlands conjecture for GSp(4)](https://annals.math.princeton.edu/wp-content/uploads/annals-v173-n3-p12-p.pdf). Annals of Mathematics 173 (2011), 1841–1882, journal PDF

<a id="ref-patrikis-taylor-2015"></a>
- Stefan Patrikis and Richard Taylor. [Automorphy and irreducibility of some l-adic representations](https://virtualmath1.stanford.edu/~rltaylor/irred.pdf). Public author manuscript, Compositio Mathematica 151 (2015), pp. 207–229; manuscript pagination used

<a id="ref-zou-2024"></a>
- Konrad Zou. [The categorical form of Fargues’ conjecture for tori](https://arxiv.org/pdf/2202.13238v2). arXiv:2202.13238v2, 6 August 2024

<a id="ref-schmidt-2017"></a>
- Ralf Schmidt. [Archimedean aspects of Siegel modular forms of degree 2](https://math.ou.edu/~rschmidt/papers/hodge.pdf). Rocky Mountain J. Math. 47 (2017), no. 7, 2381–2422; §2.3, pp. 2390–2391 (author PDF pp. 10–11).

<a id="ref-schmidt-2018"></a>
- Ralf Schmidt. [Packet structure and paramodular forms](https://sites.math.unt.edu/~schmidt/papers/packets_paramodular.pdf). Trans. Amer. Math. Soc. 370 (2018), 3085–3112; §§1.1–1.2, pp. 3088–3092.

<a id="ref-clozel-1990"></a>
- Laurent Clozel. [Motifs et formes automorphes : applications du principe de fonctorialité](https://www.jmilne.org/math/Books/AA1988a.pdf). In L. Clozel and J. S. Milne (eds.), Automorphic Forms, Shimura Varieties, and L-functions, vol. I, Perspectives in Mathematics 10, Academic Press (1990), pp. 77–159. Editor's public scan; printed page p is PDF page p+11. Theorem 3.13, p. 112, proof pp. 112–129; Lemme 4.9 and proof, pp. 144–145.

<a id="ref-adams-johnson-1987"></a>
- Jeffrey Adams and Joseph F. Johnson. [Endoscopic groups and packets of non-tempered representations](https://www.numdam.org/item/CM_1987__64_3_271_0.pdf). Compositio Mathematica 64 (1987), no. 3, pp. 271–309; §§2–3, pp. 277–286, and §10, pp. 305–308.

<a id="ref-blght-2011"></a>
- T. Barnet-Lamb, D. Geraghty, M. Harris, R. Taylor. [A family of Calabi–Yau varieties and potential automorphy II](https://ems.press/content/serial-article-files/41128). Publ. RIMS 47 (2011), 29–98; Lemma 2.2 pp.44–45.

<a id="ref-serre-1972"></a>
- Jean-Pierre Serre. [Propriétés galoisiennes des points d'ordre fini des courbes elliptiques](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5874918517843398173_Serre_proprie_te_s_galoisiennes_des_courbes_elliptiques.pdf). Invent. Math. 15 (1972), 259–331; §4.2 Theorem 2, pp.294–299, and §4.4, pp.299–300. Author institution's public scan.

<a id="ref-harder-1987"></a>
- Günter Harder. [Eisenstein cohomology of arithmetic groups. The case GL₂](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0089/LOG_0009.pdf). Invent. Math. 89 (1987), 37–118; §§3.1–3.2, pp.59–65, and §3.6, pp.73–74. Göttingen Digitisation Centre's article scan.

<a id="ref-ct-2015"></a>
**Clozel–Thorne II.** L. Clozel and J. A. Thorne, *Level raising and symmetric power functoriality, II*, Annals of Mathematics 181 (2015), pp.303–359. [Journal PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v181-n1-p05-p.pdf).

<a id="ref-gulliksen-1974"></a>
**Gulliksen.** T. H. Gulliksen, *A change of ring theorem with applications to Poincaré series and intersection multiplicity*, Mathematica Scandinavica 34 (1974), pp.167–183. [Journal PDF](https://journals.msp.org/mscand/article/download/2128/2127), Theorem 3.1 and Lemma 3.2, pp.174–180.

<a id="ref-arinkin-gaitsgory"></a>
**Arinkin–Gaitsgory.** D. Arinkin and D. Gaitsgory, *Singular support of coherent sheaves, and the geometric Langlands conjecture*. [arXiv:1201.6343v3](https://arxiv.org/abs/1201.6343v3), Appendix D, Theorem D, pp.135–136; characteristic-zero coefficients.

<a id="ref-emerton-jacquet"></a>
**Emerton.** M. Emerton, *Jacquet modules of locally analytic representations of p-adic reductive groups I. Construction and first properties*, Annales scientifiques de l’École normale supérieure 39 (2006), pp.775–839. [Author draft, 17 December 2007](https://www.math.uchicago.edu/~emerton/pdffiles/jacquet.pdf); draft numbering is used in §4.3.

<a id="ref-emerton-vectors"></a>
**Emerton, analytic vectors.** M. Emerton, *Locally analytic vectors in representations of locally p-adic analytic groups*, Memoirs AMS 248 (2017), no.1175. [Author manuscript](https://www.math.uchicago.edu/~emerton/pdffiles/analytic.pdf), §§1.1–1.2, pp.14–15 and 21–28; weak Fréchet–Stein and coadmissible systems.

<a id="ref-kpx"></a>
**Kedlaya–Pottharst–Xiao.** K. S. Kedlaya, J. Pottharst and L. Xiao, *Cohomology of arithmetic families of (φ,Γ)-modules*, JAMS 27 (2014), pp.1043–1115. [arXiv:1203.5718v3](https://arxiv.org/abs/1203.5718v3), Theorems 4.4.3–4.4.5 and 6.3.9, Corollary 6.3.10.

<a id="ref-nakamura"></a>
- Kentaro Nakamura, *Deformations of trianguline B-pairs and Zariski density of two dimensional crystalline representations*, J. Math. Sci. Univ. Tokyo 20 (2013), 461–568. [Journal repository](https://repository.dl.itc.u-tokyo.ac.jp/record/39992/files/jms200401.pdf), Lemma 2.35, Proposition 2.37 and Corollary 2.38, pp.493–495.

<a id="ref-hellmann-schraen"></a>
- Eugen Hellmann and Benjamin Schraen, *Density of potentially crystalline representations of fixed weight*, Compos. Math. 152 (2016), 1609–1647. [Author manuscript](https://math.univ-lyon1.fr/homes-www/schraen/potBTdensevf.pdf), Proposition 2.6 and proof, p.10; sign convention p.4.

<a id="ref-jorgensen"></a>
- David A. Jorgensen, *Finite projective dimension and the vanishing of Ext_R(M,M)*, Comm. Algebra 36 (2008), 4461–4471. [University preprint 2007-05](https://cdn.prod.web.uta.edu/-/media/project/website/science/mathematics/documents/preprint/2007/rep2007_05.pdf), Theorem 1.1 and Corollary 1.2 with proofs, p.2, and Remark 1.6, pp.3–4.

<a id="ref-belt-square"></a>
**Belt.** Dustin Belt, *On the holomorphy of exterior-square L-functions*, [arXiv:1108.2200v7](https://arxiv.org/abs/1108.2200v7), Theorems 2.2, 5.2 and 6.2, pp.5,41–42,45. Only the partial Euler-product continuation is used here; this does not assert the completed-factor comparison.

<a id="ref-mw-spectral"></a>
**Mœglin–Waldspurger X.** Colette Mœglin and Jean-Loup Waldspurger, *Stabilisation de la formule des traces tordue X: stabilisation spectrale*, [arXiv:1412.2981v1](https://arxiv.org/abs/1412.2981v1), §2 pp.7–8; local error and vanishing §§3.2–3.9 pp.12–37; weighted characters §§4.5–4.8 pp.61–66; §5.9 p.81; restricted stabilization and globalization §§7.1–7.7 pp.89–105 and §9 pp.115–120; final stabilization §§8.1,8.5–8.6 pp.106–108,112–113.

<a id="ref-henniart-induction"></a>
- Guy Henniart. [Induction automorphe globale pour les corps de nombres](https://www.numdam.org/article/BSMF_2012__140_1_1_0.pdf). Bulletin de la Société Mathématique de France 140 (2012), no.1, pp.1–17. Theorems 3–6, pp.5–7; proofs §§2.6–3.7, pp.11–16, including the archimedean Remark on p.16.

<a id="ref-xu-local"></a>
- Bin Xu. [On L-packets for quasi-split general symplectic and even orthogonal groups](https://arxiv.org/pdf/1503.04897v4). arXiv:1503.04897v4, 28 February 2017. Proposition 4.4, Theorem 4.6 and Remark 4.7, pp.26–27; §§6.1–6.4.

<a id="ref-xu-global"></a>
- Bin Xu. [L-packets of quasisplit GSp(2n) and GO(2n)](https://arxiv.org/pdf/2103.15300v2). arXiv:2103.15300v2, 6 September 2021. Theorems 1.1–1.2 and 4.1–4.7; §§6–9.

<a id="ref-kashiwara-vergne"></a>
- Masaki Kashiwara and Michèle Vergne. [On the Segal–Shale–Weil representations and harmonic polynomials](https://www.cmls.polytechnique.fr/perso/vergne/publications2/Remplacer/78onthesegalshaleweil.pdf). Inventiones mathematicae 44 (1978), pp.1–47. Chapter II §§1–7, pp.9–28.

<a id="ref-howe-real"></a>
- Roger Howe. [Transcending classical invariant theory](https://www.math.utah.edu/~ptrapa/math-library/howe/howe-transcending-JAMS.pdf). Journal of the American Mathematical Society 2 (1989), pp.535–552. Theorems 1, 1A and 2.1; §§2–5, pp.537–550.

<a id="ref-roberts-similitudes"></a>
- Brooks Roberts. [The theta correspondence for similitudes](https://www.brooksroberts.org/A1996a.pdf). Israel Journal of Mathematics 94 (1996), pp.285–317. Propositions 3.3–3.5, pp.303–304; Lemma 4.2 and Theorem 4.4, pp.306–310.

<a id="ref-muic-2009"></a>
- Goran Muić. [Intertwining operators and composition series of generalized and degenerate principal series for Sp(4,ℝ)](https://web.math.pmf.unizg.hr/glasnik/44.2/44(2)-08.pdf). Glasnik matematički 44(64) (2009), pp.349–399. Corollary 5.2 and Lemma 8.1.

<a id="ref-schmidt-hodge"></a>
- Ralf Schmidt. [Archimedean aspects of Siegel modular forms of degree 2](https://math.ou.edu/~rschmidt/papers/hodge.pdf). Rocky Mountain Journal of Mathematics 47 (2017), pp.2381–2422. §§2.3,2.5,3.3.

<a id="ref-henniart-2009"></a>
- Guy Henniart. [Sur la fonctorialité, pour GL(4), donnée par le carré extérieur](https://www.mathnet.ru/php/archive.phtml?jrnid=mmj&option_lang=eng&paperid=335&wshow=paper). Moscow Mathematical Journal 9 (2009), no.1, pp.33–45; [archived publisher PDF](https://web.archive.org/web/20150922001048id_/http://www.ams.org/distribution/mmj/vol9-1-2009/henniart.pdf). Theorem 1.1, p.34; §§2–3, pp.37–43.

<a id="ref-kim-shahidi-cuspidality"></a>
- Henry H. Kim and Freydoon Shahidi. [Cuspidality of symmetric powers with applications](https://www.math.purdue.edu/~fshahidi/articles/Kim%20%26%20Shahidi%20%5B2002%2C%2021pp%5D---Cuspidality%20of%20symmetric%20powers%20with%20applications.pdf). Duke Mathematical Journal 112 (2002), pp.177–197; §§3.1–3.3, pp.180–186.

<a id="ref-shahidi-real"></a>
- Freydoon Shahidi. [Local coefficients as Artin factors for real groups](https://www.math.purdue.edu/~fshahidi/articles/Shahidi%20%5B1985%2C%2035pp%5D---Local%20coefficients%20as%20Artin%20factors%20for%20real%20groups.pdf). Duke Mathematical Journal 52 (1985), pp.973–1007; Theorems 3.1/3.13, pp.990–1003.

<a id="ref-wang-icosahedral"></a>
- Song Wang. [On the symmetric powers of cusp forms on GL(2) of icosahedral type](https://arxiv.org/pdf/math/0301074v3). arXiv:math/0301074v3, 31 January 2003, 18 pp.; Proposition 1.1 and Corollaries 1.2–1.3, pp.5–8, Proposition 3.1 and Theorem D, pp.12–14.
