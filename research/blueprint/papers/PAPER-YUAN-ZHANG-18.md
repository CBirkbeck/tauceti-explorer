# Yuan–Zhang (2018): the averaged Colmez conjecture, extraction and routing

Issue [#1145](https://github.com/CBirkbeck/tauceti-explorer/issues/1145). Status: **complete**. Implementation and proof closure are not claimed.

- **Provenance.** Completed by Claude Code, session cc-442dc5, on 23 September 2026. It continues the merged Codex checkpoint (codex-a71f92), whose report follows below as history.
- **The paper.** X. Yuan and S.-W. Zhang, *On the averaged Colmez conjecture*, Ann. of Math. 187 (2018), 533–638, with the erratum in Ann. of Math. 198 (2023), 867–878.
  - The published main paper was re-fetched; its SHA-256 (29dfd5f1…) matches the checkpoint.
  - The author revision of the erratum (Erratum5.pdf, 18 December 2022) was re-fetched; its SHA-256 (18b46acd…) matches. The 12-page journal version is not openly available.
- **Items.** The result has **115 items: 6 library, 4 planned and 105 missing**. Every missing item is routed exactly once, and every numbered statement is an item.
- **Mistakes.** Twenty-three are recorded under `sourceIssues`. Only E1, the error the published erratum corrects, affects a stated result (Theorem 2.7). None affects Theorems 1.1, 1.6 or 1.7.

## This continuation (cc-442dc5)

**New items.** Seven numbered statements that the checkpoint had merged into other items now have their own:
- Proposition 3.5 and Corollary 3.6 (`level-integral`, `level-projective-system`);
- Propositions 4.2, 4.3 and 4.4 (`component-comparison`, `pdiv-comparison`, `finite-level-comparison`);
- Proposition 5.4 and Corollary 5.5 (`cotangent-tensor`, `determinant-cancellation`);
- Assumption 7.1 (`s2-assumption`), with dependencies from Theorems 7.2 and 8.6 and the §7.2 test function.

**Reclassified findings.**
- **E1** now affects a stated result. The published erratum does not prove Theorem 2.7 as printed; it proves a weaker Theorem 1, which suffices for Theorem 1.6.
- **E9** is now an error rather than a gap. The claim that exactly one of j1, j2 is an isomorphism at each point is false at the double points of the Mumford special fibre, where both are nonunits.
  - Repair: argue off those finitely many points and extend, since the surface is regular.
- **E20** is now a misprint that affects nothing. "Principal homogeneous space of T̂′" is a slip for the quotient of T̂′ by the closure of T′(Q), and the paper uses only that the fixed points form one orbit.

**Repairs checked.**
- **E4 (Theorem 2.2).** No c_p is needed. The product of |σ(x)|_p over σ: K → Q̄_p is the norm of x from K⊗Q_p. For x = τ(α) and x = τ(ᾱ) it is |N_{E⊗Q_p/Q_p}(α)|^{[K:E]}, because conjugation is an algebra automorphism of E⊗Q_p.
- **E5 (Theorem 2.3).** Enlarge K until its residue fields at p are large. Then O_E⊗O_σ is monogenic over O_σ: shift the local generators so that their reductions are coprime, then use the Chinese remainder theorem. The proof already runs over O_σ.
- **E18 (Lemma 9.4).** π is ramified at P′, but P′ is still a section over R. The level at v is unchanged, so P′ is rational over H_w^ur.

**New finding.**
- **E23.** The proof of Theorem 4.5 cites "Theorem 3.2" for Proposition 3.2.

**Gaps.**
- G1 and G3 are resolved.
- G7 is recorded as findings.
- G2 is unavailable, because the journal erratum is closed access.
- The others are deferred as cited suppliers' proofs or design work.

**Why the status is now complete.**
- Every numbered statement is an item.
- Every missing item is routed exactly once, and the mistakes are recorded.
- The remaining gaps are cited suppliers' proofs, design work, or the closed-access journal erratum.

## Mistakes found (`sourceIssues`)

- **E1** (error; affects a stated result), Main Theorem2.7 pp550; erratum §1 pp1–3, 18 December 2022 revision. *Printed:* 0→A1→A→A2→0 ⇒ 0→𝒜1→𝒜→𝒜2→0 *Correction:* Use erratum Theorem1: good reduction, nearby types and kernel graph of an OE-isomorphism of relative-different torsion. Verify the actual quaternionic isogeny has that kernel.
- **E2** (misprint; affects nothing), Author erratum p11 final Hom display, image checked; NOT collated with final journal. *Printed:* Hom_{Oπ/δπ}(A1[δπ],A2[π]) *Correction:* Use A2[δπ] in both Hom targets and consistently index by the local different δw.
- **E3** (misprint; affects nothing), Author erratum Proposition6 proof p10, image checked; NOT collated with final journal. *Printed:* rank(Ω(X,τ))=rank(Ω(Y,τ))=2 *Correction:* Replace the fixed rank 2 by their common finite rank; justify local freeness of the τ-components under the precise endomorphism assumptions.
- **E4** (error; affects the proof), Main Theorem2.2 proof pp545–546, images checked; unchanged in selected arXiv v3 §2.2. *Printed:* c_p∈Gal(Q̄_p/Q_p), τc=c_pτ for every τ *Correction:* For x in K⊗Q_p, the product of |σ(x)|_p over σ: K → Q̄_p is |N_{K⊗Q_p/Q_p}(x)|_p. With x = τ(α) and x = τ(ᾱ), both products equal |N_{E⊗Q_p/Q_p}(α)|_p^{[K:E]}, since complex conjugation is a Q_p-algebra automorphism of E⊗Q_p and so preserves the norm. Hence the product of ||φ_σ||_p is 1 without any c_p.
- **E5** (error; affects the proof), Main Theorem2.3 proof p547, image checked; same assertion in selected arXiv v3. *Printed:* OE⊗Zp=Zp[x] *Correction:* Enlarge K (the heights are invariant under base change) until every residue field of K at p contains the residue fields of the Galois closure of E and has more than [E:Q] elements. Then O_E⊗O_σ = ∏_w O_σ[t]/P_w(t); shifting each generator by a unit of O_σ makes the reductions of the P_w pairwise coprime, so the Chinese remainder theorem gives O_E⊗O_σ = O_σ[t]/P(t). Run the proof of Lemma 2.4 and Theorem 2.3 over O_σ, where R_Φ⊗O_σ = O_σ[t]/P_Φ(t) and the relative discriminant is compatible with this flat base change.
- **E6** (misprint; affects nothing), Main introduction p537 component-height display; compare corrected definition p544. *Printed:* h(Φ,τ)=½ deg_hat N(A,τ) *Correction:* Insert 1/[K:Q], as in the actual §2.2 definition.
- **E7** (misprint; affects nothing), Main Theorem2.7 proof p550 final determinant display. *Printed:* det W(A^t,τ)=W(A1^t,τ2)⊗W(A1^t,τ1) *Correction:* The second factor must be W(A2^t,τ1), matching the two summands.
- **E8** (misprint; affects nothing), Main p569 definition before Theorem4.10, image checked. *Printed:* N℘:=det W℘^t⊗det W℘^∨ *Correction:* Use N℘=det W℘^t⊗det W℘, consistently with §§3.3 and5.2.
- **E9** (error; affects the proof), Main Theorem4.10 division-case proof p570, image checked. *Printed:* j1j2=π ⇒ exactly one of j1,j2 is invertible *Correction:* Argue on the complement of the finitely many double points of the special fibre, where exactly one of j1, j2 is an isomorphism (Čerednik–Drinfeld), and on the generic fibre, where both are. There ω^{-2} and π^{-1}N^∨ agree as invertible subsheaves of N^∨⊗K. X_℘ is a regular surface, so two invertible subsheaves of the same invertible sheaf that agree off a closed set of codimension two are equal.
- **E10** (misprint; affects nothing), Main p590 c2 and c1 displays, image checked. *Printed:* c2/m=−(γ+log4π)/2; c1=c0−2mc2 *Correction:* With c2 already the global projection constant, write c1=c0−2c2.
- **E11** (error; affects the proof), Main p591 integral conjugation basis, image checked. *Printed:* m0≠0 ⇒ (OE→M, t↦tm0) is an isomorphism *Correction:* Choose an OE-module generator of the free rank-one OE lattice M, not an arbitrary nonzero vector.
- **E12** (misprint; affects nothing), Main Lemma6.1 proof p583 Vandermonde step. *Printed:* N_i≠N_j ⇒ (1+iN_i)^−[F:Q]≠(1+iN_j)^−[F:Q] *Correction:* Choose distinct positive sufficiently divisible integers N; their absolute values then make the displayed powers distinct.
- **E13** (error; affects the proof), Main pp599–600 Lemma7.6 proof; correction to YZZ13 Proposition6.10(1). *Printed:* W°_{a,v}(s), a=0 *Correction:* Use the separately normalized zero-index Whittaker coefficient derived here; the cited formula applies to a≠0.
- **E14** (misprint; affects nothing), Main p604 end of Lemma7.6, ψ2 calculation. *Printed:* cψ1(1,y,u)=0 *Correction:* Replace ψ1 by ψ2 in the three conclusions of the ψ2 computation.
- **E15** (error; affects the proof), Main p618 Lemma8.7; correction to YZZ13 Lemma8.6/Proposition8.7 and Zha01 Lemma5.5.2. *Printed:* m(b,β), c=0, Ev/Fv ramified *Correction:* Use m(b,β)=½v(Dv λ(b)) on the stated unit-norm support, including wild ramification.
- **E16** (misprint; affects nothing), Main ordinary case pp614–615, images checked. *Printed:* m_v̄=½(m_ν̄2+m_ν̄2) *Correction:* Use ½(m_ν̄1+m_ν̄2); label the lower-unipotent formula m_ν̄2 and its following extension i_ν̄2.
- **E17** (gap; affects the proof), Main Lemma8.9 proof p623, image checked. *Printed:* t2∈Fv*GL2(OFv) ⇒ t2 fixes every component *Correction:* Supply an invariant/equivariant vertical-divisor lift or a quotient/descent argument establishing the needed intersection invariance.
- **E18** (error; affects the proof), Main p633 paragraph after Lemma9.4, image checked. *Printed:* π is étale *Correction:* π ramifies at P' with index e. The section property holds because U'_v = U_v: the CM point P' is then defined over a class field of E that is unramified at w over H, so P' is H_w^ur-rational. Its closure in the proper R-scheme X_{U',R} is therefore the image of a section Spec R → X_{U',R}.
- **E19** (misprint; affects nothing), Main Proposition3.2 proof p554 last paragraph, image checked. *Printed:* dim(A/S)=2g; M_{2g,d,n} *Correction:* In the full B'-module realization V'=B', use dimension 4g and the corresponding Siegel moduli dimension. Reserve 2g for the Morita-reduced E-PEL realization of §3.3.
- **E20** (misprint; affects nothing), Main §3.3 CM points p558. *Printed:* X'^{T'} is a T̂'-torsor *Correction:* State the orbit using the effective torus quotient, with the rational stabilizer (and its closure in the adelic action) accounted for.
- **E21** (misprint; affects nothing), Main §6.1 p578 opening quadratic-space convention. *Printed:* V over R; V(A) *Correction:* Take the quadratic space over F, positive definite at every real place; its local real fibers are over R.
- **E22** (misprint; affects nothing), Main p598 proof of Lemma7.4, before restricting to v(a)≥0. *Printed:* v(a)<0 does affect our final result *Correction:* Insert 'not': the negative-valuation range does not affect the near-diagonal restriction being computed.
- **E23** (misprint; affects nothing), Main Theorem 4.5 proof p565, first sentence. *Printed:* By Proposition 4.4, Theorem 3.2 and Corollary 3.6 *Correction:* Read Proposition 3.2.

