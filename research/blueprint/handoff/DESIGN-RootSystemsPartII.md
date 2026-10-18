# DESIGN-RootSystemsPartII — issue #3358

Agent: Codex. Session: `codex-SmFmMR`. This is a completed design submission for independent review, not an implementation or a checkpoint. The bot confirmed the claim on 18 October 2026 (issue comment 6243919136). Only this job was claimed.

## Delivered scope

The issue expressly permits planning the first independent direction and proposing the others as a restructure. The four `RootSystemsPartII` layers close the finite integral-dominance/folding direction: the ordinary Stembridge step, sums over distinct root orbits, orthogonal and adjacent-even-A folds, component-cycle transport, invariant chamber/cone transport, the existential invariant step, and its export to an actual cocharacter lattice with central directions retained.

The packet has 12 target nodes (2 definitions, 4 constructions, 6 theorems), 35 API entries, 24 discriminating unit tests, 11 planets, and 24 pinned baseline declarations. All four finite layers have closed planning coverage, with no gaps or requests. Every implementation status remains unchecked. The definitive reader carries the construction APIs and checks; the compact 162-line suggested file has only two light real-bodied definitions, three endpoint signatures and nine examples, following the newer WORKERS.md shape.

All 80 items from the five routed source briefs have an explicit, unique assignment. Nine are covered here: the eight Kisin–Zhou items plus KPZ R01, which shares the integral order. Fifty go to the proposed affine direction `RootSystemsPartIIDominanceAndDemazure`; twenty-one go to the proposed `RootSystemsPartIIMinusculeBounds`. The packet's `restructure` contains their full DA.1–DA.5 and MB.1–MB.3 design briefs. These briefs preserve source/extraction corrections as requirements for those future source audits; their source proofs have not been independently certified by this finite-folding job.

## Ownership and follow-up for the maintainer

- Keep this job's assigned id and filenames, `RootSystemsPartII`, for the finite direction. If the split is accepted, preserve `RootSystemsPartIIDominanceAndDemazure` as the affine direction and create the modular direction once. Consolidate the older `RootSystemsDominancePartII` candidate alias into the single RS2.1 integral-order interface. No queue, reserved ids or other roadmap files were changed.
- The affine direction must import the integral order from RS2.1, retain full central translations and possible torsion/nonfaithful affine action, and audit its exact ReductiveGroupsPartII suppliers. The base RootSystems finite Coxeter API does not provide an extended Iwahori–Weyl group. The split brief retains normalized subtraction on the full coweight lattice and the explicit finiteness guards needed for Newton fibres.
- General root/weight lattice dictionaries remain upstream. The current RootSystems link review already identifies differing ownership prose in RootSystems and LieHighestWeight. This plan uses the actual pinned cone and explicit integral subgroups/coroot values, avoiding a second lattice construction. No higher-tier notion was moved down beyond the newly owned finite dominance/folding interfaces.
- Independent review should concentrate on the adjacent A_(2n) pairing factor two, nonunique root lifts, the component return-map normalization, and the ambient projection argument. Do not strengthen forward integral-weight transport into a surjection onto the folded weight lattice.

## Sources and correction

Directly read Rapoport, *A positivity property of the Satake isomorphism*, §1 pp. 153–154 and §2 pp. 156–158 (especially Lemma 2.3 and its complete proof); Stembridge, *Folding by Automorphisms* (20 August 2008), pp. 1–3, condition (1) and Claims 1, 3, 4 with proofs; and Kisin–Zhou's 63-page author file `l-indep_v2.pdf`, §5.2, Proposition 5.2.3 pp. 49–52 and Corollary 5.2.7 pp. 52–53. URLs, precise locators and available file hashes are recorded in the deliverables. Sources are described in our own words; no source passages or PDFs are committed.

`RootSystemsPartII/E1` retains the already confirmed extraction finding `PAPER-KISIN-ZHOU-25/E12`: the author preprint's generic inference from individually bounded translates to a bounded orbit sum is invalid. The reader supplies a D4 calculation and an existential replacement via the folded system. This is a proof-inference correction, not a counterexample to the geometric proposition. The final Annals PDF could not be inspected; no claim is made about its wording. All Kisin–Zhou page locators refer to the inspected author file.

Actual baseline statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The current read-only Tau Ceti library (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and TauCetiRoadmap (`0d144d044dacebca17b654695b6f1ad58f159b27`) were checked for existing work, including the current RootSystems and LieHighestWeight readers and suggested files. The reviewed library audit has no dedicated audit for these layers; its silence was not used as evidence of absence. No upstream checkout was changed or built.

## Validation and reproducibility

- `scripts/check_blueprint.py` on this packet, also with the shared pinned declaration index: 0 errors, 0 warnings.
- `scripts/check_sorry_data.py` on the suggested file: passed.
- `lean-check` on the suggested file: exit 0, with exactly twelve intentional `declaration uses sorry` warnings and no other warnings. Available memory was over 80 GB before compilation. No language server, Lake build, dependency update or cache download was started.
- Submission path/JSON checks and staged whitespace checks: passed.
- Supplemental finite arithmetic check: generate roots by closing simple coordinate vectors under Cartan reflections, partition the resulting finite set into diagram-automorphism orbits, sum distinct members, and check the fold cardinalities. A2/A3/A4/A5/A6 reversals give 2/8/8/18/18 folded roots; D4 triality gives 12; D4 transposition gives 18; D5 fork exchange gives 32; E6 reversal gives 48; B2 and G2 identity folds retain 8 and 12. For invariant simple-coordinate difference budgets in `{0,1,2,3}`, with original invariant dominant simple-coroot values uniformly 0 or 2, enumerate the nonzero differences whose upper endpoint is dominant. All 387 such cases admit a positive folded-root increment within the budget and preserving dominance. The D4 arbitrary-orbit counterexample separately leaves a central coefficient of −1. These finite computations check examples, not the general theorem. Their procedure and results are preserved here because disposable scripts/logs are removed when the PR opens.

## Next action

Independent review of this design, followed by the maintainer's decision on the two split briefs and candidate aliases. No additional claim or implementation work belongs to this run.
