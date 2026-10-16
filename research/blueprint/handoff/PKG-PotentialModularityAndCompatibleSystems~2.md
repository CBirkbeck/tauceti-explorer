# PotentialModularityAndCompatibleSystems, revision 2: blocked checkpoint

Issue #9188. Worker: Codex, session **codex-XtIxOj**. Date: 2026-10-13.
Branch: `codex-XtIxOj-potential-modularity-package`.

**Status: partial, blocked on an uncleared source. This is not a completed package or an upstream-ready roadmap.** The prior independent review remains `needs_changes`; its `review.json` is unchanged. No packet, reader, supplier roadmap, queue entry or independent review was edited. All 92 target anchors remain.

## Why this is a checkpoint

The source audit cannot certify the inherited monodromy proof without an authorized source for Serre, *Abelian l-adic representations and elliptic curves*, §§III.1.2 and III.2.1. BLGGT arXiv:1010.2561v4, §5.2, p.66 invokes those sections to construct the local algebraic torus morphism θ_l used in targets 1.18–1.20. The book is not in the maintainer's cleared-library index. No author/publisher free copy was located; publicly indexed retypes and course scans were not used. The publisher page did not provide a readable text. The book's own page numbers have therefore not been verified. Resume after the maintainer clears this source or a freely readable original supplies the exact replacement proof. BLGGT's citation alone is not source closure.

There are also substantive, explicitly retained dependency gaps in §§4.2, 8.3 and 8.4. The worker did not declare the other inherited proof-source gaps closed. Source access is the stopping condition; this is not a claim that the entire job was attempted to exhaustion or that the allocated eight hours elapsed.

**Intake caution.** `issues.deliverables_complete` currently treats a package with all output paths present as complete, without examining this partial status. This checkpoint is a draft PR so intake cannot automatically certify it as a completed package. The maintainer must arrange checkpoint continuation rather than marking #9188 finished. No intake code or labels were changed by this worker.

## Changes completed

- Added the required opening **Summary.** paragraph and retained the detailed README rather than restoring the obsolete 200 KB limit.
- Removed the private rigidified-bundle structure, sorry-bearing setoid, quotient, descent functions and forgetful map from Suggested.lean. A proof-bearing data definition and functions depending on it violated the binding 2026-10-12 shape. Independently, the current Tau Ceti library already implements these objects for **arbitrary scheme morphisms**, not only sections. Replanning them would duplicate upstream work.
- Rebased §2.5 on the current `RigidifiedLineBundle` and `RigidifiedLineBundleClass` APIs. Kept the finite-flat-boundary relative fppf sheafification, tensor/dual group structure, degree grading, representability, exact sequence and effective-divisor affine fibration. These heavier endpoints were not identified in the current rigidified-bundle modules.
- Corrected the divisor map: with rigidification directed from the restricted bundle to O_Z, use the inverse of the canonical section, `(O(D),(s_D|_Z)⁻¹)`. Accordingly §2.6's section torsor requires `α(s|_Z)=1`.
- Added concrete boundary checks: on P¹_Q with boundary {0,∞}, ratios 1 and 2 give distinct rigidified classes of the same forgotten bundle; ratios 2 and 3 multiply to 6, and duality gives 1/2. Base change preserves these computations but need not be injective on all ring-valued classes. Divisors meeting the boundary cannot supply a trivialization.
- Expanded §4.2's proposed split-CM alternative: good ordinary local moduli points, an auxiliary p>3 split at the base, soluble removal of away-p residual inertia, Skinner–Wiles weight-two level adjustment, Taylor's crystalline lifting theorem, and descent **back to the original approximation field**. The last step preserves the original starting-prime splitting requirements. Kept a gap for the simultaneous prime/local-moduli construction and the missing precise lower-tier supplier contracts. §4.4 now points to that conditional alternative.
- Expanded §8.3's conditional rank-two polarized adapter. It fixes the characteristic-zero seed determinant, multiplier and regular Hodge sums, gives the determinant-pairing prolongation into 𝒢₂, and specifies the finite unframed restriction map `R_K → R_F`. The finite-map direction and proof are sourced to Gee–Geraghty Lemma 3.2.5. It does not assert finiteness of framed rings or variable-weight ordinary quotients.
- Repaired §8.4's CG scope to the residual representation **unramified at p with scalar Frobenius**. Restored the Teichmüller lift in the determinant and separated the congruent-to-one determinant square root from killing the finite tame character. Marked the small-image finiteness gap rather than adding adequacy and narrowing CG's theorem.
- Expanded §9.2's Newton–Thorne component comparison: the Hida-specialized seed π′, rather than π, has the required determinant ε⁻²ω and weights {0,2}; local quotient comparisons require reduced O-flatness and a common soluble base change killing the finite inertial types. The away-p Steinberg component is allowed. The automorphy step still needs the missing ordinary unitary lifting foundation.
- Added full bibliography entries for Skinner–Wiles and Gee–Geraghty, retaining numbered/page locators in the targets.

