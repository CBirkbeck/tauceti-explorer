# RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20

Six findings: **five high, one medium**. These attack the accepted extraction's theorem and definition targets. Four new findings give counterexamples to published general statements; one identifies a proof gap in the fibrewise Galois-isomorphism refinement; one applies corrections the extraction already accepted. No finding claims to disprove the main mirror-symmetry theorem.

Worker: **Codex**, session **codex-rtOQ9t**, 1 October 2026. Refs #4170. Extraction: Claude Code `cc-39fac3`, #1292; review: Claude Code `cc-d67081`, #1293. This worker did neither. Audited repository base: `5f820d9a788211604a7658489d5f3c48dbb48c4a`.

The primary source is Michael Groechenig, Dimitri Wyss and Paul Ziegler, *Mirror symmetry for moduli spaces of Higgs bundles via p-adic integration*, Inventiones mathematicae **221** (2020), 505–596, [published PDF](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf), [article and DOI](https://link.springer.com/article/10.1007/s00222-020-00957-8). Read all 92 pages on 2026-10-01. The SHA-256 is `f2231145778b0a3fb57ce241ce0014fc4299f0de536d3e19daf4206d146c3e07`, matching the extraction's original hash. Journal page equals PDF page plus 504. I checked the printed mathematics visually on pp. 516–517, 523, 525–526, 531 and 589, including the coefficient overbars. The paper is [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/); quotations and paraphrases below are attributed to it, and the corrections are this audit's proposals.

## Findings

### 1. Base action is missing from gerbe classification — high

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: item /9(a), /11 proof input, route EndoscopicTransferAndUnitaryTraceComparisonPartII; reader gerbe-classification claims.

Item /9(a) identifies equivariant structures for an arbitrary action on Y with ordinary central extensions of group schemes over Y. This drops the action on the base. The untwisted extension description is false for nontrivial base actions.

**Evidence.** Published Lemma 2.7(a), pp. 516–517, says central extensions are taken with all three groups viewed as smooth group schemes on Y; its displayed multiplication is L_gamma1 tensor L_gamma2 -> L_gamma1gamma2. Take k algebraically closed of characteristic zero, Gamma=C2, Y=Gamma with its free transitive action, and A=mu_2,Y. Then [Y/Gamma]=Spec k and H^2([Y/Gamma],mu_2)=0: only one equivariant gerbe class exists. But ordinary central extensions of (C2)_Y by mu_2,Y give two choices at each of the two points (C4 or C2 x C2), hence four classes. Equivalently H^2(C2,Map(C2,F2))=0 for the permutation action, while the mistaken trivial action gives F2^2. The proof of Lemma 2.9 on pp. 520–521 also uses the untwisted description.

**Fix.** Record a new published source error and replace /9(a) by the action-groupoid/descent formulation: use L_gamma tensor gamma^*L_delta -> L_gamma delta with a specified equivariant commutative band. State the ordinary central-extension corollary with trivial base and band actions. Propagate the corrected distinction to /11 and the Part II brief; audit the Lemma 2.9 proof under it without declaring its conclusion false. Retain the trivial-base presentation B_k I for the later cyclic-inertia calculation. The accepted review's E20 presentation caveat does not license ordinary extensions over a nontrivially acted-on base.

### 2. Geometric extensions need Galois descent — high

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: item /9(c), sourceIssues, Part II gerbe-classification brief.

The surjection to Ext^1(Gamma,A_kbar) omits descent of geometric extension classes. H^2(k,A)=0 does not make every geometric extension descend.

**Evidence.** Published Lemma 2.7(c), equation (4), p. 516, and the final displayed sequence of its proof, p. 517, end in a surjection onto Ext^1(Gamma,A_kbar), with no Galois invariants. Take k=R, Gamma=C3 acting trivially on Spec R, and A=mu_3. This is a smooth commutative finite étale group, and H^2(R,mu_3)=0. Over C, H^2(C3,mu_3)=Ext^1(C3,mu_3)=C3; conjugation acts as inversion, with no nonzero invariants. Higher cohomology of Gal(C/R)=C2 on a 3-primary module vanishes, so H^2(B_R C3,mu_3)=0. The proposed surjection is therefore 0 -> C3, impossible. The paper assumes A constant only in its additional splitting sentence, not in the preceding assertion.

**Fix.** Add this independent source error. For the application to cyclic inertia, state the constant finite étale coefficient case, with trivial base action, where constant extensions provide the split sequence. If general smooth coefficients are retained, supply the Galois-invariant geometric extension term and its actual descent obstruction sequence; merely adding invariants is not a proof of surjectivity. Keep this correction separate from the already recorded E20 misquotation.

### 3. The character point count needs stabilizer weights — high

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: item /13(b), sourceIssues, TopologicalMirrorSymmetryForHitchinSystems brief.

The quotient-stack formula for the character point count lacks division by the automorphism group. It disagrees with the cohomological definition even for the trivial character.

**Evidence.** Published Definition 2.14(b), p. 523, equates the alternating Frobenius trace with the unweighted sum over [X/G](F_q)_iso. Item /13 copies that sum. For X=Spec F_3, G=C2 acting trivially and chi=1, the cohomological side is 1. There are two C2-torsor classes over F_3, each with two automorphisms and trace 1. The printed sum is 2; the correct groupoid mass is 1/2+1/2=1. Definition 2.13 on p. 522, Corollary 4.9 on p. 540, and the trace formula on p. 574 already use the correct weights. A generically free control is A^1 over F_3 with the sign action: the unweighted sum is 4 and the weighted/cohomological count is 3.

**Fix.** Add /|Aut(x)| to every summand in /13(b), record the omission as a published source error, and make the reader and new-roadmap brief use the weighted convention. Retain the existing cohomological definition and the already weighted stringy formulas. Use B C2 and A^1/C2 as distinguishing examples in the later design.

### 4. The ramified factors need not be isotropic — high

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: item /23, sourceIssues, Part II explicit Tate-pairing brief; consumer /78.

Lemma 3.7's assertion that the second factors of the reciprocity/uniformizer decompositions pair trivially is false for even torsion. Unramified orthogonality does not imply that a chosen complementary subgroup is isotropic.

**Evidence.** Published Lemma 3.7, p. 531, says the first factors pair to zero "and analogously for the second factors". Take F=Q_3, pi=3, Gamma=C2 and identify Gamma^vee=mu_2 with C2. The Kummer class a=-3 has reciprocity character chi_a(3)=(-3,3)_3=1, so its unramified coordinate in (8) is zero and it lies in the second factor. It is nonzero on mu(F)={+1,-1}, since (-3,-1)_3=-1. Its Tate self-pairing has Hilbert symbol (-3,-3)_3=-1, hence invariant 1/2, not zero. The odd-prime Hilbert formula in Andrew Sutherland, MIT 18.782 Lecture 10, Theorem 10.7, independently gives these three values. A direct norm check gives the same result: N(sqrt(-3))=3, whereas the residue of a norm unit in Q_3(sqrt(-3))/Q_3 is a square in F_3, excluding -1. Every hypothesis of Lemma 3.7 holds, including mu_|Gamma| in F.

**Fix.** Record the source error and remove the unconditional second-factor isotropy clause from /23 and the Part II brief. Keep Proposition 3.6, the unramified annihilator statement and the correctly normalized unramified-versus-ramified evaluation used by Lemma 7.25. If a full block formula is needed, include the diagonal term or prove it under explicit extra hypotheses eliminating the 2-primary obstruction. Do not claim this counterexample refutes mirror symmetry or the mixed pairing used in /78.

### 5. Purity does not recover the actual Galois representation — medium

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: item /76 (Theorem 7.23 half), sourceIssues, new-roadmap final target (3); reader fibrewise Galois-isomorphism claim.

The extraction repeats the step from purity and equal point counts to actual isomorphism of fibrewise Galois representations without the missing arithmetic semisimplicity or geometric isomorphism argument. Purity alone does not justify this step.

**Evidence.** Published Theorem 7.23 and its proof, p. 589, conclude "are abstractly isomorphic" and then assert that an equality of point counts suffices because the direct-image complexes are pure. On Spec F_q, the continuous representations with Frobenius I_2 and J_2=[[1,1],[0,1]] are both pure of weight zero and have trace 2 on every positive Frobenius power, but are not isomorphic: the ranks of Fr-1 are 0 and 1. This is exactly the pure Jordan-block phenomenon in de Cataldo–Haines–Li, Frobenius semisimplicity for convolution morphisms, Math. Z. 289 (2018), Example 5.1.2, p. 157. It is a counterexample to the inference, not to these particular Hitchin fibres. The imported ArithmeticGaloisRepresentations:R01.5 explicitly assumes semisimplicity. Also, equality of alternating traces first gives a virtual class; cohomological-degree separation needs justification and cannot be silently inferred at singular fibres.

**Fix.** Record a published proof gap and distinguish the trace/virtual-character consequence established by Theorem 6.12 from the stronger actual representation target. To retain Theorem 7.23 as a completed proof route, cite or supply a precise arithmetic semisimplicity/degree-separation argument or an independent geometric isomorphism. Otherwise mark that strengthening unresolved in /76, the reader and route brief. Do not assert that Theorem 7.23 or the main mirror-symmetry theorem has been disproved, and do not replace it by an unjustified degreewise semisimplification claim.

### 6. Accepted corrections must reach the active statements — high

**Where:** research/blueprint/papers/PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json: statements /15, /16, /25, /36, /40, /50, /66 and proof notes /17, /71; reader sentence "The items use the corrected statements".

The accepted source corrections are often confined to notes, while active statement fields still contain the known false formulas. This violates PROTOCOL §18 and contradicts the reader's assertion that the items use corrected statements.

**Evidence.** Direct JSON inspection: /15(c) retains unrestricted root-choice independence despite E1; /16 retains simultaneous Q_l-valued roots for all r despite E2; /25 retains the false Brauer quotient despite E3; /36 still obtains the inertia generator from a primitive |Gamma|-th root through reciprocity despite E14; /40 still lists the universal tame splitting claims despite E13; /50 retains the unconditional short exact sequence despite E4; /66 still has Nm^{-1}(L tensor det(pi_*O)) despite E12. The latter contradicts Nm(L')=det(pi_*L') tensor det(pi_*O)^{-1} on published p. 579. /71's note still uses M^{e-1} and N=M Q^{-n}, and /17's proof note uses the positive fractional Tate twist, despite E12 and E6. The existing sourceIssues already explain these defects; the new finding is the failure to apply those accepted corrections to the planned targets.

**Fix.** Rewrite statement fields as the corrected targets, keeping historical printed assertions in sourceIssues. In particular use Nm^{-1}(L tensor M^{-1}) in /66, (P^L)^e=P^{L^e M^{1-e}}, and a degree-zero N=M^{-1} Q^n with deg(Q^n)=deg M in /71. Apply E1/E2's actual hypotheses and coefficient conventions, E3's mu_r-gerbe formulation with image quotients where needed, E14's tame-character generator, E13's explicit unramified enlargement, E4's middle-exact sequence, and E6's negative twist. Carry these through dependent /41–/47 and /52 where used. Check that item statements, notes, routes and reader agree; retain all accepted issue history. This finding does not reopen the old source errors as newly discovered ones.

## Reproducible distinguishing calculations

For finding 1, use the cyclic-group formula `H²(C₂,M)=M^{C₂}/N(M)`. For the permutation module `M=F₂²`, both invariants and the norm image are `{(0,0),(1,1)}`, so the quotient has one element. For the trivial action the invariants have four elements and the norm image is zero. These are precisely the twisted and untwisted descent calculations in the example. The example uses a commutative band, so it does not depend on any ambiguity about nonabelian gerbes.

For finding 2, the geometric cyclic extension class can be represented by `0→C₃→C₉→C₃→0`. Conjugation fixes the quotient `C₃` and inverts the coefficient `μ₃`; it therefore inverts the extension class. Its nonzero elements cannot descend to R. Equivalently the Hochschild–Serre calculation has only the conjugation-invariant part of `H²(C₃,μ₃(C))`; it is zero. The assumption `H²(R,μ₃)=0` is satisfied, not violated.

For finding 3, the generically free control also satisfies the usual smooth quotient assumptions. In `[A¹/C₂](F₃)`, the zero locus contributes two torsor classes, each with automorphism group of order two. The free locus is the scheme `G_m`, contributing two further classes, each with trivial automorphism group. Thus the weighted count is `2/2+2=3` and the unweighted count is `2+2=4`. The sign action acts trivially on `H²_c(A¹,Q̄_ℓ)=Q̄_ℓ(-1)`, so the trace side is three.

For finding 4, write `a=3^αu`, `b=3^βv`. The odd-prime formula is

```
(a,b)_3 = (-1)^(αβ) Legendre(u,3)^β Legendre(v,3)^α.
(-3, 3)_3  = (-1) * (-1) * 1    = +1
(-3,-1)_3  = 1    * 1    * (-1) = -1
(-3,-3)_3  = (-1) * (-1) * (-1) = -1
```

Here `χ_{-3}(3)=+1` means the *zero* additive C₂ coordinate, so this example really lies in the **second** summand of the paper's reciprocity decomposition. The easier class `+3` would not: it has a nonzero first coordinate. The Hilbert formula was checked in [Sutherland, 18.782 Lecture 10, Theorem 10.7](https://math.mit.edu/classes/18.782/2013fa/LectureNotes10.pdf). This distinction prevents a spurious counterexample caused by mixing Kummer and reciprocity coordinates.

For finding 5, `J₂^m=[[1,m],[0,1]]` for every positive integer m. Thus all power traces match `I₂`, while the dimensions of Frobenius-fixed vectors are one and two. Continuity follows by extending `m↦J₂^m` along `Ẑ→Z_ℓ`. Both representations have only the weight-zero eigenvalue one. [de Cataldo–Haines–Li, Example 5.1.2, p. 157](https://www.math.stonybrook.edu/~mde/MyPublishedPapers/FROB%20SEMISIMPLE.pdf) gives the same pure Jordan-block phenomenon. This supports the precise logical objection, not an assertion about whether a separate geometric proof of GWZ Theorem 7.23 exists.

## Old corrections versus corrected targets

Finding 6 concerns the extraction, not new source errors. In particular, sourceIssues E1–E20 remain valuable evidence. The following discrepancies can be found directly by matching each item's `statement` or `note` against the indicated accepted correction:

| Item | Retained expression | Accepted correction to apply |
|---|---|---|
| /15 | independence of compatible roots for every prime power | E1: retain choices, or use the justified prime-field/coefficient-fixing form |
| /16 | simultaneous Q_ℓ-valued roots for every r | E2: correct coefficient/denominator hypotheses |
| /25 | Brauer-group quotient identified with Ext²(A,μ_r) | E3: use the μ_r-gerbe formulation and the appropriate image quotient |
| /36 | reciprocity of the selected root produces the inertia generator | E14: use the inverse tame character |
| /40 | every tame Γ splits under μ_e⊂F | E13: make the unramified enlargement explicit |
| /50 | unconditional short exact sequence (24) | E4: retain the needed middle exactness, with the full obstruction terms when asserted |
| /66 | norm preimage at L·M | E12: norm preimage at L·M⁻¹ |
| /71 note | `(P^L)^e=P^{L^e M^{e−1}}` | E12: exponent `1−e`; adjust the degree-zero line bundle accordingly |
| /17 note | positive fractional Tate twist | E6: use the negative twist matching the point-count factor |

The sign check for /66 is immediate from `Nm(L′)=det(π_*L′)·M⁻¹`. For /71, choose `Q` with `deg(Q^n)=deg M` and set `N=M⁻¹Q^n`; then `N` has degree zero and `L^e N^{e−1}` differs from `L^e M^{1−e}` by an n-th power. The existence statement of Theorem 7.16 is preserved.

## Scope and retained structure

Read all 78 items, the five route objects, the eleven prerequisite records, all twenty sourceIssues, the accepted review JSON and its separate Markdown report. The source was read through §§1–7 and its references: quotient and gerbe constructions; equivariant/stringy invariants; local duality; orbifold integration; stacky Brauer groups; abstract Hitchin mirror symmetry; and Higgs moduli, determinant changes, Prym duality and Fourier refinement.

The atlas assembled at the audited base has **2907 stages and 8322 stage edges**. I read the route/import stages LD.2, R02.4, R09.4–R09.5, ET.2b, A2, CP.3, R01.5 and DWP.7, together with the available reviewed library-coverage records. Missing coverage records were not treated as proof that a library lacks a theorem. The Part II candidate is intentionally coalesced with GWZ-20-B's identically named candidate. Its general stacky integration and Hasse-invariant machinery is reused. The five route item counts are **4, 3, 4, 23, 36**; all **70** missing items occur in exactly one route. No additional ownership, cycle or duplication finding was established by this targeted check; it is not a new global atlas audit.

The claimed library inputs were opened at the pinned commits:

- Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`: `MeasureTheory.Measure.haarMeasure`, `haarMeasure_self`, `haarMeasure_unique` in `Mathlib/MeasureTheory/Measure/Haar/Basic.lean`; `AddCircle.toCircle`, its additive law and injectivity in `Mathlib/Analysis/SpecialFunctions/Complex/Circle.lean`.
- Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`: `TauCeti.subsingleton_brauerGroup_of_finite` in `TauCeti/Algebra/BrauerGroup/Trivial.lean`.

Those declarations supply the generic inputs actually stated there. This audit does not claim that they alone provide every conversion in bundled items /1–/3. No absence finding is based on a name search, and no supplier-paper proof closure or blueprint-level API/test obligation is imposed on this §16 extraction.

Correction search, 2026-10-01: the [publisher article](https://link.springer.com/article/10.1007/s00222-020-00957-8), the actual published PDF, Crossref's DOI metadata (`relation={}`, no `update-to`/`updated-by`), [arXiv's version history](https://arxiv.org/abs/1707.06417) through v3 (2019-10-28), and targeted title/lemma searches. No correction resolving findings 1–5 was located. Groechenig and Wyss author-page attempts failed, so this is not an exhaustive novelty search. The downloaded arXiv v3 PDF was not used to substitute for the version of record. A fixing worker should record new published sourceIssues for findings 1–5, marking finding 5 as a proof gap; the exact publication and hash above remove the earlier review's PDF-access limitation.

## Validation

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json`
- `python3 research/blueprint/intake.py check-files research/blueprint/redteam/RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20.result.json research/blueprint/redteam/RT-PAPER-GROECHENIG-WYSS-ZIEGLER-20.md`
- `git diff --cached --check`

No Lean deliverable, compilation, new Lake project, library build, cache download or language server. Only the two issue-authorized report files are changed. Independent verification remains responsible for confirming or rejecting each finding.
