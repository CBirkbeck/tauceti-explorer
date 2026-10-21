# Arithmetic Iwasawa theory and the main conjecture — layers L1–L4 (part L1)

This document is the plan of layers L1–L4 of the roadmap. It continues the accepted planning pass recorded in [the I.8 packet](../packets/IntegralIwasawaTheory--I.8.json): that pass's 26 targets for L1–L4 keep their ids and statements and appear below with the exact suppliers that now discharge them, together with 27 new targets of [this part's packet](../packets/IntegralIwasawaTheory--L1.json). The [suggested Lean file](../suggested/IntegralIwasawaTheory--L1.lean) states what the pinned libraries can already express. Every implementation status is unchecked; "planned" means a complete dependency specification, with supplier limitations and assembly requirements stated explicitly.

**Sources.** Rodrigues Jacinto–Williams, *An introduction to p-adic L-functions* (RJW), Essential Number Theory 4 (2025), journal pages; Sharifi, *Iwasawa Theory* (author notes); Oesterlé, Séminaire Bourbaki 535; Sinnott, Invent. Math. 75 (1984), 273–282; Washington, Invent. Math. 49 (1978), 87–97; Washington, Math. Ann. 214 (1975), 177–193; Ferrero, Math. Ann. 234 (1978), 9–24; Greither, AIF 42 (1992), 449–499; and the merged Tau Ceti roadmap PadicMeasuresIwasawaAlgebras. Full records are in the packet.

## Conventions

- p is a prime and q = p for odd p, q = 4 for p = 2. In RJW's cyclotomic case F_n = ℚ(μ_{p^n}) (n ≥ 1) and F_n^+ its real subfield; in a ℤ_p-extension F_∞/F the n-th layer F_n has degree p^n over F_0 = F. The two indexings differ by one: the ℤ_p-layer j of ℚ(μ_{p^∞})/ℚ(μ_p) is ℚ(μ_{p^{j+1}}). ColemanPowerSeries' level m is ℚ_p(ζ_{p^{m+1}}), RJW's F_{m+1}.
- X is the Galois group of the maximal abelian pro-p extension unramified outside p (and ∞, with I.2's convention at real places for p = 2); Y is the unramified one. I.2 and Sharifi write X for the unramified module and 𝔛 for the p-ramified one; Greither writes Y for the p-ramified one. Each comparison below names its convention.
- U_{n,1}^+ is the group of principal units of the completion of F_n^+ at its prime above p; E_{n,1}^+ and C_{n,1}^+ are the closures in it of the principal global units and of the principal cyclotomic units (closing after intersecting with principal units equals intersecting after closing, by the Teichmüller projection; L1/global-local-dictionary). U_∞^+, E_∞^+, C_∞^+ are inverse limits under norms.
- Λ = ℤ_p⟦Γ⟧ ≅ ℤ_p⟦T⟧ by T ↦ γ − 1 for a chosen topological generator γ; ω_n = (1+T)^{p^n} − 1 and ν_{n,m} = ω_n/ω_m. For G = Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^× and G^+ = G/{±1}, I(G^+) is the augmentation ideal of ℤ_p⟦G^+⟧.
- μ of a power series is the least valuation of its coefficients (π-adic for an o-valued series, or p-adic in ℚ when stated); μ, λ of a module are those of PadicMeasuresIwasawaAlgebras §4.4; μ, λ, ν of a ℤ_p-extension are those of its unramified module (L2/tower-iwasawa-invariants).
- Iwasawa's logarithm log_p is normalised by log_p(p) = 0. Kubota–Leopoldt branches and Iwasawa's power series g(T, θ) follow DirichletPadicLFunctions and I.3's dictionary; at p = 2 the series of an odd character lies in 2o⟦T⟧ and its μ is taken after the factor ½.

## Ownership and suppliers

| Supplier | Used for | Not replanned here |
| --- | --- | --- |
| I.1 and I.2 of this roadmap (part I.1) | Cyclotomic ℤ_p-extensions and layers, completed actions, maximal pro-p extensions, class-field identification, completed global units, weak Leopoldt, minus class modules, Leopoldt's map and defect | The carriers; L1 specialises them to RJW's tower |
| ColemanPowerSeries L0 and L4 | Local cyclotomic tower, real principal cyclotomic limit and the quotient U_{∞,1}^+/C_{∞,1}^+ ≅ Λ(G^+)/I(G^+)ζ_p^+ | The Coleman map and the local quotient theorem |
| PadicMeasuresIwasawaAlgebras (merged Tau Ceti roadmap) layers 2–5 | Amice transforms, structure theorem, invariants, the growth formula with its cutoff, the Euler quotient, limit exactness, topological Nakayama | All Λ-module algebra |
| ClassFieldTheory (Tau Ceti) layers 11–13 | Artin reciprocity, finiteness of the Hilbert class field, norm compatibility of the Artin map, Hasse's norm theorem | Class field theory |
| DirichletPadicLFunctions L1–L3 and I.3 | Kubota–Leopoldt pseudo-measure, Iwasawa's series g(T, θ), Bernoulli/Hurwitz formulas and the all-prime principal residue | The p-adic L-functions |
| DiophantineApproximationAndTranscendence DT.3 (LinearFormsInLogarithms §8.10) | Qualitative p-adic Baker–Brumer for algebraic p-adic units | Transcendence theory |
| I.6 (part I.1) | The relative class number formula | Analytic class number formulas |

## L1. Infinite extensions and class field theory

Build the Iwasawa modules of the cyclotomic tower in RJW's notation (X p-ramified, Y unramified), identify RJW's principal unit closures with I.2's completed global units and with Coleman's real principal towers, and prove the global–local exact sequence

    0 → E_∞^+/C_∞^+ → U_∞^+/C_∞^+ → X_∞^+ → Y_∞^+ → 0

as a sequence of compact ℤ_p⟦G^+⟧-modules, with U/E and not E/U. The maximal pro-p extensions, the class-field identifications and weak Leopoldt are I.2's; limit exactness and topological Nakayama are PadicMeasuresIwasawaAlgebras §5.2 (a merged Tau Ceti roadmap); the local quotient is ColemanPowerSeries L4. This layer adds the dictionary between these suppliers and RJW §13.2–13.4, Iwasawa's rank theorem, and the class-field statements that Greither's §4 uses.

**Planets:** Iwasawa modules X and Y, Iwasawa's rank theorem, Global unit closure, Global-local exact sequence.

**Coverage:** planned. All three remaining items of the parent coverage are discharged: L1/coleman-real-closure-comparison and L1/compact-limit-exactness-application (item 1), L1/global-local-dictionary (item 2), L4/abelian-leopoldt-i2-form (item 3). The module definitions now carry API and tests. Remaining: Instantiate the parent refinement edges at assembly (the accepted I.8 packet is not edited here). p = 2 versions of the RJW sequences need I.2's real sign factors, which I.2 records as open.

### The Iwasawa modules X and Y of an arithmetic tower

**Definition target:** `IntegralIwasawaTheory:L1/rjw-iwasawa-modules` (new in this part).

Let k be a number field inside a fixed algebraic closure, p a prime, and F_∞/k a Galois extension that is the increasing union of finite Galois extensions F_n/k and contains the cyclotomic ℤ_p-extension of F_1; write G = Gal(F_∞/k). Using I.2's maximal abelian pro-p extensions, put M(F) = M_S(F) with S the places above p and ∞ (the p-ramified extension, with I.2's archimedean convention) and L(F) = M_∅(F) (the unramified one), for F equal to F_∞ or to a layer F_n. Define X(F_∞) = Gal(M(F_∞)/F_∞) and Y(F_∞) = Gal(L(F_∞)/F_∞), and at finite level X_n = Gal(M(F_n)/F_n) and Y_n = Gal(L(F_n)/F_n) ≅ Cl(F_n) ⊗ ℤ_p. X(F_∞) and Y(F_∞) are compact ℤ_p⟦G⟧-modules for the conjugation action of the parent L1/conjugation-completed-action. The notation is RJW's: X is p-ramified and Y unramified. I.2 and Sharifi write X (or X_∞) for the unramified module and 𝔛 for the p-ramified one, and Greither writes Y for the p-ramified module; every comparison names the convention it uses. RJW's main case is k = ℚ, F_n = ℚ(μ_{p^n}) for n ≥ 1, p odd, together with the real tower F_n^+.

**Hypotheses and conventions.** p is a prime; for p = 2 the archimedean places in S follow I.2's convention (real places may ramify only if listed).

**Construction or proof.**

1. Specialise I.2/maximal-abelian-pro-p-extensions at E = F_∞ and at E = F_n; no second construction of a maximal extension is made.
2. Transport the conjugation action and its completed extension from the parent node L1/conjugation-completed-action.
3. Identify Y_n with the p-part of the class group by I.2/class-field-identification and, when F_∞ is a cyclotomic ℤ_p-extension of a finite layer, Y(F_∞) with lim Y_n along norms; in I.2's letters Y is X(F_∞) and X is 𝔛_S(F_∞).

**Uses that determine the API.**

- RJW Corollary 13.14, p. 193: the four-term sequence ends X_∞^+ → Y_∞^+ → 0
- RJW Theorem 13.11 and Theorem 13.8, pp. 191–192: X_∞^+ is the module of the main conjecture
- IntegralIwasawaTheory:L2/one-prime-inertia-control: Y_∞ is the module whose coinvariants are the class groups
- EulerSystemsCyclotomicMainConjecture:L4/greither-ray-class-real-fields: Greither's p-ramified module (his Y) is X here

**Proposed API.**

- `TauCeti.IntegralIwasawa.rjwX` (data): X(F_∞) = Gal(M(F_∞)/F_∞), a compact ℤ_p⟦G⟧-module.
- `TauCeti.IntegralIwasawa.rjwY` (data): Y(F_∞) = Gal(L(F_∞)/F_∞), a compact ℤ_p⟦G⟧-module.
- `TauCeti.IntegralIwasawa.rjwX_eq_sRamifiedModule` (compatibility): X(F_∞) is I.2's 𝔛_S(F_∞) for S the places above p and ∞.
- `TauCeti.IntegralIwasawa.rjwY_eq_unramifiedGaloisModule` (compatibility): Y(F_∞) is I.2's unramified module X(F_∞).
- `TauCeti.IntegralIwasawa.restrictXY` (projection): Restriction X(F_∞) → Y(F_∞) is continuous, G-equivariant and surjective, with kernel Gal(M(F_∞)/L(F_∞)).
- `TauCeti.IntegralIwasawa.rjwY_equiv_limit` (characterisation): When F_∞ is a cyclotomic ℤ_p-extension of some F_m, Y(F_∞) ≅ lim_n Cl(F_n) ⊗ ℤ_p along norm maps, as ℤ_p⟦G⟧-modules.
- `TauCeti.IntegralIwasawa.maximal_union` (characterisation): M(F_∞) = ⋃_n M(F_n) and L(F_∞) = ⋃_n L(F_n) for n ≥ 1 in RJW's tower (descent of a finite subextension to a layer).
- `TauCeti.IntegralIwasawa.rjwX_plus` (data): For the real tower, X^+(F_∞^+) and Y^+(F_∞^+) are compact ℤ_p⟦G^+⟧-modules, G^+ = G/⟨c⟩.

**Unit tests.**

- `rjwY_rat_cyclotomic` (computation): For every prime p and the cyclotomic ℤ_p-extension ℚ_∞ of ℚ, Y(ℚ_∞) = 0: ℚ has class number one and its unique prime above p is totally ramified, so every Y_n vanishes by one-prime control.
- `rjwX_rat_base` (degenerate): At the base field ℚ and p odd, X_0 = Gal(M(ℚ)/ℚ) ≅ ℤ_p (the maximal abelian pro-p p-ramified extension of ℚ is ℚ_∞), while Y_0 = 0.
- `rjwX_dyadic_convention` (non-example): For p = 2 and k = ℚ: if the real place may ramify, the maximal abelian pro-2 extension unramified outside 2 is ℚ(μ_{2^∞}) with group ℤ_2^× (torsion ±1); if it may not, it is ℚ_∞ with group ℤ_2. The archimedean convention changes the module.
- `rjwX_ne_rjwY` (non-example): For p odd and F_∞ = ℚ(μ_{p^∞}), rank_Λ X = (p−1)/2 while Y is Λ-torsion, so the two letters cannot be swapped.
- `rjwX_compat_I2` (compatibility): X(F_∞) and Y(F_∞) agree with I.2's 𝔛_S(F_∞) and X(F_∞) as compact modules, including the action.

**Checks.**

- X and Y are never interchanged: for p odd and F_∞ = ℚ(μ_{p^∞}), X has positive Λ-rank while Y is torsion (L1/iwasawa-rank-theorem).
- The finite-level Y_n are p-parts of class groups, not full class groups.

**Prerequisites:** `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`, `IntegralIwasawaTheory:I.2/class-field-identification`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`.

**Sources.**

- Joaquín Rodrigues Jacinto; Chris Williams, §13.2, definitions of M_n, M_n^+, L_n, L_n^+, X_∞, Y_∞ and Remark 13.7, pp. 190–192: Defines the four towers of maximal extensions and the modules X_∞ (p-ramified) and Y_∞ (unramified), with their completed Galois action by conjugation.
- Romyar Sharifi, Definition 3.2.2 and Remark 3.2.5, pp. 78–79; Definition 3.3.1, p. 83: Uses the opposite letters: X_∞ is the unramified module and 𝔛_∞ the p-ramified one.

**Planet:** Iwasawa modules X and Y.

### The classical X and Y modules

**Comparison target:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization` (target of the I.8 pass, id unchanged).

For odd p let F_n=Q(μ_(p^n)), n≥1, and use the common algebraic closure and maximal pro-p extensions from I.2. Specialize M_n to the maximal abelian extension unramified outside p and L_n to the everywhere-unramified one. With F∞=∪F_n, identify M∞=∪M_n, L∞=∪L_n and X∞=Gal(M∞/F∞), Y∞=Gal(L∞/F∞) with the corresponding I.2 carriers; Y∞≃lim_N Cl(F_n){p}. The same comparisons hold over the real tower.

**Hypotheses and conventions.** For the finite-layer description of X, M_n contains F∞ because F∞/F_n is abelian pro-p and p-ramified. Infinite-layer finite subextensions descend after enlarging n.

**Construction or proof.**

1. Use universal properties and descent of finitely many defining equations to identify the composita; distinguish unions of finite-layer maximal extensions from an arbitrary closure.
2. Apply finite reciprocity, corestriction/norm compatibility and the universal property of the profinite inverse limit.
3. At real layers p is odd, so no new complexification ramification appears in the pro-p extensions.

**Checks.**

- Do not exchange X and Y: X is p-ramified and Y is everywhere-unramified.
- The comparison is an isomorphism of compact modules with the stated norm/restriction maps.

**Prerequisites:** `IntegralIwasawaTheory:I.2`, `IntegralIwasawaTheory:L0/compatible-cyclotomic-tower`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L1/rjw-iwasawa-modules`, `IntegralIwasawaTheory:L1/global-local-dictionary`; exact suppliers `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`, `IntegralIwasawaTheory:I.2/class-field-identification`. The stage-level prerequisite I.2 is bound to I.2/maximal-abelian-pro-p-extensions and I.2/class-field-identification; the module definitions carry the API and tests.

**Sources.**

- RJW, §13.2, definitions of M_n,L_n,M∞,L∞,X∞,Y∞, pp. 190–191; Appendix A, Definition A.2, pp. 199–200: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### The arithmetic completed Galois action

**Comparison target:** `IntegralIwasawaTheory:L1/conjugation-completed-action` (target of the I.8 pass, id unchanged).

For σ∈G=Gal(F∞/Q), define its action on X∞ and Y∞ by conjugation with any lift to the appropriate maximal extension. This is independent of the lift, continuous jointly in σ and x, extends uniquely to Z_p[[G]], and agrees with the inverse-limit action on finite arithmetic quotients. On real layers the action factors through G^+=G/⟨complex conjugation⟩.

**Hypotheses and conventions.** The kernel module being conjugated is abelian. Use I.1/I.2’s profinite extension and arithmetic completed actions.

**Construction or proof.**

1. Two lifts differ by an element of an abelian kernel and hence induce the same conjugation.
2. Check continuity on finite quotients, then apply the existing completed-group-algebra universal property.
3. Compare action and reciprocity on ideals, rather than deducing map compatibility merely from equal group orders.

**Checks.**

- An arbitrary nonabelian kernel would not give lift independence. Test σ acting on a Frobenius ideal class.

**Prerequisites:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `PadicMeasuresIwasawaAlgebras:L1`.

**Exact suppliers after this pass:** exact suppliers `IntegralIwasawaTheory:I.1/arithmetic-compact-action`, `ColemanPowerSeries:L0/principal-completed-action-adapter`. I.1 and I.2 stage prerequisites are bound to I.1/arithmetic-compact-action (lift independence for Γ_K) and extended to G = Gal(F_∞/ℚ) by the same lift argument.

**Sources.**

- RJW, Remark 13.7, pp. 191–192; Proposition 13.13, p. 193: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Iwasawa's rank theorem for the p-ramified module

**Theorem target:** `IntegralIwasawaTheory:L1/iwasawa-rank-theorem` (new in this part).

Let p be odd, F_∞ = ℚ(μ_{p^∞}), Γ = Gal(F_∞/ℚ(μ_p)) and Λ = ℤ_p⟦Γ⟧. Then X(F_∞) (RJW's letter; I.2's 𝔛_S(F_∞)) is a finitely generated Λ-module of rank r_2(ℚ(μ_p)) = (p−1)/2; its plus part X(F_∞)^+ = X^+(F_∞^+) is Λ-torsion, so the rank is carried by the minus part; and Y(F_∞) is Λ-torsion. More generally, for any ℤ_p-extension satisfying weak Leopoldt, rank_Λ X = r_2 of the base field.

**Hypotheses and conventions.** p odd; ^± are the eigenspaces of complex conjugation, which are direct summands because 2 is invertible.

**Construction or proof.**

1. Weak Leopoldt holds for cyclotomic ℤ_p-extensions (I.2/weak-leopoldt, stated there for 𝔛_S), so rank_Λ X = r_2(ℚ(μ_p)) (Sharifi Theorem 3.3.3: compare ℤ_p-ranks of the Γ_n-coinvariants with those of X_n).
2. Plus part: in the limit sequence of L1/compact-limit-exactness-application, U_∞^+ has Λ-rank (p−1)/2 and contains C_∞^+, whose quotient U_∞^+/C_∞^+ ≅ Λ(G^+)/I(G^+)ζ_p is torsion (Coleman); E^+_∞/C^+_∞ is a submodule and Gal(M^+/L^+) a quotient of U^+/C^+, both torsion, and Y^+ is torsion by L2.
3. Y(F_∞) is torsion by the one-prime control and the finiteness of all Y_n (parent L2/class-module-finiteness-torsion with L2/real-cyclotomic-one-prime-tower).

**Checks.**

- For p = 3: rank_Λ X(ℚ(μ_{3^∞})) = 1 and X^+ = 0.
- The rank statement concerns X, not Y; Y is always torsion in a ℤ_p-extension.

**Prerequisites:** `IntegralIwasawaTheory:I.2/weak-leopoldt`, `IntegralIwasawaTheory:I.2/iwasawa-finiteness`, `IntegralIwasawaTheory:L1/compact-limit-exactness-application`, `IntegralIwasawaTheory:L1/coleman-real-closure-comparison`, `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`, `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower`, `IntegralIwasawaTheory:L1/rjw-iwasawa-modules`.

**Sources.**

- Sharifi, Theorem 3.3.3 and Theorem 3.3.4, p. 84: Proves rank_Λ 𝔛_∞ = r_2(F) under weak Leopoldt and proves weak Leopoldt for cyclotomic ℤ_p-extensions.
- RJW, Corollary 13.14, p. 193, and Appendix A, Proposition A.8 and Corollary A.12, pp. 202–206: The four-term sequence and the torsion of Y_∞.

**Planet:** Iwasawa's rank theorem.

### RJW's principal unit closures and I.2's global–local sequence

**Comparison target:** `IntegralIwasawaTheory:L1/global-local-dictionary` (new in this part).

Let p be odd, n ≥ 1, K = F_n^+ = ℚ(μ_{p^n})^+ and 𝔭 its unique prime above p, with completion K_𝔭 of residue field 𝔽_p. Then: (a) I.2's semilocal principal units U(K) are U^+_{n,1} = 1 + 𝔪_𝔭; (b) I.2's completed global units Ē(K), the image of O_K^× ⊗ ℤ_p in U(K), equal RJW's E^+_{n,1} = (closure of O_K^× in O_𝔭^×) ∩ U^+_{n,1}; (c) the same holds with O_K^× replaced by the cyclotomic units D_n^+, giving C^+_{n,1}; (d) I.2/global-local-unit-sequence (a) at K, with S the places above p and ∞, is RJW's sequence (13-1) 0 → E^+_{n,1} → U^+_{n,1} → Gal(M^+_n/L^+_n) → 0 followed by Gal(M_n^+/F_n^+) → Y_n^+ → 0, and these identifications commute with norms and with the action of Gal(F_n^+/ℚ).

**Hypotheses and conventions.** p odd; one prime above p in F_n^+, totally ramified, with residue field 𝔽_p; no real-place sign factor occurs for odd p.

**Construction or proof.**

1. Every element u of O_𝔭^× factors uniquely as ω(u)·⟨u⟩ with ω(u) a (p−1)-th root of unity and ⟨u⟩ ∈ U^+_{n,1}; ⟨u⟩ = (u^{p−1})^{1/(p−1)}, the root taken in the pro-p group U^+_{n,1}.
2. The closure C of a subgroup V ⊆ O_𝔭^× meets U^+_{n,1} in a closed subgroup of a pro-p group, hence a ℤ_p-module; so ⟨C⟩ ⊆ C ∩ U^+_{n,1} ⊆ ⟨C⟩, and ⟨C⟩ is the image of V ⊗ ℤ_p.
3. Apply this to V = O_K^× and to V = D_n^+; compare with I.2/semilocal-principal-units, whose map kills prime-to-p roots of unity by passing to the pro-p completion.
4. Read off (13-1) from I.2/global-local-unit-sequence (a) and Galois theory of L_n^+ ⊆ M_n^+, and check norm and Galois compatibility on generators.

**Checks.**

- A closure followed by intersection with principal units is not assumed equal to an intersection followed by closure; the equality is proved by the Teichmüller projection.
- For p = 2 the sequence needs real sign factors (I.2) and is not covered here.

**Prerequisites:** `IntegralIwasawaTheory:I.2/semilocal-principal-units`, `IntegralIwasawaTheory:I.2/global-local-unit-sequence`, `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`, `IntegralIwasawaTheory:L0/cyclotomic-unit-group`.

**Sources.**

- Joaquín Rodrigues Jacinto; Chris Williams, Definition 13.12 and Proposition 13.13 with sequence (13-1), p. 193: Defines E_n as the closure of the global units in the local units and E^+_{n,1} as its principal real part, and states the reciprocity sequence (13-1).
- Romyar Sharifi, Theorem 1.5.4, p. 29; Proposition 3.3.6, p. 86: Gives the global–local exact sequence with the pro-p completion of the global units.

### Principal global unit closures in the real tower

**Construction target:** `IntegralIwasawaTheory:L1/principal-global-unit-closures` (target of the I.8 pass, id unchanged).

For F_n^+ and its unique p-adic place, let U_n^+ be the local principal unit group. Let E_(n,1)^+ be the global integral units whose local image lies in U_n^+, and let Ebar_n^+ be their closure there. Take Cbar_n^+ to be Coleman’s closure of the principal intersection of D_n^+. Set E∞^+=lim_N Ebar_n^+, U∞^+=lim_N U_n^+, C∞^+=lim_N Cbar_n^+, all as compact submodules through the actual global-to-local maps.

**Hypotheses and conventions.** p odd; global units before principal intersection/completion are not Z_p-modules. At the single p-adic place the local embedding and root indexing agree with Coleman L4.

**Construction or proof.**

1. Use the finite global-to-local map and principal-unit preimage, then take topological closure.
2. Prove norm stability by global norm compatibility and continuity. Import Coleman’s finite and infinite principal cyclotomic closures and identify their maps with these.
3. Construct compact inverse limits; no interchange of closure and inverse limit is asserted without the canonical comparison.
4. For the global closure rank, apply L4 abelian Leopoldt to F_n^+ and the finite-index principal-unit subgroup. The closure construction and compactness do not themselves imply logarithmic injectivity.

**Uses that determine the API.**

- IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence: Defines its actual closed submodules and quotient maps.
- IntegralIwasawaTheory:L3/vandiver-unit-closure: The index formula is transferred to these principal closures.

**Proposed API.**

- `TauCeti.IntegralIwasawa.principalGlobalUnits_preimage` (characterisation): E_(n,1)^+ is the preimage of U_n^+ under the integral-unit embedding.
- `TauCeti.IntegralIwasawa.globalUnitClosure_norm` (functoriality): Norm sends Ebar_(n+1)^+ into Ebar_n^+ and commutes with its inclusion in U_n^+.
- `TauCeti.IntegralIwasawa.cyclotomicClosure_le_global` (structure): Cbar_n^+≤Ebar_n^+ and C∞^+≤E∞^+ as closed submodules.
- `TauCeti.IntegralIwasawa.principalClosure_coleman` (compatibility): The C∞^+ comparison is a topological Λ-linear isomorphism with Coleman’s real principal cyclotomic limit, preserving inclusion into U∞^+.
- `TauCeti.IntegralIwasawa.principalGlobalUnitClosure_rank` (compatibility): Using abelian Leopoldt for F_n^+, the rationalized closure has dimension [F_n^+:Q]−1, while the local principal units have dimension [F_n^+:Q].

**Unit tests.**

- `real_global_rank_p3` (computation): For p=3,n=1, the real field is Q: E_(n,1)^+={1}, while U_n^+=1+3Z_3 is nonzero.
- `sign_not_principal` (non-example): For odd p, the global unit −1 is not in 1+pO; intersect before taking the Z_p-module closure.
- `closure_definition_coleman` (compatibility): The local image of γ_n(a) must first be adjusted/projected to its principal part; its residue is a.
- `global_local_rank_difference` (compatibility): After tensoring with Q_p and abelian Leopoldt, global and local ranks differ by exactly one.

**Checks.**

- The local Z_p-rank is [F_n^+:Q]. L4 abelian Leopoldt proves that the global closure rank is [F_n^+:Q]−1; treat finite torsion explicitly. The rank assertion depends on that theorem, not solely on the closure definition.

**Prerequisites:** `IntegralIwasawaTheory:L0/cyclotomic-unit-group`, `IntegralIwasawaTheory:L0/global-unit-norm-relations`, `ColemanPowerSeries:L4/finite-real-local-unit-subgroup`, `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`, `ColemanPowerSeries:L4/real-principal-cyclotomic-limit`, `IntegralIwasawaTheory:L4/abelian-leopoldt`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L1/global-local-dictionary`, `IntegralIwasawaTheory:L1/coleman-real-closure-comparison`, `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form`; exact suppliers `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`, `ColemanPowerSeries:L4/real-principal-cyclotomic-limit`. Remaining items 1 and 3 of L1: the closures are compared with Coleman's and with I.2's completed units; the rank uses abelian Leopoldt in I.2's form.

