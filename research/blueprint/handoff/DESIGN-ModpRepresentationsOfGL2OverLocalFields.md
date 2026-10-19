# DESIGN-ModpRepresentationsOfGL2OverLocalFields — completed target pass

Worker: Codex — `codex-fnsHP8`. Issue: [#3431](https://github.com/CBirkbeck/tauceti-explorer/issues/3431).
Claim confirmed by the bot on 2026-10-19. Branch: `codex-fnsHP8-modp-gl2`.

## Deliverables and status

The roadmap definition, complete packet, definitive reader document and compact suggested Lean file
are all present under `research/blueprint/{roadmaps,packets,readmes,suggested}/ModpRepresentationsOfGL2OverLocalFields`.
This is a completed planning pass, not an implementation or a claim of mathematical closure.
The packet has 58 targets: 9 definitions, 14 constructions, 33 theorems, 1 lemma and 1 application;
71 API items; 77 unit-test statements; 38 planets; and 8 pinned baseline declarations.
All ten layers are planned; none is closed. Every definition/construction has at least three API
items, three tests and explicit uses. All implementation statuses remain `unchecked`.

The 52 BHHMS and 18 CDN extraction items are accounted for by the packet's `routeCoverage` and the
reader's ownership table. Statements and proof work are in our own words with edition-specific
locators; the repository contains no source passages or source PDFs. No restricted book was used.
The compact Lean shape follows WORKERS.md's binding 2026-10-12 rule, rather than the older rule
asking for unavailable carriers and an individual Lean declaration for every blueprint item.

## Build and ownership

The ten layers proceed through augmented Iwasawa finite presentation, Q_p finite-length criteria,
admissible finite presentation and ordinary parts, tame weights, nonuniform Iwahori filtrations,
first-order extension modules, Diamond enlargements, multiplicity and the local GK upper bound,
integral projective-cover lattices, and relative projectivity. Target order within a layer follows
its dependencies. Minor auxiliary calculations stay in proof work.

Generic smooth categories/induction and compact envelopes stay with SmoothRepresentationsOfLocalGroups;
completed group algebras stay with ProfiniteProPGroups; finite-algebra envelopes and integral
idempotent lifting stay with QuiverRepresentations. The uniform Iwasawa and filtered-grade inputs
stay with NoncommutativeAndEquivariantIwasawa. Artin and tame-inertia normalisations import
ClassFieldTheory and LocalFieldsRamification. The crossing equations use the existing
DeformationAndDerivedPatchingAlgebra regular-sequence direction. R07.5 retains the Serre-weight
compact-induction input.

In particular, R30.2/R30.3/R30.5/R30.6 retain Q_p classification, Montreal functors, Gabriel blocks,
compact block generators and their Ext inputs. This roadmap does not plan a second block category.
CC.3 retains Pontryagin/Schikhof conventions, biduality and the automorphic coefficient-duality
application. The exact supplier contracts and four proposed Part II extensions are in the packet;
there are ten requests in all, and no higher-tier ownership move.

## Baseline and current-main audit

Pinned Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`.
Pinned Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`.
Actual statements at these pins were read for Representation, Module.Finite, IsFiniteLength,
MvPolynomial, Ideal.span, Ideal.Quotient.mk, ringKrullDim, and
TauCeti.exists_isProjectiveCover_of_finiteDimensional. The last is a field-valued finite-algebra
input; it does not supply integral projective lifts or pseudocompact compact-group covers.

The reviewed library-coverage catalogue has no entry for this new roadmap; nearby ProfiniteProPGroups
and PadicMeasures entries were checked. The current read-only Tau Ceti and upstream roadmap main
were checked in addition to the older atlas snapshot, including the later roadmaps listed in
WORKERS.md. Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` already has
completedGroupAlgebra and IsCompactModule.completedGroupAlgebraModule; these are absent at the
required pins and are therefore cited through their existing roadmap, not counted as pinned baseline.
Scoped searches did not locate ordinary-parts or GK-dimension APIs at either library version.
The current upstream smooth-dual statements were read with their coefficient hypotheses: the
invertible-pro-order duality theorems are not applied in characteristic p.

## Remaining mathematical work and source findings

One explicit proof gap remains: CDN's proof of the smooth-dual finite-length criterion uses an
Ext-finiteness input from Dotto–Emerton–Gee, whose read primary text assumes p≥5. The p=2,3
input is not established here. The full CDN theorem remains a target with that gap; R30.6 is asked
to supply the exact missing Ext statement. It is isolated from the GK and integral lattice targets.

The formerly missing finite-obstruction chain for category C is now planned from Hu's original
Theorem 4.3, Lemma 4.5, Proposition 3.30 and Corollary 3.31, together with the read Vignéras
finiteness results. The forward smooth-dual implication uses Kohlhaase Proposition 3.9 and the
elementary noetherian argument of Remark 3.10; it does not assume semisimplicity or characteristic-zero
smooth duality.

Four source findings await independent review:

- E1: BHHMS v7, equation (44), p. 55 and Lemma 6.1.1(i), p. 56. For p=5,f=1, the two PBW
  vectors e² and f² have the same nontrivial torus character. The auxiliary multiplicity statement
  needs p>5. The later deep-weight hypotheses already exclude this case. The same claim was read
  in the 115-page author copy; the publisher PDF was inaccessible, so no claim is made about its text.
- E2: BHHMS v7, proof of Corollary 7.3.4, p. 84: two compact-cover subscripts should be K/Z₁,
  as in the statement, rather than K₁/Z₁.
- E3: CDN published proof of Lemma 1.25, pp. 18–19: the cited DEG input has the prime-range
  gap just described. This is a proof-reference scope finding, not a counterexample to the theorem.
- E4: Hu v3, proof of Proposition 4.4, p. 36: one positive/positive intersection should be
  positive/negative. The displayed inclusion and Lemma 4.5 already give the intended expression;
  the page was checked visually. This harmless finding is scoped to the preprint.

The packet records versions, hashes, correction searches and mathematical reasons. There are no
self-assigned reviewer verdicts. The extraction's invariant superscripts for the R₂′ and R
statements have been corrected to coinvariants. The introduction's L_j and §7's R are the same
construction, with L_{f−1}=R. The local dimension theorem gives ≤f; equality needs an additional
lower-bound input and is not claimed here.

Independent review should check E1/E3 first, then the Artin and cyclic-parity conventions, the
nonuniform Lazard/PBW/grade contract, the Hu–Vignéras finite-obstruction argument, and the
projective-cover and coinvariant types. Discharge supplier contracts before declaring layers closed.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/ModpRepresentationsOfGL2OverLocalFields.json`:
  zero errors and zero warnings, packet status complete, ten planned layers.
- `python3 research/blueprint/intake.py check-files` on the five deliverable/handoff paths:
  passed, including the allowed-path and local-path checks.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/ModpRepresentationsOfGL2OverLocalFields.lean`:
  passed; the 176-line suggested file has no data definition with a placeholder body.
- `lean-check research/blueprint/suggested/ModpRepresentationsOfGL2OverLocalFields.lean`:
  elaborated at the required pins on 2026-10-19, exit 0, with only declaration-uses-sorry warnings.
  No language server or library build was run.
- Additional consistency checks passed for all target statements and API/test names in the reader,
  the own-node DAG, the complete 70-item route map, source-issue/version schema, layer planet limits,
  integer-translation examples, root shifts, regular-region boundaries and the p=5 PBW collision.
  The arithmetic check corrected the negative-coordinate example to (0,−11).

The next action after intake is the programme's independent review of this completed pass. There is
no checkpoint continuation and no second issue claimed by this run. Nothing needed for that review
is left solely in worker scratch.
