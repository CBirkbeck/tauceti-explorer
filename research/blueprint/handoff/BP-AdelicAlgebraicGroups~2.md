# BP-AdelicAlgebraicGroups~2 handoff

Completed planning pass for [issue #6917](https://github.com/CBirkbeck/tauceti-explorer/issues/6917), by Codex, session `codex-x2g9X8`, on 2026-10-08. This is a completed revision for independent review, not a checkpoint or an implementation claim.

The packet has 262 declarations: 26 definitions, 23 constructions, 133 lemmas and 80 theorems; 231 API items, 148 tests, 25 planets and 110 pinned baseline declarations. All 49 definitions/constructions have at least three semantic tests. All six stages are **planned**; none is closed. There are 17 exact mathematical gaps and 21 supplier contracts. Every original 204 node ID survives, and 58 new lemma-level nodes expose previously missing inputs.

The packet, reader and suggested file are synchronized. All implementation statuses remain `unchecked`. The latest independent `review` and both `reviewHistory` records are preserved. The historical 65 verified, 10 corrected, 3 added and 126 unverifiable verdicts describe the old input, not acceptance of this revision. The narrow review of FIX-RT-AREA-automorphic-1~4 remains `needs_changes` pending this blueprint revision; it must not be read as acceptance of the whole packet.

## What this revision changes

- **AA.0:** reuses the pinned restricted-product carriers/topology, adds positive absolutely convergent rescaling and exceptional-set independence, and tests actual finite product and split measures. Finite rescaling requires finite nonzero factors. Local normalized Haar and directed gluing have explicit signatures. The SL₂ good-place volumes show why eventual equality to one is insufficient.

- **AA.1:** spreads finitely many Hopf generators, relations, structural maps and identities over S-integers; enlarging S compares actual Hopf models. Separates algebraic point comparisons from evaluation-topology theorems. Restriction of scalars must be natural in the value algebra, group morphism, identity and extension tower. The finite-supported embedding uses the identity at infinity. The code imports the pinned convolution points functor rather than replacing it.

- **AA.2:** replaces the nonnormal quotient shortcut by closed homogeneous-space topology, compact lifts, continuous fibre averaging, compact cutoffs, right-Haar exchange, a positive functional and Riesz–Markov–Kakutani/Tonelli. With the pinned modular convention, left Haar equals δ⁻¹ times right Haar. Central-character spaces use measurable Hermitian lines, a Borel section/cocycle and the covariant completion; a compatible character extension and twist precede compact Fourier decomposition. Closedness of XΓ is separated through the actual adjoint quotient.

  Gauge forms reuse the pinned identity cotangent space and adjoint action. The algebraic right-translation signature is native; its differential-form-section comparison is a separate structural obligation. Restriction of scalars specifies the finite Jacobian, the real factor 2⁻ᵇ|det|⁻¹ and complex factor |det|⁻², with the product |d_F|^[E:F]/2|d_E|⁻¹/2. For ℚ(√5), the integral local basis at 5 has coordinate volume one, while the archimedean comparison contributes 1/√5. The number-field Tamagawa formula uses λ_v=L_v of the geometric character representation, a positive leading coefficient, the discriminant factor and canonical additive measures. Rosengarten’s function-field formula is not used as a number-field proof.

- **AA.3:** breaks the mathematical cycles by separating primitive GL_n/ideal-class reduction, closed-orbit realization, squared-weight estimates, lattice-intersection finiteness, real overlap and transfer to parabolic domains. Those precede class-number and adelic covering consumers. Separates Iwasawa factorization from its δ⁻¹ Jacobian and the quasi-invariant P\G integration formula. Heights use closed algebraic embeddings with inverse coordinates; properness and polynomial rational counting have different inputs. Fixed-K containment is decomposed using Orr’s Cartan-stable and zero-weight arguments and the corrected rational pullback in BGST §28, Proposition 28.1, pp. 14–15. Reduced forms use the full positive cone, scalar invariance and uniformly quantified Cholesky bounds. Changing K conjugates the argument of the horospherical map; the SL₂ example distinguishes the two resulting heights.

- **AA.4:** keeps Rapinchuk’s closure lemma over ℚ_p, isolates the actual number-field arithmetic Lie-closure argument, excludes graph Lie algebras and separates finite-index elimination. Local/global simply connected cohomology and general approximation obstructions remain exact gaps. Neatness uses closed faithful algebraic representations, tensor/subquotient transfer, a stable p-adic lattice, root-of-unity distances and congruence bounds; relative-level signatures quantify every rational intersection.

  Level quotients retain the actual canonical topology, properness and compact-modulo-A_G stabilizer hypotheses. Full stabilizers differ from effective stabilizers and give different masses. Normal levels yield a canonical principal U/U′ action; disconnected covers can have a larger full deck group. Hecke translation is finite-supported, and Cartesian base change requires U′L=U. Abelianization uses integral Lang/Hensel lifts at almost all places and the actual central derived cover. Residual compactness and quadratic-kernel limits have separate class-field/Fourier inputs; quaternion norm topology remains explicit.

- **AA.5:** the GL₁ logarithmic unit lattice has a genuine full-rank lattice condition, not just a rank count. Torus-factor translations act trivially on cohomology while Hecke maps can permute components. GL₂ keeps SO(2) and O(2) conventions distinct: for principal level N=3 there are two raw upper-half-plane components and one folded component. Definite quaternion mass keeps full/effective automorphisms distinct and the Eichler index at 3 equal to four. Hurwitz class-number and unit enumeration are recorded as concrete remaining inputs.

## Earlier corrections retained and checked

The ten corrections made by REV-AdelicAlgebraicGroups remain in force: exceptional compact neighbourhoods in restricted Haar finiteness; all exceptional factors in its modular product; closed/nonopen idele squares; the finite-level hypothesis for the narrow class-group comparison; the asymmetric Gram bound; nonzero finite invariant Radon measure in finite-index arguments; a division uniformizer for odd norm valuation; actual norm-one finiteness for definite quaternion arithmetic subgroups; raw Möbius action on both half-planes; and right translates Vgₙ for left rational orbits. The three reviewer-added topology/inversion/action comparison nodes retain their IDs. Source locators and pinned baseline hypotheses were rechecked rather than reverting these repairs.

The accepted RS-04 ownership is retained: AA.0 owns Haar measures on already supplied restricted products, AA.3 owns generic adelic reduction and proper algebraic heights, and AF.0 is narrowed. No Schwartz–Bruhat theory is planned here. The assigned findings are handled as follows:

- `RT-AREA-automorphic-1/7`: the exact characteristic-zero nonarchimedean Kneser–Tits/Tits-simplicity/no-finite-index package is requested from RG2.4 and consumed in AA.4. Native-field arithmetic closure and anisotropic finite-index issues are separately exposed.
- `RT-AREA-automorphic-1/28`: AA.4 owns algebraic neatness and all-rational-intersection neat levels, imports no cyclic Shimura existence theorem, and supplies ALS.0/D5/V0 consumers. Their own packets still need to import this owner; they are not edited here.
- `RT-AREA-geomlanglands/12`: AA.0 supplies only generic restricted-product Haar infrastructure; the division-algebra-specific/function-field automorphic continuation belongs to its named owner. No duplicate restricted-product or automorphic theory was added.

## Validation and prototype limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdelicAlgebraicGroups.json`: **0 errors, 0 warnings**, status complete.
- An `errata-v1` projection with the packet’s roadmap ID, source issues and source versions passed `scripts/check_errata.py`. The complete blueprint is not itself an errata-format file.
- Semantic audits check all original IDs, unchanged independent review/history, prerequisite acyclicity, definition APIs/tests, source hashes, names in the suggested file and the four allowed deliverable paths. `git diff --check` passes.
- The full suggested file **did not compile**. `lean-check` stopped at the first import because the shared build lacks the object file for `TauCeti.Algebra.AlgebraicGroup.PointsFunctor`. Its Mathlib commit is the required pin; its Tau Ceti build is not a complete build of the required pin. No library build, cache download, language server, source inlining or substitute project was started.
- The final Mathlib-only block passed `lean-check` with exit 0 and 125 warnings, all “declaration uses sorry”. To reproduce that check, retain the Mathlib imports and the declarations before the comment beginning “AA.1 uses the actual Tau Ceti convolution group”, excluding the Tau Ceti imports. The checked block’s SHA-256 was `722c6e36309327e76adb6c0a2d96d2b367dc2e8d652a3a7f2a14799de99549da`; its header was subsequently expanded with the standard roadmap note, without changing signatures. This verifies only that block, not the import-dependent signatures.

The suggested file accounts by name for every declaration, API item and test. It has 173 named native declarations, including 99 of the 231 API names, and native examples for 51 of the 148 test names. The remaining names have precise §13 mathematical contracts and the missing canonical structural language/supplier. No arbitrary proposition, topology, algebraic cover, local measure or point-group representation is substituted for a condition that cannot yet be stated. All import-dependent signatures still need elaboration in a complete pinned build; the catalogue is not a claim that all tests have run.

## Where the next work resumes

The first step is independent review of this completed revision, including the corrected conventions, naturality contracts, primitive reduction order and §13 omissions. The precise open inputs are below; the packet’s `neededBy` lists are the resume points. Filling an input must update its consuming proof chains and coverage, then use the supplier’s canonical structures in the suggested file.

### 1. Measures of gauge forms on nonarchimedean analytic groups

Defining |ω|_v on G(F_v) for a nonarchimedean local field F_v needs the F_v-analytic manifold structure of G(F_v) for smooth G and the change-of-variables formula μ(ψ(U)) = ∫_U |det Dψ|_v dμ for F_v-analytic diffeomorphisms ψ between open subsets of F_v^d. Mathlib has the inverse function theorem over complete normed fields and the real change-of-variables theorem, but not its p-adic analogue, and no layer of the atlas plans it (searched: 'analytic manifold', 'p-adic Lie', 'change of variables'). The archimedean case is covered by Mathlib's real change of variables.

Resume at: `AdelicAlgebraicGroups:AA.2/local-form-measure`, `AdelicAlgebraicGroups:AA.2/weil-volume-formula`.

### 2. Leading coefficient of Artin L-functions at s = 1

For a connected group G whose character module X*(G_{F̄}) has nontrivial Galois action, the constant ρ_G needs the meromorphic continuation of the Artin L-function L(X, s) to a neighbourhood of s = 1 and the nonvanishing at s = 1 of L(σ, s) for the nontrivial irreducible constituents σ (Brauer induction and the nonvanishing of Hecke L-functions at s = 1). No layer of the atlas plans Artin L-functions of number fields in this generality (atlas search 'Artin L' finds only function-field and Iwasawa layers), and the libraries lack them. The split case (trivial Galois action), which covers GL_n, split tori and every semisimple group, uses only the residue of the Dedekind zeta function (Mathlib).

Resume at: `AdelicAlgebraicGroups:AA.2/convergence-factors`, `AdelicAlgebraicGroups:AA.2/tamagawa-measure`.

### 3. Orders of finite reductive groups (Steinberg's formula)

The finite-field order estimate #𝓗(k_v)q_v^{-d}L_v(X,1)=1+O(q_v^{-2}) uniformly at good reductive places is requested from Tau Ceti ReductiveGroups layer 9, the finite-group/model owner. Its Steinberg/Bruhat/Lang proof is not supplied by the pinned libraries. GL_n and SL_n have the explicit elementary counts in this packet; the general estimate is a supplier obligation, not an adelic measure theorem.

Resume at: `AdelicAlgebraicGroups:AA.2/tamagawa-convergence`.

### 4. Cartan's closed-subgroup theorem for p-adic analytic groups

The openness of the p-adic closure of a Zariski-dense subgroup (Rapinchuk Lemma 2.7) uses Cartan's theorem that a closed subgroup of a p-adic analytic group is an analytic subgroup with a Lie algebra, together with the irreducibility of the adjoint representation of an absolutely almost simple group. Neither library has p-adic analytic groups and no atlas layer plans this theorem (searched 'Cartan', 'p-adic Lie', 'analytic group').

Resume at: `AdelicAlgebraicGroups:AA.4/zariski-dense-closure-open`.

### 5. Borel density theorem

Zariski density of infinite S-arithmetic subgroups of absolutely almost simple groups with G_S noncompact (Platonov–Rapinchuk Theorem 4.10, cited by Rapinchuk §2.4) is planned in no layer and absent from the libraries; Platonov–Rapinchuk is not freely available and the proof (Furstenberg's projective-measure argument) is not read here.

Resume at: `AdelicAlgebraicGroups:AA.4/borel-density`.

### 6. Kneser's and Harder–Chernousov's Galois-cohomology theorems

Kneser's vanishing of H¹(F_v, G) for simply connected semisimple G at nonarchimedean v, the Hasse principle of Kneser–Harder–Chernousov and weak approximation for simply connected groups (Platonov–Rapinchuk Theorems 6.4, 6.6, 7.8, cited by Harpaz–Wittenberg §6) are stated here with their exact hypotheses, but their proofs (classification-based, using Bruhat–Tits theory and case-by-case work for E8) are not decomposed: the book is not freely available and no atlas layer plans the classification of simply connected groups over local and global fields.

Resume at: `AdelicAlgebraicGroups:AA.4/kneser-local-torsor`, `AdelicAlgebraicGroups:AA.4/hasse-principle-simply-connected`, `AdelicAlgebraicGroups:AA.4/weak-approximation-simply-connected`.

### 7. Central measurable sections and character extension

The exact Borel-section theorem for Polish-group homogeneous quotients, the topological isomorphism X/(X∩Γ)→XΓ/Γ when XΓ is closed, identification of the covariant completion with measurable square-integrable associated-line sections, and extension of continuous characters of closed LCA subgroups still require source-complete analytic decomposition. The density and strong-continuity proof now uses the corrected subordinate-function argument from Bekka–de la Harpe–Valette Appendix E.1; its measurable-model identification remains a separate input.

Resume at: `AdelicAlgebraicGroups:AA.2/central-associated-line`, `AdelicAlgebraicGroups:AA.2/central-measurable-section`, `AdelicAlgebraicGroups:AA.2/central-l2-completeness`, `AdelicAlgebraicGroups:AA.2/central-character-extension-twist`.

### 8. Number-field Tamagawa and Artin analytic inputs

Equation (48) in Gordon is a number-field torus source, whereas Rosengarten §3 is function-field only. The canonical formula here fixes λ_v=L_v(X,1), the positive leading coefficient ρ_G, |d_F|^{-d/2}, and the additive local measures. The general finite-image Artin positive leading coefficient at s=1 and its ramified induction determinant argument still need a source-complete proof. The reductive order estimate is requested from the finite-group owner.

Resume at: `AdelicAlgebraicGroups:AA.2/convergence-factors`, `AdelicAlgebraicGroups:AA.2/tamagawa-convergence`, `AdelicAlgebraicGroups:AA.2/artin-factor-induction`, `AdelicAlgebraicGroups:AA.2/tamagawa-restriction-scalars`.

### 9. Squared-weight estimate for closed real orbits

Decompose Borel–Harish-Chandra §§5.1–5.3 into the minimum-norm/Cartan squared-weight estimate and properness of the closed-orbit map modulo the stabilizer. These analytic representation lemmas are not supplied by a discrete∩compact argument or by the later adelic orbit theorem. The weight-bound node exposes this primitive input instead of using the consumer.

Resume at: `AdelicAlgebraicGroups:AA.3/closed-orbit-weight-bound`.

### 10. Primitive real reduction and transfer to parabolic Siegel sets

Hermite–Minkowski reduction for arbitrary n, its bounded-denominator real Siegel overlap estimate, and the transfer from self-adjoint GL_n intersections to the specified parabolic domains need their full lemma proofs. The Mathlib modular-domain result proves only rank one. For disconnected groups additionally supply the compact component quotient and a Levi/semidirect covering; these are not inferred from the final class-number theorem.

Resume at: `AdelicAlgebraicGroups:AA.3/gln-real-reduction`, `AdelicAlgebraicGroups:AA.3/gln-real-overlap`, `AdelicAlgebraicGroups:AA.3/siegel-covering-adelic`, `AdelicAlgebraicGroups:AA.3/real-siegel-finite-overlap`, `AdelicAlgebraicGroups:AA.3/class-number-finite`.

### 11. Geometry-of-numbers height counting

Supply the projective/affine number-field height-counting proof: polynomial ideal-norm counting, ideal-class representatives, a unit logarithmic fundamental domain and a uniform lattice-box count. The count node isolates those inputs; a compact height ball and discrete rational points prove finiteness but cannot prove a polynomial bound.

Resume at: `AdelicAlgebraicGroups:AA.3/rational-coordinate-height-count`.

### 12. Levi extension of adelic volume and invariant-measure criterion

For connected nonreductive and disconnected linear groups, prove the Levi/unipotent product integration and compact component-quotient reduction before using the general finite-volume criterion. The reductive proof and its split-centre decomposition alone do not cover these groups.

Resume at: `AdelicAlgebraicGroups:AA.3/finite-volume`, `AdelicAlgebraicGroups:AA.3/finite-volume-criterion`.

### 13. Real root-intersection and pivot estimates

Finish the root-contraction/parabolic-normalizer lemma for intersections of deep Siegel domains (Orr–Schnell §D, Lemma 3, pp. 1234–1236), extend it to the stated distinct nonminimal parabolics, and prove the Cholesky pivot bounds in the reduced-form dictionary. The finite root-cone containment nodes do not imply these intersection estimates.

Resume at: `AdelicAlgebraicGroups:AA.3/deep-distinct-parabolics`, `AdelicAlgebraicGroups:AA.3/incompatible-morphism-obstruction`, `AdelicAlgebraicGroups:AA.3/reduction-siegel-dictionary`, `AdelicAlgebraicGroups:AA.3/reduced-form`.

### 14. Arithmetic closure and anisotropic finite quotients

Supply the trace-field/restriction-of-scalars Lie argument for the full S-integral group over a number field, exclude graph Lie subalgebras between distinct finite places, and eliminate arithmetic finite quotients at anisotropic compact factors. These three inputs are isolated in arithmetic-native-lie-closure and arithmetic-finite-index-elimination. Rapinchuk §2.6 reads only the ℚ single-isotropic-prime branch and refers the general proof to an uncleared book.

Resume at: `AdelicAlgebraicGroups:AA.4/arithmetic-native-lie-closure`, `AdelicAlgebraicGroups:AA.4/arithmetic-finite-index-elimination`.

### 15. Obstructions to torus and non-simply-connected approximation

Decompose the power-isogeny/Chebotarev obstruction for a nontrivial torus and the central-cover obstruction for a non-simply-connected absolutely almost simple group, including the finite-generation control on rational S-units. The explicit G_m/ℚ failure is verified directly; it does not establish all tori.

Resume at: `AdelicAlgebraicGroups:AA.4/torus-strong-approximation-failure`, `AdelicAlgebraicGroups:AA.4/strong-approximation-necessity`.

### 16. Quaternion norm topology and integral images

Supply openness of the actual local reduced-norm map onto its image and its unit image at all good places, together with the integral central-cover models. These establish the restricted-product quotient homeomorphism in reduced-norm-components; a bijection of square-class sets alone does not establish it.

Resume at: `AdelicAlgebraicGroups:AA.4/reduced-norm-components`, `AdelicAlgebraicGroups:AA.4/quaternion-reduced-norm-image`.

### 17. Hurwitz and Eichler concrete validation inputs

Supply the norm-Euclidean argument giving class number one for the Hurwitz maximal order in (−1,−1)/ℚ, enumerate its 24 norm-one units and their 12-element effective quotient, and identify the split local Eichler unit subgroup at 3 as the stabilizer of a line in 𝔽₃², of index four. These concrete order computations are not consequences of the abstract compactness or level-mass theorem and are not yet supplied by an atlas owner.

Resume at: `AdelicAlgebraicGroups:AA.5/definite-quaternion-compact`, `AdelicAlgebraicGroups:AA.5/definite-quaternion-mass`.

## Supplier contracts

There are 21 merged supplier records. Each packet record states the exact contract and its consuming node IDs; the reader’s supplier section repeats those contracts. This revision requests no changes to existing Tau Ceti roadmap documents.

- `ReductiveGroupsPartII:RG2.0`: The topology on X(R) = Hom_{alg}(A, R) for an affine scheme of finite type and an arbitrary Hausdorff topological ring R (not only a local field): the weakest topology making all evaluation maps continuous (Conrad, Proposition 2.1), with functoriality in X and in continuous ring maps R → R′ (embeddings, open and closed embeddings, discreteness: Conrad, Example 2.2), compatibility with fibre products, closed immersions to closed embeddings, local compactness when R is locally compact, the topological-group axioms for Hopf algebras, and compactness and openness of 𝒳(𝒪_v) in X(F_v) for affine models over 𝒪_v (Conrad, Example 2.3 and Corollary 3.7). AA.1 evaluates it on 𝔸_F, 𝔸_{F,f}, F_v, 𝒪_v and F ⊗ ℝ. Supply the finite-type affine-group coordinate-comodule theorem: every finite-dimensional algebraic representation is a subquotient of finite sums of tensor words in a closed faithful representation and its dual. This is not true for arbitrary faithful point-group homomorphisms.
- `ReductiveGroupsPartII:RG2.0a`: Weil restriction Res_{E/F} for affine finite-type schemes along a finite separable extension of number fields, with the identification of points Res_{E/F}(X)(R) ≅ X(E ⊗_F R) natural in the F-algebra R and compatible with group structures. Supply the point comparison as an equivalence of group-valued functors natural in every continuous value-algebra map, its compatibility with morphisms in G, identity and tower base change, and the tensor-product associator. The adelic comparison uses the canonical topological F-algebra isomorphism E⊗_F A_F→A_E, not an arbitrary equivalence of point sets.
- `ReductiveGroupsPartII:RG2.4`: The Cartan decomposition G(E) = K M(E) K for connected reductive G over a nonarchimedean local field E of characteristic 0, with K a special maximal compact subgroup containing representatives of the relative Weyl group, and M = Z_G(A) for a maximal E-split torus A; together with compactness of M(E)/A(E)-modulo-M(E)^1 used to see that M(E) = A(E)·M(E)^1 up to finite index. In addition to existence of local Iwasawa factorization, supply openness and the local P-K integration formula with left Haar density δ_P(m)^−1 dn dm dk (or the equivalent quasi-invariant quotient cocycle), including normalized integral factorization at good places. The Kneser–Tits theorem over nonarchimedean local fields of characteristic 0 (RT-AREA-automorphic-1/7): for G simply connected, absolutely almost simple and isotropic over E, define G(E)^+ as the subgroup generated by the E-points of the unipotent radicals of E-parabolics and prove Platonov's theorem G(E) = G(E)^+, Tits's simplicity of G(E)^+ modulo its centre (using the Tits system of the Iwahori–Bruhat decomposition), and the consequence that G(E) has no proper subgroup of finite index and no proper noncentral normal subgroup. This is the sub-stage RG2.4:kneser-tits proposed in RT-AREA-automorphic-1.fixes.md; AA.4 consumes only the finite-index consequence.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-4-finite-adeles`: Local compactness of the finite adele ring FiniteAdeleRing (𝓞 K) K, and the placewise projections as continuous K-algebra maps 𝔸_{K,f} → K_v.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-5-full-adeles-and-the-additive-quotient`: Local compactness of the adele ring and the continuity of the diagonal K → 𝔸_K.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-6-additive-strong-approximation-and-ideles`: The idele group 𝔸_K^× with Mathlib's units topology is locally compact and Hausdorff, and RestrictedProduct.unitsEquiv is a homeomorphism for the finite part; the idele norm ‖·‖ : 𝔸_K^× → ℝ_{>0} as a continuous homomorphism trivial on K^×; compactness of the norm-one idele class group; density of K in 𝔸_{K,f} (denseRange_algebraMap_finiteAdeleRing). Strong approximation for the additive group: denseRange_algebraMap_finiteAdeleRing (K dense in 𝔸_{K,f}). Compactness of the norm-one idele class group IdeleClassGroup.normOne and the description of the identity component of the idele class group, for the GL_1 validation.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-8-finite-extensions-of-adeles-and-ideles`: The base-change comparison adeleBaseChangeEquiv : 𝔸_K ⊗_K L ≃A[𝔸_K] 𝔸_L for a finite extension L/K, as a continuous algebra equivalence with the module topology on the source, compatible with the diagonal embeddings and with the decomposition 𝔸_K ⊗_K L = ∏_v (K_v ⊗_K L).
- `tauceti:TauCetiRoadmap/RepresentationTheory/LieGroups#layer-9-the-cartan-iwasawa-and-kak-decompositions`: For a real reductive Lie group G(ℝ) (also G(ℂ) viewed as a real group) with maximal compact K: the KAK decomposition G = K·closure(A⁺)·K with Weyl group representatives in K, and the Iwasawa decomposition G = K A N. For a real reductive group and the specified rational parabolic, give the open P-K factorization, its δ_P^−1 integration density, and Cartan-stable Levi coordinates; mere surjectivity does not provide integration. Supply the nested reductive-subgroup Cartan restriction and conjugacy theorem of Borel–Harish-Chandra §1.8, used in the finite-chain induction §1.9.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-0-places-completions-and-the-product-formula`: Functoriality of normalized absolute values under a finite extension E/F: |x|_w for x ∈ F_v equals |x|_v^{[E_w:F_v]}, with the local degrees in the exponents, and the product formula, used to compare the gauge-form measures of Res_{E/F} G with those of G.
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-4-the-relative-discriminant`: The relative discriminant ideal relDiscr 𝒪_F 𝒪_E and the tower formula |d_E| = |d_F|^{[E:F]} · N(relDiscr), used for the discriminant factors of Tamagawa measures under restriction of scalars. Supply the scalar Jacobian product for an arbitrary F-basis β of E, using finite lattice indices and real determinants with complex measure 2dxdy: ∏j_{β,v}=|d_F|^{[E:F]/2}|d_E|⁻¹/². Do not assert this factor at every individual finite place; an integral local basis has j=1.
- `ReductiveGroupsPartII:RG2.1`: Field-generic Borel–Tits structure theory over a field of characteristic 0 (in particular a number field): existence and G(F)-conjugacy of minimal F-parabolic subgroups and of maximal F-split tori; the relative root system Φ(S_0, G) with positive roots from a minimal parabolic and simple roots Δ_0; the bijection between subsets of Δ_0 and standard parabolics; the relative Bruhat decomposition G(F) = ⊔_w P_0(F) w P_0(F); and the Borel–Tits criterion that a connected reductive group has a proper F-parabolic iff its derived group is F-isotropic iff G(F) contains a nontrivial unipotent element. RG2.1 states these for local fields E; AA.3 needs them over a number field. For reductive H⊂G in characteristic zero, supply affineness of H\G and local finite-dimensionality of its rational coordinate comodule. This is the closed-orbit realization input (Borel–Harish-Chandra §3.8), not adelic orbit finiteness. Supply the canonical decomposition of a semisimple simply connected F-group as a product of restrictions of scalars of absolutely almost simple simply connected groups, including the correspondence between the places above S. Supply the actual central simply connected derived cover and its lifted conjugation/commutator morphism. For finite-type smooth geometrically connected characteristic-zero affine groups, the geometric character group is finitely generated and torsion free via the torus quotient; for reductive groups restriction to the connected centre is an isogeny on character lattices. Also supply the adjoint quotient with kernel the scheme-theoretic centre and its natural local/adelic point maps.
- `ReductiveGroupsPartII:RG2.3`: For connected reductive G over a number field, spread out to a smooth reductive model at almost all finite places and choose hyperspecial compact integral points. At each such place choose a maximal F_v-split torus containing the given global maximal F-split torus; the local split rank can be larger. Supply good-position compatibility with this local torus for Iwasawa. A maximal global split torus need not itself be maximal locally. Extend the reductive abelianization morphism with simply connected derived kernel to smooth models away from finitely many places; identify its fibres as torsors and supply Hensel lifting. Also extend the derived central cover as a finite morphism of the models.
- `AutomorphicFormsOnReductiveGroups:AF.1`: The real reductive scale-function comparison for proper algebraic representations with their duals: ‖g‖_{ι′}≤C‖g‖_ι^N and conversely, together with bounded-factor invariance under compact translations. Arbitrary faithful representations with a norm that does not control the inverse are insufficient. AA.3 consumes the archimedean comparison; RS-04 assigns the generic adelic height package to AA.3 and narrows AF.0 accordingly.
- `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-1-weak-approximation-and-multiplicative-congruences`: Weak approximation for number fields (weakApproximation_denseRange, already in Tau Ceti) and its congruence/sign corollaries.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`: For a quadratic extension E/ℚ, the quadratic character χ_E of ℚ^×\𝔸^× with kernel ℚ^× N_{E/ℚ}(𝔸_E^×) (global reciprocity and the norm index [𝔸^× : ℚ^× N 𝔸_E^×] = 2), viewed as a character of ℚ^×\𝔸^×/𝔸^{×2}.
- `tauceti:TauCetiRoadmap/GlobalQuadraticForms#layer-5-hasseminkowski-isotropy`: Hasse–Minkowski for quadratic forms over ℚ in five variables, used to show that a positive rational number is a reduced norm of a definite quaternion algebra over ℚ (the Hasse–Schilling–Maass theorem for quaternion algebras). Also supply local isotropy of every five-dimensional form over ℚ_p (u(ℚ_p)=4), and the real indefinite criterion; indefiniteness at infinity alone is not the local-global hypothesis.
- `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`: Layer 10 Chebotarev Dirichlet density and its consequence: infinitely many unramified finite places with any prescribed conjugacy class in the Galois group of the specified finite splitting extension. Layer 11 coefficient summatory functions do not supply this statement.
- `ModularCurvesPartII:R12.2`: The analytic identification of Γ(N)\ℍ (and Γ₀, Γ₁ quotients) with the corresponding level quotients, as an isomorphism of analytic spaces with the functorial action, used to identify the GL_2/ℚ adelic component with the upper half-plane quotient.
- `tauceti:TauCetiRoadmap/RepresentationTheory/CompactGroups#layer-5-the-peter-weyl-theorem`: For a strongly continuous unitary Hilbert-space representation of a compact abelian group, the orthogonal character-isotypic summands have dense Hilbert direct sum, with projections ∫χ(z)⁻¹R(z)dz. The central-character use first twists by an extension of ω′; no untwisted action on X/X′ is asserted. Also supply character separation and Fourier uniqueness of probability measures on compact abelian groups. For compact Hausdorff abelian groups, supply character separation, density of finite character sums in continuous functions, Haar character orthogonality and uniqueness of measures from Fourier coefficients. These are the exact inputs used by the quadratic-kernel limit, without a separate full Chabauty duality theorem.
- `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`: Supply the uniform finite-field reductive order formula in terms of Frobenius on the geometric character lattice and fundamental degrees, implying L_v(X,1)#G(k_v)q_v^{-dim G}=1+O(q_v^{-2}) for good reductive models. This is finite-group structure input, separate from the adelic convergence theorem. Supply Lang vanishing for torsors under connected reductive groups over finite residue fields, for the integral lifting argument.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Supply the cohomology exterior-power calculation for a finite product of circles with constant ℤ_p coefficients, its vanishing above the number of factors, and naturality under translations homotopic to the identity. Use the homology/product input already owned by Stage 5.

## Coverage

| Layer | Nodes | Planets | Status |
| --- | ---: | ---: | --- |
| AA.0 | 25 | 1 | planned |
| AA.1 | 32 | 3 | planned |
| AA.2 | 49 | 6 | planned |
| AA.3 | 74 | 6 | planned |
| AA.4 | 67 | 5 | planned |
| AA.5 | 15 | 4 | planned |

No closed-stage claim is made. The packet’s proposed splits distribute the larger layers while keeping at most six planets per original layer; the accepted narrow review’s placement of freeness in level-maps is retained.

## Sources and missing proofs

Public source versions, dates, SHA-256 hashes, numbered sections and printed page locators are recorded in the packet and the reader’s source register. Nineteen registered PDFs were checked against those hashes. New proof work used Borel–Harish-Chandra §§1, 3.8, 5.3–5.4 and 6.3–6.6; Gordon §§2.1–2.3 and 5.1.1, equation (48); BGST §28, Proposition 28.1; Orr §§4.2–4.6; the full Orr–Schnell correction; and Bekka–de la Harpe–Valette Appendices B.1 and E.1. Milne §5, pp. 59–63 was re-read for the level conventions. The BKT correction and the previously verified source corrections are retained. All mathematical statements are in our own words; no passages or source PDFs are included.

E1–E10 keep their independent review records. E9 now gives the correct BGST §28/Proposition 28.1 locator. E11 records the defective equal-weight density construction in Lemma E.1.3 of the **23 February 2007 author PDF**, pp. 408–409, and replaces it with nonnegative functions subordinate to the translated neighbourhoods. The official 2015 errata were checked; the Cambridge version of record was not retrieved, so E11 makes no claim about that version. Its finding awaits independent verification.

Oesterlé’s general number-field normalization proof, the general arithmetic-closure proof referred to Platonov–Rapinchuk, the classification/cohomology proofs, the measurable-model reference through Gaal, general primitive reduction/pivot proofs and the concrete Hurwitz enumeration were not read or established here. They remain the named gaps rather than assertions of closure. The maintainer’s source index was consulted; no private book was used or copied.

All durable information is in these four deliverables. Scratch scripts, downloads and logs are disposable; the next worker does not need them.
