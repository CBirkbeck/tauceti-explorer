# Elliptic curves, Part II: rank-zero and rank-one Birch–Swinnerton-Dyer theory

## BSD.7a — Eisenstein-prime main conjectures and exact local corrections

This layer proves the good Eisenstein-prime Iwasawa comparisons needed by the prime-part BSD arguments. It starts from the existing EllipticCurves roadmap: isogenies, invariant differentials, torsion, Tate modules and good ordinary local representations belong there. It imports Selmer cohomology, characteristic ideals, ordinary p-adic functions, character main conjectures and actual Euler systems from their owners. The work here is the arithmetic comparison at a reducible residual representation, including its local errors and integral lattices.

The outputs are the source-qualified anticyclotomic Greenberg equalities, the Heegner index-square comparisons with their coefficient rings specified, and the integral cyclotomic Mazur equalities. BSD.7 consumes these to establish BSD prime parts. HE.8b and ModularIwasawaMainConjectures L6 consume the main-conjecture results; neither supplies an equality to this proof. BSD.8 reconstructs leading terms from prime-part certificates and BSD.9 owns the endpoint fixtures. Bad-reduction and supersingular formulas are outside this layer.

Every numbered target below is work to be built. A source assertion whose integral justification has a recorded gap is a target with that exact proof obligation, not an established theorem of this blueprint. The planning pass is complete and the single stage is **planned**, with nine explicit gaps. All implementation statuses are **unchecked**.

### Conventions and common hypotheses

Let E/ℚ have conductor N and let p>2 be a prime with p∤N and E[p] reducible, equivalently admitting an actual rational cyclic p-isogeny. Good reduction at an Eisenstein prime is ordinary; the ordinary filtration is the actual filtration on a stable lattice, not a chosen decomposition of the residual semisimplification. Write ω for the mod-p cyclotomic character. In the **CGS branch**, E[p]^ss=𝔽_p(φ)⊕𝔽_p(ψ), φψ=ω, and φ|G_p differs from both 1 and ω. This gives E(ℚ_p)[p]=0. In the **KY branch**, the local characters 1 and ω are allowed. Analytic ordering of the characters, with the first unramified at p, is separate from ordering the subcharacter and quotient in a nonsplit lattice.

When used, K is imaginary quadratic with odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits. No condition p∤h_K is inserted. Fix embeddings defining v, the coefficient extension, a modular parametrization and Néron differentials. O is a finite p-adic coefficient DVR, ϖ its uniformizer, and F its fraction field. The weight in this layer is two; the KY notation of weight 2r is used only at r=1.

Write Λ_Q=O⟦Γ_Q⟧ for the cyclotomic algebra over ℚ, Λ_K for the two-variable algebra over K, and Λ_K^+, Λ_K^- for its cyclotomic and anticyclotomic quotients. In an anticyclotomic argument Λ means Λ_K^-. A superscript ur or nr means completed extension to unramified coefficient integers, as in the source. It does not mean inversion of p. A rationalized equality is explicitly over Λ[1/p]. After choosing γ, the augmentation parameter is T=γ−1. The height-one primes (T) and (ϖ) are different; controlling the first does not control the second.

For a lattice T_lat, set V=T_lat⊗_O F and W=V/T_lat. The compact induced module uses the tautological action Ψ and the discrete induced module its inverse Ψ⁻¹; Pontryagin duality involves ι(γ)=γ⁻¹. These are the induced modules of SelmerIwasawaCohomology L3, not privately defined stand-ins. The Greenberg condition in **all three** CGS, CGLS and KY sources is relaxed at v and strict at v̄, unramified away from p. Ordinary–relaxed is ordinary at v and relaxed at v̄. KY's additional unramified variant replaces the strict v̄ condition by the kernel of restriction to inertia. For its rank-two lattice the comparison kernel is finite cyclic. The rank-one character calculation has different kernels, specified below.

Choose the finite set Σ containing the bad places, v,v̄ and infinity, with every finite place in Σ lying over a split rational prime. Only S=Σ∖{v,v̄,∞} indexes the Euler correction. For ℓ below w put

P_w(V,X)=det(1−Frob_w X | V_{I_w}),

using inertia **coinvariants** and arithmetic Frobenius. Evaluate at ℓ⁻¹γ_w, or ℓ⁻¹γ_w^+ in the cyclotomic quotient. The inverse action on the induced coefficient module is a separate convention. A primitive/imprimitive exact sequence requires the stated cotorsion and global-to-local surjectivity hypotheses. It gives char(X^S)=char(X)·∏(P_w), not an unconditional identity for arbitrary local structures.

Use B for the **full central-value** function: CGS's L_p^BDP, CGLS's L_E and KY's L_f under their matched periods. These functions already interpolate the square in the CM construction. The Greenberg equation is char(X_Gr)=(B), not (B²). A separate square-root measure b requires the precise comparison B∼b², including its involution and coefficient lattice. CGS's period comparison is Ω_∞=2πi Ω_K (Remark 2.3.2, p.8).

### Proof structure and ownership

The residual calculation and the analytic congruence are independent of a Heegner divisibility. The actual residual extension gives a comparison of character Selmer modules; the p-depleted CM-value congruence gives the corresponding comparison of Katz functions. Character main conjectures and Hida's anticyclotomic Katz μ theorem yield μ(X_Gr)=μ(B)=0 and equal λ. A proved one-sided divisibility is still needed to identify their characteristic ideals.

The CGLS prototype assumes (Sel), namely corank Sel_{p∞}(E/K)=1. The CGS bounded-error Kolyvagin argument removes this extra condition: its error is uniform as the character approaches 1. It establishes the Heegner divisibility at augmentation while still inverting p. Translate that bound to Greenberg/BDP over Λ[1/p], then combine it with the independent μ=0 and λ comparison to obtain the integral Greenberg equality. An integral equality for the actual **unscaled** Heegner line additionally needs an integral two-way logarithm and lattice calculation. Do not infer it solely from μ(X_Gr)=0.

KY replaces the local no-invariants shortcut by exceptional-character cohomology and an invariant-free nonsplit lattice. Its imprimitive residual formula has an extra +1 when the subcharacter is globally ω and the quotient globally trivial. The trivial character main conjecture has char X_1=(T·L_1), hence another +1 on the character side; these cancel in the final algebraic/analytic invariant comparison. A local trivial character has an O-cofree restriction kernel, not a finite one. The finite cyclic kernel for the rank-two Greenberg/unramified comparison is a different statement. The chosen KY lattice, the original curve's lattice and Wüthrich's distinguished lattice are related by actual finite-index maps; they are not identified by notation.

For the cyclotomic proof, Wüthrich supplies an **integral** individual Kato containment in Néron normalization. Actual specialized BF classes first yield a rational twisted bound. Arbitrarily high finite-power congruences and the untwisted integral bound compare μ and remove the scalar denominator. Twisted augmentation control and the independently proved anticyclotomic equality then make the remaining integral quotient a unit. Descend from K using odd-p Shapiro and the product factorization of the PR function, together with the individual integral containments. No cyclotomic μ=0 assertion enters this argument.

Two integral interfaces require special care. First, the p-irregular CM congruence ideal is outside the residual-distinction hypothesis of the generic Hida–Tilouine node. Both divisibilities between the cuspidal congruence ideal and h_K times Katz must be proved for this family. Second, CGS v2's normalized PR Coleman map has an unresolved scalar/cokernel inconsistency, detailed in the source findings below. The rational BF argument survives this scalar; an uncorrected integral equivalence is not an available input. The exact target graph retains these proof obligations in the appropriate suppliers.

### Baseline and dependency boundary

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed audit in data/library-coverage.json reports BSD.7a unbuilt. Existing Mathlib power-series algebra supplies the augmentation/unit test; it supplies no arithmetic main-conjecture carrier. The six baseline references are PowerSeries, PowerSeries.constantCoeff, PowerSeries.C, PowerSeries.X, PowerSeries.coeff_succ_mul_X and PowerSeries.isUnit_iff_constantCoeff. Their bodies and hypotheses were checked at the pin. For the latter, over a ring R, a series is a unit exactly when its constant coefficient is a unit. Over a semiring, multiplication by X shifts the coefficients by one.

The current read-only TauCetiRoadmap and Tau Ceti library were checked separately from the pins, including the added roadmap directions and the elliptic Tate-module/Galois material. The newer tateModuleGaloisRepresentation API is not a pinned baseline declaration. EllipticCurves Layers 1, 2 and 4 remain the owners of the isogeny, Tate-module and local reduction prerequisites. The existing ModularForms roadmap supplies the modular-form foundations. The nine roadmap additions absent from the atlas snapshot do not supply an Eisenstein main-conjecture proof.

The generic suppliers are SIC L2–L4 for Selmer kernels, exact sequences and structure criteria; PMIA L4 for characteristic ideals and μ,λ; early HE.8 for actual Heegner classes, derivative relations and nonvanishing; ES.4 and ES.8 for error-tolerant descent and height-one specialization; GZ.9 for actual Heegner logarithm and isogeny/differential comparison; AC L2 for actual generic KLZ classes and reciprocity; PF L1/L4 and PHR L3 for congruence modules and regulator ingredients. Their precise imported node IDs appear below. Where a generic theorem has stronger hypotheses, this layer verifies them or records the arithmetic extension request; a name match is insufficient.

CMAllPrimeMainConjectures CZ.2–CZ.3 already owns elliptic units, the two-variable Rubin theorem and character specialization. AP L3h owns Hida's Katz μ theorem. Consequently RT-AREA-iwasawa-1/5 is handled by using those existing owners and requesting the exceptional specialization, rather than creating a second elliptic-unit roadmap. The Wüthrich addition belongs to Kato L4, with IntegralIwasawaTheory L4's Ferrero–Washington theorem, and its Néron/modular-symbol period comparison belongs to ModularSymbols L1. The packet's rescope proposal records these Part II additions without changing the existing upstream roadmaps.

### Targets and declaration contracts

All IDs in the following subsections have prefix `RankZeroOneBSD:BSD.7a/`. The common hypotheses above are repeated only when needed to distinguish branches. Each target lists its exact direct prerequisites; stage-level references are accompanied by the explicit supplier contracts after the target list. “Check” gives an acceptance condition, not a claim that Lean has proved the arithmetic assertion.

## Residual and analytic comparisons

### Ordinarity and local invariants at a good Eisenstein prime

**good-eisenstein-ordinarity** (lemma). Good reduction and a G_ℚ-stable line in E[p] imply ordinary reduction at p. Under CGS’s local exclusion both residual characters differ from 1 on G_p, so E(ℚ_p)[p]=0 and hence E(ℚ)[p]=0; for split p, E(K)[p]=0. In the Keller–Yin branch ordinarity still holds but this vanishing is not asserted.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof plan.** Use the supersingular inertia description to exclude a residual one-dimensional G_p-subrepresentation; import the local representation classification. Use φψ=ω. If either φ or ψ were trivial locally, φ would be 1 or ω. A local invariant vector would yield a trivial composition factor. Restrict along K_v=ℚ_p to deduce E(K)[p]=0 only in the excluded-character case.

**Check.** A rational p-torsion point has character 1 and fails the CGS exclusion even when reduction is good ordinary.

**Direct dependencies.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Introduction, p.1; proof of Theorem 4.3.1, pp.19–20. The residual local exclusions justify precisely the no-invariants hypotheses used in CGS; KY removes them by a different lattice argument.

### Ordinary, Greenberg and unramified Eisenstein Selmer comparisons

**selmer-convention-dictionary** (comparison). Fix T, V=T⊗Frac(O), W=V/T and the ordinary line T⁺ at p. Compact induced coefficients carry Ψ; discrete induced coefficients carry Ψ⁻¹, and Pontryagin duality carries ι(γ)=γ⁻¹. The Greenberg condition used throughout CGS, CGLS and KY is relaxed at v and strict at v̄, with unramified conditions away from p. Ordinary–relaxed means ordinary at v and relaxed at v̄; the complementary ordinary–strict condition enters the dual sequence. KY also uses the unramified condition at v̄. For its chosen rank-two lattice the Greenberg/unramified restriction kernel is finite cyclic (Lemma 1.3.6), giving equal height-one characteristic ideals. No equality of finite control groups or Fitting ideals follows from this.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof plan.** Instantiate SIC’s kernels and inverse limits with arithmetic Frobenius and the inverse tautological action. Identify the finite restriction kernel from KY Lemma 1.3.6 and take the Pontryagin dual with the involution. Use the source’s exact local conditions, not a name-based identification of different Selmer modules.

**Check.** The strict/unrestricted places must not be interchanged without the induced conjugation/involution. A finite Λ-module can have unit characteristic ideal and nonunit Fitting ideal.

