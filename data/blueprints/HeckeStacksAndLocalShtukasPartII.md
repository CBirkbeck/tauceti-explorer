# Hecke correspondences and local shtuka cohomology, Part II

This roadmap plans the affine Deligne–Lusztig dimension direction of the Hecke/local-shtuka continuation. It begins with the relative Frobenius condition, separates exact and bounded spherical loci, establishes the spherical calculation through superbasic charts, and develops the two-correspondence reduction behind He’s shrunken-chamber theorem. The generic Hecke/cohomology infrastructure of the base roadmap is imported. Integral models, component theorems and the Kottwitz trace formula have separate proposed owners, with every routed item retained below.

The packet contains **48 targets**, **86 API entries**, **71 definition/construction tests** and **25 planets**. All nine stages are **planned**; none is closed. There are 8 explicit mathematical/supplier gates and 13 requests. “Complete” describes this target-level planning pass. No target is claimed implemented. The independent review accepts this corrected target-level pass; G1–G8 remain open and no stage is closed.

## Conventions and scope

Write F for a nonarchimedean local field with finite residue field, L for its completed maximal unramified extension, and σ for arithmetic Frobenius. The residue closure is k=overline(F_q). Fix a connected reductive group, a connected σ-stable Iwahori I, and the special-vertex affine Weyl datum. He’s flag calculation uses simple quasi-split G, the chamber opposite the base alcove, and translations acting by −λ. Then w=x t^λy with t^λy minimal in its left W₀-coset, ℓw=ℓx+ℓt^λ−ℓy, and η_σ(w)=σ⁻¹(y)x. These objects and identities are supplied by ReductiveGroupsPartII, not defined again here.

Use ≥_ℤ for a nonnegative integral simple-coroot difference, and ≥ for rational Newton dominance. The latter is compared only inside a matching integral Kottwitz component. Write λ^♦ for the based σ-average. The weight ρ satisfies 〈α∨,ρ〉=1; the coweight ρ∨ is a different object. Defect means rank_F G−rank_F J_b, using F-split ranks. Dimension takes values in ℚ∪{−∞}; empty dimension is −∞ and no subtraction of two infinite values is used.

The **equal-characteristic branch** uses F=F_q((t)), tame splitting and the good-characteristic adjoint reductions of He14. The **unramified spherical branch** uses a connected reductive O_F-model, K=G(O_L), and perfect k-algebras in mixed characteristic. These are alternatives, not simultaneous field hypotheses. General local-field flag statements are targets conditional on the explicit transfers G5/G7/G8. The classical reduced flag locus, a perfect spherical locus, a local-shtuka diamond and an integral shtuka model are distinct carriers. No comparison between them follows merely from a shared notation.

The double-flat construction and its factorization live in the full coweight lattice P∨. Fundamental coweights and the resulting γ need not lie in the original cocharacter lattice Y. A conclusion for the original group needs the component and integral-κ comparison G7. The generic root-data owner supplies dominance subtraction; it is the least dominant μ with μ+λ′≥_ℤλ in the specified coroot coset, rather than coordinatewise truncation. Its existence, monotonicity and associativity are requested in G1.

## Existing owners and the library boundary

Baseline commits: TauCeti `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`. The reviewed entries in `data/library-coverage.json` for the base Hecke, Newton and Satake directions were checked. The actual pinned declarations below supply the elementary set/coset carriers; they do not supply geometric ADLVs.

| Declaration | What is imported |
|---|---|
| `mathlib:DoubleCoset.doubleCoset` | The set s*{a}*t. |
| `mathlib:DoubleCoset.mem_doubleCoset` | Membership iff a product of an element of each side set with the middle representative. |
| `mathlib:QuotientGroup.leftRel_apply` | Left-coset equality is governed by x⁻¹*y∈I, without normality. |
| `tauceti:DoubleCoset.mul_mem_doubleCoset_iff` | Left multiplication by a subgroup element preserves subgroup double-coset membership. |
| `mathlib:Finset` | Finite subsets with duplicate-free multiset representatives; a carrier for residue bases, not a semi-module library. |

The current read-only upstream roadmap tree was checked at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current TauCeti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Searches included the nine roadmap directions newer than the atlas snapshot. RootSystems and ReductiveGroups supplied the principal style computations; the local/affine portion of ReductiveGroupsPartII and the LieHighestWeight boundary were also read.

| Owner | Exact boundary |
|---|---|
| ReductiveGroupsPartII RG2.1–RG2.4 | Apartment, root groups, connected parahorics, Iwahori–Weyl extension, Bruhat/length, normal form and η. Its current translation-length target already includes cordiality of x t^λ. |
| BunGAndNewtonStrata BG0/BG1 | B(G), σ-centralizers, integral κ, Newton maps, defect, order, Levi comparison, averages, straight classes and ordered norm/centralizer identities. Superbasic classification and cell purity require the stated extensions. |
| GeometricSatakeAndFusion GS0:Witt-geometry, GS1, GS2:correspondences | Perfect flag/Grassmannian carriers, generic flag incidence/fibre bounds, semi-infinite geometry and spherical stratified semismallness are imported. ADLV pullback compatibility and top attainment are checked here. |
| SchemeAndStackFoundations SF.0/SF.1/SF.2 | Schemes, algebraic spaces, descent and cohomology; SF.2 routes generic trace theory to CohomologicalPointCounting. Compatible bounded ADLV diagrams and the perfect-space trace application remain named requests. |
| RootSystems and proposed Part II | Generic Coxeter/root carriers. G1 requests the extra Demazure, twisted minimal-length and dominance-subtraction package; its proposed identifier is not a supplied stage. |
| SmoothRepresentationsOfLocalGroups SR.1 | Generic Hecke algebra. G3 requests the twisted cocenter extension; the geometric dimension=degree theorem belongs here. |
| HeckeStacksAndLocalShtukas HS0–HS4 | Generic Hecke functors, local-shtuka diamonds/towers and representation-valued cohomology. Those targets do not construct an integral special fibre or prove a classical ADLV dimension. |

Current upstream adds a promise absent from the atlas’s older translation-length node: cordiality of x t^λ (ReductiveGroupsPartII README, translation-length-formula, lines 5367–5384). This plan reuses it. The new family target here identifies its generic Newton class and constructs the geometric dictionary; it does not add a second cordiality theorem owner.

## Layers and targets

| Layer | Targets | Planets | Depends on own layers |
|---|---:|---:|---|
| HSD0: Affine Deligne–Lusztig loci and conventions | 6 | 4 | — |
| HSD1: Reduction and class-polynomial dimensions | 5 | 2 | HSD0 |
| HSD2: Superbasic lattice charts | 5 | 3 | HSD0 |
| HSD3: Spherical dimensions and the virtual upper bound | 9 | 3 | HSD0, HSD1, HSD2 |
| HSD4: Generic Newton classes and cordiality | 7 | 4 | HSD0, HSD1, HSD3 |
| HSD5: Double-flat bounds and factorization | 2 | 1 | HSD0 |
| HSD6: The two geometric correspondences | 4 | 2 | HSD0, HSD1, HSD5 |
| HSD7: Levi obstructions and basic seeds | 6 | 3 | HSD1, HSD4, HSD6 |
| HSD8: The shrunken nonemptiness and dimension theorem | 4 | 3 | HSD3, HSD7 |

Each target below gives its exact statement, assumptions, direct prerequisites, construction/proof strategy, source locator and Check. Definition and construction APIs are driven by their listed uses; tests are mathematical specifications until the carriers exist. Source statements are restated in our own words.

## HSD0 — Affine Deligne–Lusztig loci and conventions

Own the point condition, exact/bounded spherical loci, geometric realization, transport, virtual dimension and shrunkenness. Import the existing normal form, η, affine flag carrier, Newton invariants and split-rank defect.

### Affine Deligne–Lusztig points

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/point-locus` (definition). Planet: **Affine Deligne–Lusztig varieties**.

For a group H, an automorphism σ, a subgroup I with σ(I)=I and b,w∈H, set r_b(g)=g⁻¹bσ(g) and X_I(w,b)={gI : r_b(g)∈IwI}⊂H/I. This is a set of left cosets, without a normality assumption. For H=G(L) and w a chosen lift of an Iwahori–Weyl element this is X_w(b)(k).

**Hypotheses.** H is an arbitrary group, σ∈Aut(H), I≤H and σ(I)=I.

**Direct prerequisites.** `mathlib:DoubleCoset.doubleCoset`; `mathlib:DoubleCoset.mem_doubleCoset`; `mathlib:QuotientGroup.leftRel_apply`; `tauceti:DoubleCoset.mul_mem_doubleCoset_iff`.

**Plan.**

- Compute r_b(gi)=i⁻¹r_b(g)σ(i); subgroup double-coset invariance proves descent to H/I.
- Replacing w by i₁wi₂ leaves the set unchanged; use the existing double-coset carrier.

**Sources.** [he21] §2.2, p. 5 — The relative Frobenius condition defines the point set; its geometric structure is a separate construction.; [he14] Definition 1.1, p. 372 — The group expression is independent of the representative and carries a left centralizer action.

**Check.** No quotient group structure is assumed on H/I. Prove the representative criterion in both directions under σ(I)=I.

**Uses.**

- HSD0/geometric-realization and HSD6/endpoint-correspondence: Identifies geometric points and checks every endpoint formula.
- Proposed component continuation: Provides the shared point condition, without identifying a set with a geometric component functor.

**API.**

- `relativeFrobenius` (data): r_b(g)=g⁻¹bσ(g).
- `points` (constructor): A subset of H/I defined by a representative satisfying the double-coset condition.
- `mem_points_mk` (characterisation): gI∈X_I(w,b) iff r_b(g)∈IwI.
- `relativeFrobenius_mul` (compatibility): r_b(gi)=i⁻¹r_b(g)σ(i).
- `points_doubleCoset` (extensionality): Equal double cosets IwI give equal point loci.

**Unit tests.**

- `commutative_identity` (characterisation): For commutative H and σ=id, X_I(w,b) is all of H/I iff b∈IwI, and otherwise empty.
- `trivial_level` (degenerate): For I={1}, σ=id and b=1, the locus is all of H exactly when w=1; for w≠1 it is empty.
- `top_level` (degenerate): For I=H the unique left coset belongs to the locus for every b,w.
- `noncommutative_change` (computation): In S₃ with I={1}, σ=id, b=(12), the class of g=(123) belongs to the locus labelled g⁻¹bg=(13), and not to the locus labelled b.

### Virtual dimension

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/virtual-dimension` (definition). Planet: **Virtual dimension**.

In the imported unique normal form w=x t^λ y with t^λy minimal on the left, use the imported η_σ(w)=σ⁻¹(y)x and define d_w(b)=(ℓw+ℓη_σ(w)−def_G(b))/2−〈ν_b,ρ〉∈ℚ. Here 〈α∨,ρ〉=1 for a simple coroot and def_G(b)=rank_F G−rank_F J_b. Rational arithmetic is used before comparing with the extended dimension.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.4/dominant-normal-form`; `BunGAndNewtonStrata:BG0/defect`; `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`.

**Plan.**

- Import the normal form, η and rank defect instead of constructing a second root datum or B(G).
- Define the scalar expression over ℚ and its coercion to extended dimension.

**Sources.** [he21] §2.2, (2.1)–(2.2), p. 5 — The normal form and Frobenius inverse fix both the finite factor and the sign of the Newton term.

**Check.** No rounding or natural-number subtraction occurs. The defect uses split ranks over F, not absolute ranks or ranks over L.

**Uses.**

- HSD1/dimension-advantage: The b-dependent terms cancel in comparisons.
- HSD4/cordiality and HSD8/main-dimension: Identifies equality in the upper bound and the final formula.

**API.**

- `virtualDimension` (constructor): The displayed rational expression.
- `virtualDimension_class` (extensionality): It depends only on [b].
- `virtualDimension_difference` (compatibility): d_w(b)−d_v(b)=(ℓw+ℓηw−ℓv−ℓηv)/2.
- `virtualDimension_basic` (simp): For basic b the Newton pairing vanishes in the semisimple directions.
- `virtualDimension_product` (compatibility): For product data the expression is the sum of the factor expressions; this alone is not geometric transport.

**Unit tests.**

- `rank_one_identity` (computation): For split adjoint A₁, b=1 and w=s, ℓw=ℓη=1 and d_w(1)=1.
- `ordinary_translation` (computation): For split GL₂, λ=(1,0), w=t^λ and b=t^λ, the length 1 and pairing 1/2 give d=0.
- `basic_GL2` (computation): For GL₂ with slope-1/2 basic b, def=1. At w=s t^(1,0), lengths 2 and 1 give d=1.
- `twisted_factor` (computation): For type A₂ with σ swapping s₁,s₂ and x=s₁,y=s₂, η=σ⁻¹(s₂)s₁=1; replacing σ⁻¹(y) by y gives length 2 and changes d by 1.

### Shrunken Weyl chambers

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/shrunken` (definition). Planet: **Shrunken Weyl chambers**.

For the reduced relative root system and He’s apartment convention, remove the open critical strips {v:−1<〈α,v〉<0} for all positive roots α. A shrunken chamber is a connected component of the remaining subset. Say w is shrunken when its base-alcove image lies in such a component. This geometric hypothesis is retained independently of all lower bounds on λ_w^♦.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.1/apartment`; `ReductiveGroupsPartII:RG2.4/affine-tits-system`; `ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`.

**Plan.**

- Use the existing affine apartment and root pairings; define the removed subset and alcove containment.
- Translate root inequalities to the Iwahori–Weyl chamber convention only through an explicit orientation comparison.

**Sources.** [he21] §2.2, p. 5; Theorem 6.1 and Corollary 6.4, pp. 13–14 — Removing the critical strips is a separate chamber condition in both final results.; [he15] §2.9.4, PDF pp. 36–37 — The strip convention is −1<〈α,v〉<0.

**Check.** Neither a large dominant cocharacter nor full finite support is accepted as a replacement for shrunkenness.

**Uses.**

- HSD6/cordial-reduction: Hypothesis for the length identities in the two-correspondence argument.
- HSD8/main-criterion: A required input of the nonemptiness and dimension theorem.

**API.**

- `criticalStrip` (constructor): The open strip for each positive reduced relative root.
- `shrunkenChambers` (constructor): Connected components after deleting the union of strips.
- `isShrunken` (characterisation): The whole alcove w·a lies in one such component.
- `shrunken_sigma` (compatibility): The based σ-action preserves the condition.
- `shrunken_chamber_transport` (equivalence): Transport requires the specified apartment and base-alcove orientation.

**Unit tests.**

- `A1_strip` (non-example): In A₁ a test alcove whose α-values lie in (−1,0) is rejected.
- `A1_outside` (computation): Alcoves with α-values wholly in (0,1) or in (−2,−1) lie outside the A₁ critical strip.
- `wall_endpoints` (non-example): The boundary hyperplanes with α=0 or α=−1 are not removed; replacing the open strip by a closed one is a wrong definition.
- `independent_bound` (non-example): In split adjoint A₂ take ν=0 and λ=6ω₁∨=4α₁∨+2α₂∨. Then λ≥_ℤ2ρ∨, but 〈α₂,λ〉=0, so t^λ preserves the base alcove’s α₂-critical strip and is not shrunken.

### Exact and bounded spherical loci

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci` (construction). Planet: **Spherical affine Deligne–Lusztig loci**.

For the hyperspecial affine Grassmannian Gr_G and dominant μ, construct the functor X_≤μ(b)(R) of modifications (E,β) with Inv_x(β⁻¹bσ(β))≤_ℤμ at every geometric point x of Spec R. The exact equality condition defines X_μ(b). In the equal-characteristic scheme setting take the reduced loci; in mixed characteristic take perfect spaces. On k-points these are the closed K-double-coset union and the exact Kt^μK condition, respectively.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/point-locus`; `GeometricSatakeAndFusion:GS0:Witt-geometry`; `ReductiveGroupsPartII:RG2.4/dominant-coinvariant-cocharacters`.

**Plan.**

- Pull back the relative-position strata along the bσ graph in the supplied Grassmannian.
- Use closedness of ≤μ and openness of equality inside it; the admissible union is not a single double coset.

**Sources.** [zhu17] §3.1.1, (3.1.1)–(3.1.2), p. 455; Lemma 1.22, p. 428 — Use the torsor functor and geometric-point bounds to distinguish a closed union from an exact stratum.

**Check.** The symbol X_μ always means the exact stratum here. The component continuation must give an explicit dictionary to GLX notation, where X_μ denotes a closed union.

**Uses.**

- HSD3/spherical-dimension: The final theorem states the exact and closed versions with their nonemptiness conditions.
- HSD3/iterated-locus: The endpoint square uses the bound and its exact strata.

**API.**

- `boundedLocus` (constructor): The functor of relative-position bounds at every geometric point.
- `exactLocus` (constructor): The open equality locus in the bound.
- `boundedLocus_points` (characterisation): k-points are ⋃_(λ≤_ℤμ) X_λ(b)(k).
- `exact_into_bounded` (coercion): A canonical locally closed immersion X_μ(b)→Gr_G factoring through X_≤μ(b).
- `bounded_monotone` (functoriality): μ≤_ℤμ′ gives the inclusion of bounded loci.

**Unit tests.**

- `torus_mismatch` (non-example): For G=G_m, μ=0 and b=ϖ, both loci are empty since valuation is 1, although the numerical dimension expression is 0.
- `strict_union` (computation): For GL₂, b=1 and μ=(1,−1), the identity point lies in X_0(1)⊂X_≤μ(1) but not in X_μ(1).
- `central_bound` (degenerate): For a torus, the dominance interval has one element, so the exact and bounded loci coincide.
- `base_category` (non-example): For k of characteristic p, the k-algebra k[ε]/(ε²) is not perfect, because its nonzero ε has ε^p=0; it is outside the mixed-characteristic perfect functor’s domain.

### Geometric realization and dimension of ADLVs

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization` (construction).

Construct X_w(b) as a reduced locally closed locus of the affine flag ind-scheme in the He14 equal-characteristic setting, locally of finite type and of finite dimension. For the unramified mixed-characteristic spherical loci construct locally perfectly finite type spaces. Dimension is the supremum on bounded finite-type models, valued in ℚ∪{−∞}, with dim ∅=−∞. Show independence of a finite-type deperfection, invariance under universal homeomorphisms and the bounded fibre estimates actually used below. A perfect space of positive dimension is not asserted finite type.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. For the second branch use a connected reductive O_F-model with K=G(O_L), evaluating on perfect k-algebras in mixed characteristic; this replaces the equal-characteristic branch.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/point-locus`; `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci`; `GeometricSatakeAndFusion:GS0:Witt-geometry`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.1`; `SchemeAndStackFoundations:SF.0/fibre-dimension-formula`.

**Plan.**

- Use the supplied flag/Grassmannian geometry; identify the reduced pullback with the point condition.
- Descend bounded perfect diagrams to compatible finite-type models and use the topological invariance of Krull dimension.
- For a surjective morphism on bounded models with every geometric fibre of dimension ≥n, prove dim(source)≥dim(target)+n at generic points; pass to the supremum. G2 records the missing compatibility proof, not global component finiteness.

