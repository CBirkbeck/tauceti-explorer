# Handoff: BP-ExcursionOperatorsAndSpectralAction--ES0

Issue #726, Codex session codex-5lvIn3, branch codex-5lvIn3-excursion-es0.
The bot confirmed this session’s claim before work began. This is a completed
target-level planning pass for independent review, not a checkpoint or a
formalization claim. No second issue was claimed.

## Delivered

Continued the existing packet and retained 23 correct node identifiers. Removed
three duplicate nodes: abstract invariant-function realization and excursion
relations go to LP2, and the ordinary smooth-center level-limit theorem goes to
SR.1. The packet, reader and suggested file agree on all node, API and test names.

The packet has 42 nodes: 7 definitions, 3 constructions, 29 theorems and
3 comparisons; 38 API items, 31 mathematical unit-test specifications,
26 planets, 18 pinned baseline declarations, 5 gaps and 20 supplier requests.
Every node remains unchecked. Every planet name meets the six-per-layer limit.

| Stage | Coverage |
| --- | --- |
| ES0 | planned |
| ES0:classical-center | planned |
| ES1 | planned |
| ES1:finite-ramification | planned |
| ES1:spectral-center | planned |
| ES2 | planned |
| ES3 | planned |
| ES4 | planned |

No stage is closed. Each target has a statement, hypotheses, proof outline,
direct prerequisites and acceptance conditions; definitions and constructions
also have uses, API and discriminating tests. The remaining work is recorded
below and in each coverage record.

## Corrections and ownership

- RT-AREA-geomlanglands/5: LP2 keeps VIII.4.1–VIII.4.2, abstract operators,
  invariant-function independence and relations. ES0 specializes the actual
  HS1/HS4 kernels and adds the enhanced lift and condensed continuity.
- RT-AREA-geomlanglands/6: followed the verifier’s **primary** fix. ES2 owns
  X.1.1–X.1.3, including the affine-quotient pushout comparison; ES3 owns
  X.3.1–X.3.4 and X.0.1–X.0.2. LP4 supplies VIII.5.1 generation and module
  comparison. Duplicate LP4 action nodes are identified for restructuring.
- RT-AREA-geomlanglands/7: the center-agreement and ES4 nodes now name the
  conditional center map, lisse duality and shtuka suppliers explicitly.
  Missing atlas links, including the outside-part ES6/ES7 links, are proposed.
- RT-AREA-geomlanglands/9: applied the verifier’s correction: SR.1 owns the
  **abelian** Lambda-linear smooth center, corner limit and separatedness;
  ES0 owns enhanced restriction and the heart comparison. SR.3 supplies only
  the characteristic-zero complex block description and its dictionary.
- RT-AREA-geomlanglands/34 and /35: general Psi_G^b composites stay in ES7.
  The enhanced center remains a construction; its map to ordinary CatCenter
  is not claimed to be an isomorphism.

Corrected the checkpoint’s automatic identity claim for general creation and
annihilation, its torsion-unqualified discretization comparison, the torus
ellipticity test, and the deletion of stabilizers from the finite-center
elliptic component. Central support is reduced V(Ann), separate from singular
support. Exact triangles use a product of endpoint annihilator ideals.
Support equality under scalar extension requires flatness and the actual
endomorphism base-change isomorphism.

## Checks

`python3 scripts/check_blueprint.py research/blueprint/packets/ExcursionOperatorsAndSpectralAction--ES0.json --json`
uses the pinned declaration index and passes with **zero errors and zero warnings**.
The reader/packet/suggested-name agreement check passes. Source excerpts have a
maximum length of 25 characters; they were checked against the inspected text.
`git diff --check` passes. `python3 research/blueprint/intake.py check-files`
on the four deliverables reports zero problems. Changes are limited to this
job’s four deliverables.

`lean-check research/blueprint/suggested/ExcursionOperatorsAndSpectralAction--ES0.lean`
finished successfully at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
with only warnings that declarations use `sorry`. The file imports only
Mathlib, so this does not assert compilation of any Tau Ceti implementation.
The file contains 34 ordinary declarations and an explicit
register of every full mathematical node, API and test. Ordinary observable
signatures and examples do not encode the full enhanced action anima. The
full signatures of enhancedCenter, perfApprox, finiteWildCategory and
ellipticParameter, and their supplier-dependent higher APIs/tests, are
explicitly unavailable pending the requested types. They are not replaced
with vacuous propositions or arbitrary proposition fields. The reader and
packet record this limitation as the enhanced-signature gap.

## Sources and pinned libraries

Read the author-hosted Fargues–Scholze 356-page PDF on 7 October 2026:
[Geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf),
SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
Inspected I.9.5/I.10.2, VI.12 (including proof), VIII.3.7/VIII.4,
IX.1–IX.5 (including cutoff proof and multi-leg IX.3.2), and X.0–X.3
(including all action/colimit/free-group/discrete-group proofs). VIII.5.1–2
were read as statements; their proof interiors are imported from LP3/LP4.
IX.6’s opening and IX.7 were inspected for the later returns and scope.

The full source-statement register includes ell-independence, categorical
LLC, Whittaker endomorphisms, the functoriality kernel, Aut_phi and its
conditional nonvanishing, the finite-center elliptic action shift/Hecke
formula, the elliptic packet conjecture and integral nilpotent-support
conjecture. They are not new acceptance targets. No new source error was
found; errors corrected here were in the checkpoint’s planning claims.

Read the actual Mathlib center and prime-spectrum statements at
`082e2d37e8b0463410cdb532e111cd43d5a66174`, and searched the pinned Tau Ceti
source/index at `f790474821cf4256814db967cb154e7af3d0c369`. Consumed the
reviewed AUDIT-20 entries and relevant link/verifier records. Upstream
AdicSpaces and CharacterTheory supplied the document/API/test examples.

## Exact follow-up

Independent review should assess mathematical target coverage and the qualified
prototype limitation, not treat elaboration as proof closure. The five gaps are:

1. E5/HS/LP enhanced stable, condensed action and stacky Perf types needed to
   state the complete higher signatures.
2. LP3’s exact DVR highest-weight filtration and finite-set tensor comparison.
3. Qualified LP/VS/HS derived coefficient-extension/reduction interfaces.
4. Expansion of the elliptic component deformation argument, including the
   H^0/H^1/H^2 calculation and residual stabilizer stack.
5. VS5’s lisse BZ-duality return and HS3’s full multi-leg/tower comparison.

The twenty precise supplier contracts are in the packet, including SR.1’s
ordinary ring-valued center, E5’s animation/free-group resolution, LP4’s
module comparisons, and BG3’s Kottwitz grading for the recorded statements.
A supplier or refinement pass should resolve those contracts and replace each
explicitly unavailable higher signature with the actual supplied types.
No scratch file is needed to resume: mathematical statements, source identity,
owner boundaries, requests and remaining work are all in these deliverables.
