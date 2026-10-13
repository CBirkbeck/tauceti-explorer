# Handoff: PKG-AutomorphicBundles~2 — issue #7890

Worker: Claude (Opus), session `claude-ZAkwNf`, 13–14 October 2026. Branch
`claude-ZAkwNf-pkg-automorphic-bundles`. The bot confirmed the claim in
[comment 6156658244](https://github.com/CBirkbeck/tauceti-explorer/issues/7890#issuecomment-6156658244).
This is a completed revision-round-2 package, not a checkpoint. No packet was changed; `review.json`
is left in place for the next reviewer.

## Deliverables

- `research/blueprint/packages/AutomorphicBundles/README.md` — rewritten in the TauCetiRoadmap form
  (`# Roadmap:`, **Summary.**, Scope and ownership, Conventions, Exact supplier contracts, How to read
  the build, `## Layer Bk:` with `### Bk.n` targets ending in *Needs:* and *Lean:* lines and
  **Checks.**, per-layer Examples and Dependencies, Worked examples, Downstream consumers,
  References). 95 targets, about 206 KB.
- `research/blueprint/packages/AutomorphicBundles/Suggested.lean` — rewritten to the 2026-10-12
  shape: 441 lines, real-bodied light definitions, statable theorems and `example`s only, one
  closing comment naming the README-only targets.
- `research/blueprint/packages/AutomorphicBundles/metadata.toml` — unchanged (`topic = "math.NT"`).

## How the review REV-PKG-AutomorphicBundles is answered

The review's one blocking defect was that 129 of 154 planned API names had no active Lean
declaration and the geometric targets were a comment inventory. Under the maintainer's binding
"Shape of a roadmap (2026-10-12)" (PACKAGE_REVIEW.md), a statement whose carriers are not at the
pins is a README target and never a Lean declaration, and sorry'd carriers are forbidden. So the
inventory is gone; every geometric target, with its API and Checks, is in the README, and every
target carries a *Lean:* line. The Lean file states only what the pins can carry:

- Layer B0: `inverseCocharacter` (real body through Mathlib `AddMonoidAlgebra.mapDomainBialgHom`),
  `hodgeParabolic = P(μ⁻¹)` and `hodgeTateParabolic = P(μ)` on Tau Ceti's
  `TauCeti.Cocharacter.parabolic`, and the opposition theorem
  `hodgeParabolic_inf_hodgeTateParabolic` (intersection = `TauCeti.Cocharacter.levi`).
- Layer B4: `AutomorphyFactor` with `changeFrame`, the `SlashAction` adapter
  `slashActionOfAutomorphyFactor` (its laws now proved), its API theorems, the inverse-base cocycle,
  the scalar cocycle-detection theorem, `HilbertArithmeticWeight` with `detExponent`, and the
  discriminating examples (rational shears, `SL₂` agreement with Mathlib's slash, the
  determinant-negative semilinear law, the `C₂` non-cocycle, Hilbert weight tests).
- Layer B5: `ClassicalHecke.modularNormalization` (`T_ℓ(1) = (ℓ+1)/ℓ`) and the `GSp₄` Hodge–Tate
  weight data `SiegelHT.coherentWeights`, `SiegelHT.twiceTateExponents` with integrality, checked
  against BCGP v1 Theorem 4.8.2, p.101 (read from the PDF).

All but three statements are proved; the three `sorry`s are `inverseCocharacter_inverseCocharacter`,
`levi_inverseCocharacter` and `hodgeParabolic_inf_hodgeTateParabolic` (the last is Conrad, *Reductive
group schemes*, Theorem 4.1.7 and proof, pp.112–113, `Z_G(λ) = P_G(λ) ∩ P_G(−λ)`). The nine statement
restorations made by the review are kept: the README targets were converted from the reviewed
README text, not regenerated from the packets.

## Changes against the accepted plan (packets unchanged; each needs the owner's attention)

1. **Duplication with the bundle partner removed.** ShimuraCompactifications' plan (accepted
   2026-10-13) owns the scalar Hodge-line Fourier–Jacobi expansion as C5
   *hodge-line-fourier-jacobi-expansion* (`HodgeLineFJ`: coefficients, independence of the cone and
   of the decomposition, `Γ_Φ`-invariance, functoriality in `M`, stratum restriction through the
   constant term) and says general coefficient bundles belong to AutomorphicBundles B5. The seven B5
   nodes `fj-coefficient-module`, `local-fj-expansion`, `cone-compatibility`, `global-fj-expansion`,
   `fj-refinement`, `constant-term-restriction` and `coefficient-naturality` duplicate that node, so
   the README cites it instead and their discriminating checks (infinite support of `(1−q)⁻¹`, the
   common-completion counterexample `k[[x,y]]` vs `k[y,y⁻¹][[x]]`, no averaging over `C_p`) moved to
   B5.14. The B5 packet should be re-pointed to the C5 node.
