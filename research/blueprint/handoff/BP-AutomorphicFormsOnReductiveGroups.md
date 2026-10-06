# BP-AutomorphicFormsOnReductiveGroups — complete pass (Claude, claude-OpNE3H)

Claude (session `claude-OpNE3H`), 6 October 2026. Refs #684; the bot confirmed the claim (comment 6017284261). **Status: complete.** Every stage in scope (AF.0, AF.1, AF.1a, AF.2, AF.3, AF.4, AF.5) is `planned`; none is `closed`, because unread proof sources are recorded as gaps and each stage lists its refinements.

## Deliverables

- `research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json`: 90 nodes (26 definitions, 18 constructions, 46 theorems), 236 API items, 167 unit tests, 30 planets, 34 baseline declarations read at the pinned commits, 38 requests, 9 gaps, 9 source issues, 3 restructuring proposals.
- `research/blueprint/readmes/AutomorphicFormsOnReductiveGroups.md`: the roadmap document, layer by layer, agreeing with the packet.
- `research/blueprint/suggested/AutomorphicFormsOnReductiveGroups.lean`: 2,342 lines. It **compiled** with `lean-check` (shared build, Mathlib 082e2d3) with 0 errors; the only warnings are `declaration uses 'sorry'`. It imports Mathlib only, because the shared build's Tau Ceti is not f790474. Packet names that need structures neither Mathlib nor the prototype has (smooth differential forms on manifolds, explicit (𝔤𝔩_n, O(n)) pairs, discrete series of Hermitian groups as modules, L² of the automorphic quotient, GL₂ over the adeles, Hecke characters) are listed in comments, by name, with the reason.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicFormsOnReductiveGroups.json --index <pinned declarations.tsv>`: 0 errors, 0 warnings.
- `research/blueprint/intake.py check-files` on the four files: no problems (see the pull request).
- Every excerpt was compared with the text of the source it cites (a script over the downloaded PDFs). The remaining mismatches are PDF line-break hyphenation, ligatures and sub- or superscripts that the text layer splits.

## Structure decisions

- **RS-04** (accepted) is followed. AF.0 is narrowed to smooth adelic test functions, the Schwartz algebra, moderate and uniform moderate growth, and their stability; heights, reduction theory and Siegel sets are imported from AdelicAlgebraicGroups AA.3. AF.3 owns cuspidal constant terms, rapid decay, square integrability and finite multiplicity.
- **RS-12 and RS-23** (accepted) are followed. AF.4 owns the cohomological weight and rationality package. AF.5 owns the generic algebraic modular forms on groups compact at infinity, with integral coefficients, Hecke operators and level change; R18.3 specialises them.
- **RS-21** (pending review) is consistent with the plan: AF.0, AF.2, AF.4 and AF.5 supply exactly what it routes to the GL₂ roadmap.
- **RT-AREA-automorphic-1/29** overrides RS-04's owner entry for the relative Lie algebra cochain complex. AF.1a owns pairs (𝔮, K), (𝔮, K)-modules and relative cochains. Those nodes also realise AF.1; AF.1 imports them. The `restructure` entry asks for the edge AF.1a → AF.1 and for RS-04's AF.1 → AS.5 link to be redirected to AF.1a.
- **Cycle with AdelicAlgebraicGroups.** RS-04 links AA.3 → AF.1. The AdelicAlgebraicGroups packet (needs_changes) instead requests the archimedean norm comparison from AF.1. That request should be withdrawn in AA's revision: the comparison is polynomial algebra that belongs with AA.3. AF.1 imports `AdelicAlgebraicGroups:AA.3/height-representation-comparison`. This is recorded in `restructure`.
- **New stage edges, all checked acyclic against the atlas and the accepted restructurings** (recorded in `restructure`):
  - ALS.0 → AF.1;
  - AF.1 → AF.0;
  - SR.4 → AF.2;
  - ALS.1, ALS.3, ALS.5, AS.5 and AS.4 → AF.4;
  - ShimuraData D3 and D5 → AF.4;
  - AL.0 → AF.3;
  - AL.3 → AF.4.
- **AF.1b.** The classification nodes have the parent `AF.1/real-reductive-representation-theory` and are proposed as the sub-layer AF.1b.

## Red-team findings handed to this job

