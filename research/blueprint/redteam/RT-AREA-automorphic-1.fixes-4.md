# FIX-RT-AREA-automorphic-1~4

Codex, session `codex-Z0ErNN`, 7 October 2026. Refs #7280.

This report accounts for confirmed findings **RT-AREA-automorphic-1/1–/31**, using the verifier's qualified conclusions in [the review](RT-AREA-automorphic-1.review.json). Findings /32–/41 are outside this job.

The issue's premise that round 3 could not edit the blueprints is stale. [PR #7260](https://github.com/CBirkbeck/tauceti-explorer/pull/7260), merged as `ad42acee8dbe6ebde62e6cb6c0a307c3636458ea`, changed the packets, readers and suggested files as well as [the round-3 report](RT-AREA-automorphic-1.fixes-3.md). Those repairs are present at this run's starting commit, `4689b245`. I checked the current contracts rather than introducing duplicate nodes. Below, **retained** means the repair was already in the deliverable at the start of this run, not that it has been mathematically proved or independently accepted in every affected packet.

This round changes the AF, R16 and AS packet/reader/suggested triples: exact archimedean supplier imports, accurate Knapp reading provenance, and AS's stale classification-supplier description, including its repeated stage `remaining` entries. It adds no mathematical node or declaration and preserves existing APIs, tests, implementation statuses, source-version ledgers and independent review records. Missing proof interiors and missing supplier interfaces remain explicit. The issue's named blueprint revisions carry them; this fix does not certify their mathematical closure.

## Finding-by-finding disposition

### /1 — GL₃ prerequisites for Langlands–Tunnell: retained

R17.4 has `adjoint-lift`, `cubic-character-induction`, `gl3-recognition` and `nonnormal-cubic-base-change`. AL.3 supplies distinct `gln-converse-full-rank` (n≥2, twists through n−1) and `gln-converse-reduced-rank` (n≥3, twists through n−2) contracts. The reduced-rank contract distinguishes empty S, giving a cuspidal representation, from nonempty S, giving agreement outside S. Its admissible tensor, central character, initial convergence and completed analytic hypotheses remain. R16.5 uses the full-rank GL₂ contract.

The R17 reader retains the corrected unitary cuspidal pole comparison, not uniqueness for arbitrary objects from local data. AL's generic reduction/opposite-mirabolic proof obligations and the highly ramified T variant needed for Gelbart–Jacquet remain explicit gaps. R17.4a and AL.3b are proposed splits, not installed stages. No cyclic-base-change substitute for the non-normal cubic construction is introduced.

### /2 — One archimedean classification owner: repaired residual drift

AF.1 already owns `weil-group-real`, `langlands-classification`, `discrete-series`, `gl2-real-discrete-series`, `archimedean-llc-gln` and `casselman-wallach-globalization`. The proposed AF.1b suffix keeps classification and globalization together after the independent algebraic prefix. AL.1 retains rank-one Tate theory.

R16.2 `archimedean-classification` now imports the exact current AF Weil, GL₂ discrete-series, GLₙ correspondence and globalization nodes. R16.3 `archimedean-factor-comparison` now imports `AF.1/archimedean-llc-gln` rather than the entire AF.1 stage. Their statements, proof steps, source matches and reader prerequisites agree. These two consumers are removed from the pending whole-stage request; its separate converse, algebraic-weight and quaternionic/weight-one consumers remain. The suggested file records the same boundary.

AF's LLC proof outline and reader no longer describe Knapp's publicly accessible survey as unavailable/unread. They distinguish its explicit parameter constructions and bijection statements from the still-missing original classification/discrete-series proofs and faithful native signatures. The packet's source-access gap was already accurate; the reader and proof outline now agree with it. `BP-AutomorphicFormsOnReductiveGroups~2` and `BP-AutomorphicLFunctionsAndLocalFactors~2` retain their original-source/interface obligations. No competing AL classification owner is created.

