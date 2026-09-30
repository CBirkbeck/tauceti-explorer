# Deformation-to-Hecke maps, patching and the GL₂ lifting theorems (layers R22.1–R22.6)

**Fix revision, 30 September 2026 — Codex codex-5ebb6f, Refs #5142.** Independent REV-FIX is pending. The full prior needs_changes verdict is archived verbatim in reviewHistory and all fifteen prior gaps remain. This revision adds eight §7.6/§8 nodes and two precise gaps: 68 nodes, 21 open requests, 17 gaps. The α/β definitions retain their stable R22.5 IDs but have early parent R22.1; they use the Hilbert Galois-representation supplier directly and do not depend on the prescribed-witness conclusion. No R = T or proof closure is assumed in the new construction.

*GL₂ modularity lifting, part 1 (R22.1–R22.6, R32.1–R32.2). Checkpoints 1–3 plan R22.1–R22.6; checkpoint 4 plans R32.1
and R32.2.*

## Purpose

A Taylor–Wiles–Kisin proof compares a deformation ring with a Hecke algebra. These two layers build that comparison at
finite level:
- **R22.1** fixes the residual modularity witness (actual eigenform data), and identifies the local deformation problem
  that every Hecke eigensystem satisfies. It then constructs the deformation-to-Hecke map R̄^ψ_S → 𝕋_ψ(U)_𝔪 and proves it
  surjective.
- **R22.2** adds the Taylor–Wiles primes of GlobalGaloisDeformations R04.5. It builds the auxiliary levels and their
  Hecke algebras, applies R18.3’s freeness over 𝒪[Δ_Q] and proves the Galois-dependent control back to level U. This produces the system of modules that
  R22.3 patches.

Nothing in R22.1–R22.2 asserts R = T. That is the conclusion of R22.3–R22.4, through DeformationAndDerivedPatchingAlgebra
R03.6. R22.5 and R22.6 then state the lifting theorems themselves, each with its own hypotheses: KW II Theorem 9.7 for odd
p and for p = 2, Kisin's potentially Barsotti–Tate theorems for odd p and for p = 2, Gee's Fontaine–Laffaille theorem, and
Hypothesis (H) of KW I.

## Ownership (RS-08, RS-23) and imports

- **RS-08 keeps:**
  - **R22.1:** the actual classical minimal deformation-to-Hecke map, not an abstract ring map or the assertion R = T.
  - **R22.2:** actual auxiliary levels and Galois-dependent rank/coinvariant control at R04.5 primes; Galois-free freeness is imported from R18.3.
- **RS-23 keeps in HilbertModularVarietiesAndShimuraCurves R18.3:**
  - the definite quaternionic forms and Hecke algebras;
  - the integral freeness criterion (KW II Lemma 7.4);
  - the Ihara-type lemma (Lemma 7.1);
  - the dyadic twist of forms (Proposition 7.6).

  These are requested through R18.6. R22.2 verifies their hypotheses at the Taylor–Wiles levels, and adds the
  Galois-dependent rank and coinvariant control; Galois-free localized freeness is also R18.3’s.
- **Imports:**
  - AutomorphicGaloisRepresentations R19.6: ρ_𝔪 over 𝕋, and local–global compatibility.
  - KW II Theorem 8.4 is owned by R22.1 in this packet. R20.6 retains the distinct Kisin/Gee requests; it is not the supplier of §8.
  - LocalGaloisDeformationRings R08.6: the local conditions.
  - GlobalGaloisDeformations R04.4–R04.6: the global rings, Taylor–Wiles data and twisting (packet nodes).
- **RS-08 keeps for R22.5:** the odd-prime ordinary, finite-flat/potentially Barsotti–Tate and crystalline-range lifting
  statements, each with its hypotheses, and which formulations avoid the global-finiteness argument (KW I Theorem 4.1 is
  assembled in PotentialModularityAndCompatibleSystems R24.4). R21.4 is imported only on the exact ordinary overlap.
- **RS-08 keeps for R22.6:** the 2-adic lifting theorems needed by KW I, and Kisin's 2-adic Barsotti–Tate theorem with the
  derivation of Hypothesis (H). The Barsotti–Tate component geometry is LocalGaloisDeformationRings R08.4, and the
  real-place and local-at-2 calculations are R08.5.
- **New imports (checkpoint 3):**
  - OrdinaryAutomorphicFormsAndModularityLifting R21.4: the ordinary lifting theorem.
  - LocalGaloisDeformationRings R08.4 and R08.5: potentially Barsotti–Tate components, and the dyadic local rings.
  - LocalGaloisDeformationRings R08.6: Fontaine–Laffaille rings for unramified F_v.
  - GL2AutomorphicRepresentationsAndTransfer R17.4: solvable base change and descent of modularity.
  - FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4: crystalline with Hodge–Tate weights {0, 1} is Barsotti–Tate.
  - SerreWeightAndLevelOptimisation R20.6: Kisin's type and level changes of quaternionic eigenforms.
- **New imports (checkpoint 4):**
  - PadicLocalLanglandsForGL2Qp R30.6: the Breuil–Mézard conjecture in cycle form for p > 2 (Paškūnas, Hu–Tan, Tung),
    Kisin's local inequality through Colmez's functor, and Emerton's Theorem 3.3.22.
  - CompletedCohomologyAndLocalGlobalCompatibility R31.5: the global inputs of Tung's proof (patched modules on unitary
    groups, Emerton–Paškūnas faithfulness, Barnet-Lamb–Gee–Geraghty Theorem A.4.1).
  - SerreWeightAndLevelOptimisation R20.6: Gee's Theorem 4.4.12 on modularity of prescribed weight.
  - Dickson's classification (ClassicalSerreModularity R27.1), the p-adic monodromy theorem (PadicHodgeTheory R06.3),
    potentially semistable deformation rings (LocalGaloisDeformationRings R08.3), and the coefficient-prime behaviour of
    ρ_f (AutomorphicGaloisRepresentations R19.5), all as packet nodes.

## Sources

- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (II)*, Invent. Math. 178 (2009): the authors' final
  version on Khare's UCLA page, §7 and §9.
- T. Gee, *Modularity lifting theorems*, arXiv:2202.05818v2, §4.24–4.27 and §5.2–5.10. This is the p ≥ 5 version with
  Im ρ̄ ⊇ SL₂(𝔽_p).
- C. Khare and J.-P. Wintenberger, *Serre's modularity conjecture (I)*, Invent. Math. 178 (2009): the authors' version,
  Theorem 4.1 and §9 (Hypothesis (H)).
- M. Kisin, *Moduli of finite flat group schemes, and modularity*, Ann. of Math. 170 (2009), and *Modularity of 2-adic
  Barsotti–Tate representations*, Invent. Math. 178 (2009): the author's preprints (DVI files on his Harvard page), read
  through a text extraction.
