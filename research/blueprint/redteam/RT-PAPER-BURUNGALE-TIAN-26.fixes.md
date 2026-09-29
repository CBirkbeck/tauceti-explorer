# RT-PAPER-BURUNGALE-TIAN-26: fixes

Fixer: Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #3973, job FIX-RT-PAPER-BURUNGALE-TIAN-26).
- Findings: `RT-PAPER-BURUNGALE-TIAN-26.result.json`.
- Verdicts: `RT-PAPER-BURUNGALE-TIAN-26.review.json`. All 28 findings were confirmed.
- 27 are applied. Finding 25 is left to the maintainer, since it asks for a convention.
- Files changed:
  - `papers/PAPER-BURUNGALE-TIAN-26.result.json` and `.md`;
  - `errata/PAPER-BURUNGALE-TIAN-26.json`. Its companion `errata/PAPER-BURUNGALE-TIAN-26.md` is not a deliverable of this job, so the prose for E16–E19 is under "Errata report text for the maintainer" below.
  - route 5 of `papers/PAPER-BURUNGALE-KOBAYASHI-OTA-21.result.json`;
  - route 8 of `papers/PAPER-CASTELLA-ETAL-22.result.json`.
- `PAPER-KOYMANS-PAGANO.result.json` needs no change: the new route 9 copies its Smith-method Part II's id, title and area, so the two coalesce.
- The extraction now has 118 items (4 library, 56 planned, 58 missing) and 9 routes.
- Checks:
  - `scripts/check_paper.py` passes on the three changed result files.
  - `scripts/check_errata.py` passes on the errata file.
  - `scripts/errata.py` runs. Its regenerated register is left to the bot that maintains it.
- This session reviewed the extraction (REV-PAPER-BURUNGALE-TIAN-26) and wrote the errata record. The fix job has no independence restriction. The additions follow the verified findings' own text; the paper itself was not reread.

## /1 (high, error): fixed

Added `cm-h2-torsion` (theorem, missing, route 7, before `cm-zeta-bridge`) with Kato 15.15's proof outline. `modular-h2-torsion`'s note now restricts its planned L4 status to non-CM f. The notes of `modular-h1-free`, `bk-map`, `zeta-conjugation`, `bk-cotorsion` and `cm-zeta-bridge` say how the CM case follows from `cm-h2-torsion`, including K ⊂ Q(μ_{p∞}). Route 7's brief asks for the CM case of Kato 12.4 in the elliptic-unit layer; route 1's reason and the report's route table row 1 say L4 does not cover CM f.

## /2 (high, missing): fixed

Route 7's brief now owns the integral two-variable elliptic-unit main conjecture in an integral layer (JLK Theorem 5.2 as printed, JLK §5.4 = Rubin 1991 (i), and for p split the Coleman-map/Katz form, Rubin 1991 (ii), with Castella's θ-components), after the early elliptic-unit layer and before the rational equivariant layers. It names its consumers and forbids dependence on MIMC L6 and BSD.7a; the sentence saying the integral equality is not an output is deleted, and the elliptic-unit layer is owned here rather than by whichever design comes first. In PAPER-CASTELLA-ETAL-22 route 8, the brief now adds to that integral layer instead of claiming the BT brief "already asks for" it, and the reason no longer says the BT review accepted a single owner. In PAPER-BURUNGALE-KOBAYASHI-OTA-21 route 5, CMAllPrimeMainConjectures is a prerequisite and the supplier is "imported from CMAllPrimeMainConjectures' integral layer".

## /3 (medium, missing): fixed

Added `cm-realization` (construction, route 7; Kato 15.8), `cm-galois-induction` (theorem, routed once, to route 6 as a source item for CM.4, with the DL-17/hecke-cm-forms coordination in its note), `cm-comparison-map` (construction, route 7; Kato (15.12.1)) and `cm-curve-hecke-character` (construction, planned CM.4, named in route 6). The notes of `cm-zeta-bridge`, `cm-descent`, `equality-descent`, `cm-kato-main`, `cm-elliptic-factorization` and `cm-selmer-comparison` cite them. Route 7's brief asks for the three constructions explicitly in place of "twisting, induction"; route 8's brief imports the k=2 case of `cm-galois-induction`. Ribet (LNM 601), Kato's [Ri2], is added to the prerequisites. The `cm-zeta-bridge` parenthetical is rewritten under finding 5.

## /4 (medium, missing): fixed

