# Global Galois duality and compact coefficients — blueprint

This blueprint covers stages R02.1–R02.6, D7 and D8, within the boundaries RS-08 accepted. It has
two checkpoints so far.
- **R02.1**, the passage from finite discrete coefficients to compact p-adic ones, follows Rubin,
  *Euler systems*, Appendix B §2 and Chapter I §2; the Stacks Project (derived limits); and
  Harpaz–Wittenberg, *The Massey vanishing conjecture for number fields*, Lemma 5.5, which the
  maintainer added to this layer.
- **R02.3** and the finite-module part of **R02.4** follow Milne, *Arithmetic Duality Theorems*,
  Chapter I §§1, 2, 4 and 5, with Harpaz–Wittenberg §3 Remark 3.1 and §7 for the items the
  maintainer added to R02.4.

R02.2, R02.5, R02.6, D7 and D8 are not yet read.

## Purpose

Arithmetic applications use Galois cohomology with coefficients in a lattice T, its rationalisation
V = T[1/p], and the discrete quotient W = V/T. Tau Ceti's ProfiniteCohomology treats discrete
coefficients. This layer makes the compact and rational cases rigorous:
- inverse limits and their lim¹ terms;
- Tate's comparison with finite levels;
- continuous sections;
- rationalisation.

These are exactly the inputs that SelmerIwasawaCohomology:L0 (the p-adic Kummer identification) and
EulerSystemsCyclotomicMainConjecture:L0 (Kummer classes) request.

The global layers then prove Tate's theorems for the Galois group G_{K,S} of the maximal extension
unramified outside S: finiteness, Poitou–Tate duality with its nine-term sequence, the
cohomological dimension with the real-place exceptions, and the global Euler characteristic. These
are the inputs GlobalGaloisDeformations, OrdinaryAutomorphicFormsAndModularityLifting,
SelmerIwasawaCohomology and NoncommutativeAndEquivariantIwasawa request from R02.3 and R02.4.

## Ownership (RS-08)

R02.1 keeps:
- the compact-lattice, rational and discrete-quotient comparisons;
- the Mittag-Leffler and Milnor lemmas, with lim¹ retained;
- the cochain and topology comparisons, rationalisation, and completed-tensor hypotheses.

It reuses Mathlib's `continuousCohomology` carrier and Tau Ceti's discrete theory (ProfiniteCohomology
Layers 3–5 and 8).

R02.3 keeps restricted ramification, arithmetic finiteness, cohomological dimensions and
compact-support localisation, with the modified archimedean terms at 2. R02.4 keeps the actual
finite and lattice Poitou–Tate proof, reciprocity and the nine-term sequence. It reuses the discrete
InternalHom and evaluation pairing; a perfect local pairing does not by itself prove the global
theorem. ClassFieldTheory owns local Tate duality, the local Euler characteristic, the Brauer
sequence and the global class formation. ProfiniteCohomology owns continuous cohomology, Shapiro,
Hilbert 90, cup products and cohomological dimension. Both are imported through `requests`.

## What the libraries supply

**Mathlib supplies:**
- `continuousCohomology` of a topological representation, through homogeneous cochains;
- `CategoryTheory.Functor.IsMittagLeffler` for functors to types;
- `continuous_pi_iff`.

**Tau Ceti supplies** `TauCeti.homAction`: the conjugation action on `M →+ N`, which is continuous
for finite discrete M.

For the global layers:
- **Mathlib** has:
  - the absolute Galois group and the infinite Galois correspondence;
  - S-integers and S-units (`Set.integer`, `Set.unit`) and `ClassGroup`;
  - Hermite's theorem `NumberField.finite_of_discr_bdd`;
  - restricted products with their topology, and `PontryaginDual`;
  - Tate cohomology of finite groups;
  - `Abelian.Ext` in any abelian category with enough injectives, which Grothendieck categories
    have.
