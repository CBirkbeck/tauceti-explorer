# Independent review of ArithmeticKTheory N.2

**Verdict: accepted.** Reviewer: Codex, session `codex-zQijLd`, job
`REV-ArithmeticKTheory--N.2`, issue [#6425](https://github.com/CBirkbeck/tauceti-explorer/issues/6425),
2026-10-06. The original planning worker was session `codex-s6RYzw`
([BP-ArithmeticKTheory--N.2 handoff](../handoff/BP-ArithmeticKTheory--N.2.md));
this reviewer did none of that work.

The [packet](../packets/ArithmeticKTheory--N.2.json) correctly plans ramified
contravariant restriction in every nonnegative degree. All five nodes are
verified or corrected, all eighteen final baseline citations are confirmed,
and no unresolved contradiction remains in these nodes. The planning pass is
`complete`; whole-stage coverage remains `planned` with one precise inherited
N.5 input gap. Acceptance does not assert implementation or close that gap.

## Counts and changes

| Item | Before | After |
| --- | ---: | ---: |
| Nodes | 5 | 5 |
| Construction / theorem / comparison / application | 1 / 2 / 1 / 1 | 1 / 2 / 1 / 1 |
| Construction API items | 8 | 8 |
| Construction unit tests | 6 | 6 |
| New planets | 3 | 3 |
| Pinned baseline declarations | 17 | 18 |
| Gaps / requests | 1 / 0 | 1 / 0 |
| Source issues with individual review verdicts | 0 | 5 |

Four nodes have verdict `corrected`, one `verified`; none is unverifiable.
No node was added, split or removed. Every `implementationStatus` remains
`unchecked`. The corrections are:

1. Reuse the pinned prime-power filtration equivalence
   `Ideal.quotientRangePowQuotSuccInclusionEquiv`, including its exact
   hypotheses, primed-index conversion and multiplication construction. The
   arithmetic proof now explicitly imports an existing linear layer instead
   of asking a contributor to reconstruct it.
2. Add the exact S.3 Cartan/localisation comparison prerequisite; explain its
   flat-tensor naturality through projective-to-module inclusions. Handle the
   field case separately, since the imported S.3 Dedekind node excludes fields.
3. Replace the overview quotation attached to the valuation and ramification
   comparison locators by separate excerpts of those actual declarations.
4. Strengthen the suggested inert-prime example to assert both `y = 3` and
   `y ≠ 6`, matching its packet contract. The number of examples is unchanged.
5. Independently adjudicate E2–E6. Narrow E5 to the unconditional
   non-surjectivity assertion, which the class-group calculation refutes;
   preserve the source's valid observation that the degree-one analogue of
   the general theorem can fail. Give E4 a standalone Chapter IV locator and
   add that supporting source's version/hash record.
6. Reconcile the inherited N.5 gap with the already existing
   `L.1/mod-m-products` and `L.1/browder-mod-l-ring` plans, in addition to its
   coefficient-object and Bott suppliers. Their restrictions and supplier
   gaps still require reconciliation; there is no claim that products lack
   an owner.
7. Deduplicate the Mathlib source's repeated module entries and add the
   module of the newly cited layer equivalence. Add the top-level independent
   review object with all five node verdicts.

## Sources and mathematical checks

The public sources inspected are Weibel's author-hosted
[Chapter V](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf) and
[Chapter IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), both
retrieved on 2026-10-06. Their SHA-256 hashes are recorded in `sources` and
`sourceVersions`. Chapter V matches the original worker's recorded hash
`52dcc8ee3a1764e5ea309c59f093ac8e2a1ea64f3b94bacc05e6a2b6125b1da8`.
Chapter IV has hash
`9f1c1b8cccfe19d547c27dd04c61f198fd7a0cddd0018a0b84442b00fa575248`.
Locators refer to printed standalone chapter pages. The published edition was
not inspected, and these findings make no claim about its text or corrections.

All node locators and excerpts were checked against these texts or the pinned
Lean source. V.1.1–1.2 and V.1.8 give additivity for admissible filtrations of
exact functors; V.4.1–4.4 give torsion dévissage and its nonexact-quotient
warning; V.5.1 and its proof give abelian localisation; V.6.1 and V.6.6–6.6.4
give the Dedekind sequence, right-oriented boundary and opposite-direction
transfer. V.6.10.2's ramification example and V.6.11's supported sequence are
consistent with the interpretation. The packet honestly labels its general
all-degree ramified restriction formula as a deduction, rather than attributing
it to the transfer theorem V.6.6.4.

The whole [N.2 reader](../readmes/ArithmeticKTheory--N.2.md) was checked against
the packet, including its hypotheses, API, examples, ownership and three
planet names. Nearby upstream GlobalNumberFields and GrothendieckEulerForms
roadmaps were read for the expected standard of carriers, exact map contracts,
normalisations and counterexamples.

### Ramified residue pullback — corrected

The finite-fibre direct-sum construction is sound. Each upper prime has a
unique contracted lower prime; a nonzero upper prime cannot contract to zero
under the stated finite injective extension of domains. Finite algebras are
quasi-finite, so each prime fibre is finite. Summand maps assemble by the
existing direct-sum universal property, and coordinate evaluation proves
the support bound and uniqueness. Towers use multiplication of ramification
indices and composition of residue scalar extension, with flatness stated.

The eight API contracts cover generator and coordinate formulas, uniqueness,
support, zero, addition, identity and towers. They permit use without unfolding
the construction. The six tests distinguish zero, identity, ramification,
split primes, inert primes and multiplicative units. In particular restriction
on residue K_0 uses rank one even at an inert quadratic prime; residue degree
is not the coefficient. The suggested inert example now checks its positive
value as well as the negative example.

### Ramification-weighted dévissage — corrected

The proof first restricts tensor pullback to finite-dimensional k(p)-vector
spaces. It decomposes B/pB into primary coefficient blocks B/q^e using the
existing ideal factorisation and Chinese remainder equivalence. The newly
cited pinned equivalence identifies each quotient in the q-power filtration
with k(q). Its declared linearity is over k(p); inspection of the chosen
multiplication formula also gives B-linearity. Since q kills the layer and
k(q), this gives the required k(q)-line identification. Positivity and the
primed/unprimed index comparison discharge the equivalence's hypotheses.

Tensoring these fixed coefficient submodules and quotients with V over the
field k(p) makes every filtration and quotient functor exact. A choice of
layer basis gives a natural isomorphism with residue scalar extension;
different choices change only that natural isomorphism. Admissible-filtration
additivity therefore gives e copies of the same map on every K_n, and
torsion dévissage gives the claimed residue arrow. This is stronger than a
length calculation on K_0. It never uses nilpotent invariance of projective
K-theory or the nonexact functor M ↦ M/qM on arbitrary finite-length modules.
Wild ramification causes no problem, and residue separability is unnecessary.

### Full localisation compatibility — corrected

Flat tensor is an exact functor of the torsion/finite-module Serre pairs. It
preserves finite generation and torsion; fraction-field scalar extension
commutes with it by tensor associativity. Functorial abelian localisation
gives both the field-boundary square and the residue-to-integral square
before dévissage. The Cartan comparison and the commuting inclusion/tensor
square identify the regular-ring arrows with the usual projective K-theory
restrictions. The preceding node computes the remaining torsion arrow.

The terminating rank row and all nonnegative degrees are included. When A is
a field, B is a field too and the residue sums vanish; the diagram reduces to
scalar-extension functoriality. This case does not invoke the nonfield S.3
statement. No uniform injectivity claim is extracted from exactness.

### Low-degree comparison — corrected

Rank gives multiplication by e on residue K_0; determinant gives
u ↦ res(u)^e on residue K_1. The pinned multiplicative valuation identity
converts to the normalised additive equality v_q = e v_p. The packet keeps
the K-book's right-oriented boundary, which is inverse to the left-oriented
tame symbol in T.3. On symbols its formula has numerator b to the order of a.
Restriction multiplies both orders by e; the sign exponents differ by
e(e−1)v_p(a)v_p(b), an even integer, so the e-th-power compatibility has no
extra sign. The class-map convention [A/p] = [A] − [p] is preserved by ideal
extension. The pinned source locators now quote the actual two declarations.

The degree-two arithmetic exact rows, including their injectivity, are
imports of T.5. The new comparison does not create a tame-kernel definition,
certificate engine or proof of those exact rows.

### S-integer restriction — verified

The accepted N.1 finite-extension node supplies finite projectivity when the
upper prime set is the full inverse image of the lower one. The existing
S-integer spectrum equivalence supplies the primes outside S, with unchanged
local rings and residue fields. Its valuation comparison preserves the
normalisation. Finite towers satisfy the same full-inverse-image condition;
the coordinate formula and ramification-index tower theorem prove composition.

For enlargement, the localisation map projects away exactly the inverted
primes. Full inverse-image sets make projection and weighted pullback commute.
A larger upper set is handled by further localisation after the finite
extension. The statement correctly avoids claiming that this final ring is
finite over the lower ring.

## Pinned baseline audit

All statements were read at
[Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib)
and
[Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369/TauCeti).
The table lists the final eighteen references. Module paths in the packet
give their precise locations. No original reference was removed or renamed.

| Declaration | Statement/hypothesis check |
| --- | --- |
| `DirectSum.of` | Canonical summand inclusion. |
| `DirectSum.toAddMonoid` | Induced additive homomorphism from the dependent direct sum. |
| `DirectSum.addHom_ext` | Agreement on canonical inclusions implies equality of homomorphisms. |
| `IsDedekindDomain.HeightOneSpectrum` | Existing nonzero-prime carrier. |
| `Ideal.ramificationIdx` | Unprimed local-quotient length, converted to a natural number. |
| `Ideal.ramificationIdx'_eq_ramificationIdx` | Nonzero lower ideal, prime lying over it and torsion-free Dedekind upper ring; matches the extension hypotheses. |
| `Ideal.IsDedekindDomain.ramificationIdx_eq_normalizedFactors_count` | Nonzero extended ideal; identifies local length with the factor multiplicity. |
| `Ideal.ramificationIdx_tower` | Scalar towers and flat upper extension; matches the finite-projective tower. |
| `Algebra.QuasiFinite.finite_primesOver` | Quasi-finite algebra; finite algebra implies this condition. |
| `IsDedekindDomain.quotientEquivPiFactors` | Chinese remainder decomposition for a nonzero ideal in a Dedekind domain. |
| `IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain` | Nonzero prime localisation of a Dedekind domain is a DVR. |
| `IsDiscreteValuationRing.length_quotient_pow_maximalIdeal` | Length of the n-th maximal-ideal quotient is n. |
| `IsDedekindDomain.HeightOneSpectrum.valuation_liesOver` | Multiplicative valuation-power equation using the primed index and compatible fraction-field towers. |
| `IsDedekindDomain.integerHeightOneSpectrumEquiv` (Tau Ceti) | Primes of the S-integer ring correspond to original primes outside S. |
| `IsDedekindDomain.valuation_integerHeightOneSpectrumEquiv` (Tau Ceti) | That correspondence preserves the existing valuation. |
| `Ideal.ramificationIdx_pos` | Prime in a finite algebra has positive unprimed index. |
| `Ideal.mem_primesOver_iff_mem_normalizedFactors` | Nonzero maximal lower prime and torsion-free Dedekind upper ring; identifies the prime fibre with extended-ideal factors. |
| `Ideal.quotientRangePowQuotSuccInclusionEquiv` (added citation) | Nonzero upper prime in a Dedekind ring, nonzero primed index and j below that index; identifies the successive coefficient layer with the upper residue field. |

The last definition is present in the pinned deprecated
`Mathlib/NumberTheory/RamificationInertia/Basic.lean`. Its module's replacement
notice does not imply that this exact equivalence is absent or duplicated by
the new module. The proof cites the declaration that actually exists and
converts its index explicitly. The prototype does not import this deprecated
module, so its use as planning evidence adds no elaboration warnings.

## Closure, coverage and ownership

All seventeen distinct external direct prerequisites were checked by reading
their supplying nodes. The additional `targetCoverage` imports were checked
as well. GeneralAlgebraicKTheory supplies the exact-category groups, natural
maps, scalar extension, additivity, dévissage and functorial abelian
localisation. S.3 supplies the Dedekind sequence, unit valuation and Cartan
comparison. The accepted N.1 packet supplies arithmetic finite support,
covariant transfer, classical rows, S-enlargement and finite-projective
S-integer extension. T.3 supplies the sign-aware boundary comparison, and
T.5 owns its three arithmetic degree-two sequences.

Those are mathematical planning contracts. The K.1 and T.3 packets still
have partial/needs-changes status; S.3 and L.1 also have open planning work.
Their review status is not hidden and none is represented as implemented.
Each directly used contract suffices at its stated generality for the five
new targets. The internal prerequisite graph is acyclic. The N.5 odd-degree
result appears in coverage, not as a prerequisite of these new localisation
nodes, so finite generation is not fed back into its earlier localisation
input.

Every N.2 stage target has an explicit owner. Even-degree injectivity reuses
N.1's degree-specific node and T.5; degree zero retains the Picard kernel.
The odd-degree isomorphism belongs to N.5 and retains its finite-coefficient
gap. Current L.1 plans already provide coefficients, Bott classes and
products; their hypotheses, exceptional moduli and supplier gaps must be
reconciled with N.5's generic product/boundary/transfer and degree-one
injectivity requirements. This is a recorded whole-stage input gap, not a
missing step in the ramified restriction argument. There are no new requests.

The reviewed N.2 library audit was read. Its existing classical S-unit and
class-group material is reused; missing higher K-theory is imported from its
owners. No baseline declaration, upstream carrier or supplier theorem is
replanned as a new node. Target-level granularity is preserved: the
coefficient-filtration argument is a proof of the dévissage target, not a new
family of lemma nodes.

Both assigned confirmed red-team findings are satisfied by the packet and
reader:

- **RT-AREA-ktheory-1/9:** N.2 imports T.5's degree-two rows and injectivity.
  It introduces no certificate method or K_2(ℤ)/K_2(ℚ) calculation. N.6 and
  N.8 repairs lie outside this review's scope.
- **RT-AREA-ktheory-2/42:** the full Dedekind sequence and unit boundary are
  imported from S.3. The new work computes arithmetic ramified restriction;
  it does not rebuild generic localisation. Existing finite-support,
  transfer and injectivity interfaces remain in their original packet.

## Source issues

Each E2–E6 entry now has this review's `confirmed` verdict and independent
reason. The two grammatical slips E2/E3 are visible in V.6.6 and V.6.6.1.
E4 is a scope gap: IV.6.9 (standalone IV p. 59) does not give finite generation
for every Dedekind subring of a global field. The independent prime units in
ℤ_(p) disprove blanket finite generation of its K_1. Reduction by filtered
colimits repairs the statement's generality after establishing the finite-S
case; N.5 still records its own arithmetic supplier requirements.

E5 is confirmed only after narrowing its quote. The finite-coefficient rank
sequence gives coker(∂) = Pic(R)/ℓ. Thus R = ℤ has a surjective degree-one
boundary, whereas a finite class group whose order has a common factor with
ℓ gives failure. The general theorem's n=1 analogue is indeed false in
general; finiteness alone does not force the boundary to fail for every R, ℓ.

E6's displayed targets need finite coefficients and its repeated boundary
variable must be the lift s on the right. IV.1.13 and IV.2.5 confirm the
finite-field calculation. At a residue characteristic dividing ℓ, the
corresponding primary part of k×/ℓ is zero; the uniform identification with
ℤ/ℓ cannot be used there. This formulation also handles composite ℓ.
These are inherited findings against the identified author copy, not new
claims about the version of record. No additional source issue was needed
for the five new targets.

## Lean, API, planets and validation

The suggested file contains one honest finite-fibre group construction,
eight API signatures and six examples. It imports individual pinned Mathlib
modules, uses the existing `DirectSum` and additive group/homomorphism types,
and has no axiomatic higher-K replacement. The four untypeable higher-K
targets are explicitly named in comments with their supplier limitations;
they are specified mathematically in the packet and reader. Every body
remains a placeholder, including the examples. Elaboration checks these
types, not their mathematical proofs.

The three new planets name the central residue construction, ramification
dévissage and localisation/restriction theorem. Together with N.1's existing
N.2 localisation planet there are four in this stage, within the limit of
six. No locator or trivial API lemma is promoted to a planet.

Validation on the final files:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.2.json`:
  **0 errors, 0 warnings**, using the available pinned declaration index.
- `lean-check research/blueprint/suggested/ArithmeticKTheory--N.2.lean`:
  **exit 0; fifteen warnings, all uses of `sorry`**. Available memory exceeded
  20 GB; one compiler invocation ran at a time. No build or language server
  was started.
- Source-issue/version schema checks, one-to-one node review coverage and
  implementation-status assertions passed. `git diff --check` passed.
- The shared build's Mathlib commit equals the pin exactly. Its Tau Ceti
  checkout is newer, but this file imports no Tau Ceti module. All Tau Ceti
  source claims were checked separately at the exact pinned commit.

## Notes for the orchestrator

No mathematical clarification is required before accepting this pass.
Assembly must retain the separate covariant transfer and contravariant
ramified restriction maps, the S.3/T.5 ownership, and the explicit N.5 gap.

The reader was an input, not an authorised deliverable for this review, and
was left unchanged. When assembling it, update its historical baseline count
from seventeen to eighteen and mention the existing coefficient-layer
equivalence and current L.1 product supplier. Its mathematical statements
remain compatible with the corrected packet. The narrowed E5 adjudication
should be used when harmonising the repeated N.1/N.2 source-issue register;
this review did not edit the N.1 packet.
