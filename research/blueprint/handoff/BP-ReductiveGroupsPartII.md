# BP-ReductiveGroupsPartII — complete target-level plan

Job #982, completed by Codex, session `codex-ABNkrb`, on 2026-10-11.
This continues Claude Code's merged checkpoint (`cc-cbcdea`, PR #7979) and
Codex's unmerged continuation (`codex-QmBZXg`, PR #8017), retrieved after the
latter claim was released. Correct inherited node identifiers, source records
and mathematical work are retained. This submission is a continuation, with
no independent-review verdict. The next step is independent review, then
packaging after acceptance.

## Coverage and deliverables

The four deliverables agree: packet, mathematical reader, suggested Lean file
and this handoff. There are **180 target-level nodes**: 23 definitions,
36 constructions, 110 theorems, 2 comparisons and 9 applications. They contain
**368 API items, 249 unit tests, 38 planets, 61 pinned baseline references,
17 lower-tier supplier contracts and 38 source records**. Seven inherited source
issues remain, pending independent verification. Every implementation status
is `unchecked`.

| Layer | Targets | Coverage | Remaining target work |
| --- | ---: | --- | --- |
| RG2.0 | 16 | planned | none |
| RG2.0a | 16 | planned | none |
| RG2.1 | 29 | planned | none |
| RG2.2 | 25 | planned | none |
| RG2.3 | 54 | planned | none |
| RG2.4 | 28 | planned | none |
| RG2.5 | 12 | planned | none |

The packet is `complete`, with **zero gaps** and empty remaining lists. Layers
are `planned`: their chains include the explicit supplier contracts below,
so they do not qualify as `closed`. All scope targets are covered; there is no
unfinished planning chapter. Stop target-level refinement here under WORKERS
and PROTOCOL section 0.

Every definition and construction has an API, recorded uses and at least three
discriminating tests. The reader gives exact hypotheses, proof outlines,
prerequisites and numbered/page source locators. The suggested file supplies
all target and API declaration names and a Lean form for every test. Conditions
whose prerequisite APIs are unavailable are explained beside the signatures,
as PROTOCOL section 13 permits; no empty proposition stubs stand in for them.
These are unproved interfaces, with no formalization claim.

## Baseline and upstream screen

The recorded pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The current upstream roadmap checkout
was screened at `070dc2becd74419e76303ede84b465ed4a69461f`, and current Tau Ceti
at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. No build or edit was made there.

ReductiveGroups and OrthogonalSpinGroups were read as the two nearby upstream
models. OrthogonalSpinGroups already supplies specialized O/SO/Spin point
topologies and compactness; the general point-functor topology here extends
those interfaces. Its specialization does not supply the GO/GO+ and integral
multiplier models required here. RootSystems supplies finite chamber and
pairing machinery; minuscule representations in LieHighestWeight do not
supply the integral cocharacter predicate used here. Current Tau Ceti's
exceptional minuscule examples are cited as special cases, rather than a
general API. The nine roadmaps newer than the atlas snapshot and their
suggested files were screened for overlap, including OperatorTheory's
subdirectory files. General buildings, parahorics, Moy–Prasad filtrations,
Kottwitz invariants and this affine Weil-restriction extension were not found
there.

## Boundaries and ownership

Accepted RS-31 is followed. Unvalued reductive-group structure remains in the
Tau Ceti ReductiveGroups anchor. RG2 adds valued and integral structure. The reviewed
coverage catalogue has no direct entry for this Part II; its supplier entries
were read, and unreviewed AUDIT-41 was treated as a search lead. All 61 cited
baseline declarations were checked in their actual pinned source statements.
The 17 contracts import:

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

The continuation makes these corrections to the inherited plan:

- Separate dimension multiplication from smoothness. The new
  `WeilRestriction.dimension_res_separable` target requires a finite separable
  field extension, a nonempty affine finite-type scheme and finite dimension.
  A characteristic-two dual-number presentation models restriction of alpha_2
  after purely inseparable quadratic base change: the source has dimension
  zero and the geometric restriction has dimension one. The general alpha_p
  argument gives dimension p−1. This is a direct derivation, not an attribution
  of an unrestricted dimension theorem to BT II.
- Correct the adjunction direction. On coordinate algebras restriction is
  left adjoint to base change; on affine schemes base change is left adjoint
  to restriction. The scheme unit's coordinate arrow is the algebra counit.
- Include nontrivial root groups and normalization by T in the abstract
  BT I root-datum axioms. Keep generation as a separate property.
- Tie Kaletha's finite multiplicative-type quotient transition to the actual
  character map induced by the Hopf morphism. For n dividing m the coefficient
  map sends c to (m/n)c; tests include 1 mod 2 mapping to 2 mod 4 and the
  same-modulus identity. This quotient is not a torus or a cocharacter lattice.
- Restrict the negative GL_n minuscule test to n at least two. For GL_1 the
  empty root set makes every cocharacter minuscule.
