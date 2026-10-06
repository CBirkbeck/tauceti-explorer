# Independent review: potential modularity and compatible systems

Verdict: **needs_changes**. Completed by Codex, session `codex-GctJKn`, on 2026-10-06. Refs #473. Review job: `REV-PotentialModularityAndCompatibleSystems--R23.1`.

The input is the target-level packet from `BP-PotentialModularityAndCompatibleSystems--R23.1`, last changed at `820e503d` in PR #6731 by a different worker/session (`codex-o6iGoa`), including the earlier `cc-39fac3` work. This review used explorer HEAD `59f0e3a58dbab7914cde373916399268e48a38bb`. It did not author either input.

All 49 mathematical nodes have been checked against their cited passages and their direct interfaces. Clear fixes are applied to the packet and suggested file. Acceptance is prevented by mathematical contradictions still present in the reader document, which this issue does not authorize editing. This is a completed negative review, not a checkpoint. The listed gaps are honest remaining work at target level; their existence does not by itself require rejection.

## Counts, coverage and granularity

| Item | Input | Reviewed |
| --- | ---: | ---: |
| Nodes | 49 | 49 |
| Definitions / constructions | 1 / 3 | 1 / 3 |
| API items | 22 | 36 |
| Unit-test specifications | 16 | 22 |
| Planets | 17 | 17 |
| Baseline declarations | 9 | 9 |
| Explicit gaps | 15 | 22 |
| Open supplier requests | 30 | 33 |
| Source issues | 7 | 9 |
| Planned / closed stages | 8 / 0 | 8 / 0 |

The per-node verdicts are **25 corrected, 24 verified, zero added and zero unverifiable**. These verdicts certify the mathematical target statements against the read sources, subject to their explicit missing proof inputs; they do not certify a closed proof graph or elaborated Lean. The `review.checked` object records all 49 full IDs. No baseline citation was removed, replaced or added. The pass remains `complete`, all implementations remain `unchecked`, and no stage becomes `closed`.

The target-level grouping of MB reductions, Taylor weight/level packages and the several finiteness applications is appropriate. A missing lemma-level decomposition is not a defect at this granularity. All stated stage targets have nodes or, for the process-only R23.6 panel, the separately typed R23.3–R23.5 exports and the explicit introduction/integration proposal. No artificial theorem or planet is introduced for that panel. Each stage's `remaining` list now includes its relevant explicit gaps and outstanding interfaces.

Read the conventions, scope and interface portions of the upstream Modular Forms and Modular Curves documents, including coefficient fields, relative Picard boundaries, finite-etale/Galois equivalence and the dependency lanes. The reviewed library audit has no row keyed by this roadmap, but other owners' rows refer to it. H6/AUDIT-15 leaves the twisted moduli, local points and pairings unbuilt; SF.3/AUDIT-01 already contains invertible sheaves/classes and function-field curve theory, while relative scheme Picard/cohomological duality is missing. Those are imports/extensions of their owners, not duplicate new foundations in this packet.

## Corrections applied

1. **Moret–Bailly splitting.** The theorem's field criterion had `K′⊗_K K_v` equal to copies of `L_v`. It is `K′⊗_K L_v` as an `L_v`-algebra. The choice `K′=K` and nontrivial `L_v/K_v` disproves the inherited stronger formulation. Definition 1 and its existing API already stated the correct convention. The theorem now agrees.

2. **Taylor's local characters and coefficient fields.** New E9 corrects the p. 776 norm to `q_v=l^f_v`. For `chi_v²≠1`, compare reductions with beta and its conjugate; Lemma 1.1 does not specify exact arbitrary p-adic lifts. For `chi_v²=1`, the prescribed reduced Frobenius value is ±1, so distinctness needs `p∤q_v−1`. This is an explicitly marked finite extra exclusion, compatible with choosing p by Chebotarev. The chosen lambda_0 has `(1+sqrt(1−4l))/2` reducing to 1, and the norm-p alpha is taken in its wp_0-unit conjugate. Distinguishedness is on the full local decomposition group; the inertia characters can agree. In the suggested object N and M are finite coefficient extensions of Q, not intermediate extensions of F.

