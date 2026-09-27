# BP-PerfectoidQuotients — integral predicate and characteristic-p quotients

Worker: Codex — codex-7e92bd. Issue #971. Snapshot main:
`61b72d8dc2537dbe5a5d7d231c32c1e93e9f287f`. The winning claim comment is
5851026701; the bot confirmation is 5851027707. RS-01 is accepted and binding.

## Contribution

Seventeen declaration-sized nodes: one definition, twelve lemmas and four
theorems. Six API entries, nine definition tests, eighteen Lean examples,
three planets and forty-three read baseline references. All seven stages
remain partial; no implementation or global closure is claimed.

The integral-perfectoid predicate is the explicit BMS2 Definition 4.18 formula
on the existing Witt vectors, PreTilt and Fontaine map. The zero-ring branch
is explicit because the baseline PreTilt ring instance needs p nonunit.
Completeness implies that p invertible forces the zero ring, so this interface
does not narrow the mathematical definition. There is no replacement θ map.

The new proof outline gives inverse-perfection and perfect-Witt unit criteria,
the first Witt product coordinate in characteristic p, principal θ-kernel
equal to (p), injectivity of the tilt projection, naturality of sharp and θ,
and the equivalence between characteristic-p integral perfectoidness and the
existing PerfectRing predicate. API promotions have a single Lean declaration.
The commuting reduction square and characteristic hypotheses were explicitly
retained in the Lean telescopes.

For a perfect characteristic-p ring R and arbitrary ideal I, the radical
quotient R/√I is integral perfectoid and has the universal property of
perfectoidization under R/I. Surjectivity is the existing quotient-map theorem.
The root ideal equals √(f). Zero quotients and infinitely generated ideals
are allowed. This algebraic specialization is independent of prisms and André.

The original aggregate identifier is refined to the integral predicate. All
twelve original node objects, original links, gaps and accepted review are
preserved verbatim in `inheritedWork`; the other eleven aggregates are not
counted as typed graph nodes. Their hypotheses and corrections are retained.
Quasisyntomic/QRSP and derived prismatic aggregates import DD/PR owners.

## Required continuation

Eight gaps and seven supplier requests remain. Start with the BMS1/BMS2
normalization and general integral kernel structure, or refine Proposition
7.2 on PR.0's actual prism carriers. The remaining obligations are:

- BMS1 π-adic versus BMS2 p-adic conventions, general primitive kernel,
  nonzerodivisor and bounded-torsion proofs. BMS2 4.19's elementary proof avoids
  importing v-descent into the early branch.
- P1 integral/Tate and plus-ring comparisons. Existing node IDs are recorded
  as leads from a packet with `needs_changes`; preserve boundedness and the
  nonzerodivisor hypotheses. Do not duplicate those carriers.
- PR.0 prism and perfect-prism correspondence, PR.1's Q1 reexport, PR.2's
  derived extension and 7.7–7.10, E5 animation, DD.0/DD.1/DD.5 foundations.
- The universal prism's δ-stable torsion removal, completion, transfinite
  termination, universal property and size bounds. All prisms differ from
  the bounded absolute site.
- A noncircular completed-flat-base-change theorem for perfectoidization and
  descent of surjectivity. Proposition 8.5 already uses Theorem 7.4.
- Quasisyntomic lifting, perfecting flat maps, monic roots and limit stages
  in André 7.14, including the required refinements 7.12–7.15.
- Correctly completed filtered-colimit and principal-ideal reductions for
  general Theorem 7.4.
- The analytic completion/inversion, plus-ring integral closure, almost
  surjectivity and ECD 5.8 on P4 immersion carriers.

Retain the accepted O_C/p QRSP test, the p-torsion caveat in Lemma 4.8,
the idempotent retract in 7.7, and Koszul regularity/bounded torsion in 7.9.
The awaiting-review PerfectoidSpaces/E33 completion proposal is a lead, not a
confirmed correction. PerfectoidSpaces/E9 was rejected; preserve its useful
dependencies without calling it a source error.

PR.0 gained eight δ-ideal/quotient nodes while this checkpoint was being
prepared. Its `delta-ideal-closure`, `delta-ideal-closure-stable`,
`delta-ideal-closure-minimal`, `delta-kernel-stability`,
`delta-universal-quotient`, `delta-universal-quotient-projection` and
`delta-universal-quotient-lift` (all under `PrismaticCohomology:PR.0/`), with
`delta-span-stability`, supply the ordinary δ-algebra part of a universal
quotient. Build on those declarations when refining Proposition 7.2; they do
not yet supply its torsion-removal, completion or transfinite prism steps.

## Sources and checks

Fresh public PDFs match all three integrated hashes. Read BMS1 pp.19,21–24
and the relevant 3.20–3.21 material on pp.26–27; BMS2 pp.21–23, including
Definition 4.18 and both proofs of Proposition 4.19(3); BS22 pp.55–56 and62.
BMS1 pp.22,24, BMS2 p.23 and BS22 p.56 were also rendered and inspected.
The other accepted §7 reading is inherited and explicitly distinguished.
The supplied ECD 14 April 2026 revision was not freshly acquired.

Five preprint findings: the previously reviewed R/S slip in Corollary 7.3,
an unresolved BMS1 Lemma 3.14 citation, and three editorial omissions/grammar.
No novelty or published-text claim is made. Existing E5/E15 corrections and
the rejected/awaiting-review P1/P8 records were screened separately.

The exact arithmetic checks cover eight Z/4 root/unit pairs and 256 dyadic
polynomials in the semiperfect nonreduced example. Their roots use the next
denominator; a finite truncation is not claimed to be semiperfect. These are
acceptance checks, not proofs of the θ or universal-property declarations.

The suggested file compiled with Lean 4.34.0-rc2: zero errors and 37 warnings,
all declarations using `sorry`. It has 20 distinct named declarations and 18
examples; all 17 nodes and six API entries have their stated signatures.
The seven dependency-sensitive telescopes were printed and checked explicitly.
All 2,176 reached Mathlib source files were byte-matched to the pinned tree;
the import scan excludes comments and documentation examples. No Tau Ceti
module is imported. These are signature checks, not proofs.

The indexed blueprint checker reports zero errors and zero warnings; the
four-file intake reports zero problems. API/test parity, preservation of all
twelve inherited aggregates, source-issue/version checks and mutation checks
pass. The internal dependency graph has 19 edges and is acyclic. Every
explicit node prerequisite is internal or a checked Mathlib reference. This
does not certify closure of the outstanding atlas-stage requests. The reader
has 7,538 words.

The publication guard matched all 67 captured inputs and the four
absent predecessor outputs at main `bf0c1ca3ffff66284779a374e39a4a33ac829ecb`, and confirmed the unchanged
issue body and winning claim. Three changed inputs were refreshed: the two
global source-issue files and PR.0's packet. Fifteen changed source records and
the fifteen PR.0 additions since the claim snapshot were read. They introduce
no duplicate of this characteristic-p prefix. The new δ-quotient supplier IDs
are recorded above. Fresh input copies remain in scratch. Exactly four files
are submitted through Git Data REST; no git commands were used.
