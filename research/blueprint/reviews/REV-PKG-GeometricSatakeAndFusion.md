# Independent package review: GeometricSatakeAndFusion

Verdict: **accepted after corrections**. All six package-review requirements hold. This verdict concerns the package's fidelity to its accepted mathematical plan and the elaboration of its suggested interfaces. The targets remain proposed mathematics, with the supplier and proof obligations described below.

Reviewer: Codex, session `codex-atGA6L`, 2026-10-10. Job `REV-PKG-GeometricSatakeAndFusion`, issue #7517. The package was written by Codex session `codex-rrQYJE` for #7473; this session did none of that work.

The inputs are `GeometricSatakeAndFusion--GS0.json` and `GeometricSatakeAndFusion--GS3.json`, accepted on 2026-10-08 by `independent-review-REV-GeometricSatakeAndFusion--GS0~2` and `independent-review-REV-GeometricSatakeAndFusion--GS3~2`, respectively. Read both complete inputs, the complete package, their library audit and relevant link-map entries, PROTOCOL, the expansion protocol and UPSTREAM_GUIDE.

## Corrections

The reader previously compressed definition tests into selected informal checks, sometimes leaving no tests at a definition. Added all **99 named test contracts** under their owning targets, including the two theorem regression tests. All 32 definition/construction targets now have at least three explicit tests. Their statements retain the accepted plan's degenerate cases, computations, compatibility checks and nonexamples; they describe mathematical tests and the stated prototype limits rather than claiming implemented geometry.

To keep the README within the size limit, shortened repeated labels and introductory wording and factored three repeated prerequisite lists into the anchored supplier-calculus table. Each alias expands to exactly the original declarations; internal link destinations and dependency directions are unchanged. Removed brittle source-code line numbers from the HasColimit scope description. Removed two references to the planning process from Lean comments.

Corrected seven Lean tests or interfaces:

| Name | Correction and reason |
| --- | --- |
| `hecke_trivial_group` | Test the actual trivial-group action category's objects and endomorphisms, replacing an unrelated equality between two PUnit labels. |
| `hecke_double_action` | Check both the left action and the inverse right action; checking only the first cannot detect the missing inverse. |
| `determinant_existing_carrier` | The example returns `geometricDeterminantLine X lam` in Tau Ceti's InvertibleSheaf carrier, replacing an arbitrary sorry inhabitant. |
| `normalized_tensor_carrier` | The example returns the actual normalized determinant in ModuleCat, replacing an arbitrary sorry inhabitant. |
| `standard_zero_cell` | Require isomorphisms to the constant object for both components. Mathlib's HasShift gives `shiftFunctorZero`, an isomorphism, without requiring object equality. |
| `satake_inclusion_fully_faithful` | Require both Full and Faithful for the full-subcategory inclusion; the original example required only Faithful. |
| `convolution_unit` | State the unit comparison for the defined Hecke convolution, replacing a generic monoidal unitor. Its adjacent comment retains the omitted geometric requirement that the unit is the identity-modification kernel. |

## The six requirements

| Requirement | Result and evidence |
| --- | --- |
| Upstream form | Pass. The reader has motivation, ownership boundaries, conventions, existing library vocabulary, ordered mathematical layers, target statements, APIs, tests, sources and prerequisites. Compared the nearby upstream ReductiveGroups and AlgebraicVectorBundles documents and their interfaces. Final README: **199,847 UTF-8 bytes**, below 200,000. |
| Fidelity | Pass after the test additions and interface corrections. All 94 target sections and their mathematical statements, individual hypotheses, 120 API items and 99 named tests are present. Common coefficient, bounded-support and finite-projectivity hypotheses are collected in Conventions and the corresponding layer opening. The few input phrases referring to packets or source-issue identifiers are expressed as mathematical ownership or proof obligations. No conclusion is strengthened. |
| Own words and sources | Pass. The exposition follows the construction and dependency order; it contains neither source passages nor a section-by-section source summary. Every target has a source locator and a prerequisite list. The bibliography fixes editions and distinguishes physical from printed pages. Independently obtained all twelve cited public PDFs, matched their hashes to the accepted inputs and checked the passages listed below. |
| No process | Pass. The README and suggested file contain no packet filenames, job/session identifiers, review/checkpoint language or coverage statuses. Layer and declaration names provide mathematical navigation. Open mathematics is stated through supplier requirements and proof obligations. |
| Suggested.lean | Pass under PROTOCOL §13's prototyping rule. The full final file elaborated with **exit 0, zero errors and 278 warnings, all declaration-uses-sorry warnings**. All planned API and test names occur. Existing carriers and individual imports are used; the missing geometric hypotheses are identified in adjacent comments. |
| Metadata | Pass. Unchanged file: exactly `topic = "math.NT"` followed by a newline. Number theory fits the local arithmetic geometry, dual-group and Hecke applications. |