## Exact current-library imports, and the pin distinction

Current roadmap checkout: `0d144d044dacebca17b654695b6f1ad58f159b27`.
Current Tau Ceti library: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Elaboration pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

Read current `TauCeti/AlgebraicGeometry/LineBundle/Rigidified/Basic.lean`, `Rigidified/Automorphisms.lean`, and `PicardFunctor/Rigidified.lean`. The first two provide arbitrary-morphism representatives and quotient classes; the last builds the relative functor for a section. All names below are in `TauCeti.AlgebraicGeometry`:

- `RigidifiedLineBundle`, `.trivial`, `.setoid`, `.pullback` and its rigidification comparisons.
- `RigidifiedLineBundleClass`, `.mk`, `.mk_eq_mk_iff`, `.lift`, `.lift_mk`, `.pullback`, `.pullback_id`, `.pullback_comp`, `.toLineBundleClass` and `.toLineBundleClass_pullback`.
- `RigidifiedLineBundleClass.mk_mk_eq_mk_mk_iff`, `.stabilizer_eq_range` and `.range_toLineBundleClass` for global/boundary units and forgetting.

These are current-library prerequisites, later than the Lean pin. Suggested.lean therefore omits them rather than inventing a pinned private substitute. The existing tensor/dual group of **unrigidified** classes is also imported; the rigidified modules inspected do not yet supply the new relative group-sheaf theorem.

The current nine newer roadmap Suggested files and the Completed tree were searched for the overlapping notions; the restricted-product carrier is imported. DifferentialGeometry and AlgebraicVectorBundles READMEs were read in full as prose models, and AdicSpaces and ModularForms Suggested files in full as Lean models. This is a targeted duplication check, not a fresh proof audit of every upstream roadmap or every one of the 92 endpoints. No current upstream checkout was modified or built.

## Resume in this order

