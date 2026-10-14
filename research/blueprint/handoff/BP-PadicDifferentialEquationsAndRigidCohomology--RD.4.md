# RD.4 blueprint handoff

Issue: [#9746](https://github.com/CBirkbeck/tauceti-explorer/issues/9746).
Worker: Codex, session `codex-mCyHLK`, branch `codex-mCyHLK-rd4`.
The bot confirmed [claim comment 6171170303](https://github.com/CBirkbeck/tauceti-explorer/issues/9746#issuecomment-6171170303).
This is one completed planning pass, dated 2026-10-14. No second job was claimed.

The [packet](../packets/PadicDifferentialEquationsAndRigidCohomology--RD.4.json)
has status `complete`; its sole coverage record, `RD.4`, has status `planned`.
It contains 23 new targets: 12 theorems, eight constructions, one definition
and two comparisons, with 42 API items, 33 discriminating worked checks,
three new planet candidates, six pinned baseline declarations, three gaps
and nine supplier requests. Every implementation status is `unchecked`.
The [reader](../readmes/PadicDifferentialEquationsAndRigidCohomology--RD.4.md)
gives all statements, hypotheses, proof routes, APIs, checks, acceptance
criteria and locators. The accepted parent packet was left unchanged.

## What the pass established

The 33 accepted RD.4 targets are reused by node id. Eight refinement records
explain the precise source hypotheses and proof routes for inherited fibration,
Taylor convergence, ordinary frame independence, compactification support
independence, MW comparison, finite coefficient extension, localization and
finite étale pushforward. RD.3 keeps its fibration and coefficient targets.
The new descent targets supply the ordinary frame comparison infrastructure.

The unrestricted Gysin target is distinguished from the parent's liftable-pair
calculation. Its general proof remains G1. The cohomological support-amplitude
theorem is now an RD.4 target, with a directly read proof locator in Tsuzuki
2003, Lemma 4.1.2, p. 908. It needs general Gysin but no coefficient Frobenius
and no finite-dimensionality theorem. This avoids using RD.5 as a prerequisite
of RD.4's high-degree log support comparison. RD.5 retains compact-support
vanishing, finiteness and duality; point its ordinary support-amplitude uses
at this new RD.4 node during assembly.

The log targets construct quasi-étale specialization, the exact tube support
kernel, supported relative and absolute embedding complexes, localization
compatible with connecting monodromy, the pair-dependent cohomology group,
the residue double complex, its positive quotient and both supported spectral
sequences. The high-degree comparison includes all three conclusions of
Disegni–Liu Lemma B.5, including the excluded zeroth summand. The complex
uses right wedge by `dlog t` and horizontal differential with sign `(−1)^j`.
The spectral-sequence statements are for underlying vector spaces; they
make no degeneration or Frobenius-weight claim.

Grosse-Klönne 2005 Lemma 1.4 and §1.5, pp. 8–9, supply the log rigid
embedding realization and its completed convergent realization for finite-rank
Zariski locally constant coefficients. Theorem 5.3(ii), pp. 28–29, supplies
the proper semistable log rigid–convergent comparison, with its proof read.
The target uses constant coefficients. It does not supply arbitrary log
connections or identify a nonproper boundary's convergent cohomology with
rigid cohomology. These distinctions are stated throughout the reader.

Grosse-Klönne 2000 Theorem 5.1 is recorded with its actual proper formal
model, dagger tube, closure tube and coherent coefficient hypotheses.
Closed support uses a localization fibre; compact support uses a larger-radius
ambient support complex. The latter global comparison remains G2.
The specialization maps have the directions in Xu–Zhu §2.2: algebraic de Rham
to rigid, and compact rigid to compact algebraic de Rham. Their forget-supports
square is a separate theorem target. The boundary-ideal construction retains
its pro-complex differential and derived inverse limit.

Pan Definition 5.1.6 gives the finite-level theta image quotient and its tower
colimit. The quotient has its universal-property API and four checks.
The geometric log coefficient identification is G3. Finite-dimensionality is
not asserted for the infinite-level direct limit.

## Remaining proof obligations and how to resume

The planning chains all end in imported nodes, baseline declarations,
requested supplier contracts or the following explicit gaps. Stage closure
requires completing these proofs and resolving the nine supplier contracts.

- **G1 — global supports and unrestricted Gysin.** Obtain and read Tsuzuki,
  *Hiroshima Math. J.* 29 (1999), 479–527, Theorem 4.1.1 and Corollaries
  2.6.5–2.6.6, and a full support-independence proof behind Berthelot 1986
  Théorème 4, p. 23. The publisher returned a bot-protection page; the
  1999 proof was not read. Tsuzuki 2003 §2.2, p. 895, verifies the general
  target and base-change compatibility, but leaves the normal-coordinate
  residue-change gluing, proper support comparison and finite étale
  compact-support comparison to this obligation. The cohomological bounds
  inherit the same Gysin proof obligation.
- **G2 — supported log dagger comparison.** Start with the actual coherent
  Theorem 5.1 comparison and the compact-support carrier in GK00 §4.8,
  pp. 21–22. Prove invariance under larger-radius ambient changes and proper
  frame changes, then the supported log comparison. Match HLTT's ordinary
  locus, horizontal boundary and coefficient complex to this admissible
  model. GK00 §5.2, p. 24, announces compact support; the ordinary theorem
  does not prove this full extension. GK05's proper constant-coefficient
  log comparison is established separately and is no longer a G2 item.
- **G3 — Igusa geometric realization.** Read Coleman 1996 §8 and Coleman
  1997 Theorem 2.1 cited by Pan v1 Proposition 5.1.7, pp. 53–54. Identify
  the finite-level curve, determinant line, modular differential resolution
  and log `Sym^k` coefficient; check extension to the field C used by Pan.
  The quotient definition was read; these cited geometric proofs were not.
  Route needed curve and modular carrier interfaces to their owners with
  tier-safe ownership before claiming the identification. The locally
  constant coefficient class of GK05 is insufficient for this step.

## Supplier contracts and ownership

The packet gives `neededBy` lists and precise requests to these nine stages:

- `RD.3`: exact strong-fibration neighbourhood hypotheses and invertible
  horizontal Frobenius forcing Taylor overconvergence.
- `CrystallineCohomology:CR.5`: weak-formal extensions of existing log
  exactification, log de Rham and component residue interfaces, including
  strict/smooth projection charts and exterior SNC residue signs.
- `AdicEtaleGeometry:A1`: tube quasi-étale specialization and the formal/
  special-fibre étale-site equivalence.
- `EnhancedDerivedSheaves:E1`: sheaf-derived adjunctions and support triangles.
- `EnhancedDerivedSheaves:E2`: hypercover descent and the boundary-ideal
  pro-complex inverse limits, cofinality and proper global sections.
- `EnhancedDerivedSheaves:E3`: diagram resolutions, totalizations, filtered
  spectral sequences and exact vector-space colimits.
- `SchemeAndStackFoundations:SF.4`: proper projective refinements, smooth
  weak lifts and local closed-pair lifting data.
- `AdicSpacesPartII:R3`: proper rigid coherent GAGA and the required analytic
  cover/tube comparisons for the specialization pro-complex.
- `AdicSpacesPartII:F1`: larger-radius ambient dagger support carriers and
  radius-change maps. The special-fibre cohomology comparison stays in RD.4.

CR.5's existing algebraic exactification, log de Rham and absolute component
residue nodes are imported explicitly. Its PD Poincaré lemma is not treated
as an analytic open-polydisc lemma. Analytic common-refinement independence
of the realizations belongs to RD.4. The current CR.5 packet's CR.6 clients
already request these analytic interfaces from RD.4 or an RD Part II.
An ownership proposal points them at the exact targets supplied here;
log crystalline, Witt and Hyodo–Kato comparisons remain in CR.6.
The further Stein-exhaustion, Fréchet and completed-tensor requests are outside
this RD.4 pass. No other packet or atlas edge was edited.

## Confirmed finding and atlas proposals

`RT-AREA-padic-2/32` is handled by the exact dagger–Berthelot target and its
supported/log extensions, the G2 model-identification obligation, and three
evidence-backed proposed links from RD.4, RD.5 and RD.6 to
`AutomorphicGaloisRepresentationsPartII:AG2.4`. They supply comparison,
finiteness and weights respectively. F1 keeps the dagger carrier theory and
its generic dagger/completion comparison; RD.4 owns the special-fibre and
supported log comparisons. The maintainer must apply the proposals to the
links and consumer packet. No consumer result is silently assumed here.

The part flags three planets: Rigid Gysin isomorphism, Dagger–rigid cohomology
comparison, and Log rigid cohomology with proper support. Assembly must
consolidate these with the parent's six flags rather than unioning them.
The proposed six-planet final inventory consists of rigid cohomology,
compactly supported rigid cohomology, Frobenius on rigid cohomology, and
the three new candidates. The parent overconvergent de Rham, excision and
MW comparison remain mathematical targets without separate final planets.

## Sources, baseline and validation

Ten source versions, with public URLs, exact read sections, dates and SHA256
identifiers, are recorded in the packet and reader: CT03, B86, BI, B97, T03,
GK00, GK05, DL, XZ and Pan. GK05 was read directly in the cleared library;
no library file or passage was copied. B86's compactification theorem was
read as an announcement. The missing 1999 and Coleman proofs are identified
above. No source passage or section-by-section summary is a deliverable.

The six baseline declaration statements were read at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; the local source files matched
the pinned raw GitHub files byte for byte. The reviewed library audit,
current Tau Ceti library, and all nine newer roadmap directions were checked.
The current AdicSpaces and StablePeriodicCurved roadmaps were read for
nearby style and existing interfaces. No existing specialized rigid carrier
was found in those bounded searches; generic library inputs are cited.

The [suggested Lean file](../suggested/PadicDifferentialEquationsAndRigidCohomology--RD.4.lean)
has 137 lines, three light real-bodied abbreviations over existing kernel/
quotient carriers, six endpoint theorem statements and four examples.
All 23 heavy target names and signatures occur in its closing inventory;
their full APIs and checks are reader targets, following WORKERS.md's
current compact-sketch rule. `lean-check` completed successfully with only
ten warnings that declarations use `sorry`. It does not formalize cohomology.

Validation commands used:

- `python3 scripts/check_blueprint.py` on the packet: zero errors and warnings.
- `python3 scripts/check_sorry_data.py` on the suggested file: passed.
- `python3 research/blueprint/intake.py check-files` on the four deliverables.
- `git diff --cached --check`, after staging only the four authorized paths.
- A local consistency check of target/API/test inventories, unchanged
  inherited node ids, source-version matches and internal prerequisite cycles.

The scratch directory is removed after submission. All locators, unresolved
contracts and resumption instructions needed by the next worker are retained
in these deliverables. The completed pass proceeds to independent review;
it is not a checkpoint or a claim of stage closure.
