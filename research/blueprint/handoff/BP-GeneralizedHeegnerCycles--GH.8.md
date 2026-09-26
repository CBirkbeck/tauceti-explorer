# BP-GeneralizedHeegnerCycles--GH.8

Issue: #740. Worker: ChatGPT. Session/branch: `chatgpt-20260926-bc9f2a`.

## Submission status

This is a **partial checkpoint**, not a closed GH.8 blueprint and not a Lean
formalization. The bot confirmed the issue claim before work. The submission
contains exactly the four allowed deliverables, with no edits to queue state,
canonical roadmap files, existing decomposition records or other workers' files.

There are seven nodes: three theorems, two comparisons and two lemmas. They have
24 acceptance conditions and three planets. The packet introduces no new
object definitions, hence has zero definition-API items and zero definition-unit
tests. Its objects are supplied by the existing owners. There are four verified
baseline references, nine supplier requests, five explicit gaps and one source
issue awaiting independent review. All seven implementation statuses are
`unchecked`.

The seven IDs are the GH.8-prefixed slugs:

- `weight-zero-cycle`
- `modular-quotient-kummer`
- `character-sum-comparison`
- `positive-conductor-stabilization`
- `positive-tail-corestriction`
- `differential-evaluation`
- `ordinary-p-old-family`

No node claims to realize the entire stage. Coverage remains `partial`.

## What the mathematical checkpoint establishes

The comparison is organized around the actual map induced by a modular
parametrization, not an unspecified isomorphism between equal-dimensional
representations. The degree-zero cusp correction and its field of definition are
retained. The character-sum reindexing fixes the inverse-character convention and
avoids integral averaging. The positive-conductor calculation explains the unit
root normalization and gives a norm-compatible tail without guessing its initial
term. The differential calculation retains the modular-parametrization scalar,
including its square in a squared formula.

Castella's numbered Theorem 6.5 has weight greater than two. The inspected
31-page author copy's Remark 6.6 supplies the weight-two **p-old** extension.
Its proof also needs global localization and local regulator injectivity. The
packet neither extends it to p-new forms nor infers equality of global classes
from equality of their logarithms.

The remaining finite Picard--Kummer comparison is not disguised as a proved
input. Its request specifies the support, residue-degree kernel, division line
bundle, cocycle convention, transition maps and continuous-cochain passage.
The seven geometric signatures cannot yet be honestly expressed using only the
four verified baseline declarations. They require the actual curve/Jacobian,
cycle-class, continuous Tate-module Kummer, Iwasawa and Hida-specialization
interfaces named in the requests. No opaque carrier, Prop-valued substitute,
conclusion-bearing typeclass or multiplicative-Kummer alias was introduced.

## Source issue and normalization cautions

`GeneralizedHeegnerCycles/E-GH8-1` records the full symmetric-power/induction
display on printed p. 593 of the published CH paper. It was checked in the page
image, not inferred from OCR. If h is the Hilbert class number, symmetric degree
zero gives dimensions 1 versus h; symmetric degree two gives h(2h+1) versus 3h.
This disproves that displayed identification for h>1. It does not prove that all
the paper's later theorems are false. Positive-degree pure-factor submodules and
the separate degree-zero case need an actual replacement construction.

The display persists in the inspected 2022 revision. The one-page erratum was
read in full and does not correct it. The finding is marked `new` in the
protocol's sense of no correction found in the listed searches; it has not been
independently reviewed and nothing has been sent to an author.

The initial unit factor is treated differently: CH Definition 5.2 prints the
full unit-group order, while Castella's equation (6.7) prints half that order.
This verified difference is a **normalization gap**, not a second asserted
source error. A first-conductor computation must include level descent and the
underlying point/trace convention before either formula can be judged.
Likewise, the different Tate-period powers in the family proof and the 2022 CH
regulator are not automatically misprints.

The source-version register distinguishes the journal-typeset CH PDF, the 2022
revision, the erratum, the inspected Castella author copy and the BDP published
PDF. No binary hashes were invented. The date appearing in rendered arXiv HTML
was not interpreted as a new arXiv version date.