**Direct dependencies.** `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Definition 3.1.1 and equation (3.1), pp.11–12. Defines the three distinct p-local structures and the compact/discrete coefficient actions.; [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Definition 1.2.1, printed p.529. Uses relaxation at v and the zero condition at v̄, with the same orientation as CGS.; [ky](https://arxiv.org/pdf/2402.12781v2), Definition 1.2.1, p.13; Lemmas 1.3.5–1.3.6, pp.21–22. The rank-two Greenberg/unramified comparison has the stated finite restriction kernel; this is different from the character calculation in Proposition 1.1.3.

### Primitive and imprimitive Euler factors

**cgs-primitive-euler-comparison** (comparison). Let Σ contain the bad primes, v,v̄,∞ and have all finite places split in K. Put S=Σ∖{v,v̄,∞}. For each w∈S define P_w(V,X)=det(1−Frob_w X|V_{I_w}) on inertia coinvariants. For the anticyclotomic branch evaluate it at ℓ⁻¹γ_w, and for CGS’s cyclotomic branch at ℓ⁻¹γ_w⁺, where ℓ is the prime below w and γ is the image of arithmetic Frobenius. The inverse tautological action on the induced coefficient module is separate. Under the stated cotorsion and surjectivity conditions, char X^S=char X·∏_{w∈S}(P_w), and analytic removal multiplies by the same finite factors. Thus μ and λ corrections are those of exactly S before cancellation. This node supplies the locally excluded CGS/CGLS branch.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The actual Selmer dual under comparison is torsion. For CGS’s cyclotomic comparison E(K)[p]=0 and global-to-local surjectivity are verified as in Proposition 3.3.2; the local exclusion above supplies E(K)[p]=0.

**Proof plan.** Apply SIC’s primitive/imprimitive exact sequence under the verified invariants and surjectivity conditions. Identify the local quotient characteristic polynomial with CGS Proposition 3.3.2 for the cyclotomic branch, and CGLS §1.5/Theorem 1.5.1 for the anticyclotomic branch; add its μ,λ only after proving torsion. Match CGS Definition 2.5.2 and CGLS §1.5, using inertia coinvariants and ℓ⁻¹γ_w; cancel the same nonzero finite Euler product in the domain.

**Check.** No infinite sum over all w∤p or archimedean Euler factor enters the λ formula.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/selmer-convention-dictionary`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `AutomorphicPadicLFunctions:L0/euler-factor-elements`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`.

**Sources.** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Published §1.5, pp.537–538; Theorem 1.5.1. Only the finite S-indexed sum is used; the extraction’s E18 correction is retained.; [cgs](https://arxiv.org/pdf/2303.04373v2), Definition 2.5.2, p.10; Proposition 3.3.2 and Corollary 3.3.3, p.13. The cyclotomic Euler comparison has actual cotorsion and residual-invariant hypotheses; Definition 2.5.2 fixes the coinvariant/Frobenius convention.

### CGLS residual extension and algebraic Iwasawa invariants

**cgls-character-lambda-comparison** (theorem). Under the locally excluded CGS conditions the unrestricted-at-v, strict-at-v̄ anticyclotomic dual X_E is torsion, μ(X_E)=0 and λ(X_E)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). The proof uses the actual residual extension E[p], residual Selmer comparison, and no finite Λ-submodules; it does not replace E[p] by its semisimplification as a representation.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Use the long exact cohomology sequence of 0→𝔽_p(φ)→E[p]→𝔽_p(ψ)→0 and the source local surjectivity/invariant vanishings to obtain the residual Selmer exact sequence (CGLS Proposition 1.4.1). Use the elliptic-unit main-conjecture input for character modules and their μ=0. Identify residual dimension with λ using Proposition 1.4.2 and Corollary 1.4.3, whose no-finite-submodule proof is an input to this identification. Remove imprimitive factors using cgs-primitive-euler-comparison, retaining only S.

**Check.** Splitting the residual representation without checking the connecting map is rejected.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/good-eisenstein-ordinarity`, `RankZeroOneBSD:BSD.7a/cgs-primitive-euler-comparison`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3/katz-functional-equation`, `CMAllPrimeMainConjectures:CZ.3/anticyclotomic-theta-main-conjecture`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `CMAllPrimeMainConjectures:CZ.3`.

**Sources.** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 1.5.1, printed p.538; character inputs in Theorem 1.2.2, pp.531–532. The theorem asserts cotorsion, μ=0 and the finite corrected λ formula.

### Kriz congruence and analytic Iwasawa invariants

**eisenstein-cm-value-congruence** (theorem). For the ordinary weight-two newform f_E with reducible residual representation, compare its p-depleted q-expansion at CM points with the Eisenstein series attached to the residual characters. With the source’s integral periods and Euler factors, its anticyclotomic BDP function has μ=0 and λ(L_E)=λ(L_φ)+λ(L_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(E))). In KY’s local 1/ω case the analytic ordering of characters is relabelled so the first is unramified at p; it need not equal the ordering of the nonsplit lattice.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Label the analytic characters with p∤cond(φ), as required by KY Theorem 2.2.2. This analytic ordering need not equal the chosen residual-lattice ordering.

**Proof plan.** Apply CGLS Theorem 2.2.1/Kriz’s congruence to the p-depleted forms, including integral CM evaluation and the unit periods; KY Theorem 2.2.1 proves that p-depletion kills the otherwise unmatched constant term. Factor the Eisenstein CM values into the two Katz character functions and the finite S Euler products of KY §2.2/CGLS §2.2, with P_w evaluated at ℓ⁻¹γ_w. This analytic calculation uses the interpolation/Euler-factor dictionary, not the narrower algebraic CGS surjectivity theorem. Use the imported Hida Katz μ theorem under its exact hypotheses, then apply CGLS Theorem 2.2.2 or KY Theorem 2.2.2.

**Check.** A change of lattice ordering cannot silently change the analytic character convention.

**Direct dependencies.** `AutomorphicCongruences:L0`, `PadicFamilies:L0`, `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3/katz-functional-equation`, `AutomorphicPadicLFunctions:L0/euler-factor-elements`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `CMAllPrimeMainConjectures:CZ.3/katz-functional-equation-lambda`, `PadicFamilies:L0/katz-padic-modular-functions`, `PadicFamilies:L0/ordinary-eisenstein-family`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorems 2.2.1–2.2.2, pp.32–34; proof of Theorem 2.2.3, p.34. The congruence is for actual forms and CM values, including the broader character case.

### CGLS equality of anticyclotomic Iwasawa invariants

**cgls-algebraic-analytic-invariants** (theorem). Under CGS conditions μ(X_E)=μ(L_E)=0 and λ(X_E)=λ(L_E), with the same primitive anticyclotomic Greenberg module and full central-value BDP normalization. This is an independent residual/congruence computation; it gives equality of characteristic ideals only when combined with a proved one-sided divisibility.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Use cgls-character-lambda-comparison and eisenstein-cm-value-congruence. Import equality of the character-module and Katz-function characteristic ideals from the elliptic-unit supplier, including its exceptional character conventions. Cancel precisely the matching finite Euler correction terms.

**Check.** Equal μ and λ alone do not imply equal distinguished polynomials.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgls-character-lambda-comparison`, `RankZeroOneBSD:BSD.7a/eisenstein-cm-value-congruence`.

**Sources.** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorems 2.2.2–2.2.3, printed pp.543–544. This invariant equality is independent of the Heegner-system divisibility.

### Keller–Yin local character cohomology

**ky-local-invariants-dictionary** (theorem). For KY’s induced discrete character module M_θ over the anticyclotomic Λ=O⟦Γ⟧, the local unramified restriction kernel at a p-place w is O-cofree of rank one when θ|G_w=1. Its dual has Λ-rank zero, rather than being Λ-free of rank one. For θ|G_w=ω the restriction kernel is zero; H¹(K_w,M_θ)^∨ has Λ-rank one, projective dimension at most one, two generators and no nonzero finite Λ-submodule. It is not Λ-free. For the global character Selmer dual X_θ, finite Λ-submodules may occur when θ|G_K=ω; this does not contradict the local assertion. Residual-to-p-torsion comparison uses the source’s actual diagrams.

**Hypotheses.** When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. θ is one of the finite-order residual character lifts used in KY §1.1; the full induced module and inverse tautological action are used.

**Proof plan.** Apply local inflation–restriction and duality with the decomposed p-place; compute invariants case by case (KY Proposition 1.1.3). Use the finite cyclic restriction kernel calculation and the residual diagrams of §1.2 instead of the earlier no-invariants/free-local-module shortcut. Carry these kernels to the global-to-local comparison and retain the finite-submodule errors.

**Check.** Rank one plus projective dimension at most one is insufficient to replace a two-generator module by Λ.

**Direct dependencies.** `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.4/lattice-rational-poitou-tate`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Proposition 1.1.3, pp.10–13; Lemma 1.2.4, pp.15–16; Theorem 1.2.5, pp.16–18. These are the separate trivial and cyclotomic local cases absent from the CGS branch.

### Keller–Yin nonsplit residual lattice

**ky-invariant-free-lattice** (theorem). For KY’s ordinary Eisenstein weight-two representation V, choose a stable lattice T with nonsplit residual extension 0→𝔽_p(φ)→T/pT→𝔽_p(ψ)→0 and H⁰(K,T/pT)=0. In the local 1/ω case orient it with φ|G_p=ω and ψ|G_p=1, while φ|G_K may equal ω. The chosen lattice need not be T_p of the original E. For an elliptic curve realize it by an isogenous curve and retain the source’s p-power index between lattices.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use Ribet’s lattice lemma for the irreducible characteristic-zero representation; do not require E[p] irreducible.

**Proof plan.** Apply KY Proposition 1.3.1 (Ribet lattice) with the ordinary local orientation. Verify that the nonsplit extension has no invariant vector even when its quotient is trivial. Use elliptic Tate-module/isogeny correspondence to relate the chosen lattice to the original curve; preserve the finite p-power quotient and induced Selmer maps.

**Check.** A curve with rational p-torsion can use the theorem after lattice/isogeny comparison; it cannot be declared residual-invariant-free itself.

**Direct dependencies.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`, `RankZeroOneBSD:BSD.7a/ky-local-invariants-dictionary`, `ArithmeticGaloisRepresentations:R01.1/ribet-nonsplit-lattice`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Proposition 1.3.1, p.18; §1.4, pp.23–24; Remark 3.0.9, p.40. Vanishing is obtained on a chosen nonsplit lattice, not assumed for every isogenous curve.

### Keller–Yin trivial-character augmentation correction

**ky-exceptional-character-specialization** (comparison). For the character Iwasawa modules in KY, μ(X_θ)=0. For θ|G_K≠1, char X_θ=(L_θ); in the trivial character case char X_1=(T·L_1), where T=γ−1. Consequently λ(X_1)=λ(L_1)+1. No p∤h_K, nonanomalous-prime, or p>3 hypothesis is added: the requisite Rubin/de Shalit specialization must provide precisely this version.

**Hypotheses.** When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use the full character modules and period-normalized Katz functions of KY Theorem 1.2.2.

**Proof plan.** Import Rubin’s elliptic-unit comparison and Hida’s μ theorem from the existing CMAllPrimeMainConjectures owner. Retain the trivial-isotypic global unit/augmentation term in de Shalit III.1.10/Yager’s specialization, rather than applying the nontrivial character formula unchanged. Read μ and λ from the factor T and the nonzero character function.

**Check.** The λ correction is one, whereas multiplication by T does not change μ.

**Direct dependencies.** `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3/katz-functional-equation`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `CMAllPrimeMainConjectures:CZ.2/classical-two-variable-main-conjecture`, `CMAllPrimeMainConjectures:CZ.3/anticyclotomic-theta-main-conjecture`, `AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`, `CMAllPrimeMainConjectures:CZ.3`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 1.2.2, p.14; proof of Theorem 2.2.3 and Remark 2.2.4, p.34. The extra augmentation accounts for the global trivial-character λ correction.

### Keller–Yin imprimitive residual Selmer comparison

**ky-imprimitive-extension-sequence** (theorem). For the chosen invariant-free nonsplit weight-two lattice with residual subcharacter φ|G_p=ω and quotient ψ|G_p=1, let X_f^S, X_φ^S and X_ψ^S be the actual S-imprimitive unramified Selmer duals over Λ=O⟦Γ⟧. Both X_f^S and X_f are torsion with μ=0. If φ|G_K≠ω, λ(X_f^S)=λ(X_φ^S)+λ(X_ψ^S). If φ|G_K=ω (hence ψ|G_K=1), λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). This is an imprimitive comparison; removing S is a separate theorem.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The lattice is the actual nonsplit lattice of ky-invariant-free-lattice, with H⁰(K,M_f)=0. Σ contains v,v̄,∞ and every ramified place; its finite places split in K, and S=Σ∖{v,v̄,∞}. Character Selmer groups use KY’s same unramified normalization.

**Proof plan.** Use the residual sequence 0→M_φ[p]→M_f[p]→M_ψ[p]→0 and the Greenberg/unramified restriction diagrams of KY §1.4. Character residual Selmer finiteness, together with the finite restriction kernel, implies X_f^S and X_f are Λ-torsion with μ=0. Apply the five-term Perrin–Riou comparison with the actual finite kernels and coinvariants, as in Theorem 1.4.1 and its Lemmas 1.4.3–1.4.4. Distinguish globally trivial ψ: the one-dimensional correction remains even though finite modules have unit characteristic ideal.

**Check.** The globally trivial quotient contributes +1 on the left; no λ=dim(X/p) shortcut suppresses finite-submodule terms.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-invariant-free-lattice`, `RankZeroOneBSD:BSD.7a/ky-local-invariants-dictionary`, `RankZeroOneBSD:BSD.7a/ky-exceptional-character-specialization`, `RankZeroOneBSD:BSD.7a/selmer-convention-dictionary`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), §1.4, Theorem 1.4.1 and its proof, pp.23–31; Lemmas 1.4.3–1.4.4. Separates the imprimitive residual-extension theorem from primitive Euler removal and retains the globally trivial +1.

### Keller–Yin finite Euler comparison

