**Summary.** Build modularity and automorphy results beyond classical GL₂ over ℚ: weight-one and totally real Artin representations, simultaneous potential automorphy over totally real and CM fields, symmetric power functoriality and its analytic consequences, and classical-group packet comparisons. The final layer states the precise Langlands conjectures used by conditional implications. Normalize every realization and Euler factor explicitly, and carry the trace formula hypotheses through the symplectic and unitary classifications.

# Roadmap: modularity and Langlands extensions

The starting objects are actual continuous Galois representations, automorphic representations, their local parameters and compatible systems. The intermediate results connect these objects by all-place comparisons and controlled field extensions. The principal consequences are symmetric power lifts for non-CM modular and Hilbert modular forms, purity and Sato–Tate for parallel-weight rank-two CM systems, and the packet and descent statements used in Siegel modularity.

## Scope and ownership

This roadmap owns the endpoint implications and the comparisons between their normalizations. It does not reconstruct the general deformation, automorphic, local-factor or cohomological theories from which those implications start. Each imported theorem is specified below with its exact mathematical scope.

TauCetiRoadmap.RepresentationTheory.ClassicalGroups, Layers 0–1, supplies the standard representations and functorial tensor, symmetric and exterior powers. TauCetiRoadmap.RepresentationTheory.CompactGroups, Layers 5–6 and its SU(2) engine, supplies Peter–Weyl, characters, Haar probability measure, the classification of the SU(2) irreducibles and Weyl integration. Sato–Tate here consumes these results to identify arithmetic conjugacy classes and prove equidistribution. The finite-field projective-image condition is a specialization of Mathlib's projective general and special linear groups; no projective-group foundation is introduced.

The current Tau Ceti elliptic library supplies `WeierstrassCurve.tateModuleGaloisRepresentation`, its continuous action for elliptic curves, and `TauCeti.det_tateModuleGaloisRepresentation` under the separably closed and characteristic hypotheses of that theorem. These are the Tate-module representation and its cyclotomic determinant. This roadmap consumes them through the rational cohomological dual comparison. The current newform API also supplies `HeckeRing.GL2.Newform.satakeParameters`, `satakeParameters_eq_pair_iff`, `satakeAngle` and `satakeParameters_eq_exp_satakeAngle` in `TauCeti.NumberTheory.ModularForms.Newforms.Satake`: the last comparison assumes prime p, trivial local nebentypus and the Ramanujan bound. It is an imported classical rational special case; it supplies neither that bound nor the CM-field Sato–Tate theorem. TauCetiRoadmap.LocalGaloisGroups and ProfiniteArithmetic supply their local and profinite foundations; their tame-module and character-compatible-system statements do not assert the automorphic comparisons specified here.

ClassicalSerreModularity and EllipticCurveModularity own classical rational modularity. GL2AutomorphicRepresentationsAndTransfer owns rank-two local Langlands, soluble Artin cases and rank-two base change. PotentialModularityAndCompatibleSystems owns compatible-system objects and their general operations and L-functions. The consumer comparisons below distinguish all-place automorphy from weak automorphy, and cuspidal automorphy from an isobaric direct sum.

AutomorphicGaloisRepresentationsPartII owns the actual Galois realization, Weil–Deligne and Hodge–Tate comparisons. AutomorphicFormsOnReductiveGroups owns archimedean local Langlands, algebraic weights, purity and real cohomological packet constructions. EndoscopicTransferAndUnitaryTraceComparison owns local factors, cyclic base change, automorphic induction and the trace formula inputs. AutomorphicLFunctionsAndLocalFactors supplies the analytic standard, Rankin–Selberg and Langlands–Shahidi results in the strengthened forms specified below.

The detailed eigenvariety, level-raising and tensor-lifting methods are imported from SymmetricPowersByAnalyticContinuation, SymmetricPowersByUnitaryLevelRaising, SymmetricPowerAutomorphyLifting and SymmetricPowersByTensorFunctorialityLifting. The Dwork and open-image arguments use PotentialAutomorphyDworkMotivesPartII and OpenImageTheoremsForAbelianVarieties. These six proposed owners have no supplied roadmap package or layer establishing these contracts. Their method and geometric comparisons are explicit missing prerequisites of the retained endpoints; they cannot yet be used as closed lower-tier imports.

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

## Exact supplier contracts

### From Mathlib and the elliptic library

Use `Polynomial.reverse`, `Polynomial.eval₂_reverse_mul_pow`, `Matrix.charpoly` and `Matrix.trace` with their actual degree, invertibility and finite-index hypotheses. Use `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.ProjGenLinGroup.map` and `Matrix.ProjectiveSpecialLinearGroup.toPGL` for the projective image inclusions. The last map is injective, the quotient map is surjective, and scalar extension is the induced map on central quotients. The finite sign kernel uses `AddSubgroup`, finite sums and `ZMod 2`. No algebraically closed, topological or Galois structure is inferred from these algebraic objects alone.

The elliptic library's Tate-module action and determinant are consumed with the cohomological comparison and characteristic-zero coefficient extension just described. Each theorem about H_{E,ℓ} must refer to that same representation; a detached matrix with the right determinant is insufficient.

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

The component-connects relation compares lifts of the same local residual representation, determinant and Hodge type in the actual generic fibre of its deformation ring. Ordinary and potentially diagonalizable predicates apply to the same continuous local representation and filtration/crystalline module. BCGNT 3.2.1 must export the specialized connects ALT used twice in 6.2.3, preserving all seventeen auxiliary-system conditions and the subsequent cyclic untensoring/descent. PotentialAutomorphyInfrastructure, Layer 5, §§5.22–5.23, supplies the ordinary/Fontaine–Laffaille endpoints, not this connects theorem, Caraiani–Newton 1.3 or CG18 5.16. The latter three are explicit missing lifting extensions; their statements cannot be attributed to the auxiliary-prime construction of PA.4.

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
#### C-CATEGORICAL: from ExcursionOperatorsAndSpectralAction, Layer ES5

Stable ∞-categories D_lis(Bun_G,Λ), Perf and Ind Perf of the actual parameter stack, compact objects, bounded coherent objects with quasicompact and nilpotent singular support, the spectral action on the specified Whittaker sheaf and its canonical colimit extension/right adjoint. These are needed to state FS I.10.2. An ordinary category/functor or a semisimple parameter function is not a substitute. The existing ES5 parameter map supplies only the semisimple specialization. Zou’s torus theorem also needs the stable/condensed group-homology and character-gerbe constructions, as a specific extension of the geometrisation owner.

### Required exports from neighbouring theories

Each assertion below is the exact export consumed here. A named layer supplies only its stated scope; when the export extends that scope it belongs to the corresponding Part II extension. The hypotheses on fields, local components, residual images and coefficient primes travel with the theorem.

#### From AnalyticNumberTheory, Layer AN.2

The Wiener–Ikehara/Tauberian prime number theorem for Euler products continuing to a neighbourhood of Re s ≥ 1 with no zeros or poles except at s = 1: Σ_{N(x)≤n} χ(x) = c·n/log n + o(n/log n) with −c the order at 1 (Kedlaya Theorem 24.2).

#### From AnalyticNumberTheory, Layer AN.4

