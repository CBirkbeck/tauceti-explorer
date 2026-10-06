Completed 2026-10-06 by Codex, session `codex-73oRGW`, for issue #6454, job `REV-HeegnerPointEulerSystems--HE.0~2`. Verdict: **accepted**. This session wrote neither the original blueprint (`codex-J6LwjP`) nor its revision (`codex-X0Qf6a`). The earlier independent review remains available in [REV-HeegnerPointEulerSystems--HE.0.md](REV-HeegnerPointEulerSystems--HE.0.md).

The review covers all 78 nodes at target level: **53 verified, 25 corrected, zero added, zero removed, zero unverifiable**. Every node has an individual source, hypothesis and prerequisite assessment in the packet's `review.checked` ledger. All 13 baseline declarations are confirmed. The six definitions/constructions retain 24 API items and 18 tests. The 43 planets remain key definitions, constructions or named theorems. The packet is a complete target-level pass; all eight stages are planned. Its 21 gaps and 64 requests remain open, and every implementation status remains unchecked. Acceptance establishes the correctness of this plan within those explicit boundaries.

| Stage | Nodes | Planets | Coverage |
| --- | ---: | ---: | --- |
| HE.0 | 9 | 6 | planned |
| HE.1 | 6 | 5 | planned |
| HE.2 | 7 | 5 | planned |
| HE.3 | 6 | 3 | planned |
| HE.4 | 9 | 6 | planned |
| HE.5 | 9 | 6 | planned |
| HE.6 | 19 | 6 | planned |
| HE.7 | 13 | 6 | planned |

Every correction requested by the first review was checked against the revision, its reader and the sources. The R18 quaternionic geometry suppliers, Howard H2 field containing K, Gross's actual mod-p descent inputs, the indefinite/definite parity distinction, the conductor-one trace, the root-number exponent, and the local base-locus tests are retained correctly. The formerly false arbitrary-group dihedral signature now transports the relation through a homomorphism from an actual cyclic dihedral group. The indivisibility prototype requires a supplied nonzero auxiliary localization. The finite-generation/non-torsion hypotheses and the guarded rank-zero valuation formula remain explicit.

The first review's eight unverifiable targets now have justified proof routes. For HE.6, the revision supplies the actual residual V/k₀ local pairing, relation (8.1), conjugation parity and Zhang Lemmas 8.1–8.2 before the triangular Selmer argument. Gross's E[p]/Fₚ argument is no longer substituted for that GL₂-type representation. The period comparison has an independent early BSD-owner contract, including its definite odd-parity and nonsquarefree scope. BSD.5 and BSD.6 remain downstream; neither supplies a return prerequisite to HE.6.

For HE.7, the decisive additional source is Nekovář's author preprint, especially its entire quadratic-character proof in §7.5. Its finite cocycle construction uses the direct norm-zero identity and bounded component corrections. It does not require an unrestricted inverse to restriction when torsion invariants survive. The image argument separates the homothety/Sah error, rational Burnside argument and the integral evaluation-lattice cokernel. Detection uses the strong auxiliary prime condition modulo p raised to M plus the fixed error, rather than residual detection alone. Integral 1±ρ is retained at p=2. The two-prime argument gives a uniform annihilator independent of M; finite fixed-level Selmer groups and cofinal Kummer control then give finite primary Sha. Almost-all primary vanishing gives full finiteness.

Nekovář's hypothesis concerns acquisition of complex multiplication over K. It permits a curve with geometric CM whose endomorphism field differs from K. The classical CM application uses the conductor/endomorphism-field dictionary and the Heegner coprimality to prove that difference. Its Tate-image index is taken in the full coefficient-linear automorphism group of the actual Tate module, with the Cartan convention in the CM case. The RM application is restricted to the stated GL₂-type coefficient and no-acquired-CM hypotheses. The exact general image, CM conductor and abelian finite-Selmer exports remain supplier requests. These are source-backed applications, without duplicating their general proofs inside HE.

The classical square-index bound is separately sourced to Gross's statement and Kolyvagin's 1991 Theorem A. Those texts refer to the earlier Euler Systems proof. That proof was not obtained from the public Springer endpoint, and its acquisition/export remains a specific gap. Nekovář's uniform exponent argument is not represented as proving that sharper cardinality bound.

The 25 corrected nodes are listed below by suffix; full IDs and individual reasons are in the packet. Other nodes were verified without changing their mathematical data.