**Sources.**

- RJW, Proposition 13.13 and Corollary 13.14, p. 193; corrected principal-unit reading of their proof: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Global unit closure.

### The L1 unit towers are Coleman's real principal towers

**Comparison target:** `IntegralIwasawaTheory:L1/coleman-real-closure-comparison` (new in this part).

Let p be odd. Under ColemanPowerSeries' root-compatible embedding at Coleman level m = n − 1 (Coleman's level m is the field ℚ_p(ζ_{p^{m+1}}), RJW's F_n with n = m + 1), the completion of F_n^+ at its prime above p is identified with Coleman's real local field, and: U^+_{n,1} corresponds to the residue-one part of Coleman's real local units; the L1 closure C̄^+_n (closure of the principal real cyclotomic units D^+_n ∩ U^+_{n,1}) corresponds to Coleman's C^+_{m,1} (closure of the real cyclotomic units intersected with principal units); the limits C_∞^+ ⊆ U_∞^+ correspond to Coleman's real principal cyclotomic limit C_{∞,1}^+ ⊆ U_{∞,1}^+, by a topological ℤ_p⟦G^+⟧-linear isomorphism.

**Hypotheses and conventions.** p odd; G^+ = Gal(ℚ(μ_{p^∞})^+/ℚ) acts on both sides through the cyclotomic character.

**Construction or proof.**

