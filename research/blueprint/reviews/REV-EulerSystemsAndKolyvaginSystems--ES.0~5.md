# Independent review: Euler systems, Kolyvagin systems and higher-rank descent, revision five

**Accepted as a complete target-level plan after corrections.** Issue [#10992](https://github.com/CBirkbeck/tauceti-explorer/issues/10992), job `REV-EulerSystemsAndKolyvaginSystems--ES.0~5`. Reviewer: Codex, session `codex-vrupeu`, 2026-10-19. This session wrote none of the five planning rounds. The [packet](../packets/EulerSystemsAndKolyvaginSystems--ES.0.json) records `independent-review-REV-EulerSystemsAndKolyvaginSystems--ES.0~5`; its [reader](../readmes/EulerSystemsAndKolyvaginSystems--ES.0.md) and [suggested signatures](../suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean) agree with the verdict.

Acceptance is of the plan and its explicit contracts. All eight stages remain `planned`: zero stages are `closed`, no arithmetic implementation is claimed, and the six gaps and sixteen outgoing requests remain visible. In particular, the inherited Rubin finite-depth correction is mathematically consistent with the tested ideal arithmetic but has not been independently collated against the book-format source. That access limit is now an explicit sixth gap, rather than an implied fresh publication check.

## Scope and changes

I read all 93 nodes, including each statement, hypothesis, prerequisite, source locator, proof route and acceptance check, all 289 API items, all 154 unit tests and all 37 planets. The inventory is 30 definitions, 13 constructions, 34 theorems, seven lemmas, six applications and three comparisons. Every definition/construction has at least three discriminating tests. The 93-row ledger below records this session's assessment; it is not the preceding review's ledger. Ninety-one targets are retained and two have documentary corrections. All 26 baseline declaration statements were inspected at the pins.

The changes made in this review are:

- Correct the obsolete reference to part `(c)` in `bidual-functoriality`: Stark transitions use the ordered kernel contractions, and the coefficient-change square has its own ambient hypotheses. No contraction or base-change generality is lost.
- Guard the baseline description of `cyclotomicCharacter`. The declaration is a map on field automorphisms; interpreting it as action on all p-power roots needs those roots in the field, for instance a characteristic-zero separable closure.
- Preserve the corrected finite-depth annihilator `((M):a₂)a₁`, qualify its inherited attribution to book-format Theorem 9.3.3, pp.179–180, and add the independent-collation gap. The public 1999 draft IX.3.3, p.137, was read; the historical book mirror was not accessed or authenticated as the publisher edition. Its historical reading records remain attributed to earlier workers. The separate IX.4.3 anticyclotomic citation is retained.
- Replace all admitted `example`s by named theorem targets, list the sixteen new names in the reader, and prove four examples of definitions kept in Lean: derivative order two, derivative of the identity, empty correction determinant and the two-prime negative cross term. Remove the redundant example about the library augmentation. Present the correction matrix through `Matrix.of`, so its finite determinant proofs elaborate directly.
- Reconfirm E1–E6 at the versions actually inspected, replacing their review verdicts with this job's verdicts. Earlier searches and reading histories retain their attribution. Add a separate dated, fingerprinted ledger of this session's bounded source readings.

The blueprint inventory, generality, arithmetic constructions and exact supplier contracts are retained. The report does not pretend that elaboration proves the 22 admitted theorem targets.

## Revision-five mathematics and adversarial checks

The planning round applied whole-roadmap corrections to the invariant argument, finite-depth bound, primitivity branches, saturation and all-prime descent. I checked the resulting statements rather than assuming that the earlier acceptance covers the new revision. The following table records the important boundary instances, with locators in the named source versions. Each remaining target has its own checks in the packet and the per-target ledger below.

| Statement or convention | Instances and calculation | Result |
| --- | --- | --- |
| Coefficient category and support | Finite fields satisfy both compact and discrete conditions; discrete rational coefficients do not. A trivial F_p representation over Q with empty support misses ramification of its Cartier dual at p. | The reader retains m-adic coefficients, open stabilizers, and support containing p, infinity and all ramification. No arithmetic H¹ is replaced by unrestricted coinvariants. |
| Scalar quotient injections | Multiplication by p on a free Z/p² lattice gives the prescribed injection from its p-quotient; the analogous assertion for a nonfree residue module fails. | Freeness and the actual scalar quotient category remain in the targets. |
| Residual invariant vanishing | Over F_3², the matrices b=[[1,1],[0,1]] and a=diag(-1,1) have no common fixed vector, but quotient by e1 is trivial. | Only coefficient-ideal quotients and justified dual annihilators are used. MR04 Lemma 2.1.4, p.15; published MR16 Gomez erratum, p.182. |
| Signed core rank and canonical condition | A negative signed length difference has positive part zero. For Z_p(1) over Q_p, p odd, the inertia-kernel lattice condition is zero, while saturated universal norms have rank one. | MR16 signed rank and MR04 positive part stay distinct; MR16 Definition 5.1 and Theorem 5.4, pp.9–11 of the preprint, keep saturated universal norms. |
| Auxiliary conductor at 2 | A norm-seven prime can have different p-primary ray degree and norm-minus-one data at p=2. | The ray-class conductor ideal is not replaced by the norm-minus-one integer without its hypotheses. |
| LTXZZ saturation | A non-prime residue field has nontrivial Frobenius twists. A module shifted from O/λ^m to O/λ^(m−m′) changes its freeness and order. | The criterion uses Hom over F_l, equivalently all residue-Frobenius twists, and the shifted coefficient ring. Published Lemmas 2.3.3–2.3.5, pp.126–128. |
| Bounded abundant localization | Check the positive λ^(2c)M order after the shift, and both AC=λ^c I and CA=λ^c I. Let the reducibility-depth exponent vary independently of rank. | No rank-for-depth substitution or order computed in the unshifted ring. Published LTXZZ §§2.6.1–2.6.5, pp.132–135. |
| Euler-polynomial convention | Rank zero gives 1. Rank one with Frobenius q gives MR 1−qX and Rubin 1−X; rank two gives Rubin 1−aq⁻¹X+q⁻¹X². | Inverse norm scaling and arithmetic Frobenius conventions agree; f and the norm unit are supplied data. |
| Universal Euler module | Rubin IV Proposition 3.1, pp.59–60, supplies O-freeness and rank [K(r):K] over O[Gal(F(r)/K(r))]. | This does not assert freeness over the full Galois group ring; the relative group and O-freeness must both remain. |
| Cyclic derivative | For the trivial element D=0; order two gives D=σ and N=1+σ; order three gives D=σ+2σ². Expanding (σ−1)D gives n−N. | The norm is not interchangeable with D. The first two derivative controls are proved examples; the order-three boundary is a named target. |
| Generator change | The modular inverse is taken modulo orderOf σ. In the infinite-order convention orderOf σ=0, congruence modulo zero forces the natural product to be one. | The general generator-change signature does not acquire an unsupported finite-order assumption. |
| Corrected rank-one derivative | Empty correction determinant is 1, singleton is 0, and two-prime correction is −P01·P10. MR04 Appendix A, equation (33), p.81, cancels the finite local part and preserves the base class. | The strong corrected system, not just the raw derivative, is the rank-one comparison target. Two determinant examples are proved in Lean. |
| Cyclic graph sheaves | A one-vertex Z_p/p stalk has torsion sections. Over F_3[[x,y]], the section (x,x mod y) generates m times R/(y), but not m at the hub R. | E3/E5 scope repairs remain; no general complete-local-ring ideal or arbitrary-vertex propagation assertion. MR04 Proposition 3.4.4, p.27. |
| Finite-depth bound | Put M=(π^m), a₁=(π^a), a₂=Ann(a₁c)=(π^b), 0≤b≤m. Then ((M):a₂)a₁=(π^(m−b+a)). Zero c gives b=0 and no information at depth m; primitive c with a=0 gives b=m and annihilator 1. A compatible lattice class of divisibility s gives b=m−a−s and exponent 2a+s. | The corrected formula passes all three controls. This is an ideal-arithmetic check, not a proof or fresh book-source certification of the descent theorem. |
| MR04 finite primitivity | At κ₁=0, an unguarded finite lower bound fails for a nonprimitive multiple over Z/p². | Primitivity is required in both branches of Theorem 4.5.6, p.49. |
| Equality at infinity | Multiply a positive-order primitive generator by a uniformizer. Both initial classes are zero; infinite index still equals infinite dual length for the nonprimitive multiple. | Equality detects primitivity only with the finite initial-index guard. Published MR16 Theorems 8.7(ix), 13.4(ix), pp.167,175–176; E6 reconfirmed. |
| Howard versus weak Cassels | Howard H.0–H.5 include conjugate pairing and residual Q-action. The CGLS weak setup allows residual reducibility and α≡1 mod m while α≠1. | Strong Howard hypotheses are not silently imposed on the weak theorem; C₁, C₂, C_α and r remain separate. Howard pp.1446,1453–1455; CGLS pp.17–21. |
| Nekovář all-prime descent | Keep CM/quaternionic data, non-CM (*), Weil pairing and finite pairing modules. At β²=1 the exponent is 2C₀+2C₁+4C₂+4C₃+C₅+C₆+21 ord(2); at β²≠1 it is 4C₀+4C₁+7C₂+7C₃+5C₄+2C₅+2C₆+38 ord(2). | The displayed constants agree with §§7.5–7.6, pp.46–51. No odd-prime or residual-irreducibility shortcut is introduced. The geometric input is HE.1/HE.2, not the HE.7 consumer. |
| Bidual contractions and coefficient change | Rank zero excludes the positive-rank kernel contraction; torsion bidual comparisons require a non-zero-divisor. Free-ambient coefficient squares are a separate construction. | The ordered Stark transition and ambient-square hypotheses remain explicit. BSS II Proposition 2.4, pp.8–9. The obsolete acceptance cross-reference is corrected. |
| Normalized transfer | In Sano's notation inclusion after wedge norm is multiplication by N_H, not ordinary inclusion of invariant exterior biduals. | The exact equation i(N_H^∧r x)=N_Hx is retained. Lemmas 2.10–2.11 and Remark 2.12, pp.6–7. L6 remains the generic owner. |
| Higher ideals | Distinguish ordinary Kolyvagin I_i and Stark-transported primed I′_i. Test principal versus nonprincipal self-injective rings. | General-ring higher equality is stated for the transported ideals; ordinary higher equality retains the principal coefficient guard. BSS II Theorem 5.2 and Remark 5.3, pp.25–26. |
| Determinantal systems | Quotienting a determinant line is not multiplication by a group norm, which can vanish residually at degree p. Horizontal systems compare first with the full-S local condition. | VS, HS, the basic Euler map and the entire-system Bockstein square remain four separate targets, with the local dual-invariant obstruction and dual-lattice dictionary. Burns–Sano I pp.12–16,23–28. |
| Derivative surjectivity | The determinantal square gives surjectivity first at E, then at target fields. Check the non-self-dual p=3 case χ²≠ω separately. | All-system ideal equality is unconditional under the stated local hypotheses; only the specified Rubin–Stark class depends on Conjecture B′. BSS II Corollaries 6.17–6.18, Remark 6.19, pp.42–46, Theorem 7.1, pp.47–50. |
| Stark comparison and minus regulators | Sakamoto's isomorphism is checked on a cofinal free-core set, not every component. DK's finite-place CM-minus lattice is not the ordered archimedean regulator. | Distinct comparison domains and regulator contracts remain. Sakamoto Lemma 4.13/Proposition 4.14, pp.2313–2314; DK equations (8)–(10), pp.7–9. |

All six source findings are reconfirmed against their stated versions. E1 concerns BSS arXiv v1's trivializing field; E2 the public Rubin draft's ramification direction; E3 and E5 the archived MR04 general sheaf assertions; E4 is the published Gomez correction; E6 is the infinite-equality boundary already found by revision four. No new erratum-search claim is attached to this review. The earlier bounded searches remain historical records, not assertions that a correction cannot exist.

## Closure, suppliers and ownership

The 201-node reachable concrete graph is acyclic. Stage requests and explicit gaps are terminal contracts, not nonexistent implementations. The same-roadmap edges no longer point forward in the assigned layer order. The revision moved six hypothesis/example nodes to ES.1 and Rubin prime selection to ES.4, keeping their stable ids; it also replaced the direct HE.7 input by HE.1/HE.2. This removes the direct ES.4–HE.7 circular input. Coarse stage graphs elsewhere already have strongly connected components; this report does not claim the entire atlas stage graph is acyclic.

All 35 direct nonbaseline external references resolve to a concrete target or an exact supplier request. The sixteen incoming contracts were checked against all 36 distinct `suppliedBy` target ids and their actual statements: twelve met, one partly met, one routed to ES.8, two not planned. “Met” means that the requested target is planned with the stated hypotheses, not implemented. The Heegner normalization dictionary stays with HE; ES.8 owns the Λ-adic derivative; the inaccessible classical square-index theorem remains an explicit whole-roadmap gap; Beilinson–Flach classes need their arithmetic construction owner. I did not perform a fresh paper audit of the imported Zhang, Zanarella, BCGS, Castella–Hsieh or Keller–Yin results. Their older reading claims are preserved as older claims.

The sixteen outgoing contracts cover native ClassFieldTheory Layers 13/7/5, Chebotarev Layer 10, EllipticCurves Layers 2/7, Padic L5/L6, Selmer L2, Integral I7, HE.0/HE.1/HE.2, and ArithmeticGaloisDuality R02.4/R02.5/D7. Reading the supplier statements gives these boundaries:

- Open [AGD #858](https://github.com/TauCetiProject/TauCetiRoadmap/pull/858), head `567ff2b2099d724d7e75a37994ea44ba375f4a17`: R02.4.2 supplies finite local Tate perfectness and R02.5.1 finite Greenberg–Wiles; D7.3–D7.5 supply general complete-local derived duality and compact support under their finiteness/perfectness hypotheses. These do not automatically construct the requested general-R H¹ local-condition adapters. Archimedean/Tate support and the stated odd-prime scope are retained where applicable.
- Open [Selmer #869](https://github.com/TauCetiProject/TauCetiRoadmap/pull/869), head `691599e9863c501bbce9c0e3e3af6a61f7487613`: its O-linear dual into Φ/O requires the inverse-different/trace dictionary for Cartier duality. It does not discharge the general-R compact-coefficient request.
- ClassicalArithmeticCompletion §§7.21/7.49/7.56 supply maximal orders, trace-dual bounds and existence. Local heredity, the local division-algebra maximal order and its two-sided ideals remain a Part II request; Curtis–Reiner was not read.
- Padic §5.1 supplies determinant lines and §§6.4–6.7 generic compound/Fitting algebra. Exact self-injective biduals, normalized transfer, compatible-functional lifts and the generic admissible-complex comparison remain L6 Part II. ES owns the arithmetic theta/Bockstein and field-projection constructions.

Local current TauCetiRoadmap main `0d144d044dacebca17b654695b6f1ad58f159b27` and current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were inspected read-only, including the nine roadmaps newer than the atlas snapshot and the Completed directory. ProfiniteArithmetic and Chebotarev were read as nearby full roadmap models; relevant ClassFieldTheory and EllipticCurves sections were checked. Current `TauCeti.fittingIdeal` is consumed as post-pin work, not replanned. No new ownership move is needed.

ClassicalArithmeticCompletion and Padic were read from individual official files at remote roadmap main `79ff03ab775937a744719a0ebe494621f1f16d95`, since those directories were not in the supplied local main. No repository snapshot was downloaded. README fingerprints: ClassicalArithmeticCompletion `3cb5c2e7b7df382d1d6b336ef9b0a96d01fb50ca28df21e7fd017ea6414a4d33`; Padic `e6d4333167578933731d5a2542a702d15b8f16b05abfe38157e71d9a88aa7fcf`. Suggested-file fingerprints: `94dae85052ddf5f3b02eefc7a8071e1eadd221aec5d14d7dc7f1002e4a0e8a6d` and `8c6a9ed9f89f620dcb6d24e816c7f5b60294280b71bacc26893bb89b8e1f6901`, respectively.

## Source access and versions

The table below is this session's bounded reading record. Full SHA-256 values are in the packet's `review.sourceReadings` and the reader. Existing source records are historical unless explicitly included here. Every result is paraphrased with theorem/section/page locators; no source passage is reproduced.

| Source id | Passages independently inspected |
| --- | --- |
| `mr-ks` | MR04 author copy: §§1.1–1.2, pp.7–11; §2.1 and Lemma 2.1.4, pp.13–15; Proposition 3.4.4 and §3.5, pp.27–29; Theorems 4.5.6–4.5.8, pp.49–50; §§5.2.11–5.2.15, pp.57–60; Appendix A Proposition A.2, Theorem A.4 and equation (33), pp.79–81. No claim to Appendix B or Lambda-adic proofs. |
| `rubin-es` | Public 1999 draft: IV §§3–4, pp.59–64; IX §§1,3–4, pp.133–139, including the finite-depth statement and chi-ray alternatives. Original Kolyvagin article and book-format Rubin source were not read. |
| `mr-higher` | Preprint: Definitions 3.1 and Proposition 3.3, pp.7–8; §4 hypotheses, p.9; Definition 5.1, Lemma 5.2, Corollary 5.3 and Theorem 5.4 with its proof, pp.9–11. |
| `mr-higher-published` | Published: Theorems 8.7(ix) and 13.4(ix), pp.167,175–176; Gomez erratum, p.182. Extended-length equality and arbitrary-quotient boundaries checked separately. |
| `bss2` | Preprint: Proposition 2.4 and proof, pp.8–9; Hypothesis 4.7 and Remarks 4.8–4.9, p.22; Theorem 5.2 and Remark 5.3, pp.25–26; Theorem 6.12/Corollary 6.13, pp.41–42; Corollaries 6.17–6.18 with proof and Remark 6.19, pp.42–46; Theorem 7.1 and proof, pp.47–50. |
| `bs1` | Preprint: Definition 2.8 and Proposition 2.10 with proof, pp.12–13; Definitions 2.18–2.19 and Proposition 2.20, pp.15–16; Definition 3.2 and Theorem 3.3, pp.23–24; Theorem 3.11 and comparison proof, pp.26–28. The Bockstein-square use was also checked in BSS II Corollary 6.17. |
| `howard` | Published: H.0–H.5 in §1.3, p.1446; Theorem 1.6.1 and its proof, pp.1453–1455. No fresh reading claim for the Lambda-adic §2. |
| `cgls` | Preprint v2: §3.2 and Theorem 3.2.1, p.17; Lemma 3.3.1 and Proposition 3.3.2, pp.17–18; Proposition 3.3.6 with its proof, pp.19–21; Theorem 3.3.8 and initial rank-one argument, p.21. |
| `nekovar` | Author copy: §§3.1–3.5, pp.18–19; §5.19, pp.33–34; §§6.4.1–6.4.3, pp.38–40; Theorem 7.3 and §§7.4–7.6, pp.45–51, including the pairing losses and final annihilator constants. Curtis–Reiner was not read. |
| `sakamoto` | Published: §4.5, Lemma 4.13 and Proposition 4.14 with proof, pp.2313–2314. |
| `sano14` | Preprint: Lemmas 2.10–2.11 and Remark 2.12 with proofs, pp.6–7, for normalized transfer and its inclusion formula. |
| `dk` | Preprint v3: §1.2, equations (8)–(10), Conjecture 1.5 and Theorem 1.6, pp.7–9. |
| `ltxzz-published` | Maintainer-cleared published PDF read in place: Definition 2.3.2 and Lemmas 2.3.3–2.3.5, pp.126–128; Proposition 2.4.6, pp.129–131; §§2.6.1–2.6.5, pp.132–135. Checked residue-field linearity, reducibility depth and shifted-order localization. No source file or extracted text was copied. |

The maintainer-cleared published LTXZZ text was read in place without copying the file or retaining an extracted passage. The public Rubin SWC1999 draft was read. Rubin's published book is not cleared, the historical mirror was not accessed, and no other copy of that book was used. The inaccessible Kolyvagin article and Curtis–Reiner were not read. Consequently the inherited Rubin 9.3.3 correction and the missing maximal-order source input remain clearly marked limits. This review does not certify those books' wording or publisher pagination from a secondary description.

## Baseline statements inspected at the pins

Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. This table lists the actual declaration files read, separately from the current-library no-duplication check.

| Declaration | File at pin |
| --- | --- |
| `mathlib:Squarefree` | `Mathlib/Algebra/Squarefree/Basic.lean` |
| `mathlib:Module.length` | `Mathlib/RingTheory/Length.lean` |
| `mathlib:LinearMap.charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` |
| `mathlib:LinearMap.aeval_self_charpoly` | `Mathlib/LinearAlgebra/Charpoly/Basic.lean` |
| `mathlib:MonoidAlgebra` | `Mathlib/Algebra/MonoidAlgebra/Defs.lean` |
| `mathlib:Representation.norm` | `Mathlib/RepresentationTheory/Basic.lean` |
| `mathlib:SimpleGraph` | `Mathlib/Combinatorics/SimpleGraph/Basic.lean` |
| `mathlib:exteriorPower.pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Pairing.lean` |
| `mathlib:exteriorPower.bijective_pairingDual` | `Mathlib/LinearAlgebra/ExteriorPower/Basis.lean` |
| `mathlib:exteriorPower.map` | `Mathlib/LinearAlgebra/ExteriorPower/Basic.lean` |
| `mathlib:Module.Dual` | `Mathlib/LinearAlgebra/Dual/Defs.lean` |
| `mathlib:Module.IsReflexive` | `Mathlib/LinearAlgebra/Dual/Defs.lean` |
| `mathlib:Module.Injective` | `Mathlib/Algebra/Module/Injective.lean` |
| `tauceti:TauCeti.ContCohomology.explicitCor1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` |
| `tauceti:TauCeti.ContCohomology.explicitCor1_comp_res1` | `TauCeti/RepresentationTheory/Homological/ContCohomology/Corestriction.lean` |
| `tauceti:TauCeti.ContCohomology.DiscreteShortExact.explicitCor_delta0` | `TauCeti/RepresentationTheory/Homological/ContCohomology/DeltaNaturality.lean` |
| `tauceti:NumberField.Chebotarev.frobeniusPrimeSet` | `TauCeti/NumberTheory/Chebotarev/FrobeniusPrimeSet.lean` |
| `tauceti:NumberField.artinSymbol` | `TauCeti/NumberTheory/NumberField/ArtinSymbol.lean` |
| `tauceti:TauCeti.GlobalNumberFields.RayClassGroup` | `TauCeti/NumberTheory/NumberField/Global/RayClass/Basic.lean` |
| `mathlib:IsAdic` | `Mathlib/Topology/Algebra/Nonarchimedean/AdicTopology.lean` |
| `mathlib:IsAdicComplete` | `Mathlib/RingTheory/AdicCompletion/Basic.lean` |
| `mathlib:IsModuleTopology` | `Mathlib/Topology/Algebra/Module/ModuleTopology.lean` |
| `tauceti:TauCeti.IsSmoothDiscrete` | `TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete.lean` |
| `mathlib:Submodule.torsion` | `Mathlib/Algebra/Module/Torsion/Basic.lean` |
| `mathlib:cyclotomicCharacter` | `Mathlib/NumberTheory/Cyclotomic/CyclotomicCharacter.lean` |
| `tauceti:TauCeti.MonoidAlgebra.augmentation` | `TauCeti/Algebra/MonoidAlgebra/Exactness.lean` |

## Per-target verdicts

The stable node id can retain an older layer prefix; `parentStageId` and `realises` specify the current layer. “Verified” records the target-level statement, boundary checks and prerequisite assessment, with the bounded source-access qualifications above. It does not claim a completed proof or a fresh reading of every source used by an imported supplier.

| Target | Verdict | Independent assessment |
| --- | --- | --- |
| `ES.0/selmer-triple` | verified | Finite support retains p, infinity and ramification under every operation; the continuous Cartier dual exchanges the two coefficient categories. |
| `ES.0/quotient-category` | verified | Scalar quotient maps compose by multiplication; the p-map over Z/p² is injective for a free lattice and fails for its nonfree residue module. |
| `ES.0/cartesian-condition` | verified | The condition is an inverse-image square for injective maps, rather than just functorial images under quotients (MR04 Definition 1.1.4). |
| `ES.0/cartesian-length-linearity` | verified | MR04 Lemma 1.1.5 uses principal artinian coefficients and exact scalar quotient sequences; the signed length grows linearly. |
| `ES.0/quotient-dual-propagation` | verified | The dual map reverses images and inverse images under local orthogonality; its possible kernel is retained in the relaxed example. |
| `ES.0/selmer-torsion-identification` | verified | Only ideal quotients and dual annihilator modules enter the residual invariant argument. The Gomez arbitrary-Galois-quotient assertion is excluded. |
| `ES.0/selmer-length-difference` | verified | Finite Greenberg–Wiles input matches AGD R02.5.1; its archimedean terms do not replace the compact H¹ adapter contract. |
| `ES.0/core-rank` | verified | The signed MR16 difference and the MR04 positive part give different answers at negative rank; the tests preserve that distinction. |
| `ES.0/core-rank-independence-of-modulus` | verified | Length normalization uses the actual cartesian quotient category; it does not assert unrestricted coefficient base change. |
| `ES.0/canonical-selmer-structure` | verified | MR16 Definition 5.1 uses saturated universal norms at p. Z_p(1) separates that condition from the inertia kernel. |
| `ES.0/core-rank-formula` | verified | The p-adic integer-ring guard, archimedean ranks and dual invariant correction match MR16 Theorem 5.4. |
| `ES.1/ray-class-tower` | verified | The specialized p-ray conductor system imports class fields from native CFT Layer 13, without another reciprocity construction. |
| `ES.1/conductor-ideal` | verified | The p-primary ray degree is distinguished from norm-minus-one at 2; the norm-seven dyadic check detects conflation. |
| `ES.1/kolyvagin-primes` | verified | Prime membership requires the free rank-one Frobenius quotient and coefficient ideal; existence retains the allowed-prime containment. |
| `ES.0/hypotheses-mr2004` | verified | The full residual, tau, auxiliary cohomology, prime and cartesian package stays explicit; moving it to ES.1 removes the forward edge. |
| `ES.0/hypotheses-mr2016` | verified | The number-field auxiliary extension and allowed-prime condition are present. Residual invariants are used only at the justified quotient scope. |
| `ES.0/hypotheses-implications` | verified | The implication keeps its additional absolute irreducibility and auxiliary-field assumptions; Rubin’s p-Hilbert condition is not strengthened. |
| `ES.0/example-cyclotomic-twist` | verified | Trivial and cyclotomic exceptional characters are excluded, and lattice versus divisible dual invariants are distinguished. |
| `ES.0/example-elliptic` | verified | Large-image p≥5 coefficients support the MR04 example; ordinary canonical relaxation is not identified with every finite-level Kummer condition. |
| `ES.0/non-example-inadmissible` | verified | Exceptional characters and missing auxiliary-field cohomology fail the sufficient hypothesis package; failure is not a countertheorem to all bounds. |
| `ES.1/finite-singular-decomposition` | verified | Finite/adic unramified Frobenius evaluation has its coefficient scope. Discrete rational coefficients give zero H¹ and nonzero coinvariants. |
| `ES.1/transverse-condition` | verified | The kernel uses the chosen totally ramified tame extension, rather than the unramified extension; coefficient functoriality preserves that choice. |
| `ES.1/finite-singular-comparison` | verified | MR04 Definition 1.2.2 and Lemma 1.2.3 give Q(Fr⁻¹), with its rank-one and artinian guards. |
| `ES.1/modified-selmer-structures` | verified | Strict, relaxed and transverse modifications have disjoint conductor supports and preserve the mandatory global support. |
| `ES.1/transverse-duality` | verified | Orthogonal complements use the specified tame extension. Howard’s rank-two inert local comparison remains a separate dictionary. |
| `ES.1/chebotarev-nonvanishing` | verified | The finite bad-coset bound precedes Chebotarev; one cannot infer detection for an arbitrary prescribed subset of primes. |
| `ES.1/chebotarev-prescribed-kernels` | verified | The restriction-kernel and prescribed-evaluation inputs are retained, instead of assuming restriction injective without its hypotheses. |
| `ES.1/reducibility-depth` | verified | LTXZZ published Definition 2.3.2 and Lemmas 2.3.3–2.3.4 use the reducibility-depth exponent, not a module rank. |
| `ES.1/selmer-field-saturation` | verified | LTXZZ Lemma 2.3.5 is applied to F_l-linear homomorphisms, retaining all residue-Frobenius twists and the annihilator loss. |
| `ES.1/abundant-tuples` | verified | The selected tuple, pairing and gamma-normalized Frobenius data retain the published abundance and positive-loss hypotheses. |
| `ES.2/euler-polynomial` | verified | Characteristic-polynomial reversal and the inverse norm scaling agree in ranks zero, one and two; arithmetic Frobenius remains supplied data. |
| `ES.2/euler-system-module` | verified | Corestriction inserts precisely the newly ramified Euler factors. Arithmetic class constructions belong to their separate owners. |
| `ES.2/classes-unramified-outside-p` | verified | The universal-norm argument needs the tower decomposition hypothesis; it does not assert cocycle-level unramifiedness without it. |
| `ES.2/conductor-presentation` | verified | The field/conductor dictionaries preserve omitted Euler factors and cofinal restriction; the empty conductor gives the base field. |
| `ES.2/twisting` | verified | Character lines and field changes include the norm/Euler correction when conductors cancel; inverse twisting is not unconditionally strict. |
| `ES.2/euler-factor-change` | verified | The polynomial variable and Frobenius convention are transported with the changed factor, as required by the norm relation. |
| `ES.2/universal-euler-system` | verified | Rubin IV Proposition 3.1 gives O-freeness and the relative group-ring rank [K(r):K]; this is not whole-group-ring freeness. |
| `ES.2/rigidity-variants` | verified | The chi-ray setup keeps every alternative and excludes a completely split infinite direction from the simple anticyclotomic example. |
| `ES.3/derivative-operators` | verified | The cyclic identity (sigma−1)D=n−N, generator change and intrinsic tensor factors retain the source normalization; two small checks are proved in Lean. |
| `ES.3/derivative-invariance` | verified | Telescoping vanishes after the conductor-ideal coefficient reduction; no integral invariant lift is assumed. |
| `ES.3/lifting-to-induced-module` | verified | The connecting construction keeps invariant obstructions, lift ambiguity and the bounded-error alternative. |
| `ES.3/derivative-class` | verified | The invariant norm lift is used with its actual coefficient and corestriction maps; ambiguity is recorded rather than declared canonical. |
| `ES.3/derivative-local-properties` | verified | Local finite conditions and the finite–singular edge relation have distinct inputs, including the whole-packet local-lift targets. |
| `ES.3/congruence` | verified | Rubin IV Corollary 8.1 is the replacement source. The inaccessible original Kolyvagin article remains an explicit limitation. |
| `ES.3/kolyvagin-system-module` | verified | The module imposes local Selmer membership and edge relations with the intrinsic tame tensor; it is not the unrestricted product. |
| `ES.3/finite-part-formula` | verified | MR04 Appendix A Proposition A.2 and Theorem A.4 supply the finite-part calculation; raw invariance alone is insufficient. |
| `ES.3/euler-to-kolyvagin` | verified | Appendix A equation (33) cancels finite local components and preserves the bottom class, including the finite-level limiting branch. |
| `ES.3/two-prime-test` | verified | The transposition contributes the negative cross term; singleton and empty specializations detect omission of the correction. |
| `ES.3/anticyclotomic-derivative` | verified | Relative chi-ray factors and conjugation conventions are retained; HE owns the geometric ring-class specialization. |
| `ES.4/selmer-sheaf` | verified | Actual vertex and edge maps are specified. The cyclic-hub and principal-artinian scopes exclude the unrestricted hub-ideal counterexample. |
| `ES.4/sheaf-monodromy` | verified | Path evaluation needs the hub-generation scope; the two-variable-ring counterexample prevents unrestricted valuation propagation. |
| `ES.4/vertex-step` | verified | The local-condition exact sequence controls the length/type change; error-tolerant use retains the local defects. |
| `ES.4/core-vertices` | verified | Residual dual vanishing and expected free rank define core vertices; their existence uses admissibility and prime selection. |
| `ES.4/leading-vertices` | verified | Leading vertices and their surjective paths are distinguished from the stronger core-vertex condition. |
| `ES.4/stub-sheaf` | verified | Length powers and surjective arithmetic paths stay in the cyclic principal-artinian scope required for stub rigidity. |
| `ES.4/kolyvagin-bound` | verified | A nonzero initial class is required for the finite bound. Primitive sharpness is distinct from the general inequality. |
| `ES.4/rubin-hypotheses` | verified | Irreducibility of V and the two distinct exclusions on T and its Tate twist remain in the error-group finiteness input. |
| `ES.1/rubin-prime-selection` | verified | The node now sits in ES.4 after derivative classes and Rubin hypotheses; its uniform error annihilators remain explicit. |
| `ES.4/rubin-bound` | verified | The strict-at-p bound retains ind(c), n_W and n_W* separately; the rational consequence needs its separate Hyp(K,V). |
| `ES.4/variant-bounds` | corrected | Complementary ideal gives exponents m−b+a and 2a+s under bounded divisibility. Book-format attribution is qualified and independent collation is a gap. |
| `ES.4/abundant-localization` | verified | The inverse matrix is scaled by lambda^c, with AC=CA=lambda^c I; lambda^(2c)M is the shifted-module order, not a fixed base-field order. |
| `ES.4/howard-descent-with-errors` | verified | CGLS Theorem 3.2.1 and Proposition 3.3.6 retain alpha≠1, residual triviality and the three separate error constants; clean Howard hypotheses are not inserted. |
| `ES.5/divisibility-invariants` | verified | Zero has infinite DVR index and truncated artinian index. Scaling shifts finite indices and detects the difference from primitivity. |
| `ES.5/rank-one-module-theorem` | verified | Core rank one and the full admissibility package give a free rank-one system module, without asserting every nonzero system primitive. |
| `ES.5/structure-theorem` | verified | MR04 Theorem 4.5.6 requires primitivity in both the zero and nonzero initial-component branches; finite and infinite profiles are distinguished. |
| `ES.5/kolyvagin-dual-selmer` | verified | The constructed dual Selmer limit uses the prescribed local orthogonals and the actual comparison map, rather than an arbitrary abstract dual. |
| `ES.5/sharpness-examples` | verified | A uniformizer multiple is nonprimitive and changes the finite bound; the examples keep Tamagawa and dual-invariant hypotheses. |
| `ES.5/howard-hypotheses` | verified | H.0–H.5 include the conjugate self-dual pairing and residual action over Q; they are stronger than the weak Cassels inputs. |
| `ES.5/cassels-structure` | verified | The finite alternating pairing gives paired torsion factors, with radical and sign changes controlled at the actual coefficient level. |
| `ES.5/howard-stub` | verified | The self-dual stub uses the length of one paired torsion factor; it is not the MR04 nonsymmetric stub transplanted unchanged. |
| `ES.5/howard-dvr-theorem` | verified | Howard Theorem 1.6.1 gives rank one and the doubled finite module with a length bound from a nonzero bottom class. |
| `ES.6/exterior-bidual` | verified | Generic bidual algebra stays with L6; the arithmetic specialization retains the non-zero-divisor guard in the torsion comparison. |
| `ES.6/bidual-functoriality` | corrected | Kernel contractions require r≥1 and ordered local components; replaced the obsolete reference to nonexistent part (c) by the actual contraction assertion. |
| `ES.6/stark-systems` | verified | Transitions use ordered contractions and orientation lines; the rank-zero, empty-conductor and composition tests distinguish the limit. |
| `ES.6/stark-structure` | verified | Free rank-one structure and the Fitting equalities keep the stated coefficient hypotheses; equality of infinite initial indices does not detect primitivity. |
| `ES.6/bss-hypotheses` | verified | Finite and integral hypotheses are separate; the corrected tau field avoids acting trivially on the entire representation, and p=3 is separately guarded. |
| `ES.6/kolyvagin-systems-rank-r` | verified | Finite–singular tensor relations use bidual components of the proper rank; no exterior-power replacement is assumed for torsion modules. |
| `ES.6/regulator-isomorphism` | verified | BSS Theorem 5.2 distinguishes ordinary Kolyvagin ideals from primed Stark-transported ideals; their equality needs the principal coefficient case. |
| `ES.6/rubin-lattice` | verified | DK equations (8)–(10) define the finite-place lattice; this does not supply the ordered archimedean Rubin–Stark regulator. |
| `ES.7/higher-rank-euler-systems` | verified | Rank r≥1 bidual-valued systems preserve arithmetic norm factors and use the requested generic coefficient maps. |
| `ES.7/higher-kolyvagin-derivative` | verified | BSS Theorem 6.12 requires Frobenius injectivity 6.11; the full correction uses the unsplit Galois group and r≥1. |
| `ES.7/fitting-bounds` | verified | Theorem 5.2 gives higher ordinary-ideal equality over principal rings; transported Stark ideals carry the general-ring equality. |
| `ES.7/vertical-determinantal-systems` | verified | Burns–Sano Proposition 2.10 lifts bases through augmentation kernels using Nakayama; determinant reduction is not multiplication by the norm. |
| `ES.7/horizontal-determinantal-systems` | verified | The full-S Stark comparison retains its local dual-invariant obstruction; canonical and full conditions are not assumed equal before the comparison. |
| `ES.7/basic-euler-systems` | verified | The dual-lattice dictionary and admissible-complex map feed the arithmetic theta construction and the entire-system Bockstein square. |
| `ES.7/derivative-surjectivity` | verified | BSS Corollary 6.17 proves surjectivity via the determinantal square, first at E and then by target-field projection; no Rubin–Stark conjecture is used. |
| `ES.7/rubin-brumer-stark` | verified | DK’s finite-place CM minus statement remains separate from the archimedean higher-rank class-group application. |
| `ES.7/rank-one-comparison` | verified | The comparison targets the corrected strong MR system with its transposition sign, rather than only the raw derivative. |
| `ES.4/weak-cassels-structure` | verified | CGLS Lemma 3.3.1 and Proposition 3.3.2 allow residual reducibility and residually trivial alpha while keeping residual-invariant vanishing. |
| `ES.4/nekovar-all-prime-descent` | verified | The CM/non-CM realization, Weil pairing and finite pairing modules are retained; source §§7.5–7.6 give the displayed 21 and 38 dyadic losses. |
| `ES.6/stark-comparison` | verified | Sakamoto Lemma 4.13 and Proposition 4.14 compare the cofinal free-core systems; the map is not asserted an isomorphism at every component. |
| `ES.7/rubin-stark-class-group` | verified | BSS Theorem 7.1 separates unconditional all-system equality from the conjectural named Rubin–Stark element, including non-self-dual p=3. |
| `ES.7/rubin-stark-minus-comparison` | verified | The CM finite-place and ordered archimedean regulators have distinct hypotheses and owners; neither is silently substituted for the other. |

## Validation and remaining work

The 282-line suggested file elaborated through `lean-check` at the pinned shared build with exit 0, exactly 22 declaration-uses-sorry warnings, and zero other warnings or errors. It contains four proved examples, no admitted examples and no admitted data definitions. Its retained objects use existing carriers. Arithmetic Selmer, Euler/Stark modules, geometric all-prime descent and the corresponding theorems remain fully specified reader targets; they are not replaced by weakened encodings in Lean.

Final checks:

- `python3 scripts/check_blueprint.py research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json`: zero errors and zero warnings.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean`: passes.
- Source-finding schema and source-version validation through `source_issues.check_issues` and `check_errata.versions_checked`: passes. The standalone errata CLI is for errata-v1 files, not blueprint-v1 packets.
- `python3 research/blueprint/intake.py check-files` on the five deliverables: zero problems.
- Mechanical agreement of 3,339 node fields between packet and reader, the sixteen boundary-theorem names, the 201-node reachable graph and `git diff --check`: pass.

Remaining work is precisely the six recorded gaps and sixteen supplier contracts. The source-access gaps must not be rephrased as completed reading. No stage can be marked closed until its supplier and proof obligations are met.

An integration note outside this job's edit scope: the whole-roadmap assembly still imports the older 89-node part inventory, whereas this part has 93 nodes. Its imported-node list and the package associated with PR #11051 need the four ES.7 determinantal/surjectivity targets propagated through their own work. This review changes neither artifact and makes no package-review verdict. See the [handoff](../handoff/REV-EulerSystemsAndKolyvaginSystems--ES.0~5.md) for exact continuation items.
