# Yun–Zhang (2019): shtukas and the Taylor expansion of L-functions (II), extraction and routing

Issue [#1133](https://github.com/CBirkbeck/tauceti-explorer/issues/1133). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoints, whose report follows below as history.
- **The paper.** Z. Yun and W. Zhang, *Shtukas and the Taylor expansion of L-functions (II)*, Ann. of Math. 189 (2019), 393–526.
  - The author-hosted published PDF was re-fetched; its SHA-256 (700e0b09…) matches the checkpoint.
- **Items.** The result has **190 items: 7 library, 10 planned and 173 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Thirty-seven are recorded under `sourceIssues`.

## This continuation (cc-442dc5)

**New items.**
- Definitions 5.7–5.11 had been bundled into the master-diagram construction (item 101). They now have their own items:
  - the stack H_d(Σ);
  - the Hecke stack Hk^μ_{H,d}(Σ);
  - the torus pullback M_d;
  - the Hecke stack Hk^{μ,μ′}_{M,d};
  - the shtuka intersection Sht^{μ,μ′}_{M,d}.
- Conjecture 1.6 is added as a statement-only item.

**Reclassified to affect nothing.** Seven misprints whose intended form is fixed by the surrounding displays: E9, E12, E26, E30, E31, E32 and E34.

**Unchanged.** These affect a stated result:
- the setup and fibre errors E6, E7, E22, E23, E25 and E33;
- E28, the Hecke-domain step of Theorem 7.5.

**Gates.**
- G1, G2, G4 and G5 are recorded as findings.
- G3, G6 and G7 are deferred as cited suppliers' proofs, design work or review.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes, including the paper's own proof gaps, are recorded.

## Mistakes found (`sourceIssues`)

- **E1** (misprint; affects nothing), Theorem1.2 p.397; (5.13) p.470; published version. *Printed:* r±={i:μi=±μ′i} *Correction:* Use the cardinality of each set for r±; retain the set separately if needed.
- **E2** (misprint; affects nothing), p.397, definition of ε_r1; same issue in the corresponding arXiv v2 passage collated. *Printed:* ∏j=r1+1^r(1−σ_i)/2 *Correction:* Use σ_j in the second product.
- **E3** (misprint; affects nothing), Lemma2.6 proof p.409, subset expansion; published version. *Printed:* S=∅ (omitted case) *Correction:* Include the empty subset in the right A(O)-invariant summand.
- **E4** (misprint; affects nothing), §3.1.2 p.419, fractional representatives; published version. *Printed:* {1/n,…,(n−1)/n} *Correction:* Include 0 among representatives modulo Z.
- **E5** (misprint; affects nothing), §3.1.2 p.419, AL(D) dependence; published version. *Printed:* D∞ *Correction:* Use D in the dependence-on-divisor assertion.
- **E6** (error; affects a stated result), §3.2.4 p.425, coweights before Lemma3.7; same issue in the corresponding arXiv v2 passage collated. *Printed:* μ(c_x^(j)) *Correction:* Append μ(−c_x^(j)) so the extra modifications remove D∞.
- **E7** (error; affects a stated result), Lemma3.19(2) p.435; same issue in the corresponding arXiv v2 passage collated. *Printed:* D′≥0, suppD′⊂Σ(K) *Correction:* Require D′ reduced, i.e. D′≤Σ(K); alternatively replace by its mod-two representative throughout.
- **E8** (misprint; affects nothing), Lemma3.28 proof p.442, Δ′i cases; published version. *Printed:* Ni=Ni+1 *Correction:* Use Ni=Ni−1 in the stationary case.
- **E9** (misprint; affects nothing), Lemma3.28 proof p.443, extension-space dimension cases; published version. *Printed:* dimJi−dimHi−1=1 for Ni=Ni−1 or Ni−1−1; 0 for Ni=Ni−1+1 *Correction:* The value is 1 for Ni=Ni−1 or Ni−1+1, and 0 for Ni=Ni−1−1. The final total r−|I|/2 is unchanged.
- **E10** (gap; affects the proof), §3.4.4 and §3.5 p.444, truncation index; same issue in the corresponding arXiv v2 passage collated. *Printed:* ⋃κ∈K_r ≤κSht=Sht *Correction:* Handle r<#Σ∞ using the finite-type core or an ordinary nonempty HN truncation system; do not use K_r in that case.
- **E11** (gap; affects the proof), Lemma3.33 p.445; same issue in the corresponding arXiv v2 passage collated. *Printed:* 0<κ≤κ′ *Correction:* Choose a cofinal family containing the entire low-instability core, so every added stratum satisfies the high bound of Lemma3.28.
- **E12** (misprint; affects nothing), §3.5.4 p.448, three displays; same issue in the corresponding arXiv v2 passage collated. *Printed:* [−#I(κ)](−#I(κ)/2) *Correction:* Replace by [+#I(κ)](+#I(κ)/2) after the [2r](r) normalization.
- **E13** (misprint; affects nothing), §3.5.4 p.448, fixed-degree torsor; same issue in the corresponding arXiv v2 passage collated. *Printed:* Pic_X(k) *Correction:* Use Pic_X^0(k) for one fixed-degree component; Pic_X(k) acts on the union of all degree translates.
- **E14** (misprint; affects nothing), §3.5.4 p.448, translated direct sum; same issue in the corresponding arXiv v2 passage collated. *Printed:* ⊕κ′∈κ+Z Rπ1!^(N(κ)) *Correction:* Use N(κ′) in each translated summand.
- **E15** (gap; affects the proof), Lemma3.37(1) proof p.450; same issue in the corresponding arXiv v2 passage collated. *Printed:* dim(V≤i/imV≤i−1)<∞ *Correction:* Also bound the transition kernels by the preceding terms of the perverse hypercohomology long exact sequence before concluding finite kernel of V≤0→V.
- **E16** (misprint; affects nothing), Theorem1.2 notation p.397; same issue in the corresponding arXiv v2 passage collated. *Printed:* Σ− defined in (4.6) *Correction:* Refer to (4.5); (4.6) defines Σ+.
- **E17** (gap; affects the proof), Definition5.4 p.466, root-forgetting conditions; published version. *Printed:* a|R=b|R=ϑ² *Correction:* On A_d^flat retain a|R=b|R but remove the undefined ϑ datum; A_d restores its square root.
- **E18** (misprint; affects nothing), Lemma5.12 proof p.477; published version. *Printed:* a⊗b↦ab+aσb *Correction:* Use the ordered pair (ab,aσb) in OX′⊕OX′.
- **E19** (gap; affects the proof), Proposition5.18 proof pp.486–487; published version. *Printed:* degν*(σ*L^−1⊗L(R′−Σtilde″))=ρ/2−degΣtilde<0 *Correction:* For the indicated vanishing argument choose degΣtilde>ρ and use H0(X,ν*M)=H0(X′,M), where degM=ρ−degΣtilde<0.
- **E20** (gap; affects the proof), Theorems5.6,5.20,7.4 and Lemma5.19, pp.470,487–491,510; published version. *Printed:* max(2g′−1+N,2g) *Correction:* Until the low-genus argument is supplied, use max(2g′−1+N,2g+N,3g−2+N) for the common large-degree comparison.
- **E21** (misprint; affects nothing), Proposition6.2 p.495; published version. *Printed:* d∈Σ_d *Correction:* Use d∈Q_d.
- **E22** (error; affects a stated result), Proposition6.2(1) p.495, geometric connectedness; published version. *Printed:* N_d geometrically connected *Correction:* Qualify by nonemptiness/admissibility; allow the empty N_d in all later formulas and interpret out-of-range K indices as zero.
- **E23** (error; affects a stated result), §6.2.3 p.498, X_(D,γ̃) conditions; same issue in the corresponding arXiv v2 passage collated. *Printed:* ψij,R²=ϕij|R *Correction:* Add detψ_R=0 to the object conditions.
- **E24** (misprint; affects nothing), §6.2.3 p.500, groupoid Fubini setup; published version. *Printed:* f:G′→Q *Correction:* The function integrated before pushforward has domain G; its pushforward has domain G′.
- **E25** (error; affects a stated result), §7.1.1 p.506, claimed Galois cover; same issue in the corresponding arXiv v2 passage collated. *Printed:* X′_d^circ→X_d^(√R,circ), Γ_d *Correction:* Use the ordered distinct-lift configuration as the Γ_d-torsor; X′_d^circ is its S_d quotient.
- **E26** (misprint; affects nothing), §7.1.1 p.506 and §A.2.1 p.519, perversity terminology; same issue in the corresponding arXiv v2 passage collated. *Printed:* K_(d,i)=j!*(L[d])[−d] *Correction:* Call K the normalized unshifted IC complex; K[d] is perverse. Apply the same normalization discipline to Lhat_d.
- **E27** (misprint; affects nothing), Proposition7.1 proof p.507; published version. *Printed:* Rνhat_d′!Qℓ[d] *Correction:* Use [d′].
- **E28** (gap; affects a stated result), §7.2 Theorem7.5 pp.511–512; same issue in the corresponding arXiv v2 passage collated. *Printed:* f∈H_G^Σ *Correction:* Restrict the analytic comparison and projector algebra to H_G^(Σ∪R), and prove the excluded-place version of the density/strong-multiplicity-one argument; alternatively define and prove the missing R-local extensions.
- **E29** (misprint; affects nothing), Theorem7.5 p.512; same issue in the corresponding arXiv v2 passage collated. *Printed:* μ,μ′∈{±1}^r *Correction:* Use μ,μ′∈T_(r,Σ), or explicitly fix the omitted level parameters.
- **E30** (misprint; affects nothing), §7.3.1 pp.512–513, projector substitution; same issue in the corresponding arXiv v2 passage collated. *Printed:* I^(μ,μ′)(eπ)=⟨Zπ^μ,Zπ^μ⟩ *Correction:* Retain μ′ on the second cycle in the projector and final comparison displays.
- **E31** (misprint; affects nothing), §7.3.2 p.514, application of Theorem1.2; same issue in the corresponding arXiv v2 passage collated. *Printed:* ∂s1^(r−|I|)∂s2^|I| ℒtwo=⟨Z,σI Z⟩ *Correction:* Restore C=|ωX|q^(ρ/2−N)/(2(−logq)^rLAd) when ℒtwo is the introduction's product. If using §2.6's adjoint-divided symbol, first apply its conversion and remove only the duplicate adjoint denominator.
- **E32** (misprint; affects nothing), §7.3.2 p.514, final projector product; same issue in the corresponding arXiv v2 passage collated. *Printed:* ∏j=r1^r(1−σj)/2 *Correction:* Start at j=r1+1.
- **E33** (error; affects a stated result), §A.1.3 pp.515–516, fibre over a(x)=0; same issue in the corresponding arXiv v2 passage collated. *Printed:* P_x≅[SpecK/μ2] *Correction:* The full geometric fibre is [Spec K[t]/(t²)/μ2]; only its reduced substack is Bμ2.
- **E34** (misprint; affects nothing), LemmaA.8 proof p.520, general monodromy character; published version. *Printed:* χ:π1(U)→{±1} *Correction:* Use χ:π1(U)→Qℓbar× for the stated arbitrary rank-one local system; inertia at R has order dividing two.
- **E35** (misprint; affects nothing), LemmaA.11 proof p.523, descent pullback; published version. *Printed:* AJ_(d1+d2) *Correction:* Descend the two-factor multiplicativity isomorphism along AJ_d1×AJ_d2.
- **E36** (misprint; affects nothing), Proposition3.4 proof p.422; published version. *Printed:* y∈Ux(R) *Correction:* Use y∈Ux(R′) for the local R′-valued test point.
- **E37** (misprint; affects nothing), Proposition3.4 proof p.422; published version. *Printed:* interval in R′ *Correction:* Replace 'interval' by 'invertible'.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Close the Hecke-domain repair** (recorded). E28: Theorem 7.5's Hecke-domain comparison is not established as stated. The repair through H_G^(Σ∪R) is recorded; YZ17's density and strong multiplicity one are cited suppliers.
- **G2, Complete the finite-type and high-instability branches** (recorded). E10, E11 and E15 record the finite-type and high-instability gaps.
- **G3, Read and instantiate the external geometric contracts** (deferred). Lafforgue, Varshavsky, Blum–Stuhler and YZ17 are cited suppliers.
- **G4, Root-stack and character-sheaf closure** (recorded). E33 records the fibre over a(x) = 0. The Appendix A descent exercises the paper leaves are routine proof work.
- **G5, Resolve low-genus largeness endpoints** (recorded). E20: the common larger degree bound suffices for the comparison; the printed low-genus endpoints remain unproved.
- **G6, Finish atomic coverage and proof-source closure** (deferred). Definitions 5.7–5.11 and Conjecture 1.6 now have their own items. Further splitting is design work.
- **G7, Independent verification and shared-owner reconciliation** (deferred). Independent review and owner reconciliation are the review pipeline's job.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every prerequisite target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of the findings reclassified here, this continuation supersedes it.

## PAPER-YUN-ZHANG-19 — whole-paper extraction checkpoint

Codex, session codex-a71f92. Refs #1133. Status: **partial**.

The published paper has been read completely, including Appendix A and the references. This checkpoint records 184 items (7 library, 10 planned, 167 missing), nine routes, 37 unreviewed source findings and seven named completion gates. Every missing item is routed exactly once. “Partial” refers to proof/source closure and final atomic decomposition, not an unread tail of the main paper. Nothing here claims Lean implementation or an independent review.

### What the theorem says

Work over k=Fq of characteristic p≠2. The curves X and X′ are smooth, projective and geometrically connected, and ν:X′→X is a double cover with reduced branch divisor R of degree ρ. Let η be its quadratic idele character. The squarefree level set Σ is disjoint from R, N=degΣ, and π is a cuspidal representation of PGL2 over F=k(X), unramified outside Σ and an unramified twist of Steinberg at Σ. Because the central character is trivial, the twisting character in this PGL2 formulation is quadratic. Write Σf for the split places and Σ∞ for the inert places. Require r≥0 and r≡#Σ∞ modulo two. The latter counts closed places, not their residue degrees.

A cycle parameter μ has three components: leg signs, choices of lifts at split level places, and signs at inert infinity places. There are therefore more choices than a tuple in {±1}^r. For μ,μ′ let r+ count equal leg signs, r− count unequal ones, and let Σ− be the level places where their level choices differ. Its complementary level subset is Σ+. Set N±=degΣ±. The scalar ε− is the product of the Atkin–Lehner signs of π⊗η at Σ−.

The normalized one-variable functions are
```text
ℒπ(s+1/2)  = q^((2g−2+N/2)s) L(π,s+1/2)
ℒπη(s+1/2) = q^((2g−2+N/2+ρ)s) L(π⊗η,s+1/2).
```
Use separate names for ℒtwo(s1,s2)=ℒπ(s1+s2+1/2)ℒπη(s1−s2+1/2) and ℒtwoAd=ℒtwo/L(π,Ad,1). The introduction and §2.6 use the same printed notation for these different quantities. The extraction does not carry that ambiguity forward.

With |ωX|=q^−(2g−2), define
```text
C = |ωX| q^(ρ/2−N) / (2(−log q)^r L(π,Ad,1)).
```
Theorem 1.2 identifies C ε− times the mixed (r+,r−) derivative of ℒtwo at zero with the intersection of the two projected cycles Zπ^μ(ξ) and Zπ^μ′(ξ) on the smooth, 2r-dimensional shtuka stack over a chosen geometric infinity component ξ. These are proper-support algebraic cycles over a finite field. They are not arithmetic Chow classes with archimedean Green functions.

For 0≤r1≤r, Theorem 1.3 identifies C ℒπ^(r1)(1/2)ℒπη^(r−r1)(1/2) with the self-intersection of
```text
ε_r1 Zπ^μ,  ε_r1 = ∏(i=1,…,r1)(1+σi)/2 · ∏(j=r1+1,…,r)(1−σj)/2.
```
The σi are deck involutions at the individual legs. The factor 2^−r in the Boolean Fourier expansion and the factor C must both survive the proof. Corollary 1.4's pushdown scalar is 2^(r−1)|ωX|q^(ρ/2−N)/((−logq)^rLAd).

Theorem 1.1 supplies the finite non-Eisenstein generalized spectral sectors and their pairing. A generalized Hecke eigenspace is not automatically a diagonalizable Frobenius representation. Equation (1.9) is an expected description, and Conjecture 1.6 is a conjecture about a genuine Frobenius eigenspace. Neither becomes a proved item or a BSD theorem. Odd r is available in this paper when the number of inert level places is odd; it is not a specialization of the even-r first paper.

### What was read and checked

The authoritative copy is the [published author PDF](https://math.mit.edu/~zyun/GZW_ramified_published.pdf), 135 PDF pages comprising one cover and 134 article pages, journal pp.393–526. SHA-256: `700e0b09f2320912b75f5a16968c5aa3f96a0ad74e3ca375aacedec7e85d296c`. All 9264 text lines were read in seventeen consecutive blocks; the JSON read log gives their mathematical content. Published pp.498, 506, 514 and 515 were also rendered and visually checked.

The [arXiv v2 PDF](https://arxiv.org/pdf/1712.08026v2), submitted 13 June 2020, has 90 pages and SHA-256 `e159d869e86a3526e95aaf9560780870ed5c7af35593eb5ebb4fe477f0adf258`. It was downloaded and selected corresponding passages were collated; it was **not** read in full. In particular, the omitted root determinant condition, the symmetric-cover Galois claim, the projector normalization/range errors, the wrong horocycle shifts and the nonreduced-root-fibre issue remain in those passages. No dedicated correction was located in the Annals entry, title searches or the two authors' publication entries; “new” in the source-issue schema means only that no correction was located in those searches.

The [first paper's published PDF](https://math.mit.edu/~zyun/Taylor_Expansion_published.pdf), SHA-256 `b02ed5cbe5e6443a59360551cd41048ebb1e589d3c4cbe89f7fcbbbec50fc111`, was acquired separately. Read passages include Lemma 9.1 and Theorem 9.2 with their proof, the precise Appendix A.2.8–9 compatibility contract, Theorem A.10 and its derived-tensor comparison, and the Frobenius-graph trace contract A.4.4–5/Proposition A.12. This is selective prerequisite reading, not a claim to have read all of the first paper in this job.

The entire upstream JacobianChallenge and ReductiveGroups READMEs were read as implementation-planning examples. The full YZ17 report and its five route briefs, and all three FYZ24 route briefs, were read to prevent overlapping designs. Bresciani24's root-stack route is a catalogue lead only, not a reviewed source imported on trust.

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Statement-level matches, file names and read ranges are recorded in libraryEvidence. The seven library items deliberately stop at intrinsic function fields, weighted place divisors, high-degree function-field Riemann–Roch, finiteness of Cl^0, finite-field quadratic characters, the generic Ind category, and exterior-power dimension. None supplies an algebraic stack, a shtuka, a ramified character sheaf or the theorem's relative trace formula.

Reviewed audits and stage descriptions were consulted for GS.0–3 (and the later GS boundary), FA.0–7, EDC.5/7/8, SF.1/3/5 and GZ.5. Indization and its abelian instance are present in Mathlib; calling the whole categorical foundation missing would duplicate library work. Conversely, an abstract divisor class group is not a Picard stack, a finite-field character is not the local h-sharp test, and an exterior-power dimension theorem is not Lemma A.6's geometric cohomology calculation.

### How the proof is organized

The analytic side fixes Haar volume A(O)=1, regularizes the two torus degree directions, and kills continuous Eisenstein terms with the spherical Eisenstein ideal. At a ramified place, h-sharp counts **rank-one** entrywise square-root matrices. The all-unit branch has a factor one-half. The row-character function f-sharp has the same relevant period, though it is not the same function. The Iwahori and Atkin–Lehner local calculations contribute different q powers and a sign. Proposition 2.10 then gives the exact normalized global spectral term.

The geometric foundations belong to GS, not to the special-cycle extension. Rank-n Iwahori chains have the semistable local model t=z1⋯zn. Fractional infinity twists and their Frobenius orbits determine the degree balance. In the PGL2 specialization, the horocycle index remembers a reduced parabolic divisor and an instability integer at each intermediate bundle. The allowed coordinate support has |I(κ)| free legs. For sufficiently high instability the normalized direct image is
```text
Pκ = Rπκ! Qℓ[2r](r)
   = Rπ1! Qℓ[|I(κ)|](|I(κ)|/2).
```
This is the opposite sign from the later printed display. The generic rank-one shtuka torsor controls the constant term modulo constructible objects.

There are two different truncations. Geometric HN truncations are finite-type open substacks. The symbols V≤i in Lemma 3.37 instead mean a colimit of hypercohomology of **perverse-degree** truncations. Replacing the latter by one geometric finite truncation would incorrectly make the full cohomology finite-dimensional. Also, when r<#Σ∞, K_r is empty but the shtuka stack need not be: Definition 4.4/Remark 4.5 provide nonempty torus shtukas in the permitted parity range. Use a genuine HN system or the terminal finite-type core in this branch.

For special cycles, retain Bun_T as a quotient stack and its finite Lang-kernel groupoid. The whole-base intersection is divided by the product of upstairs infinity residue degrees; Lemma 4.14 identifies it with a single ξ-component. The spaces M_d and A_d use root norm data, not just ordinary norms. The determinant-nonzero open is the first paper's M-heart, not its entire earlier M_d. The base A_d^flat forgets the roots and is a scheme; that scheme hypothesis is used by the trace theorem.

The master diagram compares a Frobenius intersection with two iterated refined Gysin operations. The octahedron theorem has finite flat presentation, regular-immersion/smooth factorization, and expected-dimension hypotheses. It is not generic associativity of arbitrary intersections. The ramified Hom description works over nonreduced bases: the local identity
```text
(ϖ−a)β0=(−ϖ−a)β1,  β1=ϖγ+β0  ⇒  β0=−(ϖ+a)γ/2
```
is why odd characteristic matters. The individual norms in Lemma 5.12 are meromorphic expressions; their difference has cancelled ramified poles. There is no source error merely because the individual terms appear to have a twist.

On the orbital side, N_dquad includes four entry degrees, their shifted level degrees, a rank-one root matrix, and strict/non-strict minimum-degree cutoffs. Empty quadrangles remain empty; they are not silently assumed connected and nonempty. Weighted groupoid sums retain automorphisms. The regular orbits work in all degrees, while the singular three-orbit fibres require high-degree character cancellation.

On the common generic base, the ordered lift configuration is the signed permutation torsor. The symmetric power is its S_d quotient, not that torsor. Boolean representation theory yields ranks choose(d,i) and incidence eigenvalues A−2i, B−2j. The geometric norm map is small; the orbital map is not. Its IC property requires the actual boundary character-cohomology estimate. The degree exponents are negatives of those incidence eigenvalues, giving the factor (−logq)^r.

Finally, fΣ± is defined away from **both** Σ and R. The printed all-H_G^Σ formulation in §7 needs a repair. The sufficient route is to run the finite-type Hecke image, high-degree spanning and strong-multiplicity-one argument away from Σ∪R. Reading YZ17's proof identifies the necessary finite-exclusion changes, but G1 still requires their complete written verification. One must also preserve μ′ in the projector cross-pairing and C in the Boolean Fourier calculation.

### Routes and design instructions

#### Route 1: GlobalShtukasAndFunctionFieldLanglands

GS.0 owns bundles, Iwahori flags and HN strata; GS.1 owns global minuscule Hecke geometry; GS.2 owns Frobenius/fractional-infinity shtukas and local models; GS.3 owns their compact cohomology, truncation colimits and spectral finiteness. This paper adds precise PGL2 horocycle and Eisenstein-sector proofs within those targets. Generic modulo-constructible categorical definitions come from the separate EDC extension, not a duplicate shtuka-specific Ind category. All corrected finite-type/high-instability cases remain required.

Supplier stages: GlobalShtukasAndFunctionFieldLanglands:GS.0, GlobalShtukasAndFunctionFieldLanglands:GS.1, GlobalShtukasAndFunctionFieldLanglands:GS.2, GlobalShtukasAndFunctionFieldLanglands:GS.3. The JSON lists the exact assigned item IDs.

#### Route 2: GrossZagierAndArithmeticHeights

Follow the already proposed YZ17 GZ.5 toric-period/relative-trace source route: add the ramified h-sharp/f-sharp tests, Iwahori local factors, two-variable toric regularization and exact adjoint/measure normalization. Import generic automorphic spaces and fixed-level finiteness from FunctionFieldArithmetic FA.6, generic standard L-factors from AutomorphicLFunctionsAndLocalFactors AL.2, and adeles/Haar conventions from FA.2. Do not create a second automorphic or L-function foundation. The degree-spanning lemma is the algebraic analytic-comparison input; cycle intersections stay in the shared shtuka extension.

Supplier stages: GrossZagierAndArithmeticHeights:GZ.5. The JSON lists the exact assigned item IDs.

#### Route 3: SchemeAndStackFoundations

The paper consumes the scheme/line-bundle, cohomology/base-change and Picard comparison contracts, not merely the existing function-field Riemann–Roch statement. SF.3 integrates the upstream AlgebraicCurves/JacobianChallenge owners. No upstream roadmap is replanned; the tame Hurwitz input is separately marked planned in its upstream layer.

Supplier stages: SchemeAndStackFoundations:SF.3. The JSON lists the exact assigned item IDs.

#### Route 4: EtaleDualityAndPerverseSheaves

Import the constructible perverse category, normalized IC, pure geometric decomposition and small-map consequences. The paper-specific support inequalities, canonical constant-term identification and ramified comparison computations remain with their consuming route. The additional ind/Serre-quotient formalism is not hidden inside the bounded constructible stage.

Supplier stages: EtaleDualityAndPerverseSheaves:EDC.5, EtaleDualityAndPerverseSheaves:EDC.7. The JSON lists the exact assigned item IDs.

#### Route 5: SchemeAndStackFoundations

SF.1 owns quotient/root-stack geometry and infinitesimal fibres; use its existing Bresciani24 root-stack source lead rather than rebuilding roots inside geometric class field theory. SF.5 owns rational DM-stack Chow/refined-Gysin, support-filtered coherent K0 and the YZ17 octahedron contract. The ramified master diagram only supplies its particular instantiation. A_ d's root fibre and finite flat presentations must retain their stack hypotheses.

Supplier stages: SchemeAndStackFoundations:SF.1, SchemeAndStackFoundations:SF.5. The JSON lists the exact assigned item IDs.

#### Route 6: EtaleDualityAndPerverseSheaves

The generic smooth-DM correspondence/Frobenius-graph identity is precisely the trace/cycle-class interface already sourced from YZ17. Retain its proper, representable-left-projection, smooth/separated-M and SCHEME-base hypotheses. The numerical application over A_d^flat is not another trace-formula foundation.

Supplier stages: EtaleDualityAndPerverseSheaves:EDC.8. The JSON lists the exact assigned item IDs.

#### Route 7: ShtukaSpecialCyclesAndHigherSiegelWeil

Reuse exactly the Part II candidate already proposed by PAPER-YUN-ZHANG-17 and PAPER-FENG-YUN-ZHANG-24; this is an additional ramified/Iwahori toric branch of that proposal, not a second design. No atlas stage yet supplies these cycle/intersection identities. Generic GS, EDC, SF and ramified class-field foundations remain imported.

Extend the EXISTING ShtukaSpecialCyclesAndHigherSiegelWeil proposal, retaining both its even-leg unramified Yun–Zhang17 branch and its unitary Feng–Yun–Zhang24 higher Siegel–Weil branch. Add the ramified PGL2 branch of Yun–Zhang19, not a new parallel roadmap. Standing data: k=Fq, p≠2, X and X′ smooth projective geometrically connected, ν:X′→X of degree two with reduced ramification R of degreeρ; Σ disjoint from R, N=degΣ, Σ∞ the inert closed places and Σf the split ones. π is PGL2 cuspidal, unramified outside Σ and an unramified quadratic twist of Steinberg at Σ. Require r≥0 and r≡#Σ∞ mod2; # counts closed places, not their degrees. For μ,μ′∈T_(r,Σ), r± count agreeing/disagreeing leg signs and ε− is the product of π⊗η Atkin–Lehner signs at differing level places. Define ℒtwo=ℒπ(s1+s2+1/2)ℒπη(s1−s2+1/2), where normalization exponents are 2g−2+N/2 and 2g−2+N/2+ρ. The endpoint Theorem1.2 is C ε− ∂s1^r+∂s2^r−ℒtwo(0,0)=⟨Zπ^μ(ξ),Zπ^μ′(ξ)⟩, with C=q^−(2g−2)q^(ρ/2−N)/(2(−logq)^rL(π,Ad,1)). Theorem1.3 is C ℒπ^(r1)(1/2)ℒπη^(r−r1)(1/2)=⟨ε_r1Zπ^μ,ε_r1Zπ^μ⟩, with ε_r1=∏i≤r1(1+σi)/2∏j>r1(1−σj)/2. Corollary1.4 has the pushdown factor 2^(r−1), as item155 states. These are ordinary algebraic intersections over finite fields, not arithmetic-height/Arakelov formulas. Cover the torus quotient GROUPoid and Lang torsors, root-sensitive flags and AL maps, proper cycles and ξ-normalization, M_d/A_d/A_d^flat, signed incidence correspondences, ramified Hom description valid on nonreduced bases, the full octahedron master diagram, N_dquad with detψ_R=0 and degree cutoffs, weighted orbital groupoids and regular/singular trace identities, ordered Γ_d covers and normalized K_(d,i), smallness only for f_d, boundary IC estimates for g_d, eigenvalues B−2j/A−2i, the allowed-Hecke comparison and spectral projector, and the Walsh proof with C retained. Import Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands GS.0–3) for all moduli/Hecke/HN/spectral foundations; Scheme and stack foundations (SchemeAndStackFoundations SF.1/3/5) for roots, Picard geometry and refined Gysin/octahedron; Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5/7/8) plus its IndConstructibles extension; Global function fields, reciprocity and automorphic foundations (FunctionFieldArithmetic FA.2/4/5/6) and its RamifiedGeometricClassFieldTheory extension; Gross–Zagier and arithmetic heights (GrossZagierAndArithmeticHeights GZ.5) for the normalized ramified toric comparison. Tests must include r=0, r=1 with an odd number of inert places, a degree-two inert place for the parity trap, all-ones residue root counts 8 versus16, d=2 ordered/symmetric cover degrees8 versus4, μ≠μ′ cross-pairings, r1=0/r projector endpoints, and the negative exponent/incidence sign. Gates G1–G7 are mandatory remaining proof work. Do not present (1.9), Conjecture1.6 or announced BSD applications as proved. Do not claim that r=1 is a specialization of the even-r first paper.

#### Route 8: RamifiedGeometricClassFieldTheory

FA.4 supplies arithmetic reciprocity and norm subgroups, not the root-Picard character SHEAF and all-degree Abel–Jacobi descent of AppendixA. SF.1 supplies generic root stacks but not this multiplicative local-system construction. A single reusable geometric class-field extension supplies the PGL2 comparison and future rank-one ramified consumers.

Start after Global function fields, reciprocity and automorphic foundations (FunctionFieldArithmetic), especially FA.2/4: import its adelic/idele and arithmetic reciprocity objects, without rebuilding them. Construct the geometric refinement in Yun–Zhang19 AppendixA for square-root ramification on a smooth projective geometrically connected curve over a finite field of odd characteristic. The final contracts are LemmaA.11's multiplicative rank-one local system L_Pic on the graded root-Picard stack, with unit, associativity and commutativity, and PropositionA.12's equality of its Frobenius trace with η_(F′/F) for a geometrically connected quadratic cover. The character-sheaf construction starts with ANY rank-one Qℓbar local system on the root curve, equivalently ramification monodromy of order dividing two; its global monodromy is not required to be quadratic. The quadratic specialization is an endpoint, not the definition of the general construction. Cover root-Picard objects (L,K_R,K_R²≅L|R), the square-action quotient and gerbe, root-Picard-with-section objects, root symmetric powers and their smoothness, addition and ordered maps, the modified-unit adelic GROUPoid, invariant tensor local systems L_d, collision descent, H^d=exterior^dH1 with all other degrees zero under geometric nontriviality, high-degree Abel–Jacobi descent for d≥ρ+max(2g−1,1), independent extension to every integer Picard degree, hat-space local systems by Abel–Jacobi PULLBACK, multiplicative coherence, the ramified norm and the two-categorical exact sequence (A.11). Import Scheme and stack foundations (SchemeAndStackFoundations SF.1/3) and upstream JacobianChallenge through SF.3 for generic root-stack, Picard/section and cohomology geometry; import Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5/7/8) for sheaf/descent/trace tools, and existing Mathlib exterior-power algebra. Do not place the generic nonreduced root-fibre calculation here: SF.1 supplies [SpecK[t]/t² /μ2], whose reduction alone is Bμ2. Tests: R=∅ recovers the unramified construction; a nontrivial unramified character of order three is allowed; d=0 gives the unit; exterior powers vanish above dimH1; degree-d Picard components are torsors; different auxiliary divisors give canonically identical extension; zero sections have rank-one hat stalks; root norms at R are squares of the upstairs fibre; double-coset stabilizers contribute 1/Aut. The root norm exact sequence must not be misread as injectivity of Pic groups. Resolve nonrepresentable 'finite' map conventions and all descent/coherence exercises in G4 before claiming closure. Export the character sheaf and trace/norm compatibility to ShtukaSpecialCyclesAndHigherSiegelWeil, not its specialized matrix stacks.

#### Route 9: EtaleDualityAndPerverseSheavesPartIIIndConstructibles

EDC.5 explicitly stops at bounded constructible perverse sheaves; Mathlib already provides Ind and abelianness, but not the paper's mc quotient interface. GS.3 needs a reusable exact categorical contract. IG.4 has a different filtered-colimit support criterion; import/reconcile rather than assert it is the same theorem.

Build a narrow reusable extension of Étale duality, cycle classes and perverse sheaves (EtaleDualityAndPerverseSheaves EDC.5), using the EXISTING Mathlib CategoryTheory.Ind, fully faithful Yoneda embedding and abelian Ind instance. First work for an essentially small finite-length abelian category C, proving that its essential image is Serre in Ind(C), then construct the exact Serre quotient Ind(C)/C with its universal property. Define mc-isomorphisms by constructible kernel/cokernel and mc-zero morphisms by constructible image, as Yun–Zhang19 Definition3.32 does after C=Perv_c(B,Qℓ). Prove the two-out-of-three/composition calculus, the ideal property of mc-zero maps, the factorization criterion, and the passage from mc-commuting squares/actions to genuine commuting squares/actions in the quotient. Supply explicit universe/skeleton choices; do not declare every ind-perverse sheaf constructible or assume the filtered colimit is a bounded constructible complex. Tests: every morphism between two constructible objects is mc-invertible in the quotient; a genuine isomorphism is mc; the identity of an infinite direct sum of nonzero skyscrapers is not mc-zero; maps factoring through one constructible object are mc-zero; two truncated degree translations differ from their composite only by a constructible image. Global shtukas and Langlands over function fields (GlobalShtukasAndFunctionFieldLanglands GS.3) owns the geometric truncations, horocycle decomposition, finite core and Hecke/Satake application, and imports this formalism. Igusa varieties and torsion concentration (IgusaVarietiesAndTorsionConcentration IG.4) is a related filtered-colimit consumer, but its nearby-cycle support inequalities are not supplied by a Serre quotient and are not replanned here. No purity, arithmetic Frobenius semisimplicity or compact-cohomology finiteness follows merely from this quotient construction.

### Source findings

All findings below are worker findings awaiting an independent review. None has a review verdict. The detailed JSON includes the printed expression, correction, reason, effect and correction-search record for each. Gaps describe a missing argument, not a claim that the main theorem is false.

- E1 — Theorem1.2 p.397; (5.13) p.470; published version. Use the cardinality of each set for r±; retain the set separately if needed. Check: Derivative orders and incidence iteration exponents must be integers, and r++r−=r.
- E2 — p.397, definition of ε_r1; same issue in the corresponding arXiv v2 passage collated. Use σ_j in the second product. Check: Its bound variable is j; the required Walsh character is negative on precisely the remaining legs.
- E3 — Lemma2.6 proof p.409, subset expansion; published version. Include the empty subset in the right A(O)-invariant summand. Check: The constant monomial occurs in the expansion of the product and survives the central parity selection.
- E4 — §3.1.2 p.419, fractional representatives; published version. Include 0 among representatives modulo Z. Check: The untwisted flag and integral divisor class require the zero representative.
- E5 — §3.1.2 p.419, AL(D) dependence; published version. Use D in the dependence-on-divisor assertion. Check: The map there is AL(D); the infinity divisor belongs to the later shtuka construction.
- E6 — §3.2.4 p.425, coweights before Lemma3.7; same issue in the corresponding arXiv v2 passage collated. Append μ(−c_x^(j)) so the extra modifications remove D∞. Check: Original balance is Σμ=n degD∞. Appending the printed weights gives total 2n degD∞, whereas an ordinary Frobenius-closed chain has degree zero. The r=1,μ=−1,D∞=−Γ∞/n example already fails the printed sign.
- E7 — Lemma3.19(2) p.435; same issue in the corresponding arXiv v2 passage collated. Require D′ reduced, i.e. D′≤Σ(K); alternatively replace by its mod-two representative throughout. Check: For D′=2x, the half twist is the integral tensor twist by O(x), leaving PGL2 instability unchanged, but the printed |suppD′| is one. The proof explicitly uses multiplicity-free D′.
- E8 — Lemma3.28 proof p.442, Δ′i cases; published version. Use Ni=Ni−1 in the stationary case. Check: The three alternatives compare the ith step with the (i−1)st; Ni+1 is even out of range at the last step.
- E9 — Lemma3.28 proof p.443, extension-space dimension cases; published version. The value is 1 for Ni=Ni−1 or Ni−1+1, and 0 for Ni=Ni−1−1. The final total r−|I|/2 is unchanged. Check: When Ni rises, Δ′i=Δi has degree Ni−1+1; when Ni falls, Δ′i=Δi−1. High-degree Riemann–Roch gives respectively 1 and 0. Rises and falls occur equally often.
- E10 — §3.4.4 and §3.5 p.444, truncation index; same issue in the corresponding arXiv v2 passage collated. Handle r<#Σ∞ using the finite-type core or an ordinary nonempty HN truncation system; do not use K_r in that case. Check: Corollary3.31 proves K_r empty in this allowed parity range. Torus cycles/zero-leg inner-form examples give nonempty shtuka stacks, so the empty union cannot define their cohomology.
- E11 — Lemma3.33 p.445; same issue in the corresponding arXiv v2 passage collated. Choose a cofinal family containing the entire low-instability core, so every added stratum satisfies the high bound of Lemma3.28. Check: The proof invokes Corollary3.29, whose hypothesis is κ″>max(2g−2,0), not merely positive instability. No proof for all printed positive bounds is supplied.
- E12 — §3.5.4 p.448, three displays; same issue in the corresponding arXiv v2 passage collated. Replace by [+#I(κ)](+#I(κ)/2) after the [2r](r) normalization. Check: Corollary3.29 gives [−2r+#I](−r+#I/2). Adding [2r](r) yields the positive signs, and a local system on |I|-dimensional support needs shift +|I| to be perverse.
- E13 — §3.5.4 p.448, fixed-degree torsor; same issue in the corresponding arXiv v2 passage collated. Use Pic_X^0(k) for one fixed-degree component; Pic_X(k) acts on the union of all degree translates. Check: A line bundle of nonzero degree moves a component, so it cannot act as its fixed-degree torsor group.
- E14 — §3.5.4 p.448, translated direct sum; same issue in the corresponding arXiv v2 passage collated. Use N(κ′) in each translated summand. Check: Each summand represents a different degree component, not copies of one fixed component.
- E15 — Lemma3.37(1) proof p.450; same issue in the corresponding arXiv v2 passage collated. Also bound the transition kernels by the preceding terms of the perverse hypercohomology long exact sequence before concluding finite kernel of V≤0→V. Check: Finite successive cokernels alone do not bound the kernel of a composite of noninjective maps. Stabilization of pH^i for i≠0 supplies the missing finite-dimensional preceding terms.
- E16 — Theorem1.2 notation p.397; same issue in the corresponding arXiv v2 passage collated. Refer to (4.5); (4.6) defines Σ+. Check: The two adjacent displays define complementary level subsets.
- E17 — Definition5.4 p.466, root-forgetting conditions; published version. On A_d^flat retain a|R=b|R but remove the undefined ϑ datum; A_d restores its square root. Check: The root-forgetting scheme's listed data have no Θ_R or ϑ. The fibre-product construction makes the intended condition clear.
- E18 — Lemma5.12 proof p.477; published version. Use the ordered pair (ab,aσb) in OX′⊕OX′. Check: The target is a direct sum and both branch restrictions are needed for the Hom description.
- E19 — Proposition5.18 proof pp.486–487; published version. For the indicated vanishing argument choose degΣtilde>ρ and use H0(X,ν*M)=H0(X′,M), where degM=ρ−degΣtilde<0. Check: Negative degree of a rank-two vector bundle does not force H0=0. The stronger freely chosen auxiliary level makes the upstairs line-bundle vanishing valid; the endpoint is not claimed false.
- E20 — Theorems5.6,5.20,7.4 and Lemma5.19, pp.470,487–491,510; published version. Until the low-genus argument is supplied, use max(2g′−1+N,2g+N,3g−2+N) for the common large-degree comparison. Check: Lemma5.19 uses 2g+N, omitted in the advertised bound. When g′=g (possible for genus-one unramified covers or genus-zero covers with ρ=2), the other inequality need not imply it. Taking d sufficiently large still suffices for Hecke extension.
- E21 — Proposition6.2 p.495; published version. Use d∈Q_d. Check: Q_d is the defined set of degree quadrangles; Σ_d is not the indexing set.
- E22 — Proposition6.2(1) p.495, geometric connectedness; published version. Qualify by nonemptiness/admissibility; allow the empty N_d in all later formulas and interpret out-of-range K indices as zero. Check: Take ρ=d=0, all dij=0, and nonempty Σ−. Condition(5) selects ϕ22≠0, but its degree-zero section must vanish at Σ−. Hence that N_d is empty. §7.1 itself explicitly distinguishes N_d≠∅.
- E23 — §6.2.3 p.498, X_(D,γ̃) conditions; same issue in the corresponding arXiv v2 passage collated. Add detψ_R=0 to the object conditions. Check: Definition6.1 and Lemma2.4 require rank-one root matrices. For ϕ=[[1,1],[1,1+ϖ]], the determinant has valuation one. There are sixteen entrywise square roots of its all-ones residue but only eight with determinant zero; the omitted condition changes the weighted counting identity.
- E24 — §6.2.3 p.500, groupoid Fubini setup; published version. The function integrated before pushforward has domain G; its pushforward has domain G′. Check: The displayed sums evaluate f on objects in the fibres of G→G′.
- E25 — §7.1.1 p.506, claimed Galois cover; same issue in the corresponding arXiv v2 passage collated. Use the ordered distinct-lift configuration as the Γ_d-torsor; X′_d^circ is its S_d quotient. Check: Away from R the symmetric-power map has degree 2^d, whereas |Γ_d|=2^d d!. For d=2 these are four and eight. The associated induced-representation local system still comes from the corrected ordered torsor.
- E26 — §7.1.1 p.506 and §A.2.1 p.519, perversity terminology; same issue in the corresponding arXiv v2 passage collated. Call K the normalized unshifted IC complex; K[d] is perverse. Apply the same normalization discipline to Lhat_d. Check: Its restriction on a smooth d-dimensional open is a local system in degree zero; perversity requires shift d.
- E27 — Proposition7.1 proof p.507; published version. Use [d′]. Check: The source has dimension d′ and the proof is about the degree-d′ norm map.
- E28 — §7.2 Theorem7.5 pp.511–512; same issue in the corresponding arXiv v2 passage collated. Restrict the analytic comparison and projector algebra to H_G^(Σ∪R), and prove the excluded-place version of the density/strong-multiplicity-one argument; alternatively define and prove the missing R-local extensions. Check: The test fΣ± in §2.6 is defined only when f has no R-factor. A general H_G^Σ element cannot be combined with the fixed ramified tests by that definition.
- E29 — Theorem7.5 p.512; same issue in the corresponding arXiv v2 passage collated. Use μ,μ′∈T_(r,Σ), or explicitly fix the omitted level parameters. Check: The intersections and ε− also depend on split/inert level choices.
- E30 — §7.3.1 pp.512–513, projector substitution; same issue in the corresponding arXiv v2 passage collated. Retain μ′ on the second cycle in the projector and final comparison displays. Check: Equation(7.9) is the cross-pairing and the theorem has two independent cycle parameters; applying a projector does not equate them.
- E31 — §7.3.2 p.514, application of Theorem1.2; same issue in the corresponding arXiv v2 passage collated. Restore C=|ωX|q^(ρ/2−N)/(2(−logq)^rLAd) when ℒtwo is the introduction's product. If using §2.6's adjoint-divided symbol, first apply its conversion and remove only the duplicate adjoint denominator. Check: Theorem1.2 has this nonunit factor, and all following Fourier-summed identities must carry it to reach Theorem1.3.
- E32 — §7.3.2 p.514, final projector product; same issue in the corresponding arXiv v2 passage collated. Start at j=r1+1. Check: At r1>0 the printed ranges overlap, producing (1+σr1)(1−σr1)=0; at r1=0 they refer to σ0.
- E33 — §A.1.3 pp.515–516, fibre over a(x)=0; same issue in the corresponding arXiv v2 passage collated. The full geometric fibre is [Spec K[t]/(t²)/μ2]; only its reduced substack is Bμ2. Check: Trivialize the square line. A root section satisfies t²=0, so it has nonzero infinitesimal possibilities over dual numbers. The source's subsequent Cartesian squaring diagram yields this nonreduced fibre.
- E34 — LemmaA.8 proof p.520, general monodromy character; published version. Use χ:π1(U)→Qℓbar× for the stated arbitrary rank-one local system; inertia at R has order dividing two. Check: An unramified rank-one character may have order three (or infinite ℓ-adic image). The tensor-character proof works without imposing quadratic global monodromy.
- E35 — LemmaA.11 proof p.523, descent pullback; published version. Descend the two-factor multiplicativity isomorphism along AJ_d1×AJ_d2. Check: The target is Pic^d1×Pic^d2; the single Abel–Jacobi map lands in Pic^(d1+d2) and has the wrong domain for this pullback.
- E36 — Proposition3.4 proof p.422; published version. Use y∈Ux(R′) for the local R′-valued test point. Check: The surrounding paragraph specifies S′=SpecR′ and all homogeneous coordinates are R′-valued.
- E37 — Proposition3.4 proof p.422; published version. Replace 'interval' by 'invertible'. Check: A coordinate nonzero in the residue field is a unit in the local ring, which is why it can be normalized to one.

Three initial suspicions were discarded after checking: the expected-dimension display on p.487 already subtracts **twice** the Hecke-stack dimension; the ramified Hom determinant has the explained pole cancellation; and HbarΣ retains its Picard factor even when the shtuka cohomology happens to be finite-dimensional. These are not listed as errors. Nonrepresentable maps called “finite” remain an explicit convention/closure check, not a classified source error.

### Sanity checks and remaining work

There were 31,336 exact finite arithmetic check cases: 2,000 rank-one residue-matrix counts over F3/F5/F7/F11, four 16-versus-8 counterexamples, four dual-number root-fibre calculations, 1,826 ramified local identities, 28 Boolean idempotence checks, 769 character evaluations, 28 derivative/Walsh polynomial identities, seven cover/rank identities, 26,663 degree/eigenvalue sign checks and seven infinity-degree-balance checks.

For the determinant counterexample take ϕ=[[1,1],[1,1+ϖ]]. Its determinant is ϖ. Every root entry is ±1 modulo ϖ, giving sixteen entrywise roots, but detψ=0 requires the products on the two diagonals to agree and gives eight. For the root fibre, over K[ε]/ε² every t=bε solves t²=0, so the full fibre cannot be the reduced Bμ2. For the projector, the coefficient of σI is 2^−r(−1)^|I∩{r1+1,…,r}|; convolution squares it to itself and its character evaluation is the indicator of the desired sign tuple.

These computations test signs, definitions and counts. They do not prove smoothness, descent, the trace theorem or any higher Gross–Zagier identity. Paper schema check: ok. Intake: 3 files, 0 problems. Unit tests: 9 paper-checker and 7 source-issue tests passed. Internal checks: unique IDs, exactly-once missing-item routing, API/test coverage and theorem proof outlines passed.

#### G1: Close the Hecke-domain repair

Prove Theorem7.5 and the combined image-algebra/projector argument entirely for H_G^(Σ∪R). The YZ17 Lemma9.1/Theorem9.2 passages were read: choose all auxiliary places outside the additional finite set R, prove finite generation and Eisenstein support for the restricted algebra, and use strong multiplicity one there. Alternatively provide genuinely new R-local test operations. Do not silently claim the printed larger domain.

#### G2: Complete the finite-type and high-instability branches

Give the finite-type proof when r<#Σ∞ without empty K_r colimits. Construct a cofinal high-bound system whose added strata satisfy Lemma3.28, and write the kernel as well as cokernel bounds in Lemma3.37 from the long exact sequence. Distinguish V≤i (perverse-degree truncations followed by colimit) from finite geometric truncations.

#### G3: Read and instantiate the external geometric contracts

Read Lafforgue arXiv1209.5352 Proposition2.11/Lemme2.13, Varshavsky2004 Proposition2.16(a), Blum–Stuhler1997 Theorem3.1.4, and the cited YZ17 §6–7 local-model/horocycle proofs in their precise versions. The YZ17 octahedron and Frobenius-trace contracts have been read, but not their full recursive foundations. Verify every master-diagram factorization and the stronger auxiliary-level tangent argument.

#### G4: Root-stack and character-sheaf closure

Supply all AppendixA descent/coherence exercises, the exact 2-categorical meaning of (A.11), and the proper/quasifinite/tame replacement or convention for nonrepresentable maps called finite. Keep nilpotents in the zero-section fibre; prove the root norm and weighted Picard-groupoid counting under the corrected definitions.

#### G5: Resolve low-genus largeness endpoints

Check whether Theorems5.6/5.20/7.4 hold at their smaller printed thresholds in the g′=g cases. The checkpoint uses the sufficient common larger bound needed by Lemma5.19 and smallness; this suffices for the eventual Hecke comparison but is not a proof of each advertised endpoint.

#### G6: Finish atomic coverage and proof-source closure

Split the bundled generic constructions: Proposition3.9 smooth/DM/separated conclusions, Corollary3.22's four cases, master-diagram Definitions5.7–5.11, Lemmas3.24/3.37 and character-sheaf coherence; expand unnumbered local character/quotient/deformation inputs into declaration-sized contracts. Precisely complete the zero-/one-leg inner-form and Drinfeld comparisons. Whole-paper reading and the present item index are not a certificate of every recursive input.

#### G7: Independent verification and shared-owner reconciliation

Independently verify every source issue, including the full published/v2 collation beyond the selected checked passages. Reconcile the new root-CFT and ind-constructible extension briefs with the existing YZ17/FYZ24 cycle proposal and Bresciani24 SF.1 root-stack route. No self-review, accepted verdict or registry promotion is claimed.

Resume with G1 and G2, not another complete reading of pp.393–526. Then close the named external geometric sources and root-stack coherence contracts, finish the specified atomization, and independently verify the findings. The gate list is why this submission remains a checkpoint.

## Review (REV-PAPER-YUN-ZHANG-19, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its nine routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-YUN-ZHANG-19.md`.

- **Statements and locators:** 69 statements and 58 locators corrected.
- **Statuses:** items 116 and 120 changed from planned to missing; they are shared with YZ17/34 and /35.
- **Repairs:** the extraction's repairs are sound, except item 70's gloss. Its Theorem 7.5 repair needs one further step.
- **New items:** 50.
- **Brief:** the shtuka Part II brief now lists the corrections its layers must respect.
- **Source issues:** E1–E37 are confirmed, and three were reclassified. E38–E71 are new, including:
  - Remark 4.5 fails when Σ∞ = ∅;
  - a gap in applying Theorem 2.2 in (7.10);
  - (5.5) is not an open embedding when R ≠ ∅;
  - misprints.
