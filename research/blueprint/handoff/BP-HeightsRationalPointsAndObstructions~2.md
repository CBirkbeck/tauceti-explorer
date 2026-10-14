# Handoff: BP-HeightsRationalPointsAndObstructions~2

Revision job #9672, Codex session `codex-gubGNh`, 2026-10-14. This is a completed target-level revision under PROTOCOL §0, ready for independent re-review. It is not a checkpoint and does not certify formal proofs. The earlier `review` object is preserved exactly, including its `needs_changes` verdict; only the next independent reviewer may replace it.

## What changed

All 144 reviewed IDs, all 36 planets, all 11 confirmed source issues and the existing ownership/routing proposals are preserved. The review's in-place corrections were checked against its inventories and retained. This round did not repeat the prior independent reading of all 31 sources or all 100 baseline declarations. The three previously unverifiable targets have now been revised from primary sources actually read in this run:

- **RP.0/local-weil-functions:** a norm-derived local function now rests on two new targets, `RP.0/bounded-point-metrics` and `RP.0/canonical-point-metrics`. The first specifies generated-bundle presentations, equivariance under the local Galois action, finite-extension compatibility, certified bounded log ratios, summable placewise bounds and a complete local metric space. The second gives the contraction factor, geometric error estimate, dominated global convergence and exact scalar change of the global isomorphism. Symmetric and antisymmetric components use exponents 4 and 2; the arbitrary bundle uses the genuine square isomorphism and half-sum, without a rational square-root decomposition. Independent local constants do not automatically cancel. The elliptic test distinguishes half the Müller–Stoll local function from Silverman's function: their shift is −(1/12)log|Δ|, so their duplication constants differ while their global sums coincide.
- **RP.1/local-division-index:** Mattuck's additive open subgroup and locally compact finite-index conclusion are verified. The finite-group snake sequence gives the index without a splitting assumption. The module norm is q_F^(−ord_F), giving the dyadic factor 2^(g[F:ℚ₂]), with tests over ℚ₂ and an unramified quadratic extension. The real/complex cases import the existing complex-lattice supplier and explain the real component group.
- **RP.1/reduction-torsion-injective:** Katz's Appendix Lemma′ and proof are verified, separating prime-to-p injectivity from all-torsion injectivity at the strict bound e<p−1. The new `RP.1/formal-logarithm-small-ball` gives a multivariate integral formal-law logarithm on 𝔪^r for r>e/(p−1), its coefficient and contraction estimates, and additive/multiplicative/boundary tests. Native FormalGroup and MvPowerSeries are reused; the complete-local-field evaluation and logarithm are not already supplied by FormalGroup.Point.

The fourth original target edited is only the title of `RP.4/mordell-faltings`: it no longer describes the unconditional theorem as the Parshin route. Its existing independent RP.5 Vojta–Bombieri supplier is unchanged. The packet's other 140 original target objects are unchanged.

The reader is synchronized for all 147 targets: statements, hypotheses, proof outlines, APIs, tests, checks, consumers, prerequisites and source locators. Its introductory normalization, twisting, adelic topology, trace, Parshin and finiteness conventions are also corrected. Requests, gaps, coverage, ownership notes, bibliography, all source corrections and the pinned baseline register are included. The Parshin genus distinction is retained: the intermediate genus is 1+2^(2g)(g−1), the final full-branch genus is 1+2^(2g−1)(4g−3); at g=2 these are 17 and 41, with the halving degree computed from the intermediate Jacobian.

## Source evidence and permitted copies

The packet records these primary URLs, hashes, editions, read dates and locators. All mathematical descriptions are in our own words.

