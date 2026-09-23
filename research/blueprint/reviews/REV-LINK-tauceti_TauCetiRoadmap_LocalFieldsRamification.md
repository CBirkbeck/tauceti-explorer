# Independent review: LocalFieldsRamification links

- Job: `REV-LINK-tauceti_TauCetiRoadmap_LocalFieldsRamification`, issue #86.
- Reviewer: Codex — codex-a71f92; confirmed claim 5798213880.
- Date: 2026-09-23.
- Input revision: `ace8c73cf7f3ecacc01ae259b910699cd64e7bdf`.
- Verdict: **accepted after repairs**.
- Final map: 47 active links (3 incoming, 44 outgoing), 11 overlaps.
- Independence: this worker did not author the original map. Its history is the
  September 16 swarm output in commits `c69bcc9280faab52126b77beb0caa4454f9112b0`
  and `f66d8b51f39c9bd281d7368a0261610515a8a04e`, recorded with Claude attribution.

## Scope and source boundary

Read the complete 1101-line focal README, all five focal stage descriptions,
all 43 distinct non-focal original endpoint/overlap descriptions, and the
relevant consumer conventions. Read the additional LV.0/4/5/7/11 and
R07.4 contracts, plus targeted completeness candidates. Current new-roadmap
definitions override same-ID atlas descriptions when applicable.

The original checker result was **3 errors and 3 warnings**: three stale
Lawrence–Venkatesh quotes and three retired LI.4 targets. The report below
uses original link indices, so removals do not renumber the audit.

This checks mathematical supplier/use contracts, not every assertion of the
upstream roadmaps or their cited books. No external source was independently
re-read for this link-review job. Read all five reviewed AUDIT-04 coverage
entries and directly inspected the pinned uniformizer declarations used in
the repaired ownership proposal. No Lean file was added or compiled.

## Dispositions of all 48 original links

LFRn means LocalFieldsRamification Layer n; PPn means ProfiniteProPGroups
Layer n. CFT, QFI, LV, RF and VB abbreviate the respective full roadmap IDs
in the packet. Retained links have the qualifications stated here and in
their reasons; no source is said to supply an entire consumer theorem.