**Sources.** [he14] Definition 1.1 and §1.3, pp. 371–372 — The flag locus is finite-dimensional and locally of finite type, rather than globally quasi-compact.; [zhu17] §3.1.1, p. 455; Definition A.13 and Proposition A.15–Corollary A.16, pp. 471–472 — Finite-type models and perfection provide the mixed-characteristic dimension framework.

**Check.** Bounded exhaustion and independence proofs must precede the inequalities in HSD6. General ramified perfect flag geometry is a separate scope transfer G5; the unramified spherical construction does not supply it.

**Uses.**

- HSD1/reduction-geometry: Universal homeomorphisms and one-dimensional pieces give the recurrence.
- HSD6/correspondence-dimensions and HSD3/convolution-estimate: Applies dimension estimates on bounded diagrams and exact strata.

**API.**

- `pointRealization` (characterisation): Geometric points agree with the point locus and the spherical torsor conditions.
- `bounded_exhaustion` (structure): Closed bounded pieces exhaust the locally finite type locus.
- `dimension_empty` (simp): The empty locus has dimension −∞.
- `dimension_perfection` (compatibility): A finite-type model and its perfection have the same dimension.
- `dimension_universalHomeomorphism` (equivalence): A universal homeomorphism preserves dimension.
- `bounded_fibre_lower_bound` (compatibility): Surjectivity and a uniform geometric fibre lower bound give the stated dimension lower bound, with finite-type hypotheses explicit.

**Unit tests.**

- `affine_line_perfection` (computation): The perfection of A¹ has dimension 1 even though it is not finite type.
- `infinite_components` (non-example): For a split torus with b=1, μ=0, the spherical locus is an infinite discrete set of dimension 0; no global finite-component axiom is allowed.
- `empty_dimension` (degenerate): An empty torus mismatch has dimension −∞, not 0.
- `relative_fibres` (compatibility): A product Y×Aⁿ→Y on finite-type models has dimension dim Y+n, including after perfection.

### Change of framing, centralizers and Kottwitz obstruction

Target: `HeckeStacksAndLocalShtukasPartII:HSD0/transport` (theorem).

For b′=h b σ(h)⁻¹, left multiplication gI↦hgI identifies X_w(b) with X_w(b′); for j∈J_b(F) it acts on X_w(b). These maps extend to the geometric realizations and respect spherical bounds. Nonemptiness implies κ_G(b)=κ_G(w) (or κ_G(b)=μ^natural in the spherical case).

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`; `BunGAndNewtonStrata:BG1/newton-and-kottwitz-maps`; `ReductiveGroupsPartII:RG2.4/kottwitz-quotient`.

**Plan.**

- Compute (hg)⁻¹b′σ(hg)=g⁻¹bσ(g).
- Apply the integral Kottwitz homomorphism to g⁻¹bσ(g) and take σ-coinvariants; I lies in its kernel.

**Sources.** [he14] §1.3, p. 372 and proof of Theorem 4.8, pp. 382–383 — Framing changes and centralizer actions follow from the relative Frobenius identity.; [he21] §6.2, p. 13 — The integral Kottwitz invariant is a necessary condition.

**Check.** Retain torsion in κ; equality only after tensoring with ℚ does not suffice. For the diagonal torus in GL₂ the two permutations of diag(ϖ,1) illustrate why a G-class can meet several Levi classes.

## HSD1 — Reduction and class-polynomial dimensions

Reduce to minimal twisted length; calculate terminal loci; prove the geometric two-branch recurrence, dimension=degree and the dimension-advantage relation. Generic Red-Min and cocenter algebra stay with suppliers.

### Reduction to minimal twisted length

Target: `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-reduction` (theorem).

Every w admits a chain of length-nonincreasing moves w↦s w σ(s), ending at an element minimal in its σ-conjugacy class. Minimal elements of a fixed class are linked by the appropriate strong twisted conjugacy relation. Separate the finite extended Weyl-group combinatorics from the geometry of a chosen lift.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`; `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`.

**Plan.**

- Import the generic Red-Min theorem requested in G1; termination alone does not prove that every terminal element is globally minimal.
- Use the extended semidirect product to encode σ and retain the component invariant.

**Sources.** [he21] Theorem 3.1, p. 6 — The reduction terminates at minimal twisted length.; [hn14] Theorem 2.9 and Corollary 2.10, PDF pp. 10–12; Theorem 5.3, PDF p. 26 — Use the twisted extended-group formulation, including length-zero automorphisms.

**Check.** Do not cite the ordinary finite Coxeter subword theorem as Red-Min. Prove the orientation of the two-sided move agrees with arithmetic Frobenius.

### Minimal-length affine Deligne–Lusztig loci

Target: `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry` (theorem).

If w is minimal in its σ-conjugacy class in the extended affine Weyl group, then X_w(b) is nonempty iff [b]=[ẇ], and in that case dim X_w(b)=ℓw−〈ν_b,2ρ〉. Representatives of the same Weyl-group class are compared in B(G), not identified as group elements.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-reduction`; `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `BunGAndNewtonStrata:BG1/straight-weyl-classification`; `ReductiveGroupsPartII:RG2.3/lang-for-pro-algebraic-groups`.

**Plan.**

- Use the straight–finite-parabolic decomposition, whose missing generic root-theoretic contract is in G1.
- The finite parabolic Lang calculation supplies nonemptiness and the length contribution; transport the lift through B(G).

**Sources.** [he21] Theorem 3.2, p. 6 — Minimal elements give the terminal geometric calculation.; [he14] Theorem 4.8, pp. 382–383 — Reduce a minimal element to a straight part and a finite parabolic part, then use Lang surjectivity.

**Check.** The theorem is geometric in the He14 setting; a mixed-characteristic generalization requires G5.

### Deligne–Lusztig reduction and dimension recurrence

Target: `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry` (theorem).

Length-preserving simple σ-conjugations induce universal homeomorphisms between the corresponding reduced ADLVs. If ℓ(s w σ(s))=ℓw−2, decompose X_w(b) into a closed piece universally homeomorphic to an A¹-fibration over X_(s w σ(s))(b) and an open piece universally homeomorphic to a G_m-fibration over X_(s w)(b). Thus dim X_w(b)=1+max(dim X_(s w)(b),dim X_(s w σ(s))(b)), with −∞ conventions.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-reduction`; `ReductiveGroupsPartII:RG2.4/simple-cell-multiplication`.

**Plan.**

- Apply simple-cell multiplication to the endpoint correspondence; keep the open and closed cases separate.
- Descend the universal-homeomorphism diagrams to bounded models before applying dimension.
- Record the extension from the split source to the stated σ-action as G5 until checked.

**Sources.** [gh10] Proposition 2.5.2 and Corollary 2.5.3, PDF pp. 7–9 — The split equal-characteristic endpoint-fibre calculation gives the two pieces.; [he21] Proposition 3.3, p. 6 — The σ-twisted dimension recurrence is the form used here.

**Check.** Empty terms remain −∞. A length-preserving move changes neither nonemptiness nor dimension; it does not automatically preserve η.

### Class polynomials detect dimension and nonemptiness

Target: `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension` (theorem). Planet: **Dimension equals degree**.

Given the σ-twisted affine-Hecke cocenter basis T_O and expansion T_w=Σ_O f_(w,O)(v−v⁻¹)T_O with nonnegative integral class polynomials, define deg 0=−∞. Then dim X_w(b)=max_(O mapping to [b]) ((ℓw+ℓO+deg f_(w,O))/2−〈ν_b,2ρ〉). In particular X_w(b) is nonempty iff at least one such polynomial is nonzero. The generic cocenter and its recursion are supplier obligations, not newly owned objects here.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry`; `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`; `BunGAndNewtonStrata:BG1/straight-weyl-classification`; `SmoothRepresentationsOfLocalGroups:SR.1`.

**Plan.**

- Request the genuine cocenter basis, its integral positivity and degree recursion in G3.
- Induct along Red-Min and compare the polynomial and geometric max recurrences, with the same σ-conjugacy-to-B(G) map.

**Sources.** [he14] §2.2–§2.5, pp. 374–376; Theorem 6.1 and Corollary 6.2, pp. 387–388 — Positivity, the minimal-class normalization and the reduction recurrence give dimension=degree.

**Check.** The index includes every Weyl-group class mapping to [b]; it is not a sum over B(G) alone. No polynomial degree is assigned a finite value for zero.

### Universal dimension advantage

Target: `HeckeStacksAndLocalShtukasPartII:HSD1/dimension-advantage` (definition). Planet: **Dimension advantage**.

Define w⇒_σv when for every [b] with X_v(b) nonempty, X_w(b) is nonempty and dim X_w(b)−dim X_v(b)≥(ℓw+ℓηw−ℓv−ℓηv)/2. This implication formulation avoids subtracting −∞. It is equivalent to comparing dim X−d in the extended order. The relation is reflexive and transitive; length-preserving reduction equivalence together with ℓηw≤ℓηv implies w⇒_σv.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/virtual-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`.

**Plan.**

- Define the relation using the implication and rational inequality.
- Cancel virtual dimensions for the equivalent form; prove composition by addition when the right-hand locus is nonempty.

**Sources.** [he21] §3.3, p. 6 — The relation quantifies over all σ-conjugacy classes and cancels the b-dependent Newton and defect terms.

**Check.** Never cancel two occurrences of −∞. Check the inequality direction on length-preserving moves.

**Uses.**

- HSD6/cordial-reduction: Expresses the output of both correspondences.
- HSD8/main-dimension: Transports an exact virtual dimension from a cordial locus to w.

**API.**

- `dimensionAdvantage` (relation): The displayed condition for every [b].
- `advantage_iff_virtual` (characterisation): Comparison of dim−d with explicit empty-locus convention.
- `advantage_refl_trans` (structure): A preorder, not an asserted antisymmetric order.
- `advantage_reduction` (compatibility): Reduction equivalence plus the stated η inequality supplies advantage.

**Unit tests.**

- `reflexivity` (degenerate): Every w has advantage over itself, including when all tested loci are empty.
- `empty_right` (degenerate): A class with X_v empty imposes no condition; it must not force X_w empty.
- `eta_direction` (computation): If ℓw=ℓv and dimensions agree, ℓηw≤ℓηv is the direction that permits w⇒v.
- `transitive` (compatibility): If w⇒v⇒u and X_u(b) is nonempty, add the two rational length differences to obtain w⇒u.

## HSD2 — Superbasic lattice charts

Plan normalized semi-modules, extended semi-modules, their lattice strata and charts, and the superbasic GL dimension formula with a central-shift comparison.

### Normalized semi-modules and their types

Target: `HeckeStacksAndLocalShtukasPartII:HSD2/semimodule` (definition). Planet: **Semi-modules**.

Fix h≥1 and m≥1 with gcd(m,h)=1. A semi-module is a nonempty subset A⊂ℤ, bounded below and stable under adding m and h. Its residue basis B=A∖(h+A) has one element in every residue class modulo h. It is normalized when ΣB=h(h−1)/2. For b₀=min B, enumerate b_i=b_(i−1)+m−μ′_i h through B, with b_h=b₀ and each μ′_i maximal subject to membership in A. This defines the type μ′ with the specified starting convention.

**Hypotheses.** h≥1, m≥1, gcd(m,h)=1; a central shift makes the relevant Hodge entries nonnegative and m positive.

**Direct prerequisites.** `mathlib:Finset`.

**Plan.**

- Prove existence and uniqueness of the residue basis, then the unique integral translation normalizing its sum.
- Use coprimality for the cycle enumeration and recover A from B+hℕ.

**Sources.** [vie06] Definition 3.1 and Lemmas 3.2–3.3, PDF pp. 3–4 — The normalization removes the translation ambiguity in a lattice valuation set.

**Check.** Keep μ increasing as in Viehmann until the explicit conversion to the dominant descending convention.

**Uses.**

- HSD2/extended-semimodule: Supplies the lattice-leading-index carrier.
- HSD2/chart-dimension: Bounds the possible chart types at fixed Hodge data.

**API.**

- `SemiModule` (structure): The nonempty subset with boundedness and both stability conditions.
- `residueBasis` (projection): The h-element set B.
- `normalize` (constructor): The unique translated normalized semi-module.
- `type` (data): The cyclic enumeration and integer tuple μ′.
- `reconstruct` (characterisation): A=B+hℕ with the specified normalization and cycle.

**Unit tests.**

- `rank_one` (degenerate): For h=1,m≥1 the normalized semi-module is ℕ.
- `coprime_small` (computation): For h=2,m=1, A=ℕ has B={0,1}, normalized sum 1, and type (0,1).
- `stability_failure` (non-example): The even nonnegative integers fail stability under m=1 and are not a semi-module for (m,h)=(1,2).
- `translation` (compatibility): A=1+ℕ has basis sum 3 for h=2; its normalization is ℕ, not A itself.
- `empty_exclusion` (non-example): The empty subset is bounded below and stable under both additions, but is not a semi-module and has no h-element residue basis.

### Extended semi-modules

Target: `HeckeStacksAndLocalShtukasPartII:HSD2/extended-semimodule` (definition). Planet: **Extended semi-modules**.

For a normalized semi-module A and a nonnegative increasing h-tuple μ of sum m, an extended semi-module is φ:ℤ→ℕ∪{−∞} with φ(a)=−∞ iff a∉A; φ(a+h)≥φ(a)+1; φ(a)≤max{n:a+m−nh∈A}, with equality whenever every integer ≥a belongs to A; and a decomposition of A into h increasing infinite sequences along which φ increases by 1. A successor is a+h when φ(a+h)=φ(a)+1 and is >a+h otherwise. The multiset of initial values is μ. It is cyclic when the displayed upper bound is an equality for every a∈A.

**Hypotheses.** The hypotheses of HSD2/semimodule hold; μ is increasing, nonnegative, and Σμ=m.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD2/semimodule`.

**Plan.**

- Package the finite-type data and the required decomposition, without choosing arbitrary ordered labels on equal initial values.
- Prove only finitely many extended semi-modules occur at fixed μ, using the cited boundedness arguments.

**Sources.** [vie06] Definition 3.4 and Lemmas 3.6–3.8, PDF pp. 3–4 — All sequence and eventual-equality conditions are needed; the two inequalities alone do not define the intended object.

**Check.** The maximum is over integers n≥0 only when a∈A; outside A the value is −∞.

**Uses.**

- HSD2/lattice-strata: Labels the finite stratification.
- HSD2/chart-dimension: The finite set V counts chart parameters.

**API.**

- `ExtendedSemiModule` (structure): A, φ, the inequalities and sequence-decomposition property.
- `cyclic` (characterisation): Equality in the upper bound everywhere on A.
- `finite_types` (structure): Finitely many extended types for a fixed μ.
- `from_lattice` (constructor): The leading-index and Frobenius-divisibility construction of HSD2/lattice-strata.
- `valuation_pairs` (data): V(A,φ)={(a,b)∈A²:b>a, φ(a)>φ(b)>φ(a−h)}.

**Unit tests.**

- `cyclic_small` (computation): For A=ℕ,h=2,m=1, φ(a)=⌊(a+1)/2⌋ on A and −∞ elsewhere gives type (0,1).
- `growth_failure` (non-example): The constant function 0 on A fails φ(a+h)≥φ(a)+1.
- `outside_failure` (non-example): Giving a finite value at −1 for A=ℕ violates the support condition.
- `finite_pairs_small` (computation): For the cyclic small example the set V is empty, so its chart dimension is 0.

### Superbasic GLₕ lattice stratification

Target: `HeckeStacksAndLocalShtukasPartII:HSD2/lattice-strata` (construction).

For b(e_i)=e_(i+m), e_(i+h)=ϖe_i and gcd(m,h)=1 with m>0, assign to a lattice M its set A(M) of leading indices. Set φ_M(a)=−∞ off A(M); on A(M) set φ_M(a)=max{n≥0: some v∈M of leading index a has ϖ^(−n)bσ(v)∈M}. On the determinant-zero component A(M) is normalized, and the exact Hodge locus of increasing type μ is the finite disjoint union of its locally closed extended-semi-module strata S_(A,φ). The shift e_i↦e_(i+1), commuting with bσ, transports determinant components. Finiteness is asserted on each fixed determinant component, not on the entire locus.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras. Here G=GL_h, b is the displayed superbasic shift, and a central shift makes μ nonnegative.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci`; `HeckeStacksAndLocalShtukasPartII:HSD2/extended-semimodule`; `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`.

**Plan.**

- Prove the lattice conditions give every clause of the extended semi-module definition.
- Construct bounded locally closed strata using coefficient conditions, then prove finite exhaustion and determinant transport.
- The mixed-characteristic chart morphisms require G4, not merely a bijection of residue-field points.

**Sources.** [vie06] §2, PDF p. 2; §4, PDF pp. 5–8 — The leading-term construction provides the geometric stratification in equal characteristic.; [zhu17] End of the proof of Proposition 3.3, p. 460 — Zhu invokes an adaptation of Viehmann’s argument here, without giving Teichmüller chart equations. Constructing those perfect chart morphisms and proving their dimension comparison remains G4.

**Check.** A(M) uses a fixed leading-index convention. No assertion that every arbitrary pair (A,φ) has a stratum of the expected dimension is made without the chart theorem.

**Uses.**

- HSD2/chart-dimension: Reduces dimension to a finite maximum over the strata.

**API.**

- `leadingIndices` (data): The valuation support A(M).
- `divisibilityFunction` (data): The function φ_M with the displayed maximum.
- `stratum` (constructor): The reduced/perfect locally closed locus with fixed (A,φ).
- `stratum_points` (characterisation): The lattice assignment has that exact fibre.
- `finite_partition` (structure): Finite disjoint stratification of the fixed determinant component.
- `shift_component` (equivalence): The centralizer shift identifies successive determinant components.

**Unit tests.**

- `standard_lattice` (computation): For h=2,m=1, the standard lattice has A=ℕ and φ(a)=⌊(a+1)/2⌋.
- `shift_volume` (compatibility): Shifting leading indices by 1 changes ΣB by h and the determinant component by one.
- `central_shift` (compatibility): Replacing b by ϖb and μ by μ+(1,…,1) preserves A and adds 1 to φ on A.
- `noncoprime_exclusion` (non-example): The shift with h=2,m=2 is not covered by the superbasic chart theorem.

### Dimensions of superbasic lattice charts

Target: `HeckeStacksAndLocalShtukasPartII:HSD2/chart-dimension` (theorem).

For every occurring extended semi-module (A,φ), V(A,φ) is finite and there is a nonempty open U⊂A^V mapping to S_(A,φ), with the coefficient construction inducing a bijection on algebraically closed points. Prove from this construction, finite-type models and the requisite radicial/universal-homeomorphism argument that dim S_(A,φ)=|V|. For a cyclic extended semi-module U is all of A^V. Consequently dim X_μ(b) on each determinant component is max |V|.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras. Use the superbasic GL_h datum of HSD2/lattice-strata.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD2/lattice-strata`; `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`.

**Plan.**

- Read the triangular coefficient recursion as a morphism, not merely a parametrization of points.
- Establish the geometric comparison in G4 before concluding equality of dimensions in mixed characteristic.

**Sources.** [vie06] Theorem 4.3, PDF pp. 5–8 — The coefficient equations and their recursion give the open chart.; [zhu17] End of the proof of Proposition 3.3, p. 460 — Zhu invokes an adaptation of Viehmann’s argument here, without giving Teichmüller chart equations. Constructing those perfect chart morphisms and proving their dimension comparison remains G4.

