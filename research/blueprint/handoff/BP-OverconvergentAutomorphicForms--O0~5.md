# BP-OverconvergentAutomorphicForms--O0~5: complete

Codex — `codex-ogCg4D`, 20 October 2026. Refs #11491.

## Submission summary

Complete target-level revision of O0–O7; this is not a checkpoint. Retained all
79 node ids: 5 definitions, 31 constructions, 5 lemmas, 23 theorems,
13 comparisons and 2 applications. The packet has 133 API items, 113 test
contracts, 32 planets and 38 pinned baseline citations. Every implementation
status remains unchecked. O1/O2/O4/O6 are closed; O0/O3/O5/O7 are planned.
Three precise gaps and two supplier requests remain, as accepted under
PROTOCOL §§0,3 by REV~4. No claim of an unconditionally closed roadmap is made.

Checked and retained REV~4's mathematical corrections and its independent
review object/history. Corrected two stale O7 attributions: the ordinary
unit-ball comparison after nondiscrete base change is owned by O7, whereas
P9 supplies tower descent. Removed the summary's claim that the older
assembly already agrees with this part. The suggested Lean file is unchanged:
280 lines, four proved examples, no sorry'd data, only carriers available at
the pins. It elaborated successfully; all 16 warnings are `declaration uses
sorry`. Packet validation reports zero errors/warnings; reader agreement
covers all 79 nodes and 2,675 field strings; intake file checks and
`git diff --check` pass. Follow-up work is the three inputs below and assembly
propagation, outside this revision's permitted files.

## Findings and retained corrections

The issue's stall-detector description predates the actual REV~4 verdict.
[REV~4](../reviews/REV-OverconvergentAutomorphicForms--O0~4.md) accepts the
complete plan with the three explicit gaps. Its corrections were already in
both deliverables when this revision started; they have been retained, not
represented as new work by this session.

| Finding | Retained contract |
| --- | --- |
| REV~3 exhaustive prototype requirement | Current WORKERS shape supersedes that requirement. Geometry and analytic carriers absent at the pins remain full reader targets; no artificial carriers or Lean theory development are introduced. |
| Strict admission endpoint | O2 and all shared domain hypotheses exclude the endpoint for p≥3. The p=3, m=1 acceptance test excludes both 1/9 and 1/3. |
| AIP torsor topology and valued lifting | O5/aip-torsor-structure-invariants works over X(ε), uses an étale splitting cover and its unit section, and obtains a point after finite separable residue-field extension. It does not call the positive-dimensional torsor projection étale. |
| Finite-character factor and descent | O5/finite-character-integral-generator forms the actual analytic weight product, distinguishes its split-cover integral eigenfunctions from integral module pullback, and uses the full Čech relation over X(ε). Γ₀* invariance alone gives only the intermediate quotient. Integral averaging requires invertibility of the whole group order. |
| Cusp higher vanishing | O6/hilbert-cusp-higher-vanishing uses the equivariantly split toric power map and ample vanishing, with the torsion-line extension stated in AIP ADIC Theorem 8.2. Neither unrestricted unit-group cohomology vanishing nor a finite étale trivialization of a p-primary torsion line is presumed. |
| Family expansions | O6/padic-hilbert-q-expansion retains the weight coefficient line D_{c,κ}, Tate/Igusa choices, cusp-unit action and support condition. Its sufficient injectivity condition meets every relevant finite ordinary Igusa component. The omitted-component non-example concerns unrestricted functions and does not assert noninjectivity on a descended eigenspace. |
| Arithmetic action scope | The shared hypotheses use quotient stacks, or the supplier's action-free coarse locus. N≥4 alone does not establish freeness of the polarization or diagonal action. |

The O7 proof and Heuer source match still called the remaining norm input a
P9 contract, despite the gap and coverage already assigning it here. Both now
state O7 ownership explicitly, in the packet and reader. This does not strengthen
the conditional comparison theorem or change its prerequisites. No target,
API, test, planet, source-issue verdict or independent review verdict was added
or removed.

## Exact remaining inputs

1. **O0 / LR.6:** the definite-unitary Hecke eigenvariety built from the coherent
   Jacquet dual, its dimension n·d_K, Cohen–Macaulay coherent sheaf and reducedness.
   Ding §4.2.2, Proposition 4.14, pp.66–68 uses the BHS and density inputs named
   in the existing LR.6 request. Generic Jacquet modules and character varieties
   are already supplied; the completed coefficient adapter is already O0's own
   target. The cited BHS results have not been independently established here.
