# Verification of RT-PAPER-BROWNING-SAWIN-20

Codex — `codex-5ebb6f`, 30 September 2026. Issue #4084. Complete verification of all 13 findings: **12 confirmed, one rejected**. Both medium findings are confirmed with the qualifications below; ten low findings are confirmed and low finding12 is rejected. The machine-readable reasons are authoritative for the scope of each correction.

This session did none of the extraction, its original review, or the red team. The named authors are extraction sessions `a71f92`, `c83e7a`, `cc-442dc5`; review `cc-39fac3`; red team `cc-f805bf`. I checked the files at repository base `c82f66228ade9763d2108c1640cef462ffa7daf3`. Previous work in this worker loop concerned other issues. No collaborator or subagent was used for this verification.

I freshly acquired the following public sources on 30 September 2026. A download or matching hash is not a claim to have read the entire document.

| Source | URL | SHA-256 | Reading in this verification |
|---|---|---|---|
| Browning–Sawin, published | [Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v191-n3-p04-s.pdf) | `f20c87e337c054e42134bf2daf577203ce4b391e0d22ff59b9425d1249c33c53` | Selected passages pp.894–895,897–901,906–908,919,924,932,935–936,939,942–943. |
| Browning–Sawin, arXiv v3 | [v3 PDF](https://arxiv.org/pdf/1711.10451v3) | `4518f88842e2bc19d2b2e0634f1df54c96d36164331e88fc30ef892f3c879072` | Hash/provenance comparison; no fresh full preprint reading. |
| Katz–Sarnak | [Author-hosted book](https://web.math.princeton.edu/~nmk/RMFEM.pdf) | `39beb011e5fab2737bb131611f054221108128fbebbb7f62ba2de9a56f755dd5` | Sections11.4.1–11.4.9, pp.331–334, including the proof and rendered p.334. |
| Ellenberg–Venkatesh–Westerland | [Published Annals PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n3-p01-p.pdf) | `6c10d770348c625ad9fe80d2c47093cde2a2ba05f39a28d547743f0f4993a7f6` | Sections2.1–2.2, pp.738–739; sections7.5–7.6 and compactification proof, pp.767–768. |
| Abe | [Published open-access PDF](https://link.springer.com/content/pdf/10.1007/s00222-025-01345-w.pdf) | `f789468ee535bf3347550763fb4f9fce85efa8628247b01a9df2b04b008afb83` | Section1.6, pp.612–614: coefficient types, sheaf, pullback and zero-extension. |
| Lawrence–Venkatesh | [arXiv v3 PDF](https://arxiv.org/pdf/1807.02721v3) | `e3013516c1123635f0373cd5b623eafa3d816f043ee54760dec724d329bc6b9b` | Sections10.1–10.2, pp.55–57: complex monodromy hypothesis and hypersurface application. |
| Browning–Vishe | [arXiv1502.00772 PDF](https://arxiv.org/pdf/1502.00772) | `91eb60cd3ff2448581893e19824bb2f3f2e726f283d6e8335fa4821611421e3c` | Lemma2.8 and its proof context, pp.12–13. The unversioned URL is identified by this fetched hash. |

The source inventory also includes relevant target items, routes and sourceIssues; all red-team finding objects and its report; the original review's verdicts; the cited items and routes in the six other paper extractions and their independent-review dispositions; the current FA.2/FA.5, FF, WC.5 and ES stage contracts; selected reviewed library-audit records; the cited FF packet nodes; RT-AREA-etale's ownership reference; and the errata register and collector/checker code. This is a finding-by-finding verification, not a second complete audit of the 149-item extraction or its 46 source issues.

The library checkout heads reproduce Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. I read the complete relevant declaration statements in Mathlib's `FieldTheory/RatFunc/Valuation.lean`, `RingTheory/LaurentSeries.lean`, `NumberTheory/LSeries/PrimesInAP.lean`, and `NumberTheory/LegendreSymbol/QuadraticReciprocity.lean`, and Tau Ceti's `FieldTheory/GaloisGroups/{Orbits,FrobeniusOrbits}.lean`. Planned FF packet nodes have `implementationStatus: unchecked`; none is credited as a compiled theorem.

| Finding | Verdict | Verified correction or limit |
|---|---|---|
| 1, medium | confirmed | FA.5 owns the all-monic zeta/Euler-product supplier. Split it from weighted-squarefree consumer identities; FF.3 factorization/count nodes are additional inputs. |
| 2, medium | confirmed | Reconcile the shared FF plan and stale missing classifications. The WC.5 routes are **already rejected**, not second accepted owners. Use the exact dimension-from-point-counts node for item48 and Lang-Weil node for item49. |
| 3, low | confirmed | Share the algebraic configuration/torsor prefix. Keep inverse-Galois compactification and disc/braid interfaces, with explicit comparison adapters. |
| 4, low | confirmed | Share the Artin–Schreier prefix; request uncovered torsion/integral coefficient APIs instead of claiming the E-valued FF node supplies all of Abe's kernel. |
| 5, low | confirmed | Export the universal-hypersurface theorem through characteristic-zero comparison to LV's identity-component criterion. Preserve exceptional-case and coefficient distinctions. |
| 6, low | confirmed | Katz–Sarnak11.4.9 includes characteristic2. Remove the added odd-characteristic restriction, retaining the cubic-surface exception and the application's p>k. |
| 7, low | confirmed | Add the pinned orbit-factor library fact and the root-label/permutation-cycle adapter; connect both consumers. |
| 8, low | confirmed | Separate the two prime choices and their quantifiers. Handle ell=2 with the supplementary mod8 law. Raw library ingredients are not the composite adapter theorem. |
| 9, low | confirmed | Deduplicate E46 against E35 and qualify E38 by n>=3. The errata collector has no duplicate-flag filter. |
| 10, low | confirmed | Add structured sourceVersions using documented reading dates. The proposed preprint date is unsupported by the checked metadata. |
| 11, low | confirmed | Add the affine-dimension dependency and expose a generic point-count supplier. A whole-stage ES.0 import of ES.5 would create a cycle. |
| 12, low | rejected | Items66,72,107 already credit the completion at infinity. LaurentSeries is a legitimate model, and the real norm/fractional-part/lattice API remains missing. |
| 13, low | confirmed | Current counts are 149 items, 11 library, 11 planned, 127 missing, 46 issue records. Preserve clearly labelled historical counts and recompute after corrections. |

The medium corrections can be applied without treating another rejected route as accepted. Finding1 needs a closed-point/irreducible-factor and removal-of-infinity specialization. Finding2 has a genuine exact dimension supplier in `FF.2/dimension-from-point-counts`, beyond the red team's proposed Lang–Weil reference. Uniform family estimates and geometric Chebotarev retain their existing review gates. The proposed supplier boundaries are review recommendations; this job changes neither extraction nor roadmap contracts.

For finding11, the current stage chain is ES.0 → ES.1 → ES.2 → ES.3 → ES.4 → ES.5. A point-count theorem required by the early minor-arc proof cannot be imported from the entire late stage. Expose an independently based supplier prefix and import that module. The special polar-dimension bound can remain an ES.0 application that imports the geometric theorem once. Ownership is not determined solely by which paper was reviewed first.

Katz–Sarnak's rendered proof has the inequality n(d−2)>=4, including equality cases. This verification establishes the hypotheses of the cited theorem as written; it does not independently reprove all its SGA7, WeilII, ordinary-hypersurface and Hodge-number inputs. Likewise, the auxiliary-prime adapters are mathematical proof outlines, not Lean elaborations. Any new source issue must complete the protocol's correction search; this review does not certify a previously unsearched omission as a new published error.

Validation: `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-BROWNING-SAWIN-20.review.json`; `python3 research/blueprint/intake.py check-files` on the two deliverables; `git diff --check`. The focused call to `check_errata.versions_checked` reproduced finding10's expected error on the unchanged input. No Lean file was changed or compiled. No library build or language server was started.
