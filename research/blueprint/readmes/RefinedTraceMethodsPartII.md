# Hochschild, cyclotomic and refined trace methods, Part II: henselian pairs

This roadmap extends the cyclotomic trace from nilpotent invariance to arbitrary henselian pairs. Its central theorem states that the finite-coefficient fibre of K→TC is henselian invariant. The proof combines nonunital henselian algebra, finite approximation of spectrum-valued functors and equal-characteristic logarithmic calculations. It then gives adic continuity with its F-finiteness boundary, pro logarithmic comparisons, étale trace comparisons and quasisyntomic K-theory consequences.

The objects K, THH, TC, cyclotomic spectra, derived completion, classical de Rham–Witt and syntomic complexes come from their existing owners. Ordinary Hochschild homology and K-zero constructions in Tau Ceti are reused. The independent derived p-adic tower continuation is assigned to RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses by the split proposal; its nine routed items are fully accounted for there.

Conventions: rings are commutative and unital, except for explicitly nonunital algebras; p is prime. Sp≥n uses homotopy grading. E/p^r denotes the cofiber of multiplication by p^r, not π*(E)/p^r; E with Z_p coefficients means its derived p-completion. K is connective unless the nonconnective symbol 𝕂 is shown. K^inv=fib(K→TC), and E(A,I)=fib(E(A)→E(A/I)). All inverse limits of spectra are homotopy limits. An F-finite Z_(p)-algebra means its reduction modulo p is finite over its Frobenius image. Finite free/retract objects form a small skeleton when forming functor categories; universes enlarge the category of all algebras without changing this test subcategory. Classical singular de Rham–Witt is never replaced silently by the saturated complex. Witt length r and ideal depth s are independent, even when a diagonal pro-system uses r=s.

The complete reader below states every target, proof route, API, test and supplier contract. All implementation statuses are unchecked. A complete plan means every routed target has an owner and a dependency chain, including explicitly open supplier requests; it does not assert formalisation or closed supplier work.

## Construction order and ownership

| Layer | Purpose | New targets | Planets |
|---|---|---:|---:|
| HP.0 | Nonunital henselian algebra | 9 | 5 |
| HP.1 | Finite-coefficient cyclotomic continuity | 10 | 4 |
| HP.2 | Finite approximation of functors | 11 | 4 |
| HP.3 | Pseudocoherence of the trace functors | 7 | 4 |
| HP.4 | Cartier defects and equal-characteristic rigidity | 6 | 3 |
| HP.5 | Rigidity of the cyclotomic trace fibre | 4 | 2 |
| HP.6 | Adic continuity and its boundary | 7 | 3 |
| HP.7 | Pro logarithmic comparisons | 8 | 5 |
| HP.8 | Étale and semiperfect trace comparisons | 12 | 6 |
| HP.9 | Quasisyntomic K-theory consequences | 5 | 4 |

The build order is HP.0 and HP.1, then HP.2–HP.5, followed by HP.6–HP.9. The pro logarithmic layer uses HP.6 finite THH base change. HP.8 supplies HP.9 with the semiperfect connective comparison. The converse continuity argument in HP.6 is a separate implication and is never used in the preceding proof of rigidity.

## Library baseline

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti is pinned at `f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap and current Tau Ceti were also searched to avoid proposing completed work.

- `mathlib:Unitization` in `Mathlib/Algebra/Algebra/Unitization.lean`: The existing R × I carrier and unitization multiplication for a nonunital R-algebra.
- `mathlib:Unitization.fstHom` in `Mathlib/Algebra/Algebra/Unitization.lean`: The augmentation from the unitization to its scalar ring.
- `mathlib:Unitization.inrNonUnitalAlgHom` in `Mathlib/Algebra/Algebra/Unitization.lean`: The nonunital-algebra inclusion of I in its unitization.
- `mathlib:Unitization.lift` in `Mathlib/Algebra/Algebra/Unitization.lean`: The equivalence between nonunital algebra maps out of I and algebra maps out of its unitization.
- `mathlib:HenselianRing` in `Mathlib/RingTheory/Henselian.lean`: The Jacobson-radical and monic simple-root lifting definition for a pair (A,I).
- `mathlib:KaehlerDifferential` in `Mathlib/RingTheory/Kaehler/Basic.lean`: The cotangent module of the multiplication ideal, i.e. ordinary Kähler differentials Ω_(S/R).
- `mathlib:KaehlerDifferential.D` in `Mathlib/RingTheory/Kaehler/Basic.lean`: The universal R-derivation S→Ω_(S/R), including its Leibniz law.
- `mathlib:exteriorPower.ιMulti` in `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean`: The canonical alternating map into the existing nth exterior power, with x∧x=0 also in characteristic two.

The existing unitization is the carrier throughout HP.0. Tau Ceti’s current ordinary henselian idempotent API is an existing input to the projective lifting argument. DGAInfinity owns the ordinary Hochschild complex and GrothendieckEulerForms owns the elementary Grothendieck-group constructions. Neither is rebuilt here.

## Sources and versions

- **CMM21**: Dustin Clausen, Akhil Mathew and Matthew Morrow, [K-theory and topological cyclic homology of henselian pairs](https://arxiv.org/abs/1803.10897v2), arXiv:1803.10897v2 (20 July 2020), 59 pages; node page numbers refer to this version. Read 19 October 2026: §§1–4, pp. 1–37; §5.1, pp. 37–41; §5.3, pp. 45–49; §6, pp. 50–56; §5.2, pp. 41–45, read to establish the separate tower route and source corrections. SHA-256 `ad23c1d7b818b85e1752cdc4b01ec9442a9c62c3c8e85ebd7cf6f4584c6abd9c`.
- **CMM21-journal**: Dustin Clausen, Akhil Mathew and Matthew Morrow, [K-theory and topological cyclic homology of henselian pairs](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/CMM21.pdf), JAMS 34 (2021), 411–473. Read 19 October 2026: Remark 3.11; proof of Theorem 5.21; proof of Corollary 5.33; Proposition 6.12, checked against the arXiv findings; Definition 5.14, p. 455, checked against the unbounded tower counterexample. SHA-256 `40e40c18de3def69afcea2bb5cb67abfb56290755df942f913ae2a2c6a6a326e`.
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, [Topological Hochschild homology and integral p-adic Hodge theory](https://pmihes.centre-mersenne.org/item/10.1007/s10240-019-00106-9.pdf), Publ. Math. IHÉS 129 (2019), 199–310; printed page numbers. Read 19 October 2026: Theorems 7.14–7.15, Propositions 7.16–7.17, pp. 261–263; Remarks 7.19–7.20 and Proposition 7.21, pp. 263–264; Proposition 8.20 and Corollary 8.23, pp. 281–283. SHA-256 `6b43d1ff3c3f345db85100562a30c2bcbb6fcbfc2874ce899f8b4ded23ff23dd`.
- **BS22**: Bhargav Bhatt and Peter Scholze, [Prisms and prismatic cohomology](https://arxiv.org/abs/1905.08229v4), arXiv:1905.08229v4 (2022); read in the maintainer-cleared library. Read 19 October 2026: §14, Theorem 14.1, Corollaries 14.2–14.3 and Lemmas 14.4–14.5, pp. 97–101. SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.
- **Morrow19**: Matthew Morrow, [K-theory and logarithmic Hodge–Witt sheaves of formal schemes in characteristic p](https://www.numdam.org/item/ASENS_2019__52_6_1537_0.pdf), Ann. Sci. Éc. Norm. Supér. 52 (2019), 1537–1601. Read 19 October 2026: Proposition 2.20, p. 1557; Corollaries 4.1–4.2 and Remark 4.3, pp. 1566–1567; Corollary 4.8, p. 1573. SHA-256 `54988085dbe216661b2e3e7ff5ddc6479240f424b10a8c83727973f828ded4e2`.
- **BLM**: Bhargav Bhatt, Jacob Lurie and Akhil Mathew, [Revisiting the de Rham–Witt complex](https://www.math.ias.edu/~lurie/papers/Crystalline.pdf), Author PDF, version retrieved 19 October 2026; numbering differs from older versions. Read 19 October 2026: Propositions 2.7.1 and 2.7.5, pp. 23–24; Proposition 4.3.3 and Remark 4.3.4, p. 49. SHA-256 `dad4e554ad5847a9c7410a42d8d4f8eb37afffae643ed55ccdf11471278ece0d`.
- **vdK80**: Wilberd van der Kallen, [Homology stability for linear groups](https://webspace.science.uu.nl/~kalle101/homstab1980.pdf), Invent. Math. 60 (1980), 269–295; scan includes a cover sheet. Read 19 October 2026: §1, pp. 269–271; §4.8 and its proof, pp. 287–288. SHA-256 `dbde8c28546336829113f7fa419b68241d32e1c816c34485621aaabbd98b75a5`.
- **DM17**: Bjørn Ian Dundas and Matthew Morrow, [Finite generation and continuity of topological Hochschild and cyclic homology](https://www.numdam.org/item/10.24033/asens.2319.pdf), Ann. Sci. Éc. Norm. Supér. 50 (2017), 201–238; published numbering. Read 19 October 2026: Corollary 2.2, p. 205; Theorem 4.7 and proof, pp. 221–222; Proposition 5.1, Lemma 5.2, Theorem 5.3, Corollary 5.4 and Theorem 5.5, pp. 223–226; Theorem 5.14 and Corollary 5.15, pp. 230–231. SHA-256 `f9aadefb0c48a164f977a6d4216d82211779cf1ce4a9fa1e1cab9c170abae8ca`.

CMM locators below use arXiv v2 page numbers; journal-specific corrections name the printed pages explicitly. BS22 was read in the maintainer-cleared reference library. Source material is restated here in mathematical prose.

## HP.0. Nonunital henselian algebra

Use the existing nonunital ring and unitization carriers to construct the category of henselian nonunital algebras, its free objects and reflection. Prove Gabber’s ambient-independence theorem, compatibility with Milnor squares and rational rescaling.

### Nonunital and augmented algebras

Target `RefinedTraceMethodsPartII:HP.0/augmented-equivalence` (construction). Planet: **Nonunital augmented equivalence**.

For each commutative R, construct an equivalence from nonunital commutative R-algebras to augmented commutative R-algebras. Send I to the existing Unitization R I with augmentation (r,x)↦r; send an augmentation A→R to its kernel. The unit and counit are natural algebra isomorphisms. Bundle this category over the existing carriers and nonunital algebra homomorphisms; its forgetful functor creates limits and sifted colimits. The augmentation ideal of R[X_s] is free on the set of variables.

**Proof or construction.** 1. Use Unitization.lift for the forward map on morphisms. 2. For an augmentation ε, decompose a as the scalar ε(a) plus an element of ker ε; prove both inverse identities and naturality.

**Inputs.** `mathlib:Unitization`, `mathlib:Unitization.fstHom`, `mathlib:Unitization.inrNonUnitalAlgHom`, `mathlib:Unitization.lift`.

**Source.** CMM21, §3.1, pp. 17–18. The cited result supplies nonunital and augmented algebras with the hypotheses stated here.

**Check.** The multiplication is (r,x)(s,y)=(rs,ry+sx+xy), including the xy term.

**Uses.** CMM21 §§3–4: Translates intrinsic ideals to existing unital algebra APIs and defines K on nonunital rings.

**API.**

- `NonUnitalAlg.augmentedEquiv` (equivalence): Equivalence with the category of augmented R-algebras.
- `NonUnitalAlg.augmentationKernel` (compatibility): The kernel of the unitization augmentation is naturally I.
- `NonUnitalAlg.augmentedEquiv_map` (functoriality): On maps, send f to (r,x)↦(r,f(x)); preserve identities and composition.
- `NonUnitalAlg.augmentedEquiv_counit` (simp): The counit sends (r,x) to algebraMap(r)+x.
- `NonUnitalAlg.free_hom` (universal-property): Maps from the polynomial augmentation ideal to I correspond naturally to functions from the generators to I.
- `NonUnitalAlg.forget_createsSiftedColimits` (compatibility): The underlying set of a sifted colimit is its set-level sifted colimit.

**Unit tests.**

- `NonUnitalAlg.augmentedEquiv_zero` (degenerate): The zero nonunital algebra has augmented algebra R→R.
- `NonUnitalAlg.augmentedEquiv_squareZero` (computation): For an R-module with zero multiplication, (0,x)(0,y)=0 in its unitization.
- `NonUnitalAlg.augmentedEquiv_nonSquareZero` (non-example): For I=R with its original multiplication, (0,1)^2=(0,1), so this is not the square-zero extension.

### Local nonunital algebras

Target `RefinedTraceMethodsPartII:HP.0/local-nonunital` (definition). Planet: **Local nonunital algebra**.

A nonunital commutative algebra I is local in the nonunital sense if for every x∈I there is y∈I with x+y+xy=0. Prove uniqueness of y and equivalence to 1+x being a unit in R⋉I for every x, hence to I lying in the Jacobson radical of R⋉I. This adjective does not assert that R⋉I is a local ring.

**Proof or construction.** 1. Multiply (1+x)(1+y) and use uniqueness of inverses. 2. An element of the augmentation kernel is radical precisely when all its scalar multiples have 1 minus that element invertible.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/augmented-equivalence`.

**Source.** CMM21, §3.1, pp. 18–19. The cited result supplies local nonunital algebras with the hypotheses stated here.

**Check.** For I=0 over R=Z, the condition holds although its unitization Z is not local.

**Uses.** CMM21 Lemma 4.20 and Proposition 4.19: Controls projective lifting and the uniform stable range.

**API.**

- `IsLocalNonUnital` (characterisation): The displayed quasi-inverse existence predicate.
- `IsLocalNonUnital.quasiInverse` (data): The unique y with x+y+xy=0.
- `IsLocalNonUnital.quasiInverse_unique` (extensionality): Any two solutions of the quasi-inverse equation agree.
- `isLocalNonUnital_iff_jacobson` (compatibility): Equivalent to the augmentation ideal lying in the Jacobson radical.
- `IsLocalNonUnital.map_quasiInverse` (functoriality): Nonunital maps preserve quasi-inverses.

**Unit tests.**

- `IsLocalNonUnital.zero` (degenerate): The zero nonunital algebra is local.
- `IsLocalNonUnital.squareZero` (computation): If I²=0, the quasi-inverse of x is −x.
- `IsLocalNonUnital.int_nonexample` (non-example): Z as a nonunital ring fails: x=1 would require 1+2y=0 in Z.

### Localization at one plus the ideal

Target `RefinedTraceMethodsPartII:HP.0/local-reflection` (construction).

The inclusion of local nonunital R-algebras has a left adjoint. Its value on I is the augmentation kernel of (R⋉I)[(1+I)⁻¹]→R. Maps I→J with J local factor uniquely through it; the construction is independent of the ambient unital presentation of I.

**Proof or construction.** 1. Localize the unitization at the multiplicative set of all 1+x. 2. Use the localization universal property and the augmented equivalence; the kernel has the same universal property for every presentation.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/augmented-equivalence`, `RefinedTraceMethodsPartII:HP.0/local-nonunital`.

**Source.** CMM21, §3.1, pp. 18–19. The cited result supplies localization at one plus the ideal with the hypotheses stated here.

**Check.** The unit is an isomorphism exactly for local nonunital I.

**Uses.** CMM21 Example 3.5 and Remark 3.11: Produces free local objects and the local algebraic theory.

**API.**

- `NonUnitalAlg.localize` (constructor): The local reflection and its unit.
- `NonUnitalAlg.localize_lift` (universal-property): Hom(localize I,J)≅Hom(I,J) for local J.
- `NonUnitalAlg.localize_idempotent` (characterisation): A second local reflection is naturally isomorphic to the first.
- `NonUnitalAlg.localize_map` (functoriality): Maps are induced by localization, respecting identity and composition.

**Unit tests.**

- `NonUnitalAlg.localize_zero` (degenerate): The reflection of zero is zero.
- `NonUnitalAlg.localize_squareZero` (compatibility): A square-zero nonunital algebra maps isomorphically to its reflection.
- `NonUnitalAlg.localize_int` (computation): For I=Z as a nonunital ring, localization inverts 1+(0,n) for every integer n in Z⋉Z; this is not the identity on I.

### Henselian nonunital algebras

Target `RefinedTraceMethodsPartII:HP.0/henselian-nonunital` (definition). Planet: **Henselian nonunital algebra**.

A nonunital commutative R-algebra I is henselian if, for every n≥1 and g∈I[T], the equation T(1+T)^{n−1}+g(T)=0 has a unique solution in I. Interpret g by evaluation in the unitization, with coefficients in its augmentation ideal. This notion is independent of R and implies local nonunitality.

**Proof or construction.** 1. Apply the simple-root characterization of henselian pairs to the displayed polynomial at zero. 2. Translate the converse polynomial factor-lifting criterion through the augmentation kernel; n=1 alone is not the definition.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/augmented-equivalence`, `mathlib:HenselianRing`, `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`.

**Source.** CMM21, §3.1, pp. 19–20. The cited result supplies henselian nonunital algebras with the hypotheses stated here.

**Check.** For an ideal I⊂A, the intrinsic definition agrees with HenselianRing A I (the ambient-independence theorem below).

**Uses.** CMM21 Theorem 4.36: Gives the algebraic category on which axiomatic rigidity applies.

**API.**

- `IsHenselianNonUnital` (characterisation): The all-degree root condition just stated.
- `IsHenselianNonUnital.root` (constructor): The unique root for a chosen n and coefficient polynomial g.
- `IsHenselianNonUnital.root_spec` (simp): Evaluation at this root is zero and the root lies in I.
- `IsHenselianNonUnital.root_unique` (extensionality): Any other root in I agrees with it.
- `IsHenselianNonUnital.isLocalNonUnital` (compatibility): Henselian nonunital algebras have quasi-inverses.

**Unit tests.**

- `IsHenselianNonUnital.zero` (degenerate): The zero nonunital algebra is henselian.
- `IsHenselianNonUnital.nilpotent` (compatibility): Every nilpotent ideal is henselian intrinsically, agreeing with its ambient henselian pair.
- `IsHenselianNonUnital.complete` (computation): The nonunital ideal t F_p[[t]] is henselian; for g(T)=−t and n=1 its root is t.

### Henselian algebra limits and quotients

Target `RefinedTraceMethodsPartII:HP.0/henselian-permanence` (theorem).

The forgetful functor from henselian nonunital R-algebras to sets creates limits and sifted colimits. Quotients of a henselian nonunital algebra by any ideal are henselian. Changing the scalar ring along a compatible action does not change intrinsic henselianity.

**Proof or construction.** 1. Encode each unique root as a finitary operation, so equations are preserved by limits and sifted colimits. 2. For a quotient lift finitely many coefficients to I, solve there and descend; uniqueness is inherited from the simple-root factor criterion.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-nonunital`.

**Source.** CMM21, §3.1, Lemma 3.9 and Remark 3.11, pp. 19–20. The cited result supplies henselian algebra limits and quotients with the hypotheses stated here.

**Check.** Filtered colimits need no common nilpotence exponent.

### Henselian reflection and finite free projectives

Target `RefinedTraceMethodsPartII:HP.0/henselian-reflection` (construction). Planet: **Free henselian nonunital algebra**.

The full inclusion of henselian nonunital R-algebras admits a left adjoint I↦Iʰ. Let R{X_s}⁺ be the reflection of the augmentation ideal of R[X_s]. It is free on the set of generators. This category is the category of models of a finitary algebraic theory; its compact projective objects are precisely retracts of free objects on finite sets. Here projectivity means lifting against surjective algebra maps, and compactness means preservation of filtered colimits by the set-valued Hom functor.

**Proof or construction.** 1. Use orthogonality to the finite-presentation maps encoding root existence and uniqueness, or henselize the augmented pair. 2. The free/forgetful adjunction and the finitary operations give monadicity; finite free objects are compact projective and projective presentations split to give the retract characterization.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-nonunital`, `RefinedTraceMethodsPartII:HP.0/henselian-permanence`, `EnhancedDerivedSheaves:E3`.