- [Mattuck, Abelian varieties over p-adic ground fields](https://people.dm.unipi.it/lombardo/NonAbelianChabauty/Mat55.pdf): §13, Theorem 7 and full proof, printed pp.114–117; §14 observations, p.118. SHA-256 `9d950c3d86f8c8cf1949ec34b42eff49a8f73cbebf199ccfbf01bc6dcd745f94`.
- [Lang, Galois properties of torsion points on abelian varieties, Appendix by Katz](https://web.math.princeton.edu/~nmk/old/galoisprop.pdf): Appendix setup, printed p.501; Lemma, Lemma′ and full proof, p.502, visually read from the scan. SHA-256 `eb651da43d98104bde5f86ed6f2b792b564a73cd7680742746c04ae6d3efeecc`.
- [Gubler, Basic Properties of Heights of Subvarieties](https://gubler.app.uni-regensburg.de/Publikationen/habi%2B.pdf), habilitation dated 5 July 2002, 125-page PDF: §5.1.2 pp.96–97; §5.1.12–16 and full Theorem 5.1.13 proof pp.100–101; §5.2.1–4 p.106; §5.2.15–18 pp.108–109; Theorem 5.3.13 and Remark 5.3.14 with proof p.114; §5.3.20–24 and proofs pp.117–119. SHA-256 `75bbf9b41b163482e3789af0a88cacd92e53913d63cc34d19d25fc25b8538835`. Only the point-metric/point-height specialization is used; higher-dimensional arithmetic intersections remain separate.
- [Müller–Stoll, Computing canonical heights on elliptic curves in quasi-linear time](https://www.mathe2.uni-bayreuth.de/stoll/papers/ellheights-arXiv-v2.pdf): re-read §2–3 printed pp.2–4, including the telescoping construction, Remark 3.1 and Proposition 3.2. Same SHA-256 `778d14c7197ecef334aa5fd7b3ce96aad8d40f4fd20e85d4fa8fc56072c2018f`; corrected PDF length to 15 pages. The prior read provenance is retained alongside this new read.

Bombieri–Gubler is not cleared in the maintainer's library index. No copy was obtained or read. Its unread bibliographic record remains; it is not evidence for these revisions. The other inherited sources retain their existing read provenance, with no claim that this worker re-read them all.

## Libraries, ownership and requests

Pinned Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`; pinned Tau Ceti is `f790474821cf4256814db967cb154e7af3d0c369`. Three read baseline entries were added: `ContractingWith.exists_fixedPoint`, `FormalGroup`, and `MvPowerSeries`. The seven provider descriptions corrected by the prior reviewer were rechecked at the pins, including the projective-height nonzero/universe contract, abelian closed-image/isogeny contracts, same-universe Brauer base change, and elliptic height/pairing normalization. The prior review's baseline annotations remain attributed to that reviewer.

Current read-only TauCetiRoadmap was screened at `0d144d044dacebca17b654695b6f1ad58f159b27`, including the nine newer roadmaps and four Completed roadmaps named in WORKERS.md. Current Tau Ceti was screened at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native heights, elliptic heights/descent and field Brauer groups are imported. General point metrics and general-dimensional formal logarithms were not found there. Recheck newer upstream before adding further targets.

There are now 39 precise requests. The existing SchemeAndStackFoundations SF.5 very-ample request is extended to globally generated difference presentations and uniform local coefficient estimates; its unresolved supplier status remains visible. One request is new: NeronModelsAndSemistableAbelianVarieties R11.1 must identify general smooth-group formal completions and reduction kernels, supply p-adic Néron identity charts including bad reduction, and provide good-reduction Jacobian/Abel–Jacobi specialization. The currently scoped elliptic comparison does not supply arbitrary dimension. The unread Mattuck/Katz gap is replaced by this exact interface gap, rather than declaring the missing supplier built.

Accepted RS-03 keeps general abelian height machinery and descent here. RT-AREA-iwasawa-1/3 remains handled by the preserved routing proposals: GZ.1 imports RP.0 and RP.1 and retains only its normalization/component pairing work; BSD.1 imports general Mordell–Weil from RP.1. The native `AddCommGroup.fg_of_descent'` supplies the height half, and Northcott proves the torsion kernel before finite generation. No higher Faltings or Lawrence–Venkatesh prerequisite is restored. Scheme Brauer remains owned by SchemeAndStackFoundations:key/scheme-brauer. Higher-dimensional metrized intersections/equidistribution remain the proposed Arakelov Part II. No atlas edge or another owner's file was edited.

## Coverage and where the next worker resumes

All seven stages RP.0 through RP.6 are **planned**, none is closed. The packet is **complete** as a target-level pass, with exact outstanding obligations. Two unread-source gaps were removed and the general smooth-group interface gap added, leaving 17 gaps:

- Arithmetic intersection theory of adelic metrized line bundles.
- Faltings' proof of the subvariety theorem in higher dimension.
- Proofs of Manin–Mumford.
- Structure of the Ueno locus.
- Manin's interpretation of Ш through the Brauer–Manin pairing.
- Compactness of the integers of a nonarchimedean completion of a number field.
- Function-field Mordell conjecture proofs.
- Unplanned scheme, curve and line-bundle supplier contracts.
- Lang–Néron proof contracts.
- Global-function-field adelic and cohomology extension.
- Deep descent comparisons and universal torsor existence.
- Bombieri product and Roth lemma.
- Certified computation beyond compact local evaluation fibres.
- Lefschetz, Brauer reciprocity and purity proof contracts.
- Number-field S-adic Subspace Theorem adapter.
- Formal lemma auxiliary-place proof.
- Smooth-group formal-completion and local-chart interfaces.

The packet and reader give each gap's full contract and consumer list; each coverage row gives its stage-specific remaining list. No remaining proof is implicitly discharged by the new point-metric or logarithm targets. Follow-up work must verify the new primary-source adaptations independently, then refine these recorded deep proofs and obtain the requested supplier interfaces. The next review must inspect the three revised targets and the three new targets, including the equivariance/extension convention, local elliptic normalization and strict logarithm boundary. It should replace the prior review only after that independent check. No scratch artifact is needed to resume.

## Validation and counts

- `python3 scripts/check_blueprint.py research/blueprint/packets/HeightsRationalPointsAndObstructions.json`: zero errors and warnings.
- Suggested Lean elaborates through `lean-check` at the pinned shared build: 933 lines, 98 warnings, all `declaration uses sorry`, no errors or other warnings. Available memory was above 20 GB before compilation; no Lean process remains. Its executable content is unchanged; edits synchronize comments and the target register. Missing-carrier targets remain in the reader, following the compact shape rule.
- `scripts/check_sorry_data.py`: passes; no sorry'd data definitions.
- Intake file validation and `git diff --check`: pass. Original IDs, review object, source issues, planets and ownership records match the input. Reader completeness and internal-anchor checks pass for all 147 targets, 39 requests and 17 gaps. All 147 target IDs have register entries in the suggested file.

Counts: 26 definitions, 25 constructions, 22 lemmas, 66 theorems, seven applications and one comparison; 300 API items; 216 unit tests; 36 planets; 103 baseline declarations; 32 sources and 23 source-version records; 39 requests; 17 gaps. RP.0–RP.6 are all planned, zero closed. Only this job was claimed, and no second job will be taken.
