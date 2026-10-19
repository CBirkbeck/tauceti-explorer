# Roadmap: étale duality, cycle classes and perverse sheaves, Part II: Gabber's finiteness, affine Lefschetz and duality theorems on quasi-excellent schemes

**Summary.** This Part II extends Étale duality, cycle classes and perverse sheaves beyond schemes of finite type over a field or a one-dimensional base. Following Gabber's work as written in Illusie–Laszlo–Orgogozo, it plans the topology of ℓ′-alterations, the Cohen–Gabber theorem and partial algebraization, Gabber's weak and prime-to-ℓ local uniformization, oriented products and oriented cohomological descent, Gabber's finiteness theorem for quasi-excellent schemes, dimension functions, the affine Lefschetz theorem and the cohomological dimension bound, and dualizing complexes on excellent schemes with Gabber's duality theorem and local duality. It ends with the local results of Česnavičius–Scholze: local absolute purity, the Lefschetz hyperplane theorem in local étale cohomology, and the algebraic tilting of étale cohomology of henselian perfectoid pairs.

## Scope and ownership

This roadmap starts where EtaleDualityAndPerverseSheaves stops. That roadmap, and EtaleCohomologyFoundations beneath it, work with separated schemes of finite type over a field or over an excellent regular base of dimension at most one: finiteness for proper maps and for finite-type schemes over such bases (SGA 4½ [Th. finitude]), Artin vanishing for affine schemes of finite type over a separably closed field, and Verdier duality with the dualizing complex a^!Λ. Here the base is an arbitrary noetherian quasi-excellent (for duality, excellent) scheme. The new mathematics is Gabber's, as written in Illusie–Laszlo–Orgogozo (ILO): the topology of ℓ′-alterations and the reductions of uniformization to complete local rings (Layer EQ.0); the Cohen–Gabber theorem and partial algebraization (EQ.1); weak and prime-to-ℓ local uniformization (EQ.2); oriented products and oriented cohomological descent (EQ.3); the finiteness theorem (EQ.4); dimension functions, the affine Lefschetz theorem and the bound 2d − 1 on cohomological dimension (EQ.5); and dualizing complexes, biduality and local duality on excellent schemes (EQ.6). Layer EQ.7 states the local consequences proved by Česnavičius–Scholze (local absolute purity and the Lefschetz hyperplane theorem in local étale cohomology), and EQ.8 their algebraic tilting of étale cohomology of henselian perfectoid pairs.

**Imported, not planned here.**

- *Absolute cohomological purity* (Gabber's theorem, Riou's proof, ILO XVI 3.1.1) is LefschetzPencilsAndVanishingCycles §0.10, together with the log-regularity, very tame quotient, equivariant modification and regular log blow-up theorems it rests on. Česnavičius–Scholze's perfectoid proof of the local statement is a second proof of the same theorem; it is recorded in EQ.7 and uses EQ.8, and is not planned as a separate target.
- *Alterations*: alterations, ℓ′-alterations, maximally dominating morphisms, snc supports, log regular pairs, very tame actions, monoidal desingularization, Gabber's modification theorems (ILO VI, VIII, X), stable modification of curves, and resolution of excellent surfaces are AdicCoefficientsAndComparisonsPartII PA.0–PA.6; de Jong's alteration theorems over fields and traits and strict normal crossings divisors are SchemeAndStackFoundations §§4.16–4.20.
- *Commutative algebra and sites*: excellent and quasi-excellent rings and schemes, henselization, Elkik's theorem, Néron–Popescu desingularization and universal catenarity are SchemeAndStackFoundations Layer 0; Nisnevich coverings, Gabber's affine proper base change, limits of étale cohomology and proper cohomological descent are SchemeAndStackFoundations Layer 2; Cohen's structure theorem is DeformationAndDerivedPatchingAlgebra R03.1.
- *Étale formalism*: the derived and constructible categories, Tate twists, cohomology with supports, f^!, Verdier duality and biduality over fields and one-dimensional bases, smooth purity, fundamental classes and Artin vanishing are EtaleDualityAndPerverseSheaves EDC.0–EDC.5 (and EtaleCohomologyFoundations §§F.0–F.8, which they import); the oriented product over a trait is LefschetzPencilsAndVanishingCycles LPV.0.
- *Arc descent and perfectoid algebra* used in EQ.8: arc and I-complete arc topologies, formal glueing, henselian rigidity and the completion comparison (Česnavičius–Scholze Lemma 3.1.2, Theorem 2.2.5, Lemmas 2.2.2–2.2.4) are ArcTopologyAndDescent AT.3, AT.8, AT.11 and AT.12; integral perfectoid rings, p-integral closedness, products and ind-étale completions are PerfectoidQuotients Layer 0; the multiplicative description of the tilt, the sharp-quotient isomorphisms and tilting of valuation rings are PerfectoidQuotientsPartII Q5–Q6.

**Not in this roadmap.** Étale operations on Artin and Deligne–Mumford stacks and the Serre quotient of ind-perverse sheaves by constructible ones are separate extensions of EtaleDualityAndPerverseSheaves. Flat cohomology, virtual dimension and purity for finite flat group schemes are PurityForFlatCohomology, which consumes EQ.7. Gabber's finiteness theorem for non-abelian coefficients (ILO XXI) and ℓ-adic coefficients on quasi-excellent schemes (ILO XIII §4) have no consumer and are not targets.

## Conventions

- n ≥ 1 is an integer invertible on every scheme in sight, Λ = ℤ/n, and ℓ denotes a prime invertible on the base. Complexes are cohomologically graded: H^i(K[a]) = H^{i+a}(K). Tate twists are those of EtaleDualityAndPerverseSheaves EDC.0.
- A closed subset is *rare* (nowhere dense) when its complement is dense. An *snc support* is the support of a strict normal crossings divisor on a regular scheme; the empty set counts.
- ℓ′ denotes the integers prime to ℓ (with ℓ = 1 allowed, meaning no condition, and ℓ = ∞, meaning degree 1). The alteration topology alt is alt_1′.
- For a point x of X with geometric point x̄, X_(x̄) is the strict henselization, and RΓ_x̄(K) is the cohomology of K|X_(x̄) with supports in the closed point; H^i_x̄(K) are its cohomology groups. For a local ring (R, 𝔪), H^i_𝔪(R, F) is étale cohomology of Spec R with supports in the closed point.
- *Dimension functions* drop by one along immediate specializations: δ(y) = δ(x) − 1 when y is an étale immediate specialization of x. On a strictly local scheme the normalised dimension function is δ(t) = dim of the closure of t, which vanishes at the closed point. Potential dualizing complexes are pinned by RΓ_x(K) ≅ Λ(δ(x))[2δ(x)], so on a strictly henselian regular local ring of dimension d the normalised dualizing complex is Λ(d)[2d].
- *Perversity functions* p increase along specializations: p(x) ≥ p(y) when x is a specialization of y. The dualizing complex lies in the heart for p = −2δ.
- Tilting: for ϖ ∈ A with ϖ^p | p and A perfectoid after ϖ-adic completion, A^♭ = lim_{a↦a^p} A/ϖ (Mathlib's `PreTilt` for the completion) and ϖ^♭ ∈ A^♭ has (ϖ^♭)^♯ a unit multiple of ϖ.
- Page numbers for ILO are the printed pages of arXiv:1207.3648v1, whose numbering of statements is used; Česnavičius–Scholze cite the Astérisque numbering, in which the main theorem of Exposé XVII is Théorème 0.2 (Théorème 0.9 in v1). Česnavičius–Scholze is cited in arXiv:1912.10932v3.

## Exact supplier contracts

| Supplier | Interface consumed |
| --- | --- |
| Mathlib (pinned 082e2d3) | Schemes and morphism classes (`AlgebraicGeometry.LocallyOfFiniteType`, `IsProper`, `Etale`, `IsReduced`), `Scheme.smallEtaleTopology`, `IsLocalRing`, `IsRegularLocalRing`, `HenselianRing`, `ringKrullDim`, `IsAdicComplete`, `MvPowerSeries`, `IsReduced`, `ValuationRing`, `PreTilt`, `CategoryTheory.Triangulated.TStructure`. No étale cohomology of schemes beyond the underived `Scheme.ellAdicSheaf` is at the pins; every cohomological target below is stated in mathematics. |
| EtaleDualityAndPerverseSheaves (TauCetiRoadmap pull request #1040) | EDC.0 derived and constructible categories, Tate twists, cohomology with supports; EDC.1 exceptional pullback, local cohomology, Verdier duality, biduality over fields and one-dimensional bases, self-injectivity of ℤ/n; EDC.2 smooth purity; EDC.3 fundamental classes and smooth-pair purity; EDC.4 Artin vanishing; EDC.5 point dimensions and the middle perversity. Deligne's generic constructibility over an arbitrary noetherian base (SGA 4½ [Th. finitude] 1.9) is requested from EDC.0 / EtaleCohomologyFoundations §F.3, which states it over a field base. |
| LefschetzPencilsAndVanishingCycles (TauCetiRoadmap pull request #873) | §0.10 absolute cohomological purity for regular pairs and the snc-complement formula; LPV.0 oriented product over a trait and henselian trait conventions. |
| SchemeAndStackFoundations (TauCetiRoadmap main) | Layer 0 (§§0.12–0.16, 0.21), Layer 2 (§§2.12, 2.15–2.16), Layer 4 (§§4.16–4.20), as listed above. |
| AdicCoefficientsAndComparisonsPartII | PA.0 alterations and ℓ′-alterations, flattening, snc supports, resolution of excellent surfaces; PA.1 Riemann–Zariski spaces; PA.4 log regular pairs, very tame quotients, monoidal desingularization, Gabber's modification theorem; PA.5 stable modification. |
| DeformationAndDerivedPatchingAlgebra | R03.1 Cohen structure theorem and compatible coefficient rings. |
| ArcTopologyAndDescent | AT.3 components of products of valuation rings; AT.8 formal glueing, Gabber's affine proper base change, completion comparison for henselian pairs; AT.11 I-complete arc covers, product-of-valuation-rings basis, complete étale hyperdescent; AT.12 tilting of complete arc covers. |
| PerfectoidQuotients (TauCetiRoadmap pull request #1042), PerfectoidQuotientsPartII | Integral perfectoid rings, p-integral closedness, torsion-free quotients, products, completely étale and henselian perfectoid algebras; the tilt as a p-power limit, sharp-quotient isomorphisms, tilting of valuation rings. |

## How to read the build

EQ.0 and EQ.1 are independent and come first. EQ.2 combines them with the alteration theory of AdicCoefficientsAndComparisonsPartII. EQ.3 is pure topos theory over the alteration topology of EQ.0. EQ.4 (finiteness) needs EQ.2 and EQ.3; EQ.5 (dimension functions, affine Lefschetz, cohomological dimension) needs EQ.0, EQ.2 and EQ.3 but not EQ.4; EQ.6 (duality) needs EQ.1, EQ.4 and EQ.5. EQ.7 needs EQ.5 and EQ.6. EQ.8 depends only on the perfectoid and arc-descent suppliers and can be built in parallel with everything else.


## Layer EQ.0: Topologies of alterations and approximation

The topologies in which Gabber's uniformization is stated, and the two reductions of uniformization to complete local rings.

Key objects and theorems: Topology of ℓ′-alterations; Standard forms of alteration covers; Approximation theorem.

**Definition (The category alt/S of maximally finite dominant schemes).** `alteration-category`. Let S be a noetherian scheme and ℓ a prime, the integer 1 or the symbol ∞ (with ℓ′ the set of positive integers prime to ℓ, and ∞′ = {1}). A morphism f : X → Y is maximally dominant if it sends every maximal point (generic point of an irreducible component) of X to a maximal point of Y; it is maximally ℓ′-finite if for every maximal point η of X the extension κ(η)/κ(f(η)) is finite and every maximal point μ of Y in the image of f has a maximal point η above it with [κ(η) : κ(μ)] ∈ ℓ′ (maximally finite when ℓ = 1, where the second condition is empty). alt/S is the category whose objects are reduced S-schemes of finite type whose structure map is maximally finite and maximally dominant, with S-morphisms as morphisms. For X of finite type over S, X^md is the closure of the image of the generic fibre X ×_S η_S with its reduced structure (the union of the irreducible components of X dominating a component of S). Fibre products in alt/S are X ×^alt_S Y := (X ×_S Y)^md.

*Hypotheses and conventions.* S noetherian; objects reduced and of finite type over S. Maximal dominance is the notion of AdicCoefficientsAndComparisonsPartII PA.0/maximally-dominating; ℓ′-finiteness at maximal points refines its ℓ′-alterations to non-proper morphisms.

*Uses.*
- ILO II 2.3.1: the topology of ℓ′-alterations is a Grothendieck topology on alt/S.
- ILO XIII 2.2.2 and XV 2.2.1: hypercoverings for the alteration topology are simplicial objects of alt/X.
- ILO XV 3.3.1: base changes of hypercovers are replaced by their md parts.

*API.*
- `AltCat` (data): The category alt/S for a noetherian scheme S.
- `AltCat.md` (constructor): The functor T ↦ T^md from finite-type S-schemes to alt/S, right adjoint to the inclusion.
- `AltCat.hasPullbacks` (instance): alt/S has fibre products, computed as (X ×_S Y)^md.
- `AltCat.final` (projection): S_red is a final object of alt/S.
- `AltCat.flatBaseChange` (functoriality): For a flat S′ → S with S′ locally noetherian, X ↦ (X ×_S S′)_red defines a functor alt/S → alt/S′ (ILO II 1.2.3).
- `MaximallyEllPrimeFinite` (data): The predicate of maximal ℓ′-finiteness of a morphism, stable under base change in alt (ILO II 1.2.7) and composition.

*Unit tests.*
- `AltCat.test_final` (degenerate): For S = Spec k with k a field, S is final in alt/S and every object is finite over k: it is reduced of finite type and its maximal points have residue fields finite over k, so it has dimension zero.
- `AltCat.test_blowup_product` (computation): For S = 𝔸²_k and X = Bl_0 𝔸², the ordinary fibre product X ×_S X has an irreducible component over the exceptional locus that does not dominate S; X ×^alt_S X is the closure of the diagonal generic part.
- `AltCat.test_closed_point_not_object` (non-example): For S = 𝔸¹_k, the inclusion of the origin is of finite type and reduced but not maximally dominant, so it is not an object of alt/S.
- `AltCat.test_alteration_compat` (compatibility): For S integral and X → S proper, surjective and integral, X is an object of alt/S exactly when X → S is an alteration (PA.0/alteration).

*Construction.* Define the subcategory and the functor T ↦ T^md on finite-type S-schemes; T^md is right adjoint to the inclusion of reduced maximally dominant finite-type S-schemes (ILO II 1.2.5). Existence of fibre products in alt/S: apply (−)^md to the ordinary fibre product and use the adjunction (ILO II 1.2.6). Every morphism of alt/S is maximally finite dominant (ILO II 1.1.10), and S_red is final (ILO II 1.2.3). (ILO, Exposé II, §1, Definitions 1.1.2, 1.1.8 and 1.2.2, 1.2.5, Proposition 1.2.6, pp. 23–26 (printed).)

*Needs:* AdicCoefficientsAndComparisonsPartII PA.0 `maximally-dominating`; AdicCoefficientsAndComparisonsPartII PA.0 `alteration`; AdicCoefficientsAndComparisonsPartII PA.0 `p-alteration`; Mathlib `AlgebraicGeometry.LocallyOfFiniteType`; Mathlib `AlgebraicGeometry.IsReduced`.

**Checks.**

- The ordinary fibre product of two copies of the blow-up of 𝔸² at the origin over 𝔸² is not maximally dominant; its md part is the fibre product in alt/𝔸².
- For integral S and integral X, an object X → S of alt/S that is proper and surjective is an alteration in the sense of AdicCoefficientsAndComparisonsPartII PA.0/alteration.

**Definition (The topology of ℓ′-alterations).** `ell-prime-alteration-topology`. Let S be noetherian and ℓ as in EQ.0/alteration-category. An étale covering (X_i → X) is ℓ′-decomposed if every point x of X lifts to a point x_i of some X_i with [κ(x_i) : κ(x)] ∈ ℓ′ (for ℓ = 1 an ordinary étale covering, for ℓ = ∞ a Nisnevich covering). The topology alt_ℓ′ of ℓ′-alterations on alt/S is the Grothendieck topology generated by (i) ℓ′-decomposed étale coverings and (ii) single morphisms that are proper, surjective and maximally ℓ′-finite. alt_1′ is the alteration topology alt. A hypercovering for alt_ℓ′ of X is a simplicial object X_• of alt/X whose maps X_{n+1} → (cosk_n X_•)_{n+1} are alt_ℓ′-coverings.

*Hypotheses and conventions.* The generating families are not closed under composition (ILO II 2.3.2); the topology is the one they generate. Condition (i) is imposed at every point, condition (ii) only at maximal points.

*Uses.*
- ILO II 4.3.1–4.3.2, VII 1.1, IX 1.1: the uniformization theorems produce alt and alt_ℓ′ coverings by regular schemes with snc boundary.
- ILO XII 2.2.1 and 2.2.4: oriented cohomological descent is proved along alt hypercoverings.
- ILO XIII 3.2.1: the finiteness theorem uses the standard form of alt_ℓ′ coverings.

*API.*
- `AltTopology` (data): The Grothendieck topology alt_ℓ′ on alt/S, with alt = alt_1′.
- `AltTopology.etale_mem` (constructor): Every ℓ′-decomposed étale covering is alt_ℓ′-covering.
- `AltTopology.proper_mem` (constructor): Every proper surjective maximally ℓ′-finite morphism is alt_ℓ′-covering.
- `AltTopology.flatBaseChange` (functoriality): Coverings pull back to coverings along flat S′ → S with S′ locally noetherian.
- `AltTopology.mono` (relation): alt_ℓ′ is coarser than alt: every alt_ℓ′-covering is an alt-covering; Nisnevich coverings are alt_ℓ′-coverings for every ℓ.
- `AltHypercover` (data): Hypercoverings X_• → X for alt_ℓ′, with the truncation to degrees ≤ N.

*Unit tests.*
- `AltTopology.test_gaussian_odd` (computation): For ℓ odd, the finite flat map Spec ℤ[i] → Spec ℤ of generic degree 2 is proper, surjective and maximally ℓ′-finite, hence alt_ℓ′-covering.
- `AltTopology.test_gaussian_two` (non-example): Spec ℤ[i] → Spec ℤ is not alt_2′-covering: every alt_2′-covering of Spec ℤ has, over the generic point, a point whose residue field has odd degree over ℚ, and no such field contains ℚ(i).
- `AltTopology.test_ell_one` (degenerate): For ℓ = 1 the condition on degrees is empty, so every proper surjective generically finite map of integral schemes is alt-covering (e.g. Frobenius of 𝔸¹ over 𝔽_p).
- `AltTopology.test_open_not_cover` (non-example): The inclusion 𝔾_m → 𝔸¹ is not an alt-covering of 𝔸¹: the origin is not in the image of any refinement.
- `AltTopology.test_nisnevich` (compatibility): For ℓ = ∞, condition (i) is the completely decomposed (Nisnevich) covering condition of SchemeAndStackFoundations §2.12.

*Construction.* Check that the families (i) and (ii) are stable under base change in alt/S (ILO II 1.2.7, 2.1.1) and define the generated topology (ILO II 2.3.1). Flat base change of coverings along S′ → S with S′ locally noetherian (ILO II 2.3.4). Hypercoverings are defined as for any site, following Deligne's construction (Hodge III §5–6). (ILO, Exposé II, §2.1 and Definition 2.3.1, Remark 2.3.2, 2.3.3–2.3.4, pp. 26–28 (printed).)

*Needs:* §EQ.0 `alteration-category`; Mathlib `AlgebraicGeometry.Etale`; Mathlib `AlgebraicGeometry.IsProper`; SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16).

**Checks.**

- Spec ℤ[i] → Spec ℤ is an alt_ℓ′-covering for every odd prime ℓ and is not an alt_2′-covering.
- A dense open immersion U ⊊ X is not an alt-covering.

**Theorem (Standard forms of alteration coverings).** `standard-form-covers`. Let X be irreducible, noetherian and quasi-excellent, and ℓ a prime. (1) Every alt_ℓ′-covering family of X is refined by a family (V_i → Y → X)_i in which Y is integral, Y → X is proper, surjective, of generic degree prime to ℓ, and (V_i → Y)_i is a Nisnevich covering; for ℓ = 1 one may take (V_i → Y) a Zariski covering. (2) Every alt_ℓ′-covering family of X is refined by a family (W_i → V_i → Y → X)_i of irreducible schemes in which Y → X is a proper birational modification, (V_i → Y) is a Nisnevich covering and each W_i → V_i is finite, flat and of degree prime to ℓ. For reducible X apply (2) to the disjoint union of the irreducible components.

*Hypotheses and conventions.* X noetherian, irreducible, quasi-excellent (quasi-excellence is used for the reduction; ILO II 3.2.1 expects it to be superfluous).

*Proof sketch.* Étale case: an ℓ′-decomposed étale covering is dominated by a Nisnevich covering of a finite maximally ℓ′-finite surjective Y → X; pass to a normal limit with pro-ℓ absolute Galois group, where ℓ′-decomposed étale maps are completely decomposed (ILO II 3.1.1). Proper case and composition: combine (i) and (ii) using the exchange of a finite flat map of degree prime to ℓ with a Nisnevich covering after henselization (ILO II 3.2.1–3.2.3). Flatten Y → X by an admissible blow-up (Raynaud–Gruson; AdicCoefficientsAndComparisonsPartII PA.0/finite-type-flattening) to obtain the birational-then-finite-flat form (2). (ILO, Exposé II, Proposition 3.1.1, Théorèmes 3.2.1 and 3.2.3, pp. 28–31 (printed).)

*Needs:* §EQ.0 `ell-prime-alteration-topology`; SchemeAndStackFoundations SF.0 `quasi-excellent-scheme`; AdicCoefficientsAndComparisonsPartII PA.0 `finite-type-flattening`; AdicCoefficientsAndComparisonsPartII PA.0 `p-alteration`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- For X = Spec of a henselian local ring and a covering by a single finite flat map of degree prime to ℓ, form (2) is the map itself with Y = X.
- The standard form of a Zariski covering is itself (Y = X).

**Theorem (Valuative characterisation of alteration coverings).** `valuative-alteration-covers`. Let X be noetherian and Y → X an object of alt/X. Then Y → X is a covering for the alteration topology if and only if every maximally dominant morphism Spec V → X, with V a valuation ring whose fraction field is algebraically closed, lifts to a morphism Spec V → Y. The analogue for alt_ℓ′ replaces the algebraically closed fraction field by a perfect field whose absolute Galois group is a pro-ℓ group (the quotient of the geometric generic point by an ℓ-Sylow subgroup).

*Hypotheses and conventions.* X noetherian; V ranges over valuation rings with the stated fraction fields; the map Spec V → X is maximally dominant.

*Proof sketch.* Necessity: by EQ.0/standard-form-covers reduce to Y → X proper surjective; lift the generic point by the Nullstellensatz and extend by the valuative criterion of properness. Sufficiency: reduce to X affine integral and Y affine with a compactification; use quasi-compactness of the Riemann–Zariski space of X (AdicCoefficientsAndComparisonsPartII PA.1/riemann-zariski-space and PA.1/rz-compact-valuative) to find finitely many lifts of the geometric generic point covering it, and conclude that Y → X is refined by a Zariski covering of a proper surjective X-scheme. (ILO, Exposé II, Théorème 4.2.1 and Remarque 4.2.2, p. 32 (printed), after Goodwillie–Lichtenbaum, Theorem 3.5.)

*Needs:* §EQ.0 `ell-prime-alteration-topology`; §EQ.0 `standard-form-covers`; AdicCoefficientsAndComparisonsPartII PA.1 `riemann-zariski-space`; AdicCoefficientsAndComparisonsPartII PA.1 `rz-compact-valuative`; Mathlib `ValuationRing`.

**Checks.**

- The open immersion 𝔾_m → 𝔸¹ fails the criterion: a valuation ring centred at the origin does not lift; Spec ℤ[i] → Spec ℤ satisfies it for alt.
- For X the spectrum of a DVR, the normalisation of X in a finite extension of its fraction field is an alteration covering; the criterion reduces to the extension of valuations.

**Theorem (Approximation of schemes over a complete local ring).** `artin-popescu-approximation`. Let A be an excellent henselian noetherian local ring with completion Â, S = Spec A, Ŝ = Spec Â, and write Ŝ = lim_α S_α with S_α smooth over S (Popescu). Let X be of finite type over Ŝ with a model X_{α0} over S_{α0}. There are α1 ≥ α0 and integers n0 ≥ c > 0 such that for every n ≥ n0, α ≥ α1 and every section u of S_α → S that is (n+1)-close to the canonical map Ŝ → S_α, the pulled-back scheme X_u over S is (n+1−c)-isomorphic to X above the closed fibre (an approximation of order n − c). If X and Y are a-close at a point x of their common closed fibre, then (i) for a ≥ 1 they have the same dimension at x, and (ii) for a ≥ 2, X is regular at x iff Y is; (iii) if X is regular, every sufficiently fine approximation X_u is regular in an open neighbourhood of its closed fibre.

*Hypotheses and conventions.* A excellent henselian noetherian local; closeness is measured by agreement of associated graded rings up to the stated order (ILO III, Definitions 2.1–2.2, 4.2).

*Proof sketch.* Popescu's theorem writes the regular map A → Â as a filtered colimit of smooth A-algebras (SchemeAndStackFoundations §0.15, Néron–Popescu desingularization). Artin approximation gives sections u of S_α → S close to the canonical map; compare graded pieces gr^n of X and X_u via the Tougeron–type estimate of ILO III Proposition 4.5 to obtain the (n+1−c)-isomorphism (ILO III 5.1). Dimension and regularity are read from the normal cone and the Zariski tangent space, which are determined by low-order graded pieces (ILO III Corollaire 5.4). (ILO, Exposé III, Théorème 5.1, Définition 5.2 and Corollaire 5.4, pp. 41–43 (printed).)

*Needs:* SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21); SchemeAndStackFoundations key `excellent-schemes`; SchemeAndStackFoundations key `henselization`; Mathlib `IsAdicComplete`.

**Checks.**

- For X = Ŝ itself, every approximation X_u is S, and the closed fibres agree to all orders.
- For X = Spec Â[t]/(t² − a) with a a unit and 2 invertible, the approximations Spec A[t]/(t² − a_u) with a_u close to a are étale over S, hence regular.

**Theorem (Reduction of uniformization to local henselian excellent normal schemes).** `uniformization-henselian-reduction`. Consider the uniformization statement U(X): for every nowhere dense closed Z ⊂ X there is a finite family (X_i → X) covering for alt (resp. alt_ℓ′, ℓ invertible on X) with each X_i regular and connected and each preimage of Z the support of a strict normal crossings divisor (possibly empty). If U(X) holds for every noetherian local henselian excellent normal scheme X (resp. of dimension ≤ d), then U(X) holds for every noetherian quasi-excellent scheme X (resp. of dimension ≤ d).

*Hypotheses and conventions.* Z nowhere dense (rare) closed; snc supports in the sense of AdicCoefficientsAndComparisonsPartII PA.0/snc-support.

*Proof sketch.* Normalisation is an alt_ℓ′-covering and preserves rareness of Z, so reduce to X normal integral. For x ∈ X the henselisation X_(x) is excellent (EGA IV 18.7.6; SchemeAndStackFoundations §0.21) with Z_(x) rare; a uniformizing family over X_(x) is dominated by a standard covering (EQ.0/standard-form-covers) which spreads out to an étale neighbourhood of x by limit arguments. Noetherian induction and quasi-compactness assemble the local families (ILO II 4.1.1–4.1.2, 4.3.3). (ILO, Exposé II, Théorèmes 4.3.1–4.3.2 and Proposition 4.3.3, p. 33 (printed).)

*Needs:* §EQ.0 `standard-form-covers`; SchemeAndStackFoundations key `henselization`; SchemeAndStackFoundations key `excellent-schemes`; AdicCoefficientsAndComparisonsPartII PA.0 `snc-support`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- For X regular with Z an snc support, U(X) holds with the identity family and the reduction is trivial.
- The dimension bound is preserved: a family produced for X of dimension ≤ d uses only local schemes of dimension ≤ d.

**Theorem (Reduction of uniformization to complete local rings).** `complete-local-reduction`. If the uniformization statement U(T) of EQ.0/uniformization-henselian-reduction (for alt, resp. alt_ℓ′ with ℓ invertible) holds for every noetherian complete local scheme T, then it holds for every noetherian quasi-excellent scheme T.

*Hypotheses and conventions.* Uniformization for complete local rings is assumed in the relevant topology; ℓ invertible for the prime-to-ℓ version.

*Proof sketch.* By EQ.0/uniformization-henselian-reduction reduce to T local, excellent and henselian (a henselian quasi-excellent local scheme is excellent). Uniformize the completion T̂; approximate the finitely many regular schemes and snc divisors of the family by models over T using EQ.0/artin-popescu-approximation, keeping regularity near the closed fibre and the combinatorics of the divisors. Check the approximated family is still covering using the standard forms (EQ.0/standard-form-covers) and the valuative criterion. (ILO, Exposé III, Théorème 6.1 and Proposition 6.2, p. 43 (printed).)

*Needs:* §EQ.0 `uniformization-henselian-reduction`; §EQ.0 `artin-popescu-approximation`; §EQ.0 `standard-form-covers`; §EQ.0 `valuative-alteration-covers`.

**Checks.**

- For T complete the statement is the hypothesis itself.
- For T = Spec of the henselisation of 𝔸²_k at the origin and Z = V(xy(x − y)), the family produced from the blow-up of the completion descends to the blow-up of T.

### Dependencies

This layer requires SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21), SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16), AdicCoefficientsAndComparisonsPartII PA.0, AdicCoefficientsAndComparisonsPartII PA.1.

