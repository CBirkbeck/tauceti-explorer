# RT-AREA-langlands-3 — red team: Galois representations and modularity, part 3 of 3

**Job** `RT-AREA-langlands-3` (issue #1505) · **Date** 24 September 2026 · Claude Code, session
`cc-7b31c4` · **Status: complete.** Four findings, all of missing mathematics, one of them structural.
No error of statement, no duplication and no false library claim was found.

Roadmaps attacked: `CompletedCohomologyAndLocalGlobalCompatibility`, `EllipticCurveModularity`,
`ModularityAndLanglandsExtensions`, `PadicLocalLanglandsForGL2Qp`, `SerreWeightAndLevelOptimisation` —
30 stages.

**Disclosure.** This session reviewed one of the thirty paper extractions routed into the area
(`PAPER-PILLONI-20`, issue #1327). Finding 1 counts it among the extractions that route Arthur's
classification here but does not rest on it: the same items come from eight other extractions this
session never touched.

## The shape of the area

Four of the five roadmaps are in good order, and it is worth saying so precisely, because it is what
makes the fifth stand out. `SerreWeightAndLevelOptimisation`, `EllipticCurveModularity`,
`PadicLocalLanglandsForGL2Qp` and `CompletedCohomologyAndLocalGlobalCompatibility` have layers that name
their source theorem, state its hypotheses, and fence their boundaries against the neighbours — R30.6
says outright "All results here remain local; their occurrence inside global completed cohomology is the
additional theorem of R31", and R31's summary forbids asserting local–global compatibility over other
number fields "by analogy". I looked for duplication along every seam I could find (level lowering vs.
Ribet's lemma, Colmez's functor, local–global compatibility, Serre modularity) and found none.

**`ModularityAndLanglandsExtensions` is different in kind.** All six of its stages end with "Execution
state: specification", and their construction lines are registrations — *define a register*, *organize*,
*apply*, *integrate*, *give … explicit proof-source owners*, *register*. It is a bookkeeping roadmap.

And **101 of the 143 missing items that accepted source routes send into this area are addressed to
it**, from twenty extractions.

## Findings

### 1 (high) — Arthur's classification for classical groups has no constructive owner

Eight extractions route to `ML.4`: the local Langlands correspondence for **GSp₄** (Gan–Takeda) and for
**SO(V)** (Vogan packets, Gan–Ichino), Arthur's **multiplicity formula**, the archimedean packets,
Adams–Johnson packets, Xu's packets for PGSp₆. `ML.4` is a registry, and its own acceptance criterion
reads: *"The symplectic torsion branch has a named source-verification/construction task."* **No such
task exists anywhere in the atlas.**

Of the eleven stages that mention Arthur, none constructs the classification: AS.3/AS.6 build the
invariant trace formula, ET.4/ET.7 the stable and twisted **unitary** comparison, ES7 and GS.5 the
function-field parametrisation, TC.3 boundary induction. The endoscopy roadmap disclaims the scope in
its own summary — *"not a claim of general Langlands functoriality or a classification of every
packet"* — and its local layer ET.6 is "Classical local GL_m and inner-form comparison", which is
exactly what RS-21 assigns it. `Gan–Takeda` and `Adams–Johnson` occur in **no** stage description.

This matters because the atlas's abelian-surface modularity work sits downstream of it.

### 2 (high) — a registry is being asked to own the mathematics

The same pattern, counted: 101 items, twenty extractions. Besides the classification cluster, the two
big ones are potential automorphy and symmetric powers (Allen et al., Clozel–Thorne, Qian,
Frešán–Sabbah–Yu, Fakhruddin–Khare–Patrikis, Newton–Thorne, Calegari–Geraghty — 59 items to ML.0/ML.2/ML.3)
and the **Bianchi** package of Boxer–Calegari–Gee et al. (Fourier coefficients and parabolic cohomology
of Bianchi eigenforms, the Jacquet–Shalika bound, Theorem E's Ramanujan bound, Theorem G's mass
equidistribution). Bianchi forms occur in only two stages of the atlas, both about p-adic L-functions;
the Ramanujan and Jacquet–Shalika bounds in this sense occur in none.

The fix is not to enlarge ML: it is to decide, stage by stage, which of them are registries and to route
the mathematics to owners that build it — `PotentialAutomorphyInfrastructure` for the automorphy
machinery the routes' own reasons point at, a named owner for the Bianchi package, and finding 1's owner
for the classification.

### 3 (medium) — the companion-forms theorem

Three extractions route companion forms (Gross; Coleman–Voloch) to `R20.3`: *"Companion forms force a
split local representation"*, *"Weight-one mod p eigenforms: ρ̄ unramified at p with T_p = trace"*,
*"Companion forms and weight lowering for mod ℓ modular forms unramified at ℓ"*. R20.3 plans the
**Edixhoven/Serre weight theorem** — the neighbouring but different statement — and "companion form"
appears in no stage description in the atlas. The fix is one sentence in R20.3, where it belongs.

### 4 (medium) — completed cohomology of a definite quaternion algebra

Dospinescu–Le Bras routes **26** items into R31.1/R31.2/R31.4: p-adic automorphic forms on the definite
quaternion algebra `B̄`, their Hecke algebras and localisations, the Banach representations `Π(𝔭)`, and
*Theorem 5.4 (Emerton's local–global compatibility for B̄)*. R31 plans the GL₂/Q case — R31.4's concrete
branch is Emerton's 2011 manuscript for a promodular representation of `G_Q` — the word "quaternion"
does not occur in R31.4, and the roadmap summary says not to assert local–global compatibility by
analogy. The finite-level quaternionic input exists (R18.4's Jacquet–Langlands comparison); the
completed-cohomology statement does not.

## What came back clean

- every `requires` in the area resolves (0 unresolved of 30 stages);
- R30.6 and R31.4 do not duplicate the local–global compatibility — R30.6 says which side owns what;
- level lowering is owned once (R20.2); the seventeen other "Ribet" matches are the Iwasawa-theoretic
  Ribet's **lemma**, a different statement;
- Colmez's functor occurs in exactly one stage (R30.3);
- the seven restructuring proposals that touch the area were read, including RS-21's owner assignment of
  general local Langlands and inner-form comparison to ET.6 and RS-26's boundary around
  `PadicLocalLanglandsForGL2Qp`.

## Checks

    python3 scripts/check_redteam.py research/blueprint/redteam/RT-AREA-langlands-3.result.json

Reports ok.
