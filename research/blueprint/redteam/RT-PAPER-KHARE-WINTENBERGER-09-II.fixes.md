# RT-PAPER-KHARE-WINTENBERGER-09-II: fixes

Fixer: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #5028, job FIX-RT-PAPER-KHARE-WINTENBERGER-09-II).

- **Findings:** `RT-PAPER-KHARE-WINTENBERGER-09-II.result.json`.
- **Verdicts:** `RT-PAPER-KHARE-WINTENBERGER-09-II.review.json` and `reviews/REV-RT-PAPER-KHARE-WINTENBERGER-09-II.md`. All sixteen findings are confirmed: ten medium (/1–/10) and six low (/11–/16).
- **What this job fixes:** the ten medium findings. Where the verifier's reason differs from the red team's fix text, I followed the reason. The low findings are recorded below and not applied (PROTOCOL §17); the verifier coupled none of them to a medium finding.
- **Disclosure.**
  - This session (`cc-f805bf`) wrote the red team RT-PAPER-KHARE-WINTENBERGER-09-II (PR #4746).
  - It also wrote the fix of the companion paper, FIX-RT-PAPER-KHARE-WINTENBERGER-09-I (PR #5172). That fix changed the ClassicalSerreModularity--R27.3 packet: the R27.6 node for Theorem 10.1 now states part (i) only, and the R27.4 strong-form node imports Edixhoven's theorem and the untwisting. It also added KW I items 72 and 73.
  - I did not write this extraction, its review or the verification.
  - This fix stays within the scope that the independent verifier (`cc-58621d`) authorised, and uses its corrected fixes.
  - The two fixes touch at one point, Theorem 4.1 of KW I (see /9 and "For the maintainer"). Nothing here changes R27.x, the KW09-I routes or the R27.3 packet.
- **Files changed. Only the deliverables:**
  - `papers/PAPER-KHARE-WINTENBERGER-09-II.result.json`;
  - `papers/PAPER-KHARE-WINTENBERGER-09-II.md`: counts, the route list, E33, and a closing "Fixes" section;
  - this report.

  No packet is a deliverable. Every change a finding asks of a packet is listed under "For the maintainer".
- **Result.** 343 items (7 library, 306 planned, 30 missing), 9 routes, 33 source issues.
  - The old route 8 (InverseGalois IG.4) and route 10 (GL2ModularityLifting R22.1/R22.4) are dropped.
  - The old routes 9 and 11 become routes 8 and 9.
  - Route 4 keeps its roadmap, ArithmeticGaloisDuality, but now serves R02.2/R02.4.
  - All eleven routes were accepted by the extraction's review, so the positional verdicts in `PAPER-KHARE-WINTENBERGER-09-II.review.json` still accept every route. That review is a dated record and is left unchanged.
- **The source.** I re-fetched the authors' copy `proofs.pdf` from Khare's UCLA page. Its SHA-256, `53f45f8b…c86ed4`, matches the recorded hash. I read the passages each fix turns on:
  - pp. 9 and 17: Matsumura 28.M, 24.B and 33.B;
  - pp. 23–26: §3.2.2–§3.2.5, the weight-two types, §3.2.3's extension claim, Savitt's ring, and Kummer theory over F^nr;
  - p. 39: (Ad⁰)* ≅ Ad/Z, "need not be so when p = 2";
  - p. 55: the p = 2 local points, "as for p ≠ 2";
  - pp. 69–77: Lemma 7.10, §8.1, Lemma 8.1, the Remark after Theorem 8.2, Lemma 8.3 and Khare's Lemma 2.2, the lifting data (A)–(C), and the proof of Theorem 8.4 with Kisin's 3.1.11 and 3.5.3;
  - p. 92: the Remark of §10.2.

  Kisin's Annals paper was not re-read. The statement of his Corollary 3.1.11 follows the verifier's quotation from Annals 170 (2009), p. 1151.

## /1 (medium, error): two dependency cycles through R20.6: fixed

I followed the verifier's version.

- **Item 273** (Kisin's Corollary 3.1.11 and Lemma 3.5.3) moves to SerreWeightAndLevelOptimisation R20.6 (route 9), with Theorem 8.4, the theorem it proves.
- **Item 254** (the character ψ of §8.1) moves to GlobalGaloisDeformations R04.6 (route 6).
  - R04.6/kw-deformation-data already takes "ψ as in KW II §8.1" by reference.
  - R04.6 precedes GL2ModularityLifting R22.1 and R24.1, and R04.6 → R20.6 closes no cycle.
  - Of the verifier's two options, this one puts the definition at the most upstream of its consumers (§15).
- **Item 252** (Lemma 7.10) goes with /2's owner, ArithmeticGaloisDuality R02.2/R02.4 (route 4). Its note names Theorem 8.2 (p. 73) as the consumer.
- **Item 209** (Khare's Lemma 2.2) joins Taylor's neatness lemma (/272) at HilbertModularVarietiesAndShimuraCurves R18.3 (route 8).
  - Its locator adds "§8.2, proof of Theorem 8.2 (via Lemma 8.3), p. 73".
  - Its note says that this use concerns only the weight-(p + 1) variant, which the Remark on p. 71 says the paper does not use.
- **Route 10 is dropped**, since nothing remains on it.
- **Reasons rewritten:** routes 7 (R23.3/R23.5/R24.1, now /192 and /312), 8 (R18.3) and 9 (R20.6). Route 9 names the supplier of every input of Theorems 8.2 and 8.4.
- **Cycle test.** I ran it read-only on three graphs:
  - (A) the atlas that `scripts/build.py` assembles in memory (`assemble()`: snapshot, promoted blueprints, decompositions, data/links and restructurings);
  - (B) (A) plus every link file in `research/blueprint/links/`;
  - (C) (B) plus every packet prerequisite in `research/blueprint/packets/`, each read as an edge from the prerequisite's stage to the node's stage.

  Results:
  - The old edges R22.1 → R20.6 and R22.4 → R20.6 close cycles in (A) and (B).
  - (A) and (B) are acyclic. Every edge this fix implies is acyclic in both, individually and together: R04.6, R02.2, R02.4, R18.3, R18.4 and R18.6 → R20.6; R02.2, R02.4, R18.3 and R23.2 → R23.3; R02.2 and R02.4 → R04.4; and the edges listed under /3, /6, /7, /9 and /10.
  - (C) already has 30 cyclic strongly connected components (the largest have 129 and 91 stages). Every new edge either closes no cycle there or joins two stages that are already in one component. The one exception is under /9, and I avoided it. With that edge left out, the new edges merge no components in (C).

## /2 (medium, duplicate): Grunwald–Wang has two owners: fixed in the extraction; the owner choice goes to the maintainer

- **Item 210** moves from InverseGalois IG.4 to ArithmeticGaloisDuality R02.2/R02.4 (route 4). The note cites the three accepted extractions that route the same theorem there: PAPER-BOXER-CALEGARI-GEE-ETAL-25/84, PAPER-BOXER-CALEGARI-GEE-PILLONI-21/189 and PAPER-ALLEN-ETAL-23/328.
- **Its locator** adds "§7.6.3, proof of Lemma 7.10, p. 69".
- **Item 252** goes to the same place (/1). Following the verifier, its note says only that BCGP-21/189 is the same kind of argument with the same Grunwald–Wang input, since the local conditions differ.
- **Route 8 (IG.4) is dropped.** Route 4's reason is rewritten, since its former item /98 moves under /10.
- **The owner choice.** The InverseGalois packet's coverage, PAPER-HARPAZ-WITTENBERG-23/130 and GlobalGaloisDeformations:R04.4/change-of-determinant still place Grunwald–Wang at IG.4. Choosing the single owner is for the maintainer; the note says so.

## /3 (medium, error): KW's presentations at p = 2: fixed (notes); the node requests go to the maintainer

- **Items 143, 150, 151 and 153** stay planned at GlobalGaloisDeformations R04.3, as the verifier directed: R04.3's text plans KW II §4, "particularly Proposition 4.5 and Corollary 4.7".
- **Their notes** now say that the cited R04.3 nodes are stated for p > 2, with ad⁰ρ̄(1) and framing at finite places only. For p = 2 they cite DeformationAndDerivedPatchingAlgebra:R03.2/presentation-relations-and-dual-selmer-bound. That node has δ₂ and treats all p. The notes also record the dual (Ad⁰)* ≅ Ad/Z (p. 39) and the framed infinite places.
- **Item 144** (Lemma 4.4(2)) is now planned at its owner, R04.3, instead of at its consumers R04.4 and R04.5. Its note says that no node states it and names the consumers: R04.4/determinant-fixed-on-S, and R04.5/dyadic-taylor-wiles-primes for Lemma 5.10(e).
- **Cycle test.** R03.2 → R04.3 and R04.3 → R04.5 are acyclic in (A)–(C). R04.3 → R04.4 is acyclic in (A) and (B) and already inside one component in (C).

## /4 (medium, missing): the p = 2 local points of Taylor's moduli problem: fixed

- **New item 341** (p. 55): for p = 2, X has points over ℚ₂ and over the ℚ_{p_i}, "as for p ≠ 2".
- **Its status** follows the verifier: that of the parallel real-point step /193, planned at PotentialModularityAndCompatibleSystems R23.2 and HilbertModularVarietiesAndShimuraCurves H6. R23.2 plans "every prescribed finite local point", and H6 plans "finite local open loci".
- **Its note** records two things.
  - KW give no argument.
  - Every node that states Taylor's local points assumes an odd residual characteristic: R23.2/taylor-auxiliary-data-p-L-psi-N-M ("l an odd prime"), R23.2/taylor-lemmas-1-3-1-4-local-points-at-p-and-at-infinity ("for l, p odd") and R23.2/taylor-2006-lemmas-4-4-4-5-descent-and-the-cm-point ("l > 2"). The R23.3 KW node has no step for these points.
- **Items 185, 186 and 204:** their notes say that their p = 2 cases depend on /341.
- **Not done: a source issue for the p. 55 sentence.** The verifier allowed it but did not require it, and I have not shown that the odd-characteristic argument fails at 2.
- **Cycle test.** R23.2 precedes R23.3 on the atlas.

## /5 (medium, error): Savitt's ring when k(ρ̄_p) = 2: fixed

- **Items 92 and 93** gain the hypothesis 3 ≤ k(ρ̄_p) ≤ p. Their notes say that for k(ρ̄_p) = 2 the ring is the formally smooth ring of §3.2.3 (/91): 𝒪[[T]] unframed, and 𝒪[[T₁, …, T₄]] framed.
- **New source issue E33:** kind error, locator §3.2.4, p. 24, affects nothing, known "new". Its `searched` records the Crossref updates filter (30 September 2026, none) and a search of every atlas `sourceIssues` list for §3.2.4 and Savitt. The only hit, LocalGaloisDeformationRings/E1, concerns Savitt's own Theorem 6.12(4).
- **The mathematics, checked.**
  - Irreducible ρ̄_p has k(ρ̄_p) ≤ p for odd p. KW's type (ω_p^{k−2} ⊕ 1, 0) has i = k − 2 and j = 0. So Savitt's condition i ≢ j mod p − 1 (as R08.4/savitt-weight-two-rings states it) holds exactly when 3 ≤ k ≤ p.
  - At k = 2 the type is trivial with N = 0, so the lifts are crystalline of weight 2. The case occurs: ρ̄_p|I_p ≅ ω₂ ⊕ ω₂^p has weight 1 + p·0 + 1 = 2.
  - The special fibres 𝔽[[T]] and 𝔽[[T₁, T₂]]/(T₁T₂) differ: the second is not a domain.
  - Both rings are flat domains of relative dimension 1 with regular generic fibre, so Theorem 3.1 holds either way.
- **The report** lists E33 under "Errors and gaps that affect nothing".
- **Not done here:** restricting R08.6/export-weight-two-irreducible. That goes to the maintainer.

## /6 (medium, error): §3.2.3 at k = p and p = 2: fixed (note); the node's inputs go to the maintainer

- **Item 91** stays planned at R08.6 and L7. The verifier found that R08.6/export-fontaine-laffaille-irreducible does state k = p and p = 2.
- **Its note** is rewritten.
  - L7 has Fil^{l−1} = 0, so weights in [0, p − 2]. It covers k ≤ p − 1 for odd p only.
  - k = p goes through FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.3/fl-full-faithfulness on MF′. Irreducibility keeps every deformation in MF′.
  - p = 2 goes through R07.4 and the 2-adic rings of R08.5. R07.3's safe interval at p = 2 is [0, 0].
  - The paper only asserts the extension (p. 24, quoted).
- **Cycle test.** R07.3 → R08.6 and R07.4 → R08.6 are acyclic in (A)–(C). R08.5 precedes R08.6 on the atlas.

## /7 (medium, error): four statuses and Lemma 3.5: fixed

- **Item 32** (Proposition 2.2(ii)) is now missing and joins route 1, for R03.1. R08.6/export-completed-tensor-product and R04.6/kw-deformation-data consume it; R03.1 plans only when completed tensor products "remain Noetherian and local".
- **Item 60** (excellence and equidimensionality) is now missing and joins route 1, for R03.3. R03.3 only asks to "State hypotheses on catenarity and excellence".
- **Item 291** stays planned at R22.3 and R22.6, as the verifier directed.
  - The packet's review (#4823, merged before this fix) has already corrected R22.6/dyadic-patched-ring. Its first step now reads: "its determinant-one quotient D″_m, a surjection D″_m ↠ D_m with kernel contained in 𝔪_{D″_m}^m … Do not identify D_m with D″_m at finite level".
  - The note says this and records that the red team read the earlier text. The maintainer point on that step is therefore resolved.
- **Item 310** takes E29's corrected map γ̄ : R̄^{ψ_F}_F → R̄^ψ_{ℚ,S}/(p), as §18 requires. Its statement gives the construction and quotes the printed integral maps as printed.
  - It stays planned at R24.1, whose layer plans the restriction argument.
  - R04.4 is no longer listed: R04.4/restriction-ring-map gives the integral map only under a local-containment hypothesis that fails here.
- **Items 83, 85 and 86** (Lemma 3.5(i) first part, (ii) and (iii)) now have one status and one owner, as the verifier directed: all three are planned at PadicHodgeTheory R06.4, with R08.6 named as their consumer.
  - /85 moves from missing to planned.
  - /83 and /86 move from R08.6 (and R26.4) to R06.4.
  - Route 3 takes all three, as a source route for the unramified case, and its reason is rewritten. R06.4's own node, two-dimensional-ordinarity-criterion, is for ℚ_p only.
- **Cycle test.** R03.1 → R08.6 and R03.3 → R04.4 and R04.6 are acyclic in (A)–(C). R06.4 → R08.6 is acyclic in (A) and (B) (new, as the verifier said) and already inside one component in (C).

## /8 (medium, error): Kisin's Corollary 3.1.11: fixed

Item 273's statement now gives:

- **The corollary's hypotheses:** a non-Eisenstein 𝔪; S_{σ,ψ}(U, 𝒪)_𝔪 ≠ 0; the level-raising congruence (T_λ² − (N(λ) + 1)²ψ(λ)) S ⊂ 𝔪S; and Kisin's §3.1 set-up, with the neat level U(r₀) that KW use on p. 77.
- **Its conclusion:** S_{σ,ψ}(U′, 𝒪)_𝔪 / i(S_{σ,ψ}(U, 𝒪)²_𝔪) is non-zero and free.
- **The Ihara input**, kept separate: Kisin's (3.1.8), which for KW is Lemma 7.1 (/222).
- **Where the congruence comes from,** which KW leave implicit.
  - ρ̄_F is unramified away from p (Lemma 8.1), and the lifting data at v_{i+1} are (γ_vχ_p ∗; 0 γ_v).
  - So ρ̄(Frob_w) has eigenvalues γ̄N(w) and γ̄, with γ̄² = ψ̄(w) because det ρ̄ = ψ̄χ̄_p.
  - Then T_w² ≡ ψ̄(w)(N(w) + 1)². I checked this computation.
  - The statement restricts this to v_{i+1} not above p. For the places above p in case (C), KW's own assertion stands.
- **Lemma 3.5.3's tower** was already in the item, as the verifier noted. It now also says that the places split at step j.

The note records whose reading of Kisin was used.

## /9 (medium, error): Theorem 4.1(2) needs more than Theorem 9.7: fixed for /314

- **Item 313 is unchanged.** The verifier found it correct: Theorem 9.7 gives 4.1(1).
- **Item 314's note** splits the coverage by case, using the extraction's own items:
  - k ≤ p − 1: /316;
  - k = p, and weight-two lifts of type (B) or (C) up to twist: Theorem 9.7, through R22.5/kw-odd-prime-lifting and R24.4;
  - k = p + 1 ordinary: /318, at R22.5/ordinary-overlap and R21.4;
  - k = p + 1 non-ordinary, including k(ρ̄) = 2: /317, at R21.5/blz-reduction-theorem with R32.2 standing in for Kisin [38];
  - potentially Barsotti–Tate: /319, at R22.5/kisin-potentially-bt-lifting (3);
  - potentially semistable but not potentially crystalline: reduced to /318 by a finite-order twist.
- **Its planned list** adds R21.4 and R21.5 to R24.4 and R22.5. These precede R24.4 on the atlas.
- **R32.2 is not listed.** It is unrelated to R24.4 on (A) and (B). But in (C), R24.4 already reaches R32.2 (R24.4 → ClassicalSerreModularity R26.6 → R27.1 → R33.3 → R32.2), so R32.2 → R24.4 would close a new cycle there. The note says the k = p + 1 non-ordinary case rests on /317. This agrees with the verifier's advice that the classical proof's use of R32.2 wait for R32.6's audit.
- **Consistency with the KW09-I fix.** KW I's item 21 (the same Theorem 4.1(2)) was not changed by FIX-RT-PAPER-KHARE-WINTENBERGER-09-I, and it is not a deliverable here. Aligning it is a maintainer note.

## /10 (medium, library-claim): /34, /98 and /340: fixed

- **Item 34 is split.**
  - /34 is now the flat-local descent (Matsumura 33.B, with 24.B), still missing on route 1. Layer 4D plans descent only along the finite faithfully flat covers of KM's Notes Added in Proof.
  - The completion half is the new item 342 (Matsumura 28.M, p. 9). It is planned at tauceti:TauCetiRoadmap/ModularCurves#4d-regularity-of-a-moduli-problem and DeformationAndDerivedPatchingAlgebra R03.3, as in PAPER-BOCKLE-IYENGAR-PASKUNAS-23/052.
- **Item 98 is split.**
  - The μ_n Kummer isomorphism for any field with n invertible, applied to K = F^{nr} with G_K = I_v, is the new item 343. It is planned at tauceti:TauCetiRoadmap/ProfiniteCohomology#layer-9-the-galois-interface-hilbert-90-and-kummer-theory.
  - /343 cites `tauceti:TauCeti.kummerMap` (TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:187) and `tauceti:TauCeti.ker_kummerMap` (:260), read at f790474 and present in the declaration index. Only surjectivity (Hilbert 90) is absent, as that file says.
  - /98 keeps the KW-specific remainder: the B-module coefficients, the m_B-adic completion, the D_v/I_v-equivariance and F^{nr×} ≅ ℤ × U. It stays missing and moves from route 4 (R02.5) to route 2 (LocalGaloisDeformationRings R08.4/R08.6), beside Lemma 3.8. R02.5's text says "the deformation-specific calculations are owned by R08".
- **Item 340's note** cites `Polynomial.isRegularRing_of_isRegularRing` and `MvPolynomial.isRegularRing_of_isRegularRing` (Mathlib/RingTheory/RegularLocalRing/Polynomial.lean:78, :108; read at 082e2d3). It says that the power-series case and the descent are absent, so the status stands.
- **Cycle test.** ModularCurves 4D → R03.3 and ProfiniteCohomology layer 9 → R08.6 are acyclic in (A)–(C).

## /11 (low, duplicate): not applied

The finding: /31 and /36 go to R03.4 here, while PAPER-BOCKLE-IYENGAR-PASKUNAS-23/031–032 send the same facts to R03.1/R03.3.

This is a low finding, recorded only. The fix, confirmed by the verifier: choose one stage and cross-reference BIP-23/031–032 in /31 and /36.

## /12 (low, other): not applied

The finding: /141 (H¹(SL₂(𝔽_{2^r}), M₂(𝔽)) = 0) fits ArithmeticGaloisDuality R02.6 better than R01.4.

This is a low finding, recorded only. The verifier adds that GlobalGaloisDeformations already requests the statement from R01.4, so the route and that request must move together (maintainer).

## /13 (low, missing): not applied

The finding: there are no definition items for Serre's weight k(ρ̄), k(ρ̄_v) or local newvector theory.

This is a low finding, recorded only. The verifier's adjusted fix:

- a definition item that states KW's convention for F_v ≠ ℚ_p and cites R15.4 for the ℚ_p case;
- a newvector item planned at R16.2.

## /14 (low, error): not applied

The finding: E17's `known` field names the wrong entry, and E8's correction fails at p = 2.

This is a low finding, recorded only. The verifier's adjusted fix:

- E17's known becomes "new: no published correction found; not recorded elsewhere in the atlas (PotentialModularityAndCompatibleSystems/E2 in the --R23.1 packet is the related misreference, E28 here)";
- E8's correction and reason are restricted to odd p.

## /15 (low, error): not applied

The finding: at p = 2 the R19.4 and R19.6 nodes assume compact levels, which KW's §7 does not.

This is a low finding, recorded only. The verifier's adjusted fix:

- /221's note gives the reduction to the maximal compact subgroup U⁰;
- /223's note says its p = 2 case is not planned as the node is written.

## /16 (low, error): not applied

The finding: the notes of /129 and /317 misstate the atlas.

This is a low finding, recorded only. The verifier's fix:

- /129 says the variable-determinant case of Proposition 4.1 has no node;
- /317 cites AlgebraicModularFormsAndSerreWeights:R15.3/hasse-invariant-as-a-form-of-weight-p-minus-one, and says that only the weight-raising combination is unplanned.

## For the maintainer

These are packet changes the fix job cannot make, since it may edit only the extraction.

- **Grunwald–Wang (/2):**
  - one owner, with the InverseGalois packet's coverage, PAPER-HARPAZ-WITTENBERG-23/130 and GlobalGaloisDeformations:R04.4/change-of-determinant's hypothesis brought into line;
  - that hypothesis also names GL2ModularityLifting as the consumer of Lemma 7.10, but the consumer is Theorem 8.2 at R20.6 (/1).
- **GL2ModularityLifting--R22.1 (/1, /8).** The packet's open request to R20.6 names Kisin's (3.1.6), (3.5.2) and (3.5.3). With /273 at R20.6, it should also name Corollary 3.1.11, with the level-raising congruence.
- **GlobalGaloisDeformations R04.3 (/3):**
  - p = 2 versions of relative-tangent-space, local-to-global-presentation and global-dimension-lower-bound, with δ₂, the dual Ad/Z, framed infinite places and g = h¹_{L^⊥}(S, (Ad⁰)*(1)) + |S| − 1;
  - a node for Lemma 4.4(2);
  - the packet's coverage line "all planned (8 nodes)" overstates p = 2.
- **PotentialModularityAndCompatibleSystems R23.2 (/4):** residual-characteristic-2 versions of Taylor's Lemmas 1.2–1.3 and of the matching of level structures.
- **LocalGaloisDeformationRings R08.6 (/5, /6):**
  - restrict export-weight-two-irreducible to 3 ≤ k(ρ̄_p) ≤ p, with k(ρ̄_p) = 2 sent to export-fontaine-laffaille-irreducible;
  - give export-fontaine-laffaille-irreducible its k = p input (R07.3/fl-full-faithfulness on MF′) and its p = 2 inputs (R07.4, R08.5).
- **PotentialModularityAndCompatibleSystems R24.1 (/7):** kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring should use E29's γ̄ in place of the integral β, α and γ.
- **PadicHodgeTheory R06.4 (/7):** a node for Lemma 3.5 over unramified F. two-dimensional-ordinarity-criterion covers ℚ_p only.
- **PotentialModularityAndCompatibleSystems R24.4 (/9):**
  - kw-theorem-4-1 should list R22.5/kisin-potentially-bt-lifting, R22.5/ordinary-overlap with R21.4, and R21.5/blz-reduction-theorem among its prerequisites;
  - any use of R32.2 should wait for R32.6's audit, and it would close the packet-level cycle R24.4 → R26.6 → R27.1 → R33.3 → R32.2 → R24.4;
  - KW I's item 21 (PAPER-KHARE-WINTENBERGER-09-I) is the same theorem and should get the same split.
- **Already resolved:** the verifier's point on R22.6/dyadic-patched-ring step 1. The packet review #4823 made that correction.
- **From the low findings (verifier):**
  - R19.4 and R19.6 should allow KW's §7 levels, and R19.4 should add E19's hypothesis (/15);
  - the owner of H¹(SL₂(𝔽_{2^r}), M₂(𝔽)) = 0 is R01.4 or R02.6, and the GlobalGaloisDeformations request should be re-pointed if it is R02.6 (/12);
  - PotentialModularityAndCompatibleSystems/E2 and /E3 are each used in two packet files, --R23.1 and --R24.3 (/14).
- **Packet-prerequisite cycles.** Read as stage edges, the packet prerequisites already form 30 cyclic components, the largest with 129 stages. The atlas and its links are acyclic. This predates the fix.
- **Dated records left as they are:**
  - the extraction's review (`PAPER-KHARE-WINTENBERGER-09-II.review.json`), whose route verdicts describe the old eleven routes;
  - the review verdicts inside the source issues.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KHARE-WINTENBERGER-09-II.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: no problems.
- **Formatting and edits.** The JSON file keeps its formatting: indent 1, non-ASCII characters written literally. It was re-serialised identically before editing. A single script applied every edit, and asserted that each replaced text occurred exactly once in its field and that each whole-value replacement matched the old value. The report was edited by a second script under the same assertion.
- **No new library declaration is cited** besides `TauCeti.kummerMap`, `TauCeti.ker_kummerMap` and the two Mathlib instances, all read at the pins.
- No Lean was run.