**Check.** A set-theoretic bijection alone is not a dimension proof. Take the maximum only after proving the finite stratification.

### The superbasic GLₕ dimension formula

Target: `HeckeStacksAndLocalShtukasPartII:HSD2/superbasic-dimension` (theorem). Planet: **Superbasic dimension formula**.

For the superbasic shift of slope m/h, and a dominant μ in the matching determinant component with X_μ(b) nonempty, dim X_μ(b)=〈ρ,μ−ν_b〉−(h−1)/2. In Viehmann’s increasing convention ρ=((1−h)/2,(3−h)/2,…,(h−1)/2). Every extended semi-module has |V| at most this value, and the cyclic type μ attains it. A central shift removes the nonnegativity restriction on μ.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras. Use the superbasic GL_h datum and the chart-transfer gate G4.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD2/chart-dimension`; `BunGAndNewtonStrata:BG0/defect`.

**Plan.**

- Prove the finite combinatorial bound by the inversion count and compare to the cyclic case.
- Convert the increasing convention to the chosen descending dominance convention and use def(b)=h−1.

**Sources.** [vie06] Proposition 5.2 and Theorem 5.3, PDF pp. 8–9, with proof through p. 12 — The combinatorial upper bound and the cyclic chart give the two inequalities.; [zhu17] End of the proof of Proposition 3.3, p. 460 — Zhu invokes an adaptation of Viehmann’s argument here, without giving Teichmüller chart equations. Constructing those perfect chart morphisms and proving their dimension comparison remains G4.

**Check.** For h=2,m=1, μ=(0,1) in increasing order gives dimension 0; μ=(−1,2) gives dimension 1. For h=3,m=4, μ=(0,0,4) gives dimension 3. Central shift (m,μ)↦(m+h,μ+(1,…,1)) preserves the result.

## HSD3 — Spherical dimensions and the virtual upper bound

Use unipotent loop geometry, Levi and componentwise adjoint reduction, superbasic classification, ordered norm geometry and exact-stratum convolution to prove the spherical/iterated formulas and the flag upper bound.

### Unipotent loop geometry in the Levi reduction

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison` (theorem).

For the Newton Levi M and its parabolic unipotent radical N, establish the equal- and mixed-characteristic loop-space comparison needed for the twisted Lang-map fibre calculation. Where an M-equivariant F-scheme identification N≃Lie N is used, obtain it with its exact hypotheses from the reductive-group owner; in mixed characteristic it is not an identification of k-ind-schemes. Prove the required admissibility and dimension statements for the resulting p-adic loop spaces, and the finite fixed-point calculation used in GHKR Lemma 5.4.3 by the perfect-space trace argument. More precisely, for m∈M(L) with M-dominant Newton point ν_M, the map f_m(n)=n⁻¹mσ(n)m⁻¹ on N(L) is surjective, inverse images of admissible subsets are ind-admissible, and dim f_m⁻¹(Y)−dim Y=Σ_(α∈R_N) min(〈α,ν_M〉,0)=〈ρ,ν_M−ν_G〉. Prove the same normalized formula on the perfect models used in the Levi reduction; ν_G is the G-dominant representative.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.3/parahoric-subgroup`; `SchemeAndStackFoundations:SF.0`; `SchemeAndStackFoundations:SF.2`; `GeometricSatakeAndFusion:GS0:Witt-geometry`; `ReductiveGroupsPartII:RG2.3`.

**Plan.**

- Separate the generic equivariant-linearization supplier from the new loop-space construction.
- Check that coefficient truncations define admissible perfect morphisms and that the dimension correction is the root-slope sum.
- Request the perfect-space trace input and its hypotheses explicitly in G4.

**Sources.** [zhu17] Proof of Theorem 3.1, §3.1.2, pp. 456–457 — The N-versus-Lie N argument is made over F before passing to p-adic loop spaces.; [ghkr06] Proposition 5.3.1, PDF pp. 19–21; Lemma 5.4.3, PDF pp. 27–28 — The twisted Lang map and fixed-point calculation are proof inputs of the Levi formula.

**Check.** This is a geometric proof obligation, not a consequence of an abstract bijection N(F)≃Lie N(F). No all-characteristic equivariant-linearization theorem is presumed without checking its hypotheses.

### Iterated spherical affine Deligne–Lusztig loci

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/iterated-locus` (construction). Planet: **Iterated affine Deligne–Lusztig loci**.

Fix a local field E, d≥1, dominant bounds μ₁,…,μ_d and b∈G(L_E). Construct the perfect locus of O_(L_E)-torsors E₀,…,E_d, with E_d=σ_E^*E₀, modifications Φ_i:E_i[1/ϖ]≃E_(i−1)[1/ϖ] bounded by μ_i, and a generic-fibre framing β:E₀[1/ϖ]≃E_triv[1/ϖ] satisfying βΦ₁⋯Φ_d=bσ_E(β). For GL_h these torsors are lattices. Equivalently take the fibre product of the convolution Grassmannian’s endpoint map with the bσ_E graph. Keep exact endpoint strata X_λ(b) separate from X_≤Σμ(b).

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci`; `GeometricSatakeAndFusion:GS2:correspondences/convolution-diagram`.

**Plan.**

- Form the supplied convolution diagram and its endpoint pullback.
- Use the torsor description to compare the two functors and retain the order of all modifications.

**Sources.** [zhu17] §3.1.3, Proposition 3.3 and diagrams (3.1.4)–(3.1.5), pp. 457–458 — The chain construction is a Frobenius-graph pullback of convolution.

**Check.** The graph square uses the specified Frobenius power. A bound on a convolution fibre is applied over an exact endpoint stratum.

**Uses.**

- HSD3/norm-geometry: The restriction-of-scalars locus becomes an iterated locus.
- HSD3/convolution-estimate: The endpoint stratification controls its dimension.

**API.**

- `iteratedLocus` (constructor): The chain and Frobenius framing functor.
- `iteratedLocus_graph` (universal-property): The cartesian endpoint square.
- `forget_intermediates` (projection): The proper map to X_≤Σμ(b).
- `one_step` (equivalence): For d=1 recover the bounded spherical locus.
- `exact_endpoint` (relation): The λ-endpoint fibre is the pullback over X_λ(b).

**Unit tests.**

- `one_step` (degenerate): d=1 gives the original bound, with no extra intermediate parameter.
- `central_chain` (degenerate): For a torus the only possible endpoint is Σμ and the convolution fibre is a point.
- `order` (non-example): Interchanging noncommuting modification matrices changes the chain product; no commutative product convention is allowed.
- `exact_vs_closed` (non-example): For GL₂ a smaller endpoint λ<Σμ is not assigned the top-endpoint fibre dimension 0.
- `degree_three_cycle` (non-example): For a degree-3 unramified restriction, (σb)_τ₀=σ(b_(σ⁻¹τ₀)); use τ₁=σ⁻¹τ₀. The opposite cycle fails even though degrees 1 and 2 cannot detect it.

### Spherical Levi fibres and dimension reduction

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/levi-reduction` (theorem). Planet: **Levi reduction**.

Let M be a standard Levi, P=MN, and b∈M(L) basic in M, with M-dominant Newton point ν_M and G-dominant representative ν_G. Let S_M(μ,κ_M(b)) be the finite set of M-dominant relative positions occurring under the Iwasawa retraction of Gr_μ and having κ_M=κ_M(b). Put d(μ,μ_M)=dim(N(L)t^(μ_M)K/K∩Gr_μ). The retraction is a morphism on suitable locally closed pieces; over x∈X^M_(μ_M)(b) its fibre has dimension d(μ,μ_M)+〈ρ,ν_M−ν_G〉−〈2ρ_N,ν_M〉. Thus dim X^G_μ(b) is the maximum of dim X^M_(μ_M)(b)+this correction over nonempty terms indexed by S_M(μ,κ_M(b)). Use d≤〈ρ,μ+μ_M〉−〈2ρ_M,μ_M〉, with equality for an M-maximal μ_M. For M=Cent_G(ν_b), choose the representative basic in M and ν_M=ν_G.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras. The representative b lies in M(L) and is basic in M; retain κ_M(b) when indexing the retraction strata.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `BunGAndNewtonStrata:BG1/general-levi-newton-comparison`; `GeometricSatakeAndFusion:GS1`; `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison`; `GeometricSatakeAndFusion:GS1/semi-infinite-affineness`.

**Plan.**

- Use the supplied semi-infinite intersection geometry and its exact relative positions.
- Apply the twisted Lang map on N and calculate its dimension shift using root slopes.
- Stratify the image and apply fibre dimension on finite-type models; the theorem needs the perfect analogue in G4.

**Sources.** [ham15] Definition 2.5, Definition 2.7, Lemma 2.8 and Proposition 2.9, pp. 12809–12811 — The retraction strata and fibre corrections give the dimension maximum.; [ghkr06] Proposition 5.6.1 and Theorem 5.8.1, PDF pp. 29–32 — The semi-infinite intersection estimate is the geometric input.; [zhu17] §3.1.2, pp. 456–457 — Apply the Levi reduction to the Newton centralizer.

**Check.** All correction terms are retained before specializing to the Newton Levi. Empty Levi strata do not contribute to the maximum.

### Unramified norm and iterated-locus comparison

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/norm-geometry` (theorem).

Let E/F be unramified of degree d and G=Res_(E/F)H. Order embeddings τ_i=σ^(−i)τ₀, write b=(b₀,…,b_(d−1)), and use the already owned ordered norm Nm(b)=b₀σ(b₁)⋯σ^(d−1)(b_(d−1)), with σ_E=σ^d. Construct an isomorphism from X^G_≤μ(b) to the iterated H-locus with these framed modifications and bounds (μ_τ₀,σμ_τ₁,…,σ^(d−1)μ_τ_(d−1)). Import the B(G) norm, centralizer and defect comparison rather than redefining them; verify the ρ-pairing identity needed for dimension.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD3/iterated-locus`; `BunGAndNewtonStrata:BG1/product-and-unramified-norm`.

**Plan.**

- Write the d transition equations and eliminate successively, preserving multiplication order.
- Construct the inverse on torsors and descent data, not only on algebraically closed points.
- Use the imported centralizer isomorphism to compare F-split defects.

**Sources.** [zhu17] Lemma 3.5 and Lemma 3.7, p. 459 — Eliminating intermediate Frobenius factors gives the ordered norm and the dimension pairing.

**Check.** At d=1 both functor and norm comparisons are identities. At d=2 the norm is b₀σ(b₁), not σ(b₁)b₀. Absolute ranks cannot replace split ranks in the defect. In degree 3 the component formula is (σb)_τ₀=σ(b_(σ⁻¹τ₀)); this fixes τ_i=σ^(−i)τ₀ and detects the printed opposite cycle.

### Convolution bounds on exact endpoint strata

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate` (theorem).

For dominant μ• and λ≤_ℤΣμ_i, the supplied convolution map has fibres over Gr_λ of dimension at most 〈ρ,Σμ_i−λ〉. Pulling back over the exact X_λ(b), this bounds the iterated ADLV piece by dim X_λ(b)+〈ρ,Σμ_i−λ〉. Prove separately that the top endpoint λ=Σμ_i is nonempty when its ADLV is nonempty and that its convolution fibre has dimension 0, giving the lower bound required for the iterated dimension formula.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD3/iterated-locus`; `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution`.

**Plan.**

- Import the geometric stratified semismallness bound from GS2:correspondences/rational-special-fibre-convolution; its statement concerns actual fibres, not only sheaf pushforward.
- Stratify by finitely many exact endpoints and apply the uniform fibre upper bound.
- Use the top endpoint and its nonempty zero-dimensional fibre for the opposite inequality.

**Sources.** [zhu17] Proposition 2.3, p. 432; proof of Proposition 3.3, pp. 459–460 — Geometric convolution semismallness is the required input, independently of the Satake equivalence.

**Check.** No closed-union fibre is treated as a single exact stratum. No cohomological decomposition theorem is used to assume the missing geometry.

### Componentwise adjoint reduction

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/adjoint-components` (theorem).

Compare corresponding connected components of X^G_μ(b) and X^(G_ad)_(μ_ad)(b_ad), after fixing their integral Kottwitz invariants. Prove the component comparison required to reduce the dimension calculation to adjoint factors. In the ramified equal-characteristic flag argument retain p∤|π₁(G_ad)| when using GHN’s corrected statement; the resulting map of the entire flag varieties need not be an immersion. For unramified spherical perfect loci prove the relevant model-level component comparison separately.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. Use either the specified good-characteristic equal-characteristic flag branch or the unramified spherical branch, with their separate proofs.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/transport`; `ReductiveGroupsPartII:RG2.3/associated-parahorics`; `BunGAndNewtonStrata:BG1/z-extension-bounded-lifting`; `ReductiveGroupsPartII:RG2.3`.

**Plan.**

- Compare parahoric quotients and the Kottwitz component labels; prove the induced component maps are the stated isomorphisms or universal homeomorphisms.
- Check compatibility of bσ and bounds before base change to ADLVs.
- Preserve the original G-class when auxiliary coweights lie only in P∨; G7 records the extra descent needed for the He21 main theorem.

**Sources.** [ham15] Reduction following Proposition 2.10, p. 12812 — The componentwise comparison follows the superbasic reduction; Lemma 2.4 is instead the Lang statement, not an adjoint comparison.; [ghnerr] Proposition 0.0.1, p. 1 — The corrected component statement has a characteristic hypothesis; a global immersion needs injectivity on components.; [zhu17] §3.1.2, pp. 456–457 — The unramified reduction is applied before superbasic factorization.

**Check.** Do not infer a global flag immersion from componentwise isomorphisms. Do not regard an auxiliary γ∈P∨ as an original cocharacter without a lift. The BG1 z-extension bounded-lifting supplier has p-adic scope; it supplies no equal-characteristic comparison by itself. Use Hamacher’s separate component argument in that branch.

### Reduction of superbasic adjoint factors

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/superbasic-factors` (theorem).

For an F-simple adjoint unramified group and a superbasic class, import the classification that the group is Res_(E/F) PGL_h for a finite unramified extension E/F. Lift the matching component to Res_(E/F) GL_h with a superbasic representative, tracking the central cocharacter and determinant. Together with Levi reduction and products this reduces the spherical dimension theorem to the GL_h charts and unramified norm comparison.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD3/adjoint-components`; `BunGAndNewtonStrata:BG1/general-levi-newton-comparison`; `BunGAndNewtonStrata:BG1`.

**Plan.**

- Request the generic definition of superbasic and the classification in G6 from the B(G)/reductive-group owners.
- Use the integral component comparison to lift and then apply the ordered norm construction.

**Sources.** [ckv15] Lemma 3.1.1, PDF pp. 20–21 — The anisotropic-centralizer classification forces restrictions of scalars of type A.; [zhu17] §3.1.2, pp. 456–457 — The reduction uses a GL lift rather than asserting that PGL and GL point sets coincide.

**Check.** The classification depends on Tits’s anisotropic-group theorem, not proved in the present sources. Record that missing input in G6 rather than declaring this reduction closed.

### Dimension of spherical and iterated loci

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/spherical-dimension` (theorem). Planet: **Spherical dimension formula**.

If X_μ(b) is nonempty for an unramified reductive O_F-model, then dim X_μ(b)=dim X_≤μ(b)=〈ρ,μ−ν_b〉−def_G(b)/2. If X_≤μ(b) is empty, its dimension is −∞ and the numerical expression is not asserted equal to it. More generally a nonempty iterated locus has dimension 〈ρ,Σμ_i−ν_b〉−def_G(b)/2. Prove nonemptiness/top-stratum attainment before equating the exact and closed dimensions.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is the generic fibre of a connected reductive O_F-group scheme, K=G(O_L), and k=overline(F_q). In mixed characteristic, all moduli functors are on perfect k-algebras. The dimension and transfer obligations G2/G4/G6 have been discharged for the chosen datum.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD2/superbasic-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD3/levi-reduction`; `HeckeStacksAndLocalShtukasPartII:HSD3/superbasic-factors`; `HeckeStacksAndLocalShtukasPartII:HSD3/norm-geometry`; `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate`.

**Plan.**

- Reduce to the Newton Levi and then superbasic adjoint factors.
- Apply norm geometry and the GL chart calculation.
- Apply the exact endpoint bounds and prove lower endpoints cannot exceed the top value; show the top nonempty stratum supplies equality.
- Proof order: first the superbasic GL_h chart formula for every bound; then its bounded unions and the Res GL_h convolution step using only those GL_h endpoint formulas; then adjoint products and Newton-Levi reduction. Only after the single-step theorem for general H is established deduce the general iterated formula. This avoids using the theorem for G to prove its own top-stratum attainment.

**Sources.** [zhu17] Theorem 0.5, p. 410; Theorem 3.1, p. 456; Proposition 3.3, pp. 457–460 — Combine Levi and adjoint reductions, superbasic charts, ordered norm and convolution.; [ham15] Theorem 1.1, p. 12805; setup p. 12804 — The main equal-characteristic dimension theorem explicitly assumes nonemptiness; Theorem 2.1 is its reduction to superbasic restrictions of scalars.

**Check.** G_m, μ=0, b=ϖ is empty although the displayed rational number is 0. For GL₂ with μ=(1,0) and basic slope 1/2, the value is 0. For GL₂ with μ=(1,−1), b=1, the value is 1. This theorem does not assert equidimensionality of every stratum.

### The virtual dimension upper bound

Target: `HeckeStacksAndLocalShtukasPartII:HSD3/virtual-upper-bound` (theorem).

For every w and [b] in the supported flag setting, dim X_w(b)≤d_w(b). Derive the σ-twisted form using the reduction and spherical estimates; track the η convention in the survey’s normalized Newton-stratum formula. That stratum dimension equals the ADLV dimension plus 〈ν_b,2ρ〉, so its plus-Newton term must not be copied into the ADLV formula.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/virtual-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`; `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD3/spherical-dimension`.

**Plan.**

- Reduce to the spherical bound and control the extra flag fibres by finite Weyl lengths.
- Prove the Frobenius-convention comparison between yσ(x) and σ⁻¹(y)x.
- Keep the general-σ/general-datum extension open in G5 until all hypotheses are checked.

**Sources.** [he21] Theorem 2.1, p. 5 — The required upper bound is σ-twisted.; [he14] Theorem 10.3 and Corollary 10.4, pp. 396–397 — Theorem 10.3 is a general-δ comparison with a spherical term. Only Corollary 10.4 specializes to δ=id when inserting the then available spherical formula; the intermediate theorem itself is twisted.; [he15] Theorem 2.30, PDF p. 38 — Translate the normalized Newton-stratum dimension and its η convention before using it.

**Check.** The sign is −〈ν,ρ〉 in d_w. The δ=id result alone does not prove the general σ statement.

## HSD4 — Generic Newton classes and cordiality

Construct the greatest cell class, compute its dimension, define cordiality and prove its interval consequence and mutual-advantage invariance. Identify the generic class of x t^λ and use the already owned cordial translation family.

### Spherical nonemptiness and Newton upper bounds

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/mazur` (theorem).

