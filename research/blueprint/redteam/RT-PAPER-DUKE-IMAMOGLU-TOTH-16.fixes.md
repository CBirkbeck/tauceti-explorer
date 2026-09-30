# RT-PAPER-DUKE-IMAMOGLU-TOTH-16: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #4990, job FIX-RT-PAPER-DUKE-IMAMOGLU-TOTH-16).

**Inputs.**
- Findings: `RT-PAPER-DUKE-IMAMOGLU-TOTH-16.result.json`.
- Verdicts: `RT-PAPER-DUKE-IMAMOGLU-TOTH-16.review.json`, from ChatGPT session gpt6-c84e12. Of sixteen findings, fifteen
  are confirmed and /8 is rejected.
- This job applies the six medium findings (/1–/6), the ones the issue lists. The low findings are not part of it;
  among them is /7, the missing `sourceVersions`.
- Where the verifier corrected a fix, I applied its version.

**Files changed.**
- `papers/PAPER-DUKE-IMAMOGLU-TOTH-16.result.json`.
- `papers/PAPER-DUKE-IMAMOGLU-TOTH-16.md`, which has a new closing section.
- `errata/PAPER-DUKE-IMAMOGLU-TOTH-16.json`, which is now superseded.

**Result.** 191 items (17 library, 11 planned, 163 missing), up from 188, on eleven routes, up from ten.

**Independence.** I did none of:
- the extraction (cc-442dc5 and the Codex checkpoints);
- its review (cc-2aeb03);
- the red team (cc-f805bf);
- its verification (gpt6-c84e12);
- the errata job (cc-fb70e5) or its review (codex-7e92bd).

## /1 (medium, error): item 141's hypothesis

- **The fix.** The first sentence is now: "Let D > 1 be a fundamental discriminant and D = d′d a factorization into
  positive fundamental discriminants (equivalently, d′, d > 0 coprime fundamental discriminants with d′d > 1; then D
  is fundamental)."
- **Why.** The review's version was false: 5·5 = 25, and 8·12 = 96 = 16·6. The fix keeps the verifier's
  requirement: D > 1 is fundamental, and the factors are fundamental and coprime.
- **Scope.** The note says this corrects the extraction. It is not an error in the paper's Theorem 3.

## /2 (medium, missing): the Rankin–Selberg norm adapter

**Item 151 is restored.** It is missing, routed to AL.3 (route 5), and states that ⟨φ,φ⟩ = 2L(1, sym²φ)/cosh(πr).
It spells out:
- the a(1) = 1 normalisation and the leading Fourier factor 2;
- a polynomial bound L(1, sym²φ) ≪ (1 + r)^A, which is all the correction needs.

**Its note** records:
- the inputs: Rankin–Selberg unfolding in the paper's normalisations, with Humphries–Nordentoft (4.2) and (4.5), as
  the errata review checked;
- a route to a polynomial bound: the symmetric-square functional equation with the convexity bound;
- that, as the verifier asked, the r^ε bound quoted in item 150 is not certified and is not needed.

**Other items.** Items 150 and 153 and E6 now resolve to item 151 again.

## /3 (medium, duplicate): the form character has one owner

- **The move.** Items 101 (the definition of χ_d(Q), including the zero branch) and 102 (independence, invariance
  and the parity law) move from route 10 to route 1, whose stages now include GN.2.
  - PAPER-BRUINIER-EHLEN-YANG-21/11 routes the same function there (Gross–Kohnen–Zagier I.2).
  - Following the verifier, GN.2 is chosen because it is the coherent common owner of the form carrier, not
    because of acceptance order.
  - The verifier also said the parity law can live with the form character, so it moves too.
- **What stays in MultiquadraticPartII.** Only the new item `form-character-ideal-comparison`: χ_d(Q_A) = χ(A) for
  fundamental D.
- **Briefs and reasons.** Route 10's brief now imports the form character and proves only that comparison. Route
  1's reason explains the ownership.
- **For the maintainer:** PAPER-BRUINIER-EHLEN-YANG-21/11 now serves both papers at GN.2.

## /4 (medium, error): FuchsianOrbifolds already plans the cofinite case

- **Item 17** (area(F) = π/3) is planned at Tau Ceti FuchsianOrbifolds Layers 2 and 4, which cover the polygon and
  orbifold Gauss–Bonnet formulas.
