# BP-FunctionFieldArithmeticPartII--GC.0 — handoff

Issue #8909. Worker: Codex — codex-C4kkbj. Branch:
`codex-C4kkbj-root-picard`. Scope: `FunctionFieldArithmeticPartII:GC.0` only.
This is a complete target-level planning pass, not a checkpoint or an
implementation. Packet status is `complete`; GC.0 coverage is `planned`.

## Delivered

- Nine new targets: two definitions, one construction, six theorems. They type
  the native root fibres and arrows, root tensor/dual coherence, every integer
  degree component, the frame square action, its quotient equivalence and
  relative gerbe, native sections only on R, the section quotient and affine
  charts, and the full and relative inertia equations.
- Eighteen new API items and twelve new discriminating tests. The three parent
  GC.0 targets are imported by ID, including their seven API items and six
  tests. Their original IDs are not redeclared and the parent packet is
  unchanged. No new planet is added: the combined layer retains the three
  parent planets.
- The reader states the actual native carriers, arrow squares, action and
  frame-change directions, descent inverse, unit/counit route, tensor/dual
  coherence, torsor degree convention and test calculations. In particular,
  root sections need not extend to X and the section variant is a monoid
  stack, not a Picard stack when the zero section is present on nonempty R.
- The compact suggested file has two real native object structures, two native
  arrow structures and a real zero-section constructor. It states five API or
  coordinate equations and five examples. Its exhaustive geometric omission
  ledger follows WORKERS.md's fixed 2026-10-12 shape: it does not replace
  unavailable stack carriers by arbitrary types or admit data definitions.
- Thirteen baseline declarations are read and cited at the exact pins.
  Ordinary Picard theory and generic module/stack infrastructure are imports.
  Existing current-library rigidification, rescaling, pullback and Euler degree
  are explicitly imported rather than planned again.

## Exact remaining contracts

The packet records three supplier requests:

1. `GC0-WEIL-FRAMES`, to `SchemeAndStackFoundations:SF.1`: actual finite-étale
   restriction-of-scalars functors for G_m and A¹, arbitrary base change,
   splitting comparisons, and the affine torsor of frames of an actual native
   invertible sheaf on R_S. Include the descended linear section charts.
2. `GC0-NATIVE-INTEGRATION`, to `SchemeAndStackFoundations:SF.3`: integrate its
   existing native Picard groupoid and all-degree curve-stack contracts with
   current InvertibleSheaf pullback, RigidifiedLineBundle, eulerDegree and
   native tensorSection. All restriction, monoidal, dual and base-change
   comparisons must use the same underlying native module interfaces. The
   existing owners are JacobianChallenge A/D and AlgebraicVectorBundles L0A/B.
3. `GC0-ORDINARY-SITE`, to
   `SchemeAndStackFoundations:SF.1/stack-in-groupoids`: connect its actual
   scheme-site pseudofunctors and two-fibre products to the D0 ordinary quotient
   interface, retaining full arrows and the comparison isomorphism. The empty-R
   case retains the ordinary Picard stack, with its scalar automorphisms.

`GC0-LEAN-GEOMETRY` is the one recorded gap: assembling these actual interfaces
is necessary before the geometric end signatures can be stated and elaborated
at the pins. The native data and arrow structures themselves are typed. The
reader specifies the mathematical frame/descent argument completely; the gap
is not an unidentified source theorem or a claim that the native tuples form
an implemented stack.

A follow-up must discharge these contracts and the reader's precise omission
ledger against the supplier implementations, then elaborate the compact
geometric end signatures. The broad parent CURVE-GEOM, STACK-GEOM,
ORDINARY-STACKS, JAC-A and LEAN-GEOMETRY records have other consumers and remain
open outside this scope. SF.3's current planned nodes are contracts, not
accepted implementation evidence. No roadmap, ownership move or restructuring
is proposed. GC.1 retains global effective sections and GC.5 retains signed
translation and all-degree local-system construction.

## Mathematical conventions to preserve

- R is finite étale, empty allowed; k has characteristic different from 2.
  The parent finite-field/reduced-divisor hypotheses imply this. Over an
  imperfect field reduced alone does not imply finite étale.
- Gamma is directed L_R→O. A root frame e:O→K extracts
  gamma=(iota e²)⁻¹. With e′=e u⁻¹, the chart changes by
  (gamma,a)→(u² gamma,u a), and the root comparison is (1,u).
