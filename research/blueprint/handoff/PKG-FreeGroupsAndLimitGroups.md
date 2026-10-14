# FreeGroupsAndLimitGroups package handoff

Job: PKG-FreeGroupsAndLimitGroups, issue #9735. Agent: Codex, session
codex-3H3T14. Date: 2026-10-14. This is a complete packaging submission,
not a checkpoint or a claim that the mathematics has been formalised.

## Deliverables and coverage

The package contains `README.md`, `Suggested.lean` and `metadata.toml`
(`math.GR`). The README follows the upstream form: summary, ownership,
conventions, supplier contracts, build order, eleven layers with numbered
subsections, examples and dependencies, downstream interfaces, and references.
It retains all 126 input targets (72 theorems, 28 constructions, 25 definitions,
one comparison), all 291 named API items and all 223 named input Checks. Each
definition and construction has at least four Checks. Additional negative
controls accompany the corrections below. Sources and their results are
described in our own words.

The packet, original reader and original suggested file are unchanged. Errors
identified while packaging are corrected in this package and recorded here;
the permitted deliverables do not include those input files.

The suggested file has 923 lines, 52 real-bodied definitions, abbreviations or
structures, 34 theorem statements and 82 examples. It imports `Mathlib`, uses
`TauCetiRoadmap.FreeGroupsAndLimitGroups`, and has comments for all eleven
layers. Definitions use existing carriers; there are no sorry'd data
definitions or auxiliary proof developments. Heavy objects remain fully
specified in the README and named in the closing Lean comment. Layer 10's JSJ,
represented-input and solution-diagram carriers are not invented in Lean merely
to state their milestones.

## Current-library and ownership audit

Read the current upstream FuchsianOrbifolds and AlgebraicTopology READMEs and
suggested files in full. Searched the current roadmap tree and Completed
roadmaps by objects, hypotheses and fields as well as names, including the
roadmaps newer than the atlas snapshot. The upstream checkout was
`0d144d044dacebca17b654695b6f1ad58f159b27`; the current Tau Ceti library was
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

The scope distinguishes abstract presented surface groups and their
peripheral elements from FuchsianOrbifolds' geometric presentations and
AlgebraicTopology's topological constructions. GeometricTopology owns the
3-manifold JSJ problem; this package owns JSJ trees for groups.
ProfiniteProPGroups and PeripheralActions concern pro-p rather than discrete
free groups. No target was transferred from a higher-tier roadmap, and no
external roadmap import is needed.

Existing results are suppliers, not new targets:

- Mathlib's free-group carrier, reduction, cyclic reduction, torsion-freeness,
  free bases and abstract Nielsen–Schreier theorem; the new work is the
  effective encoding, algorithms and explicit bases.
- Mathlib's coproducts, amalgams, HNN extensions and normal forms; graphs of
  groups use them and their injection theorems.
- Mathlib's first-order syntax, semantics, prenex transformation and list
  encodings; primitive-recursive formula encoding is new work.
- Current Tau Ceti's `FreeGroup.instResiduallyFinite` and residual-p result in
  `TauCeti/GroupTheory/FreeGroup/ResiduallyP.lean`, non-nilpotence in the free-group
  lower-central-series development, and syllable normal forms. None is planned
  anew. For the pinned build, the residual-finiteness fact needed for Hopficity
  is obtained by reducing the planned integral matrix embedding modulo integers.
- `TauCeti/GroupTheory/Schreier.lean` gives the stronger rank inequality
  rank H ≤ 1 + [G:H](rank G − 1). The kept target is the exact equality for
  finite-index subgroups of free groups, with an explicit basis.

Read the 68 baseline declarations at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The README states the supplier
contracts, including the extra cardinality hypothesis of the coproduct
ping-pong theorem, the transversal/injectivity hypotheses of normal forms,
and the distinction between list encodings and primitive-recursive encodings.
The suggested file requires no Tau Ceti import at the pin.

## Source verification

Read the public versions of FOLD, KM02, ALG, VAR-I, VAR-II, RECOMP, LIMITS,
GL-JSJ, JSJ, SUBGROUPS, LENGTH, KMS-ACTIONS, MRS-REGULAR, IFT and LIFT used in
the packet. Their PDF hashes matched its recorded versions. Checked the cited
statements and proof passages used for the corrections, rather than relying
on titles or abstracts. Important checks include VAR-I Proposition 8 and
Lemma 16, IFT Definition 6 and Theorem 2, IFT's nonorientable automorphisms and
NTQ induction, MRS-REGULAR Lemma 3.8(2), and the completion proofs in
KMS-ACTIONS Theorems 47–49.

Fetched SELA-I from Numdam's official DOI PDF
<https://www.numdam.org/item/10.1007/s10240-001-8188-y.pdf>, SHA-256
`165d5ca99cd4f59d422e6e18377c439809f6d74bd69a9eb52c21a9b607d2789c`.
Checked Definition 5.2 (p. 62), Proposition 5.6 (p. 67), and Theorem 5.7
(p. 68). The proposition concerns a freely indecomposable limit group; the
full diagram construction first decomposes general limit groups into factors.