**ky-primitive-euler-comparison** (comparison). On KY’s chosen invariant-free lattice, and on its two character modules, the primitive and S-imprimitive unramified Selmer duals fit into 0→⊕_{w∈S}H¹(K_w,M_?)^∨→X_?^S→X_?→0. For ?=f,φ,ψ, define P_w(?)=det(1−Frob_w X|V_{?,I_w}) evaluated at X=ℓ⁻¹γ_w, where ℓ is the rational prime below w and γ_w is arithmetic Frobenius in Γ. Thus char(X_?^S)=char(X_?)·∏_{w∈S}(P_w(?)) and λ(X_?^S)=λ(X_?)+Σ_{w∈S}λ(P_w(?)). Inertia coinvariants and this Frobenius evaluation are fixed; the inverse tautological action on the induced coefficient module is a separate convention.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use the chosen invariant-free lattice with φ|G_p=ω and ψ|G_p=1. Σ and finite S are as in ky-imprimitive-extension-sequence. Every module uses KY’s unramified local condition, and each global-to-local map is proved surjective; cotorsion is supplied by the imprimitive residual and character theorems.

**Proof plan.** For characters use KY Theorem 1.2.2 and Remark 1.2.3(ii) to prove surjectivity, retaining the corrected anticyclotomic/cyclotomic disjointness argument. For f use Remark 1.4.2: cotorsion from Theorem 1.4.1, Cartier-dual finite invariants, and the local coranks of Lemmas 1.3.5–1.3.6. Dualize the primitive/imprimitive exact sequence. Compute local characteristic ideals using KY Lemma 1.1.1 and §1.5; KY Theorem 1.5.1 explicitly invokes the CGLS Theorem 1.5.1 proof after supplying these broader surjectivity hypotheses. Multiply only the finite S factors and then take μ,λ.

**Check.** Neither E(K)[p]=0 on the original geometric Tate module nor the CGS local character exclusion is inserted into this broader chosen-lattice branch. Do not infer finite-level control from height-one Euler-factor equality.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-imprimitive-extension-sequence`, `RankZeroOneBSD:BSD.7a/ky-exceptional-character-specialization`, `RankZeroOneBSD:BSD.7a/selmer-convention-dictionary`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `AutomorphicPadicLFunctions:L0/euler-factor-elements`, `ArithmeticGaloisRepresentations:R01.1/ribet-nonsplit-lattice`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Lemma 1.1.1; Remark 1.2.3(ii), pp.14–15; Remark 1.4.2, p.25; §1.5 and Theorem 1.5.1, p.31. The broader primitive comparison is justified by KY’s own cotorsion and global-to-local surjectivity, rather than by importing the locally excluded CGS branch.

### Keller–Yin residual extension and corrected lambda formula

**ky-primitive-lambda-correction** (theorem). For KY’s chosen nonsplit lattice with φ|G_p=ω, the primitive X_f is torsion with μ=0. If φ|G_K≠ω, λ(X_f)=λ(X_φ)+λ(X_ψ)+Σ_{w∈S}(λ(P_w(φ))+λ(P_w(ψ))−λ(P_w(f))). If φ|G_K=ω (so ψ|G_K=1), the left side is λ(X_f)+1. The same +1 occurs in the imprimitive relation λ(X_f^S)+1=λ(X_φ^S)+λ(X_ψ^S). S is finite and excludes v,v̄,∞.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice is as in ky-invariant-free-lattice; the generic non-1/ω case is supplied by the CGLS comparison.

**Proof plan.** Import the separate KY imprimitive residual comparison, including cotorsion, μ=0 and its globally trivial +1. Apply the KY finite Euler comparison to f,φ,ψ under its chosen-lattice surjectivity hypotheses. Subtract the same finite S Euler λ terms. Keep the +1 when φ|G_K=ω; it is cancelled only after importing the corresponding character main-conjecture correction in the subsequent algebraic/analytic comparison.

**Check.** When ψ is globally trivial the uncorrected sum of λ invariants is off by one.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-imprimitive-extension-sequence`, `RankZeroOneBSD:BSD.7a/ky-primitive-euler-comparison`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 1.4.1, pp.24–25, proof pp.25–31; Theorem 1.5.1, p.31. The +1 is not suppressed by the fact that finite modules have unit characteristic ideal.

### Keller–Yin equality of analytic and algebraic invariants

**ky-algebraic-analytic-invariants** (theorem). For every good ordinary weight-two Eisenstein form in KY’s setting, μ(X_f)=μ(L_f)=0 and λ(X_f)=λ(L_f). In the globally trivial-character case the algebraic +1 in ky-primitive-lambda-correction cancels the character main conjecture’s λ(X_1)=λ(L_1)+1. The result is not obtained by imposing the CGS local exclusion.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof plan.** Split the local cases. When both characters at G_p differ from 1 and ω, import cgls-algebraic-analytic-invariants. In the local 1/ω case use ky-primitive-lambda-correction on the chosen lattice and eisenstein-cm-value-congruence with its analytic relabelling. Use ky-exceptional-character-specialization for the globally trivial constituent and the nontrivial character formulas for the others. Cancel the same finite S factors and the explicit augmentation correction.

**Check.** The correction survives even though finite global torsion does not change a characteristic ideal.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-primitive-lambda-correction`, `RankZeroOneBSD:BSD.7a/ky-exceptional-character-specialization`, `RankZeroOneBSD:BSD.7a/eisenstein-cm-value-congruence`, `RankZeroOneBSD:BSD.7a/cgls-algebraic-analytic-invariants`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 2.2.3, pp.33–34; Remark 2.2.4, p.34. The equality uses the exceptional character formula, not only the CGLS argument.

## Anticyclotomic divisibilities and endpoints

### Uniform near-trivial Kolyvagin bound

**cgs-uniform-twist-specialization** (theorem). Under CGS’s ordinary Heegner setup and E(K)[p]=0, let R be the integers of a finite extension Φ/ℚ_p and α an anticyclotomic character with α≡1 modulo ϖ^m. There are constants M₀,C≥0 depending only on T_pE and rank_ℤp R, independent of m and α in this neighborhood, such that for m≥M₀ and an actual κ∈KS(T_pE⊗R(α),F_ord,L_E) with κ₁≠0: the compact Selmer group has R-rank one, H¹_F(K,A)≅Φ/R⊕M⊕M for a finite M, and length_R M≤length_R(H¹_F(K,T)/Rκ₁)+C.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0; the propagated ordinary self-dual local conditions and CGS’s admissible Kolyvagin primes/ideals are used.

**Proof plan.** Import ES.4/uniform-near-trivial-bound; this node supplies its weight-two arithmetic specialization and hypothesis verification, rather than a second general descent theorem. Specialize the generic error-tolerant descent of ES.4 to CGS §6.2’s two-copy structure, keeping finite error constants. Use the residual truncated comparison at level m and complex conjugation. CGS §6.3 chooses primes controlling two eigenspaces with the fixed restriction error C₁+C₂. Follow §6.4’s two-step decrease of the largest elementary divisors; this is the new bounded-error argument, not the earlier bound whose error grows with m. Pass to the finite and divisible parts with the same uniform C.

**Check.** The constants remain fixed as m grows; replacing them with C(α)≥m fails the augmentation argument.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/good-eisenstein-ordinarity`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 6.1.1 and §§6.2–6.4, pp.21–28. Uniformity is the reason specialization can approach augmentation.

### Keller–Yin uniform near-trivial bound

**ky-uniform-twist-specialization** (theorem). For KY’s chosen stable self-dual weight-two lattice T with H⁰(K,T/pT)=0 and the actual ordinary conditions, let α≡1 mod ϖ^m. Constants M₀,C depend only on the representation/lattice and rank of the coefficient extension, not on m or α in this neighborhood. If m≥M₀ and κ₁ is nontorsion, the compact Selmer group has rank one, the discrete group is Φ/R⊕M_α⊕M_α, and length_R M_α≤length_R(S/Rκ₁)+C. This generalization requires the chosen nonsplit lattice but not CGS’s local exclusions on its characters.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The invariant-free lattice and propagated ordinary local/dual conditions are verified; an actual Kolyvagin system with nontorsion κ₁ is supplied.

**Proof plan.** Import ES.4/uniform-near-trivial-bound; this node supplies its weight-two arithmetic specialization and hypothesis verification, rather than a second general descent theorem. Use ky-invariant-free-lattice for the cohomological H⁰ hypothesis. Use KY Lemma 3.0.3’s scalar-image argument (Bogomolov/Ribet) to bound the source C₁ on the representation; retain this supplier requirement explicitly. Adapt the two-copy bounded-error descent of CGS §§6.2–6.4 to the KY lattice as Theorem 3.0.2 specifies; the error remains independent of m.

**Check.** The lattice can be invariant-free when the original curve has rational p-torsion.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-invariant-free-lattice`, `ArithmeticGaloisRepresentations:R01.1`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.2, p.35; Lemma 3.0.3 and Remark 3.0.4, pp.35–36. This is the KY version; the narrower CGS-hypothesis theorem is not used on an exceptional local character.

### Heegner divisibility including augmentation

**cgs-augmentation-divisibility** (theorem). For the actual early HE.8 Λ-adic Heegner Kolyvagin system κ^Hg with κ₁≠0, under CGS conditions S_ord(K∞⁻) has Λ-rank one and X_ord(K∞⁻) is pseudo-isomorphic to Λ⊕M⊕M, with M torsion and char_Λ(M) dividing char_Λ(S_ord/Λκ₁) in Λ[1/p]. The height-one prime (γ−1) is included; the prime (p) is still not included by this assertion.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Import the actual Heegner classes, local conditions and nonzero bottom class from early HE.8, not an anticyclotomic equality. Apply the existing weak torsion-localized bound away from augmentation. Apply cgs-uniform-twist-specialization along characters approaching 1 to bound the augmentation length and remove its inversion (CGS Theorems 6.5.1–6.5.2).

**Check.** No inference about the p-height-one length is made from a rational divisibility.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-uniform-twist-specialization`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-local-conditions`, `HeegnerPointEulerSystems:HE.8/lambda-bottom-class-nontorsion`, `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.8/augmentation-prime-divisibility`, `HeegnerPointEulerSystems:HE.8/lambda-finite-singular-relation`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorems 6.5.1–6.5.2, p.28. The new argument includes augmentation but the theorem still states Λ[1/p].

### Heegner index and BDP ideal comparison

**heegner-greenberg-ideal-equivalence** (comparison). For the actual ordinary Heegner class and propagated local conditions, the strict/relaxed Poitou–Tate sequence and integral logarithm reciprocity relate each direction of the Heegner index-square containment to the corresponding Greenberg/BDP containment. Over Λ[1/p] this is the CGLS Proposition 4.2.1 comparison. An integral version must retain the logarithm cokernel, finite local terms, isogeny indices, the involution and both lattice normalizations. The full central-value BDP function B already contains a square; the index is squared once. KY’s geometric-to-chosen lattice transfer and the p^{t+N} of its printed equivalence are recorded separately; no integral two-way equivalence for the unscaled line is assumed.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Use either CGS no-invariants data or the chosen KY residual-invariant-free lattice, and the actual rank-one compact Selmer group.

**Proof plan.** Use SIC’s strict/relaxed Poitou–Tate sequence and GZ.9’s actual Heegner logarithm formula with its Euler factor and isogeny/differential compatibility. Within a fixed coefficient lattice identify κ∞ and κ₁ as generators of the same Λ-submodule as in CGLS Remark 4.1.3. Separately compare the geometric and chosen KY lattices through their actual maps: the fixed p^{t+N} contribution is not a unit change of generator of an integral Λ-line. Take characteristic ideals in the correct unramified coefficient extension, track involution and the square, and record both implication directions separately.

**Check.** A square-root BDP measure is not substituted for the squared L_E in the Greenberg equality.

**Direct dependencies.** `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `GrossZagierAndArithmeticHeights:GZ.9/isogeny-and-differential-compatibility`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `HeegnerPointEulerSystems:HE.8/howard-stabilization-unit-comparison`.

