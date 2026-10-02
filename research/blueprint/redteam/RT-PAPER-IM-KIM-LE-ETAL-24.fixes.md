# FIX-RT-PAPER-IM-KIM-LE-ETAL-24

Completed by Codex, session **codex-J6LwjP**, 2026-10-02. [Issue #5519](https://github.com/CBirkbeck/tauceti-explorer/issues/5519). All five independently confirmed findings have been applied to the extraction and reader. Implementation and proof closure are not claimed.

## Sources and reading boundary

Targeted source: the [49-page published article](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/B9AC9CF28F90ABB495FDC43093D51E05/S2050508624000180a.pdf/zagierhoffmans_conjectures_in_positive_characteristic.pdf), Forum of Mathematics, Pi 12 (2024), e18, DOI 10.1017/fmp.2024.18. Download SHA-256 `82e85086688c1274207d7265a310381a4b04d02243d11ee78bf67a8105ab7e98`. Checked published pp. 4, 20–23, 27, 30 and 47–48, with rendered pp. 20, 22, 23 and 30. These checks concern the analytic definitions, matrices and tail setup, strict application bounds, normalized relation theorem and direct supplier citations. No complete rereading or new preprint collation is claimed. The prior extraction/review's full reading and erratum searches remain attributed to those sessions. All 36 source issues and their independent verdicts are unchanged; E14 is propagated, not added or re-reviewed by this fixer.

## Finding 1: split the analytic base

**Applied.** Item 1 now claims only algebraic/valued rational-function infrastructure. Its library references include `RatFunc.inftyValuation` and `RatFunc.CompletionAtInfty`; their actual pinned statements construct the infinity valuation and its uniform completion with an extended `Valued` structure. The sign convention is recorded explicitly: the multiplicative value of θ is exp(1), corresponding to the paper's additive valuation −1. LaurentSeries is a formal carrier, not a claimed normed identification with K_∞.

The new **planned** `analytic-C-infinity` item imports the normalized normed/rank-one completion, characteristic-p completed algebraic closure and compatible embeddings from **DrinfeldModulesAndTModules:DM.2**. The actual layer contract and reviewed AUDIT-20 partial target were read. `IsAlgClosed.of_denseRange` has `CharZero L` and cannot discharge the characteristic-p construction. The new item has source, prerequisite, API and proposed unit tests for characteristic, constants, normalization and embedding compatibility. Relevant analytic consumers and the Part II brief explicitly import it. Remaining prerequisite work belongs to DM.2; no new base-field roadmap or packet was authorized.

## Finding 2: separate general Tate theory from ℰ

**Applied.** The new **library** `restricted-series-library-ingredients` item records precisely what the pins supply: `PowerSeries.IsRestricted`, `isRestricted_iff'`, its subring, `gaussNorm`, `gaussNorm_eq`, and Tau Ceti's boundedness and multiplicativity results. The actual declarations were read. The carrier needs a normed ring; the subring uses ultrametric distance. Multiplicativity additionally needs positive radius and `NormMulClass`. This claim includes no Banach completeness or unrestricted substitution theorem.

The new **planned** `ordinary-tate-algebra-and-gauss-norm` item imports the remaining general topological, substitution/evaluation and fraction-field interfaces from **tauceti:TauCetiRoadmap/AdicSpaces#layer-0-topological-algebra-huber-rings-and-tate-algebras**, §§0.4–0.5. The actual upstream contract was read; it was not edited or re-planned. The old bundled item keeps its stable ID but now owns the specialized ℰ ring, finite coefficient-field requirement, entire evaluation and function-field Frobenius compatibility. That missing component remains routed exactly once to the existing shared Drinfeld Part II. All three components have distinct claims and API/tests. In particular Σ θ^(−n)t^n is restricted at radius one but has root coefficient norm q⁻¹, so is not entire and diverges at θ; a general unit-disc evaluation cannot supply the period specialization.

## Finding 3: propagate accepted E14

**Applied.** The authoritative statements of /28, /30 and `abp-difference-system-2-12` require the sufficient termwise condition

```text
‖Q_j‖_∞ < |θ|_∞^(q s_j/(q−1))  for every component j.
```

Thus every consecutive subtuple, including each prefix and tail in Ψ and f, converges. If c_j denotes the normalized norm ratio, choose c=max c_j<1; products of c_j^(q^i_j) are bounded by c^(q^i_1), tending to zero. The historical full-tuple condition remains in separate fields linked to unchanged E14. The constants-only type in /30's usable setup is replaced by the already accepted E16 polynomial type. Specialized AMZV/ACMPL constructions state why γ and γH_s meet the strengthened hypothesis: |γ|=1 and (3.4)'s strict degree bound. Cited whole-tuple results /29, `chang-series-entire` and the Frobenius statement keep their original mathematical scope; only their application to subtuples is guarded by the corrected setup.

**Exact regression.** For s=(q−1,q−1), Q=(1,θ^(q+1)), the full-tuple normalized exponent is −q·q^i₁+q^i₂≤−q^(i₁+1)+q^(i₁−1), tending to −∞. The suffix has exponent q^i, so its terms do not tend to zero. Checked 495 ordered pairs at nine prime powers, together with the exact bound argument. The inequality (s−1)q/(q−1)<sq/(q−1) was checked with exact fractions for 20 positive s at these q, confirming the application-bound margin. These are domain/counterexample checks, not a formal proof of the entire analytic construction.

## Finding 4: restrict the reader theorem

**Applied.** The reader now states the augmented normalized-period relation theorem for J′_w. A nontrivial relation has nonzero constant coefficient and requires (q−1)|w; uniqueness is after that coefficient is normalized to 1, with the original trivial-character qualification. AS_w is itself independent, and arbitrary ACMPLs are reduced to that basis. The correct /34, including γ and π̃ normalization, is unchanged.

**Exact regression.** Over F_3(θ), checked the finite identity

```text
Li_≤N(3) + (θ³−θ) Li_≤N(1,2) = ℓ_N^(−3),  N=1,2,3,
ℓ_N = ∏_{j=1}^N (θ−θ^(3^j)).
```

Here both truncated series use the paper's descending indices. The boundary tends to zero in the infinity norm; the source binary relation gives the limiting unrestricted relation. Its weight is 3, and 2 does not divide 3. The tuple (3) is excluded from J′_3, while (1,2) is included, so this is no contradiction with /34. Exact finite-field polynomial arithmetic was used, without floating-point approximations or a claim of computing the infinite values.

## Finding 5: add direct supplier citations

**Applied.** Added three works, raising prerequisites from 20 to 23, and cross-linked the relevant item notes:

- [Chang–Papanikolas–Yu, arXiv:1411.0124](https://arxiv.org/abs/1411.0124), JEMS 21 (2019), 405–440, DOI 10.4171/JEMS/840: /28, `cpy-common-denominator`, `chang-frobenius-property`, `acmpl-period-interpretation`.
- [Chen–Harada, arXiv:2012.00340](https://arxiv.org/abs/2012.00340), Documenta Mathematica 26 (2021), 537–559, DOI 10.4171/DM/821: `amzv-period-interpretation`, published Eq. (3.5) quoting Proposition 2.12.
- [Im–Kim–Le–Ngo Dac–Pham, HAL hal-04240841](https://hal.science/hal-04240841), Note on the Linear Independence of Alternating Multiple Zeta Values in Positive Characteristic: `proposition-4-13-lower-bound`, published §5.4/Proposition 5.13. The [publisher metadata](https://link.springer.com/article/10.1007/s40306-024-00554-4) confirms Acta Mathematica Vietnamica 49 (2024), 485–521, DOI 10.1007/s40306-024-00554-4.

The main article explicitly identifies these direct uses. The two arXiv records and publisher metadata were checked. HAL's record was protected by an anti-bot page in this session; the public link is retained from published reference [26], without claiming this session read the Note's proof. These suppliers remain black boxes at extraction scope; recursive extraction or proof closure is not required by §16.

## Validation and handoff

- **102 items: 2 library, 13 planned, 87 missing**, after three new split components. Original IDs and statuses are preserved. The 87 missing items remain routed exactly once: 86 in the shared Part II and one source for DM.8. Route membership and all route fields outside the Part II brief are unchanged.
- All unaffected item records, /34, all 36 source-issue records and the original 20 prerequisites are unchanged. The explicit added dependencies all resolve and form an acyclic graph. The new imports do not imply supplier implementation is complete.
- Pinned Mathlib **082e2d37e8b0463410cdb532e111cd43d5a66174** and Tau Ceti **f790474821cf4256814db967cb154e7af3d0c369** were confirmed locally. Read the listed declarations and actual DM.2, DM.4 and AdicSpaces Layer 0 contracts/coverage. No new broad library-absence audit is claimed.
- Exact regressions, `scripts/check_paper.py`, intake `check-files` for the three authorized deliverables and `git diff --check` passed. No packet, Lean source or upstream file is authorized; no Lean compilation was performed.
- All five confirmed findings are applied. The owning design jobs receive the corrected import and convergence boundaries through the extraction brief; no competing roadmap is proposed. Analytic completion, Tate interfaces, supplier proofs and final theorem implementation remain blueprint work.
