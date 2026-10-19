# CM package fix: the relative Serre-tensor supplier

Job `FIX-PKG-ComplexMultiplicationAndExplicitReciprocity~adv3`, issue #11229. Claude (Opus), session `claude-k6xi0f`, 19 October 2026. The claim was confirmed by the bot in issue comment 6279008052. Work starts from atlas commit `93e60ac82`.

**Disposition: complete, `accepted`.** The package goes to a fresh review.

## Inputs read

- The issue's full instructions. The named report `REV-PKG-ComplexMultiplicationAndExplicitReciprocity~adv.md` does not exist in the repository, its history or on GitHub, and #10955 says that job was created by the stall detector. The fresh review `REV-PKG-ComplexMultiplicationAndExplicitReciprocity~codex.md` states that the missing report is not a finding. Its R1 is the outstanding finding. The 9 October package review (`REV-PKG-ComplexMultiplicationAndExplicitReciprocity.md`) and the two earlier fix handoffs (`~adv`, `~adv2`) were read; they leave nothing else open.
- The supplier, read-only: TauCetiRoadmap pull request 849 (AbelianSchemesAndArithmeticModuli), head `a9b3fcc2b312e1f29db816eb2f6802bb70f19801`. I read README §§A1.1–A1.3a, A3.1, A3.9, A4.1–A4.3, A4.5, A4.7a, A5.1–A5.8, A6.1, A6.7, A6.10–A6.12 and A6.18 in full, and checked its Suggested.lean for Serre-tensor declarations (none; README targets only). The package cites these by roadmap name and section id, never by pull-request number.
- Kings–Sprang, arXiv:1912.03657v4, SHA-256 `fab8e605…40fbb72`, matching the packet record. I read §§1.1–1.3, pp.6–12, and rendered pp.10–12 as page images, because text extraction drops the overlines on Σ̄. Lie(A) has type Σ and ω_{A∨} has type Σ̄. H ≅ H(Σ̄)⊕H(Σ), with H(Σ̄)⊗C ≅ ω_{A∨} and H(Σ)⊗C ≅ Lie. Cor. 1.12 has ω_A = ⊕_{σ∈Σ}ω_A(−σ), with γ acting by σ(γ)⁻¹. Cor. 1.13 has ω_A × H₁ → C^Σ, and the conjugate-linear pairing goes to C^{Σ̄}. The package already had these right. Def. 1.8 requires only a totally complex L with [L:Q]=2d, an injective O_L-action and Lie projective over O_L⊗O_S; the type is a consequence (Prop. 1.11). KS state the degree [b:a] without proof (p.9).
- Current Tau Ceti `a91d3aaf` `IsRiemannForm` (positivity E(Jx,x)>0), to pin the sign convention below.

## Finding → change