- Checkpoint 4 (R32.1–R32.2):
  - L. V. Dieulefait and A. M. Pacetti, *A simplified proof of Serre's conjecture*, arXiv:2108.07577v2: §1.2, Lemma 1.13
    and every appeal to Theorem 1.4 in §2.
  - M. Kisin, *The Fontaine–Mazur conjecture for GL₂*, J. Amer. Math. Soc. 22 (2009): the author's preprint (fmc.dvi),
    introduction, §1.2, §1.7 and §2.2. In §2.2 some items are numbered one lower than in print: Theorem (2.2.17) is the
    published (2.2.18).
  - T. Gee and M. Kisin, *The Breuil–Mézard conjecture for potentially Barsotti–Tate representations*, Forum Math. Pi 2
    (2014), arXiv:1208.3179v5: Appendix B, "Errata for [Kis09a]".
  - M. Emerton, *Local-global compatibility in the p-adic Langlands programme for GL₂/ℚ* (preprint, 2011): §1.2,
    Theorem 3.3.22, and §§7.3–7.4.
  - V. Paškūnas, *On the Breuil–Mézard conjecture*, Duke Math. J. 164 (2015), arXiv:1209.5205v3: §1.
  - Y. Hu and F. Tan, *The Breuil–Mézard conjecture for non-scalar split residual representations*, Ann. Sci. ÉNS 48
    (2015), arXiv:1309.1658v2: §1 and §6.
  - S.-N. Tung, *On the automorphy of 2-dimensional potentially semi-stable deformation rings of G_{ℚ_p}*, Algebra Number
    Theory 15 (2021), arXiv:1803.07451v4: introduction, Theorem 1.2 and §4.

## Layer R22.1: minimal deformation-to-Hecke maps

Library module: `TauCeti/NumberTheory/ModularityLifting/HeckeMap`, namespace `TauCeti.ModularityLifting`.

**Definition: minimal-level data** (`MinimalLevelData`; node `minimal-level-data`; KW II §9.1.1, Gee §5.6). This
records the definite D ramified at Σ ∪ ∞, the level U by type, and W_k. For p = 2 it records U_v = D_v^× at Σ and the
extended W_2. It also records a non-Eisenstein 𝔪 from π fitting the lifting data, with ρ̄_𝔪 ≅ ρ̄.

*API.* `heckeAlgebra`, `heckeModule`, `residual_iso`.

*Unit tests.*
- For p = 2, U is not compact.
- The residual representation is ρ̄.
- There is no field asserting R ≅ 𝕋.

**Theorem: the local problem at each place** (node `hecke-points-local-conditions`; KW II Lemmas 7.2 and 7.7 and
Corollary 7.8). Every 𝒪′-point of 𝕋_ψ(U)_𝔪 gives a lift satisfying the lifting data at every v ∈ S:
- semistable with a fixed γ_v at Σ;
- odd at ∞;
- type (A), (B) or (C) at p.

**Construction: the deformation-to-Hecke map** (`defToHecke`; node `deformation-to-hecke-map`; planet; KW II Lemma 9.1,
Gee §5.6). The map is R̄^ψ_S → 𝕋_ψ(U)_𝔪 with tr ρ̄^univ(Frob_v) ↦ T_v. It comes from the universal property and
GlobalGaloisDeformations R04.6/factorization-through-local-conditions.

*Unit tests.*
- Traces of Frobenius map to T_v.
- Specialisation gives ρ_π.
- No injectivity is claimed.

**Theorem: surjectivity** (node `deformation-to-hecke-surjective`; planet). 𝕋 is generated by the T_v and S_v = ψ(π_v),
and the image of the complete local ring is closed.

**Construction: framed Hecke algebra and module** (`framedHecke`, `framedHeckeModule`; node `framed-hecke-module`).
- 𝕋^□_𝔪 = 𝕋⟦4|S| − 1⟧ is reduced and 𝒪-flat.
- M^□ is faithful, and free over the framing variables.

## Layer R22.2: auxiliary levels and freeness

Library module: `TauCeti/NumberTheory/ModularityLifting/AuxiliaryLevels`.

**Definition: auxiliary levels** (`auxLevel`, `auxDelta`; node `auxiliary-level-groups`; KW II §7.4, Gee §5.6).
- U_Q ⊆ U^0_Q, with U^0_Q/U_Q ≅ Δ_Q.
- Δ_v is Δ′_v modulo its N-torsion, where N is the isotropy exponent.
- For p ≥ 5 unramified, N is prime to p and Δ_v = Δ′_v (Gee).

*Unit tests.*
- Q = ∅.
- The quotient U^0_Q/U_Q is Δ_Q.
- Using Δ′ instead of Δ fails in the presence of p-torsion isotropy.

**Construction: Hecke algebras at level Q** (`auxHecke`, `defToAuxHecke`; node `auxiliary-hecke-algebra`).
- The operators are T_v, S_v, U_v and ⟨h⟩.
- The Hensel factors are A_v and B_v, and 𝔪_Q ∋ U_v − α̃_v (the eigenvalue choice).
- There is a surjection R̄^ψ_{S∪Q} ↠ 𝕋_{ψ,Q}(U_Q)_𝔪 with γ_{α_v}(π_v) ↦ U_v.

**Theorem: the Δ_Q-actions agree** (node `delta-actions-agree`; Gee Proposition 5.8(1)). The diamond action equals the
action through χ_α ∘ Art, by the principal-series computation at v ∈ Q.

**Theorem: freeness and control** (node `delta-freeness-at-taylor-wiles-level`; planet; KW II Corollary 7.5, Gee
Propositions 5.8(2) and 5.9).
- S(U_Q)_𝔪 is free over 𝒪[Δ_Q], of the rank of S(U)_𝔪.
- The coinvariants are S(U)_𝔪, with U_v ↦ A_v.
- The proof has three inputs:
  - the isotropy hypothesis;
  - the absence of Steinberg forms at Q (local–global compatibility);
  - the Ihara-type lemma mod λ.

**Construction: the module system** (`twModule`; node `taylor-wiles-module-system`; planet). M_n is finite free of fixed
rank over 𝒪[Δ_{Q_n}]⟦y⟧, compatibly with R04.6's Taylor–Wiles system.

**Construction: dyadic twists of forms** (`twistForm`; node `dyadic-twists-of-forms`; KW II §7.5).
- The twist is f_χ(g) = f(g)χ(Nm g).
- It satisfies T_v ↦ χ(π_v)T_v, U_v ↦ χ(π_v)U_v and ⟨h⟩ ↦ χ^{−1}(h)⟨h⟩.
- It is compatible with the deformation-side twists (R04.4, R04.5).

