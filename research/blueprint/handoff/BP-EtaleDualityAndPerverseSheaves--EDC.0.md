# Handoff: BP-EtaleDualityAndPerverseSheaves--EDC.0

Job: blueprint of EtaleDualityAndPerverseSheaves, part EDC.0 (part 1 of 2): stages EDC.0, EDC.1,
EDC.1:adjoint, EDC.1:biduality, EDC.2, EDC.2:pairings, EDC.2:trace-purity, EDC.3. Issue #721.
Worker: Claude (session claude-eGs7SM).

## Deliverables

- `research/blueprint/packets/EtaleDualityAndPerverseSheaves--EDC.0.json`: status `complete`.
- `research/blueprint/readmes/EtaleDualityAndPerverseSheaves--EDC.0.md`: the reader document.
  Its node sections are rendered from the packet, so the two agree.
- `research/blueprint/suggested/EtaleDualityAndPerverseSheaves--EDC.0.lean`: the suggested file.

## State

- 50 nodes: 4 definitions, 15 constructions, 29 theorems, 1 comparison, 1 lemma.
- 141 API items, 76 unit tests and 24 planets (at most 6 per layer).
- 41 baseline declarations, each read in the Mathlib source at 082e2d3.
- 10 requests and 4 gaps; 3 restructure proposals; 7 source issues.
- `python3 scripts/check_blueprint.py` (with the pinned declaration index) reports 0 errors and
  0 warnings. `research/blueprint/intake.py check-files` reports 0 problems.
- Every stage in scope is `planned`. No stage is `closed`, because the packet keeps requests and
  gaps. Each coverage record's `remaining` list names only lemma-level refinements.
- Node `EDC.2/curve-poincare-duality-with-j-star-statement` keeps the identifier of the
  integrated decomposition, because ClassicalAdicEtaleCohomology H0 cites it. Its parent is now
  EDC.2:pairings and it has a full proof plan.

## Suggested Lean file: compiled

`lean-check` elaborated the file in the shared build at Mathlib 082e2d3. The only warnings are
the 135 `declaration uses sorry` warnings. Only Mathlib is imported.

The carriers are Mathlib's own:

- `EtaleDerived Λ X := DerivedCategory (Sheaf X.smallEtaleTopology (ModuleCat Λ))`;
- geometric points through `Scheme.pointSmallEtale`;
- `AlgebraicCycle`, `𝔸(n; S)` and `Scheme.Hom.finrank`.

The operations owned by CohomologicalPointCounting (f^*, Rf_*, Rf_!, RΓ, proper base change)
appear as data stand-ins with `sorry` bodies and no properties, in a section labelled
`Imported`. They are to be replaced by the upstream definitions.

All 217 API and test names of the packet are in the file. 122 are typed. The other 95 are listed
in `Not typed here` comment blocks, each with the carrier it waits for: constructible sheaves,
the Picard group, vector and projective bundles, Chow groups, the EnhancedDerivedSheaves
∞-categories, ℙⁿ, Weil sheaves and cup products. No missing condition is stood in by a `Prop`.

## How the job's special inputs were handled

- **RS-19** (accepted 2026-09-23) keeps every EDC layer. The plan follows its `owners`: EDC.0
  only lifts the imported Rf_! and does not define a second one; EDC.1:adjoint precedes
  EDC.2:trace-purity, which precedes EDC.1:biduality, which precedes EDC.2:pairings.
- **RT-AREA-etale/3 (stacks).** This part is scheme-only throughout. The first `restructure`
  entry proposes "Étale duality, cycle classes and perverse sheaves, Part II: Artin and
  Deligne–Mumford stacks", with its layers and edges as the finding asks. The second gap lists
  the stack consumers. The reader has a section on the finding.
- **RT-AREA-etale/16 (perfect schemes).** Zhu's items E01–E03, E07, E14 and
  characteristic-classes-of-torsors are not planned here. The second `restructure` entry
  proposes the Part II "perfect schemes, equivariant coefficients and hyperbolic localization",
  and the third gap records it.
  - The finite-type statements those transports start from are nodes here: top-degree trace
    (E07 on models), Chern classes and biduality.
  - Zhu's model-independence (orientation) problem stays a proof gate of that Part II.
- **Yu (EDC.2:pairings).** Planned as node `EDC.2:pairings/lisse-tensor-hom-duality-on-curves`,
  with the Hom orders corrected. This is the known erratum PAPER-YU-23/E14, recorded as
  `sourceIssues` E6.
