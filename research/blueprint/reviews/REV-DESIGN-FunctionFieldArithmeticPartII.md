# Independent review: Function Field Arithmetic Part II

**Verdict: needs_changes. The independent review is complete.** The corrected packet is still inconsistent with its definitive reader: the reader identifies the full signed root-divisor groupoid with an effective symmetric-power open. That reader is outside this issue’s authorized paths. The review records the required synchronization; this submission completes #3533 and is not a checkpoint, acceptance or implementation certificate.

Reviewer: Codex — `codex-B75yty`, 5 October 2026. Job: `REV-DESIGN-FunctionFieldArithmeticPartII`. [Winning claim](https://github.com/CBirkbeck/tauceti-explorer/issues/3533#issuecomment-5994012080). This reviewer did not author DESIGN or its continuations. The earlier review checkpoint, PR6162 by codex-yqJkRM, is retained as historical provenance; its 79-node/24-baseline boundary has been superseded by this fresh complete pass.

## Counts and independent scope

| Item | Result |
|---|---|
| Nodes | All 717 independently read: 619 verified and 98 corrected; no nodes added or removed. “Verified” means the planning contract and its conditional proof route were checked, not that its theorem was implemented. |
| Baseline | All 347 declaration statements and relevant ambient hypotheses read at the exact pins, across 136 distinct module/library pairs; all native ingredient fits confirmed, three descriptions corrected, none removed. |
| API and tests | All 591 API entries and 564 test entries read (the checker counts 586 APIs/528 tests on definitions and constructions); every definition/construction has at least three of each. Their names are accounted for by actual native signatures/examples or the explicit geometric omission ledger. |
| Sources | All node locators/excerpts compared; 41 source-register entries, with shared documents counted once. Ten authored source links recovered at immutable matching PR commits. |
| Planets | All 40 checked: at most six per stage, names at most 37 characters, noun phrases naming definitions, constructions or results. No naming edits required. |
| Scope | Ten correctly ordered stages, all partial; eight gaps and thirteen precise requests retained. No target is claimed planned or closed. The complete packet status denotes its budgeted planning pass. |
| Source findings | E1–E12 independently confirmed at the recorded passages; version-search history is attributed to its original workers. |
| Suggested Lean | Entire native signature/example surface and geometric omission ledger read; canonical full-file compilation unverified because a compiled Tau Ceti import is missing. |

Read WORKERS, both protocols, UPSTREAM_GUIDE and BROWSER_AGENTS. JacobianChallenge and UniversalCovers were the two fully read upstream exemplars; only portions of AlgebraicCurves and ModularCurves were inspected. The review is of this packet’s planned targets and declared boundaries, not recursive completion of every supplier or a new complete extraction of AV23.

## Mathematical corrections and retained checkpoint fixes

The signed root-divisor correction from PR6162 was independently checked and retained. `GC.2/root-divisor-groupoid` is the right action groupoid A_F×/O_√R×, with unit-labelled arrows and stabilizers. Its Picard map additionally takes the left F× quotient. It includes signed divisors: a negative divisor separates it from effective symmetric powers. With E(a)=Σv_x(a_x)x, the Picard line is O(−E); an inverse uniformizer gives E=−x and O(x). The six added APIs and four distinguishing tests remain. [Yun–Zhang, §6.2.3 and Lemma A.5](https://math.mit.edu/~zyun/GZW_ramified_published.pdf).

The retained smoothness locator is the Claim in Lemma A.4(1), p.516, rather than Definition A.3. It requires a smooth irreducible scheme and sections not identically zero. The weighted quotient’s simple-connectivity assertion now explicitly uses an algebraically closed geometric base; finite-field constant covers would otherwise contradict it. Norm and quadratic consumers at indices 68–74 and 78 now explicitly carry the degree-two finite-flat cover hypotheses from their input. [Yun–Zhang, Appendix A](https://math.mit.edu/~zyun/GZW_ramified_published.pdf).

`RS.1/regular-dm` now explicitly assumes a regular **scheme** base and a regular effective Cartier divisor. A regular stack base could already have non-DM inertia, for example BG_m with empty divisor. The retained regularity proof uses the smooth G_m-torsor atlas zⁿ=qf with q invertible; a wild-exponent finite μ_n chart is not a smooth atlas. The local parameter calculation and smooth descent are requested ingredients, not a general regularity theorem printed in AGV. Both scheme and geometric-base corrections are synchronized in the suggested omission ledger. [AGV, Appendix B.2 pp.53–54](https://arxiv.org/pdf/math/0603151v2).

Further corrections in this run:

- `key/root-stacks`: added six API entries and six tests that expose all reserved examples on the key itself, including the nilpotent and wild-inertia counterexamples, transition coherence and noncanonical DVR origin. Their theorem content remains in the existing companion nodes.

- `RS.0/tensor-power` and `section-power`: allow exponent zero, as required by their native recursions and zero tests; root stacks still require positive exponent.
- `key/root-stacks`: its consumer note now distinguishes AGV’s scheme-base construction from the separately requested extension by atlas descent to algebraic-stack bases.
- `GC.3/tame-local-systems`: A.2’s opening paragraph is on p.519; A.2.3 is not on p.520. The adjacent symmetric-local-system locator distinguishes packet E1 from upstream PAPER-YUN-ZHANG-19/E26.
- `RS.0/affine-torsor-determinant`: the cubic test detects using the exponent E rather than (n−1)E in the sign. At n=3 the actual sign is positive; omitting that positive sign does not negate f³. Its existing suggested example already says f³ and required no code change.
- `RS.0/framed-essential-image`: added the existing root-point-lift constructor as a direct prerequisite for the converse, which constructs a chart point from the normalized equation.

No missing general notion was introduced as a duplicate node. The corrected node IDs are preserved. The packet’s `review.corrections` lists all 108 node/baseline field edits in this run, with node-specific reasons in `review.checked`. Source retrieval and review-receipt metadata changes are separately recorded. Corrections inherited from PR6162 were freshly checked, not silently reclassified as new edits.

## Citation repairs

The earlier checkpoint’s eighteen locator/match corrections and added TV Corollary 3.13 finite-chart citation remain valid. They concern the root key, two-pullback, affine chart, closed fibre, regularity, smoothness Claim, root addition, ordered divisors, Abel–Jacobi, modified units, adelic equivalence, associativity/symmetry, auxiliary divisors, effective pullback, high-degree multiplication, trace character and signed divisor groupoid.

This pass replaced paraphrases presented as quotations with literal short source excerpts at packet indices 2–5, 14, 59, 61, 65, 78, 89–94, 312–324, 340–367, 388–390 and 396–404. The immutable reader locators at the authored declaration groups identify the actual surrounding statement/proof section. The node-5 excerpt avoids the printed classify-/ing line break. All excerpts subsequently match after whitespace normalization; this auxiliary check does not certify their mathematical interpretation.

Indices 325–339 are authored finite-cyclic coordinate deductions. Their repaired source is PR5957’s immutable handoff: the opening coordinate summary and the native-proof archive under “Verification and remaining work”. Its prose does **not** print those fifteen declarations by name. The locators now say so; the reviewed deductions use the native quotient and coordinate interfaces. A compact archive or a previous worker’s successful proof replay is not a fresh formal verification in this run.

Nine deleted branch links returned 404; the tenth pointed to a changing main-branch handoff that no longer contained the intended mathematics. All ten were replaced throughout the authorized packet with matching immutable commit URLs. The consumed passages were read, not the entire long reader/handoff at each URL. Exact hashes and retrieval receipts are in the source registry and in this table.

| Source ID | Matching public receipt | SHA-256 |
|---|---|---|
| FactorialCoactionCalculations-codex-a71f92 | [PR5932 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/b1f05aed7e30f49e06f2620842851c0ca9702b0c/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md>) | `50af9163346ebd62216b3903352fd9af9482f204538a40ecbffc5f1f631bb6bc` |
| FactorialCoefficientNaturality-codex-rtOQ9t | [PR5939 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/a1b811af3c68ebf8277f57334475669a79c5e452/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md>) | `4a20025a047fbc2ec73ba68907adc61aaf6f3e6ca9429e20a687cbb83a3d603e` |
| FactorialConvolutionPoints-codex-5ebb6f | [PR5945 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/04e2ce014b6b5ee40c61bfff758fa5aff1e55016/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `a1d130a2d8ce8da4512e0cc17491bc1443e4f222cb48d426619ecea7210ba1b8` |
| FactorialPointAction-codex-a71f92 | [PR5950 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/71541cc03d659e6790ee25fb92b9b9fda577f5e2/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `10b6ea89549ddfb5cbeac2dde537ab32ee580d18b55df1ef11d5972b831a065e` |
| FiniteCyclicCoordinates-codex-7e92bd | [PR5957 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/48a75526ba9c32c5401328c8611a38e425a019ce/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md>) | `7629a89bfd6449e4ff4de5f5197bef2088d12583b15337c430429b960b8a5b62` |
| QZCoordinates-codex-J6LwjP | [PR5964 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/aae1a6c273388af273204f2d9d2bb4afb96da71f/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `3174541b5589952de8231cf692358f48b7230bff63ee3ebb05a54233d0c32033` |
| QZCoaction-codex-a71f92 | [PR5970 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/4c16f370fda9213bd8e938345dc8aec90ac84608/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `dd5b6cb0cf5b0726fd0cfa1c30baae6d283db97bda4c096f8e469146b8e54857` |
| QZCoefficient-codex-rtOQ9t | [PR5978 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/9a1dd4fb6f950d9ca6f37fa8ee8814700ad6a6d6/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `6d8a9e55fe371854cdc719b11e106c8edff363fc3ae37290e62746f148fb4626` |
| QZNative-codex-7e92bd | [PR5985 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/29a0d57d6af9459dd1d32d6a1723b9a77bb43c9c/research/blueprint/handoff/DESIGN-FunctionFieldArithmeticPartII.md>) | `76be897c917d8d4c222f0dac864c1bff05c0cbf8e5a79e2f4334564360a6943d` |
| InfiniteCoinvariants-codex-a71f92-N24 | [PR6003 commit](<https://github.com/CBirkbeck/tauceti-explorer/blob/1644fce584291a1327802b3f2a977a072f3b59d1/research/blueprint/readmes/FunctionFieldArithmeticPartII.md>) | `81eae1d7a63717d341561ff72094f1bb631079bef623d30d8b69a3b6b1d4f7e7` |

## Exact-pin baseline and supplier audit

Mathlib pin: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti pin: `f790474821cf4256814db967cb154e7af3d0c369`. Statements were read from those exact git objects; the shared Tau working tree was not assumed to be at its pin. Every baseline entry now has a fresh independent receipt. `review.baselineChecked` records the module, corrected ingredient contract and direct consumers for all 347 entries; some carriers and API ingredients occur only in suggested signatures or indirectly, so their direct-consumer lists are empty.

Three `provides` descriptions were corrected:

| Declaration | Correct native scope |
|---|---|
| ZMod.finEquiv (index 88) | Requires NeZero n; no Fin 0 ↔ ZMod 0 equivalence. |
| Algebra.TensorProduct.map_comp (index 222) | Composition over fixed R and S with the displayed algebra/scalar-tower assumptions. Heterogeneous coefficient change uses the separate mapRingHom interface. |
| AddCircle.coe_eq_coe_iff_of_mem_Ico (index 228) | Positive-period representatives in an Archimedean linearly ordered additive commutative group; it is not limited to an ordered field. |

The full native review includes sheaf free/unit sections and tensor maps, quotient-root lifts and bases, Hopf/group-algebra maps, rational-circle coordinates, groupoid identity/composition/inverse conventions, directed systems, colimit/limit factorization and uniqueness, Spec pushout/pullback orientation and Over pullback’s swapped projections. These declarations provide ingredients under their actual assumptions; none supplies the missing geometric stack comparison by itself.

Read the reviewed library-audit entries for the owning SF, FA and R09 layers and their actual atlas contracts. Exact-pin name searches for root-stack/quotient-stack spellings found no Lean hits; this is a bounded search, not proof of absence of every equivalent notion. Existing schemes, line bundles, derived/native algebra, quotient roots, roots of unity, group algebras and limits remain imported.

The sixteen explicit external-node prerequisites were compared with their supplier statements. In particular the AlgebraicModuli A0 extension supplies arbitrary-QCoh fpqc descent, fixed-rank finite-locally-free descent, classifying gerbes/neutralization and affine inverse-limit inputs; it does not by itself construct the requested tower of root frame torsors. IG.0/IG.1 and SF.1/SF.3 contracts are requested at their atlas stages rather than falsely attributed to the presently available IG.2/SF.0 packets. The parent function-field direction supplies adeles, divisors and Riemann–Roch, with family/stack adapters requested separately. Upstream notes preserve that distinction.

The reserved `FunctionFieldArithmeticPartII:key/root-stacks` occurs once. Its root-of-section and effective-Cartier scope remains general, with algebraic-stack bases and arbitrary positive exponents requested honestly. All six reserved sample API contracts and six corresponding distinguishing tests are now explicit on the key itself. They refer to its existing finite-chart, full-fibre, coarse/base-change, regular/DM, transition/limit and DVR companion nodes; no second definition is introduced. Their new interface names are recorded in the suggested geometry omission ledger, not claimed as Lean declarations. `StableReductionPartII:key/moduli-curves` is imported only in the symplectic routing boundary; no second moduli-curves definition is planned here.

## Source findings and fresh reading boundaries

| Finding | Independent verdict and limit |
|---|---|
| E1 | Confirmed: unshifted K is not perverse; use K[d]. |
| E2 | Confirmed: the zero fibre retains t²=0, beyond its reduced μ₂ gerbe. |
| E3 | Confirmed: arbitrary global rank-one character, order-two local inertia. |
| E4 | Confirmed: product Abel–Jacobi pullback. |
| E5 | Confirmed: restrict a, not a_R itself. |
| E6 | Confirmed: auxiliary divisor effective, away from R, sufficiently large. |
| E7 | Confirmed: the three missing Pic superscripts. |
| E8 | Confirmed as the recorded interpretation/proof gap. The degree-two P¹ test excludes ordinary Picard-class kernel/image exactness; it does not refute every coherent stack interpretation. NORM-2EXACT remains open. |
| E9 | Confirmed: t_R, not τ_R. |
| E10 | Confirmed in Alper 2023: the zero-section fibre has nonzero nilpotent root sections. The 2026 Caution corrects it. |
| E11 | Confirmed in Alper 2023: off the zero divisor the root map is an isomorphism; at zero it has an infinitesimal gerbe extension. The 2026 exercise corrects it. |
| E12 | Confirmed only in AGV arXiv v2: p.53 prints exponent m, although the identification uses d. The page image was checked. Published collation remains unestablished. |

The individual packet reasons and `review.by` identify this review; the fresh session/date are explicit. Earlier erratum searches and selected later-version collations remain historical receipts. This run does not claim to have repeated every correction search or read every historical version in full.

| Public source | Fresh scope actually read | SHA-256 |
|---|---|---|
| [YZ19](https://math.mit.edu/~zyun/GZW_ramified_published.pdf) | Appendix A pp.514–526 in full; §6.2 pp.496–499 and §7.1.1 p.506; source statements/proof plans and all consumed formulas. | `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c` |
| [AGV08](https://arxiv.org/pdf/math/0603151v2) | Appendix B pp.52–54 in full; rendered p.53 exponent checked. | `c2889c567c21aa5473ba0be75221dbb67ca122210fa4e4973f4727c490bdd5eb` |
| [TV17](https://arxiv.org/pdf/1410.1164v2) | §3/§3.1 pp.12–16, including the stated proofs; authored scalar/coaction variants distinguished from printed theorems. | `92a90d1e3d9ac46e17de8cc9d9524c1621d5e2a8caea7938de61d6503ec2a6c2` |
| [B24](https://link.springer.com/content/pdf/10.1007/s00222-023-01220-6.pdf) | pp.132–136, including the characteristic-zero convention and finite/infinite DVR-root passage. | `77c20bc77743abd3cabedbe6259a4bd686cb94823481bce724c3517b1c30e148` |
| [AV23](https://arxiv.org/pdf/2303.13436v1) | pp.1–2, 26–28 and 35; the 38 split-route contracts/locators checked as a nonaccepted routing inventory. Not the whole paper or its full symplectic proof closure. | `3e2736beea70ba3467ad30a24b518d82cf589d9ddd4a06f6b0684c7bfd7d6306` |
| [Alper 2023](https://sites.math.washington.edu/~jarod/moduli-versions/moduli-2-23-23.pdf) | pp.138–139, root-stack definitions and E10/E11 passages. | `d97ca3395446c719f53182bbe1976c76aa6603a0fb99a7705016caad87a1ce91` |
| [Alper 2026](https://sites.math.washington.edu/~jarod/moduli.pdf) | pp.158–160, corrected Example4.9.22 Caution and Exercise4.9.23(f). | `f07437af689e9ae4ccd355183f357d234474606a4e0d6511ff2d4ac0a4f14d6d` |

The shared Stacks sources were read at their public pages: [040N](https://stacks.math.columbia.edu/tag/040N) (Kummer statement/proof), [022Y](https://stacks.math.columbia.edu/tag/022Y) (group actions and quotient sheaf), [01YW](https://stacks.math.columbia.edu/tag/01YW) (affine inverse limits), [021M](https://stacks.math.columbia.edu/tag/021M) (fppf coverings), [04V8](https://stacks.math.columbia.edu/tag/04V8) (root-stack literature description) and [01JO](https://stacks.math.columbia.edu/tag/01JO) (scheme fibre products and proofs). The root-specific arrow, frame normalization, coefficient-change and two-/three-step coherence lemmas are reviewed deductions using these ingredients, not named theorems printed on those pages.

## Acceptance blocker and durable handoff

The definitive reader `research/blueprint/readmes/FunctionFieldArithmeticPartII.md`, around its “Root divisors supported away from R” heading, still says the §6.2.3 groupoid is the effective open. Its node kind is also still Comparison. This unresolved contradiction prevents acceptance. The issue lists only the roadmap, packet, suggested file and review report, so the reader was not edited.

The orchestrator must route or authorize reader synchronization from the corrected packet: signed right-action groupoid, distinct Picard double quotient, labelled automorphisms, divisor/Picard sign, six APIs, four tests and supplier prerequisites. It must also synchronize the retained smoothness/wild-atlas fixes and this pass’s scheme-base/geometric-base hypotheses, tensor exponent, norm inputs, determinant test explanation, source excerpts and immutable links. The roadmap’s existing GC.2 description already agrees; no roadmap edit was needed in this pass.

The remaining gaps are ST-LISSE, ST-OPS, NORM-2EXACT, FA-APPROX, EXTERIOR-COMP, LEAN-GEOMETRY, LEAN-SECTION-COMP and TOWER-TYPING, with the existing precise stage/request boundaries. These honestly partial layers are follow-up work, not an unfinished independent review. The AV23 split is still a separate unaccepted restructuring/extraction route; this review neither accepts it nor promotes any file.

## Validation

The structural checker reports 717 nodes, 347 baseline entries, 586 APIs, 528 tests, 40 planets, eight gaps, thirteen requests and **zero errors/warnings**. Source-issue and source-version validation, intake file checks and diff whitespace checks passed; preservation checks passed and the queue’s completed-review predicate returned true. Review coverage is exactly the node/baseline inventory; implementationStatus remains unchecked for every node, and no stage is planned or closed.

One canonical `lean-check` was attempted after checking that more than 20 GiB were available. It stopped at the missing compiled `TauCeti.Algebra.AddCircle` import, before any declaration was elaborated. The final suggested-file changes are mathematical statements and key API/test names in the omission ledger; native declarations are unchanged. No library build, update, cache fetch, Lean language server or extra project was started. No successful inherited native replay is represented as fresh canonical compilation.

The [handoff](../handoff/REV-DESIGN-FunctionFieldArithmeticPartII.md) and packet receipts contain the required durable information; no deleted scratch archive is needed. This job ends with one review PR and no second claim.
