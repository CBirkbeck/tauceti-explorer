# DESIGN-ClassicalAdicEtaleCohomologyPartII — completed planning pass

Issue: #3349. Agent: Codex. Session: `codex-VmFg1A`. Date: 2026-10-19.
The bot confirmed the claim in issue comment 6261300504. This submission completes
one design pass; it is ready for independent review. It does not assert proof
closure or formalization.

## Deliverables and coverage

The roadmap, packet, full reader and suggested Lean file all use the identifier
`ClassicalAdicEtaleCohomologyPartII`. The eight layers PD.0–PD.7 are **planned**.
The packet has 64 targets: 9 definitions, 17 constructions, 34 theorems,
3 comparisons and 1 application. The definitions and constructions carry
78 API entries and 78 discriminating unit tests, three of each per object.
There are 37 planets, at most six per layer, and three checked pinned-library
declarations. All implementation statuses remain unchecked.

The packet's `sourceCoverage` accounts for every routed item: 96 from
PAPER-ZAVYALOV-25, three from PAPER-SCHOLZE-WEINSTEIN-10, and one from
PAPER-HEUER-01. Grouping follows mathematical targets; subsidiary steps remain
in proof sketches, APIs and tests. The reader contains the complete statements,
hypotheses, proof routes, source locators, checks and supplier contracts.

PD.0–PD.5 construct almost nearby cycles, formal canonical sheaves, Faltings
traces, polystable local duality, descent and global Poincaré duality. PD.6
proves proper smooth relative finiteness independently of that duality proof.
PD.7 proves affinoid constructible comparison, proper constructible pushforward,
field-extension invariance and all-torsion proper base change, ending with
Heuer's constant cohomology **sheaf**. Relative finiteness precedes arbitrary
proper base change, avoiding circularity.

## Ownership and prerequisite boundaries

The parent supplies its existing analytic trace (all coefficients invertible
in the characteristic-zero field), proper torsion projection formula and
cohomological bound, weak geometric base change and proper algebraic/analytic
comparison. These are imports, not new targets here. The general abstract
almost and derived theories are also imported. In particular:

- The existing coherent-duality node has a Noetherian scope. Valuation-base
  coherent duality is requested as a foundations continuation, not attributed
  to that node.
- P8's early primitive comparison is smooth proper. Singular proper comparison
  and general nearby-cycle coherence require an extension.
- H5's proper comparison does not supply BH Proposition 3.7's nonproper
  direct-image comparison. That new target is owned by PD.7.
- The finite formal quotients used by Zavyalov are not PerfectoidQuotients Q0's
  perfect-prism algebra contract.
- DiamondEtaleCohomology C1 is used only for its all-p quasi-pro-étale branch;
  the prime-to-p C3 branch cannot prove the relative p-torsion theorem.

The checked current upstream roadmaps include the nine directions newer than
the atlas snapshot. Their suggested files and the current Tau Ceti library
were searched before assigning ownership. The exact pinned Mathlib statements
were read. No replacement for an existing library definition is introduced.
The supplied current upstream checkout lacks directories with the exact names
AdicSpacesPartII and SchemeAndStackFoundations; the atlas's supplier plans and
upstream ownership records were therefore used for those contracts, without
claiming to have read nonexistent upstream files.

The continuation follows the AInfCohomology/PadicHodgeTheory bundle and the
required DiamondEtaleCohomology input. It adds no upward prerequisite to the
parent. The three `restructure` proposals identify extensions of foundations,
adic geometry and p-adic Hodge theory. They do not edit those roadmaps or
allocate already-used Adic Spaces Part III/IV identifiers.

## Work needed for closure

There are 25 explicit stage requests. Each gives the exact needed contract and
its consumers; the full list is in the packet and reader. Five gaps record
inputs whose proofs were not fully decomposed:

1. **G1: valuation-base coherent duality.** Supply coherent exceptional
   pullback over universally coherent valuation-ring quotients, including
   compactification, finite-presentation amplitude, flat bottom canonical
   sheaves and reflexivity. Start from Z §§2.1–2.5 and AC §5.5, then check
   reduction and completion in PD.1.
2. **G2: reduced models and altered uniformization.** Decompose refined Elkik,
   Reduced Fibre, reduced-model cofinality, finite formal quotients and the
   complete local altered-uniformization zigzag. Start from Z Theorems 2.7.1,
   4.4.1 and U Theorems 1.3–1.4, then SW Lemma 10.5.9's relative power-bounded
   base change. Only U's introductory theorem statements were read here.
3. **G3: singular comparison and almost nearby-cycle coherence.** Decompose
   the nonsmooth local calculations underlying PS Theorem 3.17, AC
   Theorems 6.13.5–6.13.6 and BH Lemma 3.25's completed integral field extension.
   Smooth proper primitive comparison is insufficient.
4. **G4: affinoid/nonproper comparison.** BH Proposition 3.7's proof was read;
   its Hansen (2020) Theorems 1.6, 1.8 and 1.10(ii) inputs were not. Read and
   decompose finite branched-cover extension, full faithfulness and finite-type
   nonproper direct-image comparison before closing PD.7.
5. **G5: relative and generic-smoothness inputs.** Complete the valuation-base
   properness criterion in SW 10.5.8, the elementary-divisor continuity argument
   in SW 10.5.3, and BH's weakly Shilov generic-flatness/smooth-fibre chain for
   Theorems 2.27 and 2.29. The dense open belongs to the target of the proper map.

These are durable proof-closure tasks, not hidden hypotheses or implementation
claims. An independent reviewer should check the requests against the current
supplier scopes and the proposed continuations before accepting closure work.
All eight coverage entries retain their applicable gaps and inherited contracts.

## Sources and corrections

Sources are stated in original prose; no passages or restricted source files
are included. The packet's `sourceVersions` records editions, hashes, URLs and
the sections actually read. Z arXiv:2111.01830v3 §§1–5 and Appendices A–D,
SW §10.5, BH §§3.1–3.3 and selected supporting results, and Heuer's published
§2.6 were read. AC was read selectively at the cited results. SW and the
Scholze survey were read from the cleared library in place.

Twenty `sourceIssues` distinguish inherited findings from new checks and name
the versions compared. In particular, the plan corrects strong grading of
nodal character lines (opposite weights multiply by a nonunit parameter), the
missing cohomological shift in the derived finite/integral/rational duality
targets, the boundedness order for almost derived Hom, and SW's replacement of
an almost finitely presented image by factorization through such a module.
The nodal and projective-line checks expose these failures. Selected affected
pages of the author's current duality PDF and AC v5 were compared; unread
published editions are not assigned these findings. The published Annals and
EMS texts and Hansen's cited proofs were not read.

## Validation and review entry point

- `python3 scripts/check_blueprint.py research/blueprint/packets/ClassicalAdicEtaleCohomologyPartII.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/ClassicalAdicEtaleCohomologyPartII.lean`:
  elaborated at the pinned build, with exactly two expected `sorry` warnings
  and no other warnings or errors. The 54-line file states one finite p-group
  representation milestone and three algebraic examples on existing carriers.
  This checks those signatures, not the missing geometric theory.
- The submission file check, the sorry-bodied-data check, JSON parsing,
  complete routed-item coverage, per-object API/test counts, planet bounds,
  reader/packet agreement and whitespace checks passed.

Resume with independent review of the full reader and packet, especially
PD.3's character multiplication and PD.7's nonproper comparison ownership.
Then resolve the five proof gaps and supplier contracts in their stated
owners before any layer is labelled closed. Scratch files are disposable;
everything needed to continue is in these five deliverables. No second job
was claimed.
