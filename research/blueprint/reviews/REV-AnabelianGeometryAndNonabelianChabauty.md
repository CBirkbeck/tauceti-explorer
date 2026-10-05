# Independent review checkpoint: Anabelian geometry and nonabelian Chabauty

Job `REV-AnabelianGeometryAndNonabelianChabauty`, issue #526. Reviewer: Codex,
session `codex-rkkbhf`, 2026-10-05. Input explorer commit:
`3f2daf22c9620e59cdac2fc35a6203a4e0c45181`.

This is an unfinished independent review, submitted as a checkpoint. No global
`review` object or acceptance verdict has been added. The packet's `complete`
status describes its planning pass, not the completion of this review. Its
partial and not-read stages remain explicit.

The packet contains 362 nodes: 3 definitions, 60 constructions, 265 lemmas,
27 theorems and 7 comparisons; 302 API entries, 245 test specifications,
11 planets, 155 baseline declarations, 17 requests and 9 gaps. This checkpoint
adds no nodes, removes no baseline citations, and changes no ownership or
coverage status. Every implementation status remains `unchecked`.

## Confirmed corrections

1. `MulAction.toPerm` in `Mathlib/Algebra/Group/Action/Basic.lean` gives the
   permutation associated to an acting element. The homomorphism is
   `MulAction.toPermHom`. Corrected the former baseline entry's description;
   the latter already has a separate baseline entry.
2. `Subgroup.continuousSMul` in `Mathlib/Topology/Algebra/MulAction.lean`
   restricts the **acting group** to a subgroup. Corrected the description to
   distinguish this from continuity of an action on a coefficient subgroup.
   Its uses for source-subgroup restriction are valid.
3. In `NC.3/continuous-cocycles`, specified `Z1.mem_iff` as existence of a
   cocycle with prescribed underlying function, and supplied its typed
   prototype. Named the existing identity instance `Z1.instOne` and aligned
   the packet API with that name.
4. Supplied `H1.equivOfTrivial` with an explicit conjugation action on
   continuous monoid homomorphisms in its target. The formula is ordinary
   conjugation by `MulAut.conj`; the coefficient action is explicitly assumed
   trivial. No arbitrary relation or proposition carrier replaces that action.
5. Supplied the missing `Z1.equivContCohomology` and
   `H0.equivContCohomology` signatures. The first identifies continuous
   multiplicative cocycles with the existing additive cocycles; the second
   is a multiplicative equivalence after changing additive invariants to
   multiplicative notation. These signatures remain uncompiled because the
   Tau Ceti artifact is unavailable.
6. Named the existing twisted-action continuity instance
   `Twist.continuousSMul` and supplied `Twist.self`, expressing agreement of
   the trivial twist with the original action.
7. Replaced comment-only finite examples by typed `example`s for
   `tests.trivial_action_hom`, `tests.h1_S3` and
   `tests.not_coboundary_quotient`. For discrete C₂ acting trivially on S₃,
   these require four cocycles, two gauge classes, and show that the tempting
   relation obtained by multiplying by a coboundary reduces to equality.
   The trivial-action hypothesis is retained with `include htriv`.
8. Corrected the Kim Albanese locator on `NC.3/central-extension`: the quoted
   Selmer-fibre passage on printed p.26 belongs to §4, **Comments II**, rather
   than §3. The excerpt and mathematical statement are unchanged.
9. Removed a repeated `coefficient-h1-map` prerequisite from
   `NC.3/twisted-kernel-h1-mapped-converse`.

Updated the omission ledger only for the supplied signatures/tests. Historical
encoded proof-recovery payloads are unchanged; a new opening note identifies
their input revision and explains that their canonical-prefix hashes do not
describe the edited file. Their execution claims are not independent review
evidence.

## Evidence and scope of this checkpoint

The baseline pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
Source declarations were obtained from those git objects, not inferred from
names or from the current Tau Ceti checkout. Declaration heads were screened
for all 155 entries, with the qualified action-continuity declaration inspected
separately. This is **not** a final confirmation of every consumer's hypotheses.
The explicit additive LowDegree conventions were also read: d⁰(m)(g)=g•m−m,
d¹(f)(g,h)=g•f(h)−f(gh)+f(g), Z¹=ker d¹, B¹=range d⁰ and H¹=Z¹/B¹.
The nonabelian gauge formula corresponds to translation by −d⁰(m), which gives
the same additive quotient.