**Source.** CMM21, §3.1, Remark 3.11 and Definition 3.14, pp. 19–21. The cited result supplies henselian reflection and finite free projectives with the hypotheses stated here.

**Check.** The free functor is a left adjoint; do not reverse this variance.

**Uses.** CMM21 §§4.1–4.3: Finite free and retract objects are the projective test category for pseudocoherence.

**API.**

- `NonUnitalAlg.henselize` (constructor): Reflection with unit I→Iʰ.
- `NonUnitalAlg.henselize_lift` (universal-property): Maps Iʰ→J into henselian J correspond uniquely to maps I→J.
- `HenselianNonUnitalAlg.free` (constructor): The finite or arbitrary-set free algebra R{X_s}⁺.
- `HenselianNonUnitalAlg.free_hom` (universal-property): Maps from the free algebra to J correspond to families of elements of J.
- `HenselianNonUnitalAlg.compactProjective_iff` (characterisation): Compact projective iff a retract of a finite free object. Use projectivity against surjections.
- `NonUnitalAlg.henselize_map` (functoriality): The reflection is functorial and idempotent up to its canonical isomorphism.

**Unit tests.**

- `HenselianNonUnitalAlg.free_empty` (degenerate): The free algebra on the empty set is zero.
- `HenselianNonUnitalAlg.free_one` (characterisation): Hom(R{T}⁺,I) is naturally the underlying set of I, not its units.
- `NonUnitalAlg.henselize_nilpotent` (compatibility): The unit I→Iʰ is an isomorphism for a nilpotent I.

### Gabber ambient independence

Target `RefinedTraceMethodsPartII:HP.0/ambient-independence` (theorem). Planet: **Gabber ambient independence**.

For any ideal I of a commutative ring A, the pair (A,I) is henselian exactly when I with its inherited nonunital multiplication is henselian. Consequently any two unital embeddings of the same nonunital ring give the same henselian-pair condition.

**Proof or construction.** 1. Use the polynomial criterion in SF.0/henselian-pair-characterisations and the root operations of henselian-nonunital. 2. Use local nonunitality for the Jacobson-radical requirement.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-nonunital`, `RefinedTraceMethodsPartII:HP.0/local-nonunital`, `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`.

**Source.** CMM21, Theorem 3.16 and Corollary 3.17, pp. 20–21. The cited result supplies gabber ambient independence with the hypotheses stated here.

**Check.** The statement applies to I inside A and inside Z⋉I without a noetherian assumption.

### Henselization and Milnor squares

Target `RefinedTraceMethodsPartII:HP.0/henselized-milnor-squares` (theorem).

Given a Milnor square of commutative rings with surjective vertical maps and identified kernels I, henselizing each pair along I gives another Milnor square, both cartesian and cocartesian. If S→T is the horizontal map then Tʰ≅Sʰ⊗_S T and Iʰ≅I⊗_S Sʰ. This kernel is the intrinsic reflection of I, independent of S.

**Proof or construction.** 1. Express henselization as a filtered colimit of étale neighborhoods, using flatness and the fixed quotient to identify kernels. 2. Base change those neighborhoods through the Milnor pushout; the universal property identifies the resulting henselizations.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/ambient-independence`, `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `SchemeAndStackFoundations:key/henselization`, `SchemeAndStackFoundations:SF.0/henselization-flat`.

**Source.** CMM21, §3.2, Lemma 3.21 and Corollary 3.22, pp. 21–23. The cited result supplies henselization and milnor squares with the hypotheses stated here.

**Check.** Test the unitization Milnor square and I=0; the tensor formula retains the pair along which henselization is taken.

### Rational free henselian algebras by rescaling

Target `RefinedTraceMethodsPartII:HP.0/rational-free-rescaling` (theorem).

For a finite set of variables, Q{X_1,…,X_n}⁺ is the filtered colimit of Z{X_1,…,X_n}⁺ indexed by positive integers ordered by divisibility, where the map from N to NM rescales every variable by M. The resulting rational scalar action is intrinsic.

**Proof or construction.** 1. First form the corresponding rational polynomial augmentation ideal by rescaling. 2. Henselian reflection preserves colimits; use its universal property and invertibility of every nonzero integer in rational targets.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.0/henselian-permanence`.

**Source.** CMM21, §3.2, discussion after Corollary 3.22, p. 23. The cited result supplies rational free henselian algebras by rescaling with the hypotheses stated here.

**Check.** The transition is X↦MX, so common rescaling kills a finite family whose image vanishes rationally.

## HP.1. Finite-coefficient cyclotomic continuity

Prove the connectivity, module calculation, finite homotopy-orbit approximation and uniform pro-constancy theorems that make TC modulo p preserve filtered colimits and realizations. Give the strict Dieudonné proof as a second route.

### Connectivity of topological cyclic homology

Target `RefinedTraceMethodsPartII:HP.1/tc-connectivity` (theorem). Planet: **Connectivity of TC**.

For a p-complete cyclotomic spectrum X with underlying spectrum in Sp≥n, TC(X) lies in Sp≥n−1. In particular TC/p on connective cyclotomic spectra preserves geometric realizations.

**Proof or construction.** 1. Use the classical TR comparison from RT.2: the restriction tower is n-connective and its bottom homotopy maps are surjective. 2. The Milnor sequence eliminates the bottom lim¹. Exactness plus the uniform lower bound identifies the finite skeleta of a realization.

**Inputs.** `RefinedTraceMethods:RT.2/tr-and-genuine-tc`, `RefinedTraceMethods:RT.2/restriction-pullback`, `RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`.

**Source.** CMM21, Lemma 2.5 and Corollary 2.6, p. 8. The cited result supplies connectivity of topological cyclic homology with the hypotheses stated here.

**Check.** TC of a discrete ring may have π−1; the bound is not connective.

### The trivial cyclotomic Eilenberg–MacLane algebra

Target `RefinedTraceMethodsPartII:HP.1/trivial-hfp` (theorem).

For HF_p with trivial cyclotomic structure, π*TC⁻=F_p[x] and π*TP=F_p[x,x⁻¹], |x|=−2. The canonical map is the polynomial inclusion, while cyclotomic Frobenius sends x to zero and acts identically on π0.

**Proof or construction.** 1. Compute homotopy fixed points and Tate cohomology of the trivial circle action. 2. Use the trivial cyclotomic adjunction to calculate Frobenius on the degree −2 generator; distinguish HF_p^triv from THH(F_p).

**Inputs.** `RefinedTraceMethods:RT.2/trivial-cyclotomic-adjunction`, `RefinedTraceMethods:RT.2/tate-of-eilenberg-maclane`, `RefinedTraceMethods:RT.2/circle-tate`, `RefinedTraceMethods:RT.2/tc-fibre-sequence`, `RefinedTraceMethods:RT.2`.

**Source.** CMM21, Lemma 2.10, pp. 9–10. The cited result supplies the trivial cyclotomic eilenberg–maclane algebra with the hypotheses stated here.

**Check.** Frobenius kills x, whereas the canonical map does not.

### TC of trivial HF-p modules

Target `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre` (theorem).

For a module X over the commutative cyclotomic algebra HF_p^triv, there is a natural fibre sequence TC(X)→X→X_hT. Thus TC on these modules preserves all colimits. For an HZ-module with circle action, the Euler class gives cofibres Σ⁻²X^hT→X^hT→X, X→X_hT→Σ²X_hT, and Σ⁻²X^hT→X^tT→X_hT. In particular the unit HF_p^triv is compact in Mod_(HF_p^triv)(CycSp), since its mapping spectrum into X is TC(X).

**Proof or construction.** 1. Obtain the three Euler-class sequences by tensoring the universal circle sequence with X over HZ. 2. On an HF_p^triv-module xφ vanishes by trivial-hfp, and the TC equalizer combines with the third sequence to yield the fibre formula.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/trivial-hfp`, `RefinedTraceMethods:RT.2/tc-fibre-sequence`, `RefinedTraceMethods:RT.2/hz-module-circle-tate`.

**Source.** CMM21, Lemma 2.11, Proposition 2.12 and Corollary 2.13, pp. 10–11. The cited result supplies tc of trivial hf-p modules with the hypotheses stated here.

**Check.** The fibre formula preserves colimits; general cyclotomic TC need not.

### Finite-coefficient TC preserves colimits

Target `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits` (theorem). Planet: **Finiteness of TC mod p**.

For connective cyclotomic spectra, TC(−)/p preserves all colimits in that connective subcategory. Consequently A↦TC(A)/p on connective E1 ring spectra preserves sifted colimits. The corresponding statements hold for /p^r, r≥1.

**Proof or construction.** 1. The projection formula TC(X)⊗HF_p≃TC(X⊗HF_p^triv) follows first for finite spectra, then from realizations and connectivity. 2. Use hfp-module-fibre after smashing with HF_p; bounded-below Hurewicz detection transfers filtered-colimit preservation to S/p. 3. THH preserves sifted colimits of connective E1 rings by its cyclic bar model. Induct on r using coefficient cofibres.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/tc-connectivity`, `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre`, `RefinedTraceMethods:RT.2/trivial-cyclotomic-adjunction`, `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`, `RefinedTraceMethods:RT.2/thh-e1-ring`, `StableHomotopyKTheory:H.5:spectra`.

**Source.** CMM21, Theorem 2.7 and Corollary 2.15, pp. 8–12. The cited result supplies finite-coefficient tc preserves colimits with the hypotheses stated here.

**Check.** Check a filtered perfection of F_p[t] and a simplicial free resolution; integral TC is a different assertion.

### Finite homotopy-orbit approximation to TC

Target `RefinedTraceMethodsPartII:HP.1/orbit-approximation` (theorem).

Uniformly in connective cyclotomic X and n≥0, τ≤n(TC(X)/p) agrees with τ≤nTC(X⊗τ≤n+1(S/p)^triv). The latter untruncated functor lies in the thick subcategory generated by (X⊗HF_p^triv)_hT.

**Proof or construction.** 1. The Moore truncation has a finite Postnikov filtration with finite HF_p subquotients. 2. Apply tc-connectivity to the truncation error and hfp-module-fibre to its Postnikov subquotients.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/tc-connectivity`, `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre`, `StableHomotopyKTheory:H.5:spectra`.

**Source.** CMM21, Proposition 2.19, p. 13. The cited result supplies finite homotopy-orbit approximation to tc with the hypotheses stated here.

**Check.** The cutoff before TC is n+1; cutoff n can lose degree n.

### Uniform pro-zero criterion

Target `RefinedTraceMethodsPartII:HP.1/uniform-pro-zero` (theorem).

Let C admit countable coproducts and F_r:C→Ab be a tower of countable-coproduct-preserving functors. If lim F_r(c)=0 and lim¹ F_r(c)=0 for every c, then for every r some s≥r makes F_s→F_r the zero natural transformation. A corresponding criterion holds for spectra-valued functors in one common finite homotopy range [a,b] with vanishing inverse limit.

**Proof or construction.** 1. Use the countable-coproduct form of the Mittag–Leffler criterion. If no uniform s exists, choose witnesses c_s and evaluate on their coproduct to contradict Mittag–Leffler and zero limit. 2. For spectra induct over the finite Postnikov filtration; retain the uniform boundedness hypothesis.

**Inputs.** `StableHomotopyKTheory:H.6`.

**Source.** CMM21, Lemmas 2.20–2.21, p. 14. The cited result supplies uniform pro-zero criterion with the hypotheses stated here.

**Check.** The index s is independent of c. The countable-coproduct/lim¹ criterion is an explicit supplier contract.

### Uniform pro-constancy of finite-level TC

Target `RefinedTraceMethodsPartII:HP.1/uniform-pro-tc` (theorem). Planet: **Uniform pro-constancy of TC**.

For every k, the tower of functors X↦τ≤k(TC^r(X)/p) on connective cyclotomic spectra is pro-isomorphic to the constant functor τ≤k(TC(X)/p). Here TC^r is the finite-stage classical restriction/Frobenius construction supplied by RT.2.

**Proof or construction.** 1. Apply uniform-pro-zero to the truncated comparison fibres in a common finite homotopy range. 2. Finite TC stages preserve countable coproducts in that range by their finite-limit construction; their inverse limit is TC.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/uniform-pro-zero`, `RefinedTraceMethodsPartII:HP.1/tc-connectivity`, `RefinedTraceMethods:RT.2/tr-and-genuine-tc`, `RefinedTraceMethods:RT.2/restriction-pullback`.

**Source.** CMM21, Proposition 2.22, pp. 14–15. The cited result supplies uniform pro-constancy of finite-level tc with the hypotheses stated here.

**Check.** The pro-isomorphism is uniform in X, allowing exchange of two pro indices.

### TC and connective tower limits

Target `RefinedTraceMethodsPartII:HP.1/connective-tower-limits` (theorem).

A tower of connective cyclotomic spectra has a limit created on underlying spectra; it is (−1)-connective. TC preserves this limit. Retain the derived inverse limit and its Milnor lim¹ terms.

**Proof or construction.** 1. Use the bounded-below Tate construction comparison in RT.2 to create the limit. 2. TC is right adjoint to the trivial cyclotomic functor, hence preserves this limit.

**Inputs.** `RefinedTraceMethods:RT.2/trivial-cyclotomic-adjunction`, `RefinedTraceMethods:RT.2/bounded-below-cyclotomic-equivalence`, `RefinedTraceMethods:RT.2/tr-and-genuine-tc`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`.

**Source.** CMM21, Remark 2.8, p. 9. The cited result supplies tc and connective tower limits with the hypotheses stated here.

**Check.** A tower of connective spectra can acquire π−1.

### Finitary Frobenius defects in strict Dieudonné complexes

Target `RefinedTraceMethodsPartII:HP.1/strict-dieudonne-fixed-points` (theorem). Planet: **Frobenius defects are finitary**.

For a strict Dieudonné complex X set A^n=X^n/(VX^n+dVX^{n−1}) and B^n=X^n/(VX^n+dX^{n−1}); F induces F̄:A^n→B^n. The square from F−1:X^n/p→X^n/p to F̄−1:A^n→B^n is cartesian and cocartesian in abelian groups. Thus ker and coker of F−1 in each degree preserve filtered colimits of strict Dieudonné complexes.

**Proof or construction.** 1. The vertical kernels are generated by V,dV and V,d respectively. Surjectivity of F−1 follows from (F−1)V=−V mod p and (F−1)dΣ_{i>0}V^i=d. 2. For x=Vy+dVz with (F−1)x∈pX, one has dx∈pX, so saturation gives y∈im F. Next d(z−Vz)∈pX gives z−Vz∈im F; V-adic convergence of (1−V)⁻¹ gives z∈im F. Hence x∈pX, proving injectivity. 3. BLM Proposition 4.3.3 and Remark 4.3.4 imply W1 preserves filtered colimits in the strict category. B is a finite quotient of A. Use exactness of filtered colimits of abelian groups.

**Inputs.** `CrystallineCohomology:CR.4/strict-dieudonne-complex`, `CrystallineCohomology:CR.4/strict-dieudonne-tower`, `CrystallineCohomology:CR.4/saturated-F-range`, `CrystallineCohomology:CR.4/strict-completion`.

**Source.** CMM21, Proposition 2.27, p. 17. The cited result supplies finitary frobenius defects in strict dieudonné complexes with the hypotheses stated here.; BLM, Propositions 2.7.1, 2.7.5, pp. 23–24; Proposition 4.3.3 and Remark 4.3.4, p. 49. Strict completion and W_r give the finite-quotient filtered-colimit calculation.

**Check.** X^n/p itself need not preserve filtered colimits.

### Witt proof of characteristic-p TC continuity

Target `RefinedTraceMethodsPartII:HP.1/witt-tc-continuity` (comparison).

For a filtered diagram of ind-smooth F_p-algebras with colimit R, colim TC(R_i)/p≃TC(R)/p. Via the imported TR comparison, π_n(TC(R)/p) is an extension of coker(F−1 on WΩ_R^{n+1}/p) by ker(F−1 on WΩ_R^n/p).

**Proof or construction.** 1. Use the p-torsion-free integral de Rham–Witt TR calculation. 2. Apply strict-dieudonne-fixed-points degreewise and exactness of filtered colimits to the short exact homotopy sequences.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/strict-dieudonne-fixed-points`, `RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`.

**Source.** CMM21, Proposition 2.26, pp. 15–17. The cited result supplies witt proof of characteristic-p tc continuity with the hypotheses stated here.

**Check.** At n=−1 only the degree-zero cokernel remains.

## HP.2. Finite approximation of functors

Develop relative perfectness and pseudocoherence, their closure and recognition results, projective pseudocoherence on henselian nonunital rings, simplicial free resolutions and the axiomatic rigidity criterion.

### The suspension–loop Goodwillie tower

Target `RefinedTraceMethodsPartII:HP.2/suspension-loop-goodwillie-tower` (theorem).

There is a natural tower P_n of functors Sp→Sp receiving Σ∞Ω∞→P_n, with P_1(X)≃X and fib(P_n(X)→P_{n−1}(X))≃(X^{⊗n})_hΣ_n for n≥2. On Sp≥1 the map Σ∞Ω∞X→lim_n P_n(X) is an equivalence, and the connectivity of its comparison with P_n tends uniformly to infinity.

**Proof or construction.** 1. Use the Goodwillie polynomial approximation construction and identify the multilinear cross-effect of Σ∞Ω∞ with the n-fold smash product. Symmetric coinvariants give the homogeneous layer. 2. The connected-input connectivity estimate makes the Taylor tower converge uniformly on Sp≥1. This is the specific tower of CMM Proposition 4.9, rather than an extension of RT.3’s first-derivative node.

**Inputs.** `RefinedTraceMethods:RT.3/goodwillie-calculus`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `RefinedTraceMethods:RT.2/homotopy-orbits-fixed-points`, `RefinedTraceMethods:RT.3`.

**Source.** CMM21, Proposition 4.9 and its introduction, pp. 26–27. The cited result supplies the suspension–loop goodwillie tower with the hypotheses stated here.

**Check.** For X=ΣHZ the nth layer is n-connective; no convergence is asserted on all nonconnective spectra.

### Perfect and pseudocoherent functors

Target `RefinedTraceMethodsPartII:HP.2/pseudocoherent-functor` (definition). Planet: **Pseudocoherent functor**.

For a small category D, a functor F:D→Sp is perfect if it lies in the thick subcategory generated by Σ∞_+Hom_D(d,−). It is pseudocoherent if for every integer n there is a perfect P→F inducing an equivalence after τ≤n. An abelian-valued functor is finitely generated if it is a quotient of a finite sum of Z[Hom_D(d,−)]. Pseudocoherence implies a lower homotopy bound uniform on D.

**Proof or construction.** 1. Form the thick closure using finite cofibres, shifts and retracts. 2. A perfect approximation at n=0 gives a uniform lower bound; pointwise finite generation does not suffice.

**Inputs.** `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`.

**Source.** CMM21, Definitions 4.1–4.2, pp. 23–24. The cited result supplies perfect and pseudocoherent functors with the hypotheses stated here.

**Check.** Corepresentables and the zero functor are perfect.

**Uses.** CMM21 Propositions 4.19–4.26: Makes finite approximation of K and TC a precise reusable property.

**API.**