- Full root automorphisms satisfy u²=c|R with c a scalar on L. Only over the
  identity of L is the inertia Res μ₂. Sections add u alpha=alpha; do not
  cancel arbitrary ring-valued sections.
- Degree is degree L, not half of it. Every integer component is permitted and
  geometrically nonempty; a k-object in every degree and a degree-one rational
  point are not assumed. Pic^d is a torsor without a chosen translation.
- Root-line frames form torsors, not globally chosen trivializations. The
  nontrivial order-two line on an elliptic test base detects this distinction.
- Nilpotent sections are retained. The worked base F₅[epsilon]/epsilon² is an
  actual F₅-algebra. The square-zero coordinate epsilon is not the zero section.

## Checks and evidence

- `python3 scripts/check_blueprint.py research/blueprint/packets/FunctionFieldArithmeticPartII--GC.0.json`:
  zero errors and zero warnings. Also passed with a focused pinned-source
  declaration index, which resolves all thirteen baseline names. The index
  was generated from the supplied source tree, not from guessed declarations.
- `lean-check research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.0.lean`:
  exit 0, with exactly ten expected proof-admission warnings and no other
  diagnostics. Memory availability was checked before each invocation. The
  final code, including the dual-number example, was checked at the pins.
  Subsequent edits to its omission ledger changed comments only.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/FunctionFieldArithmeticPartII--GC.0.lean`:
  passed; no admitted data.
- A consistency check matched every new node statement, API item, test and
  prerequisite with the reader, and checked all imported parent APIs/tests.
  The internal graph is acyclic under the blueprint checker.
- Submission deliverable-path/JSON checks and `git diff --check` passed.
  Only this issue's four deliverables are changed.

The archived shared-build source bytes were compared directly with the git
objects at Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`:

| Source | SHA-256 |
| --- | --- |
| LineBundle/Basic.lean | `a5b3a45ddf3e6d8ecee349b6a85d8e6381127b7bfbe6a4d70ac761c0340e3e43` |
| LineBundle/TensorProduct.lean | `f69f43ee0f8f84dfe5f2650da56b94c95dbbba20a47fb8ad815518f5b94baa0d` |
| Mathlib/AlgebraicGeometry/Modules/Sheaf.lean | `533643aaa7cfe615c84d1313d7b4e34b8b5cde3a26a4a9f5bca66e5a173fbff6` |
| Mathlib/CategoryTheory/Core.lean | `0764e3243f6b76eb24d9cdc9d599556321a421cf1cbc5fe8b8a38c636debdf02` |

Current TauCetiRoadmap main was read-only at
`0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti at
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The JacobianChallenge and
AlgebraicVectorBundles READMEs were read in full, their relevant suggested
interfaces were read, and the nine roadmaps newer than the atlas snapshot were
screened for overlap. The current native pullback, generic rigidification and
rescaling, chosen-section rigidified Picard functor, and degree interfaces were
read. They are not confused with baseline code or a full stack implementation.
The reviewed library audit has no PartII entry; the reviewed AUDIT-20 parent
FA.0/FA.1 entries were read and their existing arithmetic work is not replanned.
No Lean build, language server, dependency update or cache fetch was started.

## Sources and errata

Yun–Zhang's author-hosted published Annals PDF:
https://math.mit.edu/~zyun/GZW_ramified_published.pdf, read 2026-10-18;
SHA-256 `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`.
Read Definition A.1 and A.1.1–A.1.2, pp. 514–515; Definition A.2 and
A.1.3–A.1.5, pp. 515–517; A.2.2, pp. 521–522; A.3.1, pp. 523–524.
These passages establish the targets and their consumers, not a reading of the
whole paper. Stacks tags 0372 (ordinary Picard descent), 05Y8 (restriction of
scalars) and 040N (positive-exponent Kummer lifting) were read at their exact
numbered locators, recorded in the packet and reader. No source is missing and
no private book was used. Sources stay outside the repository.

No new erratum was found. The packet inherits existing parent finding E2 in
its sourceIssues: A.1.3's zero effective fibre retains the square-zero
thickening, with reduced substack Bμ₂. The parent correction-search audit is
identified as inherited, not represented as a new search. GC.1 owns the actual
effective-fibre theorem; GC.0 uses the correction only to preserve nilpotent
root sections. All source descriptions are in the worker's own words.