### /3 — Lazard and Iwasawa dimension foundations: assigned outside deliverables

The issue assigns this to `BP-CompletedCohomologyPartII--CC.0`. No CC or NE packet is an authorized deliverable. The required supplier is one NE.0/L1 successor for compact p-adic analytic groups, suitable open uniform subgroups and left/right noetherianity over the applicable p-adic integer coefficient ring. Grade, Auslander regularity and descent require their own coefficient and p-torsion hypotheses. Powerful-group cohomology alone is not a noetherianity proof. No arbitrary-profinite-group theorem is claimed and no second foundation packet is written here.

### /4 — Local Paley–Wiener and normalization inputs: retained, supplier description synchronized

AS.6 has `real-invariant-paley-wiener`, `real-operator-paley-wiener` and `spectral-multiplier`. The AS.1a proposal extracts them before both ET.1 and the final AS.6 orbital/trace constructions. AS.2 keeps `mu-function` and `local-normalization`, including their measure-dependent conventions. The nonarchimedean BDK input remains a request to `SmoothRepresentationsCharactersPartII`.

AS's gap formerly said AF.1 supplies no real classification. It now names AF's existing classification, discrete-series, correspondence and globalization plans while retaining their proof/signature gaps. The three repeated stage `remaining` entries, reader and suggested note are synchronized. The additional Harish-Chandra estimates, rank-one continuation, μ/Plancherel scalar and integrated L¹ bounds remain separate obligations, with `BP-AutomorphicSpectralTheory~2`; an available representation carrier does not prove them.

### /5 — Pseudo-Eisenstein and wave-packet foundation: retained

AS.1's `convergent-intertwiner`, `pseudo-eisenstein`, `pseudo-eisenstein-l2`, `pseudo-eisenstein-inner-product` and `cuspidal-data-orthosum` precede the AS.3 wave-packet construction and Gram calculation; continuation and the AS.4 onto theorem come later. The conjugate-first inner-product convention, including the conjugated Weyl action in its formula, is retained. Packet and reader distinguish initial convergence from eventual spectral completeness. The source and analytic proof leaves remain with `BP-AutomorphicSpectralTheory~2`.

### /6 — Kostant and boundary Lie cohomology: retained

ALS.4's `nomizu-van-est` and `boundary-stratum-cohomology-formula` request the independent AF.1a cochain owner: a full absolute complex over a characteristic-zero field E, coefficient change and the precise Kostant calculation. The existing relative complex over ℂ and pinned low-degree absolute cochains are not called the missing full complex. Normalizer equivariance and lattice comparison maps remain required. No integral or mod-p Kostant theorem is inferred. The ALS handoff retains this boundary; AF's recorded extension request keeps a single owner.

### /7 — Strong approximation's local ingredient: retained

AA.4 `strong-approximation-sufficiency` requests RG2.4's local Kneser–Tits input before the global argument. Simply connected, absolutely almost simple and noncompact-S hypotheses remain; the local characteristic-zero isotropic range is not silently extended. `BP-AdelicAlgebraicGroups~2` carries original proof closure and the precise local interface. The global theorem is not credited to the local result alone.

### /8 — Global Fourier expansion and mirabolic Eisenstein series: retained

AL.3 owns `gln-fourier-expansion`, `mirabolic-eisenstein-series` and `mirabolic-functional-equation`; GL₂ consumers import them. The mirabolic poles depend on the character, not universally on s=1. Generic reduction, opposite-mirabolic sums and their convergence for the converse theorem remain separate recorded obligations. `BP-AutomorphicLFunctionsAndLocalFactors~2` carries the remaining decomposition; no competing R16 construction is introduced.

### /9 — Ordinary multiplicity one before the converse: retained

R16.4 `global-whittaker-expansion` imports `AL.3/gln-fourier-expansion`; R16.4 `strong-multiplicity-one` imports `AL.3/strong-multiplicity-one`. Ordinary multiplicity one remains distinct from the strong theorem. Neither input is routed backwards through R16.5's converse theorem. No change was needed to these already-corrected exact imports.

