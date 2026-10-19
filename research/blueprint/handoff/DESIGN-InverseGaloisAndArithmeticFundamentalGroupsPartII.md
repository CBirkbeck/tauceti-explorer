# Handoff: Hurwitz homological stability design

Issue #3418, agent Codex, session `codex-IF3Vng`, 2026-10-19.
Branch: `codex-IF3Vng-hurwitz-stability`. The bot confirmed claim comment
6259143693. This is a complete target-level design pass, ready for independent
review, rather than a checkpoint. No stage is claimed closed or implemented.

## Deliverables and coverage

The new roadmap definition, packet, reader and suggested file use the common
stem `InverseGaloisAndArithmeticFundamentalGroupsPartII` in their respective
blueprint directories. The six layers cover components and the central sum,
graded K/Tor estimates, the truncated arc complex, its homology spectral
sequence, linear stability for the four Hurwitz variants, and uniform Betti
bounds. Every layer is `planned` with explicit remaining obligations.

There are 44 nodes: 6 definitions, 10 constructions, 27 theorems and
1 comparison; 79 API items, 60 discriminating mathematical tests, 28 planets
and 17 verified baseline declarations. All implementation statuses are
`unchecked`. Every definition and construction has recorded uses, an API,
and at least three checks. The packet's `routeCoverage` accounts for every
one of the 44 assigned EVW items, including the Remark 7.9 output boundary.

The issue explicitly permits independent continuations to split. Its second
direction is preserved under `restructure`, proposing
`InverseGaloisPartIINonliftableRepresentations` with the same parent and area
`langlands`. All 49 assigned Merkurjev–Scavia item IDs and a detailed brief
are retained there. That direction is not claimed covered, and no second job
was claimed. The brief preserves the odd-prime, rank and characteristic
conditions, the common p-variable witness field, the p=3 simultaneous-lift
argument, the Chu–Kang rationality obligation, and the distinction between
weak Galois lifting and finite-group nonsplitting. The maintainer must decide
the proposed split and route its design separately.

## Checks

- `check_blueprint.py` on this packet: **0 errors, 0 warnings**; all six
  layers planned and zero closed. Run with the existing pinned baseline
  declaration index available to the checker.
- `lean-check` on the companion suggested file: **exit 0**, with only the
  expected proof-placeholder warnings. The final file has 176 lines and
  imports individual modules at the pins. Available memory exceeded 20 GB;
  compilations were serial. No Lake build, update, cache fetch or language
  server was run.
- `check_sorry_data.py`: passed. Intake `check-files`: five files, zero
  problems. Source-finding schema/version checks and API/test/item inventories
  passed. No source passages, PDFs, extracted source text,
  private paths or changes to other jobs are delivered.

The suggested file keeps only real definitions over native conjugacy,
subgroup closure, graded families of bundled modules, native braid groups,
and subgroup quotients. It states a few milestones and checks on those
carriers. Its signature omissions are enumerated in `signatureCoverage` and
the reader: parent Hurwitz carriers, internally graded noncommutative derived
tensor, K, smooth arc isotopy quotients, semisimplicial realization and
arithmetic comparison carriers require their owning roadmaps. No dummy
structure or data placeholder stands in for them.

## Exact open inputs and ownership

Four gaps name the missing general interfaces and their consuming nodes:

1. **G1:** a concrete internally graded right-R/left-R derived-tensor bridge,
   with projective resolutions, module-sided Tor, change of rings and
   convergent hyperhomology. DGAInfinity Layers 0, 1 and 5 own these inputs.
   Internal branch-number shifts must remain separate from DG shifts.
2. **G2:** Borel/semisimplicial realization, induced-action equivalences,
   filtered singular chains, convergence and augmentation-edge comparison.
   AlgebraicTopology Stages 4 and 5 own the general machinery.
3. **G3:** the boundary-relative, setwise-marked smooth disc mapping-class
   comparison, half-twist normalization, relative isotopy extension and
   simultaneous arc fixing. These are requested from MappingClassGroupsAndCanonicalRepresentations
   C.0 and GeometricTopology Layers 1 and 3; the generic mapping-class
   definition is imported from MordellLawrenceVenkatesh LV.5.
