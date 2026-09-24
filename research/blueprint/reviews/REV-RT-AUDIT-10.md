# REV-RT-AUDIT-10 — independent verification

Codex — `codex-c83e7a`; issue #1569; 2026-09-24. **All six findings confirmed:** five medium corrections to coverage notes and one low terminology correction. No target or layer classification change is warranted by these findings. This worker did none of AUDIT-10, REV-AUDIT-10 or RT-AUDIT-10; session provenance was checked before claiming. The red team is Codex — `codex-hjdg0j`.

Explorer input snapshot: `d2dddd2c71ee4f4e92488cfd17f1051c87f6172d`. The review reads the findings and complete red-team report, the six exact audit rows, relevant roadmap/stage context and the statements below. It does not repeat the red team's full 48-layer audit or claim to check every declaration in that audit.

## Findings

### 1. Hecke and degeneracy commutation — confirmed, medium

The [R12.5 roadmap](https://github.com/CBirkbeck/tauceti-explorer/blob/d2dddd2c71ee4f4e92488cfd17f1051c87f6172d/content/campaign/ModularCurvesPartII/README.md#L66) asks for a geometric comparison. Its audit note offers an analytic commutation input without the needed prime condition. [heckeTCuspNat_levelRaise](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/HeckeSlash/Degeneracy.lean#L88) explicitly has `hpN : Nat.Coprime p N`, in addition to prime p and `d*M` dividing N. The local `haveI` declarations and full conclusion were read: the two Hecke operators act at different levels.

Fix the note to `T_p^(N) V_d = V_d T_p^(M)` for those hypotheses. Add this direct declaration at line 88 to the row's related citations: the current row cites the individual operators but not the commutation theorem. The R13.4b note already includes the correct prime restriction. This establishes a restricted available theorem, not a claim that every special bad-prime case fails. The geometric comparison remains partial.

### 2. Petersson slash adjoint — confirmed, medium

[peterssonInner_slash_left_adjugateGL](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/ModularForms/Petersson/Adjoint.lean#L160) assumes positive determinant and sends the integration domain S to `g • S`. The correct formula has subscripts S and `g • S` on the two pairings. The preceding inverse form at line 138 includes a determinant power; replacing the inverse with the adjugate absorbs that power, not the domain change.

Restore the domain and determinant condition in R14.1 target 2. Keep the note's separate statement that the final Hecke-operator adjoint theorem is unproved. The exact source identity has no integrability hypothesis because it compares totalized set integrals by change of variables; adding such a premise is unnecessary. Nothing here proves relations among geometric correspondences.

### 3. Multiplication-isogeny kernel cardinality — confirmed, medium

[card_ker_mulByIntIsogeny](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/KernelCard.lean#L117) includes the elliptic-curve and algebraically closed field assumptions, the witness used to construct the multiplication isogeny, and nonvanishing of the image of the integer n in the field. It counts the point kernel by `n.natAbs ^ 2` using separable degree.

Restore invertibility of n in M5 target 1, as the audit already does in R12.1 target 5. An algebraically closed field can have positive characteristic; that adjective does not supply the missing hypothesis. Scheme rank and cardinality of geometric points must remain separate. The genus-one moduli comparison remains absent.

### 4. Gordan's equalizer form — confirmed, medium

[Submonoid.fg_eqLocusM](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Finiteness.lean#L627), with its `to_additive` counterpart, is existing finite-generation algebra. I read the section hypotheses at line 579 and the proof through line 628. Its source is canonically ordered, cancellatively ordered and well-quasi-ordered; the target is cancellative. Finite powers of the naturals give the nonnegative-integer solution form singled out by the additive docstring. The supporting `fg_of_divisive` declaration starts at **586**, a one-line locator refinement to the finding.

The audit's blanket absence claim should credit that theorem as related evidence. The proposed repair correctly leaves open the cone/lattice identification and the specific affine toric scheme, localization and gluing construction. A theorem about a finitely generated equalizer is not already a toric chart. The composite target stays partial and C0 stays partly built.

### 5. Complex-analytic vector bundles — confirmed, medium

The [bundle class](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/VectorBundle/Basic.lean#L305) differentiates transition functions over its scalar field. Taking that field to be C, with a complex-manifold model and finite-dimensional complex fibre, and choosing order omega gives analytic transition functions. This is a valid existing holomorphic-bundle interface; real smoothness with complex fibres alone would not suffice. The [analytic-order equivalence](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Calculus/ContDiff/Defs.lean#L157) and its on-set form at line 773 support that reading.

I also read the [core construction](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Geometry/Manifold/VectorBundle/Basic.lean#L586), its instance at line 598, trivial bundles at line 610 and total-space transition regularity at line 410. Thus the audit should remove its unqualified absence of holomorphic bundles. The construction still does not supply an associated flat bundle from a local system, its Hodge filtration, a flat connection or Griffiths transversality. D3's VHS target stays absent, and the citation remains related. No assertion about singular analytic spaces follows.

### 6. Diagonal and inverse weight convention — confirmed, low

The [roadmap's convention](https://github.com/CBirkbeck/tauceti-explorer/blob/d2dddd2c71ee4f4e92488cfd17f1051c87f6172d/content/campaign/ShimuraData/README.md#L29) makes the central restriction act by `t^(-n)` on weight n; the inverse weight cocharacter acts by `t^n`. The audit phrase “weight (diagonal)” loses that distinction. Rename the torus input map as the diagonal map, then distinguish its composite with h from the inverse. Keep the existing `h(i)=C^(-1)` convention and the absence classification. The source at the red team's historical commit `ca1afaab5ed1a662e8e4f8d33b1746395f3825ea` was fetched and is byte-identical to the present roadmap input.

## Evidence and validation

All source reads were on 2026-09-24. Declaration-index searches preceded actual Lean statement reads. Six files match the recursive-tree blob IDs at the exact pins; namespace and section hypotheses were included in the reads:

| Library | File | Relevant lines |
| --- | --- | --- |
| Tau Ceti f790474 | NumberTheory/ModularForms/HeckeSlash/Degeneracy.lean | 68–103 |
| Tau Ceti f790474 | NumberTheory/ModularForms/Petersson/Adjoint.lean | 96–165 |
| Tau Ceti f790474 | AlgebraicGeometry/EllipticCurve/Isogeny/MulByInt/KernelCard.lean | 42–46, 116–125 |
| Mathlib 082e2d3 | GroupTheory/Finiteness.lean | 577–628 |
| Mathlib 082e2d3 | Geometry/Manifold/VectorBundle/Basic.lean | 288–321, 410–423, 580–617 |
| Mathlib 082e2d3 | Analysis/Calculus/ContDiff/Defs.lean | 147–161, 773–775 |

The six original audit targets and notes were compared with the findings, including the two already-qualified comparison notes in R12.1 and R13.4b. Roadmap context read includes ModularCurvesPartII R12.5/R13.4b/R14.1, PELModuli conventions/M5, ShimuraCompactifications C0 and its toric ownership, and ShimuraData conventions/D1/D3. No underlying audit, roadmap or red-team finding is edited by this verification. The five medium corrections are suitable for a fix job; the sixth is presentation only under the protocol's severity rule.

No Lean file was requested, changed or compiled. Source checking is not a transitive axiom audit. No new test suite is needed for these two review documents.

Validation passed: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-10.review.json`; intake `check-files` reports two files and zero problems. All six original finding IDs have exactly one verdict. The 24 guarded inputs were unchanged at `2f82d0fe011aa6415b86bed59a089ff8bf277c67`.