## Layer R22.3: arithmetic patching

Library module: `TauCeti/NumberTheory/ModularityLifting/Patching`.

RS-08 narrows R22.3 to the arithmetic instance. The abstract inverse-limit patching (R03.5) and the Auslander–Buchsbaum
step (R03.3) are requested; DeformationAndDerivedPatchingAlgebra R03.6's support nodes are reused.

**Construction: patching data** (node `arithmetic-patching-data`; KW II Proposition 9.2 (I), Gee §5.6).
- (D_m, L_m) of level m, from the R04.6 and R22.2 systems.
- The annihilator bound makes L_m free over 𝒪⟦y⟧/c_m.
- There are finitely many classes at each level.

**Theorem: the patched ring and module** (node `patched-ring-and-module`; planet).
- B⟦x⟧ ↠ R_∞ ↠ R̄^{□,ψ}_S.
- M_∞ is finite free over 𝒪⟦y⟧, faithful at level U after specialisation.

**Theorem: support** (node `patched-support`; planet). Depth ≥ dim gives support on components. When B is a domain,
R_∞ ≅ B⟦x⟧ and the support is full.

**Theorem: finiteness of the minimal ring** (node `minimal-ring-finite`). R̄^ψ_S is finite over 𝒪 at the minimal level;
global finiteness is R24.1.

**Theorem: R = T after inverting p** (node `generic-fibre-r-equals-t`; planet). Auslander–Buchsbaum over R_∞[1/p] shows the
kernel is p-power torsion.

## Layer R22.4: components and nonminimal levels

Library module: `TauCeti/NumberTheory/ModularityLifting/Components`.

**Construction: the Ihara-avoidance pair** (node `ihara-avoidance-comparison`; Gee §5.6, Taylor).
- 𝒮_Q uses unipotent conditions at T_r, and 𝒮′_Q uses (ζ, ζ^{−1}).
- They agree mod λ, and (R^{loc,′})^red is irreducible (LocalGaloisDeformationRings R08.2).

**Theorem: transfer of support** (node `support-transfer-mod-lambda`; planet).
- S′_∞ has full support.
- Full support passes to S_∞/λ, then to S_∞, because the components of R_∞ and R_∞/λ correspond.
- It then descends to S_∅.

**Theorem: modularity from full support** (node `modularity-from-full-support`; planet; Gee Lemma 5.7).
(R^univ_∅)^red ≅ 𝕋_∅, and points of type 𝒮_∅ are modular.

**Theorem: integral R = T** (node `integral-r-equals-t-when-smooth`; planet; KW II §4.2).
- For smooth local rings, M_∞ is free and R ≅ 𝕋 is a complete intersection.
- Cohen–Macaulay, Gorenstein and complete-intersection properties pass from the local rings.

## Layer R22.5: odd-prime modularity lifting

Library module: `TauCeti/NumberTheory/ModularityLifting/Lifting`.

**Definition: residual modularity as KW II use it** (node `kw-residual-modularity`). (α): ρ̄ ≅ ρ̄_π with π unramified
above p and of weight k(ρ̄). (β): ρ̄ ≅ ρ̄_π with π of conductor dividing v above p and of weight 2. The lifting theorems
take these, not "ρ̄ is modular"; converting one into the other is the weight part of Serre's conjecture, used in R24.4.

**Lemma: solvable base change** (node `solvable-base-change-reduction`). Taylor's local-prescription lemma and descent of
modularity along solvable totally real extensions (Gee 4.25, 4.27), requested from GL2AutomorphicRepresentationsAndTransfer
R17.4.

**Theorem: the Khare–Wintenberger lifting theorem for odd p** (node `kw-odd-prime-lifting`; planet; KW II Theorem 9.7).
- Hypotheses: F unramified at p, ρ̄|G_{F(μ_p)} absolutely irreducible, (α) and (β).
- The lift is totally odd, of type (A) crystalline of weight 2 ≤ k ≤ p + 1, (B) weight 2 and crystalline over
  ℚ_p^{nr}(μ_p), or (C) semistable weight 2 of the form (γ_vχ_p ∗; 0 γ_v).
- The proof is base change, then this packet’s R22.1/theorem-8-4-prescribed-modular-lifts, then R22.3’s generic-fibre R = T. It uses neither KW II Theorem
  10.1 nor potential modularity.

**Lemma: patching on a chosen component** (node `component-patching`; Kisin (3.3.1), (3.4.11), (3.4.12)). Replace the
local ring by one component with geometrically integral, formally smooth generic fibre. Then every point of that
component is modular once one modular point lies on it.

**Theorem: Kisin's potentially Barsotti–Tate theorem** (node `kisin-potentially-bt-lifting`; planet; Annals (3.5.5),
(3.5.7), (3.5.8)).
- "Strongly residually modular" means a parallel weight 2 form with the same potential ordinarity at each 𝔭 | p.
- Also needed: residue field 𝔽_p at non-potentially-ordinary 𝔭, cyclotomic irreducibility, and the p = 5 condition.
- Over ℚ it becomes: potentially Barsotti–Tate at p, ρ̄ modular, ρ̄ irreducible over ℚ(√((−1)^{(p−1)/2}p)).

**Theorem: Fontaine–Laffaille lifting** (node `fontaine-laffaille-lifting`; planet; Gee Theorem 5.2). p > 3, p unramified
in F, crystalline with distinct Hodge–Tate weights at most p − 2 apart, and Im ρ̄ ⊇ SL₂(𝔽_p). It is proved by Ihara
avoidance (R22.4).

**Comparison: the ordinary overlap** (node `ordinary-overlap`). Type (C) and ordinary weight p + 1 lifts are ordinary, so
here OrdinaryAutomorphicFormsAndModularityLifting R21.4 applies as well. Types (A) non-ordinary and (B), and Kisin's
non-ordinary cases, stay in this layer.

## Layer R22.6: dyadic lifting and Kisin's completion

Library module: `TauCeti/NumberTheory/ModularityLifting/Dyadic`.

**Lemma: oddness at 2** (node `dyadic-oddness`). det ρ̄(c) = −1 is empty in characteristic 2. A lift is odd if and only if
det ρ(c) = −1. If ρ̄(c) ≠ 1 every lift is odd, but diag(1, −1) is odd with ρ̄(c) = 1. So oddness is imposed by the
archimedean ring (LocalGaloisDeformationRings R08.6/export-archimedean), never by ρ̄(c).

**Construction: dyadic patching** (node `dyadic-patched-ring`; planet; KW II Proposition 9.3 (I)). B⟦x⟧ ↠ R′_∞ ↠ R_∞ with
a free action of the torus T and d : Sp R′_∞ → T, d(λx) = λ²d(x), Sp R_∞ = d^{−1}(1). The inputs are GlobalGaloisDeformations
R04.4/R04.6 and R22.2's twists.

