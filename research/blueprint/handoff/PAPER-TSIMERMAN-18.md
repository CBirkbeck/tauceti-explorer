# PAPER-TSIMERMAN-18 — continuation handoff

Issue #1141. Second checkpoint by **ChatGPT / GPT-6 Astra Pro / `astra-ao-9c47e2`**, 21 September 2026. Continues PR #1263. Status remains **partial**, not complete: 84 items, 4 library, 25 planned, 55 unresolved/missing, 41 missing items without a route. The report is the main mathematical record; do not restart its completed source reads.

## What changed

The full reviewed audit and atlas are now accessible. The authorized GitHub connector downloaded the Pages artifact of workflow run 35638002941, artifact 10656618031, repository commit `2f01d6e7039e8e770477900434aff85f86ea23cc`. Verified ZIP SHA-256:

`7fe2ced465afb1399367d47934e500bf5005431e881b9b01953c27c934d767f4`.

The archive contains the repository's research/data/scripts/tests, including the previously oversized files. This can be repeated with a current successful Pages run; the specific artifact may expire. It does not require a change to repository workflows. The audit Git blob is `5e708cfc74a51b10e62149113872fe4e00eb5846`; atlas `37f2add06983c206067d1104e0f40a839cc3961a`.

Accepted AUDIT-06/08/09 records were read for the relevant analytic, height, CM, abelian and Faltings interfaces. **AUDIT-34 remains pending review**, and LD has no accepted aggregate record. The old handoff's global audit-access blocker is obsolete, but missing statements still need individual reconciliation.

Two pinned results were added without overstating their scope: Tau Ceti `NumberField.card_ideal_absNorm_le` gives **X^2 * 2^degree**, not the required near-linear ideal count; Mathlib `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` proves the **right-real class-number residue limit**, not complex continuation. Their files/blobs are in the result and report. The original general CM regulator check is retained, with no artificial Galois hypothesis.

**The finite-family attribution was wrong.** Pila–Tsimerman 2014 Lemma 7.2 is normalizer reductivity, not finiteness of weakly special families. All of published §7 has now been read. The result splits the normalizer, finite envelopes, countable algebraic union, definability, finite-subunion lemma, whole-fibre parameter locus, isolated special parameters and Galois transport. Preserve both induction branches. Lemma 7.7 needs closed complex algebraic subvarieties and R_an,exp analytic-cell arguments; it is not a general countable-union fact about definable sets.

Tsimerman 2012 §§7.1–7.2 and Pila–Tsimerman 2013 §3 were read with page images. The primitive-to-general reduction needs primitive bounds in **all h <= g** and a nonmaximal **centre-order** index comparison. Do not identify that index with the Mumford–Tate compact index. Matrix sizes use multiplicities, and fields of inequivalent CM types need not be distinct. The report records the remaining arXiv/published notation checks.

Silverberg–Zarhin's author-hosted four-page paper explicitly corroborates the homomorphism-definition contract: n>=3, prime to the characteristic, with rational n-torsion of both source and target. The original 1992 Proposition 2.3 was not directly accessed. The dual 3-torsion/mu_3 pairing is now a separate A3 import.

Gao §13 was read in full, including Theorems 13.3 and 13.6. The mixed consequence uses a **pure Galois-orbit bound**, not just pure André–Oort. The result now records the unipotent denominator and mixed-to-pure orbit inequality, with its fixed datum/level and reflex-field base. Earlier mixed Ax–Lindemann/quotient inputs remain external work.

Both nearby upstream documents **EffectiveBounds and GlobalNumberFields were read in full**. AN.4 was corrected: it does explicitly plan Hecke/Dedekind/Artin analytic interfaces, importing general Hecke functional equations through AL.1 and characters through GlobalNumberFields. Ordinary absolute heights/Northcott are attached to RP.0, arithmetic Hom descent to A3/A6, and coarse/fine moduli comparison to M6.

## Next checks, in order

1. **Analytic closure of Corollary 3.3.** Read the report's quadratic-Hecke alternative using Yuan–Zhang Theorem 1.1 (published pp. 534–535 were checked). Verify normalization, conductor-discriminant identity, nonvanishing at 1, bounded-degree Brauer–Siegel and uniform convexity/Cauchy estimates. This avoids assuming general Artin holomorphy. Alternatively finish Brauer induction with cancellation of trivial Hecke/zeta poles. A proposed proof outline is not a verified theorem. Reuse #1143/#1145 for the deep averaged-Colmez theorem and include the 2023 erratum in the latter; no duplicate paper task.
2. **Polarized CM reciprocity.** Verify the exact stabilizer H, the positive-unit norm quotient and the relation between absolute moduli degree and the degree after adjoining the reflex field. The compressed source ideal-norm subscript must be K-star, the field containing the ideal. Use Shimura–Taniyama §15 Main Theorem 1 or an accessible equivalent primary proof, and say which one was actually read.
3. **Published-version and adapter checks.** Reconcile Tsimerman 2012's arXiv discriminant/compact-index notation and Pila–Tsimerman 2013's intermediate maximal-order-discriminant/matrix expressions. Preserve the final centre-order discriminant dependence. The 2013 text says 4g for certain coordinate degrees whereas 2014 uses 2g; only a dimension-dependent bound is currently claimed. Separate coordinatewise, joint-field and real/imaginary degree conventions. Pin the bounded-degree algebraic-point counting extension, not only rational Pila–Wilkie.
4. **Finish baseline and ownership.** The full audit is available; check remaining declarations and the relevant accepted packets, integrated decompositions and links. Reserved IDs and existing paper outputs were screened, but not the full overlap universe. Do not promote pending AUDIT-34. Generic reductive-normalizer, canonical-model, order/Picard and Weil-pairing constructions stay with their existing owners even when LD.6 consumes them.
5. **Activate justified routes only.** Candidate CM Part II and quantitative-isogeny Part II briefs are in the report. The uniform analytic estimates need a decision after screening AN.4/AL.1 and existing effective/analytic work. No IDs are reserved and no Part II/new route is active. Route each remaining missing item exactly once only after that screen. Mixed foundational ownership and the earlier Gao theorem proofs remain open.

## Validation already done

The actual `scripts/check_paper.py` CLI passes against the full verified repository atlas and proposed-roadmap loader. All eight `test_check_paper.py` unit tests pass. There are 84 unique IDs, 102 internal dependency edges, no cycle, no unresolved internal dependency, and no multiply routed missing item. Setting status to complete as a negative control gives exactly 41 unrouted-item errors. These are structural tests, not source or Lean proof checks.

No Lean compilation was run; none is claimed. Source PDF hashes remain null because their binary bytes were not acquired. The repository artifact hash is verified but is not a PDF hash. Keep this checkpoint partial until the mathematical/ownership gaps and missing routes are actually resolved.
