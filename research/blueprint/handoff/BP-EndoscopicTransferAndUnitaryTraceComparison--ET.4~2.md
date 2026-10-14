# ET.4 revision 2 handoff

Job **BP-EndoscopicTransferAndUnitaryTraceComparison--ET.4~2**, issue **#9758**. Agent **Codex (GPT-6)**, session **codex-tcAXQG**, 2026-10-14. The bot confirmed the claim at [the claim receipt](https://github.com/CBirkbeck/tauceti-explorer/issues/9758#issuecomment-6172039471). This is a completed target-level planning pass, not a checkpoint, an independent review or a claim of formalization.

## Scope and preservation

The issue explicitly specifies ET.4 alone. The inherited packet instead claimed ET.4–ET.7b coverage and held 69 reviewed nodes, including ET.5/ET.6. This revision retains **all 69 IDs**, retains the **45 ET.5/ET.6 nodes byte-for-byte as mathematical JSON objects**, and preserves the entire historical `review` object. Their statements, API and tests now appear in the reader, repairing the stale reader identified by the review. Their former coverage records are preserved under `provenance.revision.inheritedCoverage`; they are not coverage claims of this job. Their implementation status remains unchecked.

ET.4 has **33 targets**: 25 theorems, 2 definitions, 5 constructions and 1 application; 50 API items, 29 definition/construction tests and 6 planets. The complete file has **78 nodes**: 51 theorems, 9 definitions, 14 constructions and 4 applications; **156 API items, 92 tests, 18 planets, 1 baseline declaration, 18 gaps and 14 requests**. The sole coverage record is **ET.4: planned**. No stage is closed. `status: complete` means that every in-scope target has a prerequisite endpoint in a library, another roadmap, a supplier request or a recorded gap, as PROTOCOL §0 defines. It does not override the historical needs_changes verdict.

## Changes that matter mathematically

- The character prefix now cites Clozel 1987 Theorems 1–3 and their component/descent/support proof, rather than relying only on introductory secondary statements. The underlying Howe and real harmonic-analysis obligations remain precise gaps.
- The Tamagawa target distinguishes Kottwitz 1984's **relative** formula from the absolute number-one input. A new classical simply connected target includes the inner SL/SU covers actually used by centralizers. Lai Theorem 7.2 proves only its quasi-split branch; the inner-form computation and Hasse inputs remain explicit obligations. Inner centralizers do not automatically have trivial ker¹.
- Kottwitz 1986 Theorem 9.6 is identified as the **noncentral** elliptic formula with restricted endoscopic classes. The full formula requires the new central-complement target, whose primary proof is a gap. The cohomological Fourier count, orbit factor and relative Tamagawa coefficient are recorded explicitly.
- A character-extension construction supplies ϖ, its finite ramification set and odd complex infinity exponent, importing AA.2's extension theorem and the existing upstream archimedean character classification.
- New component invariant-distribution and twisted character-support/Paley–Wiener targets give Arthur's actual coset recursion and its Kottwitz–Rogawski/Delorme–Mezo completion. AS.6 supplies the connected interface, not the missing twisted theorem. The ordered spectral limit is retained without an unsupported absolute-convergence assertion.
- Cuspidality of a twisted Levi subset is tested on its associated **fixed unitary Levi**. Testing it on the complex GL restriction-of-scalars Levi would incorrectly remove even the full component. The added full-unitary test detects that error. Morel's corrected Proposition 8.2.3 and Lemmas 8.2.5/8.2.6 give a separate real invariant-vanishing target.
- The Lefschetz construction specifies the interchange extension of the coefficient and the **centralizer sign** in singular stable orbital integrals, following Clozel–Labesse 2011. Source issue E3 records their published correction to Labesse 1999. E4 records the reversed cuspidality criterion in Shin §4.5; both descriptions are in our own words. E2 and its independent confirmation are unchanged.
- The geometric coefficient calculation retains J(Zθ) and d(G,𝒢) before cancellation. The spectral formula retains proper Levi and residual Speh terms, fixes the global normalized intertwiner, and uses the quotient by the theta-fixed split space. A full single GL block has determinant coefficient **1/2**. Number-field residual classification and arbitrary-unitary real GL induction have exact AS.4/AF.1 requests.
- Strong cyclic GL base change imports **AF.1/archimedean-llc-gln**, including Wℝ-to-Wℂ restriction. This closes the missing dictionary at target level without replanning it.
- KMSW's bounded local packet theorem and §1.6.4 positive-exponent induced packet construction are separate targets. A generic global parameter need not be tempered locally. Induced members may be reducible/nonunitary in Ψ⁺; no unsupported replacement by Langlands quotients is made. The generic pure-inner global scope and choice-sensitive pairing are retained.
- The GSp₄ target no longer depends on the unitary classification. Gee–Taïbi's orthogonal alternative is the specified **quasi-split GSpin₄ quadratic form**, rather than an arbitrary inner form. Its separate Sp₄/SO₅, local restriction and weighted-stabilization proof chain remains a gap. Ordinary spherical twisted FL does not prove weighted FL.
- A public Labesse cohomological weak-base-change target is added, preserving property (*), split/unramified finite matching, the residual-block infinity qualification, and the stronger finite hypotheses for descent. It does not overwrite the reviewed Scholze/Harris–Taylor division-data theorem.

