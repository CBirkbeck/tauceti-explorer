# Roadmap: smooth representations of local groups, Part II — unitary representations, the Fell topology and the unitary spherical dual

**Summary.** Smooth representations of local groups, Part II: the unitary representation theory of p-adic groups on top of SR.0–SR.6. SRU.0 sets up strongly continuous unitary representations, Hilbert sums, functions of positive type, the GNS construction through Tau Ceti's Kolmogorov space, the unitary dual and pure positive-type functions, and smooth vectors with K-type projectors. SRU.1 develops weak containment, Milman's converse to Krein–Milman, Godement's integrated positive type, weak-\* compactness of P≤1, Raikov's theorem, single-coefficient approximation, the Fell topology, the closure theorem for sums and the corrected Gan–Savin Proposition 11.6 and Corollary 11.7 for second-countable locally compact groups. SRU.2 identifies the unitary dual with irreducible unitarizable smooth representations (unitary structures, uniqueness, semisimplicity, unitary induction, completion, Bernstein's admissibility). SRU.3 proves the limit theorems (characters, Miličić, Tadić, K-types, Rodier, Heiermann–Opdam, Gan–Savin 11.2, isolation of discrete series in the tempered dual), and SRU.4 the isolation of the Steinberg representation in rank ≥ 2 and of supercuspidals (finite Steinberg, Barbasch–Moy, Rodier, Howe–Moore). SRU.5–SRU.7 follow Ciubotaru–Harris: real Satake parameters, half-integrality, the generic unitary spherical region and its classification, the half-integral points and the generic temperedness test (stated for real or central-compact parameters), the nonsplit unramified transfer, the Aubert–Zelevinsky involution, Kazhdan–Lusztig parameters and the spherical complementary series with extraneous points. The other Part II directions of SR are proposed as separate roadmaps.

This roadmap is the Part II of [Smooth representations of local groups](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1cdde3240025076c7f74afcb491e9e97d6fdbea6/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md) (SmoothRepresentationsOfLocalGroups, cited below as SR, layers SR.0–SR.6) and starts where it stops. SR builds the smooth category of a locally profinite group over any coefficient ring, Hecke algebras, induction and Jacquet functors, admissibility, the Bernstein decomposition, square-integrable and tempered representations, the Steinberg representation, Satake and the integral theory of GL\_n; no layer of SR treats unitary representations. This Part II adds them, in the order in which the two organising papers use them: the topology of the unitary dual of a p-adic group and the isolation of the Steinberg representation (Gan–Savin, *The local Langlands conjecture for G₂*, Appendix B), and the generic unitary spherical dual of split and unramified groups with its Kazhdan–Lusztig organisation (Ciubotaru–Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*, §§4.2, 5–8).

## Scope and ownership

The roadmap owns: strongly continuous unitary representations of topological groups as a pair of predicates on Mathlib's `ContRepresentation` (Tau Ceti's `ContRepresentation.IsUnitary` and strong continuity), Hilbert sums, unitary equivalence, functions of positive type on (nonabelian) groups, the GNS construction, the unitary dual Ĝ and the extremality of pure positive-type functions (SRU.0); weak containment of unitary representations by positive-type coefficients, Milman's converse to the Krein–Milman theorem, Godement's integrated form of positive type, weak-\* compactness of P≤1(G), Raikov's theorem, the Fell topology on Ĝ, the closure theorem for Hilbert sums and the corrected Gan–Savin Proposition 11.6 and Corollary 11.7 for second-countable locally compact groups (SRU.1); unitary structures on smooth representations of reductive p-adic groups, their uniqueness, semisimplicity, unitary induction, Hilbert completion and Bernstein's admissibility theorem, so that Ĝ is the set of irreducible unitarizable smooth representations (SRU.2); weak limits of characters (Miličić, Tadić), persistence of K-types, Rodier's heredity of genericity, the Heiermann–Opdam standard-module theorem and Gan–Savin Proposition 11.2 (SRU.3); the finite Steinberg representation, the Barbasch–Moy genericity criterion, Rodier's decomposition, the Howe–Moore theorem over nonarchimedean fields, and the isolation of the Steinberg representation (rank ≥ 2) and of supercuspidals (SRU.4); real Satake parameters, half-integrality, the generic unitary spherical region and its classification, the half-integral generic unitary points and the generic temperedness test (SRU.5); the transfer to the split companion G(τ) for unramified nonsplit groups (SRU.6); and the Aubert–Zelevinsky involution of a general reductive group, Kazhdan–Lusztig parameters and the spherical complementary series with their extraneous points (SRU.7).

It imports, and does not restate: from SR, the smooth category, smooth vectors and averaging projectors (SR.0), Hecke algebras and the Iwahori–Matsumoto and Bernstein presentations (SR.1), parabolic induction, Jacquet modules, the geometric lemma, Casselman's pairing and Whittaker functionals (SR.2), admissibility of irreducibles and uniform admissibility (SR.3a), square-integrable and tempered representations, Casselman's criterion, the Langlands classification, the Bernstein decomposition and centre, the Iwahori block and the Steinberg representation (SR.3), the Satake isomorphism and spherical parameters (SR.4) and the Zelevinsky involution of GL\_n (SR.5); from ReductiveGroupsPartII, parahoric and hyperspecial subgroups, the reduction to the special fibre, the Iwasawa and Cartan decompositions and the dual group with its pinned automorphisms (RG2.3–RG2.5); from EndoscopicTransferAndUnitaryTraceComparison ET.4, the distribution character of an admissible representation; from ExcursionOperatorsAndSpectralAction ES5 and ES7, the semisimple local parameter and its compatibility with parabolic induction; from TauCetiRoadmap LieHighestWeight, weights and sl₂-theory. TauCetiRoadmap roadmaps that postdate the atlas snapshot are imported through the list at the end of this document: BanachSpaceTheory B5 (the duality (L¹)\* ≃ L^∞), the open NoncompactQuantumSymmetry roadmap (Schur's lemma for unitary representations, compact-group isotypic projectors, and the comparison of coefficient weak containment with C\*-kernel weak containment, which it owns), OperatorAlgebraDynamics (group C\*-algebras, a boundary only) and AutomorphicSpectralTheory §7.0b (the unitary dual of GL\_n, Tadić's classification, of which the type-A case of SRU.5 is the spherical part).

Boundaries. The general theory of C\*-algebras with bounded trace, polynomial identities in C\*-algebras and the equivariant K-theory of the Steinberg variety are not built here; the three theorems that rest on them (Miličić's limit theorem, Bernstein's admissibility theorem, the Kazhdan–Lusztig classification) are stated as targets with their proof routes and recorded as gaps for their inputs. Nilpotent orbits of the dual Lie algebra (Jacobson–Morozov, centralisers of sl₂-triples, Bala–Carter tables) belong to the Part II of LieHighestWeight, whose design is pending; SRU.7 records them as a gap and imports them when planned. Types, Moy–Prasad theory beyond what RG2.3 states, parahoric centres, Kazhdan's density theorem, the trace Paley–Wiener theorem, mod p Bernstein centres, GL\_n newforms and Newton cocentres are the other Part II directions of SR and are separate roadmaps (see the end of this document). The global applications — globalisation with prescribed isolated local components (Gan–Savin §10, Gan–Ichino Appendix A) and the Ramanujan and Arthur bounds over function fields (Ciubotaru–Harris §§5, 9–10) — belong to the consumers, whose designs are pending: LocalLanglandsCorrespondenceForG2 (DESIGN-LocalLanglandsCorrespondenceForG2), the Shimura–Waldspurger route of DESIGN-MetaplecticAutomorphicFormsPartII and the Ramanujan–Arthur route of DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII (paper routes MetaplecticAutomorphicFormsPartIIShimuraWaldspurger and GlobalShtukasPartIIRamanujanArthur).

The independent review leaves SRU.0 planned and SRU.1–SRU.7 partial with the precise proof prerequisites listed below. The packet is partial because those stages remain open; the review pass itself is finished. The simplified Kazhdan–Lusztig dictionary here assumes split adjoint G. Compact parts remain part of the full spherical strata: only the real slice of CS(G,0) is identified with U₀^g. The nonsplit companion keeps its actual isogeny, including Sp(2n) for PSU(2n+1).

The library audit imports the existing positive kernel and Kolmogorov construction and the current OperatorTheory/PolarDecomposition roadmap. Current Tau Ceti’s additive GNS helpers require AddCommGroup; they cover the abelian case, while this plan supplies the nonabelian translation action. Its finite-dimensional Schur/equivalence theorems do not replace the bounded Hilbert-space Schur input from NoncompactQuantumSymmetry.

## Conventions

**Hilbert spaces and coefficients.** Hilbert spaces are complex, with Mathlib's inner product ⟪x, y⟫, conjugate-linear in x. A unitary representation is a `ContRepresentation ℂ G H` satisfying Tau Ceti's `ContRepresentation.IsUnitary` and the separate strong-continuity condition ∀ v, `Continuous (fun g ↦ π g v)`, as in OperatorAlgebraDynamics and NoncompactQuantumSymmetry; Tau Ceti's `matrixCoeff` assumes the stronger continuity of g ↦ π g in the operator norm, which unitary representations of p-adic groups do not have. The positive-type coefficient of v is g ↦ ⟪v, π g v⟫; it is Bekka–de la Harpe–Valette's ⟨π(g)v, v⟩ and equals Tau Ceti's `matrixCoeff π hπ v v` at g⁻¹. A function φ on a group is of positive type when Σᵢⱼ cᵢ conj(cⱼ) φ(gⱼ⁻¹gᵢ) ≥ 0, equivalently the kernel (a, b) ↦ φ(a⁻¹b) is `Matrix.PosSemidef`; on `Multiplicative A` this is Tau Ceti's `IsPositiveDefiniteSub`.

**Groups.** Definitions of SRU.0–SRU.1 are for topological groups; the theorems of SRU.1 are for second-countable locally compact groups with a left Haar measure (this covers p-adic reductive groups, their finite central covers such as Mp₂ₙ(F\_S), and products with compact groups). From SRU.2 on, G = 𝐆(F) is a connected reductive group over a nonarchimedean local field F with the conventions of SR (normalised induction i\_P, normalised Jacquet functors r\_P, the Langlands convention of SR.3.3). Statements from Gan–Savin and Heiermann–Opdam assume F of characteristic zero; Ciubotaru–Harris work over any nonarchimedean local field; applying their characteristic-zero categorical suppliers to function fields requires the characteristic-independent Hecke-algebra adapters recorded as gaps.

**Satake parameters.** In SRU.5–SRU.7 G is quasi-simple, split (or unramified in SRU.6) and adjoint; the split companion in SRU.6 retains its own isogeny. For split G, K = 𝐆(O) hyperspecial, s ∈ T^∨ = X ⊗ ℂ^× is a Satake parameter, χ\_s = s ∘ val\_T, X(s) = i\_B(χ\_s) and L(s) its spherical constituent; s = s\_c·s\_ν with s\_c compact and ν ∈ X ⊗ ℝ real. With this convention, Ciubotaru–Harris (6.1), L(ν) is the spherical subrepresentation of X(ν) for dominant ν; Barbasch–Ciubotaru use the opposite sign, under which it is the quotient. Unitarity is insensitive to ν ↦ −ν. The temperedness test of Corollary 6.32 and its nonsplit form, and the extraneous-point lists of Theorem 8.5, are stated for real or central-compact Satake parameters (s\_c = 1 or central), where the sources' proofs apply; for a noncentral s\_c the printed statements fail (a G₂ witness, SRU.5).

**Names.** Lean names are relative to the namespace `TauCetiRoadmap.SmoothRepresentationsOfLocalGroupsPartII` of the suggested file. Each target below is led by its bold title, its short name in italics and its kind; it gives the statement with hypotheses, the proof route, for definitions and constructions the uses, API and unit tests (**Checks**), acceptance properties, the targets and supplier declarations it needs (*Needs*), and its sources with locators. A *Lean* line names the declarations that the suggested file states.

## Layer SRU.0: Unitary representations and functions of positive type

Strongly continuous unitary representations of a topological group G on complex Hilbert spaces, as Mathlib's \`ContRepresentation ℂ G H\` with Tau Ceti's \`ContRepresentation.IsUnitary\` and the separate strong-continuity condition \`∀ v, Continuous (fun g ↦ π g v)\`; unitary equivalence; Hilbert direct sums ⊕̂ᵢ πᵢ on Mathlib's \`lp (fun i ↦ Hᵢ) 2\`. Functions of positive type on a group (Σᵢⱼ cᵢ c̄ⱼ φ(gⱼ⁻¹gᵢ) ≥ 0, Bekka–de la Harpe–Valette \[BHV\] Definition C.4.1), the sets P(G), P₁(G) (φ(e) = 1) and P≤1(G), and their basic API (C.4.2): φ(g⁻¹) = conj φ(g), |φ(g)| ≤ φ(e), uniform continuity; agreement with Tau Ceti's \`IsPositiveDefiniteSub\` on \`Multiplicative A\`. The positive-type coefficient g ↦ ⟪v, π g v⟫ of a vector (C.4.3), its relation to Tau Ceti's \`ContRepresentation.matrixCoeff\`, and the GNS construction (C.4.10) through Tau Ceti's Kolmogorov space \`Matrix.PosSemidef.KolmogorovSpace\`, with uniqueness up to unitary equivalence. The unitary dual Ĝ, the set of unitary-equivalence classes of topologically irreducible strongly continuous unitary representations, realised without universe issues as pure normalised positive-type functions modulo GNS equivalence; extremality: φ ∈ ext P₁(G) iff π\_φ is irreducible, and ext P≤1(G) = ext P₁(G) ∪ {0} (\[BHV\] Theorem C.5.2, C.5.5(i)). For G locally profinite: the orthogonal projection e\_K onto H^K for compact open K, the K-type projectors e\_τ (with the factor dim τ), and density of the smooth vectors H^∞ = ⋃\_K H^K, a smooth representation in the sense of SR.0.

<a id="sru-sru-0-strongly-continuous-unitary"></a>
#### SRU.0.1 Strongly continuous unitary representations and unitary equivalence

**Strongly continuous unitary representations and unitary equivalence** (*strongly-continuous-unitary*, definition). Let G be a topological group and H a complex Hilbert space (NormedAddCommGroup, InnerProductSpace ℂ, CompleteSpace), with Mathlib's inner product ⟪x, y⟫, conjugate-linear in x. A strongly continuous unitary representation of G on H is π : ContRepresentation ℂ G H such that (i) Tau Ceti's ContRepresentation.IsUnitary π holds (⟪π g v, π g w⟫ = ⟪v, w⟫ for all g, v, w), and (ii) π is strongly continuous: for every v ∈ H the orbit map g ↦ π g v is continuous G → H. The predicate (ii) is ContRepresentation.IsStronglyContinuous; it is weaker than continuity of g ↦ π g in the operator norm, the hypothesis of Tau Ceti's ContRepresentation.matrixCoeff. Two such representations (π, H), (ρ, H') are unitarily equivalent, π ≃ᵤ ρ, when there is a linear isometric equivalence T : H ≃ₗᵢ\[ℂ] H' with T (π g v) = ρ g (T v) for all g and v. A closed subspace W ⊆ H is invariant when π g W ⊆ W for all g; π is topologically irreducible when H ≠ 0 and the only closed invariant subspaces are 0 and H (the convention of NoncompactQuantumSymmetry M0, distinct from algebraic irreducibility Representation.IsIrreducible).

*Hypotheses.* G a topological group; no local compactness or separation is required for the definitions. H a complex Hilbert space; inner products are linear in the second variable.

*Proof route.*

- Define IsStronglyContinuous π :⇔ ∀ v, Continuous (fun g ↦ π g v), as a Prop on Mathlib's ContRepresentation, beside Tau Ceti's IsUnitary rather than bundled into a new carrier (OperatorAlgebraDynamics, Scope and conventions, and the open NoncompactQuantumSymmetry roadmap M0 use the same pair of conditions).
- Define unitary equivalence through Mathlib's LinearIsometryEquiv and an intertwining equation; reflexivity, symmetry and transitivity are composition of isometric equivalences.
- Norm continuity implies strong continuity because evaluation at v is continuous on V →L\[ℂ] V; the converse fails (unit test 3).
- For a closed invariant W the restricted action is a ContRepresentation on W (Tau Ceti ContRepresentation.subrepresentation, IsUnitary.subrepresentation), strongly continuous for the subspace topology; the orthogonal complement of an invariant closed subspace is invariant because π g\* = π g⁻¹ (Tau Ceti IsUnitary.adjoint_eq_inv).

*Uses.* Gan–Savin, §11 and Definition 11.5: the objects of the unitary dual and of weak containment are continuous unitary representations. Gan–Savin, Propositions 10.5 and 10.7: the automorphic L² spaces are unitary representations of adelic groups whose weak containment is compared with local ones. SRU.2 hilbert-completion: the completion of a unitarizable smooth representation is a strongly continuous unitary representation.

*API.*

- `IsStronglyContinuous` (data): The predicate ∀ v, Continuous (fun g ↦ π g v) on π : ContRepresentation ℂ G H.
- `IsStronglyContinuous.of_continuous` (compatibility): If g ↦ π g is continuous into H →L\[ℂ] H (Tau Ceti's matrixCoeff hypothesis), then π is strongly continuous.
- `IsStronglyContinuous.restrict` (functoriality): Restriction along a continuous homomorphism φ : G' →\* G preserves strong continuity and IsUnitary.
- `IsStronglyContinuous.subrepresentation` (structure): For a closed π-invariant subspace W, the subrepresentation on W is strongly continuous and unitary.
- `isUnitary_orthogonal_invariant` (characterisation): If W is π-invariant then Wᗮ is π-invariant, for unitary π.
- `UnitaryEquiv` (structure): A linear isometric equivalence T : H ≃ₗᵢ\[ℂ] H' with T ∘ π g = ρ g ∘ T; refl, symm and trans.
- `IsTopologicallyIrreducible` (data): H is nontrivial and every closed π-invariant submodule is ⊥ or ⊤.
- `isTopologicallyIrreducible_iff_isIrreducible` (compatibility): In finite dimension, topological irreducibility is equivalent to Representation.IsIrreducible π.toRepresentation.
- `IsTopologicallyIrreducible.cyclic` (characterisation): Every nonzero vector of a topologically irreducible representation is cyclic: the closed span of its orbit is H.

**Checks.**

- `trivial_isStronglyContinuous` (degenerate): The trivial representation of a topological group G on ℂ is unitary, strongly continuous and topologically irreducible.
- `translation_padic_not_stronglyContinuous` (non-example): ℚ\_p acting on ℓ²(ℚ\_p) (counting measure) by translation is unitary but not strongly continuous: ‖λ(g)δ₀ − δ₀‖ = √2 for every g ≠ 0.
- `zp_characters_strong_not_norm` (non-example): ℤ\_p acting diagonally on ℓ²(ℕ) by e_n ↦ χ\_n(g) e_n, with χ\_n the character x ↦ exp(2πi {x/pⁿ}), is strongly continuous but not continuous in the operator norm: ‖π(p^m) − 1‖ ≥ |e^{2πi/p} − 1| for every m.
- `unitaryEquiv_trans_symm` (characterisation): For unitary equivalences T : π ≃ᵤ ρ, T.trans T.symm = refl as linear isometric equivalences.

*Acceptance.* The trivial representation of any G on ℂ is a topologically irreducible strongly continuous unitary representation. For a finite-dimensional H, topological irreducibility coincides with Representation.IsIrreducible of π.toRepresentation, since every subspace is closed.

*Needs:* Mathlib `ContRepresentation`; Tau Ceti `TauCeti.ContRepresentation.IsUnitary`; Tau Ceti `TauCeti.ContRepresentation.IsUnitary.subrepresentation`; Tau Ceti `TauCeti.ContRepresentation.IsUnitary.adjoint_eq_inv`; Tau Ceti `TauCeti.ContRepresentation.subrepresentation`; Mathlib `Representation.IsIrreducible`.

*Sources:* \[GS23] §11, opening paragraph, pp. 30–31: Gan–Savin call a unitary representation continuous when every orbit map g ↦ π(g)v is continuous, and assume all unitary representations continuous. \[BHV] Appendix A.1 conventions as used in Definition F.1.1, p. 420, and Proposition C.4.3, p. 374: Unitary representations are homomorphisms into the unitary group that are strongly continuous; weak containment and positive-type functions are defined for them. \[NQS] M0, first paragraph: The open roadmap fixes Mathlib's ContRepresentation with Tau Ceti's IsUnitary and an explicit strong-continuity condition, and topological irreducibility by closed invariant subspaces; this node uses the same convention.

*Planet:* Unitary representation.

*Lean:* `IsStronglyContinuous`, `IsStronglyContinuous.of_continuous`, `UnitaryEquiv`, `IsTopologicallyIrreducible`, `isTopologicallyIrreducible_iff_isIrreducible`

<a id="sru-sru-0-hilbert-direct-sum"></a>
#### SRU.0.2 Hilbert direct sums of unitary representations

**Hilbert direct sums of unitary representations** (*hilbert-direct-sum*, construction). For a family (πᵢ, Hᵢ)\_{i ∈ ι} of strongly continuous unitary representations of G, the Hilbert direct sum ⊕̂ᵢ πᵢ acts coordinatewise on Mathlib's lp (fun i ↦ Hᵢ) 2: (⊕̂ πᵢ)(g) f = (i ↦ πᵢ g (f i)). It is a strongly continuous unitary representation; the coordinate inclusions Hᵢ → lp (fun i ↦ Hᵢ) 2 are isometric intertwiners onto mutually orthogonal closed invariant subspaces whose closed span is the whole space, and the coordinate projections are intertwiners.

*Hypotheses.* ι an arbitrary index type; each πᵢ strongly continuous unitary.

*Proof route.*

- Coordinatewise action preserves the ℓ² norm, so each (⊕̂ πᵢ)(g) is a linear isometry with inverse (⊕̂ πᵢ)(g⁻¹); this gives IsUnitary.
- Strong continuity: for f with finite support the orbit map is a finite sum of continuous maps; finitely supported f are dense in lp 2, and an ε/3 argument with the uniform bound ‖(⊕̂ πᵢ)(g)‖ ≤ 1 gives continuity for every f.
- The inclusions lp.single i are isometric intertwiners; orthogonality and density of their spans are Mathlib's lp Hilbert-sum facts.

*Uses.* Gan–Savin, Proposition 11.6 and Corollary 11.7: the representation π = ⊕̂ᵢ πᵢ whose weak containment of σ is analysed. SRU.1 weak-containment-sum-closure: the representations ⊕\_{σ∈S} σ attached to subsets S of the unitary dual.

*API.*

- `hilbertSum` (constructor): hilbertSum π : ContRepresentation ℂ G (lp (fun i ↦ H i) 2) with (hilbertSum π g f) i = π i g (f i).
- `hilbertSum_isUnitary` (instance): hilbertSum π is unitary when every π i is.
- `hilbertSum_isStronglyContinuous` (instance): hilbertSum π is strongly continuous when every π i is unitary and strongly continuous.
- `hilbertSum_single` (simp): hilbertSum π g (lp.single 2 i v) = lp.single 2 i (π i g v).
- `hilbertSum_unique` (example): For ι with a single element i, hilbertSum π ≃ᵤ π i.

**Checks.**

- `hilbertSum_empty` (degenerate): For ι empty, lp (fun i ↦ H i) 2 is the zero space and hilbertSum is the zero representation.
- `hilbertSum_unique_equiv` (characterisation): For ι = Unit, hilbertSum π is unitarily equivalent to π ().
- `hilbertSum_trivial_nat` (computation): The Hilbert sum over ℕ of copies of the trivial representation on ℂ is the trivial action on ℓ²(ℕ).
- `hilbertSum_not_algebraic_sum` (non-example): For ι = ℕ and Hᵢ = ℂ with trivial action, the algebraic direct sum is proper and dense in ℓ²(ℕ): the vector i ↦ 1/(i+1) belongs to ℓ² and has infinite support. Infinite ι alone does not imply properness (all Hᵢ might be zero).

*Acceptance.* The positive-type coefficient of a finitely supported vector f = Σᵢ fᵢ is the sum of the coefficients of the fᵢ (positive-type-coefficient).

*Needs:* [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); Mathlib `lp`.

*Sources:* \[GS23] §11.2, Proposition 11.6 and proof, p. 33: Gan–Savin form π = ⊕̂ᵢ πᵢ from a sequence of irreducible unitary representations and approximate its coefficients through those of the summands. \[BHV] Exercise F.6.4, p. 444; Proposition F.2.7, p. 429: Direct sums ⊕\_{σ∈S} σ of irreducible unitary representations are compared by weak containment.

<a id="sru-sru-0-positive-type-function"></a>
#### SRU.0.3 Functions of positive type on a group

**Functions of positive type on a group** (*positive-type-function*, definition). Let G be a group. A function φ : G → ℂ is of positive type, IsPositiveType φ, when for every n, every c : Fin n → ℂ and every g : Fin n → G, 0 ≤ Σᵢ Σⱼ cᵢ · conj(cⱼ) · φ(gⱼ⁻¹ gᵢ) in the order of ℂ (real and nonnegative); equivalently the kernel (a, b) ↦ φ(a⁻¹ b) is Matrix.PosSemidef. For a topological group, P(G) is the set of continuous φ of positive type (\[BHV] Definition C.4.1 requires continuity), P₁(G) = {φ ∈ P(G) : φ(e) = 1} and P≤1(G) = {φ ∈ P(G) : φ(e) ≤ 1}. Basic properties: φ(e) is real and ≥ 0, φ(g⁻¹) = conj φ(g), |φ(g)| ≤ φ(e), and |φ(g) − φ(h)|² ≤ 2 φ(e) (φ(e) − Re φ(g⁻¹h)), so every φ ∈ P(G) is left and right uniformly continuous. P(G) is a convex cone closed under pointwise products, complex conjugation and pointwise limits (continuity of the limit to be checked separately); P₁(G) and P≤1(G) are convex. On G = Multiplicative A for an additive commutative group A, IsPositiveType agrees with Tau Ceti's IsPositiveDefiniteSub.

*Hypotheses.* G a group; continuity is part of membership in P(G), not of IsPositiveType. The order on ℂ is Mathlib's ComplexOrder: 0 ≤ z iff z is real and nonnegative.

*Proof route.*

- (i)–(ii) are the 1 × 1 and 2 × 2 cases of the defining inequality (\[BHV] Proposition C.4.2(i)–(ii), via C.1.2).
- (iii) is the 3 × 3 case with the points g, h, e and the scalars chosen in \[BHV] Proposition C.4.2(iii).
- The kernel form: Σ cᵢ conj(cⱼ) φ(gⱼ⁻¹gᵢ) is the hermitian form of the matrix (φ(gⱼ⁻¹gᵢ)), so IsPositiveType φ iff (fun a b ↦ φ (a⁻¹ \* b)) is Matrix.PosSemidef; this is the input to Tau Ceti's Kolmogorov space.
- Closure under products is the Schur product theorem for positive semidefinite matrices; under limits, nonnegativity is a closed condition.
- For G = Multiplicative A, gⱼ⁻¹ gᵢ = ofAdd (vᵢ − vⱼ), which is the expression in IsPositiveDefiniteSub.

*Uses.* BHV, Theorem C.4.10: the input of the GNS construction. Gan–Savin, Definition 11.5 and Proposition 11.6: weak containment and the extremal-point argument are statements about normalised positive-type functions. SRU.1 weak-containment: approximation of positive-type coefficients defines ≺.

*API.*

- `IsPositiveType` (data): IsPositiveType φ :⇔ ∀ n (c : Fin n → ℂ) (g : Fin n → G), 0 ≤ Σ i, Σ j, c i \* conj (c j) \* φ ((g j)⁻¹ \* g i).
- `isPositiveType_iff_posSemidef` (characterisation): IsPositiveType φ ↔ Matrix.PosSemidef (fun a b : G ↦ φ (a⁻¹ \* b)).
- `IsPositiveType.apply_one_nonneg` (simp): 0 ≤ φ 1, so φ 1 is real.
- `IsPositiveType.apply_inv` (simp): φ g⁻¹ = conj (φ g).
- `IsPositiveType.norm_apply_le` (other): ‖φ g‖ ≤ (φ 1).re.
- `IsPositiveType.normSq_sub_le` (other): ‖φ g − φ h‖² ≤ 2 (φ 1).re ((φ 1).re − (φ (g⁻¹ \* h)).re).
- `IsPositiveType.add` (structure): Sums, nonnegative real multiples, pointwise products and conjugates of functions of positive type are of positive type.
- `IsPositiveType.of_tendsto` (other): A pointwise limit of functions of positive type is of positive type.
- `isPositiveType_ofAdd_iff` (compatibility): For an additive commutative group A and F : A → ℂ, IsPositiveType (F ∘ Multiplicative.toAdd) ↔ TauCeti.IsPositiveDefiniteSub F.
- `positiveTypeOne` (data): P₁ G := {φ | Continuous φ ∧ IsPositiveType φ ∧ φ 1 = 1}, convex.
- `positiveTypeLeOne` (data): P≤1 G := {φ | Continuous φ ∧ IsPositiveType φ ∧ (φ 1).re ≤ 1}, convex; P G is the cone of continuous functions of positive type.

**Checks.**

- `isPositiveType_one` (degenerate): The constant function 1 is of positive type on every group, and lies in P₁ G for every topological group.
- `isPositiveType_indicator_open_subgroup` (computation): For an open subgroup U of a topological group G, the indicator function of U is of positive type (it is the coefficient of the vector δ\_U in ℓ²(G/U)); for G = ℚ\_p and U = ℤ\_p it lies in P₁(ℚ\_p).
- `not_isPositiveType_neg_one` (non-example): The constant function −1 is not of positive type: the 1 × 1 inequality fails.
- `not_isPositiveType_norm_gt` (non-example): On ℤ the function with φ(0) = 1 and φ(n) = 2 for n ≠ 0 is not of positive type, since ‖φ 1‖ > φ 0.
- `isPositiveType_ofAdd_int_character` (compatibility): For θ ∈ ℝ, n ↦ exp(i n θ) on Multiplicative ℤ is of positive type, and IsPositiveDefiniteSub holds for the same function on ℤ.

*Acceptance.* Every unitary character χ : G → S¹ is of positive type, and χ ∈ P₁(G) when χ is continuous. The constant function 1 is an extreme point of P₁(G), being the coefficient of the trivial representation, which is irreducible (pure-iff-irreducible).

*Needs:* Mathlib `Matrix.PosSemidef`; Tau Ceti `TauCeti.IsPositiveDefiniteSub`; Mathlib `Multiplicative`.

*Sources:* \[BHV] Definition C.4.1 and Proposition C.4.2, p. 373: Functions of positive type are continuous functions whose kernel (g₁, g₂) ↦ φ(g₂⁻¹g₁) is of positive type; they satisfy φ(g⁻¹) = conj φ(g), |φ(g)| ≤ φ(e) and the uniform-continuity estimate. \[BHV] §C.5, opening definitions, p. 379 (P(G), P₁(G)); before Lemma C.5.4, p. 382 (P≤1(G)): P(G) is the convex cone of functions of positive type and P₁(G) its normalised part; P≤1(G), the φ with ‖φ‖\_∞ = φ(e) ≤ 1, is introduced before Lemma C.5.4. \[GS23] §11.2, proof of Proposition 11.6, p. 33: Gan–Savin use the weak-\* closed convex hull of normalised positive-type coefficients inside the unit ball of L^∞(G).

*Planet:* Function of positive type.

*Lean:* `IsPositiveType`, `isPositiveType_iff_posSemidef`, `IsPositiveType.apply_inv`, `IsPositiveType.norm_apply_le`, `isPositiveType_ofAdd_iff`, `positiveTypeOne`, `positiveTypeLeOne`

<a id="sru-sru-0-positive-type-coefficient"></a>
#### SRU.0.4 Positive-type coefficients of unitary representations

**Positive-type coefficients of unitary representations** (*positive-type-coefficient*, construction). For a strongly continuous representation π of a topological group G on a complex Hilbert space H and v, w ∈ H, the coefficient coeff π w v ∈ C(G, ℂ) is g ↦ ⟪w, π g v⟫; the positive-type coefficient of v is ptCoeff π v := coeff π v v, g ↦ ⟪v, π g v⟫ (Bekka–de la Harpe–Valette's ⟨π(g)v, v⟩). If π is unitary, ptCoeff π v is of positive type and lies in P(G), with ptCoeff π v (e) = ‖v‖²; ptCoeff π v ∈ P₁(G) for unit vectors v. It is invariant under unitary equivalence, additive on orthogonal sums of invariant subspaces, and ‖ptCoeff π v − ptCoeff π w‖\_∞ ≤ (‖v‖ + ‖w‖)‖v − w‖. When g ↦ π g is norm continuous, ptCoeff π v g = Tau Ceti's matrixCoeff π hπ v v (g⁻¹) = conj (matrixCoeff π hπ v v g).

*Hypotheses.* π strongly continuous (for continuity of coefficients); unitary for positive type.

*Proof route.*

- Continuity: g ↦ π g v is continuous and ⟪w, ·⟫ is continuous.
- Positive type: Σᵢⱼ cᵢ conj(cⱼ) ⟪v, π(gⱼ⁻¹gᵢ) v⟫ = Σᵢⱼ cᵢ conj(cⱼ) ⟪π gⱼ v, π gᵢ v⟫ = ‖Σᵢ cᵢ π gᵢ v‖² ≥ 0 (\[BHV] Proposition C.4.3).
- The uniform estimate: |⟪v, π g v⟫ − ⟪w, π g w⟫| ≤ |⟪v − w, π g v⟫| + |⟪w, π g (v − w)⟫| by Cauchy–Schwarz and unitarity.
- Comparison with Tau Ceti: matrixCoeff π hπ v v g = ⟪π g v, v⟫ = conj ⟪v, π g v⟫, and ⟪π g⁻¹ v, v⟫ = ⟪v, π g v⟫ by unitarity.

*Uses.* Gan–Savin, §11.1: limit points are defined by uniform convergence on compacta of coefficients ⟨πₙ(g)vₙ, vₙ⟩. Gan–Savin, Lemma 11.4: the coefficient of a τ-isotypic vector evaluated against the K-type projector. SRU.1 weak-containment: the functions approximated in the definition of ≺.

*API.*

- `coeff` (constructor): coeff π hπ w v : C(G, ℂ), g ↦ ⟪w, π g v⟫, for π strongly continuous.
- `ptCoeff` (constructor): ptCoeff π hπ v := coeff π hπ v v.
- `ptCoeff_isPositiveType` (characterisation): For unitary strongly continuous π, ptCoeff π hπ v is of positive type.
- `ptCoeff_one` (simp): ptCoeff π hπ v 1 = ‖v‖².
- `ptCoeff_unitaryEquiv` (compatibility): If T : π ≃ᵤ ρ then ptCoeff ρ (T v) = ptCoeff π v.
- `ptCoeff_add_orthogonal` (relation): If v ∈ W and w ∈ Wᗮ for a closed invariant W, ptCoeff π (v + w) = ptCoeff π v + ptCoeff π w.
- `ptCoeff_eq_matrixCoeff_inv` (compatibility): If g ↦ π g is norm continuous and π is unitary, ptCoeff π v g = TauCeti.ContRepresentation.matrixCoeff π hπ v v g⁻¹.
- `dist_ptCoeff_le` (other): For all g, ‖ptCoeff π v g − ptCoeff π w g‖ ≤ (‖v‖ + ‖w‖) ‖v − w‖.

**Checks.**

- `ptCoeff_trivial` (computation): For the trivial representation of G on ℂ and v ∈ ℂ, ptCoeff π v is the constant function |v|².
- `ptCoeff_character` (computation): For a unitary character χ acting on ℂ and v = 1, ptCoeff π 1 = χ.
- `ptCoeff_eq_matrixCoeff_finrank` (compatibility): For a finite-dimensional norm-continuous unitary representation, ptCoeff π v g = matrixCoeff π hπ v v g⁻¹.
- `coeff_not_isPositiveType` (non-example): For the trivial representation on ℂ, the off-diagonal coefficient coeff π (−1) 1 is the constant −1, which is not of positive type.

*Acceptance.* For the trivial representation on ℂ, ptCoeff π v is the constant |v|². For a unit vector v of a one-dimensional representation given by a unitary character χ, ptCoeff π v = χ.

*Needs:* [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); [*positive-type-function*](#sru-sru-0-positive-type-function); Tau Ceti `TauCeti.ContRepresentation.matrixCoeff`; Tau Ceti `TauCeti.ContRepresentation.matrixCoeff_apply`; Mathlib `ContinuousMap`.

*Sources:* \[BHV] Proposition C.4.3, p. 374: Diagonal matrix coefficients g ↦ ⟨π(g)ξ, ξ⟩ of unitary representations are of positive type; they are called the functions of positive type associated to π. \[GS23] §11.1, definition of limit points, p. 31; Definition 11.5, p. 33: Gan–Savin measure convergence and weak containment through the coefficients ⟨π(g)v, v⟩, normalised by ‖v‖ = 1.

*Lean:* `coeff`, `ptCoeff`, `ptCoeff_isPositiveType`, `ptCoeff_one`, `ptCoeff_unitaryEquiv`, `ptCoeff_eq_matrixCoeff_inv`

<a id="sru-sru-0-gns-construction"></a>
#### SRU.0.5 The GNS construction for functions of positive type

**The GNS construction for functions of positive type** (*gns-construction*, construction). Let G be a topological group and φ ∈ P(G). There is a triple (π\_φ, H\_φ, ξ\_φ) with H\_φ a complex Hilbert space, π\_φ a strongly continuous unitary representation of G on H\_φ and ξ\_φ ∈ H\_φ a cyclic vector (its orbit spans a dense subspace) such that φ = ptCoeff π\_φ ξ\_φ. It is unique: for any triple (π, H, ξ) with ξ cyclic and ptCoeff π ξ = φ there is a unique unitary equivalence T : π\_φ ≃ᵤ π with T ξ\_φ = ξ. Concretely H\_φ is Tau Ceti's Kolmogorov space of the positive semidefinite kernel K(a, b) = φ(a⁻¹ b), with feature map Φ : G → H\_φ satisfying ⟪Φ a, Φ b⟫ = φ(a⁻¹b); π\_φ(g) Φ(a) = Φ(g a) and ξ\_φ = Φ(e). For any strongly continuous unitary π and v ∈ H, the GNS representation of ptCoeff π v is unitarily equivalent to the cyclic subrepresentation on the closed span of π(G)v. If φ = φ₁ + φ₂ with φ₁, φ₂ ∈ P(G), then π\_{φ₁} is unitarily equivalent to a subrepresentation of π\_φ (\[BHV\] Proposition C.5.1).

*Hypotheses.* φ continuous and of positive type.

*Proof route.*

- By positive-type-function the kernel K(a, b) = φ(a⁻¹b) is Matrix.PosSemidef; take H\_φ = Matrix.PosSemidef.KolmogorovSpace and Φ = kolmogorovFeature, so ⟪Φ a, Φ b⟫ = K a b and the span of Φ(G) is dense (inner\_kolmogorovFeature, kolmogorovFeature\_dense).
- For g ∈ G the map a ↦ Φ(g a) has the same kernel, since (g a)⁻¹(g b) = a⁻¹b, and dense span; Tau Ceti's kolmogorovEquiv gives a linear isometric equivalence π\_φ(g) with π\_φ(g)Φ(a) = Φ(ga). Uniqueness of kolmogorovEquiv gives π\_φ(gh) = π\_φ(g)π\_φ(h).
- Strong continuity: ‖Φ(ga) − Φ(a)‖² = 2 Re(φ(e) − φ(a⁻¹ g a)), which tends to 0 as g → e by continuity of φ; density and the uniform bound ‖π\_φ(g)‖ ≤ 1 extend continuity to all vectors (\[BHV\] Theorem C.4.10, proof).
- ptCoeff π\_φ ξ\_φ (g) = ⟪Φ e, Φ g⟫ = φ(g).
- Uniqueness: for (π, H, ξ) the map Φ(a) ↦ π(a)ξ has the same kernel; kolmogorovIsometry and cyclicity give T, and uniqueness of the extension gives intertwining.
- For Proposition C.5.1, domination gives a contraction T : H\_φ → H\_{φ₁} with dense range, intertwining the actions. T\* is injective but need not be isometric. Apply the rectangular polar decomposition to T\*: its initial space is all H\_{φ₁}, and its polar isometry intertwines, since TT\* on H\_{φ₁} and its square root commute with the action. This gives the required isometric intertwiner (BHV Proposition A.1.4, pp. 307–308; upstream OperatorTheory/PolarDecomposition PD-B24–B34).

*Uses.* BHV, Theorem C.5.2: extremal positive-type functions are those whose GNS representation is irreducible. SRU.0 unitary-dual: the GNS representation of a pure normalised function of positive type represents its class in the unitary dual. Gan–Savin, proof of Proposition 11.6: the limit function f is a pure function of positive type, the coefficient of σ.

*API.*

- `gnsSpace` (constructor): For φ ∈ P(G), the Hilbert space H\_φ := Matrix.PosSemidef.KolmogorovSpace of the kernel (a, b) ↦ φ (a⁻¹ \* b).
- `exists_gnsRep` (constructor): The strongly continuous unitary representation π\_φ of G on H\_φ with π\_φ g (Φ a) = Φ (g \* a).
- `gnsVector` (constructor): ξ\_φ := Φ 1.
- `ptCoeff_gnsVector` (characterisation): ptCoeff π\_φ ξ\_φ = φ.
- `gnsVector_cyclic` (characterisation): The span of π\_φ(G) ξ\_φ is dense in H\_φ.
- `nonempty_unitaryEquiv_of_ptCoeff_eq` (universal-property): For a cyclic triple (π, H, ξ) with ptCoeff π ξ = φ, the unique unitary equivalence π\_φ ≃ᵤ π sending ξ\_φ to ξ.
- `gnsEquiv_unique` (extensionality): Two unitary equivalences π\_φ ≃ᵤ π agreeing on ξ\_φ are equal.
- `gns_add_le` (relation): If φ = φ₁ + φ₂ in P(G), there is an isometric intertwiner from π\_{φ₁} into π\_φ (\[BHV\] Proposition C.5.1).

**Checks.**

- `gns_one` (degenerate): For φ = 1, gnsSpace is one-dimensional and gnsRep is the trivial representation.
- `gns_character` (computation): For a continuous unitary character χ, the GNS triple of χ is (χ, ℂ, 1) up to unique unitary equivalence.
- `gns_dirac_discrete` (compatibility): For G = ℤ with the discrete topology and φ = indicator of {0}, gnsRep is unitarily equivalent to the left regular representation on ℓ²(ℤ), with ξ\_φ ↦ δ₀.
- `gns_not_injective_feature` (non-example): For φ = 1 on a nontrivial group the feature map Φ is constant, so the GNS space is not ℓ²(G): the construction quotients by the kernel's radical.

*Acceptance.* For φ = 1, H\_φ is one-dimensional and π\_φ is trivial. For G discrete and φ = δ\_e, π\_φ is the left regular representation on ℓ²(G) (\[BHV\] Example C.4.12).

*Needs:* [*positive-type-function*](#sru-sru-0-positive-type-function); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); Tau Ceti `Matrix.PosSemidef.KolmogorovSpace`; Tau Ceti `Matrix.PosSemidef.kolmogorovFeature`; Tau Ceti `Matrix.PosSemidef.inner_kolmogorovFeature`; Tau Ceti `Matrix.PosSemidef.kolmogorovFeature_dense`; Tau Ceti `Matrix.PosSemidef.kolmogorovIsometry`; Tau Ceti `Matrix.PosSemidef.kolmogorovEquiv`.

*Sources:* \[BHV] Theorem C.4.10 and Definition C.4.11, pp. 376–377: Every function of positive type is the coefficient of a cyclic vector in a unitary representation, unique up to an equivalence carrying cyclic vector to cyclic vector; the proof realises the space by the positive kernel and lets G act by left translation. \[BHV] Proposition C.5.1, p. 379: If φ = φ₁ + φ₂ in P(G) then π\_{φ₁} is contained in π\_φ, and if π\_φ is irreducible then φ₁ is a multiple of φ. \[BHV] Appendix A.1, Proposition A.1.4, pp. 307–308: A bounded intertwiner induces a unitary equivalence between the orthogonal complement of its kernel and the closure of its image, via its polar decomposition. \[PD] Part B, PD-B24–B34; PD-B36 (uniqueness): The complete-space rectangular polar factor gives an isometry from the orthogonal complement of the kernel onto the closure of the image; uniqueness yields equivariance for a bounded intertwiner.

*Planet:* GNS construction.

*Lean:* `gnsSpace`, `exists_gnsRep`, `gnsVector`, `nonempty_unitaryEquiv_of_ptCoeff_eq`

<a id="sru-sru-0-unitary-dual"></a>
#### SRU.0.6 The unitary dual

**The unitary dual** (*unitary-dual*, definition). For a topological group G, the unitary dual Ĝ is the set of unitary-equivalence classes of topologically irreducible strongly continuous unitary representations of G. To avoid quantifying over Hilbert spaces in all universes, Ĝ is realised as the quotient of the set of φ ∈ P₁(G) whose GNS representation π\_φ is topologically irreducible by the relation φ ∼ ψ :⇔ π\_φ ≃ᵤ π\_ψ. For a topologically irreducible strongly continuous unitary (π, H) and a unit vector v, \[π] := the class of ptCoeff π v, which does not depend on v; \[π] = \[ρ] iff π ≃ᵤ ρ; every class is \[π\_φ] for any representative φ.

*Hypotheses.* G a topological group; for the Fell topology and the theorems of SRU.1 G is locally profinite.

*Proof route.*

- Independence of v: in a topologically irreducible π every nonzero v is cyclic (strongly-continuous-unitary, IsTopologicallyIrreducible.cyclic), so by uniqueness in the GNS construction π\_{ptCoeff π v} ≃ᵤ π for every unit v.
- Hence \[π] = \[ρ] iff π\_{ptCoeff π v} ≃ᵤ π\_{ptCoeff ρ w} iff π ≃ᵤ ρ.
- Every class is realised by its GNS representation, which is topologically irreducible by definition of the set.

*Uses.* Gan–Savin, Proposition 11.3: the Steinberg representation is an isolated point of the unitary dual. Gan–Savin, Corollary 11.7 and Propositions 10.5, 10.7: isolated points of the unitary dual weakly contained in a direct sum are summands. SRU.1 fell-topology: the carrier of the Fell topology.

*API.*

- `UnitaryDual` (data): UnitaryDual G : Type u for G : Type u, the quotient of {φ ∈ P₁ G | (gnsRep φ).IsTopologicallyIrreducible} by φ ∼ ψ ↔ Nonempty (gnsRep φ ≃ᵤ gnsRep ψ).
- `UnitaryDual.mk` (constructor): UnitaryDual.mk π hπ hirr v hv : UnitaryDual G for topologically irreducible strongly continuous unitary π and ‖v‖ = 1.
- `UnitaryDual.mk_eq_mk_iff` (extensionality): UnitaryDual.mk π … v … = UnitaryDual.mk ρ … w … ↔ Nonempty (π ≃ᵤ ρ).
- `UnitaryDual.mk_independent` (characterisation): UnitaryDual.mk π … v … does not depend on the unit vector v.
- `UnitaryDual.rep` (projection): A representative strongly continuous unitary representation (the GNS representation of a representative) with UnitaryDual.mk (rep x) = x.
- `UnitaryDual.trivial` (example): The class of the trivial representation, \[1_G].

**Checks.**

- `unitaryDual_trivial_group` (degenerate): For G trivial, UnitaryDual G has exactly one element.
- `unitaryDual_finite_abelian` (compatibility): For G finite abelian with the discrete topology, UnitaryDual G is in bijection with the Pontryagin dual (characters G →\* circle).
- `unitaryDual_mk_ne_characters` (non-example): For G = ℤ/2 the classes of the trivial and the sign character are different, although both are one-dimensional.
- `unitaryDual_mk_two_vectors` (characterisation): For a topologically irreducible π and unit vectors v ≠ w, UnitaryDual.mk π v = UnitaryDual.mk π w.

*Acceptance.* For G abelian the unitary dual is in bijection with the continuous unitary characters, every topologically irreducible strongly continuous unitary representation being one-dimensional (Schur's lemma). For G compact the classes are those of finite-dimensional irreducibles, matching the index set of Peter–Weyl in RepresentationTheory/CompactGroups.

*Needs:* [*gns-construction*](#sru-sru-0-gns-construction); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary).

*Sources:* \[BHV] §F.2, opening paragraph, p. 427; Remark C.4.13, p. 378: The family of all unitary representations is not a set; one restricts to sets of equivalence classes, for instance the unitary dual of irreducible ones, or classes of cyclic representations, which are parametrised by a subset of the functions of positive type. \[GS23] §11, opening paragraph and §11.1, pp. 30–31: Gan–Savin study the topology of the unitary dual of a split p-adic group and its isolated points.

*Planet:* Unitary dual.

<a id="sru-sru-0-pure-iff-irreducible"></a>
#### SRU.0.7 Pure functions of positive type and irreducibility

**Pure functions of positive type and irreducibility** (*pure-iff-irreducible*, theorem). Let G be a topological group. (1) For φ ∈ P₁(G), φ is an extreme point of P₁(G) iff its GNS representation π\_φ is topologically irreducible (\[BHV\] Theorem C.5.2). (2) The extreme points of P≤1(G) are 0 and the extreme points of P₁(G) (\[BHV\] Theorem C.5.5(i)). (3) If π is topologically irreducible, strongly continuous and unitary, every normalised coefficient ptCoeff π v, ‖v‖ = 1, is an extreme point of P₁(G) and of P≤1(G). Extreme points are taken in Mathlib's sense, Set.extremePoints ℝ.

*Hypotheses.* G a topological group; φ continuous of positive type with φ(e) = 1 in (1).

*Proof route.*

- If H\_φ = W ⊕ Wᗮ is a nontrivial invariant orthogonal decomposition, cyclicity makes both projected cyclic vectors nonzero. Their normalised coefficients give φ = sφ₁+(1−s)φ₂ with 0<s<1. If φ₁=φ, equality of coefficients gives ⟪π(g)ξ,P\_Wξ⟫=s⟪π(g)ξ,ξ⟫ for every g. The orbit spans densely, hence P\_Wξ=sξ, which is impossible for a projection and a nonzero ξ with 0<s<1. Thus the decomposition is nonconstant (BHV Theorem C.5.2, pp. 380–381). Orthogonal invariant subspaces can carry equivalent representations; disjointness is not used.
- If π\_φ is irreducible and φ = t φ₁ + (1 − t) φ₂, then t φ₁ ≤ φ in the cone order, so by \[BHV\] Proposition C.5.1 (gns-construction, gns\_add\_le) there is a positive operator A in the commutant of π\_φ with t φ₁ = ⟪ξ\_φ, π\_φ(·) A ξ\_φ⟫; Schur's lemma for topologically irreducible unitary representations (\[BHV\] Theorem A.2.2; owned by the open NoncompactQuantumSymmetry roadmap, M0 item 1, see upstreamImports) makes A scalar, so φ₁ = φ.
- (2): 0 is extreme in P≤1 because φ(e) = 0 forces φ = 0; an element ψ with 0 < ψ(e) < 1 is the convex combination ψ(e)(ψ/ψ(e)) + (1 − ψ(e))0; normalisation forces both summands of a decomposition of an element of ext P₁ into P₁ (\[BHV\] Theorem C.5.5(i), proof).
- (3) follows from (1)–(2) and the GNS uniqueness: π\_{ptCoeff π v} ≃ᵤ π.

*Acceptance.* For G = ℤ/2, P₁(G) is the segment of functions with φ(0) = 1, φ(1) ∈ \[−1, 1\]; its extreme points φ(1) = ±1 are the two characters, and the midpoint φ(1) = 0, the coefficient of the regular representation, is not extreme. For G compact the characters of finite-dimensional irreducibles normalised by dimension are not extreme in general, but normalised diagonal coefficients of irreducibles are.

*Needs:* [*gns-construction*](#sru-sru-0-gns-construction); [*positive-type-function*](#sru-sru-0-positive-type-function); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); Mathlib `Set.extremePoints`.

*Sources:* \[BHV] Theorem C.5.2 and its proof, pp. 380–381: A normalised function of positive type is extremal iff its GNS representation is irreducible; the proof splits the cyclic vector along an invariant decomposition and uses Proposition C.5.1 with Schur's lemma. \[BHV] Theorem C.5.5(i) and proof, p. 383: The extreme points of P≤1(G) are those of P₁(G) together with 0. \[GS23] §11.2, proof of Proposition 11.6, p. 33: Gan–Savin invoke \[BHV, Theorem C.5.2\] for the extremality of normalised coefficients of the irreducible σ and of the πₙ.

*Planet:* Pure positive-type functions.

*Lean:* `mem_extremePoints_positiveTypeOne_iff`

<a id="sru-sru-0-smooth-vectors-unitary"></a>
#### SRU.0.8 Smooth vectors and K-type projectors of unitary representations of locally profinite groups

**Smooth vectors and K-type projectors of unitary representations of locally profinite groups** (*smooth-vectors-unitary*, construction). Let G be locally profinite (compact open subgroups form a neighbourhood basis of e) and π a strongly continuous unitary representation on H. For a compact open subgroup K: H^K is a closed subspace and e\_K is the orthogonal projection onto it; for every open normal K' ⊆ K, e\_K = \[K : K'\]⁻¹ Σ\_{k ∈ K/K'} π(k) e\_{K'}, and e\_K v is the average of k ↦ π(k)v for the Haar probability measure of K. The smooth vectors H^∞ = ⋃\_K H^K form a dense G-stable subspace; with the restricted action they are a smooth representation in the sense of SR.0 with (H^∞)^K = H^K, on which e\_K is SR.0's averaging projector. For a smooth irreducible representation τ of K, trivial on an open normal K' ⊆ K, the K-type projector e\_τ := (dim τ / \[K : K'\]) Σ\_{k ∈ K/K'} conj(χ\_τ(k)) π(k) e\_{K'} is the orthogonal projection onto the τ-isotypic subspace H(τ); the H(τ) are mutually orthogonal and H is their Hilbert sum. Equivalently e\_τ = π(f\_τ) for the smooth function f\_τ on G supported on K with f\_τ = (dim τ / vol K) conj χ\_τ on K; Gan–Savin's normalisation omits the factor dim τ (sourceIssues E1).

*Hypotheses.* G locally profinite; π strongly continuous unitary. τ a smooth irreducible complex representation of the compact open K (finite-dimensional, trivial on some open normal K').

*Proof route.*

- H^K = ⋂\_{k∈K} ker(π(k) − 1) is closed; e\_K is Mathlib's orthogonal projection onto it.
- For K' ⊆ K open normal, P := \[K:K'\]⁻¹ Σ\_{k∈K/K'} π(k) e\_{K'} is well defined (e\_{K'} is K'-invariant on both sides), self-adjoint, idempotent, with range H^K; hence P = e\_K. This is the finite-group averaging that SR.0's averaging-projector uses on smooth vectors.
- Density of H^∞: for v ∈ H and ε > 0, strong continuity gives a compact open K with ‖π(k)v − v‖ < ε on K, hence ‖e\_K v − v‖ ≤ ε; G-stability: π(g)H^K = H^{gKg⁻¹}.
- Smoothness of H^∞: every vector is fixed by a compact open subgroup, so the stabilisers are open (SR.0 is-smooth).
- K-type projectors: on H^{K'} the finite group K/K' acts unitarily and e\_τ is the classical isotypic projector of a finite group (Schur orthogonality for the finite group K/K'); the H(τ) are orthogonal and their sum contains the dense H^∞. The general compact-group version (vector-valued Haar averaging for any compact K) is the projector P\_τ of NoncompactQuantumSymmetry M0; this node is its profinite specialisation by finite sums.

*Uses.* Gan–Savin, Lemma 11.4: the K-type τ of π is detected by ⟨π(f\_τ)v, v⟩ ≠ 0, which passes to the approximating coefficients. Gan–Savin, proof of Proposition 11.6: v and the vₙ may be taken K-fixed, so the coefficients are K-bi-invariant. SRU.2 hilbert-completion: the smooth vectors of the completion of an admissible unitarizable representation are the representation itself.

*API.*

- `fixedSubspace` (data): H^K := ⨅ k ∈ K, ker (π k − 1), the closed subspace of K-fixed vectors.
- `fixedProjection` (constructor): e\_K := orthogonal projection onto the closed subspace H^K, for K a compact open subgroup.
- `fixedProjection_eq_average` (characterisation): For K' ⊆ K open normal, e\_K = \[K:K'\]⁻¹ Σ\_{k ∈ K/K'} π k ∘ e\_{K'}.
- `smoothVectors` (constructor): H^∞ := ⨆ over compact open K of H^K, a G-stable submodule.
- `smoothVectors_dense` (characterisation): For strongly continuous π of a locally profinite G, H^∞ is dense in H.
- `smoothVectors_isSmooth` (compatibility): The restricted action on H^∞ is a smooth representation in the sense of SR.0, with (H^∞)^K = H^K, and e\_K restricts to SR.0's averaging projector.
- `typeProjection` (constructor): e\_τ for a smooth irreducible τ of a compact open K, the orthogonal projection onto the τ-isotypic subspace.
- `typeProjection_orthogonal` (relation): e\_τ e\_σ = 0 for inequivalent τ, σ, and Σ over τ of e\_τ converges strongly to 1.
- `typeProjection_eq_integrated` (compatibility): e\_τ = π(f\_τ) with f\_τ = (dim τ / vol K) · conj χ\_τ on K and 0 off K, for any Haar measure on G.

**Checks.**

- `fixedProjection_trivial` (degenerate): For the trivial representation of G on ℂ, e\_K = 1 for every compact open K.
- `fixedProjection_character` (computation): For G = ℤ\_p acting on ℂ by a character χ of exact conductor pⁿ (n ≥ 1), e\_{ℤ\_p} = 0 and e\_{pⁿℤ\_p} = 1.
- `smoothVectors_proper` (non-example): For ℤ\_p acting on ℓ²(ℕ) by e\_n ↦ χ\_n(g)e\_n (χ\_n of exact conductor pⁿ), the vector Σ e\_n/(n+1) lies in H but not in H^∞: it has infinitely many nonzero components of unbounded conductor.
- `typeProjection_dim_factor` (characterisation): For K finite acting on ℂ\[K\] by the regular representation and τ irreducible of dimension d, the operator (1/|K|) Σ conj χ\_τ(k) π(k) equals e\_τ / d, not e\_τ; the factor d is required.

*Acceptance.* For the trivial representation, e\_K = 1 and e\_τ = 0 for every nontrivial τ. For π irreducible admissible unitarizable of a reductive p-adic group (SRU.2), H^K is finite-dimensional and e\_K H is the completion-independent space V^K.

*Needs:* [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); [*hilbert-direct-sum*](#sru-sru-0-hilbert-direct-sum); `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/van-dantzig`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-vectors`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/compact-open-invariants`; Mathlib `Submodule.orthogonalProjectionOnto`.

*Sources:* \[Cas95] §2.1, definition of P\_K and the sentence after it, p. 20: For a smooth representation the projection P\_K onto the K-invariants is the normalised integral over K, essentially a finite sum, and V decomposes as V^K ⊕ V(K) as representations of K. \[GS23] §11.1, proof of Proposition 11.3, p. 32: Gan–Savin attach to a K-type τ a smooth function f\_τ supported on K with π(f\_τ) the projector onto the τ-isotypic subspace of every unitary representation, and use it in Lemma 11.4. \[GS23] §11, opening paragraph, pp. 30–31: The smooth vectors of a continuous unitary representation of a p-adic group form a dense subspace. \[NQS] M0, Peter–Weyl extension paragraph: The open roadmap defines P\_τ = d\_τ ∫\_K conj(χ\_τ(k)) π(k) dk by vector-valued integration for compact K, with self-adjointness, idempotence and orthogonality; this node is the profinite case by finite sums.

*Planet:* Smooth vectors of a unitary representation.

*Lean:* `fixedSubspace`, `smoothVectors`, `smoothVectors_dense`

### Dependencies

This layer rests on: `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Coverage: **planned**. Remaining work:

- Decompose the GNS construction into its Kolmogorov-space steps (the translation equivalences, the homomorphism property, strong continuity) as lemma nodes when the roadmap moves to lemma level.
- State the K-type projectors for a compact factor C of G\_f × C through NoncompactQuantumSymmetry M0 once that roadmap is in the atlas (see upstreamImports).

## Layer SRU.1: Weak containment and the Fell topology

Weak containment σ ≺ π of unitary representations by uniform approximation on compact sets of positive-type coefficients of σ by finite sums of those of π (\[BHV\] Definition F.1.1), its normalised convex form (Remark F.1.2, the form of Gan–Savin Definition 11.5), weak equivalence, and the API used downstream (reflexivity, transitivity, passage to subrepresentations and direct sums, invariance under unitary equivalence). Milman's converse to the Krein–Milman theorem in a Hausdorff locally convex space (Mathlib has \`closure\_convexHull\_extremePoints\` but not the converse). For G locally profinite: an irreducible σ ≺ π has each normalised coefficient approximated by single normalised coefficients of π (\[BHV\] Proposition F.1.4), proved through K-bi-invariant coefficients and the pointwise topology on K\\G/K. The Fell topology on Ĝ by the neighbourhoods W(π, φ₁…φₙ, Q, ε) (\[BHV\] Definition F.2.1), its description by nets (F.2.2) and by single coefficients at irreducible points (F.2.4), limit and cluster points of sequences L\[πₙ\] ⊆ C\[πₙ\] (Gan–Savin §11.1), isolated points, and the support supp π (F.2.6). The closure theorem: ⊕\_{σ∈S} σ ≺ ⊕\_{τ∈T} τ iff S ⊆ closure(T) (\[BHV\] Exercise F.6.4). Corrected Gan–Savin Proposition 11.6 (an irreducible σ weakly contained in ⊕̂ᵢ πᵢ lies in the Fell closure of {\[πᵢ\]}; no subsequence statement) and Corollary 11.7 (an isolated such σ is some πᵢ).

<a id="sru-sru-1-weak-containment"></a>
#### SRU.1.1 Weak containment of unitary representations

**Weak containment of unitary representations** (*weak-containment*, definition). Let G be a topological group and σ, π strongly continuous unitary representations on Hσ, Hπ. σ is weakly contained in π, σ ≺ π, when for every v ∈ Hσ, every compact Q ⊆ G and every ε > 0 there are w₁, …, wₙ ∈ Hπ with |ptCoeff σ v g − Σᵢ ptCoeff π wᵢ g| < ε for all g ∈ Q (\[BHV\] Definition F.1.1). Equivalently (normalised convex form, Gan–Savin Definition 11.5, \[BHV\] Remark F.1.2): every normalised coefficient ptCoeff σ v, ‖v‖ = 1, is a uniform limit on compact sets of convex combinations of normalised coefficients ptCoeff π w, ‖w‖ = 1. σ and π are weakly equivalent, σ ∼ π, if σ ≺ π and π ≺ σ. It suffices to test v in a subset whose G-translates span a dense subspace (\[BHV\] Lemma F.1.3).

*Hypotheses.* G a topological group; all representations strongly continuous and unitary.

*Proof route.*

- Equivalence of the two forms: if a sum Σ ψᵢ of coefficients of π approximates a normalised φ uniformly on a compact Q ∋ e, then Σ ψᵢ(e) is close to 1 and Σ (ψᵢ(e)/Σⱼψⱼ(e)) (ψᵢ/ψᵢ(e)) is a convex combination of normalised coefficients close to φ on Q; the converse rescales (\[BHV\] Remark F.1.2).
- Reflexivity and invariance under unitary equivalence are immediate; transitivity substitutes approximations, using that coefficients of π are uniformly continuous in the vector (dist\_ptCoeff\_le).
- A closed invariant subrepresentation or a Hilbert summand of π is weakly contained in π; a Hilbert sum ⊕̂ σᵢ ≺ π iff every σᵢ ≺ π, because the coefficient of a finitely supported vector is the sum of the coefficients of its components and finitely supported vectors are dense.
- For Lemma F.1.3, first fix one test vector: expand coefficients of its finite linear combinations of translates, on the enlarged compact sets gᵢ⁻¹Qgⱼ. For different test vectors use the argument of BHV pp. 421–423: the vectors with approximable coefficients form a closed G-invariant subspace; to prove closure under addition, project one cyclic subspace into the orthogonal complement of the other and use Proposition A.1.4 to identify the resulting cyclic representation with a subrepresentation of the second. Orthogonal sums then give coefficient sums. Expanding cross terms for two unrelated test vectors does not suffice.

*Uses.* Gan–Savin, Propositions 10.5 and 10.7: the L² spaces of local homogeneous spaces are weakly contained in automorphic L² spaces, via Poincaré series. Gan–Savin, Proposition 11.6 and Corollary 11.7: the hypothesis σ ≺ ⊕̂ᵢ πᵢ. SRU.1 fell-topology: convergence of nets in the Fell topology is weak containment in the sums over subnets.

*API.*

- `WeaklyContainedIn` (data): For a family (πᵢ): σ ≺ ⊕̂ πᵢ :⇔ ∀ v, ∀ Q compact, ∀ ε > 0, ∃ finitely many (i\_j, w\_j), ∀ g ∈ Q, ‖ptCoeff σ v g − Σ\_j ptCoeff π\_{i\_j} w\_j g‖ < ε; σ ≺ π is the case of a one-member family.
- `weaklyContained_iff_convex` (characterisation): σ ≺ π iff each normalised ptCoeff σ v lies in the closure, for uniform convergence on compacta, of the convex hull of the normalised coefficients of π.
- `WeaklyContained.refl` (structure): σ ≺ σ.
- `WeaklyContained.trans` (structure): σ ≺ π → π ≺ ρ → σ ≺ ρ.
- `WeaklyContained.of_unitaryEquiv` (compatibility): If σ ≃ᵤ σ' and π ≃ᵤ π' then σ ≺ π ↔ σ' ≺ π'.
- `WeaklyContained.of_subrepresentation` (structure): A closed invariant subrepresentation of π is weakly contained in π.
- `hilbertSum_weaklyContained_iff` (characterisation): hilbertSum σ ≺ π ↔ ∀ i, σ i ≺ π.
- `WeaklyContained.of_total` (characterisation): If the coefficients of vectors in a set S ⊆ Hσ with dense span of G-translates are approximable, then σ ≺ π (\[BHV\] Lemma F.1.3).
- `WeaklyEquivalent` (data): σ ∼ π :⇔ σ ≺ π ∧ π ≺ σ.

**Checks.**

- `weaklyContained_refl` (degenerate): Every strongly continuous unitary representation is weakly contained in itself.
- `trivial_weaklyContained_regular_int` (computation): For G = ℤ (discrete), the trivial representation is weakly contained in the left regular representation on ℓ²(ℤ): the unit vectors (2N+1)^{-1/2} 1\_{\[−N, N\]} have coefficients tending to 1 uniformly on finite sets.
- `trivial_not_subrep_regular_int` (non-example): For G = ℤ the left regular representation on ℓ²(ℤ) has no nonzero invariant vector, so weak containment of the trivial representation is not containment.
- `weaklyContained_finite_iff` (compatibility): For G finite and σ irreducible, σ ≺ π iff Hom\_G(σ, π) ≠ 0.

*Acceptance.* σ ≺ σ ⊕̂ ρ for every ρ. For G compact and σ irreducible, σ ≺ π iff σ is unitarily equivalent to a subrepresentation of π (\[BHV\] Proposition F.1.8).

*Needs:* [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); [*hilbert-direct-sum*](#sru-sru-0-hilbert-direct-sum); [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); [*gns-construction*](#sru-sru-0-gns-construction).

*Sources:* \[BHV] Definition F.1.1, Remark F.1.2, Lemma F.1.3, pp. 420–422: π ≺ ρ when every function of positive type associated to π is a uniform limit on compacta of sums of functions associated to ρ; for normalised functions one may use convex combinations of normalised ones; it suffices to check on a set of vectors with total translates. \[GS23] §11.2, Definition 11.5, p. 33: σ is weakly contained in π when each normalised coefficient of σ is approximated uniformly on compact sets by convex combinations of normalised coefficients of π. \[BHV] Appendix F.1, Lemma F.1.3 and proof, pp. 421–423; Appendix A.1, Proposition A.1.4, pp. 307–308: Testing on a set whose translates span densely is sufficient; the proof handles sums of cyclic subspaces using an equivariant polar decomposition. \[PD] Part B, PD-B24–B34; PD-B36 (uniqueness): The complete-space rectangular polar factor gives an isometry from the orthogonal complement of the kernel onto the closure of the image; uniqueness yields equivariance for a bounded intertwiner.

*Planet:* Weak containment.

*Lean:* `WeaklyContainedIn`

<a id="sru-sru-1-milman-converse"></a>
#### SRU.1.2 Milman's converse to the Krein–Milman theorem

**Milman's converse to the Krein–Milman theorem** (*milman-converse*, theorem). Let E be a real Hausdorff topological vector space that is locally convex (Mathlib's LocallyConvexSpace ℝ E), F ⊆ E, and suppose C := closure (convexHull ℝ F) is compact. Then every extreme point of C lies in closure F: Set.extremePoints ℝ C ⊆ closure F. Mathlib's closure_convexHull_extremePoints is the Krein–Milman theorem (C is the closed convex hull of its extreme points); this is its converse.

*Hypotheses.* E real, Hausdorff, locally convex; complex spaces are used through restriction of scalars. closure (convexHull ℝ F) compact.

*Proof route.*

- Let x ∈ ext C and suppose x ∉ closure F. Since closure F ⊆ C is compact, choose a closed convex neighbourhood U of 0 with x ∉ closure F + U + U (local convexity and regularity of the uniform structure).
- Cover closure F by finitely many translates yᵢ + U, yᵢ ∈ closure F, and put Cᵢ := closure (convexHull (closure F ∩ (yᵢ + U))) ⊆ yᵢ + U, a compact convex set.
- The convex hull of the finite union of compact convex Cᵢ is the image of a simplex times ∏ Cᵢ, hence compact; it contains F, so it equals C.
- Write x = Σ tᵢ cᵢ with cᵢ ∈ Cᵢ; extremality of x in C forces x = cᵢ for some i (Mathlib's extremePoints_convexHull_subset in the finite form), so x ∈ yᵢ + U ⊆ closure F + U, a contradiction.

*Acceptance.* In ℝ with F = {0, 1} ∪ {1/2}, C = \[0, 1] and its extreme points 0, 1 lie in F. In ℝ² with F the circle, C is the closed disc and its extreme points are exactly the circle = closure F. Compactness cannot be dropped: in ℓ²(ℕ) with the norm topology and F the standard basis {eₙ}, the closed convex hull C contains 0 (as the limit of (e₁ + ⋯ + eₙ)/n), 0 is extreme in C because C lies in the positive cone, and 0 ∉ closure F since every ‖eₙ‖ = 1; C is not compact.

*Needs:* Mathlib `LocallyConvexSpace`; Mathlib `convexHull`; Mathlib `Set.extremePoints`; Mathlib `extremePoints_convexHull_subset`.

*Sources:* \[BHV] Proof of Proposition F.1.4, p. 423: Bekka–de la Harpe–Valette use the standard fact that an extreme point of a compact convex set C, the closed convex hull of F, lies in the closure of F, citing Conway's Theorem 7.8. \[GS23] §11.2, proof of Proposition 11.6, p. 33: Gan–Savin conclude that an extremal point of the weak-\* closed convex hull C of F lies in the closure of F, attributing it to the Krein–Milman theorem in Conway's book. \[CitedOnly] J. B. Conway, A course in functional analysis, 2nd ed., Theorem V.7.8 (not read): The cited textbook statement of Milman's converse.

*Planet:* Milman's converse to Krein–Milman.

*Lean:* `extremePoints_closure_convexHull_subset_closure`

<a id="sru-sru-1-positive-type-integral-form"></a>
#### SRU.1.3 Positive type through the integrated form

**Positive type through the integrated form** (*positive-type-integral-form*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp\_2n(F\_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. Every φ ∈ P(G) is bounded and continuous, so it defines an element of L^∞(G, μ) with ‖φ‖\_∞ = φ(e). Conversely, φ ∈ L^∞(G, μ) agrees μ-almost everywhere with a continuous function of positive type iff ∫∫ f(x) conj(f(y)) φ(y⁻¹x) dμ(x) dμ(y) ≥ 0 for every f ∈ C\_c(G), equivalently ⟨φ, f\* ∗ f⟩ ≥ 0 for every f ∈ L¹(G) (\[BHV\] Lemma C.5.3, after Godement).

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp\_2n(F\_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

*Proof route.*

- φ ∈ P(G) is bounded by φ(e) (positive-type-function) and continuous; ‖φ‖\_∞ = φ(e) because φ is continuous at e.
- The integrated inequality for continuous φ is the limit of the finite sums defining positive type (Riemann-sum approximation of the double integral on the compact support of f).
- The converse is Godement’s representation theorem for a positive bounded functional on the convolution algebra L¹(G): construct its nondegenerate integrated GNS representation and recover its continuous positive-type coefficient. Comparing the L¹ pairings identifies that coefficient with φ almost everywhere. BHV Lemma C.5.3, p. 382, states this result and refers to Folland (3.35) and Dixmier 13.4.4; it does not supply the proof. The integrated-GNS comparison is an explicit gap below. An arbitrary approximate-identity family has not been proved uniformly equicontinuous, so continuity cannot be inferred that way.

*Acceptance.* For G discrete, the integrated condition with f = Σ cᵢ δ\_{gᵢ} is literally the defining finite sum. The constant function −1 fails the integrated test for any f ≠ 0 with ∫ f ≠ 0.

*Needs:* [*positive-type-function*](#sru-sru-0-positive-type-function); [*gns-construction*](#sru-sru-0-gns-construction); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); Mathlib `MeasureTheory.Measure.haar`; Mathlib `MeasureTheory.Lp`.

*Sources:* \[BHV] Lemma C.5.3, p. 382: A function in L^∞(G) agrees locally almost everywhere with a continuous function of positive type iff ⟨φ, f\* ∗ f⟩ ≥ 0 for all f ∈ L¹(G); the proof is in Folland and Dixmier. \[CitedOnly] G. B. Folland, A course in abstract harmonic analysis, (3.35); J. Dixmier, Les C\*-algèbres et leurs représentations, 13.4.4 (not read): The cited proofs.

<a id="sru-sru-1-positive-type-weak-star-compact"></a>
#### SRU.1.4 Weak-\* compactness of P≤1(G)

**Weak-\* compactness of P≤1(G)** (*positive-type-weak-star-compact*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. With L^∞(G, μ) identified with the dual of L¹(G, μ) through the integral pairing (BanachSpaceTheory B5), the set P≤1(G) is weak-\* compact and convex; its extreme points are 0 and the pure functions of positive type (SRU.0 pure-iff-irreducible); the convex hull of ext P₁(G) is weak-\* dense in P₁(G) (\[BHV] Lemma C.5.4 and Theorem C.5.5).

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

*Proof route.*

- P≤1(G) lies in the closed unit ball of L^∞(G) = L¹(G)\* (positive-type-integral-form: ‖φ‖\_∞ = φ(e) ≤ 1), which is weak-\* compact (Mathlib's WeakDual.isCompact_closedBall, Banach–Alaoglu).
- P≤1(G) is weak-\* closed: the integrated inequalities ⟨φ, f\* ∗ f⟩ ≥ 0 are closed conditions, and positive-type-integral-form returns a continuous function of positive type; φ(e) ≤ 1 is ‖φ‖\_∞ ≤ 1.
- Krein–Milman (Mathlib's closure_convexHull_extremePoints) gives density of the convex hull of ext P≤1(G) = ext P₁(G) ∪ {0} in P≤1(G); renormalising an approximating net as in \[BHV] Theorem C.5.5(ii) gives density in P₁(G).

*Acceptance.* For G discrete, P₁(G) is itself weak-\* compact, since φ(e) = ⟨φ, δ\_e⟩ is weak-\* continuous (\[BHV] after Lemma C.5.4). For G = S¹, compact but not discrete, the characters χₙ ∈ P₁ tend weak-\* to 0 ∉ P₁ (Riemann–Lebesgue), so P₁(G) is not weak-\* closed (\[BHV] Remark C.5.7); compactness holds for P≤1(G) only.

*Needs:* [*positive-type-integral-form*](#sru-sru-1-positive-type-integral-form); [*pure-iff-irreducible*](#sru-sru-0-pure-iff-irreducible); Mathlib `WeakDual.isCompact_closedBall`; Mathlib `closure_convexHull_extremePoints`.

*Sources:* \[BHV] Lemma C.5.4 and Theorem C.5.5, pp. 382–383: P≤1(G) is weak-\* compact in L^∞(G); its extreme points are those of P₁(G) and 0; the convex hull of ext P₁(G) is weak-\* dense in P₁(G). \[GS23] §11.2, proof of Proposition 11.6, p. 33: L^∞(G) is the dual of L¹(G), its unit ball is weak-\* compact by Alaoglu's theorem, and the weak-\* closed convex hull of normalised coefficients is compact.

<a id="sru-sru-1-raikov"></a>
#### SRU.1.5 Raikov's theorem

**Raikov's theorem** (*raikov*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. On P₁(G) the weak-\* topology (from L^∞ = (L¹)\*) and the topology of uniform convergence on compact subsets of G coincide (\[BHV] Theorem C.5.6). Consequently the convex hull of the pure normalised functions of positive type is dense in P₁(G) for uniform convergence on compacta (Proposition C.5.8).

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

*Proof route.*

- Uniform on compacta ⇒ weak-\*: for f ∈ L¹ and ε > 0 choose a compact Q carrying all but ε of ∫|f|; on Q the functions are uniformly close, off Q they are bounded by 1 (\[BHV] proof of C.5.6, first part).
- Weak-\* ⇒ uniform on compacta: for a net φᵢ → φ in P₁(G) weak-\*, choose f ∈ C_c(G) with f ≥ 0, ∫ f = 1 supported near e so that φ is close to 1 there; the convolutions f ∗ φᵢ converge to f ∗ φ uniformly on compacta (equicontinuity of translates of f in L¹), and the estimate |ψ(x) − (f ∗ ψ)(x)|² ≤ 2 Re(1 − ⟨ψ, f⟩)-type bound from positive-type-function (C.4.2(iii)) controls φᵢ − f ∗ φᵢ uniformly once ⟨φᵢ, f⟩ → ⟨φ, f⟩ is close to 1 (\[BHV] proof of C.5.6, second part).
- Density: combine with positive-type-weak-star-compact.

*Acceptance.* The statement fails on P≤1(G): for G = S¹ the characters χₙ ∈ P₁ converge weak-\* to 0 but χₙ(1) = 1 (\[BHV] Remark C.5.7). For G discrete both topologies are pointwise convergence on P₁(G).

*Needs:* [*positive-type-function*](#sru-sru-0-positive-type-function); [*positive-type-weak-star-compact*](#sru-sru-1-positive-type-weak-star-compact); [*positive-type-integral-form*](#sru-sru-1-positive-type-integral-form); Mathlib `MeasureTheory.Measure.haar`.

*Sources:* \[BHV] Theorem C.5.6 and proof, Remark C.5.7, Proposition C.5.8, pp. 384–386: On P₁(G) the weak-\* topology and the topology of uniform convergence on compacta coincide; this fails on P≤1(G); hence the convex hull of the pure functions is dense in P₁(G) for uniform convergence on compacta. \[GS23] §11.2, proof of Proposition 11.6, p. 33: By a theorem of Raikov \[BHV, Theorem C.5.6] the weak-\* limit is a uniform limit on compacta.

*Planet:* Raikov's theorem.

*Lean:* `raikov`

<a id="sru-sru-1-irreducible-weak-containment"></a>
#### SRU.1.6 Irreducible weak containment by single coefficients

**Irreducible weak containment by single coefficients** (*irreducible-weak-containment*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. Let σ be topologically irreducible and σ ≺ π. Then for every unit v ∈ Hσ the normalised coefficient ptCoeff σ v is a uniform limit on compact subsets of normalised coefficients ptCoeff π w, ‖w‖ = 1, of π itself, not only of their convex combinations (\[BHV] Proposition F.1.4). For a family (πᵢ) and σ ≺ ⊕̂ᵢ πᵢ, the approximating coefficients can be chosen each a normalised coefficient of a single πᵢ.

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. σ topologically irreducible; π strongly continuous unitary.

*Proof route.*

- Let F be the set of normalised coefficients of π (for a family, the union over i of those of πᵢ), and C the weak-\* closure of its convex hull in L^∞(G) = L¹(G)\* (BanachSpaceTheory B5, see upstreamImports); C ⊆ P≤1(G) is compact and convex (positive-type-weak-star-compact).
- By weak containment ptCoeff σ v ∈ C (uniform convergence on compacta implies weak-\* convergence for bounded functions: raikov, easy half).
- ptCoeff σ v is extreme in P≤1(G) (pure-iff-irreducible), hence in C; milman-converse puts it in the weak-\* closure of F.
- A net in F ⊆ P₁(G) converging weak-\* to a point of P₁(G) converges uniformly on compacta (raikov).
- For G locally profinite this last step is elementary (Gan–Savin, proof of Proposition 11.6): taking v and the approximants fixed by a small compact open K, the coefficients are K-bi-invariant and uniform convergence on compacta is pointwise convergence on K-double cosets, tested against the normalised indicators of KgK (smooth-vectors-unitary).

*Uses.* Gan–Savin, proof of Proposition 11.6: the extremal limit coefficient is approximated by single coefficients of the πₙ. Gan–Ichino, proof of Proposition A.2: the same argument for metaplectic covers Mp_2n(F_S) and products with compact groups. SRU.1 fell-topology: neighbourhoods of an irreducible point are described by single coefficients (\[BHV] Proposition F.2.4).

*Acceptance.* For G finite, σ irreducible and σ ≺ π, the statement gives a unit vector of π whose coefficient equals ptCoeff σ v exactly, since uniform approximation on the finite set G by a compact set of coefficients attains the limit. The conclusion fails for reducible σ: for G = ℤ/2, σ the regular representation and π = 1 ⊕ sgn, σ ≺ π but the coefficient of (1, 1)/√2 in σ, the indicator of 0, is not a normalised coefficient of 1 or of sgn.

*Needs:* [*weak-containment*](#sru-sru-1-weak-containment); [*milman-converse*](#sru-sru-1-milman-converse); [*positive-type-weak-star-compact*](#sru-sru-1-positive-type-weak-star-compact); [*raikov*](#sru-sru-1-raikov); [*pure-iff-irreducible*](#sru-sru-0-pure-iff-irreducible); [*smooth-vectors-unitary*](#sru-sru-0-smooth-vectors-unitary); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient).

*Sources:* \[BHV] Proposition F.1.4 and its proof, p. 423: If an irreducible π is weakly contained in ρ, each normalised positive-type function of π is approximated uniformly on compacta by normalised positive-type functions associated to ρ; the proof uses compactness of the weak-\* closed convex hull, extremality and Raikov's theorem. \[GS23] §11.2, proof of Proposition 11.6, p. 33: For p-adic G one may take v and the vₙ fixed by a small compact open K, so the coefficients are K-bi-invariant and uniform convergence on compacta reduces to pointwise convergence on K-double cosets; Gan–Savin call this step banal.

*Lean:* `exists_coeff_approx_of_weaklyContainedIn`

<a id="sru-sru-1-fell-topology"></a>
#### SRU.1.7 The Fell topology on the unitary dual

**The Fell topology on the unitary dual** (*fell-topology*, definition). Let G be a topological group and Ĝ its unitary dual (SRU.0). For x = \[π\] ∈ Ĝ, positive-type coefficients φ₁, …, φₙ of π, a compact Q ⊆ G and ε > 0, let W(x, φ₁, …, φₙ, Q, ε) be the set of y = \[ρ\] ∈ Ĝ such that each φᵢ is within ε on Q of a finite sum of positive-type coefficients of ρ. These sets form a basis of the Fell topology on Ĝ (\[BHV\] Definition F.2.1). A net yⱼ converges to x iff π ≺ ⊕̂\_{k} ρ\_k for the representatives ρ\_k of every subnet (\[BHV\] Proposition F.2.2); for G as in SRU.1 irreducible-weak-containment, single normalised coefficients of ρ suffice in W (\[BHV\] Proposition F.2.4). For a sequence (xₙ), the limit points L\[xₙ\] (xₙ → x) and cluster points C\[xₙ\] (x a limit point of a subsequence) satisfy L ⊆ C; x ∈ L\[xₙ\] iff for some, equivalently every, unit v there are unit vₙ with ptCoeff πₙ vₙ → ptCoeff π v uniformly on compacta (Gan–Savin §11.1). x is isolated when {x} is open. The support of a unitary representation π is supp π = {x ∈ Ĝ : rep x ≺ π}, a closed subset (\[BHV\] Definition F.2.6). Ĝ is not Hausdorff in general, so L\[xₙ\] can have several points.

*Hypotheses.* G a topological group for the definition; G as in SRU.1 irreducible-weak-containment for the single-coefficient basis and the 'some, equivalently every' clause. The criterion using one sequence of single normalised coefficients assumes G second-countable locally compact; the basic topology and net formulation retain their stated generality.

*Proof route.*

- For intersections of basic neighbourhoods centred at x, combine coefficient lists and compact sets and reduce ε. For the full basis axiom at any point y in such a set, take the finitely many approximating vectors witnessing membership, keep the positive error slack, and approximate their coefficients at a nearby representation. The triangle inequality yields a basic neighbourhood of y contained in the original set (BHV Definition F.2.1, pp. 425–426).
- Net characterisation: membership of y in W(x, …) is an approximation of finitely many coefficients of x by sums of coefficients of y; along a net this is weak containment in the Hilbert sum over any subnet (\[BHV\] Proposition F.2.2).
- Single coefficients: by irreducible-weak-containment, if x is approximated by sums of coefficients of a net it is approximated by single normalised coefficients (\[BHV\] Proposition F.2.4).
- For the sequence criterion assume G second countable and locally compact. A nonzero vector in an irreducible representation is cyclic. Approximate any other vector by a finite linear combination of its translates; the same combination of the per-index approximating vectors controls its coefficient on enlarged compact sets. Renormalise and diagonalise over a compact exhaustion with errors tending to zero. This preserves the index n and proves some ⇒ every and convergence. Weak containment in the sum over the entire sequence alone proves only membership in its closure, not convergence.
- supp π is closed: if x is in its closure, approximations of coefficients of x by sums of coefficients of points of supp π, themselves approximated by coefficients of π, compose.

*Uses.* Gan–Savin, Theorem 11.1: Miličić's theorem identifies L\[πₙ\] = C\[πₙ\] with the constituents of the character limit. Gan–Savin, Proposition 11.3: isolation of the Steinberg representation is a statement about the Fell topology. Gan–Savin, Lemma 10.8: isolation of discrete series in the generic automorphic spectrum with respect to the Fell topology.

*API.*

- `UnitaryDual.instTopologicalSpace` (instance): The Fell topology on UnitaryDual G, TopologicalSpace.generateFrom of the sets W(x, φs, Q, ε).
- `UnitaryDual.mem_nhds_iff_coeff` (characterisation): For G as in SRU.1, s ∈ 𝓝 x iff s contains some W̃(x, φs, Q, ε) defined with single normalised coefficients.
- `UnitaryDual.tendsto_iff_weaklyContained` (characterisation): A net y → x iff rep x ≺ hilbertSum over every subnet (\[BHV\] Proposition F.2.2).
- `UnitaryDual.tendsto_iff_exists_coeff` (characterisation): For G second-countable locally compact, a sequence xₙ → x iff for some (equivalently every) unit v there are unit vₙ with ptCoeff (rep xₙ) vₙ → ptCoeff (rep x) v uniformly on compacta.
- `UnitaryDual.limitPoints` (data): L\[x\] := {y | Tendsto x atTop (𝓝 y)} for a sequence x : ℕ → UnitaryDual G.
- `UnitaryDual.clusterPoints` (data): C\[x\] := {y | ∃ φ strictly monotone, Tendsto (x ∘ φ) atTop (𝓝 y)}; limitPoints ⊆ clusterPoints.
- `UnitaryDual.IsIsolated` (data): IsIsolated x :⇔ IsOpen {x}.
- `InFellClosure` (characterisation): For a family (πᵢ) of representations: σ lies in the Fell closure of {\[πᵢ\]} iff every basic neighbourhood W(σ, φ₁…φₙ, Q, ε) built from coefficients of σ contains some \[πᵢ\]; the form in which the suggested file states Proposition 11.6.
- `IsFellIsolatedIn` (characterisation): σ is isolated relative to a family (πᵢ) iff some basic neighbourhood of σ contains only members unitarily equivalent to σ.
- `supp` (constructor): supp π := {x | rep x ≺ π}, a closed subset of UnitaryDual G.
- `UnitaryDual.isOpen_setOf_apply_ne_zero` (characterisation): For G locally profinite and f ∈ C\_c^∞(G), {x | (rep x)(f) ≠ 0} is open: if π(f)v ≠ 0 for a smooth unit v, ‖π(f)v‖² is a finite combination of values of ptCoeff π v, which nearby points approximate.
- `UnitaryDual.discreteTopology_of_finite` (example): For G finite with the discrete topology, the Fell topology is discrete.

**Checks.**

- `fell_discrete_finite` (computation): For G = ℤ/3 every point of UnitaryDual G is isolated.
- `fell_int_circle` (compatibility): For G = ℤ, the bijection between UnitaryDual G and the circle (unit-modulus characters n ↦ zⁿ) is a homeomorphism for the Fell topology and the usual topology of the circle, as for the compact-open topology on PontryaginDual ℤ (\[BHV\] Example F.2.5(i)).
- `limitPoints_subset_clusterPoints` (characterisation): For every sequence x, limitPoints x ⊆ clusterPoints x.
- `fell_not_t2_sl2` (non-example): For SL₂(ℚ\_p) the Fell topology is not Hausdorff: a sequence of complementary-series representations has both 1 and St as limit points.

*Acceptance.* For G finite (discrete and compact) the Fell topology on Ĝ is discrete (\[BHV\] Example F.2.5(ii)). For SL₂ or PGL₂ over a p-adic field, the end of the spherical complementary series converges to both the trivial and the Steinberg representation, so L\[xₙ\] has two points and Ĝ is not Hausdorff (see SRU.4 steinberg-isolated, rank-one non-example).

*Needs:* [*unitary-dual*](#sru-sru-0-unitary-dual); [*weak-containment*](#sru-sru-1-weak-containment); [*irreducible-weak-containment*](#sru-sru-1-irreducible-weak-containment); Mathlib `TopologicalSpace.generateFrom`.

*Sources:* \[BHV] Definition F.2.1, Propositions F.2.2 and F.2.4, Example F.2.5, Definition F.2.6, pp. 427–429: The Fell topology is generated by the sets W(π, φ₁, …, φₙ, Q, ε); convergence of nets is weak containment in sums over subnets; at irreducible points single coefficients suffice; it is discrete for compact groups, the dual topology for abelian groups, and not Hausdorff for the ax + b group; the support of π is the set of irreducibles weakly contained in π. \[GS23] §11.1, limit and cluster points, pp. 31: Gan–Savin define limit points by uniform convergence on compacta of matrix coefficients for some, equivalently any, coefficient, cluster points as limit points of subsequences, note L ⊆ C, and that the unitary dual is not Hausdorff.

*Planet:* Fell topology.

*Lean:* `InFellClosure`, `IsFellIsolatedIn`

<a id="sru-sru-1-weak-containment-sum-closure"></a>
#### SRU.1.8 Weak containment of sums and Fell closure

**Weak containment of sums and Fell closure** (*weak-containment-sum-closure*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. For subsets S, T ⊆ Ĝ, the Hilbert sum ⊕\_{x∈S} rep x is weakly contained in ⊕\_{y∈T} rep y iff S ⊆ closure T in the Fell topology; in particular the two sums are weakly equivalent iff closure S = closure T (\[BHV] Exercise F.6.4). Weak containment ignores multiplicities: ⊕̂ᵢ πᵢ ∼ ⊕\_{y ∈ T} rep y for T the set of classes of the πᵢ.

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use.

*Proof route.*

- (⇐) If x ∈ closure T, every basic neighbourhood W(x, φ, Q, ε) meets T, so each coefficient of rep x is approximated by sums of coefficients of a single summand of ⊕\_T; hence rep x ≺ ⊕\_T, and hilbertSum_weaklyContained_iff gives ⊕\_S ≺ ⊕\_T.
- (⇒) For x ∈ S, rep x ≺ ⊕\_T with rep x irreducible; irreducible-weak-containment (family form) approximates each normalised coefficient of rep x by a normalised coefficient of a single rep y, y ∈ T; so every basic neighbourhood of x meets T.
- Multiplicities: a coefficient of a finitely supported vector of ⊕̂ᵢ πᵢ is a sum of coefficients of the πᵢ, each of which is a coefficient of rep \[πᵢ] by unitary equivalence; conversely each rep y, y ∈ T, is a summand.

*Acceptance.* With S = T the statement is reflexivity; with T = ∅ it says only S = ∅ is weakly contained in the zero representation. For G = ℤ and T the set of characters n ↦ e^{inθ} with θ/2π rational, closure T is the whole circle, so the trivial representation, indeed every character, is weakly contained in ⊕\_T.

*Needs:* [*irreducible-weak-containment*](#sru-sru-1-irreducible-weak-containment); [*fell-topology*](#sru-sru-1-fell-topology); [*weak-containment*](#sru-sru-1-weak-containment); [*hilbert-direct-sum*](#sru-sru-0-hilbert-direct-sum).

*Sources:* \[BHV] Exercise F.6.4, p. 444: For subsets S, T of the unitary dual, ⊕\_{σ∈S} σ is weakly contained in ⊕\_{τ∈T} τ iff S lies in the Fell closure of T; the two sums are weakly equivalent iff the closures agree. \[GS23] §11.2, Proposition 11.6, p. 33, as corrected: The weak-containment hypothesis of Proposition 11.6 is the case S = {σ}, T = {\[πᵢ]} of this exercise; the paper's sequential conclusion is replaced by this set-closure statement (PAPER-GAN-SAVIN-23-B/E17).

*Planet:* Weak containment and Fell closure.

<a id="sru-sru-1-gan-savin-closure"></a>
#### SRU.1.9 Gan–Savin Proposition 11.6, corrected

**Gan–Savin Proposition 11.6, corrected** (*gan-savin-closure*, theorem). Let G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. Let (πᵢ)\_{i ∈ ι} be topologically irreducible strongly continuous unitary representations, π = ⊕̂ᵢ πᵢ, and σ a topologically irreducible strongly continuous unitary representation with σ ≺ π. Then \[σ] lies in the Fell closure of {\[πᵢ] : i ∈ ι}. No convergence of a subsequence with increasing original indices is asserted: for G = G₂(ℚ₅), π₁ = σ = St_G and πₙ = 1_G for n ≥ 2, σ ≺ π while every increasing subsequence is eventually 1_G, which does not converge to the isolated point \[St_G] (Proposition 11.3, SRU.4).

*Hypotheses.* G a second-countable locally compact group with a left Haar measure μ. This covers reductive groups over local fields, finite central covers such as Mp_2n(F_S), and finite products of these with compact groups, the generality Gan–Savin (Proposition 10.5) and Gan–Ichino (Proposition A.2) use. ι arbitrary (Gan–Savin take ι = ℕ).

*Proof route.*

- Apply weak-containment-sum-closure with S = {\[σ]} and T = {\[πᵢ]}, using that π is weakly equivalent to ⊕\_{y ∈ T} rep y.
- Gan–Savin's proof (weak-\* compactness of the closed convex hull of normalised coefficients in L^∞(G), extremality by \[BHV] Theorem C.5.2, the Krein–Milman converse and K-bi-invariance) is the argument of irreducible-weak-containment; it produces approximating coefficients from the set of summands, not along an increasing subsequence (PAPER-GAN-SAVIN-23-B/E17).

*Acceptance.* The counterexample to the printed subsequence form: G = G₂(ℚ₅), π₁ = St_G, πₙ = 1_G (n ≥ 2); σ = St_G ≺ π trivially, \[St_G] ∈ closure {\[πᵢ]} because it is \[π₁], and no increasing subsequence converges to \[St_G]. If the \[πᵢ] are pairwise distinct and \[σ] is not among them, the conclusion still produces a net of distinct \[πᵢ] converging to \[σ].

*Needs:* [*weak-containment-sum-closure*](#sru-sru-1-weak-containment-sum-closure); [*irreducible-weak-containment*](#sru-sru-1-irreducible-weak-containment).

*Sources:* \[GS23] §11.2, Proposition 11.6 and proof, p. 33: Gan–Savin state that an irreducible unitary σ weakly contained in the Hilbert sum of a sequence of irreducible unitary πₙ is a limit of a subsequence of the πₙ; the correct conclusion is the closure statement (PAPER-GAN-SAVIN-23-B/E17). \[BHV] Exercise F.6.4, p. 444: The set-closure formulation of weak containment of sums.

*Lean:* `inFellClosure_of_weaklyContainedIn`

<a id="sru-sru-1-gan-savin-isolated-summand"></a>
#### SRU.1.10 Isolated representations weakly contained in a sum are summands

**Isolated representations weakly contained in a sum are summands** (*gan-savin-isolated-summand*, theorem). In the setting of gan-savin-closure, if moreover \[σ\] is isolated in Ĝ, or more generally isolated in a subset R ⊆ Ĝ with the induced Fell topology such that R contains \[σ\] and every \[πᵢ\], then σ is unitarily equivalent to πᵢ for some i (Gan–Savin Corollary 11.7; the relative form is the one Gan–Ichino use, with R the generic unitary representations of Mp\_2n(F\_S) with exponents bounded by c < ½). In particular, for G = G₁ × ⋯ × G\_m × C with each Gⱼ a reductive p-adic group and C compact, an irreducible σ = σ₁ ⊗ ⋯ ⊗ σ\_m ⊗ σ\_C whose p-adic factors are isolated in the unitary duals of the Gⱼ and that is weakly contained in a Hilbert sum of irreducibles is one of the summands.

*Hypotheses.* Setting of gan-savin-closure; \[σ\] isolated. For the product statement: isolation of \[σ\] in Ĝ follows from isolation of each \[σⱼ\] in Ĝⱼ and discreteness of Ĉ, via the product description of the unitary dual of a product with a compact factor (each irreducible of G × C is an outer tensor product with a finite-dimensional irreducible of C).

*Proof route.*

- {\[σ\]} is open and meets closure {\[πᵢ\]} (gan-savin-closure), hence meets {\[πᵢ\]}: \[σ\] = \[πᵢ\] for some i, so σ ≃ᵤ πᵢ (UnitaryDual.mk\_eq\_mk\_iff).
- Relative form: {\[σ\]} is open in R and meets closure {\[πᵢ\]} ∩ R, the closure of {\[πᵢ\]} in R, hence meets {\[πᵢ\]}.
- For a compact factor C, its finite-dimensional irreducible τ-isotypic projector (NoncompactQuantumSymmetry M0) gives an open condition near σ⊗τ. Compactness and Schur identify the τ-isotypic part with a Hilbert multiplicity space tensored with τ, and the commuting G-action acts on that space. Test finitely many coefficients on a basis of τ to transfer isolation from G to G×C. For several reductive factors also use the type-I tensor-product and Fell-topology compatibility; this requires the precise product-dual theorem, recorded as a gap below. Discreteness of Ĉ alone does not prove a product homeomorphism.

*Acceptance.* Without isolation the statement fails: the trivial representation of ℤ is weakly contained in the Hilbert sum of the characters n ↦ e^{inθ}, θ ≠ 0 rational multiples of 2π, without being one of them.

*Needs:* [*gan-savin-closure*](#sru-sru-1-gan-savin-closure); [*fell-topology*](#sru-sru-1-fell-topology); [*unitary-dual*](#sru-sru-0-unitary-dual).

*Sources:* \[GS23] §11.2, Corollary 11.7, p. 33: If σ is irreducible, isolated in the unitary dual and weakly contained in the Hilbert sum of the πᵢ, then σ is isomorphic to some πᵢ. \[GS23] §10.2, proof of Proposition 10.5, pp. 28–29; §10.3, proof of Proposition 10.7, pp. 29–30: In Proposition 10.5 Gan–Savin apply the corollary to a finite product of local groups, the components at real places being finite-dimensional, with supercuspidal and Steinberg components isolated by Proposition 11.3; in Proposition 10.7 they apply Proposition 11.6 together with the isolation hypothesis on the δᵢ. \[GS23] Corollary 11.7, p. 33, with the corrected Proposition 11.6: The corollary survives the correction of Proposition 11.6 because an isolated point of a closure belongs to the set (PAPER-GAN-SAVIN-23-B/E17). \[GI18] Appendix A.1, proof of Proposition A.2, arXiv v3 pp. 31–32: Gan–Ichino show π\_S is weakly contained in the Hilbert sum of the Π\_i, that all Π\_{i,S} lie in the set of generic unitary representations of Mp\_2n(F\_S) with exponents bounded by c < ½, and that π\_S is isolated in that set for the Fell topology, which forces π\_S = Π\_{i,S} for some i.

*Planet:* Isolated summands of weakly contained sums.

*Lean:* `exists_unitaryEquiv_of_isolated`

### Dependencies

This layer rests on: `SmoothRepresentationsOfLocalGroupsPartII:SRU.0`.

Coverage: **partial**. Remaining work:

- Godement integrated positive-type theorem: Supply the positive L¹-functional representation theorem, its nondegenerate integrated GNS construction and recovery of a continuous positive-type representative, including the modular-function involution for a general locally compact group. BHV Lemma C.5.3, p. 382, only cites this input. OperatorAlgebraDynamics D1–D2 supplies group C\*-algebras and C\*-GNS, but the L¹ comparison needed here was not located. This is a proof prerequisite, not a lemma-level refinement.
- Finite products and Fell topology: The abstract relative-isolation conclusion is proved. Its advertised finite-product application additionally needs the type-I tensor-product classification for reductive p-adic groups and compatibility of the resulting product dual with Fell topology. The compact-factor argument uses the upstream M0 isotypic projectors; neither a full product-dual theorem nor its exact supplier was located in the read sources. Keep the application conditional until supplied.
- Decompose Raikov's theorem and Lemma C.5.3 (Godement's integrated positive type) into lemma nodes over a fixed approximate identity.
- Record the comparison of coefficient weak containment with C\*-kernel weak containment once NoncompactQuantumSymmetry (TauCetiRoadmap PR #1015) is in the atlas; that comparison is owned there.

## Layer SRU.2: Unitarizable smooth representations of reductive p-adic groups

For G = 𝐆(F), 𝐆 connected reductive over a nonarchimedean local field F (SR conventions): unitary structures on smooth complex representations, invariant positive-definite hermitian forms with no completeness assumed (Bernstein's Definition 27 \[Ber92\] Ch. IV §1.1), the predicate \`IsUnitarizable\` and its API (subrepresentations, finite direct sums, unitary characters and twists, contragredient ≅ complex conjugate); uniqueness of the unitary structure on an irreducible admissible representation up to a positive scalar (\[Ber92\] Lemma 38; \[Cas95\] Proposition 2.1.15); orthogonal complements and semisimplicity of admissible unitarizable representations (\[Cas95\] Propositions 2.1.5, 2.1.14; \[Ber92\] Proposition 41); preservation of unitarizability by normalised parabolic induction (\[Ber92\] Proposition 38). The Hilbert completion of a unitarizable smooth representation as a strongly continuous unitary representation, with smooth vectors equal to the original space when it is admissible; Bernstein's theorem that every irreducible unitary representation of G is admissible (Bernstein 1974); the resulting identification of Ĝ with isomorphism classes of irreducible unitarizable smooth representations, the form in which Gan–Savin work (§11). Discrete series representations (SR.3.3) are isolated in the tempered part of Ĝ.

<a id="sru-sru-2-unitary-structure"></a>
#### SRU.2.1 Unitary structures on smooth representations

**Unitary structures on smooth representations** (*unitary-structure*, definition). Let G be locally profinite and (ρ, V) a smooth complex representation (SR.0). A unitary structure on V is a positive-definite hermitian form on V (an InnerProductSpace.Core ℂ V, conjugate-linear in the first variable) that is G-invariant: ⟪ρ g v, ρ g w⟫ = ⟪v, w⟫. V is not assumed complete (\[Ber92] Definition 27). ρ is unitarizable, Representation.IsUnitarizable ρ, when a unitary structure exists. Subrepresentations and finite direct sums of unitarizable representations are unitarizable; twisting by a unitary smooth character preserves unitarizability; an irreducible unitarizable representation has a unitary central character (\[Ber92] Proposition 40); for admissible unitarizable V the form gives a G-isomorphism from V onto the complex conjugate of the smooth dual Ṽ (\[Ber92] Ch. IV §1.1, Remark 2; \[Cas95] after Proposition 2.1.11).

*Hypotheses.* G locally profinite; V a smooth complex representation; no topology on V is used. For the central-character and contragredient statements: G countable at infinity (σ-compact), as Schur's lemma SR.0 countable-schur requires, or V admissible.

*Proof route.*

- Define IsUnitarizable ρ :⇔ ∃ c : InnerProductSpace.Core ℂ V, ∀ g v w, c.inner (ρ g v) (ρ g w) = c.inner v w. The form is data on V, not an InnerProductSpace instance, because a given V can carry many (Tau Ceti's CompactGroups README makes the same choice for averaged forms).
- Subrepresentations restrict the form; finite direct sums take the orthogonal sum; |χ| = 1 gives invariance of the same form for ρ ⊗ χ.
- Central character: for z central and v ≠ 0 in an irreducible V, ρ(z)v = ω(z)v (Schur, SR.0 countable-schur), and invariance gives |ω(z)|² ⟪v, v⟫ = ⟪v, v⟫.
- The map v ↦ ⟪v, ·⟫ is a conjugate-linear G-map V → Ṽ (smooth because v is fixed by a compact open subgroup); for admissible V it is onto Ṽ by finite dimensionality of each V^K (SR.0 smooth-dual (3)).

*Uses.* Gan–Savin, §11: unitarizable smooth representations are the objects of the unitary dual in the smooth picture. Ciubotaru–Harris, §6, (6.4): L(ν) is unitary means the spherical representation is unitarizable. SRU.2 hilbert-completion: the input of the completion functor.

*API.*

- `IsUnitarizable` (data): ∃ c : InnerProductSpace.Core ℂ V, ∀ g v w, c.inner (ρ g v) (ρ g w) = c.inner v w.
- `invariantsOf` (data): The K-invariants ⨅ k ∈ K, ker (ρ k − 1) of a representation, as a submodule (the carrier of admissibility hypotheses).
- `IsUnitarizable.subrepresentation` (structure): A subrepresentation of a unitarizable representation is unitarizable.
- `IsUnitarizable.prod` (structure): Finite direct sums of unitarizable representations are unitarizable.
- `IsUnitarizable.charTwist` (functoriality): For a smooth character χ with |χ g| = 1 for all g, IsUnitarizable ρ → IsUnitarizable (Representation.charTwist χ ρ).
- `IsUnitarizable.centralCharacter_norm` (characterisation): If ρ is irreducible and unitarizable then its central character takes values of modulus one.
- `IsUnitarizable.conjEquivSmoothDual` (equivalence): For admissible unitarizable ρ, the form induces a conjugate-linear G-isomorphism V ≃ Ṽ.
- `isUnitarizable_trivial` (example): The trivial representation on ℂ is unitarizable.

**Checks.**

- `isUnitarizable_unitary_character` (computation): For G = ℚ\_p^× and the unramified character χ(x) = (−1)^{v_p(x)}, the representation on ℂ is unitarizable.
- `not_isUnitarizable_abs` (non-example): For G = ℚ\_p^× and χ = |·|\_p, the representation on ℂ is smooth but not unitarizable: ‖χ(p)v‖ = p⁻¹‖v‖ for every inner product.
- `not_isUnitarizable_jordan` (non-example): For G = ℤ (discrete) acting on ℂ² by n ↦ \[\[1, n], \[0, 1]], the representation is smooth and not unitarizable, since a unitary operator is diagonalizable.
- `isUnitarizable_zero` (degenerate): The zero representation is unitarizable.

*Acceptance.* Every unitary character χ : G → S¹ with open kernel is unitarizable on ℂ. For G = F^× and χ = |·|, the smooth character χ is not unitarizable, since its values are not of modulus one.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/is-smooth`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/countable-schur`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-character`; Mathlib `InnerProductSpace.Core`.

*Sources:* \[Ber92] Ch. IV §1.1, Definition 27 and Remarks 1–2, p. 83; Proposition 40, p. 85: A G-module is unitary when it carries a positive definite invariant scalar product, completeness not being assumed; for irreducible unitary modules the complex conjugate is the contragredient; unitary representations have unitary central characters. \[GS23] §11, opening paragraph, p. 31: A smooth irreducible representation is unitarizable if it has a G-invariant positive-definite hermitian form, equivalently if it is the smooth part of an irreducible unitary representation. \[Cas95] §2.1, Proposition 2.1.5 and the paragraph after Proposition 2.1.11, pp. 20–22: For admissible unitary representations the hermitian form identifies V with the contragredient, compatibly with orthogonal complements.

*Planet:* Unitarizable representation.

*Lean:* `IsUnitarizable`, `invariantsOf`

<a id="sru-sru-2-unitary-structure-unique"></a>
#### SRU.2.2 Uniqueness of the unitary structure

**Uniqueness of the unitary structure** (*unitary-structure-unique*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. If V is an irreducible admissible representation of G (every irreducible is admissible, SR.3a), any two G-invariant positive-definite hermitian forms on V are proportional by a positive real constant (\[Ber92] Ch. IV §1.1, Lemma 38; \[Cas95] Proposition 2.1.15).

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. V irreducible smooth (hence admissible).

*Proof route.*

- A G-invariant hermitian form is a G-map from V to the conjugate-linear dual, landing in its smooth part, the complex conjugate of Ṽ.
- Ṽ is irreducible and admissible for irreducible admissible V (SR.3a admissibility-of-irreducibles), so Hom_G(V, conj Ṽ) is at most one-dimensional by Schur's lemma.
- Two positive forms differ by a nonzero scalar, real and positive since both are positive on any nonzero vector.

*Acceptance.* For a reducible unitarizable V = W ⊕ W with W irreducible, the forms ⟪·,·⟫ ⊕ 2⟪·,·⟫ and ⟪·,·⟫ ⊕ ⟪·,·⟫ are not proportional, so irreducibility is needed.

*Needs:* [*unitary-structure*](#sru-sru-2-unitary-structure); `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`.

*Sources:* \[Ber92] Ch. IV §1.1, Lemma 38 and proof, p. 84: For an irreducible module of a reductive group there is at most one invariant scalar product up to a constant: hermitian forms are maps to the anti-linear dual, which is admissible irreducible, and Schur's lemma applies. \[Cas95] §2.1, Proposition 2.1.15, p. 23: An irreducible admissible unitary representation has a unique invariant hermitian inner product up to scalars.

*Lean:* `unitaryStructure_unique`

<a id="sru-sru-2-admissible-unitary-semisimple"></a>
#### SRU.2.3 Admissible unitarizable representations are semisimple

**Admissible unitarizable representations are semisimple** (*admissible-unitary-semisimple*, theorem). Let G be locally profinite and (ρ, V) admissible with a unitary structure. For every subrepresentation U ⊆ V the orthogonal complement U^⊥ is a subrepresentation and V = U ⊕ U^⊥ (\[Cas95\] Proposition 2.1.5). Consequently V is a direct sum of irreducible admissible unitarizable representations, each isomorphism class with finite multiplicity, countably many if G is second countable (\[Cas95\] Proposition 2.1.14; \[Ber92\] Proposition 41). In particular an admissible unitarizable representation of finite length is a finite direct sum of irreducibles.

*Hypotheses.* G locally profinite; V admissible and unitarizable.

*Proof route.*

- U^⊥ is G-stable by invariance of the form; U ∩ U^⊥ = 0 by positivity.
- U + U^⊥ = V: it suffices to check on V^K for every compact open K; V^K is finite-dimensional, e\_K preserves both U and U^⊥ (it is self-adjoint for the form), and the finite-dimensional orthogonal decomposition of V^K gives U^K + (U^⊥)^K = V^K (\[Ber92\] Proposition 41, proof).
- Decomposition: the subrepresentation generated by V^K is finitely generated, has an irreducible quotient, which splits off by the first part; induction on dim V^K and Zorn's lemma over K give the direct sum (\[Cas95\] Proposition 2.1.14, proof).

*Acceptance.* For the non-unitarizable principal series i\_B(δ\_B^{1/2}) of GL₂(ℚ\_p), which has the trivial representation as a quotient and the Steinberg representation as a subrepresentation, the extension is non-split; so the theorem fails without a unitary structure.

*Needs:* [*unitary-structure*](#sru-sru-2-unitary-structure); `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/averaging-projector`.

*Sources:* \[Cas95] §2.1, Propositions 2.1.5 and 2.1.14 with proof, pp. 20–23: For admissible unitary V and a G-stable U, the orthogonal complement is G-stable and complementary; unitary admissible representations are direct sums of irreducible unitary admissible ones with finite multiplicities, countably many when G has a countable neighbourhood basis. \[Ber92] Ch. IV §1.2, Proposition 41 and proof, p. 86: An admissible unitary representation is completely reducible; the proof checks W^K + (W^⊥)^K = V^K by dimension counting.

*Lean:* `exists_invariant_isCompl_of_unitarizable`

<a id="sru-sru-2-unitary-induction"></a>
#### SRU.2.4 Normalised parabolic induction preserves unitarity

**Normalised parabolic induction preserves unitarity** (*unitary-induction*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. Let P = MN be a parabolic subgroup and σ a unitarizable smooth representation of M. Then the normalised induction i_P^G σ (SR.2) is unitarizable: ⟪f, f'⟫ := ∫\_K ⟪f(k), f'(k)⟫\_σ dk for a maximal compact K with G = PK and the Haar probability measure of K, which is G-invariant because of the δ\_P^{1/2} normalisation (\[Ber92] Proposition 38). If σ is moreover admissible of finite length, i_P^G σ is a finite direct sum of irreducible unitarizable representations; in particular unitary principal series i_B(χ) with |χ| = 1 are semisimple.

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. σ unitarizable; for the semisimplicity statement σ admissible of finite length.

*Proof route.*

- Elements of i_P σ are functions f(pg) = δ\_P^{1/2}(p)σ(p)f(g); the function g ↦ ⟪f(g), f'(g)⟫ transforms by δ\_P on the left, i.e. is a density on P\\G, whose integral over the compact P\\G is G-invariant; for a special maximal compact K and a minimal parabolic Q ⊆ P the Iwasawa decomposition G = QK (ReductiveGroupsPartII RG2.4) gives G = PK and writes this integral over K (\[Ber92] Proposition 38, proof).
- Positivity: a nonzero f is nonzero on an open subset of K.
- Finite length of i_P σ (SR.3 finite-length) and admissible-unitary-semisimple give the semisimplicity.

*Acceptance.* The unramified unitary principal series i_B(χ) of PGL₂(ℚ\_p) with χ(diag(a, 1)) = |a|^{it}, t real, is unitarizable. Without normalisation the induced form fails: unnormalised Ind_B^G(1) of GL₂(ℚ\_p) contains the trivial representation with a non-split quotient, so it is not unitarizable.

*Needs:* [*unitary-structure*](#sru-sru-2-unitary-structure); [*admissible-unitary-semisimple*](#sru-sru-2-admissible-unitary-semisimple); `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/modulus-character`; `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`; `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`.

*Sources:* \[Ber92] Ch. IV §1.1, Proposition 38 and remark, pp. 83–84: Normalised induction from a parabolic subgroup takes unitary representations to unitary ones, the scalar product being the integral over G/P of the pointwise pairing, a density because of the half-density twist. \[CH26] §6, before (6.2), p. 17: Ciubotaru–Harris call X(s) = i_{B(k)}^{G(k)}(χ\_s) the (unitarily) induced spherical minimal principal series, using the normalised induction that preserves unitarity.

*Planet:* Unitary parabolic induction.

<a id="sru-sru-2-hilbert-completion"></a>
#### SRU.2.5 Hilbert completion of a unitarizable representation

**Hilbert completion of a unitarizable representation** (*hilbert-completion*, construction). Let G be locally profinite and (ρ, V) smooth with a unitary structure. Its Hilbert completion Ĥ(V) (Mathlib's UniformSpace.Completion with the completed inner product) carries a unique strongly continuous unitary representation ρ̂ extending ρ. V ⊆ Ĥ(V)^∞, with equality Ĥ(V)^K = V^K for every compact open K when V is admissible; then Ĥ(V)^∞ = V. If V is irreducible and admissible, ρ̂ is topologically irreducible. Isomorphic irreducible unitarizable admissible representations have unitarily equivalent completions after rescaling the forms (unitary-structure-unique).

*Hypotheses.* G locally profinite; V smooth with a unitary structure; admissibility for the statements about smooth vectors and irreducibility.

*Proof route.*

- Each ρ(g) is isometric on V, hence extends to a linear isometry of the completion; these form a ContRepresentation, unitary because the inverses extend too.
- Strong continuity: g ↦ ρ(g)v is locally constant for v ∈ V; density of V and the uniform bound ‖ρ̂(g)‖ ≤ 1 give continuity on Ĥ(V).
- Smooth vectors: the projection e\_K of Ĥ(V) (smooth-vectors-unitary) maps V onto V^K, so Ĥ(V)^K = e\_K Ĥ(V) is the closure of V^K, which equals V^K when finite-dimensional; hence Ĥ(V)^∞ = ⋃ V^K = V.
- Irreducibility: for a closed invariant W, W^∞ = ⋃\_K e\_K W ⊆ V is a subrepresentation, so W^∞ = 0 or V; W^∞ is dense in W (smooth-vectors-unitary), so W = 0 or Ĥ(V) (\[BZ76\] §4.21(c) for GL\_n).

*Uses.* Gan–Savin, §11: passing between irreducible unitary representations and their smooth parts. SRU.2 unitary-dual-smooth: one direction of the identification of the unitary dual with irreducible unitarizable smooth representations.

*API.*

- `IsUnitarizable.completion` (constructor): Given a unitary structure c on V, the Hilbert space UniformSpace.Completion V with the completed inner product.
- `IsUnitarizable.completionRep` (constructor): The strongly continuous unitary representation of G on the completion extending ρ.
- `IsUnitarizable.completionRep_coe` (simp): completionRep g (v : completion) = (ρ g v : completion) for v ∈ V.
- `IsUnitarizable.smoothVectors_completion` (characterisation): For admissible V, the smooth vectors of completionRep are exactly the image of V.
- `IsUnitarizable.completionRep_irreducible` (characterisation): For irreducible admissible V, completionRep is topologically irreducible.
- `IsUnitarizable.completionRep_unique` (universal-property): A G-isometry V → H into a strongly continuous unitary representation with dense image extends uniquely to a unitary equivalence from the completion.

**Checks.**

- `completion_finrank` (degenerate): For finite-dimensional V with a unitary structure, the completion map V → Ĥ(V) is a linear isometric equivalence intertwining ρ and ρ̂.
- `completion_regular_discrete` (computation): For G = ℤ (discrete) and V the finitely supported functions with the ℓ² form, the completion is ℓ²(ℤ) with the regular representation.
- `smoothVectors_completion_not_admissible` (non-example): For G = ℤ\_p acting on V = ⊕\_n ℂχ\_n (χ\_n of conductor pⁿ, each with multiplicity one), V is admissible and Ĥ(V)^∞ = V; for V' = ⊕\_n ℂ (trivial, infinitely many copies), V' is not admissible and Ĥ(V')^∞ = Ĥ(V') ≠ V'.

*Acceptance.* For V finite-dimensional unitarizable, Ĥ(V) = V and ρ̂ = ρ. For the left regular representation of a discrete group on finitely supported functions, the completion is ℓ²(G).

*Needs:* [*unitary-structure*](#sru-sru-2-unitary-structure); [*unitary-structure-unique*](#sru-sru-2-unitary-structure-unique); [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); [*smooth-vectors-unitary*](#sru-sru-0-smooth-vectors-unitary); `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/admissible`; Mathlib `UniformSpace.Completion`; Mathlib `UniformSpace.Completion.innerProductSpace`.

*Sources:* \[BZ76] §4.21, Theorem (c), p. 43: An irreducible algebraic representation with an invariant positive-definite hermitian product completes to a topologically irreducible unitary representation whose algebraic part is the original space (stated for GL\_n(F), not proved there). \[GS23] §11, opening paragraph, p. 31: An irreducible smooth representation is unitarizable iff it is the space of smooth vectors of an irreducible unitary representation.

<a id="sru-sru-2-unitary-irreducibles-admissible"></a>
#### SRU.2.6 Irreducible unitary representations are admissible

**Irreducible unitary representations are admissible** (*unitary-irreducibles-admissible*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. Let (π, H) be a topologically irreducible strongly continuous unitary representation of G. Then the smooth vectors H^∞ form an admissible representation, irreducible as a smooth representation, and π is unitarily equivalent to the Hilbert completion of H^∞ (Bernstein 1974; \[BZ76] §4.21(a) for GL_n). Two such representations are unitarily equivalent iff their smooth parts are isomorphic (\[BZ76] §4.21(b)).

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients.

*Proof route.*

- For a compact open K, H^K is a nonzero (for small K) closed subspace on which the Hecke algebra H(G, K; ℂ) acts by bounded operators, as a \*-representation, and topologically irreducibly (a closed H(G,K)-stable subspace of H^K generates a closed G-stable subspace of H whose K-fixed part it is).
- By uniform admissibility (SR.3a uniform-admissibility) every simple H(G, K)-module has dimension ≤ c(G, K); this bounded-dimension property passes to the topologically irreducible \*-representations of the C\*-closure of H(G, K) (a polynomial-identity argument, Godement and Kaplansky as invoked in \[BZ76] §4.21), so dim H^K ≤ c(G, K) < ∞.
- Hence H^∞ is admissible; it is irreducible because a proper subrepresentation would have a closure that is a proper closed invariant subspace (its K-fixed parts are those of the subrepresentation); hilbert-completion identifies H with the completion of H^∞.
- Equivalence: an isomorphism of smooth parts transports the unitary structure up to a scalar (unitary-structure-unique) and extends to the completions.

*Acceptance.* For G compact the theorem says irreducible unitary representations are finite-dimensional, as in Peter–Weyl. For a discrete group that is not virtually abelian, irreducible unitary representations need not have finite-dimensional K-fixed spaces (K = {e}); reductivity of G is used through uniform admissibility.

*Needs:* [*hilbert-completion*](#sru-sru-2-hilbert-completion); [*unitary-structure-unique*](#sru-sru-2-unitary-structure-unique); [*smooth-vectors-unitary*](#sru-sru-0-smooth-vectors-unitary); `SmoothRepresentationsOfLocalGroups:SR.3a/uniform-admissibility`; `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`.

*Sources:* \[BZ76] §4.21, Theorem (a)–(b) and the sentence before it, p. 43: For G = GL_n(F), the algebraic part of a topologically irreducible unitary representation is admissible and irreducible, and unitary equivalence matches isomorphism of algebraic parts; the theorem is deduced from the bound s(G, N) on dimensions of representations of the Hecke algebra and Godement's results. \[CitedOnly] I. N. Bernstein, All reductive p-adic groups are tame, Funct. Anal. Appl. 8 (1974) (not read): The general reductive case of the admissibility of irreducible unitary representations. \[SRup] SR.3a.2, uniform-admissibility: The bound c(G, K) on dim V^K for irreducible smooth V, equivalently on simple H(G, K; ℂ)-modules, for any reductive G over F.

<a id="sru-sru-2-unitary-dual-smooth"></a>
#### SRU.2.7 The unitary dual as unitarizable smooth representations

**The unitary dual as unitarizable smooth representations** (*unitary-dual-smooth*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients. The maps \[π] ↦ (π^∞ = H^∞) and V ↦ \[completion of V] are inverse bijections between the unitary dual Ĝ (SRU.0) and the set of isomorphism classes of irreducible unitarizable smooth representations of G. Under this bijection the positive-type coefficient of a smooth unit vector v is g ↦ ⟪v, ρ(g)v⟫ computed in V; the Fell topology (SRU.1) is described by such coefficients of smooth vectors; and the trivial, Steinberg (SR.3.4), square-integrable and unitary-induced representations define points of Ĝ.

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a nonarchimedean local field F, with the conventions of SmoothRepresentationsOfLocalGroups (SR) and complex coefficients.

*Proof route.*

- Well defined: unitary-irreducibles-admissible gives irreducible admissible π^∞, unitarizable by restriction of the inner product; hilbert-completion gives a topologically irreducible completion.
- The two composites are the identity up to isomorphism (unitary-irreducibles-admissible, last clause; hilbert-completion, smooth vectors).
- Coefficients of smooth vectors suffice for the Fell topology by density of smooth vectors and dist_ptCoeff_le.
- Square-integrable irreducible representations are unitarizable (SR.3.3 square-integrable-tempered), in particular the Steinberg representation of a split group (SR.3.4 steinberg); unitary induction gives the tempered ones (unitary-induction).

*Acceptance.* For G = F^× the bijection identifies Ĝ with the unitary smooth characters of F^×. The Steinberg representation of GL₂(ℚ\_p), being square-integrable modulo a unitary central character, defines a point of the unitary dual of PGL₂(ℚ\_p).

*Needs:* [*unitary-irreducibles-admissible*](#sru-sru-2-unitary-irreducibles-admissible); [*hilbert-completion*](#sru-sru-2-hilbert-completion); [*unitary-induction*](#sru-sru-2-unitary-induction); [*unitary-dual*](#sru-sru-0-unitary-dual); [*fell-topology*](#sru-sru-1-fell-topology); `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`; `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`.

*Sources:* \[GS23] §11, opening paragraph, p. 31; §11.1, pp. 31–32: Gan–Savin work with smooth representations: an irreducible smooth representation is unitarizable iff it is the smooth part of an irreducible unitary representation, and limit points are defined through coefficients of these. \[BZ76] §4.21, Theorem (a)–(c), p. 43: The unitary–algebraic dictionary for GL_n(F).

*Planet:* Unitary dual in the smooth picture.

### Dependencies

This layer rests on: `ReductiveGroupsPartII:RG2.4`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3a`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.0`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.1`.

Coverage: **partial**. Remaining work:

- Bernstein's admissibility: the polynomial-identity input: The passage from the uniform bound on simple H(G, K)-modules (SR.3a uniform-admissibility) to finite-dimensionality of H^K for a topologically irreducible unitary π uses polynomial identities of C\*-algebras (Godement, Kaplansky), as Bernstein–Zelevinsky §4.21 indicate. No roadmap owns PI theory for C\*-algebras; the step is cited.
- Refine Bernstein's admissibility theorem into the polynomial-identity steps once an owner for PI C\*-algebras exists (gap 'Bernstein's admissibility: the PI input').
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Layer SRU.3: Limits of unitary representations: characters, K-types and standard modules

Weak convergence of the distribution characters Θ\_π(f) = tr π(f), f ∈ C\_c^∞(G), of finite-length representations (characters from Endoscopic transfer ET.4); linear independence of the characters of pairwise non-isomorphic irreducible admissible representations. Miličić's theorem (Gan–Savin Theorem 11.1): a weakly convergent sequence of characters of irreducible unitarizable representations converges to Σ\_{σ∈S} n\_σ Θ\_σ with S finite and S = L\[πₙ\] = C\[πₙ\]. Tadić's results: subsequences of tempered characters of a Levi converge weakly to the character of a finite-length representation, cuspidal supports pass to the limit, and Fell convergence implies convergence of infinitesimal characters in the Bernstein variety. Persistence of K-types in limits (Gan–Savin Lemma 11.4). Rodier's heredity of genericity under parabolic induction; Heiermann–Opdam: every irreducible generic representation of a quasi-split G over a p-adic field of characteristic zero is an irreducible standard module. Gan–Savin Proposition 11.2: a generic unitarizable limit point of generic unitarizable representations is, after passing to a subsequence, a subquotient of a limit Ind\_P^G(τ) of standard modules Ind\_P^G(τₙ).

<a id="sru-sru-3-character-weak-convergence"></a>
#### SRU.3.1 Weak convergence of distribution characters

**Weak convergence of distribution characters** (*character-weak-convergence*, definition). Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. For an admissible representation π of finite length, Θ\_π(f) = tr π(f), f ∈ C_c^∞(G), is its distribution character (π(f) = ∫ f(g)π(g) dg has finite rank; EndoscopicTransfer ET.4). A sequence (πₙ) of admissible finite-length representations has weakly convergent characters when Θ\_{πₙ}(f) converges for every f ∈ C_c^∞(G); the limit Θ := lim Θ\_{πₙ} is a linear functional on C_c^∞(G), invariant under conjugation. Gan–Savin write C_c(G) for the test space; for a p-adic group the space on which characters are defined is C_c^∞(G) of locally constant compactly supported functions, the reading used here. Characters are additive in short exact sequences, so Θ factors through the Grothendieck group of finite-length representations.

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G.

*Proof route.*

- π(f) = e_K π(f) e_K for K with f K-bi-invariant, and π(f) acts on the finite-dimensional V^K (\[Cas95] §2.3).
- Additivity: for 0 → V' → V → V'' → 0 admissible, π(f) is block triangular on V^K = V'^K ⊕ V''^K (exactness of K-invariants, SR.0 invariants-exact), so traces add.
- Conjugation invariance: tr π(f ∘ Ad g) = tr(π(g)⁻¹π(f)π(g)).

*Uses.* Gan–Savin, Theorem 11.1: the hypothesis of Miličić's theorem. Gan–Savin, Proposition 11.2: weak convergence of the characters of the tempered parts τₙ° and of the induced representations. SRU.3 tadic-tempered-limits: the compactness statement produces weakly convergent subsequences.

*API.*

- `CharactersConverge` (data): CharactersConverge π Θ :⇔ ∀ f ∈ C_c^∞(G), Tendsto (fun n ↦ Θ\_{π n} f) atTop (𝓝 (Θ f)).
- `CharactersConverge.add` (structure): Limits add along direct sums and pass to finite linear combinations.
- `CharactersConverge.conj_invariant` (characterisation): A limit Θ satisfies Θ (f ∘ Ad g) = Θ f.
- `distributionCharacter_additive` (relation): Θ\_V = Θ\_{V'} + Θ\_{V''} for a short exact sequence of admissible finite-length representations.
- `CharactersConverge.induce` (functoriality): If the characters of σₙ converge to Θ\_σ on a Levi M then those of i_P σₙ converge to Θ\_{i_P σ} (van Dijk's formula, via ET.4).

**Checks.**

- `charactersConverge_const` (degenerate): A constant sequence πₙ = π has weakly convergent characters with limit Θ\_π.
- `charactersConverge_unramified_twist` (computation): For G = ℚ\_p^× and χₙ = |·|^{i tₙ} with tₙ → t, Θ\_{χₙ}(f) = ∫ f χₙ converges to Θ\_{|·|^{it}}(f).
- `charactersConverge_conductor_zero` (non-example): For G = ℚ\_p^× and characters χₙ of conductor exponent n, Θ\_{χₙ}(f) = 0 for n large for each fixed f, so the limit is 0: a weak limit of characters of irreducibles need not be the character of an irreducible.

*Acceptance.* Constant sequences converge weakly. If Θ\_{πₙ} → Θ and Θ\_{π'ₙ} → Θ' then Θ\_{πₙ ⊕ π'ₙ} → Θ + Θ'.

*Needs:* `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/invariants-exact`; `SmoothRepresentationsOfLocalGroups:SR.3a/admissibility-of-irreducibles`.

*Sources:* \[GS23] §11.1, before Theorem 11.1, p. 31: A sequence of characters χ\_{πₙ} is weakly converging if χ\_{πₙ}(f) converges for every test function f. \[Cas95] §2.3, definition of the distribution character, p. 25: For admissible π and f ∈ H(G) the operator π(f) has finite rank; its trace is the distribution character, depending on the Haar measure.

<a id="sru-sru-3-characters-linearly-independent"></a>
#### SRU.3.2 Linear independence of characters

**Linear independence of characters** (*characters-linearly-independent*, theorem). Let G be locally profinite and π₁, …, πₙ pairwise non-isomorphic irreducible admissible complex representations. Then Θ\_{π₁}, …, Θ\_{πₙ} are linearly independent functionals on C_c^∞(G) (\[Cas95] Proposition 2.3.1). Consequently an admissible finite-length representation is determined up to semisimplification by its character, and a finite sum Σ n_σ Θ\_σ with distinct σ determines the multiplicities n_σ.

*Hypotheses.* G locally profinite; representations irreducible admissible and pairwise non-isomorphic.

*Proof route.*

- Choose a compact open K with every πᵢ^K ≠ 0; each πᵢ^K is a simple H(G, K)-module and they are pairwise non-isomorphic (SR.1 corner-irreducibles).
- By the density theorem the map H(G, K) → ∏ᵢ End(πᵢ^K) is onto, so there are fⱼ ∈ H(G, K) with tr πᵢ(fⱼ) = δᵢⱼ (\[Cas95] Proposition 2.3.1, citing Jacquet–Langlands Lemma 7.1).
- Semisimplification: by Jordan–Hölder and additivity Θ\_V = Σ m_σ Θ\_σ over the irreducible constituents, and linear independence recovers the m_σ.

*Acceptance.* For GL₂(ℚ\_p), the reducible principal series i_B(δ\_B^{1/2}) and 1 ⊕ St have the same character, though they are not isomorphic. The trivial and Steinberg characters of GL₂(ℚ\_p) are linearly independent.

*Needs:* [*character-weak-convergence*](#sru-sru-3-character-weak-convergence); `SmoothRepresentationsOfLocalGroups:SR.1/corner-irreducibles`; `SmoothRepresentationsOfLocalGroups:SR.1/hecke-module-equivalence`.

*Sources:* \[Cas95] §2.3, Proposition 2.3.1 (p. 25) and Corollary 2.3.2 (pp. 25–26): The distribution characters of finitely many inequivalent irreducible admissible representations are linearly independent (2.3.1); irreducible admissible representations with the same character are isomorphic (2.3.2).

*Planet:* Linear independence of characters.

<a id="sru-sru-3-milicic-limits"></a>
#### SRU.3.3 Miličić's theorem on limits of unitary characters

**Miličić's theorem on limits of unitary characters** (*milicic-limits*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. Let (πₙ) be irreducible unitarizable representations whose characters converge weakly. Then there are a finite set S of irreducible unitarizable representations and integers n\_σ > 0 with lim Θ\_{πₙ}(f) = Σ\_{σ∈S} n\_σ Θ\_σ(f) for all f ∈ C\_c^∞(G), and S = L\[πₙ\] = C\[πₙ\] in the Fell topology (Gan–Savin Theorem 11.1; Miličić 1973, Theorem 5). In particular, under weak convergence of characters, limit points and cluster points coincide and form a finite set.

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. πₙ irreducible unitarizable, with weakly convergent characters.

*Proof route.*

- The C\*-algebra of G has bounded trace on the K-fixed parts (uniform admissibility, SR.3a): for every K, dim πₙ^K ≤ c(G, K); this is the hypothesis of Miličić's theorem on C\*-algebras with bounded trace.
- Fell convergence of irreducible unitary representations of such algebras is controlled by traces: πₙ → σ iff Θ\_σ ≤ lim inf of Θ\_{πₙ} on positive elements of the K-corners, for every K (Miličić).
- With weakly convergent characters the limit functional Θ is positive on positive K-corner elements and has finite rank on each corner (bounded by c(G, K)); it decomposes as a finite sum Σ n\_σ Θ\_σ by linear independence (characters-linearly-independent), and the σ occurring are exactly the limit and the cluster points.
- The analytic part of this argument is cited from Miličić through Gan–Savin and Tadić \[Ta1\]; its decomposition into C\*-algebra lemmas is listed under the layer's remaining refinements.
- The passage from bounded ranks on each Hecke corner to one globally finite character decomposition is not a consequence of linear independence alone. It is precisely the bounded-trace C\*-algebra theorem recorded in the gap; do not treat the preceding outline as closing that step.

*Acceptance.* For a constant sequence πₙ = σ, S = {σ}, n\_σ = 1 and L = C = {\[σ\]}. For SL₂(ℚ\_p) and complementary series πₙ converging to the endpoint, lim Θ\_{πₙ} = Θ\_1 + Θ\_St, so S = {1, St} = L\[πₙ\]: the limit set has two points, reflecting that the unitary dual is not Hausdorff.

*Needs:* [*character-weak-convergence*](#sru-sru-3-character-weak-convergence); [*characters-linearly-independent*](#sru-sru-3-characters-linearly-independent); [*fell-topology*](#sru-sru-1-fell-topology); [*unitary-dual-smooth*](#sru-sru-2-unitary-dual-smooth); `SmoothRepresentationsOfLocalGroups:SR.3a/uniform-admissibility`.

*Sources:* \[GS23] §11.1, Theorem 11.1, p. 31: If the characters of irreducible unitarizable πₙ converge weakly, the limit is a finite positive integral combination of characters of unitary representations σ ∈ S, and S equals both the set of limit points and the set of cluster points. \[CitedOnly] D. Miličić, On C\*-algebras with bounded trace, Glasnik Mat. 8 (28) (1973), Theorem 5; M. Tadić, Glasnik Mat. 23 (1988) (not read): The original statement and its p-adic application, as Gan–Savin cite them.

*Planet:* Miličić's theorem.

<a id="sru-sru-3-tadic-tempered-limits"></a>
#### SRU.3.4 Tadić: compactness of tempered characters and continuity of supports

**Tadić: compactness of tempered characters and continuity of supports** (*tadic-tempered-limits*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. Let M be a Levi subgroup and (τₙ) irreducible tempered representations of M. Then some subsequence has weakly convergent characters, with limit the character of a (possibly reducible) admissible finite-length representation τ of M; and the cuspidal support of every constituent of the limit is the limit of the cuspidal supports of the τₙ in the Bernstein variety Ω(M) (SR.3) (Gan–Savin §11.1 and §10.3, citing Tadić).

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. τₙ irreducible tempered; unitary central characters.

*Proof route.*

- Uniform admissibility bounds dim τₙ^K by c\_K. For K-biinvariant f, |Θ\_{τₙ}(f)| ≤ c\_K‖f‖₁, since the integrated unitary operator has norm at most ‖f‖₁. Second countability gives a countable spanning family of C\_c^∞(M); diagonal subsequence extraction produces a weak character limit, possibly zero.
- Apply milicic-limits to identify a nonzero limit as a finite positive-integer combination of irreducible unitary characters. The bounded-trace prerequisite of that theorem remains an explicit gap. The support is tempered, since each τₙ is weakly contained in the regular representation and this support is Fell closed.
- For a nonzero limit, every constituent is a Fell limit of the subsequence by Miličić; fell-convergence-bernstein-centre gives convergence of the common cuspidal supports to that of every constituent. With zero limit the constituent assertion is vacuous.
- This replaces the unsupported assertion that fixed K permits only finitely many inducing discrete-series supports and a fixed summand position. No global finite-length character is deduced solely from local finite-rank limits.

*Acceptance.* For M = T a split torus, the τₙ are unitary characters; the theorem reduces to compactness of the unitary unramified characters together with finiteness of characters of T ∩ K of bounded conductor at fixed level. Without temperedness the conclusion fails: |·|^{n} on ℚ\_p^× has no weakly convergent subsequence of characters.

*Needs:* [*character-weak-convergence*](#sru-sru-3-character-weak-convergence); `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`; `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`; `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-components`; `SmoothRepresentationsOfLocalGroups:SR.3/finite-type-corners`; [*milicic-limits*](#sru-sru-3-milicic-limits); [*fell-convergence-bernstein-centre*](#sru-sru-3-fell-convergence-bernstein-centre).

*Sources:* \[GS23] §11.1, proof of Proposition 11.2, p. 32: By \[Ta1\] the tempered parts τₙ° have a subsequence whose characters converge weakly to the character of a not necessarily irreducible τ°. \[GS23] §10.3, proof of Lemma 10.8, p. 30: By \[Ta1\] the supercuspidal support of a limit is the limit of the supercuspidal supports. \[CitedOnly] M. Tadić, On limits of characters of irreducible unitary representations, Glasnik Mat. 23 (1988) 15–25 (not read): The cited source.

<a id="sru-sru-3-fell-convergence-bernstein-centre"></a>
#### SRU.3.5 Fell convergence implies convergence in the Bernstein centre

**Fell convergence implies convergence in the Bernstein centre** (*fell-convergence-bernstein-centre*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. If irreducible unitarizable πₙ converge in the Fell topology to an irreducible unitarizable π, then their infinitesimal characters (cuspidal supports in the Bernstein variety Ω(G), SR.3 bernstein-centre-blocks) converge to that of π: for every z in the Bernstein centre, z(πₙ) → z(π), and eventually πₙ lies in the Bernstein component of π. Consequently every irreducible constituent of a weak limit of characters of the πₙ has the cuspidal support of π (Gan–Savin §11.1, citing Tadić \[Ta2]).

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G.

*Proof route.*

- Fix K with π^K ≠ 0; Fell convergence and K-types (k-types-persist) give πₙ^K ≠ 0 for large n, so the πₙ lie in the finitely many Bernstein components meeting level K (SR.3 finite-type-corners).
- On the K-corner, the centre of H(G, K) acts on the simple modules πₙ^K by characters; Fell convergence gives convergence of the matrix coefficients ⟪v, πₙ(f)v⟫ for f in the centre of the corner and smooth vectors approximating a K-fixed vector of π, hence of the central characters (Tadić \[Ta2]).
- Regular functions on the Bernstein variety are the centre (SR.3 bernstein-centre-blocks), so convergence of all central characters is convergence in Ω(G).

*Acceptance.* For G = ℚ\_p^×, Fell convergence of unitary characters χₙ → χ means eventually equal restriction to ℤ\_p^× and χₙ(p) → χ(p), which is convergence in the Bernstein variety.

*Needs:* [*k-types-persist*](#sru-sru-3-k-types-persist); [*fell-topology*](#sru-sru-1-fell-topology); [*unitary-dual-smooth*](#sru-sru-2-unitary-dual-smooth); `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-centre-blocks`; `SmoothRepresentationsOfLocalGroups:SR.3/finite-type-corners`; `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, p. 33: Since convergence in the Fell topology implies convergence in the Bernstein centre \[Ta2], the constituents of the limit lie in any principal series containing the limit σ. \[CitedOnly] M. Tadić, Geometry of dual spaces of reductive groups (non-Archimedean case), J. Analyse Math. 51 (1988) 139–181 (not read): The cited source.

<a id="sru-sru-3-k-types-persist"></a>
#### SRU.3.6 K-types persist in limits

**K-types persist in limits** (*k-types-persist*, theorem). Let G be locally profinite, K a compact open subgroup and τ a smooth irreducible representation of K. If π is irreducible unitarizable, τ occurs in π|\_K, and π is a limit point in Ĝ of irreducible unitarizable πₙ, then τ occurs in πₙ|\_K for all but finitely many n (Gan–Savin Lemma 11.4).

*Hypotheses.* G locally profinite; π, πₙ irreducible unitarizable (points of Ĝ).

*Proof route.*

- Take a unit vector v in the τ-isotypic part of π, so ⟪v, π(e_τ)v⟫ = 1 for the K-type projector e_τ = π(f_τ) (smooth-vectors-unitary; Gan–Savin's f_τ needs the factor dim τ, sourceIssues E1).
- By the definition of limit points there are unit vₙ with ptCoeff πₙ vₙ → ptCoeff π v uniformly on K; integrating against f_τ gives ⟪vₙ, πₙ(e_τ)vₙ⟫ → 1.
- Hence πₙ(e_τ) ≠ 0 for large n, i.e. τ occurs in πₙ.

*Acceptance.* For K-spherical π (τ trivial), every limit of the πₙ that is K-spherical forces the πₙ to be K-spherical eventually. The transfer goes only from the limit to the sequence: spherical complementary series of SL₂(ℚ\_p) have SL₂(ℤ\_p)-fixed vectors, while their limit point St has none.

*Needs:* [*smooth-vectors-unitary*](#sru-sru-0-smooth-vectors-unitary); [*fell-topology*](#sru-sru-1-fell-topology); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient).

*Sources:* \[GS23] §11.1, Lemma 11.4 and proof, p. 32: If an irreducible unitarizable π containing the K-type τ is a limit point of irreducible πₙ, then τ occurs in πₙ for almost all n, by integrating the converging coefficients against f_τ.

<a id="sru-sru-3-rodier-heredity"></a>
#### SRU.3.7 Rodier's heredity of genericity

**Rodier's heredity of genericity** (*rodier-heredity*, theorem). Let G be quasi-split reductive over F, B = TU a Borel subgroup, ψ a generic character of U (SR.2.3 whittaker-functionals), P = MN a standard parabolic and σ an admissible finite-length representation of M. Then dim Hom_U(i_P σ, ψ) = dim Hom_{U∩M}(σ, ψ|\_{U∩M}) for a compatible choice of ψ; in particular i_P σ is ψ-generic iff σ is, and for irreducible generic σ the induced representation i_P σ has exactly one ψ-generic irreducible subquotient, occurring with multiplicity one.

*Hypotheses.* G quasi-split; ψ generic, compatible with the Levi M (Shahidi's normalisation of the splitting).

*Proof route.*

- Filter i_P σ by the Bruhat cells P\\PwB (SR.2 mackey-filtration, geometric-lemma); only the open cell supports ψ-equivariant functionals for generic ψ, giving the dimension formula.
- Exactness of the twisted Jacquet functor V ↦ V_{U,ψ} (SR.2.3, coinvariants of the twist) makes generic multiplicity additive in short exact sequences, so a constituent count of one gives uniqueness of the generic subquotient.

*Acceptance.* For GL₂(ℚ\_p), i_B(δ\_B^{1/2}) has the unique generic constituent St, and the trivial constituent is not generic. For every unitary character χ of T, i_B χ is generic.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`; `SmoothRepresentationsOfLocalGroups:SR.2/mackey-filtration`; `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`.

*Sources:* \[HO] §1, before Theorem 1.1, p. 2: Heiermann–Opdam recall, by Rodier's theorem, that the induced representation i_P τ\_ν of a generic τ has a unique ψ-generic irreducible subquotient. \[BC1] §1.2, p. 2: Each unramified principal series X(χ) has a unique irreducible generic subquotient. \[CitedOnly] F. Rodier, Whittaker models for admissible representations of reductive p-adic split groups, Proc. Sympos. Pure Math. 26 (1973) (not read): The heredity theorem.

<a id="sru-sru-3-heiermann-opdam-standard-module"></a>
#### SRU.3.8 Heiermann–Opdam: generic representations are standard modules

**Heiermann–Opdam: generic representations are standard modules** (*heiermann-opdam-standard-module*, theorem). Let G be quasi-split reductive over a p-adic field F of characteristic zero. Let P = MN be a standard parabolic, τ an irreducible tempered generic representation of M and ν in the open positive chamber a_M^{\*+} (SR.3.3 langlands-classification, Langlands convention). Then the Langlands quotient J(τ, ν) of the standard module i_P(τ\_ν) is generic iff i_P(τ\_ν) is irreducible (the standard module conjecture). Consequently every irreducible generic representation of G is isomorphic to an irreducible standard module i_P(τ\_ν), with τ tempered generic and ν ∈ a_M^{\*+}, and its differential is a positive combination Σ\_{α∈Δ∖S} s_α ϖ\_α of fundamental weights (Gan–Savin, proof of Proposition 11.2).

*Hypotheses.* F a p-adic field of characteristic zero; G quasi-split; the Langlands classification of SR.3.3 with its Harish–Chandra tempered-support hypothesis.

*Proof route.*

- Heiermann–Opdam prove holomorphy of the local coefficient in the negative chamber and the tempered L-function conjecture (HO Theorem 1.1); with Heiermann–Muić this gives the standard module conjecture (HO Corollary 1.2).
- If π is irreducible generic, write π = J(τ, ν) by the Langlands classification; i_P(τ\_ν) has π as a generic subquotient, so τ is generic (rodier-heredity), and by the standard module conjecture i_P(τ\_ν) is irreducible, hence equal to π.
- The positive-chamber condition is ν = Σ\_{α∈Δ∖S} s_α ϖ\_α with s_α > 0, S the simple roots of M.

*Acceptance.* For GL₂(ℚ\_p), the generic representation i_B(|·|^{1/4} ⊗ |·|^{−1/4}) is an irreducible standard module, while the non-generic trivial representation is the Langlands quotient of the reducible i_B(δ\_B^{1/2}).

*Needs:* [*rodier-heredity*](#sru-sru-3-rodier-heredity); `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`; `SmoothRepresentationsOfLocalGroups:SR.3`.

*Sources:* \[HO] §1, Theorem 1.1 and Corollary 1.2, pp. 2–3: For quasi-split G over a p-adic field of characteristic zero, the local coefficient is holomorphic in the negative chamber; consequently the Langlands quotient of a standard module with tempered generic data is generic iff the standard module is irreducible. \[GS23] §11.1, proof of Proposition 11.2, p. 32: By \[HO] every generic representation is isomorphic to a standard module Ind_P^G(τ), τ = τ°·χ with τ° tempered and χ unramified positive with differential Σ s_α ϖ\_α, s_α > 0.

*Planet:* Generic representations are standard modules.

<a id="sru-sru-3-gan-savin-generic-limits"></a>
#### SRU.3.9 Limits of generic unitary representations

**Limits of generic unitary representations** (*gan-savin-generic-limits*, theorem). Let G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. with 𝐆 split simple. Let δ be generic unitarizable and (πₙ) generic unitarizable with δ ∈ L\[πₙ]. After passing to a subsequence there are a parabolic P = MN and standard modules i_P(τₙ) with: πₙ ≅ i_P(τₙ) for all n; the characters of τₙ converge weakly to the character of a (possibly reducible) representation τ of M; and δ is a subquotient of i_P(τ). In particular τ is generic (Gan–Savin Proposition 11.2).

*Hypotheses.* G = 𝐆(F) with 𝐆 connected reductive over a p-adic field F of characteristic zero (Gan–Savin take 𝐆 split simple), complex coefficients, a fixed Haar measure dg on G. 𝐆 split simple, as in Gan–Savin; δ, πₙ generic unitarizable.

*Proof route.*

- By heiermann-opdam-standard-module each πₙ ≅ i_{Pₙ}(τₙ) with τₙ = τₙ° · χₙ; finitely many standard parabolics, so after a subsequence P is constant.
- By tadic-tempered-limits a subsequence of τₙ° has weakly convergent characters with limit τ°; unitarity of πₙ bounds the differentials dχₙ, because the coefficients of πₙ are bounded by ‖v‖² while along the negative cone they are asymptotic to combinations of the exponents of the Jacquet modules (SR.2 casselman-pairing), which grow with dχₙ; so a further subsequence has χₙ → χ; put τ = τ° · χ.
- The characters of i_P(τₙ) converge to that of i_P(τ) (character-weak-convergence, induction); by milicic-limits the limit points of (πₙ) are the constituents of i_P(τ), so δ is a subquotient; δ generic forces τ generic (rodier-heredity).

*Acceptance.* For PGL₂(ℚ\_p) and the generic complementary series πₙ = i_B(|·|^{sₙ} ⊗ |·|^{−sₙ}) with sₙ → 1/2, the generic limit point is St, a subquotient of i_B(δ\_B^{1/2}) = lim i_B(τₙ).

*Needs:* [*heiermann-opdam-standard-module*](#sru-sru-3-heiermann-opdam-standard-module); [*tadic-tempered-limits*](#sru-sru-3-tadic-tempered-limits); [*milicic-limits*](#sru-sru-3-milicic-limits); [*character-weak-convergence*](#sru-sru-3-character-weak-convergence); [*rodier-heredity*](#sru-sru-3-rodier-heredity); `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`.

*Sources:* \[GS23] §11.1, Proposition 11.2 and proof, pp. 31–32: A generic unitarizable limit point δ of generic unitarizable πₙ is, after passing to a subsequence, a subquotient of Ind_P^G(τ) where πₙ ≅ Ind_P^G(τₙ) are standard modules whose inducing characters converge weakly to that of τ; the proof combines \[HO], \[Ta1] and Theorem 11.1.

*Planet:* Limits of generic unitary representations.

<a id="sru-sru-3-discrete-series-isolated-tempered"></a>
#### SRU.3.10 Discrete series are isolated in the tempered dual

**Discrete series are isolated in the tempered dual** (*discrete-series-isolated-tempered*, theorem). Let G be a reductive group over a p-adic field F of characteristic zero with compact centre (or work with a fixed unitary central character). Every irreducible square-integrable representation δ (SR.3.3) is an isolated point of the tempered part Ĝ\_temp of Ĝ with the induced Fell topology: no sequence of tempered irreducible representations not isomorphic to δ converges to \[δ\].

*Hypotheses.* F of characteristic zero, as in Gan–Savin; G with compact centre, or all representations with a fixed unitary central character.

*Proof route.*

- Use SRup SR.3.3 harish-chandra-tempered-support to express each irreducible tempered representation as a constituent of induction from a discrete series of a Levi. This gives decomposition and uniqueness, not a description of Fell neighbourhoods.
- The missing input is the finite-level local structure of the tempered dual: after fixing a compact-open type near δ, a convergent family is controlled by finitely many induction data with compact unitary-unramified parameter spaces, and the discrete-series point cannot occur as a limit from a proper-Levi component. Supply the precise theorem and proof before using this step; Bernstein-centre convergence alone does not imply it.
- Conditional on that input, only the G-Levi discrete-series family can approach δ. For compact centre the ordinary unitary-unramified character group of G is trivial; with fixed central character the allowed twisting fibre is finite. Removing its other points isolates δ.
- Ordinary unramified characters here use the subgroup generated by all compact subgroups (SRup SR.3.1, target unramified-characters). They differ from weakly unramified characters. The statement remains a target with its spectral-topology proof prerequisite recorded as a gap.

*Acceptance.* For PGL₂(ℚ\_p) the Steinberg representation is not a limit of unitary principal series i\_B(|·|^{itₙ} ⊗ |·|^{−itₙ}): their limits are unitary principal series, which do not contain St. Isolation holds only in the tempered dual: in the full unitary dual of PGL₂(ℚ\_p) the Steinberg representation is a limit of complementary series (SRU.4 steinberg-isolated, rank-one non-example).

*Needs:* [*unitary-dual-smooth*](#sru-sru-2-unitary-dual-smooth); [*fell-topology*](#sru-sru-1-fell-topology); [*fell-convergence-bernstein-centre*](#sru-sru-3-fell-convergence-bernstein-centre); `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`; `SmoothRepresentationsOfLocalGroups:SR.3/unramified-characters`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, pp. 32–33; §10.3, proof of Lemma 10.8, p. 30: Gan–Savin use that square-integrable representations are isolated in the tempered dual to assume the approximating representations nontempered. \[CitedOnly] M. Tadić, Geometry of dual spaces of reductive groups (non-Archimedean case), J. Analyse Math. 51 (1988) (not read): The description of the topology of the tempered dual that the citing paper relies on.

### Dependencies

This layer rests on: `EndoscopicTransferAndUnitaryTraceComparison:ET.4`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3a`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.0`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.1`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.2`.

Coverage: **partial**. Remaining work:

- Miličić's theorem: the C\*-algebraic input: Miličić's Theorem 5 is a statement about C\*-algebras with bounded trace and the topology of their spectra. The group C\*-algebra exists upstream (OperatorAlgebraDynamics D1–D2, TauCetiRoadmap main) and the GCR and hull-kernel comparisons are in the open NoncompactQuantumSymmetry roadmap (PR #1015), but the bounded-trace theory and Miličić's limit theorem are not planned anywhere. milicic-limits states the theorem as Gan–Savin use it; its C\*-algebraic proof is this gap.
- Tempered dual local topology: Supply the finite-level local structure of Harish–Chandra’s tempered dual and the argument excluding a discrete series from limits of proper-Levi inductions when the centre is compact. SRup SR.3.3 harish-chandra-tempered-support states decomposition and uniqueness, not the needed topology. Convergence of Bernstein parameters alone is insufficient; retain the isolation theorem as a target with this input open.
- Decompose Miličić's theorem through the bounded-trace property of the group C\*-algebra (gap 'Miličić's theorem: the C\*-algebraic input').
- Make explicit the continuity of the characters of i\_Q(δ ⊗ ψ) in the unitary unramified parameter ψ used in Tadić's compactness of tempered characters.
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Layer SRU.4: Isolated representations: the Steinberg representation and supercuspidals

For G split simple over a p-adic field (Gan–Savin Appendix B): the Steinberg representation st\_G of the finite reductive group 𝐆(𝔽\_q) and its inflation to a hyperspecial maximal compact K; st\_G is a K-type of the Steinberg representation St\_G (SR.3.4) and the unique one with Iwahori-fixed vectors; Barbasch–Moy: a representation containing st\_G is generic. Rodier's decomposition of the unramified principal series containing St\_G into 2^r subquotients with known exponents. The Howe–Moore theorem over a nonarchimedean local field: coefficients of a unitary representation of 𝐆(F), 𝐆 almost simple and isotropic, with no nonzero 𝐆(F)⁺-invariant vector vanish at infinity. Consequently the only unitarizable subquotients of that principal series are 1 and St\_G; Gan–Savin Proposition 11.3: St\_G is isolated in Ĝ when rank G ≥ 2 (false in rank one). Irreducible supercuspidal representations of a group with compact centre are isolated in Ĝ (used with Corollary 11.7 in Gan–Savin Proposition 10.5).

<a id="sru-sru-4-finite-steinberg"></a>
#### SRU.4.1 The Steinberg representation of a finite reductive group

**The Steinberg representation of a finite reductive group** (*finite-steinberg*, definition). Let Γ = 𝐆(𝔽\_q) for a split connected reductive group 𝐆 over 𝔽\_q, with Borel subgroup B = B(𝔽\_q), Weyl group W, simple reflections S and N = |Φ⁺|. The Steinberg representation st\_Γ is the irreducible complex representation whose character is Σ\_{J⊆S} (−1)^{|J|} Ind\_{P\_J}^{Γ} 1 (P\_J the standard parabolic subgroups); it has degree q^N, its B-fixed line is acted on by the Iwahori–Hecke algebra End\_Γ(Ind\_B^Γ 1) through the sign character T\_s ↦ −1 (s ∈ S), and it is the unique constituent of Ind\_B^Γ 1 with this property. For the reductive p-adic G of SRU.4, st\_G denotes its inflation to K = 𝐆(O) along K → 𝐆(𝔽\_q).

*Hypotheses.* 𝐆 split connected reductive over 𝔽\_q; complex coefficients.

*Proof route.*

- The constituents of Ind\_B^Γ 1 correspond to the irreducible modules of H(W, q) = End\_Γ(Ind\_B^Γ 1), whose basis T\_w (w ∈ W) comes from the Bruhat decomposition Γ = ⊔ BwB (ReductiveGroups layer 7) with the quadratic and braid relations. For K = 𝐆(O) hyperspecial, K/I ≅ Γ/B via the reduction K → Γ, so H(W, q) ≅ H(K, I), the finite part of the Iwahori–Matsumoto presentation of H(G, I) generated by the T\_w, w ∈ W (SR.1 iwahori-matsumoto). The sign character T\_s ↦ −1 gives a constituent st\_Γ.
- The alternating sum Σ\_J (−1)^{|J|} Ind\_{P\_J} 1 is the character of this constituent (Solomon–Tits: it is the top homology of the Tits building); its degree is the index-weighted alternating sum, q^N.
- Inflation along the reduction K → 𝐆(𝔽\_q), surjective with kernel the positive radical K⁺ (ReductiveGroupsPartII RG2.3 reductive-quotient-of-special-fibre; the special fibre is 𝐆\_{𝔽\_q} because K is hyperspecial, RG2.3 hyperspecial-vertices), gives a smooth irreducible representation of K.
- The finite-Hecke sign character and its q^{|Φ⁺|} degree are independently supported by CIK71 §4, pp. 94–95. Identifying it with the alternating parabolic character additionally uses the Solomon/Coxeter-complex identity; that combinatorial input is recorded in the finite-Steinberg gap below.

*Uses.* Gan–Savin, proof of Proposition 11.3: st\_G is the K-type detecting genericity and the unique Iwahori K-type of St\_G. SRU.4 barbasch-moy-genericity: representations containing st\_G are generic.

*API.*

- `finiteSteinberg` (constructor): The Steinberg representation of 𝐆(𝔽\_q) as an FDRep ℂ (𝐆(𝔽\_q)).
- `finiteSteinberg_finrank` (characterisation): finrank ℂ (finiteSteinberg) = q ^ N, N the number of positive roots.
- `finiteSteinberg_character` (characterisation): Its character is Σ\_{J⊆S} (−1)^{|J|} times the permutation character of Γ/P\_J.
- `finiteSteinberg_hecke_sign` (characterisation): Its B-fixed line is one-dimensional and T\_s acts on it by −1 for every s ∈ S.
- `finiteSteinberg_unique` (extensionality): It is the unique irreducible constituent of Ind\_B^Γ 1 on whose B-fixed line every T\_s acts by −1.
- `steinbergKType` (constructor): st\_G := inflation of finiteSteinberg along K = 𝐆(O) → 𝐆(𝔽\_q).

**Checks.**

- `finiteSteinberg_gl2_dim` (computation): For Γ = GL₂(𝔽₃), dim st\_Γ = 3 and Ind\_B^Γ 1 ≅ 1 ⊕ st\_Γ.
- `finiteSteinberg_torus` (degenerate): For Γ = 𝔾\_m(𝔽\_q) (no roots), st\_Γ is trivial.
- `finiteSteinberg_ne_trivial` (non-example): For Γ = SL₂(𝔽\_q), st\_Γ is not the trivial representation: T\_s acts on the trivial representation's B-fixed line by q, not −1.
- `finiteSteinberg_sl3_dim` (computation): For Γ = SL₃(𝔽₂), dim st\_Γ = 8 = 2³.

*Acceptance.* For Γ = GL₂(𝔽\_q), Ind\_B^Γ 1 = 1 ⊕ st\_Γ with dim st\_Γ = q. For Γ a split torus, st\_Γ is the trivial representation.

*Needs:* `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`; `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`; `ReductiveGroupsPartII:RG2.3/reductive-quotient-of-special-fibre`; `ReductiveGroupsPartII:RG2.3/hyperspecial-vertices`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, p. 32: For a special maximal compact K with quotient G(𝔽\_q), st\_G is the inflation to K of the Steinberg representation of the finite group G(𝔽\_q); the restriction of the Steinberg representation of G to K contains st\_G. \[BC1] §1.1, p. 1: The Iwahori–Matsumoto involution of the Iwahori-spherical category preserves hermitian and unitary modules, exchanges spherical and generic modules, and takes the trivial representation to the Steinberg representation. \[CIK71] §4, Lemma 4.3, Theorem 4.4 and example (b), pp. 94–95: The sign character of the finite Hecke algebra determines a unique irreducible constituent of the flag permutation representation, of degree q to the number of positive roots; this is Steinberg’s representation.

*Planet:* Finite Steinberg representation.

<a id="sru-sru-4-steinberg-k-types"></a>
#### SRU.4.2 The Iwahori K-type of the Steinberg representation

**The Iwahori K-type of the Steinberg representation** (*steinberg-k-types*, theorem). Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. The restriction of the Steinberg representation St_G (SR.3.4) to K contains st_G with multiplicity one, and st_G is the only irreducible K-type of St_G having nonzero I-fixed vectors.

*Hypotheses.* G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r.

*Proof route.*

- St_G^I is one-dimensional (SR.3.4 steinberg). It is the I-fixed part of C^∞(B\\G)/Σ\_{B⊊P} C^∞(P\\G): by the Bruhat decomposition C^∞(B\\G)^I = ℂ\[B\\G/I] is the regular module of H(K, I) ≅ H(W, q), the subspaces C^∞(P_J\\G)^I are the modules induced from the trivial character of H(W_J, q), and the quotient by their sum over J ≠ ∅ is the sign character (Solomon–Kilmoyer).
- For any smooth V, V^I = (V^{K⁺})^{B(𝔽\_q)} with K⁺ the positive radical of K (finite-steinberg); the K-types of V with I-fixed vectors are the constituents of Ind_B^Γ 1 occurring in V^{K⁺}, detected by the H(W, q)-module V^I.
- The sign module corresponds to st_Γ (finite-steinberg), with multiplicity dim St_G^I = 1.

*Acceptance.* For GL₂(ℚ\_p), St restricted to GL₂(ℤ\_p) contains the q-dimensional st of GL₂(𝔽\_p) once, and no K-type of St with I-fixed vectors other than st.

*Needs:* [*finite-steinberg*](#sru-sru-4-finite-steinberg); `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`; `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`; `SmoothRepresentationsOfLocalGroups:SR.2/borel-casselman-invariants`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, pp. 32–33: The restriction of the Steinberg representation σ to K contains st_G, and st_G is the unique K-type of σ with Iwahori-fixed vectors.

<a id="sru-sru-4-barbasch-moy-genericity"></a>
#### SRU.4.3 Barbasch–Moy: the Steinberg K-type detects genericity

**Barbasch–Moy: the Steinberg K-type detects genericity** (*barbasch-moy-genericity*, theorem). Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. An irreducible admissible representation π of G whose restriction to K contains st_G is generic (admits a nonzero Whittaker functional for a generic character, SR.2.3). More precisely, for irreducible π with π^I ≠ 0, π is generic iff the H(K, I)-module π^I contains the sign character, iff π|\_K contains st_G (Barbasch–Moy).

*Hypotheses.* G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. π irreducible admissible.

*Proof route.*

- st_G has nonzero I-fixed vectors, so π^I ≠ 0 and π lies in the Iwahori block (SR.3.4 borel-casselman-block); π^I is a simple H(G, I)-module.
- Barbasch–Moy identify the Whittaker functionals on Iwahori-spherical π with the sign-isotypic part of π^I under the finite Hecke algebra: the Gelfand–Graev representation's I-fixed part is the induced module of the sign character of H(K, I) to H(G, I) (Barbasch–Moy 1994).
- Containing st_G is equivalent to the sign character occurring in π^I (steinberg-k-types).

*Acceptance.* The trivial representation does not contain st_G and is not generic; the Steinberg representation contains st_G and is generic. For GL₂(ℚ\_p), an irreducible unramified principal series i_B(χ) contains st_G (its Iwahori invariants are the regular H(W, q)-module) and is generic.

*Needs:* [*finite-steinberg*](#sru-sru-4-finite-steinberg); [*steinberg-k-types*](#sru-sru-4-steinberg-k-types); `SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block`; `SmoothRepresentationsOfLocalGroups:SR.2/whittaker-functionals`; `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, p. 32: Representations containing st_G are generic, by \[BM]. \[BC1] §1.1–1.2, pp. 1–2: Barbasch–Moy relate genericity of Iwahori-spherical modules to the Hecke algebra; for adjoint G a subquotient of X(χ) is both generic and spherical iff it is all of X(χ). \[CitedOnly] D. Barbasch and A. Moy, Whittaker models with an Iwahori fixed vector, Contemp. Math. 177 (1994) 101–105 (not read): The cited source.

*Planet:* Barbasch–Moy genericity criterion.

<a id="sru-sru-4-rodier-steinberg-series"></a>
#### SRU.4.4 Rodier's decomposition of the principal series containing the Steinberg representation

**Rodier's decomposition of the principal series containing the Steinberg representation** (*rodier-steinberg-series*, theorem). Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. Let χ = δ\_B^{1/2} (normalised induction), so that i\_B(χ) has the Steinberg representation as a subrepresentation and the trivial representation as its unique irreducible quotient. Then i\_B(χ) has exactly 2^r irreducible subquotients π\_J, J ⊆ Δ (simple roots), each with multiplicity one, π\_∅ = 1 and π\_Δ = St\_G (up to the convention fixing which end is which), and the exponents of the normalised Jacquet module r\_B(π\_J) are the w·χ for w in the set of Weyl group elements whose descent set is determined by J (Rodier; Casselman).

*Hypotheses.* G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r.

*Proof route.*

- χ = δ\_B^{1/2} is regular, so r\_B(i\_B χ) has the |W| distinct exponents w·χ (SR.2 principal-series-jacquet). Since r\_B(St\_G) = δ\_B^{1/2} (SR.3.4 steinberg), first adjointness (SR.2 first-adjointness) embeds St\_G in i\_B(δ\_B^{1/2}); dually the trivial representation is its quotient.
- Rodier’s theorem gives multiplicity-one irreducible constituents indexed by subsets of the simple roots, with the required Jacquet exponents. The proof is not obtained by taking a product of rank-one submodule lattices: rank-one intertwiner relations do not imply that assertion. The exact combinatorial theorem is an explicit prerequisite gap.
- The exponent sets are read off from which intertwining operators T\_{s\_α} vanish on the constituent (Casselman 1980, Theorem 3.1).

*Acceptance.* For PGL₂, r = 1 and i\_B(δ\_B^{1/2}) has the two constituents 1 and St. For PGL₃, i\_B(δ\_B^{1/2}) has four constituents, 1, St and two further infinite-dimensional ones, each with multiplicity one.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/first-adjointness`; `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`; `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`.

*Sources:* \[GS23] §11.1, proof of Proposition 11.3, p. 33: By Rodier \[Ro\], Ind\_B^G(χ) has 2^r irreducible subquotients whose exponents, hence matrix-coefficient asymptotics, are known. \[Cas80] §3, Theorem 3.1 (p. 397) and Proposition 3.5 (p. 401): For regular χ the intertwining operators T\_w and the factors c\_α(χ) control irreducibility of the unramified principal series. \[CitedOnly] F. Rodier, Decomposition of principal series for reductive p-adic groups and the Langlands' classification, in Operator algebras and group representations II (Neptun 1980), Pitman 1984, 86–94 (not read): The cited source.

*Planet:* Rodier's decomposition.

<a id="sru-sru-4-howe-moore"></a>
#### SRU.4.5 The Howe–Moore theorem over nonarchimedean local fields

**The Howe–Moore theorem over nonarchimedean local fields** (*howe-moore*, theorem). Let 𝐆 be connected, almost simple and isotropic over a nonarchimedean local field F (any characteristic), G = 𝐆(F) and G⁺ the normal subgroup generated by the unipotent radicals of F-parabolic subgroups (G⁺ = G for 𝐆 simply connected; G/G⁺ is compact abelian in general, and finite in characteristic zero). If π is a strongly continuous unitary representation of G with no nonzero G⁺-invariant vector, then every coefficient g ↦ ⟪w, π(g)v⟫ vanishes at infinity on G. In particular, an infinite-dimensional irreducible unitary representation of G has coefficients vanishing at infinity.

*Hypotheses.* 𝐆 almost F-simple and F-isotropic; π strongly continuous unitary without G⁺-invariant vectors.

*Proof route.*

- Cartan decomposition reduces coefficient decay to escape in a positive chamber. Uniformity is needed only for compact K-orbits of fixed v and w and follows from finite ε-nets and unitarity. Uniform decay over the entire unit ball would be false.
- Use the full Howe–Moore contraction/Mautner lemma to show every weak cluster vector along an escaping chamber sequence is G⁺-fixed. The contracted root groups alone do not generate their opposites; that propagation is a nonroutine part of the theorem, recorded as a gap below. CCLTV §1, pp. 1–2, confirms the G⁺ theorem in arbitrary local-field characteristic; its separate relative Theorem 1.4 is characteristic zero only.
- The hypothesis forces the weak cluster vectors to vanish, hence all coefficients tend to zero at infinity.
- For an irreducible π, H^{G⁺} is closed invariant, so is either zero or H. In the latter case π factors through compact abelian G/G⁺ and is one-dimensional. Thus an infinite-dimensional irreducible has no G⁺-fixed vector. For PGL\_p over 𝔽\_q((t)), F×/(F×)^p illustrates why finiteness must not be asserted in positive characteristic.

*Acceptance.* For G = SL₂(ℚ\_p), the coefficients of the Steinberg representation (square-integrable) and of every unitary principal series vanish at infinity; the trivial representation is excluded by the invariant-vector hypothesis. For G = PGL₂(ℚ\_p) the unitary character g ↦ (−1)^{v\_p(det g)} is a nontrivial one-dimensional unitary representation whose coefficient does not vanish at infinity; it is trivial on G⁺, as the hypothesis requires.

*Needs:* `ReductiveGroupsPartII:RG2.4/cartan-decomposition`; [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary); [*positive-type-coefficient*](#sru-sru-0-positive-type-coefficient); `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

*Sources:* \[CCLTV] §1, opening paragraph and Theorem 1.4(2), pp. 1–2: The subgroup generated by unipotent elements in a simple algebraic group over a local field has the Howe–Moore property (citing Howe–Moore); for groups over ℚ\_p, (G, S⁺) has the relative Howe–Moore property when S⁺ is generated by the unipotents of a simple algebraic group. \[GS23] §11.1, end of the proof of Proposition 11.3, p. 33: By a theorem of Howe and Moore, subquotients whose matrix coefficients do not decay at infinity are not unitarizable unless trivial. \[CH26] §6, Lemma 6.8, p. 18: No unbounded region of spherical parameters is unitary, citing Howe–Moore. \[CitedOnly] R. Howe and C. C. Moore, Asymptotic properties of unitary representations, J. Funct. Anal. 32 (1979) 72–96, Theorem 5.1 (not read): The original theorem.

*Planet:* Howe–Moore theorem.

*Lean:* `howeMoore_specialLinearGroup`

<a id="sru-sru-4-steinberg-series-unitary"></a>
#### SRU.4.6 Unitary constituents of the Steinberg principal series

**Unitary constituents of the Steinberg principal series** (*steinberg-series-unitary*, theorem). Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. The only unitarizable irreducible subquotients of the principal series i_B(δ\_B^{1/2}) of rodier-steinberg-series are the trivial representation and the Steinberg representation.

*Hypotheses.* G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r.

*Proof route.*

- The trivial representation is unitarizable; St_G is square-integrable, hence unitarizable (SR.3.3 square-integrable-tempered).
- For J ≠ ∅, Δ, the constituent π\_J is infinite-dimensional and some exponent w·χ of r_B(π\_J) has absolute value ≥ 1 on a ray of the negative cone (rodier-steinberg-series); by Casselman's pairing (SR.2 casselman-pairing) the K-finite coefficients of π\_J along that ray are asymptotic to a nonzero combination of those exponents, so they do not vanish at infinity.
- An infinite-dimensional unitarizable π\_J would have coefficients vanishing at infinity (howe-moore), a contradiction.

*Acceptance.* For PGL₂ the statement is empty beyond 1 and St, which are the only constituents. For PGL₃ the two intermediate constituents of i_B(δ\_B^{1/2}) are not unitarizable.

*Needs:* [*rodier-steinberg-series*](#sru-sru-4-rodier-steinberg-series); [*howe-moore*](#sru-sru-4-howe-moore); [*unitary-dual-smooth*](#sru-sru-2-unitary-dual-smooth); `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`.

*Sources:* \[GS23] §11.1, end of the proof of Proposition 11.3, p. 33: The exponents of Rodier's subquotients determine the asymptotics of their matrix coefficients; those other than the Steinberg representation do not decay, so by Howe–Moore the only unitarizable subquotients are the trivial and the Steinberg representation.

<a id="sru-sru-4-steinberg-isolated"></a>
#### SRU.4.7 The Steinberg representation is isolated

**The Steinberg representation is isolated** (*steinberg-isolated*, theorem). Let G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. If r ≥ 2, the Steinberg representation St\_G is an isolated point of the unitary dual Ĝ (Gan–Savin Proposition 11.3). For r = 1 (SL₂, PGL₂) the statement is false: St\_G is a limit point of the spherical complementary series.

*Hypotheses.* G = 𝐆(F) with 𝐆 a split, almost simple (Chevalley) group over a p-adic field F of characteristic zero, residue field 𝔽\_q, hyperspecial K = 𝐆(O) with reduction K → 𝐆(𝔽\_q), Iwahori subgroup I = preimage of a Borel B(𝔽\_q), rank r. r ≥ 2.

*Proof route.*

- Suppose \[St\] ∈ L\[πₙ\] with πₙ irreducible unitarizable, πₙ ≇ St. By k-types-persist, st\_G occurs in πₙ for n large, so πₙ is generic (barbasch-moy-genericity), and the gan-savin-generic-limits apply: after a subsequence πₙ ≅ i\_P(τₙ), τₙ → τ, St a subquotient of i\_P(τ), and every subquotient of i\_P(τ) is a limit point (milicic-limits), hence unitarizable.
- πₙ is eventually nontempered (discrete-series-isolated-tempered), so P ≠ G. By fell-convergence-bernstein-centre every subquotient of i\_P(τ) has the cuspidal support of St, i.e. lies in i\_B(δ\_B^{1/2}).
- If P = B, all 2^r ≥ 4 constituents of i\_B(δ\_B^{1/2}) would be unitarizable, contradicting steinberg-series-unitary.
- If B ⊊ P ⊊ G: τ has Iwahori-spherical cuspidal support because i\_P(τ) has the cuspidal support of St; hence τ is Iwahori-spherical. Within that block τ is generic, so (barbasch-moy-genericity for M) st\_M is a (K ∩ M)-type of τ; by the Iwasawa decomposition G = QK for a minimal parabolic Q ⊆ P (ReductiveGroupsPartII RG2.4), hence G = PK, i\_P(τ)|\_K = Ind\_{K∩P}^K(τ|\_{K∩M}) contains the inflation of the finite induced representation Ind\_{P(𝔽\_q)}^{Γ}(st\_{M(𝔽\_q)}), whose B(𝔽\_q)-fixed vectors form the H(W, q)-module induced from the sign character of H(W\_M, q). It has dimension \[W : W\_M\] > 1, contains the sign character once and the trivial character not at all (W\_M ≠ 1), so it has an irreducible constituent different from both; this is a K-type with I-fixed vectors other than st\_G and other than the trivial K-type. The constituent of i\_P(τ) carrying it is unitarizable, is not St (steinberg-k-types) and not 1, contradicting steinberg-series-unitary. Gan–Savin call this step easy; the expansion here is the finite-Hecke-algebra computation.

*Acceptance.* For PGL₂(ℚ\_p) the complementary series i\_B(|·|^{s} ⊗ |·|^{−s}), 0 < s < 1/2, converge as s → 1/2 to both 1 and St in the Fell topology, so St is not isolated in rank one. For G₂(ℚ₅) (rank 2) St is isolated; this is the input of the counterexample to the subsequence form of Gan–Savin Proposition 11.6 (SRU.1 gan-savin-closure).

*Needs:* [*k-types-persist*](#sru-sru-3-k-types-persist); [*barbasch-moy-genericity*](#sru-sru-4-barbasch-moy-genericity); [*gan-savin-generic-limits*](#sru-sru-3-gan-savin-generic-limits); [*milicic-limits*](#sru-sru-3-milicic-limits); [*discrete-series-isolated-tempered*](#sru-sru-3-discrete-series-isolated-tempered); [*fell-convergence-bernstein-centre*](#sru-sru-3-fell-convergence-bernstein-centre); [*steinberg-series-unitary*](#sru-sru-4-steinberg-series-unitary); [*finite-steinberg*](#sru-sru-4-finite-steinberg); [*fell-topology*](#sru-sru-1-fell-topology); `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`.

*Sources:* \[GS23] §11.1, Proposition 11.3 and proof, pp. 32–33: If rank G ≥ 2 the Steinberg representation is isolated in the unitary dual; the proof uses Lemma 11.4, Barbasch–Moy, Proposition 11.2, isolation of discrete series in the tempered dual, Tadić's Bernstein-centre convergence, Rodier's decomposition and Howe–Moore.

*Planet:* Isolation of the Steinberg representation.

<a id="sru-sru-4-supercuspidal-isolated"></a>
#### SRU.4.8 Supercuspidal representations are isolated

**Supercuspidal representations are isolated** (*supercuspidal-isolated*, theorem). Let G = 𝐆(F) be reductive over a nonarchimedean local field with compact centre. Every irreducible unitarizable supercuspidal representation σ of G is an isolated point of Ĝ. (With noncompact centre the same holds in the subset of Ĝ with a fixed unitary central character.)

*Hypotheses.* Z(G) compact, or a fixed unitary central character.

*Proof route.*

- By the Bernstein decomposition (SR.3 bernstein-decomposition, cuspidal-splitting) the component of σ is {σ ⊗ ψ : ψ unramified}, which for compact centre is {σ} up to isomorphism; let e be the idempotent of the Bernstein centre cutting it out and K a compact open subgroup with σ^K ≠ 0. Then f := e ∗ 1_K (normalised) lies in C_c^∞(G).
- For an irreducible unitarizable π, π(f) ≠ 0 iff π is in the component of σ and π^K ≠ 0, iff π ≅ σ.
- The set {x ∈ Ĝ : rep x (f) ≠ 0} is open in the Fell topology (fell-topology, UnitaryDual.isOpen_setOf_apply_ne_zero), so {\[σ]} is open.

*Acceptance.* For PGL₂(ℚ\_p), every depth-zero supercuspidal representation is isolated, while the unitary principal series are not. For ℚ\_p^× (noncompact centre) a unitary character is not isolated in the full unitary dual, being a limit of unramified twists; it is isolated among characters with a fixed value at p.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.3/bernstein-decomposition`; `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-splitting`; `SmoothRepresentationsOfLocalGroups:SR.3a/cuspidal-representations`; [*fell-topology*](#sru-sru-1-fell-topology); [*unitary-dual-smooth*](#sru-sru-2-unitary-dual-smooth).

*Sources:* \[GS23] §10.2, proof of Proposition 10.5, p. 29: Supercuspidal representations and the Steinberg representation are isolated in the unitary dual, which lets Corollary 11.7 produce the global representation. \[SRup] SR.3.2, bernstein-decomposition and cuspidal-splitting: The cuspidal component of an irreducible cuspidal σ is the set of its unramified twists, split off by an idempotent of the centre.

*Planet:* Isolation of supercuspidals.

### Dependencies

This layer rests on: `ReductiveGroupsPartII:RG2.3`; `ReductiveGroupsPartII:RG2.4`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.3a`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.0`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.1`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.2`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`; TauCetiRoadmap ReductiveGroups (layer 7 structure theory).

Coverage: **partial**. Remaining work:

- Finite Steinberg and Rodier constituent combinatorics: Supply the finite Coxeter-complex/Solomon alternating-character identity identifying the finite-Hecke sign representation with the alternating parabolic sum, and Rodier’s precise multiplicity-one constituent/exponent description for the principal series containing St. CIK71 §4, pp. 94–95, verifies the finite sign character and degree; GS23 §11.1, pp. 31–32, supplies the Rodier statement secondarily. An entire Boolean product description of the submodule lattice is not implied and is not asserted.
- Howe–Moore contraction lemma: The full contraction/Mautner propagation argument, from a weak cluster vector along an escaping Cartan sequence to G⁺-invariance, is nonroutine and is not supplied by Cartan decomposition alone. CCLTV §1, pp. 1–2, supports the all-characteristic G⁺ statement but cites the semisimple-group theorem. Locate and plan this proof without importing the characteristic-zero-only relative theorem.
- Write the 2^r exponent sets of Rodier's decomposition explicitly for the split simple types, as needed by steinberg-series-unitary.
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Layer SRU.5: Generic unitary spherical representations of split groups

Ciubotaru–Harris §6 over any nonarchimedean local field k (no characteristic hypothesis), for G quasi-simple split adjoint with hyperspecial K = G(O): Satake parameters s ∈ T^∨ (SR.4), the polar decomposition s = s\_c·s\_ν with s\_ν = q^ν, ν ∈ t^∨\_ℝ, the unramified principal series X(s) and its spherical subquotient L(s), with the sign convention (6.1) pinned against SR's Langlands convention. Half-integrality of ν for a representation V of g^∨ and geometric Satake parameters (Definition 6.3); temperedness of L(s) iff ν = 0; spherical tempered implies generic; Casselman–Kato irreducibility of X(s); L(s) generic iff X(s) irreducible (Barbasch–Moy); hermitian iff w₀ν = −ν. The generic unitary region U^g\_0 inside the hermitian locus C\_{0,h} of the dominant chamber C₀, the fundamental alcove A₀; Lemma 6.7 (A₀ ∩ C\_{0,h} ⊆ U^g\_0, complementary series), Lemma 6.8 (no unbounded unitary region, Howe–Moore), the Barbasch–Moy unitarity criterion through the Iwahori–Hecke algebra, and the classification Theorem 6.9 (2^d alcoves; Barbasch, Ciubotaru, Barbasch–Ciubotaru, Tadić). Proposition 6.10, the reduction (6.11)–(6.13), Theorem 6.14 type by type, Lemma 6.30, Proposition 6.31 and Corollary 6.32 stated for real or central-compact Satake parameters, with the G₂ counterexample showing that the printed statement for arbitrary s\_c fails.

<a id="sru-sru-5-real-satake-parameter"></a>
#### SRU.5.1 Satake parameters, real parts and the spherical principal series

**Satake parameters, real parts and the spherical principal series** (*real-satake-parameter*, definition). Let k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). For s ∈ T^∨ = Hom(X^∨, ℂ^×), χ\_s := s ∘ val_T : T(k) → ℂ^× with ⟨val_T(t), λ⟩ = val_k(λ(t)) (Ciubotaru–Harris (6.1)); X(s) := i_B(χ\_s) (normalised, SR.2) and L(s) its unique K-spherical irreducible subquotient; s ↦ L(s) is a bijection from W-orbits in T^∨ to irreducible K-spherical representations, s being the Satake parameter (SR.4 spherical-parameter, satake-isomorphism, with complex coefficients and the positive square root q^{1/2} ∈ ℂ fixing normalised induction). Polar decomposition T^∨ = T^∨\_ℝ · T^∨\_c with T^∨\_ℝ = X ⊗ ℝ\_{>0}, T^∨\_c = X ⊗ S¹; every s is uniquely s = s_c·s_ν with s_c ∈ T^∨\_c, ν ∈ t^∨\_ℝ = X ⊗ ℝ and s_ν = exp(ν log q); s_ν is a real Satake parameter, X(ν) := X(s_ν), L(ν) := L(s_ν). C₀ = {ν : ⟨α^∨, ν⟩ ≥ 0 for α ∈ Π}, C_{0,h} = {ν ∈ C₀ : w₀ν = −ν} (hermitian locus), A₀ = {ν ∈ C₀ : ⟨γ^∨, ν⟩ < 1} (γ^∨ the highest coroot), ρ = half the sum of positive roots; the trivial representation is L(ρ). Convention: with (6.1), χ\_{s_ν}(λ^∨(ϖ)) = q^{⟨λ^∨, ν⟩}, so for dominant ν the spherical L(ν) is the unique irreducible subrepresentation of X(ν) (and the unique quotient of X(−ν)); Barbasch–Ciubotaru's χ\_ν(τ(a)) = |a|^{⟨τ, ν⟩} differs by ν ↦ −ν, which changes no statement of SRU.5–SRU.7 because L(ν) and L(−ν) are hermitian duals and unitarity is preserved (sourceIssues E2).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- X(s)^K is one-dimensional by the Iwasawa decomposition (ReductiveGroupsPartII RG2.4), so X(s) has exactly one K-spherical constituent L(s) (SR.2 induced-invariants).
- The Hecke character of L(s) is evaluation of the Satake transform at s; the Satake isomorphism identifies H(G, K) with ℂ\[T^∨]^W (SR.4), so L(s) ≅ L(s') iff s' ∈ W·s.
- Polar decomposition is that of ℂ^× = ℝ\_{>0} × S¹ coordinatewise in X ⊗ ℂ^×.
- Sign of the convention: val_T(λ^∨(ϖ)) = λ^∨ gives χ\_{s_ν}(λ^∨(ϖ)) = q^{⟨λ^∨, ν⟩}; for PGL₂ and ν = ρ this is δ\_B^{−1/2}, and i_B(δ\_B^{−1/2}) = Ind_B 1 has the trivial representation as subrepresentation (SR.3.4 steinberg).

*Uses.* Ciubotaru–Harris, §§6–8: every statement about generic unitary spherical representations is phrased in Satake parameters s = s_c s_ν. Ciubotaru–Harris, (5.1): the global proof records ν\_w(σ) = log_q|ι(s_w(σ))| at unramified places.

*API.*

- `SatakeParameter` (data): An element s of the dual torus T^∨ = X ⊗ ℂ^× (as Hom(X^∨, ℂ^×)), with the W-action.
- `SatakeParameter.unramifiedCharacter` (constructor): χ\_s := s ∘ val_T, an unramified character of T(k).
- `SatakeParameter.polar` (projection): The decomposition s = s_c · s_ν with s_c ∈ T^∨\_c and ν ∈ X ⊗ ℝ, unique.
- `SatakeParameter.realPart` (projection): ν = log_q |s|, the real part, W-equivariant.
- `sphericalPrincipalSeries` (constructor): X(s) := i_B χ\_s.
- `sphericalQuotient` (constructor): L(s), the unique K-spherical irreducible subquotient of X(s).
- `sphericalQuotient_iso_iff` (extensionality): L(s) ≅ L(s') ↔ ∃ w ∈ W, s' = w • s.
- `sphericalQuotient_rho` (example): L(s_ρ) is the trivial representation.
- `dominantChamber` (data): C₀, C_{0,h} = {ν ∈ C₀ | w₀ ν = −ν} and A₀ = {ν ∈ C₀ | ⟨γ^∨, ν⟩ < 1} as subsets of X ⊗ ℝ.

**Checks.**

- `satake_pgl2_trivial` (computation): For G = PGL₂(ℚ\_p), L(s_ρ) is the trivial representation and ⟨α^∨, ρ⟩ = 1.
- `satake_polar_unique` (characterisation): For s = s_c s_ν = s'\_c s_{ν'} in T^∨, s_c = s'\_c and ν = ν'.
- `satake_real_vs_compact` (degenerate): For ν = 0, s = s_c is compact and X(s_c) is unitarily induced.
- `satake_not_weyl_conjugate` (non-example): For PGL₂, s = q^{1/4} and s' = q^{1/3} are not W-conjugate, so L(s) ≇ L(s').

*Acceptance.* For G = PGL₂ the Satake parameters are s ∈ ℂ^× modulo s ↦ s⁻¹; the trivial representation is L(q^{1/2}) = L(ρ), and L(1) = X(1) is the unitary spherical principal series at the centre. For every s, L(s) ≅ L(w·s) for w ∈ W, and s = s_c s_ν with s_c = 1 iff s ∈ T^∨\_ℝ.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`; `SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism`; `SmoothRepresentationsOfLocalGroups:SR.4/torus-character-dictionary`; `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/induced-invariants`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `ReductiveGroupsPartII:RG2.4/iwasawa-decomposition`.

*Sources:* \[CH26] §6, (6.1)–(6.6) and the paragraphs between them, pp. 16–18: Ciubotaru–Harris fix the split adjoint setting, the character χ\_s = s ∘ val_T, the unitarily induced X(s) with unique spherical subquotient L(s), the bijection with W-orbits, the polar decomposition s = s_c s_ν, real Satake parameters, C₀, the hermitian locus and the fundamental alcove; L(ρ) is the trivial representation. \[BC1] §1.2, (1.2.1)–(1.2.2), p. 2: Barbasch–Ciubotaru parametrise real unramified characters by ν ∈ X^\*(H) ⊗ ℝ through χ\_ν(τ(a)) = |a|^{⟨τ, ν⟩}, the opposite sign; for dominant χ the spherical L(χ) is the unique irreducible quotient of X(χ).

*Planet:* Real Satake parameters.

<a id="sru-sru-5-half-integral-parameter"></a>
#### SRU.5.2 Half-integral real parts and geometric Satake parameters

**Half-integral real parts and geometric Satake parameters** (*half-integral-parameter*, definition). In the setting of real-satake-parameter, let (V, ρ\_V) be a finite-dimensional representation of g^∨ (equivalently of G^∨). A real parameter ν ∈ t^∨\_ℝ is half-integral with respect to V if ⟨χ, ν⟩ ∈ ½ℤ for every weight χ of V; the Satake parameter s = s_c s_ν is then called geometric with respect to V (Ciubotaru–Harris Definition 6.3). This is a condition on the real part only, not algebraicity of s_c. For a fixed 0 ≤ ε < ½, C₀^{½+ε} := {ν ∈ C₀ : ⟨α^∨, ν⟩ ∈ ε + ½ℤ for all α^∨ ∈ Φ^∨} ((6.11)); C₀^{½} is the set of ν ∈ C₀ half-integral for the adjoint representation. In fundamental-weight coordinates ν = Σ νᵢ ωᵢ, ν ∈ C₀^{½} iff every νᵢ ∈ ½ℤ\_{≥0}.

*Hypotheses.* V finite-dimensional; ν real.

*Proof route.*

- Weights of the adjoint representation are the roots of g^∨, i.e. the coroots α^∨ of G; so adjoint half-integrality is ⟨α^∨, ν⟩ ∈ ½ℤ for all coroots, equivalently for the simple ones.
- For ν dominant, ⟨αᵢ^∨, ν⟩ = νᵢ in fundamental-weight coordinates.

*Uses.* Ciubotaru–Harris, proof of Theorem 5.4, (5.6): Weil-number eigenvalues of Frobenius on the local systems L(π, τ) force half-integrality of ν\_w for the weights of τ. Ciubotaru–Harris, Corollary 6.32 and Theorem 8.5: the test that eliminates nonzero real parts.

*API.*

- `IsHalfIntegral` (data): IsHalfIntegral V ν :⇔ ∀ χ ∈ weights of V, ⟨χ, ν⟩ ∈ (1/2 : ℝ) • ℤ.
- `isHalfIntegral_adjoint_iff` (characterisation): Half-integrality for the adjoint representation ↔ ∀ α^∨ ∈ Φ^∨, ⟨α^∨, ν⟩ ∈ ½ℤ ↔ (for dominant ν) every fundamental coordinate νᵢ ∈ ½ℤ\_{≥0}.
- `IsHalfIntegral.of_highestWeight` (characterisation): For ν ∈ C₀^{½} and V = V(λ^∨) irreducible, IsHalfIntegral V ν ↔ ⟨λ^∨, ν⟩ ∈ ½ℤ (Lemma 6.30, half-integrality-highest-weight).
- `IsGeometric` (data): s is geometric for V iff its real part is half-integral for V.
- `halfIntegralChamber` (constructor): C₀^{½+ε} for 0 ≤ ε < ½.
- `IsHalfIntegral.rho` (example): ρ is half-integral for every V.

**Checks.**

- `halfIntegral_rho_adjoint` (computation): For G = PGL₃, ⟨α^∨, ρ⟩ ∈ {1, 2} for the positive coroots, so ρ ∈ C₀^{½}.
- `halfIntegral_zero` (degenerate): ν = 0 is half-integral for every V.
- `not_halfIntegral_quarter` (non-example): For G = PGL₂ and ν = ¼α (so ⟨α^∨, ν⟩ = ½), ν is half-integral for the adjoint representation but not for the standard representation of SL₂(ℂ), whose weights ±α^∨/2 pair to ±¼.
- `halfIntegral_g2_all` (compatibility): For G = G₂ every weight of every representation of G^∨ = G₂(ℂ) lies in the root lattice, so adjoint half-integrality implies half-integrality for all V.

*Acceptance.* ρ is half-integral for every representation of G^∨ (its pairings with weights are half-integers), so the trivial representation L(ρ) is geometric for all V. The real part ν of a tempered spherical representation is 0, half-integral for every V.

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 2 weights of a module and their integrality).

*Sources:* \[CH26] §6, Definition 6.3, p. 17; (6.11)–(6.13), p. 19: ν is half-integral with respect to V when all its pairings with weights of V lie in ½ℤ, and then s is called geometric; C₀^{½+ε} collects the dominant ν whose coroot pairings lie in ε + ½ℤ.

*Planet:* Half-integral real parts.

*Lean:* `IsHalfIntegral`, `isHalfIntegral_adjoint_iff`

<a id="sru-sru-5-spherical-tempered-criterion"></a>
#### SRU.5.3 Tempered spherical representations

**Tempered spherical representations** (*spherical-tempered-criterion*, theorem). In the setting of real-satake-parameter, L(s) is tempered iff its real part ν is 0; in that case L(s) = X(s) is an irreducible summand of a principal series unitarily induced from a unitary character of B (Ciubotaru–Harris Lemma 5.2, in local form).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- If ν=0, χ\_s is unitary and normalised induction is tempered. In the adjoint setting of real-satake-parameter, irreducibility follows from the unramified irreducibility criterion; hence its spherical constituent is tempered. No argument uses unitarizability alone to deduce irreducibility.
- Conversely use the spherical Langlands classification and Casselman’s tempered exponent criterion, precisely as in CH26 Lemma 5.2, pp. 12–13: a nonzero dominant real part gives a nonzero positive Langlands exponent, incompatible with temperedness. The Jacquet exponent set of an individual spherical constituent need not be Weyl stable.

*Acceptance.* For PGL₂(ℚ\_p), the spherical L(s) is tempered iff |s| = 1; the trivial representation L(q^{1/2}) is not tempered.

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); [*unitary-induction*](#sru-sru-2-unitary-induction); `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`; `SmoothRepresentationsOfLocalGroups:SR.3/langlands-classification`; `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`.

*Sources:* \[CH26] §5, Lemma 5.2 and proof, pp. 12–13: A spherical local component is tempered iff its real Satake part vanishes, and is then a summand of a principal series unitarily induced from a unitary character of the minimal parabolic; the proof uses Casselman's criterion.

<a id="sru-sru-5-unramified-principal-series-irreducibility"></a>
#### SRU.5.4 Irreducibility of unramified principal series

**Irreducibility of unramified principal series** (*unramified-principal-series-irreducibility*, theorem). In the setting of real-satake-parameter: (1) for s regular (trivial stabiliser in W), X(s) is irreducible iff α^∨(s) ≠ q^{±1} for every root α (Casselman 1980 Proposition 3.5(b)); (2) for general s and G adjoint (so G^∨ simply connected and every centraliser Z\_{G^∨}(s) connected), X(s) is irreducible iff α^∨(s) ≠ q^{±1} for every root α (Kato's criterion; its second condition, that W\_s be generated by reflections, holds automatically); (3) for a real dominant ν, X(ν) is irreducible iff ⟨α^∨, ν⟩ ≠ 1 for every positive coroot α^∨ (Ciubotaru–Harris p. 17; Barbasch–Ciubotaru §3.1).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- (1): Casselman's intertwining operators T\_w with T\_{w⁻¹} ∘ T\_w = c\_{w⁻¹}(wχ)c\_w(χ) and c\_α(χ) = (1 − q⁻¹χ(a\_α))/(1 − χ(a\_α)) for split groups (Casselman 1980 Theorem 3.1); irreducibility iff the product over all positive roots is nonzero (Proposition 3.5(b)).
- (2): Kato extends (1) to singular s; for G adjoint, Steinberg's theorem makes Z\_{G^∨}(s) connected and W\_s its Weyl group, generated by reflections.
- (3): for real dominant ν, α^∨(s\_ν) = q^{⟨α^∨, ν⟩} with ⟨α^∨, ν⟩ ≥ 0 for positive α, so only the value 1 can occur.

*Acceptance.* For PGL₂ with s=diag(t,t⁻¹), reducibility occurs exactly at t²=q^{±1}. At t=+q^{1/2} the Jordan–Hölder constituents are 1 and St; at t=−q^{1/2} both are twisted by the unramified quadratic character. These endpoint principal series are nonsplit extensions, not Hilbert direct sums. For PGL₂ and the real parameter ν with ⟨α^∨, ν⟩ = 1, X(ν) contains the trivial and Steinberg representations.

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`; `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`; `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

*Sources:* \[Cas80] §3, Theorem 3.1 (p. 397) and Proposition 3.5(b) (p. 401, page image checked): For regular unramified χ, Ind(χ) is irreducible iff c\_{w\_ℓ}(w\_ℓχ)c\_{w\_ℓ}(χ) ≠ 0, i.e. no root value χ(a\_α) equals q^{±1} in the split case. \[CH26] §6, after Definition 6.3, p. 17: The reducibility points of X(s) go back to Casselman for regular s; for real ν, X(ν) = L(ν) iff ⟨α^∨, ν⟩ ≠ 1 for all positive coroots. \[BC1] §3.1, pp. 16–17: For dominant χ, X(χ) is reducible iff ⟨α, χ⟩ = 1 for some positive α. \[CitedOnly] S. Kato, Irreducibility of principal series representations for Hecke algebras of affine type, J. Fac. Sci. Univ. Tokyo 28 (1981) (not read): Kato's criterion for singular parameters.

<a id="sru-sru-5-spherical-generic-criterion"></a>
#### SRU.5.5 Generic spherical representations

**Generic spherical representations** (*spherical-generic-criterion*, theorem). In the setting of real-satake-parameter, each X(s) has a unique generic irreducible subquotient (Rodier), and L(s) is generic iff X(s) is irreducible, i.e. iff L(s) = X(s) (Barbasch–Moy; Ciubotaru–Harris p. 17). Consequently a tempered L(s) is generic (Ciubotaru–Harris Corollary 5.7, local part).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- Uniqueness of the generic constituent: SRU.3 rodier-heredity for P = B.
- If X(s) is irreducible, L(s) = X(s) is generic (every principal series is generic).
- If L(s) is generic, its Iwahori-fixed H(K, I)-module contains both the trivial character (spherical) and the sign character (generic, SRU.4 barbasch-moy-genericity); for adjoint G Barbasch–Moy show this forces L(s) = X(s) (Barbasch–Ciubotaru §1.2, \[BM4]).
- Tempered spherical: ν = 0 (spherical-tempered-criterion), so |α^∨(s)| = 1 ≠ q^{±1} and X(s) is irreducible (unramified-principal-series-irreducibility), hence generic.

*Acceptance.* The trivial representation L(ρ) is not generic (rank ≥ 1), and X(ρ) is reducible. Every L(s_c) with s_c compact is generic and equal to X(s_c).

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); [*spherical-tempered-criterion*](#sru-sru-5-spherical-tempered-criterion); [*unramified-principal-series-irreducibility*](#sru-sru-5-unramified-principal-series-irreducibility); [*rodier-heredity*](#sru-sru-3-rodier-heredity); [*barbasch-moy-genericity*](#sru-sru-4-barbasch-moy-genericity).

*Sources:* \[CH26] §6, p. 17; §5, proof of Corollary 5.7, p. 15: By \[BM2] the spherical L(s) is generic iff X(s) = L(s); tempered spherical representations of split adjoint groups are the full principal series and hence generic. \[BC1] §1.2, p. 2; §3.1, pp. 16–17: Each X(χ) has a unique generic subquotient; for adjoint G a subquotient is both generic and spherical iff it is the whole X(χ).

<a id="sru-sru-5-spherical-hermitian-criterion"></a>
#### SRU.5.6 Hermitian spherical representations

**Hermitian spherical representations** (*spherical-hermitian-criterion*, theorem). In the setting of real-satake-parameter, L(s) admits a nonzero G-invariant hermitian form iff some w ∈ W maps s to s̄⁻¹ (Barbasch–Ciubotaru §1.2); for a real dominant ν this means w₀ν = −ν (Ciubotaru–Harris (6.5)). When w₀ = −1 (types A₁, B, C, D_{2m}, G₂, F₄, E₇, E₈) every real ν is hermitian; Ciubotaru–Harris list B, C, G₂, F₄, E₇, E₈.

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- An invariant hermitian form is an isomorphism L(s) → conj(L(s)~); the contragredient of L(s) is L(s⁻¹) and its complex conjugate L(s̄⁻¹), so the condition is L(s) ≅ L(s̄⁻¹), i.e. s̄⁻¹ ∈ W·s (real-satake-parameter).
- For s = s_ν real, s̄⁻¹ = s_{−ν}; for dominant ν, −ν ∈ W·ν iff −ν = w₀ν.

*Acceptance.* For PGL₃ (w₀ ≠ −1) the real dominant ν = ω₁ is not hermitian. For PGL₂ every real ν is hermitian.

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); [*unitary-structure*](#sru-sru-2-unitary-structure); `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category/smooth-dual`.

*Sources:* \[BC1] §1.2, p. 2; §3.1, pp. 16–17: L(χ) admits an invariant hermitian form iff wχ = χ⁻¹ for some w; for real dominant χ, X(χ) is hermitian iff w₀χ = −χ. \[CH26] §6, (6.5), p. 17: Ciubotaru–Harris state the hermitian criterion w₀(ν) = −ν and its automatic validity for types B, C, G₂, F₄, E₇, E₈.

<a id="sru-sru-5-generic-unitary-region"></a>
#### SRU.5.7 The generic unitary spherical region

**The generic unitary spherical region** (*generic-unitary-region*, definition). In the setting of real-satake-parameter, U₀^g := {ν ∈ C₀ : ⟨α^∨, ν⟩ ≠ 1 for every α^∨ ∈ Φ^{∨,+} and L(ν) is unitary} parametrises the generic spherical unitary representations with real Satake parameter (Ciubotaru–Harris (6.4)); U₀^g ⊆ C_{0,h}. The hyperplanes ⟨α^∨, ν⟩ = 1, α^∨ ∈ Φ^{∨,+}, cut C₀ into m = ∏ᵢ (dᵢ + h)/dᵢ open regions (dᵢ the fundamental degrees of Φ^∨; 105 for F₄, 25 080 for E₈); an alcove is a connected component of the complement of all affine walls ⟨α^∨, ν⟩ ∈ ℤ; U₀^g is a union of open regions intersected with C_{0,h}. Unitarity of L(s_c s_ν) for noncentral s_c is not governed by U₀^g (PAPER-CIUBOTARU-HARRIS-26/E11).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- By spherical-generic-criterion and unramified-principal-series-irreducibility, ν ∈ C₀ gives a generic L(ν) iff ⟨α^∨, ν⟩ ≠ 1 for all positive coroots.
- Unitarity requires hermitian, so U₀^g ⊆ C_{0,h} (spherical-hermitian-criterion).
- The count of regions is the classical count of the Shi-type arrangement in the dominant chamber, quoted by Ciubotaru–Harris.

*Uses.* Ciubotaru–Harris, Theorems 6.9 and 6.14: the set that is classified and intersected with the half-integral lattice. Ciubotaru–Harris, Theorem 8.3: the zero complementary series CS(G(O^∨), 0) of the centraliser group is its U₀^g.

*API.*

- `genericUnitaryRegion` (constructor): U₀^g as a subset of X ⊗ ℝ.
- `genericUnitaryRegion_subset_hermitian` (characterisation): U₀^g ⊆ C_{0,h}.
- `mem_genericUnitaryRegion_iff` (characterisation): ν ∈ U₀^g ↔ ν ∈ C₀ ∧ (∀ α^∨ > 0, ⟨α^∨, ν⟩ ≠ 1) ∧ L(ν) unitarizable ↔ L(ν) generic, unitarizable, with ν dominant.
- `wallRegions_card` (other): The number of open regions of C₀ cut out by the walls ⟨α^∨, ν⟩ = 1 is ∏ᵢ (dᵢ + h)/dᵢ.
- `zero_mem_genericUnitaryRegion` (example): 0 ∈ U₀^g.

**Checks.**

- `genericUnitaryRegion_pgl2` (computation): For G = PGL₂, U₀^g = {c·ω : 0 ≤ c < 1} with ⟨α^∨, ω⟩ = 1.
- `genericUnitaryRegion_zero` (degenerate): 0 ∈ U₀^g: X(0) is unitarily induced and irreducible.
- `rho_not_mem_genericUnitaryRegion` (non-example): ρ ∉ U₀^g although L(ρ) is unitary (trivial): ⟨α^∨, ρ⟩ = 1 for simple coroots, so L(ρ) is not generic.
- `wallRegions_f4` (computation): For F₄ (h = 12, degrees 2, 6, 8, 12) the number of regions is (14·18·20·24)/(2·6·8·12) = 105.

*Acceptance.* For PGL₂, U₀^g = {ν ∈ C₀ : ⟨α^∨, ν⟩ < 1} = A₀, the spherical complementary series; it has the single region below the wall. 0 ∈ U₀^g for every G.

*Needs:* [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); [*spherical-generic-criterion*](#sru-sru-5-spherical-generic-criterion); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion); [*unramified-principal-series-irreducibility*](#sru-sru-5-unramified-principal-series-irreducibility); [*unitary-structure*](#sru-sru-2-unitary-structure).

*Sources:* \[CH26] §6, (6.4)–(6.6) and the paragraph between (6.5) and (6.6), pp. 17–18: U₀^g is the set of dominant ν off the reducibility walls with L(ν) unitary; it lies in the hermitian locus and is a union of the open regions of the wall arrangement, whose number is ∏(dᵢ + h)/dᵢ.

*Planet:* Generic unitary spherical region.

<a id="sru-sru-5-fundamental-alcove-unitary"></a>
#### SRU.5.8 The fundamental alcove is unitary

**The fundamental alcove is unitary** (*fundamental-alcove-unitary*, theorem). In the setting of real-satake-parameter, A₀ ∩ C_{0,h} ⊆ U₀^g: for hermitian dominant ν with ⟨γ^∨, ν⟩ < 1, L(ν) = X(ν) is generic and unitary (Ciubotaru–Harris Lemma 6.7).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- X(0) is unitarily induced and irreducible, hence unitary (SRU.2 unitary-induction, unramified-principal-series-irreducibility).
- On the segment t ↦ tν, t ∈ \[0, 1], every X(tν) is irreducible (⟨α^∨, tν⟩ ≤ ⟨γ^∨, ν⟩ < 1 for positive coroots) and hermitian (w₀ν = −ν), with hermitian forms given by normalised long intertwining operators depending continuously on t.
- The signature of a continuous family of nondegenerate hermitian forms on the K-types is constant (Knapp–Stein's complementary-series argument; the constancy of signature of the operators a_μ(χ) on facets, Barbasch–Ciubotaru §3.2), so X(ν) is unitary.

*Acceptance.* For PGL₂ this is the classical complementary series 0 ≤ ⟨α^∨, ν⟩ < 1. For PGL₃ (w₀ ≠ −1) only the hermitian ν = c(ω₁ + ω₂), 0 ≤ c < ½, of A₀ are covered.

*Needs:* [*generic-unitary-region*](#sru-sru-5-generic-unitary-region); [*unitary-induction*](#sru-sru-2-unitary-induction); [*unramified-principal-series-irreducibility*](#sru-sru-5-unramified-principal-series-irreducibility); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion).

*Sources:* \[CH26] §6, Lemma 6.7 and proof, p. 18: A₀ ∩ C_{0,h} ⊆ U₀^g by deforming from ν = 0 while X(ν) remains irreducible, the closest reducibility wall being ⟨γ^∨, ν⟩ = 1 (citing Knapp–Stein). \[BC1] §3.1–3.2, pp. 16–17: For hermitian χ the positivity of the form is the positive semidefiniteness of the operators a_μ(χ), which have constant signature on each facet of the arrangement.

<a id="sru-sru-5-unbounded-not-unitary"></a>
#### SRU.5.9 Unbounded regions are not unitary

**Unbounded regions are not unitary** (*unbounded-not-unitary*, theorem). In the setting of real-satake-parameter, if ν ∈ C₀ and ⟨αᵢ^∨, ν⟩ > 1 for some simple coroot αᵢ^∨, then ν ∉ U₀^g (Ciubotaru–Harris Lemma 6.8).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- Use signature constancy on the hermitian components of the complement of root-value-one hyperplanes. In the affine/graded Hecke algebra the normalised long intertwiner on the reflection W-type is indefinite on every unbounded region; see BCP §5.2, Lemma (2) and its following argument, p. 53.
- In the dominant region with ⟨αᵢ^∨,ν⟩>1, move out along the fundamental-weight ray without crossing any root-value-one wall (all positive-coroot pairings are nondecreasing). In the hermitian locus use a ray invariant under −w₀, or its paired fundamental-weight ray. This places ν in an unbounded component, so it is not unitary. This is a signature argument, not a consequence of a single simple-root value forcing failure of coefficient decay.
- The reflection-type signature calculation is a nonroutine classification input, included in the Hecke-signature gap below. BCP is stated for characteristic-zero groups; using it over function fields requires the characteristic-independent equal-parameter Hecke-algebra statement that CH26 uses.

*Acceptance.* For PGL₂, ν with ⟨α^∨, ν⟩ > 1 gives X(ν) irreducible but not unitary: its spherical function grows or fails to decay.

*Needs:* [*generic-unitary-region*](#sru-sru-5-generic-unitary-region); [*howe-moore*](#sru-sru-4-howe-moore); `SmoothRepresentationsOfLocalGroups:SR.2/principal-series-jacquet`; `SmoothRepresentationsOfLocalGroups:SR.2/casselman-pairing`; [*unramified-principal-series-irreducibility*](#sru-sru-5-unramified-principal-series-irreducibility).

*Sources:* \[CH26] §6, Lemma 6.8, p. 18: No unbounded region is unitary: ⟨αᵢ^∨, ν⟩ > 1 for a simple coroot excludes ν from U₀^g, citing Howe–Moore and Barbasch–Ciubotaru's spherical unitary principal series §3.3. \[BCP] §5.2, Lemma (2) and following explanation, p. 53: Only bounded regions contribute to the zero complementary series; the reflection W-type detects failure of positivity in unbounded regions.

<a id="sru-sru-5-barbasch-moy-unitarity"></a>
#### SRU.5.10 Barbasch–Moy: unitarity through the Iwahori–Hecke algebra

**Barbasch–Moy: unitarity through the Iwahori–Hecke algebra** (*barbasch-moy-unitarity*, theorem). Let G be split over a nonarchimedean local field (characteristic zero is assumed by Barbasch–Moy and Barbasch–Ciubotaru; Ciubotaru–Harris §7 note the assumption is unnecessary for the Hecke-algebraic statements) and I an Iwahori subgroup. An irreducible representation π with π^I ≠ 0 is unitarizable iff the simple H(G, I)-module π^I is unitary for the \*-structure f\*(g) = conj f(g⁻¹) (Barbasch–Moy 1989); the Iwahori–Matsumoto involution preserves hermitian and unitary modules and exchanges spherical and generic ones; and the problem reduces to the graded affine Hecke algebra of the centraliser of s_c at the real infinitesimal character ν (Barbasch–Moy 1993).

*Hypotheses.* G split; π irreducible Iwahori-spherical.

*Proof route.*

- The Borel–Casselman equivalence V ↦ V^I (SR.3.4 borel-casselman-block) matches invariant hermitian forms on V with H(G, I)-invariant forms on V^I, the \*-operation being adjoint for unitary structures (positive-definiteness on V reduces to V^I by e_I-averaging over K-types: Barbasch–Moy 1989).
- The Iwahori–Matsumoto involution of H(G, I) (SR.1 iwahori-matsumoto) is a \*-automorphism up to the sign twist, hence preserves unitarity; on the trivial character it gives the sign character.
- The reduction to real infinitesimal character and to the graded algebra of Z_{G^∨}(s_c) is Lusztig's reduction made \*-compatible by Barbasch–Moy; it is cited.

*Acceptance.* The trivial and Steinberg representations correspond under the Iwahori–Matsumoto involution; both are unitary. For non-real s_c the unitarity of L(s_c s_ν) is decided in the graded Hecke algebra of Z_{G^∨}(s_c), not of G^∨ (the source of PAPER-CIUBOTARU-HARRIS-26/E11).

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block`; `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`; `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation`; [*unitary-structure*](#sru-sru-2-unitary-structure).

*Sources:* \[BC1] §1.1–1.2, pp. 1–2: The Iwahori–Matsumoto involution takes hermitian modules to hermitian ones and unitary to unitary, exchanging spherical and generic modules; by \[BM1] the Iwahori-spherical unitary dual is equivalent to that of the Iwahori–Hecke algebra; by \[BM2] it reduces to graded Hecke algebras of possibly smaller groups at real infinitesimal character. \[CitedOnly] D. Barbasch and A. Moy, A unitarity criterion for p-adic groups, Invent. Math. 98 (1989); Reduction to real infinitesimal character in affine Hecke algebras, J. Amer. Math. Soc. 6 (1993) (not read): The cited sources.

<a id="sru-sru-5-generic-unitary-classification"></a>
#### SRU.5.11 Classification of the generic unitary spherical dual

**Classification of the generic unitary spherical dual** (*generic-unitary-classification*, theorem). In the setting of real-satake-parameter, U₀^g is the intersection of C_{0,h} with a union of 2^d alcoves of C₀ including A₀, where d = 0 for PGL(n) and SO(2n+1), ⌊(n−1)/2⌋ for PSp(2n), n − 1 for PSO(4n) (n ≥ 2) and PSO(4n+2) (n ≥ 1), 1 for G₂, F₄, E₆, 3 for E₇ and 4 for E₈ (Ciubotaru–Harris Theorem 6.9, with the hermitian locus C_{0,h} in place of the printed C₀, PAPER-CIUBOTARU-HARRIS-26/E8). Explicitly (Barbasch–Ciubotaru §3.2–3.4): type A: ν = (ν₁, …, ν\_k, (0,) −ν\_k, …, −ν₁) with 0 ≤ ν₁ ≤ ⋯ ≤ ν\_k < ½; type C: 0 ≤ ν₁ ≤ ⋯ ≤ νₙ < ½; types B, D: the alternating conditions of Barbasch–Ciubotaru Theorem 3.3; G₂: {3ν₁ + 2ν₂ < 1} ∪ {2ν₁ + ν₂ < 1 < 3ν₁ + ν₂}; F₄: {2ν₁ < 1} ∪ {ν₁ + ν₂ + ν₃ − ν₄ < 1 < ν₁ + ν₂ + ν₃ + ν₄}; E₆, E₇, E₈: the 2, 8 and 16 alcoves of Barbasch–Ciubotaru §7.2. The type-A case is part of Tadić's classification of the unitary dual of GL(n), owned upstream by AutomorphicSpectralTheory §7.0b.

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- By barbasch-moy-unitarity the question is the unitarity of spherical modules of the graded Hecke algebra at real parameter ν.
- The signature of the long intertwining operators on each W-type is constant on facets (fundamental-alcove-unitary, step 3); U₀^g is a union of regions, determined by checking finitely many W-types per region.
- The case analysis is Barbasch (classical types), Ciubotaru (F₄, E₆) and Barbasch–Ciubotaru (E₇, E₈, and G₂, F₄ in their coordinates), and Tadić for GL(n); it is cited, and its decomposition into W-type signature computations is a remaining refinement of this layer.

*Acceptance.* For PGL₂, d = 0 and U₀^g = A₀. For G₂, d = 1: U₀^g has the fundamental alcove {3ν₁ + 2ν₂ < 1} and the second alcove {2ν₁ + ν₂ < 1 < 3ν₁ + ν₂} in Barbasch–Ciubotaru's coordinates.

*Needs:* [*barbasch-moy-unitarity*](#sru-sru-5-barbasch-moy-unitarity); [*generic-unitary-region*](#sru-sru-5-generic-unitary-region); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary); [*unbounded-not-unitary*](#sru-sru-5-unbounded-not-unitary).

*Sources:* \[CH26] §6, Theorem 6.9, p. 18: For quasi-simple split adjoint G, U₀^g is the hermitian locus intersected with a union of 2^d alcoves including A₀, with d listed by type; the classification is cited from \[Ba, Ci1, Ci2, BC1] (the printed 'C₀' should be the hermitian locus, PAPER-CIUBOTARU-HARRIS-26/E8). \[BC1] §3.2 Theorem, §3.3 Theorem, §3.4 Proposition, pp. 17–18: The 0-complementary series is listed type by type: the classical types after \[BM3], \[Ba1], G₂ and F₄ after \[Ci1], and the 2, 8, 16 alcoves for E₆, E₇, E₈.

*Planet:* Generic unitary spherical dual.

<a id="sru-sru-5-integral-root-wall"></a>
#### SRU.5.12 Nonzero integral root values are not unitary

**Nonzero integral root values are not unitary** (*integral-root-wall*, theorem). In the setting of real-satake-parameter, if ν ∈ C₀ and ⟨α^∨, ν⟩ ∈ ℤ\_{>0} for some positive coroot α^∨, then ν ∉ U₀^g (Ciubotaru–Harris Proposition 6.10). Equivalently, for a real or central-compact s with α^∨(s) = q^m, m ∈ ℤ ∖ {0}, the generic L(s) is not unitary (Corollary 6.32(2), in that sector; sourceIssues E3).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). ν real (s_c = 1 or central).

*Proof route.*

- A point with ⟨α^∨, ν⟩ = m ∈ ℤ\_{>0} lies on an affine wall, hence in no open alcove; by generic-unitary-classification U₀^g is contained in a union of open alcoves intersected with C_{0,h}.

*Acceptance.* For PGL₂, ν with ⟨α^∨, ν⟩ = 2 gives an irreducible non-unitary X(ν).

*Needs:* [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).

*Sources:* \[CH26] §6.1, Proposition 6.10 and proof, p. 18; Corollary 6.32(2) and proof, p. 25: A dominant ν with a positive integral coroot value lies in no alcove and so is not in U₀^g; Corollary 6.32(2) is deduced from it.

<a id="sru-sru-5-half-integral-reduction"></a>
#### SRU.5.13 Reduction of half-integral parameters

**Reduction of half-integral parameters** (*half-integral-reduction*, theorem). In the setting of real-satake-parameter, with 0 ≤ ε < ½: C₀^{½+ε} = ∅ unless ε ∈ {0, ¼}, and if G is quasi-simple of rank ≥ 2 then C₀^{½+ε} = ∅ unless ε = 0 ((6.12)). For ν = Σ νᵢωᵢ ∈ C₀^{½}, every νᵢ ∈ ½ℤ\_{≥0}, and if moreover ν ∈ U₀^g then every νᵢ ∈ {0, ½} ((6.13)).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- Applying the condition to α^∨ and −α^∨ gives 2ε ∈ ½ℤ, so ε ∈ {0, ¼}.
- In rank ≥ 2 take simple coroots α₁^∨, α₂^∨ with β^∨ = α₁^∨ + α₂^∨ a coroot: ⟨β^∨, ν⟩ ∈ 2ε + ½ℤ and ∈ ε + ½ℤ force ε ∈ ½ℤ, so ε = 0.
- νᵢ = ⟨αᵢ^∨, ν⟩ ∈ ½ℤ\_{≥0}; by unbounded-not-unitary νᵢ ≤ 1, and νᵢ = 1 is excluded by genericity (wall ⟨αᵢ^∨, ν⟩ = 1), leaving {0, ½}.

*Acceptance.* For PGL₂ (rank one) ε = ¼ is possible: ⟨α^∨, ν⟩ = ¼ gives ⟨±α^∨, ν⟩ ∈ ¼ + ½ℤ; Ciubotaru–Harris use only ε = 0 there.

*Needs:* [*half-integral-parameter*](#sru-sru-5-half-integral-parameter); [*unbounded-not-unitary*](#sru-sru-5-unbounded-not-unitary); [*generic-unitary-region*](#sru-sru-5-generic-unitary-region).

*Sources:* \[CH26] §6.2, (6.11)–(6.13), p. 19: ε must be 0 or ¼, and 0 in rank at least two using a sum of two simple coroots; half-integral dominant ν have νᵢ ∈ ½ℤ\_{≥0}, and Lemma 6.8 cuts this to νᵢ ∈ {0, ½} for generic unitary ν.

*Lean:* `halfIntegral_shift_eq`

<a id="sru-sru-5-half-integral-type-a"></a>
#### SRU.5.14 Half-integral generic unitary points for PGL(n)

**Half-integral generic unitary points for PGL(n)** (*half-integral-type-a*, theorem). For G = PGL(n) in the setting of real-satake-parameter, write a dominant hermitian ν in standard coordinates as (a₁, …, a_k, −a_k, …, −a₁) for n = 2k and (a₁, …, a_k, 0, −a_k, …, −a₁) for n = 2k + 1, with a₁ ≥ ⋯ ≥ a_k ≥ 0; the generic unitary region is 0 ≤ a_k ≤ ⋯ ≤ a₁ < ½ ((6.15), Tadić). Then U₀^{g,½} = {0, ½ω\_k} for n = 2k (the point a₁ = ⋯ = a_k = ¼) and U₀^{g,½} = {0} for n odd (Ciubotaru–Harris §6.3).

*Hypotheses.* G = PGL(n), n ≥ 2; standard coordinates of Ciubotaru–Harris §6.3.

*Proof route.*

- For n = 2k, ν is half-integral for the adjoint representation iff a_k ∈ ¼ℤ and the consecutive differences νᵢ − νᵢ₊₁ lie in ½ℤ; inside (6.15) this leaves a₁ = ⋯ = a_k ∈ {0, ¼}, i.e. ν ∈ {0, ½ω\_k}, and ½ω\_k satisfies (6.15).
- For n odd, half-integrality forces every aᵢ ∈ ½ℤ, and (6.15) leaves only aᵢ = 0.

*Acceptance.* For PGL₂ (k = 1), U₀^{g,½} = {0, ½ω₁}, the complementary-series point with ⟨α^∨, ν⟩ = ½. For PGL₃, U₀^{g,½} = {0}.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion).

*Sources:* \[CH26] §6.3, (6.15), p. 20: In standard coordinates the unitary condition is 0 ≤ a_k ≤ ⋯ ≤ a₁ < ½ (citing Tadić); for n even the only nonzero half-integral point is ½ω\_k with all aᵢ = ¼, and for n odd there is none.

<a id="sru-sru-5-half-integral-type-b"></a>
#### SRU.5.15 Half-integral generic unitary points for SO(2n+1)

**Half-integral generic unitary points for SO(2n+1)** (*half-integral-type-b*, theorem). For G = SO(2n+1), with coroots α₁^∨ = 2ε₁, αᵢ^∨ = −εᵢ₋₁ + εᵢ (2 ≤ i ≤ n), weights ω₁ = ½(ε₁ + ⋯ + εₙ), ωᵢ = εᵢ + ⋯ + εₙ and highest coroot γ^∨ = 2εₙ (Ciubotaru–Harris §6.4): the only coroot of the maximal level r₀ = 2n − 1 is γ^∨ (Barbasch, Theorem 3.1), the unitary bound reads ν₁ + 2ν₂ + ⋯ + 2νₙ < 1, and U₀^{g,½} = {0, ½ω₁}; ⟨γ^∨, ½ω₁⟩ = ½, so ½ω₁ lies in A₀.

*Hypotheses.* G = SO(2n+1); coordinates of Ciubotaru–Harris §6.4.

*Proof route.*

- By generic-unitary-classification every ν ∈ U₀^g has ⟨γ^∨, ν⟩ < 1, i.e. ν₁ + 2ν₂ + ⋯ + 2νₙ < 1.
- With νᵢ ∈ {0, ½} (half-integral-reduction) this forces ν₂ = ⋯ = νₙ = 0, leaving 0 and ½ω₁, and ½ω₁ ∈ A₀ is unitary (fundamental-alcove-unitary).

*Acceptance.* For SO(3) ≅ PGL₂ (n = 1), the result agrees with half-integral-type-a: {0, ½ω₁}.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary).

*Sources:* \[CH26] §6.4, p. 20: For SO(2n+1) the level bound from Barbasch's Theorem 3.1 is ν₁ + 2ν₂ + ⋯ + 2νₙ < 1, leaving 0 and ½ω₁, which lies in the fundamental alcove.

<a id="sru-sru-5-half-integral-type-c"></a>
#### SRU.5.16 Half-integral generic unitary points for PSp(2n)

**Half-integral generic unitary points for PSp(2n)** (*half-integral-type-c*, theorem). For n ≥ 2, for G = PSp(2n), with coroots α₁^∨ = ε₁, αᵢ^∨ = −εᵢ₋₁ + εᵢ, weights ωᵢ = εᵢ + ⋯ + εₙ and highest coroot γ^∨ = εₙ₋₁ + εₙ (Ciubotaru–Harris §6.5): the maximal level is r₀ = n for n odd and n + 1 for n even, with the coroots (6.16), (6.17); the resulting bounds force ν₁ = ⋯ = ν\_{⌊n/2⌋} = 0 and Σ\_{j > ⌊n/2⌋} νⱼ < 1, leaving ½ωⱼ for j > ⌊n/2⌋, of which ½ωⱼ (j < n) lie on the wall ⟨γ^∨, ν⟩ = 1. Hence U₀^{g,½} = {0, ½ωₙ}, with ⟨γ^∨, ½ωₙ⟩ = ½.

*Hypotheses.* G = PSp(2n); coordinates of Ciubotaru–Harris §6.5. n ≥ 2 for the displayed ε\_{n−1}+ε\_n formula; the rank-one case PSp₂ = PGL₂ is handled by half-integral-type-a.

*Proof route.*

- The coroots of level r₀ give the inequalities 2ν₁ + ν₂ + ⋯ < 1, …, displayed in §6.5 for n odd and even (generic-unitary-classification, after Barbasch Theorem 3.1).
- With νᵢ ∈ {0, ½} (half-integral-reduction) they force ν₁ = ⋯ = ν\_{⌊n/2⌋} = 0 and at most one νⱼ = ½ with j > ⌊n/2⌋.
- For ⌊n/2⌋ < j < n, ⟨γ^∨, ½ωⱼ⟩ = 1, so ½ωⱼ is not generic; ½ωₙ ∈ A₀ is unitary (fundamental-alcove-unitary).

*Acceptance.* For PSp(2) ≅ PGL₂, {0, ½ω₁} as in type A. For PSp(4), the candidates ½ω₁ (excluded by ν₁ = 0) and ½ω₂ leave U₀^{g,½} = {0, ½ω₂}. For n=1 use PSp₂=PGL₂ and type A₁; do not interpret ε₀ in the rank ≥2 formula.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary); [*generic-unitary-region*](#sru-sru-5-generic-unitary-region).

*Sources:* \[CH26] §6.5, (6.16)–(6.17), pp. 20–21: For PSp(2n) the coroots of maximal level force the first ⌊n/2⌋ coordinates to vanish; of the remaining points ½ωⱼ only ½ωₙ avoids the wall γ^∨ = 1 and lies in the fundamental alcove.

<a id="sru-sru-5-half-integral-type-d"></a>
#### SRU.5.17 Half-integral generic unitary points for PSO(2n)

**Half-integral generic unitary points for PSO(2n)** (*half-integral-type-d*, theorem). For G = PSO(2n), with coroots α₁^∨ = ε₁ + ε₂, αᵢ^∨ = −εᵢ₋₁ + εᵢ, weights ω₁ = ½(ε₁ + ⋯ + εₙ), ω₂ = ½(−ε₁ + ε₂ + ⋯ + εₙ), ωᵢ = εᵢ + ⋯ + εₙ (i ≥ 3) and highest coroot γ^∨ = εₙ₋₁ + εₙ (Ciubotaru–Harris §6.6): for n even the maximal level is r₀ = n − 1 with the coroots (6.18), and U₀^{g,½} = {0, ½ω₁, ½ω₂, ½ωₙ}; for n odd hermitian parameters need ν₁ = ν₂, which excludes ½ω₁ and ½ω₂, and U₀^{g,½} = {0, ½ωₙ}. All listed nonzero points pair with γ^∨ to ½ and lie in A₀.

*Hypotheses.* G = PSO(2n), n ≥ 3; coordinates of Ciubotaru–Harris §6.6.

*Proof route.*

- For n even the level-r₀ coroots (6.18) force ν₃ = ⋯ = ν\_{n/2} = 0 and at most one of ν₁, ν₂, νⱼ (j > n/2) equal to ½ (generic-unitary-classification, half-integral-reduction).
- The points ½ωⱼ with n/2 < j < n lie on the wall ⟨γ^∨, ν⟩ = 1; ½ω₁, ½ω₂, ½ωₙ pair with γ^∨ to ½ and lie in A₀, hence are unitary.
- For n odd, w₀ν = −ν forces ν₁ = ν₂ (spherical-hermitian-criterion), excluding ½ω₁ and ½ω₂.

*Acceptance.* For PSO(8) (n = 4) the three nonzero points ½ω₁, ½ω₂, ½ω₄ are permuted by triality. For PSO(6) ≅ PGL₄ (n = 3), {0, ½ω₃} matches half-integral-type-a with k = 2 under the isomorphism.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion).

*Sources:* \[CH26] §6.6, (6.18), pp. 21–22: For PSO(2n), n even, the remaining nonzero points are ½ω₁, ½ω₂ and ½ωₙ in the fundamental alcove; for n odd ½ω₁ and ½ω₂ are not hermitian.

<a id="sru-sru-5-half-integral-type-g2"></a>
#### SRU.5.18 Half-integral generic unitary points for G₂

**Half-integral generic unitary points for G₂** (*half-integral-type-g2*, theorem). For G = G₂ in Bourbaki coordinates (6.19), the unique coroot of the maximal level r₀ = 3 is β^∨ = 2α₁^∨ + α₂^∨, giving the unitary bound 2ν₁ + ν₂ < 1 ((6.20)); hence ν₁ = 0, ν₂ ∈ {0, ½}, and ½ω₂ lies on the wall ⟨γ^∨, ν⟩ = 1 for the highest coroot γ^∨ = 3α₁^∨ + 2α₂^∨. So U₀^{g,½} = {0} (Ciubotaru–Harris §6.7).

*Hypotheses.* G = G₂; coordinates (6.19).

*Proof route.*

- The level bound is from Ciubotaru's classification (generic-unitary-classification, Ciubotaru F₄ paper Appendix B as cited).
- 2ν₁ < 1 with ν₁ ∈ ½ℤ gives ν₁ = 0; ν₂ < 1 gives ν₂ ∈ {0, ½}; ⟨3α₁^∨ + 2α₂^∨, ½ω₂⟩ = 1.

*Acceptance.* ½ω₂ is the real part of the G₂ witness of g2-noncentral-witness, which is not generic for s_c = 1.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).

*Sources:* \[CH26] §6.7, (6.19)–(6.20), p. 22: In Bourbaki coordinates the only level-3 coroot gives 2ν₁ + ν₂ < 1; the remaining candidate ½ω₂ lies on the highest-coroot wall.

<a id="sru-sru-5-half-integral-type-f4"></a>
#### SRU.5.19 Half-integral generic unitary points for F₄

**Half-integral generic unitary points for F₄** (*half-integral-type-f4*, theorem). For G = F₄ in the coordinates (6.21), the unique coroot of the maximal level r₀ = 9 is β^∨ = (1, 1, 1, −1) = α₁^∨ + 2α₂^∨ + 4α₃^∨ + 2α₄^∨, giving ν₁ + 2ν₂ + 4ν₃ + 2ν₄ < 1 ((6.22)); hence ν₂ = ν₃ = ν₄ = 0, ν₁ ∈ {0, ½}, and ½ω₁ lies on the wall of the highest coroot γ^∨ = (2, 0, 0, 0). So U₀^{g,½} = {0} (Ciubotaru–Harris §6.8).

*Hypotheses.* G = F₄; coordinates (6.21).

*Proof route.*

- The level bound comes from Ciubotaru's F₄ table (generic-unitary-classification).
- The inequality with νᵢ ∈ ½ℤ\_{≥0} leaves ν = 0 or ½ω₁, and ⟨γ^∨, ½ω₁⟩ = 1.

*Acceptance.* In the coordinates (6.21), ⟨(2,0,0,0), ½ω₁⟩ = ⟨(2,0,0,0), (½,0,0,0)⟩ = 1.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).

*Sources:* \[CH26] §6.8, (6.21)–(6.22), p. 22: For F₄ the only level-9 coroot gives ν₁ + 2ν₂ + 4ν₃ + 2ν₄ < 1, leaving ½ω₁, which lies on the highest-coroot wall.

<a id="sru-sru-5-half-integral-type-e6"></a>
#### SRU.5.20 Half-integral generic unitary points for E₆

**Half-integral generic unitary points for E₆** (*half-integral-type-e6*, theorem). For G = E₆ in the coordinates (6.28), hermitian parameters satisfy ν₁ = ν₆ and ν₃ = ν₅; the unique coroot of the maximal level r₀ = 9 is β^∨ = α₁^∨ + α₂^∨ + 2α₃^∨ + 2α₄^∨ + 2α₅^∨ + α₆^∨ ((6.29)), giving 2ν₃ < 1, 2ν₄ < 1, 2ν₅ < 1 and ν₁ + ν₂ + ν₆ < 1; hence the only nonzero candidate is ½ω₂, which lies on the wall of the highest coroot. So U₀^{g,½} = {0} (Ciubotaru–Harris §6.11).

*Hypotheses.* G = E₆; coordinates (6.28).

*Proof route.*

- The level bound is from Ciubotaru's E₆ paper and Barbasch–Ciubotaru §7.2.1 (generic-unitary-classification).
- ν₃ = ν₄ = ν₅ = 0; ν₁ = ν₆ with ν₁ + ν₂ + ν₆ < 1 forces ν₁ = ν₆ = 0; ½ω₂ pairs to 1 with γ^∨.

*Acceptance.* The hermitian condition is needed: ½ω₁ alone satisfies the level bound but is not hermitian for E₆ (w₀ ≠ −1).

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion).

*Sources:* \[CH26] §6.11, (6.28)–(6.29), p. 24: For E₆, hermitian parameters have ν₁ = ν₆, ν₃ = ν₅; the level-9 coroot leaves only ½ω₂, which lies on the highest-coroot wall.

<a id="sru-sru-5-half-integral-type-e7"></a>
#### SRU.5.21 Half-integral generic unitary points for E₇

**Half-integral generic unitary points for E₇** (*half-integral-type-e7*, theorem). For G = E₇ in the coordinates (6.26), the coroots of the maximal level r₀ = 9 are the four listed in (6.27) (labels 46–49 of Barbasch–Ciubotaru), giving 2ν₃, 2ν₄, 2ν₅, 2ν₆ < 1 and ν₁ + ν₂ + ν₇ < 1; the candidates ½ω₁, ½ω₂ lie on the wall of the highest coroot γ^∨ = −ε₇ + ε₈, while ⟨γ^∨, ½ω₇⟩ = ½. So U₀^{g,½} = {0, ½ω₇} (Ciubotaru–Harris §6.10).

*Hypotheses.* G = E₇; coordinates (6.26).

*Proof route.*

- The level bound is from Barbasch–Ciubotaru §7.2.2 (generic-unitary-classification).
- The inequalities leave ν₃ = ⋯ = ν₆ = 0 and at most one of ν₁, ν₂, ν₇ equal to ½.
- ½ω₁, ½ω₂ are on the wall γ^∨ = 1; ½ω₇ is in A₀, hence unitary (fundamental-alcove-unitary).

*Acceptance.* ½ω₇ is the extra E₇ point that fundamental-separators removes using the 56-dimensional representation (pairing ¾).

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary).

*Sources:* \[CH26] §6.10, (6.26)–(6.27), pp. 23–24: For E₇ the four level-9 coroots leave 0, ½ω₁, ½ω₂ and ½ω₇; the middle two lie on the highest-coroot wall and ½ω₇ lies in the fundamental alcove.

<a id="sru-sru-5-half-integral-type-e8"></a>
#### SRU.5.22 Half-integral generic unitary points for E₈

**Half-integral generic unitary points for E₈** (*half-integral-type-e8*, theorem). For G = E₈ in the coordinates (6.23)–(6.24), the coroots of the maximal level r₀ = 15 are the four listed in (6.25) (labels 89–92 of Barbasch–Ciubotaru), giving 2ν₂, 2ν₃, 4ν₄, 3ν₅, 2ν₆, 2ν₇ < 1 and ν₁ + ν₈ < 1; the candidates ½ω₁ and ½ω₈ lie on the wall of the highest coroot γ^∨ = ε₇ + ε₈. So U₀^{g,½} = {0} (Ciubotaru–Harris §6.9).

*Hypotheses.* G = E₈; coordinates (6.23)–(6.24).

*Proof route.*

- The level bound is from Barbasch–Ciubotaru §7.2.3 (generic-unitary-classification).
- The inequalities leave ν₂ = ⋯ = ν₇ = 0 and ν₁, ν₈ ∈ {0, ½}, not both ½.
- ⟨γ^∨, ½ω₁⟩ = ⟨γ^∨, ½ω₈⟩ = 1.

*Acceptance.* In (6.24), ω₈ = ε₇ + ε₈, so ⟨ε₇ + ε₈, ½ω₈⟩ = 1.

*Needs:* [*half-integral-reduction*](#sru-sru-5-half-integral-reduction); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).

*Sources:* \[CH26] §6.9, (6.23)–(6.25), pp. 22–23: For E₈ the four level-15 coroots leave 0, ½ω₁ and ½ω₈, and the last two lie on the highest-coroot wall.

<a id="sru-sru-5-half-integral-generic-unitary"></a>
#### SRU.5.23 Half-integral generic unitary spherical parameters

**Half-integral generic unitary spherical parameters** (*half-integral-generic-unitary*, theorem). In the setting of real-satake-parameter, U₀^{g,½} := U₀^g ∩ C₀^{½} is {0, ½ω\_{n/2}} for PGL(n), n even, and {0} for n odd; {0, ½ω₁} for SO(2n+1); {0, ½ωₙ} for PSp(2n); {0, ½ω₁, ½ω₂, ½ωₙ} for PSO(2n), n even, and {0, ½ωₙ} for n odd; {0, ½ω₇} for E₇; {0} for G₂, F₄, E₆, E₈ (Ciubotaru–Harris Theorem 6.14, numbering of §§6.3–6.11); every nonzero element lies in the fundamental alcove A₀, and U₀^{g,½} = {0} unless G is of type A_{n−1} (n even), B, C, D or E₇.

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting).

*Proof route.*

- Assemble the nine type-by-type computations; the common strategy (Ciubotaru–Harris, proof of Theorem 6.14) is: the classification gives a maximal level r₀ ≥ 1 with ⟨α^∨, ν⟩ < 1 for all coroots of that level; the half-integral points satisfying these inequalities either lie on a reducibility wall (not generic) or are among the listed exceptions, all of which lie in A₀.

*Acceptance.* For G₂, a generic unitary spherical L(ν) with real ν half-integral for the adjoint representation is tempered.

*Needs:* [*half-integral-type-a*](#sru-sru-5-half-integral-type-a); [*half-integral-type-b*](#sru-sru-5-half-integral-type-b); [*half-integral-type-c*](#sru-sru-5-half-integral-type-c); [*half-integral-type-d*](#sru-sru-5-half-integral-type-d); [*half-integral-type-g2*](#sru-sru-5-half-integral-type-g2); [*half-integral-type-f4*](#sru-sru-5-half-integral-type-f4); [*half-integral-type-e6*](#sru-sru-5-half-integral-type-e6); [*half-integral-type-e7*](#sru-sru-5-half-integral-type-e7); [*half-integral-type-e8*](#sru-sru-5-half-integral-type-e8).

*Sources:* \[CH26] §6.2, Theorem 6.14, p. 19: The complete list of half-integral generic unitary real parameters of quasi-simple split adjoint groups.

*Planet:* Half-integral generic unitary points.

<a id="sru-sru-5-half-integrality-highest-weight"></a>
#### SRU.5.24 Half-integrality is tested on the highest weight

**Half-integrality is tested on the highest weight** (*half-integrality-highest-weight*, theorem). In the setting of half-integral-parameter, for ν ∈ C₀^{½} and V = V(λ^∨) irreducible of highest weight λ^∨, ν is half-integral for V iff ⟨λ^∨, ν⟩ ∈ ½ℤ (Ciubotaru–Harris Lemma 6.30).

*Hypotheses.* ν ∈ C₀^{½}.

*Proof route.*

- Every weight is λ^∨ − Σ aᵢ αᵢ^∨ with aᵢ ∈ ℤ\_{≥0}, and ⟨αᵢ^∨, ν⟩ ∈ ½ℤ.

*Acceptance.* For G = PGL₂ and ν = ½ω₁ (⟨α^∨, ν⟩ = ½, so ν ∈ C₀^{½}), the highest weight ω₁^∨ = α^∨/2 of the standard representation of SL₂(ℂ) pairs to ¼ ∉ ½ℤ, so ν is not half-integral for it.

*Needs:* [*half-integral-parameter*](#sru-sru-5-half-integral-parameter); TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles).

*Sources:* \[CH26] §6.12, Lemma 6.30 and proof, p. 24: For ν in C₀^{½}, half-integrality for V(λ^∨) is equivalent to ⟨λ^∨, ν⟩ ∈ ½ℤ, since weights differ from λ^∨ by integral combinations of simple roots.

<a id="sru-sru-5-fundamental-separators"></a>
#### SRU.5.25 Fundamental representations separate the extra half-integral points

**Fundamental representations separate the extra half-integral points** (*fundamental-separators*, theorem). In the setting of half-integral-generic-unitary: ½ω\_{n/2} is not half-integral for the defining representation V(ω₁^∨) of SL(n) (n even); ½ω₁ is not half-integral for the defining representation V(ωₙ^∨) of Sp(2n) (G = SO(2n+1)); ½ωₙ is not half-integral for the spin representation V(ω₁^∨) of Spin(2n+1) (G = PSp(2n)); for G = PSO(2n), ½ωₙ is not half-integral for the spin representation V(ω₁^∨) and ½ω₁, ½ω₂ are not for the defining representation V(ωₙ^∨); and ½ω₇ is not half-integral for the 56-dimensional V(ω₇^∨) of E₇ (Ciubotaru–Harris Proposition 6.31). The pairings are ¼ in the classical cases and ¾ for E₇. For type D both the spin and the defining representation are needed.

*Hypotheses.* Numbering of Ciubotaru–Harris §§6.3–6.11.

*Proof route.*

- By half-integrality-highest-weight it suffices to compute ⟨λ^∨, ν⟩ for the listed highest weights, which are ¼ (classical) and ¾ (E₇).

*Acceptance.* For PGL₂ (n = 2), ⟨ω₁^∨, ½ω₁⟩ = ¼ for the standard representation of SL₂(ℂ).

*Needs:* [*half-integrality-highest-weight*](#sru-sru-5-half-integrality-highest-weight); [*half-integral-generic-unitary*](#sru-sru-5-half-integral-generic-unitary); TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles).

*Sources:* \[CH26] §6.12, Proposition 6.31 and proof, pp. 24–25: The extra points of Theorem 6.14 pair with the listed fundamental highest weights to ¼, or ¾ for E₇, and so are not half-integral for those representations.

<a id="sru-sru-5-generic-temperedness-test"></a>
#### SRU.5.26 The local generic temperedness test

**The local generic temperedness test** (*generic-temperedness-test*, theorem). In the setting of real-satake-parameter, let s = s_c·s_ν with s_c = 1 or s_c central in G^∨ (the real or central-compact sector). If L(s) is generic and unitary, then s is geometric for the adjoint representation of G^∨ and for the fundamental representations of fundamental-separators iff ν = 0, i.e. iff L(s) = L(s_c) is tempered (Ciubotaru–Harris Corollary 6.32(1), corrected scope). As printed, for arbitrary s_c, the statement is false: see g2-noncentral-witness (PAPER-CIUBOTARU-HARRIS-26/E11).

*Hypotheses.* k a nonarchimedean local field of any characteristic with residue field 𝔽\_q, G = 𝐆(k) for 𝐆 quasi-simple, split and adjoint, K = 𝐆(O) hyperspecial, B ⊃ T a Borel subgroup and maximal split torus, based root datum (X, Φ, X^∨, Φ^∨, Π), Weyl group W, longest element w₀, Coxeter number h, dual group G^∨ over ℂ with maximal torus T^∨ = X ⊗ ℂ^× (Ciubotaru–Harris §6 setting). s = s_c·s_ν with s_c = 1 or s_c central in G^∨ (the real or central-compact sector).

*Proof route.*

- For central s_c, X(s_c s_ν) is the twist of X(s_ν) by the unitary character of G corresponding to s_c, so L(s) is generic unitary iff L(ν) is; WLOG ν dominant, so ν ∈ U₀^g.
- Geometric for the adjoint representation means ν ∈ C₀^{½}, so ν ∈ U₀^{g,½} (half-integral-generic-unitary).
- Every nonzero point of U₀^{g,½} fails half-integrality for a listed fundamental representation (fundamental-separators); hence ν = 0, and L(s) is tempered (spherical-tempered-criterion). The converse is immediate.

*Acceptance.* For G = PGL₂ and s real with ν = ½ω₁ (a complementary-series point), the standard representation of SL₂(ℂ) detects non-geometricity. The G₂ witness of g2-noncentral-witness lies outside the hypothesis (its s_c is not central).

*Needs:* [*half-integral-generic-unitary*](#sru-sru-5-half-integral-generic-unitary); [*fundamental-separators*](#sru-sru-5-fundamental-separators); [*spherical-tempered-criterion*](#sru-sru-5-spherical-tempered-criterion); [*generic-unitary-region*](#sru-sru-5-generic-unitary-region).

*Sources:* \[CH26] §6.12, Corollary 6.32(1) and proof, p. 25: If the spherical L(s) is generic and unitary, geometricity for the adjoint and the listed fundamental representations holds iff ν = 0; the proof passes through ν ∈ U₀^g, valid only for real or central-compact s (PAPER-CIUBOTARU-HARRIS-26/E11).

*Planet:* Generic temperedness test.

<a id="sru-sru-5-g2-noncentral-witness"></a>
#### SRU.5.27 The G₂ witness for noncentral compact parts

**The G₂ witness for noncentral compact parts** (*g2-noncentral-witness*, theorem). Let G be split G₂ over k and s_c ∈ T^∨ the involution with (aα₁^∨ + bα₂^∨)(s_c) = (−1)^a (α₁^∨ the short simple coroot); its centraliser in G^∨ has type A₁ × Ã₁. For ν = ½ω₂ and s = s_c s_ν, X(s) is irreducible, L(s) = X(s) is generic and unitary, s is geometric for every representation of G^∨, and ν ≠ 0. Hence Corollary 6.32(1) fails for noncentral s_c, and the real part ½ω₂ is an extraneous point of CS(G₂, 0) (PAPER-CIUBOTARU-HARRIS-26/E11, E18).

*Hypotheses.* G split G₂; s_c and ν as stated.

*Proof route.*

- On the positive coroots (a, b) = (1,0), (0,1), (1,1), (2,1), (3,1), (3,2), α^∨(s) = −1, q^{1/2}, −q^{1/2}, q^{1/2}, −q^{1/2}, −q, never q^{±1}; the stabiliser W_s is trivial, so X(s) is irreducible (unramified-principal-series-irreducibility) and generic.
- w₀ = −1 fixes s_c and negates ν, so X(s) is hermitian; along t ↦ s_c s_{tν}, t ∈ \[0, 1], the same computation gives irreducibility, and at t = 0 the representation is unitarily induced, so X(s) is unitary (deformation as in fundamental-alcove-unitary).
- Every weight of G₂(ℂ) lies in the root lattice and ν is half-integral for the adjoint representation, hence for all representations (half-integral-parameter, test halfIntegral_g2_all).

*Acceptance.* L(s_ν) itself (real part only) is not generic: ⟨3α₁^∨ + 2α₂^∨, ν⟩ = 1, so ν ∉ U₀^g; the unitarity of L(s) is governed by the centraliser of s_c, not by U₀^g.

*Needs:* [*unramified-principal-series-irreducibility*](#sru-sru-5-unramified-principal-series-irreducibility); [*fundamental-alcove-unitary*](#sru-sru-5-fundamental-alcove-unitary); [*half-integral-parameter*](#sru-sru-5-half-integral-parameter); [*spherical-hermitian-criterion*](#sru-sru-5-spherical-hermitian-criterion).

*Sources:* \[CH26] §6.12, Corollary 6.32(1), p. 25: The printed statement for arbitrary s = s_c s_ν; the witness is recorded as PAPER-CIUBOTARU-HARRIS-26/E11 and its consequence for Theorem 8.5 as E18.

### Dependencies

This layer rests on: `ReductiveGroupsPartII:RG2.4`; `ReductiveGroupsPartII:RG2.5`; `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.4`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.2`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.3`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.4`; TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 2 weights of a module and their integrality); TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles).

Coverage: **partial**. Remaining work:

- Noncentral compact parts: classification of geometric unitary spherical parameters for arbitrary s\_c: Corollaries 6.32 and 7.5 and Theorem 8.5 of Ciubotaru–Harris hold as stated only for real or central-compact Satake parameters (PAPER-CIUBOTARU-HARRIS-26/E11, E18); the G₂ witness shows the printed general statements fail. A general statement requires, for each compact s\_c, the unitary spherical dual of the graded Hecke algebra of Z\_{G^∨}(s\_c) with its parameters (noncentral-compact-reduction), its geometric real parts, and the lifting of centraliser orbits. No source read for this plan proves it; the Ciubotaru–Harris route brief names it as a new exhaustive target. The global consumer (the Ramanujan–Arthur route GlobalShtukasPartIIRamanujanArthur of DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII) must keep the real/central-compact hypothesis at each place until this is supplied.
- Hecke signatures, isogenies and genericity transfer: The classification uses explicit long-intertwiner signature calculations (BCP §5.2, pp. 53–54; BC1 §3) rather than decay alone. For the nonsplit transfer, use BC3 Theorems 1.3.1 and 1.4.1 plus Corollary 6.2.6, including transport of the generic/sign condition and the central-isogeny adapter Sp(2n) versus adjoint PSp(2n). The split-only Barbasch–Moy K-type theorem is not itself a nonsplit supplier. Record a characteristic-independent affine/graded-Hecke formulation before applying the characteristic-zero group statements over function fields; CH26 §7 uses this extension but does not prove these adapters.
- Decompose the cited case analyses of Theorem 6.9 (Barbasch, Ciubotaru, Barbasch–Ciubotaru) into W-type signature computations per type.
- Make explicit, for each type, the list of coroots of the maximal level r₀ from the cited classification tables (Barbasch Theorem 3.1, Ciubotaru F₄ and E₆, Barbasch–Ciubotaru §7.2).
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Layer SRU.6: Unramified nonsplit groups

Ciubotaru–Harris §7: for G quasi-simple, adjoint, quasi-split and split over an unramified extension, the pinned outer automorphism τ of G^∨, the τ-fixed group G^∨(τ) and the split group G(τ) dual to it (Table 1); the identification of unramified characters of the minimal Levi with T'^∨ and of W(G, A) with W^τ (SR.4 Frobenius-twisted Satake). Barbasch–Ciubotaru's transfer (Theorem 7.4): for real ν, L^G(ν) is (generic) unitary iff L^{G(τ)}(ν) is; Corollary 7.5 for real or central-compact parameters and every such G except the quasi-split PSU(2n+1); Remark 7.6 on the residual candidate ½ωₙ for PSU(2n+1). The split companion is defined by its full dual root datum and need not be adjoint (PSU(2n+1) gives Sp(2n)). Nonsplit genericity, characteristic and isogeny adapters remain explicit prerequisites.

<a id="sru-sru-6-tau-fixed-dual-group"></a>
#### SRU.6.1 The τ-fixed dual group and the split group G(τ)

**The τ-fixed dual group and the split group G(τ)** (*tau-fixed-dual-group*, construction). Let k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split and split over an unramified extension k'/k of degree d, not split; A a maximal split torus, M = Z\_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). The inner class of G gives a pinned automorphism τ of G^∨ of order d ∈ {2, 3}, normalised by τ(X\_{α^∨}) = X\_{τ(α^∨)} on root vectors. Unramified characters of M form the torus T'^∨ = Spec ℂ\[Λ(M)\] with X^\*(T'^∨) = X^\*(T^∨)^τ and W(G, A) = W^τ ((7.1)); the map η' : T^∨ ⋊ ⟨τ⟩ → T'^∨, (s, τ) ↦ η(s), induces a bijection between τ-conjugacy classes of semisimple elements of G^∨ and W^τ-orbits in T'^∨ ((7.2)). X(s) = i\_B(χ\_s) and L(s) for s ∈ T'^∨ are as in SRU.5. G^∨(τ) := {g ∈ G^∨ : τ(g) = g} is connected reductive (G^∨ simply connected), and G(τ) is the split k-group with dual G^∨(τ): for the types ²A\_{2n−1}, ²A\_{2n}, ²D\_n, ³D₄, ²E₆ of G, G(τ) has type B\_n, C\_n, C\_{n−1}, G₂, F₄ respectively (Table 1). For real ν ∈ t'^∨\_ℝ = (t^∨\_ℝ)^τ write L^G(ν) and L^{G(τ)}(ν).

*Hypotheses.* k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split and split over an unramified extension k'/k of degree d, not split; A a maximal split torus, M = Z\_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7).

*Proof route.*

- (7.1)–(7.2) are Borel's description of the unramified L-group parameters (Corvallis, §6, Lemma 6.4 and Proposition 6.7), which SR.4 frobenius-component-invariants and spherical-parameter state for unramified groups.
- Connectedness of G^∨(τ): fixed points of a semisimple automorphism of a simply connected group are connected (Steinberg, Endomorphisms of linear algebraic groups, 8.1, cited); its type is read off from the folded Dynkin diagram, giving Table 1.

*Uses.* Ciubotaru–Harris, Theorem 7.4 and Corollary 7.5: the comparison group G(τ) to which the split results of §6 are applied. Ciubotaru–Harris, proof of Theorem 5.4: places where G is unramified and quasi-split but not split.

*API.*

- `tauFixedDual` (constructor): G^∨(τ) := the fixed subgroup of the pinned automorphism τ of G^∨.
- `tauFixedDual_connected` (characterisation): G^∨(τ) is connected reductive when G^∨ is simply connected.
- `splitCompanion` (constructor): G(τ), the split group over k with full root datum dual to G^∨(τ); its isogeny is retained and it need not be adjoint.
- `splitCompanion_type` (example): Table 1: ²A\_{2n−1} ↦ B\_n, ²A\_{2n} ↦ C\_n, ²D\_n ↦ C\_{n−1}, ³D₄ ↦ G₂, ²E₆ ↦ F₄.
- `unramifiedTorus_invariants` (compatibility): X^\*(T'^∨) = X^\*(T^∨)^τ and W(G, A) = W^τ.
- `tauConjugacy_equiv` (equivalence): Semisimple τ-conjugacy classes of G^∨ ≃ W^τ-orbits in T'^∨ via η'.

**Checks.**

- `splitCompanion_psu22` (computation): For G = PSU(2,2), splitCompanion G is of type B₂ (SO₅).
- `splitCompanion_3d4` (computation): For G of type ³D₄, τ has order 3 and splitCompanion G is of type G₂.
- `tauFixedDual_trivial_tau` (degenerate): For τ = id (G split), G^∨(τ) = G^∨ and splitCompanion G = G.
- `splitCompanion_not_fixed_points_of_G` (non-example): G(τ) is not a subgroup of G: for ²A₂ it is SL₂, while the k-rank-one PSU(3) has a non-split Levi.
- `splitCompanion_psu3_isogeny` (non-example): For PSU₃ the fixed dual is SO₃ and the split companion is Sp₂=SL₂, not PGL₂. Type A₁ alone does not determine the isogeny.

*Acceptance.* For G = PSU(2, 2) (²A₃), G^∨ = SL₄(ℂ), G^∨(τ) = Sp₄(ℂ) and G(τ) = SO₅, of type B₂. For G = PSU(3) (²A₂), G^∨(τ) = SO₃(ℂ) and G(τ) = Sp₂ = SL₂, of type C₁.

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.4/frobenius-component-invariants`; `SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter`; `ReductiveGroupsPartII:RG2.5/pinned-automorphisms`; `ReductiveGroupsPartII:RG2.5/galois-action-on-dual-group`; [*real-satake-parameter*](#sru-sru-5-real-satake-parameter).

*Sources:* \[CH26] §7, (7.1)–(7.3) and Table 1, pp. 25–26: For quasi-split unramified adjoint G the pinned τ, the identification of unramified characters with T'^∨ and of W(G, A) with W^τ, the bijection of τ-conjugacy classes with W^τ-orbits, the fixed group G^∨(τ) and the split group G(τ) with Table 1 of types. \[BC3] §6.2 before Corollary 6.2.6, p. 29: The graded Hecke algebra of G at s\_e is identified with that of the split group whose dual is G(s\_e τ).

*Planet:* τ-fixed dual group.

<a id="sru-sru-6-nonsplit-unitary-transfer"></a>
#### SRU.6.2 Unitary transfer from nonsplit unramified to split groups

**Unitary transfer from nonsplit unramified to split groups** (*nonsplit-unitary-transfer*, theorem). In the setting of tau-fixed-dual-group, for every real ν ∈ t'^∨\_ℝ, L^G(ν) is unitary iff L^{G(τ)}(ν) is unitary, and generic unitary iff L^{G(τ)}(ν) is generic unitary (Ciubotaru–Harris Theorem 7.4, a case of Barbasch–Ciubotaru 2013 Corollary 6.2.6). Barbasch–Ciubotaru assume characteristic zero (§1.3); Ciubotaru–Harris note that the assumption is unnecessary, the statement being one about graded Hecke algebras.

*Hypotheses.* k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split and split over an unramified extension k'/k of degree d, not split; A a maximal split torus, M = Z\_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). ν real.

*Proof route.*

- BC3 Theorem 1.3.1 and Theorem 1.4.1, pp. 3–4, give the unitary categorical comparison for unramified groups with the fixed root datum. This is the nonsplit theorem; SRU.5’s split-only Barbasch–Moy statement alone does not justify this step.
- BC3 Corollary 6.2.6 and Example 6.2.7, p. 29, identify the companion at compact part one, with its actual isogeny. Keep Sp(2n) for the odd unitary group. The comparison for arbitrary compact part uses Z\_{G^∨}(s\_cτ), which can be disconnected.
- The genericity assertion is CH26 Theorem 7.4, pp. 25–26. Its proof needs the transport of the nonsplit Whittaker/sign criterion through the Hecke equivalence. This adapter and the passage from the characteristic-zero group theorem to characteristic-independent Hecke algebras are explicitly recorded in the Hecke-signature/transfer gap.

*Acceptance.* For ν = 0 both sides are unitary principal series and the statement is immediate. For G = PSU(2,2) the generic unitary real spherical parameters are those of SO₅ (type B₂) in SRU.5 generic-unitary-classification.

*Needs:* [*tau-fixed-dual-group*](#sru-sru-6-tau-fixed-dual-group); [*barbasch-moy-unitarity*](#sru-sru-5-barbasch-moy-unitarity); [*spherical-generic-criterion*](#sru-sru-5-spherical-generic-criterion); `SmoothRepresentationsOfLocalGroups:SR.3`.

*Sources:* \[CH26] §7, p. 25 (remark on \[BC3\]) and Theorem 7.4, p. 26: For real ν in the τ-fixed space, L^G(ν) is (generic) unitary iff L^{G(τ)}(ν) is, a particular case of \[BC3, Corollary 6.2.6\]; the characteristic-zero assumption of \[BC3\] is unnecessary. \[BC3] §1.3, p. 3; Corollary 6.2.6, p. 29: Barbasch–Ciubotaru work over p-adic fields of characteristic zero and prove that the real-infinitesimal-character categories of G and of G(s\_e τ) are unitarily equivalent, in particular for Iwahori-fixed vectors between G and G(τ). \[BC3] §1.3, Theorem 1.3.1; §1.4, Theorem 1.4.1, pp. 3–4; §6.2, Corollary 6.2.6 and Example 6.2.7, p. 29: Unitary equivalences retain arbitrary isogeny and the compact-part twisted centraliser; at compact part one they give the split companions with their actual root data.

<a id="sru-sru-6-nonsplit-generic-temperedness"></a>
#### SRU.6.3 The generic temperedness test for nonsplit unramified groups

**The generic temperedness test for nonsplit unramified groups** (*nonsplit-generic-temperedness*, theorem). In the setting of tau-fixed-dual-group, assume G is not the quasi-split form of PSU(2n+1), and let s = s\_c s\_ν ∈ T'^∨ with s\_c = 1 or central. If L^G(s) is generic and unitary, then s is geometric with respect to all finite-dimensional representations of G^∨ ⋊ ⟨τ⟩ iff ν = 0, i.e. iff L^G(s) = L^G(s\_c) is tempered (Ciubotaru–Harris Corollary 7.5, scope corrected as in SRU.5 generic-temperedness-test; PAPER-CIUBOTARU-HARRIS-26/E11). The representations used are the adjoint representation (τ-stable, whose restriction contains the adjoint representation of G^∨(τ)), V ⊕ V^τ for G^∨ = SL(2n) (restricting to two copies of the defining representation of Sp(2n)), and the sum of the two half-spin representations for G^∨ = Spin(2n) (restricting to two copies of the spin representation of Spin(2n−1)).

*Hypotheses.* k a nonarchimedean local field, G = 𝐆(k) with 𝐆 quasi-simple of adjoint type, quasi-split and split over an unramified extension k'/k of degree d, not split; A a maximal split torus, M = Z\_G(A), K a special maximal compact subgroup attached to A, B ⊃ A a Borel subgroup (Ciubotaru–Harris §7). G not the quasi-split PSU(2n+1) s\_c = 1 or central. A compact part called central means central in the full L-dual group and compatible with a unitary unramified character twist; being central merely in the abelian parameter torus is insufficient. Otherwise keep the compact part equal to one.

*Proof route.*

- By nonsplit-unitary-transfer, L^{G(τ)}(ν) is generic unitary.
- Restrictions to G^∨(τ) of the listed representations of G^∨ ⋊ ⟨τ⟩ contain the adjoint representation of G^∨(τ) and the fundamental representations of SRU.5 fundamental-separators for the type of G(τ); for the exceptional G(τ) (G₂, F₄) the adjoint representation suffices since U₀^{g,½} = {0}.
- SRU.5 generic-temperedness-test applied to G(τ) gives ν = 0.

*Acceptance.* For G of type ²E₆, G(τ) = F₄ and the adjoint representation alone forces ν = 0. For the quasi-split PSU(2n+1) the argument fails (odd-unitary-residual).

*Needs:* [*nonsplit-unitary-transfer*](#sru-sru-6-nonsplit-unitary-transfer); [*generic-temperedness-test*](#sru-sru-5-generic-temperedness-test); [*fundamental-separators*](#sru-sru-5-fundamental-separators).

*Sources:* \[CH26] §7, Corollary 7.5 and proof, pp. 26–27: For nonsplit unramified adjoint G other than the quasi-split PSU(2n+1), generic unitary L^G(s) is geometric for all representations of G^∨ ⋊ ⟨τ⟩ iff ν = 0; the proof restricts V ⊕ V^τ and the half-spin representations to G^∨(τ) and applies Proposition 6.31; it passes from L^G(s) to L^G(ν) as in Corollary 6.32, so the same restriction on s\_c applies.

<a id="sru-sru-6-odd-unitary-residual"></a>
#### SRU.6.4 The residual candidate for the odd quasi-split unitary group

**The residual candidate for the odd quasi-split unitary group** (*odd-unitary-residual*, theorem). Let G be the quasi-split form of PSU(2n+1): G^∨ = SL(2n+1, ℂ), G^∨(τ) = SO(2n+1, ℂ), G(τ) = Sp(2n). Assume L^G(ν) is generic and unitary, ν is real, and the geometric half-integrality test holds for every finite-dimensional representation of the ambient dual SL(2n+1,ℂ). Under these hypotheses, the argument of nonsplit-generic-temperedness leaves the two possibilities ν = 0 and ν = ½ωₙ (the G(τ)-weight in the numbering of Ciubotaru–Harris §6.5): the adjoint representation of G^∨ restricts to contain the adjoint representation of G^∨(τ), which leaves {0, ½ωₙ} (SRU.5 half-integral-type-c for PSp(2n)), and ½ωₙ is excluded for PSp(2n) only by the spin representation of Spin(2n+1, ℂ), which does not factor through SO(2n+1, ℂ) and so does not occur in any representation of SL(2n+1, ℂ) (Ciubotaru–Harris Remark 7.6). This is not an automorphic counterexample.

*Hypotheses.* G the quasi-split adjoint unitary group in 2n + 1 variables over k. L^G(ν) generic unitary, ν real, and the half-integrality condition holds in every finite-dimensional ambient-dual representation; the Sp/PSp comparison requires the adapter in the transfer gap.

*Proof route.*

- nonsplit-unitary-transfer and SRU.5 half-integral-type-c for PSp(2n) give ν ∈ {0, ½ωₙ}.
- Representations of SL(2n+1, ℂ) restrict to SO(2n+1, ℂ), on which the centre of Spin(2n+1, ℂ) acts trivially; the spin representation is faithful on that centre, so it is not a constituent.

*Acceptance.* For n = 1 (PSU(3)), G(τ) = SL₂ and the residual candidate is ½ω₁, the half-integral complementary-series point of SL₂.

*Needs:* [*nonsplit-unitary-transfer*](#sru-sru-6-nonsplit-unitary-transfer); [*half-integral-type-c*](#sru-sru-5-half-integral-type-c); [*fundamental-separators*](#sru-sru-5-fundamental-separators).

*Sources:* \[CH26] §7, Remark 7.6, p. 27: For the quasi-split PSU(2n+1) the methods leave ν = 0 or ν = ½ωₙ; the spin representation that rules out ½ωₙ for PSp(2n) does not descend to SO(2n+1, ℂ).

### Dependencies

This layer rests on: `ReductiveGroupsPartII:RG2.5`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.4`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.5`.

Coverage: **partial**. Remaining work:

- Hecke signatures, isogenies and genericity transfer: The classification uses explicit long-intertwiner signature calculations (BCP §5.2, pp. 53–54; BC1 §3) rather than decay alone. For the nonsplit transfer, use BC3 Theorems 1.3.1 and 1.4.1 plus Corollary 6.2.6, including transport of the generic/sign condition and the central-isogeny adapter Sp(2n) versus adjoint PSp(2n). The split-only Barbasch–Moy K-type theorem is not itself a nonsplit supplier. Record a characteristic-independent affine/graded-Hecke formulation before applying the characteristic-zero group statements over function fields; CH26 §7 uses this extension but does not prove these adapters.
- Expand Barbasch–Ciubotaru's \*-isomorphism of graded Hecke algebras (BC3 §6.1–6.2) into nodes for each line of Table 1.
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Layer SRU.7: Kazhdan–Lusztig parameters and spherical complementary series

The Aubert–Zelevinsky involution on the Grothendieck group of finite-length representations of a reductive p-adic group (Aubert 1995), preservation of cuspidal support and hence of the semisimple local parameter (Ciubotaru–Harris Proposition 4.5, with ExcursionOperators ES5 and ES7); agreement with the Zelevinsky involution of SR.5.3 for GL\_n. Kazhdan–Lusztig parameters (s, e, ρ) of irreducible Iwahori-spherical representations of split G and the classification theorem (Kazhdan–Lusztig 1987, Reeder 2002), with its spherical, tempered and generic criteria; the Iwahori–Matsumoto involution preserves unitarity (Barbasch–Moy). The partition of the spherical dual by nilpotent orbits Sph(G, O^∨) (8.1), the central point q^{h/2}, the complementary series CS(G, O^∨), Theorem 8.3 (reduction to the centralizer of the sl₂-triple, except 4A₁ in E₈), extraneous points (Definition 8.4) and Theorem 8.5 restricted to real or central-compact parameters with the corrected F₄ point, and the E₈, 4A₁ exclusion of §8.3. The simplified KL criteria are stated for split adjoint G; the triple-centraliser classification and identification with the zero complementary series use the real or central-compact sector. The full spherical strata retain compact parts and central twists. Aubert’s corrected-resolution proof is an explicit access gap, with its endpoint corroborated by Ban02 Theorem 3.1.

<a id="sru-sru-7-aubert-involution"></a>
#### SRU.7.1 The Aubert–Zelevinsky involution

**The Aubert–Zelevinsky involution** (*aubert-involution*, construction). Let G = 𝐆(F) be reductive over a nonarchimedean local field with minimal parabolic B and simple roots Δ, and R(G) the Grothendieck group of finite-length smooth complex representations. D\_G := Σ\_{J⊆Δ} (−1)^{|J|} i\_{P\_J} ∘ r\_{P\_J} on R(G), with normalised induction and Jacquet functors of the standard parabolics P\_J (Aubert Définition 1.5). D\_G commutes with the contragredient, satisfies D\_G ∘ i\_{P\_J} = i\_{P\_J} ∘ D\_{L\_J} and r\_{P\_J} ∘ D\_G = Ad(w\_J) ∘ D\_{L\_{J'}} ∘ r\_{P\_{J'}} for the conjugate subset J' = w\_J(J) (Théorème 1.7(1)–(2)), is an involution, D\_G² = id (1.7(3)), and acts on an irreducible cuspidal π by (−1)^{|Δ|} (1.7(4)). For irreducible π, ±D\_G(π) is irreducible for a unique sign (Corollaire 3.9); AZ(π) denotes this irreducible representation. AZ preserves cuspidal support, AZ(1\_G) = St\_G for split G, and for GL\_n it is Zelevinsky's involution (Théorème 2.3), the involution of SR.5.3. The characteristic-zero endpoint is independently corroborated by Ban02 Theorem 3.1. Ciubotaru–Harris use the same involution over function fields; checking the corrected-resolution proof and its characteristic extension remains the explicit Aubert gap below.

*Hypotheses.* G reductive over a nonarchimedean local field; representations of finite length.

*Proof route.*

- D\_G is additive and well defined on R(G): i\_P is exact and preserves finite length (SR.2 parabolic-induction; SR.3 finite-length (1)); r\_P is exact over ℂ (SR.2 jacquet-lemma), takes admissible to admissible (SR.2 jacquet-invariants) and finitely generated to finitely generated (SR.2 jacquet-module), hence finite length to finite length (SR.3 finite-length (2)).
- Théorème 1.7(2) is the geometric lemma (SR.2 geometric-lemma) summed with signs over the subsets J; (3) follows from (2) by induction on the semisimple rank and (4) for cuspidals; (1) uses Casselman's duality of r\_P with the contragredient.
- Irreducibility up to sign is the endpoint cited in Aubert Corollaire 3.9 and independently restated in Ban02 Theorem 3.1(6), p. 678, whose reference includes Aubert’s 1996 erratum. The original resolution proof and the correction were not accessible for this independent review, so their proof input is recorded as a gap rather than declared exact from the uncorrected 1995 paper.
- Cuspidal support: every term i\_{P\_J} ∘ r\_{P\_J}(π) has the cuspidal support of π (SR.3 cuspidal-support).
- AZ(1) = St for split G: by Théorème 1.7(2) with J = ∅, r\_B(D\_G\[1\]) = ±Ad(w₀)(r\_B 1) = ±δ\_B^{1/2}, a single exponent; among the constituents of i\_B(δ\_B^{1/2}) only St\_G has normalised Jacquet module δ\_B^{1/2} (SR.3.4 steinberg; SRU.4 rodier-steinberg-series), so AZ(1) = St\_G.

*Uses.* Ciubotaru–Harris, Proposition 4.5: comparison of semisimple local parameters of π and AZ(π). Ciubotaru–Harris, §8.1, (8.1): AZ(L(s)) = π(s, e, triv) with e in the open orbit defines the nilpotent stratum of a spherical representation. SRU.7 central-point-unitary: the spherical representation at the central point is the AZ dual of a tempered one.

*API.*

- `aubertDual` (constructor): D\_G : R(G) →+ R(G), Σ\_{J ⊆ Δ} (−1)^{|J|} \[i\_{P\_J} (r\_{P\_J} π)\].
- `aubertDual_involutive` (characterisation): D\_G (D\_G x) = x.
- `aubertDual_induce` (relation): D\_G ∘ i\_{P\_J} = i\_{P\_J} ∘ D\_{L\_J}.
- `aubertDual_jacquet` (relation): r\_{P\_J} ∘ D\_G = Ad(w\_J) ∘ D\_{L\_{J'}} ∘ r\_{P\_{J'}} with J' = w\_J(J).
- `aubertDual_cuspidal` (simp): D\_G \[π\] = (−1)^{|Δ|} \[π\] for irreducible cuspidal π.
- `aubertInvolution` (constructor): AZ(π), the irreducible representation with \[AZ(π)\] = ± D\_G \[π\].
- `aubertInvolution_cuspidalSupport` (compatibility): AZ(π) and π have the same cuspidal support.
- `aubertInvolution_gln` (compatibility): For GL\_n, AZ agrees with the Zelevinsky involution of SR.5.3 (Z(m) ↦ L(m)).
- `aubertInvolution_trivial` (example): AZ(1\_G) = St\_G for split G.

**Checks.**

- `aubert_gl2_trivial` (computation): For G = GL₂(ℚ\_p), D\_G\[1\] = \[i\_B(δ\_B^{−1/2})\] − \[1\] = \[St\], so AZ(1) = St.
- `aubert_torus` (degenerate): For G a torus (Δ = ∅), D\_G = id.
- `aubert_cuspidal_sign` (characterisation): For a supercuspidal π of GL₂(ℚ\_p), D\_G\[π\] = −\[π\] and AZ(π) = π.
- `aubert_not_D_itself` (non-example): D\_G\[1\] is the class of an irreducible only up to sign in general: for PGL₃, D\_G\[1\] = \[St\] while for a supercuspidal of PGL₂ it is −\[π\]; AZ takes the irreducible representative, not D\_G itself.

*Acceptance.* For GL₂(ℚ\_p): AZ(1) = St, AZ(St) = 1, and AZ fixes every irreducible principal series and every supercuspidal. D\_G² = id on R(G).

*Needs:* `SmoothRepresentationsOfLocalGroups:SR.2/parabolic-induction`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-module`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-lemma`; `SmoothRepresentationsOfLocalGroups:SR.2/jacquet-invariants`; `SmoothRepresentationsOfLocalGroups:SR.2/geometric-lemma`; `SmoothRepresentationsOfLocalGroups:SR.3/finite-length`; `SmoothRepresentationsOfLocalGroups:SR.3/cuspidal-support`; `SmoothRepresentationsOfLocalGroups:SR.3/steinberg`; [*rodier-steinberg-series*](#sru-sru-4-rodier-steinberg-series); `SmoothRepresentationsOfLocalGroups:SR.5/highest-derivative-adapter`.

*Sources:* \[Aub95] §1, Définition 1.5 and Théorème 1.7, p. 2181: D\_G is the alternating sum over standard Levi subgroups of induction composed with the Jacquet functor; it commutes with the contragredient, is compatible with induction and Jacquet functors, is an involution and multiplies irreducible cuspidals by (−1)^{|S|}. \[Aub95] §2, Théorème 2.3, p. 2185; §3, Corollaire 3.9, p. 2189: For GL\_n the involution coincides with Zelevinsky's; for irreducible E, ±D\_G(E) is the class of an irreducible representation E^#, and (E^#)^# ≅ E. \[CH26] §4.2, Proposition 4.5 and proof, p. 12: For tempered π, π and AZ(π) have the same cuspidal support, by \[Au, Theorem 1.7\]. \[Ban02] §3, Theorem 3.1(1)–(6), p. 678: The alternating induction–Jacquet operator is involutive, compatible with induction and Jacquet functors, and takes irreducibles to irreducibles up to sign; the cited Aubert reference includes the 1996 erratum.

*Planet:* Aubert–Zelevinsky involution.

<a id="sru-sru-7-aubert-semisimple-parameter"></a>
#### SRU.7.2 Aubert duality preserves the semisimple parameter

**Aubert duality preserves the semisimple parameter** (*aubert-semisimple-parameter*, theorem). Let G be connected reductive over a nonarchimedean local field and π irreducible (Ciubotaru–Harris state it for tempered π). Then π and AZ(π) are constituents of the same normalised parabolically induced representation of a cuspidal datum; hence their semisimple local parameters (ExcursionOperators ES5) coincide: L^ss(AZ(π)) = L^ss(π) (Ciubotaru–Harris Proposition 4.5). No equality of monodromy operators is asserted.

*Hypotheses.* π irreducible; the semisimple parameter L^ss of ExcursionOperatorsAndSpectralAction ES5, compatible with parabolic induction (ES7:parabolic). A fixed field isomorphism ℂ ≅ Q̄\_ℓ (ℓ ≠ p), through which complex representations are compared with the ℓ-adic coefficients of ES5.

*Proof route.*

- Same cuspidal support: aubert-involution.
- The semisimple parameter of an irreducible constituent of i_P(σ) is that of σ composed with the Levi embedding (ExcursionOperators ES7:parabolic parabolic-induction), with the half-modulus twist of normalised induction accounted for by ES7:parabolic normalised-induction-dictionary; it depends only on the cuspidal support.

*Acceptance.* For GL₂, L^ss(1) = L^ss(St) = |·|^{1/2} ⊕ |·|^{−1/2}, while the Weil–Deligne monodromies differ (0 and nonzero).

*Needs:* [*aubert-involution*](#sru-sru-7-aubert-involution); `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`; `ExcursionOperatorsAndSpectralAction:ES7:parabolic/parabolic-induction`; `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`.

*Sources:* \[CH26] §4.2, Proposition 4.5 and proof, p. 12: For tempered π, π and AZ(π) are constituents of the same normalised induced representation, so their semisimple ℓ-adic parameters agree; the proof cites \[Au, Theorem 1.7].

<a id="sru-sru-7-kazhdan-lusztig-parameters"></a>
#### SRU.7.3 Kazhdan–Lusztig parameters

**Kazhdan–Lusztig parameters** (*kazhdan-lusztig-parameters*, definition). Let k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). A Kazhdan–Lusztig triple is (s, e, ρ) with s ∈ G^∨ semisimple, e ∈ g^∨ nilpotent with Ad(s)e = q·e, and ρ an irreducible representation of the component group A(s, e) = π₀(Z\_{G^∨}(s, e)) of Springer type (occurring in the homology of the variety of Borel subalgebras containing e and fixed by s), on which the centre of G^∨ acts trivially; triples are taken up to G^∨-conjugacy. g^∨\_q denotes the q-eigenspace of Ad(s); G^∨(s) = Z\_{G^∨}(s) acts on it with finitely many orbits and a unique open orbit. For a Lie triple (e, h, f) with h ∈ t^∨\_ℝ and s ∈ T^∨, s₀ := s q^{−h/2} commutes with the triple.

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). For connected-centre G the classification is Kazhdan–Lusztig's; general isogeny is Reeder's.

*Proof route.*

- Finiteness of G^∨(s)-orbits on g^∨\_q and the open orbit are the graded (Vinberg–Lusztig) version of finiteness of nilpotent orbits.
- The Springer-type condition uses the Springer correspondence on the component groups; it is a definition here, with the geometric inputs (nilpotent orbits, sl₂-triples, Springer fibres) recorded as gaps (nilpotent-orbit owner pending).

*Uses.* Ciubotaru–Harris, §8.1: spherical, generic and AZ-dual representations are described by their KL triples. Ciubotaru–Harris, proof of Corollary 5.7: tempered spherical representations are the full principal series.

*API.*

- `KLTriple` (data): A triple (s, e, ρ) with s semisimple in G^∨, e ∈ g^∨ nilpotent, Ad(s) e = q • e, ρ an irreducible representation of π₀(Z(s, e)) of Springer type.
- `KLTriple.qEigenspace` (projection): g^∨\_q := {x ∈ g^∨ | Ad(s) x = q • x}.
- `KLTriple.openOrbit` (other): The unique open G^∨(s)-orbit in g^∨\_q.
- `KLTriple.compactPart` (projection): s₀ = s q^{−h/2} for an sl₂-triple through e with h real in t^∨.
- `KLTriple.conj` (structure): G^∨ acts on triples by conjugation; the classification is up to this action.

**Checks.**

- `klTriple_spherical` (characterisation): (s, 0, triv) is a KL triple for every semisimple s.
- `klTriple_pgl2_steinberg` (computation): For PGL₂ and s = diag(q^{1/2}, q^{−1/2}) ∈ SL₂(ℂ), e = the upper nilpotent satisfies Ad(s)e = qe.
- `not_klTriple_eigenvalue` (non-example): For PGL₂ and s = 1, a nonzero nilpotent e does not satisfy Ad(s)e = qe.
- `klTriple_qEigenspace_zero` (degenerate): If |α(s)| = 1 for every root α of G^∨ (s compact), then g^∨\_q = 0.

*Acceptance.* For PGL₂: triples (s, 0, triv) for all s, and (s, e ≠ 0, triv) for s with eigenvalue ratio q, the latter giving the Steinberg representation and its unramified quadratic twist. The spherical triples are exactly those with e = 0 and ρ trivial.

*Needs:* `ReductiveGroupsPartII:RG2.5/langlands-dual-group`; `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

*Sources:* \[CH26] §5, proof of Corollary 5.7, p. 15; §8.1, pp. 27–28: Irreducible Iwahori-spherical representations correspond to G^∨-conjugacy classes of triples (s, e^∨, ρ) with Ad(s)e^∨ = qe^∨ and ρ of Springer type; spherical, tempered and generic representations are described in these terms. \[CitedOnly] D. Kazhdan and G. Lusztig, Proof of the Deligne–Langlands conjecture for Hecke algebras, Invent. Math. 87 (1987), Theorem 7.12; M. Reeder, Represent. Theory 6 (2002), Theorem 1 (not read): The classification for connected centre and for general isogeny.

*Planet:* Kazhdan–Lusztig parameters.

<a id="sru-sru-7-kazhdan-lusztig-classification"></a>
#### SRU.7.4 The Kazhdan–Lusztig classification of Iwahori-spherical representations

**The Kazhdan–Lusztig classification of Iwahori-spherical representations** (*kazhdan-lusztig-classification*, theorem). Let k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). Irreducible smooth representations of G with nonzero Iwahori-fixed vectors are in bijection, π(s, e, ρ) ↔ (s, e, ρ), with G^∨-conjugacy classes of Kazhdan–Lusztig triples (Kazhdan–Lusztig 1987 Theorem 7.12 for connected centre; Reeder 2002 in general). Moreover: (1) π(s, e, ρ) is K-spherical iff e = 0, and then ρ is trivial and π(s, 0, triv) = L(s) with s the Satake parameter; (2) π(s, e, ρ) is tempered iff s₀ is compact; (3) π(s, e, ρ) is generic iff ρ is trivial and e lies in the open G^∨(s)-orbit of g^∨\_q; (4) AZ(L(s)) = π(s, e, triv) with e in that open orbit (Ciubotaru–Harris §5 and §8.1).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

*Proof route.*

- The Iwahori block is equivalent to H(G, I)-modules (SR.3.4 borel-casselman-block), and H(G, I) is the affine Hecke algebra with Bernstein presentation (SR.1).
- Kazhdan–Lusztig realise H(G, I) in the equivariant K-theory of the Steinberg variety of G^∨ and classify simple modules by standard modules in the homology of fixed-point varieties; this geometric proof is not decomposed here (gaps: equivariant K-theory realisation).
- (1) Spherical modules contain the trivial H(K, I)-character, which occurs exactly for e = 0; (2) Casselman's criterion in terms of the exponents of the standard module; (3) Barbasch–Moy, Reeder; (4) on Iwahori-spherical modules the Aubert involution is the Iwahori–Matsumoto involution (az-iwahori-matsumoto), which exchanges spherical and generic modules with the same s.
- The adjoint hypothesis is essential to the simplified spherical criterion as written. With arbitrary isogeny e=0 need not force the component-group representation to be trivial. A general dictionary must impose e=0 and trivial enhancement, and keep the Whittaker datum in the generic criterion; that extension is not claimed here.

*Acceptance.* For PGL₂: L(s) = π(s, 0, triv); St = π(diag(q^{1/2}, q^{−1/2}), e, triv); at s = diag(q^{1/2}, q^{−1/2}) the q-eigenspace is the line of e, the open orbit is e ≠ 0, so AZ(1) = St. Tempered spherical representations have s₀ = s compact and g^∨\_q = 0, so they are the only irreducible representations with that s (Ciubotaru–Harris, proof of Corollary 5.7).

*Needs:* [*kazhdan-lusztig-parameters*](#sru-sru-7-kazhdan-lusztig-parameters); [*az-iwahori-matsumoto*](#sru-sru-7-az-iwahori-matsumoto); `SmoothRepresentationsOfLocalGroups:SR.3/borel-casselman-block`; `SmoothRepresentationsOfLocalGroups:SR.1/bernstein-presentation`; `SmoothRepresentationsOfLocalGroups:SR.3/casselman-criterion`; [*spherical-generic-criterion*](#sru-sru-5-spherical-generic-criterion).

*Sources:* \[CH26] §5, proof of Corollary 5.7, p. 15; §8.1, pp. 27–28: The KL classification, its spherical and tempered criteria, the description of generic representations by the open orbit in the q-eigenspace, and AZ(L(s)) = π(s, e^∨, triv) with e^∨ in that orbit. \[CitedOnly] Kazhdan–Lusztig 1987, Theorem 7.12; Reeder 2002, Theorem 1 (not read): The cited classification.

*Planet:* Kazhdan–Lusztig classification.

<a id="sru-sru-7-az-iwahori-matsumoto"></a>
#### SRU.7.5 Aubert duality on the Iwahori block preserves unitarity

**Aubert duality on the Iwahori block preserves unitarity** (*az-iwahori-matsumoto*, theorem). Let k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). On irreducible Iwahori-spherical representations, AZ corresponds under V ↦ V^I to the central-character-preserving Iwahori–Matsumoto involution of H(G, I) specified below, which preserves hermitian and unitary modules. Hence AZ(π) is unitarizable iff π is, for Iwahori-spherical π; in particular AZ of a tempered Iwahori-spherical representation is unitarizable.

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

*Proof route.*

- Fix the central-character-preserving convention of La24 Definition 4.2, p. 18, in Bernstein generators: IM(T\_s)=−qT\_s⁻¹ for finite simple reflections, and IM(θ\_x)=T\_{w₀} θ\_{w₀x} T\_{w₀}⁻¹. It fixes the Bernstein centre. The other common convention with θ\_x↦θ\_{−x} has a different effect on central characters and must not be substituted here.
- Kato’s alternating induction–restriction identity identifies this involution with D\_G on the Iwahori block, using compatibility of Iwahori invariants with normalised induction and Jacquet restriction (La24 Theorem 4.3, p. 18). Agreement on 1 and St and induction compatibility alone would not prove equality of functors.
- For the graded convention tw↦(−1)^ℓ(w)tw and ω↦−ω, unitarity is preserved (CiF4 Theorem 3.1, pp. 10–11 of the author version). Passing to the central-character-preserving version composes with the opposition automorphism/inner conjugacy, which preserves positive forms; retain this convention adapter through the affine-to-graded equivalence.
- SRU.5 barbasch-moy-unitarity: the Iwahori–Matsumoto involution preserves unitary H(G, I)-modules (Barbasch–Ciubotaru §1.1, after \[BM1\]).
- Tempered representations are unitarizable (SR.3.3 and SRU.2 unitary-induction).

*Acceptance.* AZ(St) = 1 is unitary. For PGL₂ the complementary series L(ν), 0 < ⟨α^∨, ν⟩ < 1, are fixed by AZ (they are full principal series) and unitary.

*Needs:* [*aubert-involution*](#sru-sru-7-aubert-involution); [*barbasch-moy-unitarity*](#sru-sru-5-barbasch-moy-unitarity); `SmoothRepresentationsOfLocalGroups:SR.1/iwahori-matsumoto`; [*unitary-induction*](#sru-sru-2-unitary-induction); `SmoothRepresentationsOfLocalGroups:SR.3/square-integrable-tempered`.

*Sources:* \[BC1] §1.1, p. 1: The Iwahori–Matsumoto involution takes hermitian modules to hermitian modules and unitary to unitary, interchanging spherical and generic modules and the trivial and Steinberg representations (\[BM1\]). \[CH26] §8.1, p. 28: The spherical representation at the central point is the AZ dual of a tempered representation and is unitary. \[La24] §4.2, Definition 4.2 and Theorem 4.3, p. 18: The central-character-preserving involution has an explicit Bernstein-generator formula and equals the alternating induction–restriction operator; the alternative inverse-torus convention is distinguished. \[CiF4] §3.1, Theorem 3.1, pp. 10–11 of the author version: The usual graded Iwahori–Matsumoto involution preserves unitarity; the central-point spherical module is its dual of a tempered module.

<a id="sru-sru-7-nilpotent-partition"></a>
#### SRU.7.6 The nilpotent partition of the spherical dual

**The nilpotent partition of the spherical dual** (*nilpotent-partition*, construction). Let k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). For a nilpotent G^∨-orbit O^∨ ⊆ g^∨, Sph(G, O^∨) is the set of G^∨-classes of s with AZ(L(s)) = π(s, e, triv), e ∈ O^∨ ((8.1)); these sets partition the K-spherical dual. For a Lie triple (e^∨, h^∨, f^∨) of O^∨, s = q^{h^∨/2} ∈ Sph(G, O^∨) is the central point. For s ∈ T^∨ write s = q^{ℜ(s)} s\_c with ℜ(s) ∈ t^∨\_ℝ and Sph(G, O^∨)₀ for the set of real parts. SU(G) is the spherical unitary dual (s with L(s) unitarizable), CS(G, O^∨) = SU(G) ∩ Sph(G, O^∨) the spherical complementary series attached to O^∨, and CS(G, O^∨)₀ its real parts; SU(G) = ⊔ CS(G, O^∨). Z(O^∨) = C\_{G^∨}(e^∨, h^∨, f^∨) is reductive, possibly disconnected, with Lie algebra z(O^∨); G(O^∨) is the split group dual to Z(O^∨)°; choosing a Cartan subalgebra a^∨ ⊆ z(O^∨) inside t^∨, for s with trivial or central compact part, ℜ(s) ∈ Sph(G, O^∨)₀ can be written ℜ(s) = ½h^∨ + ν with ν ∈ a^∨\_ℝ, regarded as a parameter in Sph(G(O^∨), 0)₀ ((8.2)).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

*Proof route.*

- The partition: each L(s) has exactly one AZ dual, whose KL triple has e in the open orbit of g^∨\_q (kazhdan-lusztig-classification (4)); its G^∨-saturation is O^∨.
- Central point: for s = q^{h^∨/2}, Ad(s)e^∨ = qe^∨ and the triple has s₀ = 1 compact, so π(s, e^∨, triv) is tempered and L(s) is its AZ dual (Barbasch–Ciubotaru §1.3, (1.3.1)).
- The decomposition ℜ(s) = ½h^∨ + ν with ν in the centraliser follows from Barbasch–Moy's characterisation of O(χ) (Barbasch–Ciubotaru §1.3, (1.3.1)–(1.3.2)); the existence of Lie triples and the reductivity of Z(O^∨) are nilpotent-orbit inputs (gaps: nilpotent-orbit owner pending).

*Uses.* Ciubotaru–Harris, Theorems 8.3 and 8.5: the stratification in which complementary series and extraneous points are classified. Ciubotaru–Harris, Theorem 1.11 and §10: the global weight-pattern argument places all unramified components in the same CS(G, O^∨).

*API.*

- `sphericalStratum` (constructor): Sph(G, O^∨) as a set of semisimple classes of G^∨.
- `sphericalStratum_partition` (characterisation): The Sph(G, O^∨) over nilpotent orbits O^∨ partition the spherical dual.
- `centralPoint` (constructor): q^{h^∨/2} ∈ Sph(G, O^∨) for a Lie triple of O^∨.
- `sphericalUnitaryDual` (constructor): SU(G) := {s | L(s) unitarizable}.
- `complementarySeries` (constructor): CS(G, O^∨) := SU(G) ∩ Sph(G, O^∨), with real parts CS(G, O^∨)₀.
- `tripleCentralizer` (constructor): Z(O^∨) = C\_{G^∨}(e^∨, h^∨, f^∨) and the split group G(O^∨) dual to Z(O^∨)°.
- `realPart_decomposition` (characterisation): For s with trivial or central compact part, every ℜ(s) ∈ Sph(G, O^∨)₀ is W-conjugate to ½h^∨ + ν with ν in a Cartan subalgebra of z(O^∨).

**Checks.**

- `sphericalStratum_pgl2` (computation): For PGL₂ there are two strata: O = 0 (s with α^∨(s) ≠ q^{±1}) and O regular (s = q^{±ρ} up to the quadratic twist).
- `complementarySeries_zero_eq` (compatibility): The real-parameter slice {ν ∈ C₀ | q^ν ∈ CS(G,0)} equals U₀^g. The real parts of the full stratum with arbitrary compact parts need not equal U₀^g: the noncentral G₂ witness gives a strict extra point.
- `centralPoint_regular` (degenerate): For O^∨ regular, centralPoint = q^ρ and L(q^ρ) is the trivial representation.
- `not_partition_by_realpart` (non-example): The stratum of s is not determined by ℜ(s) alone when s\_c is noncentral: for G₂ the witness s\_c s\_{½ω₂} lies in Sph(G₂, 0) while s\_{½ω₂} does not (SRU.5 g2-noncentral-witness).

*Acceptance.* For O^∨=0, the real slice {ν | q^ν∈CS(G,0)} equals U₀^g up to W. This does not identify all real parts CS(G,0)₀ when arbitrary compact parts are allowed. For regular O^∨ the real slice is {q^ρ}; the full stratum also contains central compact twists zq^ρ. For PGL₂ the two choices of z give the trivial and unramified quadratic characters.

*Needs:* [*kazhdan-lusztig-classification*](#sru-sru-7-kazhdan-lusztig-classification); [*aubert-involution*](#sru-sru-7-aubert-involution); [*real-satake-parameter*](#sru-sru-5-real-satake-parameter); [*unitary-structure*](#sru-sru-2-unitary-structure); `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`.

*Sources:* \[CH26] §8.1–8.2, (8.1)–(8.2), pp. 27–28: The sets Sph(G, O^∨), the central point q^{h^∨/2}, the real parts, the spherical unitary dual SU(G), the complementary series CS(G, O^∨), the centraliser Z(O^∨) and the split group G(O^∨), and the decomposition ℜ(s) = ½h^∨ + ν. \[BC1] §1.3, (1.3.1)–(1.3.2), p. 3: Barbasch–Moy attach to each real χ a unique maximal nilpotent orbit O(χ) with wχ = ½h + ν, ν in the centraliser, equivalently the saturation of the open G₀-orbit in g₁.

*Planet:* Spherical complementary series.

<a id="sru-sru-7-central-point-unitary"></a>
#### SRU.7.7 The central point is unitary

**The central point is unitary** (*central-point-unitary*, theorem). In the setting of nilpotent-partition, for every nilpotent O^∨ the spherical representation L(q^{h^∨/2}) at the central point is unitarizable (Ciubotaru–Harris §8.1).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple, adjoint and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

*Proof route.*

- L(q^{h^∨/2}) = AZ(π(q^{h^∨/2}, e^∨, triv)) with the second tempered (nilpotent-partition, step 2).
- az-iwahori-matsumoto: the AZ dual of a tempered Iwahori-spherical representation is unitarizable.

*Acceptance.* For O^∨ regular the central point is the trivial representation; for O^∨ = 0 it is X(1), a unitary principal series.

*Needs:* [*nilpotent-partition*](#sru-sru-7-nilpotent-partition); [*az-iwahori-matsumoto*](#sru-sru-7-az-iwahori-matsumoto).

*Sources:* \[CH26] §8.1, p. 28: The spherical representation at the central point q^{h/2} is the AZ dual of a tempered representation and is unitary.

<a id="sru-sru-7-centralizer-reduction"></a>
#### SRU.7.8 Complementary series reduce to the triple centraliser

**Complementary series reduce to the triple centraliser** (*centralizer-reduction*, theorem). In the setting of nilpotent-partition, with G of connected centre or adjoint as in Ciubotaru–Harris §8: assuming s has trivial or central compact part, if O^∨ is not the orbit 4A₁ of E₈, s ∈ CS(G, O^∨) and ℜ(s) = ½h^∨ + ν with ν ∈ Sph(G(O^∨), 0)₀, then ν ∈ CS(G(O^∨), 0)₀ (Ciubotaru–Harris Theorem 8.3). For 4A₁ in E₈ the complementary series has an extra region beyond that of the centraliser C₄ (e8-4a1-exclusion).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). O^∨ ≠ 4A₁ ⊂ E₈. s=q^{ℜ(s)} or s=zq^{ℜ(s)} with z compact and central in the full dual group; strip the corresponding unitary unramified character twist first. No assertion here covers arbitrary noncentral compact part.

*Proof route.*

- Strip a central compact part using its unitary unramified character twist (with the full root datum retained). For the remaining real parameter, use the real graded-Hecke equivalence. For noncentral compact part the relevant graded root system is that of Z\_{G^∨}(s\_c), so replacing it by G^∨ at ℜ(s) would be invalid.
- The classification of the spherical unitary dual (Barbasch for classical types, Ciubotaru for F₄ and E₆, Barbasch–Ciubotaru for E₇, E₈) shows, case by case, that the ν occurring are in the zero complementary series of G(O^∨), except for 4A₁ in E₈; the case analysis is cited.

*Acceptance.* For O^∨ = 0, G(O^∨) = G and the statement is the definition of U₀^g. For O^∨ regular, Z(O^∨) is the centre, G(O^∨) is trivial and ν = 0.

*Needs:* [*nilpotent-partition*](#sru-sru-7-nilpotent-partition); [*barbasch-moy-unitarity*](#sru-sru-5-barbasch-moy-unitarity); [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).

*Sources:* \[CH26] §8.2, Theorem 8.3, p. 28: Except for 4A₁ in E₈, a complementary-series parameter ½h^∨ + ν attached to O^∨ has ν in the zero complementary series of the centraliser group, by the classification of the spherical unitary dual \[Ba, BC1, Ci1, Ci2\].

*Planet:* Reduction to the triple centraliser.

<a id="sru-sru-7-extraneous-point"></a>
#### SRU.7.9 Extraneous real parts

**Extraneous real parts** (*extraneous-point*, definition). In the setting of nilpotent-partition, let s = φ(Frob) ∈ CS(G, O^∨) be geometric in the sense of SRU.5 half-integral-parameter (for every representation of G^∨). Its real part ℜ(s) is extraneous if it is not W-conjugate to the central point ½h^∨ (Ciubotaru–Harris Definition 8.4).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting).

*Proof route.*

- Well defined: ℜ(s) is defined up to W, and the central point of O^∨ up to W.

*Uses.* Ciubotaru–Harris, Theorems 8.5, 1.11 and 10.3: the possible non-central real parts of unitary geometric spherical components.

*API.*

- `IsExtraneous` (data): IsExtraneous O s :⇔ s ∈ CS(G, O), s geometric, and ℜ(s) ∉ W • {½h^∨}.
- `not_isExtraneous_centralPoint` (simp): The central point is not extraneous.
- `isExtraneous_sp6` (example): For G^∨ = Sp(6), O = (2,2,2), the real part (0, ½, 1) is extraneous.

**Checks.**

- `isExtraneous_sp6_example` (computation): For G^∨ = Sp(6) and O^∨ = (2,2,2), the real part (0, ½, 1) ≠ (½, ½, ½) up to W, and it is the extraneous point of Remark 8.6.
- `not_isExtraneous_central` (degenerate): For every O^∨ the central point ½h^∨ is not extraneous.
- `not_isExtraneous_nongeometric` (non-example): A unitary s in CS(G, O^∨) whose real part is not half-integral is not extraneous: the definition requires geometricity.

*Acceptance.* The central point itself is never extraneous. For Sp(6) and O^∨ = (2,2,2), ½h^∨ = (½, ½, ½) and the point (0, ½, 1) is extraneous (Remark 8.6).

*Needs:* [*nilpotent-partition*](#sru-sru-7-nilpotent-partition); [*half-integral-parameter*](#sru-sru-5-half-integral-parameter); [*central-point-unitary*](#sru-sru-7-central-point-unitary).

*Sources:* \[CH26] §8.2, Definition 8.4 and Remark 8.6, pp. 28–29: When s is geometric and L(s) unitary but its real part is not the central point, the real part is called extraneous; the smallest example is in Sp(6) at the orbit (2,2,2).

<a id="sru-sru-7-extraneous-classical"></a>
#### SRU.7.10 Extraneous points for symplectic and spin duals

**Extraneous points for symplectic and spin duals** (*extraneous-classical*, theorem). In the setting of extraneous-point, with G of connected centre and s = s_c q^ν with s_c = 1 or s_c central in G^∨: (1) if G^∨ = Sp(2n) and O^∨ has partition with rᵢ parts equal to i (Σ i rᵢ = 2n, rᵢ even for i odd), so that Z(O^∨) = ∏\_{i odd} Sp(rᵢ) × ∏\_{j even} O(rⱼ), the extraneous real parts are ½h^∨ + ½ Σ\_{j even, rⱼ ≥ 3} εⱼ ω^j_{⌊rⱼ/2⌋}, εⱼ ∈ {0, 1} not all zero; (2) if G^∨ = Spin(n) and O^∨ has rᵢ parts equal to i (Σ i rᵢ = n, rᵢ even for i even), the extraneous real parts are ½h^∨ + ½ Σ\_{i odd, rᵢ ≥ 3} εᵢ ω^i_{⌊rᵢ/2⌋} with Σ εᵢ even and not all εᵢ zero (Ciubotaru–Harris Theorem 8.5(1)–(2); the proof's 'j odd' in case (2) of Sp is a misprint for 'j even', PAPER-CIUBOTARU-HARRIS-26/E2). These lists are not asserted for noncentral compact parts.

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). G of connected centre s = s_c q^ν with s_c = 1 or s_c central in G^∨.

*Proof route.*

- Write ℜ(s) = ½h^∨ + ν with ν ∈ CS(G(O^∨), 0)₀ (centralizer-reduction). ½h^∨ is half-integral for every representation (sl₂-theory), so ν is half-integral for every representation of g^∨ and for the adjoint representation of z(O^∨).
- Apply SRU.5 half-integral-generic-unitary to each simple factor of z(O^∨): ν is 0 or an exception of Theorem 6.14 on each factor.
- Standard representation of G^∨: forces νᵢ = 0 on the factors that are not of the listed orthogonal type; for Spin(n) the spin modules impose the parity Σ εᵢ even; the remaining points are half-integral for G^∨ (Ciubotaru–Harris, proof of Theorem 8.5, cases (2)–(3)).

*Acceptance.* Remark 8.6: for Sp(6) and O^∨ = (2,2,2) (r₂ = 3), the unique extraneous real part is ½h^∨ + ½ω^2_1 = (0, ½, 1) up to W. For O^∨ with every rⱼ ≤ 2 (j even), there are no extraneous points.

*Needs:* [*centralizer-reduction*](#sru-sru-7-centralizer-reduction); [*extraneous-point*](#sru-sru-7-extraneous-point); [*half-integral-generic-unitary*](#sru-sru-5-half-integral-generic-unitary); [*fundamental-separators*](#sru-sru-5-fundamental-separators); TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 0 sl₂ representation theory the engine).

*Sources:* \[CH26] §8.2, Theorem 8.5(1)–(2), Remark 8.6 and proof cases (1)–(3), pp. 28–29: For connected-centre G with dual Sp(2n) or Spin(n), the extraneous points are the central point plus half-sums of fundamental coweights of the orthogonal factors of the centraliser with the stated parity; the proof applies Theorem 6.14 to the centraliser and the standard and spin representations of G^∨.

*Planet:* Extraneous points.

<a id="sru-sru-7-extraneous-exceptional"></a>
#### SRU.7.11 Extraneous points for exceptional duals

**Extraneous points for exceptional duals** (*extraneous-exceptional*, theorem). In the setting of extraneous-point, with G of connected centre and s = s\_c q^ν with s\_c = 1 or s\_c central in G^∨: the extraneous real parts occur only for O^∨ = B₃ (real part ω₁ + ½ω₃ + ½ω₄, corrected from the printed ω₁ + ω₂ + ½ω₃ + ½ω₄, PAPER-CIUBOTARU-HARRIS-26/E5) and Ã₁ + A₁ (½ω₁ + ½ω₄) in F₄; D₅(a₁) + A₁ in E₇ (½(ω₁ + ω₂ + ω₃ + ω₆ + ω₇)); and the following four E₈ points: D₆ (centraliser B₂), ω₁+½ω₄+½ω₆+ω₈; A₆ (centraliser 2A₁), ½ω₁+½ω₄+½ω₇+½ω₈; A₄+A₂ (centraliser 2A₁), ½ω₁+½ω₅+½ω₈; A₂+2A₁ (centraliser B₃+A₁), ½ω₂+½ω₈ (Ciubotaru–Harris Theorem 8.5(3)–(5)); there are none for G₂ and E₆ in this sector. Without the restriction on s\_c the list is not exhaustive: the G₂ witness (SRU.5 g2-noncentral-witness) gives a geometric unitary s ∈ CS(G₂, 0) with real part ½ω₂ ≠ 0 (PAPER-CIUBOTARU-HARRIS-26/E18).

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). G of connected centre s = s\_c q^ν with s\_c = 1 or s\_c central in G^∨.

*Proof route.*

- As in extraneous-classical, ν ∈ CS(G(O^∨), 0)₀ is, on each simple factor of z(O^∨), 0 or an exception of Theorem 6.14; the exceptional orbits and centraliser types come from the tables of nilpotent orbits (gaps: nilpotent-orbit owner pending).
- For each remaining candidate compute the simple-root and fundamental-weight pairings of G^∨; the survivors are those listed (Ciubotaru–Harris, proof of Theorem 8.5, case (4)); the F₄, B₃ coordinate is corrected by comparison with Ciubotaru's F₄ classification (E5).

*Acceptance.* For F₄ and O^∨ = B₃ the corrected point ω₁ + ½ω₃ + ½ω₄ has Euclidean coordinates (5/2, 1, ½, 0) in (6.21), Weyl-conjugate to the B₃ complementary-series parameter at ν = ½. For G₂ the restricted sector has no extraneous point, while the noncentral witness s\_c s\_{½ω₂} is extraneous.

*Needs:* [*centralizer-reduction*](#sru-sru-7-centralizer-reduction); [*extraneous-point*](#sru-sru-7-extraneous-point); [*half-integral-generic-unitary*](#sru-sru-5-half-integral-generic-unitary); [*g2-noncentral-witness*](#sru-sru-5-g2-noncentral-witness); [*e8-4a1-exclusion*](#sru-sru-7-e8-4a1-exclusion).

*Sources:* \[CH26] §8.2, Theorem 8.5(3)–(5), Remark 8.7 and proof case (4), pp. 29–30: The extraneous points of exceptional groups: two for F₄, one for E₇, four for E₈, none for G₂ or E₆; Remark 8.7 calls this list complete, which holds only for real or central-compact parameters (E18), with the F₄ B₃ point corrected (E5).

<a id="sru-sru-7-e8-4a1-exclusion"></a>
#### SRU.7.12 The extra E₈, 4A₁ region has no half-integral points

**The extra E₈, 4A₁ region has no half-integral points** (*e8-4a1-exclusion*, theorem). For G of type E₈ and O^∨ = 4A₁ (Z(O^∨) of type C₄), in the coordinates ℜ(s) = ½h^∨ + (0, 0, ν₁, ν₁, ν₂, ν₂, −ν₃ + ν₄, ν₃ + ν₄) with 0 ≤ ν₁ ≤ ν₂ ≤ ν₃ ≤ ν₄, the complementary series is {ν₄ < ½} ∪ {ν₁ + ν₄ < 1, ν₂ + ν₃ < 1, ν₂ + ν₄ > 1, −ν₁ + ν₃ + ν₄ < 3/2 < ν₁ + ν₃ + ν₄} ((8.8)), and its extra region (the second set) contains no parameter half-integral for the adjoint representation (Ciubotaru–Harris §8.3; the case labels are corrected in PAPER-CIUBOTARU-HARRIS-26/E14).

*Hypotheses.* G of type E₈; coordinates of Barbasch–Ciubotaru Table 13 and §6.4.1 as used by Ciubotaru–Harris.

*Proof route.*

- Adjoint half-integrality forces all νᵢ ∈ ½ℤ\_{≥0} or all in ¼ + ½ℤ (the second case is empty in these coordinates, E14).
- In the first case ν₁ + ν₄ < 1 and ν₂ + ν₄ > 1 are incompatible with νᵢ ∈ ½ℤ; in the second, ν₄ = ¾ forces ν₂ = ν₃ = ¾, contradicting ν₂ + ν₃ < 1.
- The region {ν₄ < ½} is CS(C₄, 0) and is handled by extraneous-exceptional as for other orbits.
- The two E₈ lattice cases are checked separately: half-integer coordinates and ν₄<1 give ν₄≤½, contradicting ν₂+ν₄>1; quarter-integer coordinates give ν₄=¾ and ν₂>¼, hence ν₂≥¾ and ν₂+ν₃≥3/2, contradicting ν₂+ν₃<1. This also fixes the switched case labels in CH26 §8.3; the suggested Lean inequalities express these same two cases.

*Acceptance.* The point ν = (½, ½, ½, ½) violates ν₁ + ν₄ < 1; the point (¼, ¾, ¾, ¾) violates ν₂ + ν₃ < 1.

*Needs:* [*nilpotent-partition*](#sru-sru-7-nilpotent-partition); [*half-integral-parameter*](#sru-sru-5-half-integral-parameter).

*Sources:* \[CH26] §8.3, (8.8) and the following argument, p. 30: For 4A₁ in E₈ the complementary series has an extra region beyond CS(C₄, 0); a finite case analysis shows it has no adjoint-half-integral parameter (with the case labels corrected, E14).

*Lean:* `e8_fourA1_extra_region_not_halfIntegral`

<a id="sru-sru-7-noncentral-compact-reduction"></a>
#### SRU.7.13 Unitarity with noncentral compact part reduces to the centraliser of s_c

**Unitarity with noncentral compact part reduces to the centraliser of s_c** (*noncentral-compact-reduction*, theorem). Let k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). For s = s_c q^ν with s_c compact (noncentral allowed) and ν real, L(s) is unitarizable iff the spherical module of the graded affine Hecke algebra attached to the centraliser Z_{G^∨}(s_c) (its root datum and the Hecke parameters determined by s_c) at the real parameter ν is unitary (Barbasch–Moy 1993). Unitarity of L(s) is therefore not governed by U₀^g of G when s_c is noncentral; the generic temperedness test and the extraneous-point lists of SRU.5 and SRU.7 are stated only for real or central-compact s.

*Hypotheses.* k a nonarchimedean local field (any characteristic) with residue field 𝔽\_q, G = 𝐆(k) with 𝐆 quasi-simple and split, I ⊂ K = 𝐆(O) an Iwahori subgroup, G^∨ the complex dual group with Lie algebra g^∨ (Ciubotaru–Harris §8 setting). s_c compact, possibly noncentral.

*Proof route.*

- Lusztig's reduction identifies the completion of H(G, I) at the central character of s with that of the graded Hecke algebra of Z_{G^∨}(s_c); Barbasch–Moy make it compatible with the \*-structures (SRU.5 barbasch-moy-unitarity, third clause).
- The G₂ witness shows the dependence: Z_{G₂}(s_c) has type A₁ × Ã₁, in whose graded algebra ½ω₂ lies in the complementary series, although it is not in U₀^g(G₂).

*Acceptance.* For s_c central, Z_{G^∨}(s_c) = G^∨ and the statement reduces to SRU.5. For G₂ and the involution s_c of g2-noncentral-witness, the centraliser is of type A₁ × Ã₁.

*Needs:* [*barbasch-moy-unitarity*](#sru-sru-5-barbasch-moy-unitarity); [*g2-noncentral-witness*](#sru-sru-5-g2-noncentral-witness); [*kazhdan-lusztig-parameters*](#sru-sru-7-kazhdan-lusztig-parameters).

*Sources:* \[BC1] §1.2, p. 2: By \[BM2] the unitarity problem reduces to graded Hecke algebras of a possibly smaller group at real infinitesimal character. \[CH26] §6.12, Corollary 6.32, p. 25: The corollary is printed for arbitrary s_c; the correction (PAPER-CIUBOTARU-HARRIS-26/E11) says that for noncentral s_c unitarity is governed by the centraliser of s_c.

### Dependencies

This layer rests on: `ExcursionOperatorsAndSpectralAction:ES5`; `ExcursionOperatorsAndSpectralAction:ES7:parabolic`; `ReductiveGroupsPartII:RG2.5`; `SmoothRepresentationsOfLocalGroups:SR.1`; `SmoothRepresentationsOfLocalGroups:SR.2`; `SmoothRepresentationsOfLocalGroups:SR.3`; `SmoothRepresentationsOfLocalGroups:SR.5`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.2`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.4`; `SmoothRepresentationsOfLocalGroupsPartII:SRU.5`; TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 0 sl₂ representation theory the engine).

Coverage: **partial**. Remaining work:

- Nilpotent orbits of g^∨: Jacobson–Morozov, centralisers of sl₂-triples, graded orbits and Bala–Carter tables: The nilpotent partition of the spherical dual needs: existence and conjugacy of sl₂-triples through a nilpotent e (Jacobson–Morozov, Kostant); reductivity and component groups of Z\_{G^∨}(e, h, f); finiteness of Z\_{G^∨}(s)-orbits on the q-eigenspace g^∨\_q with a unique open orbit; and, for the exceptional cases of Theorem 8.5, the list of nilpotent orbits with the types of their reductive centralisers. TauCetiRoadmap LieHighestWeight stops at sl₂ and finite-dimensional irreducibles. The owner is the pending design DESIGN-LieHighestWeightPartII (issue #3373), which receives the Ciubotaru–Harris route LieHighestWeightPartIINilpotentOrbits and the Mao–Wan–Zhang route; this roadmap imports it once planned.
- Kazhdan–Lusztig classification: the equivariant K-theory realisation: Kazhdan–Lusztig's proof realises the affine Hecke algebra in the G^∨ × ℂ^×-equivariant K-theory of the Steinberg variety and classifies simple modules through standard modules in the homology of fixed-point varieties of Springer fibres; Reeder extends it to all isogenies. No roadmap in the atlas plans this equivariant K-theory; DESIGN-SpringerResolutionAndCharacteristicCycles plans the Steinberg variety's geometry but not its K-theory. The classification is stated here as a cited theorem with its spherical, tempered and generic criteria.
- Noncentral compact parts: classification of geometric unitary spherical parameters for arbitrary s\_c: Corollaries 6.32 and 7.5 and Theorem 8.5 of Ciubotaru–Harris hold as stated only for real or central-compact Satake parameters (PAPER-CIUBOTARU-HARRIS-26/E11, E18); the G₂ witness shows the printed general statements fail. A general statement requires, for each compact s\_c, the unitary spherical dual of the graded Hecke algebra of Z\_{G^∨}(s\_c) with its parameters (noncentral-compact-reduction), its geometric real parts, and the lifting of centraliser orbits. No source read for this plan proves it; the Ciubotaru–Harris route brief names it as a new exhaustive target. The global consumer (the Ramanujan–Arthur route GlobalShtukasPartIIRamanujanArthur of DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII) must keep the real/central-compact hypothesis at each place until this is supplied.
- Aubert corrected proof and KL arbitrary-isogeny dictionary: Aubert’s original §1 (pp. 2181–2183) was accessible, but the full §2–3 PDF and the 1996 erratum (Trans. AMS 348, pp. 4687–4690, DOI 10.1090/S0002-9947-96-01776-X) were not. Ban02 Theorem 3.1, p. 678, confirms the irreducibility/involution endpoint with the erratum in its bibliography, but the corrected resolution proof and the asserted extension to positive characteristic have not been independently checked. The simplified KL spherical/generic dictionary is now restricted to split adjoint groups; arbitrary isogeny needs the Reeder component-group and fixed-Whittaker refinements, including e=0 plus trivial enhancement for spherical modules.
- Plan the nilpotent-orbit inputs once DESIGN-LieHighestWeightPartII is accepted (gap 'Nilpotent orbits of g^∨').
- The arbitrary-compact classification of geometric unitary spherical parameters (gap 'Noncentral compact parts').
- Retain the explicit proof prerequisites above; no target is claimed implemented or proof-closed.

## Downstream consumers

- **LocalLanglandsCorrespondenceForG2** (Gan–Savin; design pending): Propositions 10.5 and 10.7 and Lemma 10.8 use SRU.1 *gan-savin-isolated-summand* with SRU.4 *steinberg-isolated* and *supercuspidal-isolated*, and SRU.3 *gan-savin-generic-limits* and *tadic-tempered-limits*.
- **The Shimura–Waldspurger route of MetaplecticAutomorphicForms, Part II** (paper route MetaplecticAutomorphicFormsPartIIShimuraWaldspurger; Gan–Ichino, Proposition A.2; design pending): SRU.1 *weak-containment*, *irreducible-weak-containment* and the relative form of *gan-savin-isolated-summand* for Mp₂ₙ(F\_S) and its products with compact groups.
- **The Ramanujan–Arthur route of GlobalShtukasAndFunctionFieldLanglands, Part II** (paper route GlobalShtukasPartIIRamanujanArthur; Ciubotaru–Harris, Theorems 5.4, 1.11 and 10.3; design pending): SRU.5 *generic-temperedness-test*, SRU.6 *nonsplit-generic-temperedness*, SRU.7 *extraneous-classical*, *extraneous-exceptional* and *aubert-semisimple-parameter*, each with its real or central-compact hypothesis kept at every place where it is applied.
- The other Part II directions of SR import from this roadmap where they meet unitarity: characters and trace Paley–Wiener (SRU.3 *character-weak-convergence*, *characters-linearly-independent*) and types (SRU.4 *supercuspidal-isolated*).

## Other Part II directions of SR

The paper extractions propose further continuations of SR that share no definitions with this roadmap beyond SR itself; the packet's restructure proposal asks for each to be designed as its own roadmap with parent SR: types, depth and the construction of supercuspidal representations (SmoothRepresentationsPartII: Fintzen, Stevens, Kurinczuk–Skodlerack–Stevens, Lust–Stevens, Bushnell–Henniart and others, about 930 items); parahoric centres (SmoothRepresentationsPartIIParahoricCenters: Kisin–Pappas, He, Zhu, Clozel–Thorne, Dor, Böckle–Harris–Khare–Thorne); unitary level-raising types and Hecke operators (UnitaryLevelRaisingTypesAndHeckeOperators: Liu–Tian–Xiao–Zhang–Zhu); characters, trace Paley–Wiener and ℓ-adic lattices (SmoothRepresentationsCharactersPartII: Hansen–Kaletha–Weinstein, Hansen); mod p Bernstein centres, the Brauer homomorphism and local cyclic base change (ModPBernsteinCentersAndLocalBaseChange: Feng); general-linear newforms (SmoothRepresentationsPartIIGeneralLinearNewforms: Atobe–Kondo–Yasuda); Newton cocentres and invariant distributions (SmoothRepresentationsPartIINewtonCocenters: He).

## Gaps

- **Nilpotent orbits of g^∨: Jacobson–Morozov, centralisers of sl₂-triples, graded orbits and Bala–Carter tables.** The nilpotent partition of the spherical dual needs: existence and conjugacy of sl₂-triples through a nilpotent e (Jacobson–Morozov, Kostant); reductivity and component groups of Z\_{G^∨}(e, h, f); finiteness of Z\_{G^∨}(s)-orbits on the q-eigenspace g^∨\_q with a unique open orbit; and, for the exceptional cases of Theorem 8.5, the list of nilpotent orbits with the types of their reductive centralisers. TauCetiRoadmap LieHighestWeight stops at sl₂ and finite-dimensional irreducibles. The owner is the pending design DESIGN-LieHighestWeightPartII (issue #3373), which receives the Ciubotaru–Harris route LieHighestWeightPartIINilpotentOrbits and the Mao–Wan–Zhang route; this roadmap imports it once planned. Needed by [*kazhdan-lusztig-parameters*](#sru-sru-7-kazhdan-lusztig-parameters), [*nilpotent-partition*](#sru-sru-7-nilpotent-partition), [*centralizer-reduction*](#sru-sru-7-centralizer-reduction), [*extraneous-classical*](#sru-sru-7-extraneous-classical), [*extraneous-exceptional*](#sru-sru-7-extraneous-exceptional).
- **Kazhdan–Lusztig classification: the equivariant K-theory realisation.** Kazhdan–Lusztig's proof realises the affine Hecke algebra in the G^∨ × ℂ^×-equivariant K-theory of the Steinberg variety and classifies simple modules through standard modules in the homology of fixed-point varieties of Springer fibres; Reeder extends it to all isogenies. No roadmap in the atlas plans this equivariant K-theory; DESIGN-SpringerResolutionAndCharacteristicCycles plans the Steinberg variety's geometry but not its K-theory. The classification is stated here as a cited theorem with its spherical, tempered and generic criteria. Needed by [*kazhdan-lusztig-classification*](#sru-sru-7-kazhdan-lusztig-classification).
- **Noncentral compact parts: classification of geometric unitary spherical parameters for arbitrary s\_c.** Corollaries 6.32 and 7.5 and Theorem 8.5 of Ciubotaru–Harris hold as stated only for real or central-compact Satake parameters (PAPER-CIUBOTARU-HARRIS-26/E11, E18); the G₂ witness shows the printed general statements fail. A general statement requires, for each compact s\_c, the unitary spherical dual of the graded Hecke algebra of Z\_{G^∨}(s\_c) with its parameters (noncentral-compact-reduction), its geometric real parts, and the lifting of centraliser orbits. No source read for this plan proves it; the Ciubotaru–Harris route brief names it as a new exhaustive target. The global consumer (the Ramanujan–Arthur route GlobalShtukasPartIIRamanujanArthur of DESIGN-GlobalShtukasAndFunctionFieldLanglandsPartII) must keep the real/central-compact hypothesis at each place until this is supplied. Needed by [*generic-temperedness-test*](#sru-sru-5-generic-temperedness-test), [*extraneous-exceptional*](#sru-sru-7-extraneous-exceptional), [*extraneous-classical*](#sru-sru-7-extraneous-classical).
- **Miličić's theorem: the C\*-algebraic input.** Miličić's Theorem 5 is a statement about C\*-algebras with bounded trace and the topology of their spectra. The group C\*-algebra exists upstream (OperatorAlgebraDynamics D1–D2, TauCetiRoadmap main) and the GCR and hull-kernel comparisons are in the open NoncompactQuantumSymmetry roadmap (PR #1015), but the bounded-trace theory and Miličić's limit theorem are not planned anywhere. milicic-limits states the theorem as Gan–Savin use it; its C\*-algebraic proof is this gap. Needed by [*milicic-limits*](#sru-sru-3-milicic-limits).
- **Bernstein's admissibility: the polynomial-identity input.** The passage from the uniform bound on simple H(G, K)-modules (SR.3a uniform-admissibility) to finite-dimensionality of H^K for a topologically irreducible unitary π uses polynomial identities of C\*-algebras (Godement, Kaplansky), as Bernstein–Zelevinsky §4.21 indicate. No roadmap owns PI theory for C\*-algebras; the step is cited. Needed by [*unitary-irreducibles-admissible*](#sru-sru-2-unitary-irreducibles-admissible).
- **Godement integrated positive-type theorem.** Supply the positive L¹-functional representation theorem, its nondegenerate integrated GNS construction and recovery of a continuous positive-type representative, including the modular-function involution for a general locally compact group. BHV Lemma C.5.3, p. 382, only cites this input. OperatorAlgebraDynamics D1–D2 supplies group C\*-algebras and C\*-GNS, but the L¹ comparison needed here was not located. This is a proof prerequisite, not a lemma-level refinement. Needed by [*positive-type-integral-form*](#sru-sru-1-positive-type-integral-form).
- **Finite products and Fell topology.** The abstract relative-isolation conclusion is proved. Its advertised finite-product application additionally needs the type-I tensor-product classification for reductive p-adic groups and compatibility of the resulting product dual with Fell topology. The compact-factor argument uses the upstream M0 isotypic projectors; neither a full product-dual theorem nor its exact supplier was located in the read sources. Keep the application conditional until supplied. Needed by [*gan-savin-isolated-summand*](#sru-sru-1-gan-savin-isolated-summand).
- **Finite Steinberg and Rodier constituent combinatorics.** Supply the finite Coxeter-complex/Solomon alternating-character identity identifying the finite-Hecke sign representation with the alternating parabolic sum, and Rodier’s precise multiplicity-one constituent/exponent description for the principal series containing St. CIK71 §4, pp. 94–95, verifies the finite sign character and degree; GS23 §11.1, pp. 31–32, supplies the Rodier statement secondarily. An entire Boolean product description of the submodule lattice is not implied and is not asserted. Needed by [*finite-steinberg*](#sru-sru-4-finite-steinberg), [*rodier-steinberg-series*](#sru-sru-4-rodier-steinberg-series).
- **Howe–Moore contraction lemma.** The full contraction/Mautner propagation argument, from a weak cluster vector along an escaping Cartan sequence to G⁺-invariance, is nonroutine and is not supplied by Cartan decomposition alone. CCLTV §1, pp. 1–2, supports the all-characteristic G⁺ statement but cites the semisimple-group theorem. Locate and plan this proof without importing the characteristic-zero-only relative theorem. Needed by [*howe-moore*](#sru-sru-4-howe-moore).
- **Hecke signatures, isogenies and genericity transfer.** The classification uses explicit long-intertwiner signature calculations (BCP §5.2, pp. 53–54; BC1 §3) rather than decay alone. For the nonsplit transfer, use BC3 Theorems 1.3.1 and 1.4.1 plus Corollary 6.2.6, including transport of the generic/sign condition and the central-isogeny adapter Sp(2n) versus adjoint PSp(2n). The split-only Barbasch–Moy K-type theorem is not itself a nonsplit supplier. Record a characteristic-independent affine/graded-Hecke formulation before applying the characteristic-zero group statements over function fields; CH26 §7 uses this extension but does not prove these adapters. Needed by [*unbounded-not-unitary*](#sru-sru-5-unbounded-not-unitary), [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification), [*nonsplit-unitary-transfer*](#sru-sru-6-nonsplit-unitary-transfer), [*odd-unitary-residual*](#sru-sru-6-odd-unitary-residual).
- **Aubert corrected proof and KL arbitrary-isogeny dictionary.** Aubert’s original §1 (pp. 2181–2183) was accessible, but the full §2–3 PDF and the 1996 erratum (Trans. AMS 348, pp. 4687–4690, DOI 10.1090/S0002-9947-96-01776-X) were not. Ban02 Theorem 3.1, p. 678, confirms the irreducibility/involution endpoint with the erratum in its bibliography, but the corrected resolution proof and the asserted extension to positive characteristic have not been independently checked. The simplified KL spherical/generic dictionary is now restricted to split adjoint groups; arbitrary isogeny needs the Reeder component-group and fixed-Whittaker refinements, including e=0 plus trivial enhancement for spherical modules. Needed by [*aubert-involution*](#sru-sru-7-aubert-involution), [*kazhdan-lusztig-classification*](#sru-sru-7-kazhdan-lusztig-classification).
- **Tempered dual local topology.** Supply the finite-level local structure of Harish–Chandra’s tempered dual and the argument excluding a discrete series from limits of proper-Levi inductions when the centre is compact. SRup SR.3.3 harish-chandra-tempered-support states decomposition and uniqueness, not the needed topology. Convergence of Bernstein parameters alone is insufficient; retain the isolation theorem as a target with this input open. Needed by [*discrete-series-isolated-tempered*](#sru-sru-3-discrete-series-isolated-tempered), [*tadic-tempered-limits*](#sru-sru-3-tadic-tempered-limits).

## Requests to other roadmaps

- `SmoothRepresentationsOfLocalGroups:SR.3`: Two SR.3 targets of the TauCetiRoadmap SmoothRepresentationsOfLocalGroups roadmap that the atlas packets do not yet carry as nodes: harish-chandra-tempered-support (SR.3.3: every irreducible tempered representation is a direct summand of normalised induction from an irreducible square-integrable representation of a Levi, unique up to conjugacy) and iwahori-components (SR.3.4: the category generated by connected-Iwahori-fixed vectors, for nonsplit G, is the product of the components \[M, η] with η weakly unramified, equivalent to H(G, I; ℂ)-modules). Needed by [*discrete-series-isolated-tempered*](#sru-sru-3-discrete-series-isolated-tempered), [*heiermann-opdam-standard-module*](#sru-sru-3-heiermann-opdam-standard-module), [*tadic-tempered-limits*](#sru-sru-3-tadic-tempered-limits), [*nonsplit-unitary-transfer*](#sru-sru-6-nonsplit-unitary-transfer).
- TauCetiRoadmap ReductiveGroups (layer 7 structure theory): For a split connected reductive group over a field: the Bruhat decomposition G = ⊔\_{w∈W} BwB, the standard parabolic subgroups P_J, and generation of G⁺ by the root subgroups U_α (used for the finite Steinberg representation of 𝐆(𝔽\_q) and in the Mautner argument of Howe–Moore). Needed by [*finite-steinberg*](#sru-sru-4-finite-steinberg), [*howe-moore*](#sru-sru-4-howe-moore).
- TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 0 sl₂ representation theory the engine): sl₂-triples (e, h, f) and integrality of the eigenvalues of h on finite-dimensional representations (so that ½h^∨ is half-integral for every representation), used with nilpotent orbits of g^∨. Needed by [*extraneous-classical*](#sru-sru-7-extraneous-classical), [*kazhdan-lusztig-parameters*](#sru-sru-7-kazhdan-lusztig-parameters), [*nilpotent-partition*](#sru-sru-7-nilpotent-partition).
- TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 2 weights of a module and their integrality): Weights of a finite-dimensional representation of a semisimple complex Lie algebra and their pairings with coroots (to define half-integrality of a real parameter for a representation of g^∨). Needed by [*half-integral-parameter*](#sru-sru-5-half-integral-parameter).
- TauCetiRoadmap RepresentationTheory/LieHighestWeight (layer 4 the classification of finite dimensional irreducibles): Every weight of the irreducible V(λ) is λ minus a nonnegative integral combination of simple roots; the fundamental, defining and spin representations named in Ciubotaru–Harris Proposition 6.31. Needed by [*fundamental-separators*](#sru-sru-5-fundamental-separators), [*half-integrality-highest-weight*](#sru-sru-5-half-integrality-highest-weight).

## Imports from TauCetiRoadmap roadmaps outside the atlas snapshot

- **TauCetiRoadmap/NoncompactQuantumSymmetry** (open pull request #1015, head 9a760926024f4e174803545817430e7cab91caa0 (not an atlas stage)): M0 conventions: strong continuity stated separately from TauCeti.ContRepresentation.IsUnitary; topological irreducibility by closed invariant submodules; M0 item 1: the bounded unitary Schur lemma for topologically irreducible π (commutant = scalars); M0: isotypic projectors P\_τ = d\_τ ∫\_K conj(χ\_τ(k)) π(k) dk for compact K acting on strongly continuous unitary representations; Shared group C\*-algebra and weak-support comparisons: weak containment by C\*-kernels and its comparison with coefficient weak containment. Used by [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary), [*pure-iff-irreducible*](#sru-sru-0-pure-iff-irreducible), [*smooth-vectors-unitary*](#sru-sru-0-smooth-vectors-unitary), [*gan-savin-isolated-summand*](#sru-sru-1-gan-savin-isolated-summand), [*weak-containment*](#sru-sru-1-weak-containment). This roadmap uses the same conventions and consumes the Schur lemma and the compact-group projectors; it owns coefficient weak containment (\[BHV\] F.1.1) and the Fell topology, whose comparison with C\*-kernel weak containment and the hull-kernel topology NoncompactQuantumSymmetry owns.
- **TauCetiRoadmap/BanachSpaceTheory** (TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee (post-snapshot, not an atlas stage)): B5: the isometric duality (L¹(μ))\* ≃ L^∞(μ) by the integral pairing. Used by [*positive-type-weak-star-compact*](#sru-sru-1-positive-type-weak-star-compact), [*raikov*](#sru-sru-1-raikov), [*irreducible-weak-containment*](#sru-sru-1-irreducible-weak-containment).
- **TauCetiRoadmap/AutomorphicSpectralTheory** (open pull request #925, head 3d6668ededc6557b979b4b2a7a4597ebe8157196): §7.0b: the finite-place unitary classification of GL\_n (Tadić): blocks u(δ, k) and complementary blocks, irreducibility and exhaustion. Used by [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification). Boundary: the type-A case of the generic unitary spherical classification is the spherical part of Tadić's GL\_n classification, owned there; this roadmap states the split adjoint classification of Ciubotaru–Harris Theorem 6.9 for all types and cites §7.0b for the comparison.
- **TauCetiRoadmap/OperatorAlgebraDynamics** (TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee (post-snapshot, not an atlas stage)): Scope and conventions (strong continuity separate from IsUnitary); D1–D2: group C\*-algebras, regular representations, weak containment of the trivial representation in the regular one. Used by [*strongly-continuous-unitary*](#sru-sru-0-strongly-continuous-unitary). Boundary only: group C\*-algebras and amenability are owned there; this roadmap works with coefficients.
- **TauCetiRoadmap/OperatorTheory/PolarDecomposition** (TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee (post-snapshot; no atlas stage id)): Part B PD-B24–B34: bounded rectangular polar factor, its initial space (ker T)⊥ and final space closure(range T). Used by [*gns-construction*](#sru-sru-0-gns-construction), [*weak-containment*](#sru-sru-1-weak-containment). Consume the existing polar decomposition. Equivariance follows from uniqueness of the polar factor applied to U₂(g) T U₁(g)⁻¹=T; no new polar-decomposition roadmap or node is planned here.

## Mistakes in the sources

- **E1** (misprint, affects nothing; Forum Math. Pi 11 (2023) e28, §11.1, proof of Proposition 11.3, p. 32 (the definition of f_τ before Lemma 11.4); same text in arXiv:2209.07346v2). f_τ is defined on K as the complex conjugate of the character of τ divided by vol(K), and π(f_τ) is said to be the projector onto the τ-isotypic subspace. Correction: f_τ = (dim τ / vol K) · conj χ\_τ on K; without the factor dim τ, π(f_τ) is 1/dim τ times the isotypic projector. Reason: For compact K with normalised Haar measure the isotypic projector is dim τ · ∫\_K conj χ\_τ(k) π(k) dk (Schur orthogonality); for K finite acting on ℂ\[K] and τ of dimension 2 the printed operator has eigenvalue 1/2 on the τ-isotypic part. Lemma 11.4 only needs ⟨π(f_τ)v, v⟩ ≠ 0, so the argument is unaffected.
- **E2** (misprint, affects nothing; arXiv:2311.15300v1, §6, the sentence after Definition 6.3 and (6.1), p. 17). With χ\_s = s ∘ val_T as in (6.1) and s_ν = exp(ν log q), the text says that for dominant ν the spherical L(ν) is the unique irreducible quotient of X(ν). Correction: With (6.1), for dominant ν the spherical L(ν) is the unique irreducible subrepresentation of X(ν) (equivalently the unique quotient of X(−ν)); the quotient statement holds in Barbasch–Ciubotaru's convention χ\_ν(τ(a)) = |a|^{⟨τ,ν⟩}, which is opposite in sign. Reason: By (6.1), val_T(λ^∨(ϖ)) = λ^∨, so χ\_{s_ν}(λ^∨(ϖ)) = q^{⟨λ^∨, ν⟩}. For PGL₂ and ν = ρ this gives χ = δ\_B^{−1/2}, and i_B(δ\_B^{−1/2}) = Ind_B^G 1 contains the trivial representation L(ρ) as a subrepresentation, not as a quotient. No subsequent step uses the quotient statement except through unitarity, which is unchanged under ν ↦ −ν.
- **E3** (gap, affects the proof; arXiv:2311.15300v1, §6.12, Corollary 6.32(2) and its proof, p. 25). Part (2) asserts, for every Satake parameter s = s_c s_ν with L(s) generic, that a coroot value ⟨α^∨, s⟩ = q^m with m a nonzero integer makes L(s) non-unitary, and says this follows at once from Proposition 6.10. Correction: Proposition 6.10 concerns real parameters ν ∈ C₀; the deduction covers s_c = 1 or central. For noncentral s_c, ⟨α^∨, s⟩ = q^m forces α^∨(s_c) = 1 and ⟨α^∨, ν⟩ = m, and the unitarity of L(s) is governed by the graded Hecke algebra of Z_{G^∨}(s_c) (Barbasch–Moy), to which Proposition 6.10 must be applied with that centraliser's root system; this argument is not given. Reason: The same scope issue as PAPER-CIUBOTARU-HARRIS-26/E11 for part (1): the proof of Corollary 6.32 passes through U₀^g, which only parametrises real Satake parameters. No counterexample to part (2) is claimed.
- PAPER-GAN-SAVIN-23-B/E17 (recorded with the paper extraction): Proposition 11.6 stated in the Fell-closure form. Used by [*gan-savin-closure*](#sru-sru-1-gan-savin-closure), [*gan-savin-isolated-summand*](#sru-sru-1-gan-savin-isolated-summand).
- PAPER-CIUBOTARU-HARRIS-26/E11 (recorded with the paper extraction): Corollaries 6.32(1) and 7.5 restricted to real or central-compact parameters. Used by [*generic-temperedness-test*](#sru-sru-5-generic-temperedness-test), [*g2-noncentral-witness*](#sru-sru-5-g2-noncentral-witness), [*nonsplit-generic-temperedness*](#sru-sru-6-nonsplit-generic-temperedness).
- PAPER-CIUBOTARU-HARRIS-26/E18 (recorded with the paper extraction): Theorem 8.5 and Remark 8.7 restricted to the real or central-compact sector. Used by [*extraneous-exceptional*](#sru-sru-7-extraneous-exceptional), [*extraneous-classical*](#sru-sru-7-extraneous-classical).
- PAPER-CIUBOTARU-HARRIS-26/E5 (recorded with the paper extraction): Corrected F₄, B₃ real part ω₁ + ½ω₃ + ½ω₄. Used by [*extraneous-exceptional*](#sru-sru-7-extraneous-exceptional).
- PAPER-CIUBOTARU-HARRIS-26/E8 (recorded with the paper extraction): Theorem 6.9 uses the hermitian locus C_{0,h}. Used by [*generic-unitary-classification*](#sru-sru-5-generic-unitary-classification).
- PAPER-CIUBOTARU-HARRIS-26/E2 (recorded with the paper extraction): 'j odd' in the proof of Theorem 8.5(1) read as 'j even'. Used by [*extraneous-classical*](#sru-sru-7-extraneous-classical).
- PAPER-CIUBOTARU-HARRIS-26/E14 (recorded with the paper extraction): Case labels in §8.3 corrected. Used by [*e8-4a1-exclusion*](#sru-sru-7-e8-4a1-exclusion).

Independent review confirmed all three local source issues and all seven referenced extraction findings. The CH26 findings apply to arXiv:2311.15300v1; the published Annals revision has not been collated. Aubert’s full §2–3 and its 1996 erratum were inaccessible in this review; Ban02 Theorem 3.1 (p. 678) corroborates the endpoint, while the corrected proof remains an explicit gap.

## References

- \[GS23] Wee Teck Gan and Gordan Savin, *The local Langlands conjecture for G\_2*, Forum of Mathematics, Pi 11 (2023), e28, 1–42 (published version, CC BY 4.0); compared with arXiv:2209.07346v2, [source](https://doi.org/10.1017/fmp.2023.27).
- \[CH26] Dan Ciubotaru and Michael Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*, arXiv:2311.15300v1 (26 November 2023); published Annals of Mathematics 204 (2026), no. 2, 545–601 (revision of 8 October 2025, not accessible for collation), [source](https://arxiv.org/pdf/2311.15300v1).
- \[BHV] Bachir Bekka, Pierre de la Harpe and Alain Valette, *Kazhdan's Property (T)*, New Mathematical Monographs 11, Cambridge University Press, 2008; authors' version KazhdanTotal.pdf (printed page numbers cited), [source](https://perso.univ-rennes1.fr/bachir.bekka/KazhdanTotal.pdf).
- \[Ber92] Joseph Bernstein, notes by Karl E. Rumelhart, *Representations of p-adic groups (Harvard lectures, Fall 1992)*, author copy, [source](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/Bernst_Lecture_p-adic_repr.pdf).
- \[Cas95] William Casselman, *Introduction to the theory of admissible representations of p-adic reductive groups*, draft of 1 May 1995, author copy, [source](https://personal.math.ubc.ca/~cass/research/pdf/p-adic-book.pdf).
- \[Cas80] William Casselman, *The unramified principal series of p-adic groups I. The spherical function*, Compositio Mathematica 40 (1980), no. 3, 387–406 (Numdam), [source](http://www.numdam.org/item/CM_1980__40_3_387_0.pdf).
- \[HO] Volker Heiermann and Eric Opdam, *On the tempered L-function conjecture*, arXiv:0908.0699v4; published American Journal of Mathematics 135 (2013), no. 3, 777–799, [source](https://arxiv.org/pdf/0908.0699v4).
- \[BC1] Dan Barbasch and Dan Ciubotaru, *Whittaker unitary dual of affine graded Hecke algebras of type E*, arXiv:0708.4036v2; published Compositio Mathematica 145 (2009), 1563–1616, [source](https://arxiv.org/pdf/0708.4036v2).
- \[BC3] Dan Barbasch and Dan Ciubotaru, *Unitary equivalences for reductive p-adic groups*, arXiv:0909.5241v3; published American Journal of Mathematics 135 (2013), no. 6, 1633–1674, [source](https://arxiv.org/pdf/0909.5241v3).
- \[Aub95] Anne-Marie Aubert, *Dualité dans le groupe de Grothendieck de la catégorie des représentations lisses de longueur finie d'un groupe réductif p-adique*, Transactions of the American Mathematical Society 347 (1995), no. 6, 2179–2189, [source](https://www.ams.org/journals/tran/1995-347-06/S0002-9947-1995-1285969-0/S0002-9947-1995-1285969-0.pdf).
- \[CCLTV] Raf Cluckers, Yves Cornulier, Nicolas Louvet, Romain Tessera and Alain Valette, *The Howe–Moore property for real and p-adic groups*, arXiv:1003.1484v1; published Mathematica Scandinavica 109 (2011), 201–224, [source](https://arxiv.org/pdf/1003.1484v1).
- \[SRup] TauCetiRoadmap contributors, *Roadmap: smooth representations of local groups (TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md)*, branch roadmap/reductive-adelic-smooth-bundle of TauCetiProject/TauCetiRoadmap (pull request #785), head 1cdde3240025076c7f74afcb491e9e97d6fdbea6, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/1cdde3240025076c7f74afcb491e9e97d6fdbea6/TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md).
- \[NQS] TauCetiRoadmap contributors, *Noncompact quantum symmetry and particle representations (TauCetiRoadmap/NoncompactQuantumSymmetry/README.md)*, open pull request #1015 of TauCetiProject/TauCetiRoadmap, head 9a760926024f4e174803545817430e7cab91caa0, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/9a760926024f4e174803545817430e7cab91caa0/TauCetiRoadmap/NoncompactQuantumSymmetry/README.md).
- \[BZ76] I. N. Bernstein and A. V. Zelevinsky, *Representations of the group GL(n, F), where F is a non-archimedean local field*, Russian Mathematical Surveys 31:3 (1976), 1–68; copy from J. Bernstein's publication page, [source](https://www.math.tau.ac.il/~bernstei/Publication_list/publication_texts/B-Zel-RepsGL-Usp.pdf).
- \[GI18] Wee Teck Gan and Atsushi Ichino, *The Shimura–Waldspurger correspondence for Mp\_2n*, arXiv:1705.10106v3; published Annals of Mathematics 188 (2018), no. 3, 965–1016, [source](https://arxiv.org/pdf/1705.10106v3).
- \[CitedOnly] D. Miličić (Glasnik Mat. 8 (1973)); M. Tadić (Glasnik Mat. 23 (1988); J. Analyse Math. 51 (1988); Ann. Sci. ÉNS 19 (1986)); F. Rodier (Neptun 1980, Pitman 1984); D. Barbasch and A. Moy (Invent. Math. 98 (1989); Contemp. Math. 177 (1994)); R. Howe and C. C. Moore (J. Funct. Anal. 32 (1979)); I. N. Bernstein (Funct. Anal. Appl. 8 (1974)); D. Kazhdan and G. Lusztig (Invent. Math. 87 (1987)); M. Reeder (Compositio 85 (1993); Represent. Theory 6 (2002)); S. Kato (J. Fac. Sci. Univ. Tokyo 28 (1981)); D. Ciubotaru (Represent. Theory 9 (2005), 10 (2006)); D. Barbasch (J. Inst. Math. Jussieu 9 (2010)); A. W. Knapp and E. M. Stein (1970); J. B. Conway (A course in functional analysis, 2nd ed., 1990); R. Steinberg (Endomorphisms of linear algebraic groups, Mem. AMS 80 (1968)), *Works cited by Gan–Savin and Ciubotaru–Harris and used here through their statements*, not read for this plan; each node that rests on one of them gives its statement as Gan–Savin, Ciubotaru–Harris or Barbasch–Ciubotaru cite it, with that citing locator.
- \[BST] TauCetiRoadmap contributors, *Banach space theory (TauCetiRoadmap/BanachSpaceTheory/README.md)*, TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/BanachSpaceTheory/README.md).
- \[AST] TauCetiRoadmap contributors, *Automorphic spectral theory and trace distributions (TauCetiRoadmap/AutomorphicSpectralTheory/README.md)*, open pull request #925, head 3d6668ededc6557b979b4b2a7a4597ebe8157196, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/3d6668ededc6557b979b4b2a7a4597ebe8157196/TauCetiRoadmap/AutomorphicSpectralTheory/README.md).
- \[OAD] TauCetiRoadmap contributors, *Operator-algebra dynamics, crossed products, and equilibrium (TauCetiRoadmap/OperatorAlgebraDynamics/README.md)*, TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorAlgebraDynamics/README.md).
- \[CIK71] Charles W. Curtis, Nagayoshi Iwahori and Robert Kilmoyer, *Hecke algebras and characters of parabolic type of finite groups with (B,N)-pairs*, Publ. Math. IHÉS 40 (1971), 81–116, [source](https://www.numdam.org/item/PMIHES_1971__40__81_0.pdf).
- \[BCP] Dan Barbasch, Dan Ciubotaru and Alessandra Pantano, *Unitarizable minimal principal series of reductive groups*, arXiv:0804.1937v1; PDF carries September 16, 2021 in its header, [source](https://arxiv.org/pdf/0804.1937v1).
- \[La24] Ruben La, *The Iwahori–Matsumoto dual for tempered representations of Lusztig’s geometric Hecke algebras*, arXiv:2403.14528v2 (14 August 2024), [source](https://arxiv.org/pdf/2403.14528v2).
- \[Ban02] Dubravka Ban, *The Aubert involution and R-groups*, Ann. Sci. ÉNS (4) 35 (2002), 673–693, [source](https://www.numdam.org/item/ASENS_2002_4_35_5_673_0.pdf).
- \[CiF4] Dan Ciubotaru, *The unitary I-spherical dual for split p-adic groups of type F4*, Author version, pp. 1–49; published Represent. Theory 9 (2005), 94–137, DOI 10.1090/S1088-4165-05-00206-2, [source](https://www.math.utah.edu/~ptrapa/math-library/ciubotaru/ciubotaru_F4.pdf).
- \[PD] TauCetiRoadmap contributors, *Polar decomposition: functional calculus, the operator modulus, and singular systems*, TauCetiRoadmap main 350e970ce49f707a327909beac0b7b7c782cc7ee, [source](https://github.com/TauCetiProject/TauCetiRoadmap/blob/350e970ce49f707a327909beac0b7b7c782cc7ee/TauCetiRoadmap/OperatorTheory/PolarDecomposition/README.md).