- **RT-AREA-automorphic-1/2 (archimedean local Langlands).** Planned in the AF.1b sub-layer:
  - `weil-group-real`: W_ℝ, W_ℂ and their representations;
  - `archimedean-llc-gln`: Langlands' bijection for GL_n(ℝ) and GL_n(ℂ), with central character, twists, temperedness, the infinitesimal character and the GL₂(ℝ) discrete-series parameter;
  - `langlands-classification`, `discrete-series` (Harish-Chandra's criterion and parameters, limits), `gl2-real-discrete-series` (D_k with Casimir k(k−2)/4) and `tempered-square-integrable`.

  L- and ε-factors of W_ℝ-representations stay with AutomorphicLFunctionsAndLocalFactors AL.1, and their match with the Godement–Jacquet factors with AL.2. Both already consume AF.1, so no request is needed. Knapp's proof source was not read (gap).
- **RT-AREA-automorphic-1/25 (AF.4 theorems).** The following nodes are planned: `wigner-lemma`, `l0-q0-invariants`, `borel-wallach-tempered-range`, `vogan-zuckerman`, `gln-tempered-cohomological` and `clozel-purity`.
- **RT-AREA-automorphic-1/26 (spherical vectors).** `AF.2/spherical-dimension-one` deduces dim π_v^{K_v} ≤ 1 from commutativity of the spherical Hecke algebra, imported from SR.4 (requested). `AF.2/flath-factorization` uses it.
- **RT-AREA-automorphic-1/29.** See the structure decisions above.
- **RT-AREA-automorphic-1/30.** `AF.4/clozel-rationality` and `AF.4/torsion-hecke-eigenclasses` rest on ALS.1, ALS.3, ALS.5 and AS.5 through requests and new stage edges. The algebraic weights and lattices stay before them in AF.4.
- **RT-AREA-automorphic-1/31.** Resolved by the accepted RS-23. `AF.5/algebraic-modular-forms` and `AF.5/algebraic-modular-forms-structure` are the generic owner, consumed by R18.3.

## Sources added by the maintainer: where each item went

- **Zhang (Annals 2021).**
  - /3 → `AF.2/holomorphic-sl2-forms`;
  - /113 → `AF.3/sl2-fourier-vanishing`;
  - /171 → `AF.3/sl2-generation`.
- **Jiang–Zhang.** The Vogan unitary dual → `AF.1/vogan-generic-unitary-dual`; Dixmier–Malliavin → `AF.1/dixmier-malliavin`.
- **Gan–Ichino.** The archimedean local Langlands correspondence → `AF.1/archimedean-llc-gln`.
- **Duke–Imamoḡlu–Tóth.** /61–/63 → `AF.3/maass-cusp-forms`. The first five eigenvalues are its acceptance and a unit test; they are cited numerical values.
- **Kaletha.** P16 → AF.1's (𝔤, K)-module, globalization and tempered nodes. Characters stay with ET.1.
- **Boxer–Pilloni.** Theorem 1.3.8 and C(κ) → `AF.4/harris-limits-gsp2g`, with corrections E7 and E8. ^MW, w_{0,M}, ρ and the cones are requested from ShimuraData D3 and D5.
- **Calegari–Geraghty 2018.** The ℓ₀ and q₀ items, the Borel–Wallach range and Remark 5.14 → `AF.4/l0-q0-invariants` and `AF.4/borel-wallach-tempered-range`.
- **Calegari–Geraghty 2020.** All 13 items → `AF.4/hermitian-positive-system` (E3), `AF.4/coherent-relative-cohomology`, `AF.4/gsp4-discrete-series` (E4), `AF.4/bhr-coherent-cohomology`, `AF.4/mirkovic-tempered-coherent` and `AF.4/clozel-purity`. The appendix ℓ₀ and q₀ → `AF.4/l0-q0-invariants`.
- **Pilloni.** All 8 items → `AF.4/gsp4-discrete-series`, `AF.4/coherent-relative-cohomology`, `AF.4/bhr-coherent-cohomology` and `AF.4/bhr-large-weight`, with corrections E5 and E6.
- **Ichino–Prasanna.** /047 and /048 → `AF.4/vogan-zuckerman`.
- **Boxer–Calegari–Gee.** The archimedean even, odd and tempered items → `AF.4/gln-tempered-cohomological`.
- **Ding.** §4.2.2 → `AF.5/algebraic-modular-forms`: the coefficient lattices with inertial types (E9). The p-adic completion Ŝ_{ξ,τ} is the completed cohomology of CompletedCohomologyPartII; it is noted as a use, not planned here.
- **Beuzart-Plessis–Chaudouard–Zydor.** /17 → `AF.1/dixmier-malliavin` (adelic form). Their §2.5 is the main source of AF.0.
- **Chenevier–Taïbi.** Discrete-series existence → `AF.1/discrete-series`; the archimedean correspondence → `AF.1/archimedean-llc-gln`; algebraicity → `AF.4/c-l-algebraic`.
- **Boxer–Calegari–Gee–Pilloni 2021.** Item 227: (a) → `AF.4/bhr-large-weight`, (b) → `AF.4/mirkovic-tempered-coherent` with `AF.4/bhr-coherent-cohomology`, (c) → `AF.4/bhr-large-weight`.
- **Boxer–Calegari–Gee–Pilloni 2025.**
  - 5.7-algebraic-forms and 5.7.2 → `AF.5/algebraic-modular-forms`;
  - 1.8.21 (RACSDC) is AutomorphicGaloisRepresentationsPartII AG2.0's definition (regular algebraic, conjugate self-dual); AF.4 supplies its weights;
  - 1.8.12 (the ordinary GSp₄ normalisation) uses AF.4's C-algebraic weights but is a statement of the ordinary-modularity roadmaps;
  - 5.7-unitary-model (existence of the definite unitary group with prescribed local behaviour) is Galois-cohomological and belongs to the unitary-group or Shimura roadmaps;
  - 5.7.12 (uniform local fixed vectors) needs local Langlands (ET.6) and potential-ramification bounds; it belongs to the modularity roadmap that uses it.

  The last three are not AF material. They should be re-routed when the BCGP25 routes are next revised.
- **Scholze.** /80 → `AF.4/holomorphic-ds-sp2n-unn`.

## Requests (38) and gaps (9)

The requests are listed in the packet and the document. There is one per supplier layer used: the AdelicAlgebraicGroups node ids are cited directly, and the Tau Ceti layers appear as import requests.

The gaps are:
- smooth differential forms on manifolds (AF.1a invariant forms);
- Cartan–Iwasawa–Malcev for non-reductive Lie groups;
- unread proof sources: Dixmier–Malliavin; the Langlands classification and Harish-Chandra's discrete series; Knapp's archimedean correspondence; Vogan's unitary dual; Harish-Chandra's convolution lemma and finiteness (HC68, Borel–Jacquet); rapid decay of cusp forms; Borel–Wallach, BHR, Harris, Clozel and Pitale–Schmidt.

## Source issues

- **E1 (new, error).** Getz's notes print the Casimir ideal ⟨Δ − (k²−1)/4⟩ in Lemma 6.19, but their own §6.5 gives k(k−2)/4. Check at k = 2: the value should be 0.
- **E2 (new, misprint).** Getz's notes, Proposition 8.6: dim V^K = 1 should read ≤ 1.
- **E3–E9.** Already recorded by the paper extractions: Calegari–Geraghty E16 and E40, Pilloni E23/E151 and E159, Boxer–Pilloni E3 and E5, and Ding.

## Sources read and missing

Read, with URL and SHA-256 recorded in the packet:
- Getz's 2015 notes;
- Arthur's *Introduction to the trace formula*;
- Bernstein–Krötz;
- Langlands' *On the notion*;
- Wockel (arXiv:1401.1037), for van Est;
- the twenty routed papers' public versions;
- Franke and Vogan–Zuckerman scans, for orientation only.

Missing: Borel–Jacquet, Harish-Chandra LNM 62, Borel–Wallach, Knapp (Motives II), Vogan (Invent. 1986), Dixmier–Malliavin, BHR, Harris (1990, both papers), Clozel (1990), Pitale–Schmidt, Gross's *Algebraic modular forms* (the Springer copy is behind a paywall) and Hochschild–Mostow.

## What a follow-up should do

1. Read the missing proof sources and refine the gap-bearing nodes at lemma level when the roadmap reaches that level:
   - Bernstein–Krötz §§5–12;
   - Harish-Chandra's finiteness and rapid decay;
   - the Langlands classification;
   - the BHR and Harris computations.
2. Once a supplier for the smooth de Rham complex exists, replace the invariant-forms gap by a prerequisite.
3. In the Lean prototype, set up the explicit pairs (𝔤𝔩_n, O(n)) and (𝔰𝔭_4, U(2)). Then prototype `RealReductive.recGL`, `RealReductive.GL2.discreteSeries` and the GSp₄ discrete series, which are listed in comments now.