| Original # | Source → target | Finding / disposition |
| --- | --- | --- |
| 1 | LFR0 → CFT9 | Retain residue degree and tower law for the Weil-degree scaling; no reciprocity proof supplied. |
| 2 | LFR2 → CFT13 | Retain unramified unit-norm surjectivity for choosing restricted-product preimages outside a finite set. |
| 3 | LFR0 → QFI6A | Retain normalized valuation, e/f and the decoded valuation of 2; absolute and relative ramification indices remain distinct. |
| 4 | LFR1 → QFI6A | Retain unit/square-class inputs; explicitly preserve the finite K/Q2 scope of sharp dyadic depth theorems and the proposed unified adapter. |
| 5 | LFR2 → QFI6A | Retain unramified quadratic norm criterion. The quadratic-equation and square-class representation are consumer comparisons. |
| 6 | LFR0 → QFI6B | Retain the normalized valuation used in the defect supremum, including the top value on squares. |
| 7 | LFR1 → QFI6B | Retain the unit filtration. The nonsquare dyadic ramified-unit defect regime supplies the displayed bounds, not all units. |
| 8 | LFR0 → QFI6C | Retain normalized valuation in the parity/closed symbol formulas. |
| 9 | LFR1 → QFI6C | Retain, and explicitly restrict the 2e-d+1 norm bound to odd 0<d<2e; not the unramified defect d=2e or squares. |
| 10 | PP3 → LFR1 | Retain the exact IsProP inverse-limit/finite-quotient contract used for principal units. |
| 11 | PP2 → LFR4 | Retain abstract profinite Sylow existence, containment and normal uniqueness. Arithmetic identification of wild inertia remains LFR's. |
| 12 | PP4 → LFR4 | Retain free/presented profinite universal properties, not free pro-p objects. The tame relator is an arithmetic theorem here. |
| 13 | LFR4 → ArithmeticGaloisRepresentations R01.2 | Retain tame inertia and the ell-specialization; quasi-unipotence and Weil–Deligne reconstruction remain R01.2's. |
| 14 | LFR3 → ArithmeticGaloisRepresentations R01.3 | Retain filtrations and quotient compatibility. Clarify that abelian Hasse–Arf alone is not the proof of integrality for every nonabelian representation conductor. |
| 15 | LFR4 → LanglandsParameterStacks LP0 | Retain inertia and the Frobenius/tame relation. Match arithmetic versus inverse/geometric convention explicitly; dense discretization/extension remains LP0's. |
| 16 | LFR4 → LefschetzPencilsAndVanishingCycles LPV.1 | **Remove.** Finite-residue local fields do not supply the general excellent henselian-trait theorem. Retain overlap 4 and its proposed specialization comparison. |
| 17 | LFR0 → ReductiveGroupsPartII RG2.0 | Retain local compactness, integral rings and valuation topology; chart independence and integral group points are consumer work. |
| 18 | LFR0 → RG2.1 | Retain finite-extension valuation structures for valued root data. Non-split root-group filtration is not supplied. |
| 19 | LFR2 → RG2.1 | Retain the unramified extension/base-change carrier. |
| 20 | LFR2 → RG2.3 | Retain unramified coefficient change; parahoric comparison is consumer work. |
| 21 | LFR0 → RF0 | Retain local coefficient fields and integer rings. Ramified Witt vectors and period-space geometry are separate. |
| 22 | LFR2 → RF2:untilts | Retain E^ur and Frobenius; completion and continuous extension to E-breve remain necessary. |
| 23 | LFR2 → VB0 | Same coefficient/Frobenius input, not Dieudonné–Manin or descent classification. |
| 24 | LFR0 → ColemanPowerSeries L0 | Retain finite cyclotomic-extension carriers and degrees. |
| 25 | LFR3 → ColemanPowerSeries L0 | Retain Eisenstein ⇒ total ramification/uniformizer, after proving the shifted cyclotomic polynomial is Eisenstein. |
| 26 | LFR1 → ColemanPowerSeries L0 | Retain finite-level unit splitting and pro-p ingredients. Added norm compatibility of the torsion factor and construction of the inverse-limit Z_p-module; no module on all units. |
| 27 | LFR2 → ColemanPowerSeries L0 | Retain the unramified coefficient-extension regime; no arbitrary ramification extension. |
| 28 | LFR1 → DirichletPadicLFunctions L3 | Retain Teichmüller/unit decomposition. Branch normalization is repaired separately in overlap 5. |
| 29 | LFR1 → IntegralIwasawaTheory L1 | Retain semilocal principal-unit objects; reciprocity, closures and inverse-limit exactness are separate. |
| 30 | LFR0 → PadicMeasuresIwasawaAlgebras L0 | Retain coefficient/valuation/lattice inputs. Added warning: separately normalized residue-cardinality norms are not isometric under finite extension; use an extension of the fixed base p-adic norm. |
| 31 | LFR4 → SelmerIwasawaCohomology L2 | **Repair reason.** Unramified H1 is the kernel of restriction to H1(I,M), or the image of inflation from H1(G/I,M^I) with its hypotheses. It is not “inertia-invariant classes.” |
| 32 | LFR4 → SelmerIwasawaCohomology L3 | Retain finite-level inertia terms; no locally compact local-field structure on an infinite extension is assumed. |
| 33 | LFR1 → KTheoryFiniteLocalFields L.3 | Retain finite roots of unity and residue-unit quotient. K2 structure and norm-residue comparison are not supplied by the unit theorem. |
| 34 | LFR2 → LI.4 | **Remove retired process target.** Archive original evidence, do not redirect to an invented consumer. |
| 35 | LFR3 → LI.4 | **Remove retired process target.** |
| 36 | LFR4 → LI.4 | **Remove retired process target.** |
| 37 | LFR2 → LV.1 | **Remove stale attribution.** Current LV.1 discusses global friendly places and no longer contains the quoted input. Its former explicit local linear-algebra use is now LV.0. Global unramified primes require the number-field completion dictionary, not just LFR2. |
| 38 | LFR2 → LV.2 | **Repair quotes/reason.** Current residue-disk contract explicitly uses unramified K_v/Q_p and p>2. Distinguish coefficient field Frobenius from the crystalline cohomological operator. |
| 39 | LFR2 → LV.6 | **Repair quotes/reason.** Current LV.6 is the S-unit/Legendre application with an inert unramified place, not Lemma 6.3's former stage. Retain the local completion ingredient only. |
| 40 | LFR1 → PadicHodgeRegulators D.1 | Retain local Teichmüller, roots and unit decompositions for normalization comparisons. |
| 41 | LFR2 → PadicHodgeRegulators D.1 | Retain coefficient arithmetic Frobenius, with its Witt/analytic comparison consumer-owned. |
| 42 | LFR2 → PadicHodgeRegulators D.3 | Retain the finite-product unramified Q_p coefficient hypothesis; p>3 and completed K3 remain explicit. |
| 43 | LFR3 → FiniteFlatGroups R07.6 | Retain the finite-residue-field filtration/different interface, not the finite-flat torsion bound itself or arbitrary residue fields. Preserve Fontaine's indexing/valuation translation. |
| 44 | LFR3 → SmallRamification R25.1 | Retain local different/discriminant conversion. Added distinction from R07.6's sharper torsion-specific estimate. |
| 45 | LFR3 → FunctionFieldArithmetic FA.3 | Retain local ramification at finite-field completions. Global different/decomposition and completion comparison are not supplied by the local theorem alone. |
| 46 | LFR4 → EulerSystemsAndKolyvaginSystems ES.1 | Retain finite-place Frobenius quotient/inertia maps; finite–singular and transverse cohomological comparisons remain ES.1's. |
| 47 | LFR2 → PhiGammaModulesAndIwasawaCohomology PG.6 | Retain the Q_p/unramified coefficient carrier and base change, not the integral Wach classification. |
| 48 | LFR1 → GlobalNumberFields7 | Retain compact-open principal units at completions for ray-congruence subgroups; global completion maps and infinite places remain global work. |

