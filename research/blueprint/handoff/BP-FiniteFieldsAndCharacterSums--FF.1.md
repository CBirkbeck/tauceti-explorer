# BP-FiniteFieldsAndCharacterSums--FF.1 handoff

Job #6348. Agent Codex, session codex-LExbxM. This is a complete target-level planning pass on FF.1, ready for independent review; coverage is **planned**, not closed. The accepted predecessor is imported without edits. Only this part’s packet, reader, suggested file and this handoff are changed.

## Delivered

Eight new nodes: seven theorems and one construction; six construction API items; four named definition tests; four planets; 32 pinned baseline declarations; one mathematical gap; two exact supplier requests; two source findings. All node implementation statuses remain unchecked. The reader is approximately 3,500 words.

The three predecessor remaining targets have exact plans:

1. Finite-field Fourier transport imports AC.0/fourier-transform and AC.0/fourier-parseval and the predecessor shift bijection. It uses the actual additive field, native complex character coordinates, q⁻¹ normalization and the positive inversion kernel. The all-character coefficient node includes the trivial character’s constant coefficient (q−1)/q.
2. Digit-sum and factorial distribution have explicit cyclic-fractional-part and existing-Gamma derivations. Hasse–Davenport’s product target gains the public Cohen Gamma route, including χ^m=1, m=1, arbitrary primitive additive characters and p=2. The exact prime-to-p Gamma root identity avoids claiming that a congruence modulo the cyclotomic prime kills p-power roots.
3. The BFP two-point all-polynomial sum has a native degree-bound constructor, full API/tests, explicit two-evaluation surjectivity and fibre cardinality, then native row orthogonality. Infinity means the coefficient of the prescribed degree. This is the interpolation ingredient, not the rest of Lemma 5.2’s squarefree induction or hyperelliptic moment.

An additional elementary target factors native Gauss sums on a presented product of finite fields. It consumes component character factorisations and existing norm/trace lifts; it neither introduces another Gauss sum nor classifies finite étale algebras.

## Precisely what remains

The unconditional Hasse–Davenport target is still dependent through `DirichletPadicLFunctions:L3/robert-gross-koblitz-comparison` on two missing native interfaces from `PadicDifferentialEquationsAndRigidCohomology:RD.6`:

- The coefficient norm bound for the actual Robert-sign formal series exp(πX)exp(−πX^q), including the normalized Q_p embedding and all primes.
- The actual convergent coefficient sum at native Teichmuller points equals the chosen-root trace character. Supply the compatible choice of π in the cyclotomic completion, π congruent to ζ−1 modulo (ζ−1)², the inverse-Frobenius sign conversion and p=2 (π=−2, ζ=−1).

The current RD.6/dwork-isocrystal node does not export those exact interfaces. The packet copies the two inherited L3 questions, specifies this target as consumer and adds the compatible-choice existence requirement. L3’s Gamma multiplication and exact root-power nodes are imported as existing plans; they are not treated as pinned library declarations or as discharged unconditional Gross–Koblitz input. No separate Gamma or Dwork theory is planned in FF.1.

After the supplier exports are available, instantiate the actual Gross–Koblitz comparison and certify the complete product chain. The arithmetic identities, field-coordinate Fourier transport and two-point interpolation do not need a new generic supplier request.

Assembly must preserve the predecessor’s existing product target id and attach this completion route rather than displaying two product targets. Replace the predecessor Fourier target’s coarse AC.0 prerequisite/request by the exact transform and Parseval ids plus this transport; this discharges its old general Fourier request. Replace its unresolved arbitrary-root gap by the precise inherited analytic gap until that is supplied. This part intentionally does not edit the predecessor, the orchestrator queue or promoted atlas data.

## Confirmed red-team findings