### /10 — Automorphic prerequisites of global integrals: retained

AL.2/3 retain AF.3 requests for cuspidality, rapid decay and global genericity, the AA quotient/restricted-product inputs, and the smooth contragredient carrier. AL owns the actual unfolding and global integral proof. `BP-AutomorphicLFunctionsAndLocalFactors~2` retains the convergence and carrier obligations; merely having these imports does not establish all integrability/interchange estimates.

### /11 — Classical/adelic transfer and infinity: retained

R17.3's global Jacquet–Langlands, multiplicity and rational-model contracts import R16.4; R17.5 imports the R16.6 classical/adelic dictionary. The requests explicitly retain weight-one limits and the totally real extension. Finite-place matching is not claimed to supply those archimedean or classical cases. No duplicate dictionary or transfer node is needed in this round.

### /12 — Definite and indefinite quaternionic comparison: retained

R18.3 `definite-jl` and the R18.4 cohomological eigenspace and definite/indefinite comparison contracts import the exact R17.3 transfer, infinity and rational-model suppliers. Norm-character exclusions and actual coefficient models remain. This is not an equivalence of all integral torsion cohomology. The existing requests remain pending where the supplier needs the wider totally real range.

### /13 — Critical values and periods: retained; p-adic consumer assigned

AL.5 `critical-value-period-interface` imports the actual algebraicity owners; AL.3 supplies rational Whittaker/cohomological period interfaces. Rankin–Selberg periods are not attributed to an unrelated single-factor algebraicity theorem. The p-adic consumer correction is assigned to `BP-AutomorphicPadicLFunctions`; AL's remaining proof/interface work is assigned to `BP-AutomorphicLFunctionsAndLocalFactors~2`. The recorded boundary avoids a full AL.5↔L1 cycle.

### /14 — Fourier ownership for R16.1: retained; atlas reconciliation for maintainer

R16.1 imports AL.0's Fourier/Schwartz–Bruhat theory. AA.0 owns Haar measures, AA.1 adelic points and AA.2 quotient carriers. No second harmonic-analysis owner is introduced. RS-21's owner-entry reconciliation concerns the base/uninstalled restructuring and remains a maintainer action; the issue does not authorize edits to atlas data or campaign documents.

### /15 — Scholze's actual perfectoid comparison: assigned outside deliverables

`BP-CompletedCohomologyPartII--CC.8` and `BP-TorsionCohomologyInfrastructure` carry the correction. Scholze IV.2.1's almost O_C perfectoid comparison belongs to TC.2 with its actual geometry and trace assumptions. CC.8's generic fixed-exponent transport takes a supplied comparison; it is not the same theorem. Neither packet is authorized here, so their source-qualified correction is recorded rather than implemented in base data.

### /16 — Geometric comparison versus generic tower transport: assigned outside deliverables

`BP-CompletedCohomologyAndLocalGlobalCompatibility` and `BP-CompletedCohomologyPartII--CC.8` carry this boundary. CC.8 supplies generic transport conditional on a comparison; R31/TC.2 supplies the actual geometric instances. Preserve the existing Ichino–Prasanna proposed geometric comparison owner instead of adding another one in CC.0. No out-of-scope packet is written.

### /17 — Banach/Schikhof duality: assigned outside deliverables

`BP-CompletedCohomologyPartII--CC.0` and `BP-PadicLocalLanglandsForGL2Qp` carry one general compact-group Banach/Schikhof duality and admissibility interface alongside the completed algebra foundation. Preserve K[[G]]=K⊗_O O[[G]] and prove compact-open independence before locally compact applications. These are not GL₂-specific definitions and are not consequences of bare finite generation. The present deliverables contain no CC/R30 packet to edit.

### /18 — Finite local factors versus completed Hecke topology: retained producer; assigned consumer

