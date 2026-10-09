# Independent review of the revised Classical Serre Modularity package

Reviewer: Codex (GPT-6), session `codex-EV6NdF`. Date: 2026-10-09. Issue: #7922.
Verdict: **accepted**, after the correction below. This is a completed review.

I independently read all 81 target nodes in the three accepted inputs, the complete package README and Suggested.lean, the previous independent review and the revision handoff. The revision addresses all four earlier objections: the 22 missing modern construction APIs, the incomplete modern tests, omitted named theorem signatures and replacement of the existing newform carrier. The final package meets all six checks in the issue. Acceptance concerns a roadmap and elaborating signatures; it does not claim formal proofs or discharge the supplier requirements identified below.

## Six checks

| Check | Result and evidence |
| --- | --- |
| 1. Upstream form | Pass. The reader has an introduction, notation, boundaries, ordered layers, mathematical milestones, sources, prerequisites and examples. I compared it with the complete current upstream InductionRestriction and SemisimpleAlgebras readers. At 177,526 bytes it satisfies the 200 KB ceiling. Its density reflects the separate level-one, classical and modern arguments. |
| 2. Fidelity to the accepted plan | Pass after correcting the auxiliary-system weight. The 36, 37 and 8 input nodes have 81 distinct corresponding target entries. Statements, hypotheses, APIs, tests and prerequisite chains were checked individually, including the supplier limitations below. Generic deformation, local Hodge theory, compatible-system construction, lifting and weight optimisation retain their existing owners. |
| 3. Own words and source locators | Pass. The reader states its mathematical targets in its own words, arranged by dependencies. It contains neither source passages nor a section-by-section digest. Theorem, section and page locators accompany the targets; shared source paragraphs cover the terminal-weight rows. The source checks below use the identified editions rather than silently transferring pagination between versions. |
| 4. No programme process in the package | Pass. The README contains no job IDs, packet filenames, review verdicts, checkpoints or coverage statuses. Mathematical layer and target IDs serve as prerequisite notation. No `UPSTREAM:` or `FoundationsAndLibraryIntegration` bookkeeping reference remains. |
| 5. Suggested Lean file | Pass. All 38 planned APIs and 32 labelled tests have active mathematical content, and the named targets have signatures or the appropriate dependency documentation. The corrected file elaborates at the pinned libraries with zero errors and 234 warnings, all for `sorry`. Its Tau Ceti Newform import is exercised by the check. |
| 6. Metadata | Pass. The file is exactly `topic = "math.NT"` followed by a newline. |

## Correction made during this review

In `R27.4/auxiliary-characteristic-choice`, the input is the **weight-two** system furnished by Khare–Wintenberger I, Theorem 5.1(2), p. 9. The starting residual representation may have normalised Serre weight greater than two. The previous Lean hypothesis instead imposed that residual weight on the system in odd characteristic; this does not justify a weight-two residual member at the new auxiliary characteristic.

I changed `classical_auxiliary_characteristic` to require `s.HasWeight 2` and made the same distinction explicit in the README. The conclusion and the normalisation hypothesis on the original residual weight are preserved. The source note now cites both Theorem 5.1(2), p. 9, and the use of the system in §8.4, p. 17. This is a correction of the source-faithful hypothesis, not an additional target. No accepted input or supplier file was edited.

## Previous objections and target coverage