Fresh source reading includes Kim's continuous cocycle/gauge definitions and
Propositions 1–3 with their printed proofs on pp.5–10 of the
[exact arXiv v1 PDF](https://arxiv.org/pdf/math/0409456v1); Achinger's
§§2.1–2.6 and §§3.1–3.4, pp.5–8 of the
[2014 v1 PDF](https://arxiv.org/pdf/1407.0337v1); selected Schmidt–Stix
K(π,1) passages in the
[Annals paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p05-p.pdf);
and the Kim Albanese passages on printed pp.4, 19 and 25–26 of
[arXiv v4](https://arxiv.org/pdf/math/0510441v4).
Poonen's Definition 1.3.14, Proposition 1.3.15 and Remark 5.12.13 were inspected
in the [author-hosted book](https://math.mit.edu/~poonen/papers/Qpoints.pdf).
The FKW constant-coefficient comparison and Lemma 3.2.2 were inspected in the
[v2 paper](https://arxiv.org/pdf/2110.05534v2). Downloaded PDF hashes agree with
the packet's retained hashes. This does not certify every referenced locator,
transitive proof, published-version collation or historical reading receipt.

The mathematical screen covered selected core and continuation families:
ordered cocycles and gauge orbits; nonnormal invariant cosets; normal-subgroup
descent and same-N inflation; coefficient/source maps; inner twisting and
representative changes; native, named and embedded kernels; gauge stabilizers;
and invariant-action orbit classifications. The native kernel-image converse
uses a lift of one gauge element and subspace continuity, so it does not require
a continuous section. The quotient-comparison inverse retains a quotient-map
hypothesis. The final classification returns an invariant orbit, not a unique
kernel class. This is a proof-sketch screen, not a declaration-by-declaration
certification of the packet and every typed signature.

Read the seven stage audit records in `data/library-coverage.json` and the
supplier stage descriptions for IG.0, IG.1, IG.6, SF.2, SF.3, PS.9 and A2.
The reserved `key/etale-k-pi-1` occurs once and distinguishes full finite
coefficients, p-primary coefficients and constant Fₚ coefficients on the full
fundamental group. Its geometric signatures remain explicit omissions awaiting
the real π/sheaf/comparison interfaces. No substitute proposition fields were
introduced. Further supplier and reserved-API checks remain in the handoff.

`sourceIssues` is empty. No new source-error verdict is recorded in this
checkpoint; the source-error screen is unfinished.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/AnabelianGeometryAndNonabelianChabauty.json`
reports **0 errors and 0 warnings**.

The full suggested file was attempted with `lean-check` and failed at import:
the existing build lacks the object for
`TauCeti.RepresentationTheory.Homological.ContCohomology.LowDegree`.
No library build, cache download or Lake update was attempted. Available memory
was approximately 102 GiB before the checks.

A temporary projection removing only `import TauCeti.*` lines and the whole
`section Abelian` through `end Abelian` elaborated through `lean-check` against
the exact Mathlib pin. Exit code 0; **658 warnings, all declaration uses
`sorry`**; no other warnings or errors. This establishes that those prototype
forms elaborate, not that their statements or proofs are correct. It does not
check the removed additive comparisons or the full Tau Ceti file.

## Work still needed

The detailed continuation worklist is in
`research/blueprint/handoff/REV-AnabelianGeometryAndNonabelianChabauty.md`.
It requires the full baseline-consumer audit, all source locators, all
definition/construction APIs and discriminating tests, the remaining typed
prototype matching, supplier ownership and closure, and one justified review
entry per node before a global verdict.

Question for the orchestrator after the supplier audit: does IG.0's remit include
the geometric product theorem and the P¹ fundamental-group computation, or
should those precise contracts extend its plan? Its stage description directly
supplies the finite-étale fibre-functor dictionary, but does not itself state
these further results. No owner change is made by this checkpoint.
