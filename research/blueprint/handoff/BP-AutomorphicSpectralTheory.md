# BP-AutomorphicSpectralTheory handoff

Issue: [#690](https://github.com/CBirkbeck/tauceti-explorer/issues/690). Worker: Codex, session `codex-tmvXcm`. Claim confirmed by the swarm bot. This is a completed target-planning pass, submitted for independent review, rather than a checkpoint or an implementation claim.

## Delivered

- [Packet](../packets/AutomorphicSpectralTheory.json): `status: complete`; 191 nodes (36 definitions, 37 constructions, 118 theorems), 223 API items, 219 tests and 38 planets. All seven stages AS.0–AS.6 are **planned**; zero are **closed**. The job’s stopping condition is met because every stage has a target plan, below its approximate 300-node budget.
- [Reader](../readmes/AutomorphicSpectralTheory.md): conventions, ownership boundaries, seven stage narratives, every declaration’s statement/hypotheses/proof work/interface/tests, baseline, requests, gaps, source corrections and edition ledger. It is the definitive mathematical specification.
- [Suggested Lean](../suggested/AutomorphicSpectralTheory.lean): all 633 unique packet declaration/API/test names and 219 corresponding anonymous `example`s. The standard prototype notice and individual imports are retained. Proofs and constructions are provisional; `implementationStatus` remains `unchecked`.

The target pass applies accepted RS-04 and the reviewed library coverage. Cross-roadmap prerequisites import exact existing node ids where available; missing suppliers are requests, not duplicate definitions. The 128 routed source items have explicit decisions: 95 planned, 32 covered by a general or imported object, one retained as a gap. Definitions and constructions all have at least three API items and three tests.

## Confirmed findings handled

- **RT-AREA-automorphic-1/4:** AS.2 plans the local unnormalized intertwiner, Harish-Chandra μ-function and normalization theorem. AS.6 plans real Clozel–Delorme/Arthur Paley–Wiener and the multiplier theorem. It requests the nonarchimedean Bernstein–Deligne–Kazhdan supplier from SmoothRepresentationsCharactersPartII; the supplier extension remains explicit remaining work.
- **RT-AREA-automorphic-1/5:** AS.1 constructs the convergent global intertwiner before the constant-term formula, pseudo-Eisenstein series, their square-integrability/pairing and cuspidal-data orthogonal decomposition. AS.2 consumes these. AS.3 constructs wave packets before proving their Gram identities; AS.4 supplies the distinct completeness theorem.
- **RT-AREA-automorphic-1/24:** ET.1 owns unweighted invariant orbital integrals, quotient measures and singular extensions. AS.6 imports it and keeps weighted integrals, their family estimates and fine-expansion coefficients. Weighted orbital integrals are not defined as an arbitrary scalar multiple of an already invariant distribution.

Further normalization checks retain the imaginary-axis versus finite-order distinction, isometry versus surjectivity, residual versus continuous terms, Hecke-only fine spectral hypotheses, absolute integrability at each height versus outer height summability, GZ/DIT Laplace signs, GL/SL compact-group parity and every component of function-field probability Haar measure. Isobaric sums belong to AS.2, realize the routed AS.1/AS.2 target and are imported by AS.5; their prototype exposes a genuine rank-n GL group representation rather than only a Satake multiset.

## Sources and corrections

The 29 actual PDFs have URL, edition, reading scope, access date and SHA-256 records; all hashes were rechecked. Scope is the required spectral/analytic statements and their proof passages, not every arithmetic interior of every source. The ledger distinguishes preprints, author copies and published copies. In particular, Yu uses arXiv1807.04659v5 without journal collation, Jiang–Zhang uses arXiv1508.03205v4 with the correct Annals191 citation, Calegari–Geraghty uses the symplectic/non-regular paper, and the BPCZ source is the endoscopic-case paper.

There are 14 source issues. Relevant previously reviewed DIT, Yu and GZ findings are reused without importing their review verdicts; the source-version/search limitations remain explicit. Arthur’s reported Hecke-domain correction and earlier boundary-inequality correction, and Clozel–Delorme’s AppendixD repair, are recorded. The additional Arthur05 coefficient misprint is supported by its own (21.5), Corollary21.3 and Arthur1988global p.520: use a_M^L in (21.17), reserving a_M^G for L=G. Its bounded correction search is recorded; it awaits this job’s independent review.

The analytic level-N Green kernel has its own construction and API. Its sum uses the effective Γ₀(N)/±I action. The constant pole, nonharmonic finite part and arithmetic cusp correction are distinct; the last remains with GZ.7. The bare O(1) Legendre remainder is true but insufficient for the later renormalized limit, and is recorded as a proof gap, not a false theorem. Yu’s report of the Lafforgue mistake is scoped to Yu’s replacement; no direct reading of the original Lafforgue theorem is claimed.

## Validation and Lean limitation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`: **0 errors, 0 warnings**.
- `python3 scripts/check_errata.py` on a scratch `errata-v1` wrapper containing the packet’s unchanged source issues and version ledger: **passed**. The checker’s input protocol is for errata jobs, so the delivered blueprint keeps `blueprint-v1`.
- Source-hash, name-uniqueness, declaration/API/test inventory and anonymous-example checks: **passed**.
- `lean-check` on a scratch copy of the suggested file with only its four `TauCeti.*` import lines removed, followed by `#check` for every one of the 633 packet names: **exit 0; only declaration-uses-sorry warnings**. All 219 packet examples elaborate in that Mathlib-only experiment.
- **The full suggested file was not successfully compiled.** `lean-check research/blueprint/suggested/AutomorphicSpectralTheory.lean` fails because the shared build has no object file for `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded`. The other retained Tau Ceti imports are PeterWeyl, Conformal.Vitali and Fredholm.CompactPerturbation. No dependency build, cache update or language server was started.

The shared Mathlib checkout is exactly `082e2d37e8b0463410cdb532e111cd43d5a66174`. Its Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the pinned `f790474821cf4256814db967cb154e7af3d0c369`; each of the four imported source modules was checked to be unchanged between those commits. This source comparison does not substitute for full-file elaboration at the pinned build. Baseline declarations were read at the recorded pins. Memory was checked before compilation and checks ran sequentially for this worker.

## Remaining work and where to resume

The packet has 40 named gaps and 21 supplier requests. These prevent mathematical closure, while leaving target planning complete. Each coverage record lists its stage’s exact unresolved items; each gap/request identifies consuming node ids. A follow-up worker should start at those records and preserve accepted ownership boundaries, rather than rebuilding the inventory. The suggested-file carrier omissions are explicit comments: general locally convex targets, full adelic/automorphic and smooth test carriers, multidimensional character tori, cuspidal/admissibility conditions and their coherence require supplier integration. Normed, numerical and finite-dimensional prototypes are signature experiments, not proofs of the unrestricted reader statements.

The primary unresolved source/proof groups are:

- **Analytic Fredholm source closure** — start at `AutomorphicSpectralTheory:AS.0/analytic-fredholm`; the packet gives the full statement, consuming list and source boundary.
- **Uniform differentiated chamber estimates** — start at `AutomorphicSpectralTheory:AS.1/eisenstein-convergence`; the packet gives the full statement, consuming list and source boundary.
- **General nonassociate constant-term indexing** — start at `AutomorphicSpectralTheory:AS.1/cuspidal-constant-term`; the packet gives the full statement, consuming list and source boundary.
- **Local Harish-Chandra analytic inputs beyond suppliers** — start at `AutomorphicSpectralTheory:AS.2/local-intertwiner`; the packet gives the full statement, consuming list and source boundary.
- **Langlands Chapter 7 residue-system proof** — start at `AutomorphicSpectralTheory:AS.2/eisenstein-continuation`; the packet gives the full statement, consuming list and source boundary.
- **Jiang–Zhang rank-one source closure** — start at `AutomorphicSpectralTheory:AS.2/generic-standard-module`; the packet gives the full statement, consuming list and source boundary.
- **Uniform packet-limit argument** — start at `AutomorphicSpectralTheory:AS.3/wave-packet-gram`; the packet gives the full statement, consuming list and source boundary.
- **Compact-quotient Sobolev trace-class input** — start at `AutomorphicSpectralTheory:AS.4/compact-quotient-spectrum`; the packet gives the full statement, consuming list and source boundary.
- **Modular Weyl and pointwise analytic proof inputs** — start at `AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion`; the packet gives the full statement, consuming list and source boundary.
- **Essentially tempered reductive central adapter** — start at `AutomorphicSpectralTheory:AS.4/wallach-cuspidality`; the packet gives the full statement, consuming list and source boundary.
- **Franke graded-piece weight/index integration** — start at `AutomorphicSpectralTheory:AS.5/weighted-finite-character-acyclic`; the packet gives the full statement, consuming list and source boundary.
- **General GLₙ cohomological and multiplicity-one input** — start at `AutomorphicSpectralTheory:AS.5/gl-sl-cuspidal-diagram`; the packet gives the full statement, consuming list and source boundary.
- **Franke–Schwermer primary source and GLₙ synthesis** — start at `AutomorphicSpectralTheory:AS.5/franke-schwermer-support`; the packet gives the full statement, consuming list and source boundary.
- **Nonarchimedean invariant trace Paley–Wiener supplier** — start at `AutomorphicSpectralTheory:AS.6/almost-compact-test-space`; the packet gives the full statement, consuming list and source boundary.
- **Weighted orbital estimate and general L²-cohomology primary prerequisites** — start at `AutomorphicSpectralTheory:AS.6/weighted-orbital-integral`; the packet gives the full statement, consuming list and source boundary.
- **Yu 010 external proof inputs** — start at `AutomorphicSpectralTheory:AS.1/yu-010`; the packet gives the full statement, consuming list and source boundary.
- **Yu 017 external proof inputs** — start at `AutomorphicSpectralTheory:AS.4/yu-017`; the packet gives the full statement, consuming list and source boundary.
- **Yu 020 external proof inputs** — start at `AutomorphicSpectralTheory:AS.4/yu-020`; the packet gives the full statement, consuming list and source boundary.
- **Yu 021 external proof inputs** — start at `AutomorphicSpectralTheory:AS.4/yu-021`; the packet gives the full statement, consuming list and source boundary.
- **Yu 022 external proof inputs** — start at `AutomorphicSpectralTheory:AS.3/yu-022`; the packet gives the full statement, consuming list and source boundary.
- **Yu 024 external proof inputs** — start at `AutomorphicSpectralTheory:AS.6/yu-024`; the packet gives the full statement, consuming list and source boundary.
- **Yu 038 external proof inputs** — start at `AutomorphicSpectralTheory:AS.6/yu-038`; the packet gives the full statement, consuming list and source boundary.
- **Yu 039 external proof inputs** — start at `AutomorphicSpectralTheory:AS.6/yu-039`; the packet gives the full statement, consuming list and source boundary.
- **Yu 053 external proof inputs** — start at `AutomorphicSpectralTheory:AS.6/yu-053`; the packet gives the full statement, consuming list and source boundary.
- **Yu 065 external proof inputs** — start at `AutomorphicSpectralTheory:AS.4/yu-065`; the packet gives the full statement, consuming list and source boundary.
- **Yu 066 external proof inputs** — start at `AutomorphicSpectralTheory:AS.2/yu-066`; the packet gives the full statement, consuming list and source boundary.
- **Yu 148 external proof inputs** — start at `AutomorphicSpectralTheory:AS.0/yu-148`; the packet gives the full statement, consuming list and source boundary.
- **Yu 149 external proof inputs** — start at `AutomorphicSpectralTheory:AS.0/yu-149`; the packet gives the full statement, consuming list and source boundary.
- **Yu 150 external proof inputs** — start at `AutomorphicSpectralTheory:AS.0/yu-150`; the packet gives the full statement, consuming list and source boundary.
- **Yu 152 external proof inputs** — start at `AutomorphicSpectralTheory:AS.6/yu-152`; the packet gives the full statement, consuming list and source boundary.
- **Function-field spectral analytic sources** — start at `AutomorphicSpectralTheory:AS.4/yu-017`; the packet gives the full statement, consuming list and source boundary.
- **No exceptional level-one cusp spectrum** — start at `AutomorphicSpectralTheory:AS.4/gl2-spectral-expansion`; the packet gives the full statement, consuming list and source boundary.
- **Modular resolvent primary source and noncompact boundary realization** — start at `AutomorphicSpectralTheory:AS.2/dit-91`; the packet gives the full statement, consuming list and source boundary.
- **Gross–Zagier resolvent source and regularized derivative integrals** — start at `AutomorphicSpectralTheory:AS.2/gz-68`; the packet gives the full statement, consuming list and source boundary.
- **Local-factor and packet Part II beyond current owners** — start at `AutomorphicSpectralTheory:AS.2/shahidi-normalization`; the packet gives the full statement, consuming list and source boundary.
- **Modular core and boundary-residue adapters** — start at `AutomorphicSpectralTheory:AS.4/dit-eisenstein-integrable-over-core`; the packet gives the full statement, consuming list and source boundary.
- **Global rational Bruhat indexing** — start at `AutomorphicSpectralTheory:AS.1/cuspidal-constant-term`; the packet gives the full statement, consuming list and source boundary.
- **Bounded-normal joint-measure proof** — start at `AutomorphicSpectralTheory:AS.0/bounded-normal-spectral`; the packet gives the full statement, consuming list and source boundary.
- **Locally convex Schwartz kernel integration** — start at `AutomorphicSpectralTheory:AS.0/vector-schwartz`; the packet gives the full statement, consuming list and source boundary.
- **Effective modular-group and Green-resolvent integration** — start at `AutomorphicSpectralTheory:AS.2/automorphic-green`; the packet gives the full statement, consuming list and source boundary.

Obtain and check the Franke–Schwermer primary theorem, the Hejhal noncompact resolvent proof, the exact Langlands residue-system arguments and the additional real/local analytic prerequisites before claiming closure. Integrate locally convex completion/topologies and the complex character-torus carrier before upgrading the restricted suggested signatures. Re-elaborate the full file once a pinned build already containing the required Tau Ceti object files is available.

The submitted deliverables contain all material needed for independent review or follow-up. Scratch source texts, page images and validation logs are not required by this handoff and are removed when the pull request is open. This process takes no second job.