**Lemma: the torsor** (node `dyadic-patched-torsor`; Lemmas 9.4–9.6).
- R_∞ is a T[2]-torsor over R^inv_∞, and B⟦x⟧ ≅ R′_∞.
- R_∞[1/2] is regular.
- M_∞ is faithful, because T[2](𝒪) acts transitively on components and preserves the support.

**Theorem: R = T after inverting 2** (node `dyadic-r-equals-t`; Proposition 9.3 (II)–(III)).

**Theorem: the Khare–Wintenberger 2-adic lifting theorem** (node `kw-dyadic-lifting`; planet; Theorem 9.7 at p = 2, the
content of KW I Theorem 4.1(1)).
- Hypotheses: non-solvable image, (α) if k(ρ̄) = 2, and (β).
- The lift is crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2.

**Lemma: Kisin's dyadic component criterion** (node `kisin-dyadic-component-criterion`; Kisin 2-adic (3.2.9)). ρ and ρ_f
must match at Σ, away from Σ and in ordinarity at v | 2, with ρ̄|G_{F_v} trivial or κ(v) = 𝔽_2.

**Theorem: Kisin's 2-adic Barsotti–Tate theorem** (node `kisin-dyadic-bt-lifting`; planet; (3.3.5), (0.9), (0.1)).
- Hypotheses: ρ̄ modular with non-solvable image, and potentially Barsotti–Tate at v | 2.
- det ρ = χψ with ψ totally even, and F_v = ℚ_2 where ρ is potentially ordinary.

**Theorem: Hypothesis (H)** (node `hypothesis-h`; planet). At p = 2, (H) follows from Kisin (0.1).
- det ρ·χ^{−1} has finite order, because G_ℚ^{ab} is generated by inertia.
- It is even, because ρ is odd.
- Potentially crystalline of weight 2 means potentially Barsotti–Tate (FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.4).
- KW I §9 uses (H) only at p = 2.

## Layer R32.1: the statement table

Library module: `TauCeti/NumberTheory/ModularityLifting/StatementTable`.

**Definition: the statement table** (node `lifting-statement-table`; planet). Dieulefait–Pacetti's Theorems 1.4–1.7 become
four propositions, with their hypotheses as printed. Each is proved in its own layer:
- `OddPrimeLifting p` (p odd): odd, ρ̄|G_{ℚ(√p*)} absolutely irreducible, de Rham with weights {0, k − 1}, ρ̄ modular. R32.2.
- `DyadicLifting`: p = 2, odd, de Rham, ρ̄ modular with non-solvable image. R32.3.
- `ResiduallyReducibleLifting p` (p ≥ 5): irreducible, odd, de Rham, ρ̄^{ss} a sum of two characters. R32.4.
- `OrdinaryThreeLifting`: p = 3, ρ̄^{ss} ≅ 1 ⊕ χ̄₃, ordinary at 3, det ρ = ψχ₃^{k−1}. R32.5. DP's further hypothesis
  ρ|D₃ ≠ (1 0; 0 1) is automatic (OrdinaryAutomorphicFormsAndModularityLifting/E9).

**Lemma: ℚ(√p*) against ℚ(ζ_p)** (node `quadratic-cyclotomic-irreducibility`; DP Lemma 1.13). For odd ρ̄ and odd p, ρ̄ is
irreducible over ℚ(√p*) exactly when it is irreducible over ℚ(ζ_p).
- If ρ̄|G_{ℚ(ζ_p)} is reducible, the image of ρ̄ is solvable.
- In the dihedral case, the index-two subgroup ⟨H, ρ̄(σ²)⟩ lies in the torus.
- A₄ and S₄ are excluded because p ∤ 24.
- p = 3 is trivial, since ℚ(√−3) = ℚ(ζ₃).

**Lemma: non-solvable image** (node `non-solvable-residual-image`). Non-solvable image survives every solvable base change
and gives absolute irreducibility over every ℚ(ζ_{p^n}).

**Lemma: twists and oddness** (node `hodge-tate-and-oddness-normalisation`).
- Distinct weights normalise to {0, k − 1}.
- "Modular up to twist" with weights {0, k − 1} means modular of weight k.
- For odd p, ρ̄ odd forces ρ odd. For p = 2 it does not.

**Comparison: which forms assume ρ̄ modular** (node `residual-modularity-forms`). Every source prints its theorem twice:
- with ρ̄ modular as a hypothesis: Kisin (2.2.17), Hu–Tan 6.3, Tung 4.7, DP 1.4;
- with only ρ̄ odd, and residual modularity from Khare–Wintenberger: the introduction theorems of Kisin and Tung,
  Hu–Tan 1.4, and Emerton 1.2.4. Emerton's promodularity, Theorem 1.2.3, invokes Serre's conjecture in §7.3.

Only the first kind is admissible in a proof of Serre's conjecture.

**Comparison: the local exclusions at p** (node `exceptional-local-cases`).
- Kisin excludes ρ̄_p ≅ (ωχ ∗; 0 χ), and needs ρ semistable over an abelian extension.
- Kisin's (1.2.7) has extra p = 3 exceptions.
- Emerton excludes χ ⊗ (1 ∗; 0 ω).
- Paškūnas (p ≥ 5, scalar endomorphisms), Hu–Tan (p ≥ 5, split non-scalar) and Tung (every p > 2) remove the
  exclusions. Emerton's Theorem 3.3.22 removes the abelian condition.
- The p = 3 case ρ̄_p a twist of an extension of 1 by ω is due to Tung alone.

## Layer R32.2: odd-prime de Rham lifting

Library module: `TauCeti/NumberTheory/ModularityLifting/DeRhamLifting`.

**Theorem: Kisin's multiplicity criterion** (node `kisin-multiplicity-criterion`; planet). This is Kisin (2.2.10),
(2.2.14) and (2.2.16), as corrected by Gee–Kisin Appendix B.
- M∞ is faithful over R̄∞ exactly when e(R̄∞/π) ≤ 2^{−|R|} e(M∞/π). R is the set of auxiliary places where ρ̄(Frob_v)
  has equal eigenvalues.
- The graded pieces of M∞ have multiplicities e_Σ ∏ μ_{n,m}, so Breuil–Mézard at every v | p gives faithfulness.
- The corrections are N(v) ≢ −1 at Σ, the factors at Σ, and the withdrawn Lemma (2.2.1) (E4–E6).

