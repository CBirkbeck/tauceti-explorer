# Perfectoid quotients and their prismatic prerequisites

This roadmap constructs universal perfectoid quotients. If an ordinary ring `S`
is derived `p`-complete and is a quotient of an integral perfectoid ring, there is
a universal integral perfectoid ring `S_perfd` under `S`. The principal theorem
says that the canonical map `S → S_perfd` is surjective. Applied to integral
models of affinoid perfectoid Tate rings, it constructs the perfectoid space
associated with any Zariski closed subset, with its coordinate ring, topology,
plus ring and universal mapping property.

The integral algebra is useful independently of the geometric application. It
includes a torsion-allowing perfectoid predicate, elementary Witt-vector
calculations, reducedness, torsion removal, `p`-integral closure and completed
ring operations. Initial prisms connect this algebra to prismatic cohomology.
Quasisyntomic lifting and André's flatness lemma supply the covers used to prove
surjectivity. A second root-adjunction construction over a fixed perfectoid
field records the almost faithfully flat variant and its functorial iteration.

## Scope and neighbouring roadmaps

The layers are the integral part of `Q0`, the imported prism and animation
interfaces of `Q0:animated-application`, smooth prismatic comparison in `Q1`,
initial prisms and perfectoidization in `Q2`, flat covers and root extensions in
`Q3`, and universal quotients in `Q4`. The integral prefix has layer id
`PerfectoidQuotients:Q0:integral-algebra`; the broad `Q0` denotes this prefix
together with its prism applications. Related targets are grouped below so
that their hypotheses and the steps between them remain visible.

The following ownership boundaries determine which constructions are imported.

| Roadmap layer | Interface used here |
| --- | --- |
| `PrismaticCohomology:PR.0` | δ-rings, distinguished elements, prisms and their morphisms, rigidity of prism ideals, completed prism perfection, perfect-prism/perfectoid correspondence, Tor independence and prismatic envelopes. |
| `PrismaticCohomology:PR.1` | The smooth prismatic site and its cohomology, Hodge–Tate, crystalline and de Rham comparisons, and initiality of the perfect prism of a perfectoid ring. |
| `PrismaticCohomology:PR.2` | Derived prismatic cohomology and filtration, comparison with the site, the QRSP prism and the existing quasisyntomic lifting theorem. |
| `DerivedDeRhamCohomology:DD.0` | The full cotangent complex, derived exterior powers and the quasisyntomic condition. |
| `DerivedDeRhamCohomology:DD.1` | Derived completion, complete flatness and its descent, torsion comparisons, and completion/colimit exchange. |
| `DerivedDeRhamCohomology:DD.5` | Quasiregular semiperfectoid rings and elementary quasisyntomic covers. |
| `EnhancedDerivedSheaves:E5:animation` | Animated commutative rings, their universal property and sifted colimits. |
| `CrystallineCohomology:CR.0` | Divided-power envelopes, including the characteristic-`p` calculation used in the ind-syntomic refinement. |
| `PerfectoidSpaces:P0` | Almost modules, almost flatness, almost-elements saturation and limits in the specified almost category. |
| `PerfectoidSpaces:P1` | Perfectoid Tate rings and the integral/Tate and powerbounded dictionaries. |
| `PerfectoidSpaces:P2` | Rational localization, approximation and its almost integral models. |
| `PerfectoidSpaces:P3` | Tilting and its analytic compatibilities. |
| `PerfectoidSpaces:P4` | Universal perfectoid Zariski closed spaces, their plus rings and closed-immersion carriers. |
| `PerfectoidSpaces:P5` | Completed colimits of perfectoid pairs and preservation of perfectoidness. |

The integral predicate and the semiperfectoid condition belong here. Generic
quasisyntomic and QRSP predicates retain their `DD.0` and `DD.5` owners. The
quasisyntomic lifting result is applied through
`PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms`; its use in `Q3`
does not introduce a second declaration of that theorem. Likewise `P4` supplies
the universal closed analytic object; `Q4` proves the stronger algebraic image
statement and identifies its integral model.

General integral perfectoidization of arbitrary animated rings, arc descent and
the `J`-almost purity results of Bhatt–Scholze §§8–10 belong to
`PerfectoidQuotientsPartIIIntegralPerfectoidization`. General fibre-product and
valuation methods, including the stronger ordinary ind-syntomic André theorem
of Česnavičius–Scholze Proposition 2.3.4, belong to `IntegralPerfectoidPartII`.
Frobenius-approximating towers remain with `PerfectoidSpaces:P7`. None of these
later results is an input to the proof of the `Q4` surjectivity theorem. In
particular, the base-change theorem of Bhatt–Scholze Proposition 8.5 cannot be
used to prove Theorem 7.4, which it already uses. The same dependency order
applies to later applications in `AdicEtaleGeometry:A3`.

## Conventions and existing foundations

Fix a prime natural number `p`. All rings are commutative and unital, all ring
maps preserve the unit, and the zero ring is allowed. Families are small in a
fixed universe; universal properties are stated in compatible universes before
choosing representatives. A perfect ring of characteristic `p` means that the
`p`-power endomorphism is bijective. A monic polynomial whose root is asserted
always has positive degree. Absolute integral closedness below is this
monic-root property for possibly nondomain rings.

Ordinary `I`-adic completion is `lim_n R/I^n`, including separation. Derived
completion is the `DD.1` functor in the derived or animated category. A chosen
pseudouniformizer `ϖ` determines a third, explicitly specified topology.
Comparisons between these completions carry their hypotheses; divisibility
`ϖ^p | p` alone does not identify the `ϖ`-adic and `p`-adic topologies. The
torsion-allowing normalization uses the canonical torsion-free/reduced
decomposition when necessary. For finite sharp ideals, reducedness and the
Stacks separation criterion enter the derived/ordinary comparison.