IHG.2 `finite-hecke-local-factors` already treats a finite commutative algebra over a complete noetherian local coefficient ring. It is not an inverse-limit topology theorem. IHG's existing handoff explicitly leaves completed Hecke ownership to CC.8. `BP-CompletedCohomologyPartII--CC.8` and `BP-CompletedCohomologyAndLocalGlobalCompatibility` carry compatible towers, maps and topology. Gee–Newton's patched Proposition 3.4.16 is not promoted to arbitrary tower CC.4. No change to the finite producer was necessary.

### /19 — Quadratic/quaternionic see-saw instance: retained

MP.6 has `quadratic-quaternionic-norm-instances`, `toric-theta-pairing-interface` and the global see-saw input to GZ.5's `coherent-quaternionic-specialization`. Binary/ternary, anisotropic/split and regularized ranges, as well as constants and measures, remain explicit. No reverse import from the GZ period conclusion supplies the MP construction. `BP-MetaplecticAutomorphicForms--MP.0~2` and `BP-GrossZagierAndArithmeticHeights--GZ.0~2` carry the remaining source/signature and analytic proof work.

### /20 — One Jacobi owner: retained with the exact missing specialization explicit

MP.6 already has the reusable Jacobi group, form-space, Fourier–Jacobi extraction and theta-decomposition interfaces; MP.8 keeps its particular cover/application. QM.1's eight requests remain pending: the adelic integral-index interface does not yet supply its discrete/matrix-index, cusp, half-index and Skoruppa specializations. The packet and reader agree on that limitation. Skoruppa's finite-image Γ action and dual finite Weil module remain in the requested contract. Existing half-lattice/odd-theta suggested examples are retained.

The MP.7/QM special-function repairs use exact I/J and AS Whittaker nodes. Remaining theta-nonvanishing, K-function and coarse dependency feedback are still recorded gaps. The unitary L2s consumer is assigned to `BP-AutomorphicCongruences--L0`; no separate L2 edge is inferred from the nested L2s extraction. `BP-MetaplecticAutomorphicForms--MP.0~2`, `BP-MetaplecticAutomorphicForms--MP.8~2` and `BP-QSeriesPartitionsAndMockModularForms~2` retain their assigned work. The earlier narrow ownership acceptance does not accept the entire QM packet: its broader `needs_changes` review is preserved.

### /21 — Linear representation infrastructure for theta: retained

MP.3 requests the SR smooth category, induction/Jacquet/admissibility infrastructure and AF real modules. Linear results are reused via the actual splitting/cover bridges. Cover-specific admissibility, finite length and Howe duality retain their source-qualified and residual-characteristic limits; they are not automatic SR consequences. `BP-MetaplecticAutomorphicForms--MP.0~2` carries closure.

### /22 — Existing quadratic-invariant supplier: retained

MP.2 imports immutable upstream `QuadraticFormInvariants` layer 6c, including Hilbert symbols and local Hasse invariants in the dyadic range. The real and complex formulas are separately scoped; discriminant/Weil-index convention bridges remain MP work. No upstream carrier is re-planned or renamed. `BP-MetaplecticAutomorphicForms--MP.0~2` retains the detailed source/signature obligations.

### /23 — Growth estimates before theta kernels: retained

MP.5 imports AA.3 heights/reduction and AF.3 cusp rapid decay before its theta kernels; MP.6/7 inherit them. MP retains the actual transfer to the cover, convergence, regularization and permitted interchanges. Generic rapid decay is not credited as convergence of every theta integral. `BP-MetaplecticAutomorphicForms--MP.0~2` carries the remaining analytic work.

### /24 — Ordinary and weighted orbital-integral boundary: retained

AS.6 `weighted-orbital-integral` imports ET.1's ordinary quotient-centralizer integral. Nonconstant weights, discriminants, centralizer choices and singular/limiting requirements remain AS work. The AS.1a proposal in /4 supplies real Paley–Wiener theory earlier; it does not import ET.1 or later AS.6 results. `BP-EndoscopicTransferAndUnitaryTraceComparison--ET.0` and `BP-AutomorphicSpectralTheory~2` carry integration. Whole-AS.6→ET.1 is not used as the combined repair.

