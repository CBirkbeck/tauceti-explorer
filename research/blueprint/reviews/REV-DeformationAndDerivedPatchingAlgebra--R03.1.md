# Independent review: R03.1 coefficient algebra

Issue #6272; job `REV-DeformationAndDerivedPatchingAlgebra--R03.1`; reviewer Codex, session `codex-MCxfcD`; 10 October 2026. Input: BP #6320 / PR #6523, written by a different worker.

**Accepted as a complete planning pass, with planned coverage and seven explicit gaps.** This verdict checks the proposed mathematics and its recorded boundaries; it does not certify implemented proofs or closed prerequisite chains. The current `detail.json` requires target-level review, superseding the issue's older lemma-level wording. The existing finer nodes were checked without introducing additional proof-step nodes.

## Counts and verdict

| Item | Result |
| --- | --- |
| Nodes | 106: 11 definitions, 8 constructions, 50 lemmas, 37 theorems |
| Independent node verdicts | 79 verified, 27 corrected, none added or unverifiable |
| Pinned baseline declarations | 63 confirmed; none removed or replaced |
| API | 68 named entries, seven added |
| Tests | 57; all 19 definitions/constructions have three |
| Planets | Six central definitions/constructions with mathematical names |
| Source versions | 36 independently inspected: 29 Stacks pages and seven public PDFs |
| Source findings | Ten confirmed: eight inherited and two added |
| Coverage | One planned stage; seven inherited targets realised by named nodes |
| Outstanding interfaces | Seven gaps, six requests, four supplier-boundary proposals |

The packet's `review.checked` gives a separate reason for every node; `reviewSourceAudit` records the independently accessed versions. All implementation statuses remain unchecked. The tests are meaningful proposed assertions with unfinished proofs, not executed tests of an implementation.

## Corrections made

1. **Operational API.** Replaced the cotangent map's existential prototype with an actual linear map, adding its generator, identity and composition laws. Added the two pullback-lift projection laws and quotient-lift computation and uniqueness laws. All seven additions have matching suggested Lean signatures. The pullback and completed-tensor constructors now explicitly bind base residue-map surjectivity; an unused section instance had been dropped from their elaborated signatures. Raw labelled objects remain usable for the later changed-residue family.
2. **Direct prerequisites.** Added the labelled residue-module construction to small-kernel dimension; native flat tensor injectivity to finite exactness; the finite flat-completion comparison to fixed finite products; native local separatedness and finite completion comparison to finite coefficient change; native topological Nakayama to residue generators; and the R03.4 coheight-one supplier to the local-field comparison.
3. **Filtered approximation.** Corrected the proof explanation for `closed-ideal-chosen-generator-lifting`: its approximation hypothesis already preserves the residual's membership in the ideal. No extra hypothesis was inserted. The subsequent finite homogeneous-generator theorem separately retains its generators-in-the-ideal hypothesis.
4. **O-Cohen reduction.** Removed an unsupported application of the preceding, more restrictive coheight-one theorem from `ocohen-basechange`. The required general local-field diagonal comparison, completed coefficient-map flatness with its Noetherianity premises, complete kernel/cokernel and tensor exactness are now explicit in gap 7. The source's O-Cohen statement remains a planned target; its missing proof interfaces are not claimed established.
5. **Upstream ownership.** Corrected the assertion that ModularCurves7D lacks its Artinian object: current upstream already defines `ArtinianTestAlgebra`. The request now concerns the complete marked category and residue-preserving arrows/comparison, reusing that object. No upstream file was changed.
6. **Metadata and sources.** Normalized test kinds to the protocol vocabulary, corrected the pinned `MaximalSpectrum` source line from 801 to 770, supplied printed-page locators for Cohen/perfect-hull nodes, and replaced the inherited French quotation in the target inventory with an original description and locator. Updated the coverage remainder and prototype audit to agree with these changes.

No baseline citation was mathematically wrong. The corrected `MaximalSpectrum` location points to the maximal-spectrum definition rather than the nearby prime-spectrum section.

## Sources and baseline

