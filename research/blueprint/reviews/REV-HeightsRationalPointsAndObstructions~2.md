# Independent review, round 2: Heights, rational points and obstructions

Issue: #9682 (`REV-HeightsRationalPointsAndObstructions~2`). Reviewer: Claude (Opus 5.5), session `claude-5DRN1U`, with one Sonnet helper for the mechanical baseline cross-check. Date: 2026-10-14. This session did none of `BP-HeightsRationalPointsAndObstructions` (sessions codex-hjdg0j, cc-fb70e5, claude-J5kQOo), its first review (codex-SJl6ia) or revision round 2 (codex-gubGNh).

**Verdict: accepted.** Revision round 2 made every correction the first review asked for. The three targets that review could not verify now rest on primary sources that I re-read in public, hashed copies. The reader matches the packet field by field. The corrections I made in place are listed below: one provenance problem, four baseline descriptions, two source-issue entries, a handful of locators and cross-references, two API items and two restructuring proposals. None of them is a gap or error that would send the plan back. All seven stages remain `planned`, with 17 recorded gaps and 39 precise requests, as a completed target-level pass (PROTOCOL §0).

## Counts

| Item | Result |
| --- | --- |
| Nodes reviewed | 147 / 147: 141 verified, 6 corrected, 0 added, 0 unverifiable |
| Kinds | 26 definitions, 25 constructions, 22 lemmas, 66 theorems, 7 applications, 1 comparison |
| API items (checker count) / unit tests / planets | 302 (two added) / 216 / 36 |
| Baseline declarations | 103 / 103 confirmed at the pins; 4 descriptions corrected |
| Sources / version records | 32 / 23 |
| Requests / gaps | 39 / 17 (unchanged) |
| Source issues | 11 / 11 confirmed; E10 locator and E11 check corrected |
| Restructure proposals | 7 (sub-layer proposal restated; one added) |
| `check_blueprint.py` | 0 errors, 0 warnings |
| Suggested Lean (933 lines) | `lean-check` exit 0; 98 warnings, all `declaration uses sorry`; `check_sorry_data.py` passes |

## What round 2 had to do, and whether it did

The first review (`REV-HeightsRationalPointsAndObstructions`) withheld acceptance for two reasons. Three targets could not be verified from a permitted source, and the reader lagged behind the packet.

1. **`RP.0/local-weil-functions`: verified.** It now rests on two new targets, `RP.0/bounded-point-metrics` and `RP.0/canonical-point-metrics`, taken from Gubler's habilitation (author copy, SHA-256 `75bbf9b4…`; printed page = PDF page − 1). I checked them against §5.1.2 (p.96), Theorem 5.1.13 and its proof (pp.100–101), Examples 5.1.14–15, §5.2.15–18 (pp.108–109), Theorem 5.3.13 with Remark 5.3.14 (p.114) and §5.3.20–24 (pp.117–119). I recomputed by hand:
   - the rescaling exponent: changing θ to αθ multiplies the metric by |α|^{−1/(q−1)}, Gubler's |α|^{1/(n−m)} with n=1, m=q;
   - the contraction factor 1/q and the geometric error bound;
   - the q=4 local shift (1/3)log|α|_v;
   - the section identity λ̂(2P)=qλ̂(P)−log|a_D(P)|.

   The elliptic normalization rests on Müller–Stoll (author copy, `778d14c7…`), whose Remark 3.1 on p.4 gives λ^MS=2λ^Sil+(1/6)log|Δ|. From their §3 definitions I derived λ^MS(2Q)=4λ^MS(Q)−2log|ψ₂(Q)|. Hence ν=λ^MS/2 satisfies ν(2P)=4ν(P)−log|ψ₂(P)| and ν+log|t|→0, and Silverman's function picks up the extra (1/4)log|Δ|, exactly as the node and its test say.

   The packet's use of the genuine isomorphism L²≅L⁺⊗L⁻ is a sound refinement of Gubler's even/odd splitting. That splitting is unique only up to 2-torsion and need not exist over K.

   Tau Ceti's `canonicalHeight` at the pin is (1/2)·lim h_x(2ⁿP)/4ⁿ with relative heights. It is therefore the (O)-height, as the compatibility tests state.