1. Check that the global embedding, the norms and complex conjugation match level by level (ColemanPowerSeries:L4/global-to-local-cyclotomic-embedding).
2. Closure-then-intersection equals intersection-then-closure for the cyclotomic units by the Teichmüller projection of L1/global-local-dictionary (Coleman intersects after closing; RJW closes after intersecting).
3. Pass to inverse limits; equivariance for G^+ is checked on Dirac elements and extended by continuity (Coleman's completed action adapter).

**Checks.**

- Coleman's level index m corresponds to RJW's n = m + 1; a comparison that equates level m with F_m is wrong.
- The comparison is an isomorphism of compact modules preserving the inclusions into the principal local units.

**Prerequisites:** `IntegralIwasawaTheory:L1/global-local-dictionary`, `ColemanPowerSeries:L4/global-to-local-cyclotomic-embedding`, `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`, `ColemanPowerSeries:L4/real-principal-cyclotomic-limit`, `ColemanPowerSeries:L4/finite-real-local-unit-subgroup`, `ColemanPowerSeries:L0/principal-completed-action-adapter`, `IntegralIwasawaTheory:L1/principal-global-unit-closures`.

**Sources.**

- RJW, Definition 11.6 and Theorem 11.7, p. 176; Lemma 12.20 and Theorem 12.23, pp. 186–189; Definition 13.12, p. 193; proof of Corollary 13.16(iii), p. 194: RJW forms C_{n,1} as the closure of D_{n,1} = D_n ∩ V_{n,1} and compares it with the local cyclotomic units used by Coleman's map.
- Sharifi, §6.1, Theorem 6.1.3 and its proof sketch, pp. 157–160: States the local quotient by the closure of the cyclotomic units, in Coleman's normalisation.

### Finite ray reciprocity for principal units

**Theorem target:** `IntegralIwasawaTheory:L1/finite-ray-principal-sequence` (target of the I.8 pass, id unchanged).

For each real cyclotomic layer, reciprocity gives an exact sequence 0→Ebar_n^+→U_n^+→Gal(M_n^+/L_n^+)→0 after passing to the pro-p ray limit and removing the residue-unit prime-to-p factor. Also 0→Gal(M_n^+/L_n^+)→Gal(M_n^+/F_n^+)→Cl(F_n^+){p}→0 is exact. All maps commute with tower norms and Galois action.

**Hypotheses and conventions.** The ray moduli run over powers of the p-adic prime with the real-place convention fixed. p is odd, so sign/residue factors have order prime to p.

**Construction or proof.**

1. Start with the pinned Tau Ceti ray-class exactness and its surjection to the ordinary class group.
2. Use CFT.12 to identify the inverse limit of p-primary ray groups with the maximal p-ramified abelian pro-p Galois group.
3. The local inertia map factors through principal units. Its kernel is the closure of the principal global units, by the intersection of the finite ray kernels; compare all reciprocity normalizations.

**Checks.**

- The quotient on the local side is U/Ebar, not Ebar/U.
- At p=2 the sign argument is unavailable; this odd-prime classical sequence is not substituted for the all-prime I.8 complex.

**Prerequisites:** `IntegralIwasawaTheory:L1/cyclotomic-class-field-specialization`, `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCeti.GlobalNumberFields.rayClassToClassGroup_surjective`, `tauceti:TauCeti.GlobalNumberFields.mulExact_unitsResidueSignHom_residueSignRayClass`, `tauceti:TauCeti.GlobalNumberFields.mulExact_residueSignRayClass_rayClassToClassGroup`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L1/global-local-dictionary`; exact suppliers `IntegralIwasawaTheory:I.2/global-local-unit-sequence`. Remaining item 2 of L1: the sequence is I.2/global-local-unit-sequence (a) specialised to F_n^+.

**Sources.**

- RJW, Definition 13.12, Proposition 13.13 and exact sequence (13-1), p. 193: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Exactness of the limit of RJW's sequences (13-1)

**Lemma target:** `IntegralIwasawaTheory:L1/compact-limit-exactness-application` (new in this part).

For p odd, the inverse limit over n ≥ 1, along norm and restriction maps, of the exact sequences 0 → E^+_{n,1} → U^+_{n,1} → Gal(M_n^+/L_n^+) → 0 and 0 → Gal(M_n^+/L_n^+) → Gal(M_n^+/F_n^+) → Y_n^+ → 0 is exact, giving RJW Proposition 13.13, 0 → E^+_{∞,1} → U^+_{∞,1} → Gal(M_∞^+/L_∞^+) → 0, and 0 → Gal(M_∞^+/L_∞^+) → X_∞^+ → Y_∞^+ → 0. The proof uses that every term is a compact Hausdorff group and every map continuous; the transition maps of E^+_{n,1} need not be surjective.

**Hypotheses and conventions.** All terms carry their profinite topologies; the transition maps are norms on units and restrictions on Galois groups.

**Construction or proof.**

1. Apply the compact inverse-system exactness of PadicMeasuresIwasawaAlgebras §5.2 (built on Tau Ceti ProfiniteProPGroups layer 9) to each short exact sequence.
2. Identify lim Gal(M_n^+/F_n^+) with X_∞^+ and lim Y_n^+ with Y_∞^+ by L1/rjw-iwasawa-modules (maximal_union) and the parent comparison.
3. RJW's justification through Mittag-Leffler for finitely generated ℤ_p-modules is a special case: such modules are compact.

**Checks.**

- No surjectivity of the norm maps on global units is assumed.
- The limit sequence is one of compact ℤ_p⟦G^+⟧-modules with continuous maps.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L5`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs`, `IntegralIwasawaTheory:L1/global-local-dictionary`, `IntegralIwasawaTheory:L1/rjw-iwasawa-modules`, `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`.

**Sources.**

- RJW, Proposition 13.13 and its proof, p. 193: Takes the inverse limit of (13-1) and justifies exactness by Mittag-Leffler.
- PadicMeasuresIwasawaAlgebras (Tau Ceti), §5.2 Compact inverse systems and topological Nakayama: States exactness of limits of compact inverse systems in the form arithmetic uses, citing RJW Proposition 13.13.

### The global-local cyclotomic exact sequence

**Theorem target:** `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence` (target of the I.8 pass, id unchanged).

There is an exact sequence of compact Λ(G^+)-modules 0→E∞^+/C∞^+→U∞^+/C∞^+→X∞^+→Y∞^+→0, with the first map induced by global-to-local inclusion and the middle map induced by reciprocity. The natural intermediate identification is U∞^+/E∞^+≃Gal(M∞^+/L∞^+).

**Hypotheses and conventions.** p odd; use compact Hausdorff terms, closed subgroup images and continuous maps. No surjectivity of unit norm transition maps is assumed.

**Construction or proof.**

1. Apply the existing compact inverse-system lifting theorem to the two finite sequences, using compact fibers of continuous levelwise surjections. Finite generation alone would not prove Mittag–Leffler.
2. Use L1’s arithmetic Galois/compositum comparisons to identify the limits.
3. Apply the closed-subgroup quotient exactness theorem to C∞^+≤E∞^+≤U∞^+, retaining actual quotient maps and their topologies.
4. The needed compatible-lift compactness result is already present in current Tau Ceti, Topology/Compactness/InverseSystem.lean: exists_forall_map_succ_eq_and_forall_eq_of_surjective. Instantiate that result through the existing profinite inverse-system supplier; no new generic exactness theorem is planned here.

**Checks.**

- The resulting quotient is topologically and Λ-linearly identified, not merely abstractly isomorphic.
- For Vandiver the first and last terms vanish, providing the actual module isomorphism in L3.

**Prerequisites:** `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`, `IntegralIwasawaTheory:L1/conjugation-completed-action`, `PadicMeasuresIwasawaAlgebras:L5`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L1/compact-limit-exactness-application`; exact suppliers `PadicMeasuresIwasawaAlgebras:L5`. Remaining item 1 of L1: exactness of the limits is the compact inverse-system statement of PadicMeasuresIwasawaAlgebras §5.2.

**Sources.**

- RJW, Proposition 13.13 and Corollary 13.14, p. 193: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Global-local exact sequence.

### Ray class limits, split-prime quotients and ambiguous classes

**Comparison target:** `IntegralIwasawaTheory:L1/greither-module-dictionary` (new in this part).

Let F be a number field, p a prime and F_∞/F its cyclotomic ℤ_p-extension with Γ = Gal(F_∞/F) and generator γ, T = γ − 1. (a) For each n, Gal(M(F_n)/F_n) is the inverse limit over ν of the p-parts of the ray class groups of F_n of conductor p^ν (with I.2's archimedean convention), and restriction gives an exact sequence 0 → X(F_∞)_{Γ_n} → Gal(M(F_n)/F_n) → Γ_n → 0, Γ_n = Γ^{p^n}. (b) If F is totally real and Leopoldt holds for F (for instance F abelian, by L4), then X(F_∞)_Γ is finite and is isomorphic to the torsion subgroup of Gal(M(F)/F); Greither's A′(F) is the full ray-class limit, not its torsion subgroup, and fits 0 → X(F_∞)_Γ → A′(F) → Γ → 0. If F/ℚ is real abelian with tame subgroup Δ_0 and e_0 its trivial-character idempotent, Δ_0 acts trivially on Γ, so (1−e_0)A′(F) ≅ (1−e_0)X(F_∞)_Γ. This is the projected identity needed in Greither's Theorem 4.11. (c) With L′(F_∞) ⊆ L(F_∞) the maximal subextension in which the primes above p split completely, Gal(L′(F_∞)/F_∞) ≅ Y(F_∞)/D_∞, where D_∞ is the closed submodule generated by the decomposition groups of the finitely many primes above p. (d) For a cyclic extension E/F with group G and inertia groups I_v, Sharifi's nine-term sequence relates ker j_{E/F}, H^1(G, O_E^×), the ambiguous ideal classes Cl_E^G, O_F^×/N O_E^×, ker Σ and coker Σ for Σ: ⊕ I_v → G; Chevalley's ambiguous class number formula #Cl_E^G = h_F·∏_v e_v /([E:F]·[O_F^× : O_F^× ∩ N_{E/F}E^×]) follows.

**Hypotheses and conventions.** For (b), F totally real and δ(F, p) = 0; for (d), E/F cyclic of number fields.

**Construction or proof.**

1. (a) is I.2/class-field-identification (c) at the layer F_n together with Galois theory of F_∞ ⊆ M(F_n); the quotient Γ_n is ℤ_p-free, so the sequence splits as ℤ_p-modules.
2. (b) Leopoldt gives rank_{ℤ_p} Gal(M(F)/F) = 1 + r_2(F) = 1 for F totally real, so X(F_∞)_Γ has rank 0, is finite, and is the torsion of a split extension by ℤ_p. For real abelian F, the cyclotomic extension is abelian over ℚ, so tame conjugation on Γ is trivial; the exact projector 1−e_0 kills this quotient. No definition of A′ is changed.
3. (c) is I.2/class-field-identification (b) with S the primes above p (X′_S), Galois theory and finiteness of the set of primes of F_∞ above p (I.1/tower-ramification).
4. (d) Sharifi Theorem 1.3.16 gives the exact sequence; the ambiguous class number formula is its order count, using the Herbrand quotient of units for cyclic groups, the norm index theorem (ClassFieldTheory layer 12) and Hasse's norm theorem for cyclic extensions (layer 13).

**Checks.**

- For F = ℚ and p odd: Gal(M(ℚ)/ℚ) ≅ ℤ_p and X(ℚ_∞)_Γ = 0.
- The split-prime quotient divides by decomposition groups, not by inertia groups.
- For F=ℚ and p odd, the full A′(ℚ)≅ℤ_p while X(ℚ_∞)_Γ=0. Their unprojected identification is false; the nontrivial tame projection kills Γ.

**Prerequisites:** `IntegralIwasawaTheory:I.2/class-field-identification`, `IntegralIwasawaTheory:I.2/maximal-abelian-pro-p-extensions`, `IntegralIwasawaTheory:I.1/tower-ramification`, `IntegralIwasawaTheory:L1/rjw-iwasawa-modules`, `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.**

- Romyar Sharifi, Theorem 1.3.16, p. 19; Proposition 3.2.19, p. 83; proof of Theorem 3.3.3, p. 84: Gives the cyclic-extension class group sequence with ambiguous classes, the split-prime unramified module and the coinvariant sequence for the p-ramified module.
- Cornelius Greither, §4, definition of A′(F), p. 492; Theorem 4.11 and proof, p. 493: The consumer uses the nontrivial tame-character part. The full ray limit retains a free Γ quotient.

## L2. Control and class-number growth

Plan Iwasawa's growth theorem for an arbitrary ℤ_p-extension: the carrier of ℤ_p-extensions and their layers, ramification (only primes above p, eventually totally), the one-prime exact control Y_n ≅ Y_∞/ω_nY_∞, the general inertia-kernel control with the norm-sum transitions ν_{n,m}, and the formula

    v_p(#Cl(F_n)) = μp^n + λn + ν   (n large, ν ∈ ℤ).

The Λ-module algebra (structure theorem, invariants, Weierstrass theory, the growth formula with its cutoff, the Euler quotient, topological Nakayama) is PadicMeasuresIwasawaAlgebras layers 4–5 and is not replanned; this layer proves that arithmetic towers satisfy its hypotheses. It also gives the tower invariants a definition, the bounded p-rank criterion and its descent along finite extensions, coinvariant evaluation with both dual conventions, and the proof that the real cyclotomic tower satisfies the one-prime hypotheses (used by L1's rank theorem and by L3).

**Planets:** ℤ_p-extension, One-prime control theorem, Iwasawa growth theorem, Iwasawa invariants μ, λ, ν, Bounded p-rank criterion.

**Coverage:** planned. The parent's remaining item (I.1/I.2 identifications, PMIA structure, cutoff-growth and Nakayama contracts) is discharged by L2/zp-extension, L2/zp-extension-ramification, L2/finite-layer-cutoff; L2/coinvariant-evaluation and L2/norm-prank-descent answer incoming requests. No gap remains in L2's scope. Remaining: Apply the refinement edges to the parent nodes at assembly; no mathematical gap remains in this layer's scope.

### ℤ_p-extensions and their layers

**Definition target:** `IntegralIwasawaTheory:L2/zp-extension` (new in this part).

Let F be a number field inside a fixed algebraic closure and p a prime. A ℤ_p-extension of F is a Galois extension F_∞/F with a continuous group isomorphism Gal(F_∞/F) ≅ ℤ_p for the Krull topology. Its n-th layer F_n is the fixed field of Γ^{p^n}, Γ = Gal(F_∞/F); F_n is the unique subextension of degree p^n, F_0 = F, and F_∞ = ⋃ F_n. Write Γ_n = Gal(F_∞/F_n) = Γ^{p^n}. A topological generator γ gives Λ = ℤ_p⟦Γ⟧ ≅ ℤ_p⟦T⟧, T ↦ γ − 1 (PadicMeasuresIwasawaAlgebras §4.5), with ω_n = (1+T)^{p^n} − 1 = γ^{p^n} − 1 and ν_{n,m} = ω_n/ω_m for n ≥ m.

**Hypotheses and conventions.** Topological isomorphism with ℤ_p, not an abstract one; the layers are indexed so that F_0 = F.

**Construction or proof.**

1. Closed subgroups of ℤ_p are 0 and p^nℤ_p, so the Galois correspondence of infinite Galois theory (Mathlib) lists the intermediate fields.
2. The Iwasawa coordinate and the cyclotomic polynomials ω_n are those of PadicMeasuresIwasawaAlgebras layer 4; I.1 specialises them to the cyclotomic case.

**Uses that determine the API.**

- RJW Appendix A, Theorem A.3, p. 200: the growth theorem is stated for an arbitrary ℤ_p-extension
- Sharifi §3.2, Theorem 3.2.13, pp. 81–82: the general growth theorem
- IntegralIwasawaTheory:L4/washington-non-p-part: the cyclotomic ℤ_p-tower whose prime-to-p class groups are bounded

**Proposed API.**

- `TauCeti.IntegralIwasawa.IsZpExtension` (data): The predicate: F_∞/F Galois with a continuous group isomorphism Gal(F_∞/F) ≃ ℤ_p.
- `TauCeti.IntegralIwasawa.zpLayer` (constructor): F_n, the fixed field of Γ^{p^n}.
- `TauCeti.IntegralIwasawa.finrank_zpLayer` (simp): [F_n : F] = p^n.
- `TauCeti.IntegralIwasawa.zpLayer_unique` (characterisation): An intermediate field of finite degree over F is F_n for n = log_p of its degree.
- `TauCeti.IntegralIwasawa.IsZpExtension.compositum` (functoriality): For a finite extension F′/F, F′F_∞/F′ is a ℤ_p-extension and its layers are F′F_n up to a finite shift.
- `TauCeti.IntegralIwasawa.IsZpExtension.cyclotomic` (compatibility): The cyclotomic ℤ_p-extension of I.1 is a ℤ_p-extension with the same layers.

**Unit tests.**

- `isZpExtension_rat_cyclotomic` (computation): The cyclotomic ℤ_p-extension of ℚ is a ℤ_p-extension; for p odd its first layer is the degree-p subfield of ℚ(μ_{p^2}).
- `not_isZpExtension_rat_mu` (non-example): ℚ(μ_{p^∞})/ℚ is not a ℤ_p-extension: its group ℤ_p^× has torsion of order p − 1 (p odd) or 2 (p = 2).
- `zpLayer_zero` (degenerate): F_0 = F.
- `isZpExtension_mu_over_mu_p` (compatibility): For p odd, ℚ(μ_{p^∞})/ℚ(μ_p) is a ℤ_p-extension, the cyclotomic one of ℚ(μ_p), with n-th layer ℚ(μ_{p^{n+1}}).
- `zpExtension_not_unique` (non-example): An imaginary quadratic field has at least two distinct ℤ_p-extensions (cyclotomic and anticyclotomic), so a ℤ_p-extension is not determined by F.

**Checks.**

- Every intermediate field of a ℤ_p-extension is a layer or F_∞ itself.

**Prerequisites:** `mathlib:IsGalois`, `mathlib:krullTopology`, `mathlib:ContinuousMulEquiv`, `mathlib:PadicInt`, `mathlib:InfiniteGalois.fixedField_fixingSubgroup`, `PadicMeasuresIwasawaAlgebras:L4/cyclotomic-weierstrass-polynomials`, `IntegralIwasawaTheory:I.1/cyclotomic-zp-extension`.

**Sources.**

- RJW, Appendix A, Definition A.1 and Example A.2, p. 199: Defines ℤ_p-extensions and their layers F_n with Gal(F_n/F) ≅ ℤ/p^n.
- Sharifi, §3.1, Definition 3.1.1, p. 75: Defines ℤ_p-extensions, their layers F_n and Γ_n.
- Oesterlé, §1, p. 170, and Théorème 2, p. 171: Defines ℤ_p-extensions and states that a compositum with a finite extension is again one.

**Planet:** ℤ_p-extension.

### Ramification in a ℤ_p-extension

**Theorem target:** `IntegralIwasawaTheory:L2/zp-extension-ramification` (new in this part).

Let F_∞/F be a ℤ_p-extension of a number field. (a) Every prime not above p is unramified in F_∞/F, and every archimedean place splits completely. (b) At least one prime above p ramifies. (c) There is m ≥ 0 such that every prime of F_m ramified in F_∞/F_m is totally ramified in F_∞/F_m; for every ramified prime v of F its inertia group I_v ⊆ Γ is open.

**Hypotheses and conventions.** Number field F; p any prime.

**Construction or proof.**

1. (a) For v ∤ p, the image of the local units in the pro-p abelianisation is finite (principal units at v are pro-ℓ, ℓ ≠ p, and the residue units are finite), so I_v is a finite subgroup of ℤ_p, hence trivial; real places: Γ has no element of order 2.
2. (b) If no prime ramified, F_∞ would lie in the Hilbert class field tower's first abelian layer of F, which is finite (finiteness of the class group via ClassFieldTheory layer 12).
3. (c) Each I_v for v | p is a nonzero closed subgroup, hence equal to Γ^{p^{m_v}}; take m = max m_v over the finitely many v | p.

**Checks.**

- In the cyclotomic ℤ_p-extension of ℚ the unique prime p is totally ramified from n = 0.
- An infinite unramified ℤ_p-extension does not exist; at least one inertia group is nonzero.

**Prerequisites:** `IntegralIwasawaTheory:L2/zp-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Sources.**

- Sharifi, Proposition 3.1.9 and Lemma 3.1.10, pp. 76–77: Proves that only primes above p ramify, that some prime ramifies, and that ramification is eventually total.
- RJW, Appendix A, Remark A.4(2), p. 200: Restricts the proof of Theorem A.3 to one totally ramified prime and refers the general reduction to Washington §13.

### Exact control in a one-prime tower

**Theorem target:** `IntegralIwasawaTheory:L2/one-prime-inertia-control` (target of the I.8 pass, id unchanged).

Let F∞/F be a Z_p-extension with exactly one finite prime ramified, totally ramified from F, and no other ramification. For every n, Gal(L∞/F_n)≃Y∞⋊Γ_n through a chosen inertia lift, its closed commutator subgroup is ω_nY∞, and restriction induces a canonical isomorphism Cl(F_n){p}≃Y∞/ω_nY∞, where ω_n=γ^(p^n)−1 and Γ_n=Γ^(p^n).

**Hypotheses and conventions.** L∞ is the maximal everywhere-unramified abelian pro-p extension of F∞, descended as in I.2. Choice of the inertia section affects the semidirect description but not the final quotient map.

**Construction or proof.**

1. The chosen inertia group maps isomorphically to Γ_n because L∞/F∞ is unramified and F∞/F_n is totally ramified at the unique prime.
2. Compute commutators of the abelian kernel with the procyclic section; closure is the image ω_nY∞, compact and hence closed.
3. Kill this inertia group in the maximal abelian quotient to obtain the maximal unramified abelian pro-p extension of F_n. Use reciprocity and the intersection F∞∩L_n=F_n.

**Checks.**

- For the Q-cyclotomic real tower all ramification hypotheses hold.
- With two ramified primes an additional inertia kernel appears; the displayed exact coinvariant formula is not a general Z_p-extension theorem.

**Prerequisites:** `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `PadicMeasuresIwasawaAlgebras:L1`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/zp-extension`, `IntegralIwasawaTheory:L2/zp-extension-ramification`, `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower`; exact suppliers `IntegralIwasawaTheory:I.1/cyclotomic-layers`. The I.1/I.2 stage prerequisites are bound to the general ℤ_p-extension carrier and its ramification theorem.

**Sources.**

- RJW, Proposition 13.15, p. 194; Appendix A, Proposition A.5 and Proposition A.6, pp. 201–202: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** One-prime control theorem.

### Finite generation and torsion of the unramified class module

**Theorem target:** `IntegralIwasawaTheory:L2/class-module-finiteness-torsion` (target of the I.8 pass, id unchanged).

In the one-prime situation, Y∞ is finitely generated and torsion over Z_p[[Γ]], and every Y∞/ω_nY∞ is finite. If Cl(F){p}=0 then Y∞=0, and all finite-layer p-class groups are zero.

**Hypotheses and conventions.** The compact module topology and continuous Λ action are the ones induced by the arithmetic inverse limit.

**Construction or proof.**

1. Exact control at n=0 makes Y∞/(p,γ−1)Y∞ finite, so apply the imported compact Nakayama theorem.
2. The imported elementary-module structure theorem and finite coinvariants rule out a positive Λ-rank.
3. If the base coinvariants vanish, compact Nakayama gives Y∞=0; use control again at every layer.

**Checks.**

- This is an application of compact Nakayama, not a claim that the initial finite class group generates Y∞ over Z_p.

**Prerequisites:** `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/finite-layer-cutoff`; exact suppliers `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`. Topological Nakayama and the structure theorem are bound to PadicMeasuresIwasawaAlgebras §5.2 and §4.2.

**Sources.**

- RJW, Appendix A, Proposition A.6, Lemma A.7 and Proposition A.8, pp. 201–202; Proposition A.10 and Corollary A.12, pp. 203–206: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Eventual ramification and the general inertia kernel

**Theorem target:** `IntegralIwasawaTheory:L2/general-inertia-control` (target of the I.8 pass, id unchanged).

For any Z_p-extension F∞/F, only finitely many primes ramify, they lie above p, at least one ramifies, and for some m every ramified prime is totally ramified in F∞/F_m. With A_m=Cl(F_m){p}, there is an exact arithmetic sequence ker(Σ_m)→(Y∞)_(Γ_m)→A_m→coker(Σ_m)→0, where Σ_m:⊕_(v ramified in F_m)I_v→Γ_m is the sum of the inertia inclusions. At such m, Σ_m is onto; ker(Σ_m) can have positive Z_p-rank.

**Hypotheses and conventions.** All inertia groups and their conjugacy choices are taken in the common maximal extension. No one-prime hypothesis.

**Construction or proof.**

1. Use local tame inertia to rule out infinite ramification outside p in a torsion-free procyclic extension. If no prime ramified, the infinite extension would contradict finiteness of the base class group.
2. Each nonzero closed inertia subgroup of Γ is open; pass beyond their finite indices. Norm maps A_(n+1)→A_n are then onto by reciprocity and ramification.
3. Abelianize the maximal unramified extension over F_m and compare the inertia augmentation map with the class group. Keep the kernel map rather than replacing it by a bounded finite error.

**Checks.**

- If r primes are totally ramified, ker(Σ_m) has Z_p-rank r−1. This discriminates it from the one-prime theorem.

**Prerequisites:** `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/zp-extension-ramification`, `IntegralIwasawaTheory:L1/greither-module-dictionary`; exact suppliers `IntegralIwasawaTheory:I.2/class-field-identification`. The eventual-ramification part is split into L2/zp-extension-ramification; the class-field part is I.2/class-field-identification (d).

**Sources.**

- Sharifi, Proposition 3.1.9 and Lemma 3.1.10, pp. 76–77; Proposition 3.2.11, equation (3.2.1) and Remark 3.2.12, pp. 80–81: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### The norm relation for the inertia-generated kernel

**Theorem target:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation` (target of the I.8 pass, id unchanged).

For m beyond eventual total ramification, H_m=ker(Y∞→A_m) has finite index in Y∞. If n≥m, H_n=ν_(n,m)H_m with ν_(n,m)=ω_n/ω_m=Σ_(i=0)^(p^(n−m)−1)γ^(ip^m). Consequently #A_n=#A_m·#(H_m/ν_(n,m)H_m). Y∞ and H_m are finitely generated torsion Λ-modules with the same μ and λ.

**Hypotheses and conventions.** Use m large enough for surjectivity Y∞→A_m; for application of generic growth increase it beyond the common cyclotomic cutoff.

**Construction or proof.**

1. Choose inertia lifts above each ramified prime mapping to the same γ^(p^m). The kernel H_m is generated by ω_mY∞ and the differences of these lifts and their conjugates.
2. Raising inertia lifts to p^(n−m) powers gives the norm sum ν_(n,m); this proves equality of the closed generated kernels in both directions.
3. The inertia-control sequence makes Y∞/(p,T) finite; compact Nakayama gives finite generation. A positive free Λ-rank would make the displayed transition quotients infinite, so Y∞ is torsion.
4. Use finite index to compare H_m and Y∞; finite kernels and cokernels change eventual cardinalities by a constant, through the imported pseudo-isomorphism calculus.

**Checks.**

- The finite-index submodule is H_m; the transition is ν_(n,m), not ω_n.
- The constant #A_m is retained, even when H_m is pseudo-isomorphic to Y∞.

**Prerequisites:** `IntegralIwasawaTheory:L2/general-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`, `PadicMeasuresIwasawaAlgebras:L4/pseudo-isomorphism`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/finite-layer-cutoff`; exact suppliers `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`. The cutoff-growth contract is discharged by L2/finite-layer-cutoff.

**Sources.**

- Sharifi, Proposition 3.2.11, pp. 80–81; Theorem 3.2.13 and its inertia-generator proof, pp. 81–82: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Arithmetic towers satisfy the growth and Nakayama hypotheses

**Lemma target:** `IntegralIwasawaTheory:L2/finite-layer-cutoff` (new in this part).

Let F_∞/F be a ℤ_p-extension and m as in L2/zp-extension-ramification, and H_m = ker(Y_∞ → Cl(F_m) ⊗ ℤ_p). Then H_m/ν_{n,m}H_m is finite for every n ≥ m, with #Cl(F_n)⊗ℤ_p = #Cl(F_m)⊗ℤ_p · #(H_m/ν_{n,m}H_m); hence the finiteness hypothesis of PadicMeasuresIwasawaAlgebras' growth theorem (finiteness of M/ν_{n,n₀}M for n ≥ n₀) holds for M = H_m with n₀ = m + 1: PMIA uses growthTransition(n,n₀) = ω_n/ω_{n₀−1}, whereas the arithmetic ν_{n,m} is ω_n/ω_m. Thus its cutoff parameter is c = m and d(H_m) ≤ m. In the one-prime totally ramified case, Y_∞/ω_nY_∞ ≅ Cl(F_n) ⊗ ℤ_p is finite for all n, so the cutoff of Y_∞ is −1. Y_∞ and H_m are compact, so topological Nakayama applies to them.

**Hypotheses and conventions.** m beyond eventual total ramification; Y_∞ with the inverse-limit topology.

**Construction or proof.**

1. The norm relation H_n = ν_{n,m}H_m and the order formula are the parent L2/inertia-kernel-norm-relation; finiteness of class groups gives finiteness.
2. PMIA §4.7 uses growthTransition(n,n₀) = ω_n/ω_{n₀−1}. Set n₀ = m + 1 (c = m), so its hfin hypothesis for n ≥ m + 1 is supplied by the stronger arithmetic finiteness for n ≥ m. This gives d(H_m) ≤ m, with no claim that d(H_m) ≤ m − 1.
3. Compactness: Y_∞ is an inverse limit of finite groups; PadicMeasuresIwasawaAlgebras §5.2 states Nakayama for compact modules.

**Checks.**

- The ω_n quotients of Y_∞ can be infinite in a tower with two totally ramified primes; the ν_{n,m} quotients of H_m are finite.
- For M = Λ/(T) and m = 0, ω_n/ω_0 acts as p^n, so its quotients are finite although d(M) = 0. This rules out the erroneous cutoff −1 for this transition convention.
- For M = Λ/(ξ_1), d(M) = 1: ω_n/ω_0 gives an infinite quotient for n ≥ 1, while ω_n/ω_1 gives finite quotients. The one-prime ω_n case still has c = −1 and n₀ = 0.

**Prerequisites:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`, `PadicMeasuresIwasawaAlgebras:L4/delta-and-cyclotomic-submodules`, `PadicMeasuresIwasawaAlgebras:L5`, `IntegralIwasawaTheory:L2/zp-extension-ramification`.

**Sources.**

- Tau Ceti roadmap contributors, §4.7 Cyclotomic polynomials and growth (the cyclotomic cutoff and Iwasawa's growth formula over ℤ_p); §5.2: States the growth formula with transition polynomials ν_{n,n₀} under finiteness of the transition quotients, and topological Nakayama.
- Romyar Sharifi, Proposition 3.2.11 and Theorem 3.2.13, pp. 80–82: Gives the inertia-generated kernel and the norm-sum transitions.

### Iwasawa class-number growth

**Theorem target:** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth` (target of the I.8 pass, id unchanged).

For every Z_p-extension F∞/F there exist μ,λ∈N, ν∈Z and n0 such that v_p(#Cl(F_n))=μp^n+λn+ν for all n≥n0. Here μ and λ are the imported invariants of Y∞=lim_N Cl(F_n){p}, normalized over Z_p[[Γ]], and independent of the chosen topological generator.

**Hypotheses and conventions.** ν is an integer; no sign condition is imposed. The finite groups are p-primary when their orders are written as p-powers.

**Construction or proof.**

1. Use the one-prime control or the general inertia-kernel norm relation, as appropriate.
2. Apply PM L4’s transition-quotient growth theorem to H_m after the cyclotomic cutoff. It includes finite-error stabilization, vertical counts and horizontal eventual growth; do not replan Appendix A’s generic module lemmas.
3. Add v_p(#A_m) to the eventual constant and use invariance of μ,λ under finite index and generator change. At p=2 the generic growth step starts deep enough for its automorphism argument.

**Checks.**

- For the elementary model Λ/(p), the exponent is p^n. For Λ/(T−p), p odd, it is n+1.
- A cyclotomic factor Λ/(T) has infinite ω_n coinvariants but finite ν_(n,m) quotients, demonstrating why the general theorem uses H_m and ν.

**Prerequisites:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`, `PadicMeasuresIwasawaAlgebras:L4/cyclotomic-growth-step`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-8`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/finite-layer-cutoff`, `IntegralIwasawaTheory:L2/tower-iwasawa-invariants`; exact suppliers `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`. The invariants are given their own definition node; the growth formula's hypotheses are discharged.

**Sources.**

- RJW, Appendix A, Theorem A.3, p. 200, Lemma A.9 and Proposition A.10, pp. 203–206, Lemma A.11 and Corollary A.12, pp. 204–206; general arithmetic proof: Sharifi Theorem 3.2.13, pp. 81–82: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Iwasawa growth theorem.

### The Iwasawa invariants μ, λ, ν of a ℤ_p-extension

**Definition target:** `IntegralIwasawaTheory:L2/tower-iwasawa-invariants` (new in this part).

For a ℤ_p-extension F_∞/F with Y_∞ = lim_n Cl(F_n) ⊗ ℤ_p (a finitely generated torsion Λ-module by L2), define μ(F_∞/F) = μ(Y_∞) and λ(F_∞/F) = λ(Y_∞) with PadicMeasuresIwasawaAlgebras' invariants (vertical and horizontal parts of an elementary module pseudo-isomorphic to Y_∞), and ν(F_∞/F) ∈ ℤ the eventual value of e_n − μp^n − λn, where e_n = v_p(#Cl(F_n)). The definition does not depend on the generator γ.

**Hypotheses and conventions.** ν is an integer and may be negative for general elementary models (inherited correction E85); μ, λ ≥ 0.

**Construction or proof.**

1. μ and λ are imported from PadicMeasuresIwasawaAlgebras §4.4 and are independent of the generator (invariants_generator_indep).
2. ν exists by the parent L2/arithmetic-class-number-growth; it is unique because μp^n + λn + ν determines ν once μ and λ are fixed.

**Uses that determine the API.**

- IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero: states μ(F_∞/F) = 0
- IntegralIwasawaTheory:L4/greenberg-p-primary-formulation: states μ = λ = 0
- IntegralIwasawaTheory:L4/washington-non-p-part: contrasts the p-part invariants with the prime-to-p part

**Proposed API.**

- `TauCeti.IntegralIwasawa.towerMu` (data): μ(F_∞/F) = μ(Y_∞).
- `TauCeti.IntegralIwasawa.towerLambda` (data): λ(F_∞/F) = λ(Y_∞).
- `TauCeti.IntegralIwasawa.towerNu` (data): ν(F_∞/F) ∈ ℤ, the eventual value of e_n − μp^n − λn.
- `TauCeti.IntegralIwasawa.classNumber_growth` (characterisation): e_n = μp^n + λn + ν for n large.
- `TauCeti.IntegralIwasawa.towerMu_eq_zero_iff` (characterisation): μ = 0 iff the p-ranks of Cl(F_n) are bounded (parent L2/bounded-p-rank-mu-zero).
- `TauCeti.IntegralIwasawa.towerInvariants_generator_indep` (other): The invariants do not depend on the topological generator of Γ.
- `TauCeti.IntegralIwasawa.towerMu_eq_zero_iff_rank_subexponential` (characterisation): For the arithmetic layer groups A_n, μ = 0 iff p^(−n) r_p(A_n) tends to zero; the elementary-module proof of the bounded-p-rank criterion gives this equivalent form.

**Unit tests.**

- `towerInvariants_rat` (degenerate): For F = ℚ and its cyclotomic ℤ_p-extension, μ = λ = ν = 0 for every p.
- `towerInvariants_regular` (computation): For p = 5 or p = 7 and F = ℚ(μ_p) with its cyclotomic tower, μ = λ = ν = 0: h(ℚ(μ_p)) = 1 and the unique prime above p is totally ramified, so every Y_n = 0.
- `towerLambda_pos_37` (computation): For p = 37 and F = ℚ(μ_37), λ ≥ 1: 37 divides h^-(ℚ(μ_37)), the minus module has no nonzero finite submodule (Sharifi Proposition 3.4.2), so Y_∞ is infinite while μ = 0 by Ferrero–Washington.
- `towerInvariants_use_Y` (non-example): For F = ℚ(μ_p), p odd, the p-ramified module X has Λ-rank (p−1)/2 > 0, so invariants read from X would not satisfy the growth formula; the definition uses the torsion module Y.

**Checks.**

- μ and λ of the arithmetic tower are those of Y_∞, the unramified module, not of the p-ramified module X.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-8`, `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`, `IntegralIwasawaTheory:L2/zp-extension`, `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`.

**Sources.**

- Joaquín Rodrigues Jacinto; Chris Williams, Appendix A, Theorem A.3, p. 200: Iwasawa's theorem gives integers μ, λ, ν with e_n = μp^n + λn + ν for large n.
- Romyar Sharifi, Introduction, p. 5; Theorem 3.2.13, pp. 81–82: Identifies Iwasawa's μ and λ with those of the limit module; ν ∈ ℤ.

**Planet:** Iwasawa invariants μ, λ, ν.

### The bounded p-rank criterion

**Theorem target:** `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero` (target of the I.8 pass, id unchanged).

For a Z_p-extension of number fields, μ(Y∞)=0 if and only if dim_(F_p)(Cl(F_n){p}/pCl(F_n){p}) is bounded independently of n. Equivalently Y∞ is finitely generated over Z_p. This criterion does not say the p-primary class-group orders are bounded unless λ also vanishes.

**Hypotheses and conventions.** The arithmetic module is finitely generated torsion over Z_p[[Γ]] by the preceding control argument.

**Construction or proof.**

1. Pass to H_m of finite index and use its finite quotient A_m to bound changes in p-rank.
2. On each vertical elementary summand Λ/(p^a), the p-rank of the transition quotient is deg ν_(n,m), which tends to infinity. On each horizontal summand it is bounded by the polynomial degree.
3. Finite pseudo-isomorphism errors have bounded p-rank. Thus bounded p-rank is equivalent to absence of vertical factors, and to finite Z_p-generation.

**Checks.**

- If there are s vertical summands, their leading p-rank contribution is s·deg ν, not μ·deg ν.
- For Λ/(T−p), μ=0 and λ=1: p-ranks stay one while orders grow.

**Prerequisites:** `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-1`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/norm-prank-descent`. Used unchanged; L2/norm-prank-descent adds the descent along finite extensions.

**Sources.**

- RJW, Corollary A.13, p. 207; general control from Sharifi Proposition 3.2.11 and Theorem 3.2.13, pp. 80–82: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Bounded p-rank criterion.

### μ-vanishing descends along finite extensions

**Theorem target:** `IntegralIwasawaTheory:L2/norm-prank-descent` (new in this part).

Let F_∞/F be a ℤ_p-extension, F′/F a finite extension and F′_∞ = F′F_∞, a ℤ_p-extension of F′ (L2/zp-extension). For every n the norm Cl(F′F_n) → Cl(F_n) has cokernel isomorphic to Gal((F′F_n ∩ H(F_n))/F_n), of order dividing [F′:F], where H(F_n) is the Hilbert class field. Hence r_p(Cl(F_n)) ≤ r_p(Cl(F′F_n)) + v_p([F′:F]), and μ(F′_∞/F′) = 0 implies μ(F_∞/F) = 0.

**Hypotheses and conventions.** F′/F finite; F′F_n is a layer of F′_∞/F′ up to a bounded shift of index.

**Construction or proof.**

1. Artin reciprocity is compatible with norms (ClassFieldTheory layer 13, artinMap_norm): the image of the norm in Gal(H(F_n)/F_n) is Gal(H(F_n)/H(F_n) ∩ F′F_n).
2. The cokernel has order dividing [F′F_n : F_n] ≤ [F′ : F]; the p-rank of a quotient exceeds the p-rank of the source by at most the p-rank of the cokernel.
3. Bounded p-ranks for F′_∞ give bounded p-ranks for F_∞, and the parent L2/bounded-p-rank-mu-zero converts this into μ = 0.

**Checks.**

- The converse fails in general; Oesterlé Théorème 2 (ii) needs [k′:k] a power of p and splitting conditions.
- The bound uses p-ranks, not orders: orders can grow in F_∞ while bounded by those of F′_∞ only up to a factor.

**Prerequisites:** `IntegralIwasawaTheory:L2/zp-extension`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `IntegralIwasawaTheory:L2/tower-iwasawa-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.**

- Oesterlé, Théorème 2 (i), p. 171: States that μ of the compositum tower vanishing implies μ(K/k) = 0, after Iwasawa.
- RJW, Appendix A, Corollary A.13, pp. 206–207: μ = 0 iff the p-ranks of the class groups are bounded.

### Coinvariant orders and characteristic series at finite evaluation points

**Comparison target:** `IntegralIwasawaTheory:L2/coinvariant-evaluation` (new in this part).

Let O be the ring of integers of a finite unramified extension of ℚ_p (for instance O_χ, generated by the values of a character of order prime to p), Λ_O = O⟦T⟧ with T = γ − 1, and M a finitely generated torsion Λ_O-module with characteristic ideal (f). If M_Γ = M/TM is finite, then M^Γ = M[T] is finite and #M_Γ = #(O/f(0)O) · #M^Γ; in particular #M_Γ = p^{[O:ℤ_p]·v_p(f(0))} when M^Γ = 0. For n ∈ ℤ and the twist M(n) (γ acting by κ(γ)^nγ), char(M(n)) is generated by f(κ(γ)^{−n}(1+T) − 1), so #M(n)_Γ/#M(n)^Γ = #(O/f(κ(γ)^{−n} − 1)O) when finite. Two dual conventions are kept apart: (i) contragredient: the Pontryagin dual of the discrete module Hom_cts(X, ℚ_p/ℤ_p(n)) is X(−n) (γ acting by κ(γ)^{−n}γ) with series f(κ(γ)^n(1+T) − 1), evaluated at κ(γ)^n − 1; (ii) Kolster's covariant convention (γφ)(x) = φ(γx): dualising 𝒯 ⊗ A multiplies the action by u = κ(γ), giving f(u^{−1}(1+T) − 1) evaluated at u^{−1} − 1. Each evaluation formula requires the corresponding value to be nonzero.

**Hypotheses and conventions.** O unramified over ℤ_p (so #O/p^aO = p^{[O:ℤ_p]a}); M finitely generated torsion; the value f(·) at the evaluation point is nonzero.

**Construction or proof.**

1. Apply the Euler quotient at depth n = 0 of PadicMeasuresIwasawaAlgebras §4.7: #M_{Γ}/#M^{Γ} = q^{μ}·#(O/Res(F_M, T)) = #(O/f(0)O), since Res(F_M, T) = ±F_M(0) and f = ϖ^μ F_M up to a unit.
2. Twists: I.1/iwasawa-algebra-coordinate gives char(M ⊗ ℤ_p(n)) = Tw_{−n}(char M), and Tw_{−n} sends T to κ(γ)^{−n}(1+T) − 1.
3. Duals: contragredient double duality gives X(−n). For Kolster's covariant dual B = Hom(A, ℚ_p/ℤ_p), (γφ)(a) = φ(γa), the covariant dual of 𝒯 ⊗ A has γ-action u times that on B, hence is B(+1) in the action convention of this node and has series f(u^(−1)(1+T) − 1). Kolster's label (−1) for this construction is translated by its action, not carried over as the same twist label. The involution ι enters when comparing a dual with the original compact module.

**Checks.**

- For M = Λ/(T − p) over ℤ_p, p odd: #M_Γ = p and M^Γ = 0.
- For M = Λ/(T): M_Γ is infinite, so the formula does not apply; f(0) = 0.
- For M = ℤ_p(1) as a Λ-module (f = T − (κ(γ) − 1)): #M_Γ = p^{v_p(κ(γ)−1)}, while the twist M(−1) is the trivial module ℤ_p with infinite coinvariants.
- For B = ℤ_p with γ acting by a ∈ 1+qℤ_p, the covariant dual of 𝒯⊗A has action ua, characteristic series T−(ua−1), and evaluation ratio v_p(ua−1). Replacing it by action u^(−1)a gives a different ratio and can give infinite coinvariants when a=u.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L4/finite-coinvariants-euler-characteristic`, `PadicMeasuresIwasawaAlgebras:L4/coinvariants-euler-product`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `IntegralIwasawaTheory:I.1/iwasawa-algebra-coordinate`, `IntegralIwasawaTheory:L2/zp-extension`.

**Sources.**

- Tau Ceti roadmap contributors, §4.7, The Euler quotient at finite level: Proves #M_{Γ_n}/#M^{Γ_n} = q^{μp^n}·#(O/Res(F_M, ω_n)) for finite coinvariants, over a general complete discrete valuation ring.
- Romyar Sharifi, Remark 3.3.13, p. 89: Defines Tate twists of Λ-modules by γ ↦ χ(γ)^iγ.

### The real cyclotomic tower is a one-prime totally ramified ℤ_p-extension

**Theorem target:** `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower` (new in this part).

Let p be odd and F_n = ℚ(μ_{p^n}) (n ≥ 1, RJW's indexing). Then F_∞^+/F_1^+ and F_∞/F_1 are the cyclotomic ℤ_p-extensions of F_1^+ = ℚ(μ_p)^+ and F_1 = ℚ(μ_p), with ℤ_p-layer j equal to F_{j+1}^+, resp. F_{j+1}. Each of F_1^+, F_1 has a unique prime above p; it is totally ramified in the whole tower, no other finite prime ramifies, and the real places of F_1^+ split completely. Hence the hypotheses of the parent L2/one-prime-inertia-control hold, and Y_n^+ ≅ (Y_∞^+)_{Γ^+_{n−1}} with Γ^+_{n−1} = Gal(F_∞^+/F_n^+).

**Hypotheses and conventions.** p odd; the shift between the cyclotomic exponent n and the ℤ_p-layer j = n − 1 is explicit.

**Construction or proof.**

1. Gal(ℚ(μ_{p^∞})/ℚ) ≅ ℤ_p^× = μ_{p−1} × (1 + pℤ_p) by the cyclotomic character; F_1 is the fixed field of 1 + pℤ_p and F_∞/F_1 has group 1 + pℤ_p ≅ ℤ_p.
2. (p) = (1 − ζ_{p^n})^{φ(p^n)} in ℚ(μ_{p^n}), so p is totally ramified (ColemanPowerSeries' local cyclotomic Eisenstein criterion); hence so is its unique prime in F_1 and F_1^+.
3. Primes ℓ ≠ p are unramified (I.1/tower-ramification (a)); complex conjugation lies in the torsion of ℤ_p^×, so real places of F_1^+ split.
4. Read RJW Proposition 13.15 as the parent one-prime control at layer j = n − 1.

**Checks.**

- For p = 3, F_1^+ = ℚ and the tower is ℚ_∞.
- A statement indexed by the cyclotomic exponent is translated by j = n − 1 before applying L2.

**Prerequisites:** `IntegralIwasawaTheory:I.1/tower-ramification`, `IntegralIwasawaTheory:I.1/cyclotomic-layers`, `ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein`, `ColemanPowerSeries:L0/local-cyclotomic-irreducible`, `IntegralIwasawaTheory:L2/zp-extension`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`.

**Sources.**

- RJW, Appendix A, Example A.2, p. 199, and Remark A.4(2), p. 200; Proposition 13.15, p. 194: Notes the index shift F_n = ℚ(μ_{p^{n+1}}) for the ℤ_p-layers and that the one-prime hypothesis holds for ℚ(μ_{p^m}) and ℚ(μ_{p^m})^+.
- Sharifi, Proposition 3.1.9, p. 76: Only primes above p ramify in a ℤ_p-extension.

## L3. Vandiver's condition and the notes' special-case proof

Vandiver(p) is the predicate p ∤ h(ℚ(μ_p)^+) on Mathlib's maximal real subfield. Under it, one-prime control (whose hypotheses L2 proves for the real cyclotomic tower, with the index shift between cyclotomic exponent and ℤ_p-layer) and topological Nakayama give Y_∞^+ = 0; the prime-power index formula gives E_∞^+ = C_∞^+; L1 and Coleman's quotient then give the module isomorphism

    X_∞^+ ≅ ℤ_p⟦G^+⟧/(I(G^+)ζ_p)

with a single normalisation of ζ_p, and RJW's Theorem 13.8 in this case. The unconditional theorem belongs to EulerSystemsCyclotomicMainConjecture L4. Vandiver's condition is compared with vanishing of the plus parts through the tower and separated from regularity.

**Planets:** Vandiver’s condition, Vandiver module isomorphism.

**Coverage:** planned. Both remaining items of the parent coverage are discharged by L2/real-cyclotomic-one-prime-tower and L3/coleman-zeta-normalisation; the incoming Vandiver requests are answered by the parent definition and L3/vandiver-plus-part-tower. Remaining: Apply the refinement edges to the parent nodes at assembly; no mathematical gap remains in this layer's scope.

### Vandiver’s condition

**Definition target:** `IntegralIwasawaTheory:L3/vandiver-condition` (target of the I.8 pass, id unchanged).

For an odd prime p, Vandiver(p) means p does not divide h(Q(μ_p)^+), equivalently Cl(Q(μ_p)^+){p}=0. This is a predicate on the prime and the existing maximal real cyclotomic field, not a proved assertion for all primes.

**Hypotheses and conventions.** p is an odd prime; number-field/class-group carriers are the existing ones.

**Construction or proof.**

1. Use L0’s real-field identification to define the class number on the canonical field.
2. Relate p-nondivisibility of the finite class-group order to vanishing of its p-primary subgroup. Do not redefine the general class group or the global conjecture owned by ArithmeticKTheory.

**Uses that determine the API.**

- IntegralIwasawaTheory:L3/vandiver-unramified-vanishing: The base coinvariant group vanishes under this hypothesis.
- ArithmeticKTheory:N.7/vandiver-separation: Imports this single predicate and distinguishes the conjectural and conditional K-theory conclusions.

**Proposed API.**

- `TauCeti.IntegralIwasawa.vandiver_iff_pClassGroup_zero` (characterisation): Vandiver(p) iff the p-primary class group of Q(μ_p)^+ is zero.
- `TauCeti.IntegralIwasawa.vandiver_transport` (equivalence): A Q-isomorphism of the real cyclotomic field preserves the predicate, through the induced class-group isomorphism.
- `TauCeti.IntegralIwasawa.vandiver_base_layer` (compatibility): In the indexing F_n=Q(μ_(p^n)), the predicate concerns n=1, not n=0 where F_0=Q.

**Unit tests.**

- `vandiver_three` (computation): Vandiver(3) holds because Q(μ_3)^+=Q.
- `vandiver_five` (computation): Vandiver(5) holds because Q(√5) has class number one.
- `vandiver_not_regular` (non-example): The predicate tests the real p-class group only; it contains no assumption about an odd character component of the full cyclotomic class group.

**Checks.**

- Every theorem using this predicate carries it as a hypothesis.

**Prerequisites:** `IntegralIwasawaTheory:L0/real-subfield`, `IntegralIwasawaTheory:I.2`, `mathlib:CyclotomicField`, `mathlib:NumberField.maximalRealSubfield`, `mathlib:NumberField.classNumber`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L3/vandiver-plus-part-tower`; exact suppliers `mathlib:NumberField.maximalRealSubfield`. Incoming requests from ArithmeticKTheory N.7 and ArithmeticKTheoryPartII are answered by the parent definition and L3/vandiver-plus-part-tower.

**Sources.**

- RJW, Definition 13.10 and Remark 13.17, pp. 192–194: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Vandiver’s condition.

### Unramified vanishing under Vandiver

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing` (target of the I.8 pass, id unchanged).

If Vandiver(p), then Y∞^+=0 and Cl(F_n^+){p}=0 for every n≥1.

**Hypotheses and conventions.** p odd; the real cyclotomic tower has one prime above p and it is totally ramified from F_1^+.

**Construction or proof.**

1. Apply L2 one-prime control at the base real layer and compact Nakayama, componentwise under the tame finite group if needed.
2. Use control at every n to obtain finite-layer vanishing and hence p∤h(F_n^+).

**Checks.**

- A Λ-generation argument is required; no claim that a finite class group generates Y∞ over Z_p.

**Prerequisites:** `IntegralIwasawaTheory:L3/vandiver-condition`, `IntegralIwasawaTheory:L2/class-module-finiteness-torsion`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`, `PadicMeasuresIwasawaAlgebras:L5`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower`. Remaining item 2 of L3: the one-prime hypotheses are proved for the real tower, with the index shift.

**Sources.**

- RJW, Proposition 13.15 and Corollary 13.16, p. 194: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Vandiver's condition through the tower and its difference from regularity

**Comparison target:** `IntegralIwasawaTheory:L3/vandiver-plus-part-tower` (new in this part).

Let p be odd and F_n = ℚ(μ_{p^n}). The following are equivalent: (i) Vandiver(p), i.e. p ∤ h(ℚ(μ_p)^+); (ii) Cl(F_n^+) ⊗ ℤ_p = 0 for every n ≥ 1; (iii) the plus part (Cl(F_n) ⊗ ℤ_p)^+ (fixed by complex conjugation) vanishes for every n ≥ 1; (iv) Y_∞^+ = 0. Regularity of p (p ∤ h(ℚ(μ_p))) implies these but is strictly stronger: p = 37 is irregular (37 divides the numerator of B_32) and satisfies Vandiver(37).

**Hypotheses and conventions.** p odd; plus parts are taken in the p-part, where 1 + c and 1 − c are orthogonal idempotents up to the unit 2.

**Construction or proof.**

1. (i) ⇒ (ii), (iv): the parent L3/vandiver-unramified-vanishing; (ii) ⇒ (i) is the case n = 1.
2. (ii) ⇔ (iii): for p odd the extension map Cl(F_n^+) ⊗ ℤ_p → Cl(F_n) ⊗ ℤ_p is injective (norm after extension is multiplication by 2) and its image is the plus part ((1 + c)/2 is the projector).
3. (iv) ⇒ (ii): one-prime control (L2/real-cyclotomic-one-prime-tower) identifies Y_n^+ with coinvariants of Y_∞^+.
4. Regularity ⇒ Vandiver since h^+ divides h; the example p = 37 separates them.

**Checks.**

- p = 37: Vandiver holds and regularity fails.
- The equivalence (ii) ⇔ (iii) uses that p is odd; at p = 2 plus parts are not direct summands.

**Prerequisites:** `IntegralIwasawaTheory:L3/vandiver-condition`, `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`, `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower`, `IntegralIwasawaTheory:I.2/cm-minus-class-modules`, `mathlib:NumberField.classNumber`, `mathlib:NumberField.maximalRealSubfield`, `mathlib:CyclotomicField`.

**Sources.**

- RJW, Definition 13.10 and Corollary 13.16, p. 192–194; Remark 13.17, p. 195: Defines Vandiver primes through h_1^+ and proves Y_∞^+ = 0 and p ∤ h_n^+ for all n under it.
- Sharifi, §3.4, Proposition 3.4.1, pp. 89–90: For p odd, plus and minus parts split the p-part of the class group of a CM field.

### Global and circular closures under Vandiver

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-unit-closure` (target of the I.8 pass, id unchanged).

If Vandiver(p), then Ebar_n^+=Cbar_n^+ for all n≥1 and E∞^+=C∞^+. These are equal closed submodules inside the same principal local unit groups.

**Hypotheses and conventions.** p odd; use principal-unit preimages before completion, with the same global-to-local maps as L1 and Coleman.

**Construction or proof.**

1. The integer unit index formula gives [V_n^+:D_n^+]=h(F_n^+) prime to p.
2. Intersect both unit groups with the local principal preimage. The resulting quotient injects into V_n^+/D_n^+ and hence has order prime to p.
3. Tensor with the flat Z_p module, or equivalently take pro-p completions, and compare their continuous local images. These have equal closures; norm compatibility gives equality of inverse limits.

**Checks.**

- Do not assume a full unit group is already a Z_p-module. The image/closure argument retains torsion and the principal-unit intersection.

**Prerequisites:** `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`, `IntegralIwasawaTheory:L0/index-formula`, `IntegralIwasawaTheory:L1/principal-global-unit-closures`, `ColemanPowerSeries:L4/principal-real-local-cyclotomic-units`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L1/global-local-dictionary`, `IntegralIwasawaTheory:L1/coleman-real-closure-comparison`; exact suppliers `IntegralIwasawaTheory:L0/index-formula`. The principal-unit intersection and closure are those of the L1 dictionary.

**Sources.**

- RJW, Proof of Theorem 13.11, pp. 193–194: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### One normalisation of ζ_p for the Vandiver isomorphism

**Comparison target:** `IntegralIwasawaTheory:L3/coleman-zeta-normalisation` (new in this part).

Let p be odd, u = κ(γ), and G^+ = Gal(ℚ(μ_{p^∞})^+/ℚ). The Coleman image is the integral ideal I(G^+)ζ_p, using RJW's even zeta pseudomeasure, rather than the pseudomeasure alone. Write Z_χ(T) for its even tame χ-component, with σ_a evaluated by χ(a). RJW's Mellin convention is Z_χ(u^a−1) = L_p(χ,1−a). If f_χ(S) is I.3's analytic series with f_χ(u^s−1) = L_p(χ,s), put a(T) = u(1+T)^(−1)−1. For χ ≠ 1, Z_χ(T) = f_χ(a(T)), so this component of Iζ_p is generated by f_χ∘a. For χ = 1, I.3 uses f_1(S) = (1−u/(1+S))F_1(S), with F_1(u^s−1) = ζ_p(s); then f_1(a(T)) = −T Z_1(T), which generates the trivial component of Iζ_p. Thus U_∞^+/C_∞^+ ≅ Λ(G^+)/Iζ_p unconditionally; the further identification X_∞^+ ≅ U_∞^+/C_∞^+ requires Vandiver(p).

**Hypotheses and conventions.** p odd; the same generator u and the same character evaluation σ_a ↦ χ(a) on both sides; tame character rings are unramified. Vandiver is required only for the final X_∞^+ identification.

**Construction or proof.**

1. RJW Definition 5.18 integrates χ(x)⟨x⟩^(1−s) against ζ_p. Consequently the group-algebra variable evaluates at exponent 1−s; the involution a(T) translates it to I.3's exponent s.
2. The substitution a is a continuous integral automorphism with a(a(T))=T. On χ≠1, the augmentation ideal is the whole component; on χ=1 it is (T), and substituting into I.3's prescribed clearing factor gives 1−u/(1+a(T)) = −T.
3. Apply Coleman's real image theorem, then L1/coleman-real-closure-comparison for the shift of levels. Apply the global–local sequence and Vandiver vanishing only for the identification with X_∞^+.

**Checks.**

- For χ≠1, Z_χ(0)=L_p(χ,1), whereas f_χ(0)=L_p(χ,0); identifying the two series without the involution fails this check.
- The analytic trivial branch has its pole at S=u−1, whereas Z_1 has its augmentation pole at T=0. Multiplying by I clears the latter.
- At p=37 Vandiver holds but regularity fails. The arithmetic quotient isomorphism uses Vandiver, not regularity; its statement must retain that hypothesis.

**Prerequisites:** `ColemanPowerSeries:L4/real-cyclotomic-coleman-image`, `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`, `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`, `IntegralIwasawaTheory:L1/coleman-real-closure-comparison`, `DirichletPadicLFunctions:L1/arithmetic-pseudomeasure`.

**Sources.**

- Joaquín Rodrigues Jacinto; Chris Williams, Definition 5.18 and Remark 5.21, pp. 147–148; Theorem 12.23, pp. 188–189; Theorem 13.11 and proof, pp. 192–195: Fixes the Mellin exponent 1−s, the Coleman quotient and the Vandiver hypothesis on the arithmetic isomorphism.

### The Vandiver cyclotomic module isomorphism

**Theorem target:** `IntegralIwasawaTheory:L3/vandiver-cyclic-isomorphism` (target of the I.8 pass, id unchanged).

For an odd prime p satisfying Vandiver(p), there is a natural topological Λ(G^+)-linear isomorphism X∞^+≃Λ(G^+)/(I(G^+)ζ_p), where G^+=Gal(Q(μ_(p∞))^+/Q), I is the augmentation ideal and ζ_p is the imported Kubota–Leopoldt pseudomeasure with Coleman’s normalization. The product Iζ_p is an integral ideal.

**Hypotheses and conventions.** The quotient uses the entire even completed group ring, including the trivial tame character and its pole-clearing augmentation factor.

**Construction or proof.**

1. Use the global-local sequence with Y∞^+=0 and E∞^+=C∞^+ to identify X∞^+ with U∞^+/C∞^+.
2. Apply Coleman L4’s actual local quotient isomorphism and its comparison with the same principal real local tower.
3. Check the reciprocity action and root indexing so the composite is continuous, Λ-linear and natural. No module isomorphism is deduced merely from equal characteristic ideals.

**Checks.**

- The result is conditional on Vandiver. The unconditional Euler-system proof remains EulerSystemsCyclotomicMainConjecture:L4.

**Prerequisites:** `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`, `IntegralIwasawaTheory:L3/vandiver-unit-closure`, `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L3/coleman-zeta-normalisation`, `IntegralIwasawaTheory:L1/coleman-real-closure-comparison`; exact suppliers `ColemanPowerSeries:L4/local-iwasawa-real-quotient-comparison`. Remaining item 1 of L3: the local quotient normalisation is fixed.

**Sources.**

- RJW, Theorem 13.11 and proof, pp. 192–194: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Vandiver module isomorphism.

### Characteristic ideals and the character/twist dictionary

**Comparison target:** `IntegralIwasawaTheory:L3/vandiver-characteristic-components` (target of the I.8 pass, id unchanged).

Under Vandiver, char_(Λ(G^+))(X∞^+)=I(G^+)ζ_p. For an even tame character χ and its unramified coefficient ring O_χ, the χ quotient is O_χ[[Γ]]/(ζ_(p,χ)) if χ≠1, and O_χ[[Γ]]/((γ−1)ζ_(p,1)) if χ=1. The S-ramified form has no extra Tate twist on X; a dual/Tate-twisted form is obtained only by transporting the action via σ↦κ(σ)σ^−1 and the same character inversion.

**Hypotheses and conventions.** p odd, so the tame finite group has order prime to p; integral character splitting uses its actual coefficient extension and faithful descent.

**Construction or proof.**

1. Apply the imported characteristic ideal/Fitting comparison to the actual cyclic quotient and descend the component identities.
2. Compute the image of the augmentation ideal: it is the full ring on every nontrivial tame character and (γ−1) on the trivial one.
3. State the dual and twist as semilinear transport and prove the evaluation formula on group elements, rather than silently swapping χ with χω^−1.

**Checks.**

- The trivial component uses a pole-cleared integral generator. No comparison divides by its value at T=0.
- Every dual comparison specifies its convention on the group action before naming the associated Dirichlet character.

**Prerequisites:** `IntegralIwasawaTheory:L3/vandiver-cyclic-isomorphism`, `PadicMeasuresIwasawaAlgebras:L4/characteristic-ideal`, `PadicMeasuresIwasawaAlgebras:L6/character-evaluation`, `IntegralIwasawaTheory:I.8/cm-twist-minus-plus`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L3/coleman-zeta-normalisation`; exact suppliers `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`. The character dictionary uses the single normalisation of ζ_p.

**Sources.**

- RJW, Theorem 13.8, Remark 13.9 and Theorem 13.11, pp. 191–194: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

## L4. Abelian Leopoldt and Ferrero–Washington

Abelian Leopoldt: I.2 owns Leopoldt's map and defect; this layer proves Leopoldt for abelian fields from Baker–Brumer (imported through DiophantineApproximationAndTranscendence DT.3 and LinearFormsInLogarithms §8.10) and the rational unit representation, and extends Baker–Brumer to arbitrary algebraic numbers with Iwasawa's logarithm.

Ferrero–Washington: Sinnott’s rational-measure Γ-transform argument gives analytic μ=0 at every prime. The relative class-number formula gives relative μ=0; odd-prime reflection and Ferrero’s dyadic subexponential-rank argument then give full μ=0. Shifted conductor reduction and norm descent reach all abelian fields. The older digit targets remain available for Washington’s prime-to-p theorem, but the Bernoulli obstruction is now only a consequence of Ferrero–Washington, with its reverse dependency removed. Greenberg’s conjecture is stated on the defined invariants, not proved.

**Planets:** Baker–Brumer theorem, Abelian Leopoldt theorem, Sinnott's μ-theorem, Ferrero–Washington theorem, Washington's ℓ-part theorem, Greenberg’s conjecture (the I.8 planets Leopoldt defect and Digit equidistribution are proposed to be dropped; see the planet proposal below).

**Coverage:** planned. The analytic adapter, relative class-number passage and both odd and dyadic full μ arguments are specified. Washington 1975 supplies the conductor shift, dyadic prime-to-p case and relative-to-full reduction. Both former L4 gaps are discharged; generic arithmetic carriers remain with their existing owners. Remaining: Instantiate the corrected parent refinement edges at assembly. Obtain I.6’s exact ordinary relative class-number interface, including the bounded Hasse unit index at 2; do not substitute its weaker modified-class equality up to a power of 2.

### The Leopoldt logarithmic defect

**Definition target:** `IntegralIwasawaTheory:L4/leopoldt-defect` (target of the I.8 pass, id unchanged).

**Superseded as a definition** by `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`: RT-AREA-ktheory-2/26: I.2 owns Leopoldt's map and defect; the parent node becomes the logarithmic characterisation proved in L4/abelian-leopoldt-i2-form. Consumers (AutomorphicPadicLFunctions L0, Polylogarithms P.6) import I.2.

For a number field E and prime p, let ℓ_(E,p):O_E^×⊗_Z Q_p→∏_(v|p)E_v be the diagonal p-adic logarithm map, defined by taking residue-killing powers into the exponential/logarithm disc and dividing by that power. Its source has dimension r1+r2−1. Define δ_(E,p)=dim_(Q_p)ker ℓ, and Leopoldt(E,p) by δ=0. Roots of unity disappear in the tensor source.

**Hypotheses and conventions.** The local logarithm convention is fixed; at p=2 use a deep subgroup such as 1+4O after further powering as required by ramification.

**Construction or proof.**

1. Use the existing unit theorem and local completion/logarithm APIs. Independence of the deep-unit power follows from log(u^m)=m log u.
2. Define the actual linear map, kernel and dimension; compare its rank with the Z_p-rank of the principal local closure of global units.

**Uses that determine the API.**

- IntegralIwasawaTheory:L1/principal-global-unit-closures: Determines the global closure rank in the local units.
- IntegralIwasawaTheory:L4/abelian-leopoldt: Provides the exact conclusion derived from Baker–Brumer.

**Proposed API.**

- `TauCeti.IntegralIwasawa.leopoldt_iff_log_rank` (characterisation): δ=0 iff the logarithm image has Q_p-dimension r1+r2−1.
- `TauCeti.IntegralIwasawa.leopoldt_iff_principal_closure_rank` (compatibility): The diagonal principal global-unit closure has Z_p-rank r1+r2−1−δ, after treating its finite torsion.
- `TauCeti.IntegralIwasawa.leopoldt_isomorphism` (equivalence): Field isomorphisms transport the unit and completion maps and preserve δ.
- `TauCeti.IntegralIwasawa.leopoldt_CM_reduction` (compatibility): For a CM field, the full and maximal-real unit groups have the same rational unit span, so their Leopoldt injectivity conditions agree.

**Unit tests.**

- `leopoldt_Q` (degenerate): For Q the source is zero and δ=0 for every p.
- `leopoldt_imaginary_quadratic` (computation): For an imaginary quadratic field the unit rank is zero and δ=0.
- `log_torsion_not_injective` (non-example): log(−1)=0, including at p=2; this does not violate Leopoldt because torsion is killed by tensoring with Q_p.

**Checks.**

- Do not replace Leopoldt by injectivity of logarithm on the full torsion-containing unit group.

**Prerequisites:** `IntegralIwasawaTheory:I.2`, `DiophantineApproximationAndTranscendence:DT.3/deep-unit-exp-log-adapter`, `mathlib:NumberField.Units.finrank_modTorsion`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form`; exact suppliers `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`. Superseded as a definition by I.2/leopoldt-map-and-defect (RT-AREA-ktheory-2/26); it survives as the logarithmic characterisation proved in L4/abelian-leopoldt-i2-form.

**Sources.**

- Sharifi, §1.5, Definition 1.5.1 through Theorem 1.5.21, pp. 28–36: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Inherited planet retired by the proposal below:** Leopoldt defect.

### Abelian Leopoldt in I.2's form, and the logarithmic defect

**Comparison target:** `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form` (new in this part).

For a number field E and prime p, let δ(E, p) = rank_{ℤ_p} ker(ι_E: O_E^× ⊗ ℤ_p → ∏_{v|p} U^1(E_v)) be I.2's Leopoldt defect and δ_log(E, p) = dim_{ℚ_p} ker(ℓ_{E,p}) the logarithmic defect, defined here as a comparison with I.2, ℓ_{E,p} = (log_p ∘ ι_E) ⊗ ℚ_p. Then δ_log = δ. Consequently the parent L4/abelian-leopoldt states I.2's LeopoldtConjecture(E, p) for every finite abelian E/ℚ and every p, and the principal closure of global units of F_n^+ has ℤ_p-rank [F_n^+:ℚ] − 1. The parent L4/leopoldt-defect is a characterisation of I.2's definition, not a second definition.

**Hypotheses and conventions.** E a number field, p any prime including 2; log_p is Iwasawa's logarithm on principal units.

**Construction or proof.**

1. On U^1(E_v), log_p has kernel the p-power roots of unity of E_v, a finite group; so ker(log_p ∘ ι_E) contains ker ι_E with finite index after tensoring with ℚ_p.
2. Hence ker(ℓ_{E,p}) = ker(ι_E) ⊗ ℚ_p and the dimensions agree; rank formulas follow from I.2's leopoldtDefect_eq.

**Checks.**

- For E = ℚ or E imaginary quadratic both defects are 0.
- Roots of unity in O_E^× do not enter either defect.

**Prerequisites:** `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`, `IntegralIwasawaTheory:I.2/semilocal-principal-units`, `IntegralIwasawaTheory:L4/abelian-leopoldt`.

**Sources.**

- Romyar Sharifi, Conjecture 1.5.1, p. 28; Proposition 1.5.6, Theorem 1.5.7, p. 31; Definition 1.5.9, p. 32; Theorem 1.5.21, pp. 35–36: States Leopoldt's conjecture through the completed unit map and through p-adic logarithms, and proves it for abelian fields.

### Baker–Brumer logarithmic independence

**Theorem target:** `IntegralIwasawaTheory:L4/baker-brumer-independence` (target of the I.8 pass, id unchanged).

Fix embeddings of the algebraic numbers into C_p. If α_1,…,α_r are nonzero algebraic p-adic units and log_p α_i are linearly independent over Q, then those logarithms are linearly independent over the embedded algebraic closure of Q. The conclusion is about algebraic coefficients, not all Q_p coefficients.

**Hypotheses and conventions.** Any fixed branch is reduced to the standard unit logarithm; zero logarithms cannot belong to an independent family.

**Construction or proof.**

1. For a finite family choose a common positive integer M, killing the residue and torsion factors and placing every α_i^M in a strict exponential disc; log(α_i^M)=M log(α_i). This works also at p=2 after further powering.
2. Set ℓ_i=M log_p(α_i). These have algebraic exponentials α_i^M, satisfy the strict radius hypothesis of LinearFormsInLogarithms §8.10, and remain Q-linearly independent. Apply PadicBaker.eq_zero_of_add_sum_mul_eq_zero with constant coefficient zero to each proposed algebraic relation.
3. Divide by the nonzero rational scalar M to recover the original logarithms. The upstream theorem supplies all auxiliary-polynomial, interpolation and nonvanishing arguments; none is developed again in this roadmap.

**Checks.**

- For two logs the theorem excludes an algebraic irrational ratio when their rational ratio is excluded; it does not exclude a transcendental Q_p ratio.
- The supplier requires ‖ℓ_i‖<p^(−1/(p−1)) and algebraic exp(ℓ_i). Explicit common deep powering supplies these hypotheses at every p; its endpoint is algebraic-coefficient independence, not Yu’s integer-coefficient estimate.

**Prerequisites:** `DiophantineApproximationAndTranscendence:DT.3`, `DiophantineApproximationAndTranscendence:DT.3/deep-unit-exp-log-adapter`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`; exact suppliers `DiophantineApproximationAndTranscendence:DT.3`. Kept as the unit case; extended to arbitrary algebraic numbers with Iwasawa's logarithm for DirichletPadicLFunctions.

**Sources.**

- Sharifi, Theorem 1.5.17, p. 33; Rousseau theorem, p. 11-01, is an alternative public proof; the formal supplier is LinearFormsInLogarithms §8.10: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Baker–Brumer theorem.

### Baker–Brumer for arbitrary algebraic numbers with Iwasawa's logarithm

**Theorem target:** `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers` (new in this part).

Fix an embedding of ℚ̄ into ℂ_p and let log_p be Iwasawa's logarithm on ℂ_p^× (log_p p = 0). (a) For α ∈ ℚ̄^×, log_p α = 0 iff α^N = ζ·p^k for some N ≥ 1, k ∈ ℤ and root of unity ζ. (b) For α_1, …, α_r ∈ ℚ̄^×, if log_p α_1, …, log_p α_r are linearly independent over ℚ, they are linearly independent over ℚ̄. (c) Multiplicative reduction: the ℚ-span of the log_p α_i equals the ℚ-span of log_p β_i, where α_i^N = p^{k_i}β_i with β_i algebraic p-adic units. The statement holds for p = 2. It does not by itself show that a given character projection of a vector of logarithms is nonzero.

**Hypotheses and conventions.** Iwasawa's branch: log_p(p) = 0, log_p(ζ) = 0 for roots of unity, log_p(xy) = log_p x + log_p y.

**Construction or proof.**

1. For α algebraic, v_p(α) ∈ (1/e)ℤ; choose N with N·v_p(α_i) ∈ ℤ for all i, put k_i = N·v_p(α_i) and β_i = α_i^N p^{−k_i}, an algebraic p-adic unit; then log_p α_i = log_p(β_i)/N.
2. (a) For a p-adic unit β, log_p β = 0 iff β is a root of unity (the kernel of log_p on the units of ℂ_p is the torsion subgroup); combine with the first step.
3. (b) Apply the parent L4/baker-brumer-independence to β_1, …, β_r, whose logarithms are Q-independent iff those of the α_i are.

**Checks.**

- log_p(p) = 0 although p is not a root of unity: p is in the kernel by normalisation, and (a) includes it.
- Two logarithms with irrational algebraic ratio are excluded; a transcendental ratio is not.

**Prerequisites:** `IntegralIwasawaTheory:L4/baker-brumer-independence`, `DiophantineApproximationAndTranscendence:DT.3`.

**Sources.**

- Sharifi, Theorem 1.5.17, p. 33: States Brumer's theorem for algebraic p-adic units with ℚ-independent logarithms.

### Abelian unit character resolvents

**Theorem target:** `IntegralIwasawaTheory:L4/abelian-unit-resolvents` (target of the I.8 pass, id unchanged).

For totally real abelian E/Q of degree d, the rational unit representation (O_E^×/μ(E))⊗Q is the augmentation representation Q[G]/Q·N_G. One can choose a unit α whose d conjugates have only the product relation rationally. For each nontrivial algebraic character χ of G, Σ_(σ∈G)χ(σ)^−1 log_p(σ α) is nonzero.

**Hypotheses and conventions.** Embed E into C_p. Deep-unit powering is harmless. The character coefficients are algebraic, even though their logarithms need not be.

**Construction or proof.**

1. Use Mathlib’s logarithmic unit lattice and its full real span. For totally real Galois E, permuting the embeddings makes the logarithmic map G-equivariant into the coordinate-sum-zero hyperplane in R^G; the unit theorem gives an isomorphism after scalar extension to R.
2. Descend this representation isomorphism to Q as in Sharifi Lemma 1.5.19 and Proposition 1.5.20. Concretely, the equations for equivariant homomorphisms have rational coefficients; a real invertible solution makes their determinant polynomial nonzero, hence it has a rational point with nonzero determinant. The rational augmentation representation is cyclic. Choose its cyclic unit class and clear denominators to obtain an actual integral unit.
3. Choose d−1 conjugate unit classes independent over Q. Their logarithms are Q-independent because the local log kernel on algebraic units is torsion.
4. Apply Baker–Brumer; a vanishing nontrivial resolvent would be an algebraic-coefficient relation not proportional to the sole product relation.

**Checks.**

- The trivial resolvent is zero by the norm relation. A nontrivial character must not be substituted into a rank-zero trivial-character slot.

**Prerequisites:** `IntegralIwasawaTheory:L4/baker-brumer-independence`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`, `mathlib:NumberField.Units.dirichletUnitTheorem.unitLattice_span_eq_top`, `mathlib:NumberField.Units.logEmbeddingEquiv`.

**Exact suppliers after this pass:** Unchanged.

**Sources.**

- Sharifi, Proposition 1.5.18, Lemma 1.5.19, Proposition 1.5.20 and Theorem 1.5.21, pp. 33–36: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Leopoldt for abelian number fields

**Theorem target:** `IntegralIwasawaTheory:L4/abelian-leopoldt` (target of the I.8 pass, id unchanged).

If E/Q is finite abelian, then Leopoldt(E,p) holds for every prime p. For E=F_n^+ the principal global-unit closure has Z_p-rank [F_n^+:Q]−1.

**Hypotheses and conventions.** No assertion is made for arbitrary nonabelian number fields. Complex abelian fields are CM and reduce to their maximal real subfield at the level of rational units.

**Construction or proof.**

1. For a real abelian field use the character resolvents and the group determinant on the augmentation representation to show the logarithm matrix has rank d−1.
2. For CM abelian E, the real unit group has the same rational span up to roots of unity and finite Hasse index; apply the real result and the compatible completion maps.
3. Convert rational logarithmic rank to the principal closure rank by the defect API, handling finite torsion, including −1 at p=2.

**Checks.**

- At p=3 the real degree-one base has rank zero; the local principal unit rank is one.
- At p=2 torsion in the full unit group is not claimed to inject under logarithm.

**Prerequisites:** `IntegralIwasawaTheory:L4/leopoldt-defect`, `IntegralIwasawaTheory:L4/abelian-unit-resolvents`, `tauceti:TauCetiRoadmap/RepresentationTheory/CharacterTheory#layer-3-the-character-table-idempotents-completeness-second-orthogonality`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form`; exact suppliers `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`. Its conclusion is read in I.2's form for Polylogarithms P.6 and EulerSystemsCyclotomicMainConjecture.

**Sources.**

- Sharifi, Theorem 1.5.21 and its proof, pp. 35–36; CM unit-rank reduction: Lemma 1.4.12, p. 26: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Abelian Leopoldt theorem.

### The Γ-transform of a measure

**Definition target:** `IntegralIwasawaTheory:L4/gamma-transform` (new in this part).

Let o be the ring of integers of a finite extension of ℚ_p with uniformiser π, and α an o-valued measure on ℤ_p. Write ℤ_p^× = V × U with V the roots of unity in ℤ_p (μ_{p−1} for p odd, {±1} for p = 2) and U = 1 + qℤ_p (q = p or 4), x = ω(x)⟨x⟩, and fix a topological generator u of U. The Γ-transform of α is Γ_α(s) = ∫_{ℤ_p^×} ⟨x⟩^s dα(x) for s ∈ ℤ_p. It is an Iwasawa function: Γ_α(s) = G_α(u^s − 1) with G_α ∈ o⟦T⟧ the Amice transform of the pushforward to ℤ_p, through y ↦ u^y, of the restriction to U of β = Σ_{η∈V} α∘η. Define μ(Γ_α) = μ(G_α), the least π-adic valuation of a coefficient. For the zero series the content is ∞, so μ takes values in ℕ∪{∞}. If e = ord_π(p), Sinnott's p-normalised content is μ/e; both normalisations vanish simultaneously.

**Hypotheses and conventions.** o-valued measures on ℤ_p are identified with o⟦T⟧ by the Amice transform (PadicMeasuresIwasawaAlgebras layer 2); Sinnott writes T for 1 + T.

**Construction or proof.**

1. Restriction to an open compact subset, multiplicative translation α ↦ α∘η and pushforward along the homeomorphism ℤ_p ≅ U are PadicMeasuresIwasawaAlgebras' operations.
2. The integral splits over the cosets ηU; ⟨ηx⟩ = ⟨x⟩ gives the formula with β.

**Uses that determine the API.**

- Sinnott 1984, Theorem 1, p. 276: the μ-invariant of the Γ-transform of a rational measure
- Sinnott 1984, §4, pp. 279–282: Kubota–Leopoldt L-functions are Γ-transforms of rational measures
- IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet: the μ = 0 theorem is about Γ-transforms

**Proposed API.**

- `TauCeti.IntegralIwasawa.gammaTransform` (data): Γ_α as an o-valued function on ℤ_p.
- `TauCeti.IntegralIwasawa.gammaSeries` (constructor): G_α ∈ o⟦T⟧ with Γ_α(s) = G_α(u^s − 1).
- `TauCeti.IntegralIwasawa.gammaSeries_add` (simp): G_{α+α′} = G_α + G_{α′} and G_{cα} = cG_α.
- `TauCeti.IntegralIwasawa.gammaTransform_comp_root` (relation): Γ_{α∘η} = Γ_α for η ∈ V, since ⟨ηx⟩ = ⟨x⟩.
- `TauCeti.IntegralIwasawa.gammaMu` (data): μ(Γ_α) = min_n ord_π of the coefficients of G_α. Set μ(0)=∞; converting to the normalisation v_p(p)=1 divides finite values by e=ord_π(p).
- `TauCeti.IntegralIwasawa.gammaMu_generator_indep` (other): μ(Γ_α) is independent of the generator u.

**Unit tests.**

- `gammaSeries_dirac_one` (computation): For α = δ_1, Γ_α(s) = 1 and G_α = 1, so μ(Γ_α) = 0.
- `gammaTransform_supported_pZp` (degenerate): If α is supported on pℤ_p, then Γ_α = 0. Its μ is ∞, not zero.
- `gammaSeries_dirac` (computation): For α = δ_a with a ∈ ℤ_p^× and ⟨a⟩ = u^t, G_α = (1+T)^t.
- `gammaTransform_not_injective` (non-example): α and α∘η (η ∈ V, η ≠ 1) have the same Γ-transform; the transform is not injective on measures on ℤ_p^×.
- `gammaMu_ramified_scalar` (computation): For α=πδ_1, G_α=π and μ_π=1, while μ_p=1/e. At p=2, α=2δ_1 has μ_π=e.

**Checks.**

- μ(Γ_α) does not depend on the choice of u: changing u is a substitution T ↦ (1+T)^c − 1 with c ∈ ℤ_p^×.

**Prerequisites:** `PadicMeasuresIwasawaAlgebras:L2`, `PadicMeasuresIwasawaAlgebras:L3`, `mathlib:PadicInt`, `mathlib:PowerSeries`.

**Sources.**

- W. Sinnott, §1, formulas (1.1) and (1.4)–(1.6), pp. 274–275: Defines the power series of a measure, the Γ-transform as an interpolation of moments over x ≡ 0 mod p−1, and its Iwasawa power series G with Γ_α(s) = G(u^s).

### Sinnott's independence results

**Theorem target:** `IntegralIwasawaTheory:L4/sinnott-independence` (new in this part).

(a) Let k be a field, X_1, …, X_n, Z independent indeterminates and Y_1, …, Y_m (m ≥ 1) nontrivial monomials in the X_i that are pairwise multiplicatively independent. If r_1(Y_1) + ⋯ + r_m(Y_m) = 0 with r_j(Z) ∈ k(Z), then every r_j is constant. (b) Let F be a field of characteristic p and, for a ∈ ℤ_p, (1+T)^a = Σ binom(a,n)T^n ∈ F⟦T⟧. If a_1, …, a_n ∈ ℤ_p are linearly independent over ℚ, then (1+T)^{a_1}, …, (1+T)^{a_n} are algebraically independent over F in F((T)). (c) If for each η ∈ V a rational function r_η(Z) ∈ F(Z) is given with Σ_{η∈V} r_η((1+T)^η) = 0 in F((T)), then r_η(Z) + r_{−η}(Z^{−1}) ∈ F for each η.

**Hypotheses and conventions.** F of characteristic p; V the roots of unity of ℤ_p; in (a) monomials have integer exponents.

**Construction or proof.**

1. (a) Enlarge k to contain an element t of infinite order; take a minimal nonconstant relation, choose integers b_i killing the exponent vector of Y_1 but not of Y_2, apply X_i ↦ X_i t^{b_i} and subtract to get a shorter relation.
2. (b) Apply the injective continuous Laurent-series substitution (1+T) ↦ (1+T)^x for x∈ℤ_p\{0}. This gives the polynomial relation among the characters x↦(1+T)^(xc) for nonzero x; continuity of these power series extends it to x=0. Artin's independence of the distinct characters (distinct c=d·a) forces every coefficient to vanish. Substitution at x=0 is not used as a field endomorphism of F((T)).
3. (c) Choose a ℤ-basis a_1, …, a_n of the additive group generated by V and representatives η_1, …, η_m of V/±1; the (1+T)^{η_j} are pairwise independent monomials in the algebraically independent X_i = (1+T)^{a_i}, and apply (a) to r_{η_j}(Z) + r_{−η_j}(Z^{−1}).

**Checks.**

- For a single a ∉ ℚ, (1+T)^a is transcendental over F(T).
- For η and −η the relation r(Z) + r(Z^{−1}) ∈ F is all that can be concluded; it is not r = 0.

**Prerequisites:** `mathlib:PowerSeries`, `mathlib:PadicInt`.

**Sources.**

- W. Sinnott, §3, Proposition 3.1, the Lemma and Proposition 3.2, pp. 277–279: Proves the independence of rational functions of independent monomials, the algebraic independence of the T^{a_i} and the cancellation for sums over V.

### Sinnott's μ-theorem for Γ-transforms of rational functions

**Theorem target:** `IntegralIwasawaTheory:L4/sinnott-mu-theorem` (new in this part).

Let α be an o-valued measure on ℤ_p whose associated power series is a rational function. Then μ(Γ_α) = μ(α* + α*∘(−1)), where α* is the restriction of α to ℤ_p^× (extended by 0) and μ of a measure is the μ-invariant of its power series. The power series of α* is F(T) − p^{−1}Σ_{ζ^p=1} F(ζ(1+T) − 1), again rational.

**Hypotheses and conventions.** Valid for every prime p, including p = 2; o the integers of a finite extension of ℚ_p.

**Construction or proof.**

1. Reduce to α supported on ℤ_p^×, even and not divisible by π (replacing α by α* + α*∘(−1) doubles Γ_α and scaling by π lowers both μ-invariants equally); then μ_π(2α) = ord_π(2), which is 0 for odd p and e=ord_π(2) at p=2. Sinnott uses v_p(p)=1; multiply his finite μ-values by e. Treat zero symmetrisation separately: its Γ-transform is zero.
2. p odd: if G ∈ πo⟦T⟧ then β|_U ∈ πΛ; translating with the rational series F_η of α|_{ηU} (rational by restriction, Sinnott Lemma 1.1) gives Σ_η F_η((1+T)^{η^{−1}} − 1) ≡ 0 mod π, so by L4/sinnott-independence (c) F_η + F_{−η}∘inv ≡ c_η, forcing 2α|_{ηU} ∈ πΛ and contradicting the hypothesis.
3. p = 2: β = 2α gives G ∈ 2o⟦T⟧; if ½G ≡ 0 mod π then α|_U and α|_{−U} lie in πΛ, again a contradiction.

**Checks.**

- For α = δ_1 + δ_{−1}: α* + α*∘(−1) = 2α and Γ_α = 2, so for p = 2 both sides have μ_π = ord_π(2), equal to 1 only in the unramified case.
- Rationality of the power series is essential: the theorem is not claimed for arbitrary measures.

**Prerequisites:** `IntegralIwasawaTheory:L4/gamma-transform`, `IntegralIwasawaTheory:L4/sinnott-independence`, `PadicMeasuresIwasawaAlgebras:L2`.

**Sources.**

- W. Sinnott, Lemma 1.1, p. 274; Theorem 1 and its proof, pp. 276–277: States and proves μ(Γ_α(s)) = μ(α* + α*∘(−1)) for rational α, with the separate p = 2 argument.

**Planet:** Sinnott's μ-theorem.

### Kubota–Leopoldt L-functions as Γ-transforms of rational measures

**Comparison target:** `IntegralIwasawaTheory:L4/kubota-leopoldt-gamma-transform` (new in this part).

Let θ be an odd primitive Dirichlet character of the first kind (p² ∤ f_θ for p odd, 8 ∤ f_θ for p = 2) with θω nontrivial, valued in o, and c > 1 an integer prime to p·f_θ. Let ε(a) = θ(a) if c ∤ a and θ(a)(1 − c) if c | a, and F(T) = Σ_{a=1}^{f} ε(a)(1+T)^a/(1 − (1+T)^f) for f a multiple of the period of ε. Then F ∈ o⟦T⟧ is rational, it is the power series of a measure α, and Γ_α(s) = (1 − θ(c)c⟨c⟩^s)L_p(−s, θω). With Iwasawa's series g(T, θ) ∈ 2o⟦T⟧, L_p(s, θω) = g(u^s − 1, θ), one has μ(½g(T, θ)) = μ(α*), and α* ≢ 0 mod πΛ.

**Hypotheses and conventions.** θ odd, primitive, first kind; θω ≠ 1; c prime to p f_θ; the variable conventions of Sinnott (T ↦ 1 + T) are converted.

**Construction or proof.**

1. Put g=f_θ (the conductor) and f=gc; replace f by a p-multiple if needed in the final restriction formula. The quotient (1−(1+T)^(gc))/(1−(1+T)^g) has constant term c, a unit. Multiplying F by it yields a polynomial, because each residue class modulo g has exactly one representative divisible by c; this proves integrality.
2. Moments give ∫x^k dα=L(−k,ε)=(1−θ(c)c^(k+1))L(−k,θ). Take integers k→s p-adically and k→∞ in the ordinary sense, with k≡0 mod(p−1) at odd p. The contribution from pℤ_p tends uniformly to zero and the unit integrands converge to ⟨x⟩^s. At p=2 take even k, initially obtaining the identity on 2ℤ_2; both sides are analytic in s on ℤ_2, so the power-series identity principle extends it to all ℤ_2 (Sinnott Proposition 4.1, p. 281). Continuity alone on the even integers would not prove the dyadic extension.
3. Put ι(T)=(1+T)^(−1)−1. The interpolation is L_p(−s,θω)=g(u^(−s)−1,θ), so G_α(T)=H(T)g(ι(T),θ), with H(T)=1−θ(c)c(1+T)^t and ⟨c⟩=u^t. Here t≠0; even if t is divisible by p, the reduction of (1+T)^t is nonconstant (its first nonzero exponent is p^(v_p(t))), so μ_π(H)=0. Inversion ι preserves content. Sinnott gives μ_π(g)=μ_π(2α*)=ord_π(2)+μ_π(α*), hence μ_π(½g)=μ_π(α*).
4. With f divisible by p, (1 − (1+T)^f)·F*(T) = Σ_{p∤a} ε(a)(1+T)^a; as a polynomial in 1 + T its coefficient of (1+T)^1 is ε(1) = 1, so α* is not divisible by π.

**Checks.**

- The trivial character (θω = 1) is excluded here; its branch has a pole and is treated in L4/analytic-mu-vanishing-dirichlet.
- At p = 2 the factor ½ is part of the statement.

**Prerequisites:** `IntegralIwasawaTheory:L4/sinnott-mu-theorem`, `IntegralIwasawaTheory:L4/gamma-transform`, `DirichletPadicLFunctions:L2`, `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`, `mathlib:DirichletCharacter`, `mathlib:DirichletCharacter.Odd`.

**Sources.**

- W. Sinnott, §4, formulas (4.1)–(4.5), Proposition 4.1 and the concluding argument, pp. 279–282: Writes L_p(s, θω) as a Γ-transform of the rational measure attached to ε, deduces μ(½g) = μ(α*) and shows α* ≢ 0 mod π.

### Analytic μ-vanishing for Kubota–Leopoldt branches (Ferrero–Washington, Sinnott)

**Theorem target:** `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet` (new in this part).

For every prime p, including p = 2, and every odd primitive Dirichlet character θ of the first kind with θω nontrivial, μ(½g(T, θ)) = 0; equivalently, every Kubota–Leopoldt branch L_p(s, χ), χ = θω even of the first kind and nontrivial, has integral power series of μ-invariant 0 after the factor ½ at p = 2. For the trivial character use precisely P(S)=(1+S−u)F_1(S), where F_1(u^s−1)=ζ_p(s). The canonical integral series is P for odd p and ½P for p=2 (equivalently use I.3's clearing factor, which differs by the unit 1+S). At S=u−1, P has value u log_p(u)(1−p^(−1)); this is a unit for odd p and twice a unit for p=2. Thus the canonical cleared series also has μ=0. An arbitrary simple-zero factor is insufficient, since it could be multiplied by p.

**Hypotheses and conventions.** μ is the π-adic content of the integral series in the normalisation of DirichletPadicLFunctions; no main conjecture is used.

**Construction or proof.**

1. Nontrivial branches: L4/kubota-leopoldt-gamma-transform gives μ(½g) = μ(α*) and α* ≢ 0 mod π, so μ = 0.
2. I.3's prescribed integral f_1=(1−u/(1+S))F_1 gives P=(1+S)f_1, with ½f_1 integral at p=2. DirichletPadicLFunctions:L3/rjw2-principal-residue gives the all-prime residue 1−p^(−1) in the s-coordinate. Since d(u^s−1)/ds at s=1 is u log_p u, evaluation of P at S=u−1 gives the displayed value. Use v_p(log_p u)=1 for odd p and 2 for p=2; after the prescribed dyadic ½, this value is a unit.

**Checks.**

- Multiplying an integral branch by p raises μ; the theorem concerns the canonical integral normalisation.
- This is analytic μ; arithmetic μ needs L4/minus-mu-from-analytic and the plus-part argument.

**Prerequisites:** `IntegralIwasawaTheory:L4/kubota-leopoldt-gamma-transform`, `DirichletPadicLFunctions:L2`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`, `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`, `DirichletPadicLFunctions:L3/rjw2-principal-residue`.

**Sources.**

- W. Sinnott, Introduction, p. 273, and §4, pp. 279–282: Obtains a new proof that μ = 0 for the basic ℤ_p-extension of abelian fields through μ(½g(T, θ)) = 0, for all p.
- Joaquín Rodrigues Jacinto; Chris Williams, Theorem 7.1, p. 154: For odd p, proves the residue 1−p^(−1). The all-prime residue and prescribed integral clearing factor are imported from the analytic owner, not from this odd-prime statement.
- Joseph Oesterlé, §4, the reduction to the minus part and Proposition 1, p. 174: Reduces μ = 0 to the relative class numbers and states Iwasawa's criterion for Q(ζ_p).

### Relative class-number μ vanishes at every prime

**Theorem target:** `IntegralIwasawaTheory:L4/minus-mu-from-analytic` (new in this part).

Let p be a prime, q=p for odd p and q=4 for p=2, and let k be an imaginary abelian field containing μ_q with qp not dividing its conductor. For its cyclotomic layers k_n, put h_n^−=h(k_n)/h(k_n^+). The eventual formula v_p(h_n^−)=μ_rel^−p^n+λ_rel^−n+ν_rel^− has μ_rel^−=Σ_θ μ_p(½g(T,θ)), summed over the odd first-kind characters θ of k other than ω^(−1). Here μ_p uses v_p(p)=1, hence equals μ_π/e in a ramified coefficient ring. The exceptional θ=ω^(−1) contributes only O(n), after its pole factor and the roots-of-unity factor are accounted for. All summands vanish by L4/analytic-mu-vanishing-dirichlet, so μ_rel^−=0 for every p. For odd p this is μ(Y_∞^−)=0. At p=2 it gives v_2(#A_n^−)=O(n) for the norm-kernel minus groups; the dual-limit μ assertion follows later from L4/dyadic-relative-to-full-mu, not from restricting a full-module pseudo-isomorphism.

**Hypotheses and conventions.** k imaginary abelian, μ_q⊆k, qp∤conductor. For a general abelian E, choose m prime to p with E⊆ℚ(μ_{mqp^a}). Then E_∞⊆K_∞ for K=ℚ(μ_{mq}), and K_∞/E_∞ has bounded finite degree. It is not necessary that E be contained in K.

**Construction or proof.**

1. Relative class number formula h_n^- = Q_n w_n ∏_{χ odd of k_n} (−½B_{1,χ}), with Q_n ∈ {1, 2}; the odd characters of k_n are θψ with ψ of the second kind of conductor dividing qp^n. Obtain this exact ordinary-class formula by dividing the analytic class-number formulas for k_n and k_n^+, using the CM regulator quotient with Hasse unit index Q_n≤2. I.6 owns this input; its current modified-class statement only specifies equality up to a power of 2, so request the explicit all-prime ordinary-class formula below rather than infer dyadic valuations from that weaker statement.
2. Interpolation: for ψ ≠ 1 of the second kind, θψ(p) = 0, so −B_{1,θψ} = L_p(0, θωψ) = g(ζ_ψ − 1, θ) up to the root-of-unity normalisation of ψ, ζ_ψ a primitive p-power root of unity (I.3's dictionary).
3. For a nonexceptional θ, use the canonical integral series ½g and the cyclotomic resultant growth formula. Sum the valuations over p-power roots of unity to obtain μ_p(½g)p^n+O(n). The finitely many initial values and Q_n∈{1,2} affect only bounded terms. In the exceptional branch use the prescribed pole-cleared series; the denominator and w_n have valuations O(n), so do not contribute to μ_rel^− (Ferrero §§1.2–1.4).
4. For p=2, the class norm onto the real subfield is surjective by wide class field theory and ramification at real places. Indeed the wide Hilbert class field of the real field is totally real, so its intersection with the quadratic CM extension is the real base; norm compatibility of Artin reciprocity makes the class norm onto. Thus #A_n^− is the 2-part of h_n^−. This is a statement about finite-layer orders; no minus-part duality at 2 is inferred here.

**Checks.**

- For p odd and k = ℚ(μ_p), μ^- = Σ_{k even, 2 ≤ k ≤ p−3} μ(f_{ω^k}) = 0.
- At p=2 use the norm kernel. The negative eigenspace exists, but is not an exact direct-summand functor; finite-layer order growth alone is not asserted to identify inverse and direct minus limits.

**Prerequisites:** `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet`, `IntegralIwasawaTheory:I.6/minus-class-number-formula`, `IntegralIwasawaTheory:I.3/kubota-leopoldt-stickelberger-dictionary`, `PadicMeasuresIwasawaAlgebras:L4/cyclotomic-growth-step`, `PadicMeasuresIwasawaAlgebras:L4/coinvariants-euler-product`, `IntegralIwasawaTheory:I.2/cm-minus-class-modules`, `IntegralIwasawaTheory:I.2/iwasawa-finiteness`, `IntegralIwasawaTheory:L2/tower-iwasawa-invariants`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`, `IntegralIwasawaTheory:I.6`.

**Sources.**

- Lawrence C. Washington, §2, the analytic class number formula for h_n^- with Q_n and w_n, p. 88: States h_n^- = Q_n w_n ∏_χ ∏_j (−½B_{1,χψ_n^j}) for the cyclotomic tower of an imaginary abelian field with p² ∤ f_χ.
- Joseph Oesterlé, §4, the formula for h_n^- and the definition of μ^-, λ^-, p. 174: States the relative class number formula in the tower and that μ = 0 reduces to the minus part.
- Romyar Sharifi, Proposition 6.2.4, pp. 160–161: For ℚ(μ_p), p odd, μ(X_∞^-) > 0 iff some Iwasawa power series is divisible by p.
- Bruce Ferrero, §1.1 formulas (1.1b)–(1.1c), p. 10; Theorem 1.2, Lemma 1.3 and Theorem 1.4, p. 11; §1.8, p. 12: Records the all-prime analytic formula for relative μ, excluding the exceptional character, and the reduction by a shift of cyclotomic levels.

### Leopoldt's mirror inequality and the plus part of μ, for odd p

**Theorem target:** `IntegralIwasawaTheory:L4/mirror-inequality-odd` (new in this part).

Let p be odd and E a CM field containing μ_p. Then r_p(A(E)^+) ≤ r_p(A(E)^-) + 1, where A = Cl ⊗ ℤ_p and ± are the eigenspaces of complex conjugation. Consequently, for the cyclotomic ℤ_p-extension E_∞/E, μ(Y_∞) = 0 if and only if μ(Y_∞^-) = 0.

**Hypotheses and conventions.** p odd, μ_p⊆E, E CM. The dyadic argument is L4/dyadic-relative-to-full-mu and uses a different inequality.

**Construction or proof.**

1. Apply Sharifi Theorem 4.4.2 with F = E^+ and χ = ω|_{G_F}, which is the sign character of E/E^+: its first inequality with δ_χ ≤ 1 gives r_p(A^+) − 1 ≤ r_p(A^-).
2. Tower: μ(Y^-) = 0 gives bounded p-ranks of (Y_∞^-)_{Γ_n} (Sharifi Proposition 2.4.10), the norms Y^-_∞ → A_n^- are onto (Sharifi Proposition 3.4.1), so r_p(A_n^-) is bounded, hence r_p(A_n^+) is bounded, and the coinvariants of Y_∞^+ differ from A_n^+ by a module of p-rank at most the number of ramified primes minus one; apply Proposition 2.4.10 again.
3. μ(Y_∞) = μ(Y_∞^+) + μ(Y_∞^-) because Y_∞ = Y_∞^+ ⊕ Y_∞^- for p odd.

**Checks.**

- For E = ℚ(μ_p): r_p(A^+) ≤ r_p(A^-) + 1; Vandiver's condition A^+ = 0 is not implied.
- This bounds p-ranks, not orders. A cyclic group ℤ/p^a has rank one for arbitrarily large a, so no order bound is inferred from a rank comparison.

**Prerequisites:** `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `IntegralIwasawaTheory:L2/zp-extension-ramification`, `IntegralIwasawaTheory:I.2/cm-minus-class-modules`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants-api-5`, `mathlib:NumberField.IsCMField`, `mathlib:NumberField.IsCMField.complexConj`.

**Sources.**

- Romyar Sharifi, Theorem 4.4.2 (Leopoldt's Spiegelungssatz) and its proof, pp. 111–113; Proposition 3.4.3, p. 91; Proposition 2.4.10, p. 58: Proves the eigenspace mirror inequality for p odd and deduces μ(X_∞) = 0 iff μ(X_∞^-) = 0 when μ_p ⊆ F.
- Joseph Oesterlé, §4, p. 174: Records μ^+ ≤ μ^- and λ^+ ≤ λ^- for k containing the 2p-th roots of unity, citing Ferrero and Washington.

### Dyadic relative μ implies full μ and the minus dual conclusion

**Theorem target:** `IntegralIwasawaTheory:L4/dyadic-relative-to-full-mu` (new in this part).

Let k be an imaginary abelian field, p=2, k_n its cyclotomic layers, A_n=Cl(k_n){2}, B_n=Cl(k_n^+){2}, and A_n^−=ker(N:A_n→B_n). Write e_n^−=v_2(h(k_n)/h(k_n^+)). Then r_2(B_n)≤e_n^−+1 and r_2(A_n)≤2e_n^−+1. Consequently μ_rel^−=0 implies μ(k_∞/k)=0: e_n^−=O(n), so 2^(−n)r_2(A_n)→0, which excludes every vertical elementary Λ-summand. If μ_4⊆k, the compact inverse norm-kernel module and the contragredient dual of the direct norm-kernel limit both have μ=0. General abelian E reduces to a first-kind cyclotomic K after a fixed shift of layers and finite-degree norm descent.

**Hypotheses and conventions.** k imaginary abelian; the final direct norm-kernel limit uses the μ_4 tower convention of I.2. No direct-summand decomposition at 2 is used.

**Construction or proof.**

1. Norm A_n→B_n is onto. For the extension map j:B_n→A_n, I.2's CM unit argument bounds #ker j by 2, and Nj=2. Hence #B_n/2B_n divides [A_n:jB_n]≤2#A_n^−, giving r_2(B_n)≤e_n^−+1. Exactness gives r_2(A_n)≤r_2(A_n^−)+r_2(B_n)≤2e_n^−+1.
2. By L4/minus-mu-from-analytic, e_n^−=O(n). In the elementary-module proof of L2/bounded-p-rank-mu-zero, each Λ/(2^a) contributes 2^n+O(1) to the arithmetic layer 2-rank (after an index shift), whereas horizontal and finite error terms contribute O(1). Therefore r_2(A_n)/2^n→0 forces no vertical summands and μ=0 (Ferrero Lemma 1.6 and Theorem 1.8). An O(n) bound is sufficient; it is not called bounded rank.
3. Full μ=0 makes Y_∞ finitely generated over ℤ_2. Its inverse norm-kernel submodule is therefore finitely generated over ℤ_2. I.2/iwasawa-finiteness(c) makes the full direct-limit dual pseudo-isomorphic to Y_∞^ι, hence also finitely generated over ℤ_2. The dual of the direct norm-kernel limit is a quotient of that full dual (Pontryagin duality is exact), so is finitely generated over ℤ_2 and has μ=0. This uses full μ=0 before passing to minus, avoiding an unjustified dyadic restriction of pseudo-isomorphisms.
4. For general abelian E, conductor decomposition embeds E in some layer K_a of K=ℚ(μ_{mq}), (m,p)=1. Thus K_∞=E_∞K_a. Apply the result to K and descend via L2/norm-prank-descent with the finite extension EK_a/E; K itself need not contain E.

**Checks.**

- The inequality at 2 is r_2(B_n)≤e_n^−+1; it is not the odd-prime assertion r_2(B_n)≤r_2(A_n^−)+1.
- An abstract family (ℤ/2)^(n+1) has unbounded rank but rank/2^n→0. The dyadic proof uses the latter limit and the arithmetic control theorem, not an assertion that O(n) means bounded.
- For a vertical Λ/(4), μ=2 but the leading 2-rank coefficient is one. The proof only needs its positivity, not equality with μ.

**Prerequisites:** `IntegralIwasawaTheory:L4/minus-mu-from-analytic`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`, `IntegralIwasawaTheory:L2/norm-prank-descent`, `IntegralIwasawaTheory:I.2/cm-minus-class-modules`, `IntegralIwasawaTheory:I.2/iwasawa-finiteness`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-module-structure-theorem`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.**

- Lawrence C. Washington, Lemma 4 and proof, p. 184: Bounds 2^(r_2(B_n)) by twice the relative class number using norm and extension.
- Bruce Ferrero, Lemmas 1.5–1.7 and Theorem 1.8 with proof, pp. 11–12: Uses subexponential p-rank to pass from relative μ=0 to full μ=0, including p=2; reduces conductor by shifted layers.

### Ferrero–Washington for abelian number fields

**Theorem target:** `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero` (target of the I.8 pass, id unchanged).

For every finite abelian E/Q and every prime p, the class-group invariant μ of the cyclotomic Z_p-extension E∞/E is zero. This theorem is independent of any Iwasawa main conjecture and is available as an input to the Euler-system proof.

**Hypotheses and conventions.**

The tower is cyclotomic. All primes are included; at 2 use the norm-kernel class groups and the subexponential-rank argument below.

**Construction or proof.**

1. After the first-kind conductor reduction and a fixed shift of layers, analytic μ=0 and the relative class-number formula give relative μ=0.
2. For odd p, use L4/mirror-inequality-odd to deduce full μ=0. For p=2, L4/dyadic-relative-to-full-mu gives r_2(A_n)=O(n), hence no vertical elementary summands and full μ=0.
3. For general abelian E choose K=ℚ(μ_{mq}) with E contained in some K_a, then descend from K_a/E using L2/norm-prank-descent. This uses no main conjecture.

**Checks.**

- Includes E=Q and p=2. It does not prove μ=0 for every noncyclotomic Z_p-extension.
- The dependency graph contains no route from an Euler-system or integral main conjecture back into this theorem.

**Prerequisites after assembly:** `IntegralIwasawaTheory:L4/minus-mu-from-analytic`, `IntegralIwasawaTheory:L4/mirror-inequality-odd`, `IntegralIwasawaTheory:L4/dyadic-relative-to-full-mu`, `IntegralIwasawaTheory:L2/norm-prank-descent`, `IntegralIwasawaTheory:L2/bounded-p-rank-mu-zero`. Replace the old Bernoulli-obstruction and digit-separation prerequisites.

**Exact suppliers after this pass:** Closed for every prime: the relative class-number formula and analytic μ=0 give relative μ=0; odd-prime reflection or the dyadic subexponential-rank argument gives full μ=0; shifted conductor reduction and finite-degree norm descent reach every abelian field.

**Sources.**

- Oesterlé, Theorems 2–3, pp. 171–172; §3–§6, pp. 173–180; Sharifi Theorem 6.2.1, p. 160: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Ferrero–Washington theorem.

### Equidistribution of p-adic digit truncations

**Theorem target:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution` (target of the I.8 pass, id unchanged).

Let q=p for p odd and q=4 for p=2; let s_n(x) be the least nonnegative residue of x modulo qp^n. If γ_1,…,γ_r∈Z_p are Q-linearly independent, then for Haar-almost every α∈Z_p the vectors (s_n(αγ_j)/(qp^n))_j are equidistributed in [0,1)^r. For any congruence α≡A mod p^m, d prime to p, target box and sufficiently large n, one can choose α in that congruence with its normalized residues in the box and all s_n(αγ_j) divisible by d.

**Hypotheses and conventions.** Use the standard normalized Haar measure and half-open boxes; almost-everywhere is essential. The latter eventual existence follows from a finite torus covering, not from mere infinitude of a visit set.

**Construction or proof.**

1. Apply the imported Weyl criterion. For nonzero t∈Z^r the linear combination c=Σt_jγ_j is nonzero. After a finite initial prefix, the corresponding additive characters on Z_p are orthogonal, so the L² norm of their average is O(1/N).
2. Apply Chebyshev’s inequality for each positive rational threshold to the squared L² bounds at N=M². Their sum is finite; Mathlib MeasureTheory.ae_eventually_notMem gives almost-everywhere convergence along squares. Fill gaps between squares using |character|=1, and intersect the measure-one sets over countably many thresholds and nonzero t.
3. For congruence and d constraints, use d invertible in Z_p, scale target boxes, and take a finite covering of the real torus by images of finitely many truncated digit vectors. Shift by powers of p to realize every sufficiently large n.

**Checks.**

- α=0 is an exceptional counterexample, so the conclusion is not for every α.
- If γ_2=γ_1, the pair lies on a diagonal and cannot be equidistributed in the square.

**Prerequisites:** `ProbabilisticAndMetricNumberTheory:PM.2/weyl-criterion`, `mathlib:MeasureTheory.ae_eventually_notMem`, `PadicMeasuresIwasawaAlgebras:L0`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/washington-non-p-part`. No longer on the route to Ferrero–Washington (Sinnott's proof replaces it); still used by Washington's ℓ-part theorem.

**Sources.**

- Oesterlé, §6, Propositions 5–6 and proofs, pp. 178–179; compare Sharifi Proposition 6.2.8, pp. 162–163: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Inherited planet retired by the proposal below:** Digit equidistribution.

### The integral-basis and sign arrangement for torsion roots

**Lemma target:** `IntegralIwasawaTheory:L4/torsion-root-sign-arrangement` (new in this part).

Let p be odd, R = (p−1)/2, r = φ(p−1), η_1 a primitive (p−1)-th root of unity in ℤ_p and η_j = η_1^j. Then η_1, …, η_r is a ℤ-basis of ℤ[η_1]. If r < R, after replacing some of η_1, …, η_R by their negatives (the set still represents μ_{p−1}/±1) and renumbering the basis, there is j_0 > r such that, writing η_j = Σ_{i≤r} a_{ji}η_i: every a_{j0 i} ≥ 0, a_{j0 1} > 0 and some other a_{j0 i} > 0 (η_{j0}/η_1 ∉ ℤ), and the first nonzero coefficient of every η_j is positive. Then for every m ≥ 1 there are ℚ-linearly independent positive reals x_1, …, x_r such that x_j := Σ_i a_{ji}x_i satisfies 0 < x_j < p^{−m} for j ≠ j_0 and p^{−m} < x_{j0} < 2p^{−m}. If r = R (p a Fermat prime) take j_0 = 1 and choose the x_j directly.

**Hypotheses and conventions.** p odd; ℤ[η_1] is the ring of integers of ℚ(η_1), of rank r = φ(p−1).

**Construction or proof.**

1. The powers 1, η_1, …, η_1^{r−1} form a ℤ-basis of the cyclotomic integers ℤ[η_1]; so do η_1, …, η_r (multiply by the unit η_1).
2. Order η_{r+1}, …, η_R lexicographically by the absolute values of their coefficients and take η_{j0} maximal; change the signs of basis elements so that the coefficients of η_{j0} are nonnegative, and then the signs of the other dependent roots so that their first nonzero coefficient is positive.
3. Take x_1 = 1 ≫ x_2 ≫ ⋯ ≫ x_r > 0, ℚ-independent, so that the first nonzero term dominates each sum: all x_j > 0, and x_j < x_{j0} for j ≠ j0 because η_{j0} is lexicographically maximal with two positive coefficients; multiply all x_i by one real c to place x_{j0} in (p^{−m}, 2p^{−m}) and the others below p^{−m}.

**Checks.**

- For p = 3 or p = 5 (r = R) no sign change is needed.
- For p = 7: R = 3, r = 2 and η_3 = η_1^3 = −1 = η_2 − η_1; replacing η_1 by −η_1 gives −1 = η_2 + (−η_1) with both coefficients positive, so j_0 = 3 and x_3 = x_1 + x_2 exceeds x_1 and x_2.

**Prerequisites:** `mathlib:IsPrimitiveRoot`, `mathlib:CyclotomicField`.

**Sources.**

- Washington 1978, Proposition 2 and its proof, pp. 91–92: Chooses the integral basis η_1, …, η_r of ℚ(η_1), the lexicographic sign change and the dominant real coordinates; the remark on p. 88 credits ideas of the Ferrero–Washington proof.

### Ferrero–Washington digit separation

**Theorem target:** `IntegralIwasawaTheory:L4/fw-digit-separation` (target of the I.8 pass, id unchanged).

There is a choice R of representatives of the torsion subgroup of Z_p^× modulo {±1} such that, for all m,d>0 with (d,p)=1 and all sufficiently large n, there are α_1,α_2≡1 mod p^m and η0∈R with: s_(n+m)(α_1η)=s_n(α_1η) divisible by d for every η; the same equality/divisibility for α_2 when η≠η0; and s_(n+m)(α_2η0)=s_n(α_2η0)+qp^n divisible by d.

**Hypotheses and conventions.** q=p or 4 as above. The final equality uses α_2 on both sides; it does not assert equality of the lower truncations for α_1 and α_2.

**Construction or proof.**

1. When the representatives are independent, apply the preceding box/congruence theorem directly.
2. In the dependent case choose an integral basis of the cyclotomic integer lattice generated by the torsion roots and change signs/order so dependent representatives are lexicographically positive, with a distinguished maximal coefficient row. This finite lattice arrangement is supplied by L4/torsion-root-sign-arrangement (Washington 1978, pp. 91–92).
3. Use small positive powers of a real parameter as basis coordinates, scale so all rows but the distinguished one lie in (0,p^−m) and that row in (p^−m,2p^−m).
4. Choose small boxes preserving these strict inequalities and apply eventual box realization with d divisibility. A second box places all rows below p^−m and gives α_1.

**Checks.**

- At p=2, R={1}; the theorem still has content with q=4.
- Do not assume all half-set torsion representatives are Q-independent for arbitrary p.

**Prerequisites:** `IntegralIwasawaTheory:L4/fw-digit-equidistribution`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/torsion-root-sign-arrangement`. The dependent-root lattice step of G3 is supplied by L4/torsion-root-sign-arrangement (Washington 1978, p. 92).

**Sources.**

- Oesterlé, Proposition 4, p. 176; proof at the end of §6, p. 180: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### The Bernoulli digit obstruction

**Theorem target:** `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction` (target of the I.8 pass, id unchanged).

If a cyclotomic tower of an abelian number field has positive arithmetic μ, then either the base Q(ζ_q) has positive μ or there exist an odd primitive character λ of conductor d or dq with d>1, (d,p)=1, such that for every n≥0 and α∈Z_p^×, Σ_(η∈R)Σ_(i=0)^(d−1)i·λ(s_n(αη)+iqp^n) is zero modulo a prime over p. For odd p the base obstruction is constancy modulo p of a nonzero torsion-character weighted digit sum; for p=2 the base Q(i) has zero μ by class number one and one-prime control.

**Hypotheses and conventions.** Characters are evaluated with zero at nonunits. Keep the factors 1/2, roots-of-unity order and Hasse unit index in the relative class-number formula, particularly at p=2.

**Construction or proof.**

The original direct congruence proof is no longer required. First prove fw-arithmetic-mu-zero by the independent relative-class-number/Sinnott route above. Its conclusion makes the hypothesis of this legacy implication impossible. Preserve the statement and derive it by contradiction. At assembly replace all old prerequisites by fw-arithmetic-mu-zero, after removing this obstruction from that theorem’s prerequisites.

**Checks.**

- The arithmetic invariant is the class-group μ; it is not identified with an analytic μ by invoking a main conjecture.
- The oddness and primitivity of λ, its conductor and the prime over p remain in the formal statement.

**Prerequisites after assembly:** `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero` only.

**Exact supplier after this pass:** Ferrero–Washington makes the legacy antecedent μ>0 false; no universal trace congruence is imported into the new proof.

**Sources.**

- Oesterlé, §3–§4, pp. 173–175, Propositions 1–2; relative class-number formula (1), p. 174: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Analytic μ-vanishing for Dirichlet branches

**Theorem target:** `IntegralIwasawaTheory:L4/fw-analytic-mu-zero` (target of the I.8 pass, id unchanged).

Every nonzero even Kubota–Leopoldt Dirichlet branch, written in its actual coefficient DVR and integral normalization, has μ_an=0. The trivial-character pseudomeasure is first cleared by its single prescribed augmentation pole factor. The claim is not made for parity-zero branches or for an arbitrary scalar multiple of an integral series.

**Hypotheses and conventions.** μ_an is the minimum coefficient uniformizer valuation of the nonzero integral series; coefficient rings and Euler/smoothing factors are explicit.

**Construction or proof.**

1. Use L4/kubota-leopoldt-gamma-transform to identify the canonical integral nontrivial branch with the Γ-transform of its rational measure.
2. Apply L4/sinnott-mu-theorem with the ramification-normalized coefficient content to obtain μ=0, retaining the factor ½ at 2.
3. For the principal branch use the exact pole-clearing factor and the all-prime residue calculation in L4/analytic-mu-vanishing-dirichlet. Multiplying an arbitrary simple-zero factor by p is excluded.

**Checks.**

- The conclusion concerns the canonical integral branch; multiplying it by p would change μ.
- At p=2 use q=4 and retain the normalized 1/2 factors before taking residues.

**Prerequisites after assembly:** `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet`, `DirichletPadicLFunctions:L2`, `PadicMeasuresIwasawaAlgebras:L4/iwasawa-invariants`. The old digit-separation proof is replaced.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet`, `IntegralIwasawaTheory:L4/kubota-leopoldt-gamma-transform`, `IntegralIwasawaTheory:L4/sinnott-mu-theorem`. G3's analytic adapter is closed by Sinnott's proof, which covers every p including 2.

**Sources.**

- Oesterlé, §4A(b) and §5A, pp. 174–177; the power-series content criterion there: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

### Washington's theorem on the non-p-part of class numbers

**Theorem target:** `IntegralIwasawaTheory:L4/washington-non-p-part` (new in this part).

Let k be a finite abelian extension of ℚ, p a prime, k_∞/k the cyclotomic ℤ_p-extension with layers k_n, and ℓ ≠ p a prime. Then the exponent e_n(ℓ) of ℓ in h(k_n) is bounded independently of n; in fact it is constant for n large. (In the consumer's letters the tower prime is ℓ and the class-group prime is p.) This is a different theorem from Ferrero–Washington's μ = 0.

**Hypotheses and conventions.** k abelian over ℚ; cyclotomic tower only (Washington exhibits non-cyclotomic ℤ_p-extensions where e_n(ℓ) is unbounded).

**Construction or proof.**

1. First arrange qp∤conductor by Washington 1975 Lemma 1 (p. 179): split each finite character into its first-kind and cyclotomic parts; the original and first-kind towers have the same sufficiently high fields after a fixed shift. Washington 1975 Theorem 2 (p. 183) supplies bounded relative ℓ-part for p=2 (also p=3). For all p, Proposition 2 (p. 186) reduces full boundedness to relative boundedness after adjoining μ_ℓ; this extension has degree prime to ℓ, so class-group extension is injective.
2. Use the relative class number formula with characters χψ_n^j, ψ_n of conductor p^{n+1}, and the trace formula of Lemma 1 (pp. 89–90) expressing T_{n,m}(½ψ_n(α)^{−1}B_{1,χψ_n}) through p-adic digit sums s_{n−m}(αη), η in the sign-arranged representative set E.
3. Choose m_1 with all primes above ℓ inert in F_∞/F_{m_1}; a vanishing B_{1,χψ_n} mod a prime above ℓ for infinitely many n forces the trace congruence for all α.
4. Proposition 1 (statement p. 91, proof §4, pp. 95–97): for ℚ-independent β_j ∈ ℤ_p, given residues g_j mod d (p ∤ d), targets x_j and ε, for all large n some α ≡ 1 mod p^M has s_n(αβ_j) ≡ g_j mod d and |p^{−n−1}s_n(αβ_j) − x_j| < ε. The proof stores every finite digit pattern inside the expansions of a jointly normal family {γβ_j}; joint normality for almost every γ is Proposition 4 (p. 95), which Washington takes from Ferrero–Washington and which is the parent L4/fw-digit-equidistribution.
5. Case p ∤ f_χ (pp. 91–94): Proposition 2, with L4/torsion-root-sign-arrangement, gives α_1, α_2 whose digit sums agree except for η_0, where they differ by a carry; subtracting the two instances of Lemma 1 leaves −p^{n−m}ζ_0^{−1} ≢ 0 mod the prime above ℓ, contradicting the congruence.
6. Case p | f_χ (pp. 94–95): Proposition 3, the same construction with residues a and a − p modulo pd, leaves −χ(a − p)ζ_0^{−1}p^{n−m′}, nonzero because (a − p, pd) = 1.
7. Reduction to the full class number (Washington 1975, Lemmas 4–6 and Propositions 1–2, pp. 184–186): if ℓ=2 use r_2(A_n^+)≤1+v_2(h_n^−); if ℓ is odd, use the Kummer pairing to get r_ℓ(A_n^+)≤r_ℓ(A_n^−)+1. Bounded relative orders therefore bound plus ranks. In a ℤ_p-tower with ℓ≠p, equal adjacent ℓ-ranks force equal ℓ-class groups: norm is onto and the order-p action on A_n/ℓA_n becomes trivial, then on A_n. Any strict increase has a faithful cyclic p^n action on a subquotient over 𝔽_ℓ, whose dimension is at least ord_(p^n)(ℓ), tending to infinity. Thus bounded rank forces eventual constancy. For real base fields, pass to an imaginary quadratic CM extension and descend using the surjective class norm.

**Checks.**

- The analogue with ℓ = p is false: for p = 37 and k = ℚ(μ_37) the 37-part of h(k_n) is unbounded (λ ≥ 1, L2/tower-iwasawa-invariants).
- It is false for some non-cyclotomic ℤ_p-extensions (Washington, p. 87, citing Washington 1975).

**Prerequisites:** `IntegralIwasawaTheory:L4/torsion-root-sign-arrangement`, `IntegralIwasawaTheory:L4/fw-digit-equidistribution`, `IntegralIwasawaTheory:I.6/minus-class-number-formula`, `IntegralIwasawaTheory:L2/zp-extension`, `mathlib:NumberField.classNumber`, `mathlib:DirichletCharacter`, `IntegralIwasawaTheory:I.2/cm-minus-class-modules`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

**Sources.**

- Lawrence C. Washington, Theorem, p. 87; §2 and Lemma 1, pp. 88–90; §3, Propositions 1–3 and the two cases, pp. 91–95; §4, proof of Proposition 1, pp. 95–97: States and proves boundedness of the ℓ-part of h_n in the cyclotomic ℤ_p-extension of an abelian field, ℓ ≠ p, for p ≥ 3, citing Washington 1975 for p = 2 and the reduction to the minus part.
- Lawrence C. Washington, Lemma 1, p. 179; Theorem 2, p. 183; Lemmas 4–6, Propositions 1–2, pp. 184–186; Theorem 3, p. 187: Supplies the conductor shift, dyadic case, relative-to-full reduction and eventual constancy from bounded prime-to-p rank.

**Planet:** Washington's ℓ-part theorem.

### Greenberg’s cyclotomic conjecture

**Definition target:** `IntegralIwasawaTheory:L4/greenberg-p-primary-formulation` (target of the I.8 pass, id unchanged).

For a totally real number field E and prime p, Greenberg(E,p) is the conjectural assertion μ(E∞/E)=λ(E∞/E)=0 for the cyclotomic Z_p-extension. Its formal equivalent is that the p-primary orders #Cl(E_n){p} are bounded. For abelian E, Ferrero–Washington reduces this assertion to λ=0 but does not prove it.

**Hypotheses and conventions.** The general assertion is recorded as a conjecture; the equivalence is a theorem about the defined invariants.

**Construction or proof.**

1. Apply the general growth theorem with μ,λ nonnegative: bounded orders force both to vanish, and their vanishing makes the eventual order constant.
2. A finite initial segment does not affect boundedness. Separate the p-primary order from the full class number and the cyclotomic tower from a general Z_p-extension.

**Uses that determine the API.**

- IntegralIwasawaTheory:L4: Separates the proved μ-vanishing theorem from the conjectural λ-vanishing assertion.
- ArithmeticKTheory:N.7: Allows conditional use of vanishing without converting it into an unconditional theorem.

**Proposed API.**

- `TauCeti.IntegralIwasawa.greenberg_iff_pClassOrder_bounded` (characterisation): Greenberg(E,p) iff the sequence of p-primary class-group orders of the cyclotomic layers is bounded.
- `TauCeti.IntegralIwasawa.greenberg_iff_eventually_constant` (characterisation): Under the growth theorem it is also equivalent to eventual constancy of those p-primary orders.
- `TauCeti.IntegralIwasawa.greenberg_abelian_iff_lambda_zero` (compatibility): For abelian E, use Ferrero–Washington to identify Greenberg(E,p) with λ=0.

**Unit tests.**

- `greenberg_Q` (computation): For Q the cyclotomic p-class module is zero, by the one-prime base-class argument, so the predicate holds.
- `greenberg_bounded_rank_not_enough` (non-example): The elementary model Λ/(T−p), p odd, has bounded p-rank and μ=0 but λ=1 and unbounded p-primary orders.
- `greenberg_prime_to_p_invisible` (non-example): Growth of a prime-to-p part does not change this predicate; bounded full class numbers are a strictly different assertion.

**Checks.**

- No proof of Greenberg’s conjecture is claimed.

**Prerequisites:** `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`, `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`.

**Exact suppliers after this pass:** refined by `IntegralIwasawaTheory:L2/tower-iwasawa-invariants`. Its invariants are the defined tower invariants.

**Sources.**

- RJW, Conjecture A.15, p. 207, with the scope and p-primary corrections recorded in E90: Supplies the stated arithmetic result or the indicated construction/proof route; statements here are paraphrases, with the corrections recorded below.

**Planet:** Greenberg’s conjecture.

## Requests to other roadmaps

- `PadicMeasuresIwasawaAlgebras:L5` (existing supplier): Exactness of inverse limits of short exact sequences of compact Hausdorff groups with continuous maps, and topological Nakayama for compact Λ-modules; supplied by the merged Tau Ceti roadmap PadicMeasuresIwasawaAlgebras §5.2 (no new work). Needed by `IntegralIwasawaTheory:L1/compact-limit-exactness-application`, `IntegralIwasawaTheory:L2/finite-layer-cutoff`.
- `PadicMeasuresIwasawaAlgebras:L2` (existing supplier): Amice transforms of o-valued measures on ℤ_p, restriction to compact open subsets, multiplicative translation and pushforward along ℤ_p ≅ 1 + qℤ_p (merged Tau Ceti roadmap, layer 2). Needed by `IntegralIwasawaTheory:L4/gamma-transform`, `IntegralIwasawaTheory:L4/sinnott-mu-theorem`.
- `PadicMeasuresIwasawaAlgebras:L3` (existing supplier): Integration of unit measures against the characters x ↦ ⟨x⟩^s (merged Tau Ceti roadmap §3.2). Needed by `IntegralIwasawaTheory:L4/gamma-transform`.
- `DirichletPadicLFunctions:L2` (existing supplier): For an odd primitive character θ of the first kind with θω ≠ 1: Iwasawa's series g(T, θ) ∈ 2o⟦T⟧ with L_p(s, θω) = g(u^s − 1, θ), the Hurwitz/Bernoulli moment formula L(−k, ε) for periodic ε, and the p = 2 normalisation with q = 4. Needed by `IntegralIwasawaTheory:L4/kubota-leopoldt-gamma-transform`, `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet`.
- `DiophantineApproximationAndTranscendence:DT.3` (existing supplier): Qualitative p-adic Baker–Brumer through the parent's deep-unit adapter (LinearFormsInLogarithms §8.10), unchanged from the parent packet. Needed by `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity` (existing supplier): Global Artin reciprocity for the Galois groups of abelian extensions (Tau Ceti ClassFieldTheory layer 11). Needed by `IntegralIwasawaTheory:L2/zp-extension-ramification`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence` (existing supplier): Global existence, the norm index and finiteness of the class group's Hilbert class field (Tau Ceti ClassFieldTheory layer 12). Needed by `IntegralIwasawaTheory:L2/zp-extension-ramification`, `IntegralIwasawaTheory:L2/norm-prank-descent`, `IntegralIwasawaTheory:L1/greither-module-dictionary`.
- `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields` (existing supplier): Compatibility of the Artin map with norms of ideals (artinMap_norm) and class fields of subextensions (Tau Ceti ClassFieldTheory layer 13). Also norm-surjectivity for CM to real wide class groups and the Kronecker–Weber/conductor description for finite abelian extensions. Needed by `IntegralIwasawaTheory:L2/norm-prank-descent`, `IntegralIwasawaTheory:L4/minus-mu-from-analytic`, `IntegralIwasawaTheory:L1/greither-module-dictionary`, `IntegralIwasawaTheory:L4/dyadic-relative-to-full-mu`, `IntegralIwasawaTheory:L4/washington-non-p-part`.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-9-prerequisites-two-owned-inputs` (existing supplier): Exactness of limits of compact inverse systems along towers (exists_forall_map_succ_eq_and_forall_eq_of_surjective), as used by PadicMeasuresIwasawaAlgebras §5.2. Needed by `IntegralIwasawaTheory:L1/compact-limit-exactness-application`.

- `IntegralIwasawaTheory:I.6` (requested refinement of existing owner): Exact ordinary relative class-number formula h(k_n)/h(k_n^+)=Q_n w_n ∏_(χ odd)(−B_(1,χ)/2), with Q_n∈{1,2}, w_n the roots-of-unity order, and the wide CM-to-real norm comparison at 2. Refine the existing minus-class-number-formula owner: its modified-class equality up to an unspecified power of 2 alone does not supply the dyadic valuation. Sources: Washington 1978 §2 p. 88 and Ferrero 1978 §1.1 p. 10. Needed by `IntegralIwasawaTheory:L4/minus-mu-from-analytic`.

The all-prime zeta residue is the existing exact node `DirichletPadicLFunctions:L3/rjw2-principal-residue`, whose s-coordinate and dyadic numerator normalization are used above.

## Requests from other roadmaps answered here

- From `ArithmeticKTheory:N.7/vandiver-separation` (met): `IntegralIwasawaTheory:L3/vandiver-condition`, `IntegralIwasawaTheory:L3/vandiver-plus-part-tower`. The single predicate stays the parent's; transport along a ℚ-isomorphism is its API item vandiver_transport.
- From `ArithmeticKTheoryPartII:AK2.7/vandiver-fixed-prime` (met): `IntegralIwasawaTheory:L3/vandiver-plus-part-tower`. Vandiver(p) iff the plus part of Cl(ℚ(μ_{p^n}))[p^∞] vanishes for every n; p = 37 separates it from regularity.
- From `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing` (met): `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`. Generic theorem with Iwasawa's logarithm and multiplicative reduction, including p = 2; the character projection remains the Dirichlet roadmap's.
- From `EulerSystemsCyclotomicMainConjecture:L4 (Greither §4)` (met on the nontrivial tame component): `IntegralIwasawaTheory:L1/greither-module-dictionary`, `IntegralIwasawaTheory:L1/iwasawa-rank-theorem`, `IntegralIwasawaTheory:L2/one-prime-inertia-control`. Greither's full A′(F) retains Γ. The identity with p-ramified coinvariants is valid after applying 1−e_0, exactly as needed in Theorem 4.11; A′ is never redefined as torsion. The one-prime commutator sequence is RJW Proposition A.5.
- From `EulerSystemsCyclotomicMainConjecture:L4 (coinvariant lemma and Washington pp. 277–278)` (partly met): `IntegralIwasawaTheory:L2/coinvariant-evaluation`, `IntegralIwasawaTheory:L2/general-inertia-control`, `IntegralIwasawaTheory:L2/inertia-kernel-norm-relation`. The coinvariant lemma (Coates Lemma 9 form, with N_χ for unramified O_χ) and the inertia-kernel construction (Washington's Y_0 is the parent's H_0 description) are met. Rubin's Lemma 1.2 bounds on Tate cohomology of units and Greither's finite exceptional ω control are Euler-system arguments and stay with EulerSystemsCyclotomicMainConjecture.
- From `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/theorem-a` (met): `IntegralIwasawaTheory:L4/washington-non-p-part`. Washington 1975 supplies the dyadic case and relative-to-full reduction; Washington 1978 proves the remaining cases. The requested L4 → R21.5 edge is justified.
- From `Polylogarithms:P.6` (met): `IntegralIwasawaTheory:L4/abelian-leopoldt`, `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form`.
- From `RankZeroOneBSD:BSD.7a/distinguished-lattice-integral-input` (met): `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet`.
- From `SpecialValuesBirchTate:B.4/B.5/B.8` (met): `IntegralIwasawaTheory:L2/coinvariant-evaluation`. Both dual conventions and their evaluation points are stated.
- From `SpecialValuesBirchTate:B.5/federer-conjecture-for-abelian-fields` (met): `IntegralIwasawaTheory:L4/minus-mu-from-analytic`, `IntegralIwasawaTheory:L4/dyadic-relative-to-full-mu`. First prove relative μ=0, then full dyadic μ=0 by the subexponential-rank argument. The norm-kernel inverse limit is a submodule of the full norm limit; the direct norm-kernel dual is a quotient of the full direct dual. Both have μ=0. No dyadic minus pseudo-isomorphism is assumed.

## Gaps and completion

The two former L4 gaps are discharged: Washington 1975 Lemma 1, Theorem 2 and Proposition 2 supply G-L4-W75; Ferrero 1978 Lemmas 1.6–1.7 and Theorem 1.8, with Washington 1975 Lemma 4, supply the dyadic passage G-L4-DYADIC-MIRROR. The dyadic proof uses r_2(A_n)/2^n→0, rather than the stronger odd-prime rank inequality. L4/minus-mu-from-analytic first proves relative μ=0, and L4/dyadic-relative-to-full-mu then proves full μ=0 and the direct minus dual consequence. The original G3 route is replaced by these sourced arguments and Sinnott’s analytic proof. The exact all-prime ordinary relative class-number formula remains an explicit interface refinement for its existing I.6 owner. No unassigned L4 gap remains in this packet; L1’s dyadic real-sign extension is still an inherited supplier limitation, and all refinement edges still need assembly.

## Ownership changes and assembly instructions

inheritedTargets.newNodes records which refinements discuss each inherited target; it does not add prerequisite edges. Apply only refinementEdges, with their stated replacements, and supersededNodes. In particular never add tower-iwasawa-invariants as an input of arithmetic-class-number-growth: the definition imports that theorem. Never add rjw-iwasawa-modules as an input of cyclotomic-class-field-specialization or the real-tower application as an input of the general one-prime control theorem. removeInputs deletes the listed old prerequisites before adding input; replaceAllPrerequisites makes that input the sole prerequisite. Apply these replacements before checking cycles. In particular the legacy Bernoulli obstruction follows from Ferrero–Washington only after its old reverse edge is removed.

- `IntegralIwasawaTheory:L4/leopoldt-defect` is superseded as a definition by `IntegralIwasawaTheory:I.2/leopoldt-map-and-defect`; its logarithmic characterisation remains in L4/abelian-leopoldt-i2-form.
- Apply these refinements at assembly; this review does not edit the accepted parent packet:
  - `IntegralIwasawaTheory:L4/minus-mu-from-analytic` → `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`: Replace the old Bernoulli-obstruction/digit route by relative class numbers, odd reflection and the dyadic rank argument. Retain bounded-p-rank-mu-zero and the class-field supplier. Delete `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`, `IntegralIwasawaTheory:L4/fw-digit-separation`.
  - `IntegralIwasawaTheory:L4/mirror-inequality-odd` → `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`: As above.
  - `IntegralIwasawaTheory:L2/norm-prank-descent` → `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`: As above.
  - `IntegralIwasawaTheory:L4/analytic-mu-vanishing-dirichlet` → `IntegralIwasawaTheory:L4/fw-analytic-mu-zero`: Replace the old digit proof by the all-prime Sinnott adapter, including the exact principal-residue node below it. Delete `IntegralIwasawaTheory:L4/fw-digit-separation`, `DirichletPadicLFunctions:L3`.
  - `IntegralIwasawaTheory:L4/torsion-root-sign-arrangement` → `IntegralIwasawaTheory:L4/fw-digit-separation`: Closes the dependent-root lattice step.
  - `IntegralIwasawaTheory:L4/abelian-leopoldt-i2-form` → `IntegralIwasawaTheory:L1/principal-global-unit-closures`: Replace the prerequisite L4/abelian-leopoldt read through the superseded L4/leopoldt-defect.
  - `IntegralIwasawaTheory:L1/compact-limit-exactness-application` → `IntegralIwasawaTheory:L1/four-term-cyclotomic-sequence`: Replace the stage-level PadicMeasuresIwasawaAlgebras:L5 contract.
  - `IntegralIwasawaTheory:L1/global-local-dictionary` → `IntegralIwasawaTheory:L1/finite-ray-principal-sequence`: Replace the stage-level I.2 contract.
  - `IntegralIwasawaTheory:L2/real-cyclotomic-one-prime-tower` → `IntegralIwasawaTheory:L3/vandiver-unramified-vanishing`: Discharges the one-prime hypotheses.
  - `IntegralIwasawaTheory:L3/coleman-zeta-normalisation` → `IntegralIwasawaTheory:L3/vandiver-cyclic-isomorphism`: Fixes the Coleman normalisation.
  - `IntegralIwasawaTheory:L2/finite-layer-cutoff` → `IntegralIwasawaTheory:L2/arithmetic-class-number-growth`: Discharges the cutoff-growth contract.
  - `IntegralIwasawaTheory:L2/zp-extension-ramification` → `IntegralIwasawaTheory:L2/general-inertia-control`: The eventual-ramification part.
  - `IntegralIwasawaTheory:L4/dyadic-relative-to-full-mu` → `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero`: Use the dyadic norm/extension inequality and subexponential-rank criterion; no odd-prime projector at 2.
  - `IntegralIwasawaTheory:L4/fw-arithmetic-mu-zero` → `IntegralIwasawaTheory:L4/fw-bernoulli-obstruction`: The legacy implication has impossible hypothesis μ>0 by Ferrero–Washington. Keep its statement, replace its old proof by this consequence, and remove the reverse obstruction-to-Ferrero–Washington edge.
- Planet proposal for `IntegralIwasawaTheory:L4`: drop `IntegralIwasawaTheory:L4/leopoldt-defect`, `IntegralIwasawaTheory:L4/fw-digit-equidistribution`; add `IntegralIwasawaTheory:L4/sinnott-mu-theorem`, `IntegralIwasawaTheory:L4/washington-non-p-part`. The Leopoldt defect is now I.2's notion, and digit equidistribution is no longer on the route to Ferrero–Washington; the swap keeps L4 at six planets.
- The edge `IntegralIwasawaTheory:L4` → `OrdinaryAutomorphicFormsAndModularityLifting:R21.5` requested by RT-AREA-langlands-2/32 is supplied by `IntegralIwasawaTheory:L4/washington-non-p-part`.

## Source findings

- **IntegralIwasawaTheory/E94** (misprint, Proof of Proposition 3.4.3, p. 91 of SHARIFI): The proof twice refers to a Lemma 2.4.10 for the criterion that μ vanishes iff the p-ranks of the Γ_n-coinvariants are bounded. Correction: The criterion is Proposition 2.4.10 (p. 58); there is no Lemma 2.4.10. Section 2.4 numbers Lemma 2.4.8, Definition 2.4.9 and Proposition 2.4.10 consecutively, and Proposition 2.4.10 is exactly the bounded π-rank criterion used. Affects: nothing. Independent review confirmed the two cross-references against Proposition 2.4.10, p. 58.
- The inherited findings E81–E91 and E92–E93 of the I.8 pass stay recorded there; the corrections they make (unit carriers and ranks, the quotient U/E, compactness instead of finite generation, ν ∈ ℤ, the scope of Greenberg's conjecture) are used above.

## Library check

Read at Mathlib 082e2d3 and Tau Ceti f790474: `mathlib:ContinuousMulEquiv` (Mathlib/Topology/Algebra/ContinuousMonoidHom.lean), `mathlib:CyclotomicField` (Mathlib/NumberTheory/Cyclotomic/Basic.lean), `mathlib:DirichletCharacter` (Mathlib/NumberTheory/DirichletCharacter/Basic.lean), `mathlib:DirichletCharacter.Odd` (Mathlib/NumberTheory/DirichletCharacter/Basic.lean), `mathlib:InfiniteGalois.fixedField_fixingSubgroup` (Mathlib/FieldTheory/Galois/Infinite.lean), `mathlib:IsGalois` (Mathlib/FieldTheory/Galois/Basic.lean), `mathlib:IsPrimitiveRoot` (Mathlib/RingTheory/RootsOfUnity/PrimitiveRoots.lean), `mathlib:NumberField.IsCMField` (Mathlib/NumberTheory/NumberField/CMField.lean), `mathlib:NumberField.IsCMField.complexConj` (Mathlib/NumberTheory/NumberField/CMField.lean), `mathlib:NumberField.classNumber` (Mathlib/NumberTheory/NumberField/ClassNumber.lean), `mathlib:NumberField.maximalRealSubfield` (Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean), `mathlib:PadicInt` (Mathlib/NumberTheory/Padics/PadicIntegers.lean), `mathlib:PowerSeries` (Mathlib/RingTheory/PowerSeries/Basic.lean), `mathlib:krullTopology` (Mathlib/FieldTheory/KrullTopology.lean). Tau Ceti has no Iwasawa-module, Γ-transform or class-number-growth declarations at the pin; `TauCeti.Iwasawa.card_quotient_growthTransition` and the compact inverse-system lemmas cited by PadicMeasuresIwasawaAlgebras postdate the pin and are used only through that roadmap.

