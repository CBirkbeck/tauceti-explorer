# Handoff: REV-FunctionFieldArithmetic~2

Claude (Opus 5.5), session `claude-yjyOkZ`, issue [#9262](https://github.com/CBirkbeck/tauceti-explorer/issues/9262), 17 October 2026, branch `claude-yjyOkZ-rev-ffa2`. **The review is complete: accepted, with corrections made in place.** The report is [REV-FunctionFieldArithmetic~2.md](../reviews/REV-FunctionFieldArithmetic~2.md).

## Owner moves applied in the packet

| Result | Owner now cited | Formerly |
| --- | --- | --- |
| Degree-sensitive function-field Chebotarev | DeligneWeightsAndPurity:DWP.3/function-field-chebotarev | FA.5/degree-sensitive-chebotarev, now a comparison receipt |
| Recognition of lisse sheaves on a curve by Frobenius polynomials | ArithmeticGaloisRepresentations:R01.5/curve-recognition-from-an-open-subset | FA.5/frobenius-semisimple-determination, now a comparison receipt |
| Curve Weil bound over every finite extension | EtaleDualityAndPerverseSheaves:EDC.7/weight-weil-estimate-for-curves | the WeilConjectures WC.5 stage and its request |
| Tsen; Lang for smooth connected groups over Fq | SchemeAndStackFoundations:SF.2/tsen-theorem; ReductiveGroupsPartII:RG2.3/lang-theorem | part of request-generalized-picard |
| Cl⁰ ↪ Pic⁰ comparison | SchemeAndStackFoundations:SF.3/degree-zero-class-comparison | implicit in FA.1 |

## For the maintainer

- **Stale lower-tier citations.** These lower-tier plans still cite FA stages for results they or their packages now own: ArithmeticGaloisRepresentations R01.5, the DeligneWeightsAndPurity--DWP.0 part packet, ArithmeticGaloisDuality R02.3/R02.4, and AutomorphicLFunctionsAndLocalFactors AL.3. Until they are retargeted, the atlas build skips the cycle-closing link R01.5→FA.5. The packet's `restructure` entries 1–3 say what each owner holds and what FA keeps.
- **Geometric class field theory of curves** needs one owner: FA.4 (GEO-RAY) or InverseGaloisAndArithmeticFundamentalGroups IG.1 (restructure entry 4).
- **Upstream note for TauCetiRoadmap PR #858** (ArithmeticGaloisDuality §R02.3.2): Schmidt's surjectivity, and the norm-group clause of the function-field class formation, have no proof route there.

## What remains for the roadmap

- The five gaps: LEAN-INTERFACES, GEO-RAY, RG-RED, GENERAL-POINT-COUNT and TORSION-DETERMINANT. The last now names Deligne, SGA 4½, "Fonctions L modulo ℓ^n et modulo p", Théorème 2.2, as the published source to read.
- The 27 requests.
- Incoming requests the plan does not answer, listed in the report.

No scratch file is needed to continue.