- **RT-AREA-finitefields/7:** All built character, row/column orthogonality, Gauss inverse-pair/quadratic-square, Jacobi quotient/inverse-pair/iterated-product and quadratic reciprocity identities are baseline citations with exact hypotheses. Complex modulus and the convention dictionary are predecessor imports. The additional presented-étale-product comparison uses native gaussSum and an elementary factorisation. The obsolete EXT-08 duality proof of the built Gauss product is not reused. That external packet correction belongs to maintainer integration.
- **/8:** The accepted predecessor already has the full elementary norm/trace lifting route, including −g_lift=(−g)^n; its ids are retained. This part supplies the distinct product proof route and every trivial/binary boundary. Conrad (A.6) and Cohen Theorem 11.7.16 are the product locators. Deligne’s lifting statement is Théorème 1.15, volume p.177; §4.12 is its reinterpretation, not its statement. The external locator correction is an integration note, not a new cohomological target here.
- **/9:** No Lang torsor, character sheaf, Gauss cohomological-realization, Poincare-duality or Euler–Poincare/Swan node is parented under FF.1. The accepted corrections send the former objects to FF.2 and Euler–Poincare to its external owner. The two RD.6 questions ask only for exact scalar analytic series facts, not a full cohomological dependency beneath classical reciprocity.
- **/10:** Work starts from the accepted blueprint predecessor and the accepted RS-03 narrowing, so the historical accepted EXT-08 work is not silently overlooked. The packet’s upstreamNotes retain the placement/baseline and supplier-forwarding corrections. Promotion of the two old EXT-08 packets, their queue states and copying review sections 7–8 into DECISIONS are maintainer integration tasks outside this job’s four authorized files; no claim that those changes were performed is made.

## Sources and corrections

Public sources personally read on 2026-10-05:

- Kowalski’s elementary exponential-sum notes, complete Propositions 1.10 and 1.13, their character conventions and §2.1.
- Conrad’s Gauss/Jacobi notes, Appendix p.19, (A.6), denominator sign and footnotes.
- The publicly hosted 2007 Springer GTM 240 scan of Cohen, Number Theory II: Analytic and Modern Tools. Complete Gamma distribution proof pp.372–375, Gross–Koblitz statement/comparison pp.386–387, chosen-root comparison pp.390–391 and complete product proof pp.392–395. Imprint/ISBN and page images of pp.390–391 checked.
- Bergström–Faber–Payne arXiv:2206.07759v2, Lemma 5.2 proof pp.8–9, including the distinction between the all-polynomial interpolation and subsequent squarefree induction.
- Cohen’s author errata dated 2008-11-30, Volume II entries and whole-file locator search.

URLs, dates and hashes are in the packet. Cohen Volume I’s digit-distribution proof was not obtained: the author “numthrybook” file was front matter, so it was not used as proof. The new digit argument and imported Gamma formula replace that unavailable proof dependency. Jakubec’s publicly obtained four-page elementary Davenport–Hasse article was also read as a candidate; its prime-field p>3 and χ^m nontrivial hypotheses do not provide the required all-prime-power target. It is not cited as its proof. Robert’s paper was examined as a lead; the exact analytic inputs used here are imported from the inspected L3 packet, not claimed newly proved from that OCR.

Source issue **E750** records the excessive modulus in Cohen Lemma 11.7.12 and its proof. At p=3 the printed chosen-root condition is impossible; the corrected maximal-ideal condition is used throughout this part. The page image and a valuation counterexample support the finding; no correction was found in the available author errata or publisher record search. It awaits independent review. **E751** records the already published n/N correction in Theorem 11.6.14. No authors were contacted.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/FiniteFieldsAndCharacterSums--FF.1.json` with the pinned declaration index: **zero errors, zero warnings**.
- `lean-check research/blueprint/suggested/FiniteFieldsAndCharacterSums--FF.1.lean`: **elaborated successfully**, admission warnings only. The shared existing build has the exact pinned Mathlib; only Mathlib modules are imported. No library build, update, cache download or language server was started. Memory checked before each sequential run.
- Packet/suggested declaration, six API names and four named examples agree. Baseline kinds/modules checked against the index after actual statement reading. All ids are new; 128 recursively reached exact owner nodes in the product chain have no node cycles.
- 1,280 digit/factorial cases checked for p=2,3,5,7, f=1,2,3, all divisors and permitted b.
- Hasse–Davenport numerical comparisons on F₄ and F₁₆: 3,402 cases across all multiplicative characters, nonzero additive shifts and divisor orders; Fourier coefficient, inversion and Parseval checks on those actual noncyclic additive fields. Relative tolerance used for large complex products; these are semantic checks, not proofs.
- Exhaustive coefficient enumeration over F₃ for d=1,2,3 verifies all ordered distinct projective-point fibres, vanishing and trivial-character boundary. Degree-zero and repeated-point exclusions checked.

No scratch input is needed to resume. The packet records all persistent mathematical interfaces, citations, source corrections and remaining work. Review this part, obtain the two supplier interfaces, then assemble it with the accepted predecessor.
