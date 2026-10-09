# BP-AutomorphicSpectralTheory~2 — completed revision

Issue #6927. Agent: Codex, session `codex-sBFed2`, 9 October 2026.

This is a completed target-level revision for independent review, not a planning checkpoint. The packet is `complete`; all seven stages are `planned`, and none is `closed`. It retains all 190 input node IDs, their order, the existing independent `review` object and `reviewHistory`. The previous review's verdict remains in place for the next reviewer to replace. Every implementation status remains `unchecked`.

| Inventory | Count |
| --- | ---: |
| Definitions | 36 |
| Constructions | 37 |
| Theorems | 117 |
| API items | 223 |
| Unit tests | 219 |
| Planets | 38 |
| Pinned baseline declarations | 31 |
| Recorded gaps | 52 |
| Supplier requests | 22 |
| Source routes | 128 |
| Source-issue records | 37 |

The stage node counts are AS.0: 47, AS.1: 29, AS.2: 24, AS.3: 19, AS.4: 20, AS.5: 13 and AS.6: 38. Each stage's `remaining` list identifies its proof and supplier obligations. No admitted prototype is counted as proof closure.

## Changes responding to the independent review

**B1 — Schwartz continuation.** The suggested signature now starts with two holomorphic half-plane families, imposes finite vertical-strip order for every Schwartz seminorm with the uniformity in the source, and records their scalar entire extensions and reflected functional equation. Its conclusion constructs a unique global Schwartz-valued holomorphic family agreeing with the initial data. Pointwise scalar continuation alone is no longer the hypothesis. The packet and reader use the same conventions. Source: Beuzart-Plessis–Chaudouard–Zydor, Appendix A, Corollary A.0.11.1, pp.326–333.

**B2 — weak-dual continuation.** The suggested model uses a Banach space, a one-stage LF specialization, continuous initial functionals, a dense testing subspace and one common initial strip order. It constructs a continuous-dual-valued extension, with pointwise weak holomorphy, functional equation and uniqueness. It does not infer continuity of arbitrary algebraic functionals chosen outside the initial chamber. The general LF weak-dual topology and its analytic adapter remain explicitly recorded; weak holomorphy is not silently replaced by strong-dual holomorphy. Source: the same appendix, Corollary A.0.11.2.

**B3 — Fourier transfer.** The finite-group model uses the full complex character family, probability counting Haar and an actual normalized fibre average. The positive-dimensional model has a genuinely smooth periodic function and its Fourier coefficient decay, rather than an assumed decay conclusion. The circle square-cover tests apply the transfer, distinguish its two-element kernel and reject the unnormalized sum. Transport to all compact abelian Lie groups, including finite components, remains a named adapter. Source: Yu, §5.2.1–§5.2.3, pp.32–36.

**B4 — object tests.** Eighty-one packet test statements were revised, and the suggested tests now use the named object or an explicitly described specialization. The principal changes are:

| Stage | Object checks introduced or repaired |
| --- | --- |
| AS.0 | Direct-integral identity and an unbounded multiplication action; finite/infinite identity membership in the Hilbert–Schmidt ideal; an actual harmonic diagonal operator that is Hilbert–Schmidt but not trace class; final LF topologies and supported real-line stages; escaping translations as an unbounded LF family; a direct-sum operator family with unbounded pole orders; actual circle-cover transfer. |
| AS.1 | Normalized dilation and its Hilbert norm; convergent operator integrals, the spherical completed-zeta ratio and block-permuted source/target data; a torus pseudo-Eisenstein map and an excluded entire section; associate-data quotients; actual function-field section maps and norm compensation; the Eisenstein constant-term asymptotic; the excluded zero Fourier index; a growing Poincaré seed failing L²; weight-two inversion and cycle pullback; primitive/unrestricted lattice sums and character-pair cancellation. |
| AS.2 | A valuation-shell integral for the spherical local operator; opposite-operator compositions defining μ and its measure dependence; exterior/symmetric local-factor distinction and dual characters; function-field normalized maps on supplied slices; a resolvent acting on an eigenline. |
| AS.3 | A₂ root/dual-weight cutoff functions; a rank-one truncation datum; Weyl-normalized packet integrals; block projection, parabolic height and canonical-selector maps; Yu's exponent and cutoff-times-theta calculation. |
| AS.4 | Weyl-compatible fields and their weighted norms; residual-subspace membership and the non-L² cusp boundary; a discrete constant vector with quotient norm; distinguished representatives and their stabilizers. |
| AS.5 | Weighted graph domains and a sharp integrability boundary; the generalized-character functor on a Jordan block through the polynomial-action module; distinct exponent projections; coordinate dependence of a multivariable germ. |
| AS.6 | Periodized and truncated kernels; actual wall-family limits; weighted orbital integrals and quotient-measure scaling; weighted-character traces; height-dependent almost-compact support; relative cohomology and Euler–Poincaré scalar traces; the function-field degree cutoff, incompatible wall data and finite-cover kernel size. |

