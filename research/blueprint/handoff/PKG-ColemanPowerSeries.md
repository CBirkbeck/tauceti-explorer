# PKG-ColemanPowerSeries — complete

Codex, session `codex-en7g7F`, 19 October 2026. Refs #10760.
The claim was confirmed by the bot on [the claim comment](https://github.com/CBirkbeck/tauceti-explorer/issues/10760#issuecomment-6267568124).
This is the completed package, not a checkpoint. Only the three package files and this handoff are delivered. The next step is independent package review; no further implementation is claimed.

## Deliverables and coverage

- `research/blueprint/packages/ColemanPowerSeries/README.md`: five layers in upstream form, exact supplier contracts, statements, hypotheses, proofs, APIs, checks, examples, source conventions and bibliography.
- `research/blueprint/packages/ColemanPowerSeries/Suggested.lean`: 430 lines; seven light definitions with real bodies, native-carrier milestone statements and examples; heavy constructions listed in its closing comment. One outer namespace, with arithmetic/series and base/unramified subnamespaces.
- `research/blueprint/packages/ColemanPowerSeries/metadata.toml`: `topic = "math.NT"`.

Inputs were the complete assembled reader and suggested file, the three accepted packets `ColemanPowerSeries.json`, `ColemanPowerSeries--L0.json`, `ColemanPowerSeries--L1.json`, their review/assembly records, and the library audit. The assembly was by a different session. The package retains 478 of the 482 input targets, all 336 API entries and all 348 named checks, including checks attached to theorem targets. All 86 original definitions/constructions have at least three checks and appear as declarations or in the closing Lean comment. Five explicit arithmetic comparison sections bring the output to 483 numbered subsections, distributed 236/124/45/47/31 across Layers 0–4. Three of those sections add constructions, each with an API and at least three discriminating checks. Original worked examples and mathematical hypotheses are retained. Repeated hypotheses are carried by the adjacent prose and the standing conventions.

Namespaces were reconciled to `TauCetiRoadmap.ColemanPowerSeries.{Series,Arithmetic,Unramified,UnramifiedSeries}`. No packet, reader, shared supplier package, atlas data or upstream checkout was edited.

## Current-library and upstream audit

Baseline statements were checked at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The duplication audit also used current TauCetiRoadmap `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read only. Searches covered the mathematical objects across the current roadmaps and Completed roadmaps, including the nine roadmaps missing from the atlas snapshot. LocalFieldsRamification, LocalGaloisGroups and ProfiniteArithmetic supplied the detailed local-field, cyclotomic and native-action comparisons.

Four exact duplicates were deleted, subsequent subsections renumbered, and their consumers redirected to the scope boundary:

1. `ColemanPowerSeries:L0/shifted-cyclotomic-constant`: LocalGaloisGroups Layer 0's shifted prime-power cyclotomic calculation, including constant coefficient p.
2. `ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein`: the same Layer 0 Eisenstein calculation.
3. `ColemanPowerSeries:L0/local-cyclotomic-irreducible`: current `TauCeti.irreducible_cyclotomic_prime_pow_ratPadic`, `TauCeti/NumberTheory/Cyclotomic/Irreducible.lean`.
4. `ColemanPowerSeries:L0/local-cyclotomic-degree`: current `TauCeti.finrank_cyclotomic_prime_pow_ratPadic`, `TauCeti/NumberTheory/LocalField/RootsOfUnity/Cyclotomic.lean`.

No removal stubs remain. Kept specializations add chosen-root, integral-basis, inclusion, residue, valuation-normalization or Frobenius coherence beyond the generic supplier theorem. Current finite-extension integer-ring comparisons, integral norm/trace comparison and unit-norm continuity are cited through their actual modules. Current pro-p powers and completed actions are used through ProfiniteArithmetic and PMIA, including PMIA Layer 1's exact Dirac-preserving weak-measure/native-completed-algebra equivalence. The native completed-algebra map/projection theorems are in `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/{Map,Basic}.lean`.

The prerequisite order was checked against `upstream/CaraianiNewton.md`. IntegralIwasawaTheory supplies only its Layer 0 global cyclotomic objects and finite cyclic-generation theorem, from `readmes/IntegralIwasawaTheory--I.8.md`; its later arithmetic layers consume Coleman. No result was moved upward, and no FoundationsAndLibraryIntegration or UPSTREAM placeholder remains.

## Arithmetic interfaces made explicit

The input's residual receiving obligations were resolved at the roadmap level, without assuming the norm/evaluation square or a Coleman equivalence as input:

- **Chosen-root integer rings:** identity-on-field-values comparison of the integral closure and canonical integer ring, coherent on roots, scalars, tower inclusions, residues and the two equivalent positive-power norm topologies.
- **Chosen integral generators and relative basis:** the absolute integral-generation proof now clears powers of the coefficient uniformizer p and uses Mathlib's root-level `mem_adjoin_of_smul_prime_pow_smul_of_minpoly_isEisensteinAt`. The relative basis is genuinely the p vectors `ρ_(n+1)^i` over `O_n`, obtained by monic division and field-degree independence, with its compact/Hausdorff coordinate homeomorphism. It is not the absolute basis of length d_n.
- **Specialization and lifts:** multiplication matrices compare integral and field norms/traces; the fixed-root Frobenius acts entrywise. Absolute integral coordinates and the residue isomorphism give polynomial unit lifts with unit constant coefficient. These precede matrix specialization of the series norm.
- **Independent O-valued averaging:** extend PMIA's integral bounded ψ through a finite ℤ_p-basis of O, prove basis independence by polynomial density, and compare coefficient Frobenius, reduction and Amice. The formula `τ=pψ_O` is proved afterward, not used as its definition.
- **Actual plus algebra:** identify `e⁺Λ(G)` (identity e⁺) with `Λ(G/⟨−1⟩)` by the native quotient map and finite-level averaging. The direct-factor decomposition preserves regular denominators and transports the independently normalized pseudomeasure and its numerators. This is the specific arithmetic comparison, not a second general completed-algebra construction.

The chosen-generator augmentation identity has an explicit compact principal-ideal/dense-Dirac proof. Finite-flat change is proved for the actual sequence by flatness and finite-product tensor/completion comparisons, with both endpoints A(1). It is distinct from the arithmetic tower over an unramified coefficient field. These additions do not require an unverified generic interface from PMIA. The original packet request objects are untouched; their package resolutions are the cited supplier contracts and the local comparisons above.

## Source reading and provenance

All repository prose is in our own words. No source passage or source file is included. The supplied library index was read before using the sources. Public source texts were fetched freshly on 19 October 2026; Coleman was checked against the original journal page images. Relevant arguments read include:

- Coleman, Theorem 4 and Corollary 5(i), p.98; Theorem 11 and Corollary 12(ii), p.102; Lemma 13 and equation (2), p.103; Proposition 14 and Theorems 15–16/Corollary 17, pp.104–106.
- Rodrigues Jacinto–Williams, §§9–10, pp.161–170; §§12.1–12.5, pp.177–189, including Lemmas 12.14–12.15, Theorem 12.17 and Lemmas 12.20–12.22/Theorem 12.23. Earlier smoothing and bounded-operator conventions remain precisely located in the README.
- Sharifi, Iwasawa Theory, §5.4, pp.143–147, and the semilocal discussion in §6.1, pp.157–158.
- Sharifi, Algebraic Number Theory, Eisenstein material in §5.4, Proposition 6.1.25, p.120, and Lemma 6.3.5, p.130.
- Coates–Sujatha, §§2.1–2.4, pp.13–26, including the preparation/nonzero qualification, norm precision, fixed-space boundary and residual logarithmic-image arguments. The public academic-hosted copy is linked in the provenance table below.

Fresh source fingerprints:

| Source | Public copy | SHA-256 |
| --- | --- | --- |
| rjw | [source](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) | `78d0479b4b7e3f03d2f9c9a75a772ebd75b58091a3b4f8a1558869b8283b44a6` |
| sharifi-iw | [source](https://math.ucla.edu/~sharifi/notes/iwasawa.pdf) | `e5308be4c3d9ded6002cefb50df64b31f62b584b6ff68be7f21dc939f2508c26` |
| sharifi-ant | [source](https://www.math.ucla.edu/~sharifi/algnum.pdf) | `153c8bb9be0f56a73b85cd9d192ec4b6360ce1dfeda3fd4babd7ee77aeb64f20` |
| coates-sujatha | [source](https://www.math.mcgill.ca/darmon/courses/16-17/gs/Coates-Sujatha.pdf) | `38178a8a147169c3750b7693c46c7453954790b101b37c2690f8e8cda91b0789` |
| coleman-manifest | [source](https://manifests.sub.uni-goettingen.de/iiif/presentation/PPN356556735_0053/manifest?version=29486bf2) | `1379d97771494aa7ad8e098ad5cd4a301cb27a3f59e6b396dd8a6f653eb76e40` |

The Sharifi Iwasawa PDF differs in bytes from the parent packet's 10 October snapshot, but agrees with the later assembly snapshot and retains the cited §5.4 numbering. The source-convention discussion is scoped to the version actually read. It retains all input mathematical corrections, without extraction ids or review narrative.

## Adversarial mathematical pass

Checked the failure cases against the actual statements and source proofs:

- Every-prime algebra retains `N(Y)=sY`, `N(T)=sT`, `s=(−1)^(p−1)`, and the signed Tate coordinate `sρ_n`. At p=2,n=0 the latter is 1; higher coordinates detect the Tate line. Norm compatibility is separate from squaring compatibility.
- Level n has root order p^(n+1); neither unramified interpolation nor finite-level unit lifting evaluates level zero at zero. The π_n do not tend to zero: uniqueness uses nonzero preparation and growing minimal-polynomial degrees.
- Φ fixes coefficients, Σ is arithmetic p-Frobenius, and `M=Σ⁻¹N`. Interpolation has the positive σ_n^n twist and its inverse the negative twist. Non-prime-field residue examples reject q-Frobenius, stationary Teichmüller sections and the wrong twist.
- Norm and trace are base-valued for the rank-p substitution algebra. The root product is embedded by Φ after coefficient extension; convergent translation has topologically nilpotent, not necessarily zero, constant coefficient. Matrix-entry transport is coefficient extension composed with Φ, and Vandermonde cancellation needs nonzero determinant, not invertibility.
- The finite residue-unit factor of full U∞ is retained; only the actual principal pro-p subgroup receives the native ℤ_p-module/completed action. Arbitrary modules and coordinate-surjectivity assumptions are not substituted.
- Weighted derivative formulas, characteristic-p kernel counterexamples, the factor p^r in the first nonconstant substitution coefficient, residual Euler corrections and closed-image arguments retain their necessary hypotheses.
- Raw Coleman sends c(a) to −λ_a; normalized Coleman is its negative. The terminal map is first moment, not mass. Odd-prime full kernel is μ_(p−1)×ℤ_p(1); the principal kernel is the Tate line.
- Real/principal closure distinguishes the real torsion −1 from p-power torsion. Teichmüller adjustment need not be globally real. Inverse cyclicity uses nested nonempty compact coefficient fibers, rather than commuting inverse limits with spans without proof. The plus Tate part is zero and the actual unit quotient remains on the left of the final equivalence.

Ten representative Lean signatures were compared to the README: coordinates injective/surjective, signed norms, trace powers, residue Frobenius, near-one gain, iteration precision, corrected limit, embedded root product, and arithmetic interpolation; the boundary-range and finite-span closure signatures were also checked. The interpolation statement exposes the actual native integral-closure carrier, relative basis, coherent inclusion, degree, continuous evaluation, Frobenius/norm and polynomial-unit-lift inputs, and does not assume norm/evaluation compatibility.

## Validation and remaining work

- All three `scripts/check_blueprint.py` input checks: **0 errors, 0 warnings**. Their unchanged bookkeeping gaps/requests are not a claim of formal implementation; the package-level resolutions are documented above.
- Final `lean-check` on `Suggested.lean`: **exit 0**, exactly 30 warnings, all `declaration uses sorry`. Available memory was 85 GB before the run. No Lean server or private build was started.
- Target/API/check/definition inventory: passed; no missing retained target, API entry, check name or definition name.
- Markdown audit: **1,253 local links, 0 missing files or anchors**, 483 unique explicit target anchors. Iteration expressions that resemble Markdown links were protected as inline code.
- Five layer example/dependency endings, source locators, own-words prose, metadata, current-library distinctions and absence of process placeholders/local filesystem paths checked.
- Intake `check-files` and staged `git diff --check`: passed for the four deliverables.

No unfinished package obligation is being handed off. The independent reviewer should re-elaborate the suggested file and concentrate on the selected-root integral-generation/basis proof, finite-free averaging topology, actual plus pseudomeasure comparison and terminal real quotient. Generic supplier ownership and the current-versus-pinned distinction are explicit in the README; the package is a plan, not a formalization.
