# FIX-PKG-GrossZagierAndArithmeticHeights~adv — fixes report

Issue #10956. Claude, session `claude-TYlSTQ`, 19 October 2026. I did not write
the package (Codex, `codex-dLsusU`; revision `PKG~2` by Codex, `codex-ggn0g7`,
PR #10932) or its review (Claude, `claude-NKgeCb`).

**Verdict: accepted.** Every finding of
[REV-PKG-GrossZagierAndArithmeticHeights](../reviews/REV-PKG-GrossZagierAndArithmeticHeights.md)
is resolved in the package files. The author revision `PKG~2` had already
answered R1–R2 in outline. This job checked those answers against the suppliers
and the sources, repaired what did not hold, and repeated the adversarial pass
on everything touched.

Files: [README.md](../packages/GrossZagierAndArithmeticHeights/README.md),
[Suggested.lean](../packages/GrossZagierAndArithmeticHeights/Suggested.lean),
[review.json](../packages/GrossZagierAndArithmeticHeights/review.json). The
README still has 287 targets (Layers 0–9: 12, 5, 15, 13, 7, 6, 78, 109, 20, 22).

## Finding → change

| Finding | Disposition |
| --- | --- |
| R1, 23 absent contracts | Each now has an owned target that I read and checked: base-change ε and λ² (0.7); V, p, q kernels (6.2); CM isogeny-diagram Hom (7.3); integral JL replaced by primitive-lattice selection (9.6); cotangent saturation (9.1, BLR §7.5 Theorem 4(iii), read in the cleared library); bad-prime differentials (3.1); ordinary and quasi-canonical lift lengths (7.1–7.2); D_K=−3,−4 (0.5); mixed-kernel derivative bounds (6.24); weight-two projection (6.1) and the compact Green operator (ComplexComparisonPartII C5 `harmonic-projection-green`); CM moment descent (9.4); norm/genus bridge (6.16); toric Hom (4.1); semistable Abel–Jacobi and Kummer logarithm (9.5); algebraic-point subgroup theorem (9.2). Corrections to 3.1, 6.1, 6.2, 9.2 and 9.4 are listed below. |
| R1, 43 partial contracts | A Sonnet cross-check read all 32 rows of the rewritten supplier table against the supplier packages and packets. I verified each mismatch myself and re-pointed 13 rows. Serre–Tate theory is AbelianSchemesAndArithmeticModuli A4.9–A4.10 (`serre-tate-equivalence`, `ordinary-serre-tate-coordinates`, with the Hom criterion), not FiniteFlat R07.2 (Dieudonné theory). Hom rigidity is A1 `relative-rigidity-comparison`. Additive characters and self-dual measures are AL.0. Genus characters are AN.4 `imaginary-genus-character-dictionary`; quadratic reciprocity and character orthogonality are Mathlib `jacobiSym.quadratic_reciprocity` and `MulChar.sum_eq_zero_of_ne_one`. Smooth representations are SR.0 plus SR.2 `frobenius-reciprocity`. Good reduction is Néron §1.8. Also re-pointed: the AF.3 L² pairing, Mathlib `mellin` with AL.0 `bessel-laplace-mellin`, R17.4 prime-cyclic base change of degree 2, the L3h wording, and the m=0 case of GH.4.1. 7.1, 7.2, 7.3 and 7.25 now cite A4 and A1. Three broken cross-references were fixed (`R12.5/weight-two-regular-differentials`, `C5/harmonic-projection-green`, and SchemeAndStackFoundations, which is upstream; see below). All 117 cross-roadmap references now resolve to packet nodes or stages. |
| R2, Arakelov R35.1 | 2.1 cites ArakelovGeometryAndAbelianHeights package §§1.8–1.10 and 1.15, which exist (`ArithmeticDivisor`, `ArithmeticChow1.pairing`); its G=2g conversion was rechecked. |
| R2, Harris–Kudla and Prasanna | Re-read Prasanna, Annals 163: Theorem 2.3, p. 910, Theorem 2.4, p. 912 (p∤∏q(q−1)(q+1), p>k+1, v_λ≥0) and Theorem 3.2, p. 940 (p-unit only). 9.6 now cites Theorem 2.4 for α∈K_f when K_f≠ℚ. Brooks Theorem 8.2, p. 4232, gives exactly the constant C(f,χ) of 9.9, and Proposition 8.5 is on p. 4235. |
| Question 1, cycles with HE and GH | This was a real target-level cycle. HE.0 `norm-reciprocity-level-compatibility` imports GZ 0.5, and HE.1 `jacobian-basepoint-denominators` and `parameter-choice-and-degree` import the whole GZ.3 stage. Meanwhile 0.5, 0.12, 2.15 and 3.13 cited the whole stages HE.0 and HE.1. Those four now cite only nodes that import nothing from this roadmap: HE.0 `ring-class-tower-quotients` and `dihedral-conjugation`, HE.1 `cm-cyclic-isogeny-pair`, ComplexMultiplicationAndExplicitReciprocity CM.1 `ideal-action` and `quadratic-forms-dictionary`, CM.2 `explicit-level-reciprocity` and CM.3 `class-polynomial-galois-action`. 3.13 now cites EllipticCurveModularity R29.5. A transitive scan of every external citation finds no remaining path back into the same or a later layer. HE and GH citations now occur only from Layer 6 on; GH.4, which imports GZ Layers 4–5, is cited only in Layer 9. The two roadmaps still interleave at roadmap level: see the maintainer notes. |
| Question 2, ownership | Decided inside the package: the specialized notions are owned here (PKG~2), checked above. One new ownership item is the p-adic analytic subgroup theorem (9.2, below). |
| Question 3, packet propagation | Outside this job's files; see the maintainer notes. |

## Further corrections from the adversarial pass

- **3.1** (Česnavičius–Neururer–Saha). Theorem 5.15 covers only ℤ-combinations of normalized newforms on Γ₀(N) (trivial character). The target had claimed every weight-two newform; it is now restricted. Added the Néron comparison as stated in Proposition 6.2 (inclusion H⁰(J,Ω¹)⊆H⁰(X,Ω), cokernel H⁰(X,R¹π_*O_Z), equality iff rational singularities), Remark 6.11 (killed by 6 for N≠2ⁿ), Theorem 6.12 (the exact p=2,3 conditions) and Corollary 6.14. The vague "exceptional 2/3 ranges" Check is replaced by two Checks: N=40 at p=2, where only 6ω_f is known to be Néron and δ₂=1 in 3.8, and N=11, where equality holds. Pages pinned: pp. 39–47.
- **6.1.** Gross–Zagier IV (5.1) is the projection lemma for weight 2k>2 only. Weight two is IV §6, Proposition (6.2), pp. 295–296: logarithmic cusp growth, the linear systems (6.3)–(6.4), and the σ₁ and σ₁′ correction terms of (6.5). The README had cited §5 and omitted the corrections; both are fixed. Added a Check at k=2 with the factor (4πm)³/2!.
- **6.2.** The locator "(3.8)–(3.14)" does not exist on pp. 277–278; the content is Propositions (3.2)–(3.3). Stated the integral V_s, and that V_s* is entire (Proposition 3.3(c)), not merely meromorphic. p_n is exactly the Laguerre polynomial; the old wording denied this.
- **9.4.** If the Serre–Tate coordinate changes as Q′=Q^a, then D′=D/a and the j-th moments scale by a^(−j). The README said a^j. Fixed, and the Check now separates this from the function Q^a, which is the Dirac mass at a.
- **9.2.** Burungale–Skinner–Wan Theorems 3.1–3.2 (pp. 9–10) quote the p-adic analytic subgroup theorem from Fuchs–Pham (arXiv:1502.00768, Theorem 2.2, p. 2). No atlas or TauCetiRoadmap roadmap plans it: DiophantineApproximationAndTranscendence has heights and the Siegel lemma, and LinearFormsInLogarithms has only the qualitative p-adic Baker–Brumer theorem. The target had said "the analytic subgroup proof is part of this target" without stating it. It now states the theorem with its hypotheses and Fuchs–Pham's proof route (semistable reduction, auxiliary function, p-adic Schwarz lemma, multiplicity estimate), then derives the abelian form. Added a 𝔾_a×𝔾_m Check (the p-adic Hermite–Lindemann case).
- **9.3, duplicate removal.** TauCetiRoadmap main has merged PadicMeasuresIwasawaAlgebras §2.5 (`boundedInvTransform`, the inverse Amice transform for every complete ultrametric coefficient ring) and NewtonPolygons §§6.3–6.4 (μ, λ, preparation with ϖ^μ, additivity, zeros in the open disc, no finite-residue-field hypothesis). 9.3 restated both. It now cites them and keeps only interpolation uniqueness and the parity of unit × square. It holds for every p.
- **Upstream citations.** SchemeAndStackFoundations (§2.20, §§0.17–0.18), PadicMeasuresIwasawaAlgebras (Layer 1, §1.6, §§2.1, 2.5) and NewtonPolygons are cited by their upstream sections. A paragraph after the supplier table records which suppliers are merged and which are open TauCetiRoadmap pull requests, and a TauCetiRoadmap.ClassFieldTheory row was added. 0.5 states in one clause how it extends HE.1's pair (D_K=−3,−4). The Layer 0, 2, 3, 7 and 9 Dependencies lists were updated to the new Needs.
- **Suggested.lean.** Added `rankinKernelPolynomial`, a light real-bodied definition of p_(k,r), with examples p_(2,0)=t²/8, p_(2,1)=1−t and p_(3,2)=p₂. The closing list of README-only definitions is now one block comment: the definitions of the eleven PKG~2 targets were added, and the removed name `graphAdmissibleMeasure` became `arithmeticSkeletonMeasure`.

## Adversarial pass table (touched statements)

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| 3.1 integrality | nontrivial character; Γ₁(N)⊆Γ⊆Γ₀(N); N=40 at p=2; N=11; node residues; pf | false for nontrivial character as written | restricted; Checks added |
| 3.8 vs 3.1 | N=40: v₂=3, 5≡1 mod 4 | δ₂=1 consistent with CNS Theorem 7.2 | none |
| 6.1 projection | k=1 vs k=2 (b_m=e^(−2πmy)); f itself; log growth | §5 formula wrong at k=1 | §6 statement |
| 6.2 kernels | p₀,p₁,p₂; p_(2,0), p_(2,1), p_(3,2); q₀′=−e^(−t)/t; k=1, V₀=−2πie^(−2πt); q_n≤e^(−t)/t | all recompute | locator, entire, Lean definition |
| 7.1 lift criterion | (a,b)=(1,0),(0,1); t=0 vs π^r; split orbit q^s(1−q⁻¹) | correct; specializes A4.10 | Needs and one clause |
| 7.2 lifts | n=0,1; unramified q+1, ramified q; Wewers Theorem 1.4 p. 79, Theorem 3.2 p. 84 | correct | Needs |
| 7.3 diagram Hom | m=0; residue characteristic 2; empty fibre | correct | Needs |
| 9.1 saturation | ℤ_p, p=2 (e=p−1), p=3; BLR Theorem 4(iii) | correct | none |
| 9.2 subgroup theorem | W=0; torsion x; A₁×A₂; 𝔾_a×𝔾_m diagonal; F-stable sum | correct once the theorem is stated | rewritten |
| 9.3 uniqueness | ϖ²(T+ϖ)³ at p=3 (μ=2, λ=3); ϖ+T; log(1+T); U·G² | correct for every p | duplicate removed |
| 9.4 moments | Q′=Q², F=Q (Dirac at 1/2); D vs d/dt on 1+t | direction wrong | fixed |
| 9.5 Tate logarithm | z=q_E; change of branch of log_p p; a_p=±1 | branch independent; 1−a_p/p≠0 | locator p. 15 |
| 0.7 signs | split place; real place η(−1)=−1; λ²=η(−1) | correct | none |
| 6.16 genus sign | D=−3, N=1, n=±3; square n | correct | none |
| 9.6, 9.9 constants | N⁻=1; 2f_B; j=0; Brooks C(f,χ) | match Brooks Theorem 8.2 | 9.6 cites Theorem 2.4 |
| Lean | every example recomputed by hand; heegnerAverage at card G=0 in L | true | `rankinKernelPolynomial` added |

## Checks run

- `lean-check` on the final Suggested.lean: exit 0, 28 `sorry` warnings and nothing else (194 lines; free memory 81 GB before running).
- `python3 research/blueprint/intake.py check-files` on README, Suggested.lean and metadata.toml: 0 problems.
- Internal links: 287 anchors, all links resolve, all labels match their headings, no forward or self Needs edges.
- Cross-roadmap references: 117, all resolve to packet nodes or stages. A transitive closure over the packet prerequisite graph finds no external citation that re-enters this roadmap at the same or a later layer.
- Duplication: the TauCetiRoadmap main roadmaps merged since the last audit (NewtonPolygons, PadicMeasuresIwasawaAlgebras, SchemeAndStackFoundations, DiophantineApproximationAndTranscendence, HeightsAndUnits, MassFormula, ComplexTori, ComplexCurveModuli, ClassicalArithmeticCompletion) were screened by object. Only 9.3 overlapped.
- Own words: no 10-word overlap between the added text and the nine source texts read (one Gross–Zagier phrase was rephrased).

Sources read for this job: Česnavičius–Neururer–Saha (arXiv:1911.09446); Gross–Zagier, rendered pp. 277–278 and 288–296; ARGOS seminar, Chapters 8, 9 and 11; Brooks (IMRN 2015); Prasanna (Annals 163); Burungale–Skinner–Wan (arXiv:2603.20886v2); Fuchs–Pham (arXiv:1502.00768v1); Castella (arXiv:1507.04260v1); BLR *Néron Models* §7.5, in the cleared library, with nothing copied.

## Notes for the maintainer

1. **GZ and HE interleave.** At target level there is no cycle. At roadmap level, HeegnerPointEulerSystems imports GZ 0.5 and Layer 3, and GZ imports HE in Layers 6–9. Upstream sequencing therefore needs a bundle, or HE's two imports moved down. The packets also show EllipticCurveModularity R29.5 `modular-parametrisation` and AutomorphicLFunctionsAndLocalFactors AL.4 `local-parameter-comparison` reaching GZ 0.5 transitively; worth checking against their upstream PRs #1018 and #924. EffectiveDiophantineMethods ED.6 cites GZ.8.
2. **The p-adic analytic subgroup theorem** (Fuchs–Pham, also Matev) is planned in 9.2 only because no transcendence roadmap states it. Its natural owner is a transcendence roadmap, beside LinearFormsInLogarithms' p-adic Baker–Brumer theorem. If one takes it, 9.2 keeps only the abelian form.
3. **Packet propagation.** The accepted packets `GrossZagierAndArithmeticHeights--GZ.0.json` and `--GZ.8.json` are unchanged (out of scope). They still carry the old supplier text, the pre-PKG~2 target set and the errors corrected here (3.1 generality, 6.1 locator, 9.4 direction, 9.3 duplication).
4. The 2011 YZZ draft (ResearchGate link) and the 2013 book were not read in this job; their locators remain as the original review marked them.