## Target reconciliation

Checked every input node against its corresponding unique reader anchor, including statements, hypotheses, proof outline, source and ownership. The totals are:

| Mathematical layer | Targets | Definition/construction targets | API items | Named tests |
| --- | ---: | ---: | ---: | ---: |
| GS0: modification and Witt geometry | 36 | 15 | 46 | 46 |
| GS1: constant terms, ULA and perversity | 15 | 5 | 15 | 16 |
| GS2: Satake, convolution and rigidity | 11 | 3 | 12 | 10 |
| GS3: fusion and finite-set coherence | 8 | 4 | 19 | 12 |
| GS4: reconstruction, dual group and classical comparison | 24 | 5 | 28 | 15 |
| Total | 94 | 32 | 120 | 99 |

The especially sensitive restrictions remain explicit: repeated divisor weights are combined before counting distinct DVR factors; dominance is coroot order in a fixed component; stabilizers use the opposite parabolic; minuscule period maps reconcile inverse-cocharacter and ascending-filtration conventions; rational IC/decomposition arguments are separated from torsion arguments; flat integral Satake is an exact category, without an abelian-category claim. Fusion uses the component sign before passing to ordinary symmetry. The rational Witt route avoids the characteristic-two integral rank-one argument and restricts its residue field to an algebraic closure of a finite field. The enhanced perfect-complex extension asserts containment in the stable idempotent closure, without claiming full faithfulness or equality of the essential image.

The normalized trace retains specified Frobenius descent, geometric Frobenius on Λ(1) by q inverse, a chosen square root r with half-twist eigenvalue r inverse, the parity correction and vol(K)=1. Normalized weight fibres undo the cohomological Weil twist. The nonsplit classical comparison remains a separate descent obligation.

## Sources independently checked

These are statement and hypothesis checks for the package, not new paper extractions. Locators use the editions named in the reader; no restricted book was needed.

| Source | Checked passages and their role |
| --- | --- |
| Fargues–Scholze, Geometrization | VI.1.5–9, pp. 192–194; VI.1.13, p. 196; VI.2, pp. 198–201; VI.3–4, pp. 204, 207; VI.6.5–7, p. 214; VI.7.4–10, pp. 217–222; VI.8–10.3, pp. 225–235; VI.11.2–4, pp. 237–239. Checked quotient automorphisms, divisor lifting, stabilizers and bounded actions, weight geometry, ULA/perversity, finite-projective cohomology, convolution, fusion signs, relative reconstruction and rank-one scope. |
| Zhu, Annals 185 (2017) | Propositions 1.8–1.10, pp. 418–420: the bounded affine presentation and cover are separated from representability of the quotient. The reader uses the published pagination throughout. |
| Bhatt–Scholze, arXiv:1507.06490v3 | §§7.3–8.4, pp. 29–36: Demazure quotient recursion, exact-type fibres, geometric determinant descent, positivity and the Keel/Stein contraction route. This remains independent of Zhu's representability route. |
| Scholze–Weinstein, author PDF dated March 27, 2020 | 20.3.1–6, pp. 185–186; 20.5.4, p. 190; 21.1.1–4, pp. 191–192; 21.2.1–3, pp. 192–194; 21.4.3 and 21.5.1, pp. 195–197. Checked special/generic realization, collision bounds, inertia-labelled components, punctured A_inf input and minuscule closure comparisons. |
| Caraiani–Scholze, Annals 186 (2017) | §3.4, pp. 683–686: the ascending period filtration and inverse-cocharacter convention. |
| Gleason–Lim–Xu, Inventiones 243 (2026) | pp. 822–823: the admissible-locus and local-model interfaces beyond minuscule bounds. |
| Viehmann, published 2024 article | §2.2.14–15, pp. 15–16: the minuscule qualification is retained and not silently generalized. |
| He, Forum of Mathematics Pi 9 (2021), e9 | §2.2 and Proposition 5.6, p. 10: the simple quasi-split setting and the two-factor length bounds. |
| Gross, On the Satake isomorphism | §3, pp. 6–8, especially (3.4)–(3.6) and (3.13): the modulus factor and minuscule leading coefficient agree with the package's half-twist convention. |
| Prasad–Yu, author preprint | Corollary 1.3, pp. 2–3, and proof §5.4, p. 12: the exact characteristic-two/odd-orthogonal exception survives in the imported RG2.3 contract. |
| Deligne–Milne, Tannakian Categories notes | Proposition 2.20, Corollary 2.22 and Proposition 2.23, pp. 24–26: tensor generation, connectedness and semisimplicity imply the stated rational reductivity route under the characteristic-zero hypotheses. |
| Doty–Henke, arXiv:math/0205186v1 | Lemmas 1.1, 1.3–4, pp. 3–4, and the Steinberg tensor-product calculation, p. 18: the characteristic-two representation calculation is distinguished from the additional geometric Hom comparison. |

