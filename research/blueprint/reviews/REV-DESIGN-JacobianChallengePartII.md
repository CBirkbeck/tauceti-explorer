# REV-DESIGN-JacobianChallengePartII — accepted with corrections

Independent reviewer: Codex, session **codex-J6LwjP**. Refs #3554. The designer was **codex-rtOQ9t** (#3341); this session did none of the reviewed design. The bot confirmed claim comment5985936041 in comment5985937359 before work began. Immutable review base: `66f4e8f689a1fc6b91a296e49c105d8b78264000`.

The complete **target-level** pass is accepted. All48 nodes have an individual checked record; all11 baseline declarations were independently read at their recorded pins. All24 routed requirements have the right algebraic targets, and all8 stages JC0–JC7 remain **planned**, with zero closed stages. The packet retains14 precise gaps and13 supplier requests. Acceptance certifies the plan’s recorded contracts and boundaries; it does not certify proof closure or implementation.

There are4 definitions,13 constructions,10 lemmas,11 theorems,8 comparisons and2 applications. The17 definitions/constructions have60 API items and52 discriminating tests; each has at least3 tests. All24 planets remain mathematical objects or named results, within the six-per-layer limit. No nodes were added or removed, and every implementation status remains unchecked.

## Corrections

- Replaced every node’s generic source match with a locator-specific review explanation; supporting citations to a second source now use that source’s own ID. TheoremA.3 is in Yuan’s **A.4**, with the axis-normalized discussion in A.3. BLR9.4 Proposition4’s printed proof ends on **p.261**, so the p.262 reading claim was removed. Milne’s June12,2021 corrected notes were downloaded and hashed.
- Pinned the signed Poincaré construction. For evaluation-normalized U with U_b=b and φ_L(a)=t_a*L⊗L⁻¹, Yuan’s negative addition formula uses **(id,−λ_X)*U**. BLR’s positive addition bundle on p.261 is its dual. The zero-fibre normalization and comparison on nonreduced test schemes remain explicit proof obligations. The principal polarization itself remains positive.
- Wrote the obstruction sequence with **H²_fppf(G_m)** and its Leray boundary. This is cohomological Brauer theory; no Azumaya comparison is assumed. The identity section splits the Jacobian sequence, while the curve’s actual Picard classes remain only injectively comparable when it has no section.
- Replaced inherited smooth-family hypotheses on the pointed-square comparison and stable Hodge-line result with their exact local hypotheses. Made g>1 explicit on the canonical-shift results. The universal Faltings–Zhang application is an arbitrary pullback from the noetherian fine-level source, so it does not require the new base to be noetherian.
- Imported nodal Gorenstein duality, rank-g coherent cohomology and the proper-family fibrewise ampleness criterion from **upstream StableReduction Layer2**, whose statement was read. Removed the stable-duality demand from the field-only Jacobian B request and the ampleness demand from the Hilbert R09.2 request. The generic JC0–JC5 development remains independent of MC.4 fine-level moduli. Added the direct A1 square/cube prerequisite for inversion on geometric Néron–Severi classes.
- Added six API items: degree inversion, torsor action/difference compatibility, Jacobian group law, the difference cocycle, Faltings–Zhang properness, and inverse coordinate naturality. Added one triangle-sign test. The native coordinate equivalence now displays its forward and inverse functions instead of admitting all its data. Its five API signatures and three examples remain intentional proof admissions.

The embedded change ledger records the changed fields for each of the48 nodes. Nineteen node contracts changed in their statement, hypotheses, dependencies, API or tests; the remaining changes concern citations. No baseline references were removed or replaced: their actual provides boundaries are correct. In particular, line-bundle classes supply only a commutative monoid, ring Picard groups do not supply a relative Picard functor, and field-valued abelian varieties do not supply arbitrary-base abelian schemes. AUDIT-02/REV-AUDIT-02 was checked for parent Jacobian A–F and the stable supplier; no built object is replanned.

## Sources and mathematical boundaries

The reviewer read Yuan’s21August2024 author manuscript pp.29–32,35–39,43–44,98–99,109–111; DGH arXivv3 §6.1 pp.23–25; Milne §8 pp.27–28; and visually inspected the BLR scan passages listed in ReviewSources.json. Yuan, DGH and BLR bytes match the designer’s hashes. The current Milne PDF has SHA256 `36c3f09c7462dbbd4ae1f8b81a02bd9ff84f03c5a346351d7d5d78fc3f173486`.