| Earlier objection | Independent finding in the revised file |
| --- | --- |
| Missing construction interfaces | The dihedral local type contributes all eight required APIs, good-dihedral insertion all five, and the order-three type all nine. Their signatures concern local characters, induced representations, stable lattices, residual semisimplification, integral reduction and compatible systems. The other sixteen APIs for good-dihedral primes and the L/W/D hypotheses also remain present. Structure projections count as active declarations; occurrences in comments do not. In particular `IsLocallyGoodDihedral.conjugate` is an actual theorem. |
| Missing or weaker modern tests | All 32 packet test names label examples, including combined examples where both assertions are present. The six dihedral, six insertion and nine order-three tests now include the required representation and lattice content. The invariant-space dimensions distinguish the standard and adapted reductions; the level-one nonexample asserts inertia reducibility; the crystalline test uses monodromy; the Steinberg and characteristic-three exclusions have their intended hypotheses. The ownership-boundary test is an actual insertion application, not an example of `True`. |
| Missing named theorem signatures | The Böckle presentation, flatness, prescribed lifts, compatible systems, local-ring smoothness, ordinary and degenerate branches, terminal-row contract, large-image and preservation results, auxiliary characteristic, dyadic weight-two claim, regular compatible-system export, Artin realisation and reduction assertions, general weight-one assertion, modularity-transfer steps and modern terminal steps are all present. The globalisation audit and comparison of the two proof routes appropriately remain mathematical dependency documentation. |
| Replacement of the pinned newform type | The file imports and uses `HeckeRing.GL2.Newform N k` from the pinned Tau Ceti library, with positive-level and positive-weight instances. Its unavailable Galois attachment is separate supplier data. The existing normalised new eigenform, nebentypus and newness are not recreated as an opaque carrier. |

The target inspection covered every layer, including subsidiary statements rather than only the headline Serre theorems:

| Layers | Targets | Mathematical content checked |
| --- | --- | --- |
| R26.1–R26.2 | 8 | Optimal level-one statement, prime-conductor corollary, deformation presentations, prescribed minimal and nebentypus lifts, local smoothness and system construction. |
| R26.3–R26.4 | 11 | Explicit prime estimates, finite range, twists, integer intervals, weight induction, local reducibility, ordinary lifting and degenerate branches. |
| R26.5–R26.6 | 11 | Terminal-row contract and five rows, assembly, prime-conductor proof, finiteness and the initial weight-two statement. |
| R27.1–R27.2 | 8 | Good-dihedral definition and preservation, Dickson alternatives, Chebotarev prime choice and insertion, L/W/D definitions and weight recursion. |
| R27.3–R27.5 | 12 | Killing ramification, double induction, removing the good-dihedral hypothesis, strong-form passage and the characteristic-two branches. |
| R27.6 | 8 | Strong Serre theorem, finite-flat export, regular systems, Artin reductions and weight-one modularity and descent. |
| R33.1–R33.2 | 9 | Lifting and transfer hypotheses, Fontaine–Laffaille and solvable cases, weight-two transition, dihedral type and good-dihedral insertion, odd-level removal. |
| R33.3–R33.4 | 6 | Order-three type and both lattices, dyadic type change, removal of two and the auxiliary prime, terminal characteristic five. |
| R33.5–R33.6 | 8 | Auxiliary odd member, dyadic closure, qualitative theorem, globalisation requirement, modularity equivalence, optimisation and elliptic-curve export. |

The revision handoff contains the detailed 81-target, 38-API and 32-test ledgers. I checked those entries against the active commands and their mathematical statements, rather than treating the ledgers as evidence by themselves. No unstated condition is introduced as a `Prop := sorry` definition or an empty proposition-valued stand-in. The unavailable imported constructions remain explicitly owned supplier interfaces. Routine arithmetic examples have actual proofs; the protocol permits `sorry` in the deeper suggested assertions and examples.

Two test clarifications are mathematically necessary and correctly retained. A coefficient field of degree two does not by itself obstruct descent: the rationality nonexample supplies a trace outside the prime field. Also the unnormalised one-dimensional character has cyclic image; the product of two order-q groups belongs to the induced representation restricted to the quadratic subgroup. The full induced image and its projective quotient are distinguished.

## Libraries, sources and boundaries

