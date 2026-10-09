# Independent package review: q-Hodge filtrations and Habiro cohomology

Verdict: **needs_changes**. Issue #7518; reviewer
`independent-review-REV-PKG-HabiroCohomologyFoundations`; Codex, session
`codex-dYCaCH`; 2026-10-09. I did not write the original package.

The reader covers the supplied plan, and the suggested file elaborates. Acceptance
is withheld because several Lean signatures change the mathematical assertion or
allow arbitrary data where the reader specifies a particular construction.
These are signature defects, not requests to prove the admitted theorems.

## Six required checks

| Check | Result | Evidence |
| --- | --- | --- |
| Upstream form and size | Pass | Introduction, supplier boundaries, conventions, sources, layers, mathematical targets, API and examples; compared with upstream ClassFieldTheory, HodgeStructures and AnalyticToricGeometry. Final README is 163,113 UTF-8 bytes, below 200 KB. |
| Reader fidelity | Pass against the supplied plans | All 151 targets have distinct reader sections; all 266 API names occur. Hypotheses, supplied constructions and retained open problems were compared with the four inputs. |
| Own words and locators | Pass after correction | The text is organized by mathematical construction, not by a paper's sections; no source passage is reproduced. Fixed public source versions were used. The incorrect §3.3 page was repaired. |
| No process | Pass after correction | No packet names, job identifiers, reviews, checkpoints or coverage statuses occur in the reader. Removed an obsolete fix-job identifier from a Lean section heading. |
| Suggested Lean | **Fail on mathematical fidelity; pass on elaboration** | Final `lean-check` exits 0, with 472 warnings, all for `sorry`, and no errors. The unresolved findings below prevent accepting the signatures. |
| Metadata | Pass | Exactly `topic = "math.AG"` and a newline; algebraic geometry fits the cohomology constructions. |

## Scope and reader comparison

The inputs are the four accepted review inputs named by the issue:
`HabiroCohomologyFoundations--HQ.1.json`, `--HQ.1-2.json`, `--HQ.3.json`
and `--HQ.8.json`, under `research/blueprint/packets/`.
Their respective target counts are 122, 7, 3 and 19. Together they contain
38 definition/construction nodes, 266 API items and 153 unit tests.

| Reader layer | Targets compared |
| --- | ---: |
| HQ.1 | 28 |
| HQ.2 | 11 |
| HQ.3 | 27 |
| HQ.4 | 31 |
| HQ.5 | 25 |
| HQ.5-trace | 5 |
| HQ.6 | 3 |
| HQ.7 | 2 |
| HQ.8 | 19 |

I compared statements, hypotheses, prerequisites, definition APIs and examples,
including renamed reader headings. The resulting target-to-section correspondence
is bijective. Namespace-scoped declarations were inspected as such; a qualified
API name need not occur literally when Lean declares it inside its namespace.
Comments describing unavailable enhanced signatures are distinguished from actual
declarations and from completed implementations.

The supplier table agrees with the library audit and RS-10's interim ownership:
HR.4 supplies degree-zero q-Witt theory; HQ.4 retains positive degrees; HQ.1
retains shared framed calculus; generic completion, animation and Koszul machinery
remain imported. HQ.4 supplies HQ.3, and the framed descent application lives in
HQ.3. The finite-étale exports do not make late arithmetic consumers prerequisites.
Prismatic Nygaard is constructed before the trace comparison. The analytic
comparison and the two canonical specialization compatibility problems retain
their stated missing interfaces. The package does not assert their proofs.

## Corrections made in place

1. In the twisted-complex reader section, replaced the incorrect citation
   “§3.3, p.13” by §3.3, pp.28–31. This is Wagner's *q-Hodge complexes over
   the Habiro ring*, v2; the numbered paragraphs immediately around it were
   already correctly located.
2. Repaired `QWittContext.crysFrob` and `rescaledFrobenius_crystalline` in
   `Suggested.lean`. The source and target Adams-base-changed de Rham objects
   now include the respective derived quotients by `q^(p^(a+1))−1` and
   `q^(p^a)−1` before p-completion. The supplied Frobenius includes the
   coefficient projection between these quotients. This matches the adjacent
   `qWittOmega_pCompletion` signature, QW Proposition 4.2 (§4, p.54), QW
   Corollary 4.38 (§4.6, p.77), and QH Proposition 3.19 (§3.3, p.31).
   The original signature instead compared the unquotiented polynomial
   coefficient object with a cyclotomic-torsion object.
3. Removed the old fix-job identifier from the framed-connection section heading.

## Required signature revisions

### R1: the no-go theorem quantifies over the wrong candidates

Location: `Suggested.lean`, `no_functorial_qHodge_with_qWitt`, line 2981;
reader target “No functorial q-Hodge complex has the q-de Rham-Witt complexes
as functorial cohomology”.

The reader and QW Theorem 5.1 (§5, p.78) concern one functor to derived
h-complete modules. Its reductions for every m must have the specified graded
cohomology, with transition maps induced by projections of those reductions.
The Lean statement quantifies instead over unrelated module-valued functors
`H m`, additive equivalences, and natural Frobenius transitions. It contains
neither the common derived complex nor the requirement that these are its
reductions. Its explanatory comment explicitly asserts the stronger impossibility.

The actual h-completed q-Witt complexes already form a functorial family of
graded modules with Frobenius transitions. Taking those modules as `H m`
therefore supplies precisely the kind of family this signature purports to
exclude. The source obstruction is to simultaneously realizing that family as
the cohomology of the reductions of one complex.