The finite-Abel finding **JacobianChallengePartII/E1** is independently **confirmed** against the matching author manuscript. A degree-zero Abel map is constant on a nonempty positive-dimensional fibre and cannot be finite. For nonzero degree, its local pointed factorization uses a closed immersion, finite multiplication and translation; inseparable multiplication is allowed. This is the known PAPER-YUAN-26/E13 finding, not a new erratum. The [Annals publisher listing](https://annals.math.princeton.edu/2026/203-1/p02) was checked for version metadata; no typeset collation or full-paper reading is claimed.

The source gaps remain real: Hilbert/quotient representability interiors, properness inputs, MFK6.9 and polarization descent, the relative Abel immersion bridge, arbitrary-divisor theta pullbacks, the extra curve-square computation, cube recurrence, nonreduced-base autoduality, preserving both projection conditions while lifting, Zhang’s axis-normalized square proof, and stable relative duality/API realization. The target-level pass records these precisely instead of asserting them as baseline facts. Metrics, adelic pairings and nondegeneracy remain external consumers. DGH’s rational moduli instance does not itself prove the integral-level application; the exact fixed-component fine-level supplier does.

## Validation

`python3 scripts/check_blueprint.py research/blueprint/packets/JacobianChallengePartII.json --index <pinned-declaration-index>` reports **0 errors and0 warnings**. A read-only adapter loads the checker and assembler from the immutable base without a repository copy or output mutation. It verifies all24 routes, all48 checked records, all47 exact omission blocks with hypotheses/API/tests, and the native forms.

With the proposed fine-level supplier assembled before its consumer, the stage graph is acyclic (**3,097 vertices /8,846 edges**) and the prerequisite closure is acyclic (**3,617 vertices /10,315 edges**). All49 required supplier-stage pairs are reachable. No endpoints are unresolved, no candidate links are skipped, and all foreign mathematical payloads are preserved. Candidate-only assembly retains exactly the pending **StableReductionPartII:MC.4 → JacobianChallengePartII:JC7** edge; combined proposed assembly resolves it without adding fine-level dependencies to earlier generic stages.

The entire reviewed suggested file compiled against the **existing** Mathlib082e2d3 build and Lean4.34.0-rc2, serially with one thread, an8,192MB limit and a1,200-second timeout. Fresh preflight reported35GiB available. It exited0 in **2.30seconds**, with3,392,132KiB maximum RSS, **0 errors and9 admission-only warnings**. This checks one native represented-point equivalence, five API signatures and three examples. The47 geometric interfaces are individual omission comments, not executable declarations; none of their signatures compiled. No Tau Ceti compilation claim is made because an existing build at the exact Tau Ceti pin was unavailable. No Lake setup, dependency build or language server was started.

## Handoff to the orchestrator

1. **Regenerate `research/blueprint/readmes/JacobianChallengePartII.md`** from the accepted packet and definition before presenting its contracts as synchronized. That file is outside this review’s four authorized deliverables. The embedded ledger identifies the19 changed node contracts, including sign, Brauer, local-hypothesis and supplier changes, plus six API items and one test. Its existing designer counts and supplier summary also need updating. No unlisted file was edited.
2. Integrate the MC.4→JC7 edge after independent acceptance of the fine-level supplier. Its exact proposed full-level and fine-scheme statements were read; it remains a proposed input rather than a library theorem. Proof-refinement and typed-interface work remains in the packet’s precise remaining lists.

## Reproduce the checks

Six compressed receipts and four authenticated helpers follow. Inspect the helpers, then run `review-recover.py <new-on-disk-directory> <published-40-character-head>` to recover the immutable public inputs and receipts. Set TAUCETI_REPO to an existing checkout containing the recorded base and TAUCETI_INDEX to the pinned declaration index, and run `review-verify.py <recovered-directory>`. Its output must equal Verification.json. The adapter refuses writes to the repository; it does not compile Lean. The compile helper accepts the recovered directory, an existing exact-pin Mathlib build, an existing Lean executable and Published.lean, and checks pins and fresh memory before one serial invocation. Source PDFs and extracted texts are disposable and are not embedded.

<!-- JACOBIAN INDEPENDENT REVIEW METADATA
{
  "base": "66f4e8f689a1fc6b91a296e49c105d8b78264000",
  "reviewerSession": "codex-J6LwjP",
  "designerSession": "codex-rtOQ9t",
  "claimIssue": 3554,
  "claimComment": 5985936041,
  "botConfirmation": 5985937359,
  "artifacts": {
    "ReviewSources.json": {
      "bytes": 2246,
      "sha256": "d936e4cd6ef97f069977e8117e6de51c2134ba6b1427c91640dde49714266bd2",
      "data": "eNqdVttu3DYQffdXCO7r6kJSV/fJsZ3WQRIEtmsUKIJgRA5XTLSSQEprb4IU/Yd+RP+jn9Iv6VC79tqNkwJ5Ea/DmXPmDKlPB0FwqGDEw6PgkCc8D1kSJtnhws9bXBu8QevXLs6uw9Ozy/OfXocvQPa1ge6kgbbFbolvwI7n51sb109WoiOT32gYBJ/mLy0Y5Y/ZTNDNG+e5ejPOW/NKiDS9n3YN8Cz322uR67TMEykTnVQl6iTnGRdYQsbSAktWcMUwRZEVWhY55EKqQiaqKDmUTODe1QpG2aA7RWeW3QxptBPeL0+29f6acRyO4liDnNpxE9VGrmw0fJgiVFMku/j3ze0mHiwO1nSji2t/lnPvoFPv6n7Zr/q2X0eD0ofzuZ8XT1Ggls0TDBRFWmZPMJBpWWKZ60wgpgIrxWjIRQWlqqsyr7UuUsYyRaO0gBp1WiUciBaFQpSQfg8DjigAe2vWUW+XMcGJeZKwiCW8yNfiW9jq1n6JjeU5y1LxFLqyzFkihdY1pIiAshBlXecigywFxmWhFQlA5lVWFUmaVSzVWOdaCAW8TAG+H51szBojsmoisOZj34HPcSzBuNhJ6Fz87OVF+Bpt37171StsXdz5Qfp/6V2ZtsMvScgEFyV/ggKRE/6kkkWac1XXKgVkuqxLBgmvVaV1mepEyAxESrwwVaiM5K3JiBWCauNbFGho3Vc5uLm5id7P0c5p9lTEt11P4cYvrt0DmPR9O9f2gNYRUW27uUDwYLfQt0V9V/B+3xDx6p8//hR8ITLfVotUUEslXpXUVtWCJX4DY+zH4DgSgXFB39FcQJUUXDXYW1zt5k1HO1K/zJKtyTast1tcczk98A32V7Nei+Dvv/KIBT4S75lniwDaJdYWjAymjnJvHbShBiJgM3tVRmu02EkMV70dGuNWgew7RzKSo+m7x163WX7g98XUIeMLukIZmVmLckQVzHRSLOUcSeEjKRcESbaTMt3yDmpJofoYanAYygboTg0GsLC0MDSPHfsKe+D22rgJWjrRDTiHGfQ68PrtyLv3mXDvNMkWXDDfo5zwLJkp8T2fBZ5TFsYGKe7V0OJIvv31Rge8sf3QO+PPraI0Tmmhp/OxUz5fZBcFz6e2DWC6Na0BuykjHrOF/2b0TWMxw9IGW0Wbxl5RsGbcbM9xAb0t6DkK0I1Qt8Y1qKId3oNdge1elHPnprmQdpojpcsP6EXIdsxQsrSxq0dzHd48N52n2psmu9lh2vm62gzocDzp2xbmHO9K5t73NFD+EVbbG+CeeO9rxG6MR5hCiaOJv3gT44uz49NXZ9FKHS6+YvNzr5Z4OetrslR1e4v7imsNKdZujkkt4x77+772hXz8y+n5VZjwOwfb5/rusf7v6vtdhC9hQ9p/qKHj/RXybN892XdP992zfff5Y2HOGcTTbYIvp2FozfbPgfB6uEdXMJ1Qe9GDWsEQX877L+jSnXX7Q+vjCnko+8aX4RjKya4xHH2FbMKdcEKSU7iV5JqGPoLPB58P/gXUh4cl"
    },
    "review-baseline-receipt.json": {
      "bytes": 3647,
      "sha256": "573f37b0933fcc82cba06f47b8289d96f99a49494e4aa948d0354b893ab7d866",
      "data": "eNrllk1v20YQhu/5FYLPBjX7vetb4qBugRoNYiM9BEEwszsrsaBElaIMBEX/e0dW3HwSqB3p1IOgJTnvUPvonZl9+2w2+0s+s9nZwPXsYnY24i7z2F7c4u5Svpvn3YJpwDZfcb/icfjQ/LK+42FsqeObJWM9Oz/oV33ZdbxP8VE6/0Y6/7Vd84vdunQ8f4HbNjcd4/ohwaZd79U1JLDBRq1ytdr5qGyh5EMm5SwHrKZANj49yLZLlKi9Eh0ZtK6UatiXyJnZ2EQeo5Mrb6JSOlCgSuzRlgCYg1cZjAU2bM1Dxk5+5VYSvr2/nM1CvF+8e3jhiCOveD2+ZiwSNg47lid/nz+B5Scglx1ut09kea89LktiJJfRhBi1IZ9KAdBFuahrsq6m4DkDOEGrYzaaqkkYiGKgDMqQnWJp08lYfuXLZuT1th9eDcIyj08ke/t5juMSrj5Va5ihxhptqeyq9g4KOk/J5uQKEaEGtKFSxBKVcypWJw8JEcoUYRdORvgmLyXV79x2L9u7VsA0A3c4tnf8khcD82Mgf5Zlfsg7PyQ5LmWfjVVeeR90ppANOqYgLD2kbIAhRofBgsJMmqs3pSCrqkOkTJjstI/hxJSb63uI2+ayX/arvusXHx6D95PqFJ3WJWkLhXT0IlZZl+idK8lWUNVaB+LUnClqAchkK3KVbmExRytdJCg9RdWrk1F9Tty1uH6DQ8vjo1B+qTwFTpOLd6nKkDJegmWOFdQ2SX9VrjiE4D1ockpZX3xWlVOh4tOeqLwKJnEm+0ScKxyXXUsXk+asm0297TcTtrw+yL/D8qYdeTv/afPndwlC1KyLCRwJrJfChVzIGc1KTFasERbeq2C/JahdTCoiCvqsfXHayj/gglVyJ3mkUmxNkCoEsh4ylaAYDci5wLgaIE42U3N8gqu+H5ePgXbdD5tlu11t5wftcdFlljMTs1StZoJibQr7qk1OIVZbg7ZsAUtA5CCoZPyzgPWAKYgLI03Wsj7/uIr/rlL4QZyX/Wr1ul0vmldtnka4j7hdci/sJA6HcjX0u81xsSkDpuggZSmIQMrVZ++Q9N5U1ckI0VL0kiWCN5gh6ConzQo+iy8NRz85WHT6UUYiWMjeDwSan/tVs9jvf5rXlwrx27pvC3Zyf5Byld43vxqOjC+nxHKUlAOlxJiYpR4ZDJEjFaIyrB1HhiQ90FJS5ACZNe0njHhOAicL9sj0ZOO/0R9N7leb96W9+18wVOG/QXz27h+y+gCG"
    },
    "review-changes.json": {
      "bytes": 15436,
      "sha256": "503486efa34d33869572a36853c62238bba52918b5fe4059c527af201aac6c86",
      "data": "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"
    },
    "Compilation.json": {
      "bytes": 697,
      "sha256": "a647ff87a4f47945e2b840b574ee6bab6be4d3bd66cdfdb8d7404ad2afc54b0b",
      "data": "eNpVkc2O2yAUhffzFMjrTMQ/Znb9UatqFq2aJ7jAdYJkg4tJJqOq714cR53OAgkOhw845/cDId2Sz8Xj4QRc6e6JdNoZ60CHgFpJZzgVgwfkjHpwQfayt15xz0xPLdOcc8eYaUNqJYIXNHS7lTrm4xsSkQ0UhLHaBhWQGmSUcui1Uj2FXhonemOMtVLpwXBOnadKDEYoKgcexIbEa6yfcsBGpJtQSi7Lv+ULlBTTcRXs/8JzTGF9BYQpLkvMieQ0vm7MVasVw2f0IxSobfftPF5hmkdcBbG5LxBHcCN+jR9XUW22EeYFb1fQJ8r3gm7sCa4/D4fnzSosZ4Lf9Xoao7v5e47tfwZ7R6UWsoUcnBIcGWM+SBEUaM2MvGeKkG4NAaPge9+yRwi49uJca8N67hTlTBrNB8vuTfg8zXHEcPB5XrPrvickqX31gqTgXHDB1BJ4nHNMlficS4htGwn+OscLjJg8kpdYTwSv8xh9fGcKUGFHhhX24cc3ssRjk88NSiAFUk8FG+ie4558yaW+Pi54wUSOmCesJXqSWqnLrpkxlpVyP4tLbbOC7bppam9cbr3tu4c/D38BMNHOkg=="
    },
    "CompilePublished.log": {
      "bytes": 1657,
      "sha256": "ee1f0a37969d5de07e1002a865580a847b3877799456f7220bc053f73504f2d3",
      "data": "eNqdVNtqGzEQfba/YjAUHIjdvfm2fWpDGgoNdWuSl1Ia7e7YO7FW2kja2G7pv3e0Tgm5YIpfvJbmnJmjuf3u1QaXklal66XQs2hISMAtWUdqBTUphQVkDcmidwo9cS9IikziBX1gfDziu1rka7FCy+fvvVqKxhIDPPozCrVAYfLyTBIq5++oqrVxF0bUpT/WRuvlhooVOtsGQKtr/+frnf/NhHMsiZ3/4JOuiI9FG4g9pqA05LqqSbJGSZkRZgcFGcydNrt3bHZACpBciQbyEvM1A/cKmKiw9SpZ5TUaS1r5FHjR0L/fX0AyjJNhMDB5dArb6fjnOBk0aq30Rg0kqWY7WKnm1ItgaTAWYSDyaR5FGYoCc5EVWRbMwlkeZaMgCpPJOFrOwuIUviFHtXjS+9OdN5kkW2Ix9ELScJYmKWyEUZz/FNiLFEY4r6WxaOHGamN2N89p0SQdH0GLg+No8XG040Qm0XG0aRocQRuFx9Em/0frnHGvCMUzhX7AHFVYcNf5r24chFEQgHcIg9sQBpfTcBbB01C9bueK57SlQt8iN3JhT1IIhtNxt7PYWYfVK8Yk7HbmaHKeQ9BLOJtfgSvJwq3OYKVdCqPRm27nXIra8pD0N0JKyKXO1ycPzsq0qlJrQRvwX+80DaJhHHQ773lceAWALYVhssOtA0u/mLTOdg5b7COqUQ+4QjhxAGcdb5YDdqcd76qX9kuxpaqpwKClwj/X4gs5cTyLwjh6dHYI3Pq85Xf3Dd41ZHzhPr39cgK1Zy5FI51NIZlECQNJ7YFcf6o8UsDSiAqfoadBHLHfay0b5fze4krt87Yhx6uKIWEYjrhon9T9IVDAkMWGq9bq/Mi7EOy+B0jVjQ8VTsaTySx6auRm21uZtOAq86srtNYvck6Bcq8a+FVI975hvZFWSkjLrS75zjzcztvKtfn7l74kmHFjnm95Q3JJXdMG/Qui8yn7"
    },
    "Verification.json": {
      "bytes": 3494,
      "sha256": "eec40d3d4b7dfd6c97d88d383996a0d86e2a72842eb7e8beb4589c039c187967",
      "data": "eNqVVktz2zgMvudXaHTanYkSiXrn1nV3O2m3W0/SW6cHPiCbjUSqFB037fS/L0g97PQV95DM+BMAgsCHD/xyFgQhowOEV0FYFE0GVVNUNU0aXrA6oaQuIKt5EueiYmVFiiyO4/DcefEt8Dsw6PgFfyLQU/xtXaAVVUIKauHiw6CVN8fvRlPR0d4ZvKRcM0nVakvbFtQG1tTY6+vZcrDU7gZnyHXXt2Bh/qK0APchqybgTioxLDkgIKCRSlqJ56LZ+Qy30HUUkSReILsFbaBzYLKAXKvBmh2fAiTp0Zeup0YOHq8WmPZ9Kzmd7ImHv07J0V5eW+hcfsV0brjD5N7CYB2YkwnsW6rAQ2RK2TellQqeA2+p8fGHo1TD3oCBjzs5SAuPCuBKFPzB2h30Rir7J34rl2yxshvX67w+f2xvt3IIxg46jypfvs+JuHI+ut2G9j6jOWOXznSxuWzjecO1uuW6h0PdJnzV6gEEwvEjeI3VUB6vzqbjQjBGGxf63Xv/e0+NkmpzhBi9syDmeo91DHUnLaL/zbTxlQgVlvMeZtBXdDz6+bMXBz7fg7GSe5M0rqcahiA2HqqqrJjbzB84cgBBZA4sKeu9ckf8LOZC4SVi/ut4g6uh+GmKRfJtikmcJk/E9BQyIG53jsZg1lT6KmeeH0hWA4Nu730zpjrjtW7vZI+p/CvV3VED+M4YUPbZMEDH2oc1oAiozWLk83g3s+rWUtbCDYhx1Mb5v3q9usjChXk/UYmrl6sy9Dbv8f90tu4YcnS5x8+SGK0bnHu5Ua8pSkCHXOC0XdOHFvVpWOOFwYwXdpUa+QL7v4XnMZcCr/hGtQ9v9Zu9ulkkbbF1MiHbWQ+mPg16ZzjcbinJC6+0rKwZLYSAIs9YSeK04RRIEnPKRFZlVc1zwpOyiuukIISwJCnxLyvyVPA0FrMctnpzCAqQNDFNy7qoRS4gLiGJY0KrIs+rmFZZydKqLMu6zvKiKQmJGY/ztCnTPM4aItI5KHySdoXEPZrLZfpm4Gj86sfQKxRklw0WRg4DViHQWK05tkPdQH6javVyNHV67/k8e9xTLCdy5YX8y8EzoaFF+fFtCuOrmFyk8XxGRz/d3N6+Gs3TmiQpWb7YbSuZ96kI4J1LqFicFWmGpRcsTwkkScJFloqcFjhR2VJpoMp3jiYx5RXHngAV4PrFGHap5oTlMUmysiBNnSwdGumAxJwEMHyjIBj1JzCo0Mg2hfWIeo1aHXCtDfIVN2fgBvOeIu05BHtptwF8cotGPjLCHUvPg8YFe7a+DgYkNW5ODBrgBg7s1gAGmmp6EfyjjX2IBrgHFWxAd2CN5IFfqedoDNK4KJOvU/KAGsDjug5zHHwfL8Ij6cD7mxvYgIKxkzeTmByPg4F7CfuVfyscZNhL3/fr8QfL8futEsqu203qQcUaW+rFs0h+/PEwHyIryyrNRZ3gbOHc1SKr6yavWJbyPCnzOEkb2iAgWBk3jJC8zlImCspI0jSknp89FJXIX2WllTWU24O8/UKy4ksDre97JGCDjYkcNbRypZ3J8ivvHlXKiMjiHLpRfNIjOZz3YTJ62olcooi7DGXT4PMCufe0T3o5x/ckxixPcloIGNk9rrAI+WfpKY5H5tF8xfYh8iR/2j+7xIbtaIuFXLwjzQ5vvhMi+FnFmR0+7vCy0dQZfBl22vT4juqeDpJfcqq0cpsnogzayG2RE7xwQHDnD+g1bGVjT3FpaGudVEefHXNP8fCh8X6/74n9RMsdSnt0UKnoSMp+5/he78FgEhw5Lz/T07pTzIOCrwDMYYs9wSX5cIrjSP2FzFuNKz9iOyXcQjrBf3RwT+Xf40J51NVvSu7eN2dfz/4HpOUfzw=="
    }
  },
  "helpers": {
    "review-verify.py": "3919660e20c226288f4db5b69eafa664b4f67c196a781b5ff143b3aae8e85928",
    "immutable.py": "f4fe5f25af3bdecd0550e29f4f2905c8f6d591b37803b60a6a7cebb96378358a",
    "compile-pass.py": "38d7e56d08ab81d7db0aa1afc7ef7455e433d88235ab818ca28c75d4cbfda8f9",
    "review-recover.py": "c18efd051849f94d580475f826e3af86a5010fd2b7e3fa5a6e946c19841ebaa6"
  },
  "publicFiles": {
    "research/blueprint/packets/JacobianChallengePartII.json": {
      "sha256": "fe5ba0926b48925f60ff4f689dad88c54a684b257f9318c41d878e0543484b82",
      "recoveredAs": "Candidate.json"
    },
    "research/blueprint/roadmaps/JacobianChallengePartII.json": {
      "sha256": "9125c2f7116f65188ada8a2d42c9c4220297bf09ac49d4de1235728506276698",
      "recoveredAs": "Candidate-roadmap.json"
    },
    "research/blueprint/suggested/JacobianChallengePartII.lean": {
      "sha256": "6b79ba6dde654b7203fcae210cabd48489c52c1780916222b117b114653dc30d",
      "recoveredAs": "Published.lean"
    }
  }
}
END JACOBIAN INDEPENDENT REVIEW METADATA -->

## Script: review-verify.py

```python
"""Read-only validation of this new roadmap against the immutable publication base."""
from pathlib import Path
import collections,copy,hashlib,json,os,re,sys
S=Path(sys.argv[1]).resolve();R=Path(os.environ['TAUCETI_REPO']).resolve()
RID='JacobianChallengePartII'
BASE='66f4e8f689a1fc6b91a296e49c105d8b78264000'
os.environ['STABLE_VALIDATE_BASE']=BASE
sys.path.insert(0,str(S));import immutable
immutable.install()
sys.path.insert(0,str(R/'scripts'))
import check_blueprint,blueprints,build
p=json.loads((S/'Candidate.json').read_text());d=json.loads((S/'Candidate-roadmap.json').read_text())
reader=(S/'Original-reader.md').read_text();lean=(S/'Published.lean').read_text()
ids={n['id']:n for n in p['nodes']};ownstage={RID+':'+s['key'] for s in d['stages']}
assert len(ids)==48 and len(ownstage)==8
assert p['status']=='complete' and all(c['status']=='planned' and c['remaining'] for c in p['coverage'])
assert len(ids)<check_blueprint.NODE_BUDGET==300
assert all(n['implementationStatus']=='unchecked' for n in ids.values())
assert d['area']=='arithmeticgeometry' and d['parent']=='tauceti:TauCetiRoadmap/JacobianChallenge'
assert p['part'] is None and set(p['scope'])==ownstage
assert all(len(n.get('tests',[]))>=3 and n.get('api') and n.get('uses') for n in ids.values() if n['kind'] in {'definition','construction'})
assert {t['kind'] for n in ids.values() for t in n.get('tests',[])}<={'computation','degenerate','compatibility','characterisation','non-example'}
for n in ids.values():
 assert n['id'] in reader
 for a in n.get('api',[])+n.get('tests',[]):
  assert a['name'] in lean or n['id'] in set(p['prototype']['nativeNodes']) and a['name'].split('.')[-1] in lean
native=set(p['prototype']['nativeNodes']);omitted={x['nodeId'] for x in p['prototype']['omissions']}
assert native|omitted==set(ids) and not native&omitted and len(native)==1
assert lean.count('OMITTED NATIVE INTERFACE: ')==len(omitted)==47
assert len(re.findall(r'\bexample\b',lean.split('/- OMITTED NATIVE INTERFACE:')[0]))==3
assert not re.search(r'def\s+\S+\s*:\s*Prop|\w+\s*:\s*Prop\s*\n',lean)
for text in [reader,lean,json.dumps(p),json.dumps(d)]:
 assert not re.search(r'/(?:home|tmp|Users)/|file:'+chr(47)*2,text)
routes={}
for fn in ['PAPER-YUAN-26','PAPER-DIMITROV-GAO-HABEGGER-21']:
 for route in json.loads((R/f'research/blueprint/papers/{fn}.result.json').read_text())['routes']:
  if route.get('roadmap')==RID:
   for x in route['items']:routes[x]=True
rc={x['itemId']:x for x in p['routedCoverage']}
assert set(rc)==set(routes) and len(rc)==24
assert all(x['nodes'] and set(x['nodes'])<=set(ids) for x in rc.values())
gapids={x for g in p['gaps'] for x in g['neededBy']}
assert all(g['detail'] and set(g['neededBy'])<=set(ids) for g in p['gaps'])
assert all(q['need'] and q['neededBy'] and set(q['neededBy'])<=set(ids) for q in p['requests'])
context=list(check_blueprint.world())
context[1].update({s:RID for s in ownstage});context[2].add(RID)
context[3].update({n:('blueprint',RID,'Candidate.json') for n in ids})
index=check_blueprint.load_index(os.environ['TAUCETI_INDEX'])
errors,warnings,summary=check_blueprint.check(S/'Candidate.json',index,tuple(context))
assert not errors and not warnings,(errors,warnings)
summary['packet']='Candidate.json'
packets,docs,definitions=blueprints.load_promoted(R)
assert not any(x[1]['roadmapId']==RID for x in packets)
supplierpacket=json.loads((R/'research/blueprint/packets/StableReductionPartII.json').read_text())
supplierdef=json.loads((R/'research/blueprint/roadmaps/StableReductionPartII.json').read_text())
def assembly(candidate,supplier=False):
 build.load_promoted=lambda *args:(copy.deepcopy(packets+([('StableReductionPartII',supplierpacket)] if supplier else [])+([(RID,p)] if candidate else [])),copy.deepcopy({**docs,**({RID:'research/blueprint/readmes/'+RID+'.md'} if candidate else {})}),copy.deepcopy(definitions+([supplierdef] if supplier else [])+([d] if candidate else [])))
 return build.assemble(require_distances=False)[0]
current=assembly(True);currentown=next(r for r in current['roadmaps'] if r['id']==RID)
expectedPending=[['StableReductionPartII:MC.4',RID+':JC7']]
assert currentown['pendingLinks']==expectedPending and not currentown['blueprint']['skippedLinks']
a=assembly(True,True);b=assembly(False,True)
stages={s['id']:s for s in a['stages']};stageids=set(stages)|set(context[1])
ar={r['id']:r for r in a['roadmaps']};br={r['id']:r for r in b['roadmaps']}
assert ar[RID]['blueprint']['declarations']==len(ids)
assert not ar[RID]['blueprint']['skippedLinks'] and not ar[RID].get('pendingLinks'), (ar[RID]['blueprint']['skippedLinks'],ar[RID].get('pendingLinks'))
# Suppliers gain the new consumer links. Their mathematical fields remain identical.
def payload(x):return {k:v for k,v in x.items() if k not in {'consumers','requires','prerequisites','stages','edges'}}
assert all(payload(ar[x])==payload(br[x]) for x in br)
bs={s['id']:s for s in b['stages']}
assert all(payload(stages[x])==payload(bs[x]) for x in bs)
se={(e['source'],e['target']) for e in a['stageEdges']}
oldse={(e['source'],e['target']) for e in b['stageEdges']}
assert oldse<=se and {e for e in se-oldse if not any(v.startswith(RID+':') for v in e)}==set()
def dag(vertices,edges):
 vertices=set(vertices)|{v for e in edges for v in e};out=collections.defaultdict(set);indeg={v:0 for v in vertices}
 for u,v in edges:
  if v not in out[u]:out[u].add(v);indeg[v]+=1
 todo=[v for v in vertices if not indeg[v]];count=0
 while todo:
  u=todo.pop();count+=1
  for v in out[u]:
   indeg[v]-=1
   if not indeg[v]:todo.append(v)
 assert count==len(vertices),[v for v,k in indeg.items() if k][:12]
 return {'vertices':len(vertices),'edges':len(edges),'acyclic':True}
world={}
for folder in ['data/decompositions','data/blueprints','research/blueprint/packets']:
 for f in sorted((R/folder).glob('*.json')):
  for n in json.loads(f.read_text()).get('nodes',[]):world.setdefault(n['id'],n)
world.update(ids)
todo=list(ids);seen=set();edges=set();baseline=set();unresolved=set()
while todo:
 n=todo.pop()
 if n in seen:continue
 seen.add(n)
 for q in world[n].get('prerequisites',[]):
  if q.startswith(('mathlib:','tauceti:')) and q not in stageids:baseline.add(q);continue
  edges.add((q,n))
  if q in world:todo.append(q)
  elif q not in stageids:unresolved.add(q)
assert not unresolved,unresolved
edges|={(world[n]['parentStageId'],n) for n in seen if world[n].get('parentStageId')}
edges|={(q['supplier'],n) for q in p['requests'] for n in q['neededBy']}
def stageof(v):
 visited=set()
 while v in world and v not in visited:visited.add(v);v=world[v]['parentStageId']
 return v
required={(q,RID+':'+s['key']) for s in d['stages'] for q in s['requires']}
required|={(stageof(q),stageof(n)) for n in ids for q in ids[n]['prerequisites'] if q in world or q in stageids and not q.startswith(('mathlib:','tauceti:TauCeti.AlgebraicGeometry.'))}
required|={(stageof(q['supplier']),stageof(n)) for q in p['requests'] for n in q['neededBy']}
required={e for e in required if e[0]!=e[1]}
following=collections.defaultdict(set)
for u,v in se:following[u].add(v)
def reachable(u,v):
 todo=[u];seen=set()
 while todo:
  w=todo.pop()
  if w==v:return True
  if w not in seen:seen.add(w);todo.extend(following[w])
 return False
assert all(reachable(*e) for e in required),[e for e in required if not reachable(*e)]
comp=json.loads((S/'Compilation.json').read_text())
assert comp['exitCode']==0 and comp['errors']==0 and comp['warnings']==9
assert comp['sourceSha256']==hashlib.sha256(lean.encode()).hexdigest()
assert comp['logSha256']==hashlib.sha256((S/'CompilePublished.log').read_bytes()).hexdigest()
assert p['prototype']['compiled'] and not p['prototype']['geometricSignaturesCompiled']
assert p['prototype']['compilationReceipt']==comp
report={'base':BASE,'checker':summary,'errors':errors,'warnings':warnings,'routedItems':24,'omittedNodes':47,'nativeNodes':1,'stageDAG':dag(stages,se),'ownNodeDAG':dag(ids,{(q,n) for n in ids for q in ids[n]['prerequisites'] if q in ids}),'scopedDAG':dag(stageids|seen,se|edges),'requiredSupplierPairs':len(required),'unresolved':[],'ownSkippedLinks':[],'currentAssemblyPendingLinks':expectedPending,'combinedSupplierAssemblyPendingLinks':[],'foreignMathematicalPayloadsPreserved':True,'newEdgesIncidentOnlyToOwnRoadmap':True,'compilation':comp,'readerRegenerationRequired':True,'reviewCheckedNodes':len(p['review']['checked']),'apiItems':60,'unitTests':52,'requests':13,'immutableReadPaths':len(immutable.READS),'immutableReadPathSha256':hashlib.sha256(json.dumps(sorted(immutable.READS)).encode()).hexdigest()}
report['changedNodeContracts']=[x['nodeId'] for x in json.loads((S/'review-changes.json').read_text()) if set(x['changedFields']) & {'statement','hypotheses','prerequisites','api','tests'}]
assert set(x['nodeId'] for x in p['review']['checked'])==set(ids)
assert all(x['verdict'] in {'verified','corrected','added'} for x in p['review']['checked'])
assert p['sourceIssues'][0]['review']['verdict']=='confirmed'
for n in ids.values():
 if n['id'] in omitted:
  block=lean.split('/- OMITTED NATIVE INTERFACE: '+n['id']+'\n',1)[1].split('-/',1)[0]
  assert n['statement'] in block and all(h in block for h in n['hypotheses'])
  assert all(a['name']+': '+a['statement'] in block for a in n.get('api',[])+n.get('tests',[]))
print(json.dumps(report,indent=2))
```

## Script: immutable.py

```python
"""Read the immutable audit tree without creating a repository snapshot."""
import fnmatch
import importlib.abc
import importlib.util
import io
from pathlib import Path
import subprocess
import sys

import os
REPO = Path(os.environ.get('TAUCETI_REPO', str(Path.cwd())))
BASE = os.environ.get('STABLE_VALIDATE_BASE', '4c47f9957d8a4e9776f4890d87e2e802fdc13ee3')
TRACKED = set(subprocess.check_output(['git', 'ls-tree', '-r', '--name-only', BASE], cwd=REPO, text=True).splitlines())
CACHE = {}
READS = set()
ORIGINAL = {name: getattr(Path, name) for name in ('read_text', 'read_bytes', 'exists', 'is_file', 'is_dir', 'glob', 'rglob', 'open', 'write_text', 'write_bytes')}

def relative(path):
    try:
        return str(path.resolve().relative_to(REPO.resolve()))
    except ValueError:
        return None

def blob(key):
    if key not in TRACKED:
        raise FileNotFoundError(key)
    READS.add(key)
    if key not in CACHE:
        CACHE[key] = subprocess.check_output(['git', 'show', BASE + ':' + key], cwd=REPO)
    return CACHE[key]

def read_text(path, encoding=None, errors=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['read_text'](path, encoding=encoding, errors=errors)
    return blob(key).decode(encoding or 'utf-8', errors or 'strict')

def read_bytes(path):
    key = relative(path)
    return ORIGINAL['read_bytes'](path) if key is None else blob(key)

def is_file(path):
    key = relative(path)
    return ORIGINAL['is_file'](path) if key is None else key in TRACKED

def is_dir(path):
    key = relative(path)
    return ORIGINAL['is_dir'](path) if key is None else any(s.startswith(key.rstrip('/') + '/') for s in TRACKED) or key == '.'

def exists(path):
    key = relative(path)
    return ORIGINAL['exists'](path) if key is None else is_file(path) or is_dir(path)

def glob(path, pattern, recursive=False):
    key = relative(path)
    if key is None:
        yield from ORIGINAL['rglob' if recursive else 'glob'](path, pattern)
        return
    prefix = '' if key == '.' else key.rstrip('/') + '/'
    for candidate in sorted(TRACKED):
        if not candidate.startswith(prefix):
            continue
        tail = candidate[len(prefix):]
        if fnmatch.fnmatch(tail, pattern) and (recursive or '/' not in tail):
            yield REPO / candidate

def open_path(path, mode='r', buffering=-1, encoding=None, errors=None, newline=None):
    key = relative(path)
    if key is None:
        return ORIGINAL['open'](path, mode, buffering, encoding, errors, newline)
    if mode not in ('r', 'rb'):
        raise PermissionError('audit tree is read-only')
    return io.BytesIO(blob(key)) if mode == 'rb' else io.StringIO(blob(key).decode(encoding or 'utf-8', errors or 'strict'))

def write_text(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_text'](path, *args, **kwargs)

def write_bytes(path, *args, **kwargs):
    if relative(path) is not None:
        raise PermissionError('audit tree is read-only')
    return ORIGINAL['write_bytes'](path, *args, **kwargs)

class Loader(importlib.abc.Loader):
    def __init__(self, key):
        self.key = key
    def create_module(self, spec):
        return None
    def exec_module(self, module):
        module.__file__ = str(REPO / self.key)
        exec(compile(blob(self.key), module.__file__, 'exec'), module.__dict__)

class Finder(importlib.abc.MetaPathFinder):
    def find_spec(self, fullname, path=None, target=None):
        key = 'scripts/' + fullname + '.py'
        if '.' not in fullname and key in TRACKED:
            return importlib.util.spec_from_loader(fullname, Loader(key))

def install():
    for name, function in [('read_text', read_text), ('read_bytes', read_bytes), ('exists', exists), ('is_file', is_file), ('is_dir', is_dir), ('glob', glob), ('rglob', lambda path, pattern: glob(path, pattern, True)), ('open', open_path), ('write_text', write_text), ('write_bytes', write_bytes)]:
        setattr(Path, name, function)
    sys.meta_path.insert(0, Finder())
```

## Script: compile-pass.py

```python
"""Serial pinned Lean replay; use only an existing build, never Lake setup."""
from pathlib import Path
import os,sys,subprocess,json
out=Path(sys.argv[1]).resolve();mathlib=Path(sys.argv[2]).resolve();lean=Path(sys.argv[3]).resolve()
name=sys.argv[4];assert name in {'Native.lean','Canonical.lean','Published.lean','AdmittedTyping.lean'}
pin='082e2d37e8b0463410cdb532e111cd43d5a66174'
assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=mathlib,text=True).strip()==pin
assert (mathlib/'lean-toolchain').read_text().strip()=='leanprover/lean4:v4.34.0-rc2'
version=subprocess.check_output([str(lean),'--version'],text=True).strip()
assert '4.34.0-rc2' in version,version
libs=[mathlib/'.lake/build/lib/lean'];assert libs[0].is_dir()
packages=[];omitted=[]
for item in json.loads((mathlib/'lake-manifest.json').read_text())['packages']:
 package=mathlib.parent/item['name'];lib=package/'.lake/build/lib/lean'
 if not lib.is_dir():
  assert item['name']=='Cli',item['name']
  omitted.append('Cli: no compiled library directory; not in either checked import cone')
  continue
 assert subprocess.check_output(['git','rev-parse','HEAD'],cwd=package,text=True).strip()==item['rev'],item['name']
 libs.append(lib);packages.append(item['name'])
free=subprocess.check_output(['free','-g'],text=True)
available=int(free.splitlines()[1].split()[-1])
print(json.dumps({'preflight':'serial existing pinned build','availableGiB':available,'packages':packages,'omitted':omitted,'leanVersion':version}),flush=True)
if available<20:print('Memory guard refused compilation.',flush=True);sys.exit(75)
env=os.environ.copy();env['LEAN_PATH']=os.pathsep.join(str(p) for p in libs)
result=subprocess.run(['/usr/bin/time','-v','timeout','1200',str(lean),'-j1','-M8192',str(out/name)],env=env)
sys.exit(result.returncode)
```

## Script: review-recover.py

```python
"""Recover public review deliverables and embedded receipts from one immutable head."""
from pathlib import Path
import base64,hashlib,json,re,sys,urllib.request,zlib
out=Path(sys.argv[1]).resolve();head=sys.argv[2]
assert re.fullmatch('[0-9a-f]{40}',head) and not out.exists()
out.mkdir(parents=True)
root='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+head+'/'
reportPath='research/blueprint/reviews/REV-DESIGN-JacobianChallengePartII.md'
def get(path):
 with urllib.request.urlopen(root+path,timeout=60) as response:return response.read()
report=get(reportPath).decode()
metadata=json.loads(re.search(r'<!-- JACOBIAN INDEPENDENT REVIEW METADATA\n(.*?)\nEND JACOBIAN INDEPENDENT REVIEW METADATA -->',report,re.S)[1])
for name,entry in metadata['artifacts'].items():
 data=zlib.decompress(base64.b64decode(entry['data']))
 assert len(data)==entry['bytes'] and hashlib.sha256(data).hexdigest()==entry['sha256']
 (out/name).write_bytes(data)
for name,body in re.findall(r'## Script: ([\w.-]+)\n\n```python\n(.*?)\n```',report,re.S):
 data=(body+'\n').encode()
 assert hashlib.sha256(data).hexdigest()==metadata['helpers'][name]
 (out/name).write_bytes(data)
for path,entry in metadata['publicFiles'].items():
 data=get(path)
 assert hashlib.sha256(data).hexdigest()==entry['sha256']
 (out/entry['recoveredAs']).write_bytes(data)
# The reviewed reader is a separately owned input, read from the recorded base.
url='https://raw.githubusercontent.com/CBirkbeck/tauceti-explorer/'+metadata['base']+'/research/blueprint/readmes/JacobianChallengePartII.md'
with urllib.request.urlopen(url,timeout=60) as response:(out/'Original-reader.md').write_bytes(response.read())
(out/'Published-review.md').write_text(report)
print('Recovered authenticated review inputs and receipts at '+head)
```

