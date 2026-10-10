# Independent package review: Generalized Heegner cycles

Verdict: **needs_changes**. Review completed on 10 October 2026 by Codex, session `codex-qfier3`, for [issue #7930](https://github.com/CBirkbeck/tauceti-explorer/issues/7930). This session did not write the package, whose author was session `codex-JffRsg`.

The package faithfully carries the accepted mathematical specifications into a readable roadmap, and its Lean prototypes elaborate. It cannot yet satisfy the upstream no-gaps and ownership checklist: two foundational supplier contracts name layers which do not plan the requested mathematics. The final BSD export also requires a source-range extension without a matching construction in its prerequisite layers. These are specification gaps, rather than objections to dependencies that have not yet been implemented.

## The six package checks

| Check | Result and evidence |
| --- | --- |
| Upstream form | Pass. Introduction, boundaries, conventions, exact supplier interfaces, nine ordered layers, target statements, APIs, tests, prerequisites and local source locators. The corrected README is 174,462 bytes, below 200,000. Compared with current ClassFieldTheory's opening and with the complete AlgebraicVectorBundles and JacobianChallenge roadmaps. |
| Fidelity and dependencies | All 82 target statements, hypotheses, 66 named API items and 58 named tests are present. The unresolved producer/consumer contracts below prevent acceptance under the no-gaps and unique-owner rules. No unsupported completed arithmetic theorem was added during this review. |
| Own words and locators | Pass after corrections. No source passage or section-by-section source digest found. Added seven missing page locators, verified against the acquired copies, and replaced an unresolved cross-reference by its rank calculation. Library sources use declaration/file locators rather than fictitious pagination. |
| No process | Pass. The roadmap does not contain packet/job/review/checkpoint/coverage history. The mathematical notation GH.0–GH.8 labels layers. |
| Suggested.lean | Fresh `lean-check` exited 0: 239 warnings, all `declaration uses sorry`; no errors or other warnings. Expressible components and named tests agree with the README. Arithmetic omissions and their limits are described below; elaboration is not an arithmetic proof. |
| Metadata | Pass. Exactly `topic = "math.NT"` followed by a newline. |

## Complete target comparison

Compared both accepted input packets, `GeneralizedHeegnerCycles--GH.0.json` and `GeneralizedHeegnerCycles--GH.8.json`, with every target block, including hypotheses, API, tests, proof routes and prerequisites. All anchors are unique and internal links resolve. The only slug changes are `ochiai-exponential-checkpoint` to `ochiai-exponential`, `yager-unramified-checkpoint` to `yager-unramified-descent`, and `two-variable-regulator-checkpoint` to `two-variable-regulator`.

| Layer | Targets checked | Principal distinctions retained |
| --- | ---: | --- |
| GH.0 | 9 | CM differential normalization; graded permutation sign; m=0 boundary; integral projector denominators; independent CM good model |
| GH.1 | 15 | Graph/cusp cycle; rational Gysin and continuous cocycle; holomorphic-minus-Frobenius sign; lattice descent; literal full symmetric-power CM carrier; normalized Coleman primitive |
| GH.2 | 5 | Tame norm and conjugation relations; Frobenius convention; finite local condition; corrected derivative condition at ramified conductor |
| GH.3 | 6 | Positive conductor versus first transition; full/half unit counts; inverse unit-root normalization; trace polynomial; simultaneous universal norms |
| GH.4 | 6 | Squared BDP value versus linear CH distribution; signed integer differential exponents; ramified/unramified factors; CH minus sign and group-like factor |
| GH.5 | 6 | LV admissibility and actual local assumptions; bounded control; correction units; conditional descent and correct ideal-containment direction |
| GH.6 | 7 | Analytic nonvanishing input; CH bounded-error descent versus clean Howard hypotheses; corrected growth/parity; universal-norm generation |
| GH.7 | 12 | Hida critical twist; actual point/representation tower; ideal-restricted exponential; Yager covariance; localization and quotient kernel; p-old specialization range |
| GH.8 | 16 | Picard–Kummer and differential maps; fixed two-sided lattice denominator; exact-conductor cancellation; bottom compatibility; source-qualified reciprocity and BSD exports |

Alpha-renaming the BDP fiber-power index to m makes its relation to the CH half-weight r explicit. Replacing planning verbs by mathematical requirements does not discharge their supplier contracts. In particular the accepted plans record 17 gaps/18 requests and six gaps/nine requests respectively; neither is a closed packet. The review does not reject every recorded gap automatically. The findings below concern specific required interfaces whose named producers do not match, or whose advertised source range does not cover the consumer.

## Required revisions

### 1. Assign the Kuga–Sato geometry and classical projector consistently

**Where:** the boundary and required-interface sections; GH.0.4–GH.0.9 and their consumers in GH.1.8 and GH.7; input node `GH.0/newform-cm-projector`.

The package assigns W_m, canonical resolution, boundary/projected cohomology, the classical projector and integral newform lattice comparison to ModularCurvesPartII R14.3. The current `ModularCurvesPartII--R14.3.json` instead plans the weight-two Shimura isomorphism, cup/Petersson comparison, Hecke adjoints and rank-two H¹, followed by weight-two quotient and good-reduction targets. None of those nodes supplies the higher fiber-power contract. Its current file also has no independent `review` acceptance object; a package must not describe a requested enlargement as an accepted supplier target.

The accepted `AutomorphicGaloisRepresentations.json`, node `R19.1/scholl-projector`, explicitly owns the classical signed projector, concentration in degree r+1 and parabolic comparison. Its request to GH.0 asks for the canonical fiber-power geometry and boundary calculation. GH.0 imports that geometry from R14.3 instead of constructing it. Thus redirecting the whole GH.0 import to R19.1 would create a circular handoff: R19.1 already needs GH.0's geometry. This is not resolved by renaming the prerequisite.

**Correction required:** give the canonical compactification/resolution and boundary computation a concrete foundational target in the geometric owner; retain one owner of the classical projector and newform factor; then point GH.0's product/projector comparison at those outputs. Include the integral Hecke denominator and auxiliary fine-level descent contract. Specify the acyclic geometry → classical projector → product realization order. Do not add a second Scholl projector to this package or change R14.3's scope by assertion. This requires changes to the affected plans, outside this review's authorized package paths.

### 2. Replace the descriptive regulator extension by a real supplier layer

**Where:** required dependency interfaces; GH.2.5, GH.4.4 and GH.7.5–GH.7.9; GH.8's regulator consumers.

The accepted `PadicHodgeRegulators--L3.json` constructs the cyclotomic regulator for H¹_Iw(Q_p,V), Wach/Mellin comparison, interpolation and meromorphic twists, with L4 coordinate/image consequences. Its nodes do not construct the relative Lubin–Tate integral map, Ochiai's ideal J, the Yager trace module or the unramified×cyclotomic ordinary deformation regulator. The package's phrase “L3 relative and two-variable extension” has no matching target or distinct roadmap/layer identifier in that supplier's current plan.

These are actual constructions, not finite coefficient extension of the existing cyclotomic map. [Castella's author copy](https://web.math.ucsb.edu/~castella/Heegner.pdf), Theorem 3.4, pp. 14–15, and Proposition 3.5, p. 15, distinguish the ideal-restricted exponential and trace descent; Proposition 5.2, pp. 22–23, uses localization at λ and a quotient construction. [LZ14 v3](https://arxiv.org/pdf/1108.5954v3), Proposition 4.11, p. 18, proves injectivity in the infinite unramified direction. It does not alone prove injectivity after that direction is quotiented out. The package correctly retains the additional quotient-kernel and nonzero-line-pairing requirements, but no named supplier target provides them.

**Correction required:** create or identify the precise regulator extension in its owner, following PROTOCOL §15's Part II rule, with individual target-level contracts for integral twisting/pairing, J, Yager covariance, two-variable localization and quotient descent. Repoint the GH imports to the corresponding layers/nodes. Retain the exceptional λ=0 regular-model requirement. Do not rebuild the existing cyclotomic regulator or use an arbitrary injective linear map as the arithmetic input. This cannot be repaired merely by editing the package's bibliography or Lean comments.

### 3. Give the final BSD export a proved source-range adapter

**Where:** GH.8.16 `corrected-bsd-input-export`, its construction route, and GH.2–GH.7 inputs.

[CH22](https://www.math.ntu.edu.tw/~mlhsieh/research/HCES.pdf), Introduction, Hypothesis (H), pp. 1–2, requires all primes of N to split in K and p∤2(2r−1)!Nφ(N). [The multiplicative BSD erratum](https://web.math.ucsb.edu/~castella/Birch-erratum.pdf), Theorem 2.3 and proof, pp. 3–4, requires a nonsplit q exactly dividing the auxiliary level, specified special local types and a condition at 2. Its higher-weight congruence argument has varying weights. The all-split CH range therefore does not intersect that required nonsplit tame-level range. The existing GH.5 LV admissible triple also retains all-split level and a weight-dependent factorial exclusion.

GH.8.16 explicitly asks GH.0–GH.7 to extend to that range, but their listed source-qualified targets still have the all-split/admissible hypotheses. No cited earlier target proves that extension, or identifies the integral leading-class unit in precisely this range. The erratum also invokes LV19, while this plan's LV source is the explicitly labeled 2016 v1 preprint. This observation does not allege a defect in the published LV19 theorem.

**Correction required:** make the auxiliary-form extension a specific target with a source/proof route and matching prerequisites, including the corrected local condition, integral leading-class unit, non-torsion and uniform weight/lattice requirements. Collate the LV19 input or give an independent applicable theorem with its actual hypotheses. Retain BSD.6a's ownership of congruence/control transfer and the limit argument. The p-new multiplicative elliptic specialization must not be obtained by dropping the p-old restriction in Castella Remark 6.6, p. 29. GH.8.16 should import the proved extension rather than direct an implementor to unspecified enlarged versions of earlier theorems.

## Corrections made in this review

Added p. 1 to the CH erratum's local-condition citations in GH.2.4/GH.2.5 and corrected-growth citation in GH.6.4. Added p. 23 to the CH22 equation (5.1)/Lemma 5.4 references in GH.8.3 and GH.8.10–GH.8.12. These pages were read in the acquired PDFs.

Replaced “the rank distinction below” in GH.1.9 by the degree-zero computation: Sym⁰ of the Weil-restricted Tate module has rank 1, whereas the induced Sym⁰ module has rank [H_K:K]. This supplies the missing explanation without using CH's false literal Sym/Ind identity. The associated character/integral inclusion remains an explicit CM.1 requirement, not a theorem established by the rank calculation.

No change to target scope, metadata or Suggested.lean was needed for these clear corrections. The rejected supplier contracts are left visible for a coordinated plan revision, rather than silently rerouted to another unverified owner.

## Lean and library assessment

Reread the 19 distinct baseline references at the exact Mathlib/Tau Ceti pins. Linear maps, dual evaluation/composition, quotients and kernel criteria supply the claimed algebraic interfaces. `Equiv.sum_comp` is generated from `Equiv.prod_comp`'s `to_additive` declaration. `MulChar.sum_eq_zero_of_ne_one` requires a finite commutative monoid and integral-domain target; the finite conductor kernel and torsion-module cancellation tests retain that distinction. Tau Ceti's abelian variety, End, mulBy and finite-surjective IsIsogeny are used directly. The eight-file native Tau Ceti import closure was byte-compared with the pinned commit and matches the shared compiler build.

Screened the current read-only library and all nine post-snapshot roadmap Suggested files named in WORKERS, including OperatorTheory's eight nested files, and the four named Completed roadmaps. No matching generalized Heegner, Kuga–Sato, Scholl, Yager or Perrin–Riou construction was found in that screen. Existing abstract weighted divisor Abel–Jacobi classes are distinct from the continuous Tate-module Kummer comparison. Current roadmap/library commits were `37769f03c170a7bc3e1082df70522a0ad59c5ffd` and `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The accepted ClassFieldTheory layer-13 link remains a ring-class-field input, not a construction of projected cycles or integral descent.

The file retains 48 individually identified arithmetic signature omissions, including four API items: `stabilizedClass_bottom`, `stabilizedClass_trace`, `tracePolynomial_remainder` and `correctedKolyvaginClass_fs`. Under PROTOCOL §13's honest-prototype rule, replacing these by arbitrary modules with the arithmetic conclusion assumed would be worse than omitting them. They remain mathematical requirements in the README. The generic algebraic components are explicitly marked as components; the admissible-triple predicate does not manufacture its missing field/Galois hypotheses. All 58 named tests have theorem signatures and corresponding `example`s. Extra GH.8 examples test uniform denominators, conductor-kernel cancellation, quotient injectivity, localization and differential scaling.

Reviewed the constructed Coleman primitive's actual normalized domain, the simultaneous compact finite-solvability norm fixture, correction inverse and unit-root normalizations, and the explicit hypotheses of the Howard tower trace/Greenberg components. These discriminate their algebraic definitions. They do not prove the geometric realization comparisons, source-specific Selmer conditions or reciprocity laws. No acceptance claim is based on `sorry` proving mathematics.

## Reproducible validation

- Both input packets pass `python3 scripts/check_blueprint.py` with **0 errors and 0 warnings**; neither was edited.
- Fresh `lean-check research/blueprint/packages/GeneralizedHeegnerCycles/Suggested.lean`: **exit 0; 239 sorry warnings; no errors or other warnings**. The code was not edited afterward.
- Target/API/test inventory, internal anchors/links, README size, process-language screen and exact metadata line checked after the README corrections.
- Nine public PDFs reacquired and their SHA-256 hashes matched the accepted source records. Fresh source reading was bounded to the relevant normalization, hypothesis, local-condition, descent and export locators; this is not a claim to have independently reread all nine papers in full. Source receipts are retained in the handoff; source files and passages are not committed.

This is a finished package review, not a checkpoint. A revision must reconcile the three contracts above before a subsequent independent package review can accept the roadmap. No supplier packet, owner table, atlas data or upstream repository was changed by this job.