- `Functor.IsPerfectRelative` (characterisation): Membership in this thick closure.
- `Functor.IsPseudocoherentRelative` (characterisation): Perfect approximation through every integer cutoff.
- `Functor.IsFinitelyGeneratedRelative` (characterisation): A finite sum of additive corepresentables surjects onto the functor.
- `Functor.IsPseudocoherentRelative.approximation` (data): An approximation together with its truncation equivalence for each n.
- `Functor.IsPseudocoherentRelative.congr` (compatibility): Natural equivalences preserve these properties.

**Unit tests.**

- `Functor.pseudocoherent_zero` (degenerate): The zero perfect object approximates zero at every cutoff.
- `Functor.pseudocoherent_corepresentable` (compatibility): Every spectral corepresentable is perfect and pseudocoherent.
- `Functor.pseudocoherent_unboundedBelow` (non-example): On the terminal category, ⊕_{j≥0}Σ^{−j}HF_p is not pseudocoherent since it has no lower homotopy bound.

### Relative finite approximation

Target `RefinedTraceMethodsPartII:HP.2/relative-pseudocoherence` (definition).

For a small full subcategory D⊂C, define D-perfect functors using the thick closure of Σ∞_+Hom_C(d,−) for d∈D, and D-pseudocoherence by approximation at every cutoff. F is D-pseudocoherent iff it is left Kan extended from D and its restriction to D is pseudocoherent.

**Proof or construction.** 1. Left Kan extension sends D-corepresentables to C-corepresentables and is exact. 2. Full faithfulness identifies restriction of the extension with the original functor on D; compare the finite approximations.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherent-functor`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`.

**Source.** CMM21, Definition 4.5 and Lemma 4.6, p. 25. The cited result supplies relative finite approximation with the hypotheses stated here.

**Check.** The variance is Hom(d,−) and left Kan extension.

**Uses.** CMM21 Definition 4.12: Specializes to finite free henselian objects and their retracts.

**API.**

- `Functor.IsDPseudocoherent` (characterisation): The relative perfect approximation predicate.
- `Functor.IsDPseudocoherent.restrict` (compatibility): Restriction to D is pseudocoherent.
- `Functor.IsDPseudocoherent.isLeftKanExtension` (universal-property): The left Kan extension comparison is an equivalence.
- `Functor.IsDPseudocoherent.of_restrict` (constructor): The two conditions in the criterion imply relative pseudocoherence.

**Unit tests.**

- `Functor.dPseudocoherent_identity` (compatibility): For D=C this is ordinary pseudocoherence.
- `Functor.dPseudocoherent_empty` (degenerate): For D empty only zero is relatively pseudocoherent.
- `Functor.dPseudocoherent_corepresentable` (computation): For d∈D, Σ∞_+Hom_C(d,−) is D-perfect.

### Recognition by truncations and cells

Target `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition` (theorem).

Let D⊂C be a small full subcategory and F:C→Sp uniformly bounded below. Then F is D-pseudocoherent iff F is left Kan extended from D and every τ≤n(F|D) is compact in Fun(D,Sp≤n). Equivalently F has a cellular presentation by shifted D-corepresentables with finitely many cells in each degree and errors whose connectivity tends to infinity. Relative finite generation in degree zero means a finite sum of additive D-corepresentables surjects onto that functor.

**Proof or construction.** 1. Apply the full-inclusion left Kan extension equivalence of relative-pseudocoherence; truncation commutes with these colimits. 2. On D, attach finite corepresentable cells surjecting onto the lowest remaining homotopy functor. Compactness of a truncation factors its identity through a finite cellular stage. Conversely finite cells and retracts are compact in the truncated functor category.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherent-functor`, `RefinedTraceMethodsPartII:HP.2/relative-pseudocoherence`, `EnhancedDerivedSheaves:E5:presentability/compact-objects`, `EnhancedDerivedSheaves:E3/kan-extensions-along-functors`, `StableHomotopyKTheory:H.5:spectra/suspension-spectrum`.

**Source.** CMM21, Lemma 4.3 and Proposition 4.7, pp. 24–26. The cited result supplies recognition by truncations and cells with the hypotheses stated here.

**Check.** Compactness is in the functor category, not pointwise compactness. Compact truncations in Fun(C,Sp) alone do not imply D-generation when D is a proper subcategory.

### Closure of relative pseudocoherence

Target `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure` (theorem).

D-pseudocoherent functors form a thick subcategory. Geometric realizations preserve them for simplicial diagrams with a common lower bound. The same finite-skeleton argument treats the finite-skeletal homotopy colimits of Proposition 4.8. If D is closed under finite coproducts, pointwise smash products preserve relative pseudocoherence. The first nonzero homotopy functor of a pseudocoherent F is relatively finitely generated.

**Proof or construction.** 1. A fixed range sees only finitely many simplicial degrees under the common lower bound. 2. The product of two corepresentables is corepresented by their coproduct; pass to perfect approximations.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition`.

**Source.** CMM21, Propositions 4.7–4.8, pp. 26–27. The cited result supplies closure of relative pseudocoherence with the hypotheses stated here.

**Check.** An unbounded-below realization is outside the assertion.

### Goodwillie recognition through infinite loop spaces

Target `RefinedTraceMethodsPartII:HP.2/goodwillie-recognition` (theorem). Planet: **Goodwillie pseudocoherence criterion**.

Let C have finite coproducts, D⊂C be small and full and contain the initial object and finite coproducts of its objects, and F:C→Sp≥1. Then F, Σ∞Ω∞F and Σ∞_+Ω∞F are D-pseudocoherent simultaneously. The initial object corepresents the constant sphere summand.

**Proof or construction.** 1. Apply suspension-loop-goodwillie-tower and pseudocoherence-closure to the smash-power homotopy-orbit layers. Their increasing connectivity gives finite approximations in each range. 2. For the converse, the suspension-spectrum/infinite-loop-space adjunction on connective spectra is monadic: Ω∞ is conservative and preserves sifted colimits. Its bar resolution has terms (Σ∞Ω∞)^{q+1}F and realization F. The forward implication makes every term pseudocoherent, and the common connective bound allows realization. 3. The plus variant adds the constant sphere, corepresented by the initial object in D.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `RefinedTraceMethodsPartII:HP.2/suspension-loop-goodwillie-tower`, `EnhancedDerivedSheaves:E3`.

**Source.** CMM21, Propositions 4.9–4.10, p. 27. The cited result supplies goodwillie recognition through infinite loop spaces with the hypotheses stated here.

**Check.** Retain the constant sphere hypothesis for the plus variant.

### Recognition through integral homology

Target `RefinedTraceMethodsPartII:HP.2/integral-homology-recognition` (theorem).

For uniformly bounded-below F:C→Sp, F is D-pseudocoherent iff HZ⊗F is. The reverse implication requires the uniform lower bound.

**Proof or construction.** 1. Approximate HZ by its bounded-below finite-type Postnikov stages for the forward direction. 2. Inductively kill the lowest homology functor with finite cells and apply stable Hurewicz to identify the first remaining homotopy degree.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition`, `StableHomotopyKTheory:H.5:spectra`.

**Source.** CMM21, Proposition 4.11, p. 27. The cited result supplies recognition through integral homology with the hypotheses stated here.

**Check.** Use a single lower bound across C.

### Projective pseudocoherence on henselian algebras

Target `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence` (definition). Planet: **Projectively pseudocoherent functor**.

For henselian nonunital R-algebras take D to be a small skeleton of retracts of finite free objects. Projectively perfect, pseudocoherent and finitely generated mean the relative properties for D. A projectively pseudocoherent functor preserves filtered colimits. The functor I↦Σ∞_+(I^n), n≥0, is projectively perfect.

**Proof or construction.** 1. The finite-free universal property identifies I^n with a corepresentable. 2. Compact projectivity makes corepresentables preserve filtered colimits; pass through the perfect approximations.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.2/relative-pseudocoherence`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition`.

**Source.** CMM21, Definition 4.12 and Examples 4.13–4.14, pp. 27–28. The cited result supplies projective pseudocoherence on henselian algebras with the hypotheses stated here.

**Check.** For n=0 the initial object corepresents the constant sphere.

**Uses.** CMM21 Proposition 4.16: Provides the finiteness assumption for axiomatic rigidity.

**API.**

- `Functor.IsProjectivelyPseudocoherent` (characterisation): Relative pseudocoherence for finite free/retract objects.
- `Functor.IsProjectivelyPseudocoherent.preservesFilteredColimits` (compatibility): The filtered-colimit comparison is an equivalence.
- `HenselianNonUnitalAlg.powerCorepresentable` (equivalence): Hom(R{X_1,…,X_n}⁺,I)≅I^n.
- `Functor.IsProjectivelyPseudocoherent.retract` (structure): The property is preserved by retracts and natural equivalences.

**Unit tests.**

- `Functor.projective_power_zero` (degenerate): The zeroth power gives the constant sphere.
- `Functor.projective_power_one` (computation): The first power is the suspension spectrum of the underlying set with a disjoint basepoint.
- `Functor.projective_filtered_union` (compatibility): For a filtered union of henselian ideals, (colim I_j)^n≅colim I_j^n for finite n.

### Gabber finite-generation vanishing lemma

Target `RefinedTraceMethodsPartII:HP.2/abelian-vanishing` (theorem).

Let F:Ring^{nu,h}→Ab preserve filtered colimits, be projectively finitely generated and take short exact sequences to right exact sequences. If it vanishes on bounded-torsion rings and on Q-algebras, then F=0.

**Proof or construction.** 1. Choose finitely many generators from finite free objects. Rational-free-rescaling gives a single integer N annihilating their images after rescaling. 2. Factor through NI⊂I and apply right exactness to I→I/NI together with vanishing on bounded torsion.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `RefinedTraceMethodsPartII:HP.0/rational-free-rescaling`.

**Source.** CMM21, Lemma 4.15, pp. 28–29. The cited result supplies gabber finite-generation vanishing lemma with the hypotheses stated here.

**Check.** Both bounded-torsion and rational vanishing are required.

### Axiomatic rigidity criterion

Target `RefinedTraceMethodsPartII:HP.2/axiomatic-rigidity` (theorem). Planet: **Axiomatic rigidity**.

Let F:Ring^{nu,h}→Sp be projectively pseudocoherent. Suppose it sends short exact sequences to fibre sequences, is invariant under quotients by nilpotent ideals and vanishes on every finite free henselian nonunital algebra over every prime field, including Q. Then F=0.

**Proof or construction.** 1. The prime-field tests and the finite approximation argument in Proposition 4.16 imply vanishing on all prime-field algebras. 2. Nilpotent invariance and successive multiplication imply vanishing on bounded-torsion objects. 3. If F were nonzero its uniform lower bound would give a lowest nonzero homotopy functor; this is projectively finitely generated, right exact and satisfies abelian-vanishing.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/abelian-vanishing`, `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`.

**Source.** CMM21, Proposition 4.16, pp. 28–29. The cited result supplies axiomatic rigidity criterion with the hypotheses stated here.

**Check.** Vanishing on finite free objects is a test, not an assumption that F preserves every realization.

### Left Kan extension by free resolutions

Target `RefinedTraceMethodsPartII:HP.2/free-simplicial-resolutions` (construction).

Construct the augmented simplicial free resolution of a henselian nonunital R-algebra from the free/forgetful adjunction. Its underlying realization is the original discrete algebra. For E admitting sifted colimits, F is left Kan extended from finite free/retract objects iff it preserves filtered colimits and carries every simplicial diagram with discrete underlying realization I to a realization equivalence |F(I•)|≃F(I).

**Proof or construction.** 1. Iterate the free/forgetful comonad; its underlying augmented simplicial set has the standard extra degeneracy. 2. Write free objects as filtered colimits of finite free ones and use the generic algebraic-theory resolution theorem from E3.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `EnhancedDerivedSheaves:E3`.

**Source.** CMM21, Construction 4.17 and Corollary 4.18, p. 30. The cited result supplies left kan extension by free resolutions with the hypotheses stated here.

**Check.** The criterion includes filtered colimits.

**Uses.** CMM21 Corollary 4.18: Turns the Kan extension condition into a usable free-resolution criterion.

**API.**

- `HenselianNonUnitalAlg.freeResolution` (constructor): The functorial augmented simplicial free resolution.
- `HenselianNonUnitalAlg.freeResolution_augmentation` (projection): Its augmentation to the constant algebra I.
- `HenselianNonUnitalAlg.freeResolution_realize` (compatibility): The underlying simplicial-set realization is I.
- `HenselianNonUnitalAlg.freeResolution_map` (functoriality): Algebra maps induce simplicial maps compatible with augmentation.

**Unit tests.**

- `HenselianNonUnitalAlg.resolution_zero` (degenerate): At zero the augmentation resolves the one-point underlying set.
- `HenselianNonUnitalAlg.resolution_free` (characterisation): A free algebra has the standard split underlying augmented resolution.
- `HenselianNonUnitalAlg.resolution_pi` (compatibility): The underlying π0 is I and positive homotopy groups are zero.

## HP.3. Pseudocoherence of the trace functors

Prove uniform general-linear homology stability and pseudocoherence of group chains, K, Eilenberg–MacLane spectra, THH and TC modulo p; prove projective-module K-zero rigidity.

### Uniform general-linear homology stability

Target `RefinedTraceMethodsPartII:HP.3/uniform-gl-stability` (theorem). Planet: **Uniform GL homology stability**.

For a commutative ring A of finite Bass stable rank s, stabilization H_i(GL_n(A),Z)→H_i(GL_∞(A),Z) is an isomorphism for n≥2i+s+2 (a deliberately nonoptimal range). For A=Z⋉I with I local nonunital, one can use one such bound independent of I, since the maximal spectrum is that of Z.

**Proof or construction.** 1. Use U.3/stable-range for the convention. The unimodular-frame complex and its connectivity are obtained by the stable-range row operations in van der Kallen §§1–4; the spectral sequence and connectivity estimate are the content of this target, not an assumed input from K.2. 2. The action on ordered unimodular frames gives the first-quadrant stabilization spectral sequence; identify stabilizers and alternating face maps. Van der Kallen §4.8 proves vanishing of its relative groups in the stated, weaker range. 3. For Z⋉I the augmentation kernel is radical; stable range is bounded through the maximal spectrum of Z.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/local-nonunital`, `KTheoryLowDegrees:U.3/stable-range`.

**Source.** CMM21, Proposition 4.19, pp. 30–31. The cited result supplies uniform general-linear homology stability with the hypotheses stated here.; vdK80, §4.8, Theorem and proof, pp. 287–288; §1, pp. 269–271. The stable-range spectral sequence yields the general homology-stability input; the numerical range here is weaker than the source range.

**Check.** The range must be uniform in I; noetherianity of Z⋉I is not assumed.

### Finite approximation of general-linear group chains

Target `RefinedTraceMethodsPartII:HP.3/gl-chains-pseudocoherent` (theorem).

The functor I↦HZ⊗Σ∞_+BGL_∞(Z⋉I) on henselian nonunital rings is projectively pseudocoherent. The same assertion holds for each fixed finite n.

**Proof or construction.** 1. Use uniform-gl-stability to approximate GL∞ through a fixed range. 2. The split extension GL_n(1+I)→GL_n(Z⋉I)→GL_n(Z) identifies its kernel as a set with I^{n²}. Its bar terms are finite powers of I, giving pseudocoherence after uniformly connective realization. 3. Choose a torsion-free finite-index normal subgroup of GL_n(Z). Its classifying space is a finite CW model via Borel–Serre; take its finite skeletal homotopy orbits and then the finite quotient action. The finite quotient has finite skeleta, not a finite CW classifying space.

**Inputs.** `RefinedTraceMethodsPartII:HP.3/uniform-gl-stability`, `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `ArithmeticLocallySymmetricSpaces:ALS.2/borel-serre-finite-triangulation`.

**Source.** CMM21, Proposition 4.19, pp. 30–31. The cited result supplies finite approximation of general-linear group chains with the hypotheses stated here.

**Check.** I^{n²} identifies the kernel as a set; matrix multiplication is not componentwise addition.

### Projective-module K-zero rigidity

Target `RefinedTraceMethodsPartII:HP.3/henselian-k-zero` (theorem). Planet: **Henselian K-zero rigidity**.

For a henselian pair (A,I), reduction gives a bijection on isomorphism classes of finitely generated projective modules, compatible with direct sum and tensor product, and hence K0(A)≅K0(A/I). In particular K0(Z⋉I)≅Z for henselian nonunital I.

**Proof or construction.** 1. Present a finite projective over A/I by an idempotent n×n matrix. The scheme of idempotent matrices is smooth over A: in a chart splitting image and kernel, its equation e²=e solves for the diagonal blocks and leaves the off-diagonal blocks free. Equivalently its fixed-rank strata are the smooth homogeneous spaces GL_n/(GL_r×GL_(n−r)). Apply SF.0/henselian-smooth-lifting to lift this matrix. Ordinary commutative finite-algebra idempotent lifting alone does not yet give the matrix case. 2. Lift maps between chosen projectives using projectivity. A lift of an isomorphism modulo I is invertible by Nakayama and I⊂Jac(A), proving injectivity on isomorphism classes.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/ambient-independence`, `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`, `SchemeAndStackFoundations:SF.0/henselian-smooth-lifting`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Source.** CMM21, Lemma 4.20, p. 31. The cited result supplies projective-module k-zero rigidity with the hypotheses stated here.

**Check.** For A=F_p[ε]/ε² reduction gives K0≅Z. It is not an equivalence of projective-module categories: automorphisms can reduce to the identity.

### Pseudocoherence of algebraic K-theory

Target `RefinedTraceMethodsPartII:HP.3/k-pseudocoherent` (theorem). Planet: **Pseudocoherence of K-theory**.

The connective functor I↦K(Z⋉I) on henselian nonunital rings is projectively pseudocoherent; so is the relative functor fib(K(Z⋉I)→K(Z)).

**Proof or construction.** 1. Identify its K0 part by henselian-k-zero. 2. For the connected part, the plus-construction equivalence identifies integral homology with gl-chains-pseudocoherent; integral-homology-recognition and goodwillie-recognition give the spectrum statement. 3. Evaluate the projectively pseudocoherent absolute functor at I=0. Since each finite-free corepresentable evaluates there to the sphere, K(Z) is a pseudocoherent spectrum. Its constant functor is pseudocoherent because zero corepresents the constant sphere. Take the augmentation fibre. This also proves the finite-type input instead of requesting Quillen finite generation separately.

**Inputs.** `RefinedTraceMethodsPartII:HP.3/henselian-k-zero`, `RefinedTraceMethodsPartII:HP.3/gl-chains-pseudocoherent`, `RefinedTraceMethodsPartII:HP.2/integral-homology-recognition`, `RefinedTraceMethodsPartII:HP.2/goodwillie-recognition`, `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `StableHomotopyKTheory:H.3/plus-construction-universal-property`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `GeneralAlgebraicKTheory:K.2:plus/plus-equals-Q`.

**Source.** CMM21, Proposition 4.21 and Remark 4.22, pp. 31–32. The cited result supplies pseudocoherence of algebraic k-theory with the hypotheses stated here.

**Check.** Use connective K and keep the constant K(Z) summand.

### Pseudocoherence of additive spectra

Target `RefinedTraceMethodsPartII:HP.3/eilenberg-maclane-pseudocoherent` (theorem).

On the category of finite free abelian groups, A↦HA is pseudocoherent. Consequently I↦H(I_add) and I↦H(Z⋉I)_add are projectively pseudocoherent on henselian nonunital rings.

