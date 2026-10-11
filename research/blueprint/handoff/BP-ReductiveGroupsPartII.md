# BP-ReductiveGroupsPartII — complete target-level plan

Job #982, completed by Codex, session `codex-QmBZXg`, on 2026-10-09. This continues
the merged checkpoint from Claude Code, session `cc-cbcdea`, PR #7979. Its valid
node identifiers are retained. The packet is `complete`; the next step is its
independent review, followed by packaging after acceptance.

## Coverage and deliverables

The four deliverables agree: the packet, complete mathematical reader,
suggested Lean file and this handoff. There are 179 target-level nodes: 23
definitions, 36 constructions, 109 theorems, 2 comparisons and 9 applications.
They contain 365 API items, 246 unit tests, 38 planets, 60 pinned baseline
references, 17 lower-tier supplier contracts, 37 source records and 9 source
corrections. Every implementation status remains `unchecked`.

| Layer | Targets | Coverage | Remaining target work |
| --- | ---: | --- | --- |
| RG2.0 | 16 | planned | none |
| RG2.0a | 15 | planned | none |
| RG2.1 | 29 | planned | none |
| RG2.2 | 25 | planned | none |
| RG2.3 | 54 | planned | none |
| RG2.4 | 28 | planned | none |
| RG2.5 | 12 | planned | none |

There are no recorded mathematical gaps or unfinished refinements. The layers
are `planned`, rather than `closed`, because their prerequisite chains include
explicit roadmap-stage supplier contracts. These are the imported lower-tier
boundaries below, rather than missing targets in this plan. Internal nodes are
ordered topologically within each layer.

The reader states every target, its hypotheses and dependencies, its proof or
construction outline, source locators and acceptance properties. Definitions
and constructions have their complete API and discriminating tests. The Lean
file contains suggested forms for all target and API declaration names and
examples for every test name. PROTOCOL section 13 governs conditions whose
future API cannot yet be expressed: the accompanying comments explain those
omissions, while the reader and packet give the full hypotheses. Such
conditions are not replaced by empty proposition stubs. This is a plan and
prototype, with no formalization claim.

## Boundaries and ownership

Accepted RS-31 is followed. Unvalued reductive-group structure remains in the
Tau Ceti ReductiveGroups anchor. RG2 adds valued and integral structure. The
reviewed library audit and the pinned source statements were checked before
extending existing APIs. The 17 contracts import:

- ReductiveGroups Layers 0, 2, 3, 4, 5, 6, 7 and 9: Hopf points, Lie algebras,
  components and quotients, multiplicative-type character modules, unipotent
  radicals, reductivity and simply connected covers, root and parabolic
  structure, and pinned integral groups.
- LocalFieldsRamification Layers 0, 1, 2 and 3: valuation extensions, unit norm
  surjectivity in an unramified quadratic extension, unramified extensions and
  Frobenius, and tame ramification. The Layer 3 contract explicitly includes
  maximal tame-extension compatibility `F^t = F·ℚ_p^t` in a common closure,
  used from KPZ Lemma 6.1.2, arXiv v3 pp. 64–65.
- ProfiniteProPGroups Layer 3: the inverse-limit characterization of pro-p
  groups.
- ModularCurves Layer 0F: affine finite-presentation Weil restriction and its
  base change. RG2.0a constructs the arbitrary-affine extension and proves
  agreement with that case; general algebraic-space restriction remains with
  its other owner.
- RootSystems Layers 3 and 4: general Coxeter combinatorics and finite chamber
  theory.
- ClassFieldTheory Layer 9: the local Weil group and its map to the absolute
  Galois group.

Moves and consumer corrections for the programme's maintainer:

- **Lang and lifting move down to RG2.3.** Finite-field Lang, smooth connected
  integral torsors, inverse-limit Lang and Frobenius-fixed coset lifting are
  supplied here. EtaleCohomology ET.0 and GeometricNumberTheory GN.3 should
  import these statements. There is no upward dependency on either roadmap.
- **Arithmetic lattice invariants move down.** Algebraic fundamental groups,
  z-extensions and the Kottwitz map are owned here, for consumers such as
  BasicAlgebraicGroups BG.1. The cocharacter-invariant lifting and adjoint
  Cartan-coset lifting of Kisin Lemmas 1.2.3–1.2.4 are explicit RG2.4 targets.
  They distinguish lifting a coset from lifting an arbitrary adjoint point.
- **Affine Weil restriction stays foundational.** The arbitrary-affine
  extension in RG2.0a addresses RT-AREA-algebraicgeometry/11 while importing
  ModularCurves 0F. RelativeFrobeniusAndWeilRestriction R09.3 and affine
  Lawrence–Sawin uses can import it. General algebraic-space representability
  remains outside this roadmap, and is not an upward prerequisite here.
- **Tame representation theory remains in Part III.** Fintzen's representation
  results, including the accepted routing of PAPER-FINTZEN-21/9 and /2a, are
  consumers of these local structures, rather than new RG2 targets.
- **Affine Grassmannian geometry remains in GeometricSatakeAndFusion GS.0.**
  Zhu's group-level lattice and Cartan inputs and the local faithful linear
  realization are supplied here; the geometric continuation is imported by
  its owner.
- **Classical local matrix models belong here.** Quaternionic Hermitian
  standard-basis and lattice results used by KPZ are explicit targets with a
  reduced-norm argument. Classification of Shimura data and the `DH` consumer
  belong to ShimuraData. Higher arithmetic generation of Shimura-point groups
  remains with the arithmetic consumer.

