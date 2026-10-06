# Modular forms — Hecke theory, newforms, and L-functions, Part II: Geometric reduction, Serre weights and eigenvalue lifting

This roadmap begins after [ModularForms](../../../content/tau-ceti/ModularForms/README.md). That upstream roadmap owns analytic modular forms in every integer weight, the Hecke action, normalized eigenforms and primitive associates, the integral Hecke algebra and coefficient fields. This Part II constructs geometric section spaces, compares their integral reductions, defines Serre’s extension-sensitive local weight, and applies the Deligne–Serre eigenvalue-lifting lemma. The final layer defines residual modularity with a coefficient place and states the prescribed-weight-and-level target. It does not prove Serre’s conjecture or minimize an existing modularity witness; those are the responsibilities of ClassicalSerreModularity and SerreWeightAndLevelOptimisation.

The ownership follows the accepted RS-06 result and its latest independent review, `independent-review-REV-FIX-RT-RS-06`. The stable roadmap identifier remains `AlgebraicModularFormsAndSerreWeights`; the Part II title describes its mathematical boundary. Stable inherited node identifiers are retained when their role changes from a construction to an imported comparison.

The [packet](../packets/AlgebraicModularFormsAndSerreWeights.json) is a plan of 63 nodes: 6 definitions, 14 constructions, 16 theorems, 9 lemmas, 12 comparisons and 6 applications. Its 20 definition/construction nodes have 67 API items and 61 unit tests. The 21 planets select central definitions and theorems, at most six per stage. All six stages are **planned**; none is **closed**. “Complete” is the planning status of protocol §0: every target has a chain to a verified baseline declaration, an owned supplier node/requested stage, or one of the nine recorded gaps. It does not mean that those gaps have been filled or that any node has been implemented. Every implementation status remains unchecked.

## Conventions and boundaries

A geometric modular form of integer weight k is a section of the imported Hodge line power ωᵏ on the compactified moduli problem. Negative powers use the dual line. A cusp form is a section of ωᵏ(−C), where C is the entire reduced cusp divisor. An arbitrary coefficient module K means sections of ωᵏ⊗K over the integral base; a base algebra A also permits the equivalent pullback convention on X_A. Their equivalence uses the projection formula. A coefficient map is always defined; an isomorphism after changing coefficients needs a base-change theorem.

At levels 1 and 2, and at other levels with stabilizers, use the stack or rigidifying descent presentation. At characteristic different from 2 the central −1 stabilizer kills odd weights at levels 1 and 2. Forgetting it on the coarse j-line changes the space. Fine full-level statements require n≥3 and n invertible, while fine Γ₁(N) statements here use the exact source’s range, such as N≥5 in CG18. Those are distinct hypotheses.

The Tate parameter q is fixed by Tate(q) and its canonical differential. On a full-level cusp chart Tate(tⁿ), q=tⁿ, the logarithmic Kodaira–Spencer map sends ω_can² to n dt/t and theta acts on tⁱ by (i/n)tⁱ. The familiar coefficient formula θ(Σa_mqᵐ)=Σm a_mqᵐ uses the usual integral-exponent q expansion. CDT25 instead uses q=e^{πiτ}; there Δ begins with q². Each local statement retains its own parameter rather than silently identifying these variables.

Hecke operators use the arithmetic normalization of the upstream roadmap. In Katz’s moduli definition the new level structure is π(α_n), not α_n∘π̌. Their difference is a diamond twist. In CG18, xT_x is trace composed with the isogeny Hodge pullback and the second degeneracy pullback; x is invertible in the coefficient base. The curve map w_x and the cohomology operator W_x differ: w_x²=⟨x⟩, while W_x²=xⁿ⟨x⟩ in Hodge weight n, including negative weights. Boundary Hecke action is computed at all cusps. The scalar statement from CG18 Remark 3.4 has its nonzero mod-p common-eigensystem hypotheses; it is not a scalar formula on arbitrary single-cusp vectors.

The coefficient-linear V sends Σa_nqⁿ to Σa_nq^{pn}; absolute pth power sends its coefficients to a_nᵖ as well. The formal U selects a_{pn}. UV=id for p>0, but a formal-series formula alone does not construct a modular-form operator in every weight. In characteristic p, T_p=U in weight at least two and T_p=U+⟨p⟩V in weight one. With O/varpiᵐ coefficients, the high-weight formula still contains p^{k−1}⟨p⟩V until that scalar vanishes; high weight and cyclotomic congruences must be chosen explicitly.

Serre’s classical weight is a function of the actual local representation, including its extension class, not a function of its semisimplification alone and not a definition by the existence of a modular form. Niveau-one tame exponents have range 0≤a≤b≤p−2; niveau-two exponents have range 0≤a<b≤p−1. In the wild branch, alpha is the quotient exponent and beta is the exponent on V^{I_p}; the ordered ranges are 0≤alpha≤p−2 and 1≤beta≤p−1. At p=2, a très-ramifiée extension has classical weight 4. Edixhoven’s local function gives 3 in that case and gives weight 1 in the unramified case, whereas Serre gives p. The two functions are not interchangeable.

A reduced classical cusp space is the **image** of the integral lattice quotient in the Katz section space. It is not defined to be the whole Katz space. For example, at p=2, AΔ is a nonzero Katz cusp form of level one and weight 13, while the characteristic-zero odd-weight space is zero. The Deligne–Serre lemma takes an eigenvector in an actual finite-free lattice reduction. It lifts its eigenvalues after a finite extension and a dominating DVR; it does not lift that prescribed eigenvector. A full-eigenform or primitive-newform conclusion additionally uses the full Hecke family and the upstream old/new theorem with its precise level data.

Residual modularity retains the coefficient field, place over p, chosen coefficient embedding, stable lattice and semisimplification comparison over a common residue extension. Lattice independence is a Brauer–Nesbitt input. Different places can give different residual representations. R01.5 owns finite-field descent; the early R19 residual construction imports it directly, avoiding a dependency cycle through the late R15.6 modularity predicate.

## Imports and the dependency spine

| Supplier | Input used here | Consumer |
|---|---|---|
| ModularForms Layers 0 and 10C | All-integer-weight analytic forms, automorphy lines, stabilizers and analytic section spaces | R15.1 comparison |
| ModularForms Layers 2, 4, 8, 8G and 8W | Arithmetic Hecke action, full eigenforms/primitive associates, integral lattices and coefficient fields | R15.2 and R15.5 |
| ModularCurvesPartII R12.5, R13.2–R13.5, R14.1 | Hodge line, compactification, Tate cusp charts, rigidifying descent, Igusa tower, isogeny correspondences, traces and the existing root-dependent curve map w_ζ | R15.1–R15.3 |
| SchemeAndStackFoundations SF.2–SF.3 | Proper adjunction/trace and the requested relative curve Serre-duality specialization over a DVR with K/O coefficients | R15.3 twisted duality |
| ComplexComparisonPartII C2 | Projective coherent GAGA compatible with finite actions | R15.1 |
| AbelianSchemesAndArithmeticModuli A4; AutomorphicBundles B3 | De Rham bundle, Hodge filtration, connection, cup product and canonical logarithmic extension | R15.1 Kodaira–Spencer and R15.3 theta |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.2, R07.3, R07.5 | Raynaud models, BT₁ Hasse invariant, Fontaine–Laffaille functor and local extension-sensitive finite-flat inputs | R15.3–R15.4 |
| ArithmeticGaloisRepresentations R01.2–R01.5 | Tame characters, conductor, bad-dihedral image input, semisimplification and coefficient descent | R15.4 and R15.6 |
| EllipticCurves Layers 3 and 4 | Relative Frobenius/Verschiebung, Tate torsion sequence and multiplicative extension class | R15.3–R15.4 applications |
| AutomorphicGaloisRepresentations R19.1 | Attached representation, stable lattice and good-prime characteristic polynomials | R15.6 |

R15.1 builds section spaces from those geometric inputs and proves the logarithmic Kodaira–Spencer identification, retaining (det D)⁻¹ until the elliptic cup-product trivialization is applied. R15.2 establishes q-expansion, finiteness, lattice and coefficient-module Hecke interfaces. R15.3 derives Hasse/theta operations, explicit cycle tables, weight reduction and the weight-one torsion operator. R15.4 applies the separately owned local representation theory to the full classical recipe. R15.5’s abstract algebraic lifting proof is independent of R15.4 and R19; its modular-form application uses R15.2’s lattice. R15.6 packages the resulting modularity witness after attachment is available.

## Suggested signatures and their limits

The [suggested file](../suggested/AlgebraicModularFormsAndSerreWeights.lean) contains the API names and named test comments followed by examples. Its algebraic Deligne–Serre core uses actual algebra homomorphisms, tensor products, ideals, intermediate fields and valuation subrings. The geometric templates use actual module-presheaf evaluations and linear maps. Its local arithmetic recipe is executable on normalized classified data; the map from a local Galois representation to those data remains a supplier obligation. The witness structure contains genuine fields, DVRs, coefficient maps and rank-two matrix representations.

Where a compactified moduli stack, Hodge power, logarithmic connection, local Galois classification or attached-representation condition cannot be expressed at the baseline, the file states that exact omission beside the signature. Several tests therefore display only their expressible coefficient, invariant-subspace or arithmetic fragment. They do not replace the full mathematical tests below. A geometric template with omitted conditions is not asserted for arbitrary modules or arbitrary coefficient sequences; a witness’s data-only template is not a certificate of modularity until the listed attachment and semisimplification identities are inserted. There are no arbitrary Prop fields standing for missing conditions and no proposition definitions filled by an admitted placeholder.

The file was not compiled in this session. The existing shared build has the pinned Mathlib revision but a different Tau Ceti revision, and WORKERS.md forbids compiling against a mismatched build or constructing another one. All signatures, including new imports and dependent structure fields, require elaboration when an exact pinned build is available.

## Stage plans


## R15.1. Geometric forms and comparison

Coverage: **planned**. Remaining closure: Supply the imported stack/logarithmic carriers and express their full suggested signatures; verify the projective GAGA descent interface.

Planets: Katz modular forms, Geometric cusp forms, Logarithmic Kodaira–Spencer isomorphism.

<a id="R15-1-hodge-bundle-with-tate-curve-normalization"></a>

### Geometric modular forms in every integral weight

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/hodge-bundle-with-tate-curve-normalization`. Kind: **construction**.

Import the compactified moduli stack X, its Hodge line ω and reduced cusp divisor C from ModularCurvesPartII. For a base algebra A and k ∈ ℤ define M_k(X_A)=H⁰(X_A,ω_A^k), using the dual line for negative powers. For a coefficient module K over the integral base define M_k(K)=H⁰(X,ω^k⊗K). These two coefficient conventions agree for algebras through pullback and the affine projection formula. The full-level fine scheme construction requires n≥3 and n invertible; the stack or its descent presentation gives Γ₁(N) and small levels. Tate evaluation uses ω_can and the chosen cusp parameter. No descent of ω itself to the coarse j-line is asserted.

**Hypotheses and conventions.**

1. The imported line and cusp divisor are on the actual compactified moduli family
2. Integral weights, including zero and negative weights
3. Level invertible on the base for the smooth models in this packet

**API.**

- `TauCeti.KatzModularForms.forms` (constructor): M_k(K)=H⁰(X,ω^k⊗K), with ω supplied by the modular-curve owner.
- `TauCeti.KatzModularForms.forms_add` (structure): M_k(K) has its section-module structure; restriction and coefficient maps are linear.
- `TauCeti.KatzModularForms.forms_ext` (extensionality): Two forms are equal when their sections agree on a cover of the moduli stack.

**Unit tests.**

- `TauCeti.KatzModularForms.forms_weight_zero` — degenerate: On a geometrically connected compactified modular curve over an algebraically closed field, weight-zero forms are precisely constants.
- `TauCeti.KatzModularForms.forms_negative` — degenerate: Over an algebraically closed field of characteristic prime to the level, M_k=0 for k<0.
- `TauCeti.KatzModularForms.forms_odd_low_level` — non-example: At level 1 or 2 with 2 invertible, odd-weight forms vanish because −1 acts as (−1)^k on the Hodge power.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem: forms are sections of ω^{⊗k} on M̄_n and have q-expansions at the cusps
2. AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one: A is a section of ω^{⊗(p−1)}

**Prerequisites.**

- `ModularCurvesPartII:R12.5`
- `ModularCurvesPartII:R13.3`
- `ModularCurvesPartII:R13.4a`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Katz.lean`
- namespace: `TauCeti.KatzModularForms`

**Proof plan.**

1. Use the imported Hodge line; form positive tensor powers and negative dual powers.
2. Take global sections of the tensor sheaf; use descent for a stack presentation.
3. Pull the section to the Tate formal chart and divide by ω_can^k to obtain its expansion.

**Acceptance checks.**

1. Check that the section of omega^{tensor 2} corresponding to dq/q on Tate(q^n) is n^{-1} times the square of the canonical differential, so that the normalization constant n appears where it must in the comparison with Omega^1(log)
2. Check the sheaf condition at a cusp by verifying that a section with q-expansion in q Z[1/n, zeta_n][[q]] is the same thing as a section of omega^{tensor k} vanishing along that cusp

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “There is a unique invertible sheaf”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4. Quotation: “By a modular form of type”. The displayed definition uses the compactified algebraic stack; Greek notation and spacing are rendered from the DVI. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-1-level-one-and-two-by-descent-with-explicit-inverted-primes"></a>

### Level one and level two forms as invariants of a rigidifying cover, with the primes that must be inverted

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/level-one-and-two-by-descent-with-explicit-inverted-primes`. Kind: **construction**.

For n = 1, 2 the module S(K, n, k) of weight-k forms holomorphic at infinity with coefficients in a Z[1/n]-module K is defined not as sections over a coarse space but by descent from the rigid levels (Katz 1.9): for n = 2 as the subgroup of H^0(Mbar_4, omega^{tensor k} tensor_{Z[1/4]} K) invariant under the matrices of GL_2(Z/4Z) that are congruent to 1 mod 2, and for n = 1 as the fibre product of the level-3 and level-4 modules over the level-12 module. Base change then holds in the form: Thm 1.8.1, for every ring R_0 in which 2 is invertible and every k >= 1, the canonical map S(Z,2,k) tensor_Z R_0 -> S(R_0,2,k) is an isomorphism (printed with S(Z,2,k); since level-2 forms live over Z[1/2] this is read as S(Z[1/2],2,k)); Thm 1.8.2, for every ring R_0 in which 2 and 3 are invertible and every k >= 1, the canonical map S(Z,1,k) tensor_Z R_0 -> S(R_0,1,k) is an isomorphism, the proof passing through the intermediate isomorphism S(Z[1/6],1,k) tensor_{Z[1/6]} R_0 -> S(R_0,1,k). Remark 1.8.2.2 states that Theorem 1.8.2 (level one) becomes false when 2 and 3 are not excluded; the source makes no corresponding failure statement for level two.

**Hypotheses and conventions.**

1. for level 2: 2 invertible in R_0; for level 1: 2 and 3 invertible in R_0
2. the descent uses that the relevant rigidifying groups (order 16 for the mod-2 congruence subgroup of GL_2(Z/4Z), 96 for GL_2(Z/4Z), 48 for GL_2(Z/3Z)) have order invertible after inverting 2 and 3, so an averaging projector exists
3. level-two forms of odd weight vanish because the automorphism -1 of an elliptic curve fixes the level-two structure
4. the base-change theorems 1.8.1–1.8.2 rest on the base-change theorem at the rigid levels, R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary, which is planned in the following stage

**API.**

- `TauCeti.KatzModularForms.formsLevelTwo` (constructor): S(K, 2, k) = the invariants in S(K, 4, k) of the matrices of GL₂(Z/4Z) congruent to 1 mod 2.
- `TauCeti.KatzModularForms.formsLevelOne` (constructor): S(K, 1, k) = the fibre product of S(K, 3, k) and S(K, 4, k) over S(K, 12, k).
- `TauCeti.KatzModularForms.formsLevelTwo_baseChange` (characterisation): S(Z[1/2], 2, k) ⊗ R₀ ≅ S(R₀, 2, k) when 2 ∈ R₀^× and k ≥ 1 (Theorem 1.8.1).
- `TauCeti.KatzModularForms.formsLevelOne_baseChange` (characterisation): S(Z, 1, k) ⊗ R₀ ≅ S(R₀, 1, k) when 2, 3 ∈ R₀^× and k ≥ 1 (Theorem 1.8.2).

**Unit tests.**

- `TauCeti.KatzModularForms.levelOne_E4` — computation: E₄ = 1 + 240∑σ₃(m)q^m lies in S(Z[1/6], 1, 4).
- `TauCeti.KatzModularForms.levelOne_baseChange_fails_at_2_3` — non-example: Remark 1.8.2.2: over F₂ or F₃ there are level-one forms that are not reductions of forms over Z (the Hasse invariant of weight 1 over F₂, weight 2 over F₃), so Theorem 1.8.2 fails without inverting 2 and 3.
- `TauCeti.KatzModularForms.levelOne_via_rigid` — compatibility: A level-one form is determined by its images at levels 3 and 4, which agree at level 12.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem: the level-1 and level-2 q-expansion principle (Corollary 1.9.1) tests at a single cusp
2. AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one: A is a level-one form, defined through these descents

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Katz.lean`
- namespace: `TauCeti.KatzModularForms`

**Proof plan.**

1. Katz Thm 1.8.1: level-two forms over R_0 containing 1/2 are exactly the level-four forms invariant under the mod-2 congruence subgroup of GL_2(Z/4Z); that group has order 16, a power of 2, so the averaging projector applies to the level-four base-change isomorphism of Thm 1.7.1.
2. Katz Thm 1.8.2: over a ring R_0 containing 1/6 the same projector argument (GL(2,Z/4Z) of order 96 = 32 x 3, GL(2,Z/3Z) of order 48 = 16 x 3) gives S(Z[1/6],1,k) tensor R_0 = S(R_0,1,k); the passage from Z[1/6] down to Z uses that for any ring R, S(R,1,k) is the fibre product of the diagram 1.8.2.1 (a level-3 form over R[1/3] and a level-4 form over R[1/2] inducing the same level-12 form over R[1/12]) and that this diagram and its fibre product commute with the flat extension Z -> Z[1/6].
3. Katz Remark 1.8.2.2 exhibits the failure without inverting 2 and 3: over F_p the Hasse invariant is a nonzero level-one form of weight p-1 holomorphic at infinity, while over Z there are no nonzero level-one forms of weight 1 or 2 holomorphic at infinity; likewise A.Delta is a level-one cusp form of weight 13 over F_2 (resp. 14 over F_3) which is not the reduction of a form over Z.

**Acceptance checks.**

1. Verify that the Hasse invariant in weight p-1 for p = 2, 3 is a counterexample to level-one base change from Z (Remark 1.8.2.2), so that no argument in the roadmap silently descends omega^{tensor k} to the coarse j-line at those primes
2. Verify that S(R_0, 2, k) = 0 for odd k when 2 is invertible in R_0

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.8.1 and its proof, printed pp. 85-86 (Ka-17/18). Quotation: “Let R”. Level-two base change with the exact hypothesis that 2 is invertible; OCR prints 'k >= 1' as 'k > i'.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark 1.8.2.2, printed p. 86 (Ka-18). Quotation: “The above theorem becomes”. Explicit failure of level-one base change at p = 2 and p = 3, which is the source basis for treating small levels by descent rather than on the coarse curve.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.8.2 and its proof, printed pp. 86-87 (Ka-18/19). Quotation: “Let R”. Checked on the page image: the level-one theorem is stated over Z, not only over Z[1/6]. Added by the reviewer.


<a id="R15-1-cusp-ideal-section-forms"></a>

### Geometric cusp forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/cusp-ideal-section-forms`. Kind: **definition**.

Define S_k(X_A)=H⁰(X_A,ω_A^k⊗I_C), where I_C=O_X(−C) is the imported cusp ideal. It embeds in M_k(X_A) and equals the kernel of restriction to C. This kernel statement uses the exact sheaf sequence and left exactness of H⁰, and does not assert surjectivity of cusp evaluation.

**API.**

- `TauCeti.KatzModularForms.cuspForms` (constructor): S_k=H⁰(ω^k(−C)).
- `TauCeti.KatzModularForms.cuspForms_inclusion` (coercion): The cusp ideal inclusion induces an injective linear map S_k→M_k.
- `TauCeti.KatzModularForms.cuspForms_iff` (characterisation): A form is cuspidal iff its restriction to the entire cusp divisor is zero.

**Unit tests.**

- `TauCeti.KatzModularForms.cuspForms_weight_zero` — degenerate: S_0=0 on a connected proper geometric curve with a nonempty cusp divisor.
- `TauCeti.KatzModularForms.delta_section` — computation: At level 1, Δ is a weight-12 cusp form with leading coefficient 1 and order one at the cusp.
- `TauCeti.KatzModularForms.eisenstein_not_cuspidal` — non-example: E₄ at level 1 has constant term 1, so is not a cusp form over ℂ.

**Uses deriving the interface.**

1. R15.5: Provides the cuspidal integral module for lifting
2. CG18 §3.2.3: Defines the cusp-twisted cohomology

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- `ModularCurvesPartII:R13.3`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R151.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Tensor the imported cusp sequence by the invertible line.
2. Apply H⁰; its left exactness identifies the image with the kernel.

**Acceptance checks.**

1. Vanishing means zero constant term at every cusp, in its own local parameter.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “There is a unique invertible sheaf”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4. Quotation: “By a modular form of type”. The displayed definition uses the compactified algebraic stack; Greek notation and spacing are rendered from the DVI. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-1-coefficient-maps"></a>

### Coefficient maps of geometric forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/coefficient-maps`. Kind: **construction**.

For a linear coefficient map u:K→L define M_k(u) by H⁰(id_{ω^k}⊗u), and the same map on cusp forms. For a base algebra A→B define B⊗_A M_k(X_A)→M_k(X_B) by pullback and multiplication. These are canonical maps; their invertibility requires R15.2 base-change hypotheses.

**API.**

- `TauCeti.KatzModularForms.coefficientMap` (constructor): The map on sections induced by a linear coefficient map.
- `TauCeti.KatzModularForms.coefficientMap_id` (functoriality): M_k(id)=id.
- `TauCeti.KatzModularForms.coefficientMap_comp` (functoriality): M_k(v∘u)=M_k(v)∘M_k(u).

**Unit tests.**

- `TauCeti.KatzModularForms.coefficientMap_zero` — degenerate: The zero coefficient map induces the zero map.
- `TauCeti.KatzModularForms.coefficientMap_tate` — compatibility: Every q coefficient is sent by the coefficient map.
- `TauCeti.KatzModularForms.coefficientMap_not_always_iso` — non-example: Reduction at level 1 from ℤ to F₂ is not surjective in weight 1; the Hasse invariant has no lift.

**Uses deriving the interface.**