I read the scoped reviewed library audit and the actual cited declarations at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. These included `Nat.maxPrimeFac` and its boundary values, Bertrand's theorem, the finite-group complement theorem, the absolute Galois group, complex embeddings and arithmetic Frobenius vocabulary, and the Tau Ceti newform structure. The shared build's Newform source matches the pinned source. Arithmetic, representation and modular-form carriers are reused; they do not already provide the proposed Serre endpoints.

The current upstream checkout and current Tau Ceti were inspected read-only as well. The upstream check ended at `618e0b30d21791d6a492ce88ba8602745697b21a`; the current Tau Ceti checkout was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The newer LocalGaloisGroups, ProfiniteArithmetic and IntegralLattices material was compared with the relevant package interfaces. Local cyclotomic characters, tame local data and reciprocity retain their suppliers; quadratic integral lattices do not supply stable p-adic Galois lattices. The latest IntegralHeckeAndGaloisDeterminants addition concerns determinants and reconstruction rather than the missing Serre results. The other newer roadmap scopes were also checked. No target was replanned from those roadmaps and no build was run there.

Public primary source texts were read in disposable scratch space. The principal checks were:

| Source and edition | Locators and points checked |
| --- | --- |
| [Khare, arXiv v1](https://arxiv.org/pdf/math/0504080v1) | Prescribed lifts in §§2.2–2.3, pp. 11–15; Proposition 3.1 and its construction, pp. 16–19; §4, pp. 19–20; Lemmas 5.2–5.4 and Corollary 5.5, pp. 21–22; the induction and terminal rows in §6, pp. 23–28; finiteness in §7.1, pp. 28–29. The corrected characteristic-31 exponent is 18; the legitimate characteristic-29 exponent 16 remains. The unpublished ordinary correction and published-Duke numbering are explicitly distinguished. |
| [Khare–Wintenberger I, authors' preprint](https://www.math.ucla.edu/~shekhar/papers/results.pdf) | Definition 2.1, pp. 4–5; Theorems 3.1–3.4, pp. 5–6; Theorems 4.1 and 5.1 and compatibility conventions, pp. 7–10; Lemmas 6.1–6.3, pp. 10–12; §§7–8.4, pp. 12–18; Theorem 9.1, pp. 18–19; Theorem 10.1 and Corollary 10.2, pp. 20–21. Checked exact weights and types, prime-field rationality, conductor divisibility, the dyadic lift and regular versus irregular exports. |
| [Böckle appendix](https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf) | Theorem 1, Proposition 1, Lemmas 1–2 and Corollaries 1–2, pp. 1–6. Checked fixed versus unfixed determinant counts, the decomposable flat local condition and finiteness/flatness assumptions. |
| [Breuil–Mézard, authors' copy](https://www.imo.universite-paris-saclay.fr/m/~breuil/PUBLICATIONS/multiplicite.pdf) and [Savitt, arXiv v3](https://arxiv.org/pdf/math/0404327v3) | BM Proposition 4.1.1, pp. 30–31, and Proposition 6.1.1, pp. 67–68; Savitt Theorem 6.11, pp. 34–35, Corollary 6.15, p. 38, Remark 6.17, p. 39, and correction notice Remark 1.7, p. 4. The scalar crystalline case, nonscalar type, lattice and endomorphism assumptions, and limits of the ramified-base extension are distinguished. |
| [Dieulefait–Pacetti, arXiv v2](https://arxiv.org/pdf/2108.07577v2) | Theorems 1.4–1.9, pp. 3–6; Definition 1.10 and Theorem 1.11, pp. 6–7; Lemmas 1.14–1.15, pp. 8–9; Pasos 1–6 and Lemmas 2.1/2.3, pp. 10–14; §3, p. 15. Checked the finite-order twists, weight-two and weight-four branches, lattice-dependent reductions, odd ramification index and characteristic-three terminal input. |
| [Rosser–Schoenfeld](https://denisevellachemla.eu/Rosser-Schoenfeld-1962.pdf), [Ribet](https://msp.org/pjm/1997/181-3/pjm-v181-n3-p15-p.pdf), [BCDT](https://www.imo.universite-paris-saclay.fr/~breuil/PUBLICATIONS/STW.pdf), [Khare–Wintenberger, Annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf), and [Serre 1987](https://www.college-de-france.fr/media/jean-pierre-serre/UPL5835292064138487263_Serre_Repr.modulaires_Galois.pdf) | Respectively Theorem 2/Corollary 1, p. 69; Proposition 2.2, pp. 279–280; introductory Theorems A/B, pp. 1–2 of the authors' copy; Theorems 5.1/5.2/5.4, pp. 246–248, and §6.2, p. 250; §§2.4–2.8, pp. 186–189, especially Proposition 4. These support the prime bound, cyclotomic reducibility restriction, characteristic-five starting input, prescribed lifts and finite-flat weight-two convention. |

The source receipts for the central comparisons were SHA-256 `3012a51759ad10695792bc8a2d1af75890f38d6ebacd37fb61e01bfdb89c9c2f` (Khare), `3c389dc33e09fe847f5d8189ffd8915b5c1a73424e64e4fed6769829883bad82` (KW I), `0c6850dafda032f7a4008947c519b5aef8cc13762207bb67c36810170a8eebe6` (DP), and `e161ac6498c1a75fc8f981c25edd5e9390b19ceb40f174a25a1f6491390c115c` (Savitt). No private book was used, no source files are retained in the repository, and no fresh audit of an unavailable published Duke edition is claimed.

The following inherited limitations are accurately stated and are not closed by this review:

- `OrdinaryAutomorphicFormsAndModularityLifting:R21.5/nearly-ordinary-irreducible-lifting-over-q` excludes induction from an imaginary quadratic field. The level-one argument includes induction from ℚ(√−p) when p is 3 modulo 4. The reader requires that extension and identifies the unpublished Skinner correction; it does not assert that the current supplier theorem proves it.
- `GL2ModularityLifting:R32.6/globalisation-dependency-audit` retains explicit audit requirements concerning Tung, patched modules, Emerton–Paškūnas faithfulness, BLGG Theorem A.4.1 and Gee Theorem 4.4.12. Reading its currently accepted packet does not turn those requests into an independence certificate. The package establishes the distinction between independence from the KW induction and independence from the full Serre theorem, keeping the latter conditional on that examination.
- General irregular compatible systems remain an ML.1 target. This package's Theorem 10.1 export is regular. The general weight-one residual theorem is stated separately from the distinct-Frobenius variant used in the Artin proof. The q² form-space conclusion permits a newform level dividing q² rather than demanding exact level q².

## Validation

- `lean-check research/blueprint/packages/ClassicalSerreModularity/Suggested.lean`: final exit 0, zero errors, 234 `declaration uses sorry` warnings, no other warnings. Final file SHA-256: `d63b4718fb7e80936c0abb940c3df6890cc381deb97a8805b1c2afcaea9fc03e`.
- `python3 scripts/check_blueprint.py` on each of `ClassicalSerreModularity--R26.1.json`, `--R27.3.json` and `--R33.5.json`: zero errors and zero warnings. The latter two packets retain their stated partial scope; all 81 supplied targets have accepted reviews.
- An independent integer sieve checked all 2,422 primes from 5 through 21,591 against the finite auxiliary-prime inequality, choosing the least qualifying non-Fermat prime and the largest odd prime-power divisor of its predecessor. All rows passed; the final row is 21,589 → 21,599 and the Fermat-skip row is 251 → 263. The finite next-prime ratio range and the analytic threshold at 21,591 were checked separately. This is computational review evidence, not a formal Lean proof of the estimate.
- Target/API/test coverage, exact metadata bytes, reader size and absence of package process language were checked. Submission file validation and `git diff --check` pass.

Only the package README, Suggested.lean and review.json, this report and this job's handoff were changed. No definitions moved between roadmap owners. No revision task remains for this package review.
