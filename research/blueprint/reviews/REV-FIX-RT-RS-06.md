# REV-FIX-RT-RS-06

Independent review of FIX-RT-RS-06 (Codex, session `codex-5ebb6f`, issue #5044) for issue #5185.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-06 or its first review;
- the red team or its verification;
- the fix.

**Verdict: accepted.** No correction was needed.

**What I reviewed.** The file under review is `research/blueprint/restructure/RS-06.result.json`. I read:
- the finding (`RT-RS-06.result.json`), the verdict (`RT-RS-06.review.json`) and the fixer's report;
- the fix commit's diff of the result file;
- R01.4's stage text in `data/atlas.json`;
- the KW I preprint `results.pdf` at p. 11 (Lemmas 6.1 and 6.2), after reproducing its SHA-256 `3c389dc3…bad82`.

**What the fix changes in the result file.**
- A new top-level `componentMigrations` record.
- One new owners slice: 88 → 89.
- One new link, ArithmeticGaloisRepresentations:R01.4 → AlgebraicModularFormsAndSerreWeights:R15.4: 595 → 596.
- R15.4's `keeps` and `reason`.
- The accepted review moved verbatim into `reviewHistory`, with a pending current review.

Nothing else changed.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-06.result.json`: ok. The checker does not read
  `componentMigrations`, so I checked it by hand (below).
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.
- I re-ran `apply_restructurings` in `scripts/restructure.py` read-only against `data/atlas.json`, with all promoted
  proposals, once with the promoted RS-06 and once with this file:

| RS-06 used | Links added | Skipped links | Stage edges | Cycle |
|---|---|---|---|---|
| promoted copy | 515 | 29 (the UPSTREAM contracts) | 6,591 | no |
| this file | 516 | the same 29 | 6,592 | no |

The only difference is R01.4 → R15.4.

## RT-RS-06/1 (medium, missing): the mixed source node's components. Right.

The verifier asked for four things: keep the stable node as an alias; route each component to a named owner and phase;
update gaps[4]; and keep early R01.4 free of modularity inputs. The file does all four:
- **The alias.** The stable node ClassicalSerreModularity:R27.1/dickson-and-the-dyadic-solvable-refinement is kept as an
  aggregation/source alias. The record lists the fields and references to preserve, and it pins the source packet's
  hash.
- **Five components, each with owner, phase, inputs, sources, scope and boundary:**
  1. **Dickson classification and KW Lemma 6.1** go to R01.4. Its stage text plans finite images, "behaviour under
     restriction to cyclotomic fields" and "bad-dihedral representations in the precise source sense". The component's
     boundary excludes any modularity or weight conclusion.
  2. **KW Lemma 6.2(i), odd-p dihedral modularity,** goes to R17.5.
  3. **The p = 2 branch** goes to R17.6. It keeps the Serre-trick/Wiese route and says that reading KW does not prove
     Serre's or Wiese's inputs.
  4. **The exact weight and level** go to the R20.2–R20.4 contracts, assembled at R20.5 after a modularity witness.
     R20.5's Wiese branch stays separate from the Buzzard and ℚ(i) branches, and R27.4's late dyadic completion is
     excluded as a premise.
  5. **KW Lemma 6.2(ii) / DP Lemma 1.14** go to a named application at R15.4 (`proposedNodeId`
     `…R15.4/bad-dihedral-normalized-weight-application`).
     - Its statement matches KW p. 11: "If ρ̄ is of S-type, p ≥ 3, 2 ≤ k(ρ̄) ≤ p + 1, and ρ̄|_{G_{ℚ(µ_p)}} is reducible,
       then ρ̄ has weight either (p+1)/2 or (p+3)/2".
     - It keeps DP's niveau labels (p = 2k − 1, p = 2k − 3). Its p = 5 test (k = 3 and k = 4) is right.
     - It excludes p = 2 and unnormalized weights.
- **gaps[4].** The unread Ribet Proposition 2.2 gap now travels with the R15.4 application, and R01.4 supplies only the
  image identification.
- **Order.** In the restructured graph with this file, every component's inputs are upstream of its owner, and none is
  reversed:
  - R01.4 → R15.4, R17.5 and R17.6;
  - R17.5 → R17.6;
  - R17.5, R17.6, R15.4 and R20.2–R20.4 → R20.5.

  Only R01.4 → R15.4 is new, and it closes no cycle. R01.4 gains no modularity input, which is the phase guard the
  verifier asked for.
- **R15.4's `keeps`** now owns the named application and says that it neither defines the recipe through modularity nor
  supplies residual modularity.

## For the maintainer

- **Promotion.** `data/restructure/RS-06.result.json` holds the previously accepted file until this one is promoted.
- **The component contracts** bind the owning blueprints (R01.4, R17.5, R17.6, R20.5, R15.4) when they integrate the
  alias node. The fixer notes that Serre Proposition 10, Wiese Lemma 2 and Theorem 1, and Ribet Proposition 2.2 are
  still unread by their owners.