### /25 — Wigner and Vogan–Zuckerman inputs: retained

AF.4 has `wigner-lemma`, `vogan-zuckerman` and `borel-wallach-tempered-range`. Infinitesimal/central-character compatibility, unitary hypotheses and the chosen central quotient stay in the statements. Hermitian bigrading is separate. Neither the tempered interval nor the unitary classification is asserted for all cohomological representations. `BP-AutomorphicFormsOnReductiveGroups~2` retains the original proof decomposition; its failed broader review is unchanged.

### /26 — Hyperspecial fixed lines before Flath: retained

AF.2 `spherical-dimension-one` imports SR.4, the applicable SR.1 input and AA.1 `integral-model-exists`, and precedes `flath-factorization`. The dim≤1 assertion is at the supplied hyperspecial places, not every compact open. The admissible Flath theorem is not replaced by the narrower unitary tensor-factorization result. `BP-AutomorphicFormsOnReductiveGroups~2` retains the supplier/proof obligations.

### /27 — Integral boundary Satake: retained

ALS.4's parabolic Hecke comparison imports SR.2 and SR.4; RG2.4's Iwasawa input comes through the supplier. The integral transform is unnormalized, with the modulus half-character recorded separately. No integral square root of q or complex admissibility is silently imported. The existing ALS revision/handoff retains these conventions together with the characteristic-zero Kostant boundary in /6.

### /28 — Neat levels before quotients: retained

AA.4 already plans neat elements, representation independence, stability, torsion-freeness, neat levels and normal neat-level existence. Neat compact opens are tested on all rational intersections, not all p-adic elements. The early `AA.4:neat-levels` proposal exports to ALS.0, D5 and V0; effective-action and central-unit caveats remain. `BP-AdelicAlgebraicGroups~2` carries Borel's original proof closure and the actual split integration. No backward V0 import is introduced.

### /29 — Independent algebraic cochain prefix: retained

AF.1a already owns `gk-pair`, `gk-module`, `relative-lie-cochain-complex` and `relative-cohomology-functoriality`, with the minimal compatible data before analytic globalization. AF.1 imports this prefix, which is also exported to AS.5 and BorelRegulators. /6's absolute/Kostant extension is a distinct request to the same owner. RS-04's base owner reconciliation remains a maintainer action; `BP-AutomorphicFormsOnReductiveGroups~2` retains the blueprint obligations.

### /30 — Local weights before global rationality: retained

The `AF.4:local-weights` proposal separates algebraic weights, coefficient lattices, cohomological modules, Wigner and Vogan–Zuckerman from late rationality and torsion eigenclasses. The latter import actual ALS.1/3/5 and AS.5 comparisons. The local prefix imports neither the rationality conclusion nor a later ALS/AS.5 theorem. General-group rationality remains conditional on its actual source hypotheses, distinct from GLₙ.

The recorded ALS comparison/application boundary and ALS.5↔AF.4 caveat remain. Proposed splits require maintainer integration; no whole-atlas acyclicity claim is made. `BP-AutomorphicFormsOnReductiveGroups~2` retains the remaining proof work.

### /31 — Algebraic forms and quaternionic specialization: retained

R18.3 `definite-specialisation` imports AF.5 `algebraic-modular-forms` and `algebraic-modular-forms-structure`, with an additional request for the adelic central quotient when units have positive rank. Generic coefficient function spaces, Hecke actions and level maps remain AF outputs. R18 keeps class sets, effective stabilizers, integral pairings, Taylor–Wiles freeness, dyadic tests and Jacquet–Langlands. A finite double-coset set is not a freeness proof. `BP-AutomorphicFormsOnReductiveGroups~2` retains the general producer revision.

## Sources and library boundary checked this run