2. **`RP.1/reduction-torsion-injective`: verified.** I read the Katz appendix in the author-hosted scan (`eb651da4…`): the setup is on p.501, and the Lemma and Lemma′ with their log/exp proof for e_𝔭<p−1 are on p.502. The new target `RP.1/formal-logarithm-small-ball` is correct, and I checked its estimates:
   - closedness of the invariant differentials gives n·c_α∈O for |α|=n, hence ord(c_α)≥−e·ord_p(n);
   - with ord_p(n)≤(n−1)/(p−1) and an integer r>e/(p−1), (n−1)r−e·ord_p(n)≥1, so log−id contracts by |π| on (𝔪^r)^g;
   - the witnesses ζ_p−1 over ℚ_p(ζ_p) and −2 over ℚ₂ show that the strict inequality is needed.
3. **`RP.1/local-division-index`: corrected, then verified.** The revision cites Mattuck from `people.dm.unipi.it/lombardo/…/Mat55.pdf`. That file is a personal JSTOR download (stable URL jstor.org/stable/2007101, carrying JSTOR's download footer) re-hosted on a third-party course page. It is not an author or publisher copy, so I did not rely on it. The node now obtains its open subgroup U≅(O_F^g,+) as follows:
   - U is the level-𝔪^r reduction kernel of the Néron model, for an integer r>e/(p−1);
   - the requested `NeronModelsAndSemistableAbelianVarieties:R11.1` interface identifies U with formal-group points;
   - `formal-logarithm-small-ball` then makes U additive;
   - U has finite index because 𝒩(O_F/𝔪^r) is finite.

   Katz's proof of Lemma′ (p.502) is added as the source for that identification. Mattuck stays as a bibliographic citation with its JSTOR stable URL. Its version record keeps the hash, with a note that the copy is not relied on. The rest of the node is correct. The snake sequence gives #G/2G=#G[2]·#U/2U without a splitting, and I recomputed its checks: the 2^{3g} factor, 16 rather than 8 over the unramified quadratic extension of ℚ₂, and the real component counts.
4. **Reader.** A script compared every node's title, statement, hypotheses, proof steps, acceptance checks, tests, API items, prerequisites, source locators and matches, and planet, with every request, gap and source correction, against the reader. Zero mismatches before and after my edits. My edits were mirrored into the same sections.

The fourth node round 2 touched, `RP.4/mordell-faltings`, changed only its title. The unconditional declaration still rests on `RP.5/vojta-bombieri-mordell`, and the Parshin route stays conditional.

## Corrections made in this review

All edits were applied by one rerunnable script from the committed files, and every reader change mirrors a packet change.

| Where | Change |
| --- | --- |
| `sources[mattuck-1955]`, its version record, `RP.1/local-division-index` (statement, step 1, sources), the Mattuck source line of `RP.1/formal-logarithm-small-ball`, the gap "Smooth-group formal-completion and local-chart interfaces", RP.1 introduction (reader) | Mattuck becomes bibliographic (JSTOR stable URL). The open subgroup comes from the Néron model and the formal logarithm. Katz p.502 is added as a source. |
| `RP.3/relative-algebraic-brauer`, proof step 3 | Harpaz–Wittenberg's exact sequence is display (2.4) on p.9, not (2.2), which is the inclusion of Théorème 2.1. |
| `RP.3/edge-map-twist-independence`, locator | Proposition 2.3 and Lemma 2.4 are on author-copy p.9, with the proof continuing on p.10 (was "Lemma 2.4 …, p.10"). |
| `RP.5/uniform-manin-mumford`, `RP.5/coset-free-hypersurface-sections`, `RP.1/function-field-neron-tate-kernel` | "Misprint E1", "misprint E17" and the unnamed Gao–Habegger §1 misprint now cite `PAPER-GAO-HABEGGER-19/E1`, `/E17` and `/E18`. This packet's own E1 is a de Jong entry, and it has no E17. |
| `RP.0/bounded-point-metrics`, API | Added `PointHeightMetricFamily.ofGenerators` (the sup metric of a finitely generated bundle, which the statement and tests use) and `dist_ofGenerators_le` (summable distance between two presentations). |
| Four `baseline.declarations` descriptions | See the next section. |
| `sourceIssues` E10, E11 | See the source-issue table. |
| `summary` | Restated as mathematical prose about what the packet plans. It previously narrated the revision process. |
| `sourceVersions` kinds | Three records used "author-copy" or "author manuscript"; they now use "author copy", the form the errata collector accepts. |
| `restructure` sub-layer proposal | Now lists its nodes explicitly. Its ranges left eight RP.0 nodes (uniform-boundedness … northcott-pullback) in no sub-layer, and the RP.2 ranges overlapped in node order. The RP.0 count is now 37. |
| `restructure`, new | ArithmeticDynamics DY.2 and DY.4 plan the ℙ¹ case of the canonical metric (escape rate and canonical adelic metric) that `RP.0/canonical-point-metrics` constructs in general. ArithmeticDynamics consumes RP.0, so DY should identify its ℙ¹ metric with RP.0's (‖x₀‖_v=|x₀|_v·e^{−G_{F,v}}) and keep its Berkovich, curvature and Arakelov–Zhang material. |

The suggested Lean file needed no change: its target register already lists all six new and revised targets as README targets, and none of my corrections touches a typed statement.

## Baseline

A Sonnet helper read all 103 declarations in the pinned trees (Mathlib `082e2d3`, Tau Ceti `f790474`) against their `provides` text. None is missing or in the wrong module. I read the four mismatches it flagged, the three entries round 2 added and the elliptic canonical-height family myself.

| Declaration | Corrected description |
| --- | --- |
| `mathlib:IsAzumaya.matrix` | The instance assumes `[Nonempty n]` (finite nonempty index type). |
| `tauceti:TauCeti.BrauerGroup.mk_matrix` | It assumes `n ≠ 0` (`[NeZero n]`). |
| `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety` | The fields are `toOver`, `grpObj`, `isProper`, `geometricallyIntegral`. Smoothness and geometric connectedness are derived, not fields. |
| `tauceti:WeierstrassCurve.Affine.Point.canonicalHeight_eq_zero_iff_isOfFinAddOrder` | It needs `IsElliptic` and a `Northcott` instance for the canonical height itself (derived by an instance from naive-height Northcott), over a field with `AdmissibleAbsValues` and decidable equality. |

The new entries `ContractingWith.exists_fixedPoint`, `FormalGroup` (one-dimensional) and `MvPowerSeries` say what they provide. The gap "Compactness of the integers of a nonarchimedean completion" is accurate: the pinned Mathlib has no compactness result for `adicCompletionIntegers`. The reviewed audit (`data/library-coverage.json`, AUDIT-09) lists no library point metrics, formal logarithms or local indices, so none of the new targets duplicates library material.

## Source issues

I opened every finding at its locator in the copy whose hash the packet records. All eleven are confirmed, and each now carries a `review` by this job.

| Id | Source and locator | Verdict |
| --- | --- | --- |
| E1–E7 | de Jong, *Notes on Heights*, pp.2, 6, 8, 9 | Confirmed. The proof of Lemma 3.1 drops the logarithm. The rank is n+1, not m+1. y=Ax need not be primitive (A=2I). φ is written for h in Step 5. Fact II is cited for Fact III in Step 6. Step 3 is used for globally generated bundles in Step 7. log 0 occurs at a=−1 in (15.0.1). |
| E8 | Conrad, *adelic points*, Example 2.2, p.3 | Confirmed: the closed/open clause has R and R′ reversed. |
| E9 | Milne, *Abelian Varieties*, IV Theorem 5.2, p.146 | Confirmed: there is no characteristic or separability hypothesis, and Frobenius iterates give a counterexample. |
| E10 | Milne IV, **Lemma** 5.3(b), p.147 | Confirmed. Locator corrected from "Proposition 5.3(b)". |
| E11 | Vojta, CIME notes, proof of Theorem 19.1, p.172 | Confirmed: the leading coefficient is r(r−2)N²/2, so positivity needs r≥3. The packet's numerical check was wrong and is corrected. At g=0, r=3, N=10, ε=1 the coefficient is 465−310−10=145, not "435−310=125". At r=2, g=0 it is −Nε, not N(1−ε). At r=2, g≥1 it is −g(2N−g+1)/2−Nε. |

## Closure and the rest of the plan

I read the statement, hypotheses, proof outline and direct prerequisites of all 147 nodes for closure, and rechecked every worked example and test. Recomputed examples include:

- h([√2:1])=(1/2)log 2 and h(1+i)=(1/2)log 2;
- the eight points of height ≤ log 2 on ℙ¹(ℚ), and x(2P)=129/100 on y²=x³−2;
- #H¹(G_{ℚ,{2,∞}},E[2])=16 against #Sel²=4;
- the image {1,−1} of the 2-isogeny map on y²=x³−x, and the homogeneous spaces v²=d₁u⁴+cu²+d/d₁;
- the Selmer set {1,2} from the resultant 4;
- the two Jacobians in Poonen §8.3 from the quartic invariants, and the explicit map X=2(w+1)/x², Y=4(w+1)/x³;
- the three S-unit solutions in ℤ[1/2];
- genera 17 and 41 in the Kodaira–Parshin construction;
- the Mumford ratio bound r≥2 for cosine ≥3/4;
- ½+½=0 for the Hamilton quaternions, (−1,p)_p for p≡3 mod 4, and ℤ[1/3] at 3.

I also re-opened these locators in hashed public copies:

- Szpiro §5.2, pp.97–98;
- Poonen §8.3, pp.236–238;
- Bhargava–Gross–Wang Theorems 5, 10–11 and Corollary 9 (p.3) and Proposition 22(4) (p.11);
- Bombieri §10, Theorems 1–2, pp.637–638;
- Harpaz–Wittenberg 2020 §2, pp.8–11;
- Conrad Example 2.2;
- Milne IV §5, pp.146–147.

For the other nodes, the source locators were verified by the first review and I did not re-open them. Each node's verdict and note are in the packet's `review.checked`.

The internal graph is acyclic. Every cross-roadmap prerequisite and request points to a lower tier in `upstream/CaraianiNewton.md`:

- SchemeAndStackFoundations: tier 2
- DiophantineApproximationAndTranscendence: tier 4
- AbelianSchemesAndArithmeticModuli: tier 6
- ArithmeticGaloisDuality and NeronModelsAndSemistableAbelianVarieties: tier 8

This roadmap is tier 9. The new R11.1 request is precise, and I checked it against the accepted NeronModels packet: R11.1 has Néron existence, the group law and the differential lattice, but no general formal-completion/reduction-kernel identification. Its R11.2 elliptic filtration covers dimension one only. The recorded gap is therefore honest.

**RT-AREA-iwasawa-1/3** is handled on this side:

- RP.0 and RP.1 own the height machine, Tate's limit, Néron–Tate heights and Mordell–Weil for abelian varieties;
- the torsion kernel uses Northcott only, not finite generation;
- the height half of Mordell–Weil is Mathlib's `CommGroup.fg_of_descent'` in additive form;
- a rescope proposal narrows GrossZagierAndArithmeticHeights GZ.1 to its Yuan–Zhang–Zhang normalisations and moves RankZeroOneBSD BSD.1's Mordell–Weil import to RP.1.

## Questions and notes for the orchestrator

1. **Mattuck provenance.** The re-hosted JSTOR file should not be cited as a public source anywhere in the atlas. If other packets cite `people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf`, they deserve the same treatment.
2. **SchemeAndStackFoundations is a Tau Ceti roadmap since 2026-10-14.** The package job must map the packet's 27 SF requests and 40 SF prerequisites onto sections of the merged README. These include §1.15–1.16 (torsors, contracted products, twisting), §2.15 (Hochschild–Serre), §2.22 (Azumaya algebras and the Brauer group of a scheme), §3.1–3.7 (curves, Riemann–Hurwitz, Picard and Abel maps) and Layer 5 (intersection theory). Whatever the merged README does not supply must be planned in the package.
3. **Tier note.** `CaraianiNewton.md` lists "move down: NeronModelsAndSemistableAbelianVarieties (5)" for this roadmap, although NeronModels sits in tier 8, below it. Every citation here points downward, so the note looks stale.
4. The two new rescope proposals (explicit sub-layers; ArithmeticDynamics canonical metrics) await the orchestrator, like the five already recorded.
