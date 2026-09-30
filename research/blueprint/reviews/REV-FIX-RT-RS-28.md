# REV-FIX-RT-RS-28

Independent review of FIX-RT-RS-28 (Claude Code, session `cc-39fac3`, issue #3996, PR #4466) for issue #5188.

Reviewer: Claude Code, session `cc-c2c06b`, 30 September 2026. I did not write:
- RS-28 or its first review;
- the red team (`cc-7b31c4`) or its verification;
- the fixes.

**Verdict: accepted.** No correction was needed.

**What I reviewed.** The file under review is `research/blueprint/restructure/RS-28.result.json`. I read:
- the findings (`RT-RS-28.result.json`), the verdicts (`RT-RS-28.review.json`) and the fixer's report;
- the fix commit's diff of the result file, compared owner row by owner row, link by link and layer by layer;
- the stage texts of FunctionFieldArithmetic:FA.4, KTheoryFiniteLocalFields:L.5 and MotivicEtaleKTheory:M.5d in
  `data/atlas.json`.

**Checks.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-28.result.json`: ok. The file has 24 owners
  rows and 57 links, as the report says.
- **Reachability** over the atlas stage edges and `requires` lists, plus RS-28's 57 links:
  - HL.3 does not reach FA.4, so the new link FA.4 → HL.3 is acyclic;
  - HL.2 does not reach L.5, so L.5 → HL.2 is acyclic;
  - no RS-28 link ends at FA.4.
- **Other restructurings.** No other result file owns the logarithmic/DVR comparison or the Bloch–Gabber–Kato theorem.
- `research/blueprint/intake.py check-files` on the two deliverables: no problems.

## /1 (high, rejected): no change needed

The verifier rejected the cycle claim and left its substance to /2. After the fix, no RS-28 link runs from the family
into FunctionFieldArithmetic.

## /2 (high, duplicate): FA.4 left to its own family. Right.

Every change the verifier authorised is in the file:
- **Row 16 is gone.** It moved equal-characteristic p-primary local existence from FA.4 to HL.3.
- **Rows 13–15** keep only HL.3 in `formerly`.
- **The four links into FA.4 are removed:** HL.3 → FA.4, and CFT Layers 6, 7 and 8 → FA.4.
- **The import is recorded in both directions:**
  - the new link FA.4 → HL.3;
  - FA.4 in HL.3's `suppliedBy`;
  - HL.3's `keeps` and `reason`;
  - the three CFT → HL.3 link reasons.

  HL.3 imports the existence and the injectivity/completion of the same Artin map, and it combines them with CFT Layer
  8 without re-proving them.
- **The roadmap reason** names FA.4 as the owner.

## /3 (medium, duplicate): L.5 owns the logarithmic/DVR comparison. Right.

The fix makes the four changes the finding and the verifier specified:
- a new owners row, "Logarithmic/DVR de Rham–Witt comparison for complete discrete valuation fields", with owner L.5 and
  `formerly` HL.2;
- L.5 added to HL.2's `suppliedBy`;
- the link L.5 → HL.2;
- HL.2's `keeps` narrowed to the higher-field Artin–Schreier–Witt pairings and wild duality built on L.5's comparison.

L.5's stage text supports the row: "own the logarithmic/DVR comparison needed by the calculation here". The shared
reasons of the seven links into HL.2 now name L.5.

## /4 (medium, error): M.5d narrowed, Bloch–Gabber–Kato requested. Right.

**Row 12** is narrowed to what M.5d's text keeps: "the compatible Bockstein induction for ℓ^r, filtered-colimit and
inseparable/characteristic reductions". It says explicitly that the Bloch–Gabber–Kato differential theorem, "which M.5d
keeps separate", is not included.

**HL.2's `keeps`** follows the verifier's precision. The identification K^M_n(F)/p^r ≅ W_rΩ^n_{F,log} is an unowned
import, requested from whichever layer is to own it (L.5 widened, or a new layer). It is not proved in HL.2, not taken
from M.5d, and not attributed to L.5, whose comparison is only an input to it. A result file has no `requests` field,
so recording the request in `keeps` and in RS-28.md is the right form.

## /5 (low): the declared base. Right.

The roadmap reason now says that the base is recorded as the declared base (`extends`, with its declared roadmap edge),
and that the build sorts prerequisite lists alphabetically. `extends` is `tauceti:TauCetiRoadmap/ClassFieldTheory`.

## For the maintainer

- **FA.4's stage text.** It says "Specialize and prove the local reciprocity construction for F_{q^d}((t))" but does not
  name the equal-characteristic p-primary local existence theorem. HL.3's new import FA.4 → HL.3 therefore rests on
  RS-04's pending owners row, "Full equal-characteristic p-primary local and global function-field reciprocity" → FA.4.
  RS-04 is still unreviewed. Its review should make FA.4's text state the p-primary local existence and injectivity
  explicitly, as the fixer's second maintainer note also asks.
- **The Bloch–Gabber–Kato theorem** still needs an owner (fixer's request).
- **Promotion.** `data/restructure/RS-28.result.json` holds the previously accepted file until this one is promoted.