**Proof or construction.** 1. Model HA through the connective stabilization of Σ⁻nΣ∞K(A,n); Freudenthal makes the error increasingly connective. 2. Construct K(A,n) by iterated bar constructions, whose terms are finite powers. Apply closure and the finite-free corepresentable calculations.

**Inputs.** `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `RefinedTraceMethodsPartII:HP.2/goodwillie-recognition`, `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence`, `StableHomotopyKTheory:H.5:spectra/eilenberg-maclane-spectrum`, `StableHomotopyKTheory:H.3/eilenberg-maclane-space`, `StableHomotopyKTheory:H.5:spectra`.

**Source.** CMM21, Lemmas 4.23–4.24, p. 32. The cited result supplies pseudocoherence of additive spectra with the hypotheses stated here.

**Check.** The zero abelian group gives the zero spectrum; add the constant HZ summand for the unitization.

### Pseudocoherence of topological Hochschild homology

Target `RefinedTraceMethodsPartII:HP.3/thh-pseudocoherent` (theorem).

The functor I↦THH(Z⋉I) is projectively pseudocoherent.

**Proof or construction.** 1. Use the cyclic bar model with q-simplices H(Z⋉I)^{⊗(q+1)}. 2. Apply eilenberg-maclane-pseudocoherent, closure under smash and the common connective lower bound for realization.

**Inputs.** `RefinedTraceMethodsPartII:HP.3/eilenberg-maclane-pseudocoherent`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `RefinedTraceMethods:RT.2/cyclic-realisation`.

**Source.** CMM21, Lemma 4.25, p. 32. The cited result supplies pseudocoherence of topological hochschild homology with the hypotheses stated here.

**Check.** The argument uses spectral THH, not ordinary Hochschild chains.

### Pseudocoherence of finite-coefficient TC

Target `RefinedTraceMethodsPartII:HP.3/tc-pseudocoherent` (theorem). Planet: **Pseudocoherence of TC mod p**.

The functor I↦TC(Z⋉I)/p is projectively pseudocoherent, as is its augmentation fibre. The same holds with p^r coefficients.

**Proof or construction.** 1. At each cutoff use orbit-approximation: its approximating functor is built by finitely many exact operations from THH⊗HF_p homotopy orbits. 2. Use thh-pseudocoherent and the uniformly bounded-below circle bar construction; identify approximations with recogn. Induct over r. 3. Evaluate at zero to obtain the finite-type spectrum TC(Z)/p; the initial corepresentable makes its constant functor pseudocoherent, so the augmentation fibre is pseudocoherent.

**Inputs.** `RefinedTraceMethodsPartII:HP.3/thh-pseudocoherent`, `RefinedTraceMethodsPartII:HP.1/orbit-approximation`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition`.

**Source.** CMM21, Proposition 4.26, p. 32. The cited result supplies pseudocoherence of finite-coefficient tc with the hypotheses stated here.

**Check.** TC itself is (−1)-connective, so retain that lower bound in the finite approximation.

## HP.4. Cartier defects and equal-characteristic rigidity

Construct the kernel and cokernel of inverse Cartier minus one, prove étale base change and henselian invariance, and combine imported Geisser–Levine and Geisser–Hesselholt comparisons to treat ind-smooth local characteristic-p rings.

### Cartier kernel and defect groups

Target `RefinedTraceMethodsPartII:HP.4/cartier-defects` (definition). Planet: **Cartier defect groups**.

For an F_p-algebra R and n≥0, use the canonical inverse Cartier map C⁻¹:Ω_R^n→Ω_R^n/dΩ_R^{n−1}. Define ν^n(R)=ker(1−C⁻¹) and ν̃^n(R)=coker(1−C⁻¹); put both zero for n<0. The maps are additive and F_p-linear, not R-linear in the ordinary scalar structure. For ind-smooth R, inverse Cartier is the usual Cartier isomorphism onto closed forms modulo exact forms.

**Proof or construction.** 1. Use the DD.3 polynomial inverse Cartier map. Its formula a_0 da_1∧⋯∧da_n ↦ [a_0^p a_1^{p−1}⋯a_n^{p−1} da_1∧⋯∧da_n] respects the differential relations for any F_p-algebra, giving a natural additive map to forms modulo exact forms. Take its kernel and cokernel. 2. Track the Frobenius-twisted scalar structures, so the quotient by exact forms is not incorrectly treated as an ordinary R-module.

**Inputs.** `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `mathlib:KaehlerDifferential`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`.

**Source.** CMM21, §4.4, notation before Lemma 4.28, pp. 32–33. The cited result supplies cartier kernel and defect groups with the hypotheses stated here.

**Check.** ν^0(R) consists of locally constant F_p-valued functions; it need not equal F_p for disconnected R.

**Uses.** CMM21 Propositions 4.31–4.32 and Theorem 6.11: Measures the complementary TC summand and proves its henselian invariance.

**API.**

- `Cartier.nu` (constructor): The kernel of 1−C⁻¹ with its canonical inclusion.
- `Cartier.nuTilde` (constructor): The cokernel with its quotient map.
- `Cartier.defects_map` (functoriality): Ring maps induce additive maps on both defects, respecting identities and composition.
- `Cartier.nu_iff` (characterisation): A form belongs to ν precisely when its class equals inverse Cartier of that form.
- `Cartier.nuTilde_lift` (universal-property): Additive maps annihilating im(1−C⁻¹) factor uniquely through ν̃.
- `Cartier.nu_zero` (compatibility): ν^0(R)=ker(1−Frob:R→R) and ν̃^0(R)=coker(1−Frob).

**Unit tests.**

- `Cartier.nu_finitePrimeField` (computation): ν^0(F_p)=F_p and ν̃^0(F_p)=F_p.
- `Cartier.nu_product` (non-example): ν^0(F_p×F_p)=F_p×F_p, not a single copy of F_p.
- `Cartier.nu_algebraicClosure` (computation): ν̃^0(F_p^alg)=0 by Artin–Schreier surjectivity; ν^0 remains F_p.
- `Cartier.defects_negative` (degenerate): Both groups vanish in negative form degrees.

### Étale base change for Cartier quotients

Target `RefinedTraceMethodsPartII:HP.4/etale-differentials` (theorem).

If R→S is an étale map of F_p-algebras, Ω_R^n⊗_R S≅Ω_S^n and the Frobenius-twisted modules of forms modulo exact forms satisfy the corresponding base-change equivalence. These identifications intertwine inverse Cartier.

**Proof or construction.** 1. Use vanishing of the relative cotangent complex and the relative Frobenius isomorphism for an étale map. 2. Apply exterior powers and the Cartier complex with its twisted scalar action.

**Inputs.** `RefinedTraceMethodsPartII:HP.4/cartier-defects`, `DerivedDeRhamCohomology:DD.3/polynomial-cartier-map`, `SchemeAndStackFoundations:SF.0/relative-frobenius-etale-and-smooth`, `DerivedDeRhamCohomology:DD.0/smooth-cotangent`.

**Source.** CMM21, Lemma 4.28, p. 33. The cited result supplies étale base change for cartier quotients with the hypotheses stated here.

**Check.** Do not tensor the quotient by exact forms with an unspecified ordinary scalar action.

### Smooth-local trace and Cartier defects

Target `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects` (theorem). Planet: **Smooth-local trace defects**.

For an ind-smooth F_p-algebra R, Geisser–Hesselholt gives 0→ν̃^{n+1}(R)→π_n(TC(R)/p)→ν^n(R)→0 for n≥−1. For local such R and n≥0, Geisser–Levine identifies K_n(R;Z/p) with ν^n(R), compatibly with trace and dlog. Therefore π_n(K^inv(R)/p)≅ν̃^{n+2}(R) for all n≥−2, with lower groups zero.

**Proof or construction.** 1. Import the GL and GH statements with local hypotheses and the trace compatibility from the indicated suppliers. 2. Use the trace fibre long exact sequence, the surjectivity onto ν and the negative-form convention to identify its homotopy groups.

**Inputs.** `RefinedTraceMethodsPartII:HP.4/cartier-defects`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `KTheoryFiniteLocalFields:L.6/geisser-hesselholt-regular-local`, `KTheoryFiniteLocalFields:L.6`, `RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`.

**Source.** CMM21, Theorem 4.29 and discussion, pp. 33–34. The cited result supplies smooth-local trace and cartier defects with the hypotheses stated here.

**Check.** For F_p, π−2(K^inv(F_p)/p)=ν̃^0(F_p)=F_p; this catches a one-degree shift.

### A henselian unit root identity

Target `RefinedTraceMethodsPartII:HP.4/henselian-root-identity` (theorem).

If (R,I) is henselian, s∈I and n≥1, there is a unique x∈1+I with x−sx^n=1. This is the simple-root lift at x=1, and it is natural under maps of pairs.

**Proof or construction.** 1. For f(X)=X−sX^n−1, f(1)∈I and f′(1)≡1 mod I. 2. Use the nonmonic simple-root criterion in SF.0; its derivative stays a unit along the whole residue class.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/ambient-independence`, `SchemeAndStackFoundations:SF.0/henselian-pair-characterisations`.

**Source.** CMM21, Lemma 4.30, p. 34. The cited result supplies a henselian unit root identity with the hypotheses stated here.

**Check.** For s=0 the solution is x=1; no assumption that n is invertible is used.

### Henselian invariance of Cartier defects

Target `RefinedTraceMethodsPartII:HP.4/cartier-henselian-rigidity` (theorem). Planet: **Henselian Cartier rigidity**.

For a henselian pair (R,I) of F_p-algebras, ν^n(R)→ν^n(R/I) is surjective and ν̃^n(R)→ν̃^n(R/I) is an isomorphism for all n≥0.

**Proof or construction.** 1. Relative forms are generated additively by wedges with one coefficient in I. 2. For such a generator solve the equation in henselian-root-identity to write it in the image of 1−C⁻¹ on relative forms. 3. Apply the snake lemma to the diagram of forms and forms modulo exact forms; record surjectivity of the relative inverse-Cartier difference.

**Inputs.** `RefinedTraceMethodsPartII:HP.4/cartier-defects`, `RefinedTraceMethodsPartII:HP.4/etale-differentials`, `RefinedTraceMethodsPartII:HP.4/henselian-root-identity`.

**Source.** CMM21, Proposition 4.31, p. 34. The cited result supplies henselian invariance of cartier defects with the hypotheses stated here.

**Check.** For n=0 recover invariance of Artin–Schreier cokernels; kernels are only asserted surjective.

### Ind-smooth local characteristic-p rigidity

Target `RefinedTraceMethodsPartII:HP.4/equal-characteristic-rigidity` (theorem).

If (R,I) is henselian and both R and R/I are local ind-smooth F_p-algebras, then K^inv(R)/p→K^inv(R/I)/p is an equivalence.

**Proof or construction.** 1. Identify every homotopy group by smooth-trace-defects. 2. Apply cartier-henselian-rigidity and the bounded-below Whitehead criterion.

**Inputs.** `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `RefinedTraceMethodsPartII:HP.4/cartier-henselian-rigidity`.

**Source.** CMM21, Proposition 4.32, p. 34. The cited result supplies ind-smooth local characteristic-p rigidity with the hypotheses stated here.

**Check.** The free henselian F_p-algebras needed by the axiomatic criterion satisfy the local ind-smooth hypotheses after unitization over F_p.

## HP.5. Rigidity of the cyclotomic trace fibre

Pass nonconnective excision to the connective henselian setting, build the nonunital trace-fibre functor and apply axiomatic rigidity. Establish the finite-coefficient cartesian trace square for every henselian pair and exhibit failure of the integral analogue.

### Connective henselian excision

Target `RefinedTraceMethodsPartII:HP.5/connective-henselian-excision` (theorem). Planet: **Connective henselian excision**.

For a ring map f:A→B identifying a henselian ideal I⊂A with an ideal J⊂B, the square comparing K(A,I)→K(B,J) to nonconnective 𝕂(A,I)→𝕂(B,J) is cartesian. Hence the connective trace fibres K^inv(A,I)→K^inv(B,J) are equivalent.

**Proof or construction.** 1. Ambient-independence makes (B,J) henselian. K-zero rigidity and surjectivity GL(A)→GL(A/I) make both connective relative K spectra 1-connective; their comparison fibre is therefore 0-connective. 2. The nonconnective birelative fibre is 0-connective by K.6/milnor-square-excision-in-nonpositive-degrees. Connective and nonconnective K agree in nonnegative degrees; the induced map between their birelative fibres is an isomorphism there. Both vanish below zero, so those fibres are equivalent, proving the square cartesian. 3. Apply RT.3/truncating-excision and take trace fibres. No vanishing of the birelative K-spectrum is asserted.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/ambient-independence`, `RefinedTraceMethodsPartII:HP.3/henselian-k-zero`, `GeneralAlgebraicKTheory:K.6/milnor-square-excision-in-nonpositive-degrees`, `RefinedTraceMethods:RT.3/truncating-excision`, `RefinedTraceMethods:RT.3/cyclotomic-trace`.

**Source.** CMM21, Proposition 4.34 and Corollary 4.35, p. 35. The cited result supplies connective henselian excision with the hypotheses stated here.

**Check.** The connective conclusion uses henselianity; it is not arbitrary connective K-excision.

### Intrinsic nonunital trace fibre

Target `RefinedTraceMethodsPartII:HP.5/nonunital-trace-fibre` (construction).

For henselian nonunital I define F_p(I)=fib(K^inv(Z⋉I)→K^inv(Z))/p. For any henselian embedding I⊂A this is naturally K^inv(A,I)/p. It sends short exact sequences of henselian nonunital rings to fibre sequences and is invariant under nilpotent quotients.

**Proof or construction.** 1. Use the unitization Milnor square and connective-henselian-excision to identify the ambient-independent fibre. 2. Apply excision once more to the kernel of a surjection to get exactness. Nilpotent invariance follows from the imported DGM theorem.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/augmented-equivalence`, `RefinedTraceMethodsPartII:HP.5/connective-henselian-excision`, `RefinedTraceMethods:RT.3/cyclotomic-trace`, `RefinedTraceMethods:RT.3/dgm-theorem`.

**Source.** CMM21, §4.5, pp. 35–36. The cited result supplies intrinsic nonunital trace fibre with the hypotheses stated here.

**Check.** Use the fibre at the augmentation, rather than K^inv(Z⋉I)/p without removing the constant term.

**Uses.** CMM21 Theorem 4.36: The axiomatic rigidity argument applies to this exact, finite-approximation functor.

**API.**

- `HenselianTrace.nonunitalFibre` (constructor): The augmentation fibre with derived mod-p coefficients.
- `HenselianTrace.nonunitalFibre_map` (functoriality): Nonunital homomorphisms induce maps, preserving identity and composition.
- `HenselianTrace.nonunitalFibre_ambient` (compatibility): Natural equivalence with K^inv(A,I)/p for any henselian ambient pair.
- `HenselianTrace.nonunitalFibre_exact` (structure): Short exact sequences induce fibre sequences.
- `HenselianTrace.nonunitalFibre_nilpotent` (characterisation): Nilpotent I gives the zero spectrum by DGM.

**Unit tests.**

- `HenselianTrace.nonunital_zero` (degenerate): F_p(0)=0, even though K^inv(Z)/p can be nonzero.
- `HenselianTrace.nonunital_squareZero` (computation): For a square-zero F_p-vector space I, the nonunital fibre vanishes.
- `HenselianTrace.nonunital_unitization` (compatibility): The natural comparison for the embedding I⊂Z⋉I is the identity on the defining augmentation fibre.

### Rigidity of the cyclotomic trace fibre

Target `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity` (theorem). Planet: **Henselian trace rigidity**.

For every henselian pair (A,I), prime p and r≥1, K^inv(A)/p^r→K^inv(A/I)/p^r is an equivalence. Equivalently the cyclotomic trace square for A→A/I with Z/p^r coefficients is cartesian. The analogous assertion holds with any positive finite integer coefficient and after derived profinite completion.

**Proof or construction.** 1. By nonunital-trace-fibre reduce to F_p on henselian nonunital rings. K and TC pseudocoherence make F_p projectively pseudocoherent. 2. Its exactness and nilpotent invariance were established above. On finite free henselian algebras over prime fields of characteristic different from p use Gabber invertible-coefficient rigidity and TC/p=0 when p is invertible. In characteristic p use equal-characteristic-rigidity. 3. Apply axiomatic-rigidity, then induct on the exponent of p and use the Chinese remainder coefficient decomposition. Take derived limits for profinite completion.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/nonunital-trace-fibre`, `RefinedTraceMethodsPartII:HP.3/k-pseudocoherent`, `RefinedTraceMethodsPartII:HP.3/tc-pseudocoherent`, `RefinedTraceMethodsPartII:HP.2/axiomatic-rigidity`, `RefinedTraceMethodsPartII:HP.4/equal-characteristic-rigidity`, `KTheoryFiniteLocalFields:L.2/gabber-rigidity`, `RefinedTraceMethods:RT.2/tc-p-completion`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`.

**Source.** CMM21, Theorem 4.36, pp. 35–37. The cited result supplies rigidity of the cyclotomic trace fibre with the hypotheses stated here.

**Check.** Test (Z_p,p), (F_p[[t]],t) and a nilpotent dual-number ideal. No completeness or noetherianity is assumed.

### Failure of integral henselian rigidity

Target `RefinedTraceMethodsPartII:HP.5/integral-counterexample` (application).

Let R=(F_p[[x]])^perf and I=ker(R→F_p)=⋃_n(x^{1/p^n}). This is a henselian pair, but K(R,I)→TC(R,I) is not an integral equivalence. Its K1 is the nonzero uniquely p-divisible group ker(R×→F_p×), while TC(R,I) is derived p-complete.

**Proof or construction.** 1. Filtered perfection preserves intrinsic henselianity. Frobenius makes the relative unit group uniquely p-divisible and 1+x is nontrivial. 2. A nonzero Z[1/p]-module is not derived p-complete; relative characteristic-p TC is derived p-complete.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-permanence`, `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`, `RefinedTraceMethods:RT.2/tc-p-completion`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `StableHomotopyKTheory:H.6/p-completion`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`.

**Source.** CMM21, Remark 4.39, p. 37. The cited result supplies failure of integral henselian rigidity with the hypotheses stated here.

**Check.** The example does not contradict finite-coefficient rigidity: the relative K1 group dies modulo p.

## HP.6. Adic continuity and its boundary

Deduce finite-coefficient K-theory continuity for complete noetherian rings with F-finite reduction modulo p, using THH continuity. Establish the reverse implication to rigidity and the non-F-finite K-two discontinuity example with its exterior-weight obstruction.

### THH detects only the derived mod-p input

Target `RefinedTraceMethodsPartII:HP.6/thh-derived-mod-p` (theorem).

If A⊗^L_ZF_p→B⊗^L_ZF_p is an equivalence, then THH(A)/p→THH(B)/p is an equivalence. For noetherian A, its ordinary p-adic completion Â_p satisfies this hypothesis.

**Proof or construction.** 1. Smash powers of HA→HB are mod-p equivalences; realize the cyclic bar diagrams. 2. Noetherianity bounds p-power torsion, identifying ordinary and derived completion and its derived reduction modulo p.

**Inputs.** `RefinedTraceMethods:RT.2/thh-symmetric-monoidal`, `RefinedTraceMethods:RT.2/thh-over-thhz`, `StableHomotopyKTheory:H.6/moore-spectrum`, `StableHomotopyKTheory:H.6/p-completion`, `DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison`.

**Source.** CMM21, Lemmas 5.2–5.3, p. 38. The cited result supplies thh detects only the derived mod-p input with the hypotheses stated here.

