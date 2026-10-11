# Independent review: Kawasaki’s Cohen–Macaulay blowing-ups

**Verdict: accepted as a complete planning pass.** Job
`REV-DESIGN-DeformationAndDerivedPatchingAlgebraPartII`, issue #3515,
11 October 2026. Reviewer: Codex, session `codex-f9W6zf`. The reviewed design
was written by session `codex-k5lYji` and submitted in #8786; this reviewer
did not contribute to it.

The packet plans all fifteen accepted route items at target level. Its
`review.checked` records an individual statement, source, dependency or
discriminator check for every node: **49 verified, 18 corrected, one added,
none unverifiable**. Acceptance concerns the mathematical plan, not completed
formalization or closure of the five recorded gaps.

| Measure | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 67 | 68 |
| Definitions / constructions | 4 / 2 | 4 / 2 |
| API items | 31 | 37 |
| Discriminating tests | 26 | 26 |
| Planets | 19 | 19 |
| Baseline declarations | 40 | 44 |
| Gaps / supplier requests | 5 / 4 | 5 / 4 |

K1 is closed. K0, K2, K3 and K4 are planned with precise remaining work.
Every target is realized, and dependency chains terminate in native
declarations, justified supplier requests or recorded gaps. This is the
meaning of `complete` and `planned` in PROTOCOL §0; these statuses do not
assert that a missing supplier interface is implemented.

## Corrections made

1. **Positive-power torsion.** The Schenzel target already concerned the
   union of positive-power kernels, but its signature only covered the first
   kernel. It now quantifies over every positive exponent. Replacing the last
   secant parameter by a positive power preserves its support cut, so the
   immediate-kernel estimate gives this formulation. See Česnavičius,
   Remarks 3.2–3.3, p. 10, and Kawasaki 1996, Lemma 2.4, p. 42. Their accessible
   statements still do not close the recorded primary-proof gap.
2. **Selected-prefix robustness.** Remark 3.12, p. 13, preserves the three
   auxiliary-quantified conditions on the selected prefix by concatenating
   auxiliary lists. The old signature asserted inheritance for all shorter
   prefixes from secancy on only the full terminal quotient. The revised
   statement and signature assume and preserve the conditions for one
   selected prefix. The auxiliary-induction gap now explicitly requires the
   prefixwise secancy and inheritance argument needed by the weaker-hypothesis
   outer induction and regular-terminal reduction.
3. **Ordinary duality.** Two signatures explicitly admitted that they had
   dropped an essential normalized-dualizing-complex hypothesis. They have
   been replaced by valid conditional consequences of an actual finite
   cohomology complex, annihilator equalities, the coheight function and
   localized vanishing comparisons. The CM-locus consequence also takes the
   actual support-dimension/coheight equality. The full targets retain their
   normalized-duality and equidimensionality hypotheses. Constructing these
   data from `RHom(M,ω)` remains the AS.1 request, including degrees below the
   normalization shift and the all-integer-degree convention.
4. **Vanishing claim and induction.** Claim 3.14.6, pp. 16–17, uses the outer
   preceding-stage depth bound for both the original module and every
   `M/r_s^mM`. These two families now appear as explicit assumptions on their
   actual localized previous chart modules. The depth proof explains the
   simultaneous induction over eligible modules and the inheritance needed
   to instantiate it. There is no dependency cycle disguising the induction
   hypothesis. The remaining inheritance argument is recorded, not assumed
   to follow from selected-prefix robustness alone.
5. **Rees-module API.** Added coefficient extensionality, coefficientwise
   linear maps, their characteristic coefficient equation, and identity and
   composition laws. Restriction of native polynomial-module maps preserves
   `I^nM` and is Rees-algebra linear. These five API items require neither
   localness nor finite generation.
6. **Sheaf-map characteristic equation.** Added the lemma node
   `K3/module-blowup-map-chart`, marked `addedBy` this review. Its typed square
   identifies the restriction of the induced sheaf map with the affine tilde
   map of localized coefficients on the actual image spans. A generator
   equation fixes the chart map. Formal identity/composition laws alone had
   not specified this behavior. This adds the sixth new API item.
7. **Direct prerequisites.** Off-centre, zero, self, chart-surjection and
   support results now cite the chart characterization they use. The map
   cites Rees and chart constructions; its identity/composition results cite
   the map and its characteristic square. The two-ideal comparison cites
   the strict transform and chart results; regular-terminal reduction cites
   the Rees module. The vanishing claim cites the Rees/chart comparisons.
8. **Metadata.** Removed stale `untypedTests` on module blowing-up: all three
   examples already have elaborating signatures. Updated the five source
   verdicts, source-reading scope, supplier requests, coverage lists and
   roadmap descriptions to agree with the changes. No planet, target route,
   ownership boundary or tier was changed.

## Sources and proof checks

The public versions actually read are recorded in both JSON files with URLs,
edition, section/page locators and SHA-256 hashes. All eight artifacts behind
the seven source records matched their recorded hashes:

- [Česnavičius, arXiv v2](https://arxiv.org/pdf/1810.04493v2): §3 in full,
  pp. 9–17, and §1.14, p. 4.
- [Kawasaki 1996](https://www.kurims.kyoto-u.ac.jp/~kyodo/kokyuroku/contents/pdf/0964-3.pdf):
  §§1–2, pp. 40–43, especially Definition 2.5, Lemma 2.4, Theorem 2.6 and
  Lemma 2.7. This is not a substitute for the missing full Kawasaki auxiliary
  induction.
- [Heinzer–Johnston–Lantz–Shah](https://www.math.purdue.edu/~heinzer/preprints/rrii53.pdf):
  Example 3.6, p. 13, with its surrounding discussion, pp. 12–13.
- Stacks: [10.113.1, tag 02IJ](https://stacks.math.columbia.edu/tag/02IJ),
  [§10.70, tag 052P](https://stacks.math.columbia.edu/tag/052P),
  [31.33.12, tag 080A](https://stacks.math.columbia.edu/tag/080A),
  [47.16.5, tag 0A7U](https://stacks.math.columbia.edu/tag/0A7U) and
  [47.17.3, tag 0A7Z](https://stacks.math.columbia.edu/tag/0A7Z), with the
  complete relevant proofs; HTML has section/lemma locators rather than pages.

The Matlis argument separates a nonzero cyclic element using the essential
injective hull and extends the functional by injectivity. The general defect
formula follows from finite dual cohomology and the coheight localization
shift; equidimensionality is needed only to turn it into the CM-locus formula.
The corrected d-sequence colon criterion uses the later index. The two
Goto–Yamagishi identities retain the positive-power bound and their separate
roles in the double induction (Lemma 3.10, pp. 12–13).

The Rees dimension bound uses the finite-type domain height inequality,
transcendence degree at most one, and a minimal-prime reduction. It does not
assume universal catenarity or equality when the ideal is zero. Appending the
irrelevant homogeneous prime supplies the Proj dimension drop. The zero module
and empty Proj have bottom dimension. These arguments avoid reliance on an
unread HIO book.

For the local depth proof, the relation is `r_bT−r_a`; the monic residual
polynomial acts injectively after flat base change. The two short exact
sequences extracted from the relation long exact sequence give the stated
vanishing range, followed by the principal-support spectral-sequence shift.
The bound applies to closed support points over the local base point, with
properness and localization used for the final CM assertion.

The nonexample was checked independently: the original semigroup ring is free
of rank 21 over `k[x³,y⁷]`, with the displayed reduced monomials having distinct
exponent residues. The `x³` blowup chart is finite over `k[a,d]`. Its nonzero
class `c²` modulo `a` is killed by `d` through `dc²=ab³c`, giving depth one at
the specified maximal chart prime. This tests the necessity of the special
centre rather than merely asserting an existential counterexample.

All five inherited source findings E4–E8 were independently reconfirmed at
their arXiv v2 page locators, including visual inspection of the displays.
Their `review.by` is now this job. The arXiv version history, author publication
list and a bounded corrigendum search yielded no applicable correction notice.
This review did not independently recheck the separate author manuscript or
the unread Duke version of record; earlier manuscript scope remains explicitly
inherited. No new source finding was added.

## Baseline and ownership

All 40 inherited declarations were read at Mathlib `082e2d3` / Tau Ceti
`f790474`, including full ambient hypotheses and namespaces. None was removed
or replaced. `AlgebraicGeometry.projIsoSpec` was clarified as an isomorphism
of locally ringed spaces used to build the Proj scheme structure. Four native
citations were added and confirmed: `PolynomialModule.coeff_inj`,
`PolynomialModule.map`, `PolynomialModule.map_smul`, and
`AlgebraicGeometry.tilde.map`. In particular, the scalar-ring and scalar-tower
parameters of the polynomial map specialize correctly to the same ring.

The reviewed parent audit row and actual R03.3, AS.1 and L5 stage statements
were checked. Current StableReduction and AlgebraicVectorBundles documents
were read, the newer and Completed upstream roadmaps were screened, and the
current Rees grading, affine blowup algebra and affine chart source modules
were read without building that checkout. Their existing geometry is reused.
No existing CM-secant, d-sequence or Kawasaki module target was found duplicated.
The requested ordinary-ring AS.1 and generic L5 interfaces are absent from
their visible plans and are described as requests, not supplied theorems.

## Validation and handoff

`python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebraPartII.json`
reports **0 errors and 0 warnings**. The final suggested file elaborates with
`lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebraPartII.lean`:
exit 0, **106 warnings, all uses of `sorry`**, and no other diagnostic. APIs,
test names, node tags, locators, coverage and the allowed-file diff were checked.
The suggestions are theorem statements and admitted constructions, not proved
implementations.

There is no blocking question for the orchestrator. Follow-ups should close
the five packet gaps with their existing owners. Packaging must synchronize
the reader document with the corrected signatures, APIs and induction context;
that document is outside this issue’s listed deliverables and was not edited.
The concrete resume instructions are in the accompanying handoff note.
