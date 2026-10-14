# Handoff: BP-ClassicalArithmeticCompletion--CA.3

Issue #9667. Worker: Claude (session claude-OsVbBo), 2026-10-14. Follow-up of
BP-ClassicalArithmeticCompletion (main packet accepted by REV-ClassicalArithmeticCompletion~3).

Deliverables:
- `research/blueprint/packets/ClassicalArithmeticCompletion--CA.3.json` (part `CA.3`, status `complete`)
- `research/blueprint/readmes/ClassicalArithmeticCompletion--CA.3.md`
- `research/blueprint/suggested/ClassicalArithmeticCompletion--CA.3.lean`

## What this pass did

The main packet's CA.3 coverage record left four items open. All four are now planned; one source
gap remains.

1. **Int(𝓞_K) beyond the definition** (closed, no gaps). Planned from public sources with proofs:
   Cahen–Chabert (Monthly 2016), Chabert's survey "Looking for regular bases" (author PDF), and
   Leriche (JTNB 2011). New nodes: `int-valued-localization` (Lemma 28 / Proposition 29; the
   Noetherian finite-generation argument is supplied), `newton-sequence-criterion` (Proposition 20),
   `legendre-exponent`, `v-ordering-of-a-dvr` (formulas (13)–(14), with short proofs of the
   v-ordering properties supplied), `local-regular-basis-of-int-dvr`,
   `characteristic-ideals-of-a-dedekind-domain` (the local formula; Leriche Prop. 2.1),
   `factorial-ideal`, `polya-ideal`, `factorial-group-basis` (Leriche Prop. 2.2, inversion
   supplied), `polya-ostrowski-criterion` (Cahen–Chabert Prop. 31), `polya-field`, `polya-group`,
   `polya-group-of-a-galois-field` (Ostrowski; Leriche Prop. 3.1, Cor. 3.1, 3.3),
   `imaginary-quadratic-polya-fields` (elementary norm-form proof supplied), and
   `cyclotomic-fields-are-polya` (Zantema, derived from Mathlib's cyclotomic ramification indices).
   The real quadratic classification is stated as a boundary (it needs Hilbert's ambiguous-class
   count and unit norms), not as a target.
2. **Bary-Soroker–Koukoulopoulos–Kozma 51 and 58** (planned, one gap).
   `mignotte-irreducible-factor-l2-bound` states the √m-exponent inequality exactly as BSKK quote it;
   **Mignotte 1988 (J. Number Theory 30, 156–166, Theorem 1′) could not be read**: Unpaywall lists a
   free ScienceDirect copy, but every automated request got a bot challenge or HTTP 403 with a
   text-and-data-mining reservation. Glesser 1990 (Numdam) proves a different bound. The gap is
   recorded; the node also records the weaker classical bound that Mathlib's Mahler-measure API gives
   and why it does not suffice. `irreducible-factor-evaluation-bound` (BSKK Lemma 3.4) is planned from
   it with the corrected ‖A‖₂ ≤ H√(n+1); the printed final inequality survives with a wide margin.
3. **Smith Lemma 2.10** (closed): `primitive-polynomial-gcd` and `squarefree-integral-combination`.
   The proof uses Mathlib's resultant with formal degrees, its specialization lemma, and Mathlib's
   Combinatorial Nullstellensatz for the grid point (Smith cites Salzer's Gregory–Newton formula).
   Formalization warning recorded: Mathlib's normalized `Polynomial.discr` does not specialize the
   way the proof needs; use `resultant F F' d (d-1)`. This answers
   LogarithmicPotentialTheoryAndAlgebraicIntegers request R3.
4. **The 22 review-frontier ids.** The packet's `continuations` field lists, for each main-packet
   node, the obligation, what now supplies it (library declarations read at the pins, or one of the
   new nodes), and `additionalPrerequisites` to add when the CA.3 parts are assembled. Three new
   supplier nodes: `newton-forward-difference-expansion` (Gregory–Newton, closes the
   polya-binomial-basis obligation), `newton-polygon-of-a-point-family` (generic lower convex hull with
   supporting lines, contact sets, slope ordering; closes the newton-slope-multiplicity/dumas
   obligations), and `gauss-jordan-reduced-echelon-form` + `kernel-basis-of-a-reduced-echelon-matrix`.
   Seven entries are target-level proof steps (no key theorem missing); two were resolved earlier.

Also added: Fujiwara's root bound (`fujiwara-weighted-root-bound`, `fujiwara-root-bound`), from the
accepted CA.3 route of PAPER-BHARGAVA-SHANKAR-WANG-22 (item 74), read in Fujiwara 1916 on J-STAGE.

## Requests answered (no new requests made)

- LogarithmicPotentialTheoryAndAlgebraicIntegers/R3 → `primitive-polynomial-gcd`,
  `squarefree-integral-combination`.
- ComputationalNumberTheory's two CA.3 requests (CN.2/phi-newton-side: convex hull, supporting line,
  slope ordering; CN.2/finite-algebra-frobenius-nilradical: finite-field kernel basis) →
  `newton-polygon-of-a-point-family`; `gauss-jordan-reduced-echelon-form`,
  `kernel-basis-of-a-reduced-echelon-matrix`. Recorded in the packet's `requestResponses`; the CN
  packet's prerequisites can be pointed at these ids.

No notion moved down or up a tier; every prerequisite is Mathlib, a main-packet CA node, or
`CA.5/index-of-the-order-z-sqrt-d`.

## Source issues recorded (new)

- E900: Cahen–Chabert Example 34 gives class number 4 for ℚ(√−23); it is 3 (misprint).
- E901: Cahen–Chabert Proposition 33, real case, as printed includes ℚ(√15), which is not a Pólya field
  (𝔭₂ nonprincipal); the second family needs exactly two ramified primes (error).
- E902: Fujiwara 1916, the strict forms (footnote to (1), and (3)) fail for f = a₀Xⁿ (error, degenerate).

## Planets and structure

Five new planets (Factorial ideal, Pólya–Ostrowski criterion, Pólya field, Pólya group, Fujiwara's root
bound). The main packet already has six CA.3 planets, so `restructure` proposes three atlas
sub-layers for CA.3 (normal forms; integer-valued polynomials and Pólya groups; irreducibility, Newton
polygons and polynomial bounds) with the node lists of both packets, at most five planets each.

## Lean

`lean-check research/blueprint/suggested/ClassicalArithmeticCompletion--CA.3.lean` at the pins
(Mathlib 082e2d3, Tau Ceti build f790474): exit 0, no errors, only `declaration uses 'sorry'` warnings
(129). The file imports Mathlib only; it restates `intValuedPolynomials` and `characteristicIdeal`
verbatim from the main CA suggested file (to be merged at assembly). Light definitions have real
bodies (`legendreExponent`, `dvrVOrdering`, `factorialIdeal`, `polyaIdeal`, `IsPolyaField`,
`polyaGroup`, `l2Norm`, `primitiveGcd`, `newtonSupport`/`newtonContact`/`newtonWidth`,
`kernelVector`); `gaussJordan` is `Classical.choice` of an existence theorem (the roadmap asks for a
terminating computation). Every API item and unit test of the packet appears in the file under the
packet's name (checked by script).

## What remains (precisely)

1. Read Mignotte 1988, Theorem 1′ and the remarks after it, in a browser copy; record its exact
   hypotheses (leading coefficient, multiplicity of the factor) and decompose its proof, or replace it
   by a public proof of an inequality of the same shape. This is the only gap; with it closed, CA.3 can
   be marked `closed` once the assembly has wired the continuations.
2. Assembly (ASM-ClassicalArithmeticCompletion): add each `continuations[].additionalPrerequisites` to
   the named main-packet node, merge the two restated Lean declarations, apply or reject the sub-layer
   proposal, and point ComputationalNumberTheory CN.2 and LogarithmicPotentialTheory LP.5 at the new ids.

## Sources read (2026-10-14; URLs and SHA-256 in the packet)

Cahen–Chabert 2016 (Rochester copy); Chabert, regular-bases survey (LAMFA author PDF); Leriche 2011
(Centre Mersenne); Smith arXiv:2111.12660v2; Bary-Soroker–Koukoulopoulos–Kozma arXiv:2007.14567v3;
Bhargava–Shankar–Wang arXiv:1611.09806v3; Fujiwara 1916 (J-STAGE scan, page images read); Hefferon,
Linear Algebra 4th ed.; Kedlaya, Newton polygons notes; Glesser 1990 (Numdam; checked, not used as a
source of record).

Not obtained: Mignotte 1988 (publisher blocks automated access); Cahen–Chabert's book
*Integer-Valued Polynomials* (AMS Surveys 48, not freely available — not needed, every statement here
has a public proof); Zantema 1982 (Manuscripta Math.; not needed, the results used are proved here
from public sources).