Added `ray-coefficient-iwasawa-cohomology` (construction, route 7; Kato 15.6) and `twisted-equivariant-equality` (theorem, route 7; Kato 15.15 and the proof of Prop. 15.17), with the twisting isomorphism, the rank-one statement and the height-one length equality, and the Euler-term argument in its note. `cm-descent` now writes H^q_{p∞f}(T) and cites the new construction; `equality-descent` cites the new theorem for its hypothesis; `cm-kato-main`'s note names it in place of "equivariant-main on the ψ-components".

## /5 (medium, missing): fixed

Added `cm-elliptic-reciprocity` (theorem, route 7; Kato Prop. 15.9 and (15.12.2)) with its two-part proof and the note that BKO's `elliptic-reciprocity` is its r=1 case. `cm-zeta-bridge`, `equality-descent` and `cm-h2-torsion` cite it. `cm-zeta-bridge`'s parenthetical now says (15.12.1) uses (15.11.2), Kato's standing identification, and that (15.11.3) only defines γ′. Kato's *Generalized explicit reciprocity laws* (1999) is added to the prerequisites; no stable link was fetched, so its link field is empty. Route 7's brief limits the KatoEulerSystems import to the modular-curve reciprocity law and puts Prop. 15.9 in the shared early elliptic-unit layer.

## /6 (medium, missing): fixed

Added `cm-characterization` (theorem, route 7, before `cm-kato-main`): self-twist (Layer 9) ⇔ Kato's L-function CM ⇔ induced from an algebraic Hecke character, with χ = ε_K and the conductor relation. `cm-newform` keeps the induced-form definition, drops "in Kato's convention", has the locator the fix gives, and its note says R17.5/R16.6 plan only ψ ↦ f. Route 7 was chosen over a new GL2AutomorphicRepresentationsAndTransfer source route because the extraction has no route to that roadmap.

## /7 (medium, error): fixed

`central-nonvanishing` is now missing with planned [], moved from route 1 to route 8 next to `nonfinite-localization`, with the statement and step list the fix gives. Added `central-hg-equals-hf` (theorem, missing, route 8) and `kato-frobenius-weights` (planned R19.5, R19.3). Route 8's brief inserts the H¹_g = H¹_f step, widens the import to R19.1/R19.3/R19.5, and names PadicHodgeRegulators L1 for ker exp* and the dimension formula. The step is recorded as E16 (gap, affects nothing) in errata/PAPER-BURUNGALE-TIAN-26.json. The counts are recomputed at the end.

## /8 (medium, missing): fixed

Added `kato-duality-sequence` (planned R02.4, D7, PadicHodgeRegulators L1), `global-euler-characteristic` (planned R02.3), `local-euler-characteristic` (planned CFT layer 5, R02.1), `modular-h0-vanishing` (missing, route 8) and `modular-local-cohomology` (missing, route 1 as a KatoEulerSystems L4 source addition). The fix's item (b) is split into the global and local formulas so that each has its own planned owner. `global-dimension` is restated as the fix gives; `selmer-zero-h2`'s note lists its inputs; route 8's brief names the two new missing items.

## /9 (medium, missing): fixed

Added `iwasawa-specialization` (theorem, planned SelmerIwasawaCohomology:L3, PadicMeasuresIwasawaAlgebras:L5, IntegralIwasawaTheory:I.4), named in route 2. `zeta-basis`'s note cites its injectivity; `localized-h2-zero` refers to it; the sentence "Equation (3.2) factors through …" is deleted from `central-prime`; route 8's brief imports the control comparison.

## /10 (medium, missing): fixed

Added `twist-descent-thin` (theorem, missing, route 8). `nondescent-density` is restated as the fix gives, with its derivation in the note; route 8's brief names `twist-descent-thin` as the counting input. The gap in Remark 3.6(ii) is recorded as E17 in the errata record (E16 is finding 7's). The `printed` field paraphrases the remark rather than quoting it, because the paper was not reopened for this fix.

## /11 (medium, missing): fixed

Added `goldfeld-conjecture` (definition) and `goldfeld-fundamental` (theorem), both missing and in route 8, with the fix's statements and notes; route 8's brief asks for both, and `goldfeld`'s note points to the fundamental-discriminant form. `tauceti:TauCeti.Multiquadratic.IsFundamentalDiscriminant` is named in a note only, not cited as a library status.

## /12 (medium, error): fixed

`etale-iwasawa` keeps ModularIwasawaMainConjectures:L0 and SelmerIwasawaCohomology:L3 and gains SelmerIwasawaCohomology:L2. Added `jstar-selmer-comparison` (theorem, missing, route 2) identifying Kato's j_* cohomology with the unramified Selmer complex; `etale-iwasawa`'s note cites it, and route 2's reason no longer implies SelmerIwasawaCohomology owns j_*. Maintainer note: ModularIwasawaMainConjectures L0's "extension-by-zero" should read "Kato's j_* convention (Kato 8.2, 12.2): unramified conditions at primes away from p"; the atlas stage text is not edited here.