**Sources.** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Proposition 4.2.1, printed p.569; Remark 4.1.3, pp.568–569. Relates the two characteristic-ideal divisibilities and the actual Heegner line.; [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 6.5.3 and Corollary 6.5.4, p.29. Uses the comparison to pass between the integral Greenberg equality and the asserted Heegner equality.; [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 and its proof, pp.39–40. Tracks fixed p-power terms and distinct coefficient-ring labels.

### CGLS anticyclotomic prototype

**cgls-corank-one-prototype** (theorem). Under the CGS local exclusion and Heegner/split/discriminant conditions, and additionally corank_ℤp Sel_{p∞}(E/K)=1, the CGLS primitive Greenberg dual is Λ-torsion with char(X_E)Λ^ur=(L_E), where L_E is the full central-value BDP function. Its Heegner index-square consequence is initially stated in Λ^ac=Λ[1/p] in the published Corollary 4.2.3. This prototype retains (Sel); the stronger CGS equality above removes it by a new proof.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The additional (Sel) condition of CGLS: corank_ℤp Sel_{p∞}(E/K)=1.

**Proof plan.** Use the early Heegner weak divisibility and its source corank-one augmentation upgrade. Translate to Greenberg/BDP using heegner-greenberg-ideal-equivalence. Use cgls-algebraic-analytic-invariants to obtain the integral Greenberg equality, and record the published rational index-square consequence without silently upgrading its coefficient ring.

**Check.** An analytic rank-two E cannot be fed to this source by omitting (Sel).

**Direct dependencies.** `HeegnerPointEulerSystems:HE.8/weak-torsion-localized-divisibility`, `RankZeroOneBSD:BSD.7a/heegner-greenberg-ideal-equivalence`, `RankZeroOneBSD:BSD.7a/cgls-algebraic-analytic-invariants`.

**Sources.** [cgls](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf), Theorem 4.2.2 and Corollary 4.2.3, printed pp.569–570. The routed Theorem C/Corollary D prototype has an extra corank condition.

### CGS anticyclotomic Greenberg main conjecture

**cgs-integral-greenberg-equality** (theorem). Under CGS conditions X_Gr(E/K∞⁻) is Λ-torsion and char_Λ X_Gr extended to Λ^ur equals the principal ideal of L_p^BDP(f_E/K) in the source’s full central-value normalization. The conclusion has no (Sel) corank-one assumption and is integral, including augmentation and the p-height-one prime.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Translate cgs-augmentation-divisibility to a one-sided Greenberg/BDP divisibility via heegner-greenberg-ideal-equivalence. Use cgls-algebraic-analytic-invariants: μ=0 removes the remaining p-power ambiguity, and equality of λ makes the integral quotient a unit. Conclude both ideal containments; this removes the earlier CGLS (Sel) restriction by the uniform bound.

**Check.** The CGLS prototype alone cannot supply this unconditional-in-(Sel) equality.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-augmentation-divisibility`, `RankZeroOneBSD:BSD.7a/heegner-greenberg-ideal-equivalence`, `RankZeroOneBSD:BSD.7a/cgls-algebraic-analytic-invariants`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 6.5.3, p.29; compare CGLS Theorem 4.2.2. The improved proof removes (Sel), not the residual local exclusion.

### CGS Heegner index-square equality

**cgs-integral-heegner-equality-target** (theorem). Under CGS conditions the compact and dual ordinary anticyclotomic Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 integrally. The class is the actual geometric early HE.8 class, with its source lattice; κ∞ is not defined by this equality.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** CGS Corollary 6.5.4 states the integral equality. First obtain the two-way comparison and the index-square equality over Λ[1/p] from the Greenberg equality and actual logarithm reciprocity. To export the integral statement, prove the coefficient-prime part of the two-way comparison for the unscaled geometric Heegner line. The source refers back to CGLS in one sentence; μ(X_Gr)=0 alone does not compute μ(S/Λκ∞). This exact step is recorded as a gap, rather than inferred by deleting p-power factors.

**Check.** Its exact characteristic equality includes the p-height-one prime.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-integral-greenberg-equality`, `RankZeroOneBSD:BSD.7a/heegner-greenberg-ideal-equivalence`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Corollary 6.5.4, p.29. This is an output of BSD.7a for HE.8b and MIMC L6, never an input from them.

### Keller–Yin integral Kolyvagin divisibility and lattice transfer

**ky-coefficient-prime-divisibility-target** (theorem). Target of KY Theorem 3.0.5: on the invariant-free chosen lattice, an actual Λ-adic Kolyvagin system with nontorsion bottom gives rank-one compact and dual ordinary Selmer modules, X∼Λ⊕M⊕M, and char(M) dividing char(S/Λκ₁) at every height-one prime, including (ϖ). ES.8/augmentation-prime-divisibility already owns the general specialization argument and marks its coefficient-prime branch conditional. The arithmetic adapter must supply an error bound uniform under the coefficient-prime specializations, or a separate μ comparison. Until that contract is verified only the Λ[1/p] bound is an established input to this plan. KY Theorem 3.0.6 additionally transfers the canonical geometric system: p^N bounds restriction descent, p^t kills a local trace cokernel, and p^m maps the canonical lattice into its intersection with the chosen lattice. None of these fixed exponents is silently zero.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. The chosen lattice has H⁰(K,T/pT)=0 and the actual transferred Heegner system has nonzero initial class.

**Proof plan.** Import the generic uniform bound from ES.4/uniform-near-trivial-bound and the augmentation-inclusive Λ[1/p] theorem from ES.8/augmentation-prime-divisibility. Verify the invariant-free lattice, self-duality, ordinary local conditions and actual Kolyvagin system. For the stronger integral target, discharge the supplier’s conditional (ϖ) specialization using a quantified error estimate valid as ramification grows, or an independent coefficient-prime μ comparison. KY p.37 cites Howard for this step; the present audit does not treat that citation as the missing estimate. For the geometric system use the bounded restriction kernel/cokernel and local trace argument of KY Theorem 3.0.6, pp.37–39; retain N,t,m through the induced Selmer maps. The p^{t+N} in Theorem 3.0.8 is the source’s additional comparison factor, not a proof that the separate lattice inclusion is a unit.

**Check.** The older HE weak divisibility after inverting p is not a substitute for this integral assertion.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-invariant-free-lattice`, `RankZeroOneBSD:BSD.7a/ky-uniform-twist-specialization`, `HeegnerPointEulerSystems:HE.8/lambda-heegner-derivative-class`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `EulerSystemsAndKolyvaginSystems:ES.8/augmentation-prime-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.4/uniform-near-trivial-bound`, `HeegnerPointEulerSystems:HE.8`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorems 3.0.2 and 3.0.5–3.0.6, pp.35–39. States the uniform and integral bounds and constructs a system despite local torsion; the integral specialization is kept as a precise verification obligation.

### Keller–Yin anticyclotomic Greenberg main conjecture

**ky-integral-greenberg-equality** (theorem). For KY’s weight-two good Eisenstein setup, the unramified Selmer dual X_f (and height-one-equivalent Greenberg dual) is Λ-torsion and char_Λ(X_f)Λ^nr=(L_f). First prove this on the chosen invariant-free lattice, then transfer to the original elliptic curve as in Remark 3.0.9. Local rational p-torsion is allowed. The equality is integral, and no unproved general finite-submodule vanishing is asserted.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof plan.** Use the verified rational augmentation-inclusive bound for the transferred actual system and the rational Heegner/Greenberg comparison. The stronger coefficient-prime Kolyvagin target is unnecessary for this route. Normalize both integral Greenberg and BDP generators by the independently computed μ=0 and equal λ invariants. A rational containment, or the printed containment with fixed p-power, then gives an integral containment between their distinguished parts; equal λ forces the quotient to be a unit. Transfer through the actual lattice/isogeny maps of KY Remark 3.0.9 and compare the finite Greenberg/unramified restriction kernel. This extension must be verified for the original curve; no vanishing of its rational p-torsion is imposed.

**Check.** A rational p-torsion original curve is accepted only with the proved transfer maps.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-coefficient-prime-divisibility-target`, `RankZeroOneBSD:BSD.7a/heegner-greenberg-ideal-equivalence`, `RankZeroOneBSD:BSD.7a/ky-algebraic-analytic-invariants`, `RankZeroOneBSD:BSD.7a/selmer-convention-dictionary`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.8 (IMC2) and Remark 3.0.9, pp.39–40. The result is the integral BDP/Greenberg equality in completed unramified coefficients.

### Keller–Yin Heegner index-square equality

**ky-rational-heegner-equality** (theorem). In the same KY setup the compact and dual ordinary Selmer groups have Λ-rank one and char_Λ(X_tors)=char_Λ(S/Λκ∞)^2 in the coefficient ring labelled Λ^ac in §3.0.8, with κ∞ the transferred actual Heegner class. Theorem B in the Introduction instead states Λ; record this internal ring discrepancy and require an integral two-way class/lattice comparison before exporting the stronger integral statement. The weaker rationalized index-square equality is retained; the integral Greenberg IMC2 is a separate output.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd.

**Proof plan.** Use ky-integral-greenberg-equality and the reverse implication of heegner-greenberg-ideal-equivalence. Return through the explicit lattice maps in the coefficient ring of the proved two-way comparison. Resolve the Theorem B/§3.0.8 ring discrepancy through the stated integral comparison gap.

**Check.** The characteristic equality refers to the actual κ∞ line and retains the coefficient ring of the verified comparison.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-integral-greenberg-equality`, `RankZeroOneBSD:BSD.7a/heegner-greenberg-ideal-equivalence`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Introduction Theorem B, p.5; Theorem 3.0.8 (IMC1), p.40. This is a BSD.7a output for the downstream HE.8b application.

## Integral lattices, actual BF classes and cyclotomic endpoints

### Distinguished Wüthrich lattice and integral Kato input adapter

**wuthrich-integral-eisenstein-input** (comparison). For an elliptic curve E/ℚ and an odd good ordinary Eisenstein p, use Wüthrich’s distinguished E_• in its isogeny class: T_f=T_pE_• and the lattice of all modular symbols agrees with its Néron lattice after tensoring with ℤ_p. The cyclic X₁(N)-optimal quotient isogeny is étale. Kato’s z₀ is integral in H¹_Iw(T_pE_•) even in the nonfree maximal-ideal case, L_p^MSD(E) is integral, and char X_ord(E/ℚ∞) divides (L_p^MSD(E)) as integral ideals. The supplier is the requested Wüthrich addition to Kato L4, with Ferrero–Washington; Kato’s existing rational node is insufficient.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof plan.** Import Wüthrich Theorem 4 and Proposition 8 for E_• and the actual lattice, valid at odd primes where reduction at that prime is semistable (not a global semistability hypothesis). Import Theorem 13’s integral z₀ including the rational-torsion/nonfree case, and Theorem 16’s integral divisibility with Lemma 17’s isogeny comparison. Apply Corollary 18 at good ordinary p. Record the split-multiplicative augmentation factor separately; it supplies no bad-prime BSD claim here.

**Check.** The assumptions concern reduction at p. Additive reduction elsewhere does not disqualify the input. For split multiplicative p the extra augmentation I is retained, without inferring a BSD formula.

**Direct dependencies.** `KatoEulerSystems:L4`, `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`, `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `ModularSymbolsPadicLFunctions:L1`.

**Sources.** [wuthrich](https://ems.press/content/serial-article-files/26230?nt=1), Theorem 4, p.384; Proposition 8, pp.388–389; Theorem 13, p.395; Theorem 16, p.397; Lemma 17 and Corollary 18, p.398. The required containment is integral at the coefficient prime, including reducible representations.

### Integral Rankin functions and specialization normalization

**cgs-integral-rankin-normalizations** (comparison). Compare CGS’s actual two-variable Perrin–Riou Rankin function L_PR and Greenberg function L_Gr to the imported p-adic functions. Normalize L_PR with (deg π/c_π²)H_p(f), H_p(f)=(1−p/α_p²)(1−1/α_p²), and L_Gr with h_K times the anticyclotomic Katz factor. Cyclotomic projection of L_PR has ideal equal to the product of the Néron-period MSD functions of E and E^K; anticyclotomic projection of L_Gr has ideal equal to the full central-value BDP function. The CM-family congruence ideal and h_K factor must be supplied integrally, with Hida–Tilouine/Rubin input, rather than assumed units.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. α_p is the ordinary unit root; the modular parametrization and Néron differential are fixed.

**Proof plan.** Import the actual Rankin interpolation from ModularSymbols/AutomorphicPadicLFunctions and the CM Hida family/congruence module from PadicFamilies. Apply CGS Definitions 2.2.2 and 2.4.3 and Lemma 2.4.4, retaining deg π, the Manin constant, h_K and the Katz congruence factor. Verify Propositions 2.2.4 and 2.4.5 with the same integral periods and full central-value BDP convention.

**Check.** No condition p∤h_K is inserted to bypass the integral congruence argument.

**Direct dependencies.** `AutomorphicPadicLFunctions:L3/katz-hida-tilouine-tame`, `AutomorphicPadicLFunctions:L3/katz-functional-equation`, `PadicFamilies:L0`, `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`, `AutomorphicCongruences:L0`, `ModularSymbolsPadicLFunctions:L2/p-stabilisation`, `ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure`, `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `PadicFamilies:L0/ordinary-eisenstein-family`, `PadicFamilies:L0/arithmetic-specialization`, `AutomorphicPadicLFunctions:L3/cm-periods`, `CMAllPrimeMainConjectures:CZ.2/classical-two-variable-main-conjecture`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Definitions 2.2.2 and 2.4.3, pp.7,9; Lemma 2.4.4, pp.9–10; Propositions 2.2.4 and 2.4.5, pp.8,10. The Katz/CM congruence input removes a genuine integral denominator, not just a rational scalar.; [ht94](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf), Theorem 0.3, printed pp.91–92; statement only inspected. CGS Lemma 2.4.4 uses this comparison and Rubin to bound its cuspidal congruence ideal.; [bdp22](https://arxiv.org/pdf/1804.00648v4), Theorem A(i) and Remark 0.1, p.3; Theorem 3.5, pp.20–21. The p-irregular quadratic weight-one point has a unique cuspidal family; its congruence series does not vanish at augmentation.; [hida07](https://www.math.ucla.edu/~hida/ELLC.pdf), Corollary 5.6, printed p.263. CGS Corollary 4.1.3 invokes this reverse divisibility; the author has corrected its proof.; [hida07-correction](https://www.math.ucla.edu/~hida/EllrevF.pdf), Introduction pp.1–3; §6.1 pp.34–35; Theorem 6.14 and Corollary 6.15, pp.42–43. Provides a replacement congruence-divisibility proof with the class-number factor, while §6.1 retains a local nontriviality assumption whose irregular specialization must be justified.

### Integral Eisenstein specialization of Beilinson–Flach classes

**eisenstein-bf-specialization** (construction). Construct the actual CGS class BF_α in H¹_ord,rel(K,T_f(α) completed-tensor Λ_K) by specializing the imported KLZ classes to the CM family. Use T_f=T_pE_• and the raw fractional-ideal Coleman maps of Theorem 4.1.1. Rescaling gives the two reciprocity image identities for L_PR and L_Gr, but compute the normalized height-one cokernels explicitly: the PR pseudo-null claim of Corollary 4.1.3 is incompatible with its stated raw map and H_p(f) scalar when H_p(f) is a nonunit (E13). After inverting p the scalar causes no discrepancy. Neither BF nor a map is defined by assigning its predicted image.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. Use Wüthrich’s distinguished quotient lattice and the actual CM Hida family, embeddings, coefficient extension and periods of CGS §§2.2–2.4 and §4.1. The KY local 1/ω extension is an additional verification target, not a hypothesis-free application.

**Proof plan.** Specialize the actual KLZ classes owned by AutomorphicCongruences L2 through Shapiro and the CM family. Retain the fixed coefficient-lattice factor ϖ^r and auxiliary norm-relation factors. The existing supplier records an unread-KLZ gap; importing its node does not discharge that gap. Apply CGS Theorem 4.1.1 for both explicit reciprocity laws on I_f and I_g^cusp, including injectivity and pseudo-null cokernel. Use deg(π_•)I_f=ℤ_p, the integral de Rham comparison and the exact CM congruence ideal to rescale the image identities. Compute the normalized cokernel divisor rather than infer pseudo-nullity after multiplication by a nonunit; resolve E13 before an integral equivalence is used.

**Construction and API.** Specialization of the actual imported classes is the construction; the maps are constructed from the imported regulator and fixed arithmetic lattices. No object is chosen merely to satisfy its predicted reciprocity law.

- `EisensteinBF.class` (data): The actual specialized motivic Beilinson–Flach cohomology class, not a chosen inverse image of an L-function.
- `EisensteinBF.ordinary_local` (characterisation): The class lies in the ordinary-relaxed Selmer group with the source strict/relaxed places.
- `EisensteinBF.coleman_PR` (compatibility): The rescaled Coleman map on p⁻loc_v̄ sends the actual class to the integrally normalized L_PR.
- `EisensteinBF.coleman_Gr` (compatibility): The rescaled Coleman map on loc_v sends the same actual class to L_Gr with its Katz congruence factor.
- `EisensteinBF.twist_congruence` (compatibility): After the specified twist automorphism, congruent characters produce congruent images modulo the same coefficient power.
- `EisensteinBF.coleman_cokernel_divisor` (characterisation): Localize the actual normalized Coleman map at every height-one prime and compute its cokernel length. Under the simultaneously printed raw f-map/degree conventions the (p) length is v_p(H_p(f)); a corrected convention must identify exactly where this factor moves.

**Uses.** CGS Proposition 4.2.1 and Theorem 4.3.1: The two actual localization maps relate BF-index, ordinary and Greenberg characteristic containments. CGS §7.2: Nonzero twisted images and integral normalizations supply the cyclotomic reverse bound.

**Unit tests.** These are arithmetic specification tests requiring the supplier carriers. Their names are also listed as omissions in the compact Suggested file.

- `EisensteinBF.test_PR_projection` (compatibility): Cyclotomic projection of the PR image agrees with the product of MSD functions of E_• and E_•^K in their Néron periods.
- `EisensteinBF.test_Gr_projection` (compatibility): Anticyclotomic projection of the Gr image agrees with the full central-value BDP normalization, including the nonunit Katz/congruence factor.
- `EisensteinBF.test_zero_image` (non-example): If an injective Coleman projection has nonzero reciprocal L-image then the actual localized class is nonzero; the zero class cannot pass.
- `EisensteinBF.test_lattice_rescaling` (compatibility): Changing the distinguished quotient differential rescales class/map and period modules by the computed factors, preserving both laws together.
- `EisensteinBF.test_twist_congruence` (compatibility): For α≡β mod ϖ^m, the two normalized reciprocity images agree mod ϖ^m after the same twist automorphism; allowing different integral period scalings invalidates this test.
- `EisensteinBF.test_nonunit_normalization` (non-example): For α_p²≡1 mod p, multiplication by H_p(f) on the raw f-target after degree identification has positive (p)-cokernel length. A claim of unchanged pseudo-null cokernel for this same lattice fails.

**Check.** Both reciprocity images are checked on the same actual class and lattice, before any characteristic equality.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `RankZeroOneBSD:BSD.7a/cgs-integral-rankin-normalizations`, `PadicHodgeRegulators:L3`, `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`, `ArithmeticGaloisDuality:R02.1/completed-tensor-comparison`, `ArithmeticGaloisDuality:R02.1/continuous-section-long-exact`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `AutomorphicCongruences:L2/klz-beilinson-flach-classes`, `AutomorphicCongruences:L2/bf-explicit-reciprocity`, `PadicFamilies:L4/family-big-logarithm`, `AutomorphicCongruences:L0`, `ModularSymbolsPadicLFunctions:L1`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 4.1.1, Lemma 4.1.2, Corollary 4.1.3, pp.17–18. Both maps and their actual common class carry the integral normalization used by the main-conjecture comparison.; [ht94](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf), Theorem 0.3, printed pp.91–92; statement only inspected. CGS Lemma 2.4.4 uses this comparison and Rubin to bound its cuspidal congruence ideal.; [bdp22](https://arxiv.org/pdf/1804.00648v4), Theorem A(i) and Remark 0.1, p.3; Theorem 3.5, pp.20–21. The p-irregular quadratic weight-one point has a unique cuspidal family; its congruence series does not vanish at augmentation.; [hida07](https://www.math.ucla.edu/~hida/ELLC.pdf), Corollary 5.6, printed p.263. CGS Corollary 4.1.3 invokes this reverse divisibility; the author has corrected its proof.; [hida07-correction](https://www.math.ucla.edu/~hida/EllrevF.pdf), Introduction pp.1–3; §6.1 pp.34–35; Theorem 6.14 and Corollary 6.15, pp.42–43. Provides a replacement congruence-divisibility proof with the class-number factor, while §6.1 retains a local nontriviality assumption whose irregular specialization must be justified.

### EisensteinBF.coleman_PR

**eisenstein-bf-pr-image** (lemma). The rescaled injective Coleman map sends p⁻loc_v̄ BF_α to L_PR(E_•(α)/K) with exactly the distinguished lattice, degree and H_p(f) normalization. Keep its actual cokernel divisor: under the raw conventions of Theorem 4.1.1 and Lemma 4.1.2 the (p) length is v_p(H_p(f)), so pseudo-nullity is asserted only after inverting p or after a verified correction of those conventions. This is the image compatibility API, not an unconditional integral pseudo-isomorphism.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. Use Wüthrich’s distinguished quotient lattice and the actual CM Hida family, embeddings, coefficient extension and periods of CGS §§2.2–2.4 and §4.1. The KY local 1/ω extension is an additional verification target, not a hypothesis-free application.

**Proof plan.** Apply CGS Theorem 4.1.1 to the actual KLZ specialization. Use Lemma 4.1.2 and cgs-integral-rankin-normalizations to rescale the image identity. Compute the localized cokernel, recording E13; do not drop H_p(f).

**Check.** The image equality uses the actual same class as the other reciprocity law.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/eisenstein-bf-specialization`, `RankZeroOneBSD:BSD.7a/cgs-integral-rankin-normalizations`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Lemma 4.1.2 and Corollary 4.1.3, pp.17–18. The actual localization/map compatibility is used by the characteristic-ideal comparison.

### EisensteinBF.coleman_Gr

**eisenstein-bf-greenberg-image** (lemma). After verifying the exact CM congruence-ideal identity and its target lattice, the normalized injective Coleman map with pseudo-null cokernel sends loc_v BF_α to L_Gr(f(α)/K), with exactly the distinguished lattice and integral degree/CM congruence-ideal normalizations of Corollary 4.1.3. This promotes the consumed compatibility API to a separate declaration.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. Use Wüthrich’s distinguished quotient lattice and the actual CM Hida family, embeddings, coefficient extension and periods of CGS §§2.2–2.4 and §4.1. The KY local 1/ω extension is an additional verification target, not a hypothesis-free application.

**Proof plan.** Apply CGS Theorem 4.1.1 to the actual KLZ specialization. Use Lemma 4.1.2 and cgs-integral-rankin-normalizations to rescale the map, retaining the source factors as in Corollary 4.1.3.

**Check.** The image equality uses the actual same class as the other reciprocity law.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/eisenstein-bf-specialization`, `RankZeroOneBSD:BSD.7a/cgs-integral-rankin-normalizations`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Corollary 4.1.3, p.18. The actual localization/map compatibility is used by the characteristic-ideal comparison.; [ht94](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf), Theorem 0.3, printed pp.91–92; statement only inspected. CGS Lemma 2.4.4 uses this comparison and Rubin to bound its cuspidal congruence ideal.; [bdp22](https://arxiv.org/pdf/1804.00648v4), Theorem A(i) and Remark 0.1, p.3; Theorem 3.5, pp.20–21. The p-irregular quadratic weight-one point has a unique cuspidal family; its congruence series does not vanish at augmentation.; [hida07](https://www.math.ucla.edu/~hida/ELLC.pdf), Corollary 5.6, printed p.263. CGS Corollary 4.1.3 invokes this reverse divisibility; the author has corrected its proof.; [hida07-correction](https://www.math.ucla.edu/~hida/EllrevF.pdf), Introduction pp.1–3; §6.1 pp.34–35; Theorem 6.14 and Corollary 6.15, pp.42–43. Provides a replacement congruence-divisibility proof with the class-number factor, while §6.1 retains a local nontriviality assumption whose irregular specialization must be justified.

### Beilinson–Flach divisibility comparison

**cgs-cyclotomic-duality-equivalence** (comparison). Fix an anticyclotomic crystalline α and put A=Λ_K⁺, the cyclotomic algebra over K. Suppose BF_α⁺≠0 and E_•(K)[p]=0. CGS Proposition 4.2.1 identifies direction by direction: (i) rank_A S_ord,rel(α)=1, X_ord,str(α⁻¹) torsion, and char X_ord,str(α⁻¹) ⊃ char(S_ord,rel(α)/A·BF_α⁺); (ii) S_str,rel(α) and X_Gr(α) torsion, with char X_Gr(α)A^ur ⊃ (L_Gr(α)⁺); (iii) S_ord(α) and X_ord(α) torsion, with char X_ord(α) ⊃ (L_PR(α)⁺). Complex conjugation identifies the α and α⁻¹ ordinary characteristic ideals where used. Over A[1/p] these equivalences hold with every containment reversed as well. Integrally this is a target conditional on the correct height-one cokernel calculation for both normalized maps: with the printed raw PR map and H_p(f) scalar the cokernel divisor cannot be omitted (E13). A rational instance proves no containment at (p).

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E_•(K)[p]=0, the relevant projected L_PR and L_Gr are nonzero, and the torsion/rank hypotheses in CGS Proposition 4.2.1 hold.

**Proof plan.** Apply the two strict/relaxed Poitou–Tate exact sequences to the actual BF class. Use the reciprocity image identities and actual normalized-map cokernel divisors. After inverting p, E13 causes no scalar defect; integrally resolve it and include all resulting length terms before asserting the uncorrected equivalence. Take height-one characteristic lengths in each exact sequence, record both containment directions, and keep any inversion of p in the coefficient ring.

**Check.** An equality for one projected Selmer group cannot be imported from downstream MIMC L6. A nonunit scalar multiplying a map changes its height-one cokernel; pseudo-nullity is never inferred from the raw map alone.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/eisenstein-bf-pr-image`, `RankZeroOneBSD:BSD.7a/eisenstein-bf-greenberg-image`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-poitou-tate-sequence`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Proposition 4.2.1, pp.18–19. This is an equivalence of proved containments, not an assumed main conjecture.

### Nontrivial-twist rational Beilinson–Flach bound

**cgs-rational-bf-specialization** (theorem). For a nontrivial crystalline anticyclotomic α with BF_α⁺≠0, let A=Λ_K⁺. Under CGS Theorem 4.3.1’s verified characteristic-zero representation hypotheses, rank_A S_ord,rel(E_•(α)/K∞⁺)=1, X_ord,str(E_•(α⁻¹)/K∞⁺) is torsion, and char_A X_ord,str ⊃ char_A(S_ord,rel/A·BF_α⁺) in A[1/p]. The irreducibility assertion concerns V_pE⊗Ind_K^ℚ α over G_ℚ(μ_p∞), together with a rank-one σ-coinvariant condition. It does not assert residual irreducibility of E[p].

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. α is nontrivial and crystalline as in §4.3, BF_α≠0; the auxiliary σ and Euler-system hypotheses of Theorem 4.3.1 are verified.

**Proof plan.** Use the actual BF Euler system and its projection to the initial class. Verify the representation hypotheses by CGS’s non-CM/Serre argument and the explicit σ, not the clean irreducible residual MR theorem. Apply the imported error-tolerant Euler-system bound to obtain the containment only after inverting p.

**Check.** The coefficient-prime length is still unresolved by this node.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/eisenstein-bf-specialization`, `ArithmeticGaloisRepresentations:R01.1`, `EulerSystemsAndKolyvaginSystems:ES.4/rubin-bound`, `EulerSystemsAndKolyvaginSystems:ES.8/iwasawa-large-image-hypotheses`, `EulerSystemsAndKolyvaginSystems:ES.8/rubin-rational-iwasawa-divisibility`, `EulerSystemsAndKolyvaginSystems:ES.8`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 4.3.1, pp.19–20. The theorem supplies only the rational bound at this point.

### Congruent twists and integral characteristic series

**cgs-finite-power-congruences** (theorem). For α≡1 modulo ϖ^m, the finite-S imprimitive L-functions of E and E(α) are congruent after the twist automorphism γ↦α(γ)γ. Under the source torsion and no-finite-submodule hypotheses, their ordinary Selmer characteristic generators are congruent modulo the same ϖ^m up to units. The proof identifies Fitting with characteristic ideals only after the finite-submodule condition, and compares actual residual Selmer modules.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. The primitive ordinary Selmer dual is torsion and E(K)[p]=0 for Proposition 3.4.4; use the finite imprimitive S of the relevant tower.

**Proof plan.** Use CGS Lemma 2.5.1 for the analytic congruence. Use residual coefficient/cohomology comparison and the imprimitive global-to-local surjectivity to compare Selmer modules modulo ϖ^m. Apply Lemma 3.4.3’s no-finite-submodule assertion and Proposition 3.4.4’s Fitting comparison; retain the unit choice of generators.

**Check.** A finite Λ-submodule cannot be discarded while taking Fitting ideals.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-primitive-euler-comparison`, `RankZeroOneBSD:BSD.7a/selmer-convention-dictionary`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`, `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `SelmerIwasawaCohomology:L3/localization-surjective`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Lemma 2.5.1, p.10; Lemma 3.4.3 and Proposition 3.4.4, p.16. Large-power congruence controls μ and λ only after integral characteristic generators have been justified.

### Twisted control and augmentation comparison

**cgs-twisted-augmentation-control** (comparison). For a sufficiently near-trivial crystalline α with nonzero BDP specialization, under CGS Proposition 3.4.2’s conditions, the cyclotomic and anticyclotomic Greenberg characteristic generators specialize at augmentation with equal p-valuations. Their common expression retains the finite twisted Greenberg Selmer cardinality, #H⁰(K_v,W_{α⁻¹})² and every p-primary local Tamagawa term. Nonzero BDP specialization supplies BK corank one and nonzero ordinary localization; these are proved before applying control.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed. E(K)[p]=0, the twisted BK Selmer group has corank one and the ordinary localization is nonzero as required by Lemma 3.4.1.

**Proof plan.** Choose α away from the finitely many zeros of the nonzero BDP function. Use actual Heegner reciprocity and the Kolyvagin bound to prove Lemma 3.4.1’s rank/local nonvanishing hypotheses. Apply Proposition 3.4.2 to both towers and compare their finite terms; this is equality up to p-adic unit, not equality of arbitrary chosen generators.

**Check.** No local H⁰ factor is dropped merely because E(K)[p]=0.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-uniform-twist-specialization`, `HeegnerPointEulerSystems:HE.8/anticyclotomic-heegner-class`, `GrossZagierAndArithmeticHeights:GZ.9/bdp-weight-two-heegner-formula`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `RankZeroOneBSD:BSD.7a/cgs-integral-greenberg-equality`, `SelmerIwasawaCohomology:L4/bloch-kato-condition`, `SelmerIwasawaCohomology:L4/ordinary-finite-comparison`, `HeegnerPointEulerSystems:HE.8/crystalline-near-trivial-character`, `HeegnerPointEulerSystems:HE.8/near-trivial-bottom-nonvanishing`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Lemma 3.4.1, pp.14–15; Proposition 3.4.2, p.15; §7.2 Step 2, p.30. These are the precise specialization hypotheses needed for the unit-quotient argument.

### Integral twisted cyclotomic equality

**cgs-integral-twist-comparison** (theorem). For the near-trivial nontrivial crystalline twists used by CGS §7.2, char X_ord(E_•(α)/K∞⁺)=(L_PR(E_•(α)/K)^+) integrally. First the BF bound is rational. Wüthrich’s untwisted integral containment and congruence give the μ inequality that removes its p-power denominator. The anticyclotomic equality and twisted control then show the remaining quotient has a nonzero unit augmentation, hence is a unit. Cyclotomic μ is allowed to be positive.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Use cgs-rational-bf-specialization and cgs-cyclotomic-duality-equivalence to obtain the rational ordinary/Greenberg containments. Use wuthrich-integral-eisenstein-input plus cgs-finite-power-congruences for m large to compare μ and make the containment integral (CGS Lemma 7.2.2). Compare the nonzero augmentation values with cgs-twisted-augmentation-control and the anticyclotomic main conjecture. A quotient of integral power series with unit augmentation is a unit (SU Lemma 3.2). Translate the resulting Greenberg equality back to ordinary/L_PR using the two-way BF comparison.

**Check.** A rational containment plus specialization at a zero augmentation does not establish equality.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-rational-bf-specialization`, `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-duality-equivalence`, `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `RankZeroOneBSD:BSD.7a/cgs-finite-power-congruences`, `RankZeroOneBSD:BSD.7a/cgs-twisted-augmentation-control`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-2`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal-api-6`, `mathlib:PowerSeries.isUnit_iff_constantCoeff`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), §7.2 Lemmas 7.2.1–7.2.2, pp.29–30; equations (7.10)–(7.11), p.30; Step 3, pp.30–31. The μ inequality repairs integrality; anticyclotomic μ=0 is not reused as a cyclotomic μ=0 claim.

### CGS integral cyclotomic main conjecture

**cgs-mazur-equality** (theorem). Under CGS’s good Eisenstein local exclusion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char_Λℚ X_ord(E/ℚ∞)=(L_p^MSD(E/ℚ)) integrally with Néron real periods. No μ=0 hypothesis or conclusion is imposed on the cyclotomic functions.

**Hypotheses.** E/ℚ has conductor N, p>2 is prime, p∤N, and E[p] has semisimplification 𝔽_p(φ)⊕𝔽_p(ψ) with φψ=ω and φ restricted to a decomposition group G_p different from 1 and ω. The chosen φ is the character on an actual cyclic isogeny kernel. When K occurs: K is imaginary quadratic of odd fundamental discriminant D_K≠−3, every prime dividing N splits in K, and p=v v̄ splits in K. Thus p∤D_K; no p∤h_K condition is imposed.

**Proof plan.** Use cgs-finite-power-congruences and cgs-integral-twist-comparison for arbitrarily close twists to equate μ and λ of the untwisted imprimitive ordinary characteristic and L_PR generators; combine with Wüthrich’s integral containment to get equality over K∞⁺ (Theorem 7.2.3). Apply odd-p quadratic Shapiro splitting of the ordinary Selmer dual and the exact Néron-period product specialization of cgs-integral-rankin-normalizations. Use Wüthrich’s individual integral containments for E and E^K. Equality of their product forces both quotients to be units. Return from E_• using the proved isogeny comparison.

**Check.** The result is an output to MIMC L6; that stage’s reexport cannot be its input.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/cgs-integral-twist-comparison`, `RankZeroOneBSD:BSD.7a/cgs-finite-power-congruences`, `RankZeroOneBSD:BSD.7a/cgs-integral-rankin-normalizations`, `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `RankZeroOneBSD:BSD.1/odd-selmer-sha-decomposition`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`.

**Sources.** [cgs](https://arxiv.org/pdf/2303.04373v2), Theorem 7.1.1, p.29; §7.2, pp.29–31. Both integral individual containments are essential to descend product equality.

### Keller–Yin cyclotomic input transfer

**ky-integral-cyclotomic-adaptation** (comparison). On the actual invariant-free KY lattice, establish the cohomological, finite-submodule, twisted congruence and Coleman/Poitou–Tate inputs needed for the three-step CGS cyclotomic argument, now permitting local characters 1/ω. Use KY’s anticyclotomic equality in the specialization step and Wüthrich’s distinguished integral lattice in the individual containment step. Track the maps between these two lattices rather than identifying them. The original curve’s integral Néron-period ordinary characteristic comparison is part of this transfer, not a consequence of rational isogeny comparison alone.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed. When K occurs it has the Heegner, split-p and odd-discriminant-not-−3 conditions of CGS. Work in weight two; the higher-weight theorem is used only with r=1, which is odd. Chosen KY lattice and actual comparison maps to the distinguished E_• lattice; every rank, H⁰, surjectivity and no-finite-submodule condition used in the CGS argument must be verified on the lattice where it is applied.

**Proof plan.** KY Theorem 3.0.10 cites substitution of its 3.0.8/3.0.9 into CGS. Verify the §3.4 control and finite-submodule conditions through the exceptional local character diagrams of KY §§1.1–1.4. Construct the actual transferred BF specialization and compare both Coleman images, twist congruences and integral characteristic/Fitting generators; preserve every p-power index. Use the independent KY anticyclotomic equality, the integral Wüthrich individual bound and nonzero augmentation control to repeat CGS’s rational-bound/integral-repair/unit-quotient argument. The remaining source-to-interface verification is recorded explicitly as a gap.

**Check.** A CGS lemma requiring φ|G_p≠1,ω cannot be applied to the KY branch merely by changing its name.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-invariant-free-lattice`, `RankZeroOneBSD:BSD.7a/ky-local-invariants-dictionary`, `RankZeroOneBSD:BSD.7a/ky-integral-greenberg-equality`, `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `RankZeroOneBSD:BSD.7a/eisenstein-bf-specialization`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/condition-propagation`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `PadicHodgeRegulators:L3`, `ModularIwasawaMainConjectures:L0/ordinary-selmer-dual`, `ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10 and proof, p.41; Remark 3.0.9, p.40. This records the adaptation obligation; the narrower CGS-hypothesis lemmas are not theorem inputs for an exceptional local character.

### Keller–Yin integral cyclotomic main conjecture

**ky-mazur-equality** (theorem). For every odd good Eisenstein p of an elliptic curve E/ℚ, including local or global rational p-torsion, X_ord(E/ℚ∞) is Λ_ℚ-torsion and char X_ord=(L_p^MSD(E/ℚ)) with its integral Néron-period normalization. This is KY Theorem 3.0.10 in weight two.

**Hypotheses.** E/ℚ, p>2 prime, p∤N, E[p] reducible (equivalently an actual cyclic p-isogeny exists). No exclusion of 1 or ω at G_p is imposed.

**Proof plan.** Repeat the CGS three-step cyclotomic argument using ky-integral-greenberg-equality in place of the locally excluded CGS equality. Work on the chosen residual-invariant-free isogenous lattice where the congruence and finite-submodule hypotheses hold; use ky-invariant-free-lattice and Wüthrich’s distinguished integral comparison to return to the original curve. Keep the original curve’s periods, torsion, p-power isogeny factors and finite control terms; a rational lattice comparison alone does not preserve the integral endpoint.

**Check.** The original E may have rational p-torsion; the intermediate chosen lattice need not.

**Direct dependencies.** `RankZeroOneBSD:BSD.7a/ky-integral-greenberg-equality`, `RankZeroOneBSD:BSD.7a/ky-integral-cyclotomic-adaptation`, `RankZeroOneBSD:BSD.7a/ky-invariant-free-lattice`, `RankZeroOneBSD:BSD.7a/wuthrich-integral-eisenstein-input`, `RankZeroOneBSD:BSD.7a/cgs-integral-rankin-normalizations`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`.

**Sources.** [ky](https://arxiv.org/pdf/2402.12781v2), Theorem 3.0.10 and proof, p.41. KY substitutes its anticyclotomic theorem and lattice transfer into CGS, rather than deleting a hypothesis from CGS’s statement.

## Worked comparisons and acceptance fixtures

These examples isolate the errors the arithmetic interfaces must exclude. They complement the construction's six unit tests; none asserts a new BSD numerical formula.

1. **Equal invariants require a containment.** In ℤ_p⟦T⟧ with p>2, T−p and T−2p both have μ=0 and λ=1. They are not associates: evaluation at T=p kills the first and sends the second to −p. Once a proved containment supplies an integral quotient, equal μ and λ force that quotient to be a unit. This is the reason the residual computation cannot replace the divisibility proof.
2. **Finite modules and Fitting ideals.** For Λ=ℤ_p⟦T⟧, Λ/(p,T) has unit characteristic ideal but zeroth Fitting ideal (p,T). It fails the no-finite-submodule hypothesis. For a nonzero cyclic quotient Λ/(f), both ideals are (f). The congruence of characteristic generators uses the latter presentation principle only after the arithmetic structure criterion.
3. **Augmentation and coefficient primes.** Multiplication by T adds one to λ without adding to μ. Multiplication by p adds one to μ without adding to λ. An assertion over Λ[1/p] cannot distinguish f from p·f. The trivial-character equality char X_1=(T·L_1) adds exactly one to λ and cancels KY's exceptional algebraic +1; replacing it by a p factor would give the wrong invariant.
4. **An unscaled line matters.** In S=Λe, the line Λp^a e has index characteristic ideal (p^a). Squaring that index contributes (p^{2a}). A fixed p-power used to move a geometric Heegner system between lattices is not a unit normalization of the unscaled line. The exponents N,t,m in KY's transfer serve different maps and remain visible.
5. **A full central-value function already has a square.** If a hypothetical square-root measure b has λ=d and B is associated to b², then λ(B)=2d. The Greenberg equation uses (B); writing (B²) would double this again. A period comparison by a nonunit likewise changes μ, so the source's integral periods are part of the statement.
6. **The unit-augmentation test.** In any power-series ring over a ring, 1+T has unit constant term and is a unit. T has zero constant term and is a nonunit over a nontrivial ring. Over ℤ_p, the nonzero constant term p is still not a unit. The cyclotomic quotient argument must produce a unit augmentation of an already integral quotient.
7. **Normalized Coleman cokernels.** Let A be the localization of Λ_K at (p). If f:M→A is an isomorphism, then h·f has cokernel A/hA. Its length is v_p(h). For h=H_p(f) with α_p≡−1 mod p this length is positive. The raw pseudo-null-cokernel assertion cannot survive this same-target scalar multiplication unchanged. This is the elementary local check behind E13.
8. **Local and global exceptions are separate.** A locally trivial θ has an O-cofree rank-one unramified restriction kernel; its dual is Λ-torsion, not Λ-free rank one and not generally finite. In contrast the rank-two KY Greenberg/unramified restriction kernel is finite cyclic. The global θ=ω Selmer dual may have finite submodules even though the particular local H¹ dual in Proposition 1.1.3 has none. Each statement is tested on its own carrier.

The Suggested file elaborates the existing PowerSeries augmentation, coefficient-shift and unit criteria at the pins. It contains no arithmetic proposition with missing carriers hidden in assumptions. All 36 arithmetic targets, six construction API names and six arithmetic test names are explicitly identified there as README targets.

## Supplier contracts and Part II boundary

- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`.** Actual good ordinary/residual local classification, minimal Weierstrass models and Tate algorithm including p=2,3/additive cases, logarithm and Néron local factors. Consumers: `good-eisenstein-ordinarity`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-2-torsion-the-weil-pairing-and-the-tate-module-aec-iii68`.** Actual torsion subgroup and prime-to-good-reduction bounds, rational cyclic isogeny kernels, Tate modules and the integral-coordinate torsion criterion used to exclude torsion on fixture37. Consumers: `good-eisenstein-ordinarity`, `ky-invariant-free-lattice`.
- **`CMAllPrimeMainConjectures:CZ.3`.** Extend the existing anticyclotomic theta-character specialization to exactly the CGLS/KY range: split conductor, p>2 split, no p∤h_K restriction, including global characters 1 and ω, p=3 and anomalous cases. Prove the character main conjecture with char(X_1)=(T·L_1), μ=0, and no extra augmentation for other characters; explain control/Tor and finite class-group terms. The current narrow theta node excludes 1/ω and records projection gaps; do not erase them. Rubin94 and de Shalit III.1.10 must be inspected or replaced by a verified accessible proof. Consumers: `cgls-character-lambda-comparison`, `ky-exceptional-character-specialization`.
- **`AutomorphicCongruences:L0`.** Extend the existing CM congruence/Katz comparison to the p-irregular weight-one quadratic Eisenstein CM family of CGS Lemma 2.4.4 and Corollary 4.1.3. Prove both integral divisibilities between H_cusp(g), H(g) and h_K·Katz, with coefficient ideals and removed augmentation factor fixed. HT94 Theorem 0.3, Rubin, BDP22 A(i), and Hida07 Corollary 5.6 with its 2025 correction must be matched to this family. The existing L0/hida-tilouine-anticyclotomic assumes residual distinction and is not this specialization. Also supply the Kriz p-depleted CM congruence of CGLS Theorem 2.2.2/KY Theorem 2.2.2, including the trivial-character constant term and precise integral periods. Consumers: `eisenstein-cm-value-congruence`, `cgs-integral-rankin-normalizations`, `eisenstein-bf-specialization`.
- **`PadicFamilies:L0`.** Supply the p-irregular quadratic weight-one CM cuspidal family and the nonvanishing-at-augmentation congruence-series property used in CGS Lemma 2.4.4. Import BDP22 Theorem A(i), Remark 0.1 p.3 and Theorem 3.5 pp.20–21, with its local coefficient/weight parameter. The existing arithmetic specialization node requires weight ≥2; it cannot be invoked at weight one. Consumers: `eisenstein-cm-value-congruence`, `cgs-integral-rankin-normalizations`.
- **`tauceti:TauCetiRoadmap/EllipticCurves#layer-1-isogenies-the-dual-the-invariant-differential-and-formal-groups-aec-ii2-iii46-iv`.** Actual isogenies, duals, cyclic-kernel quotients and invariant differential pullbacks on the fixed models; no isogeny-degree-only substitute for local/global period indices. Consumers: `ky-invariant-free-lattice`, `ky-coefficient-prime-divisibility-target`, `wuthrich-integral-eisenstein-input`.
- **`HeegnerPointEulerSystems:HE.8`.** Extend the existing derivative-class/local-condition/finite-singular construction exports to KY’s canonical lattice, where residual H⁰ may not vanish, using KY Theorem 3.0.6 pp.37–39. Supply restriction annihilator p^N, trace annihilator p^t and the separate lattice-intersection map p^m, all uniform in the Kolyvagin index; do not request a main-conjecture equality from HE.8b. Consumers: `ky-coefficient-prime-divisibility-target`.
- **`KatoEulerSystems:L4`.** Add Wüthrich’s integral good ordinary Eisenstein divisibility: Theorem 4 p.384, Proposition 8 pp.388–389, Theorem 13 p.395 (including nonfree cohomology), Theorem 16 p.397, Lemma 17 and Corollary 18 p.398. Retain the distinguished quotient lattice, Néron periods, finite isogeny indices and Ferrero–Washington fine-Selmer μ input. The existing ordinary-selmer-divisibility is only rational in this reducible setting. Consumers: `wuthrich-integral-eisenstein-input`.
- **`ModularSymbolsPadicLFunctions:L1`.** Compare the existing saturated integral modular-symbol period line with the actual Néron period lattice of Wüthrich’s distinguished E_•, and transport it through isogenies with the exact odd-p differential/period indices. Its integral-period-lattices node and L2 bounded measure do not alone prove this arithmetic comparison. Consumers: `wuthrich-integral-eisenstein-input`, `eisenstein-bf-specialization`.
- **`PadicHodgeRegulators:L3`.** Supply the actual two integral ordinary Coleman maps on CGS’s specialized Rankin lattice and determine their exact fractional targets and height-one cokernel divisors under degree/H_p/Katz rescaling. Resolve E13: the printed raw f-map plus degree identity gives a (p)-cokernel of length v_p(H_p(f)) for the normalized map. Preserve the rational reciprocity comparison and identify any corrected integral normalization before exporting a pseudo-isomorphism. Generic regulators/family big logarithms do not supply these target-lattice calculations. Consumers: `eisenstein-bf-specialization`, `ky-integral-cyclotomic-adaptation`.
- **`ArithmeticGaloisRepresentations:R01.1`.** For the actual weight-two representations, supply the scalar-image bound C₁ in KY Lemma 3.0.3, pp.35–36 and the irreducibility/rank-one σ-coinvariant verification in CGS Theorem 4.3.1, pp.19–20. State characteristic-zero hypotheses, the finite coefficient-rank dependence and the non-CM/induced cases. Ribet’s nonsplit-lattice node is already imported separately; it is not this open-image theorem. Consumers: `cgs-rational-bf-specialization`, `ky-uniform-twist-specialization`.
- **`EulerSystemsAndKolyvaginSystems:ES.8/augmentation-prime-divisibility`.** Verify its conditional coefficient-prime branch in the KY specialization with a quantified uniform error bound or an independent μ comparison. The present CGS Λ[1/p] export includes augmentation but supplies no (ϖ) assertion. Consumers: `ky-coefficient-prime-divisibility-target`.
- **`AutomorphicCongruences:L2/klz-beilinson-flach-classes`.** Resolve the existing unread-KLZ source gap and specialize the actual modular/CM classes to CGS’s integral distinguished lattice, retaining auxiliary norm factors and the fixed ϖ^r. Consumers: `eisenstein-bf-specialization`.
- **`AutomorphicCongruences:L2/bf-explicit-reciprocity`.** Resolve the existing unread-KLZ source gap and verify both global reciprocity laws for the same actual specialized class, fractional congruence ideals and integral period choices. Consumers: `eisenstein-bf-specialization`, `eisenstein-bf-pr-image`, `eisenstein-bf-greenberg-image`.
- **`EulerSystemsAndKolyvaginSystems:ES.8`.** Provide the KLZ refinement of Rubin’s rational Iwasawa bound with the nontrivial ordinary local condition at p, as used in CGS Theorem 4.3.1 pp.19–20. Verify tower/Leopoldt hypotheses and translate the induced characteristic-zero representation and rank-one σ-coinvariants to the correct ordinary–strict dual. The existing generic rational Rubin node and ES.4 bound are ingredients; neither its residual-irreducible integral version nor a bare strict-at-all-p bound is the required arithmetic conclusion. Consumers: `cgs-rational-bf-specialization`.
- **`AutomorphicPadicLFunctions:L3h/hida-katz-mu-vanishing`.** Verify a valid proof of the precise Hida anticyclotomic Katz μ theorem after the 2010 Lemma 3.17 correction. The 2022 Lemma 0.2 projection/intersection alternative also fails as written (E15). Check the independent second proof of Corollary 3.19, pp.97–98, or supply the actual geometric argument with its additional hypotheses. Retain Theorem I’s p-ordinary/unramified and (M1)–(M3) conditions; no generic cyclotomic elliptic μ-vanishing follows. Consumers: `cgls-character-lambda-comparison`, `eisenstein-cm-value-congruence`, `ky-exceptional-character-specialization`.

The exact gaps remaining in this planning pass are:

- **Exact CM character main-conjecture specialization.** The owner exists: CMAllPrimeMainConjectures CZ.2–CZ.3. Its current anti projection records Tor/control and exceptional-character gaps. Rubin91 Theorem 4.1 was inspected but its proof was not; Rubin94 pp.23–28 and de Shalit III.1.10 were not obtained in a cleared copy. KY Theorem 1.2.2 asserts the stronger exceptional range; the precise supplier request must verify p|h_K, θ=1/ω, p=3 and anomalous cases rather than assume them from the narrower existing node. Hida Katz μ=0 is separately imported from AP L3h with its 2022 correction.
- **Integral p-irregular CM congruence and source correction.** The generic CM congruence node assumes a residual distinction absent at the CGS weight-one Eisenstein point. HT94 Theorem 0.3 was inspected only at statement level. CGS Lemma 2.4.4 uses H_cusp|h_K·Katz after removing augmentation by BDP22; Corollary 4.1.3 also uses h_K·Katz|H(g) from Hida07. The 2025 replacement proof retains (A2), local nontriviality of the branch character. Establish its applicability to the irregular family or give a separate proof; neither BDP22’s nonzero augmentation nor h_K being an integer makes this quotient a unit.
- **Integral Eisenstein arithmetic supplier exports.** The exact Wüthrich addition to Kato L4, modular-symbol/Néron period comparison, actual KLZ specialization and both global reciprocity identities, integral Coleman lattice maps and arithmetic open/scalar-image inputs are requested from their existing owners. Generic KLZ nodes explicitly retain unread-source gaps. These contracts are not formal baseline theorems, and a rational Kato bound cannot replace Wüthrich at (ϖ).
- **KY coefficient-prime specialization.** The existing ES.8 augmentation-prime-divisibility node explicitly leaves the KY (ϖ) case conditional. KY Theorem 3.0.5 p.37 says the height-one computation also works there, but the uniform estimate under coefficient-prime ramified specialization has not been verified in this audit. Preserve the stronger theorem as a target; use the verified Λ[1/p] branch plus independent μ=0 for integral Greenberg equality.
- **Integral unscaled Heegner line comparison.** CGS Corollary 6.5.4 asserts the integral index-square equality, but the p-prime comparison of the actual unscaled line must be made explicit. KY Introduction B uses Λ while §3.0.8 uses undefined Λ^ac; CGLS uses Λ^ac=Λ[1/p]. A fixed p-power in the lattice transfer changes the index characteristic ideal. Keep rationalized index-square equality as the verified comparison and require an integral two-way exact-sequence/logarithm/lattice calculation for the stronger export. Independent μ(X_Gr)=0 is not itself μ(S/Λκ∞)=0.
- **KY cyclotomic adaptation and integral isogeny transfer.** KY Theorem 3.0.10 p.41 gives a short substitution proof. Verify the CGS finite-power congruence, no-finite-submodule, control and BF/Poitou–Tate inputs on the chosen invariant-free lattice when characters are 1/ω, then compare it with Wüthrich’s distinguished lattice and the original curve including Néron period indices. The two chosen curves need not coincide. Narrow CGS local-exclusion statements are not automatically available here.
- **Normalized Coleman height-one cokernel.** CGS v2 Theorem 4.1.1, Lemma 4.1.2 and Corollary 4.1.3 have incompatible simultaneous integral cokernel claims when H_p(f) is a nonunit (source issue E13). Determine the corrected raw target or retain the divisor of the normalized cokernel in both reciprocity/Poitou–Tate sequences. The PR image identity is retained, and the discrepancy disappears after inverting p. The integral two-way BF equivalence and its use at the end of the cyclotomic proof remain conditional on this calculation. No claim is made against the uninspected journal text.
- **Hida Katz μ proof correction.** Hida 2010 Lemma 3.17 is withdrawn by the 2022 addendum, but its replacement Lemma 0.2 also fails for the coordinate-sum-zero plane (E15). Import the intended anticyclotomic Katz μ theorem only with a valid geometric repair or a verified use of the independent second proof of Corollary 3.19, pp.97–98. The existing AP L3h owner retains this proof obligation; no elliptic cyclotomic μ=0 assertion is inferred.
- **Arithmetic Lean carriers at the pins.** The reviewed BSD.7a audit reports the main-conjecture theory unbuilt. Actual Iwasawa Selmer modules, the global BF/Heegner systems, integral Coleman maps and their arithmetic normalization interfaces are unavailable as a compatible Lean API at the pins. The Suggested file names the omitted arithmetic targets and construction API/tests; its elaborated examples only test real Mathlib power-series algebra. No arithmetic conclusion is formalized by those examples.

## Source findings and version discipline

The findings below are in the worker's own words. The cited theorem numbers and pages are for the exact versions in the source ledger, and have not been substituted for journal page numbers. CGS is published in Math. Ann. 393 (2025), 2451–2506, DOI 10.1007/s00208-025-03239-x, but the publisher request returned HTML rather than the article. The CGS findings therefore concern arXiv v2, not uninspected journal text. The September 2023 author copy was also checked at the Coleman-map passage and has the same simultaneous assertions. A publisher collation must establish whether the journal text corrects them.

- **RankZeroOneBSD/E7** (misprint; affects the proof). arXiv:2402.12781v2, §1.2, proof of Remark 1.2.3(ii), pp.14–15. The source identifies ker(χ)=K_cyc as the cyclotomic Z_p-extension of K and claims linear disjointness between it and K_cyc. Use the disjointness of the anticyclotomic Z_p-extension K_∞ and K_cyc. Distinguish the fixed field of ker χ from K_cyc by the finite cyclotomic part; only openness of χ(G_K∞) is needed. Reason: An infinite extension is not linearly disjoint from itself. The preceding and following argument only needs the cyclotomic character to have infinite/open image on the anticyclotomic tower so a finite-order twist cannot make it trivial. Correction status: new.
- **RankZeroOneBSD/E8** (gap; affects a stated result). arXiv:2402.12781v2, Introduction Theorem B p.5 versus §3.0.8 (IMC1) p.40; same discrepancy in author copy. The source places Theorem B in Λ, while it places Theorem 3.0.8 (IMC1) in Λ^ac. Clarify the coefficient ring and verify the integral two-way index comparison if the stronger introductory Λ statement is intended. Retain the weaker rationalized statement until this verification; IMC2 remains integral in Λ^nr. Reason: The two statements identified as the same theorem give different ring labels; Λ^ac is not defined in this v2 text, while CGLS uses it for Λ[1/p]. Inverting p removes a substantive height-one assertion. The integral Kolyvagin bound alone does not identify the actual class/lattice scalar in both directions. Correction status: new.
- **RankZeroOneBSD/E9** (misprint; affects nothing). arXiv:2402.12781v2, p.41, proof of Theorem 3.0.10; also author copy inspected. The source cites Theorem 3.0.9. The reference is Remark 3.0.9, following Theorem 3.0.8. Reason: The preceding item is explicitly labelled Remark 3.0.9. It discusses removal of H⁰(K,ρ_f)=0 and is the intended reference. This corrects the cross-reference, not the unresolved arithmetic adaptation interfaces. Correction status: new.
- **RankZeroOneBSD/E10** (misprint; affects nothing). arXiv:2402.12781v2, §1.5, p.31, definition preceding Theorem 1.5.1; also author copy inspected. V_f = T_f ⊗ Q_ℓ Use V_f=T_f⊗_O F, with the p-adic coefficient field F fixed in the Introduction and §1.3. Reason: Here ℓ is the rational prime below w∤p. The representation attached to f and its O-lattice are p-adic, as explicitly defined in §1.3. The printed Q_ℓ cannot be the fraction field of this lattice. The new KY finite-Euler comparison uses the original p-adic V_f and inertia coinvariants. Correction status: new.
- **RankZeroOneBSD/E11** (error; affects the proof). Lemma 3.17, published p.95; author addendum p.1, 24 July 2022. The projection hypotheses are used to conclude that a free submodule N of A^m is all of A^m. The author addendum withdraws the stronger conclusion and proposes an inductive alternative. That alternative also needs repair (E15). Supply a valid argument using the geometric hypotheses, or verify the independent second proof of Corollary 3.19 on pp.97–98; do not import the generic linear-algebra assertion unchanged. Reason: Over a field, the subspace x+y+z=0 in A^3 projects onto every coordinate pair and onto the first two coordinates, yet has dimension two. The stronger conclusion cannot be used in the Katz μ proof. Correction status: Hida, author addendum dated 24 July 2022, https://www.math.ucla.edu/~hida/Addendam.pdf.
- **RankZeroOneBSD/E12** (gap; affects the proof). Corollary 5.6, printed p.263; author correction Introduction pp.1–3 and §6, pp.33–43. The proof of the congruence-series divisibility uses a stronger nonvanishing assertion than the corrected nonvanishing theorems establish. Use the replacement proof in the 27 March 2025 manuscript, Theorem 6.14 and Corollary 6.15, retaining hi(M/F). Check its §6.1 assumptions before specializing to the p-irregular CGS family. Reason: The author identifies the earlier all-but-finitely-many nonvanishing assertion as open and replaces the application by a different argument. The correction does not authorize dropping its local nontriviality assumption or the class-number factor. Correction status: Hida, Non-vanishing of integrals of a mod p modular form, 27 March 2025, https://www.math.ucla.edu/~hida/EllrevF.pdf.
- **RankZeroOneBSD/E13** (error; affects a stated result). arXiv:2303.04373v2, H_p(f) definition p.7; Theorem 4.1.1 p.17; Lemma 4.1.2 pp.17–18; Corollary 4.1.3 p.18. The raw f-Coleman map has pseudo-null cokernel in I_f⊗Λ_K, deg(π_•)I_f=ℤ_p, and multiplying this map by deg(π_•)H_p(f) is again claimed to give pseudo-null cokernel in Λ_K. These claims require a corrected target lattice, raw-map normalization, or an explicit height-one cokernel term. With the stated raw target and degree identity, the normalized map has cokernel length v_p(H_p(f)) at (p). Retain the reciprocity image identity and the rationalized map comparison; do not assert the integral pseudo-null claim when H_p(f) is a nonunit. Reason: Localize at the height-one prime (p). The raw map becomes an isomorphism, and degree multiplication identifies I_f with ℤ_p. Subsequent multiplication by H_p(f) has nonzero cokernel when α_p²≡1 mod p. The permitted ordinary case a_p≡−1 mod p gives α_p≡−1, so the local character exclusion does not force H_p(f) to be a unit. The inconsistency concerns these simultaneous normalization assertions, not a disproof of the main-conjecture endpoint. Correction status: new.
- **RankZeroOneBSD/E14** (misprint; affects nothing). arXiv:2303.04373v2, proof of Proposition 4.2.1, p.19, paragraph following (4.3). The normalized E_• Coleman comparison is attributed to Corollary 4.1.1. The numbered corollary is 4.1.3; item 4.1.1 is a theorem about the raw maps. Its normalization still needs the correction in E13. Reason: The map Col_E_• used in this paragraph is introduced in Corollary 4.1.3, not Theorem 4.1.1. Correction status: new.
- **RankZeroOneBSD/E15** (error; affects the proof). Author addendum of 24 July 2022, p.1, Lemma 0.2 and its proof; PDF visually checked. The three projection hypotheses are claimed to allow the first m−1 coordinate factors to be identified inside N and to imply that N intersected with that coordinate hyperplane satisfies the same hypotheses with m reduced by one. Neither inference follows from the stated projection hypotheses. Establish the needed arithmetic/geometric induction by an additional valid argument, or verify the published independent second proof of Corollary 3.19. An identification of the entire coordinate hyperplane inside N would itself force the full-rank conclusion and is not furnished by its surjective projection. Reason: Take a field A, m=3 and N={(x,y,z):x+y+z=0}. N is free, all coordinate-pair projections and the first-two-coordinate projection are onto, and N≠A³. Its intersection with A²×0 is {(x,−x,0)}, whose projection to A² is not onto. Thus the asserted m=2 projection condition fails. The alleged containment A²×0⊂N also fails. Correction status: new.

Existing corrections were sought in the arXiv version records, linked author copies, author publication pages and searches for a corrigendum or erratum. The exact search receipts and version hashes are in the packet. New findings are submitted for independent verification and carry no self-review verdict. E11 and E12 identify author corrections; E15 explains why the 2022 replacement itself still requires repair.

## Source ledger

All URLs below were read on 2026-10-19. File hashes and the complete version record are in the packet. The entries say what was read; they do not imply a complete reading of a supplier's proof.

- **cgs** — Francesc Castella, Giada Grossi, Christopher Skinner, [Mazur's main conjecture at Eisenstein primes](https://arxiv.org/pdf/2303.04373v2). arXiv:2303.04373v2, 15 October 2025; version actually read. Read: Introduction and §§2–4, pp.1–20; Theorem 6.1.1, pp.21–22; proof mechanism in §§6.3–6.4, pp.23–28; §6.5, pp.28–29; §7.2, pp.29–31.
- **ky** — Timo Keller, Mulun Yin, [On the anticyclotomic Iwasawa theory of newforms at Eisenstein primes of semistable reduction](https://arxiv.org/pdf/2402.12781v2). arXiv:2402.12781v2, 30 October 2024; preprint, not a verified published version. Read: Introduction hypotheses; local and global character comparisons and residual diagrams, §§1.1–1.5, pp.9–31; Analytic comparison, §2.2, pp.32–34; Uniform bounds, actual lattice transfer, both main-conjecture statements and cyclotomic corollary, §3.0, pp.35–41.
- **cgls** — Francesc Castella, Giada Grossi, Jaehoon Lee, Christopher Skinner, [On the anticyclotomic Iwasawa theory of rational elliptic curves at Eisenstein primes](https://web.math.ucsb.edu/~castella/Eisenstein-print.pdf). Inventiones mathematicae 227 (2022), 517–580; published author PDF. Read: Introduction and hypotheses, printed pp.519–521; Definitions and character main-conjecture inputs, pp.528–532; Theorem 1.5.1 p.538; §2.2, pp.543–544; Remark 4.1.3, pp.568–569; Proposition 4.2.1 and Theorem 4.2.2, p.569; Corollary 4.2.3, p.570.
- **wuthrich** — Christian Wüthrich, [On the integrality of modular symbols and Kato’s Euler system for elliptic curves](https://ems.press/content/serial-article-files/26230?nt=1). Documenta Mathematica 19 (2014), 381–402; DOI 10.4171/DM/450. Read: Introduction and distinguished quotient, pp.381–384; Proposition 8, pp.388–389; Integral Euler-system proof and integral divisibility, pp.393–398.
- **ht94** — Haruzo Hida, Jacques Tilouine, [On the anticyclotomic main conjecture for CM fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0117/LOG_0011.pdf). Inventiones mathematicae 117 (1994), 89–147; digitized published scan. Read: Introduction and Theorem 0.3, printed pp.89–93 inspected as images; proof not read.
- **rubin91** — Karl Rubin, [The “main conjectures” of Iwasawa theory for imaginary quadratic fields](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0103/LOG_0009.pdf). Inventiones mathematicae 103 (1991), 25–68; digitized published scan. Read: Introduction p.25; Theorem 4.1 and specialization remark, pp.36–39 inspected as images; §§8–10 proof not read.
- **hida10** — Haruzo Hida, [The Iwasawa μ-invariant of p-adic Hecke L-functions](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p02-p.pdf). Annals of Mathematics 172 (2010), 41–137; published PDF. Read: Theorem I and hypotheses, pp.41–46; Lemma 3.17, p.95 and Corollary 3.19, p.97; relevant Lemma 5.2 only; full μ proof imported from its owner.
- **hida10-addendum** — Haruzo Hida, [Addendum correcting Lemma 3.17 in the μ-invariant paper](https://www.math.ucla.edu/~hida/Addendam.pdf). Author addendum dated 24 July 2022, one page. Read: Whole one-page correction, including Lemma 0.2; inspected visually and tested on the coordinate-sum-zero counterexample. Its proposed repair is not accepted without further verification..
- **hida07** — Haruzo Hida, [Non-vanishing modulo p of Hecke L-values and application](https://www.math.ucla.edu/~hida/ELLC.pdf). LMS Lecture Note Series 320 (2007), 207–269; author copy. Read: Introduction pp.208–209; Theorem 5.1, pp.247–248; Corollary 5.6, p.263.
- **hida07-correction** — Haruzo Hida, [Non-vanishing of integrals of a mod p modular form](https://www.math.ucla.edu/~hida/EllrevF.pdf). Author manuscript dated 27 March 2025; replacement proof of the 2007 application. Read: Introduction pp.1–3; §6 introduction and assumptions, pp.33–35; Theorem 6.14 and Corollary 6.15, pp.42–43.
- **bdp22** — Adel Betina, Mladen Dimitrov, Alice Pozzi, [On the failure of Gorensteinness at weight 1 Eisenstein points of the eigencurve](https://arxiv.org/pdf/1804.00648v4). arXiv:1804.00648v4, 3 May 2021; publication: American Journal of Mathematics 144 (2022), 227–265; locators refer to preprint. Read: Introduction and Theorem A(i), Remark 0.1, pp.2–3; proof via Theorem 3.5, pp.20–21.

Rubin 1994, “More ‘main conjectures’ for imaginary quadratic fields,” pp.23–28, and de Shalit III.1.10 were not obtained in an authorized readable copy. Rubin 1991 Theorem 4.1 and Hida–Tilouine Theorem 0.3 were inspected at statement level; their long proofs are imported from the existing CM owner. The maintainer's cleared-library index was checked and did not clear de Shalit. These access and hypothesis limits are part of the exceptional CM specialization gap. The generic KLZ suppliers themselves record an unread-source gap; their node IDs do not remove it.

## Atlas landmarks

- Uniform Kolyvagin bound — `cgs-uniform-twist-specialization`.
- Eisenstein anticyclotomic main conjecture — `cgs-integral-greenberg-equality`.
- Keller–Yin anticyclotomic main conjecture — `ky-integral-greenberg-equality`.
- Eisenstein cyclotomic main conjecture — `cgs-mazur-equality`.
- Keller–Yin cyclotomic main conjecture — `ky-mazur-equality`.

These five landmarks share the existing BSD.7a stage. The complete target and API inventory above is the specification; the compact Suggested file is an aid to signature design.
