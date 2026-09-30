# Verification of RT-PAPER-CHANG-CHEN-MISHIBA-23

Agent: Codex — codex-a71f92. Date: 2026-09-30. Refs #4233.

Result: **10 confirmed, 0 rejected**, with material qualifications to the fixes for /1, /2, /3, /7, /8 and /10. Confirmation attaches to the actionable defect, not to every ancillary sentence or proposed implementation. This review changes only the verification JSON, this report and its handoff.

## Scope and independence

Repository evidence was read at `599f6e54de335dfe21cbf93b1bda86afbeabc82b`; mathematical library statements were inspected at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` (Tau Ceti baseline `f790474821cf4256814db967cb154e7af3d0c369`). I did not write the extraction, its review or the red team. Their recorded workers are respectively cc-7b31c4 (#1380/PR #1936), cc-fb70e5 (#1381/PR #2466), and cc-f805bf (#4234/PR #4829). My claim comment 5910038957 was confirmed by bot comment 5910040978 before work began.

I checked the ten findings against the target's 51-item inventory, relevant statements and both route briefs; the earlier review's cross-reference note; DM.0 and DM.8 packets; DM.0/2/6/8 and FA.0 stage descriptions and reviewed library-coverage entries; the named sibling extraction items; live supplier issues #1008/#1009; and the queue/collation code. This is verification of these findings, not a claim that the whole paper extraction has no other defects.

## Sources actually read

The [published article](https://doi.org/10.1017/fmp.2023.26) is Forum of Mathematics, Pi **11 (2023), e26, 1–32**. The [Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/BDCF99B5C8C0D72D48B1F33CFB54DDF9/S2050508623000264a.pdf/on-thakurs-basis-conjecture-for-multiple-zeta-values-in-positive-characteristic.pdf) was downloaded and read on 2026-09-30. I inspected §§1.2–1.4, Proposition 2.7, §5, Appendix A and the bibliography (pp.3–6,10,21–32), including the page image of Corollary 1.8 to resolve the overbar.

I compared the [arXiv v2 PDF](https://arxiv.org/pdf/2205.09929v2) and [v2 TeX source](https://arxiv.org/src/2205.09929v2), dated 11 July 2022: the relevant introduction, §5 and appendix passages, especially source line 443. Both PDFs have 32 pages. The source download is a gzip-compressed TeX file, not a PDF. The [arXiv version history](https://arxiv.org/abs/2205.09929), publisher landing page and [Crossref record](https://api.crossref.org/works/10.1017/fmp.2023.26) were checked for corrections; no correction was located in these checks. I have not certified all historical versions or an exhaustive word-level collation.

SHA256 of the exact retrieved artifacts:

| Artifact | SHA256 |
| --- | --- |
| CCM published PDF | `afd749d12525dcc41b5b9f1f59672728ab41ce5e3e8efd9594b1759448438d8f` |
| CCM arXiv v2 PDF | `05e1f6d6b1ef37068f73709928a9dcc7a0e50874aced170f0c92e07f0cd7413b` |
| CCM arXiv v2 source gzip | `6336dfc57c140182129afb6c13cddeb5cccc9dd7bf8d27b429a7d7d5e80c52de` |

The Cambridge hash identifies this watermarked download; it does not promise byte-identical future downloads. The extraction's September 22 reading claim is historical evidence, not the date of my reading.

Further targeted primary-source checks, also September 30:

- [CPY arXiv v2](https://arxiv.org/pdf/1411.0124v2), p.6, Proposition 2.2.1 and proof, plus the Ω convention. SHA256 `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549`. The denominator theorem must be used with a rational matrix and its Frobenius intertwining/determinant hypotheses; the printed polynomial-matrix domain is the already-recorded sibling issue, not a reason to omit the contract.
- [Papanikolas arXiv v2](https://arxiv.org/pdf/math/0506078v2), §§3.3.2–3.3.4 p.12 and §4.1.6 p.22. SHA256 `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3`. The ratio of two invertible fundamental matrices is fixed by σ; Lemma 3.3.2 supplies the constant field F_q(t). Section 3.3.4 uses the negative period normalization, so DM.8 is following its own source, not making a sign error.
- [Im–Kim–Le–Ngo Dac–Pham arXiv v2](https://arxiv.org/pdf/2205.07165v2), §3.3 pp.36,42. SHA256 `74a40b2e45b54760765247a010811d278e48f0b30f361bf3d9ca8cb92fd4b43e`. The final step explicitly uses the power of the q−1 Carlitz value, supporting the smaller repair of /2.

## Individual verdicts

### /1: Section 5 analytic inputs — confirmed

Confirmed, with reuse and normalization qualifications. Published §5 pp.21–24 explicitly defines Ω, the t-polynomials and CMPL deformation series, their entire/specialization properties, and the key-lemma matrices; items /17 and /51 do not supply these contracts. Lemma 5.1 also invokes fundamental-matrix uniqueness, a constant common denominator, and the period-power field criterion. Correct /51's §1.3-only locator and blanket omission note. Import the general Ω/period and difference-field facts from the existing DM.2/DM.8 owners; add the CMPL specialization and arbitrary-prefix matrix construction to the joined Part II. Ngo Dac's L-series includes Anderson–Thakur polynomial factors and specializes to Gamma-weighted MZVs, so it is not literally the same all-Q_i=1 deformation: state a specialization adapter, not an identification. CCM uses π̃=1/Ω(θ); DM.8 requests the negative normalization. Reconcile by an explicit F_q^× scalar comparison. The Eulerian subspace k·π̃^w is unchanged, but exact specialization formulas change. Retain Frac(T)^σ=F_q(t) for uniqueness and the determinant hypotheses of CPY Proposition 2.2.1.

### /2: The missing Carlitz containment contract — confirmed

Confirmed as a missing explicit proof input and an over-broad planned citation; the proposed full evaluation theorem is stronger than necessary. Published Theorem 5.2 p.25 explicitly uses π̃^w∈Z_w when (q−1)|w. The preprint's Theorem 5.2.1 uses this implicitly rather than printing that sentence. Item /4 states neither evaluation nor the needed containment; DM.6's reviewed targets are Taelman's L(C/A,1), not all positive Carlitz zeta values. However PAPER-IM-KIM-LE-ETAL-24/carlitz-zeta-q-minus-1 already requests the special evaluation from DM.6. Import that single-owner contract: ζ_A(q−1)=−(θ^q−θ)^(−1)π̃^(q−1). For w=m(q−1), the graded q-shuffle product gives ζ_A(q−1)^m∈Z_w, hence π̃^w∈Z_w; w=0 is separate. This is also the method in Im et al. v2 p.42. Split the depth-one definition, Carlitz module/period, and this named containment adapter. A full Bernoulli–Carlitz formula would need its own definitions/source/owner and is not forced by this proof.

### /3: Source-route handoff — confirmed

Confirmed as a source-handoff and concrete dependency-closure defect, not literally absence of all planning. I re-read live issues #1008/#1009 on 2026-09-30: neither carries the added-sources paragraph. make_queue.py routes accepted source items through ADDED_SOURCES, added_sources and the blueprint template. The DM.8 packet is partial, cites PAP-v2 only, and has nine fixed-vector/Betti nodes, with analytic constants and ABP explicitly in gaps rather than supplied nodes. The requested CCM /30–31 and sibling routes therefore lack concrete supplier contracts. Preserve DM.8 ownership; the general stage and its gaps already plan this direction. Have the coordinator propagate accepted sources and the authorized supplier job decompose them. A consuming design may proceed with precise requests to DM.8, rather than waiting or asserting completed imports. Do not put self-requests or proof-shaped placeholder nodes into DM.8, and do not regenerate queues or edit supplier packets from this verification issue.

### /4: Prerequisite identifiers and names — confirmed

Confirmed. I resolved all seven bad identifiers independently using arXiv records, the Annals page, and Crossref metadata, and compared the published bibliography p.32. Correct links: Chang 1207.2326; Ngo Dac 10.4007/annals.2021.194.1.6; CPY 1411.0124; Huei-Jeng Chen 10.1016/j.jnt.2014.09.016; Chang–Mishiba, On a conjecture of Furusho over function fields, 1710.10849 / 10.1007/s00222-020-00988-1; Lara Rodríguez–Thakur 1312.4928 / 10.1007/s13226-014-0089-0; George Todd 10.1016/j.jnt.2017.09.028. Replace the malformed 2017 Thakur title with Multizeta values for function fields: a survey, and add his IMRN 2009 paper 10.1093/imrn/rnp018 for Example A.3's basic binary relation. Add Carlitz 1935, On certain functions connected with polynomials in a Galois field, Duke 1(2),137–168, for the cited Carlitz inputs. Preserve the Lara Rodríguez–Thakur pages 787–801 supported by Crossref: CCM's bibliography itself prints different pages, so it is not authoritative for that metadata.

### /5: Coefficient field in Corollary 1.8 — confirmed

Confirmed against both versions, including visual inspection of the published page. The v2 TeX at Corollary 1.2.7 uses the algebraic-closure macro for the span and dim_k for its dimension; published Corollary 1.8 p.4 retains the overbar in the prose and lacks it in the dimension subscript. Item /12 repeats the mismatch. A nonzero k̄-vector space has infinite k-dimension. Correct the item to the k-span: the k-linear algebra specialization kills ζ_A(q−1), and multiplication by the nonzero ∞-adic ζ_A(q−1) injects Z_(w−q+1) into Z_w, giving the dimension drop. Use Z_0=k and zero negative-weight spaces. Alternatively bound the dimension of the k̄-span over k̄ by extending a finite k-spanning family; do not mix fields. Record a version-qualified stated-result misprint and the duplicated-word slip, with structured sourceVersions. Current arXiv history and publisher/Crossref checks located no correction; this is a scoped search, not a claim to have read every historical version.

### /6: Surviving cross-reference slips — confirmed

Confirmed. Published §1.3 p.5 still calls the product statement Theorem 2.7, while its actual heading on p.10 is Proposition 2.7. The correctly typed reference in §1.4 p.6 is a different sentence, not a replacement, so the previous review's preprint-only explanation is wrong. Published §1.4 also points to Section 2.1 for the product formulas, while §2.1 is Indices and the formulas are §2.3. Both defects occur in v2 §§1.3–1.4 pp.4–5 with subsection-numbered statements. Add separate version-qualified misprint records (fresh ids after E1–E4), changing Theorem to Proposition and the product-formula section to §2.3 (or §2 when referring to the whole section). Correct the earlier review note through the authorized fix workflow; these reference slips do not change the mathematics.

### /7: Pinned-library reuse — confirmed

Confirmed as omitted baseline reuse, with a narrower fix than the finding's final sentence. At Mathlib 082e2d3, RatFunc.inftyValuation, inftyValued and CompletionAtInfty supply the multiplicative integer-valued valuation and its completion. FunctionField.FqtInfty is a deprecated alias. LaurentSeries uses a formal variable, so identify it with 1/θ explicitly; a generic carrier is not that comparison. At the same pin, PowerSeries.IsRestricted, isRestricted_iff' and PowerSeries.IsRestricted.subring directly provide the one-variable radius-one restricted carrier over an ultrametric normed ring; the multivariate subring is also present. Add these citations and split the remaining work. Do not infer that only C_∞ and E remain: the normalized real-valued norm, Laurent-series comparison, Gauss-norm/completeness API, twists/fixed fields and needed analytic convergence still require verified interfaces. Item /30 as a whole remains missing, not library.

### /8: Ownership of C_∞ — confirmed

Confirmed. FA.0's stage description and reviewed audit concern curves, function fields and constants, not the completed algebraic closure C_∞. DM.2 presupposes that field in its stage text, its audit explicitly lists construction of C_∞ as a not-built target, and DM.8's first request assigns the chosen completion to DM.2. Remove FA.0 from item /2's planned owners and retain DM.2 as the single responsible supplier with an explicit construction/embedding request. Distinguish planned ownership from an available construction: the current DM.0–DM.7 packet contains only the DM.0 portion, so the route brief should say C_∞ is requested from DM.2 until a suitable node exists. This is not permission to duplicate the analytic field in the Part II.

### /9: Appendix definitions and published remark — confirmed

Confirmed. Published Appendix A pp.27–31 defines the all-weight relation space P^• and its homogeneous intersection P^•_w, gives explicit B_s, C_s, BC_q^m formulas with correction terms, then Init(s) and the three components of U. Items /45,/46,/48 omit respectively the weight restriction, operator definitions and progress-lemma inputs. Add the formulas/domains with nonempty s, m≥0 and positive-weight hypotheses where required, preserving empty-tail cases and correction terms; route once to the joined Part II. Published Remark 5.4 p.26 additionally states the k̄-linear relation consequence, absent from v2. Record it explicitly by linking item /42 to the descent theorem already in /5, rather than duplicating that theorem. The identities for composition/iteration are API lemmas, not replacements for the operator definitions.

### /10: Version provenance — confirmed

Confirmed for missing structured provenance and resulting misclassification; do not copy the inaccurate ancillary claims. The extraction has no sourceVersions. At the reviewed base, scripts/collation.py's fallback scans sourceIssues notes rather than source.read, and data/collation.json classifies this paper as preprint. Both actual PDFs I downloaded have 32 pages, not 25. Published Remark 5.4 is new, and Theorem 5.2's proof also explicitly adds π̃^w∈Z_w, which v2 uses implicitly; I do not certify an exhaustive word-level collation. Record the actual source-archive URL/hash separately from the PDF URL/hash, and this verifier's reading date 2026-09-30 rather than silently attributing today's checks to 2026-09-22. A watermarked published PDF can and should have a SHA256 identifying the retrieved bytes, even though future downloads may differ. Add structured published/preprint readings when fixing /5; regenerate derived collation through normal intake, not by hand.

## Bibliographic verification trail for /4

These primary records, checked independently, establish the identifier swaps. The names/titles in the bad columns are descriptions of what the links actually resolve to, not recommended prerequisites.

| Intended prerequisite | Bad identifier resolves to | Correct record |
| --- | --- | --- |
| Chang, linear independence | [1207.4736](https://arxiv.org/abs/1207.4736): Lévy-process prediction | [1207.2326](https://arxiv.org/abs/1207.2326) |
| Ngo Dac, Zagier–Hoffman | [2007.11060](https://arxiv.org/abs/2007.11060): log-algebraic identities | [Annals article and DOI](https://annals.math.princeton.edu/2021/194-1/p06) |
| Chang–Papanikolas–Yu | [1601.01927](https://arxiv.org/abs/1601.01927): tumor-cell microfilters | [1411.0124](https://arxiv.org/abs/1411.0124) |
| Huei-Jeng Chen, shuffle | [10.1016/j.jnt.2014.09.019](https://api.crossref.org/works/10.1016/j.jnt.2014.09.019): Berndt–Kang–Sohn continued fractions | [10.1016/j.jnt.2014.09.016](https://api.crossref.org/works/10.1016/j.jnt.2014.09.016) |
| Chang–Mishiba, Furusho | [1908.06398](https://arxiv.org/abs/1908.06398): stochastic orders | [1710.10849](https://arxiv.org/abs/1710.10849) |
| Lara Rodríguez–Thakur | [1401.2708](https://arxiv.org/abs/1401.2708): Casimir energy | [1312.4928](https://arxiv.org/abs/1312.4928), [published metadata](https://api.crossref.org/works/10.1007/s13226-014-0089-0) |
| George Todd | [10.1016/j.jnt.2017.10.025](https://api.crossref.org/works/10.1016/j.jnt.2017.10.025): Oppenheim–Shusterman squarefree polynomials | [10.1016/j.jnt.2017.09.028](https://api.crossref.org/works/10.1016/j.jnt.2017.09.028) |

The [Thakur survey](https://jtnb.centre-mersenne.org/articles/10.5802/jtnb.1009/) and [2009 IMRN metadata](https://api.crossref.org/works/10.1093/imrn/rnp018) distinguish the two missing/misnamed bibliography entries. The publisher DOI resolver was inaccessible for some entries; Crossref's publisher-deposited metadata was available. No claims here rely on reading those unrelated papers.

## Baseline details and corrected handoff

The /7 declarations were read in the pinned source, not inferred from a name search:

- `Mathlib/FieldTheory/RatFunc/Valuation.lean`: `RatFunc.inftyValuation` (81), `inftyValuation.X` (97), `inftyValued` (119), `CompletionAtInfty` (138). The completion deliberately uses the infinity-valued uniformity rather than the default X-adic one.
- `Mathlib/NumberTheory/FunctionField.lean`: deprecated `FunctionField.FqtInfty` alias (188).
- `Mathlib/RingTheory/PowerSeries/Restricted.lean`: `PowerSeries.IsRestricted` (29), `isRestricted_iff'` (46), `IsRestricted.subring` (88); `Mathlib/RingTheory/MvPowerSeries/Restricted.lean`: `MvPowerSeries.IsRestricted.subring` (107).

The fixer should apply the corrected scope above, especially: reuse the existing q−1 evaluation plus a graded-power adapter; retain concrete supplier requests rather than claiming delivered imports; keep CMPL and Anderson–Thakur-weighted series distinct; and preserve the remaining analytic work after reusing the restricted carrier. /5 needs a stated-result source issue with the published reading. /6 needs two separate harmless-reference issues. /10's 25-page assertion and blanket presentation-only comparison must not be propagated.

No source issue, extraction, earlier review, supplier packet, queue, generated atlas data or application code was changed in this verification. Coordinator queue refreshes and supplier mathematics require their authorized jobs. No messages were sent to paper authors.

## Validation

The unchanged repository `scripts/check_redteam.py` accepts the result and all ten verdicts. An additional exact-ID bijection/uniqueness check covers all ten input findings, and the unchanged intake path/privacy/JSON checks accept all three deliverables. No Lean file is requested or changed; no Lean compiler or language server was started. These are source and planning checks, not formalization claims.
