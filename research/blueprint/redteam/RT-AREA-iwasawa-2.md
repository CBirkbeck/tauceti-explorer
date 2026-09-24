# RT-AREA-iwasawa-2 — red team: Iwasawa theory and special values, part 2 of 3

**Job** `RT-AREA-iwasawa-2` (issue #1497) · **Date** 24 September 2026 · Claude Code, session `cc-7b31c4`
· **Status: complete.** Six findings: five of missing mathematics, one of duplication. No error of
statement and no false library claim was found in the area.

Roadmaps attacked: `ColemanPowerSeries`, `DirichletPadicLFunctions`,
`EulerSystemsCyclotomicMainConjecture`, `IntegralIwasawaTheory`, `LocallyAnalyticDistributions`,
`PadicHodgeRegulators`, `PadicMeasuresIwasawaAlgebras`, `SpecialValuesBirchTate` — 73 stages.

**Disclosure.** This session reviewed two of the fourteen paper extractions routed into the area
(`PAPER-COLMEZ-NIZIOL-25`, issue #1307, and `PAPER-PILLONI-20`, issue #1327). No finding below rests on
either. Finding 5 cites `PAPER-BOXER-CALEGARI-GEE-PILLONI-21` and `-25`, which this session did not
touch.

## What came back clean

A red team that finds nothing must say what it looked at, and several of the sharpest instruments found
nothing here:

- **Prerequisites.** Every `requires` entry of every stage the area owns resolves to an existing stage:
  0 unresolved out of 73 stages.
- **Cycles.** Depth-first search over the whole atlas stage graph (1968 stages) finds no cycle, so none
  through this area.
- **Library claims.** The area's descriptions name exactly one Lean declaration, `PadicInt.hasSum_mahler`
  (`PadicMeasuresIwasawaAlgebras:L2`); it exists at Mathlib `082e2d3`. I also checked the audit claim
  that Weierstrass division and preparation for `O⟦T⟧` is in Mathlib (`L4`): it is —
  `Mathlib/RingTheory/PowerSeries/WeierstrassPreparation.lean`, 88 declarations. (A merged paper review,
  REV-PAPER-BREUIL-ETAL-23, said the opposite about the same theorem; that is being corrected
  separately. The audit is the record that is right.)
- **Characteristic ideals, the obvious duplication candidate.** `SelmerIwasawaCohomology:L3`,
  `AutomorphicCongruences:L0`, `ModularIwasawaMainConjectures:L4` and `GeneralizedHeegnerCycles:GH.8` all
  use them; all four cite the owner and none rebuilds the construction.
- **Kubota–Leopoldt, the second candidate.** `IntegralIwasawaTheory:I.3` says "import the
  Kubota–Leopoldt pseudomeasure from DirichletPadicLFunctions L1–L2" and "No second p-adic zeta carrier
  is constructed". Exemplary; no finding.
- **Gross–Stark.** No stage mentions it, which looks like a hole until one reads the routes:
  `PAPER-DASGUPTA-KAKDE-VENTULLO-18` routes it, with 99 items, to a proposed Part II of
  `IntegralIwasawaTheory`. No finding.

## The five gaps

Each has the same shape, which is why I report them together: **an accepted, reviewed paper route asks a
named layer of this area to own some mathematics; the layer's description does not plan it; and no other
layer of the atlas does either.** In four of the five the route says so in its own words.

| # | what is missing | who asks for it | where it should go |
|---|---|---|---|
| 1 | Morita's `Γ_p` and the **Gross–Koblitz formula** | Dasgupta–Kakde–Ventullo → `DirichletPadicLFunctions:L3` | L3, beside the Gauss sums and branches it already owns |
| 2 | the **Ferrero–Greenberg** derivative formula | the same route | L3, beside Leopoldt's formula |
| 3 | the **Fontaine–Messing–Kato** log-syntomic package | Colmez–Nizioł 17 → `PadicHodgeRegulators:D.2` | a new layer; D.2 is kept unramified by RS-26 |
| 4 | **character group rings** and quadratically presented modules | Dasgupta–Kakde 23 → `PadicMeasuresIwasawaAlgebras:L6` | L6, which already owns the BSS order algebra |
| 5 | finite-slope theory for **perfect complexes** of Banach modules | Boxer–Calegari–Gee–Pilloni 21 and 25 → `LocallyAnalyticDistributions:L4` | L4, extended to the derived setting |

Two of them deserve a word.

**Finding 3 is the one I rate high**, because it is not merely an omission: it is a contradiction
between two pieces of accepted work. The Colmez–Nizioł route asks D.2 for the log-syntomic sheaves
`S_n(r)_X`, the period morphism `α^FM_{r,n} : S_n(r)_X → i^*Rj_*Z/p^n(r)`, the small-twist isomorphism
for `i ≤ r ≤ p−1` and the syntomic exponential, saying "this paper supplies the semistable logarithmic
form of the same objects". The accepted restructuring proposal RS-26 says of the same layer: *"Keep the
exact smooth/unramified syntomic and étale regulator comparison."* Both cannot stand. And nothing else
plans the objects: `Fontaine–Messing` occurs in no stage description at all, and the prismatic layers
that do mention syntomic cohomology (PR.4, PR.5, PR.8) build the Nygaard/Tate-twist theory, not the FMK
complexes or their period map.

**Findings 1 and 2 are the cheapest to fix and the easiest to lose.** `Γ_p`, Gross–Koblitz and
Ferrero–Greenberg are the classical `F = Q` inputs to Gross–Stark; they are three self-contained
theorems, none of them in either library at the pins (no `padicGamma`, no `GrossKoblitz` in the shared
index; grep over both checkouts finds only the real, incomplete and multivariate Gamma functions), and
the only stage that looks like their home, L3, plans the neighbouring formulas and not these. The word
"Ferrero" does appear twice in the area — but both times in *Ferrero–Washington*, a different theorem,
one of them in a layer titled "Abelian Leopoldt and Ferrero–Washington".

## The duplication

**Finding 6.** The cyclotomic main conjecture for abelian fields over `Q` has two owners:

- `EulerSystemsCyclotomicMainConjecture:L3` — "Deduce … `char_{Z_p[[G^+]]}(X_∞^+) = I(G^+)ζ_p` for every
  **odd** prime p. This is the unconditional Theorem 13.8" — with `:L4` adding Greither's abelian and
  `p = 2` case, and the roadmap's summary naming Kolyvagin–Rubin "the route of record";
- `IntegralIwasawaTheory:I.5` — "Prove the abelian-Q main conjecture of **Mazur–Wiles** … The proof
  programme includes Hecke algebras at the needed levels and weights, Eisenstein ideals, congruence
  modules, Galois representations and stable lattices …".

Neither cites the other; I.5's prerequisites are I.2 and I.3 only; and none of the restructuring
proposals that touch the area assigns the statement an owner (the only mentions of
`EulerSystemsCyclotomicMainConjecture` in RS-08 and RS-16 are stage-edge forwardings). That is a large
programme — the whole Eisenstein-ideal route — that may be built twice by accident. Note that I.5 also
carries Wiles's totally real theorem, which the Euler-system roadmap does *not* prove and which
`SpecialValuesBirchTate:B.4` consumes, so the fix is not simply to delete one side.

## What I read

The full `checked` list is in the result JSON. In summary: all 73 stage descriptions with their
requires/consumers; the eight roadmap summaries; `data/library-coverage.json` for the 61 audited layers
of the area (AUDIT-24 to AUDIT-27) and their 306 targets; the four restructuring proposals that touch
the area, plus every mention of the area in RS-08; all 14 paper extractions routed here, their routes
and reasons, the 336 `planned` references they make into 21 of the area's layers, and every `missing`
item they put on a source route into the area; and a catalogue-wide text search over all 1968 stage
descriptions for twenty-eight terms, listed in the result.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-iwasawa-2.result.json

Reports ok.