## /13 (medium, duplicate): fixed

`smith-density` leaves route 3 for a new route 9, part-ii of ArithmeticStatistics, `ArithmeticStatisticsPartIISmithMethod`, whose id, title and area match PAPER-KOYMANS-PAGANO's route 1 so that make_queue folds them. Its brief states Smith I Thm 1.2, Smith II Thm 2.14 and BT Theorem 3.3 exactly, plans the Selmer and combinatorics layers, and requires the shared general forms to be planned once. Route 3's reason drops the Smith sentences. Route 8 gains the Part II as a prerequisite and imports Theorem 3.3 from it. The Smith I/II prerequisites' "why" now names the Part II. The report's route table gains row 9.

## /14 (medium, missing): fixed

Added `congruent-2-parity` (theorem, missing, route 2) with the Monsky source and the family-specific alternative in its note; Monsky's paper is added to the prerequisites (citation and link copied from PAPER-CASTELLA-ETAL-22's entry); route 2's reason records the addition; `smith-density`'s note cites `congruent-2-parity` and `congruent-root-number`. Maintainer note: Selmer p-parity for E/Q is split across CASTELLA-ETAL-22/35 (odd p, RankOneConverse), SKINNER-20/18 (odd p, SelmerIwasawaCohomology L4) and this item (p = 2); it should get one all-p owner. BHARGAVA-GROSS-WANG-17/53, /55 and /56 at ST.4 are Brauer-relation inputs, not this statement.

## /15 (medium, error): fixed

`cm-self-twist` is restricted to the isogeny E → E^K and the Tate-module isomorphism; the Selmer-corank equality moved to `cm-corank-double` (route 8) with its proof sketch. Route 6's reason names EllipticCurves Layer 5 for the twist, and route 8's brief takes only Selmer groups and Kummer sequences from Layer 7.

## /16 (medium, error): fixed

Route 3's reason now lists the CM inputs `bklos-density` imports from CM.1 and EllipticCurves Layer 1, names the import of potential good reduction, and records that no cycle arises. CM.4 is not added. The fix's presentation-only clarification is not applied.

## /17 (low, missing): fixed

`rational-characteristic` is restated for Λ=O[[Z_p^d×Δ]] with its three instances and the height-one length definition of ξ, and has the new locator; planned PadicMeasuresIwasawaAlgebras:L4 is kept. `kato-conjecture` keeps its notation (the fix marks that change as a matter of taste).

## /18 (low, error): fixed

`congruent-curve`'s locator is replaced as the fix gives.

## /19 (low, error): fixed

`ray-iwasawa-ring`'s note is replaced as the fix gives.

## /20 (low, missing): fixed

Added `newform-l-function` (definition, library) and `hecke-l-function` (definition, planned AL.1, AN.4), cited from the five notes the fix names. The library citations were checked in the pinned declaration index. `mathlib:ModularForm.L` is not cited: the index lists that declaration only under the bare name `L` in Mathlib/NumberTheory/ModularForms/LFunction.lean, so its `CuspForm.hasSum_L` and `CuspForm.differentiable_L` are cited instead.

## /21 (low, missing): fixed

Added `quadratic-l-factorization` (planned BSD.0) and `quadratic-selmer-descent` (planned BSD.1, SelmerIwasawaCohomology:L2), cited from `cm-order-double` and `cm-corank-double`. They are not added to route 5.

## /22 (low, error): fixed

`analytic-rank` cites `mathlib:WeierstrassCurve.LFunction` and `WeierstrassCurve.LSeries` (checked in the pinned index), with the fix's caveats in its note; its planned claim is restricted to E/Q and quadratic base change. The fix's alternative to splitting the item is taken: `cm-elliptic-factorization` now concludes the continuation and the order identity for CM E/K, and its note fixes the formal statement and Mathlib's local-factor convention.

## /23 (low, error): fixed

`strict-selmer` is planned at SelmerIwasawaCohomology L2 and L3 (replacing ModularIwasawaMainConjectures:L0). `kato-conjecture` keeps MIMC L0, with the note the fix gives.

## /24 (low, error): fixed

`ray-iwasawa-ring` is planned also at ProfiniteProPGroups Layer 9 (the Z_p carrier), with PMIA L1/L4 kept for coefficient change, rationalization and divisors; its note (which finding 19 had replaced) now says so. Route 7's brief names the Layer 9 import next to PMIA.