## Mathematical corrections and review focus

The reader and packet pin the negative-valuation apartment translation, the
positive-valuation Kottwitz map, multipliable-root normalizations, chosen
central metrics, connected parahorics versus full fixers, and enlarged versus
reduced buildings. Ordered positive-root products are asserted at positive
depth; depth zero uses generation and big-cell charts. Filtrations use their
correct left-continuity convention. The pro-p statement tests open normal
finite quotients. Residual cocharacters lift through a chosen lifted torus,
with uniqueness confined to that torus. Mock exponentials use a common map
with the stated multiplication and commutator error depths.

The finite Kaletha multiplicative-type quotient is the fppf quotient of
restriction of roots of unity by the diagonal subgroup. Its character group
is the augmentation kernel in the finite coefficient module. Transition maps
repeat embedding coordinates with the divisibility factor; it is not treated
as a torus or as a cocharacter lattice. Three additional finite computations
test this distinction.

Checkpoint statements also use the half-unit SL₂ wall spacing and the correct
Levi descent criterion: Frobenius stability of its vanishing-root subsystem.
A fixed vector is sufficient, while central nonfixed vectors give the same
descended torus. The échelonnage non-example uses ramified SU₆, with relative
type C₃ and wall-spacing type B₃, avoiding ambiguous reduced-part conventions.
Five additional compatibility tests cover subgroup normalizers, root
pairings, coroot quotients, convex facet carriers and split échelonnage data.

Nine source issues are recorded with their correction searches, including
Lang lifting versus an unjustified pro-p argument, finite tame descent versus
infinite Weil restriction, connected-special-fibre hypotheses, the direction
of the Iwahori inclusion, and Adler Proposition 1.4.1 at depth zero. The latter
has the explicit ramified norm-one-torus counterexample: `−1` acquires a
depth-zero component after the ramified splitting extension. Positive-depth
group intersection and all-depth Lie-lattice intersection are retained.

The GSp4 calculation uses the corrected base from
`PAPER-PILLONI-20/gsp4-self-dual-root-datum`, correction E20. Its character and
cocharacter bases, pairings and two integral matrices are given explicitly;
the determinant and inverse-transpose identities were checked in Lean. This
is distinct from this packet's E47, which concerns van Hoften's Iwahori
inclusion.

The independent reviewer should inspect these normalization and component
boundaries, the finite quotient transitions, the tame hyperspecial and
quaternionic inputs, and the inverse-limit lifting arguments. There is no
remaining planning chapter to resume before review.

## Source access and provenance

The packet's source catalogue gives editions, URLs, access dates, public-file
hashes where obtained, and target-specific theorem, section and page numbers.
The reader bibliography agrees. Statements and arguments are written in our
own words; neither document contains a source passage or an excerpt field.

Primary local-structure sources consulted at the cited locators include BT I,
BT II, the classical-groups article, Conrad on point topologies and
quasi-reductive schemes, Anantharaman on quotients, Edixhoven, Prasad, Adler,
Milne's Version 2.00 notes, Haines–Rapoport, Haines on root-system dualities,
Richarz and Pappas–Rapoport. The arithmetic adapters were checked against
Kisin, Kisin–Pappas, Kisin–Pappas–Zhou, Kisin–Zhou, He, Kaletha,
Gleason–Lim–Xu, van Hoften and Calegari–Geraghty, with the recorded version
pagination. The public Kisin author PDF was read through the browser; its
checkpoint source hash is retained. Source records retained from the
checkpoint include reviewed-extraction provenance where that was the access
basis.

The maintainer-cleared Corvallis Part 1 copy was read for Tits, *Reductive
groups over local fields*, pp. 29–69, including §§1.10–1.15, §§2.1–2.9 and
§§3.1–3.8.1 as cited in the targets. No file or passage from it was copied to
scratch or the repository. Corvallis Part 2 was not read. The dual/L-group
construction uses public Buzzard–Gee and explicit lattice derivations, with
the anchor's classification of pinned groups.

Pilloni's full text was unavailable through its public automated-download
endpoint; the GSp4 target uses the reviewed extraction with an independent
matrix verification. Uncleared books, including the Néron-model and
Bruhat–Tits monographs and the books referenced by higher consumers, were
not read through another copy. The quotient, tame-model and quaternionic
arguments instead use the cited accessible results and the proof outlines
here. No source file or extracted source text is committed.

## Validation

- `scripts/check_blueprint.py`, with the pinned declaration index: **0 errors,
  0 warnings**; 179 nodes, all seven layers planned with empty remaining lists,
  0 gaps and 17 supplier requests.
- `lean-check research/blueprint/suggested/ReductiveGroupsPartII.lean` in the
  shared pinned build: **exit 0**, with `sorry` warnings only and no linter warnings. No Lean server or library build was
  started.
- A separate elaboration audit checked all **487 unique target/API names**:
  **exit 0**, with the same `sorry` warnings only.
- All **246 packet test names** have actual Lean example or theorem forms and
  appear in the reader. All 179 node IDs, target declaration names and 365 API
  entries appear in the reader. All implementation statuses are `unchecked`.
- Only the issue's four deliverable files are changed. Scratch holds work logs
  and public source copies during submission and is deleted after the pull
  request opens; nothing needed for review depends on it.