2. **Notions planned here that no supplier had.**
   - B0.4 `contractedProduct` (associated bundles of torsors, Milne III Lemma 3.1, p.58): the old
     README assigned it to ReductiveGroupsPartII, but neither ReductiveGroupsPartII nor
     AdelicAlgebraicGroups on TauCetiRoadmap main has contracted products over schemes.
   - The assembly's integral gap R1/R2/R5/R6 is closed as targets: B3.11 `integralLeviCoefficient`
     (R5; Lan, *Higher Koecher's principle*, §2 p.3, §3 p.5, Proposition 5.6 pp.11–13,
     Corollaries 5.8–5.9 p.13), B4.15 `ramifiedHilbertLine` (R6; Diamond 2022 §§2.9–2.10 pp.7–8,
     §6.1 p.24), B4.20 `integralForms` (R1; Lan PEL Definition 7.1.1.1, Remark 7.1.1.3, Lemma
     7.1.1.4, pp.532–533). R2 is ShimuraCompactifications C3 *coherent-cohomology-invariance* and
     *refinement-boundary-ideal* (cited, not re-planned).
   - Two generic coherent facts that SchemeAndStackFoundations does not contain: B4.19
     `qcqsSectionsColimit` (Stacks 0GQZ) and B5.1 `finiteLocallyFreeTrace` (Stacks 0BVH, §49.3).
