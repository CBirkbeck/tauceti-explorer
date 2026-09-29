# REV-RS-09 — independent restructuring review

Verdict: **needs_changes**. Refs #817. Reviewer: Claude Code, session `cc-58621d`, 29 September 2026.
Proposal author: ChatGPT, session `astra-d49b2f` (#924). This is the first review of RS-09.

**Disclosure.** This session did not write RS-09. Its only related work is the
`RT-AREA-langlands-1.fixes.md` report (merged, not applied). That report proposes a new stage TC.5 that
imports ALS.4; nothing here depends on it.

The proposal:
- keeps `ArithmeticLocallySymmetricSpaces` (ALS);
- declares `CompletedCohomologyPartII` (CC) its extension, titled "Arithmetic locally symmetric spaces
  and their cohomology, Part II: completed cohomology and homology";
- narrows nine layers, records fifteen owners and adds twenty-four links, sixteen of them from the
  unchanged Tau Ceti AlgebraicTopology anchor.

The ownership work is careful, and most checks pass (§3). One structural defect blocks acceptance (§1),
and the forwarding links for the narrowed layers are incomplete (§2).

## 1. Blocking: the extension does not start where its base stops

PROTOCOL §15: "An extension starts exactly where the roadmap it extends stops." Here a base layer is
built on the extension:
- `data/atlas.json` already has the stage edges CC.2 → ALS.6, CC.4 → ALS.6 and CC.7 → ALS.6.
- The proposal adds CC.0 → ALS.6, and its narrowed ALS.6 names CC.0, CC.2, CC.4 and CC.7 as suppliers.
- On the assembled atlas at `14b94c5b`, ALS.6 has CC.0–CC.4 and CC.7 among its ancestors.
- ALS.6 has no consumers.

This is the defect for which both RS-12 reviews sent that family back. There, stages of the would-be
extension were ancestors of stages of its base. REV-RS-12~2 put it as "it concerns ownership of
mathematics used to construct the stated base". It also declined to read `extends` as covering only
part of the base, which is what RS-09.md calls a "stage-scoped extension".

The standard does not demand that every base stage precede every extension stage:
- CC may start after ALS.0–ALS.4 and ALS.5:finite-level-duality, which is all it uses, while the later
  full ALS.5 (the automorphic comparison) is proved in parallel.
- What it forbids is a base stage that depends on an extension stage. ALS.6 does, through three existing
  edges and the proposed fourth.

**Recommended repair: narrow ALS.6 to its finite-level content.** ALS.6's text has three parts:
1. The tower assembly, "Assemble direct/inverse systems in tame and p-power level ...". The proposal
   already gives it to CC.0.
2. The finite-level part: "Prove finite-level descent and the finite-cover Hochschild–Serre
   application", with its Hecke comparison. This uses ALS.3, ALS.4, anchor stage 5,
   ArithmeticGaloisDuality R02.2 and Tau Ceti ProfiniteCohomology layers 5, 6 and 10, none of which is
   in CC.
3. The re-exports: "Reexport CompletedCohomologyPartII:CC.2/CC.4/CC.7". They serve no consumer.

The repair keeps part 2 as ALS.6's `keeps` and drops parts 1 and 3:
- **Proposal edits.** Remove the link CC.0 → ALS.6, and remove CC.0/CC.2/CC.4/CC.7 from ALS.6's
  `suppliedBy`. The owner records that list ALS.6 under `formerly` stay correct.
- **Maintainer edits.** Delete the stage edges CC.2 → ALS.6, CC.4 → ALS.6 and CC.7 → ALS.6 from
  `data/atlas.json` by hand, because `scripts/restructure.py` only appends links. Rewrite ALS.6's
  README text to match its new `keeps`.

I simulated the result on the current assembled atlas:
- no ALS stage keeps a CC ancestor;
- the remaining twenty-three links are acyclic;
- an optional link ALS.6 → CC.6, if the completed descent should import the finite-level one, is
  acyclic too.

The extension then starts where ALS's finite-level part stops.

**Alternatives.**
- Moving ALS.6 into CC wholesale also works, but by hand only: `restructure.py` has no move action, and
  the stage id would keep its ALS prefix.
- Dropping the extension and keeping CC as a separate roadmap is not recommended. RS-12~3 could do that
  because its general-rank roadmap is a general theory under §15's fifth rule and no in-family repair
  existed. CC is the natural continuation of ALS, and the repair above lies within this family.

## 2. Forwarding for the narrowed layers is incomplete

§15: "A dropped or narrowed layer names the layers that now supply what it lost, and every layer that
relied on it gets a link from the new supplier." The twenty-four links run from each supplier to the
narrowed layer itself. They do not reach its consumers.

RS-12's reviews checked links "from each named supplier to the narrowed layer itself and to every old
direct consumer", and that family had them all. Here thirty are absent, leaving aside ALS.6, which §1
changes. T2, T4, T5 and T6 are the anchor's stages 2, 4, 5 and 6.

| Narrowed layer | Missing supplier → consumer links |
| --- | --- |
| ALS.0 | T6 → AnalyticNumberTheory:AN.9, T6 → ShimuraVarieties:V0 |
| ALS.1 | T2, T4, T6 → ALS.2; T2, T4, T6 → ALS.3; T2, T4 → ALS.5:finite-level-duality; T2, T4, T6 → AutomorphicSpectralTheory:AS.5 |
| ALS.3 | T5 → ALS.4, T5 → ALS.5, T5 → CC.4 |
| CC.0 | ALS.1, ALS.2, ALS.4 → CC.1 |
| CC.1 | ALS.3 → CC.2, ALS.3 → TorsionCohomologyInfrastructure:TC.2 |
| CC.4 | T4, ALS.1, ALS.2 → CC.5; T4, ALS.1, ALS.2 → CC.7; T4, ALS.1, ALS.2 → TorsionCohomologyInfrastructure:TC.2 |

Each is a shortcut of an existing path (supplier → narrowed layer → consumer), so adding them cannot
create a cycle. The revision should add them, or state for each omitted one why the consumer relied
only on what the narrowed layer keeps. For example, AN.9 and V0 may use only ALS.0's arithmetic quotient
and not the generic orientation system.

## 3. What was checked and holds

I read the following in full:
- both member documents and all seventeen stage entries;
- the fifteen owner records, the twenty-four links, the family file and the report;
- the anchor stages the proposal imports.

The anchor stages do own the generic pieces assigned to them:
- stage 2: relative chains and local coefficient systems;
- stage 4: cellular chains and the cellular-to-singular comparison;
- stage 5: finite-cover transfer and descent;
- stage 6: cochains, cup and cap products, orientation and manifold-with-boundary duality.

**Structure.**
- `scripts/check_restructure.py` passes.
- All twenty-four link endpoints resolve, none is already in the atlas, and the union with the current
  assembled atlas is acyclic.
- The eight non-anchor links each shortcut an existing path, as the report's witness table says.
- The anchor is unchanged; only imports from it are added.
- The Part II title has the required form. CC's ALS ancestors are exactly ALS.0–ALS.4, plus
  ALS.5:finite-level-duality for CC.7 and CC.8, as the report says.

**Ownership.** The fifteen owner records resolve the family's duplicates as the member documents
describe them. The report's four distinctions are sound, and each keeps a real obligation at the
consumer:
- Ext universal coefficients are not Tor coefficient change;
- finite cells are not the completed equivariant model;
- generic duality is not arithmetic corner duality;
- finite-cover descent is not completed descent.

I found no missed duplicate. CC.2's derived limits and CC.6's continuous Hochschild–Serre are
applications of ArithmeticGaloisDuality R02.1–R02.3/D7, which CC's own text names as the generic owner.

**Nothing lost.**
- The `keeps` texts of the narrowed layers retain their arithmetic targets and acceptance tests.
- The early ALS.5:finite-level-duality prefix and the later full ALS.5 both stay.
- All CC decomposition parents stay live.
- All outside consumers stay attached. There are now eighteen outside edges; the report counted fifteen
  to nine stages. ALS.4 → TorsionCohomologyInfrastructure:TC.3 is newer, and the R31.1 and R31.2
  consumers now also appear at node level.

**Minor, not blocking.**
- The anchor is listed under `roadmaps` with `keep`. §15's format keys `roadmaps` by proposed roadmap,
  so the entry can be removed; it changes nothing.
- Several owner records list the owner itself under `formerly`. RS-06 and RS-12 leave the owner out,
  and the revision may do the same.

## 4. Questions for the orchestrator

1. **Scope of the extension-frontier standard.** Confirm that it covers this mirror case: a base stage
   that depends on extension stages, not only an extension stage feeding its base.
2. **Choice of repair.** Choose between narrowing ALS.6 (recommended; three stage edges deleted by hand)
   and moving it into CC by hand.
3. **Forwarding standard.** Say whether forwarding links are required for every direct consumer of a
   narrowed layer, as the RS-12 reviews checked, or may be omitted with a stated reason when the consumer
   uses only what the narrowed layer keeps.

## 5. Checks and inputs

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-09.result.json`: ok.
- The graph checks were run on the atlas as `scripts/build.py` assembles it at `14b94c5b`, including
  the repair simulation of §1.
- Intake file validation on the two deliverables: 0 problems.
- Only the proposal's `review` object was added. No decision, layer, owner or link was changed.

Pre-review inputs at `14b94c5b97499128186493993a9bc917e0d621a4` (SHA-256):

| Input | SHA-256 |
| --- | --- |
| RS-09.result.json | `cdfc5d5579a2fb5cefc9f86407fa17f3503e68118765252bc85398cd3ce3b245` |
| RS-09.md | `f8b169c5d719d7266ad539652b149f9a4cce07102998bfa0d007fcbb5644126a` |
| RS-09.json | `b933bcc973812d9cce77b405d9d11ff974ad82d2236efa0f37d861f8e271dc5e` |
| ArithmeticLocallySymmetricSpaces/README.md | `e08c8acacd68d8f7793a6f65e9f8925901ec1214927a6d675304607f601999ac` |
| CompletedCohomologyPartII/README.md | `833b542ad278a00eb8086bc8dba7f9a5e86d1249843a4954d85766f4f6b71427` |
| tau-ceti/AlgebraicTopology/README.md | `f894faf00311049f7032eb488d43c75bcfeffbafc528010e72b9b679ca0bef3f` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |

No Lean file is a deliverable; no Lean was run.
