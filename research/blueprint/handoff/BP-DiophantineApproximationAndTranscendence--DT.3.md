# DT.3 quantitative logarithmic forms — handoff

Job BP-DiophantineApproximationAndTranscendence--DT.3, issue #9321.
Worker: Codex, session `codex-37Jw43`, branch `codex-37Jw43-dt3`.
The bot confirmed the claim on 2026-10-13 at 12:13 UTC.
This is a completed planning pass under PROTOCOL §0, with DT.3 **planned**;
it is not a closed stage or a claim of formalisation. All implementation
statuses are `unchecked`. The original accepted packet is unchanged.

## Deliverables and extent

The DT.3 packet, reader and suggested file contain 52 new targets:
24 theorems, 14 comparisons, eight definitions and six constructions.
They carry 54 API items and 53 definition/construction checks, retain the six
existing planets and cite 23 declarations read at the pinned libraries. There are eight precise
proof gaps and seven supplier requests. No target is duplicated by reusing
an id from the original packet. The original 80 DT.3 targets are retained:
qualitative targets are imported and quantitative targets have an explicit
output map. Output links are not assumptions of their own proofs.

The complex route specifies the Laurent filtration, leading Hilbert form,
subgroups and invariant derivatives; transverse and relative multiplicity;
delta polynomials and alternants; interpolation rank and the arithmetic and
analytic estimates for the same minor; the M=1 parameter criterion and its
rounded parameters. It supplies the sum-normalized explicit estimate and a
conservative pointwise bound with
`Csafe(m)=2^(m+25)m^(4m+10)`. That bound supports the general algebraic-coefficient
fixed-logarithm Baker target, including a constant term, and its complex
multiplicative consumer with a bounded `2πi` correction. The sharper pointwise
constant and sharp Matveev/LMN targets remain distinct.

The finite-place route specifies both valuation normalizations, strict exp/log,
integral restricted series, Hermite denominator control, Schwarz extrapolation
and finite-place Liouville. It includes the elementary one-power bound, integer
relative Siegel adapter, bounded monomial basis, binomial irreducibility and
simultaneous radical relation. Yu interpolation exposes the torsion split,
integer coefficients, normalized derivatives, initial grid, extrapolation and
contraction budgets. Its Kummer descent distinguishes independent, lower-rank,
dependent-last and one-dimensional inputs. The final consumer states the
generated-field degree, actual residue degree and prime restriction in an
arbitrary larger algebraic field. The numeric Yu end target still depends on
the obligations below.

## What must be resolved

1. **Sharp pointwise Waldschmidt constant:** reconcile the pointwise hypotheses
   with the weighted sum-size condition in Theorem 9.19. The explicit rescaling
   proves `Csafe`; it does not preserve the sharper `C(m)` without another check.
2. **Sharp Matveev/LMN:** the English Matveev Corollary 2.3 was read and specialized
   exactly, but its §§3–21 proof was not decomposed. The original three Matveev
   targets and the LMN 24.34 target are retained. The Matveev two-log replacement
   remains conditional on that import; conservative Baker consumers do not need it.
3. **Effective house:** trace the original Dobrowolski, Smyth and Boyd inputs to
   the strict `log house(α)>1/(2d²)` estimate, including degrees 18 and 20.
   Northcott/Kronecker does not provide its numerical constant.
4. **Short relation:** trace the earlier bounded-relation determinant/covolume
   proof and Yu’s change from `9D²` to `2D²`, with branch and torsion bookkeeping.
5. **Terminal nonvanishing:** read Yu 1989’s journal Lemma 2.5 cited by Yu 1990,
   p.60, and give the exact final polynomial-degree versus grid inequality.
   Shrinking `Ln` to zero alone is not a contradiction.
6. **Improved parameters:** verify every floor loss and all simultaneous initial
   row-count, coefficient, jet and fractional-grid Liouville budgets in Yu 1994,
   equations (2.28)–(2.31), pp.262–263, and pp.263–266. The small-n constant-row
   domination has already been checked separately.
7. **Descent calibration:** verify the stronger large-last-height refinements,
   Yu 1990 Propositions 3.2/3.4, and eight-case transformed height/coefficient
   comparisons with the improved constants before asserting the unit end bound.
8. **General and Phi comparison:** repair the dyadic residue-degree formula,
   redo the unit-to-general comparison and then the four-regime comparison to
   `Φ`. Keep actual prime restriction and relative ramification throughout.

Resume with the exact `neededBy` ids and hypotheses of G1–G8 in the packet and
reader. Mathematical proof targets, supplier contracts and source locators are
all in the committed deliverables; no scratch file is required to continue.

