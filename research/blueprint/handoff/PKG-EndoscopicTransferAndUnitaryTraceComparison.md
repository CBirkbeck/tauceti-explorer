# PKG-EndoscopicTransferAndUnitaryTraceComparison — completed package

Agent: Codex, session `codex-UeVU3d`. Issue: #9838. Date: 2026-10-14.
Claim confirmed at [issue comment 6175381321](https://github.com/CBirkbeck/tauceti-explorer/issues/9838#issuecomment-6175381321).
Branch: `codex-UeVU3d-endoscopic-package`.

This is the complete package submission, ready for the independent package review; it is not a checkpoint or a review verdict. Only the three package deliverables and this handoff are changed. No packet, assembled reader, campaign document, upstream checkout or library file was edited. No claim of formalization is made.

## Delivered

- `research/blueprint/packages/EndoscopicTransferAndUnitaryTraceComparison/README.md`: fifteen layers, exact statements and conventions, supplier contracts, 211 mathematical topics, definition APIs and discriminating Checks, worked examples and dependencies.
- `research/blueprint/packages/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean`: 295 lines; ten light real-bodied definitions, representative statable theorem signatures and two examples per definition. Heavy carriers remain README targets, with their names recorded in the closing comment.
- `research/blueprint/packages/EndoscopicTransferAndUnitaryTraceComparison/metadata.toml`: `topic = "math.NT"`.

The five current accepted packets are the mathematical inventory: ET.0 (61 nodes), ET.4 (34), ET.5 (32), ET.6 (33), ET.6a (50), totaling 210. The assembled reader and suggested file are older: their ET.4/ET.6 review-state and missing-input notices are superseded by the accepted split packets. I retained all 210 current nodes, all 420 API names, and all 271 named packet checks. Three pairs of overlapping endpoints share sections, with both sets of hypotheses, APIs, checks and sources retained. Four geometric precursors supply genuine downward moves, making 207 distinct accepted endpoints plus four precursors = 211 topics.

## Build order and retained endpoints

| Layer | Inventory and purpose |
| --- | --- |
| 1 | ET.0, stable classes, nonabelian/abelianized cohomology, duality and signs |
| 2 | ET.1, orbital integrals and transfer factors; ET.4 p-adic characters moved to §2.16 |
| 3 | ET.2b, Hitchin geometry; fixed-curve bundles and local loop quotient added first |
| 4 | ET.3, fundamental lemmas, characteristic transfer and smooth transfer |
| 5 | ET.7a Speh datum and full number-field residual classification |
| 6 | Early ET.4, stable/twisted comparison, cyclic base change and induction |
| 7 | Early ET.5 and ET.7b rational object; good-prime PEL scheme precursor |
| 8 | Remaining ET.5, fixed points, masses, effective data and stabilization |
| 9 | ET.6a raw compact-unitary cohomology, expanded to graded multiplicities and commuting actions |
| 10 | ET.6, classical semisimple and full Weil–Deligne correspondence and inner forms |
| 11 | Remaining ET.4, unitary local packets/global classification and GSp₄ comparison |
| 12 | Remaining ET.6a, local towers and actual cohomology; marked relative untilt chart first |
| 13 | Remaining ET.7a, pure unitary transfer, packet relevance and compact-level dimensions |
| 14 | Remaining ET.7b, normalized Newton reduction and virtual rational spectral factorization |
| 15 | ET.7, finite coefficient calculations and coherent exports |

The three mergers are:

- ET.7a/cyclic-base-change → ET.4/global-cyclic-base-change, §6.24.
- ET.7a/cyclic-automorphic-induction → ET.4/cyclic-automorphic-induction, §6.26.
- ET.7a/twisted-spectral-normalization → ET.4/twisted-spectral-side, §6.22.

These moves put cyclic base change/induction and number-field residual data before the classical LLC construction which needs them. The local-unitary classification follows full GL LLC, rather than supplying it circularly. Every explicit internal `Needs` reference was checked against document positions: no unresolved internal references and no backward edges.

## Ownership audit and downward moves

Checked the current read-only TauCetiRoadmap main at `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Read DifferentialGeometry, OneParameterSemigroups and OperatorTheory READMEs in full as upstream models; consulted the current AdicSpaces and SmoothRepresentationsOfLocalGroups contracts and Suggested files. Consulted the reviewed library coverage and current implementations by object and hypotheses, rather than by a name search alone. No Lake command was run in either read-only checkout.

The following imports replace duplication in the older assembled proposal:

- SmoothRepresentationsOfLocalGroups SR.5.3 owns segments, Z/L multisegments, the Zelevinsky involution and derivative endpoint shortening. No `IntSegment`, `IntMultisegment`, `IsLadder` or auxiliary segment-theory development is copied into the package. The kept §10.23 is the segment-to-WD adapter, with its distinct dimension, half twist and monodromy outputs; the full ladder/unitary-dual theory is outside scope.
- ReductiveGroupsPartII RG2.1.5 owns the algebraic fundamental group and Kottwitz homomorphism on group points. The kept constructions are maps on cohomology and sigma-conjugacy classes, not another group-point homomorphism.
- ClassFieldTheory owns the class formation and abstract Tate–Nakayama input. The kept torus/reductive pairings specialize that input.
- AdelicAlgebraicGroups AA.2 owns general central-character extension, and GlobalNumberFields owns infinity types. §6.3 retains only the chosen CM extension's ramification set and parity adapter.
- AdicSpaces Layer 6 owns the actual fixed-field adic Fargues–Fontaine curve. Tau Ceti's `spaX`, `quotientMap`, `quotientMap_eq_iff`, `isOpenQuotientMap_quotientMap` supply only its Frobenius-orbit topology. No fixed-curve reconstruction appears here.
- Pinned Mathlib isocrystals are finite-rank only after an additional hypothesis; its classification is rank one over an algebraically closed residue field. The full structured slopes and J_b construction are not supplied by that theorem.
- General continuous abelian cohomology, sheaf operations, arithmetic WD carriers/factors and abelian-variety carriers remain with the suppliers named in the boundaries.

The upward inputs have these new owners; later consumers must point here:

| Former input | New package owner and scope |
| --- | --- |
| GlobalShtukasAndFunctionFieldLanglands GS.0/Bun_G | §3.1 `CurveBundles`, torsor groupoid/descent/algebraicity on the fixed curve |
| GlobalShtukasAndFunctionFieldLanglands GS.1/BD Grassmannian | §3.2 `LocalLoopGrassmannian`, only the equal-characteristic local fibre and bounded quotient charts |
| ShimuraCompactifications C5/open quasi-projectivity | §7.1 `IgusaPELModel`, fine good-prime open scheme and ample line; no compactification |
| FarguesFontaineDiamonds F4/untilt divisor | §12.1 `TowerUntiltChart`, varying marked untilt, Cartier closed immersion on all rational charts and the GL/EL fibre instance |
| AutomorphicGaloisRepresentationsPartII AG2.1a/raw cohomology and projector commutation | §9.1 `CompactUnitaryRaw`, graded finite-level cohomology with commuting Weil/Hecke actions, multiplicity Hom and supplied-idempotent images |
| Higher Igusa compactification/perfect-tower packages' early rational object | §§7.3, 7.7–7.11, the rational finite-level object and full action, before counting; torsion/concentration remains downstream |
| FunctionFieldArithmetic FA.2/projective adeles | Existing AlgebraicCurves completion/repartition comparison, not a new target |

The PEL scheme argument does not infer scheme representability from neatness. A1–A2 supplies rigidity/polarizations/relatively ample lines, not a general fine-level quasi-projective moduli theorem. The particular polarized Hilbert quotient, its universal family and descended ample line are explicit §7.1 targets. R09.2 supplies Hilbert presentations; the stable-orbit quotient proof and polarization-type extension are still required mathematical construction obligations. The fixed-curve topology does not supply the relative Cartier divisor or its complete structure sheaf.

## Input errors corrected in the package

Packets were left unchanged as required by the job. These are mathematical corrections, not changes of source wording:

1. §1.13: the nonarchimedean sign uses derived split ranks, whereas the real sign uses symmetric-space half-dimensions. Compact U(n) has sign `(−1)^floor(n²/4)`: U(2), U(3), U(4) give −1,+1,+1. The earlier rank-parity compact U(3) check was false. The numerical Lean function is explicitly scoped to the nonarchimedean application.
2. §4.8: regular inner-GL orbital matching is unsigned. Classical JL traces carry `(−1)^(n−r)`. Multiplying the split transfer by that sign instead gives signed orbital matching and equality of traces, with no second sign. Singular matching uses the centralizer sign, not one constant group sign. For the quaternion form the unit's trivial trace is +1 and its unsigned Steinberg transfer trace is −1; the signed transfer gives +1. Cohen's Definition 8.1 and Lemma 8.2 independently check this convention.
3. §3.6: the uniform Hitchin-base dimension formula now assumes deg(D)≥0 as well as deg(D)>2g−2, or the exact weightwise Riemann–Roch conditions. On P¹ with GL₂ and D=O(−1), the base is zero-dimensional, while the unrestricted formula would give −1. The non-finite-type statement is scoped to unbounded positive-rank GL determinant degrees; the trivial group is an exception.
4. §§3.12, 3.15: finite full Picard component group is the anisotropic condition. Fixing a central degree does not make the GL₁ Picard stack DM: G_m automorphisms persist. GL₁'s integer component group shifts determinant degree; it does not act trivially on a fixed-degree fibre. Properness uses the semistable-reduction argument in addition to the local/global product formula.
5. §3.2: the GL₁ affine Grassmannian's field points have integer indexing, but its full functor on nonreduced rings is not the constant discrete integer scheme.
6. §7.1: replaced the unsupported fine-moduli/Hodge-ampleness attribution to A1–A2 by the actual Hilbert presentation, stable-orbit quotient and ample-line descent obligations above.

Retained the accepted corrections already made by the split plans: beta_G is formed after the central quotient, while unquotiented adelic H¹ is functorial; decent Newton Levi pairs use rational conjugacy rather than only a bare Levi; connected centralizer does not force stable=rational conjugacy; the p-transfer pairing is inverted; scalar clearing precedes the negative Frobenius shift; p-adic types refine factor by factor; harmonic descent uses residue q; cohomological extraction uses the direct positive twist, not its dual; compact Lubin–Tate uses Hom with rho, not rho-dual; Speh dimensions include the GL_d rank; Dat's height index is all integers and its degree range is 0 through d_rho−1; Newton reduction retains the opposite modulus half twist; proper endoscopic infinity uses Xi_phi; and the two Hecke orientations require an independent action dictionary.

## Source audit and limits

Statements are in our own words with theorem/section/page locators. There are no verbatim source passages or source-by-source section summaries in the deliverables. Source version/pagination receipts inherited from the accepted packets remain bibliographic references, not assertions that every primary proof has been independently reread in this packaging run.

The independent checks included the following directly consulted passages:

| Source and locator | Purpose |
| --- | --- |
| Ngô arXiv v3, §3.2, Proposition 3.2.1 p.43; §4.1 p.62 | Local-loop and curve-bundle carriers |
| Ngô §§6.1–6.2 pp.111–114 | Full anisotropic condition, central components, properness/DM and decomposition scope |
| Labesse 1999, Definition 1.7.1 and Lemma 1.7.2 p.37 | Cohomological sign and global product |
| Labesse 1999, Definition 3.2.1 and Lemma 3.2.2 pp.76–77, including its Weyl calculation | Cyclic-base-change identity term and measure comparison |
| Hansen–Kaletha–Weinstein, published Appendix A.2 pp.71–72, including proof | Dual-group sign formula; not the general real rank comparison |
| Adams–Kaletha 2026, Theorem 2.7.7 p.164 and §6.1 p.203 | Real q convention |
| Cohen 2018, §8.1, Definition 8.1/Lemma 8.2 pp.615–617, including the lemma proof; Theorem 8.3 p.617 | Inner-GL orbital/character signs and source of existence |
| Scholze LocalLanglands author copy, §11 pp.28–29, Corollary 11.3 and proof | Compact-group virtual trace with the literal Hom sector |
| Shin IgusaVar author copy, §6 pp.19–20, Definitions 6.1–6.2/Lemmas 6.3–6.4; §7 pp.21–23 | Acceptability, Frobenius shifts and trace setup |
| Shin StableIgusa author copy, §6.3 and equations (6.8)–(6.11) | Inverse p-pairing, signs and separate modulus corrections |
| SW20, Definitions 5.3.2/5.3.7 and Proposition 5.3.8 pp.38–40 | Closed ideal on all rational charts; following warning excludes the one-chart shortcut |
| SW20, Proposition 11.2.1 pp.92–94 and Proposition 11.3.1 pp.94–95, including proofs | Relative marked-untilt divisor and Frobenius transport |
| SW20, §22.1 and Proposition 22.3.1 pp.207–209; Theorem 24.2.5 pp.227–229, including proof | Covariant b/sign, relative modification and EL duality |
| SW13, Proposition 5.1.6 pp.49–50 | Formal-module universal-cover instance |
| Faltings–Chai I.4.3–4.4 and I.4.11 pp.19,23–24 | Fine-level functor/Hilbert presentation and the recalled Mumford scheme endpoint |

Cleared texts were read in place. No cleared source file or passage was copied to scratch or the repository. Neither Harris–Taylor nor Deligne–Kazhdan–Vignéras is cleared; no alternate copy was used. Faltings–Chai recalls the geometric-quotient theorem; reading that recall does not independently verify Mumford's primary GIT proof. Similarly Cohen's transfer-existence theorem invokes DKV and does not certify an independently read DKV proof.

The accepted packets' source limitations remain explicit, rather than being silently discharged by packaging. These include nonabelian reductive cohomology/adjoint Hasse; DM trace/purity/decomposition extensions; the inner simply-connected Tamagawa theorem and central elliptic complement; real singular Lefschetz comparison with quotient measures; Bernstein/Vogan and the full MW number-field residual proof; Mok/KMSW and independent Sp₄/SO₅ classification; structured slope-divisibility and all-level liftability; effective coefficient-correspondence descent; Honda existence and polarized CM lifting; acceptable-Levi germ realization/Casselman comparison; simultaneous unitary globalization; classical all-inner-form JL/Jacquet; highly ramified stability; nongeneric JPSS factor products; compact-type separation/density; Harris–Taylor/Boyer; Pan's Higgs-field compatibility; all-dimensional tower support comparisons; and the independent Dat-to-Hecke action conversion. §7.1 adds the particular polarized Hilbert quotient proof requirement. They are precise future mathematical proof/construction obligations; this package does not pretend that compiling representative signatures proves them.

Some obsolete gap descriptions were reconciled: ET.4's current accepted packet supersedes ET.5's older `needs_changes` notice; cyclic BC/AI and early rational Igusa inputs are now earlier layers; library-owned segment classification and the fixed adic curve are deferred to their actual owners. The retained proof limitations are stated at their mathematical uses and under “Primary proof requirements”.

## Packet checker discrepancy and complete alias map

The four unmodified inputs ET.0, ET.4, ET.5 and ET.6 each pass `scripts/check_blueprint.py` with zero errors/warnings. The unmodified ET.6a input reports **26 errors, zero warnings**, all obsolete prerequisite names referring to the revised ET.5/ET.6 packets. This is a pre-existing input problem; the package job cannot edit packets. The README resolves the names as follows:

| Obsolete suffix | Current supplier and README location |
| --- | --- |
| ET.5/acceptable-test-functions | acceptable-functions-with-geometry, §8.1 |
| ET.5/igusa-endoscopic-test-function | p-test-function, §8.19 |
| ET.5/transfer-at-p | acceptable-levi-pushforward, transfer-factor-constant, p-test-function; §§8.9,8.18,8.19 |
| ET.5/jb-endoscopic-levi-data | effective-levi-endoscopy, §8.8 |
| ET.5/acceptable-functions-determine | central-shift-character-separation, §8.11 |
| ET.5/unitary-igusa-trace-formula | unitary-stable-specialization, §8.22 |
| ET.6/llc-characterizing-properties | functorial-weil-parameter and full-wd-correspondence, §§10.20,10.30 |
| ET.6/full-wd-local-langlands | full-wd-parameter and full-wd-correspondence, §§10.26,10.30 |
| ET.6/local-jacquet-langlands | esi-jacquet-langlands, §10.3 |
| ET.6/segment-wd-parameter | segment-wd-adapter and special-block-factor-formulas, §§10.23,10.25 |
| ET.6/drinfeld-level-deformation-spaces | drinfeld-deformation-instance, §10.2 |
| ET.6/semisimple-langlands-parameter | semisimple-trace-parameter, §10.18 |
| ET.6/badulescu-langlands-jacquet-map | additive-langlands-jacquet and jacquet-induction-quotient, §§10.6,10.10 |
| ET.6/zelevinsky-classification | Existing SmoothRepresentationsOfLocalGroups SR.5.3; no duplicate target |

As a diagnostic, I ran the checker on a scratch-only ET.6a file with its 26 obsolete references replaced using this map. It reports **zero errors, one warning**: the atlas recognizes the broader SR.5 stage, but the old packet has no request entry for it. The README states the exact existing SR.5.3 contract in its ownership boundary. This diagnostic does not claim that the repository packet itself passes. The independent reviewer or maintainer can use this table for a separately authorized packet reconciliation; no packet patch is required to read the package.

## Verification and resume point

- `lean-check` on the final Suggested.lean: exit 0, 16 warnings, every warning exactly `declaration uses sorry`; no errors or other warnings. Baseline Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Available memory exceeded 20 GB. Only this helper was used; no language server or Lake build/update/cache command.
- Inventory audit: all 210 nodes map to the README; all 420 API names and 271 packet check names present; every definition/construction section has at least three Check bullets; 211 numbered topics; no unresolved internal prerequisites or internal backward edges. Representative Lean definitions have matching README conventions and two examples each.
- Adversarial pass: n=0/1/2; empty finite sets and valuation blocks; q=0/1/3; rank-zero numerical signs and compact real U(3); trivial group/central GL₁; D=O(−1) on P¹; denominator zero versus nonzero Tamagawa inputs; quaternionic transfer; strict cross-block inequality; raw versus normalized special blocks; signed virtual cancellation. The corrections and negative controls above record the findings. An elaborating sorry signature was not treated as evidence of truth.
- No sorry-backed data, development chains, disallowed Lean directives, private paths or process identifiers in the package. Mathematical “packet” terminology for local unitary packets is intentional.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 4 files, zero problems. `git diff --check` passes; the commit scope is exactly these four authorized paths.

No implementation work remains in this package run. Resume at its independent package review, concentrating on the stated primary proof obligations, the §7.1 scheme/quotient construction and the convention-sensitive §§1.13,4.8,10.23,12.22,14.2–14.4. Do not turn the signature file into a theory development or import a higher roadmap to close an early contract. This handoff is self-contained and needs no scratch files; temporary downloads, scripts and logs are removed after the PR opens.