**Check.** Derived mod-p equivalence includes the p-torsion Tor term; equality of ordinary reductions alone is insufficient.

### Finite generation and pro base change for THH

Target `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change` (theorem).

For noetherian F-finite Z_(p)-algebra A, ideal I and v≥1, THH_n(A;Z/p^v) is a finitely generated A-module and {THH_n(A;Z/p^v)⊗_A A/I^s}_s≅{THH_n(A/I^s;Z/p^v)}_s for all n≥0.

**Proof or construction.** 1. Use DD.0/f-finite-cotangent and DD.0/derived-exterior-powers: derived exterior powers of an almost-perfect connective module remain almost perfect over a noetherian base. Insert their finite homology in the Hochschild filtration and the THH-to-HH spectral sequence; bounded-p-torsion devissage gives the mixed-characteristic finite-generation theorem. 2. Brun’s restriction spectral sequence has E²_{ij}=THH_i(A/I^s;Tor_j^A(A/I^s,M/I^sM)). Pro Artin–Rees vanishing kills j>0. 3. Apply the coefficient exact sequences for A[p^v] and A/p^v and exactness of completion on finite modules.

**Inputs.** `DerivedDeRhamCohomology:DD.0/f-finite-cotangent`, `DerivedDeRhamCohomology:DD.0/derived-exterior-powers`, `RefinedTraceMethods:RT.2/thh-over-thhz`, `RefinedTraceMethods:RT.1/hkr-filtration`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `DeformationAndDerivedPatchingAlgebra:R03.3/f-finite-rings`, `DeformationAndDerivedPatchingAlgebra:R03.1/flat-tensor-artin-rees-cofinality`, `RefinedTraceMethods:RT.2`.

**Source.** DM17, Theorems 4.7 and 5.3 (r=1), pp. 221–225. The cited result supplies finite generation and pro base change for thh with the hypotheses stated here.

**Check.** A can be singular; regularity is not required.

### Adic continuity of THH

Target `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity` (theorem). Planet: **Adic continuity of THH**.

If A is noetherian, I-adically complete and A/p is F-finite, then THH(A)/p^v≃lim_s THH(A/I^s)/p^v for every v≥1. The same comparison holds for TC.

**Proof or construction.** 1. For a Z_(p)-algebra use finite-thh-pro-base-change: finite modules are complete and the pro quotient system has surjective transitions, so Milnor lim¹ is zero. 2. For arbitrary A replace it by Â_p using thh-derived-mod-p. Noetherian completion is exact on finite modules and commutes with the surjective I-adic system, so Â_p is complete along IÂ_p with the required quotients. 3. Use connective-tower-limits and preservation of finite-coefficient equivalences by TC on bounded-below cyclotomic spectra. Induct over v.

**Inputs.** `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change`, `RefinedTraceMethodsPartII:HP.6/thh-derived-mod-p`, `RefinedTraceMethodsPartII:HP.1/connective-tower-limits`, `DeformationAndDerivedPatchingAlgebra:R03.1`, `RefinedTraceMethods:RT.2/tr-and-genuine-tc`, `DeformationAndDerivedPatchingAlgebra:R03.1/flat-completion-and-finite-module-comparison`.

**Source.** CMM21, Proposition 5.4, pp. 38–39. The cited result supplies adic continuity of thh with the hypotheses stated here.; DM17, Corollary 5.4 and Theorem 5.5, pp. 225–226. Finite generation, pro base change and the Milnor sequence give the spectral limit comparison in the Z_(p)-case.

**Check.** For Z_p[[t]] use I=(t); F-finiteness concerns A/p, and the ideal I need not contain p.

### Adic continuity of finite-coefficient K-theory

Target `RefinedTraceMethodsPartII:HP.6/k-adic-continuity` (theorem). Planet: **Adic continuity of K-theory**.

For noetherian I-adically complete A with A/p F-finite, K(A)/p^r≃lim_s K(A/I^s)/p^r for all r≥1. Here the right side is the homotopy inverse limit, not just a limit of K groups.

**Proof or construction.** 1. The pairs (A,I^s) are henselian. Apply henselian-trace-rigidity at each level to identify the obstruction to K-continuity with that for TC. 2. Adic continuity of THH supplies the TC limit equivalence.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity`, `SchemeAndStackFoundations:SF.0/henselian-pair-permanence`.

**Source.** CMM21, Theorem 5.5, p. 39. The cited result supplies adic continuity of finite-coefficient k-theory with the hypotheses stated here.

**Check.** Test Z_p and F_p[[t_1,…,t_d]]; keep possible Milnor extensions when taking homotopy groups.

### Rigidity from complete-ring continuity

Target `RefinedTraceMethodsPartII:HP.6/continuity-implies-rigidity` (theorem).

Conversely, the finite-coefficient K-continuity theorem for all noetherian complete rings with F-finite mod-p reduction implies henselian trace rigidity for arbitrary pairs. This is a logical comparison of two proofs, not a prerequisite used in the proof of rigidity above.

**Proof or construction.** 1. Filtered-colimit preservation of K and TC/p reduces to henselizations of finite-type Z-algebras. 2. Excellence makes the map to I-adic completion regular; Popescu presents it by smooth algebras, whose maps split by henselian smooth lifting. Hence vanishing at the completion detects vanishing at the henselization. 3. Continuity at the completion identifies K^inv/p with the limit over nilpotent thickenings, constant by DGM.

**Inputs.** `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `SchemeAndStackFoundations:SF.0/popescu-desingularization`, `SchemeAndStackFoundations:SF.0/henselian-smooth-lifting`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `RefinedTraceMethods:RT.3/dgm-theorem`, `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity`, `DeformationAndDerivedPatchingAlgebra:R03.3/excellence-normalization-and-formal-fibres`.

**Source.** CMM21, Remark 5.6, p. 39. The cited result supplies rigidity from complete-ring continuity with the hypotheses stated here.

**Check.** Keep the forward proof independent of this converse to avoid circularity.

### Weight of an exterior two-form

Target `RefinedTraceMethodsPartII:HP.6/exterior-two-weight` (definition).

For a ring map B→A and ω∈Ω²_{A/B}, define its weight to be the least N≥0 for which ω=Σ_{i=1}^N a_i db_i∧dc_i. Such an N exists by the generators of Kähler forms. Over a field, if db_1,…,db_n,dc_1,…,dc_n are independent, then Σ_i db_i∧dc_i has weight n, including in characteristic two.

**Proof or construction.** 1. Take the least natural number in the nonempty set of lengths. 2. The upper bound is the displayed sum; the alternating bilinear contraction map has rank 2n, while each decomposable contributes rank at most 2. This proof also works in characteristic two.

**Inputs.** `mathlib:KaehlerDifferential`, `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`.

**Source.** CMM21, Theorem 5.7 proof and Lemma 5.8, pp. 40–41. The cited result supplies weight of an exterior two-form with the hypotheses stated here.

**Check.** Weight counts summands with scalar coefficients, not the dimension of the whole differential space.

**Uses.** CMM21 Theorem 5.7: Detects unbounded symbol complexity in the non-F-finite continuity counterexample.

**API.**

- `DifferentialForm.twoWeight` (constructor): The minimum length of a decomposition into a db∧dc terms.
- `DifferentialForm.twoWeight_le` (characterisation): A decomposition of length N gives weight at most N.
- `DifferentialForm.twoWeight_zero_iff` (simp): Weight zero iff the form is zero.
- `DifferentialForm.twoWeight_map_le` (functoriality): Base change cannot increase weight.
- `DifferentialForm.twoWeight_independent` (compatibility): For the displayed independent blocks the weight is exactly n.

**Unit tests.**

- `DifferentialForm.twoWeight_zero` (degenerate): The zero form has weight zero.
- `DifferentialForm.twoWeight_plane` (computation): In F_p(x,y), dx∧dy has weight one.
- `DifferentialForm.twoWeight_four` (non-example): In F_2(x_1,x_2,x_3,x_4), dx_1∧dx_2+dx_3∧dx_4 has weight two, not one.

### Discontinuity without F-finiteness

Target `RefinedTraceMethodsPartII:HP.6/non-f-finite-discontinuity` (theorem). Planet: **Non-F-finite K-theory discontinuity**.

For a characteristic-p field k with infinite p-basis, K(k[[t]])/p→lim_s K(k[t]/t^s)/p is not surjective on π2. In particular this holds for k=F_p(t_1,t_2,…).

**Proof or construction.** 1. Use the many-units comparison K2^M≅K2 for the local rings with infinite residue field, and Bockstein plus pro-vanishing of p-torsion in truncated unit groups. 2. Set dt=0 in the coefficientwise differential map Ω²_(k[[t]]/F_p)→Ω²_(k/F_p)[[t]]. Expand a db∧dc: the coefficient of t^j is a sum over three nonnegative indices totaling j, hence at most binom(j+2,2) decomposable terms. A weight-N form therefore has coefficient weight at most N·binom(j+2,2). 3. Choose disjoint p-basis blocks b_i^(s),c_i^(s) with block sizes w_s growing faster than binom(2s+2,2s). The compatible sum of symbols {1+t^s b_i^(s),1+t^s c_i^(s)} has leading block coefficient t^{2s}Σ_i db_i^(s)∧dc_i^(s). Modulo earlier blocks its weight is w_s, contradicting any fixed N. 4. The Milnor sequence surjects π2 of the spectral inverse limit onto the inverse limit of π2, so the group-level obstruction gives spectral failure.

**Inputs.** `RefinedTraceMethodsPartII:HP.6/exterior-two-weight`, `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`.

**Source.** CMM21, Theorem 5.7 and Lemma 5.8, pp. 39–41. The cited result supplies discontinuity without f-finiteness with the hypotheses stated here.

**Check.** Use t^{2s}, not t^{2s−2}; choose the basis in k and retain the relative coefficient field in the weight argument.

## HP.7. Pro logarithmic comparisons

Treat arbitrary characteristic-p relative Witt groups, the henselian surjectivity of restriction minus Frobenius, the pro Illusie sequence and pro Geisser–Levine theorem. Relate Milnor symbols, p-torsion and lifting in local rings.

### Relative logarithmic de Rham–Witt groups

Target `RefinedTraceMethodsPartII:HP.7/relative-log-witt` (definition). Planet: **Relative logarithmic Witt groups**.

For any F_p-algebra R, ideal I, r≥1 and n≥0, use the classical p-typical de Rham–Witt complex W_rΩ_R^n. Let W_rΩ_{R,log}^n be the global sections of the Zariski sheaf image of dlog on n units; this equals the étale sheaf image by Morrow’s theorem. Define W_rΩ^n(R,I) and W_rΩ^n(R,I)_log as the kernels of reduction on ordinary and logarithmic groups respectively. These are not in general images of only globally chosen unit symbols on a nonlocal ring.

**Proof or construction.** 1. Import classical de Rham–Witt, its étale base change and Morrow’s arbitrary-ring logarithmic sheaf exact sequences from CR.4. 2. Take the reduction kernels and restrict the R,F,V operators wherever their source and target lengths agree.

**Inputs.** `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `CrystallineCohomology:CR.4`, `CrystallineCohomology:CR.4/classical-de-rham-witt`, `CrystallineCohomology:CR.4/witt-localization-descent`.

**Source.** CMM21, Definitions 5.24 and 5.28, pp. 45–46. The cited result supplies relative logarithmic de rham–witt groups with the hypotheses stated here.

**Check.** The kernel is taken after forming the logarithmic subgroup.

**Uses.** CMM21 Lemmas 5.29–5.30 and Theorem 5.31: Carries the relative restriction/Frobenius exact sequences leading to pro K comparisons.

**API.**

- `LogWitt.relative` (constructor): The reduction kernel with its inclusion.
- `LogWitt.relativeLog` (constructor): The kernel on logarithmic groups.
- `LogWitt.relative_mem` (characterisation): Membership means reduction to zero.
- `LogWitt.relative_map` (functoriality): Maps of pairs induce maps, preserving identity and composition.
- `LogWitt.relative_operators` (compatibility): Restriction and Frobenius reduce length; Verschiebung increases length, all preserving the relative condition.
- `LogWitt.relative_one` (compatibility): At Witt length one this agrees with relative ordinary and logarithmic differential forms.

**Unit tests.**

- `LogWitt.relative_zeroIdeal` (degenerate): For I=0 both relative groups are zero.
- `LogWitt.relative_unitIdeal` (computation): For I=R they are the full respective groups since the quotient is zero.
- `LogWitt.relative_lengthOne` (compatibility): For R=F_p[t] and I=(t), t lies in W_1Ω^0(R,I); the relative group is a reduction kernel, not Ω^0_{R/(R/I)}.

### Relative logarithmic mod-p comparison

Target `RefinedTraceMethodsPartII:HP.7/smooth-relative-mod-p` (comparison).

For a henselian F_p-pair (R,I) such that R and R/I are ind-smooth, K_n(R,I;Z/p)≅Ω^n(R,I)_log for n≥0, naturally via trace and dlog.

**Proof or construction.** 1. Use henselian-trace-rigidity to replace relative K by relative TC. 2. Subtract the two exact sequences in smooth-trace-defects; Cartier rigidity cancels the cokernel terms.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `RefinedTraceMethodsPartII:HP.4/cartier-henselian-rigidity`, `RefinedTraceMethodsPartII:HP.7/relative-log-witt`.

**Source.** CMM21, Proposition 5.27, p. 46. The cited result supplies relative logarithmic mod-p comparison with the hypotheses stated here.

**Check.** R need not be local; use the sheaf-defined logarithmic subgroup.

### Henselian surjectivity of restriction minus Frobenius

Target `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f` (theorem). Planet: **Relative Witt Frobenius surjectivity**.

If (R,I) is any henselian F_p-pair, then R−F:W_rΩ^n(R,I)→W_{r−1}Ω^n(R,I) is surjective for r≥2 and n≥0; at r=1 the target is W0=0.

**Proof or construction.** 1. Morrow Proposition 2.20(iii) proves this for noetherian F-finite I-complete rings. 2. Filtered-colimit preservation of finite-length Witt forms reduces to henselizations of finite-type F_p-pairs. These are excellent and F-finite. 3. Popescu expresses the completion as a filtered colimit of smooth algebras, split over R by henselian smooth lifting. The cokernel over R therefore injects into the zero cokernel over its completion.

**Inputs.** `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `CrystallineCohomology:CR.4`, `DeformationAndDerivedPatchingAlgebra:R03.3`, `SchemeAndStackFoundations:SF.0/popescu-desingularization`, `SchemeAndStackFoundations:SF.0/henselian-smooth-lifting`, `DeformationAndDerivedPatchingAlgebra:R03.3/excellence-normalization-and-formal-fibres`, `CrystallineCohomology:CR.4/classical-de-rham-witt`, `CrystallineCohomology:CR.4/witt-localization-descent`.

**Source.** CMM21, Lemma 5.29, p. 46. The cited result supplies henselian surjectivity of restriction minus frobenius with the hypotheses stated here.; Morrow19, Proposition 2.20(iii), p. 1557. Supplies surjectivity in the complete noetherian F-finite case.

**Check.** No regularity, noetherianity or completeness is imposed on the final pair.

### Relative pro Illusie sequence

Target `RefinedTraceMethodsPartII:HP.7/relative-pro-illusie` (theorem). Planet: **Relative pro Illusie sequence**.

For a regular noetherian F-finite F_p-algebra R henselian along I, n≥0 and fixed r≥1, the sequence 0→{W_sΩ^n(R,I^s)_log}_s --p^r→ {W_sΩ^n(R,I^s)_log}_s --R^{s−r}→ {W_rΩ^n(R,I^s)_log}_s→0 is exact in pro abelian groups, using the cofinal indices s≥r.

**Proof or construction.** 1. Use the regular-ring Illusie–Shiho sequence and Morrow’s formal-completion pro sequence on the étale site. 2. Their relative kernels have pro H¹=0: apply relative-r-minus-f and the pro logarithmic R−F resolution, whose nonlogarithmic terms are étale-acyclic on affines. 3. Take relative kernels and global sections. The restriction exponent is s−r.

**Inputs.** `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`, `CrystallineCohomology:CR.4`.

**Source.** CMM21, Lemma 5.30, pp. 47–48. The cited result supplies relative pro illusie sequence with the hypotheses stated here.; Morrow19, Corollary 4.8, p. 1573. Provides the pro logarithmic p-power exact sequence for the regular F-finite formal completion.

**Check.** Multiplication by p^r is injective as a pro morphism, not generally on each finite Witt length.

### Diagonal pro Hochschild–Kostant–Rosenberg comparison

Target `RefinedTraceMethodsPartII:HP.7/diagonal-pro-hkr` (theorem).

For regular noetherian F-finite F_p-algebra R and any ideal I, the universal Witt-complex map gives {W_sΩ^n_{R/I^s}}_s≅{TR_n^s(R/I^s;p)}_s and {W_sΩ^n(R,I^s)}_s≅{TR_n^s(R,I^s;p)}_s. Likewise {W_sΩ_R^n}_s≅{TR_n^s(R;p)}_s. These are degreewise pro isomorphisms, not fixed-length full graded isomorphisms.

**Proof or construction.** 1. For fixed length use the full smooth/ind-smooth TR calculation, including its positive-degree polynomial generator, then pro base change along I from finite-thh-pro-base-change and the finite TR induction. 2. The de Rham–Witt reduction kernel is pro-generated by I^s and its differentials, controlled by the Leibniz rule. This identifies the fixed-length quotient pro system. 3. Restriction sends the polynomial generator σ_s to pσ_{s−1}; positive-degree summands become pro-zero. Take the diagonal in the two indices. Surjectivity of Witt form reduction splits the relative long exact sequences into short exact sequences.

**Inputs.** `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change`, `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`, `CrystallineCohomology:CR.4`, `SchemeAndStackFoundations:SF.0/popescu-desingularization`, `CrystallineCohomology:CR.4/classical-de-rham-witt`, `CrystallineCohomology:CR.4/witt-localization-descent`.

**Source.** CMM21, Theorem 5.31 proof, p. 48. The cited result supplies diagonal pro hochschild–kostant–rosenberg comparison with the hypotheses stated here.; DM17, Theorem 5.14 and Corollary 5.15, pp. 230–231. The published pro HKR theorem and diagonal argument supply the quotient comparison.

**Check.** The polynomial generator is retained at finite length and removed only in the restriction pro system.

### Henselian relative pro Geisser–Levine

Target `RefinedTraceMethodsPartII:HP.7/relative-pro-geisser-levine` (theorem). Planet: **Relative pro Geisser–Levine**.

For regular noetherian F-finite R over F_p henselian along I, every n≥0 and r≥1, trace induces {K_n(R,I^s;Z/p^r)}_s≅{W_rΩ^n(R,I^s)_log}_s.

**Proof or construction.** 1. Apply diagonal-pro-hkr and relative-r-minus-f to identify finite TC stages with relative logarithmic groups. 2. The relative pro Illusie sequence supplies p-torsion-freeness and the finite-coefficient quotient. 3. Use uniform-pro-tc to replace the TC-stage tower uniformly before taking the ideal-power diagonal; then use henselian trace rigidity.

**Inputs.** `RefinedTraceMethodsPartII:HP.7/diagonal-pro-hkr`, `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f`, `RefinedTraceMethodsPartII:HP.7/relative-pro-illusie`, `RefinedTraceMethodsPartII:HP.1/uniform-pro-tc`, `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`.

**Source.** CMM21, Theorem 5.31, pp. 48–49. The cited result supplies henselian relative pro geisser–levine with the hypotheses stated here.

**Check.** Do not interchange the two tower indices using pointwise pro-constancy.

### Pro Geisser–Levine for local rings