| Finding | Change |
| --- | --- |
| R1 (codex review): no supplier for the general relative Serre tensor | Removed the "Required supplier extension" paragraph and the "unfilled" prerequisite. The Exact supplier contracts now list `A1.3a/relativeSerreTensor`, `A1.3a/relativeSerreTensor-functoriality`, `A1.3a/relativeSerreTensor-base-change` and `A4.7a/relativeSerreTensor-lie-tate`, each with its exact hypotheses, and the Scope table row names A1.3a/A4.7a. CM.1.3 keeps only the CM specialization: ideal-isogeny degrees with their inseparable parts, preservation of the type, and the eigenspace and period comparisons with ideal twists. |
| R1, re-verify `cmSerreTensor` | Hypotheses now match the supplier: any S, an injective O_L-action with [L:Q]=2·reldim, and any finite projective M. Lifted type and Lie projectivity are no longer assumed; type preservation is stated where the type is defined, over O_{L^Gal}[1/d_L]-algebras. The relative dimension rd comes from the A4.7a Lie comparison and freeness over the semilocal rings O_L⊗O_{S,s}. Rank zero gives A1.3a's identity scheme. Faithfulness for M≠0 and the O_L-linear isogeny a⊗A ~ A come from the maps induced by a→O_L and O_L→a. |
| R1, re-verify `cmSerreTensor.ideal_kernel_degree` | The statement is unchanged in substance: degree [b:a], [c] the c-multiplication map with kernel A[c], N(c), |n|^{2d}, finite-flat with inseparable parts. It now has a proof route from the supplier: the Hom description of A1.3a gives the kernel; A1.2(3) and torsion-freeness keep the action injective on fibres; A6.12 gives deg x = N(x); A3.1 `comp_rank`; and choosing x∈ab⁻¹ with the right valuations above each ℓ separates the ℓ-parts. |
| R1, re-verify `cmSerreTensor.lie` | Lie(M⊗A)=M⊗_{O_L}Lie(A) is A4.7a. For invertible a it is locally isomorphic to Lie(A) as an O_L⊗O_S-module, so it stays projective and has the same type. |
| R1, re-verify `cmHodgeEigenspaces` | Stated with KS's hypotheses and Def. 1.7 for H_A. Added the twist compatibility from A4.7a's covariant comparison: H_{a⊗A}(σ) ≅ (a⊗_{O_L,σ}R)⊗H_A(σ), compatible with both Hodge sequences. The covariant sequence is identified as the A4.3 sequence of A∨. |
| R1, re-verify `cmPeriodPairings` | The integration pairing is now sourced to A5.6–A5.7 and the de Rham duality to A4.3. Added naturality: the period pairing directly, the de Rham pairing via f∨. Added the twist compatibility through the new API `cmSerreTensor.periodLattice`: Lie twists are identified with C^Σ, the period lattice is aΛ, and [c] is C^Σ/Λ→C^Σ/c⁻¹Λ (KS (1.3.3)–(1.3.4), p.12). |
| Generality and negative controls | New Checks: `test_nonprincipal`, the Z[√−5] twist by (2,1+√−5): same type and isogenous, but not O_L-isomorphic, with the other root of H_{−20}. `test_torsion_excluded` is now concrete: over F̄₅ with i acting on Lie by 3, the fppf sheaf (Z[i]/(2+i))⊗A is 0 while (Z[i]/(2+i))⊗Lie(A) = Lie(A). New API: `directSum`, `faithful`, `tate`, `periodLattice`. Boundary cases added: a=b, c=O_L, n=0 excluded, and the connected versus étale rank-5 kernels of [2±i] over F̄₅. |
| Supplier ids | `A6/degree-of-an-endomorphism` → `A6.1/Hom.deg` and `A6.12/traceDegreeSubfield`. `A6/characteristic-polynomial-on-tate-module` → `A6.11/charpolyTate`. `A6/characteristic-polynomial-of-an-endomorphism` → `A6.10/End.charpoly`. `A6/automorphisms-of-polarized-abelian-varieties` → `A6.18/polarizedAutomorphisms`. `cmNewtonSlopes` A4 → `A4.5/BarsottiTate`. The A0, A1, A4 and A5 contracts are rewritten to the supplier's actual sections and declarations. |
| Sign convention against the supplier (found while re-verifying A5) | The CM package uses E_ξ(x,y)=Tr(ξxȳ) with E_ξ(x,Jx)>0. A5.2, like Tau Ceti `IsRiemannForm`, uses E(Jv,v)>0 with E(i,1)=1. Conventions now state that the A5 form of (I,ξ) is −E_ξ = Tr(ξx̄y), with the witness (Z[i],i/2): E_ξ(1,i)=1 and −E_ξ(i,1)=1. The `squareForm` docstring records the same sign. |
| Form | Four subsection anchors (cm-0-2, cm-0-3, cm-1-2, cm-2-4) sat above the previous subsection's trailing Checks and were moved to their headings. Five "API comparisons used independently of the construction" blocks repeated API bullets with locators identical to their parent targets' and were removed; the bullets and locators remain in the API lists and targets. |
| Suggested.lean | The closing list of README-only definitions no longer names `relativeSerreTensor`, which is the supplier's. No declaration changed. The Serre-tensor carriers are not at the pins, so CM.1.3 stays README-only. |

## Adversarial pass on the touched statements