## Sources and library checks

The source receipts give URLs, SHA-256 hashes, editions, read dates and target-specific locators. Thirteen primary sources were added: Clozel 1987; Kottwitz 1984 and 1986; Lai 1980; Arthur I/II 1988; Kottwitz–Rogawski 2000; Delorme–Mezo 2008; Clozel–Labesse 2011; Morel corrected arXiv v2; Labesse's public CM base-change copy; Gee–Taïbi 2019; Mœglin–Waldspurger 1989. Existing CSnc, CS17, Shin 2011, Arthur–Clozel, Labesse 1999 and KMSW sources were checked at the cited passages. The cleared Liu–Tian–Xiao–Zhang–Zhu article was read in place for Appendix C/D; none of its files or passages were copied into this repository. Harris–Taylor is not cleared and was not obtained from another copy.

The current read-only upstream AA, SmoothRepresentations, ReductiveGroups, GlobalNumberFields and ClassFieldTheory roadmaps and current Tau Ceti library were checked. Existing structure, measures, induction and reciprocity are imported. The Haar-measure declaration at the pinned Mathlib was read as a measure interface; it does not prove character theory or Tamagawa-number computations. The reviewed library audit supplies no already-built ET.4 result. No repository was cloned, no build project was created, and no upstream files were edited.

## Ownership and confirmed findings

- **RT-AREA-langlands-1/10:** ET.4 explicitly owns the relative/absolute Tamagawa formula and classical number-one input; ET.5 imports the coefficients. The inner-form proof remains identified, not silently assumed.
- **RT-AREA-langlands-1/15:** the early character prefix remains a single ET.4 owner pending the existing SR Part II ownership decision. Its primary proof and analytic inputs are now distinguished.
- **RT-AREA-langlands-1/1:** early cyclic/unitary inputs and the reviewed early/late Galois split remain in place; archimedean GL base change now has its precise AF.1 supplier. The full WD-factor obligation is inherited ET.6 work.
- **RT-AREA-langlands-1/2, /5, /13; RT-AREA-padic-1/25; RT-AREA-geomlanglands/2, /32:** the review's exact ownership distinctions and corrections are preserved in the packet and reproduced in the reader. The missing current-tier algebraic/Igusa prefix, correspondence boundary, ordinary Shimura coefficients and finite-level formal geometry remain inherited ET.5/ET.6 obligations. This ET.4-only job does not claim to close them or to implement a tier change.

The AS.4 number-field residual classification request replaces any duplicated residual classification in ET.7a. AF.1 supplies the existing archimedean parameter dictionary and receives the additional all-unitary GL induction request. The current GlobalNumberFields character import asks for no duplicate planning. A new restructure entry moves the general-type GSp₄ interface down to ET.4: **ModularityAndLanglandsExtensions:ML.4/gl4-symplectic-descent** should import it, while ML.4 keeps its broader classification/application. The maintainer must repoint higher consumers; no other packet was edited.

## What remains and where to resume

The next independent reviewer should check these ET.4 changes and leave the inherited ET.5/ET.6 scope distinction intact. Eight ET.4 proof-obligation groups remain in `coverage.remaining`: unitary classification's primary proof chain; cleared Harris–Taylor/simple Shimura access; Howe/real harmonic inputs; inner-form Tamagawa/Hasse proof; the central elliptic complement; real character boundaries and similitude quotient transport; number-field residual spectrum/all-unitary induction; GSp₄ classification and weighted twisted stabilization. Each names the exact affected targets and conventions. These are refinement jobs after review, rather than unplanned ET.4 targets.

ET.5 needs the downward-owned algebraic/Igusa prefix and trace-application geometry. ET.6 needs formal/level geometry, the SR.5 newvector input, algebraic Hecke-character realization, the dual algorithm, full WD segment-pair factors/conductor, and the restricted level-zero primary formula. ET.6a and ET.7 branches have their separate packet; their reviewed exact interface repoints are preserved in provenance and the existing restructuring proposals.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/EndoscopicTransferAndUnitaryTraceComparison--ET.4.json`: **0 errors, 0 warnings**.
- Suggested Lean file: **258 lines**, real-bodied light data only. `lean-check` at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 / Tau Ceti f790474821cf4256814db967cb154e7af3d0c369: **exit 0, no errors, 27 warnings, all declaration uses of sorry**. The three new determinant examples elaborate. No language server or Lake build/update/cache operation was used.
- Semantic preservation check: all 69 reviewed IDs retained; all 45 out-of-scope nodes unchanged; the historical review object unchanged; every implementation unchecked.
- Reader consistency check: every node statement, hypothesis, proof step, prerequisite, API item, use and test is rendered from this corrected packet.
- `git diff --check`: clean. Only the four authorized deliverable paths are changed.

All continuation-relevant information is in the packet, reader and this note. No retained scratch files are required.
