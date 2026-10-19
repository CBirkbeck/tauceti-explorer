# BorelRegulators package fix, second round

Issue #11139; job `FIX-PKG-BorelRegulators~adv2`; Claude (Opus 5.5), session
`claude-IRLtnR`; 2026-10-19. **Complete: review.json set to `accepted`.**

The three findings of `REV-PKG-BorelRegulators~adv.md` were left open by the
first fix (`FIX-PKG-BorelRegulators~adv`). This round resolves all three in
`README.md`, updates the closing comment and module docstring of
`Suggested.lean`, and records the verdict in `review.json`. The packet was not
edited, because it is not a deliverable of this job.

## Finding dispositions

| Finding | Change |
|---|---|
| §6.2, norm-one Tamagawa proof | Rewritten as a decomposition of Weil's proof into named targets: `divisionUnits_normOne_compact`, `divisionZeta_residue` (e≥2), `divisionZeta_localValue`, `divisionZeta_unramifiedFactor`, `generalLinearOne_tamagawaNumber`, `tamagawaNumber_multiplicativeGroup` (a measure conversion of AutomorphicLFunctionsAndLocalFactors AL.1), `reducedNorm_image`, `normOne_tamagawaNumber` and `specialLinearDivision_tamagawaNumber`. The measures are matched to AdelicAlgebraicGroups §2.4: discriminant power Δ_F^{−dim/2}, convergence factors λ_v=(1−q_v^{−1})^{−1} for GL₁(D) and 1 for SL₁(D), ρ_{G′}=ρ_F, and the a_G normalisation by Hom(X^*,ℤ). There are six Checks, with computed witnesses and negative controls. |
| §7.3, Bloch's pairing | Removed. The node compared two normalisations of the same pairing (packet: "a comparison of two normalisations of one pairing"), nothing consumes it, and its only source, Bloch's CRM Monograph Series 11, is neither free nor in the cleared library. Without that source no exact hypotheses can be written for it (PACKAGE_REVIEW adversarial item 6: a promised interface either has a named target or is cut). The intrinsic pairing of §6.6, with its local-measure change identity, remains. The scope note and the Lean closing comment no longer mention it. |
| §8.5, evaluated coefficient | `borelRegulator_blochWigner_exact` is now a theorem with a six-step derivation. The Tate coordinate of r_Bo(x) at τ is D(τS_F(x))/π, for Suslin's map S_F in Weibel VI's labelling [x]=(0,∞,1,x). In the cross-ratio labelling r(∞,0,1,z)=z the coefficient is −1/π. For r_Be it is 1/(2π). New API: `suslinMap_labelling` and `beilinsonRegulator_blochWigner_exact`. New Checks: frame witness, ideal-simplex witness (Catalan's constant), the ℚ(√−3) value 2D(ζ₆)/π≈0.64613, and real configurations. §8.6, the Layer 8 examples and Downstream consumers now quote the exact value. |

## How the §8.5 coefficient was obtained

1. Burgos Propositions 9.25 and 9.26 (§4.5 of the package) give the relative form 8Φ₃=−4Tr(X[Y,Z]) on Hermitian traceless matrices and the absolute form 2π₁Φ₃. I checked independently that the two agree. In the Chevalley–Eilenberg complex of sl₂(ℂ) (as a real algebra), the cochain equal to Ψ=Tr(X[Y,Z]) on Λ³p and zero on arguments in su(2) satisfies Ψ|_p−(Ψ−Ψ̄)/8=dβ. This was solved exactly over the 20 coordinate triples, with zero residual; with Ψ alone the system is inconsistent. So 8Φ₃|_p is cohomologous to 2π₁Φ₃.
2. Poincaré extension g·q=(aq+b)(cq+d)^{−1}: I computed numerically that the Pauli matrices σ₁,σ₂,σ₃ move o=(0,0,1) with velocities 2∂_x, −2∂_y, 2∂_h. The frame determinant is −8, and the relative value is −16i/(2πi)=−8/π. So the invariant form is +vol_ℍ/π, where vol_ℍ=dx dy dh/h³.
3. The ideal simplex (∞,0,1,z) with Im z>0 is negatively oriented for (x,y,h). The barycentric Jacobian is Im z·∂h/∂s<0, and a Euclidean determinant gives −Hy. So its signed volume is −D(z).
4. Weibel VI labels (0,∞,1,x) as [x], and r(0,∞,1,x)=1/x. Since [x]+[1/x] is 2-torsion and D(1/z)=−D(z), the sign becomes + for Suslin's map.
5. Burgos §5.1 (pp.35–36) uses left-invariant forms with the standard Chevalley–Eilenberg differential. Any identification of right-invariant forms with Lie cochains that respects differentials is (−1)^q times evaluation at the identity, so the right model K\G of §2.2 gives the same class.

Cross-check, kept out of the README: Burns–de Jeu–Gangl, arXiv:1101.5477v1, Theorem 4.1(iii), p.17, find Beilinson value D (in ℝ(1)) for their map from the Bloch group to K₃, which is fixed only up to a universal sign. This agrees in absolute value with 1/(2π) after division by 2πi, provided their map is inverse to Suslin's up to sign. I did not establish that proviso.

**Residual risk.** The sign depends on Burgos's Propositions 9.25 and 9.26 being stated in the differential-compatible identification. His §5.1 confirms this for left-invariant forms. The previous independent review accepted the values in §4.5. If a later reviewer finds Burgos's van Est identification differs by (−1)^q, both coefficients change sign and nothing else changes.

## Adversarial pass on the touched statements

| Statement | Instances tried | Result and change |
|---|---|---|
| `divisionZeta_unramifiedFactor` | e=1: (1−q^{−1})/(1−q^{−s}), equal to 1 at s=1. e=2, q=2, s=2: (3/4)/((3/4)(1/2))=2=λ_v. e=2 coefficient of q^{−s}: 1+q, the number of lines of 𝔽_q². | Agrees with the local value theorem; added as Checks. |
| `divisionZeta_localValue` | Convergence for s>e−1 at split, ramified (M_m(Δ), poles at s=bd≤e−d) and archimedean (Γ-factor poles at s≤e−1) places. | Holds; stated for real s>e−1. |
| `divisionZeta_residue` | e=1 is Tate's theorem. | Excluded (e≥2) and consumed from AL.1, per the Tate's-thesis rule. Constant: ξ=0 terms give τ(G′)(Φ̂(0)/(s−e)−Φ(0)/s). |
| `generalLinearOne_tamagawaNumber` | Euler product regularised by ζ_F(s−e+1). Uniform convergence of ∏c_v on [e,e+1], with c_v=1+O(q_v^{−2}). Only the one-sided real limit is used. | Proved from Mathlib's class number formula and Tau Ceti's Euler product, with no continuation needed. |
| Convergence factors | Without λ_v the masses ∏(1−q_v^{−1})… diverge to 0; for H no factors are needed. | Check added. |
| `tamagawaNumber_multiplicativeGroup` | F=ℚ: fundamental domain {1}×∏ℤ_p^×, local volumes 1, Δ=ρ=1. | Check added; stated as a conversion of AL.1. |
| `reducedNorm_image` | Definite quaternion algebra over ℚ (ramified at 2, ∞): Nrd(D^×)=ℚ_{>0}, [𝔸^×:N]=2, ℚ^×N=𝔸^×. | A miscount that drops the index [ℚ^×:Nrd D^×] gives τ(H)=2; added as a negative control. |
| `normOne_tamagawaNumber` | e=1 trivial group; archimedean-split case (N=𝔸^×); real-ramified case via weak approximation. | General D stated. Discriminant exponents are additive: e²/2=(e²−1)/2+1/2, so dropping Δ^{−1/2} breaks τ=1 for F≠ℚ (Check). |
| `specialLinearDivision_tamagawaNumber` | m=1 (reduces to normOne); D=F, m=2 (unipotent stabiliser). | Stated for all m≥1. |
| `borelRegulator_blochWigner_exact` | Pauli frame; (∞,0,1,i) gives −G/π in both labellings; real configurations give 0; conjugate embedding gives (a,−a); ℚ has a zero target and does not test the coefficient; substituting −4i for −16i gives 1/(4π); reversing the frame gives −1/π. | All recorded as Checks. A real embedding gives D=0, consistent with the zero even-weight real target. |

No change touched trivial-group, p=2, residue-field or characteristic-p data beyond those listed. The other subsections keep the earlier review's pass.

## Ownership and duplication

- The norm-one Tamagawa number is owned here, as before. EndoscopicTransferAndUnitaryTraceComparison ET.4/classical-simply-connected-tamagawa leaves "the inner special-linear branch" as an open obligation. `specialLinearDivision_tamagawaNumber` now supplies it, and ET.4 may import it. **Maintainer note.**
- AutomorphicLFunctionsAndLocalFactors AL.2 plans Godement–Jacquet for GL_n only. The zeta integral of a division algebra (`divisionZeta_residue`) is therefore a target here. If AL.2 later plans inner forms GL_m(D), this target should move there.
- Hasse–Schilling–Maass (Eichler) is owned for quaternion algebras by GeometryOfNumbersAndQuadraticArithmetic GN.2. The general degree is stated here inside `reducedNorm_image`.
- Library declarations used (read at the pins): Mathlib `NumberField.dedekindZeta_residue` and `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` (Mathlib 082e2d3, DedekindZeta.lean:56,77); `NumberField.InfinitePlace.denseRange_algebraMap_pi` (InfinitePlace/Basic.lean:622); Tau Ceti `TauCeti.dedekindZeta_eulerProduct_hasProd` (pinned build, ArithmeticDirichletSeries/EulerProduct/Analytic.lean:386).
- The packet still carries the gaps "Weil's computation…", "Bloch's pairing convention" and "The Bloch–Wigner normalisation λ_BW", and the node `R.6/bloch-borel-interface`. A packet maintenance job should close the first and third, and drop or retire the second with that node. K3BlochGroups V.6 and Polylogarithms P.3–P.4, which the packet names as consumers of the exact scalar, can now cite §8.5.
- **Maintainer note:** Bloch, *Higher regulators, algebraic K-theory, and zeta functions of elliptic curves* (CRM Monograph Series 11) is not cleared. A successor would need it to reinstate the removed comparison.

## Sources read (all free or cleared)

Mars, Sém. Bourbaki exp. 351 (Numdam), §3 Lemme pp.82–83, §4 pp.83–84. Godement, Sém. Bourbaki exp. 171, Théorème 2, p.44, and exp. 176, §§1–2, Théorème 2 and footnote (3), pp.110–116. Weil, Sém. Bourbaki exp. 186, which states the theorem without proof. Borel 1977, §2.3, p.618, and the proof of Proposition 2.4, p.619. Platonov–Rapinchuk–Rapinchuk vol. I (cleared), §1.4.3, p.33, Theorem 1.34, p.43, and §5.3, pp.315–317. Weibel K-book VI, §5, pp.23–29. Goncharov arXiv:math/0207036v3, pp.7 and 38–49. Burgos, §5.1, pp.35–36, Propositions 6.7–6.9 and Theorem 8.15. Burns–de Jeu–Gangl, arXiv:1101.5477v1, §4. No source passage was copied into the repository. No untrusted text asked for any action.

## Validation

- `lean-check research/blueprint/packages/BorelRegulators/Suggested.lean`: exit 0, 12 `declaration uses sorry` warnings, nothing else. The file has 229 lines; only comments changed.
- `python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json`: 0 errors, 0 warnings (packet unchanged).
- `python3 scripts/check_sorry_data.py …/Suggested.lean`: exit 0.
- `python3 research/blueprint/intake.py check-files` on the deliverables: 0 problems.