The reasons and the places searched are in the JSON.

## Gaps: status after this continuation

- **G1, Atomic extraction and source closure** (resolved). Every numbered statement of the main paper and the author erratum is now its own item: Propositions 3.5, 4.2, 4.3, 4.4, 5.4, Corollaries 3.6 and 5.5 and Assumption 7.1 are split out. Remarks 1.2–1.5, 3.3, 3.4, 4.8 and 7.7 state no new result; Remark 8.10 is in vertical-pseudo. Finer constants and consumer edges are design work for implementation.
- **G2, Final erratum collation** (unavailable). The 12-page journal erratum (Annals 198 (2023) 867–878) is not openly available: its Annals page links no PDF and Unpaywall has no copy. The author revision of 18 December 2022, whose date matches the journal record, was read in full; E2 and E3 are scoped to it.
- **G3, CM integral de Rham and monogenic repair** (resolved). E4 and E5 now have checked repairs (a norm argument, and monogenicity over O_σ after enlarging K). Colmez II.1.2 and CCO Theorem 3.7.4 stay prerequisites for their suppliers.
- **G4, Kisin conventions and dyadic closure** (deferred). Kisin's classification and the p = 2 inputs are cited suppliers' proofs.
- **G5, Integral quaternionic and PEL geometry** (deferred). Carayol, Boutot–Carayol and Vignéras are cited suppliers. E9 now has an extension argument, E19 affects nothing and E20 is reclassified to a misprint.
- **G6, YZZ analytic and arithmetic proof leaves** (deferred). The YZZ13 analytic and height chapters are a cited supplier; E13 and E15 record the corrections this paper makes to them.
- **G7, Wild lifting and vertical adjunction repairs** (recorded). E17 and E18 are recorded, and E18 now has a section argument. Gross 1986 is a cited supplier for E15.
- **G8, Route and library refinement** (deferred). Route and library refinement is design work.
- **G9, Executable contracts and independent verification** (deferred). Executable contracts and independent review are later work.

