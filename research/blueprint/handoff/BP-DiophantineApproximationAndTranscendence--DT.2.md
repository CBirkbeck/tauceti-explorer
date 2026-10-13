# BP-DiophantineApproximationAndTranscendence--DT.2

Complete planning pass for **Refs #9320**, by Codex session `codex-xsVFCL`,
2026-10-13. Scope is exactly `DiophantineApproximationAndTranscendence:DT.2`.
The parent packet and all atlas/upstream files are untouched. This part is
ready for independent review; DT.2 is **planned**, not closed.

## Deliverables and validation

- [Packet](../packets/DiophantineApproximationAndTranscendence--DT.2.json): 68 new nodes — 5 definitions,
  34 lemmas, 22 theorems, 4 comparisons and
  3 applications; 25 API items; 15 mathematical unit tests;
  19 checked native declarations; five gaps; five requests.
- [Reader](../readmes/DiophantineApproximationAndTranscendence--DT.2.md): every new statement, hypothesis, proof route,
  source locator, Check, API and test, plus parent integration and ownership.
- [Suggested Lean](../suggested/DiophantineApproximationAndTranscendence--DT.2.lean): two light definitions with real
  bodies, API milestones and examples, and native-carrier end statements;
  no admitted data, no heavy constructions and no auxiliary development.
- Packet check: `python3 scripts/check_blueprint.py
  research/blueprint/packets/DiophantineApproximationAndTranscendence--DT.2.json` with the supplied baseline declaration
  index: **0 errors, 0 warnings**. The supplied index is only a checker input;
  it is not a new repository file or mathematical prerequisite.
- `lean-check research/blueprint/suggested/DiophantineApproximationAndTranscendence--DT.2.lean`:
  **passed**, exit 0, with `sorry` as its only warning. Available memory was
  checked before compiling; one Lean process was used, and it finished within
  the 20-minute limit. No language server or Lake build/update/cache command
  was started.