| Nodes | Correction |
| --- | --- |
| HE.0 `dihedral-conjugation` | Cite Gross §3, p.238 for the conjugation action and the Lemma 4.3 proof on p.242 for the dihedral quotient; replace the inaccurate excerpt. |
| HE.2 `quaternionic-reduction-specialization` | Specify that λ=qO_K splits completely in the CM fields over K, including K[n]/K with q∤n. Rational q is inert in K/Q and the residue field is F_q². Carry the clarification into the Lean statement comment. |
| HE.4 `ring-class-torsion-invariants` | Locate Gross Lemma 4.3's statement on p.241 and proof on p.242; use the actual torsion excerpt. |
| HE.4 `explicit-cocycle-divisibility` | Locate equation (4.6) and Proposition 4.7 on p.242 and replace the excerpt with a literal cocycle phrase. |
| HE.4 `bottom-trace-class` | Add construction (4.1), p.241, alongside the already correct note after Proposition 4.7, p.242. The previous review's p.242 note remains valid. |
| HE.4 `generator-tensor-choice-independence` | Replace the unsupported tensor quotation with Howard's actual commuting-map phrase. |
| HE.5 `local-heegner-chi-automorphism` | Cite Howard Proposition 1.7.4 on preprint p.21 and published pp.1457–1458. |
| HE.5 `finite-singular-comparison-and-the-corrected-kolyvagin-system` | Use the actual modification excerpt from Howard's construction. The missing global localization square remains recorded as a gap. |
| HE.6 `ribet-takahashi-tamagawa-comparison` | Pollack–Weston's relevant sections are §§6.2–6.5, pp.18–21; Theorem 6.8 is in §6.5. Correct the source reading locator as well. |
| HE.6 `zhang-triangular-selmer-basis` | Record the final detector-index misprint in the source and explain the corrected argument in the source match. |
| HE.6 `heegner-vanishing-order` | Use an exact short excerpt that survives the printed line break. |
| HE.6 `zhang-residual-local-pairing`, `zhang-residual-heegner-relations`, `zhang-two-class-prime-detection`, `zhang-prescribed-ramification-class` | Replace inaccurate excerpts with passage-specific literal phrases; locate (8.1) on p.235 and (3.24) on p.213. |
| HE.7 `almost-all-primary-sha-vanishing`, `bounded-arithmetic-derivative-denominators`, `dyadic-integral-conjugation-descent`, `cm-character-error-descent`, `exceptional-primary-sha-bound`, `classical-full-sha-finiteness`, `admissible-rm-kolyvagin-logachev`, `integral-tate-image-errors`, `integral-cm-prime-detection`, `cm-heegner-field-disjointness` | Replace repeated unrelated Theorem 7.3 excerpts with literal excerpts from each actual proof passage. Locate §7.2.1 on p.44 and §7.1.2 on p.43. The mathematical statements and integral proof routes remain intact. |

All 13 baseline statements were independently read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their surrounding typeclass hypotheses. None was removed, replaced or added in this review. The four dihedral entries received explicit theorem-kind and independent-check metadata. The earlier submission and review receipts are retained as historical records.