- **Tau Ceti** has:
  - the category `DiscreteRep` of discrete modules;
  - `InternalHom` with its evaluation pairing;
  - the Kummer coefficients and the Kummer sequence;
  - the periodicity of Tate cohomology of a cyclic group, and the Herbrand quotient of a finite
    module;
  - Artin's induction theorem.

**Missing:** everything below. The library audit records R02.3 and R02.4 as not built.

## Conventions

- Towers are ℕ-indexed inverse systems (A_n, φ_n : A_{n+1} → A_n).
- lim and lim¹ are the kernel and cokernel of the shift ∏A_n → ∏A_n, and they compute R⁰lim and
  R¹lim.
- Continuous cochains are inhomogeneous: Maps(Gⁱ, T), continuous for the coefficient topology.
- Hom_pt(C, A) carries the pointwise topology.
- K is a number field, S a set of places containing the archimedean ones, K_S the maximal
  extension unramified outside S, G_S = Gal(K_S/K), and R_{K,S} the ring of S-integers.
- H^r(K_v, M) is Tate cohomology Ĥ^r(G_v, M) at an archimedean v, so H⁰(ℝ, M) = M^G/NM. At a finite
  v it is continuous cohomology.
- P^r_S is the restricted product of the H^r(K_v, M) with respect to the unramified classes, and
  Ш^r_S is the kernel of H^r(G_S, M) → P^r_S.