For dominant λ and the indicated special maximal parahoric K, the exact locus X^K_λ(b) is nonempty exactly when κ_G(b)=λ^natural and ν_b≤λ^♦. The bounded union X^K_≤λ(b) has the same criterion: necessity follows on every lower stratum and sufficiency already holds on the exact top stratum. In particular any class occurring in Kt^λK has ν_b≤λ^♦, and [t^λ] realizes the greatest class with ν=λ^♦ and defect 0 in the ordinary translation situation used here. Distinguish rational Newton dominance from the integral relative-position bound.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci`; `BunGAndNewtonStrata:BG1/ordinary-straight-translation`; `BunGAndNewtonStrata:BG1/galois-average`; `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`.

**Plan.**

- Apply the integral κ obstruction and Newton semicontinuity for necessity.
- Use the straight representative and Levi reduction for sufficiency.
- Check special-parahoric and root-datum generality before passing from unramified spherical geometry to the He21 setting; this is part of G5.

**Sources.** [he21] Theorem 4.4, p. 7 — The Mazur inequality and its converse identify the spherical Newton range.; [he14] Theorem 7.1, pp. 389–390 — The converse uses the classification of B(G) and a Levi construction.

**Check.** A torus with different valuation is empty even though rational dominance in semisimple directions is vacuous.

### Generic Newton class of an Iwahori cell

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton` (construction). Planet: **Generic Newton class**.

For w define B(G)_w={[b]:X_w(b)≠∅}. In the equal-characteristic setting construct its unique greatest element [b_w], realized on a dense open Newton stratum of IẇI. Show that the same greatest element occurs in the Bruhat closure ⋃_(v≤w)IṽI. The order is the Kottwitz-compatible Newton order imported from B(G); this is not a total ordering of all classes.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`; `ReductiveGroupsPartII:RG2.4/iwahori-bruhat-decomposition`; `BunGAndNewtonStrata:BG1`.

**Plan.**

- Work on admissible bounded models of the loop-group cell, prove generic constancy and greatestness, then compare its closure.
- Record the topology and purity inputs in G8; the group-theoretic classification alone does not give a generic point of an infinite-dimensional cell.

**Sources.** [he21] §4.1, p. 7 — The generic class is also the greatest class of the closure.; [vie14] Proposition 5.5 and Corollary 5.6, pp. 1027–1028 — Generic Newton points and specialization supply the maximal class.; [mv20] §3.1, PDF pp. 5–8 — The Newton poset is restricted to the cell.

**Check.** Unique maximal and greatest must be distinguished until finiteness/comparability is proved. No assertion that every class below [b_w] occurs is made here.

**Uses.**

- HSD4/cordiality: The generic dimension tests cordiality.
- HSD4/translation-generic: Closure comparison identifies the generic class in a specific family.

**API.**

- `cellNewtonSet` (constructor): B(G)_w defined by nonemptiness.
- `genericClass` (data): The unique greatest class with dense open Newton stratum.
- `genericClass_greatest` (universal-property): Every occurring class is ≤[b_w].
- `genericClass_closure` (compatibility): Passing to the Bruhat closure does not change the greatest class.
- `genericClass_points` (characterisation): The generic stratum meets the cell, so X_w(b_w) is nonempty.

**Unit tests.**

- `length_zero` (degenerate): For a length-zero element τ, the cell has generic class [τ].
- `ordinary_translation` (computation): For dominant λ the cell t^λ has generic class [t^λ].
- `Kottwitz_component` (non-example): A class with different κ cannot enter B(G)_w even if its Newton vector is smaller.
- `not_downward_closed` (non-example): Greatestness alone must not produce all lower classes; saturation is a separate cordial theorem.

### Dimension at the generic class

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/generic-dimension` (theorem).

At [b_w], dim X_w(b_w)=ℓw−〈ν_(b_w),2ρ〉. Relate the codimension of the generic Newton stratum in IẇI to ADLV dimension using the established bounded loop-group/flag comparison.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton`; `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension`; `BunGAndNewtonStrata:BG1`.

**Plan.**

- Use the dense open Newton stratum to get codimension zero.
- Apply the dimension comparison, retaining the 〈ν,2ρ〉 correction.

**Sources.** [he21] §4.1, p. 7 — The generic Newton class realizes the indicated dimension.; [he15] Theorem 2.23, PDF p. 34 — The Newton-stratum and ADLV dimension comparison supplies the geometric normalization.

**Check.** Do not replace the generic class by an arbitrary greatest rational cocharacter.

### Cordial elements

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/cordiality` (definition). Planet: **Cordial elements**.

A Weyl-group element w is cordial when ℓw−ℓη_σ(w)=〈ν_(b_w),2ρ〉−def_G(b_w). Equivalently dim X_w(b_w)=d_w(b_w). The definition is a property of the given based Frobenius datum and generic class, not a condition imposed on all b by definition.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/virtual-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD4/generic-dimension`.

**Plan.**

- Define the scalar equality and use the generic-dimension theorem for the equivalent form.

**Sources.** [he21] §4.1, p. 7 — The length equality and the generic virtual-dimension equality are equivalent.; [mv20] Definition 3.14, PDF p. 9 — Cordiality controls the Newton poset below the generic class.

**Check.** Keep the factor 2 in the generic dimension and the single ρ in d_w.

**Uses.**

- HSD4/saturation: The exact hypothesis of the interval and dimension theorem.
- HSD6/cordial-reduction: The reduction ends in the already owned cordial translation family.

**API.**

- `isCordial` (constructor): The displayed generic length equality.
- `cordial_iff_virtual_generic` (characterisation): Equivalent equality of actual and virtual dimension at b_w.
- `cordial_reduction_transport` (compatibility): Transport along reduction equivalences only when the relevant η lengths and generic classes have been compared.
- `cordial_imported_translation` (compatibility): Use the existing upstream translation-length target for x t^λ, after its geometric dictionary is supplied.

**Unit tests.**

- `identity` (degenerate): For w=1 and b_w=1 both sides are 0.
- `ordinary_translation` (computation): For a dominant translation in split GL₂, ℓ(t^(1,0))=1, η=1, ν=(1,0), def=0, so it is cordial.
- `finite_simple` (computation): For w=s in split adjoint A₁ the generic class is basic and ℓs−ℓη=0, so it is cordial.
- `generic_only` (non-example): Equality at one nongeneric b does not establish cordiality without the generic-class theorem.

### Cordiality under mutual dimension advantage

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/cordial-equivalence` (theorem).

If w⇒_σv and v⇒_σw, then B(G)_w=B(G)_v and their greatest classes agree. At every occurring class dim X_w−d_w=dim X_v−d_v. Consequently w is cordial iff v is cordial.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD1/dimension-advantage`; `HeckeStacksAndLocalShtukasPartII:HSD4/cordiality`.

**Plan.**

- Use the nonemptiness implications in each direction to identify the sets.
- Antisymmetry of the rational inequalities gives equality of dimension defects; evaluate at the common generic class.

**Sources.** [he21] §4.1, p. 7 — Mutual comparison preserves both the Newton set and equality at its generic class.

**Check.** Only mutual advantage, not a single inequality, gives the equivalence.

### Cordial saturation and dimensions

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/saturation` (theorem). Planet: **Cordial saturation**.

If w is cordial, [b]∈B(G)_w, and [b]≤[b′]≤[b_w], then [b′]∈B(G)_w. Every nonempty X_w(b) is equidimensional of dimension d_w(b) in the equal-characteristic setting with the purity inputs. In the cell, the closure of each occurring Newton stratum is the union of the occurring strata below it. The interval starts at a known occurring [b], not at an arbitrary lower bound; the general local-field transfer is G5.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The purity and poset-length obligations G8 are discharged.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD4/cordiality`; `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`; `HeckeStacksAndLocalShtukasPartII:HSD3/virtual-upper-bound`; `BunGAndNewtonStrata:BG1`.

**Plan.**

- Use the Newton-poset length formula and strong topological purity named in G8.
- Propagate codimension equality from the generic stratum down an occurring interval.
- Translate normalized cell dimensions to ADLV dimensions; keep equidimensionality within the established source setting.

**Sources.** [mv20] Theorem 3.16 and Corollary 3.17, PDF pp. 9–10 — Strong purity and Newton-poset lengths give interval saturation and dimension.; [he21] Theorem 4.1, p. 7 — The consequence used in the final transfer is nonemptiness and virtual dimension for intermediate classes.

**Check.** A basic seed must be supplied before applying saturation. General mixed-characteristic flag saturation remains a transfer obligation.

### Generic class of x t^λ and the dominant family

Target: `HeckeStacksAndLocalShtukasPartII:HSD4/translation-generic` (theorem). Planet: **Cordial translation families**.

For dominant λ and x∈W₀, [b_(x t^λ)]=[t^λ]. Prove the closure comparison I t^λ I⊂overline(I x t^λ I)⊂overline(Kt^λK), with both comparisons understood in the source’s closure sense, and apply the spherical Newton bound. The cordiality of x t^λ is imported from current ReductiveGroupsPartII’s translation-length target. For w in the dominant chamber, the stated length-preserving σ-rotation reduces w to a member of this family with equal η length; hence derive its generic class and cordiality without asserting all w=x t^λ y admit this rotation.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton`; `HeckeStacksAndLocalShtukasPartII:HSD4/mazur`; `ReductiveGroupsPartII:RG2.4/translation-length-formula`; `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`; `HeckeStacksAndLocalShtukasPartII:HSD4/cordial-equivalence`.

**Plan.**

- Use Bruhat closure inclusions, not false inclusions of disjoint open cells.
- Bound the greatest Newton point by λ^♦ and use the translation stratum for the reverse bound.
- For w=w_S t^λy in the dominant chamber use w≈_σ σ⁻¹(y)w_S t^λ with the specified length and η comparisons.

**Sources.** [he21] Theorem 4.2, p. 7, and §4.4, p. 8 — The new task is the generic-class identification and its geometric dictionary; the upstream cordial translation promise is reused.

**Check.** Do not duplicate the current upstream x t^λ cordiality target. For λ=0 retain the actual finite cell and its closure, rather than claiming it contains the identity cell as an open-cell subset.

## HSD5 — Double-flat bounds and factorization

Import generic dominance subtraction and Demazure combinatorics; construct double-flat data in P∨ and the parabolic factors and invariant ledger.

### Double-flat coweight

Target: `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat` (definition). Planet: **Double-flat coweight**.

Write w=x t^λ y in the imported normal form. Let J={s∈S:s y<y}, ρ_J∨=Σ_(s∈J)ω_s∨, and η_J∨ the dominant representative of −σ⁻¹(ρ_J∨). In the full coweight lattice define λ_w^♭♭=(λ−ρ_J∨)−_domη_J∨=λ−_dom(ρ_J∨+η_J∨). Prove it is dominant and ≤_ℤλ. This is generally an auxiliary adjoint-lattice cocharacter, not an element of the original Y.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`; `ReductiveGroupsPartII:RG2.4/dominant-normal-form`.

**Plan.**

- Use the generic fundamental coweights, dominant representative and normalized subtraction contract.
- Track the original cocharacter sublattice separately.

**Sources.** [he21] §5.2, p. 9 — The two subtractions agree by associativity and retain the based σ-action.

**Check.** Do not replace η_J∨ by −ρ_J∨ or drop σ⁻¹. Do not assert an integral lift to G when only a P∨ construction has been given.

**Uses.**

- HSD6/factorization: Bounds the dominant γ produced by the factorization.
- HSD8/main-criterion: Its Galois average is compared to ν_b.

**API.**

- `leftDescentSet` (data): J is the specified descent set of y.
- `parabolicRhoCoweight` (data): The sum of fundamental coweights in P∨.
- `etaJCoweight` (data): The dominant representative of −σ⁻¹ρ_J∨.
- `doubleFlat` (constructor): The two equal normalized subtraction expressions.
- `doubleFlat_dominant_le` (characterisation): Dominant and bounded by λ in the stated integral coroot coset.
- `doubleFlat_lattice` (compatibility): Records P∨ membership and any separately proved lift to Y.

**Unit tests.**

- `no_descents` (degenerate): For y=1, J=∅, both correction coweights vanish and λ^♭♭=λ.
- `A1_adj` (computation): In adjoint A₁ with y=s and λ=2ω∨, ρ_J∨=η_J∨=ω∨, so λ^♭♭=0.
- `A1_lattice` (non-example): For simply connected A₁, ω∨=α∨/2 is not an original cocharacter; the intermediate subtraction is not silently evaluated in Y=ℤα∨.
- `twisted_J` (computation): For A₂ with σ swapping the simple nodes and J={s₁}, the input −σ⁻¹ω₁∨ is −ω₂∨, not −ω₁∨.
- `left_descent_A2` (computation): For y=s₁s₂ in A₂, the left descent set is {s₁}, while the right descent set is {s₂}. The input ρ_J∨ must use ω₁∨.

### Parabolic factorization data and invariant ledger

Target: `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` (construction).

For shrunken w=x t^λy, set J as above, J′=Stab_S(λ−ρ_J∨), and factor η_σ(w)=x′z with x′ minimal in W₀/W_(J′), z∈W_(J′). Set β=λ−ρ_J∨+(x′)⁻¹σ⁻¹ρ_J∨; let γ be its dominant representative and choose y′ minimal modulo Stab_S γ with β=y′γ. Define w₁=x z⁻¹t^(λ−ρ_J∨)y′, w₂=(y′)⁻¹z t^(ρ_J∨)y. Then w=w₁w₂, ℓw=ℓw₁+ℓw₂, γ≥_ℤλ_w^♭♭, and a=σ⁻¹((y′)⁻¹z)*(x′y′) has supp_σ(a)⊇supp_σ(η_σ(w)). Retain κ in the auxiliary adjoint coinvariants; transferring it to G requires G7.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat`; `HeckeStacksAndLocalShtukasPartII:HSD0/shrunken`; `ReductiveGroupsPartII:RG2.4/length-and-bruhat-order`; `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free`; `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element`.

**Plan.**

- Request the generic Demazure product and parabolic normal forms in G1.
- Check the displayed product by the semidirect multiplication law.
- Use the shrunken root inequalities for the length identities and the normalized-subtraction bound for γ.
- Compute κ(β)−κ(λ) as coroot terms plus (σ⁻¹−1)ρ_J∨ in the auxiliary lattice.

**Sources.** [he21] §5.4, pp. 10–12 — The parabolic factorizations supply the length identity and support comparison used in both correspondences.

**Check.** Each minimal-coset direction is specified. The star product is the Demazure product, not ordinary multiplication.

**Uses.**

- HSD6/two-correspondences: Provides every endpoint and length entering the fibre estimates.

**API.**

- `factorData` (constructor): The tuple (J,J′,x′,z,β,γ,y′,w₁,w₂,a) with its specifications.
- `factorData_product` (characterisation): w=w₁w₂ and length additivity.
- `factorData_gamma_bound` (compatibility): γ≥_ℤλ^♭♭.
- `factorData_support` (compatibility): The σ-support inclusion for a.
- `factorData_kottwitz` (compatibility): Equality in the specified adjoint σ-coinvariants, with original-group descent separate.

**Unit tests.**

- `empty_J` (degenerate): For y=1 the correction ρ_J∨ is zero, β=λ and γ=λ.
- `rank_one_product` (computation): In split adjoint A₁ take x=y=s and λ=2ω∨. Then J={s}, J′=∅, x′=z=y′=1, β=γ=2ω∨, w₁=s t^ω∨ and w₂=t^ω∨s. Their product is s t^(2ω∨)s=t^(−2ω∨), and the lengths are 2+0=2.
- `Demazure_idempotent` (computation): For a simple reflection s, s*s=s, whereas s·s=1; support must be computed from the former.
- `torsion_guard` (non-example): Equality after mapping to P∨ coinvariants cannot be used as equality of original integral κ when the map has a kernel.

## HSD6 — The two geometric correspondences

Import flag incidence spaces and their ordinary/Demazure fibre bounds from GeometricSatakeAndFusion. Construct Frobenius pullbacks and chain correspondences, prove the bounded-model dimension inequalities, and deduce cordial reduction.

### Frobenius endpoint correspondences

Target: `HeckeStacksAndLocalShtukasPartII:HSD6/endpoint-correspondence` (construction). Planet: **Frobenius endpoint correspondences**.

Import C_(u,v)|_(O_z), its endpoint projection and bounded models from GS0:Witt-geometry/flag-incidence-correspondences. This target constructs its ADLV application: pull back along gI↦(gI,bσ(g)I), so points are triples with inv(g,h)=u, inv(h,bσ(g))=v and inv(g,bσ(g))=z. The intermediate flag remains part of the moduli problem. Import the ordinary and Demazure fibre bounds from GS0:Witt-geometry/flag-convolution-fibres. Compare Frobenius rotations by universal homeomorphisms on the stated geometric models; no new generic flag-incidence definition or fibre theorem is owned here.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-incidence-correspondences`; `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`.

**Plan.**

- Pull back the supplied endpoint projection along the bσ graph on compatible bounded pieces.
- Check the relative-Frobenius identity on points and identify the pullbacks used by the five chain spaces.
- Use the supplier’s bounds after base change; G5 retains any comparison between the classical and perfect carriers.

**Sources.** [he21] Proposition 5.6 and §5.4, pp. 10–12 — Two endpoint estimates are used after Frobenius pullback.; [gh10] Proposition 2.5.2, PDF pp. 6–8 — Simple-reflection fibres establish the elementary correspondence geometry.

**Check.** Every chain equation is checked against the point-level product r_b.

**Uses.**

- HSD6/two-correspondences: All five chain spaces are pullbacks and restrictions of the imported incidence functor along the specified Frobenius endpoints.

**API.**

- `frobeniusEndpointCorrespondence` (constructor): The bσ-graph pullback of the imported triple-flag correspondence.
- `frobeniusEndpointProjection` (projection): Forget the intermediate flag to the endpoint ADLV X_z(b).
- `endpoint_points` (characterisation): Geometric points are exactly the three relative positions with final flag bσ(g).
- `frobeniusPullback` (universal-property): Pullback imposing g′=bσ(g).
- `rotate_chain` (compatibility): Cyclic rotation with Frobenius gives the stated universal-homeomorphism comparison.

**Unit tests.**

- `identity_step` (degenerate): When u=1, h=g and z=v, forgetting h identifies the Frobenius pullback with X_v(b).
- `simple_square` (computation): For u=v=s, a fixed ordinary endpoint of position 1 has intermediate-flag fibre A¹, while a fixed Demazure endpoint of position s has fibre G_m. Both have dimension 1. The same fibres occur over existing endpoints after the bσ pullback.
- `noncommuting_steps` (non-example): For u=s₁,v=s₂ in A₂ the product endpoint s₁s₂ cannot be replaced by s₂s₁.
- `Frobenius_rotation` (compatibility): Rotating u,v changes the final label from uv to vσ(u), not vu in a twisted datum.

### The two chain-space comparisons

Target: `HeckeStacksAndLocalShtukasPartII:HSD6/two-correspondences` (construction).

Use HSD5/factor-data and put A=(y′)⁻¹z, B=t^(ρ_J∨)y. Rotate the chain w₁,w₂ into X₁ with steps w₂,σ(w₁). Refine w₂=AB and restrict the relative position from g₃ to bσ(g₁) to σ(x′y′t^γ), obtaining X₂. Forget the B-intermediate flag and split the latter endpoint into σ(x′y′),σ(t^γ), obtaining X₃. Restrict the position g₁→g₄ to σ(a), obtaining X₄, and forget g₃ to obtain X₅, whose remaining steps are σ(a),σ(t^γ). Supply every map and cartesian square; X₅ compares by the indicated Frobenius universal homeomorphism with X_(a t^γ)(b).

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data`; `HeckeStacksAndLocalShtukasPartII:HSD6/endpoint-correspondence`.