## Library and ownership checks

Read the statements of all **47 distinct baseline references** (39 Mathlib, eight Tau Ceti) at the pinned commits, including their actual binders. Mathlib's PerfectRing does not impose characteristic or primality, its Perfection is an inverse limit rather than coordinate-ring perfection, and HasColimit supplies no Hopf structure. The known-Hopf tensor-automorphism theorem assumes a Hopf algebra over a field; it does not supply the general relative reconstruction planned in MC.6.

Read the current Tau Ceti line-bundle and Tannaka interfaces and screened the nine roadmaps newer than the atlas snapshot, including their Suggested.lean declarations, for overlap. Examined the relevant AlgebraicVectorBundles tensor, rank-one and determinant signatures in detail. The package imports those operations; it owns their Witt-resolution applications and positivity comparison. Also checked current ReductiveGroupsPartII RG2.3 and RG2.5: the model, closed-immersion and pinned dual-group theories remain imports, not new Satake targets. Upstream HEAD at the final check was `37769f03c170a7bc3e1082df70522a0ad59c5ffd`; current Tau Ceti HEAD was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

General perverse recollement, enhanced coherent pull–push, relative Tannaka, all-prime tilting/Perf(BG) and classical spherical Satake retain EDC, EDS, MC, LP and SR ownership. The local Weil group cites existing ClassFieldTheory layer 9. The link-map screen found no additional binding target-level edge requiring a package correction; older broad overlap screens do not replace these explicit interfaces. No mathematics was moved between owners.

## Verification and remaining obligations

Both accepted-input packet checkers returned zero errors and zero warnings. The package audit checked every target anchor, source/prerequisite section, API and test name in the reader and Lean file, at least three tests for each definition/construction, all internal links, the byte limit, metadata shape and absence of process vocabulary. The final submission checks cover valid JSON, allowed paths and whitespace.

Ran the full `lean-check research/blueprint/packages/GeometricSatakeAndFusion/Suggested.lean` after checking sufficient available memory. The shared build uses Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; all four directly imported Tau Ceti source files were independently compared byte-for-byte with `f790474821cf4256814db967cb154e7af3d0c369` and agree. Compilation validates the suggested signatures with sorry proofs. It does not prove their laws or construct their omitted geometric supplier interfaces.

No package revision remains. The ten GS0-input gaps and twelve GS3-input gaps are preserved as mathematical proof or supplier obligations. In particular, modular geometric Hom/tilting comparisons, characteristic-two integral recovery, all-prime enhanced completion, enhanced coherence and nonsplit arithmetic trace descent remain to be established. This review discharges none of those inherited obligations. PROTOCOL §13 expressly permits unstated conditions when their mathematical carriers do not yet exist; the reader states the full conditions, and the Lean comments identify the omissions without proposition-valued mocks.
