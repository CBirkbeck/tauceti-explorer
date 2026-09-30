# FIX-RT-PAPER-SKINNER-20

Codex — `codex-rtOQ9t`; 30 September 2026; [issue #5144](https://github.com/CBirkbeck/tauceti-explorer/issues/5144). All **six** confirmed findings in `RT-PAPER-SKINNER-20.review.json` are addressed, including /6, which was not reproduced in the issue's main finding list. Changes are limited to the extraction, its reader report and this fixes report. The previous review is historical; these fixes await their independent REV-FIX review.

## /1 — Import the actual logarithm repair

Freshly read [Burungale–Skinner–Wan v2](https://arxiv.org/pdf/2603.20886v2), especially §1.2, Theorem 1.1, Theorem 2.3/Remark 2.4, §3 and §4.1, and compared the published Skinner passages. The result applies because `M_f` is totally real and `dim A_f=[M_f:Q]`. An actual non-torsion algebraic generator has a nonzero logarithm in every eigencomponent. With finite p-primary Sha, the rational Kummer comparison gives the required injectivity on the one-dimensional λ-Selmer space.

Items 5, 10, 20, 39, 59, 62 and 77 and the Part II brief are corrected. The full published Lemma 2.2.2, Corollary 2.6.2 and A/E conclusions are restored under their original hypotheses. E5/E6 retain the historical omissions and prior assessment/review provenance but now identify the public-preprint repair, with updated correction, reason, known and search record. Their effect is an omitted proof, not a newly false theorem. The old review is not represented as accepting the new correction.

The added items are:

- **79:** the p-adic analytic subgroup theorem for the needed non-torsion algebraic-point case.
- **80:** its F-stable form.
- **81:** BSW Theorem 1.1 with the degree/dimension and real-embedding hypotheses.
- **82:** the modular RM/Heegner application, importing the general theorem.

Items 79–81 are missing source additions at DT.3; 82 is missing at GZ.9. These statements are not already promised by DT.3's current contract. RankOneConverse imports them, and the unrelated structural-rank conjecture is not introduced.

For the tensor point, the explicit comparison is `P_K(f)=φ(ε_f Q^ξ_K)`, with `y=φ(Q^ξ_K)∈A_f(K)⊗Q`. Nonzero P implies nonzero y. Clear the rational denominator of y, apply the algebraic-point theorem, and use the eigenproperty of the differential to identify the logarithms. The argument is not applied directly to an arbitrary tensor. **Theorem B, including (e), is unchanged**, and so is the warning against nonvanishing from an arbitrary nonzero cohomology class. E's separate derivative-nonvanishing supplier remains.

## /2 — Restore four usable mathematical statements

Items **5** and **10** now state all A/E hypotheses and conclusions. Item **19** defines W, local Kummer/Bloch–Kato conditions, Selmer and Sha, the fundamental exact sequence, finite-S description, maximal-divisible image and rational/λ comparisons. In particular, the three local vanishing groups are named; it does not assert that the whole torsion-coefficient H¹ vanishes.

Item **59** now gives the complete §3 deduction: ordinary-prime choice, residual conditions, parity, the two auxiliary-field alternatives, sign-compatible twist nonvanishing, forward rank-zero theorem and quadratic comparisons, the repaired verification of B(e), and L-factorization. Full input contracts have stable numbered references. Editorial instructions have moved out of statement fields.

## /3 — Separate the indefinite realization and its normalization

Item **68** is now global transfer and uniqueness, planned at **R17.3**. Added **87** (curve, R18.1), **88** (cohomological/Hecke realization, R18.4), **89** (quotient/differential realization, GZ.3), and **90** (missing Skinner–Brooks normalization adapter, RankOneConverse). R18.3 is no longer the direct supplier for an indefinite curve. Item 28 explicitly imports HE.1's existing quaternionic CM/Hodge-point construction and keeps only its specific projector/normalization comparison. Item 27's cusp comparison is restricted to Case I; the Hodge identity is the one shared by both cases.

The published Brooks copy exposes a useful additional locator correction: **Skinner's §2.8 citation points to a transfer paragraph now in Brooks §2.7, p.4190**. Section 2.8 concerns standard cohomology classes. Added source issue E12, retaining the original locator alongside the corrected published locator. The M_f/differential adapter is explicit missing work; no arbitrary scalar is silently set to one. The source was read only at the recorded selected pages, not in full.

## /4 — Give the Cassels–Tate input a shared owner

Added **83** (elliptic pairing), **84** (both kernels/maximal-divisible quotient), **85** (elliptic alternation), and **86** (finite odd-primary paired elementary divisors). They route to a shared source addition at **SelmerIwasawaCohomology L1–L2**, importing ArithmeticGaloisDuality and the existing Sha carrier. Items 61/74 and the converse brief import that source.

[Poonen–Stoll's corrected author version](https://math.mit.edu/~poonen/papers/sha.pdf), §1 p.2 and §3, is the public source read. The report credits Cassels' original elliptic theorem and Tate's generalization, distinguishing them from this later exposition. General principally polarized alternation is not asserted.

The finite-alternative argument needs more than square cardinality: a cyclic group of order p² also has square order. Item 86 therefore states the paired-elementary-divisor conclusion `H⊕H`, which excludes every nonzero cyclic p-group. Its hypothesis is only finiteness of `Sha[p∞]`. The Selmer proof first supposes the finite alternative, derives this p-primary finiteness and then contradicts the pairing; it never assumes global Sha finite prematurely.

Coordinate the existing **ArithmeticStatistics** gap “Cassels–Tate pairing and its isogeny adjointness”, needed by `ArithmeticStatistics:ST.5/three-isogeny-selmer-parity`, plus its L1 annihilator request. This fix supplies a common owner; it does not claim that its four items prove the additional adjointness result.

## /5 — Keep the A′ deduction with the converse

Item **64** changes from planned to missing and is added exactly once to RankOneConverse. It imports modularity/parametrization and the local-factor comparison from **R29.5–R29.6**, item 63's actual reduction-type dictionary, and item **91**, which makes rank and Sha-finiteness invariance under an elliptic isogeny explicit. That comparison is already planned in EllipticCurves Layer 7 and imported by **BSD.1**, next to quadratic descent; it is not replanned inside modularity or the converse. The applied Theorem A remains in RankOneConverse.

## /6 — Correct bibliography, notation and strict-prime terminology

Serre's page range is **123–201**. The source reading summary also distinguishes the eventual Wan journal metadata from Skinner’s bibliography [26], which still says 2014/to appear. Items 46–47 and the Wan prerequisite use the published **Σ** notation, **§7.5** and **Theorem 1.2**, with `O^ur[[Γ_K]]` and the published coefficient extensions retained. Item 46 gives an explicit dictionary to the preprint's **Σ,Hida**, **§6**, older theorem number and smaller rings; its obsolete comment no longer contradicts its statement. The report and route now describe `H¹_𝔭` as **strict at 𝔭, relaxed at 𝔭̄**.

## Concrete blueprint handoffs

These are future owner obligations, not edits to the reviewed atlas base. The issue authorizes only the three extraction/fixes deliverables.

| Job / owner | Add or import |
| --- | --- |
| [#1027](https://github.com/CBirkbeck/tauceti-explorer/issues/1027), DT.3 | Items 79–81: algebraic-point analytic-subgroup theorem, stable variant, and real-embedding eigenlogarithm theorem. Use existing abelian-variety/tangent/log carriers; send the theorem to GZ.9. |
| [#745](https://github.com/CBirkbeck/tauceti-explorer/issues/745), GZ.9 | Item 82's actual-point/projector comparison; keep the arbitrary-cohomology warning. Import DT.3. |
| [#744](https://github.com/CBirkbeck/tauceti-explorer/issues/744), GZ.3 | Supply existing rational quotient/differential contract 89 to the specific comparison 90; retain scalar and field-of-definition choices. |
| [#988](https://github.com/CBirkbeck/tauceti-explorer/issues/988), Selmer L1–L2 | Items 83–86 on the existing Sha type; import ArithmeticGaloisDuality and coordinate the existing ArithmeticStatistics request. Export the finite-p-primary structure lemma to item 74. |
| [#951](https://github.com/CBirkbeck/tauceti-explorer/issues/951), DESIGN-SKINNER | Import all shared inputs. Own 64, 90 and Skinner's arithmetic-to-analytic assembly; keep B(e), the published A/E hypotheses and E's derivative-nonvanishing input. |

DT and Selmer have partial packets. The existing GZ.0 packet is partial with eleven nodes and no GZ.3 construction; no GZ.8 packet or RankOneConverse packet exists. Supplier plan changes therefore go to their pending jobs under §17. No packet, campaign, atlas, independent review or other extraction was changed.

Suggested owner acceptance cases: the logarithm result rejects a torsion point and retains `dim A=[F:Q]` and the real-embedding hypothesis; a nonzero arbitrary tensor does not satisfy the actual-point premise automatically; a nonzero rational denominator scales the logarithm compatibly. The pairing API should export bilinearity, left/right radicals and elliptic alternation without a Sha-finiteness premise, and only then a finite-primary perfectness/structure theorem. A cyclic p² group must fail that structure test even though its order is square. These are blueprint test obligations, not claimed Lean tests.

## Verification and provenance

All 78 previous item IDs remain; thirteen items were added. There are **91 items, 31 planned and 60 missing**, eight routes, and twelve source issues. Only original item 64 changes status. The original Theorem B statement and its explicit (e) are preserved exactly. E1–E4 and E7–E11 are preserved. E5/E6 retain their historical assessment and review without manufacturing a fresh review.

The reader report and JSON record URLs, retrieval dates, SHA-256 hashes and precise reading extents for Skinner, BSW, Poonen–Stoll and Brooks. Source-version validation distinguishes the inherited preprint reading from the fresh published/source checks. Exact pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Reviewed audits AUDIT-07, AUDIT-25, AUDIT-27 and AUDIT-11 and actual pinned declarations were inspected; no library theorem for the new inputs was found.

Checks: `scripts/check_paper.py`; intake on all three deliverables; source-version validator; unique/stable-ID and exact-once route guards; stage ownership; selected dependency acyclicity and absence of a GZ.9→DT.3 path before the proposed supplier edge; mathematical diagnostics for finite cyclic versus symplectic p-groups and the numerical dimension constraints in the stable-subgroup argument; `git diff --check`. These diagnostics check the contracts and failure cases, not the transcendence theorem or the Cassels–Tate construction. No Lean file was requested, generated or compiled.
