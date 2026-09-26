# Handoff: BP-AutomorphicBundles--B5

## Completion-input continuation

Codex — codex-hjdg0j, 26 September 2026. Claim 5850428715, explicit winning reply 5850429590.
Scope remains exactly AutomorphicBundles:B5. **Partial checkpoint; no geometric target is closed.**

### Exact changes

- `cone-compatibility` now names `AdicSpacesPartII:F0/completion-of-morphism` for ordinary
  locally Noetherian scheme charts with the actual ideal-containment condition. The formal-space
  map goes from the individual stratum completion to the common boundary completion; the ring
  map goes the other way. This is an existing supplier, not a new B5 construction.
- `fj-injectivity-cyclic` now names the exact finite-stalk Mathlib inputs:
  `Ideal.iInf_pow_smul_eq_bot_of_isLocalRing`, `IsHausdorff.of_isLocalRing` and
  `AdicCompletion.of_injective`. All need the stated Noetherian-local/finite-module hypotheses,
  and the first two require the ideal to be proper. Completeness of the original module is
  unnecessary. Completion at the unit ideal of F₂ gives the negative acceptance case.
- That node also imports `AdicSpacesPartII:F0/completion-detects-near-closed`, part (i), for
  coherent sections on an ordinary locally Noetherian scheme. A locally closed stratum is
  handled on the open chart where it is closed. This is not a stack theorem: actual chart
  identification, separated homogeneous coefficients, atlas transport and descent remain open.
- The F0 request no longer asks for the generic local-separation theorem or ordinary completion
  map already supplied above. It still requests their application to actual charts and all
  coefficient/stack compatibility that those inputs do not contain.
- Fixed an inherited tuple type-ascription in the suggested file. Four local-completion
  examples were added: the intersection statement, injectivity of the canonical completion
  map, its zero-germ application, and failure for the unit ideal. Three directly invoke the
  existing baseline; the negative acceptance statement has a placeholder.

All fifteen node IDs, thirteen untouched node objects, nine API entries, nine geometric
definition/construction tests, three planets, seven inherited baseline entries and all three
source findings are preserved. No independent review or new source-error finding is claimed.

### Sources and verification

Read the complete current packet mathematics and reader, suggested file and handoff; the
AUDIT-13 B5 entry; the campaign document and B5 stage/edges; relevant link entries; and the two
exact F0 supplier nodes including their hypotheses and proof contracts. The already fully read
GrothendieckEulerForms and JacobianChallenge upstream documents and the binding protocols are
byte-identical to the copies read in this session. No additional full-paper coverage is claimed.

Fresh primary source reading:

- EGA I, journal scan from [Numdam](https://www.numdam.org/article/PMIHES_1960__4__5_0.pdf),
  printed pp. 195–199, physical PDF pages 194–198. In particular, 10.8.11 with proof and
  10.9.1–10.9.3 were read completely. SHA-256:
  `9aba23020217535977e279bdd06a0413f48da703086865ba4c00766c85df4ae6`.
- [Stacks 00IP](https://stacks.math.columbia.edu/tag/00IP), statement and proof of local
  finite-module Krull intersection.
- Pinned Mathlib Filtration.lean (the Artin–Rees/Krull intersection argument),
  AdicCompletion/Noetherian.lean (the proper-ideal separation theorem), and
  AdicCompletion/Basic.lean (the actual canonical map and its injectivity).
  Each source blob was verified against the pinned Git tree.

Lan's editions and E6811–E6813 are inherited unchanged; no fresh Lan reading, independent
errata adjudication or author contact is claimed. The EGA PDF hash identifies the actual
download read here, not the different hash in the supplier packet's own historical record.

### Validation

- Indexed packet checker: **0 errors, 0 warnings**.
- Suggested file **compiled** with Lean 4.34.0-rc2, Mathlib 082e2d3 and Tau Ceti f790474:
  **0 errors; 7 warnings, all intended placeholders**. The first run found the inherited
  tuple syntax error; the corrected final file passed. All 8,482 reached Mathlib sources
  matched the pin and cache; 99 Tau Ceti import modules were built from pinned sources.
- **21 algebraic examples and 7 declaration checks** elaborate. These do not supply the
  fifteen missing geometric signatures or their nine geometric definition/construction tests.
- Internal node graph acyclic. Traversing the existing node prerequisites of the two newly
  imported F0 nodes reaches no B5 node. The early/late C5 stage split remains unresolved;
  no whole-atlas stage-DAG certification is claimed.
- **15 nodes:** 1 definition, 2 constructions, 7 lemmas, 5 theorems; **9 API entries**,
  **9 geometric unit tests in prose**, **3 planets**, **10 baseline declarations**,
  **10 requests**, **7 gaps**. Every implementation status remains unchecked.

### Resume here

Do not reconstruct the local Krull-intersection theorem, ordinary completion-map functor,
or coherent-section detection near a closed subset. Use their precise references above.
Identify the actual early-C5 Mumford chart, ideals and Hodge sheaf; then prove that its
homogeneous coefficient map is the formal restriction used by the imported scheme theorem.
Supply the SF.1 stack transport separately. The common-boundary completion, finite-thickening
compatibilities, neat/non-neat component detection, coefficient-sensitive refinement and
boundary sequence are still the explicit geometric leaves. Hecke action, normalization,
non-neat Hecke descent, Levi and ramified examples and analytic comparisons remain required.
The algebraic compilation gap is resolved, but actual geometric signatures and their tests
and the C5 interface split must be completed before this packet can be closed.

---

The preceding handoff follows as history. Its statements that no local checker or compiler
was available and its seven-baseline/17-example counts are superseded by this continuation.

# Handoff: BP-AutomorphicBundles--B5

## Current continuation: direct prime-filtration baseline

Issue #681, scope exactly `AutomorphicBundles:B5`. ChatGPT Pro (GPT-6 Astra Pro), session `gpt-20260926-c4e7b2`, 26 September 2026. Claim comment `5849358075`, bot confirmation `5849358971`; the issue was re-read after confirmation. Branch `gpt-20260926-c4e7b2-681-prime`.

**Partial blueprint checkpoint. All four job deliverables change. No geometric theorem or whole-stage completion is claimed.** This continuation applies the baseline discovery documented in merged PR #3066 for #551. That source-discovery checkpoint is context, not a mathematical prerequisite: B5 imports the pinned Mathlib directly.

### Exact correction

`Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean` at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, blob `8981a4233c39016cfd51e882d7da6d90c368dec9`, already provides:

- `IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`;
- `IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`.

The actual definitions, parameter universes, theorem statements and proofs were read, including the prime-cyclic subquotient relation, the associated-prime/ascending-chain argument, and the induction's linear-equivalence transport. These apply to every commutative Noetherian ring and finite module, with no complete-local, semilocal, freeness or finite-length hypothesis. The prime case deliberately carries an equivalence of a module with R/p, respecting the module universe.

The packet now cites those two baseline declarations and the inspected source. Only `B5/fj-injectivity-finite` has changed mathematical fields: its hypotheses, proof steps, prerequisites and source list. Its conclusion and acceptance tests are unchanged. The reader and prototype spell out the three induction cases: subsingleton coefficients; the geometric R/p case transported by a linear equivalence and naturality; and a nonsplit short exact coefficient sequence using the existing extension node.

The surjectivity in the induction theorem is on the original coefficient quotient map. It is not a surjectivity assertion for global sections. The geometric prime-quotient hypotheses, naturality, flatness and exactness remain necessary.

Removed exactly one supplier request, `DeformationAndDerivedPatchingAlgebra:R03.3`, and exactly one gap, `Generic prime-filtration supplier scope`, with the matching remaining-work entry. The older instruction below to obtain that generic supplier is superseded. The finite-coefficient geometry is not thereby closed.

### Current counts and preservation

Recounted packet: **15 nodes** (1 definition, 2 constructions, 7 lemmas, 5 theorems), **9 API entries**, **9 definition/construction tests**, **3 planets**, **7 baseline declarations**, **10 supplier requests**, **7 gaps**, **9 source records**, and the unchanged **3 source-issue records**. Every implementation status is unchecked; both packet and stage remain partial.

The other fourteen node objects, all node identifiers, the five earlier baseline records, all source-issue records and the source-version records are unchanged. The request and gap deletions are confined to the generic prime-filtration input. The dependency delta removes that stage edge and adds two baseline leaves, so it introduces no new nonbaseline edge. This is not a fresh full-atlas cycle check.

The reader's relative-coordinate, neat-labelled-stratum, smooth-closure/Stein, common-completion, finite-thickening, non-neat, arbitrary-coefficient and boundary arguments are preserved. No additional source erratum or re-adjudication of E6811–E6813 is made.

The suggested file preserves all thirteen original example blocks and the original recognition theorem. It adds four direct-use examples: the generic induction interface, zero coefficients, Z/4 and Z. It now contains **17 examples and 7 declaration checks**. Its six existing arithmetic proof-placeholder bodies are unchanged; the four new examples use the existing baseline theorems directly. **The file was not Lean-compiled.** The generic motive is an explicit input to the induction example, not a replacement definition of the missing geometric objects.

### Validation actually performed

The complete original packet, reader and suggested file were reconstructed in local scratch and verified against their Git blob hashes before editing:

- packet `73fbe3cb87542880ec64cf2101c033a8e42c55b3`;
- reader `264175578055388e9e122a11dc9b89b88ad951bd`;
- suggested file `8e6ddc50b4bc0f57e1da94cfc7f78061dfa71baf`.

Their uploaded replacement hashes exactly match the locally checked files:

- packet `7b67dc94406c6fd44e22deda05a3e1220f685231`;
- reader `3b62cb86fef38cb23cff254d31f7f21f9dde6188`;
- suggested file `52726d5c0d3a7b407e4f061f5c1ae03a04dca341`.

Local JSON parsing, object-preservation assertions, exact dependency-delta checks, node/API/test-name parity and example-count assertions passed. These parity checks confirm that the existing geometric omissions remain documented; they are not elaboration of those missing signatures.

Python regressions were run on the full subgroup chains, quotient cosets and prime-annihilator congruences for Z/4, Z/8, Z/12, Z/18 and Z/36. All passed. The possible images of one under homomorphisms Z/2 to Z/4 were also enumerated: only zero and two, proving nonsplitting of the reduction in this finite regression. This is not a proof of the general prime-filtration theorem; that is the inspected baseline theorem.

There was no local full-repository checker, global stage-DAG check or pinned Lean compilation. The local environment could not resolve the repository download host and has no Lean executable. Current-head submission CI is recorded in the PR conversation only after observation. PR #3066's successful CI is not borrowed as this PR's validation.

### Readings and exact next work

Fresh evidence is the pinned associated-prime source above and Stacks tag 00L0, whose statement and both proofs were compared in this work. The full current B5 packet, reader, suggested file and handoff were read. Earlier Lan, Stein-factor and audit readings remain attributed to their earlier checkpoints below, not represented as newly performed PDF checks. No PDF was needed for this baseline-dependency correction.

Next, instantiate the three induction cases with the real geometric functors once their earlier B5 nodes and supplied carriers are available. **Do not build another prime-filtration theorem or wait for R03.3.** The required component detection, completed-chart comparison, exact coefficient rows and naturality are still the relevant prerequisites.

Continue the seven remaining gap groups and ten supplier requests: actual neat-chart and labelled-stratum integration; non-neat component transport and descent; common boundary completion and separated coefficient extraction; finite-thickening comparison with the real Mumford chart; coefficient-sensitive refinement and boundary exactness; Hecke and analytic/ramified/Levi comparisons; and geometric signatures with validation. Preserve the early/late C5 and foundations export separation. The detailed geometric work from the preceding continuation is retained below.

## Previous continuation (PR #2957; historical record)

Issue #681; stage exactly `AutomorphicBundles:B5`. Author: ChatGPT Pro (GPT-6 Astra Pro), session `gpt-20260926-c4e7b2`, 26 September 2026. Claim comment `5848962539`, workflow confirmation `5848963446`. Branch `gpt-20260926-c4e7b2-681`.

**Partial source-level proof checkpoint, not completion of the blueprint or a Lean implementation.** Only the B5 reader and this handoff change. The packet and suggested Lean file are unchanged. No request, gap, node status or coverage flag is marked discharged.

The exact preceding handoff, including its detailed source history, inherited checks and remaining-work register, is preserved [at branch base bb5169e6ac6ef3639aeb180798ae86cd46837577](https://github.com/CBirkbeck/tauceti-explorer/blob/bb5169e6ac6ef3639aeb180798ae86cd46837577/research/blueprint/handoff/BP-AutomorphicBundles--B5.md). It is the continuation of merged checkpoints #2932, #2935, #2938 and #2949. Keep those deliverables; do not restart the fifteen-node packet.

## Concrete mathematical advance

The reader now contains **Relative-coordinate density and the neat stratum identification**, inside the existing prime-quotient component-detection argument. This expands the preceding handoff's request for a proof that the actual neat stratum is dense in every geometric fiber of its smooth proper closure.

The generic relative-coordinate lemma is stated with its full hypothesis: distinct boundary branches are independent relative coordinates in a smooth chart. If W is a connected component of a closed intersection of a selected set of boundary components, remove the other boundary components to obtain W^o. Each removed branch cuts a proper divisor in every geometric fiber, or is absent there. A finite union cannot contain a fiber component. The reader proves fiberwise density, descent from etale charts, smoothness, and properness when the ambient model is proper over the regular base. It also checks relative dimension zero.

The application retains the **actual orbit-to-label dictionary**, not just an unlabelled completed local ring. For a stratum component Z_a with cone dimension d, take its closure W_a in the appropriate d-fold boundary intersection. On W_a^o there are exactly d branches. A frontier label corresponds, in a common chart of the compatible fan, to a containing cone face. Equality of branch counts forces that face to be the whole cone, and the chart's orbit-to-label transport gives the original label. Equality of dimensions alone is not used to identify unrelated cusp labels. Finally, W_a^o is connected and the components of the smooth original stratum are open and closed, proving Z_a = W_a^o.

Together with the preceding smooth-closure/Stein argument, this gives the written neat-level component-detection deduction **from those source-qualified owner contracts**. Their actual algebraic-space, chart, label and descent declarations still require integration and validation. The reader explicitly retains that boundary. It does not label an unimplemented interface as an available theorem.

The new collision test shows why the relative condition cannot be weakened. In P1 over a DVR, the sections t=0 and t=pi are each smooth proper, but their intersection is defined by (t,t-pi)=(t,pi). Removing the second from the first gives Spec R[1/pi], which misses the closed fiber. The branches coincide after reduction and are not relative normal crossings. This is a counterexample to a weakened auxiliary assertion, not to Lan's theorem and not a new source-error allegation.

## What is unchanged

The exact reader sections for coefficients, common boundary completions, fan refinement, constant terms, coefficient devissage, arbitrary coefficients, recognition, cuspidality, ownership and the three source issues are retained. In particular:

- The common-completion construction is still an open geometric input. There is still no coordinate-preserving map from k[[x,y]] to k[y,y^-1][[x]] in the claimed generality.
- The finite-thickening quotient/tensor proof still does not interchange tensor and an arbitrary inverse limit.
- The prime-filtration reduction, nonsplit coefficient extensions and unique-lift argument for invariant families are unchanged. There is no averaging and no product/filtered-colimit shortcut.
- Refinement cohomology and the tensor-exact boundary sequence remain separate obligations.
- The non-neat geometric component-transport and descent problem remains open. A neat pullback does not automatically meet every component over a chosen detecting collection; a toroidal level map is not automatically etale everywhere.

The preceding handoff reports 15 nodes, 9 API entries, 9 prose definition/construction tests, 3 planets, 5 pinned baseline declarations, 11 supplier requests, 8 gaps, 3 source issues and 8 packet source records. Those are inherited packet counts, not a new full-packet recount. This continuation adds **no packet nodes, API entries, packet tests, planets or baseline declarations**. A local check did verify preservation of all fifteen reader node references.

The suggested file is unchanged at blob `8e6ddc50b4bc0f57e1da94cfc7f78061dfa71baf`, as recorded in the preceding handoff. Its thirteen low-level example blocks and linear recognition theorem do not constitute the fifteen geometric signatures. Neither those signatures nor the nine geometric tests have been supplied or compiled by this continuation.

## Source and repository evidence

Unchanged library pins:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

No new assertion about presence or absence of a declaration at either pin is made. Existing verification records remain attributable to their earlier authors.

Read the current handoff and whole B5 reader, and the packet's header, baseline and source records relevant to this continuation. The reader input was reconstructed in local scratch and its complete Git blob hash verified as `897897c01da38403ac94463a92f60527e260c898` before editing. The handoff input blob was `009c2b9322aeba23b433580285f2617a22c35af4`.

The actual sources inspected for the new argument were:

- Lan's [author-hosted revision dated 14 March 2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf): the relevant statement of Proposition 6.3.1.6 and its stratum clause; Definitions 6.3.2.13-6.3.2.16; the relevant clauses of Theorem 6.4.1.1 and the neat algebraic-space conclusion. Rendered printed pp. 491, 519-521 and 523 were inspected. Attempts to render pp. 490 and 507 failed; those portions were read as parsed text, not claimed visually verified. PDF indices for the successful page images are 518, 546-548 and 550.
- [Stacks 0CBP](https://stacks.math.columbia.edu/tag/0CBP), its statement and regular-parameter proof. This is an absolute normal-crossings lemma for schemes; the reader expressly does not use it to manufacture the needed relative hypothesis or the algebraic-space chart comparison.

No PDF bytes or binary hashes were obtained. The publisher edition was not inspected. The earlier Stein-factor and other Stacks readings are preserved as history, not presented as new full-source checks. No new errata search or independent re-adjudication of E6811-E6813 was performed. Their scope and novelty limitations remain unchanged; no author was contacted.

## Validation actually performed

1. Verified the full original reader's Git blob hash before editing. Verified that the uploaded reader's returned blob, `264175578055388e9e122a11dc9b89b88ad951bd`, exactly matches the complete locally revised file, not merely a matching excerpt.
2. Checked all 15 reader node references against the original, in order, and checked preservation of the existing numbered sections. Assertions also confirmed byte-for-byte preservation of the mathematical sections outside the bounded insertion, introductory status adjustment and final provenance update.
3. Ran 15 symbolic ideal checks using SymPy, over QQ and finite fields of characteristics 2, 3, 5 and 7. In each coefficient field, Groebner bases verify the total intersection (t,t-u)=(t,u), its specialization u=0 to (t), and the unit ideal after passing to the rational-function field in u. All passed. These are regression checks for the collision example, not a proof of the generic geometric lemma, not tests of a PEL datum, and not Lean tests.

No full repository checkout, `scripts/check_blueprint.py`, global stage-DAG check or pinned Lean compilation was run here. The local environment could not download the full repository or provide the pinned Lean environment; connected GitHub reads and writes worked. Submission CI results must be recorded only after observation in the PR conversation, separately from the checks above. No predecessor's CI or compilation result is relabelled as current.

## Exact next work and ownership

The next worker should integrate the now-written proof into the existing supplier contracts rather than ask again for an undifferentiated proof of fiberwise density. Distinguish three declarations: the generic relative-coordinate density lemma; the neat labelled-stratum/closure identification on the actual toroidal charts; and its application to component detection. Retain their source hypotheses, actual carrier and label maps, and comparisons after geometric base change. Add their source locators and relevant tests to the owning packet(s), then update the consuming B5 request and matching suggested signatures. This checkpoint did not make those packet edits.

Generic relative-coordinate and algebraic-space geometry belongs to the existing SF.0/SF.1 interfaces; the toric cone and label transport belongs to C0/C1 and early C5; the Stein input coordinates SF.2. Resolve export granularity before promoting whole-stage edges. The safe dependency direction remains early spaces/descent, then proper coherent cohomology and Stein factor, then component detection, then the early PEL chart instantiation, then B5. Do not import all later SF.2 into foundational SF.1, and do not confuse the arithmetic-base Stein factor with the late minimal Shimura compactification.

Then continue the non-neat branch/stack transport with actual component coverage and descent. Continue the finite-thickening comparison on the real Mumford-family chart ideals, Hodge transports and degree projections. The common-boundary-completion construction, coefficient-sensitive refinement cohomology, tensor-exact boundary sequence and genuine Lean-carrier/signature obligations remain required. The generic prime-filtration request in R03.3 must still be accepted at the general Noetherian scope, not only its present complete-local conventions.

The early/late C5 split remains essential: early toroidal charts feed B5, while the late minimal-compactification construction consumes B5 constant terms. The untouched B5 scope also includes the geometric pull-identify-trace Hecke action, its arithmetic normalization and composition, non-neat Hecke descent, general Levi weights, ramified Hilbert cases, and actual analytic comparisons. Reuse the reviewed modular-curve and analytic suppliers before introducing new nodes.

The packet and B5 stage must remain partial until these recorded obligations and their validation are actually completed.