| Baseline declaration | Confirmed scope |
| --- | --- |
| `Subring.comap` | Preimage along a ring homomorphism; [Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Ring/Subring/Basic.lean#L175). |
| `ClassGroup.equivPic` | Class-group/Picard multiplicative equivalence for a commutative domain; [PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean#L876). |
| `CommRing.Pic.mapRingHom` | Picard functoriality for commutative semirings, with identity and composition laws; [PicardGroup.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PicardGroup.lean#L579). |
| `PadicInt` | Bounded Qₚ subtype under `Fact p.Prime`; [PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean#L56). |
| `PadicInt.ideal_eq_span_pow_p` | Requires a nonzero ideal; [line 533](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean#L533). |
| `PadicInt.mem_span_pow_iff_le_valuation` | Requires a nonzero element; [line 460](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean#L460). |
| `WeierstrassCurve.Affine.Point` | Nonsingular points and infinity, with the group instance over a field; [Point.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean#L478). |
| `Module.length` | Length in ℕ∞; [Length.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Length.lean#L27). |
| `Nat.primeFactorsList` | Multiplicity is retained; taking the finite set's cardinality counts distinct primes; [Factors.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Data/Nat/Factors.lean#L38). |
| `DihedralGroup.sr_mul_r`, `sr_mul_sr`, `inv_r`, `inv_sr` | Existing rotation/reflection identities in the actual `DihedralGroup` and ZMod context; [Dihedral.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/SpecificGroups/Dihedral.lean#L100). They model cyclic quotients of the arithmetic action. |

Tau Ceti source was inspected at `f790474821cf4256814db967cb154e7af3d0c369` through the existing checkout. No Tau Ceti declaration is claimed as a positive baseline entry, and no compilation of its oleans is claimed. The reviewed library audit for HE.0–HE.7 and the relevant generic ES coverage was checked. Existing Picard, p-adic, elliptic-point, length and dihedral algebra is reused; CM geometry, class fields, continuous cohomology and general Euler-system machinery remain with their owners.

The complete statements of the 17 fine-node imports and the 37 proposed supplier-stage contracts were read, together with the eight upstream anchors: orders/Picard, global class-field existence and norm theorems, elliptic torsion/local reduction/Mordell–Weil/Selmer, and Chebotarev. Relevant upstream EllipticCurves and ModularForms documents were also read for the required density and API conventions. Exact contracts distinguish arithmetic/geometric Frobenius, elliptic versus abelian Kummer, finite-flat p-place versus away-from-p unramified conditions, geometric versus rational components, parametrisation degree versus Manin constant, and a raised level divisible by q versus Zhang's exact local-type Nq theorem. Requests name the stronger exports where the current supplier statement does not provide them. The prerequisite graph and the source-backed target realizations were checked; no unrecorded non-routine dependency was found.

The API and tests were assessed by use. The conductor-point API supplies evaluation, composition and equivariance; its tests distinguish a point from its base-field trace. The coefficient ideal uses the sum of local ideals, with empty sum zero and tests distinguishing minimum from maximum valuation. Descent uses the actual restriction equivalence, with naturality, uniqueness and a noninjective-map obstruction. Correction uses the inverse global automorphism, including composition order and the bottom class. Vanishing order uses ℕ∞ and distinct prime support, distinguishing the empty family from conductor one. Base locus quantifies over every good prime, with tests for zero localization, a nonzero localization and exclusion of bad primes. All six objects have at least three useful tests and all 24 API items have appropriate uses. Full mathematical comments were added beside the four early construction signatures; the prototype limitations and the completed review are now stated in the Lean header.

The supplied red-team findings are respected by both the packet and the relevant reader passages:

- RT-AREA-iwasawa-1/2 imports the existing Diamond level-raising node and requests the stronger exact-level/local-type theorem from its owner.
- RT-AREA-iwasawa-1/8 uses R17.3 and the precise ModularIwasawaL1/KatoL4/SelmerL4 rank-zero inputs. Its period export precedes HE.6, with no circular BSD-stage prerequisite.
- RT-AREA-iwasawa-1/9 leaves the general Serre/Ribet and homothety theorems with the proposed R28.7 owner, including the separate CM scope.
- RT-AREA-iwasawa-1/10 leaves generic Howard H0–H5 descent and the Λ theorem with ES.4/ES.5/ES.8. HE verifies the actual Heegner hypotheses and applies the theorem; GH.5 is a consumer. The other supplied area findings were read and do not create additional HE.0–HE.7 targets.

Public source files were retrieved independently. Their URLs, SHA-256 values and version boundaries are recorded in `verification.independentReview.sourceRetrieval` and the ten new `sourceVersions` receipts. All historical receipts are preserved. Nine retrieval hashes match the earlier receipts. The Cambridge Howard PDF differs in bytes, but its title, DOI 10.1112/S0010437X04000569 and the printed Proposition 1.7.4/Theorem 1.7.5 passages agree with the preprint.

| Public source | Reading used for this review |
| --- | --- |
| [Gross](https://www.wstein.org/papers/bib/gross-kolyvagins_work_on_modular_elliptic_curves.pdf) | All scanned printed pp.235–256, visually read. |
| [Howard preprint](https://arxiv.org/pdf/1202.6340), [published version](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/1BF8414258216C1575963BBDA814CB2F/S0010437X04000569a.pdf/the-heegner-point-kolyvagin-system.pdf) | Finite-level introduction, §§1.1/1.6/1.7 and H0–H5; published identity and pp.1457–1458. |
| [Cornut–Vatsal](https://personal.math.ubc.ca/~vatsal/research/part1.pdf) | Frobenius conventions, §2, §§3.5/3.8 and Appendix §§6.1–6.4. |
| [Zhang](https://archive.intlpress.com/site/pub/files/_fulltext/journals/cjm/2014/0002/0002/CJM-2014-0002-0002-a002.pdf) | Standing hypotheses and the cited congruence, local-condition, period, rank-zero, two-class detection, triangular-basis and indivisibility proofs in §§2–10. |
| [Khayutin published](https://annals.math.princeton.edu/wp-content/uploads/annals-v189-n1-p04-s.pdf), [v3](https://arxiv.org/pdf/1710.04557v3) | Published order/torus passages and §5.2; v3 Lemma 5.8/Remark 5.9 only, p.36. |
| [Nekovář author preprint](https://web.archive.org/web/20221115094729id_/https://webusers.imj-prg.fr/~jan.nekovar/pu/euler.pdf) | The cited hypotheses and §§3–7, including the complete §7.5 quadratic-character integral argument. This is the 53-page preprint dated 23 May 2007; published wording was not obtained. |
| [Pollack–Weston v1](https://arxiv.org/pdf/math/0610694v1) | Standing CR hypotheses and §§6.2–6.5, including Theorem 6.8. Its squarefree hypotheses are not silently extended; the nonsquarefree variant is a separate requested comparison. |
| [Kolyvagin, structure of Sha](https://www.wstein.org/papers/bib/kolyvagin-structure_of_sha.pdf) | The classical order theorem, Theorem A in the introduction, and its stated source boundary. |

All five existing source findings E1–E5 are confirmed. E1 requires the away-from-p restriction in Zhang Lemma 5.1. E2 is the invalid implication from decomposition invariants to inertia invariants; the local unramified quadratic Tate-twist example diagnoses that step without asserting a global counterexample to all newform hypotheses. Its repair remains restricted to the split additive application. E3 and E4 are Khayutin's normalization and missing unit-stabilizer slips, already known from the extraction. E5's split conductor-three order has discriminant 9 and different generator norm −9; unit norms cannot change it to +9. The ideal/valuation form is retained.

Three additional findings are confirmed and recorded with version and primary-source correction searches:

| Finding | Correction and scope |
| --- | --- |
| E6, Gross Proposition 8.1(2), p.248 | The local pairing reference is (7.3), p.247. The printed (2.3) refers to a Selmer theorem and defines no pairing. Index misprint, no change to the argument. |
| E7, Nekovář §7.2.1, p.44 | The local constants come from Proposition 5.12, p.30. Section 5.2 defines the strong prime set. Index misprint scoped only to the inspected author preprint. |
| E8, Zhang Lemma 8.4 proof, p.239 | The final detector is ℓ₂ν₊₁, just re-chosen by Lemma 8.1. The printed ℓν₊₁ has already been killed by the preceding dimension count when ν≥1. At ν=0 the indices agree. The packet uses the intended argument. |

The revision's reader matches the resolved mathematical issues and the red-team boundaries. This review's authorization excludes editing it. Two editorial clarifications remain for its owner: spell out that the splitting prime in the quaternionic reduction paragraph is λ over K, and label Pollack–Weston's cited passage as §§6.2–6.5 containing Theorem 6.8. The former is the source's shorthand interpreted by the surrounding inert-prime and CM-field conventions, not a remaining mathematical contradiction. The report and packet provide the explicit interpretation.

Actions for the orchestrator and supplier owners are already represented by the open requests:

1. Integrate the proposed independent early `BSD.3a/definite-congruence-period` contract with its exact parity, coefficient and nonsquarefree hypotheses, keeping the final BSD index formula downstream.
2. Supply the global χ change-of-group/localization comparison and typed continuous-cohomology and CM-model interfaces. Successful prototype elaboration does not supply these maps.
3. Route general image/homothety and CM conductor exports to R28/R01/CM, and the abelian finite-Selmer variant to SelmerL0. Preserve Nekovář's no-acquired-CM and integral-lattice hypotheses.
4. Acquire the original classical cardinality proof and its ES.4 export. The proved uniform exponent/finiteness route and the separately quoted sharp order theorem retain different source boundaries.
5. Apply the two reader locator/notation clarifications when that deliverable is next writable. No additional revision of these 78 target-level nodes is required by this review.

Validation: the final packet checker reports zero errors and zero warnings. The errata checker accepts an errata-v1 projection of all eight findings and 20 version receipts. Intake file validation reports four files and zero problems. The final `lean-check` run elaborates at the exact Mathlib pin with exit 0, zero errors and 114 warnings, all uses of `sorry`. All 78 node names, 24 API names and 18 test labels are present, and every packet mathematical statement appears in the suggested file. This is a Mathlib-only signature check; all omitted arithmetic conditions and supplier gaps remain explicit. The packet stores the final Lean-file SHA-256 and check receipts.