The original handoff explicitly used **one-sided** roadmap naming for “explicit.”
PROTOCOL §10 now says both texts. Conservatively downgraded active one-sided
attributions to inferred; retained explicit only for the three mutually named
PP/LFR contracts. This does not weaken the endpoint matching; it removes
overstated documentary confidence.

## Four added links

Every addition has two-sided verbatim evidence and
`addedBy: REV-LINK-tauceti_TauCetiRoadmap_LocalFieldsRamification`.

1. **LFR2 → LV.0:** cyclic unramified fields and normalized Frobenius for the
   semilinear-centralizer specialization and its Q_(p²)/Q_p example.
2. **LFR2 → LV.4:** coefficient field/Frobenius order for the local filtered-phi
   transport and linear iterate. Crystalline comparison is not a field theorem.
3. **LFR2 → LV.7:** local unramified Frobenius orbits/degrees and the semilinear
   setup. Current Lemma 6.3 has r≥5; degree≥8 belongs to the arithmetic
   application. Global decomposition groups still need NumberFieldArithmetic.
4. **LFR3 → FiniteFlatGroups R07.4:** the Eisenstein polynomial of the totally
   ramified step over the maximal unramified subfield, for finite mixed-
   characteristic local fields. R07.4 still constructs the coefficient/Witt
   identification, height condition, Frobenius modules and classification.

The first three are declared in the current additional LV roadmap's inputs but
were missing from this link map and the native atlas stage-edge list. The fourth
is an inferred exact supplier/use match. None asserts a general theorem about
arbitrary complete DVRs with infinite residue fields.

## All eleven overlap judgments

1. **Uniformizer — rescope, repaired.** Do not introduce another generic
   predicate. At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
   `Valuation.IsUniformizer` in
   `Mathlib/RingTheory/Valuation/Discrete/Basic.lean:199` is defined under
   `IsRankOneDiscrete`. Its `is_generator` (387) and
   `isUniformizer_of_maximalIdeal_eq_span` (409), together with
   `IsDiscreteValuationRing.irreducible_iff_uniformizer` in
   `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean:93`, already compare
   the intrinsic predicate and maximal-ideal/irreducible descriptions.
   Read the actual statements and proofs. At TauCeti
   `f790474821cf4256814db967cb154e7af3d0c369`,
   `TauCeti.normalizedValuation_irreducible` in
   `TauCeti/NumberTheory/LocalField/NormalizedValuation.lean:295`
   supplies the normalized direction. LFR0 owns the remaining named normalized
   comparison, not a new predicate; QFI owns its square-class choices.
2. **Unified square-depth signature — rescope, retained.** The odd-residue case
   has e=v(2)=0 and a nonsquare residue unit; the dyadic case uses finite K/Q2.
   A common signature must preserve those branches and prove sharpness, not
   merely rename the absolute ramification index.
3. **Arithmetic tame characters — rescope, retained.** R01.2 reuses LFR4's
   tame character, then constructs fundamental-character and Weil–Deligne
   comparisons. Preserve embeddings, Tate twist and Frobenius conventions.
4. **General henselian traits — rescope, retained, edge removed.** LPV.1 needs
   a construction outside finite residue fields and a comparison on the common
   domain. A proposed comparison is not already a supplier of its general theorem.
5. **Logarithm — rescope, repaired.** One early pointwise owner in LFR1;
   consumer L-function and analytic-annulus constructions import it. If
   p=u*pi^e, log_p(p)=0 forces log_p(pi)=-log_p(u)/e, not zero for an
   arbitrary uniformizer. Specify torsion/principal-unit decomposition, tower
   compatibility and branch-change by a valuation multiple. Convergence on
   all principal units and injectivity on sufficiently deep units are distinct.
