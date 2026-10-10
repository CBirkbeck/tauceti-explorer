# PKG-HabiroCohomologyFoundations~2

Completed package revision for issue #7903, for independent review.
Agent: Codex (GPT-6), session `codex-GHWoyc`; 2026-10-10.
Branch: `codex-GHWoyc-habiro-cohomology`.

## Delivery and scope

Updated the package README and Suggested.lean. The metadata remains exactly
`topic = "math.AG"`. Left review.json and every input packet unchanged.
The reader retains all 151 targets, all 266 API names, 151 source rows and
151 prerequisite rows. It is 166,018 UTF-8 bytes. Layer ordering and ownership
are unchanged. No new upstream roadmap or library implementation is claimed.

This is a completed revision of the presentation, not a checkpoint. Enhanced
signatures which cannot express their defining conditions are explicitly
omitted under PROTOCOL §13, with the mathematical assertion, its name,
source and required supplier interface retained. Their targets remain in the
reader. Ordinary algebraic hypotheses are written out; no unexplained
propositional field assumes a desired theorem.

## Required repairs

| Review finding | Repair |
| --- | --- |
| R1: unrelated module families in the no-go theorem | Removed the false theorem. The precise omission requires one derived h-complete complex functor, graded cohomology of all its derived cyclotomic reductions, and maps induced by canonical divisor projections corresponding to unrescaled Frobenius. The actual q-Witt module family is explicitly allowed. |
| R2: arbitrary relative Frobenius and arbitrary perfectoid generators | Removed StaticTwistedModel and its three unsupported geometric examples. Their omission notes specify the actual twisted/untwisted static complexes, relative Frobenius, the fixed input ℤ_p⟨x^(1/p^∞)⟩/(x), and its canonical q-divided-power monomials. Added a separate ordinary principal-ideal preimage helper with membership, zero, degree-zero and identity-map tests. It does not replace the geometric examples. |
| R3: arbitrary combined ideals, reduction and base change | The comparison target is now native power series over Localization.Away p. The combined ideals are defined by their coefficients, rather than stored arbitrarily. The record has q↦1+h, the constant-coefficient comparison square, surjective reduction with kernel (h), descending multiplicative Hodge ideals with F⁰=top, and localization saturation. These are primitive ordinary laws, not the conclusions of naiveFiltration_mul/toHodge/injective_mod. |
| R3: arbitrary cotangent Tor | Removed CotangentTheory and every caller-selected Tor parameter. Cotangent Tor is native cohomology in degree −i of fixed supplier views of the full cotangent complex, derived reduction and derived tensor with a discrete coefficient module. The private admitted views are the imported DD.0/EDS constructions, not new owners or arbitrary operators passed to a theorem. Identity, polynomial, degree-zero Kähler and nonzero polynomial/regular-quotient tests pin the construction. |
| R3: arbitrary free generator | FreeDeltaRing now has evaluation into every p-complete δ-ring, generator and δ equations, and uniqueness. FreePerfectDeltaRing has the corresponding universal property for perfect complete δ-rings. In both records, native proofs show that the generator cannot be zero in a nontrivial ring. Three evaluation tests accompany each record. |

The ordinary combined ideal's closure under multiplication by arbitrary power
series is proved by the coefficient convolution formula and antitonicity.
Its discrete-Hodge specialization is proved to equal the h-adic ideal, using
Mathlib's `PowerSeries.X_pow_dvd_iff`. The filtered projection to integral
Hodge ideals is proved from constant coefficients and saturation. The
compatible-square lemma `naiveFiltration_map_le` is proved, but is explicitly
separate from the completed flat-base-change equivalence.

Native regression examples reject the review's rational q=2 comparison,
vanishing Hodge degree zero, the zero non-adic witness, and the zero free
generator. Other proved coefficient tests distinguish 1, h and the mixed
Hodge/h degree. The nonzero cotangent examples are roadmap targets with
admitted proofs, not asserted completed implementations.

## Related signature audit and omissions

Ordinary StaticQuasiRegular records do not identify their rings with actual
geometric cohomology. Consequently the geometric étale, exponent-one,
exponent-two and derived-pullback examples, higher-powers surjectivity and
completed flat-base-change assertions now have exact omission contracts.
They require DD.2/PR.6's canonical static realizations, specified envelope
maps/generators, and the completed functorial comparison squares. None is
asserted for arbitrary ordinary models.

