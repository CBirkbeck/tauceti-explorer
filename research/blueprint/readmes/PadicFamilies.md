# Hida and Coleman families, period modules, and family L-functions — blueprint

This blueprint plans all eight layers of the roadmap at target level. L0a is closed; L0, L1, L2, L2a, L3, L4 and L5
are planned, with the refinements and recorded gaps listed under "Open items".
- **L0a** owns the factorial ordinary projector e = lim U^{n!}: on finite and profinite modules (Khare–Thorne §2.4,
  Hida 1986 §1), on locally finite endomorphisms of complete modules and complexes (Pilloni, Duke 2020, §2; BCGP
  §2.11), and on perfect complexes and towers of them.
- **L0** is Hida's ordinary Hecke algebra, control and Λ-adic forms (Hida, Ann. Sci. ÉNS 1986, §§1–5).
- **L1** is the ordinary family modular-symbol module, family periods and measures, the generic congruence module,
  Hida's family congruence modules and the branch L-functions (Emerton–Pollack–Weston, §§2.6–2.8 and 4.1–4.3).
- **L2a** is Buzzard's eigenvariety machine with its coherent eigenmodule sheaf and the spectral variety of a
  complex (Buzzard §§4–5; Pilloni §13.1; BCGP §6.1.1).
- **L2** is the eigencurve built from Stevens's overconvergent modular symbols (Bellaïche, *Critical p-adic
  L-functions*, §3).
- **L3** is Bellaïche's critical-slope and θ-critical theory.
- **L4** is Hida's big Galois representation, family Selmer groups and complexes, Beilinson–Kato classes in Hida
  families, the family Coleman map, Ochiai's two-variable L-function and Euler-system bound, and the regulator over
  Coleman families (Ochiai, Ann. Inst. Fourier 2005, §1; Kings–Loeffler–Zerbes §8.2; Loeffler–Zerbes, Coleman
  families, §§6–7).
- **L5** is Hida theory over totally real fields: Skinner–Wiles's definite quaternionic towers and Λ-adic Hilbert
  modular forms with the facts Dasgupta–Kakde–Ventullo use (Skinner–Wiles §3.2; Dasgupta–Kakde–Ventullo §§3–4).

The roadmap belongs to the restructured family RS-08, whose accepted proposal fixes what each layer keeps.
- **L0a** owns the finite and profinite factorial ordinary-projector API beyond the pinned Fitting lemma.
  OrdinaryAutomorphicFormsAndModularityLifting R21.1, PotentialAutomorphyInfrastructure PA.2 and AutomorphicCongruences
  L2s import it.
- **L2a** is the group-independent eigenvariety machine; AutomorphicGaloisRepresentationsPartII AG2.3 and the
  modular instance L2 apply it.
- **Notions moved down.** In the upstream order this roadmap is in tier 16, below OrdinaryAutomorphicFormsAndModularityLifting
  (tier 20). The definite quaternionic ordinary projector, the nearly ordinary Hecke algebra T_∞(U, 𝒪), level
  independence and the duality of the ordinary towers (formerly cited from R21.1) are planned in L5, and Hida's big
  Galois representation for F = ℚ (assigned by RS-08 to R21.3) is planned in L4; R21.1 and R21.3 import them from here.
  Nakayama's lemma for compact modules, formerly cited from NoncommutativeAndEquivariantIwasawa, is planned in L0.
- **Not replanned.** The factorial-powers idempotent of a finite algebra over a complete local ring, the artinian
  telescope comparison and the determinant of a finite projective module are IntegralHeckeAndGaloisDeterminants IHG.0
  and IHG.2 (a TauCetiRoadmap roadmap); complete flat complexes, minimal models and residual Nakayama for complexes are
  DeformationAndDerivedPatchingAlgebra P7; slope decompositions of complexes of Banach modules and the local constancy
  of their Euler characteristics are LocallyAnalyticDistributions L4. They are cited by node.
- **Red-team findings handed to this plan.** RT-AREA-langlands-1/27: the generic congruence module Ψ_λ(M) and
  congruence ideal η_λ had no owner; L1 now plans them once (L1/congruence-module, L1/congruence-ideal), and the
  consumers keep only their instances. RT-AREA-langlands-1/8: the Hilbert consumers' Igusa input must not come from
  IgusaVarietiesAndTorsionConcentration IG.1; L5 cites no IG.1 node, and its q-expansion input for Λ-adic Hilbert forms
  is HodgeTateAndCanonicalSubgroups T5 (the ordinary Igusa tower of the dual canonical subgroup).

## Purpose

Hida theory rests on one elementary construction: the ordinary projector e = lim U^{n!} of a Hecke operator U.
- **L0a** builds it once, for every module on which it makes sense:
  - finite modules, by a finite-set argument;
  - modules presented as inverse limits of finite quotients;
  - finite modules over a noetherian local ring with finite residue field;
  - complexes, perfect complexes in the homotopy category, and towers of perfect complexes over R/I_c.
- **L0 and L5** instantiate it on modular and Hilbert modular forms and cohomology.
- **R21.1 and PA.2** apply it to Hecke complexes.

L2a turns a compact operator φ on (Pr) Banach modules over the affinoids of a weight space into an eigenvariety. The
steps are:
1. the Fredholm spectral variety;
2. an admissible cover by finite flat slope blocks;
3. the finite Hecke algebras of the blocks;
4. the gluing.

L2 applies L2a to overconvergent modular symbols, and AG2.3 to definite unitary groups.

## What the libraries and other roadmaps supply

The reviewed library audit AUDIT-15 records:
- **L0a: partly built.** Mathlib has the Fitting decomposition, but not the factorial projector, the profinite
  projector, exactness or the complex-level statements.
- **L2a: not built.**

**Mathlib has:**
- the Fitting decomposition of an endomorphism of an Artinian and Noetherian module
  (`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`, `LinearMap.eventually_isCompl_ker_pow_range_pow`), with the
  stabilisation lemmas `LinearMap.eventually_iInf_range_pow_eq` and `LinearMap.eventually_iSup_ker_pow_eq`;
- `isArtinian_of_finite`, the Noetherian instance for finite modules, and
  `IsArtinian.bijective_of_injective_endomorphism`;
- idempotents and projections (`IsIdempotentElem`, `LinearMap.isProj_iff_isIdempotentElem`,
  `LinearMap.linearProjOfIsCompl`);
- localization of modules (`LocalizedModule`, `IsLocalizedModule`) and the R[X]-module `Module.AEval'` attached to
  an endomorphism;
- finiteness of R/mⁿ over a noetherian local ring with finite residue field (`Ideal.finite_quotient_pow`,
  `IsLocalRing.finite_quotient_iff`) and adic completeness (`IsAdicComplete`);
- sections of cofiltered systems of finite sets (`nonempty_sections_of_finite_cofiltered_system`);
- complexes, homology maps and the homotopy category (`HomologicalComplex`, `HomologicalComplex.homologyMap`,
  `HomotopyCategory`).

**Tau Ceti has** nothing specific to L0a or L2a (AUDIT-15: no ordinary projector, eigenvariety or Fredholm
hypersurface).

**Imported from other packets (cited node ids):**
- **AdicSpacesPartII F0:** `finite-module-inverse-limit`. Finite modules over an adic noetherian ring are
  separated and complete, and every linear map between them is continuous.
- **ArithmeticGaloisDuality R02.1:** `milnor-sequence` and `mittag-leffler-lim-one`, giving cohomology of towers
  of complexes.
- **LocallyAnalyticDistributions L4 (for L2a):**
  - the Fredholm determinant and its theory on (Pr) modules (`fredholm-determinant`, `entire-series`,
    `projective-banach-modules`, `summand-fredholm-theory`, `completed-base-change`);
  - the cyclic identity det(1 − Xuv) = det(1 − Xvu) (`cyclic-determinant-identity`);
  - Riesz slope summands and their Hecke stability (`finite-slope-summands`, `riesz-commuting-stability`);
  - resultants (`entire-resultants`, `resultant-unit`).

- **IntegralHeckeAndGaloisDeterminants (TauCetiRoadmap):** `IHG.2/factorial-localizing-idempotent` (the idempotent
  lim t^{n!} in a finite algebra over a complete local ring with finite residue field), `IHG.2/derived-idempotent-splitting`,
  `IHG.2/ordinary-localization-comparison` (the telescope comparison over an artinian ring) and `IHG.2/finite-hecke-local-factors`
  for L0a; `IHG.0/finite-projective-determinant` and `IHG.0/cayley-hamilton-identity` for the characteristic polynomial
  of L2a; `IHG.4/classical-interpolation` for L4.
- **DeformationAndDerivedPatchingAlgebra P7 (for L0a):** minimal complexes (`minimal-complex`, `minimal-representative`,
  `minimal-homotopy-equivalence-is-iso`, `finite-derived-action-localization`), complete flat complexes and their minimal
  models (`p7ii-complete-flat-complex`, `p7ii-complete-flat-morphism-splitting`, `p7ii-complete-flat-minimal-model`,
  `p7ii-complete-flat-minimal-residue`, `p7ii-complete-flat-transfer-composition`), residual perfectness and residual
  quasi-isomorphisms (`p7ii-complete-flat-residual-perfect`, `p7ii-complete-flat-residual-quasiiso`) and derived limits
  of towers (`p7ii-derived-inverse-limit`).
- **LocallyAnalyticDistributions L4 (for L2a and L2), further:** Banach cochain complexes and compact representatives
  (`banach-cochain-complex`, `compact-complex-representative`, `compact-homotopy-endomorphism`,
  `representative-fredholm-product`), slope subcomplexes and their perfect models (`slope-subcomplex`,
  `finite-slope-perfect-complex`, `finite-slope-homotopy-invariance`, `derived-slope-base-change`, `slope-uniqueness`),
  orthonormalisable modules and complete continuity.
- **ModularSymbolsPadicLFunctions L0–L2 (for L1, L2, L3):** modular symbols, their coset description, Hecke operators,
  ± parts, base change and the Eichler–Shimura isomorphism (L0); period lines and integral period lattices (L1); weight-k
  distributions, the specialisation map, Stevens's control theorem and p-stabilisation (L2).
- **HilbertModularVarietiesAndShimuraCurves R18.3 (for L5):** the definite class set, the integral pairing, neat level,
  the split Hecke normalisation and the definite Jacquet–Langlands realisation.
- **GL2AutomorphicRepresentationsAndTransfer R16.6 (for L5):** Hilbert algebraic weights, the classical Hecke and level
  dictionary and the newform exports.
- **HodgeTateAndCanonicalSubgroups T5 (for L5):** the Igusa torsor of the dual canonical subgroup over the ordinary
  locus.
- **SelmerIwasawaCohomology L2–L3 (for L4):** Greenberg conditions, Selmer groups and duals, Iwasawa cohomology, the
  Iwasawa Selmer complex with derived control, correction complexes and determinants.
- **KatoEulerSystems L1–L4 (for L4):** Kato's zeta elements with their norm relations and moment maps, the generalised
  explicit reciprocity law, the dual exponential, and the cyclotomic Euler-system bound.
- **ModularCurvesPartII R14.2, R14.4, R14.6 (for L4 and L1):** the Tate module of modular Jacobians with Galois and
  Hecke actions, degeneracy maps, the Eichler–Shimura relation and the semistable Tate filtration.
- **PadicMeasuresIwasawaAlgebras L1:** the completed group ring (`convolution-algebra`).

**Requested (stage suppliers):**
- **HilbertModularVarietiesAndShimuraCurves R18.3 (for L5):** free action after an auxiliary prime (Skinner–Wiles
  Lemma 3.5, Corollary 3.6), and invariants of the quaternionic sets under free action.
- **GL2AutomorphicRepresentationsAndTransfer R16.6 (for L5):** Hilbert cusp forms of parallel weight with their newforms.
- **AdicSpacesPartII R0:** Tate algebras, affinoid products and Weierstrass preparation (Buzzard Lemma 4.1).
- **AdicSpacesPartII R2:** admissible formal models with the Bosch–Lütkebohmert flattening theorems (Conrad
  A.1.2).
- **AdicSpacesPartII R3:** finite coherent algebras, affinoid restriction and coherent descent.
- **PadicMeasuresIwasawaAlgebras L0a:** the rigid weight space with its affinoid restriction maps and the universal
  character on an affinoid (for L2a and L2).
- **PadicMeasuresIwasawaAlgebras L1:** Λ_𝒪 with its power-series coordinate (for L0).
- **ModularCurvesPartII R12.5, R13.2 (for L0):** ω^k with its Hecke normalisation, and moduli of trivialised elliptic
  curves.
- **ModularCurvesPartII R14.3, R14.6 (for L1 and L4):** homology of X₁(M) with path classes; Wiles's mod-p
  multiplicity one; and the Mazur–Wiles connected–étale filtration of the ordinary part of J₁(Np^t) at p.
- **GlobalGaloisDeformations R04.3 (for L3):** H¹_g(ad ρ_f) and refined deformations.
- **TauCetiRoadmap ModularForms, Layer 8 (for L1):** modular-symbol path classes {∞, a}.

## Conventions

- **Modules and endomorphisms.**
  - U ∈ End_R(M) is R-linear; R need not be commutative except where localization at U is used.
  - "Finite module" in L0a means finite as a set, unless it is said to be a finite R-module.
- **The projector.**
  - e_U = U^{m!} with m = |M| for finite M.
  - In general e_U = lim U^{n!}, a pointwise limit, with the explicit threshold n ≥ |M/J| modulo J.
  - M_ord = e_U M and M_nord = ker e_U = (1 − e_U)M.
- **Finite quotient systems.**
  - They are downward-directed families of U-stable submodules J with finite M/J, separated and complete.
  - Continuity of a map means: for every K there is J with f(J) ⊆ K.
- **Complexes.** Khare–Thorne's conventions apply:
  - *good* complexes are bounded with finite projective terms;
  - *minimal* complexes are good with differentials zero modulo m;
  - End_{K(R)}(C) = End_{D(R)}(C) for good C.
- **Eigenvarieties.** Buzzard's conventions apply:
  - K is complete for a nontrivial nonarchimedean absolute value, and R is a reduced K-affinoid with its supremum
    norm;
  - the spectral coordinate T is the reciprocal of a nonzero φ-eigenvalue;
  - radii r lie in the divisible closure of |K×|;
  - logarithmic radii are kept distinct from radii (see E1).

## Milestones

Library modules:
- L0a: `TauCeti/NumberTheory/PadicFamilies/{OrdinaryProjector, OrdinaryComplex}`, namespace `TauCeti.PadicFamilies`.
- L2a: `TauCeti/NumberTheory/PadicFamilies/Eigenvariety`, namespace `TauCeti.PadicFamilies.Eigenvariety`.
- L0, L1, L2, L4, L5: `TauCeti/NumberTheory/PadicFamilies/<layer>`, namespace `TauCeti.PadicFamilies`.

### L0, Milestone 0: Hida's ordinary Hecke algebra

The source is Hida, *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. ÉNS 19 (1986), §§1–5 and §7, from
the Numdam scan.

**Definition: Katz's p-adic modular functions** (node `katz-padic-modular-functions`; planet "Katz p-adic modular
forms").
- V(N; A) consists of functions on trivialised elliptic curves with level structure over p-adic A-algebras.
- W(N; A) consists of those that are integral at the Tate curves.
- **The q-expansion principle** (1.8): the q-expansion is injective with A-flat cokernel.
- **Level:** V(N₀pʳ; A) = V(N₀; A).
- *Unit tests.*
  - E_{p−1} ≡ 1.
  - The p-power part of the level is absorbed.
  - A p-adic limit of Eisenstein series lies in no single classical weight.

**Theorem: the p-adic closure of classical forms** (node `padic-completion-of-classical`; Katz's Theorem 1.1 and
Corollary 1.2).
- W(N; ℤ_p) is the p-adic closure of the classical forms of all weights.
- Modulo p, W ≅ G/(E_{p−1} − 1).

**Construction: Hecke operators and the weight action** (node `padic-hecke-operators`; (1.12)–(1.13)).
- T(ℓ) and T(ℓ, ℓ) act on p-adic forms by Hida's q-expansion formulas.
- The group Z = ℤ_p^× × (ℤ/N₀)^× acts continuously.
- **Unit tests.**
  - U_p fixes E₂^{(p)}.
  - T(ℓ) is classical on each weight.
  - Γ acts on weight k by z^k.

**Construction: the universal Hecke algebra** (node `universal-hecke-algebra`; planet "Hida's universal Hecke algebra";
(1.14)–(1.15)).
- H(N; 𝒪) = lim_j H_j(N; 𝒪) is compact.
- It is independent of the power of p in N.
- *API.*
  - `universalHecke`.
  - `universalHecke_compact`.
  - `universalHecke_level_indep`.
  - `universalHecke_restrict`.

**Construction: the ordinary idempotent** (node `ordinary-idempotent-hecke`; (1.17)).
- e = lim T(p)^{n!} in H(N; 𝒪), an instance of L0a's `ordinary-idempotent-finite-algebra` on each finite H_j.
- It is compatible with the limit.
- *Unit tests.*
  - p = 11 fixes Δ, since τ(11) ≡ 1 mod 11.
  - p = 2 kills Δ.
  - e fixes E_k^{(p)}.

**Theorem: duality** (node `hecke-duality`; Proposition 2.1, Theorem 2.2, Corollary 2.3).
- H_j ≅ Hom(M_j, A) via a(1, f|h).
- For p ≥ 5, H(N; ℤ_p) and M(N; ℚ_p/ℤ_p) are Pontryagin dual.
- The ordinary parts are dual.

**Construction: the weight algebra** (node `weight-algebra-action`).
- Λ = 𝒪[[1 + pℤ_p]] ≅ 𝒪[[X]] acts through the weight action.
- The arithmetic points are P_k = (1 + X) − (1 + p)^k.
- H^ord = ⊕_{a mod p−1} H^ord(N, a).

**Lemma and theorems:**
- `jochnowitz-lemma` (Lemma 4.1): U_p kills M_{k+p−1}/M_k mod p for k ≥ 3.
- `ordinary-mod-p-weight-independence` (Theorem 4.2): the ordinary mod-p forms live in weights j(a) ∈ [3, p + 1].
- `ordinary-finite-over-lambda` (Corollary 4.2): H^ord is finite over Λ, by duality and topological Nakayama.

**Theorem: Hida's control theorem** (node `hida-control-theorem`; planet; Theorem 3.1 and Corollary 3.2). For p ≥ 5
and p | N:
- H^ord and h^ord are free of finite rank over Λ;
- H^ord(N, a)/P_k ≅ H_k^ord(Γ₁(N₀p), ω^{a−k}) for k ≥ j(a);
- h^ord(N, a)/P_k ≅ h_k^ord for k ≥ 2.

**Construction: the ordinary Eisenstein family** (node `ordinary-eisenstein-family`). It is built from
DirichletPadicLFunctions L4's measure-valued q-expansion (RS-08).
- Its specialisation at P_k is E_k^{(p)}(ψω^{−k}).
- U_p = 1.
- Its constant term is the Kubota–Leopoldt pseudomeasure.
- *Unit tests.*
  - 691 divides the constant term at k = 12.
  - U_p = 1.
  - The q¹-coefficient is 1.

**Theorem: classical specialisation** (node `arithmetic-specialization`; planet).
- Arithmetic specialisations of Λ-adic ordinary eigenforms are classical ordinary eigenforms of weight k, level N₀pʳ and
  nebentypus ω^{a−k}.
- Oldforms at p enter through the unique unit-root p-stabilisation (ModularSymbolsPadicLFunctions L2).

**Definition: Λ-adic forms as q-expansions and their duality with the ordinary Hecke algebra** (node `lambda-adic-forms`; planet "Λ-adic forms"; Hida (ÉNS 1986) §2, Proposition 2.1 and Theorem 2.2, pp. 245–247; §3, (3.2), Theorem 3.1 and Corollary 3.2, pp. 249–250). Let p ≥ 5, N = N₀p with p ∤ N₀, Λ = ℤ_p[[X]] with X ↔ γ − 1 for γ = 1 + p, and I a finite flat Λ-algebra. An ordinary Λ-adic cusp form of level N with coefficients in I is a formal q-expansion F = Σ_{n≥1} a(n, F)qⁿ ∈ I[[q]] such that for every arithmetic point P of I above P_k = (1 + X − (1 + p)^k) with k ≥ 2 the specialisation F mod P is the q-expansion of a classical ordinary cusp form of weight k and level N₀p (with the nebentypus determined by P). They form an I-module S^ord(N; I). The pairing (h, F) ↦ a(1, F|h) identifies S^ord(N; Λ) with Hom_Λ(h^ord(N; Λ), Λ), and normalised eigenforms in S^ord(N; I) correspond to Λ-algebra homomorphisms h^ord(N; Λ) → I. This definition does not use the Eisenstein family.

*Hypotheses.* p ≥ 5; N₀ prime to p; specialisation required at every arithmetic point of weight k ≥ 2.

*API.*
- `LambdaAdicForm` (constructor): S^ord(N; I) ⊆ I[[q]] with classical specialisations at arithmetic points.
- `LambdaAdicForm.specialise` (projection): F ↦ F mod P, a classical ordinary cusp form.
- `lambdaAdicForm_equiv_hom` (equivalence): S^ord(N; Λ) ≅ Hom_Λ(h^ord(N; Λ), Λ) via the first-coefficient pairing.
- `lambdaAdicEigenform_equiv_algHom` (equivalence): Normalised eigenforms in S^ord(N; I) ↔ Λ-algebra maps h^ord(N; Λ) → I.

*Unit tests.*
- `lambdaAdicForm_delta_family` (computation): For p = 11, the ordinary family through the weight-two newform of level 11 is a Λ-adic eigenform with coefficients in Λ whose weight-12 specialisation is the 11-stabilisation of Δ.
- `lambdaAdicForm_zero` (degenerate): The zero q-expansion is a Λ-adic form; S^ord(N; I) = 0 when h^ord(N; Λ) = 0.
- `lambdaAdicForm_compat_dual` (compatibility): Under the duality, the Λ-adic form attached to h ↦ a(1, h) is the formal sum Σ T(n)qⁿ with coefficients in h^ord.
- `lambdaAdicForm_not_eisenstein` (non-example): The ordinary Λ-adic Eisenstein family has nonzero constant term and is not in S^ord(N; Λ).

*Proof sketch.* Weight-k duality: Hecke algebras and forms are dual under the first-coefficient pairing at every finite weight and level (L0/hecke-duality). Freeness and control (L0/hida-control-theorem): h^ord(N; Λ) is free of finite rank and its fibre at P_k is the weight-k ordinary Hecke algebra; hence Hom_Λ(h^ord, Λ) specialises at every P_k to the dual of the weight-k Hecke algebra, i.e. to ordinary cusp forms of weight k, which is the q-expansion condition. Conversely a family of q-expansions specialising to classical forms defines, through a(1, F|T(n)) = a(n, F), a Λ-linear functional on the Hecke algebra (the Hecke operators act on q-expansions coefficientwise and their action is determined at a Zariski-dense set of weights).

*Prerequisites.* `PadicFamilies:L0/hecke-duality`, `PadicFamilies:L0/hida-control-theorem`, `PadicFamilies:L0/ordinary-idempotent-hecke`, `PadicFamilies:L0/weight-algebra-action`, `mathlib:PowerSeries`.

*Check.* Wiles's original definition (Invent. Math. 94, 1988) imposes the classicality condition only at a Zariski-dense set of weights; with Hida's control theorem the two versions agree, and this is the equivalence the stage asks for.

**Theorem: Primitive components of the ordinary Hecke algebra** (node `primitive-components`; Hida (ÉNS 1986) §3, Proposition 3.4, Theorem 3.5 and the terminology before them, pp. 251–252; Theorem 3.6 and Corollary 3.7, p. 253). Let L be the fraction field of Λ_K and h^ord(N; 𝒪_K) the cuspidal ordinary Hecke algebra (p ≥ 5, N = N₀p). The algebra h^ord(N; K) := h^ord(N; 𝒪_K) ⊗_Λ L is a finite-dimensional L-algebra; its primitive part h^ord_prim (the part not coming from lower tame level) is semisimple, a product of finite field extensions 𝒦 of L (the primitive components). If 𝒦 is a primitive cuspidal component with d = [𝒦 : L], then for every k ≥ 2 exactly d ordinary eigenforms of weight k and level Γ₁(N₀p) belong to 𝒦, their associated newforms have conductor divisible by N₀, and conversely every ordinary eigenform of weight k ≥ 2 whose newform has conductor divisible by N₀ belongs to a unique primitive component. The algebraic closure of ℚ_p in 𝒦 is a finite extension of K, and primitive components are compatible with extension of K.

*Hypotheses.* p ≥ 5; N₀ prime to p; cuspidal components.

*Proof sketch.* Semisimplicity: the primitive part of h^ord ⊗ L injects into a product over classical weights of semisimple new Hecke algebras (Hecke operators on newforms are semisimple), so it has no nilradical. Counting: the image of h^ord in 𝒦 is finite over Λ of generic rank d, and by control (L0/hida-control-theorem) its fibre at P_k embeds in the weight-k Hecke algebra; each homomorphism to ℚ̄_p is an eigenform, giving exactly d of them for k ≥ 2. Prop 3.4: Λ_K ⊆ 𝒦 and X is transcendental over the algebraic closure M of ℚ_p in 𝒦, so [M : K] divides [𝒦 : L].

*Prerequisites.* `PadicFamilies:L0/hida-control-theorem`, `PadicFamilies:L0/lambda-adic-forms`, `PadicFamilies:L0/arithmetic-specialization`, `tauceti:HeckeRing.GL2.Newform`, `mathlib:FractionRing`.

*Check.* The non-primitive part of h^ord ⊗ L need not be semisimple (oldforms with repeated U_ℓ-eigenvalues), which is why the statement is for primitive components; L1/reduced-hida-algebra removes the U_ℓ to obtain a reduced algebra.

**Lemma: Nakayama's lemma for compact modules over complete local rings** (node `compact-nakayama`; Hida (ÉNS 1986) §4, proof of Corollary 4.2, p. 258). Let Λ be a complete noetherian local ring with maximal ideal 𝔪 and finite residue field, and M a compact Hausdorff topological Λ-module (equivalently a profinite Λ-module; for example the Pontryagin dual of a discrete Λ-module). Then ⋂_n 𝔪ⁿM = 0 and M = lim_n M/𝔪ⁿM; if M/𝔪M is finite, then M is finitely generated over Λ, and any lifts of generators of M/𝔪M generate M.

*Hypotheses.* Λ complete noetherian local with finite residue field; M compact Hausdorff.

*Proof sketch.* M is the limit of its finite discrete quotients M/U; each is a finite Λ-module, hence killed by some 𝔪ⁿ, so 𝔪ⁿM ⊆ U and ⋂ 𝔪ⁿM = 0. Let N be the submodule generated by lifts x_1, …, x_r of generators of M/𝔪M; it is the image of the continuous map Λ^r → M, hence compact and closed. By induction M = N + 𝔪ⁿM for all n, and N = ⋂_n (N + 𝔪ⁿM) because N is closed and the 𝔪ⁿM form a basis of neighbourhoods of 0.