The restrictions at the affected nodes are part of their acceptance conditions. For example, the nonintegrable periodized-kernel test uses an infinite-volume quotient, not a claimed finite-volume automorphic counterexample; the Euler–Poincaré tests compute relative cohomology without claiming that noncompact cohomology is empty. The spherical shell and block-integral models do not construct the full local or adelic representation theory. The general carrier and source contracts remain visible.

DIT's smooth-seed counterexample now uses y² sin(exp(1/y)): its order-two value bound satisfies the positive-epsilon small-y condition while giving no uniform derivative bound. This distinguishes the value hypothesis from the differentiated majorants. Sources: Duke–İmamoğlu–Tóth, §5, equations (5.1)–(5.7), pp.961–962; §9, Lemmas 5–7, pp.979–980. Yu's two-block cutoff retains the multiplicative-character monomial and the linear theta factor; replacing that factor alone by a geometric-series denominator would lose the convention. Source: Yu, Appendix A, pp.75–77.

Gross–Zagier's character-pair series now states the odd negative fundamental-discriminant hypothesis of Chapter IV §2, equation (2.1), p.273, with primitive characters and weight 2k−1. The criterion adapter agrees with Tau Ceti: 12 is fundamental and 16 is not. The even value 12 tests the general criterion only; it is outside this particular odd-discriminant source theorem.

## Review corrections and ownership retained

The reader was rebuilt from the revised packet, including every declaration, hypothesis, proof outline, API, test, acceptance restriction, gap and supplier request. It now reflects the prior review's measurable-section hypothesis, general Herglotz source, compact spectral prerequisite, Whittaker/Gamma normalizations, modular Green indexing, derivative and residue conditions, component probability Haar, compact-Cartan hypothesis and owner corrections. Its source disputes are authored descriptions with locators, rather than copied passages. The packet's `sourceIssues.printed` fields also contain authored descriptions; independent source-issue verdicts are preserved.

Accepted RS-04 boundaries remain binding: AF.3 supplies cuspidal finite multiplicity, and ALS.5 supplies cuspidal cohomology. The removed duplicate `AS.5/cuspidal-cohomology-decomposition` is not restored. AF.2 supplies Flath factorization; AL.1 supplies the completed scalar functional equation. The requested classical packet, Shahidi-factor and quadratic-cycle extensions do not pretend that current ET/GN/AL carrier stages already prove those statements.

The assigned red-team findings are handled as follows:

- **RT-AREA-automorphic-1/4:** retain AS.2's μ-function and local-normalization targets and the real invariant/operator Paley–Wiener and multiplier targets. The proposed early AS.1a real harmonic-analysis prefix has independent AF.1 local representation and arbitrary-Levi induction inputs. It imports no ET.1 orbital theory or final trace formula. BDK remains with the proposed SmoothRepresentationsCharactersPartII supplier. The prefix is a restructuring proposal, not an invented integrated stage.
- **RT-AREA-automorphic-1/5:** construct the convergent intertwiner in AS.1 before constant terms; retain pseudo-Eisenstein square integrability, pairing and cuspidal-data decomposition before AS.2 continuation. The suggested integral tests now exercise the constructor. AS.3 constructs pointwise or truncated wave packets before Gram identities; the onto/completeness theorem remains AS.4. Source: Arthur, §12, Lemmas 12.2–12.4 and formulas (12.3)–(12.4), pp.64–66.
- **RT-AREA-automorphic-1/24:** ET.1 remains the single owner of unweighted centralizer-quotient orbital integrals. AS.6 integrates the actual weight against that quotient measure. Exporting the independent real prefix avoids a whole-stage AS.6/ET.1 dependency cycle.