The same correction propagates to QuasiRegularModels/QRegObj, the canonical
section, quasi-regular uniqueness and tensor compatibility: their contracts
require the functorial geometric realizations and filtered arithmetic
pullback, rather than unrelated rings for each input. The staticity theorem
requires actual cohomology of the specified derived objects, not arbitrary
CohomologyData functions. The p-tilde comparison requires actual homotopy
fixed points and their comparison map, not an arbitrary functor/map.

TraceData and the trace/number-field comparisons now have explicit imported
signature contracts. Their structured spherical lifts, even filtrations,
THH diagram and coefficient maps cannot be represented faithfully by arbitrary
Type-valued fields or pairs of rings. The identity-cover, ku counterexample,
perfected E₁-lift and polynomial-completion example retain their precise
inputs and prime-two restrictions. The HQ.7 trace acceptance case retains
R=ℤ[1/2][x], its explicit spherical lift and the standard framing.

Do not restore these declarations merely by adding a field with their
conclusion: type the supplier construction and its primitive maps first.
No mathematical target has been removed from the reader, and no previously
open analytic/specialization problem has been promoted to a theorem.

## Source and input corrections

Read the fixed public versions QW v5 (arXiv:2410.23078) and QH v2
(arXiv:2510.04782), particularly QW Theorem 5.1 (§5, p.78), QH Paragraph
3.20 (§3.4, p.32), the proof of Proposition 3.22 (pp.37–38), and
Paragraphs 4.17–4.29 (§4.2, pp.60–67). No restricted source was needed.
The README and Lean comments are independently worded; no source excerpt
or downloaded source file is committed.

Additional package-only corrections found while auditing R3:

- The exponent-one prototype used the image of x in R=A/(x), hence zero.
  Its alleged obstruction had y=0 as a witness. The actual obstruction is
  the nonzero divided-power class x^p/p in the PD envelope. The reader and
  omission contract now distinguish the ambient generator's envelope image
  from its zero quotient image.
- The source's Tor-amplitude counterexample is a particular p-complete
  ℤ_p-algebra (QH Remark 4.20), not an existence theorem over every δ-base.
- The smoothness counterexample needs a nonzero differential modulo p,
  or positive dimension on the mod-p fibre. Positive dimension elsewhere
  does not suffice. The Lean test now carries the explicit differential
  hypothesis, and the reader makes the fibre qualification.
- The derived-pullback cokernel test must verify that 1/p is outside the
  two specified images in an integral witness. It is not universally
  nonzero, in particular when p is invertible. The reader retains the
  cokernel description with that qualification.
- The relative Frobenius formula needs p prime and a base Frobenius lift
  congruent to the p-th power modulo p. The formula now has those
  hypotheses, and relative semiperfectness includes them. Perfectly covered
  δ-bases and perfect-regular presentations record the prime, and the latter
  records compatibility of its δ-Frobenius with the base map.

The broader phrasings of the input tests in
`HQ.5/the-quasi-lci-inputs-and-condition-R` and
`HQ.5/the-naive-filtration-for-quasi-regular-inputs` should be reconciled
with these source-faithful scopes when their owner next updates the packets.
No packet is edited by this package job. The earlier review's crystalline
Frobenius quotient repair and §3.3 pp.28–31 correction are preserved.

## Validation

- Final `lean-check research/blueprint/packages/HabiroCohomologyFoundations/Suggested.lean`:
  **exit 0**, **452 declaration-uses-sorry warnings**, **zero errors and
  zero other warnings**. Checked available memory before every run; no build,
  cache download or language server was started. No job process remains running.
- Checked all four authoritative packets with `scripts/check_blueprint.py`:
  **zero errors and zero warnings** for each. Their pre-existing gaps and
  supplier requests are retained.
- Verified all 151 reader headings/source/prerequisite rows and all 266 API
  names. Every API terminal name is present in Suggested.lean, as a scoped
  declaration or explicit omission. This text check is not a proof of fidelity;
  the repair mapping and source checks above provide that evidence.
- Read current upstream AnalyticToricGeometry and DifferentialGeometry readers
  in full. Searched current upstream additions and Tau Ceti for overlap;
  no shared cotangent, q-Hodge or Nygaard construction is re-planned.
- Checked the new native derived-category, power-series and ideal statements
  in Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  The required Tau Ceti baseline is
  `f790474821cf4256814db967cb154e7af3d0c369`; current Tau Ceti was read
  for duplication checks. Suggested.lean imports only individual Mathlib
  modules, and adds no Tau Ceti import or implementation.
- `git diff --check`, package size/metadata, allowed-file scope and intake
  private-path checks pass.

Next step: independent package review, focusing on the ordinary static laws,
fixed cotangent construction and universal free-ring properties, and the
explicit omission contracts. Nothing requires a worker checkpoint handoff.
