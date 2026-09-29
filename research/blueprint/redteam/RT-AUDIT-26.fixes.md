# RT-AUDIT-26: fixes

Fixer: Claude Code, session `cc-58621d`, 29 September 2026 (issue #4019, job FIX-RT-AUDIT-26).

- **Findings and verdicts.** `RT-AUDIT-26.result.json` and `RT-AUDIT-26.review.json`. The red team made
  26 findings: 2 high, 6 medium and 18 low. The review confirmed 25 and rejected one (/16).
- **Scope.** This job covers the eight confirmed findings of high and medium severity, /1–/8. The 17
  confirmed low-severity findings (/9–/15, /17–/26) are outside the fix job (PROTOCOL.md section 17).
- **Where the changes are.** Everything is in `research/blueprint/audit/AUDIT-26.result.json`; no other
  file changes.
- **The review object is unchanged.** Its `status` stays `accepted`, which `merge_library_audit.py`
  requires. Two of its sentences are superseded by these fixes, and the record is left as written:
  - The statement that the "process" verdicts are right for ModularIwasawaMainConjectures L6 (/1).
  - The statement that PadicHodgeRegulators D.4 is a unique owner (/3).
- **Library values.** One changes: PadicMeasuresIwasawaAlgebras L4, "Height-one divisors on
  O[[ℤ_p^d]]…", goes from `absent` to `partial` (/2).
- **Layer verdicts.** One changes: ModularIwasawaMainConjectures L6 goes from `process` to `not built`
  (/1).

**Verification.**
- Every added declaration was read at Mathlib 082e2d3 / Tau Ceti f790474, at the stated file and line,
  with its surrounding `variable` lines and namespace. Each resolves in the pinned `declarations.tsv`
  under the stated full name, library, file and line.
- So do the names cited only in notes: `AbstractMeasure.dirac_apply` (Measure/Basic.lean:96),
  `mahler_apply` (MahlerBasis.lean:107), `PowerSeries.binomialSeries_coeff` (Binomial.lean:51) and the
  `BinomialRing ℤ_[p]` instance (MahlerBasis.lean:78).
- Every layer id added to a `duplicates` list is an atlas stage.
- No target has more than five declarations. /8 would have made six, so `PadicInt.ext_mahler` moves
  into that target's note with its file and line, as the review allows.
- The file keeps its format (indent 1, UTF-8). All layer verdicts stay in the allowed set, and the
  review status is still `accepted`. The only index misses are the four the audit's review already
  confirmed by hand: two anonymous `PowerSeries` instances cited in two places, and `ModularForm.L`.

## RT-AUDIT-26/1 (high, error): ModularIwasawaMainConjectures L6 is mathematics, not process

**Review.** Confirmed. Correct the summary and target notes without moving arithmetic proof ownership
away from HE.8b, BSD.6a and BSD.7a. Narrow "none of these objects exists" to the required
completed-coefficient, local-condition and period comparison packages, since generic coefficient rings
and scalar maps certainly exist.

**Changes** (`roadmaps.ModularIwasawaMainConjectures`):
- **Verdict.** `layers["ModularIwasawaMainConjectures:L6"].verdict`: `process` → `not built`. All three
  targets are absent, so the layer is not `partly built`.
- **Target 1** ("Map-level identifications…"). The note now reads: "L6's own comparison theorems: the
  identifications of coefficient rings (O against the completed unramified extension), contragredient
  actions, primitive/imprimitive local conditions, p-adic periods and the BDP square convention that
  transport the branch theorems proved in HE.8b, BSD.6a and BSD.7a into L0's formulations. The
  completed-coefficient, local-condition and period comparison packages these need exist in neither
  library (generic coefficient rings and scalar maps do)." The last sentence is the review's narrowing.
- **Target 2** ("Comparison of the anticyclotomic characteristic equality…"). The note now reads: "Not
  present; needs the local logarithm and duality maps, none of which exists."
- **Target 3** (the replacement-source concordance) and its note "Bookkeeping." are unchanged.
- **Summary.** "L6 itself is integration." becomes "L6 proves the map-level comparisons that carry them
  into L0's formulations; only its source concordance is bookkeeping." The ownership sentence before it
  (L6's branch theorems owned by HE.8b and BSD.6a/BSD.7a) is kept, as the review requires.

**Consequence.** When `merge_library_audit.py` next runs, `data/library-coverage.json` records L6 as
`not built`. The atlas then counts its comparisons as work left, not as "Process, not mathematics".

## RT-AUDIT-26/2 (high, library-claim): height-one divisors are partly in Tau Ceti

**Review.** Confirmed. Scheme/Basic.lean:43–47 and Scheme/Principal.lean:108,129 give codimension-one
divisors and the principal-divisor order system on any Noetherian integral scheme, so `partial` is right
for this composite target. Two qualifications apply:
- The identification of the missing completed group algebra with the power-series model is still
  required.
- div(f) describes a cyclic torsion module only for nonzero f, and the identification of module length
  with order is an explicit comparison, not a packaged theorem.

Use "more general" fits for the divisor component only.

**Changes** (`PadicMeasuresIwasawaAlgebras:L4`):
- **"Height-one divisors on O[[ℤ_p^d]]; pseudo-null means codimension at least two".**
  - `library`: `absent` → `partial`.
  - `declarations` (five, including the kept `MvPowerSeries.isNoetherianRing`, Equiv.lean:225,
    `related`):
    - `TauCeti.AlgebraicGeometry.SchemeWeilDivisor`, WeilDivisor/Scheme/Basic.lean:47, `more general`.
      Finite ℤ-sums of codimension-one points of any scheme.
    - `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.ofScheme`, WeilDivisor/Scheme/Principal.lean:129,
      `more general`. The order system of a Noetherian integral scheme.
    - `TauCeti.AlgebraicGeometry.WeilDivisor.OrderSystem.principalDivisor`,
      WeilDivisor/Principal/Basic.lean:83, `related`.
    - `AlgebraicGeometry.Scheme.ord`, Mathlib/AlgebraicGeometry/OrderOfVanishing.lean:52, `related`.
  - `note`: rewritten from the finding with both qualifications. Weil divisors and principal divisors
    applied to Spec O⟦T₁,…,T_d⟧ give height-one divisors and div(f) for nonzero f. Still missing: the
    identification of O[[ℤ_p^d]] with the power-series model; divisors of general modules
    (Σ length(M_P)·P, with the comparison of length and order for Λ/(f)); and pseudo-nullity.
- **The characteristic-ideal target** ("Characteristic ideals from lengths at height-one primes…").
  - `principalDivisor` and `Scheme.ord` are added as `related`, making four declarations.
  - The note gains: "div(f) … gives the characteristic divisor of Λ/(f) for nonzero f once lengths at
    height-one primes are compared with orders of vanishing; that comparison, and characteristic ideals
    of general modules, are missing."
  - `library` stays `absent`.
- The layer verdict (`partly built`) is unchanged.

## RT-AUDIT-26/3 (medium, duplicate): PadicHodgeRegulators D.4 overlaps NumberFieldArithmetic Layer 5

**Review.** Confirmed. NumberFieldArithmetic 5.3 owns the semilocal tensor/product equivalence for every
finite separable extension of number fields; its case K = ℚ gives D.4's unramified special case.
AdicCompletionExtension.lean:282,336,353 supplies the component maps and their uniqueness under the
displayed hypotheses. Add the supplier and the related declaration, keep `absent` for the product
equivalence, and remove the unique-owner assertion.

**Changes:**
- **`PadicHodgeRegulators:D.4.duplicates`.** It was empty and gains
  `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`,
  with the finding's note: semilocalEquiv for every finite separable extension, its pure-tensor formula
  and Σ[L_w:K_v] = [L:K], of which D.4's F ⊗ ℚ_p ≅ ∏ F_v is the case K = ℚ, v = (p), without the
  unramified hypothesis.
- **Target "F ⊗ ℚ_p ≅ ∏_{v|p} F_v for p unramified in the number field F".**
  - `IsDedekindDomain.HeightOneSpectrum.adicCompletionExtension` (Tau Ceti,
    RingTheory/DedekindDomain/AdicCompletionExtension.lean:282, `related`) is added, making three
    declarations.
  - The note gains the component maps K_v → L_w, unique among continuous extensions of K → L under the
    Dedekind, fraction-field and LiesOver hypotheses, and says the product equivalence is planned by
    NumberFieldArithmetic 5.3.
  - `library` stays `absent`.
- **The PadicHodgeRegulators summary** now says that D.4 overlaps NumberFieldArithmetic Layer 5 (5.3).
- **The unique-owner assertion** is in the audit's review notes, which this job does not rewrite (see the
  scope notes). The new duplicate entry and the summary now say the opposite.

## RT-AUDIT-26/4 (medium, duplicate): D.2 overlaps K3BlochGroups V.6

**Review.** Confirmed. Both stages ask for agreement of the explicit p-adic Bloch regulator with the
abstract K-theory regulator, and neither requires the other; AUDIT-29 records the reverse overlap. Add
the scoped reciprocal entry. The rational, integral-torsion and finite-coefficient versions keep their
distinct hypotheses, and D.2's scalar/Frobenius normalization cannot be dropped.

**Changes:**
- **`PadicHodgeRegulators:D.2.duplicates`** gains `K3BlochGroups:V.6`. Its note is the finding's, plus
  the review's qualification that the three coefficient versions keep their hypotheses and that the
  scalar/Frobenius normalization stays with D.2.
- **The summary** now reads "D.2 overlaps MotivicEtaleKTheory M.8 and K3BlochGroups V.6".

## RT-AUDIT-26/5 (medium, duplicate): D.3 and D.4 overlap KTheoryFiniteLocalFields L.7

**Review.** Confirmed. L.7 supplies completion compatibility and the completed K₃ model used by D, which
D.3 and D.4 repeat. Keep D.3's unramified p > 3 regulator theorem and D.4's Frobenius, denominator and
Habiro comparisons with them. The repeated targets are the evidence, not the missing edge.

**Changes:**
- **`PadicHodgeRegulators:D.4.duplicates`** gains `KTheoryFiniteLocalFields:L.7`, with the finding's
  note. That note keeps Frobenius compatibility, the torsion/denominator statements and the Habiro
  export with D.4.
- **`PadicHodgeRegulators:D.3.duplicates`** gains `KTheoryFiniteLocalFields:L.7`, with the finding's
  note and the sentence "D.3 keeps its unramified p > 3 regulator theorem."
- **The summary** now also lists L.7 against D.3 and D.4, so it matches the duplicate lists. The finding
  does not ask for this; it is the same edit as /3 and /4 make for their overlaps.

## RT-AUDIT-26/6 (medium, library-claim): O[[T]] regular of dimension two is a short composition

**Review.** Confirmed. The review read Regular.lean:174, PowerSeries/Ideal.lean:69,196,
MvPowerSeries/Inverse.lean:152, NoZeroDivisors.lean:132 and DVR/TFAE.lean:244. Keep `partial`, and
describe the result as an unelaborated composition of available results, not a named power-series
theorem. O is a genuine DVR.

**Changes** (`PadicMeasuresIwasawaAlgebras:L4`, target "O[[T]] is a regular local ring of Krull dimension
two"):
- `library` stays `partial`.
- Three declarations are added, all `related`, making five:
  - `ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_nonZeroDivisors`
    (KrullDimension/Regular.lean:174);
  - `PowerSeries.eq_span_insert_X_of_X_mem_of_span_eq` (PowerSeries/Ideal.lean:69);
  - `IsRegularLocalRing.of_spanFinrank_maximalIdeal_le` (RegularLocalRing/Defs.lean:63).
- The note is replaced by the finding's text, framed as the review asks ("short compositions of
  available results, not a named power-series theorem"):
  - dim O⟦X⟧ = 2 from dim R/(x) + 1 = dim R with x = X, O⟦X⟧/(X) ≅ O and dim O = 1;
  - regularity from the two generators X and C ϖ of the maximal ideal;
  - Mathlib's regularity results cover local PIDs and polynomial rings over regular rings, not power
    series.

## RT-AUDIT-26/7 (medium, error): Tau Ceti has the finite-level group-ring augmentation

**Review.** Confirmed. Exactness.lean:55,87,166,195 defines the augmentation and proves both kernel
descriptions over an arbitrary coefficient ring. Correct both notes and keep `absent` for the completed
objects. R[G/H] needs H normal, or else the general q : G →* H theorem.

**Changes:**
- **L3, target "For procyclic G: principal augmentation ideal…".**
  - Two declarations are added, both `related`: `TauCeti.MonoidAlgebra.ker_augmentation_eq_span`
    (Algebra/MonoidAlgebra/Exactness.lean:87) and `TauCeti.MonoidAlgebra.ker_mapDomainRingHom_eq_span`
    (…:166).
  - The note is replaced. The kernel of R[G] → R[H] induced by a homomorphism q from a group to a monoid
    is generated by the [k] − 1, k ∈ ker q, for instance R[G] → R[G/N] with N normal. Nothing is there
    for the completed O[[G]], the procyclic principal ideal, RJW §§3–4 or change of generator.
  - `library` stays `absent`.
- **L1, target "Independence of the ideal of definition, functoriality, augmentation…".**
  `TauCeti.MonoidAlgebra.augmentation` (…:55, `related`) is added, and the note gains "The finite-level
  augmentation of R[G] exists in Tau Ceti; not for R[[G]]." `library` stays `absent`.

## RT-AUDIT-26/8 (medium, error): Dirac transforms do not need convolution

**Review.** Confirmed. AmiceTransform.lean:80, Measure/Basic.lean:96 and MahlerBasis.lean:107 identify
the Dirac-transform coefficients with choose(x, n), and Binomial.lean:47,51,61 give equality and the
product rule. Keep `partial`, keep the topological commutative ℤ_p-algebra hypotheses, and correct the
causal claim. The target already has four declarations, so the additions must respect the
five-declaration limit, with any displaced evidence kept in the note.

**Changes** (`PadicMeasuresIwasawaAlgebras:L2`, target "Multiplicativity for convolution, Dirac
transforms, coefficient extraction…"):
- `library` stays `partial`.
- `PowerSeries.binomialSeries` (Binomial.lean:47) and `PowerSeries.binomialSeries_add` (…:61) are added,
  both `related`.
- To stay at five, `PadicInt.ext_mahler` is removed from the declarations. The note now names it with
  its file and line (MahlerBasis.lean:409) as part of the determination-by-binomials result.
- The note's last clause is replaced:
  - A(δ_x) = (1+X)^x follows from coeff_amiceTransform, dirac_apply, mahler_apply and
    binomialSeries_coeff, since ℤ_p is a BinomialRing, for measures valued in a topological commutative
    ℤ_p-algebra.
  - binomialSeries_add gives the product rule on Dirac measures.
  - Neither is stated as such, and multiplicativity for general convolution is missing because
    convolution is not defined.

## Checks

- `research/blueprint/intake.py check-files` passes on both files.
- A script confirms the following for the edited file:
  - every added declaration resolves in `declarations.tsv`;
  - every duplicate layer is an atlas stage;
  - no target has more than five declarations;
  - every verdict is in `{built, partly built, not built, process}`;
  - the review status is `accepted`.
- No Lean file; nothing was compiled.