## Validation (cc-442dc5)

`scripts/check_paper.py` and `research/blueprint/intake.py check-files` pass on the result. Item ids are unique, every missing item is routed exactly once, and every `dependsOn` target exists. No Lean deliverable is part of a paper job.

## Checkpoint history (unchanged)

The report of the earlier checkpoint follows as it was written. Where it says *partial* or *open*, or gives the earlier classification of E1, E9 or E20, this continuation supersedes it.

## Yuan–Zhang: averaged Colmez, with the corrected nearby-isogeny argument

Worker: Codex — codex-a71f92. Issue #1145. Status: **partial checkpoint**.

The published 106-page main paper and the complete revised author erratum have been read. This is not a claim of complete extraction or source closure. The JSON contains 110 items (6 library, 4 planned, 100 missing), nine nonduplicating routes, planning APIs and two tests for all 38 introduced carriers, 72 theorem outlines, and 22 source findings awaiting independent review. Some compound results still need atomic splitting and the original external proofs remain open.

### The result and its normalization

Let E/F be CM, [F:Q]=g, and η its quadratic Hecke character. With the squared Faltings metric
`||α||²=(2π)^−g ∫|α∧bar α|`, the theorem is

`2^−g ΣΦ h(Φ) = −½ Lf'(0,η)/Lf(0,η) −¼ log(dE/F dF).`

The sum is over all 2^g CM types. Lf is the finite L-function, dE/F is the norm of the relative discriminant, and dE=dF² dE/F. The formula does not assert the individual Colmez conjecture.

Two normalizations are deliberately different. The abelian component height is `deg_hat N(A,τ)/(2[K:Q])`; the quaternionic point height is relative to F, with denominator `[F(P):F]`. The Petersson norm is `||dz||=2 Im z`. CM-orbit integrals are normalized averages, while the separate unit index is `e=[OE*:OF*]`. None of these factors can be inferred from the word “height”.

### What was read