Required repair: retain the common derived object, graded cohomology of its
derived reductions, and the induced projection condition. If the supplier
interfaces cannot express these, record that exact missing signature using
PROTOCOL §13's explicit omission convention; do not replace it by a no-go
statement about arbitrary module families. This is not a local renaming or
additional prime hypothesis, so I have not invented a new derived interface in
this review.

### R2: the perfectoid examples accept arbitrary elements

Location: `Suggested.lean`, `StaticTwistedModel`, line 3531, and the examples
labelled `twistedQOmega.nygaardFil_perfectoidQuotient` and
`twistedQOmega.nygaardFil_ne_adic`, lines 3557 and 3571.

The reader specifies A=ℤ, the input `ℤ_p⟨x^(1/p^∞)⟩/x`, its static twisted
model, and its particular q-divided-power monomials. The Lean examples accept
any animated input R, any `StaticTwistedModel`, and any function
`e : ℕ → ℕ → M.T₁`. There is no hypothesis connecting e to those generators.
Taking e identically zero makes the non-adic example assert that zero is not
a multiple of the image of Φ_p(q). It is a multiple, with multiplier zero.
The completed-span example likewise cannot hold for arbitrary e.

The related Frobenius-divisibility example also depends on compatibility of
`M.φ` with the actual relative Frobenius. The structure's realization field
identifies a filtration as an ordinary diagram; it imposes no such relation
on that freely supplied ring map.

Required repair: supply the actual input/model and generator construction, and
connect the Frobenius to that construction. Where these are unavailable,
record the precise omitted examples rather than assert them for arbitrary data.
See QH Paragraph 3.20 (§3.4, p.32) for the filtration and the proof of
Proposition 3.22 (§3.4, pp.37–38) for the special perfectoid calculation.

### R3: static records do not characterize their advertised constructions

Location: `Suggested.lean`, `StaticQuasiRegular`, line 5801, and
`naiveFiltration_mul`, `naiveFiltration_toHodge`,
`naiveFiltration_injective_mod`, `naiveFiltration_baseChange` and their examples.

`StaticQuasiRegular` stores arbitrary rings, ring maps and ideal families.
Surjectivity of the projection and invertibility of p in the comparison target
are its only relevant laws. It does not require a combined Hodge/h-adic
filtration, the actual reduction map, or compatibility of the two filtrations.
These are ordinary algebraic conditions, not merely unavailable higher coherence.
The membership characterization of the preimage is correct; the following
structural claims are not valid for every such record.

A concrete allowed record has A=R=ℚ, p=2, all three stored rings equal to ℚ,
all ring maps the identity, q=2, every Hodge ideal zero, and combined ideal
C⁰=ℚ, Cⁿ=0 for n>0. All recorded hypotheses hold. Its preimage filtration has
F⁰=ℚ and F¹=0. The second assertion of `naiveFiltration_mul` at i=0 then
requires `(q−1)F⁰ ⊆ F¹`, that is ℚ⊆0. The projection-to-Hodge assertion
at degree zero also requires ℚ⊆0. This is a counterexample to the current
signatures, not to QH Construction 4.21 (§4.2, p.62).

Required repair: make the supplier's actual static construction and its
ordinary filtration/reduction laws part of the interface, or state precisely
the additional hypotheses used by each ordinary shadow. Base-change statements
also need maps of the specified constructions, not arbitrary flat ring maps
between independent records. Do not add the desired theorem as an unexplained
propositional field.

The same audit must cover `FreeDeltaRing` (line 5751) and `CotangentTheory`
(line 5676): the former currently records a perfectly covered δ-ring with an
arbitrary element, without freeness; the latter an arbitrary family of
module-valued functions, without identification with cotangent Tor. Their
unconditional examples cannot be justified merely by their structure names.
For instance, setting the alleged free generator to zero in a nonzero
p-complete δ-ring contradicts the asserted regularity of its positive powers.
These constructions are described correctly in the reader; their Lean
interfaces require revision.

## Validation and reproducibility

- Ran `python3 scripts/check_blueprint.py` separately on each of the four input
  packets: zero errors and zero warnings in every case. Their existing gaps
  and requests are retained; validation is not a proof of mathematical closure.
- Read the library audit for HQ.1–HQ.8 and the relevant ownership/link decisions.
  Checked the native geometric-sum, cyclotomic, étale/smooth, Kähler and Fontaine
  theta declarations at Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`. No new native cohomology
  implementation is claimed. Tau Ceti's required baseline is
  `f790474821cf4256814db967cb154e7af3d0c369`; the suggested file imports only
  individual Mathlib modules.
- Checked the public fixed-version PDFs listed in the reader. A numbered-locator
  scan verified 139 citations in the four Wagner papers and 18 in BS, BMS1,
  BMS2 and Scholze against statement start pages; the affected assertions above
  were read in full. Section-only and contextual citations were inspected
  separately. HTML Stacks citations use stable tags and statement numbers.
- Checked available memory before Lean runs. Ran the required `lean-check` on
  the original package and again after the signature repair. Both exited 0;
  each emitted 472 `declaration uses sorry` warnings and no other diagnostics.
- An isolated scratch Lean check, using the unchanged static record/preimage
  definition, constructed the rational record above and proved the negation
  of its h-filtration containment. The same check proved that zero is a multiple
  of any ring element. It exited 0 with no errors, warnings or admitted proofs.
  Its scratch files are not deliverables; the complete witness data are stated
  above so a reviser can reconstruct it.

The three required revisions are sufficient to reject item 5. The report does
not claim that they exhaust every possible defect in the admitted mathematical
interfaces. Recheck the related supplier records and examples after their
repair, then rerun the full suggested file. This is a completed independent
review with a negative verdict, not a checkpoint or a request to finish proofs.
