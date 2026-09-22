# Handoff: PAPER-CALEGARI-DIMITROV-TANG-25

Claude Code, session `cc-d67081`, 22 September 2026 (issue #1414).

## Done

The extraction is complete. The whole published article (JAMS 38 (2025) 627–702, publisher offprint) was read. It was compared in full with arXiv v4, and with v1–v3 for the history of the source issues. Every missing item is routed exactly once, and `scripts/check_paper.py` reports ok.

Deliverables:
- `research/blueprint/papers/PAPER-CALEGARI-DIMITROV-TANG-25.result.json`;
- the report `research/blueprint/papers/PAPER-CALEGARI-DIMITROV-TANG-25.md`.

## Judgement calls for the reviewer

**Three Part IIs rather than one new roadmap.** This follows PROTOCOL §15: each general theory goes to its owner.
- `NoncongruenceModularForms` (Part II of Tau Ceti ModularForms) takes the modular-forms and group-theoretic line, including the λ-covering. ConformalMapping and BelyiMaps assign the λ-covering to the modular-forms family, but no layer plans it.
- `ArithmeticAlgebraizationAndHolonomyBounds` (Part II of DiophantineApproximationAndTranscendence) takes §2.
- `PuncturedPlaneUniformizationAndValueDistribution` (Part II of Tau Ceti ConformalMapping) takes §§5–6, Nevanlinna theory on the disc and linear ODEs in the complex domain.

The imports between them are acyclic (see the report).

**Owners chosen for general inputs.**
- Shimizu's lemma goes to the ConformalMapping Part II, because FuchsianOrbifolds is Tau Ceti work and does not state it.
- Lazard's cohomology theorem is a source of NE.0.
- Künneth and the universal coefficient and Sylow reductions are a source of ArithmeticGaloisDuality D7.
- H¹(SL₂(𝔽_p), ad⁰) is a source of ArithmeticGaloisRepresentations G7.

A reviewer who prefers other owners should move these single items.

**Near misses recorded as missing.**
- Mathlib's `ModularForm` is holomorphic at the cusps.
- Mathlib's Nevanlinna counting function and characteristic are the plane versions. Only `ValueDistribution.proximity`, a plain circle average, is marked library.

## Source issues

E1 and E6 matter most.
- **E1.** Lemma 4.5.11's N = 5 line prints 𝔽₃ for 𝔽₅, and as printed it is false. Check it by inflation–restriction: SL₂(𝔽₅) is perfect and H¹(SL₂(ℤ), 𝔽₃) = 𝔽₃.
- **E6.** The kernel of π in §4.4 is not Γ(Np) when N > 2. The repair runs the argument on Γ(N) ∩ Γ₀(p).

E10 (the E–K sign in §7.4.2) was found by exact series arithmetic. The scripts that checked the conformal radius, the Schwarzian identity, the ODEs of §5.1 and the q-series identities of §§1 and 7.4.2 were run in the worker's scratch space; they are not part of the repository. Each check is described in the item notes and in the issues.

## Remaining

Nothing for this job.