**Plan.**

- Write the complete flag tuples and relative positions for X₁,…,X₅.
- Use the product identities for the first restriction and Demazure endpoint for the second.
- Verify each rotation and each refinement on torsors, retaining σ on the final step.

**Sources.** [he21] §5.4, pp. 11–12 — The proof uses two restrictions and two forgetful maps; they are not all isomorphisms.

**Check.** The README tuple equations below are part of the target. No map from the whole X₁ onto X₃ is assumed: use the restricted X₂.

**Uses.**

- HSD6/correspondence-dimensions: Supplies the two surjective forgetful maps and restricted source spaces.

**API.**

- `chainSpaces` (constructor): The five chain functors with the displayed restrictions.
- `firstRestriction` (coercion): X₂→X₁ is a locally closed restriction, not a surjection onto X₁.
- `firstForgetful` (projection): X₂→X₃ forgets the B-step intermediate flag.
- `secondRestriction` (coercion): X₄→X₃ imposes endpoint σ(a).
- `secondForgetful` (projection): X₄→X₅ forgets g₃.
- `terminalComparison` (equivalence): X₅ compares to X_(a t^γ)(b) through the specified σ-rotation universal homeomorphism.

**Unit tests.**

- `identity_factors` (degenerate): With y=1 the unnecessary zero-length steps collapse to identity correspondences.
- `first_endpoint` (compatibility): The first fibre uses the ordinary product B·σ(w₁), conjugated to the stated endpoint, so its bound carries 1/2.
- `second_endpoint` (compatibility): The second fibre uses σ⁻¹(A)*(x′y′)=a, so its bound has no factor 1/2.
- `twisted_terminal` (non-example): The terminal chain has σ(a),σ(t^γ); removing these σ symbols before the Frobenius comparison gives the wrong locus.

### Dimension inequality for the chain spaces

Target: `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions` (theorem).

The maps X₂→X₃ and X₄→X₅ are surjective, with geometric fibre dimensions at least N₁=(ℓB+ℓw₁−ℓ(x′y′t^γ))/2 and N₂=ℓA+ℓ(x′y′)−ℓa=ℓη_σ(w)−ℓa, respectively. On compatible bounded models deduce dim X_w(b)≥dim X_(a t^γ)(b)+N₁+N₂. The factorization length identities give N₁+N₂=d_w(b)−d_(a t^γ)(b).

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD6/two-correspondences`; `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`; `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`; `SchemeAndStackFoundations:SF.0/fibre-dimension-formula`.

**Plan.**

- Restrict to a bounded model containing a generic point of a maximal-dimensional target component.
- Use fibre lower bounds on a compatible finite-type source model and the locally closed inclusions to bound dim X_w from below.
- Cancel b-dependent terms in virtual dimensions and check every finite Weyl length.

**Sources.** [he21] §5.4, pp. 11–12 — Apply the ordinary and Demazure fibre bounds in that order.

**Check.** Do not argue that finitely many proper closed subsets cover an entire non-quasi-compact ADLV. The proof depends on G2 even when the pointwise correspondence is correct.

### Reduction from a shrunken alcove to a cordial family

Target: `HeckeStacksAndLocalShtukasPartII:HSD6/cordial-reduction` (theorem). Planet: **Cordial reduction**.

For shrunken w=x t^λy, in the auxiliary full coweight datum there exist dominant γ≥_ℤλ_w^♭♭ and a∈W₀ with supp_σ(a)⊇supp_σ(η_σ(w)), κ(a t^γ)=κ(w) in that datum, and w⇒_σa t^γ. The target a t^γ belongs to the translation family whose cordiality is already planned upstream. The theorem does not assert a t^γ is shrunken.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data`; `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions`; `HeckeStacksAndLocalShtukasPartII:HSD1/dimension-advantage`; `ReductiveGroupsPartII:RG2.4/translation-length-formula`.

**Plan.**

- Assemble γ, a, support and κ from factor data.
- Use the chain dimension inequality for every b with the target nonempty.
- Apply the imported cordial translation target only after matching geometric and Frobenius conventions.

**Sources.** [he21] Theorem 5.5, p. 9, proved in §5.4, pp. 10–12 — The factorization and two fibre bounds supply dimension advantage.

**Check.** Auxiliary-lattice descent is G7. No basic-seed theorem requiring shrunkenness can be applied to the target without another argument.

## HSD7 — Levi obstructions and basic seeds

Plan P-alcoves, the all-Levi-classes Kottwitz obstruction, proper-support emptiness, the non-shrunken basic seed and the interval argument. Delimit proper-Levi continuation.

### Levi-compatible P-alcove elements

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/p-alcove` (definition). Planet: **P-alcove elements**.

For σ-stable J⊂S, standard P_J=M_JN_J and x∈W₀, call w a (J,x,σ)-alcove element when x⁻¹wσ(x)∈W̃_J and (xN_Jx⁻¹)∩(wIw⁻¹)⊂(xN_Jx⁻¹)∩I. All superscripts on subgroups in the source mean conjugation. This definition uses the conjugator x, not automatically σ⁻¹(y) from the normal form.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment.

**Direct prerequisites.** `ReductiveGroupsPartII:RG2.3/parahoric-subgroup`; `ReductiveGroupsPartII:RG2.4/iwahori-weyl-group`.

**Plan.**

- Use the generic root-group and parabolic data to express both conditions.
- Relate the subgroup containment to root inequalities with the fixed apartment orientation.

**Sources.** [ghn15] Definition 3.3, PDF p. 10 — The Levi condition and root-subgroup containment define a P-alcove.; [he21] §6.1, p. 12 — The obstruction uses the same conjugation convention.

**Check.** Retain σ(x) on the right side of the Weyl-group condition.

**Uses.**

- HSD7/levi-obstruction: The hypothesis for the Hodge–Newton/Levi emptiness implication.
- HSD7/support-obstruction: The correct normal-form conjugator identifies a proper Levi.

**API.**

- `isPAlcove` (constructor): The Levi Weyl condition and unipotent subgroup inclusion.
- `pAlcove_rootCriterion` (characterisation): The equivalent inequalities for the corresponding root groups.
- `pAlcove_full` (simp): For J=S the unipotent condition is vacuous.
- `pAlcove_transport` (compatibility): Conjugation changes the Iwahori and Levi data explicitly.

**Unit tests.**

- `full_Levi` (degenerate): J=S gives the full group and no unipotent obstruction.
- `proper_support` (compatibility): For J= supp_σ(η_σ(w)) in the shrunken setting, x⁻¹wσ(x)=t^λσ(η_σ(w)) lies in W̃_J.
- `wrong_conjugator` (non-example): Replacing x by σ⁻¹(y) does not give that identity in general; a noncommuting A₂ normal form must fail this substitution.
- `twisted_right` (computation): For a diagram automorphism, x⁻¹w x and x⁻¹wσ(x) differ and only the latter defines the condition.

### The Levi Kottwitz obstruction

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/levi-obstruction` (theorem).

If w is a (J,x,σ)-alcove element and κ_(M_J)(x⁻¹wσ(x)) is not in {κ_(M_J)(b_M):[b_M]∈B(M_J), [b_M] maps to [b]∈B(G)}, then X_w(b)=∅. The obstruction quantifies over every Levi class in the fibre. Only for basic [b], under the corrected theorem’s hypotheses, may that fibre be replaced by at most one Levi class.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD7/p-alcove`; `BunGAndNewtonStrata:BG1/general-levi-newton-comparison`; `HeckeStacksAndLocalShtukasPartII:HSD0/transport`.

**Plan.**

- Apply the P-alcove Hodge–Newton reduction with the correct component statement.
- If a point exists, extract a Levi σ-class of the stated κ; take the contrapositive.

**Sources.** [he21] Theorem 6.3, p. 13 — The obstruction is stated using the entire intersection [b]∩M_J(L).; [ghn15] Theorem 3.3.1, PDF p. 11 — The P-alcove theorem controls the image from the Levi.; [ghnerr] Proposition 0.0.2, p. 2 — Uniqueness of the Levi class needs the basic hypothesis.

**Check.** For GL₂ and M the diagonal torus, diag(ϖ,1) and diag(1,ϖ) are distinct M-classes in one nonbasic G-class. Retain the characteristic condition from the corrected geometric comparison.

### Proper finite support forces emptiness

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/support-obstruction` (theorem). Planet: **Finite-support obstruction**.

For shrunken w=x t^λy with λ^♦−ν_b a positive rational combination of every simple coroot, supp_σ(η_σ(w))≠S implies X_w(b)=∅. Put J=supp_σ(η_σ(w)); then w is a (J,x,σ)-alcove element and x⁻¹wσ(x)=t^λσ(η_σ(w)). Show its Levi κ cannot equal that of any Levi class mapping to [b].

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD7/levi-obstruction`; `HeckeStacksAndLocalShtukasPartII:HSD0/shrunken`; `BunGAndNewtonStrata:BG1/galois-average`.

**Plan.**

- Verify the P-alcove condition using x and the specified root inequalities.
- Project the strict Newton difference to the center of the proper Levi; show every candidate Levi class has incompatible κ.
- Apply the all-classes obstruction rather than the false nonbasic uniqueness assertion.

**Sources.** [he21] §6.2, p. 13 — Correct the printed conjugator using the normal-form identity.; [ghn15] Lemma 3.6.3 and §3.6, PDF pp. 14–15 — The shrunken root inequalities give the P-alcove condition and the Levi obstruction.

**Check.** Strict positivity is required in every simple direction. Full σ-support is an orbit union, not ordinary support.

### Basic nonemptiness seed without shrunkenness

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` (theorem). Planet: **Basic nonemptiness seed**.

For dominant γ in the auxiliary adjoint lattice and a∈W₀ with supp_σ(a)=S, let [τ] be the basic class of the same integral κ as a t^γ. Establish X_(a t^γ)(τ)≠∅ without assuming a t^γ shrunken. For γ=0 use finite reductive quotient Lang theory. For γ≠0 use the positive cocenter comparison to a suitable twisted Coxeter translation and a nonzero class-polynomial coefficient, with its corrected twisted induction. Keep the general-datum and characteristic transport separate in G7.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension`; `ReductiveGroupsPartII:RG2.3/lang-theorem`; `BunGAndNewtonStrata:BG1/classification-by-two-invariants`; `SmoothRepresentationsOfLocalGroups:SR.1`.

**Plan.**

- Treat γ=0 independently by the finite quotient.
- For γ≠0 specialize Proposition 11.6 to J=S and its finite factor y=1, preserving full twisted support.
- Repair the printed variable and σ-index errors and prove the twisted induction rather than substituting ordinary support.
- Use Proposition 11.7 and dimension=degree to get nonemptiness. G7 records the remaining proof and transport obligations.

**Sources.** [he21] §6.3, pp. 13–14 — The basic seed is needed for the reduced target, which need not be shrunken.; [he14] Propositions 11.6–11.7, pp. 399–401, and Corollary 6.2, p. 388 — The positive cocenter comparison and nonzero coefficient supply a route in the good-characteristic adjoint setting.; [he15] Theorem 2.27, PDF p. 37 — Its shrunken hypothesis alone does not justify the seed needed here.

**Check.** A citation to the shrunken basic theorem is insufficient. This is explicitly a proof gate, not a claim that the source’s flawed twisted induction has already been repaired.

### Scope of the proper-Levi continuation

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/proper-levi-continuation` (theorem).

When σ-support is proper and the strict-gap hypothesis is relaxed, use a P-alcove Hodge–Newton decomposition only if a Levi class of the required integral κ exists. Formulate the resulting comparison to the corresponding Levi ADLV with its own Newton and defect data. No blanket extension of the simple-group main dimension formula to every proper-support element is asserted.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD7/levi-obstruction`; `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`; `BunGAndNewtonStrata:BG1/general-levi-newton-comparison`.

**Plan.**

- List the Levi classes in the B(M) fibre and compare their Kottwitz invariants.
- State the Hodge–Newton comparison with its actual hypotheses and account for fibre dimensions.
- Return nonapplicable cases to a later extension rather than treating the remark as a theorem for all groups.

**Sources.** [he21] §6.5, p. 14 — The generalization requires the appropriate Levi decomposition and new hypotheses.; [ghn15] Theorem 3.3.1, PDF p. 11 — The exact Levi image is the prerequisite.

**Check.** The all-classes warning from GHN’s erratum remains in force.

### From a basic seed to the required Newton class

Target: `HeckeStacksAndLocalShtukasPartII:HSD7/cordial-interval` (theorem).

For the reduced target a t^γ, if κ(b)=κ(a t^γ), ν_b≤γ^♦ and the basic seed exists, then X_(a t^γ)(b) is nonempty and has virtual dimension. Indeed the basic class [τ] is ≤[b]≤[t^γ]=[b_(a t^γ)]; use the imported cordiality and the saturation theorem.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. F=F_q((t)), k=overline(F_q), L=k((t)); G splits over a tame extension of L; p does not divide |π₁(G_der)|. For He14 §§2–12 use its quasi-split adjoint reduction. The reduced root datum is realized in its adjoint/full coweight lattice P∨ with its based σ-action. Conclusions about the original cocharacter lattice require HSD3/adjoint-components.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed`; `HeckeStacksAndLocalShtukasPartII:HSD4/translation-generic`; `HeckeStacksAndLocalShtukasPartII:HSD4/saturation`; `BunGAndNewtonStrata:BG1/partial-order-on-B-of-G`.

**Plan.**

- Compare κ in the same integral lattice and Newton order.
- Use the basic seed for the lower endpoint and the identified generic translation class for the upper endpoint.
- Apply saturation and virtual-dimension equality.

**Sources.** [he21] §6.3, pp. 13–14 — The proof needs an occurring lower endpoint before saturation.

**Check.** Do not infer the existence of the basic seed from generic greatestness. The γ produced in P∨ is not used for an original G-class until G7 is discharged.

## HSD8 — The shrunken nonemptiness and dimension theorem

Assemble the exact He21 criterion and dimension formula; retain both Newton hypotheses and all scope gates. Deduce the basic specialization and the independent-shrunkenness large-translation range.

### Nonemptiness for shrunken affine Deligne–Lusztig varieties

Target: `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion` (theorem). Planet: **Shrunken nonemptiness criterion**.

Let G be simple quasi-split and w=x t^λy shrunken. Assume λ^♦−ν_b has strictly positive coefficients on every simple coroot and (λ_w^♭♭)^♦≥ν_b. Then X_w(b)≠∅ iff κ_G(w)=κ_G(b) and supp_σ(η_σ(w))=S. This is a target conditional on the prerequisite chains and gates G1–G8 for the chosen datum. In particular G2/G7/G8 remain proof obligations even in the good-characteristic equal-characteristic adjoint branch; no branch is declared closed here.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed. w is shrunken; λ^♦−ν_b has positive coefficient in every simple coroot; (λ^♭♭)^♦≥ν_b.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD7/support-obstruction`; `HeckeStacksAndLocalShtukasPartII:HSD6/cordial-reduction`; `HeckeStacksAndLocalShtukasPartII:HSD7/cordial-interval`; `HeckeStacksAndLocalShtukasPartII:HSD0/transport`; `ReductiveGroupsPartII:RG2.3`.

**Plan.**

- Necessity is the integral κ obstruction and the proper-support Levi obstruction.
- For sufficiency reduce to a t^γ with γ≥λ^♭♭ and full support, compare γ^♦≥ν_b, establish the basic seed, and use cordial saturation.
- Dimension advantage forces nonemptiness of the original locus.

**Sources.** [he21] Theorem 6.1, p. 13 — The two Newton hypotheses, shrunkenness, integral κ and full twisted support are all retained.

**Check.** Neither strict λ-gap nor shrunkenness is omitted. All invariants are for the original G after the explicit descent gate.

### Virtual dimension in the shrunken range

Target: `HeckeStacksAndLocalShtukasPartII:HSD8/main-dimension` (theorem). Planet: **Shrunken dimension formula**.

Under the hypotheses of HSD8/main-criterion, if the equivalent nonemptiness conditions hold, dim X_w(b)=d_w(b)=(ℓw+ℓη_σ(w)−def_G(b))/2−〈ν_b,ρ〉. Use the reduced target’s virtual dimension and universal dimension advantage for the lower bound, then the independent virtual upper bound for equality.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion`; `HeckeStacksAndLocalShtukasPartII:HSD7/cordial-interval`; `HeckeStacksAndLocalShtukasPartII:HSD6/cordial-reduction`; `HeckeStacksAndLocalShtukasPartII:HSD3/virtual-upper-bound`.

**Plan.**

- For the nonempty reduced target, apply w⇒a t^γ to dim−d.
- Its actual dimension equals its virtual dimension, giving dim X_w≥d_w.
- Combine with the virtual upper bound; no equidimensionality claim for general w follows from the numerical equality.

**Sources.** [he21] Theorem 6.1 and §6.3, pp. 13–14 — The actual dimension is squeezed between the transported virtual value and the general upper bound.

**Check.** For an empty locus the rational formula is not asserted. Rank-one examples must use the same opposite-chamber convention as η. For split PGL₂, b=1 and w=s t^(nα∨) with n≥1, λ^♭♭=nα∨, η=s, ℓw=2n+1, def=0, so the formula gives dimension n+1. The base alcove has α-values (−1,0); its image has values (2n,2n+1) and is shrunken.

### The basic specialization

Target: `HeckeStacksAndLocalShtukasPartII:HSD8/basic-case` (theorem).