- State the Frobenius rational-torus setup over a finite residue field. Require
  an affine simple reflection for the Iwahori cell formula, and explicit
  compatibility for twisted Kottwitz quotients in the suggested signatures.
- Keep the connected Néron-model condition in positive-depth torus
  filtrations. The full rational-point extension comparison is stated for
  finite tame Galois extensions, with all real Lie depths and positive group
  depths; depth zero additionally uses unramified base change. The group–Lie
  graded comparison is stated for tamely split groups. Wild comparison is not
  inferred from Adler's narrower formula.
- Remove inherited source issue E48: Adler Proposition 1.4.1 intersects with
  the original parahoric G_x. The ramified norm-one-torus depth-zero example
  refutes a broader intersection claim, not that printed proposition.
- Remove inherited source issue E44: its rationale says full stabilizers vary
  with the central coordinate, contradicting their central-translation
  invariance. Retain the source's explicit nearby-point argument: choose the
  derived perturbation sufficiently close and lift it with the central
  coordinate fixed. In the concrete barycentric GL_n realization example,
  require n prime to the residue characteristic for K(ϖ^(1/n)) to be tame.

The inherited normalization choices are retained: negative-valuation
apartment translation, positive-valuation Kottwitz map, multipliable roots,
chosen central metrics, connected parahorics versus full fixers, enlarged
versus reduced buildings, and left-continuous filtrations. Ordered root
products at positive depth are distinguished from generation at depth zero.
Cartan indexing is infinite in general; finiteness concerns right cosets
inside one fixed compact double coset. Residual cocharacters lift through a
chosen lifted torus, with uniqueness confined to that torus. Mock exponentials
use a common map and explicit error depths.

The GSp4 example retains the corrected base from reviewed
`PAPER-PILLONI-20/E20`: (e2−e1, −2e2+e3) and (f2−f1, −f2). Its integer matrix
has determinant −1 and exchanges the two simple roots with their coroots;
the inverse-transpose identities have concrete Lean checks. The remaining
E40–E43 and E45–E47 source issues retain their original correction-search
provenance and await independent verification; they are not review verdicts.
Exact preprint versions and hashes read in this run are recorded separately.

## Source access and provenance

The catalogue retains the earlier workers' editions, read-section records,
public-file hashes and reviewed-extraction provenance. In this run the
corrections were checked directly against BT I 6.1.1–6.1.3, BT II
1.5.2–1.5.17, Pilloni §5.1.1 (author-copy p. 20), Adler §§1.1 and 1.4–1.6,
and Fintzen's tame-tori §3 opening (article pp. 13–14). Fintzen supplies the
connected-torus and tame-descent distinction; good-element and representation
theorems remain with the representation-theory continuation.

Tits's Corvallis Part 1 article was read from the maintainer-cleared copy at
pp. 29–56, covering the apartment/building, descent, fixer, decomposition and
hyperspecial locators used here. Neither its file nor its passages were copied
to scratch or the repository. The same read-only discipline was used for the
cleared BT I, BT II and Pilloni copies. No other copy of an uncleared book was
used. Corvallis Part 2 was not read.

The inherited local-structure and arithmetic source contracts remain in the
reader. This run additionally reread the pertinent preprint arguments in
KPZ §2.1–§2.4, KP18 §1.3 and Corollaries 4.2.12–4.2.13 with Remark 4.2.14,
He §§4.2–4.4 and van Hoften §2.2.5. Their downloaded hashes agree with the
inherited catalogue. This run does not claim to have personally reread every
section in the predecessor's source catalogue. Uncleared monographs remain
secondary references through accessible papers, with their exact input
arguments stated in the plan. Pilloni's previously inaccessible automated
endpoint is resolved by the cleared author copy. All mathematical prose is
our own; no source passages, excerpt fields, PDFs or extracted source text are
committed.

## Validation and next step

- `python3 scripts/check_blueprint.py` with the pinned declaration index:
  **0 errors, 0 warnings**; 180 nodes, all seven layers planned, zero gaps,
  17 supplier requests.
- `lean-check research/blueprint/suggested/ReductiveGroupsPartII.lean`:
  **exit 0**, with only declaration-uses-sorry warnings. No Lean language
  server, library build, update or cache download was started.
- A separate elaboration audit appended checks for all **491 unique target
  and API names**: **exit 0**, with the same expected warnings only.
- Exact reader parity was checked for all **180 target statements, 368 API
  entries and 249 tests**. All packet IDs and names occur in the reader; all
  249 test names have actual Lean example or theorem forms. Every
  implementation status remains `unchecked`.
- `git diff --check` passes; only the issue's four deliverables are changed.
  Scratch is deleted after submission, and review needs nothing from it.

An independent worker should check sources, supplier closure, the finite
quotient transitions, component distinctions, tame hypotheses and lattice
normalizations, then package the accepted plan. There is no second job or
unfinished target-level refinement in this run.