Target `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine` (theorem). Planet: **Pro Geisser–Levine**.

For regular noetherian F-finite local F_p-algebra R and any ideal I, dlog identifies {K_n(R/I^s;Z/p^r)}_s with {W_rΩ^n_{R/I^s,log}}_s for n≥0,r≥1. The pro abelian group {K_n(R/I^s)}_s is p-torsion-free.

**Proof or construction.** 1. Replace the pair by its henselization along I, whose quotients by I^s agree and whose regularity and F-finiteness persist. 2. Combine relative-pro-geisser-levine with the imported absolute GL comparison and trace compatibility. 3. Milnor symbols surject onto the logarithmic target on these local quotients. The Bockstein sequence gives {K_n/p}≅{K_n(;Z/p)} and pro K_{n−1}[p]=0. This proves torsion-freeness; integral K_n is not identified with its mod-p coefficient group.

**Inputs.** `RefinedTraceMethodsPartII:HP.7/relative-pro-geisser-levine`, `KTheoryFiniteLocalFields:L.6/geisser-hesselholt-regular-local`, `KTheoryFiniteLocalFields:L.6`, `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `SchemeAndStackFoundations:key/henselization`, `DeformationAndDerivedPatchingAlgebra:R03.3/kunz-and-henselian-f-finite`.

**Source.** CMM21, Theorem 5.26, Corollaries 5.32–5.33, pp. 45–46, 49. The cited result supplies pro geisser–levine for local rings with the hypotheses stated here.

**Check.** For I=0,n=0 the groups are Z and Z/p^r; the integral-to-coefficient map is not an isomorphism.

### Milnor symbols and lifting classes

Target `RefinedTraceMethodsPartII:HP.7/milnor-symbols-and-lifting` (theorem).

If R is regular noetherian F-finite over F_p and R/I is local, the map {K_n^M(R/I^s)/p^r}_s→{K_n(R/I^s;Z/p^r)}_s is surjective with kernel equal to the dlog kernel, for classical or improved Milnor K. If R is itself local, 0→{K_n(R,I^s;Z/p^r)}→K_n(R;Z/p^r)→{K_n(R/I^s;Z/p^r)}→0 is pro-exact. Some finite s detects symbolic lifting of a class at R/I, and such a class lifts to integral K_n(R). The relative pro GL comparison holds for any ideal of such local R, without henselianity.

**Proof or construction.** 1. Reduce the first assertion by I-adic completion to pro-geisser-levine and its dlog description. 2. For local R with proper I, units lift from R/I^s to R. This lifts all symbols and splits the relative long exact sequences; I=R is the tautological zero-quotient case. 3. Unpack pro-surjectivity to obtain a finite detecting index s. Apply the absolute GL comparison in the middle term to identify the relative logarithmic kernel.

**Inputs.** `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine`, `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `KTheoryFiniteLocalFields:L.6/geisser-hesselholt-regular-local`, `KTheoryFiniteLocalFields:L.6`, `GeneralAlgebraicKTheory:K.7`.

**Source.** CMM21, Corollaries 5.33–5.35, pp. 49–50. The cited result supplies milnor symbols and lifting classes with the hypotheses stated here.

**Check.** Do not claim every class at every quotient is symbolic; the detection statement quantifies an eventual lifting index.

## HP.8. Étale and semiperfect trace comparisons

Identify the characteristic-p étale trace sheaves, prove the proper henselian comparison and the dimension-bounded Lichtenbaum–Quillen range. Compute perfect and semiperfect cases and the functorial complementary logarithmic summand for local characteristic-p rings.

### Rigid invariants over separably closed fields

Target `RefinedTraceMethodsPartII:HP.8/separably-closed-rigid-invariants` (theorem).

Let G:CommAlg_K→Ab preserve filtered colimits and be invariant under quotient by henselian ideals. If K is separably closed and L/K is any extension of separably closed fields, then G(K)→G(L) is an isomorphism.

**Proof or construction.** 1. For a smooth K-algebra A, compare evaluations at two K-points after henselizing their local neighborhoods; finite presentation and filtered colimits spread the equality to an étale neighborhood. Subtract the pullback along a fixed point x0, so its x0-evaluation is zero. 2. Spread a class over finitely generated subalgebras of L, then use smooth approximation and a K-point to prove surjectivity; the same argument with two maps proves injectivity. Retain the finite-colimit spread-out in Proposition 6.2.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits`, `SchemeAndStackFoundations:SF.0/etale-coordinates`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`.

**Source.** CMM21, Proposition 6.2, pp. 50–51. The cited result supplies rigid invariants over separably closed fields with the hypotheses stated here.

**Check.** The class subtracted in the proof comes from the fixed x0, not the variable point.

### Strictly henselian characteristic-p comparison

Target `RefinedTraceMethodsPartII:HP.8/strict-henselian-comparison` (theorem). Planet: **Strict henselian trace comparison**.

For a strictly henselian local ring A whose residue field has characteristic p, K(A)/p^r→TC(A)/p^r is an equivalence for every r≥1.

**Proof or construction.** 1. Apply henselian trace rigidity at the maximal ideal. 2. For the separably closed residue field use smooth-trace-defects and étale-local surjectivity of inverse Cartier minus one; equivalently pass through separably-closed-rigid-invariants to an algebraic closure and use the same comparison. 3. Induct on r with coefficient cofibres.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `RefinedTraceMethodsPartII:HP.4/etale-differentials`, `RefinedTraceMethodsPartII:HP.8/separably-closed-rigid-invariants`, `SchemeAndStackFoundations:SF.0/henselization-at-prime`.

**Source.** CMM21, Theorem 6.1, p. 50. The cited result supplies strictly henselian characteristic-p comparison with the hypotheses stated here.

**Check.** For A=F_p^alg[[t]] the entire mod-p trace is an equivalence, including degree −1.

### The characteristic-p étale trace sheaves

Target `RefinedTraceMethodsPartII:HP.8/characteristic-p-etale-sheaves` (theorem).

For any scheme X let i:X_p=X×Spec F_p→X. For every n∈Z and r≥1 there is a canonical identification of étale homotopy sheaves π_n(TC/p^r)≅i_*i^*π_n(K/p^r), compatible with the cyclotomic trace. Both sides are sheaves; this is not an assertion about presheaf sections on arbitrary X.

**Proof or construction.** 1. Check the stalks at geometric points using strict-henselian-comparison on the characteristic-p locus. 2. Off that locus p is invertible and TC/p^r vanishes. Use étale continuity to identify the stalks with strict henselizations.

**Inputs.** `RefinedTraceMethodsPartII:HP.8/strict-henselian-comparison`, `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`, `RefinedTraceMethods:RT.2/tate-p-local-properties`, `RefinedTraceMethods:RT.2/tc-p-completion`.

**Source.** CMM21, §6.1, equation (25), p. 51. The cited result supplies the characteristic-p étale trace sheaves with the hypotheses stated here.

**Check.** For X=Spec Z_p the sheaf is supported on the closed fibre.

### Affine characteristic-p étale cohomological dimension

Target `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension` (theorem).

For any F_p-algebra A and any p-primary torsion abelian sheaf F on (Spec A)_et, H^j_et(Spec A,F)=0 for j>1. No noetherianity is required.

**Proof or construction.** 1. Import SF.2/artin-schreier-sequence for constant Z/p coefficients. 2. Apply the étale cohomological-dimension criterion for affine characteristic-p schemes to pass from the Artin–Schreier calculation and its étale base changes to all p-primary torsion sheaves. Devissage and filtered colimits give the p-primary formulation; SF.2 supplies this additional criterion by request.

**Inputs.** `SchemeAndStackFoundations:SF.2`, `SchemeAndStackFoundations:SF.2/artin-schreier-sequence`.

**Source.** CMM21, Lemma 6.4, p. 52. The cited result supplies affine characteristic-p étale cohomological dimension with the hypotheses stated here.

**Check.** H¹ need not vanish: H¹_et(F_p,Z/p)=F_p. The imported SF.2 node treats constant Z/p. This target records the all-p-primary-sheaves form needed by the descent arguments.

### Proper henselian étale K-theory comparison

Target `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison` (theorem). Planet: **Proper henselian étale comparison**.

If X is proper over Spec R and (R,pR) is henselian, its étale Postnikov-sheafified connective K-theory satisfies K̂_et(X)/p^r≃TC(X)/p^r for all r≥1. Here K̂_et is the limit of the étale sheafifications of the Postnikov truncations.

**Proof or construction.** 1. Use the TC/p Postnikov hyperdescent and enhanced sheaf/Postnikov interface requested from SF.2; RT.2 supplies the cyclotomic construction. 2. Proper base change and Gabber affine proper base change identify torsion étale cohomology on X with that on X_p. A finite affine cover of X_p and affine-p-cohomological-dimension give a finite p-cohomological bound. 3. Compare the convergent descent spectral sequences using characteristic-p-etale-sheaves; induct on r.

**Inputs.** `RefinedTraceMethodsPartII:HP.8/characteristic-p-etale-sheaves`, `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension`, `ArcTopologyAndDescent:AT.8/gabber-affine-proper-base-change`, `SchemeAndStackFoundations:SF.2`, `SchemeKTheoryOperations:S.4`, `RefinedTraceMethods:RT.2/tc-p-completion`.

**Source.** CMM21, Theorem 6.3, pp. 51–52. The cited result supplies proper henselian étale k-theory comparison with the hypotheses stated here.

**Check.** For X=Spec R this is the affine comparison. Plain étale sheafification and Postnikov sheafification are not identified without a convergence theorem.

### The p-adic Lichtenbaum–Quillen range

Target `RefinedTraceMethodsPartII:HP.8/asymptotic-trace-comparison` (theorem). Planet: **p-adic Lichtenbaum–Quillen**.

Suppose (R,pR) is henselian, R/p has finite Krull dimension, and d≥1 satisfies [k(x):k(x)^p]≤p^d for every x∈Spec(R/p). Then trace K(R)/p^r→TC(R)/p^r is an isomorphism on π_n for all n≥d and r≥1. Consequently K(R)/p^r→K̂_et(R)/p^r has the same range.

**Proof or construction.** 1. The rigidity cartesian square reduces to characteristic p. 2. Use the nonconnective K-theory Nisnevich/coniveau descent interface in S.4, with convergence in finite Krull dimension. On fields, GL/GH identifies the obstruction with Cartier defects and Ω^{>d}=0. The henselian stalk argument and the convergent filtration yield the stated global range. 3. Apply proper-etale-comparison to Spec R. Handle d=0 separately in the perfect-ring theorem.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison`, `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `SchemeKTheoryOperations:S.4`, `GeneralAlgebraicKTheory:K.6/nonconnective-spectrum`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`.

**Source.** CMM21, Theorem 6.5, Corollary 6.6 and Example 6.7, pp. 52–53. The cited result supplies the p-adic lichtenbaum–quillen range with the hypotheses stated here.

**Check.** For R=Z_p use d=1. For F_p(t_1,…,t_d) retain the boundary n=d. No arbitrary loss by Krull dimension is inserted into the bound.

### Perfect characteristic-p K-theory and TC

Target `RefinedTraceMethodsPartII:HP.8/perfect-rings` (theorem).

For a perfect F_p-algebra A and r≥1, K(A)/p^r≃τ≥0(TC(A)/p^r) and both have zero positive homotopy groups. π0 is the locally constant Z/p^r-valued functions on Spec A. Moreover π−1(TC(A)/p^r)=coker(F−1:W_r(A)→W_r(A)), with no lower homotopy groups.

**Proof or construction.** 1. Use perfect-ring THH/TC from RT.2 and the Artin–Schreier–Witt calculation to compute TC. 2. Use the S.6 perfect-ring Adams-operation consequence: K_i(A), i>0, and the rank kernel in K0 are uniquely p-divisible. Frobenius is an automorphism, and ψ^p on the finite Adams filtration gives this consequence; no unfiltered equality ψ^p=p^i on all K_i is asserted. 3. Compare trace on the rank summand.

**Inputs.** `RefinedTraceMethods:RT.2/tr-de-rham-witt-hkr`, `SchemeKTheoryOperations:S.6`, `GeneralAlgebraicKTheory:K.2:plus/zero-one-ring-comparison`, `CrystallineCohomology:CR.4/classical-de-rham-witt`, `CrystallineCohomology:CR.4/witt-localization-descent`.

**Source.** CMM21, Example 6.8, p. 53. The cited result supplies perfect characteristic-p k-theory and tc with the hypotheses stated here.

**Check.** For A=F_p×F_p, π0 is (Z/p^r)², not Z/p^r. For A=F_p, π−1TC/p^r=Z/p^r.

### Trace with semiperfect reduction

Target `RefinedTraceMethodsPartII:HP.8/semiperfect-reduction` (theorem). Planet: **Semiperfect trace comparison**.

If (R,pR) is henselian and Frobenius on R/pR is surjective, then K(R)/p^r≃τ≥0(TC(R)/p^r) for every r≥1, and K(R;Z_p)≃τ≥0TC(R;Z_p) after derived p-completion.

**Proof or construction.** 1. Reduce to characteristic p via rigidity. The nilradical of a semiperfect ring is locally nilpotent and its quotient is perfect. 2. Intrinsic henselianity of nil ideals and rigidity compare the semiperfect ring with its perfect reduced quotient by a cartesian trace square. Insert the connective perfect-ring comparison and use the truncation fibre criterion. 3. For p-completion use the bottom homotopy transition surjectivity and the Milnor sequence; truncation is not simply commuted with an arbitrary inverse limit.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.0/henselian-permanence`, `RefinedTraceMethodsPartII:HP.8/perfect-rings`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`.

**Source.** CMM21, Corollary 6.9, p. 53. The cited result supplies trace with semiperfect reduction with the hypotheses stated here.

**Check.** Covers R=Z_p and R=F_p[x^{1/p^∞}]/(x); reducedness is not required.

### Nonarchimedean valuation-ring comparison

Target `RefinedTraceMethodsPartII:HP.8/valuation-ring-comparison` (application).

Let C be a complete nonarchimedean field of residue characteristic p with perfect residue field. For its valuation ring O_C, K(O_C)/p^r≃τ≥0(TC(O_C)/p^r) and K(O_C;Z_p)≃τ≥0TC(O_C;Z_p).

**Proof or construction.** 1. Completeness of the valued field gives Hensel lifting in its valuation ring. A quotient of a henselian local ring by an ideal in its maximal ideal is henselian, so the valuation ring is henselian along the maximal ideal; apply the main rigidity theorem there. 2. Completeness makes the valuation ring henselian at its maximal ideal. That ideal has perfect quotient, so apply rigidity and perfect-rings directly. 3. Keep the p-completed coefficients when specializing to C_p; identification with connective complex K-theory belongs to RT.4.

**Inputs.** `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.8/perfect-rings`, `SchemeAndStackFoundations:SF.0/henselian-pair-permanence`, `StableHomotopyKTheory:H.6/milnor-sequence`, `StableHomotopyKTheory:H.6/p-completion`.

**Source.** CMM21, Example 6.10, pp. 53–54. The cited result supplies nonarchimedean valuation-ring comparison with the hypotheses stated here.

**Check.** For C=Q_p the conclusion uses the perfect residue field F_p. Any comparison with complex K-theory retains Z_p coefficients.

### Higher Witt defect functors

Target `RefinedTraceMethodsPartII:HP.8/higher-cartier-defect` (construction).

For an F_p-algebra R take the polynomial F_p-algebra on its underlying set, map it onto R, and henselize along the kernel to obtain the fixed functorial presentation R′→R. For m≥0 define ν̃_r^m(R)=H¹_et(Spec R′, π_m(TC/p^r)); put it zero for m<0. Use homotopy sheaves on the étale site. This fixed-presentation construction preserves filtered colimits and is compatible with coefficient reduction. Presentation independence is a conclusion of explicit-witt-cokernel.

**Proof or construction.** 1. The free polynomial presentation and henselization are functorial and commute with filtered colimits. R′ is ind-smooth. For local R, R′ is local because its kernel is radical and its quotient is local. 2. Use the finite-coefficient TC colimit theorem and SF.2/etale-cohomology-limits for the fixed functorial presentation. At r=1, GL/GH and Cartier henselian invariance identify the result with Cartier.nuTilde.

**Inputs.** `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.0/henselized-milnor-squares`, `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension`, `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`, `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `RefinedTraceMethodsPartII:HP.4/cartier-henselian-rigidity`.

**Source.** CMM21, Theorem 6.11 construction, pp. 54–55. The cited result supplies higher witt defect functors with the hypotheses stated here.

**Check.** The group is H¹ of π_m, not π_{m−1}; the complementary degree in π_nTC is m=n+1.

**Uses.** CMM21 Theorem 6.11 and Proposition 6.12: Defines the natural complementary summand in finite-coefficient TC.

**API.**

- `WittDefect.ofHenselianPresentation` (constructor): The H¹ group on an ind-smooth henselian presentation.
- `WittDefect.map` (functoriality): Functorial maps under ring maps and coefficient reductions, respecting identities and compositions.
- `WittDefect.fixedPresentation` (projection): The canonical polynomial presentation, its henselian kernel and the associated H¹ description.
- `WittDefect.modP` (compatibility): At r=1 this is Cartier.nuTilde in degree m.
- `WittDefect.preservesFilteredColimits` (compatibility): The filtered-colimit comparison is an isomorphism.

**Unit tests.**

- `WittDefect.primeField_zeroDegree` (computation): ν̃_r^0(F_p)=Z/p^r.
- `WittDefect.algebraicClosure_zeroDegree` (computation): ν̃_r^0(F_p^alg)=0.
- `WittDefect.negative` (degenerate): ν̃_r^m(R)=0 for m<0.
- `WittDefect.dualNumbers_modP` (compatibility): ν̃_1^0(F_p[ε]/ε²)=F_p by nilpotent henselian invariance.

### Functorial splitting on local characteristic-p rings

Target `RefinedTraceMethodsPartII:HP.8/split-trace` (theorem). Planet: **Split cyclotomic trace**.

For every local F_p-algebra R, r≥1 and n≥−1, there is a natural coefficient-compatible decomposition π_n(TC(R)/p^r)≅K_n(R;Z/p^r)⊕ν̃_r^{n+1}(R). The first inclusion is cyclotomic trace. For arbitrary F_p-algebras the same assertion holds after Zariski sheafification. This is a splitting of groups, not a claimed natural splitting of spectra.

**Proof or construction.** 1. On the ind-smooth local R′, étale cohomological dimension ≤1 makes the descent edge map from H¹(π_{n+1}TC/p^r) canonical. GL/GH identifies the other summand. 2. Push the edge map through R′→R and apply the rigidity cartesian square to identify the new complement. 3. Use functorial presentations and coefficient maps for naturality; the local statement gives the Zariski sheaf statement.

