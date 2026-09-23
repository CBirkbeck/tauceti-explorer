# Independent review: BKT errata

Job: REV-ERRATA-PAPER-BAKKER-KLINGLER-TSIMERMAN-20  
Reviewer: Codex, session `codex-a71f92`, 23 September 2026  
Input author: Claude Code, session `cc-442dc5`  
Input commit: `7df732206da7737e256394a1c960a378ded16b36`  
Issue: [#1871](https://github.com/CBirkbeck/tauceti-explorer/issues/1871)

## Disposition

Complete review of the 29 entries in the errata job: **28 confirmed, E14 rejected**. No additional finding introduced. Every JSON entry has a verdict by this review job. The errata report and entries were amended in place where the proposed correction, attribution or quoted transcription needed narrowing.

Completion here means that each recorded finding has been checked. It does not mean that all gaps in the original paper/extraction have been repaired or that the paper has been formalised. Gap verdicts identify the specific missing argument under PROTOCOL §18.

The reviewer did not author the input errata or paper extraction. The bot confirmed claim comment 5795017845 for Codex — codex-a71f92, and the full issue was reread after confirmation.

## Public sources and provenance

| Source | Version / SHA-256 | Independently read |
| --- | --- | --- |
| [BKT published paper](https://par.nsf.gov/servlets/purl/10200187) | JAMS 33 (2020), pp.917–939; `b7cf457907c30c9dc1c349637e74027ce4ef038a2e0f646b7685f571d367e058` | Entire 23-page text including references; page images at the mathematical findings |
| [BKT official erratum, author copy](https://benjamin-bakker.github.io/DefArithErr.pdf) | JAMS 36 (2023), DOI 10.1090/jams/1025; `86d76a5d2443840ddcaf2c08966cd236759bade659e338e3fcdb3edcd2b61ac7` | Entire four-page text |
| [BKT main author copy](https://benjamin-bakker.github.io/DefArith.pdf) | `b559c652490eb54595e86ec063945d016dd104949a91f9d6b4616cc4e25b8c8e` | E1–E4, E7, E8 passages |
| [BKT arXiv v2](https://arxiv.org/pdf/1810.04801v2) | 22 June 2020; `9f997104c775342fa49ba54f4b4782650f1da07a3bdc1717be977f86cc4ddcdc` | E1–E4 passages and version comparison |
| [Orr–Schnell correction](https://www.math.stonybrook.edu/~cschnell/pdf/papers/correction.pdf) | Author PDF; `072a33331f6e2db326da03a8b88ca421ce8a5597a4c451fc9af6644407876afc` | §§A–C, corrected theorem and torus/semisimple examples; not a complete audit of later auxiliary lemmas |
| [BGST, Finiteness for self-dual classes](https://benjamin-bakker.github.io/finiteness.pdf) | Author PDF dated 13 December 2021; `5dd8ad61c1dab6a781bc8edad76f1df964d5a5472b413cf1e03f67f1a02a170b` | §28, Proposition 28.1 and proof, with adjacent application context |

The correction search and its inaccessible sources are described in the [errata report](../errata/PAPER-BAKKER-KLINGLER-TSIMERMAN-20.md) and in each JSON entry. The erratum's statement that the main Hodge conclusions are unaffected is not being converted into an independent proof of every intermediate step.

## Verdicts

### E1 — confirmed

Locator: Theorem 4.1, JAMS p.928, proof p.929; author p.13–14.

Independent check: with τ(z)=2i+ε exp(−(1+z)/(1−z)), take ε>0 small enough that its image lies in a quotient-injective disk for Γ(3)\H. The trivial integral rank-two local system, its holomorphic weight-one Hodge line and the standard polarization give a PVHS; transversality is automatic in weight one. The fibre at π(2i+ε/e) is EXACTLY {2πin/(2+2πin):n∈Z\{0}} on ∆*. Solving the exponential equation proves equality, not just containment; it is infinite and discrete with accumulation only at the excluded outer boundary. A definable discrete subset of R² is finite. The y>1 strip in the proof covers only |q|<exp(−2π), and Lemma 4.2 explicitly permits shrinking. Confirmed for the literal whole-disk statement. Repaired the original insufficient 'contains' argument and removed the several-variable compact-annulus shortcut. This does not refute Theorem 1.3.

### E2 — confirmed

Locator: Lemma 4.5 proof, JAMS p.930; author p.15.

Independent domain check in Definition 4.4 and the printed induction: x_1=mx_2+c>1 for c≥1 and 0<x_2<1, while for c=0 the original domain requires x_2<1/m. Thus the stated curve hypothesis on Σ_n cannot simply be applied on all of Σ_(n−1) as printed. Confirmed as a gap in this step, not as a counterexample to Lemma 4.5. Revised the correction/reason so that the stronger bounded-width input and its application are explicitly requirements, not an independently completed repair. The finite-difference sign is separately E22.

### E3 — confirmed

Locator: §4.5, JAMS p.933; author p.18.

Independent counterexample: for e′=(e_1,e_2), e=(e_2,e_1), and b=diag(1,T), T≥1, the three e′-reduction conditions hold with constant 2, and condition (3) for e holds with constant 2. But ordered condition (2) for e requires T<C″ for arbitrarily large T. Allowing finitely many orderings is explicitly used immediately afterwards. Confirmed the ordered-basis slip, with no refutation of Theorem 1.5. Corrected the quotation's version attribution: the author/arXiv texts include C among the arguments of C″; the published p.933 omits it.

### E4 — confirmed

Locator: Appendix A.1, JAMS p.934, contrasted with A.3 p.936; author p.20–22.

Read the published boundary definition and the later proof of Proposition A.2. A local boundary component is obtained by setting one corner coordinate to zero, so has dimension n−1; for [0,∞) it is a point. The later sentence on p.936 uses n−1. Confirmed the dimension misprint (Joyce's boundary with local boundary components, not an assertion that the topological boundary embeds at every corner).

### E5 — confirmed

Locator: Theorem 1.1(1), JAMS p.919; Definition 2.5 and Proposition 2.7, p.924.

Read published Theorem 1.1(1), Definition 2.5 and Proposition 2.7 and the complete official erratum. The latter explicitly changes them to fixed K. Checked the geometry behind §1.6.1 using x=2i: the K_(2i)-orbit of i is a circle with centre (5/2)i and radius 3/2; positive diagonal dilation makes its real coordinate unbounded. Finitely many standard K_i-Siegel translates cannot contain this tail: non-upper-triangular translates have bounded height and upper-triangular ones have bounded real width. The quotient-graph argument is the erratum's. Confirmed an already published correction, not a new discovery.

### E6 — confirmed

Locator: Theorem 1.1(2), JAMS p.919.

The unrestricted printed statement is expressly withdrawn by erratum §§1.1,1.3. Read Orr–Schnell's correction §§A–C: their torus and semisimple examples retain compact inclusion but fail the Cartan condition and Siegel containment. The erratum §1.6.2 explains the resulting nondefinability. Confirmed the published correction after removing 'Only': the theorem gives a sufficient class, and the examples do not prove that every map outside it is nondefinable.

### E7 — confirmed

Locator: §4.5, JAMS p.932; author p.17.

Read the original citation in the published page image, official erratum §1.5, and BGST §28 including all of Proposition 28.1 and its proof. BGST explicitly distinguishes rational Siegel sets from the cited real-group statement and assumes forward containment. Its proof combines arithmetic covering, that forward containment, and the finite Siegel-intersection property. Confirmed the erratum's citation correction, with the hypotheses now written out. This verdict does not certify every external reduction-theory input or an unconditional inverse-image assertion.

### E8 — confirmed

Locator: Lemma 2.1 first proof, JAMS p.923; author §2.1.

Checked the printed first proof and recomputed the counterexample. In Sym²(R²)⊕R, v=(I,1) has line stabilizer SO₂ because the last coordinate forces the scalar on the line to be 1. For g=diag(2,1/2) and k=[[0,−1],[1,0]], M-invariance gives p(gv)=p(kgv), whereas ggᵀ=diag(4,1/4) and (kg)(kg)ᵀ=diag(1/4,4), so gM≠kgM. Confirmed failure of the identification. Replaced the paraphrased formula by a literal short quote and limited the correction to the missing valid quotient argument.

### E9 — confirmed

Locator: Lemma 2.1 second proof, JAMS p.923.

The displayed pairs are (g,gm). Taking m=1 and g outside M already shows that the second coordinate need not lie in M. Read in the page image. Confirmed G×M must be G×G; no change to the intended equivalence relation.

### E10 — confirmed

Locator: §2.2, JAMS p.923, equation (2.3).

In equation (2.3) the fixed element has coordinates (n₀,a₀,m₀), and the image is obtained by multiplying it on the left of the variable (n,a,m). The n-component starts n₀, and the m-component is m₀m. Confirmed 'right' should be 'left'; the formula itself is unchanged.

### E11 — confirmed

Locator: Theorem 1.5, JAMS p.921.

Read Theorem 1.5 in the published page image: it quantifies R and η, but bounds |Re z| by C. The next line defines |Re z| as the supremum over coordinates. Confirmed C→R. Corrected the inherited quotation from a coordinatewise paraphrase to the printed |Re z|.

### E12 — confirmed

Locator: §4.2 after Remark 4.3, JAMS p.929.

Read the paragraph after Remark 4.3 and both parts of Theorem 1.1. The invoked conclusion is definability of π restricted to a Siegel set, which is part (1), not the quotient-morphism assertion in part (2). Confirmed, retaining the erratum's fixed-K qualification.

### E13 — confirmed

Locator: Proof following Theorem 4.8, JAMS p.931.

The proof immediately after Theorem 4.8 invokes its part (1) to establish rough monomiality and then proves the roughly polynomial assertion. Proposition 4.6 is unnumbered internally; Lemma 4.7 has precisely those two parts. Confirmed the reference should be Lemma 4.7(1).

### E14 — rejected

Locator: §4.6 heading, JAMS p.933.

Rejected as an established misprint. Theorem 1.3 is indeed the direct input cited by the proof of Theorem 4.12, but its proof uses Theorem 1.1. An expository heading may describe this indirect dependence. The original reason establishes a more immediate reference, not that the printed heading is erroneous. E16 remains a separate, specific mis-citation.

### E15 — confirmed

Locator: §5, JAMS p.933.

Theorem 1.1 has exactly two numbered parts. The §5 assertion concerns definability of a Hodge morphism and requires part (2), with the sufficient compatibility checked for Hodge morphisms in erratum Corollary 1.3. Confirmed the nonexistent '(3)' is a misprint.

### E16 — confirmed

Locator: §5, JAMS p.934, definability of Φ_S.

The sentence in §5 directly attributes definability of the period map Φ_S to Theorem 1.1, which supplies quotient structures and morphisms but does not state period-map definability. Theorem 1.3 is that assertion. Confirmed this local citation correction; unlike E14 it is a direct statement attribution, not a broad heading.

### E17 — confirmed

Locator: Appendix A.3 proof of Proposition A.2, JAMS pp.935–936.

Read the chart definition and entire proof of Proposition A.2. F(x)=x+(x²/4)sin(1/x) on (0,1) is an analytic diffeomorphism to a bounded interval because F′=1+(x/2)sin(1/x)−(1/4)cos(1/x)>1/4. The zero set of F−id is exactly {1/(nπ):n≥1}, so F is not definable in an o-minimal structure. Two analytic charts on an arc of a compact circle can have this transition despite bounded semianalytic domains. Confirmed that the immediate compatibility inference needs more control. Checked the buffered-box repair via a finite cover of the compact matching graph by analytic transition germs; compactness alone is not asserted to imply definability. Removed the unqualified claim that buffering is necessary in every possible construction.

### E18 — confirmed

Locator: §3.2 reduction to g=e, JAMS p.927.

Read the real-g morphism definition and the rational-g conjugation paragraph in §3.2. For g=diag(2^(1/4),2^(−1/4)) in SL₂(R), conjugation scales a rational root vector by sqrt(2), so need not be Q-defined. The printed order of composition is also not the correctly typed factorization. The right-translation factorization with M_g,K_g avoids this. Erratum Remark 1.1(1) states precisely the Siegel-set transport needed, so this is confirmed but reclassified as addressed by that published correction, rather than 'new'.

### E19 — confirmed

Locator: §3.2 surjective case, JAMS p.928.

Read the product equality in the p.928 image. Take the adjoint product PSL₂(R)×PSL₂(R), projection to the first factor, a product of torsion-free arithmetic lattices, and diagonal SO₂ as M′. Both intersection stabilizers are trivial. The original quotient has dimension 6−1=5, while the claimed product has dimension 3+3=6; finite-index changes do not alter this. The data can satisfy the erratum's Cartan-compatible compact conditions, so the example is not merely a repeat of E6. Confirmed the intermediate product error; the correction now explicitly requires, rather than claims to supply, a stabilizer-quotient argument. Replaced the inherited schematic equality by the printed one.

### E20 — confirmed

Locator: Lemma 4.7(1),(2) and Theorem 4.8(1),(2), JAMS p.931.

At u=0 the displayed positive two-sided monomial comparisons in Lemma 4.7 and Theorem 4.8 are impossible: the norm is zero and the positive monomial is not. Read both statements and Definition 4.4 in the images. Confirmed the omitted nonzero qualification. Retained affects=nothing in the protocol's intended-mathematics sense: the basis-vector use is nonzero; this is not a claim that the literal quantified formula includes zero correctly. Corrected the quotation to the printed superscript notation J_C^{s₁,…,sₙ}.

### E21 — confirmed

Locator: Lemma 4.7 proof, JAMS p.931, definition of B.

For a weight-k polarization, Q(v,u)=(−1)^kQ(u,v), hence B(v,u)=(−1)^k conjugate(B(u,v)). For the standard alternating form and u=(1,i), B(u,u)=−2i, which cannot be the diagonal of a Hermitian form. Confirmed the parity terminology slip. Narrowed the correction to avoid implying a missing phase in equation (4.4), where the phase is already printed.

### E22 — confirmed

Locator: Lemma 4.5 proof, JAMS p.930, finite difference F_m.

Read the displayed sum in the image and checked exactly that (1/r!)Σ_(i=0)^r(−1)^i binom(r,i)i^d is zero for d<r and (−1)^r for d=r. In particular r=1 gives f_(m,0)−f_(m,1). Confirmed the missing sign in the asserted leading-coefficient identity; its absolute-value estimate is unchanged.

### E23 — confirmed

Locator: §3.1 first paragraph, JAMS p.926.

Read §3.1 and the earlier definition of a Siegel set. The proof uses compact U_i,W_i and declares their quotient images to be open coordinate charts. Even with open pieces, finite overlap is not injectivity: for Γ(3) acting on H, a unipotent interval wider than 3 contains z and z+3 with the same quotient image. Thus a whole-piece parametrization is not automatically a chart. Confirmed only this missing local-atlas justification; the existence of a proper quotient or the fixed-K theorem is not disproved. The correction no longer implies that the local refinement has already been constructed in this review.

### E24 — confirmed

Locator: §3.1, JAMS p.926, two occurrences.

Both occurrences in §3.1 use cl(F_i), whereas the pieces just introduced are S_i and their closures. No F_i is defined. Confirmed the notation correction, independently of the chart gap E23.

### E25 — confirmed

Locator: Appendix A.2, JAMS p.935, mixed atlas transitions.

The appendix defines charts as φ_i:U_i→X and ψ_j:V_j→X, and earlier correctly gives ψ_j⁻¹∘φ_i for a transition. The mixed-atlas expression reverses both inverses and order. Read the image; confirmed the typing misprint.

### E26 — confirmed

Locator: §4.5, JAMS p.932 first line and p.933 claim.

Checked both images: §4.5 begins with S_H^b despite the n local coordinates, and the displayed claim uses H_Q despite the rational fibre V_Q fixed in §4.2. Neither b nor H_Q has been introduced as the corresponding datum. Confirmed both notation slips.

### E27 — confirmed

Locator: §1.3 and §4.2, JAMS pp.920 and 928.

The published §1.3 expressly chooses the adjoint generic Mumford–Tate group, while §4.2 treats G as acting on the original fibre. The standard representation of SL₂ does not descend to PGL₂ because −I acts nontrivially. Confirmed that a representation/presentation adapter is missing from that transition. However official erratum §1.4 now takes a Q-group inside GL(V_R), addressing the acting-group choice; amended known and the correction to credit that published change. No claim is made that the erratum spells out the comparison with the original adjoint presentation.

### E28 — confirmed

Locator: §5, JAMS pp.933–934, definition of the target Hodge locus.

The printed definition admits the identity Hodge morphism as a special image, so its union is the whole target and its pullback is all of S. In a constant variation no point has extra tensors relative to the generic fibre, so the exceptional Hodge locus of §1.4 is empty. Confirmed the literal mismatch. Kept affects=nothing for Theorem 1.6 as intended: the proof establishes algebraicity for every special inverse image, which also applies after excluding the generic image. The tensor/Mumford–Tate correspondence is identified as required input, not certified here.

### E29 — confirmed

Locator: Theorem 4.12 and proof, JAMS p.933.

Theorem 4.12 assumes an algebraic variety S, while the proof calls S×S_(Γ,G,K) smooth and uses Theorem 1.3 and the stated smooth-ambient Theorem 4.13. A singular S does not satisfy these hypotheses; no singular-source reduction occurs in the displayed proof. Confirmed a gap at this generality, not a false conclusion. The proposed resolution/stratification route is a required additional argument, not a completed descent proof in this review.

## Supplement to the explicit arguments

For E1, put w=(1+z)/(1−z). The disk maps to Re(w)>0, so |exp(−w)|<1. The equation exp(−w)=exp(−1) is equivalent to w=1+2πin for an integer n, after reindexing n. Thus z=2πin/(2+2πin), with n=0 removed on the punctured disk, and
`|z|² = π²n²/(1+π²n²) < 1`.
All accumulation is at 1. Quotient injectivity makes this the exact period-map fibre. Choose the usual polarized weight-one Hodge line corresponding to τ in the upper half-plane; the underlying local system is constant, so this is genuinely a trivial-monodromy PVHS rather than an arbitrary map into an unrelated target.

For E17, let closed semialgebraic corner boxes K_i sit inside larger analytic chart domains, with their relative interiors covering X. The matching set of pairs (a,b) in K_i×K_j having the same image in X is compact, since it is the inverse image of the diagonal in the Hausdorff space X×X. At each matching pair, the larger charts give an analytic transition extension on a neighborhood. Shrink to bounded boxes on which its components are restricted analytic; on the corresponding corner pieces, equality is given by that graph. Finitely many such boxes cover the matching set. Their intersections with K_i×K_j, finite union and projections give definable matching graphs and overlaps. The argument uses local analytic extensions AND compactness, not the false assertion that an arbitrary compact set is definable. The same comparison gives independence among these buffered choices.

For E7, BGST Proposition 28.1 is read with its actual hypothesis, not merely its conclusion. Its proof covers H(R) by Γ_H C_H S_H, uses forward containment S_H⊂A S_G after enlarging S_G, and invokes the finite Siegel-intersection property for the finitely many rational translates C_H A. It thereby produces a finite subset of H(Q) bounding S_G∩H(R). This explains why the corrected reference is rational and why its forward-containment requirement cannot be discarded.

## Changes made by the review

- E1: exact infinite discrete fibre replaces the logically insufficient containment argument; shrink-domain correction no longer invokes compact punctured annuli.
- E2, E3, E7, E8, E19, E23, E27–E29: repair obligations and scope are distinguished from completed replacement proofs.
- E6: the sufficient corrected class is not claimed necessary for every definable map.
- E14: rejected rather than treating a preferred direct reference as an established error.
- E17: the bounded analytic transition counterexample and buffered repair are distinguished; no universal necessity of a particular chart construction is asserted.
- E18 and E27: credit the relevant published erratum passages instead of calling the entire repair new.
- E3, E8, E11, E19, E20: source transcriptions/version attribution corrected.
- E21: do not imply the displayed Hodge-metric phase is absent.
- All entries: fresh correction-search provenance replaces repeated inherited claims of exhaustive absence of other corrections. All IDs, their relationship to the extraction, and the input history are preserved.

## Verification and limits

The errata validator and all 65 relevant unit tests pass. Intake file checks and a read-only registry simulation check that the three required outputs make this a finished review, that all 29 verdicts are attributed to this job, and that E14 is rejected rather than published as a confirmed error. No generated registry file, queue, label or extraction was edited.

Standard-library finite diagnostics check the matrix-orbit example, reversed-basis obstruction, empty shifted sectors, and finite-difference sign exactly (Fractions/integers). Separate floating-point sanity checks cover 400 fibre points and 999 derivative samples; the proofs above do not depend on those samples. No external CAS was used. No Lean was changed or compiled.

The review does not verify all original Schmid/CKS/Kashiwara norm-estimate inputs, re-prove the external semialgebraic quotient theorem, construct every stabilizer/chart adapter, or establish singular-source algebraicity descent. Those are explicit repair obligations in the confirmed gap records. No communication was sent to the authors.