For basic b, shrunken w and the same strict λ-gap, the double-flat Newton inequality required in the main theorem follows from the matching κ and the dominant auxiliary construction in the supported adjoint setting. Hence nonemptiness is equivalent to integral κ equality and full σ-support, with dimension (ℓw+ℓη−def_G(b))/2−〈ν_b,ρ〉. This corollary does not remove shrunkenness or the verified characteristic and descent gates.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD8/main-dimension`; `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat`; `BunGAndNewtonStrata:BG1/classification-by-two-invariants`.

**Plan.**

- Compare the basic central Newton vector to the dominant auxiliary bound after matching κ.
- Apply the main criterion and formula, with the same descent restrictions.

**Sources.** [he21] §1.4, pp. 3–4; §6.3, pp. 13–14 — The basic case specializes the Newton condition while retaining the alcove assumptions.; [ghn15] Theorem B, PDF p. 3, with the official erratum — The basic shrunken criterion is the predecessor result.

**Check.** A minuscule λ may have λ^♭♭=λ; the strict-gap hypothesis of the main theorem cannot be silently replaced by a non-strict one.

### A usable large-translation range

Target: `HeckeStacksAndLocalShtukasPartII:HSD8/large-translation` (theorem). Planet: **Large-translation dimension range**.

Let w be shrunken and assume λ_w^♦≥ν_b+2ρ∨. Then the strict λ-gap and double-flat inequality of the main theorem hold. Therefore X_w(b) is nonempty iff κ_G(w)=κ_G(b) and supp_σ(η_σ(w))=S, and its nonempty dimension is d_w(b). The bound is a sufficient explicit range, while shrunkenness remains a separate hypothesis.

**Hypotheses.** F is a nonarchimedean local field with finite residue field; L is its completed maximal unramified extension and σ is arithmetic Frobenius. G/F is connected reductive, I⊂G(L) is a connected σ-stable Iwahori, and the chosen special vertex gives the specified Iwahori–Weyl datum. G is simple and quasi-split; the special-vertex splitting is σ-stable, the dominant chamber is opposite the base alcove, and t^λ acts by −λ on the apartment. Use the geometric realizations and dimension convention of HSD0/geometric-realization; the mixed-characteristic and general-datum transfers are obligations G2/G5/G7, not assumptions silently removed.

**Direct prerequisites.** `HeckeStacksAndLocalShtukasPartII:HSD8/main-dimension`; `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data`; `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat`.

**Plan.**

- Bound the two fundamental-coweight corrections by 2ρ∨ and use monotonicity of normalized subtraction.
- Check strict positivity in every simple coroot after averaging.
- Apply the main theorem with all its geometry and descent gates.

**Sources.** [he21] Corollary 6.4, p. 14 — The uniform 2ρ∨ estimate implies the two Newton conditions.

**Check.** The coweight is 2ρ∨, not 2ρ. An arbitrary large λ statement cannot drop the shrunken condition.

## Chain-space ledger for HSD6

All entries use relative positions of flags. Put A=(y′)⁻¹z and B=t^(ρ_J∨)y. A chain is a moduli condition, with all intermediate flags retained. Superscripts σ on relative positions are essential.

| Space | Tuple equations | Map used |
|---|---|
| X_w | g →_(w₁) g₁ →_(w₂) bσ(g) | Rotate (g,g₁) to (g₁,bσ(g)); universal homeomorphism to X₁. |
| X₁ | g₁ →_A g₃ →_B g₂ →_(σw₁) bσ(g₁) | Restrict the position g₃→bσ(g₁). |
| X₂ | X₁ with inv(g₃,bσg₁)=σ(x′y′t^γ) | Forget g₂; surjective to X₃ with lower fibre bound N₁. |
| X₃ | g₁ →_A g₃ →_(σ(x′y′)) g₄ →_(σt^γ) bσ(g₁) | Restrict inv(g₁,g₄)=σa. |
| X₄ | X₃ with inv(g₁,g₄)=σa | Forget g₃; surjective to X₅ with lower fibre bound N₂. |
| X₅ | g₁ →_(σa) g₄ →_(σt^γ) bσ(g₁) | Length-additive identification with X_(σ(a t^γ))(b), then Frobenius universal-homeomorphism comparison. |

N₁=(ℓB+ℓw₁−ℓ(x′y′t^γ))/2 and N₂=ℓA+ℓ(x′y′)−ℓa=ℓη−ℓa. The first is an ordinary-product fibre estimate; the second is a Demazure-product estimate. Their sum is d_w−d_(a t^γ). Apply the fibre estimates on bounded models over generic points; no finite-component argument for an entire ADLV is assumed.

## Scope gates and supplier requests

### G1 — Generic root-data extensions

The current RootSystems Coxeter/chamber targets do not yet provide all of: twisted extended-affine Red-Min with straight–finite-parabolic decomposition; associative Demazure product and support union; parabolic minimal representatives in the needed directions; integral dominance subtraction in P∨ with least-element, monotonicity and associativity proofs. Propose a single generic RootSystems Part II extension, and import it. Fundamental coweights must carry their lattice map; a rational dominance truncation is not a substitute. The basic-seed route also needs the twisted-Coxeter-to-basic minimal reduction cited in He14 Proposition 11.7 as He–Yang, Elements with finite Coxeter part in an affine Weyl group, Theorem 1.1; that proof was not read here and remains a supplier audit obligation.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-reduction`, `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry`, `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat`, `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data`, `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed`, `HeckeStacksAndLocalShtukasPartII:HSD8/large-translation`.

### G2 — Dimension on bounded and perfect geometric diagrams

SF.0/fibre-dimension-formula already supplies the finite-type dimension inequalities, and GS0:Witt-geometry/perfect-model-and-etale-comparison requests compatible perfect models from SF.0/SF.1. Import these promises. The remaining obligation is to produce compatible bounded models of the particular ADLV and Frobenius-chain diagrams, and pass their inequalities to the dimension supremum at a generic point of each bounded target. An entire ADLV may have infinitely many components; no global finite-component or quasi-compactness assumption is supplied.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`, `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions`.

### G3 — Generic twisted affine-Hecke cocenter

SmoothRepresentationsOfLocalGroups SR.1 owns Hecke algebras, but its present promise does not include the integral twisted cocenter basis, class-polynomial positivity, reduction recursion and nonzero twisted-Coxeter coefficient. Extend that direction once; do not manufacture an opaque polynomial oracle here. HN14 Theorem 6.7 and the relevant He14 §§2,11 inputs need the full generic algebra audit.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension`, `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed`.

### G4 — Perfect spherical proof transfers

Zhu invokes adaptations of equal-characteristic arguments on p-adic loop spaces. Required checks are actual Teichmüller chart morphisms and their dimension comparison; equivariant N-versus-Lie N with its precise characteristic hypotheses; admissibility and twisted Lang-map dimensions; and the perfect-space trace input to GHKR Lemma 5.4.3. Current GS0 already supplies flag incidence spaces and their fibre bounds, and GS2:correspondences/rational-special-fibre-convolution supplies the spherical semismallness bound. Import them. The ADLV application still checks nonempty top-endpoint attainment and compatible bounded pullbacks. A point bijection alone supplies none of the missing chart or Lang geometry.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD2/lattice-strata`, `HeckeStacksAndLocalShtukasPartII:HSD2/chart-dimension`, `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison`, `HeckeStacksAndLocalShtukasPartII:HSD3/levi-reduction`, `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate`, `HeckeStacksAndLocalShtukasPartII:HSD3/spherical-dimension`.

### G5 — General σ and local-field flag geometry

The read geometric endpoint source is split equal characteristic; He14 uses tame good-characteristic adjoint reduction, and its Corollary 10.4 assumes δ=id. Supply the σ-twisted, ramified and mixed-characteristic flag versions and normalized dimension comparisons before claiming the full He21 local-field scope. A spherical perfect-space construction is not the missing flag construction.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`, `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry`, `HeckeStacksAndLocalShtukasPartII:HSD3/virtual-upper-bound`, `HeckeStacksAndLocalShtukasPartII:HSD4/mazur`, `GeometricSatakeAndFusion:GS0:Witt-geometry/flag-convolution-fibres`, `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion`.

### G6 — Superbasic definition and classification

The B(G) owner must provide superbasic = meeting no proper F-Levi, its equivalence to the required anisotropic-centralizer condition, and the classification of F-simple adjoint unramified superbasic factors as Res_(E/F)PGL_h, with GL_h lift and κ bookkeeping. CKV Lemma 3.1.1 cites Tits’s anisotropic classification, not established by the present reading. Record that exact residual source dependency.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD3/superbasic-factors`.

### G7 — Basic-seed proof and original-lattice descent

The basic seed used in He21 §6.3 need not be shrunken, so the cited He15 Theorem 2.27 does not suffice. Finish the nonzero-γ twisted cocenter proof, with the corrected choices and σ-saturated support in He14 Proposition 11.6, and the finite-quotient γ=0 case. Then transport from the verified simple-adjoint good-characteristic setting. Independently compare original-group components and integral κ when γ and λ^♭♭ lie only in P∨. GHN’s official erratum retains a characteristic condition and supplies componentwise comparison, not an unconditional global immersion.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD3/adjoint-components`, `HeckeStacksAndLocalShtukasPartII:HSD6/cordial-reduction`, `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed`, `HeckeStacksAndLocalShtukasPartII:HSD7/cordial-interval`, `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion`.

### G8 — Newton-cell purity and poset lengths

MV20’s cordial saturation proof uses strong topological purity and the Newton-poset length theorem (its references [15] and [40], Theorem 3.4/Lemma 5.12). BG1’s abstract classification and partial order alone do not provide these geometric theorems. Obtain the precise equal-characteristic geometric package, including greatestness on cell closures and the cell/ADLV dimension comparison, before declaring this branch closed; general local-field transport is G5.

Needed by: `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton`, `HeckeStacksAndLocalShtukasPartII:HSD4/generic-dimension`, `HeckeStacksAndLocalShtukasPartII:HSD4/saturation`.

The following supplier contracts distinguish existing targets from requested extensions.

| Supplier | Contract | Used by |
|---|---|---|
| `GeometricSatakeAndFusion:GS0:Witt-geometry` | Import the perfect fp flag/Grassmannian carriers, exact relative-position strata and finite-type models already promised here. Confirm the ADLV bσ graph pullbacks used in HSD0; this request does not move the carrier to this continuation. | `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci`, `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization` |
| `GeometricSatakeAndFusion:GS1` | Supply the precise semi-infinite intersection dimension estimate d(μ,μ_M)≤〈ρ,μ+μ_M〉−〈2ρ_M,μ_M〉 with equality for M-maximal positions, in the unramified perfect setting, or record the needed scope extension. | `HeckeStacksAndLocalShtukasPartII:HSD3/levi-reduction` |
| `GeometricSatakeAndFusion:GS2:correspondences/rational-special-fibre-convolution` | Reuse the supplied geometric convolution fibre bound ≤〈ρ,Σμ−λ〉. Identify its compatible perfect models for the ADLV graph pullback and the nonempty zero-dimensional top endpoint; do not request or plan semismallness a second time. | `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate` |
| `SchemeAndStackFoundations:SF.0` | Import SF.0/fibre-dimension-formula and the general perfection/model comparison requested by GS0. Supply only the remaining compatible bounded ADLV diagram and generic-point passage in G2; finite-type fibre inequalities are already planned by their owner. | `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization`, `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions` |
| `SchemeAndStackFoundations:SF.2` | SF.2/upstreamIntegration routes generic constructible étale theory, compact supports and Grothendieck–Lefschetz to the existing CohomologicalPointCounting family (TraceFormula layer 11), rather than owning a second trace theorem. Reuse that direction. The remaining G4 contract is its application to the separated perfectly finite-presentation perfect algebraic spaces in Zhu Appendix A.3.4 and GHKR Lemma 5.4.3: identify compatible finite-type models, ℓ≠p, constructibility/boundedness and compact supports, and distinguish geometric Frobenius in the trace from arithmetic Frobenius in the ADLV condition. The family is identified through SF.2 routing; its perfect-space application is not claimed verified. | `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison` |
| `BunGAndNewtonStrata:BG1` | Extend the generic B(G) layer by the superbasic definition, anisotropic-centralizer criterion and classification/lift contract G6, coordinated with the reductive-group owner; do not add these generic definitions locally. | `HeckeStacksAndLocalShtukasPartII:HSD3/superbasic-factors` |
| `BunGAndNewtonStrata:BG1` | Add or identify the precise Newton-cell purity, poset length and cell/ADLV dimension comparison package G8. The existing exact classification, partial-order and norm nodes are reused directly, not requested again. | `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton`, `HeckeStacksAndLocalShtukasPartII:HSD4/generic-dimension`, `HeckeStacksAndLocalShtukasPartII:HSD4/saturation` |
| `SmoothRepresentationsOfLocalGroups:SR.1` | Extend the Hecke-algebra direction with the generic integral σ-cocenter and class-polynomial contract G3; its current convolution algebra target is narrower. | `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension`, `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-3-the-missing-coxeter-combinatorics-root-system-free` | Extend generic Coxeter combinatorics by the associative Demazure product, support union and twisted extended-affine Red-Min contract G1, with straight–finite-parabolic decomposition; current finite subword/Bruhat facts alone do not provide it. | `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-reduction`, `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry`, `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-6-the-bourbaki-numbering-and-integral-root-data` | Extend the integral root-data direction by least dominant subtraction in the full coweight lattice and the precise fundamental-coweight lattice comparisons G1; preserve the original lattice map. | `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat`, `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data`, `HeckeStacksAndLocalShtukasPartII:HSD8/large-translation` |
| `ReductiveGroupsPartII:RG2.3` | Identify or add the generic M-equivariant unipotent/Lie comparison with exact characteristic hypotheses used in Zhu §3.1.2, pp. 456–457, plus the corrected component comparisons and general-datum flag transport G5/G7. The current associated-parahoric node alone is not an ADLV component isomorphism. | `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison`, `HeckeStacksAndLocalShtukasPartII:HSD3/adjoint-components`, `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion` |
| `tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems#layer-4-chambers-the-fundamental-domain-and-the-longest-element` | Import the existing chamber fundamental-domain and longest-element API, including minimal parabolic representatives; G1 records additional Demazure/twisted-affine results, which are not attributed to this layer. | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `SchemeAndStackFoundations:SF.1` | Import the existing descent and algebraic-space fibre-product carriers for the perfect ADLV graph loci; G2 separately requests the missing bounded/perfect dimension package. | `HeckeStacksAndLocalShtukasPartII:HSD0/geometric-realization` |

## The twelve routed continuations

The issue permits one coherent direction here and a proposal for the independent directions. The following inventory preserves all twelve routes and their item IDs. “Proposed continuation” is an ownership decision for the maintainer, not an adopted stage or a claim that its mathematics has been planned in this packet.

| Paper route | Items | Owner | Disposition |
|---|---:|---|---|
| PAPER-GLEASON-LIM-XU-26 → HeckeStacksAndLocalShtukasIntegralPartII | 9 | HeckeStacksAndLocalShtukasIntegralPartII | proposed-continuation |
| PAPER-GLEASON-LIM-XU-26 → HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | 32 | HeckeStacksAndLocalShtukasComponentsPartII | proposed-continuation |
| PAPER-HANSEN-26 → HeckeStacksAndLocalShtukasKottwitzPartII | 1 | HeckeStacksAndLocalShtukasKottwitzPartII | proposed-continuation |
| PAPER-HANSEN-KALETHA-WEINSTEIN-22 → HeckeStacksAndLocalShtukasKottwitzPartII | 50 | HeckeStacksAndLocalShtukasKottwitzPartII | proposed-continuation |
| PAPER-HE-21 → HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | 53 | HeckeStacksAndLocalShtukasPartII | planned-here |
| PAPER-KISIN-17 → HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | 17 | HeckeStacksAndLocalShtukasComponentsPartII | proposed-continuation |
| PAPER-KISIN-PAPPAS-ZHOU-26 → HeckeStacksAndLocalShtukasIntegralPartII | 6 | HeckeStacksAndLocalShtukasIntegralPartII | proposed-continuation |
| PAPER-SCHOLZE-WEINSTEIN-20 → HeckeStacksAndLocalShtukasIntegralPartII | 9 | HeckeStacksAndLocalShtukasIntegralPartII | proposed-continuation |
| PAPER-VANHOFTEN-24 → HeckeStacksAndLocalShtukasIntegralPartII | 23 | HeckeStacksAndLocalShtukasIntegralPartII | proposed-continuation |
| PAPER-VANHOFTEN-24 → HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | 28 | HeckeStacksAndLocalShtukasComponentsPartII | proposed-continuation |
| PAPER-ZHU-17 → HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig | 16 | HeckeStacksAndLocalShtukasPartII | planned-here |
| PAPER-ZHU-17 → HeckeStacksAndLocalShtukasIntegralPartII | 18 | HeckeStacksAndLocalShtukasIntegralPartII | proposed-continuation |

### Rescope: HeckeStacksAndLocalShtukasPartII, HeckeStacksAndLocalShtukasPartIIAffineDeligneLusztig

The HE21/ZHU17 dimension and cordiality lane is coherent; the extraction candidate name is an alias for this design, not another ADLV owner.

Use HeckeStacksAndLocalShtukasPartII with HSD0–HSD8 for the 53 HE21 and 16 ZHU17 dimension items. HSD0 owns common classical/perfect ADLV loci; import η, translation lengths and cordial x t^λ from current ReductiveGroupsPartII, generic B(G) norm from BunGAndNewtonStrata, and generic flag-incidence geometry from GeometricSatakeAndFusion. Proposed IDs below are not dependency suppliers until adopted.

### Split: HeckeStacksAndLocalShtukasPartII, HeckeStacksAndLocalShtukasComponentsPartII

Kisin17, vanHoften24 and GLX26 component/rational-stratum arguments require integral specialization and crystalline monodromy rather than the cordial dimension proof. Their complete item sets are preserved in routeCoverage.

Propose HeckeStacksAndLocalShtukasComponentsPartII. C0 imports HSD0 exact/bounded loci and defines the finite-level/component dictionaries; C1 plans Kisin’s rational strata and σ-centralizer action; C2 plans van Hoften’s parahoric and very-special reductions with Zhou’s applicable hypotheses; C3 plans GLX Hodge–Newton irreducible component and π₀ theorem, with its original group/characteristic restrictions; C4 compares geometric π₀ with integral specialization. Keep connected components, irreducible components and framing-group orbits distinct. Import integral specialization from the integral owner, and never identify a local-shtuka diamond’s components with classical ADLV components by notation. Import the characteristic-zero Galois-gerb extension with algebraic kernel from SchemeAndStackFoundations:key/galois-gerbs and compatible projective systems from SchemeAndStackFoundations:SF.1/pro-gerb. Stagewise conjugacy supplies neither compatible conjugators nor a single conjugator in an inverse-limit kernel without a further existence theorem. This continuation owns the arithmetic application and adds no generic gerb definition.

### Split: HeckeStacksAndLocalShtukasPartII, HeckeStacksAndLocalShtukasIntegralPartII

Five integral continuations from Zhu17, KPZ26, vanHoften24, GLX26 and SW20 have overlapping integral local-shtuka objects. Merge those proposals into their existing integral candidate, outside HSD0–HSD8.

Keep HeckeStacksAndLocalShtukasIntegralPartII as the sole integral owner. I0 integral bounded parahoric shtuka functors and group/level maps; I1 mixed-characteristic crystalline deformation and quasi-isogeny diagrams; I2 canonical parahoric model system, formal-completion comparison and local-model compatibility; I3 reduction and generic/special-fibre specialization, rich smelted pairs and exact component sequences. Import tensor displays, integral local models and integral diamond recovery from their generic owners. PR26 completion comparisons consume KPZ §§5–6 and cannot prove them backwards. Preserve every item in the five routeCoverage rows, including Zhu’s σ-twisted framing bound correction. The classical loci HSD0 are shared imports; no second dimension theorem.

### Split: HeckeStacksAndLocalShtukasPartII, HeckeStacksAndLocalShtukasKottwitzPartII

The 50 HKW22 items and Hansen26’s one use form one independent trace/character-formula direction after HS3–HS4, not a prerequisite of the ADLV dimension theorem.

Keep HeckeStacksAndLocalShtukasKottwitzPartII. K0 builds the required fixed-point and elliptic correspondences; K1 proves the Lefschetz–Verdier trace and characteristic-cycle input with its exact hypotheses; K2 plans HKW finite-length preservation and the Kottwitz character formula; K3 supplies Hansen’s Hecke-operator use with the dual representation, signs, and uniqueness/existence of the matching elliptic element. Import generic Hecke cohomology from HS3 and generic trace foundations from their owners. Preserve the complete two routed item lists in routeCoverage.