*Prerequisites.* `mathlib:IsAdicComplete`, `mathlib:Ideal.finite_quotient_pow`, `mathlib:Submodule.span`.

*Check.* This replaces the earlier citation of NoncommutativeAndEquivariantIwasawa NE.0, a roadmap outside the upstream order; the lemma moves down here.

### L0a, Milestone 1: the finite projector

**Lemma: factorial iterates stabilise** (`iterate_factorial_eq_of_card_le`, `iterate_factorial_idempotent`;
node `factorial-iterate-stabilises`). Let f : X → X with |X| = m. Then:
- f^[n!] = f^[m!] for every n ≥ m;
- e = f^[m!] is idempotent, with image the eventual image ⋂ f^[k](X);
- f is a bijection of that image, with inverse f^[m! − 1].

*Proof.* Every orbit enters a cycle of length ℓ ≤ m after at most m steps, and ℓ divides n! for n ≥ m. No group order
is inverted.

**Definition: the ordinary projector** (`ordinaryProjector`; node `finite-ordinary-projector`; planet "Ordinary
projector"; Khare–Thorne Lemma 2.10, Hida (1.17)). For an R-module M finite as a set and U ∈ End_R(M),
e_U := U^{|M|!}.

*API.*
- `ordinaryProjector_eq_pow_factorial`: e_U = U^{n!} for n ≥ |M|.
- `isIdempotentElem_ordinaryProjector`.
- `commute_ordinaryProjector`.
- `ordinaryProjector_of_isUnit`: e_U = 1.
- `ordinaryProjector_of_isNilpotent`: e_U = 0.
- `ordinaryPart` and `nonOrdinaryPart`.

*Unit tests.*
- Multiplication by 2 on ZMod 6 has e = multiplication by 4, the projection onto the ZMod 3 factor. A definition
  "1 if U is invertible, else 0" fails this test.
- Multiplication by 2 on ZMod 8: M_ord = 0.
- Multiplication by 3 on ZMod 8: M_ord = M.
- e_1 = 1.
- range e_U = ⨅ range Uⁿ and ker e_U = ⨆ ker Uⁿ (Mathlib's Fitting decomposition).

**Lemma: the Fitting comparison** (`ordinaryPart_eq_iInf_range_pow`, `nonOrdinaryPart_eq_iSup_ker_pow`; node
`finite-fitting-comparison`). e_U is the projection onto ⨅ range Uⁿ along ⨆ ker Uⁿ in
`LinearMap.isCompl_iSup_ker_pow_iInf_range_pow`.

**Lemma: invertible and nilpotent parts** (`bijOn_ordinaryPart`, `pow_pred_mul_eq_on_ordinaryPart`,
`pow_card_apply_nonOrdinaryPart`; node `ordinary-part-bijective`).
- U is an automorphism of M_ord, with inverse U^{m! − 1}.
- U^m = 0 on M_nord.

**Theorem: uniqueness of the decomposition** (`ordinaryPart_unique`; node `finite-ordinary-decomposition-unique`;
planet "Ordinary and non-ordinary parts"; Khare–Thorne Lemma 2.10(1)).
- **The decomposition.** M = M_ord ⊕ M_nord, with U bijective on M_ord and nilpotent on M_nord.
- **Uniqueness.** If M = A ⊕ B with U(A) = A and B killed by powers of U, then A = M_ord and B = M_nord.

*Proof.* A ⊆ ⨅ range Uⁿ and B ⊆ ⨆ ker Uⁿ, then count.

**Lemma: naturality** (`ordinaryProjector_comp_of_comp_eq`; node `ordinary-projector-natural`; Khare–Thorne Lemma
2.10(2)). If f U₁ = U₂ f, then f e_{U₁} = e_{U₂} f.

*Proof.* Use one exponent n! with n ≥ max(|M|, |N|).

**Theorem: exactness** (`ordinaryPart_exact`, `map_ordinaryPart_of_surjective`; node `ordinary-projector-exact`;
Khare–Thorne Lemma 2.11). Take U-equivariant maps f : M′ → M and g : M → M″, exact at M. Then:
- ker g ∩ M_ord = f(M′_ord);
- if g is surjective, then g(M_ord) = M″_ord.

**Lemma: quotients** (`ordinaryPart_quotient`; node `ordinary-projector-quotient`; Khare–Thorne Lemma 2.10(3)).
- (M/P)_ord is the image of M_ord.
- (M/IM)_ord = M_ord/I M_ord.

**Comparison: localization** (`bijective_ordinaryPart_localizedModule`, `comp_ordinaryProjector_of_bijective`; node
`ordinary-part-localization`; ACC+, proof of Proposition 5.2.15). Let R be commutative.
- M_ord → M[U⁻¹] is an isomorphism, where M[U⁻¹] is the localization of the R[X]-module M, with X acting by U, at
  the powers of X.
- Emerton's localization definition of ordinary parts therefore agrees with the summand definition at finite level.

### L0a, Milestone 2: profinite modules and the adic instance

**Definition: finite quotient systems** (`FiniteQuotientSystem`; node `finite-quotient-system`). A downward-directed
family (J_i) of submodules of M such that:
- each J_i is U-stable;
- each M/J_i is finite;
- ⋂ J_i = 0;
- every compatible family of residues is represented by one x ∈ M, so M = lim M/J_i.

*API.*
- `quotientEnd`.
- `mk_eq_iff`.
- `equivLimit`.

*Unit tests.*
- ℤ_p with pⁿℤ_p.
- No system on ℂ over ℂ.
- The one-element system on a finite module.
- ∏ ZMod 2 with the left shift: a compact module with continuous U need not admit a U-stable system.

**Construction: the profinite ordinary projector** (`FiniteQuotientSystem.projector`; node
`profinite-ordinary-projector`; planet "Profinite ordinary projector"; Hida (1.17a–b)). e is the unique
endomorphism reducing to e_{U_i} on every M/J_i.

*Properties.*
- U^{n!}x ≡ e x mod J_i for n ≥ |M/J_i|.
- e² = e and eU = Ue.
- e(J_i) ⊆ J_i.

*API.*
- `mkQ_comp_projector`.
- `projector_sub_pow_factorial_mem`.
- `isIdempotentElem_projector`.
- `commute_projector`.
- `projector_mapsTo`.

*Unit tests.*
- ℤ_p with U = p: e = 0.
- ℤ_p with U a unit: e = 1.
- ℤ_p² with U = diag(1, p): e = diag(1, 0).
- The finite case agrees with `ordinaryProjector`.

**Theorem: the profinite decomposition** (`isCompl_range_ker_projector`, `bijOn_range_projector`,
`tendsto_pow_of_mem_ker`, `projector_unique`; node `profinite-ordinary-decomposition`).
- M = eM ⊕ (1 − e)M, with closed summands.
- U is bijective on eM, with continuous inverse.
- U is topologically nilpotent on (1 − e)M. There is no uniform exponent: on ℤ_p with U = p, U is not nilpotent.
- e is unique among continuous idempotents commuting with U with these properties.

**Lemma: naturality for maps respecting the systems** (`projector_comp_of_comp_eq`; node
`profinite-projector-natural`). Continuous U-equivariant maps commute with the projectors. Continuity is the
condition that the map respects the quotient systems.

**Theorem: the adic instance** (`FiniteQuotientSystem.adic`; node `adic-instance`; planet "Hida's projector over
complete local rings"; Khare–Thorne Lemma 2.10). Let R be noetherian local with finite residue field and M a finite,
m-adically complete R-module.
- (mⁿM) is a finite quotient system for every R-linear U.
- e_U = lim U^{n!} in End_R(M).
- All of Lemma 2.10 follows: the decomposition, its uniqueness, naturality for every R-linear map, and
  (M/IM)_ord = M_ord/IM_ord.

*Failure test.* R = ℂ, m = 0, U = 2. Finite generation over a complete local ring is not enough.

**Lemma: limits of finite exact sequences** (`exists_sections_lift_of_finite`; node `finite-inverse-limit-exact`).
Over a cofiltered index, the limit of short exact sequences with finite kernels is exact.

*Proof.* The fibres are finite nonempty cosets, so `nonempty_sections_of_finite_cofiltered_system` applies.

**Theorem: exactness of the profinite ordinary part** (node `profinite-projector-exact`).
- **(a)** For continuous U-equivariant exact sequences, the ordinary sequence is a retract of the given one.
- **(b)** For cofiltered systems of finite exact sequences, the limit is exact and (lim M_c)_ord = lim (M_c)_ord.
  This is compact surjectivity in place of Mittag-Leffler.

### L0a, Milestone 3: complexes

**Theorem: ordinary parts of complexes** (`ordinaryProjectorComplex`, `homologyMap_ordinaryProjectorComplex`; node
`ordinary-part-complexes`; Khare–Thorne Lemma 2.11). Let T be a chain endomorphism of a complex of finite modules,
or of finite modules over a complete noetherian local ring with finite residue field.
- The degreewise projectors form a chain idempotent.
- C = C_ord ⊕ C_nord.
- H^i(C_ord) = H^i(C)_ord.
- The decomposition is functorial for chain maps intertwining the endomorphisms.

**Construction: the idempotent of an element of a finite algebra** (`exists_isIdempotentElem_limit_pow_factorial`;
node `ordinary-idempotent-finite-algebra`). Let A be a finite, m-adically complete R-algebra and t ∈ A.
- e_t = lim t^{n!} is an idempotent of R[t] = `Algebra.adjoin R {t}`.
- e_t acts on every A-module that is finite over R as the ordinary projector of t.

*API.*
- `ordinaryIdempotent_mem_adjoin`.
- `isIdempotentElem_ordinaryIdempotent`.
- `tendsto_pow_factorial_ordinaryIdempotent`.
- `ordinaryIdempotent_smul`.
- `map_ordinaryIdempotent`.

*Unit tests.*
- A = ℤ_p.
- A = ℤ_p × ℤ_p with t = (1, p): e = (1, 0).
- A = M₂(ℤ_p) with t = (1 1; 0 p): e = (1 1/(1 − p); 0 0), the projection onto the unit eigenline along the p-eigenline.
- t nilpotent: e = 0.

**Theorem: the ordinary part of a perfect complex** (node `derived-ordinary-idempotent`; planet "Ordinary part of a
perfect complex"; Khare–Thorne Lemma 2.12; ACC+ §5.1). Let C be a good complex over a complete noetherian local ring
with finite residue field, and t ∈ End_{K(R)}(C).
- e = e_t is the unique idempotent in R[t] with:
  - H(t) invertible on H(e)H*(C);
  - H(t) topologically nilpotent on (1 − H(e))H*(C).
- The degreewise ordinary part of any chain representative splits e. So C_ord exists in K(R) without assuming that
  the derived category is idempotent complete in the library.

**Theorem: ordinary parts along a tower** (node `ordinary-complexes-inverse-limit`; planet "Ordinary complexes
along a tower"; Khare–Thorne Proposition 2.15). Take perfect complexes M_c over R/I_c, with compatible endomorphisms
t_c and compatible ordinary cohomology.
- They glue to a minimal complex F_∞ over R with F_∞ ⊗ R_c ≅ (M_c)_ord.
- F_∞ is unique up to homotopy.
- Commuting endomorphisms glue.

*Imported.* Minimal complexes and gluing (P7) and the Milnor sequence (ArithmeticGaloisDuality R02.1).

### L0a, Milestone 3b: locally finite endomorphisms of complete modules and complexes

The sources are Pilloni, *Higher coherent cohomology and p-adic modular forms of singular weights* (Duke Math. J. 169,
2020), §2, and Boxer–Calegari–Gee–Pilloni, *Abelian surfaces over totally real fields are potentially modular*
(arXiv:1812.09269v3), §2.11. They extend the projector to complete modules that are not finitely generated and to
complexes of such modules, where higher Hida theory needs it. The complete flat complexes, their minimal models and the
residual detection of perfectness and of quasi-isomorphisms are DeformationAndDerivedPatchingAlgebra P7, cited.

**Definition: Locally finite endomorphisms of complete modules** (node `locally-finite-action`; planet "Locally finite endomorphism"; Pilloni (Duke 2020) §2.1, Definition 2.1.1, p. 7; BCGP §2.11, Definition 2.11.1, p. 40). Let R be a complete noetherian local ring with maximal ideal m and finite residue field, and let M be an R-module that is m-adically separated and complete (M ≅ lim_n M/mⁿM; no finiteness of M is assumed). An R-linear endomorphism T of M is locally finite if for every n ≥ 1 and every v ∈ M/mⁿM the R-submodule of M/mⁿM spanned by the orbit {T^k v : k ≥ 0} is finitely generated; equivalently, each M/mⁿM is the directed union of its T-stable finitely generated R-submodules. Since R/mⁿ is finite, a finitely generated R/mⁿ-module is a finite set, so each such submodule is finite.

*Hypotheses.* R complete noetherian local with finite residue field; M m-adically separated and complete; T ∈ End_R(M).

*API.*
- `IsLocallyFiniteEnd` (constructor): The predicate on (M, T): for all n and v ∈ M/mⁿM, the orbit span of v is finitely generated over R.
- `isLocallyFiniteEnd_iff_directed_union` (characterisation): T is locally finite iff every M/mⁿM is the union of its T-stable finitely generated submodules.
- `isLocallyFiniteEnd_of_finite` (instance): If M is a finite R-module, every T is locally finite.
- `isLocallyFiniteEnd_of_finiteQuotientSystem` (compatibility): If every M/mⁿM is finite, T is locally finite and (mⁿM)_n is a finite quotient system for (M, T) (L0a/finite-quotient-system).
- `IsLocallyFiniteEnd.mul` (relation): Products of commuting locally finite endomorphisms are locally finite (BCGP Lemma 2.11.2).

*Unit tests.*
- `isLocallyFiniteEnd_finite` (compatibility): On M = R² over R = ℤ_p every endomorphism is locally finite, and the projector agrees with the adic projector of L0a/adic-instance.
- `isLocallyFiniteEnd_zero` (degenerate): The zero endomorphism and the identity of any complete M are locally finite (orbit spans have at most one generator).
- `not_isLocallyFiniteEnd_shift` (non-example): On the completed direct sum M of countably many copies of ℤ_p, the shift e_i ↦ e_{i+1} is not locally finite: modulo p the orbit of e_0 spans an infinite-dimensional 𝔽_p-space.
- `isLocallyFiniteEnd_diagonal` (computation): On the same M, the diagonal endomorphism e_i ↦ p^i e_i is locally finite: modulo pⁿ it kills all e_i with i ≥ n, so each orbit span is finitely generated.

*Proof sketch.* The two formulations agree: the span of an orbit is T-stable, and a sum of finitely many T-stable finitely generated submodules is again one. A finitely generated R/mⁿ-module is finite as a set because R/mⁿ has finite length and finite residue field (Ideal.finite_quotient_pow).

*Prerequisites.* `mathlib:IsAdicComplete`, `mathlib:IsLocalRing.maximalIdeal`, `mathlib:Ideal.finite_quotient_pow`, `mathlib:Module.End`, `mathlib:Submodule.span`, `PadicFamilies:L0a/finite-ordinary-projector`.

*Check.* A finite R-module carries only locally finite endomorphisms; the notion is new only for modules that are not finitely generated, such as completed direct sums of copies of R or completed cohomology.

**Lemma: Stability of local finiteness under extensions, quotients and products** (node `locally-finite-stability`; Pilloni (Duke 2020) §2.1, Lemma 2.1.1, p. 7, and Remark 2.1.1, pp. 7–8; BCGP §2.11, Lemma 2.11.2, p. 40). Let 0 → M₁ → M₂ → M₃ → 0 be an exact sequence of m-adically separated complete R-modules with compatible endomorphisms T. (1) If T is locally finite on M₁ and M₃, it is locally finite on M₂. (2) If T is locally finite on M₂, it is locally finite on M₃. (3) If T is locally finite on M₂ and mⁿM₂ = 0 for some n, it is locally finite on M₁. Without the bounded-torsion hypothesis (3) fails: on M₂ = ∏_{i≥0} ℤ_p with T(a_0, a_1, …) = (0, p a_0, p² a_1, …, p^i a_{i−1}, …), T is locally finite on M₂ and preserves the kernel M₁ of M₂ → ∏_i ℤ/p^{(i+1)²}, but is not locally finite on M₁. (4) If T₁, T₂ commute and are locally finite on M, then T₁T₂ is locally finite.

*Hypotheses.* R complete noetherian local with finite residue field; all modules m-adically separated and complete; T-equivariant maps.

*Proof sketch.* (1): modulo mⁿ, write the image M of M₁/mⁿ in M₂/mⁿ; T is locally finite on M by (2). Given v, local finiteness on M₃ gives T^N v = w + Σ_{i<N} a_i T^i v with w ∈ M, and local finiteness on M gives a relation for w; the span of {T^i v, T^j w} is T-stable and finitely generated. (2) and (3) are immediate from the definition, since an orbit span in a submodule killed by mⁿ is an orbit span in M₂/mⁿ. The counterexample: elements of M₁ have coordinates divisible by growing powers of p, and modulo p the orbit of a suitable element of M₁ has infinitely many independent images (Pilloni's Remark 2.1.1). (4): reduce to M killed by mⁿ; the span of {T₂^i T₁^j v} is finitely generated and T₁T₂-stable.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-action`, `mathlib:Submodule.span`, `mathlib:Function.Exact.linearMap_ker_eq`.

*Check.* The counterexample of (3) is checked as stated: T maps M₂ into the kernel M₁ and fails local finiteness there, so no stability under arbitrary submodules is claimed.

**Lemma: Local finiteness is detected modulo the maximal ideal** (node `locally-finite-mod-maximal`; Pilloni (Duke 2020) §2.1, Lemma 2.1.2, p. 8; BCGP §2.11, Lemma 2.11.3, p. 40). For an m-adically separated complete R-module M and T ∈ End_R(M), T is locally finite on M if and only if the induced endomorphism of M/mM is locally finite.

*Hypotheses.* R complete noetherian local with finite residue field; M m-adically separated and complete.

*Proof sketch.* Necessity is part (2) of L0a/locally-finite-stability. Sufficiency by induction on n, using the right exact sequence (m^{n−1}/mⁿ) ⊗_R M → M/mⁿM → M/m^{n−1}M → 0: the left term is a quotient of a finite direct sum of copies of M/mM (m^{n−1}/mⁿ is a finite-dimensional R/m-space), so T is locally finite on it and on its image, and part (1) of L0a/locally-finite-stability applies to the image and the quotient.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/locally-finite-stability`, `mathlib:Ideal.finite_quotient_pow`.

*Check.* For M = ℤ_p^{(ℕ)} completed and T the shift, the criterion fails modulo p, matching not_isLocallyFiniteEnd_shift.

**Construction: The ordinary projector of a locally finite endomorphism** (node `locally-finite-ordinary-projector`; planet "Ordinary projector e(T) = lim T^{N!}"; Pilloni (Duke 2020) §2.1, Lemma 2.1.3, p. 8; BCGP §2.11, Lemma 2.11.4, p. 40). Let T be a locally finite endomorphism of an m-adically separated complete R-module M. For every v ∈ M the sequence T^{N!}v converges m-adically; e(T)v := lim_N T^{N!}v defines an R-linear idempotent e = e(T) ∈ End_R(M) commuting with T, and M = eM ⊕ (1 − e)M with both summands T-stable and closed, T bijective on eM and topologically nilpotent on (1 − e)M (for each v ∈ (1 − e)M and each n, Tᵏv ∈ mⁿM for k large). e is the unique idempotent with these properties. When every M/mⁿM is finite, e coincides with the projector of L0a/profinite-ordinary-projector for the quotient system (mⁿM)_n.

*Hypotheses.* T ∈ End_R(M) locally finite (L0a/locally-finite-action).

*API.*
- `ordinaryProjectorLF` (constructor): e(T) ∈ End_R(M) for a locally finite T.
- `ordinaryProjectorLF_apply` (characterisation): e(T)v is the m-adic limit of T^{N!}v.
- `isIdempotentElem_ordinaryProjectorLF` (structure): e(T)² = e(T).
- `commute_ordinaryProjectorLF` (structure): e(T)T = Te(T).
- `ordinaryProjectorLF_bijective` (characterisation): T restricts to a bijection of e(T)M.
- `ordinaryProjectorLF_topNilpotent` (characterisation): T is topologically nilpotent on (1 − e(T))M.
- `ordinaryProjectorLF_unique` (extensionality): An idempotent commuting with T with these two properties equals e(T).
- `ordinaryProjectorLF_eq_profinite` (compatibility): If every M/mⁿM is finite, e(T) is the projector of L0a/profinite-ordinary-projector for (mⁿM)_n.

*Unit tests.*
- `ordinaryProjectorLF_unit` (computation): If T is invertible (for example T = 1 + p on M = ℤ_p), e(T) = 1.
- `ordinaryProjectorLF_topNil` (degenerate): If T is topologically nilpotent (for example T = p on a completed free module), e(T) = 0.
- `ordinaryProjectorLF_diagonal` (computation): For e_i ↦ p^i e_i on the completed direct sum of copies of ℤ_p, e(T) is the projection onto ℤ_p e_0.
- `ordinaryProjectorLF_not_power` (non-example): In the diagonal example no single power T^{N!} equals e(T), so a definition of e as a fixed power is wrong.

*Proof sketch.* Fix n and v ∈ M/mⁿM; the orbit span V of v is a finite T-stable module, so L0a/finite-ordinary-projector gives T^{N!}v = e_V v for N ≥ |V|, independent of the choice of V by L0a/ordinary-projector-natural applied to inclusions of finite T-stable submodules. The resulting projectors on the M/mⁿM are compatible in n (naturality for the reduction maps), and m-adic completeness assembles them into e on M. Bijectivity of T on eM, topological nilpotence on (1 − e)M and uniqueness are checked modulo each mⁿ on finite T-stable submodules, where they are L0a/ordinary-part-bijective and L0a/finite-ordinary-decomposition-unique.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/finite-ordinary-projector`, `PadicFamilies:L0a/ordinary-projector-natural`, `PadicFamilies:L0a/ordinary-part-bijective`, `PadicFamilies:L0a/finite-ordinary-decomposition-unique`, `PadicFamilies:L0a/profinite-ordinary-projector`, `mathlib:IsAdicComplete`.

*Check.* No uniform exponent N with e = T^{N!} on all of M is asserted; on the diagonal example of L0a/locally-finite-action, e is the projection onto the e_0-coordinate and T^{N!} differs from it at every finite N.

**Lemma: Functoriality and exactness of locally finite ordinary parts** (node `locally-finite-projector-exactness`; Pilloni (Duke 2020) §2.1, Lemma 2.1.4, p. 8). Let f : M₁ → M₂ be a T-equivariant R-linear map of m-adically separated complete modules on which T is locally finite. (1) f e = e f, so f(eM₁) ⊆ eM₂ and f((1 − e)M₁) ⊆ (1 − e)M₂. (2) If M₃ = coker f is m-adically separated and complete, coker(eM₁ → eM₂) = eM₃. (3) If T is locally finite on M₀ = ker f, then ker(eM₁ → eM₂) = eM₀.

*Hypotheses.* T locally finite on M₁ and M₂ (and on M₀ for (3)); the cokernel separated and complete for (2).

*Proof sketch.* Since f commutes with T, it commutes with each T^{N!}, hence with their limit e (continuity of f for the m-adic topologies). Thus f is the direct sum of ef and (1 − e)f, which gives (2) and (3); T is locally finite on M₃ by L0a/locally-finite-stability (2).

*Prerequisites.* `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/locally-finite-stability`.

*Check.* For the inclusion pℤ_p → ℤ_p with T = multiplication by a unit, both ordinary parts are everything and the cokernel ℤ/p is its own ordinary part.

**Definition: Locally finite endomorphisms of complete flat complexes** (node `locally-finite-derived-endomorphism`; Pilloni (Duke 2020) §2.2, p. 8, and §2.3, Definitions 2.3.1–2.3.2 and Proposition 2.3.1 with Lemma 2.3.1, pp. 9–10; BCGP §2.11, p. 41). Let C^flat(R) be the category of bounded complexes of flat m-adically separated complete R-modules and D^flat(R) the full subcategory of D(R) of objects they represent (DeformationAndDerivedPatchingAlgebra P7, complete flat complexes). A chain endomorphism T of M• ∈ C^flat(R) is locally finite if it is locally finite on every term Mⁱ; then the degreewise projectors form a chain idempotent e(T). An endomorphism T of an object M• of D^flat(R) is locally finite if it has a representative (M•₀, T₀) with M•₀ ∈ C^flat(R) and T₀ a locally finite chain endomorphism. Characterisation (Pilloni Proposition 2.3.1): T is locally finite if and only if it admits some representative in C^flat(R) and acts locally finitely on every Hⁱ(M• ⊗^L_R R/m).

*Hypotheses.* R complete noetherian local with finite residue field.

*API.*
- `IsLocallyFiniteChainEnd` (constructor): Degreewise local finiteness of a chain endomorphism of a complete flat complex.
- `chainOrdinaryProjector` (constructor): The chain idempotent e(T₀) assembled from the degreewise projectors.
- `IsLocallyFiniteDerivedEnd` (constructor): Existence of a locally finite complete flat representative.
- `isLocallyFiniteDerivedEnd_iff` (characterisation): Pilloni Proposition 2.3.1: equivalent to local finiteness on all Hⁱ(M ⊗^L R/m) given a complete flat representative.
- `isLocallyFiniteDerivedEnd_of_perfect` (instance): Every endomorphism of an object of D^perf(R) is locally finite (Remark 2.3.1).

*Unit tests.*
- `chainOrdinaryProjector_zero_complex` (degenerate): On the zero complex the projector is zero.
- `isLocallyFiniteDerivedEnd_perfect` (compatibility): On a bounded complex of finite free R-modules every chain endomorphism is locally finite and e(T₀) is the degreewise adic projector of L0a/ordinary-part-complexes.
- `isLocallyFiniteDerivedEnd_two_term` (computation): For the two-term complex ℤ_p --p--> ℤ_p with T = identity in both degrees, e(T) = 1 and the cohomology ℤ/p in degree one is its own ordinary part.
- `not_isLocallyFiniteDerivedEnd_shift` (non-example): The complex with the completed direct sum of copies of ℤ_p in degree 0 and the shift endomorphism is not locally finite, since its reduction modulo p is not.

*Proof sketch.* Degreewise projectors commute with the differentials because the differentials are T-equivariant (L0a/locally-finite-projector-exactness (1)). Characterisation, forward direction: Hⁱ(M•₀ ⊗ R/m) is a subquotient of Mⁱ₀/m, so L0a/locally-finite-stability applies. Converse: replace a representative M•₀ by a minimal complete flat subcomplex N• that is a deformation retract (differentials zero modulo m), using the splitting of a complete flat map into an isomorphism and a part vanishing modulo m; the transferred endomorphism s T₀ i acts on Nⁱ/m = Hⁱ(M• ⊗ R/m) as T does, hence is locally finite by L0a/locally-finite-mod-maximal.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-action`, `PadicFamilies:L0a/locally-finite-mod-maximal`, `PadicFamilies:L0a/locally-finite-stability`, `PadicFamilies:L0a/locally-finite-projector-exactness`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-complex`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-morphism-splitting`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-model`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-minimal-residue`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-transfer-composition`, `mathlib:DerivedCategory`, `mathlib:CochainComplex`.

*Check.* On a perfect complex every endomorphism is locally finite (Remark 2.3.1), so the notion adds nothing in D^perf(R) and is needed only for complexes of non-finitely-generated complete flat modules.

**Construction: The ordinary direct factor of a locally finite derived endomorphism** (node `derived-ordinary-direct-factor`; planet "Ordinary direct factor of a perfect complex"; Pilloni (Duke 2020) §2.3, Lemma 2.3.2 and the paragraph after it, pp. 10–11; Remark 2.3.1, p. 11; BCGP §2.11, p. 41; Khare–Thorne §2.4, Lemma 2.12, p. 10). Let T be a locally finite endomorphism of M• ∈ D^flat(R). A locally finite representative (M•₀, T₀) gives the chain idempotent e₀ = e(T₀) and the direct factor ē₀M• of M• in D(R) represented by e₀M•₀. If ē₀M• lies in D^perf(R), then for any other locally finite representative (M•₁, T₁), ē₁M• also lies in D^perf(R) and the canonical map ē₀M• → ē₁M• is a quasi-isomorphism; the ordinary direct factor e(T)M• ∈ D^perf(R) is therefore well defined up to canonical isomorphism, although the idempotent itself is only defined on representatives. When M• is perfect it agrees with the Khare–Thorne ordinary part of L0a/derived-ordinary-idempotent.

*Hypotheses.* T locally finite on M• ∈ D^flat(R); ē₀M• perfect for one representative.

*API.*
- `derivedOrdinaryPart` (constructor): e(T)M• ∈ D^perf(R), defined from any locally finite representative when one gives a perfect direct factor.
- `derivedOrdinaryPart_isPerfect` (structure): e(T)M• is perfect.
- `derivedOrdinaryPart_indep` (extensionality): Two locally finite representatives give canonically quasi-isomorphic direct factors.
- `derivedOrdinaryPart_reduction` (compatibility): Hⁱ(e(T)M• ⊗^L R/m) is the ordinary part of Hⁱ(M• ⊗^L R/m).
- `derivedOrdinaryPart_eq_kt` (compatibility): On D^perf(R) it is the ordinary part of L0a/derived-ordinary-idempotent.

*Unit tests.*
- `derivedOrdinaryPart_perfect` (compatibility): For M• = R[0] and T = multiplication by a unit, e(T)M• = R[0]; for T = multiplication by an element of m, it is 0.
- `derivedOrdinaryPart_zero` (degenerate): The ordinary part of the zero complex is zero.
- `derivedOrdinaryPart_split` (computation): For M• = R[0] ⊕ R[−1] with T = (1, p), e(T)M• = R[0].
- `derivedOrdinaryPart_needs_perfect` (non-example): For M• the completed direct sum of countably many copies of ℤ_p in degree 0 and T = 1, T is locally finite but e(T)M• = M• is not perfect; the construction yields an object of D^perf(R) only under the perfectness hypothesis, which is therefore not automatic.

*Proof sketch.* On each Hⁱ(M• ⊗^L R/m) the operators T₀ and T₁ induce the same locally finite endomorphism; by L0a/locally-finite-projector-exactness the projectors induced by e₀ and e₁ both equal its ordinary projector there, so ē₀M• → ē₁M• is an isomorphism modulo m. ē₁M• is perfect because its reduction modulo m has finite cohomology (complete flat complexes with finite residual cohomology are perfect). A map of complete flat complexes that is a quasi-isomorphism modulo m is a quasi-isomorphism. On a perfect M• the endomorphism algebra is finite over R and the factorial-power idempotent is unique (Pilloni Remark 2.3.1), which identifies the construction with L0a/derived-ordinary-idempotent.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-derived-endomorphism`, `PadicFamilies:L0a/locally-finite-projector-exactness`, `PadicFamilies:L0a/derived-ordinary-idempotent`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-perfect`, `DeformationAndDerivedPatchingAlgebra:P7/p7ii-complete-flat-residual-quasiiso`, `IntegralHeckeAndGaloisDeterminants:IHG.2/derived-idempotent-splitting`.

*Check.* The statement asserts independence of the direct factor up to canonical quasi-isomorphism, never equality of idempotents in End_{D(R)}(M•) for non-perfect M•.

**Comparison: Ordinary projectors over complete semilocal coefficient rings** (node `semilocal-ordinary-projector`; Pilloni (Duke 2020) §2 (standing hypothesis that R is complete local, p. 7) applied to Λ = ℤ_p[[ℤ_p^×]] in Parts II–IV). Let R be a complete semilocal noetherian ring whose quotient by its Jacobson radical is finite (for example Λ = ℤ_p[[ℤ_p^×]] for odd p, a product of p − 1 complete local rings ℤ_p[[1 + pℤ_p]]). Then R = ∏_j R_j with each R_j complete local with finite residue field, every R-module M decomposes as ∏_j M_j, and an endomorphism T is locally finite when each component T_j is; the ordinary projector, the derived ordinary direct factor and their properties are defined factor by factor, with 'perfect' read as 'bounded complex of finite projective R-modules' (finite projective modules over R need not be free when the factors have different ranks).

*Hypotheses.* R complete semilocal noetherian with R/rad(R) finite.

*Proof sketch.* A complete semilocal ring is the product of its localisations at its maximal ideals (idempotent lifting along the radical); IHG.2's finite local factors give the decomposition for finite algebras over a complete local base. All constructions of L0a/locally-finite-ordinary-projector and L0a/derived-ordinary-direct-factor commute with finite products.

*Prerequisites.* `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/derived-ordinary-direct-factor`, `IntegralHeckeAndGaloisDeterminants:IHG.2/finite-hecke-local-factors`, `mathlib:Module.Projective`.

*Check.* For R = ℤ_p[[ℤ_p^×]] the decomposition has exactly p − 1 factors, indexed by the characters of μ_{p−1}.

### L3, Milestone 6: critical slope, θ-criticality and critical p-adic L-functions

The source is Bellaïche, *Critical p-adic L-functions*, arXiv:0912.2925 (Invent. Math. 189 (2012)). RS-08 makes this
layer the owner of the general critical-slope, θ-critical and secondary theory; ModularSymbolsPadicLFunctions L3
imports it.

**Definition: refinements and their criticality** (node `refinement-criticality`; planet; §2.2, Definition 2.13). Three
separate notions:
- critical slope: v_p(β) = k + 1;
- critical: Proposition 2.12's equivalent conditions;
- θ-critical: f_β lies in θ^{k+1}(M†_{−k}).

*Unit tests.*
- The non-ordinary refinement of an ordinary form has critical slope.
- X₀(32) with p = 5 is critical and θ-critical.
- A supersingular form has no critical-slope refinement.

**Theorem: equivalent forms of criticality** (node `criticality-equivalences`; Proposition 2.12). The conditions are:
- non-classical generalised overconvergent eigenforms;
- non-étaleness of the weight map;
- a split local representation;
- a critical line in D_cris;
- θ-criticality (for cuspidal f).

**Theorem: classification** (node `critical-slope-classification`; Proposition 2.14). Critical-slope refinements exist
exactly in three cases:
- ordinary non-CM forms;
- CM forms with p split;
- Eisenstein series.

**Definition: decent refinements** (node `decent-refinement`; Definition 1, Proposition 2.15). f_β is decent if it is
Eisenstein, or non-critical, or has H¹_g(ad ρ_f) = 0.

**Theorem: smoothness** (node `eigencurve-smooth-decent`; Theorem 2.16). The eigencurve is smooth at decent points.

**Theorem: the θ exact sequence** (node `theta-exact-sequence`; planet; §3.2.3).
- 0 → D_{−2−k}(k + 1) → D_k → V_k → 0.
- On symbols this gives 0 → Symb(D_{−2−k}) → Symb(D_k) → Symb(V_k).

**Theorem: freeness in families** (node `family-symbols-free-rank-one`; Propositions 4.3–4.5). Family symbols are free
of rank one over the DVR local Hecke algebra at decent points.

**Theorem: the local Hecke algebra** (node `local-hecke-algebra-structure`; Theorem 4.7).
- The local Hecke algebra is ℚ̄_p[t]/(t^e).
- The generalised eigenspace has dimension e.

**Theorem: Bellaïche's theorem** (node `critical-eigenspace-dimension`; planet; Theorem 1, Corollary 4.8).
- The eigenline is one-dimensional.
- critical ⇔ e > 1 ⇔ ρ*_k kills the eigenline.

**Construction: the critical p-adic L-function** (node `critical-p-adic-l-function`; planet; §1.4.2).
L±(f_β, σ) = Φ±({∞} − {0})(σ).
- It is analytic, of order ≤ v_p(β).
- It equals the Pollack–Stevens L-function when f_β is not θ-critical.
- *Unit tests.*
  - Disjoint supports for the two signs.
  - The ordinary case recovers Mazur–Tate–Teitelbaum.
  - The Eisenstein minus-sign L-function vanishes.

**Theorems: consequences** (Theorem 2, Corollary 1).
- `theta-critical-vanishing`: divisibility by log^{[k]}.
- `critical-slope-infinitely-many-zeros`.

**Theorem: two-variable L-functions** (node `two-variable-l-function`; planet; Theorem 3). They exist on an affinoid
neighbourhood in the eigencurve.

**Construction: secondary L-functions** (node `secondary-l-functions`; §1.4.5). The L±_i = ∂^iL±/∂y^i and their
intrinsic flag.

### L2a, Milestone 4: spectral variety and slope cover

The fourteen nodes below keep the ids, statements and proof routes of the integrated decomposition. That
decomposition passed the R1 review of 2026-09-15.

**Construction: the Fredholm spectral variety** (`spectralVariety`; node `spectral-hypersurface`; planet "Fredholm
spectral variety"; Buzzard §4, §5 p. 32). Z_φ = V(det(1 − Tφ)) ⊆ Sp R × 𝔸¹.

*API.*
- `spectralVariety_truncation`.
- `mem_spectralVariety_iff`.
- `spectralVariety_baseChange`.

*Unit tests.*
- φ = 0 gives ∅.
- The rank-one case V(1 − aT).
- φ = (1 1; 0 1) gives the nonreduced (1 − T)².

**Lemmas and theorems:**
- `flat-spectral-charts`: Lemma 4.1 and Corollary 4.2. The charts Z_r → Sp R are flat and quasi-finite.
- `constant-rank-finiteness`: Corollary 4.3, via Conrad Theorem A.1.2. Constant fibre rank gives finite flatness.
- `newton-degree-loci`: Lemma 4.4. The loci of fibre degree ≥ i are finite unions of affinoids.
- `admissible-slope-cover`: Theorem 4.6, planet "Admissible cover by slope blocks". It carries the strengthened
  induction hypothesis (E4).

**Construction: strict neighbourhoods with a fixed slope block** (`strictNeighbourhood`; node
`strict-slope-neighborhoods`; Buzzard Lemma 4.5 as corrected by E1–E3). The corrected construction uses:
- the n = 0 condition;
- (n − d) log t;
- the witness identities V ∩ W = ∅ and X ∪ W = B.

*Unit tests.*
- The counterexample P = 1 + uT.
- The constant family.
- The failure of the printed witness identities.

### L2a, Milestone 5: Hecke charts and gluing

**Construction: slope polynomials** (`slopePolynomial`, `slopeSummand`; node `slope-polynomials`; §5
pp. 34–35).
- Q = a₀⁻¹Q′ with Q(0) = 1.
- Coprimality with F_A/Q, supplied by the resultant argument (E5).
- The finite projective Hecke-stable summand N.

*Unit tests.*
- Rank one.
- Diagonal φ with distinct slopes.
- A double root.

**Construction: finite Hecke images** (`heckeImage`; node `finite-hecke-images`). T(Y) ⊆ End_A(N) is finite over A,
with T ↦ φ⁻¹.

*Unit tests.*
- Hecke algebra generated by φ.
- Buzzard's nonreduced example R ⊕ I.
- N = 0.

**Construction: gluing Hecke charts** (`eigenvariety`; node `hecke-chart-gluing`; Lemmas 5.1–5.3). D_φ is separated
and finite over Z_φ.

**Comparisons:**
- `flat-eigenvariety-base-change`: Lemmas 5.4–5.5. Flatness is necessary, and the admissibility argument is
  corrected (E9).
- `linked-banach-families`: Lemma 5.6. It uses the cyclic determinant identity, Lemma 2.12 (E6).

**Construction: the eigenvariety machine** (`eigenvarietyOverWeight`; node `global-weight-gluing`; planet
"Eigenvariety machine"; Construction 5.7, with the link indices corrected by E7). D_φ → W, with:
- the eigenvalue map;
- canonical restriction to affinoids;
- independence of the cover.

*Unit tests.*
- W a point.
- A constant family.
- Identity links.

**Theorems:**
- `eigenpacket-points`: Lemmas 5.9–5.10, planet "Points are finite-slope eigensystems". Both directions are written
  out (E8).
- `equidimensional-components`: Lemma 5.8 via Chenevier Proposition 6.4.2.

### L2a, Milestone 5b: characteristic polynomials, eigenmodule sheaves and complexes

These nodes close two gaps of the earlier checkpoints and add the complex version of the spectral variety required by
Pilloni §13.1 and BCGP §6.1.1.

**Construction: Characteristic polynomials of endomorphisms of finite projective modules** (node `projective-characteristic-polynomial`; Buzzard §5, p. 34). Let A be a commutative ring, V a finite projective A-module of constant rank d and f ∈ End_A(V). The characteristic polynomial Q_f(X) := D(1 − X f) ∈ A[X] is the value of the degree-d determinant law of the finite projective A[X]-module A[X] ⊗_A V at 1 − X·(1 ⊗ f); it has constant term 1 and degree at most d, its leading coefficient is (−1)^d det f, it commutes with base change A → A′, it agrees with det(1 − X M) for the matrix M of f in any basis when V is free, and it satisfies Cayley–Hamilton in the reciprocal form X^d Q_f(1/X)|_{X = f} = 0 in End_A(V).

*Hypotheses.* V finite projective of constant rank d (Module.rankAtStalk constant).

*API.*
- `projCharpoly` (constructor): Q_f ∈ A[X] for f on a finite projective constant-rank V.
- `projCharpoly_constantCoeff` (simp): Q_f(0) = 1.
- `projCharpoly_natDegree_le` (structure): deg Q_f ≤ rank V.
- `projCharpoly_baseChange` (functoriality): Q_{f ⊗ A′} is the image of Q_f under A[X] → A′[X].
- `projCharpoly_eq_charpoly_reverse` (compatibility): For free V, X^d Q_f(1/X) = LinearMap.charpoly f.
- `projCharpoly_cayleyHamilton` (relation): The reversed polynomial annihilates f.

*Unit tests.*
- `projCharpoly_free_two` (computation): For V = A² and f = diag(a, b), Q_f = (1 − aX)(1 − bX).
- `projCharpoly_zero_rank` (degenerate): For V = 0, Q_f = 1.
- `projCharpoly_line` (computation): For V an invertible non-free ideal of a Dedekind domain A (such as (2, 1 + √−5) in ℤ[√−5]) and f = multiplication by a ∈ A, Q_f = 1 − aX.
- `projCharpoly_compat_charpoly` (compatibility): For V = A^d, X^d Q_f(1/X) equals Mathlib's LinearMap.charpoly f.

*Proof sketch.* The determinant law of a finite projective constant-rank module is IntegralHeckeAndGaloisDeterminants IHG.0 (top exterior power is invertible, endomorphisms of it are scalars, glued from local trivialisations). Base change of the law and its agreement with Matrix.det on a basis give the formula det(1 − X M) on free modules and the comparison with Mathlib's LinearMap.charpoly (charpoly f = X^d Q_f(1/X)). Cayley–Hamilton holds Zariski-locally on Spec A, where V is free (LinearMap.aeval_self_charpoly), hence globally since End_A(V) embeds in the product of its localisations; alternatively it is the Cayley–Hamilton identity for the determinant law.

*Prerequisites.* `IntegralHeckeAndGaloisDeterminants:IHG.0/finite-projective-determinant`, `IntegralHeckeAndGaloisDeterminants:IHG.0/cayley-hamilton-identity`, `mathlib:LinearMap.charpoly`, `mathlib:LinearMap.aeval_self_charpoly`, `mathlib:Module.Projective`, `mathlib:Module.Free`.

*Check.* This closes the earlier gap 'Characteristic polynomials over finite projective modules'; slope-polynomials uses Q_f.

**Construction: The coherent eigenmodule sheaf on an eigenvariety** (node `coherent-eigenmodule-sheaf`; planet "Coherent eigenmodule sheaf"; Buzzard §5, Construction 5.7 and Lemmas 5.9–5.10, pp. 40–42; Chenevier §6, Lemme 6.6 (author copy glnfam.pdf); Bellaïche §3.4.3, Lemma 3.17, pp. 32–33). In the setting of L2a/global-weight-gluing (reduced rigid weight space W, linked (Pr) Banach modules, compact controlling operator φ, commuting Hecke algebra 𝐓), the finite projective slope summands N(Y) of the spectral blocks Y, viewed as T(Y)-modules, glue to a coherent sheaf 𝓜 on the eigenvariety D with 𝓜(D(Y)) = N(Y). It is torsion-free over W when W is, its formation commutes with flat base change of the weight space, and for a point w of W and a point x of D over w with residue field L, the fibre 𝓜 ⊗ k(w) at x is the generalised eigenspace (M_w ⊗ L)^{≤h}[x] of the specialised Banach module. The map 𝐓 ⊗ k(w) → End(𝓜 ⊗ k(w)) has image the Hecke algebra of the fibre, and the surjection from the fibre of O_D at w onto it has nilpotent kernel; D is not asserted reduced, and the nilpotents of the fibre algebra are retained.

*Hypotheses.* The data of L2a/global-weight-gluing; slopes bounded on each chart.

*API.*
- `eigenmoduleSheaf` (constructor): The coherent sheaf 𝓜 on D with sections N(Y) over D(Y).
- `eigenmoduleSheaf_chart` (characterisation): 𝓜(D(Y)) = N(Y) as a T(Y)-module.
- `eigenmoduleSheaf_fibre` (characterisation): The fibre at x over w is the generalised eigenspace of x in the specialised slope part.
- `eigenmoduleSheaf_flatBaseChange` (functoriality): Compatible with flat base change of W.
- `fibreHeckeSurjective_nilpotentKernel` (relation): O_D ⊗ k(w) → Hecke algebra of the fibre is surjective with nilpotent kernel.

*Unit tests.*
- `eigenmoduleSheaf_empty` (degenerate): If φ is zero, D is empty and 𝓜 = 0.
- `eigenmoduleSheaf_rank_one` (computation): If M = A with φ = multiplication by a unit u and 𝐓 = A[φ], D is the graph X = u⁻¹ over Sp(A) and 𝓜 = O_D.
- `eigenmoduleSheaf_jordan_block` (non-example): For M = A² with φ the Jordan block (u 1; 0 u) and 𝐓 generated by φ, the fibre algebra is k(w)[t]/(t²): taking the reduced eigenvariety would lose the Jordan block, so the nilpotents are kept.
- `eigenmoduleSheaf_compat_buzzard` (compatibility): The support of 𝓜 is the eigenvariety D of L2a/global-weight-gluing.

*Proof sketch.* On a chart D(Y) = Sp T(Y), the module N(Y) is finite projective over A and a faithful T(Y)-module, hence a coherent sheaf on D(Y). Under refinement of blocks and restriction of affinoids, the Riesz projectors are compatible (L2a/hecke-chart-gluing), giving gluing data for the N(Y). Fibres: Riesz decompositions commute with specialisation (LocallyAnalyticDistributions L4 completed base change), so N(Y) ⊗ k(w) is the slope part of the fibre; localising at x gives the generalised eigenspace. Nilpotent kernel: T(Y) ⊗ k(w) and the Hecke algebra of the fibre act faithfully on modules with the same semisimplification, so the kernel consists of nilpotent elements (Chenevier's lemma).

*Prerequisites.* `PadicFamilies:L2a/hecke-chart-gluing`, `PadicFamilies:L2a/global-weight-gluing`, `PadicFamilies:L2a/finite-hecke-images`, `PadicFamilies:L2a/eigenpacket-points`, `LocallyAnalyticDistributions:L4/completed-base-change`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `AdicSpacesPartII:R3`.

*Check.* This answers the earlier gap 'Coherent eigenmodules and nonflat specialization' for the eigenmodule itself; Tor terms for cohomology in several degrees are the complex version, L2a/complex-spectral-variety.

**Construction: The spectral hypersurface of a compact endomorphism of a complex** (node `complex-spectral-hypersurface`; Pilloni (Duke 2020) §13.1.2, p. 84; BCGP §6.1.1, p. 139; Buzzard §§4–5, pp. 25–37). Let A be a reduced affinoid algebra over a complete non-archimedean field K ⊇ ℚ_p, M• a bounded complex of projective Banach A-modules (direct summands of orthonormalisable ones) and U ∈ End_{K^proj(A)}(M•) compact, i.e. represented by a chain endomorphism Ũ that is compact in every degree. The characteristic series P̃(X) = ∏_k det(1 − X Ũ | M^k) is an entire series over A (the product, not the alternating product, so that every eigenvalue in every degree is seen). Its zero locus Z̃ ⊆ Sp(A) × A¹ carries a complex of coherent sheaves 𝓜• (the universal generalised eigenspace complex of Ũ): Z̃ has an admissible cover by affinoids Y finite and flat over their image V ⊆ Sp(A), with Y a union of connected components of Z̃ ×_{Sp A} V, and on such Y the complex 𝓜•|_Y is the finite slope subcomplex of M•|_V cut out by the factor of P̃ attached to Y, a perfect complex of O(V)-modules.

*Hypotheses.* A reduced affinoid; M• bounded with projective Banach terms; Ũ compact in each degree.

*API.*
- `complexCharSeries` (constructor): P̃(X) = ∏_k det(1 − XŨ | Mᵏ) as an entire series over A.
- `complexSpectralHypersurface` (constructor): Z̃ = V(P̃) ⊆ Sp(A) × A¹.
- `universalEigencomplex` (constructor): The complex of coherent sheaves 𝓜• on Z̃.
- `universalEigencomplex_perfect_on_block` (characterisation): On a finite flat block Y over V, 𝓜•|_Y is a perfect complex of O(V)-modules equal to the finite slope subcomplex.
- `complexCharSeries_single` (compatibility): For a complex concentrated in one degree, P̃ is the Fredholm determinant of L2a/spectral-hypersurface.

*Unit tests.*
- `complexCharSeries_zero` (degenerate): For M• = 0, P̃ = 1 and Z̃ is empty.
- `complexCharSeries_single_degree` (compatibility): For M• = M[0], Z̃ is the spectral hypersurface of L2a/spectral-hypersurface.
- `complexCharSeries_cone` (computation): For the cone of the identity of M with Ũ = (U, U), P̃ = det(1 − XU)², although the complex is acyclic.
- `complexCharSeries_not_alternating` (non-example): The alternating product det(1 − XU|M⁰)·det(1 − XU|M¹)⁻¹ is 1 on the cone of the identity, so it cannot cut out a hypersurface carrying the eigenspace complex; the product is the right series.

*Proof sketch.* In each degree apply the Fredholm theory of compact operators on projective Banach modules (LocallyAnalyticDistributions L4); the characteristic series of the complex is the product of the degreewise ones. The admissible cover by finite flat spectral blocks is L2a/admissible-slope-cover applied to P̃; on a block the Riesz factorisation P̃ = Q·S gives Ũ-stable decompositions Mᵏ = N_Q(Mᵏ) ⊕ F_Q(Mᵏ) compatible with the differentials, and the finite slope subcomplex N_Q(M•) is a bounded complex of finite projective O(V)-modules (LocallyAnalyticDistributions L4, the finite-slope subcomplex and its perfect model). 𝓜•|_Y is N_Q(M•) viewed over O(Y) = O(V)[X]/(Q) with X acting as Ũ⁻¹; the identifications glue by the compatibility of Riesz projectors under refinement.

*Prerequisites.* `PadicFamilies:L2a/spectral-hypersurface`, `PadicFamilies:L2a/admissible-slope-cover`, `PadicFamilies:L2a/projective-characteristic-polynomial`, `LocallyAnalyticDistributions:L4/banach-cochain-complex`, `LocallyAnalyticDistributions:L4/compact-complex-representative`, `LocallyAnalyticDistributions:L4/representative-fredholm-product`, `LocallyAnalyticDistributions:L4/slope-subcomplex`, `LocallyAnalyticDistributions:L4/finite-slope-perfect-complex`.

*Check.* For a complex concentrated in one degree the construction is L2a/spectral-hypersurface.

**Construction: The spectral variety of a compact endomorphism in the homotopy category** (node `complex-spectral-variety`; planet "Spectral variety of a compact complex"; Pilloni (Duke 2020) §13.1.2, p. 84, and §13.1.3 with Proposition 13.1.3.1, pp. 84–85; BCGP §6.1.1, p. 139; Theorem 6.3.16 with proof, pp. 152–153). With M•, U and a compact representative Ũ as in L2a/complex-spectral-hypersurface, the cohomology sheaves 𝓗ⁱ(𝓜•) are coherent on Z̃. Let 𝓘 ⊆ O_{Z̃} be the annihilator of the graded module ⊕_i 𝓗ⁱ(𝓜•). The spectral variety of (M•, U) is the closed subspace Z = V(𝓘) ⊆ Z̃, with the graded coherent sheaf 𝓗•(𝓜•) supported on it. Z and 𝓗•(𝓜•) on Z depend only on U ∈ End_{K^proj(A)}(M•), not on the representative Ũ; the cohomology sheaves have slope decompositions, and at a rank-one point x of Sp(A) the fibre cohomology Hⁱ(M•_x) has slope decompositions for U.

*Hypotheses.* As in L2a/complex-spectral-hypersurface.

*API.*
- `complexSpectralVariety` (constructor): Z = V(Ann ⊕ᵢ 𝓗ⁱ(𝓜•)) ⊆ Z̃.
- `complexSpectralVariety_indep` (extensionality): Z and 𝓗• are independent of the compact representative of U.
- `complexSpectralVariety_support` (characterisation): A point of Z̃ lies in Z iff some 𝓗ⁱ(𝓜•) has nonzero stalk there.
- `complexSpectralVariety_eulerChar` (compatibility): The slope-h Euler characteristic of the fibres is locally constant on rank-one points (LocallyAnalyticDistributions L4).

*Unit tests.*
- `complexSpectralVariety_acyclic` (degenerate): For the cone of the identity of M (acyclic), Z is empty although Z̃ is not.
- `complexSpectralVariety_single_degree` (compatibility): For M• = M[0], Z = Z̃ is the spectral hypersurface of M.
- `complexSpectralVariety_two_term` (computation): For M• = (A --0--> A) in degrees 0, 1 with Ũ = (a, b), a, b ∈ A^×, Z is the union of the graphs X = a⁻¹ and X = b⁻¹ over Sp(A).
- `complexSpectralVariety_not_tilde` (non-example): Z̃ depends on Ũ (adding a contractible summand changes it) while Z does not, so Z̃ is not an invariant of the homotopy class.

*Proof sketch.* Coherence: on a block, 𝓗ⁱ(𝓜•) is the cohomology of a bounded complex of finite O(Y)-modules. Independence of Ũ: two compact representatives are homotopic through a compact homotopy; on any finite slope window the finite slope subcomplexes are homotopy equivalent (LocallyAnalyticDistributions L4, homotopy invariance on a slope window), so their cohomology sheaves are isomorphic over the common blocks and the annihilators agree. The extra components of Z̃ coming from a contractible summand (as in the cone test) carry zero cohomology and are removed in Z.

*Prerequisites.* `PadicFamilies:L2a/complex-spectral-hypersurface`, `LocallyAnalyticDistributions:L4/finite-slope-homotopy-invariance`, `LocallyAnalyticDistributions:L4/compact-homotopy-endomorphism`, `LocallyAnalyticDistributions:L4/slope-uniqueness`, `LocallyAnalyticDistributions:L4/derived-slope-base-change`, `mathlib:Module.annihilator`.

*Check.* Local constancy of x ↦ Σ_i (−1)ⁱ dim Hⁱ(M•_x)_{=h} on rank-one points is LocallyAnalyticDistributions L4/finite-slope-euler-local-constancy, cited, not replanned; the neighbourhoods need not cover Sp(A) (Pilloni's footnote 20).

### L2, Milestone 5c: the eigencurve from overconvergent modular symbols

Library module: `TauCeti/NumberTheory/PadicFamilies/Eigencurve`. The source is Bellaïche, *Critical p-adic
L-functions* (arXiv:0912.2925v1; Invent. Math. 189 (2012)), §3, which follows Stevens. RS-08 keeps here the arithmetic
finite-slope instance of L2a: the compact U_p on distribution-valued modular symbols, the eigencurve with its weight
map and coherent eigensymbol sheaf, small-slope classicality through ModularSymbolsPadicLFunctions L2, and the local
freeness needed for scalar families. Nilpotents of the fibre algebras are kept.

**Construction: Families of locally analytic distributions over an affinoid of weight space** (node `distribution-families`; Bellaïche §3.1, §§3.1.1–3.1.4 with Lemmas 3.1–3.2, pp. 22–24). Let W = Sp R be an affinoid subdomain of the weight space 𝒲 of continuous characters of ℤ_p^×, with universal character κ_W : ℤ_p^× → R^×. For r ∈ p^ℤ, r ≤ 1, let A[r] be the affinoid algebra of the closed neighbourhood {z ∈ ℂ_p : |z − a| ≤ r for some a ∈ ℤ_p} of ℤ_p, with sup norm, and D[r] its continuous dual. The completed tensor products R ⊗̂ A[r] and R ⊗̂ D[r] are orthonormalisable Banach R-modules with R ⊗̂ D[r] = Hom_R(R ⊗̂ A[r], R); for r₁ > r₂ the restriction R ⊗̂ A[r₁] → R ⊗̂ A[r₂] and the dual map R ⊗̂ D[r₂] → R ⊗̂ D[r₁] are compact. The monoid Σ₀(p) of integral matrices (a b; c d) with p ∤ a, p | c and ad − bc ≠ 0 acts on R ⊗̂ A[r] by (γ·f)(z) = κ_W(a + cz) f((b + dz)/(a + cz)) and dually on R ⊗̂ D[r]; for every w ∈ W(ℚ_p) the specialisation along w : R → ℚ_p identifies these with A_w[r] and D_w[r] carrying the weight-w action.

*Hypotheses.* W = Sp R ⊆ 𝒲 an affinoid inside one component, so that κ_W(a + cz) is an analytic function of z on the residue discs (after shrinking, R = ℚ_p⟨T⟩ and κ_W(x) = ω(x)^i ⟨x⟩^T).

*API.*
- `distFamily` (constructor): R ⊗̂ D[r] with its Σ₀(p)-action through κ_W.
- `distFamily_orthonormalizable` (instance): R ⊗̂ D[r] is an orthonormalisable Banach R-module.
- `distFamily_restrict_compact` (structure): The radius-change maps are compact.
- `distFamily_specialise` (compatibility): (R ⊗̂ D[r]) ⊗_{R,w} ℚ_p ≅ D_w[r], Σ₀(p)-equivariantly.
- `distFamily_dual` (characterisation): R ⊗̂ D[r] = Hom_R(R ⊗̂ A[r], R).

*Unit tests.*
- `distFamily_specialise_integer` (compatibility): At w = k ∈ ℤ_{≥0}, the specialisation is the weight-k distribution module of ModularSymbolsPadicLFunctions L2.
- `distFamily_identity_action` (degenerate): The identity matrix acts trivially for every W.
- `distFamily_diagonal` (computation): For γ = (a 0; 0 1) with a ∈ ℤ_p^×, (γ·f)(z) = κ_W(a)f(z/a), so the scalar κ_W(a) appears at specialisation w as ω^i(a)⟨a⟩^w.
- `distFamily_not_constant_weight` (non-example): A constant character κ_W = 1 would give the weight-zero action at every point, failing the specialisation test at w = k ≠ 0.

*Proof sketch.* Orthonormalisability: norms of elements of A[r] lie in |ℚ_p^×| when r ∈ p^ℤ, so A[r] and D[r] are orthonormalisable (Serre), and completed tensor products with R stay so. Compactness of the restriction maps between radii is the classical compactness of restriction of affinoid functions to a strictly smaller disc. κ_W(a + cz) ∈ R ⊗̂ A[1] because log((a + cz)/ω(a)) ∈ pA[1]; this defines the action and its specialisation is the weight-w action of ModularSymbolsPadicLFunctions L2.

*Prerequisites.* `PadicMeasuresIwasawaAlgebras:L0a`, `ModularSymbolsPadicLFunctions:L2/weight-k-distributions`, `LocallyAnalyticDistributions:L4/orthonormalizable-modules`, `LocallyAnalyticDistributions:L4/completely-continuous`, `LocallyAnalyticDistributions:L4/completed-base-change`.

*Check.* At integral weights the specialised action is the weight-k action of ModularSymbolsPadicLFunctions L2, so the classical distribution modules are recovered.

**Construction: Families of distribution-valued modular symbols with compact U_p** (node `family-modular-symbols`; planet "Families of overconvergent modular symbols"; Bellaïche §3.2.1, (10), p. 25; §3.2.2, Proposition 3.3 with proof, p. 26). Let N ≥ 1 be prime to p and Γ = Γ₁(N) ∩ Γ₀(p). For W = Sp R and r as in L2/distribution-families, Symb_Γ(R ⊗̂ D[r]) = Hom_Γ(Δ₀, R ⊗̂ D[r]) (Δ₀ the degree-zero divisors on P¹(ℚ)) is a Banach R-module with Buzzard's property (Pr) (through a finite presentation of Δ₀ as a ℤ[Γ]-module by Manin relations, which exhibits it as a closed submodule of a finite direct sum of copies of R ⊗̂ D[r] cut out by finitely many continuous relations). The Hecke operators T_ℓ (ℓ ∤ Np), the diamond operators and U_p act continuously, the involution ι = diag(−1, 1) splits it into ± parts, U_p is compact, and for w ∈ W(ℚ_p) there is a Hecke- and ι-equivariant specialisation map Symb^±_Γ(R ⊗̂ D[r]) ⊗_{R,w} ℚ_p → Symb^±_Γ(D_w[r]), which Bellaïche asserts is an isomorphism (Proposition 3.3(iii)); its kernel and cokernel are the Tor terms of the universal-coefficients comparison for H¹_c (E14), and the planned statement keeps them.

*Hypotheses.* N prime to p; W an affinoid in one component of weight space; r ∈ p^ℤ with 0 < r ≤ 1.

*API.*
- `familySymb` (constructor): Symb^±_Γ(R ⊗̂ D[r]) as a Banach R-module with Hecke action.
- `familySymb_pr` (instance): It has property (Pr).
- `familySymb_Up_compact` (structure): U_p is compact.
- `familySymb_specialise` (compatibility): Hecke-equivariant specialisation map to Symb^±_Γ(D_w[r]), with its Tor-term kernel and cokernel (an isomorphism in Bellaïche's statement).
- `familySymb_iota` (structure): The involution ι commutes with the Hecke operators and splits the module into ± parts.

*Unit tests.*
- `familySymb_specialise_k` (compatibility): At w = k the specialisation map lands in ModularSymbolsPadicLFunctions L2's Symb_Γ(D_k) and is Hecke-equivariant.
- `familySymb_iota_square` (characterisation): ι² = 1, so on R ⊗̂ D[r] (where 2 is invertible) the projectors (1 ± ι)/2 are complementary idempotents commuting with the Hecke operators.
- `familySymb_split` (characterisation): Symb_Γ = Symb⁺_Γ ⊕ Symb⁻_Γ because 2 is invertible on R ⊗̂ D[r].
- `familySymb_not_dense_classical` (non-example): Specialisation at a non-integral weight w gives Symb_Γ(D_w) with no polynomial quotient, so the family is not generated by classical symbols.

*Proof sketch.* The Manin-relations presentation of Δ₀ (ModularSymbolsPadicLFunctions L0, the coset description) identifies Symb_Γ(A) with the kernel of an A-linear map A^a → A^b given by an integral matrix in ℤ[Σ₀(p)]; for A = R ⊗̂ D[r] this is a closed submodule, and (Pr) follows as in Pollack–Stevens's treatment of overconvergent symbols. Bellaïche's own route through (10) is defective (E14). Compactness of U_p: it factors through the symbols with values in R ⊗̂ D[r/p] followed by the compact radius change. Base change: the presentation commutes with flat base change (ModularSymbolsPadicLFunctions L0/symbols-base-change); along the non-flat specialisation w the comparison map is the degree-one edge map of the universal-coefficients spectral sequence for compactly supported cohomology, whose correction terms are Tor terms; this is the specialisation statement with its Tor terms that the stage requires.

*Prerequisites.* `PadicFamilies:L2/distribution-families`, `ModularSymbolsPadicLFunctions:L0/modular-symbols`, `ModularSymbolsPadicLFunctions:L0/symbols-coset-description`, `ModularSymbolsPadicLFunctions:L0/hecke-operators-gamma1`, `ModularSymbolsPadicLFunctions:L0/plus-minus-decomposition`, `ModularSymbolsPadicLFunctions:L0/symbols-base-change`, `LocallyAnalyticDistributions:L4/projective-banach-modules`, `LocallyAnalyticDistributions:L4/compact-matrix-criterion`.

*Check.* U_p is compact on the family module, and the specialisation map is stated with its Tor terms; that it is an isomorphism (Bellaïche Proposition 3.3(iii)) is the source's claim, whose proof through (10) is recorded as E14.

**Construction: Finite slope pieces of family modular symbols** (node `family-slope-pieces`; Bellaïche §3.2.2, after Proposition 3.3, and Corollary 3.4, p. 26; Buzzard §2, Lemma 2.11 and Theorem 3.3, pp. 11–20). For ν > 0 and W = Sp R small enough that the Fredholm series of U_p on Symb^±_Γ(R ⊗̂ D) has a slope-ν factorisation, the Riesz decomposition gives a U_p- and Hecke-stable direct summand Symb^±_Γ(R ⊗̂ D)^{≤ν}, finite projective over R, on which U_p is invertible with generalised eigenvalues of valuation ≤ ν. Its formation commutes with specialisation: for w ∈ W(ℚ_p), Symb^±_Γ(R ⊗̂ D)^{≤ν} ⊗_{R,w} ℚ_p ≅ Symb^±_Γ(D_w)^{≤ν} Hecke-equivariantly. It is independent of r ≤ 1, because U_p-finite slope parts do not see the radius change.

*Hypotheses.* (W, ν) adapted: the slope-ν factorisation exists over R (always after shrinking W).

*API.*
- `familySymbSlope` (constructor): Symb^±_Γ(R ⊗̂ D)^{≤ν} for an adapted pair (W, ν).
- `familySymbSlope_projective` (instance): It is finite projective over R.
- `familySymbSlope_specialise` (compatibility): Its specialisation at w is Symb^±_Γ(D_w)^{≤ν}.
- `familySymbSlope_restrict` (functoriality): Compatible with shrinking W and with increasing ν.

*Unit tests.*
- `familySymbSlope_zero_slope` (computation): For ν < 0 the piece is zero, since U_p is integral and has no eigenvalue of negative valuation.
- `familySymbSlope_rank_constant` (characterisation): The rank of the finite projective piece is the dimension of Symb^±_Γ(D_w)^{≤ν} at every w ∈ W(ℚ_p).
- `familySymbSlope_compat_fibre` (compatibility): At w = k it is ModularSymbolsPadicLFunctions L2's slope decomposition of the fibre.
- `familySymbSlope_not_free_global` (non-example): The piece is projective but is not claimed free over R; over a non-principal affinoid algebra freeness can fail, and only the rank is constant.

*Proof sketch.* Riesz theory for compact operators on (Pr) modules (Coleman, Serre, Buzzard), from LocallyAnalyticDistributions L4. Specialisation: Riesz decompositions commute with base change along w (LocallyAnalyticDistributions L4 completed base change and uniqueness of slope decompositions). Independence of r: the radius-change maps are compact injections commuting with U_p and induce isomorphisms on finite slope parts.

*Prerequisites.* `PadicFamilies:L2/family-modular-symbols`, `LocallyAnalyticDistributions:L4/finite-slope-summands`, `LocallyAnalyticDistributions:L4/riesz-commuting-stability`, `LocallyAnalyticDistributions:L4/slope-uniqueness`, `LocallyAnalyticDistributions:L4/completed-base-change`, `PadicFamilies:L2a/admissible-slope-cover`.

*Check.* The rank of the slope-≤ν piece equals the dimension of every fibre, as the specialisation isomorphism requires.

**Construction: Local pieces of the modular-symbol eigencurve** (node `local-eigencurve-piece`; Bellaïche §3.4.1, Definition 3.15, pp. 31–32; §3.4.2, Definition 3.16, p. 32). For an adapted pair (W, ν), let 𝕋^±_{W,ν} be the R-subalgebra of End_R(Symb^±_Γ(R ⊗̂ D)^{≤ν}) generated by the Hecke operators T_ℓ (ℓ ∤ Np), U_p and the diamond operators. It is finite and torsion-free, hence flat, over the one-dimensional affinoid algebra R (a principal ideal domain after shrinking W), and C^±_{W,ν} := Sp 𝕋^±_{W,ν} is an affinoid with a finite flat weight map κ^± : C^±_{W,ν} → W. Each Hecke operator is a bounded function on C^±_{W,ν}, and U_p is invertible with valuation ≤ ν. The point-wise version 𝕋^±_{w,ν} ⊆ End_{ℚ_p}(Symb^±_Γ(D_w)^{≤ν}) has ℚ̄_p-points the Hecke eigensystems occurring in Symb^±_Γ(D_w)^{≤ν}.

*Hypotheses.* (W, ν) adapted; W one-dimensional and connected.

*API.*
- `localEigencurveAlgebra` (constructor): 𝕋^±_{W,ν} ⊆ End_R(Symb^±_Γ(R ⊗̂ D)^{≤ν}).
- `localEigencurveAlgebra_finite` (instance): 𝕋^±_{W,ν} is finite over R.
- `localEigencurveAlgebra_flat` (instance): 𝕋^±_{W,ν} is flat over R.
- `punctualEigencurveAlgebra` (constructor): 𝕋^±_{w,ν} ⊆ End(Symb^±_Γ(D_w)^{≤ν}).
- `punctualEigencurveAlgebra_points` (characterisation): ℚ̄_p-points of Spec 𝕋^±_{w,ν} are the Hecke eigensystems in Symb^±_Γ(D_w)^{≤ν}.

*Unit tests.*
- `localEigencurveAlgebra_empty` (degenerate): If Symb^±_Γ(R ⊗̂ D)^{≤ν} = 0 the algebra is the zero ring and C^±_{W,ν} is empty.
- `localEigencurveAlgebra_rank_one` (computation): If the slope piece is free of rank one, 𝕋^±_{W,ν} = R and κ^± is an isomorphism.
- `punctual_compat_classical` (compatibility): At w = k and ν < k + 1, the punctual eigensystems are those of Symb^±_Γ(V_k)^{<k+1} (Stevens' control theorem).
- `localEigencurveAlgebra_not_reduced` (non-example): 𝕋^±_{w,ν} can be non-reduced (a Jordan block for U_p at a critical point), so it is not the algebra of functions on a finite set of eigensystems.

*Proof sketch.* Finiteness: a subalgebra of the endomorphisms of a finite projective module over a noetherian ring. Torsion-freeness: it acts faithfully on a torsion-free module; flatness over the Dedekind ring R follows. This is L2a/finite-hecke-images in the modular instance, with the controlling operator φ = U_p.

*Prerequisites.* `PadicFamilies:L2/family-slope-pieces`, `PadicFamilies:L2a/finite-hecke-images`, `PadicFamilies:L2a/slope-polynomials`.

*Check.* κ^± is finite and flat, and the ℚ̄_p-points over w are the eigensystems of the fibre (with L2/specialisation-nilpotent-kernel).

**Theorem: Specialisation of Hecke algebras has nilpotent kernel** (node `specialisation-nilpotent-kernel`; Bellaïche §3.4.3, Lemma 3.17 and (19), pp. 32–33; Chenevier §6, Lemme 6.6). For every w ∈ W(ℚ_p), the specialisation map s_w : 𝕋^±_{W,ν} ⊗_{R,w} ℚ_p → 𝕋^±_{w,ν}, compatible with the Hecke operators, is surjective with nilpotent kernel. Hence the ℚ̄_p-points of the fibre (κ^±)⁻¹(w) are in bijection with the Hecke eigensystems in Symb^±_Γ(D_w)^{≤ν}, and localising at such a point x gives a surjective local map s_x : (𝕋^±_{W,ν})_{(x)} ⊗_{R(w)} ℚ̄_p → (𝕋^±_{w,ν})_{(x)} of finite local ℚ̄_p-algebras with nilpotent kernel. The fibre algebra and the Hecke algebra of the fibre are not identified.

*Hypotheses.* (W, ν) adapted; w ∈ W(ℚ_p).

*Proof sketch.* Surjectivity: the image is a subalgebra of 𝕋^±_{w,ν} containing the image of the Hecke operators. Nilpotent kernel: both algebras act faithfully, through the specialisation isomorphism of L2/family-slope-pieces, on modules with the same semisimplification; an element acting by zero on Symb(D_w)^{≤ν} is nilpotent on the fibre of the family module (Chenevier, Lemme 6.6), which is the content of L2a/coherent-eigenmodule-sheaf.

*Prerequisites.* `PadicFamilies:L2/local-eigencurve-piece`, `PadicFamilies:L2/family-slope-pieces`, `PadicFamilies:L2a/coherent-eigenmodule-sheaf`.

*Check.* At a point where κ^± is étale and the generalised eigenspace is one-dimensional, s_x is an isomorphism ℚ̄_p → ℚ̄_p.

**Construction: The eigencurves C^± from overconvergent modular symbols** (node `modular-symbol-eigencurve`; planet "The eigencurve C^±"; Bellaïche §3 introduction and §3.4, pp. 22 and 31–33; Buzzard Part II, §5, Construction 5.7 and Lemmas 5.8–5.10, pp. 40–42). Gluing the local pieces C^±_{W,ν} over an admissible cover of weight space by adapted pairs (L2a's eigenvariety machine with the Banach modules Symb^±_Γ(R ⊗̂ D) over the affinoids of 𝒲, the compact operator U_p and the Hecke algebra generated by T_ℓ (ℓ ∤ Np), U_p and the diamond operators) gives rigid spaces C^± of tame level Γ₁(N) with a weight map κ^± : C^± → 𝒲 and analytic functions T_ℓ, U_p on C^± (U_p invertible). C^± is equidimensional of dimension one, κ^± is locally finite and flat, and for every complete extension L/ℚ_p the L-points of C^± over w ∈ 𝒲(L) are the systems of Hecke eigenvalues of finite slope in Symb^±_Γ(D_w) ⊗ L.

*Hypotheses.* N prime to p; weight space 𝒲 of continuous characters of ℤ_p^× (PadicMeasuresIwasawaAlgebras L0a).

*API.*
- `symbolEigencurve` (constructor): The rigid space C^± with κ^± : C^± → 𝒲.
- `symbolEigencurve_weight_flat` (structure): κ^± is locally finite and flat.
- `symbolEigencurve_equidim` (structure): C^± is equidimensional of dimension one.
- `symbolEigencurve_hecke` (data): T_ℓ, U_p and the diamond operators as analytic functions on C^±, with U_p a unit.
- `symbolEigencurve_points` (characterisation): Points over w ↔ finite slope Hecke eigensystems in Symb^±_Γ(D_w).
- `symbolEigencurve_local` (compatibility): Over an adapted (W, ν), the subspace {v_p(U_p) ≤ ν} ∩ (κ^±)⁻¹(W) is C^±_{W,ν}.

*Unit tests.*
- `symbolEigencurve_classical_point` (computation): A p-stabilised newform f_β of weight k + 2 and level Γ₁(N) with v_p(β) < k + 1 defines a point of C^± over k (with the sign condition for Eisenstein series).
- `symbolEigencurve_slope_bounded` (characterisation): On the local piece over (W, ν), the function U_p has valuation at most ν.
- `symbolEigencurve_compat_local` (compatibility): Restricted to an adapted (W, ν), C^± is C^±_{W,ν}.
- `symbolEigencurve_not_finite` (non-example): κ^± is not finite over 𝒲: the number of points over a weight with slope ≤ ν grows with ν, so only local finiteness holds.

*Proof sketch.* Construct the local pieces (L2/local-eigencurve-piece) and glue them along restriction and refinement (L2a/hecke-chart-gluing and L2a/global-weight-gluing), the linked Banach modules being the family symbols for nested affinoids. Points: L2a/eigenpacket-points combined with L2/specialisation-nilpotent-kernel. Equidimensionality and flatness: each local piece is finite flat over a one-dimensional affinoid, so every component has dimension one.

*Prerequisites.* `PadicFamilies:L2/local-eigencurve-piece`, `PadicFamilies:L2/specialisation-nilpotent-kernel`, `PadicFamilies:L2a/hecke-chart-gluing`, `PadicFamilies:L2a/global-weight-gluing`, `PadicFamilies:L2a/eigenpacket-points`, `PadicFamilies:L2a/equidimensional-components`, `PadicMeasuresIwasawaAlgebras:L0a`.

*Check.* Every refined newform of slope < k + 1 gives a point (L2/small-slope-classicality), and the eigencurve is equidimensional of dimension one.

**Construction: The coherent eigensymbol sheaf on C^±** (node `eigensymbol-sheaf`; planet "Coherent eigensymbol sheaf"; Bellaïche §3.4.2, p. 32, and §4.1, pp. 33–34). The modules Symb^±_Γ(R ⊗̂ D)^{≤ν}, as 𝕋^±_{W,ν}-modules, glue to a coherent sheaf 𝓢^± on C^± (the instance of L2a/coherent-eigenmodule-sheaf). It is torsion-free over 𝒲, its sections over C^±_{W,ν} are the slope-≤ν family symbols, and its fibre at a point x over w is the generalised eigenspace Symb^±_Γ(D_w)(x). The evaluation and specialisation maps of family symbols are maps of coherent sheaves; 𝓢^± is not asserted to be locally free at every point, and an eigenpacket is not identified with a unique eigenvector.

*Hypotheses.* As in L2/modular-symbol-eigencurve.

*API.*
- `eigensymbolSheaf` (constructor): 𝓢^± on C^±.
- `eigensymbolSheaf_sections` (characterisation): 𝓢^±(C^±_{W,ν}) = Symb^±_Γ(R ⊗̂ D)^{≤ν}.
- `eigensymbolSheaf_fibre` (characterisation): Fibre at x is the generalised eigenspace Symb^±_Γ(D_w)(x).
- `eigensymbolSheaf_specialisation` (functoriality): Compatible with ρ_k : Symb(D_k) → Symb(V_k) at integral weights.

*Unit tests.*
- `eigensymbolSheaf_classical_fibre` (computation): At a non-critical, κ-étale classical point x = f_β, the fibre is one-dimensional over ℚ̄_p.
- `eigensymbolSheaf_critical_fibre` (computation): At a decent critical point of ramification index e, the fibre has dimension e (Bellaïche Theorem 4.7), so the sheaf is not of constant fibre rank one.
- `eigensymbolSheaf_compat` (compatibility): Its support is C^±.
- `eigensymbolSheaf_zero` (degenerate): Over the empty local piece the sections are zero.

*Proof sketch.* Apply L2a/coherent-eigenmodule-sheaf to the modular data; the fibre statement is L2/family-slope-pieces localised at x together with L2/specialisation-nilpotent-kernel.

*Prerequisites.* `PadicFamilies:L2/modular-symbol-eigencurve`, `PadicFamilies:L2a/coherent-eigenmodule-sheaf`, `PadicFamilies:L2/family-slope-pieces`, `PadicFamilies:L2/specialisation-nilpotent-kernel`.

*Check.* The fibre dimension is one at étale non-critical classical points and e at decent critical points, so the sheaf is coherent but not locally free of rank one everywhere.

**Theorem: Classicality of small-slope points of the eigencurve** (node `small-slope-classicality`; Bellaïche §3.2.3, Theorem 3.5, Proposition 3.6 and Corollary 3.7, pp. 26–28). Let x be a point of C^± over an integral weight k ≥ 0 with v_p(U_p(x)) < k + 1. Then the specialisation ρ*_k : Symb^±_Γ(D_k) → Symb^±_Γ(V_k) restricts to an isomorphism of generalised eigenspaces at x, Symb^±_Γ(D_k)(x) ≅ Symb^±_Γ(V_k)(x), and x is the eigensystem of a classical p-stabilised form of weight k + 2 and level Γ (cuspidal, or an Eisenstein series of the sign of the ± part). Classical points of slope < k + 1 are Zariski dense in every component of C^±, and accumulate at every classical point of small slope.

*Hypotheses.* x over k ∈ ℤ_{≥0}; slope strictly less than k + 1.

*Proof sketch.* Stevens' control theorem (ModularSymbolsPadicLFunctions L2) gives the isomorphism on slope-<k+1 parts; restrict to the x-generalised eigenspace (L2/eigensymbol-sheaf). Eichler–Shimura (ModularSymbolsPadicLFunctions L0) identifies Symb^±_Γ(V_k) with weight-(k + 2) forms of level Γ, so x is classical. Density: on a local piece over W, the integral weights k with k + 1 > ν are dense in W, and every component of C^±_{W,ν} is finite flat over W, so its points over those weights are classical and Zariski dense.

*Prerequisites.* `PadicFamilies:L2/eigensymbol-sheaf`, `PadicFamilies:L2/modular-symbol-eigencurve`, `ModularSymbolsPadicLFunctions:L2/control-theorem`, `ModularSymbolsPadicLFunctions:L2/specialisation-map`, `ModularSymbolsPadicLFunctions:L0/eichler-shimura-isomorphism`.

*Check.* The slope bound is strict: at slope exactly k + 1 (critical slope) ρ*_k need not be injective on the eigenspace; that case is PadicFamilies L3.

**Theorem: Freeness of family symbols at étale non-critical points** (node `etale-point-free-rank-one`; Bellaïche §4.1, pp. 33–34). Let x ∈ C^± lie over an integral weight k with slope < k + 1, corresponding to a refined newform f_β whose generalised eigenspace Symb^±_Γ(V_k)(f_β) is one-dimensional, and assume κ^± is étale at x. Then the localisation of 𝓢^± at x is free of rank one over the local ring O_{C^±,x}, and O_{C^±,x} ≅ O_{𝒲,k}; consequently, after shrinking, there is a neighbourhood V of x and a family symbol Φ ∈ 𝓢^±(V) whose specialisation at every classical point y ∈ V is a generator of the eigenline of y. This is the local freeness hypothesis required to form scalar-valued families of p-adic L-functions.

*Hypotheses.* x classical of slope < k + 1; newform eigenspace of dimension one; κ^± étale at x.

*Proof sketch.* The fibre of 𝓢^± at x is Symb^±_Γ(D_k)(x) ≅ Symb^±_Γ(V_k)(x) (L2/small-slope-classicality), of dimension one. 𝓢^± is torsion-free over the discrete valuation ring O_{𝒲,k}, and O_{C^±,x} = O_{𝒲,k} by étaleness, so 𝓢^±_x is free and its rank is the fibre dimension, by Nakayama's lemma. A generator over a neighbourhood specialises to a nonzero element of each one-dimensional classical eigenline nearby (the eigenspaces are one-dimensional at nearby classical newform points).

*Prerequisites.* `PadicFamilies:L2/eigensymbol-sheaf`, `PadicFamilies:L2/small-slope-classicality`, `ModularSymbolsPadicLFunctions:L0/eigenspace-dimension`.

*Check.* The hypotheses are visible: at a critical point with e > 1 the fibre has dimension e and the statement fails, which is L3/family-symbols-free-rank-one's setting.

**Comparison: Comparison with the Coleman–Mazur–Buzzard eigencurve** (node `coleman-mazur-comparison`; Bellaïche §2.1, pp. 13–17; §3.4.4, Proposition 3.18 with proof, p. 33; Coleman–Mazur §§7.1–7.5 (eigencurve construction), Internet Archive preprint). Let C be the Coleman–Mazur–Buzzard eigencurve of tame level Γ₁(N) built from Coleman's Banach modules of overconvergent modular forms, and C⁰ ⊆ C its cuspidal closed subspace. There are canonical closed immersions C⁰_{W,ν} ↪ C^±_{W,ν} ↪ C_{W,ν} compatible with the weight maps and Hecke functions, and for integral k the semisimplified slope-≤ν Hecke modules satisfy S†_{k+2}(Γ)^{ss} ⊆ Symb^±_Γ(D_k)^{ss} ⊆ M†_{k+2}(Γ)^{ss}; in particular the generalised eigenspaces of a cuspidal refined form have the same dimension in S† and in Symb^±.

*Hypotheses.* N prime to p; the overconvergent-forms eigencurve C as constructed by Coleman–Mazur (N = 1, p > 2) and Buzzard (general N).

*Proof sketch.* Chenevier's comparison theorem for eigenvarieties: two reduced equidimensional eigenvarieties over 𝒲 whose classical structures (Zariski-dense sets of classical points with the same Hecke eigensystems) correspond are related by closed immersions. The classical structures match by Coleman's control theorem on overconvergent forms and Stevens' control theorem with Eichler–Shimura on symbols (L2/small-slope-classicality).

*Prerequisites.* `PadicFamilies:L2/modular-symbol-eigencurve`, `PadicFamilies:L2/small-slope-classicality`, `PadicFamilies:L2a/equidimensional-components`.

*Check.* The overconvergent-forms side (Coleman's Banach modules and his control theorem) and Chenevier's comparison theorem are recorded gaps: no roadmap plans Coleman's overconvergent elliptic modular forms; the modular-symbol eigencurve C^± is self-contained without them.

### L1, Milestone 8: family modular symbols, congruence modules and two-variable L-functions

Library module: `TauCeti/NumberTheory/PadicFamilies/FamilySymbols`. The source is Emerton–Pollack–Weston
(arXiv:math/0404484v1; Invent. Math. 163 (2006)), §4.1. RS-08 keeps here the ordinary family symbol module, family
periods as line bundles, and the cyclotomic measure with its integral specialisation.

**Construction: M_m** (node `ordinary-family-symbol-module`; planet). For a non-Eisenstein m,
M_m = lim_r H₁(X₁(Np^r); ℤ_p)^ord_m. This equals the relative-homology limit, because the cusp term dies at m. The sign
decomposition gives M⁺ ⊕ M⁻.
- *API:* `familySymbols`, `familySymbols_relative`, `familySymbols.heckeModule`, `familySymbols.sign`.
- *Tests:*
  - at an Eisenstein m the two limits differ;
  - the ± split needs p odd;
  - the weight-two slice.

**Theorem: control** (node `family-symbol-control`). Hida's (4.2) and M_m/ω_{r,k} ≅ (M_{r,k})_{m_{r,k}}. The source
proofs are Hida 1986 and 1988 (not obtained), so they are recorded as a gap.

**Theorem: freeness** (node `family-symbol-free-rank-one`; planet). This is EPW Proposition 4.1.1: for irreducible,
p-distinguished ρ̄_m, M^±_m is free of rank one over (T_N)_m. The proof combines Wiles' mod-p multiplicity one
(requested from ModularCurvesPartII R14.6) with Nakayama.

**Construction: family periods** (node `family-period-line`). θ^± : T_m ≅ M^±_m is unique up to T_m^×. Mod ℘ it
generates the saturated classical period lattice (ModularSymbolsPadicLFunctions L1), so the ambiguity is a unit, not a
field scalar.
- *API:* `familyPeriod`, `familyPeriod_unique_up_to_unit`, `familyPeriod_specialise`.
- *Tests:*
  - a change of period by u;
  - μ-invariants are well defined;
  - there are two periods, one per sign.

**Construction: the two-variable measure** (node `family-measure`; planet). The measure is
µ(a + p^rℤ_p) = U_p^{−r}{∞, a/p^r} ∈ M_m, additive through U_p = Σ_b (1 b; 0 p). This gives L^±(m, N) and
L(m, N, ω^i) with sign (−1)^i.
- *API:* `universalOrdinarySymbol`, `familyMeasure`, `familyMeasure_additive`, `twoVariablePadicL`,
  `twoVariablePadicL_branch`.
- *Tests:*
  - the distribution identity (index check in Lean);
  - the total mass;
  - the wrong-sign projection vanishes.

**Theorem: specialisation** (node `family-measure-specialisation`). This is EPW Proposition 4.1.4: at a classical ℘,
L^±(m, N)(℘) is the canonical-period p-adic L-function of f_℘, possibly imprimitive. It is compared with
ModularSymbolsPadicLFunctions L2.

**Congruence modules, branches and branch L-functions.** The generic congruence module is planned here once, as
red-team finding RT-AREA-langlands-1/27 requires; the family instance follows Hida (1986) §3, and the branches and their
L-functions follow Emerton–Pollack–Weston §§2.6–2.8 and 4.2–4.3.

**Definition: The congruence module of an augmentation** (node `congruence-module`; planet "Congruence module Ψ_λ(M)"; Iyengar–Khare–Manning §2.2 (congruence modules), pp. 13–14; Proposition 2.10 and Example 2.11, pp. 16–17). Let A be a commutative ring, O an integral domain and λ : A → O a surjective ring homomorphism with kernel 𝔭_λ. For an ideal J of A and an A-module M write M[J] = {m ∈ M : Jm = 0}, and put I_λ := A[𝔭_λ] = Ann_A(𝔭_λ). The congruence module of M at λ is the O-module Ψ_λ(M) := M / (M[𝔭_λ] + M[I_λ]) (it is killed by 𝔭_λ + I_λ, hence an O/λ(I_λ)-module). It is functorial in A-linear maps, and when A is noetherian local, λ local, O a complete discrete valuation ring and A ⊗ Frac(O) is reduced at 𝔭_λ (A in the category C_O(0) of Iyengar–Khare–Manning), Ψ_λ(M) is a torsion O-module of finite length that agrees, for M of positive depth, with their higher-codimension congruence module Ψ_A(M) in codimension zero.

*Hypotheses.* λ : A → O surjective onto a domain; M any A-module.

*API.*
- `congruenceModule` (constructor): Ψ_λ(M) = M/(M[𝔭_λ] + M[I_λ]).
- `congruenceModule_map` (functoriality): An A-linear map M → M′ induces Ψ_λ(M) → Ψ_λ(M′), with map_id and map_comp.
- `congruenceModule_annihilated` (structure): 𝔭_λ + I_λ annihilates Ψ_λ(M).
- `congruenceModule_self` (characterisation): Ψ_λ(A) = A/(I_λ + Ann_A(I_λ)).
- `congruenceModule_isTorsion` (structure): For A in C_O(0) and M finitely generated, Ψ_λ(M) is torsion of finite length.
- `congruenceModule_compare_ikm` (compatibility): For depth_A M ≥ 1 it agrees with Iyengar–Khare–Manning's Ψ_A(M) in codimension zero.

*Unit tests.*
- `congruenceModule_fibre_product` (computation): For A = {(a, b) ∈ ℤ_p × ℤ_p : a ≡ b mod pⁿ} and λ the first projection, 𝔭_λ = 0 × pⁿℤ_p, I_λ = pⁿℤ_p × 0 and Ψ_λ(A) ≅ ℤ/pⁿ.
- `congruenceModule_identity` (degenerate): For A = O and λ = id, 𝔭_λ = 0, I_λ = A and Ψ_λ(M) = 0 for every M.
- `congruenceModule_dual_numbers` (non-example): For A = O[t]/(t²) and λ(t) = 0, I_λ = 𝔭_λ = (t) and Ψ_λ(A) ≅ O is not torsion: A is not reduced at 𝔭_λ, so the finite-length statement needs its hypothesis.
- `congruenceModule_ikm_example` (compatibility): For A = O[[t]]/(ϖ²t) and M = A/(ϖ³), M/(M[𝔭] + M[I]) ≅ O/(ϖ) while Iyengar–Khare–Manning's Ψ_A(M) = 0 (Example 2.11).

*Proof sketch.* Functoriality: an A-linear map sends M[J] into M'[J] for every ideal J. Torsion and finite length when A is regular at 𝔭_λ in codimension zero: after inverting a uniformiser, A ⊗ K splits as K × B with 𝔭_λ and I_λ generating the unit ideal, so M[𝔭_λ] + M[I_λ] has full rank. Comparison with Iyengar–Khare–Manning: their Proposition 2.10 gives a natural surjection from M/(M[𝔭_λ] + M[I_λ]) onto their Ψ_A(M) with torsion kernel, bijective when depth_A M ≥ 1; their Example 2.11 shows it can fail to be injective in depth zero.

*Prerequisites.* `mathlib:Submodule.torsionBySet`, `mathlib:Module.annihilator`, `mathlib:Submodule.mkQ`.

*Check.* This is the generic owner requested by red-team finding RT-AREA-langlands-1/27: AutomorphicCongruences L0, SerreWeightAndLevelOptimisation R20.1 and IntegralIwasawaTheory I.5 keep only their Hecke-module instances and cite this node.

**Definition: The congruence ideal of an augmentation** (node `congruence-ideal`; Iyengar–Khare–Manning §2.2 and Proposition 2.10, pp. 13–17; Hida (ÉNS 1986) §0 and §6, Numdam). For λ : A → O as in L1/congruence-module, the congruence ideal is η_λ := λ(I_λ) = λ(Ann_A(𝔭_λ)) ⊆ O. If A is reduced and finite flat over a domain base mapping onto O compatibly (for example A finite flat over O, or a reduced finite flat Λ-algebra and λ onto a branch), then Ann_A(I_λ) = 𝔭_λ and Ψ_λ(A) ≅ O/η_λ; for A finite flat over a complete discrete valuation ring O and reduced, η_λ is nonzero and O/η_λ is finite.

*Hypotheses.* λ : A → O surjective; for the identification Ψ_λ(A) ≅ O/η_λ, A reduced with Ann_A(I_λ) = 𝔭_λ.

*API.*
- `congruenceIdeal` (constructor): η_λ = λ(Ann_A(ker λ)).
- `congruenceModule_self_eq` (characterisation): Ψ_λ(A) ≅ O/η_λ when Ann_A(I_λ) = 𝔭_λ.
- `congruenceIdeal_ne_bot` (structure): η_λ ≠ 0 for A reduced, finite flat over O.
- `congruenceIdeal_map` (functoriality): A surjection A → A′ through which λ factors gives η_λ(A) ⊆ η_λ(A′).

*Unit tests.*
- `congruenceIdeal_fibre_product` (computation): For A = {(a, b) : a ≡ b mod pⁿ} ⊆ ℤ_p², η_λ = pⁿℤ_p.
- `congruenceIdeal_identity` (degenerate): For A = O, η_λ = O.
- `congruenceIdeal_product` (computation): For A = O × O (no congruence) and λ the first projection, η_λ = O.
- `congruenceIdeal_dual_numbers` (non-example): For A = O[t]/(t²), η_λ = 0 although A is finite flat over O.

*Proof sketch.* Ψ_λ(A) = A/(I_λ + Ann_A(I_λ)) = A/(I_λ + 𝔭_λ) ≅ O/λ(I_λ). In a reduced ring the annihilator of the annihilator of a minimal-prime-type ideal 𝔭_λ returns 𝔭_λ when A ⊗ K = K × B with 𝔭_λ the kernel of the first projection.

*Prerequisites.* `PadicFamilies:L1/congruence-module`, `mathlib:Ideal.map`, `mathlib:IsReduced`.

*Check.* For the fibre product of two copies of ℤ_p glued modulo pⁿ, η_λ = pⁿℤ_p and Ψ_λ(A) ≅ ℤ/pⁿ.

**Construction: The reduced Hida algebra T_Σ of a residual representation and its branches** (node `reduced-hida-algebra`; planet "Reduced Hida algebra T_Σ(ρ̄)"; Emerton–Pollack–Weston §2.6, Theorem 2.6.1, Proposition 2.6.2 and Definition 2.6.3, pp. 18–19; §2.7, Definition 2.7.1, Proposition 2.7.2 and Definition 2.7.3, pp. 19–20). Let ρ̄ : G_ℚ → GL₂(k) be irreducible, odd, ordinary, p-distinguished and modular, with a chosen p-stabilisation, N(ρ̄) its tame conductor, and for a finite set Σ of primes ℓ ≠ p let N(Σ) = N(ρ̄)∏_{ℓ∈Σ} ℓ^{m_ℓ} with m_ℓ = dim V^{I_ℓ}. T_Σ = T_Σ(ρ̄) is the localisation of the ordinary Hecke algebra T′_{N(Σ)} (without U_ℓ for ℓ | N(Σ)) at the unique maximal ideal whose residual representation with its p-stabilisation is ρ̄; it is reduced and finite flat over Λ, carries ρ_Σ : G_ℚ → GL₂(T_Σ) with trace ρ_Σ(Frob_ℓ) = T_ℓ for ℓ ∤ N(Σ)p, and Σ ⊆ Σ′ gives a surjection T_{Σ′} → T_Σ. For a minimal prime 𝔞 of T_Σ, T(𝔞) := T_Σ/𝔞 is a local domain finite over Λ; there are a unique divisor N(𝔞) of N(Σ) and a minimal prime 𝔞′ of the new quotient T^new_{N(𝔞)} over 𝔞, and T(𝔞) ↪ T(𝔞)° := T^new_{N(𝔞)}/𝔞′ is an isomorphism after inverting p (and an isomorphism when N(𝔞) = N(ρ̄)).

*Hypotheses.* ρ̄ irreducible, odd, ordinary, p-distinguished and modular; p ≥ 5 is not needed for the definitions.

*API.*
- `reducedHidaAlgebra` (constructor): T_Σ(ρ̄) as a local Λ-algebra.
- `reducedHidaAlgebra_reduced` (instance): T_Σ is reduced.
- `reducedHidaAlgebra_finite_flat` (instance): T_Σ is finite and flat over Λ.
- `reducedHidaAlgebra_surj` (functoriality): Σ ⊆ Σ′ gives T_{Σ′} ↠ T_Σ compatible with ρ_Σ.
- `branchAlgebra` (constructor): T(𝔞) = T_Σ/𝔞 and T(𝔞)° with T(𝔞) ↪ T(𝔞)°.
- `branchAlgebra_iso_inv_p` (characterisation): T(𝔞)[1/p] ≅ T(𝔞)°[1/p].

*Unit tests.*
- `reducedHidaAlgebra_trace` (characterisation): trace ρ_Σ(Frob_ℓ) = T_ℓ for ℓ ∤ N(Σ)p.
- `reducedHidaAlgebra_minimal` (compatibility): For Σ = ∅ every branch has tame conductor N(ρ̄) and T(𝔞) = T(𝔞)°.
- `reducedHidaAlgebra_rank_one_example` (computation): For p = 11 and ρ̄ the mod-11 representation of Δ (equivalently of X₀(11), which is irreducible mod 11, ordinary and 11-distinguished), N(ρ̄) = 1 and the ordinary cuspidal Hecke algebra of tame level 1 in that component has rank one, so T_∅ = Λ: a single branch, étale over Λ.
- `reducedHidaAlgebra_not_local_hecke` (non-example): The full ordinary Hecke algebra of level N(Σ), with U_ℓ for ℓ ∈ Σ, is not T_Σ: it is not reduced in general (oldforms give U_ℓ-Jordan blocks), which is why T′ omits U_ℓ.

*Proof sketch.* Existence and uniqueness of the maximal ideal: modularity of ρ̄ and level optimisation; the maximal ideal of T_{N(Σ)} lifting it with T_ℓ ∈ 𝔫 for ℓ ∈ Σ gives an isomorphism of localisations (EPW Proposition 2.6.2). Reducedness and finite flatness over Λ: T′_{N(Σ)} ⊗_Λ L is a product of new Hecke algebras of levels dividing N(Σ) (EPW Proposition 2.4.2), and the ordinary Hecke algebra is finite flat over Λ (L0/ordinary-finite-over-lambda). Branches: minimal primes of T_Σ correspond to local components of T_Σ ⊗_Λ L, each of which comes from a unique new level.

*Prerequisites.* `PadicFamilies:L0/universal-hecke-algebra`, `PadicFamilies:L0/ordinary-finite-over-lambda`, `PadicFamilies:L0/hida-control-theorem`, `PadicFamilies:L4/ordinary-big-galois-representation`, `mathlib:IsReduced`.

*Check.* T_Σ is reduced and finite flat over Λ, and its minimal primes correspond to Hida families of newforms with a definite tame conductor N(𝔞).

**Construction: Congruence modules of a branch of a Hida family** (node `family-congruence-module`; Emerton–Pollack–Weston §2.7, pp. 19–20, and §4.1, Proposition 4.1.1, p. 28; Hida (ÉNS 1986) §3, Definition (3.9), Theorem 3.6 and Corollary 3.8, pp. 252–254). For a branch 𝔞 of T_Σ (L1/reduced-hida-algebra), let λ_𝔞 : T_Σ → T(𝔞) be the quotient map. The family congruence module of an T_Σ-module M is Ψ_{λ_𝔞}(M) (L1/congruence-module, with O replaced by the local domain T(𝔞)) and the family congruence ideal is η_𝔞 = λ_𝔞(Ann_{T_Σ}(𝔞)) ⊆ T(𝔞). Since T_Σ is reduced and finite flat over Λ, Ψ_{λ_𝔞}(T_Σ) ≅ T(𝔞)/η_𝔞, a torsion T(𝔞)-module, and η_𝔞 = T(𝔞) iff Spec T(𝔞) meets no other branch. For the ordinary family symbol module M = M^±_𝔪 ⊗ T_Σ, free of rank one over T_Σ under the hypotheses of L1/family-symbol-free-rank-one, Ψ_{λ_𝔞}(M) ≅ T(𝔞)/η_𝔞 as well, and the choice of a trivialisation of M does not change it. For a primitive cuspidal component this is Hida's Λ-adic module of congruence: a finite torsion module over Λ with principal annihilator (Hida, Theorem 3.6), and for each k ≥ 2 the weight-k module of congruence between the forms belonging to the component and the other ordinary forms of weight k is the kernel of a canonical surjection between the weight-k fibres of Hida's two Λ-adic congruence modules (Hida, Corollary 3.8).

*Hypotheses.* ρ̄ irreducible and p-distinguished (for freeness of M^±_𝔪); 𝔞 a minimal prime of T_Σ.

*API.*
- `familyCongruenceModule` (constructor): Ψ_{λ_𝔞}(M) for a T_Σ-module M.
- `familyCongruenceIdeal` (constructor): η_𝔞 ⊆ T(𝔞).
- `familyCongruenceModule_self` (characterisation): Ψ_{λ_𝔞}(T_Σ) ≅ T(𝔞)/η_𝔞.
- `familyCongruenceIdeal_eq_top_iff` (characterisation): η_𝔞 = T(𝔞) iff Spec T(𝔞) is a connected component of Spec T_Σ.
- `familyCongruenceModule_symbols` (compatibility): For the free family symbol module, Ψ_{λ_𝔞}(M^±) ≅ T(𝔞)/η_𝔞.

*Unit tests.*
- `familyCongruenceIdeal_single_branch` (degenerate): If T_Σ = T(𝔞) (one branch), η_𝔞 = T(𝔞) and the congruence module is zero.
- `familyCongruenceIdeal_two_branches` (computation): If T_Σ = {(x, y) ∈ Λ × Λ : x ≡ y mod f} for some f ∈ Λ, then for the first branch η_𝔞 = fΛ.
- `familyCongruenceModule_compat_generic` (compatibility): It is L1/congruence-module for A = T_Σ, O = T(𝔞).
- `familyCongruenceModule_not_period` (non-example): Ψ is independent of the choice of family period, whereas the scalar L-function changes by a unit under that choice (L1/period-change-of-trivialisation).

*Proof sketch.* Reducedness of T_Σ gives Ann(Ann(𝔞)) = 𝔞, hence L1/congruence-ideal's identification. Freeness of M^±_𝔪 (L1/family-symbol-free-rank-one) transports the computation from T_Σ to M; a different generator changes the isomorphism by a unit, not the module. η_𝔞 = T(𝔞) iff Ann(𝔞) + 𝔞 = T_Σ iff the branch is a connected component of Spec T_Σ.

*Prerequisites.* `PadicFamilies:L1/congruence-module`, `PadicFamilies:L1/congruence-ideal`, `PadicFamilies:L1/reduced-hida-algebra`, `PadicFamilies:L1/family-symbol-free-rank-one`, `PadicFamilies:L1/family-period-line`.

*Check.* Only the instance is planned here; the generic definition is L1/congruence-module.

**Theorem: Change of trivialisation of the family period line** (node `period-change-of-trivialisation`; Emerton–Pollack–Weston §4.1, after Proposition 4.1.1 and Proposition 4.1.4, pp. 28–30). Let θ^± : M^±_𝔪 ≅ T_𝔪 be a trivialisation of the invertible family symbol module (L1/family-period-line) and L_θ^± ∈ T_𝔪 ⊗̂ ℤ_p[[ℤ_p^×]] the scalar two-variable p-adic L-function obtained by applying θ^± to L^±(𝔪, N) (L1/family-measure). If θ′ = u·θ with u ∈ T_𝔪^×, then L_{θ′}^± = u·L_θ^±, and for every classical height-one prime ℘ the specialisations differ by the unit u(℘) ∈ O(℘)^×. Conversely, any two trivialisations differ by such a unit, so the ideal generated by L^±_θ in T_𝔪 ⊗̂ ℤ_p[[ℤ_p^×]] and the Iwasawa μ- and λ-invariants of its specialisations do not depend on θ; equality with single-form p-adic L-functions built from canonical periods holds up to a unit, never up to an arbitrary scalar in Frac O(℘).

*Hypotheses.* ρ̄_𝔪 irreducible and p-distinguished, so that M^±_𝔪 is free of rank one.

*Proof sketch.* θ′ ∘ θ⁻¹ is a T_𝔪-linear automorphism of T_𝔪, i.e. multiplication by a unit u. Applying θ is T_𝔪-linear and commutes with the completed tensor product, so the formula follows; specialisation at ℘ is a ring map. Comparison with canonical periods: at ℘ the specialised trivialisation is a generator of the saturated period lattice (ModularSymbolsPadicLFunctions L1), which is unique up to O(℘)^×.

*Prerequisites.* `PadicFamilies:L1/family-period-line`, `PadicFamilies:L1/family-measure`, `PadicFamilies:L1/family-measure-specialisation`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`.

*Check.* The statement is integral: no p is inverted, and the ambiguity is a unit of T_𝔪, separating equality up to a unit from equality up to a field scalar as the stage requires.

**Construction: Two-variable p-adic L-functions on the branches of a Hida family** (node `branch-l-functions`; planet "Two-variable L-function on a Hida branch"; Emerton–Pollack–Weston §4.2, Definitions 4.2.1–4.2.2, pp. 31–32; §4.3, Definition 4.3.1, Theorem 4.3.2 and Corollary 4.3.3, pp. 32–33; §4.5, pp. 37–39). Let ρ̄ be as in L1/reduced-hida-algebra and 0 ≤ i ≤ p − 2, Λ^{(i)} the ω^i-component of ℤ_p[[ℤ_p^×]]. (1) L_Σ(ρ̄, ωⁱ) ∈ T_Σ ⊗̂ Λ^{(i)} is the image of L(𝔫, N(Σ), ωⁱ) (L1/family-measure) under T_Σ ≅ (T_{N(Σ)})_𝔫, defined up to T_Σ^×; its reductions modulo a height-one prime ℘ and modulo the maximal ideal are defined up to units. (2) For a branch 𝔞, L(ρ̄, 𝔞, ωⁱ) ∈ T(𝔞)° ⊗̂ Λ^{(i)} is the image of L(𝔪, N(𝔞), ωⁱ) under the surjection T_{N(𝔞)} → T^new_{N(𝔞)}/𝔞′ = T(𝔞)°; at a classical height-one prime ℘ of T(𝔞) it specialises to the p-adic L-function of the newform f_℘, whereas L_Σ(ρ̄, ωⁱ)(℘) is that of the Σ-imprimitive oldform g_℘. (3) Comparison: there is an isomorphism T(𝔞)° ⊗ M(N(Σ))_𝔫 ≅ T(𝔞)° ⊗ M(N(𝔞))_𝔪 compatible with complex conjugation carrying L(𝔫, N(Σ)) to L(𝔪, N(𝔞))·E_Σ(𝔞), with E_Σ(𝔞) = ∏_{ℓ∈Σ} E_ℓ(𝔞, ⟨ℓ⟩⁻¹) the product of Euler factors; hence L_Σ(ρ̄, ωⁱ) ≡ u·L(ρ̄, 𝔞, ωⁱ)·E_Σ(𝔞, ωⁱ) modulo 𝔞 for a unit u of T(𝔞)°.

*Hypotheses.* ρ̄ irreducible, odd, ordinary, p-distinguished and modular, with a chosen p-stabilisation; Σ a finite set of primes ℓ ≠ p.

*API.*
- `imprimitiveFamilyL` (constructor): L_Σ(ρ̄, ωⁱ) ∈ T_Σ ⊗̂ Λ^{(i)} up to T_Σ^×.
- `branchFamilyL` (constructor): L(ρ̄, 𝔞, ωⁱ) ∈ T(𝔞)° ⊗̂ Λ^{(i)} up to units.
- `branchFamilyL_specialise` (compatibility): At classical ℘ it is the p-adic L-function of f_℘ with canonical period.
- `imprimitive_eq_branch_mul_euler` (relation): L_Σ ≡ u·L(ρ̄, 𝔞)·E_Σ(𝔞) mod 𝔞.

*Unit tests.*
- `branchFamilyL_empty_sigma` (degenerate): For Σ = ∅ and a minimal branch, E_∅ = 1 and the two constructions agree up to a unit.
- `branchFamilyL_euler_factor` (computation): For Σ = {ℓ} with ℓ prime to N(𝔞)p, E_ℓ(𝔞, X) = 1 − (T_ℓ mod 𝔞′)X + ⟨ℓ⟩ℓ⁻¹X² (EPW Definition 2.8.1), evaluated at X = ⟨ℓ⟩⁻¹ in T(𝔞)° ⊗̂ Λ^{(i)}; for ℓ dividing N(𝔞) only the linear factor 1 − (T_ℓ mod 𝔞′)X occurs.
- `branchFamilyL_compat_single` (compatibility): Specialised at ℘ = the prime of a weight-two newform f, it is ModularSymbolsPadicLFunctions L2's ordinary integral measure of f.
- `branchFamilyL_not_newform_sigma` (non-example): L_Σ(ρ̄, ωⁱ)(℘) is not the p-adic L-function of the newform f_℘ when Σ is nonempty: it differs by the Euler factors at Σ, which can vanish at some characters.

*Proof sketch.* (1) and (2) are transports of L1/family-measure along the isomorphism of EPW Proposition 2.6.2 and the surjection (4.4); specialisation is L1/family-measure-specialisation. (3) compares the family symbol modules of levels N(Σ) and N(𝔞) through degeneracy maps at the primes of Σ (EPW §4.5), the Euler factor arising from the U_ℓ-eigenvalue relations; the period ratio is shown to be a unit uniformly in the family.

*Prerequisites.* `PadicFamilies:L1/reduced-hida-algebra`, `PadicFamilies:L1/family-measure`, `PadicFamilies:L1/family-measure-specialisation`, `PadicFamilies:L1/family-symbol-free-rank-one`, `PadicFamilies:L1/ordinary-family-symbol-module`, `ModularCurvesPartII:R14.4/degeneracy-cohomology`.

*Check.* At every classical height-one prime ℘ of T(𝔞), L(ρ̄, 𝔞, ωⁱ) specialises to the p-adic L-function of the newform f_℘ up to a unit (EPW Proposition 4.1.4 with Definition 4.2.2).

### L5, Milestone 7: Hida theory over totally real fields

Library module: `TauCeti/NumberTheory/PadicFamilies/TotallyReal`. The source is Skinner–Wiles §3.2, with F totally
real of even degree and the definite quaternion algebra D ramified exactly at the infinite places. The modules, the
projector and the towers are planned here (moved down from OrdinaryAutomorphicFormsAndModularityLifting R21.1), and L5
proves Hida's theorems about them.

**Construction: the weight algebra** (node `totally-real-weight-algebra`; planet "Nearly ordinary weight algebra of a
totally real field"). G(U) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U), where Z(U) is the idelic centre modulo global units. The free part
of Z(U) has rank δ_F = 1 + the Leopoldt defect, so Λ′_𝒪 = 𝒪[[X_1, …, X_{δ_F}, Y^{(i)}_j]] has δ_F + d variables, and
𝒪[[G(U)]] is finite free over it. The weight-two arithmetic points (finite characters φ, ψ) are Zariski dense.
- *API:* `nearlyOrdinaryWeightAlgebra`, `heckeGroup`, `groupRing_free`, `deltaF_eq_rank`, `arithmeticPoint`,
  `arithmeticPoints_dense`.
- *Tests:*
  - for F = ℚ, Λ′_𝒪 = 𝒪[[X, Y]] (weight and twist);
  - a real quadratic abelian F has 3 variables;
  - the density of the points (1 + X − ζ);
  - the torsion of G(U) is not a weight variable.

**Theorem: Hida's freeness** (node `hida-freeness`; planet "Hida's freeness theorem"). This is Skinner–Wiles
Proposition 3.3, after Hida [H2, Theorem 3.8]. If U/(U ∩ F^×) acts freely on D^×\G^D(A_f), M_∞(U) and M⁺_∞(U) are
projective over 𝒪[[G(U)]], hence free over Λ′_𝒪.
- The proof: the free action makes the dual of H⁰(X(U_a), K/𝒪) free over 𝒪[G(U_a)]. The e-part is then a direct
  summand, and level independence (L5/ordinary-level-independence) bounds its generators in the limit.
- The stated rank rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #G(U)_tors needs equal ranks on all characters of the prime-to-p torsion
  (E11).

**Theorem: finiteness** (node `hida-hecke-finite`). This is Corollary 3.4. T_∞(U, 𝒪) is finite and torsion-free over
Λ′_𝒪, semilocal and complete. The proof shrinks U at an auxiliary prime ℓ ∤ 6 to get a free action (R18.3), embeds
M_∞(U) ↪ M_∞(V), and uses the faithful action.

**Theorem: Hida's control** (node `hida-control-nearly-ordinary`; planet). This is Proposition 3.7, after Hida [H2,
Corollary 2.5]. A λ with λ|_{Z(U)} = ψε^μ and finite torus character comes from a nearly ordinary π of parallel weight
(μ + 2)·t. The weight-two case follows from the definitions. For μ > 0 the proof is cited, unread, and recorded as a gap.

**Lemma: density on components** (node `algebraic-primes-dense`). This is Lemma 3.8 with Corollary 3.9. Weight-two
algebraic primes are dense in every Spec(T_∞/Q), by lying over from Λ′_𝒪 and a dimension count, which the source calls
"immediate". A minimal prime whose dense set of points factors through a larger level comes from that level.

**The quaternionic modules, moved down.**

**Construction: Hida's ordinary projector on definite quaternionic forms** (node `quaternionic-ordinary-projector`; Skinner–Wiles §3.2, pp. 32–34 (Numdam PDF pages 29–31; printed page = PDF page + 3)). F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p, U_a = U ∩ U(p^a) and U⁰_a = U ∩ U₀(p^a), and 𝒪 the ring of integers of a finite extension K of ℚ_p. For an 𝒪-module R, H⁰(X(U_a), R) is the module of R-valued functions on the finite set X(U_a), with the Hecke operators T₀(p) = [U_a (1 0; 0 ϖ_p) U_a] (ϖ_p a finite idele with a uniformiser at each v | p and 1 elsewhere), T₀(𝔭_i) for the primes above p, the group G(U_a) and T(ℓ), S(ℓ) for ℓ ∤ p with U_ℓ maximal. For R finite as a set, e := lim_n T₀(p)^{n!} is the finite ordinary projector of L0a; for R = 𝒪 it is the adic projector on the finite free module H⁰(X(U_a), 𝒪); for R = K/𝒪 it is the colimit of the projectors on the 𝒪/πⁿ-coefficients. e is an idempotent commuting with the Hecke algebra T(U_a, 𝒪), with change of coefficients R → R′, and with pullback and trace between levels U_b ⊆ U_a.

*Hypotheses.* F even degree, p odd, D definite and unramified at all finite places.

*API.*
- `quaternionicOrdinaryProjector` (constructor): e on H⁰(X(U_a), R) for R = 𝒪, finite R and K/𝒪.
- `quaternionicOrdinaryProjector_eq_ordinaryProjector` (compatibility): For finite R it is L0a's ordinaryProjector of T₀(p).
- `quaternionicOrdinaryProjector_comm_hecke` (structure): e commutes with T(U_a, 𝒪).
- `quaternionicOrdinaryProjector_pullback` (functoriality): e commutes with pullback H⁰(X(U_a), R) → H⁰(X(U_b), R), b ≥ a.
- `quaternionicOrdinaryProjector_trace` (functoriality): e commutes with the trace H⁰(X(U_b), R) → H⁰(X(U_a), R).

*Unit tests.*
- `quaternionicOrdinaryProjector_finite_set` (compatibility): On H⁰(X(U_a), 𝔽_p) it equals T₀(p)^{m!} with m = |H⁰(X(U_a), 𝔽_p)|.
- `quaternionicOrdinaryProjector_zero_module` (degenerate): On R = 0 the projector is zero.
- `quaternionicOrdinaryProjector_constants` (computation): On constant functions T₀(p) acts by the number of points of the double coset fibre, ∏_{v|p} N(v), which is divisible by p, so e kills the constants with 𝒪-coefficients.
- `quaternionicOrdinaryProjector_not_averaging` (non-example): e is not the averaging idempotent over G(U_a): averaging divides by #G(U_a), which can be divisible by p, while e needs no division.

*Proof sketch.* H⁰(X(U_a), R) = Map(X(U_a), R) is finite (resp. finite free) because X(U_a) is finite (HilbertModularVarietiesAndShimuraCurves R18.3, the definite class set). Apply L0a/finite-ordinary-projector and L0a/adic-instance; the projector for K/𝒪 is the colimit by naturality (L0a/ordinary-projector-natural). Commutation with the Hecke algebra and with the level maps: these are 𝒪-linear and commute with T₀(p) (Skinner–Wiles's computation of double cosets), so they commute with every power and with the limit.

*Prerequisites.* `PadicFamilies:L0a/finite-ordinary-projector`, `PadicFamilies:L0a/adic-instance`, `PadicFamilies:L0a/ordinary-projector-natural`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`, `HilbertModularVarietiesAndShimuraCurves:R18.3/split-hecke-normalisation`, `mathlib:IsIdempotentElem`.

*Check.* Moved down from OrdinaryAutomorphicFormsAndModularityLifting R21.1 (tier 20) to this tier-16 layer, as the upstream order requires; R21.1 imports it from here.

**Construction: The nearly ordinary Hecke algebra T_∞(U, 𝒪)** (node `nearly-ordinary-hecke-algebra`; Skinner–Wiles §3.2, pp. 32–33 (Numdam PDF pages 29–30)). F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p, U_a = U ∩ U(p^a) and U⁰_a = U ∩ U₀(p^a), and 𝒪 the ring of integers of a finite extension K of ℚ_p. Let T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪)) be generated by T₀(p), the T₀(𝔭_i), G(U_a) and T(ℓ), S(ℓ) for ℓ ∤ p with U_ℓ maximal, and T₂(U_a, 𝒪) := eT(U_a, 𝒪), its image in End_𝒪(eH⁰(X(U_a), 𝒪)). The transition maps T₂(U_b, 𝒪) → T₂(U_a, 𝒪) (b ≥ a) are surjective and T_∞(U, 𝒪) := lim_a T₂(U_a, 𝒪). With G(U) = lim_a G(U_a) ≅ (𝒪_F ⊗ ℤ_p)^× × Z(U) there is a continuous map 𝒪[[G(U)]] → T_∞(U, 𝒪), making T_∞(U, 𝒪) an algebra over the weight algebra Λ′_𝒪 of L5/totally-real-weight-algebra.

*Hypotheses.* As in L5/quaternionic-ordinary-projector.

*API.*
- `quaternionicHeckeAlgebra` (constructor): T(U_a, 𝒪) ⊆ End_𝒪(H⁰(X(U_a), 𝒪)).
- `nearlyOrdinaryHeckeAlgebra` (constructor): T₂(U_a, 𝒪) = eT(U_a, 𝒪).
- `nearlyOrdinaryHeckeAlgebra_transition_surjective` (structure): T₂(U_b, 𝒪) ↠ T₂(U_a, 𝒪) for b ≥ a.
- `hidaHeckeAlgebra` (constructor): T_∞(U, 𝒪) = lim_a T₂(U_a, 𝒪).
- `hidaHeckeAlgebra_groupRingHom` (constructor): 𝒪[[G(U)]] → T_∞(U, 𝒪).
- `hidaHeckeAlgebra_lambdaAlgebra` (instance): T_∞(U, 𝒪) as a Λ′_𝒪-algebra.

*Unit tests.*
- `nearlyOrdinaryHeckeAlgebra_zero` (degenerate): If eH⁰(X(U_a), 𝒪) = 0 then T₂(U_a, 𝒪) = 0.
- `hidaHeckeAlgebra_groupRingHom_diamond` (characterisation): The image of g ∈ G(U_a) in T₂(U_a, 𝒪) is the operator of g on eH⁰(X(U_a), 𝒪).
- `hidaHeckeAlgebra_compat_jl` (compatibility): T₂(U_a, 𝒪) ⊗ K is the Hecke algebra of ordinary Hilbert cusp forms of parallel weight two and level U_a under Jacquet–Langlands.
- `hidaHeckeAlgebra_not_full` (non-example): The full Hecke algebra T(U_a, 𝒪) is not finite over Λ′_𝒪 in the limit; only after applying e does the projective system have a limit finite over Λ′_𝒪.

*Proof sketch.* The transition maps are restrictions of Hecke operators along the pullback maps, which are compatible with e; surjectivity holds because generators map to generators. The G(U_a) act through the diamond-type operators, compatible in a, giving 𝒪[[G(U)]] → T_∞(U, 𝒪) by the universal property of the completed group ring (PadicMeasuresIwasawaAlgebras L1). By the Jacquet–Langlands correspondence for definite quaternion algebras (HilbertModularVarietiesAndShimuraCurves R18.3), T₂(U_a, 𝒪) is Skinner–Wiles's Hecke algebra eT*₂(U_a, 𝒪) of Hilbert cusp forms of parallel weight two.

*Prerequisites.* `PadicFamilies:L5/quaternionic-ordinary-projector`, `PadicFamilies:L5/totally-real-weight-algebra`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl`, `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`, `mathlib:MvPowerSeries`.

*Check.* Moved down from OrdinaryAutomorphicFormsAndModularityLifting R21.1.

**Lemma: The ordinary part does not grow in Γ₀(p^a)-level** (node `ordinary-level-independence`; Skinner–Wiles §3.2, proof of Proposition 3.3, p. 36 (Numdam PDF page 33)). F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p, U_a = U ∩ U(p^a) and U⁰_a = U ∩ U₀(p^a), and 𝒪 the ring of integers of a finite extension K of ℚ_p. For a ≥ 2 the double coset U⁰_a (1 0; 0 ϖ_p) U⁰_a equals U⁰_a (1 0; 0 ϖ_p) U⁰_{a−1}, so T₀(p) maps H⁰(X(U⁰_a), K/𝒪) into the image of H⁰(X(U⁰_{a−1}), K/𝒪), and eH⁰(X(U⁰_a), K/𝒪) = eH⁰(X(U⁰_1), K/𝒪). Moreover H⁰(X(U⁰_a), K/𝒪) = H⁰(X(U_a), K/𝒪)^{G(U_a)}.

*Hypotheses.* As in L5/quaternionic-ordinary-projector.

*Proof sketch.* The double coset identity is a matrix computation at the places above p. Iterating, the image of T₀(p)^{a−1} lies in the level-U⁰_1 forms, and e is a limit of powers of T₀(p) on which T₀(p) is invertible, so the ordinary part is contained in, hence equal to, the level-U⁰_1 ordinary part. Invariants: U⁰_a/U_a ≅ G(U_a)-part acting on X(U_a).

*Prerequisites.* `PadicFamilies:L5/quaternionic-ordinary-projector`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-class-set`.

*Check.* Moved down from OrdinaryAutomorphicFormsAndModularityLifting R21.1.

**Theorem: Pontryagin duality for the ordinary quaternionic towers** (node `ordinary-towers-duality`; Skinner–Wiles §3.2, p. 35 (Numdam PDF page 32)). F is a totally real field of even degree d, p an odd prime, D/F the quaternion algebra ramified exactly at the infinite places, X(U) = D^×\G^D(A_f)/U for open compact U ⊆ GL₂(𝒪_F ⊗ Ẑ) with U_v = GL₂(𝒪_{F,v}) for v | p, U_a = U ∩ U(p^a) and U⁰_a = U ∩ U₀(p^a), and 𝒪 the ring of integers of a finite extension K of ℚ_p. Put H_∞(U) = lim_→ eH⁰(X(U_a), K/𝒪) and H⁺_∞(U) = lim_→ eH⁰(X(U_a), K/𝒪)⁺ along pullbacks, and M_∞(U) = lim_← eH⁰(X(U_a), 𝒪)⁺, M⁺_∞(U) = lim_← eH⁰(X(U_a), 𝒪) along traces (the superscript + denoting the subspace on which the centre acts through the norm-form condition fixed by Skinner–Wiles). These are T_∞(U, 𝒪)-modules, and the perfect pairings at finite level induce T_∞(U, 𝒪)-isomorphisms M_∞(U) ≅ Hom_𝒪(H_∞(U), K/𝒪) and M⁺_∞(U) ≅ Hom_𝒪(H⁺_∞(U), K/𝒪).

*Hypotheses.* As in L5/quaternionic-ordinary-projector.

*Proof sketch.* The pairing on functions on X(U_a) weighted by the stabiliser orders c_{U_a}(x) is perfect over 𝒪 when the stabilisers are trivial, which holds for a large (HilbertModularVarietiesAndShimuraCurves R18.3, integral pairing and neat level). Hecke operators are adjoint up to the twist by the main involution; e is compatible with the pairing, and pullback is adjoint to trace, so the finite-level dualities pass to the limit (Pontryagin duality exchanges colimits and limits).

*Prerequisites.* `PadicFamilies:L5/nearly-ordinary-hecke-algebra`, `PadicFamilies:L5/quaternionic-ordinary-projector`, `HilbertModularVarietiesAndShimuraCurves:R18.3/integral-pairing`, `HilbertModularVarietiesAndShimuraCurves:R18.3/neatness-base-change`, `mathlib:CharacterModule`.

*Check.* Moved down from OrdinaryAutomorphicFormsAndModularityLifting R21.1.

**Construction: Period modules of totally real Hida families** (node `quaternionic-period-module`; Skinner–Wiles §3.2, pp. 35–37 (Numdam PDF pages 32–34), and §3.3). In the setting of L5/ordinary-towers-duality, let 𝔪 be a maximal ideal of T_∞(U, 𝒪) and T_𝔪 the localisation. The period module of the family at 𝔪 is the T_𝔪-module P_𝔪 := M_∞(U)_𝔪 (and P⁺_𝔪 := M⁺_∞(U)_𝔪). It is faithful and finite over T_𝔪, and free over Λ′_𝒪 when U acts freely (L5/hida-freeness). It is exported as an invertible T_𝔪-module, with trivialisations P_𝔪 ≅ T_𝔪 unique up to T_𝔪^×, only under the explicit hypothesis that P_𝔪 is free of rank one over T_𝔪 (a multiplicity-one statement, proved in the minimal case by Taylor–Wiles patching in OrdinaryAutomorphicFormsAndModularityLifting); without it P_𝔪 has generic rank one at each minimal prime of T_𝔪 whose classical specialisations are newforms of level exactly U, by multiplicity one for the definite quaternion algebra and strong multiplicity one, but need not be invertible. For F = ℚ (degree one, with the indefinite modular curve in place of the definite quaternion algebra) the corresponding object is L1's family period line, and the change-of-trivialisation formula is L1/period-change-of-trivialisation.

*Hypotheses.* F of even degree; U acting freely for the Λ′-freeness; for invertibility, the hypothesis that P_𝔪 is free of rank one over T_𝔪.

*API.*
- `quaternionicPeriodModule` (constructor): P_𝔪 = M_∞(U)_𝔪 as a T_𝔪-module.
- `quaternionicPeriodModule_faithful` (structure): P_𝔪 is a faithful finite T_𝔪-module.
- `quaternionicPeriodModule_free_lambda` (structure): P_𝔪 is free over Λ′_𝒪 when U acts freely.
- `quaternionicPeriodModule_invertible_of_free` (characterisation): If P_𝔪 ≅ T_𝔪, it is invertible and trivialisations differ by T_𝔪^×.
- `quaternionicPeriodModule_compat_rational` (compatibility): For F = ℚ with the modular curve in place of the definite algebra, the analogue is L1/family-period-line.

*Unit tests.*
- `quaternionicPeriodModule_rank_one_example` (computation): If T_𝔪 = Λ′_𝒪 (a single family étale over weight space) and M_∞(U)_𝔪 is free of rank one over Λ′_𝒪, then P_𝔪 is invertible with trivialisations Λ′_𝒪^×.
- `quaternionicPeriodModule_zero` (degenerate): If 𝔪 is not in the support of M_∞(U), P_𝔪 = 0 and T_𝔪 = 0.
- `quaternionicPeriodModule_not_invertible` (non-example): When two newforms of level U are congruent modulo 𝔪 and T_𝔪 is not Gorenstein, P_𝔪 can be faithful of generic rank one without being free over T_𝔪; it is then not exported as invertible.
- `quaternionicPeriodModule_compat_trivialisation` (compatibility): A change of trivialisation multiplies the resulting scalar family by a unit of T_𝔪, as in L1/period-change-of-trivialisation.

*Proof sketch.* Faithfulness: T_∞(U, 𝒪) is defined as an algebra of endomorphisms of the tower (L5/nearly-ordinary-hecke-algebra), and localisation preserves faithfulness. Generic rank one: at a minimal prime the dense weight-two specialisations (L5/algebraic-primes-dense) are quaternionic eigenforms whose eigenspaces in eH⁰(X(U_a), K) are one-dimensional when the corresponding Hilbert newform has level exactly U (Jacquet–Langlands and multiplicity one for D^×, HilbertModularVarietiesAndShimuraCurves R18.3). Invertibility: a finite faithful module that is free of rank one is invertible; trivialisations differ by units. No such statement is made without the hypothesis.

*Prerequisites.* `PadicFamilies:L5/ordinary-towers-duality`, `PadicFamilies:L5/nearly-ordinary-hecke-algebra`, `PadicFamilies:L5/hida-freeness`, `PadicFamilies:L5/algebraic-primes-dense`, `PadicFamilies:L1/family-period-line`, `PadicFamilies:L1/period-change-of-trivialisation`, `HilbertModularVarietiesAndShimuraCurves:R18.3/definite-jl`.

*Check.* The stage's condition is visible: invertibility is a hypothesis carried by the consumer (or proved by OrdinaryAutomorphicFormsAndModularityLifting), never asserted from Λ′-freeness alone.

**Λ-adic Hilbert modular forms and the facts used by Dasgupta–Kakde–Ventullo.** The source is Dasgupta–Kakde–Ventullo,
*On the Gross–Stark conjecture* (Ann. of Math. 188, 2018), §§3.1, 3.3 and 4. The paper uses the three statements below
without proof.

**Definition: Λ-adic Hilbert modular forms and their ordinary parts** (node `lambda-adic-hilbert-forms`; planet "Λ-adic Hilbert modular forms"; Dasgupta–Kakde–Ventullo §3.1, (25)–(27) and the definitions of M(𝔫, χ), S(𝔫, χ), e, M°, S°, T̃, T, pp. 846–847). Let F be totally real, p odd, E/ℚ_p finite with ring of integers 𝒪_E, Λ = 𝒪_E[[T]], u a topological generator of 1 + pℤ_p and ν_k : Λ → 𝒪_E, T ↦ u^{k−1} − 1, the weight-k specialisation. For a narrow ray class character χ of conductor 𝔫 prime to p, a Λ-adic Hilbert modular form of tame level 𝔫 and character χ is a family F = (c(𝔞, F))_𝔞 ∈ Λ^{integral ideals} together with constant terms, such that for every integer k ≥ 2 the specialisation ν_k(F) is the q-expansion of a classical Hilbert modular form of parallel weight k, level 𝔫p and character χω^{1−k}. They form a Λ-module M(𝔫, χ) with cuspidal submodule S(𝔫, χ), Hecke operators T_𝔩 (𝔩 ∤ 𝔫p) and U_𝔩 (𝔩 | 𝔫p). The ordinary projector e = lim_n (∏_{𝔭|p} U_𝔭)^{n!} defines the Hida families M°(𝔫, χ) = eM(𝔫, χ) and S°(𝔫, χ) = eS(𝔫, χ), finite free over Λ, with Hecke algebras T̃ and T acting on them.

*Hypotheses.* F totally real; p odd; χ of conductor 𝔫 prime to p; parallel weights.

*API.*
- `LambdaAdicHilbertForm` (constructor): The Λ-module M(𝔫, χ) of coefficient families specialising to classical forms of parallel weight k ≥ 2.
- `LambdaAdicHilbertForm.specialise` (projection): ν_k : M(𝔫, χ) → M_k(𝔫p, χω^{1−k}).
- `lambdaAdicOrdinaryProjector` (constructor): e = lim (∏_{𝔭|p}U_𝔭)^{n!}.
- `hidaFamilies` (constructor): M°(𝔫, χ) = eM(𝔫, χ) and S°(𝔫, χ), with Hecke algebras T̃ and T.
- `hidaFamilies_free` (structure): M°(𝔫, χ) and S°(𝔫, χ) are finite free over Λ.
- `hidaFamilies_specialise_ordinary` (compatibility): ν_k(S°(𝔫, χ)) spans the ordinary cusp forms of weight k ≥ 2.

*Unit tests.*
- `lambdaAdic_eisenstein` (computation): The Eisenstein family E(1, χ) with ν_k(E(1, χ)) = E_k(1, χω^{1−k}) lies in M°(𝔫, χ), with constant terms 2^{−[F:ℚ]}L_p(χω, 1 − k) (DKV §3.1).
- `lambdaAdic_weight_one` (computation): ν_1(T) = 0: weight one corresponds to the augmentation of Λ.
- `lambdaAdic_compat_rational` (compatibility): For F = ℚ, S°(N, χ) is the module of ordinary Λ-adic cusp forms dual to L0's ordinary Hecke algebra.
- `lambdaAdic_not_single_weight` (non-example): A family specialising to a classical form at one weight only is not a Λ-adic form: the condition is imposed at every integer k ≥ 2.

*Proof sketch.* The ordinary projector is L0a's: on each specialisation the space of forms of level 𝔫p^r and weight k is a finite 𝒪_E-module on which ∏U_𝔭 acts, and the projectors are compatible; Hida's theory identifies eM(𝔫, χ) with a finite free Λ-module whose specialisations at k ≥ 2 are the ordinary classical forms (Hida control in parallel weight, L5/hida-control-nearly-ordinary for the cuspidal part). The q-expansion principle for p-adic Hilbert modular forms on the ordinary Igusa tower makes 'a family of q-expansions specialising to classical forms' a module of p-adic modular forms (HodgeTateAndCanonicalSubgroups T5, as red-team finding RT-AREA-langlands-1/8 requires, not IgusaVarietiesAndTorsionConcentration IG.1).

*Prerequisites.* `PadicFamilies:L0a/locally-finite-ordinary-projector`, `PadicFamilies:L0a/adic-instance`, `PadicFamilies:L5/hida-control-nearly-ordinary`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/hilbert-algebraic-weights`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`, `HodgeTateAndCanonicalSubgroups:T5/igusa-torsor`, `mathlib:PowerSeries`.

*Check.* Weight-one specialisation ν_1 is not required to be classical in the definition; Dasgupta–Kakde–Ventullo study it separately.

**Theorem: A Hida family is determined by its Fourier expansion** (node `hida-family-fourier-embedding`; Dasgupta–Kakde–Ventullo §3.3, p. 850). Let Λ_{(1)} = 𝒪_E[[T]]_{(T)} be the localisation of Λ at the weight-one prime (T) (a discrete valuation ring in which p is invertible). The map c : S°(𝔫, χ)_{(1)} → ∏_{𝔞 ⊆ 𝒪_F} Λ_{(1)}, H ↦ (c(𝔞, H))_𝔞, sending a cuspidal Hida family to its normalised Fourier coefficients, is injective and Λ_{(1)}-linear.

*Hypotheses.* χ of conductor 𝔫 prime to p; cuspidal families.

*Proof sketch.* A Λ-adic form is by definition a family of coefficients; the Fourier expansion map is injective on S(𝔫, χ) because a cuspidal Hilbert form is determined by its normalised coefficients c(𝔞, ·) (its constant terms vanish), so a family all of whose coefficients vanish specialises to zero at every k ≥ 2, hence is zero. Localisation at (T) is flat, so injectivity persists after ⊗_Λ Λ_{(1)}.

*Prerequisites.* `PadicFamilies:L5/lambda-adic-hilbert-forms`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/classical-hecke-and-level`.

*Check.* The paper uses this without proof; it is one of the three facts the maintainer assigned to this layer.

**Theorem: The localised cuspidal Hecke algebra is reduced at minimal tame level** (node `hilbert-hecke-reduced`; Dasgupta–Kakde–Ventullo §4, the paragraph before (50), p. 857). Let 𝔪 ⊆ T be the height-one prime of the cuspidal Hecke algebra generated by T, T_𝔩 − (1 + χε(𝔩)) for 𝔩 ∤ 𝔫p and U_𝔩 − 1 for 𝔩 | 𝔫p (the Eisenstein prime through E₁(1, χ_S)). If the tame character χ has conductor equal to the tame level 𝔫, then the localisation T_{(𝔪)} is reduced: there are no 𝔫-old forms, so T_{(𝔪)} ⊗ Frac(Λ) is a product of fields.

*Hypotheses.* cond(χ) = 𝔫; the localisation at the height-one prime 𝔪.

*Proof sketch.* At tame level equal to the conductor of the character every eigenform is new at 𝔫, and the U_𝔩 (𝔩 | 𝔫) act semisimply with eigenvalues determined by the newform; away from 𝔫p the T_𝔩 act semisimply on cusp forms (they are normal for the Petersson product at each classical weight). S°(𝔫, χ) ⊗ Frac(Λ) is therefore a direct sum of one-dimensional Hecke eigenspaces (multiplicity one for new families), so the Hecke algebra over Frac(Λ) is a product of fields and T_{(𝔪)}, being Λ_{(1)}-torsion-free and embedded in it, is reduced.

*Prerequisites.* `PadicFamilies:L5/lambda-adic-hilbert-forms`, `PadicFamilies:L5/hida-family-fourier-embedding`, `GL2AutomorphicRepresentationsAndTransfer:R16.6/geometry-and-galois-exports`, `mathlib:IsReduced`.

*Check.* The hypothesis cond(χ) = 𝔫 is essential: with old forms at a prime 𝔩 | 𝔫, U_𝔩 has repeated eigenvalues on oldspaces and the Hecke algebra including U_𝔩 can contain nilpotents.

**Theorem: The total ring of fractions of the localised Hecke algebra and its eigenfamilies** (node `hecke-total-fraction-ring`; Dasgupta–Kakde–Ventullo §4, (50) and (51), p. 857). Under the hypotheses of L5/hilbert-hecke-reduced, let L = Frac(T_{(𝔪)}) be the total ring of fractions. Then T_{(𝔪)} ↪ L and L ≅ ∏_{i=1}^t L_{H_i}, a finite product of fields, each a finite extension of Frac(Λ) corresponding to a cuspidal Hida eigenfamily H_i; the image of T_𝔞 in L_{H_i} is the normalised coefficient c(𝔞, H_i). These coefficients generate a finite local Λ-subalgebra Λ_{H_i} ⊆ L_{H_i}, the image of T_{(𝔪)} in L_{H_i} is the localisation of Λ_{H_i} at a height-one prime 𝔪_{H_i} over (T), and c(𝔩, H_i) ≡ 1 + χ(𝔩) mod 𝔪_{H_i} for 𝔩 ∤ 𝔫p and c(𝔩, H_i) ≡ 1 mod 𝔪_{H_i} for 𝔩 | 𝔫p: each H_i specialises at 𝔪_{H_i} to the weight-one form E₁(1, χ_S).

*Hypotheses.* As in L5/hilbert-hecke-reduced.

*Proof sketch.* A reduced noetherian ring of dimension one localised at a height-one prime embeds in the product of its residue fields at minimal primes (Mathlib: reduced rings embed in the product over minimal primes). The minimal primes of T_{(𝔪)} correspond to the Hecke eigensystems in S°(𝔫, χ) ⊗ Frac(Λ)ᵃˡᵍ that specialise into 𝔪, i.e. to cuspidal Hida eigenfamilies; the field of each is generated over Frac(Λ) by its coefficients. The congruences are the description of 𝔪 by its generators.

*Prerequisites.* `PadicFamilies:L5/hilbert-hecke-reduced`, `PadicFamilies:L5/hida-family-fourier-embedding`, `PadicFamilies:L5/lambda-adic-hilbert-forms`, `mathlib:IsReduced`, `mathlib:FractionRing`.

*Check.* Each eigenfamily H_i specialises at 𝔪_{H_i} to E₁(1, χ_S), as the congruences (51) state.

### L4, Milestone 9: arithmetic families

Library module: `TauCeti/NumberTheory/PadicFamilies/ArithmeticFamilies`. The sources are Ochiai, *Euler system for
Galois deformations* (Ann. Inst. Fourier 55, 2005), §1; Kings–Loeffler–Zerbes, *Rankin–Eisenstein classes and explicit
reciprocity laws*, §8.2; and Loeffler–Zerbes, *Rankin–Eisenstein classes in Coleman families*, §§4.6 and 6–7. RS-08
narrows L4 to family Selmer and regulator constructions, big Kato classes and explicit reciprocity, and source-scoped
nonordinary extensions. The family reciprocity law is derived from Kato's, not used to define the family class.

**Construction: Hida's big Galois representation and its nearly ordinary twist** (node `ordinary-big-galois-representation`; planet "Hida's big Galois representation"; Ochiai (AIF 2005) §1, pp. 114–116 (Hida's nearly ordinary Hecke algebra, condition (F) and the basic properties 1)–3) of the Hida deformation); Emerton–Pollack–Weston §2.3, Theorem 2.3.1, p. 13). Let p ≥ 3, Γ = Gal(ℚ_∞/ℚ) for the cyclotomic ℤ_p-extension and Γ′ the diamond group of the tower Y₁(p^t), both identified with 1 + pℤ_p. For a branch of the ordinary Hecke algebra with coefficient ring H^ord_F (a local domain finite flat over ℤ_p[[Γ′]], attached to a Λ-adic eigen newform F), there is a finitely generated torsion-free H^ord_F-module T^ord of generic rank two with a continuous G_ℚ-action, unramified outside a finite set S ∋ p, ∞, with trace(Frob_ℓ) = T_ℓ for ℓ ∉ S. The nearly ordinary Hecke algebra is H^{n.o.}_F := H^ord_F ⊗̂_{ℤ_p} ℤ_p[[Γ]] ≅ H^ord_F[[Γ]], and the nearly ordinary deformation is T := T^ord ⊗̂ ℤ_p[[Γ]](χ̃) ⊗ ωⁱ, with χ̃ : G_ℚ ↠ Γ ⊂ ℤ_p[[Γ]]^× the universal cyclotomic character. Under the hypothesis (F) that T is free of rank two over H^{n.o.}_F with irreducible residual representation: det T is χ̃²χ̃′^{−1} times the inverse cyclotomic character up to finite order, and for an arithmetic point κ of weight w(κ) and 1 ≤ j ≤ w(κ) + 1 the specialisation of T along χ^{j−1} ∘ κ is the twist T_{f_κ} ⊗ χ^j of Deligne's lattice of the normalised eigenform f_κ of weight w(κ) + 2.

*Hypotheses.* p ≥ 3; a branch H^ord_F of the ordinary Hecke algebra; hypothesis (F) for the freeness statements.

*API.*
- `nearlyOrdinaryHeckeAlgebra` (constructor): H^{n.o.}_F = H^ord_F ⊗̂ ℤ_p[[Γ]].
- `hidaBigGaloisRep` (constructor): T^ord with its G_ℚ-action over H^ord_F.
- `nearlyOrdinaryDeformation` (constructor): T = T^ord ⊗̂ ℤ_p[[Γ]](χ̃) ⊗ ωⁱ over H^{n.o.}_F.
- `hidaBigGaloisRep_trace` (characterisation): trace(Frob_ℓ | T^ord) = T_ℓ for ℓ ∉ S.
- `nearlyOrdinaryDeformation_specialise` (compatibility): T ⊗ along χ^{j−1}∘κ is T_{f_κ} ⊗ χ^j.

*Unit tests.*
- `hidaBigGaloisRep_weight_two` (compatibility): At a weight-two point of level Np the specialisation of T^ord is the f-part of the Tate module of J₁(Np) (ModularCurvesPartII R14.2).
- `hidaBigGaloisRep_det` (computation): det T^ord(Frob_ℓ) = ℓ·⟨ℓ⟩ as an element of the diamond algebra, for ℓ ∉ S, up to the finite-order character.
- `nearlyOrdinaryDeformation_twist_degenerate` (degenerate): Specialising the cyclotomic variable at the trivial character recovers T^ord ⊗ ωⁱ.
- `hidaBigGaloisRep_not_free` (non-example): Without (F) the module T^ord is torsion-free of generic rank two but need not be free over H^ord_F (for example when H^ord_F is not Gorenstein); freeness is a hypothesis, not a theorem.

*Proof sketch.* The ordinary parts of the p-adic Tate modules of J₁(Np^t) (ModularCurvesPartII R14.2) form a projective system of H^ord-modules with Galois action; their limit, localised at the branch, is T^ord (Hida's construction; equivalently, the Galois action on the family symbol module of L1 through the comparison of étale and Betti homology). The trace and determinant identities hold at the Zariski-dense set of weight-two points by the Eichler–Shimura relation (ModularCurvesPartII R14.6) and extend by continuity; equivalently, the trace determinant is obtained by interpolating the determinants of the classical points through finite quotients (IntegralHeckeAndGaloisDeterminants IHG.4). Specialisation at an arithmetic point of weight w(κ) + 2 is Deligne's representation by Hida's control theorem (L0/hida-control-theorem) and the Eichler–Shimura comparison at weight w(κ) + 2 through L1's family symbols.

*Prerequisites.* `PadicFamilies:L0/hida-control-theorem`, `PadicFamilies:L0/primitive-components`, `PadicFamilies:L1/ordinary-family-symbol-module`, `PadicFamilies:L1/family-symbol-control`, `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`, `ModularCurvesPartII:R14.6/special-fibre-eichler-shimura`, `IntegralHeckeAndGaloisDeterminants:IHG.4/classical-interpolation`, `PadicMeasuresIwasawaAlgebras:L1/convolution-algebra`.

*Check.* This is the rational (F = ℚ) ordinary big Galois representation; RS-08 named OrdinaryAutomorphicFormsAndModularityLifting R21.3 as owner, but R21.3 is in tier 20 and plans the totally real nearly ordinary representation of Skinner–Wiles; the rational construction moves down here, and R21.3 imports it for F = ℚ.

**Theorem: The ordinary filtration of the big Galois representation at p** (node `ordinary-filtration`; Ochiai (AIF 2005) §1, p. 116, basic properties 4)–5); Emerton–Pollack–Weston §2.3, Theorem 2.3.4(3), p. 16). Under (F), the restriction of T to a decomposition group G_{ℚ_p} has a filtration 0 → F⁺T → T → F⁻T → 0 by H^{n.o.}_F-submodules free of rank one, with F⁺T ≅ ℤ_p[[Γ]](χ̃) ⊗̂ H^ord_F(α̃) ⊗ ωⁱ where α̃ : G_{ℚ_p} → (H^ord_F)^× is unramified with α̃(Frob_p) = A_p and κ(A_p) = a_p(f_κ) at every arithmetic point; F⁻T is unramified up to the twist by the inverse of the determinant character. The filtration specialises at every arithmetic point to the ordinary filtration of T_{f_κ} ⊗ χ^j, and is saturated (the quotient F⁻T is torsion-free).

*Hypotheses.* Hypothesis (F); p-distinguished residual representation for uniqueness of the filtration.

*Proof sketch.* At weight-two points of level Np^t the ordinary part of the Tate module has a connected–étale filtration from the ordinary reduction of the ordinary part of J₁(Np^t) at p (Mazur–Wiles), with unramified quotient on which Frob_p acts by U_p; pass to the limit. The sub and quotient are rank one by (F) and residual p-distinguishedness, and the unramified character α̃ interpolates U_p. Specialisation compatibility follows from the uniqueness of the ordinary filtration of a p-distinguished representation.

*Prerequisites.* `PadicFamilies:L4/ordinary-big-galois-representation`, `ModularCurvesPartII:R14.6/semistable-tate-interface`, `ModularCurvesPartII:R14.2/tate-module-with-galois-and-hecke-actions`.

*Check.* The ordinarity at p of the weight-two Jacobian (Mazur–Wiles) is requested from ModularCurvesPartII R14.6 with the semistable Tate interface; this layer adds only the passage to the limit.

**Definition: Greenberg and Bloch–Kato Selmer groups of the nearly ordinary deformation** (node `family-selmer-groups`; Ochiai (AIF 2005) §1, pp. 116–117, and Proposition A, p. 117). Let A = T ⊗_{H^{n.o.}} Hom_{ℤ_p}(H^{n.o.}_F, ℚ_p/ℤ_p) be the discrete module attached to T and ℚ_S the maximal extension unramified outside S. For a local condition H¹_?(ℚ_p, A) ⊆ H¹(ℚ_p, A), Sel_?(T) is the kernel of H¹(ℚ_S/ℚ, A) → ∏_{ℓ∈S, ℓ≠p} H¹(ℚ_ℓ, A)/H¹_ur(ℚ_ℓ, A) × H¹(ℚ_p, A)/H¹_?(ℚ_p, A). Greenberg's condition is H¹_Gr = ker(H¹(ℚ_p, A) → H¹(ℚ_p^ur, F⁻A)); the Bloch–Kato condition is the limit of the Bloch–Kato finite parts H¹_f on the Φ_{s,t}^{(j,k)}-torsion of A along the height-two ideals of arithmetic points. Under (F): Sel_BK(T) = Sel_Gr(T), independent of (j, k), and its Pontryagin dual is a finitely generated torsion H^{n.o.}_F-module.

*Hypotheses.* Hypothesis (F).

*API.*
- `familySelmer` (constructor): Sel_?(T) ⊆ H¹(ℚ_S/ℚ, A) for a local condition ? at p.
- `familySelmer_greenberg` (constructor): The Greenberg Selmer group Sel_Gr(T).
- `familySelmer_bk_eq_gr` (characterisation): Sel_BK(T) = Sel_Gr(T) under (F).
- `familySelmer_dual_torsion` (structure): The Pontryagin dual of Sel(T) is a finitely generated torsion H^{n.o.}_F-module.
- `familySelmer_specialise` (compatibility): Specialisation along an arithmetic height-two ideal maps Sel(T)[Φ] to the Selmer group of T_{f_κ} ⊗ χ^j with finite kernel and cokernel.

*Unit tests.*
- `familySelmer_unramified_everywhere` (degenerate): With the trivial local conditions everywhere (all of H¹ allowed), the Selmer group is H¹(ℚ_S/ℚ, A); Greenberg's condition is strictly smaller in general.
- `familySelmer_compat_single` (compatibility): For a fixed weight-two form f, specialising Sel_Gr(T) at the cyclotomic variable recovers Greenberg's Selmer group of f over ℚ_∞ (SelmerIwasawaCohomology L2).
- `familySelmer_rank` (computation): The characteristic ideal of the dual is a principal ideal of H^{n.o.}_F when it is a regular ring (for example O[[X₁, X₂]]).
- `familySelmer_not_bk_at_one_weight` (non-example): A Bloch–Kato condition imposed at a single arithmetic point does not define a family Selmer group; the limit over Φ_{s,t} is required.

*Proof sketch.* The Greenberg condition is SelmerIwasawaCohomology L2's Greenberg local condition for the filtration of L4/ordinary-filtration; Selmer groups and their duals are L2's constructions over the coefficient ring H^{n.o.}_F. Equality of the two Selmer groups: at each arithmetic specialisation the ordinary Greenberg condition agrees with the Bloch–Kato finite condition up to finite error controlled uniformly (Ochiai, A generalization of the Coleman map, §4); pass to the limit. Torsionness: specialise to a weight and use Kato's cyclotomic theorem (KatoEulerSystems L4) and the control theorem for Selmer groups (SelmerIwasawaCohomology L3).

*Prerequisites.* `PadicFamilies:L4/ordinary-filtration`, `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/pontryagin-dual`, `SelmerIwasawaCohomology:L3/kernel-control`, `SelmerIwasawaCohomology:L3/greenberg-structure-hypotheses`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`.

*Check.* Under (F) the dual Selmer group is torsion, which is what makes a characteristic ideal and a main conjecture meaningful.

**Construction: The Selmer complex of the nearly ordinary deformation** (node `family-selmer-complex`; Ochiai (AIF 2005) §1, pp. 116–117; Emerton–Pollack–Weston §3.1–§3.2, pp. 23–27). With Greenberg's local condition F⁺T → T at p and unramified conditions at ℓ ∈ S ∖ {p}, Nekovář's Selmer complex RΓ_f(ℚ, T) is a perfect complex of H^{n.o.}_F-modules with H¹ the compact Selmer group and H² a module whose Pontryagin dual is related to Sel(T) up to local error terms; it satisfies derived control: RΓ_f(ℚ, T) ⊗^L_{H^{n.o.}} H^{n.o.}/𝔓 ≅ RΓ_f(ℚ, T ⊗ H^{n.o.}/𝔓) for every height-two arithmetic prime 𝔓, and its determinant gives the characteristic ideal of the Selmer group.

*Hypotheses.* Hypothesis (F); Greenberg conditions.

*API.*
- `familySelmerComplex` (constructor): RΓ_f(ℚ, T) with Greenberg conditions, a perfect complex of H^{n.o.}_F-modules.
- `familySelmerComplex_H1` (characterisation): H¹ of the complex is the compact Selmer module of T.
- `familySelmerComplex_control` (compatibility): Derived base change along H^{n.o.} → H^{n.o.}/𝔓 is the Selmer complex of the specialisation.
- `familySelmerComplex_det` (relation): The determinant of the complex computes the characteristic ideal of the dual Selmer group at height-one primes.

*Unit tests.*
- `familySelmerComplex_perfect` (characterisation): The complex has Tor amplitude in [0, 3] and Euler characteristic zero over H^{n.o.}_F (local Euler characteristic formula with the rank-one Greenberg subspace).
- `familySelmerComplex_specialise_weight_two` (compatibility): At a weight-two arithmetic prime and the trivial cyclotomic character, derived specialisation gives the Greenberg Selmer complex of the weight-two form (SelmerIwasawaCohomology L3).
- `familySelmerComplex_zero_coeff` (degenerate): For the zero representation the Selmer complex is zero.
- `familySelmerComplex_not_bk_complex` (non-example): Replacing the Greenberg condition by the full local cohomology at p gives a complex whose H¹ is the relaxed Selmer group, of generic rank one, so it does not compute the torsion Selmer group.

*Proof sketch.* Instance of SelmerIwasawaCohomology L3's Iwasawa Selmer complex with coefficients the complete local ring H^{n.o.}_F, using the local filtration of L4/ordinary-filtration. Derived control is SelmerIwasawaCohomology L3's derived specialisation with the local correction complexes, which vanish for Greenberg conditions because F⁺T is a direct summand of T as H^{n.o.}-module.

*Prerequisites.* `PadicFamilies:L4/ordinary-filtration`, `PadicFamilies:L4/family-selmer-groups`, `SelmerIwasawaCohomology:L3/infinite-selmer-complex`, `SelmerIwasawaCohomology:L3/derived-control`, `SelmerIwasawaCohomology:L3/correction-complex`, `SelmerIwasawaCohomology:L3/selmer-determinant`.

*Check.* The stage asks for the family Selmer complex 'through R07', now SelmerIwasawaCohomology L3; only the instance is planned here.

**Construction: Beilinson–Kato classes in Hida families** (node `big-beilinson-kato-classes`; planet "Beilinson–Kato classes in Hida families"; Ochiai (AIF 2005) §1, Proposition 1.2 with the de Rham conventions before it, pp. 117–118; Kings–Loeffler–Zerbes §8, pp. 39–44). Under (F), let R be the set of square-free integers prime to S. There is a family Z(r) ∈ H¹(ℚ(ζ_r), T*(1)), r ∈ R, unramified outside the primes above S, with the Euler system norm relations Norm_{ℚ(ζ_{rq})/ℚ(ζ_r)} Z(rq) = P_q(Frob_q) Z(r) for primes q ∤ r, where P_q(X) = det(1 − Frob_q X | T) ∈ H^{n.o.}_F[X] and Frob_q is a geometric Frobenius. For every arithmetic point κ and 1 ≤ j ≤ w(κ) + 1, the specialisation z_{(j,κ)}(1) of Z(1) is Kato's zeta element for f_κ twisted by χ^j, and the dual exponential of its image in H¹_{/f}(ℚ_p, T_{(j,κ)}*(1)) equals L^{(p)}(f*_κ, ω^{i−j}, j)/((2π√−1)^{j−1} C^{(−1)^i}_{∞,κ}) · δ^{dR}_κ, with L^{(p)} the L-function without its Euler factor at p and C^±_{∞,κ} complex periods.

*Hypotheses.* Hypothesis (F); p ≥ 3.

*API.*
- `bigKatoClass` (constructor): Z(r) ∈ H¹(ℚ(ζ_r), T*(1)) for r ∈ R.
- `bigKatoClass_norm` (relation): Norm Z(rq) = P_q(Frob_q) Z(r).
- `bigKatoClass_unramified` (structure): Z(r) is unramified outside the primes above S.
- `bigKatoClass_specialise` (compatibility): Specialisation at (j, κ) is Kato's zeta element of f_κ twisted by χ^j.
- `bigKatoClass_dualExp` (relation): The dual exponential of its local image is the critical L-value over the complex period times δ^{dR}_κ.

*Unit tests.*
- `bigKatoClass_euler_factor` (computation): For q ∉ S, P_q(X) = det(1 − Frob_q X | T) is quadratic with linear coefficient the image of T_q times the value of the twisting characters at Frob_q, in H^{n.o.}_F.
- `bigKatoClass_compat_kato` (compatibility): At a weight-two point and the trivial cyclotomic character, Z(1) specialises to Kato's class z_f of KatoEulerSystems L2.
- `bigKatoClass_r_one` (degenerate): For r = 1 the norm relation is empty and Z(1) is the class whose local image defines the two-variable L-function.
- `bigKatoClass_wrong_frobenius` (non-example): With an arithmetic instead of a geometric Frobenius in P_q the norm relation fails already at a weight-two specialisation, where Kato's relation uses the geometric Frobenius; the convention is part of the definition.

*Proof sketch.* At each level Np^t and each cyclotomic level, Kato's zeta elements of KatoEulerSystems L2 lie in the étale cohomology of the modular curves; their ordinary projections are compatible under the trace maps in the weight (via the moment maps, KatoEulerSystems L1) and in the cyclotomic variable (KatoEulerSystems L2 norm relations). The limit over both towers defines Z(r) in Iwasawa cohomology of T*(1); the norm relations are inherited. The dual-exponential formula at arithmetic points is Kato's explicit reciprocity law (KatoEulerSystems L3) at the specialised form.

*Prerequisites.* `PadicFamilies:L4/ordinary-big-galois-representation`, `KatoEulerSystems:L2/p-adic-zeta-elements-and-their-norm-relations`, `KatoEulerSystems:L1/etale-chern-moment-map-into-modular-local-system`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`.

*Check.* At every arithmetic point the dual exponential of the specialised class is the critical L-value over the complex period (Proposition 1.2(3)).

**Construction: The Perrin-Riou big logarithm in families** (node `family-big-logarithm`; Kings–Loeffler–Zerbes §8.2, Definition 8.2.1 and Theorem 8.2.3 with proof, p. 42 (arXiv v6); Ochiai (AIF 2005) §1, Theorem B, p. 119). Let M be an unramified profinite ℤ_p[G_{ℚ_p}]-module (for example the unramified twist of F⁻T*(1) attached to a Hida family) and D(M) = (M ⊗̂ ℤ_p^{ur})^{G_{ℚ_p}} with Frobenius φ. There is a map L_M : H¹(ℚ_p, M ⊗̂ Λ_Γ(−j)) → D(M) ⊗̂ I^{−1}Λ_Γ, where I is the kernel of specialisation at j = −1, functorial in M and commuting with End_{ℤ_p[G_{ℚ_p}]}(M), with kernel H⁰(ℚ_p, M) and image of the reduction modulo I contained in D(M)^{φ=1}; for M finite free over ℤ_p it is Perrin-Riou's big logarithm. Composed with the projection to the unramified quotient F⁻ of the local cohomology of T*(1), it gives the family Coleman map Ξ : H¹_{/f}(ℚ_p, T*(1)) → H^{n.o.}_F of Ochiai.

*Hypotheses.* M unramified and profinite; Hida-family coefficients for the application.

*API.*
- `bigLogarithm` (constructor): L_M for an unramified profinite M.
- `bigLogarithm_natural` (functoriality): L_M commutes with maps of unramified modules and with End(M).
- `bigLogarithm_ker` (characterisation): ker L_M ≅ H⁰(ℚ_p, M).
- `bigLogarithm_specialise` (compatibility): At characters of Γ it specialises to Bloch–Kato logarithms and dual exponentials with the Euler factors of KLZ.
- `familyColemanMap` (constructor): Ξ : H¹_{/f}(ℚ_p, T*(1)) → H^{n.o.}_F.

*Unit tests.*
- `bigLogarithm_zero` (degenerate): For M = 0 the map is zero.
- `bigLogarithm_trivial_module` (computation): For M = ℤ_p with trivial action, D(M) = ℤ_p, φ = 1, and the kernel is H⁰(ℚ_p, ℤ_p) = ℤ_p.
- `bigLogarithm_compat_perrin_riou` (compatibility): For M finite free over ℤ_p, L_M is Perrin-Riou's regulator (KatoEulerSystems L3 and SelmerIwasawaCohomology L3 conventions).
- `bigLogarithm_not_integral` (non-example): The image is in D(M) ⊗ I^{−1}Λ_Γ, not in D(M) ⊗ Λ_Γ: a pole at j = −1 can occur when D(M)^{φ=1} ≠ 0.

*Proof sketch.* Define N(M) = D(M)[[π]] with φ and its left inverse ψ, use Fontaine's isomorphism H¹(ℚ_p, M ⊗ Λ_Γ(−j)) ≅ (π⁻¹N(M))^{ψ=1} and the exact sequence for 1 − φ; φ is invertible on D(M), so N(M)^{ψ=0} = D(M) ⊗̂ Λ_Γ. Both sides commute with inverse limits, so the case of finite M suffices.

*Prerequisites.* `PadicFamilies:L4/ordinary-filtration`, `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/semilocal-cohomology`.

*Check.* Ochiai's own construction of Ξ (Amer. J. Math. 125, 2003) is not freely available; the family regulator is planned through KLZ's big logarithm, which applies to F⁻T*(1) because it is unramified up to a twist by the cyclotomic variable.

**Theorem: The two-variable p-adic L-function of a Hida family and the family reciprocity law** (node `two-variable-l-function`; planet "Two-variable p-adic L-function (Ochiai)"; Ochiai (AIF 2005) §1, Theorem B with Remark 1.3, pp. 119–120). Under (F), set L_p(T) := Ξ(loc_{/f}(Z(1))) ∈ H^{n.o.}_F (in Frac H^{n.o.}_F, integral when H^{n.o.}_F is integrally closed). Then (1) for every height-one prime 𝔭 of H^{n.o.}_F, length_{(H^{n.o.})_𝔭} (H¹_{/f}(ℚ_p, T*(1))/loc_{/f}(Z(1)))_𝔭 = ord_𝔭(L_p(T)); (2) for every arithmetic (j, κ) with 0 ≤ j − 1 ≤ w(κ), (χ^{j−1} ∘ κ)(L_p(T))/C_{p,κ} equals (−1)^{j−1}(j − 1)!·(1 − ω^{i−j}(p)p^{j−1}/a_p(f_κ))·(p^{j−1}/a_p(f_κ))^{q(i,j)}·G(ω^{j−i})·L(f_κ, ω^{i−j}, j)/((2π√−1)^{j−1}C^{(−1)^i}_{∞,κ}), with C_{p,κ} a p-adic period, G a Gauss sum and q(i, j) the p-order of the conductor of ω^{i−j}. The interpolation is derived from Kato's reciprocity law at each arithmetic point, not imposed as a definition, and on a branch L_p(T) agrees with the Mazur–Kitagawa two-variable L-function of L1 up to a unit of the branch times the ratio of p-adic and complex periods.

*Hypotheses.* Hypothesis (F); H^{n.o.}_F integrally closed for integrality.

*Proof sketch.* (2): specialise Ξ at (j, κ), where it becomes the Bloch–Kato dual exponential with the Euler-like factor (L4/family-big-logarithm), and apply the dual-exponential formula of L4/big-beilinson-kato-classes. (1): the map Ξ is injective with pseudo-null cokernel on the rank-one module H¹_{/f}(ℚ_p, T*(1)) (local Euler characteristic and F⁻ unramified), so lengths at height-one primes are computed by ord_𝔭 of the image. Comparison with L1: both interpolate the same critical values at a Zariski-dense set of arithmetic points up to periods; on a branch, the ratio is a unit times the period ratio (L1/period-change-of-trivialisation).

*Prerequisites.* `PadicFamilies:L4/family-big-logarithm`, `PadicFamilies:L4/big-beilinson-kato-classes`, `PadicFamilies:L1/branch-l-functions`, `PadicFamilies:L1/period-change-of-trivialisation`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`.

*Check.* The family reciprocity law is derived from the single-form reciprocity laws and the construction of Ξ, as the stage requires; it is not a definition of the family class.

**Theorem: Euler system divisibility for the nearly ordinary deformation** (node `euler-system-divisibility`; Ochiai (AIF 2005) §1, Theorem C and the final Theorem, pp. 120–121; §2, Theorems 2.4 and 2.6). Assume (F), that H^{n.o.}_F ≅ 𝒪[[X₁, X₂]] for the ring of integers 𝒪 of a finite extension of ℚ_p, and that there are τ ∈ G_{ℚ(μ_{p^∞})} acting on T by a unipotent matrix (1 P_τ; 0 1) with P_τ ≠ 0 and τ′ ∈ G_ℚ acting by −1. Then there is k ≥ 0 such that for every height-one prime 𝔭 of H^{n.o.}_F, length (Sel(T)^∨)_𝔭 ≤ length (H¹_{/f}(ℚ_p, T*(1))/loc_{/f}(Z(1)))_𝔭 + ord_𝔭(P_τ^k). Combined with L4/two-variable-l-function, char(Sel(T)^∨) divides L_p(T)·P_τ^k: one divisibility of Greenberg's two-variable main conjecture for Hida families, up to the factor P_τ^k.

*Hypotheses.* (F); H^{n.o.}_F a two-variable power series ring; the elements τ, τ′ as stated.

*Proof sketch.* Ochiai's Euler system argument over the deformation ring: Kolyvagin derivative classes are built from Z(r) and controlled at height-two specialisations, where Kato–Rubin's cyclotomic bound applies; the bounds at a Zariski-dense set of height-two primes assemble to a bound at each height-one prime, the defect measured by P_τ. The identification of the right-hand side with ord_𝔭 L_p(T) is L4/two-variable-l-function (1).

*Prerequisites.* `PadicFamilies:L4/big-beilinson-kato-classes`, `PadicFamilies:L4/family-selmer-groups`, `PadicFamilies:L4/two-variable-l-function`, `KatoEulerSystems:L4/imported-euler-system-bound-over-the-cyclotomic-iwasawa-algebra`, `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic`.

*Check.* The hypotheses are visible: when H^{n.o.} is not regular, or no τ with nonzero P_τ exists, no bound is asserted.

**Theorem: Triangulations and the regulator over Coleman families** (node `coleman-family-regulator`; Loeffler–Zerbes (Coleman families) §4.6, Theorem 4.6.6, p. 22; §6.3, Definition 6.3.1 and Theorem 6.3.2, pp. 29–30; §6.4, Theorems 6.4.1–6.4.2, p. 30; §7.1, Theorems 7.1.4–7.1.5, p. 31 (arXiv v2)). Let f_α be a noble refined eigenform (p-regular and non-critical slope) of weight k + 2 and F the Coleman family through it over an affinoid disc V of weight space (PadicFamilies L2), with Galois representation M_V(F)* over O(V). After shrinking V: (1) the (φ, Γ)-module D†_rig(M_V(F)*) over the Robba ring over O(V) admits a canonical triangulation 0 → F⁺D → D → F⁻D → 0 with F⁻D ≅ R_{O(V)}(α_F⁻¹) and F⁺D a rank-one module given by α_F·ε_F(p)⁻¹ twisted by 1 + κ_V; (2) there is an O(V)-basis vector ω_F of (F⁻D(1 + κ_V + ε(p)_F))^{Γ=1} specialising at each classical weight t to the differential of f_t (Eichler–Shimura in families); (3) the Perrin-Riou regulator of the rank-one quotient is defined over O(V) ⊗̂ O(𝒲) and specialises at classical points to Bloch–Kato logarithms or dual exponentials with explicit Euler factors. No constant-dimension crystalline module over the whole eigencurve neighbourhood is asserted: the triangulation exists only after shrinking around a noble point.

*Hypotheses.* f_α noble; V a sufficiently small affinoid disc around its weight.

*Proof sketch.* Liu's triangulation theorem for families of refined trianguline representations gives (1) at a non-critical point, after shrinking V. (2) is Andreatta–Iovita–Stevens's overconvergent Eichler–Shimura comparison composed with projection to F⁻ (Sen theory in families). (3) is the regulator for rank-one (φ, Γ)-modules over Robba rings over affinoids (Kedlaya–Pottharst–Xiao), applied to F⁻ and paired with ω_F.

*Prerequisites.* `PadicFamilies:L2/modular-symbol-eigencurve`, `PadicFamilies:L2/etale-point-free-rank-one`, `PadicFamilies:L4/family-big-logarithm`, `KatoEulerSystems:L3/dual-exponential-map-on-the-modular-local-system`.

*Check.* The theorem is source-scoped as RS-08 requires: it covers Coleman families through noble points, with the triangulation hypothesis visible; the construction of Galois representations over the eigencurve and Liu's and Kedlaya–Pottharst–Xiao's theorems are imported as recorded inputs (gap 'Nonordinary family inputs').

## Dependencies

- **Within this roadmap.** L0a supplies L0, L1 and L5 (RS-08). L0 supplies L1, L4 and L5. L2a supplies L2, and L2
  supplies L3 and L4 (the Coleman-family regulator). L1 supplies L4 (the comparison of two-variable L-functions) and
  the period formalism of L5.
- **L0a imports:** AdicSpacesPartII F0; ArithmeticGaloisDuality R02.1; DeformationAndDerivedPatchingAlgebra P7 (node
  ids); IntegralHeckeAndGaloisDeterminants IHG.2 (node ids).
- **L0 imports:** ModularCurvesPartII R12.5 and R13.2 (requested); PadicMeasuresIwasawaAlgebras L1 (requested);
  DirichletPadicLFunctions L4 and ModularSymbolsPadicLFunctions L2 (node ids); Tau Ceti's `HeckeRing.GL2` newforms.
- **L1 imports:** ModularSymbolsPadicLFunctions L0–L2 (node ids); ModularCurvesPartII R14.3, R14.4, R14.6 and
  TauCetiRoadmap ModularForms Layer 8 (requested or node ids).
- **L2a imports:** LocallyAnalyticDistributions L4 (node ids); AdicSpacesPartII R0, R2, R3 and PadicMeasuresIwasawaAlgebras
  L0a (requested); IntegralHeckeAndGaloisDeterminants IHG.0 (node ids).
- **L2 imports:** PadicMeasuresIwasawaAlgebras L0a (requested); ModularSymbolsPadicLFunctions L0 and L2 and
  LocallyAnalyticDistributions L4 (node ids).
- **L3 imports:** ModularSymbolsPadicLFunctions L2, LocallyAnalyticDistributions L2 and L4 (node ids); GlobalGaloisDeformations
  R04.3 (requested).
- **L4 imports:** SelmerIwasawaCohomology L2–L3, KatoEulerSystems L1–L4, ModularCurvesPartII R14.2 and R14.6,
  IntegralHeckeAndGaloisDeterminants IHG.4 and PadicMeasuresIwasawaAlgebras L1 (node ids).
- **L5 imports:** HilbertModularVarietiesAndShimuraCurves R18.3, GL2AutomorphicRepresentationsAndTransfer R16.6,
  HodgeTateAndCanonicalSubgroups T5 and PadicMeasuresIwasawaAlgebras L1 (node ids or requested).
- **Consumers:**
  - of L0a: OrdinaryAutomorphicFormsAndModularityLifting R21.1–R21.2, PotentialAutomorphyInfrastructure PA.2,
    AutomorphicCongruences L2s, GeneralizedHeegnerCycles GH.3, and the higher Hida and Coleman theory of Pilloni and
    BCGP;
  - of L0 and L5: OrdinaryAutomorphicFormsAndModularityLifting R21.2–R21.3 (which import the quaternionic towers and,
    for F = ℚ, the big Galois representation from here), AutomorphicCongruences L5w;
  - of L1: AutomorphicCongruences L0–L1, SerreWeightAndLevelOptimisation R20.1 and IntegralIwasawaTheory I.5 (the
    generic congruence module), GeneralizedHeegnerCycles GH.7, HeegnerPointEulerSystems HE.8, RankZeroOneBSD BSD.6a,
    AutomorphicPadicLFunctions L4;
  - of L2a: AutomorphicGaloisRepresentationsPartII AG2.3 and AutomorphicPadicLFunctions L4e;
  - of L3: ModularSymbolsPadicLFunctions L3;
  - of L4: AutomorphicCongruences L2.

## Acceptance tests

- **L0a:**
  - e = U^{n!} with the explicit threshold |M| (or |M/J|).
  - Mathlib's Fitting decomposition is recovered.
  - The ZMod 6 test separates e from "1 if U is invertible".
  - Topological nilpotence without a uniform exponent (ℤ_p, U = p).
  - The failure test R = ℂ, U = 2.
  - The shift non-example for compact modules.
  - Exactness for finite, profinite and limit sequences.
  - Khare–Thorne Lemmas 2.10–2.12 and Proposition 2.15 as stated, with T₂ acting on the target (E10).
  - No averaging over a group order, and no supplied idempotent in place of the construction.
- **L2a:**
  - The nilpotent structure of Z_φ is kept.
  - The corrected Lemma 4.5 passes the P = 1 + uT counterexample.
  - Flatness is kept in the base-change comparison.
  - Links are genuine intertwinings.
  - Eigenpackets are classified as points, not as unique eigenvectors.

- **L1:**
  - The Eisenstein case is excluded.
  - Periods are trivialisations, unique up to units.
  - Specialisation holds up to O(℘)^× only.
- **L5:**
  - Λ′_𝒪 for F = ℚ has two variables.
  - The torsion of G(U) is not a weight variable.
  - Freeness is proved over Λ′_𝒪, and the rank formula is flagged (E11).
  - The control theorem gives parallel weights only.

- **L0:**
  - Λ-adic forms are q-expansions in I[[q]] specialising to classical forms at every weight k ≥ 2, and their module is
    dual to h^ord; the Eisenstein family is not a cusp form.
  - Primitive components are fields; the non-primitive part of h^ord ⊗ L need not be semisimple.
- **L0a (Pilloni and BCGP):**
  - The shift on a completed direct sum is not locally finite; the diagonal p^i-scaling is, with e(T) the projection onto
    the first coordinate and no single power T^{N!} equal to it.
  - Pilloni's Remark 2.1.1: local finiteness does not pass to arbitrary submodules.
  - The ordinary direct factor is independent of the representative only up to canonical quasi-isomorphism, and only
    when it is perfect.
- **L2a:**
  - The characteristic polynomial of an endomorphism of a non-free invertible ideal is 1 − aX.
  - The spectral variety Z of a complex removes the contractible part that Z̃ sees (the cone test).
  - The Jordan-block test keeps nilpotents in the eigenmodule sheaf.
- **L2:**
  - Classical points of slope < k + 1 are classical eigensystems; at slope k + 1 the specialisation need not be injective.
  - The fibre of the eigensymbol sheaf has dimension e at a decent critical point.
  - κ^± is locally finite and flat, not finite.
  - Specialisation of family symbols is stated with its Tor terms (E14).
- **L1 (additions):**
  - Ψ_λ(A) ≅ ℤ/pⁿ for ℤ_p ×_{ℤ/pⁿ} ℤ_p; Ψ_λ(A) is not torsion for the dual numbers.
  - L_Σ and L(ρ̄, 𝔞) agree modulo 𝔞 up to a unit times the Euler factors at Σ.
- **L4:**
  - Hypothesis (F) is visible wherever freeness of T is used.
  - The Beilinson–Kato classes specialise to Kato's at every arithmetic point; the family reciprocity law is derived.
  - Theorem C's bound carries the factor P_τ^k and the hypothesis that H^{n.o.} is a two-variable power series ring.
  - The Coleman-family regulator exists only after shrinking around a noble point.
- **L5 (additions):**
  - The quaternionic ordinary projector kills the constants and needs no division by #G(U_a).
  - Period modules are invertible only under an explicit freeness hypothesis.
  - Reducedness of T_(𝔪) uses cond(χ) = tame level.

## Source issues

The packet records fourteen findings.
- **E1–E9:** Buzzard's manuscript.
  - E1: (n − d)t for (n − d) log t in Lemma 4.5.
  - E2: the printed witness identities X ∩ W = ∅ and X ∪ V = B.
  - E3: the missing n = 0 condition.
  - E4: the induction hypothesis of Theorem 4.6.
  - E5: the coprimality of Q with F_A/Q in §5.
  - E6: Lemma 2.13 cited for Lemma 2.12 in Lemma 5.6.
  - E7: the mis-indexed links of Construction 5.7.
  - E8: the reduction step in Lemma 5.9.
  - E9: the admissibility argument in Lemma 5.5.

  All nine were recorded in the reviewed decomposition's nodes and gap entries. They were re-read here against the
  text layer and are now filed as source issues.
- **E10:** Khare–Thorne print T₂ ∈ End_R(M) in Lemma 2.10(2), and T₂ ∈ End_R(C•) in Lemma 2.11(2). The target's
  endomorphism is meant.
- **E11 (gap, reaches a stated result):** Skinner–Wiles Proposition 3.3 states a rank
  rank_𝒪 eH⁰(X(U⁰_1), 𝒪) × #G(U)_tors, and its proof says it "clearly suffices" to argue without e. Dropping e gives
  only projectivity over 𝒪[G(U_a)]. The e-part is free of that rank only if all characters of the prime-to-p torsion
  of G(U_a) contribute equal 𝒪-rank, which the proof does not compare. Freeness over Λ′_𝒪, the only form used downstream,
  does follow. Hida's cited [H2] was not obtained.

- **E12 (gap, the proof):** Bellaïche admits the Eichler–Shimura isomorphism for modular symbols (Proposition 3.6),
  saying no complete proof is in the literature. The cuspidal part is ModularSymbolsPadicLFunctions L0's
  Eichler–Shimura isomorphism; the Eisenstein part matters only for the sign of Eisenstein points and Proposition 3.18.
- **E13 (gap, the proof):** Pilloni's §2 assumes a complete local coefficient ring but is applied to the semi-local
  ℤ_p[[ℤ_p^×]]; it is read factor by factor, with "perfect" meaning finite projective (L0a/semilocal-ordinary-projector).
  The extraction PAPER-PILLONI-20 records the same issue (its E5).
- **E14 (error, the proof):** Bellaïche's description (10) of modular symbols as a finite sum of invariants over
  representatives of Δ₀/Γ is wrong as written (there are infinitely many orbits, and symbols are additive). Its
  consequences, property (Pr) and exact specialisation, need the Manin-relations presentation and, for specialisation
  at a weight, the universal-coefficients comparison with its Tor terms; L2/family-modular-symbols states the
  specialisation map with those terms.

## Open items

Each layer is planned; these are the refinements and recorded gaps that remain.
- **L0** (planned):
  - Katz's p-adic modular functions and the q-expansion principle are imported through Hida's review and ModularCurvesPartII R13.2 (request); Katz's own papers (Ann. of Math. 101, 1975; Antwerp III) are not freely available and their proofs are not decomposed.
  - Finite flatness and Gorenstein questions for residually localised components (Hida §§5–6, Mazur–Tilouine) are not planned; no node assumes a localised Hecke algebra Gorenstein.
  - Hida's theory for p = 2, 3 (where Theorem 3.1 needs p ≥ 5) is not planned.
- **L0a** (closed): nothing remains.
- **L1** (planned):
  - Hida's homology control theorems (gap 'Hida's control theorems for ordinary homology of X₁(Np^r)').
  - The residually reducible (Eisenstein) case, where M_𝔪 and the relative homology limit differ, is not planned.
  - Iyengar–Khare–Manning's higher-codimension congruence modules (Ψ_A(M) via Ext^c) are not planned here; they belong to the proposed Part II of DeformationAndDerivedPatchingAlgebra on congruence modules (paper route of PAPER-IYENGAR-KHARE-MANNING-24).
- **L2** (planned):
  - The comparison with the Coleman–Mazur–Buzzard eigencurve of overconvergent forms rests on unplanned inputs (gap 'Coleman's overconvergent modular forms and Chenevier's comparison theorem').
  - Equidimensionality is imported from L2a/equidimensional-components, whose density statement carries the gap 'Dimension theorem narrowed'.
  - Prove or correct Bellaïche's Proposition 3.3(iii) (specialisation of family symbols is an isomorphism) without his (10): via the Manin-relations presentation and the universal-coefficients spectral sequence for compactly supported cohomology (Hansen, J. reine angew. Math. 730, 2017, not read), identifying the Tor terms on slope-≤ν parts (E14).
- **L2a** (planned):
  - Decompose the imported formal-model inputs (gap 'Formal-model finiteness'): Bosch–Lütkebohmert I Proposition 4.7 and II Theorem 5.2, Corollary 5.3 (now in the maintainer's cleared library), and Conrad A.1.2/A.1.4.
  - Refine strict-slope-neighborhoods and admissible-slope-cover to the corrected inequalities of Buzzard Lemma 4.5 and the strengthened induction of Theorem 4.6 (sourceIssues E1–E4).
  - The dimension and density statements of equidimensional-components (gap 'Dimension theorem narrowed').
- **L3** (planned):
  - Inputs cited by Bellaïche and not decomposed: Breuil–Emerton ((iii) ⇔ (v) of Proposition 2.12), Bellaïche–Chenevier (Eisenstein criticality), Coleman's limit control theorem, Chenevier's smoothness argument, and the vanishing of H¹_g in Proposition 2.15's cases (requested from GlobalGaloisDeformations R04.3).
  - Pollack–Stevens, Critical slope p-adic L-functions (J. LMS 2013) was not obtained; its non-θ-critical construction is used through Bellaïche's restatement.
- **L4** (planned):
  - Primary proofs of Hida's and Wiles's big Galois representation and ordinary filtration (gap).
  - Ochiai's Coleman map and length formula (Amer. J. Math. 2003) and his Compositio (2006) sequel (gap).
  - Nonordinary inputs: Galois representations over the eigencurve, Liu's triangulation, Kedlaya–Pottharst–Xiao (gap).
- **L5** (planned):
  - Hida's control theorem in weight μ + 2 > 2 (gap; Hida, Adv. Stud. Pure Math. 17, 1989, Corollary 2.5 unread).
  - Instantiation of L0a on the indefinite Hilbert and Shimura-curve cohomology of HilbertModularVarietiesAndShimuraCurves R18.4, with residual localisation and trace in p-power level, beyond the definite quaternionic towers and the Λ-adic q-expansions planned here.
  - Wiles's construction of Λ-adic Hilbert forms and their freeness over Λ (Invent. Math. 94, 1988) is used through Dasgupta–Kakde–Ventullo's restatement and is unread.

**Recorded gaps.**
- *Formal-model finiteness beyond the existing geometric outline* (needed by `L2a/constant-rank-finiteness`, `L2a/admissible-slope-cover`).
- *Coleman's overconvergent modular forms and Chenevier's comparison theorem* (needed by `L2/coleman-mazur-comparison`).
- *Dimension theorem narrowed; dense classical points still require separate inputs* (needed by `AG2.3`, `L2/modular-symbol-eigencurve`, `L2a`).
- *Hida's control theorem for nearly ordinary Hilbert forms in weight μ + 2 > 2* (needed by `L5/hida-control-nearly-ordinary`).
- *Hida's control theorems for ordinary homology of X₁(Np^r)* (needed by `L1/family-symbol-control`).
- *Hida's and Wiles's constructions of the big Galois representation and its ordinary filtration (primary proofs unread)* (needed by `L4/ordinary-big-galois-representation`, `L4/ordinary-filtration`).
- *Ochiai's two-variable Coleman map and the length formula* (needed by `L4/two-variable-l-function`, `L4/family-big-logarithm`).
- *Nonordinary family inputs: Galois representations over the eigencurve, Liu's triangulation and Kedlaya–Pottharst–Xiao* (needed by `L4/coleman-family-regulator`).

## Sources

- **Khare–Thorne,** *Potential automorphy and the Leopoldt conjecture*, arXiv:1409.7007v2 (Amer. J. Math. 139
  (2017)). Read §2.2 and §2.4.
- **Allen et al.,** *Potential automorphy over CM fields*, arXiv:1812.09999v2 (Ann. of Math. 197 (2023)). Read
  §§5.1–5.2.
- **Hida,** *Iwasawa modules attached to congruences of cusp forms*, Ann. Sci. ÉNS (4) 19 (1986), 231–273, Numdam.
  Read the introduction and §1.
- **Buzzard,** *Eigenvarieties*, author manuscript of 2 August 2006. Read §§2–5 and the opening of §6.
- **Conrad,** *Modular curves and rigid-analytic spaces*, author manuscript (2006). Read Appendix A.1.
- **Chenevier,** *Familles p-adiques de formes automorphes pour GL_n*, author copy. Read §§6.2–6.4 as cited.
- **Emerton–Pollack–Weston,** *Variation of Iwasawa invariants in Hida families*, arXiv:math/0404484v1 (Invent. Math.
  163 (2006)). Read §2.1 and §§4.1–4.2.
- **Skinner–Wiles,** *Residually reducible representations and modular forms*, Publ. Math. IHÉS 89 (1999), 5–126,
  Numdam. Read §2.2 (δ_F), §2.5 and §3.2.
- **Coleman–Mazur,** *The eigencurve*, Internet Archive capture of the authors' preprint. Read §1.1, §1.3 and
  §§7.1, 7.4–7.5 (statements).
- **Hida,** *Iwasawa modules attached to congruences of cusp forms*: additionally §3 (Theorems 3.1, 3.5, 3.6, Corollaries
  3.2, 3.7, 3.8, Proposition 3.4) and §4, Corollary 4.2.
- **Bellaïche,** *Critical p-adic L-functions*, arXiv:0912.2925v1 (Invent. Math. 189 (2012)). Read §§1–4.
- **Emerton–Pollack–Weston:** additionally §2.3 (statements), §§2.6–2.8 and §§4.2–4.3.
- **Pilloni,** *Higher coherent cohomology and p-adic modular forms of singular weights*, Duke Math. J. 169 (2020),
  author's copy. Read §2 and §13.1–13.2.
- **Boxer–Calegari–Gee–Pilloni,** *Abelian surfaces over totally real fields are potentially modular*,
  arXiv:1812.09269v3 (Publ. Math. IHÉS 134 (2021)). Read §2.11, §6.1.1 and §6.3.15–6.3.16.
- **Dasgupta–Kakde–Ventullo,** *On the Gross–Stark conjecture*, Ann. of Math. 188 (2018), 833–870 (free from the
  journal). Read §3.1, §3.3 (opening) and §4 with Theorem 4.1.
- **Ochiai,** *Euler system for Galois deformations*, Ann. Inst. Fourier 55 (2005), 113–146 (open access). Read §1.
- **Kings–Loeffler–Zerbes,** *Rankin–Eisenstein classes and explicit reciprocity laws*, arXiv:1503.02888v6 (Cambridge
  J. Math. 5 (2017)). Read §8.2.
- **Loeffler–Zerbes,** *Rankin–Eisenstein classes in Coleman families*, arXiv:1506.06703v2 (Res. Math. Sci. 3 (2016)).
  Read §4.6 (statement), §§6.3–6.4 and §7.1 (statements).
- **Iyengar–Khare–Manning,** *Congruence modules and the Wiles–Lenstra–Diamond numerical criterion in higher
  codimensions*, arXiv:2206.08212v3 (Invent. Math. 238 (2024)). Read Lemma 2.7 to Example 2.11.

Sources not obtained: Hida, Invent. Math. 85 (1986) and Amer. J. Math. 110 (1988); Wiles, Invent. Math. 94 (1988);
Ochiai, Amer. J. Math. 125 (2003) and Compositio Math. 142 (2006); Coleman, Invent. Math. 124 (1996); Chenevier, Duke
Math. J. 126 (2005); Liu, Comment. Math. Helv. 90 (2015); Kedlaya–Pottharst–Xiao, J. Amer. Math. Soc. 27 (2014).