3. **Upward and out-of-order citations stated as explicit hypotheses** (WORKERS.md "Upstream
   tiers"; CN lists "move down: HodgeTateAndCanonicalSubgroups (3)"):
   `LogHodgeTateInput` replaces HodgeTateAndCanonicalSubgroups `T6:comparison` (tier 16) in B5.20–22;
   `HodgeTateVBInput` replaces the HigherHidaAndColemanTheory VB carrier (outside the 94) in B4.21
   and B5.20; `DualBGGInput` replaces LieHighestWeightPartIICompletedCategoryO (outside the 94) in
   B5.21–22. These are deep theorems whose proofs rest on the higher roadmaps' whole theory, so they
   are not moved down; HodgeTateAndCanonicalSubgroups should export them in this form.
4. **Supplier ids mapped to the lower-tier packages and upstream roadmaps**: SF.0/SF.1/SF.2 →
   SchemeAndStackFoundations SF.1 targets (*torsor*, *qcoh-fpqc-descent*, *stack-quasi-coherent*,
   *finite-quotient-coarse*, *tame-stack*) and SF.2 *qcoh-higher-direct-images*;
   R09.3/R09.5 → AlgebraicModuliForArithmeticGeometry §3.1 `fpqcQuasicoherentDescent`, §5.3
   `TauCeti.ArithmeticModuli.tame_finite_flat_descent`; ComplexComparisonPartII C0/C2/C5.6 by
   declaration; AbelianSchemes A4 by declaration; AdelicAlgebraicGroups AA.4 → TauCetiRoadmap
   AdelicAlgebraicGroups §4.5 targets; R15 anchors → the R15 package titles; ShimuraCompactifications
   stage ids → specific C0–C6 slugs. The logarithmic extension of B3.7/B3.general.2 now cites
   ComplexComparisonPartII C5.6 `CanonicalLogExtension` and keeps only the identification with the
   automorphic canonical extension.

## Notes for other roadmaps

- **ShimuraCompactifications C5 *hodge-line-fourier-jacobi-expansion*** writes the coefficient
  module as `Γ(M^(Z_H), p_*Ψ(ℓ) ⊗ ((∧^top X) ⊗ ω_A)^k ⊗ M)` for an arbitrary module `M`. For non-flat
  `M`, `p_*(Ψ(ℓ) ⊗ M)` and `p_*Ψ(ℓ) ⊗ M` can differ without a base-change theorem (`Ψ(ℓ)` can become
  trivial on special fibres). Lan's 7.1.2.3 uses sections over the torsor `C_Φ`; the SC package
  should state that form. This README's B5 intro says so.
- **HilbertModularVarietiesAndShimuraCurves (tier 14)** H5 cites AutomorphicBundles B4
  `hilbert-arithmetic-weight`, `hilbert-central-descent`, `unsplit-hilbert-descent` and R18.2 cites B2
  (CN: "move down: AutomorphicBundles (5)"). When its package plans those notions, B4.11–B4.14 of
  this package should become citations of it.
- **AlgebraicModularFormsAndSerreWeights (tier 12, accepted package)** cites AutomorphicBundles B3
  for the elliptic logarithmic extension, an upward citation; the general notion is
  ComplexComparisonPartII C5.6 `CanonicalLogExtension`, which it could cite instead.
- The packet fixes listed in `ASM-AutomorphicBundles.md` (B5 cross-part prerequisites, the
  `MILNE-2018` title, library roots) are still open in the packets.

## Checks run

- `lean-check research/blueprint/packages/AutomorphicBundles/Suggested.lean`: exit 0, no errors,
  exactly three warnings, all `declaration uses 'sorry'` (lines 51, 69, 76). Memory was over 100 GB
  available; one compile at a time; nothing left running. The file imports `Mathlib` and
  `TauCeti.Algebra.AlgebraicGroup.Dynamic.Parabolic` at the pins (Mathlib 082e2d3, Tau Ceti f790474).
- `python3 scripts/check_sorry_data.py` on the Lean file: no sorry'd data definition. 441 lines.
- `python3 research/blueprint/intake.py check-files` on the three package files: 0 problems.
- Scripted census: every API and test name of both packets (except the seven nodes now cited from
  ShimuraCompactifications) appears in the README, every target title appears, all 95 targets have
  **Checks.** and a *Lean:* line; every *Lean:* name is a declaration of the file and every
  `-- Test` label of the file appears in the README.
- Adversarial pass (instances computed): GL₂ Hodge parabolic `P(μ⁻¹)` is the lower Borel and
  stabilizes `F⁰` (new check in B0.3); contracted-product orientation on the frame torsor of a line
  bundle gives `𝓛` for `χ` and `𝓛^∨` for `χ⁻¹`, and `O(−1)` on the GL₂ flag; slash values of the
  shears (`(1,−1)`, `(2,−1)`, `(−1,1)`, proved in Lean); Hilbert central character `Norm(t)^w`
  from `t_τ` on `ω_τ` and `t_τ²` on `δ_τ`; `m = −1` for `k = 4`, `w = 2`; the unit-character
  obstruction `θ₁(u)⁻²` for `k + 2m = (1,3)`; the Siegel weights and twists of BCGP Theorem 4.8.2
  and the parity integrality (proved in Lean); `T_ℓ(1) = (ℓ+1)/ℓ`; Diamond's Proposition 6.5.1
  formula for `T_v` on q-expansions (pp.28–29); the trace values on `R[t]/(t²−a)`; the
  `H¹`-torsion criterion for surjectivity of `AF(k,R) → AF(k,R/p)`.
- Sources read in this run (fresh downloads, SHA-256): Milne AA.pdf `f4a36ecc…d46805e` (III Lemma
  3.1, p.58); BCGP arXiv:2502.20645v1 `51d7eacc…4e95c` (§4.5 pp.72–80, §4.6.1 p.81, Remark 3.2.19 p.45,
  §4.8 and Theorem 4.8.2 p.101); Lan, Higher Koecher `5916b37f…f58f0a` (§2–3, Proposition 5.6, Corollaries
  5.8–5.9, Definition 5.10); Diamond arXiv:2211.06922v1 `672b6b4b…585b24c` (§§2.9–2.10, 6.1–6.3, 6.5); Lan
  PEL revision `a7a454f5…c3a079` (7.1.1.1–7.1.1.4); Conrad Luminy notes `1a63a17e…fd59140a` (Theorem 4.1.7);
  Stacks 0GQZ, 0BVH, 0A18. No restricted source was used.

## Where to resume

The package goes to its independent review (`REV-PKG-AutomorphicBundles`, round 2). The reviewer
should check the six new targets and the three named inputs against their sources, and confirm with
the ShimuraCompactifications owner that C5 *hodge-line-fourier-jacobi-expansion* is kept in its
package in the torsor-section form.
