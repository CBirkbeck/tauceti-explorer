# Handoff: REV-PKG-AutomorphicBundles~2 — issue #7917

Codex, session `codex-1LP8J1`, 13–14 October 2026. Completed independent fixing review;
verdict **needs_changes**, not a checkpoint. See the review report of the same job name for
source locators, the all-target adversarial table and precise repair contracts.

## Done

Read both accepted target-pass packets, the previous review and the round-2 package. Read current
AlgebraicVectorBundles/ReductiveGroups roadmaps and relevant current Tau Ceti implementations.
Opened all six new-target and three comparison-input locators, plus 15 randomly sampled targets.
Read the cleared Faltings–Chai book's VI §5 pp.233–234 and VI §6 Theorem 6.2(i), p.241 without
copying files or passages. Current upstream commits are recorded in the report.

Fixed convention/generality errors, source qualification, generic supplier mappings and Lean shape.
Deleted old B3.9 `minimalHodgeLineComparison` as a duplicate of partner C5's Hodge semiampleness,
section-algebra finite generation and minimal Hodge ampleness. Old B3.10 rationality is now B3.9;
old B3.11 integral Levi coefficient is now B3.10. All README uses follow that renumbering. The
packet owners should eventually align the target references; packets were outside this review's
editable scope. Generic finite locally free operations are AlgebraicVectorBundles L0A–L0C;
generic quotient and dynamic parabolic representability are ReductiveGroups Layers 3 and 7–8.
The associated-torsor bundle remains a new target here.

The old objection that every API must have an active Lean declaration is superseded by the
binding 12 October shape. End-theorem declarations now use sorry; light data definitions and
examples have real bodies. No geometric carrier was invented. Final lean-check exits 0 with
16 sorry-only warnings. Both packet checks, sorry-data check, intake check and diff check pass.

## Required next repair

1. **B4.21/B5.20–B5.22:** construct the rational Hodge–Tate period tower/M-torsor, VB functor and
   finite-level descent; separately construct the logarithmic local system and ordinary and
   compact-support comparison; construct Kostant/dual BGG graded pieces, degeneration and Hecke
   compatibility. `HodgeTateVBInput`, `LogHodgeTateInput`, `DualBGGInput` are now marked as gaps,
   not accepted substitutes for closure. Tier 15 cannot import tier 16/17 constructions.
   The finite-level B5.21–B5.22 can use the classical Faltings–Chai route directly; their
   unnecessary B5.20 dependency was removed. These need source-based target plans with
   lower-tier dependency chains, or a coordinated
   programme scope/order decision. No ownership move was executed here. Classical p-adic
   comparison includes p=2: FC90 VI §6 Theorem 6.2(i) has no p>2 restriction; part (iii) is different.
2. **B4.15/B5.16–B5.18 and Hilbert B5.19:** supply Diamond's ramified splitting-model semi-abelian
   boundary extension, toroidal/minimal formal cusp comparisons, filtration-line/unit transport
   and residue-fibre cusp detection. Accepted C6 supplies Dimitrov's specified model, not this
   variant; its q-injectivity also inverts the discriminant. H2 supplies only the open splitting
   model. Start with Diamond22 §§2.7–2.10 pp.6–8 and §§6.1–6.2 pp.24–25, Diamond21 Proposition
   7.2.1 p.37, then agree exact ownership with ShimuraCompactifications. Do not assume smoothness
   or a splitting-model identification from the generic C6 model name.

The README's opening and affected targets already expose these gaps. The conditional mathematical
conclusions, APIs and discriminating Checks are preserved for the repair worker.

## Coordination note

The earlier package handoff also reports a possible arbitrary-module error in partner C5's
Fourier–Jacobi coefficient expression: pushing a line to the abelian base and then tensoring is
not interchangeable with sections of that line tensored on the torsor without base change.
This review read LanPEL 7.1.2.14 and retained this package's torsor-section formulation. The partner
packet was not edited or independently repaired; its owner should check the exact coefficient
expression. This is not asserted to be a resolved ownership change.

No scratch artifact is required to resume. Only the package, review.json, report and this handoff
were changed. The one claimed job ends with its atlas pull request; no second job is taken.