- Mathlib pin `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti pin
  `f790474821cf4256814db967cb154e7af3d0c369`. Active hypotheses of all cited declarations
  were read, not inferred from their names.
- No new planets. Keep the parent's six DT.2 planets; no parent id or planet
  is duplicated. The parent has 100 DT.2 nodes, imported in `inheritedTargets`.
  Its other stages do not count toward this part's node budget.

## What the assembly must attach

Use `coverageMap` to attach the new key inputs to the existing parent targets.
It covers subspace-height APIs and primitive covolume, absolute rescaling and
Davenport, kernel heights and the quantitative auxiliary-polynomial proof,
weight-flag limits and effective quotient intervals, geometric/arithmetic sharp
Roth, rank-exact unit induction and full perturbation cover, the hard norm-form
criterion, and simple and repeated-root recurrence zeros. The smaller
calculations stay in the proof outlines, following the current target-level
shape; do not revive the older one-source-page-per-node requirement.

The 2009 Amoroso–Viada proof is a public replacement for the uncleared Schmidt
1996 chapter. Both numerical budget comparisons to the parent's ESS cover
are explicit. Norm fibres use native finiteness of integral ideals with a
fixed norm and **ordinary units**; an S-unit enlargement would change the
subfield criterion. Galois-stable block algebras use equivalence closure of
the union of conjugate relations. The recurrence class alternative has
dependent evaluated values and the height of a **powered** root ratio.

The suggested finite-rank count is deliberately its finitely generated native
specialization; the reader has the full finite-rank theorem. The general
recurrence count allows independent progression moduli and singleton modulus
zero. Ordinary polynomial-geometric bases are proved in the planned route by
finite differences and native solution-space rank, avoiding a higher-tier
Jordan-form import. The nondegenerate
bound transfers using Schmidt1999's bounded-degree algebraic-point argument;
merging powered torsion classes then proves qualitative SML within this route.
The general specialization uses the finite-obstruction inequality
from Schmidt2000: the specialized progression count bounds the original from
above. No step claims preservation of all infinitely many nonzero values.

## Current owners and proposed downward moves

Current TauCetiRoadmap main checked at `0d144d044dacebca17b654695b6f1ad58f159b27`;
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read current
GlobalNumberFields and Completed/EffectiveBounds in full, their relevant Lean
statements, current places, and pinned/current S-integer units. Current
GlobalNumberFields owns places and completions, including multiplicities;
no new place type is planned. Its fixed-field ray-class counting and
EffectiveBounds counting are not absolute Minkowski.

The five requests in the packet are the exact contracts for a follow-up:

1. GeometryOfNumbersAndQuadraticArithmetic GN.1 Part II: K-linear adelic
   second-minima product and Vaaler's normalized ball-product section bound.
   BV1983 and Vaaler1979 were read in full. The latter uses Kanter's product
   peakedness theorem; the generic owner must provide that input. No use of
   Vaaler's conjectural arbitrary-convex-body extension is permitted.
2. Current GlobalNumberFields Layer 0 Part II: norm-preserving identification
   of an **arbitrary continued absolute value** with its place completion,
   including the real case and construction of a complex action. The owner
   already has place completions; extend the comparison, not those objects.
3. GeometryOfNumbersAndQuadraticArithmetic GN.4: selected prime principal
   powers and finite-index S-valuation image; move the higher-tier KTheory
   U.4 rank contract down. Native S-unit finite generation and kernel already
   exist. DT adds the logarithmic fullness argument.
4. SchemeAndStackFoundations SF.4 Part II: projective degree/Hilbert,
   isolated components, Chow forms, proper projection, geometric Bézout and
   torus stabilizer/translation contracts. Redirect higher-tier Heights R09
   generic geometry here; DT retains arithmetic height inequalities. Include
   bounded-degree closed points from generic rational linear sections for the
   nondegenerate recurrence specialization.
5. SchemeAndStackFoundations SF.2 Part II: generic Koszul/local-cohomology
   contracts for the **corrected** Chardin–Philippon relative regularity.

These are requests and proposed ownership moves, not edits to those plans.
There is no higher-tier prerequisite in this part.

## Exact remaining mathematics

- **Corrected absolute Siegel basis theorem**: Roy–Thunder 1996 was read in full and its symmetric-power metric defect is confirmed by the 1999 erratum preview. Obtain and read pp. 48–51 of that erratum, derive the corrected absolute small-basis/determinant inequality and propagate its constants to ES Corollary 7.2. The weighted-metric definition alone does not establish the upper Minkowski bound.
- **Arbitrary continued-value completion classification**: Read a public complete proof constructing the metric completion from an arbitrary continued absolute value, showing finite-dimensionality over the completed rational field, constructing the real/complex algebra action when appropriate and identifying the preserved norm. Native spectral-norm uniqueness is only conditional on these constructions.
- **Arithmetic Bézout in the Fubini–Study normalization**: Evertse specifies the Chow/Faltings height and quotes arithmetic intersection inputs. Read a full primary proof of the sphere-integral formula, proper arithmetic Bézout and the product-height formula with the exact derivative constants; extend DT.2 here. Do not invoke the higher-tier Arakelov package or identify Chow coefficient height with cycle height.
- **Explicit short-prime interval estimate**: AV2009 quotes Rosser–Schoenfeld estimates to choose a prime in the prescribed interval avoiding finitely many stabilizer factors. Read the primary analytic estimates and verify the small numerical cases and exclusion count used in Theorems 2.1–2.2; the quoted input is not yet decomposed.
- **External inputs to the explicit non-torsion height bound**: Voutier 1996 pp. 81–95 and Schmidt Lemma 11 were read in full. Voutier quotes Robin prime-product estimates and Rosser–Schoenfeld prime upper bounds (Lemma 2), Poitou/Odlyzko log|D_K|>3.108d−8.6d^(1/3) (Lemma 4), the degree-reduction lemma for conjugate collisions (proof p. 91), and Smyth/Boyd low-degree Mahler-measure results (degrees≤21). Read or independently establish these precise contracts, including certified finite-degree numerical checks; the determinant proof alone does not close this branch.

Resolve those inputs and the supplier requests before declaring DT.2 closed.
The bibliography and `sourceVersions` preserve all URLs, digests, editions and
the exact page scopes read, so the next worker needs no scratch artefact.

## Source findings to preserve

Six new records are in `sourceIssues` and explained in the reader:

- EF2013 Proposition 13.6 has an invalid cube normalization. A mass-n simplex
  net repairs the range ε≤1/10 actually used in §14 with its original count;
  the unused full ε<1 formulation is not asserted.
- ESS author-text (11.19) uses a perturbation coefficient smaller than its
  hypothesis supplies. The AV2009 cover repairs the full parent target.
- Roy–Thunder's symmetric-power metric defect is acknowledged in its 1999
  erratum. Only the erratum introduction p.47 was obtained; its proof is an
  explicit gap, even though the original 1996 paper was read in full.
- Published AV2011 Proposition 2.5 says independent where the original
  Schmidt2000 proposition and its argument require dependent values.
- The same published proposition omits the class modulus in its height
  alternative; Schmidt2000 p.630 proves the powered version only.
- Chardin–Philippon's published erratum replaces the single-Koszul-complex
  equivalence by the all-parameter-sequences condition, preserving the
  isolated-component Hilbert estimate used here.

Preserve the parent's previous findings, including E217–E224 and their version
scope. The reader's bibliography is organized by the targets that use the
sources, not by source-section summaries. No source passage, PDF or cleared
book file was copied to the repository. The library index was checked; no
uncleared book was used. Public source files and extraction tools were kept
only in scratch and are removed at submission.