The inherited round-3 fix-review obligations remain in the packet: independent local real induction, fixed-central versus full-height pseudo-Eisenstein theory, and source-qualified spectral signatures. A new AF.1 supplier request records the general supplied-Levi compact-picture interface; minimal principal series is insufficient. The source route `PAPER-BOXER-CALEGARI-GEE-PILLONI-21/335` was corrected to AS.1 induced data and AS.2 isobaric sums. Item 228 continues to route to Wallach cuspidality.

## Baseline and validation

Read the accepted AS.0–AS.6 library audit, all link-map entries mentioning these stages, and the complete CompactGroups and InductionRestriction upstream reader examples. The pinned declarations and their enclosing hypotheses were checked at Mathlib `082e2d3` and Tau Ceti `f790474`. Seven baseline citations were added: the test-function carrier and final topology, full finite-abelian complex character basis, endomorphism-evaluation polynomial module and its X-action, the initial zeta series, and Tau Ceti's fundamental-discriminant predicate. These are imported inputs, not duplicate planned definitions.

Validation completed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicSpectralTheory.json`: 0 errors, 0 warnings; all seven stages planned.
- `lean-check research/blueprint/suggested/AutomorphicSpectralTheory.lean`: exit 0, with only declaration-uses-sorry warnings. Available memory exceeded 20 GB and only one compilation ran at a time. Four unused Tau Ceti imports were removed; no dependency was built or fetched. The submitted file compiles using the available pinned Mathlib modules. Tau Ceti's discriminant criterion is an explicitly restricted adapter because its compiled import is unavailable.
- Retained node IDs/order, independent review/history and all `unchecked` statuses: unchanged.
- All 219 packet test names occur exactly once as suggested example markers; all test descriptions and node statements occur in the reader. Final comment synchronization changed no Lean declaration after the successful elaboration.
- `git diff --check`: pass. Only the four issue deliverables changed.

## Sources and where to resume

This revision re-read five checksum-matched public sources: BPCZ Appendix A.0.1–A.0.11, pp.326–333; Yu §§5.2.1–5.2.3, pp.32–36 and Appendix A, pp.75–77; DIT §5 and §9 at the locators above; Arthur §12, pp.64–66; and Gross–Zagier IV §2, p.273, checked against the rendered page. The packet retains the preceding workers' other source editions and reading scopes as inherited evidence. Those entries are not claims of fresh primary-proof reading by this session. No private library source was used, and no source files or passages are included in the repository.

The next independent review should inspect B1–B4 against the packet acceptance conditions, especially the restricted LF, compact-Lie, spherical-integral, relative-cohomology and adelic models. It should verify the retained review corrections, the discriminant/source normalization and the early real-prefix proposal before replacing the old verdict.

Proof closure must discharge the 52 individually named gaps and 22 supplier contracts. In particular: obtain and verify Franke–Schwermer's primary support theorem and the Hejhal/noncompact resolvent proof; supply Langlands residue-system and differentiated convergence estimates; complete general LF weak-dual and compact-Lie transport; obtain the original function-field residual/functional-equation inputs; supply local Harish-Chandra, Shahidi/classical-packet and BDK extensions; integrate quadratic-cycle and modular boundary adapters; and source the weighted orbital estimates, compact-quotient trace-class input and Borel–Casselman L²-cohomology prerequisites. The exact affected nodes are listed in each gap's `neededBy` and the stage `remaining` lists. Start there rather than treating stage carrier names as the missing theorems.
