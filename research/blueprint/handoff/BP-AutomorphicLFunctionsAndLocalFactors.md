# BP-AutomorphicLFunctionsAndLocalFactors — checkpoint 2 (Claude Code cc-39fac3)

Claude Code, session `cc-39fac3`, 29 September 2026. Refs #688; the bot confirmed the claim (comment 5884362867). **Status: partial.** No stage is closed; AL.1 is decomposed except for three recorded items.

## Checkpoint 2: Tate's thesis

**Sources.** Both files match the recorded sha256.
- Kudla 2004: printed pp.115–131 read on page images. This completes the chapter.
- Tate 1950: physical pp.15–27 (§§2.4–2.5) and 40–59 (§§4.2–4.5) read on page images. Pp.28–39 (§3 and early §4.1) remain unread.

**New nodes (29).** Library modules are `TauCeti/Analysis/Fourier/SchwartzBruhat`, `TauCeti/NumberTheory/TateThesis/Local` and `…/Global`.
- **AL.0 (5):**
  - `local-schwartz-bruhat-space` (definition; 6 API items, 4 tests): the SR.1 carrier, and Mathlib's 𝓢 and 𝓢′ at ℝ, ℂ.
  - `local-fourier-inversion`.
  - `adelic-schwartz-bruhat-space` (construction; 6 API items, 4 tests; with Tate's 𝔷1–𝔷3).
  - `adelic-poisson-summation` (planet): Tate's Riemann–Roch.
  - `point-supported-distributions`.
- **AL.1 local (15):**
  - quasi-characters and conductors (definition);
  - the local zeta integral (definition);
  - S′(ω) (definition);
  - Lemmas 3.2 and 3.3;
  - the unramified, exceptional (S′(ω₀) = ℂδ₀ via the nonsplit ρ(x)), ramified and archimedean theories;
  - Theorem 3.4 (planet);
  - Lemma 3.6, with its proof written out;
  - ε/γ-factors (definition);
  - the local functional equation (planet);
  - the local Gauss sum (definition);
  - Proposition 3.8 (planet).
- **AL.1 global (9):**
  - Lemma 4.1 with Theorem 4.2;
  - the global zeta integral (definition);
  - Λ(s, ω) (definition);
  - κ = Mathlib's `NumberField.dedekindZeta_residue`;
  - Tate's Lemmas A and B;
  - Main Theorem 4.4.1 (planet);
  - the global ε-factor (definition);
  - the Hecke functional equation (planet).

**Planets.** AL.0 now has 6 and AL.1 has 5.

**Source findings.**
- E3: Kudla p.128 cross-references (3.13) → (3.23) and Proposition 3.7 → 3.8.
- E4: Kudla (3.22). With x^{−a} characters the real poles are at even −r with residue D^{a+r}δ₀.
- E5: Tate p.26. N𝔡^{−1/2} → N𝔡^{+1/2}.

Each was checked against the page images and a second argument; no published correction was found.

**Requests and gaps.**
- New request: GlobalNumberFields Layer 6 (ideles and compactness of the norm-one class group).
- The new nodes were added to the neededBy lists of the SR.1, AA.0, GNF 0/5/9/10 and ADS 3 requests.
- New gaps: the unread proof source for point-supported distributions (no roadmap owns distribution theory, since FoundationsAndLibraryIntegration is retired), and Tate §3 unread.
- The AL.1 gap text is rewritten to the three remaining items.

**Lean.** The suggested file now has an AL.1 section: signature sketches in a comment, plus 9 examples, all proved. They cover the unramified series, ρ(x), π·Γ_ℂ, Tate's real ρ = Γ_ℂ cos, Jacobi θ, the completed-ζ bracket and functional equation, κ(ℚ) = 1, |𝔤|² = 1, and the ℚ(√5) units. It elaborates against Mathlib 082e2d3 with 0 errors; the only warnings are the 25 existing placeholders.

**Checks.** `check_blueprint.py`: 0 errors, 0 warnings (42 nodes). `intake.py check-files`: 0 problems. Unit tests pass.

**Continue with:**
1. AL.2 (Godement–Jacquet: Jacquet's Corvallis article "Principal L-functions of the linear group" and Cogdell's Fields notes are free).
2. AL.4 (Borel, "Automorphic L-functions", Corvallis II §§6–7).
3. Read Tate §3 to close the product-integral gap.

# BP-AutomorphicLFunctionsAndLocalFactors — partial checkpoint

Worker: Codex — codex-hjdg0j. Issue: #688. Claim comment 5851677325 won, confirmed by bot comment 5851678186. The complete issue was read before and after the bot reply. Scope remains AL.0–AL.5, with part null. This submission is partial and is intended to retain its concrete component while releasing the remainder through the normal checkpoint intake. No stage is claimed closed.

## Completed component

Thirteen new declaration-sized items in AL.0 give the annihilator for a bilinear character pairing, its membership API, closedness and openness, Fourier vanishing from a period, support containment, subgroup and coset indicator transforms, modulation, frequency periods, local constancy, conditional compact support and conditional indicator inversion. Counts: one construction, seven lemmas, five theorems, four API items, four definition tests, four further finite Fourier examples and five planets. The packet has thirty checked baseline references, six stage gaps, nine supplier requests, two source findings and one ownership rescope proposal.

All current signatures use the actual Mathlib Fourier integral, additive characters, bilinear maps, additive subgroups, measurable indicators and support notions. The general Fourier translation theorem already exists at the pin and is imported. The generic locally constant compact-support carrier belongs to SR.1; no duplicate carrier was created. The new annihilator is an additive subgroup, not a scalar submodule. Its test over the real integer lattice excludes the tempting scalar-stability assertion.

The indicator formula keeps μ.real(U) explicitly. The coset formula uses the negative phase for an input translated as f(v−a), while positive modulation shifts the frequency by −w₀. Counting measure on Z/2 gives a factor of two under two transforms. The Z/4 coset example distinguishes −i from +i, and the Z/3 modulation example distinguishes frequency 1 from −1. The double-transform theorem assumes the double-annihilator equality and dual volume product; no self-dual Haar construction is claimed.

## Source and ownership evidence

All six reviewed AUDIT-14 rows and the REV-AUDIT-14 record were read before planning. The accepted RS-13 result and full report were read and followed. All six AL stage descriptions, all thirty-five touching edges and all thirty-five applicable link records were screened. The count includes roadmap-level screens mentioning AL incidentally; they were not automatically treated as stage dependencies.

Supplier descriptions read include SR.1 and SR.5, AF.0 and AF.1, AA.0, GlobalNumberFields Layers 0, 5, 9 and 10, ArithmeticDirichletSeries Layer 3, FA.2, GL₂ R16.1 and the upstream OneParameterSemigroups positive-definite/Bochner milestones. There was no finer SR/AF/AA supplier packet or previous AL packet/integrated decomposition at the base snapshot. The two required upstream model documents, GrothendieckEulerForms and JacobianChallenge, had been fully read in this worker session and were byte-verified unchanged.

Tate’s original thesis scan was read through physical p.24 in batches of at most three pages. That is the original thesis version, not the 1967 reprint. Physical p.24, printed (2.17), was rendered to check the Fourier calculation after OCR lost factors. Resume at physical p.25. The chapter-I LCA duality assumptions must not be replaced by the mere existence of Mathlib’s PontryaginDual carrier. The local inverse-different and measure formulas around physical pp.10–12 require rendering before exact transcription; the current component does not depend on their unverified OCR exponents.

Kudla’s published chapter was read through physical p.15, printed p.123. Printed pp.110 and 122 were rendered. Resume at physical p.16, printed p.124, for the explicit epsilon-factor calculations and the global section. The lecture preprint was read through p.9 only and was used for collation, not silently substituted for the published text. Resume at p.10 only if that version is needed. The packet records each URL, full SHA-256, version and date.

Source finding E1 corrects M dividing N₀ to N₀ dividing M in the published conductor paragraph p.110; it was checked against the actual image and the earlier projection formula. Focused correction searches and the author/publisher pages did not reveal an addressing correction. E2 is the preprint bibliographic placeholder already corrected to Valenza on published p.110. Both are classified as misprints affecting no intended mathematics. Neither has an independent review yet.

## Validation

The indexed blueprint check has zero errors and zero warnings. The graph is acyclic and the component’s prerequisites terminate in checked native declarations. Lean 4.34.0-rc2 elaborates the assigned suggested file with zero errors and twenty-five intentional placeholder warnings only. All 8,482 transitive Mathlib import source files were byte-verified against the pin and matching cache; there are no Tau Ceti imports to build for this component. Every construction/API/test name matches its suggested-file declaration or named example. This is a signature prototype, with every implementationStatus unchecked.

The intake check reports four files and zero problems, and the source-issue/version check reports no problems. The fresh-main check found sixty-nine guarded paths unchanged; the only new relevant supplier was the worker’s own fully read MP.0 packet, byte-identical to its submission and with no overlap in the present component.

The publication guard compares the source archive against the working snapshot to require exactly the four authorized deliverables, checks for local paths, rechecks claim ownership and issue body, and compares all used protocols, audits, ownership inputs and suppliers against current main. Any new relevant supplier packet must be reviewed before publication. The assigned files contain no local scratch artifacts, and no source PDF is committed.

## Exact continuation

Start with the actual SR.1 generic locally constant compact-support carrier, using its finer node if one has appeared. Prove the finite-local-field characterization on Kudla p.115: a compactly supported locally constant function is invariant under a sufficiently small additive fractional ideal and has support in a sufficiently large fractional ideal. Separate uniform local constancy from the boundedness/compact-subgroup containment statement. The existing Tau Ceti translation-stabilizer openness theorem assumes a compact ambient group and does not immediately give the noncompact local-field version.

Construct the standard additive character on each finite completion, including its trace and inverse-different convention, and prove the annihilator formula for fractional ideals. Establish continuity, local constancy, compact annihilators, the double-annihilator theorem and finite positive Haar volumes. The current general pairing component can then be applied to actual local-field lattices. Prove the dual volume product using the chosen measures. Extend the indicator calculations to all test functions using finite coset decompositions and the integrability hypotheses required by native Fourier additivity.

At infinite places, read the actual pinned SchwartzMap and Fourier signatures before importing their theorems. Compare native negative Fourier convention with Kudla’s positive convention and Tate’s standard local character. Construct adelic tensor compatibility, the diagonal annihilator and quotient-volume normalization using AA.0 and GlobalNumberFields, then prove Poisson summation. This remains a substantive analytic component, not a consequence of a restricted-product type.

For AL.1, the read source already identifies the distribution scaling action, point-supported distributions, eigenspace uniqueness, unramified difference operator, ramified test vectors, normalized zeta distributions, archimedean gamma computation and local functional equation. Each needs declaration-level extraction and its actual proof source. Preserve the exceptional unramified extension argument and the trivial/norm-character global poles. AL.2–AL.5 have specific remaining lists in the packet and reader; their primary construction proofs have not been read. Keep the archimedean arguments separate from finite-place gcd normalization, and preserve exceptional zeros in the interpolation interfaces.

The job’s original scope and all incomplete targets remain explicit. The six gaps and nine requests are the restart worklist. No supplier file, upstream roadmap, checker or library file is modified by this submission.
