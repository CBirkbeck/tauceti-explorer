# FIX-RT-PAPER-SCHROER-23

Issue [#4976](https://github.com/CBirkbeck/tauceti-explorer/issues/4976). Worker: Codex, session `codex-5ebb6f`, 30 September 2026. Base: `795982c536ae8e43a930029d71087312bf15487e`. This repairs all seven confirmed findings, including the low-severity finding /7, following the independent verifier's qualifications and the maintainer's later published-version evidence.

The paper extraction remains complete as an extraction: 253 stable numbered items, 16 library, 18 planned, 219 missing; ten routes take every missing item exactly once. It does not assert proof closure of the main theorem, completion of the cited prerequisite proofs, implementation of blueprint plans, or reproduction of the earlier exhaustive classification computation. Existing /1–/245 IDs and unrelated contracts are retained. Only the four issue deliverables change.

## /1 — Propagate the omitted configurations and separate completeness

/119 retains the eleven printed elliptic configurations and adds I₂*+E₄+Ĩ₂, I₃*+E₄+Ĩ₁ and IV*+E₄+Ĩ₂. /120 retains the separate four quasielliptic possibilities. The additive and ordinary E₄ fibers in each added case would be the two multiple fibers; Lemma 4.3 makes the nonsplit semistable fiber simple.

/130 now retains the eight printed residual configurations **together with the three unexcluded candidates**, conditional on classification completeness. The printed fifteen-to-eight argument cannot remove them. The IV* proof on public p. 37 uses a III/IV other multiple fiber, while the new IV* configuration has E₄. /146's active note no longer says the proof is checked; /47 explicitly inherits the open gates. Original item notes retain their historical attribution in `noteHistory`.

Two new missing contracts distinguish the obligations. /246 requests all three Enriques exclusions in route 6. /247 requests a complete fourteen-model Jacobian classification certificate in route 2, covering bounded enumeration/normal forms, allowed coordinate and base changes, fiber resolutions and the Picard-constancy hypotheses. /115 and the route briefs record that gate. Finite discriminant or point-count checks do not prove exhaustiveness. The earlier review's search claims remain historical evidence; this fix has not rerun that search. Both gates must close before Theorem 15.1 or Theorem 5.1 can conclude. No nonexistence counterexample is alleged.

## /2 — Import the exact rank-two suppliers; hand off residual foundation adapters

/52 is planned by `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/oort-tate-classification`, specialized to p=2, Λ₂=Z and w₂=2, including arbitrary invertible modules. /54 is planned by `R07.1/oort-tate-over-number-rings`, part (iii), Artin–Mazur. Both leave source route 4. R25.3's order-two application depends on this foundation and is not listed as a second owner of /54.

Route 4 retains only /51 and /53 and requests their exact compatibility contracts: the minus-sign law `f+g−bfg` for nontrivial L and change of trivialization, comparison with the classified Hopf algebra, and Cartier duality `(L,a,b)↦(L⁻¹,b,a)` with base-change compatibility. The existing classification's affine/Pic=0 duality statement does not by itself expose this full nontrivial-L presentation API. These contracts stay with the finite-flat foundation, not the Enriques consumer.

**Maintainer handoff:** R07.1 coverage is closed as a plan. If the residual adapters are absent from its accepted packet, commission a blueprint-fix job there with independent `REV-FIX` before promotion. This paper's source-route reason and item notes are the request channel; no unsupported top-level `requests` field is introduced in `paper-v1`, and no accepted packet is silently edited.

## /3 — Split finite covers from the infinite-stalk adapter

/181 now states just the finite-cover/π₁ theorem and imports `SmallRamificationAndAbelianVarietyBaseCases:R25.3/etale-group-schemes-over-integers-are-constant`. That node explicitly includes the triviality of π₁(Spec Z). Its coverage is closed as a plan, without implying library implementation. The existing built arithmetic declaration /180 remains its supplier.

New /248 requests the general connected normal locally noetherian base theorem for finite-rank free integral local systems: continuous π₁ action, finite monodromy and an appropriate finite étale trivialization/Isom-torsor bridge despite infinite stalks. The rank-ten numerical Picard application uses this theorem plus /181. Route 7 at IG.0 owns /248 alone; it no longer proposes a second proof of the finite-cover theorem. Normality and finite rank stay explicit proof hypotheses.

## /4 — One shared Enriques owner and the pending shared K3 design

Route 6 remains the single proposed owner of the arbitrary-field Enriques definition /26, canonical torsor, characteristic-two types and Proposition 4.2 specializations. Its reason/brief now explicitly name the consumers RealSurfacePeriodIndex (Benoist /114), CohomologyComparisons:CP.5 and MotivesAndCohomologyFoundations:MC.7.

**Maintainer handoff:** coordinate those consumers with this shared Enriques API at design time; no second Enriques definition roadmap is proposed. The characteristic-zero RealSurfacePeriodIndex specialization must import the appropriate branch, without duplicating the characteristic-two definition/type theory.

New /249 joins the **existing proposed** `K3SurfacesAndSymplecticBoundedness` direction from Charles/Shankar through route 10. It is missing, not planned: no known stage or packet exists for that proposal here. /148, /188 and routes 3/6 import its shared definition contract. Charles uses smooth **projective** geometrically integral surfaces with trivial canonical bundle and H¹(O)=0; Schröer's canonical-cover input uses smooth proper surfaces. /249 therefore requires an explicit proper/projective comparison or the additional projectivity hypotheses before projective-only results can apply. Singular characteristic-two K3-like covers are excluded from the smooth K3 API. The Enriques consumer still proves its cover construction, smoothness, connectedness, canonical bundle and H¹ properties. The Hodge-obstruction consumer only applies Fontaine after model hypotheses are met.

**Maintainer handoff:** incorporate /249 into the pending Charles/Shankar K3 design, with consumer agreement on definition scope. Route 10 reuses that ID and design direction; it does not establish a new stage or a parallel K3 programme.

## /5 — Extract the actual Proposition 8.1 imports and application obligations

New /250 at SF.0 is **EGA IV₄ 18.5.11(c)**: for separated locally finite-type X over henselian local A, a quasi-finite point above the closed point gives an open-and-closed local component `Spec O_{X,x}` finite over A. The source is not a general Cartier-divisor lifting theorem. SF.0 is added to source route 9, alongside its existing SF.1/SF.2 imports.

New /252 is the genus-one application in route 2: construct a transverse regular horizontal Cartier divisor through a rational point of the reduced elliptic special fiber, finite over the excellent henselian DVR and itself a DVR with residue field k. Its intersection with the **reduced** fiber is Spec k. Its schematic special fiber generally has length m, where X_k=mE_red; the fix does not equate it with a reduced point.

New /251 at A0-extension is **Raynaud 8.2.1(ii)⇒(iii)⇒(iv)** for proper flat relative curves over a trait satisfying (N)*. It retains the special-fiber/no-embedded-components, generic-point normality and `f_*O=O` hypotheses of 6.1.4, and the degree-one divisor on the generic fiber after strict henselization. A section supplies the last condition, not the other hypotheses. General coherent/Picard base change belongs to that owner, importing its existing relative-curve prefix.

New /253 in route 2 constructs the normal proper model dominating the normalized transverse base change and elliptic model, lifts the section, verifies flatness/(N)*/`f_*O=O`, and applies /251. Obtaining h¹=1 also uses the genus-one Euler characteristic χ=0; Raynaud's theorem alone is not the h¹ conclusion. /81 now explicitly names /250–/253 and Lemma 8.4 (/84–/85). These are extracted proof obligations, not freshly completed geometric proofs.

**Maintainer handoff:** feed /250 and /251 into the respective SF.0 and A0-extension blueprint work; /252–/253 belong in the genus-one design. If accepted packets need changes, use independently reviewed blueprint fixes before promotion. No consumer duplicates either general theorem.

## /6 — Canonicalize the collector input and record version provenance

The active register source is the paper extraction's `sourceIssues`. The errata file now has `sourceIssues: []`, an explicit `canonicalSource`, all eleven original records/verdicts under `historicalSourceIssues`, and file-qualified `canonicalAliases`. The paper's original 44 records/verdicts are preserved verbatim under `sourceIssueHistory`. Histories are not active collector input.

Every former errata record maps to a canonical paper record: E1→E1, E2→E4, E3→E5, E4→E6, E5→E11, E6→E12, E7→E13, E8→E15, E9→E16, E10→E17, E11→E45. These mappings are file-qualified because identical old IDs meant different things in the two files. E1 and E4 now have reach “a stated result”.

The two slips formerly combined in paper E16 are now E16 (twisted-case inequality) and E45 (first-case variable). Those formerly combined in E17 are E17 (Pic⁰ rather than Pic) and E46 (A_S rather than A_R). The four split records have no fabricated fresh independent review; their original combined verdicts remain historical. Collector output consequently has **46 unique active Schröer records**, replacing the previous 55 duplicate/combined records. No mistake or independent review provenance is discarded.

Both files record `sourceVersions` with dated public version URLs and hashes, and separately attribute the selected published reading to the [maintainer's comment](https://github.com/CBirkbeck/tauceti-explorer/issues/4976#issuecomment-5915303984). The journal PDF hash is `ce9356aa68d9afc761f9f8ee25db55078dd16988d856ed220887a717f68b8d56`, typeset 17 November 2022. E29 (published pp. 3/33), E34 (pp. 34–36) and E44 (p. 39/pp. 43–44) now say the relevant defect persists in that later version; their obsolete “whether print differs … is not established” active search entries are replaced. All other findings remain public-version scoped. No private PDF or extracts are included, and this worker does not claim a whole published-paper reading.

## /7 — Correct the JacobianChallenge Layer D boundary

/213, /215 and route 1 import `tauceti:TauCetiRoadmap/JacobianChallenge#layer-d-the-relative-picard-functor-and-the-jacobian-scheme`. Its relative fppf Picard functor and Brauer-obstruction prefix covers proper flat finitely presented families with geometrically integral fibers **before** section rigidification, and includes projective-variety representability. The former “only curves with a section” description is removed.

Route 1 still owns the broader arbitrary proper, possibly nonreduced/disconnected contracts, the obstruction involving h_*G_m/affinization, Pic^τ, Num and finite generation. Importing the narrower prefix does not justify marking these whole items planned or rebuilding a second Picard/Brauer theory.

## Source checks and validation

Fresh public source checks on 30 September 2026: Schröer arXiv v3 selected definitions/Proposition 8.1/configurations/endpoint passages, with table/IV*/endpoint page images; EGA 18.5.11 statement and proof pp. 130–132 and image p. 131; Raynaud 6.1.4 and 8.2.1 pp. 48–49/66–67 and image p. 66; Oort–Tate introduction pp. 1–2 and image p. 1. Public PDFs were freshly hashed; exact URLs/hashes and reading limits are in `source.fixReadings` and `sourceVersions`. The earlier prerequisite and whole-paper reading records retain their original authorship.

The existing packet statements for the two R07.1 nodes and the R25.3 finite-cover node, their coverage records, IG.0's audited boundary, the SF.0/SF.1/SF.2 and A0-extension contracts, JacobianChallenge Layer D, and the Charles/Shankar/Benoist/CP.5/MC.7 consumer contracts were checked. Pinned searches did not establish new advanced implementation coverage; no existing library item is changed.

Validation: `scripts/check_paper.py`, `scripts/check_errata.py`, explicit `versions_checked` on the paper findings, and intake on all four deliverables. Focused checks verify preservation of all /1–/245 IDs and unrelated item contracts; 253 unique items and the exact status counts; every missing item taken once; planned stage existence and route galaxy IDs; verbatim original paper/errata archives and all alias targets; no fresh split verdicts; source-version hashes; and the in-memory `scripts.errata.collect` output's 46 unique active Schröer records. `git diff --check` passes. No generated atlas/register files or accepted packets are modified. **No Lean compiled.** Independent fix review is required before any subsequent blueprint promotion.