**Theorem: Kisin's Fontaine–Mazur theorem** (node `kisin-fontaine-mazur-totally-split`; planet; (2.2.17), printed
(2.2.18)). For F totally real with p split, assume:
- ρ is semistable over an abelian extension, with distinct weights;
- ρ̄ is modular and irreducible over F(ζ_p);
- ρ̄|G_{F_v} ≇ (ωχ ∗; 0 χ).

The proof uses base change, Gee's weight theorem (requested), the local inequality through Colmez's functor (requested),
the multiplicity criterion, and descent.

**Theorem: de Rham lifting at odd p** (node `odd-prime-de-rham-lifting`; planet; Tung 4.7, Hu–Tan 6.3). The hypotheses are
ρ̄ modular, ρ̄|G_{F(ζ_p)} absolutely irreducible, and ρ potentially semistable with distinct weights. There is no local
restriction, and p = 3 is included.
- The local input is Breuil–Mézard for every p > 2 (Tung Theorem 1.2), requested from R30.6.
- Tung's global inputs (patched modules on unitary groups, Emerton–Paškūnas, Barnet-Lamb–Gee–Geraghty) are requested from
  R31.5.

**Theorem: DP's Theorem 1.4 at every odd p** (node `odd-prime-statement-over-q`). F = ℚ, with ℚ(√p*) converted to ℚ(ζ_p),
de Rham converted to potentially semistable, and the twist normalised. Semistable non-crystalline weight two, such as a
Tate curve at p, needs this theorem: Kisin's Annals theorem covers only potentially Barsotti–Tate lifts.

**Application: the hypotheses at each use** (node `application-requirements`). DP apply Theorem 1.4 at:
- w (Paso 1), q (Paso 2), each odd ramified p_i (Paso 3), N (Paso 5) and 5 (Paso 6);
- 3 in Lemma 2.3.

At each use the residual image, the weights {0, k − 1} or {0, 1} (de Rham, not necessarily crystalline), oddness and
residual modularity are checked. No ordinarity is needed. The p = 3 uses (Paso 3, Lemma 2.3) are why the p = 3 theorem
is needed.

## Mistakes found in the sources

**E1 (misprint, reaches nothing): Kisin, 2-adic paper, Theorems (0.9)(2) and (3.3.5)(2), in the preprint read.** They say
"Barsotti-Tate" where the theorem is about potentially Barsotti–Tate representations. (0.9) is announced as the totally real
version of (0.1), which says potentially Barsotti–Tate. Condition (3) and the proof refer to potentially ordinary places and to
matching nontrivial types; for a Barsotti–Tate ρ, potentially ordinary would just mean ordinary. The published version was
not accessible.

**E2–E6 (already corrected in print): Kisin, *The Fontaine–Mazur conjecture for GL₂*, in the preprint read.** Gee–Kisin's
Appendix B, "Errata for [Kis09a]", corrects five points. Each was checked at its place in the DVI:
- **E2 (error, reaches the proof).** Lemma (1.7.5) claims that (1.7.6) is a closed immersion. It is only a homeomorphism
  onto its image, so the formal smoothness claim is dropped, and the exception in Corollary (1.7.14) changes (B.1).
- **E3 (gap).** Lemma (1.7.4): the line L_A is unique only when G_{ℚ_p}, and not just inertia, acts on it by ω₁ (B.2).
- **E4 (gap).** §2.2 needs N(v) ≢ −1 (mod p) at the ramified places Σ. Otherwise the character γ_v is not determined
  (B.3).
- **E5 (gap).** The proof of Proposition (2.2.14) uses irreducibility and generic reducedness of R̄_v/π at v ∈ Σ, which
  (1.7.14) does not give (B.4).
- **E6 (error, reaches the proof).** Lemma (2.2.1) is false. The step "gg′ has the same property" fails: for central ρ̄(g),
  the left side of (2.2.2) does not change, but the right side does. Gee–Kisin give two repairs, one with ranks 2^{|R|}
  (B.5).

Gee–Kisin state that the main theorems are unaffected. R32.2 uses the corrected statements.

**E7 (misprint, reaches nothing): Dieulefait–Pacetti, proof of Theorem 1.4.** They say that Kisin's Hypothesis (1.2.6) "is
removed in [Eme11, Theorem 1.2.1]". The result that removes it is Emerton's Theorem 3.3.22 on locally algebraic vectors, as
his Remark 1.2.5 explains. Theorem 1.2.1 is local–global compatibility for promodular V.

**E8 (misprint, reaches nothing): Dieulefait–Pacetti, proof of Theorem 1.4.** They cite Kisin's and Tung's introduction
theorems and Hu–Tan's Theorem 1.4. These assume only that ρ̄ is odd, and get its modularity from Khare–Wintenberger. A proof
of Serre's conjecture must use the forms that assume ρ̄ modular: Kisin (2.2.18), Hu–Tan 6.3 and Tung 4.7. Theorem 1.4
itself assumes ρ̄ modular, so the conclusion stands.

## Remaining work

- **All eight stages remain partial**, following the independent needs_changes review. The early §8 repair does not close the existing typed-API, declaration, finite-presentation, component, multiplicity and independence gaps.
- **R32.1 and R32.2 remain partial.** They depend on these requests:
  - PadicLocalLanglandsForGL2Qp R30.6: the Breuil–Mézard conjecture and the local inequality;
  - CompletedCohomologyAndLocalGlobalCompatibility R31.5: Tung's global inputs;
  - SerreWeightAndLevelOptimisation R20.6: Gee's weight theorem.
- The part R32.3 packet cites the stage R32.2 in two nodes, `R32.3/dyadic-de-rham-modularity-lifting` and
  `R32.6/transfer-residually-irreducible-odd`. They can now cite `R32.2/odd-prime-statement-over-q` and
  `R32.2/odd-prime-de-rham-lifting`.
- That packet's gap on reading Kisin, Emerton, Hu–Tan and Tung is partly closed here:
  - their statements are read;
  - Emerton's §7.4 chooses an auxiliary CM-induced modular residual representation and invokes its weight theorem; this does not certify every globalisation or independence input of the modern route;
  - Tung's global inputs remain for R31.6.

**Inherited source issue E9.** The independent review found a false torus-normaliser step in DP Lemma 1.13 (also in the published p.8). A normal abelian subgroup need not lie in the original diagonal torus: the order-eight group generated by diag(1,−1) and the coordinate swap has a normal order-four subgroup generated by −I and the swap. The repair diagonalises that subgroup itself and uses the cyclic cyclotomic quotient. The packet's original confirmed record, mathematical bridge gap and matrix regressions are preserved; this fix makes no new erratum claim.

