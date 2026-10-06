# Number-field Habiro rings, finite regulators and K₃-graded modules

The Habiro ring of a number field connects finite Chern classes with Taylor
expansions at roots of unity. Its coefficients live in full cyclotomic
algebras. A Frobenius condition glues the expansions at adjacent root orders;
a class in K₃ changes the gluing by a Kummer line and a local regulator.
The aim is to build these rings and indexed modules with enough arithmetic,
evaluation and functorial API to support Nahm-series constructions.

Suggested home: `TauCeti/NumberTheory/Habiro/`. This document specifies the
mathematics. The accompanying [suggested Lean file](../suggested/HabiroNumberFields.lean)
offers signatures and concrete acceptance examples; it is not an exhaustive
implementation checklist. All roadmap declarations are unchecked. The remaining
supplier and proof obligations are stated at the consumers below.

## Scope and boundaries

The four layers cover finite regulators and ordinary unit eigenclasses
(HB.1), the cyclic quantum dilogarithm and its comparison with finite Chern
classes (HB.2), the arithmetic ring and its classical Taylor comparison
(HB.6), and the local and global K₃-indexed modules (HB.7). The numbering
preserves the surrounding Habiro programme: HB.3–HB.5 and HB.8–HB.9 are in
HabiroNahmSeries.

The neighboring roadmaps supply distinct objects. Their declarations are
imported by exact node id wherever the interface exists.

| Supplier or consumer | Boundary |
|---|---|
| [K3BlochGroups](K3BlochGroups.md), V.2–V.6 | Owns Milnor/indecomposable K₃, Suslin’s sequence, Bloch conventions, configuration homology and finite-field comparisons. HB.1 uses the coefficient comparison; HB.2 owns the cyclic-dilogarithm regulator and its exterior finite-coefficient Bloch interface. |
| [ArithmeticKTheory](ArithmeticKTheory.md), N.1/N.3/N.5/N.6 | Supplies S-integers, K-group finiteness, Soulé’s arithmetic inputs and Keune’s cyclotomic Picard injection. The original Keune proof obligation remains with N.6. |
| [MotivicEtaleKTheory](MotivicEtaleKTheory.md), M.1/M.3/M.7/M.8 | Owns twists, the weight-one étale Kummer sequence, Tate’s K₂ comparison, étale K-theory and generic finite Chern classes/products. An early finite-Chern prefix of M.8 is required with M.7 as its stage prerequisite. The late whole M.8 stage cannot be imported into HB.1/HB.2. |
| [StableHomotopyKTheory](StableHomotopyKTheory.md), H.6; [GeneralAlgebraicKTheory](GeneralAlgebraicKTheory.md), K.2/K.3/K.7 | Own finite coefficients/Bocksteins, ring functoriality, transfer and products. HB.2 specializes the product and homology interfaces; HB.7 transports the arithmetic section data. |
| Tau Ceti [ProfiniteCohomology](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ProfiniteCohomology), layers 5 and 9 | Supplies positive-degree continuous inflation–restriction and the surjective Kummer comparison. These are HB.1/HB.2 inputs, separate from the explicit ring gluing in HB.6. |
| Tau Ceti [Chebotarev](https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Chebotarev), layer 10 | Supplies prime selection in a finite Galois compositum and removal of finite exceptions. HB.2 proves compatibility of the prescribed restrictions and the Kummer detection argument. The interface is recorded in [CH-L16](../links/tauceti_TauCetiRoadmap_Chebotarev.json). |
| [HabiroCyclotomicCompletions](HabiroCyclotomicCompletions.md), HC.1/HC.3–HC.5 | Owns cyclotomic completions, convergent re-expansion, Taylor maps, integral lattice detection, injectivity and infinite CRT. HB.6 specializes these maps to the arithmetic coefficient system. |
| [HabiroRings](HabiroRings.md), HR.1/HR.5 | HR.1 owns the étale Frobenius lift. The exact HR.5/the-ell-adic-taylor-comparison is a generic full-factor chart with baseline prerequisites and can be imported here. The HR.5 number-field specialization consumes HB.6; it is not an input to its own construction. HR.6 consumes the indexed module comparisons. |
| [PadicHodgeRegulators](PadicHodgeRegulators.md), D.1/D.3/D.4 | Owns Coleman’s functions, valid unramified K₃ presentations, integral regulator estimates and scalar/trace/Frobenius comparisons. HB.7 applies these to sections; it does not construct another regulator. |
| [QSeriesPartitionsAndMockModularForms](QSeriesPartitionsAndMockModularForms.md), QM.0/QM.1; [Polylogarithms](Polylogarithms.md), P.1 | Own common complex q-product/bilateral estimates, the Dedekind eta phase and the branch-qualified classical five-term identity. HB.2 requests the precise analytic exports used in its KMS proof. |
| [HabiroNahmSeries](HabiroNahmSeries.md), HB.4/HB.5/HB.9 | Owns radial Nahm asymptotics and the unconditional scalar-two assembly after HB.4/acceptance-andrews-gordon. HB.2 exports ε_m=c_m² at every order and the conditional scalar implication. No HB.4→HB.2 edge is used. |

## Conventions and existing library input

Use Mathlib `NumberField`, `NumberField.discr`, `NumberField.Units`,
`IsPrimitiveRoot`, `AdjoinRoot`, `AdicCompletion`, `PowerSeries`,
`Module.Invertible`, `CommRing.Pic` and `Algebra.norm`. Power classes and the
positive Kummer cocycle use Tau Ceti’s `powerClassQuotient`, `powerClassHom`
and `kummerClassMap`. The reviewed [library audit](../audit/AUDIT-28.result.json)
finds the four layers unbuilt. Dirichlet’s unit basis, cyclotomic characters,
completion infrastructure and the injective Kummer map already exist; they
are inputs rather than new targets. The audit’s positive-degree continuous
cohomology qualification is essential: the explicit-to-canonical comparison
is available in degree zero, and further comparisons belong to its owner.

The library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`
and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

* For HB.1/HB.2 write F for a number field, L=F(ζ_n), G=Gal(L/F),
  and U=O_L×. The cyclotomic character is fixed by σζ=ζ^χ(σ), using
  `IsPrimitiveRoot.autToPow`. The χ^a-part of a Z/n-module is the
  intersection of the equations σv=χ(σ)^a v. Averaging is permitted only
  when |G| is a unit in Z/n. A unit eigenclass need not have an eigenunit
  representative.
* A complex unit multiplicity uses an actual complex character η. At an
  odd unramified prime it specializes through the inverse Teichmüller lift.
  There is no interpretation of a general composite-modulus χ as a complex
  scalar character. The residual inverse-character dimension is r₂(F),
  with one extra torsion dimension at p=3.
* Write B for Suslin’s group, B_new for the published CGZ modified-boundary
  group and B_old for its repaired arXiv-v3 exterior convention. The
  canonical B→B_new→B_old maps become isomorphisms modulo positive odd n.
  Transport from K₃/n also requires gcd(n,w_F)=1. In the exterior formulas
  below, B_CGZ and A(F;Z/n) mean B_old and A_old. The published version is
  reached by these specified coefficient maps. Keep the degenerate symbol
  [0], including the cubic eta class.
* D_ζ(X)=∏_{1≤k<n}(1−ζ^k X)^k is the CGZ polynomial. GSWZ’s analytic
  normalization is its chosen n-th root, denoted D_ζ^GSWZ. Hence
  D_ζ(1)^24=n^(12n), whereas (D_ζ^GSWZ(1))^(24n)=n^(12n).
  The finite hypergeometric products start at ζy and ζx.
* The Kummer cocycle, bar class and Bott Bockstein are positive. Raw
  Soulé’s degree-(2,1) product has a minus sign. At N=ℓ^m, ℓ an odd
  prime and m≥1, it evaluates eta to [ζ⁻¹]; the independently negated
  degree-(2,1) map evaluates to [ζ]. The fixed CGZ/GSWZ map has a separate
  normalization comparison obligation. Its every-order export is
  ε_m(ξ)=c_ζm(ξ)²; inverting c inverts ε_m.
* In HB.6/HB.7 write K for the number field, Δ>0 with |disc K| dividing
  Δ, and R=O_K[1/Δ]. HB.7 also requires 6 dividing Δ. Keep the full
  algebra A_m(R)=R[t]/Φ_m(t)=R⊗_Z Z[ζ_m], even when it splits.
  Completion at an inverted prime is the zero ring.
* Choose ζ_mm′=ζ_mζ_m′ when m,m′ are coprime and ζ_{p^r}^p=ζ_{p^{r−1}}.
  The transition exponent e(p,m), for m=p^k m′, satisfies e≡p modulo
  p^(k+1) and e≡1 modulo m′. Standard exponential roots do not satisfy
  the required closeness. Every finite-Chern divisibility comparison
  keeps its own power-compatible roots; convert to the arithmetic root
  system by the stated root-change law.
* The additive coordinate is x=q−ζ_m. The multiplicative coordinate is
  q=ζ_m(1−u), so x=−ζ_m u; coefficient l−1 rescales by
  (−ζ_m)^(l−1). Finite Taylor truncation keeps precisely m*(k+1)<N.
* Ring gluing uses φ_p⊗1, fixing the abstract ζ_m and x. Local section
  defects use the extension sending ζ_m to ζ_m^p. These are different
  maps. Re-expansion by ζ_pm−ζ_m uses topological nilpotence and a
  complete coefficient algebra; it is not formal `PowerSeries.subst`.
* An invertible local section has a unit constant term, an integral
  linear coefficient and rational higher coefficients. Its completed
  logarithmic defect lies in (p/x)R̂_p[ζ_m][[x]]. The local module is
  their span and includes zero. In the half-shift expansion the formal
  square root of q^m has constant one; for even m it differs from the
  monomial q^(m/2) at some roots.
* The global line target is finite projective of rank one. Effective
  additive descent, actual base changes and conservative charts are
  separate obligations. Tensor bijectivity yields a finite sum
  ∑ f_i g_i=1, not a global unit generator. Scalar extension is
  H_S⊗_(H_R)H_(R,ξ). K₃ transfer changes the grade additively;
  section norm is multiplicative and takes the determinant of the whole
  power series in a finite free full coefficient algebra.

## Sources

The main sources are Calegari–Garoufalidis–Zagier (CGZ), *Bloch groups,
algebraic K-theory, units, and Nahm’s conjecture*,
[published version](https://math.uchicago.edu/~fcale/papers/CGZ.pdf)
(Ann. Sci. Éc. Norm. Supér. 56 (2023), 383–426), and
[arXiv v3](https://arxiv.org/pdf/1712.04887v3); Garoufalidis–Scholze–Wheeler–Zagier
(GSWZ), [*The Habiro ring of a number field*, v2](https://arxiv.org/pdf/2412.04241v2);
Garoufalidis–Zagier (GZ), [*Asymptotics of Nahm sums at roots of unity*](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf),
published Appendix A; Hutchinson’s [2013 preprint v2](https://arxiv.org/pdf/1107.0264v2)
and [2024 preprint v4](https://arxiv.org/pdf/2104.14413v4); and
[Soulé’s thesis transcription](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf).
Published CGZ and arXiv CGZ have different integral Bloch conventions;
Hutchinson’s preprint is not represented as a checked version of record.
The thesis supplies inspected Chern normalizations without implying that
the Inventiones version was read. Supporting Habiro, Wagner and library
references are listed with their precise editions in the bibliography.

Source corrections are applied in the targets, including the cubic torsion
count, inverse root-change exponent, GZ Gaussian numerator and eta phase,
the integral linear section shape, the inverse abelian Frobenius embedding,
and the full-factor domain qualification. The packets retain the source
issue records and locators; they do not replace a missing source proof by a
numerical test.

## Layer overview

| Layer | Result and principal consumers | Outstanding proof interfaces |
|---|---|---|
| HB.1 | Finite Chern maps in weight two, ordinary unit eigenclass lifts and the corrected prime-unit dimension; HB.2 and the finite regulator interface consume them. | Original Keune proof, early finite-Chern prefix, continuous Kummer and weight-one compatibility. |
| HB.2 | Cyclic polynomial, hypergeometric identity, regulator descent, eta/bar specialization, signed Chern evaluation and ε_m for every m; HB.4 and HB.7 consume these. | Generic analytic estimates, fixed source-sign comparison and inherited Bass–Tate proof. The unconditional scalar-two assembly is HB.5’s. |
| HB.6 | Frobenius-glued ring, local prime-to-p splitting, full Taylor image, arithmetic rational comparison, components and abelian embedding; HB.7 and HR.5 consume these. | The scoped ring targets have explicit proof routes and exact generic suppliers. The first global-completion isomorphism in GSWZ (14) is outside the local comparison claim. |
| HB.7 | Corrected local sections, first jet, local freeness, global descent/tensor/Picard targets, field pullback and norm transport; HR.6 and HB.9 consume them. | Effective global descent, arithmetic torsor naturality, and higher local/presentation inputs. |

The targets below are ordered within each layer by prerequisites. Definition
and construction APIs list the uses that determine their shape and the
examples that distinguish the intended object. Theorem acceptance criteria
remain proof obligations. Source locators refer to the editions above.

## HB.1 — Finite Chern classes and ordinary unit eigenclasses

The finite regulator starts with the convention maps supplied by V.3, then uses the
cyclotomic character and weight-one Kummer theory to describe its target. The Picard
obstruction is removed on twisted coinvariants by the N.6 Keune injection, followed by
finite-module vanishing. Total ramification gives a trivial valuation image and lifts
the inverse-character p-unit class to ordinary units. This lift does not use an averaging
projector at p-power orders.

The logarithmic unit representation uses actual complex characters; reduction modulo an
odd unramified prime is a separate integral-lattice argument. The torsion line contributes
at p=3. The finite Chern class and its injectivity then supply the K₃-to-unit interface.

The layer’s planets are [χ⁻¹-eigenspace](#HB-1-cyclotomic-character-and-eigenspaces), [Chern class map c_ζ](#HB-1-the-chern-class-map-c-zeta), [Cyclotomic ramification](#HB-1-cyclotomic-prime-valuation-action), [Odd-character unit multiplicity](#HB-1-odd-cyclotomic-unit-multiplicity), [Theorem 1.5 of Calegari–Garoufalidis–Zagier](#HB-1-cgz-theorem-1-5).

The following targets are ordered by their exact internal prerequisites.

<a id="HB-1-bloch-group-conventions"></a>

### The Bloch conventions of this layer, imported from K3BlochGroups, and their identification modulo odd n

`HabiroNumberFields:HB.1/bloch-group-conventions` · comparison

For a field F with at least four elements, import Suslin’s B(F), the published CGZ group B_new(F),
and the repaired arXiv-v3 exterior-kernel group B_old(F), all from K3BlochGroups V.3. The published
modified boundary is into Q_neg=(F×⊗_Z F×)/⟨a⊗(−a) : a∈F×⟩ and its cycle quotient is defined by
cgz-published-bloch-group; B_old retains the inherited id cgz-bloch-group. The canonical maps B(F) →
B_new(F) → B_old(F) have respectively a kernel killed by 2 and zero cokernel, and zero kernel and
cokernel killed by 2. The first sends c=[x]+[1−x] to [0]. Thus both maps induce isomorphisms modulo
every positive odd n, without requiring gcd(n,w_F)=1 for this convention comparison. Separately, for
a number field F and positive odd n prime to w_F, import the chain K₃(F)/n ≅ K₃^ind(F)/n ≅ B(F)/n ≅
B_new(F)/n ≅ B_old(F)/n. The Milnor and Suslin steps have their own arithmetic hypotheses and
inherited proof obligations. HB.2’s exterior formulas use B_old and A_old(F;Z/n) as in arXiv v3;
their published interpretation uses these specified coefficient maps. No integral identification of
B_new and B_old is made.

**Hypotheses.**

- F is a field with at least four elements for the integral convention comparisons; number fields
satisfy this.
- The coefficient comparison requires n>0 odd. Transport from K₃(F)/n also requires F a number field
and gcd(n,w_F)=1.
- Retain the V.2 Milnor-K₃ arithmetic proof obligation; a convention comparison does not supply it.

**Prerequisites.** `K3BlochGroups:V.3/cgz-convention-comparison`, `K3BlochGroups:V.3/cgz-degenerate-relations`, `K3BlochGroups:V.2/milnor-k3-number-field`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/comparison-finite-coefficients`, `mathlib:NumberField.Units.torsionOrder`, `K3BlochGroups:V.3/cgz-published-bloch-group`, `K3BlochGroups:V.3/cgz-published-lemma-two-two`, `K3BlochGroups:V.3/cgz-published-to-older`, `K3BlochGroups:V.3/convention-coefficient-exports`.

**Proof route.**

1. Import the actual published cycle quotient and published Lemma 2.2 from V.3.
2. Import the canonical inclusion of B_new into B_old and its exact 2-primary correction.
3. Apply V.3/convention-coefficient-exports to both specified maps at odd n.
4. Apply V.2/milnor-k3-number-field, V.4/suslin-exact-sequence and V.6/comparison-finite-coefficients
only under the separate arithmetic hypotheses.

**Acceptance.**

- F = ℚ, n = 3: w_ℚ = 2 is prime to 3; K₃(ℚ)/3 ≅ (ℤ/48)/3 ≅ ℤ/3 and B(ℚ)/3 ≅ (ℤ/6)/3 ≅ ℤ/3, from
Suslin's sequence 0 → ℤ/4 → ℤ/24 → ℤ/6 → 0 (K3BlochGroups:V.6/comparison-integral).
- Over F₁₁, B_new=Z/3 injects into B_old=Z/6 with index 2; published κ_new is surjective, unlike the
older composite.
- Odd coefficient comparison of the conventions does not require gcd(n,w_F)=1; the K₃ transport does.
- The objects and maps are imported rather than reconstructed here.

**Sources.** `CGZ.BlochUnits.2021`, Remark after Definition 1.1, §1.1, p. 2 (arXiv v3); `CGZ.BlochUnits.2021`, Lemma 2.2, §2.1, p. 9 (arXiv v3); `CGZ.BlochUnits.2021`, §5.3, p. 29 (arXiv v3); `Hutchinson.ChernQuantumDilog.2024`, Theorem 2.8 (label thm:suslin), Corollary 2.9 (cor:suslin) and Remark 2.7, §2.2 (arXiv v4); `CGZ.published`, §2.1, Definition 2.1 and Lemma 2.2, published p.391 (PDF p.9); exact version comparison imported from K3BlochGroups V.3.

<a id="HB-1-cyclotomic-character-and-eigenspaces"></a>

### The cyclotomic character and the χ^j-eigenspaces

`HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces` · definition

Let F be a field, n ≥ 1 invertible in F, ζ a primitive n-th root of unity, F_n = F(ζ) and G =
Gal(F_n/F). The cyclotomic character χ : G → (ℤ/n)ˣ is determined by σ(ζ) = ζ^{χ(σ)} (CGZ (4)). It
is injective, it does not depend on the choice of ζ, and it is Mathlib's IsPrimitiveRoot.autToPow F
hζ (equal to modularCyclotomicCharacter by IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter).
For a ℤ/n-module M with a ℤ/n-linear G-action and j ∈ ℤ, the χ^j-eigenspace is M^{χ^j} = {x ∈ M :
σ(x) = χ(σ)^j·x for all σ ∈ G}, a ℤ/n-submodule defined for every n with no division. The modules
used are F_nˣ/(F_nˣ)^n, O_nˣ/(O_nˣ)^n and O_{S,n}ˣ/(O_{S,n}ˣ)^n, written additively (O_n and O_{S,n}
are the integers and the S-integers of F_n), with j = −1 (CGZ Theorems 1.2 and 1.5) and j = 1 − m
(CGZ (30)). The map O_nˣ/(O_nˣ)^n → F_nˣ/(F_nˣ)^n is injective. The roots of unity satisfy σ(ζ) =
ζ^{χ(σ)}, so their classes lie in the χ-eigenspace, which is the χ^{−1}-eigenspace only when χ² = 1
on G (for example n = 3).

**Hypotheses.**

- n is invertible in F; F_n = F(ζ) for a primitive n-th root of unity ζ; G = Gal(F_n/F) is finite
abelian.
- The eigenspace is the kernel set, for every n; projectors are
HB.1/the-eigenspace-and-division-by-a-group-order and need |G| invertible.

**Prerequisites.** `mathlib:IsPrimitiveRoot.autToPow`, `mathlib:IsPrimitiveRoot.autToPow_spec`, `mathlib:modularCyclotomicCharacter`, `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`, `mathlib:powMonoidHom`, `mathlib:Set.unit`.

**Proof route.**

1. Take χ = IsPrimitiveRoot.autToPow F hζ; its defining property is IsPrimitiveRoot.autToPow_spec, and
the comparison with modularCyclotomicCharacter is
IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter.
2. Injectivity: σ is determined by σ(ζ) because F_n = F(ζ). Independence of ζ: every primitive n-th
root is ζ^k with k prime to n, and σ(ζ^k) = (ζ^k)^{χ(σ)}.
3. M^{χ^j} is the intersection over σ of the kernels of σ − χ(σ)^j, which are ℤ/n-submodules.
4. The power-class and unit-class modules carry the G-action induced by σ on F_nˣ and O_nˣ. Injectivity
of units into power classes: if u ∈ O_nˣ equals y^n with y ∈ F_n, then y is integral and a unit.

**Uses that determine the API.**

- CGZ Theorem 1.2, (5), and Theorem 1.5, (11): The targets of R_ζ and c_ζ are χ^{−1}-eigenspaces.
- CGZ §3.1, (30): c_ζ on K_{2m−1} lands in the χ^{1−m}-eigenspace.
- CGZ Proposition 2.12: The rank of the χ^{−1}-eigenspace of the units.
- HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm: R_ζ(ξ) is the unique χ^{−1}-equivariant lift
(CGZ Proposition 2.5).

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `cycloChar` | data | χ : Gal(F_n/F) →* (ℤ/n)ˣ, defined as IsPrimitiveRoot.autToPow F hζ. |
| `cycloChar_spec` | simp | σ ζ = ζ ^ (χ σ).val. |
| `cycloChar_injective` | characterisation | χ is injective when F_n = F(ζ). |
| `cycloChar_independent` | characterisation | χ does not depend on the primitive root ζ. |
| `cycloChar_eq_modularCyclotomicCharacter` | compatibility | χ agrees with Mathlib's modularCyclotomicCharacter, restricted along Gal(F_n/F) → Aut(F_n). |
| `charEigenspace` | data | M^{χ^j} as a ℤ/n-submodule. |
| `mem_charEigenspace_iff` | simp | x ∈ M^{χ^j} ↔ ∀ σ, σ • x = χ(σ)^j • x. |
| `charEigenspace_map_le` | functoriality | A G-equivariant ℤ/n-linear map sends M^{χ^j} into N^{χ^j}. |
| `charEigenspace_eq_top_of_subsingleton` | characterisation | If G is trivial, M^{χ^j} = M. |
| `PowerClasses` | data | Lˣ/(Lˣ)^n written additively, a ℤ/n-module with the induced action of Gal(L/F). |
| `UnitClasses` | data | (𝓞 L)ˣ/((𝓞 L)ˣ)^n written additively, with the induced action. |
| `unitClassesToPowerClasses_injective` | compatibility | The map (𝓞 L)ˣ/((𝓞 L)ˣ)^n → Lˣ/(Lˣ)^n is injective and G-equivariant. |

**Unit tests.**

- `charEigenspace_dilog_five` (computation): F = ℚ, n = 5, v = ∏_{k=1}^{4}(1 − 2ζ₅^k)^k: the class of v lies in the χ^{−1}-eigenspace of PowerClasses (ℚ(ζ₅)) 5 and not in the χ-eigenspace (σ₂ v/v³ is a fifth power, σ₂ v/v² is not; PARI/GP). A definition with the exponent law reversed fails this.
- `charEigenspace_units_seven` (computation): F = ℚ, n = 7: finrank_{ℤ/7} (UnitClasses (ℚ(ζ₇)) 7)^{χ^{−1}} = 0 and finrank (UnitClasses (ℚ(ζ₇)) 7)^{χ} = 1, spanned by ζ₇ (PARI/GP).
- `charEigenspace_units_three` (non-example): F = ℚ, n = 3: χ = χ^{−1} and finrank_{ℤ/3} (UnitClasses (ℚ(ζ₃)) 3)^{χ^{−1}} = 1 (spanned by ζ₃), although r₂(ℚ) = 0 (PARI/GP). A rank formula r₂(F) stated without the hypothesis χ ≠ χ^{−1} is wrong.
- `charEigenspace_trivial_group` (degenerate): If ζ ∈ F (G trivial), every eigenspace is the whole module.
- `cycloChar_eq_autToPow` (compatibility): cycloChar hζ = hζ.autToPow F, and it agrees with modularCyclotomicCharacter restricted to Gal(F_n/F).

**Acceptance.**

- χ(σ) is characterised by σ(ζ) = ζ^{χ(σ)} and agrees with Mathlib's autToPow and
modularCyclotomicCharacter.
- F = ℚ, n = 5: v = ∏_{k=1}^{4}(1 − 2ζ^k)^k lies in the χ^{−1}-eigenspace of ℚ(ζ₅)ˣ/(ℚ(ζ₅)ˣ)^5 and not
in the χ-eigenspace (PARI/GP).
- F = ℚ(√−7), n = 5: dim_{F₅} (O₅ˣ/(O₅ˣ)^5)^{χ^{−1}} = 1 = r₂(F) (PARI/GP; compare
HB.1/eigenspace-of-units-mod-p).

**Sources.** `CGZ.BlochUnits.2021`, §1.1, equation (4) and the following sentence, p. 3 (arXiv v3); `CGZ.BlochUnits.2021`, §2.6, first paragraph, p. 16 (arXiv v3).

<a id="HB-1-the-eigenspace-and-division-by-a-group-order"></a>

### The eigenspace projector exists only when the group order is invertible

`HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order` · lemma

Let n ≥ 1, let G be a finite group, χ : G → (ℤ/n)ˣ a homomorphism, j ∈ ℤ, and M a ℤ/n-module with a
ℤ/n-linear G-action. Let M^{χ^j} = {x : σx = χ(σ)^j x for all σ} be the eigenspace of
HB.1/cyclotomic-character-and-eigenspaces. (a) If |G| is a unit in ℤ/n, then e_j := |G|^{−1} Σ_{σ∈G}
χ(σ)^{−j} σ is a ℤ/n-linear idempotent endomorphism of M with image M^{χ^j}, and it is the identity
on M^{χ^j}. The functor M ↦ M^{χ^j} is then exact; in particular, for n = p prime and G = Gal(F_p/F)
with |G| dividing p − 1, the Teichmüller lift gives (M ⊗ ℤ_p)^{χ^{−1}} ⊗ ℤ/p = (M/pM)^{χ^{−1}} (CGZ
§2.6). (b) If |G| is not a unit in ℤ/n, e_j is not defined and M ↦ M^{χ^j} need not be right exact.
For n = 9, G = (ℤ/9)ˣ = Gal(ℚ(ζ₉)/ℚ), χ = id and j = −1, the G-equivariant surjection ℤ/9[G] → ℤ/9,
g ↦ χ(g)^{−1}, maps the eigenspace ℤ/9·Σ_g χ(g) g onto |G|·ℤ/9 = 3ℤ/9 ≠ ℤ/9. (c) Rule: the
χ^{−1}-eigenspaces of this layer and of HB.2 are always the kernel sets M^{χ^{−1}}; a projector, an
exactness argument or a Teichmüller decomposition is used only after proving that |G| is invertible
modulo n.

**Hypotheses.**

- G is finite; M is a ℤ/n-module on which G acts ℤ/n-linearly.
- Part (a) assumes |G| ∈ (ℤ/n)ˣ; part (b) exhibits the failure when it is not.

**Prerequisites.** [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `mathlib:ZMod`.

**Proof route.**

1. Well-definedness of e_j and G-equivariance: σ e_j x = χ(σ)^j e_j x, by reindexing the sum by στ; so
the image lies in M^{χ^j}.
2. For x ∈ M^{χ^j}: e_j x = |G|^{−1} Σ_σ χ(σ)^{−j} χ(σ)^j x = x. Hence e_j is idempotent with image
M^{χ^j}.
3. Exactness: e_j is natural in G-equivariant maps. So a surjection M → N restricts to a surjection e_j
M → e_j N, and left exactness is automatic.
4. Counterexample: in ℤ/9[G] the eigenvectors are a·Σ_g χ(g) g, whose image is a·|G| = 6a; the image is
3ℤ/9.

**Acceptance.**

- When |G| is invertible, e_j is idempotent, e_j(M) = M^{χ^j}, and e_j|_{M^{χ^j}} = id.
- n = 9, G = (ℤ/9)ˣ: the eigenspace functor applied to ℤ/9[G] → ℤ/9(χ^{−1}) has image 3ℤ/9. For n = 7,
G = (ℤ/7)ˣ, the corresponding map is onto.
- No formal division by a non-invertible group order occurs in any node of HB.1 or HB.2.

**Sources.** `CGZ.BlochUnits.2021`, §2.6, p. 16 (arXiv v3); `CGZ.BlochUnits.2021`, Remark 1.3, §1.1, p. 3 (arXiv v3).

<a id="HB-1-sahs-lemma"></a>

### Sah's lemma: central elements act trivially on group cohomology

`HabiroNumberFields:HB.1/sahs-lemma` · lemma

Let G be a group, k a commutative ring, A a k[G]-module, and g an element of the centre of G. Then a
↦ g·a is an endomorphism of A as a G-module, and the map it induces on H^i(G, A) is the identity for
every i ≥ 0. Consequently, if g acts on A as multiplication by c ∈ k, then (c − 1) annihilates
H^i(G, A). In particular, for G = Gal(F_n/F) (abelian) acting on ℤ/n(m) through χ^m, every H^i(G,
ℤ/n(m)) is annihilated by χ(g)^m − 1 for every g ∈ G.

**Hypotheses.**

- g lies in the centre of G; for G abelian every g does.
- Discrete group cohomology of a finite (or discrete) group; the profinite case is not needed, since
the lemma is applied to the finite group Gal(F_n/F).

**Prerequisites.** `mathlib:groupCohomology`, `mathlib:groupCohomology.map`, `mathlib:Subgroup.center`.

**Proof route.**

1. The pair (inner automorphism by g, multiplication by g) induces the identity on H^*(G, A) (dimension
shifting from H^0, or the explicit homotopy on the standard complex).
2. For g central the inner automorphism is the identity, so the map induced by a ↦ g·a alone is the
identity.
3. If g acts by c, that map is multiplication by c, so (c − 1)·x = 0 for every class x.

**Acceptance.**

- For G = (ℤ/n)ˣ acting on ℤ/n by χ^m, H^i(G, ℤ/n(m)) is killed by gcd_g(χ(g)^m − 1, n).
- For G = (ℤ/7)ˣ, m = 1 and g = 3: 3 − 1 = 2 is a unit mod 7, so H^i(G, ℤ/7(1)) = 0 for all i.

**Sources.** `CGZ.BlochUnits.2021`, Proof of Proposition 2.5(b), §2.3, p. 13 (arXiv v3); `CGZ.BlochUnits.2021`, Proof of Lemma 3.1, §3.1, p. 18 (arXiv v3).

<a id="HB-1-the-excluded-primes"></a>

### The excluded integer M_F of Calegari–Garoufalidis–Zagier

`HabiroNumberFields:HB.1/the-excluded-primes` · definition

For a number field F let Δ_F = NumberField.discr F ∈ ℤ, and let |K₂(O_F)| be the order of the finite
group K₂(O_F) (finite by ArithmeticKTheory:N.3/finiteness-and-ranks-combined). CGZ's excluded
integer is M_F := 6·|Δ_F|·|K₂(O_F)|. For n not divisible by 9 the smaller integer M′_F :=
2·|Δ_F|·|K₂(O_F)| may be used (CGZ Remark 1.4, proved for the Chern class map in §3.5). The excluded
primes are the prime divisors of M_F: 2, 3, the primes ramified in F and the primes dividing
|K₂(O_F)|. They form a finite set depending only on F. For n coprime to M′_F: n is odd; for every p
| n, p is unramified in F, so F ∩ ℚ(ζ_p) = ℚ and ζ_p ∉ F, whence gcd(n, w_F) = 1; and p ∤ |K₂(O_F)|.
For n coprime to M_F, in addition gcd(n, w₂(F)) = 1: 2 and 3 divide w₂(F) for every F, and a prime p
≥ 5 divides w₂(F) exactly when ℚ(ζ_p)⁺ ⊆ F, which forces p | Δ_F. For n coprime to M′_F with 9 ∤ n,
a prime p with p² | n does not divide w₂(F); this is the hypothesis of HB.1/injectivity-of-c-zeta.
M_F is a different object from the finite set S of primes in CGZ Theorems 1.2 and 1.5, which comes
from HB.1/s-units-realise-c-zeta, is not explicit, and may depend on n.

**Hypotheses.**

- F is a number field. The order |K₂(O_F)| is supplied by ArithmeticKTheory (K₂(O_F) is finite); Δ_F
and w_F are Mathlib's NumberField.discr and NumberField.Units.torsionOrder.
- M_F is an integer and not a set of primes. The hypotheses using it take the form gcd(n, M_F) = 1, or
gcd(n, M′_F) = 1 together with 9 ∤ n.
- The roots-of-unity hypothesis gcd(n, w_F) = 1 of CGZ Theorem 1.2 is implied by gcd(n, M′_F) = 1;
w₂(F) is ArithmeticKTheory's w_2.

**Prerequisites.** `mathlib:NumberField.discr`, `mathlib:NumberField.Units.torsionOrder`, `mathlib:IsCyclotomicExtension.Rat.discr_prime`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`.

**Proof route.**

1. Define M_F and M′_F from Δ_F and |K₂(O_F)|; they are non-zero because Δ_F ≠ 0 and |K₂(O_F)| ≥ 1.
2. If p is odd and ζ_p ∈ F, then ℚ(ζ_p) ⊆ F. ℚ(ζ_p) is ramified at p, so p | Δ_F. Hence gcd(n, 2Δ_F) =
1 implies gcd(n, w_F) = 1.
3. If p ≥ 5 and p | w₂(F), then ζ_p + ζ_p^{−1} ∈ F
(ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character). So ℚ(ζ_p)⁺, which has degree (p −
1)/2 ≥ 2 and is ramified at p, lies in F, and p | Δ_F. Every F has 24 | w₂(F), since w₂(ℚ) = 24 and
w₂(ℚ) | w₂(F).
4. Deduce the three implications in the statement.

**Uses that determine the API.**

- CGZ Theorems 1.2, 1.5 and 1.6: Their injectivity, unit and comparison statements are made for n
prime to M_F.
- HabiroNumberFields:HB.1/cgz-theorem-1-5: The hypothesis of the injectivity and isomorphism theorem
for c_ζ.
- HabiroNahmSeries:HB.5/excluded-primes-and-hypotheses: The Nahm-sum argument uses that the excluded
primes form a finite set depending only on F.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `cgzExcludedInteger` | data | M_F = 6·\|Δ_F\|·\|K₂(O_F)\|, with \|K₂(O_F)\| an explicit argument until ArithmeticKTheory supplies K₂(O_F). |
| `cgzExcludedIntegerNotNine` | data | M′_F = 2·\|Δ_F\|·\|K₂(O_F)\|, for use when 9 ∤ n. |
| `cgzExcludedInteger_ne_zero` | characterisation | M_F ≠ 0 and M′_F ≠ 0, so the set of excluded primes is finite. |
| `prime_dvd_cgzExcludedInteger_iff` | characterisation | For a prime p: p \| M_F ⇔ p = 2 ∨ p = 3 ∨ p \| Δ_F ∨ p \| \|K₂(O_F)\|. |
| `coprime_torsionOrder_of_coprime_cgzExcludedIntegerNotNine` | relation | gcd(n, M′_F) = 1 ⇒ gcd(n, w_F) = 1. |
| `coprime_w2_of_coprime_cgzExcludedInteger` | relation | gcd(n, M_F) = 1 ⇒ gcd(n, w₂(F)) = 1; and gcd(n, M′_F) = 1 with 9 ∤ n ⇒ p ∤ w₂(F) for every p with p² \| n. |

**Unit tests.**

- `cgzExcludedInteger_rat` (computation): cgzExcludedInteger ℚ 2 = 12 and cgzExcludedIntegerNotNine ℚ 2 = 4 (K₂(ℤ) ≅ ℤ/2).
- `cgzExcludedInteger_gaussian` (computation): For F = ℚ(i) = CyclotomicField 4 ℚ (Δ = −4, K₂(ℤ[i]) = 0): cgzExcludedInteger F 1 = 24 and cgzExcludedIntegerNotNine F 1 = 8. A definition using Δ_F instead of |Δ_F| gives −24.
- `cgzExcludedInteger_three_admissible` (non-example): n = 3 is coprime to cgzExcludedIntegerNotNine ℚ 2 = 4 and 9 ∤ 3, yet 3 | w₂(ℚ) = 24. So M′_F does not encode gcd(n, w₂(F)) = 1, and a definition folding w₂(F) into M′_F is wrong.
- `cgzExcludedInteger_one` (degenerate): n = 1 is coprime to every M_F; the statements using M_F are then about the zero group.

**Acceptance.**

- M_ℚ = 12 and M′_ℚ = 4 (Δ_ℚ = 1, K₂(ℤ) ≅ ℤ/2).
- M_{ℚ(i)} = 24 and M′_{ℚ(i)} = 8 (Δ = −4, K₂(ℤ[i]) = 0).
- gcd(n, M′_F) = 1 implies gcd(n, w_F) = 1; gcd(n, M_F) = 1 implies gcd(n, w₂(F)) = 1.
- gcd(n, M′_F) = 1 does not imply gcd(n, w₂(F)) = 1: for F = ℚ, n = 3 is coprime to M′_ℚ = 4, but 3 |
w₂(ℚ) = 24.

**Sources.** `CGZ.BlochUnits.2021`, Remark 1.4, §1.1, p. 3 (arXiv v3; v1 lacks the second sentence); `CGZ.BlochUnits.2021`, §3.5, p. 20 (arXiv v3).

<a id="HB-1-finite-coefficient-K3-and-the-chern-class"></a>

### Finite-coefficient K₃ and the finite Chern class, imported, with the number-field isomorphism for odd N

`HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class` · comparison

For a ring R in which N is invertible, K_m(R; ℤ/N) is the homotopy of the K-theory spectrum with ℤ/N
coefficients (StableHomotopyKTheory H.6: E/m and its Bockstein sequence). There is a universal
coefficient sequence 0 → K_m(R)/N → K_m(R; ℤ/N) → K_{m−1}(R)[N] → 0, and K_*(R; ℤ/N) is a
graded-commutative ring. Soulé's étale Chern classes c̄_{i,k} : K_{2i−k}(R; ℤ/N) → H^k(R, μ_N^{⊗i})
are imported from MotivicEtaleKTheory M.8. On K₁(F; ℤ/N) = Fˣ/(Fˣ)^N, c̄_{1,1} is the Kummer map.
For a number field E containing μ_N with N odd, c̄_{2,1} : K₃(E; ℤ/N) → H¹(E, μ_N^{⊗2}) ≅ Eˣ/(Eˣ)^N
⊗ μ_N is an isomorphism (Hutchinson Corollary 2.11, the number-field case of Levine's theorem K₃(E;
ℤ/N)^ind ≅ H¹(E, μ_N^{⊗2}), Hutchinson Theorem 2.10). The reason is that for N ≥ 3 a field
containing μ_N is totally imaginary, so K₃^M(E) = 0; the case N = 1 is trivial. The target is the
multiplicative group Eˣ modulo N-th powers, tensored with μ_N, and not the unit group O_Eˣ. This
node imports all of this. For number fields and odd N the isomorphism is the degree-three case of
MotivicEtaleKTheory M.7's comparison.

**Hypotheses.**

- N ≥ 1 is odd; E is a number field containing a primitive N-th root of unity. For N = 2, E = ℚ
contains μ_2 but K₃^M(ℚ) ≅ ℤ/2 ≠ 0, and Hutchinson's argument does not apply.
- K_m(R; ℤ/N) with its Bockstein sequence is StableHomotopyKTheory H.6 applied to the K-theory
spectrum; the Chern classes are MotivicEtaleKTheory M.8's; the isomorphism for number fields and odd
N is MotivicEtaleKTheory M.7's comparison in degree three.
- Levine's theorem for arbitrary fields (Hutchinson Theorem 2.10) is not needed by HB.1 beyond number
fields and odd N, and is not planned here.

**Prerequisites.** [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions), `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7`, `K3BlochGroups:V.2/milnor-k3-number-field`.

**Proof route.**

1. Import the finite-coefficient groups and the universal coefficient sequence
(StableHomotopyKTheory:H.6 applied to the K-theory spectrum).
2. Import Soulé's classes c̄_{i,k} and the identification of c̄_{1,1} with the Kummer map
(MotivicEtaleKTheory:M.8).
3. For N ≥ 3 odd, a number field E ⊇ μ_N has no real place; so K₃^M(E) = 0
(K3BlochGroups:V.2/milnor-k3-number-field) and K₃(E; ℤ/N) equals its indecomposable part.
4. Import the isomorphism c̄_{2,1} : K₃(E; ℤ/N) ≅ H¹(E, μ_N^{⊗2}) for number fields and odd N
(MotivicEtaleKTheory:M.7, degree three; Hutchinson Theorem 2.10 / Corollary 2.11).
5. Identify H¹(E, μ_N^{⊗2}) = H¹(E, μ_N) ⊗ μ_N = Eˣ/(Eˣ)^N ⊗ μ_N by the Kummer isomorphism, since μ_N
is a trivial Galois module over E.

**Acceptance.**

- For odd N and a number field E ⊇ μ_N, c̄_{2,1} : K₃(E; ℤ/N) → Eˣ/(Eˣ)^N ⊗ μ_N is an isomorphism.
- The target is the whole multiplicative group modulo N-th powers, not the units; the unit version is
HB.1/units-realise-c-zeta and needs further hypotheses.
- The objects are imported from StableHomotopyKTheory H.6, MotivicEtaleKTheory M.7 and M.8 and
K3BlochGroups V.2; none is constructed here.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §2.3, the universal coefficient sequence (arXiv v4); `Hutchinson.ChernQuantumDilog.2024`, Theorem 2.10 (label lem:levine), §2.3 (arXiv v4); `Hutchinson.ChernQuantumDilog.2024`, Corollary 2.11 (label cor:levine) and its proof, §2.3, with the standing hypothesis of §1 (arXiv v4).

<a id="HB-1-inflation-restriction-injectivity"></a>

### Restriction to the cyclotomic extension is injective for n prime to w_m(F) (CGZ Lemma 3.1)

`HabiroNumberFields:HB.1/inflation-restriction-injectivity` · lemma

Let F be a number field, m ≥ 1, n ≥ 1 and G = Gal(F_n/F). The restriction H¹(F, ℤ/n(m)) → H¹(F_n,
ℤ/n(m))^G is injective when gcd(n, w_m(F)) = 1, where w_m(F) = ∏_p |H⁰(F, ℚ_p/ℤ_p(m))|.

**Hypotheses.**

- gcd(n, w_m(F)) = 1; w_m(F) as in ArithmeticKTheory:N.4/the-w-invariant.
- ℤ/n(m) = μ_n^{⊗m} with the Galois action through χ^m (MotivicEtaleKTheory M.1).

**Prerequisites.** [HabiroNumberFields:HB.1/sahs-lemma](#HB-1-sahs-lemma), [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.1`, `mathlib:groupCohomology.H1InfRes_exact`.

**Proof route.**

1. By inflation–restriction for the closed normal subgroup G_{F_n} of G_F (Tau Ceti ProfiniteCohomology
layer 5), the kernel is H¹(G, ℤ/n(m)), because G_{F_n} acts trivially on ℤ/n(m).
2. By the Chinese remainder theorem reduce to n = p^a. By Sah's lemma (HB.1/sahs-lemma) H¹(G, ℤ/p^a(m))
is killed by χ(g)^m − 1 for every g ∈ G.
3. If p | χ(g)^m − 1 for all g ∈ G_F, then G_F acts trivially on ℤ/p(m), so H⁰(F, ℤ/p(m)) ≠ 0 and p |
w_m(F). So when p ∤ w_m(F) some χ(g)^m − 1 is a unit mod p, hence mod p^a, and the kernel vanishes.

**Acceptance.**

- For F = ℚ, m = 2 and n = 5 (w₂(ℚ) = 24), the restriction H¹(ℚ, ℤ/5(2)) → H¹(ℚ(ζ₅), ℤ/5(2))^G is
injective.
- The lemma is stated with w_m(F), not w_F; for m = 2 the relevant invariant is w₂(F), which is
divisible by 24.

**Sources.** `CGZ.BlochUnits.2021`, Lemma 3.1 and its proof, §3.1, p. 18 (arXiv v3).

<a id="HB-1-the-chern-class-map-c-zeta"></a>

### The Chern class map c_ζ into the χ^{1−m}-eigenspace (CGZ §3.1)

`HabiroNumberFields:HB.1/the-chern-class-map-c-zeta` · construction

Let F be a number field, m ≥ 1, n ≥ 1, ζ a primitive n-th root of unity and G = Gal(F_n/F). Soulé's
Chern class c : K_{2m−1}(F) → H¹(F, ℤ_p(m)), reduced modulo p^i and assembled over the primes p | n
by the Chinese remainder theorem, gives c : K_{2m−1}(F) → H¹(F, ℤ/n(m)); restricting to F_n lands in
H¹(F_n, ℤ/n(m))^G. The trivialisation t_ζ : ℤ/n(1) → ℤ/n(m), ζ ↦ ζ^{⊗m}, is not G-equivariant: it
satisfies t_ζ(σx) = χ^{1−m}(σ)·σt_ζ(x) and t_{ζ^k} = k^{m−1}t_ζ. It identifies H¹(F_n, ℤ/n(m))^G
with H¹(F_n, μ_n)^{χ^{1−m}}. With the Kummer isomorphism H¹(F_n, μ_n) = F_nˣ/(F_nˣ)^n this defines
c_ζ : K_{2m−1}(F) → (F_nˣ/(F_nˣ)^n)^{χ^{1−m}} (CGZ (30)). For m = 2 the target is the
χ^{−1}-eigenspace, and c_{ζ^k} = c_ζ^{k^{−1}} for k prime to n. c_ζ factors through K_{2m−1}(F)/n
and is compatible with finite field extensions E/F.

**Hypotheses.**

- F is a number field; n ≥ 1; ζ ∈ F̄ is a primitive n-th root of unity, and the construction depends
on ζ only through t_ζ.
- No hypothesis on roots of unity in F is needed to define c_ζ (CGZ Theorem 1.5 has none); injectivity
and the unit statements are later nodes.

**Prerequisites.** [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `MotivicEtaleKTheory:M.1`, `tauceti:TauCeti.kummerClassMap`, `tauceti:TauCeti.kummerClassMap_injective`.

**Proof route.**

1. Import Soulé's ℓ-adic Chern classes and their compatibility with reduction mod p^i and with base
change (MotivicEtaleKTheory:M.8).
2. Assemble mod-n classes by the Chinese remainder theorem.
3. Restrict along G_{F_n} ⊂ G_F; the image is G-invariant.
4. Define t_ζ; check (29), t_ζ(σx) = χ^{1−m}(σ)σt_ζ(x), from σζ = ζ^{χ(σ)} and σζ^{⊗m} = ζ^{⊗m·χ(σ)^m};
check t_{ζ^k} = k^{m−1}t_ζ.
5. Transport the G-invariants of H¹(F_n, ℤ/n(m)) along t_ζ^{−1} to the χ^{1−m}-eigenspace of H¹(F_n,
μ_n).
6. Apply the Kummer isomorphism (Tau Ceti kummerClassMap, with surjectivity from ProfiniteCohomology
layer 9).

**Uses that determine the API.**

- CGZ Theorem 1.5: The map whose injectivity and image are proved.
- CGZ Theorem 1.6 and HabiroNumberFields:HB.2/the-comparison-with-the-chern-class: R_ζ = c_ζ^γ; with
Hutchinson, γ = 2.
- Hutchinson Theorem 3.1: c_ζ(η_ζ) = ζ, computed through the finite-coefficient class
(HB.1/hutchinson-chern-class-agrees).
- HabiroNahmSeries:HB.9/constant-term-is-the-unit: Uses Theorem 1.6, whose right-hand side is c_ζ.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `twistTrivialization` | data | t_ζ : ℤ/n(1) ≅ ℤ/n(m), ζ ↦ ζ^{⊗m}. |
| `twistTrivialization_equivariant` | relation | t_ζ(σx) = χ^{1−m}(σ)·σ t_ζ(x) (CGZ (29)). |
| `twistTrivialization_pow` | relation | t_{ζ^k} = k^{m−1} t_ζ for k prime to n. |
| `chernClassMap` | data | c_ζ : K_{2m−1}(F)/n → (F_nˣ/(F_nˣ)^n)^{χ^{1−m}}. |
| `chernClassMap_mem_eigenspace` | characterisation | For m = 2 the values lie in the χ^{−1}-eigenspace. |
| `chernClassMap_pow_root` | relation | c_{ζ^k} = c_ζ^{k^{−1}} (m = 2). |
| `chernClassMap_baseChange` | functoriality | For a finite extension E/F, c_ζ^E ∘ (K₃(F) → K₃(E)) = (F_nˣ → E_nˣ) ∘ c_ζ^F. |

**Unit tests.**

- `chernClassMap_pow_root_test` (characterisation): For m = 2 and k prime to n, c_{ζ^k}(x) = c_ζ(x)^{k^{−1}}. With ζ ↦ ζ^{⊗n} (the misprint) one would get k^{n−1} instead.
- `chernClassMap_rat_three` (computation): F = ℚ, n = 3: K₃(ℚ)/3 ≅ ℤ/3 and c_ζ maps it isomorphically onto (O₃ˣ/(O₃ˣ)^3)^{χ^{−1}} = ⟨ζ₃⟩ ≅ ℤ/3, with c_ζ(η_ζ) = ζ (Hutchinson Theorem 3.1 with N = 3, where ℚ(ζ₃)⁺ = ℚ).
- `chernClassMap_weight_one` (compatibility): For m = 1, c_ζ on K₁(F) = Fˣ is the Kummer class followed by restriction to F_n, landing in the G-invariants.
- `chernClassMap_trivial_torsion` (degenerate): n = 1: both sides are zero.

**Acceptance.**

- For m = 2, c_ζ(x) lies in the χ^{−1}-eigenspace, and c_{ζ^k}(x) = c_ζ(x)^{k^{−1}}.
- For m = 1, t_ζ = id and c_ζ is the Kummer class of a ∈ Fˣ in (F_nˣ/(F_nˣ)^n)^G.
- The trivialisation sends ζ to ζ^{⊗m}; CGZ p. 18 prints ζ^{⊗n} (HabiroNumberFields/E1).

**Sources.** `CGZ.BlochUnits.2021`, §3.1, before (29), p. 18 (arXiv v3); `CGZ.BlochUnits.2021`, §3.1, (30) and the preceding display, p. 18 (arXiv v3).

<a id="HB-1-hutchinson-chern-class-agrees"></a>

### Hutchinson's finite-coefficient c_ζ equals CGZ's c_ζ

`HabiroNumberFields:HB.1/hutchinson-chern-class-agrees` · comparison

Let F be a number field, N odd and ζ a primitive N-th root of unity. The composite K₃(F)/N → K₃(F;
ℤ/N) → H¹(F, μ_N^{⊗2}) → H¹(F_N, μ_N^{⊗2}) = F_Nˣ/(F_Nˣ)^N ⊗ μ_N → F_Nˣ/(F_Nˣ)^N, where the second
map is c̄_{2,1} and the last is a ⊗ ζ ↦ a (Hutchinson §2.3), equals CGZ's c_ζ of
HB.1/the-chern-class-map-c-zeta with m = 2. The map a ⊗ ζ ↦ a is t_ζ^{−1}, since t_ζ(y) = y ⊗ ζ for
y ∈ μ_N, and Soulé's ℓ-adic classes restrict to the finite-coefficient ones along K₃(F)/N → K₃(F;
ℤ/N).

**Hypotheses.**

- N odd; the Chern classes are Soulé's in both constructions (MotivicEtaleKTheory M.8).

**Prerequisites.** [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class).

**Proof route.**

1. Identify a ⊗ ζ ↦ a with t_ζ^{−1} on H¹(F_N, μ_N^{⊗2}) = H¹(F_N, μ_N) ⊗ μ_N.
2. Import the compatibility of Soulé's classes on K₃(F) ⊗ ℤ_ℓ with those on K₃(F; ℤ/ℓ^ν) under
K₃(F)/ℓ^ν → K₃(F; ℤ/ℓ^ν) (MotivicEtaleKTheory:M.8).
3. Compare the restrictions to F_N and the Kummer identifications.

**Acceptance.**

- The two constructions agree on K₃(F)/N, so Hutchinson's Theorem 3.1 is a statement about CGZ's c_ζ,
as HB.2's refinement R_ζ = c_ζ² requires.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §2.3, the definition of c_ζ after Corollary 2.11 (arXiv v4).

<a id="HB-1-quillen-lichtenbaum-degree-three"></a>

### K₃ of a number field and H¹ of the second twist at odd primes (CGZ Theorem 3.2), imported

`HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three` · comparison

For a number field F and an odd prime p, Soulé's Chern class gives an isomorphism K₃(F) ⊗ ℤ_p ≅
K₃(O_F) ⊗ ℤ_p ≅ H¹_ét(O_F[1/p], ℤ_p(2)), and H¹_ét(O_F[1/p], ℤ_p(2)) ≅ H¹(F, ℤ_p(2)). K₃(F) has rank
r₂(F), and its torsion is ℤ/w₂(F) if F is totally imaginary and ℤ/2w₂(F) ⊕ (ℤ/2)^{r₁−1} if r₁ ≥ 1
(CGZ (9)). HB.1 imports all of this.

**Hypotheses.**

- p odd; for p = 2 CGZ state nothing and MotivicEtaleKTheory M.7 requires the corrected real-place
sequences.

**Prerequisites.** `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.5/soule-theorem`, `K3BlochGroups:V.5/k3-number-field`.

**Proof route.**

1. Import K₃(O_F) ≅ K₃(F) (ArithmeticKTheory:N.5/soule-theorem) and the group structure
(ArithmeticKTheory:N.5/totally-imaginary-integral-structure,
ArithmeticKTheory:N.5/the-real-case-modulo-eight, or K3BlochGroups:V.5/k3-number-field).
2. Import the degree-three odd-prime comparison with H¹ of the second twist (MotivicEtaleKTheory:M.7).

**Acceptance.**

- F = ℚ: K₃(ℚ) ⊗ ℤ₃ ≅ ℤ/3 ≅ H¹(ℤ[1/3], ℤ₃(2)) (K₃(ℚ) ≅ ℤ/48).
- The rank is r₂(F), and the torsion is exactly as in CGZ (9).

**Sources.** `CGZ.BlochUnits.2021`, Theorem 3.2, §3.2, pp. 18–19 (arXiv v3).

<a id="HB-1-injectivity-of-c-zeta"></a>

### Injectivity of c_ζ on K₃(F)/n (CGZ Lemma 3.3)

`HabiroNumberFields:HB.1/injectivity-of-c-zeta` · theorem

Let F be a number field and n an odd integer such that p ∤ w₂(F) for every prime p with p² | n. Then
c_ζ : K₃(F)/n → (F_nˣ/(F_nˣ)^n)^{χ^{−1}} is injective.

**Hypotheses.**

- n odd, which CGZ's statement omits although its proof uses Theorem 3.2 (p > 2); see E5.
- p ∤ w₂(F) whenever p² | n; square-free n needs nothing further.

**Prerequisites.** [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](#HB-1-quillen-lichtenbaum-degree-three), [HabiroNumberFields:HB.1/inflation-restriction-injectivity](#HB-1-inflation-restriction-injectivity), `ArithmeticKTheory:N.4/the-w-invariant`.

**Proof route.**

1. Reduce to n = p^a by the Chinese remainder theorem.
2. By HB.1/quillen-lichtenbaum-degree-three, K₃(F)/p^a ≅ H¹(F, ℤ_p(2))/p^a.
3. The Kummer sequence for ℤ_p(2) makes H¹(F, ℤ_p(2))/p^a → H¹(F, ℤ/p^a(2)) injective.
4. The kernel of restriction to F_n is H¹(G, H⁰(F_n, ℤ/p^a(2))) = H¹(G, ℤ/p^a(2)). If a = 1, |G|
divides p − 1 and the group vanishes. If a ≥ 2, it vanishes when p ∤ w₂(F)
(HB.1/inflation-restriction-injectivity with m = 2).

**Acceptance.**

- F = ℚ, n = 3: injective (3 is square-free), with K₃(ℚ)/3 ≅ ℤ/3.
- F = ℚ, n = 9: not covered, since 3² | 9 and 3 | w₂(ℚ) = 24.

**Sources.** `CGZ.BlochUnits.2021`, Lemma 3.3, §3.2, p. 19 (arXiv v3).

<a id="HB-1-s-units-realise-c-zeta"></a>

### The image of c_ζ is realised by S-units (CGZ Lemma 3.4)

`HabiroNumberFields:HB.1/s-units-realise-c-zeta` · theorem

Let F be a number field and n ≥ 1. There is a finite set S = S(F, n) of primes, which can be chosen
to avoid any given finite set of primes not dividing n, such that the image of c_ζ on K₃(F)/n is
contained in the image of O_{F_n}[1/S]ˣ/(O_{F_n}[1/S]ˣ)^n. The set S may depend on n; the text read
does not prove that one S works for all n (E4).

**Hypotheses.**

- S is a finite set of primes (of F, extended to F_n) containing the primes above n; its dependence on
n is recorded.

**Prerequisites.** [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:IsDedekindDomain.selmerGroup`, `tauceti:IsDedekindDomain.selmerGroup.fromSUnitLift_injective`, `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, `tauceti:IsDedekindDomain.selmerGroup.range_toClassGroup`, `mathlib:Set.unit`.

**Proof route.**

1. K₃(F) is finitely generated (ArithmeticKTheory:N.3/finiteness-and-ranks-combined), so the image is
generated by finitely many classes in F_nˣ/(F_nˣ)^n.
2. A class whose valuations are divisible by n away from S lies in the Selmer group K(S, n). Tau Ceti
proves 1 → O_Sˣ/n → K(S, n) → Cl_S[n] → 1 (IsDedekindDomain.selmerGroup.fromSUnitLift_injective,
.ker_toClassGroup, .range_toClassGroup).
3. Enlarge S by primes whose classes generate Cl(O_{F_n}[1/S]), chosen outside the given finite set
(every ideal class contains ideals prime to a given ideal); then Cl_S[n] = 0 and the Selmer classes
are S-unit classes.

**Acceptance.**

- For n prime to M_F one may take S = ∅ (HB.1/units-realise-c-zeta).
- S is attached to (F, n); it is not the excluded integer M_F.

**Sources.** `CGZ.BlochUnits.2021`, Lemma 3.4, §3.3, p. 19 (arXiv v3).

<a id="HB-1-finite-endomorphism-obstruction-criterion"></a>

### Finite endomorphisms and torsion obstructions

`HabiroNumberFields:HB.1/finite-endomorphism-obstruction-criterion` · lemma

Let A be a finite abelian group, f:A→A an additive endomorphism and n a natural number. If every x∈A
has x=f(y)+n·z for some y,z∈A, then ker(f)∩A[n]=0. For a finite class group A with cyclic G-action
and a generator γ, take f=γ−a on A, where a is an integer lift of χ(γ)⁻¹ modulo n. The χ⁻¹-twisted
coinvariants of A/n vanish precisely when this surjectivity hypothesis holds, and then
(A[n])^{χ⁻¹}=0.

**Hypotheses.**

- A is finite, not just finitely generated.
- The first assertion holds even for n=0. In the application n=p^m>0 and G is cyclic; the finite
endomorphism argument does not require |G| to be invertible.

**Prerequisites.** [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces).

**Proof route.**

1. For each prime q dividing n, restrict f to the finite q-primary subgroup A_q. Surjectivity on A/n
implies A_q=f(A_q)+nA_q. Iteration gives A_q=f(A_q)+n^kA_q=f(A_q) for k sufficiently large, because
n is nilpotent on A_q.
2. A surjective endomorphism of a finite group is injective. Thus no q-primary element of ker(f) is
killed by n. Summing primary components gives the first assertion; for n=0 the assumption is
surjectivity of f itself.
3. On A/n, the relations for a cyclic generator γ generate all the relations σx−χ(σ)⁻¹x, by the
geometric-sum identity and inverses. On A[n], the γ-eigenrelation implies every σ-eigenrelation.
This proves the vanishing implication used by CGZ without identifying Pic[n] with Pic/n or choosing
an isomorphism between invariants and coinvariants.

**Acceptance.**

- A=ℤ/9, n=9, f(x)=2x: the hypothesis holds and the kernel is zero.
- A=ℤ/9, n=3, f=0: the hypothesis fails and A[3] is nonzero.
- Finiteness is essential: on A=ℚ/ℤ, f(x)=3x is surjective but has nonzero 3-torsion kernel.

**Sources.** `CGZ.BlochUnits.Published.2023`, §3.4, proof of Lemma 3.5, p.402.

<a id="HB-1-cyclotomic-prime-valuation-action"></a>

### Cyclotomic ramification and the valuation action

`HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action` · theorem

Let F be a number field, p an odd prime unramified in F, m≥1, n=p^m and L=F(ζ_n). Then [L:F]=φ(n)
and χ:G≃(ℤ/n)ˣ. Each prime 𝔭 of 𝓞 F above p has a unique prime 𝔓 of 𝓞 L above it, with e(𝔓/𝔭)=φ(n)
and f(𝔓/𝔭)=1. Thus G fixes every prime above p and acts trivially on the integer valuation group
ℤ^{S_p} and on its sublattice D=ord_{S_p}(𝓞 L[1/p]ˣ).

**Hypotheses.**

- p∤disc(F); no assumption on the Galois closure of F.
- L is the field generated over F by a specified primitive n-th root; S_p is the finite set of primes
of 𝓞 L above p.

**Prerequisites.** `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`, `mathlib:cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt`, `mathlib:IsPrimitiveRoot.autToPow`, `mathlib:IsPrimitiveRoot.autToPow_injective`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `mathlib:Ideal.ramificationIdx`, `mathlib:Ideal.inertiaDeg`.

**Proof route.**

1. Use not_dvd_discr_iff_isUnramifiedIn to know that every completion F_𝔭/ℚ_p is unramified. Thus p is
a uniformizer in F_𝔭.
2. The pinned cyclotomic_prime_pow_comp_X_add_one_isEisensteinAt gives Φ_n(X+1) Eisenstein over ℤ at p.
Its coefficients remain Eisenstein over 𝓞_{F_𝔭}: the constant p has valuation one and all other
non-leading coefficients have positive valuation. Use LocalFieldsRamification layer 3 to get
F_𝔭(ζ_n)/F_𝔭 totally ramified of degree φ(n).
3. The global degree is at most φ(n), while every such completed factor has degree φ(n). The
NumberFieldArithmetic layer 5 product/decomposition dictionary forces global degree φ(n), one
completed factor above each 𝔭 and residue degree one. Faithfulness of autToPow and equality of
finite orders give χ an isomorphism.
4. The unique-prime statement makes each valuation coordinate invariant. The image lattice D inherits
the trivial G-action. This is a cyclotomic application of the two existing local/global roadmaps,
not a new general ramification theory.

**Acceptance.**

- F=ℚ, n=9: degree and ramification index are 6; the valuation action is trivial although 3 divides
|G|.
- F=ℚ(∛2), p=5: the conclusion holds without a hypothesis on the Galois closure.
- For p dividing disc(F) the Eisenstein argument over F_𝔭 is not justified and the statement makes no
claim.

**Sources.** `CGZ.BlochUnits.Published.2023`, §3.4, proof of Lemma 3.5, pp.402–403.

<a id="HB-1-keune-picard-eigen-obstruction"></a>

### Vanishing of the cyclotomic Picard obstruction

`HabiroNumberFields:HB.1/keune-picard-eigen-obstruction` · application

Let F be a number field, p an odd prime, m≥1, n=p^m, L=F(ζ_n), G=Gal(L/F) and χ:G→(ℤ/n)ˣ its
root-exponent character. Assume p∤disc(F) and p∤#K₂(𝓞 F). Subject to the exact Keune supplier
contract, (Pic(𝓞 L[1/p])[n])^{χ⁻¹}=0. This is the actual right-hand obstruction in the Kummer
sequence.

**Hypotheses.**

- The class group of 𝓞 L[1/p] is finite, using the pinned integer-ring Fintype and
finite_integer_classGroup for the S-integers at primes over p.
- Import ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection. Its original proof and exact
hypothesis translation have an open source gap in that packet; this application is conditional on
that contract.

**Prerequisites.** [HabiroNumberFields:HB.1/finite-endomorphism-obstruction-criterion](#HB-1-finite-endomorphism-obstruction-criterion), [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action), `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `tauceti:IsDedekindDomain.finite_integer_classGroup`.

**Proof route.**

1. The K₂ group is finite and has order prime to p, so multiplication by p^m is an automorphism and
K₂(𝓞 F)/p^m=0.
2. Apply the N.6 injection (Pic(𝓞 L[1/p])/p^m)_{χ⁻¹}↪K₂(𝓞 F)/p^m. Therefore the twisted coinvariant
quotient is zero.
3. By cyclotomic-prime-valuation-action, χ identifies G with (ℤ/p^m)ˣ, a cyclic group for p odd. Apply
finite-endomorphism-obstruction-criterion to a cyclic generator on the p-primary part of the finite
Picard group. This gives zero for Pic[p^m] eigenvectors, the group appearing in Kummer.

**Acceptance.**

- No injection of Pic[p^m] directly into K₂ is asserted.
- The p^m step uses cyclicity and finiteness, including m>1; it never divides by p−1 times p^(m−1).
- If p divides #K₂, the target quotient need not vanish and this conclusion is unavailable.

**Sources.** `CGZ.BlochUnits.Published.2023`, §3.4, Lemma 3.5, p.402.

<a id="HB-1-injective-exact-map-eigenclass-lift"></a>

### Unique eigenclass lifts through an exact map

`HabiroNumberFields:HB.1/injective-exact-map-eigenclass-lift` · lemma

Let R be a commutative ring, G a group, and U,M,C R-linear representations with an injective
equivariant map i:U→M and equivariant δ:M→C satisfying im(i)=ker(δ). Let η:G→Rˣ be a character and
suppose C^η=0. For every x∈M^η there is a unique u∈U^η with i(u)=x. This uses no inverse of |G| and
holds for an infinite G as well.

**Hypotheses.**

- Injectivity, middle exactness and equivariance are required; surjectivity of δ is not.
- Eigenvectors mean simultaneous equations ρ(g)x=η(g)x for every g.

**Prerequisites.** `mathlib:Representation`, [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces).

**Proof route.**

1. Equivariance sends δ(x) to an η-eigenvector, so δ(x)=0.
2. Middle exactness produces u with i(u)=x. For each g, i(ρ_U(g)u−η(g)u)=0. Injectivity forces the
eigenrelation on u.
3. Injectivity also proves uniqueness. This argument establishes only the left-kernel lift; it does not
claim that taking eigenspaces is right exact.

**Acceptance.**

- Apply to the Kummer inclusion U_p/n↪H¹_ét with C=Pic[n].
- Apply again to U/n↪U_p/n with C=D/n when a character value differs from one by a unit.
- For n=9 the lemma still applies to G=(ℤ/9)ˣ without a projector or a division by 6.

**Sources.** `CGZ.BlochUnits.Published.2023`, §3.4, proof of Lemma 3.5, p.402.

<a id="HB-1-ordinary-unit-eigenclass-lift"></a>

### Ordinary unit lifts of cyclotomic étale eigenclasses

`HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift` · application

Under the hypotheses of keune-picard-eigen-obstruction, every χ⁻¹-eigenclass of H¹_ét(𝓞 L[1/p],μ_n)
has a unique preimage in (𝓞 Lˣ/(𝓞 Lˣ)^n)^{χ⁻¹} under the Kummer map followed by inclusion. Hence the
inherited Chern map c_ζ, whose twisted restriction is such an étale eigenclass, factors through
ordinary unit classes. The conclusion is about unit classes, not eigenunit representatives.

**Hypotheses.**

- F number field, p odd, n=p^m with m≥1; p∤disc(F) and p∤#K₂(𝓞 F).
- Use the G-equivariant étale Kummer exact sequence at 𝓞 L[1/p], and the compatibility of restriction
and the Tate trivialization from the parent.
- The Keune source gap is inherited; the Chern consequence also needs the requested early finite-Chern
supplier prefix.

**Prerequisites.** [HabiroNumberFields:HB.1/keune-picard-eigen-obstruction](#HB-1-keune-picard-eigen-obstruction), [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action), [HabiroNumberFields:HB.1/injective-exact-map-eigenclass-lift](#HB-1-injective-exact-map-eigenclass-lift), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](#HB-1-quillen-lichtenbaum-degree-three), `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `tauceti:IsDedekindDomain.selmerGroup.fromSUnitLift_injective`, `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, `tauceti:IsDedekindDomain.selmerGroup.range_toClassGroup`, `MotivicEtaleKTheory:M.1`, `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.

**Proof route.**

1. Kummer gives 0→U_p/n→H¹_ét(𝓞 L[1/p],μ_n)→Pic(𝓞 L[1/p])[n]→0. Use keune-picard-eigen-obstruction and
injective-exact-map-eigenclass-lift to obtain a unique χ⁻¹ class in U_p/n.
2. Let U=𝓞 Lˣ and D=ord_{S_p}(U_p)⊂ℤ^{S_p}. There is an exact sequence 0→U→U_p→D→0. D is a free
finite-rank abelian group, so reduction gives 0→U/n→U_p/n→D/n→0. Work with D/n itself: the map
D/n→ℤ^{S_p}/n need not be injective without a saturation argument. In the reduced sequence, the map
to D/n is surjective. A putative zero kernel element has valuation in nD, so choose a p-unit
realizing its valuation divided by n, subtract its n-th power and obtain an ordinary unit. This
gives an elementwise check of the exactness without a chosen splitting.
3. By cyclotomic-prime-valuation-action, G acts trivially on D/n. Choose σ with χ(σ) mod p different
from one, possible since χ is surjective and p>2. Then χ(σ)⁻¹−1 is a unit in ℤ/p^m, hence
(D/n)^{χ⁻¹}=0. Apply the exact-map lift again.
4. Compose the two injective maps to get uniqueness of the ordinary unit class. For a composite good
order, the inherited units-realise-c-zeta node assembles the prime-power cases using its Chinese
remainder and field-extension compatibility. No uniform S for all n is inferred.

**Acceptance.**

- At n=9, |G|=6 is noninvertible modulo 9, but χ(σ)−1 is invertible for a σ reducing to a nonidentity
element of (ℤ/3)ˣ.
- Taking D=3ℤ inside ℤ shows why D/3D→ℤ/3ℤ can have a kernel; the proof retains D instead.
- The lift is unique modulo n-th powers. It gives no canonical choice of an actual unit and no
equality σu=u^{χ(σ)⁻¹} before passing to classes.

**Sources.** `CGZ.BlochUnits.Published.2023`, §3.4, Lemma 3.5 and proof, pp.402–403.

<a id="HB-1-units-realise-c-zeta"></a>

### The image of c_ζ is realised by units when n avoids 2, Δ_F and K₂(O_F) (CGZ Lemma 3.5)

`HabiroNumberFields:HB.1/units-realise-c-zeta` · theorem

Let F be a number field and n ≥ 1 such that every prime p | n is odd and divides neither Δ_F nor
|K₂(O_F)|. Then the image of c_ζ on K₃(F)/n is contained in the image of O_nˣ/(O_nˣ)^n, so c_ζ :
K₃(F)/n → (O_nˣ/(O_nˣ)^n)^{χ^{−1}}.

**Hypotheses.**

- Every p | n is odd, p ∤ Δ_F and p ∤ |K₂(O_F)|; in particular gcd(n, M′_F) = 1.
- Use HB.1/ordinary-unit-eigenclass-lift, including the exact N.6 Keune supplier and its
original-proof gap.

**Prerequisites.** [HabiroNumberFields:HB.1/s-units-realise-c-zeta](#HB-1-s-units-realise-c-zeta), [HabiroNumberFields:HB.1/the-excluded-primes](#HB-1-the-excluded-primes), [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`, [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift).

**Proof route.**

1. Reduce by coefficient CRT to n=p^m with p odd unramified and p∤#K₂(O_F).
2. Apply ordinary-unit-eigenclass-lift: the equivariant weight-one Kummer interface belongs to M.1, the
finite Picard obstruction is killed through keune-picard-eigen-obstruction, and the Chern class
lifts uniquely to a p-unit class.
3. Use cyclotomic-prime-valuation-action and injective-exact-map-eigenclass-lift on the actual
valuation image D. The quotient D/n is a free trivial G-module with zero χ⁻¹-part; no saturation of
D inside the full coordinate module is assumed.
4. Combine prime-power ordinary-unit classes by CRT. This is a lift of an eigenclass, not a choice of
an eigenunit.

**Acceptance.**

- F = ℚ, n = 3: 3 is odd, 3 ∤ Δ_ℚ = 1 and 3 ∤ |K₂(ℤ)| = 2; the image lies in (ℤ[ζ₃]ˣ/3)^{χ^{−1}} =
⟨ζ₃⟩.
- Only after the totally ramified valuation-module argument do the p-unit representatives become
classes of ordinary units; an S-unit is not automatically a unit.

**Sources.** `CGZ.BlochUnits.2021`, Lemma 3.5, §3.4, p. 20 (arXiv v3); `CGZ.BlochUnits.2021`, Proof of Lemma 3.5, p. 20 (arXiv v3).

<a id="HB-1-odd-cyclotomic-unit-multiplicity"></a>

### Odd-character multiplicity of ordinary units

`HabiroNumberFields:HB.1/odd-cyclotomic-unit-multiplicity` · theorem

Let L/F be a finite Galois extension of number fields, L totally complex, and η:G→ℂˣ a nontrivial
one-dimensional character. Suppose η(c_w)=−1 for the nonidentity stabilizer element c_w at every
infinite place w of L over a real place of F. For the natural action on U_L=(𝓞 L)ˣ and trivial
action on ℂ, dim_ℂ(ℂ⊗_ℤ Additive(U_L))^η=r₂(F). In particular this gives the required rank for
L=F(ζ_p), p odd, and the inverse Teichmüller character after embedding its finite roots of unity in
ℂ. It uses no assertion about the disjointness of the Galois closure of F.

**Hypotheses.**

- η must be a genuine complex character; χ valued in (ℤ/n)ˣ is not itself a complex character for
arbitrary composite n.
- The action on places is Mathlib’s σ•w=w∘σ⁻¹. The action on units is Units.map of the restricted ring
automorphism.
- If F has no real places the oddness condition is vacuous, but η must still be nontrivial.

**Prerequisites.** [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `mathlib:NumberField.Units.logEmbedding`, `mathlib:NumberField.Units.dirichletUnitTheorem.sum_logEmbedding_component`, `mathlib:NumberField.Units.logEmbeddingEquiv`, `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`, `mathlib:NumberField.Units.sum_mult_mul_log`, `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.InfinitePlace.mult`, `mathlib:NumberField.InfinitePlace.smul_apply`, `mathlib:NumberField.InfinitePlace.orbitRelEquiv`, `mathlib:NumberField.InfinitePlace.IsUnramified.stabilizer_eq_bot`, `mathlib:NumberField.ComplexEmbedding.IsConj.coe_stabilizer_mk`, `mathlib:NumberField.RingOfIntegers.mapRingHom`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.Units.instZLattice_unitLattice`, `mathlib:NumberField.Units.unitLattice_rank`, `mathlib:Module.Basis.ofZLatticeBasis`, [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action), `mathlib:NumberField.Units.mem_torsion`, `mathlib:NumberField.InfinitePlace.exists_isConj_of_isRamified`.

**Proof route.**

1. Start with Mathlib logEmbeddingEquiv and unitLattice_span_eq_top. Restore the omitted coordinate by
sum_logEmbedding_component, obtaining the full weighted logarithm in H={f:S_∞(L)→ℝ | Σ_w f(w)=0}.
The baseline instZLattice_unitLattice and Module.Basis.ofZLatticeBasis make an integral lattice
basis a real basis; equivalently unitLattice_rank equals the real dimension. Therefore tensoring the
integral unit quotient with ℝ gives an isomorphism onto H, rather than merely a surjection. Finite
torsion disappears under tensoring.
2. Check equivariance on each coordinate: λ(σu)(w)=mult(w)log|σu|_w=λ(u)(σ⁻¹•w). Multiplicity is
unchanged by an automorphism. Thus the logarithmic isomorphism is equivariant for the actual
baseline action even though logEmbedding with its omitted place is not.
3. Complexify. The permutation module on infinite places is H_ℂ plus the constant line; the sum map
splits equivariantly in characteristic zero. A nontrivial η has zero component in that line. Do not
apply this splitting over ℤ/n when |G| is noninvertible.
4. Use orbitRelEquiv to decompose places by base infinite places. On a transitive orbit G/G_w, an
η-eigenfunction is determined by one value; it has one free parameter exactly when η is trivial on
G_w, and otherwise it is zero. Over a complex base place, IsUnramified.stabilizer_eq_bot gives
G_w=1. Over a real place, exists_isConj_of_isRamified supplies c_w, and the IsConj stabilizer
formula gives G_w={1,c_w}, and oddness gives zero. There are precisely r₂(F) complex base places.
5. For L=F(ζ_p) with p∤disc(F), cyclotomic-prime-valuation-action gives full G=(ℤ/p)ˣ. Its inverse
Teichmüller lift is nontrivial and has value −1 on every real-place conjugation. Use the integral
lattice comparison, not a chosen isomorphism ℂ≃ℚ_p, for the p-adic rank application.

**Acceptance.**

- F=ℚ, L=ℚ(ζ_5), inverse cyclotomic character: multiplicity zero.
- F=ℚ(∛2), L=F(ζ_3), sign character: multiplicity one=r₂(F), although the Galois closure contains ζ_3.
- For the trivial character, invariants have dimension r₁(F)+r₂(F)−1; the nontrivial hypothesis
detects the missing constant-line subtraction.

**Sources.** `CGZ.BlochUnits.Published.2023`, §2.6, Proposition 2.12(a) and proof, p.399; `Sutherland.HerbrandUnits.2021`, Theorem 24.6, pp.3–4.

<a id="HB-1-equivariant-unit-rank"></a>

### Ordinary units: multiplicity of a nontrivial odd complex character

`HabiroNumberFields:HB.1/equivariant-unit-rank` · theorem

Let F be a number field, n≥3, L=F(ζ_n), G=Gal(L/F), and η:G→C× an actual nontrivial complex
character. Assume η is odd on every real-place stabilizer (η(c_v)=−1). Then the η-eigenspace in
O_L×⊗_Z C has dimension r₂(F). The weighted equivariant logarithmic embedding identifies this
representation with the augmentation hyperplane of the permutation module on infinite places; each
complex-place orbit contributes once and each real-place orbit contributes zero. For p an odd prime
unramified in F, η may be the inverse complex lift of the Teichmüller character of Gal(F(ζ_p)/F). A
character valued in (Z/n)× for composite n is not itself a complex character and is not inserted
into this formula.

**Hypotheses.**

- η is an actual nontrivial complex character, odd on real-place stabilizers.
- Use odd-cyclotomic-unit-multiplicity for the weighted logarithm, integral lattice, scalar extension
and place action.

**Prerequisites.** [HabiroNumberFields:HB.1/cyclotomic-character-and-eigenspaces](#HB-1-cyclotomic-character-and-eigenspaces), `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, [HabiroNumberFields:HB.1/odd-cyclotomic-unit-multiplicity](#HB-1-odd-cyclotomic-unit-multiplicity).

**Proof route.**

1. Apply HB.1/odd-cyclotomic-unit-multiplicity with the stated η.
2. For prime p, specialize by the inverse Teichmüller lift. Pass to the residual quotient only through
prime-unit-torsion-exact-sequence.

**Acceptance.**

- F=Q and odd p: the inverse odd-character complex multiplicity is zero.
- F=Q(√−7), p=5: multiplicity r₂(F)=1.
- The residual p=3 eigenspace has one additional torsion dimension; it is a separate assertion.

**Sources.** `CGZ.BlochUnits.2021`, Proposition 2.12(a) and its proof, §2.6, pp. 16–17 (arXiv v3).

<a id="HB-1-prime-unit-torsion-exact-sequence"></a>

### The torsion correction in the prime unit eigenspace

`HabiroNumberFields:HB.1/prime-unit-torsion-exact-sequence` · theorem

Let F be a number field, p odd and p∤disc(F), L=F(ζ_p), G=Gal(L/F), χ:G≃(ℤ/p)ˣ, U=(𝓞 L)ˣ and
T=NumberField.Units.torsion L. The canonical maps give an exact sequence
0→(T/T^p)^{χ⁻¹}→(U/U^p)^{χ⁻¹}→((U/T)/(U/T)^p)^{χ⁻¹}→0 of ℤ/p-vector spaces. The right term has
dimension r₂(F); the left term has dimension 1 for p=3 and 0 for p≥5. Therefore
dim(U/U^p)^{χ⁻¹}=r₂(F)+[p=3].

**Hypotheses.**

- Unramifiedness gives full G of order p−1 and μ_{p^∞}(L)=μ_p. In particular χ=χ⁻¹ exactly for p=3 in
this regime.
- T/T^p injects into U/U^p because U/T is free; replacing it by a torsion-free quotient of U too soon
loses the correction.
- The complex multiplicity computation alone does not justify reduction modulo p.

**Prerequisites.** [HabiroNumberFields:HB.1/odd-cyclotomic-unit-multiplicity](#HB-1-odd-cyclotomic-unit-multiplicity), [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action), [HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order](#HB-1-the-eigenspace-and-division-by-a-group-order), `mathlib:NumberField.Units.torsion`, `mathlib:NumberField.Units.logEmbeddingEquiv`, [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](#HB-1-quillen-lichtenbaum-degree-three), `mathlib:NumberField.Units.basisModTorsion`.

**Proof route.**

1. The pinned basisModTorsion gives the free finite-rank integral quotient U/T. Tensor its exact
sequence with ℤ/p: its p-torsion vanishes, giving 0→T/T^p→U/U^p→(U/T)/p→0.
2. Since |G|=p−1 is invertible in ℤ_p and ℤ/p, the inverse-Teichmüller idempotent is defined and exact
on these modules. Promote only this legitimate projector specialization of the parent, never one for
p^m with m>1.
3. The characteristic-zero character multiplicity of the integral representation U/T is computed by
odd-cyclotomic-unit-multiplicity. Its matrices have integral traces. Evaluate the character
idempotent in the field of (p−1)-st roots of unity and then in ℤ_p; trace, and hence the rank of the
idempotent summand, is r₂(F). As a direct summand of a finite free ℤ_p-module it is free, and
reduction has the same dimension.
4. The local degree statement for m=1 and m=2 shows L cannot contain ζ_{p²}; otherwise its p-adic
completion of degree p−1 would contain a subextension of degree p(p−1). Thus the p-primary part of T
is μ_p. It carries χ, so its inverse-character part contributes precisely when χ²=1. Full G gives
p=3.
5. This supplies the corrected cardinality on the unit side of the inherited cgz-theorem-1-5. The
K₃-side torsion count remains the imported parent comparison, not a fresh K₃ computation.

**Acceptance.**

- F=ℚ, p=3: U=μ_6, U/U³≅ℤ/3 in the χ=χ⁻¹ eigenspace, although r₂(ℚ)=0.
- F=ℚ, p=5: the inverse-character eigenspace is zero.
- For a field containing ζ_p the full-G hypothesis fails; χ may be trivial and the stated δ_{p,3}
formula does not apply.

**Sources.** `CGZ.BlochUnits.Published.2023`, §2.6, Proposition 2.12(b), p.399; §3.5, p.403.

<a id="HB-1-eigenspace-of-units-mod-p"></a>

### (O_pˣ/(O_pˣ)^p)^{χ^{−1}} ≅ (ℤ/p)^{r₂(F)} when χ ≠ χ^{−1} (CGZ Proposition 2.12(b))

`HabiroNumberFields:HB.1/eigenspace-of-units-mod-p` · theorem

Let F be a number field and p a prime with ζ_p ∉ F. Then rank_{ℤ_p}(O_pˣ ⊗ ℤ_p)^{χ^{−1}} = r₂(F),
where χ is Teichmüller-lifted to ℤ_pˣ (|G| divides p − 1). If moreover χ ≠ χ^{−1} (equivalently |G|
> 2; this fails for p = 3), then (O_pˣ/(O_pˣ)^p)^{χ^{−1}} ≅ (ℤ/p)^{r₂(F)}. If χ = χ^{−1}, the roots
of unity of p-power order contribute, and the dimension is r₂(F) + 1 when μ_{p^∞}(F_p) = μ_p.

**Hypotheses.**

- ζ_p ∉ F; for the last statement χ ≠ χ^{−1}.
- The passage from ℤ_p to ℤ/p uses exactness of the eigenspace functor, valid because |G| divides p −
1 (HB.1/the-eigenspace-and-division-by-a-group-order).

**Prerequisites.** [HabiroNumberFields:HB.1/equivariant-unit-rank](#HB-1-equivariant-unit-rank), [HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order](#HB-1-the-eigenspace-and-division-by-a-group-order), `mathlib:NumberField.Units.torsionOrder`, [HabiroNumberFields:HB.1/prime-unit-torsion-exact-sequence](#HB-1-prime-unit-torsion-exact-sequence), [HabiroNumberFields:HB.1/odd-cyclotomic-unit-multiplicity](#HB-1-odd-cyclotomic-unit-multiplicity).

**Proof route.**

1. Use odd-cyclotomic-unit-multiplicity and the integral torsion-free unit basis to compute the inverse
Teichmüller multiplicity over Z_p. The actual G is a subgroup of (Z/p)×, and its order divides p−1.
2. Use the legal integral idempotents and the exact sequence 0 → T/T^p → U/U^p → (U/T)/(U/T)^p → 0; the
torsion quotient has residual character χ, so it contributes to χ⁻¹ exactly when χ=χ⁻¹.
3. In the unramified case p∤disc(F), apply prime-unit-torsion-exact-sequence directly: G has order p−1,
μ_(p^∞)(L)=μ_p and the extra dimension occurs exactly at p=3. Do not assert full G or p=3 as the
only torsion case without unramifiedness.

**Acceptance.**

- F = ℚ, p = 5, 7: dimension 0 = r₂(ℚ) (PARI/GP).
- F = ℚ(√−7), p = 5: dimension 1 = r₂ (PARI/GP).
- F = ℚ, p = 3: dimension 1 ≠ r₂(ℚ) = 0; here χ = χ^{−1} and the statement does not apply (PARI/GP).

**Sources.** `CGZ.BlochUnits.2021`, Proposition 2.12(b), §2.6, p. 16 (arXiv v3).

<a id="HB-1-cgz-theorem-1-5"></a>

### Injectivity and image of the Chern class map (CGZ Theorem 1.5)

`HabiroNumberFields:HB.1/cgz-theorem-1-5` · theorem

Let F be a number field and ζ a primitive n-th root of unity. (a) For each n, c_ζ maps K₃(F)/n into
(O_{S,n}ˣ/(O_{S,n}ˣ)^n)^{χ^{−1}} for a finite set S = S(F, n) of primes
(HB.1/s-units-realise-c-zeta). (b) If gcd(n, M_F) = 1, or gcd(n, M′_F) = 1 and 9 ∤ n, then c_ζ :
K₃(F)/n → (O_nˣ/(O_nˣ)^n)^{χ^{−1}} is injective. (c) If in addition n is square-free (in particular
prime), it is an isomorphism. The count behind (c): for p | n prime to 2Δ_F|K₂(O_F)|, |K₃(F)/p| =
p^{r₂(F) + ε_p} and |(O_pˣ/(O_pˣ)^p)^{χ^{−1}}| = p^{r₂(F) + ε_p}, where ε_p = 1 if p = 3 and ε_p = 0
if p ≥ 5 (3 | w₂(F) always, and χ = χ^{−1} exactly when p = 3). CGZ §3.5 write (ℤ/n)^{r₂(F)} on both
sides, which is wrong for 3 | n (E2).

**Hypotheses.**

- F a number field; n ≥ 1 with the stated coprimality to M_F or to M′_F; square-free n for (c).
- (a) holds for every n, but S may depend on n.

**Prerequisites.** [HabiroNumberFields:HB.1/s-units-realise-c-zeta](#HB-1-s-units-realise-c-zeta), [HabiroNumberFields:HB.1/injectivity-of-c-zeta](#HB-1-injectivity-of-c-zeta), [HabiroNumberFields:HB.1/units-realise-c-zeta](#HB-1-units-realise-c-zeta), [HabiroNumberFields:HB.1/eigenspace-of-units-mod-p](#HB-1-eigenspace-of-units-mod-p), [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](#HB-1-quillen-lichtenbaum-degree-three), [HabiroNumberFields:HB.1/the-excluded-primes](#HB-1-the-excluded-primes).

**Proof route.**

1. (a) is HB.1/s-units-realise-c-zeta.
2. (b): gcd(n, M′_F) = 1 with 9 ∤ n gives n odd and p ∤ w₂(F) for p² | n (HB.1/the-excluded-primes),
hence injectivity by HB.1/injectivity-of-c-zeta. Every p | n is odd, p ∤ Δ_F and p ∤ |K₂(O_F)|,
hence units by HB.1/units-realise-c-zeta.
3. (c): reduce to n = p by the Chinese remainder theorem. K₃(F)/p has order p^{r₂ + ε_p}
(HB.1/quillen-lichtenbaum-degree-three: torsion ℤ/w₂ or ℤ/2w₂ ⊕ (ℤ/2)^{r₁−1}, and for p odd, p ∤
Δ_F: p | w₂(F) ⇔ p = 3). The units side has order p^{r₂ + ε_p} (HB.1/eigenspace-of-units-mod-p for p
≥ 5; for p = 3, rank r₂ plus μ₃ in the χ^{−1} = χ eigenspace). An injection of finite groups of the
same order is an isomorphism.

**Acceptance.**

- F = ℚ, n = 3 (coprime to M′_ℚ = 4): c_ζ : K₃(ℚ)/3 ≅ ℤ/3 → ⟨ζ₃⟩ ≅ ℤ/3 is an isomorphism, while
(ℤ/3)^{r₂(ℚ)} = 0.
- F = ℚ(√−7), n = 5: both sides are ℤ/5 (r₂ = 1; 5 ∤ w₂(ℚ(√−7)) = 24).
- No statement is made for n sharing a prime with M_F (or with M′_F when 9 | n).

**Sources.** `CGZ.BlochUnits.2021`, Theorem 1.5, §1.2, p. 4 (arXiv v3); `CGZ.BlochUnits.2021`, §3.5, pp. 20–21 (arXiv v3).

## HB.2 — Cyclic dilogarithms, bar classes and finite comparison

The cyclic polynomial and its Kummer value are built first. The finite hypergeometric
sum provides the exact odd-order KMS identity; it yields the finite five-term relation and
regulator descent. The analytic proof starts in a small branch-qualified neighborhood of
(X,Y)=(1/5,2), where |X/Y|<|Z|<1 and Re(S)>0. These inequalities do not hold throughout
0<X<1<Y. The QM.0, QM.1 and P.1 requests supply its common analytic ingredients.

The eta class, positive cyclic bar cycle and Bott Bockstein are compared through V.3/V.4,
including the degenerate cubic symbol. Signed Soulé evaluation is restricted to N=ℓ^m
with ℓ an odd prime and m≥1. The fixed CGZ/GSWZ normalization has its own comparison
obligation. The unknown-power comparison and the conditional scalar implication remain
here; HabiroNahmSeries HB.5 assembles the unconditional consequence after HB.4.

The layer’s planets are [Cyclic quantum dilogarithm](#HB-2-the-cyclic-quantum-dilogarithm), [Kashaev–Mangazeev–Stroganov identity](#HB-2-kms-odd-order-proof), [The map R_ζ](#HB-2-the-map-R-zeta), [Chern class of η_ζ](#HB-2-chern-class-of-eta), [CGZ comparison theorem](#HB-2-the-comparison-with-the-chern-class), [The units ε_m(ξ)](#HB-2-the-exported-interface).

The following targets are ordered by their exact internal prerequisites.

<a id="HB-2-the-cyclic-quantum-dilogarithm"></a>

### The cyclic quantum dilogarithm D_ζ

`HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm` · definition

Let R be a commutative ring, n ≥ 1 and ζ ∈ R with ζ^n = 1. The CYCLIC QUANTUM DILOGARITHM is the
polynomial D_ζ(x) = ∏_{k=1}^{n−1} (1 − ζ^k x)^k ∈ R[x] (CGZ (8)). For ζ a primitive n-th root of
unity in a field it satisfies, for every m ≥ 0, the root-change identity (1 − x^n)^m · D_ζ(ζ^m x) =
D_ζ(x) · ∏_{k=0}^{m−1} (1 − ζ^k x)^n (CGZ (21), cleared of denominators); the value identity
D_ζ(1)^2 = (−1)^{n(n−1)/2} ζ^{(n−1)n(2n−1)/6} n^n for n odd (CGZ (23)); and D_ζ(1)^{24} = n^{12n}
for every n. For n odd, D_ζ(1) ≡ ζ^{n/3} modulo (Q(ζ)^×)^n when 3 | n and D_ζ(1) ∈ (Q(ζ)^×)^n when 3
∤ n (CGZ Lemma 2.4(b), which states it only modulo n-th powers of the Kummer extension). GSWZ (122)
uses the different normalisation D^{GSWZ}_{ζ_m}(z) = ∏_{ℓ=1}^{m−1}(1 − ζ_m^ℓ z)^{ℓ/m}, the principal
branch for |z| < 1, which is the m-th root of D_{ζ_m}(z); its value identity (125)
D^{GSWZ}_{ζ_m}(1)^{24m} = m^{12m} is the same statement as D_{ζ_m}(1)^{24} = m^{12m}.

**Hypotheses.**

- ζ^n = 1 suffices for the definition; the identities use that ζ is a primitive n-th root of unity in
a field (so that ∏_{k=0}^{n−1}(1 − ζ^k x) = 1 − x^n and ∏_{k=1}^{n−1}(1 − ζ^k) = n).
- The value identity (23) is stated for odd n; the identity D_ζ(1)^{24} = n^{12n} holds for all n ≥ 1.
- The two normalisations (CGZ's D_ζ and GSWZ's D^{GSWZ}_{ζ_m} = D_{ζ_m}^{1/m}) are different objects;
every consumer names the one it uses.

**Prerequisites.** `mathlib:Polynomial`, `mathlib:IsPrimitiveRoot.autToPow`.

**Proof route.**

1. Define D_ζ as a finite product in R[x].
2. Prove the root-change identity by reindexing the product and using ∏_{k=0}^{n−1}(1 − ζ^{k+m}x)^m =
(1 − x^n)^m (CGZ proof of Lemma 2.4(a)).
3. Prove (23) by pairing k with n − k and using (1 − ζ^{−k}) = −ζ^{−k}(1 − ζ^k) and ∏_{k=1}^{n−1}(1 −
ζ^k) = n.
4. Deduce D_ζ(1)^{24} = n^{12n}: pairing k with n − k gives D_ζ(1)^2 = ±ζ^e n^n for every n (not only
odd n), and (±ζ^e)^{12} = 1 because 12e ≡ 0 mod n.
5. Deduce the n-th-power statement for odd n: by (23), D_ζ(1)^2 = ±ζ^e n^n with e ≡ 2n/3 (3 | n) or e ≡
0 (3 ∤ n) modulo n; ±n^n is an n-th power for n odd, and squaring is bijective on a group of odd
exponent n.
6. Record GSWZ's normalisation as the principal branch of the m-th root on the open unit disc and prove
that its 24m-th power at 1 is the 24th power of D_{ζ_m}(1).

**Uses that determine the API.**

- CGZ §2.2, (20): P_ζ(X) = D_ζ(x)/D_ζ(1) with x^n = X
- CGZ Theorem 2.11 via KMS (C.7): the five-term identity is an identity between values of D_ζ
- HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface: imports the quasi-periodicity D_ζ(ζx)/D_ζ(x) =
(1−x)^m/(1−x^m) and the value of D_ζ(1)
- GSWZ Lemma 2.12 and (125): D_{ζm}(1)^{24m} = m^{12m} in the GSWZ normalisation

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `cyclicQuantumDilog` | data | D_ζ(x) = ∏_{k=1}^{n−1}(1 − ζ^k x)^k ∈ R[x] for ζ ∈ R. |
| `cyclicQuantumDilog_map` | functoriality | For a ring map f : R → S, map f (D_ζ) = D_{f ζ}. |
| `cyclicQuantumDilog_eval_mul_zeta_pow` | characterisation | (1 − x^n)^m D_ζ(ζ^m x) = D_ζ(x) ∏_{k=0}^{m−1}(1 − ζ^k x)^n for ζ primitive of order n in a field (CGZ (21)). |
| `cyclicQuantumDilog_eval_one_sq` | simp | For n odd, D_ζ(1)^2 = (−1)^{n(n−1)/2} ζ^{(n−1)n(2n−1)/6} n^n (CGZ (23)). |
| `cyclicQuantumDilog_eval_one_pow_24` | simp | D_ζ(1)^{24} = n^{12n} for ζ a primitive n-th root of unity in a field. |
| `cyclicQuantumDilog_eval_one_mem_pow` | relation | For n odd, D_ζ(1) ≡ ζ^{n/3} (3 \| n), respectively ≡ 1 (3 ∤ n), modulo (Q(ζ)^×)^n. |
| `gswzDilog` | other | The GSWZ normalisation D^{GSWZ}_{ζ_m}(z) = ∏(1 − ζ_m^ℓ z)^{ℓ/m} on \|z\| < 1 (principal branch), with (D^{GSWZ}_{ζ_m})^m = D_{ζ_m}; this is what HabiroNahmSeries:HB.4 and HB.8 use. |

**Unit tests.**

- `cyclicQuantumDilog_two` (computation): For R = Q, n = 2, ζ = −1: D_{−1}(x) = 1 + x.
- `cyclicQuantumDilog_eval_one_pow_24_example` (computation): For ζ a primitive n-th root of unity in Q(ζ_n) and 2 ≤ n ≤ 16, D_ζ(1)^{24} = n^{12n} (checked in PARI/GP).
- `cyclicQuantumDilog_eval_one_pow_24n_ne` (non-example): For n = 3 and ζ a primitive cube root of unity, D_ζ(1)^{72} ≠ 3^{36}: the identity D(1)^{24m} = m^{12m} holds only in GSWZ's m-th-root normalisation, which a definition confusing the two would get wrong.
- `cyclicQuantumDilog_eval_mul_zeta` (characterisation): D_ζ(ζx)(1 − x^n) = D_ζ(x)(1 − x)^n in Q(ζ_n)[x] (checked for n ≤ 9).
- `cyclicQuantumDilog_eval_one_nine` (computation): For n = 9, D_ζ(1)/ζ^3 is a 9th power in Q(ζ_9) and D_ζ(1)/ζ^e is not for e ≠ 3 (checked in PARI/GP).

**Acceptance.**

- D_ζ(ζx)(1 − x^n) = D_ζ(x)(1 − x)^n as polynomials.
- D_ζ(1)^{24} = n^{12n}, and D_ζ(1)^{24n} ≠ n^{12n} for n ≥ 2.
- For odd n, D_ζ(1)/ζ^{n/3} (3 | n) or D_ζ(1) (3 ∤ n) is an n-th power in Q(ζ).

**Sources.** `CGZ.BlochUnits.2021`, §1.1, equation (8), p. 3 (arXiv v3); `CGZ.BlochUnits.2021`, §2.2, proof of Lemma 2.4, equations (21) and (23), pp. 10–11; `GSWZ.HabiroNumberField.2024`, §2.4, equation (122) p. 30 and equation (125) p. 31.

<a id="HB-2-cyclic-hypergeometric-sum"></a>

### The cyclic hypergeometric sum

`HabiroNumberFields:HB.2/cyclic-hypergeometric-sum` · construction

For any field K, n≥0 and ζ,x,y,z∈K, define
f_{n,ζ}(x,y|z)=∑_{0≤k<n}(∏_{0≤j<k}(1−ζ^(j+1)y))/(∏_{0≤j<k}(1−ζ^(j+1)x))·z^k. This is a total
field-valued finite expression. Its cyclic interpretation requires n>0, ζ primitive of order n,
x^n≠1 and (1−y^n)z^n=1−x^n: then extending the summand by its recurrence gives period n. No branch,
nth root of D or completed q-product is part of this object. The general finite q-Pochhammer
notation remains QM.0’s; the displayed finite products specify this specialized sum without defining
a second general q-product.

**Hypotheses.**

- All divisions use field division; identities requiring cancellation explicitly exclude zero
denominators.
- For the cyclic interpretation and shift law, also require y^n≠1.

**Prerequisites.** `mathlib:IsPrimitiveRoot`, `mathlib:IsPrimitiveRoot.geom_sum_eq_zero`.

**Proof route.**

1. Use finite sums/products over Finset.range, with the k=0 summand equal to one.
2. The period relation follows from ∏_{j=1}^n(1−ζ^j x)=1−x^n and its y analogue.
3. Derive the z shift by multiplying the summand recurrence by ζ^k and summing one complete period.

**Uses that determine the API.**

- CGZ Theorem 2.11: Its nth power is the explicit witness that the five-term product is an nth power.
- GZ Appendix A (58)–(59): It is the sum of the leading constants in the n residue classes of the
bilateral series.
- HB.2 finite-field acceptance: Evaluate the finite expression without complex analytic branches.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `TauCeti.HabiroNF.cyclicHypergeom_eq_sum` | data | The displayed finite sum of product ratios, for arbitrary n≥0 and field arguments. |
| `TauCeti.HabiroNF.cyclicHypergeom_zero` | simp | f_{0,ζ}(x,y\|z)=0. |
| `TauCeti.HabiroNF.cyclicHypergeom_one` | simp | f_{1,ζ}(x,y\|z)=1. |
| `TauCeti.HabiroNF.cyclicHypergeom_two` | simp | f_{2,ζ}(x,y\|z)=1+(1−ζy)/(1−ζx)·z, even when the denominator is zero in the total field expression. |
| `TauCeti.HabiroNF.cyclicHypergeom_map` | functoriality | For a field homomorphism φ:K→L, φ(f_{n,ζ}(x,y\|z))=f_{n,φζ}(φx,φy\|φz); identity and composition follow from this equation. |
| `TauCeti.HabiroNF.cyclicHypergeom_diagonal` | characterisation | If every denominator product for k<n is nonzero, f_{n,ζ}(x,x\|z)=∑_{k<n}z^k. |
| `TauCeti.HabiroNF.cyclicHypergeom_diagonal_root` | compatibility | Under that denominator condition, if z is primitive of order n>1 then f_{n,ζ}(x,x\|z)=0 by IsPrimitiveRoot.geom_sum_eq_zero. |
| `TauCeti.HabiroNF.cyclicHypergeom_shift_z` | relation | For primitive ζ of order n>0, x^n≠1, y^n≠1 and (1−y^n)z^n=1−x^n: (1−z)f(x,y\|z)=(x−ζyz)f(x,y\|ζz). |

**Unit tests.**

- `cyclicHypergeom_empty` (degenerate): n=0 gives 0 over any field.
- `cyclicHypergeom_singleton` (computation): n=1 gives 1 over any field.
- `cyclicHypergeom_rational_two` (computation): Over Q, f_{2,−1}(2,3|5)=23/3; starting the Pochhammer at j=0 gives a different answer.
- `cyclicHypergeom_diagonal_three` (compatibility): Over C, with ζ primitive of order 3 and x=0, f_{3,ζ}(0,0|ζ)=0; agree exactly with Mathlib’s geometric-sum theorem.

**Acceptance.**

- The sum starts at k=0 and stops before n; the Pochhammer factor starts at ζy, not y.
- The definition is useful independently of choosing x,y,z as nth roots.

**Sources.** `CGZ.published`, §2.5, proof of Theorem 2.11, p.398; `GZ.published`, Appendix A, (56), p.235.

<a id="HB-2-kms-odd-order-proof"></a>

### The odd-order Kashaev–Mangazeev–Stroganov identity

`HabiroNumberFields:HB.2/kms-odd-order-proof` · theorem

Let K be a field, n≥3 odd and invertible in K, ζ primitive of order n, and x,y,z∈K×. Write
X=x^n,Y=y^n,Z=z^n. Assume X≠1, Y≠1, X≠Y and (1−Y)Z=1−X. With T=n(n−1)/2 and the parent D_ζ,
f_{n,ζ}(x,y|z)^n D_ζ(1/x)D_ζ(ζy)D_ζ(ζ/z)=(ζy)^T D_ζ(1)D_ζ(ζy/x)D_ζ(x/(yz)). The three D factors on
the left are nonzero under these hypotheses, so this is exactly CGZ’s quoted (C.7), after division.
For n=1 both sides are one. This node supplies the odd-order proof used by the parent five-term
theorem; it does not broaden that theorem to even orders.

**Hypotheses.**

- No division by n occurs in the final cleared identity.
- Positive characteristic is obtained by integral specialization, not by embedding K into C.

**Prerequisites.** [HabiroNumberFields:HB.2/cyclic-hypergeometric-sum](#HB-2-cyclic-hypergeometric-sum), [HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm](#HB-2-the-cyclic-quantum-dilogarithm), `QSeriesPartitionsAndMockModularForms:QM.0`, `QSeriesPartitionsAndMockModularForms:QM.1/eta-transformation-law`, `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1`.

**Proof route.**

1. Import QM.0’s requested bilateral Ramanujan identity and common leading-product asymptotics; import
the eta transformation law from QM.1. These common analytic results must be extracted before
HB.2/HB.4; importing HB.4 here would create a cycle.
2. Over C use a sufficiently small simply connected neighborhood of (X,Y)=(1/5,2), with Z=(1−X)/(1−Y),
preserving |X/Y|<|Z|<1 and Re S>0. At its center Z=−4/5, |X/Y|=1/10 and S=4/9. Choose local analytic
nth roots. Work first on its generic nonreal subopen with nonvanishing q-product factors. For q=ζ
exp(−ε/n), the bilateral series Ψ=∑_{k∈Z}(qy;q)_k/(qx;q)_k z^k equals
(q;q)_∞(qyz;q)_∞(1/(yz);q)_∞(x/y;q)_∞ divided by (qx;q)_∞(1/y;q)_∞(z;q)_∞(x/(yz);q)_∞. At removable
singularities of the quotient defining negative-index summands, use its backward recurrence
A_(k−1)=A_k(1−q^k x)/(z(1−q^k y)) and analytic continuation. The inequalities 0<X<1<Y alone do not
imply bilateral convergence.
3. QM.0’s requested uniform residue-class/tail estimate gives √ε Ψ→√(2π/n)√S f, S=(1−X)(1−Y)/(X−Y). The
local exponent is (Y−X)j²nε/(2(1−X)(1−Y)), whose real part is negative. Use additive limits, which
do not assume f≠0. Correct the sign and missing √n in GZ p.236 (EHB2.1–2).
4. Apply the common product limit to fixed arguments, using the exact identities (qx;q)_∞=(x;q)_∞/(1−x)
and (qyz;q)_∞=(yz;q)_∞/(1−yz). The product side raised to n has prefactor (2π/ε)^(n/2) μ^n C^(n/2)
times D(x)D(1/y)D(z)D(x/(yz)) divided by D(yz)D(1/(yz))D(x/y), times ((1−x)/(1−yz))^n. Its
exponential is exp(−B/ε). P.1’s requested classical five-term identity gives B=0;
C/S=((1−YZ)/(1−X))², with the positive branch at this real base point. Keep the parameter shifts;
the fixed-ζ substitution printed on p.237 loses them (EHB2.3).
5. For ζ=exp(2πih/n), the QM.1 eta law gives μ=exp(−πi s(h,n)), s the Dedekind sum. Directly
multiplying the arguments of 1−ζ^k gives D_ζ(1)=n^(n/2)exp(πin s(h,n)), hence μ^n=n^(n/2)/D_ζ(1).
This fixes the phase rather than absorbing an unspecified root of unity (EHB2.4).
6. Use the parent D shift and the directly verified inversion identity D(u)D(1/u)=a
u^(−T)((1−u^n)/(1−u))^n, a=(−1)^T ζ^(∑_{k=1}^{n−1}k²), with D(1)²=a n^n. Since n is odd, ζ^T=1.
Substitute C/S and cancel to obtain the stated identity on the open complex set.
7. Clear all product denominators and the powers of x,y,z. Work over A=Z[t]/Φ_n(t), with t mapped to ζ.
The surface relation is monic in x, x^n=1−z^n+y^n z^n, so its coordinate ring is torsion-free over A
with basis 1,x,…,x^(n−1). The generic binomial is irreducible over C(y,z): its right side has a
simple zero along a divisor in y and is not a dth power for any d|n. Thus equality on the open set
is equality of the reduced polynomial coefficients; inject A into C and descend those zero
coefficients integrally. Specialize A to K and cancel only the nonzero factors from the hypotheses.
8. Apply this witness to the parent kummer-value-P and five-term-distribution-and-galois nodes. All
root choices are covered by the same integral identity.

**Acceptance.**

- Exhaustive prime-field checks for a fixed primitive ζ: (n,p)=(3,19),(5,31),(7,43),(9,73), with
108,500,1372,4374 admissible triples respectively. Each check ranges over every admissible x,y,z,
including all nth-root choices in that field.
- The n=1 empty-product case is one.
- The analytic route is independent of Nahm sums and imports no HB.4 result.
- At the analytic base point (X,Y,Z)=(1/5,2,−4/5), |X/Y|=1/10<4/5=|Z|<1 and S=4/9>0. The point
(9/10,2,−1/10) satisfies 0<X<1<Y but fails |X/Y|<|Z|; it must be rejected by the convergence-domain
witness.

**Sources.** `CGZ.published`, §2.5, p.398, quoted (C.7); `GZ.published`, Appendix A, Proposition 8.1 and (55)–(60), pp.235–237.

<a id="HB-2-kms-identity"></a>

### The Kashaev–Mangazeev–Stroganov identity for D_ζ

`HabiroNumberFields:HB.2/kms-identity` · lemma

Let K be a field, n≥3 odd and invertible in K, ζ primitive of order n, and x,y,z∈K×. Write
X=x^n,Y=y^n,Z=z^n. Assume X≠1, Y≠1, X≠Y and (1−Y)Z=1−X. With T=n(n−1)/2 and the parent D_ζ,
f_{n,ζ}(x,y|z)^n D_ζ(1/x)D_ζ(ζy)D_ζ(ζ/z)=(ζy)^T D_ζ(1)D_ζ(ζy/x)D_ζ(x/(yz)). The three D factors on
the left are nonzero under these hypotheses, so this is exactly CGZ’s quoted (C.7), after division.
For n=1 both sides are one. This node supplies the odd-order proof used by the parent five-term
theorem; it does not broaden that theorem to even orders.

**Hypotheses.**

- No division by n occurs in the final cleared identity.
- Positive characteristic is obtained by integral specialization, not by embedding K into C.

**Prerequisites.** [HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm](#HB-2-the-cyclic-quantum-dilogarithm), [HabiroNumberFields:HB.2/kms-odd-order-proof](#HB-2-kms-odd-order-proof).

**Proof route.**

1. Apply HB.2/kms-odd-order-proof, which supplies the corrected analytic proof route and integral
specialization.
2. The n=1 empty-product identity is checked separately; the finite five-term consumer uses positive
odd n. No even-order extension is asserted.

**Acceptance.**

- The cleared odd-order identity is exact for every admissible choice of roots.
- Use the four cyclic-hypergeometric-sum tests and the analytic witness (X,Y)=(1/5,2); 0<X<1<Y alone
is insufficient.

**Sources.** `CGZ.BlochUnits.2021`, §2.5, proof of Theorem 2.11, p. 15.

<a id="HB-2-kummer-value-P"></a>

### The Kummer-extension value P_ζ and its independence of the root

`HabiroNumberFields:HB.2/kummer-value-P` · construction

Let F be a field, n ≥ 1 prime to the characteristic, ζ a primitive n-th root of unity, F_n = F(ζ),
and H/F_n a Kummer extension containing an n-th root of every element of a finite set Σ ⊂ F^× (CGZ
uses the universal Kummer extension; a finite H_Σ suffices for every statement below), with Φ =
Gal(H/F_n). For X ∈ Σ ∖ {0,1} put P_ζ(X) = D_ζ(x)/D_ζ(1) ∈ H^×/H^{×n} with x^n = X, P_ζ(1) = 1,
P_ζ(0) = D_ζ(1)^{−1}, P_ζ(∞) = D_ζ(1), extended linearly to the free abelian group Z(F) on P^1(F)
(CGZ (20), §2.2). Then (a) P_ζ(X) does not depend on the choice of x; (c) (P_ζ(X)P_ζ(1/X))^2 = 1,
and P_ζ(X)P_ζ(1/X) = 1 for n odd; (d) P_ζ(X) is Φ-invariant; (e) σ(P_ζ(X)) = P_ζ(X)^{χ(σ)^{−1}} for
σ ∈ G = Gal(F_n/F), where χ : G → (Z/n)^× is the cyclotomic character (CGZ Lemma 2.4).

**Hypotheses.**

- n is invertible in F; ζ is a primitive n-th root of unity; H contains the chosen n-th roots.
- P_ζ is defined on all of Z(F) with the stated conventions at 0, 1 and ∞; its values are classes
modulo H^{×n}, not elements.
- χ is the character of the action on μ_n, fixed as in
HB.1/the-eigenspace-and-division-by-a-group-order.

**Prerequisites.** [HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm](#HB-2-the-cyclic-quantum-dilogarithm), [HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order](#HB-1-the-eigenspace-and-division-by-a-group-order), `mathlib:IsPrimitiveRoot.autToPow`, `tauceti:TauCeti.powerClassQuotient`.

**Proof route.**

1. Define P_ζ on generators and extend linearly.
2. (a) from the root-change identity of the-cyclic-quantum-dilogarithm: another root is ζ^m x and the
ratio is an n-th power in H.
3. (c) by replacing k by −k: P_ζ(X)P_ζ(1/X) = x^{n(n−1)/2} modulo H^{×n}.
4. (d) from (a), since Φ moves x to ζ^i x.
5. (e) by lifting σ to Gal(H/F) fixing x and reindexing k ↦ kχ(σ) modulo n.

**Uses that determine the API.**

- CGZ Proposition 2.5: the class to be descended to F_n
- CGZ Theorem 2.11: the five-term relation is first proved for P_ζ
- HabiroNahmSeries:HB.4/simplified-form-and-the-unit: P_ζ(ξ_A)^{1/n} D_ζ(1)^{r/n} Φ_ζ(h) ∈ F_n[[h]]

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `Pzeta` | data | P_ζ : Z(F) → (H^×/H^{×n})^Φ with the conventions at 0, 1, ∞. |
| `Pzeta_root_indep` | characterisation | P_ζ(X) computed from ζ^j x equals P_ζ(X) computed from x. |
| `Pzeta_mul_inv` | relation | P_ζ(X)P_ζ(1/X) = 1 for n odd. |
| `Pzeta_galois` | compatibility | σ(P_ζ(X)) = P_ζ(X)^{χ(σ)^{−1}}. |
| `Pzeta_zeta_pow` | relation | P_{ζ^k}(X) = P_ζ(X)^{k^{−1}} for k prime to n. |

**Unit tests.**

- `Pzeta_root_indep_finite_field` (characterisation): In F_{q^2} with (n, q) ∈ {(5,19),(7,13),(9,17),(15,29),(25,149)} and random X ∈ F_q: D_ζ(ζ^j x)/D_ζ(x) is an n-th power for all j (checked).
- `Pzeta_mul_inv_finite_field` (characterisation): Same fields: P_ζ(X)P_ζ(1/X) is an n-th power (checked).
- `Pzeta_zeta_sq_ne` (non-example): In F_{19^2}, n = 5, X = 3: P_{ζ^2}(3) = P_ζ(3)^3 ≠ P_ζ(3)^2 modulo 5th powers (classes 2 versus 3 for a class 4 of P_ζ(3)); a definition with the eigenvalue χ instead of χ^{−1} fails this.
- `Pzeta_one` (degenerate): P_ζ(1) = 1 and P_ζ(0)P_ζ(∞) = 1.

**Acceptance.**

- P_ζ(X) is independent of the root x.
- The Galois group acts on P_ζ(X) through χ^{−1}.

**Sources.** `CGZ.BlochUnits.2021`, §2.2, equation (20) and Lemma 2.4, p. 10; `CGZ.BlochUnits.2021`, §2.2, Lemma 2.4(c)–(e), p. 10.

<a id="HB-2-lifting-obstruction-is-a-cup-product"></a>

### The obstruction to descending P_ζ is the cup product of the boundary

`HabiroNumberFields:HB.2/lifting-obstruction-is-a-cup-product` · lemma

In the setting of kummer-value-P with Φ = Gal(H/F_n) abelian of exponent n, the obstruction to
lifting a Φ-invariant class of H^×/H^{×n} to F_n^×/F_n^{×n} is its image under δ : (H^×/H^{×n})^Φ →
H^2(Φ, μ_n) in the inflation–restriction sequence, and for ξ ∈ Z(F), δ(P_ζ(ξ)) is the image of d ξ ∈
∧^2(F^×/F^{×n}) under the cup product ∧^2 H^1(Φ, μ_n) → H^2(Φ, μ_n) (using μ_n ≅ Z/n ≅ μ_n^{⊗2} via
ζ). The cup product ∧^2 Hom(Φ, μ_n) → H^2(Φ, μ_n) is injective for Φ abelian of exponent n. Hence
P_ζ(ξ) lifts to F_n^×/F_n^{×n} if and only if ξ ∈ A(F; Z/n), the kernel of d modulo n.

**Hypotheses.**

- H^1(Φ, H^×) = 0 (Hilbert 90 for the finite Galois extension H/F_n).
- The identification F^×/F^{×n} ≅ Hom(Φ, μ_n) is Kummer theory for H/F_n, X ↦ (σ ↦ σx/x).
- The sign of the connecting map is a convention; the source leaves it ('or its inverse, depending on
one's convention').
- Exterior-boundary notation B_CGZ and A(F;Z/n) denotes B_old and A_old from arXiv v3. Use
HB.1/bloch-group-conventions for the exact published odd-coefficient comparison; retain [0].

**Prerequisites.** [HabiroNumberFields:HB.2/kummer-value-P](#HB-2-kummer-value-P), `mathlib:groupCohomology.isMulCoboundary₁_of_isMulCocycle₁_of_aut_to_units`, `tauceti:TauCeti.kummerClassMap`, `K3BlochGroups:V.3/cgz-bloch-group`, [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions).

**Proof route.**

1. Write the inflation–restriction sequence H^1(Φ, μ) → H^1(F_n, μ) → H^1(H, μ)^Φ → H^2(Φ, μ).
2. For ξ = [X] with X = x^n, 1 − X = y^n build the cochain h(σ) = ∏_{k=0}^{φ(x,σ)−1}(1 − ζ^k x)/y ∈
H^×/μ and check it is a cocycle using the root-change identity.
3. Compute δ(h)(σ, τ) = ζ^{φ(x,τ)φ(y,σ)}, the cup product of the Kummer classes of X and 1 − X.
4. Prove injectivity of ∧^2 H^1(Φ, Z/n) → H^2(Φ, Z/n) for Φ ≅ (Z/n)^r (Künneth/explicit 2-cocycles).

**Acceptance.**

- The obstruction is d ξ under the cup product.
- P_ζ(ξ) lifts exactly when d ξ vanishes modulo n.

**Sources.** `CGZ.BlochUnits.2021`, §2.3, proof of Proposition 2.5(a), pp. 11–13; `CGZ.BlochUnits.2021`, §2.3, proof of Proposition 2.5(a), p. 13.

<a id="HB-2-the-map-R-zeta"></a>

### The map R_ζ: the unique χ^{−1}-lift of P_ζ

`HabiroNumberFields:HB.2/the-map-R-zeta` · construction

Let F be a field, n prime to w_F and to the characteristic, ζ a primitive n-th root of unity. For ξ
∈ A(F; Z/n) (the kernel of Z(F) → ∧^2(F^×/F^{×n}), X ↦ X ∧ (1 − X)), P_ζ(ξ) admits a UNIQUE lift
R_ζ(ξ) ∈ (F_n^×/F_n^{×n})^{χ^{−1}} (CGZ Proposition 2.5(b)); for general n the w_F-th power admits a
unique χ^{−1}-lift R_ζ(ξ)^{w_F}. Concretely (CGZ Remark 2.6), R_ζ(ξ) = P/S^n for any representative
P ∈ H^× of P_ζ(ξ) and any S ∈ H^× with P/S^n ∈ F_n^× lying in the χ^{−1}-eigenspace. R_ζ is a
homomorphism A(F; Z/n) → (F_n^×/F_n^{×n})^{χ^{−1}}. Its values are Kummer classes in F_n^×/F_n^{×n};
that they are represented by S-units for a fixed S, or by units, is NOT part of this construction
(see R-injectivity-and-image).

**Hypotheses.**

- (n, w_F) = 1; for a number field this forces n odd, since −1 ∈ F.
- ξ ∈ A(F; Z/n): without this P_ζ(ξ) does not descend (lifting-obstruction-is-a-cup-product).
- The target is the χ^{−1}-eigenspace, defined integrally (kernel formulation) as in HB.1.
- Exterior-boundary notation B_CGZ and A(F;Z/n) denotes B_old and A_old from arXiv v3. Use
HB.1/bloch-group-conventions for the exact published odd-coefficient comparison; retain [0].

**Prerequisites.** [HabiroNumberFields:HB.2/lifting-obstruction-is-a-cup-product](#HB-2-lifting-obstruction-is-a-cup-product), [HabiroNumberFields:HB.1/sahs-lemma](#HB-1-sahs-lemma), [HabiroNumberFields:HB.1/the-eigenspace-and-division-by-a-group-order](#HB-1-the-eigenspace-and-division-by-a-group-order), `tauceti:TauCeti.powerClassQuotient`, `K3BlochGroups:V.3/cgz-bloch-group`, [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions).

**Proof route.**

1. Existence of a lift: lifting-obstruction-is-a-cup-product.
2. Take χ^{−1}-invariants of 0 → S → F_n^×/F_n^{×n} → M → 0 with S = F^×/F^{×n}: the obstruction lies
in H^1(G, S(1)), killed by w_F (HB.1/sahs-lemma).
3. Uniqueness: two χ^{−1}-lifts differ by an element of S in the χ^{−1}-eigenspace; S is fixed by G and
χ^{−1} ≠ 1 on the n-part when (n, w_F) = 1, so the difference is trivial.
4. Record Remark 2.6 as the characterisation of R_ζ by a representative.

**Uses that determine the API.**

- CGZ Theorem 2.11: R_ζ vanishes on five-term relations and descends to B(F)/n and B(F; Z/n)
- CGZ Theorem 1.6: the map compared with the Chern class
- HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing: R_ζ(ξ_A) represented by a unit, via Remark
2.6

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `Rzeta` | data | R_ζ : A(F; Z/n) →+ (F_n^×/F_n^{×n})^{χ^{−1}} for (n, w_F) = 1. |
| `Rzeta_spec` | characterisation | The image of R_ζ(ξ) in H^×/H^{×n} is P_ζ(ξ), and R_ζ(ξ) is the unique χ^{−1}-eigenclass with this property. |
| `Rzeta_of_rep` | constructor | If P represents P_ζ(ξ) and S ∈ H^× with P/S^n ∈ F_n^× in the χ^{−1}-eigenspace, then R_ζ(ξ) = [P/S^n] (Remark 2.6). |
| `Rzeta_pow_wF` | other | For (n, w_F) > 1 the class R_ζ(ξ)^{w_F} is still defined and unique (Proposition 2.5(b)). |
| `Rzeta_add` | simp | R_ζ(ξ + ξ') = R_ζ(ξ)R_ζ(ξ'). |

**Unit tests.**

- `Rzeta_eta_five` (computation): F = Q(√5), n = 5, ζ = e^{2πi/5}: η_ζ = [∞] + 2[0] + 2[−(1+√5)/2], and P_ζ(η_ζ) ≡ ζ^2 modulo 5th powers of H = Q(ζ_5, (−(1+√5)/2)^{1/5}) (degree 20) and ≢ ζ^e for e ≠ 2 (checked in PARI/GP); hence R_ζ(η_ζ) = ζ^2.
- `Rzeta_two_Q` (degenerate): F = Q, n = 5: [2] ∈ A(Q; Z/5) (2 ∧ (−1) is 2-torsion) and P_ζ(2) is a 5th power in Q(ζ_5, 2^{1/5}) (checked); so R_ζ([2]) = 1.
- `Rzeta_thirtytwo_not_unit` (non-example): F = Q, n = 5, ξ = [32] = [2^5] ∈ A(Q; Z/5): R_ζ(ξ) = D_ζ(2)/D_ζ(1) ∈ Q(ζ_5) has valuations 1, 2, 3, 4 at the four primes (1 − 2ζ^k) above 31 (checked), so it is a Kummer class but not an S-unit class for any S avoiding 31; varying 2 gives unboundedly many primes. The S-unit statement of CGZ Theorem 1.2 is for B(F)/n only.
- `Rzeta_chi_inv` (characterisation): For ξ = [32] over Q with n = 5: σ_a(R_ζ(ξ)) = R_ζ(ξ)^{a^{−1}} modulo 5th powers for a = 2, 3, 4, and σ_a(R_ζ(ξ)) ≠ R_ζ(ξ)^a for a = 2, 3 (checked).

**Acceptance.**

- R_ζ(ξ) is independent of all choices.
- R_ζ is additive in ξ.
- R_ζ(ξ) lies in the χ^{−1}-eigenspace.

**Sources.** `CGZ.BlochUnits.2021`, §2.3, Proposition 2.5, p. 11; `CGZ.BlochUnits.2021`, §2.3, Remark 2.6, p. 13.

<a id="HB-2-five-term-distribution-and-galois"></a>

### The five-term relation for R_ζ, and descent to the Bloch quotients (CGZ Theorem 2.11)

`HabiroNumberFields:HB.2/five-term-distribution-and-galois` · theorem

Let F be a field and ζ a root of unity of order n prime to w_F and to the characteristic of F. Then
R_ζ vanishes on the subgroup C(F) ⊂ A(F; Z/n) generated by the five-term relations, and therefore
induces homomorphisms B_CGZ(F) → B_CGZ(F)/nB_CGZ(F) → B_CGZ(F; Z/n) → (F_n^×/F_n^{×n})^{χ^{−1}},
where B_CGZ(F; Z/n) = A(F; Z/n)/(nZ(F) + C(F)) is the étale Bloch group (CGZ (14)). Concretely, for
X ≠ Y in F ∖ {0,1}, P_ζ(X) P_ζ(Y)^{−1} P_ζ(Y/X) P_ζ((1 − X^{−1})/(1 − Y^{−1}))^{−1} P_ζ((1 − X)/(1 −
Y)) = 1 in H^×/H^{×n}.

**Hypotheses.**

- (n, w_F) = 1 and n prime to the characteristic; for a number field n is then odd.
- The Bloch group is CGZ's (K3BlochGroups:V.3/cgz-bloch-group, with C(F) read as A(F) ∩ ⟨ξ⟩ as that
node records); for n odd, B_CGZ(F)/n and B_CGZ(F; Z/n) coincide with Suslin's versions modulo n
(K3BlochGroups:V.3/cgz-convention-comparison), which reduces the statement to X, Y ∉ {0, 1, ∞}, X ≠
Y.
- The distribution relation, the dependence on ζ and the change of field are separate nodes.
- Exterior-boundary notation B_CGZ and A(F;Z/n) denotes B_old and A_old from arXiv v3. Use
HB.1/bloch-group-conventions for the exact published odd-coefficient comparison; retain [0].

**Prerequisites.** [HabiroNumberFields:HB.2/kms-identity](#HB-2-kms-identity), [HabiroNumberFields:HB.2/kummer-value-P](#HB-2-kummer-value-P), [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), `K3BlochGroups:V.3/cgz-bloch-group`, `K3BlochGroups:V.3/cgz-convention-comparison`, `K3BlochGroups:V.3/five-term-relation`, [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions).

**Proof route.**

1. Reduce to generic X, Y by K3BlochGroups:V.3/cgz-convention-comparison (CGZ Lemma 2.2, n odd).
2. Choose n-th roots x, y, z of X, Y, Z = (1 − X)/(1 − Y) and apply kms-identity.
3. Read the identity modulo n-th powers and rewrite each D_ζ-value as a P_ζ-value using kummer-value-P
(root independence, P_ζ(1/X) = P_ζ(X)^{−1} for n odd, D_ζ(1) factors).
4. Conclude for P_ζ and transfer to R_ζ by the uniqueness of the χ^{−1}-lift (the-map-R-zeta).

**Acceptance.**

- R_ζ(ξ_{X,Y}) = 1 for every five-term element.
- Local check: in F_{q^2} with q ≡ −1 mod n, the five-term product of P_ζ-values is an n-th power for
40 random (X, Y) each, for n ∈ {3,5,7,9,11,13,15} and two primes q each, while dropping one term
gives a non-trivial class in most trials (PARI/GP).

**Sources.** `CGZ.BlochUnits.2021`, §2.5, Theorem 2.11, p. 15; `CGZ.BlochUnits.2021`, §2.5, proof of Theorem 2.11, p. 15.

<a id="HB-2-root-of-unity-dependence"></a>

### Dependence of R_ζ on ζ and Galois equivariance

`HabiroNumberFields:HB.2/root-of-unity-dependence` · theorem

For (n, w_F) = 1, ξ ∈ A(F; Z/n), k prime to n and σ ∈ G = Gal(F_n/F): R_{ζ^k}(ξ) = R_ζ(ξ)^{k^{−1}}
(equivalently R_ζ(ξ) = R_{ζ^k}(ξ)^k), and σ(R_ζ(ξ)) = R_{σ(ζ)}(ξ). Together these say R_ζ(ξ) lies in
the χ^{−1}-eigenspace: σ(R_ζ(ξ)) = R_ζ(ξ)^{χ(σ)^{−1}}. Changing ζ to ζ^k does NOT raise the class to
the k-th power unless k^2 ≡ 1 mod n.

**Hypotheses.**

- (n, w_F) = 1.
- k^{−1} is the inverse of k in (Z/n)^×; the power is taken in the n-torsion group F_n^×/F_n^{×n}.

**Prerequisites.** [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), [HabiroNumberFields:HB.2/kummer-value-P](#HB-2-kummer-value-P).

**Proof route.**

1. For P_ζ: reindex ∏(1 − ζ^{kj} x)^j = ∏(1 − ζ^m x)^{m k^{−1}} modulo n-th powers (kummer-value-P,
Pzeta_zeta_pow).
2. For σ: σ acts on the defining formula by ζ ↦ σ(ζ), and by uniqueness of the χ^{−1}-lift the same
holds for R_ζ.
3. Combine the two to get the eigenspace statement.

**Acceptance.**

- R_{ζ^k} = R_ζ^{k^{−1}}.
- σR_ζ = R_{σζ}.
- In F_{q^2}: n = 5, q = 19, X = 3 gives R_{ζ^2}(3) = R_ζ(3)^3 ≠ R_ζ(3)^2; similar checks for (7,13),
(9,17), (13,103) (PARI/GP).

**Sources.** `CGZ.BlochUnits.2021`, §1.1, Remark 1.3, p. 3; `CGZ.BlochUnits.2021`, §2.4, Lemma 2.7(1), p. 14.

<a id="HB-2-distribution-in-the-order"></a>

### Change of the order n: the distribution compatibility

`HabiroNumberFields:HB.2/distribution-in-the-order` · theorem

Let (n, w_F) = 1, n = ab·r notation as in the source: n = q r with ζ_r = ζ_n^q. For ξ ∈ A(F; Z/n)
(so ξ ∈ A(F; Z/r)), the image of R_{ζ_n}(ξ) in F_n^×/F_n^{×r} equals the image of R_{ζ_r}(ξ) under
(F_r^×/F_r^{×r})^{χ^{−1}} → (F_n^×/F_n^{×r})^{χ^{−1}}. At the level of D: D_{ζ_n}(x) ≡ D_{ζ_r}(x^q)
modulo r-th powers, and D_{ζ_n}(1) ≡ D_{ζ_r}(1) modulo r-th powers. If n = ab with (a, b) = 1,
R_ζ(ξ) is determined by and determines the pair (R_{ζ^b}(ξ), R_{ζ^a}(ξ)) (CGZ Lemma 2.8). The map
(25) need not be injective.

**Hypotheses.**

- (n, w_F) = 1.
- x^q is an r-th root of X when x is an n-th root.

**Prerequisites.** [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), [HabiroNumberFields:HB.2/the-cyclic-quantum-dilogarithm](#HB-2-the-cyclic-quantum-dilogarithm).

**Proof route.**

1. Split k mod n as k = ri + j and use ∏_{i mod q}(1 − ζ_q^i y) = 1 − y^q.
2. Compare the D_ζ(1) factors using the-cyclic-quantum-dilogarithm (value modulo n-th powers).
3. Transfer from P to R by uniqueness of the χ^{−1}-lift.
4. Deduce Lemma 2.8 from coprimality of a and b.

**Acceptance.**

- Checked in F_{q^2}: (n, r, q) ∈ {(25,5,149), (15,3,29), (15,5,29), (21,3,41), (21,7,41), (9,3,17),
(27,9,53)}, 30 random X each, both for D and for P (PARI/GP).

**Sources.** `CGZ.BlochUnits.2021`, §2.4, Lemma 2.7(2), p. 14; `CGZ.BlochUnits.2021`, §2.4, Lemma 2.8, p. 14.

<a id="HB-2-change-of-field"></a>

### Change of field

`HabiroNumberFields:HB.2/change-of-field` · theorem

Let E/F be a field extension with (n, w_E) = 1 and ζ = ζ_n. Then R_ζ commutes with the maps
B_CGZ(F)/n → B_CGZ(E)/n and (F_n^×/F_n^{×n})^{χ^{−1}} → (E_n^×/E_n^{×n})^{χ^{−1}}. The restriction
on the Bloch side can be zero: for F = Q(ζ_N)^+ and E = Q(ζ_N) the map B(F)/N → B(E)/N vanishes
(Hutchinson, Caution in §3), although E then violates (N, w_E) = 1.

**Hypotheses.**

- (n, w_E) = 1 (hence (n, w_F) = 1).
- The targets are F_n^×/F_n^{×n}; the source's printed F_n^{×r} is a misprint (sourceIssues).

**Prerequisites.** [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), [HabiroNumberFields:HB.2/five-term-distribution-and-galois](#HB-2-five-term-distribution-and-galois).

**Proof route.**

1. P_ζ is compatible with the universal Kummer extensions of F and E.
2. Uniqueness of the χ^{−1}-lift over E gives the commutativity.

**Acceptance.**

- The square commutes.
- No injectivity of either vertical map is asserted.

**Sources.** `CGZ.BlochUnits.2021`, §2.4, Lemma 2.10, p. 15; `Hutchinson.ChernQuantumDilog.2024`, §3, the Caution after Theorem 3.1 (arXiv v4 LaTeX).

<a id="HB-2-etale-bloch-group-and-K2"></a>

### The étale Bloch group and K_2 (CGZ Theorem 1.7)

`HabiroNumberFields:HB.2/etale-bloch-group-and-K2` · theorem

Let F be a field of characteristic prime to n containing no p-th root of unity for p | n. The étale
Bloch group B_CGZ(F; Z/n) = A(F; Z/n)/(nZ(F) + C(F)) sits in an exact sequence 0 → B_CGZ(F)/n →
B_CGZ(F; Z/n) → K_2(F)[n] → 0, where the connecting map sends [x] with d x = n y in ∧^2 F^× to the
image of y in K_2(F). For a number field and n = p^m prime to w_2(F), R_ζ : B_CGZ(F; Z/n) →
(F_n^×/F_n^{×n})^{χ^{−1}} ≅ H^1(F, Z/n(2)) is an isomorphism (CGZ (37)–(38), using Tate's theorem on
K_2).

**Hypotheses.**

- No p-th root of unity in F for p | n.
- The isomorphism statement needs n prime to w_2(F) and imports Tate's K_2 theorem
(MotivicEtaleKTheory:M.3) and CGZ Theorem 3.2 (HB.1).
- Exterior-boundary notation B_CGZ and A(F;Z/n) denotes B_old and A_old from arXiv v3. Use
HB.1/bloch-group-conventions for the exact published odd-coefficient comparison; retain [0].

**Prerequisites.** [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), [HabiroNumberFields:HB.2/five-term-distribution-and-galois](#HB-2-five-term-distribution-and-galois), `K3BlochGroups:V.3/cgz-bloch-group`, `MotivicEtaleKTheory:M.3`, [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions).

**Proof route.**

1. Tensor 0 → R → ∧^2 F^× → K_2(F) → 0 with Z/n; Tor_1(Z/n, ∧^2 F^×) = 0 by the hypothesis.
2. Identify Q/nR with K_2(F)[n].
3. Compare with the Galois-cohomology sequence (38) by the five lemma.

**Acceptance.**

- The sequence is exact.
- Example: F = Q, n = 5: [32] ∈ B_CGZ(Q; Z/5) maps to {2, −31} ≠ 0 in K_2(Q)[5] (tame symbol 2 of
order 5 in F_31^×), and R_ζ([32]) is a non-unit (see the-map-R-zeta).

**Sources.** `CGZ.BlochUnits.2021`, §1.2, Theorem 1.7 and equation (15), p. 5; proof in §6, pp. 31–33.

<a id="HB-2-the-element-eta"></a>

### The torsion element η_ζ of B(Q(ζ)^+)

`HabiroNumberFields:HB.2/the-element-eta` · definition

For n odd and ζ a primitive n-th root of unity, η_ζ = Σ_{k mod n} [1 − ((ζ − ζ^{−1})/(ζ^k −
ζ^{−k}))^2] ∈ B_CGZ(Q(ζ)^+) (CGZ (34)), with the degenerate terms k = 0 ↦ [∞] and k = ±1 ↦ [0].
Equivalently (Hutchinson §3) η_ζ = Σ_{k mod n} [(t(∞) − t^{k+1}(∞))/(t(∞) − t^{k+2}(∞))] for t = t_ζ
= (0 1; −1 ζ+ζ^{−1}) ∈ SL_2(Q(ζ)^+) acting on P^1. It lies in the Bloch group and is n-torsion; that
it generates the p-part (CGZ Lemma 5.1) is eta-generates, and η_{ζ^k} = k^2 η_ζ is
eta-galois-scaling.

**Hypotheses.**

- n odd; the element lies in B_CGZ(Q(ζ)^+) and is n-torsion.
- K_3(Q(ζ)^+) ⊗ Z_p ≅ Z/n uses w_2(Q(ζ_{p^m})^+) = 24p^m (p ≠ 3), 8·3^m (p = 3) and K_3 of a number
field with r_1 ≥ 1.
- Exterior-boundary notation B_CGZ and A(F;Z/n) denotes B_old and A_old from arXiv v3. Use
HB.1/bloch-group-conventions for the exact published odd-coefficient comparison; retain [0].

**Prerequisites.** `K3BlochGroups:V.3/cgz-bloch-group`, `K3BlochGroups:V.5/k3-number-field`, `K3BlochGroups:V.6/comparison-finite-coefficients`, [HabiroNumberFields:HB.1/bloch-group-conventions](#HB-1-bloch-group-conventions).

**Proof route.**

1. Define η_ζ by (34) with the P^1 conventions.
2. Prove the equality of the two expressions (they agree as multisets over k mod n).
3. Prove the vanishing boundary ∂η_ζ = 0.
4. n-torsion: CGZ cite Zagier [37] p. 40 and Zickert [39] Theorem 1.4; alternatively η_ζ is the image
of the n-torsion class [α_3(t_ζ)] (eta-is-zeta-times-bott, subject to the gap on Hutchinson 2013
§6.4).

**Uses that determine the API.**

- CGZ Theorem 7.4 and HabiroNahmSeries:HB.4/acceptance-andrews-gordon: R_ζ(η_ζ) = ζ^2
- Hutchinson Theorem 3.1: c_ζ(η_ζ) = ζ
- CGZ §1.2 and scalar-from-eta: an element of exact order n on which both maps are computed

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `etaZeta` | data | η_ζ ∈ B_CGZ(Q(ζ)^+) by (34). |
| `etaZeta_eq_crossRatio` | characterisation | η_ζ equals Hutchinson's cross-ratio expression for t_ζ. |
| `etaZeta_boundary` | characterisation | ∂η_ζ = 0. |
| `etaZeta_nsmul` | simp | n • η_ζ = 0. |
| `etaZeta_conj` | simp | η_{ζ^{−1}} = η_ζ. |

**Unit tests.**

- `etaZeta_five` (computation): n = 5, ζ = e^{2πi/5}: η_ζ = [∞] + 2[0] + 2[−(1+√5)/2].
- `etaZeta_eq_crossRatio_small` (characterisation): The multisets {(t(∞) − t^{k+1}(∞))/(t(∞) − t^{k+2}(∞))} and {1 − ((ζ − ζ^{−1})/(ζ^k − ζ^{−k}))^2} over k mod n agree for n = 3, 5, 7, 9, 11 (PARI/GP).
- `etaZeta_local_value` (compatibility): For every odd n ≤ 27 and the first four primes q ≡ −1 mod n with v_p(q+1) = v_p(n): the reduction of η_ζ satisfies R_{ζ,q}(η_ζ) = ζ^2 in F_{q^2}^×/F_{q^2}^{×n} (PARI/GP).
- `etaZeta_three` (degenerate): n = 3: Q(ζ_3)^+ = Q and η_ζ = [∞] + 2[0] = [0] in B_CGZ(Q) (using [∞] = −[0]); R_{ζ,q}(η_ζ) = ζ^2 ≠ 1 for q = 5, 11, 23, 29 (PARI/GP), so η_ζ has order 3.

**Acceptance.**

- The two expressions agree.
- ∂η_ζ = 0 and nη_ζ = 0.

**Sources.** `CGZ.BlochUnits.2021`, §5.1, proof of Lemma 5.1, equation (34), p. 26; `Hutchinson.ChernQuantumDilog.2024`, §3, display before Theorem 3.1 (arXiv v4 LaTeX).

<a id="HB-2-cyclic-bar-chains"></a>

### The cyclic bar chains α_r(t)

`HabiroNumberFields:HB.2/cyclic-bar-chains` · construction

Let C be a cyclic group of order N with generator t and B_•(C) the bar resolution. For r ≥ 0 with s
= ⌊r/2⌋ put α_r(t) = Σ_{j_1,…,j_s=0}^{N−1} [t|t^{j_1}|⋯|t|t^{j_s}] (r even) and Σ
[t|t^{j_1}|⋯|t|t^{j_s}|t] (r odd). Then 1 ↦ α_r(t) is an augmentation-preserving chain map from the
periodic resolution (Z C, d_r(1) = 1 + t + ⋯ + t^{N−1} for r even, 1 − t for r odd) to B_•(C); for
odd r the class of α_r(t) ⊗ 1 generates H_r(C, Z) ≅ Z/N; for r ≥ 1 its class generates H_r(C, Z/N) ≅
Z/N; and with β̃(t) = [α_2(t)] ∈ H_2(C, Z/N), the Pontryagin product satisfies [t] ∗ β̃(t) =
[α_3(t)] (Hutchinson Lemma 2.1, Corollary 2.2).

**Hypotheses.**

- C cyclic of order N with a chosen generator t; the chains depend on t.
- In degree 3 with integer coefficients, α_3(t) = Σ_j [t|t^j|t] is a cycle; α_2(t) is a cycle only
modulo N (its boundary is N[t]).

**Prerequisites.** `mathlib:Rep.FiniteCyclicGroup.resolution`, `mathlib:Rep.FiniteCyclicGroup.groupHomologyIsoOdd`, `mathlib:Rep.barResolution`, `mathlib:groupHomology.d₃₂`.

**Proof route.**

1. Verify d_r(α_r) = α_{r−1} − α_{r−1}t (r odd) and Σ_j α_{r−1} t^j (r even).
2. Identify the periodic resolution with Mathlib's Rep.FiniteCyclicGroup.resolution and read off
generators via groupHomologyIsoOdd/Even.
3. Compute the shuffle product [α_1] ∗ [α_2] = [α_3].

**Uses that determine the API.**

- Hutchinson §3: η_ζ is the image of [α_3(t_ζ)] in K_3(Q(ζ)^+)/N
- Hutchinson Corollary 4.5: h_3(ζ ∗ β) = [α_3(ζ)]

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `cyclicBarChain` | data | α_r(t) ∈ B_r(C). |
| `cyclicBarChain_isChainMap` | characterisation | 1 ↦ α_r(t) is a chain map from the periodic resolution. |
| `cyclicBarChain_three_generates` | characterisation | [α_3(t)] generates H_3(C, Z) ≅ Z/N. |
| `cyclicBarChain_mod_generates` | characterisation | [α_r(t)] generates H_r(C, Z/N) for r ≥ 1. |
| `cyclicBarChain_pontryagin` | relation | [t] ∗ [α_2(t)] = [α_3(t)] in H_3(C, Z/N). |
| `cyclicBarChain_map` | functoriality | A homomorphism C → G sends α_r(t) to the chain with t replaced by its image; used for C = ⟨t_ζ⟩ ⊂ SL_2 and C = μ_N ⊂ GL_1. |

**Unit tests.**

- `cyclicBarChain_three_isCycle` (characterisation): With integer coefficients and trivial action, d₃₂(Σ_{j<N} single (t, t^j, t) 1) = 0.
- `cyclicBarChain_two_boundary` (non-example): d₂₁(Σ_{j<N} single (t, t^j) 1) = N · single t 1 ≠ 0 over Z for N ≥ 2, so α_2(t) is a cycle only with Z/N coefficients.
- `cyclicBarChain_order_three` (computation): For C = Z/3: the class of α_3(t) has additive order 3 in H_3(C, Z) ≅ Z/3.
- `cyclicBarChain_trivial` (degenerate): For N = 1, H_3(C, Z) = 0 and α_3(1) = [1|1|1] is a boundary.

**Acceptance.**

- [α_3(t)] generates H_3(C, Z).
- [t] ∗ β̃ = [α_3(t)].

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §2.1, Lemma 2.1 (arXiv v4; LaTeX label lem:cyc); `Hutchinson.ChernQuantumDilog.2024`, §2.1, Corollary 2.2 (LaTeX label cor:beta).

<a id="HB-2-bott-element"></a>

### The Bott element β(ζ) ∈ K_2(R; Z/N)

`HabiroNumberFields:HB.2/bott-element` · construction

Let R be a ring containing a primitive N-th root of unity ζ, N odd. The inclusion μ_N → GL_1(R) →
GL(R) induces H_2(μ_N, Z/N) = π_2(Bμ_N; Z/N) → π_2(BGL(R)^+; Z/N) = K_2(R; Z/N), a homomorphism for
N odd; the BOTT ELEMENT β(ζ) is the image of β̃(ζ) = [α_2(ζ)] (Hutchinson §4). Its Bockstein is ζ ∈
K_1(R)[N], and when N is invertible in R, c̄_{1,0}(β) = ζ ∈ H^0(R, μ_N) = μ_N (Weibel V Lemma
11.10.1). The Bott element lies in DEGREE TWO; it needs neither N invertible in R nor any Chern
class to be defined.

**Hypotheses.**

- R contains a primitive N-th root of unity ζ; N odd for the homomorphism property (Weibel IV Remark
2.5.3: fails only for N ≡ 2 mod 4).
- c̄_{1,0}(β) = ζ uses étale Chern classes, hence N invertible in R.

**Prerequisites.** [HabiroNumberFields:HB.2/cyclic-bar-chains](#HB-2-cyclic-bar-chains), `StableHomotopyKTheory:H.6`.

**Proof route.**

1. Define mod-N homotopy of BGL(R)^+ via the Moore space/spectrum (StableHomotopyKTheory:H.6).
2. Define β(ζ) as the image of [α_2(ζ)] (cyclic-bar-chains).
3. Prove the Bockstein of β is ζ.
4. Import c̄_{1,0}(β) = ζ from the Chern-class supplier (MotivicEtaleKTheory:M.8).

**Uses that determine the API.**

- Hutchinson Lemma 4.1: multiplication by β : K_1(E; Z/N) → K_3(E; Z/N)
- Hutchinson Proposition 4.6: η̄_ζ = ζ ∗ β

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `bottElement` | data | β(ζ) ∈ K_2(R; Z/N). |
| `bockstein_bottElement` | characterisation | The Bockstein K_2(R; Z/N) → K_1(R)[N] sends β(ζ) to ζ. |
| `chern10_bottElement` | compatibility | c̄_{1,0}(β(ζ)) = ζ when N is invertible in R. |
| `bottElement_map` | functoriality | A ring map f sends β(ζ) to β(f ζ). |
| `bottElement_pow` | relation | β(ζ^k) = k β(ζ) for k prime to N. |

**Unit tests.**

- `bottElement_not_integral` (non-example): β(ζ) is not in the image of K_2(R)/N → K_2(R; Z/N), since its Bockstein ζ ≠ 1 (for N > 1).
- `bottElement_Zzeta` (degenerate): For R = Z[ζ_p] (p odd, not invertible in R) β(ζ_p) is defined; only c̄_{1,0}(β) requires p ∈ R^×.
- `bottElement_algClosure` (computation): For k = F̄_p and ℓ ≠ p odd, K_*(k; Z/ℓ) = Z/ℓ[β] (Weibel IV Example 2.6).

**Acceptance.**

- β ∈ K_2(R; Z/N) with Bockstein ζ.
- c̄_{1,0}(β) = ζ when N ∈ R^×.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §4, paragraph before Lemma 4.1 (arXiv v4); `Weibel.KBook.2013`, Chapter IV, Example 2.5.2 and Remark 2.5.3, p. 20 of Kbook.IV.pdf.

<a id="HB-2-hurewicz-mod-odd-N"></a>

### K_3 with odd finite coefficients is H_3 of SL

`HabiroNumberFields:HB.2/hurewicz-mod-odd-N` · lemma

For any field F and odd N ≥ 1, the Hurewicz map h_3 : K_3(F; Z/N) → H_3(GL(F), Z/N) induces an
isomorphism K_3(F; Z/N) ≅ H_3(SL(F), Z/N) (Hutchinson Lemma 4.3); consequently every θ in the image
of h_3 satisfies θ = D(θ), where D : H_•(GL(F)) → H_•(SL(F)) is the splitting induced by A ↦ (A, det
A^{−1}) (Corollary 4.4). The mod-N product on K_•(F; Z/N) is compatible with h_•, the product on
H_•(GL_1(F), Z/N) being the Pontryagin product.

**Hypotheses.**

- N odd; F any field.
- Imports: Suslin's isomorphism K̄_3(F) ≅ H_3(SL(F), Z), K_2(F) ≅ H_2(SL(F), Z), homology stability,
and the mod-N products with their Hurewicz compatibility.

**Prerequisites.** `K3BlochGroups:V.2/k3-to-h3-sl-field`, `K3BlochGroups:V.4/homological-stability`, `StableHomotopyKTheory:H.6`, `GeneralAlgebraicKTheory:K.7`.

**Proof route.**

1. Compare the two Bockstein sequences and apply the five lemma.
2. Use that D splits the inclusion H_•(SL) → H_•(GL).
3. Import product compatibility of Hurewicz.

**Acceptance.**

- h_3 is injective on K_3(F; Z/N) with image H_3(SL(F), Z/N).

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §4, Lemma 4.3 (LaTeX label lem:hur).

<a id="HB-2-eta-bar-bloch-specialization"></a>

### The bar-cycle representative of the cyclotomic eta element

`HabiroNumberFields:HB.2/eta-bar-bloch-specialization` · comparison

Let N≥3 be odd, ζ a primitive Nth root of unity, E=Q(ζ), F=Q(ζ+ζ⁻¹), and
t=[[0,1],[−1,ζ+ζ⁻¹]]∈SL₂(F). Under the actual homology-to-Suslin-Bloch map and then the CGZ
comparison modulo N, the positive cyclic generator α₃(t)=∑_{j=0}^{N−1}[t|t^j|t] maps to the parent
η_ζ=∑_{k mod N}[1−((ζ−ζ⁻¹)/(ζ^k−ζ⁻k))²], with the k=0 term [∞]. This is an equality in B_CGZ(F)/N.
It is not an integral identification of Bloch conventions, and it does not identify B(E)/N with
K₃(E)/N.

**Hypotheses.**

- The cyclic resolution has d_odd=t−1 and d_even=1+t+⋯+t^(N−1); preserve the induced positive
generator.
- For Hutchinson’s formula choose y∈P¹(F) outside the orbit of ∞ with y≠t(y). F is infinite, so such y
exists.

**Prerequisites.** [HabiroNumberFields:HB.2/cyclic-bar-chains](#HB-2-cyclic-bar-chains), [HabiroNumberFields:HB.2/the-element-eta](#HB-2-the-element-eta), `K3BlochGroups:V.3/cgz-convention-comparison`, `K3BlochGroups:V.3/cgz-degenerate-relations`, `K3BlochGroups:V.4`.

**Proof route.**

1. Import the requested generic cyclic-to-refined-Bloch calculation in K3BlochGroups V.4. Hutchinson
§6.4 constructs it by the contracting homotopy h(g₀,…,g_r)=(1,g₀,…,g_r); the homogeneous chain is
∑(1,t,t^(j+1),t^(j+2)), giving precisely the parent inhomogeneous chain.
2. Distinguish the 2013 left homogeneous resolution (d_odd=t−1) from the 2024 right bar resolution
(d_odd=1−t) imported by cyclic-bar-chains. After trivial coinvariants their degree-three chains are
the identical ∑[t|t^j|t]. In degree two the left chain is ∑[t^j|t] and the right chain is ∑[t|t^j].
Their integral boundaries are both N[t], so both have Bockstein [t]; since H₂(C,Z)=0, the
coefficient Bockstein on H₂(C,Z/N) is injective and their classes agree. Therefore both conventions
supply the positive Bott generator used here; no equality of the two chain resolutions is assumed.
3. Forget the squareclass coefficients RP(F)→P(F), as Hutchinson 2024 §3 explains. The image is
∑_{j=1}^{N−3}[(t∞−t^(j+1)∞)/(t∞−t^(j+2)∞)]+[1−A]−[1/A]+[B]+[1/B], with A=(t∞−y)/(t⁻¹∞−y),
B=(t∞−y)/(t∞−t(y)).
4. The terms {u}=[u]+[1/u] are killed in the CGZ quotient by the V.3 convention map (and are
two-torsion in the pre-Bloch group). Thus the correction is [1−A]+[A]=[0]. Retain this term:
dropping it changes the n=3 case. Use V.3’s [∞]=−[0].
5. Set u_k=(ζ^k−ζ^(−k))/(ζ−ζ⁻¹). The action of t gives t^k∞=u_(k−1)/u_k for 1≤k<N. The internal
cross-ratio at j is u_j u_(j+2)/u_(j+1)²=1−1/u_(j+1)² by the second-order recurrence. Hence the
internal sum is the eta sum at k=2,…,N−2. The remaining eta symbols [∞]+[0]+[0] give exactly [0].
6. The matrix A=[[ζ,ζ⁻¹],[1,1]] conjugates diag(ζ⁻¹,ζ) to t and has determinant d=ζ−ζ⁻¹. Replace A by A
diag(d⁻¹,1), which has determinant one and conjugates identically. This discharges the SL₂ conjugacy
premise of the parent Bott/Hurewicz argument.
7. This comparison supplies the previously missing input to parent eta-is-zeta-times-bott. That
subsequent argument restricts in K-theory to E using res/cor and degree two; it does not pass
through B(E)/N, where the cyclotomic class may vanish.

**Acceptance.**

- N=3: the internal sum is empty and the image is [0], while η=[∞]+2[0]=[0].
- For N=5 the two internal symbols agree with k=2,3; retain the single [0].
- The displayed diagonalizing matrix has been corrected to determinant one; no assumption that a
general GL₂ conjugacy is an SL₂ conjugacy.

**Sources.** `Hutchinson.2013`, §6.4, pp.32–33; `Hutchinson.2024`, §3, (1), pp.5–6.

<a id="HB-2-eta-is-zeta-times-bott"></a>

### η̄_ζ = ζ ∗ β in K_3(Q(ζ); Z/N) (Hutchinson Proposition 4.6)

`HabiroNumberFields:HB.2/eta-is-zeta-times-bott` · theorem

Let N = ℓ^m, ℓ an odd prime and m≥1, and η_ζ ∈ K_3(Q(ζ)^+)/N the image of [α_3(t_ζ)] ∈ H_3(⟨t_ζ⟩, Z)
under H_3(SL(Q(ζ)^+), Z) ≅ K̄_3(Q(ζ)^+) → K_3(Q(ζ)^+)/N. Its image η̄_ζ in K_3(Q(ζ); Z/N) equals ζ ∗
β(ζ). The identification of this η_ζ with the Bloch-group element of the-element-eta under Suslin's
map uses the formula of Hutchinson (J. K-Theory 12 (2013), §6.4) for the image of [α_3(t)] in RP(F)
→ P(F), whose explicit specialization is HB.2/eta-bar-bloch-specialization.

**Hypotheses.**

- t_ζ is conjugate in SL_2(Q(ζ)) to diag(ζ^{−1}, ζ).
- N odd, so K_3/N = K̄_3/N.

**Prerequisites.** [HabiroNumberFields:HB.2/cyclic-bar-chains](#HB-2-cyclic-bar-chains), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](#HB-2-hurewicz-mod-odd-N), [HabiroNumberFields:HB.2/the-element-eta](#HB-2-the-element-eta), [HabiroNumberFields:HB.2/eta-bar-bloch-specialization](#HB-2-eta-bar-bloch-specialization).

**Proof route.**

1. h_3(ζ ∗ β) = [ζ] ∗ β̃ = [α_3(ζ)] (cyclic-bar-chains, product compatibility).
2. [α_3(ζ)] = D[α_3(ζ)] = [α_3(D(ζ))] (hurewicz-mod-odd-N).
3. h_3(η̄_ζ) = [α_3(D(ζ))] by conjugacy of t_ζ and D(ζ).
4. Conclude by injectivity of h_3.

**Acceptance.**

- η̄_ζ = ζ ∗ β.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §4, Proposition 4.6 (LaTeX label prop:gamma); `Hutchinson.ChernQuantumDilog.2024`, §3, after the definition of η_ζ.

<a id="HB-2-chern-sign-conventions"></a>

### The sign conventions that fix c_ζ

`HabiroNumberFields:HB.2/chern-sign-conventions` · comparison

Fix the positive Kummer cocycle δ(a)(σ)=σ(a^(1/n))/a^(1/n), the positive cyclic bar orientation and
the Bott element with Bockstein ζ and c̄_(1,0)(β)=ζ. Import Soulé’s raw finite Chern classes, whose
degree-(2,1) product formula is c̄_(2,1)(a*β)=−δ(a)∪ζ. Define c_plus independently as the negative
of this raw degree-(2,1) class. Fix the CGZ/GSWZ boundary/edge map and compare its actual
normalization, including Suslin/Hurewicz compatibility, with the raw and plus maps. This
source-normalization comparison remains a gap. The signed eta evaluations are the later target
eta-chern-signed-evaluation, under its odd-prime-power hypotheses; they are not assumptions used to
define the fixed source map. The every-order export ε_m is the square of the fixed GSWZ Chern map,
so replacing that map by its inverse inverts ε_m.

**Hypotheses.**

- Raw and independently negated Chern maps are distinct specified maps.
- The published CGZ/GSWZ normalization comparison remains an obligation of the early finite-Chern
supplier and HB.1/hutchinson-chern-class-agrees.

**Prerequisites.** [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), `tauceti:TauCeti.kummerClassMap`, [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta).

**Proof route.**

1. Pin the positive Kummer, bar and Bott conventions and import the raw Soulé product formula from the
requested early M.8 prefix.
2. Define the separately negated degree-(2,1) class without prescribing an eta evaluation.
3. Compare the fixed CGZ/GSWZ edge/boundary map with the two specified maps through the actual
Suslin/Hurewicz convention; retain the source-sign gap. The signed eta proof is later and does not
feed this construction back.

**Acceptance.**

- Every later statement about γ names the conventions it uses.

**Sources.** `CGZ.BlochUnits.2021`, §3.1, p. 18; `CGZ.BlochUnits.2021`, §5.3, p. 28; `Weibel.KBook.2013`, Chapter V, Example 11.10 and Lemma 11.10.1, pp. 84–85 of Kbook.V.pdf.

<a id="HB-2-soule-formula-in-degree-three"></a>

### Soulé's product formula in degree three, with its sign

`HabiroNumberFields:HB.2/soule-formula-in-degree-three` · lemma

Let E be a field containing a primitive N-th root of unity, N = ℓ^m with ℓ an odd prime invertible
in E. Soulé's formula (imported: c̄_{i,k}(a ∗ b) = Σ −((i−1)!/((i'−1)!(i''−1)!)) c̄_{i',k'}(a) ∪
c̄_{i'',k''}(b)) specialises, for a ∈ K_1(E; Z/N), b ∈ K_2(E; Z/N), to c̄_{2,1}(a ∗ b) =
−c̄_{1,1}(a) ∪ c̄_{1,0}(b), the only index solution being (i', k', i'', k'') = (1, 1, 1, 0). With
c̄_{1,1} = Kummer map and c̄_{1,0}(β) = ζ this gives c̄_{2,1}(x ∗ β) = −(δx ∪ ζ), i.e. −(x ⊗ ζ)
under H^1(E, μ_N^{⊗2}) ≅ E^×/E^{×N} ⊗ μ_N. Hutchinson's Lemma 4.1 records +(x ⊗ ζ); the discrepancy
must be resolved by the conventions of chern-sign-conventions before the sign of Theorem 3.1 is
used.

**Hypotheses.**

- ℓ an odd prime, m≥1, ℓ invertible in E and E⊃μ_N.
- The general formula and the normalisations c̄_{1,1} = Kummer, c̄_{1,0}(β) = ζ are imported
(MotivicEtaleKTheory:M.8; Weibel V.11.10).

**Prerequisites.** [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions).

**Proof route.**

1. Solve i = i' + i'', k = k' + k'', 2i' − k' = 1, 2i'' − k'' = 2 for (i, k) = (2, 1).
2. Evaluate the coefficient −1!/(0!0!) = −1.
3. Insert the normalisations and the cup-product identification; record the sign.

**Acceptance.**

- c̄_{2,1}(a ∗ b) = −c̄_{1,1}(a) ∪ c̄_{1,0}(b).
- The sign of c̄_{2,1}(x ∗ β) relative to x ⊗ ζ is stated, not dropped.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §2.3, Theorem 2.12 (LaTeX label thm:sou); `Hutchinson.ChernQuantumDilog.2024`, §2.3, Corollary 2.13 and §4, proof of Lemma 4.1.

<a id="HB-2-eta-chern-signed-evaluation"></a>

### The signed Chern evaluation on eta

`HabiroNumberFields:HB.2/eta-chern-signed-evaluation` · theorem

Let N=ℓ^m≥3 with ℓ an odd prime and m≥1, E=Q(ζ), F=E⁺ and ζ primitive of order N. Use the positive
bar generator fixed above, the Bott class with Bockstein ∂β=ζ, the Kummer cocycle σ(α)/α, the
untwisting t_ζ(ζ)=ζ⊗ζ, and the raw Soulé finite Chern class c̄_(2,1). On the restriction of η_ζ to
K₃(E;Z/N), c̄_(2,1)(η̄_ζ)=−δ(ζ)∪ζ. Consequently the raw untwisted map c_raw,ζ sends η_ζ to the class
of ζ⁻¹. Define the opposite normalization independently by c_+,ζ=t_ζ⁻¹∘(−c̄_(2,1)) after restriction
and Kummer identification: c_+,ζ(η_ζ)=[ζ]. Both maps are specified before evaluating η. Identifying
CGZ’s or GSWZ’s fixed c_ζ with either map is a separate comparison obligation, not a consequence of
choosing the desired value.

**Hypotheses.**

- The early Soulé interface, including its product formula and Bott normalization, must be supplied by
the requested prefix of M.8 after M.7, before D.2/R.7. It is not an import of unsplit M.8.
- The Kummer inverse requires the profinite Hilbert-90/Kummer-isomorphism supplier: the pinned Tau
Ceti map alone is only injective.
- The positive map is an explicit convention; its agreement with the map in CGZ (29) and GSWZ (17) is
not asserted.

**Prerequisites.** [HabiroNumberFields:HB.2/eta-bar-bloch-specialization](#HB-2-eta-bar-bloch-specialization), [HabiroNumberFields:HB.2/eta-is-zeta-times-bott](#HB-2-eta-is-zeta-times-bott), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`, `K3BlochGroups:V.2/milnor-k3-number-field`, `tauceti:TauCeti.kummerClassMap`, `tauceti:TauCeti.kummerClassMap_injective`, `tauceti:TauCeti.powerClassQuotient`, `tauceti:TauCeti.powerClassHom`.

**Proof route.**

1. Use eta-bar-bloch-specialization and parent eta-is-zeta-times-bott: η̄_ζ=ζ∗β in K₃(E;Z/N).
2. Import the single owner’s Soulé formula c̄_(2,1)(a∗b)=−c̄_(1,1)(a)∪c̄_(1,0)(b), with c̄_(1,1)=δ and
c̄_(1,0)(β)=ζ. The cup bidegrees are (1,0), so there is no extra graded sign.
3. Untwist by cup with ζ and identify H¹(E,μ_N) with E×/(E×)^N via the standard Kummer map. Additive
negation corresponds to inversion of the power class.
4. Negate the raw degree-(2,1) map, without changing the Bott Bockstein, Kummer convention or Bloch
map, to obtain c_+. This is independent of η and gives the positive evaluation.
5. Retain parent source issue HabiroNumberFields/E14: the printed −x∪ζ=x⊗ζ step does not resolve the
comparison with CGZ. The scalar lemma of the parent gives exponent −2 relative to c_raw and +2
relative to c_+ once the HB.5 Nahm evaluation is imported. The square of a map changes to its
inverse when the map is inverted; epsilon=c² is not sign invariant.

**Acceptance.**

- For N=3 the classes of ζ and ζ⁻¹ are distinct: in Q(ζ₃), ζ₃ is not a cube (otherwise that degree-two
field would contain a primitive ninth root).
- A concrete power-class check over F₇: ζ=2 has order three, and [2]≠[2]⁻¹ in F₇×/(F₇×)³.
- No universal scalar is determined by the Chern evaluation alone; the R evaluation is HB.5’s input.

**Sources.** `Hutchinson.2024`, §2.3, Corollary 2.13, p.5; `Hutchinson.2024`, §4, Proposition 4.6, p.7; `Hutchinson.2024`, §4, Bott-element paragraph before Lemma 4.1, p.6; `Soule.thesis`, Second part, Proposition 2.2.3.3, p.49; §2.2.4.3, pp.51–54.

<a id="HB-2-chern-class-of-eta"></a>

### Hutchinson's theorem: the Chern class of η_ζ

`HabiroNumberFields:HB.2/chern-class-of-eta` · theorem

Let N=ℓ^m, ℓ an odd prime, m≥1, ζ primitive of order N and F=Q(ζ)^+. With the positive Kummer,
cyclic bar and Bott conventions, c_raw,ζ(η_ζ)=[ζ⁻¹]; for the independently negated degree-(2,1)
Chern class c_plus,ζ(η_ζ)=[ζ]. This is the signed evaluation of HB.2/eta-chern-signed-evaluation.
Identifying the fixed CGZ/GSWZ Chern map with one of them remains a separate source-normalization
gap.

**Hypotheses.**

- The odd-prime-power hypotheses and fixed maps of HB.2/eta-chern-signed-evaluation.
- Do not define the published Chern class by demanding an eta evaluation.

**Prerequisites.** [HabiroNumberFields:HB.2/eta-is-zeta-times-bott](#HB-2-eta-is-zeta-times-bott), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](#HB-2-soule-formula-in-degree-three), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Proof route.**

1. Apply HB.2/eta-chern-signed-evaluation to the actual bar/Bott eta class and convention comparisons.

**Acceptance.**

- Raw gives [ζ⁻¹] and the independently negated degree-(2,1) class gives [ζ].
- Retain ℓ prime and m≥1; source compatibility is a separate obligation.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, §3, Theorem 3.1 (arXiv v4; LaTeX label thm:main); `Hutchinson.ChernQuantumDilog.2024`, Abstract (arXiv v4).

<a id="HB-2-local-maps-at-primes-of-norm-minus-one"></a>

### The local maps R_{ζ,q} and c_{ζ,q} at primes of norm ≡ −1

`HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one` · construction

Let n = p^m with p odd, F a number field and q a prime of F of prime norm q ≡ −1 mod n that splits
completely in F, with residue field F_q and F_q(ζ) = F_{q^2}. The local map R_{ζ,q} : B(F_q) ⊗ Z/n →
F_{q^2}^×/F_{q^2}^{×n} is P_ζ over F_q: every element of F_q is an n-th power in F_q, so the Kummer
extension is F_{q^2} and R_{ζ,q} = P_{ζ,q} (CGZ §4.4). The local Chern map c_{ζ,q} : K_3(F_q)/n →
F_{q^2}^×/F_{q^2}^{×n} is the unramified part of the global one, identified through Gabber rigidity
K_3(O_{F,q}; Z_p) ≅ K_3(F_q) ⊗ Z_p (CGZ Lemma 4.1). Both are compatible with reduction: R_{ζ,q}(ξ
mod q) = R_ζ(ξ) mod q and c_{ζ,q}(ξ mod q) = c_ζ(ξ) mod q for S-unit representatives with q ∉ S; and
B(F)/n → ⊕_q B(F_q) ⊗ Z/n corresponds to K_3(F)/n → ⊕_q K_3(F_q) ⊗ Z/n under Suslin's isomorphisms
(CGZ Lemma 4.4).

**Hypotheses.**

- n = p^m, p odd; q ≡ −1 mod n prime, split completely in F; q ∉ S.
- B(F_q) ⊗ Z/n ≅ K_3(F_q) ⊗ Z/n ≅ Z/n (K3BlochGroups:V.5/bloch-finite-field-mod-n).
- Lemma 4.4's commutativity is asserted by CGZ ('can be seen in group cohomology'); it needs its own
proof here.

**Prerequisites.** [HabiroNumberFields:HB.2/the-map-R-zeta](#HB-2-the-map-R-zeta), [HabiroNumberFields:HB.2/five-term-distribution-and-galois](#HB-2-five-term-distribution-and-galois), `K3BlochGroups:V.5/bloch-finite-field-mod-n`, `K3BlochGroups:V.5/k3-finite-field`, `K3BlochGroups:V.6/comparison-finite-coefficients`, [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), `KTheoryFiniteLocalFields:L.7`, `KTheoryFiniteLocalFields:L.2`, [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), `K3BlochGroups:V.5/finite-field-bloch-comparison`, `K3BlochGroups:V.5/nonsplit-cartan-mod-n`.

**Proof route.**

1. Define R_{ζ,q} as P_{ζ,q}; check that no descent is needed.
2. Define c_{ζ,q} from the étale Chern class of HB.1 restricted to the unramified classes, and identify
the three lower rows of CGZ Lemma 4.1's diagram (Gabber rigidity, KTheoryFiniteLocalFields:L.2 and
L.7).
3. Prove compatibility with reduction for both maps.
4. Prove CGZ Lemma 4.4: Suslin's isomorphism for F and for F_q commute with reduction.

**Uses that determine the API.**

- CGZ §5.1: the proof of Theorem 1.6 runs through the local maps
- scalar-from-eta: the scalar is read off at primes q

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `Rzeta_local` | data | R_{ζ,q} = P_{ζ,q} : B(F_q) ⊗ Z/n → F_{q^2}^×/F_{q^2}^{×n}. |
| `chern_local` | data | c_{ζ,q} : K_3(F_q) ⊗ Z/n → F_{q^2}^×/F_{q^2}^{×n}. |
| `Rzeta_local_reduction` | compatibility | R_{ζ,q}(ξ mod q) = R_ζ(ξ) mod q. |
| `chern_local_reduction` | compatibility | c_{ζ,q}(ξ mod q) = c_ζ(ξ) mod q. |
| `suslin_reduction` | compatibility | CGZ Lemma 4.4. |

**Unit tests.**

- `Rzeta_local_eta` (computation): n = 5, q = 19: R_{ζ,q}(η_ζ mod q) = ζ^2 in F_{361}^×/F_{361}^{×5} (PARI/GP).
- `Rzeta_local_no_kummer` (degenerate): For q ≡ −1 mod n every X ∈ F_q^× is an n-th power of a unique x ∈ F_q (gcd(n, q − 1) = 1), so P_{ζ,q}(X) = D_ζ(x)/D_ζ(1) ∈ F_{q^2}^×.
- `Rzeta_local_q_one_mod_n` (non-example): For q ≡ 1 mod n, ζ ∈ F_q, so (n, w_{F_q}) ≠ 1 and the construction of R_{ζ,q} does not apply; a definition that ignored the congruence q ≡ −1 mod n would be applied outside CGZ Proposition 2.5.

**Acceptance.**

- R_{ζ,q}(η_ζ) = ζ^2 for the tested n, q (see the-element-eta).
- The diagram of Lemma 4.4 commutes.

**Sources.** `CGZ.BlochUnits.2021`, §4.4, p. 25; `CGZ.BlochUnits.2021`, §4.1, Lemma 4.1 and proof, pp. 21–22; `CGZ.BlochUnits.2021`, §4.3, Lemma 4.4 and proof, pp. 24–25.

<a id="HB-2-eta-generates"></a>

### η_ζ generates the p-part, globally and at primes of norm ≡ −1 (CGZ Lemma 5.1)

`HabiroNumberFields:HB.2/eta-generates` · lemma

Let n = p^m with p odd. Then η_ζ generates B_CGZ(Q(ζ)^+) ⊗ Z_p ≅ K_3(Q(ζ)^+) ⊗ Z_p ≅ Z/n, and for
every prime q ≡ −1 mod n with q ≢ −1 mod pn, q splits completely in Q(ζ)^+ and the reduction of η_ζ
modulo a prime above q generates B(F_q) ⊗ Z/n ≅ Z/n. Proof through Hutchinson's theorem instead of
CGZ's external citations: c_ζ(η_ζ) = ζ^{±1} has exact order n in Q(ζ)^×/Q(ζ)^{×n} (μ(Q(ζ)) =
μ_{2n}), and K_3(Q(ζ)^+)/n ≅ Z/n; locally, c_{ζ,q}(η_ζ mod q) = ζ^{±1} mod q has exact order n in
F_{q^2}^×/F_{q^2}^{×n} because v_p(q^2 − 1) = m.

**Hypotheses.**

- n = p^m, p odd; q ≡ −1 mod n and q ≢ −1 mod pn for the local statement.
- Uses the Chern side only up to sign, so it does not depend on chern-sign-conventions.

**Prerequisites.** [HabiroNumberFields:HB.2/chern-class-of-eta](#HB-2-chern-class-of-eta), [HabiroNumberFields:HB.2/the-element-eta](#HB-2-the-element-eta), [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one), `K3BlochGroups:V.5/k3-number-field`, `K3BlochGroups:V.5/bloch-finite-field-mod-n`, `K3BlochGroups:V.6/comparison-finite-coefficients`.

**Proof route.**

1. K_3(Q(ζ)^+) ⊗ Z_p ≅ Z/n from w_2(Q(ζ)^+) (K3BlochGroups:V.5/k3-number-field) and B ⊗ Z_p ≅ K_3 ⊗ Z_p
(K3BlochGroups:V.6/comparison-finite-coefficients).
2. c_ζ(η_ζ) = ζ^{±1} (chern-class-of-eta) has order n, so η_ζ has order n.
3. Reduce modulo q (local-maps-at-primes-of-norm-minus-one) and use that ζ generates the n-part of
F_{q^2}^× modulo n-th powers.

**Acceptance.**

- η_ζ generates globally.
- The reductions generate locally for q ≢ −1 mod pn.

**Sources.** `CGZ.BlochUnits.2021`, §5.1, Lemma 5.1, p. 26.

<a id="HB-2-local-R-is-an-isomorphism"></a>

### The local map R_{ζ,q} is an isomorphism (CGZ Theorem 5.2)

`HabiroNumberFields:HB.2/local-R-is-an-isomorphism` · theorem

Let n be an odd prime power and q ≡ −1 mod n a prime. Then R_{ζ,q} : B(F_q) ⊗ Z/n → F_{q^2}^× ⊗ Z/n
is an isomorphism. The proof uses: (Lemma 5.3) for n an odd prime power, R_ζ(η_ζ) = ζ^γ in
(Q(ζ)^×/Q(ζ)^{×n})^{χ^{−1}} for some γ ∈ Z_p, since η_ζ is divisible by n in B(Q(ζ')^+) for ζ' of
order n^2 and the kernel of Q(ζ)^×/n → Q(ζ')^×/n consists of n-th roots of unity; (Lemma 5.4) for a
prime r of Q(ζ) split over Q with ζ ≡ a^{−1} mod r, ζ ≢ a^{−1} mod r^2, τ = ∏_{k=0}^{n−1}(1 − ζ^k
a)^k is not ζ^i times a p-th power; and a Chebotarev argument producing q with R_{ζ,q}([a^n]) a
generator.

**Hypotheses.**

- n = p^m odd; q ≡ −1 mod n.
- Both groups are cyclic of order n after ⊗ Z/n (B(F_q) cyclic of order q + 1 up to 2-torsion,
F_{q^2}^× cyclic of order q^2 − 1).

**Prerequisites.** [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one), [HabiroNumberFields:HB.2/distribution-in-the-order](#HB-2-distribution-in-the-order), [HabiroNumberFields:HB.2/eta-generates](#HB-2-eta-generates), `K3BlochGroups:V.5/bloch-finite-field-mod-n`.

**Proof route.**

1. Lemma 5.3 from distribution-in-the-order applied to n | n^2.
2. Lemma 5.4 by the valuation of (1 − aζ) at r.
3. Kummer theory of τ over Q(ζ)^+ and Chebotarev (Tau Ceti Chebotarev roadmap, requested) give q with
Frobenius generating; then R_{ζ,q}([a^n]) generates.
4. Specialisation: if γ ≢ 0 mod p the result follows at every q from the-element-eta; otherwise
contradiction with the q found.

**Acceptance.**

- R_{ζ,q} is bijective for every q ≡ −1 mod n.
- Local computation: R_{ζ,q}(η_ζ) = ζ^2 generates for all tested n ≤ 27 (PARI/GP).

**Sources.** `CGZ.BlochUnits.2021`, §5.1, Theorem 5.2, p. 26; `CGZ.BlochUnits.2021`, §5.1, Lemma 5.3 and Lemma 5.4, p. 27.

<a id="HB-2-chebotarev-detection"></a>

### Detection of Chern classes by primes of norm ≡ −1 (CGZ Proposition 4.2)

`HabiroNumberFields:HB.2/chebotarev-detection` · theorem

Let F̃ be the Galois closure of F and n = p^m odd with ζ ∉ F̃(ζ + ζ^{−1}) (equivalently n prime to
w̃_F, CGZ (28)). Then (a) there is a map K_3(F)/n → ⊕_q F_{q^2}^×/F_{q^2}^{×n}, the sum over the
primes q of prime norm q ≡ −1 mod n splitting completely in F (or all but finitely many of them);
(b) its image is isomorphic to the image of the global c_ζ, which is injective if (n, w_2(F)) = 1;
(c) for ξ ∈ K_3(F), the set of q with c_{ζ,q}(ξ) = 0 determines the image of ξ up to a scalar. The
proof is Kummer theory for the χ^{−1}-class ε of c_ζ(ξ) over F(ζ + ζ^{−1}) and the Chebotarev
density theorem, and applies verbatim to any class in (F_n^×/F_n^{×n})^{χ^{−1}} represented by an
S-unit.

**Hypotheses.**

- ζ ∉ F̃(ζ + ζ^{−1}); automatic when p is unramified in F (CGZ Remark 4.3).
- Chebotarev for the Galois closure of H̃(ζ) over Q is imported from the Tau Ceti Chebotarev roadmap
by request.

**Prerequisites.** [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-excluded-primes](#HB-1-the-excluded-primes), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta).

**Proof route.**

1. Attach to ε the cyclic degree-n extension H/F(ζ + ζ^{−1}) with H(ζ) = F(ζ, ε^{1/n}).
2. Choose σ of order 2p in Gal(H̃(ζ)/F̃(ζ + ζ^{−1})) and a prime q with Frobenius σ.
3. Derive the contradiction and conclude (a)–(c); injectivity from HB.1 (CGZ Lemma 3.1).

**Acceptance.**

- A χ^{−1}-class with trivial reduction at all such q is trivial.

**Sources.** `CGZ.BlochUnits.2021`, §4.1, Proposition 4.2, p. 22.

<a id="HB-2-the-comparison-with-the-chern-class"></a>

### CGZ Theorem 1.6: R_ζ = c_ζ^γ for n prime to M_F

`HabiroNumberFields:HB.2/the-comparison-with-the-chern-class` · theorem

Let F be a number field and n prime to M_F (HB.1/the-excluded-primes; n is then odd and F contains
no non-trivial n-th root of unity). Under the identification B_CGZ(F)/n ≅ K_3(F)/n
(K3BlochGroups:V.6/comparison-finite-coefficients), R_ζ = c_ζ^γ for some γ ∈ (Z/n)^× (CGZ Theorem
1.6), where c_ζ : K_3(F)/n → (F_n^×/F_n^{×n})^{χ^{−1}} is the Chern class map of HB.1 (CGZ (30),
Theorem 1.5). γ does not depend on F: for n = p^m it is the constant γ_q with R_{ζ,q} =
c_{ζ,q}^{γ_q} on B(F_q) ⊗ Z/n, which depends only on the finite field F_q and is independent of q
because the reductions of η_ζ generate every B(F_q) ⊗ Z/n with q ≡ −1 mod n, q ≢ −1 mod pn; general
n by CRT (distribution-in-the-order). The value γ = 2 is scalar-from-eta together with Hutchinson
(chern-class-of-eta) and CGZ Theorem 7.4, assembled downstream of HabiroNahmSeries:HB.4 (see the
restructure proposal).

**Hypotheses.**

- n prime to M_F; for a number field this implies (n, w_F) = 1 and n odd.
- c_ζ is the map of HB.1 with the sign conventions of chern-sign-conventions; R_ζ is the-map-R-zeta
descended by five-term-distribution-and-galois.
- Field independence is proved through the local maps; the source's compositum argument is not used
(sourceIssues).

**Prerequisites.** [HabiroNumberFields:HB.2/five-term-distribution-and-galois](#HB-2-five-term-distribution-and-galois), [HabiroNumberFields:HB.2/local-R-is-an-isomorphism](#HB-2-local-R-is-an-isomorphism), [HabiroNumberFields:HB.2/chebotarev-detection](#HB-2-chebotarev-detection), [HabiroNumberFields:HB.2/eta-generates](#HB-2-eta-generates), [HabiroNumberFields:HB.2/distribution-in-the-order](#HB-2-distribution-in-the-order), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-excluded-primes](#HB-1-the-excluded-primes), `K3BlochGroups:V.6/comparison-finite-coefficients`, [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta).

**Proof route.**

1. Reduce to n = p^m by distribution-in-the-order (CGZ Lemma 2.8) and CRT for c_ζ.
2. For each q ≡ −1 mod n split in F, both local maps are isomorphisms of cyclic groups of order n
(local-R-is-an-isomorphism; the Chern side from K3BlochGroups:V.5 and HB.1), so R_{ζ,q} =
c_{ζ,q}^{γ_q}.
3. γ_q is independent of q and of F: evaluate on the reduction of η_ζ, which generates
(the-element-eta), and use that R_ζ(η_ζ) and c_ζ(η_ζ) are n-th roots of unity (CGZ Lemma 5.3 and its
Chern analogue).
4. Globalise with chebotarev-detection applied to R_ζ(ξ)/c_ζ(ξ)^γ, a χ^{−1}-class trivial at all such
q.

**Acceptance.**

- R_ζ = c_ζ^γ with γ ∈ (Z/n)^× for n prime to M_F.
- γ is independent of F.
- No value of γ is asserted by this node.

**Sources.** `CGZ.BlochUnits.2021`, §1.2, Theorem 1.6, p. 4; `CGZ.BlochUnits.2021`, §5.1, proof of Theorem 1.6, pp. 25–26; `CGZ.BlochUnits.2021`, §1.2, after Theorem 1.6, p. 4.

<a id="HB-2-scalar-from-eta"></a>

### Reading off the scalar from η_ζ

`HabiroNumberFields:HB.2/scalar-from-eta` · lemma

Let n = p^m be an odd prime power and suppose R_ζ(η_ζ) = ζ^a and c_ζ(η_ζ) = ζ^b in
(Q(ζ)^×/Q(ζ)^{×n})^{χ^{−1}} with b prime to p. Then for every prime q ≡ −1 mod n with q ≢ −1 mod pn,
R_{ζ,q} = c_{ζ,q}^{a b^{−1}} on B(F_q) ⊗ Z/n, and the constant γ of
the-comparison-with-the-chern-class is a b^{−1} mod n for every number field F and n prime to M_F.
(CGZ Theorem 1.6 itself does not apply to F = Q(ζ)^+, whose discriminant is divisible by p; the
comparison is made through the local maps.)

**Hypotheses.**

- The evaluations R_ζ(η_ζ)=ζ^a and c_ζ(η_ζ)=ζ^b, with b a unit modulo n, are hypotheses. Their values
a=2 and b=1 are discharged only by the later Nahm evaluation and the separately normalized Chern
calculation; this node does not import HB.4.
- q ≢ −1 mod pn so that η_ζ generates B(F_q) ⊗ Z/n (CGZ Lemma 5.1).

**Prerequisites.** [HabiroNumberFields:HB.2/the-comparison-with-the-chern-class](#HB-2-the-comparison-with-the-chern-class), [HabiroNumberFields:HB.2/eta-generates](#HB-2-eta-generates), [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one).

**Proof route.**

1. Reduce η_ζ modulo a prime above q; it generates B(F_q) ⊗ Z/n.
2. Compare the two local isomorphisms on the generator.
3. Globalise with chebotarev-detection and the field independence in
the-comparison-with-the-chern-class.

**Acceptance.**

- γ = a b^{−1} is forced by the two values on η_ζ.

**Sources.** `CGZ.BlochUnits.2021`, §1.2, after Theorem 1.6, p. 4; `Hutchinson.ChernQuantumDilog.2024`, §1 (arXiv v4).

<a id="HB-2-eta-galois-scaling"></a>

### η_{ζ^k} = k^2 η_ζ

`HabiroNumberFields:HB.2/eta-galois-scaling` · lemma

For n odd and k prime to n, η_{ζ^k} = k^2 η_ζ in B_CGZ(Q(ζ)^+)/n. CGZ prove it inside the proof of
Theorem 7.4: R_ζ(η_ζ) = ζ^a with a independent of ζ (Galois conjugation), R_{ζ^k}(η_ζ) = ζ^{a/k}
(root-of-unity-dependence), so R_{ζ^k}(k^2 η_ζ) = R_{ζ^k}(η_{ζ^k}), and R_{ζ^k} is injective on the
cyclic group generated by η_ζ. A second proof: the automorphism t ↦ t^k of a cyclic group C acts on
H_3(C, Z) by k^2.

**Hypotheses.**

- n odd, k prime to n.
- Consumed by the proof of CGZ Theorem 7.4 (HabiroNahmSeries:HB.4/acceptance-andrews-gordon, with k =
1/2).

**Prerequisites.** [HabiroNumberFields:HB.2/eta-generates](#HB-2-eta-generates), [HabiroNumberFields:HB.2/local-R-is-an-isomorphism](#HB-2-local-R-is-an-isomorphism), [HabiroNumberFields:HB.2/root-of-unity-dependence](#HB-2-root-of-unity-dependence).

**Proof route.**

1. σ_k(η_ζ) = η_{ζ^k} as elements of B(Q(ζ)^+).
2. R_ζ(η_ζ) has exact order n (eta-generates and local-R-is-an-isomorphism); compare R_{ζ^k} on both
sides.
3. Conclude by injectivity on ⟨η_ζ⟩.

**Acceptance.**

- η_{ζ^k} = k^2 η_ζ.

**Sources.** `CGZ.BlochUnits.2021`, §7.2, end of the proof of Theorem 7.4, p. 39.

<a id="HB-2-R-injectivity-and-image"></a>

### Injectivity and image of R_ζ (the rest of CGZ Theorem 1.2)

`HabiroNumberFields:HB.2/R-injectivity-and-image` · theorem

Let F be a number field with no non-trivial n-th root of unity. There is a finite set S = S(F, n) of
primes of F (the sources do not show that S can be chosen independently of n; source issue E4) such
that R_ζ(B_CGZ(F)/n) ⊂ (O_{S,n}^×/O_{S,n}^{×n})^{χ^{−1}} ⊂ (F_n^×/F_n^{×n})^{χ^{−1}}. If n is prime
to M_F, R_ζ is injective on B_CGZ(F)/n with image in (O_n^×/O_n^{×n})^{χ^{−1}}, equal to it when n
is prime. The proof deduces all three from the corresponding statements for c_ζ (CGZ Theorem 1.5,
owned by HB.1) through the-comparison-with-the-chern-class (γ invertible). The S-unit statement
concerns B_CGZ(F)/n; it fails on B_CGZ(F; Z/n) (the-map-R-zeta, test Rzeta_thirtytwo_not_unit).

**Hypotheses.**

- μ_n(F) = 1 for the existence of S = S(F, n); n prime to M_F for injectivity and the unit image.
- The three targets (Kummer classes, S-unit classes, unit classes) are different subgroups of
F_n^×/F_n^{×n}, related by the Selmer-group sequence 1 → O_S^×/n → F⟮S,n⟯ → Cl_S[n] → 1.

**Prerequisites.** [HabiroNumberFields:HB.2/the-comparison-with-the-chern-class](#HB-2-the-comparison-with-the-chern-class), [HabiroNumberFields:HB.1/the-excluded-primes](#HB-1-the-excluded-primes), `tauceti:IsDedekindDomain.selmerGroup.fromSUnitLift_injective`, `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, `mathlib:IsDedekindDomain.selmerGroup.fromUnitLift_injective`, [HabiroNumberFields:HB.1/cgz-theorem-1-5](#HB-1-cgz-theorem-1-5), [HabiroNumberFields:HB.1/s-units-realise-c-zeta](#HB-1-s-units-realise-c-zeta).

**Proof route.**

1. Transport the three statements for c_ζ (HB.1/the-excluded-primes, CGZ Lemmas 3.3–3.5) along R_ζ =
c_ζ^γ.
2. For n not prime to M_F, argue with the S-unit representatives given by finite generation (CGZ Lemma
3.4) and the finite generation of B(F).

**Acceptance.**

- Injectivity for n prime to M_F.
- Image in units for n prime to M_F; equality for n prime.
- S-unit image with S independent of n.

**Sources.** `CGZ.BlochUnits.2021`, §1.1, Theorem 1.2, p. 3; `CGZ.BlochUnits.2021`, §1.5, p. 8.

<a id="HB-2-hutchinson-refinement"></a>

### The early conditional implication giving exponent two

`HabiroNumberFields:HB.2/hutchinson-refinement` · theorem

For a number field F and n prime to M_F, assume the compatible prime-power evaluations R_ζ(η_ζ)=ζ²
and c_ζ(η_ζ)=ζ in the chosen Chern convention, together with their Chinese-remainder compatibility.
Then scalar-from-eta and the unknown-power comparison imply R_ζ=c_ζ² on B_CGZ(F)/n≅K₃(F)/n, hence
ε_n=R_ζ. This stable node is only the algebraic conditional implication; the unconditional
evaluation and its assembly belong after HabiroNahmSeries HB.4 (existing HB.5). The unresolved
source-sign comparison is retained.

**Hypotheses.**

- n prime to M_F; for every odd prime-power factor N of n, the two stated η-evaluations in matching
Chern/Kummer/Bloch conventions are explicit hypotheses.
- Chinese-remainder and root-change compatibility as in distribution-in-the-order. The published sign
discrepancy is not resolved by assuming an evaluation.

**Prerequisites.** [HabiroNumberFields:HB.2/scalar-from-eta](#HB-2-scalar-from-eta), [HabiroNumberFields:HB.2/chern-class-of-eta](#HB-2-chern-class-of-eta), [HabiroNumberFields:HB.2/the-comparison-with-the-chern-class](#HB-2-the-comparison-with-the-chern-class), [HabiroNumberFields:HB.2/distribution-in-the-order](#HB-2-distribution-in-the-order).

**Proof route.**

1. For each prime-power factor apply scalar-from-eta with a=2 and b=1; no Nahm-sum theorem is used
inside this implication.
2. Use the unknown-power comparison and Chinese-remainder compatibility to obtain R=c² at n.
3. Apply the definition ε=c². The actual R(η)=ζ² proof is
HabiroNahmSeries:HB.4/acceptance-andrews-gordon and must be used only downstream.

**Acceptance.**

- Under the explicitly stated evaluation and compatibility hypotheses, R=c² and ε=R.
- HB.2 consumers may use ε=c² for every m independently of the conditional R-comparison; the
unconditional comparison is not an early HB.2 export.

**Sources.** `Hutchinson.ChernQuantumDilog.2024`, Abstract (arXiv v4); `CGZ.BlochUnits.2021`, §7.2, Theorem 7.4, p. 37.

<a id="HB-2-the-exported-interface"></a>

### The units ε_m(ξ) exported to GSWZ, their Kummer classes and root lines

`HabiroNumberFields:HB.2/the-exported-interface` · definition

Let K be a number field, m ≥ 1, L = K(ζ_m), and S_m the set of primes of L above m. For ξ ∈ K_3(K)
define ε_m(ξ) := c_{ζ_m}(ξ)^2 ∈ (L^×/L^{×m})^{χ^{−1}} (GSWZ (16)), where c_{ζ_m} is HB.1's Chern
class map in the convention of chern-sign-conventions. This is defined for EVERY m ≥ 1, including m
even and m with μ_m ⊂ K (where R_{ζ_m} does not exist). It lies in the χ^{−1}-part of the Selmer
group L⟮S_m, m⟯ of classes unramified outside S_m (the Chern class factors through H^1_et(O_K[1/m],
Z/m(2))). Exported with it: (a) its Kummer class δ(ε_m(ξ)) ∈ H^1(L, μ_m) (injective on classes); (b)
the ROOT LINE ε_m(ξ)^{1/m} L ⊂ L̄, which depends only on the class of ε_m(ξ) modulo L^{×m} because
μ_m ⊂ L; (c) χ^{−1}-equivariance σ_γ(ε_m(ξ))^γ ≡ ε_m(ξ) modulo L^{×m} for σ_γ(ζ_m) = ζ_m^γ; (d)
multiplicativity ε_m(ξ + ξ') = ε_m(ξ)ε_m(ξ'); (e) coherence: for m | m', the image of ε_{m'}(ξ) in
K(ζ_{m'})^×/K(ζ_{m'})^{×m} is the image of ε_m(ξ) with ζ_m = ζ_{m'}^{m'/m}; (f) for m prime to M_K:
ε_m(ξ) is represented by a unit of O_L (R-injectivity-and-image), and ε_m(ξ) = R_{ζ_m}(ξ̄)^{2γ^{−1}}
for the Bloch class ξ̄ of ξ (K3BlochGroups:V.6/comparison-finite-coefficients), which equals
R_{ζ_m}(ξ̄) once γ = 2 is proved (restructure proposal). Units, S-units, Kummer classes and the
class-group quotient are distinct: O_L^×/m → L⟮∅, m⟯, O_{L,S}^×/m → L⟮S, m⟯ with cokernel
Cl_S(L)[m], and L^×/m ↪ H^1(L, μ_m).

**Hypotheses.**

- ξ ∈ K_3(K) (not a Bloch class); the Bloch class is used only where R_ζ is compared.
- m ≥ 1 arbitrary; the identification with R_{ζ_m} needs m prime to M_K.
- GSWZ assert that the μ_m-torsors extend over O_K[ζ_m] (unramified also above m); that stronger
statement is not needed by HB.7's Definitions 1.3–1.4 (which use ε_m only at primes p ∤ m) and is
not claimed here without proof.

**Prerequisites.** [HabiroNumberFields:HB.2/R-injectivity-and-image](#HB-2-R-injectivity-and-image), [HabiroNumberFields:HB.2/the-comparison-with-the-chern-class](#HB-2-the-comparison-with-the-chern-class), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/distribution-in-the-order](#HB-2-distribution-in-the-order), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), `K3BlochGroups:V.6/comparison-finite-coefficients`, `mathlib:IsDedekindDomain.selmerGroup`, `tauceti:TauCeti.kummerClassMap_injective`, `tauceti:IsDedekindDomain.selmerGroup.ker_toClassGroup`, [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta).

**Proof route.**

1. Define ε_m from c_{ζ_m} and square.
2. Prove (b) from μ_m ⊂ L: two m-th roots of classes differing by u^m differ by u·(a root of unity in
L).
3. Prove (c) from the χ^{−1}-equivariance of c_{ζ_m} (HB.1, CGZ (29)–(30)).
4. Prove (d) from additivity of the Chern class.
5. Prove (e) from compatibility of c with Z/m'(2) → Z/m(2) and of t_ζ with ζ_{m'} ↦ ζ_{m'}^{m'/m}.
6. Prove (f) from R-injectivity-and-image and the-comparison-with-the-chern-class.
7. Record the four-object distinction through the Selmer-group sequence.
8. Retain ε_m=c_{ζ_m}² for every m. The equality ε=R requires the late evaluation/normalization
hypotheses of the conditional hutchinson-refinement and must not be assumed by HB.4 itself.

**Uses that determine the API.**

- GSWZ Definition 1.3 (20): f_m ∈ ε_m(ξ)^{1/m}(R_p^∧[ζ_m]^× + x K_p[ζ_m][[x]]) for m prime to p
- GSWZ Definition 1.4 (23)–(24): the global module and the γ-gluing, where χ^{−1}-equivariance removes
the root ambiguity
- GSWZ proof of Theorem 2: ε_m multiplicative, D_p additive
- HabiroNahmSeries:HB.9/constant-term-is-the-unit: the constant term is ε_m(ξ)^{1/m} times an element
of K[ζ_m] for m prime to Δ

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `epsilonUnit` | data | ε_m(ξ) ∈ (L^×/L^{×m})^{χ^{−1}} for ξ ∈ K_3(K), m ≥ 1. |
| `epsilonUnit_mem_selmer` | characterisation | ε_m(ξ) ∈ L⟮S_m, m⟯, S_m the primes above m. |
| `epsilonUnit_add` | simp | ε_m(ξ + ξ') = ε_m(ξ)ε_m(ξ'); ε_m(0) = 1. |
| `epsilonUnit_galois` | compatibility | σ_γ(ε_m(ξ))^γ ≡ ε_m(ξ) modulo L^{×m}. |
| `epsilonUnit_coherent` | compatibility | For m \| m', ε_{m'}(ξ) ≡ ε_m(ξ) modulo K(ζ_{m'})^{×m}. |
| `epsilonUnit_rootLine` | characterisation | The L-line spanned by an m-th root of a representative depends only on the class. |
| `epsilonUnit_kummer` | coercion | The Kummer class δ(ε_m(ξ)) ∈ H^1(L, μ_m), injective on classes. |
| `epsilonUnit_eq_Rzeta` | compatibility | For m prime to M_K: ε_m(ξ) = R_{ζ_m}(ξ̄)^{2γ^{−1}} (= R_{ζ_m}(ξ̄) after the refinement). |
| `epsilonUnit_unit_rep` | constructor | For m prime to M_K a representative in O_L^× exists. |

**Unit tests.**

- `epsilonUnit_Q` (degenerate): K = Q: K_3(Q) ≅ Z/48, so ε_m(ξ) = 1 for every ξ when gcd(m, 6) = 1.
- `epsilonUnit_mu_in_K` (non-example): K = Q(√−3), m = 3: μ_3 ⊂ K, R_{ζ_3} is undefined, yet ε_3(ξ) is defined; an interface built from R_ζ, or restricted to m prime to M_K, cannot supply GSWZ's collection at ζ_3 for the figure-eight class ξ = 2[e^{πi/3}].
- `epsilonUnit_rootLine_indep` (characterisation): If ε' = ε u^m with u ∈ L^× and y^m = ε, y'^m = ε' in a field E ⊃ L, then L y = L y'.
- `epsilonUnit_coherent_local` (compatibility): For the R_ζ-side analogue: P_{ζ_{25}}(X) ≡ P_{ζ_5}(X) modulo 5th powers in F_{149^2} (checked).
- `epsilonUnit_one` (degenerate): m = 1: L^×/L^{×1} is trivial and ε_1 = 1.

**Acceptance.**

- ε_m is defined for all m and all ξ ∈ K_3(K).
- The root line depends only on the class.
- Coherence in m holds as stated.
- The identification with R_ζ is stated only for m prime to M_K.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.5, equation (16) and the following sentence, p. 8; `GSWZ.HabiroNumberField.2024`, §1.5, Definition 1.4, equation (23), p. 10; `GSWZ.HabiroNumberField.2024`, §3.3, proof of Theorem 5, p. 43.

## HB.6 — Frobenius-glued number-field Habiro rings

Arithmetic coefficients use the full cyclotomic algebra and the HR.1 Frobenius lift.
The compatible root system determines the coefficient inclusions and the topologically
nilpotent Taylor shifts. Their explicit equations define a subring of the full family
product and its restrictions to prime-to-γ orders.

The local comparison is proved through chain completions, mixed-adic charts and infinite
CRT. Cofinality is used after reduction modulo p^a, not for the raw ideals over Z_p.
The all-order image follows by reconstructing each forward p-chain from its prime-to-p
component. HC.4 integral lattice detection and injectivity supply the rational global
comparison. Components, the domain boundary and the abelian embedding are then read in
these same coordinates; no selected residue factor replaces a full algebra.

The layer’s planets are [Habiro ring of a number field](#HB-6-the-gluing-condition), [p-completed Habiro ring](#HB-6-the-p-completed-ring), [Prime-to-p Taylor splitting](#HB-6-prime-to-p-taylor-equivalence), [Arithmetic Taylor gluing](#HB-6-rational-gluing-image-criterion).

The following targets are ordered by their exact internal prerequisites.

<a id="HB-6-compatible-roots-of-unity"></a>

### The compatible system of roots of unity

`HabiroNumberFields:HB.6/compatible-roots-of-unity` · definition

A COMPATIBLE SYSTEM OF ROOTS OF UNITY is a family (ζ_m)_{m≥1}, ζ_m a primitive m-th root of unity in
Q^ab ⊂ C, with ζ_{mm'} = ζ_m ζ_{m'} whenever gcd(m, m') = 1 and ζ_{p^r}^p = ζ_{p^{r−1}} for every
prime p and r ≥ 1 (GSWZ (7)); one such family is ζ_m = exp(2πi Σ_{p|m} p^{−v_p(m)}). Algebraically
the system is the family of ring maps ι_{m,pm} : Z[ζ_m] → Z[ζ_{pm}] between the cyclotomic rings
Z[ζ_n] = Z[t]/(Φ_n(t)), t ↦ t^{e(p,m)}, where e(p,m) is the residue modulo pm with e ≡ p (mod
p^{k+1}) and e ≡ 1 (mod m'), for m = p^k m' with p ∤ m'; then ζ_{pm}^{e(p,m)} = ζ_m. With k = v_p(m)
one has ζ_{pm} − ζ_m = ζ_{m'} ζ_{p^{k+1}} (1 − ζ_{p^{k+1}}^{p−1}), hence (ζ_{pm} − ζ_m)^{φ(p^{k+1})}
∈ p·Z[ζ_{pm}]^× and v_p(ζ_{pm} − ζ_m) = 1/φ(p^{k+1}) > 0 at every prime above p, for every m and
every p. The traditional roots ω_m = e^{2πi/m} are not compatible and fail this: v_2(ω_{10} − ω_5) =
0 and ω_6 − ω_3 = 1.

**Hypotheses.**

- The system is fixed once for the whole roadmap; the coefficient algebras, the transition maps and
the gluing condition of HB.6 and HB.7 are all stated with it.
- Changing the system by an automorphism of Q^ab (a unit of the profinite integers acting on all ζ_m)
changes nothing, because P_R is defined by Galois-invariant families; the invariance is the API item
changeOfSystem.
- The valuation statement uses only that 1 − ζ^a is 1 − ζ times a unit when p ∤ a and that Φ_{p^n}(1)
= p.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots`, `mathlib:Polynomial.cyclotomic`, `mathlib:AdjoinRoot.lift`, `mathlib:Polynomial.eval_one_cyclotomic_prime_pow`.

**Proof route.**

1. Existence: the exponential formula satisfies (7), since the exponents add over coprime factors and
p·p^{−r} = p^{−(r−1)}.
2. The exponent e(p,m) exists and is unique modulo pm by the Chinese remainder theorem; ζ_{pm}^{e} =
ζ_{p^{k+1}}^{e} ζ_{m'}^{e} = ζ_{p^{k+1}}^{p} ζ_{m'} = ζ_{p^k} ζ_{m'} = ζ_m by (7).
3. Factor ζ_{pm} − ζ_m = ζ_{m'}(ζ_{p^{k+1}} − ζ_{p^{k+1}}^{p}) = ζ_{m'} ζ_{p^{k+1}}(1 −
ζ_{p^{k+1}}^{p−1}); ζ_{p^{k+1}}^{p−1} is primitive of order p^{k+1}.
4. For ζ primitive of order p^n, ∏_{a ∈ (Z/p^n)^×}(1 − ζ^a) = Φ_{p^n}(1) = p and each (1 − ζ^a)/(1 − ζ)
is a unit, so (1 − ζ)^{φ(p^n)} ∈ p·Z[ζ]^× (HC.3/p-adic-closeness-of-roots (a), mathlib
Polynomial.eval_one_cyclotomic_prime_pow).
5. Non-example: ω_{10}/ω_5 = ω_{10}^{−1} has order 10, not a prime power, so ω_{10} − ω_5 is a unit
(HC.3/p-adic-closeness-of-roots (b)); ω_6 − ω_3 = 1 directly.

**Uses that determine the API.**

- GSWZ Definition 1.1, equation (13): the shift x ↦ x + ζ_pm − ζ_m is p-adically convergent only for a
compatible system
- HB.6/the-substitution-exists: the valuation formula is its input
- HabiroRings:HR.5/roots-choices-and-substitutions: the relative construction must use the same system
for the comparison of HR.5-number-field-comparison

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `compatExp` | data | e(p,m) ∈ Z/pm with e ≡ p (mod p^{v_p(m)+1}) and e ≡ 1 (mod m p^{−v_p(m)}). |
| `CoeffRing.transition` | data | The ring map R[ζ_m] → R[ζ_{pm}], ζ_m ↦ ζ_{pm}^{e(p,m)}, for any coefficient ring R (R ⊗ ι_{m,pm}). |
| `CoeffRing.transition_zeta_pow` | simp | transition(ζ_m) = ζ_{pm}^{e(p,m)}, and transition ∘ transition = transition along m → pm → p'pm. |
| `sub_pow_totient_mem` | characterisation | (ζ_{pm} − transition ζ_m)^{φ(p^{v_p(m)+1})} ∈ p·Z[ζ_{pm}]^×. |
| `changeOfSystem` | other | Two compatible systems differ by a unique u ∈ Ẑ^×, ζ'_m = ζ_m^{u mod m}, and the induced automorphism of P_R preserves H_R and H_{R,ξ}. |

**Unit tests.**

- `compatExp_two_five` (computation): compatExp 2 5 = 6, so ζ_5 = ζ_{10}^6; with ζ_{10} = −ζ_5 (compatible) ζ_{10} − ζ_5 = −2ζ_5 has 2-adic valuation 1.
- `valuation_table` (computation): (ζ_{12} − ζ_4)^{2} ∈ 3·Z[ζ_{12}]^× and (ζ_9 − ζ_3)^{6} ∈ 3·Z[ζ_9]^×, i.e. v_3 = 1/2 and 1/6.
- `traditional_roots_not_close` (non-example): ζ − ζ^2 is a unit of Z[ζ] for ζ a primitive 10th root of unity (ω_{10} − ω_5 with ω_5 = ω_{10}^2), so it is not 2-adically topologically nilpotent.
- `compatible_one` (degenerate): ζ_1 = 1 and, for m = 1, ζ_p − ζ_1 = ζ_p − 1 with (ζ_p − 1)^{p−1} ∈ p·Z[ζ_p]^×.

**Acceptance.**

- v_p(ζ_{pm} − ζ_m) = 1/φ(p^{v_p(m)+1}): 1 for (p,m) = (2,1), (2,3), (2,5), (2,9); 1/2 for (2,2),
(3,1), (3,2), (3,4), (3,10); 1/6 for (3,3); 1/4 for (5,2), (5,3) (PARI, all primes above p).
- For ω_m = e^{2πi/m} the valuation is 0 for (p,m) = (2,3), (2,5), (2,9), (3,4), (3,10), (5,3).
- e(2,5) = 6, e(2,2) = 2, e(3,4) = 9.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.3, equation (7), p. 4 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.3, p. 4-5 (arXiv v2).

<a id="HB-6-coefficient-rings-and-frobenius"></a>

### The cyclotomic coefficient algebras, their p-adic completions and the Frobenius

`HabiroNumberFields:HB.6/coefficient-rings-and-frobenius` · construction

Let K be a number field, Δ a positive integer divisible by disc(K) (GSWZ usually also takes 6 | Δ;
HB.7 needs it) and R = O_K[1/Δ]. For m ≥ 1 the COEFFICIENT ALGEBRA is the full cyclotomic algebra
R[ζ_m] := R ⊗_Z Z[ζ_m] = R[t]/(Φ_m(t)), free of rank φ(m) over R. It is not the subring of a field
generated by R and a root of unity and need not be a domain: for K = Q(i), Δ = 4, R[ζ_4] ≅ R × R,
split by the idempotent (1 − i ⊗ ζ_4)/2. For a prime p, R^_p := lim_n R/p^n R ≅ R ⊗ Z_p and
R^_p[ζ_n] := R^_p ⊗_Z Z[ζ_n], its p-adic completion. If p | Δ these rings are 0. If p ∤ Δ then p is
unramified in K, R/pR ≅ ∏_{𝔭|p} O_K/𝔭 is a finite product of finite fields (not one residue field)
and R^_p ≅ ∏_{𝔭|p} O_{K_𝔭}. The FROBENIUS φ_p is the unique ring endomorphism of R^_p reducing to x
↦ x^p on R/pR; it is an automorphism. It is extended in two ways, both used by GSWZ: (i) φ_p ⊗ id on
R^_p[ζ_n][[x]], fixing ζ_n and x, for every n (Definition 1.1); (ii) for p ∤ m, the Frobenius of
R^_p[ζ_m] with ζ_m ↦ ζ_m^p and x fixed (Lemma 3.4, Definition 1.3), the unique lift of the absolute
Frobenius of the étale F_p-algebra R[ζ_m]/p. φ_p need not be induced by an automorphism of K: for K
= Q(∛2) (only the identity automorphism) and p = 5, R^_5 ≅ Z_5 × Z_{25} and φ_5 is the identity on
the first factor and the non-trivial automorphism on the second. For K abelian over Q, φ_p = Frob_p
⊗ id with Frob_p ∈ Gal(K/Q) the Artin symbol (HB.6/abelian-fields).

**Hypotheses.**

- Δ > 0 and disc(K) | Δ; only the primes dividing Δ matter for R. Footnote 2's variant (Δ ∈ O_K) is
not used.
- p ∤ Δ for the Frobenius; for p | Δ the completed rings are the zero ring and every condition stated
in them is vacuous.
- R[ζ_m] means R ⊗_Z Z[ζ_m]: GSWZ's rank statement (R_p[ζ_m][[x]] has rank r = [K:Q] over
Z_p[ζ_m][[x]]) is true only for the tensor product.

**Prerequisites.** [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `HabiroRings:HR.1/the-etale-frobenius-lift`, `mathlib:NumberField.not_dvd_discr_iff_isUnramifiedIn`, `mathlib:Localization.Away`, `mathlib:AdjoinRoot`, `mathlib:AdicCompletion`, `mathlib:IsAdicComplete`.

**Proof route.**

1. Define R as the localisation of O_K away from Δ (ArithmeticKTheory:N.1/S-integers-as-a-localisation;
mathlib Localization.Away) and R[ζ_m] as AdjoinRoot of Φ_m over R.
2. p ∤ Δ implies p ∤ disc(K), hence p is unramified (mathlib
NumberField.not_dvd_discr_iff_isUnramifiedIn), so R/pR is reduced and étale over F_p and R^_p is
finite étale over Z_p.
3. Construct φ_p as the unique Frobenius lift of the étale Z_p-algebra R^_p: specialise
HabiroRings:HR.1/the-etale-frobenius-lift to the base Z[1/Δ] with trivial Adams operations and the
étale algebra R (RS-10 ownership); equivalently GSWZ §5.2 lifts x ↦ x^p from R/pR to every R/p^nR by
Hensel's lemma. It is bijective because it is so modulo p (Frobenius of a finite product of finite
fields) and R^_p is p-adically complete and p-torsion free.
4. Extend: (i) φ_p ⊗ id on R^_p ⊗ Z[ζ_n] and coefficientwise on power series; (ii) for p ∤ m, φ_p ⊗
(ζ_m ↦ ζ_m^p), which is the Frobenius lift of the étale algebra R^_p[ζ_m] by the uniqueness in step
3.
5. Both extensions commute with the transition maps of HB.6/compatible-roots-of-unity and with the
completion maps.
6. Non-examples: R[ζ_4] ≅ R × R for K = Q(i); φ_5 ≠ id for Q(∛2) at 5 (t^3 − 2 ≡ (t + 2)(t^2 + 3t + 4)
mod 5 with an irreducible quadratic factor).

**Uses that determine the API.**

- GSWZ Definition 1.1, equation (13): extension (i) twists the gluing
- GSWZ Definition 1.3, equation (21), and Lemma 3.4: extension (ii) enters the logarithmic Frobenius
condition and Dwork's lemma
- GSWZ §5.2, (328)-(331): the composite Frobenius φ_m = ∏_p φ_p^{v_p(m)} on R̂ used in the
intersection description
- HabiroRings:HR.5-number-field-comparison/the-number-field-ring: matches its Frobenius twists with
these

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `CoeffRing` | data | R[ζ_m] := R[t]/(Φ_m(t)) = R ⊗_Z Z[ζ_m]. |
| `CoeffRing.zeta` | constructor | The class ζ_m of t, a root of Φ_m. |
| `CoeffRing.map` | functoriality | A ring map R → R' induces R[ζ_m] → R'[ζ_m] with map_id and map_comp. |
| `CompletedCoeff` | data | R^_p[ζ_n], the p-adic completion of R[ζ_n]. |
| `CompletedCoeff.subsingleton_of_dvd` | simp | p \| Δ implies R^_p[ζ_n] = 0. |
| `frobenius` | data | φ_p ⊗ id on R^_p[ζ_n] (extension (i)). |
| `frobenius_zeta` | simp | frobenius(ζ_n) = ζ_n. |
| `frobenius_sub_pow_mem` | characterisation | frobenius(a) − a^p ∈ p·R^_p[ζ_n] for a in the image of R. |
| `frobenius_unique` | characterisation | An endomorphism of R^_p[ζ_n] fixing ζ_n and lifting x ↦ x^p on R/pR equals frobenius. |
| `frobenius_bijective` | relation | frobenius is an automorphism for p ∤ Δ. |
| `cyclotomicFrobenius` | data | For p ∤ m, the Frobenius of R^_p[ζ_m] with ζ_m ↦ ζ_m^p (extension (ii)). |
| `frobenius_comm_transition` | compatibility | frobenius commutes with the transition maps R^_p[ζ_m] → R^_p[ζ_{pm}] and with completion. |
| `frobenius_rat` | compatibility | For K = Q, frobenius = id. |

**Unit tests.**

- `completedCoeff_zero_of_dvd` (degenerate): K = Q(i), Δ = 4, p = 2: R^_2[ζ_n] = 0 for every n.
- `coeffRing_gaussian_splits` (non-example): K = Q(i), Δ = 4: e = (1 − i ⊗ ζ_4)/2 ∈ R[ζ_4] satisfies e^2 = e, e ≠ 0, 1, so R[ζ_4] is not a domain.
- `frobenius_gaussian` (computation): K = Q(i), Δ = 4: φ_3(i) = −i and φ_5(i) = i in R^_p.
- `frobenius_not_global` (non-example): K ∋ ∛2, disc(K) | Δ, 5 ∤ Δ: φ_5 ≠ id on R^_5; for K = Q(∛2), whose only automorphism is the identity, φ_5 is therefore not induced by any automorphism of K.
- `frobenius_rat` (compatibility): K = Q: φ_p = id on Z[1/Δ]^_p[ζ_n] = Z_p[ζ_n].
- `cyclotomicFrobenius_zeta` (characterisation): K = Q, p = 2, m = 3: the Frobenius of Z_2[ζ_3] sends ζ_3 to ζ_3^2, and extension (i) fixes ζ_3; they differ.

**Acceptance.**

- φ_p(a) ≡ a^p (mod p R^_p) for a ∈ R, φ_p fixes ζ_n in extension (i), and φ_p(ζ_m) = ζ_m^p in
extension (ii).
- φ_p is an automorphism of R^_p; it is not in general of the form σ ⊗ id with σ ∈ Aut(K) (Q(∛2), p =
5).
- For p | Δ the completed rings are 0.
- For K = Q, φ_p = id; for K = Q(i) and odd p, φ_p(i) = i^p.

**Sources.** `GSWZ.HabiroNumberField.2024`, Definition 1.1, §1.4, p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Lemma 3.4, §3.2, p. 39 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §5.2, p. 64 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.4, p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Footnote 2, §1.4, p. 6 (arXiv v2).

<a id="HB-6-the-substitution-exists"></a>

### The shift by ζ_pm − ζ_m is a convergent re-expansion

`HabiroNumberFields:HB.6/the-substitution-exists` · lemma

Let p ∤ Δ be prime, m ≥ 1, k = v_p(m), and c = ζ_{pm} − ζ_m ∈ R^_p[ζ_{pm}] (ζ_m taken through the
transition map of the compatible system). Then c^{φ(p^{k+1})} ∈ p·R^_p[ζ_{pm}]^×. Hence c is
topologically nilpotent for the p-adic topology of the p-adically complete and separated ring
R^_p[ζ_{pm}], but it is NOT nilpotent (R^_p[ζ_{pm}] is reduced and c is a unit times 1 −
ζ_{p^{k+1}}). HC.3's re-expansion rex_c : f(x) ↦ f(x + c) is therefore a continuous ring
automorphism of R^_p[ζ_{pm}][[x]] with inverse rex_{−c}, and it commutes with φ_p ⊗ id, which fixes
c. Mathlib's PowerSeries.subst does not apply: its hypothesis HasSubst asks that the constant
coefficient be nilpotent. For p | Δ the ring is 0 and there is nothing to prove. For the traditional
roots ω_m = e^{2πi/m} the shift is not defined in general: ω_{10} − ω_5 is a 2-adic unit.

**Hypotheses.**

- (ζ_m) is the compatible system of HB.6/compatible-roots-of-unity.
- R^_p[ζ_{pm}] = R^_p ⊗ Z[ζ_{pm}] is finite over Z_p, hence p-adically complete and separated.
- p ∤ Δ; for p | Δ the statement is about the zero ring.

**Prerequisites.** [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), `HabiroCyclotomicCompletions:HC.3/p-adic-closeness-of-roots`, `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`.

**Proof route.**

1. Map the identity (ζ_{pm} − ζ_m)^{φ(p^{k+1})} = p·u, u ∈ Z[ζ_{pm}]^× (HB.6/compatible-roots-of-unity)
into R^_p[ζ_{pm}].
2. Topological nilpotence follows; completeness and separatedness hold because R^_p[ζ_{pm}] is a finite
Z_p-module.
3. Apply HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion with B = R^_p[ζ_{pm}] and this c: rex_c
is a continuous ring homomorphism, rex_c ∘ rex_{−c} = id by its cocycle law.
4. φ_p ⊗ id is continuous and fixes c, so it commutes with rex_c (both are determined by their values
on B and on x).
5. c is not nilpotent: R^_p[ζ_{pm}] is a finite product of complete discrete valuation rings (étale
over Z_p[ζ_{p^{k+1}}]) and c is non-zero in each factor; so PowerSeries.HasSubst fails and the
Mathlib substitution cannot be used.

**Acceptance.**

- c = ζ_2 − ζ_1 = −2 for (p,m) = (2,1); c = ζ_4 − ζ_2 = 1 + i with c^2 = 2i for (2,2); c = ζ_6 − ζ_3 =
−2ζ_3 for (2,3) with the compatible system.
- rex_c is a ring automorphism of R^_p[ζ_{pm}][[x]] commuting with φ_p ⊗ id.
- c is not nilpotent, so PowerSeries.subst is not available; the tool is PowerSeries.eval₂Hom under
HasEval, through HC.3.
- For p | Δ there is nothing to prove.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.3, p. 5 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Definition 1.1, equation (13), §1.4, p. 7 (arXiv v2).

<a id="HB-6-the-gluing-condition"></a>

### The Habiro ring of a number field: the Frobenius-twisted Taylor gluing condition

`HabiroNumberFields:HB.6/the-gluing-condition` · definition

Let P_R := (∏_{ζ∈μ_∞} R[ζ][[x]])^{Gal(Q^ab/Q)} ≅ ∏_{m≥1} R[ζ_m][[x]], the isomorphism taking the
component at the compatible root ζ_m with x = q − ζ_m; P_R is a ring componentwise. The HABIRO RING
H_R ⊂ P_R is the set of f = (f_m)_{m≥1} with rex_{ζ_{pm} − ζ_m}(f_m) = (φ_p ⊗ id)(f_{pm}) in
R^_p[ζ_{pm}][[x]] for every prime p and every m ≥ 1 (GSWZ (13)); f_m is mapped to R^_p[ζ_{pm}][[x]]
through the transition map of the compatible system and completion, and rex is
HB.6/the-substitution-exists. For p | Δ both sides lie in the zero ring and the condition is
vacuous. H_R is a subring of P_R, because φ_p ⊗ id and rex are ring homomorphisms. For γ ≥ 1 the
RESTRICTED RING H_R|γ is the subring of ∏_{m≥1, (m,γ)=1} R[ζ_m][[x]] cut out by (13) for the pairs
(m, pm) with (pm, γ) = 1; the restriction H_R → H_R|γ is a ring homomorphism, H_R|1 = H_R, and H_R|γ
→ H_R|γγ' is again restriction. The evaluations f ↦ f_m(0) ∈ R[ζ_m] and projections f ↦ f_m are ring
homomorphisms.

**Hypotheses.**

- R = O_K[1/Δ] with disc(K) | Δ; the roots are the compatible system; φ_p is extension (i) of
HB.6/coefficient-rings-and-frobenius.
- The families have no convergence property over C; only the p-adic re-expansions of (13) are used.
- H_R|γ imposes (13) only between orders prime to γ, so its gluing primes are those dividing neither γ
nor Δ.

**Prerequisites.** [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), [HabiroNumberFields:HB.6/the-substitution-exists](#HB-6-the-substitution-exists), `mathlib:PowerSeries.map`.

**Proof route.**

1. Define P_R as the product ∏_m R[ζ_m][[x]]; record the Galois-invariant description (8) as the API
item galoisInvariant.
2. Define GluesAt p m f as the equation rex_{ζ_pm − ζ_m}(f_m) = (φ_p ⊗ id)(f_pm) in R^_p[ζ_pm][[x]],
using HB.6/the-substitution-exists.
3. H_R is the set of f with GluesAt p m f for all p, m; closure under +, ×, −, 0, 1 is routine since
both sides are ring homomorphisms in f.
4. For p | Δ, GluesAt holds because the target ring is 0.
5. Define H_R|γ and the restriction homomorphisms the same way on orders prime to γ.

**Uses that determine the API.**

- GSWZ Definitions 1.3-1.4: H_R and H_{R[1/γ]}|γ are the rings over which the modules and the gluing
(24) are stated
- HB.7/the-global-module: condition (24) asks f(q^γ)^γ f(q^{−1}) ∈ H_{R[1/γ]}|γ
- HabiroRings:HR.5-number-field-comparison/the-number-field-ring: identified with the relative ring
- HabiroNahmSeries HB.9, HB.10: membership statements and explicit elements

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `Families` | data | P_R = ∏_{m≥1} R[ζ_m][[x]] with componentwise ring structure. |
| `Families.galoisInvariant` | equivalence | P_R ≅ (∏_{ζ∈μ_∞} R[ζ][[x]])^{Gal(Q^ab/Q)}, by the component at ζ_m. |
| `GluesAt` | characterisation | The equation (13) at (p, m). |
| `habiroRing` | structure | H_R as a Subring of P_R. |
| `mem_habiroRing_iff` | characterisation | f ∈ H_R iff GluesAt p m f for all primes p and all m ≥ 1. |
| `gluesAt_of_dvd` | simp | p \| Δ implies GluesAt p m f for all f. |
| `habiroRing.ext` | extensionality | f = g iff f_m = g_m for all m. |
| `habiroRing.proj` | projection | The ring homomorphism f ↦ f_m ∈ R[ζ_m][[x]]. |
| `habiroRing.eval` | projection | The ring homomorphism f ↦ f_m(0) ∈ R[ζ_m]. |
| `habiroRingPrimeTo` | structure | H_R\|γ as a subring of ∏_{(m,γ)=1} R[ζ_m][[x]]. |
| `habiroRing.restrict` | functoriality | H_R → H_R\|γ and H_R\|γ → H_R\|γγ', with restrict_one = id and restrict_restrict. |

**Unit tests.**

- `kontsevich_rational` (computation): K = Q, Δ = 1, F = Σ_n (q;q)_n: f_1 = 1 − x + 2x^2 − 5x^3 + 15x^4 − 53x^5 + 217x^6 + O(x^7), f_2 = 3 + 11x + 72x^2 + O(x^3), f_3(0) = 5 − ζ_3, f_4(0) = 8 − 3ζ_4, and (13) holds at (p,m) = (2,1): Σ_n a_n(−2)^n = 3 and Σ_n n a_n (−2)^{n−1} = 11 in Z_2 (a_n the coefficients of f_1); at (3,1): Σ_n a_n(ζ_3 − 1)^n = 5 − ζ_3 in Z_3[ζ_3]; at (2,2): Σ_n b_n(ζ_4 + 1)^n = 8 − 3ζ_4 in Z_2[ζ_4] (b_n those of f_2).
- `gluesAt_of_dvd` (degenerate): If p | Δ then GluesAt p m f for every f ∈ P_R; and H_R|1 = H_R.
- `constant_i_not_glued` (non-example): K = Q(i), Δ = 4: the constant family (i)_m is not in H_R, since (13) at (p,m) = (3,1) reads i = φ_3(i) = −i in R^_3[ζ_3], where 2i ≠ 0.
- `odd_indicator_Z_half` (characterisation): K = Q, Δ = 2: the family e with e_m = 1 for m odd and e_m = 0 for m even lies in H_{Z[1/2]}, e^2 = e, e ≠ 0, 1 (GSWZ Example 5.7), so H_{Z[1/2]} is not a domain; e ∉ H_Z, since (13) at (2,1) would read 1 = 0 in Z_2[[x]].
- `traditional_roots_undefined` (non-example): With ω_m = e^{2πi/m} in place of the compatible system the equation (13) at (p,m) = (2,5) involves f_5(x + u) with u = ω_{10} − ω_5 a unit of Z_2[ζ_{10}], which does not converge for f_5 = Σ x^n.
- `classical_case` (compatibility): K = Q, Δ = 1: the Taylor maps give a ring isomorphism Z[q]^N ≅ H_Z (HB.6/ring-operations-and-the-classical-comparison).

**Acceptance.**

- The condition is vacuous at a prime dividing Δ, and H_R|1 = H_R.
- H_R and every H_R|γ are subrings; restriction and evaluation are ring homomorphisms.
- For K = Q, Δ = 1 the definition returns Habiro's ring
(HB.6/ring-operations-and-the-classical-comparison).

**Sources.** `GSWZ.HabiroNumberField.2024`, Definition 1.1, (12)-(13), §1.4, pp. 6-7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.4, after Definition 1.1, p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.3, equation (8), p. 5 (arXiv v2).

<a id="HB-6-the-p-completed-ring"></a>

### The p-completed Habiro ring and the intersection description

`HabiroNumberFields:HB.6/the-p-completed-ring` · construction

For a prime p ∤ Δ the p-COMPLETED HABIRO RING is H_{R^_p} := ∏_{m≥1, (m,p)=1} R^_p[ζ_m][[x]] (GSWZ
(14)). It is isomorphic, by restriction to orders prime to p, to the ring of families (g_m)_{m≥1},
g_m ∈ R^_p[ζ_m][[x]], glued by UNTWISTED re-expansion g_m(x + ζ_{pm} − ζ_m) = g_{pm}(x): on each
chain {m p^k : k ≥ 0} with p ∤ m the family is determined by g_m through rex, and orders prime to p
impose no condition on one another. The canonical homomorphism H_R → H_{R^_p} is f ↦
(f_m)_{(m,p)=1}; on all orders it is f ↦ (φ_p^{v_p(m)} f_m)_m, which is untwisted-glued because φ_p
fixes ζ_{pm} and commutes with rex (GSWZ (15)). INTERSECTION DESCRIPTION: f ∈ P_R lies in H_R iff
for every prime p ∤ Δ the family (φ_p^{v_p(m)} f_m)_m is untwisted-glued over R^_p; and a family
(f_m) with f_m ∈ K[ζ_m][[x]] lies in P_R as soon as every f_m has coefficients in R^_p[ζ_m] for
every p ∤ Δ, since R = K ∩ ∏_{p∤Δ} R^_p. For p | Δ, H_{R^_p} = 0.

**Hypotheses.**

- p ∤ Δ; the completion R^_p and φ_p are those of HB.6/coefficient-rings-and-frobenius.
- The isomorphism of H_{R^_p} with the untwisted-glued families uses only the re-expansion
automorphisms; it says nothing about the p-adic completion (H_R)^_p, whose identification with
H_{R^_p} (first isomorphism of (14)) is stated by GSWZ without proof and is not used here.
- The integrality step R = K ∩ ∏_{p∤Δ} R^_p is the statement that an element of K integral at every
prime of O_K not dividing Δ lies in O_K[1/Δ].

**Prerequisites.** [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`.

**Proof route.**

1. Define H_{R^_p} and the restriction map from the untwisted-glued families; its inverse extends g_m
(p ∤ m) to g_{mp^k} := rex_{ζ_{mp^k} − ζ_m}(g_m), which is glued by the cocycle law of
HC.3/p-adic-re-expansion.
2. For f ∈ H_R, (13) at (p, mp^k) and the fact that φ_p fixes ζ and commutes with rex give φ_p^{k+1}
f_{mp^{k+1}} = rex(φ_p^{k} f_{mp^k}); so (φ_p^{v_p(m)} f_m) is untwisted-glued.
3. Conversely the same identity read backwards gives (13) at p from untwisted gluing of the twisted
family, φ_p being bijective.
4. Integrality: O_K[1/Δ] = {a ∈ K : a ∈ O_{K_𝔭} for all 𝔭 ∤ Δ} (Dedekind domain), applied to each
coefficient in the basis 1, ζ_m, ..., ζ_m^{φ(m)−1} of R[ζ_m] over R.

**Uses that determine the API.**

- GSWZ Definition 1.3 and Theorem 1: H_{R^_p,ξ} is an H_{R^_p}-span, free of rank one over H_{R^_p}
- GSWZ proof of Theorem 2, §3.3: 'Varying over all primes shows that f ∈ H_R' is
mem_habiroRing_iff_twist with mem_families_of_forall_padic
- HabiroNahmSeries request to HB.6: 'the p-completed description'

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `PCompletedHabiroRing` | data | H_{R^_p} = ∏_{(m,p)=1} R^_p[ζ_m][[x]]. |
| `PCompletedHabiroRing.subsingleton_of_dvd` | simp | p \| Δ implies H_{R^_p} = 0. |
| `untwistedGlued_equiv` | equivalence | Restriction is a ring isomorphism from the untwisted-glued families over R^_p onto H_{R^_p}. |
| `toPCompleted` | data | The ring homomorphism H_R → H_{R^_p}, f ↦ (f_m)_{(m,p)=1}. |
| `frobeniusTwist` | data | P_R → ∏_m R^_p[ζ_m][[x]], f ↦ (φ_p^{v_p(m)} f_m)_m. |
| `mem_habiroRing_iff_twist` | characterisation | f ∈ H_R iff frobeniusTwist p f is untwisted-glued for every p ∤ Δ. |
| `mem_families_of_forall_padic` | characterisation | A family over K[ζ_m] whose coefficients lie in R^_p[ζ_m] for every p ∤ Δ lies in P_R. |

**Unit tests.**

- `pCompleted_zero_of_dvd` (degenerate): K = Q, Δ = 6, p = 3: H_{R^_3} = 0.
- `kontsevich_two_adic` (computation): K = Q, Δ = 1, p = 2: toPCompleted of the Kontsevich series has component at m = 1 equal to 1 − x + 2x^2 − 5x^3 + O(x^4), and rex_{−2} of it equals 3 + 11x + 72x^2 + O(x^3) in Z_2[[x]].
- `gaussian_split_prime` (compatibility): K = Q(i), Δ = 4, p = 5: R^_5 ≅ Z_5 × Z_5 with φ_5 = id, and H_{R^_5} ≅ H_{Z^_5} × H_{Z^_5}.
- `untwisted_map_fails` (non-example): K = Q(i), Δ = 4, p = 3: for f the image of i under HB.6/abelian-fields (f_1 = i, f_3 = −i), the family (f_m) without the twist φ_3^{v_3(m)} is not untwisted-glued (f_1(x + ζ_3 − 1) = i ≠ −i = f_3), whereas (φ_3^{v_3(m)} f_m) is.

**Acceptance.**

- H_{R^_p} = 0 for p | Δ.
- H_R → H_{R^_p} is a ring homomorphism, and f ∈ P_R lies in H_R iff its twisted image is
untwisted-glued at every p ∤ Δ.
- For K = Q, p = 2 the image of the Kontsevich series is (f_m)_{m odd}, and its untwisted extension to
m = 2 is f_1(x − 2) = 3 + 11x + O(x^2) = f_2.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.4, equation (14), p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.4, after (15), p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Proposition 5.3, §5.2, p. 65 (arXiv v2).

<a id="HB-6-p-chain-mixed-adic-comparison"></a>

### The mixed-adic completion of a p-chain

`HabiroNumberFields:HB.6/p-chain-mixed-adic-comparison` · comparison

Let p be prime, m>=1 and p not divide m. Put B=Z_p[q], C_m={m*p^k : k>=0}, Phi=Phi_m(q), and
I=(p,Phi). There is a canonical ring equivalence chainMixedEquiv : B^(C_m) ≃ AdicCompletion I B,
commuting with the maps from B. Here B^(C_m) is HC.1's completion over all finite products of the
cyclotomic polynomials in C_m, not merely the inverse limit over the polynomials Phi_(m*p^k)
individually. The equivalence is obtained from the double system B/(p^a,f); it does not assert
cofinality of the uncompleted ideals (f) and I^n in B.

**Hypotheses.**

- p is prime; m>=1; p does not divide m. All coefficient rings and limits are ordinary commutative
rings, not derived completions.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.1/completion-along-a-cofinal-family`, `mathlib:AdicCompletion`, `mathlib:AdicCompletion.isAdicComplete`, `mathlib:AdjoinRoot.powerBasisAux'`, `mathlib:Polynomial.cyclotomic_mul_prime_pow_eq`, `mathlib:PadicInt.toZModPow`, `mathlib:PadicInt.ker_toZModPow`, `mathlib:PadicInt.lift`, `mathlib:PadicInt.lift_spec`, `mathlib:PadicInt.lift_unique`.

**Proof route.**

1. First let S be the ring of compatible families in ZMod(p^a). Its evaluation ring maps satisfy
PadicInt.lift's compatibility hypothesis. PadicInt.lift_spec and lift_unique make the canonical ring
map Z_p -> S an equivalence. For each monic chain product f, the monic power basis identifies B/(f),
as a Z_p-module, with a finite power of Z_p. Apply the scalar equivalence to each compatible
coordinate family to obtain B/(f) ≃ lim_a B/(f,p^a); preserve multiplication by checking reductions,
using scalar separatedness. The basis coordinate functions themselves need not be ring
homomorphisms. For f=1 both sides are zero.
2. Take the limit over f. Both iterated limits are compatible arrays indexed by (f,a), so lim_f lim_a
B/(f,p^a) ≃ lim_a lim_f B/(f,p^a), with ring operations coordinatewise. This is an interchange of
limits; no infinite tensor product is interchanged with completion.
3. Write f=product_k Phi_(m*p^k)^e_k with finite support. Modulo p its reduction is Phi^E with E=sum_k
e_k*w_k, w_0=1 and w_k=p^k-p^(k-1) for k>0, by cyclotomic_mul_prime_pow_eq. Thus in B/(f,p^a), Phi^E
lies in p times the quotient, hence Phi^(a*E)=0 for a>=1. So (p^a,Phi^(a*E)) is contained in
(p^a,f). For f=1 use the unit ideal. Conversely every Phi^s is itself in the monoid. The two systems
modulo p^a are cofinal.
4. Replace f by Phi^s inside the double limit. The ideals (p^a,Phi^s) are cofinal with powers of I:
I^(a+s-1) is contained in (p^a,Phi^s) for a,s>=1, and (p^n,Phi^n) is contained in I^n. Identify the
double limit with the baseline AdicCompletion.
5. The comparison and its inverse preserve the class of every polynomial, since every arrow was induced
by the identity of B.

**Acceptance.**

- p=2,m=1: the map sends q to its compatible mixed-adic classes and includes the whole chain 1,2,4,...
.
- In B/(p^a,f), Phi^(a*E)=0; for p=2,m=1,f=Phi_2=q+1,a=2 this gives (q-1)^2=0 modulo (4,q+1).
- Raw ideal cofinality is not an acceptance property: for p=2,m=1 no nonempty chain product divides
the constant 2 in Z_2[q], whereas 2 belongs to I.

**Sources.** `GSWZ.v2`, §1.4, equation (14), p. 7; §5.2, Proposition 5.3, p. 65; `Wagner.qWitt.v5`, §2.1, proof of Lemma 2.1, p. 8.

<a id="HB-6-prime-to-p-taylor-equivalence"></a>

### Prime-to-p Taylor splitting

`HabiroNumberFields:HB.6/prime-to-p-taylor-equivalence` · construction

For a prime p, primeToPTaylorEquiv is the ring equivalence Z_p[q]^N ≃ product_(m>=1,p not divide m)
A_m(Z_p)[[x]], where A_m(Z_p)=Z_p[t]/Phi_m(t), zeta_m is the universal root and x=q-zeta_m. Its
m-component is the existing HC.3 Taylor map. No residue factor is discarded, and there are no
relations between distinct prime-to-p indices.

**Hypotheses.**

- p is prime. The root convention is the compatible system of HB.6/compatible-roots-of-unity. The
product is indexed by all positive prime-to-p orders.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.5/chinese-remainder-for-disconnected-collections`, `HabiroRings:HR.5/the-ell-adic-taylor-comparison`, [HabiroNumberFields:HB.6/p-chain-mixed-adic-comparison](#HB-6-p-chain-mixed-adic-comparison), [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity).

**Proof route.**

1. Apply HC.5/chinese-remainder-for-disconnected-collections to Z_p. The non-comaximality classes of
positive orders are exactly C_m={m*p^k} for p not dividing m: all other primes are units in Z_p.
Take its full product equivalence, including infinitely many classes.
2. Apply p-chain-mixed-adic-comparison to every class and the HR.5/the-ell-adic-taylor-comparison to
its mixed-adic completion. The latter gives A_m(Z_p)[[x]] for the full finite etale coefficient
algebra, not one Hensel factor.
3. All constituent maps agree with polynomial Taylor expansion. Cofinal projection continuity and
density, or directly the compatible finite quotient formulas, identify each component with
HC.3/the-taylor-map.
4. The inverse assembles the individual local-chart inverses followed by the inverse CRT map. The
displayed API follows from the ring equivalence, its polynomial normalization and component
projections.

**Uses that determine the API.**

- GSWZ §1.4, (14); HB.6/the-p-adic-classical-ring: Supplies the missing classical local-product
equivalence with all factors.
- HB.6/ring-operations-and-the-classical-comparison; HC.4/local-integrality-detection: Converts an
untwisted locally glued family to a classical Z_p-completion element.
- HabiroRings:HR.5-number-field-comparison: Exports the explicit local classical comparison without
importing the downstream number-field specialization.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `primeToPTaylorEquiv` | equivalence | The ring equivalence Z_p[q]^N ≃ product_(p not divide m) A_m(Z_p)[[x]], assembled from CRT, chainMixedEquiv and the imported local Taylor chart. |
| `primeToPTaylorEquiv_component` | compatibility | At any positive m with p not divide m, the component of primeToPTaylorEquiv(F) is the existing Taylor map sigma_(zeta_m)(F). |
| `primeToPTaylorEquiv_polynomial` | characterisation | For g in Z_p[q], the m-component is g(zeta_m+x), expanded by the HC.3 Taylor map. |
| `primeToPTaylorEquiv_constant` | simp | The component of the image of a constant a is the constant series C(a), at every prime-to-p order. |
| `primeToPTaylorEquiv_X` | simp | The component of the image of q is C(zeta_m)+x. |
| `primeToPTaylorEquiv_symm_component` | universal-property | For an arbitrary tuple g of prime-to-p series, Taylor_m(primeToPTaylorEquiv.symm(g))=g_m for every prime-to-p m; no relations are imposed between different such m. |
| `primeToPTaylorEquiv_ext` | extensionality | Equality of Taylor_m(F) and Taylor_m(G) for every prime-to-p m implies F=G. |
| `primeToPTaylorEquiv_idempotent` | structure | For any subset T of the prime-to-p orders, the inverse image of the tuple that is 1 on T and 0 elsewhere is an idempotent; its prime-to-p Taylor components are exactly that tuple. |

**Unit tests.**

- `primeToP_zero` (degenerate): For p=2, the zero classical completion element maps to the zero tuple; every odd-order component is zero.
- `primeToP_square_at_one` (computation): For p=2,m=1, the image of q^2 is 1+2x+x^2: its coefficients at k=0,1,2,3 are 1,2,1,0.
- `primeToP_full_cyclotomic_algebra` (non-example): For p=11,m=5, A_5(Z_11) has a Z_11-basis of size 4 and A_5(F_11) ≃ F_11^4. The m=5 component is the full four-factor power-series algebra; selecting a single root gives the wrong comparison.
- `primeToP_independent_orders` (characterisation): For p=2 there is an idempotent whose odd-order Taylor series is 1 at m=1 and 0 at every other odd m. In particular its expansions at orders 1 and 3 differ; the product imposes no cross-chain relation.

**Acceptance.**

- The inverse accepts every tuple, including independent idempotents of separate chains.
- For p=2,m=1 polynomial q maps to 1+x; the p-power orders are reconstructed from this one chart.
- For p=11,m=5 all four residue factors occur.

**Sources.** `GSWZ.v2`, §1.4, equation (14), p. 7; §5.2, Proposition 5.3, p. 65; `Wagner.Habiro.v2`, §2, proof of Lemma 2.12, p. 18.

<a id="HB-6-untwisted-families-are-classical-taylor-families"></a>

### The local Taylor image is the untwisted glued ring

`HabiroNumberFields:HB.6/untwisted-families-are-classical-taylor-families` · theorem

For prime p, let P_p=product_(m>=1) A_m(Z_p)[[x]] and G_p be its subring defined by
rex_(zeta_(pm)-zeta_m)(f_m)=f_(pm) for every m, after the compatible coefficient inclusion A_m ->
A_(pm). The full HC.3 Taylor map iota_p : Z_p[q]^N -> P_p is injective and its range is exactly G_p.
Its inverse on G_p is primeToPTaylorEquiv.symm applied to the prime-to-p restriction.

**Hypotheses.**

- p is prime; all-order roots and coefficient inclusions are the compatible ones. Re-expansion takes
place in the p-adically complete coefficient algebra A_(pm)(Z_p).

**Prerequisites.** [HabiroNumberFields:HB.6/prime-to-p-taylor-equivalence](#HB-6-prime-to-p-taylor-equivalence), [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), [HabiroNumberFields:HB.6/the-substitution-exists](#HB-6-the-substitution-exists), `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`, `HabiroCyclotomicCompletions:HC.3/p-adic-re-expansion`.

**Proof route.**

1. For any classical completion element, HC.3/re-expansion-of-taylor-expansions gives the untwisted
gluing equations; hence iota_p lands in G_p.
2. For f in G_p restrict to prime-to-p orders, and let F be the inverse image under
primeToPTaylorEquiv. The Taylor families of F and f agree at those orders.
3. Every positive n has the unique form m*p^k with p not dividing m. Induct along k using the gluing
equation, the compatible coefficient inclusions and the cocycle law of HC.3/p-adic-re-expansion. The
two families agree at n. This uses forward extension along the chain; it never attempts to descend
arbitrary ramified coefficients backwards.
4. Equality of prime-to-p Taylor components implies equality of F by primeToPTaylorEquiv_ext. Therefore
the full Taylor map is injective, and the stated reconstruction is its inverse on G_p.

**Acceptance.**

- The arbitrary tuple from primeToP_independent_orders extends to an all-order family with value 1 on
the 2-power chain and 0 on every other chain.
- The constant family 1 is glued at p=2; the family that is 1 at order 1 and 0 at all other orders
fails already at m=1,pm=2.
- The theorem identifies the range in full cyclotomic algebras, with the coefficient inclusions
explicitly present.

**Sources.** `GSWZ.v2`, §1.4, equation (14), p. 7; §5.2, Proposition 5.3, p. 65; `GSWZ.v2`, §1.3, (9), pp. 4–5.

<a id="HB-6-the-p-adic-classical-ring"></a>

### Habiro's ring over Z_p splits into power series rings at orders prime to p

`HabiroNumberFields:HB.6/the-p-adic-classical-ring` · lemma

Let p be a prime and A = Z_p. For m ≥ 1 with p ∤ m the Taylor map at ζ_m is an isomorphism
A[q]^{{mp^k : k ≥ 0}} ≅ A[ζ_m][[q − ζ_m]], and restriction gives A[q]^N ≅ ∏_{m≥1,(m,p)=1}
A[q]^{{mp^k}} ≅ ∏_{(m,p)=1} Z_p[ζ_m][[x]]. Consequently a family (g_m)_{m≥1}, g_m ∈ Z_p[ζ_m][[x]],
glued by untwisted re-expansion at p is the Taylor family of a unique element of Z_p[q]^N. This is
the case R = Z_p of the second and third isomorphisms of GSWZ (14), which GSWZ state without proof.

**Hypotheses.**

- A = Z_p: every prime ℓ ≠ p is a unit, so Φ_a and Φ_b are comaximal in A[q] unless b/a is a power of
p.
- The chain {mp^k} is connected for adjacency over Z_p, and Z_p is p-adically separated.
- HC.4/rootwise-taylor-injectivity does not apply at ζ_m directly when m has an odd prime factor ℓ ≠ p
(Z_p is not ℓ-adically separated); the argument goes through the (p, Φ_m)-adic topology instead.

**Prerequisites.** `HabiroCyclotomicCompletions:HC.5/chinese-remainder-for-disconnected-collections`, `HabiroCyclotomicCompletions:HC.1/completion-along-a-cofinal-family`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`, [HabiroNumberFields:HB.6/prime-to-p-taylor-equivalence](#HB-6-prime-to-p-taylor-equivalence), [HabiroNumberFields:HB.6/untwisted-families-are-classical-taylor-families](#HB-6-untwisted-families-are-classical-taylor-families).

**Proof route.**

1. Apply HB.6/prime-to-p-taylor-equivalence, using HC.5 infinite CRT,
HB.6/p-chain-mixed-adic-comparison and the exact HR.5/the-ell-adic-taylor-comparison on every
cyclotomic factor.
2. The p-chain proof compares finite monic quotients after reducing modulo p^a and interchanges the two
complete inverse limits. Raw cyclotomic and mixed-adic ideals are not asserted cofinal.
3. Apply HB.6/untwisted-families-are-classical-taylor-families for the all-order image and uniqueness,
reconstructing the forward p-chain through coefficient inclusions.

**Acceptance.**

- Z_p[q]^N ≅ ∏_{(m,p)=1} Z_p[ζ_m][[x]] by the Taylor maps.
- The untwisted-glued families over Z_p are exactly the Taylor families of Z_p[q]^N.
- Over Z itself the Taylor map at a single root is injective but not surjective
(HC.4/taylor-maps-are-not-surjective); over Z_p on a chain it is bijective.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.4, equation (14), p. 7 (arXiv v2).

<a id="HB-6-additive-and-multiplicative-taylor-coordinates"></a>

### The two Taylor coordinate conventions

`HabiroNumberFields:HB.6/additive-and-multiplicative-taylor-coordinates` · lemma

For a commutative ring R, m>=1 and universal root zeta_m in A_m(R), pass from additive x=q-zeta_m to
multiplicative u by x=-zeta_m*u. The existing map PowerSeries.rescale(-zeta_m) has inverse
rescale(-zeta_m^(-1)). If f_m(x)=sum a_k*x^k, its HC.4 coordinates satisfy
C_(m,l)=(-zeta_m)^(l-1)*a_(l-1) for l>=1. Componentwise rescaling is a ring equivalence of the two
Taylor products; it sends the additive HC.3 Taylor family of F to the multiplicative HC.4 Taylor
family of F, commutes with coefficient ring maps preserving the universal root, and preserves every
weighted precision condition m*(k+1)<N. No re-expansion by a nonzero constant is used for this
change of variable.

**Hypotheses.**

- R is a commutative ring, m>=1, l>=1; zeta_m is a unit because zeta_m^m=1. At precision N the kept
coefficients have m*(k+1)<N.

**Prerequisites.** [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.4/universal-taylor-product`, `HabiroCyclotomicCompletions:HC.4/multiplicative-taylor-comparison`, `mathlib:PowerSeries.rescale`, `mathlib:PowerSeries.coeff_rescale`, `mathlib:PowerSeries.rescale_rescale`.

**Proof route.**

1. Use the unit root from HB.6/compatible-roots-of-unity and the baseline PowerSeries.rescale. Its
coefficient formula gives the exponent l-1, including the constant coefficient at l=1.
2. PowerSeries.rescale_rescale gives the inverse. Multiplication by the unit (-zeta_m)^k preserves
coefficient vanishing, hence the weighted jet filtration with kept coordinates m*(k+1)<N.
3. Coefficient maps preserving the root commute with rescaling coefficientwise. Polynomial expansions
agree because zeta_m+x=zeta_m*(1-u) after the substitution.
4. Unfold the HC.4/multiplicative-taylor-comparison definition, which is the HC.3 Taylor map followed
by this very rescaling. Hence the two Taylor families agree at every coefficient and weighted finite
jet. No new density lemma or interchange of infinite tensor products is needed.

**Acceptance.**

- m=1: 1+x maps to 1-u; m=2: x maps to u since zeta_2=-1.
- Constants are unchanged; the coefficient at l=1 is a_0, not a_1.
- At precision N=4 the order-one terms of exponents 0,1,2 are retained and exponent 3 is discarded:
m*(k+1)<N, not k*m<N-1.

**Sources.** `GSWZ.v2`, §1.3, (6), p. 4; §5.1, (298)–(300), p. 59.

<a id="HB-6-rational-gluing-image-criterion"></a>

### Arithmetic gluing characterizes the rational Taylor image

`HabiroNumberFields:HB.6/rational-gluing-image-criterion` · theorem

Let Delta>=1, R=Z[1/Delta], and iota_R : R[q]^N -> P_R be the full additive-coordinate Taylor map.
For every f in P_R, f is in range(iota_R) iff f satisfies the defining equations of
HB.6/the-gluing-condition (the Frobenius lifts for Q are identities). Moreover iota_R is injective.
Thus the already-planned classical comparison obtains its missing surjectivity input for every
Delta, in particular Delta=1; this theorem does not identify H_Z[1/Delta] with the cyclotomic
completion over Z[1/Delta].

**Hypotheses.**

- Delta is a positive integer; use the compatible root system, full cyclotomic coefficient algebras,
and gluing only at primes p not dividing Delta.

**Prerequisites.** [HabiroNumberFields:HB.6/additive-and-multiplicative-taylor-coordinates](#HB-6-additive-and-multiplicative-taylor-coordinates), [HabiroNumberFields:HB.6/untwisted-families-are-classical-taylor-families](#HB-6-untwisted-families-are-classical-taylor-families), [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), `HabiroCyclotomicCompletions:HC.4/local-integrality-detection`, `HabiroCyclotomicCompletions:HC.4/global-taylor-injective`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`.

**Proof route.**

1. Use additive-and-multiplicative-taylor-coordinates to translate f and its coefficientwise p-adic
images into HC.4's coordinate convention. Naturality and the identification of the two Taylor maps
ensure that range membership is preserved.
2. Apply HC.4/local-integrality-detection: f belongs to the global Taylor image iff its coefficientwise
image at every p not dividing Delta belongs to the Z_p Taylor image. This supplies the old request
to HC.4 exactly, including the finite integral lattice reconstruction.
3. By untwisted-families-are-classical-taylor-families, the local range condition is precisely
untwisted p-gluing. For K=Q the coefficient Frobenius is identity, so the conjunction of these
conditions is exactly the imported definition of H_R. At inverted primes the coefficient completion
is zero and imposes no equation.
4. R=Z[1/Delta] is Z-torsion-free. Apply the exact HC.4/global-taylor-injective theorem and transport
injectivity through the invertible coordinate change. No assertion that one Taylor chart is
injective when Delta>1 is made.
5. Transport the resulting range identification into the parent comparison node; its decomposition and
localization non-surjectivity consequences remain supplied by its existing HC.5 references.

**Acceptance.**

- Delta=1: the additive Taylor image is exactly GSWZ's H_Z and is ring-isomorphic to lim_N
Z[q]/((q;q)_N).
- Delta=2: the constant-series family f_m=1 for odd m and 0 for even m is glued and lies in the Taylor
image over Z[1/2]. It is not glued over Z, since the p=2 relation at m=1 would equate 1 and 0.
- For Delta=1 the constant-series family that is 1 at m=1 and 0 elsewhere is excluded by 2-gluing even
though every component has integral coefficients.

**Sources.** `GSWZ.v2`, §1.3, (6)–(9), pp. 4–5; §5.1, Proposition 5.2, p. 63; §5.2, Proposition 5.3, p. 65.

<a id="HB-6-ring-operations-and-the-classical-comparison"></a>

### For the rational field the glued ring is Habiro's cyclotomic completion

`HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison` · theorem

Let K = Q and Δ ≥ 1, so R = Z[1/Δ] and every φ_p is the identity. The Taylor maps at the compatible
roots, ι(F) := (σ_{ζ_m}(F))_{m≥1} with σ_ζ the Taylor map of HC.3 and x = q − ζ_m, form an injective
ring homomorphism ι : Z[1/Δ][q]^N → P_{Z[1/Δ]} whose image is exactly H_{Z[1/Δ]} of
HB.6/the-gluing-condition. For Δ = 1 this identifies GSWZ's H_Z with Habiro's ring Z[q]^N = lim_N
Z[q]/((q;q)_N). Consequently H_{Z[1/Δ]} is the product over the classes S_a of HC.5 of the domains
Z[1/Δ][q]^{S_a}, and Z[q]^N[1/Δ] → H_{Z[1/Δ]} is injective but not surjective when Δ > 1 (the
idempotent of GSWZ Example 5.7 is not in the image, which is a domain).

**Hypotheses.**

- The roots are the compatible system; with ω_m = e^{2πi/m} the image does not glue in the sense of
(13) (HB.6/compatible-roots-of-unity).
- Δ ≥ 1 arbitrary; for Δ = 1 injectivity is Habiro's single-root theorem, for Δ > 1 it is injectivity
of evaluation at all roots (HC.5).
- The description of the image is not in Habiro's paper, which GSWZ §1.3 cites for it; it is proved
here from GSWZ (14) and the lattice argument of GSWZ §5.1 (source issue HabiroNumberFields/E22).

**Prerequisites.** [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring), [HabiroNumberFields:HB.6/the-p-adic-classical-ring](#HB-6-the-p-adic-classical-ring), [HabiroNumberFields:HB.6/compatible-roots-of-unity](#HB-6-compatible-roots-of-unity), `HabiroCyclotomicCompletions:HC.1/the-cyclotomic-completion`, `HabiroCyclotomicCompletions:HC.1/cofinality-of-the-factorial-products`, `HabiroCyclotomicCompletions:HC.3/the-taylor-map`, `HabiroCyclotomicCompletions:HC.3/re-expansion-of-taylor-expansions`, `HabiroCyclotomicCompletions:HC.4/rootwise-taylor-injectivity`, `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`, `HabiroCyclotomicCompletions:HC.5/components-over-a-localised-integer-ring-are-domains`, [HabiroNumberFields:HB.6/rational-gluing-image-criterion](#HB-6-rational-gluing-image-criterion).

**Proof route.**

1. Apply HB.6/rational-gluing-image-criterion for every Δ≥1. Frobenius is the identity over Z[1/Δ].
2. Use HB.6/additive-and-multiplicative-taylor-coordinates to match x=q−ζ_m with q=ζ_m(1−u);
coefficient l−1 rescales by (−ζ_m)^(l−1).
3. The global image test uses exact HC.4/local-integrality-detection and HC.4/global-taylor-injective,
plus the prime-to-p splitting. The finite bound is m*(k+1)<N.
4. Transport HC.5’s component and domain statements. The parity idempotent after completing Z[1/2][q]
separates this ring from localizing the completed Z-Habiro ring.

**Acceptance.**

- K = Q, Δ = 1: ι(Σ_n (q;q)_n) has f_1 = 1 − x + 2x^2 − 5x^3 + 15x^4 − 53x^5 + 217x^6 + O(x^7) and f_2
= 3 + 11x + 72x^2 + O(x^3), and lies in H_Z.
- ι is injective for every Δ ≥ 1 and its image is H_{Z[1/Δ]}.
- Δ = 2: the family with f_m = 1 for m odd and 0 for m even is in H_{Z[1/2]} but not in the image of
Z[q]^N[1/2].
- With ω_m = e^{2πi/m} in place of the compatible system, the re-expansion in (13) at (p,m) = (2,3) is
not defined: ω_6 − ω_3 = 1 is a 2-adic unit.

**Sources.** `GSWZ.HabiroNumberField.2024`, §5.1, after (296), p. 59 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.3, p. 5 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §5.1, (310), p. 61 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Example 5.7, §5.3, p. 66 (arXiv v2).

<a id="HB-6-decomposition-into-classes"></a>

### H_R is a product over the classes of orders; H_R|Δ is a domain

`HabiroNumberFields:HB.6/decomposition-into-classes` · theorem

Let ∼_Δ be the equivalence relation on N_{>0} generated by m ∼ pm for primes p ∤ Δ; m ∼_Δ m' iff m
and m' have the same Δ-part d(m) = ∏_{p|Δ} p^{v_p(m)}. For each class c the indicator e_c (e_{c,m} =
1 if m ∈ c, 0 otherwise) lies in H_R, the e_c are orthogonal idempotents, and H_R = ∏_c H_R e_c with
H_R e_c ≅ H_R|c, the ring of glued families on c. Hence for Δ > 1 (always the case for K ≠ Q, by
Minkowski) H_R has infinitely many orthogonal non-trivial idempotents and is NOT an integral domain.
The factor of the class of 1, H_R|Δ, IS an integral domain: f ↦ f_1 ∈ R[[x]] is injective on it and
R is a domain. More generally the factor of the class of d is a domain when K ∩ Q(ζ_d) = Q. It need
NOT be a domain otherwise: for K = Q(i), Δ = 4 the factor of the class of 4 contains the non-trivial
idempotent e with e_{4m'} = (1 − i^{m'} ⊗ ζ_4)/2 for m' odd. So GSWZ Remark 1.2's 'product of
integral domains indexed by the equivalence classes' is false as printed (source issue
HabiroNumberFields/E21).

**Hypotheses.**

- R = O_K[1/Δ]; R[ζ_m] = R ⊗ Z[ζ_m] (HB.6/coefficient-rings-and-frobenius), which is what allows
R[ζ_4] to split for K = Q(i).
- The domain statement for H_R|Δ uses that K ⊗ Q(ζ_m) is a field for (m, Δ) = 1: K and Q(ζ_m) are
linearly disjoint because their discriminants are coprime.
- Injectivity of f ↦ f_1 on a class uses that φ_p is bijective and rex is an automorphism, so f_m = 0
iff f_{pm} = 0 for p ∤ Δ.

**Prerequisites.** [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/the-substitution-exists](#HB-6-the-substitution-exists), `HabiroCyclotomicCompletions:HC.5/inverting-a-prime-and-the-rational-case`, `mathlib:NumberField.linearDisjoint_of_isGalois_isCoprime_discr`, `mathlib:NumberField.exists_not_isUnramifiedIn`.

**Proof route.**

1. The pairs (m, pm) with p ∤ Δ stay inside one class, and for p | Δ condition (13) is vacuous, so
every indicator e_c satisfies (13) and H_R = ∏_c H_R|c.
2. For Δ > 1 there are infinitely many classes (d = p^k, p | Δ); each H_R|c is non-zero (it contains
e_c), so H_R is not a domain. For K ≠ Q, Δ ≥ |disc K| > 1 (mathlib
NumberField.exists_not_isUnramifiedIn).
3. On a class, f_m = 0 implies f_{pm} = 0 and conversely (φ_p bijective, rex invertible), so f ↦ f_d is
injective on H_R|c for the minimal element d of c.
4. For c the class of 1: R[ζ_m] ⊂ K ⊗ Q(ζ_m), a field for (m,Δ) = 1 by mathlib
NumberField.linearDisjoint_of_isGalois_isCoprime_discr; so f ↦ f_1 ∈ R[[x]] embeds H_R|Δ in a
domain.
5. Counterexample to the printed remark: K = Q(i), Δ = 4, class of 4. e_{4m'} := (1 − i^{m'} ⊗ ζ_4)/2
is idempotent because (i^{m'} ⊗ ζ_4)^2 = 1 for m' odd, and (13) at odd p reads e_{m'} = φ_p(e_{pm'})
= (1 − i^{p^2 m'} ⊗ ζ_4)/2, true since p^2 ≡ 1 (mod 4). Checked by PARI for all odd p ≤ 97 and odd
m' ≤ 99 (scratch C/gp/idem.gp).

**Acceptance.**

- Δ = 1, K = Q: one class, and H_Z is a domain.
- K = Q, Δ = 2: classes {m : v_2(m) = k}, k ≥ 0; e_0 is GSWZ Example 5.7's element.
- K = Q(i), Δ = 4: H_R|4 is a domain; the factor of the class of 4 is not.

**Sources.** `GSWZ.HabiroNumberField.2024`, Remark 1.2, §1.4, p. 7 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.4, p. 6 (arXiv v2).

<a id="HB-6-abelian-fields"></a>

### Abelian fields: the embedding of R and the base-change description

`HabiroNumberFields:HB.6/abelian-fields` · theorem

Let K be abelian over Q and Δ divisible by disc(K). For p ∤ Δ, φ_p = Frob_p ⊗ id on R^_p = R ⊗ Z_p,
with Frob_p ∈ Gal(K/Q) the Artin symbol. For m ≥ 1 put φ_m := ∏_{p∤Δ} Frob_p^{v_p(m)} ∈ Gal(K/Q).
Then a ↦ (φ_m^{−1}(a))_m is an injective ring homomorphism R → H_R, making H_R an R-algebra, and it
induces a ring isomorphism H_{Z[1/Δ]} ⊗_Z R ≅ H_R, f ⊗ a ↦ (f_m φ_m^{−1}(a))_m. The formula printed
in GSWZ footnote 1, a ↦ (φ_m a)_m, does not land in H_R unless every φ_p has order ≤ 2: for K =
Q(ζ_5), Δ = 125, the family c_m = φ_m(ζ_5) has c_1 = ζ_5 and φ_2(c_2) = ζ_5^4, so (13) fails at
(p,m) = (2,1) (source issue HabiroNumberFields/E20).

**Hypotheses.**

- K ⊂ Q(ζ_N) with N the conductor; every p | N ramifies in K, so p ∤ Δ implies p ∤ N and Frob_p is
defined.
- The inverse is forced by (13): constants must satisfy c_m = φ_p(c_{pm}), i.e. c_{pm} =
φ_p^{−1}(c_m).
- The base-change isomorphism uses that R is free over Z[1/Δ] and that untwisted gluing is
coordinatewise in a basis.

**Prerequisites.** [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison](#HB-6-ring-operations-and-the-classical-comparison).

**Proof route.**

1. Identify φ_p with Frob_p ⊗ id: both lift x ↦ x^p on R/pR, so they agree by frobenius_unique
(HB.6/coefficient-rings-and-frobenius).
2. c_m := φ_m^{−1}(a) satisfies c_m = φ_p(c_{pm}) for p ∤ Δ because φ_{pm} = Frob_p φ_m; constants are
fixed by rex, so (13) holds. Additivity and multiplicativity are clear; injectivity from the
component m = 1.
3. Base change: for g ∈ H_R the family (φ_m(g_m))_m is untwisted-glued (φ's commute and fix ζ, x);
expand it in a Z[1/Δ]-basis a_1, ..., a_r of R to get elements of H_{Z[1/Δ]}; this inverts f ⊗ a ↦
(f_m φ_m^{−1}(a)).
4. Non-example for the printed formula: PARI check that ζ_5 ≠ φ_2(φ_2(ζ_5)) = ζ_5^4 and that
φ_2(φ_2^{−1}(ζ_5)) = ζ_5 (scratch C/gp/frob.gp); the corrected family glues for all tested (p, m).

**Acceptance.**

- K = Q(i), Δ = 4: the image of i is (i^{m_odd})_m, m_odd the odd part of m; it squares to −1 in H_R
(φ_m has order ≤ 2 here, so both formulas agree).
- K = Q(ζ_5), Δ = 125: the image of ζ_5 has component ζ_5^3 at m = 2 (φ_2^{−1}(ζ_5)), not ζ_5^2.
- H_R ≅ H_{Z[1/Δ]} ⊗_Z R; in particular H_R is free of rank [K : Q] over H_{Z[1/Δ]} for abelian K.

**Sources.** `GSWZ.HabiroNumberField.2024`, Footnote 1, §1.4, p. 6 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Footnote 1, §1.4, p. 6 (arXiv v2).

<a id="HB-6-what-is-not-true-of-this-ring"></a>

### What H_R does not have: constant scalars, a global Frobenius, a single residue field

`HabiroNumberFields:HB.6/what-is-not-true-of-this-ring` · comparison

Three tempting statements are false in general and are never used. (1) Constant families do not give
an R-algebra structure: the constant family (a)_m lies in H_R iff φ_p(a) = a for every p ∤ Δ, i.e.
iff a ∈ Z[1/Δ] (Chebotarev), so R[q] is not a subring of H_R when K ≠ Q; e.g. K = Q(i), Δ = 4: (i)_m
∉ H_R since φ_3(i) = −i. For K abelian the twisted embedding of HB.6/abelian-fields replaces it; for
general K no R-module structure on H_R is known (GSWZ §1.4). (2) The Frobenius φ_p is an
automorphism of R^_p but is not induced by an automorphism of K in general (Q(∛2), p = 5). (3)
p-adic statements keep the full cyclotomic coefficient algebra R^_p[ζ_m] = R^_p ⊗ Z[ζ_m], a finite
product of complete discrete valuation rings, or all of its finite étale factors; replacing it by
one factor (one prime of K above p, or one residue field) loses information: for K = Q(i), p = 5,
R^_5 ≅ Z_5 × Z_5 and an element of H_{R^_5} is a pair. The domain question is
HB.6/decomposition-into-classes.

**Hypotheses.**

- K ≠ Q for (1) and (2); for K = Q all three hold trivially.
- (1) uses Chebotarev density in the Galois closure only for the 'iff'; the non-example needs only
φ_3(i) = −i.
- (3) is the stage text's instruction, made concrete by the product decomposition of R^_p.

**Prerequisites.** [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/abelian-fields](#HB-6-abelian-fields), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring).

**Proof route.**

1. (1): constants are fixed by rex, so (13) for a constant family is a = φ_p(a) in R^_p for all p ∤ Δ;
if a ∉ Q some Frobenius moves it (Chebotarev); for Q(i) take p = 3.
2. (2): HB.6/coefficient-rings-and-frobenius, test frobenius_not_global.
3. (3): R^_p ≅ ∏_{𝔭|p} O_{K_𝔭} (HB.6/coefficient-rings-and-frobenius), so H_{R^_p} is the product of
the corresponding rings; a comparison through one factor is not injective when p is not inert.
4. Positive counterparts, each under its own hypothesis: HB.6/abelian-fields (abelian K),
HB.6/decomposition-into-classes (H_R|Δ is a domain).

**Acceptance.**

- (i)_m ∉ H_{Z[i][1/2]}; (a)_m ∈ H_R iff a ∈ Z[1/Δ].
- φ_5 ≠ id on the completion for Q(∛2) although Aut(Q(∛2)) = 1.
- For K = Q(i), p = 5 the projection of H_{R^_5} to one factor Z_5-part is not injective.

**Sources.** `GSWZ.HabiroNumberField.2024`, §4.1, p. 45 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.4, after Definition 1.1, p. 7 (arXiv v2).

## HB.7 — Local sections and global K₃-graded modules

The finite unit and local regulator define Kummer-line section data. The local section
has a unit constant, integral linear coefficient and rational higher coefficients, with
completed defect in (p/x)R̂_p[ζ_m][[x]]. Its span is a module and contains zero. The branch-one
half-shift first jet and its weighted integrality are proved before the local freeness
and extension-to-all-roots targets.

The global family set and multiplication come before effective additive descent. The
latter must supply finite projectivity, actual chart base changes and conservative
detection. Tensor bijectivity and the finite inverse-line certificate follow from that
specific descent result; Picard coherence uses the actual multiplication maps. Field
pullback, scalar extension, Galois transport and whole-series norms have exact full-factor
targets with separate arithmetic-naturality obligations.

The layer’s planets are [Invertible L_p(ξ)-sections](#HB-7-invertible-local-sections), [Free rank one local modules (Theorem 1)](#HB-7-local-freeness), [Habiro module H_{R,ξ}](#HB-7-the-global-module), [K₃-graded Picard character](#HB-7-followup-picard-character).

The following targets are ordered by their exact internal prerequisites.

<a id="HB-7-invertible-local-sections"></a>

### Invertible L_p(ξ)-sections, the formal completion and the local module

`HabiroNumberFields:HB.7/invertible-local-sections` · definition

Fix ξ ∈ K_3(K) and a prime p. For (m, p) = 1 let ε_m(ξ) ∈ K(ζ_m)^×/(K(ζ_m)^×)^m be the unit of HB.2
(ε_m = c_{ζ_m}^2), represented by an element that is a unit at the primes above p, and let
ε_m(ξ)^{1/m} be a chosen m-th root, living in the Kummer algebra K_p[ζ_m][T]/(T^m − ε_m(ξ)), K_p = K
⊗_Q Q_p = R^_p[1/p]. An INVERTIBLE L_p(ξ)-SECTION is a family f = (f_m(x))_{m≥1,(m,p)=1} with f_m(x)
∈ ε_m(ξ)^{1/m}·(R^_p[ζ_m]^× + x R^_p[ζ_m] + x^2 K_p[ζ_m][[x]]) — constant term ε_m(ξ)^{1/m} times a
unit of R^_p[ζ_m], linear coefficient integral, higher coefficients only in K_p[ζ_m]; this is the
shape of GSWZ (195) and the hypothesis of Dwork's lemma; Definition 1.3 prints x K_p[ζ_m][[x]] in
(20), which admits the non-integral L_p(0)-section ((1 + x/ζ_m)^{1/p})_m and makes Theorem 1 false
(source issue HabiroNumberFields/E24) — such that log(φ_p f̂(q^p)/f̂(q)^p) ∈ ∏_{(m,p)=1}
(p/x)·R^_p[ζ_m][[x]] (GSWZ (21): p divided by x, so a simple pole is allowed). Here φ_p is the
Frobenius of R^_p[ζ_m] with ζ_m ↦ ζ_m^p (extension (ii) of HB.6/coefficient-rings-and-frobenius),
f̂(q^p) at q = ζ_m + x is the expansion of f̂ at ζ_m^p evaluated at (ζ_m + x)^p − ζ_m^p, and the
FORMAL COMPLETION f̂ is defined by log f̂_m(x) = D_p(ξ)/(m^2 log q) + log f_m(x) ∈
x^{−1}K_p[ζ_m][[x]] (GSWZ (22)), with D_p : K_3(K_p) → K_p Coleman's p-adic dilogarithm in the
normalisation of PadicHodgeRegulators D.4 and log q = log(1 + x/ζ_m) (log ζ_m = 0). The LOCAL MODULE
H_{R^_p,ξ} is the H_{R^_p}-span of the invertible L_p(ξ)-sections, H_{R^_p} acting componentwise.
Condition (21) is the logarithmic form of the condition in Dwork's lemma (HB.7/dworks-lemma).

**Hypotheses.**

- No hypothesis on p or Δ in the definition; existence (Theorem 1) needs disc(K) | Δ, 6 | Δ and p ∤ Δ
(HB.7/local-freeness).
- The linear coefficient must be integral (shape (195)); with the printed shape (20) the family f_m =
(1 + x/ζ_m)^{1/p} has logarithmic Frobenius defect 0 but f_1 = 1 + x/p − 2x^2/p^2 + … ∉ Z_p[[x]]
(PARI, p = 5), so the span of the sections would not be free of rank one.
- The p/x in (21) is essential: whenever D_p(ξ) ≠ 0 the left side has x^{−1}-coefficient ζ_m(φ_p
D_p(ξ) − p^2 D_p(ξ))/(p m^2) ≠ 0 (φ_p preserves valuations, so φ_p(y) = p^2 y forces y = 0); with
'p·x' in place of 'p/x' no section would exist.
- The choices (the representative of ε_m(ξ) as a p-unit, its m-th root) change f_m by a unit of
R^_p[ζ_m] and a root of unity; H_{R^_p,ξ} does not depend on them (API item independent_of_choices).

**Prerequisites.** [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring), `PadicHodgeRegulators:D.4`, `PadicHodgeRegulators:D.1`.

**Proof route.**

1. Record the Kummer algebra and the shape condition on f_m.
2. Define log q and 1/log q ∈ x^{−1}K_p[ζ_m][[x]], and the formal completion (22).
3. Define the logarithmic Frobenius defect log(φ_p f̂(q^p)/f̂(q)^p) as a Laurent series over K_p[ζ_m]
and state (21).
4. Define H_{R^_p,ξ} as a span over H_{R^_p} (HB.6/the-p-completed-ring).
5. Independence of the choices: a p-unit u with ε' = ε u^m changes ε^{1/m} by u times a root of unity,
which preserves the shape set and changes the Frobenius defect by log(φ_p(u)/u^p) ∈ p·R^_p[ζ_m] (u
unit, φ_p(u) ≡ u^p mod p).

**Uses that determine the API.**

- GSWZ Definition 1.4: the local condition of H_{R,ξ} at p is membership in H_{R^_p,ξ}
- GSWZ Theorem 1 and §3.2: existence and freeness of H_{R^_p,ξ}
- HabiroNahmSeries HB.9: Theorem 5's local verification: the specialisation of (39) is (21) on a disc

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `KummerAlg` | data | K_p[ζ_m][T]/(T^m − ε_m(ξ)), containing ε_m(ξ)^{1/m} = T. |
| `formalCompletion` | data | f ↦ f̂, log f̂_m = D_p(ξ)/(m^2 log q) + log f_m. |
| `logFrobeniusDefect` | data | log(φ_p f̂(q^p)/f̂(q)^p) ∈ ∏_m K_p[ζ_m]((x)). |
| `IsInvertibleSection` | characterisation | Shape condition (20) and logFrobeniusDefect ∈ ∏ (p/x)R^_p[ζ_m][[x]]. |
| `localModule` | structure | H_{R^_p,ξ}, the H_{R^_p}-submodule spanned by invertible sections. |
| `IsInvertibleSection.mul` | relation | If f is an L_p(ξ)-section and g an L_p(ξ')-section then fg is an L_p(ξ + ξ')-section (ε multiplicative, D_p additive). |
| `IsInvertibleSection.one` | example | 1 is an invertible L_p(0)-section. |
| `independent_of_choices` | characterisation | localModule does not depend on the p-unit representative of ε_m(ξ) nor on the chosen m-th root. |

**Unit tests.**

- `one_is_section` (degenerate): For ξ = 0, the family f_m = 1 is an invertible L_p(0)-section for every prime p, and localModule 0 p = H_{R^_p} · 1.
- `pole_allowed` (non-example): If D_p(ξ) ≠ 0 then for every invertible section the x^{−1}-coefficient of the logarithmic Frobenius defect at m = 1 is (φ_p D_p(ξ) − p^2 D_p(ξ))/p ≠ 0; so the variant of (21) with target p·x·R^_p[[x]] has no solutions.
- `q_power_excluded` (non-example): K = Q, ξ = 0, p = 5: the family f_m = (1 + x/ζ_m)^{1/5} satisfies (21) with defect 0 but its linear coefficient 1/(5ζ_m) is not in Z_5[ζ_m], so it is not an invertible L_5(0)-section; under the printed shape (20) it would be one, and H_{Z^_5,0} would contain 1 and f, which are H_{Z^_5}-linearly independent.
- `shape_without_frobenius` (non-example): K = Q, ξ = 0, p = 5, m = 1: f_1 = 1 + x/5 has the printed shape (20), but log(f(q^5)/f(q)^5) = (8/5)x^2 + O(x^3) ∉ 5Z_5[[x]], so (21) fails.
- `mul_section` (characterisation): The product of an L_p(ξ)-section and an L_p(−ξ)-section is an L_p(0)-section, hence lies in H_{R^_p}^× (HB.7/dworks-lemma).

**Acceptance.**

- For ξ = 0 (ε_m = 1, D_p(0) = 0) the constant family 1 is an invertible L_p(0)-section and H_{R^_p,0}
= H_{R^_p}.
- The target of (21) is (p/x)R^_p[ζ_m][[x]], not p·x·R^_p[ζ_m][[x]].
- H_{R^_p,ξ} is independent of the permitted choices of ε_m(ξ) and of its m-th root.

**Sources.** `GSWZ.HabiroNumberField.2024`, Definition 1.3, (20)-(21), §1.5, p. 9 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Definition 1.3, (22), §1.5, p. 9 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, p. 8 (arXiv v2).

<a id="HB-7-dworks-lemma"></a>

### Dwork's lemma and its exponential corollary

`HabiroNumberFields:HB.7/dworks-lemma` · lemma

Let S be p-complete and p-torsion free with a Frobenius φ_p, p ∤ m, and φ_p(ζ_m) = ζ_m^p, φ_p(x) =
x. (Lemma 3.4) For f(x) ∈ 1 + xS[1/p, ζ_m][[x]]: f(x) ∈ 1 + xS[ζ_m][[x]] iff φ_p(f)((ζ_m + x)^p −
ζ_m^p)/f(x)^p ∈ 1 + p x S[ζ_m][[x]] and f(x) ∈ 1 + xS[ζ_m] + O(x^2). (Corollary 3.5) If g =
(g_m)_{(m,p)=1}, g_m ∈ S[1/p, ζ_m][[x]], satisfies φ_p g(q^p) − p g(q) ∈ ∏_{(m,p)=1} pS[ζ_m][[q −
ζ_m]], then f := exp(g) is well defined, and if f(ζ_m + x) ∈ (1 + pS[ζ_m]) + xS[ζ_m] + O(x^2) then f
∈ ∏_{(m,p)=1} S[ζ_m][[q − ζ_m]].

**Hypotheses.**

- S = R^_p for R = O_K[1/Δ], p ∤ Δ, in the applications; S[ζ_m] = S ⊗ Z[ζ_m].
- The Frobenius is extension (ii) of HB.6/coefficient-rings-and-frobenius (ζ_m ↦ ζ_m^p), not extension
(i).
- The proof uses the finite order s of φ_p on S[ζ_m] (equation (190)); S = R^_p satisfies this since
R^_p[ζ_m] is finite étale over Z_p.

**Prerequisites.** [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), `mathlib:PowerSeries.map`.

**Proof route.**

1. If the coefficients a_k are integral the quotient is ≡ 1 mod p (186).
2. Conversely compare coefficients in (187)-(188) to get a_n − ζ_m^{p−1} n p^{...}φ_p(a_n) ∈ S[ζ_m]
(189); average over the s-fold iterate of φ_p (190) and induct on n.
3. Corollary: (192) gives g_m(0) ∈ pS[ζ_m], so exp converges; (194) and Lemma 3.4 give integrality.

**Acceptance.**

- For f = 1 + px both sides hold; for f = 1 + x/p the quotient condition fails.
- The exponential of a Dwork-type logarithm with constant term in pS is integral.

**Sources.** `GSWZ.HabiroNumberField.2024`, Lemma 3.4, §3.2, p. 39 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Corollary 3.5, §3.2, p. 40 (arXiv v2).

<a id="HB-7-pochhammer-dwork-difference"></a>

### The Dwork-type difference of the infinite Pochhammer symbol

`HabiroNumberFields:HB.7/pochhammer-dwork-difference` · lemma

(Lemma 2.1) For every integer n and prime p, Li_n^{(p)}(t) := Σ_{k≥1, p∤k} t^k/k^n lies in Z[t,
1/(1−t)]^_p. (Proposition 2.2) (a) log(t^p; q^p)_∞ − p log(t; q)_∞ ∈ (p/x)·Z[t, 1/(1−t)]^_p[[x]] for
q = 1 + x. (b) For a root of unity ζ ∈ C_p ∖ {1} of order not a power of p, log(ζ^p; q^p)_∞ − p
log(ζ; q)_∞ ∈ p Li_2^{(p)}(ζ)/x + pZ_{(p)}[ζ][[x]], a meromorphic function on |x| < 1 with a simple
pole at x = 0 and the residue shown.

**Hypotheses.**

- Only the p-version Li_n^{(p)} as a formal power series is used, not Coleman's analytic continuation.
- Part (b) specialises (a) along t ↦ ζ, which is compatible with the Frobenius t ↦ t^p.

**Prerequisites.** `mathlib:PowerSeries.map`.

**Proof route.**

1. Lemma 2.1: 1/(r + pk) ∈ Z_p for 1 ≤ r ≤ p − 1; separate the sum over k prime to p into classes mod
p^N to get Li_n^{(p)} ≡ (1 − t^{p^N})^{−1} × polynomial (mod p^N) (53)-(54).
2. (a) from the expansion (48) of the difference, Lemma 2.1 and Z[t, 1/(1−t)]^_p[1/p] ∩ Z_{(p)}[[t]] ⊆
Z[t, 1/(1−t)]^_p (57).
3. (b) by the specialisation (58).

**Acceptance.**

- The residue at x = 0 in (b) is p Li_2^{(p)}(ζ).
- For ζ of order prime to p the difference has no other pole on |x| < 1.

**Sources.** `GSWZ.HabiroNumberField.2024`, Proposition 2.2, §2.1, p. 19 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Lemma 2.1, §2.1, p. 19 (arXiv v2).

<a id="HB-7-pochhammer-sections"></a>

### Explicit invertible sections from the infinite Pochhammer symbol

`HabiroNumberFields:HB.7/pochhammer-sections` · construction

Let p > 3 be unramified in K. For ζ ∈ μ(K_p) put Ψ_{[ζ],p,m}(x) := exp(−Li_2(ζ)/(m^2 log q))
ε_m([ζ])^{1/m} (q^{m/2}ζ; q^m)_∞^{1/m} for (m,p) = 1 and q = ζ_m + x, an element of ε_m([ζ])^{1/m}(1
+ xK_p[ζ_m][[x]]) (Definition 3.9). For ξ̂ = Σ_ζ a_ζ[ζ] ∈ K_3(K_p) ⊗ Z_p (a presentation of the
image of ξ ∈ K_3(K), which exists by Theorem 9, PadicHodgeRegulators D.3) put Ψ_{ξ̂,p} := ∏_ζ
Ψ_{[ζ],p}^{a_ζ}. Then Ψ_{ξ̂,p} is an invertible L_p(ξ̂)-section (Theorem 10), and its class in
H_{R^_p,ξ}^×/H_{R^_p}^× depends only on ξ̂, not on the presentation (Corollary 3.10).

**Hypotheses.**

- p > 3 unramified in K (p ∤ Δ with disc(K) | Δ and 6 | Δ).
- ξ̂ is in the image of K_3(K) → K_3(K_p; Z_p) ⊗ Z_p; the Z_p-exponents a_ζ are made sense of
p-adically.
- ε_m([ζ]) is the unit of HB.2 for the symbol [ζ]; D_p([ζ]) = Li_2(ζ) for ζ ∈ μ(K_p) with the
normalisation of D.4.
- With Definition 1.3 corrected to the shape (195), Theorem 10 also needs the linear coefficient of
Ψ_{[ζ],p,m} to be p-integral; the source's proof ('a slight variation of Proposition 2.2 … and
equation (56)') does not address it, so this is part of the gap on the proofs of Theorems 1 and 10.

**Prerequisites.** [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-dwork-difference](#HB-7-pochhammer-dwork-difference), [HabiroNumberFields:HB.7/dworks-lemma](#HB-7-dworks-lemma), `PadicHodgeRegulators:D.3`, `PadicHodgeRegulators:D.4`, `PadicHodgeRegulators:D.1`.

**Proof route.**

1. Define Ψ_{[ζ],p} and check the shape (207).
2. Theorem 10: combine HB.7/pochhammer-dwork-difference (b), with the factor q^{1/2}, and the level-m
decomposition (59) to verify (21).
3. Extend multiplicatively to Z_p-combinations using convergence of the p-adic powers.
4. Corollary 3.10: two presentations give sections whose quotient is an L_p(0)-section, hence in
H_{R^_p}^× (HB.7/dworks-lemma).

**Uses that determine the API.**

- GSWZ proof of Theorem 1: the existence of invertible sections
- GSWZ §1.5, abelian case: the global generator ∏(q^{1/2}ζ^j;q)_∞^{n_j} is compared with Theorem 10

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `pochhammerSection` | constructor | Ψ_{[ζ],p} for ζ ∈ μ(K_p). |
| `pochhammerSection.isInvertibleSection` | characterisation | Theorem 10 for [ζ]. |
| `pochhammerSectionOf` | constructor | Ψ_{ξ̂,p} = ∏ Ψ_{[ζ],p}^{a_ζ} for a presentation of ξ̂. |
| `pochhammerSectionOf_independent` | characterisation | Corollary 3.10. |

**Unit tests.**

- `empty_presentation` (degenerate): For the presentation with all a_ζ = 0, Ψ_{ξ̂,p} = 1, the invertible L_p(0)-section of HB.7/invertible-local-sections.
- `two_presentations` (characterisation): If Σ a_ζ[ζ] = Σ b_ζ[ζ] in K_3(K_p) ⊗ Z_p then ∏Ψ_{[ζ],p}^{a_ζ} / ∏Ψ_{[ζ],p}^{b_ζ} ∈ H_{R^_p}^× (Corollary 3.10).
- `shape_of_psi` (computation): The polar parts of exp(−Li_2(ζ)/(m^2 log q)) and of (q^{m/2}ζ; q^m)_∞^{1/m} cancel (by (47), the k = 0 term of log(t; q^m)_∞ is Li_2(t)/log(q^m)), so Ψ_{[ζ],p,m} is a power series with constant term ε_m([ζ])^{1/m} times a unit.
- `small_primes_excluded` (non-example): For p = 3, and for p ramified in K, Theorem 10 is not claimed; the construction requires p > 3 unramified.

**Acceptance.**

- Ψ_{[ζ],p} is an L_p([ζ])-section for p > 3 unramified.
- The class of Ψ_{ξ̂,p} modulo H_{R^_p}^× is independent of the presentation.

**Sources.** `GSWZ.HabiroNumberField.2024`, Definition 3.9, §3.2, p. 42 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Theorem 10, §3.2, p. 42 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Corollary 3.10, §3.2, p. 43 (arXiv v2).

<a id="HB-7-local-freeness"></a>

### Invertible sections exist and the local modules are free of rank one (Theorem 1)

`HabiroNumberFields:HB.7/local-freeness` · theorem

Let K be a number field and Δ divisible by disc(K) and by 6. For ξ ∈ K_3(K) and every prime p ∤ Δ,
invertible L_p(ξ)-sections exist, and H_{R^_p,ξ} is a FREE H_{R^_p}-module of rank one, generated by
any invertible L_p(ξ)-section.

**Hypotheses.**

- 6 | Δ excludes p = 2, 3, where Lemma 3.6 and the regulator theorem fail (Remark 1.8).
- Definition 1.3 is read with the shape (195) (linear coefficient integral); with the printed shape
(20) the theorem is false already for ξ = 0 (HB.7/invertible-local-sections, test q_power_excluded).
- p ∤ Δ makes p unramified and p > 3.
- The statement is local at p; no global freeness follows (HB.7/what-the-local-picture-does-not-give).

**Prerequisites.** [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections), [HabiroNumberFields:HB.7/dworks-lemma](#HB-7-dworks-lemma), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring), `PadicHodgeRegulators:D.3`.

**Proof route.**

1. Existence: HB.7/pochhammer-sections gives Ψ_{ξ̂,p} (Theorem 10 with Theorem 9 of D.3), alternatively
the telescoping construction (209)-(210).
2. Freeness: if f, g are invertible L_p(ξ)-sections then h = g/f is an invertible L_p(0)-section with
integral linear coefficient; its logarithmic Frobenius defect is a power series lying in
(p/x)R^_p[ζ_m][[x]], hence in pR^_p[ζ_m][[x]]; after multiplying by the constant unit family
(h_m(0)^{−1})_m ∈ H_{R^_p}^×, HB.7/dworks-lemma (Corollary 3.5) gives h, h^{−1} ∈ H_{R^_p}. So every
section is a unit multiple of f, and the span is H_{R^_p}·f, free because every f_m is invertible in
the Kummer algebra over K_p[ζ_m][[x]].

**Acceptance.**

- ξ = 0: H_{R^_p,0} = H_{R^_p}, generated by 1.
- The rank is one and the module is free, for every p ∤ Δ.
- Nothing is claimed for p | 6.

**Sources.** `GSWZ.HabiroNumberField.2024`, Theorem 1, §1.5, p. 9 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §3.2, p. 42 (arXiv v2).

<a id="HB-7-extension-to-all-roots"></a>

### Extending an invertible section to all roots of unity

`HabiroNumberFields:HB.7/extension-to-all-roots` · lemma

(Lemma 3.6) Fix p, ξ and a family f = (f_m)_{m≥1} with f_m ∈ ε_m(ξ)^{1/m}(R^_p[ζ_m]^× + xR^_p[ζ_m] +
x^2K_p[ζ_m][[x]]) satisfying φ_p f̂(q^p)/f̂(q)^p ∈ ∏_{(m,p)=1} exp((p/x)R^_p[ζ_m][[x]]). Then for
each m prime to p there is a unique β_m ∈ Z_p such that f̃_{mp^d}(x) := ζ_{p^d}^{β_m} f_{mp^d}(x)
satisfies f̃(q^σ)/f̃(q)^{σ^{−1}} ∈ ∏_{(m,p)=1} R^_p[ζ_m][[x]] for all σ ∈ Z_p^×. (Corollary 3.7) An
invertible L_p(ξ)-section has a unique extension to all roots of unity satisfying these integrality
and gluing conditions.

**Hypotheses.**

- p ≠ 2, 3: the proof needs a root of unity ω ∈ Z_p^× with ω − ω^{−1} ∈ Z_p^×, equivalently some γ
prime to p with γ^2 − 1 prime to p.
- Used in the proof of Theorem 2 (H_{R,0} = H_R).

**Prerequisites.** [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/dworks-lemma](#HB-7-dworks-lemma).

**Proof route.**

1. Compare f(q^σ) with f(q)^σ using (198) and Dwork's lemma, inductively on d.
2. The cocycle α_{σσ'} = σ'α_σ + σ^{−1}α_{σ'} (201) has the unique solution α_σ = (σ − σ^{−1})α_ω/(ω −
ω^{−1}) (202); β_m = −α_ω/(ω − ω^{−1}).

**Acceptance.**

- For p = 2 or 3 there is no σ = γ with γ^2 − 1 prime to p (γ odd ⇒ 8 | γ^2 − 1; 3 ∤ γ ⇒ 3 | γ^2 − 1);
for p ≥ 5, γ = 2 works.
- The extension of the constant section 1 (ξ = 0) is the constant family 1.

**Sources.** `GSWZ.HabiroNumberField.2024`, Corollary 3.7, §3.2, p. 41 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, after Definition 1.4, p. 10 (arXiv v2).

<a id="HB-7-the-global-module"></a>

### The Habiro module H_{R,ξ} of a class in K₃(K)

`HabiroNumberFields:HB.7/the-global-module` · definition

Fix ξ ∈ K_3(K). The set H_{R,ξ}, equipped with its H_R-module structure by
followup-effective-global-descent, consists of the families f = (f_m(x))_{m≥1} with f_m(x) ∈
ε_m(ξ)^{1/m}·K[ζ_m][[x]] (rational coefficients; integrality comes only from the conditions) such
that (1) for every prime p ∤ Δ, the image of (f_m)_{(m,p)=1} under K → K_p LIES IN THE LOCAL MODULE
H_{R^_p,ξ} (the span of the invertible sections — elements of H_{R,ξ} need not be invertible
sections, e.g. 0 and p·f), and (2) for every γ ∈ Z_{>0}, the PRODUCT f(q^γ)^γ · f(q^{−1}) lies in
the restricted ring H_{R[1/γ]}|γ of the LOCALISATION R[1/γ] (GSWZ (24)). Here f(q^γ) and f(q^{−1})
at q = ζ_m + x, (m, γ) = 1, are the expansions of f at ζ_m^γ and ζ_m^{−1}; they are defined up to
the choice of m-th roots of the Galois-conjugate units, and the χ^{−1}-equivariance of ε_m
(σ_γ(ε_m(ξ))^γ/ε_m(ξ) is canonically an m-th power) makes the product in (24) independent of these
choices. The condition (24) needs no meaning for ξ/γ; that issue concerns the separate operation γ*
(HB.7/operations-on-the-modules). H_R acts componentwise and preserves both conditions; closure
under ADDITION is not routine, because (24) is not additive in f, and it is the target of
HB.7/followup-effective-global-descent. For γ ≥ 1 the restricted module H_{R,ξ}|γ uses only orders
prime to γ; H_{R,ξ}|Δ is the target of GSWZ Theorem 5.

**Hypotheses.**

- disc(K) | Δ and 6 | Δ. The local condition is imposed for every prime p ∤ Δ; for p | Δ, R^_p = 0 and
GSWZ's identification K_p = R^_p[1/p] = K ⊗ Q_p (19) fails (the left side is 0), so the condition
must be read as void there (Definition 1.4 leaves p unquantified; source issue
HabiroNumberFields/E28). p = 2, 3 are inverted so that (24) determines the local gluing
(HB.7/extension-to-all-roots).
- ε_m(ξ) and the χ^{−1}-equivariance datum are HB.2's exported interface; D_p(ξ) enters only through
the local condition.
- H_{R,ξ}|Δ in GSWZ §1.7 is printed as satisfying '(13)'; the intended conditions are those of
Definition 1.4 on orders prime to Δ (source issue HabiroNumberFields/E25).

**Prerequisites.** [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface), `ArithmeticKTheory:N.5/soule-theorem`.

**Proof route.**

1. Define the ambient ∏_m ε_m(ξ)^{1/m}K[ζ_m][[x]] inside ∏_m KummerAlg_m[[x]].
2. State the local condition through K[ζ_m] → K_p[ζ_m] and HB.7/invertible-local-sections.
3. Define the expansions f(q^γ), f(q^{−1}) and state (24) in H_{R[1/γ]}|γ (HB.6/the-gluing-condition
for the ring R[1/γ]).
4. Show independence of the choices of m-th roots of the conjugate units, using χ^{−1}-equivariance.
5. Check stability under multiplication by H_R: the local condition because H_R → H_{R^_p}, and (24)
because (af)(q^γ)^γ(af)(q^{−1}) = a(q^γ)^γ a(q^{−1})·f(q^γ)^γ f(q^{−1}) with the first factor in
H_{R[1/γ]}|γ. Additive closure is the precise target HB.7/followup-effective-global-descent.

**Uses that determine the API.**

- GSWZ Theorem 2 and Proposition 1.5: multiplication, τ, γ*, constant terms
- HabiroNahmSeries HB.9 (GSWZ Theorem 5): f_{A,z} ∈ H_{R[δ^{−1/2}],ξ}|Δ
- HabiroRings:HR.6/the-module-interfaces: imports the modules

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `HabiroModule` | structure | H_{R,ξ} as an H_R-submodule of ∏_m KummerAlg_m[[x]]. |
| `HabiroModule.mem_iff` | characterisation | Shape, local condition at every p, and (24) for every γ. |
| `HabiroModule.expandAt` | data | The expansion of f at ζ_m^γ, defined with the χ^{−1}-equivariance datum. |
| `HabiroModule.gluing_independent_of_roots` | characterisation | The element f(q^γ)^γ f(q^{−1}) does not depend on the choices of m-th roots. |
| `HabiroModule.restrict` | functoriality | H_{R,ξ} → H_{R,ξ}\|γ, with H_{R,ξ}\|Δ the target of Theorem 5. |
| `HabiroModule.toLocal` | projection | H_{R,ξ} → H_{R^_p,ξ}, f ↦ (f_m)_{(m,p)=1}. |

**Unit tests.**

- `zero_class` (degenerate): ξ = 0: ε_m = 1 and H_{R,0} = H_R as subsets of ∏ K[ζ_m][[x]] (Theorem 2).
- `product_not_ratio` (non-example): For ξ = 0 and f = 1 − q ∈ H_Z, f(q^2)^2 f(q^{−1}) = (1 − q^2)^2(1 − q^{−1}) ∈ Z[q^{±1}] ⊂ H_{Z[1/2]}|2; the condition is a product, and the ring is that of R[1/2], not of the quotient R/2R.
- `small_primes` (computation): For p = 2 no γ ≥ 1 prime to 2 has γ^2 − 1 prime to 2, and for p = 3 none prime to 3 has γ^2 − 1 prime to 3; for p ≥ 5, γ = 2 does (γ^2 − 1 = 3).
- `local_span_not_sections` (characterisation): If f ∈ H_{R,ξ} then p·f ∈ H_{R,ξ} and 0 ∈ H_{R,ξ}, although p·f and 0 are not invertible L_p(ξ)-sections.

**Acceptance.**

- The local condition is membership in the span H_{R^_p,ξ}, so H_{R,ξ} is an H_R-submodule containing
0.
- Condition (24) is a product condition in H_{R[1/γ]}|γ.
- For ξ = 0, H_{R,0} = H_R (HB.7/the-ring-case-and-tensor-products).

**Sources.** `GSWZ.HabiroNumberField.2024`, Definition 1.4, (23)-(24), §1.5, p. 10 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, after Definition 1.4, p. 10 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, p. 8 (arXiv v2).

<a id="HB-7-the-ring-case-and-tensor-products"></a>

### The ring case and multiplication of global families

`HabiroNumberFields:HB.7/the-ring-case-and-tensor-products` · theorem

Under HB.7’s corrected local shape, H_{R,0}=H_R as sets of full rational families. Multiplication of
families sends H_{R,ξ}×H_{R,η} to H_{R,ξ+η}, using the actual multiplicative Kummer-line
identifications, additivity of D_p and multiplicativity of ε_m and the global condition. Once
HB.7/followup-effective-global-descent supplies additive closure, this same map is H_R-bilinear. The
tensor isomorphism, inverse-line certificate and Picard character are the separate exact targets
followup-tensor-bijectivity and followup-picard-character; this node provides only the ring-case and
multiplication input to them.

**Hypotheses.**

- Δ is positive and divisible by 6 and |disc K|.
- Use the exact root-line identifications of HB.2/the-exported-interface, not arbitrary maps between
Kummer algebras.
- The module structure and global tensor conclusions require G-global-descent; they are not
consequences of local freeness alone.

**Prerequisites.** [HabiroNumberFields:HB.7/the-global-module](#HB-7-the-global-module), [HabiroNumberFields:HB.7/extension-to-all-roots](#HB-7-extension-to-all-roots), [HabiroNumberFields:HB.7/local-freeness](#HB-7-local-freeness), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring).

**Proof route.**

1. (1) ⊇: f ∈ H_R lies in H_{R^_p} = H_{R^_p,0} for every p, and f(q^γ)^γ f(q^{−1}) ∈ H_{R[1/γ]}|γ
because H_R is stable under q ↦ q^γ (into H_{R[1/γ]}|γ) and q ↦ q^{−1}.
2. (1) ⊆: for f ∈ H_{R,0} and p ∤ Δ, the local condition and Corollary 3.7 with (24) give f ∈ H_{R^_p}
on all orders; then mem_habiroRing_iff_twist and mem_families_of_forall_padic of
HB.6/the-p-completed-ring give f ∈ H_R.
3. (2) the map: ε_m is multiplicative and D_p additive, so (21), the shape condition and (24) are
multiplicative (HB.7/invertible-local-sections, IsInvertibleSection.mul).

**Acceptance.**

- H_{R,0}=H_R on all orders.
- Actual family multiplication preserves the grade, local sections and the global condition.
- Additive closure, tensor bijectivity and Picard invertibility are discharged through the named
descent and tensor refinements.

**Sources.** `GSWZ.HabiroNumberField.2024`, Theorem 2, §1.5, p. 10 (arXiv v2); `GSWZ.HabiroNumberField.2024`, Proof of Theorem 2, §3.3, p. 43 (arXiv v2).

<a id="HB-7-operations-on-the-modules"></a>

### The operations γ* and τ, restriction of orders, and what GSWZ does not prove

`HabiroNumberFields:HB.7/operations-on-the-modules` · construction

For γ ∈ Z ∖ {0} the operation γ* on P_R is (γ*f)(q) := f(q^γ): at q = ζ_m + x its component is the
expansion of f at ζ_m^γ evaluated at (ζ_m + x)^γ − ζ_m^γ, a power series with zero constant term, so
this is an honest substitution (Mathlib's PowerSeries.subst applies). τ := (−1)* is f(q) ↦
f(q^{−1}). Proven properties (GSWZ Proposition 1.5): (a) f ∈ H_{R,ξ} ⇒ τf ∈ H_{R,−ξ}; (c) (γγ')*f =
γ*(γ'*f) for f ∈ P_R; (d) f ∈ H_{R,ξ}, γ > 0 ⇒ (γ*f)^γ ∈ H_{R[1/γ],ξ}|γ. The source states that γ*f
'behaves like' an element of H_{R[1/γ],ξ/γ}|γ but does not define ξ/γ; no such statement is made
here. Restriction of orders H_{R,ξ} → H_{R,ξ}|γ is HB.7/the-global-module's. Multiplication is
HB.7/the-ring-case-and-tensor-products. EXTENSION OF SCALARS along a finite étale R → R', a GALOIS
ACTION on the modules, and compatibility of the Frobenius gluing with the K_3 TRANSFER are asked for
by the stage text but are NOT stated or proved in GSWZ; they are recorded as a gap, not claimed.

**Hypotheses.**

- (a) and (d) use the χ^{−1}-equivariance of ε_m; (c) is formal.
- Only γ with the stated signs and the localisation R[1/γ] are covered.
- No hypothesis-free scalar extension, Galois action or transfer compatibility is asserted.

**Prerequisites.** [HabiroNumberFields:HB.7/the-global-module](#HB-7-the-global-module), [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface), `mathlib:PowerSeries.subst`.

**Proof route.**

1. Define γ* componentwise through the Galois action σ_γ on R[ζ_m] (ζ_m ↦ ζ_m^γ) and substitution of
(ζ_m + x)^γ − ζ_m^γ; define τ.
2. (c) from the definition.
3. (a) and (d) from χ^{−1}-equivariance: the constant terms of τf and (γ*f)^γ carry ε_m(ξ)^{−1/m} and
ε_m(ξ)^{1/m} up to canonical m-th powers, and conditions (21), (24) transform accordingly.
4. Record the three operations the source does not treat as a gap.

**Uses that determine the API.**

- GSWZ Definition 1.4: (24) is stated with f(q^γ) and f(q^{−1})
- GSWZ Corollary 1.11(a): f_{A,z}(q) f_{A,z}(q^{−1}) ∈ H_R
- GSWZ Remark 1.6: τ is orientation reversal for quantum invariants

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `gammaStar` | data | γ* : P_R → P_R (ring homomorphism), γ ≠ 0. |
| `gammaStar_mul` | functoriality | (γγ')* = γ* ∘ γ'*, 1* = id. |
| `tau` | data | τ = (−1)*, an involution. |
| `tau_mem` | relation | τ(H_{R,ξ}) ⊆ H_{R,−ξ} (Proposition 1.5(a)). |
| `gammaStar_pow_mem` | relation | (γ*f)^γ ∈ H_{R[1/γ],ξ}\|γ for f ∈ H_{R,ξ}, γ > 0 (Proposition 1.5(d)). |
| `gammaStar_habiroRing` | compatibility | γ* maps H_R into H_{R[1/γ]}\|γ and τ preserves H_R. |

**Unit tests.**

- `tau_involution` (characterisation): τ(τ f) = f for f ∈ P_R.
- `gammaStar_polynomial` (computation): K = Q: for f = 1 − q, 2*f = 1 − q^2, whose component at m = 1 is −2x − x^2 and at m = 3 (x = q − ζ_3) is 1 − ζ_3^2 − 2ζ_3 x − x^2.
- `tau_ring_case` (degenerate): ξ = 0: τ maps H_R to H_R; τ(Σ(q;q)_n) = Σ(q^{−1};q^{−1})_n has component at m = 1 equal to f_1(−x/(1 + x)).
- `xi_over_gamma_not_defined` (non-example): γ*f is not asserted to lie in any module H_{R[1/γ],ξ'}|γ: only (γ*f)^γ ∈ H_{R[1/γ],ξ}|γ is proved.

**Acceptance.**

- τ is an involution of P_R mapping H_{R,ξ} to H_{R,−ξ}.
- (γγ')* = γ* ∘ γ'* on P_R.
- (γ*f)^γ ∈ H_{R[1/γ],ξ}|γ for f ∈ H_{R,ξ}.
- Scalar extension, Galois action and transfer compatibility are not claimed.

**Sources.** `GSWZ.HabiroNumberField.2024`, Proposition 1.5 (a), (c), (d), §1.5, p. 11 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, after Definition 1.4, p. 10 (arXiv v2).

<a id="HB-7-involution-pairing"></a>

### f·τg lies in the ring, and any two elements are proportional

`HabiroNumberFields:HB.7/involution-pairing` · lemma

(Proposition 1.5(b)) If f, g ∈ H_{R,ξ} then f·τg ∈ H_R, and there exist a, b ∈ H_R with af = bg.

**Hypotheses.**

- Uses Theorem 2 (HB.7/the-ring-case-and-tensor-products) for the second statement; the first needs
only the multiplication map and (a).

**Prerequisites.** [HabiroNumberFields:HB.7/operations-on-the-modules](#HB-7-operations-on-the-modules), [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](#HB-7-the-ring-case-and-tensor-products).

**Proof route.**

1. f·τg ∈ H_{R,ξ−ξ} = H_{R,0} = H_R by (a), the multiplication map and Theorem 2 (1).
2. Take a = g·τg and b = f·τg, both in H_R by the first part; then af = g·τg·f = f·τg·g = bg.

**Acceptance.**

- For ξ = 0, f·τg ∈ H_R for f, g ∈ H_R.
- The proportionality uses only (1) of Theorem 2 and the multiplication map.

**Sources.** `GSWZ.HabiroNumberField.2024`, Proposition 1.5 (b), §1.5, p. 11 (arXiv v2).

<a id="HB-7-vanishing-propagates"></a>

### A vanishing component forces vanishing along the prime chain

`HabiroNumberFields:HB.7/vanishing-propagates` · lemma

(Proposition 1.5(e)) If f ∈ H_{R,ξ}, m ≥ 1 and f_m(x) = 0, then f_{pm}(x) = 0 for every prime p ∤ Δ.

**Hypotheses.**

- p ∤ Δ; for ξ = 0 this is the injectivity along a class of HB.6/decomposition-into-classes.

**Prerequisites.** [HabiroNumberFields:HB.7/the-global-module](#HB-7-the-global-module), [HabiroNumberFields:HB.7/extension-to-all-roots](#HB-7-extension-to-all-roots).

**Proof route.**

1. Vary γ, γ' in the combinations f(q^{γ_1})⋯f(q^{−γ'_{n'}}) with Σγ_k^{−1} = Σγ'^{−1}_k, which lie in
the ring and determine f (§3.3); alternatively use Corollary 3.7.

**Acceptance.**

- ξ = 0: f ∈ H_R with f_1 = 0 has f_p = 0 for p ∤ Δ.
- Nothing is claimed for p | Δ: for K = Q, Δ = 2 the idempotent of Example 5.7 has f_1 = 1, f_2 = 0.

**Sources.** `GSWZ.HabiroNumberField.2024`, Proposition 1.5 (e), §1.5, p. 11 (arXiv v2).

<a id="HB-7-constant-terms"></a>

### Evaluation: constant terms lie in R[ζ_m, ε_m^{1/m}] for orders prime to Δ

`HabiroNumberFields:HB.7/constant-terms` · lemma

(Proposition 1.5(f)) If f ∈ H_{R,ξ} then f_m(0) ∈ R[ζ_m, ε_m(ξ)^{1/m}] for every m with (m, Δ) = 1.
For ξ = 0 this is the evaluation H_R → R[ζ_m], valid for every m. For ξ ≠ 0 the value does NOT lie
in R[ζ_m] in general, and for (m, Δ) ≠ 1 only f_m(0) ∈ ε_m(ξ)^{1/m}K[ζ_m] is known.

**Hypotheses.**

- (m, Δ) = 1; the local constants f_m(0) ∈ R^_p[ζ_m, ε_m^{1/m}] for all p with (mp, Δ) = 1 are
combined.

**Prerequisites.** [HabiroNumberFields:HB.7/the-global-module](#HB-7-the-global-module), [HabiroNumberFields:HB.7/extension-to-all-roots](#HB-7-extension-to-all-roots), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring).

**Proof route.**

1. For each p ∤ mΔ, the local condition and the shape of the sections give f_m(0) ∈ ε_m^{1/m}R^_p[ζ_m];
for p | m, p ∤ Δ, use the extension of Corollary 3.7 (HB.7/extension-to-all-roots); intersect over
all p ∤ Δ (as in mem_families_of_forall_padic).

**Acceptance.**

- ξ = 0: evaluation lands in R[ζ_m].
- GSWZ Corollary 1.10 is this lemma applied to Theorem 5.

**Sources.** `GSWZ.HabiroNumberField.2024`, Proposition 1.5 (f), §1.5, p. 11 (arXiv v2).

<a id="HB-7-followup-effective-global-descent"></a>

### Effective descent of the indexed global lines

`HabiroNumberFields:HB.7/followup-effective-global-descent` · theorem

For a number field F, Δ divisible by 6 and |disc F|, R=O_F[1/Δ], and ξ∈K₃(F), the set of Definition
1.4 with corrected local sections is an additive H_R-submodule of the rational Kummer family. Its
maps to p-completed local modules and to each rational cyclotomic Kummer line identify the
corresponding base changes with those lines. It is a finite projective H_R-module of constant rank
one, and these charts detect zero modules and equivalences for the modules and tensor products used
here. This is the required effective descent theorem; its proof is a recorded gap, not a new
assertion that arbitrary intersections of locally free modules are projective.

**Hypotheses.**

- Full root-order family, every p∤Δ, and the exact nonlinear product (24); no restriction to orders
prime to Δ unless expressly indicated.
- The local module is the span of invertible sections; global elements may be zero or non-generators.
- The chart maps and their Kummer/Frobenius transition isomorphisms must be constructed. Local
generators are not assumed to be global sections.

**Prerequisites.** [HabiroNumberFields:HB.7/the-global-module](#HB-7-the-global-module), [HabiroNumberFields:HB.7/local-freeness](#HB-7-local-freeness), [HabiroNumberFields:HB.7/extension-to-all-roots](#HB-7-extension-to-all-roots), [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](#HB-7-the-ring-case-and-tensor-products), [HabiroNumberFields:HB.6/the-p-completed-ring](#HB-6-the-p-completed-ring), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface).

**Proof route.**

1. Construct a LINEAR descent datum from the rational Kummer lines and the p-adic lines of Theorem 1,
extended by Corollary 3.7.
2. Prove its equalizer equals the set cut out by (23)-(24), including addition, not merely
multiplication.
3. Establish effective descent with finite presentation and projectivity; either give a genuine
faithfully flat affine cover and cocycle or a proved arithmetic patching theorem applicable to this
exact diagram.
4. Prove the base-change identifications and conservativity; mere set-theoretic intersection in the
adelic product does not suffice. These are the unresolved input recorded in gap G-global-descent.

**Acceptance.**

- A finite dual-basis certificate can be extracted; in particular the inverse-line pairing admits a
finite sum of products equal to 1.
- Tensoring with each chart gives the actual local/rational line, not only an injective map into it.
- No assumption of global freeness or a single global generator.

**Sources.** `GSWZ.HB7.v2`, Definition 1.4 (23)-(24), pp.10-11; §3.3, proof of Theorem 2, p.43; `GSWZ.HB7.v2`, §1.4, (15), p.7.

<a id="HB-7-followup-tensor-bijectivity"></a>

### Bijectivity of global tensor multiplication

`HabiroNumberFields:HB.7/followup-tensor-bijectivity` · theorem

Under the hypotheses and once the effective-descent target is proved, multiplication
μ_{ξ,η}:H_{R,ξ}⊗_{H_R}H_{R,η}→H_{R,ξ+η} is bijective and defines a canonical linear equivalence. The
source target is for every ξ,η; it remains conditional on the explicit descent gap. In particular
μ_{ξ,−ξ} followed by H_{R,0}=H_R yields an inverse-line equivalence, and finite f_i∈H_{R,ξ},
g_i∈H_{R,−ξ} satisfy Σ f_i g_i=1.

**Hypotheses.**

- Same F,R,Δ as effective-global-descent.
- Use the actual multiplication map of the packet and its unit identification; no arbitrary chosen
isomorphism is substituted.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent), [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](#HB-7-the-ring-case-and-tensor-products), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface).

**Proof route.**

1. After p-completed base change, chosen invertible sections for ξ and η multiply to an invertible
section for ξ+η; maps between these free rank-one modules are isomorphisms.
2. After each rational cyclotomic base change, tensor multiplication of Kummer lines is an isomorphism
by HB.2 multiplicativity.
3. Use the proven chart base-change identities and conservativity of effective-global-descent to kill
kernel and cokernel of μ.
4. For η=−ξ, expand μ^{-1}(1) as a finite sum of pure tensors. This is precisely the global assertion
absent from the printed proof.

**Acceptance.**

- Both injectivity and surjectivity are proved, including ξ or η zero.
- A local section is never promoted to a global element without descent.
- The ξ=−η test produces a finite sum, not a claimed global generator.

**Sources.** `GSWZ.HB7.v2`, Theorem 2 (25)-(26), pp.10-11; proof in §3.3, p.43.

<a id="HB-7-followup-picard-character"></a>

### Picard character and tensor powers

`HabiroNumberFields:HB.7/followup-picard-character` · construction

Once tensor-bijectivity is proved, define k3PicardMap:K₃(F)→Additive(Pic(H_R)) by ξ↦[H_{R,ξ}]. Equip
H_{R,ξ} with the existing Module.Invertible using μ_{ξ,−ξ} and H_{R,0}=H_R. The map is additive, its
negative is the inverse line, and H_{R,ξ}^{⊗ n}≅H_{R,nξ} for n≥0 via iterated actual multiplication.
Module-level unit, associativity and symmetry are induced by multiplication of families, so the
construction retains actual line representatives; it is not a claim of freeness.

**Hypotheses.**

- The zero and tensor linear equivalences are the conclusions of the ring case and followup
tensor-bijectivity. This construction is conditional until those proof inputs are discharged.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-tensor-bijectivity](#HB-7-followup-tensor-bijectivity), `mathlib:Module.Invertible.left`, `mathlib:CommRing.Pic.mk`, `mathlib:CommRing.Pic.mk_tensor`, `mathlib:CommRing.Pic.mk_self`, `mathlib:CommRing.Pic.mk_eq_mk_iff`.

**Proof route.**

1. Apply Module.Invertible.left to H_{R,ξ}⊗H_{R,−ξ}≃H_R; use CommRing.Pic.mk.
2. Use Pic.mk_eq_mk_iff to transport the actual tensor and unit linear equivalences to class
equalities; then Pic.mk_tensor proves addition and Pic.mk_self proves the zero case.
3. Iterate multiplication for powers, with the zero-fold tensor H_R; prove independence of
parenthesization by equality on pure tensors.
4. Prove unit/associativity/symmetry diagrams by associativity and commutativity of the ambient family
multiplication.

**Uses that determine the API.**

- GSWZ Theorem 2 (26): Exports the Picard character and actual tensor/power comparison.
- HabiroRings:HR.6: Provides the actual indexed lines for its cohomological Picard comparison; HR.6 is
a consumer, not a prerequisite.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `k3PicardMap` | constructor | The additive Picard character using the actual line modules. |
| `k3PicardMap_apply` | projection | The value is Additive.ofMul(Pic.mk H_R H_{R,ξ}). |
| `k3PicardMap_zero` | simp | Zero maps to the identity Picard class. |
| `k3PicardMap_add` | compatibility | The class of ξ+η is the tensor product of the two classes. |
| `k3PicardMap_neg` | simp | The class of −ξ is the inverse class. |
| `HabiroModule.tensorPowerEquiv` | equivalence | The n-fold tensor power is canonically H_{R,nξ}, including n=0. |
| `HabiroModule.tensorCoherence` | compatibility | Unit, associativity and symmetry diagrams agree with multiplication on pure tensors. |

**Unit tests.**

- `k3PicardMap_zero_test` (degenerate): ξ=0 gives the free rank-one ring module and the zero of Additive(Pic).
- `k3PicardMap_inverse_test` (compatibility): The classes of ξ and −ξ add to zero.
- `k3PicardMap_power_test` (compatibility): The value at ξ is the actual Mathlib Pic.mk class; when this class is nontrivial the character value is nonzero. The n=2 tensor square has the class of 2ξ, and n=0 gives the unit.

**Acceptance.**

- The Picard group and invertible-module theory are imported from Mathlib, never defined again.
- The inverse tensor test is a finite sum of products; no chosen unit section of H_{R,ξ} is part of
the input.

**Sources.** `GSWZ.HB7.v2`, Theorem 2 (25)-(26), pp.10-11; proof in §3.3, p.43.

<a id="HB-7-what-the-local-picture-does-not-give"></a>

### Invertible does not mean free, and multiplication by an element need not be an isomorphism

`HabiroNumberFields:HB.7/what-the-local-picture-does-not-give` · comparison

The local modules H_{R^_p,ξ} are FREE of rank one (Theorem 1) and, once
followup-effective-global-descent and followup-tensor-bijectivity are proved, the global modules are
invertible (rank one, locally free), and the tensor multiplication H_{R,ξ} ⊗ H_{R,ξ'} → H_{R,ξ+ξ'}
is an isomorphism. Two things do NOT follow: (1) H_{R,ξ} need not be free (GSWZ: 'not necessarily
free'); the source asserts freeness in the abelian case for ξ = Σ n_j[ζ^j] Galois-invariant, with
generator ∏_j (q^{1/2}ζ^j; q)_∞^{n_j}, a claim the source does not prove (source issue
HabiroNumberFields/E26). (2) Multiplication by a single element, g ↦ gf from H_R to H_{R,ξ}, is an
isomorphism only when f generates H_{R,ξ}; e.g. for ξ = 0, f = 1 − q ∈ H_Z, g ↦ (1 − q)g is
injective but not surjective, since 1 − q is not a unit (its value at q = 1 is 0). Any global
statement cites a global theorem (Theorem 2, or a freeness theorem), never the local description.

**Hypotheses.**

- Theorem 2's isomorphism is carried with the gap recorded at HB.7/the-ring-case-and-tensor-products.
- Invertible = finitely generated projective of rank one; free would mean isomorphic to H_R.

**Prerequisites.** [HabiroNumberFields:HB.7/local-freeness](#HB-7-local-freeness), [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](#HB-7-the-ring-case-and-tensor-products), [HabiroNumberFields:HB.6/ring-operations-and-the-classical-comparison](#HB-6-ring-operations-and-the-classical-comparison), [HabiroNumberFields:HB.7/followup-tensor-bijectivity](#HB-7-followup-tensor-bijectivity), [HabiroNumberFields:HB.7/followup-picard-character](#HB-7-followup-picard-character).

**Proof route.**

1. State Theorem 1 and Theorem 2 with their hypotheses.
2. (1): no source proves freeness in general; record the abelian claim and its missing proof.
3. (2): the example 1 − q: H_Z is a domain, so multiplication is injective; 1 is not in the image
because ev_1((1 − q)g) = 0.
4. Export the rule: global statements cite global theorems.

**Acceptance.**

- H_{R^_p,ξ} is free of rank one; H_{R,ξ} is invertible (Theorem 2 as stated) but not claimed free.
- g ↦ (1 − q)g on H_Z is not surjective.
- The tensor multiplication map is not listed as a counterexample: Theorem 2 asserts it is an
isomorphism.

**Sources.** `GSWZ.HabiroNumberField.2024`, §1.5, after Definition 1.4, p. 10 (arXiv v2); `GSWZ.HabiroNumberField.2024`, §1.5, p. 11 (arXiv v2).

<a id="HB-7-followup-half-shift-coefficient"></a>

### Half-shifted Pochhammer linear coefficient

`HabiroNumberFields:HB.7/followup-half-shift-coefficient` · definition

For a characteristic-zero field L, r ∈ L× and z ∈ L with z ≠ 1, define halfShiftLinearCoeff(z,r) =
−z/(24 r(1−z)). In applications r=ζ_m, z is a nontrivial root of unity in a local unramified factor,
and the coefficient is the first jet of Ψ/ε_m^{1/m}, not of the unnormalised Kummer-valued section.

**Hypotheses.**

- L is a characteristic-zero field; r≠0 and z≠1. This rational function is not an extension of the
analytic construction at z=1.

**Prerequisites.** `mathlib:PowerSeries.log`.

**Proof route.**

1. Compute B₂(1/2)=−1/12 from (60).
2. Use Li₀(z)=z/(1−z), divide the shifted expansion by m, and convert h=log(1+x/r) to x; the m in the
k=2 term cancels.

**Uses that determine the API.**

- GSWZ Theorem 10 with corrected (195): Supplies the integral linear coefficient omitted in its
one-sentence proof.
- HB.7 integral-linear-jet: Finite weighted presentations sum these coefficients after normalising
constants.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `halfShiftLinearCoeff` | constructor | The displayed rational function with explicit r and z. |
| `halfShiftLinearCoeff_map` | functoriality | A field homomorphism maps halfShiftLinearCoeff(z,r) to halfShiftLinearCoeff(ιz,ιr). |
| `halfShiftLinearCoeff_scale` | compatibility | For a≠0, halfShiftLinearCoeff(z,ar)=halfShiftLinearCoeff(z,r)/a. |
| `halfShiftLinearCoeff_neg_one` | simp | halfShiftLinearCoeff(−1,r)=1/(48r). |

**Unit tests.**

- `halfShiftLinearCoeff_minus_one` (computation): Over ℚ, z=−1 and r=1 give 1/48.
- `halfShiftLinearCoeff_two` (computation): Over ℚ, z=2 and r=1 give 1/12; detects the sign.
- `halfShiftLinearCoeff_level` (computation): Over ℚ, z=−1 and r=2 give 1/96; detects failure to rescale x/r.
- `halfShiftLinearCoeff_even_root` (computation): Over ℚ, z=−1 and r=ζ₂=−1 give −1/48. This checks the sign of x/r at an even root order, under the constant-one formal half-power branch.

**Acceptance.**

- −1 at level r=1 gives +1/48.
- Changing r rescales the answer by r^{-1}; no residual m factor remains.
- The use at z=1 is excluded even though field division is total as a library operation.

**Sources.** `GSWZ.HB7.v2`, §2.1, (46), (47), (60), pp.18-19; Definition 3.9, (207), p.42.

<a id="HB-7-followup-half-shift-first-jet"></a>

### First jet of the explicit local sections

`HabiroNumberFields:HB.7/followup-half-shift-first-jet` · theorem

For p>3 unramified, m≥1 prime to p and ζ≠1 of order prime to p in a factor of K_p, let
h=log(1+x/ζ_m) and interpret the half power in (207) as the formal square root of q^m with constant
1, exp(mh/2). The normalized factor U_{ζ,m}=Ψ_{[ζ],p,m}/ε_m([ζ])^{1/m} has constant coefficient 1
and linear coefficient halfShiftLinearCoeff(ζ,ζ_m). Its logarithm is Σ_{k≥2}
B_k(1/2)m^{k−2}Li_{2−k}(ζ)h^{k−1}/k!. This statement concerns the formal factor for each allowed ζ;
notation [ζ] does not assert that the raw symbol is a Bloch class.

**Hypotheses.**

- The constant Kummer root is chosen as in HB.2; division by it normalises the section.
- The infinite Pochhammer logarithm means the regularized formal asymptotic expansion (47), not a
convergent infinite product at a p-adic root of unity.
- The branch at q^m=1 has half power equal to 1: (q/ζ_m)^{m/2}=exp(mh/2). This is not an
identification with the ordinary monomial q^{m/2} at even m, whose constant can be −1.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-half-shift-coefficient](#HB-7-followup-half-shift-coefficient), [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections), `PadicHodgeRegulators:D.1`, `mathlib:PowerSeries.exp`, `mathlib:PowerSeries.subst`.

**Proof route.**

1. Apply −Σ ζ^ℓ exp(mhℓ/2)/(ℓ(1−exp(mhℓ))) from (46), interpreted by the shifted generating function
(60).
2. The k=0 term is Li₂(ζ)/(m²h); cancel it with (207). B₁(1/2)=0 removes the constant logarithmic term.
3. The k=2 term is −Li₀(ζ)h/24. Terms k≥3 have degree at least two in x.
4. Exponentiating a zero-constant series leaves its coefficient of x unchanged.

**Acceptance.**

- The branch, minus sign, 24, factor ζ_m^{-1}, and cancellation of m are explicit.
- No p-adic integrality of Li₂ is used for this finite jet.
- The same normalized unit for m=1, ζ=−1 is 1+x/48+O(x²).
- For m=2, ζ_m=−1 and ζ=−1, the branch-one unit has coefficient −1/48. The ordinary monomial q gives
input −ζ=1 at the expansion point, so it is not this normalized formal factor.

**Sources.** `GSWZ.HB7.v2`, §2.1, (46), (47), (60), pp.18-19; Definition 3.9, (207), p.42.

<a id="HB-7-followup-integral-linear-jet"></a>

### Integral shape of the Pochhammer sections

`HabiroNumberFields:HB.7/followup-integral-linear-jet` · theorem

Let O be the integer ring of an unramified factor of K_p, p>3, and m prime to p. For a valid finite
D.3 presentation ξ̂=Σ a_ζ[ζ] with a_ζ∈Z_p, ζ≠1 of order prime to p, the normalized product U=∏
U_{ζ,m}^{a_ζ}, defined by formal exp(a_ζ log U_{ζ,m}), has constant 1 and linear coefficient −Σ a_ζ
ζ/(24 ζ_m(1−ζ))∈O[ζ_m]. Hence Ψ has the corrected shape ε_m^{1/m}(1+xO[ζ_m]+x²K_p[ζ_m][[x]]).
Together with the separately imported Frobenius-defect estimate of HB.7/pochhammer-dwork-difference
and its half-shift variation, this is the shape input of Theorem 10. This resolves the linear-jet
gap only; supplier and higher-defect proofs retain their contracts.

**Hypotheses.**

- p>3, unramified, m prime to p; all local factors retained.
- Valid finite presentations and the interpretation of coefficient-localized symbols come from D.3,
never from an unchecked raw Bloch symbol.
- 24, ζ_m and 1−ζ are units; a_ζ is an integral scalar. Higher coefficients need not be integral.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-half-shift-first-jet](#HB-7-followup-half-shift-first-jet), [HabiroNumberFields:HB.7/pochhammer-dwork-difference](#HB-7-pochhammer-dwork-difference), [HabiroNumberFields:HB.7/dworks-lemma](#HB-7-dworks-lemma), `PadicHodgeRegulators:D.1`, `PadicHodgeRegulators:D.3`, `PadicHodgeRegulators:D.4`, `mathlib:PowerSeries.coeff_one_mul`.

**Proof route.**

1. A nontrivial prime-to-p root in an unramified field has nontrivial reduction, so 1−ζ is a unit. The
integers 24 and m are units for p>3 and p∤m.
2. Apply the first-jet formula. Finite products of constant-one units add linear coefficients; exp(a
log U) has linear coefficient a times that of U.
3. Intersect the factorwise integral assertions to get the full product-of-completions assertion.
4. Use D.3 and D.4 only to identify the valid presentation with ξ and its constants/regulator; the
finite-jet computation itself is elementary.

**Acceptance.**

- ζ=−1 has coefficient 1/(48ζ_m), integral for every p>3.
- An empty presentation has U=1, coefficient zero.
- At p=2 or3 the denominator argument fails; no extension of the theorem is claimed. ζ=1 is excluded.

**Sources.** `GSWZ.HB7.v2`, §2.1, (46), (47), (60), pp.18-19; Definition 3.9, (207), p.42; `GSWZ.HB7.v2`, Lemma 3.4, Corollary 3.5 and (195), pp.39-41; Theorem 10, p.42.

<a id="HB-7-followup-field-pullback"></a>

### Coefficient pullback of Habiro modules

`HabiroNumberFields:HB.7/followup-field-pullback` · construction

For an embedding ι:F→E of number fields, choose a common positive Δ divisible by 6, |disc F| and
|disc E|, and put R=O_F[1/Δ], S=O_E[1/Δ]. Define HabiroModule.baseChange by coefficientwise pullback
on the full cyclotomic algebras and on the Kummer line torsors, with degree ξ sent to res_ι ξ. It
consists of a ring map H_R→H_S and a semilinear additive map H_{R,ξ}→H_{S,res ξ}. It does not
initially assert a scalar-extension equivalence. All maps keep the abstract cyclotomic coordinate
ζ_m fixed; field coefficients are changed, not roots relabelled by a cyclotomic character.

**Hypotheses.**

- Every local factor of F⊗Q_p and E⊗Q_p is retained; p∤Δ makes both unramified.
- Finite-Chern torsor naturality and Coleman/regulator scalar naturality are requested; compare
torsors canonically rather than choosing unrelated scalar roots.
- Additive structures require effective-global-descent.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent), [HabiroNumberFields:HB.7/operations-on-the-modules](#HB-7-operations-on-the-modules), [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface), `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `PadicHodgeRegulators:D.1`, `PadicHodgeRegulators:D.4`, `MotivicEtaleKTheory:M.8`, `mathlib:PowerSeries.map`.

**Proof route.**

1. Extend ι to S-integers, cyclotomic coefficient algebras and all p-completions. Frobenius commutes by
uniqueness of the unramified lift; the shift ζ_{pm}−ζ_m is unchanged.
2. Use naturality of ε_m and D_p to map corrected invertible sections to corrected sections and their
spans to spans.
3. For (24), coefficients commute with both substitutions, products and the localised restricted-ring
map for every γ.
4. Restrict the ambient coefficient map to the actual global modules and prove identity/composition; no
invertibility of [E:F] is required for pullback.

**Uses that determine the API.**

- HB.7 scalar extension and evaluation targets: Provides the canonical comparison map and its
constant-term square.
- HabiroRings:HR.6: Supplies the explicit-module side of the scalar comparison without a reverse
dependency.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `HabiroModule.baseChange` | constructor | The coefficient ring map and semilinear map with restricted K₃ degree. |
| `HabiroModule.baseChange_coeff` | projection | Every normalized coefficient maps through the induced full cyclotomic algebra map; the constant term maps through its Kummer torsor. |
| `HabiroModule.baseChange_id` | simp | Identity field embedding with fixed Δ induces identity. |
| `HabiroModule.baseChange_comp` | functoriality | Pullbacks compose in a tower, with the canonical index/torsor identifications. |
| `HabiroModule.baseChange_smul` | structure | baseChange(a f)=baseChangeRing(a) baseChange(f). |
| `HabiroModule.baseChange_zero` | simp | In each degree, baseChange(0)=0. |
| `HabiroModule.baseChange_add` | simp | For f,g of the same degree ξ, baseChange(f+g)=baseChange(f)+baseChange(g) in degree res ξ. |
| `HabiroModule.baseChange_mul` | compatibility | For f of degree ξ and g of degree η, baseChange(fg)=baseChange(f)baseChange(g) in degree res(ξ+η)=res ξ+res η, with the canonical torsor identifications. |
| `HabiroModule.baseChange_ext` | extensionality | Two semilinear comparison maps with the same coefficient ring map and torsor identifications are equal if their induced rational cyclotomic component maps agree at every root order. |

**Unit tests.**

- `baseChange_identity` (degenerate): For F=E, ι=id, fixed Δ, every component and section is unchanged.
- `baseChange_zero_index` (compatibility): ξ=0 agrees with the coefficient ring map H_R→H_S and maps 1 to 1.
- `baseChange_all_factors` (computation): For ℚ→ℚ(i), Δ divisible by 6·4 and p=5, the local map is Z_5→Z_5×Z_5, a↦(a,a); both factors are kept.

**Acceptance.**

- Index is res ξ, not [E:F]ξ or ξ/[E:F].
- Changing Δ requires comparison of the two actual rings; no automatic equality of Habiro localisation
with naive algebraic localisation is assumed.
- When ι=id with the same Δ the map is identity.

**Sources.** `GSWZ.HB7.v2`, §1.4, (13)-(15), p.7; §1.5, (16)-(24), pp.8-10.

<a id="HB-7-followup-scalar-equivalence"></a>

### Scalar extension of the indexed lines

`HabiroNumberFields:HB.7/followup-scalar-equivalence` · theorem

Under the common-Δ hypotheses of field-pullback and after its naturality inputs and effective
descent are proved, the canonical H_S-linear map H_S⊗_{H_R}H_{R,ξ}→H_{S,res ξ}, b⊗f↦b·baseChange(f),
is bijective. Consequently Pic.mapAlgebra takes [H_{R,ξ}] to [H_{S,res ξ}]. The map is not
identified with naive coefficient extension S⊗_R H_{R,ξ}: H_R has no canonical R-algebra structure
in general.

**Hypotheses.**

- The H_R-algebra structure on H_S is the coefficient ring map just constructed.
- No assertion for arbitrary coefficient ring maps or ramified p at primes excluded by Δ.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent), `mathlib:CommRing.Pic.mapAlgebra`, [HabiroNumberFields:HB.7/followup-picard-character](#HB-7-followup-picard-character), `mathlib:CommRing.Pic.mk_eq_mk_iff`.

**Proof route.**

1. Compare on the p-adic lines: scalar pullback of an invertible section stays invertible, so it
generates the target local line.
2. Compare on all rational cyclotomic Kummer lines using finite-Chern naturality.
3. Apply effective-descent base-change compatibility and conservative chart detection to the canonical
tensor map; do not use completion alone as a faithfulness argument.
4. Use the Module.Invertible instances established by followup-picard-character. Apply Mathlib
Pic.mapAlgebra to these classes and Pic.mk_eq_mk_iff to the actual scalar linear equivalence.

**Acceptance.**

- The tensor is over H_R and the target degree is res ξ.
- The ξ=0 map is the canonical H_S⊗_{H_R}H_R≃H_S.
- No claim of global freeness or of a finite étale H_R→H_S follows without a separate ring comparison
proof.

**Sources.** `GSWZ.HB7.v2`, §1.4, (13)-(15), p.7; §1.5, (16)-(24), pp.8-10.

<a id="HB-7-followup-galois-action"></a>

### Semilinear coefficient Galois action

`HabiroNumberFields:HB.7/followup-galois-action` · construction

For σ∈Aut_Q(F), fixed Δ divisible by 6 and |disc F|, define HabiroModule.galois by coefficientwise
σ, extended to each full cyclotomic algebra fixing the abstract ζ_m, and transported along
ε_m(σ_*ξ)≅σ ε_m(ξ). This is a semilinear equivalence H_{R,ξ}→H_{R,σ_*ξ} over the ring automorphism
H_R→H_R. Identity and composition give an action on the disjoint union of all indexed modules. It
acts on a fixed degree only when σ_*ξ=ξ, and is H_R-linear only if the coefficient automorphism also
acts trivially.

**Hypotheses.**

- σ may permute p-adic factors; never choose one completion and call its automorphism the global
action.
- The required torsor/regulator naturality is the same as field-pullback applied to a field
isomorphism.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/operations-on-the-modules](#HB-7-operations-on-the-modules), [HabiroNumberFields:HB.7/constant-terms](#HB-7-constant-terms).

**Proof route.**

1. Apply field-pullback to σ and σ^{-1}; their compositions are identity with transported degrees.
2. Check coefficient and root-coordinate conventions, Frobenius commutation and invariance of the
corrected shape.
3. Use semilinearity to export the graded action and its tensor compatibility; composition uses the
actual canonical torsor identifications.

**Uses that determine the API.**

- HB.7 Galois and evaluation targets: Pins the semilinear action and its degree instead of an
unjustified fixed-degree linear representation.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `HabiroModule.galois` | constructor | Semilinear equivalence from degree ξ to degree σ_*ξ. |
| `HabiroModule.galois_coeff` | projection | Coefficientwise σ with abstract ζ_m fixed and Kummer torsor transported. |
| `HabiroModule.galois_one` | simp | The identity automorphism acts identically. |
| `HabiroModule.galois_mul` | functoriality | (στ) acts as σ after τ, including degree identifications. |
| `HabiroModule.galois_smul` | structure | σ(a f)=σ(a)σ(f). |
| `HabiroModule.galois_section_mul` | compatibility | σ(fg)=σ(f)σ(g), in degree σ_*(ξ+η)=σ_*ξ+σ_*η; this is section multiplication, whereas galois_mul expresses automorphism composition. |

**Unit tests.**

- `galois_identity` (degenerate): Identity is identity on every degree and every coefficient.
- `galois_complex_conjugation` (computation): For F=ℚ(i), conjugation squares to identity; on rational-family scalar i it sends i to −i while leaving ζ_m fixed.
- `galois_changed_index` (non-example): A class with σ_*ξ≠ξ is sent to the distinct degree σ_*ξ; no endomorphism of H_{R,ξ} is asserted.

**Acceptance.**

- This coefficient action fixes q and each abstract ζ_m. It is distinct from γ*:q↦q^γ in Proposition
1.5.
- Evaluation at ζ_m commutes in the Kummer line; it need not land in R[ζ_m].

**Sources.** `GSWZ.HB7.v2`, §1.4, (13)-(15), p.7; §1.5, (16)-(24), pp.8-10.

<a id="HB-7-followup-local-norm-defect"></a>

### Norm and Frobenius defect compatibility

`HabiroNumberFields:HB.7/followup-local-norm-defect` · theorem

For F⊂E, common Δ as above, p∤Δ, and m prime to p, use determinant norm and trace on the full finite
free rational/local cyclotomic coefficient algebras. They commute with compatible Frobenius and with
formal re-expansion: N(φ_E u)=φ_F N(u) and N(u)((ζ_m+x)^p−ζ_m^p)=N(u((ζ_m+x)^p−ζ_m^p)). For a
normalized constant-one unit u, log N(u)=Tr log u. Therefore the logarithmic defect of the
torsor-norm section, completed with D_p(tr ξ), equals the trace of the defect completed with D_p(ξ).
Since trace preserves integral coefficients, (p/x)O_E[ζ_m][[x]] maps into (p/x)O_F[ζ_m][[x]], and
the corrected first-jet shape is preserved.

**Hypotheses.**

- D.4 supplies D_p(tr ξ)=Tr D_p(ξ), with all local factors; M.8 supplies ε_m(tr ξ)=N ε_m(ξ) as Kummer
torsors.
- Cyclotomic tensor products are full finite algebras, not a selected compositum; trace and norm use
their actual ranks over the base.
- For constants outside 1+pO use the branch/torsor treatment supplied by D.1; the purely formal log
identity is stated for constant-one normalized units.

**Prerequisites.** [HabiroNumberFields:HB.6/coefficient-rings-and-frobenius](#HB-6-coefficient-rings-and-frobenius), [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/extension-to-all-roots](#HB-7-extension-to-all-roots), `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `PadicHodgeRegulators:D.1`, `PadicHodgeRegulators:D.4`, `MotivicEtaleKTheory:M.8`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_eq_of_equiv_equiv`, `mathlib:PowerSeries.coeff_one_mul`.

**Proof route.**

1. Use Algebra.norm_eq_of_equiv_equiv for simultaneous Frobenius automorphisms respecting the
coefficient inclusion.
2. Over rational coefficients, extend a finite basis to formal power series; determinant base change
gives substitution/re-expansion compatibility. Check integral coefficients by local finite free
models.
3. Prove log(det multiplication by u)=Tr(log multiplication by u) as a formal identity, e.g.
differentiate with constant zero; split étale descent gives a second proof.
4. Use the trace identity for regulators and norm identity for torsors to match completions; the pole
remains order at most one and integral trace preserves the factor p.
5. Extend to all root orders by the unique compatible lift of Corollary 3.7; prove the Frobenius
convention used for (13) separately from the one sending ζ_m to ζ_m^p in (21).

**Acceptance.**

- For a split degree-two coefficient algebra the norm is u₁u₂; it includes cross coefficients and is
not coefficientwise norm of individual coefficients.
- No division by [E:F] is used in the trace estimate.
- The pole is p/x, not px.

**Sources.** `GSWZ.HB7.v2`, §1.4, (13)-(15), p.7; §1.5, (16)-(24), pp.8-10; `GSWZ.HB7.v2`, Definition 1.3, (21)-(22), p.9.

<a id="HB-7-followup-transfer-norm"></a>

### Multiplicative transfer of indexed sections

`HabiroNumberFields:HB.7/followup-transfer-norm` · construction

For a finite number-field extension E/F and a common Δ divisible by 6 and both discriminants, define
HabiroModule.norm from the total graded family of H_{S,ξ} to H_{R,tr_{E/F}ξ} by the determinant norm
of the full E⊗_Q Q(ζ_m) algebra over F⊗_Q Q(ζ_m), transported on the Kummer torsor of degree ξ. The
construction is multiplicative in sections and additive on degrees: N(fg)=N(f)N(g) with tr(ξ+η)=tr
ξ+tr η. It is not an additive map on sections. For f∈H_{R,ξ}, N(baseChange f)=f^{[E:F]} in degree
tr(res ξ)=[E:F]ξ. The global membership and coherent torsor transport are explicit arithmetic input
gaps.

**Hypotheses.**

- Common Δ; finite extension of characteristic-zero fields. Full algebras and all completions, even
when cyclotomic polynomials split.
- Use the imported K₃ transfer, not an invented norm on raw Bloch symbols.
- The norm on twisted lines is defined by canonical torsor norm; independent local choices of
ε_m^{1/m} are compared before taking scalars.

**Prerequisites.** [HabiroNumberFields:HB.7/followup-local-norm-defect](#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface), [HabiroNumberFields:HB.6/the-gluing-condition](#HB-6-the-gluing-condition), `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`, `MotivicEtaleKTheory:M.8`, `PadicHodgeRegulators:D.4`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_norm`, `mathlib:Algebra.norm_algebraMap`, `mathlib:Algebra.norm_zero`.

**Proof route.**

1. First norm the rational Kummer line at each m, using finite-Chern transfer/norm compatibility.
2. The local-norm-defect theorem gives the corrected local-section condition; extend uniquely to all
roots. For general elements use the local line expression a·s and the ring norm of a.
3. Norm commutes with γ* and τ, so norm of (24) lies in the corresponding localised restricted H_R
ring. Prove ring-family norm membership by commuting with the Frobenius gluing.
4. Use Algebra.norm_norm for tower transitivity and multiplicativity of Algebra.norm for product laws,
on finite free full coefficient algebras. Use Algebra.norm_algebraMap for N(baseChange f)=f^{[E:F]};
the imported K-theory projection formula gives tr(res ξ)=[E:F]ξ.
5. Global membership and torsor coherence still require the named supplier inputs and effective
descent, recorded explicitly.

**Uses that determine the API.**

- HB.7 K₃ transfer and Frobenius gluing target: Connects additive transfer of the degree to
multiplicative norm of a section.
- HB.7 root evaluation: Keeps the Kummer value and full coefficient algebra in the norm square.

**API.**

| Declaration | Role | Statement |
|---|---|---|
| `HabiroModule.norm` | constructor | Multiplicative norm of sections with degree changed by K₃ transfer. |
| `HabiroModule.norm_mul` | compatibility | N(fg)=N(f)N(g) with the summed transferred degree. |
| `HabiroModule.norm_one` | simp | The ring unit in degree zero maps to the ring unit. |
| `HabiroModule.norm_tower` | functoriality | Norms compose in a finite tower with fixed common Δ. |
| `HabiroModule.norm_res` | compatibility | N(baseChange(f))=f^{[E:F]} in transferred degree [E:F]ξ. |
| `HabiroModule.norm_eval` | projection | Evaluation commutes with the full cyclotomic coefficient/torsor norm whenever the evaluation is integral, in particular (m,Δ)=1. |
| `HabiroModule.norm_zero` | simp | N(0)=0 in degree tr ξ for every ξ, because [E:F] is positive; this is not a claim that norm is additive. |
| `HabiroModule.norm_expandAt` | projection | At every root order, expandAt(N f) is the determinant norm of the whole power-series expansion of f over the full finite coefficient algebra, with its canonical Kummer torsor norm. This is not the scalar norm applied separately to each coefficient. |

**Unit tests.**

- `norm_identity` (degenerate): Degree-one identity extension gives N(f)=f in every degree.
- `norm_res_degree_two` (compatibility): For a quadratic extension and a pulled-back section, N(res f)=f², with degree tr(res ξ)=2ξ.
- `norm_split_cross_term` (computation): In a split degree-two local algebra, (1+a x,1+b x) has norm 1+(a+b)x+ab x²; coefficientwise norm would incorrectly give constant 1 and linear ab.
- `norm_zero_test` (degenerate): In the finite free nontrivial coefficient algebra, the norm of zero is zero, including the section of K₃ degree zero. A no-finite-basis norm that defaults to one fails this test.

**Acceptance.**

- Identity extension gives identity, and zero section has zero norm when the finite coefficient
extension has positive rank [E:F], including K₃ degree zero.
- A split degree-two local test distinguishes norm of series from coefficientwise scalar norm.
- Do not assert a linear transfer on modules or a global generator; no line-norm isomorphism on Picard
groups is claimed without a finite-locally-free ring map and its determinant-line theory.

**Sources.** `GSWZ.HB7.v2`, §1.4, (13)-(15), p.7; §1.5, (16)-(24), pp.8-10.

## Remaining proof and supplier interfaces

Every declaration above is a target. The following obligations identify exactly what
must still be supplied to complete its proof. A numerical acceptance example does not
discharge a source comparison, descent statement or missing supplier interface.

### HB.1

**Keune's injection for the Picard group of cyclotomic S-integers into K₂(O_F).** ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection supplies the required contract on twisted
Pic/p^m coinvariants. Its original-source proof and exact hypothesis translation remain obligations
there. Finite-module vanishing, weight-one Kummer p-units and total-ramification valuation descent
are the exact HB.1 refinement targets.

Consumers: [HabiroNumberFields:HB.1/units-realise-c-zeta](#HB-1-units-realise-c-zeta).

**Early M.8 supplier must be split before it can be a dependency.** The generic finite-coefficient étale Chern classes is requested through M.8 but requires a
separately early prefix. Do not add the whole M.8→consumer edge: it imports late D.2/R.7 work and
can close a cycle. No new stage ID is fabricated here.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](#HB-2-soule-formula-in-degree-three).

**Keune original-source and exact-hypothesis verification at the existing owner.** The exact injection is imported from ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection in
ArithmeticKTheory--N.1.json. CGZ published Lemma 3.5, pp.402–403, has been read. The original Keune
K-Theory 2 (1989), 625–645, DOI 10.1007/BF00535049, could not be accessed through the publisher
DOI/PDF and no public author copy was obtained. The supplier explicitly leaves its original proof
and hypothesis translation open. Verify them in N.6; do not count this citation as a completed proof
or replace it by the M.3 K₂ comparison.

Consumers: [HabiroNumberFields:HB.1/keune-picard-eigen-obstruction](#HB-1-keune-picard-eigen-obstruction), [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/units-realise-c-zeta](#HB-1-units-realise-c-zeta).

**Early finite-Chern supplier prefix is not yet an accepted stage.** The owner M.8 still carries late D.2/R.7 inputs. Its requested early prefix must be split/and its
precise node IDs substituted at the inherited interfaces. No new stage ID and no whole-M.8
prerequisite edge is fabricated in this packet.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees).

**Supplier `MotivicEtaleKTheory:M.1`.** The finite and continuous Tate twists ℤ/n(m) = μ_n^{⊗m} and ℤ_p(m) = lim μ_{p^k}^{⊗m}, with the
Galois action through χ^m, and ℚ_p/ℤ_p(m) (whose invariants define w_m(F)), as used in CGZ §3.1. The
RS-10 link M.1 → HB.1 records this dependence.

Consumers: [HabiroNumberFields:HB.1/inflation-restriction-injectivity](#HB-1-inflation-restriction-injectivity), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta).

**Supplier `MotivicEtaleKTheory:M.7`.** The degree-three case at odd primes of the comparison with Galois cohomology. For a number field F
and an odd prime p: Soulé's Chern class gives K₃(F) ⊗ ℤ_p ≅ K₃(O_F) ⊗ ℤ_p ≅ H¹_ét(O_F[1/p], ℤ_p(2)),
and H¹_ét(O_F[1/p], ℤ_p(2)) ≅ H¹(F, ℤ_p(2)) (CGZ Theorem 3.2 and §3.2). For a number field E ⊇ μ_N
with N odd: c̄_{2,1} : K₃(E; ℤ/N) → H¹(E, μ_N^{⊗2}) is an isomorphism (Hutchinson Theorem 2.10,
Levine's theorem, in this case). The HB.1 stage requires M.7; the packet had omitted it.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/quillen-lichtenbaum-degree-three](#HB-1-quillen-lichtenbaum-degree-three).

**Supplier `MotivicEtaleKTheory:M.8`.** Soulé's étale Chern classes c̄_{i,k} : K_{2i−k}(A; ℤ/ℓ^ν) → H^k(A, μ_{ℓ^ν}^{⊗i}) for rings A with ℓ
invertible, and their ℓ-adic limits c : K_{2m−1}(F) → H¹(F, ℤ_ℓ(m)). Needed with: compatibility with
reduction modulo ℓ^ν and with K_m(A)/ℓ^ν → K_m(A; ℤ/ℓ^ν); base change along finite extensions;
c̄_{1,1} = the Kummer map on K₁(F; ℤ/N) = Fˣ/(Fˣ)^N; and Soulé's product formula (Hutchinson Theorem
2.12, Soulé II.3 Théorème 1(i)) with its specialisation c̄_{2,1}(a∗b) = −c̄_{1,1}(a) ∪ c̄_{1,0}(b)
(Hutchinson Corollary 2.13). Require an early finite-coefficient étale Chern classes interface,
before D.2 and BorelRegulators:R.7. The current atlas M.8 remains unsplit and depends on those later
comparisons; this request is not a dependency on all of M.8 and does not claim the prefix already
exists.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](#HB-2-soule-formula-in-degree-three).

**Supplier `StableHomotopyKTheory:H.6`.** E/m as the cofiber of multiplication by m on a spectrum and the Bockstein exact sequence 0 →
π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0, applied to the K-theory spectrum. This gives K_m(R; ℤ/ℓ)
and 0 → K_m(R)/ℓ → K_m(R; ℤ/ℓ) → K_{m−1}(R)[ℓ] → 0 (Hutchinson §2.3). It replaces the request to
StableHomotopyKTheory:H.2, which supplies none of this.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](#HB-2-hurewicz-mod-odd-N).

**Supplier `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-5-exact-sequences`.** Inflation–restriction 0 → H¹(G/N, M^N) → H¹(G, M) → H¹(N, M) for a closed normal subgroup N of a
profinite group G and a discrete module M (explicitInfl1_injective, explicitInfRes_exact), applied
to G_{F_n} ⊂ G_F with M = ℤ/n(m).

Consumers: [HabiroNumberFields:HB.1/inflation-restriction-injectivity](#HB-1-inflation-restriction-injectivity).

**Supplier `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.** Hilbert 90 for the separable closure and the Kummer isomorphism Lˣ/(Lˣ)^n ≅ H¹(G_L, μ_n) for n
invertible in L. Tau Ceti has the injective Kummer map TauCeti.kummerClassMap_injective;
surjectivity is this layer's. Used for H¹(F_n, μ_n) = F_nˣ/(F_nˣ)^n in CGZ §3.1. The RS-10 link
records this dependence.

Consumers: [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/s-units-realise-c-zeta](#HB-1-s-units-realise-c-zeta).

**Supplier `ArithmeticKTheory:N.6`.** Use keune-cyclotomic-picard-injection for n=p^m, p odd and unramified in F: twisted Pic/p^m
coinvariants inject into K₂(O_F)/p^m. Combine their vanishing with the corresponding finite-module
Pic[p^m] invariant criterion. Original Keune proof remains an explicit supplier gap.

Consumers: [HabiroNumberFields:HB.1/units-realise-c-zeta](#HB-1-units-realise-c-zeta).

**Supplier `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.** For a finite local-field extension, an Eisenstein polynomial of degree d generates a totally
ramified extension of degree d with residue degree one. Apply to Φ_{p^m}(X+1) over the unramified
completion F_𝔭. Consume the existing Layer 3 construction and its local carrier.

Consumers: [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action).

**Supplier `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`.** For the canonical completion algebras, supply the global/local e and f identifications (Layer 5.5),
including the consequence that p∤disc(F) makes F_𝔭/ℚ_p unramified. Use the semilocal completion
product (Layer 5.3): [L:F]=Σ_{𝔓|𝔭}[L_𝔓:F_𝔭]. A completed factor of degree φ(p^m), with global degree
at most φ(p^m), then gives the unique prime above each 𝔭. All local scalar structures are the
canonical ones from Layer 5.2.

Consumers: [HabiroNumberFields:HB.1/cyclotomic-prime-valuation-action](#HB-1-cyclotomic-prime-valuation-action).

**Supplier `MotivicEtaleKTheory:M.1`.** At the M.1 realization/Kummer-localization interface, supply the G-equivariant étale Kummer sequence
at A=𝓞 L[1/p], with n=p^m invertible in A: 0→Aˣ/n→H¹_ét(A,μ_n)→Pic(A)[n]→0. Identify its unit
inclusion, connecting map and restriction to H¹(L,μ_n) with the existing algebraic S-unit/Selmer
sequence and the field Galois Kummer map. M.3 is the degree-two K₂ comparison and does not supply
this weight-one sequence; it also does not substitute for Keune.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift).

**Supplier `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.** The Galois Kummer isomorphism and its naturality on the field L, compatible with the algebraic
S-unit/Selmer and étale Kummer maps. The algebraic maps at the pin do not on their own give this
cohomology identification.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift).

**Supplier `MotivicEtaleKTheory:M.8`.** Split and accept the early finite-Chern prefix of M.8 before using it as a dependency. Export Soulé
finite classes c̄_{i,k}:K_{2i−k}(R;ℤ/n)→H^k_ét(R,μ_n^{⊗i}) for n invertible, including the
coefficient/restriction/K₁ normalizations and product formula. Its prerequisites are M.7; HB.1, HB.2
and D.2 consume that prefix. Current late M.8 comparisons with D.2/R.7 are outside this input. This
request is not an edge from all of M.8.

Consumers: [HabiroNumberFields:HB.1/ordinary-unit-eigenclass-lift](#HB-1-ordinary-unit-eigenclass-lift), [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees).

### HB.2

**The sign of the comparison scalar.** Raw Soulé and the independently negated degree-(2,1) map are fixed by
HB.2/eta-chern-signed-evaluation. The actual CGZ/GSWZ edge/boundary map and Suslin/Hurewicz
compatibility still require the separate source comparison recorded in the HB.2 supplement. Squaring
an inverted class inverts ε_m; its normalization cannot be chosen by the eta value.

Consumers: [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/chern-class-of-eta](#HB-2-chern-class-of-eta), [HabiroNumberFields:HB.2/hutchinson-refinement](#HB-2-hutchinson-refinement).

**CGZ Theorem 7.4, R_ζ(η_ζ) = ζ², is proved only through Nahm-sum asymptotics.** HabiroNahmSeries:HB.4/acceptance-andrews-gordon supplies R(η)=ζ² through
HB.4/andrews-gordon-radial-constant. Since HB.4 consumes HB.2, assemble the unconditional R=c²
conclusion at existing HB.5 with the actual source-sign comparison and CRT.
HB.2/hutchinson-refinement supplies only the conditional algebraic implication.
HB.9/constant-term-is-the-unit consumes the late result or discharges those premises; its
integration is a request to the Nahm owner.

Consumers: [HabiroNumberFields:HB.2/hutchinson-refinement](#HB-2-hutchinson-refinement).

**Early M.8 supplier must be split before it can be a dependency.** The generic finite-coefficient étale Chern classes is requested through M.8 but requires a
separately early prefix. Do not add the whole M.8→consumer edge: it imports late D.2/R.7 work and
can close a cycle. No new stage ID is fabricated here.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](#HB-2-soule-formula-in-degree-three).

**Acyclic common analytic supplier exports.** The published GZ appendix is read and its normalization corrections and final algebra are given
here. The two-sided uniform residue/tail estimates and common q-product limits are not provided by
QM.0’s existing formal-series node. Its request states exactly what is needed; move the generic part
out of HB.4 rather than importing HB.4 into HB.2. The classical complex five-term identity is
likewise requested from P.1. Numerical checks do not discharge these analytic obligations.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](#HB-2-kms-odd-order-proof).

**Early finite Chern owner and source sign compatibility.** M.8 is still an unsplit late stage; the early prefix is a restructuring request, not a current
dependency. Raw Soulé gives ζ⁻¹, while the independently negated map gives ζ. Parent E14 remains
unresolved as a CGZ/GSWZ normalization comparison. Compare the actual étale-K-theory edge/boundary
maps and Suslin/Hurewicz convention with the raw finite Chern class. Until then retain
sign-qualified scalar statements; no arbitrary normalization chosen by evaluating η identifies the
published map.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Inherited Bass–Tate proof closure.** The degree-three result is supplied by V.2/milnor-k3-number-field, which imports
T.2:symbols/milnor-number-field. The latter explicitly retains G-Bass-Tate. This pass imports that
gap instead of claiming its arithmetic proof is supplied. The request specifies real-place and
Hilbert/global-K₂ inputs, the product consequence, and a rescope of the arithmetic proof after T.7
to avoid a T.7→T.2:symbols cycle.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Supplier `GeneralAlgebraicKTheory:K.7`.** Graded-commutative products K_n(A; Z/N) × K_m(A; Z/N) → K_{n+m}(A; Z/N) for N odd and commutative A,
compatible with the Hurewicz maps h_n : K_n(A; Z/N) → H_n(GL(A), Z/N), where the product on homology
is induced by the tensor product of matrices (the Pontryagin product on H_*(GL_1(A), Z/N)).

Consumers: [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](#HB-2-hurewicz-mod-odd-N).

**Supplier `KTheoryFiniteLocalFields:L.2`.** Gabber rigidity in the form K_3(O_{F,q}; Z_p) ≅ K_3(F_q) ⊗ Z_p for the completion O_{F,q} of the
ring of integers at a prime q not above p (CGZ proof of Lemma 4.1).

Consumers: [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one).

**Supplier `KTheoryFiniteLocalFields:L.7`.** For a number field F, n = p^m and a prime q of F not above p: the étale Chern class K_3(F)/n →
H^1(F, Z/n(2)) is compatible with completion at q and lands, on K_3(O_F) = K_3(F), in the unramified
classes identified with H^1(F_q, Z/n(2)); with the finite-field Chern class c_{ζ,q} on K_3(F_q)/n
(CGZ Lemma 4.1).

Consumers: [HabiroNumberFields:HB.2/local-maps-at-primes-of-norm-minus-one](#HB-2-local-maps-at-primes-of-norm-minus-one).

**Supplier `MotivicEtaleKTheory:M.3`.** Tate's theorem in the field form K_2(F)/n ≅ H^2(F, Z/n(2)) and the n-torsion statement K_2(F)[n] ≅
H^2(F, Z_p(2))[n] for n = p^m, used in CGZ (38) to show R_ζ : B(F; Z/n) → H^1(F, Z/n(2)) is an
isomorphism for n prime to w_2(F).

Consumers: [HabiroNumberFields:HB.2/etale-bloch-group-and-K2](#HB-2-etale-bloch-group-and-K2).

**Supplier `MotivicEtaleKTheory:M.8`.** Soulé's étale Chern classes c̄_{i,k} : K_{2i−k}(A; ℤ/ℓ^ν) → H^k(A, μ_{ℓ^ν}^{⊗i}) for rings A with ℓ
invertible, and their ℓ-adic limits c : K_{2m−1}(F) → H¹(F, ℤ_ℓ(m)). Needed with: compatibility with
reduction modulo ℓ^ν and with K_m(A)/ℓ^ν → K_m(A; ℤ/ℓ^ν); base change along finite extensions;
c̄_{1,1} = the Kummer map on K₁(F; ℤ/N) = Fˣ/(Fˣ)^N; and Soulé's product formula (Hutchinson Theorem
2.12, Soulé II.3 Théorème 1(i)) with its specialisation c̄_{2,1}(a∗b) = −c̄_{1,1}(a) ∪ c̄_{1,0}(b)
(Hutchinson Corollary 2.13). Require an early finite-coefficient étale Chern classes interface,
before D.2 and BorelRegulators:R.7. The current atlas M.8 remains unsplit and depends on those later
comparisons; this request is not a dependency on all of M.8 and does not claim the prefix already
exists.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.1/the-chern-class-map-c-zeta](#HB-1-the-chern-class-map-c-zeta), [HabiroNumberFields:HB.1/hutchinson-chern-class-agrees](#HB-1-hutchinson-chern-class-agrees), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/chern-sign-conventions](#HB-2-chern-sign-conventions), [HabiroNumberFields:HB.2/soule-formula-in-degree-three](#HB-2-soule-formula-in-degree-three).

**Supplier `StableHomotopyKTheory:H.6`.** E/m as the cofiber of multiplication by m on a spectrum and the Bockstein exact sequence 0 →
π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0, applied to the K-theory spectrum. This gives K_m(R; ℤ/ℓ)
and 0 → K_m(R)/ℓ → K_m(R; ℤ/ℓ) → K_{m−1}(R)[ℓ] → 0 (Hutchinson §2.3). It replaces the request to
StableHomotopyKTheory:H.2, which supplies none of this.

Consumers: [HabiroNumberFields:HB.1/finite-coefficient-K3-and-the-chern-class](#HB-1-finite-coefficient-K3-and-the-chern-class), [HabiroNumberFields:HB.2/bott-element](#HB-2-bott-element), [HabiroNumberFields:HB.2/hurewicz-mod-odd-N](#HB-2-hurewicz-mod-odd-N).

**Supplier `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.** The Chebotarev density theorem: for a finite Galois extension of number fields and a conjugacy class
C of its Galois group, the primes with Frobenius class C have Dirichlet density #C/#G, in particular
are infinite; used with Frobenius prescribed simultaneously in a cyclotomic field and a Kummer
extension (CGZ Proposition 4.2 and proof of Theorem 5.2). A Tau Ceti layer cannot be a node
prerequisite, hence this request.

Consumers: [HabiroNumberFields:HB.2/chebotarev-detection](#HB-2-chebotarev-detection), [HabiroNumberFields:HB.2/local-R-is-an-isomorphism](#HB-2-local-R-is-an-isomorphism).

**Supplier `QSeriesPartitionsAndMockModularForms:QM.0`.** Extend the finite q-Pochhammer API from formal power-series coefficients to an arbitrary commutative
ring, with evaluation compatibility. Supply the analytic bilateral Ramanujan 1ψ1 identity in GZ (58)
for |q|<1, |x/y|<|z|<1 and nonvanishing denominators. Extract the common leading-product limit (a;ζ
exp(−ε/n))_∞^(−n) ~ [∏_{k=1}^{n−1}(1−ζ^k a)^k](1−a^n)^(−n/2) exp(Li₂(a^n)/ε) on the slit domain,
before HB.2/HB.4. Supply the uniform residue-class/tail estimate √ε Ψ→√(2π/n)√((1−X)(1−Y)/(X−Y))
∑_{k<n}(ζy;ζ)_k/(ζx;ζ)_k z^k on a sufficiently small simply connected complex neighborhood of
(X,Y)=(1/5,2), with Z=(1−X)/(1−Y), |X/Y|<|Z|<1, Re S>0 and compatible analytic nth roots. Work on
the generic nonreal subopen and extend across removable summand singularities by the backward
recurrence. State locally uniform estimates on compact subsets of that neighborhood. Prove two-sided
tail bounds, not just the fixed-residue Taylor formula. These are q-product/hypergeometric facts,
with no regulator or Nahm-sum dependence.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](#HB-2-kms-odd-order-proof).

**Supplier `Polylogarithms:P.1`.** Supply the classical dilogarithm five-term specialization
B=−Li₂(X/(YZ))+Li₂(YZ)+Li₂(1/(YZ))+Li₂(X/Y)+Li₂(1)−Li₂(X)−Li₂(1/Y)−Li₂(Z)=0, with Z=(1−X)/(1−Y), on
the same sufficiently small simply connected open neighborhood of (X,Y)=(1/5,2) and compatible
principal branches; all variable Li₂ arguments at that point are real and less than one. The
Bloch–Wigner imaginary-part identity is insufficient. Derive the full complex identity using the
differential and normalization of the existing classical-polylogarithm, and fix Li₂(1)=π²/6.

Consumers: [HabiroNumberFields:HB.2/kms-odd-order-proof](#HB-2-kms-odd-order-proof).

**Supplier `K3BlochGroups:V.4`.** Extend the existing configuration/hyperhomology map with Hutchinson 2013 §6.3–6.4: the positive
periodic cyclic generator maps to ∑cr(β₃(1,t,t^(j+1),t^(j+2))) in RP(F), independent of auxiliary
x,y, with the explicit correction terms printed on p.33. Include the forgetful RP→P comparison and
the actual H₃(SL₂)→B map, and agree with V.5/nonsplit-cartan-mod-n for finite fields. This generic
configuration calculation has one owner here; HB.2 supplies only t_ζ’s cyclotomic specialization.

Consumers: [HabiroNumberFields:HB.2/eta-bar-bloch-specialization](#HB-2-eta-bar-bloch-specialization).

**Supplier `MotivicEtaleKTheory:M.8`.** Split an early finite-coefficient Chern prefix from M.8, requiring M.7 only and not BorelRegulators
R.7 or PadicHodgeRegulators D.2. It owns c̄_(i,k):K_(2i−k)(A;Z/ℓ^m)→H^k_et(A,μ_(ℓ^m)^⊗i),
coefficient/base-change compatibility, c̄_(1,1)=standard Kummer, c̄_(1,0)(β)=ζ for ∂β=ζ, and Soulé’s
negative product formula. HB.1 specializes/untwists, HB.2 evaluates, D.2 imports the same
construction. No new stage identifier is invented, and no edge from all of unsplit M.8 is asserted.
Compare its raw class with the fixed CGZ/GSWZ class, including every sign.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Supplier `K2SymbolsBrauer:T.7`.** Close the original-proof gap of the existing T.2:symbols/milnor-number-field theorem without
duplicating its statement. Its arithmetic proof must be rescoped after T.7, within the same
K2SymbolsBrauer owner: T.7 uses the real-place inputs of MotivicEtaleKTheory M.2 and its own
Hilbert-symbol/global K₂ inputs; V.2 imports that proof export. Do not add T.7 or M.3 as
prerequisites of all of T.2:symbols: both already consume T.2:symbols and that would create a cycle.
Retain the existing theorem id as the statement import and gap until the rescope is applied. Expose
K₃^M(F)={−1}·K₂^M(F), with the Matsumoto identification of K₂^M(F) with K₂(F) from the Milnor owner,
and prove the product consequence via real signatures and weak approximation.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Supplier `tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory`.** Consume the existing Layer 9 Kummer isomorphism and its explicit/canonical map compatibility, with
its continuous coefficient transport and Layer 8 cup product. This is an import contract for
already-owned upstream work, not a proposal to re-plan or extend that roadmap. The pinned
kummerClassMap alone supplies only injectivity.

Consumers: [HabiroNumberFields:HB.2/eta-chern-signed-evaluation](#HB-2-eta-chern-signed-evaluation).

**Supplier `HabiroNahmSeries:HB.5`.** Assemble the scalar-two theorem after HB.4/HB.5a/HB.2. Import the existing
HB.4/acceptance-andrews-gordon (CGZ Theorem 7.4); do not duplicate it. Consume
QM.0/andrews-gordon-nahm-form with the reversal of coordinates needed for CGZ’s product condition
2k≠0,±1 mod n, and QM.1’s Jacobi theta/eta transformation APIs. With η defined by the imported HB.2
node and the signed evaluation here, apply parent scalar-from-eta locally at q≡−1 mod n, q≢−1 mod
pn, then global comparison and CRT. State R=c_+² or R=c_raw^(−2), and assert GSWZ’s fixed R=c² only
after its sign comparison. Export this assembled theorem to HabiroNahmSeries HB.9, while
epsilon_m=c_m² for all m remains early.

Consumers: [HabiroNumberFields:HB.2/hutchinson-refinement](#HB-2-hutchinson-refinement), [HabiroNumberFields:HB.2/the-exported-interface](#HB-2-the-exported-interface).

### HB.6

The scoped comparison targets have named proof routes and exact suppliers; no additional unresolved interface is recorded for this layer.

### HB.7

**Theorem 2 beyond the multiplication map.** The parent ring-case node supplies equality at degree zero and actual multiplication. Effective
additive descent, finite projectivity, actual chart base changes and conservativity are
HB.7/followup-effective-global-descent. Tensor bijectivity and Σ f_i g_i=1 depend on that exact
target; Picard coherence then follows. G-global-descent remains open and E23 is not resolved.

Consumers: [HabiroNumberFields:HB.7/the-ring-case-and-tensor-products](#HB-7-the-ring-case-and-tensor-products), [HabiroNumberFields:HB.7/what-the-local-picture-does-not-give](#HB-7-what-the-local-picture-does-not-give).

**Scalar extension, Galois action and transfer compatibility have no source.** The exact own targets are HB.7/followup-field-pullback, followup-scalar-equivalence,
followup-galois-action, followup-local-norm-defect and followup-transfer-norm.
G-arithmetic-naturality and the requested D.1/D.4/early-M.8 comparisons remain explicit. HR.6
consumes HB.7 and is not a supplier of these missing proofs.

Consumers: [HabiroNumberFields:HB.7/operations-on-the-modules](#HB-7-operations-on-the-modules).

**Theorem 10 and the corrected shape of invertible sections.** HB.7/followup-half-shift-first-jet and followup-integral-linear-jet give the branch-one integral
linear coefficient, including even-root tests. The higher half-shift Frobenius-defect proof and
valid presentation independence remain G-inherited-local-inputs in the HB.7 supplement. Keep the
corrected integral linear shape and source issue E24.

Consumers: [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections), [HabiroNumberFields:HB.7/local-freeness](#HB-7-local-freeness), [HabiroNumberFields:HB.7/followup-integral-linear-jet](#HB-7-followup-integral-linear-jet).

**Effective global descent, beyond local freeness.** Inherited HabiroNumberFields/E23 remains unresolved. Construct a linear descent datum, prove it
equals Definition 1.4 including additive closure, prove finite presentation/projectivity, identify
actual tensor base changes, and prove charts conservative. A finite sum f_i g_i=1 must follow for
every ξ, not just Nahm classes. GSWZ v2 §3.3 only establishes a multiplication map. Wagner thesis
§2.2 describes the ring equalizer and cites the Picard map in its introduction but gives no missing
indexed-line proof in the passages read. No alternative complete proof was found in the 2026-10-06
source search. This gap prevents claiming any global tensor or scalar equivalence unconditionally.

Consumers: [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent), [HabiroNumberFields:HB.7/followup-tensor-bijectivity](#HB-7-followup-tensor-bijectivity), [HabiroNumberFields:HB.7/followup-picard-character](#HB-7-followup-picard-character), [HabiroNumberFields:HB.7/followup-scalar-equivalence](#HB-7-followup-scalar-equivalence), [HabiroNumberFields:HB.7/followup-transfer-norm](#HB-7-followup-transfer-norm).

**Arithmetic torsor naturality and coherent norm transport.** GSWZ has no scalar-extension, coefficient Galois, or K₃ transfer theorem. Establish requested
D.1/D.4 scalar, Frobenius and trace identities and M.8 finite-Chern restriction/corestriction on the
full cyclotomic algebras, with ε_m=c_m² and torsor-level coherence at every m. Check integral
lattices, p-unit representatives and all factors. Then prove coefficient maps and rational/local
series norms preserve the exact gluing; the proof outlines here specify these missing comparisons
rather than assigning them to HR.6, which already consumes HB.7.

Consumers: [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-galois-action](#HB-7-followup-galois-action), [HabiroNumberFields:HB.7/followup-local-norm-defect](#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](#HB-7-followup-transfer-norm).

**Uncompleted local analytic and presentation inputs.** D.1, D.3 and D.4 remain requested stages, not implementations. The pochhammer-dwork-difference and
pochhammer-sections nodes retain the half-shift Frobenius-defect proof and presentation-independence
obligations; the new finite-jet derivation supplies the integral linear term only. Source issue E24
still requires the corrected shape. E26, the global abelian generator claim, remains unproved and is
not used here.

Consumers: [HabiroNumberFields:HB.7/followup-half-shift-first-jet](#HB-7-followup-half-shift-first-jet), [HabiroNumberFields:HB.7/followup-integral-linear-jet](#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-effective-global-descent](#HB-7-followup-effective-global-descent).

**Supplier `PadicHodgeRegulators:D.3`.** GSWZ Theorem 9: for p > 3 unramified, D_p : K_3(K_p; Z_p) → p^2 O_{K_p} is a Z_p-linear isomorphism
and K_3(K_p; Z_p) is generated by the classes [ζ], ζ ∈ μ(K_p). Used for the presentation (206) of ξ̂
in the proof of Theorem 1.

Consumers: [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections), [HabiroNumberFields:HB.7/local-freeness](#HB-7-local-freeness).

**Supplier `PadicHodgeRegulators:D.4`.** The localisation map K_3(K) → K_3(K_p; Z_p) for p unramified and the p-adic regulator D_p : K_3(K_p)
→ K_p = K ⊗ Q_p in the exact normalisation of GSWZ (19) and (22) (Coleman's p-adic dilogarithm
D_p(z) = Li_2(z) + ½ log z log(1 − z), with D_p([ζ]) = Li_2(ζ) for roots of unity), with its
compatibility with Frobenius (D_p(φ_p ξ) = φ_p D_p(ξ)).

Consumers: [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections).

**Supplier `PadicHodgeRegulators:D.1`.** Import Coleman Li₂, the logarithm branch, five-term identity and the GSWZ normalization
D_p(z)=Li₂(z)+(1/2)log(z)log(1−z). HB.7 applies them to completed coefficient algebras; D.2 owns
descent/comparison and D.3/D.4 the regulator/integrality results. Keep p>3 and unramified hypotheses
on the integral estimates.

Consumers: [HabiroNumberFields:HB.7/invertible-local-sections](#HB-7-invertible-local-sections), [HabiroNumberFields:HB.7/pochhammer-sections](#HB-7-pochhammer-sections).

**Supplier `PadicHodgeRegulators:D.1`.** Coleman Li₂, log branch and GSWZ D_p(z)=Li₂(z)+(1/2)log(z)log(1−z), with log(root of unity)=0, the
exact scalar-extension/Frobenius normalization and log/trace identity used here. Direct D.1
dependency is the disposition of RT-AREA-ktheory-2/15.

Consumers: [HabiroNumberFields:HB.7/followup-half-shift-first-jet](#HB-7-followup-half-shift-first-jet), [HabiroNumberFields:HB.7/followup-integral-linear-jet](#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](#HB-7-followup-local-norm-defect).

**Supplier `PadicHodgeRegulators:D.3`.** For p>3 and a finite PRODUCT of unramified Q_p extensions, the completed regulator isomorphism to
p²O and a valid finite Z_p presentation by permitted nontrivial roots, with
coefficient-localized/integral-multiple comparison to the notation [ζ]. Raw [ζ] need not lie in a
Bloch kernel.

Consumers: [HabiroNumberFields:HB.7/followup-integral-linear-jet](#HB-7-followup-integral-linear-jet).

**Supplier `PadicHodgeRegulators:D.4`.** Global K₃ localization to all completions and its compatibility with scalar restriction, coefficient
automorphisms, Frobenius and finite-extension transfer: D_p(tr ξ)=Tr D_p(ξ), with
denominator/torsion control, for the full local products.

Consumers: [HabiroNumberFields:HB.7/followup-integral-linear-jet](#HB-7-followup-integral-linear-jet), [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](#HB-7-followup-transfer-norm).

**Supplier `MotivicEtaleKTheory:M.8`.** The early finite-coefficient étale Chern restriction/corestriction identity inducing ε_m=c_m² and
canonical Kummer torsor base change/norm at all m used by HB.7, including composition and
coefficient automorphism coherence. Only this early Chern interface is requested; do not import the
later Euler-system/Selmer-complex bundle, which may consume Habiro theory.

Consumers: [HabiroNumberFields:HB.7/followup-field-pullback](#HB-7-followup-field-pullback), [HabiroNumberFields:HB.7/followup-local-norm-defect](#HB-7-followup-local-norm-defect), [HabiroNumberFields:HB.7/followup-transfer-norm](#HB-7-followup-transfer-norm).

## Bibliography

**`GSWZ.HabiroNumberField.2024`.** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2). arXiv:2412.04241v2 (27 August 2025; dated 13 August 2025 on p. 1)

**`CGZ.BlochUnits.2021`.** Frank Calegari, Stavros Garoufalidis, Don Zagier. [Bloch groups, algebraic K-theory, units, and Nahm's conjecture](https://arxiv.org/pdf/1712.04887v3). arXiv:1712.04887v3, 6 April 2021 (PDF)

**`Hutchinson.ChernQuantumDilog.2024`.** Kevin Hutchinson. [The Chern class for K_3 and the cyclic quantum dilogarithm](https://arxiv.org/e-print/2104.14413v4). arXiv:2104.14413v4, 27 March 2024

**`Weibel.KBook.2013`.** Charles A. Weibel. [The K-book: an introduction to algebraic K-theory, Chapters IV and V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf). Author-hosted chapter PDFs (Graduate Studies in Mathematics 145, AMS 2013)

**`CGZ.1712.04887v3.fix`.** Frank Calegari, Stavros Garoufalidis, Don Zagier. [Calegari–Garoufalidis–Zagier, Bloch groups, algebraic K-theory, units, and Nahm’s conjecture (v3)](https://arxiv.org/pdf/1712.04887v3). arXiv:1712.04887v3; preprint, not the published Ann. Sci. ENS text.

**`GSWZ.2412.04241v2.fix`.** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. [Garoufalidis–Scholze–Wheeler–Zagier, The Habiro ring of a number field (v2)](https://arxiv.org/pdf/2412.04241v2). arXiv:2412.04241v2; preprint.

**`Hutchinson.2104.14413v4.fix`.** Kevin Hutchinson. [Hutchinson, Chern class and quantum dilogarithm (v4)](https://arxiv.org/pdf/2104.14413v4). 2104.14413v4; arXiv preprint, not a separately inspected published edition.

**`CGZ.published`.** Frank Calegari, Stavros Garoufalidis, Don Zagier. [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://math.uchicago.edu/~fcale/papers/CGZ.pdf). Ann. Sci. Éc. Norm. Supér. 56 (2023), 383–426; author-hosted version of record, DOI
10.24033/asens.2537

**`CGZ.BlochUnits.Published.2023`.** Frank Calegari, Stavros Garoufalidis, Don Zagier. [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://www.math.uchicago.edu/~fcale/papers/CGZ.pdf). Annales scientifiques de l’École normale supérieure 56 (2023), 383–426, DOI 10.24033/asens.2537;
published author-hosted PDF

**`CGZ.BlochUnits.ArXivV3.2021`.** Frank Calegari, Stavros Garoufalidis, Don Zagier. [Bloch groups, algebraic K-theory, units, and Nahm’s conjecture](https://arxiv.org/pdf/1712.04887v3). arXiv:1712.04887v3 (2021), used to collate the parent

**`Sutherland.HerbrandUnits.2021`.** Andrew V. Sutherland. [18.785 Lecture 24: Artin reciprocity in the unramified case](https://math.mit.edu/classes/18.785/2021fa/LectureNotes24.pdf). MIT 18.785, Fall 2021, Lecture 24, Herbrand unit theorem passage

**`GZ.published`.** Stavros Garoufalidis, Don Zagier. [Asymptotics of Nahm sums at roots of unity](https://people.mpim-bonn.mpg.de/stavros/publications/printed/asymptotics_of_nahm_sums_at_roots_of_unity.pdf). Ramanujan J. 55 (2021), 219–238; author-hosted version of record, DOI 10.1007/s11139-020-00266-x

**`Hutchinson.2013`.** Kevin Hutchinson. [A Bloch–Wigner complex for SL₂](https://arxiv.org/pdf/1107.0264v2). arXiv:1107.0264v2 (18 January 2013), author preprint for J. K-Theory 12 (2013), 15–68; not the
version of record

**`Hutchinson.2024`.** Kevin Hutchinson. [The Chern class for K₃ and the cyclic quantum dilogarithm](https://arxiv.org/pdf/2104.14413v4). arXiv:2104.14413v4 (27 March 2024), author preprint for J. Algebra 649 (2024), 433–443; publisher
abstract inspected, full version of record unavailable

**`Soule.thesis`.** Christophe Soulé. [Groupes arithmétiques et K-théorie des anneaux d’entiers de corps de nombres](https://www.ihes.fr/~soule/documents/These_Christophe_Soule.pdf). Author-hosted thesis transcription; relevant étale-Chern text in second part §§2.2.2.3–2.2.5, not a
separately inspected Inventiones version of record

**`GSWZ.v2`.** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2). arXiv:2412.04241v2, 27 August 2025 (preprint)

**`Wagner.qWitt.v5`.** Ferdinand Wagner. [q-Witt vectors and q-Hodge complexes](https://arxiv.org/pdf/2410.23078v5). arXiv:2410.23078v5 (preprint)

**`Wagner.Habiro.v2`.** Ferdinand Wagner. [q-Hodge complexes over the Habiro ring](https://arxiv.org/pdf/2510.04782v2). arXiv:2510.04782v2 (preprint)

**`GSWZ.HB7.v2`.** Stavros Garoufalidis, Peter Scholze, Campbell Wheeler, Don Zagier. [The Habiro ring of a number field](https://arxiv.org/pdf/2412.04241v2). arXiv:2412.04241v2, posted 27 August 2025, PDF dated 13 August 2025

**`Wagner.Thesis.HB7`.** Ferdinand Wagner. [q-Hodge filtrations, Habiro cohomology, and ku](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf). Author-hosted thesis PDF fetched 6 October 2026; this record identifies the exact bytes, not an
inferred arXiv version

**`BouisGazda.Cyclosyntomic.v1`.** Tess Bouis, Quentin Gazda. [The cyclosyntomic regulator of a number field](https://arxiv.org/pdf/2602.21894v1). arXiv:2602.21894v1, 25 February 2026
