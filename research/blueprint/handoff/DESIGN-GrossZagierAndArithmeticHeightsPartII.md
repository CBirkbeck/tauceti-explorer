# DESIGN-GrossZagierAndArithmeticHeightsPartII

Codex, session `codex-Ckhn82`, 19 October 2026. Issue #3392; claim confirmed by the swarm bot in comment 6264584727. This is a complete target-level design pass under PROTOCOL §0, ready for independent review. It is not a checkpoint or a claim that the mathematics has been formalized.

The four deliverables share the basename `GrossZagierAndArithmeticHeightsPartII`: the roadmap definition, packet, authoritative reader and representative suggested Lean file. They cover the coalesced unitary Kudla–Rapoport/arithmetic Siegel–Weil direction and Zhang's separate arithmetic fundamental lemma (AFL) proof branch. The roadmap has parent `GrossZagierAndArithmeticHeights` and area `arithmeticgeometry`.

## Coverage and boundaries

There are 104 nodes: 19 definitions, 20 constructions, 48 theorems, 16 comparisons and one application. Every definition/construction has a uses list, three API items and three checks, for 117 API items and 117 checks. There are 36 planets, five pinned baseline declarations, 57 distinct external node references, 204 internal node references and 66 stage references. The packet's 15 layers U0–U14 are all `planned`; none is `closed`. Each coverage entry records the transitive gaps and supplier contracts that remain. Packet status `complete` means that this planning pass covers every layer, not that those obligations have been discharged.

The layers run through unramified cycles, strata/horizontal components, Tate/local modularity, analytic/local identities, almost-dual comparison, exotic geometry, exotic density/identity, Krämer geometry, corrected Krämer density/identity, local AFL reductions, global cycles, virtual fat CM cycles, Green/arithmetic modularity, arithmetic Siegel–Weil, and global AFL comparison. Their target descriptions, node graph and reader agree. Heavy carriers absent at the pins remain mathematical reader targets, named in the suggested file's closing comment.

All eleven input briefs were read. `inputAllocation` preserves all their routed item lists. The 187 retained item allocations (Li–Zhang 70, Zhang 66, Li–Liu I four, Li–Liu II 25, Krämer 22) have explicit `sourceMap` destinations, including shared-foundation imports and precise supplier requests. The independent continuations are four split proposals, not implicitly assumed theorems:

- `UnitaryArithmeticInnerProductFormula`: Li–Liu I's 53 and II's 26 items, together as one direction; consumes these cycle and local-identity interfaces.
- `GSpinSpecialDivisorHeights`: AGHMP's 75 and SSTT's 42 items, together, with orthogonal integral-model and lift-depth suppliers preserved.
- `PadicArithmeticInnerProductFormula`: the 18 Disegni–Liu items, beyond the parent's rank-one p-adic formula.
- `HigherGreenFunctionCMValues`: the 23 higher-Green items from Gross–Zagier, separate from the unitary divisor Green currents here.

These are complete allocations for separate design jobs; this pass did not independently verify the split directions' primary papers. The other five `restructure` entries extend existing owners for PEL/RZ/RSZ models, relative trace comparison, arithmetic Chow theory, nonaffine formal filtration and ramified densities. No atlas data or supplier files were edited.

## Baseline and ownership audit

The reviewed library audit and parent GZ layers were read before design. Baseline commits are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The five cited baseline declarations are the actual `Polynomial`, `Polynomial.C`, `Polynomial.X`, `Polynomial.eval` and `Polynomial.derivative` definitions read at that Mathlib pin. Their scope is the elementary normalization witnesses, not arithmetic geometry.