## KW II §8: construction of the prescribed modular witness
The new theorem statements are conditional on actual α/β witnesses. Residual modularity does not itself produce the global lift in minimal-level-data. R20.3/R20.6 weight and level results verify α/β at the downstream R24.4 application; potential modularity verifies them at R24.1. Neither downstream proof is used to define the predicates. Theorem 8.2 proves its source cases simultaneously; its unused extra branch is retained for source coverage. General quaternionic forms, freeness and algebraic degeneracy results are imported from R18.3 through R18.6, while compatibility of the attached Galois representations comes from R19.4/R19.5.

### Allowable base change for the KW residual problem
`GL2ModularityLifting:R22.1/allowable-base-change` (definition).
For the residual representation of KW II §7.6.2 over totally real F, an allowable base change is a totally real solvable extension F′/F of even degree, unramified above p and split above p when ρ̄|D_p is irreducible, preserving im(ρ̄_F) = im(ρ̄_{F′}) and absolute irreducibility of ρ̄|G_{F′(μ_p)}. For p = 2 retain the non-solvable image condition. This is a property of actual field-extension and representation data; existence with specified completions is a separate theorem.

**Hypotheses.**
- F is unramified at p, split at p if the original local residual representation is irreducible; p = 2 uses non-solvable residual image, p > 2 cyclotomic absolute irreducibility.

**Proof outline.**
- Use KW II Definition 7.9 with the actual restriction maps.
- Separate additional splitting requirements in each application from the definition itself.

**Checks.**
- Odd degree fails the even-degree condition.
- A solvable extension on which the residual image shrinks fails the definition.
- For p > 2, Theorem 8.2 explicitly adds splitting at all places above p.

**Imports.** `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`.

**Planning API.**
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.toExtension` (projection): Return F′/F with its embedding and restriction map.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.degree_even` (characterisation): [F′ : F] is even.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.image_eq` (compatibility): Restriction preserves the residual image and cyclotomic absolute irreducibility.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.comp` (functoriality): The composite of two allowable extensions is allowable; extra split sets are preserved when both extensions split there.

**Unit-test specifications.**
- `allowable_odd_degree` (non-example): Degree 3 cannot be allowable.
- `allowable_image_loss` (non-example): An extension killing a nontrivial residual image fails image preservation even if it is totally real and quadratic.
- `allowable_comp_degree` (example): Two successive allowable quadratic extensions have total degree 4; both preserve the relevant local and residual conditions.

**Sources.** KW2-2009, Definition 7.9, p. 68.

### Lemma 8.1: the initial totally real field
`GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice` (theorem).
For S-type ρ̄ : G_ℚ → GL₂(𝔽), with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2, cyclotomic irreducibility for p > 2 and non-solvable image for p = 2, there exists F/ℚ solvable, totally real of even degree, unramified at p, split at p if ρ̄|D_p is irreducible or k(ρ̄) = p + 1, preserving the relevant residual image hypotheses. The restriction is unramified away from p, and is trivial at places above p if ρ̄|D_p is unramified. The following paragraph SUPPOSES a suitable determinant character ψ given; its existence is not part of Lemma 8.1.

**Hypotheses.**
- The representation and residual image hypotheses are those of the opening of KW II §8, p. 69.

**Proof outline.**
- Choose local extensions killing the inertia image away from p, and unramified extensions killing unramified residual Frobenius at p when needed. Coordinate split-at-p and even-degree requirements.
- Apply the early soluble prescribed-completion/disjointness theorem proposed as R23.1:soluble-extensions; it is not yet a live or reserved stage and is recorded as an exact gap. Local finite Galois groups of number-field completions are soluble (wild inertia is a p-group, tame inertia and unramified quotients are cyclic), so the cyclic-tower argument is compatible with these local prescriptions.
- Use disjointness from the residual and cyclotomic fields to retain the image hypotheses. KW omits the proof; no routine-step claim is made for the field construction.

**Checks.**
- Distinguish unramified at p from split at p.
- Check residual triviality at p only under the source’s unramified hypothesis.
- Do not promote the subsequent assumed ψ to a conclusion of this lemma.

**Imports.** `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`.

**Sources.** KW2-2009, §8 opening and Lemma 8.1, pp. 69–70.

### The determinant characters of KW II §8.1
`GL2ModularityLifting:R22.1/determinant-character-kinds` (definition).
Fix the field of Lemma 8.1 and an arithmetic idele class character ψ unramified outside p such that χ_pρ_ψ lifts det ρ̄ and is totally odd. The local alternatives on 𝒪*_{F_p} are (i) N(u)^(2−k(ρ̄)), (ii) ω_p^(k(ρ̄)−2), and (iii) N(u)^(1−p) when k(ρ̄) = 2. These are predicates on the given ψ, not disjoint tags or a character-existence assertion. For p = 2 only (ii) is used.

**Hypotheses.**
- The norm exponents are integers; ψ is on the finite ideles modulo F* in KW’s convention.

**Proof outline.**
- Specify the given character and its Galois/class-field-theory comparison.
- Allow simultaneous satisfaction of (i) and (ii) at weight 2.

**Checks.**
- At k = 2 the exponents 2−k and k−2 are both zero, so kinds (i) and (ii) coincide locally.
- At p = 3, kind (iii) has exponent −2, not truncated natural subtraction.
- At p = 2 do not use the kind-(i)/(iii) branches in the lifting theorem.

**Imports.** `GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`.

**Planning API.**
- `TauCeti.ModularityLifting.KW.kindIExponent` (data): The integer 2 − k.
- `TauCeti.ModularityLifting.KW.kindIIExponent` (data): The integer k − 2 for the Teichmüller character.
- `TauCeti.ModularityLifting.KW.kindIIIExponent` (data): The integer 1 − p, admissible only at residual weight 2.
- `TauCeti.ModularityLifting.KW.kindsI_II_at_two` (compatibility): Kinds (i) and (ii) give the same trivial local character at weight 2.

**Unit-test specifications.**
- `determinant_overlap_weight_two` (example): Kinds (i) and (ii) have exponent 0 at k = 2.
- `determinant_negative_exponent` (example): Kind (iii) at p = 3 has exponent −2, so the norm character is inverted.
- `determinant_third_needs_weight_two` (non-example): Kind (iii) cannot be requested at residual weight 4.

**Sources.** KW2-2009, §8.1, paragraph after Lemma 8.1 and Remark, p. 70.

### Lemma 7.10: adjustment of determinant characters
`GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment` (lemma).
Let ψ, ψ′ be arithmetic characters with the same reduction and equal restrictions to an open subgroup of 𝒪*_{F_p}; assume their restrictions to 𝒪*_{F_v} agree for a finite set V of finite places. After enlarging coefficients, there is a finite-order p-power character ζ, unramified at V, and a totally real solvable extension F′/F, disjoint from any prescribed finite extension and split at V, such that ζ²|_{F′} ψ_{F′} = ψ′_{F′}. For odd p take the unique square root of ψ′/ψ in its p-primary finite-order character group and F′ = F. The dyadic branch needs a local-character extension theorem followed by a split extension; it is not an unrestricted global square-root assertion.