1. Resolve the Serre source-access block, and finish the other original-source obligations in the prior review. Do not use an unofficial book mirror or treat a downstream paper's invocation as reading the original proof.
2. Close §4.2 **without citing the excluded R21.5 split-CM theorem**. Verify that the refined auxiliary prime in §3.2 can satisfy p>3 and splitting simultaneously with all original prime, CM-quadratic, coefficient-field and avoidance conditions. Carry good ordinary neighborhoods through the H6 moduli approximation. Taylor 2006 Theorem 3.3 requires even-degree totally real base, p-splitting, crystallinity, weight range, an everywhere-unramified seed and residual irreducibility on the cyclotomic quadratic extension. The p>3 inertia calculation in §4.2 tests the last condition. Skinner–Wiles permits extra splitting only away from the old seed level; descend back to E before asserting the starting-prime output conditions.
3. Plan the missing **rank-two ordinary unitary R=T foundation here or in an allowed lower-tier owner**, then make the higher owner import it. The higher-tier `PotentialAutomorphyInfrastructurePartII` has the exact candidates `PL.2/ordinary-hecke-galois-representation`, `PL.2/ordinary-forms-free-over-lambda`, `PL.2/hida-classicality`, `PL.3/adequate-taylor-wiles-primes`, `PL.3/taylor-wiles-level-structures`, `PL.3/ordinary-r-equals-t`, `PL.3/revised-adequacy-r-equals-t`, and `PL.4/ordinary-finiteness`. Their rank-two forms, definite-unitary modules, auxiliary unramified place, Ihara avoidance and weight specialization must move down; **the move is identified, not completed by this checkpoint**. R21.4 is quaternionic and is not a substitute. Abstract patching stays with R03.5/R03.6 and local rings with their existing lower owners. Record the eventual owner change for the PL roadmap; do not cite PL upward from this package.
4. In that move check Thorne 2017 Proposition 7.2 (accepted author manuscript p.32): the 2012 R=T proof's adequacy condition on the 𝒢_n-image over the real cyclotomic field is not automatically the GL_n adequacy condition in Theorem 10.2. The PL reader records this repair; this worker did **not** read that original manuscript or claim the repair verified. Read it before citing it. For rank two and odd p the adequacy notions agree, but the group and ζ_p hypotheses still have to be transported.
5. Finish §8.3's polarized/GL₂ local functor comparison and strict-equivalence universality, using the explicit multiplier and determinant pairing. Check all labels under split CM base change. The restriction closed fiber has finite image; trace generation is an actual unframed absolute-irreducibility input, not a formal consequence of a ring map. Extend the reduced O-flat comparison to all the component rings used by §8.4 and §9.2.
6. Close CG's **full p≥3** finiteness branch independently of an unjustified adequacy implication. The source proves cyclotomic absolute irreducibility; its p.67 Kisin component-patching and p.68 finiteness assertion require an exact rank-two small-image/global-finiteness interface in the allowed R22 owner. This contract is requested, not supplied, in the present README. NT's sufficiently large SL₂ image has a separate adequacy route; do not conflate it with CG.
7. Finish the remaining inherited gap inventory and a complete adversarial source/API/prerequisite pass. The present numerical Lean examples remain representative checks; the binding 2026-10-12 rule places unavailable heavy carriers and their full tests in the README, and does **not** require prototype theory or sorry-bearing data in Lean.

## Prior-review gap ledger

Numbers refer to the inventory in `reviews/REV-PKG-PotentialModularityAndCompatibleSystems.md`; that report remains the full continuation record. No gap below is certified closed in full.

| Input | This checkpoint / remaining work |
| --- | --- |
| R23.1 1 | Existing rigidification duplication removed; Chow/Bertini, compactification, relative Picard/duality originals still need checking. |
| R23.1 2–5 | Duke Khare/CDT, weight-local contracts, finite residual inertia and KW II finiteness contracts untouched. |
| R23.1 6 | Conditional crystalline alternative specified; simultaneous prime/local-moduli/supplier closure remains. |
| R23.1 7 | Good ordinary local input located, but full H6 construction and Corollary 1.7 determinant square-root adapter remain. |
| R23.1 8 | Skinner–Wiles main theorem and its full proof read, with precise level bound and splitting limitation; exact lower-tier contract remains. |
| R23.1 9–13 | Function-field bounds/constants, projective-module approximation, completion/Jordan, MB 1990, and independent Snowden inputs untouched. |
| R23.1 14 | Proposed CM prolongation, finite-map proof and CG/NT component/determinant comparisons added; ordinary unitary R=T foundation and small-image branch remain. |
| R23.1 15–20 | Point topology/coefficient adapters, algebraic ψ₀, independent auxiliary lifting, torsion FL/Hilbert crystallinity, general Weil restriction and étale/excellence inputs remain. |
| R23.1 21 | Concrete rigidified-boundary prose tests and current APIs added; full Skolem/relative Picard/moduli witness contracts remain. Full heavy Lean prototypes are superseded by the 2026-10-12 shape. |
| R23.1 22 | Strengthened auxiliary-prime obligations made explicit; simultaneous field/prime construction not proved. |
| R24.3 1–2 | Savitt/R15.4 and Gee/small-weight crystalline originals untouched. |
| R24.3 3–4 | BLGGT invoked passages re-read; original common-component/Sen/maximality/torus inputs remain, including the Serre source block. |
| R24.3 5 | Removed unsupported data from Lean in accordance with the new shape; the full arithmetic/monodromy objects and tests remain README targets. |
| R24.3 6–7 | Overlap Hom-character lemma and full DP extension outside KW scope remain. |

