# REV-PKG-AdicSpacesPartII — independent correcting review

Reviewer: Codex, session `codex-Mqtbvk`, 2026-10-09.
Review identity: `independent-review-REV-PKG-AdicSpacesPartII`.
Verdict: **needs_changes**. This is a completed package review, not a checkpoint.

The package's prior acceptance in PR #8016 does not satisfy issue #7598's explicit
requirements. In particular, the previous report acknowledged both the size violation
and the omission of lemma statements. Neither requirement is optional. This review
corrects the local defects below and records the larger changes needed before acceptance.

## The six checks

| Requirement | Result after corrections |
|---|---|
| 1. Upstream form and at most 200 KB | Needs changes: README is 552,424 bytes, exceeding both 200,000 bytes and 200 KiB. |
| 2. Every target has its exact statement and hypotheses | Needs changes: 307 intermediate targets still have only a title and source; API lists generally give names without their statements; inherited mathematical gaps remain. |
| 3. Own words and theorem/section/page citations | Two literal source passages removed. Locator completeness still needs changes; many intermediate targets omit pages. No claim of fresh verification of restricted books is made. |
| 4. No programme process in the roadmap | Needs changes: clear residue removed, but several statements still embed inherited reading/proof statuses which need a mathematical resolution and subsequent rewrite. |
| 5. Suggested file elaborates and matches the roadmap | Compilation passes after replacing the root Mathlib import with individual modules; 912 sorry warnings, no other diagnostics. Coverage and specification limitations remain as described below. |
| 6. Single-line metadata with fitting category | Pass: `topic = "math.AG"` followed by a newline. |

The upstream AdicSpaces and ClassFieldTheory documents establish the expected target
statements, dependency boundaries and prototype form. The current AdicSpaces roadmap
owns complete-field/Tate-algebra strong noetherianness, rational localisation, sheafiness,
the adic-space category and gluing; its completed-tensor-product, fibre-product and
properness boundary agrees with this package's intended extension. The size cap is
explicit in PROTOCOL §20 and the issue, regardless of larger existing upstream documents.

## Fidelity inventory and concrete failures

The accepted input has 537 nodes: 69 definitions, 64 constructions, 82 theorems,
13 comparisons and 309 lemmas. It contains 1,376 API items and 626 unit tests.
An inventory of all target headings finds 542 distinct README targets after removing
three repeated paragraphs. These are the 536 retained plan targets and six moved-down
notions. A title comparison identifies 535 plan targets directly; the restored R5.35
is the remaining retained target under its clarified title. The omitted plan target
`R0/nonarchimedean-field-strongly-noetherian` is correctly imported from the anchor §0.5.
The six additions remain F0.64, F0.65, R2.88, R3.73, R5.43 and F1.77.

Presence of a heading is not specification fidelity. The title-only entries remaining are:

| Layer | Targets without statements |
|---|---:|
| R0 | 89 |
| R1 | 27 |
| F0 | 31 |
| R2 | 51 |
| R3 | 44 |
| R4 | 6 |
| R5 | 26 |
| F1 | 33 |
| Total | 307 |

For example, R0.23 omits the weighted restricted-series base-change hypotheses;
R0.55 omits the complete nonarchimedean field and affinoid-algebra setup;
R3.44 omits the relative-compactness hypotheses of the coherent-finiteness argument;
and R4.3 omits the statement of the slice-site equivalence and its étale object.
A result's appearance elsewhere in a prototype does not meet the explicit requirement
that its statement and hypotheses appear in the README. Some also have no full Lean
signature, so the introduction's general promise of statements in Suggested.lean is
insufficient even as a navigation convention.

The definition and construction entries retain extensive test statements, including
non-examples, but generally reduce their planning APIs to lists of names. For instance,
R0.21 names `completedTensor.inl_comp`, `tmul` and `map` without fully specifying their
equations and functoriality hypotheses. The packet specifies the equality of the two
structure maps and the formula for a pure tensor. The replacement README must preserve
those mathematical contracts concisely rather than merely preserving identifiers.

The input is marked `partial`, with 73 gaps and 22 requests; the checker reports eight
stages in scope and zero closed stages. Its latest acceptance dated 2026-10-02 explicitly
covers a scoped R5 restructuring proposal rather than a new audit of all 537 nodes.
It therefore cannot be used as evidence that those gaps disappeared. Concrete package
examples are R0.79's general affinoid-preimage assertion, R0.82's unrestricted finite
properness assertion, R0.112's non-Tate essential surjectivity, R2.27's unread inputs,
R2.86's missing general-base-field inputs, and R5.36's coefficient-sheaf descent argument.
These are mathematical dependency questions, not JSON validation errors.

R5.35 was a particularly consequential omission: its old one-line title suggested
unrestricted Banach density, whereas the packet supplies the finite-pseudobasis case
and a counterexample for infinite pseudobases. The repaired entry now distinguishes
ordinary density, finite-pseudobasis Banach density and coordinatewise density, and
states the counterexample with ℤ_p[[T]]. R5.36 still requires a replacement argument
for its general assertion; this review neither disproves that assertion nor repairs
CHJ's proof by assuming the invalid density input.