6. **Z2 unit comparison — keep, repaired.** PP7's finite f domain is f≥2,
   not f≥1. Treat infinity as an intersection, not a natural index. The raw
   logarithm maps 1+4Z2 to 4Z2; reaching Z2 requires a named scaling (e.g. /4)
   and comparison with the chosen supplier isomorphism.
7. **Function-field ramification — rescope, retained.** Use LFR at
   nonarchimedean completions, the existing global/function-field owner for
   global lower ramification and Hurwitz, and prove the completion comparison.
   Keep inseparable/Artin–Schreier–Witt work separate.
8. **Higher local fields — keep, repaired.** Higher residue fields are generally
   infinite and may be imperfect, not universally imperfect: Q_p((t)) has
   characteristic-zero residue Q_p. Preserve the n=1 comparison and the
   distinct higher topology/filtration.
9. **Prime-degree conductor — rescope, repaired.** The break t and formula t+1
   here require total ramification. An unramified prime-degree extension has
   U(K,0) in its norm group and conductor zero. Keep the tame totally ramified
   case t=0, and derive CFT's attained-minimum conductor from the norm lemma.
10. **Norm subgroup carrier — keep, retained.** Formation-indexed
    localNormSubgroup and field-norm normGroup need a named comparison through
    the finite-intermediate-field adapters, not a second norm theorem.
11. **General valued-field inertia — keep, repaired.** C8's scope is larger.
    Only the finite-residue Frobenius/Iwasawa presentation needs that particular
    finiteness assumption; do not claim that the abstract pro-p/Sylow property
    itself does. Reuse the abstract owner and compare on the common domain,
    without reversing the early-to-late dependency.

## Completeness screen and exclusions

Searched all **2007** current atlas/additional-definition stage records for
five query families, one for each focal layer:

| Layer | Queries | Candidate stage hits |
| --- | --- | --- |
| 0 | normalized valuation, ramification index, local fields, uniformizer | 84 |
| 1 | unit filtration, principal units, Teichmüller, power classes, localLogarithm | 23 |
| 2 | unramified, arithmetic Frobenius, E-breve, semilinear Frobenius | 150 |
| 3 | Herbrand, Hasse–Arf, different exponent, ramification filtration, Eisenstein | 64 |
| 4 | wild inertia, tame character/quotient, Frobenius quotient | 11 |

These are lexical candidates, not a claim to have re-read every unrelated
hit or proved mathematical absence. Full candidate contracts inspected include
PerfectoidSpaces P0/P1, KTheoryFiniteLocalFields L.2/L.5, HigherLocalFields HL.0,
EulerSystemsCyclotomicMainConjecture L4, IG.1, R21.2 and ES1:spectral-center.
Perfectoid/infinite-residue/general henselian inputs are not supplied wholesale
by local fields; Eisenstein modular forms are not Eisenstein polynomials;
higher-level packaged Coleman or parameter-stack uses do not automatically
justify another raw local-field edge.

Confirmed **21 already-hosted incident pairs**: CFT (15),
NumberFieldArithmetic (5), AlgebraicCurves (1). No duplicates added.
LocalGaloisGroups and the upstream TotallyRamified #226 consumer are mentioned
by the focal README but have no valid current atlas/new-definition stage ID:
record the limitation rather than invent endpoints. LV.11's global unramified
primes also need the global completion/decomposition owner; its wording alone
does not justify another local-only edge.

## Validation and handoff

- Link checker: **0 errors, 0 warnings**, 47 links, 11 overlaps, 217 original
  examined entries. The retired examined entry is explicitly historical.
- **171 active quotes strictly verbatim**, after restoring source whitespace
  in 66 original passages. Archived removed links keep their historical evidence.
- Cycle stress test: 3508 native atlas edges, 729 current packet entries,
  36 supplemental consecutive-layer edges (LFR, CFT, PP, NumberFieldArithmetic)
  and 238 additional-roadmap declared prerequisite edges. **No target-to-source
  return path for any of the 47 active links.** This is not a claim that every
  unrelated graph component is acyclic.
- Intake validation: **2 authorized files, 0 problems**; **29 intake unit tests passed**.
- Publication refresh at `702ce0178dd6c48ffa2ac5f3d8ed3da29d4eba5c`: all 296
  content files, 230 atlas fragments and six additional roadmap definitions
  were unchanged. The current link input matched the original packet exactly.
  Three concurrently reviewed sibling packets changed metadata/reasons or
  overlaps but no directed endpoint pairs; cycle checks were rerun against them.
  Only the two authorized files are submitted on that fresh base.
- No Lean compilation: no Lean deliverable is part of this job.

The changes are limited to this review and the authorized link JSON. No
upstream contracts were edited. General henselian-trait comparisons, the
unified square/logarithm adapters and the conductor ownership clarification
remain implementation/roadmap follow-up; they are not claimed complete.
