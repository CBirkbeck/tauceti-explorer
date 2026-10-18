# MC.2 planning handoff

Job BP-StableReductionPartII--MC.2, issue #8902. Worker: Codex, session
codex-SmO258, 18 October 2026. This is a finished target-level planning pass,
not a checkpoint or an implementation. The packet has status `complete`;
`StableReductionPartII:MC.2` has coverage `planned`, with its remaining
supplier and source obligations stated explicitly. Every implementation status
is `unchecked`.

## Deliverables and extent

The four files of this job are the MC.2 packet, reader, suggested Lean file and
this handoff. The parent StableReductionPartII packet is unchanged. Its existing
polynomial calculations, pointed-family objects and end targets retain their IDs;
29 parent IDs are inventoried in the reader, and the packet's `targetCoverage`
accounts for every item in the parent's eight-entry MC.2 worklist.

There are 26 new nodes: 2 definitions, 2 constructions, 14 theorems,
7 comparisons and 1 application. The definitions and constructions have
27 API items and 17 discriminating unit tests. One new planet, Relative stable
reflexivity, brings the assembled layer to six with the five parent planets.
Nine actual pinned Mathlib declarations are cited. No new Tau Ceti
implementation is claimed.

The new targets specify the relative fibre and arbitrary-coefficient criteria,
universal complete hulls, flat chart reflection, both local completions,
Proposition 7, actual completed-ring Hom/Ext and arbitrary completed coefficients.
They also specify pointed formal comparison, collision flatness, actual sheaf
and residue descent, arbitrary-base approximation, coherent inverse universal
curves, the independent one-gon genus-one comparison, full pointed induction,
the section terms in the boundary, and triangle family/deformation recovery.

The two-base proof uses a complete hull's finite chart cycles and the local
Tor criterion to promote A-flatness to completed-coefficient flatness. It does
not interchange an arbitrary tensor product with an inverse limit. The reader
also gives a noninjective balancing quotient even for rank-one free completed
coefficients. The collision computation covers nilpotent parameters. Triangle
recovery preserves singular sections scheme-theoretically using their
unramified singular scheme, then cuts the four persistent nodes by the local
endomorphism algebra of their ideal; this handles nonreduced bases.

## Ownership and assembly

Read `assemblyInstructions` before joining this part to the parent. Add the
listed proof routes to the existing parent end targets, preserving their IDs.
The combined parent/new-node graph, including those added routes, was checked
acyclic. In particular, the new formal-flatness proof uses the polynomial
presentation rather than the parent unfinished flatness conclusion; inverse
coherence uses recovery directly; genus-one properness comes from the existing
one-gon supplier and is independent of the triangle immersion.