I consulted the reviewed coverage entries for AA.4, AF.1/1a/4, AL.3, ALS.4, MP.6 and QM.1 before changing contracts. Their missing/partial general representation and cohomology targets are not treated as built. The continuous group cochains already recorded for AF.1a are a different input from the requested full Lie complex and Kostant theorem.

The library baseline remains Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the pinned Mathlib statements for `TopRep.homogeneousCochains`/continuous cohomology and `LieModule.Cohomology.oneCochain`, `twoCochain`, `d₁₂`, `d₂₃`, `twoCocycle` and `d₂₃_comp_d₁₂`. These existing declarations do not provide the full absolute complex/Kostant extension requested in /6. This round adds no baseline claim or duplicate construction.

Source passages revisited, without claiming a fresh full-paper extraction:

- [Knapp's public author-hosted survey](https://www.math.stonybrook.edu/~aknapp/pdf-files/motives.pdf), physical PDF pages 11 and 14, printed pp.403 and 406: the real parameter construction/Theorem 2 and complex construction (4.5)/Theorem 5. Read 7 October 2026. SHA-256 `684de4bcfc50e448fe52fddc863392012581b43097f40f8bcc4c83dbc5a2dfbb` agrees with the packet's previously read copy. The existing §§2–4 reading record is retained; this run does not claim to have reread every page in that range. Neither the original Langlands proof nor a complete classification/local-factor proof audit is supplied by this correction.
- [Cogdell's author survey](https://people.math.osu.edu/cogdell.1/PSCT-www.pdf), §2 and Theorems 3.1/3.3 in §3: the two twist ranges, initial hypotheses and empty/nonempty-S conclusions used for /1. The original JPSS/highly ramified proofs remain distinct gaps.
- [Skoruppa, arXiv:0707.0718v1](https://arxiv.org/pdf/0707.0718v1), Theorem 5 and its surrounding §4 conventions: the finite-image module and dual finite Weil factor in /20. No published-version collation or broader Jacobi supplier completion is claimed. Existing source issues and their version scope are preserved.

## Validation and review limits

All thirteen issue packets pass `python3 scripts/check_blueprint.py <packet>` with **0 errors and 0 warnings**. Their `sourceIssues`/`sourceVersions` ledgers also pass `scripts/check_errata.py`'s `check()` when wrapped as `errata-v1` under their actual `roadmapId` (part filenames are not separate errata namespaces). JSON parsing and `git diff --check` pass.

The exact-node prerequisite closure of the four AF suppliers used by R16 reaches **56 nodes**, contains no GL₂ consumer and has no exact-node cycle. It leaves **67 stage/baseline frontiers** unresolved by that traversal. This is a scoped check of the changed imports, not proof of whole-atlas stage acyclicity. The existing split proposals and boundary gaps remain necessary.

The three touched suggested files were attempted sequentially with `lean-check`, with more than 20 GB memory available before every attempt:

| File | Result in this run |
| --- | --- |
| AutomorphicFormsOnReductiveGroups | Elaborates; 38 warnings, all `sorry`. |
| GL2AutomorphicRepresentationsAndTransfer--R16.1 | Elaborates; 140 warnings, all `sorry`. |
| AutomorphicSpectralTheory | Fails before elaboration: shared build lacks `TauCeti.Analysis.Semigroups.Group.Stone.Unbounded`'s object file. |

AF and R16 import Mathlib modules only and were checked at the exact Mathlib pin. The shared Tau Ceti source checkout is newer than the pinned source baseline, and AS's needed compiled module is absent; **AS is not certified to elaborate at the Tau Ceti pin**. No library build, update, cache download or language server was started. The other ten suggested files are unchanged; their historical round-3 results are not presented as new compilation results.

No review is promoted by this fix. In particular, a valid packet and elaborating `sorry` signatures do not certify a source-decomposed proof, faithful missing native interfaces, a mathematically closed stage or the entire QM packet. The exact remaining obligations and assigned owners above are the handoff to independent review and the separate blueprint revision jobs.