- M^D = Hom(M, E_S), which is Hom(M, μ_{#M}) when #M is a unit in R_{K,S}.
- The global Euler characteristic uses ordinary cohomology, including H⁰(G_v, M) at real places.

## R02.1. Topological coefficients and inverse limits

Module `TauCeti/RepresentationTheory/Homological/ContCohomology/Compact`, namespace
`TauCeti.CompactCoefficients`.

### Derived limits

**Construction: lim and lim¹** (`Tower.lim`, `Tower.limOne`; node `lim-one`; planet "Derived
limits").

*API.*
- `mem_lim`.
- `limOne_subsingleton_of_surjective`.

*Unit tests.*
- The tower ℤ/p^{n+1} ↠ ℤ/p^n has lim¹ = 0.
- Non-example: ℤ ←(·p) ℤ has lim = 0 and lim¹ ≅ ℤ_p/ℤ.
- The constant tower has lim equal to the diagonal.

**Construction: Mittag-Leffler towers** (`Tower.IsMittagLeffler`; node `mittag-leffler`).

*API.*
- `isMittagLeffler_of_surjective`.
- `isMittagLeffler_of_finite`.
- `isMittagLeffler_iff_functor`: agreement with Mathlib's notion.

*Unit tests.*
- Finite towers are Mittag-Leffler.
- Towers with surjective transitions are Mittag-Leffler.
- Non-example: multiplication by p is not Mittag-Leffler.

**Lemma: Mittag-Leffler kills lim¹** (`limOne_subsingleton_of_isMittagLeffler`; node
`mittag-leffler-lim-one`); Stacks Lemma 15.88.1.

**Theorem: the six-term sequence** (node `lim-one-six-term`). 0 → lim A → lim B → lim C → lim¹A →
lim¹B → lim¹C → 0.

**Theorem: the Milnor sequence** (node `milnor-sequence`; planet). For towers of complexes with
surjective transitions: 0 → lim¹ H^{p−1} → H^p(lim) → lim H^p → 0 (Stacks Lemma 15.88.10).

### Continuous cochains and the canonical carrier

**Lemma: lifting cochains** (`exists_lift_continuous`; node `cochain-lifting`). Continuous maps from
a compact totally disconnected space lift along finite surjections. So cochain towers have
surjective transitions.

**Lemma: cochains into limits** (node `cochains-inverse-limit`). C^•(G, lim T_n) = lim C^•(G, T_n).

**Theorem: carrier comparison** (node `carrier-comparison`). Mathlib's `continuousCohomology`
agrees with inhomogeneous continuous cochains for compact and rational coefficients. This extends
ProfiniteCohomology Layer 3.

**Theorem: Tate's inverse-limit theorem** (node `tate-inverse-limit`; planet). Its content:
- the sequence 0 → lim¹ H^{i−1}(G, T_n) → H^i(G, T) → lim H^i(G, T_n) → 0;
- H^i(G, T) = lim H^i(G, T_n) when every H^{i−1}(G, T_n) is finite (Rubin Proposition B.2.3).

**Lemma: continuous sections** (node `continuous-section-exists`). A continuous section exists in
each of these cases (Rubin Remark B.2.2):
- the quotient is discrete;
- the kernel is open;
- the module is a finitely generated ℤ_p-module;
- the module is a finite-dimensional ℚ_p-space.

**Theorem: long exact sequences** (node `continuous-section-long-exact`). With a continuous section,
continuous cochains form a short exact sequence, and there is a long exact sequence (Rubin Definition
B.2.1).

### Rationalisation and the discrete quotient

**Lemma: cochains into V land in a lattice** (`exists_pow_smul_mem_lattice`; node
`compact-cochain-bounded`).

**Theorem: rationalisation** (node `rationalization`; planet). H^i(G, T) ⊗ ℚ_p ≅ H^i(G, V), and
H^i(G, T) has no divisible elements (Rubin Proposition B.2.4).

**Lemma: the discrete quotient** (node `discrete-quotient-colimit`). H^i(G, W) = colim_n
H^i(G, W[p^n]).

**Lemma: torsion of H¹(T)** (node `lattice-torsion-sequence`). V^G → W^G → H¹(G, T)_tors → 0, and
ker(H¹(T) → H¹(V)) = H¹(T)_tors (Rubin Lemma I.2.2).

### Pointwise Hom and the splitting torsor

This is Harpaz–Wittenberg's Lemma 5.5, corrected.

**Construction: Hom_pt** (`HomPt`; node `pointwise-hom`). The pointwise topology and the
conjugation action.
- `continuous_eval`: evaluation is jointly continuous.
- `discreteTopology_of_fg`: finitely generated C gives the discrete topology.
- `homPt_equiv_internalHom`: for finite C this is Tau Ceti's InternalHom.

*Unit tests.*
- Hom_pt(ℤ, A) ≅ A.
- Finitely generated C gives the discrete topology.
- Non-example: Hom_pt(⊕_ℕ 𝔽₂, 𝔽₂) = 𝔽₂^ℕ is not discrete.

**Construction: the splitting torsor** (`Sections`, `splittingClass`; node `splitting-torsor`).
The sections form a continuous Hom_pt(C, A)-torsor. The cocycle is γ(g) = g s g⁻¹ − s, and its class
vanishes iff there is an equivariant section.

*Unit tests.*
- An equivariantly split sequence has class 0.
- A = 0 gives class 0.
- Harpaz–Wittenberg's counterexample for discrete Hom.

**Theorem: ∂ = cup with the torsor class** (node `connecting-cup-formula`). ∂[c] = [γ ∪ c], by a
cochain computation; no Ext interpretation is claimed.

**Lemma: the finitely generated case** (node `discrete-hom-finitely-generated`). For finitely
generated C, the printed Lemma 5.5 holds with discrete Hom.

## R02.3. Global finiteness and cohomology with restricted ramification

Module `TauCeti/NumberTheory/GaloisCohomology/RestrictedRamification`, namespace
`TauCeti.RestrictedRamification`; P-class formations in
`TauCeti/RepresentationTheory/Homological/ClassFormation/Duality`, namespace
`TauCeti.ClassFormation`. The source is Milne, Chapter I §4, pp. 48–51.

### The group G_{K,S}

**Construction: K_S and G_{K,S}** (`maxUnramifiedOutside`, `galoisGroupS`; node
`restricted-ramification-group`; planet "The Galois group G_{K,S}"). K_S is the compositum of the
finite extensions of K in K^s unramified outside S, G_S = Gal(K_S/K), and R_{K,S} is the ring of
S-integers. P is the set of primes ℓ with ℓ^∞ dividing [K_S : K]; it contains every unit of R_{K,S}.

*API.*
- `mem_maxUnramifiedOutside_iff`: a finite L lies in K_S iff it is unramified outside S.
- `isGalois_maxUnramifiedOutside`, and `toGaloisGroupS_surjective`: G_K ↠ G_S with kernel H_S.
- `maxUnramifiedOutside_mono`: S ⊆ S′ gives G_{S′} ↠ G_S.
- `maxUnramifiedOutside_of_le`: F_S = K_S for finite F ⊆ K_S.
- `cyclotomic_le_maxUnramifiedOutside`: K(μ_{ℓ^∞}) ⊆ K_S when S contains the places above ℓ.

*Unit tests.*
- K = ℚ, S = {∞}: G_S = 1 (Minkowski).
- K = ℚ, S = {2, ∞}: ℚ(i), ℚ(√2) and ℚ(ζ_{2^n}) lie in K_S.
- Non-example: ℚ(√3) is not in ℚ_{{2,∞}}.
- S = all places gives Mathlib's absolute Galois group.

**Theorem: Hermite** (node `hermite-unramified-outside-finite`). Only finitely many extensions of
K of bounded degree are unramified outside a finite S. The discriminant is bounded through the
different-exponent bounds, and Mathlib's `NumberField.finite_of_discr_bdd` finishes.

**Theorem: finiteness of H¹** (node `h1-finite`; planet). For S finite and M finite of any order,
H¹(G_S, M) is finite; in particular Hom(G_{F,S}, 𝔽_p) is finite, which is GlobalGaloisDeformations'
Φ_p request. The proof is inflation–restriction and Hermite. Finiteness of H² needs Poitou–Tate and
is in R02.4.

### Localisation

**Construction: localisation maps** (`locMap`, `localCohomology`, `unramifiedSubgroup`; node
`localisation-maps`). loc_v : H^r(G_S, M) → H^r(K_v, M), with Tate cohomology at the archimedean
places, and the unramified classes H^r_un(K_v, M) at finite places.

*API.*
- `locMap_indep`: the map does not depend on the embedding K^s ↪ K_v^s.
- `locMap_delta`: it commutes with connecting maps.
- `unramifiedH1Equiv`: H¹_un ≅ H¹(g_v, M); `unramifiedSubgroup_two_eq_bot`: H²_un = 0 for finite M.
- `locMap_eq_restriction`: it is ArithmeticGaloisRepresentations R01.2's placewise restriction.

*Unit tests.*
- v complex: every H^r(K_v, M) is 0.
- Non-example: v real, M = ℤ/3 gives H⁰(K_v, M) = 0, not ℤ/3.
- v real, M = ℤ/2: every H^r(K_v, M) is ℤ/2.
- H¹_un(K_v, ℤ/m) ≅ ℤ/m; the class of ℚ_2(i) is not unramified.

### S-ideles and the class formation

**Construction: S-ideles, S-units, S-idele classes** (node `s-idele-class-modules`). J_{F,S},
E_{F,S}, C_{F,S} = J_{F,S}/E_{F,S}, U_{F,S}, and the discrete G_S-modules J_S, E_S, C_S, U_S. Lemma
4.1: 0 → C_{F,S} → C_F/U_{F,S} → Pic(R_{F,S}) → 0.

*API.* `sIdeles`, `sUnits`, `sIdeleClasses`, `limitModules`, `sIdeleClasses_exact`,
`pic_eq_bot_of_cofinite`, `sIdeles_all`.

*Unit tests.*
- ℚ with S = {∞}: C_{ℚ,S} ≅ ℝ_{>0}.
- ℚ with S = {2, ∞}: E = {±1} × 2^ℤ.
- Non-example: ℚ(√−5) with S = {∞} has Pic = ℤ/2.
- S = all places gives the idele-class module.

**Lemma: C_S as a quotient of the idele classes** (node `s-idele-class-sequence`). lim Pic(R_{F,S})
= 0 by the principal ideal theorem, so C_S ≅ C^{H_S}/U_S; H^r(G_S, U_S) = 0 for r ≥ 1, because
unramified local units are cohomologically trivial. The principal ideal theorem in its S-form, with
the S-split Hilbert class field, is requested from ClassFieldTheory Layer 13.

**Construction: P-class formations** (`PClassFormation`; node `p-class-formation`). Injective
invariants, isomorphisms on finite layers, and bijectivity on ℓ-primary parts for ℓ ∈ P.

*API.* `ofClassFormation`, `quotient` (P = {ℓ : ℓ^∞ | (G : H)}), `restrict`, `invPrimaryEquiv`,
`fundamentalClass`.

*Unit tests.*
- (Ẑ, ℤ) is a class formation.
- P = ∅ recovers Artin–Tate's class formations.
- Non-example: (ℤ_p, ℤ) is a {p}-class formation but not a class formation.
- The global formation (G_K, C) is a class formation.

**Theorem: (G_S, C_S) is a P-class formation** (node `s-class-formation`; planet). Milne
Proposition 4.2.

**Lemma: S-idele-class reciprocity** (node `s-idele-class-reciprocity`). 0 → D_S(K) → C_S(K) →
G_S^ab → 0 with D_S(K) divisible (Lemma 4.5).

**Theorem: the S-unit Kummer sequence** (node `s-unit-kummer-sequence`; planet). For m a unit in
R_{K,S}: 0 → E_{K,S}/m → H¹(G_S, μ_m) → Pic(R_{K,S})[m] → 0, from the m-divisibility of E_S and
H¹(G_S, E_S) ≅ Pic(R_{K,S}). This serves SelmerIwasawaCohomology:L0.

## R02.4. Poitou–Tate duality

Module `TauCeti/NumberTheory/GaloisCohomology/PoitouTate`, namespace `TauCeti.PoitouTate`; Ext in
`TauCeti/RepresentationTheory/Homological/ContCohomology/Ext`, namespace `TauCeti.DiscreteExt`;
the Euler characteristic in `TauCeti/NumberTheory/GaloisCohomology/GlobalEulerCharacteristic`; the
induction lemma in `TauCeti/RepresentationTheory/Induction/Modular`. The source is Milne, Chapter I
§§0–2 and 4–5.

### Duality for class formations

**Construction: Ext of discrete modules** (`DiscreteExt.Ext`; node `discrete-module-ext`).
DiscreteRep ℤ G is Grothendieck abelian, so Mathlib's `Abelian.Ext` applies.

*API.*
- `extIntEquivCohomology`: Ext^r_G(ℤ, N) ≅ H^r(G, N).
- `yonedaPairing`: Ext^r_G(M, C) × H^s(G, M) → H^{r+s}(G, C).
- `extEquivCohomologyHom`: Ext^r_G(M, N) ≅ H^r(G, Hom(M, N)) when N is divisible by the torsion
  orders of M (Example 0.8).
- `ext_colimit`, `extShapiro`, `ext_isTorsion`.

*Unit tests.*
- For G = 1, Ext¹(ℤ/m, ℤ) = ℤ/m.
- Ext^r_G(ℤ, N) is Mathlib's continuous cohomology.
- Non-example: without divisibility, Ext¹(ℤ/m, ℤ) ≠ H¹(1, Hom(ℤ/m, ℤ)) = 0.
- Ext⁰_G(ℤ, N) = N^G.

**Theorem: Tate's duality for a P-class formation** (node `class-formation-ext-duality`; planet).
α^r(G, M) : Ext^r_G(M, C) → H^{2−r}(G, M)^* is bijective on ℓ-parts for r ≥ 2, and for r = 1, 0
under the conditions on ℤ/ℓ^m (Theorems 1.8 and 1.13, with Lemmas 1.7 and 1.9).

**Theorem: global duality** (node `tate-global-duality`; planet). α^r(G_S, M)(ℓ) is an isomorphism
for r ≥ 1 and α⁰ is surjective for finite M (Theorem 4.6(a)). Part (b) is not planned; see the
source findings.

### Local inputs

**Construction: the dual M^D** (`dual`; node `finite-module-dual`). M^D = Hom(M, E_S), which is
Hom(M, μ_{#M}) when #M is a unit in R_{K,S}.

*API.* `dualEquivHomMu`, `dualPairing` (Tau Ceti's evaluation pairing), `doubleDualEquiv`,
`dual_exact`, `card_dual`.

*Unit tests.*
- (ℤ/m)^D = μ_m.
- μ_m^D = ℤ/m.
- Non-example: over ℚ with S = {∞}, (ℤ/3)^D = 0.
- M^D is Tau Ceti's InternalHom.

**Theorem: archimedean local duality** (node `archimedean-local-duality`). The Tate-cohomology
pairing over Gal(ℂ/ℝ) into ½ℤ/ℤ is perfect, and #H⁰(M)#H⁰(M^D)/#H¹(M) = |#M|_v (Theorem 2.13).

**Theorem: unramified annihilators** (node `unramified-exact-annihilators`). For #M prime to v, the
unramified classes of M and M^D are exact annihilators (Theorem 2.6), by the counting argument the
source mentions, from ClassFieldTheory's local duality and Euler characteristic.

### The nine-term sequence

**Construction: P^r_S and Ш^r_S** (`restrictedProductCohomology`, `beta`, `sha`; node
`restricted-product-cohomology`; planet).

*API.*
- `compactSpace_P0`, `locallyCompactSpace_P1`.
- `restrictedProductCohomology_eq_sum`: for r ≥ 2 the product is a direct sum.
- `sha_map`: functoriality in M and under restriction.
- `finite_restrictedProductCohomology`: finite for S and M finite.

*Unit tests.*
- Ш¹_{{2,∞}}(ℚ, ℤ/2) = 0.
- Ш¹_S(K, ℤ/m) = 0 for S of density > 1/2 (Example 4.11(i)).
- Harpaz–Wittenberg: Ш¹(ℚ, μ_4) = 0, so Ш²(ℚ, ℤ/4) = 0.
- Non-example: over ℚ with S = {3, ∞}, P⁰(ℤ/3) = ℤ/3, not (ℤ/3)²; the archimedean H⁰ is modified.

**Lemma: β¹ is proper** (node `h1-localisation-proper`). Ш¹ is finite (Lemma 4.9).

**Lemma: self-duality of the restricted products** (node `restricted-product-self-duality`).
P^r_S(K, M) is the Pontryagin dual of P^{2−r}_S(K, M^D), which gives the maps γ^r.

**Lemma: Ext into the S-units and S-ideles** (node `ext-units-ideles`). Ext^r(M, E_S) =
H^r(G_S, M^d), and Ext^r(M, J_S) = P^r_S(K, M^d) for r ≥ 1 when M is finite or S is cofinite
(Lemmas 4.12, 4.13). Remark 4.14's counterexample (ℚ, S = {∞}, M = ℤ) is an acceptance test.

**Theorem: Poitou–Tate** (node `poitou-tate`; planet "Poitou–Tate duality"). For M finite of order
a unit in R_{K,S}:
- Ш¹_S(K, M) × Ш²_S(K, M^D) → ℚ/ℤ is perfect and natural in M;
- the nine-term sequence 0 → H⁰(M) → P⁰(M) → H²(M^D)^* → H¹(M) → P¹(M) → H¹(M^D)^* → H²(M) → P²(M)
  → H⁰(M^D)^* → 0 is exact;
- H^r(G_S, M) ≅ ⊕_{v real} H^r(K_v, M) for r ≥ 3.

The proof is the Ext(M^D, −) sequence of 0 → E_S → J_S → C_S → 0. Its first three terms come from
Pontryagin duality, which the source offers as an alternative on p. 62; this avoids Theorem 4.6(b).

### Consequences

**Theorem: global finiteness** (node `global-finiteness`). S finite, #M a unit: every H^r(G_S, M)
is finite (Corollary 4.15).

**Theorem: cohomological dimension** (node `cohomological-dimension-bound`; planet).
cd_ℓ(G_S) ≤ 2 for ℓ a unit in R_{K,S} that is odd, or when K is totally imaginary. For ℓ = 2 and a
real place, H^r(G_S, ℤ/2) ≠ 0 for every r, so cd₂ = ∞.

**Theorem: H² onto local H²** (node `h2-localisation-surjective`). Corollary 4.16.

**Theorem: high-degree cohomology of the S-units** (node `units-cohomology-high-degree`).
Corollary 4.18: H³(K, K^{s×}) = 0, which is Harpaz–Wittenberg's Remark 3.1 input (item 154).

**Theorem: Tate's global Euler characteristic** (node `global-euler-characteristic`; planet). For
S finite and #M a unit in R_{K,S}, χ(G_S, M) = ∏_{v arch} #H⁰(G_v, M)/|#M|_v, with ordinary H⁰.
The proof has two supporting lemmas:
- multiplicativity (node `euler-characteristic-additivity`, Lemma 5.3);
- reduction to cyclic groups of order prime to p (node `modular-cyclic-induction`, Lemma 2.10).
  This rests on Artin's induction theorem and the surjectivity of the decomposition map (node
  `decomposition-map-surjective`).

Footnote 13's example, M = ℤ/2 with S the places over 2 and ∞, gives χ = 2^{−s} and is an
acceptance test.

### Stage order

Finiteness of H², the cohomological dimension and the Euler characteristic are R02.3 targets, but
the source proves them from Poitou–Tate. They are planned in R02.4, and the packet proposes
rescoping the two stages accordingly.

## Source findings

- Harpaz–Wittenberg, Lemma 5.5, is false for C that is not finitely generated. This is already
  recorded as PAPER-HARPAZ-WITTENBERG-23/E10; here it is `known`, and the nodes use the corrected
  form.
- **ArithmeticGaloisDuality/E2** (misprint, new). Milne, proof of Proposition 4.3, p. 50: "When S
  is finite" should read "When S omits only finitely many primes". Lemma 4.1's maps are
  isomorphisms only then; for finite S the class group of R_{F,S} intervenes, as with ℚ(√−5) and
  S = {∞}. The general case that follows covers finite S, so nothing is affected.
- **ArithmeticGaloisDuality/E3** (misprint, new). Milne, p. 55: the unramified classes are defined
  "when v is archimedean"; it should read nonarchimedean, since g_v needs a residue field.
- **ArithmeticGaloisDuality/E4** (gap, known from the author's footnote 11, which reproduces
  W. McCallum's correction). Theorem 4.6(b) needs L sufficiently large: its proof uses
  H³(G_S, ℤ) = 0, which amounts to Leopoldt's conjecture. The planned Poitou–Tate proof does not
  use part (b).

## Requests

**Tau Ceti ProfiniteCohomology:**
- Layer 3: the discrete carrier comparison.
- Layers 4 and 5: colimits, long exact sequences and inflation–restriction.
- Layer 6: conjugation acts trivially.
- Layer 7: Shapiro's lemma.
- Layer 8: low-degree cup products.
- Layer 9: Hilbert 90 for K_S/K.
- Layer 10: the all-degree δ-functor.
- Layer 11: cd_p and its dévissage.
- Layer 12: the graded cup product and its agreement with Yoneda products.

**Tau Ceti ClassFieldTheory:**
- Layer 2: class formations.
- Layer 3: Tate–Nakayama.
- Layer 4: the abstract reciprocity map.
- Layer 5: local duality, finiteness and the local Euler characteristic.
- Layer 6: unramified units are cohomologically trivial.
- Layer 7: units map onto inertia.
- Layer 10: descent for idele classes and the Brauer sequence.
- Layer 11: the global class formation.
- Layer 12: the kernel of global reciprocity.
- Layer 13: the S-split Hilbert class field and the principal ideal theorem, requested as an
  extension of that layer.

**Other Tau Ceti roadmaps:**
- GlobalNumberFields Layers 6–8: ideles, the identity component and extension maps.
- NumberFieldArithmetic Layers 1, 4 and 6: unramified sets, the relative discriminant and the
  different bounds.
- ProfiniteProPGroups Layer 1: supernatural indices.
- RepresentationTheory/InductionRestriction Layer 6: Brauer induction.

**ArithmeticGaloisRepresentations R01.2:** restriction to decomposition groups.

**Served by this checkpoint:**
- GlobalGaloisDeformations: R04.2's Φ_p by `h1-finite`; R04.3–R04.5, G7 and G8 by `poitou-tate`.
- OrdinaryAutomorphicFormsAndModularityLifting: R21.3 by `global-euler-characteristic`.
- SelmerIwasawaCohomology: L0 by `s-unit-kummer-sequence`, and L2 by
  `restricted-ramification-group` and `localisation-maps`.
- NoncommutativeAndEquivariantIwasawa: NE.4's duality by `poitou-tate`.

## Acceptance

- Tate's theorem with the lim¹ term explicit.
- Rationalisation.
- The T, V, W distinction, with each limiting operation.
- The Mittag-Leffler bookkeeping used by SelmerIwasawaCohomology:L0.
- The corrected splitting-torsor formula, with its counterexample test.
- The global duality itself (`tate-global-duality`, from the class formation (G_S, C_S)), not only
  a sum of local pairings.
- The modified archimedean groups in P^r_S and Ш^r_S, and ordinary H⁰ in the Euler characteristic;
  the unit tests at real places separate the two.
- No cd₂ ≤ 2 claim over a field with a real place.
- Poitou–Tate without Theorem 4.6(b).

## Remaining work

- **R02.1:** completed tensor products of coefficients with exactness hypotheses, for Iwasawa
  algebras.
- **R02.2:**
  - continuous Hochschild–Serre (Rubin Proposition B.2.5; Jannsen);
  - restriction/corestriction for compact coefficients;
  - Harpaz–Wittenberg's Remark 3.4 inputs.
- **R02.3:** compactly supported cohomology as the fibre of localisation with the modified
  archimedean terms. Milne Chapter I has no cochain-level version; read Nekovář, *Selmer complexes*,
  §5, or Milne Chapter II §2.
- **R02.4:**
  - the lattice and rational versions of Poitou–Tate through R02.1;
  - Milne Theorem 4.20 and Corollaries 4.7, 4.17 and 4.21 (finitely generated modules, tori, ℤ
    coefficients).
- **R02.5:** the Greenberg–Wiles and Wiles Selmer formulas requested by ArithmeticStatistics and
  OrdinaryAutomorphicFormsAndModularityLifting. They follow from `poitou-tate` and
  `global-euler-characteristic` together with the local conditions.
- **R02.5, R02.6, D7, D8:** as narrowed by RS-08.

## Sources

- K. Rubin, *Euler systems*, author draft.
- The Stacks Project, tags 0594, 0598, 07KW, 07KX, 07KY.
- Y. Harpaz and O. Wittenberg, *The Massey vanishing conjecture for number fields*, author final
  version (§5; §3 Remark 3.1; §7, Lemmas 7.6–7.7).
- J. S. Milne, *Arithmetic Duality Theorems*, second edition, author PDF (version 01.07.06),
  https://www.jmilne.org/math/Books/ADTnot.pdf, read 2026-09-29: Chapter I §§0–2, 4, 5.