### Rescope: tauceti:TauCetiRoadmap/RepresentationTheory/RootSystems, RootSystemsPartIIDominanceAndDemazure, HeckeStacksAndLocalShtukasPartII

Generic root-data combinatorics in G1 is reused by several papers and must not be owned by this geometric continuation. Current upstream stays unchanged.

Propose a RootSystems Part II extension containing integral dominance subtraction, Demazure product/support, parabolic comparisons and the missing extended-affine twisted Red-Min/straight–finite-parabolic package. Coordinate with existing RootSystems carriers and reductive-group affine datum; the candidate is a proposal only. G1 and the two requests record the missing contract.

### Rescope: SmoothRepresentationsOfLocalGroups, SmoothRepresentationsPartIIParahoricCenters, HeckeStacksAndLocalShtukasPartII

A generic twisted affine-Hecke cocenter is not the same as an ADLV dimension theorem and is not yet supplied by SR.1.

Extend the smooth-representation Hecke direction once with the exact G3 cocenter/class-polynomial contract, coordinated with the parahoric-center candidate; keep geometric dimension=degree here. Do not silently treat the candidate name as a known stage.

### Dimension-lane item map

| Routed item | Target or imported supplier |
|---|---|
| `PAPER-HE-21/16` | `HeckeStacksAndLocalShtukasPartII:HSD0/point-locus` |
| `PAPER-HE-21/17` | `HeckeStacksAndLocalShtukasPartII:HSD0/transport` |
| `PAPER-HE-21/19` | `ReductiveGroupsPartII:RG2.4/dominant-normal-form` |
| `PAPER-HE-21/20` | `HeckeStacksAndLocalShtukasPartII:HSD0/virtual-dimension` |
| `PAPER-HE-21/21` | `HeckeStacksAndLocalShtukasPartII:HSD3/virtual-upper-bound` |
| `PAPER-HE-21/31` | `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry` |
| `PAPER-HE-21/32` | `HeckeStacksAndLocalShtukasPartII:HSD1/minimal-geometry` |
| `PAPER-HE-21/33` | `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry` |
| `PAPER-HE-21/34` | `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry` |
| `PAPER-HE-21/35` | `HeckeStacksAndLocalShtukasPartII:HSD1/dimension-advantage` |
| `PAPER-HE-21/36` | `HeckeStacksAndLocalShtukasPartII:HSD1/dimension-advantage` |
| `PAPER-HE-21/41` | `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton` |
| `PAPER-HE-21/42` | `HeckeStacksAndLocalShtukasPartII:HSD4/cordiality` |
| `PAPER-HE-21/43` | `HeckeStacksAndLocalShtukasPartII:HSD4/cordial-equivalence` |
| `PAPER-HE-21/44` | `HeckeStacksAndLocalShtukasPartII:HSD4/saturation` |
| `PAPER-HE-21/45` | `HeckeStacksAndLocalShtukasPartII:HSD4/saturation` |
| `PAPER-HE-21/46` | `ReductiveGroupsPartII:RG2.4/translation-length-formula` |
| `PAPER-HE-21/47` | `HeckeStacksAndLocalShtukasPartII:HSD4/translation-generic` |
| `PAPER-HE-21/48` | `HeckeStacksAndLocalShtukasPartII:HSD4/mazur` |
| `PAPER-HE-21/49` | `HeckeStacksAndLocalShtukasPartII:HSD4/generic-newton` |
| `PAPER-HE-21/50` | `HeckeStacksAndLocalShtukasPartII:HSD4/translation-generic` |
| `PAPER-HE-21/52` | `HeckeStacksAndLocalShtukasPartII:HSD4/translation-generic` |
| `PAPER-HE-21/63` | `HeckeStacksAndLocalShtukasPartII:HSD5/double-flat` |
| `PAPER-HE-21/70` | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `PAPER-HE-21/72` | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `PAPER-HE-21/75` | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `PAPER-HE-21/76` | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `PAPER-HE-21/77` | `HeckeStacksAndLocalShtukasPartII:HSD6/two-correspondences` |
| `PAPER-HE-21/78` | `HeckeStacksAndLocalShtukasPartII:HSD6/two-correspondences` |
| `PAPER-HE-21/79` | `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions` |
| `PAPER-HE-21/80` | `HeckeStacksAndLocalShtukasPartII:HSD6/two-correspondences` |
| `PAPER-HE-21/82` | `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions` |
| `PAPER-HE-21/83` | `HeckeStacksAndLocalShtukasPartII:HSD6/correspondence-dimensions` |
| `PAPER-HE-21/84` | `HeckeStacksAndLocalShtukasPartII:HSD6/cordial-reduction` |
| `PAPER-HE-21/85` | `HeckeStacksAndLocalShtukasPartII:HSD7/p-alcove` |
| `PAPER-HE-21/86` | `HeckeStacksAndLocalShtukasPartII:HSD7/levi-obstruction` |
| `PAPER-HE-21/87` | `HeckeStacksAndLocalShtukasPartII:HSD7/support-obstruction` |
| `PAPER-HE-21/89` | `HeckeStacksAndLocalShtukasPartII:HSD7/support-obstruction` |
| `PAPER-HE-21/91` | `HeckeStacksAndLocalShtukasPartII:HSD5/factor-data` |
| `PAPER-HE-21/93` | `HeckeStacksAndLocalShtukasPartII:HSD7/cordial-interval` |
| `PAPER-HE-21/94` | `HeckeStacksAndLocalShtukasPartII:HSD8/main-criterion` |
| `PAPER-HE-21/95` | `HeckeStacksAndLocalShtukasPartII:HSD8/main-dimension` |
| `PAPER-HE-21/97` | `HeckeStacksAndLocalShtukasPartII:HSD8/basic-case` |
| `PAPER-HE-21/99` | `HeckeStacksAndLocalShtukasPartII:HSD8/large-translation` |
| `PAPER-HE-21/100` | `HeckeStacksAndLocalShtukasPartII:HSD8/large-translation` |
| `PAPER-HE-21/102` | `HeckeStacksAndLocalShtukasPartII:HSD4/mazur` |
| `PAPER-HE-21/103` | `HeckeStacksAndLocalShtukasPartII:HSD7/proper-levi-continuation` |
| `PAPER-HE-21/92` | `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` |
| `PAPER-HE-21/119` | `HeckeStacksAndLocalShtukasPartII:HSD1/class-polynomial-dimension` |
| `PAPER-HE-21/120` | `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` |
| `PAPER-HE-21/121` | `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` |
| `PAPER-HE-21/122` | `HeckeStacksAndLocalShtukasPartII:HSD7/basic-seed` |
| `PAPER-HE-21/129` | `HeckeStacksAndLocalShtukasPartII:HSD1/reduction-geometry` |
| `PAPER-ZHU-17/D01` | `HeckeStacksAndLocalShtukasPartII:HSD0/spherical-loci` |
| `PAPER-ZHU-17/D03` | `HeckeStacksAndLocalShtukasPartII:HSD3/levi-reduction` |
| `PAPER-ZHU-17/D04` | `HeckeStacksAndLocalShtukasPartII:HSD3/superbasic-factors` |
| `PAPER-ZHU-17/D05` | `HeckeStacksAndLocalShtukasPartII:HSD3/unipotent-loop-comparison` |
| `PAPER-ZHU-17/D06` | `HeckeStacksAndLocalShtukasPartII:HSD3/iterated-locus` |
| `PAPER-ZHU-17/D07` | `BunGAndNewtonStrata:BG1/product-and-unramified-norm` |
| `PAPER-ZHU-17/D08` | `HeckeStacksAndLocalShtukasPartII:HSD3/norm-geometry` |
| `PAPER-ZHU-17/D09` | `HeckeStacksAndLocalShtukasPartII:HSD3/norm-geometry` |
| `PAPER-ZHU-17/D10` | `BunGAndNewtonStrata:BG1/product-and-unramified-norm` |
| `PAPER-ZHU-17/D11` | `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate` |
| `PAPER-ZHU-17/D12` | `HeckeStacksAndLocalShtukasPartII:HSD3/convolution-estimate` |
| `PAPER-ZHU-17/D13` | `HeckeStacksAndLocalShtukasPartII:HSD3/spherical-dimension` |
| `PAPER-ZHU-17/D14` | `HeckeStacksAndLocalShtukasPartII:HSD3/spherical-dimension` |
| `PAPER-ZHU-17/superbasic-sigma-conjugacy-class` | `G6` |
| `PAPER-ZHU-17/viehmann-superbasic-gln` | `HeckeStacksAndLocalShtukasPartII:HSD2/superbasic-dimension` |
| `PAPER-ZHU-17/iterated-adlv-cartesian-fibres` | `HeckeStacksAndLocalShtukasPartII:HSD3/iterated-locus` |

### Preserved item inventory for the proposed continuations

- PAPER-GLEASON-LIM-XU-26 → HeckeStacksAndLocalShtukasIntegralPartII: `PAPER-GLEASON-LIM-XU-26/D35`, `PAPER-GLEASON-LIM-XU-26/T30`, `PAPER-GLEASON-LIM-XU-26/T31`, `PAPER-GLEASON-LIM-XU-26/T32`, `PAPER-GLEASON-LIM-XU-26/T33`, `PAPER-GLEASON-LIM-XU-26/T36`, `PAPER-GLEASON-LIM-XU-26/D62`, `PAPER-GLEASON-LIM-XU-26/A08`, `PAPER-GLEASON-LIM-XU-26/A09`.
- PAPER-GLEASON-LIM-XU-26 → HeckeStacksAndLocalShtukasComponentsPartII: `PAPER-GLEASON-LIM-XU-26/D08`, `PAPER-GLEASON-LIM-XU-26/D11`, `PAPER-GLEASON-LIM-XU-26/T06`, `PAPER-GLEASON-LIM-XU-26/T09`, `PAPER-GLEASON-LIM-XU-26/D40`, `PAPER-GLEASON-LIM-XU-26/D41`, `PAPER-GLEASON-LIM-XU-26/T40`, `PAPER-GLEASON-LIM-XU-26/T41`, `PAPER-GLEASON-LIM-XU-26/T42`, `PAPER-GLEASON-LIM-XU-26/T43`, `PAPER-GLEASON-LIM-XU-26/T44`, `PAPER-GLEASON-LIM-XU-26/T45`, `PAPER-GLEASON-LIM-XU-26/T46`, `PAPER-GLEASON-LIM-XU-26/T49`, `PAPER-GLEASON-LIM-XU-26/M01`, `PAPER-GLEASON-LIM-XU-26/M02`, `PAPER-GLEASON-LIM-XU-26/M03`, `PAPER-GLEASON-LIM-XU-26/M04`, `PAPER-GLEASON-LIM-XU-26/M05`, `PAPER-GLEASON-LIM-XU-26/M06`, `PAPER-GLEASON-LIM-XU-26/T71`, `PAPER-GLEASON-LIM-XU-26/T75`, `PAPER-GLEASON-LIM-XU-26/T76`, `PAPER-GLEASON-LIM-XU-26/T78`, `PAPER-GLEASON-LIM-XU-26/T79`, `PAPER-GLEASON-LIM-XU-26/T80`, `PAPER-GLEASON-LIM-XU-26/T81`, `PAPER-GLEASON-LIM-XU-26/T83`, `PAPER-GLEASON-LIM-XU-26/T84`, `PAPER-GLEASON-LIM-XU-26/T85`, `PAPER-GLEASON-LIM-XU-26/T86`, `PAPER-GLEASON-LIM-XU-26/T87`.
- PAPER-HANSEN-26 → HeckeStacksAndLocalShtukasKottwitzPartII: `PAPER-HANSEN-26/hkw-character-formula`.
- PAPER-HANSEN-KALETHA-WEINSTEIN-22 → HeckeStacksAndLocalShtukasKottwitzPartII: `PAPER-HANSEN-KALETHA-WEINSTEIN-22/001`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/002`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/003`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/004`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/007`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/008`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/009`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/010`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/011`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/012`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/013`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/014`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/017`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/018`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/024`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/025`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/026`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/027`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/028`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/029`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/030`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/031`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/035`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/079`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/080`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/081`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/082`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/084`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/085`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/086`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/087`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/094`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/095`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/097`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/098`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/100`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/101`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/102`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/103`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/104`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/105`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/107`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/110`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/111`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/112`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/113`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/114`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/115`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/117`, `PAPER-HANSEN-KALETHA-WEINSTEIN-22/118`.
- PAPER-KISIN-17 → HeckeStacksAndLocalShtukasComponentsPartII: `PAPER-KISIN-17/X01`, `PAPER-KISIN-17/X02`, `PAPER-KISIN-17/X03`, `PAPER-KISIN-17/X04`, `PAPER-KISIN-17/X05`, `PAPER-KISIN-17/X06`, `PAPER-KISIN-17/X09`, `PAPER-KISIN-17/X10`, `PAPER-KISIN-17/X11`, `PAPER-KISIN-17/relative-position-loci`, `PAPER-KISIN-17/canonical-frame-of-etale-map`, `PAPER-KISIN-17/newton-dominant-representative`, `PAPER-KISIN-17/hodge-newton-reduction-to-levi`, `PAPER-KISIN-17/adjoint-fibres-of-components`, `PAPER-KISIN-17/dieudonne-setup-over-Fpbar`, `PAPER-KISIN-17/lattice-change-map-g-to-g0`, `PAPER-KISIN-17/hn-indecomposability-passes-to-adjoint`.
- PAPER-KISIN-PAPPAS-ZHOU-26 → HeckeStacksAndLocalShtukasIntegralPartII: `PAPER-KISIN-PAPPAS-ZHOU-26/I02`, `PAPER-KISIN-PAPPAS-ZHOU-26/I03`, `PAPER-KISIN-PAPPAS-ZHOU-26/I04`, `PAPER-KISIN-PAPPAS-ZHOU-26/I05`, `PAPER-KISIN-PAPPAS-ZHOU-26/I07`, `PAPER-KISIN-PAPPAS-ZHOU-26/pr24-completion-shtuka-comparison`.
- PAPER-SCHOLZE-WEINSTEIN-20 → HeckeStacksAndLocalShtukasIntegralPartII: `PAPER-SCHOLZE-WEINSTEIN-20/172`, `PAPER-SCHOLZE-WEINSTEIN-20/173`, `PAPER-SCHOLZE-WEINSTEIN-20/174`, `PAPER-SCHOLZE-WEINSTEIN-20/175`, `PAPER-SCHOLZE-WEINSTEIN-20/176`, `PAPER-SCHOLZE-WEINSTEIN-20/177`, `PAPER-SCHOLZE-WEINSTEIN-20/178`, `PAPER-SCHOLZE-WEINSTEIN-20/179`, `PAPER-SCHOLZE-WEINSTEIN-20/180`.
- PAPER-VANHOFTEN-24 → HeckeStacksAndLocalShtukasIntegralPartII: `PAPER-VANHOFTEN-24/S01`, `PAPER-VANHOFTEN-24/S02`, `PAPER-VANHOFTEN-24/S03`, `PAPER-VANHOFTEN-24/S06`, `PAPER-VANHOFTEN-24/S07`, `PAPER-VANHOFTEN-24/S08`, `PAPER-VANHOFTEN-24/S09`, `PAPER-VANHOFTEN-24/S10`, `PAPER-VANHOFTEN-24/S11`, `PAPER-VANHOFTEN-24/S12`, `PAPER-VANHOFTEN-24/S13`, `PAPER-VANHOFTEN-24/S14`, `PAPER-VANHOFTEN-24/S15`, `PAPER-VANHOFTEN-24/S16`, `PAPER-VANHOFTEN-24/S18`, `PAPER-VANHOFTEN-24/S19`, `PAPER-VANHOFTEN-24/S20`, `PAPER-VANHOFTEN-24/S21`, `PAPER-VANHOFTEN-24/B03`, `PAPER-VANHOFTEN-24/X04`, `PAPER-VANHOFTEN-24/X05`, `PAPER-VANHOFTEN-24/X06`, `PAPER-VANHOFTEN-24/M06`.
- PAPER-VANHOFTEN-24 → HeckeStacksAndLocalShtukasComponentsPartII: `PAPER-VANHOFTEN-24/X01`, `PAPER-VANHOFTEN-24/X02`, `PAPER-VANHOFTEN-24/X03`, `PAPER-VANHOFTEN-24/X07`, `PAPER-VANHOFTEN-24/C21`, `PAPER-VANHOFTEN-24/A01`, `PAPER-VANHOFTEN-24/A02`, `PAPER-VANHOFTEN-24/A03`, `PAPER-VANHOFTEN-24/A04`, `PAPER-VANHOFTEN-24/A05`, `PAPER-VANHOFTEN-24/A06`, `PAPER-VANHOFTEN-24/A07`, `PAPER-VANHOFTEN-24/A08`, `PAPER-VANHOFTEN-24/A09`, `PAPER-VANHOFTEN-24/A10`, `PAPER-VANHOFTEN-24/A11`, `PAPER-VANHOFTEN-24/A12`, `PAPER-VANHOFTEN-24/A14`, `PAPER-VANHOFTEN-24/A15`, `PAPER-VANHOFTEN-24/A16`, `PAPER-VANHOFTEN-24/A17`, `PAPER-VANHOFTEN-24/A18`, `PAPER-VANHOFTEN-24/A19`, `PAPER-VANHOFTEN-24/A20`, `PAPER-VANHOFTEN-24/A21`, `PAPER-VANHOFTEN-24/A26`, `PAPER-VANHOFTEN-24/A29`, `PAPER-VANHOFTEN-24/A30`.
- PAPER-ZHU-17 → HeckeStacksAndLocalShtukasIntegralPartII: `PAPER-ZHU-17/R03`, `PAPER-ZHU-17/R04`, `PAPER-ZHU-17/R05`, `PAPER-ZHU-17/R06`, `PAPER-ZHU-17/R07`, `PAPER-ZHU-17/B11`, `PAPER-ZHU-17/B12`, `PAPER-ZHU-17/B13`, `PAPER-ZHU-17/B14`, `PAPER-ZHU-17/B15`, `PAPER-ZHU-17/rz-functor-M-X0`, `PAPER-ZHU-17/rz96-representability`, `PAPER-ZHU-17/crystalline-tate-tensor`, `PAPER-ZHU-17/framing-tensors-tate`, `PAPER-ZHU-17/isogeny-chain-kernel-p-torsion`, `PAPER-ZHU-17/rz-type-moduli-irreducible-component`, `PAPER-ZHU-17/perfection-of-M-is-demazure`, `PAPER-ZHU-17/open-locus-M-circ`.

## Source corrections and proof cautions

These are our own descriptions of the source problems and their effect on this plan. The independent review confirms each entry below; an identified proof obligation does not assert that its theorem is false.

### E1 — misprint

[zhu17] Published Theorem 0.5, p. 410; (3.1.3), p. 455; Theorem 3.1, p. 456.

**Problem.** The displayed dimension formula has no explicit nonemptiness qualification.

**Correction.** State it for the nonempty exact or bounded locus; use −∞ for an empty locus.