1. R15.2: Distinguishes a canonical reduction map from its image
2. R15.5: Compares lifted and residual eigenvalues

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Geometric cusp forms](#R15-1-cusp-ideal-section-forms)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R151.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Apply the tensor functor to u and then H⁰.
2. For algebra maps pull sections back along X_B→X_A.

**Acceptance checks.**

1. Identity and composition maps agree without any flatness assumption.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “There is a unique invertible sheaf”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.


<a id="R15-1-all-weight-analytic-comparison"></a>

### All-weight analytic comparison

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/all-weight-analytic-comparison`. Kind: **comparison**.

For a congruence subgroup Γ coming from the imported moduli problem and every k∈ℤ, complex analytification identifies M_k(X_ℂ) with the existing analytic modular forms of weight k and S_k with analytic cusp forms. On a rigidified cover this is the uniformization identification of ω^k with the weight-k automorphy line, followed by projective coherent GAGA and equivariant descent. Γ₀(N) with character ε is the ε-eigenspace of the Γ₁(N) diamond action. At levels 1 and 2, retain the stabilizer action: odd k gives zero over ℂ. Negative weights vanish; weight zero has constants and no cusp forms.

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Geometric cusp forms](#R15-1-cusp-ideal-section-forms)
- `ComplexComparisonPartII:C2`
- `ModularCurvesPartII:R12.5`
- `tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`
- `tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R151.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Identify the automorphy factor using the analytic family of elliptic curves and the transformation of dz.
2. Apply the supplier projective GAGA theorem to each Hodge power and its cusp twist on a fine cover.
3. Transport the descent equalizer and character eigenspaces; identify Tate and Fourier expansions.

**Acceptance checks.**

1. The image of Δ has q∏(1−q^m)^24, and E₄ has constant term 1.
2. No positive-weight hypothesis in the comparison; k=0 and k<0 are explicit.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “There is a unique invertible sheaf”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4. Quotation: “By a modular form of type”. The displayed definition uses the compactified algebraic stack; Greek notation and spacing are rendered from the DVI. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-1-logarithmic-kodaira-spencer"></a>

### Logarithmic Kodaira–Spencer isomorphism

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.1/logarithmic-kodaira-spencer`. Kind: **theorem**.

Let D be the canonical logarithmic extension of the universal rank-two de Rham bundle, with Hodge line ω and connection ∇. The composite ω→D→D⊗Ω¹_X(log C)→(D/ω)⊗Ω¹_X(log C) is O_X-linear and is an isomorphism. Thus Ω¹_X(log C)≅(det D)^−1⊗ω². With the elliptic cup-product determinant trivialization this is ω²≅Ω¹_X(log C). On the Tate(q^n) full-level cusp chart with parameter q it sends ω_can² to n dq/q. For an isogeny φ:E→E′, KS_E∘(φ*)^{⊗2}=(deg φ) KS_E′ after pullback to the isogeny base. These maps commute with level change.

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- `AbelianSchemesAndArithmeticModuli:A4`
- `AutomorphicBundles:B3`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R151.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Leibniz terms for multiplying a Hodge section die in the quotient D/ω, proving linearity.
2. Apply the universal deformation interpretation of Kodaira–Spencer on the open moduli stack.
3. Compute at Tate(q^n): the factor n identifies its extension across the cusp as an isomorphism.
4. Use cup-product functoriality and φ^tφ=[deg φ] for the isogeny relation.

**Acceptance checks.**

1. The untrivialized determinant factor must be retained on a general rank-two bundle.
2. Weight-2 cusp forms identify with regular differentials after the elliptic determinant trivialization.

**Source passages.**


- [On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1), 4.1.2, preprint p.34. Quotation: “Everything here is compatible under varying”. Kodaira–Spencer is the composite of the Hodge inclusion, logarithmic connection and quotient; level compatibility follows in this passage.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), A1.3.17–A1.3.18, printed p.169 (Ka-101), and 1.5, pp.82–83. Quotation: “Kodaira-Spencer”. Katz fixes the elliptic trivialization and Tate normalization; Appendix A constructs the map.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Lemma 7.4, author DVI p.25. Quotation: “One uses the formula for the Kodaira-Spencer map”. Proves isogeny compatibility from Gauss–Manin and the cup product; spacing normalized from DVI.


## R15.2. q-expansion and integral Hecke theory

Coverage: **planned**. Remaining closure: Close level-prime integral lattice/denominator comparison and the character-projector/cusp H¹ reduction criteria.

Planets: q-expansion principle, Integral modular-form lattice, Coherent Hecke action, Geometric Fricke map.

<a id="R15-2-q-expansion-principle-and-its-vanishing-theorem"></a>

### The q-expansion principle at level n >= 3 and its underlying vanishing theorem

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/q-expansion-principle-and-its-vanishing-theorem`. Kind: **theorem**.

Let n >= 3, K a Z[1/n]-module, and f a modular form of level n and weight k holomorphic at infinity with coefficients in K. (Vanishing) If on each of the phi(n) connected components of Mbar_n tensor_{Z[1/n]} Z[1/n, zeta_n] there is at least one cusp at which the q-expansion of f vanishes identically, then f = 0. (q-expansion principle) If L is a Z[1/n]-submodule of K and on each of those phi(n) components there is at least one cusp at which all q-coefficients of f lie in L tensor_{Z[1/n]} Z[1/n, zeta_n], then f is a modular form with coefficients in L. For n = 1, 2 the same conclusion holds after testing at a single cusp (one cusp when n = 1, one of the three cusps when n = 2).

**Hypotheses and conventions.**

1. n >= 3 for the stated component-wise form; n = 1 or 2 for Cor. 1.9.1, where the modules S(K, n, k) are the descent-theoretic ones
2. K is a Z[1/n]-module and L a Z[1/n]-submodule; no flatness or finiteness on K is assumed
3. the test cusps must meet every one of the phi(n) geometric connected components of Mbar_n over Z[1/n, zeta_n]; a single cusp does not suffice at level n >= 3

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions: Hecke operators are defined over any coefficient module through q-expansions
2. AutomorphicGaloisRepresentations R19.1: integral de Rham lattices of modular forms (Diamond–Flach–Guo Lemma 4.12)

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Level one and level two forms as invariants of a rigidifying cover, with the primes that must be inverted](#R15-1-level-one-and-two-by-descent-with-explicit-inverted-primes)

**Proof plan.**

1. Katz derives Cor. 1.6.2 from Thm 1.6.1 by applying the latter to the image of f in (K/L) tensor omega^{tensor k}, using the cohomology sequence attached to 0 -> L -> K -> K/L -> 0 and the sheaf sequence 1.6.2.1.
2. Proof of Theorem 1.6.1 (pp. 84-85): replacing K by the ring of dual numbers D(K) = Z[1/n] + K reduces to K a Z[1/n]-algebra; commutation of quasi-coherent cohomology with inductive limits reduces to K finitely generated, then noetherian local; faithful flatness of completion reduces to K complete noetherian local, and Grothendieck's comparison theorem to K artin local. By Krull's intersection theorem f vanishes on an open neighbourhood of a test cusp on each connected component of Mbar_n tensor K tensor Z[1/n, zeta_n], hence on an open dense set. If f were nonzero it would be supported on a closed set Z containing no maximal point; at a maximal point z of Z every element of the maximal ideal is a zero-divisor, so z has depth zero, contradicting that Mbar_n tensor K, smooth over the artin ring K, is Cohen-Macaulay and only its maximal points have depth zero. Imported standard results: Grothendieck comparison (formal functions), Krull intersection theorem, depth of Cohen-Macaulay schemes.
3. Cor. 1.9.1 transports the statement to levels 1 and 2 through the descent/fibre-product definitions 1.9.0.0 and 1.9.0.1.

**Acceptance checks.**

1. Exhibit a nonzero level-n form whose q-expansion vanishes at one cusp but not on all phi(n) components, showing that the component hypothesis is not removable
2. Check the integrality direction: a form over Q whose q-expansion at the tested cusps lies in Z[1/n, zeta_n] is a form over Z[1/n]

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.6.1 and Corollary 1.6.2, printed pp. 83-84 (Ka-15/16). Quotation: “vanishes identically”. The literal hypothesis 'on each of the phi(n) connected components ... at least one cusp' that this node retains.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.9.1, printed p. 88 (Ka-20). Quotation: “there are three”. The level 1 and 2 form of the principle, where a single cusp suffices.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Proof of Theorem 1.6.1, printed pp. 84-85 (Ka-16/17). Quotation: “it is Cohen-Macaulay”. The depth argument that completes the vanishing proof, now recorded in the proof steps. Added by the reviewer.


<a id="R15-2-strong-q-expansion-principle-with-its-divisibility-hypothesis"></a>

### Strong q-expansion principle: finitely many coefficients may be ignored, at the cost of a hypothesis on multiplication by p for (p-1) | k

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/strong-q-expansion-principle-with-its-divisibility-hypothesis`. Kind: **theorem**.

Let n, k >= 1 and let K be a Z[1/n]-module such that for every prime p with (p-1) | k multiplication by p is injective on K. If f is a modular form of level n and weight k holomorphic at infinity with coefficients in K and all its q-expansions are polynomials in q, then f = 0. Consequently (strong q-expansion principle), with a = product of the primes p such that (p-1) | k, K a Z[1/an]-module and L a Z[1/an]-submodule, if at each cusp all but finitely many q-expansion coefficients of f lie in L tensor Z[1/n, zeta_n], then f is a modular form with coefficients in L. The proof admits Result 1.12.0 (a special case of Swinnerton-Dyer's structure theorem, proved in Katz 4.4.1): if K is a field of characteristic p not dividing n, f has level n >= 1 and weight k >= 1, (p-1) does not divide k, and all q-expansions of f at the cusps of Mbar_n tensor K(zeta_n) are constants, then f = 0.

**Hypotheses and conventions.**

1. the divisibility hypothesis is indexed by the weight: only the primes p with (p-1) | k are constrained, and for the corollary those primes are inverted
2. the conclusion of Thm 1.12.1 concerns forms whose q-expansions at every cusp are polynomials, not merely bounded
3. the proof reduces to n >= 3 via the level 1 and 2 descriptions 1.9.0.0/1.9.1.1, then to artin local K, then to K a field
4. Result 1.12.0 is admitted, not proved, in 1.12 (its proof is in 4.4.1); as printed its hypothesis 'characteristic p, p-1 does not divide k' does not literally cover a field of characteristic 0, which the field case of the induction also needs (reviewer observation)

**Prerequisites.**

- [The q-expansion principle at level n >= 3 and its underlying vanishing theorem](#R15-2-q-expansion-principle-and-its-vanishing-theorem)

**Proof plan.**

1. Katz reduces to n >= 3, then replaces K by K[1/a] (legitimate because K -> K[1/a] is injective by hypothesis) and views f as a form of level a n.
2. He then reduces to K artin local by a filtration argument and induces on the length, the base case being K a field.
3. Over a field one takes a basis f_1, ..., f_r of the finite-dimensional space of such forms, lets N be the maximal degree of their polynomial q-expansions, chooses a prime l not dividing n with l > N, and uses stability of the space under T_l (1.11) to write T_l(F) = C.F for the column F = (f_i); comparing coefficients of q^i in (A_{il} + l^{k-1} A_{i/l}) = C A_i gives A_i = 0 for i >= 1 because il > N and il^2 > N, so every q-expansion is constant, and Result 1.12.0 gives f_i = 0. The artin-local case follows by induction on the nilpotence of the maximal ideal using the cohomology sequence 1.6.2.2.
4. Cor. 1.12.2 follows by applying the theorem to the image of f in K/L.

**Acceptance checks.**

1. Check that for k with (p-1) | k and K = Z/p the conclusion fails, so the hypothesis on multiplication by p is used and not cosmetic
2. Check the corollary on a concrete eigenform whose first few coefficients are not integral but whose tail is

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.12.1, printed p. 94 (Ka-26). Quotation: “are polynomials in”. The literal divisibility hypothesis '(p-1) | k' (printed 'p-!Ik') retained in the statement.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.12.2, printed p. 95 (Ka-27). Quotation: “Strong q-expansion principle”. Literal statement of the corollary with the ring Z[1/an] in which the primes p with (p-1)|k have been inverted.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.12, Result 1.12.0, printed p. 93 (Ka-25) and p. 94 (Ka-26). Quotation: “are constants”. The theorem depends on an admitted result whose proof lies outside the sections read. Added by the reviewer.


<a id="R15-2-base-change-for-spaces-of-forms-and-the-weight-one-boundary"></a>

### Base change for spaces of modular forms, and the unresolved weight-one case for n >= 12

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/base-change-for-spaces-of-forms-and-the-weight-one-boundary`. Kind: **theorem**.

Let n >= 3 and suppose either k >= 2, or k = 1 and n <= 11. Then for any Z[1/n]-module K the canonical map K tensor H^0(Mbar_n, omega^{tensor k}) -> H^0(Mbar_n, K tensor omega^{tensor k}) is an isomorphism. The proof is by H^1(Mbar_n, omega^{tensor k}) = 0, which follows from Riemann-Roch once deg(omega^{tensor k}) > 2g-2 on each geometric component, using omega^{tensor 2} = Omega^1(log cusps) and the fact that each component of Mbar_n tensor Z[1/n, zeta_n] contains a cusp. By the Remark after the theorem, for n >= 12 the sheaf omega has degree <= 2g-2 on each component, with equality only for n = 12, and Katz does not know whether formation of weight-one forms of level n >= 12 commutes with base change (the printed inequality is 'n >= 12', checked on the page image; the text layer reads 'n > 12').

**Hypotheses and conventions.**

1. n >= 3, so that Mbar_n is a scheme and the universal curve exists
2. k >= 2, or k = 1 with 3 <= n <= 11; the weight-one case with n >= 12 (including n = 12) is not covered
3. the vanishing argument needs each connected component of Mbar_n tensor Z[1/n, zeta_n] to contain at least one cusp

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)

**Proof plan.**

1. Katz Thm 1.7.1 reduces base change to H^1(Mbar_n, omega^{tensor k}) = 0 by the standard cohomology and base-change theorems.
2. For k >= 2 the isomorphism omega^{tensor 2} = Omega^1_{Z[1/n]}(log(cusps)) plus the presence of a cusp on each component gives deg(omega^{tensor k}) > 2g-2, hence the vanishing by Riemann-Roch.
3. For k = 1 and 3 <= n <= 11 the source asserts that 'explicit calculation shows' deg(omega) > 2g-2 on each component (the calculation is not displayed); for n >= 12 the Remark gives deg(omega) <= 2g-2 with equality only at n = 12, and the argument stops.
4. Katz's Remark after Thm 1.7.1 states the open case: weight one and level n >= 12.

**Acceptance checks.**

1. Check deg(omega) against 2g-2 on a component of Mbar_n for n = 11, 12, 13 and confirm that strict inequality holds for n = 11 and fails for n = 12 (equality) and n = 13 (strict reverse inequality)
2. Check, for every consumer that needs finite freeness of a module of forms, whether it actually uses this theorem; the Deligne-Serre application 6.10 works with classical forms on Gamma_0(N) with coefficients in O_lambda and does not cite it

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Theorem 1.7.1 and the following Remark, printed p. 85 (Ka-17). Quotation: “Theorem 1.7.1”. Literal hypotheses n >= 3 and (k >= 2 or (k = 1 and n <= 11)) retained in the node statement.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark following Theorem 1.7.1, printed p. 85 (Ka-17). Quotation: “The author does not know whether or not”. Records the exact boundary of the base-change theorem in weight one. The page image shows 'n >= 12' (underlined inequality); the drafter's excerpt 'n > 12' was an artefact of the text layer and was corrected by the reviewer.


<a id="R15-2-integral-hecke-operators-from-q-expansions"></a>

### Hecke operators defined over arbitrary coefficient modules by their q-expansion formula

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/integral-hecke-operators-from-q-expansions`. Kind: **construction**.

For a prime l not dividing n and invertible in the base ring R, Katz defines (1.11.0.2) (T_l f)(E/R, omega, alpha_n) = l^{k-1} times the sum over the l+1 subgroups H of order l of f(E_{R'}/H, pi-check^*(omega), pi(alpha_n)), using the level structure pi(alpha_n) with pi o alpha_n = pi(alpha_n) o pi (and explicitly not the other natural choice alpha_n o pi-check = l.pi(alpha_n)). If f(Tate(q^n), omega_can, alpha_n) = sum_i a_i(alpha_n) q^i, then (Formula 1.11.1) T_l f has q-expansion coefficients b_i(alpha_n) = l^{k-1} a_{i/l}(alpha_n') + a_{li}(alpha_n''), with a_{i/l} = 0 unless l | i, where alpha_n' is the unique level-n structure on Tate(q^n) with phi_l^*(alpha_n') = pi_l(alpha_n) (phi_l: q -> q^l, pi_l the projection Tate(q^n) -> Tate(q^n)/mu_l = Tate(q^{nl})) and alpha_n'' = i_l^*(pi_0(alpha_n)) is obtained from pi_0(alpha_n) on Tate(q^{n/l}) by the extension of scalars q^{1/l} -> q. T_l preserves holomorphy at infinity, cuspidality and polynomiality of q-expansions. For n >= 2 and k >= 2 (or 3 <= n <= 11 and k >= 1), for any prime l not dividing n and any Z[1/n]-module K, there is a unique endomorphism of the space of weight-k level-n forms holomorphic at infinity with coefficients in K realizing this formula. For k >= 2, level one and any prime l, there is a unique such endomorphism on level-one forms with coefficients in any Z-module K.

**Hypotheses and conventions.**

1. for Prop. 1.11.3: l prime with l not dividing n, and (n >= 2 with k >= 2) or (3 <= n <= 11 with k >= 1)
2. for Cor. 1.11.4: level one, k >= 2, and K an arbitrary Z-module - in particular l may divide the residue characteristic of K
3. existence over K is deduced from existence over Z[1/n] via base change, and descent of the operator from Z[1/n l] to Z[1/n] uses the q-expansion principle

**API.**

- `TauCeti.KatzModularForms.heckeT` (constructor): T_l for l ∤ n invertible in R, by (1.11.0.2): l^{k−1} ∑_H f(E/H, π̌^*ω, π(α_n)).
- `TauCeti.KatzModularForms.heckeT_qExpansion` (characterisation): b_i(α_n) = l^{k−1} a_{i/l}(α′_n) + a_{li}(α″_n) (Formula 1.11.1).
- `TauCeti.KatzModularForms.heckeT_integral` (characterisation): For k ≥ 2 (or 3 ≤ n ≤ 11, k ≥ 1) T_l is an endomorphism of forms with coefficients in any Z[1/n]-module K (Corollary 1.11.4).

**Unit tests.**

- `TauCeti.KatzModularForms.heckeT_delta` — computation: For Δ and l = 2: b₁ = a₂ = τ(2) = −24, so T₂Δ = −24Δ.
- `TauCeti.KatzModularForms.heckeT_other_normalisation` — non-example: Using the level structure α_n ∘ π̌ = l·π(α_n) instead of π(α_n) gives the operator twisted by the diamond operator ⟨l⟩, not T_l.
- `TauCeti.KatzModularForms.heckeT_level_divisible` — degenerate: For l | n the formula is not defined (l must be prime to the level); U_l is a different operator.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.2/generation-of-the-integral-hecke-algebra: the generators T_n and ⟨d⟩ of the Hecke algebra
2. AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation: T_l^*(θf) = l θ(T_l^* f)

**Prerequisites.**

- [The q-expansion principle at level n >= 3 and its underlying vanishing theorem](#R15-2-q-expansion-principle-and-its-vanishing-theorem)
- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- `ModularCurvesPartII:R14.1`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Katz.lean`
- namespace: `TauCeti.KatzModularForms`

**Proof plan.**

1. Katz computes the effect of the l-isogenies of the Tate curve on level structures and on omega_can (1.11.0.3 and 1.11.0.4: pi-check^*(omega_can) = omega_can on Tate(q^{nl}) for H = mu_l, and = l.omega_can for the subgroups H_i) and obtains Formula 1.11.1 with the modified level structures alpha_n' and alpha_n''.
2. Cor. 1.11.2 reads off preservation of holomorphy, cuspidality and polynomial q-expansions from the formula.
3. Prop. 1.11.3: by the base-changing theorem (1.7.1 for n >= 3; for n = 2 the level-two theorem 1.8.1 is the one available) one reduces to K = Z[1/n]; T_l exists a priori over Z[1/nl], but its q-expansions have coefficients in Z[1/n, zeta_n], so 1.6.2 and 1.9.1 place T_l f in forms over Z[1/n].
4. Cor. 1.11.4 handles level one by writing level-one forms as a fibre product over two coprime auxiliary levels n, m >= 3 both prime to l.

**Acceptance checks.**

1. Check that the term l^{k-1} a_{i/l} is evaluated at the modified level structure alpha_n' and the term a_{li} at alpha_n'', as in (1.11.1.2), and that with the other natural choice alpha_n o pi-check = l.pi(alpha_n) the formula would change by the action of l on level structures
2. Check that the mod p reduction of T_l for l = p agrees with Serre's U_p on q-expansions, using k >= 2

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Formula 1.11.1 (1.11.1.2), printed p. 92 (Ka-24). Quotation: “the convention that”. The literal q-expansion formula for T_l, transcribed from the page image (the text layer garbles the primes on alpha_n). The drafter's reading a_{i/l}(l alpha_n) + a_{li}(alpha_n) was corrected by the reviewer.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Corollary 1.11.4, printed p. 93 (Ka-25). Quotation: “Corollarg 1.11.4”. Integral Hecke operators on level-one forms with arbitrary Z-module coefficients, the form needed for reduction mod p; OCR prints 'k >= 2' as 'k > 2'.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.11.0.0-1.11.0.2, printed p. 90 (Ka-22). Quotation: “which we will not use”. Fixes which level structure enters the definition of T_l. Added by the reviewer.


<a id="R15-2-generation-of-the-integral-hecke-algebra"></a>

### Geometric identification of the integral Hecke algebra

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/generation-of-the-integral-hecke-algebra`. Kind: **comparison**.

Via the all-weight comparison and the integral q-expansion lattice comparison, the algebra of geometric Hecke operators on the finite integral lattice identifies with the integral analytic Hecke algebra already owned by ModularForms Layer 8 (and 8W in weight one). Its generators and finiteness are imported, including DDT Lemma 4.1 where that input is used. No second construction of the integral analytic algebra is made here.

**Hypotheses and conventions.**

1. (b) needs D odd or 2 ∈ R^×; the source attributes (a) to Diamond–Im, Proposition 3.5.1, and (b) to Wiles (Annals 1995), p. 491, neither of which was read
2. weight two and the groups Γ_H(N) only, as in the source

**Uses deriving the interface.**

1. AutomorphicGaloisRepresentations:R19.6/reduced-hecke-algebra-as-a-localisation: 𝕋_Σ contains κ(T_ℓ) when δ = 0 (Darmon–Diamond–Taylor Proposition 4.7)
2. AutomorphicGaloisRepresentations:R19.6/full-weight-two-hecke-algebra-and-its-galois-representations: the restriction to 𝕋^{(D)} in the oldform comparison

**Prerequisites.**

- [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison)
- [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image)
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

**Proof plan.**

1. Identify the lattices and check each geometric operator against the analytic normalization.
2. Apply the existing generation and finiteness theorems to this identified algebra.

**Acceptance checks.**

1. N = 11, Γ = Γ₀(11): S₂ is one-dimensional and 𝕋_ℤ = ℤ is generated by T₂ alone (T₂ acts by −2 on 11a1 and ℤ[−2] = ℤ).
2. For D = 2 and R = ℤ (2 not invertible, D even) part (b) does not apply: the generation by the T_n with n odd is not asserted.

**Source passages.**


- [Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf), §4.1, Lemma 4.1, p. 107 (revision of 9 September 2007). Quotation: “TR is generated as an R-algebra by either of the following”. Parts (a) and (b), with the references [DI] Proposition 3.5.1 and [W3] p. 491.


<a id="R15-2-finite-generation-of-geometric-sections"></a>

### Finite generation of geometric forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/finite-generation-of-geometric-sections`. Kind: **theorem**.