## /25 (low, other): not applied (maintainer decision)

Not applied: the fix asks the maintainer to choose between the literal title rule and a base-title convention for Part IIs of RS-extended parents. Route 8's `title` is unchanged; under either choice its import clause now carries the parent's current title (finding 26), and the report says the title waits on that convention. Maintainer note: state the convention in PROTOCOL §15/§16 and apply it together to route 8, the RankOneConverse routes (SKINNER-20 route 1, CASTELLA-ETAL-22 route 9, SKINNER_BRIEF) and the other part-ii routes whose parents RS proposals retitled, before their DESIGN jobs are queued.

## /26 (low, other): fixed

The import paragraphs of routes 7 and 8 use the RS titles, with the ids unchanged. Route 7's prerequisites gain AutomorphicPadicLFunctions, GlobalNumberFields and ClassFieldTheory; route 8's gain ModularForms and EllipticCurves. Route 8's `title` and Design sentence are left to finding 25.

## /27 (low, other): fixed

Route 8's reason and the last paragraph of its brief describe RankOneConverse as the owner of the non-CM converses in ranks 0 and 1, with disjoint hypotheses, and say which statements are instances of `p-converse-property`. The accepted review is not edited; the report notes that its suggested rename is superseded.

## /28 (low, missing): fixed

Appended the two entries to errata/PAPER-BURUNGALE-TIAN-26.json as E18 (the uncited Alpöge–Bhargava–Shnidman result; arXiv:2210.10730 checked) and E19 (the Annals online abstract), since E16 and E17 were already taken by findings 7 and 10; added the searched line to E12; wrote prose for all four new entries in the section "Errata report text for the maintainer" below.

## check_errata

check_errata.py failed on origin/main's errata file already: E1 quotes a stated result and the file had no `sourceVersions`. It now lists arXiv v2 (the hash is copied from the extraction's source record) and v1. It lists no published version, because the typeset Annals article was not read.

## Maintainer notes

- **/12.** ModularIwasawaMainConjectures L0's "extension-by-zero" should read "Kato's j_* convention (Kato 8.2, 12.2): unramified conditions at primes away from p". Atlas stage text is not edited by this job.
- **/14.** Selmer p-parity for E/Q has three owners:
  - CASTELLA-ETAL-22/35 (odd p, RankOneConverse);
  - SKINNER-20/18 (odd p, SelmerIwasawaCohomology L4);
  - `congruent-2-parity` here (p = 2).

  It should get one owner for all p.
- **/25.** Choose a convention for the title of a Part II whose parent an RS extension retitled. Then apply it together to BT route 8, the RankOneConverse routes, and the other affected part-ii routes, before their design jobs are queued.
- **/16.** The owner of the potential-good-reduction input (Rubin 5.22, used by BKLOS Theorem 11.2) was not identified. Route 3's reason names it only as an import.

## Errata report text for the maintainer

`errata/PAPER-BURUNGALE-TIAN-26.md` is not a deliverable of this job, and the intake refused a change to it. The following sections belong before its "Not recorded" section:

> ## Added by FIX-RT-PAPER-BURUNGALE-TIAN-26
>
> The red team RT-PAPER-BURUNGALE-TIAN-26 found four more points, confirmed by its review. The fix numbers them E16–E19.
>
> ## E16. exp* injectivity at the centre (gap; affects nothing)
>
> The last paragraph of the proof of Theorem 3.1 infers ord_{s=k/2}L(s,f)=0 from (3.3) and Kato's reciprocity law. This also needs H¹_g = H¹_f at the centre, so that exp* is injective on H¹/H¹_f. It holds for every p by Kato (14.10.4)–(14.10.5) and Bloch–Kato Cor. 3.8.4; Kato Lemma 14.18 covers only p∤N, p>k.
>
> ## E17. Remark 3.6(ii) (gap; affects nothing)
>
> The first sentence is asserted without proof, and "positive proportion" read over all twists does not give the second. What is needed, and true, is that descending twists have density zero (item `twist-descent-thin`).
>
> ## E18. The sum-of-two-cubes result is uncited (misprint; affects nothing)
>
> §1.0.3 attributes the result to "Alpoge–Bhargava–Shnidman" without a reference. The name is Alpöge, and the source is arXiv:2210.10730, *Integers expressible as the sum of two rational cubes*, whose appendix by Burungale and Skinner proves the rank-one 2-converse.
>
> ## E19. The journal's online abstract (misprint; affects nothing)
>
> The abstract on the Annals article page reads "… = 0 and the for the p^∞-Selmer group"; "and the" should be deleted. It is not in arXiv v1 or v2. The typeset article was not read.