For every baseline entry I read the declaration and assessed its hypotheses and conventions against its citing nodes. The 63 entries span 48 unique source files; the locally inspected files were byte-identical to their GitHub versions at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` or Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Native objects, finite-generation descent, completion, flatness and derivations are reused rather than replanned.

The seven PDF versions match the input's recorded hashes. Relevant readings include André, Lemma 1.1.1, pp.75–76, §3.4 p.84, §4.2 p.86 and §4.4(1) pp.87–88; Khare–Wintenberger II, §2.1 pp.5–6 and Proposition 2.2 pp.9–10; Bhatt, Lemma 5.3 pp.9–10; Paškūnas–Quast, Lemma 5.15 pp.38–39; Anscombe–Jahnke, Theorems 4.1, 5.1, 6.2 and 6.7 and Corollaries 6.4–6.6, printed pp.8–16; Böckle–Iyengar–Paškūnas, §3.10 pp.22–23, Lemmas 3.35–3.37 pp.24–25 and Lemma 6.3 p.47; and Boxer–Calegari–Gee–Pilloni, §1.8.2 p.8. Packet records provide the exact URLs, versions and per-node locators. All 29 cited Stacks pages were read at their mathematical statements and relevant proofs.

The first eight source findings were checked independently. In particular, BIP Lemma 3.35 retains the corrected finite residue-extension condition already identified by the atlas: finite type alone does not give that condition at every prime. The two added findings concern Stacks Lemma 90.3.12: in proof (2) the universal differentials must be relative to the base, since no residue-field algebra structure is supplied; proof (4) should use the defined essential-surjection terminology. These are version-scoped findings with bounded searches, not claims about an exhaustive published-erratum search.

Matsumura was not available in the cleared library and was not read. André's relative Cohen assertion and Anscombe–Jahnke's Cohen-to-Cohen statements do not constitute an independently established proof of the arbitrary-target prescribed-representative embedding. That remains gap 4. Likewise, BIP's imported diagonal and pseudocompact results remain gap 7; citations in a read paper are not represented as additional sources read by this reviewer.

## Closure, ownership and questions for the maintainer

Read the reviewed library audit and current upstream AdicSpaces/ModularCurves interfaces, searched the nine newer roadmaps and four Completed roadmaps, and inspected the current Tau Ceti library for overlapping coefficient constructions. Nothing found there supplies the missing general interfaces. Reuse of native series evaluation, adic completion, Witt vectors and finite-generation descent is explicit.

The exact imported F0 completed-tensor node has a five-node prerequisite closure independent of R03.1. The four imported P7 graded/finite-length/variable-order nodes have independent closures of seven, one, two and four nodes. Their statements supply the requested algebraic inputs. Node-level independence does not justify cyclic whole-stage links.

The maintainer must assign independent supplier prefixes before packaging treats the stage graph as closed: `F0:adic-algebra`, `R03.3:basic-algebra` and `R03.4:coheight-one-local-algebra`, preserving existing node ownership and IDs. The fourth proposal exposes E2's countable module-tower interface; no reverse R03.1-to-E2 path was found. The R03.2 represented-functor comparison is a consumer request, not a ring-side formal-smoothness prerequisite. These proposals were not applied to foreign packets.

All seven gaps remain explicit: filtered initial-ideal lifting; countable Mittag–Leffler/pro/lim-one interfaces; arbitrary-field formal smoothness over the prime field; relative Cohen embedding into arbitrary complete targets; independent regular-point coordinates and generic-fibre interfaces; Teichmüller/perfect-hull infrastructure; and local-field diagonal/pseudocompact comparisons. Six exact supplier requests identify the needed interfaces. The packet is planned, not source-decomposed or closed. No unresolved contradiction is concealed by that status.

Packaging should use this corrected packet and suggested file as the source of truth and reconcile the earlier reader document, especially its API, upstream-category assessment and O-Cohen proof explanation. That reader file was outside this review's authorized edits.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/DeformationAndDerivedPatchingAlgebra--R03.1.json`: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/DeformationAndDerivedPatchingAlgebra--R03.1.lean`: exit 0, only unfinished-proof warnings, at the recorded Mathlib pin. Tau Ceti's pin was source-audited; the prototype imports Mathlib only because the available compiled Tau Ceti checkout differs from its pin.
- `git diff --check`: clean. Only the packet, suggested file, this report and the review handoff changed.

Six signatures still await genuine supplier types, as listed in `prototypeAudit.omittedTheorems`. Two comparison prototypes retain the documented linear/ring-level signature limits. Compilation checks elaboration of the proposed interfaces, not their proofs.
