# RT-AREA-automorphic-1: fixes

Fixer: Claude Code, session `cc-f805bf`, 29 September 2026 (issue #3963, job FIX-RT-AREA-automorphic-1).
- Findings: `RT-AREA-automorphic-1.result.json`: 41 findings (7 high, 24 medium, 10 low), by `cc-39fac3`.
- Verdicts: `RT-AREA-automorphic-1.review.json` and `research/blueprint/reviews/REV-RT-AREA-automorphic-1.md`, by `codex-hjdg0j` (2026-09-24, baseline `0e104881`): 38 confirmed, 3 rejected (/34, /36, /39).
- Scope: the issue lists the 31 confirmed findings of high or medium severity, /1–/31. The low-severity findings /32–/41 are outside this job (PROTOCOL.md section 17); where a fix below touches the same text, the section says so and leaves them alone.
- Everything below was checked at origin/main `8ae020f6`.
  - The graph checks use the atlas as `scripts/build.py` assembles it at that commit (2840 stages, 7792 stage edges): accepted restructurings, promoted blueprints, integrated decompositions and new roadmaps included. The assembled atlas was written to scratch only.
  - Every edge this report adds was tested cumulatively. "The cycle test for A → B" asks whether the graph, with every edge added before it in this report, has a path B → … → A. "Acyclic" means it has none. All 76 additions (stage and node level) are acyclic, and the final graph (7868 edges) has no cycle.

## How to read this report

This report is the job's only deliverable, and the intake accepts no other file for it. Every fix is written as an exact edit for the maintainer, or for the blueprint, design and review jobs that will expand these roadmaps:
- **Roadmap prose** (`content/campaign/<Roadmap>/README.md`): the old sentence is quoted and the replacement is given in full. Each quoted sentence was checked by script to occur exactly once in its file. Quotations ignore line wrapping; this matters only for the EndoscopicTransferAndUnitaryTraceComparison README, whose paragraphs are wrapped.
- **Stage edges.** Most of these READMEs have no "**Dependencies:**" line; their edges are the `requires` lists and `stageEdges` records of `data/atlas.json`. "Add A → B" means: add A to B's `requires`, add B to A's `consumers`, and add the record `{"source": A, "target": B}` to `stageEdges`. Where the consumer's README has a "**Dependencies:**" or "**Inputs.**" line, its edit is given too.
- **New stages** are given as a README section (statement, hypotheses, sources) and a stage record: `requires` and consumers. Following the precedents (`ALS.5:finite-level-duality`, `SR.0:abelian-category`), a sub-stage of an existing layer gets a colon id.
- **Packets, decompositions and restructurings.** Integrated decompositions (`data/decompositions/*.json`) are edited by the maintainer; packets under review by their blueprint jobs; unreviewed restructuring proposals in their next revision.
- **Paper routes** (`research/blueprint/papers/PAPER-<id>.result.json`): the route, the field, the old and the new value. A route whose stage changes needs a new review verdict before `make_queue` applies it. This report writes no verdicts.
- **Library claims** were checked at Mathlib `082e2d3` and Tau Ceti `f790474` (the pinned trees and `declarations.tsv`). Paths are relative to each library root.

The binding rule is the verifier's: a confirmation authorizes only the corrected scope in its reason, and where the review narrows or overrides a finding's fix, the review wins. Each section starts with those corrections, then says what `main` says now, then gives the fix.

**What has changed on main since the verification (24 September).** None of the eight roadmap READMEs, nor `data/atlas.json` or the two integrated decompositions named below, has changed since 15–16 September. The following are new, and some already cover part of a fix; the sections say which:
- blueprint packets for AutomorphicLFunctionsAndLocalFactors (27–29 September; AL.0 Schwartz–Bruhat nodes), MetaplecticAutomorphicForms MP.0 and MP.8, NoncommutativeAndEquivariantIwasawa (NE.0 nodes for Lazard's theorem, 28 September), QSeriesPartitionsAndMockModularForms (QM.1 Jacobi-form nodes), AutomorphicGaloisRepresentations (a request to R17.4 for non-normal cubic base change), IntegralHeckeAndGaloisDeterminants and ShimuraData;
- RS-12 was revised (RS-12~3, 29 September; its AF.4 owner entry is unchanged);
- the fixes FIX-RT-AUDIT-13 and FIX-RT-AUDIT-15 changed `research/blueprint/audit/AUDIT-13.result.json` and `AUDIT-15.result.json` on 29 September; `data/library-coverage.json` (generated 21 September) does not yet contain them.

**Proposals still under review that these fixes touch.** RS-04, RS-09, RS-21 and RS-23 are unreviewed; RS-12~3 is awaiting review. Their links are not live. Corrections to them are for their next revision. RS-13 and RS-14 are accepted.

**Proposed Part IIs.** SmoothRepresentationsCharactersPartII (Hansen–Kaletha–Weinstein route 3, Hansen route 2) and MetaplecticAutomorphicFormsPartIIShimuraWaldspurger (Gan–Ichino route 1, Ichino–Prasanna route 4, Gan–Savin route 6) are accepted routes, but no design job, roadmap or stage exists for either yet. A fix that needs one of them is recorded for its design job.

**Disclosure.** This session did not write the red team, its verification, or any of the roadmaps named here. It did write the paper extractions DELIGNE-74, SCHOLZE-13, DELIGNE-80, KOLYVAGIN-90, FARGUES-SCHOLZE-21 and LUST-STEVENS-20, and the audit fixes AUDIT-01/03/05/06/07/08/09/13/14/15/16/17/18. Where the findings touch that work:
- **FIX-RT-AUDIT-13** made `ShimuraData:D5` the owner of the neatness definition in AA.4's duplicates note. Finding /28, as verified, moves that ownership to AdelicAlgebraicGroups; the note is corrected in /28.
- **FIX-RT-AUDIT-15** kept the AF.5 overlap in R18.3's duplicates (the subject of /31), kept R18.3 → R17.3 (/12), and removed MP.2 → QuadraticFormInvariants 6C as a supplier relation (/22). These agree with the verified findings; nothing there changes.
- **SCHOLZE-13** is Scholze's *p-adic Hodge theory for rigid-analytic varieties*, not the torsion paper of /15; none of its routes reaches these roadmaps. FARGUES-SCHOLZE-21 cites ReductiveGroupsPartII RG2.4 for the Cartan and Iwahori–Bruhat decompositions only (/7 adds a sub-stage after RG2.4 and does not change that). LUST-STEVENS-20 cites SR.2 and SR.3, which /21 and /27 use as suppliers.

In each case the fix follows the verifier's reason and nothing else.

## Summary

The "When" column says when an edit takes effect:
- **now:** the maintainer can apply it to `main` (READMEs, `data/atlas.json`, integrated decompositions, merged audits);
- **blueprint:** it goes into a packet through its blueprint job;
- **verdict:** a paper route changes stage and needs a review verdict;
- **RS:** a correction to an unreviewed restructuring proposal, for its next revision;
- **audit merge:** an audit note that reaches `data/library-coverage.json` through the orchestrator's audit merge (for AUDIT-13 and AUDIT-15, together with the pending FIX-RT-AUDIT-13 and FIX-RT-AUDIT-15 changes);
- **design:** it waits for the design of a proposed Part II;
- **link job:** an entry for the pending link job `LINK-tauceti_TauCetiRoadmap_QuadraticFormInvariants`.

| # | Finding | Fix | When |
|---|---|---|---|
| /1 | high, missing | New layer R17.4a: Gelbart–Jacquet's adjoint lift (Theorem 9.3) and JPSS non-normal cubic base change. New layer AL.3b: the GL_n converse theorems (Cogdell–Piatetski-Shapiro), whose n = 2 instance R16.5 states separately. R17.5 names Langlands' and Tunnell's routes. | now; blueprint |
| /2 | high, missing | One owner, new stage AF.1b: Casselman embedding, Langlands classification, discrete series modulo centre, Casselman–Wallach globalization (moved from AF.1), and the Weil groups W_ℝ, W_ℂ with the GL_n(ℝ), GL_n(ℂ) correspondence and factors. No AL.1a. R16.2/R16.3 list the GL₂(ℝ), GL₂(ℂ) cases. Two routes move to AF.1b. | now; verdict |
| /3 | high, missing | NE.0 is widened to every compact p-adic analytic group (its packet already plans Lazard's theorem); a Venjakob Auslander-regularity and grade node is requested; NE.0 → CC.5 and node links. | now; blueprint |
| /4 | high, missing | New stage AF.1c: Clozel–Delorme invariant Paley–Wiener and Arthur's multiplier theorem, imported by ET.1 and AS.6. AS.2 states the μ-function and Theorem 21.4 normalizing factors. BDK waits for the SmoothRepresentationsCharactersPartII design. | now; design |
| /5 | high, missing | AS.1 constructs the convergent M(w,λ), pseudo-Eisenstein series and Langlands' Lemmas 12.2–12.4 (over ℚ in Arthur; transported to F). AS.2 keeps continuation. The wave-packet identities move to AS.4. | now |
| /6 | high, missing | Kostant's theorem joins the single cochain owner AF.1a (split, characteristic 0, dominant integral λ; Tau Ceti's `weylVector`, `dotAction`). ALS.4 gets the van Est–Nomizu lattice comparison and the stratum formula with unnormalized induction. AF.1a → ALS.4. | now |
| /7 | high, missing | New sub-stage RG2.4:kneser-tits (Platonov, characteristic 0; Tits simplicity; no finite-index subgroups). AA.4 states Rapinchuk's Theorem 2.3 and keeps the rest of the global proof. | now |
| /8 | medium, missing | New early prefix AL.3:global-inputs: the GL_n Fourier–Whittaker expansion and the mirabolic Eisenstein series (Cogdell Proposition 5.4), importing AF.3, AL.0 and AL.1. | now |
| /9 | medium, error | R16.4 proves multiplicity one from AL.3:global-inputs (reached through R16.2); R16.5 keeps only the identification with the integral models. No backward edge. | now |
| /10 | medium, error | AF.3 → AL.2 (AL.3 transitively). | now |
| /11 | medium, error | R16.4 → R17.3 and R16.6 → R17.5; R16.6 proves the weight-one archimedean dictionary. | now |
| /12 | medium, error | R17.3 → R18.3; R18.4 through R18.3. | now; RS |
| /13 | medium, error | AL.5 names its actual consumers and drops algebraicity (owners under RS-14). AL.3 → AutomorphicPadicLFunctions:L1. AL.5 → L1 is not added. | now |
| /14 | medium, error | R16.1 names AL.0 as the owner of the Schwartz–Bruhat space; AL.0 → R16.1. RS-21 owners[27]–[28] and links corrected. | now; RS |
| /15 | medium, error | Theorem IV.2.1 and Corollaries IV.2.2–IV.2.3 move to a new TC.2:almost-comparison, before TC.2. CC.8 keeps the definition-level convention node. | now; RS |
| /16 | medium, error | Repair (b): CC.8 becomes the generic adapter; R31.1 and TC.2 prove their instances. CC.0 loses its Shimura comparison input. | now; RS |
| /17 | medium, missing | New sub-stage PadicMeasuresIwasawaAlgebras L1:banach-representations (Schikhof duality, Schneider–Teitelbaum Lemma 3.4 and Theorem 3.5), imported by CC.2, CC.5 and R30.2. | now |
| /18 | medium, error | IHG.2 → CC.8; CC.8 constructs the completed Hecke algebra and its semilocal decomposition (Gee–Newton 2.1.11, 2.1.14). R31.3 specializes. Proposition 3.4.16 is recorded only as a scoped lead for CC.4. | now |
| /19 | medium, missing | MP.6 states the two Siegel–Weil instances GZ.5 uses: convergent for (E,q) and for (B₀,q) with B division; regularized for B split. AS.2 → MP.6 and a node link to the GZ.5 Waldspurger node. The Part II imports these, not conversely. | now; design |
| /20 | medium, duplicate | New sub-stage MP.6:jacobi owns the Jacobi group, the Schrödinger–Weil representation, Jacobi forms, Fourier–Jacobi coefficients and theta decomposition. MP.7 (so MP.8), QM.1 and L2s import it. No L2 edge. | now; blueprint |
| /21 | medium, error | SR.0:abelian-category, SR.2, SR.3 and AF.1 → MP.3; MP.3 proves only what is specific to the cover. | now; blueprint |
| /22 | medium, error | Tau Ceti QuadraticFormInvariants 6c → MP.2; the real place is handled in MP.2. | now; link job |
| /23 | medium, error | AA.3 and AF.3 → MP.5; theta-specific convergence stays in MP. | now |
| /24 | medium, duplicate | ET.1 owns invariant orbital integrals; ET.1 → AS.6. AS.6 keeps the weighted ones. | now |
| /25 | medium, missing | AF.4 gains Wigner's lemma, the tempered range [q₀, q₀+ℓ₀] (Borel–Wallach III.3.3, Delorme) and the Vogan–Zuckerman classification, importing AF.1b. | now |
| /26 | medium, error | SR.4 → AF.2; AF.2 deduces dim π_v^{K_v} ≤ 1 at hyperspecial places for the Flath factorization. | now |
| /27 | medium, error | SR.2 and SR.4 → ALS.4, with SR.4's integral unnormalized transform. | now |
| /28 | medium, error | New early prefix AA.4:neat-levels, imported by AA.4, ALS.0, D5 and V0. D5 keeps the effective action. AUDIT-13's note is corrected. | now; audit merge; RS |
| /29 | medium, error | AF.1a owns the pair data, (𝔤,K)-modules as algebraic data and the relative cochain complex; AF.1a → AF.1. RS-04's owner entry follows. | now; RS; audit merge |
| /30 | medium, error | New suffix AF.4:rationality (torsion eigenclasses, rationality), importing ALS.3 and ALS.5; AF.4 keeps the local definitions. | now; RS |
| /31 | medium, duplicate | New prefix AF.5:algebraic-forms owns algebraic modular forms on groups compact at infinity; → AF.5 and R18.3. R18.3 keeps the quaternionic specialization. | now; RS; audit merge |

**Sources no one here could read.** What depends on them is kept as an open obligation, not stated as fact: the JPSS note *Relèvement cubique non normal* (C. R. Acad. Sci. Paris 292, 1981); Tate's Corvallis article *Number theoretic background*; Clozel–Delorme 1990 and Bernstein–Deligne–Kazhdan 1986; Arthur's 1983 multiplier paper [A9] and 1989 normalizing-factor paper [A15]; Platonov 1969 and Tits 1964; Lazard 1965 and Dixon–du Sautoy–Mann–Segal; Borel's *Introduction aux groupes arithmétiques*; the Yuan–Zhang–Zhang book or draft (its §1.5.1 is cited as the verifier read it); Kudla–Rallis; Eichler–Zagier; Gross's *Algebraic modular forms*; Borel–Wallach.

## Common points

**New stages.** Twelve are added. For each, the section of the finding that creates it gives its README text and record.

| New stage | Requires | Consumers | Finding |
|---|---|---|---|
| `GL2AutomorphicRepresentationsAndTransfer:R17.4a` | R17.4, AL.3, AL.3b, MP.5 | R17.5 | /1 |
| `AutomorphicLFunctionsAndLocalFactors:AL.3b` | AL.3 | R17.4a, R16.5 | /1 |
| `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs` | AF.3, AL.0, AL.1 | AL.3 | /8 |
| `AutomorphicFormsOnReductiveGroups:AF.1b` | AF.1, AL.1 | AF.1c, AF.2, AF.4, AL.2, AL.3, ET.1 | /2 |
| `AutomorphicFormsOnReductiveGroups:AF.1c` | AF.1b | ET.1, AS.6 | /4 |
| `ReductiveGroupsPartII:RG2.4:kneser-tits` | RG2.4 | AA.4 | /7 |
| `AdelicAlgebraicGroups:AA.4:neat-levels` | AA.1, AA.3 | AA.4, ALS.0, ShimuraData:D5, ShimuraVarieties:V0 | /28 |
| `PadicMeasuresIwasawaAlgebras:L1:banach-representations` | L0, L1, NE.0 | CC.2, CC.5, R30.2 | /17 |
| `TorsionCohomologyInfrastructure:TC.2:almost-comparison` | TC.1, CC.8 | TC.2 | /15 |
| `MetaplecticAutomorphicForms:MP.6:jacobi` | MP.5 | MP.7, QM.1, AutomorphicCongruences:L2s | /20 |
| `AutomorphicFormsOnReductiveGroups:AF.4:rationality` | AF.4, ALS.3, ALS.5 | — | /30 |
| `AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms` | AF.4 | AF.5, R18.3 | /31 |

**Reserved ids.** `research/blueprint/reserved-ids.json` reserves no id in any of these roadmaps, and none of the new ids is an atlas stage today.

**The real-group split.** Findings /2, /4, /6, /25, /29 and /30 all touch AutomorphicFormsOnReductiveGroups. Taken together, as the verifier's combined constraints ask, the roadmap becomes:
- **AF.1a** (unchanged position, no prerequisite inside AF): the algebraic cochain prefix (pairs, (𝔤,K)-modules as algebraic data, relative Lie algebra cochains, Kostant's theorem), and van Est.
- **AF.1**: the (𝔤,K)-module theory and Harish-Chandra's admissibility theorems; it imports AF.1a.
- **AF.1b**: real representation theory, globalization and the archimedean correspondence.
- **AF.1c**: invariant harmonic analysis.
- **AF.4**: local weights and (𝔤,K)-cohomology; **AF.4:rationality** after ALS.5; **AF.5:algebraic-forms** before AF.5.

Van Est still does not wait for globalization or Eisenstein continuation, as the README requires.

## /1 (high, missing): the GL(3) inputs of Langlands–Tunnell get a layer, R17.4a, and the GL_n converse theorem gets one owner, AL.3b

### What the verifier corrected
- Tunnell (1981), pp. 173–175, uses cubic base change for a possibly non-Galois cubic extension and GL(3), GL(2)×GL(3) automorphic theory; p. 174 names the Gelbart–Jacquet/JPSS input to Langlands' tetrahedral case. R17.4 supplies only cyclic base change and its iteration; R16.5 only a GL₂ converse theorem.
- Add the non-normal cubic theorem and the symmetric-square/GL(3) proof leaves before R17.5, with AL.3 supplying the integral theory. The AL.3-based prefix can precede both R16.5 and R17.5.
- Tunnell's announcement identifies these dependencies but does not prove the JPSS or Gelbart–Jacquet theorems. Their proof interiors and the exact converse theorem remain acquisition and decomposition obligations.
- **Do not claim that a GL(3) converse statement automatically specializes to the GL₂ theorem:** keep its separately checked twist family, growth, pole and archimedean hypotheses.

### State on main (8ae020f6)
- `content/campaign/GL2AutomorphicRepresentationsAndTransfer/README.md`, R17.5: "Prove the projective and linear lifting steps, including the octahedral case via Tunnell's argument. Use R16's converse theorem where that proof requires it." Its Dependencies line is "**Dependencies:** R17.4 (preceding layer)."
- R16.5: "Prove the exact GL₂ converse theorem used in R17, including its family of character twists, pole exclusions, vertical-strip/growth estimates and archimedean hypotheses; analytic continuation alone is not a converse theorem."
- No atlas stage mentions non-normal cubic base change, Gelbart–Jacquet or a GL_n converse theorem. The libraries have none of them either: searches of both pinned trees for GL(3), symmetric-square lifts, converse theorems, automorphic induction and cubic base change find only finite-group symmetric squares and Hopf-algebra base change.
- **New since the verification.** `research/blueprint/packets/AutomorphicGaloisRepresentations.json` (29 September) has request 22 to R17.4 for "base change for GL₂ along extensions of degree at most 3: Langlands for cyclic extensions and Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic ones", and request 23 to R17.5 for the tetrahedral and octahedral Artin conjecture. Both are needed by `R19.2/carayol-cubic-base-change-of-extraordinary`.

### Fix
**1. New stage `GL2AutomorphicRepresentationsAndTransfer:R17.4a`.** Insert after the R17.4 section of the GL2 README, before `<a id="r17-5"></a>`:

> <a id="r17-4a"></a>
>
> ## R17.4a. Non-normal cubic base change and the Gelbart–Jacquet lift
>
> **Milestone:** `R17.4a`
>
> Prove the two GL(3) inputs of the tetrahedral and octahedral cases of R17.5.
>
> 1. **The Gelbart–Jacquet lift** (Gelbart–Jacquet, Ann. Sci. ÉNS 11 (1978), Theorem (9.3), pp. 534–535). Let σ be a unitary cuspidal automorphic representation of GL₂(𝔸_F) such that σ ≇ σ ⊗ χ for every idele class character χ ≠ 1. Then L₂(s, σ, χ) is entire for every χ; every σ_v has a lift π_v to GL₃(F_v); and π = ⊗π_v is cuspidal automorphic, with L(s, π ⊗ χ) = L₂(s, σ, χ), the degree-three (adjoint) L-function of σ twisted by χ. The dihedral case σ ≅ σ ⊗ χ, whose lift is not cuspidal, is kept separate (their §3.7). The proof shows L₂ entire by Shimura's integral on the metaplectic cover (their §§5–8), then applies the GL(3) converse theorem of AL.3b with twists by idele class characters.
> 2. **Non-normal cubic base change** (Jacquet–Piatetski-Shapiro–Shalika, *Relèvement cubique non normal*, C. R. Acad. Sci. Paris 292 (1981)), in the form Tunnell quotes (Bull. AMS 5 (1981), p. 173). Let K/F be a cubic extension, not necessarily Galois, and π a cuspidal automorphic representation of GL₂(𝔸_F). There is an automorphic representation Π = BC_{K/F}(π) of GL₂(𝔸_K) such that, for almost all places v of F and each place w of K above v, π_v = π(σ_v) implies Π_w = π(Res^{W_{F_v}}_{W_{K_w}} σ_v). Π is not asserted to be cuspidal. The proof uses automorphic forms on GL(3) and GL(2) × GL(3): the Rankin–Selberg theory of AL.3 and the converse theorem of AL.3b.
> 3. **The local statement** that the lift corresponds to restriction of the Weil–Deligne representation, for principal series, special and cuspidal π_v and local extensions of degree at most 3, which AutomorphicGaloisRepresentations R19.2 requests.
>
> The metaplectic Eisenstein and theta inputs of (1) come from MetaplecticAutomorphicForms MP.5. The JPSS note and the proof interiors of (1) and (2) are acquisition and decomposition obligations: this stage records the statements and their inputs, and Tunnell's announcement does not certify them.
>
> **Dependencies:** R17.4 (preceding layer); [AutomorphicLFunctionsAndLocalFactors AL.3](../AutomorphicLFunctionsAndLocalFactors/README.md); [AutomorphicLFunctionsAndLocalFactors AL.3b](../AutomorphicLFunctionsAndLocalFactors/README.md); [MetaplecticAutomorphicForms MP.5](../MetaplecticAutomorphicForms/README.md).

Stage record: `requires` = [R17.4, AL.3, AL.3b, MetaplecticAutomorphicForms:MP.5]; consumer R17.5.

**2. New stage `AutomorphicLFunctionsAndLocalFactors:AL.3b`.** Insert before "### AL.4. General unramified L-group factors" in `content/campaign/AutomorphicLFunctionsAndLocalFactors/README.md`:

> ### AL.3b. Converse theorems for GL_n
>
> Prove the converse theorems of Cogdell and Piatetski-Shapiro (Cogdell, *Lectures on L-functions, converse theorems, and functoriality for GL_n*, Theorems 10.1–10.2, pp. 78–79). Let π be an irreducible admissible smooth representation of GL_n(𝔸_F) with automorphic central character, whose L(s, π) converges for Re s ≫ 0, and let S be a finite set of finite places. Call L(s, π × π′) *nice* if L(s, π × π′) and L(s, π̃ × π̃′) continue to entire functions, bounded in vertical strips, with L(s, π × π′) = ε(s, π × π′) L(1 − s, π̃ × π̃′). Let T^S(m) be the cuspidal representations π′ of GL_d(𝔸_F), 1 ≤ d ≤ m, unramified at every place of S.
> - If L(s, π × π′) is nice for every π′ ∈ T^S(n − 1), then π is cuspidal automorphic when S = ∅; when S ≠ ∅ it is quasi-automorphic: some automorphic π₁ has π₁,v ≅ π_v for all v ∉ S.
> - For n ≥ 3 the same holds with T^S(n − 2).
>
> The proof uses the Fourier–Whittaker expansion of AL.3:global-inputs and the global Rankin–Selberg integrals of AL.3. The n = 3 case with twists by idele class characters is the one Gelbart–Jacquet and JPSS use (GL2AutomorphicRepresentationsAndTransfer R17.4a). The n = 2 case with S = ∅ is the Jacquet–Langlands converse theorem that R16.5 states for R17. Each consumer states the instance it applies, with its twist family and archimedean hypotheses: a GL(3) statement is not a GL(2) statement.

Stage record: `requires` = [AL.3]; consumers R17.4a and GL2AutomorphicRepresentationsAndTransfer:R16.5.

**3. R17.5.**
- Replace "Prove the projective and linear lifting steps, including the octahedral case via Tunnell's argument. Use R16's converse theorem where that proof requires it." with:
  > Prove the projective and linear lifting steps: the tetrahedral case by Langlands' argument (cyclic base change from R17.4 and the Gelbart–Jacquet lift of R17.4a), and the octahedral case by Tunnell's argument, which uses R17.4a's non-normal cubic base change and the fact that the octahedral group has no element of order 6 (Tunnell, Bull. AMS 5 (1981), pp. 174–175). Use the n = 2 converse theorem as R16.5 states it where that proof requires it, and R16.6's weight-one dictionary for the weight-one interpretation.
- Dependencies line: "**Dependencies:** R17.4 (preceding layer)." → "**Dependencies:** R17.4a (preceding layer); [GL2AutomorphicRepresentationsAndTransfer R16.6](README.md#r16-6)." (The R16.6 edge is /11's.) In `data/atlas.json` R17.5's `requires` keeps R17.4 and gains R17.4a.

**4. R16.5.** Replace "Prove the exact GL₂ converse theorem used in R17, including its family of character twists, pole exclusions, vertical-strip/growth estimates and archimedean hypotheses; analytic continuation alone is not a converse theorem." with:
> Import the GL_n converse theorem of AutomorphicLFunctionsAndLocalFactors AL.3b and state separately its n = 2 instance used in R17, with its family of character twists, pole exclusions, vertical-strip/growth estimates and archimedean hypotheses checked for n = 2; they are not inferred from the GL(3) statement, and analytic continuation alone is not a converse theorem.

Append "; [AutomorphicLFunctionsAndLocalFactors AL.3b](../AutomorphicLFunctionsAndLocalFactors/README.md)" to R16.5's Dependencies line, before its final full stop.

**5. Required examples** (end of the GL2 README). Replace "Check a dihedral representation induced from a quadratic character, the octahedral mod-3 application, a cyclic base change becoming noncuspidal, and a quaternion algebra with the permitted ramification parity." with:
> Check a dihedral representation induced from a quadratic character, the octahedral mod-3 application, a cyclic base change becoming noncuspidal, a quaternion algebra with the permitted ramification parity, and the Gelbart–Jacquet lift of a dihedral σ (noncuspidal) against a non-dihedral one (cuspidal).

**6. Edges.** Add R17.4 → R17.4a, AL.3 → R17.4a, AL.3b → R17.4a, MP.5 → R17.4a, R17.4a → R17.5, AL.3 → AL.3b and AL.3b → R16.5. Cycle tests: all acyclic.

**7. Packet request (blueprint).** In `AutomorphicGaloisRepresentations.json`, request 22's non-Galois cubic part is now R17.4a's item 3. When that blueprint is next revised, its request for "Jacquet–Piatetski-Shapiro–Shalika for non-Galois cubic ones" should name `GL2AutomorphicRepresentationsAndTransfer:R17.4a` as supplier, and the cyclic part R17.4.

### Not done, and why
- **The JPSS note was not read.** Its statement is Tunnell's quotation; the Gelbart–Jacquet statement was read in the paper.
- **Proof interiors.** Gelbart–Jacquet §§5–8 (the Shimura integral on the metaplectic cover) and the JPSS proof are not decomposed. They are the obligations the verifier names.

## /2 (high, missing): one owner for real representation theory and the archimedean correspondence, AF.1b

### What the verifier corrected
- Jacquet's *Archimedean Rankin–Selberg integrals* (pp. 2–4) uses the archimedean Weil group, the attached GL₁/GL₂ representations and the discrete series; Cogdell Lecture 8 (pp. 61–62) gives the classification and the Γ-factor dictionary; Bernstein–Krötz (pp. 3–4, 22, 40) uses Casselman's embedding and the Langlands/discrete-series reduction inside the globalization proof. AF.1 plans globalization but not these inputs; ET.6 is nonarchimedean.
- **Choose one AF real-representation successor after an algebraic/cochain prefix; move globalization there, and import it into AL.2/AL.3 and the GL₂ dictionary. Do not implement both AL.1a and AF.1b as independent classification owners.**
- AL.1 keeps Tate's rank-one factors; higher Weil-representation factors need the dictionary.
- Keep discrete series modulo centre, rank conventions, limits and coefficient/parabolic-cohomology hypotheses explicit. The compact-Cartan criterion is not equality of real split ranks.
- The accepted Chenevier–Taïbi and Boxer–Pilloni routes ask AF.1/AF.4 for real theory, while Kaletha's refuses to credit it to the basic stage: an ownership boundary, not a mathematical contradiction.

So the finding's AF.1b alternative is taken, and no AL.1a is created.

### State on main (8ae020f6)
- AF.1 (`content/campaign/AutomorphicFormsOnReductiveGroups/README.md`): "Prove finite K-type multiplicities for admissible modules; build smooth moderate-growth Fréchet globalizations of finite-length Harish–Chandra modules and the uniqueness/exactness comparison. Define relative Lie algebra cochains Hom_K(∧^q(g/k),V), differential, functoriality and long exact sequences. Handle disconnected K via its finite component group. These analytic globalization proofs are targets, not an assumed black box."
- AF.1's consumers: AF.2, AF.4, AL.2, AL.3, ET.1, MP.5.
- AL.2: "At real and complex places use the Casselman–Wallach globalization, Schwartz estimates and meromorphic parameter integrals to construct the gamma factors and prove their functional equation; a Laurent-polynomial gcd is not an archimedean construction." AL.3: "Separately develop the archimedean Whittaker functional and uniqueness/continuity API on the AF.1 globalization,".
- Accepted routes (both papers accepted): CHENEVIER-TAIBI-20 route 2 (`routes[1]`) sends `discrete-series-existence` and `archimedean-llc-gln` to AF.1; GAN-ICHINO-18 route 5 (`routes[4]`) sends `llc-gln-arch` to AF.1. KALETHA-16 route 5 says "The real local Langlands and Shelstad packet theorems are additional results, not credited to this basic representation stage." BOXER-PILLONI-26 route 14 and CALEGARI-GERAGHTY-20 route 10 send limits of discrete series and Harish-Chandra's parametrization to AF.1/AF.4.
- **New since the verification:** the AutomorphicLFunctionsAndLocalFactors packet requests from AF.1 "actual finite-length admissible real (g,K)-modules and their smooth moderate-growth Frechet globalizations" for AL.2–AL.3, and the MP.0 packet requests AF.1's globalization for MP.0 and MP.5.
- **Libraries.** Mathlib has the archimedean Γ-factors: `Complex.Gammaℝ s = π ^ (-s / 2) * Gamma (s / 2)` and `Complex.Gammaℂ s = 2 * (2 * π) ^ (-s) * Gamma s` (`Mathlib/Analysis/SpecialFunctions/Gamma/Deligne.lean:45`, `:53`), with `Gammaℝ_mul_Gammaℝ_add_one` (`:124`). Neither library has a Weil group of ℝ or ℂ, (𝔤,K)-modules, discrete series or the Langlands classification.

### Fix
**1. New stage `AutomorphicFormsOnReductiveGroups:AF.1b`.** Insert after the AF.1a section of the AF README, before "### AF.2.":

> ### AF.1b. Real reductive representation theory
>
> Import AF.1's (𝔤,K)-modules and Harish-Chandra's admissibility theorems, and the archimedean rank-one factors Γ_ℝ, Γ_ℂ of AutomorphicLFunctionsAndLocalFactors AL.1 (Mathlib's `Complex.Gammaℝ`, `Complex.Gammaℂ`). For G(ℝ), G connected reductive (Bernstein–Krötz's linear reductive setting), prove:
> 1. **Casselman's subrepresentation theorem**: every Harish-Chandra module V embeds in a representation induced from a finite-dimensional module of a minimal parabolic (Bernstein–Krötz, Theorem 4.4, p. 23, citing Wallach 4.2.4), by 𝔫-homology.
> 2. **The Langlands classification**: unique irreducible quotients of standard modules with tempered inducing data and parameter in the positive chamber, exhausting the irreducible admissible modules; for GL_n(ℝ), Knapp, *Local Langlands correspondence: the Archimedean case*, Theorem 1, p. 400.
> 3. **Discrete series modulo the centre**: Harish-Chandra's criterion that G(ℝ) has discrete series modulo its centre if and only if it has a Cartan subgroup compact modulo the centre (for semisimple G: rank 𝔤 = rank 𝔨, complex ranks, not an equality of real split ranks); Harish-Chandra parameters; non-degenerate limits of discrete series.
> 4. **The Casselman–Wallach globalization**, moved here from AF.1: smooth moderate-growth Fréchet globalizations of finite-length Harish–Chandra modules and their uniqueness and exactness (Bernstein–Krötz, Theorem 1.1 and §§5, 7, 8, 12). Its proof uses (1) and the reduction, through (2), to discrete series (Bernstein–Krötz, pp. 3–4, 22, 40–41). These analytic globalization proofs are targets, not an assumed black box.
> 5. **The correspondence for GL_n(ℝ) and GL_n(ℂ).**
>    - W_ℂ = ℂ^× and W_ℝ = ℂ^× ∪ jℂ^×, with j² = −1 and jzj⁻¹ = z̄. Every finite-dimensional semisimple representation of W_ℝ is a sum of irreducibles of dimension one, (+, t) and (−, t), or two, (l, t) with l ≥ 1 (Knapp (3.2)–(3.3) and the lemma on p. 403).
>    - The bijection with irreducible admissible representations of GL_n(ℝ) (Knapp, Theorem 2, p. 403) and GL_n(ℂ) (Theorem 5, p. 406); for n = 2 and an irreducible unitary two-dimensional parameter it gives a discrete series representation (Cogdell, Lecture 8, p. 61).
>    - L- and ε-factors defined from AL.1's: L(s, (+, t)) = Γ_ℝ(s + t), L(s, (−, t)) = Γ_ℝ(s + t + 1), L(s, (l, t)) = Γ_ℂ(s + t + l/2), with ε = 1, i and i^{l+1}; over ℂ, L = Γ_ℂ(s + t + |l|/2) and ε = i^{|l|} for z ↦ [z]^l |z|_ℂ^t (Knapp (3.6)–(3.7), p. 404, and (4.6)–(4.7), p. 406). Prove that they agree with the Godement–Jacquet factors of AL.2 (Knapp, Theorem 3, p. 404, a theorem of Jacquet).
>    - For GL₂(ℝ): the discrete series D(k) of weight k ≥ 2 (Knapp's D_{k−1}, parameter (k − 1, 0)) has L(s, D(k)) = Γ_ℂ(s + (k − 1)/2) and ε = i^k (Cogdell, Lecture 8, p. 62, for L). At k = 1 the parameter (+, 0) ⊕ (−, 0) gives the principal series π(1, sgn), the limit of discrete series, with L = Γ_ℝ(s)Γ_ℝ(s + 1) = Γ_ℂ(s).
>
> AL.1 keeps Tate's rank-one factors; the factors of higher-dimensional Weil representations are defined here from them. Endoscopic packets and Shelstad's theorems stay with the endoscopy roadmaps.

Stage record: `requires` = [AF.1, AutomorphicLFunctionsAndLocalFactors:AL.1]; consumers AF.1c (/4), AF.2, AF.4, AL.2, AL.3, EndoscopicTransferAndUnitaryTraceComparison:ET.1.

**2. AF.1.** Replace the passage quoted above ("Prove finite K-type multiplicities for admissible modules; … not an assumed black box.") with:
> Import the pair (𝔤, K), (𝔤,K)-modules as algebraic data and the relative Lie algebra cochain complex Hom_K(∧^q(𝔤/𝔨), V) from AF.1a. Prove finite K-type multiplicities for admissible modules. Handle disconnected K via its finite component group. The smooth moderate-growth Fréchet globalizations of finite-length Harish–Chandra modules and their uniqueness and exactness are proved in AF.1b.

(The first sentence is /29's. The sentence "Prove finite K-type multiplicities for admissible modules" is the subject of the low finding /40, which is out of scope; it is kept verbatim.)

**3. Other AF sentences.**
- Scope: "AF.1 builds the real reductive theory missing from that existing scope." → "AF.1a, AF.1, AF.1b and AF.1c build the real reductive theory missing from that existing scope."
- AF.1a: "Smooth globalization in AF.1 uses the separately archived Bernstein–Krötz primary source; van Est does not wait for Eisenstein continuation." → "Smooth globalization in AF.1b uses the separately archived Bernstein–Krötz primary source; van Est does not wait for globalization or Eisenstein continuation."
- Completion contracts: "**Applies to:** `AF.0`, `AF.1`, `AF.1a`, `AF.2`, `AF.4`." → "**Applies to:** `AF.0`, `AF.1`, `AF.1a`, `AF.1b`, `AF.2`, `AF.4`." Its globalization paragraph then applies to AF.1b.

**4. AL.2 and AL.3.**
- AL.2: replace "At real and complex places use the Casselman–Wallach globalization, Schwartz estimates and meromorphic parameter integrals to construct the gamma factors and prove their functional equation; a Laurent-polynomial gcd is not an archimedean construction." with "At real and complex places use AutomorphicFormsOnReductiveGroups AF.1b's Casselman–Wallach globalization and Langlands classification, Schwartz estimates and meromorphic parameter integrals to construct the gamma factors and prove their functional equation, and prove that they equal the factors AF.1b attaches to the Langlands parameter; a Laurent-polynomial gcd is not an archimedean construction."
- AL.3: "on the AF.1 globalization," → "on the AF.1b globalization,".

**5. R16.2 and R16.3** (GL2 README).
- R16.2: after "Prove its explicit principal-series/special/supercuspidal classification formulas and the conductor/newvector theorem, including dimensions of congruence-invariants, normalization of a newvector and character/twist calculations." insert:
  > At the real and complex places specialize AutomorphicFormsOnReductiveGroups AF.1b to GL₂(ℝ) and GL₂(ℂ): principal series, the discrete series D(k) of weight k ≥ 2 with L(s, D(k)) = Γ_ℂ(s + (k − 1)/2), and the limit of discrete series π(1, sgn) at k = 1; over ℂ, principal series only.
- R16.3: replace "Prove the arithmetic/unitary normalization bridge, determinant, character twist, Artin conductor and L/epsilon-factor formulas in these explicit coordinates, and identify the nilpotent monodromy for the special representation." with:
  > Prove the arithmetic/unitary normalization bridge, determinant, character twist, Artin conductor and L/epsilon-factor formulas in these explicit coordinates, and identify the nilpotent monodromy for the special representation. At the archimedean places import AutomorphicFormsOnReductiveGroups AF.1b's correspondence for GL₂(ℝ) and GL₂(ℂ) and prove the same formulas there (ε(D(k)) = i^k).

R16.2 and R16.3 reach AF.1b through AL.2, so no new edge is needed.

**6. Edges.** Add AF.1 → AF.1b, AL.1 → AF.1b, and AF.1b → AF.2, AF.4, AL.2, AL.3, ET.1. Cycle tests: all acyclic (AL.1's closure is AL.0, AA.0, RG2.0 and Tau Ceti layers; it has no AF stage). MP.5 reaches AF.1b through AF.3 once /23 is applied; no direct edge.

**7. Paper routes (verdict).**
- `PAPER-CHENEVIER-TAIBI-20.result.json`, `routes[1]`: `stages` `["AutomorphicFormsOnReductiveGroups:AF.1"]` → `["AutomorphicFormsOnReductiveGroups:AF.1b"]`. In `reason`, replace "AF.1 owns the foundations of real reductive representation theory." with "AF.1b owns real reductive representation theory: discrete series, the Langlands classification and the archimedean correspondence (RT-AREA-automorphic-1 fixes, /2)."
- `PAPER-GAN-ICHINO-18.result.json`, `routes[4]`: `stages` → `["AutomorphicFormsOnReductiveGroups:AF.1b"]`. In `reason`, "which fits AF.1's real representation theory" → "which AF.1b owns".
- For consistency, the maintainer may also add AF.1b to the stages of BOXER-PILLONI-26 `routes[13]` (limits of discrete series) and CALEGARI-GERAGHTY-20 `routes[9]` (Harish-Chandra's parametrization). KALETHA-16 `routes[4]` needs no change: its items are the admissible-module foundation.

Each changed route needs a new review verdict.

**8. Packets (blueprint).** The AL packet's request to AF.1 and the MP.0 packet's AF.1 request, where they ask for globalization, should name AF.1b as supplier.

### Not done, and why
- **No AL.1a.** The verifier forbids two classification owners.
- **Harish-Chandra's discrete-series criterion and parameters** were not read in a primary source. Knapp's survey and Bernstein–Krötz state what is used above; the criterion's proof is an acquisition obligation. Tate's Corvallis article, which the finding cites for W_ℝ and ε-factors, is not publicly readable; Knapp's (3.6)–(3.7) were used instead.

## /3 (high, missing): Lazard's theorem is owned by a widened NE.0, and CC.5 imports it

### What the verifier corrected
- CC.5 and its accepted nodes use Lazard noetherianity, the canonical topology and noncommutative grade/codimension. NE.0 is not reachable from CC.5, and PadicMeasuresIwasawaAlgebras L1/L4 do not give the general theorem.
- Calegari–Dimitrov–Tang's item `lazard` is a cohomology computation for powerful torsion-free groups, not general noetherianity; it only corroborates NE.0's direction.
- **Widen one foundational NE.0 prefix, importing the existing L1 carrier, to compact p-adic analytic groups with O the integers of a finite extension of ℚ_p. Separate noetherianity from Auslander regularity/global dimension; use an open uniform subgroup and prove descent with its precise p-torsion assumptions. Link that producer to CC.5.** Nothing is claimed for arbitrary profinite groups or coefficient rings.

### State on main (8ae020f6)
- `content/campaign/NoncommutativeAndEquivariantIwasawa/README.md`, NE.0: "For an admitted normal subgroup H with G/H isomorphic to Zp, prove the needed noetherian and module-finiteness facts under the exact group hypotheses." NE.0's only consumer is NE.1.
- CC.5 (`content/campaign/CompletedCohomologyPartII/README.md`): "**Dependencies:** CC.3–CC.4; PadicMeasuresIwasawaAlgebras L1." Its decomposition nodes `CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` ("rests on Lazard's noetherianity") and `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` have no link from NE.
- **New since the verification: most of the widening is already planned.** `research/blueprint/packets/NoncommutativeAndEquivariantIwasawa.json` (NE.0 nodes added 28 September) has:
  - `NE.0/compact-padic-analytic-group` (open normal uniform subgroup; "Lazard; Dixon–du Sautoy–Mann–Segal Corollary 8.34");
  - `NE.0/iwasawa-noetherian`: "For a compact p-adic analytic group G, Λ(G) = ℤ_p⟦G⟧ and Ω(G) = F_p⟦G⟧ are left and right noetherian complete semilocal rings; … (Lazard V.2.2.4). The same holds for O⟦G⟧";
  - `NE.0/iwasawa-free-over-open-subgroup` and `NE.0/iwasawa-finite-global-dimension` (global dimension d + 1 without elements of order p).
  - It has **no Auslander-regularity or grade node**. Its gap "Lazard's theory of p-adic analytic groups has no owner" says the group-theoretic equivalences need an owner.
- `data/library-coverage.json` lists NE.0 under CC.5's duplicates: "the Lazard input CC.5 uses". No library has Iwasawa algebras of nonabelian p-adic Lie groups; Tau Ceti has pro-p groups (`TauCeti.IsProP`, `Topology/Algebra/Group/Profinite/ProP/Basic.lean:53`) and Mathlib the abstract measures `D(X, R)` (`Mathlib/NumberTheory/Padics/Measure/Basic.lean:43`).

### Fix
**1. NE.0 text.** Replace "For an admitted normal subgroup H with G/H isomorphic to Zp, prove the needed noetherian and module-finiteness facts under the exact group hypotheses." with:
> For every compact p-adic analytic group G (a profinite group with an open normal uniform pro-p subgroup; Venjakob, *On the structure theory of the Iwasawa algebra of a p-adic Lie group*, p. 5, and Ardakov–Brown, *Ring-theoretic properties of Iwasawa algebras*, §2.3, citing Lazard and Dixon–du Sautoy–Mann–Segal) and O the integers of a finite extension of ℚ_p, prove:
> - **Lazard's theorem**: O[[G]] and k[[G]] are left and right noetherian complete semilocal rings, local when G is pro-p (Lazard V.2.2.4, as Schneider–Teitelbaum §3, p. 13, and Ardakov–Brown, Theorem 4.1, p. 9, state it), by passing to an open uniform subgroup and descending along the finite free extension Λ(U) ⊂ Λ(G).
> - Separately, **for G without elements of order p**: Λ(G) has global dimension d + 1 and Ω(G) has d (Ardakov–Brown, Theorem 5.1, p. 14), and Λ(G) is Auslander regular (Venjakob, Theorem 3.26, p. 18). Define the grade j(M) = min{j : Ext^j(M, Λ) ≠ 0} of a finitely generated module and its codimension (Ardakov–Brown §5.3, p. 14), as CompletedCohomologyPartII CC.5 uses them.
>
> Then, for an admitted normal subgroup H with G/H isomorphic to Zp, prove the needed noetherian and module-finiteness facts under the exact group hypotheses. Nothing is claimed for arbitrary profinite groups or arbitrary coefficient rings.

Replace "**Source route.** AE-CFKSV algebraic framework; select primary Lazard/Venjakob results for each noetherian or homological claim." with "**Source route.** AE-CFKSV algebraic framework; Lazard V.2.2.4 for noetherianity; Venjakob (J. Eur. Math. Soc. 4 (2002)), Theorem 3.26, for Auslander regularity; Ardakov–Brown's survey for the global-dimension and grade statements."

**2. Edges.** Add NE.0 → CC.5 (acyclic: NE.0's ancestors are PadicMeasuresIwasawaAlgebras L0/L1 and Tau Ceti ProfiniteProPGroups). CC.5's Dependencies line: "**Dependencies:** CC.3–CC.4; PadicMeasuresIwasawaAlgebras L1." → "**Dependencies:** CC.3–CC.4; PadicMeasuresIwasawaAlgebras L1 and L1:banach-representations; NoncommutativeAndEquivariantIwasawa NE.0." (L1:banach-representations is /17's.)

**3. Decomposition links** (`data/decompositions/CompletedCohomologyPartII.json`, `links`). Add `NoncommutativeAndEquivariantIwasawa:NE.0` → `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` (reason: Lazard's noetherianity of O[[G₀]]) and NE.0 → `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` (reason: Auslander regularity and grade for p-torsion-free G₀). Both cycle tests are acyclic. When the NE packet is promoted, the links can name `NE.0/iwasawa-noetherian` and the new grade node.

**4. NE packet (blueprint).** Request for the NE blueprint job: add a node `NE.0/auslander-regular-grade`: "If the compact p-adic analytic group G has no element of order p, Λ(G) (and Λ_O(G)) is Auslander regular (Venjakob, Theorem 3.26); for a finitely generated module M define j(M) = min{j : Ext^j_Λ(M, Λ) ≠ 0}; every submodule N of Ext^j_Λ(M, Λ) has j(N) ≥ j (the Auslander condition); the dimension of M is d + 1 − j(M) over Λ(G), and d − j(M) over Ω(G)." Its prerequisites are `NE.0/iwasawa-noetherian` and `NE.0/iwasawa-finite-global-dimension`.

### Not done, and why
- **Who owns the group theory.** The NE packet's gap asks for a roadmap for p-adic analytic groups or a Part II of Tau Ceti's ProfiniteProPGroups. The verifier's repair is the NE.0 prefix; the group-theoretic equivalences stay stated there as imported statements, and the packet's gap stays open.
- **Primary sources.** Lazard 1965 and Dixon–du Sautoy–Mann–Segal were not read; their theorems are cited through Venjakob, Schneider–Teitelbaum and Ardakov–Brown.

## /4 (high, missing): a single real harmonic-analysis supplier, AF.1c; normalizing factors in AS.2; BDK waits for its Part II

### What the verifier corrected
- Arthur's survey exhibits the multiplier theorem (§20, Theorem 20.4), local normalizing factors and the μ-function (§21, Theorem 21.4) and the trace Paley–Wiener spaces used by invariantization (§23). AS.2 and AS.6 do not produce them; ET.1's unitary real cases are neither a replacement nor an ancestor of AS.6.
- The BDK producer is the proposed SmoothRepresentationsCharactersPartII: pending, not integrated.
- **Keep the local normalizing-factor theorem in AS.2, and create a single real harmonic-analysis supplier before ET.1 and AS.6.** With /24, do not put the supplier inside AS.6 and ask ET.1 to import AS.6: ET.1 → AS.6 would then close a cycle.
- The original Clozel–Delorme, BDK and Arthur proofs are still required.

So the finding's "local nodes of AS.6" option is excluded, and the supplier is a new AF stage.

### State on main (8ae020f6)
- AS.2 (`content/campaign/AutomorphicSpectralTheory/README.md`): "Construct normalized intertwiners only after supplying the normalizing factors used in that case."
- AS.6: "Develop weighted orbital integrals, weighted characters, (G,M)-families, convergence and the fine expansions; then construct the invariant distributions by the invariantization recursion." AS.6 requires AS.3 and AS.4.
- ET.1 (`content/campaign/EndoscopicTransferAndUnitaryTraceComparison/README.md`): "These require the real character/Paley–Wiener and Clozel–Delorme/Labesse pseudocoefficient arguments beyond mere existence of (g,K)-modules. Construct them here from AF.1's real representation foundation."
- PAPER-HANSEN-KALETHA-WEINSTEIN-22 `routes[2]` (accepted) proposes SmoothRepresentationsCharactersPartII with "(4) the trace Paley–Wiener theorem of Bernstein–Deligne–Kazhdan" (item 126). PAPER-HANSEN-26 `routes[1]` (new, 29 September, accepted) joins it. No design job exists.
- No library has a Paley–Wiener theorem, orbital integrals or intertwining operators.

### Fix
**1. New stage `AutomorphicFormsOnReductiveGroups:AF.1c`.** Insert after AF.1b:

> ### AF.1c. Real invariant harmonic analysis
>
> Import AF.1b. For a real reductive group, and finite products over the archimedean places of a number field, prove:
> - **The invariant Paley–Wiener theorem of Clozel–Delorme** (Ann. Sci. ÉNS 23 (1990), 193–228): the image of the K-finite compactly supported smooth functions under f ↦ (π ↦ tr π(f)) on tempered representations is the space of functions of finite support in the discrete parameters and of Paley–Wiener type in each continuous parameter (as Arthur, *An introduction to the trace formula*, §23, p. 146, describes it).
> - **Arthur's Paley–Wiener multiplier theorem** [A9, Theorem 4.2], as Arthur's Theorem 20.4 (p. 119) states it: a canonical action f ↦ f_α of E(𝔥)^W on H(G(F_∞)) with π(f_α) = α̂(ν_π) π(f) for every π, and if f ∈ H_N(G(F_∞)) and α is supported where ‖H‖ ≤ N_α, then f_α ∈ H_{N+N_α}(G(F_∞)).
>
> These are the real inputs of AutomorphicSpectralTheory AS.6's invariantization and fine spectral expansion, and of EndoscopicTransferAndUnitaryTraceComparison ET.1's pseudocoefficients and real transfer. The original proofs (Clozel–Delorme 1990, Arthur 1983) are not in the survey and remain to be acquired and decomposed.

Stage record: `requires` = [AF.1b]; consumers ET.1, AS.6.

**2. ET.1.** Replace "These require the real character/Paley–Wiener and Clozel–Delorme/Labesse pseudocoefficient arguments beyond mere existence of (g,K)-modules. Construct them here from AF.1's real representation foundation." with:
> These require the real character/Paley–Wiener and Clozel–Delorme/Labesse pseudocoefficient arguments beyond mere existence of (g,K)-modules. Import the discrete series and their characters from AutomorphicFormsOnReductiveGroups AF.1b and the invariant Paley–Wiener theorem from AF.1c; construct the pseudocoefficients and the unitary-case transfer here.

**3. AS.2 (normalizing factors).** Replace "Construct normalized intertwiners only after supplying the normalizing factors used in that case." with:
> Construct Harish-Chandra's μ-function through J_{P|P̄}(π_{v,λ}) J_{P̄|P}(π_{v,λ}) = μ_M(π_{v,λ})⁻¹, and prove the general existence of local normalizing factors (Arthur, *An introduction to the trace formula*, Theorem 21.4, p. 135, citing [A15, Theorem 2.1]): meromorphic scalar functions r_{Q|P}(π_{v,λ}) such that R_{Q|P}(π_{v,λ}) = r_{Q|P}(π_{v,λ})⁻¹ J_{Q|P}(π_{v,λ}) satisfy
> (i) R_{Q′|P} = R_{Q′|Q} R_{Q|P};
> (ii) the K_v-finite matrix coefficients are rational functions of the λ(α^∨) (v archimedean) or of the q_v^{−λ(α^∨)} (v nonarchimedean);
> (iii) R_{Q|P}(π_{v,λ}) is unitary for λ ∈ i𝔞*_M when π_v is unitary;
> (iv) R_{Q|P}(π_{v,λ}) fixes the characteristic function of K_v when G is unramified at v;
> and r_{P|P̄} r_{P̄|P} = μ_M⁻¹ when M is maximal. Construct normalized intertwiners from these factors; AS.6's weighted characters use them. The proof of [A15, Theorem 2.1] is not in the survey and remains to be acquired.

**4. AS.6 (Paley–Wiener).** This edit is combined with /24's, which rewrites the same sentence; the full replacement is given there. It imports AF.1c's theorems, and records the p-adic trace Paley–Wiener theorem as a pending input.

**5. Edges.** Add AF.1b → AF.1c, AF.1c → ET.1 and AF.1c → AS.6. Cycle tests: acyclic.

**6. For the SmoothRepresentationsCharactersPartII design (design).** When that Part II is designed, its BDK node (HKW item 126) is imported by AS.6: add the edge from that node to `AutomorphicSpectralTheory:AS.6`. The verifier notes the Part II imports ET.0–ET.1, which do not depend on AS; after /24 (ET.1 → AS.6) this is still acyclic, because the edge runs from the Part II into AS.6, not out of it. The cycle test must be repeated when the Part II's stages exist.

### Not done, and why
- **The p-adic trace Paley–Wiener theorem** is not planned here: the verifier assigns it to the pending Part II. Until then AS.6's text names it as an input without an edge.
- **Primary sources.** Clozel–Delorme, BDK and Arthur's [A9], [A15] were not read; the statements are Arthur's survey's.

## /5 (high, missing): convergent intertwiners and pseudo-Eisenstein series before continuation

### What the verifier corrected
- Arthur §12 (Lemmas 12.2–12.4, pp. 65–66) supplies square-integrable pseudo-Eisenstein series, the inner product formula with convergent M(w,λ), and the decomposition by cuspidal data, as inputs to continuation and to the spectral decomposition. No stage states them.
- AS.1 already uses M in its constant term, while AS.2 constructs it; AS.3 uses wave packets before AS.4 constructs them.
- **Split the convergent-intertwiner and pseudo-Eisenstein prefix before continuation; keep normalization and continuation in AS.2; define wave packets before their AS.3 identities, or move those identities after the construction.**
- **Do not identify the elementary cuspidal-data decomposition with AS.4's full theorem, or silently extend Arthur's ℚ formulation to all global fields.**

### State on main (8ae020f6)
In `content/campaign/AutomorphicSpectralTheory/README.md`:
- AS.1: "Derive its constant term as a finite Weyl sum of intertwining operators in the convergence region, including the exact source/target induced spaces."
- AS.2: "Construct global and local standard intertwiners by convergent unipotent integrals; prove factorization for factorizable sections, cocycle identities and adjoint identities."
- AS.3 ends: "Deduce orthogonality and norm identities for wave packets."
- AS.4: "Construct discrete cuspidal and residual subspaces, Eisenstein wave packets and the unitary map from the sum/direct integral over associate cuspidal data onto L²."
- Arthur's survey works over ℚ in Part I (p. 3: "we work over the ground field Q"), so §12 is stated over ℚ.

### Fix
All changes are inside AS and add no edge.

**1. AS.1.** Replace "Derive its constant term as a finite Weyl sum of intertwining operators in the convergence region, including the exact source/target induced spaces." with:
> Construct the global intertwining operators M(w, λ), w ∈ W(𝔞_P, 𝔞_{P′}), by the adelic unipotent integral, and prove absolute convergence, holomorphy and locally uniform bounds for λ in the translate of the positive chamber where the Eisenstein sum converges. Derive the constant term as a finite Weyl sum of these operators in the convergence region, including the exact source/target induced spaces.
>
> Then construct **pseudo-Eisenstein series** and prove Langlands' Lemmas 12.2–12.4 (Arthur, *An introduction to the trace formula*, §12, pp. 65–66). For an entire function Ψ(λ) of Paley–Wiener type on 𝔞*_{P,ℂ} with values in a finite-dimensional space of cuspidal functions in H⁰_{P,cusp,σ}, put ψ(x) = ∫_{Λ+i𝔞*_P} e^{(λ+ρ_P)(H_P(x))} Ψ(λ, x) dλ and (Eψ)(x) = Σ_{δ ∈ P(F)\G(F)} ψ(δx). Prove:
> - Eψ ∈ L²(G(F)\G(𝔸)) (Lemma 12.2);
> - (Eψ, Eψ′) = ∫_{Λ+i𝔞*_P} Σ_{s ∈ W(𝔞_P, 𝔞_{P′})} (M(s, λ)Ψ(λ), Ψ′(−s λ̄)) dλ, for any Λ with (Λ − ρ_P)(α^∨) > 0 for every α ∈ Δ_P (Lemma 12.3, formula (12.3));
> - the orthogonal decomposition L²(G(F)\G(𝔸)) = ⊕̂_χ L²_χ over classes χ of cuspidal data (Lemma 12.4).
>
> Arthur states these over ℚ and refers to Langlands for the proofs; transport them to F by restriction of scalars, or prove them over F from Langlands' monograph. This decomposition is the elementary one by cuspidal data, not AS.4's spectral theorem.

**2. AS.2.** Replace "Construct global and local standard intertwiners by convergent unipotent integrals; prove factorization for factorizable sections, cocycle identities and adjoint identities." with "Import AS.1's convergent global intertwiners M(w, λ). Construct the local standard intertwiners by convergent unipotent integrals; prove factorization of M(w, λ) for factorizable sections, cocycle identities and adjoint identities. Prove the meromorphic continuation using AS.1's pseudo-Eisenstein series and inner product formula." The next sentence ("Prove meromorphic continuation of operators and Eisenstein series, …") stays.

**3. AS.3 and AS.4 (wave packets).** Delete "Deduce orthogonality and norm identities for wave packets." from AS.3. In AS.4 replace "Construct discrete cuspidal and residual subspaces, Eisenstein wave packets and the unitary map from the sum/direct integral over associate cuspidal data onto L²." with "Construct discrete cuspidal and residual subspaces and Eisenstein wave packets, and deduce the orthogonality and norm identities of wave packets from AS.3's Maass–Selberg relations; then construct the unitary map from the sum/direct integral over associate cuspidal data onto L²."

### Not done, and why
- Langlands' proofs of Lemmas 12.2–12.4 are in his Eisenstein monograph, which the AS README already archives; they were not re-read. The survey's statements are used.

## /6 (high, missing): Kostant's theorem and the van Est–Nomizu comparison for ALS.4

### What the verifier corrected
- Harder–Raghuram §§4.2.1–4.2.3 (pp. 25–27) use the unipotent-fibre/Lie-cohomology comparison and Kostant's decomposition over a splitting characteristic-zero coefficient field; their Proposition 4.3 is unnormalized induction and keeps component-group actions.
- ALS.4 has no AF cochain ancestor. AF.1a's continuous van Est theorem is not the lattice/nilmanifold comparison.
- **Reuse a single full Lie-cochain owner, coordinated with /29; add Kostant with dominant integral highest weights and split/extension-descent hypotheses; then the lattice comparison and the Hecke-equivariant stratum application at ALS.4.**
- Mathlib's low-degree Lie cochains do not supply either theorem. No integral Kostant decomposition, and no formula for a nonsplit highest weight, follows without more work.

By /29 the single cochain owner is AF.1a, so Kostant's theorem goes there and the edge is AF.1a → ALS.4 (not AF.1 → ALS.4, as the finding had it).

### State on main (8ae020f6)
- ALS.4 (`content/campaign/ArithmeticLocallySymmetricSpaces/README.md`): "Develop the Hochschild–Serre spectral sequence for each unipotent/Levi stratum and compare its Hecke action with parabolic induction and Satake transforms, including modulus and Tate shifts." ALS.4 requires ALS.2 and ALS.3.
- **Libraries.**
  - Mathlib's Lie cochains are low-degree only: `LieModule.Cohomology.oneCochain`, `twoCochain`, `d₁₂`, `d₂₃` (`Mathlib/Algebra/Lie/Cochain.lean:43`, `:46`, `:100`, `:122`); its TODO lists cohomology and the Chevalley–Eilenberg comparison.
  - Tau Ceti has the Weyl vector and the dot action: `TauCeti.weylVector` (`TauCeti/LinearAlgebra/RootSystem/Weyl/Vector.lean:151`, `⅟(2 : R) • twoWeylVector P b`, the half-sum of the positive roots of a base, in characteristic zero) and `TauCeti.dotAction` (`Weyl/DotAction.lean:108`, `w • (x + weylVector P b) - weylVector P b`).
  - Neither library has Kostant's theorem, Lie algebra cohomology in all degrees, or a nilmanifold comparison.

### Fix
**1. AF.1a (Kostant).** In AF.1a's cochain prefix (/29), add:
> **Kostant's theorem.** Let 𝔤 be a reductive Lie algebra over a field E of characteristic 0, split by a Cartan subalgebra 𝔥, 𝔮 = 𝔩 ⊕ 𝔲 a parabolic subalgebra containing a Borel, V_λ the irreducible representation of dominant integral highest weight λ, and W^P = {w ∈ W : w⁻¹α > 0 for every simple root α of 𝔩}. Then, as 𝔩-modules, H^q(𝔲, V_λ) ≅ ⊕_{w ∈ W^P, ℓ(w) = q} F_{w·λ}, multiplicity-free, where w·λ = w(λ + ρ) − ρ is 𝔩-dominant integral and F_μ is the irreducible 𝔩-module of highest weight μ (Harder–Raghuram, (4.5), p. 27). Use Tau Ceti's `weylVector` and `dotAction`. Over a non-split field, extend scalars to a splitting field and descend by a separate Galois argument. This is a characteristic-0 statement; no integral version is asserted.

**2. ALS.4.** Replace "Develop the Hochschild–Serre spectral sequence for each unipotent/Levi stratum and compare its Hecke action with parabolic induction and Satake transforms, including modulus and Tate shifts." with:
> Develop the Hochschild–Serre spectral sequence for each unipotent/Levi stratum.
> - **The fibre.** Prove the van Est–Nomizu comparison H^*(Γ_N, V) ≅ H^*(𝔫, V) for an arithmetic lattice Γ_N in the unipotent radical N(ℝ) and a rational N-module V over a field of characteristic 0, equivariantly for the Levi (Harder–Raghuram §4.2.1, pp. 25–26, call it van Est's theorem).
> - **The stratum formula.** Combine it with Kostant's theorem from AutomorphicFormsOnReductiveGroups AF.1a, over a splitting characteristic-zero coefficient field and for dominant integral highest weights, to obtain H^•(∂_P S, M̃_λ) as the algebraic (un-normalized) induction from π₀(P(ℝ)) × P(𝔸_f) of H^•(S^{M_P}, H^•(𝔲_P, M_λ)~), keeping the component-group actions (Harder–Raghuram, Proposition 4.3, p. 26).
> - **Hecke actions.** Compare them with parabolic induction from SmoothRepresentationsOfLocalGroups SR.2 and with SR.4's integral unnormalized Satake transform, recording the modulus and q^{1/2} twists separately. Do not adjoin a square root of q to integral coefficients, or import complex admissibility as an integral theorem.
>
> Both comparison theorems are characteristic-0 statements. An integral Kostant decomposition for large p is a separate input and is not assumed in the integral boundary statements.

(The SR.2 and SR.4 sentences are /27's.)

**3. Edge.** Add AF.1a → ALS.4. Cycle test: acyclic (AF.1a's only prerequisites are UPSTREAM:RepresentationTheory and Tau Ceti LieGroups layer 9).

### Not done, and why
- **Kostant's original paper** was not read; the statement is Harder–Raghuram's (4.5), which they state over their splitting field E. The finding's name "Nomizu–van Est" is kept for the comparison, with Harder–Raghuram's attribution recorded.

## /7 (high, missing): the Kneser–Tits theorem gets a sub-stage of RG2.4, and AA.4 states strong approximation precisely

### What the verifier corrected
- Rapinchuk, Theorem 2.3 and Remark 1 (p. 12), isolate the local absence of proper finite-index subgroups and the Kneser–Tits/Tits-simplicity input of strong approximation. AA.4 reaches neither a producer nor RG2.4.
- Tau Ceti's Tits systems and function-field approximation do not supply this reductive local-group theorem.
- **Add the characteristic-zero nonarchimedean result at the reductive-group owner and import it into AA.4. Define G(E)^+ by rational unipotent radicals with the standard isotropic hypotheses. Keep the rest of the global proof, the noncompactness and simple-connectedness conditions.** Kneser–Tits plus weak approximation is not a complete decomposition of the proof. The Tits/Platonov interiors and any equal-characteristic extension are open source tasks.

### State on main (8ae020f6)
- AA.4 (`content/campaign/AdelicAlgebraicGroups/README.md`): "Develop strong approximation for simply connected almost-simple groups outside S with the required noncompact local factor." AA.4 requires AA.1 and AA.3.
- `content/campaign/ReductiveGroupsPartII/README.md`, RG2.4 ("Decompositions and double cosets") proves Iwasawa, Cartan and Iwahori–Bruhat decompositions; "Kneser" occurs nowhere in the campaign or Tau Ceti roadmaps.
- **Libraries.**
  - Tau Ceti has `TauCeti.TitsSystem` (`TauCeti/GroupTheory/TitsSystem/Basic.lean:48`) with Bruhat cells, and one instance, `TauCeti.gl2TitsSystem`.
  - Mathlib has Iwasawa's simplicity criterion, `MulAction.IwasawaStructure.isSimpleGroup` (`Mathlib/GroupTheory/GroupAction/Iwasawa.lean:82`).
  - Tau Ceti has function-field strong approximation for valuations (`TauCeti.Place.exists_forall_mem_valuation_sub_le_and_forall_mem_integers`, `TauCeti/FieldTheory/FunctionField/Consequences/StrongApproximation.lean:88`) and SL₂(ℤ) → SL₂(ℤ/d) surjectivity (`Matrix.SpecialLinearGroup.map_intCast_zmod_surjective`, `TauCeti/LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:428`).
  - Neither library has Kneser–Tits, Tits simplicity, or adelic strong approximation for algebraic groups.

### Fix
**1. New stage `ReductiveGroupsPartII:RG2.4:kneser-tits`.** Insert before "### RG2.5. Integral dual data" in `content/campaign/ReductiveGroupsPartII/README.md`:

> <a id="stage-RG2.4:kneser-tits"></a>
> ### RG2.4:kneser-tits. The Kneser–Tits theorem over nonarchimedean local fields
>
> For a connected reductive group G over a nonarchimedean local field E, define G(E)^+ as the subgroup generated by the E-points of the unipotent radicals of the E-parabolic subgroups of G. For G simply connected, absolutely almost simple and E-isotropic, with char E = 0:
> - prove Platonov's theorem G(E) = G(E)^+ (the Kneser–Tits property);
> - prove Tits's theorem that G(E)^+ modulo its centre is simple, using the Tits system of RG2.4's Iwahori–Bruhat decomposition (Tau Ceti's `TitsSystem` is the carrier);
> - deduce that G(E) has no proper noncentral normal subgroup and no proper subgroup of finite index.
>
> For G not simply connected, G(E)^+ ≠ G(E) in general; this is where strong approximation fails (Rapinchuk, *On strong approximation for algebraic groups*, Remark 1, p. 12). Positive characteristic (Prasad) is a separately sourced extension, not assumed. Sources to acquire: Platonov 1969, Tits 1964.

Stage record: `requires` = [RG2.4]; consumer AdelicAlgebraicGroups:AA.4.

**2. AA.4.** Replace "Develop strong approximation for simply connected almost-simple groups outside S with the required noncompact local factor. Construct finite covering maps for nested compact opens at neat levels," with:
> Prove strong approximation (Rapinchuk, Theorem 2.3, p. 12): for G connected and absolutely almost simple over a number field F and S a finite set of places, G(F) is dense in G(𝔸_S) if and only if G is simply connected and G_S = ∏_{v ∈ S} G(F_v) is noncompact; reduce almost simple groups to absolutely almost simple ones by restriction of scalars. Sufficiency uses simple connectedness only through ReductiveGroupsPartII RG2.4:kneser-tits: for v ∉ S with G isotropic over F_v, G(F_v) has no proper subgroup of finite index. That theorem and weak approximation do not complete the proof: decompose the remaining global steps here (Zariski density of G(O(S)), the reduction to one isotropic place of S, and the places where G is anisotropic). The function-field case (Margulis, Prasad) is not assumed. Import neat levels from AA.4:neat-levels and construct finite covering maps for nested compact opens at neat levels,

(The last sentence is /28's.)

**3. Edges.** Add RG2.4 → RG2.4:kneser-tits and RG2.4:kneser-tits → AA.4. Cycle tests: acyclic.

**4. Consumer.** ShimuraVarieties V0 says "Strong approximation is used only in the form justified by semisimplicity, simple connectedness, and noncompactness hypotheses." That sentence is correct as it stands. By /28, V0 imports only the neatness prefix, not AA.4. The unreviewed RS-04 link AA.4 → V0 ("Use only the qualified approximation theorem, not a claim for arbitrary reductive groups") is how V0 would import AA.4's theorem; it stays for RS-04's review. On the graph with every addition of this report, V0 does not reach AA.4, so that link would still be acyclic.

### Not done, and why
- Platonov's and Tits's papers were not read; the statements are Rapinchuk's, read at pp. 11–13 and 16–17.

## /8 (medium, missing): the Fourier–Whittaker expansion and the mirabolic Eisenstein series get an early prefix of AL.3

### What the verifier corrected
- Cogdell Lecture 4 (p. 30) gives the GL_n Fourier–Whittaker expansion; Lecture 5 (pp. 40–42) uses it in the unfolding and constructs the Eisenstein series from Schwartz functions, theta series and Poisson summation (Proposition 5.4), with character-dependent possible poles.
- AL.3 has no global producer; SR.5 is local and the GL₂ expansion is downstream.
- **Put the expansion and the theta/mirabolic Eisenstein construction in an AL.3 prerequisite prefix, importing AF.3's cusp forms and AL.0. R16.4/R16.5 specialize it. Keep the unitary-character, twist, pole and residue hypotheses: a simple pole at s = 1 for every datum is not the statement.**

### State on main (8ae020f6)
- AL.3 (`content/campaign/AutomorphicLFunctionsAndLocalFactors/README.md`): "Prove unramified calculations and the global unfolding for cuspidal data. Retain poles in the contragredient/twist case and state analytic nonvanishing results only in their proved regions."
- The AL packet (new, 27–29 September) plans AL.0's local and adelic Schwartz–Bruhat spaces and adelic Poisson summation (`AL.0/adelic-schwartz-bruhat-space`, `AL.0/adelic-poisson-summation`) and all of AL.1. It has no node for the Fourier–Whittaker expansion or the mirabolic Eisenstein series.
- **Libraries.** Mathlib has Poisson summation over ℝ/ℤ only (`SchwartzMap.tsum_eq_tsum_fourier`, `Mathlib/Analysis/Fourier/PoissonSummation.lean:219`) and q-expansions of modular forms; no Whittaker functions or adelic Poisson summation.

### Fix
**1. New stage `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs`.** Insert before "### AL.3. Rankin–Selberg factors and period comparisons":

> <a id="stage-AL.3:global-inputs"></a>
> ### AL.3:global-inputs (early). The Fourier–Whittaker expansion and the mirabolic Eisenstein series
>
> Import cusp forms and their rapid decay from AutomorphicFormsOnReductiveGroups AF.3.
> 1. **Fourier–Whittaker expansion** (Cogdell, *Lectures*, Lecture 4, p. 30). Let ψ be a nontrivial character of 𝔸/F, ψ(n) = ψ(n_{1,2} + ⋯ + n_{n−1,n}) on the upper unipotent N, and W_φ(g) = ∫_{N(F)\N(𝔸)} φ(ng) ψ⁻¹(n) dn. For a cusp form φ on GL_n(𝔸_F), φ(g) = Σ_{γ ∈ N_{n−1}(F)\GL_{n−1}(F)} W_φ(diag(γ, 1) g), by induction on n, expanding along the last column of N, which is abelian.
> 2. **The mirabolic Eisenstein series** (Lecture 5, pp. 41–42). For Φ in AL.0's Schwartz–Bruhat space S(𝔸^n) and a unitary idele class character η, put Θ_Φ(a, g) = Σ_{ξ ∈ F^n} Φ(aξg) and E(g, s; Φ, η) = |det g|^s ∫_{F^×\𝔸^×} (Θ_Φ(a, g) − Φ(0)) η(a) |a|^{ns} d^×a, convergent for Re s > 1. Prove Proposition 5.4:
>    - E transforms by η⁻¹ under the centre;
>    - it continues meromorphically in s and is bounded in vertical strips away from its poles;
>    - its only possible poles are simple, at s = iσ and s = 1 + iσ for σ ∈ ℝ with η(a) = |a|^{−inσ};
>    - E(g, s; Φ, η) = E(g^ι, 1 − s; Φ̂, η⁻¹).
>
>    The proof is Hecke's: AL.0's adelic Poisson summation for Θ, with AL.1's splitting of the idele integral. Cogdell gives no residue formula. Compute the residues from the proof (at s = 1 a multiple of Φ̂(0) when η = |·|^{−inσ}), rather than assume them.
>
> Export (1) to GL2AutomorphicRepresentationsAndTransfer R16.4's multiplicity one and to AL.3b, and (2) to AL.3's unfolding.

Stage record: `requires` = [AF.3, AL.0, AL.1]; consumer AL.3.

**2. AL.3.** Replace "Prove unramified calculations and the global unfolding for cuspidal data. Retain poles in the contragredient/twist case and state analytic nonvanishing results only in their proved regions." with:
> Prove unramified calculations and the global unfolding for cuspidal data, using AL.3:global-inputs' Fourier–Whittaker expansion and mirabolic Eisenstein series. Retain the poles in the contragredient/twist case: at most simple poles at s = iσ and s = 1 + iσ, σ ∈ ℝ, where π̃ ≅ π′ ⊗ |det|^{iσ} (Cogdell, Proposition 5.5, p. 42). State analytic nonvanishing results only in their proved regions.

**3. Edges.** Add AF.3 → AL.3:global-inputs, AL.0 → AL.3:global-inputs, AL.1 → AL.3:global-inputs and AL.3:global-inputs → AL.3. Cycle tests: acyclic (AF.3's closure has no AL stage beyond AL.0/AL.1 after /2, and AL.3's consumers do not reach AF.3).

**4. Packet (blueprint).** The AL blueprint job should plan the new prefix as nodes; its request list gains a request to AF.3 (cusp forms, rapid decay), which it does not have now.

### Not done, and why
- The residue formula is not stated as fact: Cogdell does not give it.

## /9 (medium, error): GL₂ multiplicity one uses the expansion from AL.3:global-inputs

### What the verifier corrected
- Cogdell, Theorem 4.2 (p. 33), derives multiplicity one from the expansion and local uniqueness of Whittaker models. R16.4 comes before R16.5, where the expansion is planned; the reverse edge would cycle.
- **AL.3 already reaches R16.4 through R16.2, so /8's prefix repairs this without a backward edge.** Otherwise move only the GL₂ expansion earlier. Do not equate multiplicity one with strong multiplicity one.

### State on main (8ae020f6)
GL2 README, R16.4: "Prove GL₂ global multiplicity one and identify the concrete factorization with those generic constructions." R16.5: "Prove the GL₂ global Whittaker expansion and its identification with those integral models." R16.4 requires AS.4, R16.1 and R16.2; R16.2 requires AL.3.

### Fix
- R16.4: replace "Prove GL₂ global multiplicity one and identify the concrete factorization with those generic constructions." with "Prove GL₂ global multiplicity one from the Fourier–Whittaker expansion of AutomorphicLFunctionsAndLocalFactors AL.3:global-inputs and the local uniqueness of Whittaker models (SR.5, through R16.2), as in Cogdell, Theorem 4.2 (p. 33), and identify the concrete factorization with those generic constructions. Multiplicity one is not strong multiplicity one, which is proved next."
- R16.5: replace "Prove the GL₂ global Whittaker expansion and its identification with those integral models." with "Specialize the Fourier–Whittaker expansion of AL.3:global-inputs to GL₂ and prove its identification with those integral models."
- No edge: AL.3:global-inputs → AL.3 → R16.2 → R16.4.

### Not done, and why
- Nothing is left.

## /10 (medium, error): AL.2 imports cusp forms from AF.3

### What the verifier corrected
- On the assembled graph, AL.2 lacks SR.3 (contragredients, matrix coefficients), and AL.2 and AL.3 lack AF.2/AF.3 and AA.1/AA.2. AF.3 reaches AF.2, SR.3 and the quotient measures.
- **Add AF.3 → AL.2; AL.3 then gets it through AL.2 → AL.3, and a second explicit edge is unnecessary.** The local archimedean and nonarchimedean inputs keep their own hypotheses.

### State on main (8ae020f6)
AL.2 requires AF.1, AL.1, SR.4 and Tau Ceti ArithmeticDirichletSeries layer 3. AL.2's text: "Build the adelic global integral for cuspidal GL_n representations, prove Euler factorization, analytic continuation and functional equation with the n=1 exceptional pole separated." The AL README's scope says it consumes "AutomorphicFormsOnReductiveGroups cusp forms". The AL packet has no request to AF.3, SR.2 or SR.3.

### Fix
- Add AF.3 → AL.2. Cycle test: acyclic.
- AL.2: replace "Build the adelic global integral for cuspidal GL_n representations, prove Euler factorization, analytic continuation and functional equation with the n=1 exceptional pole separated." with "Build the adelic global integral for cuspidal GL_n representations on AutomorphicFormsOnReductiveGroups AF.3's cusp forms (with their rapid decay and, through AF.3, SR.3's contragredients and matrix coefficients and AdelicAlgebraicGroups' quotient measures), prove Euler factorization, analytic continuation and functional equation with the n=1 exceptional pole separated."
- Not added: AF.3 → AL.3, as the verifier advises (AL.3 also gets AF.3 through AL.3:global-inputs).

## /11 (medium, error): the R17 chain imports strong multiplicity one and the weight-one dictionary

### What the verifier corrected
- The R17 chain reaches R16.3 but not R16.4–R16.6. R17.3 needs strong multiplicity one; R17.5 invokes R16's converse theorem and the weight-one dictionary.
- **Add R16.4 → R17.3 and R16.6 → R17.5, keeping R16.5 as the converse producer.** Both are acyclic.
- The weight-one infinity-type dictionary must remain an actual theorem, not be inferred from finite-place matching.

### State on main (8ae020f6)
- GL2 README, R17.3: "Prove the strong multiplicity-one uniqueness statements and the effect on rational structures where used." Dependencies: "**Dependencies:** R17.2 (preceding layer)."
- R16.6: "Identify the holomorphic representations over Q with the existing newforms, including level, character, weight, Hecke eigenvalues and normalisation." R16.6's only consumer is AutomorphicGaloisRepresentations R19.1.
- Tau Ceti has classical strong multiplicity one for newforms (`HeckeRing.GL2.Newform.eq_of_forall_notMem_eigenvalue_eq`, `TauCeti/NumberTheory/ModularForms/Newforms/StrongMultiplicityOne.lean:87`, Miyake 4.6.12) and multiplicity one of newform eigenspaces (`finrank_cuspFormsNewEigenspace_le_one`, `Newforms/MultiplicityOne.lean:175`). These are classical q-expansion statements, not the automorphic-representation theorem R16.4 plans; R16.6's dictionary is what connects them.

### Fix
1. **R17.3.**
   - Replace "Prove the strong multiplicity-one uniqueness statements and the effect on rational structures where used." with "Prove the uniqueness statements for the transfer, importing GL₂ strong multiplicity one from R16.4, and the effect on rational structures where used."
   - Dependencies: "**Dependencies:** R17.2 (preceding layer)." → "**Dependencies:** R17.2 (preceding layer); [GL2AutomorphicRepresentationsAndTransfer R16.4](README.md#r16-4)."
2. **R17.5.** The Dependencies edit is /1's (R17.4a and R16.6).
3. **R16.6.** Replace "Identify the holomorphic representations over Q with the existing newforms, including level, character, weight, Hecke eigenvalues and normalisation." with:
   > Identify the holomorphic representations over Q with the existing newforms, including level, character, weight, Hecke eigenvalues and normalisation. Include weight one: prove that the archimedean component of the representation generated by a weight-one newform is the limit of discrete series π(1, sgn) of AutomorphicFormsOnReductiveGroups AF.1b, and conversely, as a theorem about π_∞, not inferred from finite-place matching.
4. **Edges.** Add R16.4 → R17.3 and R16.6 → R17.5. Cycle tests: acyclic (R16.6's closure has no R17 stage).

### Not done, and why
- Nothing is left.

## /12 (medium, error): global Jacquet–Langlands reaches R18.3

### What the verifier corrected
- R18.3's comparison with GL₂ and R18.4's definite/indefinite comparison use the transfer R17.3 supplies, but no path exists.
- **Add R17.3 → R18.3 (hence R18.4).** RS-21 proposes it, but is unreviewed and its link is not live.
- Keep the finite class-set construction before the transfer-dependent part if needed, and keep its integral/freeness hypotheses.

### State on main (8ae020f6)
- `content/campaign/HilbertModularVarietiesAndShimuraCurves/README.md`, R18.3: "Define algebraic automorphic forms on the finite double-coset set with their weight module and integral coefficients. Prove finiteness, the Hecke action, change of level and the comparison to the corresponding GL₂ representations." Dependencies: "**Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R16.2](../GL2AutomorphicRepresentationsAndTransfer/README.md#r16-2); [HilbertModularVarietiesAndShimuraCurves R18.1](README.md#r18-1)."
- R18.4: "Include the relationship between definite and indefinite quaternionic realisations supplied by Jacquet–Langlands." R18.4 requires R18.3.
- RS-21 `links[64]` (unreviewed): R17.3 → R18.3, "Import global JL for the transfer-identification portion; finite-class-set construction itself remains earlier."

### Fix
1. **Edge.** Add R17.3 → R18.3. Cycle test: acyclic (R17.3's closure has no R18 stage). R18.4 gets it through R18.3.
2. **R18.3 Dependencies.** Replace the line quoted above with "**Dependencies:** [GL2AutomorphicRepresentationsAndTransfer R16.2](../GL2AutomorphicRepresentationsAndTransfer/README.md#r16-2); [GL2AutomorphicRepresentationsAndTransfer R17.3](../GL2AutomorphicRepresentationsAndTransfer/README.md#r17-3); [HilbertModularVarietiesAndShimuraCurves R18.1](README.md#r18-1); [AutomorphicFormsOnReductiveGroups AF.5:algebraic-forms](../AutomorphicFormsOnReductiveGroups/README.md)." (The AF.5:algebraic-forms entry is /31's.) R18.3's text, which separates the class-set construction from the transfer comparison, is /31's edit.
3. **RS-21 (RS).** `links[64]` becomes redundant once the atlas has the edge. Its revision can keep it as the justification record or drop it; either way the edge no longer depends on RS-21's review.

### Not done, and why
- Nothing is left.

## /13 (medium, error): AL.5 names its real consumers and leaves algebraicity to its owners; AL.3 → AutomorphicPadicLFunctions:L1

### What the verifier corrected
- AL.5 names Rankin families "already" in AutomorphicPadicLFunctions, whose stages do not state them; its only consumer is PS.1. AutomorphicPadicLFunctions:L1 imports local integrals and Whittaker theory but reaches only AL.0/AL.1.
- **Add AL.3 → L1 and describe the actual consumers.** RS-13 gives AL.5 the normalization interface; RS-14 keeps the ℚ modular-symbol period/algebraicity formula at ModularSymbolsPadicLFunctions:L1 and BSW's general-field formula at AutomorphicPadicLFunctions:L1. Cite those, but **do not erase a separately needed Rankin algebraicity theorem** because a GL₂ standard-value theorem exists.
- **Make any AL.5 → L1 edge conditional on actual interface use**, and do not have AL.5 import L1 while L1 imports all of AL.5.

### State on main (8ae020f6)
- AL.5 (`content/campaign/AutomorphicLFunctionsAndLocalFactors/README.md`): "Supply finite-set Euler-factor removal/reinsertion, imprimitive/primitive comparisons, critical-value normalization, functional-equation sign and algebraicity inputs for the precise GL_2/Rankin families already in AutomorphicPadicLFunctions." AL.5's only consumer is PeriodsAndSpecialValues PS.1, whose Inputs line lists AL.1, AL.4 and AL.5.
- `content/campaign/AutomorphicPadicLFunctions/README.md`, L1: "Import GL₂ Whittaker models, local zeta integrals and standard L-functions from [AutomorphicLFunctionsAndLocalFactors](../AutomorphicLFunctionsAndLocalFactors/README.md)." L1 has no AL prerequisite.
- **RS-13 (accepted).** `owners[1]` gives AL.5 "The scoped complex/formal GL2 and Rankin critical-value normalization interface and its primitive/imprimitive and ramified local corrections". Its `layers` entry for AL.5 (keep) does mention "the scoped GL2/Rankin normalization and algebraicity inputs". So the finding's "neither RS names algebraicity" is too strong for RS-13's layer text; the verifier's boundary governs.
- **RS-14 (accepted).** `owners[20]` makes ModularSymbolsPadicLFunctions:L1 the owner of "Rational modular-symbol period lines and normalized critical-value formula; BSW retains the general-field cycles and Q comparison" (formerly MS:L1 and AutomorphicPadicLFunctions:L1).

### Fix
1. **AL.5.** Replace the sentence quoted above with:
   > Supply finite-set Euler-factor removal/reinsertion, imprimitive/primitive comparisons, critical-value normalization and functional-equation sign for the GL_2 and Rankin–Selberg families whose complex L-values are interpolated by its consumers: PeriodsAndSpecialValues PS.1, and any AutomorphicPadicLFunctions or ModularSymbolsPadicLFunctions stage only once it imports this interface. Algebraicity of GL₂ critical values is not proved here: the ℚ modular-symbol period formula is ModularSymbolsPadicLFunctions L1's and the general-field cycle formula AutomorphicPadicLFunctions L1's (RS-14). A Rankin–Selberg algebraicity input that neither of them supplies stays here as a named, sourced input.
2. **Edge.** Add AL.3 → AutomorphicPadicLFunctions:L1. Cycle test: acyclic. L1's README text already says it imports these; it has no Inputs line to edit.
3. **Not added:** AL.5 → AutomorphicPadicLFunctions:L1. L1's text uses Whittaker models and zeta integrals (AL.3), not AL.5's Euler-factor interface. If L1's blueprint later imports that interface, add the edge then; AL.5 must then not import L1 (on today's graph AL.5 does not reach L1).

### Not done, and why
- No AutomorphicPadicLFunctions stage is made a consumer of AL.5 without a use.

## /14 (medium, error): AL.0 owns the Schwartz–Bruhat space that R16.1 uses

### What the verifier corrected
- R16.1's "sole owners" sentence misattributes Schwartz–Bruhat spaces; AL.0 constructs them, and R16.1's closure has no AL.0.
- RS-21's owner entry and links wrongly credit AA.2; its adjacent adelic-carrier entry conflates AA.0's product Haar measures, AA.1's adelic points and AA.2's quotient measures.
- **Correct the owner records and add AL.0 → R16.1, keeping AA.2 links for quotient measures. R16.2 and R16.4 get AL.0 through R16.1; no direct links are needed for that reason alone.** This corrects an unreviewed proposal and current text; RS-21 has not changed the live atlas.

### State on main (8ae020f6)
- GL2 README, R16.1: "The generic convolution algebra, Schwartz–Bruhat space, growth conditions and smooth representation categories have those sole owners." Dependencies: R01.1, R01.2, AF.2, SR.0.
- **RS-21** (`research/blueprint/restructure/RS-21.result.json`, unreviewed):
  - `owners[27]`: target "Generic adelic group/Haar/quotient carrier", owner `AdelicAlgebraicGroups:AA.0`, formerly [R16.1].
  - `owners[28]`: target "Schwartz-Bruhat carrier and Fourier transform", owner `AdelicAlgebraicGroups:AA.2`, formerly [R16.1].
  - `links[3]`: AA.2 → R16.1, whose reason ends "Import the canonical owner of Schwartz-Bruhat carrier and Fourier transform."
  - `links[4]` (AA.2 → R16.2) and `links[5]` (AA.2 → R16.4) carry a generic reason, "Direct component import formerly reached through GL2AutomorphicRepresentationsAndTransfer:R16.1; …", which occurs 14 times in the file and names neither Schwartz–Bruhat nor quotient measures.
  - `layers["GL2AutomorphicRepresentationsAndTransfer:R16.1"]` has no AL.0 in `suppliedBy`.
- **New since the verification.** The AL packet (29 September) plans `AL.0/local-schwartz-bruhat-space`, `AL.0/adelic-schwartz-bruhat-space`, `AL.0/local-fourier-inversion` and `AL.0/adelic-poisson-summation`. Its pending `restructure` proposal keeps the generic finite-place carrier of locally constant compactly supported functions in SmoothRepresentationsOfLocalGroups SR.1 and gives AL.0 the adelic Schwartz theory.

### Fix
1. **R16.1.** Replace "The generic convolution algebra, Schwartz–Bruhat space, growth conditions and smooth representation categories have those sole owners." with:
   > The generic convolution algebra, growth conditions and smooth representation categories have those sole owners. The Schwartz–Bruhat space and its Fourier transform are owned by AutomorphicLFunctionsAndLocalFactors AL.0 (over SmoothRepresentationsOfLocalGroups SR.1's carrier of locally constant compactly supported functions at the finite places).

   Dependencies line: append "; [AutomorphicLFunctionsAndLocalFactors AL.0](../AutomorphicLFunctionsAndLocalFactors/README.md)" before its final full stop.
2. **Edge.** Add AL.0 → R16.1. Cycle test: acyclic (AL.0's closure is AA.0 and RG2.0).
3. **RS-21 (RS).**
   - `owners[28].owner`: `AdelicAlgebraicGroups:AA.2` → `AutomorphicLFunctionsAndLocalFactors:AL.0`.
   - `owners[27]`: split into three entries, each with `formerly` [R16.1]: "Restricted products of local groups and product Haar measures" (owner AA.0); "Adelic points G(𝔸) of a reductive group" (owner AA.1); "Invariant quotient measures and central-character L²" (owner AA.2).
   - `links[3]` (AA.2 → R16.1): its reason becomes "Import invariant quotient measures and central-character L² spaces (AA.2)", or the link is dropped if R16.1 uses no quotient measure; add a link AL.0 → R16.1 with reason "Import the canonical owner of the Schwartz–Bruhat carrier and Fourier transform (AL.0)".
   - `links[4]` (AA.2 → R16.2) and `links[5]` (AA.2 → R16.4): keep only where the revision names the quotient-measure or central-character L² use. R16.4's global cuspidal decomposition has one; R16.2 is a local stage, and its link should be dropped unless the revision names a use.
   - `layers["…:R16.1"].suppliedBy`: add `AutomorphicLFunctionsAndLocalFactors:AL.0`.
   - No AL.0 → R16.2 or AL.0 → R16.4 link: they get AL.0 through R16.1.

### Not done, and why
- The AL packet's pending SR.1/AL.0 split is its reviewers' decision; R16.1's new sentence is compatible with it either way.

## /15 (medium, error): Scholze's Theorem IV.2.1 moves to a new TC.2:almost-comparison; CC.8 keeps the convention

### What the verifier corrected
- The accepted CC.8 node includes the almost-O_C comparison with automorphic sections, which CC.8's stage text reserves to TC. Its proof (Scholze v2, Theorem IV.2.1, pp. 69–70) uses the perfectoid minimal compactification, its strongly Zariski closed boundary, the torsion comparison, the limit comparison and almost purity, which CC.8's graph does not supply.
- **Move the theorem, with the dependent dimension/vanishing corollaries now under CC.7, to a TC.2 suffix. Keep the fixed-exponent compact-support convention and the identification with the generic object in CC.8.**
- Preserve Hodge type, the chosen embedding, tame level, almost coefficients, pullback and trace, and the separate inverse limit in n.
- The decomposition review read the theorem's proof but left its imported proofs unread; do not report the proof itself as unread, and do not claim the Hodge–Tate map is used by IV.2.1.

"Suffix" is read as a colon-suffixed sub-stage of TC.2 (as `H3:smooth-duality` in the etale fixes). It has to come **before** TC.2, not after it, because TC.2 exports "the cohomological-dimension/amplitude estimates", which include Corollary IV.2.2.

### State on main (8ae020f6)
- `data/decompositions/CompletedCohomologyPartII.json` (unchanged since 16 September):
  - node `CC.8/scholze-4-2-convention-and-the-perfectoid-comparison` states the convention and Theorem 4.2.1 (Annals numbering; Theorem IV.2.1 of arXiv v2), with the hypotheses quoted by the verifier; no link enters it;
  - node `CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower` contains Scholze's Corollaries 4.2.2 and 4.2.3, with a reviewer's placement note;
  - gap 7, "Scholze's Corollaries 4.2.2-4.2.3 are placed under CC.7 but consume the CC.8 comparison", names TorsionCohomologyInfrastructure TC.2 as the candidate home and asks for links "from the Theorem 4.2.1 node, the duality node and the codimension node" once they are re-homed;
  - gap 2 records which imports of the proof are unread.
- `content/campaign/TorsionCohomologyInfrastructure/README.md`: "TC.2 imports CompletedCohomologyPartII:CC.1, CC.2, CC.4 and CC.8 on the actual general tower." TC.2 requires CC.1, CC.2, CC.4, CC.8, IHG.2 and TC.1; TC.1 requires PerfectoidShimuraVarieties S3 (hence S0–S2, ShimuraVarieties V8, PerfectoidSpaces and ClassicalAdicEtaleCohomology H0).
- RS-09 (unreviewed) keeps CC.8 with "Preserve Hodge-type, tame-level, almost-coefficient and fixed-exponent qualifications and the unresolved comparison imports."
- Read for this fix: Scholze, *On torsion in the cohomology of locally symmetric varieties*, arXiv:1306.2070v2, §IV.2, pp. 69–72.

### Fix
**1. New stage `TorsionCohomologyInfrastructure:TC.2:almost-comparison`.** Insert before "### TC.2. Coherent, completed and torsion cohomology":

> <a id="stage-TC.2:almost-comparison"></a>
> ### TC.2:almost-comparison. Scholze's almost comparison for compactly supported completed cohomology
>
> For (G, D) of Hodge type with a fixed embedding into (Sp_{2g}, D_{Sp_{2g}}), and tame level K^p contained in the level-N subgroup of G′(𝔸_f^p) for some N ≥ 3 prime to p, use CompletedCohomologyPartII CC.8's H̃^i_{c,K^p}(ℤ/p^nℤ) = lim→_{K_p} H^i_c(X_{K_pK^p}, ℤ/p^nℤ). Prove (Scholze, arXiv:1306.2070v2, §IV.2, pp. 69–72):
> - **Theorem IV.2.1.** There is a natural isomorphism of almost-O_C-modules H̃^i_{c,K^p}(ℤ/p^n) ⊗_{ℤ/p^n} O_C^a/p^n ≅ H^i(X*_{K^p}, I^{+a}/p^n), computed on the topological space of the perfectoid minimal compactification X*_{K^p}, with I the ideal sheaf of the boundary and I⁺ = I ∩ O⁺, compatible with pullback and trace for K₁^p ⊂ K₂^p.
> - **Corollary IV.2.2.** H̃^i_{c,K^p}(ℤ/p^n), and so H̃^i_{c,K^p}(ℤ_p), vanishes for i > d = dim_ℂ X_K.
> - **Corollary IV.2.3.** H̃^{BM}_i = 0 for i > d and H̃^{BM}_d is p-torsion free; for i < d the codimension of H̃_i over the Iwasawa algebra is at least d − i.
>
> Keep the hypotheses: Hodge type, the chosen embedding, the tame-level convention, almost coefficients, compact support only, fixed n (the inverse limit in n is separate), and the comparison of Scholze's X_K with the survey's X_r, which the decomposition review left open. The proof does not use the Hodge–Tate period map. It uses Scholze's Theorem IV.1.1 (the perfectoid minimal compactification, through TC.1 and PerfectoidShimuraVarieties S0–S3), the torsion comparison, the limit comparison and almost purity; the étale–singular comparison for X_K with compact support is also used, and its supplier must be named when the stage is decomposed.

Stage record: `requires` = [TC.1, CompletedCohomologyPartII:CC.8]; consumer TC.2.

**2. TC.2.** Replace "TC.2 imports CompletedCohomologyPartII:CC.1, CC.2, CC.4 and CC.8 on the actual general tower." with "TC.2 imports CompletedCohomologyPartII:CC.1, CC.2, CC.4 and CC.8 on the actual general tower, and TC.2:almost-comparison for Scholze's Theorem IV.2.1 and its vanishing and codimension corollaries."

**3. Decomposition (`data/decompositions/CompletedCohomologyPartII.json`), for the maintainer.**
- Node `CC.8/scholze-4-2-convention-and-the-perfectoid-comparison`: keep the id. Its `statement` keeps only the first sentence (the definition of H̃^i_{c,K^p}(ℤ/p^nℤ), the Hodge-type datum, the Siegel embedding and the tame-level convention) and adds: "and its identification with CC's fixed-exponent compact-support tower object (colimit over K_p at fixed n; the inverse limit in n is separate)". Theorem 4.2.1, the two commutative diagrams and "p-adic cusp forms" move to TC.2:almost-comparison. Its title becomes "The convention of Scholze's section 4.2". Its hypotheses about compact support, Hodge type, tame level and X_K versus X_r stay; the "ALMOST O_C-modules" hypothesis and the proof steps move.
- Node `CC.7/boundary-long-exact-sequences-and-the-borel-serre-tower`: delete the Corollary 4.2.2 and 4.2.3 sentences and the placement note; they are now in TC.2:almost-comparison.
- Gap 7: delete, recording its resolution: the corollaries are in TC.2:almost-comparison.
- Gap 2 stays, re-pointed to TC.2:almost-comparison: the imports of the proof are still unread.
- Links: add `CC.8/scholze-4-2-convention-and-the-perfectoid-comparison` → `TorsionCohomologyInfrastructure:TC.2:almost-comparison`, `CC.3/duality-between-completed-homology-and-completed-cohomology` → TC.2:almost-comparison, and `CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` → TC.2:almost-comparison (for Corollary IV.2.3). Cycle tests: acyclic.
**4. Edges.** Add TC.1 → TC.2:almost-comparison, CC.8 → TC.2:almost-comparison and TC.2:almost-comparison → TC.2. Cycle tests: acyclic.
**5. RS-09 (RS).** In `layers["CompletedCohomologyPartII:CC.8"]`, replace "Preserve Hodge-type, tame-level, almost-coefficient and fixed-exponent qualifications and the unresolved comparison imports." with "Preserve the Hodge-type, tame-level and fixed-exponent qualifications of the section 4.2 convention; the almost-coefficient comparison (Theorem IV.2.1) and its unresolved imports are TorsionCohomologyInfrastructure TC.2:almost-comparison's."

### Not done, and why
- The imports of the proof (Theorem IV.1.1, the torsion and limit comparisons, the dimension bound) remain unread, as gap 2 records. The theorem's own proof was read by the decomposition reviewer and is not reported as unread.

## /16 (medium, error): CC.8 becomes the generic adapter; the concrete instances are proved by their consumers

### What the verifier corrected
- Confirmed only for the unprovided concrete instances in CC.8 and CC.0: their prose asks for modular, Siegel, unitary and Hilbert canonical-model comparisons, but the graph supplies only the arithmetic locally symmetric prefix. R31.1 already specializes the generic object and imports R14.3 and R18.4.
- **Prefer repair (b):** a parameterized transport/localization adapter for a supplied finite-level comparison; prove the modular/quaternionic instances in R31.1 and the Hodge-type instance in TC.2.
- The claim that no general Betti–étale comparison owner exists is too strong: the Ichino–Prasanna extraction proposes ShimuraVarietiesPartIIAutomorphicCohomology, which must be checked, not duplicated.

### State on main (8ae020f6)
- `content/campaign/CompletedCohomologyPartII/README.md`:
  - CC.0: "**Dependencies:** ArithmeticLocallySymmetricSpaces ALS.0–ALS.4 for arithmetic quotients, finite-level complexes and coefficient systems; the relevant classical étale/singular comparison for a Shimura application. No ALS.6 or TC.2." CC.0 also says "Compare singular, cellular and étale finite-coefficient models only with the precise finite-type/characteristic hypotheses."
  - CC.8: "**Dependencies:** CC.1–CC.7; the selected finite-level Shimura tower and its canonical-model comparison." and "Identify the generic completed object with the finite-level modular, Siegel, unitary and Hilbert tower models used by its consumers. Transport finite-level Galois and tame Hecke actions, prove their continuity and commutation with all transition maps, and construct localisation at a specified residual Hecke ideal. Compare with Scholze's §4.2 convention, including its chosen support and lattice."
- R31.1 (`content/campaign/CompletedCohomologyAndLocalGlobalCompatibility/README.md`): "Identify its actual tower and transfer maps with ModularCurvesPartII R14 and HilbertModularVarietiesAndShimuraCurves R18." R31.1 requires R14.3 and R18.4.
- PAPER-ICHINO-PRASANNA-23 `routes[1]` (accepted) proposes ShimuraVarietiesPartIIAutomorphicCohomology; no design job or stage exists.

### Fix
1. **CC.8.** Replace "Identify the generic completed object with the finite-level modular, Siegel, unitary and Hilbert tower models used by its consumers. Transport finite-level Galois and tame Hecke actions, prove their continuity and commutation with all transition maps, and construct localisation at a specified residual Hecke ideal. Compare with Scholze's §4.2 convention, including its chosen support and lattice." with:
   > Construct the generic adapter: for any tower supplied with a finite-level comparison (a Shimura tower with its canonical model and étale–Betti comparison, or an arithmetic locally symmetric tower), identify the generic completed object with it, transport finite-level Galois and tame Hecke actions, and prove their continuity and commutation with all transition maps. Construct the completed Hecke algebra and localisation at a specified residual Hecke ideal (see below). State Scholze's §IV.2 convention: H̃^i_{c,K^p}(ℤ/p^n) = lim→_{K_p} H^i_c(X_{K_pK^p}, ℤ/p^n) for a Hodge-type datum with a chosen Siegel embedding and tame level K^p inside the level-N subgroup, N ≥ 3 prime to p, and identify it with the fixed-exponent compact-support tower object. The concrete instances are proved by their consumers with their geometric inputs: modular and Shimura curves in CompletedCohomologyAndLocalGlobalCompatibility R31.1, Hodge-type towers in TorsionCohomologyInfrastructure TC.2 (the almost comparison of Scholze's Theorem IV.2.1 is TC.2:almost-comparison's).

   (The completed Hecke algebra sentence is expanded by /18.)
2. **CC.8 Dependencies.** "**Dependencies:** CC.1–CC.7; the selected finite-level Shimura tower and its canonical-model comparison." → "**Dependencies:** CC.1–CC.7; IntegralHeckeAndGaloisDeterminants IHG.2. A finite-level Shimura tower and its canonical-model and étale–Betti comparison are inputs of the consumer that applies the adapter (R31.1, TC.2), not of this stage." (IHG.2 is /18's.)
3. **CC.0 Dependencies.** Replace the line quoted above with "**Dependencies:** ArithmeticLocallySymmetricSpaces ALS.0–ALS.4 for arithmetic quotients, finite-level complexes and coefficient systems. A Shimura application brings its own étale/singular comparison through the consumer that applies CC.8's adapter. No ALS.6 or TC.2." Replace "Compare singular, cellular and étale finite-coefficient models only with the precise finite-type/characteristic hypotheses." with "Compare singular and cellular finite-coefficient models only with the precise finite-type/characteristic hypotheses; étale models are compared by the consumer that supplies them."
4. **R31.1.** Replace "Identify its actual tower and transfer maps with ModularCurvesPartII R14 and HilbertModularVarietiesAndShimuraCurves R18." with "Identify its actual tower and transfer maps with ModularCurvesPartII R14 and HilbertModularVarietiesAndShimuraCurves R18, using their étale–Betti comparisons (R14.3, R18.4): this is the modular and Shimura-curve instance of CC.8's generic adapter, proved here."
5. **TC.2.** Its sentence is extended by /15; add after it: "TC.2 proves the Hodge-type instance of CC.8's adapter (the identification with the Hodge-type Shimura tower, its canonical model through PerfectoidShimuraVarieties S0 and ShimuraVarieties V8, and its étale–Betti comparison). If the proposed ShimuraVarietiesPartIIAutomorphicCohomology supplies a general Betti–étale comparison when designed, import it rather than reprove it."
6. **No new edges.** The instances' suppliers are already ancestors of R31.1 and TC.2.
7. **RS-09 (RS).** Its CC.8 `keep` reason already ends "TC/IHG/IG/R31 application theorems are not transferred here", which matches repair (b).

### Not done, and why
- Repair (a) is not chosen, as the verifier prefers (b).

## /17 (medium, missing): one general category of admissible Banach representations

### What the verifier corrected
- CC.2 constructs a Banach module and CC.5 needs admissibility and a duality criterion; R30.2 constructs only the GL₂(ℚ_p) category. Neither supplies a general category to the other.
- Schneider–Teitelbaum v1 §3 (Lemma 3.4, Theorem 3.5, pp. 14–15) proves the finite-generation criterion, the anti-equivalence and abelianness for a compact p-adic Lie group.
- **Plan the Schikhof/continuous-dual category once, beside but separately from /3's completed-algebra theorem, and import it into CC and into R30's specialization. Use K[[G]] = K ⊗_o o[[G]], not an inverse limit of K-valued finite group rings.** Admissibility for a locally compact p-adic group needs the compact-open independence theorem; it is not Theorem 3.5's statement.

### State on main (8ae020f6)
- CC.2: "After inverting p construct the natural unitary Banach module when the integral lattice satisfies the required completeness and boundedness conditions." CC.5: "Prove the dual admissibility criterion and deduce admissibility of completed cohomology in the resulting torsion/unitary Banach categories."
- R30.2 (`content/campaign/PadicLocalLanglandsForGL2Qp/README.md`): "Construct the smooth mod-p, admissible unitary Banach and locally analytic categories for GL₂(Q_p), their duals and completed group-algebra actions." Dependencies: "**Dependencies:** R30.1 (preceding layer)."
- No atlas stage mentions Schikhof duality or admissible Banach representations in general. PadicMeasuresIwasawaAlgebras L0 owns bounded measures as the continuous dual of C(X, K) and L1 the completed group rings; its packet has no noetherian node.
- **Libraries.** Mathlib's `ContRepresentation` (`Mathlib/RepresentationTheory/Continuous/Basic.lean:54`) and Tau Ceti's unitary (Hilbert-space) representations (`ContRepresentation.IsUnitary`, `TauCeti/RepresentationTheory/Continuous/Unitary/Basic.lean:52`) are archimedean; neither library has Banach representations of p-adic groups or Schikhof duality.

### Fix
**1. New stage `PadicMeasuresIwasawaAlgebras:L1:banach-representations`.** Insert before "## L2. Mahler–Amice theory for bounded measures" in `content/campaign/PadicMeasuresIwasawaAlgebras/README.md`:

> <a id="stage-L1:banach-representations"></a>
> ## L1:banach-representations. Banach representations of compact p-adic Lie groups
>
> Let K/ℚ_p be finite with integers o, and G profinite. Develop:
> - **Schikhof duality** (Schneider–Teitelbaum, *Banach space representations and Iwasawa theory*, arXiv:math/0005066v1, §1): M ↦ M^d = Hom_o^cont(M, K), with ‖ℓ‖ = max_{m∈M} |ℓ(m)|, is an anti-equivalence from torsion-free compact linear-topological o-modules, up to isogeny, to K-Banach spaces (Theorem 1.2, p. 3); and its equivariant form over o[[G]] (Theorem 2.3, p. 12).
> - **Banach representations** (p. 11): a K-Banach space with a G-action by continuous linear automorphisms such that G × E → E is continuous; the unitary ones have a G-invariant bounded open o-submodule (a G-stable unit ball).
>
> For G a compact p-adic Lie group, import from NoncommutativeAndEquivariantIwasawa NE.0 that o[[G]], and hence K[[G]] = K ⊗_o o[[G]], is left and right noetherian (Lazard V.2.2.4), and prove (§3, pp. 13–15):
> - the canonical topology on finitely generated o[[G]]-modules and the continuity of module maps (Proposition 3.1);
> - E is admissible (some G-invariant bounded open o-submodule L has (E/L)^H of cofinite type for every open normal H) if and only if the dual E′ is finitely generated over K[[G]] (Lemma 3.4), and it suffices to test one open pro-p subgroup;
> - the anti-equivalence Mod_fg(K[[G]]) → Ban^adm_G(K), M ↦ M^d (Theorem 3.5), so Ban^adm_G(K) is abelian.
>
> For a locally compact p-adic Lie group, such as G(ℚ_p), define admissibility by restriction to a compact open subgroup and prove that it does not depend on the subgroup, from NE.0's freeness of Λ(H) over Λ(H′) for H′ open in H. This is not Theorem 3.5's statement, and Schneider–Teitelbaum's §3 assumes G compact.

Stage record: `requires` = [L0, L1, NoncommutativeAndEquivariantIwasawa:NE.0]; consumers CompletedCohomologyPartII:CC.2, CC.5, PadicLocalLanglandsForGL2Qp:R30.2.

**2. CC.2.** Replace "After inverting p construct the natural unitary Banach module when the integral lattice satisfies the required completeness and boundedness conditions." with "After inverting p construct the natural unitary Banach module, in the category of PadicMeasuresIwasawaAlgebras L1:banach-representations, when the integral lattice satisfies the required completeness and boundedness conditions." Dependencies: "**Dependencies:** CC.1; ArithmeticGaloisDuality R02.1–R02.3/D7." → "**Dependencies:** CC.1; ArithmeticGaloisDuality R02.1–R02.3/D7; PadicMeasuresIwasawaAlgebras L1:banach-representations."

**3. CC.5.** Replace "Prove the dual admissibility criterion and deduce admissibility of completed cohomology in the resulting torsion/unitary Banach categories." with "Apply the dual admissibility criterion of PadicMeasuresIwasawaAlgebras L1:banach-representations (Schneider–Teitelbaum, Lemma 3.4) and deduce admissibility of completed cohomology in the resulting torsion/unitary Banach categories." The Dependencies edit is in /3.

**4. R30.2.** Replace "Construct the smooth mod-p, admissible unitary Banach and locally analytic categories for GL₂(Q_p), their duals and completed group-algebra actions." with "Construct the smooth mod-p and locally analytic categories for GL₂(Q_p), and specialize PadicMeasuresIwasawaAlgebras L1:banach-representations' admissible unitary Banach category to GL₂(Q_p), with their duals and completed group-algebra actions." Dependencies: "**Dependencies:** R30.1 (preceding layer)." → "**Dependencies:** R30.1 (preceding layer); [PadicMeasuresIwasawaAlgebras L1:banach-representations](../PadicMeasuresIwasawaAlgebras/README.md)."

**5. Edges.** Add L0 → L1:banach-representations, L1 → L1:banach-representations, NE.0 → L1:banach-representations, and L1:banach-representations → CC.2, CC.5 and R30.2. Cycle tests: acyclic.

**Placement.** The verifier asks for the category "beside, but separately from" the Lazard owner. NE.0 is a noncommutative-Iwasawa-theory stage; the Banach category belongs with PadicMeasuresIwasawaAlgebras, whose L0 already owns the continuous duals of p-adic Banach spaces of functions and whose L1 owns completed group rings. The new sub-stage imports NE.0 and stays separate from it. A PadicMeasuresIwasawaAlgebras stage importing an NE stage is acyclic, because NE.0's only ancestors are L0, L1 and Tau Ceti ProfiniteProPGroups.

### Not done, and why
- The published Israel J. Math. version and Emerton's *Memoirs* §6.2 (where admissibility for locally compact G is developed; his interpolation paper imports it, p. 8) were not read. The compact-open independence argument above uses only NE.0's freeness lemma.

## /18 (medium, error): the completed Hecke algebra and its localization are built once, in CC.8

### What the verifier corrected
- IHG.2 constructs finite image algebras and localization on perfect complexes but is not an ancestor of CC.8. Gee–Newton v5, Definition 2.1.11 and Lemma 2.1.14 (pp. 10–11), construct the profinite Hecke limit, prove stabilization of maximal ideals, and obtain semilocal complete factors.
- Ordinary algebraic localization exists without semilocality; this proof is needed for the compatible topological decomposition in the tower.
- **Add IHG.2 → CC.8 and a source-qualified finite-image/inverse-limit producer; R31.3 specializes it.** TC.2's two edges do not by themselves establish a second localization there.
- **Proposition 3.4.16 (p. 23) concerns the patched complex over O_∞[[K₀]], with patching data and hypotheses: do not cite it as a proof of CC.4 for arbitrary towers, or declare CC.4's source gap closed.** Keep the Emerton lifted-cell source action already in the decomposition.

### State on main (8ae020f6)
- CC.8 requires CC.6 and CC.7; its text is quoted in /16. IHG.2 (`content/campaign/IntegralHeckeAndGaloisDeterminants/README.md`): "For a Hecke action on a bounded perfect complex define its finite image algebras and compare chain, homotopy/derived and cohomology actions." IHG.2 requires IHG.0 only.
- R31.3: "Construct the completed Hecke algebra and its Galois determinant/representation with the correct residual hypotheses."
- The IntegralHeckeAndGaloisDeterminants packet (28 September) has nodes only for IHG.0 and IHG.1; IHG.2 is unread.
- **Libraries.** Neither has completed Hecke algebras. Mathlib's decomposition of an artinian ring into local factors (`IsArtinianRing.quotNilradicalPowEquivPi`, `Mathlib/RingTheory/Artinian/Module.lean:625`) is the finite-level ingredient; the profinite semilocal decomposition is not there.
- Read for this fix: Gee–Newton, *Patching and the completed homology of locally symmetric spaces*, arXiv:1609.06965v5, pp. 2, 7, 9–11, 14, 16, 18–19, 22–24.

### Fix
1. **CC.8** (after /16's text). Replace "Construct the completed Hecke algebra and localisation at a specified residual Hecke ideal (see below)." with:
   > Import IntegralHeckeAndGaloisDeterminants IHG.2's finite image algebras on perfect complexes and construct the completed Hecke algebra T^S(U^p) = lim←_{U_p, s} T^S(U_pU^p, s), where T^S(U, s) is the image of the abstract Hecke algebra in End_{D(O/ϖ^s[K₀/U_p])}(C(U, s)) for CC.4's finite-level complexes C(U, s), with the inverse-limit topology (Gee–Newton, Definition 2.1.11, p. 10; each T^S(U, s) is finite, Remark 2.1.12). Prove that T^S(U^p) is semilocal, J-adically complete and separated for its Jacobson radical J, and the product of its localizations at its finitely many maximal ideals, each complete local with finite residue field (Lemma 2.1.14, p. 11). Then construct the localisation at a specified residual Hecke ideal. Gee–Newton work with PGL_n over a number field and K₀ = ∏_{v|p} PGL_n(O_{F_v}); the construction is transported to the towers of CC with its hypotheses checked.
2. **CC.8 decomposition nodes (maintainer).** Add to `data/decompositions/CompletedCohomologyPartII.json` two nodes under CC.8, for the two statements above: `CC.8/completed-hecke-algebra` (Definition 2.1.11 with Remark 2.1.12) and `CC.8/completed-hecke-semilocal` (Lemma 2.1.14; its proof uses the finite-level homology, nilpotent kernels and Matsumura Theorem 8.15). Add a source entry for Gee–Newton v5.
3. **Edge.** Add IHG.2 → CC.8. Cycle test: acyclic (IHG.2 depends only on IHG.0). The Dependencies line is in /16.
4. **R31.3.** Replace "Construct the completed Hecke algebra and its Galois determinant/representation with the correct residual hypotheses." with "Specialize CompletedCohomologyPartII CC.8's completed Hecke algebra and its localisation to modular and Shimura curves, and construct its Galois determinant/representation with the correct residual hypotheses."
5. **CC.4 source route (scoped lead only).** In CC.4's Dependencies paragraph nothing changes. In the decomposition's CC.4 coverage, add as a lead: "Gee–Newton §2.1 (the complexes C(U, s)); their Proposition 3.4.16 (p. 23) constructs a perfect complex C̃(∞) of O_∞[[K₀]]-modules with O_∞/J ⊗_{O_∞[[U_p]]} C̃(∞) ≅ C(U_p, J, ∞), but only for the patched complex, under their standing assumptions (p > n ≥ 2, Conjectures 3.3.3 and 3.3.7, an enormous absolutely irreducible ρ̄_m). It does not close CC.4's gap for arbitrary towers." The gap stays open, and the Emerton lifted-cell source action stays.

### Not done, and why
- CC.4's chain-model gap is not declared closed, as the verifier requires.

## /19 (medium, missing): MP.6 states the two Siegel–Weil identities GZ.5 uses

### What the verifier corrected
- The GZ.5 Waldspurger node uses two Siegel–Weil identities, on (E, q) and on (B₀, q) (Yuan–Zhang–Zhang's public draft of 6 November 2011, §1.5.1, p. 23, as the verifier read it), and has no incoming producer. MP.6 is the reusable theta-integral interface.
- Gan–Qiu–Takeda v3 §1.7 gives the convergent range: r = 0 or m − r > n + ε₀, with ε₀ = 1 in the orthogonal–symplectic case.
- **Supply the exact convergent or regularized identity, constants and measures for each GZ instance, adapting cover-specific Eisenstein analysis rather than importing linear AS blindly.**
- **The proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger already includes general Siegel–Weil/Rallis theory. Its parent brief imports MP.0–MP.6 and GZ.4–GZ.5, so importing that Part II into MP.6 or GZ.5 would be circular. Extract the applicable Siegel–Weil foundation before the Gross–Zagier-dependent part, with independent analytic suppliers, and let both consumers import it.** The full Siegel–Weil proof is not certified.

### State on main (8ae020f6)
- MP.6 (`content/campaign/MetaplecticAutomorphicForms/README.md`): "Export the quadratic-character and quaternionic-norm-form instances to GZ.5; export the coherent/incoherent local sections and functional-equation conventions to GZ.6." MP.6 requires MP.5 only; MP.5 requires AF.1 and MP.4. MP.6 → GZ.5 is a stage edge.
- `data/decompositions/GrossZagierAndArithmeticHeights.json`, node `GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`: "The source states that both are implied by the SIEGEL-WEIL formula with minor extra work: the first by Siegel-Weil on the quadratic space (E,q), the second by Siegel-Weil on (B_0,q) with B_0 the trace-zero elements of B." Its incoming links are from GZ.0 and GZ.4; its gap 3 records the two Siegel–Weil formulae as not verified.
- Accepted routes to the proposed Part II: GAN-ICHINO-18 route 1, ICHINO-PRASANNA-23 route 4 ("Rallis inner product, Siegel–Weil, global lifts"), GAN-SAVIN-23-B route 6. No design job or stage exists.
- No library has Siegel–Weil, the Weil representation or theta series of quadratic forms. Mathlib's `jacobiTheta` and `jacobiTheta_S_smul` (`Mathlib/NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:29`, `:43`) are the one-variable theta function and its S-transformation.

**The convergent range, checked here.** Gan–Qiu–Takeda (arXiv:1207.4709v3) §1.7, p. 3: "(Weil's convergent range) r = 0 or m − r > n + ε₀", with ε₀ = ε = 1 for E = F; §3.1, p. 14: the theta integral converges if and only if r = 0 or m − r > d(n) = n + ε₀. Here Sp(W_n) = Sp_{2n}, so SL₂ is n = 1 and the condition is r = 0 or m − r > 2.
- (E, q), E/F a quadratic field extension with its norm form scaled: m = 2, anisotropic, so r = 0: convergent.
- (B₀, q), the trace-zero part of a quaternion division algebra B: m = 3, anisotropic (an isotropic trace-zero vector would be a nonzero nilpotent), so r = 0: convergent.
- (B₀, q) with B ≅ M₂(F): m = 3, r = 1, m − r = 2, not > 2: outside the convergent range (in Gan–Qiu–Takeda's second-term range, d(n) < m ≤ 2d(n), p. 18).

For m = 2 the Weil representation of SL₂ × O(V) is linear; for m = 3 it is genuine on the metaplectic cover Mp₂.

### Fix
1. **MP.6.** Replace "Export the quadratic-character and quaternionic-norm-form instances to GZ.5; export the coherent/incoherent local sections and functional-equation conventions to GZ.6." with:
   > Prove the Siegel–Weil identities used by GrossZagierAndArithmeticHeights GZ.5's Waldspurger node, for n = 1:
   > - the binary space V = (E, q), E/F a quadratic field extension with its scaled norm form, for (SL₂, O(V));
   > - the ternary space V = (B₀, q) of trace-zero elements of a quaternion algebra B, for (Mp₂, O(V)).
   >
   > Weil's convergent range for (Sp_{2n}, O(V)) is r = 0 or m − r > n + 1 (m = dim V, r its Witt index; Gan–Qiu–Takeda, arXiv:1207.4709v3, §1.7, p. 3, and §3.1, p. 14). (E, q), and (B₀, q) for B a division algebra, are anisotropic, so their theta integrals converge and the classical identity of Weil and Kudla–Rallis applies. For B ≅ M₂(F), (B₀, q) has Witt index 1 and lies outside the convergent range: state and prove the regularized identity that GZ.5 actually uses in that case, or restrict GZ.5's use to division B if the source does. For each case record the constant and the Tamagawa measures (AdelicAlgebraicGroups AA.2) of the identity used.
   >
   > The Siegel Eisenstein series come from AutomorphicSpectralTheory AS.1–AS.2 on SL₂ for m = 2, and from MP.5's genuine Eisenstein spaces on Mp₂ for m = 3, whose estimates are adapted to the cover, not imported. The general regularized Siegel–Weil formula and the Rallis inner product formula stay with the proposed MetaplecticAutomorphicFormsPartIIShimuraWaldspurger, which imports these instances; MP.6 and GZ.5 do not import that Part II.
   >
   > Export the quadratic-character and quaternionic-norm-form instances to GZ.5; export the coherent/incoherent local sections and functional-equation conventions to GZ.6.
2. **Edge.** Add AS.2 → MP.6 (AS.1 through AS.2). Cycle test: acyclic (AS.2's closure has no MP stage).
3. **Decomposition link (maintainer).** In `data/decompositions/GrossZagierAndArithmeticHeights.json`, add the link `MetaplecticAutomorphicForms:MP.6` → `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof`, reason "the two Siegel–Weil identities on (E,q) and (B₀,q), with the convergent/regularized case distinction". Cycle test: acyclic. The node's gap 3 stays open until the identities are decomposed.
4. **For the Part II's design (design).** The brief of MetaplecticAutomorphicFormsPartIIShimuraWaldspurger (GAN-ICHINO-18 `routes[0]`) should say that the binary and ternary Siegel–Weil instances are MP.6's and are imported, and that the Part II owns the general regularized formula and the Rallis inner product formula.

### Not done, and why
- **The Yuan–Zhang–Zhang book or draft could not be obtained here**, so whether GZ.5 uses split B is not re-checked; the fix states both cases.
- **The constant is not stated.** Gan–Qiu–Takeda do not display the convergent-range identity with its constant, and Kudla–Rallis was not read; the constant is left to the decomposition, as the verifier requires.

## /20 (medium, duplicate): one owner for the Jacobi group and Jacobi forms, MP.6:jacobi

### What the verifier corrected
- MP.8 defines Jacobi forms in the BFH genus-two setting; QM.1 separately constructs them although it imports MP.8; L2s imports "Jacobi structures" from MP.0–MP.6, where none is stated.
- **Own the Jacobi group and Schrödinger–Weil representation, coefficient/index/multiplier data and the Fourier–Jacobi/theta decomposition once, with symplectic and unitary instances; keep MP.8's GSp₄ cover and QM.1's q-series applications.**
- **The finding's L2 claim is wrong:** the Jacobi paragraph inside L2's extracted description is L2s's subsection. L2s already reaches MP.6. Add an L2 edge only after L2's own Fouquet–Wan use is established.
- Mathlib's `jacobiTheta_S_smul` is one theta function, not a Jacobi-form category.

### State on main (8ae020f6)
- MP.8: "Define Jacobi modular forms, theta decomposition, half-integral-weight automorphy factors and the genus-two genuine Eisenstein series attached to the elliptic newform." MP.0–MP.6 plan the Heisenberg group and the oscillator representation only.
- `content/campaign/QSeriesPartitionsAndMockModularForms/README.md`, QM.1: "**Construct and export.** Construct theta/eta functions and Jacobi forms with multiplier systems, weights and indices; connect to existing ModularForms and MetaplecticAutomorphicForms owners." Inputs: QM.0, LI.4, MP.7, MP.8.
- `content/campaign/AutomorphicCongruences/README.md`, L2s: "Import the generic finite/profinite projector from PadicFamilies L0a and Weil/Heisenberg/Jacobi structures from MetaplecticAutomorphicForms MP.0–6;". L2s requires MP.6; L2 (a separate stage) has no MP prerequisite and its own text does not mention Jacobi forms.
- **New since the verification.**
  - The QSeriesPartitionsAndMockModularForms packet (24–27 September, partial, not reviewed) plans classical rank-one Jacobi forms in QM.1: `QM.1/jacobi-group-law`, `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/weak-jacobi-form`, `QM.1/jacobi-fourier-expansion`, `QM.1/theta-decomposition` and others, with requests to MP.7 for multiplier systems and the Weil representation ρ_L.
  - The MP.0 packet's gap for MP.7 says: "Existing QSeriesPartitionsAndMockModularForms:QM.1 owns the classical theta/eta/rank-one Jacobi development and consumes the metaplectic input; do not create a reverse dependency merely to reuse its consumer theorem."
  - The MP.8 packet plans nine nodes on genus-two Fourier-index shifts; its gap 0 is "Actual genus-two cover, Jacobi forms and analytic theta decomposition".

Those two packets would make QM.1 the owner of rank-one Jacobi forms while MP.8 and L2s need Jacobi structures upstream of QM.1. The verifier's single-owner repair governs.

### Fix
**1. New stage `MetaplecticAutomorphicForms:MP.6:jacobi`.** Insert before "## MP.7 — Half-integral weight, metaplectic Fourier coefficients and twists":

> <a id="stage-MP.6:jacobi"></a>
> ## MP.6:jacobi — The Jacobi group and Jacobi forms
>
> Using MP.0's Heisenberg group H(W), MP.1–MP.4's Weil representation and MP.5's theta series, construct:
> - the Jacobi group H(W) ⋊ Sp(W), its metaplectic cover, and the unitary analogue H(W) ⋊ U(W) for a Hermitian space;
> - the Schrödinger–Weil representation of the Jacobi group;
> - Jacobi forms of weight k and index m (a symmetric matrix, or a Hermitian one in the unitary case) with multiplier systems, including half-integral weight and index through the cover, with their cusp conditions;
> - Fourier–Jacobi coefficients of forms on the larger symplectic or unitary group;
> - the theta decomposition: a Jacobi form is a sum Σ_μ h_μ θ_{m,μ} of MP.5's theta functions of index m, with (h_μ) a vector-valued form for the Weil representation of the discriminant module (in genus one, φ(τ, z) = Σ_{μ mod 2m} h_μ(τ) θ_{m,μ}(τ, z) with (h_μ) of weight k − 1/2).
>
> Work in the generality QM.1, AutomorphicCongruences L2s (the Castella–Liu–Wan Fourier–Jacobi calculations on GU(3,1)) and MP.8 need. MP.8 specializes this to the BFH cover of GSp(4); QM.1 specializes it to the classical rank-one case and keeps the eta and q-series development. Mathlib's `jacobiTheta_S_smul` is one theta transformation law, not a Jacobi-form category.

Stage record: `requires` = [MP.5]; consumers MP.7, QSeriesPartitionsAndMockModularForms:QM.1, AutomorphicCongruences:L2s.

**2. MP.8.** Replace "Define Jacobi modular forms, theta decomposition, half-integral-weight automorphy factors and the genus-two genuine Eisenstein series attached to the elliptic newform." with "Specialize MP.6:jacobi's Jacobi forms and theta decomposition to this cover, and define the half-integral-weight automorphy factors and the genus-two genuine Eisenstein series attached to the elliptic newform." (MP.8 reaches MP.6:jacobi through MP.7.)

**3. QM.1.**
- Replace "**Construct and export.** Construct theta/eta functions and Jacobi forms with multiplier systems, weights and indices; connect to existing ModularForms and MetaplecticAutomorphicForms owners." with "**Construct and export.** Construct theta/eta functions and their q-series. Import Jacobi forms with multiplier systems, weights and indices, Fourier–Jacobi coefficients and the theta decomposition from MetaplecticAutomorphicForms MP.6:jacobi, and specialize them to the classical rank-one case; connect to existing ModularForms owners."
- Inputs line: add `MetaplecticAutomorphicForms:MP.6:jacobi` after `FoundationsAndLibraryIntegration:LI.4`.

**4. L2s.** Replace "Import the generic finite/profinite projector from PadicFamilies L0a and Weil/Heisenberg/Jacobi structures from MetaplecticAutomorphicForms MP.0–6;" with "Import the generic finite/profinite projector from PadicFamilies L0a, Weil/Heisenberg structures from MetaplecticAutomorphicForms MP.0–6, and the unitary Jacobi group, Jacobi forms and Fourier–Jacobi coefficients from MP.6:jacobi;".

**5. Edges.** Add MP.5 → MP.6:jacobi, MP.6:jacobi → MP.7, MP.6:jacobi → QM.1 and MP.6:jacobi → L2s. Cycle tests: acyclic (MP has no QM or AutomorphicCongruences ancestor). No edge to L2.

**6. Packets (blueprint).**
- QSeriesPartitionsAndMockModularForms packet: the general parts of `QM.1/jacobi-group-law`, `QM.1/jacobi-form`, `QM.1/jacobi-cusp-form`, `QM.1/jacobi-fourier-expansion` and `QM.1/theta-decomposition` become MP.6:jacobi nodes; QM.1 keeps their rank-one classical specializations, which import them, and its eta, weak and weakly holomorphic, index-raising and heat-operator nodes. Add a request to `MetaplecticAutomorphicForms:MP.6:jacobi`.
- MP.0 packet: its MP.7 gap sentence quoted above becomes: "MetaplecticAutomorphicForms MP.6:jacobi owns the Jacobi group, Jacobi forms and theta decomposition; QM.1 specializes them to the classical rank-one case and keeps the eta and q-series development."

### Not done, and why
- **No L2 edge**, as the verifier requires.
- **Eichler–Zagier was not read.** The genus-one theta decomposition above is the standard statement, to be pinned to a public source when MP.6:jacobi is decomposed.

## /21 (medium, error): MP.3 imports the smooth-representation and (𝔤,K) theory of the linear groups

### What the verifier corrected
- MP.3's ancestors stop at MP.0–MP.2, AL.0 and AA.0; its admissibility, finite-length and Jacquet-filtration targets have no SR.2/SR.3 or AF.1 inputs.
- **Add the smooth-category, Jacquet, admissibility and real-module suppliers, and name SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups among the roadmap's prerequisites.** Reuse the linear theory through proved splittings and cover-specific categories. Neither the linear results nor an archimedean (𝔤,K) category proves theta-module admissibility, finite length or Howe duality. Keep MP.3's source-qualified range and residual-characteristic limits.

### State on main (8ae020f6)
- MP.3: "Prove the elementary equivariance, admissibility/finite-length statements in the source's range, see-saw identities, Jacquet filtrations and the explicitly needed first-occurrence/vanishing comparisons." MP.3 requires MP.2 only.
- **New since the verification.** The MP.0 packet requests SR.0 (the abelian category) and SR.2 (induction, Jacquet functors) with MP.3 among `neededBy`, and AF.1 for MP.0 and MP.5 only; it has no request to SR.3.
- Read for this fix: Kudla, *Notes on the local theta correspondence* (1996). Its Howe duality principle (p. 33) assumes residue characteristic not 2; its §III.3 (p. 43) uses the smooth categories, normalized induction and Jacquet functors of the linear groups (Bernstein–Zelevinsky); its Jacquet-module filtration is Theorems III.8.1–III.8.2 (p. 57).

### Fix
1. **MP.3.** Replace the sentence quoted above with:
   > Import the smooth-representation category, induction, Jacquet functors and admissibility of the linear groups from SmoothRepresentationsOfLocalGroups SR.0:abelian-category, SR.2 and SR.3, and archimedean (𝔤,K)-modules from AutomorphicFormsOnReductiveGroups AF.1; prove only what is specific to the cover, through its proved splittings over unipotent radicals: the elementary equivariance, admissibility/finite-length statements in the source's range (Kudla's Howe duality principle, p. 33, assumes residue characteristic not 2), see-saw identities, Jacquet filtrations (Kudla, Theorems III.8.1–III.8.2, p. 57) and the explicitly needed first-occurrence/vanishing comparisons. The linear results do not by themselves prove admissibility or finite length of theta modules, or Howe duality.
2. **Edges.** Add SR.0:abelian-category, SR.2, SR.3 and AF.1 → MP.3. Cycle tests: acyclic (no SR or AF stage has an MP ancestor).
3. **Roadmap prerequisites.** The roadmap-level prerequisite list is derived by assembly from stage edges; with these edges (and /23's AA.3 → MP.5) it gains SmoothRepresentationsOfLocalGroups and AdelicAlgebraicGroups. The MP README's "Ownership and scope" already names both, so no prose change is needed.
4. **MP.0 packet (blueprint).** Add a request to `SmoothRepresentationsOfLocalGroups:SR.3` (admissibility and finite length) with `neededBy` MP.3, and add MP.3 to the `neededBy` of the AF.1 request.

### Not done, and why
- Nothing is left.

## /22 (medium, error): MP.2 imports the Hilbert symbol and local Hasse invariant from QuadraticFormInvariants 6C

### What the verifier corrected
- The frozen QuadraticFormInvariants 6C owns the Hilbert symbol including dyadic cases, `localHasse` and the comparison with the class-field-theory pairing, but has no path to MP.2.
- **Import that layer for the Weil-index formulas; keep the real and complex places separately scoped and prove the discriminant/convention bridge.** The ClassFieldTheory link screen declined a direct dependency for the analytic product formula; it did not decide MP.2's quadratic-form input. A missing link job is not permission to rebuild the upstream carrier.

### State on main (8ae020f6)
- MP.2: "Prove orthogonal-sum, scaling, discriminant and Hilbert-symbol identities, including dyadic factors; work with the source's precise quadratic versus bilinear discriminant convention."
- The stage `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` is in the assembled atlas with no consumers. Its README (`content/tau-ceti/QuadraticFormInvariants/README.md`, 6C) plans `hilbertSymbol` over a nonarchimedean local field, bimultiplicativity "with the dyadic case included", `localHasse`, the odd-residue and ℚ₂ formulas, the general dyadic case, and the comparisons with the class-field-theory symbol and the product formula. It has no real or complex place.
- **Library.** Neither `hilbertSymbol` nor `localHasse` is declared at Tau Ceti `f790474` (no entry in `declarations.tsv`); these are 6C's planned names. Tau Ceti has the archimedean Brauer group (`TauCeti.Quaternion.brauerGroupMulEquiv`, `TauCeti/Algebra/BrauerGroup/Real.lean:102`) and quaternion symbol algebras.
- The MP.0 packet's gap for MP.2 says "The reviewed audit routes generic Hilbert-symbol theory to QuadraticFormInvariants Layer 6C; verify that supplier before importing its precise statement." FIX-RT-AUDIT-15 (29 September, pending merge) removed MP.2 → 6C from AUDIT-15's duplicates, as a supplier relation.
- The only link job for QuadraticFormInvariants, `LINK-tauceti_TauCetiRoadmap_QuadraticFormInvariants`, is pending in `research/blueprint/queue.json`.

### Fix
1. **MP.2.** Replace "Prove orthogonal-sum, scaling, discriminant and Hilbert-symbol identities, including dyadic factors; work with the source's precise quadratic versus bilinear discriminant convention." with:
   > Import the Hilbert symbol and the local Hasse invariant, including the dyadic cases, from Tau Ceti's QuadraticFormInvariants layer 6C (`hilbertSymbol`, `localHasse`), and prove the orthogonal-sum, scaling and discriminant identities of the Weil index in their terms, including dyadic factors; prove the bridge between the source's quadratic versus bilinear discriminant convention and 6C's. 6C is nonarchimedean: state and prove the real and complex places separately.
2. **Edge.** Add `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` → MP.2 in `data/atlas.json`. Cycle test: acyclic.
3. **Link entry (link job).** For the pending LINK job on QuadraticFormInvariants: source 6C → target `MetaplecticAutomorphicForms:MP.2`; reason "MP.2's Weil-index identities are stated in terms of the Hilbert symbol and local Hasse invariant, dyadic cases included"; target evidence the MP.2 sentence above.
4. **MP.0 packet (blueprint).** Its MP.2 gap can record the supplier as verified.

### Not done, and why
- The upstream QuadraticFormInvariants README is not edited: it is immutable here, and needs no change.

## /23 (medium, error): MP.5 imports growth, constant terms and Siegel sets

### What the verifier corrected
- MP.5 plans growth, genuine cusp and Eisenstein spaces, constant terms and theta-lift convergence, but reaches only AF.1 and AA.0.
- **Add AF.3 and AA.3 (AF.2 comes transitively), and prove the transfer of the linear estimates to the cover with its splittings.** MP.6/MP.7 inherit them; MP.8's later AS imports cannot supply earlier stages. Theta-specific convergence, regularization and interchanges stay in MP: rapid decay of cusp forms is not convergence of every theta integral.

### State on main (8ae020f6)
MP.5: "Construct genuine cusp and Eisenstein spaces on the cover, constant terms and Fourier–Whittaker expansions with the required splitting over unipotents." MP.5 requires AF.1 and MP.4.

### Fix
1. **MP.5.** Replace the sentence quoted above with "Import moderate growth, automorphic spaces, constant terms and rapid decay on Siegel sets from AutomorphicFormsOnReductiveGroups AF.2–AF.3 and Siegel sets from AdelicAlgebraicGroups AA.3, and prove their transfer to the cover through its splittings over unipotent radicals. Construct genuine cusp and Eisenstein spaces on the cover, constant terms and Fourier–Whittaker expansions with the required splitting over unipotents." The following sentences on theta-lift convergence and regularization stay.
2. **Edges.** Add AA.3 → MP.5 and AF.3 → MP.5. Cycle tests: acyclic.

### Not done, and why
- Nothing is left.

## /24 (medium, duplicate): ET.1 owns invariant orbital integrals; AS.6 imports them

### What the verifier corrected
- Arthur §18 (p. 102) builds weighted orbital integrals from invariant measure with a nonconstant weight. ET.1 already owns centralizer quotient measures, regular semisimple convergence and singular extensions; AS.6 does not reach it.
- **Use ET.1 (or an early local prefix) as the shared owner, add ET.1 → AS.6, and keep weighted estimates, (G,M)-families and fine expansions at AS.6.** Do not move weighted orbital integrals into ET.1, and do not infer singular convergence from the regular theorem. Coordinate with /4's Paley–Wiener supplier. The alternative AS.6 → ET.1 is not selected.

### State on main (8ae020f6)
- ET.1: "Construct quotient measures on centralizer quotients, convergence of regular semisimple orbital integrals, stable and kappa-weighted sums, and the relevant singular extensions by descent/germ analysis. Reuse AS's basic measure theory;". ET.1 requires AA.2, AF.1 and ET.0.
- AS.6: "Develop weighted orbital integrals, weighted characters, (G,M)-families, convergence and the fine expansions; then construct the invariant distributions by the invariantization recursion."
- Arthur (p. 104, (18.3)): J_M(γ, f) = |D(γ)|^{1/2} ∫_{G_γ(F_S)\G(F_S)} f(x⁻¹γx) v_M(x) dx for G_γ ⊂ M; p. 103 recalls Deligne–Rao's invariant measure on a conjugacy class.
- The coverage record for AS.6 already lists ET.1 as a duplicate ("quotient measures, orbital integrals").

### Fix
1. **ET.1.** Replace "Construct quotient measures on centralizer quotients, convergence of regular semisimple orbital integrals, stable and kappa-weighted sums, and the relevant singular extensions by descent/germ analysis. Reuse AS's basic measure theory;" with:
   > This stage is the single owner of invariant orbital integrals; AutomorphicSpectralTheory AS.6 imports them. Construct invariant quotient measures on centralizer quotients G_γ\G. Prove absolute convergence of the orbital integral of every semisimple class (semisimple classes are closed, so the integrand has compact support on G_γ\G) and of the normalized regular semisimple orbital integrals, the stable and kappa-weighted sums, and the relevant singular extensions by descent/germ analysis; convergence at singular elements is proved, not inferred from the regular theorem. Reuse AS's basic measure theory;
2. **AS.6** (combined with /4). Replace "Develop weighted orbital integrals, weighted characters, (G,M)-families, convergence and the fine expansions; then construct the invariant distributions by the invariantization recursion." with:
   > Import invariant orbital integrals from EndoscopicTransferAndUnitaryTraceComparison ET.1, and the real invariant Paley–Wiener theorem and Arthur's multiplier theorem from AutomorphicFormsOnReductiveGroups AF.1c. Develop here:
   > - the weighted orbital integrals J_M(γ, f) = |D(γ)|^{1/2} ∫_{G_γ(F_S)\G(F_S)} f(x⁻¹γx) v_M(x) dx for G_γ ⊂ M (Arthur, *An introduction to the trace formula*, (18.3), p. 104), whose weight v_M is not constant, and their extension to general γ;
   > - the weighted characters, built from AS.2's normalized intertwining operators;
   > - (G,M)-families and their estimates, convergence, and the fine expansions, including the unipotent terms.
   >
   > Then construct the invariant distributions by the invariantization recursion on the space I(G(F_S)) (Arthur §23, p. 146): Clozel–Delorme's characterization at the archimedean places (AF.1c), and the Bernstein–Deligne–Kazhdan trace Paley–Wiener theorem at the p-adic places, imported from the proposed SmoothRepresentationsCharactersPartII once it is designed and until then a named input without an owner.
3. **Edge.** Add ET.1 → AS.6. Cycle test: acyclic (ET.1's ancestors are AA.2, AF.1, ET.0 and, after /2 and /4, AF.1b and AF.1c, none of which reaches AS).

### Not done, and why
- The p-adic trace Paley–Wiener theorem has no owner until the Part II is designed (/4).

## /25 (medium, missing): AF.4 gets Wigner's lemma, the tempered cohomology range and the Vogan–Zuckerman classification

### What the verifier corrected
- AF.4 only defines cohomological representations; the accepted Calegari–Geraghty and Ichino–Prasanna routes already request the tempered range and the Vogan–Zuckerman modules there. Harder–Raghuram §§3.1.4–3.1.5 (pp. 17–19) invoke Wigner and Delorme and compute the GL_n range with split-centre and component-group terms.
- **Expand the existing AF.4 plan using those routes, not a rival owner: Wigner's criterion, the source-scoped tempered calculation, the unitary A_𝔮(λ) classification and cohomology.**
- The interval [q₀, q₀ + ℓ₀] depends on the chosen central quotient and on coefficient and tempered hypotheses; it is not a statement about all cohomological representations. The Vogan–Zuckerman and Delorme proofs remain to be decomposed; the Hermitian Hodge bigrading is a further specialization.

### State on main (8ae020f6)
- AF.4: "Define algebraic highest weights, infinitesimal characters and cohomological representations; …" (full text in /30). AF.4 requires AF.1 and AF.2.
- Accepted routes: CALEGARI-GERAGHTY-18 `routes[11]` (AF.1, AF.4; ℓ₀ = rank G(ℝ) − rank K∞ − rank A, q₀ with 2q₀ + ℓ₀ = dim of the symmetric space, and Borel–Wallach's range); CALEGARI-GERAGHTY-20 `routes[9]`; ICHINO-PRASANNA-23 `routes[5]` (AF.4; Vogan–Zuckerman 1984, Theorem 5.3 and Proposition 6.19).
- No library has (𝔤,K)-cohomology, Wigner's lemma or A_𝔮(λ).

**The range, checked here against Harder–Raghuram.** Harder–Raghuram (arXiv:1405.6513v2), Proposition 3.11, p. 19, gives for GL_n over ℚ nonvanishing exactly in degrees b_n = ⌊n²/4⌋ to t_n = b_n + ⌈n/2⌉ − 1 (plus r_F − 1 at the top over a totally real F, from the centre), crediting "Delorme's Lemma; see, for example, Borel–Wallach [5, Thm. III.3.3]". With the symmetric space of dimension d = n(n+1)/2 − 1, ℓ₀ = rank SL_n(ℝ) − rank SO(n) = ⌊(n − 1)/2⌋ and q₀ = (d − ℓ₀)/2: n = 2 gives [1, 1]; n = 3 gives q₀ = 2, ℓ₀ = 1, [2, 3]; n = 4 gives [4, 5]; n = 5 gives [6, 8]. These agree with [b_n, t_n], so the finding's formulas are right for GL_n over ℚ with this central quotient.

### Fix
1. **AF.4** (the local part; see /30 for the split). After "Construct coefficient systems from algebraic representations with lattices and prove independence of the chosen lattice after inverting its primes." insert:
   > Import the discrete series, limits of discrete series and the Langlands classification from AF.1b, and prove:
   > - **Wigner's lemma**: if H^*(𝔤, K; π ⊗ V_λ) ≠ 0 for an irreducible (𝔤,K)-module π with an infinitesimal character, that character is the one of V_λ^∨; so only finitely many π occur for a given λ (Harder–Raghuram §3.1.4, p. 17).
   > - **The tempered range** (Delorme's lemma; Borel–Wallach III.3.3): with ℓ₀ = rank G(ℝ) − rank K∞A_G and q₀ = (dim X∞ − ℓ₀)/2 for the chosen central quotient (so 2q₀ + ℓ₀ = dim X∞), a tempered cohomological π has H^q(𝔤, K; π ⊗ V_λ) ≠ 0 exactly for q₀ ≤ q ≤ q₀ + ℓ₀, of dimension (ℓ₀ choose q − q₀) up to the component-group and split-centre factors. For GL_n this is Harder–Raghuram's Proposition 3.11 (p. 19). The range is for tempered π under these coefficient hypotheses, not for all cohomological representations.
   > - **The Vogan–Zuckerman classification** (Vogan–Zuckerman, Compositio Math. 53 (1984); Theorem 4.1 with trivial coefficients and Theorem 5.6 with coefficients, the latter stated in their §5 without detailed proofs): the irreducible unitary π with H^*(𝔤, K; π ⊗ F) ≠ 0 are the modules A_𝔮(λ) attached to θ-stable parabolic subalgebras 𝔮, with their cohomology (Theorem 3.3); in the Hermitian case, with its Hodge decomposition as a further specialization.
2. **Edge.** AF.1b → AF.4 is /2's.
3. **Routes.** The three accepted routes stay at AF.4 (CALEGARI-GERAGHTY-18's AF.1 half is for relative cochains, now AF.1a's by /29; its stages may add AF.1a, with a verdict).

### Not done, and why
- Borel–Wallach and Delorme were not read; their statements are Harder–Raghuram's. Vogan–Zuckerman was read for the theorem numbers; its displays did not survive text extraction, so its formulas are not transcribed here.

## /26 (medium, error): AF.2 imports the spherical Hecke algebra from SR.4

### What the verifier corrected
- AF.2 requires SR.3 but does not reach SR.4's Satake theorem. Goffeng–Mesland–Şengün v2 §§3.2–3.3 (pp. 6–7) make the Gelfand-pair hypothesis explicit and separate the unitary factorization from Flath's admissible one; Harder–Raghuram §2.3.4 (pp. 14–15) use the almost-everywhere commutative local algebra.
- **Add SR.4 → AF.2 and prove the one-dimensional invariant line at the hyperspecial places supplied by the reductive model.** This does not claim one-dimensional invariants for every compact open, or replace Flath's admissible theorem with the unitary one.

### State on main (8ae020f6)
- AF.2: "For irreducible admissible constituents, prove restricted tensor-product factorization and uniqueness of almost-everywhere spherical vectors up to the specified scalars." AF.2 requires AF.0, AF.1 and SR.3.
- SR.4 (`content/campaign/SmoothRepresentationsOfLocalGroups/README.md`): "For unramified G and a hyperspecial subgroup K, construct the Satake transform and prove the isomorphism with the appropriate invariant algebra on the dual torus, retaining the relative Weyl group and Frobenius action." SR.4 does not state commutativity of the spherical Hecke algebra or dim π^K ≤ 1; commutativity follows from the Satake isomorphism, whose target is commutative.
- Tau Ceti's Hecke rings are classical (Shimura, Chapter 3): commutativity from an anti-involution (`HeckeRing.commSemiringOfAntiInvolution`, `TauCeti/NumberTheory/HeckeRing/Commutativity.lean:478`) and GL_n over ℚ. There is no p-adic spherical Hecke algebra or Satake transform.

### Fix
1. **AF.2.** Replace "For irreducible admissible constituents, prove restricted tensor-product factorization and uniqueness of almost-everywhere spherical vectors up to the specified scalars." with:
   > Import from SmoothRepresentationsOfLocalGroups SR.4 the Satake isomorphism at hyperspecial K_v, and deduce that the spherical Hecke algebra H(G(F_v), K_v) is commutative. At the places where AdelicAlgebraicGroups AA.1's reductive model makes K_v = G(O_v) hyperspecial, deduce dim π_v^{K_v} ≤ 1 for irreducible admissible π_v: π_v^{K_v} is a finite-dimensional simple module over a commutative algebra. For irreducible admissible constituents, prove restricted tensor-product (Flath) factorization and uniqueness of almost-everywhere spherical vectors up to the specified scalars. Goffeng–Mesland–Şengün's Theorem 3.3 (p. 7) is the narrower unitary version; one-dimensionality is not claimed for other compact opens.
2. **Edge.** Add SR.4 → AF.2. Cycle test: acyclic (SR.4 requires RG2.4, RG2.5 and SR.1, none downstream of AF.2).

### Not done, and why
- Flath's paper was not read; Goffeng–Mesland–Şengün, pp. 6–7, and Harder–Raghuram, pp. 14–15, were.

## /27 (medium, error): ALS.4 imports parabolic induction and the integral Satake transform

### What the verifier corrected
- ALS.4 promises parabolic-induction and Satake compatibility with no SR ancestor. SR.2 supplies normalized and unnormalized induction and Jacquet conventions; SR.4 supplies Satake and reaches RG2.4's Iwasawa decomposition.
- **Add SR.2 and SR.4 to ALS.4. For integral boundary cohomology use the integral unnormalized transform with its coefficient hypotheses; do not adjoin √q or import complex admissibility as an integral theorem.** Harder–Raghuram's Proposition 4.3 confirms the unnormalized induction convention for its characteristic-zero formula.

### State on main (8ae020f6)
- ALS.4's sentence is quoted in /6. ALS.4 has no SR ancestor.
- SR.4 says "Specify coefficients and q-half normalization; record the integral unnormalized form separately." SR.2: "Construct smooth induction from closed subgroups and compact induction with support compact modulo the subgroup."

### Fix
1. **ALS.4 text.** The replacement in /6 item 2 includes SR.2's induction, SR.4's integral unnormalized Satake transform, the separate modulus and q^{1/2} data, and Harder–Raghuram's unnormalized induction.
2. **Edges.** Add SR.2 → ALS.4 and SR.4 → ALS.4. Cycle tests: acyclic.

### Not done, and why
- Nothing is left.

## /28 (medium, error): neatness moves to an early prefix of AA.4

### What the verifier corrected
- AA.4 and the ALS prefix use neat levels before D5's definition and V0's existence result; V0 consumes ALS.0, so importing V0 backwards cycles.
- Milne (2017) §3, p. 34, gives the representation-independent neatness definition and Proposition 3.5's finite-index neat congruence subgroup, citing Borel 17.4.
- **Move the reusable neatness and existence API to an early AA.3/AA.4 prefix and have ALS.0, D5 and V0 import it.** Prove the passage to neat compact opens, normal cores and restriction of scalars with the convention "all rational intersections", rather than read Milne's rational-subgroup proposition as a statement about every element of a p-adic compact open.
- Keep the effective-action and central-unit caveats in ShimuraData: torsion-free does not make an arbitrary arithmetic action faithful. Borel's proof remains to be expanded.

### State on main (8ae020f6)
- AA.4 (`content/campaign/AdelicAlgebraicGroups/README.md`): "Construct finite covering maps for nested compact opens at neat levels,". ALS.0: "Prove proper discontinuity and, at neat level, freeness."
- `content/campaign/ShimuraData/README.md`, D5: "Define neatness with representation independence and the arithmetic subgroup attached to a compact open level and a connected component." Dependencies "**Dependencies:** D0 and D4." The ShimuraData packet (28 September) has D1 nodes only; D5 is unread.
- `content/campaign/ShimuraVarieties/README.md`, V0: "Prove existence of neat congruence subgroups and properly discontinuous action of the effective groups." Dependencies "**Dependencies:** D5." (V0 requires ALS.0 and D5.)
- **This session's own earlier work.** FIX-RT-AUDIT-13 (29 September, not yet merged into `data/library-coverage.json`) added to AA.4's duplicates in `research/blueprint/audit/AUDIT-13.result.json` the entry for D5 with the note "Supplier rather than rival: D5 defines neatness, with representation independence, which AA.4's neat-level covering target presupposes; D5 owns the definition and AA.4 should import it." The verified finding reverses that ownership; the correction below follows the verifier.
- **Library.** Mathlib's `Subgroup.IsArithmetic` (`Mathlib/NumberTheory/ModularForms/ArithmeticSubgroups.lean:102`) is for subgroups of GL₂(ℝ); neither library has neat elements or subgroups.
- Read: Milne, *Introduction to Shimura varieties* (revised 16 September 2017), p. 34 (definition, Proposition 3.5) and pp. 57–58 (neatness of the Γ_g for K small, "apply 3.5"); Milne gives no definition of a neat compact open of G(𝔸_f).

### Fix
**1. New stage `AdelicAlgebraicGroups:AA.4:neat-levels`.** Insert before "### AA.4. Approximation and level maps":

> <a id="stage-AA.4:neat-levels"></a>
> ### AA.4:neat-levels (early). Neat elements and neat levels
>
> For a linear algebraic group G over ℚ (and over a number field F through restriction of scalars):
> - An automorphism of a vector space over a subfield of ℂ is **neat** if its eigenvalues in ℂ generate a torsion-free subgroup of ℂ^×. An element g ∈ G(ℚ) is neat if ρ(g) is neat for one faithful representation ρ; prove that it is then neat for every representation. A subgroup is neat if all its elements are (Milne, *Introduction to Shimura varieties*, §3, p. 34).
> - Prove that neatness is stable under subgroups, conjugation and homomorphisms, and that neat subgroups are torsion-free.
> - A compact open K ⊂ G(𝔸_f) is **neat** if G(ℚ) ∩ gKg⁻¹ is neat for every g ∈ G(𝔸_f).
> - Prove Borel's theorem: every arithmetic subgroup contains a neat subgroup of finite index defined by congruence conditions (Milne, Proposition 3.5, citing Borel 1969, 17.4).
> - Deduce that every compact open K contains a neat normal open subgroup of finite index. Use AA.3's finiteness of G(ℚ)\G(𝔸_f)/K to reduce to finitely many rational intersections, then pass to normal cores. Milne's proposition concerns arithmetic subgroups of G(ℚ); this passage to compact opens of G(𝔸_f) is proved here, not read off.
>
> Torsion-freeness does not make an arithmetic action faithful: the effective-action and central-unit caveats stay in ShimuraData D5.

Stage record: `requires` = [AA.1, AA.3]; consumers AA.4, ArithmeticLocallySymmetricSpaces:ALS.0, ShimuraData:D5, ShimuraVarieties:V0.

**2. Consumers.**
- AA.4: the replacement in /7 begins its covering-map sentence with "Import neat levels from AA.4:neat-levels and construct finite covering maps for nested compact opens at neat levels,".
- ALS.0: "Prove proper discontinuity and, at neat level, freeness." → "Prove proper discontinuity and, at neat level (AdelicAlgebraicGroups AA.4:neat-levels), freeness."
- D5: "Define neatness with representation independence and the arithmetic subgroup attached to a compact open level and a connected component." → "Import neat elements, neat levels and their existence from AdelicAlgebraicGroups AA.4:neat-levels, and define the arithmetic subgroup attached to a compact open level and a connected component." Dependencies: "**Dependencies:** D0 and D4." → "**Dependencies:** D0 and D4; AdelicAlgebraicGroups AA.4:neat-levels." The rest of D5 ("Construct the *effective* arithmetic action … central rational units act faithfully.") stays.
- V0: "Prove existence of neat congruence subgroups and properly discontinuous action of the effective groups." → "Import the existence of neat congruence subgroups from AdelicAlgebraicGroups AA.4:neat-levels, and prove that the effective groups act properly discontinuously." Dependencies: "**Dependencies:** D5." → "**Dependencies:** D5; AdelicAlgebraicGroups AA.4:neat-levels."

**3. Edges.** Add AA.1 → AA.4:neat-levels, AA.3 → AA.4:neat-levels, and AA.4:neat-levels → AA.4, ALS.0, D5 and V0. Cycle tests: acyclic.

**4. Audit notes (audit merge).**
- In `research/blueprint/audit/AUDIT-13.result.json`, AA.4's duplicates entry for `ShimuraData:D5`: replace the note "Supplier rather than rival: D5 defines neatness, with representation independence, which AA.4's neat-level covering target presupposes; D5 owns the definition and AA.4 should import it." with "Consumer rather than rival: AdelicAlgebraicGroups AA.4:neat-levels owns neat elements, neat levels and their existence (RT-AREA-automorphic-1/28); D5 imports them and keeps the Shimura-specific effective action." This lands with the pending merge of FIX-RT-AUDIT-13.
- The merged coverage entry for AA.4 (from AUDIT-11) lists V0 with "Proves existence of neat congruence subgroups and uses strong approximation in the same restricted form, so the neatness and approximation targets overlap." Its note becomes "Imports neat levels from AA.4:neat-levels and the qualified strong approximation theorem; not a rival owner." This is for the orchestrator's audit merge.

**5. RS-04 (RS).** Its link AA.4 → V0 (qualified approximation) stays; see /7.

### Not done, and why
- Borel's 17.4 was not read; Milne was.

## /29 (medium, error): AF.1a is the single owner of the relative Lie algebra cochain complex

### What the verifier corrected
- AF.1 constructs the relative complex and AF.1a identifies invariant forms with it; neither imports the other. BorelRegulators R.2 imports AF.1a, while RS-04 names AF.1.
- **Make a single algebraic cochain/pair prefix available before both globalization and van Est, for example at AF.1a with AF.1a → AF.1, and retarget RS-04's rationale. Include the minimal pair/module data there, so that the prefix does not secretly depend on AF.1's globalization.**
- The finding overstates the README: it separates van Est from Eisenstein continuation and says globalization uses a separate source; it does not forbid every algebraic import. The prefix repair respects the intended separation.

### State on main (8ae020f6)
- AF.1's cochain sentence is quoted in /2. AF.1a: "Identify invariant forms with relative Lie algebra cochains, including the finite K/K° action, signs, differential and coefficient action." AF.1a requires UPSTREAM:RepresentationTheory and Tau Ceti LieGroups layer 9; its consumers are ALS.5, AS.5, BorelRegulators R.2 and ShimuraData D0.
- RS-04 (unreviewed), `owners[9]`: `{"target":"Relative Lie algebra cochain complex","owner":"AutomorphicFormsOnReductiveGroups:AF.1","formerly":["AutomorphicSpectralTheory:AS.5"]}`; `links[21]`: AF.1 → AS.5, "Relative Lie cochains are imported; weighted automorphic comparison remains AS.5."
- The coverage record for AF.1 lists AF.1a: "Also builds the relative Lie algebra cochain complex and identifies it with invariant forms; the cochain construction is stated in both layers."
- Mathlib's Lie cochains are low-degree only (/6).

### Fix
1. **AF.1a.** After "This stage owns the regulator comparison formerly consumed without a supplier by BorelRegulators:R.2." insert:
   > It is also the single owner of the algebraic cochain prefix that AF.1, ArithmeticLocallySymmetricSpaces ALS.4 and the regulator consumers share:
   > - pairs (𝔤, K): a real Lie algebra 𝔤 and a compact Lie group K with finitely many components, with 𝔨 ⊂ 𝔤 and a compatible adjoint action;
   > - (𝔤,K)-modules as algebraic data: a 𝔤-module with a locally finite K-action whose derivative is the 𝔨-action, with k·(X·v) = (Ad(k)X)·(k·v);
   > - the Chevalley–Eilenberg complex of a Lie algebra with coefficients, and the relative cochain complex Hom_K(∧^q(𝔤/𝔨), V), with its differential, functoriality, long exact sequences and the action of the finite group K/K°;
   > - Kostant's theorem (/6's statement).
   >
   > AF.1 imports this prefix. Neither the prefix nor van Est imports AF.1, AF.1b or any Eisenstein theory.
2. **AF.1.** /2's replacement begins "Import the pair (𝔤, K), (𝔤,K)-modules as algebraic data and the relative Lie algebra cochain complex Hom_K(∧^q(𝔤/𝔨), V) from AF.1a." The old sentence "Define relative Lie algebra cochains Hom_K(∧^q(g/k),V), differential, functoriality and long exact sequences." is thereby removed.
3. **Edge.** Add AF.1a → AF.1. Cycle test: acyclic (AF.1a's prerequisites are UPSTREAM and a Tau Ceti layer). BorelRegulators R.2 keeps importing AF.1a.
4. **RS-04 (RS).** `owners[9].owner`: `AutomorphicFormsOnReductiveGroups:AF.1` → `AutomorphicFormsOnReductiveGroups:AF.1a`. `links[21]`: source AF.1 → AF.1a, reason unchanged; the atlas already has AF.1a → AS.5.
5. **Coverage note (audit merge).** AF.1's duplicates entry for AF.1a becomes "Owns the relative Lie algebra cochain complex, which AF.1 imports (RT-AREA-automorphic-1/29)."
6. **Routes.** CALEGARI-GERAGHTY-20 `routes[9]` and BOXER-PILLONI-26 `routes[13]` quote AF.1's old cochain sentence as their reason; for their relative-cochain items the stage is now AF.1a. A consistent correction adds AF.1a to their stages, with a verdict; it changes no item's content.

### Not done, and why
- Nothing is left.

## /30 (medium, error): AF.4's cohomological targets move to a suffix after ALS.5

### What the verifier corrected
- AF.4's integral Hecke eigenclasses and rationality theorem have no ALS local-system/Hecke input or automorphic-cohomology comparison in their closure. Harder–Raghuram §§2.3.1–2.3.4 (pp. 13–15) build rationality on cohomology and its coefficient and Hecke actions.
- **Import ALS.3 (hence ALS.1) and the ALS.5/AS.5 characteristic-zero comparison for the rationality suffix. Keep the local highest-weight and cohomological definitions earlier; the repair must not make AS.5 assume the rationality conclusion.**
- The GL_n argument with strong multiplicity one does not prove rationality for arbitrary automorphic representations; keep the group's source hypotheses.

The finding's alternative — move the two cohomological targets to a stage downstream of ALS.5 and keep the algebraic-weight material in AF.4 — is what the verifier describes, so it is taken, as a suffix of AF.4.

### State on main (8ae020f6)
- AF.4: "Define algebraic highest weights, infinitesimal characters and cohomological representations; distinguish C-algebraic and L-algebraic normalizations and record the half-root twist when definable. Construct coefficient systems from algebraic representations with lattices and prove independence of the chosen lattice after inverting its primes. For cohomological cuspidal representations, prove rationality and finite fields of definition under the theorem's exact hypotheses. Torsion Hecke eigenclasses are defined through integral cohomology and are not identified with reductions of every characteristic-zero cusp form."
- AF.4's consumers are AF.5 and AutomorphicGaloisRepresentationsPartII AG2.0.
- RS-12 (revised 29 September as RS-12~3, awaiting review): `owners[13]` "Algebraic automorphic weights, C/L normalization and rational structures in the source-scoped cohomological cases", owner AF.4. RS-21 (unreviewed): `owners[16]` "General automorphic cohomological-weight/rationality package", owner AF.4, and `links[22]` AF.4 → R16.4 for the rational-model comparisons.

### Fix
**1. New stage `AutomorphicFormsOnReductiveGroups:AF.4:rationality`.** Insert after AF.4:

> <a id="stage-AF.4:rationality"></a>
> ### AF.4:rationality. Integral eigenclasses and rationality of cohomological representations
>
> Import the Betti cohomology of X_K with local-system coefficients and its Hecke action from ArithmeticLocallySymmetricSpaces ALS.1 and ALS.3, and the characteristic-zero comparison between cuspidal (𝔤,K)-cohomology and Betti cohomology from ALS.5 (which uses AutomorphicSpectralTheory AS.5).
> - Define torsion Hecke eigenclasses through integral cohomology. They are not identified with reductions of every characteristic-zero cusp form.
> - For cohomological cuspidal representations, prove rationality and finite fields of definition under the source's exact hypotheses. Define the field of rationality through coefficient automorphisms acting on cohomology, then separately prove that a model exists over a finite extension; for GL_n see Harder–Raghuram §2.3, pp. 13–15, where inner cohomology over a large enough E is a semisimple Hecke module with an isotypic decomposition.
>
> The GL_n argument, with its use of strong multiplicity one, does not give rationality for arbitrary groups; keep each group's hypotheses. AS.5 and ALS.5 do not use this stage.

Stage record: `requires` = [AF.4, ALS.3, ALS.5]; no consumer yet (see item 4).

**2. AF.4.** Delete "For cohomological cuspidal representations, prove rationality and finite fields of definition under the theorem's exact hypotheses. Torsion Hecke eigenclasses are defined through integral cohomology and are not identified with reductions of every characteristic-zero cusp form." from AF.4, and add at the end of AF.4: "Integral eigenclasses and rationality are AF.4:rationality's." AF.4 keeps the local definitions and /25's additions.

**3. Edges.** Add AF.4 → AF.4:rationality, ALS.3 → AF.4:rationality and ALS.5 → AF.4:rationality (ALS.1 and AS.5 come through them). Cycle tests: acyclic (ALS.5's closure has no AF.4).

**4. RS corrections (RS).**
- RS-12~3, `owners[13]`: split into "Algebraic automorphic weights and C/L normalization" (owner AF.4) and "Rational structures in the source-scoped cohomological cases" (owner AF.4:rationality).
- RS-21, `owners[16]`: likewise split. `links[22]` (AF.4 → R16.4, rational-model comparisons) should start at AF.4:rationality; on the graph with this report's additions, R16.4 does not reach AF.4:rationality, so that link is acyclic. `links[21]` (AF.4 → R19.1) keeps AF.4 unless its revision names a rationality use.
- AG2.0's current edge from AF.4 stays for the weights and normalizations; if AG2.0 uses the rationality theorem, its blueprint should add AF.4:rationality as a supplier (on today's graph AG2.0 does not reach AF.4:rationality).

### Not done, and why
- No consumer edge is added for the rationality suffix beyond what RS-21 would carry; its consumers are to be named when they are designed.

## /31 (medium, duplicate): one owner for algebraic modular forms on groups compact at infinity

### What the verifier corrected
- AF.5 names the general finite-double-coset dictionary; R18.3 defines its integral definite-quaternion version independently and does not reach AF.5. AUDIT-15's duplicate note and the unreviewed RS-23 leave the boundary unresolved.
- **Give the reusable coefficient function space, Hecke and level-change API one earlier AF owner, or import AF.5's relevant prefix; keep R18.3's class-set and stabilizer computations, Taylor–Wiles freeness, dyadic tests and Jacquet–Langlands identification.** Finiteness of a double-coset set is not freeness of its coefficient module. Moving the owner to AF.2/AF.4 would need an actual split, not a move of all of AF.5.

### State on main (8ae020f6)
- AF.5: "Identify algebraic modular forms on compact-at-infinity groups with functions on finite adelic double cosets valued in an algebraic representation." AF.5 requires AF.3, AF.4, ModularCurvesPartII R12.5 and Tau Ceti ModularCurves/ModularForms layers.
- R18.3's text is quoted in /12. R18.3 requires R16.2 and R18.1.
- AUDIT-15 (merged, and unchanged here by FIX-RT-AUDIT-15) lists AF.5 in R18.3's duplicates: "AF.5 identifies algebraic modular forms on groups compact at infinity with functions on finite adelic double cosets valued in an algebraic representation, which is R18.3's definition for a definite quaternion algebra."
- RS-23 (unreviewed): `layers["HilbertModularVarietiesAndShimuraCurves:R18.3"]` keep, "Keep definite quaternionic forms on actual finite double-coset sets, their coefficient and Hecke operations, and the source-specific integral freeness and dyadic tests."
- **Library.** Tau Ceti's `TauCeti.finite_doubleCosetQuotient` (`TauCeti/GroupTheory/DoubleCoset/Finite.lean:46`) is finiteness of H\G/K for K of finite index, a group-theoretic statement; neither library has algebraic modular forms, adelic double cosets or quaternion orders.

### Fix
**1. New stage `AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms`.** It depends only on AF.4 (hence AA.3), not on AF.5's modular-curve inputs. Insert before "### AF.5. Comparison examples and transport":

> <a id="stage-AF.5:algebraic-forms"></a>
> ### AF.5:algebraic-forms (early). Algebraic modular forms on groups compact at infinity
>
> Let G be connected reductive over F with G(F ⊗ ℝ) compact modulo its centre, K ⊂ G(𝔸_f) compact open, and W an algebraic representation of G with a lattice W_O stable under the p-component of K (AF.4).
> - The O-module M(K, W_O) of algebraic modular forms is the set of functions f : G(F)\G(𝔸_f) → W_O with f(gk) = k_p⁻¹·f(g) for k ∈ K. Over a coefficient field it is identified with the functions f(γgk) = γ·f(g), by f ↦ (g ↦ g_p·f(g)).
> - By AdelicAlgebraicGroups AA.3's finiteness of G(F)\G(𝔸_f)/K, M(K, W_O) ≅ ⊕_i W_O^{Γ_i} over finitely many representatives g_i, where the Γ_i = G(F) ∩ g_iKg_i⁻¹ are finite modulo the centre.
> - Construct the Hecke action of the double cosets KgK and the change-of-level maps (restriction and trace).
>
> Finiteness of the double-coset set is not freeness of the coefficient module over a group ring; freeness is proved by the consumer under its hypotheses.

Stage record: `requires` = [AF.4]; consumers AF.5, HilbertModularVarietiesAndShimuraCurves:R18.3.

**2. AF.5.** Replace "Identify algebraic modular forms on compact-at-infinity groups with functions on finite adelic double cosets valued in an algebraic representation." with "Import algebraic modular forms on compact-at-infinity groups from AF.5:algebraic-forms and compare them with the examples below."

**3. R18.3.** Replace "Define algebraic automorphic forms on the finite double-coset set with their weight module and integral coefficients. Prove finiteness, the Hecke action, change of level and the comparison to the corresponding GL₂ representations." with:
> Import the space of algebraic automorphic forms on the finite double-coset set, with its weight module, integral coefficients, finiteness, Hecke action and change of level, from AutomorphicFormsOnReductiveGroups AF.5:algebraic-forms, and specialize it to the definite quaternion algebra: compute the class set and its stabilisers. Prove the comparison with the corresponding GL₂ representations through GL2AutomorphicRepresentationsAndTransfer R17.3's global Jacquet–Langlands transfer.

The rest of R18.3 (Taylor–Wiles freeness, KW II's dyadic twisting, the freeness caveat) stays. The Dependencies line is in /12.

**4. Edges.** Add AF.4 → AF.5:algebraic-forms, AF.5:algebraic-forms → AF.5 and AF.5:algebraic-forms → R18.3. Cycle tests: acyclic.

**5. RS-23 (RS).** Replace its R18.3 reason with "Keep the definite-quaternion specialization of AutomorphicFormsOnReductiveGroups AF.5:algebraic-forms (class set, stabilizers) and the source-specific integral freeness and dyadic tests; the generic coefficient, Hecke and level-change operations are AF.5:algebraic-forms'." and add the link AF.5:algebraic-forms → R18.3.

**6. Audit note (audit merge).** In AUDIT-15, R18.3's duplicates entry for AF.5 becomes "Supplier: AF.5:algebraic-forms owns algebraic modular forms on groups compact at infinity (RT-AREA-automorphic-1/31); R18.3 imports them and keeps the quaternionic specialization." FIX-RT-AUDIT-15 kept this entry; the change lands with its merge.

### Not done, and why
- Gross's *Algebraic modular forms* (1999) was not read; the definition above is the standard one, to be pinned to a source when the prefix is decomposed.

## The cycle test

Every edge below was added, in this order, to the graph `scripts/build.py` assembles at `8ae020f6` (2840 stages, 7792 edges). Before each addition A → B the test searched for a path B → … → A in the graph with all earlier additions. None exists. After all 76 additions a depth-first search finds no cycle in the 7868-edge graph. The union includes the node-level links (decomposition `links`) that the fixes add.

| # | Source | Target |
|---|---|---|
| /1 | `GL2AutomorphicRepresentationsAndTransfer:R17.4` | `GL2AutomorphicRepresentationsAndTransfer:R17.4a` |
| /1 | `AutomorphicLFunctionsAndLocalFactors:AL.3` | `GL2AutomorphicRepresentationsAndTransfer:R17.4a` |
| /1 | `AutomorphicLFunctionsAndLocalFactors:AL.3b` | `GL2AutomorphicRepresentationsAndTransfer:R17.4a` |
| /1 | `GL2AutomorphicRepresentationsAndTransfer:R17.4a` | `GL2AutomorphicRepresentationsAndTransfer:R17.5` |
| /1 | `AutomorphicLFunctionsAndLocalFactors:AL.3` | `AutomorphicLFunctionsAndLocalFactors:AL.3b` |
| /1 | `AutomorphicLFunctionsAndLocalFactors:AL.3b` | `GL2AutomorphicRepresentationsAndTransfer:R16.5` |
| /1 | `MetaplecticAutomorphicForms:MP.5` | `GL2AutomorphicRepresentationsAndTransfer:R17.4a` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1` | `AutomorphicFormsOnReductiveGroups:AF.1b` |
| /2 | `AutomorphicLFunctionsAndLocalFactors:AL.1` | `AutomorphicFormsOnReductiveGroups:AF.1b` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `AutomorphicFormsOnReductiveGroups:AF.2` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `AutomorphicFormsOnReductiveGroups:AF.4` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `AutomorphicLFunctionsAndLocalFactors:AL.2` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `AutomorphicLFunctionsAndLocalFactors:AL.3` |
| /2 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `EndoscopicTransferAndUnitaryTraceComparison:ET.1` |
| /4 | `AutomorphicFormsOnReductiveGroups:AF.1b` | `AutomorphicFormsOnReductiveGroups:AF.1c` |
| /4 | `AutomorphicFormsOnReductiveGroups:AF.1c` | `EndoscopicTransferAndUnitaryTraceComparison:ET.1` |
| /4 | `AutomorphicFormsOnReductiveGroups:AF.1c` | `AutomorphicSpectralTheory:AS.6` |
| /3 | `NoncommutativeAndEquivariantIwasawa:NE.0` | `CompletedCohomologyPartII:CC.5` |
| /3 | `NoncommutativeAndEquivariantIwasawa:NE.0` | `CompletedCohomologyPartII:CC.5/finite-generation-over-the-iwasawa-algebra-and-the-canonical-topology` |
| /3 | `NoncommutativeAndEquivariantIwasawa:NE.0` | `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` |
| /6 | `AutomorphicFormsOnReductiveGroups:AF.1a` | `ArithmeticLocallySymmetricSpaces:ALS.4` |
| /7 | `ReductiveGroupsPartII:RG2.4` | `ReductiveGroupsPartII:RG2.4:kneser-tits` |
| /7 | `ReductiveGroupsPartII:RG2.4:kneser-tits` | `AdelicAlgebraicGroups:AA.4` |
| /8 | `AutomorphicFormsOnReductiveGroups:AF.3` | `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs` |
| /8 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs` |
| /8 | `AutomorphicLFunctionsAndLocalFactors:AL.1` | `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs` |
| /8 | `AutomorphicLFunctionsAndLocalFactors:AL.3:global-inputs` | `AutomorphicLFunctionsAndLocalFactors:AL.3` |
| /10 | `AutomorphicFormsOnReductiveGroups:AF.3` | `AutomorphicLFunctionsAndLocalFactors:AL.2` |
| /11 | `GL2AutomorphicRepresentationsAndTransfer:R16.4` | `GL2AutomorphicRepresentationsAndTransfer:R17.3` |
| /11 | `GL2AutomorphicRepresentationsAndTransfer:R16.6` | `GL2AutomorphicRepresentationsAndTransfer:R17.5` |
| /12 | `GL2AutomorphicRepresentationsAndTransfer:R17.3` | `HilbertModularVarietiesAndShimuraCurves:R18.3` |
| /13 | `AutomorphicLFunctionsAndLocalFactors:AL.3` | `AutomorphicPadicLFunctions:L1` |
| /14 | `AutomorphicLFunctionsAndLocalFactors:AL.0` | `GL2AutomorphicRepresentationsAndTransfer:R16.1` |
| /15 | `TorsionCohomologyInfrastructure:TC.1` | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` |
| /15 | `CompletedCohomologyPartII:CC.8` | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` |
| /15 | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` | `TorsionCohomologyInfrastructure:TC.2` |
| /15 | `CompletedCohomologyPartII:CC.3/duality-between-completed-homology-and-completed-cohomology` | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` |
| /15 | `CompletedCohomologyPartII:CC.5/codimension-iwasawa-dimension-and-the-torsion-theorem` | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` |
| /15 | `CompletedCohomologyPartII:CC.8/scholze-4-2-convention-and-the-perfectoid-comparison` | `TorsionCohomologyInfrastructure:TC.2:almost-comparison` |
| /17 | `PadicMeasuresIwasawaAlgebras:L0` | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` |
| /17 | `PadicMeasuresIwasawaAlgebras:L1` | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` |
| /17 | `NoncommutativeAndEquivariantIwasawa:NE.0` | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` |
| /17 | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` | `CompletedCohomologyPartII:CC.2` |
| /17 | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` | `CompletedCohomologyPartII:CC.5` |
| /17 | `PadicMeasuresIwasawaAlgebras:L1:banach-representations` | `PadicLocalLanglandsForGL2Qp:R30.2` |
| /18 | `IntegralHeckeAndGaloisDeterminants:IHG.2` | `CompletedCohomologyPartII:CC.8` |
| /19 | `AutomorphicSpectralTheory:AS.2` | `MetaplecticAutomorphicForms:MP.6` |
| /19 | `MetaplecticAutomorphicForms:MP.6` | `GrossZagierAndArithmeticHeights:GZ.5/waldspurger-period-formula-and-its-siegel-weil-proof` |
| /20 | `MetaplecticAutomorphicForms:MP.5` | `MetaplecticAutomorphicForms:MP.6:jacobi` |
| /20 | `MetaplecticAutomorphicForms:MP.6:jacobi` | `MetaplecticAutomorphicForms:MP.7` |
| /20 | `MetaplecticAutomorphicForms:MP.6:jacobi` | `QSeriesPartitionsAndMockModularForms:QM.1` |
| /20 | `MetaplecticAutomorphicForms:MP.6:jacobi` | `AutomorphicCongruences:L2s` |
| /21 | `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category` | `MetaplecticAutomorphicForms:MP.3` |
| /21 | `SmoothRepresentationsOfLocalGroups:SR.2` | `MetaplecticAutomorphicForms:MP.3` |
| /21 | `SmoothRepresentationsOfLocalGroups:SR.3` | `MetaplecticAutomorphicForms:MP.3` |
| /21 | `AutomorphicFormsOnReductiveGroups:AF.1` | `MetaplecticAutomorphicForms:MP.3` |
| /22 | `tauceti:TauCetiRoadmap/QuadraticFormInvariants#6c-the-hilbert-symbol-and-the-local-hasse-invariant` | `MetaplecticAutomorphicForms:MP.2` |
| /23 | `AdelicAlgebraicGroups:AA.3` | `MetaplecticAutomorphicForms:MP.5` |
| /23 | `AutomorphicFormsOnReductiveGroups:AF.3` | `MetaplecticAutomorphicForms:MP.5` |
| /24 | `EndoscopicTransferAndUnitaryTraceComparison:ET.1` | `AutomorphicSpectralTheory:AS.6` |
| /26 | `SmoothRepresentationsOfLocalGroups:SR.4` | `AutomorphicFormsOnReductiveGroups:AF.2` |
| /27 | `SmoothRepresentationsOfLocalGroups:SR.2` | `ArithmeticLocallySymmetricSpaces:ALS.4` |
| /27 | `SmoothRepresentationsOfLocalGroups:SR.4` | `ArithmeticLocallySymmetricSpaces:ALS.4` |
| /28 | `AdelicAlgebraicGroups:AA.1` | `AdelicAlgebraicGroups:AA.4:neat-levels` |
| /28 | `AdelicAlgebraicGroups:AA.3` | `AdelicAlgebraicGroups:AA.4:neat-levels` |
| /28 | `AdelicAlgebraicGroups:AA.4:neat-levels` | `AdelicAlgebraicGroups:AA.4` |
| /28 | `AdelicAlgebraicGroups:AA.4:neat-levels` | `ArithmeticLocallySymmetricSpaces:ALS.0` |
| /28 | `AdelicAlgebraicGroups:AA.4:neat-levels` | `ShimuraData:D5` |
| /28 | `AdelicAlgebraicGroups:AA.4:neat-levels` | `ShimuraVarieties:V0` |
| /29 | `AutomorphicFormsOnReductiveGroups:AF.1a` | `AutomorphicFormsOnReductiveGroups:AF.1` |
| /30 | `AutomorphicFormsOnReductiveGroups:AF.4` | `AutomorphicFormsOnReductiveGroups:AF.4:rationality` |
| /30 | `ArithmeticLocallySymmetricSpaces:ALS.3` | `AutomorphicFormsOnReductiveGroups:AF.4:rationality` |
| /30 | `ArithmeticLocallySymmetricSpaces:ALS.5` | `AutomorphicFormsOnReductiveGroups:AF.4:rationality` |
| /31 | `AutomorphicFormsOnReductiveGroups:AF.4` | `AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms` |
| /31 | `AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms` | `AutomorphicFormsOnReductiveGroups:AF.5` |
| /31 | `AutomorphicFormsOnReductiveGroups:AF.5:algebraic-forms` | `HilbertModularVarietiesAndShimuraCurves:R18.3` |

Two further links were tested on the final graph and are not added here, because they belong to unreviewed proposals: RS-04's AA.4 → ShimuraVarieties:V0 (/7) and RS-21's link re-sourced as AF.4:rationality → R16.4 (/30). Both would be acyclic.

## Sources read

All were fetched and read on 29 September 2026. Pages are printed pages; they equal PDF pages except in Cogdell's notes (printed = PDF − 4) and Tunnell (PDF 1–3). SHA-256 prefixes are of the file read.

| Source | Version and URL | Pages read | SHA-256 |
|---|---|---|---|
| J. Tunnell, Artin's conjecture for representations of octahedral type, Bull. AMS 5 (1981) 173–175 | https://www.ams.org/journals/bull/1981-05-02/S0273-0979-1981-14936-3/S0273-0979-1981-14936-3.pdf | 173–175 | `fc276270d09ea11b…` |
| S. Gelbart, H. Jacquet, A relation between automorphic representations of GL(2) and GL(3), Ann. Sci. ÉNS 11 (1978) 471–542 | numdam, http://www.numdam.org/item/ASENS_1978_4_11_4_471_0.pdf | 471–474 (introduction), 534–535 (Theorem 9.3) | `319347503f91fe22…` |
| J. W. Cogdell, Lectures on L-functions, converse theorems, and functoriality for GL_n (Fields Institute lecture notes) | https://people.math.osu.edu/cogdell.1/fields-www.pdf | 30–34, 41–42, 61–62, 74, 77–79 | `2c5ec050a6db216d…` |
| A. W. Knapp, Local Langlands correspondence: the Archimedean case, Proc. Sympos. Pure Math. 55, Part 2 (1994) 393–410 | https://www.math.stonybrook.edu/~aknapp/pdf-files/archimedean.pdf (scan; read on page images) | 393–395, 399–406 | `684de4bcfc50e448…` |
| G. Harder, A. Raghuram, Eisenstein cohomology for GL(N) and ratios of critical values of Rankin–Selberg L-functions | arXiv:1405.6513v2 (28 June 2015), https://arxiv.org/pdf/1405.6513 | 8, 11–12, 14–19, 25–28 | `1d3af2de1c1a370d…` |
| J. Arthur, An introduction to the trace formula, Clay Math. Proc. 4 (2005) | https://www.claymath.org/library/cw/arthur/pdf/62.pdf | 3, 11, 64–66, 89, 102–104, 118–119, 135–136, 145–147, 259 | `2b6623010ce5d854…` |
| J. Bernstein, B. Krötz, Smooth Fréchet globalizations of Harish-Chandra modules, Israel J. Math. 199 (2014) | arXiv:0812.1684v3 (16 April 2013), https://arxiv.org/pdf/0812.1684v3 | 2–4, 20–24, 40–41 | `f5f2e79d87532c9a…` |
| A. S. Rapinchuk, On strong approximation for algebraic groups | arXiv:1207.4425v1, https://arxiv.org/pdf/1207.4425 | 7, 11–13, 16–17 | `43f6a45ceb9e51e1…` |
| P. Schneider, J. Teitelbaum, Banach space representations and Iwasawa theory (Israel J. Math. 127 (2002)) | arXiv:math/0005066v1, https://arxiv.org/pdf/math/0005066v1 | 1–16 | `28dfe78dc1fcbe90…` |
| O. Venjakob, On the structure theory of the Iwasawa algebra of a p-adic Lie group (J. Eur. Math. Soc. 4 (2002)) | author preprint (3 May 2001), https://www.mathi.uni-heidelberg.de/~venjakob/papervenjakob/auslander.pdf | 1–2, 5–6, 10, 18–19 | `a0b4d2f06dad2c4b…` |
| K. Ardakov, K. A. Brown, Ring-theoretic properties of Iwasawa algebras: a survey | arXiv:math/0511345v1, https://arxiv.org/pdf/math/0511345 | 1–4, 8–9, 12–15 | `a665d599485fdbf3…` |
| T. Gee, J. Newton, Patching and the completed homology of locally symmetric spaces | arXiv:1609.06965v5 (18 November 2019), https://arxiv.org/pdf/1609.06965 | 2, 7, 9–11, 14, 16, 18–19, 22–24 | `068818a4b0e12f97…` |
| P. Scholze, On torsion in the cohomology of locally symmetric varieties | arXiv:1306.2070v2 (2 June 2015), https://arxiv.org/pdf/1306.2070v2 | 28, 67–72 | `e15abf4e7ab3e400…` |
| J. S. Milne, Introduction to Shimura varieties (revised 16 September 2017) | https://www.jmilne.org/math/xnotes/svi.pdf | 34–35, 57–58, 94 | `f637e61735ff9cf9…` |
| W. T. Gan, Y. Qiu, S. Takeda, The regularized Siegel–Weil formula (second term identity) and the Rallis inner product formula | arXiv:1207.4709v3 (21 January 2014), https://arxiv.org/pdf/1207.4709v3 | 1–9, 14–18 | `cde6b7ad22b974d4…` |
| M. Goffeng, B. Mesland, M. H. Şengün, Adelic C*-correspondences and parabolic induction | arXiv:2412.02379v2 (9 January 2026), https://arxiv.org/pdf/2412.02379v2 | 1–8 | `3ad9ef632061d632…` |
| S. Kudla, Notes on the local theta correspondence (1996) | https://www.math.toronto.edu/skudla/castle.pdf | 1–2, 32–34, 43–45, 48, 56–58, 70 | `800ed01b22fa6104…` |
| D. Vogan, G. Zuckerman, Unitary representations with nonzero cohomology, Compositio Math. 53 (1984) 51–90 | numdam, http://www.numdam.org/item/CM_1984__53_1_51_0.pdf (theorem statements only; displays lost in extraction) | 51–56, Theorems 3.3, 4.1, 5.6 | `ccaaf5ad243ccb85…` |
| M. Emerton, On the interpolation of systems of eigenvalues attached to automorphic Hecke eigenforms (Invent. Math. 164 (2006)) | draft of 2 January 2006, https://www.math.uchicago.edu/~emerton/pdffiles/interpolate.pdf | 1–3, 8–13 | `8bde4c0c13ddf91e…` |
| Mathlib at `082e2d3` | pinned tree | `Analysis/SpecialFunctions/Gamma/Deligne.lean:45–124`; `Algebra/Lie/Cochain.lean:40–155`; `NumberTheory/ModularForms/JacobiTheta/OneVariable.lean:29–45`; `Analysis/MellinTransform.lean:91`; `Analysis/Fourier/PoissonSummation.lean:219`; `GroupTheory/GroupAction/Iwasawa.lean:82`; `NumberTheory/Padics/Measure/Basic.lean:43`; `NumberTheory/ModularForms/ArithmeticSubgroups.lean:102`; `RingTheory/Artinian/Module.lean:625`; `RepresentationTheory/Continuous/Basic.lean:54` | — |
| Tau Ceti at `f790474` | pinned tree | `LinearAlgebra/RootSystem/Weyl/Vector.lean:85–175`; `Weyl/DotAction.lean:108`; `GroupTheory/TitsSystem/Basic.lean:48`; `FieldTheory/FunctionField/Consequences/StrongApproximation.lean:88`; `LinearAlgebra/Matrix/SpecialLinearGroup/Basic.lean:428`; `Topology/Algebra/Group/Profinite/ProP/Basic.lean:53`; `NumberTheory/HeckeRing/Commutativity.lean:478`; `NumberTheory/ModularForms/Newforms/{StrongMultiplicityOne.lean:87, MultiplicityOne.lean:175}`; `GroupTheory/DoubleCoset/Finite.lean:46`; `Algebra/BrauerGroup/Real.lean:102`; `RepresentationTheory/Continuous/Unitary/Basic.lean:52` | — |

**Library searches that found nothing** (both trees and `declarations.tsv`): GL(3), symmetric-square or adjoint lifts, converse theorems, automorphic induction; Weil groups of ℝ and ℂ, (𝔤,K)-modules, discrete series, Casselman–Wallach; Lazard, uniform groups, Iwasawa algebras of nonabelian p-adic Lie groups, Auslander regularity; Banach representations of p-adic groups, Schikhof duality; Paley–Wiener theorems, orbital integrals, intertwining operators, pseudo-Eisenstein series; Kostant's theorem, Lie algebra cohomology in all degrees, van Est or Nomizu; Kneser–Tits, Tits simplicity; Whittaker functions, Schwartz–Bruhat functions, adelic Poisson summation; Siegel–Weil, the Weil representation, metaplectic groups, Jacobi forms; `hilbertSymbol`, `localHasse`; neat subgroups; Satake transforms, Gelfand pairs, Flath's theorem; completed Hecke algebras; algebraic modular forms and quaternion orders; A_𝔮(λ), Wigner's lemma; Jacquet–Langlands and automorphic base change.

**Not obtained or not read.** The JPSS note of 1981, Tate's Corvallis article (paywalled), the Yuan–Zhang–Zhang book and draft (every public URL tried returned 404), Clozel–Delorme, Bernstein–Deligne–Kazhdan, Arthur's [A9] and [A15], Platonov, Tits, Lazard, Dixon–du Sautoy–Mann–Segal, Borel 1969, Borel–Wallach, Kostant, Delorme, Flath, Kudla–Rallis, Eichler–Zagier, Gross 1999, and Emerton's *Memoirs*. What rests on them is marked in each section as a source obligation or as the verifier's reading.
