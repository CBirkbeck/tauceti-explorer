# Adic Spaces PartII, Part II: rigid-analytic Zariski geometry, classical points and resolution

**Purpose.** This roadmap supplies the Zariski geometry of rigid spaces over a complete nonarchimedean field: what a Zariski closed subset is and when it is nowhere dense, irreducible components, the singular locus and its stratification, classical and weakly Shilov points, resolution of singularities in characteristic zero, and the analytic manifolds of classical points of smooth spaces with the constant rank theorem. These are the general facts that Howe–Klevdal's bi-analytic Ax–Lindemann theorem (*Admissible pairs and p-adic Hodge structures II*, Invent. Math. 244 (2026)) uses without proof, and that any argument about Zariski closures inside rigid spaces needs.

**Scope and boundaries.** It starts where Adic Spaces, Part II (AdicSpacesPartII) stops. That roadmap supplies adic spaces locally of finite type, Huber's comparison with Tate's rigid spaces, smooth and étale morphisms with the Jacobian criterion, coherent sheaves and coherent ideals, Kiehl's proper mapping theorem, the equidimensionality of affinoid domains and the identity principle on connected normal rigid spaces (Conrad Lemmas 2.1.4–2.1.5); the Tau Ceti roadmap AdicSpaces supplies Huber pairs and adic spectra; AdicSpacesPartII supplies affinoid theory. Its excellence theorem currently assumes characteristic zero, so all-characteristic excellence is requested explicitly. Diamonds of rigid spaces, the full faithfulness of Y ↦ Y^♢ on seminormal rigid spaces and the surjectivity criterion for maps of v-sheaves come from DiamondsAndVStacks D4 and D6. Excellent rings, regular ring maps and the openness of regular loci come from SchemeAndStackFoundations SF.0; resolution of singularities of varieties (Bierstone–Milman) from AlgebraicModuliForArithmeticGeometry R09.7; quotients G/H of algebraic groups from the Tau Ceti roadmap ReductiveGroups, Layer 3. Admissible pairs, Hodge loci and the Ax–Lindemann theorem itself belong to the proposed roadmap on admissible pairs and p-adic Hodge structures, which imports this one.

**Conventions.** K is a field complete for a nontrivial nonarchimedean absolute value of rank one, with ring of integers K°, maximal ideal K°° and residue field K̃. A rigid space over K is an adic space locally of finite type over Spa(K, K°); a point x ∈ |X| is classical if its residue field is finite over K. On a quasi-separated rigid space, Huber's functor identifies Tate's admissible opens, analytic subsets and coherent sheaves with the corresponding adic notions, and Conrad's statements are read through it. Dimensions are Krull dimensions; dim_x X is the local dimension at x ∈ |X|. A Zariski closed subset is the support of a coherent ideal; "nowhere dense" for it means it contains no nonempty open subset of |X|. Smoothness is smoothness over Spa(K, K°). Characteristic zero is assumed exactly where stated: in RZ.2's identification of smooth and regular loci and the stratification, in RZ.5 and in RZ.6's constant-rank and identity theorems.

**Sources.** Howe–Klevdal II (arXiv:2308.11064v2), §§2.2, 5.3, 9.2–9.3; Conrad, *Irreducible components of rigid spaces* (Ann. Inst. Fourier 49 (1999)), §§1.2, 2.1–2.3; Bhatt–Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry* (Compos. Math. 158 (2022); arXiv:2101.09759v2), §2.1; Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case* (Duke Math. J. 161 (2012); arXiv:0904.1592), §§1.2, 2.2–2.3, 5; Schneider, *p-Adic Lie Groups* (Springer 2011), §§5–9; Conrad, *Moishezon spaces in rigid geometry* (2010 author version), Theorem 2.1.1 and Lemma 2.1.3; Poineau, *Les espaces de Berkovich sont angéliques* (2013), §4.

**Layers.** RZ.0 Zariski closed subsets, local dimension and nowhere density; RZ.1 normalization and irreducible components; RZ.2 regular and smooth loci, stratification and rank loci; RZ.3 classical points, rigid analytic points and the Gauss point; RZ.4 Shilov and weakly Shilov points; RZ.5 functorial resolution of singularities; RZ.6 analytic manifolds of classical points and the constant rank theorem.

**Non-goals.** Zariski-constructible sheaves and the six-functor formalism of Bhatt–Hansen, generic smoothness and generic flatness (their §§2.2–2.5), a general development of Berkovich spaces beyond the rank-one comparisons used here, embedded resolution and resolution in positive or mixed characteristic, and the base-change theory of irreducible components (Conrad §3) are not targets.

## How to use this plan

The statements and APIs below specify mathematical targets. The suggested Lean file gives only forms expressible on carriers available at the pinned libraries; its admitted proofs do not certify any target. Dimensions use Krull dimension, and connectedness includes nonemptiness. For analytic rational-point manifolds, Hausdorffness is asserted when the rigid space is separated.

The parent roadmap supplies the foundational adic and affinoid objects. Reuse the current Tau Ceti construction of the Gauss point of a one-variable centred disc; the closure and density statements here extend its uses. The rank-one Berkovich comparisons used in RZ.4 have explicit source boundaries below.

## RZ.0 — Zariski closed subsets, local dimension and nowhere density

Rigid spaces are adic spaces locally of finite type over Spa(K, K°), K a complete nonarchimedean field with a nontrivial rank-one valuation; through Huber's functor of AdicSpacesPartII R1 the quasi-separated ones are Tate's classical rigid spaces. Targets:

- **Zariski closed subsets**: the supports V(𝓘) of coherent ideals (AdicSpacesPartII R3), their reduced structures, finite unions, intersections, preimages and their traces on affinoid opens; the comparison with Tate's analytic subsets.
- **Local dimension** dim_x X at every point of |X|, its agreement with the Krull dimension of the local ring at classical points, and its monotonicity under locally closed immersions.
- **Nowhere density**: for a Zariski closed Z ⊆ X, containing no nonempty open of |X|, containing no nonempty affinoid open, the defining ideal lying in no minimal prime on each affinoid, and dim O_{Z,z} < dim O_{X,z} at every classical z are equivalent (Conrad, *Irreducible components of rigid spaces*, §2.1, p. 10).
- **Images of proper morphisms are Zariski closed**: the support of the coherent direct image of the structure sheaf (Kiehl's proper mapping theorem, AdicSpacesPartII R3).
- **Regularity of affinoid restriction**: affinoid-domain inclusions and smooth affinoid morphisms give regular ring maps; use excellence in the stated characteristic.

### Zariski closed subsets of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset` (definition).** Let K be a complete nonarchimedean field with a nontrivial rank-one absolute value and X a rigid space over K (an adic space locally of finite type over Spa(K, K°)). A subset Z ⊆ |X| is Zariski closed if Z = Supp(O_X/𝓘) = {x ∈ |X| : 𝓘_x ≠ O_{X,x}} for a coherent ideal 𝓘 ⊆ O_X (AdicSpacesPartII:R3/coherent-ideal-closed-subspace); equivalently Z is the underlying set of a closed adic subspace. On an affinoid open U = Spa(A, A°) ⊆ X with 𝓘|_U = Ĩ for an ideal I ⊆ A, Z ∩ U = V(I) = {x ∈ U : |f(x)| = 0 for all f ∈ I}. The reduced structure on Z is the closed adic subspace Z_red defined by the largest coherent ideal with support Z, which on U is √I; Zariski closed subsets correspond bijectively to radical coherent ideals. A Zariski open subset is the complement of a Zariski closed subset. The Zariski closed subsets of X are the closed sets of a topology on |X| coarser than its own topology.

**Named signature.** `TauCeti.Rigid.IsZariskiClosed`.

**Planet.** Zariski closed subset.

**Hypotheses and conventions.**

- X is locally noetherian, so coherent ideals and their radicals are coherent and every affinoid open has a strongly noetherian Tate coordinate ring.
- On a quasi-separated X, Huber's functor (AdicSpacesPartII:R1/rigid-adic-comparison-functor) carries Tate's analytic subsets (zero loci of coherent ideals on the classical rigid space) to Zariski closed subsets, and the classical points of V(I) are the maximal ideals of A containing I.

**Construction or proof.**

1. The support of the coherent sheaf O_X/𝓘 is closed, and on U it is V(I) because (O_X/𝓘)_x = 0 iff some f ∈ I is a unit at x iff |f(x)| ≠ 0 for some f ∈ I.
2. For I ⊆ A, radical formation commutes with affinoid restriction because the quotient by √I is reduced and remains reduced on rational domains (AdicSpacesPartII:R5/reduced-affinoid-rational-localisation), and arbitrary affinoid restrictions are covered by rational domains. Flatness preserves the exact quotient sequence; reducedness, rather than flatness alone, identifies its nilradical. The resulting radical ideals glue coherently.
3. Unions and intersections: V(𝓘) ∪ V(𝓙) = V(𝓘𝓙) and ∩_α V(𝓘_α) = V(Σ_α 𝓘_α), the sum being coherent locally because A is noetherian; hence a topology.
4. Preimages: for f : Y → X, f^{-1}(V(𝓘)) = V(𝓘·O_Y).

**Inputs.** `AdicSpacesPartII:R3/coherent-ideal-closed-subspace`, `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`, `AdicSpacesPartII:R1/rigid-analytic-space`, `mathlib:Ideal.radical`, `tauceti:TauCeti.ValuationSpectrum.spa`, `AdicSpacesPartII:R5/reduced-affinoid-rational-localisation`.

**API.**

- `TauCeti.Rigid.IsZariskiClosed` (characterisation): Z ⊆ |X| is Zariski closed iff Z = Supp(O_X/𝓘) for a coherent ideal 𝓘.
- `TauCeti.Rigid.IsZariskiClosed.inter_affinoid` (characterisation): For U = Spa(A, A°) affinoid open, Z ∩ U = V(I) for an ideal I of A, and every V(I) is Zariski closed in U.
- `TauCeti.Rigid.IsZariskiClosed.union` (structure): Finite unions of Zariski closed subsets are Zariski closed: V(𝓘) ∪ V(𝓙) = V(𝓘𝓙).
- `TauCeti.Rigid.IsZariskiClosed.iInter` (structure): Arbitrary intersections of Zariski closed subsets are Zariski closed: ∩ V(𝓘_α) = V(Σ 𝓘_α).
- `TauCeti.Rigid.IsZariskiClosed.preimage` (functoriality): For f : Y → X a morphism of rigid spaces, f^{-1}(V(𝓘)) = V(𝓘O_Y) is Zariski closed.
- `TauCeti.Rigid.IsZariskiClosed.isClosed` (compatibility): A Zariski closed subset is closed in |X|.
- `TauCeti.Rigid.zariskiClosedEquivRadicalIdeal` (equivalence): Zariski closed subsets of X correspond bijectively to radical coherent ideals; Z ↦ the ideal of Z_red.
- `TauCeti.Rigid.reducedStructure` (constructor): The reduced closed subspace Z_red ↪ X with |Z_red| = Z; every closed subspace with underlying set Z contains Z_red.
- `TauCeti.Rigid.IsZariskiClosed.classicalPoints` (characterisation): The classical points of V(I) ∩ Spa(A, A°) are the maximal ideals of A containing I.
- `TauCeti.Rigid.IsZariskiClosed.reduction` (simp): Z is Zariski closed in X iff it is Zariski closed in X_red; V(𝓘) = V(√𝓘).

**Unit tests.**

- `zariskiClosed_disc_origin` (computation): On the closed unit disc over K, V(T) consists of the single classical point T = 0 and does not contain the Gauss point.
- `zariskiClosed_empty_univ` (degenerate): V(O_X) = ∅ and V(0) = |X|; on X = Spa(K⟨T⟩/(T²)), V(T) = |X|.
- `zariskiClosed_classical_compat` (compatibility): For A a K-affinoid algebra and I ⊆ A, the classical points of V(I) are exactly MaximalSpectrum of A/I, matching Tate's analytic subset of Sp A.
- `not_zariskiClosed_subdisc` (non-example): For 0 < |ϖ| < 1, the topological closure of {|T| ≤ |ϖ|} in the unit disc is proper and has nonempty interior. It is not Zariski closed: the identity principle forces a Zariski closed subset containing that subdisc to be the whole disc. No classification or count of boundary specializations is needed.

**Uses.**

- Howe–Klevdal II, §1.1 p. 5 and Definition 1.1.2: the Zariski topology in which Hodge and Hodge–Tate Zariski closures are taken
- Howe–Klevdal II, Lemma 2.2.3: closed rigid analytic subdiamonds are exactly the Zariski closed subsets
- Bhatt–Hansen, Corollary 2.10 (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense): nowhere dense Zariski closed sets contain no weakly Shilov point
- AdicSpacesPartIIPartII:RZ.1/irreducible-components: irreducible components are Zariski closed subsets with their reduced structure

**Checks and worked examples.**

- On the closed unit disc D = Spa(K⟨T⟩, K°⟨T⟩), V(T) is the single classical point T = 0, and the Gauss point does not lie on any proper Zariski closed subset.
- On Spa(K⟨T⟩/(T²)), V(T) is all of |X|: Zariski closed subsets see only the reduction.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §1.1, paragraph before Definition 1.1.2, p. 5. Recalls the Zariski topology on a rigid analytic variety: closed sets are those cut out on every affinoid open by finitely many functions (the extraction records the misprint U for C there).
- Brian Conrad, *Irreducible components of rigid spaces*, Notation, p. 2, and §2.1, p. 10. Analytic sets of a rigid space are zero loci of coherent ideals, given their canonical reduced structure.

### Local dimension of a rigid space at a point

**Target `AdicSpacesPartIIPartII:RZ.0/local-dimension` (definition).** For X a rigid space over K and x ∈ |X|, the local dimension is dim_x X = min{dim O_X(U) : U ∋ x an affinoid open}, where dim O_X(U) is the Krull dimension of the K-affinoid algebra O_X(U) (−∞ for the empty space). The dimension of X is dim X = sup_{x} dim_x X. For a Zariski closed Z ⊆ X and z ∈ Z, dim_z Z means the local dimension of Z_red at z.

**Named signature.** `TauCeti.Rigid.localDim`.

**Planet.** Local dimension.

**Hypotheses and conventions.**

- The minimum exists because the Krull dimension of a nonzero K-affinoid algebra is a natural number (Noether normalization, AdicSpacesPartII:R0/affinoid-noether-normalisation).
- At a classical point, dim_x X equals dim O_{X,x}; prove this using the minimal primes of one affinoid ring and the equidimensionality of affinoid domains, without using global irreducible components.

**Construction or proof.**

1. If U′ ⊆ U are affinoid neighbourhoods of x then dim O(U′) ≤ dim O(U): an affinoid subdomain inclusion is flat with the same completed local rings at classical points (AdicSpacesPartII:R1/rigid-local-ring-completion), and the Krull dimension of an affinoid algebra is the maximum of the dimensions of its local rings at maximal ideals (Jacobson, AdicSpacesPartII:R0/affinoid-jacobson).
2. Hence dim_x X is computed on arbitrarily small affinoid neighbourhoods, x ↦ dim_x X is upper semicontinuous, and dim_x Y ≤ dim_x X for a locally closed immersion Y ↪ X (a closed subspace of an affinoid has smaller Krull dimension; open immersions do not change local dimension).
3. On U = Spa(A), write its finitely many minimal primes as p_i. Remove the closed union V(p_i) for those not contained in the maximal ideal m_x. Each remaining A/p_i is an affinoid domain, whose maximal localizations have dimension dim(A/p_i). Restrict to a small affinoid neighbourhood inside this complement. The maximum of these dimensions is both dim_x X and dim A_m; completion identifies the latter with dim O_{X,x}.

**Inputs.** `AdicSpacesPartII:R0/affinoid-noether-normalisation`, `AdicSpacesPartII:R0/affinoid-jacobson`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:R1/affinoid-domain-equidimensional`, `mathlib:ringKrullDim`, `mathlib:IsLocalRing`.

**API.**

- `TauCeti.Rigid.localDim` (data): dim_x X ∈ ℕ ∪ {−∞}, the minimum of the Krull dimensions of the affinoid neighbourhoods of x.
- `TauCeti.Rigid.localDim_eq_ringKrullDim_stalk` (characterisation): At a classical point x, dim_x X = ringKrullDim O_{X,x}.
- `TauCeti.Rigid.localDim_le_of_mem` (relation): If x ∈ U ⊆ X with U affinoid open then dim_x X ≤ ringKrullDim O_X(U), with equality for U small enough.
- `TauCeti.Rigid.localDim_upperSemicontinuous` (other): x ↦ dim_x X is upper semicontinuous on |X|.
- `TauCeti.Rigid.localDim_le_of_immersion` (functoriality): For a locally closed immersion i : Y ↪ X, dim_y Y ≤ dim_{i(y)} X; for an open immersion equality holds.
- `TauCeti.Rigid.localDim_reduced` (simp): dim_x X = dim_x X_red.
- `TauCeti.Rigid.dim` (data): dim X = sup_x dim_x X; for X affinoid it is the Krull dimension of O(X).
- `TauCeti.Rigid.localDim_of_smooth` (compatibility): At a point where X → Spa K is smooth, dim_x X is the rank of Ω_{X/K} near x (RZ.2).

**Unit tests.**

- `localDim_polydisc` (computation): For D^n the closed unit polydisc over K, dim_x D^n = n for every x ∈ |D^n|, including the Gauss point.
- `localDim_point` (degenerate): dim_x Spa(L) = 0 for a finite extension L/K, and the empty space has dimension −∞.
- `localDim_disjoint_union` (computation): For X = Spa(K⟨T⟩ × K), dim_x X = 1 on the disc component and 0 at the isolated point: local dimension is not constant on a non-equidimensional space.
- `localDim_eq_krull_affinoid` (compatibility): For X = Spa(A, A°) with A a K-affinoid domain of Krull dimension d, dim_x X = d at every point.
- `localDim_ne_tangent_dim` (non-example): At the cusp of Spa(K⟨X,Y⟩/(Y² − X³)) the local dimension is 1 while the Zariski tangent space has dimension 2: a definition through tangent spaces fails.

**Uses.**

- Bhatt–Hansen, Proposition 2.9(2) (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion): weakly Shilov points are the rank-one points with trdeg K̃_x = dim_x X
- Howe–Klevdal II, proof of Theorem 9.1.3, p. 58: dimension comparison forcing Y to be a connected component of M_C/K_b
- AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria: nowhere density as a strict drop of local dimension

**Checks and worked examples.**

- The closed unit polydisc of dimension n has local dimension n at every point, the Gauss point included.
- Spa(K⟨T⟩ × K) has local dimension 1 at the points of the disc and 0 at the isolated classical point.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Proposition 2.9(2) and proof of Corollary 2.10, p. 8. Uses the local dimension dim_x X of a rigid space at an arbitrary point and the inequality dim_x Z < dim_x X for a nowhere dense Zariski closed Z.
- Brian Conrad, *Irreducible components of rigid spaces*, §2.2, paragraph after Definition 2.2.2, p. 14. For an irreducible rigid space all local rings O_{X,x} have the same dimension, the dimension of X, which equals that of its normalization.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Compares local dimensions dim_y Y ≥ dim_y V ≥ dim_{f(y)} Fl along a locally closed smooth V ⊆ Y.

### Criteria for a Zariski closed subset to be nowhere dense

**Target `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria` (theorem).** Let X be a rigid space over K and Z ⊆ X a Zariski closed subset. The following are equivalent: (a) Z contains no nonempty open subset of |X|; (b) Z contains no nonempty affinoid open subset of X; (c) for every affinoid open Spa(A, A°) ⊆ X with Z ∩ Spa(A, A°) = V(I), the ideal I lies in no minimal prime of A (equivalently Spec(A/I) is nowhere dense in Spec A); (d) dim O_{Z,z} < dim O_{X,z} for every classical point z ∈ Z; (e) dim_z Z < dim_z X for every z ∈ Z. Such Z is called nowhere dense. The condition is local on X and depends only on X_red and Z_red.

**Named signature.** `TauCeti.Rigid.IsNowhereDense.iff_ideal_not_le_minimalPrime`.

**Planet.** Nowhere dense Zariski closed sets.

**Hypotheses and conventions.**

- X is a rigid space over K (locally noetherian); Z carries its reduced structure when local rings O_{Z,z} are formed.
- Condition (c) is the ring-theoretic predicate Ideal.IsNowhereDense of the suggested file.
- The equivalence with (d) is Conrad's formulation for Tate's rigid spaces; on a quasi-separated X it is transported through Huber's functor.

**Construction or proof.**

1. (a) ⇔ (b): affinoid opens (rational subsets) form a basis of |X| and are nonempty when their coordinate ring is nonzero.
2. (b) ⇒ (c): if I ⊆ p for a minimal prime p of A, choose g lying in every other minimal prime but not in p (prime avoidance). g is not nilpotent, so its supremum norm is positive (AdicSpacesPartII:R0/affinoid-maximum-modulus) and for c ∈ K× with |c| ≤ |g|_sup the Laurent domain {|g| ≥ |c|} is a nonempty affinoid open. At each of its points x, supp(x) does not contain g, so it contains the minimal prime p; hence the domain lies in V(p) ⊆ V(I) = Z.
3. (c) ⇒ (b): if Z ⊇ U = Spa(B, B°) ≠ ∅ inside Spa(A, A°), then I·B is nilpotent; B has a minimal prime q and A → B is flat (AdicSpacesPartII:R1/affinoid-subdomain-flat), so by going down q ∩ A is a minimal prime of A containing I.
4. (c) ⇔ (d): at a classical point z with maximal ideal m, the completions of A_m and O_{X,z} agree (AdicSpacesPartII:R1/rigid-local-ring-completion), so dimensions may be computed in A_m; dim (A/I)_m < dim A_m for all m ⊇ I iff no minimal prime of A contained in m contains I, by catenarity of the excellent ring A (SchemeAndStackFoundations:SF.0/excellent-ring) and the equidimensionality of affinoid domains (AdicSpacesPartII:R1/affinoid-domain-equidimensional).
5. For the dimension criterion, work with the finite minimal primes p_i of an affinoid A. A closed subset containing V(p_i) has the same local dimension at a classical point of that component away from the other components. Conversely, if I is contained in none of the p_i, each closed subset V(I+p_i) has dimension strictly smaller than the equidimensional affinoid domain A/p_i; localizing and taking the maximum over the components through a point gives strict local dimension drop. This is the affinoid argument in Conrad §2.1, p. 10.

**Inputs.** `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `AdicSpacesPartII:R1/affinoid-subdomain-flat`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:R1/affinoid-domain-equidimensional`, `AdicSpacesPartII:R0/affinoid-jacobson`, `SchemeAndStackFoundations:SF.0/excellent-ring`, `mathlib:minimalPrimes`, `mathlib:Ideal.height`.

**Checks and worked examples.**

- On the disc, V(T) is nowhere dense; on Spa(K⟨X,Y⟩/(XY)), the axis V(Y) is not nowhere dense although it is a proper Zariski closed subset.
- On Spa(K × K), the Zariski closed point Spa(K × 0) is open, hence not nowhere dense.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.1, paragraph before Theorem 2.1.2, p. 10. Defines a nowhere dense analytic set by the strict drop of local dimensions, states its equivalence with containing no nonempty admissible open, its local nature, and on an affinoid its equivalence with nowhere density of Spec(A/I) in Spec A.
- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, Proof of Corollary 2.10, p. 8. Uses that a nowhere dense Zariski closed set has strictly smaller local dimension at each of its points.

### Images of proper morphisms are Zariski closed

**Target `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed` (theorem).** Let f : Y → X be a proper morphism of rigid spaces over K. Then f(|Y|) is a Zariski closed subset of X, namely the support of the coherent O_X-module f_*O_Y; its reduced structure is the closed subspace defined by ker(O_X → f_*O_Y) up to radical. More generally, for a Zariski closed T ⊆ Y, f(T) is Zariski closed in X.

**Named signature.** `TauCeti.Rigid.IsProper.isZariskiClosed_range`.

**Hypotheses and conventions.**

- f proper in the sense of AdicSpacesPartII:R0/universally-closed-and-proper-morphism; no reducedness or smoothness is assumed.

**Construction or proof.**

1. By Kiehl's proper mapping theorem (AdicSpacesPartII:R3/kiehl-proper-mapping-theorem) f_*O_Y is coherent, so its support is Zariski closed (support of a coherent sheaf = V of its annihilator ideal, AdicSpacesPartII:R3/coherent-sheaf).
2. Supp(f_*O_Y) ⊆ f(|Y|): if x ∉ f(|Y|) then, f being closed, a neighbourhood of x misses f(|Y|) and f_*O_Y vanishes there.
3. f(|Y|) ⊆ Supp(f_*O_Y): if (f_*O_Y)_x = 0, the section 1 of f_*O_Y vanishes on an open V′ ∋ x, so 1 = 0 in O_Y(f^{-1}V′) and f^{-1}V′ = ∅; hence x ∉ f(|Y|).
4. For T = V(𝓙) apply the result to the proper composite V(𝓙) ↪ Y → X.

**Inputs.** `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartII:R3/kiehl-proper-mapping-theorem`, `AdicSpacesPartII:R3/coherent-sheaf`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`.

**Checks and worked examples.**

- The image of a closed immersion is its Zariski closed image; the image of the analytified projection P^1 × D → D is all of D.
- Howe–Klevdal II, Lemma 2.2.3: the image of a proper map of seminormal rigid spaces inducing a closed embedding of topological spaces is Zariski closed.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 2.2.3, p. 16. Concludes that the image of a proper map of seminormal rigid analytic varieties is Zariski closed, citing the proper mapping theorem of Bosch–Güntzer–Remmert §9.6, Proposition 3.

### Affinoid localizations are regular ring maps

**Target `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular` (lemma).** Let K be complete, nontrivially nonarchimedean of rank one. An inclusion Spa(B, B°) ⊆ Spa(A, A°) of affinoid domains induces a regular ring map A → B: it is flat and has geometrically regular fibres. Smooth morphisms of K-affinoid spaces also induce regular ring maps. The proof uses excellence of K-affinoid algebras in every characteristic; the cited parent node supplies this only in characteristic zero, and request Q1 records the remaining extension.

**Named signature.** `TauCeti.Rigid.affinoidSubdomain_isRegular`.

**Hypotheses and conventions.**

- No perfectness or characteristic assumption on K in the target. Q1 is required outside characteristic zero.
- At a classical point of an affinoid subdomain the completed local coordinate rings agree with the completed rigid stalk.

**Construction or proof.**

1. Flatness: AdicSpacesPartII:R1/affinoid-subdomain-flat.
2. At a maximal ideal m′ of A′ over m ⊆ A, A_m → A′_{m′} induces an isomorphism of completions (AdicSpacesPartII:R1/rigid-local-ring-completion and Conrad, proof of Corollary 1.2.3).
3. A_m → Â_m is regular (A excellent), and Â_m ≅ Â′_{m′} is faithfully flat over A′_{m′}; by descent of regularity along faithfully flat maps (the composite A_m → A′_{m′} → Â′_{m′} is regular), A_m → A′_{m′} is regular.
4. Every prime of A′ lies in a maximal ideal (A′ is Jacobson), so the fibres of A → A′ are localizations of those just treated.
5. Smooth case: étale-locally over a relative polydisc A⟨T_1, …, T_n⟩, and A → A⟨T⟩ is regular by the same completion argument with power series rings.

**Inputs.** `AdicSpacesPartII:R1/affinoid-subdomain-flat`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:F1/dagger-algebra-excellent`, `AdicSpacesPartII:R0/affinoid-jacobson`, `AdicSpacesPartII:R0/smooth-local-structure`, `SchemeAndStackFoundations:SF.0/regular-algebra-map`, `SchemeAndStackFoundations:SF.0/excellence-regularalgebramap-flat`, `AdicSpacesPartII:F1`.

**Checks and worked examples.**

- K⟨T⟩ → K⟨T, T^{-1}⟩ (inclusion of the unit circle) is regular; K⟨T⟩ → K (evaluation at 0) is not flat, hence not regular.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §5.2.4, proof of Theorem 5.2.2, p. 33. Records that the maps from the coordinate rings of affinoid charts to those of their intersections' affinoid pieces are regular homomorphisms of excellent rings.
- Brian Conrad, *Irreducible components of rigid spaces*, §1.2, proof of Corollary 1.2.3, p. 9. For an open immersion of affinoids, the local maps at maximal ideals induce isomorphisms of completions, hence are faithfully flat.
- Brian Conrad, *Irreducible components of rigid spaces*, §1.1, pp. 3–6, especially Theorem 1.1.3; §1.2, Corollary 1.2.3, pp. 8–9. Affinoid excellence holds in every characteristic; classical stalks are excellent and have the same completions as maximal localizations. These supply the completion and descent argument for regular domain inclusions.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- G4 / Q1: all-characteristic excellence for regular affinoid restriction.

## RZ.1 — Normalization and irreducible components of rigid spaces

Conrad's global theory (*Irreducible components of rigid spaces*, §§1.2, 2.1–2.2). The identity principle on connected normal spaces (Conrad Lemma 2.1.4) and the equidimensionality of affinoid domains (Lemma 2.1.5) are imported from AdicSpacesPartII R1. Targets:

- **Normalization of a rigid space**: affinoid normalizations commute with affinoid subdomains and glue to a finite surjective X̃ → X through X_red, with the normal-locus isomorphism for X̃ → X_red; Conrad's characterization (Theorem 2.1.2) by finiteness, normality of the source and being an isomorphism off a nowhere dense Zariski closed set with nowhere dense preimage.
- **Connected components** of a rigid space and their agreement with the topological connected components of |X|.
- **Irreducible components** (Definition 2.2.2): images of the connected components of the normalization; local finiteness, Theorem 2.2.4 and Corollaries 2.2.6–2.2.9.
- **Irreducibility criterion** (Lemma 2.2.3): X is irreducible iff it is not the union of two proper Zariski closed subsets iff every Zariski closed subset containing a nonempty open is X; hence proper Zariski closed subsets of irreducible spaces are nowhere dense.
- **Full-dimensional closed subsets** (Corollary 2.2.7): a Zariski closed subset of an irreducible d-dimensional space that has dimension d at one point is everything; in particular on a smooth connected space.
- **Dense Zariski opens of irreducible spaces are connected** (Bartenwerfer’s extension theorem over the original field, Conrad 2010 Theorem 2.1.1).
- **Riemann extension theorem**: bounded analytic functions extend uniquely across nowhere dense analytic subsets of normal spaces over K.

### The normalization of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.1/rigid-normalization` (construction).** Let X be a rigid space over K. For an affinoid open U = Spa(A, A°), let Ã^ν be the integral closure of A_red in its total ring of fractions; it is a finite A-algebra and a K-affinoid algebra. For affinoid opens V ⊆ U the natural map O(V) ⊗_{O(U)} O(U)^ν → O(V)^ν is an isomorphism (Conrad, Corollary 1.2.3), so the finite morphisms Spa(O(U)^ν) → U glue to a finite surjective morphism p : X^ν → X, the normalization of X. X^ν is normal (every local ring is a normal domain), p factors through X_red, the factor X^ν → X_red is an isomorphism over the normal locus of X_red, and a morphism Y → X is called a normalization if it is isomorphic over X to p (the isomorphism is then unique).

**Named signature.** `TauCeti.Rigid.normalization`.

**Planet.** Normalization of a rigid space.

**Hypotheses and conventions.**

- Finiteness uses excellence (hence the Nagata property) of affinoid algebras. AdicSpacesPartII:F1/dagger-algebra-excellent supplies characteristic zero; Q1 requests the all-characteristic statement recalled by Conrad §1.1, p. 3.
- Conrad works on Tate's rigid spaces; the construction is local, so it applies verbatim on the adic side and is compatible with Huber's functor.

**Construction or proof.**

1. Affinoid case: Ã^ν is a finite A-module (A excellent, hence Nagata and Japanese, SchemeAndStackFoundations:SF.0/excellent-ring) and a quotient of a Tate algebra, hence affinoid; Spa(Ã^ν) → Spa(A) is finite (AdicSpacesPartII:R0/finite-algebra-over-affinoid).
2. Compatibility with affinoid subdomains (Conrad Theorem 1.2.2 and Corollary 1.2.3): A → A′ = O(V) is flat with A_n → A′_m inducing isomorphisms of completions at classical points, A′ ⊗_A Ã^ν is normal because Spa of it is an open of the normal space Spa(Ã^ν), and A′/p is reduced for minimal primes p of A; Conrad's Theorem 1.2.2 then says A′ → A′ ⊗_A Ã^ν is the normalization of A′.
3. Glue the affinoid normalizations along these canonical isomorphisms (AdicSpacesPartII:R3/finite-morphism-coherent-algebra-equivalence: finite morphisms are coherent O_X-algebras, so gluing is gluing of a coherent algebra).
4. Stalks (Conrad Lemma 2.1.1): (p_*O_{X^ν})_x is the normalization of O_{X,x}_red and is the product of the normal domains O_{X^ν,y} over y ∈ p^{-1}(x).

**Inputs.** `AdicSpacesPartII:R1/rigid-analytic-space`, `AdicSpacesPartII:R0/finite-algebra-over-affinoid`, `AdicSpacesPartII:R3/finite-morphism-coherent-algebra-equivalence`, `AdicSpacesPartII:R1/affinoid-subdomain-flat`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:F1/dagger-algebra-excellent`, `SchemeAndStackFoundations:SF.0/excellent-ring`, `mathlib:IsIntegrallyClosed`, `mathlib:IsReduced`, `AdicSpacesPartII:F1`, `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular`.

**API.**

- `TauCeti.Rigid.normalization` (constructor): The rigid space X^ν with the finite surjective morphism p : X^ν → X.
- `TauCeti.Rigid.normalization_affinoid` (characterisation): For X = Spa(A, A°), X^ν = Spa(A^ν, A^ν°) with A^ν the integral closure of A_red in its total ring of fractions.
- `TauCeti.Rigid.normalization.isNormal` (instance): Every local ring of X^ν is a normal domain.
- `TauCeti.Rigid.normalization.finite` (instance): p is finite and surjective.
- `TauCeti.Rigid.normalization.restrict` (functoriality): For U ⊆ X open, p^{-1}(U) → U is the normalization of U.
- `TauCeti.Rigid.normalization.stalk` (characterisation): (p_*O_{X^ν})_x is the normalization of (O_{X,x})_red, and the product of the O_{X^ν,y}, y ∈ p^{-1}(x).
- `TauCeti.Rigid.normalization.isIso_of_isNormal` (relation): The factorization X^ν → X_red is an isomorphism over the normal locus of X_red. The map X^ν → X itself has this property over the normal locus of X, which excludes nonreduced stalks.
- `TauCeti.Rigid.normalization.lift` (universal-property): Every morphism g : Y → X from a normal rigid space that is dominant on each connected component (the preimage of each nowhere dense Zariski closed set is nowhere dense) factors uniquely through p.
- `TauCeti.Rigid.normalization_analytification` (compatibility): For X a scheme locally of finite type over K with normalization X̃, (X̃)^an → X^an is the normalization of X^an (Conrad Theorem 2.1.3).

**Unit tests.**

- `normalization_cusp` (computation): The normalization of the cuspidal disc Spa(K⟨X,Y⟩/(Y² − X³)) is Spa(K⟨t⟩) → it, t ↦ (t², t³): bijective on points but not an isomorphism.
- `normalization_node` (computation): The normalization of Spa(K⟨X,Y⟩/(XY)) is Spa(K⟨X⟩) ⊔ Spa(K⟨Y⟩), with two points over the origin.
- `normalization_of_normal` (degenerate): For X normal (for instance a polydisc or Spa K), p is the identity; the normalization of the empty space is empty.
- `normalization_nonreduced` (non-example): The normalization of Spa(K⟨T⟩/(T²)) is Spa(K), not Spa(K⟨T⟩/(T²)): a definition taking the integral closure of A itself rather than of A_red fails.
- `normalization_compat_scheme` (compatibility): For the nodal cubic y² = x²(x + 1) over K (char K ≠ 2), the analytification of its scheme normalization is the normalization of its analytification.

**Uses.**

- Conrad, Definition 2.2.2 (AdicSpacesPartIIPartII:RZ.1/irreducible-components): irreducible components are images of connected components of X^ν
- Howe–Klevdal II, proof of Lemma 9.3.1, p. 60 (AdicSpacesPartIIPartII:RZ.5/resolution-consequences): the resolution of an irreducible space is connected because it factors through the connected normalization

**Checks and worked examples.**

- The normalization of the cuspidal disc Spa(K⟨X,Y⟩/(Y² − X³)) is the disc Spa(K⟨t⟩) mapping by t ↦ (t², t³); it is a homeomorphism but not an isomorphism.
- The normalization of Spa(K⟨X,Y⟩/(XY)) is the disjoint union of two discs; that of a normal space is the identity.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §1.2, Theorem 1.2.2 and Corollary 1.2.3, pp. 8–9. Normalization of a reduced Japanese ring commutes with flat base change under the stated reducedness and normality hypotheses; for an open immersion of affinoids, base change of the normalization is the normalization.
- Brian Conrad, *Irreducible components of rigid spaces*, §2.1, opening paragraph and Lemma 2.1.1, pp. 9–10. Glues the affinoid normalizations to a finite surjective normalization of a rigid space and shows it localizes well: the stalk of the pushforward is the normalization of the local ring.

### Conrad's characterization of normalizations

**Target `AdicSpacesPartIIPartII:RZ.1/normalization-characterisation` (theorem).** A morphism f : Y → X of reduced rigid spaces over K is a normalization if and only if f is finite, Y is normal, and there is a nowhere dense Zariski closed Z ⊆ X with f^{-1}(Z) nowhere dense in Y such that f is an isomorphism over X − Z. When f is a normalization, O_X → f_*O_Y is injective and Z may be taken to be the support of its coherent cokernel, which is the non-normal locus of X.

**Named signature.** `TauCeti.Rigid.isNormalization_iff`.

**Hypotheses and conventions.**

- X and Y reduced; nowhere density in the sense of AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria.

**Construction or proof.**

1. If f is a normalization: O_X → f_*O_Y is a monomorphism of coherent sheaves because X is reduced; the support Z of the cokernel is the non-normal locus, which is Zariski closed and nowhere dense with nowhere dense preimage by the corresponding facts for the excellent reduced coordinate rings (Conrad, proof of Theorem 2.1.2).
2. Conversely, work over an affinoid X = Spa(A); then Y = Spa(B) with A → B finite. It is injective: a function vanishing off the nowhere dense Z has zero locus containing a nonempty open, hence everywhere (RZ.0), and A is reduced.
3. Away from V(I) (I the radical ideal of Z), A_m → B_m is an isomorphism at maximal ideals: it is finite, and an isomorphism after the faithfully flat completion because f is an isomorphism over X − Z.
4. Since no minimal prime of A contains I and none of B contains IB, A → B is an isomorphism at generic points; a finite injection into a normal ring that is birational is the normalization.

**Inputs.** `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartII:R1/rigid-local-ring-completion`.

**Checks and worked examples.**

- The map t ↦ (t², t³) from the disc to the cuspidal disc satisfies the criterion with Z the cusp.
- The inclusion of one axis into Spa(K⟨X,Y⟩/(XY)) is finite with normal source and an isomorphism off the origin on that axis, but fails the criterion: the other axis is not nowhere dense.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.1, Theorem 2.1.2 and its proof, pp. 10–11. Characterizes normalizations of reduced locally finite type schemes and rigid spaces by finiteness, normality of the source and being an isomorphism off a nowhere dense Zariski closed set with nowhere dense preimage.

### Connected components of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.1/connected-components` (construction).** A rigid space X over K is connected if it is nonempty and admits no covering by two disjoint nonempty open subspaces; equivalently it is nonempty and O_X(X) has no idempotents other than 0 and 1. The connected component of x ∈ |X| is the union of all connected open subspaces containing x; it is an open and Zariski closed subspace (clopen), the connected components partition X, a quasi-compact open meets only finitely many of them, and every union of connected components is clopen. They are the connected components of the topological space |X|; on a quasi-separated X they correspond under Huber's functor to Conrad's connected components defined by chains of connected affinoids.

**Named signature.** `TauCeti.Rigid.connectedComponent`.

**Hypotheses and conventions.**

- X locally noetherian, so every affinoid open is a finite disjoint union of connected affinoid opens (idempotents of a noetherian ring).

**Construction or proof.**

1. An affinoid Spa(A, A°) is connected iff A ≠ 0 and A has no nontrivial idempotent (sheafiness, AdicSpacesPartII:R0/noetherian-type-stably-sheafy), and A = ∏ A e_i splits it into finitely many connected affinoids; so connected affinoid opens form a basis and |X| is locally connected.
2. Hence topological connected components of |X| are open; being closed, each is the support of the idempotent ideal it defines, hence Zariski closed.
3. Local finiteness: a quasi-compact open is a finite union of affinoids, each meeting finitely many components.
4. Comparison with Conrad (§2.1, p. 11): chains of connected affinoids linking two points give the same equivalence relation as topological connectedness, by local connectedness.

**Inputs.** `AdicSpacesPartII:R1/rigid-analytic-space`, `AdicSpacesPartII:R0/noetherian-type-stably-sheafy`, `AdicSpacesPartII:R1/analytification-connected`, `mathlib:ConnectedComponents`, `mathlib:IsPreconnected`.

**API.**

- `TauCeti.Rigid.IsConnected` (characterisation): X is connected iff |X| is nonempty and preconnected (Mathlib IsConnected); equivalently X is nonempty and O_X(X) has no nontrivial idempotents.
- `TauCeti.Rigid.connectedComponent` (constructor): The connected component of x, an open and Zariski closed subspace containing x.
- `TauCeti.Rigid.connectedComponent_isClopen` (other): Each connected component is open and Zariski closed; a union of components is clopen.
- `TauCeti.Rigid.connectedComponent_locallyFinite` (other): A quasi-compact open meets only finitely many connected components.
- `TauCeti.Rigid.connectedComponents_eq_topological` (compatibility): The connected components of X are the connected components of the topological space |X| (Mathlib ConnectedComponents).
- `TauCeti.Rigid.isConnected_affinoid_iff` (characterisation): Spa(A, A°) is nonempty and connected iff Spec A is nonempty and connected; the zero ring yields the empty space on both sides.
- `TauCeti.Rigid.IsConnected.image` (functoriality): The image of a connected rigid space under a morphism lies in one connected component.

**Unit tests.**

- `isConnected_disc` (computation): The closed unit disc and the annulus {|ϖ| ≤ |T| ≤ 1} are connected.
- `connectedComponents_prod_field` (computation): Spa(K × K) has exactly two connected components, each a point.
- `isConnected_empty` (degenerate): The empty rigid space is preconnected but not connected and has no connected components; Spa(K) is connected with one component.
- `connected_iff_spec_connected` (compatibility): For A ≠ 0 K-affinoid, connectedness of Spa(A,A°) and Spec A agree. Both empty spaces are excluded from connectedness.
- `not_disconnected_by_classical_topology` (non-example): The classical points of the closed unit disc split into the disjoint canonical-open sets {|T| < 1} and {|T| = 1}, yet the disc is connected: a definition through the canonical topology on classical points fails.

**Uses.**

- Conrad, Definition 2.2.2 (AdicSpacesPartIIPartII:RZ.1/irreducible-components): irreducible components come from connected components of the normalization
- Howe–Klevdal II, proof of Theorem 9.1.3, p. 58: Y is a connected Zariski closed subvariety and is identified with the connected component of M_C/K_b containing y

**Checks and worked examples.**

- The closed unit disc is connected although its classical points carry a totally disconnected canonical topology: the covering by {|T| < 1} and {|T| = 1} is not by opens of |D|.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.1, pp. 11–12. Defines connectedness of a rigid space by admissible covers or idempotents, the connected component of a point via chains of connected affinoids, and shows the components are clopen analytic sets, locally finite, with unions admissible.

### Irreducible components of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.1/irreducible-components` (definition).** Let p : X^ν → X be the normalization of a rigid space X over K. The irreducible components of X are the Zariski closed subsets X_i = p(X^ν_i), with their reduced structure, for X^ν_i running through the connected components of X^ν. X is irreducible if it is nonempty and has exactly one irreducible component; a Zariski closed subset Z is irreducible if Z_red is. The components cover X, are locally finite, and X_i ≠ X_j for i ≠ j.

**Named signature.** `TauCeti.Rigid.irreducibleComponents`.

**Planet.** Irreducible components of a rigid space.

**Hypotheses and conventions.**

- Defined through the normalization, not through the Zariski topology: the Zariski topology of a rigid space is not noetherian, and irreducibility in its sense is the criterion RZ.1/irreducibility-criterion.
- Local analytic branches are not the global components through a point. A globally irreducible space can have a reducible analytic stalk. The component comparison under analytification is imported as a separate comparison from the parent, not used to construct components.

**Construction or proof.**

1. Images: p is finite, so p(X^ν_i) is Zariski closed (AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed).
2. Distinctness and generic normality (Conrad Lemma 2.2.1): p^{-1}(p(U)) − U is nowhere dense for a clopen U ⊆ X^ν; each X_i contains a nonempty Zariski open subset, normal and disjoint from the other components, over which p is an isomorphism; p_i : X^ν_i → X_i is a normalization (RZ.1/normalization-characterisation).
3. Hence components of X correspond bijectively to connected components of X^ν (Conrad Theorem 2.2.4(1)), every irreducible Zariski closed subset lies in a component (2.2.4(2)), and a union of components is the image of the corresponding union of components of X^ν, which is its normalization (2.2.4(3)).
4. Local finiteness: a quasi-compact open of X has quasi-compact preimage in X^ν (p finite), which meets finitely many connected components.

**Inputs.** `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.1/normalization-characterisation`, `AdicSpacesPartIIPartII:RZ.1/connected-components`, `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed`, `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartII:R1/rigid-identity-principle`.

**API.**

- `TauCeti.Rigid.irreducibleComponents` (data): The set of irreducible components of X, each a reduced Zariski closed subspace.
- `TauCeti.Rigid.irreducibleComponentsEquiv` (equivalence): Irreducible components of X ↔ connected components of X^ν, X_i = p(X^ν_i).
- `TauCeti.Rigid.IsIrreducible` (characterisation): X is irreducible iff X ≠ ∅ and X^ν is connected.
- `TauCeti.Rigid.irreducibleComponents_cover` (other): Every point of X lies on some irreducible component; a quasi-compact open meets only finitely many.
- `TauCeti.Rigid.IsIrreducible.subset_component` (relation): Every irreducible Zariski closed subset is contained in an irreducible component (Conrad 2.2.4(2)).
- `TauCeti.Rigid.irreducibleComponent.exists_normal_open` (other): Each X_i contains a nonempty normal Zariski open subset of X disjoint from all X_j, j ≠ i (Conrad 2.2.1(3)).
- `TauCeti.Rigid.irreducibleComponents_unique` (characterisation): A locally finite, irredundant cover of X by irreducible Zariski closed subsets is the set of irreducible components (Conrad 2.2.8).
- `TauCeti.Rigid.irreducibleComponents_restrict` (functoriality): For U ⊆ X open, each component of U lies in a unique component of X, and X_i ∩ U is a union of components of U (Conrad 2.2.9).
- `TauCeti.Rigid.IsIrreducible.localDim_const` (relation): On an irreducible X, dim_x X = dim X = dim X^ν for all x, and dim O_{X,x} = dim X at classical points.
- `TauCeti.Rigid.isIrreducible_of_isConnected_isNormal` (relation): A connected normal (for instance smooth) rigid space is irreducible.
- `TauCeti.Rigid.irreducibleComponents_analytification` (compatibility): For a scheme X locally of finite type over K, the irreducible components of X^an are the analytifications of those of X (Conrad Theorem 2.3.1, AdicSpacesPartII:R1/rigid-analytification-connected). This is the parent’s comparison theorem, used after constructing components; it is not an input to their definition.

**Unit tests.**

- `irreducibleComponents_axes` (computation): Spa(K⟨X,Y⟩/(XY)) has exactly two irreducible components, V(Y) and V(X); it is connected, so components differ from connected components.
- `isIrreducible_nodal_cubic` (computation): Over a complete field of characteristic zero, the analytification of the integral cubic y² = x²(x+1) is globally irreducible. At (0,0), the convergent square root of 1+x factors the equation into two analytic branches, so its analytic local ring has two minimal primes. The normalization has two points over that node (t = ±1 under x=t²−1, y=t(t²−1)).
- `isIrreducible_annulus` (computation): The annulus Spa(K⟨X,Y⟩/(XY − c)), 0 < |c| < 1, is irreducible.
- `irreducibleComponents_empty` (degenerate): The empty space has no irreducible components and is not irreducible; Spa(L) for L/K finite is irreducible.
- `irreducibleComponents_compat_scheme` (compatibility): For X = Spec K[x,y]/(xy), the components of X^an are the analytified axes.
- `not_irreducible_of_zariski_topology` (non-example): A disjoint union of two discs is not irreducible though every point has an irreducible neighbourhood; a definition through local irreducibility fails.

**Uses.**

- Conrad, Lemma 2.2.3 (AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion): irreducibility via proper Zariski closed subsets
- Howe–Klevdal II, Definition 9.1.1 and Theorem 9.1.3(1): irreducible analytic sets and irreducible rigid analytic subdiamonds
- Howe–Klevdal II, Lemma 9.3.1, p. 58: the rigid variety Z is irreducible and its desingularization is connected

**Checks and worked examples.**

- Spa(K⟨X,Y⟩/(XY)) has two irreducible components, the axes, but is connected.
- Over a complete field of characteristic zero, the analytification of the integral cubic y² = x²(x+1) is globally irreducible. At (0,0), the convergent square root of 1+x factors the equation into two analytic branches, so its analytic local ring has two minimal primes. The normalization has two points over that node (t = ±1 under x=t²−1, y=t(t²−1)).

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.2, Lemma 2.2.1, Definition 2.2.2 and the paragraphs after it, pp. 13–14. Defines global components through connected components of the normalization and proves their distinctness, local finiteness and generic normality. The following claim identifying uniqueness of a global component through x with irreducibility of Spec O_{X,x} is false; it is excluded here (E5).
- Brian Conrad, *Irreducible components of rigid spaces*, §2.2, Theorem 2.2.4, Corollaries 2.2.6, 2.2.8 and 2.2.9, pp. 14–16. Bijection with connected components of the normalization, containment of irreducible analytic sets in components, normalization of unions, uniqueness of a minimal locally finite irreducible decomposition, and components of admissible opens.
- Brian Conrad, *Moishezon spaces in rigid geometry*, §2.1, Lemma 2.1.3 and proof, pp. 4–5. Minimal primes of an analytic stalk describe components on sufficiently small admissible neighbourhoods, not components of the original whole space. The neighbourhood need not be asserted affinoid.

### Irreducible spaces: proper Zariski closed subsets are nowhere dense

**Target `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion` (theorem).** Let X be a nonempty rigid space over K. The following are equivalent: (a) X is irreducible; (b) X is not the union of two proper Zariski closed subsets; (c) the only Zariski closed subset of X containing a nonempty open subset of |X| is X itself. Consequently, if X is irreducible then every Zariski closed Z ⊊ X is nowhere dense: dim O_{Z,z} < dim O_{X,z} at every classical z ∈ Z and dim_z Z < dim_z X at every z ∈ Z. For X connected and normal (in particular smooth and connected) this is the identity principle of AdicSpacesPartII:R1/rigid-identity-principle (Conrad Lemma 2.1.4).

**Named signature.** `TauCeti.Rigid.IsIrreducible.isNowhereDense_of_ne`.

**Planet.** Irreducibility criterion.

**Hypotheses and conventions.**

- X nonempty. No reducedness is needed: all three conditions depend only on X_red.

**Construction or proof.**

1. (a) ⇒ (b), (c): X^ν is connected and normal and p is surjective; if X = Z_1 ∪ Z_2 then X^ν = p^{-1}Z_1 ∪ p^{-1}Z_2, so one of them is X^ν by the identity principle on X^ν (AdicSpacesPartII:R1/rigid-identity-principle); if Z ⊇ U ≠ ∅ open, p^{-1}Z ⊇ p^{-1}U ≠ ∅, so p^{-1}Z = X^ν.
2. (b) ⇒ (a): a decomposition of X^ν into two disjoint nonempty clopens U_1, U_2 gives X = p(U_1) ∪ p(U_2); if p(U_1) = X then p^{-1}p(U_1) − U_1 = U_2 is nowhere dense by Conrad Lemma 2.2.1(1), absurd.
3. (c) ⇒ (b): if X = Z_1 ∪ Z_2 with Z_1 ≠ X, the nonempty Zariski open X − Z_1 lies in Z_2, so Z_2 = X.
4. Nowhere density of proper Zariski closed subsets is (c) combined with AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria.

**Inputs.** `AdicSpacesPartIIPartII:RZ.1/irreducible-components`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartII:R1/rigid-identity-principle`.

**Checks and worked examples.**

- In the disc, every proper Zariski closed subset is a discrete set of classical points.
- Spa(K⟨X,Y⟩/(XY)) is the union of its two axes, so it is not irreducible, and the axis V(Y) is a proper Zariski closed subset that is not nowhere dense.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.2, Lemma 2.2.3 and its proof, p. 14. A nonempty rigid space is irreducible iff it is not a union of two proper analytic subsets iff the only analytic subset containing a nonempty admissible open is the whole space.
- Brian Conrad, *Irreducible components of rigid spaces*, §2.1, Lemma 2.1.4, p. 12. The connected normal case: the only analytic subset containing a nonempty admissible open is the whole space.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. Applies Conrad's Lemma 2.1.4 to the smooth connected S to conclude that the Zariski closed Hodge locus |Hdg(ℓ)| ≠ S is nowhere dense.

### Zariski closed subsets of full dimension

**Target `AdicSpacesPartIIPartII:RZ.1/full-dimensional-closed-subset` (theorem).** Let X be an irreducible rigid space over K of dimension d. (i) An irreducible Zariski closed Z ⊆ X with dim Z = d equals X; (ii) a Zariski closed Z ⊆ X with dim_z Z = d at some point z equals X. In particular, if X is smooth and connected and Z ⊆ X is Zariski closed with dim_z Z = dim X at one point, then Z = X; and if M is smooth and Y ⊆ M is a connected Zariski closed subset with dim_y Y = dim_y M at some y, then Y is the connected component of M through y.

**Named signature.** `TauCeti.Rigid.IsIrreducible.eq_of_localDim_eq`.

**Hypotheses and conventions.**

- dim_z Z is the local dimension of Z_red at z (AdicSpacesPartIIPartII:RZ.0/local-dimension).

**Construction or proof.**

1. An irreducible X has constant finite local dimension d. A proper Zariski closed Z is nowhere dense by the irreducibility criterion; the local dimension criterion then gives dim_z Z < d at every z ∈ Z. Thus dim_z Z = d at even one point forces Z = X.
2. If dim Z = d, its bounded integer-valued local dimensions attain their supremum d. Apply the preceding argument; this includes the formulation where Z is irreducible.
3. Smooth case: a smooth connected space is normal and connected, hence irreducible (AdicSpacesPartIIPartII:RZ.1/irreducible-components), of constant local dimension. For Y ⊆ M connected, apply (ii) in the connected component M_0 ∋ y: Y ⊇ M_0, and Y ⊆ M_0 since Y is connected.

**Inputs.** `AdicSpacesPartIIPartII:RZ.1/irreducible-components`, `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.1/connected-components`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartII:R1/rigid-identity-principle`.

**Checks and worked examples.**

- In the bidisc, the Zariski closed V(XY) has dimension 1 < 2, so it is a proper subset; a closed subdisc of the disc has full dimension but is not Zariski closed.
- Howe–Klevdal II, p. 58: the connected Zariski closed Y ⊆ M_C/K_b with dim_y Y = dim_y M_C/K_b is the connected component of y.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.2, Corollary 2.2.7 and its proof, p. 15. On an equidimensional rigid space the analytic sets that are unions of irreducible components are exactly the equidimensional ones of the same dimension; an irreducible analytic set of full dimension in an irreducible space is everything.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Concludes from dim_y Y ≥ dim_y M_C/K_b that the connected Zariski closed Y is the connected component of M_C/K_b containing y.

### Riemann extension theorem for normal rigid spaces

**Target `AdicSpacesPartIIPartII:RZ.1/riemann-extension` (theorem).** For a normal rigid space X over K and a nowhere dense analytic subset Z, every bounded analytic function on X − Z extends uniquely to X. K is any complete nontrivially nonarchimedean field; geometric normality is not required.

**Named signature.** `TauCeti.Rigid.extend_bounded_of_normal`.

**Hypotheses and conventions.**

- Bounded means that some real C bounds the absolute value at all rank-one points of X − Z. For disconnected or non-quasi-compact spaces, the local bounded version glues by uniqueness.

**Construction or proof.**

1. Use Bartenwerfer’s general extension theorem, stated in Conrad Theorem 2.1.1. On an affinoid normal neighbourhood the bounded function extends across Z; uniqueness follows from the identity principle, and these local extensions glue.
2. The extension theorem itself is a substantial input, not a consequence of the identity principle. G1 records that its original proof has not been read.

**Inputs.** `AdicSpacesPartII:R1/rigid-identity-principle`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`.

**Checks and worked examples.**

- For a connected normal X, an idempotent on X − Z is bounded by 1; its extension is still idempotent by density and the identity principle.
- No claim that X becomes connected or normal after extending K is used.

**Sources.**

- Brian Conrad, *Moishezon spaces in rigid geometry*, §2.1, Theorem 2.1.1 and preceding paragraph, p. 4. States Bartenwerfer’s extension theorem over the original ground field, distinguishing it from Lütkebohmert’s earlier geometric-normality version.

### Dense Zariski opens of irreducible spaces are connected

**Target `AdicSpacesPartIIPartII:RZ.1/dense-open-connected` (theorem).** Let X be a rigid space over K and Z ⊆ X a nowhere dense Zariski closed subset. If X is connected and normal, then X − Z is connected. If X is irreducible, then X − Z is irreducible; in particular every nonempty Zariski open subset of an irreducible rigid space is irreducible and connected.

**Named signature.** `TauCeti.Rigid.IsIrreducible.isConnected_compl`.

**Hypotheses and conventions.**

- No geometric connectedness, geometric normality or characteristic-zero hypothesis. Use the original-field Riemann extension theorem.

**Construction or proof.**

1. If X is connected and normal, a disconnection of X − Z supplies a bounded nontrivial idempotent. The Riemann extension theorem extends it to X. Its square minus itself vanishes on the dense complement, hence on X; connectedness forces the extension to be 0 or 1, a contradiction.
2. For irreducible X, its normalization is connected and normal; the inverse image of Z is nowhere dense. Apply the normal case and use compatibility of normalization with open restriction: the normalization of X − Z is connected, so X − Z is irreducible. Its continuous surjective normalization also proves connectedness.

**Inputs.** `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.1/connected-components`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartII:R1/rigid-identity-principle`, `AdicSpacesPartII:R3/affinoid-completed-field-extension`, `AdicSpacesPartIIPartII:RZ.1/riemann-extension`.

**Checks and worked examples.**

- The punctured disc {0 < |T| ≤ 1} is connected.
- Removing the node from the analytified nodal cubic leaves a connected space; removing the origin from Spa(K⟨X,Y⟩/(XY)) disconnects it, which is allowed because that space is not irreducible.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §2.3, proof of Theorem 2.3.1, p. 17. Gives the connectedness argument under the algebraically closed hypothesis used there. The arbitrary-field version here instead uses CONRAD10 Theorem 2.1.1, without assuming connectedness survives field extension.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §9.3, sentence before Lemma 9.3.5, p. 60. Asserts that a desingularization of the irreducible Z is connected.
- Brian Conrad, *Moishezon spaces in rigid geometry*, §2.1, Theorem 2.1.1 and preceding paragraph, p. 4. States Bartenwerfer’s extension theorem over the original ground field, distinguishing it from Lütkebohmert’s earlier geometric-normality version.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- G1: original Riemann extension proof; G4 / Q1 outside characteristic zero.

## RZ.2 — Regular and smooth loci, stratification and rank loci

Targets:

- **Singular locus**: Sing(X) ⊆ |X| is Zariski closed, glued from the non-regular loci of the excellent affinoid algebras along the regular maps of affinoid subdomains; it is nowhere dense when X is reduced.
- **Smooth = regular in characteristic zero**: for char K = 0 the smooth locus of X → Spa K is the complement of Sing(X), and at a smooth point Ω_{X/K} is free of rank dim_x X.
- **Stratification** (Howe–Klevdal II, §9.2, p. 57): a reduced rigid space of finite dimension over a field of characteristic 0 is the disjoint union of the finitely many smooth Zariski-locally closed subspaces Y_i − Y_{i+1}, Y_0 = Y, Y_{i+1} = Sing(Y_i), with at most dim Y + 1 steps.
- **Tangent spaces and differentials** at classical points, with the chain rule.
- **Rank loci**: for f : V → W a morphism of smooth rigid spaces, {rank df ≥ r} is Zariski open (minors of the Jacobian matrix), and on connected V the locus where the rank is maximal is a nonempty dense Zariski open subset.

### The singular locus of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.2/singular-locus` (construction).** For a rigid space X over K, the singular (non-regular) locus Sing(X) ⊆ |X| is the Zariski closed subset whose trace on each affinoid open Spa(A, A°) is V(J_A), where V(J_A) ⊆ Spec A is the non-regular locus of the excellent ring A (Zariski closed, J_A radical). Its classical points are the classical x with O_{X,x} not regular. Reg(X) = |X| − Sing(X) is the regular locus. If X is reduced, Sing(X) is nowhere dense.

**Named signature.** `TauCeti.Rigid.singularLocus`.

**Planet.** Singular locus.

**Hypotheses and conventions.**

- Affinoid excellence in characteristic zero is supplied by AdicSpacesPartII:F1/dagger-algebra-excellent; request Q1 supplies the all-characteristic extension. Excellence makes the non-regular locus closed (J-2) and detects regularity on completions.

**Construction or proof.**

1. For an affinoid A and a classical point x ↔ m, A_m and O_{X,x} have the same completion (AdicSpacesPartII:R1/rigid-local-ring-completion), so O_{X,x} is regular iff A_m is regular iff m ∉ V(J_A).
2. The earlier regular affinoid-restriction theorem implies that A_m is regular iff the local ring at the corresponding classical point of the affinoid subdomain is regular: regularity ascends along regular maps and descends along faithfully flat local maps. Thus J_A A′ and J_{A′} have the same vanishing locus on classical points; the Jacobson property identifies their radicals, so these closed subsets glue.
3. Nowhere density for reduced X: a reduced excellent ring is regular at its minimal primes (localizations are fields), so J_A is contained in no minimal prime; apply AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria(c).

**Inputs.** `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:R0/affinoid-jacobson`, `AdicSpacesPartII:F1/dagger-algebra-excellent`, `SchemeAndStackFoundations:SF.0/regular-locus`, `SchemeAndStackFoundations:SF.0/excellence-isj2-regularlocus-open`, `mathlib:IsRegularLocalRing`, `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular`, `AdicSpacesPartII:F1`.

**API.**

- `TauCeti.Rigid.singularLocus` (data): Sing(X), a Zariski closed subset of |X|.
- `TauCeti.Rigid.mem_singularLocus_iff` (characterisation): A classical x lies in Sing(X) iff O_{X,x} is not a regular local ring.
- `TauCeti.Rigid.singularLocus_affinoid` (characterisation): On Spa(A, A°), Sing = V(J_A) with V(J_A) the non-regular locus of Spec A (SchemeAndStackFoundations SF.0 regularLocus).
- `TauCeti.Rigid.singularLocus_isNowhereDense` (relation): If X is reduced, Sing(X) is nowhere dense.
- `TauCeti.Rigid.singularLocus_restrict` (functoriality): For U ⊆ X open, Sing(U) = Sing(X) ∩ U; for an étale (more generally smooth) f : Y → X, Sing(Y) = f^{-1}Sing(X).
- `TauCeti.Rigid.singularLocus_analytification` (compatibility): For a scheme X locally of finite type over K, Sing(X^an) = (Sing X)^an on classical points.

**Unit tests.**

- `singularLocus_cusp` (computation): Sing(Spa(K⟨X,Y⟩/(Y² − X³))) is the single classical point X = Y = 0.
- `singularLocus_node` (computation): Sing(Spa(K⟨X,Y⟩/(XY))) is the origin.
- `singularLocus_polydisc` (degenerate): Sing of a polydisc, of Spa K and of the empty space is empty.
- `singularLocus_scheme_compat` (compatibility): For X = Spec K[x,y]/(y² − x³), Sing(X^an) is the analytification of the closed point (0,0).
- `singularLocus_nonreduced` (non-example): Sing(Spa(K⟨T⟩/(T²))) = |X|; a statement of nowhere density without the reducedness hypothesis fails here.

**Uses.**

- Bhatt–Hansen, Corollary 2.10 (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense): weakly Shilov points of a reduced space are regular points
- Howe–Klevdal II, §9.2, p. 57 (AdicSpacesPartIIPartII:RZ.2/singular-stratification): the stratification Y_{i+1} = Sing(Y_i)
- Temkin, Theorem 1.2.1(i) (AdicSpacesPartIIPartII:RZ.5/rigid-resolution): centres of the resolution lie over the singular locus

**Checks and worked examples.**

- Sing of the cuspidal disc is its cusp; Sing of a polydisc is empty.
- Sing(Spa(K⟨T⟩/(T²))) is all of |X|: without reducedness the singular locus need not be nowhere dense.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §1.2, second paragraph, p. 7. For a property P among reduced, normal, regular, Gorenstein, Cohen–Macaulay, complete intersection, R_i, S_i, the non-P locus of a rigid space is Zariski closed, P(Sp A) is P(A), and analytification preserves the non-P locus.
- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, Proof of Corollary 2.10, p. 8. The non-regular locus of a reduced rigid space is a nowhere dense Zariski closed set by excellence.

### Smooth equals regular in characteristic zero

**Target `AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular` (theorem).** Let K have characteristic 0 and X be a rigid space over K. For x ∈ |X|, X → Spa(K, K°) is smooth on a neighbourhood of x if and only if x ∉ Sing(X). At such points Ω_{X/K} is locally free of rank dim_x X, and for a classical point x with residue field k(x) the completed local ring Ô_{X,x} is a formal power series ring over k(x) in dim_x X variables. Hence the smooth locus X^sm is the Zariski open Reg(X), dense when X is reduced.

**Named signature.** `TauCeti.Rigid.smoothLocus_eq_regularLocus`.

**Hypotheses and conventions.**

- Characteristic 0 is used only through the separability of every finite extension k(x)/K; over any perfect complete field the same holds (Conrad §3.3).

**Construction or proof.**

1. Smooth morphisms are locally étale over relative polydiscs. At a classical point an étale map gives the corresponding completed local algebra after the finite separable residue-field extension, not necessarily an isomorphism with the unextended target completion. These completions are regular, so the source local ring is regular.
2. Regular ⇒ smooth at classical points: if O_{X,x} is regular of dimension d with k(x)/K separable, Ô_{X,x} ≅ k(x)⟦t_1, …, t_d⟧, so Ω_{X/K,x} ⊗ Ô_{X,x} is free of rank d; hence Ω_{X/K} is free of rank d near x, and the Jacobian criterion (AdicSpacesPartII:R0/jacobian-criterion-closed-subspace, in a local closed embedding into a polydisc) gives smoothness near x (Conrad, proof of Lemma 3.3.1, citing Bosch–Lütkebohmert III, Lemma 2.8(b)).
3. Both loci are open and Zariski open; a Zariski open set is determined by its classical points (Jacobson), so they coincide.
4. Rank: on a smooth neighbourhood, rank Ω = dim of the étale-local polydisc = dim_x X (AdicSpacesPartII:R0/smooth-differentials-locally-free).

**Inputs.** `AdicSpacesPartIIPartII:RZ.2/singular-locus`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartII:R0/smooth-local-structure`, `AdicSpacesPartII:R0/jacobian-criterion-closed-subspace`, `AdicSpacesPartII:R0/smooth-differentials-locally-free`, `AdicSpacesPartII:R0/smooth-morphism`, `AdicSpacesPartII:R0/affinoid-jacobson`.

**Checks and worked examples.**

- The smooth locus of the analytified nodal cubic is the complement of the node.
- Over an imperfect field of characteristic p the statement fails: Spa(k⟨T⟩[Y]/(Y^p − a)) with a ∉ k^p is regular but not smooth.

**Sources.**

- Brian Conrad, *Irreducible components of rigid spaces*, §3.3, proof of Lemma 3.3.1, p. 21, and the paragraph after it, p. 22. Over a perfect ground field the regular locus of a rigid space is its smooth locus: at a regular point with separable residue field the completed local ring is a power series ring, so the differentials are free of rank the dimension; on a reduced space the non-smooth locus is a nowhere dense analytic set.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5.3, p. 35. Uses the smooth locus S^sm of a seminormal rigid space and that a resolution contains a dense open isomorphic to it.

### Tangent spaces and differentials at classical points

**Target `AdicSpacesPartIIPartII:RZ.2/tangent-space` (construction).** Let X be a rigid space over K and x a classical point with residue field k(x). The Zariski tangent space is T_x X = Hom_{k(x)}(m_x/m_x², k(x)), m_x ⊆ O_{X,x}. A morphism f : X → Y induces df_x : T_x X → T_{f(x)} Y ⊗_{k(f(x))} k(x). If k(x) = K (or k(x)/K is separable), T_x X is dual to Ω_{X/K} ⊗ k(x); for a K-rational point of a smooth X, dim T_x X = dim_x X, and df_x is the fibre at x of the dual of f^*Ω_{Y/K} → Ω_{X/K}. For L/K a complete extension and x ∈ X(L), T_x X_L is defined the same way on X_L = X ×_K Spa L.

**Named signature.** `TauCeti.Rigid.tangentSpace`.

**Hypotheses and conventions.**

- Tangent spaces are taken at classical points (or L-points after base change); no tangent space is defined at non-classical points.

**Construction or proof.**

1. m_x/m_x² is finite over k(x) because O_{X,x} is noetherian; the completion does not change it (AdicSpacesPartII:R1/rigid-local-ring-completion).
2. Functoriality and the chain rule: f^♯ : O_{Y,f(x)} → O_{X,x} is local, inducing m_{f(x)}/m_{f(x)}² ⊗ k(x) → m_x/m_x², whose dual is df_x; composition is respected.
3. Comparison with differentials at a rational point: the map m_x/m_x² → Ω_{X/K} ⊗ k(x), g ↦ dg, is an isomorphism for k(x) = K (continuous differentials, AdicSpacesPartII:R3/sheaf-of-continuous-differentials).
4. Smooth case: Ω_{X/K} is locally free of rank dim_x X (AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular).

**Inputs.** `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:R3/sheaf-of-continuous-differentials`, `AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular`, `mathlib:IsLocalRing`, `mathlib:Module.finrank`.

**API.**

- `TauCeti.Rigid.tangentSpace` (data): T_x X = Hom_{k(x)}(m_x/m_x², k(x)) for a classical point x.
- `TauCeti.Rigid.tangentMap` (functoriality): df_x : T_x X → T_{f(x)} Y ⊗ k(x), with d(g ∘ f)_x = dg_{f(x)} ∘ df_x and d(id)_x = id.
- `TauCeti.Rigid.tangentSpace_dual_cotangent` (equivalence): For x K-rational, T_x X ≅ Hom_K(Ω_{X/K} ⊗ k(x), K).
- `TauCeti.Rigid.finrank_tangentSpace_of_smooth` (relation): If X is smooth at a K-rational x, dim T_x X = dim_x X; in general dim T_x X ≥ dim O_{X,x} with equality iff O_{X,x} is regular.
- `TauCeti.Rigid.tangentMap_immersion_injective` (relation): For a locally closed immersion, df_x is injective.
- `TauCeti.Rigid.tangentSpace_baseChange` (compatibility): For L/K complete and x ∈ X(K), T_x(X_L) = T_x X ⊗_K L.
- `TauCeti.Rigid.tangentSpace_analytification` (compatibility): For a scheme X of finite type and a closed point x, T_x(X^an) = T_x X.

**Unit tests.**

- `tangentSpace_disc` (computation): For the closed unit polydisc D^n and x = 0, T_0 D^n = K^n with basis ∂/∂T_i.
- `tangentMap_square` (computation): For f(z) = z² on the disc (char K ≠ 2), df_a = 2a; it vanishes only at a = 0.
- `tangentSpace_point` (degenerate): T_x Spa(K) = 0, and for X = Spa(K⟨T⟩/(T²)) at its point, T_x X = K although dim X = 0.
- `tangentSpace_scheme_compat` (compatibility): For the affine line A¹_K and x = 0, T_0((A¹)^an) = T_0 A¹ = K.
- `tangentSpace_cusp_nonexample` (non-example): At the cusp of Spa(K⟨X,Y⟩/(Y² − X³)), dim T_x = 2 > 1 = dim_x X: tangent dimension does not compute dimension at singular points.

**Uses.**

- Howe–Klevdal II, proof of Theorem 9.1.3, pp. 57–58 (AdicSpacesPartIIPartII:RZ.2/rank-loci): the rank of df on the smooth stratum V
- AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points: the tangent space of the manifold V(E′) at x is T_x V_{E′}

**Checks and worked examples.**

- For f : D → D, z ↦ z² over K of characteristic ≠ 2, df_a is multiplication by 2a: zero exactly at the origin.
- At the cusp of Spa(K⟨X,Y⟩/(Y² − X³)) the tangent space has dimension 2 while the space has dimension 1.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 57–58. Uses the differential df of a map of smooth rigid varieties V → Fl, its rank, and the tangent spaces at C-points of V.
- Peter Schneider, *p-Adic Lie Groups*, §9, definitions of T_a(M) and T_a(g), Remark 9.4, pp. 56–59. Tangent spaces of analytic manifolds over K and tangent maps of locally analytic maps, with the chain rule (Lemma 9.2).

### Stratification of a reduced space by smooth locally closed subspaces

**Target `AdicSpacesPartIIPartII:RZ.2/singular-stratification` (theorem).** Let K have characteristic 0 and Y be a reduced rigid space over K of finite dimension d (not necessarily quasi-compact). Put Y_0 = Y and Y_{i+1} = Sing(Y_i) with its reduced structure. Then dim Y_{i+1} < dim Y_i whenever Y_i ≠ ∅, so Y_{d+1} = ∅, and |Y| is the disjoint union of the finitely many locally closed subspaces Y_i − Y_{i+1} (0 ≤ i ≤ d), each smooth over K and Zariski open in the Zariski closed Y_i. Every point of Y lies on exactly one stratum.

**Named signature.** `TauCeti.Rigid.smoothStratification`.

**Planet.** Stratification by smooth strata.

**Hypotheses and conventions.**

- Finite dimension, not quasi-compactness, makes the stratification finite (the review of the Howe–Klevdal extraction corrected the hypothesis).
- Characteristic 0 identifies Y_i − Y_{i+1} = Reg(Y_i) with the smooth locus.

**Construction or proof.**

1. Y_i is reduced and Zariski closed in Y; Sing(Y_i) is nowhere dense in Y_i (AdicSpacesPartIIPartII:RZ.2/singular-locus), so dim_z Y_{i+1} < dim_z Y_i at every z ∈ Y_{i+1} (AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria(e)), whence dim Y_{i+1} ≤ dim Y_i − 1.
2. Y_i − Y_{i+1} = Reg(Y_i) is smooth over K (AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular) and open in Y_i.
3. Disjointness and covering: z ∈ Y lies in Y_i − Y_{i+1} for the largest i with z ∈ Y_i.

**Inputs.** `AdicSpacesPartIIPartII:RZ.2/singular-locus`, `AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`.

**Checks and worked examples.**

- For the union of a plane and a line meeting it in a point inside the 3-dimensional polydisc, Y_1 is the intersection point and Y_2 = ∅.
- For the cuspidal disc, the strata are the punctured cuspidal curve and the cusp.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 57. Stratifies the closed rigid analytic subvariety Y by finitely many smooth locally closed rigid analytic subvarieties, and the complement of the maximal-rank locus in the same way.
- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, Proof of Corollary 2.10, p. 8. The non-regular locus of a reduced rigid space is nowhere dense Zariski closed.

### Zariski-open loci of maximal rank of a differential

**Target `AdicSpacesPartIIPartII:RZ.2/rank-loci` (theorem).** Let f : V → W be a morphism of smooth rigid spaces over K. For r ≥ 0 let V_{≥r} be the set of x ∈ |V| at which the map f^*Ω_{W/K} ⊗ k(x) → Ω_{V/K} ⊗ k(x) has rank ≥ r. Then V_{≥r} is Zariski open: locally, in coordinates where Ω_V and Ω_W are free, it is the complement of the common zero locus of the r × r minors of the Jacobian matrix. If V is connected and r_max = max_x rank, then V_{≥r_max} is a nonempty Zariski open subset whose complement is nowhere dense, and on it rank df_x = r_max at every classical point x (rank of df_x on T_x V_{k(x)}).

**Named signature.** `TauCeti.Rigid.rankLocus_isZariskiOpen`.

**Planet.** Maximal-rank locus.

**Hypotheses and conventions.**

- V, W smooth over K, so Ω_V and Ω_W are locally free of finite rank (AdicSpacesPartII:R0/smooth-differentials-locally-free).
- Define rank at every point using the fibre of f^*Ω_{W/K} → Ω_{V/K}. Its dual agrees with the map on m/m² tangent spaces at rational points and at classical points with separable residue extension; do not assert this comparison at arbitrary inseparable classical points.

**Construction or proof.**

1. Locally Ω_V and f^*Ω_W are free with bases dT_j, f^*dS_i; the map is given by the Jacobian matrix (∂f_i/∂T_j), and rank ≥ r at x iff some r × r minor does not vanish at x; the ideal of minors is coherent, so V_{≥r} is Zariski open.
2. Rank is lower semicontinuous and bounded by dim W, so r_max is attained; V_{≥r_max} is nonempty Zariski open.
3. Its complement is a proper Zariski closed subset of the connected smooth, hence irreducible, V (AdicSpacesPartIIPartII:RZ.1/irreducible-components), so it is nowhere dense (AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion).
4. On V_{≥r_max} the rank is ≥ r_max and ≤ r_max, hence constant.
5. The algebraic core over a field is the minor criterion for the rank of a matrix (suggested name Matrix.le_rank_iff_exists_submatrix_det_ne_zero).

**Inputs.** `AdicSpacesPartIIPartII:RZ.2/tangent-space`, `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`, `AdicSpacesPartIIPartII:RZ.1/irreducible-components`, `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartII:R0/smooth-differentials-locally-free`, `AdicSpacesPartII:R3/sheaf-of-continuous-differentials`, `mathlib:Matrix.rank`, `mathlib:Matrix.det`.

**Checks and worked examples.**

- For f(z) = z² on the disc (char K ≠ 2), V_{≥1} = D − {0} and r_max = 1.
- For a constant map V_{≥0} = V and r_max = 0; for the identity of D^n, r_max = n everywhere.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 57. V contains a nonempty Zariski open subvariety on which the rank of df is constant and equal to its maximum, and the complement is Zariski closed.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- G4 / Q1: all-characteristic excellence and regular restriction.

## RZ.3 — Classical points, rigid analytic points and the Gauss point

Targets:

- **Classical points** of a rigid space (residue field finite over K) and the sets X(L′) for finite L′/K; their density in |X| (Howe–Klevdal II, Remark 2.2.2), proved by affinoid maximal ideals.
- **Rigid analytic points** of a diamond S over Spd L (Howe–Klevdal II, Definition 2.2.1(1)) and the bijection between classical points of a rigid space Y over L and equivalence classes of rigid analytic points of Y^♢ (Remark 2.2.2), through the seminormal full faithfulness of DiamondsAndVStacks D6.
- **The L′-points of a polydisc**: D(L′) ⊆ |D| with the subspace topology is homeomorphic to O_{L′}^n, hence a Baire space.
- **The Gauss point in the closure of the L′-points** (Howe–Klevdal II, proof of Lemma 9.3.5, p. 60): when the residue field of L′ is infinite, every open neighbourhood of the Gauss point of the closed unit polydisc contains L′-points, so a closed set containing an open subset of D(L′) contains a Gauss point; this fails for a finite residue field.

### Classical points and L-points of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.3/classical-point` (definition).** Let X be a rigid space over K. A point x ∈ |X| is classical if its residue field k(x) = O_{X,x}/m_x is a finite extension of K (equivalently its completed residue field is finite over K). For a finite extension L/K, X(L) = Hom_{Spa K}(Spa(L, L°), X); a morphism Spa L → X has classical image x together with a K-embedding k(x) ↪ L, and this gives a bijection between X(L) and such pairs. On an affinoid open Spa(A, A°) the classical points are the image of the injective map Max A → Spa(A, A°), m ↦ the absolute value |·| of A/m extended uniquely from K. The classical points of X are the points of the classical rigid space attached to X by Huber's functor when X is quasi-separated.

**Named signature.** `TauCeti.Rigid.IsClassical`.

**Planet.** Classical points.

**Hypotheses and conventions.**

- Only finite extensions L/K are used for L-points here; for a complete algebraically closed C ⊇ K, X(C) is defined in AdicSpacesPartIIPartII:RZ.6 through X_C.
- k(x) denotes the residue field of the analytic local ring; H(x) denotes its completion. At classical points they coincide since finite extensions of K are complete. For a Gauss point η, H(η) is the Gauss-norm completion of the rational function field; do not identify that completion with an uncompleted residue field.

**Construction or proof.**

1. Max A → Spa(A, A°): for a maximal ideal m, A/m is a finite field extension of K (AdicSpacesPartII:R0/affinoid-residue-fields-finite) with a unique absolute value extending that of K; the induced valuation is continuous and ≤ 1 on A°.
2. Injectivity: its support is m.
3. Conversely a point x with k(x) finite over K has support a prime p with A/p ↪ k(x) finite over K, so A/p is a field and p is maximal; the valuation on k(x) is the unique extension, so x is the image of p.
4. L-points: a morphism Spa(L, L°) → Spa(A, A°) over K is a continuous K-algebra map A → L, whose kernel is a maximal ideal; this gives the bijection with pairs (x, k(x) ↪ L).

**Inputs.** `AdicSpacesPartII:R0/affinoid-residue-fields-finite`, `AdicSpacesPartII:R1/analytification-points`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`, `tauceti:TauCeti.ValuationSpectrum.spa`, `tauceti:TauCeti.ValuationSpectrum.classicalPoint`, `mathlib:MaximalSpectrum`.

**API.**

- `TauCeti.Rigid.IsClassical` (characterisation): x is classical iff k(x) is finite over K.
- `TauCeti.Rigid.classicalPointOfMax` (constructor): For U = Spa(A, A°) affinoid open, the injection Max A → U onto the classical points of U.
- `TauCeti.Rigid.IsClassical.map` (functoriality): Morphisms of rigid spaces send classical points to classical points.
- `TauCeti.Rigid.pointsEquiv` (equivalence): X(L) ≃ {(x, ι) : x classical, ι : k(x) ↪ L over K} for L/K finite.
- `TauCeti.Rigid.IsClassical.closed` (relation): Classical points are closed in |X| and have no proper generizations other than themselves within the rank-one locus (they are rank-one points).
- `TauCeti.Rigid.isClassical_analytification` (compatibility): For a scheme X of finite type over K, the classical points of X^ad are the points over closed points of X (AdicSpacesPartII:R1/analytification-points).
- `TauCeti.Rigid.isClassical_zariskiClosed` (relation): The classical points of V(I) ⊆ Spa(A, A°) are the maximal ideals containing I.

**Unit tests.**

- `isClassical_sqrt_p` (computation): On the closed unit disc over Q_p, the point T = √p is classical with k(x) = Q_p(√p) and |T(x)| = p^{−1/2}.
- `isClassical_spa_field` (degenerate): The unique point of Spa(L, L°), L/K finite, is classical; the empty space has none.
- `isClassical_tauceti_compat` (compatibility): For a Huber pair (A, A°) with A a K-affinoid algebra, the classical points agree with the image of Tau Ceti's TauCeti.ValuationSpectrum.classicalPoint construction on points with values in finite extensions.
- `not_isClassical_gauss` (non-example): The Gauss point of the closed unit disc has residue field K(T)-completion, of infinite degree over K, so it is not classical; nor is the rank-one point T = t for t ∈ C_p transcendental over Q_p with |t| ≤ 1.

**Uses.**

- Howe–Klevdal II, Remark 2.2.2 (AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points): classical points correspond to rigid analytic points of Y^♢
- Howe–Klevdal II, proofs of Theorem 5.0.4(4) and Lemma 9.3.5: density of classical points; Hodge-generic classical points x ∈ S(L′)

**Checks and worked examples.**

- On the closed unit disc over Q_p, T = √p is a classical point with residue field Q_p(√p) and |T| = p^{−1/2}; the Gauss point is not classical.
- If x ∈ X is classical then so is f(x) for every morphism f of rigid spaces.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §2.2, Remark 2.2.2, p. 15. Identifies the images of rigid analytic points with the classical points of Y and, on an affinoid open, classical points with maximal ideals.
- Brian Conrad, *Irreducible components of rigid spaces*, Notation, p. 2. Points of a rigid space in Tate's sense are maximal ideals of affinoid algebras, with residue fields finite over k.

### Density of classical points

**Target `AdicSpacesPartIIPartII:RZ.3/classical-points-dense` (theorem).** For a rigid space X over K every nonempty open subset of |X| contains a classical point. Thus the classical points are dense in the ordinary topology of |X|.

**Named signature.** `TauCeti.Rigid.dense_classical`.

**Hypotheses and conventions.**

- No hypothesis beyond X being a rigid space; nonempty opens contain nonempty rational subsets.

**Construction or proof.**

1. A nonempty open U ⊆ |X| contains a nonempty rational subset W = Spa(B, B°) of an affinoid open; B ≠ 0 since W ≠ ∅.
2. B has a maximal ideal, which gives a classical point of W (AdicSpacesPartIIPartII:RZ.3/classical-point).

**Inputs.** `AdicSpacesPartIIPartII:RZ.3/classical-point`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`, `AdicSpacesPartII:R0/affinoid-jacobson`, `mathlib:MaximalSpectrum`.

**Checks and worked examples.**

- The classical points of the disc are dense although the Gauss point is not classical; every open neighbourhood of the Gauss point contains classical points.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §2.2, Remark 2.2.2, p. 15. Notes that classical points are dense in |Y| = |Y^♢| because every open affinoid contains one, maximal ideals being classical points.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5.3, p. 35. Uses density of classical points in a seminormal S to extend a factorization through a closed Schubert cell from classical points to S.

### Rigid analytic points of a diamond

**Target `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point` (definition).** Let L be a complete nonarchimedean field over Q_p and S a diamond over Spd L = Spa(L, L°)^♢. A rigid analytic point of S over L is a pair (L′, s) of a finite extension L′/L and a morphism s : Spd L′ → S over Spd L. Two rigid analytic points (L′, s), (L″, s′) are equivalent if there are a finite extension L‴/L and L-embeddings L′, L″ ↪ L‴ with s ∘ Spd(L‴ → L′) = s′ ∘ Spd(L‴ → L″); this generates an equivalence relation. The image of (L′, s) is the point |s|(|Spd L′|) ∈ |S|, which depends only on the equivalence class.

**Named signature.** `TauCeti.Diamond.RigidAnalyticPoint`.

**Hypotheses and conventions.**

- Spd L′ = Spa(L′, L′°)^♢ has a single point, so the image is a single point of |S|.
- Howe–Klevdal also define rigid analytic diamonds and subdiamonds (Definition 2.2.1(2)–(3)); those belong to the roadmap on admissible pairs, which imports this definition.

**Construction or proof.**

1. The diamond Spd L′ and the maps Spd(L‴) → Spd(L′) for L-embeddings come from the functor Y ↦ Y^♢ on analytic adic spaces (DiamondsAndVStacks:D6/gluing-and-the-diamond-functor).
2. |Spd L′| = |Spa L′| is a point (DiamondsAndVStacks:D6/etale-site-comparison), so the image is well defined, and equivalent pairs have the same image by functoriality of |·|.
3. Equivalence is reflexive and symmetric; take the generated equivalence relation (it is already transitive by composing embeddings into a common finite extension, which exists inside an algebraic closure of L).

**Inputs.** `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D6/spd-of-a-tate-pair`.

**API.**

- `TauCeti.Diamond.RigidAnalyticPoint` (constructor): A pair (L′, s : Spd L′ → S) with L′/L finite.
- `TauCeti.Diamond.RigidAnalyticPoint.Equiv` (relation): The equivalence relation generated by restriction along L-embeddings into common finite extensions.
- `TauCeti.Diamond.RigidAnalyticPoint.image` (projection): The point of |S| underlying a rigid analytic point; constant on equivalence classes.
- `TauCeti.Diamond.RigidAnalyticPoint.map` (functoriality): A morphism S → S′ over Spd L sends rigid analytic points to rigid analytic points, compatibly with images and equivalence.
- `TauCeti.Diamond.RigidAnalyticPoint.restrict` (other): For L′ ⊆ L″ finite over L, (L′, s) is equivalent to (L″, s ∘ Spd(L″ → L′)).

**Unit tests.**

- `rigidAnalyticPoint_spd_self` (degenerate): Spd L over itself has exactly one equivalence class of rigid analytic points, that of the identity.
- `rigidAnalyticPoint_spd_galois` (computation): For L′/L Galois of degree n, the rigid analytic points (L′, s) of Spd L′ over L with source Spd L′ are the n maps Spd(σ), σ ∈ Gal(L′/L); they are all equivalent.
- `rigidAnalyticPoint_compat_classical` (compatibility): For Y = Spa(L⟨T⟩) the disc, equivalence classes of rigid analytic points of Y^♢ correspond to classical points of Y (AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points).
- `not_rigidAnalyticPoint_C` (non-example): A map Spd C → S with C the completion of an algebraic closure of L is a geometric point but not a rigid analytic point: C is not finite over L.

**Uses.**

- Howe–Klevdal II, Definition 2.2.1(1) and Remark 2.2.2: classical points of rigid analytic diamonds
- Howe–Klevdal II, Proposition 7.3.3 and Part I Example 5.4.6: admissible loci admit rigid analytic points (Rapoport–Viehmann)

**Checks and worked examples.**

- Spd L has the identity as a rigid analytic point; a map Spd C → S from a completed algebraic closure C is not one.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §2.2, Definition 2.2.1(1), p. 15. Defines a rigid analytic point of a diamond S over Spd L as a morphism Spd L′ → S over L with L′/L finite.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5, proof of Theorem 5.0.4, p. 34. Observes that the only rigid analytic point of Gr_G over Spd L is 0, while classical points are dense in any rigid analytic variety.

### Classical points are the rigid analytic points of the diamond

**Target `AdicSpacesPartIIPartII:RZ.3/classical-points-rigid-analytic-points` (theorem).** Let L be a complete nonarchimedean field over Q_p and Y a rigid space over L. Under |Y^♢| = |Y|, the image of every rigid analytic point of Y^♢ over Spd L is a classical point of Y, and s ↦ image induces a bijection between equivalence classes of rigid analytic points of Y^♢ and classical points of Y. For each finite L′/L, the rigid analytic points with source Spd L′ are in bijection with Y(L′).

**Named signature.** `TauCeti.Rigid.classicalEquivRigidAnalyticPoint`.

**Planet.** Rigid analytic points.

**Hypotheses and conventions.**

- Y need not be seminormal: the map Spa(L′) → Y attached to s exists because Spa L′ is normal, hence seminormal, and maps out of seminormal rigid spaces are detected on diamonds (DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness, whose source is seminormal and target arbitrary).

**Construction or proof.**

1. By seminormal full faithfulness, Hom_{Spd L}(Spd L′, Y^♢) = Hom_{Spa L}(Spa L′, Y) = Y(L′) (DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness).
2. By AdicSpacesPartIIPartII:RZ.3/classical-point, Y(L′) is the set of pairs (x classical, k(x) ↪ L′); the image point in |Y| = |Y^♢| (DiamondsAndVStacks:D6/etale-site-comparison) is x.
3. Two rigid analytic points have the same image iff they are equivalent: if both lie over x, embed L′ and L″ over k(x) into a common finite L‴; then both restrictions are the map attached to (x, k(x) ↪ L‴), up to choosing the embeddings compatibly; conversely equivalent points have the same image.
4. Surjectivity: a classical x gives (k(x), the canonical map Spd k(x) → Y^♢).

**Inputs.** `AdicSpacesPartIIPartII:RZ.3/classical-point`, `AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point`, `DiamondsAndVStacks:D6/seminormal-rigid-full-faithfulness`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

**Checks and worked examples.**

- For the closed unit disc over L, the rigid analytic points over L′ are the elements of O_{L′}, and their classes are the Gal(L̄/L)-orbits of elements of O_{L̄} algebraic over L, i.e. the classical points.
- For the B_dR^+-affine Grassmannian (not a rigid analytic diamond) the analogous statement fails: its only rigid analytic point is 0.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §2.2, Remark 2.2.2, p. 15. The image of a rigid analytic point of Y^♢ is a classical point of Y, classical points correspond bijectively to equivalence classes of rigid analytic points, and classical points are dense in |Y| = |Y^♢|.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §2.2, paragraph before Definition 2.2.1, p. 15. Recalls that Y ↦ Y^♢ is fully faithful on seminormal rigid analytic varieties over L (Scholze–Weinstein, Proposition 10.2.3).

### The L-points of a polydisc with the subspace topology

**Target `AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology` (theorem).** Let L be a complete nonarchimedean field with nontrivial absolute value and D = Spa(L⟨T_1, …, T_n⟩, L°⟨T_1, …, T_n⟩) the closed unit polydisc. The map O_L^n → |D|, a ↦ the classical point T = a, is injective, and with the subspace topology on its image D(L) ⊆ |D| it is a homeomorphism onto D(L) from O_L^n with its valuation topology. Hence D(L) is a complete metric space and a Baire space.

**Named signature.** `TauCeti.Rigid.polydiscPointsHomeomorph`.

**Hypotheses and conventions.**

- L is not required to be discretely valued; the polydisc is the unit one.

**Construction or proof.**

1. Injectivity: distinct a, b ∈ O_L^n give distinct maximal ideals (T − a) and (T − b).
2. A rational domain pulls back to inequalities |f_i(a)| ≤ |g(a)| ≠ 0. Around an a satisfying them, choose a small ball on which |g| is constant and each f_i changes by less than |g(a)|. The ultrametric inequality preserves the weak inequalities on that ball. Thus the inverse image is open; ordinary continuity alone would not justify weak inequalities.
3. Openness onto the image: the ball {|T_i − a_i| ≤ |c|} (c ∈ L^×) is a rational subset whose L-points are exactly the corresponding ball of O_L^n; balls form a basis of O_L^n.
4. O_L^n is closed in the complete finite product L^n, so it is complete. Obtain its BaireSpace instance by Mathlib typeclass inference (the source-checked instance BaireSpace.of_completelyPseudoMetrizable, Mathlib/Topology/Baire/CompleteMetrizable.lean, line 26). No separate analytic Baire theorem is planned.

**Inputs.** `AdicSpacesPartIIPartII:RZ.3/classical-point`, `tauceti:TauCeti.ValuationSpectrum.closedPolydisc`, `tauceti:TauCeti.ValuationSpectrum.classicalPoint`, `mathlib:BaireSpace`, `mathlib:IsUltrametricDist`.

**Checks and worked examples.**

- D(L) ⊆ |D| is not closed when n ≥ 1: its closure contains the Gauss point if the residue field is infinite (AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure).
- For n = 0, D(L) is the single point Spa L.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. States that D_n(L′) ⊆ |S_{L′}| with the subspace topology is homeomorphic to O_{L′}^n with the p-adic topology, hence a complete metric space to which the Baire category theorem applies, and that an L′-point of a smooth S has a neighbourhood basis of n-dimensional discs.

### A closed set containing the rational points of a disc contains its Gauss point

**Target `AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure` (theorem).** Let L be a complete nonarchimedean field whose residue field L̃ is infinite, D the closed unit polydisc of dimension n over L and η ∈ |D| its Gauss point, the rank-one point |Σ a_α T^α|_η = max_α |a_α|. Then every open neighbourhood of η in |D| contains L-points; more precisely a rational neighbourhood {|f_i| ≤ |g|} of η normalised so that |g|_η = 1 (so g ∈ L°⟨T⟩ with nonzero reduction ḡ ∈ L̃[T]) contains every a ∈ O_L^n whose reduction ā satisfies ḡ(ā) ≠ 0, and such a exist. Consequently a closed subset of |D| containing D(L) contains η, and a closed subset of a rigid space S containing a polydisc's worth of L-points (the L-points of an open polydisc neighbourhood of an L-point) contains the corresponding Gauss point. If L̃ is finite the conclusion fails.

**Named signature.** `TauCeti.Rigid.gaussPoint_mem_closure_rationalPoints`.

**Planet.** Gauss point in the closure of rational points.

**Hypotheses and conventions.**

- L̃ infinite is exactly what is used. Howe–Klevdal apply it with L′ finite over a p-adic field containing Q̆_p, whose residue field contains F̄_p (they write that the residue field is algebraically closed; only infinitude is needed — source issue recorded by the paper extraction).
- Reuse the current Tau Ceti one-variable Gauss-point construction; its existence is not new work. The multivariable closure theorem remains a target. Current-library evidence is separate from the pinned baseline.

**Construction or proof.**

1. Normalise: at η, |g|_η = 1 > 0, so scaling makes g ∈ L°⟨T⟩ with Gauss norm 1; then |f_i|_η ≤ 1 forces f_i ∈ L°⟨T⟩.
2. Its reduction ḡ ∈ L̃[T_1, …, T_n] is a nonzero polynomial; since L̃ is infinite, ḡ(ā) ≠ 0 for some ā ∈ L̃^n (Mathlib MvPolynomial.funext over an infinite field); lift to a ∈ O_L^n (over any local ring with infinite residue field: suggested name MvPolynomial.exists_isUnit_eval_of_infinite_residueField).
3. Then |g(a)| = 1 and |f_i(a)| ≤ 1 = |g(a)|, so x_a lies in the neighbourhood.
4. Rational subsets containing η form a neighbourhood basis of η, so every open neighbourhood of η meets D(L); a closed set containing D(L) contains η.
5. Failure for finite L̃ = F_q, n = 1: the rational subset {|T^q − T| ≥ 1} = {1 ≤ |T^q − T|} contains η (|T^q − T|_η = 1) but no point of O_L, where |a^q − a| < 1.

**Inputs.** `AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology`, `AdicSpacesPartIIPartII:RZ.3/classical-point`, `tauceti:TauCeti.ValuationSpectrum.closedPolydisc`, `mathlib:MvPowerSeries.gaussNorm`, `mathlib:MvPolynomial.funext`, `mathlib:MvPolynomial`.

**Checks and worked examples.**

- Over L = Q_p^{ur}-completion (residue field F̄_p), the open neighbourhood {|T| ≥ 1} ∩ {|T − 1| ≥ 1} of η contains the L-point T = ζ for a root of unity ζ ≠ 1 of order prime to p.
- Over Q_p (residue field F_p), {|T^p − T| ≥ 1} is an open neighbourhood of the Gauss point of the disc containing no Q_p-point.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. Argues that if a closed subset of the Hodge exceptional locus contained a disc of L′-points it would contain its Gauss point, by Raynaud's description and the residue field being algebraically closed.
- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Example 2.1, p. 6. Describes the Gauss point of the closed disc as the valuation centred at the generic point of the special fibre of the standard formal model.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

## RZ.4 — Shilov and weakly Shilov points

Bhatt–Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1. Targets:

- **Reduction and specialisation**: Ã = A°/A°° for a K-affinoid A and the continuous surjective specialisation map sp : Spa(A, A°) → Spec Ã.
- **Shilov points** of an affinoid (Definition 2.4): rank-one points whose specialisation is a generic point of Spec Ã, with the four equivalent characterizations of Proposition 2.2 (including the Shilov boundary of the Banach algebra A).
- **Weakly Shilov points** of a rigid space (Definition 2.5), their density (Lemma 2.8) and the transcendence criterion trdeg K̃_x = dim_x X (Proposition 2.9), with Abhyankar's bound trdeg K̃_x ≤ dim_x X at every rank-one point.
- **Weakly Shilov points avoid nowhere dense Zariski closed sets** (Corollary 2.10) and lie in the regular locus of a reduced space.

### Reduction of an affinoid and the specialisation map

**Target `AdicSpacesPartIIPartII:RZ.4/specialisation-map` (construction).** For a K-affinoid algebra A, let A° be its power-bounded elements, A°° the topologically nilpotent ones and Ã = A°/A°°, a K̃-algebra of finite type. The specialisation map sp : Spa(A, A°) → Spec Ã sends x to the prime ideal {a ∈ A° : |a(x)| < 1}/A°°. It is continuous and surjective, functorial for morphisms of affinoids (through φ̃ : Ã → B̃), sends classical points to closed points, and for the closed unit polydisc sends the Gauss point to the generic point of Spec K̃[T_1, …, T_n].

**Named signature.** `TauCeti.Rigid.specialisation`.

**Hypotheses and conventions.**

- Ã is of finite type over K̃ by BGR 6.3.4 (finite affinoid maps induce finite reductions, AdicSpacesPartII:R0/affinoid-reduction-finite, applied to a Noether normalization).

**Construction or proof.**

1. sp(x) is prime: {a ∈ A° : |a(x)| < 1} is the preimage of the maximal ideal of the valuation ring of x, and contains A°° because topologically nilpotent elements have |a(x)| < 1.
2. Continuity: for a ∈ A°, sp^{-1}(D(ā)) = {x : |a(x)| ≥ 1} = {x : |a(x)| = 1}, a rational subset, hence open.
3. Surjectivity: every prime of Ã is the centre of a valuation of Frac(Ã/q) ⊇ … ; lifting through a formal model whose special fibre maps homeomorphically to Spec Ã (Bhatt–Hansen, first observation in the proof of Proposition 2.2; Raynaud, AdicSpacesPartII:R2/raynaud-theorem) and using that the specialisation of the formal model is surjective.
4. Functoriality: φ(A°) ⊆ B°, φ(A°°) ⊆ B°° (AdicSpacesPartII:R0/affinoid-reduction-finite) and sp_A ∘ Spa(φ) = Spec(φ̃) ∘ sp_B.
5. A classical point maps to a maximal ideal: its residue field is finite over K, so the image is a point whose residue field is finite over K̃.

**Inputs.** `AdicSpacesPartII:R0/affinoid-reduction-finite`, `AdicSpacesPartII:R0/affinoid-power-bounded-iff-sup`, `AdicSpacesPartII:R0/affinoid-noether-normalisation`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2/affinoid-admissible-model`, `tauceti:TauCeti.Huber.powerBoundedSubring`, `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal`, `mathlib:PrimeSpectrum`.

**API.**

- `TauCeti.Rigid.reduction` (data): Ã = A°/A°°, a finitely generated K̃-algebra.
- `TauCeti.Rigid.specialisation` (data): sp : Spa(A, A°) → PrimeSpectrum Ã, x ↦ {a ∈ A° : |a(x)| < 1}/A°°.
- `TauCeti.Rigid.specialisation_continuous` (other): sp is continuous: sp^{-1}D(ā) = {|a| = 1}.
- `TauCeti.Rigid.specialisation_surjective` (other): sp is surjective.
- `TauCeti.Rigid.specialisation_naturality` (functoriality): For φ : A → B, sp_A ∘ Spa(φ) = Spec(φ̃) ∘ sp_B.
- `TauCeti.Rigid.specialisation_classical` (relation): Classical points specialise to closed points of Spec Ã.
- `TauCeti.Rigid.reduction_powerBounded` (compatibility): A° and A°° are Tau Ceti's powerBoundedSubring and topologicallyNilpotentIdeal; Ã is Tau Ceti's reduction of the Huber pair (A, A°).

**Unit tests.**

- `specialisation_disc` (computation): For A = K⟨T⟩: Ã = K̃[T], sp(Gauss point) = (0), and sp(T = a) = (T − ā) for a ∈ K°.
- `specialisation_annulus` (computation): For A = K⟨X, Y⟩/(XY − c), 0 < |c| < 1, Ã = K̃[X, Y]/(XY), whose two generic points are the specialisations of the Gauss points of the two boundary circles.
- `specialisation_field` (degenerate): For A = K, Ã = K̃ and sp maps the single point to the single point.
- `reduction_tauceti_compat` (compatibility): For A = K⟨T⟩, A° = K°⟨T⟩ = TauCeti.Huber.powerBoundedSubring A and A°° = K°°⟨T⟩.
- `specialisation_not_injective` (non-example): sp is not injective: on the disc, all points of the open residue disc {|T| < 1} (classical and not) specialise to the closed point T = 0.

**Uses.**

- Bhatt–Hansen, Proposition 2.2 (AdicSpacesPartIIPartII:RZ.4/shilov-point): Shilov points are those specialising to generic points of Spec Ã
- Howe–Klevdal II, proof of Lemma 9.3.5 (AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure): the Gauss point is the preimage of the generic point of the reduction of the disc

**Checks and worked examples.**

- For A = K⟨T⟩, Ã = K̃[T], sp(η) is the generic point and sp(x_a) is the closed point T − ā.
- For A = K⟨X, Y⟩/(XY − c), 0 < |c| < 1, Ã = K̃[X, Y]/(XY) has two generic points.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Example 2.1 and proof of Proposition 2.2, pp. 6–7. Describes the reduction Ã = A°/A°°, a ring of definition A_0 with Spec Ã → Spec(A_0/t) a universal homeomorphism, the specialisation sp : Spa(A, A°) → Spec Ã, and the Gauss point as the preimage of the generic point.

### Shilov points of an affinoid

**Target `AdicSpacesPartIIPartII:RZ.4/shilov-point` (definition).** Let A be a K-affinoid algebra. A point x ∈ Spa(A, A°) is a Shilov point if it has rank one and sp(x) is the generic point of an irreducible component of Spec Ã. The Shilov points form a finite set, at most one over each generic point of Spec Ã.

**Named signature.** `TauCeti.Rigid.IsShilov`.

**Hypotheses and conventions.**

- Rank one: the valuation of x has value group of rank one (x is a maximal point of the spectral space).

**Construction or proof.**

1. Finiteness: Spec Ã is noetherian, so it has finitely many irreducible components; by AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation(2) each generic point has exactly one preimage.

**Inputs.** `AdicSpacesPartIIPartII:RZ.4/specialisation-map`, `mathlib:PrimeSpectrum`, `mathlib:minimalPrimes`.

**API.**

- `TauCeti.Rigid.IsShilov` (characterisation): x is Shilov iff x has rank one and sp(x) ∈ minimalPrimes Ã.
- `TauCeti.Rigid.shilovPoints_finite` (other): The set of Shilov points is finite, in bijection with the minimal primes of Ã.
- `TauCeti.Rigid.IsShilov.unique_preimage` (characterisation): x is Shilov iff {x} = sp^{-1}(sp(x)) (with x of rank one).
- `TauCeti.Rigid.IsShilov.sup_attained` (relation): For every f ∈ A, |f|_sup = max over Shilov points x of |f(x)| (Shilov boundary).
- `TauCeti.Rigid.IsShilov.map_finite` (functoriality): For a finite injective A → B of domains, Shilov points of B map to Shilov points of A.

**Unit tests.**

- `isShilov_gauss` (computation): The Shilov points of the closed unit polydisc are exactly the Gauss point.
- `isShilov_annulus` (computation): The annulus K⟨X, Y⟩/(XY − c), 0 < |c| < 1, has exactly two Shilov points.
- `isShilov_field` (degenerate): For A = L finite over K, the unique point of Spa L is Shilov; the zero algebra has none.
- `isShilov_sup` (compatibility): For f = p + T² ∈ Q_p⟨T⟩, |f|_sup = 1 = |f(η)| is attained at the Shilov point η, agreeing with the Banach-algebra Shilov boundary.
- `not_isShilov_classical` (non-example): A classical point of the disc is not Shilov: it specialises to a closed point of Spec K̃[T].

**Uses.**

- Bhatt–Hansen, Definition 2.5 (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point): weakly Shilov points are Shilov points of some affinoid neighbourhood
- Bhatt–Hansen, Proposition 2.24 and Theorem 2.21: generic flatness and smoothness hold on neighbourhoods of all Shilov points

**Checks and worked examples.**

- The Shilov points of the disc and of the polydisc: the Gauss point alone; of the annulus K⟨X, Y⟩/(XY − c): the two Gauss points of its boundary circles.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Definition 2.4, p. 7. A Shilov point of Spa A for a tft K-algebra A is a rank-one point satisfying the equivalent conditions of Proposition 2.2.

### Four characterizations of Shilov points

**Target `AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation` (theorem).** Let A be a K-affinoid algebra and x ∈ Spa(A, A°) a rank-one point. The following are equivalent: (1) sp(x) is the generic point of an irreducible component of Spec Ã; (2) {x} = sp^{-1}(sp(x)); (3) the valuation ring K_x^+ of the completed residue field of x is the t-adic completion of the local ring of Spec A° at sp(x) (t a pseudo-uniformizer of K); (4) the seminorm |·|_x lies in the Shilov boundary of the Banach K-algebra A.

**Named signature.** `TauCeti.Rigid.isShilov_tfae`.

**Hypotheses and conventions.**

- A is K-affinoid; the equivalences fail for general complete Tate rings (Bhatt–Hansen, Remark 2.3: a perfectoid counterexample).

**Construction or proof.**

1. Choose an open bounded topologically finitely presented K°-subalgebra A_0 ⊆ A° with A° integral over A_0 and Spec Ã → Spec(A_0/t) a universal homeomorphism (Noether normalization and BGR 6.3.4); describe Spa(A, A°) as the limit of the special fibres of proper t-isomorphisms X_i → Spec A_0, with O^+ the t-completed colimit of structure sheaves.
2. (1) ⇒ (2): localize A° at the inverse image p of the generic point in Ã. It is this localization (or its separated t-adic completion), not the local ring of Ã, that supplies the rank-one valuation ring via affinoid Noether normalization. The latter ring has t=0 and cannot have t as a uniformizer. The valuation-theoretic argument then forces the fibre of sp to be a singleton; see E6.
3. (2) ⇒ (3): the local rings of the X_i at the unique preimages are integral over A_{0,sp(x)} and isomorphisms after inverting t; the t-completed colimit is integrally closed, hence equals the completed local ring of A°.
4. (3) ⇒ (2): points of Spa are classes of maps A_0 → V to t-complete valuation rings.
5. (2) ⇒ (1): if sp(x) were not generic, a valuation of the function field of a component through it, centred at sp(x), composed with K_y^+ for a lift y of the generic point, gives a rank ≥ 2 point over sp(x) different from x.
6. (1) ⇔ (4): Berkovich, Spectral theory, Proposition 2.4.4.

**Inputs.** `AdicSpacesPartIIPartII:RZ.4/specialisation-map`, `AdicSpacesPartIIPartII:RZ.4/shilov-point`, `AdicSpacesPartII:R0/affinoid-noether-normalisation`, `AdicSpacesPartII:R0/affinoid-power-bounded-integral`, `AdicSpacesPartII:R2/admissible-blow-up`, `AdicSpacesPartII:R2/raynaud-theorem`.

**Checks and worked examples.**

- For the disc, (2) holds at η: only η specialises to the generic point; for a classical point the fibre sp^{-1}(sp(x)) is a whole residue disc.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Proposition 2.2 and its proof, pp. 6–7. For a tft K-algebra and a rank-one point, specialisation to a generic point of Spec Ã, being the only point over its specialisation, K_x^+ being a t-completed localization of A°, and lying in the Shilov boundary are equivalent; the last via Berkovich 2.4.4.
- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Remark 2.3, p. 7. Explains which implications survive for arbitrary complete Tate rings and gives a perfectoid counterexample to the others.

### Weakly Shilov points of a rigid space

**Target `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point` (definition).** Let X be a rigid space over K. A point x ∈ |X| is weakly Shilov if there is an affinoid open W ⊆ X containing x such that x is a Shilov point of W. Weakly Shilov points have rank one. They are dense in |X|: every nonempty affinoid open contains one (Bhatt–Hansen, Lemma 2.8).

**Named signature.** `TauCeti.Rigid.IsWeaklyShilov`.

**Planet.** Weakly Shilov points.

**Hypotheses and conventions.**

- X is any rigid space over K; no quasi-separatedness.

**Construction or proof.**

1. Rank one: Shilov points have rank one by definition.
2. Density: a nonempty open subset contains a nonempty affinoid open W, and Spec W̃ has a generic point; its preimage under the surjective sp is nonempty and consists of a single rank-one point (AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation), which is Shilov in W.

**Inputs.** `AdicSpacesPartIIPartII:RZ.4/shilov-point`, `AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation`, `AdicSpacesPartIIPartII:RZ.4/specialisation-map`.

**API.**

- `TauCeti.Rigid.IsWeaklyShilov` (characterisation): x is weakly Shilov iff x is a Shilov point of some affinoid open neighbourhood.
- `TauCeti.Rigid.IsWeaklyShilov.rankOne` (relation): A weakly Shilov point has rank one.
- `TauCeti.Rigid.dense_weaklyShilov` (other): Weakly Shilov points are dense in |X| (Bhatt–Hansen Lemma 2.8).
- `TauCeti.Rigid.isWeaklyShilov_restrict` (functoriality): For U ⊆ X open and x ∈ U, x is weakly Shilov in U iff in X (by the transcendence criterion).
- `TauCeti.Rigid.isWeaklyShilov_iff_trdeg` (characterisation): x of rank one is weakly Shilov iff trdeg_{K̃} K̃_x = dim_x X (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion).
- `TauCeti.Rigid.IsWeaklyShilov.of_shilov` (constructor): Every Shilov point of an affinoid open is weakly Shilov.

**Unit tests.**

- `isWeaklyShilov_disc_type2` (computation): On the unit disc, the Gauss points η_{a,r} with a ∈ K°, r ∈ |K×| and 0 < r ≤ 1 are weakly Shilov; each is the Shilov point of its rational closed subdisc.
- `isWeaklyShilov_dim_zero` (degenerate): On X = Spa L, L/K finite, the unique point is weakly Shilov (dimension 0, trdeg 0).
- `isWeaklyShilov_eq_shilov_affinoid_disc` (compatibility): For X the disc and W = X, the Shilov points of W (just η) are among the weakly Shilov points of X; the weakly Shilov points form the larger set of type 2 points.
- `not_isWeaklyShilov_classical` (non-example): A classical point x with dim_x X > 0 is not weakly Shilov: its secondary residue field is finite over K̃, so trdeg = 0. A zero-dimensional connected component is a necessary exception, even when dim X > 0.

**Uses.**

- Bhatt–Hansen, Corollary 2.10 (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense): nowhere dense Zariski closed sets miss all weakly Shilov points
- Howe–Klevdal II, proof of Lemma 9.3.5, p. 60: the Hodge generic locus contains every weakly Shilov point, hence is dense, and the closure argument for classical points

**Checks and worked examples.**

- The weakly Shilov points of the closed unit disc are exactly its type 2 points; type 1, 3, 4 and 5 points are not (Bhatt–Hansen, Example 2.6).

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Definition 2.5, Example 2.6, Remark 2.7 and Lemma 2.8, pp. 7–8. Defines weakly Shilov points as Shilov points of some affinoid open neighbourhood, identifies them on the disc with type 2 points, relates them to divisorial valuations, and proves their density.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. Shows the Hodge generic locus contains all weakly Shilov points of S and is therefore dense (citing Bhatt–Hansen with the definition misnumbered as 2.4).

### Abhyankar's bound for secondary residue fields

**Target `AdicSpacesPartIIPartII:RZ.4/abhyankar-bound` (theorem).** Let X be a rigid space over K and x ∈ |X| a rank-one point with completed residue field H(x) and secondary residue field K̃_x (the residue field of its valuation ring). Then K̃_x is a field extension of K̃ with trdeg_{K̃} K̃_x ≤ dim_x X.

**Named signature.** `TauCeti.Rigid.trdeg_secondaryResidueField_le_localDim`.

**Hypotheses and conventions.**

- x of rank one; dim_x X the local dimension (AdicSpacesPartIIPartII:RZ.0/local-dimension).

**Construction or proof.**

1. Choose an affinoid neighbourhood Spa(A, A°) with dim A = dim_x X =: d and a finite injective K⟨T_1, …, T_e⟩ → A/supp(x) with e = dim A/supp(x) ≤ d (AdicSpacesPartII:R0/affinoid-noether-normalisation).
2. The image y of x in the e-dimensional polydisc has H(x) finite over H(y), so K̃_x is algebraic over K̃_y.
3. The dense polynomial algebra shows that the secondary residue field of H(y) is the residue field of the restricted valuation on Frac(K[T]/supp(y)). Lift any finite algebraically independent family of residue classes to units of this valued function field. A polynomial relation among these lifts over K, after dividing its coefficients by one of maximal norm, would reduce to a nonzero relation among their residues over K̃. Thus the lifts are algebraically independent over K, so their number is at most the transcendence degree of this function field, at most e.

**Inputs.** `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartII:R0/affinoid-noether-normalisation`, `mathlib:Algebra.trdeg`, `mathlib:ValuationSubring`, `mathlib:Valuation`.

**Checks and worked examples.**

- At the Gauss point of the polydisc, K̃_x = K̃(T_1, …, T_n) has transcendence degree n = dim; at a classical point it is a finite extension of K̃.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Proposition 2.9(2) and its proof, p. 8. Characterizes weakly Shilov points by the transcendence degree of the secondary residue field equalling the local dimension, citing Poineau's Lemme 4.4 and Corollaire 4.15, of which the inequality is the first half.
- Jérôme Poineau, *Les espaces de Berkovich sont angéliques*, §4, Definition 4.1 and Remark 4.3, p. 283. Uses the full Abhyankar inequality. The residue-transcendence inequality needed here is proved directly in the sketch by lifting algebraically independent residues.

### Weakly Shilov points are those of maximal residue transcendence degree

**Target `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion` (theorem).** Let X be a rigid space over K and x ∈ |X| a rank-one point. The following are equivalent: (1) x is weakly Shilov; (2) trdeg_{K̃} K̃_x = dim_x X; (3) when X is quasi-separated and quasi-paracompact, there is a formal model 𝔛 of X such that x specialises to the generic point of an irreducible component of the special fibre 𝔛_s.

**Named signature.** `TauCeti.Rigid.isWeaklyShilov_iff_trdeg_eq_localDim`.

**Hypotheses and conventions.**

- (3) needs Raynaud's theory of formal models (AdicSpacesPartII:R2/raynaud-theorem), hence quasi-separated and quasi-paracompact X.

**Construction or proof.**

1. For a Shilov point of a strict affinoid neighbourhood, Poineau Lemma 4.4 identifies the residue transcendence degree with the local dimension. Dimension is invariant under open restriction.
2. Conversely, choose an affinoid neighbourhood U of x whose dimension is d = dim_x X. If trdeg K̃_x = d, Abhyankar’s inequality excludes every lower-dimensional component and every intersection of distinct d-dimensional components through x. Thus x lies on exactly one component of U, of dimension d.
3. Apply Poineau Corollary 4.18 (and Corollary 4.15 in the irreducible case): there is a strict Laurent domain in U having x as its unique Shilov-boundary point. A strict Laurent domain is a rational affinoid open on the adic side. Proposition 2.2 of Bhatt–Hansen identifies the Berkovich Shilov boundary with the rank-one adic Shilov points. No field extension or descent of a chosen domain is needed.
4. For the formal-model characterization, use Raynaud’s equivalence and admissible blow-ups to make the chosen affinoid domain a formal open; the generic point of its special fibre gives the desired specialization. This invokes the precise formal-model localization input recorded in G5.

**Inputs.** `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point`, `AdicSpacesPartIIPartII:RZ.4/abhyankar-bound`, `AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation`, `AdicSpacesPartIIPartII:RZ.0/local-dimension`, `AdicSpacesPartII:R2/raynaud-theorem`, `AdicSpacesPartII:R2/raynaud-generic-fibre`, `AdicSpacesPartIIPartII:RZ.1/irreducible-components`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartII:R2`.

**Checks and worked examples.**

- At a type 3 point of the disc trdeg = 0 < 1: not weakly Shilov; at type 2 points trdeg = 1 = dim.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Proposition 2.9 and its proof, p. 8. Proves the equivalence of being weakly Shilov, the transcendence degree of the secondary residue field equalling the local dimension (via Poineau, Lemme 4.4 and Corollaire 4.15), and specialising to a generic point of the special fibre of a formal model (via Raynaud, Bosch's Lectures Theorem 8.4.3).
- Jérôme Poineau, *Les espaces de Berkovich sont angéliques*, §4, Lemma 4.4, p. 284; Corollaries 4.15 and 4.18, pp. 287–288; Remark 4.14(ii), p. 287. Shilov points of strict affinoids have full residue transcendence degree. Conversely full degree gives a strict Laurent domain with singleton Shilov boundary; Corollary 4.18 handles the case of a unique component through the point.

### Weakly Shilov points avoid nowhere dense Zariski closed sets

**Target `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-avoid-nowhere-dense` (theorem).** Let X be a rigid space over K and Z ⊆ X a nowhere dense Zariski closed subset. Then Z contains no weakly Shilov point of X. Consequently: (i) if X is reduced, every weakly Shilov point lies in the regular locus Reg(X); (ii) if X is irreducible and Z ⊊ X is Zariski closed, Z contains no weakly Shilov point; (iii) a subset of |X| that contains all weakly Shilov points, or whose complement is a countable union of nowhere dense Zariski closed sets, is dense.

**Named signature.** `TauCeti.Rigid.IsWeaklyShilov.not_mem_of_isNowhereDense`.

**Planet.** Weakly Shilov points avoid nowhere dense sets.

**Hypotheses and conventions.**

- For (ii), proper Zariski closed subsets of irreducible spaces are nowhere dense (AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion).

**Construction or proof.**

1. If z ∈ Z is weakly Shilov in X, then trdeg K̃_z = dim_z X (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion); but z is also a rank-one point of Z with the same completed residue field, so trdeg K̃_z ≤ dim_z Z (AdicSpacesPartIIPartII:RZ.4/abhyankar-bound) < dim_z X (AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria(e)). Contradiction.
2. (i): Sing(X) is a nowhere dense Zariski closed subset when X is reduced (AdicSpacesPartIIPartII:RZ.2/singular-locus).
3. (ii) is the main statement with AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion.
4. (iii): weakly Shilov points are dense (AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point); none lies in a nowhere dense Zariski closed set, so a countable union of such sets contains none.

**Inputs.** `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion`, `AdicSpacesPartIIPartII:RZ.4/abhyankar-bound`, `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-point`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartIIPartII:RZ.2/singular-locus`, `AdicSpacesPartIIPartII:RZ.1/irreducibility-criterion`.

**Checks and worked examples.**

- On the disc, every proper Zariski closed subset is a discrete set of classical points and misses all type 2 points.
- Howe–Klevdal II, Lemma 9.3.5: on a smooth connected S the Hodge exceptional locus, a countable union of proper Zariski closed Hodge loci, contains no weakly Shilov point, so the Hodge generic locus is dense.

**Sources.**

- Bhargav Bhatt and David Hansen, *The six functors for Zariski-constructible sheaves in rigid geometry*, §2.1, Corollary 2.10 and its proof, p. 8. A nowhere dense Zariski closed subset contains no weakly Shilov point, by the drop of local dimension and the transcendence characterization; on a reduced space weakly Shilov points are regular.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. Combines Conrad's Lemma 2.1.4 and Bhatt–Hansen's Corollary 2.10 to show that proper Hodge loci contain no weakly Shilov points.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- G5 / Q2: formal-model localization for the third characterization and the original Banach Shilov-boundary comparison proof; G4 for the regular-locus consequence.

## RZ.5 — Functorial resolution of singularities in characteristic zero

Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case* (Duke Math. J. 161 (2012)). Targets:

- **Blow-up sequences** of noetherian schemes and of rigid spaces along coherent ideals, with pullback along flat (regular, smooth) morphisms and trivial extensions; rigid blow-ups are proper and, for nowhere dense centres, their exceptional loci nowhere dense.
- **Functorial desingularization of varieties** of characteristic zero, compatible with all regular morphisms (Temkin Theorem 2.3.5, from Bierstone–Milman and Bierstone–Milman–Temkin), extending the resolution of AlgebraicModuliForArithmeticGeometry R09.7.
- **Functorial desingularization of noetherian quasi-excellent schemes over ℚ** (Temkin Theorem 1.2.1 and Remark 1.2.2).
- **Resolution of rigid spaces** (Temkin Theorems 5.2.2 and 5.3.2): for X rigid over K of characteristic 0 with nowhere dense non-reduced locus, a proper morphism X_∞ → X from a smooth rigid space, a locally finite composite of blow-ups with regular nowhere dense centres over Sing(X), an isomorphism over the smooth locus, functorial for smooth morphisms.
- **Consequences used by Howe–Klevdal II** (§5.3, p. 35; §9.3, p. 60): the resolution is surjective, its diamond is a v-cover, T^♢ = (T_red)^♢ for every rigid T, and the resolution of an irreducible space is connected.

### Blow-up sequences and their flat pullbacks

**Target `AdicSpacesPartIIPartII:RZ.5/blow-up-sequence` (definition).** Let X be a locally noetherian scheme. A blow-up of X is the blow-up Bl_V(X) → X along a fixed closed subscheme V (the centre is part of the data); it is empty if V = ∅. A blow-up sequence of length n is a chain X_n → ⋯ → X_1 → X_0 = X with X_{i+1} = Bl_{V_i}(X_i); it is contracted if no blow-up is empty, and a trivial extension of a sequence is obtained by inserting empty blow-ups. For a flat g : Y → X the pullback g^*(X_n ⇢ X) is the sequence Y ×_X X_i with centres Y ×_X V_i, again a blow-up sequence. A sequence is T-supported if its centres lie over T, and strong if its centres are regular. The same definitions apply to rigid spaces with the rigid blow-ups of AdicSpacesPartIIPartII:RZ.5/rigid-blow-up and flat morphisms of rigid spaces.

**Named signature.** `TauCeti.BlowUpSequence`.

**Hypotheses and conventions.**

- Blow-ups of schemes along closed subschemes (Rees algebra, universal property that the preimage of V is an effective Cartier divisor) are those of AlgebraicModuliForArithmeticGeometry R09.7a, there for varieties, here for locally noetherian schemes; the construction is the same.
- An empty blow-up in Temkin’s sequence convention means the identity stage with empty centre (unit ideal); it does not mean the blow-up of the zero ideal, whose total space is empty.

**Construction or proof.**

1. Blow-ups commute with flat base change: Bl_{V ×_X Y}(Y) = Y ×_X Bl_V(X) for Y → X flat (Temkin §2.2.5), so pullbacks of sequences are sequences.
2. Equality of sequences is isomorphism compatible with centres; it is unique when it exists (Temkin §2.2.3).
3. Pushforward along pro-open immersions by schematic closure of centres (Temkin Lemma 2.2.1).

**Inputs.** `AlgebraicModuliForArithmeticGeometry:R09.7a/finite-blowup-tower`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:Module.Flat`.

**API.**

- `TauCeti.BlowUpSequence` (structure): A chain of blow-ups X_n → ⋯ → X_0 with chosen centres V_i ⊆ X_i.
- `TauCeti.BlowUpSequence.pullback` (functoriality): For flat g : Y → X, g^*f is a blow-up sequence with centres Y ×_X V_i; (g ∘ h)^* = h^* g^*.
- `TauCeti.BlowUpSequence.contract` (other): Removing the empty blow-ups gives a contracted sequence; f is a trivial extension of contract f.
- `TauCeti.BlowUpSequence.IsSupported` (characterisation): f is T-supported iff every centre lies over T; then f is empty over X − T.
- `TauCeti.BlowUpSequence.IsStrong` (characterisation): f is strong iff every centre is a regular scheme.
- `TauCeti.BlowUpSequence.proper` (relation): The composite X_n → X is proper and is an isomorphism over the complement of the images of the centres.
- `TauCeti.BlowUpSequence.ext` (extensionality): Two sequences are equal iff the centres correspond under (necessarily unique) isomorphisms of the X_i.

**Unit tests.**

- `blowUpSequence_A2_origin` (computation): Bl_{0}(A²_K) → A²_K is a contracted sequence of length 1 with exceptional divisor P¹_K.
- `blowUpSequence_empty` (degenerate): The sequence of length 0 is X itself; a blow-up along ∅ is empty and is removed by contraction.
- `blowUpSequence_flat_compat` (compatibility): For the open immersion g : A²_K − {0} → A²_K, g^*(Bl_{0}) is the empty blow-up; for the étale map A² → A², (x, y) ↦ (x + 1, y), the pullback of Bl_{(1,0)} is Bl_{0}.
- `blowUpSequence_cartier_nonexample` (non-example): Bl_V(X) → X for an effective Cartier divisor V is an isomorphism of schemes but not an empty blow-up: a definition identifying sequences with their composite morphisms loses the synchronising information Temkin needs.

**Uses.**

- Temkin, Theorem 1.2.1 (AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe): desingularizations are blow-up sequences, compatible with regular morphisms through pullback
- Temkin, proof of Theorem 5.2.2 (AdicSpacesPartIIPartII:RZ.5/rigid-resolution): affinoid charts' sequences are analytified and glued along regular maps

**Checks and worked examples.**

- The blow-up of A² at the origin is a contracted sequence of length 1 whose pullback to A² − {0} is an empty blow-up.
- A blow-up along a Cartier divisor is an isomorphism of schemes but a non-empty blow-up in a sequence.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §2.2.1–2.2.7 and Lemma 2.2.1, pp. 10–11. Blow-ups with fixed centres, empty blow-ups, blow-up sequences, contracted sequences, trivial extensions, flat pullback, pushforward along pro-open immersions and T-supported sequences.

### Blow-ups of rigid spaces along coherent ideals

**Target `AdicSpacesPartIIPartII:RZ.5/rigid-blow-up` (construction).** Let X be a rigid space over K and 𝓘 ⊆ O_X a coherent ideal. The blow-up π : Bl_𝓘(X) → X is the relative analytification of Proj_X(⊕_{n≥0} 𝓘^n): over an affinoid open U = Spa(A, A°) with 𝓘|_U = Ĩ it is (Proj ⊕ I^n)^an relative to Spa(A, A°), and these glue. π is proper, 𝓘·O_{Bl} is an invertible ideal, π is an isomorphism over X − V(𝓘), and π is universal among morphisms Y → X with 𝓘·O_Y invertible. Formation commutes with flat base change Y → X (in particular with restriction to opens and with smooth morphisms). If X is reduced and V(𝓘) is nowhere dense, π^{-1}(V(𝓘)) is a nowhere dense Cartier divisor and Bl_𝓘(X) is reduced.

**Named signature.** `TauCeti.Rigid.blowUp`.

**Hypotheses and conventions.**

- Relative analytification over Spec A is AdicSpacesPartII:R1/scheme-fibre-product-analytification. Projective-space properness is AdicSpacesPartII:R1/analytic-projective-space-proper; apply it relatively over the affinoid base.
- Use relative analytification over Spec A for the blow-up of an affinoid ideal. For the birational and nowhere-dense-exceptional assertions assume the centre is nowhere dense; a zero ideal gives empty Proj and is not a surjective modification.

**Construction or proof.**

1. Affinoid chart: P = Proj ⊕ I^n is projective over Spec A; its relative analytification over Spa(A, A°) is proper (AdicSpacesPartII:R1/analytic-projective-space-proper and closed immersions).
2. Gluing: for an affinoid subdomain A → A′ (flat), Proj ⊕ (IA′)^n = P ×_{Spec A} Spec A′ and relative analytification commutes with this base change, so the charts glue.
3. Universal property: on each chart it is the analytification of the universal property of the algebraic blow-up, via the universal property of relative analytification.
4. Flat base change: the Rees algebra of 𝓘 commutes with flat pullback.
5. Nowhere density of the exceptional divisor: on a reduced X with V(𝓘) nowhere dense, π is an isomorphism over the dense Zariski open X − V(𝓘) and π^{-1}(V(𝓘)) is cut out locally by one nonzerodivisor.

**Inputs.** `AdicSpacesPartII:R1/rigid-analytification`, `AdicSpacesPartII:R1/analytic-projective-space-proper`, `AdicSpacesPartII:R1/analytification-universal-property`, `AdicSpacesPartII:R3/coherent-ideal-closed-subspace`, `AdicSpacesPartII:R0/universally-closed-and-proper-morphism`, `AdicSpacesPartIIPartII:RZ.0/zariski-closed-subset`, `AdicSpacesPartIIPartII:RZ.0/nowhere-dense-criteria`, `AdicSpacesPartIIPartII:RZ.5/blow-up-sequence`, `AdicSpacesPartII:R1/scheme-fibre-product-analytification`.

**API.**

- `TauCeti.Rigid.blowUp` (constructor): Bl_𝓘(X) → X for a coherent ideal 𝓘.
- `TauCeti.Rigid.blowUp_affinoid` (characterisation): Over Spa(A, A°), Bl_Ĩ = (Proj_A ⊕ I^n)^an relative to the affinoid.
- `TauCeti.Rigid.blowUp.isInvertible` (other): 𝓘·O_{Bl_𝓘 X} is an invertible ideal.
- `TauCeti.Rigid.blowUp.lift` (universal-property): Every Y → X with 𝓘·O_Y invertible factors uniquely through Bl_𝓘(X).
- `TauCeti.Rigid.blowUp.isProper` (relation): π is proper.
- `TauCeti.Rigid.blowUp.isIso_compl` (relation): π is an isomorphism over X − V(𝓘).
- `TauCeti.Rigid.blowUp.flatBaseChange` (functoriality): For flat g : Y → X, Bl_{𝓘O_Y}(Y) ≅ Y ×_X Bl_𝓘(X).
- `TauCeti.Rigid.blowUp_analytification` (compatibility): For a scheme X locally of finite type over K and an ideal sheaf 𝓘, Bl_{𝓘^an}(X^an) ≅ (Bl_𝓘 X)^an.

**Unit tests.**

- `blowUp_bidisc_origin` (computation): Blowing up the 2-dimensional unit polydisc at the origin gives exceptional divisor (P¹_K)^an and is an isomorphism elsewhere.
- `blowUp_unit_zero` (degenerate): Bl_{O_X}(X) = X; Bl_{0}(X) = ∅ for X nonempty and reduced (the zero ideal is not invertible on any nonempty open).
- `blowUp_analytification_compat` (compatibility): For X = A²_K and I=(x,y), Bl_{I^an}(X^an) is the analytification of the blow-up of the origin defined by I. This ideal is not the zero ideal.
- `blowUp_cartier_iso` (non-example): Blowing up the disc at the origin is an isomorphism: a definition by 'replacing the centre by its projectivised normal bundle' without the universal property would wrongly change a Cartier centre.

**Uses.**

- Temkin, Theorem 5.2.2 (AdicSpacesPartIIPartII:RZ.5/rigid-resolution): the resolution of a rigid space is a sequence of rigid blow-ups
- Howe–Klevdal II, §5.3, p. 35 (AdicSpacesPartIIPartII:RZ.5/resolution-consequences): the resolution is proper and surjective

**Checks and worked examples.**

- The blow-up of the 2-dimensional polydisc at the origin has exceptional divisor the analytified P¹_K; the blow-up of the disc at the origin is an isomorphism.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §5.2.4, proof of Theorem 5.2.2, p. 33. Analytifies the centres of the algebraic desingularization of affinoid charts to obtain analytic blow-up sequences, glued along the regular maps of the charts.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5.3, p. 35. Uses that a resolution of singularities is proper and surjective with a dense open isomorphic to the smooth locus.

### Functorial desingularization of varieties in characteristic zero

**Target `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-varieties` (theorem).** There is a rule F_Var assigning to every generically reduced scheme X of finite type over a field of characteristic 0 (and to finite disjoint unions of such) a contracted strong blow-up sequence F_Var(X) : X_n ⇢ X with regular X_n and centres disjoint from the preimages of the regular locus, such that for every regular morphism g : X′ → X in this category, F_Var(X′) is the contraction of g^*F_Var(X). The set of its invariants is countable.

**Named signature.** `TauCeti.FunctorialDesingularization.varieties`.

**Hypotheses and conventions.**

- Regular morphisms: flat with geometrically regular fibres (SchemeAndStackFoundations:SF.0/regular-algebra-map); between varieties over the same field these include all smooth morphisms; base field extensions are regular in characteristic 0.

**Construction or proof.**

1. The Bierstone–Milman algorithm (AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution and R09.7/local-isomorphism-resolution) gives a strong desingularization of reduced varieties compatible with local isomorphisms.
2. Compatibility with smooth morphisms (Bierstone–Milman, Functoriality in resolution of singularities, 2008): the local invariant is unchanged under smooth morphisms, so the centres pull back.
3. Compatibility with all regular morphisms and with disjoint unions over different fields (Bierstone–Milman–Temkin, Q-universal desingularization, 2011): every regular morphism of varieties is a limit of smooth morphisms; the algorithm is induced from its restriction to varieties over Q.
4. Countability of invariants: every variety admits a regular morphism to a variety over Q, and there are countably many of those up to isomorphism (Temkin Remark 2.3.6).

**Inputs.** `AlgebraicModuliForArithmeticGeometry:R09.7/embedded-resolution`, `AlgebraicModuliForArithmeticGeometry:R09.7/local-isomorphism-resolution`, `SchemeAndStackFoundations:SF.0/regular-algebra-map`, `AdicSpacesPartIIPartII:RZ.5/blow-up-sequence`.

**Checks and worked examples.**

- For the cuspidal curve y² = x³ over Q the sequence is a single blow-up of the origin; its pullback to the cusp over any field of characteristic 0 is its sequence.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §2.3.1–2.3.7, Theorem 2.3.5 and Remark 2.3.6, pp. 11–14. Defines desingularization, strong and functorial desingularization, gluing from affine pieces through disjoint unions, and states the functorial strong desingularization of characteristic-zero varieties with respect to regular morphisms, citing Bierstone–Milman and Bierstone–Milman–Temkin.

### Temkin's functorial desingularization of quasi-excellent schemes over Q

**Target `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe` (theorem).** For every noetherian quasi-excellent generically reduced scheme X over Spec Q there is a blow-up sequence F(X) : X_n ⇢ X_0 = X such that (i) its centres are disjoint from the preimages of the regular locus X_reg, (ii) its centres are regular, (iii) X_n is regular, and (iv) F is functorial for all regular morphisms X′ → X: F(X′) is obtained from F(X) ×_X X′ by omitting the empty blow-ups. For arbitrary nonreduced noetherian quasi-excellent X over Q, Remark 1.2.2 also gives a functorial construction for regular maps, but it may delete generically nonreduced components and need not be surjective. This extension is not the resolution used for diamond covers.

**Named signature.** `TauCeti.FunctorialDesingularization.quasiExcellent`.

**Planet.** Functorial desingularization.

**Hypotheses and conventions.**

- Quasi-excellent schemes and regular morphisms as in SchemeAndStackFoundations SF.0; generically reduced means the non-reduced locus is nowhere dense.

**Construction or proof.**

1. Black-box strategy (Temkin §1.3): extend F_Var (AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-varieties) first to formal varieties and to schemes whose singular locus is small (§3), using Elkik–Gabber–Ramero type algebraization of the formal neighbourhood of the singular locus (Theorem 3.2.3) and the intrinsic dependence of the desingularization on the formal completion along the singular locus (§3.3, Theorem 3.4.1).
2. Induction on the codimension of the singular locus (§4.1): resolve generically along the singular locus, then extend over the closure by pushforward along pro-open immersions (Temkin Lemma 2.2.1), synchronised by disjoint unions (Lemma 2.3.3).
3. The main construction §4.3 assembles a compatible sequence of these partial resolutions and proves functoriality for regular morphisms; quasi-excellence enters through Nishimura–Nishimura's theorem on completions (Theorem 2.1.6) or Gabber's (Theorem 2.1.8).
4. For general X, first resolve X_red and push the blow-ups forward to X. The resulting space X′ has regular reduction. Blow up the reduction of its generically nonreduced components, obtaining a generically reduced X′′, then apply F(X′′). This final application is required. The full construction is functorial for regular maps (Temkin Remark 1.2.2(i)).

**Inputs.** `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-varieties`, `AdicSpacesPartIIPartII:RZ.5/blow-up-sequence`, `SchemeAndStackFoundations:SF.0/quasi-excellent-scheme`, `SchemeAndStackFoundations:SF.0/regular-algebra-map`, `SchemeAndStackFoundations:SF.0/regular-locus`, `mathlib:AlgebraicGeometry.IsReduced`.

**Checks and worked examples.**

- A regular X has F(X) = the empty sequence; for X the spectrum of the cusp k⟦x, y⟧/(y² − x³) the sequence blows up the closed point once.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §1.2, Theorem 1.2.1 and Remark 1.2.2, p. 3. States the strong non-embedded functorial desingularization of noetherian quasi-excellent generically reduced schemes over Q and how to treat non-reduced schemes.
- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §§1.3, 3–4, pp. 3–31. Overview and proof: extension of the variety algorithm to formal varieties and schemes with small singular locus by algebraization, induction on codimension, and the main construction.

### Functorial resolution of singularities of rigid spaces

**Target `AdicSpacesPartIIPartII:RZ.5/rigid-resolution` (theorem).** Let K have characteristic 0 and X be a rigid space over K whose non-reduced locus is nowhere dense (for instance X reduced). There is a countable blow-up hypersequence of rigid blow-ups with regular (smooth) centres, locally finite over X and stabilising over every quasi-compact open, with limit π : X_∞ → X, such that X_∞ is smooth over K, every centre lies over Sing(X) and is disjoint from the preimage of Reg(X), and π is a proper morphism which is an isomorphism over Reg(X) = X^sm. The construction is functorial for smooth morphisms X′ → X (the hypersequence of X′ is the pullback with empty blow-ups removed) and compatible with complete extensions of K. For quasi-compact X the hypersequence is a finite blow-up sequence.

**Named signature.** `TauCeti.Rigid.resolution`.

**Planet.** Resolution of singularities of rigid spaces.

**Hypotheses and conventions.**

- Rigid spaces in Temkin's sense (Tate's), here read through Huber's functor on quasi-separated spaces and glued on general ones; regular morphisms in the rigid category are smooth morphisms.
- Nowhere dense non-reduced locus: Temkin's category C. For arbitrary X apply the theorem to X_red (see AdicSpacesPartIIPartII:RZ.5/resolution-consequences).

**Construction or proof.**

1. Quasi-compact case (Temkin Theorem 5.2.2): cover X by finitely many affinoids X_i = Spa(A_i) and the pairwise intersections by affinoids X_ijk; A_i, A_ijk are excellent and A_i → A_ijk are regular (AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular).
2. Apply F (AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe) to Spec A_i (generically reduced, quasi-excellent) and analytify the centres to get rigid blow-up sequences of the X_i (AdicSpacesPartIIPartII:RZ.5/rigid-blow-up); by functoriality for the regular maps A_i → A_ijk they agree on overlaps and glue, disjoint unions synchronising the order of blow-ups (Temkin Lemmas 2.3.1, 2.3.3).
3. Regularity transfers: X_n is regular at classical points iff the algebraic X_n is regular at closed points (same completions), and regular = smooth in characteristic 0 (AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular).
4. Non-compact case (Temkin Theorem 5.3.2): saturate with empty blow-ups indexed by the countable set of invariants; the hypersequences of the affinoid charts agree on overlaps and glue to a countable blow-up hypersequence whose limit X_∞ → X is a single proper morphism.
5. Functoriality for smooth X′ → X: affinoid charts of X′ map by smooth, hence regular, ring maps to those of X (AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular).
6. Ground-field-extension compatibility is a separate assertion of Temkin Theorem 5.2.2, p. 33. A derivation from the scheme functor requires regularity of the completed affinoid scalar-extension map in characteristic zero; flatness alone does not suffice. G3 records this proof input.

**Inputs.** `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe`, `AdicSpacesPartIIPartII:RZ.5/rigid-blow-up`, `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular`, `AdicSpacesPartIIPartII:RZ.5/blow-up-sequence`, `AdicSpacesPartIIPartII:RZ.2/singular-locus`, `AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular`, `AdicSpacesPartII:R1/rigid-local-ring-completion`, `AdicSpacesPartII:R1/rigid-adic-comparison-functor`.

**Checks and worked examples.**

- The resolution of the cuspidal disc is its normalization by one blow-up of the cusp; the resolution of a smooth space is the identity.

**Sources.**

- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §5.2, Theorem 5.2.2 and its proof, pp. 32–33. For quasi-compact rigid spaces over a nontrivially valued complete field of characteristic 0 with nowhere dense non-reduced locus, the scheme desingularization induces a strong functorial desingularization by rigid blow-up sequences, compatible with ground field extensions; regular morphisms are smooth ones.
- Michael Temkin, *Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case*, §5.3, Remark 5.3.1 and Theorem 5.3.2, pp. 33–34. Extends to non-compact rigid spaces by countable blow-up hypersequences with regular maximal element, giving a functorial desingularization by a single proper morphism.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5.3, p. 35; §9.3, p. 60. Uses a resolution of singularities S̃ → S of a seminormal rigid variety (citing Temkin Theorem 5.3.2) and a desingularization of an irreducible Z.

### Properties of the resolution used by Howe–Klevdal

**Target `AdicSpacesPartIIPartII:RZ.5/resolution-consequences` (theorem).** Let L be a complete nonarchimedean field over Q_p and S a reduced rigid space over L with resolution π : S̃ → S (AdicSpacesPartIIPartII:RZ.5/rigid-resolution). Then: (i) π is proper and surjective, S̃ is smooth, and π restricts to an isomorphism π^{-1}(S^sm) ≅ S^sm onto the dense Zariski open S^sm, with π^{-1}(S^sm) dense Zariski open in S̃; (ii) π^♢ : S̃^♢ → S^♢ is a surjection of v-sheaves (a v-cover); (iii) for every rigid space T, T^♢ = (T_red)^♢, so T_red's resolution serves for T, for instance for T = S̃ ×_S S̃, and (S̃ ×_S S̃)^♢ = S̃^♢ ×_{S^♢} S̃^♢; (iv) if S is irreducible then S̃ is connected (and irreducible).

**Named signature.** `TauCeti.Rigid.resolution_properties`.

**Hypotheses and conventions.**

- S reduced, so its non-reduced locus is empty and Temkin's theorem applies; L of characteristic 0 (over Q_p).

**Construction or proof.**

1. (i) Surjectivity: π is an isomorphism over the dense S^sm (AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular, RZ.2/singular-locus) and proper, so its image is closed (Zariski closed, AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed) and contains a dense set, hence is everything. Density of π^{-1}(S^sm): its complement is contained in the union of the exceptional divisors, nowhere dense Cartier divisors (AdicSpacesPartIIPartII:RZ.5/rigid-blow-up).
2. (ii) |S̃^♢| → |S^♢| is |π|, surjective (DiamondsAndVStacks:D6/etale-site-comparison), and π^♢ is quasi-compact because π is; a quasi-compact map of v-sheaves surjective on spaces is a v-surjection (DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks).
3. (iii) A map from a perfectoid space to T factors uniquely through T_red because perfectoid spaces are uniform (reduced); fibre products of rigid spaces go to fibre products of diamonds (DiamondsAndVStacks:D6/gluing-and-the-diamond-functor).
4. (iv) S irreducible ⇒ S^sm ≅ π^{-1}(S^sm) is a dense Zariski open of S, hence irreducible and connected (AdicSpacesPartIIPartII:RZ.1/dense-open-connected); it is dense in |S̃| by (i), and the closure of a connected set is connected; S̃ smooth and connected is irreducible.

**Inputs.** `AdicSpacesPartIIPartII:RZ.5/rigid-resolution`, `AdicSpacesPartIIPartII:RZ.5/rigid-blow-up`, `AdicSpacesPartIIPartII:RZ.2/smooth-iff-regular`, `AdicSpacesPartIIPartII:RZ.2/singular-locus`, `AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed`, `AdicSpacesPartIIPartII:RZ.1/dense-open-connected`, `AdicSpacesPartIIPartII:RZ.1/connected-components`, `DiamondsAndVStacks:D6/etale-site-comparison`, `DiamondsAndVStacks:D4/spaces-and-surjectivity-for-small-v-stacks`, `DiamondsAndVStacks:D6/gluing-and-the-diamond-functor`.

**Checks and worked examples.**

- For S the cuspidal disc, S̃ is the disc, π is bijective, and π^♢ is an isomorphism because S^♢ only sees the seminormalization.
- For S = Spa(K⟨X,Y⟩/(XY)) (reducible), S̃ is two discs: not connected, as (iv) allows.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §5.3, proof of Theorem 5.0.4(4), p. 35. Takes a resolution S̃ → S, uses that S̃ contains a dense open isomorphic to S^sm, that S̃^♢ → S^♢ is a v-cover, and resolves S̃ ×_S S̃ to compare the two pullbacks.
- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, §9.3, sentence before Lemma 9.3.5, p. 60. Deduces Lemma 9.3.1 from Lemma 9.3.5 by taking a desingularization of Z, connected because Z is irreducible.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- G3: scheme-level functorial resolution proof dependencies; G1 for connectedness.

## RZ.6 — Classical points as analytic manifolds and the constant rank theorem

Targets:

- **Analytic manifold structure**: for V smooth of pure dimension m over a complete field E and E′ a finite extension of E or a complete algebraically closed extension, V(E′) is an E′-analytic manifold of dimension m (Mathlib's `IsManifold` with smoothness ω over the model space E′^m), morphisms induce analytic maps, and the tangent space of the manifold at x is the Zariski tangent space of V_{E′} at x (Howe–Klevdal II, §9.2, p. 58).
- **The analytic inverse function theorem** over complete nontrivially valued fields, for power series (Schneider, *p-Adic Lie Groups*, Proposition 5.9) and on manifolds (Proposition 9.3), and its rigid form: a smooth rigid space at an E′-rational point has a neighbourhood basis of polydiscs.
- **The constant rank theorem in characteristic zero** (Schneider, §§5–6, with the coordinate proof stated in the reader; used by Howe–Klevdal II, p. 58): an analytic map of constant rank k is, in suitable charts, (x_1, …, x_m) ↦ (x_1, …, x_k, 0, …, 0).
- **Submersions from smooth morphisms**: a smooth morphism of smooth rigid spaces induces submersions on E′-points; orbit maps of G(C) on homogeneous spaces G/H are submersions.
- **Identity theorem across a subfield**: for E ⊆ C complete fields of characteristic 0, an analytic function on a neighbourhood of 0 in C^m that vanishes on a neighbourhood of 0 in E^m vanishes near 0; hence an analytic function near 1 in G(C) vanishing on an open subgroup of G(E) vanishes near 1.

### The analytic inverse function theorem over complete fields

**Target `AdicSpacesPartIIPartII:RZ.6/analytic-inverse-function-theorem` (theorem).** Let F be a complete nontrivially normed field, E, E′ finite-dimensional normed F-spaces, U ⊆ E open and f : U → E′ analytic (locally given by convergent power series) with df_a : E → E′ bijective at a ∈ U. Then there are open neighbourhoods W ∋ a and W′ ∋ f(a) such that f restricts to a homeomorphism W → W′ whose inverse is analytic. If f is given on the polydisc of radius ε by power series with coefficients in F, the inverse is given by power series on a polydisc of explicit radius δ (Schneider Proposition 5.9). The same holds for analytic maps of F-analytic manifolds (Schneider Proposition 9.3).

**Named signature.** `TauCeti.AnalyticAt.exists_openPartialHomeomorph`.

**Hypotheses and conventions.**

- F need not be locally compact or of characteristic 0; analytic means AnalyticAt at every point (Mathlib), which for F nonarchimedean is Schneider's 'locally analytic'.

**Construction or proof.**

1. An analytic map has a strict derivative (Mathlib AnalyticAt.hasStrictFDerivAt); since E is complete and df_a invertible, HasStrictFDerivAt.toOpenPartialHomeomorph gives a local homeomorphism.
2. Its inverse has a power series expansion at f(a) given by the left inverse of the power series of f (Mathlib OpenPartialHomeomorph.hasFPowerSeriesAt_symm); applying this at every point of W gives analyticity of the inverse on W′.
3. Manifold version: compose with charts (Schneider Proposition 9.3).

**Inputs.** `mathlib:AnalyticAt.hasStrictFDerivAt`, `mathlib:HasStrictFDerivAt.toOpenPartialHomeomorph`, `mathlib:OpenPartialHomeomorph.hasFPowerSeriesAt_symm`, `mathlib:OpenPartialHomeomorph`, `mathlib:AnalyticAt`, `mathlib:IsManifold`.

**Checks and worked examples.**

- f(x) = x + x² on Q_p is an analytic isomorphism near 0 with inverse given by a power series converging on |y| < 1.
- f(x) = x^p on Z_p has df_0 = 0; it is not a local isomorphism at 0.

**Sources.**

- Peter Schneider, *p-Adic Lie Groups*, §5, Proposition 5.9, p. 33. For a power series f in r variables over a complete nonarchimedean field with f(0) = 0 and bijective derivative at 0, there is a unique power series inverse on an explicitly smaller polydisc.
- Peter Schneider, *p-Adic Lie Groups*, §6, Proposition 6.4, p. 42, and §9, Proposition 9.3, p. 58. Local invertibility of locally analytic maps of open subsets of K^r and of manifolds with bijective tangent map.

### The constant rank theorem for analytic maps

**Target `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem` (theorem).** Let F be a complete nontrivially normed field of characteristic 0, M and N analytic manifolds over F of dimensions m and n (Mathlib ChartedSpace with IsManifold over the model space F^m, smoothness ω), and f : M → N an analytic map such that the rank of the tangent map T_x f is equal to k for all x in a neighbourhood of a. Then there are analytic charts φ around a and ψ around f(a) such that ψ ∘ f ∘ φ^{-1}(x_1, …, x_m) = (x_1, …, x_k, 0, …, 0) near φ(a). In particular f is locally a submersion onto a k-dimensional submanifold; if k = n, f is open near a.

**Named signature.** `TauCeti.AnalyticAt.exists_charts_constantRank`.

**Planet.** Constant rank theorem.

**Hypotheses and conventions.**

- Constant rank on a neighbourhood is essential; maximal rank at a point gives it on a neighbourhood only when the rank is m or n.
- Characteristic 0 is essential: in characteristic p the map x ↦ x^p has constant rank 0 without being locally constant.
- For rigid-space applications F is nonarchimedean. The suggested model-space statement uses Mathlib’s general complete nontrivially normed field; its coordinate proof uses the existing analytic inverse theorem and uniqueness of convergent power series. Serre is a secondary locator in HK2, not an independently inspected source.

**Construction or proof.**

1. Reduce to model spaces: f : U ⊆ F^m → F^n analytic, a = 0, f(0) = 0, df_0 of rank k; after linear changes of coordinates df_0 = [I_k 0; 0 0].
2. Put g(x) = (f_1(x), …, f_k(x), x_{k+1}, …, x_m); dg_0 is invertible, so g is a local analytic isomorphism (AdicSpacesPartIIPartII:RZ.6/analytic-inverse-function-theorem), and f ∘ g^{-1}(y) = (y_1, …, y_k, h(y)).
3. Constant rank k forces ∂h/∂y_j = 0 for j > k near 0, so h depends only on (y_1, …, y_k) on a polydisc (in characteristic 0, a power series whose partial derivatives in y_{k+1}, …, y_m vanish on a polydisc does not involve those variables, by the identity theorem for power series, Schneider Corollary 5.8).
4. Then ψ(z) = (z_1, …, z_k, z_{k+1} − h_{k+1}(z_1, …, z_k), …) is a local analytic isomorphism of F^n with ψ ∘ f ∘ g^{-1} = (y_1, …, y_k, 0, …, 0).
5. This is Serre's theorem on subimmersions (Lie algebras and Lie groups, Part II, Chapter III), cited by Howe–Klevdal; Serre was not read here.

**Inputs.** `AdicSpacesPartIIPartII:RZ.6/analytic-inverse-function-theorem`, `mathlib:IsManifold`, `mathlib:ChartedSpace`, `mathlib:modelWithCornersSelf`, `mathlib:mfderiv`, `mathlib:Module.finrank`, `mathlib:LinearMap.range`.

**Checks and worked examples.**

- f(x, y) = (x, 0) on F² has constant rank 1 and is already in normal form; f(x) = x² on F has rank 1 off 0 and rank 0 at 0, so the theorem applies on F − {0} but not at 0.
- Over a field of characteristic p the conclusion fails for x ↦ x^p, which has constant rank 0.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Applies the constant rank theorem (Serre, Lie algebras and Lie groups, theorem on subimmersions, p. 86) to f_C : V(C) → Fl(C) to find charts in which f_C is a coordinate projection followed by inclusion.
- Peter Schneider, *p-Adic Lie Groups*, §5, Corollary 5.8 and Proposition 5.9, p. 33; §9, Proposition 9.3, p. 58. Identity theorem for power series and local invertibility, from which the constant rank normal form follows.

### Polydisc neighbourhoods of rational points of smooth rigid spaces

**Target `AdicSpacesPartIIPartII:RZ.6/rigid-inverse-function-theorem` (theorem).** Let F be a complete nontrivially nonarchimedean normed field and V a rigid space over F, smooth of dimension m at an F-rational point x. Then x has a basis of open neighbourhoods in |V| each isomorphic, as a rigid space, to a closed polydisc of dimension m and radius in |F^×|, centred at x. More generally, a morphism f : V → W of smooth rigid spaces with df_x bijective at an F-rational x restricts to an isomorphism of polydisc neighbourhoods of x and f(x).

**Named signature.** `TauCeti.Rigid.exists_polydisc_nhds_basis`.

**Hypotheses and conventions.**

- x is F-rational: k(x) = F. For non-rational classical points pass to V_{k(x)}.
- F is nonarchimedean. Polydisc neighbourhood means an admissible open isomorphic to a closed polydisc; its embedding in the original ambient coordinates need not be a standard round disc.

**Construction or proof.**

1. Near x, V is étale over a polydisc (AdicSpacesPartII:R0/smooth-local-structure); locally V is a closed subspace of a polydisc D^{m+r} cut out by r functions h_1, …, h_r whose differentials together with dT_1, …, dT_m form a basis (AdicSpacesPartII:R0/jacobian-criterion-closed-subspace).
2. Apply the convergent power-series inverse theorem to (T,h) at the rational point. Choose a target closed polydisc strictly inside the convergence neighbourhood of the inverse series. The inverse series and the original map then define inverse rigid morphisms between this target and its image neighbourhood. This image is an affinoid open isomorphic to a polydisc, but need not be a standard-radius ambient polydisc.
3. In these coordinates V is {h = 0} = the polydisc of radius δ in the first m coordinates; shrinking δ gives the basis (polydiscs of radii |c|^k form a neighbourhood basis of the rational point 0, AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology).
4. The relative statement follows by applying this to the graph of f.

**Inputs.** `AdicSpacesPartIIPartII:RZ.6/analytic-inverse-function-theorem`, `AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology`, `AdicSpacesPartII:R0/smooth-local-structure`, `AdicSpacesPartII:R0/jacobian-criterion-closed-subspace`, `AdicSpacesPartII:R0/smooth-morphism`.

**Checks and worked examples.**

- For V = G_m^an and x = 1, the discs {|T − 1| ≤ |c|} are neighbourhoods isomorphic to closed discs; for the cusp at the origin no neighbourhood is a disc (not smooth there).

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Lemma 9.3.5, p. 60. Uses that an L′-point x of the smooth S_{L′} has a neighbourhood basis of n-dimensional discs over L′.
- Peter Schneider, *p-Adic Lie Groups*, §5, Proposition 5.9, p. 33. Power series inverse function theorem with explicit radius.

### The analytic manifold of rational points of a smooth rigid space

**Target `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points` (construction).** Let F be a complete nontrivially nonarchimedean normed field and V a rigid space over F, smooth of pure dimension m. The set V(F) of F-rational points, with the subspace topology from |V|, carries a unique structure of F-analytic manifold of dimension m (Mathlib ChartedSpace (Fin m → F) with IsManifold 𝓘(F, Fin m → F) ω) whose charts are the coordinate maps of the polydisc neighbourhoods of AdicSpacesPartIIPartII:RZ.6/rigid-inverse-function-theorem. A morphism f : V → W of smooth rigid spaces induces an analytic map f_F : V(F) → W(F) with tangent map T_x f_F = df_x on Zariski tangent spaces (T_x(V(F)) = T_x V). For E a complete field, V smooth over E and E′/E a finite extension or a complete algebraically closed extension (such as the completion C of an algebraic closure), V(E′) := V_{E′}(E′) is an E′-analytic manifold of dimension m; for E′ = E finite over Q_p this is Serre's p-adic manifold.

**Named signature.** `TauCeti.Rigid.rationalPoints`.

**Planet.** Analytic manifold of rational points.

**Hypotheses and conventions.**

- Pure dimension m; for V of varying dimension the construction is done on each connected component.
- Mathlib IsManifold does not imply Hausdorffness or second countability. If V is separated then V(F) is Hausdorff and fits Schneider’s convention; no global Hausdorff claim is made for a general smooth nonseparated V.

**Construction or proof.**

1. Charts: polydisc neighbourhoods U ≅ D^m(δ) of rational points give bijections U(F) ≅ (radius-δ ball in F^m), homeomorphisms by AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology.
2. Transition maps between two such charts are given by restricted power series, hence analytic (Mathlib AnalyticOnNhd); so the atlas is in the analytic groupoid.
3. Morphisms: in charts f is given by power series, so f_F is analytic; its derivative at x is the Jacobian, i.e. df_x (AdicSpacesPartIIPartII:RZ.2/tangent-space).
4. Uniqueness: any two atlases built from polydisc neighbourhoods are compatible by the same argument.
5. Base change to E′ uses V_{E′} = V ×_E Spa E′ (smooth of the same dimension, AdicSpacesPartII:R0/smooth-etale-base-change).

**Inputs.** `AdicSpacesPartIIPartII:RZ.6/rigid-inverse-function-theorem`, `AdicSpacesPartIIPartII:RZ.3/polydisc-points-topology`, `AdicSpacesPartIIPartII:RZ.2/tangent-space`, `AdicSpacesPartIIPartII:RZ.3/classical-point`, `AdicSpacesPartII:R0/smooth-etale-base-change`, `mathlib:ChartedSpace`, `mathlib:IsManifold`, `mathlib:modelWithCornersSelf`, `mathlib:AnalyticOnNhd`, `mathlib:TangentSpace`.

**API.**

- `TauCeti.Rigid.rationalPoints.chartedSpace` (instance): ChartedSpace (Fin m → F) V(F) with charts from polydisc neighbourhoods.
- `TauCeti.Rigid.rationalPoints.isManifold` (instance): IsManifold 𝓘(F, Fin m → F) ω V(F): transition maps are analytic.
- `TauCeti.Rigid.rationalPoints.map` (functoriality): A morphism f : V → W of smooth rigid spaces gives an analytic map f_F, with (g ∘ f)_F = g_F ∘ f_F and id_F = id.
- `TauCeti.Rigid.rationalPoints.mfderiv` (compatibility): mfderiv of f_F at x is df_x on Zariski tangent spaces T_x V → T_{f(x)} W.
- `TauCeti.Rigid.rationalPoints.topology` (compatibility): The manifold topology on V(F) is the subspace topology from |V|.
- `TauCeti.Rigid.rationalPoints.baseChange` (functoriality): For any complete F′/F, rational-point inclusion V(F) → V_{F′}(F′) is continuous and compatible with charts defined over F. Only when [F′:F] is finite do we assert that restriction of scalars gives an F-manifold of dimension m[F′:F], with V(F) an F-analytic submanifold of dimension m. No finite-dimensional F-manifold is asserted for an infinite extension.
- `TauCeti.Rigid.rationalPoints.analytification` (compatibility): For X smooth of finite type over F, (X^an)(F) = X(F) with the analytic manifold structure of the F-points of a smooth variety.

**Unit tests.**

- `rationalPoints_disc` (computation): For V the closed unit disc over Q_p, V(Q_p) is Z_p with the identity chart, a 1-dimensional Q_p-manifold.
- `rationalPoints_point` (degenerate): For V = Spa F, V(F) is a single point, a manifold of dimension 0; for V = ∅ it is empty.
- `rationalPoints_Gm` (compatibility): For V = (G_m)^an, V(F) = F^× as an open submanifold of F, and the group law is analytic, agreeing with Mathlib's manifold structure on an open subset of a normed field.
- `rationalPoints_dim_over_subfield` (non-example): For V the disc over Q_p and E′ = Q_p(√p), V(E′) = O_{E′} is a 1-dimensional E′-manifold, of dimension 2 as a Q_p-manifold: a construction recording dimension over the base field E rather than over E′ fails.
- `rationalPoints_infinite_scalar_extension` (non-example): For the disc over Q_p and F′ = C_p, the C_p-manifold of C_p-points has dimension one over C_p. Its model C_p is infinite-dimensional over Q_p, so restriction of scalars must not be assigned any finite Q_p-manifold dimension.

**Uses.**

- Howe–Klevdal II, proof of Theorem 9.1.3, p. 58 (AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem): f_C : V(C) → Fl(C) is an analytic map of manifolds to which the constant rank theorem applies
- Howe–Klevdal II, proof of Theorem 9.1.3, p. 58 (AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem): G(Q_p) ⊆ G(C) and functions near 1
- Howe–Klevdal II, proof of Lemma 9.3.5, p. 60: Baire category on D^n(L′) ⊆ S(L′)

**Checks and worked examples.**

- V = D^1 over Q_p: V(Q_p) = Z_p as an open subset of Q_p; V = G_m^an: V(F) = F^× with its analytic structure.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Considers V(C) and Fl(C) as p-adic analytic manifolds in Serre's sense and uses that the manifold derivative of f_C is the restriction of df.
- Peter Schneider, *p-Adic Lie Groups*, §§7–9, pp. 45–61. Charts, atlases, manifolds over a complete nonarchimedean field, tangent spaces and tangent maps.

### Smooth morphisms give submersions; orbit maps are submersions

**Target `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion` (theorem).** Let F be a complete nontrivially nonarchimedean normed field of characteristic 0 and f : V → W a smooth morphism of smooth rigid spaces over F. Then f_F : V(F) → W(F) is a submersion: T_x f_F is surjective for all x ∈ V(F), so f_F is open and locally a projection in charts. In particular, if G is a smooth linear algebraic group over a subfield E ⊆ F, H ⊆ G a closed subgroup and y ∈ (G/H)(F), the orbit map G(F) → (G/H)(F), g ↦ g·y, is a submersion at every point.

**Named signature.** `TauCeti.Rigid.Smooth.isSubmersion_rationalPoints`.

**Hypotheses and conventions.**

- Smoothness of the quotient map G → G/H for a smooth closed subgroup H in characteristic 0 (H is smooth by Cartier's theorem) comes from the Tau Ceti roadmap ReductiveGroups, Layer 3 (quotients G/H as fppf sheaves, representable, with G → G/H an H-torsor).

**Construction or proof.**

1. Smooth f: df_x is surjective at rational x by the differential criterion (AdicSpacesPartII:R0/differential-criterion-morphism: f^*Ω_W → Ω_V split injective near x), so T_x f_F = df_x is surjective (AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points).
2. Constant rank n = dim W on V(F), so the constant rank theorem gives a projection in charts (AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem).
3. For y ∈ (G/H)(F), choose a faithfully flat field extension F′/F over which y lifts to g_0 ∈ G(F′). After this extension the algebraic orbit morphism is the quotient G_{F′} → (G/H)_{F′} composed with right translation by g_0. In characteristic zero H is smooth, so this is a smooth H-torsor. Smoothness descends to F; analytify and apply the first part. Surjectivity on F-points of G → G/H is not assumed.

**Inputs.** `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`, `AdicSpacesPartIIPartII:RZ.6/constant-rank-theorem`, `AdicSpacesPartII:R0/differential-criterion-morphism`, `AdicSpacesPartII:R1/analytification-etale-smooth`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

**Checks and worked examples.**

- For G = GL_2 acting on P¹ = GL_2/B, the orbit map of ∞ is a submersion GL_2(F) → P¹(F).

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Uses that the orbit map of G(C) through f(y) on the flag variety is a submersion, to propagate the vanishing of a coordinate function from K_0 to a neighbourhood of f(y).

### Identity theorem across a closed subfield

**Target `AdicSpacesPartIIPartII:RZ.6/subfield-identity-theorem` (theorem).** Let E ⊆ C be complete nontrivially normed fields of characteristic 0 with E closed in C and the norm on E the restriction of that of C. If φ is analytic on a neighbourhood of 0 in C^m and vanishes on a neighbourhood of 0 in E^m, then φ vanishes on a neighbourhood of 0 in C^m. Consequently, if G is a smooth algebraic group over E, K_0 ≤ G(E) an open subgroup and φ an analytic function on a neighbourhood of 1 in G(C) vanishing on K_0, then φ vanishes on a neighbourhood of 1 in G(C).

**Named signature.** `TauCeti.AnalyticAt.eventually_eq_zero_of_restrict`.

**Hypotheses and conventions.**

- Characteristic 0 for Schneider's identity theorem (Corollary 5.8); it holds without that hypothesis by Bosch–Güntzer–Remmert 5.1.4, not used here.

**Construction or proof.**

1. Expand φ(z) = Σ_α c_α z^α with c_α ∈ C on a polydisc of radius ε ∈ |E^×|. Its restriction to E^m is a power series in m variables over E with coefficients in the E-Banach space C, converging on the E-polydisc of radius ε.
2. That restriction vanishes on a neighbourhood of 0, hence (Schneider, Corollary 5.8, applied to power series with values in an E-Banach space, after rescaling to the neighbourhood) all c_α = 0, so φ = 0 near 0 in C^m.
3. For G: choose a chart of G(E) at 1 coming from a polydisc neighbourhood of 1 in G^an defined over E (AdicSpacesPartIIPartII:RZ.6/rigid-inverse-function-theorem); after base change it is a chart of G(C) at 1 (AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points, compatibility with base change) in which G(E) near 1 is E^m ∩ (ball) ⊆ C^m and K_0 contains an E-ball.

**Inputs.** `AdicSpacesPartIIPartII:RZ.6/manifold-of-classical-points`, `AdicSpacesPartIIPartII:RZ.6/rigid-inverse-function-theorem`, `mathlib:HasFPowerSeriesOnBall`, `mathlib:NormedAlgebra`.

**Checks and worked examples.**

- For E = Q_p, C = C_p and m = 1, a power series Σ c_n z^n with c_n ∈ C_p that vanishes on p^k Z_p has all c_n = 0.
- z ↦ z(z − a) with a ∈ C − E vanishes at the E-point 0 but on no E-neighbourhood of 0: vanishing on an open set of E-points is needed.

**Sources.**

- Sean Howe and Christian Klevdal, *Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem*, Proof of Theorem 9.1.3, p. 58. Uses that any analytic function vanishing on the open subgroup K_0 ≤ G(Q_p) vanishes on a neighbourhood of the identity in G(C).
- Peter Schneider, *p-Adic Lie Groups*, §5, Corollary 5.8 and the remark after it, p. 33. A nonzero power series with values in a Banach space over a complete field of characteristic 0 does not vanish identically on its polydisc of convergence; the characteristic hypothesis can be removed by another method.

**Coverage.** planned. This records a target-level plan, not a closed proof development.

**Remaining proof or supplier work.**

- The precise smooth quotient/torsor request to ReductiveGroups remains open for the orbit-map application.

## Exact supplier contracts

- **`tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.** For a smooth affine algebraic group G over a field of characteristic 0 and a closed subgroup H whose fppf quotient G/H is representable (for instance H parabolic, G/H projective), the quotient morphism G → G/H is smooth and surjective, an H-torsor; used to see orbit maps G(F) → (G/H)(F) as analytic submersions. Used by `AdicSpacesPartIIPartII:RZ.6/smooth-morphism-submersion`.

- **`AdicSpacesPartII:F1`.** Excellence (and hence finiteness of normalization and geometrically regular formal fibres) of every K-affinoid algebra over any complete nontrivially nonarchimedean rank-one K, including imperfect characteristic p. The existing F1/dagger-algebra-excellent node assumes char K = 0. Conrad 1999 §1.1, pp. 3–6 recalls Kiehl’s all-characteristic result. This requests the missing ordinary-affinoid generality, not a characteristic-p dagger theorem. Used by `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.2/singular-locus`.

- **`AdicSpacesPartII:R2`.** For a quasi-separated quasi-paracompact rigid X and a specified affinoid open W, after admissible blow-up of a formal model of X, realize a suitable affinoid neighbourhood of a point of W as the generic fibre of a formal open, compatibly with reduction. This is the formal-model localization input of BH22 Proposition 2.9, citing Bosch Lectures Theorem 8.4.3. Used by `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion`.

## Proof and source boundaries

- **G1: original proof of the arbitrary-field Riemann extension theorem.** Conrad 2010 Theorem 2.1.1, p. 4 has now been read and supplies the exact statement over arbitrary K. Its original Bartenwerfer proof (§3 of the reference cited there) has not been read or decomposed. Read that proof and close this theorem node. Do not restore the invalid argument that connectedness survives completed algebraic closure. Consumers: `AdicSpacesPartIIPartII:RZ.1/riemann-extension`, `AdicSpacesPartIIPartII:RZ.1/dense-open-connected`.

- **G3: scheme-level functorial desingularization at target level only.** AlgebraicModuliForArithmeticGeometry R09.7 plans Bierstone–Milman for varieties, compatible with local isomorphisms only. Compatibility with smooth and regular morphisms (Bierstone–Milman 2008, Bierstone–Milman–Temkin 2011) and Temkin's extension to quasi-excellent schemes (§§3–4, using Gabber–Ramero algebraization and Nishimura–Nishimura) are stated here as two theorem nodes with proof sketches; their decomposition belongs to a Part II of AlgebraicModuliForArithmeticGeometry (see restructure). Also check regularity of completed affinoid scalar extension for ground-field compatibility in Theorem 5.2.2; flatness alone does not suffice. Consumers: `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-varieties`, `AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe`.

- **G4: all-characteristic affinoid excellence supplier.** Request Q1: the existing parent F1/dagger-algebra-excellent is characteristic zero only. Conrad 1999 §1.1 recalls the all-characteristic affinoid result, including Kiehl’s imperfect-characteristic-p theorem; the original Kiehl proof has not been read. Characteristic-zero uses already have a matching supplier. Consumers: `AdicSpacesPartIIPartII:RZ.0/affinoid-localization-regular`, `AdicSpacesPartIIPartII:RZ.1/rigid-normalization`, `AdicSpacesPartIIPartII:RZ.2/singular-locus`.

- **G5: formal-model localization for the third weakly-Shilov characterization.** The rank-one residue-transcendence equivalence is checked against Poineau and G2 is closed. For the formal-model condition, BH22 Proposition 2.9 invokes Bosch Lectures Theorem 8.4.3 to realize a specified affinoid domain as a formal open after admissible blow-up. Raynaud equivalence by itself does not state that localization lemma; request it precisely from AdicSpacesPartII:R2 and check its proof. For the Banach Shilov-boundary comparison in BH22 Proposition 2.2, the exact statement is checked there but its invoked Berkovich Spectral theory Proposition 2.4.4 proof has not been independently read. Consumers: `AdicSpacesPartIIPartII:RZ.4/weakly-shilov-transcendence-criterion`, `AdicSpacesPartIIPartII:RZ.4/shilov-point-characterisation`.

## Source issue assessments

- **AdicSpacesPartIIPartII/E1 — rejected.** HK2, Proof of Lemma 9.3.5, p. 60 (arXiv v2). The step that a closed set containing a disc of L′-points contains its Gauss point is justified by Raynaud's description and the residue field being algebraically closed. Only an infinite residue field of L′ is needed (and holds: L′ is finite over L ⊇ Q̆_p, so its residue field contains F̄_p); the argument is the rational-neighbourhood computation of AdicSpacesPartIIPartII:RZ.3/gauss-point-in-closure. For a finite residue field the statement fails. Assessment: The rational-neighbourhood argument is valid in the paper’s setting. Infinite residue field suffices; weakening an assumption and making this standard argument explicit does not establish a source gap.

- **AdicSpacesPartIIPartII/E2 — confirmed.** HK2, Proof of Lemma 9.3.5, p. 60 (arXiv v2). Weakly Shilov points are referenced as Bhatt–Hansen, Definition 2.4. Bhatt–Hansen, Definition 2.5 (Definition 2.4 defines Shilov points of an affinoid); density is their Lemma 2.8. Assessment: HK2 p. 60 cites Definition 2.4 for weakly Shilov points; BH22 Definition 2.5, p. 7 is the matching definition.

- **AdicSpacesPartIIPartII/E3 — rejected.** HK2, §9.3, sentence before Lemma 9.3.5, p. 60 (arXiv v2). A desingularization of the irreducible Z is asserted to be connected because Z is irreducible, without argument. Connectedness follows from: the resolution is an isomorphism over the dense smooth locus Z^sm; a dense Zariski open subset of an irreducible rigid space is irreducible, hence connected (the arbitrary-field Riemann extension theorem applied on the connected normalization); and the preimage of Z^sm is dense in the resolution. See AdicSpacesPartIIPartII:RZ.1/dense-open-connected and RZ.5/resolution-consequences(iv). Assessment: Connectedness is a valid standard consequence of a resolution being an isomorphism over a dense irreducible smooth open with dense inverse image. The packet’s former base-change proof was wrong, but no counterexample to the paper’s assertion or inadequate source proof is established.

- **AdicSpacesPartIIPartII/E4 — rejected.** HK2, §5.3, proof of Theorem 5.0.4(4), p. 35 (arXiv v2). A resolution of singularities of S̃ ×_S S̃ is taken, citing Temkin's theorem. Temkin's theorem (Theorem 5.3.2) applies to rigid spaces whose non-reduced locus is nowhere dense; S̃ ×_S S̃ may have generically non-reduced components. Resolve (S̃ ×_S S̃)_red instead, which has the same diamond, since maps from perfectoid spaces factor through the reduction. Assessment: Taking a resolution of the reduction is the conventional interpretation needed here. The author supplies no example proving that the cited fibre product has a generically nonreduced component. Record reduction explicitly for the v-cover argument, without promoting a possible hypothesis issue into a verified paper error.

- **AdicSpacesPartIIPartII/E5 — confirmed.** CONRAD99, §2.2, paragraph after Definition 2.2.2, author p. 14; published p. 496. The paragraph identifies irreducibility of Spec of the analytic stalk with uniqueness of the global irreducible component through the point. Replace global components by components of sufficiently small admissible neighbourhoods, as in Conrad 2010 Lemma 2.1.3, pp. 4–5. Assessment: Checked the assertion in both copies and the nodal counterexample. Excluded the false assertion from the node’s source match.

- **AdicSpacesPartIIPartII/E6 — confirmed.** BH22, §2.1, proof of Proposition 2.2, (1) ⇒ (2), arXiv v2 p. 6. The local ring of the reduction Ã at a generic point is described as a rank-one valuation ring with t as pseudo-uniformizer. Use the localization of A° at the inverse-image prime, before reduction, and its separated t-adic completion as appropriate. Assessment: The PDF shows the reduction symbol. Its inconsistency with t and with condition (3) identifies the misprint.

## Ownership and supplier notes

- `AdicSpacesPartII:R1/rigid-analytification-connected`: The parent statement includes a component comparison. Import that comparison only after RZ.1 constructs global rigid components; it is not a prerequisite of normalization or of the component construction. The parent’s component formulation needs this ownership clarification.

- tauceti:TauCetiRoadmap/ReductiveGroups: Layer 3 treats G/H as an fppf sheaf quotient with representability as a theorem with hypotheses, but does not state that the quotient morphism G → G/H is smooth (an H-torsor) for smooth H. Rigid-analytic consumers (orbit maps on flag varieties as submersions) need that statement.

- Temkin's rigid resolution needs functorial desingularization of characteristic-zero varieties with respect to all regular morphisms and of noetherian quasi-excellent schemes over Q. AlgebraicModuliForArithmeticGeometry R09.7 states its scope as varieties with compatibility for local isomorphisms only and explicitly asserts no excellent-scheme resolution. No roadmap plans the scheme-level theorems. Create 'Algebraic moduli and representability for arithmetic geometry, Part II: functorial desingularization of quasi-excellent schemes' owning AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-varieties (Bierstone–Milman 2008, Bierstone–Milman–Temkin 2011) and AdicSpacesPartIIPartII:RZ.5/functorial-desingularization-qe (Temkin 2012 §§1–4), after R09.7. This roadmap keeps blow-up sequences of rigid spaces, regularity of affinoid localizations, the rigid resolution and its consequences, and imports the two scheme-level theorems from the new Part II once it exists.

- Howe–Klevdal II Definition 2.2.1(1) (rigid analytic points of a diamond) was routed with items 027 and 029 to the proposed roadmap on admissible pairs, but item 028 (Remark 2.2.2), routed here, needs it, and Lemma 2.2.3's proper-image input is general rigid geometry. The notion of a rigid analytic point (AdicSpacesPartIIPartII:RZ.3/rigid-analytic-point) and the Zariski-closedness of images of proper morphisms (AdicSpacesPartIIPartII:RZ.0/proper-image-zariski-closed) are owned here; AdmissiblePairsAndPadicHodgeStructures keeps rigid analytic diamonds and subdiamonds (Definition 2.2.1(2)–(3)) and Lemma 2.2.3, and imports these two nodes.

## Pinned library baseline

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following declarations are inputs; their surrounding hypotheses were read at these commits.

| Declaration | Module | What it supplies |
| --- | --- | --- |
| `mathlib:Algebra.trdeg` | `Mathlib/RingTheory/AlgebraicIndependent/Basic.lean` | Cardinal-valued transcendence degree; compare finite local dimension using the natural-number-to-cardinal coercion. |
| `mathlib:AlgebraicGeometry.IsReduced` | `Mathlib/AlgebraicGeometry/Properties.lean` | Reduced schemes |
| `mathlib:AlgebraicGeometry.Scheme` | `Mathlib/AlgebraicGeometry/Scheme.lean` | Schemes |
| `mathlib:AnalyticAt` | `Mathlib/Analysis/Analytic/Basic.lean` | Analyticity of a map at a point (local power series expansion) over a nontrivially normed field |
| `mathlib:AnalyticAt.hasStrictFDerivAt` | `Mathlib/Analysis/Calculus/FDeriv/Analytic.lean` | An analytic map has a strict Fréchet derivative |
| `mathlib:AnalyticOnNhd` | `Mathlib/Analysis/Analytic/Basic.lean` | Analyticity on a neighbourhood of every point of a set |
| `mathlib:BaireSpace` | `Mathlib/Topology/Defs/Basic.lean` | The Baire-space class itself; completeness implies this through BaireSpace.of_completelyPseudoMetrizable, a separate theorem. |
| `mathlib:ChartedSpace` | `Mathlib/Geometry/Manifold/ChartedSpace.lean` | Charted spaces modelled on a topological space |
| `mathlib:ConnectedComponents` | `Mathlib/Topology/Connected/Clopen.lean` | The space of connected components of a topological space |
| `mathlib:HasFPowerSeriesOnBall` | `Mathlib/Analysis/Analytic/Basic.lean` | A function given by a formal multilinear series on a ball |
| `mathlib:HasStrictFDerivAt.toOpenPartialHomeomorph` | `Mathlib/Analysis/Calculus/InverseFunctionTheorem/FDeriv.lean` | A strict derivative given by a continuous linear equivalence gives an open partial homeomorphism; the source model is a complete normed space. |
| `mathlib:Ideal.height` | `Mathlib/RingTheory/Ideal/Height.lean` | Ideal height in ℕ∞, defined through heights of prime ideals minimal over the ideal. |
| `mathlib:Ideal.radical` | `Mathlib/RingTheory/Ideal/Operations.lean` | Radical of an ideal |
| `mathlib:IsIntegrallyClosed` | `Mathlib/RingTheory/IntegralClosure/IntegrallyClosed.lean` | Integrally closed in the fraction ring; use together with IsDomain when saying normal domain. |
| `mathlib:IsLocalRing` | `Mathlib/RingTheory/LocalRing/Defs.lean` | Local rings |
| `mathlib:IsManifold` | `Mathlib/Geometry/Manifold/IsManifold/Basic.lean` | Manifolds of a given smoothness (ω = analytic) for a model with corners |
| `mathlib:IsPreconnected` | `Mathlib/Topology/Connected/Basic.lean` | Preconnected subsets of a topological space |
| `mathlib:IsReduced` | `Mathlib/Algebra/GroupWithZero/Basic.lean` | Reduced rings (no nonzero nilpotents) |
| `mathlib:IsRegularLocalRing` | `Mathlib/RingTheory/RegularLocalRing/Defs.lean` | Regular local rings |
| `mathlib:IsUltrametricDist` | `Mathlib/Topology/MetricSpace/Ultra/Basic.lean` | Ultrametric distance |
| `mathlib:LinearMap.range` | `Mathlib/Algebra/Module/Submodule/Range.lean` | Range of a linear map |
| `mathlib:Matrix.det` | `Mathlib/LinearAlgebra/Matrix/Determinant/Basic.lean` | Determinant of a square matrix |
| `mathlib:Matrix.rank` | `Mathlib/LinearAlgebra/Matrix/Rank.lean` | Natural-valued finrank of the range; the rank-locus argument uses matrices over fields. |
| `mathlib:MaximalSpectrum` | `Mathlib/RingTheory/Spectrum/Maximal/Defs.lean` | The maximal spectrum of a commutative ring |
| `mathlib:Module.Flat` | `Mathlib/RingTheory/Flat/Basic.lean` | Flat modules |
| `mathlib:Module.finrank` | `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | Natural-valued finite rank (Cardinal.toNat); dimension statements require finite-dimensionality. |
| `mathlib:MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean` | Multivariate polynomials |
| `mathlib:MvPolynomial.funext` | `Mathlib/Algebra/MvPolynomial/Funext.lean` | Over an infinite field a polynomial is determined by its values |
| `mathlib:MvPowerSeries.gaussNorm` | `Mathlib/RingTheory/MvPowerSeries/GaussNorm.lean` | Supremum defining the Gauss norm; multiplicativity and boundedness require further hypotheses and Tau Ceti results. |
| `mathlib:NormedAlgebra` | `Mathlib/Analysis/Normed/Module/Basic.lean` | Normed algebras over a normed field |
| `mathlib:OpenPartialHomeomorph` | `Mathlib/Topology/OpenPartialHomeomorph/Defs.lean` | Partial homeomorphisms with open source and target |
| `mathlib:OpenPartialHomeomorph.hasFPowerSeriesAt_symm` | `Mathlib/Analysis/Analytic/Inverse.lean` | Analytic inverse function theorem: the inverse of a local homeomorphism with a power series and invertible linear term has a power series |
| `mathlib:PrimeSpectrum` | `Mathlib/RingTheory/Spectrum/Prime/Defs.lean` | The prime spectrum of a commutative ring |
| `mathlib:TangentSpace` | `Mathlib/Geometry/Manifold/IsManifold/Basic.lean` | The model-fibre tangent-space carrier of a charted manifold; comparison with the algebraic tangent space is a target here. |
| `mathlib:Valuation` | `Mathlib/RingTheory/Valuation/Basic.lean` | Valuations on rings |
| `mathlib:ValuationSubring` | `Mathlib/RingTheory/Valuation/ValuationSubring.lean` | Valuation subrings of a field |
| `mathlib:mfderiv` | `Mathlib/Geometry/Manifold/MFDeriv/Defs.lean` | Derivative of a map between manifolds |
| `mathlib:minimalPrimes` | `Mathlib/RingTheory/Ideal/MinimalPrime/Basic.lean` | Minimal prime ideals of a ring |
| `mathlib:modelWithCornersSelf` | `Mathlib/Geometry/Manifold/IsManifold/Basic.lean` | The trivial model with corners of a normed space |
| `mathlib:ringKrullDim` | `Mathlib/RingTheory/KrullDimension/Basic.lean` | Krull dimension in WithBot ℕ∞; the zero ring has bottom dimension. Affinoid finiteness is an additional mathematical input. |
| `tauceti:TauCeti.Huber.powerBoundedSubring` | `TauCeti/RingTheory/Huber/PowerBounded.lean` | The subring of power-bounded elements of a Huber ring |
| `tauceti:TauCeti.Huber.topologicallyNilpotentIdeal` | `TauCeti/RingTheory/Huber/PowerBounded.lean` | The ideal of topologically nilpotent power-bounded elements |
| `tauceti:TauCeti.ValuationSpectrum.classicalPoint` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc.lean` | Evaluation point at a tuple of power-bounded base elements over a specified base Spa point; not a predicate classifying all classical points. |
| `tauceti:TauCeti.ValuationSpectrum.closedPolydisc` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Polydisc.lean` | The closed polydisc in a valuation spectrum |
| `tauceti:TauCeti.ValuationSpectrum.spa` | `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean` | Continuous valuations bounded on the specified plus ring, as a subset of a valuation spectrum; not a full adic-space carrier. |

## Current library and roadmap boundaries

No audit entry for this new roadmap. The reviewed entries distinguish existing scheme normalization/Rees algebras and polydisc points from absent rigid normalization, blow-ups, rigid spaces and analytic function spaces.

TauCeti.ValuationSpectrum.gaussPoint (one-variable centred discs, radii 0<r≤1), gaussPoint_vle_iff, supp_gaussPoint and gaussPoint_ne_classicalPoint in Spa/Polydisc/GaussPoint.lean. Import this construction; this roadmap adds closure/density results, not a replacement construction.

Current DifferentialGeometry supplies real smooth manifold results, not the nonarchimedean analytic constant-rank theorem. No current TauCetiRoadmap/RigidAnalyticGeometry directory exists; removed that claimed supplier. ReductiveGroups Layer 3 supplies quotients but the smooth torsor statement is requested explicitly.

Current Tau Ceti commit: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current TauCetiRoadmap commit: `0d144d044dacebca17b654695b6f1ad58f159b27`. These are read-only scope checks, distinct from the pinned elaboration baseline.

## Bibliography and inspected locations

- Sean Howe and Christian Klevdal, [Admissible pairs and p-adic Hodge structures II: the bi-analytic Ax-Lindemann theorem](https://arxiv.org/pdf/2308.11064v2), arXiv:2308.11064v2 (28 February 2025); published in Inventiones Mathematicae 244 (2026), 455–530, whose numbering differs; locators are arXiv v2. Inspected: §1.1, p. 5 (Zariski topology); §2.2, Definition 2.2.1, Remark 2.2.2, Lemma 2.2.3, pp. 15–16; §5.3, proof of Theorem 5.0.4(4), p. 35; §9.2, proof of Theorem 9.1.3, pp. 56–58; §9.3, Lemma 9.3.1 to Lemma 9.3.5 with proofs, pp. 58–60; References.

- Brian Conrad, [Irreducible components of rigid spaces](https://virtualmath1.stanford.edu/~conrad/papers/irredpaper.pdf), Annales de l'Institut Fourier 49 (1999), no. 2, 473–541; author's copy, whose page numbers are used. Inspected: Notation, p. 2; §1.1, excellence and Theorem 1.1.3 with proof, pp. 3–6; §1.2 Normality, pp. 7–9; §2.1 Basic constructions, pp. 9–13; §2.2 Irreducible components, pp. 13–16; §2.3, Theorem 2.3.1 and proof, pp. 16–17; §3.3, Lemma 3.3.1 with proof and the following paragraph, pp. 20–22.

- Bhargav Bhatt and David Hansen, [The six functors for Zariski-constructible sheaves in rigid geometry](https://arxiv.org/pdf/2101.09759v2), arXiv:2101.09759v2 (22 September 2021); published in Compositio Mathematica 158 (2022), 437–482. Inspected: §1, Definition 1.2 and Example 1.3, p. 2; §2.1 Shilov and weakly Shilov points, pp. 6–8 (Example 2.1 to Corollary 2.10); §2.2, Lemma 2.16, pp. 9–10.

- Michael Temkin, [Functorial desingularization of quasi-excellent schemes in characteristic zero: the nonembedded case](https://arxiv.org/pdf/0904.1592v2), arXiv:0904.1592v2 (11 December 2011); published in Duke Mathematical Journal 161 (2012), no. 11, 2207–2254. Inspected: §1.2 Main result, Theorem 1.2.1 and Remark 1.2.2, pp. 2–3; §1.3 Overview (skimmed); §2.2 Blow up sequences, pp. 10–11; §2.3 Desingularization, Lemmas 2.3.1, 2.3.3, Theorem 2.3.5, Remark 2.3.6, pp. 11–14; §5 Desingularization in other categories, Theorems 5.1.1, 5.2.2, 5.3.2, pp. 31–34; §§3–4 not read in detail.

- Peter Schneider, [p-Adic Lie Groups](https://doi.org/10.1007/978-3-642-21147-8), Grundlehren der mathematischen Wissenschaften 344, Springer, 2011 (the maintainer's cleared copy; printed page numbers). Inspected: §5, Corollary 5.8 and Proposition 5.9, p. 33; §6, Proposition 6.4, p. 42; §9, definitions of tangent spaces and tangent maps, Lemma 9.2, Proposition 9.3, Remark 9.4, pp. 56–59; §§7–8, charts, atlases and manifold definitions, pp. 45–50; Hausdorff convention on p. 47.

- Brian Conrad, [Moishezon spaces in rigid geometry](https://virtualmath1.stanford.edu/~conrad/papers/moish.pdf), Author version dated 1 August 2010; author-copy page numbers. Inspected: §2.1, Theorem 2.1.1 and Lemma 2.1.3 with proof, pp. 3–5.

- Jérôme Poineau, [Les espaces de Berkovich sont angéliques](https://www.numdam.org/article/BSMF_2013__141_2_267_0.pdf), Bulletin de la Société Mathématique de France 141 (2013), no. 2, 267–297; printed page numbers. Inspected: §4, Definition 4.1 and Lemma 4.4, pp. 283–284; §4, Remark 4.14 and Corollaries 4.15–4.18 with proofs, pp. 287–288.