- **`modular-group-generators-and-signature` is split three ways,** as the verifier asked:
  - the new library item `sl2z-generators` cites `mathlib:SpecialLinearGroup.SL2Z_generators`, which I read at
    FixedDetMatrices.lean:274;
  - the passage to PSL(2,Z) is a one-line quotient adapter, now stated in the item itself;
  - the signature (0; 2, 3; 1, 0) is planned at Layer 6 (the level-one signature) and Layer 2 (the triangle group).

  Both items 17 and `modular-group-generators-and-signature` leave route 9.
- **Items 22 and 23** are restated as the extension to Nielsen cores of groups of the second kind (t ≥ 1). They
  import the cofinite signature and area formula of Layer 4.5.
- **Route 9's brief** imports those layers and says not to re-prove the cofinite case.

## /5 (medium, duplicate): Bessel functions, Laplacian and Kloosterman sums have one owner, QM

- **Items now planned at QSeriesPartitionsAndMockModularForms:**
  - item 111 (I_ν, J_ν), at QM.2;
  - item 87 (the Kloosterman sum), at QM.3;
  - item 56 (the hyperbolic Laplacian), at QM.3.

  Each note names the QM packet node: QM.2/modified-bessel-function-i, QM.2/bessel-function-j,
  QM.3/classical-kloosterman-sum and QM.3/weight-k-hyperbolic-laplacian with k = 0.
- **Checking the nodes.** The verifier could not open that packet; I read the four nodes. QM's Bessel definitions
  are for complex z, and item 111 restricts them to y > 0. QM's Kloosterman sum is item 87's under v = ā. The
  packet's own review is pending.
- **`bessel-equation-liouville-form`** is an adapter with its own hypotheses. Following the verifier, it is not
  identified with the definition: it is routed to QM.2 by a new source route 11.
- **Routes 2 and 8.** Their reasons no longer claim these objects. Route 8 keeps the Burgess item.
- **Item 74.** The red team's proposed relation was wrong, as the verifier showed, and item 74's note now records
  the correct one: Δ_{1/2} = y^{1/4}Δ_hol,1/2 y^{−1/4} + 3/16. I re-derived y^{k/2}Δ_hol,k y^{−k/2} = Δ_unit,k +
  k(k − 2)/4 by hand; the constant is k(k − 2)/4 = −3/16 at k = 1/2.

## /6 (medium, other): one active record per mistake

- **Why the fix is needed.** `scripts/errata.py` collects the `sourceIssues` of both files, with no deduplication,
  as the verifier found. Renumbering alone could not work. The fix uses the canonicalization already used for
  PAPER-FU-24.
  - The extraction's records are the single active records.
  - The errata file's 14 records move to `supersededRecords`, each with `sameAs` naming its active record. Its E1–E11
    are the extraction's E1–E11, and its E12, E13 and E14 are the extraction's E15, E16 and E21.
  - The errata file's `sourceIssues` becomes empty, and `supersededBy` explains why.
  - Each active record carries the errata record, with its locator, kind, reach and independent verdict, as
    `errataRecord`.
- **Conflicts, reconciled on their merits.** The verifier said not to prefer the later review merely because it is
  later.
  - **E5: "a stated result".** The remark's bound ℓ_A < c log ε_D is itself a stated, false assertion; the verifier
    notes that "an unnumbered false assertion can still affect a stated result". Nothing uses it.
  - **E6: kept as "error", "a stated result".** The errata review confirmed a gap and did not attempt a
    counterexample. The extraction's review gave one: the CM case D = −4 with the local Weyl law, and φ(i)
    recomputed to match p. 967. That makes the printed (6.6) false.
  - **E11: kept as "gap", "the proof".** The errata review's rejection is recorded. Both reviews agree Lemma 7 is
    true and no step is false; they differ on whether two unstated routine steps are a gap.

  Each decision is written in the record's `reconciliation` field.
- **Result.** I ran `errata.collect()` on the tree: this paper now yields 34 register entries with no duplicate ids,
  where it had 48.

**For the maintainer:** rerun `scripts/errata.py` to regenerate `research/errata/REGISTER.md` and
`data/source-issues.json`. Those files are not deliverables of this job.

## Checks

- **`check_paper.py`:** ok. Every missing item is routed exactly once. Items 66 and 134 were planned but on routes
  before this fix, and `check_paper.py` accepts that, so I left them.
- **`check_errata.py`** on the errata file: ok.
- **`source_issues.check_issues`:** no errors.
- **`intake.py check-files`** on the four deliverables: no problems.
- **Formatting.** Both JSON files keep their formatting (indent 2, UTF-8).
- **Sources.** I did not re-read the paper. Its quotations are the red team's and the verifier's.
