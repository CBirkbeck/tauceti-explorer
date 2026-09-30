# Review: RT-AUDIT-34 (red team of the library audit AUDIT-34)

Job `REV-RT-AUDIT-34` (issue #4455), by Claude Code, session `cc-f805bf`, 30 September 2026.

**Independence.** This verifier did none of AUDIT-34, REV-AUDIT-34 or RT-AUDIT-34, and the session id appears in none of their files. AUDIT-34 came from the local lane claude4/1, REV-AUDIT-34 from cc-7b31c4, and the red team from the Codex session codex-a71f92.

**Disclosure.** This session has worked on potential-automorphy material elsewhere:
- it red-teamed the paper extraction BCGP-21 (PR #4750);
- it red-teamed Allen-type potential automorphy material through the KW09 and BHKT red teams;
- it wrote FIX-RT-AREA-automorphic-1, which records the state of the IntegralHeckeAndGaloisDeterminants packet.

Findings touch these areas as follows:
- **Finding 2** concerns PA.2.
- **Finding 1** authorizes a wording change to a PA.5 note.
- **Findings 1 and 3** concern R24.x stages of PotentialModularityAndCompatibleSystems.
- **Finding 4** names IHG.1 as a supplier.

None of the files verified here was written or reviewed by this session.

**Method.** Each finding was checked at its evidence:
- the audit entries in `research/blueprint/audit/AUDIT-34.result.json` and its embedded review, which records no correction to any entry attacked here, and `research/blueprint/reviews/REV-AUDIT-34.md`;
- the stage texts in `research/blueprint/atlas/roadmaps/*.json` and the roadmap documents under `content/campaign/`, including the AutomorphicCongruences and IntegralHeckeAndGaloisDeterminants documents and the IntegralHeckeAndGaloisDeterminants packet;
- every cited declaration at [Mathlib 082e2d3](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174) and [Tau Ceti f790474](https://github.com/TauCetiProject/TauCeti/tree/f790474821cf4256814db967cb154e7af3d0c369), with section variables and docstrings, and line numbers cross-checked against the baseline `declarations.tsv`;
- my own searches of both trees: continuous actions, lim¹ and derived limits, Mittag-Leffler, de Rham and Weil–Deligne, and congruence modules and ideals.

This is a check of statements and sources. Nothing was compiled in Lean.

## Verdicts

**4 confirmed, 0 rejected.** All four are medium, so all four go to the fix job. Each reason below states the authorized fix scope. Where it differs from the red team's proposed fix, the fixer follows the reason.

| Finding | Kind | Severity | Verdict |
| --- | --- | --- | --- |
| RT-AUDIT-34/1 | library-claim | medium | confirmed |
| RT-AUDIT-34/2 | library-claim | medium | confirmed |
| RT-AUDIT-34/3 | library-claim | medium | confirmed, description corrected |
| RT-AUDIT-34/4 | duplicate | medium | confirmed, scope narrowed |

## RT-AUDIT-34/1: ContRepresentation on R24.2

**Confirmed.** [`ContRepresentation`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Continuous/Basic.lean#L54) (`:54`) has a single field, `G →* V →L[R] V`, under `[Monoid G]`. There is no topology on G, and the docstring says the action is not assumed continuous.

For a Galois representation on a finite-dimensional space over a finite extension of ℚ_p, continuity of each operator is automatic. R24.2 asks for continuity in the group variable. So calling it "the right ambient notion" is false.

The alternatives:
- `TopRep` (`TopRep.lean:31`) wraps a `ContRepresentation`, so it has the same limitation.
- `Action.IsContinuous` (`Action/Continuous.lean:60`, `ContinuousSMul G`) and `ContAction` (`:74`) do express group-variable continuity, generically.

**Scope.**
- **R24.2 target 1 (zero-based).** Rewrite the note. Optionally add `Action.IsContinuous` and `ContAction` as related.
- **Unchanged.** Keep `ContRepresentation`, the partial status and not built.
- **Optional qualification.** The same "operators only" wording may be applied to the `ContRepresentation` clause of PA.5 target 0 and to the SerreWeightAndLevelOptimisation summary, without other changes.

## RT-AUDIT-34/2: derived limits on PA.2

**Confirmed.** The only citation, [`CategoryTheory.Limits.lim`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/CategoryTheory/Limits/HasLimits.lean#L541) (`:541`), is the ordinary limit functor.

Neither tree has lim¹, derived tower limits or their control. Mittag-Leffler appears only for functors to `Type` (`CofilteredSystem.lean`).

Against the red team, two corrections:
- Mathlib does have `Functor.rightDerived` (`Abelian/RightDerived.lean:109`), so R^n lim is formable in principle.
- Its "TC.2 target 3" is one-based.

**Scope.**
- **PA.2 target 4 (zero-based).** Rewrite the note to credit ordinary limits and the generic derived-functor and finite-generation groundwork. Say that the derived tower limits and every bound PA.2 asks for are absent.
- **Citations.** Keep `lim`. `Functor.rightDerived` may be added as related.
- **Unchanged.** The status, the verdict and the summary.

## RT-AUDIT-34/3: B_dR on R24.6

**Confirmed.** [`BDeRham.lean`](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Perfectoid/BDeRham.lean#L64-L93) defines three things:
- `fontaineThetaInvertP` (`:64`);
- `BDeRhamPlus` (`:77`);
- `BDeRham` (`:90`).

The hypotheses are p prime, p not a unit and R p-adically complete. So the note's "only the first step towards B_dR" is false.

One correction to the red team: `BDeRham` inverts the images of the *single generators* a with ker θ = (a). When ker θ is not principal, nothing is inverted.

Neither library has D_dR, de Rham or Weil–Deligne representations, or a lifting theorem.

**Scope.**
- **R24.6 target 3 (zero-based).** Add `BDeRhamPlus` and `BDeRham` as related, giving three declarations.
- **Note.** Rewrite it to credit these definitions with their hypotheses and limited API.
- **Unchanged.** Absent and not built.

## RT-AUDIT-34/4: congruence-module ownership on R20.1

**Confirmed.** AutomorphicCongruences:L0 opens "Import congruence ideals/modules, … from IntegralHeckeAndGaloisDeterminants". Its document's scope says generic "reducibility/congruence ideals and extension classes are owned by IntegralHeckeAndGaloisDeterminants". So the audit's "owns the congruence-module construction" is wrong.

IHG.1 develops "reducibility ideals, extension modules and the lattice constructions used by congruence arguments". Against the red team, two points:
- IHG.1 does not name congruence modules explicitly. The packet on main has IHG.1 nodes only for Cayley–Hamilton algebras.
- IHG.5's congruence clause concerns local conditions and lattice choices, which R20.1 does not ask for.

Neither library has a congruence module or ideal.

**Scope.**
- **L0 entry.** Rewrite it as a consumer overlap.
- **IHG.1.** Add `IntegralHeckeAndGaloisDeterminants:IHG.1` as the general supplier, noting that it does not name congruence modules explicitly.
- **Not authorized.**
  - Adding IHG.5.
  - Adding packet requests in this audit fix.
  - Changing R20.1's statuses or its not built verdict.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-AUDIT-34.result.json research/blueprint/redteam/RT-AUDIT-34.review.json` reports `ok` for both files.
- `python3 research/blueprint/intake.py check-files` on both deliverables reports 2 files and 0 problems.
