# DESIGN-ZAGIER handoff

Job #11; Codex, session `codex-eztB21`; 18 October 2026. The bot confirmed the
claim before work began. This is a complete planning pass, ready for independent
review. It is neither a closed proof plan nor a formalization.

## Deliverables and coverage

The roadmap, full packet, reader document and suggested Lean file use the
`ZagierConjecturePolylogarithms` identifier. The title is **Polylogarithms, Part II:
the weight-four Zagier theorem**. The packet has 45 targets: 10 definitions,
18 constructions, 3 comparisons and 14 theorems, with 114 API contracts,
84 definition/construction tests, 31 planets and 5 baseline declarations.
Every definition/construction has its uses, API and at least three tests.
Every implementation status remains `unchecked`.

All stages Z.1–Z.6 are **planned**; none is **closed**:

| Stage | Contents | Remaining acceptance work |
| --- | --- | --- |
| Z.1 | Specialized Q₃/Q₄ presentations and the explicit trilogarithm comparison | Check the complete specialization and supplier-presentation comparison. |
| Z.2 | Oriented Stasheff cells and weight-four cluster maps | Check hexagon/heptagon orientations and normalizations. |
| Z.3 | Cobracket, extension, reduced cyclic carrier, motivic/Hodge correlators, base-point change and depth reduction | Discharge the mixed Tate and framed-period suppliers; check the cyclic carrier qualification and rigidity. |
| Z.4 | Decorated flags, weight-four configuration complex and normalized chain map | Supply sign and constant certificates and the resolution comparison. |
| Z.5 | Canonical periods, scissors/Grassmannian lift, SNC residues and Chern normalization | Establish the field-defined regularized lift, SNC closure and the requested comparison machinery. |
| Z.6 | K₇ cycles, both regulator obligations and the explicit Zagier theorem | Discharge the real/Tate scale adapter and inherited construction leaves. Preserve the stronger inductive statement's conditional boundary. |

The exact statements, proof steps, dependencies, locators and acceptance tests
are synchronized between the packet and reader document. The suggested file
intentionally states only the small numerical and native linear-algebra pieces
available at the pins, following WORKERS.md's fixed shape. Heavy mathematical
carriers and constructions remain fully specified reader targets.

## Ownership decisions

The accepted Polylogarithms P.1–P.4 packets already cover most of the original
nine-topic brief. Its lower-weight proofs, analytic polylogarithms, inductive
complexes, determinant infrastructure and general frontier are imported.
K3BlochGroups owns B₂ and Suslin/scissors inputs; BorelRegulators owns ranks,
regulators and zeta covolumes. P.3 supplies configurations and explicit B₃.
P.4 explicitly asks for this weight-four extension. Its statement-only
weight-four interfaces are outputs to discharge, not premises proving
themselves. The packet's `restructure` records this Part II scope.

Current read-only TauCetiRoadmap documents and suggested files, including all
nine roadmaps newer than the atlas snapshot, and the current Tau Ceti library
were checked before making new targets. Existing generic Tannakian machinery,
PS.9's mixed-Tate-Q/MT(Z) and selected three-puncture motivic path torsor, and
NC.2's rational-basepoint realization groups are imported. No notions were
moved down from a higher-tier roadmap and no other owner's files were edited.
Supplier extensions are proposals recorded here, not silently assumed inputs.

## Gaps and requests

The seven gap records are MT, FLAG-SIGNS, CONST, LIFT, RES, SUPPLIERS and IND.
Their affected target lists and precise missing proof obligations are in both
the packet and reader. IND concerns every cycle in the inductive presentation;
it does not block the explicit-cycle endpoint.

The eight supplier requests are:

- **MT-1**, MotivesAndAlgebraicCycles:MC.4: mixed Tate categories over number
  fields, primitive Ext/K-theory and realizations, reusing PS.9's existing case.
- **MT-2**, AnabelianGeometryAndNonabelianChabauty:NC.2: the arbitrary-puncture,
  field-defined motivic/tangential groupoid and regularization, importing PS.9's
  selected path torsor and MC.6's neutral Tannaka reconstruction.
- **HODGE**, HodgeStructuresPartII:H.2: framed Hodge–Tate Hopf/Lie carriers,
  canonical period DGA and degeneration/rigidity interface.
- **DELIGNE**, MotivicEtaleKTheory:M.8: the nonproper simplicial logarithmic-current
  Deligne comparison, pushforward, suspension and normalized fourth Chern class.
- **SCISSORS**, K3BlochGroups:V.3: A₂ scissors and its normalized a₂ map; an
  isomorphism is not presumed.