## Corrections applied

- Removed the identical repeated paragraphs F0.36, F0.39 and R3.37; retained their
  mathematical entries and existing numbers. Removed repeated F0.39 and R3.37 entries
  from the prototype's closing list.
- Replaced the literal German source phrases in R3.38 and R3.41 with the mathematical
  condition in the roadmap's own words. Removed the unnecessary quoted restatement
  in R0.1, the bibliographic assertion that passages were quoted, and the stray
  bibliographic reference to a review.
- Replaced R5.7's decomposition history with references to the related mathematical
  results. Replaced numbered-node prose references by target numbers, repaired the
  dangling tube reference to R2.13, and deduplicated A1 prerequisites.
- Corrected R5.19's library boundary: current Tau Ceti's `IsCompactModule.t2Space`
  already gives Hausdorffness. Flatness is the additional requirement. This declaration
  was read at current Tau Ceti `a91d3aaf`; the file is absent at the atlas's f790474 pin,
  so it is a current-library ownership citation, not a claimed pinned import.
- Restored the substantive R5.35 statement and counterexample from the plan and made
  its CHJ locator precise (§6.3, Lemma 6.19, p. 53).
- Made R5.43's public Scholze–Weinstein locator precise (§2.4, Definition 2.4.1 and
  Propositions 2.4.2–2.4.3, pp. 19–20), replacing commentary about an unread book.
- Replaced `import Mathlib` with individual Mathlib modules, retaining the individual
  Tau Ceti imports and all mathematical declaration signatures. Corrected the closing
  prototype comment's inaccurate promise that all listed statements already appear
  in the README.

## Sources, boundaries and limits of verification

Fresh public-source reading used Scholze–Weinstein, *Moduli of p-divisible groups*,
arXiv:1211.6357v2, §2.4, pp. 19–20; Chojecki–Hansen–Johansson,
*Overconvergent modular forms and perfectoid Shimura curves*, arXiv:1507.04875v2,
§1.4, p. 7 and §6.1–6.3, pp. 46–53; and Wedhorn, *Adic Spaces*,
arXiv:1910.05934v1, for the anchor/morphism boundary. Public copies:
[Scholze–Weinstein](https://arxiv.org/abs/1211.6357v2),
[CHJ](https://arxiv.org/abs/1507.04875v2),
[Wedhorn](https://arxiv.org/abs/1910.05934v1).
The R5.35 counterexample follows by comparing the uniformly bounded Laurent
coefficients on the outer boundary with p⁻ⁿxⁿ on the circle |x| = |p|; its distance
calculation is the packet's mathematical correction, not a quotation from CHJ.

This was not a fresh verification of every source theorem. Huber 1996 and Faltings–Chai
are not cleared by the local library index and were not consulted from another copy.
The package still needs precise pages where absent (e.g. R0.10–R0.12 and R4.3).
An unverified locator should not be promoted to a verified one by copying a citation.
The removed passages were source wording, independent of their short length; the user's
standing own-words rule applies to them.

The package's stated suppliers are the anchor, its same-tier bundle AdicEtaleGeometry,
PerfectoidSpaces and DiamondsAndVStacks, lower-tier SchemeAndStackFoundations and named
upstream roadmaps. The six moved-down notions preserve the intended tier boundary and
must retain ownership when their statements are rewritten. The anchor link map was read
for the completion/sheafiness and rational-localisation interfaces. No independent
PartII link-map file or reviewed PartII layer entry in the library-coverage audit was
found. Current-library and upstream checks included the nine newer roadmaps and four
Completed roadmaps, with OperatorTheory's subpackages. The targeted searches found no
reason to re-plan the anchor result or undo the six moves; they are not a proof of
absence for every one of the 537 targets.

The prototype's closing inventory has 332 distinct targets without a full signature
(including targets represented only by ring-level cores), and the file has 221 `example`
declarations. The plan's 626 tests are not in one-to-one correspondence with these
examples. PROTOCOL §13 allows genuinely unstatable conditions to be omitted honestly;
compilation does not certify that all omissions qualify, or that all README targets
are specified. A revision should record a target/API/test correspondence, retaining
real hypotheses and avoiding substitute predicates for missing geometry.

## Validation and required next revision

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdicSpacesPartII.json`:
  exit 0, zero errors and warnings, 537 nodes, 73 gaps, 22 requests. Packet unchanged.
- `lean-check research/blueprint/packages/AdicSpacesPartII/Suggested.lean` against the
  shared f790474/082e2d3 build: exit 0, 912 `declaration uses sorry` warnings and no other
  diagnostics after the import correction. No language server or dependency build used.
- `python3 research/blueprint/intake.py check-files` on the modified deliverables and
  handoff: zero problems. `git diff --check`: clean.

Before acceptance, rewrite the README within 200 KB while retaining every exact target,
its hypotheses and meaningful API/test contracts. Supply the 307 omitted statements;
resolve the stated dependency gaps rather than deleting their warnings to suggest closure;
complete source locators; move reading and coverage statuses to the handoff; and reconcile
the prototype's signature omissions with §13. A mathematical reorganisation or separately
approved roadmap split may be needed. None is silently imposed by this package review.