For a noetherian base A and a proper fine compactified modular curve X_A with coherent Hodge power and cusp twist, M_k(X_A) and S_k(X_A) are finite A-modules. If A is a DVR and X_A is flat with invertible Hodge sheaf, these modules are torsion-free, hence finite free. In the stack presentation use the finite-module equalizer supplied by a proper rigidifying descent presentation; finiteness does not imply arbitrary coefficient base change. The canonical base-change map is an isomorphism when the relevant H¹ obstruction vanishes; flat coefficient extension commutes with H⁰ in the supplied proper coherent theory.

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Geometric cusp forms](#R15-1-cusp-ideal-section-forms)
- `ModularCurvesPartII:R13.4a`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Apply proper coherent cohomology finiteness to ω^k and ω^k(−C).
2. Flatness makes multiplication by any nonzero DVR scalar injective on the sheaf and then on H⁰.
3. Use the DVR finite torsion-free module theorem; carry the descent equalizer when present.

**Acceptance checks.**

1. Weight-one H¹ obstructions are retained.
2. A finite free section module can have reduction smaller than Katz sections.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “There is a unique invertible sheaf”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 2.1, author DVI pp.3–4. Quotation: “By a modular form of type”. The displayed definition uses the compactified algebraic stack; Greek notation and spacing are rendered from the DVI. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-2-integral-lattice-and-reduction-image"></a>

### Integral lattice and reduction image

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`. Kind: **construction**.

For O the localization of a number-field integer ring at a place λ over p, with invertible level and a chosen integral lift of the diamond character, let L be H⁰(X_O,ω^k(−C)) in that character part when the character projector is integral. Its comparison to the analytic all-cusp integral lattice is the one induced by the actual moduli family and Tate trivializations. Set S_red=im(L/λL→S_k(X_κ)); do not define S_red as all Katz forms. If the cusp sheaf H¹ has no λ-torsion, this map is onto. For a full-level smooth fine curve n≥3, Katz 1.7.1 gives holomorphic base change in k≥2 and also k=1 for 3≤n≤11; that theorem alone is not a statement about every character projector or cusp twist.

**API.**

- `TauCeti.ResidualModularity.modpCuspForms` (constructor): S_red is the image of the integral cusp lattice reduction map.
- `TauCeti.ResidualModularity.modpCuspForms_mem` (characterisation): Membership means a preimage in L/λL.
- `TauCeti.ResidualModularity.modpCuspForms_baseChange` (functoriality): Scalar extension maps the reduction image to the reduction image of the extended lattice.

**Unit tests.**

- `TauCeti.ResidualModularity.modpCuspForms_zero` — degenerate: The reduction image of a zero cusp lattice is zero.
- `TauCeti.ResidualModularity.katz_vs_reduction` — non-example: At level 1, AΔ has weight 13 in characteristic 2 and is a nonzero Katz cusp form although the characteristic-zero weight-13 space is zero.
- `TauCeti.ResidualModularity.reduced_delta` — computation: At any residue characteristic, integral Δ reduces to a nonzero series with coefficient a₁=1.

**Uses deriving the interface.**

1. R15.5: Supplies both the finite free module and an honest reduction-image witness
2. CDT25 Lemma 4.2.2: Relates arithmetic denominators to the congruence lattice

**Prerequisites.**

- [Finite generation of geometric forms](#R15-2-finite-generation-of-geometric-sections)
- [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison)
- [Coefficient maps of geometric forms](#R15-1-coefficient-maps)
- [The q-expansion principle at level n >= 3 and its underlying vanishing theorem](#R15-2-q-expansion-principle-and-its-vanishing-theorem)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use all-cusp section detection to identify the integral lattices inside the same complex space.
2. Apply the cohomology sequence for multiplication by λ on the cusp sheaf: the cokernel of reduction is H¹[λ].
3. Take the actual image; when an eigenvector is given in this image require its preimage eigenvector in the reduction module.

**Acceptance checks.**

1. Do not replace an integral character eigenspace by a nonintegral averaging projector.
2. Nonzero Katz weight-one forms need not be in S_red.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 1.5, printed p.83 (Ka-15). Quotation: “Theorem 1.7.1”. Sections of the imported Hodge line; the surrounding passage specifies holomorphy at infinity.


<a id="R15-2-bounded-denominators-congruence-application"></a>

### Bounded denominators for congruence forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/bounded-denominators-congruence-application`. Kind: **application**.

A holomorphic congruence modular form with rational Fourier coefficients has a single integer D≥1 clearing all denominators, including primes dividing its level. Import the analytic bounded-denominator statement/lattice of ModularForms, then prove that the all-cusp geometric comparison carries that lattice to sections. Apply this to a modular function f holomorphic on Y(2N): choose m large enough that fΔ^m is holomorphic at every cusp, clear its denominators, and use Δ^−1=q^−2∏(1−q^{2j})^−24 in the CDT parameter q=e^{πiτ} to clear f as a Laurent series. Inverting the level in Katz’s smooth model alone does not bound the exponents of denominator primes dividing the level.

**Prerequisites.**

- [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison)
- [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image)
- `tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the owned all-prime analytic bounded-denominator input.
2. Match the chosen q parameter and integral Δ product.
3. Transport this comparison, keeping the geometric model at level primes as a separate input.

**Acceptance checks.**

1. A lattice over ℤ[1/N] does not by itself provide one D in ℤ.
2. The exponent −2 uses CDT’s parameter; it is −1 for q=e^{2πiτ}.

**Source passages.**


- [The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), Lemma 4.2.2, printed p.655. Quotation: “It follows from [Shi71, Theorem 3.52]”. The holomorphic congruence form fΔ^m has bounded denominators; Δ^−1 is integral in the selected Laurent parameter.


<a id="R15-2-diamond-cohomology-action"></a>

### Diamond action on coherent cohomology

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/diamond-cohomology-action`. Kind: **construction**.

On the imported curve X_Δ(Q) of CG18, define ⟨a⟩ on H^i(X,ω^n⊗A), its cusp twist and H⁰(C,ω^n⊗A), for i=0,1, n∈ℤ and arbitrary O-module A, by pullback along level multiplication and the induced Hodge-line isomorphism. It preserves C and satisfies the group law. At i=0 it agrees with the analytic diamond action under R15.1 comparison.

**API.**

- `TauCeti.GeometricHecke.diamond` (constructor): The diamond endomorphism on each listed cohomology group.
- `TauCeti.GeometricHecke.diamond_one` (simp): ⟨1⟩=id.
- `TauCeti.GeometricHecke.diamond_mul` (relation): ⟨ab⟩=⟨a⟩∘⟨b⟩.

**Unit tests.**

- `TauCeti.GeometricHecke.diamond_cusp` — compatibility: Restriction to the cusp divisor commutes with diamonds.
- `TauCeti.GeometricHecke.diamond_torsion` — compatibility: Reduction of ⟨a⟩ modulo varpi^m agrees with its coefficient action there.
- `TauCeti.GeometricHecke.diamond_minus_one` — characterisation: ⟨−1⟩ on a weight-n form is multiplication by (−1)^n.

**Uses deriving the interface.**

1. CG18 §3.2.3: Provides the group-ring coefficients of the universal Hecke algebra
2. R15.6: Defines nebentypus

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Geometric cusp forms](#R15-1-cusp-ideal-section-forms)
- `ModularCurvesPartII:R14.1/diamond-operators`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the imported moduli automorphism and its action on invariant differentials.
2. Pull back the tensor power and coefficient module; apply coherent cohomology.

**Acceptance checks.**

1. No freeness assumption on A; include O/varpi^m.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.314–317. Quotation: “We recall in this section how the Hecke algebra”. Defines its action on coherent cohomology, including torsion coefficients and cusp twists.


<a id="R15-2-torsion-cohomology-hecke-action"></a>

### Hecke action on torsion coherent cohomology

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/torsion-cohomology-hecke-action`. Kind: **construction**.

In CG18 take p odd, N≥5 prime to p, Q squarefree prime to pN, a fine quotient X_Δ(Q) over a DVR O of residue characteristic p, and x prime to pNQ. For i=0,1 and L=ω^n or ω^n(−C), n∈ℤ, define xT_x=tr(π₁)∘φ*^{⊗n}∘π₂* on H^i(X,L⊗A), with A any O-module. Negative powers use the inverse isogeny map since x is a unit. For primes y|Q define U_y by the analogous level-preserving correspondence omitting the forbidden subgroup; the projections, extension to cusps and trace input belong to ModularCurvesPartII. Recover geometric and analytic T_x at i=0. Operators commute with coefficient maps and with each other and diamonds, giving the O[group]-polynomial algebra action without assuming its image torsion-free.

**API.**

- `TauCeti.GeometricHecke.heckeCohomology` (constructor): T_x on the specified coherent cohomology, with integral invertible-x normalization.
- `TauCeti.GeometricHecke.heckeCohomology_coefficients` (functoriality): Coefficient maps intertwine T_x and U_y.
- `TauCeti.GeometricHecke.heckeCohomology_commute` (relation): The allowed T_x,U_y and diamonds commute.

**Unit tests.**

- `TauCeti.GeometricHecke.heckeCohomology_sections` — compatibility: At i=0 the operator is the geometric q-expansion Hecke operator.
- `TauCeti.GeometricHecke.heckeCohomology_boundary` — computation: In CG18 Remark3.4, a nonzero mod-p boundary common eigenvector for all the allowed T_x, with diamond character ε, has T_x-eigenvalue 1+ε(x)x^{n−1}. This is not asserted for an arbitrary vector at a single cusp.
- `TauCeti.GeometricHecke.heckeCohomology_zero_coefficients` — degenerate: Zero coefficient module has zero cohomology and zero operator.

**Uses deriving the interface.**

1. CG18 §3.2.3: Supplies the torsion cohomology Hecke algebra action
2. R15.3 twisted duality: Fixes the adjoint normalization

**Prerequisites.**

- [Diamond action on coherent cohomology](#R15-2-diamond-cohomology-action)
- [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer)
- `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`
- [Hecke operators defined over arbitrary coefficient modules by their q-expansion formula](#R15-2-integral-hecke-operators-from-q-expansions)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Pull back along π₂; use the universal quotient isogeny on ω; trace along π₁.
2. For cusp twists check pullback inclusion and that trace preserves cusp vanishing.
3. Transport composition relations of correspondences, and check the q formula at i=0.

**Acceptance checks.**

1. Include A=O/varpi^m and A=K/O, not just fields.
2. The factor x^−1 is part of the normalization.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.314–317. Quotation: “We recall in this section how the Hecke algebra”. Defines its action on coherent cohomology, including torsion coefficients and cusp twists.


<a id="R15-2-fricke-hodge-action"></a>

### Fricke action on Hodge powers

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/fricke-hodge-action`. Kind: **construction**.

Use the curve-fricke-map construction of w_x on X_Δ(Q;x), with π₂=π₁w_x and w_x²=⟨x⟩ on the moduli problem. Define W_x on H^i(X_Δ(Q;x),ω^n⊗A) and its cusp twist by w_x pullback followed by the quotient-isogeny Hodge map. Then W_x²=x^n⟨x⟩. This applies for x prime to pNQ, i=0,1, arbitrary coefficient module A and any integral n; it follows on sheaves before passing to cohomology. The curve map w_x and the operator W_x are different maps.

**API.**

- `TauCeti.GeometricHecke.fricke` (constructor): The Hodge-power operator W_x induced by the constructed curve map w_x.
- `TauCeti.GeometricHecke.fricke_sq` (relation): W_x²=x^n⟨x⟩.
- `TauCeti.GeometricHecke.fricke_coefficients` (functoriality): W_x commutes with coefficient maps.

**Unit tests.**

- `TauCeti.GeometricHecke.fricke_weight_zero` — degenerate: At n=0, W_x²=⟨x⟩.
- `TauCeti.GeometricHecke.fricke_weight_one` — computation: At n=1, W_x²=x⟨x⟩.
- `TauCeti.GeometricHecke.fricke_not_involution` — non-example: At weight 2 and trivial diamond character, W_x²=x² id; over characteristic zero it is not an involution.

**Uses deriving the interface.**

1. CG18 §3.2.3 and Lemma 3.5: Provides the scalar in oldform and trace relations

**Prerequisites.**

- [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action)
- [Geometric Fricke map](#R15-2-curve-fricke-map)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Compose the quotient isogeny with its dual and use [x]*ω=xω.
2. Compose the level structure maps and obtain ⟨x⟩.
3. Tensor and apply cohomology; the identity survives torsion coefficients.

**Acceptance checks.**

1. At weight one W_x²=x⟨x⟩, rather than identity.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.314–317. Quotation: “We recall in this section how the Hecke algebra”. Defines its action on coherent cohomology, including torsion coefficients and cusp twists. The weight-n square uses x^n, correcting the source’s weight-one scalar E21; the i=1 extension is derived on sheaves, rather than inferred from its misprinted target E22.


<a id="R15-2-cuspidal-exact-sequence-equivariance"></a>

### Hecke equivariance of the cuspidal sequence

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/cuspidal-exact-sequence-equivariance`. Kind: **theorem**.

The coherent long exact sequence from 0→ω^n(−C)⊗A→ω^n⊗A→(ω^n|C)⊗A→0 is equivariant for diamonds, T_x and U_y with the normalization of torsion-cohomology-hecke-action. In the smooth prime-to-level setting the cusp quotient is O-flat, so the sheaf sequence is exact for arbitrary O-module A. On boundary H⁰(C,ω^n⊗A) its action is obtained by taking constant terms at each cusp, not by treating one cusp as all cusps.

**Prerequisites.**

- [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action)
- [Diamond action on coherent cohomology](#R15-2-diamond-cohomology-action)
- [Geometric cusp forms](#R15-1-cusp-ideal-section-forms)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Check compatibility of pullback, Hodge map and trace with cusp inclusions and quotient sheaves.
2. Use naturality of the connecting morphisms in the cohomology long exact sequence.

**Acceptance checks.**

1. Nonzero cusp-boundary eigenforms have the scalar 1+ε(x)x^{n−1} in the CG convention.
2. No surjectivity of M_n→H⁰(C,ω^n|C) is inferred.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed pp.314–317. Quotation: “We recall in this section how the Hecke algebra”. Defines its action on coherent cohomology, including torsion coefficients and cusp twists.


<a id="R15-2-curve-fricke-map"></a>

### Geometric Fricke map

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.2/curve-fricke-map`. Kind: **construction**.

For p odd, N≥5 prime to p, Q squarefree prime to pN, and a prime x∤pNQ, construct w_x on the fine auxiliary curve X_Δ(Q;x). On its open moduli problem send (E,α_NQ,C_x) to (E/C_x,π∘α_NQ,E[x]/C_x), where π is the quotient isogeny. Extend this map over the compactification using the imported quotient/contraction interface. Then w_x²=⟨x⟩ and π₂=π₁∘w_x. The construction and these identities belong here; the supplier owns the auxiliary moduli curve and degeneracy projections. It is generally not an involution.

**API.**

- `TauCeti.GeometricHecke.curveFricke` (constructor): The compactified map w_x induced by quotienting the auxiliary subgroup.
- `TauCeti.GeometricHecke.curveFricke_sq` (relation): w_x composed twice is the curve diamond map ⟨x⟩.
- `TauCeti.GeometricHecke.curveFricke_projection` (compatibility): π₁∘w_x=π₂.

**Unit tests.**

- `TauCeti.GeometricHecke.curveFricke_quotient` — computation: For an ordinary geometric point (E,α,C_x), forgetting the subgroup after w_x gives (E/C_x,π∘α), the second projection.
- `TauCeti.GeometricHecke.curveFricke_double` — compatibility: For the same point, quotienting twice gives (E,xα,C_x) under E/E[x]≅E; the subgroup and level structure must both be tracked.
- `TauCeti.GeometricHecke.curveFricke_not_involution` — non-example: On a fine level with a geometric point moved by ⟨x⟩, w_x² is not identity. For example take N=5, Q=1, Δ trivial, x=2 and a generic elliptic curve with only ±1 automorphisms: 2P is neither P nor −P for P of order5.

**Uses deriving the interface.**

1. CG18 §3.2.3; PAPER-CALEGARI-GERAGHTY-18/fricke-w-x: Supplies the curve map needed to define W_x and establish the degeneracy identities.

**Prerequisites.**

- `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence`
- `ModularCurvesPartII:R14.1/diamond-operators`
- `ModularCurvesPartII:R13.4b`
- `ModularCurvesPartII:R13.2/gamma-level-structures`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R152.lean`
- namespace: `TauCeti.GeometricHecke`

**Proof plan.**

1. Use the universal cyclic subgroup and quotient elliptic curve to define the transformation of the fine moduli functor.
2. Apply the imported compactified quotient/contraction interface, checking compatibility on cusp charts and with Δ descent.
3. Identify the double quotient E/E[x] with E via multiplication by x; track the level structure to obtain ⟨x⟩.
4. The first projection after this map is precisely the second degeneracy projection.

**Acceptance checks.**

1. Check every named test, retaining its moduli and coefficient hypotheses.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.3, printed p.314, preceding the definition of W_x. Quotation: “Note that this is not really an involution”. Defines the quotient tuple, then computes w_x²=⟨x⟩ and π₂=π₁∘w_x. The cited compactification input remains a supplier request.


## R15.3. Characteristic-p operations

Coverage: **planned**. Remaining closure: Read Gross’s torsion-coefficient operator, Jochnowitz’s cycle proof and the exceptional low-level source; finish imported Igusa monodromy interfaces.

Planets: Hasse invariant, Tate's θ-cycles, Weight reduction to at most p + 1, Frobenius on modular forms, Weight-one Hecke operator.

<a id="R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one"></a>

### Elliptic modular Hasse invariant

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one`. Kind: **construction**.

Let R be an F_p-algebra and E/R an elliptic curve. Absolute Frobenius induces a p-linear endomorphism of H^1(E, O_E); if omega is a basis of omega_{E/R} with dual basis eta of H^1(E, O_E), define A(E, omega) in R by F_abs(eta) = A(E, omega) eta. Then A(E, k omega) = k^{1-p} A(E, omega) for k in R^*, so A is a modular form of level one and weight p-1 over F_p. Intrinsically A is the section of omega_{E/R}^{tensor (p-1)} corresponding to the R-linear map F_abs: (H^1(E,O_E))^{tensor p} -> H^1(E, O_E). A is holomorphic at infinity and A(Tate(q), omega_can) = 1. This is the elliptic specialization of the general BT₁ Hasse invariant det(V*) owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2. Prove its equality with the Frobenius-on-H¹(O) description by Cartier/Serre duality, with the determinant-line trivialization fixed; no second general BT₁ construction is made.

**Hypotheses and conventions.**

1. R is an F_p-algebra (p = 0 in R); the construction is purely characteristic p
2. omega must be a basis of omega_{E/R}, so the scalar A(E, omega) is defined only after a trivialization, the weight p-1 transformation law being exactly the resulting ambiguity
3. holomorphy at infinity uses that the Tate curve over F_p((q)) extends to a plane curve over F_p[[q]] whose dualizing sheaf has omega_can as a basis

**API.**

- `TauCeti.ModPModularForms.hasseInvariant` (constructor): A(E, ω) ∈ R defined by F_abs(η) = A(E, ω)η, η dual to ω, for E over an F_p-algebra R.
- `TauCeti.ModPModularForms.hasseInvariant_weight` (characterisation): A(E, λω) = λ^{1−p}A(E, ω): A is a level-one form of weight p − 1 over F_p.
- `TauCeti.ModPModularForms.hasseInvariant_tate` (simp): A(Tate(q), ω_can) = 1.

**Unit tests.**

- `TauCeti.ModPModularForms.hasse_E4_mod5` — computation: p = 5: A = E₄ mod 5, as E₄ = 1 + 240∑σ₃(m)q^m and 5 | 240 (checked in the suggested Lean file).
- `TauCeti.ModPModularForms.hasse_no_level_one_lift_p2` — non-example: p = 2: A does not lift to a level-one form holomorphic at ∞ over ℚ ∩ ℤ₂ (Katz 2.1); it lifts only at level 3 ≤ n ≤ 11, n odd.
- `TauCeti.ModPModularForms.hasse_weight_zero_filtration` — degenerate: A has q-expansion 1, the q-expansion of the constant form of weight 0, so its filtration is w(A) = 0.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation: the filtration w(f) is defined by division by A

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Level one and level two forms as invariants of a rigidifying cover, with the primes that must be inverted](#R15-1-level-one-and-two-by-descent-with-explicit-inverted-primes)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/ModP.lean`
- namespace: `TauCeti.ModPModularForms`

**Proof plan.**

1. Katz 2.0 defines A(E, omega) by F_abs(eta) = A(E, omega) eta and computes A(E, k omega) = k^{1-p} A(E, omega) from p-linearity of F_abs, which is exactly the weight p-1 transformation law.
2. He reinterprets F_abs as an R-linear map on the p-th tensor power, exhibiting A as a section of omega^{tensor (p-1)}.
3. Holomorphy at infinity is proved twice: first by extending Tate(q) over F_p((q)) to a plane curve C over F_p[[q]] whose dualizing sheaf has omega_can as a basis, so A(Tate(q), omega_can) is the matrix of F_abs on H^1(C, O_C) and lies in F_p[[q]]; second by the invariant-derivation computation (H^1(E, O_E) is the tangent space, F_abs acts by the p-th iterate of an invariant derivation, D(t) = 1+t, D^p = D, hence F_abs^*(eta_can) = eta_can for the dual basis eta_can). Only the second computation gives the value A(Tate(q), omega_can) = 1.
4. Compare the imported general determinant of Verschiebung with the dual Frobenius map for the universal elliptic curve.

**Acceptance checks.**

1. Verify A(Tate(q), omega_can) = 1 directly from the invariant derivation D dual to omega_can = dt/(1+t)
2. Verify that the vanishing locus of A is the supersingular locus, by checking A(E, omega) = 0 exactly when F_abs is zero on H^1(E, O_E) (a standard characterization not stated in the passage 2.0 read here)

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.0, printed p. 97 (Ka-29). Quotation: “Let R”. Literal derivation of the weight p-1 transformation law from p-linearity of absolute Frobenius.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.0, printed pp. 97-98 (Ka-29/30). Quotation: “An alternative method of establishing holomorphy”. The normalization A(Tate(q), omega_can) = 1 at the cusp; the page image shows the Frobenius acting on the dual basis eta_can of H^1, not on omega_can. Corrected by the reviewer.


<a id="R15-3-deligne-congruence-and-the-explicit-p-equals-2-3-liftings"></a>

### A = E_{p-1} mod p for p >= 5, and the explicit level-n liftings of A required at p = 2, 3

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/deligne-congruence-and-the-explicit-p-equals-2-3-liftings`. Kind: **theorem**.

For even k >= 4 the Eisenstein series E_k = 1 - (2k/B_k) sum sigma_{k-1}(n) q^n is defined over Q by the q-expansion principle 1.9.1. For k = p-1 with p >= 5 the p-adic ordinal of -2(p-1)/B_{p-1} is 1, so E_{p-1} has q-expansion coefficients in Q intersect Z_p and reduces mod p to a level-one weight-(p-1) form over F_p with constant q-expansion 1; since A also has q-expansion 1 and the same weight, A = E_{p-1} mod p. For p = 2 and p = 3 it is not possible to lift A to a level-one form holomorphic at infinity over Q intersect Z_p. Instead, for p = 2 and 3 <= n <= 11 with n odd, A lifts to a weight-1 level-n form holomorphic at infinity over Z[1/n], and for p = 3 and any n >= 3 with 3 not dividing n, A lifts to a weight-2 level-n form over Z[1/n], both by Theorem 1.7.1 (the following sentence, choosing the lifting E_{p-1}, prints the p = 3 range as n >= 2, 3 not dividing n). By the Remark, for p = 2 a lifting of A to level n over Z[1/n] exists for n = 3, 5, 7, 9, 11 and hence for any n divisible by one of 3, 5, 7, 11; Katz does not know whether A lifts to level n for other n (even n = 13), and notes that E_4 = 1 + 240 sum sigma_3(n) q^n provides a level-one lifting to Z of A^4 when p = 2 and of A^2 when p = 3.

**Hypotheses and conventions.**

1. p >= 5 for the level-one congruence A = E_{p-1} mod p; the argument needs E_{p-1} to be p-integral and to reduce to the constant 1
2. the identification of two forms with equal q-expansion uses the level-one q-expansion principle, Cor. 1.9.1
3. the p = 2 lifting is produced by Thm 1.7.1 for odd n with 3 <= n <= 11 and then, by the Remark, for every n divisible by one of 3, 5, 7, 11; for other n it is open in the source. The p = 3 lifting is in weight 2, where Thm 1.7.1 applies for all n >= 3 with 3 not dividing n

**Prerequisites.**

- [Elliptic modular Hasse invariant](#R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one)
- [The q-expansion principle at level n >= 3 and its underlying vanishing theorem](#R15-2-q-expansion-principle-and-its-vanishing-theorem)

**Proof plan.**

1. Katz 2.1 computes the q-expansion of E_k and its field of definition, then observes that for k = p-1 with p > 3 the p-adic ordinal of 2(p-1)/B_{p-1} is 1, so E_{p-1} has p-integral coefficients and reduces to the constant 1.
2. Since A also has q-expansion 1 (node hasse-invariant-as-a-form-of-weight-p-minus-one) and both have weight p-1 and level one, they agree by the q-expansion principle.
3. For p = 2, 3 Katz states that A admits no level-one holomorphic lifting and produces the level-n liftings from Thm 1.7.1 in the indicated weight and level ranges, flagging explicitly that the case p = 2, n = 13 is unknown to him.

**Acceptance checks.**

1. Check the von Staudt-Clausen computation ord_p(B_{p-1}) = -1 for p >= 5, hence ord_p(2(p-1)/B_{p-1}) = 1, so that E_{p-1} is p-integral with constant term 1 and all other coefficients divisible by p
2. Check that at p = 2 and p = 3 the roadmap's characteristic-p operations are stated with an explicitly chosen lifting E_{p-1} of level n, and never through a division by p-1 or by 6

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.1, printed p. 98 (Ka-30). Quotation: “For p”. Literal statement of Deligne's congruence together with the q-expansion argument used to prove it.

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 2.1, printed pp. 98-99 (Ka-30/31). Quotation: “it is not possible to lift”. The literal exceptional treatment at p = 2 and p = 3 with its level range, transcribed from the page image (the text layer drops the inequality signs).

- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), Remark in 2.1, printed p. 99 (Ka-31). Quotation: “there exists a lifting”. The full Remark: the p = 2 lifting extends to every n divisible by 3, 5, 7 or 11, and is open only for the remaining n. Extended by the reviewer.


<a id="R15-3-theta-operator-filtration-and-hecke-commutation"></a>

### The theta operator, the filtration w(f), and their Hecke commutation relations

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/theta-operator-filtration-and-hecke-commutation`. Kind: **construction**.

Let M(N) = direct sum over k >= 0 of M(N, k), the graded F_p-bar-algebra of mod p modular forms of level N. The filtration of f in M(N, k) is w(f) = min{ k - i(p-1) : f is in A^i M(N, k - i(p-1)) } where A is the Hasse invariant; equivalently w(f) is the least k' such that some form of weight k' has, at some cusp, the same q-expansion as f. This equivalence rests on the fact that the kernel of the q-expansion map M(N) -> F_p-bar[[q]] at any cusp is the ideal generated by A - 1. There is a derivation theta: M(N) -> M(N) raising degrees by p+1 whose effect on q-expansions at all cusps is q d/dq. If f in M(N, k) has filtration k and p does not divide k, then w(theta f) = k + p + 1. If f is in M(N, pk) and theta f = 0, then f = g^p for a unique g in M(N, k). The Hecke commutation is T_l^*(theta f) = l theta(T_l^* f), so in particular T_p^*(theta f) = 0, and if f is an eigenform of type (N, k, eps) with eigenvalues a_l then theta f is an eigenform of type (N, k+p+1, eps) with eigenvalues l a_l, whence rho_{theta f} = rho_f tensor chi. Filtration is defined for nonzero homogeneous forms; if a total function is desired, set w(0)=0 separately. The implication about an eigenform θf is stated only when θf≠0. The Galois-twist assertion uses R19 after attachment and is not needed to construct θ. In the differential normalization q denotes the Tate parameter. On a full-level chart Tate(t^n), with q=t^n, θ(t^i)=(i/n)t^i; the formula Σm a_m q^m refers to the usual integral-exponent expansion. This agrees with KS(ω_can²)=n dt/t and does not identify t with q.

**Hypotheses and conventions.**

1. forms are Katz mod p modular forms of level N with p not dividing N, in Edixhoven's sense of section 2.1 of the source
2. the filtration statement w(theta f) = k + p + 1 needs both w(f) = k and p not dividing k
3. the identification of the kernel of the q-expansion map with the ideal (A-1) is imported from Katz's work on mod p modular forms, cited as [15], section 1
4. Edixhoven takes the Hasse invariant A from Katz-Mazur ([16], section 12.4) as the form of type (1, p-1) with q-expansion 1 at all cusps, and notes that forms of weights k and k' with the same q-expansion at a cusp have k = k' mod (p-1)

**API.**

- `TauCeti.ModPModularForms.filtration` (constructor): w(f) = min{k − i(p − 1) : f ∈ A^i M(N, k − i(p − 1))}.
- `TauCeti.ModPModularForms.theta` (constructor): The derivation θ : M(N) → M(N) of degree p + 1 acting by q d/dq on every q-expansion.
- `TauCeti.ModPModularForms.theta_filtration` (characterisation): If w(f) = k and p ∤ k then w(θf) = k + p + 1.
- `TauCeti.ModPModularForms.theta_hecke` (compatibility): T_l^*(θf) = l θ(T_l^* f); hence ρ_{θf} = ρ_f ⊗ χ for an eigenform f.

**Unit tests.**

- `TauCeti.ModPModularForms.theta_qexp` — computation: θ(∑a_nq^n) = ∑ n a_n q^n; for Δ mod 5 the coefficient of q² in θΔ is 2·τ(2) = −48 ≡ 2 (checked in the suggested Lean file).
- `TauCeti.ModPModularForms.theta_kills_pth_powers` — non-example: θ(g^p) = 0 although g^p ≠ 0: θ is not injective, and the kernel in weight pk consists of p-th powers.
- `TauCeti.ModPModularForms.theta_hasse` — degenerate: θA = 0, as A has constant q-expansion 1.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables: θ-cycles are the sequences of filtrations of θ^i f
2. AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases: Serre's twisting formula (2.2.5) matches w(θf) = w(f) + p + 1

**Prerequisites.**

- [Elliptic modular Hasse invariant](#R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one)
- [Hecke operators defined over arbitrary coefficient modules by their q-expansion formula](#R15-2-integral-hecke-operators-from-q-expansions)
- [The q-expansion principle at level n >= 3 and its underlying vanishing theorem](#R15-2-q-expansion-principle-and-its-vanishing-theorem)
- [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/ModP.lean`
- namespace: `TauCeti.ModPModularForms`

**Proof plan.**

1. Edixhoven 3.1 records the two equivalent descriptions of the filtration and reduces the equivalence to the description of the kernel of the q-expansion map as the ideal generated by A - 1.
2. He states Katz's construction of theta as a derivation of the graded algebra raising degree by p+1 and acting as q d/dq on q-expansions at all cusps.
3. The commutation relation T_l^*(theta f) = l theta(T_l^* f) is stated in 3.1, not proved there (the construction of theta is attributed to Katz [15]); taking l = p gives T_p^*(theta f) = p theta(T_p^* f) = 0 because p = 0 in F_p-bar. Edixhoven also notes that theta preserves cusp forms.
4. The eigenvalue statement l a_l is the twist by the cyclotomic character, which is what makes rho_{theta f} = rho_f tensor chi.

**Acceptance checks.**

1. Check theta on a known level-one form (for instance Delta at p = 5) and confirm both the weight shift by p+1 and the eigenvalue shift a_l -> l a_l
2. Check that theta f = 0 forces f to be a p-th power and that the induced weight divides by p as stated

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.1, p. 7 of the DVI. Quotation: “increases degrees by”. Literal construction of theta with its degree shift and its effect on q-expansions; '#' is the conversion's rendering of theta. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.1, p. 7 of the DVI. Quotation: “The commutation relations”. The exact filtration hypothesis 'p does not divide k' and the Hecke commutation relation retained above. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-3-theta-cycles-and-the-small-characteristic-tables"></a>

### Tate's theta-cycles, with the p > 3 classification and the explicit p = 2 and p = 3 tables

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/theta-cycles-and-the-small-characteristic-tables`. Kind: **theorem**.

For a homogeneous f in M(N) with theta f nonzero, the theta-cycle of f is the sequence (w(theta f), ..., w(theta^{p-1} f)). Up to cyclic permutation a theta-cycle is always of one of the two displayed shapes: (k, k+p+1, ..., k+(p-2)(p+1)) when k = 2 mod p, and (k, k+p+1, ..., k+(p-k_0)(p+1), k_1, k_1+p+1, ..., k_1+(k_0-3)(p+1)) when k = k_0 mod p with 3 <= k_0 <= (p+3)/2 and k_1 = k + p + 3 - 2 k_0 - this classification being asserted at least for p > 3. For p = 2 the only possibility is (k) with k = 0 mod 2; for p = 3 the possibilities are (k, k+4) with k = 2 mod 3 and (k, k) with k = 0 mod 3. For a cuspidal eigenform of type (N, k, eps) with 1 <= k <= p+1 and w(f) = k, the cycle is given by the case table of Prop. 3.3, which splits on whether a_p = 0 and has explicit small-characteristic variants for p = 2 and p = 3. The full eigenform table for p>3 is as follows, with arithmetic progressions having step p+1 and empty progressions omitted. If a_p=0: k=1 gives (p+2,…,p+2+(p−2)(p+1)); k=2 gives (2+p+1,…,2+(p−2)(p+1),2); 3≤k≤p−1 gives (k+p+1,…,k+(p−k)(p+1),k₁,…,k₁+(k−3)(p+1),k), k₁=p+3−k; k=p gives (3,…,3+(p−3)(p+1),p); k=p+1 does not occur. If a_p≠0: k=1 or p gives (p+2,…,p+2+(p−2)(p+1)); 2≤k≤p−1 gives (k+p+1,…,k+(p−k)(p+1),k₀+p+1,…,k₀+(k−1)(p+1)), k₀=p+1−k; k=p+1 gives (2p+2,…,2p+2+(p−2)(p+1)). For p=2, a_p=0 gives k=1:(4), k=2:(2), with k=3 absent; a_p≠0 gives k=1:(4), k=2:(4), k=3:(6). For p=3, a_p=0 gives k=1:(5,9), k=2:(6,2), k=3:(3,3), with k=4 absent; a_p≠0 gives k=1:(5,9), k=2:(6,6), k=3:(5,9), k=4:(8,12).

**Hypotheses and conventions.**

1. theta f nonzero, so that the cycle is defined
2. the general classification is asserted 'at least for p > 3', with p = 2 and p = 3 listed separately; the published proof cited is for level 1 ([13], section 7)
3. Prop. 3.3 requires f cuspidal, an eigenform of type (N, k, eps) with 1 <= k <= p+1 and with filtration equal to k, i.e. f not divisible by the Hasse invariant

**Prerequisites.**

- [The theta operator, the filtration w(f), and their Hecke commutation relations](#R15-3-theta-operator-filtration-and-hecke-commutation)

**Proof plan.**

1. Edixhoven 3.2 states the classification of theta-cycles as 'straightforward but surprising', without proof, and attributes a proof in the level-one case to [13] = Jochnowitz, The local components of the Hecke algebra mod l, section 7; he also notes that always w(theta^p f) = w(theta f).
2. Prop. 3.3 deduces the case table from that classification, with the single exception a_p nonzero and k = p, where one must exclude w(theta f) = 3; Edixhoven argues that w(theta f) = 3 would force w(theta^{p-1} f) = p = w(f), hence f - theta^{p-1} f = V_p g for a nonzero g of weight 1, hence f a linear combination of A g and V_p g and w(theta f) = p+2, a contradiction.
3. Note that w(theta^{p-1} f) = w(f) holds only when the q-expansion of f at some cusp has a_{p n} = 0 for all n, which the source records explicitly.

**Acceptance checks.**

1. Reproduce the p = 3 table entries (5,9), (6,2), (3,3) for a_3 = 0 and (5,9), (6,6), (5,9), (8,12) for a_3 nonzero on explicit eigenforms of level N prime to 3
2. Confirm the p = 2 table of Prop. 3.3: for a_2 = 0 the cycles are (4) for k = 1 and (2) for k = 2, and k = 3 does not occur; for a_2 nonzero they are (4), (4), (6) for k = 1, 2, 3; so no p > 3 formula is used at p = 2

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 3.2, p. 7 of the DVI. Quotation: “A proof of this fact for level”. The literal restriction 'at least for p > 3' and the separate p = 2 statement, both retained. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 3.3 and its proof, pp. 8-9 of the DVI. Quotation: “Then the”. The hypotheses of Prop. 3.3, including w(f) = k, which the node keeps. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-3-weight-reduction-to-at-most-p-plus-one"></a>

### Every mod p eigensystem comes, up to a theta-twist, from weight at most p+1

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/weight-reduction-to-at-most-p-plus-one`. Kind: **theorem**.

Let f be an eigenform of some type (N, k, eps). Then there exist integers i and k' with 0 <= i <= p-1 and k' <= p+1 and an eigenform g of type (N, k', eps) such that f and theta^i g have the same eigenvalues for all T_l^* with l different from p. Edixhoven's proof (section 7) is modular-form theoretic and stated for arbitrary p: for N >= 5 prime to p it combines the long exact cohomology sequence of multiplication by the Hasse invariant 7.1.1 on X_1(N)_{F_p-bar}, Prop. 7.2 (an element B of the space S(N, p+1) of forms on the supersingular points inducing Hecke-twisted isomorphisms S(N, k) -> S(N, k+p+1)) and Prop. 7.3 (Hecke compatibility of the boundary map S(N, k) -> M^0(N, p+1-k)^dual obtained from Serre duality and Kodaira-Spencer); N = 2, 3, 4 and N = 1 with p > 3 are treated by taking G-invariants on X(4) or X(3) for a group G of order prime to p; the remaining cases N = 1, p = 2 or 3 are referred to Serre [25], Theoreme 3 (Asterisque 24-25), which was not read.

**Hypotheses and conventions.**

1. the conclusion controls the eigenvalues only away from p: the T_l^* for l different from p
2. the source states the range 0 <= i <= p-1; since l^{p-1} = 1 in F_p for l different from p, only i mod (p-1) affects the eigenvalues away from p (reviewer remark, not in the source)
3. the cohomological proof is run at level N >= 5; N = 2, 3, 4, and N = 1 with p > 3, are obtained via G-invariants with p not dividing #G; N = 1 with p = 2 or 3 is an unread import from Serre [25], Theoreme 3

**Uses deriving the interface.**

1. SerreWeightAndLevelOptimisation R20.3: the first step of Edixhoven's proof of Theorem 4.5

**Prerequisites.**

- [Tate's theta-cycles, with the p > 3 classification and the explicit p = 2 and p = 3 tables](#R15-3-theta-cycles-and-the-small-characteristic-tables)
- [The theta operator, the filtration w(f), and their Hecke commutation relations](#R15-3-theta-operator-filtration-and-hecke-commutation)
- [Hecke operators defined over arbitrary coefficient modules by their q-expansion formula](#R15-2-integral-hecke-operators-from-q-expansions)

**Proof plan.**

1. Edixhoven Thm 3.4 states the result; the alternative, previously unpublished, argument uses the Jordan-Holder filtration of Sym^{k-2} F for the p-torsion F of the universal elliptic curve, with successive quotients Sym^i F tensor (det F)^{tensor j}, 0 <= i <= p-1, 0 <= j <= p-2, illustrated by the exact sequence 0 -> F -> Sym^p F -> Sym^{p-2} F tensor det F -> 0.
2. Edixhoven's own proof is given in section 7: Prop. 7.2 produces B in S(N, p+1) with T_l^*(Bf) = l B T_l^*(f) (three constructions: Robert [23] Thm B, E_{p+1} mod p for p >= 5; the Kodaira-Spencer image of the simple zero of A; Katz [15]), Prop. 7.3 shows via Lemma 7.4 (compatibility of Kodaira-Spencer with isogenies) that the map Phi: S(N, k) -> M^0(N, k')^dual, k' = p+1-k, intertwines T_l^* with l^{k-1} T_l^{*dual}, and 7.5 assembles these with the long exact sequence of 7.1.1 and the fact that duality on finite-length F_p-bar[T_l]-modules preserves supports.
3. The first published proof for p >= 5 is attributed to Ash-Stevens, [1], Thms 3.4 and 3.5.
4. 7.5, small levels: for N = 4 or 2 (so p odd) M(N, k) = H^0(X, omega^k)^G with X = X(4) and G a subgroup of SL_2(Z/4Z) of order prime to p; for N = 3 the same with X(3); for N = 1 and p > 3 with G = SL_2(Z/3Z) or SL_2(Z/4Z); G-invariants are exact and the exact sequence 7.5.1 is G-equivariant. For N = 1 and p = 2 or 3 the source refers to Serre [25], Theoreme 3.

**Acceptance checks.**

1. Check on an example of weight k > p+1 that the produced pair (i, k') satisfies rho_f = rho_g tensor chi^i
2. Check that the statement is only about eigenvalues away from p, by exhibiting a case where a_p(f) and a_p(theta^i g) differ

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorem 3.4, p. 9 of the DVI. Quotation: “there exist integers”. Literal statement including the restriction to l different from p. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 7.5 Proof of Theorem 3.4, p. 25 of the DVI. Quotation: “combined with Propositions”. Records that the proof is run for N >= 5 and that the small levels need a separate argument. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 7.5, p. 26 of the DVI. Quotation: “For these remaining two cases”. The level-one characteristic-2 and -3 cases rest on an unread import. Added by the reviewer. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-3-frobenius-verschiebung-on-expansions"></a>

### Frobenius and Verschiebung on forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/frobenius-verschiebung-on-expansions`. Kind: **construction**.

On prime-to-p geometric modular forms define the linear operator V on weight k with coefficients in a perfect field by relative Frobenius pullback together with inverse Frobenius on coefficients; it lands in weight pk and has expansion Σa_nq^{pn}. Distinguish this coefficient-linear V from the absolute pth-power map f↦f^p, which sends coefficients to a_n^p. On formal expansions define U(Σa_nq^n)=Σa_{pn}q^n; UV=id for p≥1. U is a geometric form operator only where a Hecke/ordinary correspondence constructs it, not on arbitrary weights by this series formula alone. The curve-level relative Frobenius and dual isogeny Verschiebung are imported from the elliptic owner. For T_p on weight k≥1 at prime-to-p level the formula is U+p^{k−1}⟨p⟩V; in characteristic p it is U for k≥2 and U+⟨p⟩V for k=1.

**API.**

- `TauCeti.ModPModularForms.qU` (constructor): The coefficient-selection linear map on formal power series.
- `TauCeti.ModPModularForms.qV` (constructor): The exponent-multiplication linear map on formal power series.
- `TauCeti.ModPModularForms.qU_qV` (relation): qU(p)(qV(p)(f))=f for p>0.
- `TauCeti.ModPModularForms.qV_coefficient` (simp): The coefficient at m is a_{m/p} if p|m, and zero otherwise.

**Unit tests.**

- `TauCeti.ModPModularForms.qV_X` — computation: V(q)=q^p and U(q^p)=q.
- `TauCeti.ModPModularForms.qV_linear_not_power` — non-example: Over F₂(t), V(tq)=tq² while (tq)²=t²q².
- `TauCeti.ModPModularForms.qU_constant` — degenerate: U fixes constants; V also fixes constants.

**Uses deriving the interface.**

1. R15.3 weight-one Tp: Controls the extra V term
2. Katz77 kernel theorem: Distinguishes powers from linear Frobenius

**Prerequisites.**

- [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization)
- [Hecke operators defined over arbitrary coefficient modules by their q-expansion formula](#R15-2-integral-hecke-operators-from-q-expansions)
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Pull back to the Frobenius-twisted family, using the coefficient Frobenius inverse for the linear version.
2. Check the Tate expansions, then UV coefficientwise.
3. Import the geometric T_p construction to show that the formal formula preserves the relevant form spaces.

**Acceptance checks.**

1. Over a general F_p-algebra without invertible Frobenius, do not silently identify V with absolute powers.

**Source passages.**


- [A result on modular forms in characteristic p](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56. Quotation: “increases degrees by”. Extends the theta construction and exact-filtration results to every characteristic and prime-to-p full level N ≥ 3.

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 8.14, local p.66 (final p.866). Quotation: “We have operators U and V defined by the formulas”. The GL2 q-expansion model distinguishes weight one from higher weights and uses UV=id.


<a id="R15-3-igusa-interpretation-of-hasse-and-theta"></a>

### Igusa interpretation of Hasse and theta

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/igusa-interpretation-of-hasse-and-theta`. Kind: **comparison**.

On the ordinary locus use the Igusa component and canonical differential supplied by ModularCurvesPartII R13.5. The Igusa trivialization a of ω satisfies a^{p−1}=A; the deck group acts through its tautological character, so a weight-k form divided by a^k is a function of the prescribed character. Pullback detects forms by faithful descent, and the Gauss–Manin unit-root splitting plus Kodaira–Spencer computes theta there. Katz77 proves that A times this ordinary differential operator extends across supersingular points with degree p+1; the extension is theta. At p=2 the first deck group is trivial but the ordinary differential/extension construction still applies; do not divide by 6 or infer small characteristic from E_{p−1}.

**Prerequisites.**

- [Elliptic modular Hasse invariant](#R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one)
- [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer)
- `ModularCurvesPartII:R13.5`
- [The theta operator, the filtration w(f), and their Hecke commutation relations](#R15-3-theta-operator-filtration-and-hecke-commutation)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the imported ordinary Igusa cover and differential, not a second Igusa curve construction.
2. Compare its tautological power with A by the defining Frobenius/Verschiebung pairing.
3. Compare the ordinary differential formula and the global Katz operator on dense ordinary charts.

**Acceptance checks.**

1. At Tate(q), both A and the trivialized a have normalized expansion 1.
2. Supersingular points are excluded from the splitting, then handled by the theta extension theorem.

**Source passages.**


- [A result on modular forms in characteristic p](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56. Quotation: “increases degrees by”. Extends the theta construction and exact-filtration results to every characteristic and prime-to-p full level N ≥ 3.


<a id="R15-3-weight-congruences-on-the-ordinary-tower"></a>

### Congruences of weights on the ordinary tower

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/weight-congruences-on-the-ordinary-tower`. Kind: **theorem**.

For the Katz ordinary modular scheme modulo p^m, a horizontal section of ω^k with expansion 1 at a cusp exists iff k is divisible by (p−1)p^{m−1} for odd p. For p=2 the divisor is 2^{α(m)}, with α(1)=0, α(2)=1 and α(m)=m−2 for m≥3. Consequently two ordinary forms of weights k₁≤k₂ with congruent expansions modulo p^m and a coefficient nonzero modulo p at that cusp have weights congruent modulo that divisor. If the expansions agree on one cusp of every component, multiplication by the corresponding horizontal Hodge section identifies the forms. This is an ordinary Igusa-tower statement; it does not assert a characteristic-zero level-one lift of A.

**Prerequisites.**

- [Elliptic modular Hasse invariant](#R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one)
- `ModularCurvesPartII:R13.5`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the full image of ordinary monodromy on the étale quotient, supplied with the Igusa tower.
2. Compute the exponent of (ℤ/p^mℤ)×, including m=1,2 at p=2.
3. Apply the horizontal-section correspondence and q-expansion principle to the ratio of the two forms on a nonempty open.

**Acceptance checks.**

1. For p=2,m=3 the required divisor is 2, whereas for m=4 it is 4.
2. The nonzero-mod-p hypothesis cannot be dropped: two zero reductions give no weight information.

**Source passages.**


- [p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf), 4.4.1–4.4.2, printed pp.151–152 (Ka-83/84). Quotation: “The following conditions are equivalent”. Uses the full unit-group monodromy on the ordinary Igusa tower; the dyadic exponent is explicitly different.


<a id="R15-3-weight-one-tp-with-torsion-coefficients"></a>

### Weight-one Hecke operator at p

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/weight-one-tp-with-torsion-coefficients`. Kind: **theorem**.

Under the prime-to-p level hypotheses of CG18 (p≥3,N≥5) and a DVR O with residue characteristic p, weight-one Katz sections with coefficients O/varpi^m carry T_p commuting with all prime-to-p Hecke and diamond operators. Its q-expansion is U+⟨p⟩V, including the second term even modulo varpi^m. Multiplication by an integral Hasse-power lift A_m≡1 mod varpi^m embeds the weight-one space into a sufficiently large weight k′; choose k′ so p^{k′−1}=0 in O/varpi^m and cyclotomic powers are 1 modulo varpi^m before replacing its T_p by U. Write φ(f)=A_mf. The two maps φ and φ∘T_p−U_high∘φ land in the same weight k′ and give doubling; the latter has q-expansion ⟨p⟩Vf. Here V denotes its coefficient-series formula, not a map of weight1 directly into weight k′. Then UV=id and theta V=0, while theta is injective in weights 1≤k≤p−2. The GL2 model in CG20 Lemma8.14 uses these identities. This node neither constructs a Galois representation nor plans the genus-two doubling theorem.

**Prerequisites.**

- [Frobenius and Verschiebung on forms](#R15-3-frobenius-verschiebung-on-expansions)
- [The theta operator, the filtration w(f), and their Hecke commutation relations](#R15-3-theta-operator-filtration-and-hecke-commutation)
- [A = E_{p-1} mod p for p >= 5, and the explicit level-n liftings of A required at p = 2, 3](#R15-3-deligne-congruence-and-the-explicit-p-equals-2-3-liftings)
- [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Import Gross’s torsion weight-one operator once its coefficient hypotheses are checked.
2. Choose a Hasse-power lift sufficiently divisible in weight and apply the exact T_p q formula.
3. Use q-expansion detection, UV=id and low-weight theta injectivity for the doubling checks.

**Acceptance checks.**

1. Modulo varpi^m with m>1 one cannot discard p^{k−1} merely from k≥2.
2. No dyadic weight-one injectivity follows from the empty interval 1≤k≤0.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), Proof of Theorem3.11, printed pp.327–328. Quotation: “The operator T p acts in this setting”. CG18 explicitly imports Gross §4 for the torsion weight-one action and checks the V term and sufficient weight divisibility.

- [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Proof of Lemma 8.14, local p.66. Quotation: “and T D U C hpiV in weight 1”. OCR renders T=U+⟨p⟩V; the surrounding proof distinguishes this from sufficiently high weight.

- [A result on modular forms in characteristic p](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf), II, Theorem and Corollaries, printed pp.55–56. Quotation: “increases degrees by”. Extends the theta construction and exact-filtration results to every characteristic and prime-to-p full level N ≥ 3.


<a id="R15-3-twisted-serre-duality-hecke"></a>

### Twisted Serre duality for Hecke actions

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/twisted-serre-duality-hecke`. Kind: **comparison**.

For CG18’s fine curve X_Δ(Q), extend O to contain ζ_NQ. Let Φ be Serre duality on H¹(X,ω^{2−n}(−C)⊗K/O), followed by the dual of the elliptic Kodaira–Spencer identification and the dual action of the constructed Hodge operator W_ζ. It gives H¹(X,ω^{2−n}(−C)⊗K/O)≅Hom_O(H⁰(X,ω^n),K/O), with Φ T_x=x^{1−n}T_x^∨Φ, the same identity for the allowed U_x and Φ⟨a⟩=⟨a⟩^∨Φ in the twisted convention. The bare Serre-duality map lacks this equivariance; for n=1 the scalar is 1. For the supersingular boundary of multiplication by A, Edixhoven Proposition7.3 obtains the corresponding ℓ^{k−1} factor after n=p+1−k and reduction.

**Prerequisites.**

- [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer)
- [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action)
- [Root-dependent Fricke operator](#R15-3-edixhoven-root-fricke-operator)
- `SchemeAndStackFoundations:SF.2/proper-adjunction`
- `SchemeAndStackFoundations:SF.2/trace`
- `SchemeAndStackFoundations:SF.3`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use proper coherent Serre duality with K/O torsion coefficients.
2. Apply isogeny compatibility of KS to compute the scalar of the transpose correspondence.
3. Conjugate the transpose action by w_ζ, as Edixhoven7.3; retain the arithmetic degree factor.

**Acceptance checks.**

1. At n=1 Φ is Hecke equivariant.
2. At n=2 the factor is x^−1, so the bare untwisted claim would fail.

**Source passages.**


- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.5, after Lemma3.7, printed pp.322–323. Quotation: “is not Hecke equivariant”. The next displayed composition includes KS and (w*)∨, and has the x^{1−n} scalar.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition7.3 and Lemma7.4, author DVI pp.24–25. Quotation: “The exact sequence”. DVI text of the supersingular sequence compatibility; the proof checks the isogeny degree factor. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-3-edixhoven-root-fricke-operator"></a>

### Root-dependent Fricke operator

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.3/edixhoven-root-fricke-operator`. Kind: **construction**.

Import the curve automorphism w_ζ of the fine Γ₁(NQ) problem from ModularCurvesPartII R14.1, after adjoining a primitive NQ-th root ζ. Its NQ-isogeny φ has kernel im α, the image of wα is ker φᵗ, and the isogeny pairing of α(1) and wα(1) equals ζ. Define the distinct Hodge operator W_ζ f(E,α)=φ* f(wE,wα) on sections of ω^n with coefficient module A, for every integral n. Descend to X_Δ(Q) in the allowed abelian diamond quotient. It commutes with coefficient maps, including K/O, and induces the contragredient operator on Hom_O(H⁰(ω^n),K/O) by precomposition. This cohomology/Hodge construction belongs here; the curve automorphism retains its supplier owner.

**API.**

- `TauCeti.GeometricHecke.rootFricke` (constructor): Section pullback by w_ζ followed by the universal isogeny map on ω^n.
- `TauCeti.GeometricHecke.rootFricke_coefficients` (functoriality): W_ζ commutes with natural maps of coefficient modules.
- `TauCeti.GeometricHecke.rootFricke_dual` (compatibility): The action on a functional λ is λ∘W_ζ.

**Unit tests.**

- `TauCeti.GeometricHecke.rootFricke_weight_zero` — degenerate: At weight0 the isogeny map on the trivial line is identity, so W_ζ is curve pullback.
- `TauCeti.GeometricHecke.rootFricke_torsion` — compatibility: The coefficient square commutes after O→O/varpi^m and after O→K/O; flatness of these coefficient modules is not assumed.
- `TauCeti.GeometricHecke.rootFricke_dual_evaluation` — computation: Evaluate the contragredient operator at a form: W_ζ^∨λ(f)=λ(W_ζ f). This is the action inserted in twisted Serre duality.

**Uses deriving the interface.**

1. Edixhoven Proposition7.3; CG18 §3.2.5; PAPER-CALEGARI-GERAGHTY-18/edixhoven-w-zeta: Provides the Hodge operator whose dual corrects Serre-duality Hecke equivariance.

**Prerequisites.**

- `ModularCurvesPartII:R14.1/atkin-lehner-involution`
- [Coefficient maps of geometric forms](#R15-1-coefficient-maps)
- [Fricke action on Hodge powers](#R15-2-fricke-hodge-action)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R153.lean`
- namespace: `TauCeti.GeometricHecke`

**Proof plan.**

1. Use the supplied curve map and its universal NQ-isogeny; invert its differential pullback when taking negative Hodge powers since NQ is a unit.
2. Tensor the differential map to weight n, compose with section pullback, and check the abelian diamond quotient descent.
3. Coefficient naturality follows at the sheaf level, including arbitrary torsion modules; define the dual action by precomposition.
4. Keep ζ in the base and do not infer a root-independent operator or transfer the curve involution identity to Hodge powers.

**Acceptance checks.**

1. Check every named test, retaining its moduli and coefficient hypotheses.

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), §7, between (7.2.1) and Proposition7.3, author DVI p.24. Quotation: “We let w act on modular forms”. Defines w* by the isogeny differential pullback, not merely by the curve action. DVI prose is quoted with word spacing restored.

- [Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf), 3.2.5, printed pp.322–323. Quotation: “is not Hecke equivariant”. The displayed correction uses the dual of w* on H⁰ with K/O dual coefficients.


## R15.4. Serre's local weight recipe

Coverage: **planned**. Remaining closure: Verify the Fontaine–Laffaille rank-two extension comparison, dyadic niveau2 descent and Ribet’s bad-dihedral input.

Planets: Serre weight (tame cases), Serre's weight-two criterion, Dyadic Serre weights 2 and 4.

<a id="R15-4-tame-inertia-characters-of-a-local-residual-representation"></a>

### The two tame characters of a local residual representation are of level 1 or of level 2 and then conjugate

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/tame-inertia-characters-of-a-local-residual-representation`. Kind: **comparison**.

Imported input for the local weight recipe (the general theorem is owned by the listed supplier). Let rho_p: G_p -> GL(V) = GL_2(F_p-bar) be continuous, G_p = Gal(Qbar_p/Q_p), I its inertia subgroup, I_p the wild inertia (the maximal pro-p subgroup of I) and I_t = I/I_p the tame quotient. On the semisimplification V^{ss} of V as a G_p-module, I_p acts trivially, so I_t acts and the action is diagonalizable, given by two characters phi, phi' of I_t. These characters are of level 1 or of level 2; if they are of level 2 then phi' = phi^p and phi = phi'^p. When phi, phi' are of level 2, V is irreducible.

**Hypotheses and conventions.**

1. V is 2-dimensional over F_p-bar and rho_p is continuous, so its image is finite
2. I_p acts trivially on V^{ss}: Serre cites [41], prop. 4 (Serre, Proprietes galoisiennes des points d'ordre fini des courbes elliptiques, Invent. Math. 15 (1972)) for this
3. the identification I_t = inverse limit of F_{p^n}^* is cited as [41], prop. 2
4. the fundamental characters and the identification of I_t are constructed in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/tame-inertia-characters, which also restates this dichotomy; the node here is the form in which Serre's recipe uses it

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases: the level-1/level-2 dichotomy selects the case of the recipe

**Prerequisites.**

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/tame-inertia-characters`
- `ArithmeticGaloisRepresentations:R01.2`

**Proof plan.**

1. Import the stated local representation/group-scheme result from its listed supplier nodes.
2. Apply it to the indicated branch of the Serre recipe, retaining coefficient-field and ramification-index hypotheses.

**Acceptance checks.**

1. Check that the tame characters of the p-torsion of a supersingular elliptic curve over Q_p are the two fundamental characters of level 2
2. Check that in the level-1 case the restriction of rho_p to I need not be semisimple, so the classification of V^{ss} does not by itself determine rho_p|I

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 1, section 2.1, printed p. 183. Quotation: “sont de niveau 1 ou 2”. Literal statement of Proposition 1; the OCR renders phi as 'p' and the exponents are lost, but the dichotomy and the conjugacy relation phi' = phi^p are the content quoted.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 1 and 2.2, printed p. 183. Quotation: “sous-espace stable de dimension”. The irreducibility argument in the level-2 case, retained as part of the node statement.


<a id="R15-4-serre-weight-tame-cases"></a>

### Serre's weight in the two tame cases, with the normalizations and the (0,0) shift

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`. Kind: **definition**.

Level-2 case (Serre 2.2): if phi, phi' are of level 2, write phi = psi^{a+pb} = psi^a psi'^b uniquely with 0 <= a, b <= p-1 using the two fundamental characters psi, psi' = psi^p of level 2; then b is different from a (else phi would be (psi psi')^a = chi^a, of level 1), phi' = psi^b psi'^a, and after permuting phi and phi' one may assume 0 <= a < b <= p-1; set k = 1 + pa + b. By Remark 2 of 2.2, for a = 0 one has (phi, phi') = (psi^b, psi'^b) with 1 <= b <= p-1 and k = 1 + b, so 2 <= k <= p; writing rho_p = chi^a tensor rho_p' the pair attached to rho_p' is (0, b-a) with k' = 1 + b - a, whence (2.2.5) k = k' + a(p+1). Level-1 tame case (Serre 2.3): if I acts semisimply on V through chi^a and chi^b, normalize 0 <= a, b <= p-2 and a <= b; set k = 1 + pa + b if (a,b) is not (0,0), and k = p if (a,b) = (0,0). The value k = p in the unramified case is a deliberate shift by p-1 away from the formula's value 1, chosen by Serre to avoid weight-one forms. In both cases the smallest possible value is k = 2 (Remarks 1).

**Hypotheses and conventions.**

1. the level-2 normalization is 0 <= a < b <= p-1; the level-1 normalization is 0 <= a <= b <= p-2 - the two ranges differ and must not be conflated
2. the level-1 case here assumes that the action of I on V is semisimple (I_p acts trivially), not merely that the tame characters of V^{ss} have level 1
3. the exceptional convention k = p applies exactly when I acts trivially, i.e. rho_p is unramified
4. the recipe depends only on ρ_p ⊗ F̄_p up to isomorphism: every clause refers to the characters of I_t on V^{ss} or to the semisimplicity of ρ_p|I, which do not change under extension of the coefficient field or conjugation

**API.**

- `TauCeti.SerreWeight.tameExponents` (data): The normalised exponents (a, b) of Serre 2.2 (level 2, 0 ≤ a < b ≤ p − 1) or 2.3 (level 1, 0 ≤ a ≤ b ≤ p − 2) of a tamely ramified ρ_p.
- `TauCeti.SerreWeight.serreWeight` (constructor): k(ρ_p) = 1 + pa + b in the tame cases, with k = p when ρ_p is unramified.
- `TauCeti.SerreWeight.serreWeight_twist` (compatibility): In the level-2 case, k(χ^a ⊗ ρ′_p) = k(ρ′_p) + a(p + 1) (Serre (2.2.5)).
- `TauCeti.SerreWeight.serreWeight_baseChange` (extensionality): k(ρ_p) depends only on the isomorphism class of ρ_p ⊗ F̄_p.

**Unit tests.**

- `TauCeti.SerreWeight.serreWeight_supersingular` — computation: For the p-torsion of a supersingular elliptic curve over ℚ_p (characters ψ, ψ′ of level 2, a = 0, b = 1) k = 2.
- `TauCeti.SerreWeight.serreWeight_unramified_shift` — degenerate: For ρ_p unramified, (a, b) = (0, 0) and k = p, not the formula's value 1.
- `TauCeti.SerreWeight.serreWeight_level_two_p5` — computation: p = 5, level 2 with (a, b) = (1, 3): k = 1 + 5 + 3 = 9 = k′ + a(p + 1) with k′ = 1 + (3 − 1) = 3.
- `TauCeti.SerreWeight.serreWeight_normalisation_nonexample` — non-example: Using the level-2 range 0 ≤ a < b ≤ p − 1 in the level-1 case would allow b = p − 1, whose character χ^{p−1} is trivial; the level-1 range stops at p − 2.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one: the weight k whose class mod p − 1 is read off from det ρ_p|I
2. AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon: k(ρ̄) in the refined conjecture
3. ClassicalSerreModularity R26–R27, R33: Serre's weight k(ρ̄) in Khare–Wintenberger's and Dieulefait–Pacetti's statements

**Prerequisites.**

- [The two tame characters of a local residual representation are of level 1 or of level 2 and then conjugate](#R15-4-tame-inertia-characters-of-a-local-residual-representation)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/SerreWeight.lean`
- namespace: `TauCeti.SerreWeight`

**Proof plan.**

1. Serre 2.2: uniqueness of the exponents (a,b) with 0 <= a,b <= p-1 for a level-2 character of I_t; the relation phi' = phi^p forces (2.2.2), so the pair is determined up to swapping phi and phi'.
2. Serre 2.2 Remark 2 (level-2 case): for a = 0 the formula reduces to k = 1 + b with 2 <= k <= p, and the general case is reduced to that one by twisting by chi^a, giving (2.2.5) k = k' + a(p+1). The source states this twisting formula in the level-2 case only.
3. Serre 2.3: the exponents a, b are only determined mod (p-1); the normalization 0 <= a, b <= p-2 and a <= b fixes them, and the (0,0) case is assigned k = p rather than k = 1.
4. Serre 2.3 Remark 3: twisting by successive powers of chi makes the resulting k run through a Tate theta-cycle.

**Acceptance checks.**

1. Check that Serre's (2.2.5), k = k' + a(p+1), matches the filtration shift of the twisted modular form, i.e. that theta raises weight by p+1 as in node theta-operator-filtration-and-hecke-commutation
2. Check a cyclotomic twist whose untwisted Serre weight lies outside [2, p+1], as required by the roadmap's conventions

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.2, formulas (2.2.1)-(2.2.5), printed pp. 183-184. Quotation: “Ceci fait, l'entier”. The weight formula in the level-2 case under the normalization 0 <= a < b <= p-1 recorded just above it in the source.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.3, Remark 2, printed p. 185. Quotation: “un comportement quelque peu exceptionnel”. Serre's own explanation that k = p in the unramified case is a convention, not a computation - the exact point at which Edixhoven's k(rho) differs.


<a id="R15-4-peu-et-tres-ramifie-and-the-wild-case-weight"></a>

### The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/peu-et-tres-ramifie-and-the-wild-case-weight`. Kind: **definition**.

Suppose I_p acts nontrivially on V. Then D = V^{I_p} is a line, stable under G_p, and G_p acts on V/D by a character theta_1 and on D by theta_2. Write theta_1 = chi^alpha eps_1, theta_2 = chi^beta eps_2 with eps_i unramified and normalize 0 <= alpha <= p-2 and 1 <= beta <= p-1 (the two exponents do NOT play symmetric roles). Put a = min(alpha, beta), b = max(alpha, beta). If beta is not alpha+1, set k = 1 + pa + b. If beta = alpha+1, then Gal(K_t/K_0) = (Z/pZ)^* with K_t = K_0(zeta_p), K/K_t is elementary abelian of exponent p and by Kummer theory K = K_t(x_1^{1/p}, ..., x_m^{1/p}) with x_i in K_0^*/K_0^{*p}; rho_p is called peu ramifie if v_p(x_i) = 0 mod p for all i (the x_i can be chosen to be units) and tres ramifie otherwise. In the peu ramifie case (2.4.8) k = 1 + pa + b = 2 + alpha(p+1) (here a = alpha, b = alpha+1); in the tres ramifie case (2.4.9) one adds p-1 (resp. 2 if p = 2), giving k = (alpha+1)(p+1) for p different from 2 and k = 4 for p = 2. Serre's Remark (1) states that the tres ramifie case forces eps_1 = eps_2 and then m = 1 or 2; Edixhoven Prop. 8.5 gives m = 1 or 2 for p > 2 but m = 1, 2 or 3 for p = 2, so Serre's remark is incomplete at p = 2.

**Hypotheses and conventions.**

1. I_p acts nontrivially; the line D = V^{I_p} being 1-dimensional and G_p-stable is what makes theta_1, theta_2 well defined
2. the normalization 0 <= alpha <= p-2, 1 <= beta <= p-1 is asymmetric and is part of the definition
3. the peu/tres dichotomy is a condition on the extension class, not on the semisimplification: it is read off from the valuations of the Kummer generators x_i in K_0^* = (Q_p^{nr})^*
4. for p = 2 the tres ramifie correction is +2, not +(p-1) = +1
5. the peu/très ramifiée dichotomy itself is defined in FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/peu-tres-ramifiee; this node adds the weight attached to each branch
6. Serre's Remark (1) that m = 1 or 2 in the très ramifiée case is false at p = 2, where m = 3 also occurs (Edixhoven Prop. 8.5; source issue AlgebraicModularFormsAndSerreWeights/E1); the weight does not depend on m

**API.**

- `TauCeti.SerreWeight.wildExponents` (data): The exponents (α, β), 0 ≤ α ≤ p − 2, 1 ≤ β ≤ p − 1, of the characters on V/D and D = V^{I_p}.
- `TauCeti.SerreWeight.serreWeight_wild` (characterisation): k = 1 + pa + b with a = min(α, β), b = max(α, β) if β ≠ α + 1; if β = α + 1, k = 2 + α(p + 1) when peu ramifiée and (α + 1)(p + 1) (p odd) or 4 (p = 2) when très ramifiée.
- `TauCeti.SerreWeight.serreWeight_wild_isomorphic` (extensionality): Isomorphic wild local representations have the same ordered exponents and peu/très branch, hence the same weight.

**Unit tests.**

- `TauCeti.SerreWeight.serreWeight_wild_same_ss` — non-example: For odd p, two extensions of 1 by χ with the same semisimplification, one peu and one très ramifiée, receive weights 2 and p+1; at p=2 they receive weights2 and4.
- `TauCeti.SerreWeight.serreWeight_wild_generic` — computation: p = 5, α = 1, β = 3 (β ≠ α + 1): k = 1 + 5·1 + 3 = 9.
- `TauCeti.SerreWeight.serreWeight_wild_p2` — degenerate: At p = 2 (α = 0, β = 1) the très ramifiée correction is +2, giving k = 4, not +(p − 1) = +1.

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p: the peu ramifiée branch with α = 0 is one of the k = 2 cases
2. AlgebraicModularFormsAndSerreWeights:R15.4/dyadic-weight-two-or-four: at p = 2 every wild ρ_p has α = 0, β = 1

**Prerequisites.**

- [The two tame characters of a local residual representation are of level 1 or of level 2 and then conjugate](#R15-4-tame-inertia-characters-of-a-local-residual-representation)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/peu-tres-ramifiee`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/SerreWeight.lean`
- namespace: `TauCeti.SerreWeight`

**Proof plan.**

1. Serre 2.4 constructs D, theta_1, theta_2 and normalizes the exponents (2.4.2)-(2.4.3).
2. In case beta = alpha+1 he identifies K_t = K_0(zeta_p) and asserts that the conjugation action of Gal(K_t/K_0) = (Z/pZ)^* on Gal(K/K_t) = rho_p(I_p) is the tautological one, then applies Kummer theory to obtain the generators x_i (2.4.6); neither step is argued in detail.
3. Definition (2.4.7): peu ramifie means all v(x_i) are divisible by p.
4. Formulas (2.4.8) and (2.4.9) give k in the two branches; Serre's Remark (1) derives eps_1 = eps_2 and m in {1,2} in the tres ramifie case from the conjugation action of G_p on rho_p(I_p); Remark (2) computes the conductors of the associated order-p characters in the two cases.
5. Edixhoven Prop. 8.5 (stated without separate proof after the computation 8.4) confirms Serre's Remark (1) that eps_1 = eps_2 - the unramified parts of theta_1 and theta_2, not theta_1 and theta_2 themselves, which differ by chi when p is odd - adds that all x_i can be chosen in Q_p^*, and corrects the value of m at p = 2: m = 1 or 2 for p > 2 and m = 1, 2 or 3 for p = 2.

**Acceptance checks.**

1. Run two local extensions with the same semisimplified inertia but different extension class through the definition and check that they receive different weights, as the roadmap requires
2. Check at p = 2 that the correction added in the tres ramifie case is 2 and not p-1 = 1, using Serre's explicit quadratic-field example

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.4, (2.4.6)-(2.4.7), printed p. 186. Quotation: “nous dirons que”. The literal definition of peu ramifie in terms of the p-divisibility of the valuations of the Kummer generators.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.4 (ii_2), formula (2.4.9), printed p. 187. Quotation: “On ajoute”. The tres ramifie correction with its explicit p = 2 value 2, which the roadmap requires to be recorded separately.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Proposition 8.5, p. 27 of the DVI. Quotation: “the integer”. Edixhoven's version of Serre's Remark (1): eps_1 = eps_2 for the unramified characters of (2.4.2), x_i in Q_p^*, and the extra value m = 3 at p = 2 that Serre's remark omits. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-4-determinant-parity-and-weight-mod-p-minus-one"></a>

### det rho_p restricted to inertia is chi^{k-1}, and the global parity relation eps(-1) = (-1)^k

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/determinant-parity-and-weight-mod-p-minus-one`. Kind: **lemma**.

For every case of Serre's recipe, det rho_p restricted to I equals chi^{k-1}; since chi restricted to I has order p-1, the class of k mod (p-1) is determined by det rho_p, and indeed by its restriction to inertia alone. Equivalently det rho_p = eps_p chi^{k-1} with eps_p an unramified F_p-bar^*-valued character of G_p, and when rho_p comes from a global rho the character eps_p is the p-component of eps, with eps_p(Frob_p) = eps(p). Globally, det rho is a character of (Z/pNZ)^*, decomposing as chi^h times eps with h = k-1 mod (p-1), det rho(Frob_l) = l^{k-1} eps(l) for l not dividing pN, and det rho(c) = (-1)^{k-1} eps(-1); the oddness hypothesis det rho(c) = -1 is therefore equivalent to eps(-1) = (-1)^k. For p=2 the determinant condition det ρ(c)=−1 is automatic: c²=1 forces its determinant to have order dividing 2 in characteristic 2. This makes no assertion that c itself is the identity.

**Hypotheses and conventions.**

1. the identity det rho_p|I = chi^{k-1} is verified case by case in the source, explicitly for the level-2 case and asserted analogous in the others
2. the global decomposition of det rho uses that the conductor of det rho divides pN, which follows by comparing the conductor formulas of rho and det rho
3. c denotes complex conjugation for a chosen embedding of Qbar into C; its image in (Z/pNZ)^* is -1

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon: ε(ρ̄) and the congruence det ρ̄ = ε χ̄^{k−1}

**Prerequisites.**

- [Serre's weight in the two tame cases, with the normalizations and the (0,0) shift](#R15-4-serre-weight-tame-cases)
- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)

**Proof plan.**

1. Serre 1.3 identifies det rho with a pair of characters (chi^h on (Z/pZ)^*, eps on (Z/NZ)^*) and derives (1.3.5) det(Frob_l) = l^h eps(l).
2. Serre Prop. 2 (2.5.1) computes det rho_p|I = chi^{k-1} in the level-2 case from phi phi' = psi^{a+b} psi'^{a+b} = chi^{a+b} and k-1 = pa+b = a+b mod (p-1), and states that the other cases are analogous.
3. Combining, h = k-1 mod (p-1), so (1.3.5) becomes (1.3.6) det(Frob_l) = l^{k-1} eps(l).
4. (1.3.7) det rho(c) = (-1)^{k-1} eps(-1), so oddness (1.3.8) is equivalent to (1.3.9) eps(-1) = (-1)^k.

**Acceptance checks.**

1. Check the parity rule eps(-1) = (-1)^k on a nebentype example with N > 1 and odd k
2. Check that the computation of det rho_p|I in the wild case beta = alpha+1 gives chi^{k-1} in both the peu and tres ramifie branches, i.e. that the tres ramifie shift by p-1 does not change the class mod p-1

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 2 (2.5.1) with its proof, printed p. 187. Quotation: “est déterminée par”. Literal statement that the determinant on inertia pins down k mod (p-1), which is the content of this node.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.3, (1.3.7)-(1.3.9), printed p. 182. Quotation: “On peut ainsi identifier”. Records that the oddness condition is vacuous at p = 2, a hypothesis distinction the roadmap's parity rule must keep.


<a id="R15-4-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction"></a>

### The Raynaud inputs to the k = 2 criterion, and why they degenerate exactly at p = 2

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction`. Kind: **comparison**.

Imported input for the local weight recipe (the general theorem is owned by the listed supplier). Let R be a discrete valuation ring of mixed characteristic with absolute ramification index e, fraction field K, residue characteristic p. (Prolongation and uniqueness, Raynaud Prop. 3.3.2) Let G be a K-scheme in F-vector spaces of rank q admitting a finite flat prolongation. (1) The maximal prolongation is characterized on equations of type (1) by v(delta_i) <= p-1 for all i and v(delta_i) < p-1 for some i. (2) If e < p-1 then the prolongation is unique up to isomorphism and is an F-vector space scheme. (3) If e = p-1, G is simple and R is henselian, then either the prolongation is unique or there are exactly two, one etale and one of multiplicative type, and in all cases they are F-vector space schemes. (Uniqueness for group schemes, Thm 3.3.3) If e < p-1, every finite commutative K-group scheme killed by a power of p has at most one finite flat prolongation over R. (Tame characters, Thm 3.4.1, Thm 3.4.3, Cor. 3.4.4, for R strictly henselian of mixed characteristic) Galois acts on an F-vector space scheme G(Kbar) of rank q by homotheties through a character psi = product psi_{i+j}^{v(delta)}; G prolongs to a finite flat group scheme over R if and only if psi = product psi_{i+j}^{n_j} with 0 <= n_j <= e for all j; and for a finite commutative K-group scheme killed by a power of p that prolongs, every Jordan-Holder quotient is an F-vector space scheme whose character has that form. By Remark 3.4.6 these results say nothing for e >= p-1, where every finite K-scheme in F-vector spaces prolongs. (Full faithfulness, Cor. 3.3.6) If e < p-1, every morphism of generic fibres of commutative finite flat R-group schemes killed by a power of p extends uniquely, the kernel and cokernel of the extension are flat over R, and Ext of finite flat group schemes injects into Ext of their generic fibres. Consequence for the Serre recipe: for R = Z_p^{nr} one has e = 1, so the constraint 0 <= n, n' <= 1 on the tame characters holds for every p (vacuously at p = 2), but the uniqueness statements 3.3.2(2) and 3.3.3 require 1 < p-1, i.e. p >= 3; at p = 2 one is exactly in the case e = p-1 of 3.3.2(3) and uniqueness of the finite flat model may fail.

**Hypotheses and conventions.**

1. Standing hypotheses vary: 3.3 assumes R of unequal characteristics (Prop. 3.3.1); 3.4 assumes R strictly henselian of unequal characteristics (Thm 3.4.1, Thm 3.4.3); Prop. 3.2.1 and Cor. 3.3.7 assume R strictly henselian
2. Prop. 3.3.2(2) and Thm 3.3.3 need e < p-1; Prop. 3.3.2(3) covers e = p-1 and additionally requires G simple and R henselian
3. Cor. 3.4.4 needs only that the finite commutative p-power torsion G admits a finite flat prolongation (with R strictly henselian); the bound on the exponents is 0 <= n_j <= e, so it is informative only for e < p-1 (Remark 3.4.6)
4. Cor. 3.3.6 needs e < p-1 and both group schemes commutative, finite, flat and killed by a power of p
5. Raynaud's theorems are owned by FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 (raynaud-uniqueness, raynaud-boundary-case, raynaud-tame-inertia); this node records the consequences at e = 1 that the recipe uses

**Prerequisites.**

- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-uniqueness`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-boundary-case`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/raynaud-tame-inertia`

**Proof plan.**

1. Import the stated local representation/group-scheme result from its listed supplier nodes.
2. Apply it to the indicated branch of the Serre recipe, retaining coefficient-field and ramification-index hypotheses.

**Acceptance checks.**

1. Check that with e = 1 Cor. 3.4.4 yields exactly Serre's four possibilities 1, psi, psi', psi psi' = chi for the pair of tame characters of a finite-at-p representation
2. Check at p = 2, e = 1 that Prop. 3.3.2.3 permits two prolongations (one etale, one multiplicative), so that no uniqueness step of the p >= 3 argument transfers verbatim

**Source passages.**


- [Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Proposition 3.3.2, parts 2 and 3, printed p. 267. Quotation: “il existe deux prolongements”. The uniqueness hypothesis is e < p-1; the e = p-1 case admits two prolongations. With R = Z_p^{nr} (e = 1) this is p >= 3 versus p = 2, which is the precise reason Serre's proof of his Proposition 4 is written only for p different from 2.

- [Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Corollary 3.4.4, printed p. 270. Quotation: “Soit H un quotient de Jordan-Hôlder”. The literal exponent bound 0 <= n_j <= e that Serre uses, with e = 1, to reduce to the four character possibilities in the proof of Proposition 4.

- [Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Corollary 3.3.6, printed p. 268. Quotation: “Tout morphisme de G dans H”. Confirms verbatim the statement that FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 undertakes to prove, including the flatness of kernel and cokernel and the Ext-injectivity.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 4, printed p. 190. Quotation: “Ce cas est traité”. Serre's printed citation is to 'th. 2.4.3' (confirmed on the page image of p. 190). Raynaud's Bull. SMF 102 (1974), which is Serre's [35], has no section 2.4: its section 2 consists of 2.1-2.3 and its numbered results there are 2.2.2, 2.2.3 and 2.3.1. The theorem that treats exactly this case - prolongability of the F-vector space scheme attached to a character psi - is Theorem 3.4.3, p. 270, which is therefore the plausible intended referent.

- [Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Theorem 3.3.3 and Remarks 3.3.4-3.3.5, printed p. 268. Quotation: “admet au plus un prolongement”. The uniqueness theorem cited by Edixhoven as [21], 3.3.3 in the p > 2 step of Prop. 8.2. Added by the reviewer.

- [Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf), Remark 3.4.6, printed p. 271. Quotation: “ne nous apprennent rien”. At p = 2 (e = 1 = p-1 over Z_2^{nr}) the exponent bound is vacuous and every F-vector space scheme prolongs over a strictly henselian R. Added by the reviewer.


<a id="R15-4-finite-at-p-equals-peu-ramifie"></a>

### For a residually reducible local representation with unramified diagonal twists, peu ramifie is equivalent to admitting a finite flat model

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/finite-at-p-equals-peu-ramifie`. Kind: **comparison**.

Imported input for the local weight recipe (the general theorem is owned by the listed supplier). Let F be a finite extension of F_p and rho_p: G_p -> GL_2(F) continuous of the form (8.1.1) rho_p = (chi eps_2, *; 0, eps_1) with eps_1 and eps_2 unramified F^*-valued characters of G_p (Edixhoven's notation; this packet earlier wrote theta_i for eps_i). Let V_{Q_p} be the F-vector space scheme over Q_p attached to rho_p and D the integral closure of Z_p in the maximal unramified extension K of Q_p inside Qbar_p. Then (Prop. 8.2, for every prime p including p = 2) the following are equivalent: rho_p is peu ramifie in Serre's sense (2.4.7); V_{Q_p} extends to a finite flat F-vector space scheme over D; over Z_p; extends to a finite flat group scheme over D; over Z_p. When these hold one says rho_p is finite. Moreover (8.4) the Frobenius-compatibility of the extension class forces, for the valuations alpha_{i,j} of the Kummer classes, either all alpha_{i,j} = 0 (peu ramifie) or lambda = 1 and eps = eps_1 eps_2^{-1} trivial; hence (Prop. 8.5) tres ramifie forces eps_1 = eps_2. In the peu ramifie case with p > 2 (Prop. 8.6), with lambda = (eps_1 eps_2^{-1})(Frob_p), s = [F_p(lambda):F_p], n the order of lambda and f the minimal polynomial of lambda, the Kummer classes satisfy [x_{i,j}] = (sigma^#)^i [x_{0,j}] and their images y under D^*/D^{*p} = U/U^p = F_p-bar satisfy f(Frob_p)(y) = 0, an equation all of whose p^s solutions lie in F_{p^n}; conversely any such data come from a peu ramifie rho_p.

**Hypotheses and conventions.**

1. rho_p is of the specific shape (8.1.1): upper triangular with diagonal characters chi eps_2 and eps_1, both eps_i unramified - Serre's case beta = alpha+1 after twisting to alpha = 0
2. the equivalence of the five conditions holds for all p; the explicit description 8.6 assumes p > 2 because it uses D^*/D^{*p} = U/U^p
3. the proof of (4) => (2),(3),(5) uses the maximal finite flat prolongation cited as [21], 2.2.3 (Raynaud 1974, Cor. 2.2.3, not read) and the unique extension of the F-action and of the Galois descent data to it; the proof of (1) <=> (2) uses, for p > 2, Raynaud [21], 3.3.3 (at most one finite flat prolongation when e < p-1) and, for p = 2, a separate functoriality argument

**Prerequisites.**

- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)
- [The Raynaud inputs to the k = 2 criterion, and why they degenerate exactly at p = 2](#R15-4-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-kummer-extensions`

**Proof plan.**

1. Import the stated local representation/group-scheme result from its listed supplier nodes.
2. Apply it to the indicated branch of the Serre recipe, retaining coefficient-field and ramification-index hypotheses.

**Acceptance checks.**

1. Check that the count p^s of peu ramifie classes in Prop. 8.6 matches the size of the corresponding space of unramified Kummer classes in a small example, for instance F = F_p and lambda = 1 (s = 1, p classes)
2. Check that shape (8.1.1) is used in the proof: the exact sequence 8.3.1 with sub F^D and quotient F requires the characters on the diagonal to be chi eps_2 and eps_1 with eps_i unramified

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 8.1 and Proposition 8.2, p. 26 of the DVI. Quotation: “The following conditions are equivalent”. The hypothesis that theta_1, theta_2 are unramified and the literal list of equivalent finiteness conditions. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 8.4, equations 8.4.3, p. 27 of the DVI. Quotation: “From this we conclude”. The valuation dichotomy of 8.4.3, which gives Prop. 8.5 (tres ramifie forces eps_1 = eps_2); the source writes 'lambda = 1 and eps is trivial', eps being the unramified character, not chi. The drafter's 'chi is trivial' and its use as the proof of 8.2 were corrected by the reviewer. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), End of 8.3, p. 27 of the DVI. Quotation: “This completes the proof”. The actual location of the proof of (1) <=> (2), including the explicit p = 2 argument. Added by the reviewer. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-4-weight-two-iff-finite-flat-at-p"></a>

### k = 2 if and only if det rho_p|I = chi and rho_p is finite at p

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/weight-two-iff-finite-flat-at-p`. Kind: **theorem**.

Proposition 3 of the source: k = 2 holds exactly when rho_p restricted to I is either given by the two fundamental characters psi, psi' of level 2, or is upper triangular with diagonal (chi, 1) and with I_p acting trivially or peu ramifie. Proposition 4: for rho_p with values in GL_2(F_p), k = 2 if and only if (2.8.3) det rho_p|I = chi and (2.8.4) rho_p is finite at p, i.e. the etale (p,p)-type group scheme over Q_p defined by rho_p extends to a finite flat group scheme over Z_p. The condition (2.8.3) is equivalent to k = 2 mod (p-1). The general F_q-coefficient case requires Raynaud's F-vector-space schemes rather than group schemes of type (p,p).

**Hypotheses and conventions.**

1. Proposition 4 as proved is stated for rho_p valued in GL_2(F_p); the source says that for general coefficients one must work with Raynaud F-vector space schemes
2. the implication (2.8.3) and (2.8.4) imply k = 2 uses Raynaud [35] cor. 3.4.4 to constrain the tame characters to psi^n psi'^{n'} with 0 <= n, n' <= 1, and Raynaud [35] prop. 3.3.2 for uniqueness of the finite flat prolongation
3. the converse implication (k = 2 implies finite at p) is written without a restriction on p; its level-2 branch cites 'Raynaud [35], th. 2.4.3', a result number that does not exist in Raynaud 1974 (plausibly Theorem 3.4.3, see node raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction), and its level-1 branch is only sketched as a direct construction over a finite etale extension R of Z_p followed by descent
4. Serre restricts to p different from 2 only in case (ii) {phi, phi'} = {1, chi} of the direction (2.8.3) + (2.8.4) => k = 2, saying the p = 2 case is 'un peu different, mais se traite de facon analogue' without writing it out
5. the Galois-side finite-flat criterion is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-weight-two-criterion (p odd); combined with Proposition 3 (the k = 2 rows of the recipe) it gives Proposition 4; the misprinted reference "th. 2.4.3" in Serre's proof is FiniteFlatGroupsAndIntegralPadicHodgeTheory/E12

**Uses deriving the interface.**

1. ClassicalSerreModularity R26–R27: k(ρ̄) = 2 iff finite at p with det|_{I_p} = χ̄ (Khare–Wintenberger and Dieulefait–Pacetti)
2. EllipticCurveModularity R29: the weight of E[p] for p of good reduction

**Prerequisites.**

- [Serre's weight in the two tame cases, with the normalizations and the (0,0) shift](#R15-4-serre-weight-tame-cases)
- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)
- [det rho_p restricted to inertia is chi^{k-1}, and the global parity relation eps(-1) = (-1)^k](#R15-4-determinant-parity-and-weight-mod-p-minus-one)
- [The Raynaud inputs to the k = 2 criterion, and why they degenerate exactly at p = 2](#R15-4-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction)
- [For a residually reducible local representation with unramified diagonal twists, peu ramifie is equivalent to admitting a finite flat model](#R15-4-finite-at-p-equals-peu-ramifie)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/finite-flat-weight-two-criterion`

**Proof plan.**

1. Proposition 3 is stated to follow immediately from the definitions of section 2 (no further proof is given).
2. Serre reduces (2.8.3) plus finiteness to four possible pairs {phi, phi'} using Raynaud cor. 3.4.4 and the constraint phi phi' = chi, leaving the cases {psi, psi'} and {1, chi}.
3. The case {psi, psi'} gives (2.8.1) directly.
4. In the case {1, chi} one takes the unique finite flat prolongation J over Z_p (Raynaud prop. 3.3.2), which is reducible, and gets an exact sequence 0 -> A -> J -> B -> 0 of finite flat group schemes of order p with one of A, B etale and the other multiplicative; after a finite etale extension R of Z_p the sequence becomes 0 -> Z/pZ -> J -> mu_p -> 0 or 0 -> mu_p -> J -> Z/pZ -> 0.
5. In the first case the identity component splits the extension and I_p acts trivially; in the second the Kummer sequence gives a class u in R^*/R^{*p} with u a unit, so K/K_t is unramified or peu ramifie; either way k = 2.
6. For the converse, the level-2 branch is Raynaud [35] thm. 2.4.3 and the level-1 branch is a direct construction over an auxiliary finite etale extension R of Z_p followed by descent to Z_p.

**Acceptance checks.**

1. Check that a tres ramifie extension of 1 by chi is not finite at p and has k = p+1 (p odd) or k = 4 (p = 2), so the criterion genuinely separates extension classes
2. Check the criterion against the p-torsion of an elliptic curve with good reduction at p, where finiteness is automatic and k = 2

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proposition 4 and its proof, printed pp. 189-190. Quotation: “On a k = 2 si et seulement si”. Literal statement of the two conditions characterizing k = 2.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), Proof of Proposition 4, printed p. 190. Quotation: “en nous bornant, pour simplifier”. The source does not write out the p = 2 case of case (ii); this packet records that as an unresolved boundary rather than as an available input. The inequality sign, lost in the text layer, was restored from the page image by the reviewer.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.8, before Proposition 4, printed p. 189. Quotation: “schémas en Fq vectoriels”. The coefficient hypothesis of Proposition 4 and the pointer to Raynaud F-vector space schemes for general F_q coefficients.


<a id="R15-4-edixhoven-weight-k-rho-and-its-comparison-with-serre-k"></a>

### Edixhoven's k(rho_p), its exact difference from Serre's k_rho, and the minimality theorem

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/edixhoven-weight-k-rho-and-its-comparison-with-serre-k`. Kind: **comparison**.

Edixhoven defines k(rho_p) (Def. 4.3) by the same case division and the same normalizations as Serre, except in two places: in the tame level-1 case (rho_p|I_p trivial, rho_p|I = diag(chi^a, chi^b), 0 <= a <= b <= p-2, the same normalization as Serre's 2.3) he sets k(rho_p) = 1 + pa + b also for (a,b) = (0,0), so k(rho_p) = 1 for rho_p unramified; and in the wild case (0 <= alpha <= p-2, 1 <= beta <= p-1) the additional p-1 is added exactly when chi^{beta - alpha} = chi and rho_p tensor chi^{-alpha} is not finite at p (so at p = 2 the addition is 1, not Serre's 2). Remark 4.4: always k(rho) <= k_rho, and they differ in exactly two cases - (i) rho_p|I_p trivial with a = b = 0, where k(rho) = 1 and k_rho = p; (ii) p = 2, rho_p|I_p nontrivial, alpha = 0, beta = 1 and rho_p not finite at p, where k(rho) = 3 and k_rho = 4. The existence and minimality theorem 4.5 is imported from SerreWeightAndLevelOptimisation R20.3, not proved by this comparison of local functions.

**Hypotheses and conventions.**

1. k(rho_p) is defined for a local representation and depends only on rho_p; the 'not finite at p' clause refers to the finiteness notion of section 8 of the source, i.e. existence of a finite flat model
2. Thm 4.5 assumes rho already modular of some type (N, k, eps) with p not dividing N; it is a weight-optimisation statement, not an existence statement
3. the minimality assertion and the k(rho) form of the conclusion require rho to be non-exceptional; the added end-of-introduction note states that for p > 2 the Coleman-Voloch result removes this condition
4. the proof depends on Gross [10] whose Hecke-equivariance compatibilities on pages 504-505 were, at the time of writing, unchecked; Coleman verified the map in (16.6)

**Prerequisites.**

- [Serre's weight in the two tame cases, with the normalizations and the (0,0) shift](#R15-4-serre-weight-tame-cases)
- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)
- [For a residually reducible local representation with unramified diagonal twists, peu ramifie is equivalent to admitting a finite flat model](#R15-4-finite-at-p-equals-peu-ramifie)

**Proof plan.**

1. Edixhoven Def. 4.3 gives the case division; Remark 4.4 compares it with Serre's k_rho and isolates the two discrepancies.
2. Proof of Thm 4.5: by Thm 3.4 there is alpha with rho tensor chi^{-alpha} isomorphic to rho_{f_1} for an eigenform f_1 of type (N, k_1, eps) with k_1 <= p+1 and w(f_1) = k_1; the local results Thms 2.5, 2.6, 2.8 and Prop. 2.7 then pin down k_1 and alpha in terms of rho|G_p.
3. The desired f is obtained by untwisting: apply theta alpha times and divide by the Hasse invariant as often as possible.
4. The main complication is that k_1 is not unique: a companion form of weight p+1-k_1 may exist (Gross, Thm 2.9) or f_1 may be a multiple of the Hasse invariant (only for k_1 = p or p+1; the k_1 = p+1 case is Mazur's Thm 2.8, which is where 'finite at p' enters).
5. Minimality: given g of type (M, k, eps') with p not dividing M, the existence part gives f of type (M, k(rho), eps') with the same eigenvalues away from p; if T_p^* f = 0 = T_p^* g the q-expansions differ by a constant and k(rho) = w(f) = w(g) <= k; if T_p^* g is nonzero then k <= p+1 by Gross [10], Proposition 4.12 (not read) and 'a case by case check' (not displayed) gives k(rho) <= k.
6. Existence in the tame level-1 case alpha = beta = 0 uses Gross's Thm 2.9 (companion forms) and the non-exceptional hypothesis; the added end-of-introduction note says that for p > 2 the Coleman-Voloch theorem removes the 'not exceptional' condition from all statements of Thm 4.5.

**Acceptance checks.**

1. Check the two discrepancy cases of Remark 4.4 explicitly: an unramified rho_p (k(rho) = 1, k_rho = p) and a p = 2 non-finite extension with alpha = 0, beta = 1 (k(rho) = 3, k_rho = 4)
2. Check that the recipe is invariant under enlarging the coefficient field and under isomorphism of rho_p: every clause refers to rho_p|I, to rho_p|I_p, or to the finiteness at p of rho_p tensor chi^{-alpha}, which is a property of the G_p-representation

**Source passages.**


- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Definition 4.3 case 2(b), p. 10 of the DVI. Quotation: “not finite at”. Literal statement of the extension-sensitive clause, phrased through 'finite at p' rather than through Serre's Kummer-valuation condition. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Remark 4.4.1, p. 10 of the DVI. Quotation: “they differ only in two cases”. The exact comparison between the two weight recipes, including the p = 2 discrepancy, which the roadmap requires the local table to record. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Introduction, p. 2 of the DVI. Quotation: “have not been checked”. Records the unverified Hecke-compatibility inputs from Gross that Theorem 4.5 depended on at the time of writing; the added note limits the damage to p = 2. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-4-dyadic-weight-two-or-four"></a>

### At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/dyadic-weight-two-or-four`. Kind: **theorem**.

Let ρ_2 : G_{ℚ₂} → GL₂(F̄₂) be continuous. Then Serre's weight k(ρ_2) is 2 or 4, and k = 4 exactly when I_2 acts nontrivially on V (the wild case) and ρ_2 is très ramifiée (Serre 2.6). Moreover: (a) if I_2 acts trivially on V then ρ_2 is unramified or its tame characters are the fundamental characters of level 2, and k = 2; (b) in the wild case, ρ_2 is finite at 2 if and only if it is peu ramifiée (Edixhoven Prop. 8.2, valid at p = 2), so k = 2 there iff ρ_2 is finite; (c) an unramified ρ_2 is finite (it comes from a finite étale group scheme). For ρ_2 = (1 u; 0 1) with u cutting out ℚ₂(√d): k = 2 for d ∈ {5, −1, −5} and k = 4 for d ∈ {±2, ±10}. Khare–Wintenberger state the full dichotomy "k(ρ̄) = 2 iff ρ̄ is finite at 2"; its level-2 tame case needs finiteness over ℤ₂ of the prolongation that Raynaud constructs over ℤ₂^nr, which is recorded as a gap.

**Hypotheses and conventions.**

1. p = 2: χ̄ is trivial, so the level-1 tame characters are trivial and the wild normalisation forces α = 0, β = 1
2. the très ramifiée correction at p = 2 is +2 (Serre (2.4.9))
3. the level-2 tame case: Raynaud's prolongation (Theorem 3.4.3, over a strictly henselian base) and its descent to ℤ₂ when uniqueness can fail at e = p − 1 = 1 are not written in any source read (gap)

**Uses deriving the interface.**

1. ClassicalSerreModularity R27.5: the dyadic weight claim k(ρ̄′₂) = 2 and Theorem 9.1
2. ClassicalSerreModularity R33.5: the weight-2 lifts at p = 2 used by Dieulefait–Pacetti §3

**Prerequisites.**

- [Serre's weight in the two tame cases, with the normalizations and the (0,0) shift](#R15-4-serre-weight-tame-cases)
- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)
- [For a residually reducible local representation with unramified diagonal twists, peu ramifie is equivalent to admitting a finite flat model](#R15-4-finite-at-p-equals-peu-ramifie)
- [The Raynaud inputs to the k = 2 criterion, and why they degenerate exactly at p = 2](#R15-4-raynaud-prolongation-input-and-the-e-equals-p-minus-one-obstruction)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/dyadic-finite-flat-dichotomy`

**Proof plan.**

1. Tame case: I_2 acts on V^{ss} through characters of I_t of level 1 or 2 (R15.4/tame-inertia-characters-of-a-local-residual-representation); level-1 characters are trivial at p = 2, and a tame action is semisimple, so either ρ_2 is unramified (k = p = 2 by the shift of 2.3) or the characters are ψ, ψ′ of level 2 with (a, b) = (0, 1) and k = 1 + 0 + 1 = 2.
2. Wild case: 0 ≤ α ≤ p − 2 = 0 and 1 ≤ β ≤ p − 1 = 1 give α = 0, β = 1 = α + 1, so k = 2 + 0 = 2 if peu ramifiée and 4 if très ramifiée (R15.4/peu-et-tres-ramifie-and-the-wild-case-weight).
3. Finiteness: in the wild case R15.4/finite-at-p-equals-peu-ramifie (Edixhoven 8.2 for every p); the unramified case is étale; the example is FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5/dyadic-finite-flat-dichotomy and Serre's Exemple in 2.6.

**Acceptance checks.**

1. Serre's example (2.6): ℚ₂(√5) unramified and ℚ₂(√−1), ℚ₂(√−5) of discriminant (4) give k = 2; ℚ₂(√±2), ℚ₂(√±10) of discriminant (8) give k = 4.
2. The 2-torsion of a supersingular elliptic curve with good reduction at 2 is the level-2 tame case, with k = 2 and a finite flat model (its Néron model).

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.6, printed p. 188. Quotation: “Pour p = 2, on a k = 2 si l'action de Ip est triviale, ou peu ramifiée, et k = 4 si”. The p = 2 values of the recipe and Serre's quadratic-field example.

- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 (authors' preprint). Quotation: “In the case of p = 2, the values of k(ρ̄) can either be 2 or 4, with the former if and only if ρ̄ is finite at 2.”. The dichotomy as Khare–Wintenberger use it.


<a id="R15-4-recipe-well-definedness-and-twisting"></a>

### Well-definedness of the local weight recipe

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/recipe-well-definedness-and-twisting`. Kind: **theorem**.

The combined tame and wild tables define a unique integer k(ρ_p)≥2 on the isomorphism class of a continuous two-dimensional residual local representation. Inertia characters are normalized with different ranges in niveau1 and niveau2; the wild branch keeps the stable line V^{I_p}, ordered quotient/submodule exponents and its actual extension class. Permuting niveau2 fundamental characters, changing eigenbasis, changing Kummer generators, unramified twisting and extending the coefficient field leave the recipe unchanged. Cyclotomic twisting is computed by reducing exponents to the prescribed ranges and reapplying the entire table; it is not globally the addition a(p+1), though that formula holds in Serre2.2.5 before crossing the normalization boundary. Some cyclotomic twist has weight at most p+1, by Serre2.7.

**Prerequisites.**

- [Serre's weight in the two tame cases, with the normalizations and the (0,0) shift](#R15-4-serre-weight-tame-cases)
- [The wildly ramified case: the peu ramifie / tres ramifie dichotomy and the weight it produces](#R15-4-peu-et-tres-ramifie-and-the-wild-case-weight)
- `ArithmeticGaloisRepresentations:R01.2`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R154.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Uniqueness of tame characters fixes the unordered niveau2 pair; sorting the distinct digits fixes its value.
2. In the wild case V^{I_p} canonically fixes the order of the two characters; the imported unit criterion is basis-independent.
3. Check cyclotomic twisting by finite case analysis, including wraparound and the unramified and dyadic shifts.

**Acceptance checks.**

1. For p=5 the niveau2 pair (1,3) gives 9, while (0,2) gives 3 and 9=3+6.
2. Two nonsplit extensions with the same semisimplification can have distinct weights 2 and p+1 (4 at p=2).

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.7–2.9, printed pp.188–191. Quotation: “résulte immédiatement des définitions”. Local consequences of the explicit recipe, rather than a definition by modularity.


<a id="R15-4-fontaine-laffaille-weight-comparison"></a>

### Fontaine–Laffaille weight comparison

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/fontaine-laffaille-weight-comparison`. Kind: **comparison**.

Let p≥3, 1≤r≤p−2, and ρ_p be the generic-fibre representation of a rank-two residual Fontaine–Laffaille module over the unramified base ℤ_p with labeled Hodge weights {0,r}, under the supplier’s contravariant U_S functor, with HT(χ_cyc)=+1 and positive filtration degree r contributing χ^r. The requested rank-two supplier classification gives either a reducible inertia representation with semisimplification χ^r⊕1, with ordered wild exponents α=0, β=r when wild inertia is nontrivial and a finite/peu extension when r=1, or niveau2 fundamental characters ψ^r,ψ′^r. The ordered wild line is part of that input: semisimplification alone does not give this conclusion. Applying the complete local table gives k(ρ_p)=r+1. At r=0 an unramified representation instead has Serre’s classical weight p; r=p−1 and p=2 are outside this comparison. No use of a weight defined by the existence of a modular form enters.

**Prerequisites.**

- [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting)
- [k = 2 if and only if det rho_p|I = chi and rho_p is finite at p](#R15-4-weight-two-iff-finite-flat-at-p)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-functor-torsion`
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-tame-inertia`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R154.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Import the stated contravariant U_S functor and simple-object inertia dictionary; the rank-two extension-sensitive classification/finite-flat comparison is requested explicitly.
2. For niveau2 normalize the digits (0,r); for reducible inertia normalize (0,r).
3. In the r=1 wild branch invoke finite⇔peu; evaluate the recipe.

**Acceptance checks.**

1. At p=5,r=2 both inertia cases give k=3.
2. At r=0 the classical unramified shift prevents claiming k=1.

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.7–2.9, printed pp.188–191. Quotation: “résulte immédiatement des définitions”. Local consequences of the explicit recipe, rather than a definition by modularity.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), Theorems2.5–2.6 and Definition4.3, author DVI pp.5–6,10. Quotation: “Theorem. (Fontaine)”. Edixhoven’s geometric theorem for modular forms is a related comparison, not a proof of the requested Fontaine–Laffaille module classification. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.


<a id="R15-4-semistable-elliptic-torsion-weight"></a>

### Serre weight of semistable elliptic torsion

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/semistable-elliptic-torsion-weight`. Kind: **application**.

For E/ℚ_p semistable, k(E[p])=2 if E has good reduction. For multiplicative reduction at odd p, k(E[p])=2 when p divides v_p(j_E), and p+1 otherwise. At p=2 the latter value is 4, by the dyadic très-ramifiée correction, rather than substituting p+1=3. The calculation uses the actual Tate extension class; an unramified quadratic twist for nonsplit reduction does not change inertia or the recipe.

**Prerequisites.**

- [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting)
- [k = 2 if and only if det rho_p|I = chi and rho_p is finite at p](#R15-4-weight-two-iff-finite-flat-at-p)
- [At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case](#R15-4-dyadic-weight-two-or-four)
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5`
- `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R154.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Good reduction supplies the finite-flat torsion model and cyclotomic determinant.
2. For a Tate curve, the extension class is q_E and v(q_E)=−v(j_E).
3. Apply the imported unit criterion and the wild table, handling p=2 separately.

**Acceptance checks.**

1. For p=5 and v(q)=1 the weight is 6; for v(q)=5 it is 2.
2. At p=2 and odd v(q), the weight is 4.

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 2.9 Proposition5 and its proof, printed p.191. Quotation: “Si E a bonne réduction”. The Tate Kummer class gives the multiplicative valuation criterion; the p=2 correction follows from §2.4/2.6, not the displayed p+1 formula alone.


<a id="R15-4-bad-dihedral-normalized-weight-application"></a>

### Bad-dihedral normalized weight constraint

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.4/bad-dihedral-normalized-weight-application`. Kind: **application**.

Let ρ̄ be S-type, p≥3, with normalized classical weight 2≤k(ρ̄)≤p+1. If ρ̄|G_{ℚ(μ_p)} is reducible, then k(ρ̄)=(p+1)/2 or (p+3)/2. Import the R01.4 identification with bad dihedrality, where p*=(-1)^((p−1)/2)p and bad dihedral means irreducible globally but reducible over ℚ(√p*). Under this identification the niveau1 branch satisfies p=2k−1, and the niveau2 branch p=2k−3. This is a local-weight application with no modularity hypothesis; it applies only after the stated normalization.

**Prerequisites.**

- [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting)
- `ArithmeticGaloisRepresentations:R01.4`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R154.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the imported bad-dihedral image identification; its proof and quadratic field are not owned here.
2. The projective inertia image has order2; exclude the unramified case using ramification of the quadratic field.
3. In niveau1 the character ratio has order2 and forces k−1=(p−1)/2. In niveau2 it forces k−1=(p+1)/2.
4. Use normalized bounds to select these integer values; retain Ribet’s cited input as a source gap.

**Acceptance checks.**

1. At p=5 the permitted weights are3 and4; niveau2 gives4 and niveau1 gives3.
2. No extrapolation to p=2 or to unnormalized cyclotomic twists.

**Source passages.**


- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Lemma6.2(ii), preprint p.11. Quotation: “then ρ̄ has weight either”. States the normalized two-value consequence for S-type and p≥3.

- [A simplified proof of Serre’s conjecture](https://arxiv.org/pdf/2108.07577v2), Lemma1.14 and proof, pp.8–9. Quotation: “Then either p = 2k”. Separates niveau2 (2k−3) and niveau1 (2k−1); proof also refers to Ribet Proposition2.2.


## R15.5. Eigenforms and characteristic-zero lifting

Coverage: **planned**. Remaining closure: Close the existing algebra API integration gap and the exact character/level Katz shift-to-reduction criterion.

Planets: Eigencharacter, Deligne-Serre lifting, Modular eigensystem lifting.

<a id="R15-5-adjoin-invariant-line"></a>

### The generated algebra preserves the residual line

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/adjoin-invariant-line`. Kind: **lemma**.

Let O be a commutative ring, k an O-algebra that is a field, M an O-module, and T an arbitrary indexed family in End_O(M). If each induced T_i preserves k f inside k tensor_O M, then every element of H=O[T_i] preserves k f. No finiteness, commutativity of the family, or nonzero condition on f is needed for this preservation assertion.

**Prerequisites.**

- `mathlib:Algebra.adjoin_le`
- `mathlib:TensorProduct.AlgebraTensorModule.map_tmul`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.adjoin_invariant_line`

**Proof plan.**

1. The endomorphisms whose reductions preserve k f form an O-subalgebra: check constants, addition, multiplication and negation using tensor functoriality.
2. Each T_i belongs to that subalgebra. Apply Algebra.adjoin_le.

**Acceptance checks.**

1. The zero line is preserved; preservation alone does not define a unique eigencharacter.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “engendrée”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-eigencharacter-of-invariant-line"></a>

### The character of a nonzero invariant line

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/eigencharacter-of-invariant-line`. Kind: **construction**.

Let R be a commutative ring, k a field over R, H an R-algebra, V a compatible k-vector space and R-module, and r:H -> End_k(V) an R-algebra map. Given f != 0 and stability of k f under r(H), construct the unique R-algebra map chi:H -> k satisfying r(h)f=chi(h)f for every h.

**API.**

- `eigencharacter_apply` (characterisation): For every h, r(h)f=eigencharacter(r,f)(h) f.
- `eigencharacter_unique` (extensionality): Any R-algebra map psi with r(h)f=psi(h)f for every h equals eigencharacter(r,f).
- `eigencharacter_rescale` (compatibility): Replacing f by u f for a nonzero u in k, with the induced stability witness, does not change the character.

**Unit tests.**

- `scalar_character_test` — computation: For H=k and a scalar action r(a)x=a x on V=k, the character obtained from f=1 evaluates at a as a.
- `nilpotent_character_test` — degenerate: Every nilpotent h in H maps to zero under the constructed character, including when r(h) is a nonzero nilpotent operator.
- `diagonal_character_test` — non-example: For H=k x k acting diagonally on V=k x k, the lines through (1,0) and (0,1) produce different characters: at (1,0) their values are 1 and 0. The constructor must retain the chosen line.

**Uses deriving the interface.**

1. Deligne-Serre 6.11, character of the residual eigenline: Apply with k the residue field and r the scalar-extended action of the generated operator algebra.
2. AlgebraicModularFormsAndSerreWeights:R15.5/horizontal-prime: The character kernel is the maximal ideal under which a generic-character branch is selected.

**Prerequisites.**



**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.eigencharacter`

**Proof plan.**

1. For each h choose its scalar on f. Scalar cancellation against f != 0 gives uniqueness.
2. Evaluate the equations for zero, one, sums, products and R-scalars on f. Cancellation proves the algebra-map laws. The output is the existing AlgHom type, not a new character structure.

**Acceptance checks.**

1. The scalar, nilpotent and diagonal tests distinguish the intended character and retain its dependence on the nonzero invariant line.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “l'homomorphisme”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-horizontal-prime"></a>

### A generic prime below the residual character

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/horizontal-prime`. Kind: **lemma**.

Let O be a DVR, k its residue field, H a finite free commutative O-algebra, and chi:H -> k an O-algebra map. There exists a prime P contained in ker(chi) such that P contracts to zero in O.

**Prerequisites.**

- `mathlib:Algebra.HasGoingDown.of_flat`
- `mathlib:Ideal.exists_ideal_le_liesOver_of_le`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.horizontal_prime`

**Proof plan.**

1. The restriction of chi to O is the residue map, so chi is surjective, ker(chi) is maximal and contracts to the maximal ideal m of O.
2. Freeness gives flatness. Apply going down to 0 <= m and ker(chi).

**Acceptance checks.**

1. A purely vertical algebra O/m has no such prime; flatness must not be omitted.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “idéal premier”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-character-valuation-lift"></a>

### Lift a character to a dominating DVR

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/character-valuation-lift`. Kind: **lemma**.

Let O be a DVR with fraction field K, H a finite free commutative O-algebra and chi:H -> k its residue-valued O-algebra character. There exist a finite field extension L/K, a DVR V inside L with fraction field L, an embedding i:O -> V compatible with K -> L, an embedding j:k -> k_V, and psi:H -> V with psi restricted to O equal to i and residue_V composed with psi equal to j composed with chi. V dominates O. Do not require V to be finite as an O-module.

**Prerequisites.**

- [A generic prime below the residual character](#R15-5-horizontal-prime)
- `tauceti:TauCeti.integralClosure.isDedekindDomain`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.character_valuation_lift`

**Proof plan.**

1. Choose P below ker(chi) over zero. B=H/P is a finite integral domain over O, and L=Frac(B) is finite over K.
2. Let C be the integral closure of O in L. The verified Tau Ceti theorem makes C Dedekind without separability. Since B is O-integral, B embeds in C; C is integral over B.
3. Choose q in Spec(C) lying above ker(chi)/P. It is nonzero because it contains the nonzero image of an O-uniformizer. The localization V=C_q is a DVR with fraction field L.
4. The maps H -> B -> V give psi. The residue map kills ker(chi) and identifies H/ker(chi) with k, giving j and the commutative reduction square. The contraction of the maximal ideal of V to O is m.
5. The exact pinned APIs for finite generic fibers, lying over, and localization of a Dedekind domain are still on the baseline-integration worklist; the mathematical construction is specified rather than claimed library-closed.

**Acceptance checks.**

1. Permit inseparable finite fraction-field extensions in equal characteristic.
2. Only the fraction field is required finite; no hidden Nagata or complete-DVR assumption.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “l'homomorphisme”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-nilpotent-ideal-socle"></a>

### A nonzero vector killed by a nilpotent ideal

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/nilpotent-ideal-socle`. Kind: **lemma**.

For a commutative ring A, a nonzero A-module V and a nilpotent ideal I of A, there exists v != 0 with I v=0. Neither V finite nor A local is required.

**Prerequisites.**



**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.nilpotent_ideal_socle`

**Proof plan.**

1. Choose the least positive n with I^n V=0. Such n exists by nilpotence, and I^0 V=V is nonzero.
2. Choose a nonzero vector in I^(n-1)V. Multiplication by I sends it into I^n V=0.

**Acceptance checks.**

1. For I=0 every nonzero vector is eligible.
2. For V=A=k[t]/(t^n), I=(t), the vector t^(n-1) is an eligible witness.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “support”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-localized-socle-descent"></a>

### Descend an annihilated vector from a localization

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/localized-socle-descent`. Kind: **lemma**.

Let A be a commutative Noetherian ring, I a maximal ideal, and V an A-module such that V_I != 0 and A_I is Artinian. Then there exists v != 0 in V with I v=0.

**Prerequisites.**

- [A nonzero vector killed by a nilpotent ideal](#R15-5-nilpotent-ideal-socle)
- `mathlib:IsArtinianRing.isNilpotent_jacobson_bot`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.localized_socle_descent`

**Proof plan.**

1. In A_I the maximal ideal is nilpotent by the Artinian radical theorem. Apply the nilpotent-ideal lemma to the nonzero localized module.
2. Represent its nonzero annihilated element by w/s. Choose finitely many generators a_1,...,a_d of I. For each a_j choose t_j outside I with t_j a_j w=0 in V.
3. Set t equal to the product of the t_j. Then t w is killed by all generators of I. Its localization is a unit multiple of the original nonzero element, hence t w != 0. This is the required descent; a localized witness alone is not enough.

**Acceptance checks.**

1. Keep the Noetherian hypothesis or replace it by finite generation of I; the product of denominators must be finite.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “support”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-faithful-character-occurrence"></a>

### Every character occurs in a faithful finite module

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/faithful-character-occurrence`. Kind: **lemma**.

Let k be a field, H a finite-dimensional commutative k-algebra and r:H -> End_k(V) an injective k-algebra map, with V finite-dimensional over k. For every k-algebra character chi:H -> k there is v != 0 with r(h)v=chi(h)v for all h. No reducedness or semisimplicity of H or V is assumed.

**Prerequisites.**

- [Descend an annihilated vector from a localization](#R15-5-localized-socle-descent)
- `mathlib:Module.mem_support_iff_of_finite`
- `mathlib:IsArtinianRing.localization_artinian`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.faithful_character_occurrence`

**Proof plan.**

1. View V as an H-module through r. It is finite over H since its finite k-spanning set also spans over H. Injectivity of r makes its annihilator zero.
2. For I=ker(chi), the finite-module support theorem gives V_I != 0. H and H_I are Artinian, and H is Noetherian.
3. Apply localized-socle-descent. Since h-chi(h) belongs to I, the resulting nonzero vector has the required eigenvalue for every h.

**Acceptance checks.**

1. The product-algebra counterexample below rejects removal of injectivity.
2. The argument must work for nonreduced H, so a reduced-Artinian product-of-fields theorem is not a substitute.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “support”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-generic-action-faithfulness"></a>

### Faithfulness survives extension of the operator algebra

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/generic-action-faithfulness`. Kind: **lemma**.

Let O be a domain, M a finite free O-module, H an O-subalgebra of End_O(M), and L an O-algebra flat as an O-module. The natural L-algebra map L tensor_O H -> End_L(L tensor_O M), sending a tensor h to a times the base change of h, is injective.

**Prerequisites.**

- `mathlib:TensorProduct.AlgebraTensorModule.map_tmul`

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.generic_action_faithfulness`

**Proof plan.**

1. Tensor the inclusion H -> End_O(M) with L; flatness preserves its injectivity.
2. Choose a finite basis of M. Both L tensor_O End_O(M) and End_L(L tensor_O M) identify with matrices of the same size over L, and the natural map is entrywise the identity.
3. Compose the injective tensor inclusion with this isomorphism. The exact existing flatness and finite-free Hom/base-change declarations must be pinned before this node can be marked library-closed; do not confuse this claim with mere injectivity of H -> End_L(L tensor M).

**Acceptance checks.**

1. Use the whole scalar-extended algebra, not just the original H.
2. Test the rank-zero case: both algebras are zero and injectivity is still meaningful.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “la sous-algèbre de End (M)”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-integral-eigenvector"></a>

### Clear denominators of a common eigenvector

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/integral-eigenvector`. Kind: **lemma**.

Let O be a domain with fraction field K and M a finite free O-module. Let T_i be any family of O-linear endomorphisms and a_i in O. A nonzero common eigenvector in K tensor_O M with eigenvalues the images of a_i implies a nonzero common eigenvector in M with eigenvalues a_i.

**Prerequisites.**



**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.integral_eigenvector`

**Proof plan.**

1. Use a finite basis of M to clear the finitely many coordinate denominators by one nonzero d in O. This does not require the family of operators to be finite.
2. The scaled vector is integral and nonzero. Its eigenvector equations are homogeneous and survive scaling.
3. The map from M to its generic fiber is injective, so those equations hold already in M. No prescribed reduction of the integral vector is asserted.

**Acceptance checks.**

1. An infinite commuting family presents no extra denominators: only coordinates of the one vector are cleared.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “multiple”. A declaration-sized expansion of the indicated step, not a separately numbered lemma in the paper.


<a id="R15-5-deligne-serre-eigenvalue-lifting-lemma"></a>

### Deligne-Serre eigenvalue lifting

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/deligne-serre-eigenvalue-lifting-lemma`. Kind: **theorem**.

Let M be finite free over a DVR O with residue field k and fraction field K. Let T_i be an arbitrary pairwise commuting family of O-linear endomorphisms. If f != 0 in k tensor_O M is a common eigenvector with eigenvalues a_i in k, there exist a dominating DVR V in a finite extension L/K, a residue-field embedding j:k -> k_V, and a nonzero common eigenvector f_prime in V tensor_O M with eigenvalues b_i in V such that residue_V(b_i)=j(a_i). The theorem does not prescribe the reduction of f_prime and does not assert module-finiteness of V/O.

**Prerequisites.**

- [The generated algebra preserves the residual line](#R15-5-adjoin-invariant-line)
- [The character of a nonzero invariant line](#R15-5-eigencharacter-of-invariant-line)
- [Lift a character to a dominating DVR](#R15-5-character-valuation-lift)
- [Every character occurs in a faithful finite module](#R15-5-faithful-character-occurrence)
- [Faithfulness survives extension of the operator algebra](#R15-5-generic-action-faithfulness)
- [Clear denominators of a common eigenvector](#R15-5-integral-eigenvector)

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.deligneSerreEigenvalueLifting`

**Proof plan.**

1. Set H=O[T_i]. It is commutative by pairwise commutation. It is finite and torsion-free as an O-submodule of the finite free endomorphism module; the finite torsion-free PID module theorem gives freeness. Those existing-library instances still require exact baseline-index integration.
2. Use adjoin-invariant-line and eigencharacter-of-invariant-line to obtain the residual character chi of H.
3. Apply character-valuation-lift to obtain V,L and psi. Extend psi to a character of L tensor_O H.
4. Use generic-action-faithfulness, then faithful-character-occurrence, to obtain a nonzero vector in L tensor_O M with the lifted eigenvalues.
5. Apply integral-eigenvector over V, using the canonical reassociation of scalar extension, and evaluate psi on each T_i. The reduction square supplies the desired congruences.

**Acceptance checks.**

1. Run all three nonexample/application nodes.
2. Do not apply this theorem to a Katz form until it is exhibited in the reduction of the particular finite free characteristic-zero module.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “valeurs propres”. The original reviewed node ID is retained. The main conclusion is the source lemma; the intervening nodes spell out a normalization-and-support proof without assuming a split generic algebra.


<a id="R15-5-nilpotent-eigenvector-nonlifting"></a>

### An eigenline that cannot be lifted

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/nilpotent-eigenvector-nonlifting`. Kind: **application**.

Let O be a DVR with uniformizer pi. For T=[[0,pi],[0,0]] on O^2, the residual vector e_2 is an eigenvector with eigenvalue zero. Over every dominating DVR, any nonzero eigenvector has eigenvalue zero and second coordinate zero. Thus no eigenvector reduces to e_2, although the eigenvalue lifts using e_1.

**Prerequisites.**

- [Deligne-Serre eigenvalue lifting](#R15-5-deligne-serre-eigenvalue-lifting-lemma)

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.nilpotent_eigenvector_nonlifting`

**Proof plan.**

1. T^2=0 implies lambda^2 v=0, so over a domain a nonzero eigenvector has lambda=0.
2. The first coordinate equation is pi*y=0. The embedding of O into a dominating domain preserves pi != 0, hence y=0.
3. Modulo pi the operator is zero, so e_2 is a residual eigenvector. Its second coordinate excludes lifting it.

**Acceptance checks.**

1. Test pi=2,3,5,7 by exact matrix arithmetic; the symbolic proof is uniform.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “Noter”. New explicit regression example for the warning in 6.11; this matrix is not claimed to be printed in the source.


<a id="R15-5-ramified-eigenvalue-example"></a>

### A fraction-field extension is necessary

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/ramified-eigenvalue-example`. Kind: **application**.

For T=[[0,pi],[1,0]] over a DVR O with uniformizer pi, the residual vector e_2 has eigenvalue zero. Every eigenvalue over an extension satisfies lambda^2=pi. There is no eigenvector over K=Frac(O), since the normalized valuation of pi is odd. After adjoining alpha with alpha^2=pi, the vector (alpha,1) has eigenvalue alpha. This includes possibly inseparable extensions in characteristic two.

**Prerequisites.**

- [Deligne-Serre eigenvalue lifting](#R15-5-deligne-serre-eigenvalue-lifting-lemma)

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.ramified_eigenvalue_equation`

**Proof plan.**

1. Compute T^2=pi times the identity. A nonzero eigenvector implies lambda^2=pi.
2. The value of a square in the discretely valued field K is even; v(pi)=1.
3. In an extension containing alpha, multiply the matrix by (alpha,1). Both coordinates give alpha*(alpha,1); alpha reduces to zero in a valuation ring dominating O.

**Acceptance checks.**

1. Do not add a separability hypothesis in characteristic two.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “fini”. New explicit regression example for the finite fraction-field extension in 6.11; not an attributed example from the paper.


<a id="R15-5-nonfaithful-character-nonoccurrence"></a>

### A character need not occur in a nonfaithful action

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/nonfaithful-character-nonoccurrence`. Kind: **application**.

For a field k, let H=k x k act on V=k by its first projection and let chi be the second projection. No nonzero chi-eigenvector exists.

**Prerequisites.**

- [Every character occurs in a faithful finite module](#R15-5-faithful-character-occurrence)

**Proposed library location.**

- module: `TauCeti/LinearAlgebra/EigenvalueLifting.lean`
- namespace: `TauCeti.EigenvalueLifting`
- declaration: `TauCeti.EigenvalueLifting.nonfaithful_character_nonoccurrence`

**Proof plan.**

1. Evaluate the putative eigenvector equation at h=(1,0): the action is the identity and chi(h)=0, forcing the vector to vanish.

**Acceptance checks.**

1. The result is independent of characteristic, including characteristic two.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.11 and its proof, printed p. 522 (Numdam PDF page 17, zero-based index 16). Quotation: “support”. New negative test for the support argument used in 6.11; it explains why the faithfulness step cannot be omitted.


<a id="R15-5-reduction-to-weight-at-least-two-and-to-a-true-eigenform"></a>

### Weight shift and true eigenform lifting

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`. Kind: **theorem**.

Fix a finite free integral cusp-form module L over a DVR O of residue characteristic p, weight k, invertible level N and an integral character ε. Suppose a nonzero residual eigenvector is actually in L/varpi L for a specified commuting family of integral Hecke and diamond operators; a Katz form must be supplied with such a witness. Apply Deligne–Serre6.11 to obtain, after a finite fraction-field extension and a dominating DVR, a nonzero characteristic-zero eigenvector with the same residual eigenvalues, keeping weight, level and the eigenvalues of the specified family. A common eigenvector for all T_n and U_ℓ in the full analytic family has a₁≠0 by coefficient identities and is scaled to a₁=1. A primitive newform conclusion uses the upstream old/new theorem and records its divisor of N; good-prime eigenvalues alone do not give full-eigenform status at N. For a reduction form in low weight use DS6.9: multiply by a level-one Eisenstein E_n with n≥4 even and (p−1)|n, E_n≡1 mod p; then weight k+n≥2, level and character stay fixed and good-prime eigenvalues/determinant powers remain congruent. For a Katz form outside the reduction image, a Hasse-power weight shift into a surjective reduction range needs the cusp-sheaf H¹ criterion; same-weight lifting is not asserted.

**Prerequisites.**

- [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image)
- [Finite generation of geometric forms](#R15-2-finite-generation-of-geometric-sections)
- [Deligne-Serre eigenvalue lifting](#R15-5-deligne-serre-eigenvalue-lifting-lemma)
- [A = E_{p-1} mod p for p >= 5, and the explicit level-n liftings of A required at p = 2, 3](#R15-3-deligne-congruence-and-the-explicit-p-equals-2-3-liftings)
- `tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R155.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Supply L and the actual reduction eigenvector, then apply the algebraic lifting node.
2. Use the integral lattice comparison to interpret the output as an analytic cusp form.
3. Enlarge the finite field and select an eigenvector for additional commuting operators if only a good-prime family was lifted; state separately which bad-prime data are preserved.
4. Normalize using a₁(T_nf)=a_n(f); apply the upstream primitive/oldform theorem with the level bound.
5. For a required shift verify E_n≡1 and the exponent congruence; handle a Katz reduction obstruction by the named H¹ criterion.

**Acceptance checks.**

1. The nilpotent regression example remains valid: lifted eigenvalues do not prescribe reduction of the vector.
2. At p=2 one can use E₄≡1 for a weight4 shift; at p=3 use E₄≡1 as well.
3. No dependency on R15.4 or R19 is needed to lift eigenvalues.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.9–6.11, printed p.522. Quotation: “Le produit/.E^ est donc congru à/mod?i”. The weight shift preserves reduction; OCR renders the form and prime poorly. The next paragraph applies 6.11 to the integral module.


## R15.6. Definitions used in the Serre statement

Coverage: **planned**. Remaining closure: Complete the requested attached-representation/finite-field witness carriers and the Katz shift criterion used in the equivalence.

Planets: S-type representations and "arises from", Serre's conjecture: the refined target, Residual modularity.

<a id="R15-6-residual-modularity-with-a-chosen-place-and-coefficient-field"></a>

### Serre’s reduction convention and Katz forms

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field`. Kind: **comparison**.

The historical reduction definition in Serre1987 §3.1 uses the subspace of formal expansions obtained from the integral analytic cusp lattice of type (N,k,ε₀), at a chosen place over p, k≥2 and the stated parity convention. This is the R15.2 reduction-image space, distinguished from Katz’s geometric section space. Serre’s parity restriction at p=2 belongs to that historical classical convention and is not a restriction on all Katz weights. The inclusion is Hecke compatible; equality requires the precise base-change/surjectivity theorem and character-lattice hypotheses. Edixhoven2.1 permits Katz weight1. Do not infer equality or independence of places with a fixed coefficient embedding merely from dimensions.

**Hypotheses and conventions.**

1. N prime to p and k >= 2 in this definition; the level-p case is not excluded mathematically but yields no genuinely new mod p forms, at the cost of raising the weight
2. the parity condition eps(-1) = (-1)^k is imposed, and is automatic at p = 2 where instead k is required even
3. the reduction of T_p to U_p uses k >= 2 so that the term eps_0(p) p^{k-1} vanishes mod p
4. the dimension comparison 3.1.3 is imported from Shimura [51] Thm 3.52 (also Deligne-Serre [11] Prop. 2.7) and is not reproved in the source

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon: the forms f in the qualitative and refined statements

**Prerequisites.**

- [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image)
- [A = E_{p-1} mod p for p >= 5, and the explicit level-n liftings of A required at p = 2, 3](#R15-3-deligne-congruence-and-the-explicit-p-equals-2-3-liftings)

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/ResidualModularity.lean`
- namespace: `TauCeti.ResidualModularity`

**Proof plan.**

1. Import the reduction-image construction and analytic integral lattice.
2. Compare expansions through the actual coefficient map and record the geometric base-change hypotheses.
3. Use AΔ in characteristic2 at level1 as a concrete strictness example.

**Acceptance checks.**

1. Check that the two definitions (reduction of characteristic-zero forms versus Katz forms) can differ, and that every statement in the roadmap that uses weight 1 uses the Katz definition
2. Check that a mod p eigensystem determines f uniquely once normalized, using the Euler product of 3.1.5

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.1, (3.1.3), printed p. 194. Quotation: “ne dépend pas du choix”. The independence-of-place and dimension statement that makes the definition of residual modularity well posed.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.1, (3.1.6), printed pp. 194-195. Quotation: “commutent entre eux”. The explicit use of Deligne-Serre Lemme 6.11 inside the definition chain, justifying the R15.5 -> R15.6 dependency.

- [The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi), 4.2 and the paragraph following it, pp. 9-10 of the DVI. Quotation: “Katz's definition”. Records the change of definition that separates k_rho from k(rho) and licenses weight 1. DVI prose is quoted with word spacing restored; no unread displayed glyph is used as a quotation.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, Remark (6) and footnote 2, printed p. 197. Quotation: “faux pour”. A small-characteristic difference between the reduction definition and Katz's definition. Added by the reviewer.


<a id="R15-6-realizability-over-the-field-of-characteristic-polynomials"></a>

### Coefficient-field descent in the residual definition

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/realizability-over-the-field-of-characteristic-polynomials`. Kind: **comparison**.

Imported coefficient descent: Let phi: Phi -> GL_n(k') be a semisimple representation of a group Phi over a finite field k', and let k be a subfield of k' containing the coefficients of the polynomials det(1 - phi(s)T) for all s in Phi. Then phi is realizable over k, i.e. isomorphic to a representation Phi -> GL_n(k). The proof: it suffices that phi be isomorphic to sigma(phi) for every k-automorphism sigma of k', because the Brauer group of a finite field is trivial so there is no Schur index; and phi and sigma(phi) have the same characteristic polynomials and are semisimple, hence isomorphic by Curtis-Reiner Thm 30.16.

**Hypotheses and conventions.**

1. k' finite and phi semisimple; both are used, semisimplicity through the character-determines-representation theorem and finiteness through the vanishing of the Brauer group
2. the hypothesis is on the coefficients of all characteristic polynomials det(1 - phi(s)T), not merely on traces
3. in Deligne-Serre's application the field k_f is generated by the eigenvalues a_p and the reductions of eps(p), and Cebotarev is used to see that every element of the image is a Frobenius

**Uses deriving the interface.**

1. AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular: invariance of 'arises from' under enlarging the coefficient field

**Prerequisites.**

- `ArithmeticGaloisRepresentations:R01.5`

**Proof plan.**

1. Import finite-field semisimple realizability from R01.5, motivated by DS6.13.
2. Use it for the residual representation supplied by R19; the generic theorem is not re-proved in R15.6.

**Acceptance checks.**

1. Check that a semisimple representation over F_4 with F_2-rational characteristic polynomials is conjugate into GL_n(F_2)
2. Check that semisimplicity cannot be dropped, using a non-split extension whose characteristic polynomials are rational over a proper subfield
3. Check that in characteristic 2 traces alone would not suffice for 2-dimensional representations, so that the hypothesis on full characteristic polynomials is needed (reviewer-suggested check; not a claim of the source)

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Lemme 6.13 with proof, printed p. 523. Quotation: “les coefficients des polynômes”. Literal statement of the descent of the field of definition by characteristic polynomials.

- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), Proof of Lemme 6.13, printed p. 523. Quotation: “le groupe de Brauer d'un corps fini est trivial”. The finiteness hypothesis is used exactly through the vanishing of the Brauer group.


<a id="R15-6-s-type-arises-from-and-modular"></a>

### S-type representations, "arises from a newform" and "modular", and their invariance under the coefficient field

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`. Kind: **definition**.

Let F be a finite field of characteristic p. A continuous ρ̄ : G_ℚ → GL₂(F) is of Serre type (S-type) if it is absolutely irreducible and odd, det ρ̄(c) = −1 for a complex conjugation c (a vacuous condition when p = 2). Its invariants are N(ρ̄), the prime-to-p Artin conductor (Serre 1.2), k(ρ̄), Serre's weight (R15.4), and ε(ρ̄), the character of (ℤ/N(ρ̄)ℤ)^× with det ρ̄ = ε(ρ̄)χ̄_p^{k(ρ̄)−1} (Serre 1.3, R15.4/determinant-parity-and-weight-mod-p-minus-one). Fix ι_p : ℚ̄ → ℚ̄_p. ρ̄ arises from a newform f (of some weight and level) if there is a stable integral model with its residual semisimplification, ρ : G_ℚ → GL₂(𝒪), 𝒪 the ring of integers of a finite extension of ℚ_p, of the p-adic representation ρ_f attached to f through ι_p, such that ρ̄ is isomorphic to the semisimplification of the reduction of ρ modulo the maximal ideal of 𝒪, both considered over a common finite field; ρ̄ is modular if it arises from some newform; it arises from S_{k(ρ̄)}(Γ₁(N(ρ̄))) if it arises from a newform of weight k(ρ̄) and level N(ρ̄). For absolutely irreducible ρ̄ these notions, and N, k and ε, are unchanged when F is replaced by a finite extension F′ and ρ̄ by ρ̄ ⊗_F F′, and depend only on the isomorphism class of ρ̄ ⊗ F̄_p; in particular the choice of the common field in "isomorphic to the reduction" is immaterial.

**Hypotheses and conventions.**

1. absolute irreducibility is part of S-type (Khare–Wintenberger); Serre's (3.2.1) asks only irreducibility over F̄_p, which is the same condition
2. the reduction of ρ modulo the maximal ideal is independent of the integral model up to semisimplification, and for absolutely irreducible ρ̄ the reduction is itself semisimple (AutomorphicGaloisRepresentations:R19.6/residual-representation-of-a-newform)
3. "arises from" is Khare–Wintenberger's formulation with a newform in characteristic 0; its relation with Serre's formulation through mod p eigenforms of type (N, k, ε) (R15.6/residual-modularity-with-a-chosen-place-and-coefficient-field) is not proved here

**API.**

- `TauCeti.ResidualModularity.IsSType` (other): ρ̄ continuous, absolutely irreducible and odd.
- `TauCeti.ResidualModularity.ArisesFrom` (other): ρ̄ arises from the newform f through ι_p: an integral model of ρ_f reduces to ρ̄.
- `TauCeti.ResidualModularity.IsModular` (other): ∃ f, ArisesFrom ρ̄ f.
- `TauCeti.ResidualModularity.isSType_baseChange` (compatibility): IsSType ρ̄ ↔ IsSType (ρ̄ ⊗_F F′).
- `TauCeti.ResidualModularity.arisesFrom_baseChange` (compatibility): For absolutely irreducible ρ̄, ArisesFrom ρ̄ f ↔ ArisesFrom (ρ̄ ⊗_F F′) f.

**Unit tests.**

- `TauCeti.ResidualModularity.isSType_11a1_three` — computation: E[3] for 11a1 is of S-type with N = 11, k = 2, ε = 1, and arises from 11a1.
- `TauCeti.ResidualModularity.not_isSType_11a1_five` — non-example: E[5] for 11a1 is reducible, hence not of S-type.
- `TauCeti.ResidualModularity.isSType_p2_odd` — degenerate: At p = 2 oddness is automatic: det ρ̄(c) = 1 = −1 in F.

**Uses deriving the interface.**

1. ClassicalSerreModularity R26–R27: S-type, N(ρ̄), k(ρ̄), ε(ρ̄) and "arises from" in Khare–Wintenberger's theorems
2. ClassicalSerreModularity R33.6: the notion against which Dieulefait–Pacetti's modularity is compared

**Prerequisites.**

- [Residual modularity witness](#R15-6-residual-modularity-witness)
- [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting)
- [det rho_p restricted to inertia is chi^{k-1}, and the global parity relation eps(-1) = (-1)^k](#R15-4-determinant-parity-and-weight-mod-p-minus-one)
- `ArithmeticGaloisRepresentations:R01.3`
- `ArithmeticGaloisRepresentations:R01.5`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/ResidualModularity.lean`
- namespace: `TauCeti.ResidualModularity`

**Proof plan.**

1. Invariance of S-type: absolute irreducibility and oddness are properties of ρ̄ ⊗ F̄_p.
2. Invariance of N, k, ε: each is defined from ρ̄ ⊗ F̄_p (the Artin conductor from the inertia action, the weight from ρ̄|G_p by R15.4/serre-weight-tame-cases, ε from det ρ̄).
3. Invariance of "arises from": two absolutely irreducible representations over finite fields that become isomorphic over F̄_p are isomorphic over any common finite subfield, by Brauer–Nesbitt and R15.6/realizability-over-the-field-of-characteristic-polynomials (no Schur index over a finite field).

**Acceptance checks.**

1. ρ̄ = E[3] for E = 11a1: absolutely irreducible (no rational 3-isogeny) and odd, so of S-type; N(ρ̄) = 11 (ramified at 11 with inertia of order 3), k(ρ̄) = 2 (good reduction at 3), ε = 1; it arises from the newform 11a1 of weight 2 and level 11, i.e. from S₂(Γ₁(11)).
2. Non-example: E[5] for E = 11a1 is reducible (ρ̄^{ss} ≅ 1 ⊕ χ̄₅), so not of S-type.

**Source passages.**


- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 (authors' preprint). Quotation: “We say that such a representation is of Serre-type, or S-type, for short.”. S-type: continuous, absolutely irreducible, two-dimensional and odd.

- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), §1, p. 2 (authors' preprint). Quotation: “By arises from f we mean that there is an integral model ρ : GQ → GL2 (O) of the p-adic representation ρf associated”. "Arises from", "modular" and "arises from S_{k(ρ̄)}(Γ₁(N(ρ̄)))".


<a id="R15-6-serre-conjecture-target-with-N-k-epsilon"></a>

### Classical Serre target

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/serre-conjecture-target-with-N-k-epsilon`. Kind: **definition**.

Define the classical Serre target for an S-type ρ̄ to be the assertion that there is a modularity witness with a normalized eigenform of weight k(ρ̄), level N(ρ̄) and residual character ε(ρ̄), equivalently the geometric eigenform formulation when the comparison hypotheses of modularity-formulations-and-determinant hold. N is the prime-to-p Artin conductor from R01.3, k is the complete local recipe of R15.4, and ε is uniquely specified by det ρ̄=εχ̄_p^{k−1}. This node states the target and proves elementary equivalences of its formulations; it does not prove its universal truth or optimize any witness. The extra bad-prime eigenvalue prediction of Serre3.2.6 is a separate refinement: a_ℓ≠0 exactly when there is a one-dimensional unramified quotient, with its Frobenius eigenvalue, and at p-unramified classical weight p there are two choices with product ε(p).

**Hypotheses and conventions.**

1. rho irreducible and det rho odd - both are hypotheses of the statement, not conclusions
2. N is the prime-to-p part of the Artin conductor: n(l, rho) = dim V/V^{G_0} + b(V) where b is the wild invariant, so N is a genuine conductor and not merely a ramification set
3. Serre's remark (5) that N and k are minimal is stated as probable, not proved, in the source; Edixhoven Thm 4.5 proves minimality, under the non-exceptional hypothesis, of his own weight k(rho) for Katz forms, which differs from Serre's k_rho in the two cases of his Remark 4.4
4. the a_p statements at l = p distinguish sharply between rho ramified and unramified at p
5. the labels (3.2.3?), (3.2.4?) and (3.2.6?) are Serre's own: he marks conjectural statements with a question mark

**API.**

- `TauCeti.ResidualModularity.ClassicalTarget` (constructor): Existence of a witness of the invariant level, weight and residual character.
- `TauCeti.ResidualModularity.classicalTarget_implies_modular` (relation): A classical-target witness is a modularity witness.
- `TauCeti.ResidualModularity.classicalTarget_baseChange` (functoriality): The target is invariant under extending the finite residual field.

**Unit tests.**

- `TauCeti.ResidualModularity.target_weight_two` — characterisation: The requested weight is 2 precisely under the explicit local finite-flat and determinant criterion.
- `TauCeti.ResidualModularity.target_unramified` — non-example: At odd p and unramified local representation the requested classical weight is p, rather than Edixhoven’s weight 1.
- `TauCeti.ResidualModularity.target_dyadic` — computation: At p=2 a wild très-ramifiée local representation requests weight4, not3.

**Uses deriving the interface.**

1. ClassicalSerreModularity R26.1: The universal S-type existence theorem has this target.
2. SerreWeightAndLevelOptimisation R20: Its optimization conclusions furnish the prescribed fields of the witness.

**Prerequisites.**

- [Residual modularity witness](#R15-6-residual-modularity-witness)
- [S-type representations, "arises from a newform" and "modular", and their invariance under the coefficient field](#R15-6-s-type-arises-from-and-modular)
- [Modularity formulations and determinant congruence](#R15-6-modularity-formulations-and-determinant)
- `ArithmeticGaloisRepresentations:R01.3`
- [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting)

**Proof plan.**

1. Form the existential predicate using the invariant triple and residual witness.
2. Use the stated comparison node for the eigenform formulation.
3. Record the bad-prime prediction as a refinement, without proving modularity or level/weight optimization.

**Acceptance checks.**

1. Check that N is prime to p by construction and that n(l, rho) = dim V/V^{G_0} exactly in the tame case
2. Check the density-1 sufficiency of the trace identity by a Cebotarev argument on the finite image of rho

**Source passages.**


- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, (3.2.1)-(3.2.5), printed pp. 195-196. Quotation: “peut être choisie de type”. The refined statement that fixes the type (N, k, eps) to be the invariants of the recipe rather than any admissible type.

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 3.2, Remark (5), printed p. 197. Quotation: “sont minimaux”. The source itself only conjectures minimality; this packet does not record minimality as an established input. Transcribed from the page image by the reviewer (the text layer garbles the inequalities).

- [Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf), 1.2, (1.2.2), printed p. 181. Quotation: “invariant sauvage”. The Artin conductor exponent with its wild part, the definition of N used in the statement.


<a id="R15-6-residual-modularity-witness"></a>

### Residual modularity witness

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/residual-modularity-witness`. Kind: **definition**.

After R19.1 supplies the representation attached to a normalized eigenform f, a residual modularity witness for ρ̄ consists of a coefficient number field K_f, a place λ over p, the chosen characteristic-zero coefficient embedding, an integral stable lattice in ρ_{f,λ}, and an isomorphism over a common finite residue-field extension between ρ̄ and the semisimplification of its reduction. Define residual modularity by existence of such a witness. Weight and level are fields of the witness; prescribed-weight-and-level modularity restricts these fields. Changing the stable lattice preserves the residual semisimplification by the imported Brauer–Nesbitt input. The property is independent of extending the residual coefficient field, through R01.5 descent. A place is part of a witness, not an assertion that all places above p give the same residual representation.

**API.**

- `TauCeti.ResidualModularity.Witness` (constructor): A witness contains the eigenform, field, place, stable lattice and residual semisimplification comparison.
- `TauCeti.ResidualModularity.Witness.weight` (projection): The weight of its characteristic-zero normalized eigenform.
- `TauCeti.ResidualModularity.Witness.level` (projection): The level of its normalized eigenform.
- `TauCeti.ResidualModularity.witness_lattice_independent` (compatibility): Replacing the stable lattice preserves the residual semisimplification.

**Unit tests.**

- `TauCeti.ResidualModularity.witness_zero_representation` — non-example: A rank-two residual witness sends the identity group element to I₂; the zero endomorphism family cannot be its residual representation.
- `TauCeti.ResidualModularity.witness_scalar_extension` — compatibility: A witness extends to a larger finite residue field with the same weight and level.
- `TauCeti.ResidualModularity.witness_place_sensitive` — characterisation: For conjugate coefficient places related by σ, aₗ mod σ(λ) equals σ(aₗ mod λ) under the transported residue embedding; equality with a fixed unrelated residue embedding is not asserted.

**Uses deriving the interface.**

1. R20 and R27: Supplies modularity assumptions with named weight/level
2. ClassicalSerreModularity R26.1: States the existence target

**Prerequisites.**

- `AutomorphicGaloisRepresentations:R19.1`
- `ArithmeticGaloisRepresentations:R01.5`
- `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`
- `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R156.lean`
- namespace: `TauCeti`

**Proof plan.**

1. Use the R19 attached representation and choose an invariant integral lattice.
2. Reduce at the specified λ and take semisimplification using R01.5.
3. Package the finite-field comparison isomorphism; quantify over the witness for the predicate.

**Acceptance checks.**

1. A prime λ and coefficient embedding cannot be erased before comparing reductions.

**Source passages.**


- [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf), Introduction, preprint pp.1–2. Quotation: “arises from”. Defines modularity through newforms and their reductions; stable lattices and semisimplification are supplied by the representation owner.


<a id="R15-6-modularity-formulations-and-determinant"></a>

### Modularity formulations and determinant congruence

Identifier: `AlgebraicModularFormsAndSerreWeights:R15.6/modularity-formulations-and-determinant`. Kind: **comparison**.

For an absolutely irreducible odd residual ρ̄, existence of a normalized geometric mod-p eigensystem giving ρ̄ is equivalent to residual modularity via a characteristic-zero witness of some controlled shifted weight and level: R15.5 supplies lifting only after its reduction-image or weight-shift hypotheses, R19 supplies the attached representation, and Brauer–Nesbitt compares its semisimple reduction through Frobenius characteristic polynomials away from pN. The determinant identity is det ρ̄=ε̄χ̄_p^{k−1}, giving ε̄(−1)=(−1)^k for odd p. Replacing k by k+n with (p−1)|n preserves the determinant exponent. The classical weight-two consequence is precisely k(ρ̄)=2 iff det(ρ̄|I_p)=χ̄_p and ρ̄ is finite at p in the coefficient setting of the imported criterion; the full dyadic equivalence retains its R07.5 descent request. This equivalence does not assert minimal weight or conductor level.

**Prerequisites.**

- [Residual modularity witness](#R15-6-residual-modularity-witness)
- [Weight shift and true eigenform lifting](#R15-5-reduction-to-weight-at-least-two-and-to-a-true-eigenform)
- [det rho_p restricted to inertia is chi^{k-1}, and the global parity relation eps(-1) = (-1)^k](#R15-4-determinant-parity-and-weight-mod-p-minus-one)
- [k = 2 if and only if det rho_p|I = chi and rho_p is finite at p](#R15-4-weight-two-iff-finite-flat-at-p)
- [At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case](#R15-4-dyadic-weight-two-or-four)
- `AutomorphicGaloisRepresentations:R19.1`
- `ArithmeticGaloisRepresentations:R01.5`
- `AutomorphicGaloisRepresentations:R19.1/lambda-adic-representation-of-a-weight-k-eigenform`
- `AutomorphicGaloisRepresentations:R19.1/weight-one-artin-representation`
- `AutomorphicGaloisRepresentations:R19.1/mod-lambda-representation-of-a-mod-lambda-eigenform`

**Proposed library location.**

- module: `TauCeti/NumberTheory/ModularForms/Geometric/R156.lean`
- namespace: `TauCeti`

**Proof plan.**

1. For reduction forms lift the eigencharacter after the controlled DS shift.
2. For Katz forms use the supplied shift-to-reduction-image criterion before applying the lemma.
3. Use R19 Frobenius traces/determinants and R01.5 Brauer–Nesbitt.
4. Compute determinant parity and import the local finite-flat criterion.

**Acceptance checks.**

1. A weight change preserves the cyclotomic determinant exponent modulo p−1.
2. A same-weight Katz lift and minimal level are not conclusions.

**Source passages.**


- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.9–6.11, printed p.522. Quotation: “Le produit/.E^ est donc congru à/mod?i”. The weight shift preserves reduction; OCR renders the form and prime poorly. The next paragraph applies 6.11 to the integral module.

- [Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf), 6.8 and 6.12–6.13, pp.522–523. Quotation: “le théorème pour/équivaut au théorème pour/”. Good-prime eigenvalue and determinant congruences identify the residual semisimplification; OCR merges f with the slash.


## Verified baseline

The reviewed library audit for all six layers was read before planning. Every declaration below was read at its recorded commit. These are inputs to the proof plan, not claims that any planned node is formalized. Additional carrier imports in the suggested file remain unchecked signatures.

Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.


- `mathlib:Algebra.adjoin_le` in `Mathlib/Algebra/Algebra/Subalgebra/Lattice.lean`: The subalgebra generated by a set is contained in any subalgebra containing that set. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:Algebra.HasGoingDown.of_flat` in `Mathlib/RingTheory/Ideal/GoingDown.lean`: Flat commutative algebras satisfy going down. Applied to the finite free algebra of operators. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:Ideal.exists_ideal_le_liesOver_of_le` in `Mathlib/RingTheory/Ideal/GoingDown.lean`: For p <= q and Q above q, obtain P <= Q above p under going down; use p=0 and q the maximal ideal of the DVR. Statement read in the source at the declared commit; not compiled in this session.

- `tauceti:TauCeti.integralClosure.isDedekindDomain` in `TauCeti/RingTheory/DedekindDomain/IntegralClosure.lean`: The integral closure of a Dedekind domain in any finite extension of its fraction field is Dedekind. No separability or module-finiteness of the integral closure is asserted. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:IsArtinianRing.isNilpotent_jacobson_bot` in `Mathlib/RingTheory/Artinian/Ring.lean`: The Jacobson radical of an Artinian ring is nilpotent; at a commutative local Artinian ring it is the maximal ideal. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:IsArtinianRing.localization_artinian` in `Mathlib/RingTheory/Artinian/Ring.lean`: Every localization of a commutative Artinian ring is Artinian. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:Module.mem_support_iff_of_finite` in `Mathlib/RingTheory/Support.lean`: For a finite module, membership of a prime in the support is equivalent to containing the module annihilator. Faithful finite modules therefore have full support. Statement read in the source at the declared commit; not compiled in this session.

- `mathlib:TensorProduct.AlgebraTensorModule.map_tmul` in `Mathlib/LinearAlgebra/TensorProduct/Tower.lean`: The heterobasic tensor map sends a pure tensor to the tensor of its images; used to check the base-changed action on generators. Statement read in the source at the declared commit; not compiled in this session.


## Source editions and reading boundary

Each node cites an original passage with a short literal excerpt and a match explanation. Word spacing is restored in Edixhoven’s DVI prose; no damaged displayed formula glyph is presented as a literal quotation. Displayed formulas and tables are transcribed separately as mathematics. The source records retain the URLs, available edition dates and file hashes. Unread cited inputs stay gaps, even when a later paper states their conclusion.


### deligne-serre74

[Formes modulaires de poids 1](https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf).

- authors: Pierre Deligne; Jean-Pierre Serre
- edition: Annales scientifiques de l ENS, 4e serie, 7 (1974), 507-530; published Numdam scan
- readSections: 2.7, pp.511–512: integral weight-one lattice; 6.7–6.13, pp.521–523: shift, eigenvalue lift, residual descent
- accessed: 2026-10-06
- sha256: 65b390f6d33e827e30c6c66bbc15421eca51db3180bdf5996dcee19047be97fc



### serre87-duke

[Sur les representations modulaires de degre 2 de Gal(Qbar/Q)](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf).

- authors: Jean-Pierre Serre
- edition: Duke Math. J. 54 (1987), 179-230; read from the library PDF via its text layer (OCR: rho prints as 'p', phi as 'p', epsilon as 'e', ell as '1'); locators give printed journal pages
- sha256: 8048919db24dcb972435aaaa2a74d1168d0fe533af3aa26c6c809b12ddaee038
- readSections: 1.1-1.3 (definitions of N, epsilon and k mod (p-1)), pp. 180-182; 2.1 Preliminaires and Proposition 1, pp. 182-183; 2.2 (level 2 tame case), pp. 183-184; 2.3 (level 1 tame case), pp. 184-185; 2.4 (wild case, peu/tres ramifie), pp. 185-187; 2.5 Proposition 2, p. 187; 2.6 (values of k, p=2 dichotomy and quadratic example), p. 188; 2.7-2.8 Propositions 3 and 4 (k <= p+1 and k=2 iff finite at p), pp. 188-190; 2.9 Proposition 5 (p-division points of a semistable elliptic curve), pp. 191-192; 3.1 (mod p cusp forms of type (N,k,epsilon), 3.1.3-3.1.10), pp. 192-195; 3.2 (statements 3.2.1-3.2.6 of the conjecture and its remarks), pp. 195-198; Reviewer (REVIEW-EXT-10-EXT-07): all of pp. 180-197 re-read on page images rendered from the library PDF; bibliography pp. 228-230 ([35] = Raynaud, Bull. SMF 102 (1974))
- accessed: 2026-10-06



### edixhoven-weight

[The weight in Serre's conjectures on modular forms](https://websites.math.leidenuniv.nl/edixhoven/public_html_rennes/publications/weight.dvi).

- authors: Bas Edixhoven
- edition: Author DVI dated 24 December 1998, of Inventiones 109 (1992), 563–594; includes the subsequent Coleman–Voloch note; DVI page locators
- sha256: ff106eeb48c679493807462505dc36597b10f6593be9ac38f14986ba8f5aabee
- readSections: Author DVI pp.3–11 (§§2–4), pp.23–28 (§§7–8); text and tables read, displayed glyphs cross-checked with Serre and Katz where available
- accessed: 2026-10-06



### raynaud74-type-p-p

[Schemas en groupes de type (p,...,p)](https://www.numdam.org/article/BSMF_1974__102__241_0.pdf).

- authors: Michel Raynaud
- edition: Bull. Soc. Math. France 102 (1974), 241-280; read from the supplied extracted text file references/text/R02_SS_Raynaud1974.txt, whose source PDF is references/papers/R02_SS_Raynaud1974.pdf; locators give printed journal pages. The OCR renders script capitals uniformly as '^', so excerpts below are quoted with that artefact
- sha256: 05cad2f5c2c33a2eea5739d255a8bb7de724e48e38dadb30507adc5e84f2edfe
- readSections: 3.2.1–3.4.6, printed pp.265–271
- accessed: 2026-10-06



### kw-serre-modularity-I

[Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf).

- authors: Chandrashekhar Khare and Jean-Pierre Wintenberger
- edition: authors' preprint from the first author's web page (the published version is Invent. Math. 178 (2009)); the same file as ClassicalSerreModularity--R27.3 (same SHA-256); fetched without certificate verification (the UCLA TLS chain is incomplete) and checked against that hash
- sha256: 3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82
- readSections: §1 (S-type, N(ρ̄), k(ρ̄), "arises from", Theorems 1.1–1.2), pp. 2–3; §6.2(ii), p.11: normalized bad-dihedral conclusion
- accessed: 2026-10-06



### katz73-padic-properties

[p-adic properties of modular schemes and modular forms](https://web.math.princeton.edu/~nmk/old/padicpropMFMS.pdf).

- authors: Nicholas M. Katz
- edition: Modular Functions of One Variable III, Lecture Notes in Math. 350 (1973), 69-190; read from the library PDF via its text layer (OCR), locators give the printed volume page and Katz's own running 'Ka-nn' page marks
- sha256: f9c14dc0c8da65bbe355926d149141b548a03e4016b883c4b800b14150cc2b1a
- readSections: Chapter 1, 1.5 (the invertible sheaf omega on Mbar_n); 1.6 (q-expansion principle, Thm 1.6.1, Cor 1.6.2); 1.7 (base change, Thm 1.7.1 and the following Remark); 1.8 (base change in level 1 and 2, Thm 1.8.1, Thm 1.8.2, Remark 1.8.2.2); 1.9 (level 1 and 2 q-expansion principle, Cor 1.9.1); 1.11 (Hecke operators: Formula 1.11.1, Cor 1.11.2, Prop 1.11.3, Cor 1.11.4); 1.12 (Thm 1.12.1, Cor 1.12.2 strong q-expansion principle); 2.0 (Hasse invariant as a modular form and its q-expansion); 2.1 (Deligne's congruence A = E_{p-1} mod p and the p=2,3 liftings); Reviewer (REVIEW-EXT-10-EXT-07): 1.4 (p. 81, Ka-13), 1.10 (pp. 88-89), 1.11.0 (pp. 89-91, definition of T_l and the level structures alpha_n', alpha_n''), bibliography item [7]; displayed formulas of 1.5-2.1 checked on page images rendered from the library PDF because the text layer drops inequality signs; §§4.2–4.4: ordinary weight congruences and strong principle; Appendix A1.3.17–18, printed p.169 (Ka-101): Kodaira–Spencer
- accessed: 2026-10-06



### ddt

[Fermat's Last Theorem](https://www.math.mcgill.ca/darmon/pub/Articles/Expository/05.DDT/paper.pdf).

- authors: H. Darmon, F. Diamond and R. Taylor
- edition: Authors' revised version dated 9 September 2007 (167 pages) of the article in Current Developments in Mathematics 1995; printed page = PDF page.
- sha256: 254f6e29957f95219eff046c29478f5ee584615bee12c8aa8357f499c8cbe8b3
- readSections: §4.1, Lemma 4.1 (p. 107)
- accessed: 2026-10-06



### katz77

[A result on modular forms in characteristic p](https://web.math.princeton.edu/~nmk/old/modformcharp.pdf).

- authors: Nicholas M. Katz
- edition: LNM 601 (1977), 53–61; author scan
- sha256: e8d9f856c9668f8d8803afc9a40dd2e684a6c6081d489694772b8da3438769e4
- accessed: 2026-10-06
- readSections: I–IV, pp.53–61



### calegari-geraghty18

[Modularity lifting beyond the Taylor–Wiles method](https://www.math.uchicago.edu/~fcale/papers/CG.pdf).

- authors: Frank Calegari; David Geraghty
- edition: Inventiones 211 (2018), 297–433; author published PDF
- sha256: c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5
- accessed: 2026-10-06
- readSections: 3.2.1–3.2.3, pp.313–318; 3.2.5, duality after Lemma3.7, pp.322–323; Proof of Theorem3.11, weight-one torsion doubling, pp.327–328



### calegari-geraghty20

[Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf).

- authors: Frank Calegari; David Geraghty
- edition: Author advance-publication version, DOI 10.1215/00127094-2019-0044; local pages differ from final Duke 169 (2020), 801–896
- sha256: fff305877c7e6b9d32ca9a8b4a56f7f3b343695fc737184d1a3a1b78f195cfa5
- accessed: 2026-10-06
- readSections: Proof of Lemma 8.14, local pp.65–67; GL2 model only



### calegari-dimitrov-tang25

[The unbounded denominators conjecture](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf).

- authors: Frank Calegari; Vesselin Dimitrov; Yunqing Tang
- edition: JAMS 38 (2025), 627–702; author published PDF
- sha256: 867026fbcc5592728173e5c4d6a87f58d57a55b0d0d8b0109b9774e84290ee1e
- accessed: 2026-10-06
- readSections: Introduction p.628, converse; Lemma 4.2.2 and proof, p.655



### pan22-preprint

[On locally analytic vectors of the completed cohomology of modular curves II](https://arxiv.org/pdf/2209.06366v1).

- authors: Lue Pan
- edition: arXiv:2209.06366v1; preprint read, not the 2026 journal text
- sha256: 0873b61a758c57a9c5567f8e9ed7d905adcb7b359013a24e680facd1027b31b4
- accessed: 2026-10-06
- readSections: 4.1.2, p.34: logarithmic Kodaira–Spencer



### dieulefait-pacetti21

[A simplified proof of Serre’s conjecture](https://arxiv.org/pdf/2108.07577v2).

- authors: Luis Victor Dieulefait; Ariel Martín Pacetti
- edition: arXiv:2108.07577v2; preprint
- sha256: 0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6
- accessed: 2026-10-06
- readSections: Definition 1.12 and Lemmas 1.13–1.14, pp.7–9



### Version-sensitive records


kind: published; url: https://www.numdam.org/article/ASENS_1974_4_7_4_507_0.pdf; citation: Deligne-Serre (1974), printed p. 522; read: 2026-10-06

## Source cautions


id: AlgebraicModularFormsAndSerreWeights/E1; source: serre87-duke; kind: error; affects: nothing; locator: 2.4, Remarques (1), printed p. 186; printed: (1) Le cas très ramifié n'est possible que si les caractères ε₁ et ε₂ définis par (2.4.2) sont égaux, et l'on a alors m = 1 ou m = 2 : cela se voit en utilisant l'action par conjugaison de G_p sur ρ_p(I_p).; correction: … et l'on a alors m = 1 ou m = 2 si p > 2, et m = 1, 2 ou 3 si p = 2.; reason: For p = 2 the Kummer classes live in K₀^*/K₀^{*2}, whose unit part is larger than for odd p (there is no isomorphism D^*/D^{*p} ≅ F̄_p as in Edixhoven (8.5.1)), and the Frobenius-compatibility equations 8.4.2 allow a third independent class; Edixhoven's Proposition 8.5 states m ∈ {1, 2} for p > 2 and m ∈ {1, 2, 3} for p = 2. The weight k does not depend on m, so the recipe is unaffected.; known: Edixhoven, The weight in Serre's conjectures on modular forms, Invent. Math. 109 (1992), Proposition 8.5 ("Compare [26], §2.4, Remarques"); searched: Edixhoven, weight.dvi (sha256 ff106eeb…), §8.4–8.5


id: AlgebraicModularFormsAndSerreWeights/E2; source: calegari-geraghty18; kind: error; affects: nothing; locator: §3.2.3, printed p.315; printed: W_x²=x⟨x⟩ for the preceding general weight n.; correction: W_x²=x^n⟨x⟩; the printed scalar is correct when n=1.; reason: The two isogeny differential maps compose to [x]*, multiplication by x on ω and by x^n on its nth tensor power. The subsequent application is weight one.; known: PAPER-CALEGARI-GERAGHTY-18/E21, confirmed by the routed independent review; retained here at its consuming construction.; searched: Original published CG18 §3.2.3, pp.314–315; Reviewed PAPER-CALEGARI-GERAGHTY-18 extraction and erratum confirmation


id: AlgebraicModularFormsAndSerreWeights/E3; source: calegari-geraghty18; kind: misprint; affects: nothing; locator: §3.2.3, printed p.315; printed: The displayed composite defining W_x starts at H⁰ but has target H^i; its intermediate curve notation is X_Δ(Q,x).; correction: The definition displayed there has target H⁰ and the auxiliary-level notation X_Δ(Q;x). Extensions to i=1 need the sheaf construction.; reason: The text defines an operator on H⁰ and both preceding maps preserve cohomological degree. The same paragraph consistently uses the semicolon for auxiliary level.; known: PAPER-CALEGARI-GERAGHTY-18/E22, confirmed by the routed independent review; retained here at its consuming construction.; searched: Original published CG18 §3.2.3, pp.314–315; Reviewed PAPER-CALEGARI-GERAGHTY-18 extraction and erratum confirmation

## Recorded closure gaps

These are precise leaves of planned stages, not missing targets hidden by a completion label.


### Pinned algebraic API integration

Exact baseline names and hypothesis checks remain for finite/free operator subalgebras, finite generic fibers of finite domain algebras, lying over in integral closure, nonzero-prime localization of a Dedekind domain, the flat tensor-inclusion theorem, finite-free endomorphism base change, and integral-coordinate clearing/reassociation. These are explicit existing-library search obligations, not permission to duplicate their mathematics. The displayed proof is not claimed closed at the baseline.

Needed by: [Deligne-Serre eigenvalue lifting](#R15-5-deligne-serre-eigenvalue-lifting-lemma), [Lift a character to a dominating DVR](#R15-5-character-valuation-lift), [Faithfulness survives extension of the operator algebra](#R15-5-generic-action-faithfulness), [Clear denominators of a common eigenvector](#R15-5-integral-eigenvector).


### The level-2 tame case of the dyadic weight dichotomy

Verified: Serre 2.6 gives k ∈ {2, 4} with k = 4 exactly in the wild très ramifiée case; Edixhoven Proposition 8.2 (valid at p = 2) gives finite ⇔ peu ramifiée in the wild case; unramified representations are finite. Not verified: that a ρ₂ whose tame characters are the fundamental characters of level 2 is finite over ℤ₂. Raynaud Theorem 3.4.3 gives a prolongation over the strict henselisation, but at e = p − 1 uniqueness can fail (Proposition 3.3.2(3)), so its descent to ℤ₂ needs an argument that no source read writes out. Khare–Wintenberger state the dichotomy without proof. Next action: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.5 (request), or a Breuil–Kisin argument at p = 2.

Needed by: [At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case](#R15-4-dyadic-weight-two-or-four).


### Geometric and stack carriers at the pinned libraries

The pinned libraries supply schemes, module presheaves and sections but not this compactified elliptic moduli stack, its Hodge tensor powers or logarithmic connection. The exact supplier requests are prerequisite leaves. Suggested signatures use real section modules for expressible fragments; missing moduli/connection conditions are omitted explicitly, never encoded as arbitrary Prop fields. Complete geometry signatures need the supplied carriers.

Needed by: [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization), [Geometric cusp forms](#R15-1-cusp-ideal-section-forms), [Coefficient maps of geometric forms](#R15-1-coefficient-maps), [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison), [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer), [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image), [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action), [Fricke action on Hodge powers](#R15-2-fricke-hodge-action), [Twisted Serre duality for Hecke actions](#R15-3-twisted-serre-duality-hecke), [Geometric Fricke map](#R15-2-curve-fricke-map), [Root-dependent Fricke operator](#R15-3-edixhoven-root-fricke-operator).


### All-prime bounded-denominator comparison

CDT25 Lemma4.2.2 explicitly invokes Shimura Theorem3.52. That original theorem has not been read here. The analytic all-prime theorem is an upstream import, and the level-prime geometric lattice/model comparison is not supplied by Katz’s ℤ[1/N] smooth curve alone. Verify the owned lattice theorem and the integral level-prime comparison before closing this application.

Needed by: [Bounded denominators for congruence forms](#R15-2-bounded-denominators-congruence-application), [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image).


### Gross torsion weight-one operator

CG18 invokes Gross1990 §4/Proposition4.1 for T_p over O/varpi^m. CG18/CG20 and Katz77 were read, but Gross’s original coefficient-general construction has not been read. Supply its exact base/level hypotheses and a proof of preservation of geometric sections; the formal U+⟨p⟩V equation is not that proof.

Needed by: [Weight-one Hecke operator at p](#R15-3-weight-one-tp-with-torsion-coefficients).


### General theta-cycle proof and small-level reduction

Edixhoven3.2–3.4 and §7 are read and specify the arbitrary-prime tables and reduction argument. Its citation [13] §7 (Jochnowitz, theta-cycle classification) and Serre Astérisque24–25 Theorem3 for N=1,p=2,3 have not been read. The displayed tables remain explicit targets; close the cited proof inputs or give the indicated finite supersingular computation.

Needed by: [Tate's theta-cycles, with the p > 3 classification and the explicit p = 2 and p = 3 tables](#R15-3-theta-cycles-and-the-small-characteristic-tables), [Every mod p eigensystem comes, up to a theta-twist, from weight at most p+1](#R15-3-weight-reduction-to-at-most-p-plus-one).


### Ribet input to normalized bad-dihedral application

Retain the routed source boundary from ClassicalSerreModularity: Ribet, Images of semistable Galois representations, Proposition2.2 has not been read. DP Lemma1.14 supplies the fuller niveau proof and KW6.2(ii) the conclusion, but the cited original input and the supplier’s image identification still need independent verification. No claim of source closure is made.

Needed by: [Bad-dihedral normalized weight constraint](#R15-4-bad-dihedral-normalized-weight-application).


### Character lattice and Katz shift-to-reduction image

The fine-level Katz holomorphic base-change theorem does not automatically handle cusp twists, low-level stabilizer invariants or a character projector whose order is not a unit. Establish the H¹-torsion criterion in the exact requested character/level setting and provide a Hasse-power shift landing in that reduction image for the Katz-modularity equivalence. Same-weight lifting is stated only for an actual reduction eigenvector.

Needed by: [Integral lattice and reduction image](#R15-2-integral-lattice-and-reduction-image), [Weight shift and true eigenform lifting](#R15-5-reduction-to-weight-at-least-two-and-to-a-true-eigenform), [Modularity formulations and determinant congruence](#R15-6-modularity-formulations-and-determinant).


### Fontaine–Laffaille convention and classification

The supplier’s contravariant U_S functor and simple-object theorem give χ^r for positive filtration degree r (HT(χ_cyc)=+1). The extension-sensitive rank-two classification, including the ordered stable line in the wild branch and the r=1 finite-flat/peu assertion, is requested rather than inferred from Edixhoven’s geometric modular-form proof. Reconcile coefficient embeddings and the residual functor convention before closure.

Needed by: [Fontaine–Laffaille weight comparison](#R15-4-fontaine-laffaille-weight-comparison).

## Supplier requests

The supplier retains ownership of each imported theorem or construction. Existing upstream work is never re-planned.


- **tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields**: Reuse finite integral Hecke theory and the separately justified weight-one 8W lattice. Proposition 2.7 is not Lemme 6.11; the requested lattice is input, not an assertion of arbitrary Katz lifting. Needed by `AlgebraicModularFormsAndSerreWeights:R15.5`.


- **tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor**: After lifting the specified eigenvalue family, supply the exact newform/oldform and normalization result with its level, character and bad-prime data. A good-prime eigenvector is not automatically a normalized full eigenform at the same level. Needed by `AlgebraicModularFormsAndSerreWeights:R15.5`.


- **ArithmeticGaloisRepresentations:R01.2**: Tame inertia I_t of ℚ_p, its identification with lim F_{p^n}^×, the fundamental characters of levels 1 and 2 and the conjugation action u ↦ u^p of a Frobenius lift (Serre 1987, 2.1). Needed by [The two tame characters of a local residual representation are of level 1 or of level 2 and then conjugate](#R15-4-tame-inertia-characters-of-a-local-residual-representation), [Well-definedness of the local weight recipe](#R15-4-recipe-well-definedness-and-twisting).


- **ArithmeticGaloisRepresentations:R01.3**: The prime-to-p Artin conductor N(ρ̄) of a residual representation, n(l, ρ̄) = dim V/V^{G_0} + b(V) (Serre 1987, (1.2.1)–(1.2.2)). Needed by [S-type representations, "arises from a newform" and "modular", and their invariance under the coefficient field](#R15-6-s-type-arises-from-and-modular), [Classical Serre target](#R15-6-serre-conjecture-target-with-N-k-epsilon).


- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5**: Finiteness at 2 of ρ₂ : G_{ℚ₂} → GL₂(F̄₂) whose tame characters are the fundamental characters of level 2: the descent to ℤ₂ of Raynaud's prolongation over ℤ₂^nr (Theorem 3.4.3), where uniqueness may fail because e = p − 1 = 1. Needed by [At p = 2 Serre's weight is 2 or 4, and it is 4 exactly in the wild très ramifiée case](#R15-4-dyadic-weight-two-or-four).


- **ModularCurvesPartII:R13.3**: The Tate curve Tate(q^n) over Z[1/n, ζ_n]((q)) with its canonical differential and level structures, as the formal neighbourhood of each cusp. Supply the full reduced cusp divisor with its Cartier ideal and Tate vanishing-order interpretation. Needed by [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization), [Geometric cusp forms](#R15-1-cusp-ideal-section-forms).


- **ModularCurvesPartII:R12.5**: Supply the elliptic Hodge line on the compactified moduli stack and its analytic automorphy/Tate trivialization; Kodaira–Spencer is proved in R15.1/logarithmic-kodaira-spencer. Needed by [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization), [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison).


- **ModularCurvesPartII:R14.1**: The Hecke correspondences T_l on M_n via the l + 1 subgroups of order l, with the level structure π(α_n) (Katz 1.11.0). Needed by [Hecke operators defined over arbitrary coefficient modules by their q-expansion formula](#R15-2-integral-hecke-operators-from-q-expansions).


- **ModularCurvesPartII:R13.4a**: Proper rigidifying covers, effective descent of sections and the coherent finiteness/base-change interface on the integral compactified stack; no coarse-space descent in all weights. Needed by [Geometric modular forms in every integral weight](#R15-1-hodge-bundle-with-tate-curve-normalization), [Finite generation of geometric forms](#R15-2-finite-generation-of-geometric-sections), [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison).


- **ComplexComparisonPartII:C2**: Projective coherent GAGA for all integer Hodge powers and cusp twists, compatible with finite group action and descent. Needed by [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison).


- **tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus**: Analytic modular forms, character spaces and automorphy factor for each integer weight; the geometric comparison identifies its actual carrier. Needed by [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison).


- **AbelianSchemesAndArithmeticModuli:A4**: Universal elliptic relative de Rham bundle, Hodge filtration, Gauss–Manin connection and cup product with base-change and isogeny functoriality. Needed by [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer), [The theta operator, the filtration w(f), and their Hecke commutation relations](#R15-3-theta-operator-filtration-and-hecke-commutation).


- **AutomorphicBundles:B3**: Canonical logarithmic extension of the elliptic de Rham bundle and connection at modular cusps; R15.1 owns the Kodaira–Spencer proof. Needed by [Logarithmic Kodaira–Spencer isomorphism](#R15-1-logarithmic-kodaira-spencer).


- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2**: General BT₁ Hasse invariant det(V*) and its compatibility with dual Frobenius, with the determinant-line conventions fixed. Needed by [Elliptic modular Hasse invariant](#R15-3-hasse-invariant-as-a-form-of-weight-p-minus-one).


- **ModularCurvesPartII:R13.5**: Ordinary Igusa cover/tower, tautological Hodge differential and full unit-group monodromy modulo p^m, including p=2 and3. Needed by [Igusa interpretation of Hasse and theta](#R15-3-igusa-interpretation-of-hasse-and-theta), [Congruences of weights on the ordinary tower](#R15-3-weight-congruences-on-the-ordinary-tower).


- **ModularCurvesPartII:R14.1**: Auxiliary compactified moduli curve, degeneracy projections and extended quotient-isogeny Hodge maps; U_y correspondences at y|Q. The auxiliary curve map w_x and its square are constructed in R15.2, not requested from this supplier. Needed by [Fricke action on Hodge powers](#R15-2-fricke-hodge-action), [Hecke action on torsion coherent cohomology](#R15-2-torsion-cohomology-hecke-action), [Geometric Fricke map](#R15-2-curve-fricke-map).


- **ArithmeticGaloisRepresentations:R01.4**: S-type image and bad-dihedral identification: cyclotomic restriction reducible iff restriction to ℚ(√p*) reducible, p*=(-1)^((p−1)/2)p, with the induced-dihedral structure and projective inertia facts. Needed by [Bad-dihedral normalized weight constraint](#R15-4-bad-dihedral-normalized-weight-application).


- **ArithmeticGaloisRepresentations:R01.5**: Finite-field semisimplification, stable-lattice independence/Brauer–Nesbitt and realizability over the field of characteristic-polynomial coefficients, without a dependency on late R15.6 definitions. Needed by [Residual modularity witness](#R15-6-residual-modularity-witness), [Coefficient-field descent in the residual definition](#R15-6-realizability-over-the-field-of-characteristic-polynomials), [S-type representations, "arises from a newform" and "modular", and their invariance under the coefficient field](#R15-6-s-type-arises-from-and-modular), [Modularity formulations and determinant congruence](#R15-6-modularity-formulations-and-determinant).


- **AutomorphicGaloisRepresentations:R19.1**: The remaining coefficient-place transport and stable-lattice/residual semisimplification interface for the attached representations. The characteristic-zero weight≥2 and weight-one attachments and the reduction-eigenform residual representation are finer node imports. Do not import late R15.6 as a prerequisite of the early residual construction. Needed by [Residual modularity witness](#R15-6-residual-modularity-witness), [Modularity formulations and determinant congruence](#R15-6-modularity-formulations-and-determinant).


- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.5**: The extension-sensitive finite-flat/local inertia cases consumed by the R15.4 comparison and the finite torsion model of good semistable elliptic curves; the Fontaine–Laffaille functor/classification itself is imported from R07.3. Needed by [Fontaine–Laffaille weight comparison](#R15-4-fontaine-laffaille-weight-comparison), [Serre weight of semistable elliptic torsion](#R15-4-semistable-elliptic-torsion-weight).


- **tauceti:TauCetiRoadmap/EllipticCurves#layer-3-elliptic-curves-over-finite-fields--the-hasse-bound-aec-v1**: Relative Frobenius, dual isogeny Verschiebung and their action on invariant differentials; the geometric form operation is the R15.3 specialization. Needed by [Frobenius and Verschiebung on forms](#R15-3-frobenius-verschiebung-on-expansions).


- **tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv**: Tate curve torsion exact sequence and Kummer class q_E, including the unramified quadratic twist for nonsplit multiplicative reduction. Needed by [Serre weight of semistable elliptic torsion](#R15-4-semistable-elliptic-torsion-weight).


- **FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3**: Rank-two extension-sensitive inertia classification for residual Fontaine–Laffaille weights {0,r}, 1≤r≤p−2, including the r=1 finite/peu assertion, using the existing contravariant U_S functor and positive-weight inertia dictionary. The functor and simple-object dictionary are finer node imports, not new constructions. Needed by [Fontaine–Laffaille weight comparison](#R15-4-fontaine-laffaille-weight-comparison).


- **tauceti:TauCetiRoadmap/ModularForms#layer-10-the-modular-curve-γℍ-and-the-dimension-formulas**: Reuse Layer10C’s analytic automorphy line, all-integer-weight section-space interpretation and stabilizer/cusp conventions; the algebraic/analytic GAGA bridge alone is owned by R15.1. Needed by [All-weight analytic comparison](#R15-1-all-weight-analytic-comparison).


- **ModularCurvesPartII:R13.4b**: The compactified quotient/contraction interface for auxiliary Γ₀(x) level and universal isogeny differentials, including cusp charts and compatibility with the Δ quotient; CG18 cites Conrad Proposition4.4.3, not read here. This supplies the extension input, not the new w_x construction. Needed by [Geometric Fricke map](#R15-2-curve-fricke-map).


- **SchemeAndStackFoundations:SF.3**: Relative coherent Serre duality for a smooth proper curve over a DVR, with the K/O duality H¹(L^∨⊗Ω⊗K/O)≅Hom_O(H⁰(L),K/O) under the finite-free/base-change hypotheses of the fine modular curve, and functoriality for finite-flat isogeny correspondences. SF.2 proper adjunction and trace provide the general input; field-only Serre duality does not by itself supply this torsion-coefficient specialization. Needed by [Twisted Serre duality for Hecke actions](#R15-3-twisted-serre-duality-hecke).