4. **G4:** relative simplicial approximation, joins and their empty boundary
   cases, and equivariant good-cover/nerve and face-poset CW interfaces.
   AlgebraicTopology Stages 4 and 8 own these generic tools. This roadmap
   owns the specific disc-arc surgery and finite type-A cell construction.

The ten open requests are to DGAInfinity 0/1/5, AlgebraicTopology 2/4/5/8,
GeometricTopology 1/3 and MappingClassGroupsAndCanonicalRepresentations C.0.
Each gives its exact statement and direct consumers. The Stage 2 request
includes H0, singular cross products and their gluing compatibility; Stage 5
also includes finite-cover cell lifting, transfer and averaging. Nothing was
moved out of a higher-tier roadmap, and no existing upstream roadmap was
replanned. Parent IG.3 and IG.5 nodes are imported by their exact IDs,
including the two fixed-degree arithmetic/coefficient-tower comparisons.

## Sources and library audit

Read the published EVW paper, Annals 183 (2016), 729–786, at the packet's
recorded URL/hash, specifically §§2.1–7.9, pp.738–770, for the targets here.
Read Hatcher–Wahl's author manuscript Definition 3.4 (p.16), Lemma 7.1 and
Proposition 7.2 with their proofs (pp.34–35). Read Charney–Davis's author
manuscript introduction and §§1.1–2.2 (pp.1–9), including the type-A poset,
Theorem 1.4.1 and its proof, Lemma 2.2.1 and Corollary 2.2.3. Its damaged
text extraction required reading rendered pages. URLs, access date and
SHA-256 values are in the packet and reader.

The source text is not reproduced in any deliverable. These documents state
the roadmap's own constructions and claims with section/theorem/page locators.
No licensed book was needed or obtained. Hirsch's general isotopy theorem,
SGA and Knudsen are not claimed independently read: the precise general
isotopy interfaces are gaps, and arithmetic comparison obligations remain
with parent IG.5. Merkurjev–Scavia's route and item scopes were read to
preserve the split; its paper and Chu–Kang were not planned or read here.

Positive baseline declarations were checked in source at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The native braid group and its
relations are reused. Categorical Tor, abstract bimodules, commutative
TensorProduct and the spectral-sequence page structure were inspected as
near matches; none was mistaken for a ready noncommutative graded derived
tensor or convergence theorem.

Also screened current TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine roadmaps newer
than the atlas snapshot and the four completed additions, and current Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read-only. Read AlgebraicTopology
and DGAInfinity READMEs in full, their relevant suggested carriers, and the
relevant GeometricTopology layers. The packet records the search scope and
ownership audit; searches are not asserted to prove universal absence.

## Review priorities and source corrections

Seven findings await independent review at their precise published locators.
E1–E4 recheck earlier extraction leads: the four Hurwitz fibres, tensor-factor
order, arc truncation, and the spurious scalar on the exact-subgroup diagonal.
E5 gives a concrete counterexample to the printed zero-slope version of
Proposition 4.13: the trivial group, R=k[t], U=t and M=k have K-homology
supported in every degree q, contradicting its constant bound at q=3.
E6 concerns the homogeneous shifts missing from the displayed splice in
Lemma 4.7; it does not assert a counterexample to that lemma. The plan uses
the conservative common choice A1 at least max(1,a,A(R)), where a=deg U,
and supplies the shifted resolution. E7 tracks the operator degree Dd in
the arithmetic comparison, rather than the parameter D alone.

Publisher record, arXiv version listing, author research page and targeted
erratum searches found no correction of these locators. Earlier preprint PDFs
were not collated, and the Westerland preprints-page fetch timed out. No
novelty claim is made. The withdrawn sequel's gap is separate.

Review the following dependencies particularly carefully: the central operator
is a **sum** of power blocks; a boundary-one component is central; subgroup
generation is part of nonsplitting; all Tor inputs have the correct sides;
K is unbounded in chain degree while the arc terms vanish for q>=n; the
nonaugmented zeroth E2 column is a cokernel, with H1K its edge kernel;
finite-quotient homology uses exact-subgroup strata when centralizers vary.
The uniform étale bound uses the parent fixed-n comparison once and does not
construct a Frobenius-equivariant stabilization or a fixed-q limit law.

The next step is independent review of these targets, corrections and supplier
boundaries. The final handoff and the deliverables contain everything needed
to resume; scratch source files and work notes are removed after submission.