| Source | Provenance and scope |
| --- | --- |
| [Published main paper](https://annals.math.princeton.edu/wp-content/uploads/annals-v187-n2-p04-p.pdf) | Annals187(2018),533–638; all106pages, including every proof and reference. SHA256 `29dfd5f19dec401116f1eaf0305305acf5f2fc68aa3c90d4eb6e5222de50d507`. |
| [Revised author erratum](https://web.math.princeton.edu/~shouwu/publications/Erratum5.pdf) | Dated18December2022; all11pages read. SHA256 `18b46acd0f6be352d4bc5b4d7797650be3e228712e13de94bbb45ec25b576c91`. |
| [Publisher erratum record](https://annals.math.princeton.edu/2023/198-2/p08) | Confirms revised18December2022, accepted21April2023, published31August2023, journal pp867–878. The final12-page journal text has **not** been collated. |
| [arXiv v3](https://arxiv.org/pdf/1507.06903v3) | Only selected §2.2 and the appended November2021 erratum opening/application were compared. SHA256 `d6184c74703906c6c9a8a2ba9c62924bbf4e131e7a72d3766f54f209c61d1622`. No whole-v3 reading claim. |

Acquired/read22–23September2026. The final journal erratum PDF was not obtained from the publisher endpoint; the author revision matches its recorded revision date, not necessarily every final typesetting correction. Older author files Erratum.pdf and Erratum3.pdf were listed but not read.

Crucially, the latest arXiv file appends an **older** erratum. Its kernel-support hypothesis is not the graph-of-different-torsion hypothesis of the later revision. Never substitute “latest arXiv” for “latest correction”.

Continuous main-paper reading ledger: text1–5862, printed533–638. The detailed block ledger is in the JSON. The erratum ledger covers text1–553. Images were additionally inspected for printed545–547,554,569–570,590–591,614–615,623,633 and author-erratum10–11. Other minor index findings were checked in the extracted text and still need final image/journal review. External references are not counted as read merely because their citation was read.

### Proof map

The two branches join only after the corrected isogeny hypothesis is established:

```text
CM components + reflex discriminants
  → nearby-pair averaging
  → actual quaternionic graph kernel + revised erratum
  → PEL/quaternionic determinant-line comparison
  → average h = ½ h_L(P) −¼ log(dB dF)

Weil/Whittaker derivatives + arithmetic height series
  → local singularity subtraction and vertical corrections
  → pseudo-theta weight-one cancellation
  → i0/e = Lf'/Lf +½ log(dE/F / dB)
  → residue/Green arithmetic adjunction
  → h_L(P) = −Lf'/Lf +½ log(dB / dE/F)

Both branches → cancellation of dB → averaged Colmez
```

#### The corrected Part I

The complex hermitian pairing between invariant differentials of A and its dual is decomposed by embeddings. The associated determinant line N(A,τ) must carry its dual-conjugate action and its normalized arithmetic degree. Component-height invariance compares an isogeny with its dual. The printed local-conjugation automorphism argument needs repair (E4); the global embedding product is the relevant invariant.

The reflex trace quotient is not merely a reflex field: RΦ is an integral order in a quotient of EΦ⊗E, and its discriminant enters the difference between the total height and the sum of component heights. The Vandermonde determinant exists in Mathlib, but it does not make OE⊗Zp monogenic. E5 gives a concrete counterexample; descent from a suitable local polynomial presentation remains a required proof.

The original Theorem2.7 passes a short exact sequence to Néron models. That operation is not generally exact. The revised theorem instead requires an OE-isogeny A1×A2→A whose kernel is the graph of an isomorphism of the **relative-different torsion** of A1 and A2, with nearby CM types and good reduction over the specified field.

The repair is substantive. Over the completed maximal-unramified local base, different-torsion of formal CM groups of possibly different types is identified using explicit Kisin modules. Their conjugate embedding factors become equal modulo the different. The resulting group kernel is self-Cartier-dual and its OE action is invariant under conjugation. The two local differential lengths therefore cancel in the height variation. Both hypotheses are needed.

The actual quaternionic lattice quotient satisfies the repaired graph condition. At B-ramified primes the lattice splits and the kernel vanishes. At B-split primes, identify OB with EndOF(OE) and solve
`a+b=x, aϖ+b barϖ=y`.
The extra generator is `(ϖ−barϖ)^−1(1−j)`, and both projections of the quotient give the different-torsion group. This is an integral assertion; a rational conjugacy theorem alone does not suffice.

The PEL comparison then passes through X', X and X''. The full B'=B⊗E realization and its Morita-reduced E realization must remain distinct: their abelian dimensions are4g and2g respectively. The torus bridge is a contracted product, and the tensor identity is first a statement about associated Tate sheaves. Extending it integrally requires exact Hodge–Tate weights and filtration compatibility, including p=2.

At large level the model is normal and Q-factorial after the specified base change, not automatically regular. The Hodge Q-line is obtained by norm descent and equals the **dualizing** sheaf at suitable small local level. At a node it cannot be replaced by a locally free Kähler-differential sheaf without proof. The determinant line in Theorem4.10 has a printed dual error (E8), and the division-case unit argument needs a nodal extension justification (E9).

#### Part II and the local table

A pseudo-theta function is not assumed automorphic. It uses V0⊂V1⊂V, the ambient Weil representation outside a finite nonarchimedean bad set, and controlled local functions at the bad set. Nonsingularity permits associated outer and inner **usual** theta series, with their own quadratic-space Weil actions. Lemma6.1 separates codimensions by a Vandermonde argument. Distinct positive sufficiently divisible unipotent parameters work; arbitrary distinct integers need not (E12).

Holomorphic projection requires the two-place condition at S2, not merely vanishing of one function at the identity. The finite L-constant survives because the stronger degeneracy used in the older Gross–Zagier setting would kill precisely the self-intersections needed here.

| Local branch | Essential distinction |
| --- | --- |
| Inert E, split B | Norm parity gives a sharp shell cutoff; m has the +(1/2) correction. |
| Ramified E, split B | Relative-different exponent enters m; the α correction cancels only after the zero Whittaker term is computed with its own normalization. Wild primes are included. |
| Inert E, division B | Test function is on OB*; m comes from the formal Drinfeld upper half-plane. |
| Split E | Half-sum of upper/lower unipotent multiplicities; extended diagonal pairing is zero. |
| S2 | Each of the two special Hecke test-function summands must be checked. |
| Archimedean | Green kernels use constant Laurent coefficients at s=0, not evaluation at a pole. |

The source explicitly corrects two older inputs: YZZ's a=0 Whittaker normalization (E13) and the wildly ramified multiplicity inherited from Zha01/YZZ (E15). A formalizer must carry those corrections into imported lemmas.

The actual self-intersection i(P,P), the extended local diagonal iv(P,P), and modified i0=i−Σiv logNv are different objects. The diagonal multiplicity is Ωφ/e. Omitting it changes the constant in the final theorem.

After subtracting analytic and geometric singularities, the difference is a finite sum of nonsingular pseudo-theta series. The weight-one relation has coefficient
`log(dF dB)+2i0/e−(2Lf'/Lf+log(dE/dF))`.
A nonzero E-theta constant term forces this coefficient to vanish. One cannot use the ambient B-Weil action in that nonvanishing calculation.

Adjunction is a residue comparison for `LU⊗O(P/e)`. At infinity,
`Q0(t)=½log((t+1)/(t−1))`
cancels the Petersson singularity exactly. At finite places, a sufficiently small away-v cover realizes the extended diagonal as a proper intersection; the residue lattice has index iw/e. The printed assertion that this coarse cover is étale conflicts with its ramification e (E18) and must be replaced by a genuine CM-section argument. The vertical lift invariance in Lemma8.9 also needs repair (E17).

### Ownership and reuse

Baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Atlas screen at `000051df2cad918be6c4bbebe2442925a0bddcd6`.

The six library rows cite declarations actually opened at those pins. They do not upgrade nearby missing constructions: Cartier duality does not construct p-divisible CM groups; field-valued abelian varieties do not construct Néron models; real gamma factors do not supply a general Hecke functional equation.

Read the relevant accepted audits for R35, CM, GZ, R18, MP, AL and R11. R07's selected stages have no accepted audit entry in this snapshot, so their absence was not treated as an audit verdict. The direct pinned search found no Faltings-height, CM-type, Kisin-module, pseudo-theta or arithmetic-degree implementation. Negative search remains bounded evidence, not a proof that every possible synonym is absent.

| Route | Items | Why |
| --- | ---: | --- |
| ArakelovGeometryAndAbelianHeights (source) | 6 | Generic hermitian degree, Faltings metric, stable height and isogeny differential-length interfaces remain with R35; CM-only endpoint layers use the existing proposed CM Part II. |
| ComplexMultiplicationAndExplicitReciprocity (source) | 2 | CM types/reflex orders, reciprocity dictionaries and reduction interfaces belong here; import generic reciprocity from ShimuraVarieties V5, do not reprove it here. |
| HilbertModularVarietiesAndShimuraCurves (source) | 23 | Specialize the canonical quaternionic tower, integral PEL comparisons, p-divisible sheaves and bad-prime uniformization in their existing layers, retaining level/discriminant conditions. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory (source) | 10 | Integral and torsion Breuil–Kisin modules, formal CM p-divisible groups, Cartier-duality adapters and different-torsion comparisons extend these planned integral classification/deformation layers. R07 has no accepted audit entry in this snapshot; direct pinned-library search is recorded. |
| GrossZagierAndArithmeticHeights (source) | 46 | The existing kernel and local arithmetic identities explicitly own self-intersections, vertical corrections, normalized Whittaker derivatives and arithmetic adjunction. Preserve this general owner; the Colmez assembly imports these results. |
| MetaplecticAutomorphicForms (source) | 3 | Extended adelic Weil action, theta convergence and local-global sections belong to the shared theta supplier; arithmetic comparison remains GZ.6–7. |
| AutomorphicLFunctionsAndLocalFactors (source) | 1 | Quadratic Hecke L-function continuation, functional equation and finite/completed normalization use the existing Tate-theory supplier. |
| NeronModelsAndSemistableAbelianVarieties (source) | 1 | Good-reduction models and functorial extension use R11.1, never an unproved exactness functor. |
| ComplexMultiplicationAndExplicitReciprocityPartII (part-ii) | 12 | Reuse the pending Part II ID and title from PAPER-TSIMERMAN-18; its brief explicitly requests the dedicated averaged-Colmez proof from #1143/#1145. Add that proof branch here rather than create a competing CM-height roadmap. The existing quantitative/orbit branches and AGHMP18 alternative proof remain separate consumers/suppliers. |

The proposed CM Part II already exists as a **route** in PAPER-TSIMERMAN-18, not as a completed theorem or a new stage. Its brief specifically asks the dedicated #1143/#1145 jobs for the averaged-Colmez proof. This extraction reuses that ID and adds the corrected proof branch. Its quantitative Galois-orbit branch is not re-planned. AGHMP18 is an independent proof and must share the endpoint/interface, not be silently substituted for an unread Yuan–Zhang argument.

The Arakelov Part II proposed by PAPER-YUAN-26 concerns quasi-projective adelic geometry. It is not a reason to create another copy of CM heights. General reciprocity remains with ShimuraVarieties V5; CM.2 supplies the dictionary. General local-lifting work must coordinate the already proposed finite-flat Lubin–Tate direction.

Suggested implementation files are planning hints, not deliverables:

- ArakelovGeometryAndAbelianHeights: `TauCeti/Arakelov/CMComponentHeight.lean`.
- ComplexMultiplicationAndExplicitReciprocity: `TauCeti/NumberTheory/ComplexMultiplication/Types.lean`.
- HilbertModularVarietiesAndShimuraCurves: `TauCeti/ArithmeticGeometry/ShimuraCurve/IntegralHodge.lean`.
- FiniteFlatGroupsAndIntegralPadicHodgeTheory: `TauCeti/ArithmeticGeometry/PadicHodge/CMKisin.lean`.
- GrossZagierAndArithmeticHeights: `TauCeti/ArithmeticGeometry/ShimuraCurve/ArithmeticAdjunction.lean`.
- MetaplecticAutomorphicForms: `TauCeti/NumberTheory/Automorphic/ExtendedTheta.lean`.
- AutomorphicLFunctionsAndLocalFactors: `TauCeti/NumberTheory/LFunction/QuadraticHecke.lean`.
- NeronModelsAndSemistableAbelianVarieties: `TauCeti/AlgebraicGeometry/AbelianScheme/InvariantDifferential.lean`.
- ComplexMultiplicationAndExplicitReciprocityPartII: `TauCeti/NumberTheory/ComplexMultiplication/AveragedColmez.lean`.

### API and acceptance obligations

The JSON is the authoritative item inventory. All38 definitions/constructions have a carrier-specific API and at least two tests. Tests include field-extension normalization, empty versus zero truncation, ineffective centers, full versus Morita dimension, zero different torsion at unramified primes, two-place degeneracy, diagonal omission, Frobenius-component indexing and dualizing versus Kähler sheaves.

Proposed planet names are the mathematical item names (“Corrected nearby-isogeny identity”, “CM-type independence modulo the different”, “Arithmetic adjunction for the CM point”), not source locators. A later blueprint must split the remaining compound contracts, write typed declarations and complete imports before compilation is claimed.

### Source findings

The following are worker findings, **not independently confirmed errata**. “New” means no correction was found in the stated limited search; it is not a priority or novelty claim. E2/E3 concern only the author erratum revision until final-journal collation. E9/E17 are proof gaps, not claims that the main results are false. Printed mathematical assertions in the JSON are transcribed with notation normalized.

#### E1 — error

Main Theorem2.7 pp550; erratum §1 pp1–3, 18 December 2022 revision.

Correction: Use erratum Theorem1: good reduction, nearby types and kernel graph of an OE-isomorphism of relative-different torsion. Verify the actual quaternionic isogeny has that kernel.

Reason: Néron models need not preserve a short exact sequence; authors cite BLR Example8 p190. The corrected theorem is weaker and suffices for main Theorem1.6. Do not assert the original unrestricted theorem disproved by this proof failure.

Known: Published erratum, Annals198(2023)867–878, DOI10.4007/annals.2023.198.2.8; later author revision read. Affects: the proof.

#### E2 — misprint

Author erratum p11 final Hom display, image checked; NOT collated with final journal.

Correction: Use A2[δπ] in both Hom targets and consistently index by the local different δw.

Reason: The preceding and following isomorphisms are on different torsion; A2[π] is a different group scheme. Scope is this author revision only.

Known: new Affects: nothing.

#### E3 — misprint

Author erratum Proposition6 proof p10, image checked; NOT collated with final journal.

Correction: Replace the fixed rank 2 by their common finite rank; justify local freeness of the τ-components under the precise endomorphism assumptions.

Reason: The proposition permits different dimensions and τ multiplicities; an isogeny preserves the generic multiplicity. The determinant-length argument needs equal ranks, not rank two.

Known: new Affects: nothing.

#### E4 — error

Main Theorem2.2 proof pp545–546, images checked; unchanged in selected arXiv v3 §2.2.

Correction: Cancel the product by reindexing all embeddings through global CM conjugation (or the norm of E⊗Qp), not by a single local absolute Galois automorphism.

Reason: Take E=Q(i), p=5. X²+1 has a simple root mod5 and hence i∈Q5 under either local embedding. Every Q5-automorphism fixes it, whereas conjugation sends it to −i. The required c_p cannot exist.

Known: new Affects: the proof.

#### E5 — error

Main Theorem2.3 proof p547, image checked; same assertion in selected arXiv v3.

Correction: Work factorwise or first make a sufficiently large finite unramified scalar extension, prove monogenicity there, and descend the discriminant identity; this descent is still a required proof leaf.

Reason: For CM E=Q(√17,√−7), p=2 splits in both quadratic factors (both discriminants are 1 mod8), hence OE⊗Z2≃Z2^4. Its reduction F2^4 is not monogenic: every element is idempotent and generates an algebra with at most four elements, not sixteen.

Known: new Affects: the proof.

#### E6 — misprint

Main introduction p537 component-height display; compare corrected definition p544.

Correction: Insert 1/[K:Q], as in the actual §2.2 definition.

Reason: Unnormalized arithmetic degree multiplies under field extension. The body uses h=deg_hat N/(2[K:Q]); no new convention is introduced in the introduction.

Known: new Affects: nothing.

#### E7 — misprint

Main Theorem2.7 proof p550 final determinant display.

Correction: The second factor must be W(A2^t,τ1), matching the two summands.

Reason: The product has the two distinct CM factors A1,A2. This entire proof is superseded by E1, so it must not be rehabilitated by fixing this index alone.

Known: new Affects: nothing.

#### E8 — misprint

Main p569 definition before Theorem4.10, image checked.

Correction: Use N℘=det W℘^t⊗det W℘, consistently with §§3.3 and5.2.

Reason: The displayed map det W^t→det W^∨⊗ω² gives det W^t⊗det W→ω² after tensoring by det W, not by its dual.

Known: new Affects: nothing.

#### E9 — gap

Main Theorem4.10 division-case proof p570, image checked.

Correction: Prove the claimed line-bundle identity on the smooth locus using the special formal-module geometry, then justify extension across codimension-two nodes on the regular model; alternatively compute the nodal deformation explicitly.

Reason: The relation alone is insufficient: in O[[x,y]]/(xy−π) at the closed node, x and y are both nonunits. This is a counterexample to the inference, not to the stated Kodaira–Spencer theorem. The proposed extension argument has not been source-closed.

Known: new Affects: the proof.

#### E10 — misprint

Main p590 c2 and c1 displays, image checked.

Correction: With c2 already the global projection constant, write c1=c0−2c2.

Reason: Substitution into the printed equality otherwise gives m² rather than m. The subsequent finite-L formula c1=2Lf'/Lf+log(dE/dF) is consistent with the corrected factor.

Known: new Affects: nothing.

#### E11 — error

Main p591 integral conjugation basis, image checked.

Correction: Choose an OE-module generator of the free rank-one OE lattice M, not an arbitrary nonzero vector.

Reason: Multiplying a generator by π gives a nonzero vector whose image is πM, not M. In the split algebra a vector zero in one factor may even fail injectivity. Freeness supplies the correct primitive choice.

Known: new Affects: the proof.

#### E12 — misprint

Main Lemma6.1 proof p583 Vandermonde step.

Correction: Choose distinct positive sufficiently divisible integers N; their absolute values then make the displayed powers distinct.

Reason: For degree4 and N=±1, both fourth powers equal −4. The proof only needs a suitable selection, so positive choices repair it. This test addresses the printed arbitrary-distinct claim, not failure of the lemma.

Known: new Affects: nothing.

#### E13 — error

Main pp599–600 Lemma7.6 proof; correction to YZZ13 Proposition6.10(1).

Correction: Use the separately normalized zero-index Whittaker coefficient derived here; the cited formula applies to a≠0.

Reason: The main authors explicitly explain the normalization mismatch and redo W0. The external book was not re-read here; finding is attributed to this published correction.

Known: Yuan–Zhang 2018 pp599–600 explicitly correct YZZ13 Proposition6.10(1). Affects: the proof.

#### E14 — misprint

Main p604 end of Lemma7.6, ψ2 calculation.

Correction: Replace ψ1 by ψ2 in the three conclusions of the ψ2 computation.

Reason: The displayed series being differentiated is c-tilde_ψ2; the substitution zi=π^−1 zi' is its case, while ψ1 was completed in the preceding paragraph.

Known: new Affects: nothing.

#### E15 — error

Main p618 Lemma8.7; correction to YZZ13 Lemma8.6/Proposition8.7 and Zha01 Lemma5.5.2.

Correction: Use m(b,β)=½v(Dv λ(b)) on the stated unit-norm support, including wild ramification.

Reason: The main authors explicitly identify the inherited wild-ramification error and point to Gross's canonical lifting. This checkpoint records that correction but has not reconstructed Gross's original proof.

Known: Yuan–Zhang 2018 p618; authors state the erroneous case did not enter the main YZZ13 result. Affects: the proof.

#### E16 — misprint

Main ordinary case pp614–615, images checked.

Correction: Use ½(m_ν̄1+m_ν̄2); label the lower-unipotent formula m_ν̄2 and its following extension i_ν̄2.

Reason: There are two distinct split primes and upper/lower supports. Proposition8.5 itself uses the correct half-sum.

Known: new Affects: nothing.

#### E17 — gap

Main Lemma8.9 proof p623, image checked.

Correction: Supply an invariant/equivariant vertical-divisor lift or a quotient/descent argument establishing the needed intersection invariance.

Reason: Fv*GL2(OFv) fixes the standard tree vertex, not all vertices. An unramified quadratic torus unit reducing to [[0,1],[1,1]] over F2 cyclically permutes its three neighbors. A finite arbitrarily selected lift of components is not automatically invariant. No claim is made that Lemma8.9 itself is false.

Known: new Affects: the proof.

#### E18 — error

Main p633 paragraph after Lemma9.4, image checked.

Correction: Do not assert global étaleness of this coarse-level cover; prove that the selected CM lift is a section over R using its field of definition and unchanged local level.

Reason: The same paragraph assigns multiplicity e to P' in π*P. At elliptic CM points e>1, this is ramification, incompatible with étaleness. The section assertion needs its own justification.

Known: new Affects: the proof.

#### E19 — misprint

Main Proposition3.2 proof p554 last paragraph, image checked.

Correction: In the full B'-module realization V'=B', use dimension 4g and the corresponding Siegel moduli dimension. Reserve 2g for the Morita-reduced E-PEL realization of §3.3.

Reason: [F:Q]=g, [E:Q]=2g, rank_E B'=4, so H1 has Q-rank8g and A has dimension4g. The level condition identifies H1 with that lattice.

Known: new Affects: nothing.

#### E20 — error

Main §3.3 CM points p558.

Correction: State the orbit using the effective torus quotient, with the rational stabilizer (and its closure in the adelic action) accounted for.

Reason: In the double quotient, rational torus elements fix the distinguished complex point and act trivially on its adelic orbit after left quotienting. Thus the unquotiented adelic torus action is not free. The exact scheme/tower quotient is a remaining reconciliation task.

Known: new Affects: the proof.

#### E21 — misprint

Main §6.1 p578 opening quadratic-space convention.

Correction: Take the quadratic space over F, positive definite at every real place; its local real fibers are over R.

Reason: V(F), V(A) and the rational theta sum require an F-space, as stated explicitly again in §6.2.

Known: new Affects: nothing.

#### E22 — misprint

Main p598 proof of Lemma7.4, before restricting to v(a)≥0.

Correction: Insert 'not': the negative-valuation range does not affect the near-diagonal restriction being computed.

Reason: The immediately following step discards that range and assumes v(a)≥0. The desired restriction concerns a→0, hence large positive valuation; the omitted bounded valuation range only changes a Schwartz function away from the diagonal.

Known: new Affects: nothing.

Search record: publisher original/erratum records; author publication directory and whole Erratum5.pdf; selected arXiv v3 passages; targeted correction searches on23September2026. Older author errata and the final journal erratum were not exhaustively collated. No author contact or external errata notification was made.

### Exact diagnostic checks

A scratch Python/Fraction check ran150005 finite/rational cases successfully; this is not a formal proof. Script SHA256:
`e511ddda809a354822ebfec5f97305e12f5e368f0fc6913bd8cb695c7515ef36`.

| Diagnostic | Cases | Reproduction |
| --- | ---: | --- |
| Nearby-type cube | 510 | For g=1..8 enumerate bitstrings; each vertex has g neighbors and total unordered edges g·2^(g−1). |
| Nonmonogenic product | 16 | For every a∈F2^4 enumerate c+da; there are at most4 values, not16. |
| Split quadratic roots | 21 | Count roots of x²=17 and x²=−7 modulo2^n, n=3..12; check simple root of x²+1 mod5. These finite checks accompany the stated Hensel argument. |
| Tree neighbor action | 3 | Matrix [[0,1],[1,1]] over F2 permutes the three lines without fixing any. |
| Vandermonde warning | 1 | (1+i)^4=(1−i)^4=−4. |
| Split norm residue count | 137277 | q=2,3,5,7 and m=1..3: count pairs modulo q^m with xy=0; answer q^m+m(q−1)q^(m−1). |
| Quadratic lattice graph | 11552 | D=2,3,5, enumerate x0,x1,y0,y1 in0..2D−1; solve a+b=x, (a−b)√D=y with exact fractions; projections of fractional classes are bijective and quotient size4D. D=5 is a lattice toy, not a claim that Z[√5] is maximal. |
| Local cancellation | 624 | Exact rational coefficients after dividing by logq, q=2,3,5,7; different/base exponents retained and arbitrary α samples cancel. |
| Final discriminant | 1 | Symbolic coefficient vectors show dB cancels between Theorems1.6 and1.7. |

These tests refute selected erroneous intermediate assertions and catch factors; they do not certify the analytic continuation, integral classification, nodal extension or corrected main proof.

### Remaining gates and resume order

#### G1 — Atomic extraction and source closure

Main pp533–638 and the full 11-page revised author erratum are read; this checkpoint has 110 substantive items, but some multi-part Propositions3.2/3.5/4.2–4.4/5.4 and Theorems4.7/4.9/7.2/8.6 still need separate atomic declarations, all exact moduli determinants, local Haar constants and explicit consumer edges. Introductory consequences/previous special cases and every original external prerequisite are not fully decomposed. Do not mark complete from inventory count.

#### G2 — Final erratum collation

The Annals record gives revision18Dec2022 matching Erratum5.pdf, but journal pp867–878 have12pages and author PDF11. Obtain the final published text and collate all hypotheses, formulas and E2/E3 before attributing those author-version slips to the journal. Latest arXiv v3 appends an older November2021 erratum with a different kernel condition and is not the final correction.

#### G3 — CM integral de Rham and monogenic repair

Acquire Colmez1993 II.1.2, CCO2014 Theorem3.7.4 and the exact local CM-group uniqueness statements. Close E4 by global embedding permutation and E5 by factorwise/unramified monogenic descent, including the discriminant comparison. Finite residue checks certify only the counterexamples, not those repairs.

#### G4 — Kisin conventions and dyadic closure

Read Ki09 Theorems1.2.8/1.3.9 and Ki10 Hodge-filtration comparison, plus the precise Kim/Lau/Liu p=2 input used by main §5.2. Prove covariance, formal/connected nilpotence, torsion projective dimension, Frobenius index permutation, OE-linear Cartier dual and all generic-isomorphism extension. No e<p−1 substitute works at p=2.

#### G5 — Integral quaternionic and PEL geometry

Read Carayol1986 and Boutot–Carayol1991 at the cited sections, and VignérasIII.3.2 p44 integral-conjugacy statement. Reconcile E9 at nodes, E19 PEL dimension and E20 effective torus quotient. Verify tensor HT weights are 0,−1 componentwise before Proposition5.2 and prove the OE/OB deformation-Hom identification in Proposition5.4.

#### G6 — YZZ analytic and arithmetic proof leaves

The reviewed GZ decomposition remains partial, explicitly leaving YZZ chapters2–8 largely unread. Acquire/read YZZ with its current erratum: local measures §1.6, extended Weil action, generating-series modularity, two-place degeneracy, Chapter6 holomorphic projection and Chapter8 local heights. This paper's E13/E15 corrections do not replace the book's own erratum. Close differentiation and regularized-limit interchange and positivity of the associated theta constant term.

#### G7 — Wild lifting and vertical adjunction repairs

Read Gross1986 canonical/quasicanonical lifting for E15, rather than treating the asserted correction as a proof. Resolve E17 by an equivariant/invariant vertical lift and E18 by a correct CM-section argument. Reconcile with the already proposed finite-flat Lubin–Tate/quasi-canonical-lift direction; do not create another general local-lifting owner.

#### G8 — Route and library refinement

This is a bounded name/declaration and owner screen, not an exhaustive declaration proof of absence. Read the remaining source-owner packets and refine specializations against current reserved IDs. R07 has no reviewed audit entry in this snapshot. Reuse the pending CM Part II ID from Tsimerman, coordinate AGHMP18 #1143, and keep general reflex reciprocity with ShimuraVarieties V5.

#### G9 — Executable contracts and independent verification

Every introduced carrier here has planning API and at least two test obligations; 150005 exact finite diagnostics are not Lean proofs. Expand interfaces to executable typed declarations and complete dependency closure before suggesting a compiled blueprint. All new source findings lack an independent review verdict. No Lean file was requested, written or compiled.

The first next action is final erratum collation, then Kisin/CCO and the nodal/vertical repairs. The whole main paper does not need to be acquired or re-read from scratch.

Validation results are recorded in the accompanying JSON and handoff after running the repository checks. No Lean source was written or compiled; a paper intake does not authorize a Lean deliverable. This checkpoint must not be marked complete or activated as a gap-free executable blueprint.

## Review (REV-PAPER-YUAN-ZHANG-18, 23 September 2026)

The review, by Claude Code (session cc-39fac3), accepted the extraction and its nine routes after corrections made in place. The full record is `research/blueprint/reviews/REV-PAPER-YUAN-ZHANG-18.md`.

- **Statements and locators:** 49 statements and 67 locators corrected. Theorems 1.6 and 1.7 now assume U = Ô_𝔹^× with Ô_𝔹 ⊇ Ô_E, and that X_U is compact.
- **Statuses:** seven items changed from missing to planned: five at GZ.6 and kisin-free and kisin-classification at R07.4.
- **Repairs:** all five of the extraction's repairs are sound.
- **New items:** 24 (3 planned, 21 missing). The Part II brief has a corrections paragraph.
- **Source issues:** E1–E23 are confirmed. E3, E13, E15 and E17 are reclassified. E24–E55 are new:
  - The proof of Theorem 1.6 has gaps at primes of F ramified over Q (E31, and E3 in the erratum). It is also proved only for compact X_U (E29).
  - Theorems 1.6 and 1.7 need Ô_𝔹 ⊇ Ô_E (E28).
  - Lemmas 7.6(2) and 8.7(2) are false at S2, but their errors cancel (E43, E51).
  - Theorem 1.1 still holds; AGHMP18 prove it independently.
