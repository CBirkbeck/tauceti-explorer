# Independent review of EllipticRegulators ER.7

**Job:** REV-EllipticRegulators--ER.7 (#6440). **Reviewer:** Codex, session
`codex-vQ7zPw`. **Date:** 2026-10-06. **Verdict:** `needs_changes`.

The mathematical pass is complete. I corrected the packet and checked every
fresh node, baseline declaration, construction API, test and planet. Acceptance
requires synchronizing the definitive reader with these corrections. The reader
is not an editable deliverable of this review issue, so its contradictory period
request, source-proof descriptions and general-model dependencies remain visible
below. This verdict does not require completing the six honestly recorded proof
and supplier gaps before a target-level plan can be accepted.

## Counts and scope

| Item | Result |
| --- | --- |
| Fresh nodes | 16: 3 definitions, 1 construction, 11 theorems, 1 comparison |
| Node verdicts | 6 verified, 10 corrected, 0 added, 0 unverifiable |
| Baseline declarations | 12 independently confirmed; none removed |
| Construction APIs / unit tests | 26 / 16, four tests for each construction |
| New planets | 2; assembly retains 4 inherited planets, giving 6 total |
| Gaps / supplier requests | 6 / 13, with scopes corrected and expanded |
| Source findings | E24 independently confirmed; no new finding added |
| Packet / stage status | `complete` / `planned`, retained; no stage closed |

The review covers the whole packet and suggested file, the definitive
[reader](../readmes/EllipticRegulators--ER.7.md), inherited declaration statements
and proof-closure records, the reviewed ER.7 library audit, supplier statements,
and confirmed finding RT-AREA-ktheory-2/6. A complete target-level pass is an
audited plan, not an implementation or a proof-closed stage. The three parts of
SS 1.1.2 remain separate nodes. The open same-original-modulus twist assertion
remains G5 and is not assumed by the general elliptic application.

## Sources actually checked

All sources are public. The packet retains their retrieval dates and SHA-256
identities. Added `sourceVersions` distinguishes the two SS copies used for E24.

- [Schappacher–Scholl author copy](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/RSS.pdf):
  §§1–7 and references, including all fresh-node locators. The
  [published-pagination scan](https://ncatlab.org/nlab/files/SchappacherScholl.pdf)
  was used to independently inspect 3.1.8 at published p.286; the complete scan
  is not claimed collated against every sentence of the author copy.
- [Deninger–Scholl](https://www.dpmms.cam.ac.uk/~ajs1005/preprints/d-s.pdf):
  (1.3)(1),(6), proper shifts and descent; (2.6)–(2.8), regulator functoriality,
  supports and the cycle-map construction.
- [Siegel's lecture notes](https://www-users.cse.umn.edu/~garrett/m/mfms/notes_2013-14/Siegel_AdvAnNoTh.pdf):
  §1 Theorem 1 and proof, §3 Theorem 2 and proof, §5 Theorem 3 and proof.
- [Brunault's thesis, arXiv v1](https://arxiv.org/pdf/math/0602186v1):
  Merel's entire appendix, pp.143–155, including Theorems A, C, D and Corollary 2.
  Chapter 3 declarations are imported from the accepted original packet;
  this review does not claim to reread their full proofs.
- [Brunault's published article](https://www.numdam.org/item/10.24033/bsmf.2532.pdf):
  introduction pp.215–218, hypotheses of Theorems 1.1/1.4 and Remark 1.2.
- [Shimura, On the periods of modular forms](https://gdz.sub.uni-goettingen.de/dms/resolveppn/?PPN=GDZPPN002314584):
  page images pp.211–214, Theorems 1–2, Lemma 1 and the two-prime remark.
  The packet hash identifies the explicitly linked IIIF manifest, not a PDF.

Bloch's general correction lemma, Shimura's underlying 1976 arguments and the
Deligne–Rapoport/Katz–Mazur/Carayol proofs behind the special-fibre contracts were
not newly read. The full-level correction avoids the first; the others remain
specified supplier obligations in G6. Every fresh SS/DS excerpt matches the
extracted source after whitespace normalization. The Shimura replacement was
collated with the page image. Consumer specializations are now identified as
such rather than described as exact separately named source results.

## Corrections made

1. **Period quotient.** The PS.1 request incorrectly included `2πi` in
   `L(π,2)L(π⊗χ,1)/L(ωπχ,2)`. SS 2.3 places this quotient in
   `c⁺(π)L′(π̌,0)·Qbar`. The `2πi` factor belongs to the regulator integral
   of 1.3.2/5.2, whose statement remains correct. R16.5 now imports the current
   `AutomorphicLFunctionsAndLocalFactors:AL.3` owner, replacing the nonexistent
   roadmap name used in the request.
2. **Source proofs.** Siegel §1 applies Poisson summation to a power kernel,
   followed by a beta integral and branch-cut contour estimates. Section 3 uses
   Abel summation, a Liouville partial-fraction argument and logarithmic products.
   Gaussian theta transformation and a split Mellin integral occur separately
   in §5. Corrected the inherited closure, target coverage, G6 and the Poisson
   baseline description. The analytic summability, contour and interchange
   obligations remain open, rather than being attributed to a read but different
   proof.
3. **General modular-curve integrality.** E.6's integral-part and
   model-independence nodes quantify over elliptic curves. Removed those two
   unsuitable prerequisite citations from the general modular-curve nodes.
   Full-level integrality now imports the S.6 scheme-weight and residue-weight
   interfaces. At a good prime the argument uses the **proper** smooth fibre's
   weight-one units, not a claim that the open fibre's K1 target vanishes.
4. **Arithmetic-model transfer.** Added the S.2 pullback, proper G-theory
   pushforward, Cartan and flat base-change declarations, together with S.6
   projectors. Transfer a total model-K2 lift and then project the target to
   weight two; do not assume arbitrary arithmetic-model pushforward preserves
   pure Adams weights. R13.6 explicitly requests regular resolved graphs and
   common regular dominating models in mixed characteristic. Its current
   special-fibre graph description and characteristic-zero R09.7 resolution
   do not already supply this theorem. Recorded the requested extension in G6
   and added dependencies to the integral, adjointness and elliptic-line nodes.
5. **Proper covariance without circularity.** Removed the inherited
   `regulator-under-finite-pushforward` prerequisite from the new adjointness
   theorem: that theorem is the proposed repair, so importing the old assertion
   would be circular. DS gives the compact-class covariance used here. The
   stronger inherited assertion for arbitrary function-field symbols still
   needs compact/open functoriality or supports; corrected its closure status
   and added that explicit obligation to G2. Invariant rational descent remains
   valid; arbitrary character traces may cancel.
6. **Locators and excerpts.** Replaced nonliteral excerpts for Hecke separation,
   the Shimura remark, full-level integrality, general integrality and DS
   covariance; replaced the unhelpful fixed-level excerpt. Expanded the
   integrality locator to include the proof printed after 7.3.2. Clarified the
   full-level correction and elliptic-image/line source specializations. All
   per-node verdicts and changes are recorded in the packet's `review.checked`.
7. **Source misprint.** Added E24's independent confirmation and both read
   versions. From `q_w=exp(2πiz/w)` and `Eφ=−2πyφ+O(1)`, differentiation gives
   residue `wφ`. Width two with φ=1 gives 2, whereas the printed inverse-width
   formula gives 1/2. The unit-divisor convention in 3.5.0–3.5.1 independently
   confirms the product. Both page images have the inverse-width misprint.
   The packet records the searches for an existing correction; none was found.

The suggested file changed only in explanatory comments about the quotient,
general-model proof and compact scope. Its concrete definitions, API signatures
and test signatures did not require correction. No nodes or planets were added.

## Baseline verification

Read actual source statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`, not just name-search hits.

| Declaration | Module and usable scope |
| --- | --- |
| `Function.Periodic.qParam` | `Mathlib/Analysis/Complex/Periodic.lean`: exponential with width parameter |
| `Function.Periodic.norm_qParam` | Same module: exponential norm with height divided by width |
| `ModularForm.eta` | `Mathlib/NumberTheory/ModularForms/DedekindEta.lean`: q-parameter/product normalization checked |
| `DirichletCharacter.IsPrimitive` | `Mathlib/NumberTheory/DirichletCharacter/Basic.lean`: conductor equals modulus |
| `DirichletCharacter.LFunction` | `Mathlib/NumberTheory/LSeries/DirichletContinuation.lean`: `[NeZero N]`; agreement with series for Re(s)>1 |
| `Submodule.comap` | `Mathlib/Algebra/Module/Submodule/Map.lean`: semilinear inverse image |
| `Submodule.map` | Same module: surjective scalar homomorphism; identity scalar map over Q |
| `Submodule.span_image` | `Mathlib/LinearAlgebra/Span/Basic.lean`: same scalar-map surjectivity condition |
| `Submodule.mem_iSup_of_directed` | `Mathlib/LinearAlgebra/Span/Defs.lean`: nonempty index and directed family required |
| `Real.tsum_eq_tsum_fourier` | `Mathlib/Analysis/Fourier/PoissonSummation.lean`: one-dimensional continuous kernel, locally uniform norm summability, summable Fourier integrals |
| `HeckeRing.GL2.Newform` | `TauCeti/NumberTheory/ModularForms/Newforms/Newform.lean`: normalized away-from-level eigenform; does not supply bad-prime eigenvalues |
| `UpperHalfPlane.peterssonInner` | `TauCeti/NumberTheory/ModularForms/Petersson/Basic.lean`: conjugates first argument, hyperbolic measure, no congruence-index division |

All twelve citations remain. The Poisson `provides` field was refined; all
`checked` fields now record the independent review. This is distinct from the
two removed elliptic-only **planned supplier** citations above. Merel's pairing
requires reversed arguments and its stated index normalization; G3 retains that
adapter. Name searches at both pins found no existing ER.7 regulator or
integrality targets; the Mathlib Beilinson hits were unrelated t-structure
references. The reviewed audit's partial modular-form/Petersson coverage is
consumed, not replanned.

## Closure, ownership, APIs and planets

Direct supplier statements were checked in SchemeKTheoryOperations S.2/S.3/S.6,
EllipticKTheory E.3/E.5/E.6/E.7, the ER.2 normalization and ER.6 conjectural
formulation, Kato L0/L1, and the R29.5/R29.6 parametrization/modularity nodes.
ModularCurvesPartII and R16 stage descriptions were read to distinguish their
current contracts from requested extensions. Every non-routine missing adapter
ends in a named gap or a precise request. No whole late Iwasawa or regulator
stage is silently assumed.

RT-AREA-ktheory-2/6 is handled in both the packet and reader: Kato L0 solely owns
Siegel units/divisors/descent, and the generic pair-symbol interface is an early
L1 extension. Its existing distinguished-pair node does not supply arbitrary
pairs. The early L1 and M.8 boundaries remain explicit G1/G2 ownership
obligations. Upstream ModularForms and Completed/ContourIntegration are
imported without duplicate nodes. The R14.6 supersingular representation and
full oldvector/motive comparison are explicit extensions, not consequences of
a graph Laplacian or of a single newform vector.

The four APIs have membership/constructor, identity, zero, transfer or
composition and compatibility laws. Tests catch compact **cancellation** before
intersection, growth at a finer level, rational degree inversion, omitted
ramification exponent, change of uniformizer and a pushforward with a kernel.
They are useful planning tests with `sorry`, not executed mathematical proofs.
The two new planets are Beilinson subspace and Integral Beilinson subspace;
the ownership rescope removes the inherited unit/generic-symbol planets and
retains the four named consumer results. The assembled layer stays at six.

## Required reader synchronization / orchestrator action

The line numbers below refer to the reader as received. Apply the corrected
packet fields to the corresponding sections in a revision with reader-editing
scope, then obtain a fresh independent acceptance. No change to its target list,
construction API, test list or RT-AREA-ktheory-2/6 ownership decision is needed.

| Reader location | Required correction |
| --- | --- |
| 327–337, full-level integrality | Use proper smooth-fibre weight-one units at good primes; replace E.6 integral-part supplier with S.6 scheme-weight-decomposition and residue-weight-shift |
| 349–358, integral Beilinson subspace | Copy corrected hypotheses, total K/G transfer plus target weight projector, common-regular-model argument and general S.2/S.6 prerequisite list; remove elliptic-only E.6 model-independence |
| 416–418, adjointness | Copy corrected integral graph step and prerequisite list, removing the inherited pushforward assertion and adding graph/total-transfer/weight suppliers |
| 437–440, elliptic regulator line | Copy total model-K2 transfer/projector step and add S.6 and R13.6 dependencies |
| 454 and 466, Siegel proofs | Distinguish §1 power-kernel/contour proof, §3 Abel/Liouville proof and §5 Gaussian theta/Mellin proof; update analytic obligations |
| 482, inherited pushforward closure | Say only compact-class covariance is repaired; retain arbitrary function-field extension in G2 |
| 521, supplier overview | Remove the claim that elliptic E.6 supplies general modular-curve model independence; name the added S.6 and general S.2 interfaces |
| 537, R13.6 request | Copy explicit mixed-characteristic regular graph/common-model extension and total transfer/projector contract |
| 543, R16.5 request | Replace nonexistent owner with `AutomorphicLFunctionsAndLocalFactors:AL.3` |
| 545, PS.1 request | Delete `2πi` from the L-value quotient's period line; retain it in the regulator integral statement at 157 |
| G2 and G6 paragraphs | Copy expanded compact/open, power-kernel/Abel/contour and regular-model obligations from the packet |

Question for the orchestrator: please give the revision the definitive reader
path as a deliverable. This review has completed its authorized corrections;
there is no unfinished investigation or checkpoint. Acceptance should wait for
the synchronization above, rather than promoting two conflicting versions.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticRegulators--ER.7.json`:
  0 errors, 0 warnings.
- Packet source findings checked with `source_issues.check_issues` and
  `check_errata.versions_checked`: 0 errors. The standalone errata CLI expects
  an `errata-v1` file and is not the appropriate packet wrapper.
- `lean-check research/blueprint/suggested/EllipticRegulators--ER.7.lean`:
  exit 0, exactly 42 warnings, all declaration uses of `sorry`, covering 26 API
  signatures and 16 test signatures. Memory was checked before compilation.
  Only explanatory comments changed subsequently; all Lean terms are unchanged.
  The shared Mathlib build is at the required pin. The shared Tau Ceti build is
  at a different commit, so its two declarations were checked from source at
  f790474 and are not imported in this Mathlib-only file. No build was created.