Artin L-functions L(ρ, s) of continuous representations ρ : G_K → GL_n(ℂ) with finite image, their Euler products and their comparison with automorphic L-functions (used to state Langlands' conjecture for Artin representations).

Use the [C-ARTIN contract](#contract-c-artin) above.

#### From ArithmeticLocallySymmetricSpaces, Layer ALS.3

Hecke operators on the cohomology of the Bianchi locally symmetric spaces Γ₁(𝔫)\ℍ³ with coefficients Sym^{k−2}ℂ² ⊗ conj(Sym^{k−2}ℂ²), the parabolic subspace H_par and Harder's Eichler–Shimura comparison with cuspidal Bianchi eigenforms. Require Harder’s Bianchi Eichler–Shimura extension in addition to Hecke chain correspondences, with its exact parabolic-cohomology and weight hypotheses.

#### From AutomorphicFormsOnReductiveGroups, Layer AF.4

Clozel's purity lemma (Clozel 1990, Lemme 4.9): for F CM and π cuspidal regular algebraic on GL_n(𝔸_F), λ_{τ,i} + λ_{τc,n+1−i} is independent of τ; and regularity/algebraicity of weights in the conventions of BCGNT §1.6.

Use the [C-COHERENT-GEOMETRY contract](#contract-c-coherent-geometry) above.

#### From AutomorphicGaloisRepresentations, Layer R19.2

Galois realizations of Hilbert cusp forms over the totally real F occurring in non-general GSp4 types, together with one-dimensional global class-field characters; R19.1 classical forms over ℚ alone does not supply this.

Galois representations of Hilbert modular forms of parallel and non-parallel weight, including parallel weight one (Rogawski–Tunnell, Jarvis), as used for totally odd Artin representations and for Theorem A of Newton–Thorne 2026. Require the parallel weight-one and Pilloni–Stroh totally odd Artin extension in addition to cohomological Hilbert/quaternionic realizations; cohomological weight≥2 gives a different scope.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.0

Regular algebraic and polarized automorphic representations (π, χ) of GL_n(𝔸_F) for F CM or totally real, with BLGGT's conditions (χ_v(−1) independent of v | ∞, π^c ≅ π^∨ ⊗ (χ ∘ N ∘ det), χ_v(−1) = (−1)^{n+w} for F imaginary with algebraic purity parameter w_alg=w), weights a ∈ (ℤ^n)^{Hom(F,ℂ),+}_w and the level conditions (prime / potentially prime to l). Use the polarization and realization conventions above.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.2

BLGGT v4 Theorem 2.1.1: for regular algebraic cuspidal polarized (π, χ), a semisimple r_{l,ı}(π) with (r_{l,ı}(π), ε_l^{1−n}r_{l,ı}(χ)) totally odd polarized, local–global compatibility ıWD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) pure of motivic weight w_alg+n−1 at v ∤ l (Caraiani), de Rham with HT_τ = {a_{ıτ,i} + n − i}, and the same compatibility at v | l when π_v has Iwahori-fixed vectors; plus Geraghty's ordinarity comparisons (6)–(7). Also: r_{π,ι} for RAESDC and RAECSDC π over totally real and CM fields with local–global compatibility at every finite place (Caraiani), as used by Newton–Thorne 2026 §1.2 and Lemma 2.1, and the compatible systems R_π of ACC+ §7.1 (Harris–Lan–Taylor–Thorne, Scholze, Varma) for regular algebraic cuspidal π over CM fields.

Use the [C-GALOIS contract](#contract-c-galois) above.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.3

Definite-unitary finite-slope eigenvarieties with dense strongly regular classical points and their Galois pseudo-representations, as used for E_n in Newton–Thorne I §2.

#### From AutomorphicGaloisRepresentationsPartII, Layer AG2.5

Varma's local–global compatibility (semisimplified, with the monodromy bound) for regular algebraic cuspidal π over CM fields, used for temperedness at ramified places in BCGNT Theorem 7.1.1. In Qian’s Steinberg argument compare at the auxiliary prime λ′≠l where the fibre is semisimple; preserve the maximal Jordan-block conclusion. Transport at λ alone identifies its global semisimplification.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.2

Godement–Jacquet: for cuspidal π on GL_n(𝔸_F), L^S(π, s) is entire (n ≥ 2) and satisfies the standard functional equation, with twists by finite-order characters; used through a Brauer-induction argument in BLGGT Corollary 5.4.3. Also: the Jacquet–Shalika bound for Satake parameters of unitary cuspidal representations (AL.2/jacquet-shalika-satake-bound), used for purity from symmetric powers (BCGNT Lemma 6.1.3, ACC+ Corollary 7.1.13).

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.3

For unitary cuspidal π, π′ on GL_n, GL_{n′}, L^S(π×π′^∨,s) is meromorphic and is holomorphic and nonzero at s=1 unless n=n′ and π≅π′, when it has a simple pole. For nontrivial norm twists track the shifted pole location explicitly (Jacquet–Shalika 1981, Shahidi 1981); used in BLGGT Theorem 5.5.2. Also: L(Π, s) ≠ 0 on Re s = 1 for cuspidal Π on GL_n (Jacquet–Shalika), used for Sato–Tate. Also: strong multiplicity one for cuspidal and isobaric representations (AL.3/strong-multiplicity-one) and the simple pole of L^S(s, π × π^∨) at s = 1 (Jacquet–Shalika), used for the symplectic/orthogonal dichotomy and the uniqueness of functorial lifts.

#### From AutomorphicLFunctionsAndLocalFactors, Layer AL.4

The Langlands–Shahidi L-functions L^S(s, π, Sym²), L^S(s, π, ∧²) and twisted L^S(s, Π, ∧²⊗ω), with Π unitary cuspidal and ω unitary: meromorphic continuation and the source-supported alternative at s=1 of a simple pole or a nonzero finite limit, including its exact symplectic-type criterion. Supply separately the precise analytic hypotheses for GL₂×GL₃ and GL₂×GL₄ converse-theorem inputs used by Kim–Shahidi and Kim; no full boundary-line theorem is inferred from the s=1 statement. Require these analytic continuation and nonvanishing theorems as the analytic Part II extension of unramified L-group factors and their convergence.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer ET.3

The fundamental lemma (Ngô), its twisted and weighted variants where proved (Chaudouard–Laumon for split groups), and Waldspurger's transfer of orbital integrals, as inputs of the stabilisation behind Arthur's classification; carry TWFL as the named hypothesis above, with its non-split weighted and non-standard weighted inputs. Require the full twisted and weighted transfer extension beyond ordinary orbital-integral transfer.

Use the [C-ARTHUR contract](#contract-c-arthur) above.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer ET.4

The simple stable and twisted trace formulas for unitary groups and twisted GL_n (the restricted form ET.4 plans), together with the full twisted stabilization of Mœglin–Waldspurger required for Layer 3.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6

The local Langlands correspondence for GL_n over p-adic fields (Harris–Taylor, Henniart, Scholze), rec_K, with its compatibility with twists, duals, central characters and L/ε-factors of pairs, used to define local parameters of automorphic representations and functorial lifts.

#### From EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a

Arthur–Clozel cyclic base change and descent for GL_n (Theorems 3.4.2, 3.5.1 of AC89) with Harris–Taylor Lemma VII.2.6, and automorphic induction from a cyclic CM extension, with the cuspidality criteria; used in BLGGT Lemmas 2.2.2, 2.2.4 and Proposition 4.1.1. Also: Arthur–Clozel cyclic base change and descent for GL_n of prime degree with soluble iteration, in the form quoted by Newton–Thorne 2026 §1.2 and used by BCGNT Proposition 6.2.3, and Labesse's base change between unitary groups and GL_n used for the Steinberg-at-q forms of Newton–Thorne I and the unitary descent in Calegari–Geraghty Lemma 6.9.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R16.3

The local Langlands correspondence for GL₂ (parameters of principal series, Steinberg and supercuspidal representations), as used by Gelbart–Jacquet's lift and by Gan–Takeda.

#### From GL2AutomorphicRepresentationsAndTransfer, Layer R17.5

Automorphic induction of Hecke characters of quadratic fields to GL₂ and the soluble (dihedral, tetrahedral, octahedral) Artin modularity for weight one, with the Kim–Shahidi inputs for the icosahedral case as they are stated there; used for Newton–Thorne II Theorem A.1.

#### From GL2ModularityLifting, Layer R22.5

Request the exact odd-prime potentially Barsotti–Tate modularity lifting theorem over the totally real field used in BCGP Proposition10.1.3, with residual modularity, cyclotomic irreducibility, determinant and local types. R22.1 only builds the deformation-to-Hecke map. R22.5 is the lifting direction; its precise Hilbert-field export still needs verification.

#### From GlobalGaloisDeformations, Layer R04.2 (universal deformation ring)

Under Φ_p and Schur residual representation (here absolutely irreducible), the strict-equivalence deformation functor is pro-represented by a complete local Noetherian ring. Finite-image tangent-space vanishing in CG Lemma4.14 is a separate class-field argument, not part of this representability theorem.

#### From MetaplecticAutomorphicForms, Layer MP.3

Local theta correspondences for (GSp₄, GO(V)) with dim V = 4, 6 and for (Mp_{2n}, SO_{2n+1}) (Gan–Takeda; Gan–Savin), used to construct the LLC for GSp₄ and the local descent to Mp_{2n}. Require full all-residual-characteristic Howe duality and the exact GRS local descent extension in addition to elementary theta modules.

#### From PadicFamilies, Layer L2

Finite-slope eigenvarieties: the Coleman–Mazur eigencurve E for GL₂/ℚ (tame level N, prime p) with its weight map κ, slope map and the classical points (f, α); and eigenvarieties E_n for definite unitary groups in n variables with refined points (π, χ); with the Zariski density of classical points and irreducible components. Used by Newton–Thorne I §§2–3.

#### From PotentialAutomorphyInfrastructure, Layer PA.2

ACC+ Theorem 5.5.1 (local–global compatibility at p for ordinary parts over CM fields, decomposed generic residual representation) and the ordinarity comparison of ACC+ Corollary 5.5.2.

#### From PotentialAutomorphyInfrastructure, Layer 5, §§5.22–5.23

The automorphy lifting theorems for n-dimensional representations of G_F, F imaginary CM or totally real, of ACC+ §6.1: Theorem 6.1.1 (Fontaine–Laffaille: crystalline, p unramified, p > n², enormous decomposed generic residual image, regular weight below p − 2n) and Theorem 6.1.2 (ordinary of regular weight, p > n), with all image, level and local hypotheses. Consumers: Qian, BCGNT, Caraiani–Newton, Calegari–Geraghty. Apply the Fontaine–Laffaille and ordinary theorems only with their exact bounds, enormous/decomposed-generic image, scalar and local conditions. BCGNT Proposition 6.2.3 instead needs its Theorem 3.2.1 with the local connects relation; Caraiani–Newton needs its Theorem 1.3 potentially semistable branch, and CG Theorem 5.16 needs its general-number-field conditional branch. Those are distinct requests, not supplied by the two Layer 5 endpoints.

**Missing lifting extension.** BCGNT Theorem 3.2.1, the CM automorphy lifting theorem with Taylor–Wiles conditions and component-wise local connects hypotheses, plus ACC+ Proposition 6.5.13 cyclic descent with irreducibility and level control. Ordinary/Fontaine–Laffaille endpoint names alone do not provide these signatures.

Use the [C-LOCAL-DEFORMATION contract](#contract-c-local-deformation) above.

#### From PotentialAutomorphyInfrastructurePartII, Layer PL.0

Geraghty's ι-ordinarity, the Steinberg weight-zero criterion (PL.0/steinberg-weight-zero-iota-ordinary) and the comparison of automorphic and Galois ordinarity in the polarized setting.

#### From PotentialAutomorphyInfrastructurePartII, Layer PL.5

The Dwork family's compatible systems and BLGGT Theorem 3.1.2 / Proposition 3.2.1 (potential ordinary automorphy, ordinary lifts with prescribed local behaviour), as used in Qian §4 and ACC+ §7.2. Required Qian extension: Lemma 3.10(4), arXiv v1 pp. 20–21, and thesis Remark 3.0.13, printed p. 55, must supply potential semistability and a regular ordinary Galois filtration at v(t)<0 at λ|l. Prove stability under local subquotients and the global semisimplification, retaining the Hodge multiset and graded residual lattice. This is distinct from the auxiliary-prime Steinberg proof of π’s ι-ordinarity; neither weak compatibility nor ACC+ Corollary 5.5.2 without its irreducible-residual hypotheses supplies it.

#### From PotentialModularityAndCompatibleSystems, Layer R23.1

Moret-Bailly's theorem: points of a smooth geometrically connected variety over a Galois extension unramified at a given set, with prescribed local behaviour and linear disjointness (used for Dwork-family points, twisted modular curves X_E(q) and auxiliary elliptic curves).

Use the [C-MODULI contract](#contract-c-moduli) above.

#### From PotentialModularityAndCompatibleSystems, Layer R24.5:operations

Weakly, very weakly and extremely weakly compatible systems of l-adic representations (BLGGT §5.1; ACC+ §7.1), purity, symmetric powers and duals of systems, and their partial L-functions.

#### From TauCetiRoadmap.Chebotarev, Layer 10

Chebotarev density in Dirichlet density form, to compare Galois representations through traces of Frobenius and to choose auxiliary primes of density one.

#### From TauCetiRoadmap.ClassFieldTheory, Layer 11

The archimedean Artin maps Art_ℝ (kernel ℝ_{>0}) and Art_ℂ (trivial), as used in ACC+'s conventions.

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

Modularity of every elliptic curve over ℚ with full local-factor comparison, to apply NT non-CM symmetric powers in the Sato–Tate criterion; exact statement read here R29.6 description.

#### From PotentialModularityAndCompatibleSystems, Layer R24.5

Patrikis–Taylor Lemma 1.6 and Theorem 2.1: for a pure, regular, totally odd polarized weakly compatible system, irreducible constituents at conjugation-invariant coefficient primes retain the polarization, and extend to a decomposition into weakly compatible systems becoming cuspidally automorphic over one CM extension with the stated avoidance and Galois conditions. This differs from the existing BLGGT extremely regular decomposition and does not turn a reducible sum into a cusp form.

Use the [C-SYSTEM contract](#contract-c-system) above.

#### From Layer 4

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic. Required export: TauCeti.SymmetricPower.automorphic_of_same_component. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w). Required export: TauCeti.SymmetricPower.buzzardKilford. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2. Required export: TauCeti.SymmetricPower.symPower_levelOne_propagate. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Fix K=ℚ(i) and σ₀, the unique cuspidal newform of level Γ₁(4) and weight 5, obtained by automorphic induction of the unramified Hecke character of K of infinity type (4,0). Let n≥3, let p be a prime with p≡1 (mod 48·n!), choose ι : Q̄_p≅ℂ, and let q≠p be a prime. Let X₀ be a finite set of places of K prime to 2pq, and let ω : G_K→Q̄_p^× be de Rham with ωω^c=ε³ and unramified at X₀. Then there is a soluble CM extension F/K, split at X₀, and a RACSDC ι-ordinary Π on GL_n(𝔸_F), with r_{Π,ι}≅ω^{n−1}|G_F⊗Sym^{n−1}r_{σ₀,ι}|G_F, the displayed representation’s labeled Hodge–Tate numbers, and Π_v an unramified Steinberg twist at some v|q. NT I Theorem 7.1 uses Proposition 7.4 for odd n and Anastassiades–Thorne for even n. Required export: TauCeti.SymmetricPower.exists_steinberg_levelRaising. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι. Required export: TauCeti.SymmetricPower.exists_levelOne_symPower. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified. Required export: TauCeti.SymmetricPower.exists_nRegular_congruence. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power. Required export: TauCeti.SymmetricPower.symPower_lifting. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

For a definite unitary group G_d over F⁺ and an automorphic π of G_d(𝔸_{F⁺}), identify its split p-adic factors with GL_d(F_ṽ). An accessible refinement is a tuple of smooth torus characters χ_v : T_d(F_ṽ) → Q̄_p^× occurring in the normalized Jacquet module ι⁻¹r_{N_d}(π_v), equivalently admitting π_v ↪ i_{B_d}^{GL_d}ιχ_v. For a rank-two input and a separate symmetric-power rank n ≥ 2, the refinement is n-regular when (χ_{v,1}/χ_{v,2})^i ≠ 1 for every 1 ≤ i ≤ n−1 and every v∈S_p. The group rank d=2 does not force n=2. For π on GL₂(𝔸_ℚ), π_l admits an accessible refinement exactly when its Jacquet module is nonzero, equivalently when π_l is not supercuspidal. Required export: TauCeti.SymmetricPower.IsAccessibleRefinement. Preserve the source hypotheses and the coherent local/automorphic realizations, rather than a free geometric context.

#### From Layer 3

BCGP25 Lemma 10.4.1: the regular-weight residual Serre hypothesis implies modularity of abelian surfaces only after the surface classification, residual split/irreducible alternatives, ordinary prime density and weight-changing/Hida arguments. Export the full application with its explicit Arthur-classification dependence.

#### From AutomorphicFormsOnReductiveGroups, Layer AF.1

Use the [C-AUTOMORPHIC contract](#contract-c-automorphic) above.

Export the complete Adams–Johnson parameter definition, cohomological induction A_𝔮(λ), standard-module resolutions and the Whittaker-normalized stable/twisted character maps needed by AMR Theorem 1.1. AMR §8.1 supplies necessary consequences only.

#### From ExcursionOperatorsAndSpectralAction, Layer ES5

Use the [C-CATEGORICAL contract](#contract-c-categorical) above.

### Conventions and imported comparisons

<a id="blggt-normalization-register"></a>
#### Polarization and the automorphic realization

Import polarized regular algebraic cuspidal automorphic pairs (π,χ) from AutomorphicGaloisRepresentationsPartII, Layers AG2.0 and AG2.2. For imaginary CM F, πᶜ ≅ π∨ ⊗ (χ∘N_{F/F⁺}∘det), with χ a character of (F⁺)×\𝔸_{F⁺}× and its archimedean sign independent of the real place. If the dominant weight a satisfies a_{τ,i}+a_{τc,n+1−i}=w, use χ_v(−1)=(−1)^{n+w}. The infinitesimal character is that of Ξ_a∨. The associated representation has Hodge–Tate multiset {a_{ιτ,1}+n−1,…,a_{ιτ,n}}, multiplier ε_ℓ^{1−n}r_{ℓ,ι}(χ), and is totally odd. For v∤ℓ its Frobenius-semisimplified Weil–Deligne parameter is rec(π_v⊗|det|_v^{(1−n)/2}); the same comparison at v|ℓ requires the stated Iwahori hypothesis. Independence of the coefficient isomorphism uses Clozel, Theorem 3.13. These are the imported conventions of BLGGT §2.1, pp. 32–34.

For imaginary CM F, n = 2 and pure weight w = 0, χ_v(−1) = +1 and ε_l^{−1}r_{l,ı}(χ) is −1 at complex conjugation. Repeat with w = 1: χ_v(−1) = −1, while r_{l,ı}(χ)(c_v) = (−1)^wχ_v(−1) = +1, so the multiplier is again −1. At weight 0, HT_τ = {n − 1, …, 0}; at pure weight w the signs must use n+w rather than n alone.

([BLGGT](#ref-blggt-2014-v4), §2.1, p. 32 (arXiv v4); [BLGGT](#ref-blggt-2014-v4), §2.1, Theorem 2.1.1, pp. 33–34 (arXiv v4).)

*Needs:* AutomorphicGaloisRepresentationsPartII, Layer AG2.0; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-GALOIS](#contract-c-galois).

<a id="blggt-version-register"></a>
#### BLGGT edition concordance

The BLGGT citations use arXiv v4 (9 December 2013), the version preceding Ann. of Math. 179 (2014), 501–609. PotentialModularityAndCompatibleSystems part R24.3 cites arXiv v1 (2010). Correspondence: v1 §2.2 (minimal lifting, Theorem 2.2.1) = v4 §2.3 (Theorem 2.3.1); v1 §2.3 (ordinary lifting, Theorem 2.3.1) = v4 §2.4 (Theorem 2.4.1, now also for totally real F); v4 §2.2 (Lemmas 2.2.1–2.2.4 on automorphy) is new; v1 §5.2 (Lemma 5.2.1, Proposition 5.2.2) = v4 §5.3 (Lemma 5.3.1, Proposition 5.3.2); v1 Lemma 5.2.3 = v4 Lemma 5.4.5; v1 §5.3 (Theorem 5.3.1, Corollaries 5.3.2–5.3.3, Proposition 5.3.4) = v4 §5.4 (Theorem 5.4.1 with Corollary 5.4.2, Corollary 5.4.3, Corollary 5.4.4, Proposition 5.4.6); v1 §5.4 (Theorems 5.4.1–5.4.3) = v4 §5.5 (Theorems 5.5.1–5.5.3); v4 §5.2 (rational compatible systems) is new. v4 renames RAECSDC/RAESDC to "polarized" and "essentially conjugate self-dual" to "polarized", and states the lifting theorems for polarized (r, µ) with the "potentially diagonalizably automorphic" hypothesis.

([BLGGT](#ref-blggt-2014-v4), title page and table of contents, p. 1 (arXiv v4).)

*Needs:* [Polarization and the automorphic realization](#blggt-normalization-register); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="symmetric-power-lifting"></a>
#### The symmetric power lifting Sym^{n−1}π

For π cuspidal on GL₂(𝔸_ℚ) and n ≥ 1, a symmetric power lifting Sym^{n−1}π is an automorphic representation Π of GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v (local Langlands for GL₂ and GL_n). For π regular algebraic and non-CM, Sym^{n−1}π exists as a regular algebraic cuspidal representation iff Sym^{n−1}r_{π,ι} is automorphic in the sense of PotentialAutomorphyInfrastructurePartII:PL.0/automorphic-polarized-representation for one (equivalently every) p and ι : Q̄_p ≅ ℂ (strong multiplicity one, Chebotarev density and local–global compatibility); for CM or weight-one π the definition allows isobaric lifts whenever the induced parameter decomposes and imposes no cuspidality conclusion by itself.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 1.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.SymPowerLift`: Π on GL_n(𝔸_ℚ) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) at every v.
- `TauCeti.SymmetricPower.SymPowerLift.of_galois`: Sym^{n−1}r_{π,ι} automorphic ⇒ Sym^{n−1}π exists (regular algebraic, cuspidal for non-CM π).
- `TauCeti.SymmetricPower.SymPowerLift.unique`: Unique up to isomorphism (strong multiplicity one).
- `TauCeti.SymmetricPower.SymPowerLift.twist`: Sym^{n−1}(π ⊗ χ) = Sym^{n−1}π ⊗ χ^{n−1}.
- `TauCeti.SymmetricPower.SymPowerLift.lFunction`: L^S(Sym^{n−1}π, s) = L^S(Π, s) for S containing the archimedean places; for n ≥ 2 and Π cuspidal the finite L-function is entire (Godement–Jacquet).

Specialize the general-number-field definition at F=ℚ. The all-place/Galois equivalence is subject to the same exact local–global comparison contract as the general definition.

**Checks.**

- n = 2: Sym¹π = π.
- n = 3: Sym²π is the Gelbart–Jacquet lift (the adjoint lift twisted by the central character).
- π = automorphic induction of a Hecke character ψ of an imaginary quadratic K: Sym²π = Ind ψ² ⊞ ψ|_{𝔸_ℚ^×}, not cuspidal (the η_K factor belongs to Ad(π), not Sym²π).
- n = 1: Sym⁰π is the trivial character.

Check the known small cases: n = 2 is π itself; n = 3 is Gelbart–Jacquet; n = 4, 5 are Kim–Shahidi (cited in Newton–Thorne's introduction).

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, p. 1 (arXiv v3).)

*Needs:* [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="accessible-regular-refinement"></a>
#### Accessible and n-regular refinements

For a definite unitary group G_d over F⁺ and an automorphic π of G_d(𝔸_{F⁺}), identify its split p-adic factors with GL_d(F_ṽ). An accessible refinement is a tuple of smooth torus characters χ_v : T_d(F_ṽ) → Q̄_p^× occurring in the normalized Jacquet module ι⁻¹r_{N_d}(π_v), equivalently admitting π_v ↪ i_{B_d}^{GL_d}ιχ_v. For a rank-two input and a separate symmetric-power rank n ≥ 2, the refinement is n-regular when (χ_{v,1}/χ_{v,2})^i ≠ 1 for every 1 ≤ i ≤ n−1 and every v∈S_p. The group rank d=2 does not force n=2. For π on GL₂(𝔸_ℚ), π_l admits an accessible refinement exactly when its Jacquet module is nonzero, equivalently when π_l is not supercuspidal.

G_d is the definite unitary group of NT §1; T_d⊂B_d⊂GL_d. The n-regular ratio criterion displayed here is for d=2 and arbitrary n≥2.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.IsAccessibleRefinement`: χ_v a subquotient of the normalised Jacquet module at each v ∈ S_p.
- `TauCeti.SymmetricPower.IsNRegular`: For a rank-two refinement and n≥2, (χ_{v,1}/χ_{v,2})^i ≠ 1 for all 1≤i≤n−1 and all v∈S_p.
- `TauCeti.SymmetricPower.isAccessible_iff_not_supercuspidal`: An accessible refinement exists iff π_l is not supercuspidal.
- `TauCeti.SymmetricPower.isNRegular_mono`: n-regular ⇒ m-regular for m ≤ n.

Import this theorem from LocalGlobalCompatibilityPartIIEigenvarietyCompanions, with the complete field, coefficient, local and image conditions displayed here.

**Checks.**

- π_l unramified with Satake parameters {α, β}: the two refinements are (α, β) and (β, α); n-regular iff (α/β)^i ≠ 1 for i < n.
- π_l a twist of Steinberg has exactly one accessible refinement.
- π_l supercuspidal has no accessible refinement (the hypothesis of NT I Theorem B).
- α/β = −1 is 2-regular but not 3-regular: (α/β)² = 1.

Check that an n-regular refinement excludes the ratio being an i-th root of unity for i < n: the condition keeps Sym^{n−1} of the refinement regular.

([Newton–Thorne I](#ref-newton-thorne-I), §2, p. 34, and Definition 2.23, p. 40 (arXiv v3).)

*Needs:* LocalGlobalCompatibilityPartIIEigenvarietyCompanions, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="eigenvariety-propagation"></a>
#### Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)

Let (π₀, χ₀), (π′₀, χ′₀) be refined points of the eigencurve E₀ (tame level N, prime p) with corresponding points z₀, z′₀. Suppose either (1) χ₀ is numerically non-critical and n-regular, (2) χ′₀ is n-regular, (3) the Zariski closures of r_{π₀,ι}(G_{ℚ_p}) and r_{π′₀,ι}(G_{ℚ_p}) contain SL₂, (4) Sym^{n−1}r_{π₀,ι} is automorphic; or (1ord) χ₀ is ordinary, (2ord) π₀, π′₀ are not CM, (3ord) Sym^{n−1}r_{π₀,ι} is automorphic. If z₀, z′₀ lie on a common irreducible component of E_{0,ℂ_p}, then Sym^{n−1}r_{π′₀,ι} is automorphic.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2. E₀ the Coleman–Mazur eigencurve and E_n the eigenvariety of a definite unitary group in n variables (PadicFamilies L2).

Import this theorem from SymmetricPowersByAnalyticContinuation, with the complete field, coefficient, local and image conditions displayed here.

Check the ordinary variant: an ordinary refinement is automatically numerically non-critical, and Hida families replace eigencurve components.

([Newton–Thorne I](#ref-newton-thorne-I), §2, Theorem 2.33, pp. 50–51 (arXiv v3).)

*Needs:* SymmetricPowersByAnalyticContinuation, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="buzzard-kilford-eigencurve"></a>
#### The tame-level-one 2-adic eigencurve near the boundary (Buzzard–Kilford)

For p = 2 and N = 1, E₀ lies over the component W₀⁺ (χ(−1) = 1) of weight space, and w = χ_u(5) − 1 identifies W₀⁺ with {|w| < 1}. Over the annulus W₀(b) = {|8| < |w| < 1}, E₀(b) = κ^{−1}(W₀(b)) is a disjoint union ⊔_{i≥1}X_i of admissible opens with κ|_{X_i} an isomorphism onto W₀(b), and on X_i the slope is i·v₂(w).

p = 2, tame level 1.

Import this theorem from SymmetricPowersByAnalyticContinuation, with the complete field, coefficient, local and image conditions displayed here.

Check the consequence used: every irreducible component of E₀ meets κ^{−1}(W₀(b)), so it contains some X_i.

([Newton–Thorne I](#ref-newton-thorne-I), §3, Theorem 3.2, pp. 53–54 (arXiv v3).)

*Needs:* SymmetricPowersByAnalyticContinuation, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="level-one-ping-pong"></a>
#### Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)

Fix n ≥ 2. If π₀ is an everywhere unramified cuspidal π of weight k ≥ 2 with Sym^{n−1}r_{π₀,ι} automorphic for some (equivalently any) p and ι, then Sym^{n−1}r_{π,ι} is automorphic for every everywhere unramified cuspidal π of weight ≥ 2.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Import this theorem from SymmetricPowersByAnalyticContinuation, with the complete field, coefficient, local and image conditions displayed here.

Check the key numerical identity v₂(α) + v₂(β) = k − 1 for the two roots of X² − a₂X + 2^{k−1}, which gives i + i′ = (k − 1)/v₂(w).

([Newton–Thorne I](#ref-newton-thorne-I), §3, Theorem 3.1, p. 53; Introduction pp. 3–4 (arXiv v3).)

*Needs:* SymmetricPowersByAnalyticContinuation, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="steinberg-level-raising"></a>
#### Level raising to Steinberg for symmetric powers of theta series (NT I Theorems 4.1, 6.1, 7.1)

Fix K=ℚ(i) and σ₀, the unique cuspidal newform of level Γ₁(4) and weight 5, obtained by automorphic induction of the unramified Hecke character of K of infinity type (4,0). Let n≥3, let p be a prime with p≡1 (mod 48·n!), choose ι : Q̄_p≅ℂ, and let q≠p be a prime. Let X₀ be a finite set of places of K prime to 2pq, and let ω : G_K→Q̄_p^× be de Rham with ωω^c=ε³ and unramified at X₀. Then there is a soluble CM extension F/K, split at X₀, and a RACSDC ι-ordinary Π on GL_n(𝔸_F), with r_{Π,ι}≅ω^{n−1}|G_F⊗Sym^{n−1}r_{σ₀,ι}|G_F, the displayed representation’s labeled Hodge–Tate numbers, and Π_v an unramified Steinberg twist at some v|q. NT I Theorem 7.1 uses Proposition 7.4 for odd n and Anastassiades–Thorne for even n.

The fixed K=ℚ(i), weight-five level-four σ₀, primes p and q, embedding ι, X₀ and ω are the data in Theorem 7.1. No arbitrary imaginary-quadratic theta seed or prior congruence with a level-one form is a hypothesis.

Import this theorem from SymmetricPowersByUnitaryLevelRaising, with the complete field, coefficient, local and image conditions displayed here.

Check the arithmetic condition p ≡ 1 (mod 48·n!) on a small case: for n = 3, 48·3! = 288 and p = 577 is a prime ≡ 1 (mod 288).

([Newton–Thorne I](#ref-newton-thorne-I), §7, Theorem 7.1 and the fixed seed, pp. 82–83; §4 Theorem 4.1, pp. 59–60; §6 Theorem 6.1, pp. 75–76 (arXiv v3).)

*Needs:* SymmetricPowersByUnitaryLevelRaising, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="one-level-one-symmetric-power"></a>
#### One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)

For every n ≥ 3 there is a cuspidal, everywhere unramified π of GL₂(𝔸_ℚ) of weight k ≥ 2 such that Sym^{n−1}r_{π,ι} is automorphic for every ι.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Import this theorem from SymmetricPowersByUnitaryLevelRaising, with the complete field, coefficient, local and image conditions displayed here.

Check that the strategy uses small residual image and large p, in contrast to Clozel–Thorne's large image and small p.

([Newton–Thorne I](#ref-newton-thorne-I), §7, Theorem 7.6, p. 90; Introduction p. 4 (arXiv v3).)

*Needs:* SymmetricPowersByUnitaryLevelRaising, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="n-regular-congruences"></a>
#### Congruences to n-regular forms (NT I Proposition 8.3)

Let π be non-CM of weight k ≥ 2 with π_l non-supercuspidal for every l. Then there are a prime p > max(2(n + 1), (n − 1)k), ι, and π′ of weight k with r̄_{π,ι}(G_ℚ) ⊇ a conjugate of SL₂(F_p), π_p and π′_p unramified, r̄_{π,ι} ≅ r̄_{π′,ι}, and π′_l non-supercuspidal with all accessible refinements n-regular wherever π′_l is ramified.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

Import this theorem from SymmetricPowersByUnitaryLevelRaising, with the complete field, coefficient, local and image conditions displayed here.

Check the numerical bound p > (n − 1)k: it keeps Sym^{n−1} of the residual representation in the Fontaine–Laffaille range.

([Newton–Thorne I](#ref-newton-thorne-I), §8, Proposition 8.3, pp. 92–93 (arXiv v3).)

*Needs:* SymmetricPowersByUnitaryLevelRaising, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="symmetric-power-automorphy-lifting"></a>
#### Automorphy lifting for symmetric powers (NT II Theorem 2.1)

Newton–Thorne II Theorem 2.1. Let F be totally real, p a prime, n≥1, and π,π′ regular algebraic, cuspidal, non-CM representations of GL₂(𝔸_F), both of weight two and both nonordinary at every v|p. For a fixed ι:Q̄_p≅ℂ assume r̄_{π,ι}≅r̄_{π′,ι}, and that π_v is a twist of Steinberg exactly when π′_v is, for every finite v∤p. Suppose that for some a≥1, up to conjugacy, PSL₂(F_{p^a})≤P r̄_{π,ι}(G_F)≤PGL₂(F_{p^a}), with p^a>max(5,2n−1). If Sym^{n−1}r_{π′,ι} is automorphic, then Sym^{n−1}r_{π,ι} is automorphic. The bound concerns the finite-field cardinality, and applies also at p=2; it does not impose p>n or irreducibility of the residual symmetric power.

All hypotheses in the statement, including weight two, non-CM and nonordinarity for BOTH π and π′. The projective image is a subgroup of PGL₂(F̄_p); the sandwich uses one embedded finite field and one conjugation.

Import this theorem from SymmetricPowerAutomorphyLifting, with the complete field, coefficient, local and image conditions displayed here.

Check that the theorem avoids killing the dual Selmer group of Sym^{n−1}r̄, which fails when p ≤ n.

([Newton–Thorne II](#ref-newton-thorne-II), §2, Theorem 2.1 and proof, pp. 5–6 (arXiv v2).)

*Needs:* [The finite-field projective image condition](#projective-image-sandwich); SymmetricPowerAutomorphyLifting, the exact theorem stated above; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="arthur-dependency-gate"></a>
#### The twisted weighted fundamental lemma

Use the twisted weighted fundamental lemma in the precise form of Mœglin–Waldspurger II.4.4 as a named hypothesis, abbreviated TWFL. Its reduction requires the weighted Lie-algebra lemma for non-split groups and the non-standard weighted variant. The unweighted fundamental lemma does not imply TWFL. Arthur’s Hypothesis 3.2.1 requires stabilization of the twisted trace formula for GL_N and SO_{2n}; Mœglin–Waldspurger supply this stabilization and the input [A24]. Atobe–Gan–Ichino–Kaletha–Mínguez–Shin supply the local intertwining inputs [A25]–[A27]. Their arXiv v3, §0.4, p. 15 distinguishes the proved unweighted lemma from the remaining weighted assumptions. The classifications and their consequences below are implications from TWFL together with these specified trace formula and intertwining theorems.

([BCGP, potential modularity](#ref-bcgp-2021), §1.4.1 'The work of Arthur', p. 14 (arXiv v3); [BCGP, modularity](#ref-bcgp-2025), §1.6 'The work of Arthur', pp. 7–8 (arXiv v1); [Local intertwining relations and co-tempered A-packets of classical groups](#ref-agikms-2024), Abstract, p. 1 (arXiv v3); [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §3.2, Hypothesis 3.2.1, p. 137; Preface p. xvi (2011 manuscript).)

*Needs:* [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTHUR](#contract-c-arthur).

<a id="archimedean-langlands-conventions"></a>
#### Archimedean reciprocity, sums and restriction

Art_ℝ : ℝ^× ↠ Gal(ℂ/ℝ) and Art_ℂ : ℂ^× ↠ Gal(ℂ/ℂ) are the unique continuous surjections. For K = ℝ (resp. ℂ), rec_K is Langlands' bijection (owner: AutomorphicFormsOnReductiveGroups AF.1/archimedean-llc-gln; use this correspondence to define ⊞ and BC) from irreducible admissible (Lie GL_n(ℝ) ⊗_ℝ ℂ, O(n))-modules (resp. (Lie GL_n(ℂ) ⊗_ℝ ℂ, U(n))-modules) to continuous semisimple n-dimensional representations of the Weil group W_K. For modules π_i of rank n_i, the isobaric sum π₁ ⊞ ⋯ ⊞ π_r is defined by rec_K(π₁ ⊞ ⋯ ⊞ π_r) = rec_K(π₁) ⊕ ⋯ ⊕ rec_K(π_r); for π a (Lie GL_n(ℝ) ⊗ ℂ, O(n))-module, BC_{ℂ/ℝ}(π) is the (Lie GL_n(ℂ) ⊗ ℂ, U(n))-module with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}.

n ≥ 1; modules are (𝔤, K)-modules in the sense of AutomorphicFormsOnReductiveGroups AF.1.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.recArch`: rec_K : irreducible admissible GL_n(K)-modules → semisimple n-dimensional W_K-representations, K = ℝ, ℂ.
- `TauCeti.LanglandsRegister.recArch_bijective`: rec_K is a bijection onto isomorphism classes.
- `TauCeti.LanglandsRegister.recArch_gl1`: For n=1 use local Weil reciprocity K^×≅W_K^ab; rec_K(χ) is χ transported to W_K^ab. The finite map to Gal(ℂ/K) does not define this for arbitrary χ.
- `TauCeti.LanglandsRegister.isobaricSum`: π₁ ⊞ π₂ with rec(π₁ ⊞ π₂) = rec(π₁) ⊕ rec(π₂).
- `TauCeti.LanglandsRegister.baseChangeCR`: BC_{ℂ/ℝ}(π) with rec_ℂ(BC_{ℂ/ℝ}(π)) = rec_ℝ(π)|_{W_ℂ}.
- `TauCeti.LanglandsRegister.recArch_twist`: rec_K(π ⊗ (χ ∘ det)) = rec_K(π) ⊗ rec_K(χ).
- `TauCeti.LanglandsRegister.recArch_dual`: rec_K(π^∨) = rec_K(π)^∨.

For rank one use the Weil-group abelianization isomorphism W_K^ab≅K^×: rec_K(χ) is χ composed with its inverse reciprocity map. The finite Galois maps Art_ℝ and Art_ℂ with their finite Galois domains are different maps; arbitrary characters do not factor through Gal(ℂ/K). General n: Langlands' classification — every irreducible admissible module is the Langlands quotient of a standard module induced from characters (and, for ℝ, discrete series of GL₂(ℝ)) — matched with the decomposition of a semisimple W_K-representation into irreducibles of dimension ≤ 2. BC_{ℂ/ℝ} and ⊞ are then defined on the Galois side, transported through rec.

**Checks.**

- rec_ℝ(sgn) is the character of W_ℝ that is trivial on W_ℂ = ℂ^× and sends j to −1.
- rec_ℝ(1_{GL₂(ℝ)}) = |·|^{1/2} ⊕ |·|^{−1/2} (the trivial module is the Langlands quotient of the induced module from |·|^{1/2} ⊗ |·|^{−1/2}).
- n = 1: BC_{ℂ/ℝ}(χ) = χ ∘ N_{ℂ/ℝ}.
- rec_ℝ(D_k) for a discrete series D_k (k ≥ 2) is irreducible of dimension 2, so D_k is not an isobaric sum of characters, while BC_{ℂ/ℝ}(D_k) is.

Check the discrete series: for k ≥ 2, rec_ℝ(D_k) = Ind_{W_ℂ}^{W_ℝ}(z ↦ (z/|z|)^{k−1}) up to the twist by |·|^{s} fixed by the central character. The inducing character is single-valued: at k = 2 and z = −1 it is −1, whereas z/z̄ = 1 alone cannot determine its square root.

([ACC+](#ref-acc-2023), §1.2 Notation, arXiv v2 p. 11 (Annals pp. 907–908).)

*Needs:* AutomorphicFormsOnReductiveGroups, Layer AF.1 (archimedean llc gln); TauCetiRoadmap.ClassFieldTheory, Layer 11; [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="compatible-system-archimedean-factors"></a>
#### Compatible-system Euler and gamma factors

Comparison/import of PotentialModularityAndCompatibleSystems:R24.5/system-l-functions. For a pure weakly compatible rank-n system with monic characteristic polynomial Q_v(X)=det(X−Frob_v), put P_v(T)=T^n Q_v(T^{−1})=det(1−T Frob_v). Then L^S(R,s)=∏_{v∉S}P_v(q_v^{−s})^{−1}=∏_{v∉S}q_v^{ns}/Q_v(q_v^s), absolutely convergent for Re s>1+w/2. Full ramified and archimedean factors require a pure, regular, strictly compatible system (or separately specified coherent Weil–Deligne and real-sign data); they are not determined by a pure weak system alone. With such data, Γ_ℝ(s)=π^{−s/2}Γ(s/2), Γ_ℂ(s)=2(2π)^{−s}Γ(s), and Λ is the product of the full finite and infinite factors. For a real regular odd-rank system, the determinant-to-sign conversion must include the rank parity in the conventions above.

Partial Euler product: weakly compatible, pure of weight w, monic degree-n Q_v, finite ramification set and actual number-field norm. Completed product: regular, pure, strictly compatible; real sign data compatible with the Hodge pairing. Arbitrary hodge and hodgeSign fields alone do not ensure this.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.partialL`: L^S(R,s)=∏ q_v^{ns}/Q_v(q_v^s), equivalently ∏ det(1−q_v^{−s}Frob_v)^{−1}, for Re s>1+w/2.
- `TauCeti.LanglandsRegister.archimedeanFactor`: L_v(R, s) for v | ∞ from the Hodge–Tate data and complex conjugation.
- `TauCeti.LanglandsRegister.completedL`: Import Λ(R,s) with all finite and archimedean factors for regular pure strictly compatible systems; do not infer bad factors from weak compatibility.
- `TauCeti.LanglandsRegister.partialL_converges`: Absolute convergence for Re s > 1 + w/2 (purity).
- `TauCeti.LanglandsRegister.archimedeanFactor_directSum`: L_v(R ⊕ R′, s) = L_v(R, s)·L_v(R′, s).
- `TauCeti.LanglandsRegister.archimedeanFactor_tate`: L_v(R(1), s) = L_v(R, s + 1) (twist by the cyclotomic character).

The W_ℂ-representation at a complex place is ⊕_τ ⊕_{h ∈ H_τ} z^{−h} z̄^{h−w}-type characters; at a real place one adds the eigenvalues of complex conjugation on the pairs h = w/2. The Γ-factor of a character or a two-dimensional induced representation of W_ℝ is the standard one (Tate's thesis for GL₁, Langlands' for W_ℝ).

**Checks.**

- R = the trivial character of G_ℚ: L_∞(R, s) = Γ_ℝ(s) and Λ(R, s) = π^{−s/2}Γ(s/2)ζ(s).
- R = H¹ of an elliptic curve over ℚ: L_∞(R, s) = Γ_ℂ(s) = 2(2π)^{−s}Γ(s).
- The quadratic character of ℚ(i): L_∞ = Γ_ℝ(s + 1), not Γ_ℝ(s) — the sign of complex conjugation matters.
- The zero system has L^S = 1 and Λ = 1.

For R = H¹ of an elliptic curve over ℚ (weight 1) the archimedean factor is Γ_ℂ(s).

([ACC+](#ref-acc-2023), §7.1, definition of purity and the paragraph after it, arXiv v2 pp. 197–198 (Annals p. 1092 per routed locator).)

*Needs:* [Archimedean reciprocity, sums and restriction](#archimedean-langlands-conventions); PotentialModularityAndCompatibleSystems, Layer R24.5:operations; PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions); [C-SYSTEM](#contract-c-system).

<a id="nt26-normalisation-bridge"></a>
#### Frobenius inversion and cohomological duality

Newton–Thorne §1.2 and BLGGT use the same geometric Frobenius, HT(ε)={−1} and Tate-normalized recᵀ(π_v)=rec(π_v⊗|det|_v^{(1−n)/2}). Evaluating a representation at arithmetic Frobenius inverts the Frobenius matrix. It does not change the representation into its dual and leaves its Hodge–Tate multiset unchanged. A cohomological comparison with r∨ is a separate isomorphism of representations; only that isomorphism negates Hodge–Tate numbers. Require the realization dictionary from AutomorphicGaloisRepresentationsPartII rather than infer it from reciprocity.

([Newton–Thorne, Hilbert](#ref-nt-2026), §1.2 Notation, p. 8 (arXiv v2) (geometric-Frobenius Art_K, rec^T, r_{π,ι}, HT convention); Frob_v convention p. 7.)

*Needs:* [Polarization and the automorphic realization](#blggt-normalization-register); AutomorphicGaloisRepresentationsPartII, Layer AG2.0; [C-GALOIS](#contract-c-galois).

<a id="odd-artin-modularity-over-q"></a>
#### Odd Artin representations over the rationals

Import the theorem that a continuous odd irreducible representation G_ℚ→GL₂(ℂ) comes from a weight-one newform and satisfies the all-place strong Artin comparison. GL2AutomorphicRepresentationsAndTransfer R17.5 gives the dihedral, A₄ and S₄ projective images. ClassicalSerreModularity R27.6 gives the A₅ case and the descent from infinitely many residual weight-one modular representations. The latter uses finite-dimensionality of S₁(Γ₁(N)), a fixed level N, an infinite set of matching coefficient primes, and Chebotarev. The analytic Artin L-function consequence uses the full local-factor comparison, including ramified and archimedean factors.

([Serre's modularity conjecture (I)](#ref-kw-2009-I), Corollary 10.2(ii), §10.2, p. 21 (author copy results.pdf); [Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.2, p. 21 (author copy results.pdf); [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Appendix §A.2 'Relation with special values of periods', publ. p. 883 (copy p. 83); appendix arXiv:1907.08694v1 §2.)

*Needs:* [Langlands' conjecture for Artin representations (the strong Artin conjecture)](#strong-artin-conjecture); AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation); GL2AutomorphicRepresentationsAndTransfer, Layer R17.5 (solvable artin); ClassicalSerreModularity, Layer R27.6 (odd artin weight one modularity); [Assertions with explicit hypotheses](#endpoint-status-register); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="weight-one-separation-register"></a>
#### Field and weight boundaries

ClassicalSerreModularity, Layer R27.6, supplies rational weight-one descent and odd Artin modularity; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, supplies the soluble cases. Its R17.4 supplies rank-two base change. EllipticCurveModularity supplies elliptic modularity over ℚ and its Galois comparison. The retained results extend to totally real weight one, irregular compatible systems, non-solvable residual representations, and the stated imaginary-quadratic modularity criterion. Over an arbitrary number field the elliptic conclusion is potential modularity, with Calegari–Geraghty’s Conjecture B kept as a hypothesis where required.

([Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.1, paragraph after Theorem 10.1, p. 20 (author copy results.pdf).)

*Needs:* [Odd Artin representations over the rationals](#odd-artin-modularity-over-q); [The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images](#totally-real-odd-artin); [Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton)](#imaginary-quadratic-elliptic-modularity); [Assertions with explicit hypotheses](#endpoint-status-register); [Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))](#irregular-systems-weight-one); [Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant](#non-solvable-residual-modularity); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="trace-formula-inputs-register"></a>
#### Trace formula and intertwining inputs

Import the invariant trace formula from AutomorphicSpectralTheory AS.6. Require in addition the ordinary and twisted stabilized formulas for GL_N⋊θ and the relevant special orthogonal groups, transfer of orbital integrals, and the local intertwining relation in Arthur §2.4 with the specified inner-form scope. EndoscopicTransferAndUnitaryTraceComparison ET.3 and ET.4 must provide their weighted and twisted extensions, including Mœglin–Waldspurger stabilization; their ordinary transfer and restricted unitary comparison are insufficient by themselves. Keep TWFL as an explicit hypothesis of the classification results.

([BCGP, potential modularity](#ref-bcgp-2021), §1.4.1, p. 14 (arXiv v3).)

*Needs:* AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.3; EndoscopicTransferAndUnitaryTraceComparison, Layer ET.4; [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur).

<a id="symplectic-branch-status"></a>
#### The classification input for the symplectic branch

Gee–Taïbi’s discrete-spectrum classification of GSp₄ uses Arthur’s classification for Sp₄ and SO₅, restriction to Sp₄, and the similitude character. The descent, reducibility and packet-switching consequences therefore assume TWFL and the trace formula inputs just specified. The unitary classifications alone do not provide this symplectic classification. The same hypotheses accompany the modularity implications for abelian surfaces.

([BCGP, potential modularity](#ref-bcgp-2021), §1.4.1, p. 14 (arXiv v3).)

*Needs:* [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="cyclic-base-change-gln"></a>
#### Cyclic base change and soluble descent

(Arthur–Clozel) Let L/F be a cyclic extension of number fields of prime degree and π a cuspidal automorphic representation of GL_n(𝔸_F). There is an isobaric automorphic representation BC_{L/F}(π) of GL_n(𝔸_L) with rec(BC_{L/F}(π)_w) ≅ rec(π_v)|_{W_{L_w}} for every place w | v; it is cuspidal unless π ≅ π ⊗ η for a non-trivial character η of 𝔸_F^×/F^×N_{L/F}𝔸_L^×; and a cuspidal Π of GL_n(𝔸_L) with Π ≅ Π^σ for Gal(L/F) = ⟨σ⟩ is a base change. Iterating along a soluble Galois tower L/F: for π regular algebraic cuspidal with BC_{L/F}(π) cuspidal, BC_{L/F}(π) is regular algebraic; and (soluble descent) if r : G_F → GL_n(Q̄_p) is irreducible, r|_{G_L} is irreducible and automorphic for a soluble Galois L/F, then r is automorphic. For n = 2 the owner is GL2AutomorphicRepresentationsAndTransfer R17.4.

L/F soluble Galois (cyclic of prime degree at each step) of number fields. The Galois automorphy-descent clause uses the CM/totally-real polarized setting and irreducibility of the restriction in PL.0/soluble-descent; it is not a theorem for arbitrary G_F with the restricted NT automorphy predicate.

Arthur–Clozel 1989, Theorems 3.4.2 and 3.5.1 (cyclic base change and descent), through EndoscopicTransferAndUnitaryTraceComparison ET.7a. Soluble descent: induction along the tower using strong multiplicity one and Chebotarev (BLGGT Lemma 2.2.2; owner PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent). Newton–Thorne 2026 §1.2 quote base change in the form above.

Newton–Thorne 2026 use it in the proofs of Lemma 3.1, Theorem 3.2 and Proposition 6.1; BCGNT in Proposition 6.2.3.

([Newton–Thorne, Hilbert](#ref-nt-2026), §1.2, p. 8 (arXiv:2212.03595v2); [Newton–Thorne, Hilbert](#ref-nt-2026), §3, end of proof of Theorem 3.2, p. 25 (arXiv:2212.03595v2).)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; GL2AutomorphicRepresentationsAndTransfer, Layer R17.4 (solvable base change); GL2AutomorphicRepresentationsAndTransfer, Layer R17.4 (solvable descent); TauCetiRoadmap.Chebotarev, Layer 10; AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

<a id="automorphic-induction-register"></a>
#### Automorphic induction and its cuspidality criterion

Import cyclic automorphic induction from EndoscopicTransferAndUnitaryTraceComparison ET.7a: for L/F cyclic of degree d, AI_{L/F} sends GL_m(𝔸_L) to GL_{md}(𝔸_F), has the induced Weil parameter at every place, and is cuspidal precisely when the inducing cuspidal representation has orbit of size d under Gal(L/F). In particular it must not be fixed by any nonidentity element. GL2AutomorphicRepresentationsAndTransfer R17.5 supplies the quadratic monomial case and soluble Artin modularity; R17.4 supplies GL₂ cyclic and soluble base change. These transfers supply only their stated cases of functoriality.

**Source boundary.** Arthur’s §4, p. 45 states the Artin conjectural specialization, not this cyclic induction theorem or its cuspidality criterion. The exact theorem must be supplied with a primary locator by ET.7a from Arthur–Clozel; BCGNT, proof of Proposition 6.2.3, arXiv v3 p. 63, uses Arthur–Clozel Chapter 3, Theorem 4.2 for the untensoring step. The all-place induction and orbit criterion remain an explicit source gap.

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5; GL2AutomorphicRepresentationsAndTransfer, Layer R17.4 (solvable base change); GL2AutomorphicRepresentationsAndTransfer, Layer R17.4 (solvable descent); [Cyclic base change and soluble descent](#cyclic-base-change-gln); [Assertions with explicit hypotheses](#endpoint-status-register); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

### Source boundaries for the imported methods

Clozel 1990 Theorem 3.13 (independence of the coefficient isomorphism) and Lemme 4.9 (purity), Khare’s weight-one descent with its 1999 corrigendum, Blasius–Harris–Ramakrishnan Proposition 5.3.7, Henniart’s 2009 finite-place exterior-square comparison, Kim’s 2003 symmetric-fourth proof and 2004 icosahedral symmetric powers, and the complete Adams–Johnson conditions are explicit primary-source gaps. Their endpoint citations specify the requested assertions; they do not replace the missing proof and exact primary locator. Arthur–Clozel cyclic induction has the separate boundary above.

The unitary method additionally needs the precise level-raising hypotheses of Anastassiades–Thorne Theorem 5.1, author pp. 19–20; the residually reducible lifting hypotheses of Allen–Newton–Thorne Theorem 1.1, arXiv 1912.11269v2 pp. 1–2; and the enormous-image adjoint Selmer vanishing of Newton–Thorne Theorem A, arXiv 1912.11265v2 p. 2. These are inputs to the absent method owners, not consequences of the symmetric-power endpoint. Buzzard–Kilford Theorem A, author p. 2, includes the ordinary component of the full eigencurve; the cuspidal restriction used here has positive indices, as in Newton–Thorne I Theorem 3.2, pp. 53–54 (arXiv v3).

## How to read the build

Layer 0 fixes assertion logic and numerical realization comparisons. Layer 1 defines all-place lifts and establishes the weight-one and low-rank cases, including the concrete projective-image condition. Layer 2 constructs controlled potential-automorphy extensions and compatible-system consequences. Layer 3 supplies the classical-group packet and descent comparisons, with their explicit trace formula assumptions. Layer 4 combines the imported symmetric-power methods with these inputs to obtain full functoriality, purity and equidistribution results. Layer 5 gives generic transfers and precise Langlands conjectural predicates and implications. Mathematical objects whose full carriers require the supplier theories are specified here in prose; Suggested.lean records only representative signatures on existing list, polynomial, weight, projective-group and sign-vector objects.

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

*Needs:* [Compatible-system Euler and gamma factors](#compatible-system-archimedean-factors); [Polarization and the automorphic realization](#blggt-normalization-register); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois).

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

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), Remark 5.3.2, pp. 25–26, author manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="reciprocal-euler-polynomial"></a>
### 0.5 The Euler polynomial comparison

Use Polynomial.reverse for reciprocalEulerPolynomial(Q) over a semiring. The specialization needed here compares a monic Frobenius characteristic polynomial Q(X)=det(X−A) of degree n with the Euler denominator P(T)=TⁿQ(T⁻¹)=det(1−TA). In a field, for x≠0, P(x)(x⁻¹)ⁿ=Q(x⁻¹). The Euler product evaluates P at q^{−s}. The compatible-system construction and analytic L-function are supplied by PotentialModularityAndCompatibleSystems R24.5; this target proves the normalization comparison on these existing polynomial and matrix objects.

The interface should expose the following operations and comparisons.

- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial`: Mathlib polynomial reverse, at the actual degree.
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_coeff_zero`: For monic Q the constant coefficient is one.
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_eval`: For x≠0 in a field, P(x)x^{−natDegree Q}=Q(x⁻¹).
- `TauCeti.LanglandsRegister.reciprocalEulerPolynomial_matrix`: For A in GL_n, P_A(x)=det(1−xA).

Apply Polynomial.eval₂_reverse_mul_pow at a nonzero field element. Monicity fixes the actual degree and constant coefficient. Compare the determinant defining Matrix.charpoly with det(1−xA).

**Checks.**

- Q=X−1 gives P=1−X.
- Q=1 gives P=1.
- Q=X²−aX+q gives P=1−aX+qX² over ℚ.
- At x=1/2, Q=X−1 and P=1−X have unequal values.

([ACC+](#ref-acc-2023), §7.1, pp. 197–198, arXiv v2.)

*Needs:* `Polynomial.reverse`; `Polynomial.eval₂_reverse_mul_pow`; `Matrix.charpoly`.

<a id="expected-crystallinity-newton-above-hodge"></a>
### 0.6 Expected de Rham and crystalline properties of GSp₄ Galois representations in singular weight (Pilloni Remark 5.3.2)

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

<a id="strong-artin-conjecture"></a>
### 1.1 Langlands' conjecture for Artin representations (the strong Artin conjecture)

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

n = 1 is class field theory; the proved two-dimensional cases are [Odd Artin representations over the rationals](#odd-artin-modularity-over-q) and [The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images](#totally-real-odd-artin).

([Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.2 PDF p.20; [Serre's modularity conjecture (I)](#ref-kw-2009-I), §10.2, PDF/printed p.20 (author copy results.pdf).)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); AnalyticNumberTheory, Layer AN.4; TauCetiRoadmap.Chebotarev, Layer 10; [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTIN](#contract-c-artin).

<a id="irregular-systems-weight-one"></a>
### 1.2 Irregular odd compatible systems arise from weight-one newforms (Khare–Wintenberger, Theorem 10.1(ii))

Let (ρ_ι) be a two-dimensional compatible system of representations of G_ℚ (E-rational, continuous, semisimple, finitely ramified ρ_ι : G_ℚ → GL₂(Q̄_ℓ) for every ℓ and ι : E ↪ Q̄_ℓ, with Weil–Deligne compatibility at q ∤ ℓ and crystalline at q | ℓ with Hodge–Tate weights (a, b) for ℓ ≫ 0) which is irregular (a = b), irreducible and odd. Then, up to twist, (ρ_ι) arises from a newform of weight one; in particular, after twisting to Hodge–Tate weights (0, 0), every ρ_ι has finite image.

The compatible system in Khare–Wintenberger's sense (§5): weakly compatible, crystalline only for ℓ ≫ 0.

State the resulting comparison as `TauCeti.WeightOne.weightOne_of_irregular`.

Twist so that the weights are (0, 0); Sen–Fontaine: ρ_ι is unramified at ℓ for almost all ℓ. Residual irreducibility of ρ̄_λ for almost all λ (PotentialModularityAndCompatibleSystems R24.6). Strong form of Serre's conjecture (ClassicalSerreModularity R27.6) with Gross's tameness criterion and Coleman–Voloch (SerreWeightAndLevelOptimisation R20.3): for almost all λ, ρ̄_λ arises from S₁(Γ₁(N)) with N independent of λ. Khare's weight-one descent (owner ClassicalSerreModularity R27.6/weight-one-descent-from-infinitely-many-primes: since S₁(Γ₁(N)) has finitely many newforms, one f has ρ̄_λ ≅ ρ̄_{f,λ} for infinitely many λ, hence ρ_ι ≅ ρ_{f,ι}). **Source boundary.** Khare–Wintenberger sketch this step and cite Khare’s IMRN 1997 note; its primary proof and 1999 corrigendum remain a source gap. Use the corrected descent statement as a required supplier theorem, not the uncorrected note by itself.

The converse: newforms of weight one give irregular irreducible odd compatible systems (Deligne–Serre).

([Serre's modularity conjecture (I)](#ref-kw-2009-I), Theorem 10.1(ii), §10.1, p. 20 (author copy results.pdf); [Serre's modularity conjecture (I)](#ref-kw-2009-I), Proof of Theorem 10.1(ii), p. 20 (author copy results.pdf); [Serre's modularity conjecture (I)](#ref-kw-2009-I), §5, p. 8 (author copy results.pdf).)

*Needs:* ClassicalSerreModularity, Layer R27.6 (weight one descent from infinitely many primes); ClassicalSerreModularity, Layer R27.6 (unramified residual representations arise in weight one); ClassicalSerreModularity, Layer R27.6 (full classical serre theorem); PotentialModularityAndCompatibleSystems, Layer R24.6 (residual members); PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified); SerreWeightAndLevelOptimisation, Layer R20.3 (weight one forms unramified at p); AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="non-solvable-residual-modularity"></a>
### 1.3 Modularity of non-solvable mod 5 representations of totally real fields with cyclotomic determinant

Let E be totally real with 5 unramified, and ϱ̄:G_E→GL₂(F₅) totally odd with det ϱ̄=ε̄^{−1} and nonsolvable projective image. The residual representation is modular, by the elliptic-curve construction, solvable base change and descent used in BCGP Proposition 10.1.3. Applying Pilloni–Stroh Proposition 2.1.3 requires first twisting the determinant to ε̄ and passing to a solvable totally real extension where the projective image is PSL₂(F₅); it is not a direct application to PGL₂(F₅). Separately, Snowden Theorem 7.2.1 constructs finitely many weight-two lifts for a specified lifting problem exactly when that problem has local solutions at every designated place. It does not promise lifts of incompatible types or determinants.

Residual modularity: E totally real, 5 unramified, det ϱ̄=ε̄^{−1}, total oddness and nonsolvable projective image. Lifting subclaim: Snowden assumptions (A1),(A2), an odd residual representation, a finite set Σ containing ramification and the places above 5, a finite-order ψ lifting det ϱ̄/ε̄, definite local types and inertial types, and a local weight-two lift of determinant ψε at every v∈Σ. The projective-PGL₂(F₅) exceptional case needs [E(ζ₅):E]=4. Assumption (A1) is absolute irreducibility after restriction to G_{E(ζ₅)}; (A2) is that degree-four condition in the projective-PGL₂(F₅) case.

State the resulting comparison as `TauCeti.WeightOne.mod5_nonsolvable_modular`.

Residual modularity: SBT/Taylor's moduli of elliptic curves with ϱ̄ ≅ E[5] and Moret-Bailly over a solvable extension, then solvable descent of modularity (BCGP cite Pilloni–Stroh Proposition 2.1.3). Lifts: Snowden Theorem 7.2.1; modularity of lifts: Kisin's theorem (GL2ModularityLifting).

The p = 5 case of BCGP Proposition 10.1.3.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, p. 266 (arXiv v3); [Surconvergence, ramification et modularité](#ref-pilloni-stroh-2016), §2.1, Lemmas 2.1.1–2.1.2 and Proposition 2.1.3, pp. 9–10; [On two dimensional weight two odd representations of totally real fields](#ref-snowden-2009), §7.2, Theorem 7.2.1 and definition of a lifting problem, pp. 20–21; §3.1, (A1)–(A2), p. 6.)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R23.1; AutomorphicGaloisRepresentations, Layer R19.2; GL2ModularityLifting, Layer R22.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="buzzard-taylor-hypotheses"></a>
### 1.4 Finitely many points with finite image make R[1/p] reduced (Calegari–Geraghty Lemma 4.14 and the Buzzard–Taylor remark)

Let F be a number field, k a finite field of characteristic p, S a finite set of places not containing any v | p, and ρ̄ : G_{F,S} → GL₂(k) continuous and absolutely irreducible with universal deformation ring R. If the Galois representation of every Q̄_p-point of R has finite image and R has only finitely many Q̄_p-points, then R[1/p] is reduced. For F = ℚ and ρ̄ modular these hypotheses can often be deduced from Buzzard–Taylor and Buzzard (companion forms and analytic continuation of overconvergent weight-one forms), which is how Calegari–Geraghty's weight-one modularity results connect to the classical ones.

Unramified-at-p deformation problem (S contains no place above p); ρ̄ absolutely irreducible.

State the resulting comparison as `TauCeti.WeightOne.reduced_of_finitePoints`.

Calegari–Geraghty's proof: the points of R[1/p] with finite image are unobstructed (H¹ of a finite-image representation in characteristic 0 is computed by inflation–restriction), so R[1/p] is étale at them. The remark: Buzzard–Taylor show that unramified-at-p lifts of modular ρ̄ come from weight-one forms, which have finite image and are finite in number.

The remark only says 'often'; the hypotheses are not claimed in general.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Lemma 4.14, §4.2, p. 52 (arXiv v2) = Invent. pp. 366–367; proof pp. 52–53 = Invent. pp. 367–368; [Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §4.2, remark after the proof of Lemma 4.14, p. 53 (arXiv v2) = Invent. p. 368.)

*Needs:* AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation); GlobalGaloisDeformations, Layer R04.2 (universal deformation ring); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="imaginary-quadratic-elliptic-modularity"></a>
### 1.5 Modularity of elliptic curves over imaginary quadratic fields with X₀(15)(F) finite (Caraiani–Newton)

Let F be an imaginary quadratic field such that the Mordell–Weil group X₀(15)(F) is finite (for example F = ℚ(√−d), d = 1, 2, 3, 5). Then every elliptic curve E/F is modular: there is a cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight 2 (or, when E has CM by a field embedding in F, an isobaric sum ψ ⊞ ψ^c of Hecke characters of F) whose L-function is L(E, s). More generally, if F is an imaginary CM field, Galois over ℚ with ζ₅ ∉ F, then 100% of Weierstrass equations over F, ordered by height, define modular elliptic curves.

F imaginary quadratic with X₀(15)(F) finite (Theorem 1.1); F imaginary CM Galois over ℚ with ζ₅ ∉ F (Theorem 1.2).

State the resulting comparison as `TauCeti.WeightOne.ellipticCurve_modular_imagQuadratic`.

Import the exact potentially semistable CM lifting theorem of Caraiani–Newton Theorem 1.3, with its residual image, polarization and local hypotheses, as the missing C-LOCAL-DEFORMATION extension. It is not supplied by the ordinary/Fontaine–Laffaille theorems of PotentialAutomorphyInfrastructure Layer 5, §§5.22–5.23. Residual modularity of E[3] or E[5] (Allen–Khare–Thorne) and the 3–5 switch; analysis of the F-points of X₀(15) and related modular curves for the exceptional residual images. Require both this lifting extension and the modular-curve point analysis with the residual modularity and switching maps.

Over imaginary quadratic fields this is the first unconditional modularity theorem; potential modularity over CM fields is [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers) and Layer 2.

([On the modularity of elliptic curves over imaginary quadratic fields](#ref-caraiani-newton-2023), §1, Theorem 1.1 (Corollary 7.1.2), p. 2 (arXiv:2301.10509v3); [On the modularity of elliptic curves over imaginary quadratic fields](#ref-caraiani-newton-2023), §1, Theorem 1.2 (Corollary 6.1.2), p. 3 (arXiv:2301.10509v3).)

*Needs:* [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); PotentialModularityAndCompatibleSystems, Layer R23.1; [Assertions with explicit hypotheses](#endpoint-status-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

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

Local parameters: SUPP LLC for GL_n (EndoscopicTransferAndUnitaryTraceComparison ET.6) and archimedean Layer 0. Uniqueness: Jacquet–Shalika strong multiplicity one for isobaric sums (AutomorphicLFunctionsAndLocalFactors AL.3).

**Checks.**

- R = det on GL₂: the lift of π is the central character ω_π (a Hecke character), by local class field theory.
- n = 1, R = χ ↦ χ^k: the lift of a Hecke character χ is χ^k.
- For π = AI_{K/F}(θ) dihedral, Sym²π exists but is not cuspidal: it is AI(θ²) ⊞ θ|_{𝔸_F^×} (whereas Ad(π) = AI(θ/θ^σ) ⊞ η_{K/F}).
- R = std: the lift of π is π itself, and IsFunctorialLift agrees with equality of rec at every place.

R = Sym^{n−1} on GL₂ recovers [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); R = std ⊗ std′ on GL₂ × GL₂ is Ramakrishnan's lift.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, 'Context', p. 1 (arXiv:1912.11261v3).)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [Archimedean reciprocity, sums and restriction](#archimedean-langlands-conventions); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-AUTOMORPHIC](#contract-c-automorphic).

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

<a id="totally-real-odd-artin"></a>
### 1.8 The odd Artin conjecture over totally real fields (Pilloni–Stroh), as used for A₅ images

Let E be a totally real field and ϱ : G_E → GL₂(ℂ) a continuous irreducible finite-image totally odd representation (det ϱ(c) = −1 for every complex conjugation c), in particular one with projective image A₅. Then ϱ is automorphic: it arises from a Hilbert modular eigenform of parallel weight one (Pilloni–Stroh, Theorem 0.3), so ϱ satisfies Langlands' and Artin's conjectures. Boxer–Calegari–Gee–Pilloni apply it to a characteristic-zero totally odd lift with finite image (Tate) of a mod 3 representation ϱ̄₃ : G_E → GL₂(F₉) with projective image A₅.

E totally real; ϱ:G_E→GL₂(ℂ) continuous, irreducible and of finite image; det ϱ(c_v)=−1 for every real place v. No unramified-at-p assumption is present in Pilloni–Stroh Theorem 0.3.

State the resulting comparison as `TauCeti.WeightOne.oddArtin_totallyReal`.

Pilloni–Stroh (Astérisque 382): companion forms and analytic continuation of overconvergent Hilbert modular forms of parallel weight one (after Buzzard–Taylor, Kassaei, Sasaki), with modularity lifting for the residual representations. Tate: a projective representation with finite image lifts to a representation with finite image; oddness is preserved.

The non-solvable vast case of BCGP Proposition 10.1.3 for p = 3.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 10.1.3, §10.1, p. 266 (arXiv v3); [Surconvergence, ramification et modularité](#ref-pilloni-stroh-2016), Theorem 0.3, §0, printed p. 2.)

*Needs:* [Langlands' conjecture for Artin representations (the strong Artin conjecture)](#strong-artin-conjecture); AutomorphicGaloisRepresentations, Layer R19.2; GL2AutomorphicRepresentationsAndTransfer, Layer R17.5; [C-ARTIN](#contract-c-artin).

<a id="symmetric-power-lift-over-number-fields"></a>
### 1.9 Symmetric power lifts Sym^{n−1}π over a number field

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
- For F = ℚ it agrees with [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting).

Over ℚ it is [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting).

([Clozel–Thorne III](#ref-ct-2017), §1 Introduction, manuscript p. 2.)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gelbart-jacquet"></a>
### 1.10 Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃

Let π be a cuspidal automorphic representation of GL₂(𝔸_F), F a number field. Then Sym²π (equivalently Ad(π) = Sym²π ⊗ ω_π^{−1}) exists as an automorphic representation of GL₃(𝔸_F) in the sense of [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift), and Ad(π) is cuspidal iff π is not dihedral (not automorphically induced from a Hecke character of a quadratic extension).

F a number field; π cuspidal on GL₂(𝔸_F).

State the resulting comparison as `TauCeti.Functoriality.gelbartJacquet`.

Gelbart–Jacquet (Ann. Sci. ÉNS 1978): Shimura's integral representation of L(s, Ad π) and the converse theorem for GL₃. Local compatibility at every place by the local theory of Gelbart–Jacquet and the local Langlands correspondence for GL₂.

For π attached to a non-CM elliptic curve over ℚ, Ad(π) is cuspidal on GL₃; for a CM curve it is not.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, 'Context', p. 1 (arXiv:1912.11261v3); [A relation between automorphic representations of GL(2) and GL(3)](#ref-gelbart-jacquet-1978), §9, (9.3) Theorem, p. 534 (Ann. Sci. ÉNS 11).)

*Needs:* [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); GL2AutomorphicRepresentationsAndTransfer, Layer R16.3; AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="ramakrishnan-tensor-product"></a>
### 1.11 Ramakrishnan: the automorphic tensor product GL₂ × GL₂ → GL₄

For cuspidal π,π′ on GL₂(𝔸_F), Ramakrishnan Theorem M constructs an isobaric π⊠π′ on GL₄ with local Rankin–Selberg L- and epsilon-factors at all finite places and L-factors at infinity. If neither is dihedral, it is cuspidal iff π′ is not a Hecke-character twist of π. If π′=AI_{K/F}(μ) for quadratic K/F, it is cuspidal iff BC_K(π) is cuspidal and is not isomorphic to BC_K(π)⊗(μ∘θ)μ^{−1}, θ the nontrivial automorphism. This latter criterion is not replaced by a blanket exclusion of only both-dihedral pairs.

F a number field; π₁, π₂ cuspidal on GL₂(𝔸_F).

State the resulting comparison as `TauCeti.Functoriality.ramakrishnan`.

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

*Needs:* [Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃](#gelbart-jacquet); [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

<a id="kim-sym4"></a>
### 1.14 Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)

Let F be a number field. (a) For Π cuspidal on GL₄(𝔸_F), ∧²Π exists as an automorphic representation of GL₆(𝔸_F) (Kim 2003, with local compatibility at the places over 2 and 3 completed by Henniart 2009, so that ∧²Π is a functorial lift in the sense of [Functorial lift of a GL_n representation along an algebraic representation R : GL_n → GL_N](#functorial-lift) at every place). (b) For π cuspidal on GL₂(𝔸_F), Sym⁴π exists as an automorphic representation of GL₅(𝔸_F) (Kim 2003), cuspidal unless π is dihedral, tetrahedral or octahedral (Kim–Shahidi).

F a number field.

State the resulting comparison as `TauCeti.Functoriality.kim_exteriorSquare`.

Kim: Langlands–Shahidi method for the Levi GL₂ × GL₄ (and GL₃ × GL₄) in Spin groups and the converse theorem, giving ∧² for GL₄; Sym⁴ is extracted from ∧²(Sym³π). **Source boundary.** Henniart 2009 completes the finite-place exterior-square comparison; its primary proof and the separate archimedean comparison require exact source locators. They are required for the all-place lift, beyond Kim’s weak transfer. Gee–Taïbi use (a) in their proof of the multiplicity formula for GSp₄; BCGP Theorem 9.3.1 uses (a) with Theorem 2.9.3.

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

*Needs:* [Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃](#gelbart-jacquet); [Kim–Shahidi: functorial products GL₂ × GL₃ → GL₆ and the symmetric cube](#kim-shahidi-sym3); [Kim: the exterior square GL₄ → GL₆ and the symmetric fourth power GL₂ → GL₅ (with Henniart)](#kim-sym4); [The statement SP_n (Newton–Thorne, Conjecture B)](#sp-statement); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-ARTIN](#contract-c-artin).

### Examples

For the identity representation of GL₂(𝔽₇), the projective image is PGL₂(𝔽₇), containing PSL₂(𝔽₇). At rank n=3 the strict bound is 7>max(5,5), so the sandwich holds. For 𝔽₅, equality with the lower threshold excludes the hypothesis. A dihedral automorphic representation has a noncuspidal symmetric-square lift; this is an isobaric transfer, not an instance of the cuspidal SP predicate.

### Dependencies

The layer uses the exact supplier contracts above, AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), AnalyticNumberTheory, Layer AN.4, TauCetiRoadmap.Chebotarev, Layer 10, Layer 0, ClassicalSerreModularity, Layer R27.6 (weight one descent from infinitely many primes), ClassicalSerreModularity, Layer R27.6 (unramified residual representations arise in weight one), ClassicalSerreModularity, Layer R27.6 (full classical serre theorem), PotentialModularityAndCompatibleSystems, Layer R24.6 (residual members), PadicHodgeTheory, Layer R06.2 (dcris of tate twists and unramified), SerreWeightAndLevelOptimisation, Layer R20.3 (weight one forms unramified at p), AutomorphicGaloisRepresentations, Layer R19.1 (weight one artin representation), PotentialModularityAndCompatibleSystems, Layer R23.1, AutomorphicGaloisRepresentations, Layer R19.2, GL2ModularityLifting, Layer R22.5, GlobalGaloisDeformations, Layer R04.2 (universal deformation ring), [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension), EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, `Matrix.ProjGenLinGroup`, `Matrix.ProjGenLinGroup.mk`, `Matrix.ProjGenLinGroup.map`, `Matrix.ProjectiveSpecialLinearGroup.toPGL`, GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, GL2AutomorphicRepresentationsAndTransfer, Layer R16.3, AutomorphicLFunctionsAndLocalFactors, Layer AL.4.

## Layer 2: controlled potential automorphy and compatible systems

<a id="moret-bailly-galois-control"></a>
### 2.1 Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)

Let K^{(avoid)}/K/K₀ be number fields with K^{(avoid)}/K and K/K₀ Galois, S a finite set of places of K₀, and for v ∈ S_K a finite Galois L′_v/K_v with L′_{σv} = σL′_v. Let T/K be smooth and geometrically connected with non-empty Gal(L′_v/K_v)-invariant open Ω_v ⊆ T(L′_v). Then there are a finite Galois L/K and P ∈ T(L) with L/K₀ Galois, L linearly disjoint from K^{(avoid)} over K, and L_w ≅ L′_v with P ∈ Ω_v for w | v ∈ S_K.

Places and extensions as stated.

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_point_galois_control`.

Enlarge S (Weil bounds and Hensel give K_v-points for almost all v) so that each simple Galois subextension of K^{(avoid)}/K is non-split at some v ∈ S_K with L′_v = K_v; this gives linear disjointness. Reduce to L′_v = K_v by a soluble extension with prescribed completions (CHT Lemma 4.1.2) and its normal closure over K₀. Apply Moret-Bailly's Théorème 1.3 and take the normal closure over K₀.

Check the role of Ω_v: the point lies in the prescribed open at every place above S, which is what the Dwork-family argument needs at l_i, l′ and ∞.

([BLGGT](#ref-blggt-2014-v4), §3.1, Proposition 3.1.1, p. 41 (arXiv v4).)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R23.1 (moret bailly theorem incomplete skolem data have integral points); [C-MODULI](#contract-c-moduli).

<a id="potential-ordinary-automorphy"></a>
### 2.2 Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: l_i odd with ζ_{l_i} ∉ F; µ_i totally odd de Rham (HT {w_i}); r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible with (r̄_i, µ̄_i) totally odd polarized, r̄_i|_{G_{F(ζ_{l_i})}} irreducible and l_i ≥ 2(d_i + 1); sets H_{i,τ} of n_i distinct integers with H_{i,τ∘c} = {w_i − h}; a finite Galois-stable S ⊇ primes above l_i and ramification; lifts ρ_{i,v} (v ∤ l_i) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}; and F^{(avoid)}. Then there are F′/F finite CM, Galois over F₀ and linearly disjoint from F^{(avoid)}, and regular algebraic cuspidal polarized (π_i, χ_i) over F′ with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, π_i unramified above l_i and outside S, ı_i-ordinary, HT_τ(r_{l_i,ı_i}(π_i)) = H_{i,τ|_F}, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S, u ∤ l_i.

F/F₀ finite Galois of imaginary CM fields; n_i≥1; d_i is the largest dimension of an irreducible subrepresentation of r̄_i on the subgroup generated by all Sylow pro-l_i subgroups. All other data and hypotheses are those displayed in the statement, including the fixed ι_i for each i.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_ordinary_automorphy`.

Combine dwork-potential-ordinary-automorphy (applied to a symplectic induction of r̄_i to the totally real subfield) with ordinary-lifts-with-local-conditions and ordinary-automorphy-lifting over the resulting extension.

Check that the output is ı-ordinary with prescribed Hodge–Tate numbers: the input needed by Theorem 4.5.1 to start the potentially diagonalizable lifting.

([BLGGT](#ref-blggt-2014-v4), §3.3, Proposition 3.3.1, pp. 47–48 (arXiv v4).)

*Needs:* PotentialAutomorphyInfrastructurePartII, Layer PL.5 (dwork potential ordinary automorphy); PotentialAutomorphyInfrastructurePartII, Layer PL.5 (ordinary lifts prescribed local); PotentialAutomorphyInfrastructurePartII, Layer PL.4 (ordinary automorphy lifting); AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="qian-auxiliary-prime"></a>
### 2.3 Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)

Use Qian’s Theorem 1.1 data F, F^av, n≥2, l and the continuous semisimple residual representation r̄:G_F→GL_n(F_{l^s}). Fix a non-CM elliptic curve E₀/ℚ and write n=l^a m with l∤m. Let k′⊂F̄_l be generated by the m-th roots of all elements of F_{l^s}. Choose an odd N>100n+100 divisible by none of the prime factors of ln, none of the primes ramified in F^av or the residual fixed field, and none of the bad primes of E₀. Require F_{l²}k′⊂F_l(ζ_N); for n=2 require that field to have even degree d over F_l and F_{l²}k′ to lie in the residue field of ℚ(ζ_N)^+. If F_l(ζ_N)=F_{l^d} with d even, require N∤l^(d/2)+1. Let F^avoid be the ℚ-normal closure of F^av F̄^{ker r̄}(ζ_l). Then ℚ(ζ_N) and F^avoid are linearly disjoint over ℚ. There is a rational prime l′≡1 mod Nn with l′>2ln+5, unramified in F^avoid, for which E₀ has good ordinary reduction, r̄_{E₀,l′}(G_{F̃})=GL₂(F_{l′}) with F̃ the normal closure of F, and some σ∈G_F−G_{F(ζ_l′)} has scalar image.

Theorem 1.1 data as displayed; the finite field k′ is distinct from every number-field extension denoted F′. The elliptic residual realization is cohomological H¹ in the pinned convention.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_auxiliaryPrime`.

Use Qian Lemma 2.3 for the modulus and all finite exclusions. Disjoint ramification makes the cyclotomic/avoidance intersection unramified over ℚ and hence trivial. The progression l′≡1 mod Nn has positive Dirichlet density since gcd(N,n)=1. Remove the finite bad, ramified and bounded primes and the density-zero supersingular exceptions. Serre open image over F̃ supplies the full residual image. Choose u∈F_{l′}× with u²≠1 and an element σ∈G_{F̃} mapping to uI₂. Its cyclotomic determinant is nontrivial, so σ∉G_{F(ζ_l′)}. The exact open-image and supersingular inputs are requested from OpenImageTheoremsForAbelianVarieties.

The conditions are all of density one or open, so l′ exists.

([Potential automorphy for GL_n](#ref-qian-2023), Proposition 4.1 (first list), §4, p. 21, and first paragraph of its proof, p. 22 (arXiv v1); §4 opening (choice of E, N, F^avoid), p. 21; Invent. pp. 1268–1269 per routed locators.)

*Needs:* TauCetiRoadmap.Chebotarev, Layer 10; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="steinberg-ordinarity-lemma"></a>
### 2.4 Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)

At a place v|l of the chosen Dwork point require v(t)<0. Suppose V_{λ,t}^{ss}≅r_{l,ι}(π) for a regular algebraic cuspidal π and that the auxiliary-prime V_{λ′,t} is semisimple. The latter holds in the construction because its residual twist is an absolutely irreducible elliptic symmetric power. Match the coefficient embeddings. The monodromy of V_{λ′,t} at v is a single unipotent Jordan block of size n. Varma’s bound for its actual automorphic realization then forces π_v to be an unramified twist of Steinberg. The Hodge weights at τ are M(a_τ),…,M(a_τ)+n−1, so the constant automorphic weight is +λ_τ with λ_τ=M(a_τ). The central-character slope is +nλ_τ, and its j-th partial slope is +jλ_τ, giving ι-ordinarity by Geraghty. This proves ι-ordinarity of π. Galois ordinarity and potential semistability of V_{λ,t}^{ss} require the separate Dwork geometry and subquotient argument; they do not follow from good-place compatibility with V_{λ′,t}. No semisimplicity of the original l-adic fibre is asserted.

v(t)<0 at each relevant l-adic place; λ′ lies over an odd prime different from l and prime to N; V_{λ′,t} is semisimple; matched coefficient embeddings and the displayed semisimplified automorphic realization.

State the resulting comparison as `TauCeti.PotentialAutomorphy.steinbergOrdinary`.

Use Qian’s corrected monodromy lemma at λ′, which requires v(t)<0. Global semisimplicity at λ′ preserves the maximal local Jordan block when comparing with r_{l′,ι′}(π). Use Varma’s local–global monodromy bound. The partition (n) is maximal; local LLC identifies the component as Steinberg twisted by an unramified character. Compute the central character from det r_{l,ι}(π)·ε_l^(n(n−1)/2). Its τ-Hodge weight is nλ_τ; geometric reciprocity makes the Galois value a unit and gives the positive valuation exponent +nλ_τ. Divide by n and multiply by j to obtain +jλ_τ, then apply Geraghty’s ordinary criterion.

The ordinarity needed to apply ordinary lifting at l.

([Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Lemma 4.0.3 and its proof, Ch. 4, pp. 64–65 (thesis, PDF pp. 71–72); ≈ published Lemma 4.3, Invent. p. 1273; [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); the published Lemma 4.3 (Invent. p. 1273) is NOT in arXiv v1.)

*Needs:* PotentialAutomorphyInfrastructurePartII, Layer PL.0; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="galois-ordinarity-from-automorphic"></a>
### 2.5 Galois ordinarity from automorphic ordinarity (ACC+ Corollary 5.5.2; Qian Remark 4.4)

Let F be an imaginary CM field, ι : Q̄_p ≅ ℂ and π a cuspidal automorphic representation of GL_n(𝔸_F), regular algebraic of weight ιλ. If π is ι-ordinary at every v ∈ S_p and r̄_ι(π) is decomposed generic and irreducible, then r_ι(π)|_{G_{F_v}} is ordinary of weight λ for every v ∈ S_p: upper triangular with the diagonal characters determined by λ and the Hecke eigenvalues of the ordinary U_p-operators. Qian's Remark 4.4 uses it to recover Galois ordinarity of the automorphic Dwork realisation. The Remark 4.4 application is restricted to the irreducible, decomposed-generic residual branch of Theorem 1.4. It does not recover ordinarity for arbitrary semisimple residual input in Theorem 1.1.

F imaginary CM; decomposed generic irreducible residual representation.

State the resulting comparison as `TauCeti.PotentialAutomorphy.ordinary_of_iotaOrdinary`.

Use ACC+ Corollary 5.5.2, derived from Theorem 5.5.1 after soluble CM base change disjoint from the residual fixed field; check irreducibility and decomposed genericity before applying it to the Dwork realization.

Converse direction to PL.0/iota-ordinary-implies-ordinary of the supplier, which is stated over totally real or polarized settings.

([ACC+](#ref-acc-2023), ACC+ Corollary 5.5.2 from Theorem 5.5.1; Qian Remark 4.4, published p. 1274 (arXiv v1 final paragraph of §4); [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 4.0.4, Ch. 4, p. 65 (thesis, PDF p. 72); ≈ published Remark 4.4, Invent. p. 1274.)

*Needs:* PotentialAutomorphyInfrastructure, Layer PA.2; PotentialAutomorphyInfrastructurePartII, Layer PL.0; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-auxiliary-primes"></a>
### 2.6 The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)

In the proof of ACC+ Theorem 7.1.11 (F/F₀ Galois CM, F₀^avoid, 𝓛₀, strongly irreducible rank-2 very weakly compatible systems R_i with Hodge–Tate numbers {0, 1} and S_i ∩ 𝓛₀ = ∅, integers m_i > 0), one chooses a non-CM E/ℚ with good reduction above 𝓛₀, distinct primes l₁, l₂ and λ_i | l₂ with: (1) l₂ splits completely in each M_i; (2) the image of G_F on E[l₁] contains SL₂(F_{l₁}) and r̄_{i,λ_i}(G_F) ⊇ SL₂(F_{l₂}); (3) l₁, l₂ unramified in F; (4) E has good reduction above l₁, l₂; (5) l₁, l₂ under no prime of S_i; (6) l₁, l₂ > 2m_i + 3, together with (6′) l₁, l₂ > (m_i + 1)² and (7) r_{i,λ_i} crystalline with Hodge–Tate numbers {0, 1} above l₂. Such primes exist since all conditions hold for a set of primes of density one except the first for l₂, which holds for a positive-density set.

Data of ACC+ Theorem 7.1.11.

State the resulting comparison as `TauCeti.PotentialAutomorphy.acc_auxiliaryPrimes`.

Chebotarev and the density statements of ACC+ Lemma 7.1.3 (residual irreducibility and large image for density one).

Feeds the l₁–l₂ switch in the proof of Theorem 7.1.11.

([ACC+](#ref-acc-2023), §7.2.5, proof of Theorem 7.1.11, Assumption 7.2.6, arXiv v2 p. 208 (Annals p. 1103).)

*Needs:* TauCetiRoadmap.Chebotarev, Layer 10; PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); PotentialModularityAndCompatibleSystems, Layer R24.5:operations; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="patrikis-taylor-potential-automorphy"></a>
### 2.7 Potential automorphy of pure regular odd essentially self-dual weakly compatible systems (Patrikis–Taylor, Theorem A)

Let R be a weakly compatible system over ℚ, pure, regular and odd essentially self-dual, with its symplectic totally odd or orthogonal totally even multiplier itself a weakly compatible rank-one system. After enlarging the coefficient field, R decomposes as a direct sum of weakly compatible systems R_j, and over one finite Galois totally real extension each R_j is the compatible system of a regular algebraic cuspidal polarized automorphic representation. Thus R becomes isobarically automorphic. No irreducibility assumption is imposed; the sum need not be cuspidal. This is the ℚ-specialization of Patrikis–Taylor Theorem A and Theorem 2.1.

Weak compatibility, purity, regularity, the stated pairing parity and a compatible multiplier. For the extension/avoidance version of Theorem 2.1, use its finite Galois CM F/F₀ and F^avoid/F data.

State the resulting comparison as `TauCeti.PotentialAutomorphy.patrikisTaylor`.

Patrikis–Taylor Lemma 1.6 makes the irreducible constituents totally odd and polarized at conjugation-invariant coefficient primes. Use their Theorem 2.1, not BLGGT Theorem 5.5.3 under weaker hypotheses. The proof chooses suitable coefficient primes, applies BLGGT Theorem 4.5.1 to the constituents, and transports those constituents into compatible systems by BLGGT Theorem 5.5.1. The exact new constituent export is requested from R24.5.

Fresán–Sabbah–Yu apply it to symmetric powers of Kloosterman sheaves.

([Hodge theory of Kloosterman connections](#ref-fsy-2022), §5.3.2, Theorem 5.38 (Patrikis–Taylor, [44, Th. A]), arXiv v5 pp. 56–57; [Automorphy and irreducibility of some l-adic representations](#ref-patrikis-taylor-2015), Theorem A, p. 2; Theorem 2.1 and proof, pp. 12–13.)

*Needs:* PotentialModularityAndCompatibleSystems, Layer R24.5:operations; PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); [C-SYSTEM](#contract-c-system).

<a id="twisted-modular-curve"></a>
### 2.8 The twisted modular curve X_E(q)

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
### 2.9 The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)

BCGNT Proposition 6.2.3 is a sufficient-condition theorem: with the auxiliary systems and all conditions (1)–(17) below, Sym^{n−1}R is weakly automorphic of level prime to X₀. It does not assert an iff between residual automorphy at p and r of a single CM-tensored system.

F imaginary CM, m≥2, n≥1, X₀ a finite set of finite places; R=(M,S,{Q_v},{r_λ},{H_τ}) very weakly compatible of rank 2. (1) H_τ={0,m}. (2) det r_λ=ε^{−m}. (3) R strongly irreducible. (4) X₀∩S=∅. (5) F/ℚ Galois containing an imaginary quadratic F₀. Fix M↪ℂ. (6) E/ℚ cyclic totally real of degree m, disjoint from F; L=EF and Ψ:𝔸_L^×→M^×. Choose τ₀:F₀↪ℂ and τ₁,…,τ_m:EF₀↪ℂ extending τ₀, with Ψ(α)=∏_{i=1}^m τ_i(N_{L/EF₀}α)^{m−i}cτ_i(N_{L/EF₀}α)^{i−1} on L^×. R_CM=Ind_{G_L}^{G_F}Ψ has H_CM,τ={0,…,m−1} and det r_CM,λ=ε^{−m(m−1)/2}. Its bad set is the places ramified in L or above ramification of Ψ. (7) Distinct primes p,r not dividing places of S and chosen coefficient places above them. (8) A weakly compatible rank-m R_aux, pure of weight m−1, bad set avoiding X₀∪{v|pr}, det=ε^{−m(m−1)/2}, HT={0,…,m−1}. (9) A weakly compatible rank-nm S_UA, pure of weight nm−1, bad set avoiding X₀∪{v|pr}, det=ε^{−nm(nm−1)/2}, HT={0,…,nm−1}, weakly automorphic of level prime to X₀∪{v|pr}. Put S_aux=Sym^{n−1}R⊗R_aux and S_CM=Sym^{n−1}R⊗R_CM. (10) L/F and Ψ unramified above X₀∪{v|pr}. (11) p>2nm+1 and [F(ζ_p):F]=p−1. (12) r>2nm+1, r splits completely in EF₀, [L(ζ_r):L]=r−1. (13) Up to conjugacy SL₂(F_p)≤r̄_p(G_F)≤GL₂(F_p), likewise at r. For m>2, r̄_aux,p has image GU_m(F_{p²}) and multiplier ε^{1−m}; for m=2 its image is GL₂(F_p). r̄_CM,r restricted to G_{F(ζ_r)} is irreducible. For m=2 the projective extensions cut out by r̄_p and r̄_aux,p over F(ζ_p) are disjoint. (14) s̄_UA,p≅s̄_aux,p and r̄_aux,r≅r̄_CM,r. (15) The p-adic places split as Σ_ord⊔Σ_ss; each F_v contains ℚ_{p²}, r̄_p|G_{F_v} and ρ̄_{2,m,0}|G_{F_v} are trivial. On Σ_ord, r_p is crystalline ordinary; on Σ_ss, r_p connects to ρ_{2,m,0}. (16) On Σ_ord, r̄_aux,p is trivial and r_aux,p,s_UA,p crystalline ordinary. On Σ_ss, r̄_aux,p is trivial, r_aux,p,s_UA,p crystalline, and they connect to ρ_{m,1,0},ρ_{nm,1,0} respectively. (17) At every v|r, r̄_aux,r≅r̄_CM,r is trivial and r_aux,r is crystalline ordinary. The connects relation and ρ_{a,b,c} are BCGNT Definitions 5.1.1 and the local deformation component relation, not unnamed propositions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.prSwitch`.

Apply BCGNT Theorem 3.2.1 at p to S_aux, using the S_UA seed, Taylor–Wiles image conditions (13) and local connects relations (15)–(16). Apply the same theorem at r to S_CM using S_aux, (14), (17), and ordinary connectedness; obtain weak automorphy of S_CM. The order-m self-twist of its automorphic π gives automorphic induction from GL_n(𝔸_L). Compare compatible systems at an irreducible member, undo Ψ, and descend cyclically to F (ACC+ Proposition 6.5.13). The specialized connects ALT and descent require exact exports beyond a bare Layer 5 ordinary/Fontaine–Laffaille citation.

Input to [Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)](#potential-weak-automorphy-symmetric-powers).

([BCGNT](#ref-bcgnt-2025), Proposition 6.2.3 and proof, §6.2, arXiv v3 pp. 61–63 (published pp. 54–57; arXiv pagination differs) PDF p.62.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="pd-lifts-with-local-conditions"></a>
### 2.10 Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)

Let n ≥ 1, l be an odd prime, and F be an imaginary CM field with ζ_l ∉ F. Let S be a finite set of finite places of F⁺, split in F and containing every place above l, with chosen ṽ above each v. Let µ : G_{F⁺} → Q̄_l^× be continuous algebraic, unramified outside S and satisfy µ(c_v)=−1 at every real place. Let r̄ : G_{F⁺} → G_n(F̄_l) be continuous, unramified outside S, with ν∘r̄=µ̄ and r̄⁻¹(G_n⁰)=G_F. For each v∈S choose a lift ρ_v of r̄̆|G_{F_ṽ}. Define d as the largest dimension of an irreducible subrepresentation of r̄̆ restricted to the closed subgroup generated by the Sylow pro-l subgroups. Suppose r̄̆|G_{F(ζ_l)} is irreducible, l ≥ 2(d+1), and at v|l the chosen ρ_v is potentially diagonalizable with n distinct labeled Hodge–Tate numbers. Then there is a lift r : G_{F⁺} → G_n(O_{Q̄_l}), unramified outside S, with ν∘r=µ and r̆|G_{F_ṽ} ∼ ρ_v at every v∈S. Theorem 4.3.1 assumes no pre-existing residual automorphy.

The CM, odd-prime, rank, multiplier, component-preimage, residual restriction, dimension bound and chosen local lifts are the data in the statement. The group is G_n=(GL_n×GL_1)⋊{1,j} of BLGGT §1.1.

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_pd_lift`.

As in Theorem 4.2.1: the deformation ring with the components of the ρ_v has dimension ≥ 1; potential automorphy of r̄ (potential-ordinary-automorphy) and pd-automorphy-lifting over the extension make it finite over O; so it has Q̄_l-points.

Check that this strengthens ordinary-lifts-with-local-conditions: ordinary crystalline ρ_v are potentially diagonalizable.

([BLGGT](#ref-blggt-2014-v4), §4.3, Theorem 4.3.1, p. 55 (arXiv v4).)

*Needs:* PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); [Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)](#potential-ordinary-automorphy); PotentialAutomorphyInfrastructurePartII, Layer PL.1 (connects relation); PotentialAutomorphyInfrastructurePartII, Layer PL.1 (potentially diagonalizable); GlobalGaloisDeformations, Layer G7 (polarized representability); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-theorem"></a>
### 2.11 Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)

Let F/F₀ be finite Galois of imaginary CM fields, I finite, and for i ∈ I: n_i, d_i ≥ 1, l_i odd with l_i ≥ 2(d_i + 1) and ζ_{l_i} ∉ F, ı_i; (r_i, µ_i) a totally odd, regular algebraic, n_i-dimensional polarized l_i-adic representation of G_F with d_i the maximal dimension of an irreducible constituent of r̄_i restricted to the subgroup generated by the Sylow pro-l_i-subgroups; F^{(avoid)}/F finite Galois. Assume r_i is potentially diagonalizable at each prime of F above l_i and r̄_i|_{G_{F(ζ_{l_i})}} is irreducible. Then there are a finite CM F′/F, Galois over F₀ and linearly disjoint from F^{(avoid)} over F, and regular algebraic cuspidal polarized (π_i, χ_i) of GL_{n_i}(𝔸_{F′}), unramified above l_i, with (r_{l_i,ı_i}(π_i), r_{l_i,ı_i}(χ_i)ε_{l_i}^{1−n_i}) ≅ (r_i|_{G_{F′}}, µ_i|_{G_{(F′)⁺}}).

The potentially diagonalizable local conditions are imposed at every place of F above ℓ_i.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy`.

potential-ordinary-automorphy gives F′ (Galois over F₀, disjoint from ∩ ker r̄_i · F^{(avoid)}(ζ_{∏l_i})) and ı_i-ordinary (π′_i, χ′_i) with r̄_{l_i,ı_i}(π′_i) ≅ r̄_i|_{G_{F′}}, unramified above l_i. pd-automorphy-lifting over F′ (hypotheses preserved: potential diagonalizability restricts, and r̄_i|_{G_{F′(ζ_{l_i})}} stays irreducible by disjointness).

Check the Fontaine–Laffaille special case: l_i unramified in F⁺, r_i crystalline above l_i with HT in [a_τ, a_τ + l − 2] (potential-diagonalizability-criteria (2)). Check that the output is automorphy over F′ only: descent to F needs automorphy-twist-and-soluble-base-change and holds only for soluble F′/F.

([BLGGT](#ref-blggt-2014-v4), §4.5, Theorem 4.5.1 and proof, pp. 59–60 (arXiv v4).)

*Needs:* [Potential ordinary automorphy of polarized mod l representations (Proposition 3.3.1)](#potential-ordinary-automorphy); PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation); PotentialAutomorphyInfrastructurePartII, Layer PL.1 (potentially diagonalizable); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphic polarized representation); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-symplectic-potential-automorphy"></a>
### 2.12 Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)

Let F/F₀ be a finite Galois extension of totally real fields, 𝓘 finite, and for i ∈ 𝓘 let n_i be even, l_i odd primes, ı_i : Q̄_{l_i} ≅ ℂ, and r̄_i : G_F → GSp_{n_i}(F̄_{l_i}) with open kernel and multiplier ε̄_{l_i}^{1−n_i}, unramified above a finite set 𝓛 of primes unramified in F and ≠ l_i; let F^avoid/F be finite Galois. Then there are finite Galois F^suffices/F₀ and F₁^avoid/ℚ with F ⊂ F^suffices, F^suffices linearly disjoint from F^avoid F₁^avoid over F, F₁^avoid and F^avoid linearly disjoint over ℚ, F^suffices unramified above 𝓛, such that for every finite totally real F′/F^suffices linearly disjoint from F₁^avoid each r̄_i|_{G_{F′}} is ordinarily automorphic of weight 0 and level prime to 𝓛. It strengthens BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII PL.5) by the extra disjointness F₁^avoid.

As in the statement.

State the resulting comparison as `TauCeti.PotentialAutomorphy.acc_symplectic`.

The Dwork family and the scheme T̃ of BLGGT §3 with Moret-Bailly ([Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control)), as in PL.5/dwork-potential-ordinary-automorphy, keeping track of F₁^avoid = the field cut out by the auxiliary residual representations.

The input to [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed) and [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers).

([ACC+](#ref-acc-2023), §7.2.1, Proposition 7.2.3 and its parenthetical proof, arXiv v2 pp. 204–205 (Annals pp. 1099–1100).)

*Needs:* PotentialAutomorphyInfrastructurePartII, Layer PL.5 (dwork potential ordinary automorphy); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-with-steinberg-place"></a>
### 2.13 Residual potential automorphy with a Steinberg place (Fakhruddin–Khare–Patrikis, proof of Proposition 9.1)

Let F be totally real, p ≫_n 0, ρ̄ : Γ_F → GSp_{2n}(k) with similitude κ̄^{1−2n} and ρ̄|_{Γ_{F(ζ_p)}} absolutely GSp_{2n}-irreducible (ρ̄ may be GL_{2n}-reducible), and v₀ a place with ρ̄|_{Γ_{F_{v₀}}} = 1 and N(v₀) ≡ 1 mod p. Then there are a Galois totally real F′/F linearly disjoint from F(ρ̄, ζ_p) and a regular algebraic self-dual cuspidal Π_{F′} of GL_{2n}(𝔸_{F′}) with r̄_ι(Π_{F′}) ≅ ρ̄|_{Γ_{F′}} and Π_{F′,w} an unramified twist of Steinberg for every w | v₀: run BLGGT Theorem 3.1.2 with the additional Moret-Bailly condition v(t(P)) < 0 at the places above v₀.

Retain the hypotheses of FKP Proposition 9.1: [F(ζ_p):F]>a_{GSp_{2n}} of FKP19 Lemma A.6, ρ̄ is not induced from a proper subgroup as a GL_{2n}-representation, and at every v|p there is an ordinary GSp_{2n}-lift with similitude κ^{1−2n}. Every GL_{2n} constituent of ρ̄ is self-dual with this multiplier and remains irreducible on Γ_{F(ζ_p)}. The Steinberg local component is π_w for each w|v₀.

State the resulting comparison as `TauCeti.PotentialAutomorphy.withSteinbergPlace`.

BLGGT Theorem 3.1.2 (PotentialAutomorphyInfrastructurePartII PL.5/dwork-potential-ordinary-automorphy) with the Moret-Bailly step [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control) including the local condition at v₀. v(t) < 0 forces maximal unipotent monodromy of the Dwork fibre at w | v₀, hence a Steinberg local component.

Used in FKP Proposition 9.1 to produce geometric lifts with Zariski-dense image.

([Lifting and automorphy of reducible mod p Galois representations over global fields](#ref-fkp-2022), §9, Proposition 9.1 and proof, arXiv v5 pp. 41–43 (the residual automorphy argument on p. 42).)

*Needs:* PotentialAutomorphyInfrastructurePartII, Layer PL.5 (dwork potential ordinary automorphy); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="cg18-odd-symmetric-powers"></a>
### 2.14 Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)

Assume Conjecture B. Let A/K be an elliptic curve over a number field with End_ℂ(A) = ℤ and r = Sym^{2n−1}ρ_{A,p}. (Special case) If there is a prime p, totally split in K, with p + 1 divisible by an integer N₂ > 2n + 1 prime to the conductor of A, ρ̄_{A,p} surjective, A with good reduction at all v | p and ρ̄_A|_{G_{ℚ_p}} ≅ Ind ω₂, then r is potentially modular: the Dwork family point (BLGHT II Proposition 6.2) links r̄ to an induced representation, and two applications of CG's Theorem 5.16 give modularity. (General case) An auxiliary elliptic curve A′ with A′[q] ≅ A[q] (a point of the twisted modular curve X_A(q), [The twisted modular curve X_E(q)](#twisted-modular-curve)) satisfying the special-case hypothesis reduces the general case to it.

Assume Conjecture B. In the auxiliary construction require N₂>2n+1 and use the local and coefficient conditions of BLGHT II Proposition 6.2.

State the resulting comparison as `TauCeti.PotentialAutomorphy.cg18_oddSymPowers`.

Special case: Dwork family (owner: the Part II extension PotentialAutomorphyDworkMotivesPartII; requiring the exact supplier contract) and Moret-Bailly; CG Theorem 5.16 twice. General case: Moret-Bailly on X_A(q) for the auxiliary curve; then the special case.

Odd symmetric powers are the input to the tensor-product trick for Theorem 1.1.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §10, proof of Theorem 1.1, 'extra hypothesis' bullet, p. 97 (arXiv v2) = Invent. p. 428 [sub-item sec10-special-case]; [Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), §10, general case, pp. 97–98 (arXiv v2) = Invent. p. 429 [sub-items sec10-general-case, sec10-auxiliary-curve-lemma].)

*Needs:* [The twisted modular curve X_E(q)](#twisted-modular-curve); [Moret–Bailly with prescribed local Galois extensions (Proposition 3.1.1)](#moret-bailly-galois-control); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="change-of-weight-and-level"></a>
### 2.15 Change of weight and level (Theorem 4.4.1)

Let F be imaginary CM, l > 2(n + 1) with ζ_l ∉ F and primes above l split over F⁺, S a finite split set of finite places of F⁺ containing those above l, µ algebraic, and r̄ : G_F → GL_n(F̄_l) with (r̄, µ̄) polarized, unramified outside S, ordinarily or potentially diagonalizably automorphic, and r̄|_{G_{F(ζ_l)}} irreducible. For v ∈ S let ρ_v be a lift of r̄|_{G_{F_ṽ}}, potentially diagonalizable with n distinct τ-Hodge–Tate numbers when v | l. Then there is a regular algebraic cuspidal polarized (π, χ) with r̄_{l,ı}(π) ≅ r̄, r_{l,ı}(χ)ε_l^{1−n} = µ, level potentially prime to l, unramified outside S, and ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}} for v ∈ S.

Every ρ_v is a lift of r̄|_{G_{F_ṽ}} with the indicated coefficient lattice.

State the resulting comparison as `TauCeti.PotentialAutomorphy.change_of_weight_and_level`.

pd-lifts-with-local-conditions gives a lift r with the local conditions ρ_v; pd-automorphy-lifting makes it automorphic; local–global compatibility (blggt-normalization-register (3)) gives ρ_v ∼ r_{l,ı}(π)|_{G_{F_ṽ}}.

Check the Serre-weight reading: r̄ is automorphic in every potentially diagonalizable weight and type it admits locally.

([BLGGT](#ref-blggt-2014-v4), §4.4, Theorem 4.4.1, pp. 58–59 (arXiv v4).)

*Needs:* [Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)](#pd-lifts-with-local-conditions); PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); [Polarization and the automorphic realization](#blggt-normalization-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-totally-real"></a>
### 2.16 Potential automorphy over totally real fields (Corollary 4.5.2)

Let F⁺ be totally real, l ≥ 2(n + 1), and (r, µ) a totally odd, regular algebraic, n-dimensional polarized l-adic representation of G_{F⁺}, potentially diagonalizable at each prime above l, with r̄|_{G_{F⁺(ζ_l)}} irreducible. Then there is a Galois totally real F^{+,′}/F⁺ such that (r|_{G_{F^{+,′}}}, µ|_{G_{F^{+,′}}}) is automorphic of level prime to l.

F⁺ totally real.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_totallyReal`.

Choose an imaginary quadratic F/F⁺ in which primes above l split, disjoint from (F̄⁺)^{ker ad r̄}(ζ_l); apply potential-automorphy-theorem to r|_{G_F}; descend from the CM field F′ to (F′)⁺ by automorphy-twist-and-soluble-base-change.

Check against KW/Taylor over ℚ: for n = 2 this recovers potential modularity of odd regular 2-dimensional representations with PD local conditions.

([BLGGT](#ref-blggt-2014-v4), §4.5, Corollary 4.5.2, p. 60 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphy under twist); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-automorphy-mod-l"></a>
### 2.17 Potential automorphy of mod l representations with prescribed local lifts (Corollary 4.5.3)

In the situation of Theorem 4.5.1 but with r̄_i : G_F → GL_{n_i}(F̄_{l_i}) irreducible, (r̄_i, µ_i) polarized (µ_i totally odd de Rham), r̄_i|_{G_{F(ζ_{l_i})}} irreducible, S a Gal(F/F⁺)-stable finite set of primes containing those above l_i and the ramification, and lifts ρ_{i,v} (v ∈ S) with ρ^c_{i,cv} ≅ µ_iρ^∨_{i,v}, potentially diagonalizable with n_i distinct Hodge–Tate numbers when v | l_i: there are F′ (as in 4.5.1) and (π_i, χ_i) with r̄_{l_i,ı_i}(π_i) ≅ r̄_i|_{G_{F′}}, r_{l_i,ı_i}(χ_i)ε^{1−n_i} = µ_i|_{G_{F′⁺}}, level potentially prime to l_i, unramified outside S, and r_{l_i,ı_i}(π_i)|_{G_{F′_u}} ∼ ρ_{i,v}|_{G_{F′_u}} for u | v ∈ S.

The local lift for index i and place v is ρ_{i,v} of dimension n_i; at a place u of F′ above v compare its restriction to G_{F′_u}.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_residual`.

Reduce to S split over F⁺ as in potential-ordinary-automorphy; pd-lifts-with-local-conditions gives lifts r_i with r_i|_{G_{F_v}} ∼ ρ_{i,v}; apply potential-automorphy-theorem.

Check that it strengthens Proposition 3.3.1: the local conditions may be any potentially diagonalizable types, not only ordinary.

([BLGGT](#ref-blggt-2014-v4), §4.5, Corollary 4.5.3, pp. 60–61 (arXiv v4).)

*Needs:* [Lifts with potentially diagonalizable local conditions (Theorem 4.3.1)](#pd-lifts-with-local-conditions); [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="compatible-systems-potentially-automorphic"></a>
### 2.18 Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)

Let F/F₀ be finite Galois of CM (resp. totally real) fields and F^{(avoid)}/F finite Galois. If (ℛ_i, ℳ_i), i = 1, …, r, are totally odd, polarized weakly compatible systems of l-adic representations of G_F with each ℛ_i regular and irreducible, then there is a finite CM (resp. totally real) F′/F, linearly disjoint from F^{(avoid)} and Galois over F₀, such that each (ℛ_i|_{G_{F′}}, ℳ_i|_{G_{(F′)⁺}}) is automorphic. In particular (Corollary 5.4.2) a single such system becomes automorphic over a finite Galois CM (resp. totally real) F′/F.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.potential_automorphy_compatibleSystem`.

Totally real case from the CM case by automorphy-twist-and-soluble-base-change, choosing F′ disjoint from the fields F_i¹ of Lemma 5.3.1 (rank-two-reducibility-independent-of-lambda) so that ℛ_i stays irreducible (Lemma A.2.1). Take M common; L = ∩_i(L_{i,1} ∩ L_{i,2}) of density 1, with L_{i,1} from residual-irreducibility-density-one and L_{i,2} the primes where ℛ_i is irreducible (Lemma A.1.7). Remove finitely many l: l ≥ 2(dim ℛ_i + 1), l unramified in F and not below the bad primes, Hodge–Tate numbers in some [a, a + l − 2]. potential-diagonalizability-criteria (2) makes r_{i,λ} potentially diagonalizable; apply potential-automorphy-theorem to the r_{i,λ} for one λ | l ∈ L.

Check the density-one bookkeeping: the intersection of finitely many density-one sets has density one. Check the Fontaine–Laffaille step: for l large the Hodge–Tate range (fixed by the system) has length < l − 2.

([BLGGT](#ref-blggt-2014-v4), §5.4, Theorem 5.4.1, Corollary 5.4.2 and proof, p. 74 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); PotentialAutomorphyInfrastructurePartII, Layer PL.1 (pd criteria); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphy under twist); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda); PotentialModularityAndCompatibleSystems, Layer R24.5 (weakly compatible system rank n); PotentialModularityAndCompatibleSystems, Layer R24.5 (compatible system predicates); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="constituents-potentially-automorphic"></a>
### 2.19 Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)

Let F be CM and (ℛ, ℳ) a totally odd, polarized weakly compatible system with ℛ pure and extremely regular; write r_λ = r_{λ,1} ⊕ ⋯ ⊕ r_{λ,j_λ} into irreducibles. There is a set L of rational primes of Dirichlet density 1 such that for λ | l ∈ L there is a finite CM Galois F′/F with each (r_{λ,α}|_{G_{F′}}, µ_λ|_{G_{(F′)⁺}}) irreducible and automorphic.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.constituents_potentially_automorphic`.

Lemma 5.4.5 (PM R24.5/constituents-essentially-self-dual, v1 Lemma 5.2.3): each (r_{λ,α}, µ_λ) is totally odd polarized. L from residual-irreducibility-density-one, minus finitely many l (l ≥ 2(dim ℛ + 1), unramified, Fontaine–Laffaille range); potential-diagonalizability-criteria (2); potential-automorphy-theorem with F^{(avoid)} the compositum of the F̄^{ker r̄_{λ,α}}.

Check that irreducibility over F′ comes from the choice of F^{(avoid)}: r̄_{λ,α}|_{G_{F′}} stays irreducible, hence so does r_{λ,α}|_{G_{F′}}.

([BLGGT](#ref-blggt-2014-v4), §5.4, Lemma 5.4.5 and Proposition 5.4.6, pp. 76–77 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); PotentialAutomorphyInfrastructurePartII, Layer PL.1 (pd criteria); PotentialModularityAndCompatibleSystems, Layer R24.5 (constituents essentially self dual); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="cg18-conditional-potential-modularity"></a>
### 2.20 Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))

Assume Calegari–Geraghty's Conjecture B (the existence of Galois representations with the expected characteristic polynomials for the torsion Hecke algebras T^an_{Q,ψ} of the locally symmetric spaces of Res_{F/ℚ}PGL(n)). Let F be any number field and E/F an elliptic curve. Then E is potentially modular. Assume Conjecture B is imported from the PotentialAutomorphyInfrastructure Part II and is not proved anywhere here.

Hypothesis: Conjecture B (status conjectural). F arbitrary; E arbitrary.

State the resulting comparison as `TauCeti.PotentialAutomorphy.cg18_potentialModularity`.

Odd symmetric powers Sym^{2n−1} of E are potentially modular ([Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers)), using CG's minimal modularity lifting beyond Taylor–Wiles (their Theorem 5.16, which assumes Conjecture B). Harris–Shepherd-Barron–Taylor's reduction from odd symmetric powers to E itself (tensor product trick).

The acceptance criterion of Layer 1: this is the only statement about elliptic curves over arbitrary number fields, and it is conditional.

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429; [Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(1), §1, p. 3 (arXiv v2) = Invent. p. 300; proof §10, pp. 96–98 (arXiv v2) = Invent. pp. 428–429.)

*Needs:* [Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers); [Assertions with explicit hypotheses](#endpoint-status-register); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="potential-weak-automorphy-symmetric-powers"></a>
### 2.21 Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 2) and det r_λ = ε^{−m}. Let v₀ ∉ S. Then for each n ≥ 1 there is a CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is weakly automorphic of level prime to the places above v₀. The proof uses a semistable elliptic curve A/ℚ, good ordinary at an auxiliary prime q > 2nm + 1 with surjective mod q image, and the automorphy of Sym^{nm−1} of A over a CM field F₆ (ACC+).

State the resulting comparison as `TauCeti.PotentialAutomorphy.weakAutomorphy_symPower`.

[The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)](#p-r-switch) with the CM-induced system S_CM and the elliptic-curve seed (ACC+ Theorem 7.1.11 / [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers) for the symmetric powers of A). Moret-Bailly to find the auxiliary data over F_n.

Feeds BCGNT Theorem 6.2.1 and the purity Lemma 6.1.3.

([BCGNT](#ref-bcgnt-2025), Theorem 6.2.4 and proof (incl. the elliptic curve A/ℚ and the automorphy of Sym^{nm−1}ρ_{A,q}|G_{F₆}), §6.2, arXiv v3 pp. 64–68 (published pp. 57–61; arXiv pagination differs).)

*Needs:* [The p–r switch for symmetric powers over CM fields (BCGNT Proposition 6.2.3)](#p-r-switch); [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); PotentialModularityAndCompatibleSystems, Layer R23.1; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="acc-elliptic-symmetric-powers"></a>
### 2.22 Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)

Let 𝓜 be a finite set of positive integers, E/ℚ a non-CM elliptic curve, 𝓛 a finite set of primes of good reduction and F^avoid/ℚ finite. There are a finite Galois F₂^avoid/ℚ linearly disjoint from F^avoid and a finite totally real Galois F^suffices/ℚ unramified above 𝓛 and linearly disjoint from F^avoid F₂^avoid, such that for every finite totally real F′/F^suffices linearly disjoint from F₂^avoid and every m ∈ 𝓜 there is a regular algebraic cuspidal polarizable π of GL_{m+1}(𝔸_{F′}) of weight 0 with Sym^m H_{E,ℓ}|_{G_{F′}} ≅ r_{l,ı}(π) (unramified above 𝓛; the same compatible-system realization holds for every l and ι, without asserting ordinarity at all residual characteristics).

Here V_{E,ℓ}=T_ℓ(E)⊗ℚ_ℓ and H_{E,ℓ}=V_{E,ℓ}∨=H¹_et(E_{ℚ̄},ℚ_ℓ), with HT(H_{E,ℓ})={0,1} and determinant ε_ℓ⁻¹.

State the resulting comparison as `TauCeti.SymmetricPower.acc_ellipticSymPowers`.

[Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy) applied to Sym^m of E[l] twisted by an induced character ψ_m of a CM field to make the residual representation symplectic, then PotentialAutomorphyInfrastructurePartII PL.5 lifting.

The seed of Qian's argument ([An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed)) and of ACC+ Theorem 7.1.11.

([ACC+](#ref-acc-2023), §7.2.1, Corollary 7.2.4, arXiv v2 pp. 205–206 (Annals pp. 1100–1101); proof pp. 206–208 (Annals pp. 1101–1103).)

*Needs:* [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); PotentialAutomorphyInfrastructurePartII, Layer PL.5; [C-SYSTEM](#contract-c-system).

<a id="compatible-system-l-function-continuation"></a>
### 2.23 Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)

Under the hypotheses of Corollary 5.4.2: (1) for ı : M ↪ ℂ, L^S(ıℛ, s) converges uniformly absolutely on compact subsets of a right half plane and continues meromorphically to ℂ; (2) ℛ is strictly pure and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s); (3) if F is totally real, n is odd and v | ∞, then tr r_λ(c_v) = ±1 is independent of λ.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.lFunction_meromorphic`.

Strict purity: Theorem 5.4.1, Theorem 2.1.1 (purity of WD at v ∤ l for automorphic members) and Brauer's theorem as in the proof of part-of-compatible-system (the Grothendieck-ring argument of PM R24.5/galois-grothendieck-ring). Continuation and functional equation: over each soluble F′/F_i in a Brauer decomposition 1 = Σ n_i Ind ψ_i the system is automorphic, so L^S(ıℛ, s) = ∏ L^S(π_i ⊗ ψ_i, s)^{n_i} (HSBT10 Theorem 4.2 argument), each factor meromorphic with the standard functional equation; nontrivial rank≥2 cuspidal standard factors are entire, while the rank-one trivial factor has a pole (AL.2). (3): reduce to the automorphic case, Taylor 2012 (the Calegari observation); cited.

Check that the Γ- and ε-factors are those of PM R24.5/system-l-functions, so (2) is the functional equation that node could not claim. Check the example of an elliptic curve over a totally real field: L(E, s) continues and satisfies its functional equation (the system is regular, irreducible, polarized).

([BLGGT](#ref-blggt-2014-v4), §5.4, Corollary 5.4.3 and proof, pp. 74–75 (arXiv v4).)

*Needs:* [Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)](#compatible-systems-potentially-automorphic); PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions); PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicLFunctionsAndLocalFactors, Layer AL.2; `Matrix.trace`; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="part-of-compatible-system"></a>
### 2.24 A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)

Let F be CM, l ≥ 2(n + 1) with ζ_l ∉ F, and (r, µ) an n-dimensional totally odd regular algebraic polarized l-adic representation of G_F, potentially diagonalizable above l with r̄|_{G_{F(ζ_l)}} irreducible. Then r is part of a strictly pure compatible system of l-adic representations of G_F.

F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

State the resulting comparison as `TauCeti.PotentialAutomorphy.exists_compatibleSystem`.

potential-automorphy-theorem gives F′/F Galois CM, disjoint from F⁰F̄^{ker r̄} (F⁰ cut out by the component group of the Zariski closure of r), and (π, χ) over F′ with r_{l,ı}(π) = r|_{G_{F′}}; soluble descent gives π(F″) for F′/F″ soluble. For each (l′, ı′), decompose r_{l′,ı′}(π) into irreducibles; the component groups are independent of l′ (Lemma 5.3.1), so the pieces descend to each F″. Brauer: 1 = Σ n_i Ind_{F′_i}ψ_i with F′/F′_i soluble; set A_{l′,ı′,α} = Σ n_i ind_{F′_i/F}([r_{l′,ı′}(π(F′_i))_α][ı′^{−1}ψ_i]) in Rep_{F,l′}; dim A = dim r_{l′,ı′}(π)_α and (A, A) = 1, so A = [r_{l′,ı′,α}] is a genuine irreducible representation (PM R24.5/galois-grothendieck-ring). r_{l′,ı′} = ⊕_α r_{l′,ı′,α} has r_{l,ı} ≅ r; its Weil–Deligne representations are pure (Theorem 2.1.1, Lemma 1.3.6) and have l′-independent traces, so the system is strictly pure and compatible.

Check the Grothendieck-ring step: (A, A) = 1 with dim A ≥ 0 is exactly the criterion in PM R24.5/galois-grothendieck-ring (4).

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.1 and proof, pp. 79–81 (arXiv v4).)

*Needs:* [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [Potential automorphy over totally real fields (Corollary 4.5.2)](#potential-automorphy-totally-real); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphy under twist); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="irreducibility-density-one"></a>
### 2.25 Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)

Let F be CM and π a regular algebraic, polarizable, cuspidal automorphic representation of GL_n(𝔸_F) of extremely regular weight. Then there is a set L of rational primes of Dirichlet density 1 such that r_{l,ı}(π) is irreducible for every l ∈ L and ı : Q̄_l ≅ ℂ.

F is a CM or totally real field with maximal totally real subfield F⁺; l is a prime and ı : Q̄_l ≅ ℂ; for an imaginary CM F, c ∈ Gal(F/F⁺) is complex conjugation and G_n = (GL_n × GL_1) ⋊ {1, j} is the group of BLGGT §1.1 (CHT08).

State the resulting comparison as `TauCeti.PotentialAutomorphy.irreducible_density_one`.

Apply constituents-potentially-automorphic to ℛ = {r_{l,ı}(π)}; for l ∈ L write r_{l,ı}(π) = ⊕_{α=1}^j r_{l,ı}(π)_α, each potentially automorphic. ord_{s=1}L^S(ı(ℛ ⊗ ℛ^∨), s) = ord_{s=1}L^S(π × π^∨, s) = −1 (Jacquet–Shalika, Shahidi; requested from AL.3). On the other hand, using the potential automorphy of the constituents and Brauer induction, the order is −j; hence j = 1.

For unitary cuspidal π,π′, the Rankin–Selberg function L^S(π×π′^∨,s) has a simple pole at s=1 exactly when π≅π′, and is holomorphic and nonzero there otherwise. A nontrivial unitary twist can move the pole; being a twist alone is not the criterion at the fixed point s=1.

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.2 and proof, pp. 81–82 (arXiv v4).)

*Needs:* [Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)](#constituents-potentially-automorphic); AutomorphicLFunctionsAndLocalFactors, Layer AL.3; PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="elliptic-symmetric-power-seed"></a>
### 2.26 An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)

In the situation of [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime) there are a finite Galois F_2^avoid/ℚ and a finite totally real Galois F^suff/ℚ unramified above the prime divisors of N, with F_2^avoid ∩ F^avoid = ℚ, F^suff ∩ F^avoid F_2^avoid = ℚ, ℚ̄^{ker r̄_{E,l′}} ⊂ F_2^avoid, F^avoid and F_2^avoid unramified above N, such that for every finite totally real F′/F^suff with F′ ∩ F_2^avoid = ℚ, Sym^{n−1} H_{E,ℓ′}|_{G_{F′}} is automorphic.

E/ℚ non-CM; l′ as in [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime).

State the resulting comparison as `TauCeti.PotentialAutomorphy.ellipticSeed`.

ACC+ Corollary 7.2.4 (potential automorphy of the symmetric powers of a non-CM elliptic curve over totally real fields with prescribed disjointness, [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers) states it over totally real F′) gives the seed. Qian's proof checks the extra ramification and disjointness conditions.

Used once, in the proof of [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy).

([Potential automorphy for GL_n](#ref-qian-2023), Proposition 4.1 (second list and final assertion), §4, p. 21; proof p. 22 (arXiv v1); Invent. pp. 1269–1270 per routed locator.)

*Needs:* [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime); [Potential ordinary automorphy of symplectic residual representations with prescribed disjointness (ACC+ Proposition 7.2.3)](#acc-symplectic-potential-automorphy); [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="multiple-product-l-functions"></a>
### 2.27 Tensor products of non-CM modular forms (Corollary 5.4.4)

Let K ⊆ ℤ_{>0} be finite with the 2^{#K} partial sums of its elements distinct, and f_k (k ∈ K) non-CM newforms of weight k + 1 with automorphic π_k. Then there are a totally real Galois F/ℚ and a regular algebraic polarizable cuspidal Π on GL_{2^{#K}}(𝔸_F) with rec(Π_v|det|^{(1−2^{#K})/2}) = (⊗_k rec(π_{k,v|ℚ}|det|^{−1/2}))|_{W_{F_v}} for almost all v; in particular L(×_k π_k, s) continues meromorphically to ℂ.

f_k non-CM; the partial-sum condition gives regularity of ⊗_k r_{k,λ}.

State the resulting comparison as `TauCeti.PotentialAutomorphy.multipleProduct_meromorphic`.

Apply compatible-systems-potentially-automorphic to ⊗_K r_{k,λ}. Irreducibility (Goursat): the Zariski closure H̄ of (∏ r_{k,λ})(G_ℚ) in PGL_2^K surjects onto each factor; as PGL_2 is simple with only inner automorphisms, H̄ = PGL_2^I with K = ⊔ K_i mapping diagonally; #K_i > 1 would give r_{k,λ} ≅ r_{k′,λ} ⊗ χ with χ de Rham, contradicting Hodge–Tate numbers; so H ⊇ SL_2^K, whose tensor representation is irreducible.

Check the partial-sum condition on K = {1, 2, 4}: the 8 subset sums 0, …, 7 are distinct; on K = {1, 2, 3} they are not (1 + 2 = 3).

([BLGGT](#ref-blggt-2014-v4), §5.4, Corollary 5.4.4 and proof, pp. 75–76 (arXiv v4).)

*Needs:* [Potential automorphy of compatible systems (Theorem 5.4.1, Corollary 5.4.2)](#compatible-systems-potentially-automorphic); [Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation); PotentialModularityAndCompatibleSystems, Layer R24.5 (linear algebra operations on systems); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="decomposition-into-irreducible-systems"></a>
### 2.28 Splitting a polarized system into irreducible systems (Theorem 5.5.3)

Let F be CM and ℛ a pure, extremely regular, totally odd, polarizable weakly compatible system of G_F. Then ℛ = ℛ_1 ⊕ ⋯ ⊕ ℛ_s with each ℛ_i an irreducible, strictly pure, totally odd, polarizable compatible system.

(ℛ, ℳ) a polarized weakly compatible system of G_F over M (PotentialModularityAndCompatibleSystems R24.5: members (r_λ, µ_λ) polarized); BLGGT v4 §5.1 conventions.

State the resulting comparison as `TauCeti.PotentialAutomorphy.eq_sum_irreducible_systems`.

Choose L of density 1 for residual-irreducibility-density-one and constituents-potentially-automorphic; pick λ | l ∈ L with l ≥ 2(n + 1), unramified, Fontaine–Laffaille Hodge–Tate range; decompose r_λ = ⊕ r_{λ,α}. part-of-compatible-system puts each r_{λ,α} in a strictly pure compatible system ℛ_α; over F′ it is the system of an extremely regular π_α, so irreducibility-density-one makes ℛ_α irreducible on a density-one set. Compare Frobenius polynomials: ⊕ℛ_α and ℛ agree at r_λ, hence everywhere.

Check the degenerate case s = 1: an irreducible system is its own decomposition, with the added conclusion of strict purity.

([BLGGT](#ref-blggt-2014-v4), §5.5, Theorem 5.5.3 and proof, p. 82 (arXiv v4).)

*Needs:* [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system); [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); [Constituents of polarized systems are potentially automorphic (Proposition 5.4.6)](#constituents-potentially-automorphic); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="dwork-fibre-automorphy-transport"></a>
### 2.29 Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)

Let t∈F′ be the chosen Dwork point, with its fixed eigenprojector and realizations V_{λ,t}, V_{λ′,t}. The auxiliary-prime ordinary lifting theorem gives V_{λ′,t}≅r_{l′,ι′}(π) for a regular algebraic cuspidal π, after the Teichmüller character twist. At good places the eigenprojector gives a common Frobenius polynomial over ℚ(ζ_N), or its real subfield when n=2. Choose ι and ι′ to induce the same embedding of that coefficient field into ℂ, conjugating π if necessary. Then V_{λ,t}^{ss}≅r_{l,ι}(π). For the arbitrary semisimple residual input of Theorem 1.1, neither semisimplicity of V_{λ,t} nor ramified monodromy compatibility follows from this comparison. If its residual representation χ̄₁⊗r̄|G_{F′} is absolutely irreducible, as in Theorem 1.4, then V_{λ,t} is irreducible and the semisimplification may be removed.

The Dwork point and auxiliary-prime lifting hypotheses of Qian §4; matched coefficient embeddings; the character twist is the actual Teichmüller lift used by the ordinary lifting output.

State the resulting comparison as `TauCeti.PotentialAutomorphy.dworkTransport`.

Apply ACC+ Theorem 6.1.2 at l′ with ordinary regular weights, enormous image, decomposed genericity and the scalar element. Retain the resulting cuspidal representation and the actual character twist. Obtain coefficient-independent good-place eigenprojector traces by the Lefschetz trace formula applied to symmetry elements composed with Frobenius. Match the coefficient embeddings. Use Chebotarev and Brauer–Nesbitt to identify the global semisimplification with the same automorphic member. A graded stable lattice reduces to the original semisimple residual module. The auxiliary-prime Steinberg argument proves ι-ordinarity of π; potential semistability and Galois ordinarity of V_{λ,t}^{ss} use the separate geometric calculation at v(t)<0 and subquotient stability requested from PL.5. Absolutely irreducible residual input forces the original fibre to be irreducible.

The transport between coefficient primes is the step where the compatible system of the Dwork motive is used.

([Potential automorphy for GL_n](#ref-qian-2023), §4, proof of Theorem 1.1, p. 24 (arXiv v1); Invent. pp. 1272–1273 per routed locator; [ACC+](#ref-acc-2023), §6.1, Theorem 6.1.2, hypothesis (5), arXiv v2 p. 134 (Annals p. 1031); the theorem begins on arXiv p. 133; [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); geometric explanation in §1, p. 4; [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed); PotentialAutomorphyInfrastructurePartII, Layer PL.5; TauCetiRoadmap.Chebotarev, Layer 10; PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system).

<a id="compatible-system-from-potential-automorphy"></a>
### 2.30 A potentially automorphic geometric GSp_{2n}-lift lies in a strictly pure compatible system (FKP, after BLGGT 5.5.1)

Let F be totally real, n ≥ 1, and ρ : Γ_F → GSp_{2n}(O′) geometric with Zariski-dense image and cyclotomic similitude κ^{1−2n}. Retain the auxiliary Steinberg place v₀ of FKP Proposition 9.1: WD(ρ|_{Γ_{F_{v₀}}}) has a regular nilpotent monodromy operator (an unramified twist of the rank-2n Steinberg parameter). Suppose that ρ|_{Γ_{F′}} ≅ r_ι(Π_{F′}) for a RAESDC Π_{F′} of GL_{2n}(𝔸_{F′}), F′/F Galois totally real. Then ρ belongs to a strictly pure compatible system {ρ_{ι′}} of ℓ-adic representations of Γ_F indexed by primes ℓ and ι′ : ℂ ≅ Q̄_ℓ. For the Zariski-density conclusion at every coefficient prime, require that each member has regular nilpotent monodromy at a finite place away from that coefficient prime, as well as the compatible symplectic pairing and ℓ-independent formal character.

State the resulting comparison as `TauCeti.PotentialAutomorphy.compatibleSystem_of_potentiallyAutomorphic`.

The argument of BLGGT Theorem 5.5.1 ([A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system)): Brauer's induction over the soluble subextensions of F′/F, with soluble descent (PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent). For each coefficient prime different from the residue characteristic of v₀, strict local compatibility retains the regular nilpotent operator; at the coefficient prime equal to that residue characteristic require the corresponding local comparison or a second auxiliary Steinberg place. **Comparison boundary.** The all-primes regular-unipotent comparison is a required extra input; one Steinberg place and weak compatibility alone do not establish it at its own residue characteristic. FKP's argument uses the regular unipotent and the symplectic pairing to reduce the Zariski closure to a principal GL₂ or GSp_{2n}; independence of formal character excludes the principal GL₂ alternative when n>1. At n=1, GSp₂ is already GL₂. Independence of formal character alone is not the regular-unipotent input.

The GSp-valued refinement of [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system).

([Lifting and automorphy of reducible mod p Galois representations over global fields](#ref-fkp-2022), §9, proof of Proposition 9.1, arXiv v5 pp. 42–43.)

*Needs:* [A potentially diagonalizable polarized representation lies in a compatible system (Theorem 5.5.1)](#part-of-compatible-system); PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); [C-GALOIS](#contract-c-galois); [C-SYSTEM](#contract-c-system); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

<a id="patrikis-taylor-l-function-consequences"></a>
### 2.31 Purity, functional equation and strict compatibility from potential automorphy (Patrikis–Taylor, Corollary 2.2)

Let R = {r_ℓ} be a weakly compatible system of G_ℚ that is pure of weight w, regular and odd essentially self-dual. Then for distinct primes p, ℓ the Weil–Deligne representation WD_p(R) attached to r_ℓ is pure of weight w (Frobenius eigenvalues on gr_a of the monodromy filtration are p-Weil numbers of weight w + a), R is strictly compatible, and the completed L-function Λ(R, s) = L_∞(R, s) ∏_{p ∈ S} L(WD_p(R), s) L^S(R, s) has meromorphic continuation and satisfies Λ(R, s) = ε(R, s) Λ(R^∨, 1 − s).

As in [Potential automorphy of pure regular odd essentially self-dual weakly compatible systems (Patrikis–Taylor, Theorem A)](#patrikis-taylor-potential-automorphy).

State the resulting comparison as `TauCeti.PotentialAutomorphy.patrikisTaylor_lFunction`.

Potential automorphy over F′ (previous node), Brauer's induction theorem over the soluble subfields of F′/ℚ and Godement–Jacquet for each piece ([Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation)), with local–global compatibility (Caraiani) for purity of WD_p.

Fresán–Sabbah–Yu Remark 5.41: strict compatibility gives semistability of the Kloosterman representations at p.

([Hodge theory of Kloosterman connections](#ref-fsy-2022), §5.3.2, Corollary 5.39 ([44, Cor. 2.2 (ii)]), arXiv v5 p. 57; [Hodge theory of Kloosterman connections](#ref-fsy-2022), Remark 5.41, arXiv v5 p. 59; [Automorphy and irreducibility of some l-adic representations](#ref-patrikis-taylor-2015), Corollary 2.2, §2, p. 13.)

*Needs:* [Potential automorphy of pure regular odd essentially self-dual weakly compatible systems (Patrikis–Taylor, Theorem A)](#patrikis-taylor-potential-automorphy); [Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation); [Compatible-system Euler and gamma factors](#compatible-system-archimedean-factors); [C-SYSTEM](#contract-c-system).

<a id="qian-residual-potential-automorphy"></a>
### 2.32 Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)

Let F be a CM number field, F^av/F a finite extension, n ≥ 2, l a prime and r̄ : G_F → GL_n(F_{l^s}) a continuous semisimple representation. Then there is a finite CM Galois extension F′/F, linearly disjoint from F^av over F, such that r̄|_{G_{F′}} is ordinarily automorphic: it has a lift r ≅ r_{l,ι}(π) with π regular algebraic cuspidal on GL_n(𝔸_{F′}) and r|_{G_{F′_v}} potentially semistable and ordinary with regular Hodge–Tate weights for all v | l. No polarization, oddness or residual image hypothesis is imposed.

F CM; r̄ semisimple, of any dimension n ≥ 2 and any residual characteristic l.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_residual`.

Choose the auxiliary data E, N, F^avoid and an ordinary auxiliary prime l′ ([Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime)). Automorphy of Sym^{n−1} of the elliptic curve at l′ over a totally real F^suff ([An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed)). Moret-Bailly gives a point t of the Dwork family over F′ with the l-adic fibre lifting r̄ ⊗ (twist) and the l′-adic fibre congruent to Sym^{n−1} of E (PotentialAutomorphyInfrastructurePartII PL.5; PotentialModularityAndCompatibleSystems R23.1). Apply ACC+ Theorem 6.1.2 at l′ and compare common good-place Frobenius polynomials with matched coefficient embeddings to obtain V_{λ,t}^{ss}≅r_{l,ι}(π). At the l-adic places v(t)<0, Qian Lemma 3.10(4) and the semistable maximal-monodromy calculation of thesis Remark 3.0.13 give potential semistability and an ordinary regular filtration of V_{λ,t} geometrically. These properties pass to G_{F′_v}-stable subquotients and hence to the global semisimplification; retain the union of the distinct Hodge weights. Separately, auxiliary-prime semisimplicity and the Steinberg slope argument prove that π is ι-ordinary. A graded stable lattice reduces to the original semisimple r̄. ACC+ Corollary 5.5.2’s irreducible-residual converse is used only in Theorem 1.4, never to obtain Galois ordinarity in the general Theorem 1.1 branch.

The output is automorphy over the extension F′ only (acceptance of Layer 2); no descent to F is claimed.

([Potential automorphy for GL_n](#ref-qian-2023), Theorem 1.1, §1, p. 1 (arXiv v1); Invent. pp. 1239–1240 per routed locator; proof §4, pp. 21–24 (arXiv v1); [Potential automorphy for GL_n](#ref-qian-2023), Lemma 3.10(4) and its proof, pp. 20–21 (arXiv v1); geometric explanation in §1, p. 4; [Potential automorphy for general linear groups (PhD dissertation, Stanford University)](#ref-qian-thesis-2023), Remark 3.0.13, printed p. 55 (PDF p. 62).)

*Needs:* [Choice of the auxiliary elliptic curve, N, F^avoid and an ordinary auxiliary prime l′ (Qian §4, Proposition 4.1)](#qian-auxiliary-prime); [An automorphic symmetric-power seed for the auxiliary elliptic curve (Qian Proposition 4.1; ACC+ Corollary 7.2.4)](#elliptic-symmetric-power-seed); [Automorphy of the Dwork fibre at l′ and its transport to l (Qian §4)](#dwork-fibre-automorphy-transport); [Steinberg component and ordinarity of the automorphic Dwork realisation (Qian Lemma 4.3)](#steinberg-ordinarity-lemma); PotentialModularityAndCompatibleSystems, Layer R23.1; PotentialAutomorphyInfrastructurePartII, Layer PL.5; [C-MODULI](#contract-c-moduli).

<a id="qian-ordinary-potential-automorphy"></a>
### 2.33 Potential automorphy of ordinary l-adic representations over CM fields (Qian, Theorem 1.4)

Let F be a CM field, F^av/F finite, n ≥ 2, l > n a prime, ι : Q̄_l ≅ ℂ and r : G_F → GL_n(Q̄_l) continuous with (i) r unramified almost everywhere; (ii) r|_{G_{F_v}} potentially semistable and ordinary with regular Hodge–Tate weights for each v | l; (iii) r̄ absolutely irreducible and decomposed generic, with r̄(G_{F(ζ_l)}) enormous; (iv) some σ ∈ G_F − G_{F(ζ_l)} has r̄(σ) scalar. Then there is a finite CM Galois F′/F, linearly disjoint from F^av over F, such that r|_{G_{F′}} is ordinarily automorphic.

As in the statement; F^av arbitrary.

State the resulting comparison as `TauCeti.PotentialAutomorphy.qian_ordinary`.

Apply [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy) to r̄ with F^av enlarged to contain F̄^{ker r̄}(ζ_l). Conclude by ACC+ Theorem 6.1.2 (ordinary automorphy lifting over CM fields), supplied by PotentialAutomorphyInfrastructure Layer 5, §5.23 with all its hypotheses.

Specialises to Qian's Theorem 1.1 lifts when r is itself ordinary.

([Potential automorphy for GL_n](#ref-qian-2023), Theorem 1.4, §1, p. 2 (arXiv v1); Invent. p. 1241 per routed locator; proof: last paragraph of §4, p. 26 (arXiv v1).)

*Needs:* [Residual potential ordinary automorphy over CM fields (Qian, Theorem 1.1)](#qian-residual-potential-automorphy); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting); [C-LOCAL-DEFORMATION](#contract-c-local-deformation).

### Examples

For a finite collection of polarized systems the extension in simultaneous potential automorphy must be common to all members and disjoint from the one prescribed avoidance field. Separate extensions with no disjointness control cannot be substituted. In the elliptic seed H_{E,ℓ} has determinant ε_ℓ⁻¹; Sym² H has determinant ε_ℓ⁻³ and Hodge numbers {0,1,2}. Qian’s determinant twists and the Dwork realization must be compared in this same convention.

### Dependencies

The layer uses the exact supplier contracts above, PotentialModularityAndCompatibleSystems, Layer R23.1 (moret bailly theorem incomplete skolem data have integral points), PotentialAutomorphyInfrastructurePartII, Layer PL.5 (dwork potential ordinary automorphy), PotentialAutomorphyInfrastructurePartII, Layer PL.5 (ordinary lifts prescribed local), PotentialAutomorphyInfrastructurePartII, Layer PL.4 (ordinary automorphy lifting), AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (polarized galois representation), TauCetiRoadmap.Chebotarev, Layer 10, PotentialAutomorphyInfrastructurePartII, Layer PL.0, AutomorphicGaloisRepresentationsPartII, Layer AG2.2, AutomorphicGaloisRepresentationsPartII, Layer AG2.5, PotentialAutomorphyInfrastructure, Layer PA.2, PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one), PotentialModularityAndCompatibleSystems, Layer R24.5:operations, PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting), PotentialModularityAndCompatibleSystems, Layer R23.1, TauCetiRoadmap.ModularCurves, Layer 5, TauCetiRoadmap.ModularCurves, Layer 10, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), PotentialAutomorphyInfrastructurePartII, Layer PL.1 (connects relation), PotentialAutomorphyInfrastructurePartII, Layer PL.1 (potentially diagonalizable), GlobalGaloisDeformations, Layer G7 (polarized representability), PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphic polarized representation), PotentialAutomorphyInfrastructurePartII, Layer PL.0 (automorphy under twist), PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent), PotentialAutomorphyInfrastructurePartII, Layer PL.1 (pd criteria), PotentialModularityAndCompatibleSystems, Layer R24.5 (rank two reducibility independent of lambda), PotentialModularityAndCompatibleSystems, Layer R24.5 (weakly compatible system rank n), PotentialModularityAndCompatibleSystems, Layer R24.5 (compatible system predicates), PotentialModularityAndCompatibleSystems, Layer R24.5 (constituents essentially self dual), Layer 0, PotentialAutomorphyInfrastructurePartII, Layer PL.5, PotentialModularityAndCompatibleSystems, Layer R24.5 (system l functions), PotentialModularityAndCompatibleSystems, Layer R24.5 (galois grothendieck ring), AutomorphicLFunctionsAndLocalFactors, Layer AL.2, `Matrix.trace`, AutomorphicLFunctionsAndLocalFactors, Layer AL.3, PotentialModularityAndCompatibleSystems, Layer R24.5 (linear algebra operations on systems), PotentialAutomorphyInfrastructure, Layer 5, §5.23 (ordinary automorphy lifting).

## Layer 3: classical-group packets and symplectic descent

<a id="self-dual-cuspidal-type"></a>
### 3.1 Symplectic and orthogonal type of a self-dual cuspidal representation

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

*Needs:* AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gan-takeda-llc-gsp4"></a>
### 3.2 The local Langlands correspondence for GSp₄ (Gan–Takeda)

Let K be a non-archimedean local field of characteristic 0. There is a surjective finite-to-one map rec_GT : π ↦ φ_π from irreducible smooth complex representations of GSp₄(K) to GSp₄(ℂ)-conjugacy classes of L-parameters WD_K → GSp₄(ℂ) such that: (i) π is essentially discrete series iff φ_π does not factor through a proper Levi subgroup; (ii) the fibre (L-packet) L_φ is parametrised by the characters of A_φ = π₀(Z(Im φ)/Z_{GSp₄}), which is trivial or ℤ/2ℤ, and when A_φ = ℤ/2ℤ exactly one member, the one indexed by the trivial character, is generic; (iii) the similitude character of φ_π is ω_π; (iv) φ_{π ⊗ (χ ∘ ν)} = φ_π ⊗ χ; (v) for π generic or non-supercuspidal and every irreducible σ of GL_r(K), the γ-, L- and ε-factors of π × σ (Shahidi) equal those of φ_π ⊗ φ_σ; (vi) the analogous identity of Plancherel measures for non-generic supercuspidal π; (vii) L_φ contains a generic representation iff the adjoint L-factor L(s, ad ∘ φ) is holomorphic at s = 1; (viii) the map is uniquely determined by (i), (iii), (v) and (vi) with r ≤ 2. BCGP normalise it so that rec_GT(π ⊗ (χ ∘ ν)) = rec_GT(π) ⊗ rec(χ) and ν ∘ rec_GT(π) = rec(ω_π), and the Roberts–Schmidt parameters of constituents of unramified principal series agree with it (Gan–Takeda 2011b, Proposition 13.1).

K non-archimedean of characteristic 0 (BCGP use K/ℚ_l finite); complex coefficients (BCGP transport to Q̄_p through ı, [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet)).

State the resulting comparison as `TauCeti.Arthur.recGT`.

Gan–Takeda construct rec_GT through the theta correspondences for (GSp₄, GO(V)) with dim V = 4, 6 and the LLC for GL₂, GL₄ (Harris–Taylor, Henniart) and for the inner forms, and prove the properties by computing γ-factors. Unramified principal series: comparison with Roberts–Schmidt's tables (Gan–Takeda 2011b, Proposition 13.1); BCGP Proposition 2.4.6 records the consequences (Sally–Tadić irreducibility criterion and rec_GT of constituents).

Check BCGP Proposition 2.4.6: χ₁ × χ₂ ⋊ σ is irreducible iff none of χ₁, χ₂, χ₁χ₂^{±1} is |·|^{±1}, and rec_GT(π)^{ss} = σ ⊗ (χ₁χ₂ ⊕ χ₁ ⊕ χ₂ ⊕ 1) (characters through Art_K^{−1}) for every constituent π.

([BCGP, potential modularity](#ref-bcgp-2021), §2.3, p. 18 (arXiv v3); [BCGP, potential modularity](#ref-bcgp-2021), Proof of Proposition 2.4.22, §2.4.21, p. 25 (arXiv v3); [The local Langlands conjecture for GSp(4)](#ref-gan-takeda-2011), Main Theorem, parts (i)–(vii), pp. 1842–1843; discussion following it, p. 1843.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; GL2AutomorphicRepresentationsAndTransfer, Layer R16.3; MetaplecticAutomorphicForms, Layer MP.3; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="orthogonal-sign-kernel"></a>
### 3.3 The determinant constraint on sign vectors

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

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.4, (1.4.8)–(1.4.9), p. 35, 2011 manuscript.)

*Needs:* Mathlib finite lists, integers, polynomials and finite-dimensional linear algebra in the stated scope.

<a id="gsp4-galois-l-packet"></a>
### 3.4 The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)

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
### 3.5 Discrete global Arthur parameters of a quasi-split classical group

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
### 3.6 Discrete automorphic representations of GSp₄: symplectic type, general type and transfer

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

*Needs:* [Symplectic and orthogonal type of a self-dual cuspidal representation](#self-dual-cuspidal-type); [The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4); [Archimedean reciprocity, sums and restriction](#archimedean-langlands-conventions); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="weight-22-abelian-variety-conjecture"></a>
### 3.7 Conjecture: weight (2,2) Siegel eigenforms come from abelian varieties with real multiplication (conjectural endpoint)

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
### 3.8 A regular-weight Serre conjecture for GSp₄ implies modularity of abelian surfaces over ℚ (BCGP 2025, Lemma 10.4.1)

Suppose that for every prime p and every ρ̄ : G_ℚ → GSp₄(F̄_p) with multiplier ε̄^{−1}, absolutely irreducible, and with (ρ̄|_{G_{ℚ_p}})^{ss} a direct sum of characters, there is an ordinary cuspidal automorphic representation π of GSp₄/ℚ of regular weight, level prime to p and central character |·|² with ρ̄_{π,p} ≅ ρ̄. Then every abelian surface A/ℚ is modular. (Remark 10.4.2: the hypothesis may be weakened, e.g. to p sufficiently large.) This is a conditional endpoint: its hypothesis is a conjecture.

Hypothesis: the regular-weight Serre statement above (status conjectural); the proof also uses Arthur's classification through BCGP's main theorems ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.LanglandsRegister.abelianSurface_modular_of_serre`.

Choose p with ρ̄_{A,p} absolutely irreducible and ordinary-type at p; the hypothesis gives an ordinary regular-weight π. Move from regular weight to parallel weight 2 by BCGP's Hida-theoretic and modularity lifting theorems, giving modularity of A (the analogue of Khare's deduction of Artin's conjecture from Serre's).

The analogy: [Odd Artin representations over the rationals](#odd-artin-modularity-over-q) follows from Serre's conjecture.

([BCGP, modularity](#ref-bcgp-2025), Lemma 10.4.1, §10.4, p. 222 (arXiv v1); [BCGP, modularity](#ref-bcgp-2025), Remark 10.4.2, p. 222 (arXiv v1).)

*Needs:* [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [Assertions with explicit hypotheses](#endpoint-status-register); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="mok-unitary-classification"></a>
### 3.9 Endoscopic classification for quasi-split unitary groups (Mok)

Let E/F be a quadratic extension of number fields and G = U_{E/F}(N) the quasi-split unitary group. Global parameters are formal sums ψ = ⊞_i μ_i ⊠ ν_{b_i} with μ_i conjugate-self-dual unitary cuspidal representations of GL_{m_i}(𝔸_E), Σ m_i b_i = N, pairwise distinct, each μ_i ⊠ ν_{b_i} conjugate-self-dual of sign (−1)^{N−1} (through the standard base change embedding ξ_{χ₊}). Then (local) for every place v there are packets Π_{ψ_v} with characters ⟨·, π_v⟩ of S_{ψ_v} satisfying the endoscopic character identities, and the tempered packets give the local Langlands correspondence for U(N)(F_v); and (global) L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ_2(G, ξ_{χ₊})} ⊕_{π ∈ Π_ψ(ε_ψ)} π, with Π_ψ(ε_ψ) a multiset retaining repetitions; for generic ψ, multiplicity one holds (Mok Remark 2.5.3). No multiplicity-one assertion is made here for every non-generic ψ.

E/F a quadratic extension of number fields; G = U_{E/F}(N) quasi-split; Whittaker datum fixed. Conditional exactly as Arthur's book on which Mok's proof depends ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.mok_multiplicity_formula`.

Mok follows Arthur's method: comparison of the stabilised twisted trace formula of R_{E/F}GL_N ⋊ θ with the stable trace formulas of the unitary groups U(N₁) × U(N₂). Mok Theorem 2.5.2 is a decomposition using global packet multisets; Remark 2.5.3 asserts multiplicity one for generic parameters. Absence of the even-orthogonal outer-automorphism ambiguity does not remove non-generic packet repetitions.

Check the sign convention: for N = 1, U(1) parameters are conjugate-orthogonal characters μ of 𝔸_E^×/E^× (μ|_{𝔸_F^×} = 1), and the multiplicity formula is Hilbert 90 / Pontryagin duality for U(1)(F)\U(1)(𝔸_F).

([Endoscopic classification of representations of quasi-split unitary groups](#ref-mok-2015), §2.5, Theorem 2.5.2 and Remark 2.5.3, pp. 34–35 (arXiv v5).)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-ARTHUR](#contract-c-arthur).

<a id="extended-langlands-parameter"></a>
### 3.10 Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group

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
### 3.11 Twisted exterior-square L-functions at s = 1 (Shahidi)

Let Π be unitary cuspidal on GL₄(𝔸_F) (or GL_{2n}) and ω unitary. At s=1, L^S(s,Π,∧²⊗ω) has either a simple pole or a finite nonzero limit; the pole is equivalent to symplectic type with multiplier ω^{−1}. For cyclic prime-degree F′/F with Π′=BC(Π) cuspidal, in the factorization over the unitary quotient characters ψ at most one factor L^S(s,Π,∧²⊗ωψ) has a pole at 1 and the others have nonzero limits there. This assertion is at s=1; it does not assert absence of poles at all other points of Re s=1.

F a number field; Π unitary cuspidal on GL₄ or GL_{2n}; ω unitary; S contains the ramified places. **Source boundary.** BCGP’s cited argument supplies the GL₄ case; the GL_{2n} variant requires its own analytic theorem and primary locator. The cyclic base-change consequence requires BC(Π) cuspidal. Two different pole-producing twists would give a prohibited nontrivial self-twist.

State the resulting comparison as `TauCeti.Arthur.exteriorSquare_nonvanishing`.

Use the required Langlands–Shahidi exterior-square extension at s=1 for unitary cuspidal Π and unitary ω. AL.4 supplies only unramified L-group factors; analytic continuation and boundary nonvanishing are a missing extension, not an AL.4 theorem. Full vertical-line claims require a separate theorem and cannot be inferred from BCGP p.247. Pole criterion: definition of symplectic type ([Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types)). Factorisation: base change of unramified local factors.

BCGP Lemma 8.3.2 deduces from this that a GSp₄ representation over F′ whose transfer is a base change descends to F.

([BCGP, potential modularity](#ref-bcgp-2021), Proof of Lemma 8.3.2, §8.3, p. 247 (arXiv v3).)

*Needs:* [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types); AutomorphicLFunctionsAndLocalFactors, Layer AL.4; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="local-arthur-packets"></a>
### 3.12 Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)

Let F be a local field of characteristic 0, G a quasi-split Sp_{2n}, SO_{2n+1} or SO_{2n} over F with a fixed Whittaker datum, and ψ : L_F × SL₂(ℂ) → ^LG a local Arthur parameter whose restriction to L_F is bounded. Then there are a finite multiset Π̃_ψ of irreducible unitary representations of G(F) (for SO_{2n}, orbits under the outer automorphism) and a map π ↦ ⟨·, π⟩ from Π̃_ψ to the characters of S_ψ such that: (a) the distribution f ↦ Σ_{π ∈ Π̃_ψ} ⟨s_ψ, π⟩ f_G(π) is stable and is the transfer of the twisted character of the representation of GL_N(F) ⋊ θ attached to ψ; (b) for every endoscopic datum (G′, s) through which ψ factors as ψ′, f′(ψ′) = Σ_{π ∈ Π̃_ψ} ⟨s_ψ x, π⟩ f_G(π) (the endoscopic character identities); (c) if ψ = φ is trivial on SL₂(ℂ) (a tempered L-parameter) then Π̃_φ is a set of tempered representations, π ↦ ⟨·, π⟩ is injective, and bijective onto Ŝ_φ when F is p-adic; the packets Π̃_φ for φ ∈ Φ̃_bdd(G) are disjoint and exhaust the tempered dual. Part (c) is the local Langlands correspondence for G.

F local of characteristic 0; G quasi-split symplectic or special orthogonal over F with a fixed Whittaker datum. The statement is conditional with hypotheses in [The twisted weighted fundamental lemma](#arthur-dependency-gate): Arthur's proof uses the stabilisation of the twisted trace formula and results he announces in [A24]–[A27].

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.localPacket`.

Arthur's proof (2013, Chapters 2–7) is a long induction comparing the stabilised twisted trace formula of GL_N ⋊ θ with the stable trace formulas of the twisted endoscopic groups G, using the local intertwining relation. The packets are defined by (a) and (b) through the twisted transfer of characters of GL_N (Mœglin–Waldspurger stabilisation; Waldspurger's transfer; the fundamental lemma). Use the conditional classification with the ordinary and twisted stabilization, orbital-integral transfer, weighted fundamental lemma and local intertwining identities specified above, with the same test functions and transfer normalizations.

The identities (a) and (b) are Arthur Theorem 2.2.1, §2.2, pp. 65–66; Theorem 1.5.1 supplies the packet and tempered assertions. The packets of a tempered φ with S_φ = 1 are singletons; for G = SL₂-type groups the packet sizes are |Ŝ_φ| ∈ {1, 2, 4}.

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, Theorem 1.5.1 and the paragraph before it, pp. 41–43 (2011 manuscript; Theorem 1.5.1 on p. 42); [The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, after Theorem 1.5.1, pp. 42–43 (2011 manuscript); [Endoscopic classification of representations of quasi-split unitary groups](#ref-mok-2015), §2.5, Theorem 2.5.1 PDF p.32.)

*Needs:* [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6; [C-ARTHUR](#contract-c-arthur).

<a id="kmsw-inner-forms"></a>
### 3.13 Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)

For an extended pure inner twist Ξ of U_{E/F}(N) and a bounded tempered local parameter φ, KMSW Theorem 1.6.1 gives finite packets with the pairing determined by Ξ and refined endoscopic character identities. At nonarchimedean places the packet maps bijectively to Irr(S_φ^♮,χ_Ξ). At real places this is a bijection only after taking the disjoint union over the specified pure inner forms; a fixed real form need not realize every character. For a global PURE inner twist and a generic discrete parameter ψ, the ψ-part of the discrete spectrum is the sum over Π_ψ(G,Ξ,ε_ψ). For nongeneric ψ or general inner twists, the version printed as Theorem* 1.7.1 uses the two explicitly stated inputs of Chapter 5: the local classification at each ψ_v (Hypothesis 3.6.3) and the local intertwining relation (Theorem* 2.6.2) at every place. Retain these two local inputs as hypotheses in the nongeneric or general-inner-twist scope.

Quadratic extension E/F, fixed Whittaker datum on the quasi-split form and extended pure inner twist Ξ with its associated central character χ_Ξ. Proved global scope in the cited KMSW edition: generic parameter and pure inner twist, together with the specified Mok/Arthur external classification hypothesis. The more general statement is conditional on the actual local classification and local intertwining identities for each localization, with their actual parameter and inner-twist scope.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.kmsw_multiplicity_formula`.

KMSW compare the trace formula of G with the stable trace formulas of the endoscopic groups, using Mok's results for the quasi-split inner form and the theory of extended pure inner twists (Kottwitz's B(G)). The global statement is proved for generic parameters; non-tempered local packets of inner forms are not constructed.

Check the degenerate case: for G quasi-split the statement is Mok's ([Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification)).

([Endoscopic Classification of Representations: Inner Forms of Unitary Groups](#ref-kmsw-2014), §1.6.1, Theorem* 1.6.1 and the sentence before it, p. 80 (arXiv v3); [Endoscopic Classification of Representations: Inner Forms of Unitary Groups](#ref-kmsw-2014), Theorem* 1.6.1(5), pp. 80–81; Theorem* 1.7.1 and discussion, p. 89; Chapter 5 and Theorem 5.0.5, pp. 205–206.)

*Needs:* [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur).

<a id="arthur-multiplicity-formula"></a>
### 3.14 Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)

Let G be as in [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter). Then L²_disc(G(F)\G(𝔸_F)) ≅ ⊕_{ψ ∈ Ψ̃_2(G)} ⊕_{π ∈ Π̃_ψ(ε_ψ)} m_ψ π, where Π̃_ψ = ⊗'_v Π̃_{ψ_v} is the global packet (π_v unramified with ⟨·, π_v⟩ = 1 for almost all v; the local components ψ_v lie in Ψ̃⁺_unit(G_v), not necessarily bounded since the Ramanujan conjecture is unknown, and their packets are defined from the bounded case by Arthur's (1.5.1)–(1.5.2)), Π̃_ψ(ε_ψ) is the set of π = ⊗π_v ∈ Π̃_ψ whose character ⟨·, π⟩ = ∏_v ⟨·, π_v⟩, restricted to S_ψ, equals ε_ψ, and m_ψ ∈ {1, 2} is Arthur's multiplicity (m_ψ = 2 exactly when N is even, Ĝ = SO(N, ℂ) and every N_i = m_i b_i is even; otherwise m_ψ = 1). In particular every discrete automorphic representation of G has a parameter ψ, its transfer to GL_N(𝔸_F) is the isobaric representation of ψ, and the summands with generic ψ are the discrete representations whose transfer is a sum of distinct self-dual cuspidals.

F a number field, 𝔸_F its adèles; G a quasi-split symplectic or special orthogonal group over F (Sp_{2n}, split SO_{2n+1}, or quasi-split SO_{2n} attached to a quadratic character η_G), whose dual group Ĝ has a standard representation of dimension N (N = 2n + 1, 2n, 2n respectively). Conditional with hypotheses in [The twisted weighted fundamental lemma](#arthur-dependency-gate).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.multiplicity_formula`.

Arthur, Theorem 2.2.1, §2.2, pp. 65–66, supplies the stable transfer and character identities with the distinguished element s_ψ in the pairing. Chapters 3–8 establish the comparison of the stable multiplicity formula with the discrete part of the stabilised trace formula of G and the twisted trace formula of GL_N, by induction on N. The local packets and the pairing ⟨·, π_v⟩ are those of [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets). The global sign ε_ψ arises from the global intertwining operators normalised by Langlands–Shahidi; its computation uses the root numbers of the Rankin–Selberg products.

Recover the trivial representation of PGL₂ = SO₃ from ψ = 1 ⊠ ν₂, and the cuspidal spectrum of PGL₂ from the generic parameters of [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter)'s test so3_generic_iff (multiplicity one for SL₂-packets after restriction is not claimed: SL₂ is not SO₃).

([The Endoscopic Classification of Representations: Orthogonal and Symplectic Groups](#ref-arthur-2013), §1.5, Theorem 1.5.2 and (1.5.3)–(1.5.7), pp. 45–48 (2011 manuscript).)

*Needs:* [Discrete global Arthur parameters of a quasi-split classical group](#global-arthur-parameter); [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula); [C-ARTHUR](#contract-c-arthur).

<a id="vogan-packets-so-v"></a>
### 3.15 Vogan packets for odd special orthogonal groups of all quadratic spaces

Let F be a local field of characteristic 0 and φ : L_F → Sp_{2n}(ℂ) an L-parameter. For each (2n+1)-dimensional quadratic space V over F with trivial discriminant there is a (possibly empty) L-packet Π_φ(SO(V)), and Irr SO(V) = ⊔_φ Π_φ(SO(V)); moreover there is a bijection ⊔_V Π_φ(SO(V)) ↔ Ŝ_φ, σ_η ↔ η, onto the characters of the component group S_φ of the centraliser of Im φ in Sp_{2n}(ℂ), where σ_η is a representation of SO(V) only if η(z_φ) = ε(V) (the normalised Hasse–Witt invariant), with equality of the two conditions for F non-archimedean or F = ℂ. σ ∈ Π_φ(SO(V)) is square-integrable iff φ is multiplicity-free and of good parity, and tempered iff φ is tempered.

F local of characteristic 0; V of odd dimension 2n + 1 with trivial discriminant (SO(V⁺) split, SO(V⁻) its pure inner form). Conditional: the split case is Arthur's ([The twisted weighted fundamental lemma](#arthur-dependency-gate)); the non-split case is Mœglin–Renard's, which assumes Arthur-type results for inner forms (proved for generic parameters by Ishimoto).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.voganPacket_so`.

Split SO(V⁺): [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets) (c) for SO_{2n+1}. Non-split SO(V⁻): Mœglin–Renard, with Ishimoto's local intertwining relation and endoscopic character relations for generic parameters; Gan–Ichino (5.3) record the combined statement. Square-integrability and temperedness criteria follow from the packet construction (Mœglin).

For n = 1: SO(V⁺) ≅ PGL₂ and SO(V⁻) ≅ D^×/F^× for the quaternion division algebra D; the Vogan packet of a discrete parameter φ with S_φ = ℤ/2ℤ is {the discrete series of PGL₂, its Jacquet–Langlands transfer to D^×/F^×}.

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.2, (5.3), p. 17 (arXiv v3); published p. 987; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §1.2, p. 4 (arXiv v3); published p. 969.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="xu-gsp2n-packets"></a>
### 3.16 Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)

Let F be a non-archimedean local field of characteristic 0 and φ♭ an L-parameter of Sp₆ whose L-packet Π_{φ♭} has trivial central character (for n = 3: φ♭ lifts to Spin₇(ℂ)). Let Π̃_{φ♭} be the set of irreducible representations of PGSp₆(F) whose restriction to Sp₆(F) has constituents in Π_{φ♭}, and Φ̃_{φ♭} the finite set of lifts φ of φ♭ to the dual group of PGSp₆, a homogeneous set under Hom(W_F, μ₂). Xu partitions Π̃_{φ♭} into packets Π̃^X_{φ♭} with: (a) the packets are the twists Π̃^X_{φ♭} ⊗ χ by quadratic characters χ of the similitude; (b) restriction to Sp₆ gives a bijection Π̃^X_{φ♭} → Π_{φ♭}/PGSp₆(F); (c) there is a natural bijection Π̃^X_{φ♭} ↔ Irr(S_φ/Z) for any lift φ ∈ Φ̃_{φ♭}; (d) with respect to (c) the packets satisfy the stability and endoscopic character identities; (e) the stabiliser of a member in Hom(F^×, μ₂) equals the stabiliser of φ in Hom(W_F, μ₂), so the packets and the lifts are non-canonically isomorphic homogeneous sets. Xu does not determine which lift φ is the parameter of which packet.

F non-archimedean of characteristic 0; n=3 (PGSp₆/Sp₆), exactly the specialization read in Gan–Savin §7; classification remains conditional on its named Arthur inputs. A general n statement requires direct reading of Xu.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.xuPacket`.

Xu (Compositio 2016, Prop. 6.27–6.28, Thm 6.30; Math. Ann. 2017, Prop. 4.4, Thm 4.6; Amer. J. Math. 2025, Thm 4.1): restrict to Sp_{2n}, use Arthur's packets there and the twisted endoscopic character identities for GSp_{2n}. Gan–Savin §9 resolve the matching of (e) when φ♭ factors through G₂.

For n = 2 Xu's packets for GSp₄ agree with the Gan–Takeda L-packets ([The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4)) up to the ambiguity (e).

([The local Langlands conjecture for G_2](#ref-gan-savin-2023-g2), §7, (7.1), p. 22 (published); [The local Langlands conjecture for G_2](#ref-gan-savin-2023-g2), §7 (a)–(b), p. 22 (published); [The local Langlands conjecture for G_2](#ref-gan-savin-2023-g2), §7 (e), p. 23 (published).)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Extended Langlands parameters (ϱ, χ_ϱ) of a p-adic classical group](#extended-langlands-parameter); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="adams-johnson-packets"></a>
### 3.17 Archimedean Arthur packets of cohomological parameters are Adams–Johnson packets

For a quasi-split real symplectic, special orthogonal or unitary group G, take ψ satisfying the full Adams–Johnson parameter conditions of AJ87. AMR Theorem 1.1 identifies the Whittaker-normalized twisted transfer of the stable Adams–Johnson character with the twisted GL_N character of Std∘ψ. Its Arthur packet therefore equals the Adams–Johnson multiset of cohomologically induced modules A_𝔮(λ), with the multiplicity-one consequence used by Chenevier–Taïbi. Require the full parameter definition as an AF.1 export: AMR §8.1 gives necessary consequences (regular integral infinitesimal character, centralizer Levi and a unitary-character factorization with principal SL₂), which are insufficient to define this scope.

G is quasi-split over ℝ and ψ is an actual Adams–Johnson parameter. Its full defining conditions must be supplied by AF.1’s real-packet extension; regular integral infinitesimal character alone is insufficient. Global applications (Chenevier–Taïbi; Ichino–Prasanna) are conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate); Ichino–Prasanna use KMSW Theorem* 1.7.1 for non-generic parameters, which KMSW prove only for generic ones .

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.adamsJohnson_eq_arthurPacket`.

Import AMR Theorem 1.1 at the exact AJ87 parameter scope. The proof compares stable sums of cohomological characters with the Whittaker-normalized twisted GL_N trace, using tempered spectral transfer and resolutions by standard modules. Request the complete parameter definition and cohomological induction objects, then expose the equality as a packet/multiset comparison. The higher-rank non-quasi-split global application separately retains KMSW’s actual nongeneric local hypotheses.

Chenevier–Taïbi (5.2.1): for Sp_{2g} and holomorphic discrete series ρ_k (k_g > g), ρ_k ∈ Π(ψ_ℝ) iff d_{i₀} = 1, with the character values given there.

([Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.1, p. 303 (published); [Hodge classes and the Jacquet–Langlands correspondence](#ref-ichino-prasanna-2023), §11.2, p. 70 (arXiv v2); published p. 81; [Paquets d’Arthur des groupes classiques et unitaires](#ref-amr-2018), Theorem 1.1, §1, printed p. 3; Adams–Johnson parameter hypotheses in §8.1.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="moeglin-renard-packets"></a>
### 3.18 Arthur packets of Sp_{2g}(ℝ) containing scalar unitary lowest weight modules (Mœglin–Renard)

Let ψ=ψ_u⊕⊕_j(δ_{t_j}⊠R[a_j]) be an Arthur parameter of Sp_{2g}(ℝ), with ψ_u=⊕_i χ_i⊠R[a′_i], χ_i∈{1,sgn}, a′_i odd, one or three unipotent summands, t_j>0 and t_j+a_j odd. Put a(ψ_u)=max_i a′_i. For 0≤k≤g assume that the infinitesimal character is {k−1,…,k−g,−(k−1),…,−(k−g),0}. The scalar highest-weight module π_g(k) belongs to Π_ψ exactly in either of these cases: (i) dim ψ_u=1, 2k>g+1, and the closed intervals [(t_i−a_i+1)/2,(t_i+a_i−1)/2] are pairwise disjoint; (ii) ψ=(sgn^{(2g+1−a(ψ_u))/2}⊠R[a(ψ_u)])⊕ψ′, where ψ′ is a parameter for the compact even orthogonal group O(0,2g+1−a(ψ_u)), its packet contains a finite-dimensional E_{ψ′}, and the Howe lift of E_{ψ′} is π_g(k). In either case π_g(k) has multiplicity one. The refinement for k≥1 has a(ψ_u)=2(g−k)+1 or 2(g−k)+3 in the theta branch; the latter requires 2k≥g+2. The packet character is a separate assertion of Proposition 18.3, whose formula remains a requested export.

The parameter decomposition and infinitesimal-character condition in the statement. Global uses carry the explicit external classification assumptions; use its actual parameter decomposition and membership inequalities.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.moeglinRenard_packet`.

Import the real scalar packet membership criterion and cohomological/theta constructions from the requested real-packet extension of AF.1. Mœglin–Renard Apply Theorem 7.1 with its universal RAESDC premise. Its theta branch requires the compact orthogonal correspondence, which elementary MP.3 does not supply.

Used by Chenevier–Taïbi to count level-one Siegel modular forms of small weight.

([Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.2, pp. 303–305 (published); [Discrete series multiplicities for classical groups over Z and level 1 algebraic cusp forms](#ref-chenevier-taibi-2020), §5.2.2, case (H), p. 305 (published); [Sur les paquets d’Arthur de Sp(2n,R) contenant des modules unitaires de plus haut poids, scalaires](#ref-moeglin-renard-2018), Theorem 7.1, §7, pp. 18–19; notation §1, pp. 1–3.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur).

<a id="amf-nonsplit-so-v"></a>
### 3.19 Arthur's multiplicity formula for non-split odd orthogonal groups, generic parameters (Gan–Ichino's hypothesis (6.1))

Let F be a number field and V a (2n+1)-dimensional quadratic space with trivial discriminant. The near-equivalence decomposition L²_disc(SO(V))=⊕_ΦL²_Φ(SO(V)) ranges over all elliptic A-parameters, including non-generic ones. For a generic elliptic Φ only, Gan–Ichino hypothesis (6.1) gives L²_Φ(SO(V))=⊕_ηm_ηΣ_η through its Vogan packets, where m_η=1 if Δ*η=1 and 0 otherwise. The decomposition and the generic multiplicity formula have different quantifier scopes. The split case follows from Arthur; the non-split generic result uses the stated external inner-form classification.

F a number field; V odd-dimensional with trivial discriminant; Φ generic elliptic. For split SO(V) this is Arthur's Theorem 1.5.2; for non-split SO(V) Gan–Ichino assume it (their hypothesis (6.1) with the decomposition of §3.1), and Ishimoto proves it for generic parameters; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.multiplicity_formula_so_nonsplit`.

Split case: [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula). Non-split case: comparison of the trace formula of SO(V) with that of its quasi-split inner form (Ishimoto, following Kaletha–Mínguez–Shin–White's method for unitary groups), using the local results of [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v).

Gan–Ichino's Theorem 1.4 (the multiplicity formula for Mp_{2n}) is stated under this hypothesis; retain this hypothesis in each application.

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §6.2, (6.1), p. 22 (arXiv v3); published p. 993; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §3.1, p. 10 (arXiv v3); published p. 977.)

*Needs:* [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [Endoscopic classification for inner forms of unitary groups (Kaletha–Mínguez–Shin–White)](#kmsw-inner-forms); [Trace formula and intertwining inputs](#trace-formula-inputs-register); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="packet-member-irreducibility"></a>
### 3.20 Irreducibility of the induced representations building almost tempered packets (Gan–Ichino, Lemmas 5.1 and 5.5)

(Lemma 5.1) Let F be local of characteristic 0, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀ an almost tempered symplectic parameter, V = H^k ⊕ V₀ (k = dim ϕ), Q ⊂ SO(V) the parabolic with Levi GL_k × SO(V₀) and τ ∈ Irr GL_k(F) attached to ϕ. Then Ind_Q^{SO(V)}(τ ⊗ σ₀) is irreducible for every σ₀ ∈ Π_{φ₀}(SO(V₀)). (Lemma 5.5) Let φ′ = φ ⊕ S_{2r−2n} with φ a 2n-dimensional almost tempered symplectic representation of L_F, 2n < r − 1, φ = ϕ ⊕ ϕ^∨ ⊕ φ₀, φ′₀ = φ₀ ⊕ S_{2r−2n}, Q′ ⊂ SO_{2r+1} with Levi GL_k × SO_{2r−2k+1}. Then Ind_{Q′}^{SO_{2r+1}}(τ ⊗ σ′₀) is irreducible for every irreducible subrepresentation σ′₀ of every member of the A-packet Π_{φ′₀}(SO_{2r−2k+1}).

F local of characteristic 0; 'almost tempered' as in Gan–Ichino §5.2: ϕ with exponents in (−1/2, 1/2) after the tempered part is split off. In both lemmas φ=ϕ⊕ϕ^∨⊕φ₀ is the canonical bad/good decomposition: φ₀ consists of the symplectic irreducible summands and ϕ selects the non-symplectic dual pairs. An arbitrary choice of a symplectic subparameter φ₀ does not satisfy the source hypothesis.

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.induced_irreducible_of_almostTempered`.

Lemma 5.1: for nonarchimedean F use Mœglin–Waldspurger §2.14 and the Gross–Prasad–Rallis input of Gan–Ichino. For F=ℝ use Speh–Vogan [83], and for F=ℂ use the known irreducibility of the almost-tempered induced representation. These are separate real/complex inputs, not an application of Arthur’s refined inductive property. Lemma 5.5: use Mœglin for nonarchimedean F and Mœglin–Renard for F=ℂ. For F=ℝ the canonical bad/good decomposition yields disjoint half-integral infinitesimal-character supports for the inducing factors; the Kazhdan–Lusztig input [22] in Gan–Ichino’s proof gives irreducibility. The real input is not omitted.

The lemmas are what makes the members σ_η of almost tempered packets irreducible (Gan–Ichino Proposition 5.4).

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.2, Lemma 5.1 and proof, p. 18 (arXiv v3); published p. 987; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), §5.4, Lemma 5.5 and proof, p. 20 (arXiv v3); published p. 990.)

*Needs:* [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="generic-packets-standard-modules"></a>
### 3.21 Members of generic L-packets of classical groups are irreducible standard modules (Jiang–Zhang, Proposition B.1)

Let F be a local field of characteristic 0, G a classical group over F (quasi-split, or a pure inner form) and φ a generic L-parameter (its L-packet contains a generic member for some Whittaker datum of the quasi-split form). Then every member of the L-packet Π_φ(G) is an irreducible standard module, i.e. the full induced representation from the tempered data of its Langlands quotient is irreducible.

F local of characteristic 0; G classical (symplectic, orthogonal or unitary, or a pure inner form); φ generic. Conditional through the packets used ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.genericPacket_standardModule`.

Mœglin–Waldspurger (generic packets and standard modules), Gan–Ichino (the Gross–Prasad–Rallis conjecture), Heiermann (the standard module conjecture for classical groups), Adams–Barbasch–Vogan (archimedean case), as assembled in Jiang–Zhang Appendix B.

For G = GL_n (not classical, but the model case) the statement is Zelevinsky's standard module result for generic representations.

([Arthur parameters and cuspidal automorphic modules of classical groups](#ref-jiang-zhang-2020), Appendix B, Proposition B.1 and proof, p. 85 (arXiv v4); published p. 818.)

*Needs:* [Local Arthur packets and the local Langlands correspondence for quasi-split classical groups (Arthur, Theorem 1.5.1)](#local-arthur-packets); [Vogan packets for odd special orthogonal groups of all quadratic spaces](#vogan-packets-so-v); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-arthur-classification"></a>
### 3.22 Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)

Let F be a totally real number field. Every discrete automorphic representation π of GSp₄(𝔸_F) has a transfer π̃ to GL₄(𝔸_F) (its global parameter) of one of the six types (a)–(f) of [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types), and the discrete spectrum is described by Arthur's multiplicity formula for GSp₄. In particular: (i) the transfer is compatible with rec_GT at every finite place; (ii) for a parameter ψ = π̃ ⊠ 1 of general type the global component group S_ψ is trivial, so for every choice of local packet members π′_v ∈ Π_{ψ_v} (π′_v unramified for almost all v) ⊗′_v π′_v is automorphic; (iii) such representations occur with multiplicity one; and for a general-type ψ the archimedean packet Π_{ψ_∞} is the L-packet of the archimedean parameter.

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π. Conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate): Gee–Taïbi prove Arthur's 2004 announcement from Arthur 2013 for Sp₄ and SO₅, and the result is only as unconditional as Arthur 2013 and Mœglin–Waldspurger's stabilisation. The BCGP §2.9 statement used here has F totally real; a version over an arbitrary number field needs a separately checked Gee–Taïbi export.

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.GSp4.classification`.

Gee–Taïbi: restrict from GSp₄ to Sp₄ and use Arthur's classification for Sp₄ (Ĝ = SO₅) and for SO₅ ≅ PGSp₄ (Ĝ = Sp₄), together with the similitude character, and prove compatibility with rec_GT. Parts (ii)–(iii) for general type: ψ is stable (S_ψ = 1), so ε_ψ = 1 and every member of the global packet occurs once.

Calegari–Geraghty Theorem 7.11 and Pilloni Proposition 15.2.4.1 use exactly (ii) and (iii) to move between the holomorphic and generic limits of discrete series at infinity.

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 7.11, §7.2, publ. p. 854; arXiv v1 p. 40; [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 7.11, publ. p. 855 (copy p. 55); [BCGP, potential modularity](#ref-bcgp-2021), §2.9 'Arthur's classification', first paragraph PDF p.38.)

*Needs:* [Discrete automorphic representations of GSp₄: symplectic type, general type and transfer](#gsp4-discrete-spectrum-types); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [The local Langlands correspondence for GSp₄ (Gan–Takeda)](#gan-takeda-llc-gsp4); [The classification input for the symplectic branch](#symplectic-branch-status); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="xu-multiplicity-formula"></a>
### 3.23 Xu's multiplicity formula for the tempered discrete spectrum of PGSp_{2n}

Let F be a number field. Xu describes the tempered part of the discrete automorphic spectrum of PGSp_{2n} (as used: n = 3) by global packets Π̃^X_{Ψ♭} = ⊗_v Π̃^X_{Ψ♭_v} built from the local packets of [Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)](#xu-gsp2n-packets), indexed by generic A-parameters Ψ♭ of Sp_{2n}, with an Arthur-type multiplicity formula. In particular, if Σ is a cuspidal automorphic representation of PGSp₆ whose restriction to Sp₆ has a generic A-parameter Ψ♭ with trivial global component group, every element of the global packet containing Σ is automorphic.

F a number field; tempered part only; conditional through Arthur's classification ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

Assume TWFL together with the [trace formula and intertwining inputs](#trace-formula-inputs-register) in the group and parameter scope of this assertion.

State the resulting comparison as `TauCeti.Arthur.xu_multiplicity_formula`.

Xu (Amer. J. Math. 2025, Theorem 4.1): from Arthur's multiplicity formula for Sp_{2n} and the local results (a)–(e). Trivial component group: ε_Ψ = 1 and the sign condition is empty, so every member occurs.

Gan–Savin §12.8 apply it to a cuspidal Σ on PGSp₆ in the proof of Theorem 12.7.

([The local Langlands conjecture for G_2](#ref-gan-savin-2023-g2), §7 (f), p. 23 (published); [The local Langlands conjecture for G_2](#ref-gan-savin-2023-g2), §12.8, proof of Theorem 12.7, pp. 39–40 (published).)

*Needs:* [Xu's L-packets for similitude groups GSp_{2n} (as used for PGSp₆)](#xu-gsp2n-packets); [Arthur's multiplicity formula for quasi-split classical groups (Theorem 1.5.2)](#arthur-multiplicity-formula); [The twisted weighted fundamental lemma](#arthur-dependency-gate); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="non-general-type-reducible"></a>
### 3.24 Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)

Let F be totally real and π a discrete automorphic representation of GSp₄(𝔸_F) such that for each v | ∞, π_v has the infinitesimal character of the L-packet of φ_{(2; k_v−1, l_v−2)} with k_v ≡ l_v (mod 2) and k_v ≥ l_v ≥ 2. If π is not of general type, there is a compatible system of reducible Galois representations ρ_{π,p} : G_F → GSp₄(Q̄_p) with WD(ρ_{π,p}|_{G_{F_v}})^{ss} ≅ rec_{GT,p}(π_v ⊗ |ν|^{−3/2})^{ss} for all but finitely many v. Pilloni (§5.1.7) records the same for F = ℚ and discrete-series π_∞: in types (b)–(f), ρ_{π,λ} is a sum of representations attached to GL₁ and regular algebraic GL₂ forms. For general type, irreducibility of ρ_{π,p} is only expected (BCGP Remark 2.9.2).

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π. The archimedean condition of the lemma; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.reducible_of_not_generalType`.

By [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification), π falls into one of the classes (b)–(f). In each class the transfer is an isobaric sum of Hecke characters and cuspidal GL₂ representations (possibly twisted by |·|^{±1/2}), all regular algebraic or algebraic by the archimedean condition; take the sum of their Galois representations (class field theory; AutomorphicGaloisRepresentations for Hilbert modular forms). In class (b) the GL₂ constituents have central character ω_π.

Check case (b): a Yoshida lift has ρ_{π,p} = ρ_{μ₁,p} ⊕ ρ_{μ₂,p}.

([BCGP, potential modularity](#ref-bcgp-2021), Lemma 2.9.1, §2.9, p. 38 (arXiv v3); [Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §5.1.7, paragraph after Remark 5.1.7.1, p. 23 (author version 17 June 2019).)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [The L-packet L(ρ) of a GSp₄-valued local Galois representation, and n(π)](#gsp4-galois-l-packet); AutomorphicGaloisRepresentations, Layer R19.2; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gl4-symplectic-descent"></a>
### 3.25 Descent from GL₄ of symplectic type to GSp₄ (BCGP Theorem 2.9.3)

Let F be totally real and Π a cuspidal automorphic representation of GL₄(𝔸_F) of symplectic type with multiplier χ. Then there is a discrete automorphic representation π of GSp₄(𝔸_F) with central character χ whose transfer is Π. More precisely, if for each place v π_v is any element of the L-packet corresponding to (rec_p(Π_v), χ_v), then π := ⊗′_v π_v is automorphic and occurs with multiplicity one in the discrete spectrum; if moreover Π is algebraic, π is cuspidal.

F a totally real number field (BCGP work over totally real F; Calegari–Geraghty and Pilloni over ℚ); GSp₄ the split symplectic similitude group with similitude ν; π a discrete automorphic representation of GSp₄(𝔸_F) with central character ω_π. Π cuspidal of symplectic type with multiplier χ; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.descent_of_symplecticType`.

The first two statements are immediate from the multiplicity formula of [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification) (S_ψ = 1 for ψ = Π ⊠ 1). Cuspidality for algebraic Π: Clozel's purity lemma makes Π_∞ essentially tempered, and Wallach's criterion (a discrete representation with tempered archimedean component is cuspidal) applies.

Consumers: BCGP Lemma 8.3.2 (soluble descent of GSp₄ automorphy), Theorem 9.3.1 and §7.13.

([BCGP, potential modularity](#ref-bcgp-2021), Theorem 2.9.3, §2.9 PDF p.39; [BCGP, potential modularity](#ref-bcgp-2021), Proof of Theorem 2.9.3, PDF/printed p.39 (arXiv v3).)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); AutomorphicFormsOnReductiveGroups, Layer AF.4; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-archimedean-limit-packets"></a>
### 3.26 The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)

Let λ = (λ₁, 0; c) ∈ X*(T) + (2, 1; 0) with λ₁ > 0. The limits of discrete series of GSp₄(ℝ) with infinitesimal character λ attached to the two Weyl chambers positive for λ are π(λ)^h (containing the holomorphic and antiholomorphic limits of discrete series of Sp₄(ℝ)) and π(λ)^g (the generic one), and the archimedean L-packet containing π(λ)^h is {π(λ)^g, π(λ)^h} (Blasius–Harris–Ramakrishnan, Proposition 5.3.7). **Source boundary.** The two-member description is supplied through Pilloni §15.2.4, author p. 109, and Calegari–Geraghty Theorem 7.11, published pp. 854–855; the primary proof of Blasius–Harris–Ramakrishnan Proposition 5.3.7 remains a source gap. In Calegari–Geraghty's notation this is the packet {π(λ, C₀), π(λ, C₁)}, λ = (a − 1, 0; 4 − a), and for a global parameter ψ of general type the archimedean Arthur packet Π_{ψ_∞} is this L-packet.

λ=(λ₁,0;c) ∈ X*(T)+(2,1;0) with λ₁>0. In the integral triple convention this includes λ₁−3 ≡ c (mod 2). The character-lattice parity is Pilloni §5.1.1, author p. 20. For λ=(1,0;2) the holomorphic minimal Sp₄ K-type is (2,2); λ₁=0 is excluded, and λ=(1,0;1) fails the parity condition. The identification of Π_{ψ_∞} with the L-packet uses Arthur's classification ([The twisted weighted fundamental lemma](#arthur-dependency-gate)).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.limitPacket`.

Harish-Chandra parametrisation of (limits of) discrete series by Weyl chambers (AutomorphicFormsOnReductiveGroups). Blasius–Harris–Ramakrishnan Proposition 5.3.7 / Mok §3.1: the L-packet of the parameter with infinitesimal character λ. For general-type ψ=Π⊠ν₁, every Arthur SL₂ summand has dimension one. Thus ψ_∞ is trivial on that SL₂ and its Arthur packet is the L-packet (Wallach Theorem 2.1, as cited by CG). Triviality of the global S_ψ controls multiplicities; it does not imply triviality of an SL₂ action.

Pilloni's Proposition 15.2.4.1 and CG's Theorem 7.11 switch between π(λ)^h and π(λ)^g using these assertions.

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §15.2.4, proof of Proposition 15.2.4.1, p. 109 (author version); [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 7.11, point (2), publ. p. 855; arXiv v1 p. 41.)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [Archimedean reciprocity, sums and restriction](#archimedean-langlands-conventions); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="unitary-descent-of-gl4-transfer"></a>
### 3.27 The symplectic pairing through unitary descent

For a general-type cuspidal Siegel eigenform, construct the symplectic pairing on its Galois realization as in Calegari–Geraghty Lemma 6.9; an absolutely irreducible residual realization inherits the symplectic pairing. The unitary route must exhibit the algebraic twist producing a conjugate-self-dual parameter over a CM field, choose that CM restriction so that absolute irreducibility is preserved, apply the exact unitary descent theorem, and transport the Bellaïche–Chenevier pairing through the twist and restriction. Essential self-duality Π≅Π∨⊗ω by itself does not supply conjugate self-duality. The comparison maps and the pairing-transport theorem are targets of this assertion, with their specified coefficient and polarization data.

f of general type; K imaginary quadratic with r_f|_{G_K} absolutely irreducible. Conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate) (the transfer and Mok's descent).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.symplectic_of_unitaryDescent`.

Use the GSp₄→GL₄ transfer and its archimedean normalization. Apply the exact twist and unitary descent contract of ET.7, then transport the pairing and compare the residual form on a stable lattice.

The conclusion used by CG: r̄_m symplectic when absolutely irreducible.

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Lemma 6.9, §6.2, publ. p. 840 (copy p. 40); arXiv v1 p. 30.)

*Needs:* [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [Endoscopic classification for quasi-split unitary groups (Mok)](#mok-unitary-classification); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; AutomorphicGaloisRepresentationsPartII, Layer AG2.2; [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="limit-discrete-series-packet-types"></a>
### 3.28 Global packets with a holomorphic limit of discrete series at infinity are of general, Yoshida or Saito–Kurokawa type

Let π = π_f ⊗ π(λ)^h be a discrete automorphic representation of GSp₄(𝔸_ℚ) with λ = (λ₁, 0; c) ∈ X*(T)+(2,1;0), λ₁ > 0. Then its global Arthur packet is of general, Yoshida or Saito–Kurokawa type (Schmidt 2018, §§1.1–1.2, compared with the archimedean parameters of π(λ)^h in Schmidt 2017). If moreover the Hecke eigensystem of π_f is congruent to a non-Eisenstein maximal ideal (residual Galois representation irreducible), the packet is of general type, and then π_f ⊗ π(λ)^h is automorphic iff π_f ⊗ π(λ)^g is, both with multiplicity one (Pilloni, Proposition 15.2.4.1).

F = ℚ; λ ∈ X*(T)+(2,1;0), λ₁ > 0; the finite part is unramified outside Np with its Hecke character congruent to the fixed non-Eisenstein eigensystem of Pilloni §15.2; conditional on [The twisted weighted fundamental lemma](#arthur-dependency-gate).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.generalType_of_limitDiscreteSeries`.

Compare the archimedean parameter of π(λ)^h with the archimedean components allowed in each of Arthur's six types (Schmidt's tables). Yoshida and Saito–Kurokawa types give reducible Galois representations ([Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)](#non-general-type-reducible)), contradicting irreducibility of the residual representation. For general type: [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets) and parts (ii)–(iii) of [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification). The conclusion uses triviality of ψ on the Arthur SL₂ and does not assert the full Ramanujan temperedness of Π.

Calegari–Geraghty's proof of Theorem 7.11 excludes classes (b)–(f) by the same reducibility argument in weight (a, 2).

([Higher coherent cohomology and p-adic modular forms of singular weights](#ref-pilloni-2020), §15.2.4, Proposition 15.2.4.1 and proof, p. 109 (author version); [Schmidt, archimedean aspects](#ref-schmidt-2017), §2.3, pp. 2390–2391 (author PDF pp. 10–11); [Schmidt, packet structure](#ref-schmidt-2018), §§1.1–1.2, pp. 3088–3092.)

*Needs:* [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets); [Discrete representations of GSp₄ not of general type have reducible Galois representations (BCGP Lemma 2.9.1)](#non-general-type-reducible); [Arthur's classification of the discrete spectrum of GSp₄ (Arthur 2004; Gee–Taïbi)](#gsp4-arthur-classification); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="gsp4-gl4-archimedean-transfer"></a>
### 3.29 Infinitesimal character of the transfer of π_∞ from GSp₄(ℝ) to GL₄(ℝ) (Calegari–Geraghty Theorem 5.6)

Let µ = (a, b; c) be a dominant weight, w = −(a + b + 2c), and π = π^∞ ⊗ π_∞ a discrete automorphic representation of GSp₄(𝔸_ℚ) contributing to the coherent cohomology H^i(X, W_µ)_(2). Then (1) π_∞ has infinitesimal character χ_{(a−1, b−2; −w)}; (2) the transfer π̃_∞ of π_∞ to GL₄(ℝ) (the archimedean parameter composed with the spin embedding GSp₄(ℂ) ⊂ GL₄(ℂ)) has infinitesimal character χ_τ with τ = ((a+b−3−w)/2, (a−b+1−w)/2, (−a+b−1−w)/2, (−a−b+3−w)/2); (3) if π_∞ is tempered it is the (limit of) discrete series π((a−1, b−2; −w), C_i) for a chamber C_i.

F = ℚ; Calegari–Geraghty's normalisation of weights and of coherent cohomology (§5.3).

For the classification-dependent conclusion assume TWFL and the [trace formula and intertwining inputs](#trace-formula-inputs-register).

State the resulting comparison as `TauCeti.Arthur.GSp4.transfer_infinitesimalCharacter`.

(1) from the (𝔭, K)-cohomology computation of π_∞ ⊗ V_σ (Harris; CG §5.3). (2) the weights of the spin representation: with (λ₁, λ₂; λ₀) = (a−1, b−2; −w), τ = ((λ₁+λ₂+λ₀)/2, (λ₁−λ₂+λ₀)/2, (−λ₁+λ₂+λ₀)/2, (−λ₁−λ₂+λ₀)/2) (Sorensen §2.1.2). (3) tempered representations with regular-or-singular integral infinitesimal character are (limits of) discrete series.

CG Remark 5.12: for µ = (a, b), w = a + b − 6, τ = (0, −(b−2), −(a−1), −(a+b−3)) + (3/2)(1, 1, 1, 1), consistent with (2).

([Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Theorem 5.6(2), §5.3, publ. p. 829; quoted from arXiv v1 p. 22 PDF p.29; [Minimal modularity lifting for nonregular symplectic representations (with an appendix by F. Calegari, D. Geraghty and M. Harris)](#ref-cg-2020), Proof of Theorem 5.6, publ. p. 829 (copy p. 29).)

*Needs:* [Archimedean reciprocity, sums and restriction](#archimedean-langlands-conventions); [The archimedean L-packet of a limit of discrete series of GSp₄(ℝ)](#gsp4-archimedean-limit-packets); AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series); [C-ARTHUR](#contract-c-arthur); [C-AUTOMORPHIC](#contract-c-automorphic).

### Examples

For G=SO₃ the dual is Sp₂. The block 1⊠ν₂ has the required symplectic parity and trivial component group. Two one-dimensional quadratic blocks with b=1 have orthogonal parity and are excluded. For dual SO₃ a single odd-dimensional block has determinant-one sign kernel {0}; imposing only the central quotient would leave a spurious ℤ/2. With two odd blocks, the kernel is the diagonal {(0,0),(1,1)}. With no blocks it is the trivial full group.

### Dependencies

The layer uses the exact supplier contracts above, AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing), AutomorphicLFunctionsAndLocalFactors, Layer AL.4, AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula), EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, GL2AutomorphicRepresentationsAndTransfer, Layer R16.3, MetaplecticAutomorphicForms, Layer MP.3, TauCetiRoadmap.ClassFieldTheory, Layer 7, Layer 0, TauCetiRoadmap.ReductiveGroups, Layer 6, AutomorphicFormsOnReductiveGroups, Layer AF.1 (discrete series), AutomorphicGaloisRepresentations, Layer R19.2, AutomorphicFormsOnReductiveGroups, Layer AF.4, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, AutomorphicGaloisRepresentationsPartII, Layer AG2.2.

## Layer 4: symmetric powers, purity and equidistribution

<a id="level-one-symmetric-powers"></a>
### 4.1 Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)

For every n ≥ 2 and every regular algebraic cuspidal automorphic representation π of GL₂(𝔸_ℚ) of level 1, Sym^{n−1}π exists as a regular algebraic cuspidal automorphic representation of GL_n(𝔸_ℚ).

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2. π everywhere unramified.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_levelOne`.

n = 2 is trivial; for n ≥ 3 combine one-level-one-symmetric-power with level-one-ping-pong, then symmetric-power-lifting (Galois criterion).

Check on Δ (weight 12, level 1): Sym^{n−1}Δ exists for every n, so L(Sym^{n−1}Δ, s) is entire.

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, Theorem A, p. 2; §7, Theorem 7.7, p. 91 (arXiv v3).)

*Needs:* [One level-one form with automorphic Sym^{n−1} (NT I Theorem 7.6 = Theorem E)](#one-level-one-symmetric-power); [Symmetric powers for one level-one form give them for all (NT I Theorem 3.1 = Theorem D)](#level-one-ping-pong); [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="cm-and-weight-one-symmetric-powers"></a>
### 4.2 Symmetric powers of CM and weight-one forms (NT II Theorem A.1)

Let π be cuspidal on GL₂(𝔸_ℚ) with π_∞ a holomorphic limit of discrete series, or π the automorphic induction of a Hecke character of a quadratic field. Then Sym^nπ exists for every n ≥ 1 (usually not cuspidal).

π as stated.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_CM_weightOne`.

CM case: Sym^n of an induced representation decomposes into inductions of characters and characters. Weight one: the Artin image is dihedral, tetrahedral, octahedral or icosahedral; the icosahedral case uses Kim–Shahidi tensor-product and symmetric-power functoriality (Kim 2004, Theorem 6.4; cited).

Check the CM decomposition for n = 2 (symmetric-power-lifting test cm_not_cuspidal).

([Newton–Thorne II](#ref-newton-thorne-II), Appendix A, Theorem A.1 and proof, p. 28 (arXiv v2).)

*Needs:* [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); GL2AutomorphicRepresentationsAndTransfer, Layer R17.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="l-function-equidistribution-criterion"></a>
### 4.3 Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)

Let K be a compact group with conjugacy-class space X, x_i ∈ X with norms N(x_i) ≥ 2, such that ∏(1 − N(x_i)^{−s})^{−1} converges for Re s > 1 and continues to a neighbourhood of Re s ≥ 1 with no zeros or poles except a simple pole at 1, and for each irreducible ρ, L(s, ρ) = ∏ det(1 − ρ(x_i)N(x_i)^{−s})^{−1} continues likewise with no zeros or poles on Re s ≥ 1 except possibly at 1. Then #{i : N(x_i) ≤ n} ~ n/log n, Σ_{N(x_i)≤n}χ(x_i) = c(χ)n/log n + o(n/log n) with −c(χ) the order of vanishing of L(s, ρ) at 1; if at most boundedly many x_i share a norm, the x_i are Haar-equidistributed iff c(χ) = 0 for every nontrivial irreducible χ (Peter–Weyl/Weyl criterion).

K a compact group (a compact Lie group in the application); ρ irreducible continuous representations.

State the resulting comparison as `TauCeti.SymmetricPower.equidistributed_of_lFunctions`.

Prime-number-theorem argument for each L(s, ρ): logarithmic derivative, Wiener–Ikehara (AnalyticNumberTheory AN.2), Kedlaya Theorem 24.2. Peter–Weyl: finite linear combinations of irreducible characters are dense in the continuous class functions; orthogonality gives the integrals.

Check the Chebotarev instance: K finite, ρ irreducible, recovering Kedlaya §22.5.

([Notes on analytic number theory](#ref-kedlaya-ant-2025), §§24.1–24.3, Theorem 24.1, Theorem 24.2 and Conjecture 24.3, printed pp. 133–134.)

*Needs:* AnalyticNumberTheory, Layer AN.2; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6; `Matrix.trace`; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="one-prime-criterion"></a>
### 4.4 One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)

Let F be totally real and π a non-CM RAESDC automorphic representation of GL₂(𝔸_F) (π ≇ π ⊗ (χ ∘ det) for every non-trivial Hecke character χ), and n ≥ 1. The following are equivalent: (1) there is a cuspidal Π of GL_n(𝔸_F) with rec(Π_v) ≅ Sym^{n−1} ∘ rec(π_v) for every place v; (2) for every prime p and ι : Q̄_p ≅ ℂ, Sym^{n−1} r_{π,ι} is automorphic; (3) for some p and ι, Sym^{n−1} r_{π,ι} is automorphic ([Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate)).

F totally real; π non-CM RAESDC.

State the resulting comparison as `TauCeti.SymmetricPower.onePrime`.

Newton–Thorne Lemma 2.1 uses Clozel independence of embedding together with Galois conjugation of the automorphic representation: changing ι can replace π by σπ. Compare compatible Frobenius traces and use Chebotarev; do not claim that fixing π while changing ι is automatic.

Reduces symmetric power functoriality to automorphy of a single Galois representation.

([Newton–Thorne, Hilbert](#ref-nt-2026), Lemma 2.1, §2, p. 9; proof pp. 9–10 (arXiv v2).)

*Needs:* [Automorphic Galois representations in Newton–Thorne's sense](#nt26-automorphy-predicate); [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; TauCetiRoadmap.Chebotarev, Layer 10; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="large-residual-image-density-one"></a>
### 4.5 Large residual image for a density-one set of primes (Clozel–Thorne, Lemma 7.5)

Let E be an imaginary CM field and π a RACSDC automorphic representation of GL₂(𝔸_E) with Sym²π cuspidal. Then there is a set L of rational primes of Dirichlet density one such that for all l ∈ L and ι : Q̄_l ≅ ℂ, r̄_ι(π) is irreducible with image containing a conjugate of SL₂(F_l).

E imaginary CM; π RACSDC with Sym²π cuspidal.

State the resulting comparison as `TauCeti.SymmetricPower.largeImage`.

Irreducibility of r_ι(π) for density-one l ([Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one)) and the classification of subgroups of GL₂(F_l) (large image unless dihedral/exceptional, excluded by Sym²π cuspidal and potential diagonalizability inputs of BLGGT).

Used for the adequacy hypotheses in Proposition 7.6.

([Clozel–Thorne III](#ref-ct-2017), §7, Lemma 7.5 and proof, manuscript p. 48.)

*Needs:* [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="completed-symmetric-power-l-function"></a>
### 4.6 The completed symmetric power L-function Λ(Sym^n E, s)

For an elliptic curve E/ℚ and n ≥ 1, Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s), where L(Sym^n E, s) = ∏_p L_p(Sym^n E, s) is the Euler product of the local factors of Sym^n of the Weil–Deligne representation at p (at all p, including the bad ones), N_n is the conductor of Sym^n, and γ_n(s) is the archimedean factor of Sym^n of the Hodge structure of E (a product of Γ_ℂ(s − j) and, for n even, a Γ_ℝ factor), as in Dummigan–Martin–Watkins (2009). Removing the nowhere-vanishing entire factor N_n^{s/2} does not affect entireness but changes the functional equation's normalisation.

E/ℚ an elliptic curve; n ≥ 1.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.completedL`: Λ(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_eq`: Λ(Sym^n E, s) = N_n^{s/2} γ_n(s) L(Sym^n E, s).
- `TauCeti.SymmetricPower.completedL_entire_iff`: Λ(Sym^n E, s) is entire iff N_n^{−s/2}Λ(Sym^n E, s) is (the conductor factor never vanishes).
- `TauCeti.SymmetricPower.completedL_eq_automorphic`: If Sym^nπ_E exists, Λ(Sym^n E, s) = Λ(Sym^nπ_E, s − n/2) (with the unitary normalisation shift).

Local factors from the Weil–Deligne representation of Sym^n(H¹(E)) (Grothendieck's ℓ-adic monodromy). Archimedean factor from [Compatible-system Euler and gamma factors](#compatible-system-archimedean-factors) applied to Sym^n of the compatible system of E. Use Dummigan–Martin–Watkins §§2–3 for finite factors and conductors, and Martin–Watkins §4.2 for the real factor. At n=2 the conjugation sign on the middle line and the degree shift give Γ_ℝ(s)Γ_ℂ(s).

**Checks.**

- n = 1: Λ(Sym¹E, s) = N^{s/2}·2(2π)^{−s}Γ(s)·L(E, s).
- n = 0: Λ(Sym⁰E, s) = π^{−s/2}Γ(s/2)ζ(s), not entire.
- For n=2, γ₂(s)=Γ_ℝ(s)Γ_ℂ(s). Complex conjugation exchanges e and ē on H¹; it fixes the symmetric vector eē on the (1,1) line, so the middle sign is +1. Relative to (−1)¹ this selects Γ_ℝ(s−1+1)=Γ_ℝ(s). The exchanged (2,0),(0,2) pair supplies Γ_ℂ(s).
- Omitting a ramified Euler factor changes the completed function. For the modified expression no functional equation with the specified conductor and epsilon factor is guaranteed; agreement away from bad primes does not identify Λ.

For n = 1, Λ(Sym¹E, s) = N^{s/2}Γ_ℂ(s)L(E, s).

([Newton–Thorne II](#ref-newton-thorne-II), §1 Introduction, Corollary B, arXiv v2 p. 2 (Publ. IHÉS 134, p. 118); [Euler Factors and Local Root Numbers for Symmetric Powers of Elliptic Curves](#ref-dmw-2009), §§2–3, PDF pp.4–7 (printed pp.1314–1317); [Symmetric powers of elliptic curve L-functions](#ref-martin-watkins-2006), §4.2, PDF p.7.)

*Needs:* [Compatible-system Euler and gamma factors](#compatible-system-archimedean-factors); [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); [C-SYSTEM](#contract-c-system).

<a id="parallel-weight-and-clozel-purity"></a>
### 4.7 Parallel weight for GL₂ over CM fields, and Clozel's purity lemma

Let F be a number field and π a regular algebraic representation of GL₂(𝔸_F) of weight λ = (λ_{τ,1} ≥ λ_{τ,2})_τ. π has parallel weight if λ_{τ,1} − λ_{τ,2} is independent of τ, equivalently if π has a regular algebraic twist of weight (m − 1, 0)_τ for some m ≥ 1; it has parallel weight k ≥ 2 if that twist has weight (k − 2, 0)_τ. Clozel's purity lemma: for F imaginary CM and π cuspidal regular algebraic on GL₂(𝔸_F), λ_{τ,1} + λ_{τc,2} = w is independent of τ, so π is of parallel weight when F is imaginary quadratic (BCGNT §1.6).

F a number field (CM for the purity lemma); π regular algebraic.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.IsParallelWeight`: For an actual weight function λ:Hom(F,ℂ)→ℤ², the difference λ_{τ,1}−λ_{τ,2} is independent of τ. The Lean form is over any embedding-index type; attachment to π is supplied by AF.4.
- `TauCeti.SymmetricPower.parallelWeight`: At an embedding τ define k=λ_{τ,1}−λ_{τ,2}+2. For dominant weights k≥2; under IsParallelWeight it is independent of the chosen embedding.
- `TauCeti.SymmetricPower.IsParallelWeight.twist`: Adding the same algebraic character weight a_τ to both coordinates at τ preserves the weight-difference predicate, in both directions.
- `TauCeti.SymmetricPower.clozel_purity`: F imaginary CM, π cuspidal regular algebraic on GL₂: λ_{τ,1} + λ_{τc,2} is independent of τ.
- `TauCeti.SymmetricPower.isParallelWeight_of_imagQuadratic`: F imaginary quadratic ⇒ every cuspidal regular algebraic π on GL₂ has parallel weight.
- `TauCeti.SymmetricPower.parallelWeight_independent`: If the actual weight function is parallel, k computed at τ equals k computed at σ.

Definition by the weight λ; purity lemma: Clozel 1990, Lemme 4.9 (owner: AutomorphicFormsOnReductiveGroups AF.4).

**Checks.**

- On the one-element embedding-index type, every weight function has constant difference.
- The weight function (0,0) on two embeddings is parallel and has k=2. The elliptic-curve comparison requires its actual attached weight, not a supplied equality assumption.
- On two embeddings, weights (0,0) and (2,0), corresponding to Hilbert weights (2,4), fail the parallel predicate.

Every cuspidal Bianchi π (F imaginary quadratic) has parallel weight.

([BCGNT](#ref-bcgnt-2025), Definition 1.6.1 (Parallel Weight) and the following paragraph, §1.6 Notation, arXiv v3 p. 13 (= Definition 1.5.1, §1.5, published p. 11: arXiv numbering and pagination differ).)

*Needs:* AutomorphicFormsOnReductiveGroups, Layer AF.4; AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (regular algebraic of weight); [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry); [C-AUTOMORPHIC](#contract-c-automorphic).

<a id="purity-from-symmetric-powers"></a>
### 4.8 Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)

Let R be a very weakly compatible system of rank 2 of G_F with H_τ = {0, m} for all τ, and v₀ ∉ S a finite place. If for infinitely many n ≥ 1 there is a finite Galois F_n/F such that Sym^{n−1}R|_{F_n} is weakly automorphic of level prime to the places above v₀, then the roots α₁, α₂ of Q_{v₀}(X) satisfy |ια_i|² = q_{v₀}^m for every ι.

State the resulting comparison as `TauCeti.SymmetricPower.purity_of_symPowers`.

Jacquet–Shalika bound for the unitary cuspidal constituents of the weakly automorphic Sym^{n−1}R|_{F_n} at places above v₀ (AutomorphicLFunctionsAndLocalFactors AL.2/jacquet-shalika-satake-bound): |α|^{n−1} ≤ q^{(n−1)m/2 + 1/2} for infinitely many n, hence |α|² = q^m (using det).

The mechanism of [Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)](#symmetric-power-functoriality-implies-ramanujan) in the potential setting.

([BCGNT](#ref-bcgnt-2025), Lemma 6.1.3 and proof (Jacquet–Shalika bound [JS81, Cor. 2.5]), §6.1, arXiv v3 p. 58 (published p. 52; arXiv pagination differs).)

*Needs:* AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound); PotentialModularityAndCompatibleSystems, Layer R24.5:operations; [C-SYSTEM](#contract-c-system).

<a id="non-supercuspidal-symmetric-powers"></a>
### 4.9 Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)

Let π be a non-CM regular algebraic cuspidal π of GL₂(𝔸_ℚ) such that π_l has nonzero Jacquet module for every prime l. Then for every n ≥ 3, Sym^{n−1}r_{π,ι} is automorphic, so Sym^{n−1}π exists. In particular (Corollary C) for a semistable elliptic curve E/ℚ and each n≥1 the completed Λ(Sym^nE, s) is entire.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_of_not_supercuspidal`.

Proposition 8.2 (all ramified refinements n-regular) by induction on the number of ramified primes, reducing ramification along l-adic eigencurves (eigenvariety-propagation) down to level one (level-one-symmetric-powers). General π: n-regular-congruences gives π′ satisfying 8.2 with r̄_{π,ι} ≅ r̄_{π′,ι} and large image; pd-automorphy-lifting (BLGGT Theorem 4.2.1) transfers automorphy of Sym^{n−1}r_{π′,ι} to Sym^{n−1}r_{π,ι}. Corollary C: semistable E is modular (BCDT, Wiles) with Γ₀(N), N squarefree, so every π_l is unramified or Steinberg; Λ(Π, s) is entire for cuspidal Π (Godement–Jacquet, AL.2).

Check that Γ₀(N) with N squarefree gives only unramified or Steinberg π_l, never supercuspidal.

([Newton–Thorne I](#ref-newton-thorne-I), §8, Theorem 8.1, p. 91; Introduction, Theorem B and Corollary C, p. 2 (arXiv v3).)

*Needs:* [Congruences to n-regular forms (NT I Proposition 8.3)](#n-regular-congruences); [Automorphy of Sym^{n−1} is constant on eigencurve components (NT I Theorem 2.33)](#eigenvariety-propagation); [Symmetric power functoriality in level one (NT I Theorem 7.7 = Theorem A)](#level-one-symmetric-powers); PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bcgnt-potential-automorphy-det-cyclotomic"></a>
### 4.10 Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)

Let F be an imaginary CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m} (m ≥ 1) and det r_λ = ε^{−m}. Then R is pure of weight m, and for each n ≥ 1 there is a finite CM extension F_n/F, Galois over ℚ, such that Sym^{n−1}R|_{G_{F_n}} is automorphic. For m = 1 the argument simplifies to ACC+ Corollary 7.1.12 (Remark 6.2.2). Here automorphic has BCGNT Definition 6.1.2(2): all finite v outside S are unramified and match the common characteristic polynomial. Matching at the bad places is a separate requirement.

State the resulting comparison as `TauCeti.SymmetricPower.bcgnt_detCyclotomic`.

Theorem 6.2.4 supplies weak automorphy of arbitrarily high symmetric powers with a chosen good place kept unramified. Lemma 6.1.3 gives purity. Lemma 6.1.4 uses Chebotarev and Varma Theorem 1 to match at every v outside the original bad set S: purity makes the unramified principal series irreducible. This is automorphic in Definition 6.1.2(2), not a claim of full Weil–Deligne matching at bad places or strict compatibility there.

The heart of BCGNT's Theorem C.

([BCGNT](#ref-bcgnt-2025), Theorem 6.2.1 and proof, Remark 6.2.2, §6.2, arXiv v3 pp. 59–60 (published p. 53); ACC+ inputs also in the proof of Theorem 7.1.1, arXiv p. 69 (published p. 61).)

*Needs:* [Potential weak automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 6.2.4)](#potential-weak-automorphy-symmetric-powers); [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension); PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one); [Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers); AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="clozel-thorne-reductions"></a>
### 4.11 Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1

Let F be totally real, π a non-CM RAESDC representation of GL₂(𝔸_F), p≥5 prime and 0<r<p. Newton–Thorne Proposition 6.1 produces a soluble totally real E/F, ι:ℚ̄_p≅ℂ and RAESDC π′ on GL₂(𝔸_E) with all eight conditions: (1) Sym^{p+r−1}r_{π,ι} is automorphic exactly when Sym^{p+r−1}r_{π′,ι} is; (2) π′ has weight 0 and at each v|p is an unramified twist of Steinberg, hence ι-ordinary; (3) det r_{π′,ι}=ε⁻¹; (4) at some v₀, q_{v₀}≡−1 mod p and π′ is tamely dihedral of order p; (5) at some v₁, q_{v₁}≡1 mod p and π′ is an unramified twist of Steinberg; (6) π′_v is potentially unramified for v∤pv₁; (7) there are primes t₁,t₂>p^{a₀(p)} and places w₁,w₂ of residue characteristics p₁,p₂>3, unramified in E, such that π′_{wᵢ} is tamely dihedral of order tᵢ and p₁,p₂,t₁,t₂ are pairwise distinct; (8) let H/E be the ray class field of modulus (8) times all real places, and let S exclude w₁,w₂ and include the primes where π′ is ramified, where E/ℚ is ramified, or whose characteristic is 2 or 3. Then w₁ splits in H·E(S), and w₂ splits in H·E(S∪{w₁}). Here E(S) is the maximal abelian exponent-two extension unramified outside S, as in §5, p. 38; a₀(p)≥3 is a threshold with the adequacy property of Lemma 2.3, p. 11. None of these local conditions is replaced by potential diagonalizability.

For a fixed degree d≥1, Clozel–Thorne Theorem 7.1 assumes symmetric-power automorphy for every non-CM RAESDC GL₂ representation over F, and concludes a cuspidal GL_{d+1} lift for every non-CM cuspidal π essentially square-integrable at infinity. Its local comparison is at every finite place. This yields the analytic continuation and functional equation of its symmetric-power L-function.

Lemma 7.4 starts with such π and a quadratic imaginary CM E/F for which π_E is cuspidal. It produces a continuous Hecke character χ making π_E⊗χ RACSDC. After a unitary normalization, its infinity type is (z/|z|)^{m_τ}, with p_v+m_τ odd and χχᶜ=ω_π⁻¹∘N_{E/F}; χ itself need not be algebraic. Proposition 7.6 assumes degree-d automorphy for all non-CM RAESDC GL₂ representations over F and concludes it for every non-induced RACSDC GL₂ representation over E. Its proof chooses ℓ>2(d+2), split in E and unramified in the field and representation, with residual image containing a conjugate of SL₂(𝔽_ℓ) and Hodge span at most ℓ−2. A finite character φ makes r̄(Π)⊗φ invariant under complex conjugation and supplies an odd extension to G_F. The potentially diagonalizable lifting and soluble descent theorems then apply to that representation. For discrete-series infinity, non-CM induction is equivalent to a cuspidal symmetric square.

State the resulting comparison as `TauCeti.SymmetricPower.clozelThorne_reductions`.

Soluble base change and descent (EndoscopicTransferAndUnitaryTraceComparison ET.7a; PotentialAutomorphyInfrastructurePartII PL.0/soluble-descent); BLGGT Theorem 4.2.1 (PL.5/pd-automorphy-lifting) and Theorems 4.4.1, 5.5.2 ([Change of weight and level (Theorem 4.4.1)](#change-of-weight-and-level), [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one)). Moret-Bailly to realise the local conditions at v₀, v₁ over a soluble extension.

Every symmetric-power endpoint over totally real or CM fields uses one of these reductions.

([Newton–Thorne, Hilbert](#ref-nt-2026), Proposition 6.1, §6, pp. 45–46; proof pp. 46–49 (arXiv v2); also proof of Theorem 6.5, p. 50; [Clozel–Thorne III](#ref-ct-2017), §7, Lemma 7.4, manuscript p. 47; [Clozel–Thorne III](#ref-ct-2017), §7, Proposition 7.6 and proof, manuscript p. 49; [Clozel–Thorne III](#ref-ct-2017), Theorem 7.1, manuscript p. 46; Lemma 7.4 and proof, pp. 47–48; Proposition 7.6 and proof, p. 49.)

*Needs:* EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent); PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting); [Change of weight and level (Theorem 4.4.1)](#change-of-weight-and-level); [Irreducibility of r_{l,ı}(π) for density-one l (Theorem 5.5.2)](#irreducibility-density-one); [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="acc-purity-rank-two"></a>
### 4.12 Purity and analytic continuation for rank-two systems of weight zero over CM fields (ACC+, Corollary 7.1.13)

ACC+ Corollary 7.1.13: for a CM field F and an irreducible rank-2 very weakly compatible system R with H_τ={0,1}, R is pure of weight 1. For every m≥0 the partial symmetric-power L-function has meromorphic continuation and the completed function with the stated degree≤m+1 bad factors satisfies a functional equation. If R is strongly irreducible and m>0, then L^S(ι Sym^m R,s) is holomorphic and nonzero for Re s≥1+m/2. The m=0 function has the Dedekind-zeta pole at s=1; it is not covered by nonvanishing/holomorphy. The non-CM elliptic-curve specialization supplies Sato–Tate with its compact-group criterion.

F CM; R irreducible of rank 2 with Hodge–Tate numbers {0, 1}.

State the resulting comparison as `TauCeti.SymmetricPower.acc_purity`.

Potential automorphy of all Sym^m R (ACC+ Theorem 7.1.11, Corollary 7.1.12, assembled from [The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)](#acc-auxiliary-primes) and [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers)). Purity: unitary cuspidal π_{ι,m} and the Jacquet–Shalika bound ([Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers)).

Over ℚ this recovers Sato–Tate for elliptic curves ([The Sato–Tate theorem for elliptic curves over ℚ](#sato-tate-elliptic-curves)). Negative control: m=0 gives ζ_F and its pole at 1, so unconditional holomorphy on Re s≥1 would be false.

([ACC+](#ref-acc-2023), §7.1, Corollary 7.1.13, arXiv v2 p. 201 (Annals p. 1096); [ACC+](#ref-acc-2023), §7.1, proof of Corollary 7.1.13, arXiv v2 p. 202 (Annals p. 1097).)

*Needs:* [The auxiliary primes l₁, l₂ for symmetric powers over CM fields (ACC+ Assumption 7.2.6)](#acc-auxiliary-primes); [Potential automorphy of the symmetric powers of a non-CM elliptic curve over ℚ (ACC+, Corollary 7.2.4)](#acc-elliptic-symmetric-powers); [Purity from potential weak automorphy of symmetric powers (BCGNT Lemma 6.1.3)](#purity-from-symmetric-powers); [Compatible-system Euler and gamma factors](#compatible-system-archimedean-factors); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="serre-equidistribution-criterion"></a>
### 4.13 Serre's equidistribution criterion through L-functions of representations of ST(π)

Let ST be a compact group and ([π_v])_{v ∉ S} conjugacy classes indexed by the finite places. For an irreducible representation ρ of ST put L^S(π, ρ, s) = ∏_{v ∉ S} det(1 − q_v^{−s}ρ([π_v]))^{−1}, absolutely convergent for Re s > 1. If for every non-trivial irreducible ρ, L^S(π, ρ, s) has meromorphic continuation to ℂ, holomorphic and non-vanishing on Re s = 1, then the [π_v] are equidistributed for the Haar probability measure of ST (Serre, Ch. I, Appendix). This is the general form of [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion).

ST compact; L-functions as stated.

State the resulting comparison as `TauCeti.SymmetricPower.serre_criterion`.

Peter–Weyl: finite linear combinations of irreducible characters are uniformly dense in the continuous conjugation-invariant functions (Tau Ceti CompactGroups layers 5–6). Character limits and uniform approximation give the general class-function limit. Wiener–Ikehara/Tauberian theorem for each L^S(π, ρ, s) (AnalyticNumberTheory AN.2).

For ST = SU(2) and ρ = Sym^n it is [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion).

([BCGNT](#ref-bcgnt-2025), Proof of Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62; arXiv pagination differs).)

*Needs:* [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); AnalyticNumberTheory, Layer AN.2; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5; TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="bianchi-modular-forms"></a>
### 4.14 Bianchi modular forms, their Fourier coefficients and parabolic cohomology

Let F be imaginary quadratic. A cuspidal Bianchi modular eigenform of weight k ≥ 2 and level 𝔫 is a vector-valued function on GL₂(𝔸_F) generating a regular algebraic cuspidal automorphic representation π of parallel weight k (the infinitesimal character of π_∞ is that of (Sym^{k−2} ⊗ \overline{Sym^{k−2}})^∨), with Fourier expansion f((t z; 0 1)) = |t|_F Σ_{α ∈ F^×} c(αtδ_F, f) W(αt_∞) e_F(αz), coefficients c(I, f) vanishing unless I ⊂ O_F and normalised by c(O_F, f) = 1. Its Hecke eigenvalues also occur in the parabolic cohomology H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (Eichler–Shimura–Harder).

F imaginary quadratic; k ≥ 2; 𝔫 a non-zero ideal.

The interface should expose the following operations and comparisons.

- `TauCeti.SymmetricPower.BianchiEigenform`: A cuspidal Bianchi eigenform of weight k and level 𝔫.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff`: The Fourier coefficient c(I, f).
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_one`: c(O_F, f) = 1.
- `TauCeti.SymmetricPower.BianchiEigenform.coeff_eq_eigenvalue`: For 𝔭 ∤ 𝔫, c(𝔭, f) is the T_𝔭-eigenvalue.
- `TauCeti.SymmetricPower.BianchiEigenform.toAutRep`: The cuspidal automorphic representation of GL₂(𝔸_F) generated by f (parallel weight k).

Definition through the automorphic representation (Clozel's purity forces parallel weight; [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity)). Fourier expansion via the Whittaker model (Hida; Williams). Comparison with cohomology: Harder's Eichler–Shimura isomorphism (owner: ArithmeticLocallySymmetricSpaces).

**Checks.**

- A modular elliptic curve over F of conductor 𝔫 without CM by F gives a weight-2 Bianchi eigenform with c(𝔭, f) = N(𝔭) + 1 − #E(F_𝔭).
- c(I, f) = 0 for I ⊄ O_F.
- Bianchi forms are not holomorphic functions on a Hermitian domain: ℍ³ is not Hermitian, so there is no q-expansion in holomorphic exponentials; the expansion involves the Bessel-type Whittaker function W.

The objects of Theorems E–G.

([BCGNT](#ref-bcgnt-2025), §1.3 Bianchi Modular Forms, arXiv v3 pp. 9–11 (published pp. 8–10; arXiv pagination differs).)

*Needs:* [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity); ArithmeticLocallySymmetricSpaces, Layer ALS.3; [C-COHERENT-GEOMETRY](#contract-c-coherent-geometry).

<a id="cg18-conditional-sato-tate"></a>
### 4.15 Conditional Sato–Tate for elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(2))

Assume Calegari–Geraghty's Conjecture B. Let F be any number field and E/F a non-CM elliptic curve. Then the Sato–Tate conjecture holds for E. Status: conditional ([Assertions with explicit hypotheses](#endpoint-status-register)).

Hypothesis: Conjecture B.

State the resulting comparison as `TauCeti.SymmetricPower.cg18_satoTate`.

Potential automorphy of all symmetric powers ([Conditional potential modularity of odd symmetric powers of elliptic curves (Calegari–Geraghty §10)](#cg18-odd-symmetric-powers) with the tensor product trick and [Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))](#cg18-conditional-potential-modularity)) and the equidistribution criterion ([Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion)) with Brauer induction.

Not unconditional: potential automorphy alone does not prove equidistribution without the analytic step (acceptance of Layer 4).

([Modularity lifting beyond the Taylor–Wiles method](#ref-cg-2018), Theorem 1.1(2), §1, p. 3 (arXiv v2) = Invent. p. 300; reduction in §10, p. 97 (arXiv v2) = Invent. p. 428.)

*Needs:* [Conditional potential modularity of elliptic curves over arbitrary number fields (Calegari–Geraghty, Theorem 1.1(1))](#cg18-conditional-potential-modularity); [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); [Assertions with explicit hypotheses](#endpoint-status-register); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="non-cm-symmetric-powers"></a>
### 4.16 Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)

Let π be a regular algebraic, cuspidal, non-CM automorphic representation of GL₂(𝔸_ℚ). Then for every n ≥ 1, Sym^nπ exists as a regular algebraic cuspidal automorphic representation of GL_{n+1}(𝔸_ℚ). In particular (Corollary B), for every elliptic curve E/ℚ without CM and n ≥ 2, Λ(Sym^nE, s) is entire.

π a cuspidal automorphic representation of GL₂(𝔸_ℚ), regular algebraic (from a holomorphic newform of weight k ≥ 2) unless said otherwise; r_{π,ι} : G_ℚ → GL₂(Q̄_p) its Galois representation (Tate-normalised: WD(r_{π,ι}|_{G_{ℚ_l}})^{F-ss} ≅ rec^T(ι^{−1}π_l)); n ≥ 2.

State the resulting comparison as `TauCeti.SymmetricPower.symPower_nonCM`.

Induction on #sc(π), the primes where π_p is supercuspidal; sc(π) = ∅ is non-supercuspidal-symmetric-powers. Killing ramification: a "seasoned" good-dihedral π′ (with an auxiliary Steinberg prime r so that r_{π′,ι_q} has large image) congruent to π with sc(π′) = sc(π) ∖ {p}; symmetric-power-automorphy-lifting transfers automorphy (NT II Theorem 3.1, Propositions 3.7–3.11). Corollary B: modularity of elliptic curves over ℚ (BCDT) and Godement–Jacquet.

Check the scope: CM forms and weight-one forms are excluded here and handled by cm-and-weight-one-symmetric-powers.

([Newton–Thorne II](#ref-newton-thorne-II), Introduction, Theorem A and Corollary B, pp. 1–2; §3, Theorem 3.1, p. 20 (arXiv v2).)

*Needs:* [Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers); [Automorphy lifting for symmetric powers (NT II Theorem 2.1)](#symmetric-power-automorphy-lifting); [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); AutomorphicLFunctionsAndLocalFactors, Layer AL.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="all-regular-symmetric-powers"></a>
### 4.17 Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)

SP_n holds for all n ≥ 2: for every totally real F and every non-CM cuspidal regular algebraic π of GL₂(𝔸_F), Sym^{n−1}π exists as a RAESDC automorphic representation of GL_n(𝔸_F), in each of the senses of [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion).

F totally real; π non-CM, cuspidal, regular algebraic.

State the resulting comparison as `TauCeti.SymmetricPower.sp_all`.

Induction on n ≥ 6, with the cases n ≤ 5 known ([Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers)). Write n = p + r with p ≥ 5 prime and 0 < r < p (Bertrand); Proposition 6.1 ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)) reduces to π′ with the local conditions; Newton–Thorne's level-raising and tensor-product theorems (§§3–5; owners: the Part II extensions SymmetricPowersByUnitaryLevelRaising and SymmetricPowersByTensorFunctorialityLifting, requiring the exact supplier contract) give automorphy of Sym^{p+r−1}r_{π′,ι} from SP_p, SP_r and SP_{p−r}.

SP_6 recovers Clozel–Thorne's Sym⁵ without their disjointness hypothesis.

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem 6.4 and its proof, §6, p. 50 (arXiv v2).)

*Needs:* [The statement SP_n (Newton–Thorne, Conjecture B)](#sp-statement); [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); [One prime suffices for symmetric power functoriality (Newton–Thorne, Lemma 2.1)](#one-prime-criterion); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sym6-sym8"></a>
### 4.18 Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)

Let F be totally real and (π, χ) a RAESDC automorphic representation of GL₂(𝔸_F) not automorphically induced from a quadratic CM extension. (1) If F ∩ ℚ(ζ₅) = ℚ, Sym⁶π exists as a cuspidal automorphic representation of GL₇(𝔸_F). (2) If F ∩ ℚ(ζ₇) = ℚ, Sym⁸π exists as a cuspidal automorphic representation of GL₉(𝔸_F). Theorem 6.1 is reduced to Theorem 6.2 (level raising for Sym^{n−1} of a Steinberg-at-q form) by reference to Clozel–Thorne II §6; the level-raising method is owned by the Part II extension SymmetricPowersByUnitaryLevelRaising.

F totally real with the stated disjointness; π RAESDC, not CM.

State the resulting comparison as `TauCeti.SymmetricPower.sym6_sym8`.

Reduction to Theorem 6.2 ([CT15, §6]) and potential automorphy inputs from BLGGT (Layer 2) — use the exact level-raising export from SymmetricPowersByUnitaryLevelRaising.

Superseded for totally real F by [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers), which removes the disjointness.

([Clozel–Thorne III](#ref-ct-2017), §6, Theorem 6.1 (= Theorem 1.1), manuscript p. 44 (Theorem 1.1 on p. 2).)

*Needs:* [Symmetric power lifts Sym^{n−1}π over a number field](#symmetric-power-lift-over-number-fields); [Potential automorphy of potentially diagonalizable polarized representations (Theorem 4.5.1)](#potential-automorphy-theorem); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="nt21-semistable-l-functions"></a>
### 4.19 Analytic continuation of symmetric power L-functions of semistable elliptic curves (Newton–Thorne I, Corollary C)

Let E/ℚ be a semistable elliptic curve. Then for every n ≥ 2 the completed symmetric power L-function Λ(Sym^n E, s) ([The completed symmetric power L-function Λ(Sym^n E, s)](#completed-symmetric-power-l-function)) admits an analytic continuation to ℂ.

E/ℚ semistable (hence non-CM).

State the resulting comparison as `TauCeti.SymmetricPower.semistable_entire`.

Theorem B of Newton–Thorne I ([Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers)): no local component of π_E is supercuspidal. Godement–Jacquet for the cuspidal Sym^nπ_E and the comparison of completed L-functions (Layer 0).

Superseded by Newton–Thorne II Corollary B (all non-CM E).

([Newton–Thorne I](#ref-newton-thorne-I), Introduction, Corollary C, arXiv v3 p. 2 (Publ. IHÉS 134, p. 2).)

*Needs:* [Symmetric powers when no local component is supercuspidal (NT I Theorem 8.1 = Theorem B, Corollary C)](#non-supercuspidal-symmetric-powers); [The completed symmetric power L-function Λ(Sym^n E, s)](#completed-symmetric-power-l-function); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bcgnt-symmetric-powers-purity"></a>
### 4.20 Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)

Let F be a CM field and R a strongly irreducible very weakly compatible system of rank 2 of G_F with H_τ = {0, m}, m ≥ 1. Then R is pure of weight m and for each n ≥ 1 there is a finite CM F′/F, Galois over ℚ, with Sym^{n−1}R|_{G_{F′}} automorphic. If R is irreducible but not strongly irreducible, R is pure of weight m and each Sym^{n−1}R is a direct sum of automorphic compatible systems of dimension ≤ 2.

F CM; R as stated.

State the resulting comparison as `TauCeti.SymmetricPower.bcgnt_theoremC`.

Follow BCGNT Theorem 7.2.1: normalize the determinant using the rank-one Hecke character, the finite-order square after quadratic CM base change, and twisting, as in Theorem 7.1.1. Apply Theorem 6.2.1 and undo the twist on the resulting automorphic systems. In the irreducible but not strongly irreducible branch use ACC+ Lemma 7.1.2 to express the system as induction of algebraic Hecke characters. Distinct Hodge–Tate weights exclude Artin up to twist. Decompose each symmetric power into induced rank-two systems and, in even symmetric degree, a rank-one system; use rank-one purity and automorphic induction.

Theorem C of BCGNT.

([BCGNT](#ref-bcgnt-2025), Theorem 7.2.1 and proof, §7.2, arXiv v3 p. 69 (published pp. 61–62); Theorem C, §1, arXiv p. 4 (published p. 4).)

*Needs:* [Purity and potential automorphy of symmetric powers when det r_λ = ε^{−m} (BCGNT Theorem 6.2.1)](#bcgnt-potential-automorphy-det-cyclotomic); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sato-tate-elliptic-curves"></a>
### 4.21 The Sato–Tate theorem for elliptic curves over ℚ

Let E/ℚ be an elliptic curve without complex multiplication, and for good p let α_p be the root of X² − a_pX + p with nonnegative imaginary part and θ_p = arg(α_p/√p) ∈ [0, π]. Then (θ_p) is equidistributed for (2/π)sin²θ dθ, the push-forward of Haar measure on SU(2).

E/ℚ non-CM (End E = ℤ).

State the resulting comparison as `TauCeti.SymmetricPower.satoTate_elliptic`.

K = SU(2): classes are diag(e^{iθ}, e^{−iθ}), Haar measure is the Sato–Tate measure, and the irreducible representations are the Sym^n (Kedlaya §24.5). L(s, Sym^n) = L(Sym^nE, s + n/2) (shift of the abscissa by n/2) is the L-function of the cuspidal Sym^nπ_E (non-cm-symmetric-powers), hence entire and nonvanishing on Re s ≥ 1 after the shift (Jacquet–Shalika, AL.3); for n ≥ 1 there is no pole, so c(χ) = 0. Apply l-function-equidistribution-criterion. (Historically: Clozel–Harris–Shepherd-Barron–Taylor for non-integral j via potential automorphy; Barnet-Lamb–Geraghty–Harris–Taylor for all non-CM E over totally real fields.)

Check the Haar-measure computation: the Weyl integration formula for SU(2) gives (2/π)sin²θ dθ on [0, π] using ∫₀^π sin²θ dθ = π/2. Check that potential automorphy suffices: meromorphic continuation with no zeros or poles on Re s ≥ 1 (Layer 2) already gives Sato–Tate; Newton–Thorne's entireness is not needed.

([Notes on analytic number theory](#ref-kedlaya-ant-2025), §§24.4–24.5, Conjecture 24.4 and Theorems 24.5–24.6, printed pp. 134–135.)

*Needs:* [Equidistribution from L-functions (Kedlaya Theorem 24.2 and the Weyl criterion)](#l-function-equidistribution-criterion); [Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)](#non-cm-symmetric-powers); AutomorphicLFunctionsAndLocalFactors, Layer AL.3; [Meromorphic continuation, functional equation and purity for compatible systems (Corollary 5.4.3)](#compatible-system-l-function-continuation); EllipticCurveModularity, Layer R29.6; [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="hilbert-symmetric-powers"></a>
### 4.22 Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))

Let F be totally real and π a cuspidal automorphic representation of GL₂(𝔸_F) without CM such that π_∞ is essentially square-integrable (each π_v, v | ∞, a twist of a discrete series of weight k_v ≥ 2; the parity of k_v may vary). Then for every n ≥ 2 there is a cuspidal automorphic representation Π_n of GL_n(𝔸_F) with rec(Π_{n,v}) ≅ Sym^{n−1} ∘ rec(π_v) at every place v. These π are those of cuspidal non-CM Hilbert modular forms of weights k_v ≥ 2.

F totally real; π non-CM with discrete-series archimedean components (mixed parity allowed).

State the resulting comparison as `TauCeti.SymmetricPower.hilbert`.

Same parity: π is regular algebraic up to twist; [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers). Mixed parity: Clozel–Thorne Theorem 7.1 reduces to the RAESDC case over a CM extension ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)).

For F = ℚ it recovers Newton–Thorne II Theorem A ([Symmetric power functoriality for all non-CM modular forms (NT II Theorem A, Corollary B)](#non-cm-symmetric-powers)).

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem A, §1, p. 1 = Theorem 6.5(1), §6, p. 50 (arXiv v2).)

*Needs:* [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); AutomorphicGaloisRepresentations, Layer R19.2; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="cm-field-symmetric-powers"></a>
### 4.23 Symmetric powers of conjugate self-dual GL₂ representations over CM fields (Newton–Thorne, Theorem 6.5(2))

Let E be a CM field and π a RAECSDC automorphic representation of GL₂(𝔸_E) not automorphically induced from a quadratic extension. Then for every n ≥ 2 Sym^{n−1}π exists: there is a cuspidal Π_n of GL_n(𝔸_E) with rec(Π_{n,w}) ≅ Sym^{n−1} ∘ rec(π_w) for every place w.

E CM; π RAECSDC, not dihedral.

State the resulting comparison as `TauCeti.SymmetricPower.cmField`.

Clozel–Thorne Proposition 7.6: descend to the maximal totally real subfield via an auxiliary character and an odd extension, apply [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers) there, and base change back ([Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions)).

Over an imaginary quadratic field this covers conjugate self-dual Bianchi forms, not general Bianchi forms ([The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)](#bianchi-sato-tate) covers those up to potential automorphy).

([Newton–Thorne, Hilbert](#ref-nt-2026), Theorem 6.5(2) and its proof, §6, p. 50 (arXiv v2).)

*Needs:* [Symmetric power functoriality for all non-CM regular algebraic GL₂ representations over totally real fields (Newton–Thorne, Theorem 6.4)](#all-regular-symmetric-powers); [Reductions for symmetric powers: Clozel–Thorne's Theorem 7.1, Lemma 7.4, Proposition 7.6 and Newton–Thorne's Proposition 6.1](#clozel-thorne-reductions); EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="symmetric-powers-up-to-eight"></a>
### 4.24 Symmetric powers up to eight and holomorphy of L(s, Sym^n π) (Clozel–Thorne, Corollary 7.2)

Let F be totally real, π cuspidal on GL₂(𝔸_F) with π_∞ essentially square-integrable, not induced from a quadratic CM extension. Then there is a cuspidal Π on GL_{r+1}(𝔸_F) with Sym^r rec(π_v) ≅ rec(Π_v) for all finite v in each case: (1) any F, 1 ≤ r ≤ 4; (2) F ∩ ℚ(ζ₅) = ℚ, r ∈ {5, 6}; (3) F ∩ ℚ(ζ₃₅) = ℚ, r = 7; (4) F ∩ ℚ(ζ₇) = ℚ, r = 8. Consequently (Corollary 1.3) L(s, Sym^n π) is entire with the expected functional equation for n ≤ 8 under the corresponding disjointness.

State the resulting comparison as `TauCeti.SymmetricPower.upToEight`.

(1): [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); (2)–(4): [Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)](#sym6-sym8) and the reductions of Theorem 7.1 (mixed parity). Holomorphy: Godement–Jacquet for the cuspidal Π (AutomorphicLFunctionsAndLocalFactors AL.2).

Superseded by [Symmetric power functoriality for Hilbert modular forms (Newton–Thorne, Theorem A = Theorem 6.5(1))](#hilbert-symmetric-powers), which needs no disjointness.

([Clozel–Thorne III](#ref-ct-2017), §7, Corollary 7.2, manuscript pp. 46–47 (Corollaries 1.2, 1.3 on p. 2).)

*Needs:* [Sixth and eighth symmetric powers over totally real fields (Clozel–Thorne, Theorem 6.1)](#sym6-sym8); [Symmetric powers of GL₂ of rank at most five (SP_n for n ≤ 5)](#low-rank-symmetric-powers); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-ramanujan"></a>
### 4.25 The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)

Let F be an imaginary CM field and π a regular algebraic cuspidal automorphic representation of GL₂(𝔸_F) of parallel weight. Then π_v is essentially tempered at every finite place v. After the algebraic Hecke-character twist that makes the weight (k−2,0) at every embedding, with k≥2, its unramified rec^T Satake eigenvalues α_v,β_v have absolute value N(v)^((k−1)/2). In the untwisted statement write w=λ_{τ,1}+λ_{τc,2}; the eigenvalues of rec(π_v)(Frob_v), normalized by q_v^(−w/2), have absolute value one. Parallel weight determines the difference of the two λ-coordinates, not their sum before the twist.

F imaginary CM; π cuspidal regular algebraic of parallel weight.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_ramanujan`.

Clozel purity gives λ_{τ,1}+λ_{τc,2}=w. Parallel weight then makes λ_{τ,2}+λ_{τc,2} constant, so an algebraic Hecke-character twist normalizes the weights to (k−2,0). After a quadratic CM base change the finite-order central character is a square; a further finite-order twist normalizes the determinant to ε^(1−k). Use the rank-two classification into strongly irreducible, induced and Artin-up-to-twist systems. Distinct Hodge–Tate weights exclude the Artin branch. Rank-one purity handles induction, and BCGNT Theorem 6.2.1 handles the strongly irreducible branch. The proof of Theorem 7.1.1 makes a further soluble base change to reduce the ramified-place assertion to unramified purity, using ACC+ Corollary 7.1.15. Import the exact local–global compatibility and soluble base-change exports; do not infer full ramified WD compatibility merely from good-place purity.

Weight 2 recovers ACC+ Theorem 1.0.2.

([BCGNT](#ref-bcgnt-2025), Theorem 7.1.1 and proof, §7.1, arXiv v3 pp. 68–69 (published p. 61); Theorem A, §1, arXiv p. 3 (published p. 3).)

*Needs:* [Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity); [Parallel weight for GL₂ over CM fields, and Clozel's purity lemma](#parallel-weight-and-clozel-purity); AutomorphicGaloisRepresentationsPartII, Layer AG2.2; AutomorphicGaloisRepresentationsPartII, Layer AG2.5; [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="sato-tate-group"></a>
### 4.26 The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field

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
### 4.27 The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)

Let F be imaginary quadratic, f a cuspidal Bianchi eigenform of level 𝔫 and weight k normalised by c(O_F, f) = 1, and 𝔭 a prime ideal not dividing 𝔫. Then |c(𝔭, f)| ≤ 2N(𝔭)^{(k−1)/2}.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_coeff_bound`.

c(𝔭, f) = α + β with α, β the Satake parameters scaled by N(𝔭)^{(k−1)/2}; [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan) gives |α| = |β|.

Weight 2 gives the Hasse-type bound |c(𝔭, f)| ≤ 2√N(𝔭).

([BCGNT](#ref-bcgnt-2025), Theorem E, §1.3, arXiv v3 p. 10 (published p. 8; arXiv pagination differs).)

*Needs:* [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-mass-equidistribution"></a>
### 4.28 Mass equidistribution for level-one Bianchi eigenforms of growing weight (BCGNT Theorem G)

Let F be imaginary quadratic of class number one and Γ = SL₂(O_F). For any sequence of level-one Bianchi eigenforms f of weight tending to ∞, the normalised measures μ_f on Γ\ℍ³ (Marshall) converge weakly to the normalised hyperbolic volume.

F imaginary quadratic of class number one; level one.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_massEquidistribution`.

Marshall's Corollary 3 is conditional on the Ramanujan bound for the forms involved; [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan) supplies it.

An application of Theorem A to quantum unique ergodicity in the weight aspect.

([BCGNT](#ref-bcgnt-2025), Theorem G and proof, §1.3, arXiv v3 p. 11 (published p. 10; arXiv pagination differs).)

*Needs:* [The Ramanujan conjecture in parallel weight over imaginary CM fields (BCGNT Theorem A = Theorem 7.1.1)](#bianchi-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

<a id="bianchi-sato-tate"></a>
### 4.29 The Sato–Tate conjecture in parallel weight over imaginary CM fields (BCGNT Theorem B = Theorem 7.2.3)

Let F be an imaginary CM field and π a cuspidal regular algebraic representation of GL₂(𝔸_F) of parallel weight, not CM, with ω_π = |·|^{−w}ψ. Let S_π be the set of finite places where π is ramified. Then the classes [π_v] ∈ ST(π), v ∉ S_π, are equidistributed for the Haar probability measure of ST(π).

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_satoTate`.

Serre's criterion ([Serre's equidistribution criterion through L-functions of representations of ST(π)](#serre-equidistribution-criterion)): for non-trivial irreducible ρ of ST(π), ρ is (a twist of) Sym^{n−1} ⊗ det^k; potential automorphy of Sym^{n−1}R_π ([Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity)) with Brauer induction and the Jacquet–Shalika non-vanishing on Re s = 1 (AutomorphicLFunctionsAndLocalFactors AL.3) give the analytic properties.

For elliptic curves over CM fields it recovers ACC+ Theorem 1.0.1's Sato–Tate.

([BCGNT](#ref-bcgnt-2025), Theorem 7.2.3, §7.2, arXiv v3 p. 70 (published p. 62); Theorem B, §1, arXiv p. 3 (published p. 3).)

*Needs:* [The Sato–Tate group ST(π) of a non-CM regular algebraic GL₂ representation over a CM field](#sato-tate-group); [Serre's equidistribution criterion through L-functions of representations of ST(π)](#serre-equidistribution-criterion); [Purity and potential automorphy of symmetric powers of rank-two systems over CM fields (BCGNT Theorem 7.2.1 = Theorem C)](#bcgnt-symmetric-powers-purity); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one); AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing); [C-EQUIDISTRIBUTION](#contract-c-equidistribution).

<a id="bianchi-parabolic-cohomology-ramanujan"></a>
### 4.30 The Ramanujan bound for Hecke eigenvalues on parabolic cohomology of Bianchi groups (BCGNT Theorem F)

Let F be imaginary quadratic, 𝔫 ≠ 0, k ≥ 2, and H_par ⊂ H¹(Γ₁(𝔫), Sym^{k−2}ℂ² ⊗ \overline{Sym^{k−2}ℂ²}) (or the sum over the components when h_F > 1). For a principal prime 𝔭 ∤ 𝔫 and an eigenvalue a_𝔭 of T_𝔭 on H_par, |a_𝔭| ≤ 2N(𝔭)^{(k−1)/2}.

State the resulting comparison as `TauCeti.SymmetricPower.bianchi_cohomology_bound`.

Eichler–Shimura–Harder: H_par is spanned by Bianchi eigenforms ([Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms)); apply [The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)](#bianchi-fourier-ramanujan).

The cohomological form used for computations.

([BCGNT](#ref-bcgnt-2025), Theorem F, §1.3, arXiv v3 p. 11 (published p. 9; arXiv pagination differs).)

*Needs:* [The Ramanujan bound for Fourier coefficients of Bianchi eigenforms (BCGNT Theorem E)](#bianchi-fourier-ramanujan); [Bianchi modular forms, their Fourier coefficients and parabolic cohomology](#bianchi-modular-forms); [C-GALOIS](#contract-c-galois); [C-AUTOMORPHIC](#contract-c-automorphic); [C-SYSTEM](#contract-c-system).

### Examples

For a non-CM elliptic curve, the degree-two motivic symmetric power has real factor Γ_ℝ(s)Γ_ℂ(s), and the automorphic GL₃ function uses s−1. Degree zero instead gives the completed zeta function and has poles. At SU(2) the standard conjugacy class diag(e^{iθ},e^{−iθ}) has trace 2cos θ; Haar pushes forward to (2/π)sin²θ dθ on [0,π]. Integrating 1 gives one, and the nontrivial SU(2) characters have mean zero. Determinant characters of ST(π) must also be tested when the determinant has nontrivial finite order.

### Dependencies

The layer uses the exact supplier contracts above, GL2AutomorphicRepresentationsAndTransfer, Layer R17.5, AnalyticNumberTheory, Layer AN.2, TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 5, TauCetiRoadmap.RepresentationTheory.CompactGroups, Layer 6, `Matrix.trace`, Layer 0, Layer 1, AutomorphicGaloisRepresentationsPartII, Layer AG2.2, TauCetiRoadmap.Chebotarev, Layer 10, Layer 2, PotentialModularityAndCompatibleSystems, Layer R24.5 (residual irreducibility density one), AutomorphicFormsOnReductiveGroups, Layer AF.4, AutomorphicGaloisRepresentationsPartII, Layer AG2.0 (regular algebraic of weight), AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound), PotentialModularityAndCompatibleSystems, Layer R24.5:operations, PotentialAutomorphyInfrastructurePartII, Layer PL.5 (pd automorphy lifting), AutomorphicLFunctionsAndLocalFactors, Layer AL.2, [C-LOCAL-DEFORMATION](#contract-c-local-deformation) (the required lifting extension), AutomorphicGaloisRepresentationsPartII, Layer AG2.5, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.7a, PotentialAutomorphyInfrastructurePartII, Layer PL.0 (soluble descent), ArithmeticLocallySymmetricSpaces, Layer ALS.3, AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (global godement jacquet), AutomorphicLFunctionsAndLocalFactors, Layer AL.3, EllipticCurveModularity, Layer R29.6, AutomorphicGaloisRepresentations, Layer R19.2, AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (strong multiplicity one), AutomorphicLFunctionsAndLocalFactors, Layer AL.3 (rs boundary nonvanishing).

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

A known instance (e.g. G′ = GL₂, G = GL₃, ρ = Sym²: [Gelbart–Jacquet: the symmetric square (adjoint) lift from GL₂ to GL₃](#gelbart-jacquet)) proves Functoriality for that triple only.

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

(Local descent) For F_v local and τ_v an irreducible square-integrable representation of GL_{2n}(F_v) with L(s, τ_v, ∧²) having a pole at s = 0, the descent π_v of τ_v to Mp_{2n}(F_v) relative to ψ_v (Ginzburg–Rallis–Soudry; Ichino–Lapid–Mao Theorem 3.1) is irreducible, genuine, ψ_v-generic and square-integrable. (Proposition A.1) Given a number field F, a non-empty finite set S of non-archimedean places, v₀ ∉ S non-archimedean and such τ_v for v ∈ S ∪ {v₀} with τ_{v₀} supercuspidal, there is an irreducible cuspidal T on GL_{2n}(𝔸_F) with T_v = τ_v there, T_v principal series at the other finite places outside S_∞, L(s, T, ∧²) having a pole at s = 1 and L(1/2, T) ≠ 0.

For the globalization clause of Proposition A.2 require that θ_{ψ_{v₀}}(π_{v₀}) is supercuspidal, with the other local square-integrability and central-character hypotheses stated above.

State the resulting comparison as `TauCeti.Functoriality.localDescent_mp`.

Descend τ_v locally, globalise the generic square-integrable genuine representations of Mp_{2n} (Gan–Ichino Proposition A.2), lift through the theta correspondence to SO_{2n+1} and then by [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer) to GL_{2n}. Ichino–Lapid–Mao Proposition 4.3/4.6 give T_v = τ_v.

Used by Gan–Ichino to produce cuspidal T with non-vanishing central value for their Theorem 1.4.

([The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), Appendix A, proof of Proposition A.1, pp. 29–30 (arXiv v3); published pp. 1001–1002; [The Shimura–Waldspurger correspondence for Mp_2n](#ref-gan-ichino-2018), Appendix A, proof of Proposition A.1, p. 30 (arXiv v3); published p. 1002.)

*Needs:* [Generic transfer from split classical groups to GL_N and its image (Cogdell–Kim–Piatetski-Shapiro–Shahidi; Ginzburg–Rallis–Soudry)](#ckpss-generic-transfer); MetaplecticAutomorphicForms, Layer MP.3; [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

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

<a id="categorical-local-langlands-conjecture"></a>
### 5.7 The categorical local Langlands conjecture of Fargues–Scholze (frontier statement)

Fargues–Scholze Conjecture I.10.2. Let E be a nonarchimedean local field with residue characteristic p and cardinality q, ℓ≠p, and G quasi-split. Choose a Borel B, a generic character ψ:U(E)→O_L^× for an algebraic L/ℚ_ℓ, and √q∈O_L. If d=|π₀Z(G)|, put Λ=O_L[1/d]. Let W_ψ on the neutral stratum Bun_G^1 be the sheaf of c-Ind_{U(E)}^{G(E)}ψ. Extend the spectral action on W_ψ by colimits to Φ:Ind Perf^{qc}(Z¹(W_E,Ĝ)_Λ/Ĝ)→D_lis(Bun_G,Λ). Its canonical right adjoint is fully faithful on compact objects and induces the Perf(Z¹(W_E,Ĝ)_Λ/Ĝ)-linear equivalence D_lis(Bun_G,Λ)^ω≃D_coh,Nilp^{b,qc}(Z¹(W_E,Ĝ)_Λ/Ĝ). The target consists of bounded complexes with coherent cohomology, quasicompact support and nilpotent singular support. This is a conjecture about stable ∞-categories and a specified adjunction. The established semisimple parameter map does not supply it. The torus case is known in Zou Theorem 6.4.1 over ℤ_ℓ (ℓ≠p), using the canonical action on the unique Whittaker sheaf; Theorem 6.4.5 proves t-exactness and Remark 6.4.7 gives scalar extension. For tori the square-root choice is unnecessary. This known specialization does not settle the assertion for a general quasi-split group.

Exactly the field, group, Whittaker, square-root and coefficient conditions in the statement. Inverting d is necessary for the spectral action constructed in the cited edition.

The interface should expose the following operations and comparisons.

- `TauCeti.Functoriality.CategoricalLLC`: The canonical Whittaker spectral-action right adjoint induces the compact/coherent equivalence with the stated singular-support and coefficient conditions.
- `TauCeti.Functoriality.CategoricalLLC.implies_semisimple`: CatLLC is compatible with the semisimple parametrisation of Fargues–Scholze (part of the statement).
- `TauCeti.Functoriality.CategoricalLLC.torus`: Zou Theorem 6.4.1: for any E-torus T and ℓ≠p, the canonical Whittaker spectral-action functor identifies the bounded coherent quasicompact nilpotent-support side with compact D_lis(Bun_T,ℤ_ℓ). It is t-exact (6.4.5), extends by scalars (6.4.7), and needs no √q.

Definition of the proposition as stated by Fargues–Scholze, Conjecture I.10.2; the objects are owned by the geometrisation roadmaps.

**Checks.**

- For GL₁, Bun strata are indexed by ℤ. The canonical equivalence identifies a compact complex on a fixed degree stratum with a perfect complex on the corresponding character-gerbe weight piece; the parameter and Bernstein-center actions agree with local class field theory.
- For GL₂, the Weil–Deligne data with r=|·|^{1/2}⊕|·|^{−1/2} and N=0 or N of rank one have the same semisimple Weil part and different monodromy. The categorical parameter/support interface must distinguish these points; the semisimple assignment alone cannot supply that distinction.
- After Ind-completion or restriction to a connected component, the structure sheaf is sent to the Whittaker sheaf by Φ. Neither global sheaf is falsely required to have quasicompact support on all components.

No instance of LLC(G, E) or of Functoriality is inferred from it in this roadmap.

([Geometrization of the local Langlands correspondence](#ref-fargues-scholze-2021), §I.10, Conjecture I.10.2, p. 38 (arXiv:2102.13459v4); [The categorical form of Fargues’ conjecture for tori](#ref-zou-2024), Theorems 6.4.1, 6.4.5 and Remark 6.4.7, pp. 25–27.)

*Needs:* [The local Langlands conjecture for a general reductive group (frontier statement)](#local-langlands-conjecture-general); ExcursionOperatorsAndSpectralAction, Layer ES5 (parameter of an irreducible smooth representation); [Assertions with explicit hypotheses](#endpoint-status-register); [C-CATEGORICAL](#contract-c-categorical).

<a id="symmetric-power-functoriality-implies-ramanujan"></a>
### 5.8 Symmetric power functoriality implies the Ramanujan bound (Langlands' argument)

Let π be a unitary cuspidal automorphic representation of GL₂(𝔸_F). If for every n ≥ 1 the lifts Symⁿπ and Symⁿπ^∨ have compatible unitary cuspidal realizations, or isobaric realizations all of whose cuspidal constituents are unitary (it suffices to have such realizations over finite extensions of F), then π_v is tempered at every place v where π is unramified (Ramanujan): from the Rankin–Selberg L-functions L(s, Symⁿπ × Symⁿπ^∨) and the Jacquet–Shalika bound |α| < q_v^{1/2} for the Satake parameters of unitary cuspidal representations of GL_{n+1} one gets |α_v|^n < q_v^{1/2} for all n, hence |α_v| = 1.

π unitary cuspidal on GL₂. For unbounded positive n, Sym^nπ has a compatible unitary cuspidal realization, or an isobaric realization whose constituents are all unitary cuspidal; the potential version has such realizations over finite extensions. Arbitrary nonunitary isobaric automorphy alone is insufficient for the Satake bound.

State the resulting comparison as `TauCeti.Functoriality.ramanujan_of_symPower`.

Apply the Jacquet–Shalika bound to unitary cuspidal constituents, with the actual unramified local symmetric-power compatibility. This bounds |α_v|^n by q_v^{1/2} for unbounded n. For a place w|v of residue degree f in a potential field, the parameters become α_v^f and the norm becomes q_v^f; cancel f from |α_v|^{fn}<q_v^{f/2}. Base change does not preserve raw absolute values. Apply the same estimate to both Satake parameters (or to the dual) and use unitarity of the determinant to conclude |α_v|=1.

ACC+ prove Ramanujan for weight-zero regular algebraic π over CM fields this way; BCGNT for Bianchi forms (Layer 4).

([ACC+](#ref-acc-2023), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2); [ACC+](#ref-acc-2023), §1, paragraph after Theorem 1.0.2, p. 3 (arXiv:1812.09999v2).)

*Needs:* [Langlands' principle of functoriality (frontier statement)](#functoriality-conjecture); [The symmetric power lifting Sym^{n−1}π](#symmetric-power-lifting); AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound); [Cyclic base change and soluble descent](#cyclic-base-change-gln); [C-AUTOMORPHIC](#contract-c-automorphic); [C-GALOIS](#contract-c-galois).

### Examples

The identity L-homomorphism fixes each Satake conjugacy class, and composition of two all-place lifts composes their local parameters. For a character of GL₁ the local parameter is one-dimensional; for SL₂ packet fibers can have several members, so a bijection is not the general local Langlands predicate. Cyclic induction from a Galois-invariant character is noncuspidal and cannot supply the generic cuspidal conclusion of descent.

### Dependencies

The layer uses the exact supplier contracts above, Layer 1, Layer 3, AutomorphicLFunctionsAndLocalFactors, Layer AL.4, Layer 0, TauCetiRoadmap.ReductiveGroups, Layer 6, EndoscopicTransferAndUnitaryTraceComparison, Layer ET.6, AutomorphicSpectralTheory, Layer AS.6 (invariant trace formula), MetaplecticAutomorphicForms, Layer MP.3, ExcursionOperatorsAndSpectralAction, Layer ES5 (parameter of an irreducible smooth representation), AutomorphicLFunctionsAndLocalFactors, Layer AL.2 (jacquet shalika satake bound).

## Downstream consumers

Siegel modularity and abelian-surface modularity consume the classical packet, descent, weight-change and symplectic-pairing comparisons. Automorphic L-function applications consume the common-extension potential-automorphy and all-place symmetric-power results. Rank-two CM arithmetic consumes the purity and Sato–Tate conclusions. Each consumer keeps the field, irreducibility, local-condition and trace formula hypotheses of the theorem it uses.

## References

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
- Henry H. Kim (Appendix 1 by D. Ramakrishnan; Appendix 2 by H. Kim and P. Sarnak). [Functoriality for the exterior square of GL4 and the symmetric fourth of GL2](https://www.ams.org/journals/jams/2003-16-01/S0894-0347-02-00410-1/S0894-0347-02-00410-1.pdf). J. Amer. Math. Soc. 16 (2003), no. 1, 139–183 (AMS PDF, free)

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