## Source receipts for the work actually read

No source files or passages are committed. These hashes identify the public versions inspected, not proof closure for every theorem in them. Fetch again if needed; the run's scratch material is deleted after PR creation.

| Source | Locator read / public version | SHA-256 |
| --- | --- | --- |
| Taylor 2002 | [Author preprint](https://virtualmath1.stanford.edu/~rltaylor/fm.pdf): prime choices pp.6–9; Lemma 1.3 p.12 and the local-moduli application pp.13–15. | `e00ebd580b4bdb591345c051c6ae85801663b4a5807a12269c909a47eff3a57d` |
| Taylor 2006 | [Published EMS text](https://ems.press/content/book-chapter-files/27484): Theorem 3.3 p.755; Lemma 4.5 and alternative lifting/descent pp.761–763. | `6ec26bfc12e1cf38d410b36c18f985e2fb26c1cb1bb03d6e5197ccf58f92c51c` |
| Skinner–Wiles 2001 | [Duke article via CiteSeerX](https://citeseerx.ist.psu.edu/document?doi=78be3e19b2caf9a472352165d0685620cf710b2f&repid=rep1&type=pdf): entire pp.15–25; main theorem p.17. | `ba0a5c6ad21914dbb5ba4d756629ed2818f231c24cd0a4b3970dd4a20fedd21f` |
| Thorne 2012 | [Author copy](https://www.dpmms.cam.ac.uk/~jat58/bigness.pdf): 𝒢_n §3 pp.7–8; Theorem 9.1 pp.53–54; Theorem 10.2 and proof pp.56–58; Corollary 8.7 p.53. | `5e9d15afa98ca38eb079c378b2ce59db7a57327f179073a59aaadea509a6b15b` |
| Gee–Geraghty | [Author copy](https://www.ma.imperial.ac.uk/~tsg/Index_files/cfug.pdf): Lemma 3.2.5 and proof p.14. | `314ebde76e04254c788f59e1f6b9069d996e50943caf0dbd28774fd313f15e31` |
| Calegari–Geraghty | [Published text on author's site](https://math.uchicago.edu/~fcale/papers/CG.pdf): Theorem 3.19 PDF p.39; Theorem 4.8 proof PDF pp.65–68. | `c0ba8de04d5ee92fe1a967f9487df6cb49295590dfd03762a9150a92838225c5` |
| Newton–Thorne | [arXiv:2212.03595v2](https://arxiv.org/pdf/2212.03595v2): Lemma 3.1 and proof pp.13–14. | `6a156f7a5567226e0bd2209d5b237cbbc150dc10cfbd9ffd060a3245328cb82c` |
| BLGGT | [arXiv:1010.2561v4](https://arxiv.org/pdf/1010.2561v4): §5.2 pp.65–70, especially the Serre/CCO dependencies of θ_l on pp.66–67. | `c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24` |

## Validation

- Final `lean-check research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean`: **exit 0**, 27 warnings, all `declaration uses sorry`; no errors or other warnings. Checked after removing all private Picard declarations and their imports. File has 268 lines. Only light real-bodied definitions and the numerical inductive datatype remain; no sorry-bearing data. This establishes elaboration, not theorem truth.
- Both unchanged packets: `scripts/check_blueprint.py` reports **0 errors, 0 warnings** (49 + 43 targets). Their 22 + 7 inherited gaps are not discharged by that check.
- README: all 92 prior target anchors retained in the same order, no duplicate explicit anchors, missing local anchors, forward/self target prerequisites or undefined reference links. Final README size: 214,086 UTF-8 bytes; the current shape has no 200 KB cap.
- `intake.py check-files` on the four deliverables: **4 files, 0 problems**. `scripts/check_sorry_data.py` exits 0. Metadata parses as exactly `topic = "math.NT"`. `git diff --check` passes. No claim of complete source closure or a completed 92-target adversarial re-audit accompanies these mechanical checks.