| Statement | Instances tried | Result / change |
| --- | --- | --- |
| `cmSerreTensor`: dimension rd | M=0 gives the identity scheme S, dimension 0. M=O_L gives d. M=O_L² gives 2d. M=a nonprincipal gives d. Bases S=Spec C and Spec F̄₅. | Holds for any S; the rank-zero output is not a CM object. |
| `cmSerreTensor`: faithfulness | M=0: 1 acts as 0, so excluded. M=a: the isogeny to A via a→O_L, O_L→a. Fibres: End is torsion-free and O_L/I is finite. | "For M≠0" is required, and was added. |
| `cmSerreTensor`: type preservation | Principal (x): multiplies H(σ) by σ(x). An ideal twist never swaps Σ and Σ̄. General S, where the type is undefined. | Type is stated only over O_{L^Gal}[1/d_L]-algebras. |
| `cmSerreTensor.lie` and torsion modules | M=Z[i]/(2+i) over F̄₅ with i ↦ 3 on Lie. | The fppf sheaf is 0 but M⊗Lie=Lie≠0, so projectivity is essential. Added as a negative control. |
| `ideal_kernel_degree` | a=b gives degree 1. c=O_L gives [c]=id. n=0 is excluded. (n=2,d=2) gives 16, not 4. c=(2+i) gives 5 over C (five points), while over F̄₅ [2+i] has a connected kernel with one point and [2−i] an étale one. | A point count fails; finite-flat rank holds. |
| Proof route of `ideal_kernel_degree` | c=(2+i), ℓ=5: x=2+i, c′=(1), z=1. c=(2) in Z[i], ℓ=2: x=2, z=1. Ranks multiply: [b:xb]=[b:a][a:xb]. | Consistent. Existence of x is the approximation theorem in O_L. |
| Kernel description A[c] | Principal c (one generator); general c (two generators); M*=Hom(c⁻¹,O_L)=c. | Matches the A1.3a Hom description. |
| `cmHodgeEigenspaces` | Gaussian d=1: Lie has type {id} and ω_{A∨} the conjugate type. γ=i acts on ω_A(−id) by −i, while the pullback [i]^*dz=i·dz. | Checked against KS page images; unchanged. |
| `cmPeriodPairings` / `periodLattice` | Gaussian: ⟨dz,γ⟩=γ. c=(2+i): lattice c⁻¹Z[i], index 5. c=(n): lattice n⁻¹Λ, kernel (Z/n)^{2d}. The first de Rham argument is conjugate-linear. | Naturality is direct for the period pairing and goes via f∨ for the de Rham pairing (wording corrected). |
| A5 sign convention | (Z[i],i/2): E_ξ(1,i)=1 and E_ξ(i,1)=−1. A5.2 has E(i,1)=1. | The translation −E_ξ is pinned in Conventions. |
| Re-cited A6/A4 uses | `degree_eq_norm`: deg u=N(u) by A6.12 with F=E, f=2. Automorphism factors: A6.18(2) needs n≥3 prime to the characteristic, as the CM statement says. Tate polynomials: A6.11. | Supplier content supports each use. |

## Checks run

- `lean-check research/blueprint/packages/ComplexMultiplicationAndExplicitReciprocity/Suggested.lean`: exit 0, no errors, 22 warnings, all `declaration uses 'sorry'`, at Mathlib 082e2d37e8. The file imports only Mathlib.
- `python3 scripts/check_sorry_data.py` on Suggested.lean: pass.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- README anchor and reference-link resolution, and `git diff --check`: pass. README size is about 153 KB (1,000 lines); Suggested.lean has 303 lines.
- The packet is unchanged; it is outside this job's files.

## Notes for the maintainer and the next reviewer

- The codex review's coordination note still stands. The atlas ShimuraVarieties package §5.1 also describes CM types, reflex fields and primitive cores, which RS-04 assigns to CM.0. That other package was not edited.
- The supplier is still an open upstream pull request. If its section numbering changes before merge, the ids A1.3a, A3.1, A4.1/A4.3/A4.5/A4.7a, A5.1–A5.8, A6.1, A6.10–A6.12 and A6.18 cited here need updating.
- Nothing in the untrusted texts read (the supplier pull-request files and the fetched KS PDF) contained instructions; nothing suspicious to report.
- No second issue was claimed. The scratch files are not needed by anyone.