3. **Cyclotomic and ordinary conventions.** The algebraic identity `alpha_w alpha_w^c=p` at `w|p` is not a p-adic cyclotomic value on a Frobenius lift. The character is ramified there and unit-valued. Removed that invalid interpretation from acceptance/tests. Applied the already recorded E4 repair `omega⁻¹` to the proof of Lemma 1.5, so it excludes n=1. New E10 records the two printed symmetric-power exponents; the packet correctly uses `Symm^i` for weight i+2.

4. **Source inputs and fine suppliers.** Added the Frobenius-existence node as a direct Taylor auxiliary prerequisite. Lemma 1.1 assumes the quadratic L; it does not construct it, so the exact simultaneous auxiliary-prime condition and quadratic/coefficient field choices are separately gapped. Added missing KW Annals H6, base-change, quaternionic and Hida inputs. Used `PadicFamilies:L5/hida-control-nearly-ordinary` for its actual even-degree parallel-weight specialization, retaining the extra family/nonemptiness/endpoint request. Replaced coarse local-point R23.2 dependencies by the application node while preserving the distinct H6 contracts for the other branches. Corrected H6 request self-references to actual consuming nodes, removed the unrelated relative-Picard prerequisite from the elementary/spreading-out reductions, and assigned that request to the Picard construction.

5. **Near misses and owners.** Replaced Snowden's odd auxiliary lifting dependency on dyadic R22.6 by an exact R22.5 request and gap; the current KW odd theorem is narrower than the needed Snowden interface. Recorded the missing torsion Fontaine–Laffaille and full Hilbert crystallinity inputs rather than treating the rational comparison or parity-constrained Carayol input as sufficient. Added normalized local reciprocity to CHT and global/local character inputs to Taylor. BCGP 9.1.12 now uses general number-field approximation/finite-quotient specialization, not Bianchi's CM/Q-Galois specialization theorem.

6. **Weil restriction.** Reused the fine A6 functor, quasi-projective representability and separable-extension geometric-product nodes in all five consumers. A generic smooth variety is not automatically quasi-projective; for BLGHT/Bianchi reduce to a dense affine open, using local analytic density to keep each prescribed open nonempty. Smoothness/geometric connectedness and local topology of Weil restriction remain an exact adapter gap. The abelian-scheme Weil-restriction statement is not substituted for the variety theorem.

7. **Suggested interfaces and tests.** Added normalized field-point projections, completeness congruence and morphism action; rigidified quotient equality, quotient descent/evaluation, a group signature and pullback descent; auxiliary witness accessors with the actual dyadic weight guard; and auxiliary prime, conjugation and determinant evaluation APIs. Added six tests for all embeddings, rigidified isomorphisms, boundary-sensitive equality, forgetting to pinned classes, full local character distinction and the corrected beta norm. Four auxiliary-field tests now use the actual reduced object. Corrected test-kind vocabulary. Full relative Picard, geometric normalization, place and automorphic interfaces remain explicitly omitted, as Protocol §13 permits, with precise follow-up specifications.

8. **Proof/verification claims.** Deduplicated the R03.4 extraction prerequisite. NT now records the p≥5, determinant, large residual image and local-component setup of Lemma 3.1, including the Hida-supplied ordinary {0,2} local lift. Removed claims that the Taylor polynomial/weight acceptance computations were checked in the suggested file: they were absent. The file's opening now reports this review's actual elaboration failure and attributes, without certifying, the earlier author's arithmetic-fragment claim.

The seven new gaps name: algebraic CM characters/S-unit congruence; odd auxiliary lifting with Snowden type data; torsion Fontaine–Laffaille/full Hilbert crystallinity; Weil-restriction properties/local topology; local analytic density/excellence; full suggested object interfaces/tests; and Taylor's auxiliary prime/quadratic/coefficient field choices. The existing unread imported proof inputs remain explicit rather than being silently discharged.

## Baseline statements at the exact pins

Mathlib: `082e2d37e8b0463410cdb532e111cd43d5a66174`. Tau Ceti: `f790474821cf4256814db967cb154e7af3d0c369`. Read each declaration and its surrounding section parameters at these commits.