**Inputs.** `RefinedTraceMethodsPartII:HP.8/higher-cartier-defect`, `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity`, `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension`, `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `SchemeAndStackFoundations:SF.2/etale-cohomology-limits`.

**Source.** CMM21, Theorem 6.11, pp. 54–55. The cited result supplies functorial splitting on local characteristic-p rings with the hypotheses stated here.

**Check.** For n=−1 the K summand is zero and the complement is ν̃_r^0. A dual-number ring tests the singular case.

### Explicit Witt-cokernel complement

Target `RefinedTraceMethodsPartII:HP.8/explicit-witt-cokernel` (theorem). Planet: **Witt-cokernel trace complement**.

For every F_p-algebra R, m≥0 and r≥1, ν̃_r^m(R)≅coker(π−F̄:W_rΩ_R^m→W_rΩ_R^m/dV^{r−1}Ω_R^{m−1}). Here π is projection, F̄ is the Frobenius factorization through this quotient, and Ω^{−1}=0. This includes singular R; it does not identify the classical complex with the saturated complex for singular rings. Consequently any ind-smooth henselian presentation gives canonically the same defect group, compatibly with ring maps and coefficient reduction.

**Proof or construction.** 1. Use Morrow’s arbitrary-ring exact logarithmic sequence for the kernel of π−F̄ and its étale-local surjectivity. 2. For a henselian pair, the cokernel is invariant: its relative target kernel is surjected onto by W_rΩ^m(R,I), and relative-r-minus-f supplies a preimage via W_{r+1}. Apply the snake lemma. 3. On R′, the two nonlogarithmic sheaves are affine-acyclic, so their cokernel computes the H¹ definition. Descend to R by the just-proved henselian invariance.

**Inputs.** `RefinedTraceMethodsPartII:HP.8/higher-cartier-defect`, `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f`, `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `CrystallineCohomology:CR.4/logarithmic-witt-sequences`, `SchemeAndStackFoundations:SF.2/quasi-coherent-topology-comparison`.

**Source.** CMM21, Proposition 6.12 and corrected equations (26)–(27), pp. 55–56. The cited result supplies explicit witt-cokernel complement with the hypotheses stated here.; Morrow19, Corollary 4.2(iii) and Remark 4.3, pp. 1566–1567. Supplies the arbitrary-ring finite-length logarithmic sequence, with the degree-correct exact-form quotient.

**Check.** At r=1 recover Cartier.nuTilde; at m=0 recover coker(1−F:W_rR→W_rR). The denominator has form degree m−1.

## HP.9. Quasisyntomic K-theory consequences

Export the connective TC comparison for quasiregular semiperfectoid rings, identify the weight-zero and weight-one consequences and characteristic-p crystalline eigenspaces, and prove quasisyntomic-local evenness using imported syntomic discreteness.

### Quasiregular semiperfectoid K-theory and TC

Target `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace` (theorem). Planet: **Quasiregular semiperfectoid trace**.

For a quasiregular semiperfectoid ring S, K(S;Z_p)≃τ≥0TC(S;Z_p). Under the BMS filtration and syntomic identifications, K_{2i}(S;Z_p)=H⁰(Z_p(i)(S)) and K_{2i−1}(S;Z_p)=H¹(Z_p(i)(S)) for i≥1, while K0 corresponds to H⁰ of weight zero. No claim that the global H¹ groups vanish in mixed characteristic is made here.

**Proof or construction.** 1. Quasiregular semiperfectoid rings are derived p-complete with bounded p-power torsion and semiperfect mod p. Apply semiperfect-reduction. 2. Import the BMS complete filtration and the quasiregular semiperfectoid two-term syntomic calculation from RT.6 and PR.4. Connectivity leaves a single weight in each indicated degree.

**Inputs.** `RefinedTraceMethodsPartII:HP.8/semiperfect-reduction`, `RefinedTraceMethods:RT.6/filtered-frobenius`, `RefinedTraceMethods:RT.6/motivic-convergence`, `PrismaticCohomology:PR.4/syntomic-complex`.

**Source.** BMS2, Theorem 7.15 and discussion following it, pp. 261–263. The cited result supplies quasiregular semiperfectoid k-theory and tc with the hypotheses stated here.

**Check.** The trace comparison holds before imposing syntomic H¹ vanishing.

### Low-degree K-theory on w-local rings

Target `RefinedTraceMethodsPartII:HP.9/w-local-low-k` (theorem).

For a w-local ring S (the closed points of Spec S form a closed subset and each connected component has exactly one closed point; finite Zariski covers split), K0(S) is the group of locally constant integer-valued functions, determinant identifies K1(S) with S×, and K2(S) is generated by products of units. If S× is p-divisible, then K1(S;Z_p)=0 and K2(S;Z_p)≅T_p(S×). Applied to the quasisyntomic w-local, p-divisible-unit basis, these formulas recover the weight-zero and weight-one syntomic sheaves already owned by PR.4.

**Proof or construction.** 1. Local-ring projective and symbol calculations from K.2 glue because every finite Zariski cover splits. 2. Apply the Bockstein sequence and the torsion-free rank description of K0, then take the derived inverse limit. 3. Construct the required basis by iterating w-localization and adjoining roots using X_u^p−u, followed by p-completion; use the QRSP permanence and cover theorem from DD.5 and SF.2.

**Inputs.** `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace`, `GeneralAlgebraicKTheory:K.2:low-degree-comparisons`, `PrismaticCohomology:PR.4/syntomic-low-weights`, `DerivedDeRhamCohomology:DD.5`, `SchemeAndStackFoundations:SF.2`.

**Source.** BMS2, Propositions 7.16–7.17, pp. 262–263. The cited result supplies low-degree k-theory on w-local rings with the hypotheses stated here.

**Check.** For S=F_p×F_p, K0=Z². The root cover adjoins X_u with X_u^p=u for each unit u and then completes each Čech term p-adically.

### Crystalline eigenspace K-theory

Target `RefinedTraceMethodsPartII:HP.9/crystalline-eigenspace-k` (theorem). Planet: **Crystalline eigenspace K-theory**.

For a quasiregular semiperfect F_p-algebra S, all positive odd K_n(S;Z_p) vanish and K_{2i}(S;Z_p)≅A_crys(S)^{φ=p^i} for i≥0, compatibly with products. The right side is the eigenspace in the uncompleted-for-Nygaard crystalline ring A_crys, not just its Nygaard completion.

**Proof or construction.** 1. Use the PR.4/syntomic-complex-char-p theorem, including p-torsion-freeness and removal of Nygaard completion. 2. Insert these calculations into quasiregular-semiperfectoid-trace. H¹ vanishes in weights i>0, giving positive odd vanishing; H⁰ in weight zero gives K0. Weight-zero H¹ can be nonzero and belongs to π−1TC, outside connective K. Multiplicativity comes from the filtered trace.

**Inputs.** `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace`, `PrismaticCohomology:PR.4/syntomic-complex-char-p`, `RefinedTraceMethods:RT.6/filtered-frobenius`, `RefinedTraceMethods:RT.6/motivic-convergence`.

**Source.** BMS2, Proposition 8.20 and Corollary 8.23, pp. 281–283. The cited result supplies crystalline eigenspace k-theory with the hypotheses stated here.

**Check.** S=O_Cp/p is a characteristic-p example; the eigenspace ring is not claimed to compute mixed-characteristic QRSP rings in this form.

### Quasisyntomic-local evenness of K-theory

Target `RefinedTraceMethodsPartII:HP.9/quasisyntomic-evenness` (theorem). Planet: **Quasisyntomic evenness of K-theory**.

On the p-complete quasisyntomic site, the sheafifications of π_{2i−1}K(−;Z_p) and π_{2i−1}K(−;Z/p^r) vanish for i≥1,r≥1. The even p-adic homotopy sheaves are p-torsion-free. This is local for the quasisyntomic topology, not a vanishing claim on every quasisyntomic ring.

**Proof or construction.** 1. Pass to the quasiregular semiperfectoid basis. Use quasiregular-semiperfectoid-trace and the complete BMS filtration. 2. PR.4/tate-twist-discreteness makes each syntomic sheaf discrete and p-torsion-free. Through any fixed homotopy degree only finitely many filtered pieces contribute, so the complete filtration gives odd vanishing and p-torsion-free even sheaves. 3. The Bockstein sequence gives the finite-coefficient statement. Use PR.4/syntomic-filtered-colimits to pass to filtered presentations.

**Inputs.** `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace`, `PrismaticCohomology:PR.4/tate-twist-discreteness`, `PrismaticCohomology:PR.4/syntomic-filtered-colimits`, `RefinedTraceMethods:RT.6/filtered-frobenius`, `RefinedTraceMethods:RT.6/motivic-convergence`, `StableHomotopyKTheory:H.6/bockstein-long-exact-sequence`.

**Source.** BS22, Theorem 14.1 and Corollary 14.2, p. 97. The cited result supplies quasisyntomic-local evenness of k-theory with the hypotheses stated here.

**Check.** F_p[t,t⁻¹] has a nontrivial unit K1 before passage to covers; the theorem is a sheaf statement.

### Odd-degree surjectivity for rooted regular quotients

Target `RefinedTraceMethodsPartII:HP.9/rooted-regular-quotients` (theorem). Planet: **Odd surjectivity for rooted quotients**.

Let R be a perfectoid Z_p[ζ_{p^∞}]^∧-algebra and f_1,…,f_s a regular sequence whose terms have compatible p-power roots. For S=R/(f_1,…,f_s), K_n(R;Z_p)→K_n(S;Z_p) is surjective for every odd n≥1. Thus evenness for R implies evenness for S; in particular K_*(O_C/p^a;Z_p) is even for a≥1 when C is a complete algebraically closed extension of Q_p.

**Proof or construction.** 1. Use the universal root-power polynomial model of the quotient. The H¹-surjectivity of syntomic complexes and the prismatic cotangent-surjectivity lemma are already included in PR.4/tate-twist-discreteness. 2. Transport to K by quasiregular-semiperfectoid-trace and naturality, using the same two-term calculation on the quotient. For O_C/p^a the regular element p^a has compatible roots in O_C.

**Inputs.** `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace`, `PrismaticCohomology:PR.4/tate-twist-discreteness`, `PrismaticCohomology:PR.4/tate-twists-acceptance-examples`.

**Source.** BS22, Corollary 14.3 and proof, pp. 97, 101. The cited result supplies odd-degree surjectivity for rooted regular quotients with the hypotheses stated here.

**Check.** For s=0 the map is the identity. The regular-sequence and compatible-root hypotheses are both retained.

## Worked acceptance examples

1. **A square-zero ideal.** In R⋉M with M²=0, the product of (r,x) and (s,y) is (rs,ry+sx). The augmentation kills M, its inclusion is nonunital, and the quasi-inverse of x is −x. The HP.0 root operations agree with the ambient nilpotent henselian pair. HP.5 reduces the trace-fibre calculation to DGM. This tests the constant-term fibre and the xy term when the input ceases to be square-zero.
2. **An ordinary adic pair.** Apply HP.5 to (Z_p,pZ_p), then HP.6 to its powers. Z_p/p is F-finite, and K(Z_p)/p^r is the spectral inverse limit of K(Z/p^s)/p^r. The result does not equate the homotopy group with an ordinary inverse limit without its Milnor term.
3. **A free characteristic-p henselian example.** For (F_p[t]^h_(t),t), HP.0 identifies its augmentation ideal with the free one-generator henselian nonunital F_p-algebra. The quotient is F_p, both rings are ind-smooth and local, and HP.4 identifies their trace defects by Cartier henselian invariance. This is the characteristic-p test object in HP.5’s axiomatic proof.
4. **Integral failure after perfection.** For R=(F_p[[x]])^perf and I=ker(R→F_p), 1+x gives a nonzero relative unit. Frobenius is bijective, so this unit group is uniquely p-divisible. HP.5’s finite-coefficient trace square holds, but the integral relative K spectrum cannot equal the p-complete relative TC spectrum.
5. **The F-finiteness boundary.** Let k=F_p(t_1,t_2,…) and A=k[[t]]. Choose independent blocks in Ω¹_k with sizes growing faster than the quadratic coefficient bound. Compatible sums of {1+t^s b,1+t^s c} in truncated K2 have a degree-2s coefficient of unbounded exterior weight. Every form coming from A has one finite bound, so HP.6 detects failure of K-continuity. In characteristic two, rank of the alternating contraction map still gives the weight-two test.
6. **A singular local input.** For R=F_p[x]/(x²), HP.8 gives a natural direct sum on TC homotopy groups, with the trace identifying its K summand. At r=1 the complement uses coker(1−C⁻¹:Ω^m→Ω^m/dΩ^(m−1)); at m=0 it is the Artin–Schreier quotient. For r>1 use classical W_rΩ of this singular ring. Saturation is not substituted.
7. **A valuation ring and a rooted quotient.** For O_C with C complete algebraically closed over Q_p, HP.8 gives the connective K–TC comparison by henselian rigidity and the perfect residue field. HP.9 applies to O_C/p^a using the regular element p^a and its compatible roots. The odd completed K groups vanish for these quotients. The w-local calculation of K2 as a Tate module is applied only after its specified refinement and adjoining roots of units.
8. **A constant-sheaf and a negative tower test.** On an affine F_p-algebra, SF.2’s Artin–Schreier calculation is upgraded by its cohomological-dimension criterion before applying it to arbitrary torsion sheaves. In the separate tower direction, ⊕_(j≥i)Σ^(−j)HF_p prevents using degreewise nilpotence without a common lower bound. These tests distinguish the hypotheses that a pointwise argument would lose.

## Open supplier contracts

Each item below is an input with an existing owner. The packet lists its exact consuming nodes in `neededBy`. These requests prevent closure; none is presented as a completed theorem in the pinned libraries.

### CrystallineCohomology:CR.4

Extend the already planned classical de Rham–Witt and logarithmic interfaces to every F_p-algebra: length-r groups preserve filtered colimits, Zariski and étale logarithmic image sheaves agree, and the logarithmic kernel sequence has denominator dV^{r−1}Ω^{n−1}, including n=0 with Ω^{−1}=0 (Morrow Corollaries 4.1–4.2 and Remark 4.3, pp. 1566–1567). Supply Morrow Proposition 2.20, p. 1557, and Corollary 4.8, p. 1573, for complete noetherian F-finite rings and their pro-thickenings: restriction/Frobenius and the finite-length logarithmic sequences, with pro exactness and cofinal reindexing. Existing regular-smooth logarithmic nodes alone do not cover singular quotients. HP.7 owns the henselian-relative and TC consequences.

Consumers: `RefinedTraceMethodsPartII:HP.7/relative-log-witt`, `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f`, `RefinedTraceMethodsPartII:HP.7/relative-pro-illusie`, `RefinedTraceMethodsPartII:HP.7/diagonal-pro-hkr`.

### DeformationAndDerivedPatchingAlgebra:R03.1

For a noetherian ring A, ideal I and finite A-module M, derived I-completion is discrete and equals ordinary completion. Supply both Artin–Rees pro-Tor vanishings {Tor_j^A(A/I^s,M)}_s=0 and {Tor_j^A(A/I^s,M/I^s M)}_s=0 for j>0, with the natural quotient transitions; the second form is essential for THH base change (Dundas–Morrow Corollary 2.2 and Lemma 5.2, pp. 205 and 223–224). Finite modules over an I-complete A are I-complete and quotient towers have surjective transitions.

Consumers: `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change`, `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity`.

### DeformationAndDerivedPatchingAlgebra:R03.3

Finite-type Z-algebras are excellent, henselization of an excellent ring remains excellent, and completion maps of the resulting noetherian henselian pairs are regular. In characteristic p, henselizations/localizations of the F-finite polynomial models retain F-finiteness and bounded p-torsion. Together with Popescu and henselian smooth lifting these provide finite-level factorizations through smooth algebras, retaining the fixed quotient.

Consumers: `RefinedTraceMethodsPartII:HP.6/continuity-implies-rigidity`, `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f`.

### DerivedDeRhamCohomology:DD.5

Refine the elementary compatible-root semiperfectoid covers to a quasisyntomic basis of w-local quasiregular semiperfectoid rings with p-divisible unit groups; preserve p-completeness, bounded p-torsion and the cotangent Tor-amplitude [−1,0] condition at every refinement and Čech term (BMS2 Proposition 7.17, pp. 262–263). The underlying w-local topological refinement is supplied by SF.2; the root extension uses X_u^p−u, and each Čech term S^q is individually p-completed.

Consumers: `RefinedTraceMethodsPartII:HP.9/w-local-low-k`.

### EnhancedDerivedSheaves:E3

Accessible orthogonality to a set of finitely presented maps gives a reflective presentable subcategory. For a finitary algebraic theory, the free/forgetful adjunction is monadic, surjections are regular epimorphisms, and a functor out of its discrete algebras is left Kan extended from finite free/retract objects iff it preserves filtered colimits and discrete augmented simplicial resolutions. For the pointed-space/connective-spectrum adjunction, Ω∞ is conservative and preserves sifted colimits, so the augmented bar construction of Σ∞Ω∞ realizes to the input spectrum. These are the algebraic-theory and adjoint interfaces, not new henselian objects.

Consumers: `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.2/goodwillie-recognition`, `RefinedTraceMethodsPartII:HP.2/free-simplicial-resolutions`.

### GeneralAlgebraicKTheory:K.2:low-degree-comparisons

The natural K2 comparison for local rings with infinite residue field identifies K2 with the bilinear Steinberg-symbol presentation (the many-units theorem used in CMM Theorem 5.7). For w-local rings, determinant gives K1≃units and K2 is generated by products of unit classes, by passage from finite products of local rings. Use the existing plus model, not a new K-theory construction. Higher Milnor/dlog statements are requested from the regular-local L.6 branch separately.

Consumers: `RefinedTraceMethodsPartII:HP.6/non-f-finite-discontinuity`, `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine`, `RefinedTraceMethodsPartII:HP.7/milnor-symbols-and-lifting`, `RefinedTraceMethodsPartII:HP.9/w-local-low-k`.

### GeneralAlgebraicKTheory:K.7

For commutative rings construct the multiplicative K-theory pairing natural in ring maps. Products of unit classes are multilinear and satisfy {a,1−a}=0 whenever both entries are units, so they induce the classical Milnor symbol homomorphism in each degree. This is the higher product and symbol interface, not a Matsumoto assertion for arbitrary rings.

Consumers: `RefinedTraceMethodsPartII:HP.7/milnor-symbols-and-lifting`.

### KTheoryFiniteLocalFields:L.6

In the regular-local characteristic-p branch already present as L.6/geisser-hesselholt-regular-local, supply the finite-coefficient Geisser–Levine comparison K_n(R;Z/p^r)≃W_rΩ^n_(R,log), p-torsion-freeness of integral K_n(R), and compatibility of trace with dlog symbols, for regular local F_p-algebras. Extend the local ind-smooth version by filtered colimits. Include the classical and improved Milnor symbol maps for local rings and the fact that dlog images are generated by their symbols. CMM Theorem 4.29 and proof of Corollaries 5.32–5.35 cite these inputs; the existing p-completed kernel statement alone is insufficient.

Consumers: `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects`, `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine`, `RefinedTraceMethodsPartII:HP.7/milnor-symbols-and-lifting`.

### RefinedTraceMethods:RT.2

Supply the strong symmetric monoidal structure on the trivial-cyclotomic functor triv:Sp→CycSp, so HF_p^triv is a commutative algebra object and its modules and module mapping spectra are defined. The existing trivial-cyclotomic-adjunction states the adjunction but does not state this monoidal compatibility; CMM Lemmas 2.10–2.11, pp. 9–10, use it. Supply the Brun change-of-rings spectral sequence E²_(i,j)=THH_i(B,Tor_j^A(B,M))⇒THH_(i+j)(A,M) for A→B and a B-bimodule M in the connective range, natural in coefficient maps, with strong first-quadrant convergence. Use the already planned THH bimodule-coefficient construction. Dundas–Morrow Proposition 5.1 and Lemma 5.2, pp. 223–224, give the exact input; HP.6 applies it to pro Artin–Rees base change.

Consumers: `RefinedTraceMethodsPartII:HP.1/trivial-hfp`, `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change`.

### RefinedTraceMethods:RT.3