- **HOM**, GeneralAlgebraicKTheory:K.2: primitive rational Hurewicz and projective
  resolution comparison to the exact generic-flag complex. Flag modules need
  not themselves be free.
- **SCALE**, BorelRegulators:R.7: the real L₄/Tate π³ coordinate adapter. The
  existing factor-two Borel/Beilinson comparison alone does not supply it.
- **IND**, Polylogarithms:P.4: the inherited arbitrary-inductive-cycle obstruction
  or a direct period-image theorem. Surjectivity on presentations is insufficient.

## Source findings requiring independent verification

Four `sourceIssues` are recorded against the versions actually read. They do
not assert that the weight-four theorem is false:

1. **E01**, GR v5 Definition 10.7, p. 97: the constant-free symbolic b₃ relations
   require a quotient by [1]₃ or a constant-cancellation certificate before
   evaluation in the actual explicit B₃. [1]₃ is retained by the supplier.
2. **E02**, GR v5 Theorem 10.15(b), equation (244), p. 106: the unscaled δW
   identity needs the factor −84; the next-page calculation and the map's
   −1/84 normalization already show the intended correction.
3. **E03**, GR v5 §9.3, pp. 92–93: the matrix/path sketch requires corrected
   indexing and an F-defined regularized motivic lift, including constants
   and descent. G09's geometric Hodge variation alone supplies less.
4. **E04**, GR v5 §2.1, Theorem 2.1, p. 27, compared with G08 §8.2,
   Propositions 8.3–8.4, pp. 84–85: first-shuffle relations leave a pure
   length-two cyclic kernel in the special-derivation comparison. The targets
   explicitly reduce this kernel; check this qualification and the positive
   weight range independently. The simple test is the pure word ⟨X_s,X_s⟩,
   whose tangential action is [X_s,2X_s]=0.

The packet includes correction searches and source-version fingerprints. GR
is scoped to arXiv v5, not an unexamined published text. No independent verdict
has been entered by this worker.

## Sources and library checks

Read publicly accessible GR arXiv:1803.08585v5 (introduction and §§2–10), G08
arXiv:0803.0297v4 (mixed Tate, derivations and periods), G09 arXiv:0908.2238
(integrable Grassmannian symbols/variations), M20 arXiv:2003.06521 (continuity),
G00 arXiv:math/0011168 (scissors trilogarithm/K-theory), and G93's public author
scan (characteristic-class comparison). Exact sections, theorem/page locators,
URLs, access dates and SHA-256 fingerprints are in the deliverables. G93's
relevant scanned pages were read visually. New targets are stated in our own
words; no source passages or source files are included.

The cleared reference index was consulted; no restricted book was needed.
Lower-weight Zagier, Suslin/Bloch and Borel sources are used through their
existing owner packets, not claimed as fresh readings here. No new target
is left without an accessible source, but the missing supplier constructions
and lift certificates listed above still need actual proof/decomposition.

Reviewed library-coverage entries for Polylogarithms, K3BlochGroups and
BorelRegulators were read. Pinned Mathlib statements were read for
`Finsupp.linearCombination`, `Submodule.Quotient.mk`, `ExteriorAlgebra`,
`TensorProduct.lift` and `Matrix.det`. The pins are Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

## Validation and resumption

`python3 scripts/check_blueprint.py research/blueprint/packets/ZagierConjecturePolylogarithms.json`
reports **0 errors and 0 warnings**. Source-issue and source-version checks also
pass. Additional checks confirm every packet target appears in the reader,
all implementation flags are unchecked, definition/construction API/test
coverage, matching source lists and no private paths, control characters,
source excerpts or Lean blocks in the JSON/reader.

`lean-check research/blueprint/suggested/ZagierConjecturePolylogarithms.lean`
completed successfully against the shared pinned Mathlib build: **eight
warnings, all `declaration uses sorry`; no errors or other warnings**. No
library build or language server was started. The file has 74 lines, one light
real-bodied definition and selected statements/examples over native carriers.

Resume with independent mathematical review of the five submitted files,
prioritizing E01–E04, specialization conventions, cell orientations, the
canonical/classical cycle-period argument, field-defined lift and supplier
boundaries. Retain all seven gaps until discharged. Distinguish the κ regulator
comparison from the period-image statement for every explicit cycle; κ
surjectivity is not asserted. The depth-reduction threshold counts arguments
(ℓ>3), not weight. For r₂=0 the endpoint is a rational-ratio statement with
empty determinant one, not an equality obtained by rescaling a nonexistent
column. No additional scratch material is needed to resume.