The original DT.3 packet already has six headline planets. This continuation
adds zero planets, retaining those six through `retainedPlanets` metadata.
The internal multiplicity, interpolation, Schwarz and descent targets have
no planet annotation; adding five more would exceed the combined layer limit.

## Owner requests and boundaries

- **SchemeAndStackFoundations:SF.0, Part II:** multigraded Hilbert polynomial,
  primary-component lengths, unmixed complete intersections and the degree bound.
  DT.3 keeps only their concrete Laurent and multiplicity consequences.
- **LocalFieldsRamification Layer 1:** existing local exp/log equivalence at
  `(p−1)i>e`, Teichmüller lift and residue-unit structure. DT.3 derives the
  order-isometry adapter from the series.
- **LocalFieldsRamification Layer 2:** unramified-extension residue correspondence
  and composita, yielding `f=lcm(f0,2)` after adjoining `ζ3` over a 2-adic field.
- **NumberFieldArithmetic Layer 5:** canonical completion embeddings with
  lies-over data, finite local extensions, ramification/residue identification and
  `ordP(x)=e(P/P0)ordP0(x)`.
- **GlobalNumberFields Layer 0:** the product formula with finite-place value
  `(p^f)^(-ordP x)` and comparison to analytic p-order.
- **DT.0 → ArithmeticHeights Layer 5.6:** the integer-coefficient relative Siegel
  estimate, including its strict unknown count and product of row heights.
- **DT.0 → ArithmeticHeights, Part II:** the effective house input in item 3.

The two Part II directions are recorded as rescope proposals. ArithmeticHeights
PR [#287](https://github.com/TauCetiProject/TauCetiRoadmap/pull/287), head
`b8aec35b6cd8e68031df1038a2cae63088be4a17`, is treated as an existing upstream
plan, not as a pinned baseline theorem. No dependency is imported from the
higher-tier ClassicalArithmeticCompletion or Habiro roadmaps.

The current upstream roadmap tree was checked at
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti source at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was searched and its Kummer modules read.
Pinned statements were read separately at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Current infrastructure is not presented
as if it existed at those pins. Nearby GlobalNumberFields and
ArithmeticDirichletSeries documents, the relevant LocalFieldsRamification and
NumberFieldArithmetic layers, and ArithmeticHeights interfaces were read.

## Sources and corrections

The packet records URLs, editions, read sections, dates and available hashes for
Waldschmidt’s DALAG author copy; Yu’s published 1990 and 1994 papers and 1990
correction; Matveev’s English version of record; and Yu’s MPIM 1987 precursor.
The reader states results in our own words with theorem, section and printed-page
locators. No source passage or section-by-section source summary is included.
No private reference-library source was used.

The normal-function proof was read in the MPIM precursor; this does not discharge
the journal terminal lemma in item 5. The original short-relation and effective
house sources and the sharp LMN proof were not obtained/read at proof scope.
Matveev’s §§3–21 remain undecomposed. These are explicit gaps, not alleged imports.

Nine source findings, E601–E609, are recorded for independent checking: two sign/branch
misprints and the M*>1 and weighted-size discrepancies in the DALAG author copy;
three corrections already published for Yu 1990 on pp.20, 35 and 97; the Cp
correction in Yu 1994; and the dyadic residue-degree formula in Yu 1994, p.271.
The DALAG findings are scoped to the author copy and have not been collated with
the publisher’s version. Search locations and known corrections accompany each.

At p=2, the printed `max(f0,2)` formula fails when f0 is odd and greater than 1.
For example `Q(root of X³+X+1)` has discriminant −31 and irreducible reduction
modulo 2, hence unramified cubic completion. Its residue field F8 has no primitive
cube root; adjoining one gives residue degree 6. This is a counterexample to the
proof formula, not to the final quantitative theorem.

## Validation

- `python3 scripts/check_blueprint.py` on the packet, including the pinned
  declaration index: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on the deliverables:
  **0 problems**.
- `python3 scripts/check_sorry_data.py` on the suggested file: **no offenders**.
- `git diff --check`: **passed**.
- `lean-check` on the final suggested file: **exit 0**, only ten expected
  theorem/example `sorry` warnings. The shared build reports Mathlib
  `082e2d37e8`; available memory exceeded 20 GB before each check. No build,
  cache update or language server was started.

The suggested file has 129 lines, three finite-product polynomial definitions
with real bodies, six examples and four end/milestone theorem signatures.
It follows the 2026-10-12 roadmap shape: heavy constructions and their complete
APIs remain in the reader. Its signatures use the native absolute height and
rational p-adic norm; they introduce no data filled by a proof placeholder.