Generic Goodwillie n-excisive approximations P_n exist for the reduced filtered-colimit-preserving space/spectrum functors used here; identify homogeneous layers by multilinear cross-effects and homotopy Σ_n-orbits, and supply the convergence/connectivity theorem for an analytic functor on 1-connective spectra. HP.2 computes these cross-effects for Σ∞Ω∞; RT.3/goodwillie-calculus currently provides first derivatives only and does not discharge this request.

Consumers: `RefinedTraceMethodsPartII:HP.2/suspension-loop-goodwillie-tower`.

### SchemeAndStackFoundations:SF.2

Supply the étale p-cohomological-dimension criterion which upgrades affine Artin–Schreier calculations to H^j(Spec A,F)=0 for all p-primary torsion sheaves and j>1 in characteristic p. Supply the Postnikov descent spectral sequence and hyperdescent for finite-coefficient TC on qcqs schemes, under its uniform lower bound; for proper schemes over a henselian p-pair, justify interchange of the bounded Postnikov comparisons with completion using proper base change. Supply w-local refinement: closed points form a closed subset and each connected component has one closed point; affine schemes admit the w-local refinements used to split finite Zariski covers, and their finite-projective/K1/K2 formulas reduce by filtered limits to finite products of local rings.

Consumers: `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension`, `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison`, `RefinedTraceMethodsPartII:HP.9/w-local-low-k`.

### SchemeKTheoryOperations:S.4

Construct étale Postnikov sheafification K̂_et as lim_n a_et τ≤n K with the trace-compatible descent spectral sequence. Supply Nisnevich descent and reduction of homotopy-invariant henselian-rigid K-theory fibre bounds to residue fields on finite-dimensional characteristic-p schemes (CMM Theorem 6.5, pp. 52–53). Keep the field p-rank bound [k:k^p]≤p^d uniform and use only the resulting n≥d range; no statement of unbounded étale cohomological convergence is assumed.

Consumers: `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison`, `RefinedTraceMethodsPartII:HP.8/asymptotic-trace-comparison`.

### SchemeKTheoryOperations:S.6

For characteristic-p commutative rings, identify absolute Frobenius pullback with ψ^p on K-theory and prove the integral Adams-filtration consequence: for a perfect F_p-algebra A, K_i(A) is uniquely p-divisible for i>0, and the kernel of the rank map K0(A)→locally constant integer-valued functions is uniquely p-divisible. Include passage from connected finite-type perfections to arbitrary perfect algebras using filtered colimits and Zariski descent, as in CMM Example 6.8, p. 53. A rational eigenspace theorem alone does not imply these assertions.

Consumers: `RefinedTraceMethodsPartII:HP.8/perfect-rings`.

### StableHomotopyKTheory:H.5:spectra

For a connective finite-type spectrum such as S/p, each bounded Postnikov truncation belongs to the thick subcategory generated by HF_p if its homotopy groups are finite p-groups. Supply finite-type Postnikov approximations to HZ, the stable Hurewicz theorem identifying the bottom nonzero homotopy with integral homology, and Freudenthal connectivity for Σ∞K(A,n)→Σ^nHA uniformly in A. For free finite-rank A, the bar/cellular construction of K(A,n) has finitely many cells in each bounded degree. These uniform estimates, rather than pointwise compactness, are the needed inputs.

Consumers: `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits`, `RefinedTraceMethodsPartII:HP.1/orbit-approximation`, `RefinedTraceMethodsPartII:HP.2/integral-homology-recognition`, `RefinedTraceMethodsPartII:HP.3/eilenberg-maclane-pseudocoherent`.

### StableHomotopyKTheory:H.6

Countable Mittag–Leffler criterion: an inverse sequence of abelian groups with vanishing lim¹ of its countable direct sum is Mittag–Leffler. Apply pointwise, then use preservation of countable coproducts and a diagonal choice of witnesses to obtain a single transition annihilating a fixed tower level as a natural transformation. The finite-range spectral version uses the Milnor exact sequence degree by degree with one common range [a,b].

Consumers: `RefinedTraceMethodsPartII:HP.1/uniform-pro-zero`.

## Source corrections used by the targets

The findings below were inherited from the routed extractions and checked at the indicated locators. The version ledger and the limited correction search are in the packet. They are mathematical corrections for planning, not claims that a new published erratum has been discovered.

- **E1**, CMM21, Introduction after Theorem G, p. 4 (arXiv v2): Distinguish Geisser–Levine for K and Geisser–Hesselholt for TC. Reason: The two distinct inputs are explicitly separated in Theorem 4.29.
- **E2**, CMM21, Remark 3.11, p. 20 (arXiv v2); journal Remark 3.11: It is the left adjoint of the underlying-set functor. Reason: Its universal property is Hom(Free(S),I)=Hom(S,U(I)), and free objects preserve colimits.
- **E3**, CMM21, Proof of Theorem 5.7, p. 40 (arXiv v2): Use degree 2j after killing dt, choose independent p-basis blocks in k, and require w_s/binom(2s+2,2) to be unbounded. Reason: dlog(1+t^j b) has first coefficient t^j db after setting dt=0; wedging two such terms gives t^(2j). The coefficient of a db∧dc is a sum over three indices, giving the stated quadratic bound.
- **E4**, CMM21, Proof of Lemma 5.30, p. 47 (arXiv v2): In the length-s to length-r reduction use R^(s−r); in the multiplication-by-p^r lifting calculation use the restriction lowering length by r. Reason: Restriction decreases Witt length by its exponent, so a negative or mismatched target index cannot define that arrow.
- **E5**, CMM21, Proof of Proposition 6.2, p. 50 (arXiv v2): The normalized class first vanishes at x0. Henselian rigidity and an étale neighborhood then prove vanishing near x0. Reason: Subtracting q* x0*α cancels only the fixed-point value before the rigidity argument.
- **E6**, CMM21, Example 6.10, p. 54 (arXiv v2): Retain p-completion throughout: the resulting topological spectrum is ku completed at p. Reason: Its degree-zero group is Z_p, whereas integral ku has degree-zero group Z.
- **E7**, CMM21, Paragraph immediately before Theorem 6.11, p. 54 (arXiv v2): The complement is H¹_et(π_(n+1)(TC/p^r)). Reason: The descent spectral sequence has total degree t−s; H¹ contributes to degree n from t=n+1.
- **E8**, CMM21-journal, Equations (26)–(27) and Proposition 6.12 proof, pp. 468–469; arXiv v2 pp. 55–56: Use dV^(r−1)Ω^(m−1) in every such denominator, with Ω^(−1)=0. Reason: d raises degree by one. At r=1 this gives Ω^m/dΩ^(m−1); at m=0 it leaves W_r(R), recovering Artin–Schreier–Witt. Morrow Corollary 4.2(ii)–(iii) has the correct degree.
- **E9**, CMM21-journal, Definition 5.14, journal p. 455; arXiv v2 pp. 42–43: Keep the upper-truncation definition on arbitrary towers; use the degreewise equivalence only for uniformly bounded-below towers. Reason: For X_i=⊕_(j≥i)Σ^(−j)HF_p every fixed homotopy tower eventually vanishes, but τ≤0X_i=X_i has no uniformly zero transition. Finite Postnikov induction works when the lower bound is fixed.
- **E10**, CMM21-journal, Proof of Theorem 5.21, journal p. 456; arXiv v2 p. 44: Use the comparison after derived reduction modulo p. Pass first to π0 by DGM, then apply henselian rigidity to the p-power ideal. Reason: The main rigidity theorem proves the finite-coefficient comparison; Remark 4.39 supplies an obstruction to the unrestricted integral inference.
- **E11**, CMM21-journal, Proof of Corollary 5.33, journal p. 462; arXiv v2 p. 49: The pro Bockstein map identifies {K_n(R/I^s)/p}_s with {K_n(R/I^s;Z/p)}_s after the preceding pro p-torsion term vanishes. Reason: At I=0,n=0 and a field R, the integral group is Z and the finite-coefficient group is F_p, so no integral identification can hold.
- **E12**, BMS2, Proof of Proposition 7.17, printed p. 262: Adjoin X_u with X_u^p=u, using the polynomial X_u^p−u. Reason: The purpose is to make each unit p-divisible; adjoining a variable equal to u^p adds no p-th root of u.
- **E13**, BMS2, Proof of Proposition 7.17, printed p. 263: Complete S^q p-adically at each simplicial degree. Reason: The cover argument requires a p-complete Čech diagram; completing only the original base leaves those terms unspecified.

## Separate tower continuation

The split proposal assigns all nine CMM §5.2 items to **RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses**. QT.0 owns upper-truncation definitions and controlled towers; QT.1 owns derived p-adic TC continuity; QT.2 owns derived/ordinary p-adic K continuity and the AMMN deformation input. QT.1 imports HP.1; QT.2 imports HP.5. The corrected finite-coefficient comparison and the bounded-p-torsion boundary are part of that assignment. This roadmap retains arbitrary-I F-finite continuity in HP.6. The proposal changes ownership only after the maintainer applies it.

## Routed item ledger

The 98 entries below account for all four briefs: 83 CMM henselian items, nine CMM tower items, four BMS2 items and two BS22 items. Multiple items can share a target. A supplier listed here remains subject to its explicit contract where applicable.

| Routed item | Disposition | Owner or target |
|---|---|---|
| `PAPER-CLAUSEN-MATHEW-MORROW-21/001` | imported | `RefinedTraceMethods:RT.3/cyclotomic-trace` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/005` | planned | `RefinedTraceMethodsPartII:HP.5/henselian-trace-rigidity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/006` | planned | `RefinedTraceMethodsPartII:HP.8/asymptotic-trace-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/007` | planned | `RefinedTraceMethodsPartII:HP.8/strict-henselian-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/008` | planned | `RefinedTraceMethodsPartII:HP.8/split-trace` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/009` | planned | `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/010` | planned | `RefinedTraceMethodsPartII:HP.7/relative-pro-geisser-levine` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/011` | planned | `RefinedTraceMethodsPartII:HP.6/k-adic-continuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/012` | planned | `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/017` | planned | `RefinedTraceMethodsPartII:HP.1/tc-connectivity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/018` | planned | `RefinedTraceMethodsPartII:HP.1/tc-connectivity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/019` | planned | `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/020` | planned | `RefinedTraceMethodsPartII:HP.1/connective-tower-limits` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/022` | planned | `RefinedTraceMethodsPartII:HP.1/trivial-hfp` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/023` | planned | `RefinedTraceMethodsPartII:HP.1/trivial-hfp` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/024` | planned | `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/025` | planned | `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/026` | planned | `RefinedTraceMethodsPartII:HP.1/hfp-module-fibre` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/027` | planned | `RefinedTraceMethodsPartII:HP.1/tc-mod-p-colimits` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/028` | planned | `RefinedTraceMethodsPartII:HP.1/orbit-approximation` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/029` | planned | `RefinedTraceMethodsPartII:HP.1/uniform-pro-zero` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/030` | planned | `RefinedTraceMethodsPartII:HP.1/uniform-pro-tc` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/035` | planned | `RefinedTraceMethodsPartII:HP.1/witt-tc-continuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/037` | planned | `RefinedTraceMethodsPartII:HP.1/strict-dieudonne-fixed-points` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/038` | planned | `RefinedTraceMethodsPartII:HP.0/augmented-equivalence` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/039` | planned | `RefinedTraceMethodsPartII:HP.0/local-nonunital`, `RefinedTraceMethodsPartII:HP.0/local-reflection` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/040` | planned | `RefinedTraceMethodsPartII:HP.0/henselian-nonunital` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/041` | planned | `RefinedTraceMethodsPartII:HP.0/henselian-reflection`, `RefinedTraceMethodsPartII:HP.0/henselian-permanence` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/042` | planned | `RefinedTraceMethodsPartII:HP.0/henselian-reflection` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/045` | planned | `RefinedTraceMethodsPartII:HP.0/ambient-independence` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/047` | planned | `RefinedTraceMethodsPartII:HP.0/henselized-milnor-squares` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/048` | planned | `RefinedTraceMethodsPartII:HP.0/henselized-milnor-squares` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/049` | planned | `RefinedTraceMethodsPartII:HP.0/rational-free-rescaling` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/050` | planned | `RefinedTraceMethodsPartII:HP.2/pseudocoherent-functor` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/051` | planned | `RefinedTraceMethodsPartII:HP.2/relative-pseudocoherence`, `RefinedTraceMethodsPartII:HP.2/pseudocoherence-recognition` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/053` | planned | `RefinedTraceMethodsPartII:HP.2/pseudocoherence-closure` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/054` | planned | `RefinedTraceMethodsPartII:HP.2/suspension-loop-goodwillie-tower` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/055` | planned | `RefinedTraceMethodsPartII:HP.2/goodwillie-recognition`, `RefinedTraceMethodsPartII:HP.2/integral-homology-recognition` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/056` | planned | `RefinedTraceMethodsPartII:HP.2/projective-pseudocoherence` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/057` | planned | `RefinedTraceMethodsPartII:HP.2/abelian-vanishing` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/058` | planned | `RefinedTraceMethodsPartII:HP.2/axiomatic-rigidity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/059` | planned | `RefinedTraceMethodsPartII:HP.2/free-simplicial-resolutions` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/060` | planned | `RefinedTraceMethodsPartII:HP.3/uniform-gl-stability` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/062` | planned | `RefinedTraceMethodsPartII:HP.3/gl-chains-pseudocoherent` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/063` | planned | `RefinedTraceMethodsPartII:HP.3/henselian-k-zero` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/065` | planned | `RefinedTraceMethodsPartII:HP.3/k-pseudocoherent` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/066` | planned | `RefinedTraceMethodsPartII:HP.3/eilenberg-maclane-pseudocoherent` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/067` | planned | `RefinedTraceMethodsPartII:HP.3/thh-pseudocoherent`, `RefinedTraceMethodsPartII:HP.3/tc-pseudocoherent` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/068` | planned | `RefinedTraceMethodsPartII:HP.4/cartier-defects` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/069` | planned | `RefinedTraceMethodsPartII:HP.4/etale-differentials` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/070` | planned | `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/071` | planned | `RefinedTraceMethodsPartII:HP.4/smooth-trace-defects` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/072` | planned | `RefinedTraceMethodsPartII:HP.4/cartier-henselian-rigidity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/073` | planned | `RefinedTraceMethodsPartII:HP.4/equal-characteristic-rigidity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/075` | planned | `RefinedTraceMethodsPartII:HP.5/nonunital-trace-fibre` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/077` | planned | `RefinedTraceMethodsPartII:HP.5/connective-henselian-excision` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/078` | planned | `RefinedTraceMethodsPartII:HP.5/integral-counterexample` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/079` | planned | `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity`, `RefinedTraceMethodsPartII:HP.6/k-adic-continuity`, `RefinedTraceMethodsPartII:HP.6/non-f-finite-discontinuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/082` | planned | `RefinedTraceMethodsPartII:HP.6/thh-derived-mod-p` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/083` | planned | `RefinedTraceMethodsPartII:HP.6/finite-thh-pro-base-change`, `RefinedTraceMethodsPartII:HP.6/thh-adic-continuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/084` | planned | `RefinedTraceMethodsPartII:HP.6/continuity-implies-rigidity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/086` | planned | `RefinedTraceMethodsPartII:HP.6/non-f-finite-discontinuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/087` | planned | `RefinedTraceMethodsPartII:HP.6/exterior-two-weight`, `RefinedTraceMethodsPartII:HP.6/non-f-finite-discontinuity` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/088` | imported | `GeneralAlgebraicKTheory:K.2:low-degree-comparisons` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/099` | planned | `RefinedTraceMethodsPartII:HP.7/relative-log-witt` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/100` | planned | `RefinedTraceMethodsPartII:HP.7/smooth-relative-mod-p` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/101` | planned | `RefinedTraceMethodsPartII:HP.7/relative-r-minus-f` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/103` | planned | `RefinedTraceMethodsPartII:HP.7/relative-pro-illusie` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/104` | planned | `RefinedTraceMethodsPartII:HP.7/diagonal-pro-hkr` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/105` | planned | `RefinedTraceMethodsPartII:HP.7/relative-pro-geisser-levine` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/106` | planned | `RefinedTraceMethodsPartII:HP.7/pro-geisser-levine` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/107` | planned | `RefinedTraceMethodsPartII:HP.7/milnor-symbols-and-lifting` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/108` | planned | `RefinedTraceMethodsPartII:HP.8/separably-closed-rigid-invariants` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/109` | planned | `RefinedTraceMethodsPartII:HP.8/characteristic-p-etale-sheaves`, `RefinedTraceMethodsPartII:HP.8/strict-henselian-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/110` | planned | `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/111` | planned | `RefinedTraceMethodsPartII:HP.8/proper-etale-comparison`, `SchemeAndStackFoundations:SF.2` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/114` | planned | `RefinedTraceMethodsPartII:HP.8/affine-p-cohomological-dimension` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/116` | planned | `RefinedTraceMethodsPartII:HP.8/asymptotic-trace-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/117` | planned | `DeformationAndDerivedPatchingAlgebra:R03.3/f-finite-rings`, `RefinedTraceMethodsPartII:HP.8/asymptotic-trace-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/118` | planned | `RefinedTraceMethodsPartII:HP.8/perfect-rings` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/119` | planned | `RefinedTraceMethodsPartII:HP.8/semiperfect-reduction` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/120` | planned | `RefinedTraceMethodsPartII:HP.8/valuation-ring-comparison` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/121` | planned | `RefinedTraceMethodsPartII:HP.8/explicit-witt-cokernel` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/089` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.2` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/090` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.1` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/091` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.0` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/092` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.0` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/093` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.1` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/094` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.1` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/095` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.1` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/096` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.2` |
| `PAPER-CLAUSEN-MATHEW-MORROW-21/097` | split | `RefinedTraceMethodsPartIIPadicDeformationOfKTheoryClasses:QT.2` |
| `PAPER-BHATT-MORROW-SCHOLZE-19/063` | planned | `RefinedTraceMethodsPartII:HP.8/semiperfect-reduction`, `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace` |
| `PAPER-BHATT-MORROW-SCHOLZE-19/115` | planned | `RefinedTraceMethodsPartII:HP.9/w-local-low-k`, `PrismaticCohomology:PR.4/syntomic-low-weights` |
| `PAPER-BHATT-MORROW-SCHOLZE-19/066` | planned | `RefinedTraceMethodsPartII:HP.9/w-local-low-k`, `PrismaticCohomology:PR.4/syntomic-low-weights` |
| `PAPER-BHATT-MORROW-SCHOLZE-19/089` | planned | `RefinedTraceMethodsPartII:HP.9/crystalline-eigenspace-k` |
| `PAPER-BHATT-SCHOLZE-22/70b` | planned | `RefinedTraceMethodsPartII:HP.9/quasisyntomic-evenness`, `RefinedTraceMethodsPartII:HP.9/rooted-regular-quotients` |
| `PAPER-BHATT-SCHOLZE-22/95b` | planned | `RefinedTraceMethodsPartII:HP.8/semiperfect-reduction`, `RefinedTraceMethodsPartII:HP.9/quasiregular-semiperfectoid-trace` |

## Suggested-file boundary and completion checks

The suggested Lean file uses the pinned nonunital carriers, unitization, polynomials and henselian-pair predicate to state a small selection of HP.0 interfaces and examples. Its definitions have actual bodies. Spectrum, functor-category, Witt-complex and quasisyntomic targets remain fully specified in this document because their carriers are supplied by other roadmaps and are absent at the pins. The file is an interface sketch, not a development of those theories.

All ten stages are planned. Every definition/construction has uses, a named API and at least three discriminating unit tests. Every node has an exact statement, proof route, dependencies and acceptance checks. The packet is complete with open supplier requests; independent review and supplier resolution precede implementation.
