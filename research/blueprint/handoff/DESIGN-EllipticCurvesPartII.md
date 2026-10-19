# DESIGN-EllipticCurvesPartII — codex-36tJxY

Complete import-only design for issue #3398, by Codex, session codex-36tJxY.
This is a completed ownership reconciliation, not a partial checkpoint.

## Result and ownership

The issue's sole route already has a complete, independently accepted plan:
EllipticLegendreCharacterInterfaces, designed in #1692 / PR #6151 and
accepted in #1721 / PR #6155 on 2026-10-05. The route in
PAPER-BENNETT-SIKSEK-20 explicitly names that owner. Creating another plan
would duplicate it. Following PROTOCOL.md §15 and the accepted
EllipticCurveModularityPartII import-index precedent, the five deliverables
provide an import manifest and a merger proposal.

Seven source targets are matched: extraction items 28,29,30,31,34,69,77.
The packet imports all 37 existing nodes: 2 definitions, 6 constructions,
14 theorems, 14 lemmas and 1 comparison, with references to their 33 API
items, 27 definition tests and 19 planets. It owns **zero new nodes, API
items, definition tests or planets**. The anonymous Lean examples are
acceptance checks on native objects, not new roadmap targets.

All six alias stages LG.0–LG.5 are `source_decomposed`, with no remaining
import-accounting work. None is mathematically closed. Every corresponding
canonical layer remains `planned`, with implementation unchecked. The
blueprint checker reports these import stages in its aggregate planned count;
the explicit coverage records and reader explain the distinction.

The packet's `restructure` proposes retaining the canonical roadmap and all
its identifiers, mapping alias LG.n to owner LG.n for n=0,…,5, and retiring
the four alias publication files when the maintainer applies the merger.
No queue, canonical packet, audit, application or upstream file was edited.

## Remaining mathematical work

The canonical packet retains four gaps and three requests, referenced in
`inheritedObligations`. Empty alias `gaps` and `requests` mean no newly owned
obligations, not gap-free mathematics.

- LG.0: refine native rational full-two-torsion normalization and point transport.
- LG.1: the parent Layer 4 minimal-local-model and Q_p-unit comparisons,
  native CA.1 character and actual elliptic conductor interfaces, and the
  R01.3 support comparison remain required.
- LG.2: elaborate the canonical CRT/quotient signatures and prove native μ readings.
- LG.3: implement halving and the finite-abelian two-primary cardinality proof.
- LG.4: prove the corrected native doubling and descent identities.
- LG.5: prove the symmetric character-sum count and specialize the BSD.0 comparison.

The three canonical supplier requests are to EllipticCurves Layer 4,
ArithmeticGaloisRepresentations:R01.3 and RankZeroOneBSD:BSD.0. The current
packets now provide finer candidate interfaces:
`ArithmeticGaloisRepresentations:R01.3/elliptic-exponent-and-parts`
(using its elliptic-local-independence prerequisite) and
`RankZeroOneBSD:BSD.0/finite-field-twist-trace`. Their full statements and
proof routes were read. `supplierRefinements` records their fit. They are
planned targets, not implemented theorems; the original owner's requests
were not edited or marked discharged.

The original unavailable-build gap concerns the owner's full suggested file.
This job's small alias file compiles in the shared pinned build. That does
not validate the owner's normalization, CRT, quotient or character signatures
and does not close its historical gap. No source or carrier is invented to
make an unstatable target appear in Lean.

## Sources and baseline

Read the publisher version of Bennett–Siksek (2020), pp.365–372: §5 proof
of Lemma 5.2, §6 equation (17), Lemmas 6.2,6.3,6.5 and the local computation
in Lemma 6.6. The source URL, access date and SHA-256 are in both packet and
reader. All source descriptions are our own words. No source needed for
the seven-item import check was missing. No book was needed or copied.

The existing coordinate finding EllipticLegendreCharacterInterfaces/E1,
prior PAPER-BENNETT-SIKSEK-20/E14, is referenced, not republished as a new
erratum. The corrected point has y=8itv(t+iv). Membership, tangent doubling
and the F₅ counterexample to the printed pair were checked independently.
The small examples test the local identity, not the global hypotheses of
Lemma 6.6. No fresh errata search was performed or claimed.

Read the reviewed library-coverage entries for parent elliptic Layers 2–4,
CA.1, R01.3 and BSD.0. Read the canonical plan's statements, hypotheses,
proof routes, API/tests, prerequisites, reader and accepted review.
Read nearby current EllipticCurves and ModularCurves README/Suggested files,
including the latter's Legendre rigidifier and coarse-j-line boundaries.
Searched the current read-only roadmap and Tau Ceti trees, including the
nine roadmaps absent from the atlas snapshot, for the equation-level targets.
Current roadmap commit: 0d144d044dacebca17b654695b6f1ad58f159b27;
current Tau Ceti commit: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.

Sixteen pinned baseline declarations were read. Mathlib pin:
082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti pin:
f790474821cf4256814db967cb154e7af3d0c369. The three native Tau Ceti files
read for the boundary check were byte-identical to their pinned versions.
This checks the import boundary and does not claim a new audit of all 56
baseline declarations in the owner's accepted packet.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EllipticCurvesPartII.json`:
  zero errors and zero warnings; complete, six covered import stages, zero closed.
- `python3 research/blueprint/intake.py check-files` on exactly the five
  deliverables: passed.
- `lean-check research/blueprint/suggested/EllipticCurvesPartII.lean`:
  exit 0, no errors or warnings, 13 anonymous acceptance examples. Memory
  was checked before compilation; no library build or language server was run.
- Structural checks: exact seven-item route match; 37 unique imports all
  exist in the canonical packet; all stage and API/test/planet inventories
  agree; local document links resolve; inherited obligations are retained;
  no new source issue, private path, source excerpt or admitted data definition.
- Independent scratch arithmetic, all assertions passed:
  four rational parameter tuples and their six root-ordering labels;
  3,036 rational j-valuation cases (odd primes below 40, numerators −12…12,
  denominators 1…12, excluding λ=0,1);
  2,128 explicit eight-element subgroups (all admissible η, p<200,p≡3 mod4);
  2,504 corrected local halving tuples (all nonzero t,v and i²=−1,
  2t²+2v²=1, p<200,p≡5 mod8);
  exact minus-one two-adic counts and absence of order eight at all such primes;
  2,176 symmetric-cubic trace cases (all nonzero u,p<200,p≡3 mod4);
  9,512 twist-trace cases (all d≠0,λ≠0,1 at odd primes below 50).
  Counts use all affine solutions plus O. Doubling uses the direct tangent
  formula for a₁=a₃=0. These finite regressions do not replace proofs.

## Where to resume

Independent review should check this source-to-owner map and merger proposal,
not request a second Legendre design. The maintainer applies the merger;
mathematical development continues only under the canonical owner with its
existing gaps and requests. No second issue was claimed in this run.