2. **O3/O5, owned by O5:** integral base-local freeness of the full-character
   AIP sheaf at positive radius, including p-primary finite characters.
   Coherence, rational invertibility and a unit generator on a split cover
   do not prove this. Keep integral eigenfunction comparisons independent of
   freeness; retain the annulus non-example and the separate formal-lattice
   comparison obligation.
3. **O7, owned by O7:** for an ordinary finite-level formal chart after extension
   to nondiscrete perfectoid L, identify its completed integral coefficient
   ring with the power-bounded subring of its analytic algebra. Reduced
   special fibre proves this at a discretely valued level; O_L/ϖ need not be
   reduced. A spectral/tensor-norm comparison or a discrete comparison followed
   by completion is still required. Heuer Proposition 3.8 supplies the map,
   not this equality. The subsequent ordered-completion argument remains
   conditional on this input.

The second request names the existing ShimuraCompactifications C3.6a
algebraic-space formal-functions interface. It is an explicit supplier contract,
not a fourth gap or a new construction here. Preserve the reviewed supplier
boundaries and the O4/effective-arithmetic-descent import from the root packet.

## Reading and baseline checks

The source PDFs fetched in this session have exactly the SHA-256 values already
recorded in the packet. Fresh reading was limited to the following passages;
prior broader source-reading and independent-review records remain unchanged.
No source passage or source-by-section digest was added to the repository.

| Source | Fresh reading scope |
| --- | --- |
| [Ding](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | §4.2.2 and Proposition 4.14, pp.66–68: completed coefficients and the stated geometry dependencies. |
| [Heuer](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf) | Definition 3.7, Proposition 3.8 and its proof, p.16; Example 3.10, p.17: scope of the natural structural map and line effectivity. |
| [AIP ADIC](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | §6.4 and Theorem 6.7, p.29; §7.1, p.30; Theorem 8.2 and proof, p.35; §8.4 and Proposition 8.4, pp.36–37. |
| [AIP CUSP](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | Definition 3.12, Propositions 3.13–3.14 and Remark 3.15, pp.16–18; Appendix Definition 6.1, Proposition 6.2, Lemma 6.3 and Proposition 6.4, pp.31–33. |
| [Birkbeck–Heuer–Williams](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | Remark 6.9, p.1759; Definitions 7.5/7.9, Proposition 7.10 and Proposition 7.11 with its proof, pp.1760–1763; Proposition 10.8 and proof, pp.1791–1792. |

Read the reviewed O0–O8 library audit and the upstream AdicSpaces and
InductionRestriction reader documents as models. Rechecked the 38 baseline
statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`; no cited library scope was enlarged.
The current Tau Ceti tree (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) and the
nine post-snapshot roadmaps at TauCetiRoadmap main
`0d144d044dacebca17b654695b6f1ad58f159b27` were searched for overlapping
Hilbert analytic, Igusa, overconvergent and Jacquet targets. No matching new
construction was found. This is a scope search, not a claim to have audited
all newer library material. Previously reviewed open-PR supplier interfaces
were retained; this session does not claim a fresh review of those PR heads.
No upstream files were changed and no lake command was run in those trees.
No restricted book was used. No suspicious instruction was encountered in the
job's fetched source passages.

## Validation and assembly handoff

- `python3 scripts/check_blueprint.py research/blueprint/packets/OverconvergentAutomorphicForms--O0.json`: 0 errors, 0 warnings.
- Field-by-field reader comparison: 79 unique blocks, 2,675 matching strings;
  all definition/construction API, uses and at least three tests retained.
- `lean-check` on the suggested file: exit 0, exactly 16 warnings, all from
  theorem `sorry`; the four examples remain proved. Available memory exceeded
  20 GB before the check, and no Lean process remains running from it.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  0 problems. `git diff --check`: clean.
- The review object and review history are unchanged. No second job was claimed.

The root packet `OverconvergentAutomorphicForms.json` still fingerprints an
older O0 part (`fc95550cb4831f17c789dd1b4d7d2b69e3f7af7cd03ae6358e2c02ef920dcb54`).
An assembly follow-up must refresh the imported targets, reader, suggested-file
selection and fingerprint, carrying the REV~4 corrections above and the present
O7 ownership clarification. Keep the root's own effective arithmetic descent
node. This job cannot edit those assembly deliverables.

The submitted part's SHA-256 is
`4455aa9758a413876fa64c82bac5cd03179d0895fa9f18aec78a37a5feea2c58`.
The source scopes, outstanding inputs and integration action needed by the next
worker are all recorded here; no scratch artifact is required for resumption.