- **Sources added for the other stages.** Yun–Zhang (EDC.5, EDC.7), Caraiani–Scholze (EDC.5),
  Liu et al. (EDC.4), Hansen–Kaletha–Weinstein (EDC.8), Deligne Weil II 4.1.6 (EDC.4) and the
  EDC.4–EDC.8 items of Zhu all belong to part 2: job BP-EtaleDualityAndPerverseSheaves--EDC.4,
  issue #722.

## Requests made

- **SchemeAndStackFoundations:SF.2**, as integration owner of CohomologicalPointCounting
  (PR 196), which is not an atlas stage. Five requests:
  - ConstructibleEtale: constructible sheaves, μ_n with the Kummer sequence, H¹(G_m) = Pic,
    f^*, Rf_*, topological invariance;
  - CompactSupport: Rf_! with composition, base change, stalks, amplitude, projection formula,
    Künneth, localization and Tor-dimension;
  - EtaleBaseChange and finiteness: proper and smooth base change, the acyclicity lemma, and the
    finiteness theorem over fields and regular one-dimensional bases;
  - cohomology of curves, with the cup-product/Weil-pairing identification of TraceFormula
    Layer 8 (RS-17);
  - EllAdicRealization: lisse O_E-sheaves and the finiteness of their cohomology.
- **SF.0**: projective bundles.
- **SF.5**: Chow groups, intersection products and the deformation to the normal cone.
- **JacobianChallenge Layer A**: Pic and degree.
- **JacobianChallenge Layer D**: the Jacobian.
- **AbelianSchemesAndArithmeticModuli A3**: perfectness of the Weil pairing.
- **EnhancedDerivedSheaves E0–E3**: cited by node id (enhanced category, derived tensor, K-flat
  and K-injective replacements, adjoint functor theorem, mates, coherent diagrams).

## Gaps recorded (for the maintainer)

1. **Purity over a trait.** Purity for regular pairs over a trait (Gabber's absolute purity, and
   Saito's semistable fundamental classes), requested by LPV.7. EDC.2's text excludes it, and no
   layer owns it.
2. **Stacks.** No layer plans étale cohomology of stacks (the Part II above).
3. **Perfect schemes.** No layer plans the perfect-scheme transport (the Part II above).
4. **The Grothendieck–Ogg–Shafarevich formula.** This packet endorses the FiniteFieldsAndCharacterSums
   proposal of a sub-stage EDC.2:euler-characteristic (third `restructure` entry).

## Sources

Read for this job, each recorded with its URL and SHA-256 and accessed 2026-10-06:

- SGA 4 XVIII and XVII, in the retyped edition (normalesup.org/~forgogozo/SGA4);
- Milne, Lectures on Étale Cohomology v2.21;
- Stacks Project, chapter More Étale Cohomology (version ed88ff78);
- Deligne, Weil I (Numdam);
- Yu, arXiv:1807.04659v5.

Missing: SGA 4½ ([Dualité], [Cycle], [Th. finitude]) has no free readable copy online, and the
grothendieckcircle and Laszlo links are dead. Where the stage text cites SGA 4½, the packet cites
the equivalent statement in SGA 4 XVIII, Milne or the Stacks Project. The finiteness theorem is
requested from its owner. The original LNM 305 scans were not compared with the retyped edition,
so misprints E2 and E3 may belong to the retyping.

## Source issues

E1 records Deligne's own note that he does not understand the proof of SGA 4 XVIII 3.2.3. The
plan replaces that lemma by a stalkwise proof of purity (Stacks 0GLK with XVIII 2.14.4). E5 and
E7 are gaps the sources acknowledge themselves. E2–E4 and E6 are misprints.

## What a reviewer should look at first

- **EDC.2:trace-purity/smooth-purity:** the proof route that replaces 3.2.3.
- **EDC.1:biduality/constructible-biduality:** the dévissage, its coefficient hypotheses and its
  imported finiteness input.
- **EDC.1:biduality/relative-and-geometric-duality:** the Spec 𝔽_q test of relative against
  absolute duality.
- **EDC.3/fundamental-class and EDC.3/cycle-class-map:** the singular cycle handled through the
  smooth locus, with a perfect base field.
- **The curve H¹ duality node:** it is proved from the Jacobian and the Weil pairing, never from
  general biduality.