| Declaration | Module and line | Exact use and limit |
| --- | --- | --- |
| `IntermediateField.LinearDisjoint` | Mathlib `FieldTheory/LinearDisjoint.lean:157` | Subalgebra linear disjointness, via tensor injectivity; not defined as trivial intersection. |
| `IntermediateField.LinearDisjoint.inf_eq_bot` | Same module, line 394 | Disjointness implies trivial intersection. |
| `IntermediateField.LinearDisjoint.iff_inf_eq_bot` | Same module, line 468 | Requires the finite-dimensional hypotheses and Galois left extension; not an unconditional converse. |
| `NumberField.Chebotarev.frobeniusPrimeSet` | Tau Ceti `NumberTheory/Chebotarev/FrobeniusPrimeSet.lean:93` | Defines primes with an Artin conjugacy class for number fields/Galois extension; proves neither density nor existence. |
| `AlgebraicGeometry.Spec` | Mathlib `AlgebraicGeometry/Scheme.lean:468` | Scheme spectrum; field-valued points are morphisms from it. |
| `AlgebraicGeometry.Scheme.Modules.pullback` | Mathlib `AlgebraicGeometry/Modules/Sheaf.lean:182` | For X→Y, sends Y-module sheaves to X-module sheaves; supports the actual boundary rigidification. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf` | Tau Ceti `AlgebraicGeometry/LineBundle/Basic.lean:78` | Rank-one full subcategory; import it. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf.trivial` | Same module, line 97 | Existing trivial line bundle, with its singleton-rank freeness. |
| `TauCeti.AlgebraicGeometry.LineBundleClass.mk_eq_mk_iff` | Tau Ceti `AlgebraicGeometry/LineBundle/Class.lean:62` | Unrigidified quotient equality iff an isomorphism exists; it does not impose compatibility with a boundary trivialization. |

The pinned class API supplies a commutative monoid, not the full relative Picard group/functor/representability asserted by MB. That extension and its inverse/pullback compatibility are requested from SF.3/R09.3. None of the nine citations is a false baseline claim after these limits are respected.

Concrete supplier statements checked include the R03.4 algebraic point extraction, R04.2 Carayol descent, R04.3 dimension bound, R04.6 data/trace/factorization, R08.6 completed tensor/nonemptiness, R22.3 conditional minimal-ring finiteness, R22.5 odd lifting/residual/base-change nodes and R22.6 dyadic lifting, plus the three A6 nodes and Hida control. Read the remaining referenced stage scopes. In particular: an integral-closure algebra map does not by itself give a continuous local p-adic lift; positive-Hodge-number/parity-limited crystallinity is not full Hilbert crystallinity; and the existing ordinary CM-excluding lifting interface does not settle Taylor's CM-induced auxiliary case. Opaque supplier stages are not certified closed or acyclic mathematical proofs by the packet checker.

## Public source verification

Fetched all 19 recorded PDF artifacts; every SHA-256 matches the packet. Their exact URLs, editions, locators and hashes remain in `sources`/`sourceVersions`. Checked every node's locator and literal excerpt, including the corrected Bianchi/BCGP/BHKT excerpts. Critical MB degree bounds/lemma number and Taylor character/exponent formulas were checked on page images. This is a review of the cited passages and proof inputs, not a claim to have newly read all 19 papers or their entire citation trees.

