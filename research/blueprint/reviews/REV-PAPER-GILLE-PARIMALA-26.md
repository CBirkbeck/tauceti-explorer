# REV-PAPER-GILLE-PARIMALA-26

**Verdict: revise. Independent review complete; extraction partial.**

Complete independent review by Codex codex-hjdg0j of work by codex-c83e7a, codex-a71f92 and Claude Code cc-442dc5. Extraction restored to partial, all 152 IDs preserved: 7 library, 8 planned, 137 missing. Four parent interfaces corrected; 42 uses/API/test records added (84 theorem clauses,126 planning tests); locators 89 and 148 corrected; all 19 inherited source findings confirmed with scoped reasons and E20–E22 added. Six explicit gaps remain. No Lean file requested or compiled; nothing is claimed formalised.

## Sources and access

- Codex codex-hjdg0j, 23 September 2026: all 26 HAL v5 manuscript pages plus references; page images checked for the analytic, closure, patching and appendix issues. Cached public PDF hash matched the recorded author hash; current HAL access returned a challenge.
- Published Appendices A and B read on the publisher HTML; final main text remains paywalled.
- CTS79 original GDZ scan, printed pp. 109–110 and 127–130, read as page images; Prasad 1982 pp. 197–202 read in full.
- HHKP20 v3 read in full, especially printed pp. 6–8 for Lemma 2.4 and Theorem 2.5. Gille current errata GP entry read directly. Earlier extraction source reads are retained as their authors’ provenance, not attributed to this reviewer.
- Gille 2024 published pp. 159–165, §§1–4.3, including Lemma 3 and Theorems 4,6; page images checked for E21–E22. This is a targeted prerequisite read, not an audit of every proof in that paper.