The supplied current upstream roadmap tree was inspected at `0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Current IntegralLattices and OrthogonalSpinGroups foundations were checked, alongside searches for the actual special-cycle, density, RZ, Green/current and arithmetic-Chow interfaces. General lattice/signature/spin objects are not planned again. The two upstream prose models read were GrothendieckEulerForms and AlgebraicCurves. No build commands were run in the read-only trees.

Read exact supplier statements rather than inferring coverage from titles: GN.2/GN.3 supply hermitian duals/invariants and the **unramified** Cho–Yamauchi identities; FK.0–FK.4 supply supported formal K theory with their actual support, resolution-property and properness hypotheses. The affine filtration-product theorem is not a nonaffine formal theorem. MC.2's cycle-class API is not a Tate conjecture. R35.1 already supplies arithmetic divisors and proper-one-cycle pairing; only its higher-current/DM extension is requested. The briefs' proposed `UnitaryRapoportZinkSpacesAndRSZModels`, `FormalSupportedIntersections` and `JacquetRallisRelativeTraceComparison` are not used as phantom roadmap prerequisites: existing owners and explicit extension contracts replace them.

## Source reading and corrections

Seven exact source copies, URLs, SHA-256 hashes and reading dates are recorded in `sources` and `sourceVersions`. All statements and corrections use original prose and mathematical formulas, without source passages or section-by-section summaries.

- Li–Zhang, arXiv:1908.01701v3 (2 December 2020), preprint pagination: §§1–8, selected §7.4 counts, §§9.1–9.2 and 10–15.
- Zhang, published Annals 193 (2021), pp.863–978: §§2.3, 3–5, 7–10, 14–15 and Appendix A; §§11–13 analytic input statements and the vanishing-criterion argument. Generic analytic proofs remain an explicit relative-comparison request.
- Li–Liu I, 20 October 2021 author copy: moduli Lemma 5.2/Definition 5.3/Lemma 5.4, pp.26–27; the special-cycle and local comparison parts of §§8–9, pp.37–45; base/extension residue conventions in Notation 2.1.
- Li–Liu II, 16 January 2022 author copy, 72 pages: §2, including the full extension classification/cancellation of Lemma 2.24 and the relative/absolute comparison through Corollary 2.66. Its pagination is not the publisher's 71-page pagination.
- He–Li–Shi–Yang, 21 July 2023 author copy, 82 pages: §§1–4, the primitive formula, §§8–10 and the needed norm-shell arguments. Generic ramified density combinatorics remain a supplier extension. This author copy was not collated against Inventiones.
- Li–Rapoport–Zhang, arXiv:2404.02214v2 (May 2026): §§14 and 16, pp.55–61,65–71. Theorem 14.6.2 and Corollary 16.1.5 supply the comparison geometry needed for the original almost-dual formula; U4 includes the model dictionary. The obsolete comparison conjecture is not left as the final source state.
- Mihatsch–Zhang, published JEMS, DOI 10.4171/JEMS/1375: the normalization passages in §§3.6, 6.6, 7.2 and 8.5, especially the corrected Gaussian/Green scale and Whittaker coefficient. This reading does not claim all stronger AFL theorems of that paper.

There are 22 source-issue records, carrying forward known findings and repairs from the reviewed extractions and the cited later sources. They distinguish the specified preprint/author-copy versions from the version of record. In particular, transport only the difference in Li–Zhang's induction; keep original and auxiliary almost-dual intersections distinct; use the corrected rank-two sum; discard Krämer's false negative-normal-norm vanishing; retain the isolated odd-top induction gap; replace the discriminant sign by χ(−1)^n1; use the corrected 4π AFL Green normalization and the single holomorphic correction. No finding is claimed as a new discovery.

## What remains and where to resume

The 13 explicit gaps name: RZ/RSZ models and canonical lifts; nonaffine supported filtration/resolution property; external quasi-canonical rank-two lengths; exact type-²A/type-²D Frobenius calculations; ramified density extension; Krämer type-zero infinitesimal criterion; Krämer isolated odd-top induction; arithmetic Chow/Green/modularity leaves; Siegel–Weil/archimedean normalization; Jacquet–Rallis relative comparison; maximal-order/base AFL sources; the reverse Cayley boundary q=rank; and the general-field/nonstrong AFL boundary.

The 15 exact supplier requests are PEL M4/M6; finite-flat R07.1/R07.2/R07.4; MC.2; MP.0/MP.2/MP.3; GN.3; SF.5; R35.1; AS.2; ET.0; and FK.2. Each lists its needed-by nodes and complete mathematical contract. Extension proposals are requests for acceptance by the owner, not claims that existing supplier packets already prove them. Auxiliary Lusztig, quasi-canonical, arithmetic-current, Ichino/archimedean and Mihatsch base/maximal-order results not independently read are explicitly represented by these gaps.

For the independent review, start with the exact source versions and the ownership contracts, then check each layer and its transitive `remaining` list. Prioritize the original/auxiliary almost-dual dictionary and q+1 factor, the distinct trace/hermitian duals, the ramified primitive signs and component factors, nonaffine formal filtration uses, LL1's log-q versus LZ's log-q² parameter bridge, and the AFL residue-size/prime bounds. The final strongly regular AFL target retains Q_p, odd p≥n; the elementary reverse Cayley proof only gives q≥n+1, so q=n is an actual missing argument. The semi-Lie maximal-order input uses p>m+1 in dimension m; enlarge the finite bad-prime set and use norm-unit reduction at its extra primes. Generic regular/general-field AFL remains a documented boundary, not an inferred theorem.

After acceptance, the follow-ups are the precise open-layer refinements and shared-owner extensions, followed by assembly/package work. No second job is claimed by this session. There is no successor dependency on scratch files.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/GrossZagierAndArithmeticHeightsPartII.json`: zero errors and zero warnings; 15 planned, zero closed layers.
- `python3 research/blueprint/intake.py check-files` on the five deliverables, including this handoff: zero problems.
- Additional consistency checks cover all 104 reader/closing-comment target names, definition APIs/checks, source allocation completeness, stage/node graph consistency and source-version/issue schemas.
- `lean-check research/blueprint/suggested/GrossZagierAndArithmeticHeightsPartII.lean`: elaborated successfully at the pinned shared build, exit 0. The 267-line file has three real-bodied light definitions, 11 theorem signatures and eight examples. Its only warnings are the 19 expected uses of `sorry`; it has no sorry'd data, placeholder carriers or theory development. Later edits affect only the packet, reader and handoff.
- `git diff --check`: clean. Only the issue's four deliverables and this handoff are submitted.