The current upstream roadmaps were read at
`0d144d044dacebca17b654695b6f1ad58f159b27`, and the current Tau Ceti library at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` was searched and read. Current
StableReduction Layers 1–3 and 9 supply curve infrastructure. Current
AlgebraicVectorBundles L0A–L0C supply internal sheaf operations; its exact import
is recorded outside the older atlas stage index. Current StablePeriodicCurved
Layer 2 already owns finite-projective totally acyclic complexes and finite
Gorenstein-projectives. Its current implementation in
`TauCeti.Algebra.Homology.TotallyAcyclic` was inspected. That module is absent
at the programme pin, so its names are current-upstream evidence rather than
pinned baseline declarations. MC.2's complete-hull target adds coefficient
universality to those existing complexes; `coker d^(−1)=Z¹(E)` matches the
supplier cycle-zero convention after shifting E by one. Its absolute predicate
has no hidden finiteness and has a finite-Noetherian compatibility API.

No definition or result was moved out of a higher-tier roadmap. Generic
local-flatness and Hom/Ext algebra remains with R03.3; ordinary complete
resolutions remain with StablePeriodicCurved; curves, gluing and contractions
remain with StableReduction; stacks remain with SF.1.

## What remains

Seven explicit supplier-stage contracts are recorded, rather than treated as
proved here:

1. DeformationAndDerivedPatchingAlgebra R03.3: local Tor and infinitesimal
   flatness, flat finite-presentation Hom and finite-free Ext comparisons,
   scalar-extension Ext adjunction, coefficient exchange and filtered-colimit
   passage, and one-dimensional Gorenstein MCM duality. Its existing
   flat-fibre-injection/cokernel node alone is insufficient.
2. StableReduction Layer 1: nodes, graphs and normalization/genus, including
   the relative unramified singular scheme and its change-of-base API.
3. StableReduction Layer 2: actual sheaf operations, duality/degree, polarized
   descent, relative Proj and the contraction structure-sheaf property.
4. StableReduction Layer 3: pointed stability, smooth-section pushouts and
   their comparisons, and the primitive single-mark contraction.
5. StableReduction Layer 9: marking-preserving stabilization and uniqueness.
6. SchemeAndStackFoundations SF.1: stack/morphism transfer and the proper
   representable monomorphism criterion.
7. StablePeriodicCurved Layer 2: existing complete-resolution carriers and
   comparison up to homotopy, with the explicit commutative/degree translation.

Keep the inherited MC.0/MC.1 algebraicity, atlas and formal-to-étale
normal-crossings obligations. The new induction transports those contracts;
it supplies no substitute for their general foundational proofs. Existing
specific SF.0, SF.4, R09.1, R09.4 and R09.6 nodes are cited directly where they
supply the required statement.

One source-access gap remains: direct collation of Knudsen's printed Bourbaki
Chapter III, 5.4.4 citation. No cleared copy was available, so no statement or
page number is invented for it. The packet supplies a public-source replacement
proof of the two-base theorem; Bourbaki is not a premise of that route. A source
worker can collate the original locator from an authorized copy if it is retained.
This gap and the seven contracts are why coverage is `planned`, not `closed`.

An independent reviewer should check the displayed replacement completion
argument, the actual-ring formal Proj comparison, arbitrary-base descent and
triangle recovery against the cited statements and supplier scopes. A follow-up
must discharge the precise supplier contracts and inherited foundational
obligations, then assemble the existing target IDs with these proof routes.
It should not produce another polynomial calculation or another definition of
curves, generalized elliptic curves or ordinary complete resolutions.

## Sources and corrections

All statements and arguments are in our own words. Public versions read:

- Knudsen, *The projectivity of the moduli space of stable curves, II*,
  Math. Scand. 52 (1983), 161–199: §2, pp. 171–179; §3, pp. 180–190;
  Appendix, pp. 191–199. Proposition 6 is pp. 194–195; Proposition 7 is p. 195.
- Knudsen, *A closer look at the stacks of stable pointed curves*,
  arXiv:1106.1588v2: Proposition 2.1, pp. 5–10; §3, pp. 11–13;
  Main Lemma and Theorems 5.1–5.2, pp. 3 and 13–16.
- Ile, *Stably reflexive modules and a lemma of Knudsen*, arXiv:1110.3909v3:
  §§2–4, pp. 2–10; Theorem 6.1 and the pairing correction, pp. 18–21;
  §7, pp. 24–26.
- Stacks tags 00MK (Algebra 10.99.7), 0523 (10.99.11), 00MC (10.97.3),
  0C58 (Algebraic Curves 53.20.1), and 02GE (Morphisms 29.36.13).

The packet includes URLs, access dates and hashes of the three public PDFs.
The inherited source issues E1–E3 are referenced without duplicating their
records. The moving-family equality of the ideal/dual pairing is not used;
the closed immersion is specific to the fixed labelled triangle. No new
source erratum is asserted. No private-library file was copied.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/StableReductionPartII--MC.2.json`:
  zero errors and zero warnings.
- `lean-check research/blueprint/suggested/StableReductionPartII--MC.2.lean`:
  exit 0, no errors, nine admitted-proof warnings and no other warnings.
  Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded 20 GB
  before compilation. The single compiler process finished normally.
- The suggested file is 95 lines: one real-bodied absolute predicate, six
  theorem signatures and three examples on native carriers. Heavy relative,
  complex, sheaf and curve/stack signatures stay in the reader under the
  current worker shape rule. No admitted data definition or geometric stand-in
  is present. Successful elaboration proves none of the admitted theorems.
- Checked full parent/new-node dependency acyclicity with the assembly edges;
  checked IDs, reader statements/APIs/tests/source references, definition test
  counts, allowed paths and whitespace. The parent packet is unchanged.

The planning pass is ready for independent review. No second job is claimed.