## Layer EQ.1: Cohen–Gabber structure and partial algebraization

Gabber's refinement of Cohen's structure theorem (finite generically étale power-series parametrisations, equivariant and prime-to-ℓ forms, with Epp's theorem) and the partial algebraization of complete local rings as completions of finite-type schemes over regular bases of smaller dimension.

Key objects and theorems: Cohen–Gabber theorem; Partial algebraization.

**Theorem (The Cohen–Gabber theorem in characteristic p).** `cohen-gabber-equal-characteristic`. Let A be a complete noetherian local ring of equal characteristic p > 0 that is reduced and equidimensional of dimension d, with residue field k. There is a subring A_0 ⊆ A isomorphic to k⟦t_1, …, t_d⟧ such that A is finite and torsion-free over A_0 and generically étale over it (étale over a dense open of Spec A_0), and A_0 → A induces an isomorphism on residue fields.

*Hypotheses and conventions.* Equal characteristic p > 0 (in characteristic 0 Cohen's theorem with separable Noether normalisation already gives the conclusion). Equidimensional: every minimal prime 𝔭 has dim A/𝔭 = d.

*Proof sketch.* Choose a p-basis of k and lift it; this determines a coefficient field κ ⊂ A (Cohen's structure theorem, DeformationAndDerivedPatchingAlgebra R03.1). Show that for a suitable choice of the lifts the completed module of differentials Ω̂¹_{A/κ} has generic rank d on every irreducible component (ILO IV 2.1.4–2.1.11). Choose parameters t_1, …, t_d whose differentials span generically; then A is finite over κ⟦t⟧ and generically étale (ILO IV 2.1.12). (ILO, Exposé IV, Théorème 2.1.1 and its proof §§2.1.3–2.1.12, pp. 50–53 (printed); Gabber 2005a, Lemma 8.1.)

*Needs:* DeformationAndDerivedPatchingAlgebra R03.1 `cohen-structure-and-compatible-coefficients`; Mathlib `MvPowerSeries`; Mathlib `IsAdicComplete`; Mathlib `IsReduced`.

**Checks.**

- For A = k⟦x, y⟧/(y² − x³) with p ≠ 2, 3, A_0 = k⟦x⟧ works: A is free of rank 2 over it and étale where x ≠ 0.
- For A = 𝔽_p(s)⟦x⟧ with s transcendental, A_0 = A with t_1 = x; the naive choice k⟦x^p⟧ is finite but not generically étale.

**Theorem (Equivariant Cohen–Gabber theorem).** `cohen-gabber-equivariant`. Let A be a complete noetherian local reduced ring of equal characteristic, of dimension d, with residue field κ, and let a finite group G act on A with |G| invertible in κ. There is a G-equivariant finite generically étale morphism κ⟦t_1, …, t_d⟧ → A, where κ → A lifts the identity of κ and G acts trivially on the t_i.

*Hypotheses and conventions.* |G| invertible in κ; equal characteristic (A contains a field).

*Proof sketch.* Pass to the invariant ring B = A^G, which is complete local noetherian and over which A is finite (ILO IV Proposition 2.2.3). Apply EQ.1/cohen-gabber-equal-characteristic (or Cohen's theorem in characteristic 0) to B, and use that A is generically étale over B because |G| is invertible. (ILO, Exposé IV, Théorème 2.2.2 and Proposition 2.2.3, p. 53 (printed).)

*Needs:* §EQ.1 `cohen-gabber-equal-characteristic`; DeformationAndDerivedPatchingAlgebra R03.1 `cohen-structure-and-compatible-coefficients`.

**Checks.**

- For G trivial this is the non-equivariant theorem.
- For A = k⟦x⟧ with G = μ_2 acting by x ↦ −x (char k ≠ 2), one can take t = x²: the map k⟦t⟧ → A is finite, equivariant and étale where x ≠ 0.

**Theorem (Epp's theorem on eliminating wild ramification).** `epp-theorem`. Let T → S be a local dominant morphism of complete traits of residue characteristic p > 0, with residue fields κ_S perfect and the maximal perfect subfield of κ_T algebraic over κ_S. There is a finite extension of traits S′ → S such that the normalisation of the reduced fibre product, T′ = ((T ×_S S′)_red)^norm, has reduced special fibre over S′. In mixed characteristic T ×_S S′ is already reduced.

*Hypotheses and conventions.* Complete traits; κ_S perfect; the perfect part of κ_T algebraic over κ_S.

*Proof sketch.* Epp's proof (Invent. Math. 19 (1973), Theorem 1.9) reduces to the case of a ramified Artin–Schreier tower and kills wild ramification by a suitable finite extension of the base; ILO IV §3 records the statement and the sorites used. Remark: in mixed characteristic the fibre product is flat over S′ with reduced generic fibre, hence reduced (ILO IV Remarque 3.1.3). (ILO, Exposé IV, Théorème 3.1.2 and Remarque 3.1.3, p. 55 (printed), citing Epp 1973, Theorem 1.9.)

*Needs:* DeformationAndDerivedPatchingAlgebra R03.1 `cohen-structure-and-compatible-coefficients`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- If T → S is unramified with separable residue field extension, S′ = S works.
- In mixed characteristic T ×_S S′ is reduced, so only normalisation is needed (ILO IV Remarque 3.1.3).

**Theorem (The Cohen–Gabber theorem in mixed characteristic, prime to ℓ).** `cohen-gabber-mixed-characteristic`. Let X = Spec A be a complete noetherian local normal scheme of dimension d ≥ 2 with residue field k of characteristic p > 0 and generic point of characteristic 0. (1) There are a finite surjective X′ → X with X′ normal integral of residue field k′, and a finite surjective X′ → Spec V⟦t_1, …, t_{d−1}⟧ with V a discrete valuation ring of residue field k′, étale over a p-dense open (an open meeting the fibre over p densely). (2) For a prime ℓ ≠ p there are a normal integral local Y with an action of a finite ℓ-group H and an H-equivariant finite surjective Y → X with Y/H → X of generic degree prime to ℓ, a complete mixed-characteristic discrete valuation ring V with residue field that of Y and a compatible H-action, and an H-equivariant local finite morphism Y → Spec V⟦t_1, …, t_{d−1}⟧, étale over a p-dense open, with H acting trivially on the t_i.

*Hypotheses and conventions.* d ≥ 2; mixed characteristic (0, p); ℓ ≠ p in (2).

*Proof sketch.* Use Cohen rings and Cohen's structure theorem to map X to Spec W(k_0) with k_0 the maximal perfect subfield of k (ILO IV 4.1.7–4.1.8, 4.2.3). At each generic point of the fibre over p, eliminate wild ramification with Epp's theorem (EQ.1/epp-theorem) after a finite base change. Choose parameters giving a finite map to V⟦t_1, …, t_{d−1}⟧ that is étale over a p-dense open (ILO IV 4.2.2); for (2) replace the base extension by its Galois closure and descend along an ℓ-Sylow subgroup (ILO IV 4.3.1). (ILO, Exposé IV, Théorèmes 4.2.2 and 4.3.1, pp. 58–60 (printed).)

*Needs:* §EQ.1 `epp-theorem`; §EQ.1 `cohen-gabber-equal-characteristic`; DeformationAndDerivedPatchingAlgebra R03.1 `cohen-structure-and-compatible-coefficients`.

**Checks.**

- For X = Spec ℤ_p⟦x⟧ (d = 2), V = ℤ_p and t_1 = x with X′ = X work in (1).
- In (2) with H trivial, Y → X itself must have generic degree prime to ℓ.

**Definition (Partially algebraizable complete local rings).** `partially-algebraizable`. Let A be a complete noetherian local ring and (I_e)_{e∈E} a family of ideals of A. The pair (A, (I_e)) is partially algebraizable if there exist a complete noetherian local ring B with dim B < dim A, a B-algebra C of finite type, a maximal ideal 𝔫 of C above the maximal ideal of B, and an isomorphism A ≅ Ĉ_𝔫 (completion of the localisation) under which every I_e is the extension of an ideal of C_𝔫.

*Hypotheses and conventions.* A complete noetherian local; E arbitrary (in the theorems, finite).

*Uses.*
- ILO V 2.1.2 and 3.1.1: the partial algebraization theorems produce such presentations.
- ILO VII §3.1: the complete local scheme to be uniformized is realised as the completion of a curve over a regular base of dimension d − 1, to apply de Jong's theorem.
- ILO XVII §6: the duality theorem is proved by induction on dimension using V 3.1.3.

*API.*
- `PartiallyAlgebraizable` (data): The predicate on a complete local ring with a family of ideals.
- `PartiallyAlgebraizable.of_iso` (functoriality): Invariance under isomorphisms of complete local rings carrying the ideals.
- `PartiallyAlgebraizable.inter` (relation): If the family (I_e) is partially algebraizable, so is the family enlarged by I_i ∩ I_j for any two indices, with the same presentation: completion of the noetherian local ring C_𝔫 is flat, so extension of ideals commutes with finite intersections. With primary decomposition this reduces families to primary ideals (ILO V 2.2.1).
- `PartiallyAlgebraizable.dim_lt` (projection): The base B of a presentation has dim B < dim A; C has relative dimension ≥ 1 at 𝔫 when A ≠ 0.
- `PartiallyAlgebraizable.geometric` (characterisation): Equivalently X = Spec A is the completion of a finite-type scheme over a complete regular local scheme of smaller dimension at a closed point of its closed fibre, with the closed subsets V(I_e) coming from closed subsets (ILO V 3.1.3).

*Unit tests.*
- `PartiallyAlgebraizable.test_power_series` (computation): A = k⟦x_1, …, x_d⟧ (d ≥ 1) with the ideals (x_1), …, (x_d) is partially algebraizable over B = k⟦x_1, …, x_{d−1}⟧, C = B[x_d], 𝔫 = (x_1, …, x_d).
- `PartiallyAlgebraizable.test_field` (degenerate): A field k with any family of ideals is not partially algebraizable, since no complete local B has dimension < 0.
- `PartiallyAlgebraizable.test_graph` (computation): In A = k⟦x, y⟧ the ideal (y − exp-like series f(x)) is extended from C_𝔫 with C = k⟦x⟧[y], since y − f(x) ∈ C.
- `PartiallyAlgebraizable.test_not_finite_type_over_A` (non-example): The trivial presentation B = A, C = A is not allowed: it violates dim B < dim A.

*Construction.* Definition; closure under finite intersections of ideals (ILO V 2.2.1) and under primary decomposition is part of the API. (ILO, Exposé V, §2.1.1, p. 64 (printed).)

*Needs:* Mathlib `IsAdicComplete`; Mathlib `ringKrullDim`; Mathlib `IsLocalRing`.

**Checks.**

- A = k⟦x, y⟧ with I = (y − x²) is partially algebraizable with B = k⟦x⟧, C = B[y], 𝔫 = (x, y).
- A field is never partially algebraizable (dim B < 0 is impossible).

**Theorem (Partial algebraization in equal characteristic).** `partial-algebraization-equal-characteristic`. Let A be a complete noetherian local reduced ring of equal characteristic which is not a field. Then for every finite family of ideals (I_e), the pair (A, (I_e)) is partially algebraizable.

*Hypotheses and conventions.* A reduced, equal characteristic, dim A ≥ 1; finitely many ideals.

*Proof sketch.* Reduce to primary ideals (EQ.1/partially-algebraizable, intersection property). Use EQ.1/cohen-gabber-equal-characteristic (or EQ.1/cohen-gabber-equivariant with G = 1 when A is not equidimensional) to get a finite generically étale X → X_0 = Spec k⟦t_1, …, t_d⟧. Minimal primes are handled by generic étaleness; lower-dimensional supports lie over V(g) for a g ∈ k⟦t⟧ − 0; after a Weierstrass change of coordinates make g a Weierstrass polynomial in t_d and algebraize along k⟦t_1, …, t_{d−1}⟧[t_d] using Elkik's theorem on finite étale algebras over henselian pairs (ILO V 1.1.1, 1.1.3, 1.2.4, 2.2). (ILO, Exposé V, Théorème 2.1.2 and §2.2, pp. 64–66 (printed).)

*Needs:* §EQ.1 `partially-algebraizable`; §EQ.1 `cohen-gabber-equal-characteristic`; §EQ.1 `cohen-gabber-equivariant`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- For A = k⟦x, y⟧/(xy) (dimension 1) and the ideals (x), (y), one may take B = k, C = k[x, y]/(xy) and 𝔫 = (x, y).
- The hypothesis 'not a field' is needed by EQ.1/partially-algebraizable's degenerate test.

**Theorem (Partial algebraization prime to ℓ in mixed characteristic).** `partial-algebraization-mixed-characteristic`. Let A be a complete noetherian local normal ring of mixed characteristic (0, p) and dimension d ≥ 2, and ℓ ≠ p a prime. There is a finite injective A → A′ of generic degree prime to ℓ with A′ normal integral such that every finite family of ideals of A′ is partially algebraizable. Geometrically: for a complete noetherian local X of mixed characteristic and dimension d ≥ 2, finitely many closed subsets Z_i ⊂ X and ℓ invertible on X, there are a complete regular local scheme S of mixed characteristic and dimension d − 1, a local normal X′ with a finite π : X′ → X of generic degree prime to ℓ, a finite-type f : Y → S and an isomorphism a of X′ with the completion of Y at a closed point of its special fibre, and closed F_i ⊂ Y with π^{-1}(Z_i) = a^{-1}(F_i). In equal characteristic the same holds with X′ = X.

*Hypotheses and conventions.* Mixed characteristic (0, p), d ≥ 2, ℓ ≠ p; finitely many closed subsets.

*Proof sketch.* Apply EQ.1/cohen-gabber-mixed-characteristic (2) to get B_0 = V⟦t_1, …, t_{d−1}⟧ → B with an ℓ-group H, and set A′ = B^H (ILO V 3.2.1). Algebraize ideals of A′ along V⟦t_1, …, t_{d−2}⟧[t_{d−1}] by the Weierstrass and Elkik arguments of the equal-characteristic case, keeping track of the H-action (ILO V 3.2.2 onwards). The geometric reformulation follows by taking S = Spec V⟦t_1, …, t_{d−2}⟧ (ILO V 3.1.3); Remark 3.1.4 gives the equal-characteristic case from EQ.1/partial-algebraization-equal-characteristic. (ILO, Exposé V, Théorème 3.1.1, Reformulation 3.1.3 and Remarque 3.1.4, p. 66 (printed).)

*Needs:* §EQ.1 `partially-algebraizable`; §EQ.1 `cohen-gabber-mixed-characteristic`; §EQ.1 `partial-algebraization-equal-characteristic`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- For A = ℤ_p⟦x⟧ and the ideal (x − p), A′ = A works with S = Spec ℤ_p and Y = 𝔸¹_S.
- The generic degree of A → A′ may be divisible by p but never by ℓ.

### Dependencies

This layer requires SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21), DeformationAndDerivedPatchingAlgebra R03.1.

## Layer EQ.2: Gabber's local uniformization

de Jong's equivariant nodal-curve alteration over excellent bases, Gabber's weak and prime-to-ℓ local uniformization theorems for noetherian quasi-excellent schemes, and alteration hypercoverings by regular schemes with snc boundary.

Key objects and theorems: de Jong's nodal-curve alteration; Weak local uniformization; Gabber's local uniformization.

**Theorem (de Jong's equivariant nodal-curve alteration over an excellent base).** `de-jong-nodal-curve-alteration`. Let f : X → Y be a proper morphism of excellent integral noetherian schemes and Z ⊂ X a nowhere dense closed subscheme, with η the generic point of Y, such that X_η is smooth, irreducible and of dimension 1 and Z_η is étale over η. There are a finite group G, a commutative square of G-schemes with f′ : X′ → Y′ over f, alterations a : X′ → X and b : Y′ → Y, an effective G-equivariant divisor D ⊂ X′ and a nowhere dense G-stable closed T′ ⊂ Y′ such that: f′ is projective; G acts trivially on X and Y and freely on Y′ − T′; a and b are projective generically étale alterations and Y′/G → Y (resp. X′/G → X) is an isomorphism at η (resp. at the generic point of X_η); f′ is a nodal curve, smooth outside T′; D is étale over Y′ and contained in the smooth locus of f′; and a^{-1}(Z) ⊂ D ∪ f′^{-1}(T′).

*Hypotheses and conventions.* Y excellent integral noetherian; X_η smooth irreducible of dimension 1; Z_η étale over η. A nodal curve is flat with geometrically connected one-dimensional fibres whose only singularities are ordinary double points.

*Proof sketch.* Apply de Jong's Theorem 2.4 (Families of curves and alterations, 1997) to the triple (f, G = 1, Z): after an alteration of Y with group action and a stable-curve modification, the family becomes a projective semistable curve with disjoint sections through the smooth locus covering Z (de Jong 1997, 2.4 (i)–(vii)(a)); the extra boundary is T′ and the sections form D. Read off the stated properties (ILO IX 1.2); the stable modification is also available from AdicCoefficientsAndComparisonsPartII PA.5/stable-modification-existence. (de Jong 1997, Theorem 2.4 and Remark 2.5, pp. 602–603; ILO, Exposé IX, Théorème 1.2, p. 131 (printed).)

*Needs:* AdicCoefficientsAndComparisonsPartII PA.5 `stable-modification-existence`; AdicCoefficientsAndComparisonsPartII PA.0 `alteration`; SchemeAndStackFoundations Layer 4 (§§4.16–4.20); SchemeAndStackFoundations key `excellent-schemes`.

**Checks.**

- If f is already a smooth projective curve with Z a union of disjoint sections, G trivial and a, b identities work.
- For Y a trait and X a regular model with nodal special fibre, T′ is the closed point after base change.

**Theorem (Gabber's weak local uniformization theorem).** `weak-local-uniformization`. Let X be a noetherian quasi-excellent scheme and Z ⊂ X a nowhere dense closed subset. There is a finite family (X_i → X)_{i∈I}, covering for the alteration topology alt, such that each X_i is regular and connected and the preimage of Z in X_i is the support of a strict normal crossings divisor (possibly empty).

*Hypotheses and conventions.* X noetherian quasi-excellent (possibly of infinite dimension; the statement is local); Z nowhere dense.

*Proof sketch.* Reduce to X local, normal, complete of dimension d by EQ.0/uniformization-henselian-reduction and EQ.0/complete-local-reduction; argue by induction on d, the case d = 1 being normalisation (ILO VII 2.1–2.3). Realise X (after a finite cover) as the completion of a finite-type relative curve X′ → S over a regular local S of dimension d − 1 at a closed point, with Z coming from a rare closed subset (EQ.1/partial-algebraization-mixed-characteristic, geometric form; EQ.1/partial-algebraization-equal-characteristic). Apply EQ.2/de-jong-nodal-curve-alteration, uniformize the base by induction, and note that the resulting pair is log regular (AdicCoefficientsAndComparisonsPartII PA.4/log-regular-pair); resolve by Kato–Nizioł monoidal desingularization (PA.4/monoidal-desingularization; ILO VII 4.3). (ILO, Exposé VII, Théorème 1.1 and §§2–4, pp. 81–83 (printed); Exposé II, Théorème 4.3.1, p. 33.)

*Needs:* §EQ.0 `complete-local-reduction`; §EQ.0 `uniformization-henselian-reduction`; §EQ.1 `partial-algebraization-equal-characteristic`; §EQ.1 `partial-algebraization-mixed-characteristic`; §EQ.2 `de-jong-nodal-curve-alteration`; AdicCoefficientsAndComparisonsPartII PA.4 `log-regular-pair`; AdicCoefficientsAndComparisonsPartII PA.4 `monoidal-desingularization`; §EQ.0 `ell-prime-alteration-topology`.

**Checks.**

- For X regular and Z an snc support, the identity family works.
- For X the cone k[x, y, z]/(xy − z²) and Z the vertex, the blow-up of the vertex is an alt-covering family with regular source and exceptional divisor a smooth conic.

**Theorem (Gabber's prime-to-ℓ local uniformization theorem).** `prime-to-ell-local-uniformization`. Let X be a noetherian quasi-excellent scheme, Z ⊂ X a nowhere dense closed subset and ℓ a prime invertible on X. There is a finite family (p_i : X_i → X)_{i∈I}, covering for the topology alt_ℓ′ of ℓ′-alterations, such that each X_i is regular and connected and p_i^{-1}(Z) is the support of a strict normal crossings divisor.

*Hypotheses and conventions.* X noetherian quasi-excellent; ℓ invertible on X; Z nowhere dense.

*Proof sketch.* Reduce to X complete local normal of dimension d by EQ.0/uniformization-henselian-reduction and EQ.0/complete-local-reduction, by induction on d (ILO IX 1). Use the prime-to-ℓ partial algebraization (EQ.1/partial-algebraization-mixed-characteristic) and de Jong's equivariant nodal-curve alteration (EQ.2/de-jong-nodal-curve-alteration) with a group G; apply the induction hypothesis to Y′/H with H an ℓ-Sylow of G and use Abhyankar's lemma, reaching G an ℓ-group acting on log regular pairs (ILO IX 1.2–2.1, VI 1.9, 2.1). Make the action very tame by Gabber's equivariant modification theorem (AdicCoefficientsAndComparisonsPartII PA.4/gabber-modification-absolute, ILO VIII 1.1), pass to the log regular quotient (PA.4/very-tame-quotient) and resolve it by monoidal desingularization (PA.4/monoidal-desingularization) (ILO IX 2.3). (ILO, Exposé IX, Théorème 1.1 and §2 (Théorème 2.3), pp. 131–134 (printed); Exposé II, Théorème 4.3.2, p. 33; Exposé 0, Théorème 2.)

*Needs:* §EQ.0 `complete-local-reduction`; §EQ.0 `uniformization-henselian-reduction`; §EQ.1 `partial-algebraization-mixed-characteristic`; §EQ.1 `partial-algebraization-equal-characteristic`; §EQ.2 `de-jong-nodal-curve-alteration`; §EQ.1 `cohen-gabber-mixed-characteristic`; AdicCoefficientsAndComparisonsPartII PA.4 `gabber-modification-absolute`; AdicCoefficientsAndComparisonsPartII PA.4 `very-tame-quotient`; AdicCoefficientsAndComparisonsPartII PA.4 `monoidal-desingularization`; AdicCoefficientsAndComparisonsPartII PA.4 `log-regular-pair`; §EQ.0 `ell-prime-alteration-topology`.

**Checks.**

- For ℓ not dividing any generic degree in the weak family, the weak uniformization family is already alt_ℓ′-covering.
- For X the quotient 𝔸²/μ_ℓ by (x, y) ↦ (ζx, ζ^{-1}y) over a field of characteristic ≠ ℓ, the quotient map of degree ℓ is not allowed; the minimal resolution of the A_{ℓ−1} singularity is an alt_ℓ′-covering modification.

**Theorem (Hypercoverings by regular schemes with snc boundary).** `regular-alteration-hypercover`. Let X be a noetherian quasi-excellent scheme, Z ⊂ X a closed subset with dense complement U, and N ≥ 0. There is a hypercovering ε : X_• → X for the alteration topology (resp. for alt_ℓ′ with ℓ invertible on X) such that for every i ≤ N the scheme X_i is regular (a finite disjoint union of regular connected schemes) and the preimage of Z in X_i is the support of a strict normal crossings divisor, so that U_i = U ×_X X_i is the complement of an snc divisor. The X_i may be chosen affine.

*Hypotheses and conventions.* X noetherian quasi-excellent; Z rare; ℓ invertible on X for the alt_ℓ′ version; only the truncation in degrees ≤ N is controlled.

*Proof sketch.* Deligne's inductive construction of hypercoverings (Hodge III §6.2): at each stage cover the relevant fibre product (cosk_n X_•)_{n+1}, an object of alt/X, by EQ.2/weak-local-uniformization (resp. EQ.2/prime-to-ell-local-uniformization) applied with the preimage of Z and of the degeneracy loci. Zariski-refine each stage to affine pieces (ILO XIII 2.2.2, XV 3.1.2). (ILO, Exposé XIII, Théorème 2.2.2, p. 196 (printed); Exposé XV, 3.1.2, p. 222 (printed).)

*Needs:* §EQ.2 `weak-local-uniformization`; §EQ.2 `prime-to-ell-local-uniformization`; §EQ.0 `ell-prime-alteration-topology`; §EQ.0 `alteration-category`.

**Checks.**

- For X regular with Z an snc support, the constant hypercovering X_• = X works.
- The truncation level N must be at least q + 1 to control cohomology in degree q (ILO XIII 2.2.1–2.2.3).

### Dependencies

This layer requires EQ.0, EQ.1, AdicCoefficientsAndComparisonsPartII PA.4, AdicCoefficientsAndComparisonsPartII PA.5, SchemeAndStackFoundations Layer 4 (§§4.16–4.20).

## Layer EQ.3: Oriented products and oriented cohomological descent

Deligne's oriented product of topoi for general bases, base change for tubes, the oriented alteration topology, oriented proper acyclicity, oriented cohomological descent and the base change formula along alteration hypercoverings.

Key objects and theorems: Oriented product of topoi; Oriented cohomological descent.

**Construction (Deligne's oriented product of topoi).** `oriented-product-topos`. Let f : X → S and g : Y → S be morphisms of topoi, with defining sites C_1, C_2, D having finite limits and f^*, g^* induced by continuous finite-limit-preserving functors. The oriented product X ←×_S Y is the topos of sheaves on the site C whose objects are triples (U → V ← W) with V ∈ D, U ∈ C_1, W ∈ C_2 and maps U → f^*V, g^*V ← W, with the topology generated by (a) coverings in the U variable, (b) coverings in the W variable, and (c) the maps (U → V′ ← W ×_V V′) → (U → V ← W) for V′ → V in D such that U → f^*V factors through f^*V′. It carries projections p_1 : X ←×_S Y → X, p_2 : X ←×_S Y → Y and a canonical 2-morphism τ : g p_2 ⇒ f p_1. For schemes it is applied to the étale topoi; for S a henselian trait, X_s ←×_S η is LefschetzPencilsAndVanishingCycles LPV.0's oriented product.

*Hypotheses and conventions.* Sites with finite projective limits; coverings given by pretopologies; f^*, g^* continuous and left exact on sites.

*Uses.*
- ILO XI 2.4: the tube base change theorem for oriented products.
- ILO XII 1.2.1 and 2.2.1: oriented proper acyclicity and oriented cohomological descent.
- ILO XIII §2: constructibility of Rj_* via generic constructibility and oriented descent.

*API.*
- `OrientedProduct` (data): The oriented product topos X ←×_S Y.
- `OrientedProduct.fst` (projection): The projection p_1 to X.
- `OrientedProduct.snd` (projection): The projection p_2 to Y.
- `OrientedProduct.twoCell` (data): The 2-morphism τ : g p_2 ⇒ f p_1.
- `OrientedProduct.lift` (universal-property): A morphism T → X ←×_S Y is a triple (a : T → X, b : T → Y, t : g b ⇒ f a); lift composes with fst, snd, twoCell to the given data, uniquely up to unique isomorphism.
- `OrientedProduct.map` (functoriality): Functoriality in (f, g) over a morphism of bases, with map_id and map_comp up to coherent isomorphism (ILO XI 1.9).
- `OrientedProduct.coherent` (instance): If X, Y, S and f, g are coherent then so are the oriented product and its projections (ILO XI Lemme 2.5).

*Unit tests.*
- `OrientedProduct.test_point_base` (degenerate): If S is the punctual topos, X ←×_S Y is the product topos X × Y and τ is the identity.
- `OrientedProduct.test_trait` (compatibility): For S a strictly henselian trait with closed point s and geometric generic point η̄, (X_s) ←×_S η̄ agrees with the oriented product of LefschetzPencilsAndVanishingCycles LPV.0/oriented-product-comparison, with the same stalk formula RΓ(X_(x) ×_{S_(f(x))} η̄, K).
- `OrientedProduct.test_points` (computation): For X = Y = S = Spec of a strictly henselian trait, the points of X ←×_S S are pairs (x, y) with y specializing to x: three points (s, s), (η, η), (s, η).
- `OrientedProduct.test_not_fibre_product` (non-example): For X = Y = S = the étale topos of a strictly henselian trait, X ←×_S S is not S ×_S S = S: it has the extra point (s, η).

*Construction.* Define the site and check the sheaf condition reduces to (a), (b) and bijectivity along (c) (ILO XI 1.1–1.2). Construct p_1, p_2, τ and the universal property: morphisms T → X ←×_S Y correspond to triples (a, b, t) with t : g b ⇒ f a (ILO XI 1.3–1.7). Points are triples (x, y, a specialization g(y) ⇝ f(x)); compare with the trait case of LPV.0/oriented-product-comparison. (ILO, Exposé XI, §1 (1.1–1.9, Définition 1.7), pp. 171–176 (printed).)

*Needs:* LefschetzPencilsAndVanishingCycles LPV.0 `oriented-product-comparison`; EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`; Mathlib `AlgebraicGeometry.Scheme.smallEtaleTopology`.

**Checks.**

- For S a point, X ←×_S Y = X × Y (product topos).
- For X → S the identity of the étale topos of a strictly henselian trait and Y = η̄, the oriented product has the vanishing-topos description of LPV.0.

**Theorem (Base change for tubes of oriented products).** `tube-base-change`. Let f : X → S and g : Y → S be coherent morphisms of coherent topoi, T = X ←×_S Y with projections p_1, p_2 and τ : g p_2 ⇒ f p_1, and Λ a ring. For every F ∈ D⁺(Y, Λ) the base change map f^*Rg_*F → Rp_{1*}p_2^*F deduced from τ is an isomorphism in D⁺(X, Λ).

*Hypotheses and conventions.* X, Y, S coherent topoi and f, g coherent morphisms (SGA 4 VI).

*Proof sketch.* T is coherent and p_1, p_2 are coherent (ILO XI Lemme 2.5). Check the isomorphism on points of X; at a point x the stalk of Rp_{1*}p_2^*F is the cohomology of the tube over x, computed as a filtered colimit over neighbourhoods, which matches the stalk of f^*Rg_*F (ILO XI 2.4, proof). (ILO, Exposé XI, Théorème 2.4 and Lemme 2.5, pp. 178–179 (printed).)

*Needs:* §EQ.3 `oriented-product-topos`; EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`.

**Checks.**

- For S a point, the statement is the Künneth-free identity f^*Rg_*F = Rp_{1*}p_2^*F for the product with a point.
- For schemes, at a geometric point x of X, the stalk is RΓ(Y ×_S S_(f(x)), F): cohomology of the 'Milnor tube' over the strict henselisation.

**Definition (The oriented alteration topology on diagrams X → S ← Y).** `oriented-alteration-topology`. Let B be the category of diagrams (X → S ← Y) of noetherian schemes, with morphisms the commutative ladders; finite limits and coproducts in B are computed termwise. The oriented alteration topology on B is generated by the families: (i) (X → S ← Y_i) → (X → S ← Y) for an alteration covering (Y_i → Y); (ii) (X_i → S ← Y) → (X → S ← Y) for an alteration covering (X_i → X); (iii) (X ×_S S_i → S_i ← Y ×_S S_i) → (X → S ← Y) for an alteration covering (S_i → S); (iv) (X → S′ ← Y ×_S S′) → (X → S ← Y) for S′ → S proper through which X → S factors; (v) (X ×_S S′ → S′ ← Y) → (X → S ← Y) for S′ → S étale through which Y → S factors (ILO XII 2.1.1–2.1.2). An oriented alteration hypercovering of (X → S ← Y) is a simplicial object (X_• → S_• ← Y_•) of B whose coskeleton maps are coverings for this topology; its augmentation induces ←ε : Y_• ←×_{S_•} X_• → Y ←×_S X.

*Hypotheses and conventions.* Noetherian schemes; X → S coherent; the families are stable under base change in B.

*Uses.*
- ILO XII 2.2.1: oriented cohomological descent along such hypercoverings.
- ILO XII 2.2.4, XIII 2.2.3, XV 2.2.2: base change formula for alteration hypercoverings of the base.

*API.*
- `OrientedAltSite` (data): The category B of diagrams X → S ← Y with the oriented alteration topology.
- `OrientedAltSite.ofAltHypercover` (constructor): An alt hypercovering S_• → S gives an oriented hypercovering (X ×_S S_• → S_• ← Y ×_S S_•).
- `OrientedAltSite.augmentation` (projection): The induced morphism of oriented product topoi ←ε.
- `OrientedAltSite.baseChange` (functoriality): Coverings are stable under base change in B.

*Unit tests.*
- `OrientedAltSite.test_trivial` (degenerate): The identity of (X → S ← Y) is a covering and the constant hypercovering has ←ε an equivalence.
- `OrientedAltSite.test_proper_base` (computation): For S′ → S the blow-up of the origin of S = 𝔸²_k, X = S′ and Y = S, the map (S′ → S′ ← S′) → (S′ → S ← S) is of type (iv), hence covering, although S′ → S is not étale.
- `OrientedAltSite.test_zariski_Y` (characterisation): A Zariski covering (Y_i → Y) is an alteration covering, so (X → S ← Y_i) → (X → S ← Y) is a covering family of type (i).
- `OrientedAltSite.test_not_cover` (non-example): For a closed immersion Y′ → Y that is not surjective, (X → S ← Y′) → (X → S ← Y) is not covering: the points of the oriented product over Y − Y′ are missed.

*Construction.* Define B and the five families; check stability under base change (ILO XII 2.1.2). Define hypercoverings and the induced morphism of oriented products by functoriality (EQ.3/oriented-product-topos). (ILO, Exposé XII, §2.1 (2.1.1–2.1.2), pp. 190–191 (printed).)

*Needs:* §EQ.3 `oriented-product-topos`; §EQ.0 `ell-prime-alteration-topology`.

**Checks.**

- A diagram with S = X and Y = X proper over S: the topology restricted to (i) is the alteration topology of X.
- An alteration hypercovering S_• → S induces an oriented alteration hypercovering (X ×_S S_• → S_• ← Y ×_S S_•) (used in ILO XII 2.2.4).

**Theorem (Oriented acyclicity of proper morphisms).** `oriented-proper-acyclicity`. Let S be a coherent scheme, g : Y → S, π : S′ → S proper, a : X → S′ coherent, b = π a, Y′ = Y ×_S S′ with g′ : Y′ → S′ and ρ : Y′ → Y. The induced morphism ←ρ : Y′ ←×_{S′} X → Y ←×_S X of oriented products is acyclic for torsion sheaves: for every torsion abelian sheaf (more generally bounded below torsion complex) F on Y ←×_S X, F → R←ρ_* ←ρ^* F is an isomorphism; and it is 1-acyclic for ind-finite stacks.

*Hypotheses and conventions.* π proper; coefficients torsion; schemes coherent.

*Proof sketch.* Reduce by the tube base change theorem (EQ.3/tube-base-change) to a statement on strictly henselian local bases. Conclude by proper base change for torsion coefficients (EtaleCohomologyFoundations §F.2, through EtaleDualityAndPerverseSheaves EDC.0) and Gabber's affine proper base change for henselian pairs (ArcTopologyAndDescent AT.8/gabber-affine-proper-base-change) (ILO XII 1.2.1–1.2.2). (ILO, Exposé XII, Théorèmes 1.2.1–1.2.2, p. 189 (printed).)

*Needs:* §EQ.3 `tube-base-change`; §EQ.3 `oriented-product-topos`; ArcTopologyAndDescent AT.8 `gabber-affine-proper-base-change`; EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`.

**Checks.**

- For π an isomorphism, ←ρ is an equivalence.
- This generalizes invariance of the tubular neighbourhood under admissible blow-ups (ILO XI 1.7, 2.8).

**Theorem (Oriented cohomological descent).** `oriented-cohomological-descent`. Let (X_• → S_• ← Y_•) → (X → S ← Y) be a hypercovering for the oriented alteration topology, with augmentation ←ε : T_• = Y_• ←×_{S_•} X_• → T = Y ←×_S X. For every bounded below torsion complex K on T, the adjunction K → R←ε_* ←ε^* K is an isomorphism; for every ind-finite stack C on T, C → ←ε_* ←ε^* C is an equivalence.

*Hypotheses and conventions.* Noetherian schemes; torsion coefficients; bounded below complexes.

*Proof sketch.* By general descent theory (Deligne, Hodge III 5.3.5) reduce to 0-coskeleta of single covering families of types (i)–(v), and to Zariski coverings or proper surjections for the alteration coverings (ILO XII 2.3.1). Type (iv) is EQ.3/oriented-proper-acyclicity; types (i), (ii), (v) follow from proper and étale cohomological descent (SchemeAndStackFoundations §2.16) through the tube description; type (iii) combines them (ILO XII 2.3). (ILO, Exposé XII, Théorème 2.2.1 and §2.3, pp. 191–194 (printed).)

*Needs:* §EQ.3 `oriented-alteration-topology`; §EQ.3 `oriented-proper-acyclicity`; §EQ.3 `tube-base-change`; SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16).

**Checks.**

- For the constant hypercovering the statement is trivial.
- For S_• → S the Čech nerve of a proper surjection S′ → S with X = S, Y = S, it recovers proper cohomological descent on S.

**Theorem (Base change formula for alteration hypercoverings).** `alteration-hypercover-base-change`. Let X —f→ S ←g— Y be noetherian schemes and ε : S_• → S an alteration hypercovering, with f_• : X_• = X ×_S S_• → S_•, g_• : Y_• = Y ×_S S_• → S_• and ε_Y : Y_• → Y. For every bounded below torsion complex K on X, the natural map g^*Rf_*K → Rε_{Y*}(g_•^*Rf_{•*}(K|X_•)) is an isomorphism; for every ind-finite stack C on X, g^*f_*C → ε_{Y*}(g_•^*f_{•*}(C|X_•)) is an isomorphism.

*Hypotheses and conventions.* Noetherian schemes; torsion coefficients.

*Proof sketch.* Express both sides through oriented products with EQ.3/tube-base-change and apply EQ.3/oriented-cohomological-descent to the induced oriented hypercovering (EQ.3/oriented-alteration-topology) (ILO XII 2.4). Typical use: Y = Z a closed subscheme of the base, so the restriction of Rj_* to Z is computed from the restrictions over a hypercovering (ILO XIII 2.2.3, XV 2.2.2). (ILO, Exposé XII, Théorème 2.2.4 and §2.4, pp. 192–194 (printed).)

*Needs:* §EQ.3 `oriented-cohomological-descent`; §EQ.3 `tube-base-change`; §EQ.3 `oriented-alteration-topology`.

**Checks.**

- For S_• constant the map is the identity.
- For X = U ⊂ S open, g : Z → S the closed complement and S_• regular with snc preimage of Z, the right side is computed from Rj_{•*}Λ, which absolute purity describes.

### Dependencies

This layer requires EQ.0, LefschetzPencilsAndVanishingCycles §0.10 (absolute purity), EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3), SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16), ArcTopologyAndDescent AT.8.

## Layer EQ.4: Gabber's finiteness theorem

Constructibility and boundedness of higher direct images along finite-type morphisms to noetherian quasi-excellent schemes, with coefficients invertible on the base.

Key objects and theorems: Gabber's finiteness theorem.

**Theorem (Constructibility of direct images via weak uniformization).** `constructibility-via-weak-uniformization`. Let X be a noetherian quasi-excellent scheme, f : Y → X a morphism of finite type, n ≥ 1 invertible on X and F a constructible sheaf of ℤ/n-modules on Y. Then every R^q f_*F is constructible.

*Hypotheses and conventions.* X noetherian quasi-excellent; n invertible on X; f of finite type; F constructible.

*Proof sketch.* Classical reductions (SGA 4 XVI 4.5): to F = ℤ/ℓ constant (SGA 4 IX 2.14 and the trace method) and to f an open immersion j : U → X (ILO XIII 2.1.1–2.1.2). By the constructibility criterion (SGA 4 IX 2.4 (v)) it suffices that for every closed immersion g : Z → X, g^*R^q j_*ℤ/ℓ is constructible over a dense open of Z. Take an alteration hypercovering X_• → X regular with snc preimage of Z in degrees ≤ q + 1 (EQ.2/regular-alteration-hypercover); absolute purity (LefschetzPencilsAndVanishingCycles §0.10) makes g_•^*Rj_{•*}ℤ/ℓ constructible in those degrees. Deligne's generic constructibility (SGA 4½ [Th. finitude] 1.9 (i)) applied to the proper maps Z_p → Z gives a dense open of Z where the truncated descent complex is constructible, and the base change formula EQ.3/alteration-hypercover-base-change identifies it with g^*Rj_*ℤ/ℓ (ILO XIII 2.2.3). (ILO, Exposé XIII, §2 (2.1–2.2, Théorème 2.2.2), pp. 195–197 (printed).)

*Needs:* §EQ.2 `regular-alteration-hypercover`; §EQ.3 `alteration-hypercover-base-change`; §EQ.2 `weak-local-uniformization`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.0 `constructible-ctf-complexes`; EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3).

**Checks.**

- For X of finite type over a field this recovers Deligne's finiteness theorem of SGA 4½ for open immersions.
- ILO XIX 2.2 gives an open immersion of noetherian (not quasi-excellent) schemes with R¹j_*ℤ/2 not constructible, so quasi-excellence cannot be dropped.

**Theorem (Gabber's finiteness theorem).** `gabber-finiteness-theorem`. Let X be a noetherian quasi-excellent scheme, f : Y → X a morphism of finite type, n ≥ 1 invertible on X and F a constructible sheaf of ℤ/n-modules on Y. Then (i) every R^q f_*F is constructible, and (ii) there is an integer N with R^q f_*F = 0 for q ≥ N. Equivalently Rf_* : D⁺(Y_ét, ℤ/n) → D⁺(X_ét, ℤ/n) carries D^b_c(Y_ét, ℤ/n) into D^b_c(X_ét, ℤ/n).

*Hypotheses and conventions.* X noetherian quasi-excellent (possibly of infinite Krull dimension); n invertible on X.

*Proof sketch.* Part (i) is EQ.4/constructibility-via-weak-uniformization; the proof of both parts at once proceeds by induction on c of the statement (P_c): for an open immersion j : U → X and K ∈ D^b_c(U), Rj_*K is constructible and bounded outside a closed subset of codimension ≥ c (ILO XIII 3.1). Inductive step: by prime-to-ℓ uniformization (EQ.2/prime-to-ell-local-uniformization) in the standard form of EQ.0/standard-form-covers (proper birational, Nisnevich, finite flat of degree prime to ℓ), compare the defect complexes ψ along the three kinds of maps; the finite flat step is split by the trace since the degree is prime to ℓ (ILO XIII 3.2–3.5). On the regular schemes with snc boundary at the top, Rj_*Λ is constructible and bounded by absolute purity (ILO XIII 3.6.2); reduce from K to constant coefficients (ILO XIII 3.7). (ILO, Exposé XIII, Théorème 1.1.1, 1.1.2 and §3, pp. 195 and 198–204 (printed); Exposé 0, Théorème 1.)

*Needs:* §EQ.4 `constructibility-via-weak-uniformization`; §EQ.2 `prime-to-ell-local-uniformization`; §EQ.0 `standard-form-covers`; §EQ.2 `regular-alteration-hypercover`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.0 `constructible-ctf-complexes`.

**Checks.**

- For f proper this is the proper finiteness theorem with no hypothesis on X.
- For X = Spec of a strictly henselian regular local ring of dimension d and j the complement of an snc divisor with r branches, Rj_*ℤ/n has cohomology in degrees 0, …, r only (exterior algebra), in accordance with (ii).

### Dependencies

This layer requires EQ.0, EQ.2, EQ.3, LefschetzPencilsAndVanishingCycles §0.10 (absolute purity), EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3).

## Layer EQ.5: Dimension functions, the affine Lefschetz theorem and cohomological dimension

Gabber's dimension functions with their existence and induced versions, regular base change, Gabber's affine Lefschetz theorem over a trait and over quasi-excellent bases, its local form, and Gabber's bound 2d − 1 on the cohomological dimension of opens of strictly local schemes.

Key objects and theorems: Dimension function; Gabber's affine Lefschetz over a trait; Affine Lefschetz theorem; Gabber's cohomological dimension bound.

**Definition (Dimension functions).** `dimension-function`. Let X be a locally noetherian scheme. For points x, y of X with geometric points x̄, ȳ, a specialization x̄ ⇝ ȳ is an X-morphism X_(x̄) → X_(ȳ) of strict henselizations (equivalently an X-morphism x̄ → X_(ȳ)); it has codimension r if the closure in X_(ȳ) of the image of x̄ has dimension r. y is an étale immediate specialization of x if some x̄ ⇝ ȳ has codimension 1. A dimension function on X is a map δ : X → ℤ such that δ(y) = δ(x) − 1 whenever y is an étale immediate specialization of x. For a sheaf G on X, δ(G) = sup{δ(x) : G_x̄ ≠ 0} (−∞ for G = 0).

*Hypotheses and conventions.* X locally noetherian; the notion depends only on X_red. Sign convention: generizations have larger δ (as in ILO XIV 2.1.8 and XVII 2.1.1).

*Uses.*
- ILO XV 1.1.2: the affine Lefschetz bound δ_X(R^q f_*F) ≤ f^*δ_X(F) − q is phrased with dimension functions.
- ILO XVII 2.1.2: potential dualizing complexes are pinned by Λ(δ(x))[2δ(x)] at every point.
- ILO XVII 5.2: K_X lies in the heart of Gabber's perverse t-structure for the perversity −2δ.
- EtaleDualityAndPerverseSheaves EDC.5/point-dimension-function: for finite-type schemes over a field the middle perversity uses δ(x) = dim of the closure of x, a dimension function.

*API.*
- `DimensionFunction` (data): The set of dimension functions on X, as functions X → ℤ.
- `DimensionFunction.etaleRestrict` (functoriality): Composition with an étale U → X gives a dimension function on U; dimension functions on étale X-schemes form an étale sheaf.
- `DimensionFunction.sub_locallyConstant` (relation): The difference of two dimension functions is locally constant; dimension functions form a torsor under locally constant ℤ-valued functions wherever one exists.
- `DimensionFunction.ofStrictLocal` (constructor): On a strictly local X with closed point x, t ↦ dim of the closure of t is the unique dimension function vanishing at x (ILO XIV 2.4.5).
- `DimensionFunction.negCodim` (constructor): On an integral universally catenary X, x ↦ −dim O_{X,x} is a dimension function (ILO XIV 2.2.2).
- `DimensionFunction.ofFiniteType` (constructor): On X of finite type over a field or over ℤ, or local universally catenary, x ↦ dim of the closure of x is a dimension function (ILO XIV 2.4.5).
- `DimensionFunction.supSheaf` (other): δ(G) for a sheaf G, with δ(G) ≤ δ(H) when G is a subquotient of H.

*Unit tests.*
- `DimensionFunction.test_trait` (computation): On a strictly henselian trait S with closed point s and generic point η, δ(s) = 0 and δ(η) = 1 define a dimension function, and every dimension function is δ + c for an integer c.
- `DimensionFunction.test_field` (degenerate): On Spec k every function is a dimension function (there are no immediate specializations).
- `DimensionFunction.test_affine_line_over_trait` (non-example): On 𝔸¹_R over a trait R, x ↦ dim of the closure of x is not a dimension function: the closed point (πt − 1) has dimension 0 while the generic point has dimension 2 although the specialization is immediate; x ↦ −dim O_{X,x} is one.
- `DimensionFunction.test_line_plane` (non-example): For X the union of a line and a plane meeting at a point, x ↦ −dim O_{X,x} is not a dimension function (ILO XIV 2.2.3).
- `DimensionFunction.test_finite_type_field` (compatibility): For X of finite type over a field, x ↦ dim of the closure of x is a dimension function and agrees with EtaleDualityAndPerverseSheaves EDC.5/point-dimension-function.

*Construction.* Definition (ILO XIV 2.1.1–2.1.2, 2.1.8); étale immediate specializations are detected on strict henselizations of the closure (ILO XIV 2.1.3) and, for quasi-excellent X, on the completion (ILO XIV 2.1.7). (ILO, Exposé XIV, Définitions 2.1.1–2.1.2 and 2.1.8, Remarque 2.2.3, Corollaire 2.4.5, pp. 209–216 (printed); Exposé XVII, Définition 2.1.1, p. 263.)

*Needs:* SchemeAndStackFoundations key `henselization`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21); Mathlib `ringKrullDim`; EtaleDualityAndPerverseSheaves EDC.5 `point-dimension-function`.

**Checks.**

- On a strictly henselian trait, δ(s) = 0, δ(η) = 1 is the dimension function vanishing at the closed point.
- On 𝔸¹ over a trait R with uniformizer π, the closed point x = (πt − 1) is an immediate specialization of the generic point while dim of its closure is 0 and that of the generic point is 2; δ = dim of closure fails, δ = −dim O_{X,x} works.

**Theorem (Existence of dimension functions).** `dimension-function-existence`. (1) (Gabber) A noetherian scheme is universally catenary if and only if it admits a dimension function Zariski-locally. (2) (Gabber) Every quasi-excellent scheme admits dimension functions étale-locally, and they form an étale torsor under the sheaf of locally constant ℤ-valued functions. (3) On a normal quasi-excellent scheme, x ↦ −dim O_{X,x} is a dimension function.

*Hypotheses and conventions.* Noetherian (1); quasi-excellent (2), (3).

*Proof sketch.* (1) ⇒: on an integral universally catenary scheme −dim O is a dimension function, and the local choices on components glue on an open neighbourhood (ILO XIV 2.2.2, 2.2.4). ⇐: a dimension function forces catenarity (ILO XIV 2.2.5), and then Ratliff's theorem on formal catenarity of henselian local rings gives universal catenarity (ILO XIV 1.2.2, 1.3.1, 2.2.6). (3) for normal quasi-excellent X: the henselisation is quasi-excellent and universally catenary (ILO XIV 1.3.2) and unibranch, so Zariski and étale immediate specializations agree (ILO XIV 2.3.3). (2) glue over irreducible components étale-locally (ILO XIV 2.3.2) and reduce to normal integral X via the normalisation (ILO XIV 2.3.4–2.3.5). (ILO, Exposé XIV, Théorèmes 2.2.1 and 2.3.1, Propositions 2.2.2, 2.2.6, 2.3.3, pp. 212–214 (printed).)

*Needs:* §EQ.5 `dimension-function`; SchemeAndStackFoundations SF.0 `quasi-excellent-scheme`; SchemeAndStackFoundations key `excellent-schemes`; SchemeAndStackFoundations key `henselization`; SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21).

**Checks.**

- Nagata's catenary but not universally catenary local domain (EGA IV 5.6.11, ILO XIV 2.6) has no dimension function Zariski-locally, by (1).
- A strictly henselian trait is excellent and has dimension functions globally.

**Theorem (Dimension functions induced along finite-type and regular morphisms).** `induced-dimension-function`. Let δ_X be a dimension function on a noetherian scheme X. (1) For f : Y → X of finite type, δ_Y(y) = δ_X(f(y)) + trdeg(κ(y)/κ(f(y))) is a dimension function on Y (written f^*δ_X). (2) For f : Y → X a regular morphism of excellent schemes, δ_Y(y) = δ_X(f(y)) − dim O_{Y_{f(y)}, y} is a dimension function on Y.

*Hypotheses and conventions.* (1) f of finite type, X noetherian with a dimension function; (2) f regular (flat with geometrically regular fibres) between excellent schemes.

*Proof sketch.* (1) Reduce to X, Y integral and f dominant; X is universally catenary by EQ.5/dimension-function-existence, so δ_X = −dim O_X + const, and the dimension formula (Matsumura 14.C) gives δ_Y = −dim O_Y + trdeg(κ(Y)/κ(X)) + const (ILO XIV 2.5.1–2.5.2). (2) Work strictly locally; δ_Y minus any dimension function on Y is constant on the regular, hence connected (EQ.5/regular-base-change applied to H⁰), fibres, and constant along immediate specializations of X by the Hauptidealsatz (ILO XIV 2.5.4). (ILO, Exposé XIV, Proposition 2.5.1, Corollaire 2.5.2 and Proposition 2.5.4, pp. 216–218 (printed); Exposé XVII, Propositions 4.1.1–4.1.2, p. 280.)

*Needs:* §EQ.5 `dimension-function`; §EQ.5 `dimension-function-existence`.

**Checks.**

- For f : 𝔸¹_k → Spec k with δ = 0 on the base, (1) gives δ(η) = 1 and δ(closed point) = 0.
- For the completion map Spec Â → Spec A of an excellent local ring with δ(closed point) = 0, (2) gives the dimension function of Spec Â vanishing at its closed point.

**Theorem (Base change along regular morphisms).** `regular-base-change`. Consider a cartesian square T′ = T ×_S S′ with f : T → S quasi-compact and quasi-separated, g : S′ → S a regular morphism of noetherian schemes, f′ : T′ → S′ and g′ : T′ → T. For n invertible on S and every sheaf F of ℤ/n-modules on T, the base change map g^*Rf_*F → Rf′_*g′^*F is an isomorphism.

*Hypotheses and conventions.* g regular between noetherian schemes; f qcqs; n invertible on S.

*Proof sketch.* Popescu: write S′ as a filtered limit of smooth S-schemes S_i (SchemeAndStackFoundations §0.15). Smooth base change (SGA 4 XVI 1.2; EtaleCohomologyFoundations §F.2) along each S_i → S and passage to the limit in étale cohomology (SGA 4 VII 5.11; SchemeAndStackFoundations §2.15) (ILO XIV 2.5.3). (ILO, Exposé XIV, Lemme 2.5.3, pp. 216–217 (printed).)

*Needs:* SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21); SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16); EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`.

**Checks.**

- For S′ = Spec Â → S = Spec A the completion of an excellent local ring, the cohomology of an open U ⊂ Spec A agrees with that of U ×_A Â for coefficients invertible on A (used in ILO XV 1.2.5).
- For g smooth this is smooth base change.

**Theorem (Gabber's affine Lefschetz theorem over a trait).** `gabber-trait-affine-lefschetz`. Let S be a trait with the dimension function δ_S(η) = 1, δ_S(s) = 0, X a scheme of finite type over S with the induced dimension function δ_X (EQ.5/induced-dimension-function), f : Y → X an affine morphism of finite type and n invertible on S. For every constructible sheaf F of ℤ/n-modules on Y and every q, δ_X(R^q f_*F) ≤ f^*δ_X(F) − q. In particular, for a strictly local scheme X′ essentially of finite type over S of dimension d and an affine open U ⊂ X′, H^q(U, ℤ/n) = 0 for q > d.

*Hypotheses and conventions.* S a trait (henselian is the case used); X of finite type over S; n invertible on S.

*Proof sketch.* Gabber's proof (1994), written in Illusie, Perversité et variation, Manuscripta Math. 112 (2003), §2, Théorème 2.4: reduce to an open immersion and constant coefficients, alter X by de Jong's semistable alteration over the trait, compute Rj_* on strictly semistable models by absolute purity, and descend (SchemeAndStackFoundations §4.20; LefschetzPencilsAndVanishingCycles §0.10). The essentially-finite-type local statement follows by passage to the limit (ILO XV 3.3.2). (ILO, Exposé XV, Remarque 1.1.3 and §3.3.2, pp. 219 and 224 (printed), citing Illusie 2003, 2.4.)

*Needs:* §EQ.5 `induced-dimension-function`; EtaleDualityAndPerverseSheaves EDC.4 `affine-vanishing-hypercohomology`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); SchemeAndStackFoundations Layer 4 (§§4.16–4.20); EtaleDualityAndPerverseSheaves EDC.0 `constructible-ctf-complexes`.

**Checks.**

- For X of finite type over a field (the closed fibre), this is the affine Lefschetz theorem SGA 4 XIV 3.1 (EtaleDualityAndPerverseSheaves EDC.4/affine-vanishing-hypercohomology).
- For X = S strictly henselian and f the (affine) inclusion of the generic point η, R¹f_*ℤ/n is the skyscraper ℤ/n(−1) at s, with δ = 0 = δ(η) − 1, so the bound is attained.

**Theorem (Gabber's affine Lefschetz theorem).** `affine-lefschetz-theorem`. Let X be a quasi-excellent scheme with a dimension function δ_X, f : Y → X an affine morphism of finite type and n invertible on X. For every constructible sheaf F of ℤ/n-modules on Y and every q, δ_X(R^q f_*F) ≤ f^*δ_X(F) − q, where f^*δ_X is the induced dimension function of EQ.5/induced-dimension-function. Equivalently, for X strictly local quasi-excellent with δ_X(t) = dim of the closure of t, H^q(Y, F) = 0 for q > f^*δ_X(F).

*Hypotheses and conventions.* X quasi-excellent with a dimension function; f affine of finite type; n invertible on X; F constructible.

*Proof sketch.* Reformulate stalkwise at geometric points and reduce to the strictly local statement; reduce to an affine open immersion and constant coefficients by SGA 4 XIV 4.4 and the trace method (ILO XV 1.2.1–1.2.4). Reduce to X complete by regular base change along the completion (EQ.5/regular-base-change, ILO XV 1.2.5). Take an alteration hypercovering X_• with regular terms and snc boundary in degrees ≤ N (EQ.2/regular-alteration-hypercover); by absolute purity, the cohomology of U depends only on the combinatorics of the boundary along the closed fibre (ILO XV 2.1.7, 2.2.2–2.2.4, via EQ.3/alteration-hypercover-base-change). Approximate X_• over the henselisation of an affine space over a Cohen ring by Popescu (EQ.0/artin-popescu-approximation), keeping regularity and combinatorics; specialise along a section close to the identity to a scheme essentially of finite type over a trait, and conclude by EQ.5/gabber-trait-affine-lefschetz (ILO XV 3). (ILO, Exposé XV, Théorème 1.1.2 and §§1.2–3, pp. 219–224 (printed); Exposé 0, Théorème 7.)

*Needs:* §EQ.5 `gabber-trait-affine-lefschetz`; §EQ.5 `induced-dimension-function`; §EQ.5 `regular-base-change`; §EQ.2 `regular-alteration-hypercover`; §EQ.3 `alteration-hypercover-base-change`; §EQ.0 `artin-popescu-approximation`; §EQ.0 `standard-form-covers`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.0 `constructible-ctf-complexes`.

**Checks.**

- For X = Spec k (k separably closed) this is Artin vanishing H^q(Y, F) = 0 for q > dim Supp F on affine Y.
- For X a strictly henselian regular local scheme of dimension 2 and U = X − V(f), H^q(U, ℤ/n) = 0 for q > 2.

**Theorem (Local form of the affine Lefschetz theorem).** `affine-lefschetz-local`. Let X be a strictly local quasi-excellent scheme of dimension d, U ⊂ X an affine open and n invertible on X. Then H^q(U, ℤ/n) = 0 for q > d. More generally, for X henselian local quasi-excellent of dimension d with residue field k and ℓ invertible on X, cd_ℓ(U) ≤ d + cd_ℓ(k) for every affine open U; if X is integral with fraction field K, cd_ℓ(K) = d + cd_ℓ(k).

*Hypotheses and conventions.* X quasi-excellent; strictly local (first statement) or henselian local (second).

*Proof sketch.* Equivalent to EQ.5/affine-lefschetz-theorem for open immersions and constant coefficients (ILO XV 1.2.3–1.2.4). For henselian X combine with the Hochschild–Serre spectral sequence over the residue field (SchemeAndStackFoundations §2.15); the lower bound for K is SGA 4 X 2.5 (ILO Exposé 0, Corollaire 8). (ILO, Exposé XV, Corollaire 1.2.2 and Corollaire 1.2.4, p. 220 (printed); Exposé 0, Corollaire 8, p. 5.)

*Needs:* §EQ.5 `affine-lefschetz-theorem`; §EQ.5 `dimension-function`; SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16).

**Checks.**

- For X = Spec of a strictly henselian trait and U = η, H^q(η, ℤ/n) = 0 for q > 1 (the tame inertia is ℓ-cohomologically of dimension 1).
- For X = Spec W(k̄)⟦x⟧ with k̄ algebraically closed (d = 2) and U = X[1/p], H^q(U, ℤ/ℓ) = 0 for q > 2.

**Theorem (Gabber's bound on cohomological dimension).** `gabber-cohomological-dimension-bound`. Let X be a strictly local noetherian scheme of dimension d > 0 and ℓ a prime invertible on X. For every open U ⊂ X, cd_ℓ(U) ≤ 2d − 1. Consequently, if X is integral with fraction field K then cd_ℓ(K) ≤ 2d − 1; and for f : X′ → Y of finite type with Y noetherian of finite dimension, Rf_* has finite ℓ-cohomological dimension.

*Hypotheses and conventions.* X noetherian strictly local, not necessarily quasi-excellent; ℓ invertible.

*Proof sketch.* Punctured spectrum: by Gabber's formal base change (ArcTopologyAndDescent AT.8/open-henselian-completion) pass to the completion, which is excellent; cover U = X − {x} by d principal opens X_{f_i} and use the Čech spectral sequence with EQ.5/affine-lefschetz-local to get H^i(U, F) = 0 for i ≥ 2d (ILO XVIII-A Lemme 2.1). Coniveau spectral sequence: H^i_Y(X, F) = 0 for i > sup_{y∈Y}(cd_ℓ(κ(y)) + 2 dim O_{X,y}) (ILO XVIII-A Lemme 2.2). Induction on d using the restriction from U to dense opens V and the inductive bound for residue fields (ILO XVIII-A §2); the corollaries follow by limits and by the Čech reduction to affine f (ILO XVIII-A 1.2, 1.4). (ILO, Exposé XVIII-A, Théorème 1.1, Corollaires 1.2 and 1.4, Lemmes 2.1–2.2, pp. 331–334 (printed).)

*Needs:* §EQ.5 `affine-lefschetz-local`; ArcTopologyAndDescent AT.8 `open-henselian-completion`; SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16).

**Checks.**

- For d = 1 (strictly henselian trait), cd_ℓ(η) ≤ 1.
- Infinite-dimensional noetherian bases are excluded from the finiteness of cd(Rf_*); for X of finite dimension the bound complements EQ.4/gabber-finiteness-theorem (ii).

### Dependencies

This layer requires EQ.0, EQ.2, EQ.3, EtaleDualityAndPerverseSheaves EDC.4, EtaleDualityAndPerverseSheaves EDC.5 (middle perversity), LefschetzPencilsAndVanishingCycles §0.10 (absolute purity), SchemeAndStackFoundations Layer 0 (§§0.12–0.16, 0.21), SchemeAndStackFoundations Layer 2 (§§2.12, 2.15–2.16), SchemeAndStackFoundations Layer 4 (§§4.16–4.20), ArcTopologyAndDescent AT.8.

## Layer EQ.6: Dualizing complexes on excellent schemes and local duality

Transition morphisms of local cohomology, potential dualizing complexes, Gabber's perverse t-structures, existence, uniqueness and functoriality of potential dualizing complexes, biduality, Gabber's duality theorem, the normalised dualizing complex of a regular local ring, and local duality.

Key objects and theorems: Potential dualizing complex; Gabber's perverse t-structures; Gabber's duality theorem; Local duality.

**Construction (Transition morphisms for specializations).** `transition-morphism`. Let n ≥ 2, Λ = ℤ/n and X a noetherian excellent ℤ[1/n]-scheme. For a geometric point x̄ over x ∈ X and K ∈ D⁺(X_ét, Λ) put RΓ_x̄(K) := (i_x^!(K|X_(x)))_x̄, the cohomology with supports in the closed point of the strict localization, with cohomology H^i_x̄(K). For every specialization ȳ ⇝ x̄ of codimension c there is a transition morphism sp_{ȳ→x̄} : RΓ_ȳ(K) → RΓ_x̄(K)(c)[2c] in D⁺(Λ), natural in K. For c = 1 it is defined on the normalisation of the closure of ȳ in X_(x̄), a strictly henselian trait with tame inertia G ≅ Ẑ′(1): RΓ_s(K) is computed by the complex K_s → K_η̄^S → Hom_{Λ⟦G⟧}(I_G, K_η̄^S) (S the wild inertia, I_G the augmentation ideal, free of rank one on 1 − σ), and the map K_η̄(−1) ≅ Hom(G, K_η̄) → Hom(I_G, K_η̄^S) given by evaluation at σ defines sp, independently of the topological generator σ. For general c the morphisms are compatible with composition of specializations and with finite morphisms.

*Hypotheses and conventions.* X noetherian excellent over ℤ[1/n] (quasi-excellent suffices étale-locally, ILO XVII 3.1.3); Λ = ℤ/n.

*Uses.*
- ILO XVII Définition 2.1.2: potential dualizing complexes require pinnings compatible with sp for immediate specializations.
- ILO XVII §5: existence and uniqueness of potential dualizing complexes glue local pinnings along sp.

*API.*
- `TransitionMorphism` (data): sp_{ȳ→x̄} : RΓ_ȳ(K) → RΓ_x̄(K)(c)[2c] for a specialization of codimension c.
- `TransitionMorphism.natural` (functoriality): Naturality in K ∈ D⁺(X_ét, Λ).
- `TransitionMorphism.comp` (relation): sp_{x̄→w̄} ∘ sp_{ȳ→x̄} = sp_{ȳ→w̄} (with the twists and shifts added) for composable specializations.
- `TransitionMorphism.finite` (compatibility): Compatibility with finite morphisms X′ → X via the trace (ILO XVII 3.3.1, 3.5.4).
- `TransitionMorphism.trait` (characterisation): On a strictly henselian trait, sp is induced by evaluation at a topological generator of tame inertia and does not depend on it.
- `TransitionMorphism.etale` (functoriality): Compatibility with étale localisation (ILO XVII 2.2.1).

*Unit tests.*
- `TransitionMorphism.test_trait_constant` (computation): On a strictly henselian trait, sp_{η̄→s}(Λ) : Λ → H²_s(X, Λ(1)) is an isomorphism, matching the Kummer boundary of a uniformizer.
- `TransitionMorphism.test_identity` (degenerate): For the identity specialization (c = 0), sp is the identity of RΓ_x̄(K).
- `TransitionMorphism.test_composition` (characterisation): For X = Spec of a strictly henselian regular local ring of dimension 2 and K = Λ, composing two immediate specializations η̄ → ȳ → x̄ gives the isomorphism Λ → H⁴_x̄(Λ(2)) of absolute purity.
- `TransitionMorphism.test_skyscraper` (non-example): For K = i_{s*}Λ supported at the closed point of a trait, RΓ_η̄(K) = 0 so sp vanishes, although RΓ_s(K) = Λ ≠ 0.

*Construction.* Trait case: identify RΓ_s(K) with the complex F(K) (ILO XVII Proposition 1.2.2.1) and define sp by the evaluation map (Définition 1.2.3.1), checking independence of σ. Codimension one in general: pull back to the normalised closure of ȳ in X_(x̄) and compose with the finite trace (ILO XVII §1). Higher codimension: use EQ.6/top-degree-local-class to define sp for normal strictly henselian targets and extend by finite morphisms and composition (ILO XVII Théorème 3.1.2, Proposition 3.5.4). (ILO, Exposé XVII, §1 (Définitions 1.1.1–1.1.2, Proposition 1.2.2.1, Définition 1.2.3.1), pp. 258–261, and Théorème 3.1.2, p. 268 (printed).)

*Needs:* EtaleDualityAndPerverseSheaves EDC.1:adjoint `local-cohomology-identification`; EtaleDualityAndPerverseSheaves EDC.0 `cohomology-with-supports`; EtaleDualityAndPerverseSheaves EDC.0 `tate-twist`; LefschetzPencilsAndVanishingCycles LPV.0 `henselian-trait-conventions-and-galois-sheaves`; §EQ.5 `dimension-function`; SchemeAndStackFoundations key `excellent-schemes`.

**Checks.**

- On a strictly henselian trait with K = Λ, sp_{η̄→s} : Λ → H²_s(Λ(1))[2] is the isomorphism given by the Kummer class of a uniformizer.
- For c = 0 (an isomorphism of strict localizations) sp is the identity.

**Theorem (Top-degree local cohomology of normal strictly henselian schemes).** `top-degree-local-class`. Let X be a normal strictly henselian excellent local ℤ[1/n]-scheme of dimension d with closed point x. Then H^q_x(X, Λ(d)) = 0 for q > 2d, and there is an isomorphism [x] : Λ → H^{2d}_x(X, Λ(d)) compatible with the transition morphisms of immediate specializations.

*Hypotheses and conventions.* X normal, strictly henselian, excellent, of dimension d; Λ = ℤ/n with n invertible.

*Proof sketch.* Vanishing above 2d: cohomological dimension bounds deduced from the affine Lefschetz theorem (EQ.5/affine-lefschetz-local; ILO XVII 3.2.1–3.2.2). Dimension 2: resolve the excellent surface (AdicCoefficientsAndComparisonsPartII PA.0/resolvability-excellent-dimension-two) and compute H⁴_x through the exceptional curves and absolute purity, defining the generator [x] (ILO XVII 3.4.1). General d: reduce to dimension 2 along finite morphisms and compositions of specializations, checking compatibility with sp (ILO XVII 3.5–3.6). (ILO, Exposé XVII, Théorème 3.1.1 and §§3.2–3.6, pp. 268–280 (printed).)

*Needs:* §EQ.6 `transition-morphism`; §EQ.5 `affine-lefschetz-local`; AdicCoefficientsAndComparisonsPartII PA.0 `resolvability-excellent-dimension-two`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.3 `fundamental-class`.

**Checks.**

- For X regular, [x] is the fundamental class of the closed point given by absolute purity.
- For d = 1 (a strictly henselian trait), [x] is the Kummer class Λ → H²_x(Λ(1)).

**Definition (Putative and potential dualizing complexes).** `potential-dualizing-complex`. Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ. A putative dualizing complex is K ∈ D⁺(X_ét, Λ) together with, for every x ∈ X, an isomorphism (pinning) RΓ_x(K) ≅ Λ(δ(x))[2δ(x)] in D⁺(x_ét, Λ). It is a potential dualizing complex if for every immediate specialization ȳ → x̄ the pinnings at y and x are compatible with sp_{ȳ→x̄} : RΓ_ȳ(K) → RΓ_x̄(K)(1)[2] (EQ.6/transition-morphism), using δ(y) = δ(x) + 1.

*Hypotheses and conventions.* X noetherian excellent over ℤ[1/n]; δ a dimension function; Λ = ℤ/n.

*Uses.*
- ILO XVII Théorème 5.1.1: existence and uniqueness up to unique isomorphism on excellent schemes with a dimension function.
- ILO XVII Théorème 6.1.1: a potential dualizing complex is dualizing.
- CS24 Lemma 3.2.3: (μ_ℓ^{⊗d})[2d] on a strictly henselian excellent regular local ring is the normalised dualizing complex.

*API.*
- `PotentialDualizing` (data): A complex K with pinnings RΓ_x(K) ≅ Λ(δ(x))[2δ(x)] compatible with transition morphisms.
- `PotentialDualizing.etaleRestrict` (functoriality): Restriction along étale U → X with the restricted dimension function.
- `PotentialDualizing.shift` (relation): For an integer k, K(k)[2k] is a potential dualizing complex for δ + k.
- `PotentialDualizing.regularPullback` (functoriality): f^*K is potential for the induced δ_Y when f is regular between excellent schemes (ILO XVII 4.1.1).
- `PotentialDualizing.shriekPullback` (functoriality): f^!K is potential for f^*δ when f is of finite type and compactifiable (ILO XVII 4.1.2).
- `PotentialDualizing.unique` (extensionality): Two potential dualizing complexes for the same (X, δ) are isomorphic by a unique isomorphism respecting the pinnings (ILO XVII 5.1.1).
- `PotentialDualizing.mem_perv` (characterisation): K lies in the heart of Gabber's perverse t-structure for the perversity −2δ.

*Unit tests.*
- `PotentialDualizing.test_point` (computation): On Spec k with δ ≡ 0, K = Λ with the identity pinning is potential; with δ ≡ 1 it is Λ(1)[2].
- `PotentialDualizing.test_trait` (computation): On a strictly henselian trait with δ(s) = 0, δ(η) = 1, K = Λ(1)[2]: RΓ_η̄(K) = Λ(1)[2] and RΓ_s(K) ≅ Λ by Kummer theory, compatibly with sp.
- `PotentialDualizing.test_trait_unshifted` (non-example): On the same trait Λ is not putative: RΓ_η̄(Λ) = Λ in degree 0, not Λ(1)[2].
- `PotentialDualizing.test_empty` (degenerate): On the empty scheme 0 is the unique potential dualizing complex.
- `PotentialDualizing.test_finite_type_field` (compatibility): For X separated of finite type over a field with δ(x) = dim of the closure of x, a^!Λ (EtaleDualityAndPerverseSheaves EDC.1:adjoint/dualizing-complex) with its purity pinnings is potential.

*Construction.* Definition (ILO XVII 2.1.2); étale localisation, quasi-finite exceptional pullback and finite pushforward preserve putative structures (ILO XVII 2.2.1, 2.4.3.1, 2.4.3.3). (ILO, Exposé XVII, Définition 2.1.2 and §2.2–2.4, pp. 263–267 (printed).)

*Needs:* §EQ.6 `transition-morphism`; §EQ.5 `dimension-function`; EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`; EtaleDualityAndPerverseSheaves EDC.0 `tate-twist`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `exceptional-inverse-image`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `dualizing-complex`.

**Checks.**

- On a strictly henselian trait with δ(s) = 0, δ(η) = 1, K = Λ(1)[2] with the Kummer pinning at s is potential.
- Λ on the same trait is not putative for this δ.

**Theorem (The constant sheaf on a regular scheme is potentially dualizing).** `regular-potential-dualizing`. Let X be a regular excellent ℤ[1/n]-scheme with the dimension function δ = −codim. The constant sheaf Λ, with the pinnings RΓ_x(Λ) ≅ Λ(−c)[−2c] (c = codim x) given by absolute cohomological purity and the fundamental classes, is a potential dualizing complex.

*Hypotheses and conventions.* X regular excellent over ℤ[1/n]; δ(x) = −dim O_{X,x}.

*Proof sketch.* The pinnings exist by absolute purity for the regular immersion of the closure of x near x (LefschetzPencilsAndVanishingCycles §0.10; ILO XVI 3.1.1). Compatibility with sp for an immediate specialization ȳ → x̄: work on X_(x̄); with C the closure of ȳ and C̃ its normalisation (a strictly henselian trait), reduce via i^! and the finite map C̃ → C to the trait case (ILO XVII 2.4.2.1, 2.4.3.3–2.4.3.4). (ILO, Exposé XVII, Propositions 2.4.1.1, 2.4.2.1 and 2.4.4.1, pp. 264–267 (printed).)

*Needs:* §EQ.6 `potential-dualizing-complex`; §EQ.6 `transition-morphism`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.3 `fundamental-class`; EtaleDualityAndPerverseSheaves EDC.3 `smooth-pair-purity`.

**Checks.**

- For X a strictly henselian trait, this is the Kummer pinning of Λ at the closed point and the trivial pinning at η.
- For X smooth over a field, the pinnings agree with the smooth-pair cycle classes of EtaleDualityAndPerverseSheaves EDC.3.

**Construction (Gabber's perverse t-structures for a perversity function).** `gabber-perverse-t-structure`. Let X be a noetherian scheme and p : X → ℤ ∪ {+∞} a perversity function: p(x) ≥ p(y) for every specialization ȳ → x̄ of geometric points. The pair (D^{≤p}, D^{≥p}) with K ∈ D^{≤p}(X_ét, Λ) iff K|_x ∈ D^{≤p(x)}(x_ét, Λ) for all x, and K ∈ D^{≥p} iff RΓ_x(K) ∈ D^{≥p(x)}(x_ét, Λ) for all x, is a t-structure on D⁺(X_ét, Λ). Its heart Perv^p(X, Λ) is a stack for the étale topology: objects and morphisms glue.

*Hypotheses and conventions.* X noetherian; p monotone along specializations; Λ = ℤ/n.

*Uses.*
- ILO XVII Théorème 5.1.1: uniqueness of the potential dualizing complex and Λ ≅ τ_{≤0}RHom(K_X, K_X) use K_X ∈ Perv^{−2δ} and étale gluing in the heart.
- LefschetzPencilsAndVanishingCycles LPV.6: perverse sheaves over traits use a rectified dimension function, a case of these perversities.

*API.*
- `GabberTStructure` (data): The t-structure (D^{≤p}, D^{≥p}) on D⁺(X_ét, Λ) for a perversity p.
- `GabberTStructure.le_iff` (characterisation): K ∈ D^{≤p} iff K|_x ∈ D^{≤p(x)} for every point x.
- `GabberTStructure.ge_iff` (characterisation): K ∈ D^{≥p} iff RΓ_x(K) ∈ D^{≥p(x)} for every point x.
- `GabberTStructure.heartStack` (other): The heart Perv^p is an étale stack: Hom sheaves of objects of the heart are sheaves and objects glue.
- `GabberTStructure.etale` (functoriality): Étale pullback is t-exact for the restricted perversity.
- `GabberTStructure.shift` (relation): D^{≤p+k} = D^{≤p}[−k] and D^{≥p+k} = D^{≥p}[−k].

*Unit tests.*
- `GabberTStructure.test_point` (degenerate): For X = Spec of a separably closed field and p ≡ 0, the t-structure is the standard one on D⁺(Λ).
- `GabberTStructure.test_trait_dualizing` (computation): On a strictly henselian trait with p = −2δ (p(s) = 0, p(η) = −2), K = Λ(1)[2] lies in the heart.
- `GabberTStructure.test_trait_constant` (non-example): On the same trait with p = −2δ, Λ is not in D^{≤p}: its restriction to η is concentrated in degree 0 > −2.
- `GabberTStructure.test_middle` (compatibility): For X separated of finite type over a field and p(x) = −dim of the closure of x, the t-structure restricted to D^b_c is the middle perverse t-structure of EtaleDualityAndPerverseSheaves EDC.5.

*Construction.* Gabber, Notes on some t-structures (2004): build truncations stratum by stratum by noetherian induction using the localization triangles (EtaleDualityAndPerverseSheaves EDC.1:biduality/recollement-adjunctions) and pass to the limit over finite stratifications; recalled in ILO XVII §5.2. Étale descent for the heart: negative Ext vanish between objects of the heart (ILO XVII Proposition 5.2.2). (ILO, Exposé XVII, §5.2 (5.2.1–5.2.2), pp. 287–288 (printed), recalling Gabber, Notes on some t-structures (2004).)

*Needs:* EtaleDualityAndPerverseSheaves EDC.0 `etale-derived-category`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `local-cohomology-identification`; EtaleDualityAndPerverseSheaves EDC.1:biduality `recollement-adjunctions`; Mathlib `CategoryTheory.Triangulated.TStructure`; EtaleDualityAndPerverseSheaves EDC.5 (middle perversity).

**Checks.**

- For X a point and p ≡ 0 this is the standard t-structure.
- For X a strictly henselian trait and δ(s) = 0, δ(η) = 1, Λ(1)[2] lies in Perv^{−2δ} while Λ does not.

**Theorem (Existence and uniqueness of potential dualizing complexes).** `potential-dualizing-existence`. Let X be an excellent ℤ[1/n]-scheme with a dimension function δ. Then (X, δ) admits a potential dualizing complex K_X, unique up to unique isomorphism, the canonical map Λ → τ_{≤0}RHom(K_X, K_X) is an isomorphism, and K_X ∈ Perv^{−2δ}(X, Λ).

*Hypotheses and conventions.* X noetherian excellent over ℤ[1/n] with a global dimension function.

*Proof sketch.* Uniqueness and the τ_{≤0} statement: two potential dualizing complexes lie in Perv^{−2δ} and isomorphisms between them form an étale sheaf with a unique section compatible with pinnings (EQ.6/gabber-perverse-t-structure; ILO XVII 5.2–5.3). Existence for normal X: glue local potential complexes built from EQ.6/top-degree-local-class (ILO XVII Proposition 5.3.1). General X: descend along the normalisation, a finite surjective map, using quasi-finite i^! and finite trace (ILO XVII 5.4). (ILO, Exposé XVII, Théorème 5.1.1 and §§5.3–5.4, pp. 287–293 (printed).)

*Needs:* §EQ.6 `potential-dualizing-complex`; §EQ.6 `gabber-perverse-t-structure`; §EQ.6 `top-degree-local-class`; §EQ.6 `regular-potential-dualizing`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `exceptional-inverse-image`.

**Checks.**

- For X regular with δ = −codim, K_X = Λ (EQ.6/regular-potential-dualizing).
- For X separated of finite type over a field with δ = dim of closure, K_X = a^!Λ.

**Theorem (Functoriality of potential dualizing complexes).** `potential-dualizing-functoriality`. Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ_X and K a putative (resp. potential) dualizing complex. (1) For f : Y → X a regular morphism of excellent schemes and δ_Y(y) = δ_X(f(y)) − codim_{f^{-1}(f(y))}(y), f^*K is naturally putative (resp. potential) on (Y, δ_Y). (2) For f : Y → X of finite type and compactifiable and δ_Y(y) = δ_X(f(y)) + trdeg(κ(y)/κ(f(y))), f^!K is naturally putative (resp. potential) on (Y, δ_Y). Both constructions are compatible with composition.

*Hypotheses and conventions.* Excellent noetherian schemes over ℤ[1/n]; f regular in (1), compactifiable of finite type in (2).

*Proof sketch.* (1) Pinnings pull back by regular base change for local cohomology (EQ.5/regular-base-change) and absolute purity of the regular fibres (ILO XVII 4.2.1–4.2.3). (2) Reduce to f smooth (smooth purity, EtaleDualityAndPerverseSheaves EDC.2:trace-purity/smooth-purity) and f a closed immersion (quasi-finite i^!) (ILO XVII 4.1.2 and §4.3). (ILO, Exposé XVII, Propositions 4.1.1–4.1.2, Remarque 4.1.3 and §4.2, pp. 280–284 (printed).)

*Needs:* §EQ.6 `potential-dualizing-complex`; §EQ.5 `induced-dimension-function`; §EQ.5 `regular-base-change`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.2:trace-purity `smooth-purity`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `exceptional-inverse-image`.

**Checks.**

- For f étale, (1) and (2) both give the restriction of K with the restricted δ.
- For f : 𝔸¹_X → X, (2) gives f^!K = f^*K(1)[2] with δ_Y = δ_X + 1 at generic points of fibres.

**Definition (Dualizing complexes on noetherian schemes).** `dualizing-complex`. Let X be a noetherian ℤ[1/n]-scheme and Λ = ℤ/n. A dualizing complex on X is an object K ∈ D^b_c(X_ét, Λ) such that the duality functor D_K = RHom(−, K) preserves D^b_c(X_ét, Λ) and, for every L ∈ D^b_c(X_ét, Λ), the biduality morphism L → D_K D_K L is an isomorphism. (Unlike SGA 5 I 1.7, finite quasi-injective dimension is not required.)

*Hypotheses and conventions.* X noetherian over ℤ[1/n]; constructible bounded complexes.

*Uses.*
- ILO XVII Théorème 0.9: Gabber's duality theorem asserts existence on excellent schemes with a dimension function.
- CS24 Lemma 3.2.3: the dualizing complex (μ_ℓ^{⊗d})[2d] on a regular local ring and its restriction to an open are used with Rj_* D = D j_! and local duality.

*API.*
- `IsDualizingComplex` (data): The predicate on K ∈ D^b_c(X_ét, Λ).
- `IsDualizingComplex.dual` (constructor): D_K = RHom(−, K) as a contravariant endofunctor of D^b_c(X_ét, Λ).
- `IsDualizingComplex.biduality` (characterisation): L ≅ D_K D_K L for constructible L.
- `IsDualizingComplex.restrictOpen` (functoriality): For j : U → X open, j^*K = j^!K is dualizing on U and Rj_* D_U ≅ D_X j_! (SGA 5 I 1.12 (a)).
- `IsDualizingComplex.unique` (extensionality): Two dualizing complexes differ by tensoring with an invertible object of D^b_c (locally Λ[k]) (ILO XVII 9.2).
- `IsDualizingComplex.sga5` (compatibility): K has finite quasi-injective dimension iff X has finite Krull dimension, and then K is dualizing in the sense of SGA 5 I 1.7 (ILO XVII 6.1.1).

*Unit tests.*
- `IsDualizingComplex.test_point` (computation): On Spec of a separably closed field, Λ = ℤ/n is dualizing: D_Λ is Λ-linear duality on finite complexes and Λ is self-injective.
- `IsDualizingComplex.test_double` (non-example): On the same point, Λ ⊕ Λ is not dualizing: D D Λ = Hom(Λ², Λ²) = Λ⁴ ≠ Λ.
- `IsDualizingComplex.test_empty` (degenerate): On the empty scheme 0 is dualizing.
- `IsDualizingComplex.test_finite_type` (compatibility): For X separated of finite type over a field, the complex a^!Λ of EtaleDualityAndPerverseSheaves EDC.1:adjoint/dualizing-complex is dualizing in this sense.

*Construction.* Definition (ILO XVII 0.8); uniqueness up to tensoring with an invertible object (ILO XVII Proposition 9.2). (ILO, Exposé XVII, Définition 0.8, p. 257 (printed).)

*Needs:* EtaleDualityAndPerverseSheaves EDC.0 `constructible-ctf-complexes`; EtaleDualityAndPerverseSheaves EDC.0 `derived-tensor-and-internal-hom`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `verdier-dual`; EtaleDualityAndPerverseSheaves EDC.1:biduality `self-injective-coefficients`; EtaleDualityAndPerverseSheaves EDC.1:biduality `constructible-biduality`.

**Checks.**

- Λ on Spec of a separably closed field is dualizing.
- For X finite type over a field, a^!Λ is dualizing (EtaleDualityAndPerverseSheaves EDC.1:biduality/constructible-biduality).

**Theorem (Biduality for potential dualizing complexes).** `gabber-biduality-theorem`. Let X be a noetherian excellent ℤ[1/n]-scheme with a dimension function δ and K the potential dualizing complex of (X, δ). Then K ∈ D^b_ctf(X_ét, Λ); K has finite quasi-injective dimension iff X has finite Krull dimension; D_K = RHom(−, K) preserves D^b_c(X_ét, Λ); and for every M ∈ D^b_c(X_ét, Λ) the biduality morphism M → D_K D_K M is an isomorphism. Thus K is a dualizing complex.

*Hypotheses and conventions.* X noetherian excellent over ℤ[1/n] with a dimension function.

*Proof sketch.* Constructibility, Tor-dimension and quasi-injective dimension of K and of D_K M from Gabber's finiteness theorem (EQ.4/gabber-finiteness-theorem) and change of coefficients (ILO XVII 6.2). Weak reflexivity M ≅ τ_{≤0} D D M for constructible sheaves (ILO XVII 6.3.1) and reduction to finite-type schemes over bases of smaller dimension, generalising SGA 4½ [Th. finitude] 4.3 (ILO XVII 6.4.2). Induction on dimension: reduce to M = j_!Λ for a dense open immersion of normal integral schemes and use the partial algebraization theorem (EQ.1/partial-algebraization-mixed-characteristic, geometric form V 3.1.3) to compare with the completion of a finite-type scheme over a regular base of smaller dimension (ILO XVII 6.5). (ILO, Exposé XVII, Théorème 6.1.1 and §§6.2–6.5, pp. 293–300 (printed).)

*Needs:* §EQ.6 `potential-dualizing-existence`; §EQ.6 `dualizing-complex`; §EQ.4 `gabber-finiteness-theorem`; §EQ.1 `partial-algebraization-mixed-characteristic`; §EQ.1 `partial-algebraization-equal-characteristic`; EtaleDualityAndPerverseSheaves EDC.1:biduality `constructible-biduality`; EtaleDualityAndPerverseSheaves EDC.1:biduality `one-dimensional-dualizing-base`.

**Checks.**

- For X of finite type over a field or over a regular base of dimension ≤ 1, this is SGA 4½ [Th. finitude] 4.3 (EtaleDualityAndPerverseSheaves EDC.1:biduality/constructible-biduality, one-dimensional-dualizing-base).
- For X = Spec of a strictly henselian regular local ring of dimension d, K = Λ(d)[2d] (δ(closed point) = 0) and biduality holds for j_!Λ with j the complement of a divisor.

**Theorem (Gabber's duality theorem on excellent schemes).** `gabber-duality-theorem`. Let X be a noetherian excellent ℤ[1/n]-scheme admitting a dimension function. Then X has a dualizing complex K, unique up to tensoring with an invertible object; K ∈ D^b_ctf(X_ét, Λ), and K has finite quasi-injective dimension iff X has finite Krull dimension. Moreover: if X is regular, Λ is a dualizing complex; if f : Y → X is flat with geometrically regular fibres and Y noetherian excellent, f^*K is dualizing; if f : Y → X is of finite type and compactifiable, f^!K is dualizing.

*Hypotheses and conventions.* X noetherian excellent over ℤ[1/n] with a dimension function (necessary: a dualizing complex forces a global dimension function, Gabber 2004 Lemma 8.1).

*Proof sketch.* Existence: the potential dualizing complex (EQ.6/potential-dualizing-existence) is dualizing (EQ.6/gabber-biduality-theorem). Uniqueness up to invertible objects (ILO XVII 7.5.1.1, 9.2). Regular case: EQ.6/regular-potential-dualizing; functoriality: EQ.6/potential-dualizing-functoriality with EQ.6/gabber-biduality-theorem on Y. (ILO, Exposé XVII, Théorème 0.9, p. 257 (printed) (cited as Théorème 0.2 by Česnavičius–Scholze, following the Astérisque numbering); Exposé 0, (c), p. 6.)

*Needs:* §EQ.6 `gabber-biduality-theorem`; §EQ.6 `potential-dualizing-existence`; §EQ.6 `regular-potential-dualizing`; §EQ.6 `potential-dualizing-functoriality`; §EQ.6 `dualizing-complex`.

**Checks.**

- For X a strictly henselian regular local scheme, Λ and Λ(d)[2d] are both dualizing and differ by the invertible object Λ(d)[2d].
- For X of finite type over a field, K = a^!Λ up to an invertible object.

**Theorem (The normalised dualizing complex of a regular local ring).** `regular-local-dualizing-complex`. Let R be a strictly henselian excellent regular local ring of dimension d with closed point x, ℓ a prime invertible in R, Λ = ℤ/ℓ, and δ(t) = dim of the closure of t. Then K = (μ_ℓ^{⊗d})[2d] = Λ(d)[2d] is the potential dualizing complex of (Spec R, δ), pinned at x by RΓ_x(K) ≅ Λ through absolute purity; for every open immersion j : U → Spec R, j^!K = K|_U is dualizing on U, and Rj_* ∘ D_U ≅ D_X ∘ j_! on constructible complexes.

*Hypotheses and conventions.* R strictly henselian, excellent, regular local; ℓ invertible.

*Proof sketch.* δ = d − codim, so the potential dualizing complex for δ is Λ(d)[2d] by EQ.6/regular-potential-dualizing and the shift rule PotentialDualizing.shift; the pinning at x is H^{2d}_x(Λ(d)) ≅ Λ by absolute purity (ILO XVI 3.1.1). It is dualizing by EQ.6/gabber-biduality-theorem; restriction to an open is j^* = j^! (SGA 4 XVIII 3.1.8 (iii)), and Rj_* D_U = D_X j_! is the formal adjunction (SGA 5 I 1.12 (a); EtaleDualityAndPerverseSheaves EDC.1:adjoint/formal-duality-exchange). (Česnavičius–Scholze, Proof of Lemma 3.2.3, p. 33; ILO, Exposé XVII, Théorème 0.9 and Proposition 2.4.4.1, pp. 257 and 267 (printed); Exposé XVI, Théorème 3.1.1.)

*Needs:* §EQ.6 `regular-potential-dualizing`; §EQ.6 `gabber-biduality-theorem`; §EQ.6 `potential-dualizing-complex`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.1:adjoint `formal-duality-exchange`; EtaleDualityAndPerverseSheaves EDC.1:biduality `one-dimensional-dualizing-base`.

**Checks.**

- For d = 1 (a strictly henselian DVR), K = Λ(1)[2], recovering the dimension-one dualizing base of EtaleDualityAndPerverseSheaves EDC.1:biduality/one-dimensional-dualizing-base.
- For d = 0 (a separably closed field), K = Λ.

**Theorem (Local duality on strictly local excellent schemes).** `local-duality`. Let X be a strictly local noetherian excellent ℤ[1/n]-scheme with closed point x, and K a dualizing complex on X pinned at x by RΓ_x(K) ≅ Λ (the potential dualizing complex for δ with δ(x) = 0). For every F ∈ D^b_c(X_ét, Λ) and every i there is a natural isomorphism H^i_x(X, F) ≅ Hom_Λ(H^{−i}(D_K F)_x̄, Λ).

*Hypotheses and conventions.* X strictly local excellent; Λ = ℤ/n with n invertible; F constructible bounded.

*Proof sketch.* Biduality F ≅ D_K D_K F (EQ.6/gabber-biduality-theorem). Apply i_x^!: RΓ_x(X, F) ≅ RΓ_x RHom(D_K F, K) ≅ RHom_Λ((D_K F)_x̄, i_x^!K) ≅ RHom_Λ((D_K F)_x̄, Λ), using i_x^! RHom(G, K) = RHom(i_x^*G, i_x^!K) and the pinning. Λ = ℤ/n is self-injective (EtaleDualityAndPerverseSheaves EDC.1:biduality/self-injective-coefficients), so cohomology commutes with Hom into Λ (SGA 5 I (4.2.2)). (Česnavičius–Scholze, Proof of Lemma 3.2.3, p. 33, citing SGA 5 I (4.2.2) and ILO XVI 3.1.1; ILO, Exposé XVII, §6 (Le théorème de dualité locale), Théorème 6.1.1, p. 293 (printed).)

*Needs:* §EQ.6 `gabber-biduality-theorem`; §EQ.6 `dualizing-complex`; §EQ.6 `potential-dualizing-complex`; EtaleDualityAndPerverseSheaves EDC.1:biduality `self-injective-coefficients`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `local-cohomology-identification`.

**Checks.**

- For X = Spec of a separably closed field this is linear duality of finite Λ-modules.
- For X a strictly henselian trait, F = Λ and K = Λ(1)[2]: H²_x(Λ) ≅ Hom(H^{−2}(Λ(1)[2])_x̄, Λ) = Λ(−1), as Kummer theory predicts.

### Dependencies

This layer requires EQ.1, EQ.4, EQ.5, EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3), EtaleDualityAndPerverseSheaves EDC.1, EtaleDualityAndPerverseSheaves EDC.2, EtaleDualityAndPerverseSheaves EDC.3, EtaleDualityAndPerverseSheaves EDC.5 (middle perversity), LefschetzPencilsAndVanishingCycles §0.10 (absolute purity), AdicCoefficientsAndComparisonsPartII PA.0.

## Layer EQ.7: Local purity and the local Lefschetz theorem

Česnavičius–Scholze's local consequences: local absolute purity for finite étale coefficients and its sheafified form (from absolute purity), vanishing for principal punctured opens, and the Lefschetz hyperplane theorem in local étale cohomology.

Key objects and theorems: Local absolute purity; Local Lefschetz hyperplane theorem.

**Theorem (Local absolute purity for finite étale coefficients).** `local-absolute-purity`. Let (R, 𝔪) be a regular local ring and G a commutative finite étale R-group scheme whose order is invertible in R. Then H^i_𝔪(R, G) = 0 for i < 2 dim R.

*Hypotheses and conventions.* R regular local (not necessarily excellent); |G| invertible in R.

*Proof sketch.* The local-to-global spectral sequence H^p(R/𝔪, ℋ^q_𝔪(G)) ⇒ H^{p+q}_𝔪(R, G) (SGA 4 V 6.4) reduces to the strictly henselian case, where G ≅ ⊕ ℤ/n_i is constant. Absolute cohomological purity for the regular closed point x ∈ Spec R of codimension d = dim R: Ri_x^!ℤ/n ≅ ℤ/n(−d)[−2d] (LefschetzPencilsAndVanishingCycles §0.10, Riou's proof of Gabber's theorem), so H^i_𝔪(R, ℤ/n) = 0 for i ≠ 2d. Česnavičius–Scholze give a second proof by tilting (EQ.8/tilting-supports) to equal characteristic, where SGA 4 XVI 3.7 applies (CS24 3.1.3 proof). (Česnavičius–Scholze, Theorem 3.1.3, p. 30; announced as Theorem 1.1.2, p. 3; ILO, Exposé XVI, Théorème 3.1.1 (Riou).)

*Needs:* LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.0 `cohomology-with-supports`; EtaleDualityAndPerverseSheaves EDC.1:adjoint `local-cohomology-identification`; Mathlib `IsRegularLocalRing`.

**Checks.**

- For R a DVR, H⁰_𝔪 = H¹_𝔪 = 0 and H²_𝔪(R, μ_n) ≅ ℤ/n.
- For R = k⟦x, y⟧ with k separably closed, H^i_𝔪(R, ℤ/ℓ) = 0 for i < 4 and H⁴_𝔪 ≅ ℤ/ℓ(−2).

**Application (Sheafified local purity with the cycle class).** `sheafified-local-purity`. Let R be a regular local ring of dimension d and n invertible in R. The étale sheafifications ℋ^i_𝔪(−, ℤ/n) of local cohomology at the closed point vanish for i ≠ 2d, and the cycle class map ℤ/n(−d) → ℋ^{2d}_𝔪(−, ℤ/n) is an isomorphism.

*Hypotheses and conventions.* R regular local; n invertible.

*Proof sketch.* This is absolute purity for the regular immersion of the closed point (LefschetzPencilsAndVanishingCycles §0.10), with the fundamental class of the point. Česnavičius–Scholze note that their tilting argument reduces it to positive characteristic after proving injectivity of the cycle class map as in Fujiwara 2002, Lemma 2.3.1 (CS24 3.1.4). (Česnavičius–Scholze, Remarks 3.1.4, p. 31.)

*Needs:* §EQ.7 `local-absolute-purity`; LefschetzPencilsAndVanishingCycles §0.10 (absolute purity); EtaleDualityAndPerverseSheaves EDC.3 `fundamental-class`.

**Checks.**

- For d = 1 the isomorphism is the Kummer boundary ℤ/n(−1) ≅ H²_𝔪(ℤ/n) on the strict henselisation.
- The vanishing statement for i < 2d is EQ.7/local-absolute-purity for G = ℤ/n.

**Theorem (Vanishing for principal punctured opens).** `punctured-affine-vanishing`. Let R be a strictly henselian regular local ring of dimension d, f ∈ 𝔪 and ℓ a prime invertible in R. Then H^i(Spec R[1/f], ℤ/ℓ) = 0 for i > d.

*Hypotheses and conventions.* R strictly henselian regular local (completion excellent); f ∈ 𝔪; ℓ invertible.

*Proof sketch.* R is f-henselian with no f-torsion, so RΓ(R[1/f], ℤ/ℓ) ≅ RΓ(R̂[1/f], ℤ/ℓ) for the completion (CS24 Lemma 3.1.2; ArcTopologyAndDescent AT.8/open-henselian-completion); R̂ is strictly henselian, regular, complete, hence excellent, of dimension d. Apply the local affine Lefschetz theorem to the affine open D(f) (EQ.5/affine-lefschetz-local; ILO XV 1.2.4). (Česnavičius–Scholze, Proof of Lemma 3.2.3, equation (3.2.3.2), p. 33; Lemma 3.1.2, p. 30.)

*Needs:* §EQ.5 `affine-lefschetz-local`; ArcTopologyAndDescent AT.8 `open-henselian-completion`; Mathlib `IsRegularLocalRing`.

**Checks.**

- For d = 1 and f a uniformizer, Spec R[1/f] is the generic point and H^i = 0 for i > 1.
- For f a unit, Spec R[1/f] = Spec R and H^i = 0 for i > 0, consistent with the bound.

**Theorem (Local cohomology of extension by zero from a principal open).** `extension-by-zero-local-vanishing`. Let R be a regular local ring of dimension d, f ∈ 𝔪, ℓ a prime invertible in R and j : Spec R[1/f] → Spec R. Then H^i_𝔪(R, j_!ℤ/ℓ) = 0 for i < d.

*Hypotheses and conventions.* R regular local; f ∈ 𝔪; ℓ invertible.

*Proof sketch.* Reduce to R strictly henselian (local-to-global spectral sequence) and complete (CS24 Lemma 3.1.2), hence excellent. With K = Λ(d)[2d] (EQ.6/regular-local-dualizing-complex), D(j_!Λ) = Rj_*(K|_U), whose stalk at the closed point is RΓ(R[1/f], Λ(d)[2d]); by EQ.7/punctured-affine-vanishing, H^{−i}(D(j_!Λ))_x̄ = 0 for −i + 2d > d, i.e. for i < d. Local duality (EQ.6/local-duality) gives H^i_𝔪(R, j_!Λ) ≅ Hom(H^{−i}(D(j_!Λ))_x̄, Λ) = 0 for i < d. (Česnavičius–Scholze, Proof of Lemma 3.2.3, equation (3.2.3.1), p. 33.)

*Needs:* §EQ.7 `punctured-affine-vanishing`; §EQ.6 `regular-local-dualizing-complex`; §EQ.6 `local-duality`; ArcTopologyAndDescent AT.8 `open-henselian-completion`; EtaleDualityAndPerverseSheaves EDC.0 `cohomology-with-supports`.

**Checks.**

- For d = 1 and f a uniformizer, H⁰_𝔪(R, j_!ℤ/ℓ) = 0.
- For f a unit, j_!ℤ/ℓ = ℤ/ℓ and the statement is weaker than EQ.7/local-absolute-purity.

**Theorem (Lefschetz hyperplane theorem in local étale cohomology).** `local-lefschetz-hyperplane-theorem`. Let (R, 𝔪) be a regular local ring, f ∈ 𝔪 and ℓ a prime invertible in R. The restriction map H^i_𝔪(R, ℤ/ℓ) → H^i_𝔪(R/(f), ℤ/ℓ) is bijective for i < dim R − 1 and injective for i = dim R − 1.

*Hypotheses and conventions.* R regular local of dimension d; f ∈ 𝔪 (R/(f) need not be regular); ℓ invertible.

*Proof sketch.* The exact sequence 0 → j_!ℤ/ℓ → ℤ/ℓ → i_*ℤ/ℓ → 0 for i : Spec R/(f) → Spec R gives a long exact sequence of local cohomology with H^i_𝔪(R, i_*ℤ/ℓ) = H^i_𝔪(R/(f), ℤ/ℓ). By EQ.7/extension-by-zero-local-vanishing, H^i_𝔪(R, j_!ℤ/ℓ) = 0 for i < d, which gives the bijectivity for i < d − 1 and injectivity for i = d − 1. (Česnavičius–Scholze, Lemma 3.2.3 and its proof, p. 33.)

*Needs:* §EQ.7 `extension-by-zero-local-vanishing`; §EQ.7 `local-absolute-purity`; EtaleDualityAndPerverseSheaves EDC.0 `cohomology-with-supports`.

**Checks.**

- For d = 1 (a DVR) and f a uniformizer, the statement is injectivity of H⁰_𝔪(R, ℤ/ℓ) = 0 → H⁰(R/(f), ℤ/ℓ) = ℤ/ℓ in degree 0 = d − 1.
- With EQ.7/local-absolute-purity, for R = R̃/(f) a hypersurface quotient of a regular R̃ of dimension d, H^i_𝔪(R, ℤ/ℓ) = 0 for i < d − 1 (the hypersurface case of CS24 3.2.4, consumed by PurityForFlatCohomology PF.1).

### Dependencies

This layer requires EQ.5, EQ.6, LefschetzPencilsAndVanishingCycles §0.10 (absolute purity), EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3), ArcTopologyAndDescent AT.8.

## Layer EQ.8: Tilting étale cohomology of henselian perfectoid pairs

Česnavičius–Scholze's algebraic tilting: matched punctured opens of a henselian perfectoid pair and of its tilt, the multiplicative tilt of the generic fibre, tilting of idempotents, products of valuation rings, and the identification of étale cohomology and of cohomology with supports with those of the tilt.

Key objects and theorems: Tilting of idempotents; Algebraic tilting of étale cohomology.

**Construction (Matched punctured opens of a henselian perfectoid pair and its tilt).** `matched-punctured-opens`. Let p be a prime, A a ring and ϖ ∈ A with ϖ^p | p such that A is ϖ-henselian with bounded ϖ^∞-torsion and its ϖ-adic completion Â is (integral) perfectoid. Put A^♭ = lim_{a ↦ a^p} A/ϖA (the tilt of Â) and choose ϖ^♭ ∈ A^♭ with (ϖ^♭)^♯ a unit multiple of ϖ. The isomorphism A^♭/ϖ^♭ ≅ Â/ϖ = A/ϖ (CS24 (2.1.2.2)) identifies Spec(A/ϖ) with Spec(A^♭/ϖ^♭). A matched pair of punctured opens is a pair (U, U^♭) of opens Spec A[1/ϖ] ⊆ U ⊆ Spec A and Spec A^♭[1/ϖ^♭] ⊆ U^♭ ⊆ Spec A^♭ whose closed complements, subsets of V(ϖ) and V(ϖ^♭), correspond under this identification. U ↦ U^♭ is an order isomorphism between the two sets of such opens.

*Hypotheses and conventions.* ϖ^p | p; A ϖ-henselian with bounded ϖ^∞-torsion; Â perfectoid; ϖ^♭ chosen with (ϖ^♭)^♯ a unit multiple of ϖ.

*Uses.*
- CS24 Theorem 2.2.7: idempotents and étale cohomology of U and U^♭ are identified.
- CS24 (2.2.7.1): cohomology with supports in a closed Z ⊂ Spec A/ϖ is the cone of restriction to U = Spec A − Z.

*API.*
- `MatchedPuncturedOpen` (data): The bijection U ↦ U^♭ between opens of Spec A containing Spec A[1/ϖ] and opens of Spec A^♭ containing Spec A^♭[1/ϖ^♭].
- `MatchedPuncturedOpen.mono` (relation): U ⊆ V iff U^♭ ⊆ V^♭; unions and finite intersections are preserved.
- `MatchedPuncturedOpen.top` (simp): (Spec A)^♭ = Spec A^♭.
- `MatchedPuncturedOpen.generic` (simp): (Spec A[1/ϖ])^♭ = Spec A^♭[1/ϖ^♭].
- `MatchedPuncturedOpen.basicOpen` (characterisation): For b ∈ A whose image in A/ϖ is the image of b′ ∈ A^♭, (D(b) ∪ D(ϖ))^♭ = D(b′) ∪ D(ϖ^♭).
- `MatchedPuncturedOpen.completion` (compatibility): The pair is unchanged when A is replaced by its ϖ-adic completion.

*Unit tests.*
- `MatchedPuncturedOpen.test_top` (degenerate): Spec A is matched with Spec A^♭.
- `MatchedPuncturedOpen.test_generic` (computation): Spec A[1/ϖ] is matched with Spec A^♭[1/ϖ^♭].
- `MatchedPuncturedOpen.test_point_fibre` (computation): For A = W(k)⟦x^{1/p^∞}⟧/(p − x)^∧ with ϖ = x^{1/p}, there are exactly two matched pairs.
- `MatchedPuncturedOpen.test_not_arbitrary_open` (non-example): An open of Spec A not containing Spec A[1/ϖ] (for instance one missing a generic-fibre point) has no matched open.

*Construction.* The quotient identification is the sharp-quotient isomorphism of PerfectoidQuotientsPartII Q5/sharp-quotient-isomorphisms; closed subsets of V(ϖ) are closed subsets of Spec A/ϖ, and opens containing the generic part correspond to their complements. (Česnavičius–Scholze, Theorem 2.2.7 (hypotheses), p. 21; §2.1.2, equation (2.1.2.2), pp. 10–11.)

*Needs:* PerfectoidQuotientsPartII Q5 `sharp-quotient-isomorphisms`; PerfectoidQuotientsPartII Q5 `tilt-inverse-limit-monoid`; PerfectoidQuotients Q0:integral-algebra `semiperfectoid-quasisyntomic-and-qrsp-rings`; Mathlib `PreTilt`; Mathlib `HenselianRing`.

**Checks.**

- (Spec A, Spec A^♭) and (Spec A[1/ϖ], Spec A^♭[1/ϖ^♭]) are matched.
- For A = W(k)⟦x^{1/p^∞}⟧/(p − x) (p-adically completed) and ϖ = x^{1/p}, A^♭ ≅ k⟦t^{1/p^∞}⟧ and Spec A/ϖ is a point, so only these two pairs exist.

**Theorem (Multiplicative tilting of the generic fibre).** `punctured-multiplicative-tilt`. Let A be perfectoid and ϖ-adically complete for ϖ ∈ A with ϖ^p | p, and ϖ^♭ ∈ A^♭ with (ϖ^♭)^♯ a unit multiple of ϖ. The p-power inverse limits satisfy compatible multiplicative bijections lim_{a↦a^p}(A[1/ϖ]) ≅ A^♭[1/ϖ^♭] and lim_{a↦a^p} A ≅ A^♭, the second being the multiplicative description of the tilt.

*Hypotheses and conventions.* A perfectoid, ϖ-adically complete; ϖ^p | p.

*Proof sketch.* The image Ā of A in A[1/ϖ] is p-integrally closed (PerfectoidQuotients Layer 0 p-integral closedness criterion with the decomposition along ϖ-torsion (2.1.3.1)). A p-power compatible sequence in A[1/ϖ] therefore has ϖ^N times its terms in Ā for one N; combine with lim_{a↦a^p} A ≅ A^♭ (PerfectoidQuotientsPartII Q5/tilt-inverse-limit-monoid) after inverting ϖ^♭ (CS24 (2.1.7.2)). (Česnavičius–Scholze, §2.1.7, equations (2.1.7.1)–(2.1.7.2), p. 13.)

*Needs:* PerfectoidQuotients Q0:integral-algebra `p-integral-closedness-criterion`; PerfectoidQuotients Q0:integral-algebra `torsion-free-perfectoid-quotient`; PerfectoidQuotientsPartII Q5 `tilt-inverse-limit-monoid`; Mathlib `PreTilt`.

**Checks.**

- For A = 𝒪_C with C a perfectoid field and ϖ = p^{1/p}, this is the multiplicative bijection C ≅ lim_{x↦x^p} C = C^♭.
- For A of characteristic p (A = A^♭), both maps are the identity.

**Theorem (Tilting of idempotents on punctured opens).** `tilting-idempotents`. In the setting of EQ.8/matched-punctured-opens, for every matched pair (U, U^♭) there is a bijection Idem(U) ≅ Idem(U^♭) between the idempotents of Γ(U, O) and of Γ(U^♭, O), compatible with orthogonality and functorial in A and U.

*Hypotheses and conventions.* As in EQ.8/matched-punctured-opens.

*Proof sketch.* Replace A by its ϖ-adic completion; idempotents of U do not change (Bouthier–Česnavičius 2.3.1; equivalently H⁰ of ℤ/2 under ArcTopologyAndDescent AT.8/open-henselian-completion). For U = Spec A and U = Spec A[1/ϖ], idempotents are fixed by p-th powers, so the multiplicative bijections of EQ.8/punctured-multiplicative-tilt restrict to bijections of idempotents. General U: an idempotent on U is an idempotent on A[1/ϖ] with compatible idempotents on the localisations along principal opens of U ∩ V(ϖ); by Beauville–Laszlo glueing these localisations may be completed; their completions are perfectoid with the matching tilts (PerfectoidQuotients Layer 0, Corollary 2.1.6 and (2.1.2.2)), reducing to the two settled cases. (Česnavičius–Scholze, Theorem 2.2.7 and its proof (first part), pp. 21–22.)

*Needs:* §EQ.8 `matched-punctured-opens`; §EQ.8 `punctured-multiplicative-tilt`; ArcTopologyAndDescent AT.8 `open-henselian-completion`; ArcTopologyAndDescent AT.8 `formal-glueing`; PerfectoidQuotients Q0:integral-algebra `completely-etale-and-henselian-perfectoid`.

**Checks.**

- For A connected and U = Spec A, Idem = {0, 1} on both sides.
- For A = A_1 × A_2, the idempotents (1, 0), (0, 1) correspond to those of A_1^♭ × A_2^♭.

**Theorem (Étale cohomology of products of valuation rings and their tilts).** `valuation-product-tilting`. Let A = ∏_{i∈I} V_i with each V_i a ϖ-adically complete valuation ring of rank ≤ 1 with algebraically closed fraction field, over a perfectoid base as in EQ.8/matched-punctured-opens. Then A is perfectoid with A^♭ = ∏ V_i^♭; for every quasi-compact open U ⊆ Spec A (resp. U^♭ ⊆ Spec A^♭) there are no nonsplit étale covers; RΓ_ét(U, G) and RΓ_ét(U^♭, G) are concentrated in degree 0, given by locally constant G-valued functions; and for matched (U, U^♭) they are identified functorially through EQ.8/tilting-idempotents.

*Hypotheses and conventions.* V_i complete of rank ≤ 1 with algebraically closed fraction fields; G a torsion abelian group.

*Proof sketch.* The V_i are perfectoid, products of perfectoids are perfectoid with tilt the product of tilts (PerfectoidQuotients Layer 0 products; PerfectoidQuotientsPartII Q6/tilting-valuation-rings). Connected components of Spec ∏ V_i are the spectra of ultraproducts, which are valuation rings with algebraically closed fraction fields (ArcTopologyAndDescent AT.3/product-components); quasi-compact opens therefore have strictly henselian local rings and no nonsplit étale covers (CS24 Lemma 2.2.4). Locally constant functions are determined by the Boolean algebra of clopens, which the idempotent bijection identifies compatibly with disjointness. (Česnavičius–Scholze, Lemma 2.2.4, pp. 19–20, and proof of Theorem 2.2.7 (product case), pp. 21–22.)

*Needs:* §EQ.8 `tilting-idempotents`; ArcTopologyAndDescent AT.3 `product-components`; ArcTopologyAndDescent AT.11 `complete-valuation-product-basis`; PerfectoidQuotients Q0:integral-algebra `products-of-perfectoid-rings`; PerfectoidQuotientsPartII Q6 `tilting-valuation-rings`.

**Checks.**

- For I a singleton, A = V and U = Spec V[1/ϖ] = Spec of an algebraically closed field: RΓ = G in degree 0 on both sides.
- For I infinite, the clopens of Spec ∏ V_i correspond to subsets in ultrafilters, identically on the tilt.

**Theorem (Algebraic tilting of étale cohomology).** `tilting-etale-cohomology`. In the setting of EQ.8/matched-punctured-opens, for every matched pair (U, U^♭) and every torsion abelian group G there is an isomorphism RΓ_ét(U, G) ≅ RΓ_ét(U^♭, G), functorial in A, U and G.

*Hypotheses and conventions.* As in EQ.8/matched-punctured-opens; G torsion.

*Proof sketch.* Replace A by its completion (ArcTopologyAndDescent AT.8/open-henselian-completion). By formal glueing for étale cohomology (ArcTopologyAndDescent AT.8/formal-glueing) and ϖ-complete arc descent (CS24 Theorem 2.2.5; AT.11/complete-etale-hyperdescent), reduce to U = Spec A and U = Spec A[1/ϖ]. Products of complete valuation rings with algebraically closed fraction fields form a basis of the ϖ-complete arc topology (AT.11/complete-valuation-product-basis), matched with the analogous basis of A^♭ by tilting (PerfectoidQuotientsPartII Q6/tilting-valuation-rings, AT.12/tilting-complete-arc-covers); conclude from EQ.8/valuation-product-tilting by descent. (Česnavičius–Scholze, Theorem 2.2.7 and its proof, pp. 21–22; Theorem 2.2.5, p. 20.)

*Needs:* §EQ.8 `valuation-product-tilting`; §EQ.8 `tilting-idempotents`; §EQ.8 `matched-punctured-opens`; ArcTopologyAndDescent AT.8 `open-henselian-completion`; ArcTopologyAndDescent AT.8 `formal-glueing`; ArcTopologyAndDescent AT.11 `complete-etale-hyperdescent`; ArcTopologyAndDescent AT.11 `i-complete-arc-cover`; ArcTopologyAndDescent AT.11 `complete-valuation-product-basis`; ArcTopologyAndDescent AT.12 `tilting-complete-arc-covers`; PerfectoidQuotientsPartII Q6 `tilting-valuation-rings`.

**Checks.**

- For A of characteristic p, A^♭ = A and the isomorphism is the identity.
- For R̂_∞ = W(k)⟦x_1^{1/p^∞}, …, x_d^{1/p^∞}⟧/(p − f) and U the complement of V(x_1, …, x_d), the cohomology of U equals that of the corresponding punctured spectrum of the f-adic completion of k⟦(x_1^♭)^{1/p^∞}, …⟧ (the step used in CS24 3.1.3).

**Theorem (Tilting of cohomology with supports).** `tilting-supports`. In the setting of EQ.8/matched-punctured-opens, for every closed Z ⊆ Spec(A/ϖA) and every torsion abelian group G, RΓ_Z(A, G) ≅ RΓ_{Z^♭}(A^♭, G), where Z^♭ ⊆ Spec(A^♭/ϖ^♭) corresponds to Z.

*Hypotheses and conventions.* As in EQ.8/matched-punctured-opens.

*Proof sketch.* Apply EQ.8/tilting-etale-cohomology to the matched pairs (Spec A, Spec A^♭) and (Spec A − Z, Spec A^♭ − Z^♭) and take cones in the cohomology-with-supports triangle (EtaleDualityAndPerverseSheaves EDC.0/cohomology-with-supports). (Česnavičius–Scholze, Theorem 2.2.7, equation (2.2.7.1), p. 21.)

*Needs:* §EQ.8 `tilting-etale-cohomology`; EtaleDualityAndPerverseSheaves EDC.0 `cohomology-with-supports`.

**Checks.**

- For Z = ∅ both sides vanish.
- For A = R̂_∞ as in CS24 3.1.3 and Z the closed point, it identifies H^i_{(p, x_1, …, x_d)}(R̂_∞, ℤ/ℓ) with local cohomology of the tilt.

### Dependencies

This layer requires PerfectoidQuotients Q0, PerfectoidQuotientsPartII Q5, PerfectoidQuotientsPartII Q6, ArcTopologyAndDescent AT.3, ArcTopologyAndDescent AT.8, ArcTopologyAndDescent AT.11, ArcTopologyAndDescent AT.12, EtaleDualityAndPerverseSheaves EDC.0 (with EtaleCohomologyFoundations §F.3).

## Source status

The statements of this roadmap are taken from the texts cited at each target. Four inputs are cited through a text that restates them, and their own proofs are read when the targets are refined: Gabber's affine Lefschetz theorem over a trait (Illusie, *Perversité et variation*, Manuscripta Math. 112 (2003), Théorème 2.4, cited from ILO XV), Gabber's perverse t-structures (Gabber, *Notes on some t-structures*, 2004, cited from ILO XVII §5.2), Epp's theorem (Epp, *Eliminating wild ramification*, Invent. Math. 19 (1973), Theorem 1.9, cited from ILO IV 3.1.2), and Deligne's generic constructibility over an arbitrary noetherian base (SGA 4½ [Th. finitude] 1.9, cited from ILO XIII 2.2.3), which is requested from the étale foundations.

Three slips in ILO are corrected in the statements above: in Exposé XIV Corollaire 2.5.2 the transcendence degree of the induced dimension function is that of κ(y) over κ(f(y)); in Exposé II Théorème 4.2.1 the valuation rings have algebraically closed fraction field (not residue field); and in Exposé IX §1 (and Exposé 0) the prime-to-ℓ uniformization theorem is II-4.3.2, not II-4.3.1.

## Downstream consumers

- PurityForFlatCohomology PF.1 (Gabber's bound H^i_𝔪(R, G) = 0 for i < vdim R) uses EQ.7 `local-lefschetz-hyperplane-theorem` with EQ.7 `local-absolute-purity` for the hypersurface case.
- PurityForFlatCohomology PF.4 and the perfectoid proof of local purity use EQ.8 `tilting-supports`.
- Any roadmap that needs Rf_* to preserve constructibility over quasi-excellent bases (for instance over completions or henselizations of finite-type schemes) uses EQ.4 `gabber-finiteness-theorem`; any that needs a dualizing complex on an excellent scheme not of finite type over a field or a one-dimensional base uses EQ.6 `gabber-duality-theorem`.

## References

- [ILO] L. Illusie, Y. Laszlo, F. Orgogozo (eds.), *Travaux de Gabber sur l'uniformisation locale et la cohomologie étale des schémas quasi-excellents*, Astérisque 363–364 (2014); [arXiv:1207.3648](https://arxiv.org/abs/1207.3648).
- [CS] K. Česnavičius, P. Scholze, *Purity for flat cohomology*, Ann. of Math. 199 (2024), 51–180; [arXiv:1912.10932v3](https://arxiv.org/abs/1912.10932v3).
- [dJ97] A. J. de Jong, *Families of curves and alterations*, Ann. Inst. Fourier 47 (1997), 599–621; [Numdam](http://www.numdam.org/item/AIF_1997__47_2_599_0/).
- [Ill03] L. Illusie, *Perversité et variation*, Manuscripta Math. 112 (2003), 271–295.
- [Gab04] O. Gabber, *Notes on some t-structures*, in Geometric aspects of Dwork theory, de Gruyter (2004), 711–734.
- [Epp73] H. Epp, *Eliminating wild ramification*, Invent. Math. 19 (1973), 235–249.
- [SGA 4½] P. Deligne, *Cohomologie étale*, Lecture Notes in Math. 569 (1977), [Th. finitude].
- [SGA 5] A. Grothendieck et al., *Cohomologie ℓ-adique et fonctions L*, Lecture Notes in Math. 589 (1977), Exposé I.
