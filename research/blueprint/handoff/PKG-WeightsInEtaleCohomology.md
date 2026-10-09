# PKG-WeightsInEtaleCohomology

Completed by Codex (GPT-6), session `codex-oY3bAr`, for issue #7499 on 9 October 2026. The claim was confirmed by the bot in comment 6071301112. Branch: `codex-oY3bAr-pkg-weights`; starting commit: `49534e8dd2b99e4cdc8f5dd83f3ff9eb8de19835`.

## Delivered

The package is in `research/blueprint/packages/WeightsInEtaleCohomology/`:

* `README.md` is an upstream-form mathematical roadmap, 93,700 bytes. It retains the RS-17 Part II title, makes DeligneWeightsAndPurity the first prerequisite, and explains the early DWP.0–1 route separately from the sheaf/complex and local-monodromy routes. Its six layers contain all 27 accepted targets: 8, 4, 4, 3, 4 and 4 respectively. Each target states hypotheses, source theorem/section/page locators and prerequisite interfaces. The two definitions include all 17 API items and all nine named tests. The nine stronger arithmetic supplier contracts are explicit. All prose is independently written mathematical exposition; there are no source excerpts or source-by-source summaries.
* `Suggested.lean` retains the source file's mathematical code, namespaces, API and tests. It has one import block and one opening specification note. Only comments, whitespace and nine diagnostic `#check` commands differ from the source. The code uses actual Mathlib representation, polynomial and matrix objects.
* `metadata.toml` is the single line `topic = "math.NT"`.

The packet, reader, original suggested file, atlas data and other jobs' files are unchanged. No mathematical change to the accepted plan was necessary.

## Validation

* `python3 scripts/check_blueprint.py research/blueprint/packets/WeightsInEtaleCohomology.json`: **0 errors, 0 warnings**; 27 nodes, 17 API items, nine tests, six planned layers.
* `lean-check research/blueprint/packages/WeightsInEtaleCohomology/Suggested.lean`: **exit 0, no errors, 38 warnings**, every warning `declaration uses sorry`. The final check ran with 111 GB available memory and no concurrent Lean invocation by this worker.
* Final Lean SHA-256: `dd2e64f3395b436d0c28ddc964af100c1828d5b15992ca0f7d08730fc4a1ec6a`.
* A code comparison after removing comments, whitespace and `#check` diagnostics confirms that all original mathematical Lean tokens are preserved. All 17 API names and nine test names occur in both package files. The README's target-section counts match all six layers, every bibliography reference resolves, its size is within 50–200 KB, and the TOML parses as the single required category.
* `git diff --check`: passed. `python3 research/blueprint/intake.py check-files` on the four deliverables: **4 files, 0 problems**. Only the four issue-authorized deliverables are submitted.

The Mathlib used by `lean-check` is exactly the baseline commit `082e2d37e8b0463410cdb532e111cd43d5a66174`. The shared build's Tau Ceti checkout is `cf386627e9176a3827c1a5fe804989fd94a4d216`, rather than the recorded baseline `f790474821cf4256814db967cb154e7af3d0c369`. This file imports **only Mathlib**, so no Tau Ceti module or declaration is consumed by the successful elaboration. The check establishes the numerical suggestions at the pinned Mathlib; it does not test any unavailable Tau Ceti geometric signature. No dependency build, cache download, language server or private Lake project was used.

The nine baseline declarations cited by the accepted plan were inspected in the exact pinned Mathlib source: `IsArithFrobAt`, its `mul_inv_mem_inertia`, `conj` and `exists_of_isInvariant` lemmas; `Representation`, `Representation.ofDistribMulAction`, `Representation.dual`; `LinearMap.charpoly`; and `Matrix.charpoly`. The library coverage audit and RS-17 owner boundaries were read. HodgeStructures and ClassFieldTheory were the two upstream roadmaps read in full for structure and density.

Fresh public copies of all eight bibliography sources matched the plan's SHA-256 values. Selected source pages were checked for the Frobenius/weight conventions, smooth-lisse complex formula, parabolic image, hard Lefschetz twists, Tate/H¹ duality and exterior powers, Carayol's coefficient/residual sequence, Saito's completed-unramified model and degree/twist/local formulas, and the DFG rank/coefficient normalization. The README identifies the exact public versions and printed/PDF page conversions. No cleared private-library book was needed, and no source PDF or extracted text is submitted.

## Boundaries retained for review

The accepted plan contains six proof/signature gaps and nine supplier requests. Packaging preserves these as explicit mathematical prerequisites; it does not assert their proofs or geometric carriers exist. In particular:

* R34.2 specializes a smooth proper curve directly before using its residue Jacobian, preserving the accepted noncircular route. The positive-dimensional Tate nonintegrality and the rank-zero exception are stated.
* R34.3 requires the actual nonconstant Carayol coefficient system, derived-limit hypotheses, geometric graph action and cuspidal residual-term exclusion. R13.5 supplies model geometry; R13.6 is downstream. Saito's base is finite over a completed maximal unramified field, with finite-local/residue descent separately required. CP.4 supplies the independent period comparison.
* R34.4 retains the radical quotient, odd/even and characteristic-two branches, zero rank, rational local factors, and openness in the original Q_l group.
* R34.5 distinguishes classical degree r+1, the GH CM-product degree 2r+1, weight two, and Saito's q_0 degree with auxiliary character. Actual model, projector, boundary, coefficient and denominator conditions are required.
* R34.6 requires an independently supplied Eichler-congruence polynomial, the normalized DFG character twist, and the exceptional set for integral crystalline comparison. Common Hecke polynomials establish fixed-form good-prime compatibility; equal weights do not establish it. The Hilbert local export retains Saito's source range and the imported R06.6 crystalline proof obligations. Geometric monodromy uses F N F^{-1}=q^{-1}N, with the source-version convention correction explained.

The final Lean comment lists the same **24 unavailable full arithmetic/geometric signatures** as the accepted suggested file. These require genuine continuous place data, sheaf/cohomology/trait/model/projector/Weil–Deligne carriers. Numerical cores and examples are not replacements for those signatures, and no arbitrary `Prop` field or mock geometric object was introduced. This is the section 13 omission rule applied to the accepted plan, not a claim that the full roadmap is formalized.

## Remaining work and where to resume

No package work remains. The next step is independent package review against the accepted packet, README and original suggestions, followed by another `lean-check` of the submitted file. Focus that review on the mathematical boundaries above and the truthful signature omissions. Source URLs, editions and all continuation-relevant notes are in committed files; scratch downloads, extracts and logs are disposable and are deleted after the pull request opens.