Locators not freshly verified in full text in this run:

- MAK and MAK82: official MathNet bibliographic records were available or
  intermittently reachable, but the English PDF retrieval timed out or returned
  a landing page. The inherited printed-page locators remain: MAK82 Lemma 1.4,
  Theorem 10.3, Lemmas 11.1–11.4 and Theorem 11.5; MAK §§2–6. The accepted input
  reports statement-level verification. The independent public RECOMP route
  covers equations, inequations and rational constraints, but is not itself
  cited as Makanin's explicit length-bound theorem. Fresh verification and
  lemma-level reconstruction of the corrected bound remain follow-up work.
- TREES: supplementary chapter locators are explicitly unverified. Public
  FOLD, KM02 and GL-JSJ supply the corresponding graph and splitting targets.
- INFINITE-WORDS: supplementary reference only; the algorithmic targets use
  the public SUBGROUPS proofs.
- KM06 Theorem 32: unresolved proof dependency, confined to §10.10 below.

No restricted book was used, and no source file or source passage is included
in the deliverables.

## Mathematics pass and corrections to the input

Every subsection was checked for its hypotheses, conventions, examples and
supplier contract. The following table records the main test instances and
resulting changes. It is a check of the package's mathematics, not an
independent review.

| Targets checked | Instances and conventions tried | Result |
| --- | --- | --- |
| §§1.1–1.19 | Empty words and basis; nested cancellation; a commutator versus its abelianisation; a proper-power generator versus its maximal cyclic subgroup; identity roots | Preserved computability/witness contracts and negative controls. Conjugacy requires both cyclic-prefix and inverse-suffix conjugators, citing MRS-REGULAR Lemma 3.8(2), pp. 13–14. |
| §§2.1–2.14 | Empty graph, point, loop and parallel edges; a finite tree; cyclic core with and without a hanging path; redundant subgroup generators | Trees are nonempty. Rank formulas use integers, or (#E + 1) − #V in naturals. The type-graph construction leaves a minimum-degree-two graph unchanged and keeps the trivial point graph; added KM02 Definition 7.3, pp. 16–17. |
| §§3.1–3.7 | Empty variable tuples; inverse versus multiplication terms; bound-variable renaming; a merely computable symbol map | Primitive-recursive substitution requires a primitive-recursive renaming. A merely computable renaming gives computability; finite-table renamings are primitive recursive. |
| §§4.1–4.13 | Trivial edges; an amalgam and an HNN loop; the translation action of ℤ on a line; F₂ relative to a cyclic subgroup; two noncommuting twist parameters | Domination maps may collapse edges or send them to paths. Relative Grushko factors can be cyclic when constrained by the peripheral group. Collapse endpoints must lie in different orbits and the edge stabilizer equal the origin stabilizer. Finite folding/collapse factorisation carries finite-generation hypotheses. Twists that fix A and conjugate B by z∈B compose as τ_z∘τ_w=τ_zw; the z∈A convention reverses this order. |
| §§5.1–5.12 | Empty algebraic set and empty system; trivial coefficient map F₂→ℤ; the singleton topology over G=1<H; a nonempty irreducible set | G-groups have injective coefficient maps, while evaluation accepts any homomorphism. Coordinate groups inherit an embedding for nonempty sets. CSA gives a G-domain only with a nonabelian coefficient image. Irreducibility/discrimination is stated for finite variables and nonempty sets. T1 is restricted as in the accepted correction to ALG. |
| §§6.1–6.10 | Sphere, disc, torus, projective plane and Klein bottle; multiple boundary components; a coefficient-only quadratic word; inconsistent [x,y]=a; the genus-two exception; two and three squares; QH surface×ℤ | Cyclic gluing excludes trivial disc boundary maps. Cover models retain boundary vertices and connecting arcs before tree collapse. Standard-form normalisation requires an occurring variable; coefficient-only words are tested separately. Regularity requires consistency and a nonabelian freely discriminated base. Low-genus radicals need the product relations as well as commutators. Torsion-free QH does not force trivial fibre; finite fibre is needed. |
| §§7.1–7.16 | Empty systems; ranks zero and one; x²=a with no root; centralizing both free generators with a nontriviality constraint; constrained variables | ET1–ET3 preserve graphical solutions backwards; the other moves require their reduction cases. Rank zero is direct evaluation, rank one integer elimination, and nonabelian ranks use Makanin. Returned tuples have the specified length. The source commutator convention is x⁻¹y⁻¹xy; the Lean `comm` function and examples pin it. Fixed the truncated coefficient sentence in §7.8. |
| §§8.1–8.9 | Trivial group; F₂×F₂; the coefficient inclusion ⟨a²,b⟩≤F(a,b); proper powers; a centralizer of rank greater than one; a nonregular quadratic level | Absolute full residual freeness is separated from coefficient-preserving discrimination. The latter does not follow for an arbitrary embedding of F. Centralizer extensions use full centralizers; single-word NTQ radicals add commutation with the whole centralizer. R(S)=ncl(S) requires regular quadratic and full-centralizer levels; it is not true for all NTQ systems. |
| §§9.1–9.9 | Zero length; word inversion and cancellation; a nonregular length action; a finitely generated ℤⁿ-free group | Included nonnegativity in Lyndon's axioms. The regular-completion target has finite generation and preserves the same n, citing KMS-ACTIONS Theorems 48–49, pp. 98–99, where proofs are given; LENGTH's introductory announcement is not used as a proof. |
| §§10.1–10.10 | A free group needing trivial edge groups; relative cyclic versus abelian rigidity; plain versus relative limit groups; x²=a with empty solution set; the centralizer diagram with its twists; an infinite family requiring subgroup constraints | JSJ trees are minimal, the family includes the trivial group where needed, and rigidity is relative to the chosen edge family. Promised-input algorithms separate plain and coefficient-preserving embeddings. Inconsistent systems return an empty solution diagram and no coefficient embedding of their trivial radical quotient. Membership testing is not the missing constrained-elimination algorithm. |
| §§11.1–11.9 | The formal solution y=x; an inequation failing at x=1; incompatible square roots; nonorientable one-/two-square automorphisms; unbounded tuples; two independent regular NTQ levels | HasLift implies compatibility for equations/positive formulas, not arbitrary inequations. Corrected the nonorientable basic-family length and formulas to IFT §7.5, p. 136. Generic families require all coordinates to exceed each chosen bound. Replaced the NTQ example whose lower free variable made its top equation inconsistent. The Lean genus-two lift instance has finite variables and a finite equation set. |

The input's existing corrections to ALG's T1 statement, IFT's reference to
Merzljakov, and the genus-two exception to IFT Definition 6 are preserved.
The additional low-genus radical discrepancy is visible directly in IFT
Theorem 2(4)–(5), p. 9: its displayed commutators omit a product relation needed
even to imply the original equation. The package states the corrected radicals;
VAR-I Proposition 8 and Lemma 16 give the corresponding quotients and
discrimination argument. This does not open a separate errata job.

Two cross-layer prerequisites are deliberate and spelled out: build §§8.5–8.6
(centralizer extensions and their discrimination) before §6.8's low-genus radical
identifications; use §8.7's structure/finite-presentability result before the
finite-rank conclusion for abelian subgroups in §8.2. Neither uses §10.10.

## Remaining mathematical work and where to resume

The one recorded gap is retained, not solved: §10.10 requests equations and
complete coefficient-preserving solution diagrams over a represented limit
group H. JSJ Theorem 3.23 cites decidability; Theorem 14.1 supplies a sketched
Hom(G,N)-construction for an NTQ group N and refers elsewhere for its proof.
Embedding H into N and testing membership of individual candidates does not
decide whether a family of solutions has a specialization entirely in H.
Read KM06 Theorem 32 and its cited elimination construction, or replace it with
another proved constrained-elimination route. Plan the infinite-word equation
objects, subgroup constraints, termination and completeness before claiming
this endpoint. No theorem in §§10.1–10.9 or Layer 11 consumes it as an oracle.

The accepted plan's other follow-ups remain:

- §6.4: refine the polygon-cover classification to lemma level. The corrected
  boundary cell structure is now specified, but the cut-and-paste proofs are
  still roadmap targets.
- §7.6: reconstruct Makanin's bound at lemma level, with MAK's corrected E.11
  minimality argument and the combined inequality/alphabet-constraint reduction.
- Layer 10: separate the presentation/subgroup, Grushko/JSJ, diagram and
  represented-limit-group solver developments when preparing implementation
  units. The effective Grushko statement covers one finitely generated
  peripheral subgroup; the several-subgroup algorithm still needs its own
  proved route. The JSJ algorithm accepts a promised freely indecomposable
  finite-family input without assuming that missing recognition algorithm.
- §11.4: refine the Nielsen-property proof of generic families to lemma level.
- §11.8: the formal-solution search terminates on promised compatible inputs.
  LIFT's stronger decision procedure for liftability is not silently supplied
  by that search and remains a follow-up.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/FreeGroupsAndLimitGroups.json`:
  0 errors, 0 warnings; the input reports its one retained gap.
- Coverage/name cross-check: 126/126 target subsections, 291/291 API names,
  223/223 input Check names; eleven layer headings and at least four Checks
  per definition/construction.
- `lean-check research/blueprint/packages/FreeGroupsAndLimitGroups/Suggested.lean`:
  final run exited 0, no errors, 116 warnings, all `declaration uses sorry`.
  This checks elaboration, not the truth of statements or proofs.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems. The staged whitespace check is recorded in the pull
  request.

No additional package or issue was claimed in this run. The next step is the
independent package review, with particular attention to the corrections and
the unverified source locators above.