Public primary sources: [HAL v5](https://hal.science/hal-03938963v5), [published appendices](https://link.springer.com/article/10.1007/s00222-026-01403-x), [author errata](https://math.univ-lyon1.fr/~gille/prenotes/errata.pdf), [CTS79 scan](https://gdz.sub.uni-goettingen.de/download/pdf/PPN235181684_0244/LOG_0024.pdf), [HHKP20 v3](https://arxiv.org/abs/1903.08007v3), [Prasad 1982](https://www.numdam.org/article/BSMF_1982__110__197_0.pdf), [Gille 2024](https://comptes-rendus.academie-sciences.fr/mathematique/articles/10.5802/crmath.545/). Hashes and exact read scopes are recorded in the result. No author was contacted.

## Corrections and closure

The input called itself complete while its prerequisite ledger explicitly required individual source acquisition and hypothesis checks before a complete extraction. Six named gaps now state those obligations. This does not allege that the main local-global theorems are false.

Items 5,7,12,124 now import upstream ReductiveGroups Layers 6–9: minimal-parabolic type, relative parabolic representability, form/diagram torsors and central-isogeny flag comparison. These were removed from the proposed continuation’s construction list. Layer 8’s relative theory and Layer 9’s pinned classification are planned interfaces, not implemented proofs. The new continuation retains the paper-specific R-equivalence, patching and loop applications.

Item 148 now cites Corollary 4.6(1), the model-point theorem needed after HHKP Theorem 2.5, instead of the reductive-model Corollary 4.7. Item 89’s CTS locator is corrected to pp. 128–129. E17’s correction distinguishes adding codimension-zero points from the alternative integral-surface restriction. E19 uses the actual stage maximal ideals and residue-field colimit.

All 42 definitions/constructions now give named consuming items, two quantified planning theorem clauses and three concrete planning tests. API names are planning labels, not invented existing Lean declarations. The general carrier and broad theorem statements remain in their existing owners. No claim of a complete item dependency DAG is made.

- **review-gap-RG**: Remaining relative structure and flag-product source proofs. Read SGA3 XXVI and MPW at the exact cited results, CGP Appendix A.5.2 and Demazure–Gabriel III.3.2.1; reconcile general imports with their precise type/semilocal hypotheses.
- **review-gap-EQ**: Elementary/R-equivalence and Lie-span suppliers. Finish Petrov–Stavrova and Gille–Stavrova inputs and Raghunathan Lemma 3.1. Preserve existing targeted reads; complete their proof-level dependency outline and exact exports.
- **review-gap-PATCH**: Field-intersection, finite-model map and completed-patch spreading. Read HH10 Theorem 5.9/Lemma 6.2 and HHK15 Proposition 5.8 directly; the GP26 and HHKP20 quotations do not establish these source proof interiors.
- **review-gap-SURFACE**: Surface and local-group suppliers. Read Lipman 1969 Theorem 26.2 separately from 1978 resolution; GP1 Corollary 1.8 and finite-flat linear quotient construction need direct source checks. Keep the parent local-ring/regularity carriers.
- **review-gap-OPTIONAL**: Optional closure-factorization sources. Prasad was checked directly; read Tits normal-subgroup theorem and Harder Hauptlemma before closing the repaired Proposition 3.11 branch. It is not an input to Theorem 3.13.
- **review-gap-CLOSURE**: Uniform prerequisite graph and complete supplier hypothesis audit. Complete a theorem-level acyclic dependency graph after those source reads. The current literal APIs and tests repair interface omissions but do not assert full closure.

## Library and route audit

Read all seven library contracts at the pins and verified all seven files byte-for-byte against GitHub at those commits. Read all eight final planned-owner contracts. Searched both full library trees and the atlas for all 141 originally missing items; the result records a per-item search pattern, candidate counts and substantive scope conclusion. Broad name hits were not treated as implementation evidence. Reviewed AUDIT-01, AUDIT-09, AUDIT-17 and the upstream ReductiveGroups and ModularCurves descent/regularity stages.

| Route | Verdict | Reason |
| --- | --- | --- |
| 1 | accept | Accept the vector-scheme convention and CTS79 Hartogs/coherence/reflexivity chain as SF.0 sources; reuse Module.IsReflexive and import the R03.3 freeness corollary. |
| 2 | reject | Reject this atomic route pending direct source verification of torsor gluing (152) and finite-flat group linear quotients (153). The corrected purity proof itself was checked against CTS79 and is retained; do not discard that completed part. |
| 3 | accept | Accept the specific affine additive-torsor acyclicity input in SF.2; no new cohomology carrier is proposed. |
| 4 | reject | Reject pending the distinct Lipman 1969 and 1978 inputs and their precise model/limit proofs. The owner direction is appropriate, and existing Model/local-ring carriers must be imported. |
| 5 | accept | Accept affine finite-locally-free Weil restriction and smooth/etale comparisons in RG2.0a. Keep inseparable restriction separate from reductivity preservation. |
| 6 | accept | Accept the generalized valued-point topology, etale chart and rank-one henselian point-descent interfaces in RG2.0. Preserve local compactness only for the original local-field hypotheses. |
| 7 | accept | Accept the normal integral generic-point fundamental-group surjection as IG.0 source material, using its finite-etale Galois-category interface. |
| 8 | accept | Accept the SNC coordinate-parameter Abhyankar interface in IG.1. The extraction excludes the invalid arbitrary-regular-sequence and prime-to-p-degree shortcuts now registered as E21–E22. |
| 9 | accept | Accept the dimension≤2 finite-reflexive-module freeness corollary in R03.3, imported by SF.0. The zero module is included and no arithmetic coefficient-ring restriction is introduced. |
| 10 | reject | Reject until the six named source/closure gaps are completed. Retain the exact final theorem and corrected Tits order, import the four general upstream interfaces removed here, and keep optional Proposition 3.11 off the main chain. Forty-two literal interfaces do not replace a complete theorem dependency graph. |

## Source findings

All nineteen inherited findings are confirmed at the version-specific locators, with the detailed reasons below. E10 and E16 are already covered by the author’s errata; E18 corrects the erratum’s proposed witness. No assertion is made that an unlocated correction does not exist. The GP26 main text was read in HAL v5, not falsely attributed to the inaccessible final PDF.

### E1 — confirmed

Lemma 2.3 proof, printed p. 7, HAL v5 (26 December 2025); same in arXiv v3, written J_j = I^j/I^(j+1) = I A_j

Checked HAL p. 7: m A_j is not the successive kernel for j≥2. In k[e]/e^3, (e)^2≠0; m^2/m^3 is square-zero. The last tower step is j=n.

Correction: m_j = m^j/m^(j+1), the kernel of A_j → A_(j−1); delete '= m A_j'. The relation A_j/m_j = A_(j−1) holds for j = 1, …, n.

### E2 — confirmed

Lemma 3.2(3), printed p. 8, HAL v5 (26 December 2025); arXiv v3 prints the same inequality

Checked HAL p. 8 image. Absolute values are nonnegative on every vector, so the printed inequality selects all V[1/t]; the integral lattice is the unit ball.

Correction: V = {v ∈ V[1/t] | |v| ≤ 1}.

### E3 — confirmed

Proposition 3.3(ii), printed p. 9, HAL v5 (26 December 2025); same in arXiv v3

Checked HAL p. 9. The second partial derivative has b-dimensional domain and must act on W[1/t]^b. With V=R0, W=0 and f(v,w)=w, the printed V/V condition holds but the restricted map is constant.

Correction: Df^b_0 : (F0)^b → (F0)^c, and Df^a_0(V[1/t]^a) + Df^b_0(W[1/t]^b) = (F0)^c.

### E4 — confirmed

proof of Claim 3.4, printed p. 9, HAL v5 (26 December 2025); same in arXiv v3

Checked HAL p. 9 and the pinned strict-derivative theorem. A fixed error bound is not little-o; the constant must be arbitrary and the neighbourhood may depend on it. The inclusion used here is continuous linear, which supplies its strict derivative.

Correction: Strict differentiability: for every β > 0 there is a neighbourhood Θ_β of (0, 0) on which the inequality holds.

### E5 — confirmed

Proposition 3.6, printed p. 10, and its proof, p. 12, HAL v5 (26 December 2025)

Checked HAL pp. 10,12–13. The openness conclusion belongs in the ambient point group; the second factor comes from the W-input and lies in G(F2)^+.

Correction: G(F0)^+ is an open subgroup of G(F0); in the proof, b′♯(w) ∈ G(F2)^+. The same b′♯(v)/b′♯(w) slip recurs in the proof of Proposition 3.9(1), p. 13.

### E6 — confirmed

proof of Proposition 3.9(1)–(2), printed p. 13, HAL v5 (26 December 2025)

Checked HAL p. 13. A product of subgroups need not be a subgroup, and a dense open subset need not be the whole group. The displayed neighbourhood together with the translate argument in the correction proves the actual factorization without that inference.

Correction: The proof of (1) shows only what (1) states: RG(F1) RG(F2) contains an open neighbourhood N of 1. For (2): given g ∈ RG(F0), the set gN^(-1) ∩ RG(F0) is a nonempty open subset of RG(F0), so by density it contains some a ∈ RG(F1); then g ∈ aN ⊂ RG(F1) RG(F2). Also, 'f(0, x) = f(x, 0)' in the proof should read f(0, x) = f(x, 0) = x, which Corollary 3.5 needs.

### E7 — confirmed

proof of Claim 3.12, printed p. 14, HAL v5 (26 December 2025)

Checked HAL p. 14 image, retaining all closure bars. Factoring the n-th power map yields n-th powers in the R-subgroup, not the whole torus. Density is in the F0-points. Conjugacy, rather than abstract isomorphism alone, gives unbounded projections to the specified factors; Harder remains a named supplier gap.

Correction: 'of G is rational'; T♯_F0 is G(F0)-conjugate to T; (T♯(F1))^n ⊂ RT♯(F1); E♯(F1) is dense in E♯(F0); T♯(F0)^n ⊂ closure of RT♯(F1); and p_i(closure of RT♯(F1)) is unbounded in G_i(F0).

### E8 — confirmed

proof of Proposition 3.11(2), printed p. 15, HAL v5 (26 December 2025)

Checked HAL pp. 14–15 images and Prasad Theorem (T), pp. 197–201. Onto projections do not imply normality (diagonal S3 is a counterexample). The open intersections with factors give the correct normal subgroups. The terminal invocation needs Proposition 3.9(2). The independent Tits supplier proof is explicitly still a gap.

Correction: Let H be the closure of RG(F1), an open subgroup by (1) with p_i(H) = G_i(F0)^+. Then H ∩ G_i(F0)^+ is normalized by H, hence by p_i(H) = G_i(F0)^+, and is open, so it is not central; by Tits' theorem it is G_i(F0)^+. So H = G(F0)^+. The last step should cite Proposition 3.9(2): RG(F1) is dense in RG(F0) = G(F0)^+.

### E9 — confirmed

proof of Theorem 3.13, printed p. 15, HAL v5 (26 December 2025); same in arXiv v3

Checked HAL p. 15 image: x1=h1 h2 x2 implies h1^(-1)x1=h2 x2; the second inverse is incorrect.

Correction: h1^(-1).x1 = h2.x2.

### E10 — confirmed

Example 4.1(b), printed p. 16, HAL v5 (26 December 2025) (published Example 5.1(b)); same in arXiv v3

Checked HAL p. 16 and the current author errata. Fraction-field formation does not commute with this completion. The factorial-pole coefficient argument proves the strict inclusion; this mistake is already acknowledged by the author.

Correction: Frac(k[x][[t]]) is a proper subfield of k(x)((t)).

### E11 — confirmed

proof of Lemma 4.3, printed p. 17, HAL v5 (26 December 2025)

Checked HAL p. 17 image. The open-patch localized polynomial ring uses x, whereas x^(-1) belongs to the point-patch power-series ring. The integral intersection is dense in R0, not in all F0.

Correction: u, v ∈ T[x], u maps to zero in k[x], u = t u♯ with u♯ ∈ T[x]; and in (2), F1 ∩ R̂0 is dense in R̂0.

### E12 — confirmed

Remark 4.4, printed p. 17, HAL v5 (26 December 2025)

Checked HAL p. 17 image. The first displayed summand has only nonpositive x-powers and belongs to Rhat_P; the second has polynomial coefficients in x and belongs to Rhat_U.

Correction: f1 belongs to R̂_P = k[[x^(-1), t]] and f2 belongs to R̂_U = k[x][[t]].

### E13 — confirmed

Theorem 4.5(2) and its proof, printed p. 18; Corollaries 4.6(2), p. 18, 4.7(2) and 4.8(2), p. 19; HAL v5 (26 December 2025); the same wording is in arXiv v3

Checked HAL pp. 18–19 and the type convention in §1.1. A type has a rational parabolic precisely when it contains the anisotropic subset. Consequently the global subset is the star-stable closure of the union of local subsets; both the statement and its printed proof reverse this order.

Correction: ∆0(G) is the smallest ⋆-stable subset of ∆(G_Fs) containing ∆0(G_FU) for each U ∈ U and ∆0(G_FP) for each P ∈ P (after the fixed identifications); likewise in Corollaries 4.6(2)–4.8(2). In the proof: Θ contains each local ∆0, so Par_Θ has local points; hence ∆0(G) ⊂ Θ; and ∆0(G) contains each local ∆0, so Θ ⊂ ∆0(G).

### E14 — confirmed

proof of Corollary 4.7(1), printed p. 19, HAL v5 (26 December 2025)

Checked HAL p. 19. Properness extends a generic section over a regular curve using its DVR local rings; a component of a merely normal surface fibre can be singular. Passing first to an SNC model supplies the required regular components. This is a proof gap, not a counterexample to the corollary.

Correction: First replace the normal model by a regular model with strict-normal-crossing special fibre (Lipman's resolution; the reductive model and its flag scheme pull back). Its components are regular curves, and the valuative criterion then gives Z_k(D) = Z_k(k(D)). Corollary 4.6 is applied to the new model.

### E15 — confirmed

proof of Proposition 5.2, printed p. 21, HAL v5 (26 December 2025) (published Proposition 6.2)

Checked HAL p. 21. The finite Weyl/diagram quotient is the normalizer modulo T0. The quotient of the full positive-dimensional group by its torus is generally not finite.

Correction: N/T0, where N is the normalizer of T0 in Aut_I(G0), in both places.

### E16 — confirmed

proof of Proposition 5.2, printed p. 21, HAL v5 (26 December 2025) (published Proposition 6.2)

Checked HAL p. 21 and the current author errata. The local loop argument requires the completed local ring. The comparison of the two valuation completions uses their complete DVRs, common uniformizer and residue field, via successive approximation.

Correction: Take A = R̂_P, the completion of R_P. The Grothendieck-valuation completion of Frac(R_P) equals that of Frac(A): the first embeds in the second, and they share a uniformizer and the residue field k(P)(u).

### E17 — confirmed

Theorem 7.1, printed p. 23, HAL v5 (26 December 2025); published Theorem B.1 has the same wording (read on the publisher's page by codex-a71f92, 22 September 2026)

Checked HAL p. 23, published Theorem B.1 in the publisher HTML, and CTS79 Theorem 6.13 on printed pp. 128–129. The disjoint-union counterexample is valid: PGL2 torsors on the omitted real point include the distinct split and Hamilton forms. Adding codimension-zero points is a correction; retaining the original integral-surface hypothesis is an alternative restriction, not an equivalent condition.

Correction: Require U to contain every point of codimension at most one. Alternatively retain CTS79’s hypothesis that X is an integral regular surface; this is a narrower sufficient hypothesis, not an equivalent condition on X.

### E18 — confirmed

Gille, 'Errata et compléments', 26 May 2026, p. 1, entry for this paper, Example 5.1(b)

Checked the current errata PDF p. 1 directly. The proposed geometric series equals t/(x−t), already in Frac(k[x][[t]]). Factorial pole growth gives a valid witness instead; the author erratum fixes the equality but its witness is wrong.

Correction: The witness lies in the fraction field; use Σ_(n≥1) t^n/x^(n!) instead.

### E19 — confirmed

Harbater–Hartmann–Karemaker–Pop, arXiv 1903.08007v3, proof of Lemma 2.4, p. 7 (cited by GP26 for Corollary 4.8)

Checked HHKP v3 Lemma 2.4 on printed pp. 6–7. Each local henselization retains k(P_i), whereas the limit residue field is their colimit. Blow up the real origin on P1_R[[t]], choose a degree-two point on the exceptional P1_R and continue with rational points over C: k(P0)=R and the subsequent residue fields are C. Also m of the union cannot be treated as an ideal of an earlier stage. Use the stage maximal ideals and filtered colimits.

Correction: Write m_i for the maximal ideal of O_(X_i,P_i). Its henselization has maximal ideal m_i O^h_(X_i,P_i) and residue field k(P_i). The local filtered colimit has maximal ideal colim_i m_i O^h_(X_i,P_i) and residue field colim_i k(P_i)=O/m; this proves the required residue-field comparison.

### E20 — confirmed

HAL v5, proof of Theorem 4.5(1), printed p. 18 (PDF p. 19); compare Lemma 4.3 on printed p. 17. Final main-text numbering not independently available.

Checked the assignment on the page image and the earlier completeness hypothesis. The factorial-pole argument above proves failure of completeness in the exact projective-line setup. The extraction already warned against the replacement in item 69; this records the omitted source finding.

Correction: Retain V=Rhat_P and W=Rhat_U from Lemma 4.3. These are the complete T-modules needed by §3. The larger intersections F_i∩R0 need not be complete, even for the projective-line diamond.

### E21 — confirmed

Gille, Loop group schemes and Abhyankar’s lemma (2024), proof of Lemma 3(2), printed p. 163; input to GP26 Proposition 5.2.

Checked the published page image and the indicated elementary counterexample. The extraction uses the corrected version; this finding concerns the cited 2024 source, not an additional claim in the GP26 text.

Correction: Use the torsor structure to prove tameness: trivialize the finite etale group over an unramified base cover, then each connected component of its torsor is a Galois cover with group a subgroup of the constant prime-to-p group. Its inertia has prime-to-p order. Descend tameness and apply the universal tame cover. Also read the component decomposition as a disjoint union, not a fibre product.

### E22 — confirmed

Gille, Loop group schemes and Abhyankar’s lemma (2024), §2.1, printed p. 160; input to GP26 Proposition 5.2.

Checked the published page image and the indicated elementary counterexample. The extraction uses the corrected version; this finding concerns the cited 2024 source, not an additional claim in the GP26 text.

Correction: Require the f_i to be coordinate parameters defining an SNC divisor. For the exceptional-divisor valuation and the stated r−1-dimensional residue field later, use a full regular system of parameters as in the French introduction, or enlarge the inverted divisor first.

## New counterexample details

E20: Take T=k[[t]], u=x^(-1), F1=Frac(k[[u,t]]) and R0=k((u))[[t]]. The finite sums s_N=sum_(n=1)^N t^n u^(-n!) lie in F1∩R0 and form a t-adic Cauchy sequence. Its R0-limit s is not in F1: otherwise b s=a with nonzero a,b∈k[[u,t]]. Divide their common lowest t-power so b_0(u)≠0 and put d=ord_u b_0. In the t^n coefficient of b s, b_0 u^(-n!) has order d−n!, while every other term b_j u^(-(n−j)!) has order at least −(n−1)!. For n!−d>(n−1)!, the unique lowest-order term cannot cancel, contrary to a having no negative u-powers. Thus F1∩R0 is not complete. The correction uses exactly the complete modules already proved in Lemma 4.3 and leaves the theorem intact.

E21: Prime-to-p degree alone does not imply tameness of a connected cover. In characteristic 2 take A=F2[[s,t]], U=Spec A[1/(st)], and the monic cubic X^3+sX+t. It is irreducible over Frac(A): a monic factorization over the integrally closed A would specialize at s=0 to a factorization of the Eisenstein polynomial X^3+t. Its discriminant is t^2, so it defines a connected finite etale cover of U of degree 3. At the t-divisor the quadratic residue factor X^2+s gives a purely inseparable residue extension of F2((s)), so the cover is not tame. The missing justification is supplied by the finite-group torsor hypothesis, as already outlined in item 99; the lemma itself survives.

E22: A regular sequence does not force an SNC divisor: in Q[[x,y]], the single nonzero divisor f=y^2−x^3 is a regular sequence, but its zero locus is a singular cusp. The maximal ideal of Q[[x,y]]/(f) has two-dimensional cotangent space and the ring has dimension one, so its support is not a regular branch. Items 87,96,98 already impose the corrected coordinate condition; this records the source error.

## Validation

Paper checker passes; intake: five files, zero problems. Structural checks preserve all 152 IDs, verify 7/8/137 status counts and all supplier stages, route each of the 137 missing items once, and check 42 uses/API/test interfaces, all ten route verdicts, all 22 source-finding verdicts and six gap references. Seven library files match exact pinned GitHub bytes; source hashes match. The exact five-file archive diff and unchanged inputs on refreshed main pass. Finite diagnostics check the erratum series identity, 257 factorial-pole thresholds, the diagonal-S3 counterexample, the characteristic-two cubic resultant and 512 Tits-type subset comparisons; these supplement the written arguments, not replace them.

No Lean deliverable is requested for this paper-review job; no Lean file was produced or compiled. The tests above are mathematical planning examples, not a report of Lean elaboration.

## Item audit

The JSON `itemReview` supplies all 152 row-level verdicts, exact locators and source-gap links. The following inventory preserves every input ID; missing 37 and 76 were absent before this review.

| Item | Name | Status | Locator |
| --- | --- | --- | --- |
| 1 | Semiglobal field and characteristic exponent | missing | Introduction, pp. 1–2; §4 |
| 2 | Reductive group scheme | planned | §1.2 |
| 3 | Simply connected semisimple field group | library | §1.1; §3.2 |
| 4 | Parabolic type convention | planned | §1.1 |
| 5 | Anisotropic subset of the Tits index | planned | §1.1; correction needed in §4 |
| 6 | Twisted flag variety with its group action | missing | §1.1 |
| 7 | Representability and smooth properness of parabolic schemes | planned | §1.1; §1.3, SGA3 XXVI.3 |
| 8 | Dual conventions for vector schemes | missing | §1.1(c) |
| 9 | R-equivalence over a ring | missing | §1.1(d) |
| 10 | Normal subgroup of R-trivial points | missing | §1.1(d) |
| 11 | Proper and strictly proper parabolics | missing | §1.2 |
| 12 | Automorphism and diagram torsors | planned | §1.3 |
| 13 | Generic fundamental group surjection for normal bases | missing | §1.3, Stacks Tag 0BQM |
| 14 | Reduction of the form torsor to the type stabilizer | missing | §1.3, Lemma 1.1 proof |
| 15 | Extension of a twisted flag along a reductive model | missing | Lemma 1.1 |
| 16 | Elementary subgroup attached to an opposite pair | missing | §2 |
| 17 | Independence and normality of the elementary subgroup | missing | §2, Petrov–Stavrova Theorem 1 |
| 18 | Semilocal elementary-parabolic decomposition | missing | Lemma 2.1 |
| 19 | Henselian invariance of the elementary quotient | missing | Lemma 2.2; Gille–Stavrova Proposition 7.7 |
| 20 | Finite algebra as a product of local Artin algebras | missing | §2 before Lemma 2.3 |
| 21 | Affine Weil restriction | planned | §2; §3.2 |
| 22 | Smooth connected restriction over finite algebras | missing | §2 before Lemma 2.3 |
| 23 | R-equivalence and restriction of scalars | missing | Lemma 2.3(1), first comparison |
| 24 | R-equivalence insensitive to the Artin nilpotents | missing | Lemma 2.3(1), second comparison |
| 25 | Square-zero devissage of finite local algebras | missing | Lemma 2.3 proof |
| 26 | Vector-kernel torsors preserve R-classes in the nilpotent tower | missing | Lemma 2.3 proof |
| 27 | Elementary subgroup equals R-trivial subgroup over fields | missing | Lemma 2.3(2), Gille Kneser–Tits survey Theorem 7.2 |
| 28 | Elementary subgroup equals R-trivial subgroup over finite algebras | missing | Lemma 2.3(2) |
| 29 | Weil topology on points over a valued field | missing | §3.1 |
| 30 | Complete module data for local analytic factorization | missing | §3.1, (3.1)–(3.2) |
| 31 | Closedness of the complete saturated module | missing | Lemma 3.2(1) |
| 32 | Norm on localized module elements | missing | Lemma 3.2(2) |
| 33 | Module as the integral ball in its localization | missing | Lemma 3.2(3), corrected inequality |
| 34 | Localized modules are Banach subspaces | missing | Lemma 3.2(4) |
| 35 | Analytic functions have a strict derivative | library | Claim 3.4 analytic input |
| 36 | Strict submersion maps a neighbourhood filter onto a neighbourhood filter | library | Proposition 3.3, Banach submersion input |
| 38 | Corrected local analytic surjectivity | missing | Proposition 3.3, explicit correction; Claim 3.4 |
| 39 | Analytic multiplication-type factorization near zero | missing | Corollary 3.5 |
| 40 | Field data for group factorization | missing | §3.2 |
| 41 | Product-compatible last unipotent subgroup | missing | Proposition 3.6 proof; GPS Lemma 3.1 |
| 42 | Conjugates of the last unipotent Lie algebra span | missing | Proposition 3.6; GPS Lemma 3.3(3) |
| 43 | Etale coordinates with values in the elementary subgroup | missing | Proposition 3.6 proof |
| 44 | Elementary subgroup is open in the ambient group | missing | Proposition 3.6, openness conclusion |
| 45 | Elementary factorization over the diamond | missing | Proposition 3.6, factorization conclusion |
| 46 | Central covers induce surjections on elementary subgroups | missing | Proposition 3.6, Step 2 |
| 47 | Quasi-trivial torus covering a maximal torus | missing | Proposition 3.9 proof |
| 48 | Conjugated maximal-torus Lie algebras span | missing | Proposition 3.9 proof, Raghunathan Lemma 3.1 |
| 49 | R-trivial subgroup is open | missing | Proposition 3.9(1), first assertion |
| 50 | Two R-trivial patch subgroups contain a neighbourhood | missing | Proposition 3.9(1), second assertion |
| 51 | R-factorization under density of R-points | missing | Proposition 3.9(2) |
| 52 | One isotropic patch gives mixed elementary/R factorization | missing | Proposition 3.9(3) |
| 53 | Two isotropic patches give elementary factorization | missing | Proposition 3.9(4) |
| 54 | Closure of the first R-subgroup is open | missing | Proposition 3.11(1) |
| 55 | Optional closure factorization theorem | missing | Proposition 3.11(2) |
| 56 | Unbounded projections of the closure subgroup | missing | Claim 3.12 |
| 57 | Open subdirect product repair in the optional theorem | missing | Proposition 3.11 proof repair |
| 58 | Weil restriction of a projective flag | missing | Theorem 3.13 |
| 59 | Semilocal transitivity on same-type parabolics | missing | Theorem 3.13 proof; SGA3 XXVI.5.5; Lemma 2.1 |
| 60 | Reduction to absolutely simple groups and flag products | missing | Theorem 3.13 proof, MPW2 §2 |
| 61 | Descent of an equal pair of field-valued points | missing | Theorem 3.13 proof |
| 62 | Flag local-global principle for the analytic diamond | missing | Theorem 3.13 |
| 63 | Existing DVR model carrier | library | §4, foundational model carrier |
| 64 | Normal projective curve model | missing | §4.1 |
| 65 | Completed local patch field | missing | §4.1 |
| 66 | Completed open patch field | missing | §4.1 |
| 67 | Branch field and valuation ring | missing | §4.1 |
| 68 | Finite patching system | missing | Setting 4.2 |
| 69 | The projective-line patching diamond | missing | Example 4.1; Lemma 4.3 |
| 70 | Projective-line modules satisfy the analytic hypotheses | missing | Lemma 4.3 |
| 71 | Coefficientwise Laurent splitting in equal characteristic | missing | Remark 4.4 |
| 72 | Correct fraction field of the completed open ring | missing | Example 4.1(b); May 26 2026 errata Example 5.1(b), with repaired witness |
| 73 | Intersection in the projective-line diamond | missing | Theorem 4.5 proof; Harbater–Hartmann Theorem 5.9 |
| 74 | Finite map of a normal curve model to the projective line | missing | Theorem 4.5 proof; HH patching input |
| 75 | Finite-patch local-global principle for twisted flags | missing | Theorem 4.5(1) |
| 77 | Correct finite-patch Tits-index formula | missing | Theorem 4.5(2), explicit correction |
| 78 | Spread a generic special-fibre point to an open patch | missing | Corollary 4.6 proof; HHK2 Proposition 5.8 |
| 79 | Local-global principle using all special-fibre points | missing | Corollary 4.6(1) |
| 80 | Correct all-points Tits-index formula | missing | Corollary 4.6(2), explicit correction |
| 81 | Discrete-valued local-global principle for a reductive model | missing | Corollary 4.7(1) |
| 82 | Correct index formula in the reductive-model case | missing | Corollary 4.7(2), explicit correction |
| 83 | Rank-one local points give a model with all completed local points | missing | Corollary 4.8 proof; HHKP Theorem 2.5 |
| 84 | Unconditional rank-one local-global principle | missing | Corollary 4.8(1) |
| 85 | Correct rank-one Tits-index formula | missing | Corollary 4.8(2), explicit correction |
| 86 | Divisorial valuations of a semiglobal field | missing | Introduction; §5 |
| 87 | Strict-normal-crossing divisor on a regular surface | missing | Lemma 5.1 |
| 88 | Spread a generic torsor to an open subset | missing | Lemma 5.1 proof; Margaux limit theorem |
| 89 | Purity for reductive torsors on a regular surface | missing | Author Theorem 7.1(i); published Theorem B.1(i); CTS79 Theorem 6.13, pp. 128–129 |
| 90 | Purity with an affine linear quotient | missing | Author Theorem 7.1(ii); published Theorem B.1(ii); CTS79 Lemmas 2.1–2.2, Theorem 6.13 proof and Remark 6.15 |
| 91 | Surface torsor purity in the finite-presentation application | missing | Lemma 5.1 use of Theorem 7.1(ii) |
| 92 | Embedded resolution on an excellent regular surface | missing | Lemma 5.1, Lipman Theorem and Remark C |
| 93 | Extend the torsor away from an SNC divisor | missing | Lemma 5.1 |
| 94 | Prime-to-p finite structure reduction | missing | Proposition 5.2 proof |
| 95 | Reduction of form torsors to a finite subgroup | missing | Proposition 5.2; CGR Theorem 1.1(b) |
| 96 | Complete the regular local ring before the loop argument | missing | Proposition 5.2; errata Proposition 6.2 |
| 97 | Loop cocycle and loop torsor | missing | Proposition 5.2; Gille 2024 §2.3 |
| 98 | Tame covers are dominated by Kummer-unramified covers | missing | Proposition 5.2 input; Gille 2024 §2.1 |
| 99 | Prime-to-p finite-group torsors are loop torsors | missing | Gille 2024 Lemma 3(2),(3), cited as Lemma 2.3 in GP26 |
| 100 | Loop reductive group scheme | missing | Gille 2024 §4.2, used in Proposition 5.2 |
| 101 | Grothendieck valuation of a regular local surface | missing | Proposition 5.2; Gille 2024 §2.2 |
| 102 | Completion comparison for the local and completed local rings | missing | Errata Proposition 6.2; correction of Proposition 5.2 |
| 103 | Smooth proper fixed locus for a tame geometric loop action | missing | Gille 2024 Theorem 4, input to Proposition 5.2 |
| 104 | Fixed-point criterion over the Grothendieck completion | missing | Gille 2024 Theorem 4 |
| 105 | Parabolic criterion for loop reductive groups | missing | Gille 2024 Theorem 6 (cited as Theorem 4.1(iii)⇒(i) in GP26) |
| 106 | Divisorial points yield a model with completed-local points | missing | Proposition 5.2 |
| 107 | Divisorial local-global principle for twisted flags | missing | Theorem 5.4; publisher Theorem 6.4 |
| 108 | Only valuations nontrivial on the constant field are needed | missing | Remark 5.5 |
| 109 | Replacement of the root-system order hypothesis by finite reduction | missing | Remark 5.3 |
| 110 | Type G2 residue-characteristic refinement | missing | Remark 5.3 |
| 111 | Smoothness in the definition of a parabolic | planned | Appendix §6 |
| 112 | A parabolic quotient is transitively acted on over every extension | missing | Proposition 6.1(i)⇒(ii) |
| 113 | Universal field-point transitivity gives a rational section | missing | Proposition 6.1(ii)⇒(iii) |
| 114 | A rational section forces smooth connected stabilizer | missing | Proposition 6.1(iii)⇒(iv) |
| 115 | Smooth stabilizer is exactly parabolic in a projective quotient | missing | Proposition 6.1(iv)⇒(v)⇒(i) |
| 116 | Twisted flags are universally transitive | missing | Proposition 6.2(i)⇒(ii) |
| 117 | Universal transitivity characterizes twisted flags | missing | Proposition 6.2(ii)⇒(i) |
| 118 | Orbit-stabilizer scheme identification | missing | Proposition 6.2 proof, Demazure–Gabriel III.3.2.1 |
| 119 | Finite birational morphism to a normal target is an isomorphism | missing | Proposition 6.1 proof, EGA II 6.1.15 |
| 120 | Vector groups are R-trivial and additive torsors vanish on affines | missing | Lemma 2.3 proof |
| 121 | Etale maps remain etale after finite locally free restriction | missing | Proposition 3.6 proof, CGP A.5.2(4) |
| 122 | Etale charts are local analytic isomorphisms over the complete valued field | missing | Propositions 3.6, 3.9 |
| 123 | Smooth points lift from the residue field of a henselian local ring | missing | Corollary 4.7; Gille 2024 fixed-point proof |
| 124 | Central isogenies and adjoint quotients preserve parabolic schemes | planned | Theorem 3.13 reduction; §1.3 |
| 125 | A power subgroup of torus points is R-trivial | missing | Claim 3.12 proof |
| 126 | Elementary points are dense under the patch-field embedding | missing | Proposition 3.6 proof |
| 127 | Finite algebras are Artinian with nilpotent nilradical | library | Lemma 2.3 algebra input |
| 128 | Artinian quotient decomposition | library | Lemma 2.3 algebra input |
| 129 | Reflexive modules via the existing dual evaluation | library | CTS79 Lemma 2.2, pp. 109–110 |
| 130 | Hartogs for finite locally free sheaves | missing | CTS79 Lemma 2.1(i), p. 109 |
| 131 | Hartogs extension of affine scheme sections | missing | CTS79 Lemma 2.1(iii), p. 109; explicit generalization of its finite-type version |
| 132 | Coherence of the extension of a vector bundle | missing | CTS79 Lemma 2.1(ii), pp. 109–110 |
| 133 | Reflexivity of the coherent Hartogs extension | missing | CTS79 Lemma 2.2, p. 110 |
| 134 | Reflexive finite modules over small-dimensional regular local rings are free | missing | CTS79 Lemma 2.2 proof, p. 110; local algebra used by Theorem 6.13 |
| 135 | Vector bundles extend across codimension two on a regular surface | missing | CTS79 Lemmas 2.1–2.2; Theorem 6.13 proof |
| 136 | Full faithfulness of affine torsor restriction | missing | CTS79 Theorem 6.13 uniqueness and twisting argument; affine Hartogs proof |
| 137 | Extend a reduction of a linear torsor by its affine quotient section | missing | CTS79 Theorem 6.13, p. 129; Remark 6.15, p. 130; GP26 Appendix B.1(ii) |
| 138 | Codimension-one-only opens can lose reductive torsors | missing | Published Theorem B.1 scope check; independent boundary counterexample |
| 139 | The T-valuation family in the rank-one comparison | missing | HHKP20 introduction and §1, pp. 1–4 |
| 140 | Rank bound for nontrivial T-valuations of a semiglobal field | missing | HHKP20 §1 preceding Lemma 1.1 |
| 141 | Completion at a composite rank-two valuation | missing | HHKP20 Lemma 1.1(a), p. 4 |
| 142 | Henselization under valuation coarsening | missing | HHKP20 Lemma 1.1(b), p. 4 |
| 143 | Smooth rank-one completion points descend to the henselization | missing | HHKP20 Proposition 2.3(a), p. 6 |
| 144 | An infinite compatible quadratic-transform chain gives a valuation ring | missing | HHKP20 Lemma 2.4, pp. 6–7 |
| 145 | Henselization and fraction fields along the quadratic-transform chain | missing | HHKP20 Lemma 2.4 equation (1) and proof |
| 146 | Only finitely many model points can remain bad | missing | HHKP20 Theorem 2.5 first paragraph, p. 7; HHK15 Proposition 5.8 |
| 147 | Termination of blowing up the bad-point set | missing | HHKP20 Theorem 2.5, pp. 7–8 |
| 148 | The rank-one T-valuation family already tests twisted flags | missing | HHKP20 Theorem 2.5 combined with GP26 Corollary 4.6(1); explicit strengthened consequence |
| 149 | Prasad's form of Tits' theorem on open subgroups | missing | Proposition 3.11(2) proof, p. 14, citing [K-P, Proposition 2.14]; Prasad, Bull. SMF 110 (1982), Theorem (T) |
| 150 | Tits' normal subgroup theorem | missing | Proposition 3.11(2) proof, p. 15 ('Tits' theorem'); Tits, Annals of Math. 80 (1964), main theorem |
| 151 | Approximation of a maximal torus from a dense subfield | missing | Claim 3.12 proof, p. 14, citing [Hd, proof of Hauptlemma] |
| 152 | Gluing a torsor to its generic extension | missing | Lemma 5.1 proof, p. 20, citing [G-P1, Corollary 1.8] |
| 153 | Finite flat group schemes are linear with affine quotient | missing | Proposition 5.2 proof, p. 21, citing [Br-T, §1.4.5] and [D-G, §III.2.6] |
| 154 | Reductive groups on a regular surface are locally linear with affine quotient | missing | Remark 7.2, p. 23; CTS79 Corollary 6.12, p. 128 |