## Inputs inspected

The current WORKERS, BROWSER_AGENTS, PROTOCOL, UPSTREAM_GUIDE and expansion
PROTOCOL were read. The confirmed live issue, its comments, the GH roadmap,
its atlas extract and the existing integrated decomposition were inspected.
The existing decomposition leaves GH.8 unread; the new packet does not overwrite
its earlier reviewed nodes. The reserved-ID file has no GH.8 reservations.

The accepted AUDIT-24 GH entries were read, including the GH.8 overlap with
ModularIwasawaMainConjectures L6. Direct file access to
`data/library-coverage.json` returned empty content, so that result was not
misrepresented as a successful audit read. The accepted audit and direct
pinned-source reads supplied the usable baseline evidence.

Relevant portions of HE.1--HE.8 and the L6 owner description were read. The
latter explicitly places the endpoint formulation comparison downstream; no
back-edge from an early GH.8 class comparison to that endpoint was added. The
cycle/duality owner description was also inspected. The modular-forms standing
conventions and the elliptic-curves introduction/foundation discussion supplied
upstream style and interface guidance; this does not claim a line-by-line read
of every part of those long documents.

A repository link-map search found 28 matches; its returned list was too large
for a complete link-map audit. Such an audit is not claimed. The exact graph
boundary used here rests on the inspected stage descriptions and accepted audit.

Primary-source read ranges are listed individually in the packet. In particular,
reading Castella Section 6.2 is not a claim to have decomposed every proof in
Loeffler--Zerbes, Howard, Nekovar, or the earlier regulator sections it cites.
Those exact proof inputs remain requests.

## Baseline and checks

Pinned commits:

- Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.

`LinearMap` was read in
`Mathlib/Algebra/Module/LinearMap/Defs.lean` at the pinned commit. `Module.Dual`,
`LinearMap.dualMap_apply` and `LinearMap.dualMap_comp_dualMap` were read with their
statements/proofs in `Mathlib/LinearAlgebra/Dual/Defs.lean` at that commit. They
supply linear algebra only. No current-default-branch search result was promoted
to a verified pinned arithmetic declaration.

Five groups of exact local Python regression checks passed:

1. Linear stabilization with rational matrices.
2. The normalized corestriction recurrence in an exact rational model for
   n=2,...,8, with no claim about the first field degree.
3. The inverse-character eigenvalue for a cyclic group of order three, computed
   in Q[z]/(z^2+z+1).
4. The squared differential factor with c=3, distinguishing 1/9 from 1/3.
5. The symmetric-power/induction dimension obstruction for h=2,...,10.

These calculations check algebra, not the existence or normalization of geometric
classes. Their scratch script was run locally and is not added outside the
issue's four-path allowlist.

The suggested file has five examples over actual Mathlib linear maps and duals.
It is **not compiled**: neither `lean` nor `lake` is installed in this environment.
No axiom audit or geometric Lean test is claimed.

The official blueprint checker and its source-issue validator were read. The
full repository atlas/declaration index was not mounted locally, so an official
local checker run is **not claimed**. Repository CI must validate the submitted
packet against its full context; actual results, if available, are to be linked
on the PR rather than predicted here.

## Continuation

First resolve the finite degree-one comparison and the source coefficient
carrier, then compute the initial split-conductor term from the actual ring-class
and level maps. Compare that answer separately with CH, Castella and HE.8.
Construct a uniform lattice comparison and the regulator-version map before
claiming integral equality of the whole systems. Decompose the two injectivity
inputs in the family proof. Finally add the source-qualified maps consumed by
AutomorphicCongruences L2 and RankZeroOneBSD BSD.6a, retaining the independently
owned determinant/local-condition formulation comparisons in L6.

The precise remaining work is duplicated in machine-readable `coverage`, `gaps`
and `requests`. This PR must use `Refs #740`, not a closing keyword. No manual
merge, issue closure, label change or queue edit is part of this submission.