Write `R♭ = lim_F R/p` and `A_inf(R) = W(R♭)`. This inverse perfection is
Mathlib's [`PreTilt R p`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfection.lean#L634).
The direct root-adjoining [`PerfectClosure R p`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/PerfectClosure.lean#L68) is a
different construction. Sharp `x ↦ x♯` is multiplicative; Fontaine's
`θ : A_inf(R) → R` is a ring map. Subscript `ξ₁` means Witt coordinate one.
In a Teichmüller `p`-adic expansion its corresponding digit is `F⁻¹(ξ₁)`;
calculations must preserve this distinction. An orientation is a chosen
generator of a prism ideal. The integral predicate does not include a chosen
orientation.

Almost statements specify the root ideal
`m = (ϖ^(1/p^n) : n ≥ 0)` or, over a fixed field, the analogous ideal generated
by the roots of `t`. They are statements in `P0`'s almost module category.
Ordinary faithful flatness, `p`-complete faithful flatness and almost faithful
flatness modulo `t` are distinct conclusions. A Huber pair always retains its
explicit plus subring. Complete analytic objects are also Hausdorff, and their
universal properties use continuous maps of pairs where the plus ring matters.

The library baseline is Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The following Mathlib interfaces are
used directly rather than reconstructed.

| Existing interface | Generality relevant here |
| --- | --- |
| [`IsAdicComplete`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/AdicCompletion/Basic.lean#L56), `AdicCompletion` | Ordinary complete and separated modules and inverse-limit completions. The completion carrier alone does not assert completeness for an arbitrary ideal. |
| `IsAdicComplete.subsingleton`, `IsAdicComplete.le_jacobson_bot` | Completeness at the unit ideal forces the zero ring; a complete ring's defining ideal lies in its Jacobson radical. |
| `PreTilt`, `PreTilt.coeff`, `PreTilt.untilt` | Inverse perfection of `R/p`, its coordinate maps and the multiplicative sharp map. The pinned ring instances use nonunit `p`. |
| [`WittVector.fontaineTheta`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/FontaineTheta.lean#L165), `WittVector.mk_fontaineTheta`, `WittVector.fontaineTheta_teichmuller` | Fontaine's map for a `p`-complete ring with nonunit `p`, its reduction modulo `p` and its value on Teichmüller representatives. |
| `surjective_fontaineTheta` | Surjectivity of Frobenius on `R/p` suffices for surjectivity of `θ`; principal kernel is additional mathematics. |
| `WittVector.ker_constantCoeff`, `WittVector.quotientPEquiv`, `WittVector.isAdicCompleteIdealSpanP` | For perfect characteristic-`p` rings, `W(k)/(p) ≃ k` and `W(k)` is `p`-adically complete. |
| `WittVector.eq_zero_of_p_mul_eq_zero`, `WittVector.mem_span_p_iff_coeff_zero_eq_zero`, `WittVector.mem_span_p_pow_iff_le_coeff_eq_zero` | `p` is a nonzerodivisor in `W(k)` for perfect `k`; divisibility by `p^n` is detected by the first `n` Witt coordinates. |
| `WittVector.map`, `Perfection.map`, `Perfection.lift` | Functorial Witt vectors and inverse perfection; the last map uses a perfect source and characteristic-`p` source and target. |
| `PerfectRing`, `frobeniusEquiv`, `PerfectRing.ofSurjective` | Bijective Frobenius and its inverse; reducedness plus surjectivity gives perfectness in prime characteristic. |
| `Ideal.Quotient.lift`, `Ideal.quotientMap`, `Ideal.isRadical_iff_quotient_reduced` | Quotient maps and their actual kernel conditions; radical ideals correspond to reduced quotients. |
| `Subring.closure`, `integralClosure`, `Localization.Away` | Actual subrings, ordinary integral closure and localization carriers for `p`-integral closure and torsion removal. |
| `AdicCompletion.map_surjective`, `AdicCompletion.of_surjective`, `AdicCompletion.map_of` | Completion preserves any surjective module map; a precomplete module surjects onto its completion; the maps commute with canonical completion units. There is no Noetherian or finite-generation hypothesis in the first assertion. |

The complete theory of δ-rings, prisms, animated rings, full cotangent complexes,
derived completion and perfectoid analytic spaces is supplied by the roadmap
layers above. A Witt Frobenius endomorphism or a two-term naive cotangent
complex cannot stand in for the finite length-reducing Frobenius or the full
cotangent complex used here. In particular, finite Witt maps
`W_(r+1)(R) → W_r(R)` and the corresponding `θ_r` must be provided with their
correct source and target.

Suggested names below lie in `TauCeti.PerfectoidQuotients`, except the three
general Witt-quotient lemmas in `TauCeti.Perfectoid`. [Suggested.lean](Suggested.lean)
gives statements on available library carriers and documents the interfaces
needed to type the remaining statements. This README specifies the whole
development. A `sorry` in that file marks a theorem to prove; elaboration of
its type supplies no proof.

## Layer Q0: integral perfectoid algebra

### Integral rings, units and characteristic p

Define `IsIntegralPerfectoid p R` using the normalization of BMS2 Definition
4.18. In the nonzero case, require ordinary `p`-adic completeness and
separation, an element `π` and a unit `u` with `π^p = p u`, surjective
Frobenius on `R/p`, and a principal kernel of `θ`. Include the zero ring
explicitly. This branch permits the actual pinned `PreTilt` and `θ`
instances, which require nonunit `p`, without excluding a mathematical zero
object. A separated `p`-complete ring with unit `p` is necessarily zero.
`IsIntegralPerfectoid.iff_nontrivial` exposes precisely these three remaining
clauses when the nonunit and completeness instances are supplied.

Develop the predicate with the following API. A generator of `ker θ` is
existential data, not part of the chosen structure. The Frobenius and kernel
projections must provide the actual maps and ideals used by later proofs.

| API name | Required statement |
| --- | --- |
| `IsIntegralPerfectoid.of_subsingleton` | Every zero ring is integral perfectoid. |
| `IsIntegralPerfectoid.complete` | An integral perfectoid R is classically p-adically complete and separated. |
| `IsIntegralPerfectoid.has_p_root` | There exist π in R and a unit a with π^p=pa. |
| `IsIntegralPerfectoid.iff_nontrivial` | With the existing nonunit-p and completeness instances, the predicate is exactly the root condition, Frobenius surjectivity on ModP, and a principal kernel of the existing Fontaine map. |
| `IsIntegralPerfectoid.congr` | A ring equivalence R≃S preserves and reflects the predicate, with p fixed. |
| `integralPerfectoid_iff_perfect` | For a ring of characteristic exactly p, integral perfectoidness is equivalent to Mathlib PerfectRing R p. |

The predicate must accept products and characteristic-`p` perfect rings, while
rejecting merely semiperfect nonreduced rings. Its tests fix these distinctions.

| Test name | Required statement |
| --- | --- |
| `zeroRing` | ZMod 1 is integral perfectoid for every prime p. |
| `primeField` | ZMod p is integral perfectoid for every prime p. |
| `zmodFour` | ZMod 4 is not integral perfectoid at p=2: no π and odd unit a satisfy π²=2a. |
| `polynomial` | F₂[t] is not integral perfectoid at 2: Frobenius misses t. |
| `dualNumbers` | TrivSqZeroExt F₂ F₂ is not integral perfectoid: its nonzero square-zero element is not a square. |
| `semiperfectNotPerfect` | If A=PerfectClosure(F₂[t],2) and t denotes the image of the polynomial variable, A/(t) is not integral perfectoid although its squaring map is surjective. The class t^(1/2) is nonzero and square-zero. |
| `semiperfectSquaring` | Squaring is surjective on PerfectClosure(F₂[t],2)/(t); this separates the principal-kernel condition from Frobenius surjectivity. |
| `productField` | F_p × F_p is integral perfectoid, so a domain or valuation-ring condition would be too strong. |
| `perfectRingAgreement` | Every ring of characteristic p with the baseline PerfectRing instance satisfies the predicate. |

Three algebraic lemmas support the characteristic-`p` comparison. For any
characteristic-`p` ring `k`, an inverse-perfection element is a unit exactly
when its zeroth coordinate is a unit (`perfection_isUnit_iff`); surjectivity of
Frobenius on `k` is unnecessary. For perfect characteristic-`p` `k`, a Witt
vector is a unit exactly when its constant coordinate is a unit
(`witt_isUnit_iff`). This statement is for perfect rings, including products,
rather than only perfect fields. For arbitrary characteristic-`p` `k`, prove

```text
(xy)₁ = x₀^p y₁ + x₁ y₀^p.
```

This is `witt_mul_coeff_one` and needs no perfectness assumption. Use the
existing Witt multiplication polynomials; `p` vanishes in `k`, while it need
not vanish in `W(k)`. Unit detection follows by lifting inverses modulo the
complete defining ideal and using its Jacobson property. In inverse perfection
the inverses of the coordinates themselves form a compatible root tower.

For a complete nonzero ring of characteristic exactly `p`, principal `ker θ`
already implies `ker θ = (p)` (`theta_kernel_charP`). Indeed `p` is in the
kernel. Writing `p = ξa`, the first two Witt coordinates and the unit criteria
show that `a` is a unit. The resulting factorization through the existing
isomorphism `W(R♭)/(p) ≃ R♭` proves injectivity of the zeroth tilt projection
(`tilt_projection_injective_charP`). Neither lemma assumes Frobenius
surjective on `R/p` in addition to its stated principal-kernel premise.
Adding the surjectivity clause gives

```text
IsIntegralPerfectoid p R ↔ PerfectRing R p
```

for characteristic exactly `p` (`integralPerfectoid_iff_perfect`), with the
zero ring treated by the explicit branch. The reverse implication uses
`π = 0`, the canonical complete topology at `(p)=0`, and the baseline Witt
kernel calculation. This makes the role of principal kernel visible: the
quotient `PerfectClosure(F₂[t],2)/(t)` has surjective Frobenius but nonzero
nilpotent roots of `t`, so it is not integral perfectoid.

Sources: BMS2 Definition 4.18, preprint p.22, for the predicate and its
nonzero criterion; BMS1 Lemma 3.10 and its proof, pp.22–23, for the unit and
coordinate arguments; BMS1 Example 3.15, p.24, for the characteristic-`p`
comparison. These intermediate unit, coordinate and projection lemmas expose
the calculations in those proofs as reusable statements. Prerequisites for the
predicate are `IsAdicComplete`, `PreTilt`, `WittVector.fontaineTheta` and
`surjective_fontaineTheta`; for the unit lemmas, inverse perfection and Witt
completion; for the characteristic-`p` result, those lemmas,
`WittVector.ker_constantCoeff`, `WittVector.quotientPEquiv` and the nonzero
criterion.

### Naturality, normalization and Fontaine generators

For `p`-complete rings `R,S` with nonunit `p`, a unital map `f : R → S` induces
a quotient map `g : R/p → S/p`. Require explicitly that `g` commutes with the
two quotient maps. Then the induced inverse-perfection and Witt maps satisfy

```text
f(x♯) = (g♭x)♯,
f(θ_R(w)) = θ_S(W(g♭)(w)).
```

The names are `untilt_natural` and `theta_natural`. Prove the first formula
using the sharp congruence modulo `p^(n+1)` for each coordinate and completeness
of the target. For the second, compare maps into `S/p^(n+1)`, where `p` is
nilpotent, using equality on Teichmüller representatives; separation then
identifies the maps into `S`. The pinned theorem
`WittVector.eq_of_apply_teichmuller_eq` is applied only to these nilpotent
quotient targets. Transport completeness, root witnesses, Frobenius
surjectivity and the principal kernel through a ring equivalence to obtain
`IsIntegralPerfectoid.congr`. No chosen generator survives as extra structure
of this predicate.

The broader BMS1 setting begins with `R` ordinarily `ϖ`-complete and separated
and `ϖ^p | p`. Establish the following Frobenius-surjectivity equivalences
(`frobenius_surjectivity_equivalences`):

- every element of `R/(pϖ)` is a `p`th power;
- Frobenius on `R/p` is surjective;
- every element of `R/ϖ^p` is a `p`th power;
- the finite length-reducing maps `F : W_(r+1)(R) → W_r(R)` are surjective for
  every `r ≥ 1`;
- each `θ_r : A_inf(R) → W_r(R)` is surjective for `r ≥ 1`.

Under these equivalent conditions, unit multiples of `ϖ` and of `p` admit
compatible `p`-power roots. The finite Frobenius implication uses the
Davis–Kedlaya criterion with this topology; the infinite Witt Frobenius is a
different map. Prove `integralPerfectoid_bms_iff`: the integral predicate agrees
with BMS1 Definition 3.5 after the required completion and root normalization.
Its `p`-torsion-free specialization agrees with Česnavičius Definition 4.2,
which has `(π^p)=(p)` and the isomorphism `R/π → R/p`. The general map
`R/ϖ → R/ϖ^p` is the criterion of BMS1 Lemma 3.10, rather than the literal
Česnavičius definition. The normalization theorem must handle torsion and
transport `θ`; mere divisibility does not supply the completion comparison.

In the `ϖ`-complete setting, suppose the `p`-power map
`R/ϖ → R/ϖ^p` is surjective. If `ker θ` is principal, that map is an
isomorphism and every kernel generator is a nonzerodivisor in `A_inf(R)`.
Conversely, if the map is an isomorphism and `ϖ` is a nonzerodivisor, then
`ker θ` is principal (`principal_theta_kernel_criterion`). The forward
direction has no torsion-free assumption on `R`. The normalized integral
predicate is a corollary of this comparison, not an assumption that every
`ϖ` satisfying the divisibility condition is a nonzerodivisor.

For nonzero integral perfectoid `R` and `ξ ∈ ker θ`, prove
`theta_generator_iff_unit_coeff_one`: `ξ` generates the kernel exactly when
`ξ₁` is a unit in `R♭`. Every such generator is a nonzerodivisor. After
replacing `π` by a suitable unit multiple with compatible roots, one obtains
a generator `p + [π♭]^p x` with `x` a unit. Naturality and preservation of
units show that maps of perfectoid rings send generators to generators. These
facts also supply the generator comparisons for the finite `θ_r` maps.

Sources: BMS1 Definition 3.1, Lemmas 3.2 and 3.4, pp.19–21, for the sharp and
Fontaine constructions; BMS2 Definition 4.18, p.22, for invariance; BMS1
Definition 3.5, Remark 3.8 and Lemma 3.9, pp.21–22, for normalization and
Frobenius equivalences; Davis–Kedlaya Theorem 3.2, implication `(xiv)′⇒(ii)`,
§3 pp.6–11, for finite Witt surjectivity; Česnavičius Definition 4.2 and
Remarks 4.4–4.5, pp.7–8, for the torsion-free convention; BMS1 Lemma 3.10,
pp.22–23, and Remark 3.11, p.23, for the kernel criterion and generators.
Prerequisites for naturality are the baseline sharp congruence,
`Perfection.map`, `WittVector.map`, Teichmüller evaluation and adic separation.
Invariance uses naturality. Normalization uses the preceding unit criteria,
`DerivedDeRhamCohomology:DD.1/derived-completion` and the torsion decomposition
below. The kernel and generator statements use Witt completeness and the
Frobenius equivalences; the finite-map interfaces are supplied by
`PrismaticCohomology:PR.0`.

### Elementary Witt torsion and cotangent consequences

Let `k` be a perfect ring of characteristic `p`, and let `ξ ∈ W(k)` have unit
Witt coordinate `ξ₁`. The following three lemmas retain this generality,
including zero divisors and products in `k`.

1. `TauCeti.Perfectoid.witt_p_sq_dvd_mul_detects_p`: if `p² | ξg`, then `p | g`.
2. `TauCeti.Perfectoid.witt_principal_p_saturation`: if `p²f ∈ (ξ)`, then
   `pf ∈ (ξ)`.
3. `TauCeti.Perfectoid.witt_principal_quotient_p_torsion`: in `W(k)/(ξ)`,
   `p^n x=0` implies `px=0` for every natural `n`.

For the first lemma compare the initial Teichmüller digits, with digit one
`F⁻¹(ξ₁)`, and use reducedness of perfect `k`. For the second, express the
ideal membership as `p²f=ξg`, divide `g` by `p` using the first lemma, and
cancel `p` in the Witt ring. This cancellation is available even though `ξ`
was not assumed a nonzerodivisor and `k` was not assumed a domain. Induction
gives the third assertion. The unit-coordinate hypothesis is sufficient; the
lemmas do not assert an equivalence for all principal ideals.

| Test name | Required statement |
| --- | --- |
| `witt_torsion_prime_detection` | For xi=p, the condition reduces to p squared dividing p*g if and only if p divides g; xi_1=1. |

| Test name | Required statement |
| --- | --- |
| `witt_torsion_quotient_by_prime` | The quotient W(k)/(p) is killed by p for any perfect k of characteristic p, including a product of fields; no domain hypothesis is needed. |

| Test name | Required statement |
| --- | --- |
| `witt_torsion_hypothesis_required` | In W(F_2)/(4), the class of one is killed by 4 but not by 2. The generator 4 has Witt coordinate one equal to zero, so it is excluded by the theorem. |

Apply these lemmas to a distinguished Fontaine generator to prove
`perfectoid_p_torsion_killed_by_p`: every integral perfectoid ring has
`R[p^∞]=R[p]`. Thus its `p`-primary torsion has bound one. The ordinary and
derived `p`-completeness comparison follows through `DD.1`; it is a separate
application of the torsion bound. This elementary argument precedes the
prismatic quotient construction and supplies its completion input.

For any map `R → S` of integral perfectoid rings, the full relative cotangent
complex satisfies `L_(S/R) ⊗^L_ℤ F_p = 0`; its derived `p`-completion is
therefore zero (`perfectoid_cotangent_mod_p_vanishes`). Use the Tor-independent
Fontaine square and base change of the full cotangent complex. Vanishing of
ordinary Kähler differentials alone is insufficient. For a single integral
perfectoid ring, transitivity through `A_inf(R)` and the regular kernel of
`θ` identify the completed absolute cotangent complex over `ℤ_p` with
`(ker θ/(ker θ)²)[1]`. Choosing a generator gives `R[1]`, with cohomology in
degree `−1`. The free rank-one identification depends on that choice; the
unoriented cotangent object remains canonical.

Sources: BMS2 Proposition 4.19(3), statement p.22 and elementary proof p.23
in the v2 preprint, published p.227, for the three Witt calculations and the
torsion bound; BMS1 Lemmas 3.13–3.14, p.24, for Tor independence and relative
cotangent vanishing; BMS2 Proposition 4.19(2), pp.22–23, for the absolute
cotangent calculation. Prerequisites for the Witt lemmas are the baseline
Teichmüller expansion, Witt coordinate divisibility, injectivity of Frobenius
and cancellation of `p` in `W(k)`. The perfectoid application uses the kernel
generator criterion. Cotangent statements additionally import
`PrismaticCohomology:PR.0/perfectoid-tor-independence`,
`DerivedDeRhamCohomology:DD.0/cotangent-complex` and
`DerivedDeRhamCohomology:DD.1/derived-completion`. Their consequences for
quasisyntomic and QRSP rings are consumed by `DD.0` and `DD.5`.

### Reducedness, torsion removal and compatible roots

Prove `integralPerfectoid_reduced` for all integral perfectoid rings, including those
with `p`-torsion. For an element `a` with a compatible tower of `p`-power roots,
all the annihilators agree:

```text
Ann(a^(1/p^n)) = Ann(a) = R[a^∞].
```

The reduction to characteristic `p` and the Fontaine presentation establish
these assertions without a domain assumption. They are the reason that maps
to perfectoid rings killing an element also kill all its specified roots.

Suppose `R` is also ordinarily `ϖ`-complete, with `ϖ^p | p`. Then
`R_tf = R/R[ϖ^∞]` is `ϖ`-torsion-free and integral perfectoid
(`perfectoid_torsion_free_quotient`). With a compatible-root unit replacement
of `ϖ`, its tilt is `R♭/R♭[(ϖ♭)^∞]`. The decomposition is

```text
R ≃ R_tf ×_((R_tf/ϖ)_red) (R/ϖ)_red.
```

Both special fibres in this formula are reduced. The ideal generated by all
compatible roots of `ϖ` has quotient `(R/ϖ)_red`, a perfect `F_p`-algebra.
The construction uses the actual localization kernel
`ker(R → R[1/ϖ])` for power torsion and transports the quotient topology and
completion. It is a specific decomposition theorem; generic fibre-product
preservation results retain their `IntegralPerfectoidPartII` owner.

For `p`-torsion-free integral perfectoid `R`, choose `π` with `(π^p)=(p)`.
Prove the multiplicative-monoid comparison between compatible root sequences
in `R` and `R♭` (`perfectoid_compatible_roots_iterated_frobenius`). Addition
on the mixed-characteristic sequences is not pointwise ring addition. Choose
`π_n` for `n ≥ 1` with `π₁` a unit multiple of `π`,
`π_(n+1)^p=π_n`, and `(π_n^(p^n))=(p)`. The ideal `(π_n)` is the inverse
image of `ker(F^n : R/p → R/p)`. The power map identifies
`R/π_n ≃ R/p`. Include the expansion `x^p + p y^p` for every class modulo
`p²`, and surjectivity of the `p`-power map modulo `pπ`. These statements
provide the normalized root and quotient calculations needed in the Tate
adapter.

Sources: Česnavičius–Scholze §§2.1.2–2.1.3, pp.11–12, including equations
(2.1.3.1)–(2.1.3.2), for reducedness, annihilators and the decomposition;
Česnavičius Remark 4.3 and Remarks 4.4–4.5, p.8, for reducedness and the
normalized root calculations. Prerequisites are the integral predicate,
Fontaine generators, inverse perfection, ordinary quotient/localization APIs
and the normalization/completion transport. The root-sequence comparison uses
the baseline multiplicative `Perfection` carrier and sharp map; the finite
Frobenius calculations use the finite Witt interface of `PR.0`.

### p-integral closure and perfectoid completion

For a subring `A ⊆ B`, define `pIntegralClosure p A` to be the smallest
intermediate subring closed under `p`th roots inside the fixed ambient ring
`B`. Equivalently, start from `A`, adjoin all ambient `p`th roots, take the
generated subring and repeat; the union of these stages is root closed.
The definition may use the infimum of the root-closed subrings containing `A`.
The ambient ring is essential: this construction does not adjoin roots in a
new algebra. It is contained in ordinary integral closure, since each root
satisfies a monic polynomial, but it need not equal that closure.

| API name | Required statement |
| --- | --- |
| `pIntegralClosure.le` | The source subring lies in its p-integral closure. |
| `pIntegralClosure.isClosed` | If b^p is in the closure then b is in it. |
| `pIntegralClosure.minimal` | The closure is contained in every p-integrally closed intermediate subring containing A. |
| `pIntegralClosure.idempotent` | Taking p-integral closure twice gives the same subring. |
| `pIntegralClosure.mono` | An inclusion of source subrings induces an inclusion of their closures. |
| `pIntegralClosure.le_integralClosure` | The p-integral closure is contained in the baseline integral closure. |

| Test name | Required statement |
| --- | --- |
| `pClosureIdentity` | A p-integrally closed subring is its own p-integral closure. |
| `pClosureZero` | In the zero ambient ring the closure is the unique subring. |
| `pClosureRoot` | In F₂[T], the 2-integral closure of F₂[T²] is all of F₂[T]. |
| `pClosureNotOrdinary` | In F₂[T], F₂[T³] is 2-integrally closed, whereas its ordinary integral closure in F₂[T] is all of F₂[T]; F₂[T³] is a proper subring. |

Let `ϖ` be a nonzerodivisor in `A` with `ϖ^p | p`. The map
`A/ϖ → A/ϖ^p` given by `p`th powers is injective if and only if `A` is
`p`-integrally closed in `A[1/ϖ]`
(`perfectoid_p_integral_closedness`). Apply this to the torsion-free image of
an integral perfectoid ring to obtain `p`-root closedness of its image in the
localization even when the original ring has `ϖ`-torsion. The nonzerodivisor
criterion is first proved before this torsion-removal application.

If `A` has a compatible root tower for `ϖ`, `ϖ` is a nonzerodivisor,
`ϖ^p | p`, and `A/ϖ → A/ϖ^p` is surjective, the ordinary `ϖ`-completion of
the `p`-integral closure of `A` in `A[1/ϖ]` is integral perfectoid
(`completion_pIntegralClosure_perfectoid`). Construct and compare the
quotients before identifying the completion; Frobenius injectivity comes
from root closedness and surjectivity from the original quotient map. An
additional useful criterion says that for `p`-torsion-free `A` with
`(π^p)=(p)`, ordinary integral closedness in `A[1/p]` and Frobenius
surjectivity on `A/p` imply that its ordinary `p`-completion is perfectoid.
This implication retains both the root normalization and the integral
closedness hypothesis.

Sources: Česnavičius–Scholze §2.1.7 and equation (2.1.7.1), p.13, for
`p`-integral closure and the injectivity criterion, and Proposition 2.1.8,
pp.13–14, for its perfectoid completion; Česnavičius Lemma 4.7, p.8, for the
ordinary integral-closure criterion. Prerequisites for the closure definition
are baseline `Subring` operations and `integralClosure`. The localization
criterion uses `Localization.Away`, quotient power maps and the
nonzerodivisor hypothesis. The completed statements use normalization,
torsion removal and `DerivedDeRhamCohomology:DD.1`'s quotient/completion
comparison in precisely the indicated setting.

### Ring operations and their tilts

Keep the topology and the tilt formula as parts of every operation. Let `A`
be integral perfectoid and ordinarily `ϖ`-complete with `ϖ^p | p`; choose
compatible roots to identify the corresponding `ϖ♭`. The following are
ordinary completed constructions.

- **Root-polynomial algebras** (`perfectoid_completed_root_polynomial`). For
  any small set `I`, the `ϖ`-completion of
  `A[X_i^(1/p^∞) : i ∈ I]` is perfectoid. Its tilt is the
  `ϖ♭`-completion of `A♭[(X_i♭)^(1/p^∞) : i ∈ I]`, with the tilt variable
  representing the actual root tower. The empty variable set recovers `A`.
- **Tensor products** (`perfectoid_completed_tensor`). For a small family of
  `ϖ`-complete perfectoid `A`-algebras, the ordinary `ϖ`-completed tensor
  product is perfectoid and its tilt is the corresponding completed tensor
  product over `A♭`. Infinite tensor products are formed as
  filtered colimits of finite tensor products before completion. The empty
  tensor product is `A`. The tensor carrier and its comparison maps must be
  the canonical ones.
- **Root-stable quotients** (`perfectoid_completed_root_quotient`). For a
  subset `E ⊆ A`, assume for every `n>0` that the ideal generated by `E`
  modulo `ϖ^n` is generated by `p^n`th powers of elements of that ideal.
  Then the ordinary `ϖ`-completion of `A/(E)` is perfectoid. Its tilt is
  the ordinary `ϖ♭`-completion of `A♭/(E♭)`, where
  `E♭ = lim_(x↦x^p)(E mod ϖ)`. A sufficient condition is that every
  element of `E` has some positive `p`-power root in `E`; compatible root
  towers are a principal example. The conclusion concerns the completion,
  rather than completeness of the raw quotient.
- **Products** (`integralPerfectoid_pi_iff`). For any small family of
  `ℤ_p`-algebras, their product is integral perfectoid exactly when every
  factor is. The tilt is the product of the tilts. This includes the empty
  product, which is the zero ring. The uniform bound on `p`-torsion is
  supplied by the preceding bound-one theorem, so no additional bound on
  the family is imposed.
- **Sharp-ideal completions** (`perfectoid_sharp_ideal_completion`). For
  finitely many `a_i ∈ A♭`, let `J=(a_i♯)` and `J♭=(a_i)`. The ordinary
  `J`-completion of `A` is perfectoid, agrees with derived `J`-completion,
  and has tilt the ordinary `J♭`-completion of `A♭`. Finiteness of the
  tuple is retained. There is no requirement that `J` contain `p`. Use the
  reduced/separated completion criterion before identifying the two
  completions; this is not a statement for all infinitely generated ideals.

There is also an independent étale route
(`perfectoid_completely_etale_henselization`). If `R` is integral perfectoid
and `R′` is derived `p`-complete with
`R′ ⊗^L_R R/p` a discrete étale algebra, then `R′` is integral perfectoid.
For any ideal `J ⊆ R`, the ordinary `p`-completion of the henselization
`R_J^h` is perfectoid, and the same conclusion holds for the appropriate
`p`-completion of ind-étale `R`-algebras. No finite-generation or closedness
assumption on `J` is added. Lift the étale algebra through the Fontaine prism
using unique δ-extension and complete algebraization. This proof does not
require the later generic fibre-product theory.

Sources: Česnavičius–Scholze Proposition 2.1.11(a)–(e), statements and proofs
pp.15–17: (a) and (b) pp.15–16, (c) pp.15–17, and (d),(e) pp.16–17.
For the sharp-completion comparison, use Stacks tags `0G3I` and `091T`.
The étale assertion uses Anschütz–Le Bras Corollary 2.1.10, p.14, and the
henselization assertion Česnavičius–Scholze Corollary 2.1.6, p.13.
Prerequisites for root polynomials are the integral predicate, inverse
perfection and ordinary completion. Tensor products use these and
`DerivedDeRhamCohomology:DD.1/completion-exchanges`; root-stable quotients use
the Fontaine criterion and quotient/completion transport. Products use the
torsion bound, Witt functoriality and perfection of products. Sharp
completions use the torsion decomposition and the finite-ideal separation
criterion. The étale route additionally imports
`PrismaticCohomology:PR.0/delta-etale-extension`, its complete algebraization
interface and `DD.1`'s complete-étale comparisons.

### Tate rings and the fixed-field integral model

Apply the `P1` integral/Tate dictionary to `p`-torsion-free integral
perfectoid `A`. Choose `π^p=pu` and equip `T=A[1/p]` with `A` as its open
`p`-adic model. Then `T` is a uniform perfectoid Tate ring. Each compatible
root of `π` annihilates `T°/A`; the powerbounded ring `T°` is the
almost-elements saturation of `A` in `T`. Moreover `A` contains `T°°`, and
`T°` is ordinarily `p`-complete and integral perfectoid. No separate
integral-closedness assumption on `A` is needed.

This is the application of
`PerfectoidSpaces:P1/perfectoid-tate-ring-from-integral-perfectoid`,
`PerfectoidSpaces:P1/almost-integral-dictionary`,
`PerfectoidSpaces:P1/topologically-nilpotent-elements-as-root-ideal` and
`PerfectoidSpaces:P1/integral-perfectoid-comparison`. Sources are BMS1
Lemmas 3.20–3.21, pp.26–27, and Česnavičius §4.8, pp.8–9. The prerequisites
here are normalization, compatible roots and the Fontaine algebra
above, together with those `P1` interfaces. No second Tate-perfectoid
predicate is introduced.

For Bhatt's field-based model, fix a perfectoid field `K`, its valuation ring
`K°`, and a nonzero topologically nilpotent `t ∈ K°` with compatible roots.
In characteristic zero normalize `|t|=|p|`. An integral model `A` is a flat
`K°`-algebra, ordinarily `t`-complete, saturated under almost elements, and
has an isomorphism `F : A/t^(1/p) → A/t`. Saturation means that every
`x ∈ A[1/t]` for which `t^(1/p^n)x ∈ A` for all `n` already lies in `A`.
These are precisely the powerbounded integral models of perfectoid
`K`-algebras (`bhatt_integral_model_comparison`). They satisfy the general
integral predicate. The converse needs the specified `K°`-algebra structure,
flatness or the corresponding torsion-free condition, and saturation; the
general torsion-allowing predicate does not imply this field-based structure.

Source: Bhatt, *On the direct summand conjecture and its derived variant*,
Notation 1.4 and footnote 5, p.3. Prerequisites are the integral predicate,
normalization, and `PerfectoidSpaces:P0` and `P1` for the actual almost-elements
and powerbounded carriers. This comparison supplies the hypotheses of the
second root-adjunction route in `Q3`.

## Layer Q0:animated-application: prism and animation interfaces

Use `PR.0`'s δ-ring and Frobenius-lift dictionary on the existing Witt-vector
construction, its free δ-ring and δ-stable ideal closure, and its universal
δ-quotient. Distinguished elements are those whose δ-value is a unit. A
prism `(A,I)` has a Cartier ideal, derived `(p,I)`-completeness and
`p ∈ I+φ(I)A`; boundedness is bounded `p`-power torsion in `A/I`. Orientations
and boundedness are explicit hypotheses whenever used. Morphisms retain the
rigidity result `J=IB` on prism ideals.

Completed prism perfection and the perfect-prism/integral-perfectoid
correspondence are supplied by
`PrismaticCohomology:PR.0/prism-perfection` and
`PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings`. The uncompleted
orientation during the construction can be a zero divisor; regularity is
asserted where the completed prism theorem establishes it. Use
`PrismaticCohomology:PR.1/perfect-prism-initial` for the initiality of
`(A_inf(R),ker θ_R)` among all prisms under an integral perfectoid `R`.
Its proof needs δ-compatible deformation theory even when `R` has `p`-torsion;
an arbitrary lift of Frobenius is not a replacement.

The other prerequisite is the actual animation of commutative rings:
`EnhancedDerivedSheaves:E5:animation/animated-commutative-rings`,
`/universal-property-of-animation` and `/sifted-colimits`. Positive-characteristic
animated commutative rings are not defined by substituting strict commutative
DGAs. Full cotangent complexes, derived exterior powers and completion come
from `DerivedDeRhamCohomology:DD.0/cotangent-complex`,
`DD.0/derived-exterior-powers` and `DD.1/derived-completion` on those carriers.

Sources: Bhatt–Scholze §§2–4, especially Lemma 3.9 and Theorem 3.10,
pp.31–32, and Lemma 4.8, pp.38–39. The free algebra, distinguished-element,
prism-category, rigidity, regular-envelope, Tor-independence and bounded
complete-flatness interfaces are imported under their `PR.0` names. This
layer applies them to the integral algebra of `Q0`; it retains their owners
and imposes no new generic prism definition.

## Layer Q1: smooth prismatic cohomology and Hodge–Tate comparison

Let `(A,I)` be a bounded prism and `R` a `p`-completely smooth `A/I`-algebra.
Use `PrismaticCohomology:PR.1/relative-prismatic-site` and
`PR.1/prismatic-structure-sheaf` to form relative cohomology `Δ_(R/A)`.
The chosen Čech–Alexander envelope model computes that cohomology, independently
of its smooth presentation, and carries the functorial Frobenius map. Its
reduction `Δ̄_(R/A)` has multiplicative Hodge–Tate comparison

```text
Ω^i_(R/(A/I)){-i} ≃ H^i(Δ̄_(R/A)).
```

Here `Ω^i` denotes the `p`-completed differential forms and
`M{i}=M⊗_(A/I)(I/I²)^⊗i`, with dual powers for negative `i`. This is the
twist of `A/I`-modules; it does not require constructing the prism's
Breuil–Kisin twists in `PR.3`. Under this comparison the Bockstein
differential agrees with the differential in the de Rham complex. Keep the
comparison map, its multiplication and its differential compatibility, as
well as the cohomology isomorphism.

The imported crystalline comparison starts with a crystalline prism
`(A,(p))`, a divided-power ideal `J⊂A` containing `p`, and a smooth
`A/J`-algebra `T`. With `ψ:A/J→A/p` induced by Frobenius and
`T^(1)=T⊗_(A/J,ψ)A/p`, it identifies `Δ_(T^(1)/A)` with
`RΓ_crys(T/A)`, compatibly with Frobenius. The imported de Rham comparison
requires `W(A/I)` to be `p`-torsion-free and identifies
`Δ_(R/A)⊗̂^L_(A,φ_A)A/I` with the `p`-completed de Rham complex of `R`
over `A/I`. Thus its base change uses Frobenius, whereas Hodge–Tate
reduction uses the quotient map. Prismatic base change and the syntomic
extension of crystalline comparison retain their stated `PR.1` hypotheses.
The general de Rham comparison without the Witt-ring torsion hypothesis and
the étale comparison belong to `PR.3`.

Source: Bhatt–Scholze Construction 4.9, pp.39–40; Theorem 5.2, pp.45–48;
Theorems 6.3–6.4, pp.52–54.
Prerequisites are `Q0:animated-application` and the exact `PR.1` interfaces
`relative-prismatic-cohomology`, `change-of-topology`,
`cech-alexander-complex`, `cech-alexander-computes-cohomology`,
`frobenius-on-prismatic-cohomology`, `hodge-tate-cohomology`,
`bockstein-differential`, `hodge-tate-comparison-map`, `hodge-tate-comparison`,
`crystalline-comparison`, `crystalline-comparison-syntomic`,
`prismatic-base-change` and `de-rham-comparison`. These results retain their
supplier names. Their polynomial-coordinate and envelope calculations are
supplied by `PR.0` and `CrystallineCohomology:CR.0`.

## Layer Q2: initial prisms and universal perfectoidization

### Semiperfectoid rings and the initial prism

Define `IsSemiperfectoid p S` for an ordinary ring `S` by derived
`p`-completeness and existence of a surjective map from an integral perfectoid
ring. The presentation is a witness to a property of `S`, rather than part of
its structure. Surjectivity alone does not prove derived completeness. For an
ordinary ring or module, the specialization of Stacks tag `091P`, criterion
(7), makes derived `p`-completeness equivalent to bijectivity on the countable
product of the operator

```text
(a_n)_n ↦ (a_n − p a_(n+1))_n.
```

The suggested predicate uses this actual operator together with a quotient
witness. Identify it with the generic `DD.1` predicate once that interface is
available. Ordinary and derived completeness coincide here only under the
appropriate torsion comparison. The integral perfectoid bound-one theorem
provides that comparison for an integral perfectoid source, while an arbitrary
semiperfectoid target need not have bounded `p`-torsion.

| API name | Required statement |
| --- | --- |
| `IsSemiperfectoid.presentation` | Obtain an integral perfectoid source and a surjective ring map onto S. |
| `IsSemiperfectoid.derived_complete` | S is derived p-complete. |
| `IsSemiperfectoid.of_perfectoid` | An integral perfectoid ring is semiperfectoid. |
| `IsSemiperfectoid.congr` | Ring equivalences preserve and reflect semiperfectoidness. |
| `IsSemiperfectoid.classically_complete_of_bounded` | If S has bounded p-primary torsion, its derived p-completeness is equivalent to the Mathlib p-adic completeness predicate. |

| Test name | Required statement |
| --- | --- |
| `semiperfectoidZero` | The zero ring is semiperfectoid. |
| `semiperfectoidRootQuotient` | PerfectClosure(F₂[t],2)/(t) is semiperfectoid and is not integral perfectoid. |
| `semiperfectoidIdentity` | Every integral perfectoid ring gives the identity presentation. |
| `semiperfectoidPolynomialFails` | F_p[t] is not semiperfectoid: a quotient of a perfectoid ring has surjective Frobenius modulo p. |

For semiperfectoid `S`, construct `initialPrism p S = (Δ_init(S),I_S)`,
initial among **all** prisms with a map `S → A/I`. The ideal `I_S` is
principal; the target category is not restricted to bounded prisms. Start
from a perfectoid presentation `R ↠ S`, choose `d` generating `ker θ_R`,
and work over `A_inf(R)`. In the free δ-algebra impose `d x_f=f` for each
`f` in the presentation kernel. Remove the δ-stable `d`-power torsion and
take `H⁰` of derived `(p,d)`-completion. Repeat these two operations along
a sufficiently regular ordinal. A fixed cardinality bound and stationarity
argument give a `d`-torsion-free completed stage, and the unique maps to
every test prism survive each operation.

The universal property gives functoriality and independence of both the
presentation and orientation. The ordinal construction must prove that
the required countably filtered colimits commute with completion, that a
stationary stage is a prism, and that its orientation remains the image of
`d`. An existence claim without these comparisons does not define the
initial object.

| API name | Required statement |
| --- | --- |
| `initialPrism.structureMap` | The canonical ring map S → Δ_init(S)/I_S. |
| `initialPrism.ideal_principal` | I_S is generated by the image of the chosen d. |
| `initialPrism.lift` | Every prism C under S receives the unique compatible δ-map Δ_init(S) → C. |
| `initialPrism.lift_unique` | Two compatible prism maps out of Δ_init(S) are equal. |
| `initialPrism.map` | A map of semiperfectoid rings gives a map of initial prisms; identity and composition are preserved. |
| `initialPrism.presentation_independent` | Any two quotient presentations give uniquely isomorphic initial prisms over S. |

| Test name | Required statement |
| --- | --- |
| `initialPrismPerfectoid` | For integral perfectoid S, recover (A_inf(S),ker θ_S) via PR.1 Lemma 4.8. |
| `initialPrismZero` | For S=0 the initial prism is the trivial prism. |
| `initialPrismQrsp` | For QRSP S use PR.2/qrsp-prism to identify Δ_init(S) with derived prismatic cohomology. |
| `initialPrismFp` | For S=F_p, the initial prism is (W(F_p),(p)), canonically identified with (ℤ_p,(p)); its reduction map is the identity of F_p. |

Sources: Bhatt–Scholze Notation 7.1 and Proposition 7.2 with its proof, p.55;
Stacks Lemma 15.93.1, tag `091P`, criterion (7), for the ordinary module
test. Prerequisites for semiperfectoid rings are `Q0` and
`DerivedDeRhamCohomology:DD.1/derived-completion` with the ordinary-module
criterion. The initial prism uses `Q0:animated-application`,
`PrismaticCohomology:PR.0/free-delta-ring`, `delta-ideal-closure`,
`delta-universal-quotient`, `prism-category` and `rigidity-prism-ideal`,
`EnhancedDerivedSheaves:E5:animation`, and `DD.1`'s completion/colimit
exchange. The perfectoid identity test uses `PR.1/perfect-prism-initial`;
the QRSP identification uses `PR.2/qrsp-prism`.

### The perfectoidization functor

Apply completed perfection to the initial prism and divide by its extended
ideal:

```text
S_perfd = Δ_init(S)_perf / I_S Δ_init(S)_perf.
```

Equivalently take the `p`-completion of the quotient of the uncompleted
perfection. The perfect-prism correspondence makes this an integral
perfectoid ring. Define `perfectoidization p S` with its canonical
`η_S : S → S_perfd` and prove the natural equivalence

```text
Hom(S_perfd,T) ≃ Hom(S,T)
```

for every integral perfectoid `T`. The maps on the right are from the
semiperfectoid target `S`, rather than just from its presenting source `R`.
The construction and its universal property precede the separate theorem
that `η_S` is surjective. The suggested ring-valued formulation chooses a
real ring with the integral predicate and this precise mapping property;
the prism formula must subsequently be identified with that ring through
the supplier's actual prism carrier.

| API name | Required statement |
| --- | --- |
| `perfectoidization.eta` | The unit map η_S:S → S_perfd. |
| `perfectoidization.isIntegralPerfectoid` | S_perfd satisfies the integral predicate. |
| `perfectoidization.lift` | For perfectoid T, a map f:S → T has a unique lift S_perfd → T. |
| `perfectoidization.lift_eta` | The lift composed with η_S equals f. |
| `perfectoidization.lift_unique` | A map out of S_perfd is determined by its composite with η_S. |
| `perfectoidization.map` | The unit is natural; the induced maps preserve identities and composition. |
| `perfectoidization.of_perfectoid` | For perfectoid S, η_S is a ring equivalence. |
| `perfectoidization.presentation_independent` | Changing the surjection R ↠ S preserves the universal ring and its unit. |

| Test name | Required statement |
| --- | --- |
| `perfectoidizationZero` | Perfectoidization of 0 is 0 and its unit is the identity. |
| `perfectoidizationPerfect` | For F_p, and every perfectoid S, the unit is an isomorphism. |
| `perfectoidizationRootQuotient` | For A=PerfectClosure(F₂[t],2), the perfectoidization of A/(t) is A/√(t), with a noninjective unit. |
| `perfectoidizationTwoPresentations` | Two perfectoid quotient presentations of the same S induce the same lifts to every perfectoid target. |

The functor preserves identities and compositions by uniqueness of lifts.
An integral perfectoid ring is fixed by it. The comparison between two
presentations preserves `η_S`, so it gives a canonical isomorphism of
objects under `S`, rather than merely an abstract ring isomorphism.
These compatibilities are essential when forming the finite-quotient
system used in `Q4`.

Source: Bhatt–Scholze Corollary 7.3, p.56. Prerequisites are the initial
prism, `PrismaticCohomology:PR.0/prism-perfection`,
`PR.0/perfect-prisms-perfectoid-rings` and `PR.1/perfect-prism-initial`.
The universal property is always a property of actual ring maps to every
perfectoid target in the chosen universe.

### Derived comparison and the two descent calculations

Take a perfect prism `(A,I)` as base and a derived `p`-complete animated
`A/I`-algebra `S` for the derived initiality construction.
Import `PrismaticCohomology:PR.2/derived-prismatic-cohomology`, the derived
`p`-complete left Kan extension from smooth algebras, and its conjugate
filtration. Its Hodge–Tate reduction has graded pieces

```text
gr_i Δ̄_(S/A) ≃ (∧^i L_(S/(A/I)))^∧_p {-i}[-i].
```

The exterior powers and tensor operations are derived. For initiality, the
hypothesis is that **the Hodge–Tate reduction** `Δ̄` is concentrated in degree
zero. Under this hypothesis `Δ` is discrete, orientation-torsion-free and
carries the compatible δ-structure; it is weakly initial in the relevant
prism category. The initial object is obtained as an idempotent retract.
Neither discreteness of `Δ` alone nor weak initiality alone asserts the
desired initiality. The regular Koszul quotient calculation retains its
regular-sequence and bounded-torsion assumptions. In the QRSP case the
supplier identifies the derived object with the initial prism, including
the characteristic-`p` crystalline envelope description.

Sources: Bhatt–Scholze Construction 7.6, Lemmas 7.7–7.8, Example 7.9 and
Proposition 7.10, pp.56–60. Prerequisites are `Q1`, the `Q2` initial prism,
and the `PR.2` interfaces `conjugate-filtration`,
`derived-hodge-tate-comparison`, `derived-prismatic-base-change`,
`kunneth-formula`, `comparison-to-prisms`, `derived-agrees-with-site`,
`idempotent-retract-initial-object`, `regular-quotient-prismatic-envelope`,
`qrsp-prism`, `qrsp-char-p-acrys` and `quasisyntomic-descent`. The full
cotangent and completion interfaces retain their `DD.0` and `DD.1` owners.

Two additional calculations are required for the surjectivity proof. First,
let `R → R′` be `p`-completely faithfully flat between integral perfectoid
rings, and let `R ↠ S` be a semiperfectoid presentation. Put
`S′=(S ⊗^L_R R′)^∧_p`. Complete flatness makes this an ordinary
semiperfectoid ring. Prove the canonical unit-compatible comparison

```text
(S_perfd ⊗^L_R R′)^∧_p ≃ S′_perfd,
```

and descend surjectivity of `η_S′` to surjectivity of `η_S`
(`perfectoidization_complete_flat_base_change`). This is the base-change
law along a perfectoid cover; it does not claim arbitrary base change.
The proof uses the completed pushout of perfectoid algebras, Tor
independence and the universal property, then compares the actual derived
cofibers of the units. `DD.1`'s complete-flat descent detects the resulting
obstructing cokernel. Bounded torsion for `R` and `R′` comes from `Q0`;
no extra bounded-torsion hypothesis is imposed on `S`. The cofiber
comparison must be proved rather than inserted as an assumption in the
theorem's type.

Second, fix integral perfectoid `R`, an ideal `J`, and a derived
`p`-complete quotient `S=R/J`. For every finite subset `F ⊆ J`, put
`S_F=R/(F)`. Each finite quotient is derived complete by the weak Serre
property, being the cokernel of a map from a finite sum of copies of `R`.
Their completed animated colimit is `S`. Prove that perfectoidization
carries it to the colimit in perfectoid `R`-algebras
(`perfectoidization_completed_filtered_colimits`). If `K_F` are the
compatible kernels of the units at finite stages and `K=⋃_F K_F`,
identify the completed perfectoid colimit with the ordinary
`p`-completion of `R/K`, compatibly with the units. The colimit in this
category is completed; a raw ordinary ring colimit need not be complete.
Once its carrier is identified, surjectivity of the canonical image
follows from the existing completion-surjectivity theorem.

Sources for these two calculations: Bhatt–Scholze Theorem 7.4, proof p.62;
BMS1 Lemma 3.13, p.24, for Tor independence; Stacks tags `091P` and `091U`
for derived completeness and its weak Serre property. Prerequisites for
base change are the `Q0` tensor and torsion results, the `Q2` universal
property, `PrismaticCohomology:PR.0/perfectoid-tor-independence` and
`DerivedDeRhamCohomology:DD.1/complete-flatness` and complete-flat descent.
The colimit calculation uses the same universal property, animation,
`DD.1/completion-exchanges`, the completed perfectoid colimit interface and
baseline `AdicCompletion.map_surjective`, `of_surjective` and `map_of`.
Neither calculation uses arc descent or Bhatt–Scholze Proposition 8.5.

## Layer Q3: prism covers and adjoining roots

### Quasisyntomic lifting and the two perfection covers

For a bounded prism `(A,I)` and a quasisyntomic `A/I`-algebra `R`, apply
the lifting theorem to obtain a prism `(B,IB)` and a map `R → B/IB`
which is `p`-completely faithfully flat, with `A → B`
`(p,I)`-completely flat. If `A/I → R` is itself `p`-completely faithfully
flat, the latter map is `(p,I)`-completely faithfully flat. Over a perfect
base prism, completed perfection of `B` preserves these assertions. The
base map's faithfulness hypothesis must remain visible; it is not an
automatic consequence of `R` being quasisyntomic.

Source: Bhatt–Scholze Proposition 7.11 and proof, p.60. Prerequisites are
the `Q2` derived comparison and
`PrismaticCohomology:PR.2/quasisyntomic-covers-lift-to-prisms`,
`DerivedDeRhamCohomology:DD.0/quasisyntomic-condition` and
`DD.5/elementary-semiperfectoid-covers`. This is an application of the
existing lifting interface.

For bounded `(A,I)` and `p`-completely smooth `R`, choose a quasisyntomic
cover `R → R_∞` with `(L_(R_∞/(A/I)))^∧_p=0`. The relative object
`B=Δ_(R_∞/A)` is a discrete relatively perfect δ-`A`-algebra,
`(p,I)`-completely flat over `A`, with `B/IB ≃ R_∞`
(`relative_perfectoid_cover_smooth_site`). It covers the final object of
the relative prismatic site of `R` in the following precise sense: every
test prism has a faithfully flat refinement receiving a map from `B`.
The statement concerns relative perfection, not absolute perfectness of
`B`. The cotangent vanishing is the full derived statement and enters the
Hodge–Tate filtration calculation.

For a bounded prism `(A,I)` whose Frobenius is `(p,I)`-completely flat,
its completed perfection `(B,IB)` has perfectoid reduction and covers
the final object in the absolute prismatic site of `A/I`
(`frobenius_flat_prism_perfection_cover`). Over a perfect base, completing
the perfection of a flat prism map preserves complete flatness, and
preserves faithful flatness when that map was faithful. The proof needs
the regular-reduction criterion for Frobenius flatness with its actual
hypotheses; it cannot apply Kunz to an arbitrary nonnoetherian reduction.

Sources: Bhatt–Scholze Example 7.12, its proof and footnote 12, p.61, for
the relative cover; Proposition 7.11(2) and Example 7.13, pp.60–61, for
the perfection cover. Prerequisites for the relative cover are the
lifting result, `Q1` and `Q2`'s derived Hodge–Tate comparison, `Q0`'s
cotangent theorem, `PrismaticCohomology:PR.0/delta-etale-extension` and
`DerivedDeRhamCohomology:DD.1/complete-flatness`. The perfection cover uses
`PR.0/prism-perfection`, `perfect-prisms-perfectoid-rings`,
`bounded-prism-complete-flatness`, its regular-reduction Frobenius
criterion, and `DD.1/completion-exchanges`.

### André's flatness lemma and its modulo-p refinement

For every integral perfectoid ring `R`, construct an integral perfectoid
`S` and a `p`-completely faithfully flat map `R → S` such that every
positive-degree monic polynomial over `S` has a root
(`andre_flatness`). In particular one can successively solve
`X^p-a`, obtaining adjacent compatible roots for a specified element.
The monic-root property is stated without a domain hypothesis; the constant
polynomial `1` is excluded by the positive-degree condition.

At successor stages adjoin roots of monic polynomials by finite free
algebras, pass to quasisyntomic covers, lift to prisms and perfect them.
At limit stages take the correctly completed carrier and prove integral
perfectoidness and `p`-complete faithful flatness. Specify a universe and
cardinality bound; a final monic polynomial has finitely many coefficients,
which descend to an earlier stage where the next root operation applies.
The transfinite construction and faithful-flatness comparison are parts of
the theorem, not consequences of merely naming an ordinary colimit.

Refine the construction so that `R/p → S/p` is an ind-syntomic faithfully
flat cover (`andre_ind_syntomic_mod_p`). Trace the characteristic-`p`
divided-power envelopes after their Frobenius pullback. The relevant
finite reductions have the form of an algebra over `A/(f^p)` with root
variables satisfying `g_i^p=0`; their regular-sequence and nilpotent
thickening calculations give ordinary syntomic stages modulo `p`.
Pass through these stages and their limits to obtain ind-syntomicity.
This refinement is separate from the stronger ordinary ind-syntomic
extension of Česnavičius–Scholze Proposition 2.3.4.

Sources: Bhatt–Scholze Theorem 7.14 with its full proof, pp.61–62, and
Remark 7.15 with proof, p.62. Prerequisites for André's theorem are `Q0`'s
root-polynomial and tensor operations, the preceding lifting and perfection
covers, `DerivedDeRhamCohomology:DD.5`'s quasisyntomic covers and `DD.1`'s
complete-flatness/limit interfaces. The ind-syntomic refinement additionally
uses `CrystallineCohomology:CR.0`'s characteristic-`p` PD-envelope formula,
`PR.0`'s Frobenius pullback comparison, and the supplier's syntomic
regular-sequence calculations. The stronger ordinary theorem retains its
`IntegralPerfectoidPartII` owner.

### Rational root neighborhoods and the saturated root extension

There is a second construction in the fixed-field setting of the `Q0`
Bhatt comparison. Let `A` be a saturated integral perfectoid `K°`-model,
let `g ∈ A`, and use its specified nonzero `t` and compatible roots.
In the root-polynomial perfectoid space

```text
Y = Spa(A⟨T^(1/p^∞)⟩[1/t], A⟨T^(1/p^∞)⟩)
```

with the appropriate powerbounded integral model, define rational
neighborhoods `U_ℓ = { |T-g| ≤ |t|^ℓ }` for `ℓ ≥ 0`. They shrink around
`V(T-g)`. Their integral rings `B_ℓ=O_Y⁺(U_ℓ)` have restriction maps
`B_ℓ → B_(ℓ+1)` (`bhatt_root_neighborhoods`). Use the actual `P2`
rational-localization model and its necessary almost-elements saturation;
the notation does not select an arbitrary integral subring.

Let `C` be the ordinary `t`-completion of `colim_ℓ B_ℓ` and define
`bhattRootExtension(A,g) = A_∞ = C_*`, where `(-)_*` is `P0`'s saturation.
The root variables give an adjacent compatible tower `g_n`, with
`g_0` the image of `g` and `g_(n+1)^p=g_n`. The saturated object is again
an integral perfectoid `K°`-model. The comparison `C → C_*` is an almost
isomorphism; equality of the raw completion and the saturated model is
not asserted. Localization identifies the construction with the `P4`
universal perfectoid closed space `V(T-g)`.

| API name | Required statement |
| --- | --- |
| `bhattRootExtension.map` | The natural K°-algebra map A → A∞. |
| `bhattRootExtension.root` | For each n≥0, a distinguished root g_n∈A∞, with g₀ the image of g. |
| `bhattRootExtension.root_pow` | g_(n+1)^p=g_n for every n. |
| `bhattRootExtension.perfectoid` | A∞ is t-complete, flat over K°, saturated, and has the integral-model Frobenius isomorphism. |
| `bhattRootExtension.raw_almost_iso` | C → C_* is an almost isomorphism for the specified root ideal. |
| `bhattRootExtension.map_comp` | Maps of pairs (A,g) induce compatible root-extension maps preserving identities and composition. |

| Test name | Required statement |
| --- | --- |
| `bhattRootExtensionZero` | For the zero K°-algebra the root extension is zero and every root is zero. |
| `bhattRootExtensionPower` | For every n, the distinguished root satisfies g_n^(p^n)=image(g), and the adjacent roots satisfy the stronger compatibility equality. |
| `bhattRootExtensionModel` | After localization the extension is the P4 universal perfectoid closed subspace V(T−g); its integral ring is the saturated powerbounded model. |
| `bhattRootExtensionZeroElement` | For g=0 in any Bhatt integral perfectoid K°-model A, the canonical map A → A∞ is an isomorphism and every distinguished root is zero. |

Sources: Bhatt, *On the direct summand conjecture and its derived
variant*, Notation 2.1, Definition 2.2 and footnote 6, p.4. Prerequisites
are the fixed-field comparison in `Q0`, its root-polynomial construction,
`PerfectoidSpaces:P0` saturation, `P1`'s integral model, `P2` rational
localization and approximation, and `P4`'s universal closed-space
construction. The raw/saturated comparison and the `g=0` identity test
are part of the interface before flatness is claimed.

### Almost flatness and functorial monic-root iteration

For `ℓ>0`, the map `A → B_ℓ` is almost faithfully flat modulo `t` for
`m=(t^(1/p^n))`. Passing to the completed colimit and its saturation gives
the same conclusion for `A → A_∞`
(`bhatt_root_extension_almost_faithfully_flat`). Use rational
approximation and the corresponding almost integral models. This statement
is in the specified almost category, rather than ordinary flatness.

The monic-polynomial version is needed for iteration. Let `(A,A⁺)` be a
perfectoid affinoid `K`-pair, choose the compatible-root pseudouniformizer
`π`, and let `P(T) ∈ A⁺[T]` be monic of positive degree. Let `B⁺` be the
`π`-completion of the integral closure of `A⁺` in
`A[T^(1/p^∞)]/(P(T))`, and put `B=B⁺[1/π]`. Then `(B,B⁺)` is perfectoid,
and `A⁺ → B⁺` is almost faithfully flat modulo `π`. It is universal
among complete uniform affinoid `A`-pairs equipped with a root
`h_0 ∈ C⁺` of `P` and adjacent compatible roots `h_(n+1)^p=h_n`.
For this target category prove the integral-closure and completion
extension explicitly; the universal closed-space property only for
perfectoid targets does not by itself prove the stronger statement.
The finite free root algebra and the relevant regular sequence supply the
flatness calculation. Coefficients belong to `A⁺` in this argument.

Construct a functor `B` on the category of Bhatt integral perfectoid
`K°`-models, with natural maps `A → B(A)` almost faithfully flat modulo
`t`, such that every positive-degree monic polynomial over `B(A)` has a
root (`functorial_almost_aic_extension`). At a successor stage use a
polynomial-indexed family of covers and their perfectoid coproduct,
preserving maps of models; independent nonfunctorial choices of extensions
do not yield this functor. Iterate to `ω₁`. A Cauchy sequence uses only
countably many stages, so at the final countably filtered stage the raw
plus-ring colimit is already complete. Every finite list of polynomial
coefficients comes from one earlier stage, and its successor supplies the
root. Verify naturality, preservation of the integral-model conditions,
and almost faithful flatness through the completed operations. This is
the fixed-field almost variant; André's ordinary `p`-complete cover theorem
above has different hypotheses and a different flatness conclusion.

Sources: Bhatt Theorem 2.3 and proof, pp.4–5, and Remark 2.7, p.5;
Bhatt's 23 April 2017 perfectoid lecture notes, Theorem 9.4.3(1)–(2) and
proof, printed pp.113–115, for the monic-root version, and Corollary 9.4.7
with its transfinite proof, printed pp.115–117, for functorial iteration.
Prerequisites for almost flatness are the saturated root extension,
`PerfectoidSpaces:P0/almost-flat-projective-finiteness`,
`P2/approximation-lemma`, `P2/rational-localization-in-characteristic-p`,
`P2/almost-integral-model-of-untilted-rational-localization`, the `Q0`
root-polynomial algebra and `P4/universal-perfectoid-zariski-closed`.
Functorial iteration uses `Q0`'s completed tensor products,
`P0/almost-hom-and-adjoints`, `almost-tensor-and-internal-hom`,
`almost-zero-limits-and-colimits`,
`PerfectoidSpaces:P5/completed-colimit-of-perfectoid-pairs`,
`P5/completed-colimit-is-perfectoid` and `DD.1`'s countably filtered
completion exchange.

## Layer Q4: universal perfectoid quotients

### Characteristic-p quotients and radicals

The characteristic-`p` route gives elementary tests of the universal
construction. If the `p`-power map on a ring is surjective, it remains
surjective on every quotient (`quotient_pow_surjective`), without
finite-generation assumptions on the ideal. For perfect characteristic-`p`
`R`, prove

```text
PerfectRing (R/I) p ↔ I.IsRadical.
```

The forward direction is reducedness of a perfect ring; the reverse
combines reducedness of a radical quotient with its surjective Frobenius
(`quotient_perfect_iff_radical`). The formula includes `I=⊤` and the zero
quotient. By the `Q0` characteristic-`p` theorem, `R/√I` is integral
perfectoid (`radical_quotient_integralPerfectoid`) and
`IsIntegralPerfectoid p (R/I) ↔ I.IsRadical`
(`quotient_perfectoid_iff_radical`).

Prove `radical_quotient_universal`: every map from `R` into an integral
perfectoid `T` killing `I` factors uniquely through `R/√I`. There is no
extra characteristic-`p` hypothesis on `T`: the unital map from `R`
forces `p=0` in the target, and reducedness forces it to kill the radical.
Thus the universal perfectoid quotient of `R/I` is `R/√I` and the unit
is the surjective quotient map. In a perfect characteristic-`p` ring,
the ideal generated by the canonical compatible roots of `f` is
`√(f)` (`root_span_eq_radical`). One inclusion uses the roots' powers;
the other uses perfectness to rewrite arbitrary powers in the radical
condition with a sufficiently large `p`-power exponent. The raw quotient
by a nonradical ideal is merely semiperfect, and need not be perfectoid.

Sources: BMS1 Example 3.15, p.24, and the characteristic-`p` specialization
of Bhatt–Scholze Theorem 7.4, statement p.56 and proof p.62. The quotient
and radical lemmas here are elementary consequences spelling out that
specialization; they are not additional named theorems in the source.
Prerequisites are the `Q0` characteristic-`p` comparison and reducedness,
baseline quotient lifts, `Ideal.isRadical_iff_quotient_reduced`,
`Ideal.IsRadical.radical_le_iff`, `PerfectRing.ofSurjective` and inverse
Frobenius. The universal comparison additionally uses the `Q2` mapping
property when identifying this explicit object with `S_perfd`.

### The principal calculation and general surjectivity

Let `R` be integral perfectoid, let `f_n` be a specified compatible root
tower with `f_0=f`, and suppose `S=R/(f)` is derived `p`-complete. Put

```text
J_root = (f_n : n ≥ 0),
B = (R/J_root)^∧_p.
```

The root-stable quotient theorem makes `B` integral perfectoid.
Every map `S → T` to an integral perfectoid ring kills the images of all
`f_n`, because `T` is reduced and `f_n^(p^n)=f`. It extends uniquely
through the quotient and ordinary completion. Prove
`principal_root_quotient_perfectoidization`: the resulting identification
`S_perfd ≃ B` preserves the canonical units.

Surjectivity of `S → B` is part of this calculation. Apply
`AdicCompletion.map_surjective` to `R → R/J_root` as a surjective
`R`-linear map, and combine it with `AdicCompletion.of_surjective` on the
complete source. `AdicCompletion.map_of` identifies the composite with
the quotient-completion map. Transport along the image of `(p)` to the
ordinary `p`-completion of the quotient. This proves surjectivity
without requiring `J_root` to be closed or finitely generated.

For every semiperfectoid `S`, prove
`perfectoidization_surjective : Surjective η_S`. The proof proceeds
through the two `Q2` calculations and `Q3`'s André extension. Write
`S=R/J`. Completed filtered colimits reduce the assertion to finitely
many generators. Induct on their number, passing through the previous
perfectoid quotient. For the remaining principal generator, André
provides a `p`-completely faithfully flat perfectoid cover with compatible
roots. The principal calculation proves surjectivity there; the unit
cofiber comparison and complete-flat descent bring it back. Finally
identify the completed colimit with the completion of `R` modulo the
union of the finite-stage unit kernels. The baseline image argument then
proves the general surjectivity assertion. No bounded-torsion condition
is added to `S`, and the theorem does not say that every semiperfectoid
ring is already perfectoid.

Source: Bhatt–Scholze Theorem 7.4, statement p.56 and proof p.62.
Prerequisites for the principal calculation are `Q0`'s reducedness,
root-stable completion and bounded torsion, the `Q2` universal property,
and the three baseline completion-surjectivity declarations. General
surjectivity uses `Q2`'s complete-flat base change and completed filtered
colimits, `Q3`'s André theorem, and
`DerivedDeRhamCohomology:DD.1`'s complete-flat descent. The pushout,
cofiber and colimit identifications are proof obligations in this order;
they are not hypotheses weakening the final assertion.

### Integral models of the analytic closed quotient

Let `(R,R⁺)` be a perfectoid Tate pair and let `I ⊆ R` be any ideal,
with no closedness or finite-generation restriction. Choose a
compatible-root pseudouniformizer `ϖ` with `ϖ^p | p` in the integral
model, and form the ordinary completion

```text
S = (R⁺/(I ∩ R⁺))^∧_ϖ,
R_I = S_perfd[1/ϖ].
```

Define `perfectoidClosedQuotient(R,R⁺,I)` using this ring and the minimal
open integrally closed subring `R_I⁺` containing the image of `R⁺`.
Prove that the resulting complete uniform Tate pair is independent of
the chosen pseudouniformizer, root tower and presentation, with the
canonical map from `(R,R⁺)` preserved. Its universal property concerns
continuous maps to perfectoid Tate rings annihilating `I`, and the
pair-level version respects the plus subrings.

| API name | Required statement |
| --- | --- |
| `perfectoidClosedQuotient.map` | The continuous map q:R → R_I annihilates I. |
| `perfectoidClosedQuotient.plus` | R_I⁺ is the minimal open integrally closed subring containing q(R⁺). |
| `perfectoidClosedQuotient.lift` | A continuous map to a perfectoid Tate ring killing I factors uniquely through q. |
| `perfectoidClosedQuotient.choices` | Choices of pseudouniformizer and integral presentation give canonically isomorphic pairs. |
| `perfectoidClosedQuotient.spa` | The induced Spa map is the P4 universal perfectoid Zariski-closed subspace with image V(I). |

| Test name | Required statement |
| --- | --- |
| `closedQuotientZeroIdeal` | For I=0 recover (R,R⁺). |
| `closedQuotientUnitIdeal` | For I=R obtain the empty affinoid space and zero pair. |
| `closedQuotientCharacteristicP` | In characteristic p the perfectoid kernel contains the radical of I; the raw nonradical quotient is not the answer. |
| `closedQuotientNonclosedIdeal` | Allow a nonclosed ideal I; the universal pair depends on V(I), and its kernel is a closed saturated ideal containing I. |
| `closedQuotientPlus` | The plus ring is integral closure of the image with openness, rather than an arbitrarily chosen powerbounded ring. |

To establish the semiperfectoid presentation, use completeness of `R⁺`
and the baseline completion-surjectivity theorem to obtain a surjection
`R⁺ → S`. Classical completeness for the principal ideal `(ϖ)` implies
derived `ϖ`-completeness by Stacks tag `091T`. Since `ϖ^p | p`, a complex
over `S[1/p]` is a complex over `S[1/ϖ]`; the orthogonality criterion
`091P(2)` then gives derived `p`-completeness. This proves that `S` is
semiperfectoid without a new bounded-torsion premise. Apply the unit
surjectivity theorem and invert `ϖ` to obtain the surjection `R → R_I`.
The analytic comparison must additionally account for any
`ϖ`-power-torsion removal, the complete uniform topology and the actual
minimal open integrally closed plus ring. These are identified on
`PerfectoidSpaces:P1` and `P4`'s analytic carriers.

Prove `zariskiClosed_is_stronglyZariskiClosed`: the induced map
`Spa(R_I,R_I⁺) → Spa(R,R⁺)` is a homeomorphism onto `V(I)`, and
`R⁺ → R_I⁺` is almost surjective for
`m=(ϖ^(1/p^n) : n≥0)`. Together with ordinary surjectivity of `R → R_I`,
these give the strongly Zariski closed immersion. The integral map goes
from the ambient plus ring to the quotient plus ring. The construction
agrees with `P4`'s universal perfectoid closed space and does not replace
its minimal plus ring by an arbitrary choice of `R_I°`. Every Zariski
closed subset of an affinoid perfectoid space is consequently itself an
affinoid perfectoid space.

Sources: Bhatt–Scholze Remark 7.5, p.56; Scholze, *Étale cohomology of
diamonds*, Definitions 5.6–5.7, p.24, Theorem 5.8 and the following
remark, p.25, in the 14 April 2026 author version; Stacks tags `091T`
and `091P(2)` for the integral completion argument. Prerequisites are
the `Q0` integral/Tate dictionary, `Q2`'s semiperfectoid construction,
`Q4` unit surjectivity, ordinary completion and localization,
`PerfectoidSpaces:P0`'s root-ideal almost category,
`P1/integral-perfectoid-comparison`, and the `P4` universal closed-space,
closed-immersion and plus-ring interfaces. The topology and plus-ring
comparison completes the passage from the algebraic surjection to the
geometric conclusion.

## References

Page numbers above refer to the following accessible versions, and to printed
pages of the lecture notes. Section, theorem and version information is part
of each locator.

- **BS**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*,
  [arXiv:1905.08229v4, 12 January 2022](https://arxiv.org/pdf/1905.08229v4).
  The prism interfaces are §§2–4, with perfection and initiality milestones
  at pp.31–39; smooth comparison is §§4–6,
  pp.38–54; initial prisms, perfectoidization, covers and André's theorem
  are §7, pp.55–62.
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral
  p-adic Hodge theory*, [arXiv:1602.03148v3](https://arxiv.org/pdf/1602.03148v3).
  The relevant algebra is §3, pp.19–27.
- **BMS2**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Topological
  Hochschild homology and integral p-adic Hodge theory*,
  [arXiv:1802.03261v2, 9 April 2019](https://arxiv.org/pdf/1802.03261v2),
  §4, pp.21–23; [published version, Publications mathématiques de l'IHÉS
  129 (2019), 199–310](https://www.numdam.org/item/10.1007/s10240-019-00106-9.pdf).
  Definition 4.18 and Proposition 4.19 occur at published pp.225–227;
  the elementary bounded-torsion proof is p.227.
- **ČS**: Kęstutis Česnavičius and Peter Scholze, *Purity for flat
  cohomology*, [arXiv:1912.10932v3](https://arxiv.org/pdf/1912.10932v3),
  §2.1, pp.10–17.
- **Č**: Kęstutis Česnavičius, *Purity for the Brauer group*,
  [arXiv:1711.06456v4](https://arxiv.org/pdf/1711.06456v4), §4.2–§4.8,
  pp.7–9.
- **ALB**: Johannes Anschütz and Arthur-César Le Bras, *Prismatic
  Dieudonné theory*, [arXiv:1907.10525v4](https://arxiv.org/pdf/1907.10525v4),
  §2.1, pp.12–14, particularly Corollary 2.1.10.
- **Bhatt**: Bhargav Bhatt, *On the direct summand conjecture and its
  derived variant*, [arXiv:1608.08882v2](https://arxiv.org/pdf/1608.08882v2),
  Notation 1.4, p.3, and §2.1–§2.7, pp.4–5.
- **Bhatt notes**: Bhargav Bhatt, *Lecture notes for a class on perfectoid
  spaces*, [University of Michigan Math 679, 23 April 2017](https://websites.umich.edu/~bhattb/teaching/mat679w17/lectures.pdf),
  Theorem 9.4.3 and Corollary 9.4.7, printed pp.113–117.
- **DK**: Christopher Davis and Kiran S. Kedlaya, *On the Witt vector
  Frobenius*, [arXiv:1409.7530v1](https://arxiv.org/pdf/1409.7530v1),
  §3, pp.6–11, particularly Theorem 3.2.
- **ECD**: Peter Scholze, *Étale cohomology of diamonds*,
  [author version dated 14 April 2026](https://people.mpim-bonn.mpg.de/scholze/EtCohDiamonds.pdf),
  Definitions 5.6–5.7 and Theorem 5.8, pp.24–25.
- **Stacks Project**: The Stacks Project Authors,
  [Derived completion, tag 091N](https://stacks.math.columbia.edu/tag/091N),
  [criterion 091P](https://stacks.math.columbia.edu/tag/091P),
  [ordinary/derived comparison 091T](https://stacks.math.columbia.edu/tag/091T),
  [weak Serre property 091U](https://stacks.math.columbia.edu/tag/091U),
  and [reduced-ring completeness criterion 0G3I](https://stacks.math.columbia.edu/tag/0G3I).