**Hypotheses.**
- The ratio ψ′/ψ is finite order, p-primary and totally even. Both local compatibility hypotheses are essential.

**Proof outline.**
- For odd p, squaring is invertible on a finite p-group of characters.
- For p = 2, prescribe local square roots at V and at Frobenius-generator primes for the disjointness field; use the early local-character extension input, then kill the remaining ratio by a totally real soluble extension split there. The exact supplier is recorded as a gap.

**Checks.**
- For p = 2 a quadratic character has no automatic square root in the same finite character group.
- Prescribed splitting at V is retained.
- F′ = F in the odd-p argument is allowed here; this lemma does not itself assert that F′/F has the even degree in Definition 7.9.

**Imports.** `GL2ModularityLifting:R22.1/determinant-character-kinds`, `ArithmeticGaloisRepresentations:R01.3`.

**Sources.** KW2-2009, Lemma 7.10 and proof, p. 69.

### Theorem 8.2: minimal modular lifts in all source cases
`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts` (theorem).
Let ρ̄, F, ψ satisfy §8.1. For p > 2 assume both α and β; for p = 2 assume β and α when k(ρ̄) = 2. Choose π as α in case (a) (β is also allowed when k = 2), β in cases (b)/(c), and α when p = k = 2 or β in the dyadic branch. Let Σ be a subset of the Steinberg places of π; if π is a β witness and k = 2, include its Steinberg places above p. After an allowable F″/F, split above p if p > 2, there is a cuspidal π″ lifting ρ̄_{F″}, unramified outside Σ ∪ {p}, Steinberg above Σ, with central character ψ_{F″}. For p > 2: (a) ψ kind (i), parallel weight k, unramified at p outside Σ; additionally at k = 2 and Σ disjoint from p, weight p + 1 and kind (iii) are possible. (b) ψ kind (ii), k < p + 1, parallel weight 2, U₁(v) invariants above p with associated residue character factoring through norm to 𝔽_p*. (c) k = p + 1, ψ kind (ii), parallel weight 2 and U₀(v) invariants above p. For p = 2 use kind (ii), weight 2, unramified above 2 outside Σ when k = 2, and Steinberg at every place above 2 when k = 4. In the latter branch, for each unramified square root ψ′_v of ψ_v, U_{v′} has eigenvalue ψ′_v(N_{F″_{v′}/F_v}(π_{v′})) after further base change.

**Hypotheses.**
- The α and β inputs are eigenform witnesses; no theorem of residual modularity is assumed proved at R22.1.
- The three odd-p and the dyadic conclusions are proved simultaneously by KW; retain their distinct hypotheses.
- The extra weight-p+1 branch at residual weight 2, and Lemma 8.3, are not used later in KW II (Remark, p. 71).

**Proof outline.**
- Choose even-degree field extensions split at Σ, p and an auxiliary w, increasing the p-parts of residue-unit groups at unwanted ramified places relative to the §7.2 isotropy exponent. The early field-choice supplier remains a gap.
- Transfer to the definite quaternion algebra by Jacquet–Langlands. Apply R18.3’s Lemmas 7.3/7.4 to choose nontrivial p-power characters at unwanted places, of order divisible by 4 at p = 2; compare mod-p coefficient modules, obtain a ramified principal-series lift and kill its tame character by further base change.
- Import KW Lemma 7.7 from R19.5 for the precise behavior above p. Use lemma-8-3-weight-two-to-p-plus-one only for the unused extra branch, with the integral weight-module surjection supplied by R18.3.
- Use lemma-7-10-determinant-adjustment to arrange central character ψ. At p = 2 and k = 4 use further split field choice to arrange the specified U-eigenvalue.

**Checks.**
- At k = p + 1 use (c), not (b).
- For a β witness with k = 2, Σ must contain its p-adic Steinberg places.
- An arbitrary modular residual representation without α/β witnesses does not satisfy this theorem’s input.
- Kind (iii) and weight p + 1 at k = 2 are recorded but not fed into Theorem 8.4’s crystalline boundary case.

