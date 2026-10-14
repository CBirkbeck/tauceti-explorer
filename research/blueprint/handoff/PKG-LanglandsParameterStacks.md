# PKG-LanglandsParameterStacks — package rewritten to the 2026-10-12 shape

Worker: Claude (Opus 5.5), session `claude-fkqVfS`, issue #7909, 2026-10-13. The bot confirmed
[claim 6157172998](https://github.com/CBirkbeck/tauceti-explorer/issues/7909#issuecomment-6157172998).
None of the manager's priority issues was available and every `top` issue carried the maintainer's
"already a TauCetiRoadmap pull request" block, so this `focus` package was the first eligible job
in WORKERS.md order. Branch `claude-fkqVfS-langlands-parameter-stacks-package`, from explorer
`88926f221`.

## Result

The package is complete: `README.md` (146 KB, 78 subsections), `Suggested.lean` (415 lines) and
`metadata.toml` (`topic = "math.NT"`). All three files were rewritten from scratch to the binding
shape of PACKAGE_REVIEW.md ("Shape of a roadmap", 2026-10-12):

- The README is in upstream form: `**Summary.**`, Scope and ownership, Conventions, Exact supplier
  contracts (From Mathlib / Tau Ceti / each TauCetiRoadmap supplier), How to read the build, seven
  layers (LP0, LP1, LP2e, LP2c, LP3, LP2i, LP4, in build order) with prose targets, exact
  hypotheses, locators, `*Needs:*` lines, `**Checks.**` lists, and per-layer Examples and
  Dependencies; then Downstream consumers and References. The old field lists
  (Hypotheses/Build/API/Unit tests/Needs/Source) and all Lean-development narration are gone.
- `Suggested.lean` states and does not develop. The previous file (3,537 lines, many sorry'd data
  definitions and concrete fixtures) was replaced. Parameters are stated in section form as lifts
  into Mathlib's `SemidirectProduct` (`ParameterLift`), because SR.6.1's `CrossedCocycle` lives in
  another roadmap's `Suggested.lean`, which the pinned build cannot import. Kept: `ParameterLift`
  with `cocycleValue`, `gauge`, `unit`; `geometricDegree`, `tateCharacter`;
  `HasFiniteWildRamification`; `IsWildInertialParameter`; `twistedWildCentralizer`;
  `IsWeilDelignePair` (GL_n); `coactionInvariants`, `coarseQuotient`; `FreeCocycleIndex`;
  `excursionCoefficient`; `traceExtension`, `traceFunction`; theorem signatures on these; and
  examples pinning the gauge side (value 4), the geometric degree (−1, Tate value 1/3), the
  Weil–Deligne sign (`diag(1/3,1)` scales `E₁₂` by 1/3; the reciprocal fails), the trivial excursion
  coefficient and non-multiplicativity of the trace extension. Each `sorry`'d theorem was checked by
  hand to be true as stated.

## Removals, folds and moves (record for the plan and for neighbouring roadmaps)

Duplicates of current TauCetiRoadmap material removed or reduced to a one-clause variant
(TauCetiRoadmap checkout at `0d144d0`, which carries the SR, IHG and RG2 pull-request versions):

| Plan node | Now |
| --- | --- |
| LP0/functoriality-of-cocycles | LP0.1, restricted to what SR.6.1 *crossed-cocycles* lacks: restriction, section bijection, orbit set, continuity |
| LP0/change-of-discretization | folded into LP0.4; it is SR.6.1 *ell-adic-extension* |
| LP1/finite-presentation-over-Z-invert-p | LP1.1, restricted to the condensed reading of SR.6.1 *finite-wild-representability* |
| LP2:excursion-presentation/excursion-algebra-and-universal-homeomorphism | LP2e.9, arbitrary `Γ` over `Q`; finite-wild case is SR.6.3 *excursion-algebra* |
| LP2:excursion-presentation/universal-homeomorphism | folded into LP2e.9; it is SR.6.3 *excursion-invariant-comparison* |
| LP2:integral-invariants/integral-invariant-theorem | LP2i.1, the `Ind Perf(BĤ)` upgrade; the ring isomorphism is SR.6.3's |

Notions moved down into this roadmap because their assigned owner does not state them (record
against those owners):

- **Generalized reductive reconstruction and its continuity** (Quast Theorem 3.7 with Lemmas
  3.4–3.6 and Claims A–C; Quast Theorem 3.8; BHKT Proposition 4.7; Lafforgue Proposition 11.7):
  the plan imported these from IHG.1 (*reductive-reconstruction*, *reductive-stable-tuple*,
  *reductive-one-entry-extension*, *reductive-valued-continuity*). The atlas IHG package has them,
  but the authoritative upstream IHG pull request does not (it keeps connected reductive
  pseudocharacters, §0.7, and GL reconstruction, §1.7). They are now LP2c.2–LP2c.4. This also
  removes the IHG → LP3 upward citation noted in the atlas IHG package.
- **Highest-weight inputs** (∇λ, Δλ, Kempf vanishing, Donkin's criterion, good filtration dimension,
  Donkin–Mathieu tensor theorem, Koppinen–Donkin good filtration of `O(G)`, Touzé–van der Kallen
  finite good filtration dimension): assigned in the plan to the unregistered
  ReductiveGroupsIntegralRepresentationsPartII candidate (gap G1). Now LP3.0. IHG §6.4 upstream has
  good filtrations for `GL₂` only.
- **Finiteness of unipotent classes** (Lusztig 1976, Fulman–Guralnick Corollary 2.6): assigned to the
  unregistered RG2.6 proposal. Now the first statement of LP1.4.
- **Geometric reductivity and finite generation** (Haboush, Seshadri as used in BHKT Prop. 3.2) and
  **Richardson's criterion**, **BMRT centralizers**: stated as targets in LP2e.2, LP2e.4 and LP3.22
  (they were already targets there; their RG2.6 supplier is no longer cited).
- **Singular support for complete intersections** (Gulliksen finiteness, the Arinkin–Gaitsgory
  perfectness criterion): requested from DeformationAndDerivedPatchingAlgebra R03.3, whose plan
  covers only regular sequences, dimension and complete intersections. Now LP1.14.
- Prasad–Yu fixed points: now cited from ReductiveGroupsPartII RG2.2.3
  *finite-group-fixed-points-reductive*, which states it upstream.

Plan gaps: G1 and G6 are closed by these moves; G3 (missing carriers) is resolved by the shape
rule (those objects are README targets); G4 is now LP2c.3, owned here; G2 (independence of the full
excursion algebra at bad primes) is an open question of the source and is stated as such in the
Conventions. No packet was edited.

## Sources checked in this run

- Fargues–Scholze, author PDF, SHA-256 `9ab9efbd…ae905` (matches the plan); printed page = PDF page.
  Read pp.281 and 286–297 in full and checked the statement labels and pages on pp.278–315 for
  every new or changed locator; labels corrected to Definition VIII.2.4, Theorem VIII.2.7/2.9, Corollary VIII.2.10,
  Proposition VIII.2.11 with Remarks 2.12–2.13, Corollary VIII.4.3 (pp.292–293), Lemma VIII.5.16,
  Remark VIII.5.18.
- Quast, *Deformations of G-valued pseudocharacters*, author PDF, SHA-256
  `67eb8211…ead827`: Definition 2.3 p.6, Definition 3.1 p.11, Lemmas 3.4–3.6 pp.12–13,
  Theorem 3.7 p.13 with Claims A–C pp.14–15, Theorem 3.8 p.15.
- Touzé–van der Kallen, arXiv:0809.1014v3: Theorem 1.5, p.3 (FS cites it as Corollary 1.5 of the
  Duke version).
- Jantzen, *Representations of Algebraic Groups* (cleared library copy): II.2.6 p.178, II.2.13
  p.182, II.4.5 p.204, II.4.13 p.209, II.4.16 pp.210–211, II.4.17 remark p.212, II.4.19–II.4.21
  pp.212–213, II.8.3 p.268. Nothing was copied.
- Upstream READMEs read for supplier contracts: SmoothRepresentationsOfLocalGroups (SR.6 in full),
  IntegralHeckeAndGaloisDeterminants (layers 0, 1, §6.4), ReductiveGroupsPartII (RG2.2.3, RG2.5),
  and the atlas ArithmeticGaloisRepresentations package (§2.4 `grothendieck_monodromy`).
- Not re-verified in this run: the BHKT, Lafforgue, Zhu, DHKM and KSS locators that the accepted
  plan already carried; they were kept as the plan states them. Lusztig 1976 and Fulman–Guralnick
  are cited through FS Lemma VIII.1.4, p.281, where they are invoked; their own pages were not read.

## Checks run

- `lean-check research/blueprint/packages/LanglandsParameterStacks/Suggested.lean`: exit 0, 18
  warnings, all `declaration uses 'sorry'`, no errors and no other warnings (Mathlib `082e2d37e8`,
  Tau Ceti pin; 106 GB available at launch). Nothing left running.
- `python3 scripts/check_sorry_data.py` on the Suggested file: passes; 415 lines (limit 5,000).
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Cross-reference check: 78 `###` targets, every `LPx.y` reference resolves; no local paths.

## For the reviewer and the maintainer

- Open checkpoint pull requests #8557 (this job, `codex-gOnW7N`) and #8460 (ArithmeticQuantumTopology)
  were never merged. #8557 adds Lean fixtures to the old development file; this package supersedes
  it and it can be closed.
- Supplier contracts to EnhancedDerivedSheaves E5 (quotient-stack `Perf` descent, derived mapping
  stacks), SchemeAndStackFoundations SF.1/SF.4, SchemeKTheoryOperations S.1 and DerivedDeRhamCohomology
  DD.0 are stated in the README as consumed interfaces; whether each supplier's package states them in
  exactly this form should be confirmed when those packages are reviewed.
- The plan's packet still names IHG.1 and RG2.6 suppliers and the R03.3 singular-support request;
  they are now owned here (above). The IHG atlas packet and package still cite
  `LanglandsParameterStacks:LP3` for reconstruction; that citation is obsolete.