**Reason.** For GL₂, b=1 and μ=(1,0), determinant valuation forces emptiness but the formula is 1/2. The intended nonempty interpretation is supported by the proof.

**Effect.** nothing. Previously recorded and independently discussed in PAPER-ZHU-17/E19; no author correction located.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** Theorem 0.5 p. 410 and §3.1 pp. 455–456 omit an explicit qualifier; GL₂ with b=1 and μ=(1,0) gives an empty locus by determinant valuation and numerical value 1/2. The nonempty formulation is necessary.

### E2 — misprint

[zhu17] Published proof of Proposition 3.3, pp. 459–460.

**Problem.** The endpoint fibre bound is applied in the text to the inverse image of the closed union X_≤λ.

**Correction.** Apply it on each exact endpoint X_λ; take their finite union and prove the top exact stratum attains the bound.

**Reason.** A point of a smaller endpoint stratum can have a larger convolution fibre than the bound for λ. The stratified argument gives the intended result.

**Effect.** nothing. Previously recorded and reviewed in PAPER-ZHU-17/E20.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The proof on pp. 459–460 applies the endpoint estimate on a closed bound. Exact endpoint strata have distinct bounds; the finite stratification and top attainment give the corrected argument.

### E3 — misprint

[he21] Published §6.2, p. 13, and §6.5, p. 14.

**Problem.** The normal-form support argument names σ⁻¹(y) as the P-alcove conjugator.

**Correction.** Use x: x⁻¹wσ(x)=t^λyσ(x)=t^λσ(η_σ(w)).

**Reason.** This is the identity compatible with GHN Lemma 3.6.3 and the specified proper Levi.

**Effect.** nothing. Previously recorded in PAPER-HE-21/E2.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The §6.2 normal-form identity on p. 13 uses x⁻¹wσ(x)=t^λyσ(x); σ⁻¹(y) is not the required conjugator. GHN Lemma 3.6.3 uses the normal-form chamber factor.

### E4 — misprint

[he21] Published proof of Proposition 5.1 and Corollary 5.3, p. 8.

**Problem.** The cocharacter differences are expressed with roots, and two full-cone displays require strictly positive coefficients.

**Correction.** Use simple coroots and nonnegative integral coefficients in those full cones.

**Reason.** The variables are cocharacters; equal inputs give zero differences, so strict positivity on every simple root is impossible.

**Effect.** nothing. Previously recorded in PAPER-HE-21/E3–E4.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The p. 8 arguments are in the cocharacter lattice and allow zero differences. Simple coroots and nonnegative coefficients give the type-correct version; strict cones cannot contain zero.

### E5 — gap

[he21] Published §5.4, p. 12, proof of dim X₂≥dim X₃+N₁.

**Problem.** The proof excludes the union of proper closed subsets indexed by source components without establishing their finiteness on the relevant target.

**Correction.** Use a bounded finite-type source diagram over a generic point of a maximal-dimensional target piece and the fibre dimension theorem.

**Reason.** The ADLV can have infinitely many components. Properness of each exceptional subset does not by itself prove their union is proper.

**Effect.** the proof. The bounded-model obligation is tracked as G2; not asserted to be an author-endorsed erratum.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The p. 12 proof has not established finiteness of the component-indexed exceptional union. This is confirmed as a local proof obligation, not a claim that the theorem is false; G2 retains the bounded generic-point argument.

### E6 — gap

[he21] Published §6.3, p. 14.

**Problem.** The basic nonemptiness of the reduced a t^γ is justified by He15 Theorem 2.27.

**Correction.** Supply the non-shrunken basic seed by the positive cocenter/twisted-Coxeter argument, the γ=0 finite-quotient case, and explicit datum transport.

**Reason.** The reduction theorem does not say a t^γ is shrunken, while the cited basic theorem needs that condition.

**Effect.** the proof. Previously recorded in PAPER-HE-21/E1; retained as G7.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** He21 §6.3 p. 14 cites He15 Theorem 2.27, whose statement on PDF p. 37 requires shrunkenness. The reduced a t^γ is not proved shrunken. G7 keeps the replacement seed proof open.

### E7 — gap

[he21] Published §2.2, p. 5; §5.2, p. 9; §5.4, pp. 10–12.

**Problem.** The reduction uses fundamental coweights and translations without explicitly separating the full coweight lattice from the original cocharacter lattice.

**Correction.** Work in P∨ and prove componentwise adjoint descent and integral κ transport before drawing conclusions for the original G.

**Reason.** For simply connected A₁, ω∨=α∨/2 is not a cocharacter. A formal intermediate translation by ω∨ cannot be made in the original Weyl extension.

**Effect.** the proof. Previously recorded in PAPER-HE-21/E6; retained as G7.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The fundamental coweights in §5.4 pp. 10–11 need only lie in P∨. Simply connected A₁ has ω∨=α∨/2 outside its cocharacter lattice. G7 retains original integral-κ descent.

### E8 — error

[ghnerr] Official erratum, Proposition 0.0.1, pp. 1–2, correcting GHN15 §2.2.

**Problem.** The original global flag-comparison claim is stronger than what the corrected proof gives.

**Correction.** Use the stated componentwise comparison with p∤|π₁(G_ad)|; a global immersion additionally requires injectivity on components.

**Reason.** A kernel on component labels prevents a global immersion even when each component map is an isomorphism.

**Effect.** a stated result. Official erratum, Proposition 0.0.1.

**Search record.** Official author-hosted GHN erratum, all three pages read on 2026-10-19.

**Independent review: confirmed.** Official Proposition 0.0.1 p. 1 restricts the good-characteristic componentwise comparison and separates the component-injectivity criterion for a global immersion.

### E9 — error

[ghnerr] Official erratum, Proposition 0.0.2, p. 2, correcting GHN15 Proposition 3.5.1.

**Problem.** The original uniqueness assertion for a Levi class in a G-class lacks the necessary basic restriction.

**Correction.** Retain basicness for uniqueness; for a general b quantify over all Levi classes mapping to [b].

**Reason.** In GL₂ the two diagonal elements with slopes (1,0) and (0,1) are distinct torus classes in one nonbasic GL₂ class.

**Effect.** a stated result. Official erratum, Proposition 0.0.2.

**Search record.** Official author-hosted GHN erratum, all three pages read on 2026-10-19.

**Independent review: confirmed.** Official Proposition 0.0.2 is on p. 2. It imposes basicness; the GL₂ diagonal torus example gives two distinct Levi classes in one nonbasic G-class.

### E10 — misprint

[he14] Published Proposition 11.6 and proof, pp. 399–400.

**Problem.** The statement uses an undefined finite factor v in its support condition, and the twisted induction contains ordinary-support and unshifted-index expressions.

**Correction.** Use the actual factor x, retain σ-saturated support throughout, and use the σ-shifted final simple reflection. Check the choice of a reflection outside the excluded support set.

**Reason.** The statement’s variables determine x; ordinary support is not stable under a nontrivial diagram automorphism. G7 retains the actual induction proof.

**Effect.** the proof. PAPER-HE-21/E9–E11 record these slips and point to a later reformulation in He–Zhou–Zhu Proposition 3.4.2. That later proof has not been verified in this run.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** Proposition 11.6 pp. 399–400 has the undefined factor and inconsistent twisted-support/index expressions. The identified slips are confirmed; the repaired twisted induction itself remains G7.

### E11 — misprint

[zhu17] Published §3.1.1, p. 455.

**Problem.** The framing torsor is initially placed over O although b is only defined over L.

**Correction.** Base change the framing to O_L and evaluate the perfect functor on algebras over the algebraic residue closure, with the finite residue field and Frobenius specified.

**Reason.** A general b∈G(L) cannot be evaluated on a residue algebra lacking the algebraic residue closure.

**Effect.** nothing. Previously recorded in PAPER-ZHU-17/E62.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The framing on p. 455 must be evaluated after O_L coefficient extension so a general b∈G(L) acts. This is a base convention clarification, without changing the intended perfect functor.

### E12 — misprint

[zhu17] Published proof of Proposition 3.3, p. 458, and Lemma 3.5, p. 459.

**Problem.** The embeddings are listed with the positive Frobenius cycle while the displayed product uses the negative cycle.

**Correction.** Set τ_i=σ^(−i)τ₀ while retaining Nm(b)=b_τ₀σ(b_τ₁)⋯σ^(d−1)(b_τ_(d−1)); equivalently reverse the subscripts in all products and bounds.

**Reason.** Under the specified tensor-product decomposition, (σx)_τ=σ(x_(σ⁻¹τ)). In degree 3 the displayed positive cycle has the wrong component.

**Effect.** nothing. Previously recorded in PAPER-ZHU-17/E63.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The component action in Proposition 3.3 p. 458 and Lemma 3.5 p. 459 uses the inverse Frobenius cycle. The degree-three tensor decomposition detects the incompatible positive indexing.

### E13 — misprint

[ham15] Published proof of Proposition 2.9(4), p. 12811, final displayed maximum.

**Problem.** The last displayed maximum drops the semi-infinite intersection fibre term from the preceding calculation.

**Correction.** Keep d(μ,μ_M) and both Newton correction terms, as in the proposition’s statement and the preceding fibre computation.

**Reason.** The variable fibre term cannot be removed in general; the stated proposition retains it.

**Effect.** nothing. No correction located in the sources checked; the plan uses the proposition’s statement.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** The final maximum on p. 12811 omits the d and Newton corrections retained in Proposition 2.9(4). The plan uses the proposition’s statement, with b basic in M.

### E14 — misprint

[zhu17] Published Appendix A.3.5(ii), p. 481, display (A.3.4).

**Problem.** The arrow labelled as forgetting equivariance goes from J-equivariant objects to J/J₁-equivariant objects.

**Correction.** Write the forgetful direction from J/J₁-equivariant objects to J-equivariant objects, restricting along J→J/J₁; the inverse equivalence requires connected J₁ acting trivially.

**Reason.** Restriction of an equivariant structure along the quotient map has this direction. The intended equivalence remains valid.

**Effect.** nothing. Previously recorded in PAPER-ZHU-17/E69.

**Search record.** Relevant PAPER-HE-21 and PAPER-ZHU-17 sourceIssues and review notes were read on 2026-10-19. Title/erratum/correction searches and the Annals article metadata were checked on 2026-10-19; no separate correction located. This is not an exhaustive absence claim.

**Independent review: confirmed.** In (A.3.4) p. 481 restriction along J→J/J₁ runs from quotient-equivariant to J-equivariant objects. The reverse equivalence uses connectedness and trivial action as in the surrounding proof.

## Suggested file and implementation boundary

The suggested file contains two real-bodied elementary definitions on existing group and coset carriers: relativeFrobenius and points. It states representative independence, framing/centralizer transport, double-coset-label invariance and small computations. It contains no geometric stand-ins, assumed geometric axiom bundle, new B(G) carrier or fabricated class-polynomial interface. The numerical and geometric end theorems above remain reader targets because their carriers are absent at the pins. The file is a statement scaffold, not an implementation of the roadmap.

## References and reading record

The public versions below were retrieved and their listed passages inspected. Hashes identify the version used; published pagination is used unless a locator says PDF page.

- **[he21] Xuhua He.** [Cordial elements and dimensions of affine Deligne–Lusztig varieties](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/5A27DBF48CAEF6DA56A313061848574C/S205050862100010Xa.pdf/cordial-elements-and-dimensions-of-affine-deligne-lusztig-varieties.pdf). Forum of Mathematics, Pi 9 (2021), e9; published 15-page article. Accessed 2026-10-19. Read: §§1–6, pp. 1–14; closure notation on p. 7 checked on the page image. SHA-256: `d53843f0c8875cf1e14173ad271e025bd30f177fe319a7d83926629d454683dd`.

- **[zhu17] Xinwen Zhu.** [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/wp-content/uploads/annals-v185-n2-p02-p.pdf). Annals of Mathematics 185 (2017), 403–492; published version. Accessed 2026-10-19. Read: §3.1, pp. 455–460; Lemma 1.22 and Proposition 1.23, p. 428; Proposition 2.3, p. 432; Definition A.13, Proposition A.15 and Corollary A.16, pp. 471–472. Proposition A.17 and proof, pp. 472–473; Appendix A.3.4, pp. 480–481, trace input and its hypotheses. SHA-256: `5d50b415048f3a5ad14bccf1c8da83fc5a680fcf13b60911ca269daa474431a7`.

- **[he14] Xuhua He.** [Geometric and homological properties of affine Deligne–Lusztig varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n1-p06-p.pdf). Annals of Mathematics 179 (2014), 367–404; published version. Accessed 2026-10-19. Read: §§1–2, pp. 371–376; Theorem 4.8 and proof, pp. 382–383; §6, pp. 387–388; Theorem 7.1 and proof, pp. 389–390; §§10–12, pp. 395–402. SHA-256: `372c913d305f2b9d5f285cfe830d00f5ad3fd98242e31a54991fbf2474b72cbf`.

- **[he15] Xuhua He.** [Hecke algebras and p-adic groups](https://arxiv.org/pdf/1511.01386). arXiv:1511.01386v3, 21 November 2016; survey corresponding to Current Developments in Mathematics 2015. Accessed 2026-10-19. Read: Theorem 2.23, PDF p. 34; §2.9.4 and Theorem 2.27, pp. 36–37; Theorem 2.30, p. 38. SHA-256: `f6170c52ce24599a5b1b6d7991ae9c9b98a8be8e5cf8753b9a335e74d3fe3cdc`.

- **[gh10] Ulrich Görtz and Xuhua He.** [Dimensions of affine Deligne–Lusztig varieties in affine flag varieties](https://arxiv.org/pdf/1006.2291). arXiv:1006.2291v1; Documenta Mathematica 15 (2010), 1009–1028. Accessed 2026-10-19. Read: §§2.4–2.5, PDF pp. 6–9; Proposition 2.5.2 and Corollary 2.5.3. SHA-256: `8b1261cfaf3e37dc4b10ee643ad2836c741daf5cef0347b0268a9d7ee17883c8`.

- **[mv20] Elizabeth Milićević and Eva Viehmann.** [Generic Newton points and the Newton poset in Iwahori-double cosets](https://mediatum.ub.tum.de/doc/1600930/file.pdf). Forum of Mathematics, Sigma 8 (2020), e50; published author-hosted copy, DOI 10.1017/fms.2020.46. Accessed 2026-10-19. Read: §3.1, PDF pp. 5–8; Definition 3.14, Theorem 3.16 and proof, Corollary 3.17, PDF pp. 9–10. SHA-256: `2f8585e829abf2ff34758d758240d8685821707931d3e5b5a91b3b5136e58bf4`.

- **[ghn15] Ulrich Görtz, Xuhua He and Sian Nie.** [P-alcoves and nonemptiness of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/1211.3784). arXiv:1211.3784; published Annales scientifiques de l’ÉNS 48 (2015), 647–665; corrected by the separate erratum. Accessed 2026-10-19. Read: Theorems A and B, PDF p. 3; Definition 3.3 and Theorem 3.3.1, pp. 10–11; §§3.5–3.6, pp. 13–15. SHA-256: `c2293924bff455023796da17c56de70dea547d0e1b6dc41f06ab4216aca135f0`.

- **[ghnerr] Ulrich Görtz, Xuhua He and Sian Nie.** [Erratum to P-alcoves and nonemptiness of affine Deligne–Lusztig varieties](https://www.esaga.uni-due.de/f/ulrich.goertz/pdf/Erratum-GHN.pdf). Official author-hosted 3-page erratum. Accessed 2026-10-19. Read: Entire erratum, pp. 1–3; Propositions 0.0.1 and 0.0.2. SHA-256: `cf7efbf887e8202c7efd7590e2eebd85c93c89bea81c26fa39a80af8082399c0`.

- **[ghkr06] Ulrich Görtz, Thomas J. Haines, Robert E. Kottwitz and Daniel C. Reuman.** [Dimensions of some affine Deligne–Lusztig varieties](https://arxiv.org/pdf/math/0504443). arXiv:math/0504443; Annales scientifiques de l’ÉNS 39 (2006), 467–511. Accessed 2026-10-19. Read: Proposition 5.3.1 and proof, PDF pp. 19–21; Lemma 5.4.3, pp. 27–28; Corollary 5.4.4, Proposition 5.6.1 and Theorem 5.8.1 with proofs, pp. 29–32. SHA-256: `bd8387fb533dd8340921e6e89b4004c86ce255b06bdcfa865a35addada7e6943`.

- **[vie06] Eva Viehmann.** [The dimension of some affine Deligne–Lusztig varieties](https://arxiv.org/pdf/math/0510385). arXiv:math/0510385v2, 21 July 2006; Annales scientifiques de l’ÉNS 39 (2006), 513–526. Accessed 2026-10-19. Read: §§1–5, PDF pp. 1–12; definitions, lattice chart proof, Proposition 5.2 and entire proof of Theorem 5.3. SHA-256: `73de6d27413fbf83a908583306470166594d96753e9362a3c4fa3e47c8ea911c`.

- **[ham15] Paul Hamacher.** [The dimension of affine Deligne–Lusztig varieties in the affine Grassmannian](https://mediatum.ub.tum.de/doc/1319937/1319937.pdf). International Mathematics Research Notices 2015, 12804–12839; published author-hosted copy. Accessed 2026-10-19. Read: Theorem 1.1 and conventions, pp. 12804–12805; all of §2, pp. 12806–12812; §3 setup, pp. 12813–12815. SHA-256: `dbfc2cebd3477d0e13eb710876531db3d3fecedecc6e118bf1b9d0401e0961e0`.

- **[ckv15] Miaofen Chen, Mark Kisin and Eva Viehmann.** [Connected components of affine Deligne–Lusztig varieties in mixed characteristic](https://arxiv.org/pdf/1307.3845). arXiv:1307.3845; Compositio Mathematica 151 (2015), 1697–1762; numbering here is that of the downloaded arXiv version. Accessed 2026-10-19. Read: Lemma 3.1.1 and proof, PDF pp. 20–21; Proposition 3.3.1, PDF p. 24, for the boundary audit only. SHA-256: `715c628980850c698445eb7a472ab7aa7b933d61e9ba4ddddf76b82eddd79cfd`.

- **[vie14] Eva Viehmann.** [Truncations of level 1 of elements in the loop group of a reductive group](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n3-p03-p.pdf). Annals of Mathematics 179 (2014), 1009–1040; published version. Accessed 2026-10-19. Read: Introduction and conventions, pp. 1009–1011; Proposition 5.5 and Corollary 5.6 with proof, pp. 1026–1028. SHA-256: `453cba0430ce4b94d51ea1e7eb3cf74ba11102d7f624b2fa739cc681b4709bf1`.

- **[hn14] Xuhua He and Sian Nie.** [Minimal length elements of extended affine Weyl groups](https://archive.ymsc.tsinghua.edu.cn/pacm_download/315/8989-affmin-2.pdf). Author copy; Compositio Mathematica 150 (2014), 1903–1927. Accessed 2026-10-19. Read: Introduction, PDF pp. 2–4; Theorem 2.9 and Corollary 2.10 with proofs, PDF pp. 10–12; §5 and §6 introduction, PDF pp. 25–27. SHA-256: `370abc45c00d91279f69d115ba10da758a23dfe3b56d1245d0a5370372807e09`.