| Public source | Passages checked |
| --- | --- |
| [Moret–Bailly II](https://www.numdam.org/item/10.24033/asens.1582.pdf) | §§1–3, definitions, reductions, degree bounds, strong approximation and compact quotient. |
| [Moret–Bailly I](https://www.numdam.org/item/10.24033/asens.1581.pdf) | 1.7/1.11, pp. 162–163, empty-local-data/Rumely route. |
| [Taylor 2002 author copy](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf) | Theorem G; §1 auxiliary choices/characters/local points; 1.5–1.7, including pp. 7–9/11/15 images. |
| [KW II author copy](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | 6.1/proof, 4.5/4.7, 8.2, 10.1 and 10.3. |
| [KW Annals](https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf) | 2.1/proof, pp. 234–237. |
| [Taylor 2006](https://ems.press/content/book-chapter-files/27484) | 1.3–1.5, 4.1/4.6/proof, §5 and corrections pp. 776–777. |
| [Qian](https://par.nsf.gov/servlets/purl/10388233) | §2 disjointness facts, 4.2 and application. |
| [CHT](https://pmihes.centre-mersenne.org/item/10.1007/s10240-008-0016-1.pdf) | 4.1.1–4.1.2 and proofs, pp. 116–117. |
| [BLGHT](https://virtualmath1.stanford.edu/~rltaylor/cy2fin.pdf) | 6.2, pp. 40–41. |
| [BHKT author v2](https://arxiv.org/pdf/1609.03491v2) | §9, compared with publication and correction. |
| [Bianchi v3](https://arxiv.org/pdf/2309.15880v3) | 4.5.1 and proof, pp. 48–49. |
| [BCGP publication](https://pmihes.centre-mersenne.org/item/10.1007/s10240-021-00128-2.pdf) | 9.1.11–9.1.12, pp. 458–459; 9.2.7 use of local data. |
| [Snowden](https://arxiv.org/pdf/0905.4266) | 5.1–5.2, auxiliary construction and 8.1–8.2 descent/approximation. |
| [Calegari](https://arxiv.org/pdf/1012.4819) | 3.1–3.2 and proofs. |
| [Thorne](https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf) | 10.2 setup/proof, pp. 56–58. |
| [Calegari–Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf) | 4.8 proof, pp. 65–68, unframed finiteness and R-dagger. |
| [Newton–Thorne v2](https://arxiv.org/pdf/2212.03595v2) | §3 setup and Lemma 3.1 proof, pp. 12–14. |
| [BHKT publication](https://intlpress.com/site/pub/files/_fulltext/journals/acta/2019/0223/0001/ACTA-2019-0223-0001-a001.pdf) | 9.1–9.3, pp. 76–79. |
| [BHKT correction](https://arxiv.org/pdf/2502.20611v1) | p. 28, Isom-scheme and nonconstant-point correction. |

All nine source issues E2–E10 have an independent `confirmed` review, with reason and this job ID. E2 is the KW (iii)(b) reference; E3 the actually printed 3.30.2; E4 the ordinary inverse character; E5 the local character index; E6 the three Taylor variable/reference slips; E7 the BCGP containment/descent inconsistency; E8 the BHKT finite-etale base error (also addressed in the 2025 correction). No inherited issue is rejected.

New **E9** is an error in the displayed norm and its proof justification, not a claim that Taylor's theorem is false. If a=(1+sqrt(1−4l))/2, then aa^c=l, so `(zeta^b a^f)(zeta^b a^f)^c=l^f`. This differs from the separately chosen prime p. The determinant identity away from p gives q_v, and the residual Teichmüller case needs the separate finite exclusion above. New **E10** is a harmless coefficient misprint: the p. 765 filtration and p. 739 weight convention force `Symm^i`, of dimension i+1, in both factors printed with i+2 on p. 766. Targeted public erratum searches found no existing correction for these two specific slips; that does not claim an exhaustive literature search.

## The eight confirmed red-team findings

Read both `RT-AREA-langlands-2.result.json` and its independent verification. Checked the packet and reader for every assigned finding.

| Finding | Result of this review |
| --- | --- |
| `/3`, R23.3 missing suppliers | Concrete Taylor/KW/Snowden/BCGP residual exports now name lifting, weight/level, Hida, Hilbert Galois and auxiliary-compatible inputs. Exact near misses stay gaps; no original lift is smuggled in. |
| `/23`, R23.2 H6 duplication | The prior three H6-owned nodes remain removed. Applications import the H6 twist/components/local objects; request consumers corrected in packet. Reader request list still has H6 self-references. |
| `/24`, R23.5 base-change duplication | The existing narrow control node imports R17.4/R17.6; no independent copy of automorphic descent or automatic modularity at intermediate fields. |
| `/25`, MB three local conditions | S1/K_v, S2/K_v^nr and S3/Kbar_v remain distinct, with correct open/invariance/split/unramified conditions. |
| `/26`, CHT/Grunwald–Wang | No fixed cyclic degree is imposed. Number-field finite local Galois groups are soluble; they are legitimate local inputs. Character extension uses divisible roots of unity and finite quotients. |
| `/27`, Frobenius generation | The pinned set definition is not treated as prime existence. Number-field density is imported; arithmetic function-field Chebotarev with constant congruences stays gapped. |
| `/28`, Snowden/BCGP variants | Any continuous odd original representation over totally real F is allowed in Snowden; (A1),(A2) are for auxiliary/given-lift/descent inputs. Stable avoidance and split-place type compatibility remain. BCGP representation base F1 and avoidance F1Favoid are correct. Snowden's global-lift descent input is not discharged with this packet's R24.2. Corrected odd lifting owner in packet; reader still wrong. |
| `/29`, finiteness/extraction | KW/Thorne/CG rings are unframed finite; framed power-series variables are not finite over O. Thorne ordinary/polarized hypotheses, CG modified local ring and NT dimension/component inputs remain explicit. Finite p-torsion alone does not give a characteristic-zero point. |

## Remaining contradictions and revision scope

The read-only [reader document](../readmes/PotentialModularityAndCompatibleSystems--R23.1.md) needs these concrete repairs before acceptance:

| Reader location | Required correction |
| --- | --- |
| Line 300, MB theorem field criterion | Replace K_v scalar extension by L_v, as in its own definition and the reviewed theorem. |
| Lines 611–647, Taylor auxiliary statement/conditions/API/tests/acceptance | Incorporate E9, the Teichmüller branch and extra prime exclusion, compare residual values, remove the alpha norm/cyclotomic-at-p identification, and distinguish the independent field choice from Lemma 1.1. |
| Line 773, Taylor 1.5 proof | Apply omega⁻¹; its conditions/source-issue section already says this while the proof still uses omega. |
| Lines 918 and 960 | Remove claims of Lean-checked polynomial/weight calculations unless those exact tests are provided and checked. |
| Line 979 and request at 1256 | Route odd auxiliary lifting to the precise R22.5 interface/gap, retaining separate dyadic lifting. |
| Request lists at 1244 onward | Replace H6 self-consumers, use the corrected Picard/character/FL/Weil-restriction requests and partial fine Hida input. |
| Four object API/test tables and gap/coverage ledger | Synchronize the new 36-item/22-test outline and all seven new precise gaps, while labeling the suggested file's reduced interfaces honestly. |

Protocol §13 permits clearly stated omitted conditions when supplier APIs do not yet exist. The reduced examples are not a proof of the full geometric/automorphic tests. Acceptance should assess the accurate full mathematical specification and its honest omissions, not demand that all 22 gaps be solved in this revision. The reader's contradictory formulas, proof and supplier routing are the unresolved errors that require revision.

Questions for the orchestrator: include the reader document among the next revision's authorized paths so that these corrections can be made together; confirm the precise odd auxiliary/Skinner–Wiles CM-case supplier contract through R22.5/R21.5 rather than dyadic R22.6; retain the specialized Thorne and CG adapters as independent supplier work. No change to Tau Ceti's own roadmap files is proposed.

## Validation and its limits

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialModularityAndCompatibleSystems--R23.1.json`: passed, zero errors and zero warnings.
- `scripts/check_errata.py`: passed on an `errata-v1` projection of this packet's `sourceIssues` and `sourceVersions`, named for this roadmap as the checker requires. This verifies the errata schema; the projection is scratch, not an extra deliverable.
- Source hashes, complete per-node review coverage, API/test name presence, allowed paths, unchanged baseline identity and `git diff --check`: checked.
- Ran `lean-check` on the complete suggested file, initially and after corrections. The final attempt had 104 GB available, and stopped at the first import because `TauCeti.AlgebraicGeometry.LineBundle.Class.olean` is absent. The shared Mathlib source is exactly pinned; the shared Tau Ceti HEAD differs, although the relevant line-bundle source blobs match. **No declaration or example in this file is certified elaborated.** No library build, cache fetch, Lake project or language server was started.

The 17 retained planets name central objects/results, obey the six-per-layer limit, and contain no process checks. No promotion, implementation or closed-proof claim is made.

## Per-node record

The full IDs and these notes also appear in the packet's `review.checked`. The short keys below are unique within this packet.

| # | Node key | Verdict | Check or correction |
| ---: | --- | --- | --- |
| 1 | `skolem-datum-and-integral-point` | corrected | Checked MB II 1.1–1.2/1.5/1.8. Extended normalized field-point projections, completeness congruence, morphism API and an all-embeddings test; full geometric comparison remains an explicit gap. |
| 2 | `density-of-algebraic-and-separable-local-points` | verified | Checked MB II 1.6.1–1.6.2 and 2.1. Kept generic smoothness, flatness/surjectivity and excellent/separable-completion hypotheses; recorded the local analytic density supplier gap. |
| 3 | `elementary-reductions-of-skolem-data` | corrected | Checked MB II 1.4/1.9/1.10. Removed the irrelevant relative-Picard prerequisite; Chow/spreading-out belongs to SF.4, with local analytic density explicitly missing. |
| 4 | `reduction-to-relative-dimension-one` | verified | Checked MB II 2.2–2.4. Target-level grouping is appropriate; Bertini and spreading-out are explicit supplier inputs, not routine deductions. |
| 5 | `generalized-picard-functor-and-effective-divisor-fibration` | corrected | Checked MB II 3.1–3.6, including the degree bound. Added rigidified quotient equality/descent, group/pullback outline and discriminating quotient tests; moved the relative Picard request to its actual consumer. |
| 6 | `local-picard-open-sets-and-strong-approximation` | verified | Checked MB II 3.7.2/3.8. Preserved the two distinct degree inequalities and incompleteness; the projective-module strong-approximation extension is an explicit gap. |
| 7 | `quasi-compactness-of-the-generalized-jacobian-quotient` | verified | Checked MB II 3.9–3.10.4 and the printed 3.30.2 typo. Kept compactified-Picard and S-unit compactness imports explicit; no baseline compactness claim. |
| 8 | `moret-bailly-theorem-incomplete-skolem-data-have-integral-points` | corrected | Corrected K′⊗K K_v to K′⊗K L_v as an L_v-algebra. Checked MB II 1.3 and the empty-Σ Rumely passage in part I; the stronger completion prescription is false. |
| 9 | `taylor-theorem-g-split-completely-points-are-dense` | verified | Checked Taylor Theorem G and KW II its local-open use. Retained smoothness, geometric irreducibility, quasi-projectivity and the distinction between maximal split field and finite point field. |
| 10 | `forcing-linear-disjointness-by-extra-split-places` | verified | Checked the KW avoidance argument and pinned disjointness declarations. Galois intersection reasoning is valid only with its stated hypotheses; Frobenius existence and almost-all local points are separate inputs. |
| 11 | `kw-ii-theorem-6-1-potential-modularity-of-rho-bar-over-a-controlled-F` | corrected | Checked all KW II 6.1 branches and dyadic/weight exceptions. Replaced the coarse local-point stage by its application node, used the dyadic lifting node, and added the existing Hida specialization as a partial supplier. |
| 12 | `kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity` | corrected | Checked KW Annals 2.1, including p odd, k≠p and ordinarity. Added H6/local-point, soluble base-change, definite quaternionic and Hida inputs; unread endpoint inputs remain gaps. |
| 13 | `auxiliary-totally-real-field-for-the-finiteness-argument` | corrected | Checked KW II 10.1 setup and 6.1/8.2 consumers. Guarded the type-(A) witness by p≠2 or weight 2 and replaced arithmetic-only auxiliary tests with tests involving the actual reduced object. |
| 14 | `kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring` | verified | Checked KW II 10.1 proof. Finiteness is for the unframed ring; restriction and finite-image descent use separate imported deformation results and retain their open proof inputs. |
| 15 | `characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` | corrected | Checked KW II 4.5/4.7 and 10.3.1. Removed a repeated extraction prerequisite; the local/continuous p-adic point adapter remains distinct from the algebraic integral-closure theorem. |
| 16 | `theorem-g-from-moret-bailly` | corrected | Checked the deduction of Theorem G from MB II 1.3/1.5. Removed a relative-Picard dependency, retained spreading-out, and recorded the nonempty local-open density input. |
| 17 | `potential-modularity-of-a-given-lift` | verified | Checked KW II 10.3.2 against lifting supplier statements. A lift is input data; this export is not used to prove the existence of that lift. |
| 18 | `control-of-the-extension` | verified | Checked KW II 6.1(iii)(a)–(d) and the dihedral branch. Local containment, splitting, image preservation and avoidance remain distinct; descent is conditional on its own hypotheses. |
| 19 | `taylor-auxiliary-data-p-L-psi-N-M` | corrected | Corrected Taylor E9: q_v norm, separate Teichmüller branch and finite prime exclusion, residual rather than exact character values, full decomposition-group distinction and coefficient fields over Q. Added the Frobenius prerequisite, unit choices and a separate field-choice gap; expanded API/tests. |
| 20 | `taylor-lemma-1-1-characters-of-cm-extensions-with-prescribed-local-reductions` | corrected | Checked Taylor 1.1 statement/proof and E5. Added global/local reciprocity prerequisites; the algebraic CM character and S-unit congruence input are a precise gap, not a consequence of finite-order CFT. |
| 21 | `local-points-at-l-p-infinity-and-the-point-over-E` | verified | Checked Taylor pp. 13–15 and the 2006 local-point application. H6 owns the twisted moduli and all local objects; this node only applies approximation and evaluates its supplied family. |
| 22 | `taylor-lemma-1-5-ordinary-shape-of-the-lambda-adic-tate-module-at-l` | corrected | Applied the already recorded E4 correction ω⁻¹ to the final proof step of Taylor 1.5; it now implies the excluded n=1 rather than n=l−2. |
| 23 | `modularity-of-the-auxiliary-abelian-variety-transfers-to-rho-bar` | verified | Checked Taylor pp. 13/15 transfer and the lifting supplier. Induced residual modularity is independent; the CM-induced Skinner–Wiles near miss is explicitly retained as a gap. |
| 24 | `taylor-theorem-1-6-potential-residual-modularity-ordinary-at-l` | verified | Checked Taylor 1.6/1.7 and the corrected determinant/twist proof on 2006 p. 777. The soluble-image input and unprinted Corollary 1.7 proof are explicitly imported/gapped. |
| 25 | `taylor-2006-potential-modularity-when-residually-irreducible-at-l` | verified | Checked Taylor 2006 4.1/4.6. Kept niveau-two exponents, even degree, split l and the central-character refinement; H6 supplies the two auxiliary moduli twists. |
| 26 | `taylor-2006-lemma-1-3-quaternionic-forms-and-galois-representations` | verified | Checked Taylor 2006 1.3 and the Hecke realization passage. Jacquet–Langlands, Hilbert Galois representations and Carayol descent are read supplier interfaces, not new objects here. |
| 27 | `taylor-2006-lemma-1-4-corollary-1-5-local-shape-at-l` | corrected | Checked Taylor 2006 1.4/1.5 and the actual R06.4/R19.5 statements. Added torsion Fontaine–Laffaille and full Hilbert crystallinity requests/gap; rational comparison alone does not supply this node. |
| 28 | `taylor-2006-lemma-5-1-corollary-5-2-weight-reduction` | corrected | Checked Taylor 2006 5.1/5.2. Recorded new E10 and the correct Symm^i coefficient convention; retained the localized V-operator/non-Eisenstein hypotheses. |
| 29 | `taylor-2006-lemma-5-3-weight-shift` | corrected | Checked Taylor 2006 5.3. Removed an unsupported claim that the polynomial calculation was checked in Lean; the acceptance calculation remains to be supplied. |
| 30 | `taylor-2006-lemmas-5-4-5-6-weight-and-level` | verified | Checked Taylor 2006 5.4–5.6. Kept the l>3 bound, weight/conductor changes and unread CDT/Duke Skinner–Wiles inputs explicit. |
| 31 | `taylor-2006-theorem-5-7-serre-weight-at-level-one` | corrected | Checked Taylor 2006 5.7. Removed an unsupported Lean weight-bookkeeping claim; retained irreducibility at l, even degree, split l and the p=3 gap. |
| 32 | `frobenius-primes-generate` | verified | Checked Snowden 5.2.2 and the pinned Frobenius-prime-set definition. Number-field Chebotarev is imported; function-field constant-field congruences and density remain an exact gap. |
| 33 | `cht-character-extension` | verified | Checked CHT 4.1.1/proof. Extension is into divisible roots of unity with a finite ray-class quotient; no fixed cyclic order is imposed and no Grunwald–Wang exception is suppressed. |
| 34 | `cht-soluble-prescribed-completions` | corrected | Checked CHT 4.1.2/proof. Added the normalized local reciprocity request; exact completions, soluble Galois extension and disjointness are kept together without a fixed-degree cyclic assertion. |
| 35 | `tower-linear-disjointness` | verified | Checked Qian opening §2 and pinned disjointness API. Base-change of a genuinely linearly disjoint extension is valid; trivial intersection is not used as a converse without Galois hypotheses. |
| 36 | `moret-bailly-three-local-conditions` | verified | Checked Qian 4.2 statement/application. S1 is over K_v, S2 over K_v^nr and S3 over Kbar_v, with their distinct invariance and splitting/unramified conclusions. |
| 37 | `moret-bailly-over-a-preliminary-extension` | corrected | Checked BLGHT 6.2. Added fine Weil-restriction nodes and the dense-affine reduction needed for scheme representability; property/analytic-open compatibility is separately gapped. |
| 38 | `surjective-specialisation-finite-quotient` | corrected | Checked Bianchi 4.5.1. Corrected its literal excerpt, added fine Weil-restriction inputs and dense-affine reduction, and retained CM/Q-Galois/local-equivariance hypotheses. |
| 39 | `function-field-isomorphism-torsor` | corrected | Checked published BHKT 9.1 and the 2025 correction p. 28. Corrected the excerpt to the printed wording; E8 explicitly replaces the finite-etale base by Y_K and retains nonconstant-point avoidance. |
| 40 | `function-field-point-with-fixed-constants` | verified | Checked published BHKT 9.2. Coprime split-place degrees force constant field F_q; disjointness and the nonconstant point condition are separate conclusions/inputs. |
| 41 | `potential-global-galois-local-data` | verified | Checked published BHKT 9.3 and Calegari 3.2. Number-field Galois/avoidance refinements are scoped to Calegari; the function-field assertion is not silently strengthened. |
| 42 | `restriction-of-scalars-moduli-application` | corrected | Checked BCGP 9.1.11 proof. Added fine representability/geometric-product Weil-restriction inputs; the smoothness/local topology adapter and H6 object remain supplier contracts. |
| 43 | `snowden-soluble-preliminary-field` | corrected | Checked Snowden 8.2.2/proof. Added fine Weil-restriction inputs; split over L_v is not equality of completions with L_v, and the soluble preliminary field remains separate from F2. |
| 44 | `snowden-totally-real-potential-residual-modularity` | corrected | Checked Snowden 5.1.1/8.2.1. Replaced the dyadic supplier R22.6 by an exact odd-prime R22.5 request/gap; auxiliary (A1),(A2), stable avoidance and split-place compatibility remain explicit. |
| 45 | `bcgp-controlled-residual-modularity` | verified | Checked BCGP 9.1.11. Representation is over F1, field choice is over F, and avoidance is F1Favoid; the q-ordinary weight-zero witness is preserved. |
| 46 | `bcgp-local-galois-data-without-descent` | corrected | Checked BCGP 9.1.12/9.2.7 use and E7. Removed the inapplicable CM/Q-Galois Bianchi prerequisite in favor of general number-field approximation plus an exact finite-quotient specialization request; no L/K descent is asserted. |
| 47 | `ordinary-global-ring-finiteness` | verified | Checked Thorne 10.2 setup/proof. GL2 totally-real use is conditional on the polarized CM adapter, adequate image, ordinary lift and fixed Hodge type; it is not arbitrary-ring finiteness. |
| 48 | `cg-ordinary-ring-finiteness` | verified | Checked CG 4.8 proof. R_phi is unframed finite; its framed power-series enlargement is not. The modified ordinary R-dagger comparison is an explicit supplier gap. |
| 49 | `newton-thorne-khare-wintenberger-extraction` | corrected | Checked NT §3 Lemma 3.1 setup/proof. Added determinant, p≥5, residual-image and local-component hypotheses plus partial fine Hida input; dimension plus unframed finiteness gives a point before later automorphy. |