**Imports.** `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2ModularityLifting:R22.1/determinant-character-kinds`, `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`, `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `HilbertModularVarietiesAndShimuraCurves:R18.6`, `AutomorphicGaloisRepresentations:R19.5`, `GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`.

**Sources.** KW2-2009, Theorem 8.2, statement p. 71, simultaneous proof pp. 72–73.

### Lemma 8.3: weight two to weight p + 1
`GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one` (lemma).
Let D/F″ be definite and unramified at finite places outside Σ, with Σ disjoint from p, U_v = GL₂(𝒪_{F″_v}) above p, and continuous residual ψ trivial on U ∩ (𝔸^∞_{F″})*. If the absolutely irreducible residual representation arises from a non-Eisenstein maximal ideal of the away-p Hecke algebra acting on S_{2,ψ}(U,𝔽), then it arises from one acting on S_{p+1,ψ}(U,𝔽).

**Hypotheses.**
- This supplies the unused extra case of Theorem 8.2(a); no inertness assumption on p in F″ is made.

**Proof outline.**
- Order the places above p and successively replace their trivial coefficient factors by tensor products of Sym^(p−1) over the embeddings at that place.
- At each place use the decomposition of the permutation module 𝔽[ℙ¹(k_v)] and the non-Eisenstein injective degeneracy map of KW Lemma 7.1, imported from R18.3. This is the iterated Edixhoven–Khare §4 Proposition 1 argument stated on pp. 73–74.
- Iterate the injective maps on localized nonzero spaces to reach parallel weight p + 1.

**Checks.**
- For two places above p, perform two coefficient replacements.
- Σ containing a p-adic place fails the hypothesis.
- A characteristic-p weight witness alone is not the integral lifting surjection; Theorem 8.2 separately requests that surjection.

**Imports.** `HilbertModularVarietiesAndShimuraCurves:R18.6`, `ArithmeticGaloisRepresentations:R01.3`.

**Sources.** KW2-2009, Lemma 8.3 and its iterated proof, pp. 73–74.

### The quaternionic level-raising step for Theorem 8.4
`GL2ModularityLifting:R22.1/prescribed-level-raising-step` (lemma).
In the tower F₀ ⊂ ⋯ ⊂ F_r used on p. 77 of KW II, at the i-th step take the definite algebra ramified at infinity and the already treated places above v₁,…,v_i, and a non-Eisenstein modular witness with maximal compact level at the next place w_{i+1}. The mod-p kernel of the two degeneracy maps to U₀(w_{i+1}) is Eisenstein. Ribet’s level-raising argument supplies a congruent cuspidal π_i Steinberg at the old and new ramified places; base change to F_{i+1} and Jacquet–Langlands give the next definite-quaternion witness. The conclusion retains residual representation, prescribed central character and p-adic coefficient type.

**Hypotheses.**
- When w_{i+1} lies above p in type (C) with residual weight 2, the weight is 2, precisely the p-adic hypothesis of KW Lemma 7.1.
- The field tower is quadratic at each step, split at the selected place and inert at the other prescribed places, with residual image/cyclotomic irreducibility preserved; its existence is an explicit early-field-selection gap.

**Proof outline.**
- Apply the R18.3 Ihara-type degeneracy lemma after non-Eisenstein localization; its integral cokernel has no p-torsion at this ideal.
- Use the R18.3 algebraic level-raising input cited as Kisin Corollary 3.1.11 and Lemma 3.5.3, together with R19.4 local–global compatibility, to obtain Steinberg π_i.
- Apply R17.4 base change and R17.3 Jacquet–Langlands to transfer to F_{i+1} and retain the central character and local conditions.

**Checks.**
- A p-adic raising place in weight greater than 2 does not meet this use of Lemma 7.1.
- Field choice and automorphic base change are different inputs.
- The statement requires an actual non-Eisenstein modular witness, not an R = T assertion.

**Imports.** `HilbertModularVarietiesAndShimuraCurves:R18.6`, `AutomorphicGaloisRepresentations:R19.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2ModularityLifting:R22.1/allowable-base-change`.

**Sources.** KW2-2009, Proof of Theorem 8.4, pp. 76–78, induction on p. 77.

### Theorem 8.4: modular lifts fitting the lifting data
`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts` (theorem).
Assume the residual hypotheses, field F and given ψ of §8.1, and α and β for p > 2 (β and α when k = 2 for p = 2). Fix actual compatible local lifts as in §8.3, with determinant ψχ_p: away from p either unramified or (γ_vχ_p *;0 γ_v), γ_v unramified and γ_v² = ψ_v; at all p-adic places simultaneously type (A), (B) or (C), with the exact KW restrictions. There exists an allowable F′/F and a cuspidal π′, discrete series of parallel weight at infinity, whose Galois representation lifts ρ̄_{F′}, fits the restricted local lifting data, is unramified at the specified unramified places and has determinant ψ_{F′}χ_p. For p > 2: (A) crystalline weight 2 ≤ k ≤ p + 1, with k = p + 1 only when F′ is split at p and k(ρ̄) = p + 1, and π′ unramified above p; (B) weight 2 crystalline over ℚ_p^nr(μ_p), WD inertia (ω_p^(k−2) ⊕ 1,0), U₁ invariants; (C) semistable non-crystalline weight 2 with prescribed γ_v and U₀ invariants. For p = 2 only crystalline weight 2 at residual weight 2, or prescribed semistable non-crystalline weight 2 at residual weight 4; π′ is respectively unramified or Steinberg above 2. Splitting at p may fail in the dyadic weight-4 branch and odd-p type (C) with residual weight 2; otherwise it can be arranged.

**Hypotheses.**
- The local lifts are inputs, not an assertion that the prescribed global modular lift already exists.
- The determinant alternatives match A to kind (i), B/C to kind (ii); p = 2 uses only kind (ii).

**Proof outline.**
- Use theorem-8-2-minimal-modular-lifts with cases (a)/(b)/(c) matching A/B/C; its unused extra weight-p+1 branch at residual weight 2 is excluded here.
- Apply prescribed-level-raising-step successively at the ramified lifting places, using the exact split/inert quadratic tower. Reapply Theorem 8.2 to remove the auxiliary neatness place.
- Use R19.5 Lemma 7.7 for compatibility at p. Remove the residual unramified quadratic sign discrepancies in the prescribed γ_v by further allowable base change, with the precise split-at-p exceptions retained.

**Checks.**
- Type B is not arbitrary potentially Barsotti–Tate type.
- Do not promise split at p in the two stated exceptions.
- The p + 1 crystalline case requires both residual weight p + 1 and splitting at p.
- Apply this theorem to construct the π field of minimal-level-data; never ask R20.6 to own this theorem.

**Imports.** `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`, `GL2ModularityLifting:R22.1/prescribed-level-raising-step`, `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2ModularityLifting:R22.1/determinant-character-kinds`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`, `AutomorphicGaloisRepresentations:R19.5`.

**Sources.** KW2-2009, §8.3, Theorem 8.4 and proof, pp. 74–78.

### Supplier boundary and remaining work

The early field/character selection component proposed by findings /13 and /26 is not live or reserved at this base. Its exact contract is CHT Lemmas 4.1.1–4.1.2, read in the published Numdam copy, pp. 116–117: extend continuous finite-order local characters to idele class characters; construct a soluble Galois extension with prescribed finite Galois completions, linearly disjoint from a given finite Galois extension. Keep the source’s unit-congruence, local class field theory and local/global Artin compatibility inputs visible. The required even-degree and split/unramified-at-p refinements are separate parts of the KW applications. A finite local Galois group is soluble by its wild/tame/unramified filtration. This is consistent with the source’s reduction to cyclic towers.

This packet records the missing early supplier as a gap, without inventing a stage ID in its prerequisite list or importing the whole later R23.1 stage. The automatic checker’s ability to resolve the other references does not close that gap. R17.4 supplies automorphic base change and descent, not a field-selection construction. R20.6’s distinct Kisin type-change and Gee prescribed-weight contracts remain open; deleting the wrong KW Theorem 8.4 request does not discharge them.

For /19, delta-freeness-at-taylor-wiles-level applies R18.3’s Galois-free localized freeness and proves only the Galois-dependent rank/coinvariant control. dyadic-twists-of-forms imports the quaternionic twisting formulas and proves compatibility with the R04 deformation twists after identifying the class-field-theory characters. It does not give a second proof of Proposition 7.6.

The existing typed-API, granularity, finite-presentation, local-type, multiplicity and globalisation gaps from the independent review remain open. The suggested file adds concrete determinant-exponent and boundary tests; the field, idele and automorphic signatures are explicitly unelaborated supplier sketches. No pinned compiled build is available to this worker, so no Lean compilation is claimed.

### Pre-existing stage dependency in the lifting application table

R32.2/application-requirements imports the specific R33.3/dp-dyadic-transition-and-the-order-three-type declaration. The concrete proof graph is acyclic. Its coarse R33.3 → R32.2 direction, however, returns through R32.3–R32.6 and R33.2 → R33.3. The existing globalisation/independence gap now names this exact obstruction. Resolve an early refinement or the consumer placement before promoting all stage dependencies; this repair does not assert independence of the full modern route.
