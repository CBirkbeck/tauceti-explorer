# Deformation-to-Hecke maps, patching and the GL₂ lifting theorems (layers R22.1–R22.6)

**Area fix, round 3, 6 October 2026 — Claude claude-c9TlsS, FIX-RT-AREA-langlands-2~3, Refs #5870.** REV-FIX-RT-AREA-langlands-2~3
checks this round; the earlier needs_changes reviews stay in reviewHistory and their gaps outside this round remain.
The packet now has 73 nodes, 25 open requests and 16 gaps. Four changes:
- **The field supplier (findings /13, /26).** Existence of allowable base changes with prescribed completions is a
  declaration of R22.1 (`allowable-base-change-existence`), derived from Clozel–Harris–Taylor's Lemma 4.1.2, which is
  requested from PotentialModularityAndCompatibleSystems R23.1 with its exact statement. A second new declaration
  transports (α) and (β) along allowable base changes. The §8 nodes cite both, and the gap on the field supplier is
  closed. "Soluble" is made precise as a tower of Galois steps with soluble groups.
- **KW I Theorem 4.1 (finding /12).** It is an output of R22.5 (odd p) and of R22.6 (p = 2), with the passage from
  "ρ̄ modular" to (α) and (β), as in KW II §10.2. It uses neither potential modularity nor finiteness of deformation
  rings.
- **The Theorem 1.4 contract.** `application-requirements` (R32.2) states what an application must verify and no
  longer has a prerequisite in ClassicalSerreModularity R33; the consumer cites the contract.
- **The suggested file.** The suggested file now gives typed forms, elaborating at the pinned Mathlib with unproved-declaration warnings only, of `allowable-base-change` (with a tower notion of solubility), `determinant-character-kinds` (predicates on the given character, beside the integer exponents) and the residual hypotheses (α) and (β), each with every API item and unit test of the packet under its packet name. They are stated over an "Imported interfaces" section: definitions built from Mathlib for the Galois-side notions, and data without a body for cuspidal automorphic representations (weight, conductor exponent, residual representation). The existence lemma, the transport of (α) and (β), Lemma 8.1, the passage from "ρ̄ modular" to (α), (β) and the odd-p branch of Lemma 7.10 are stated, each saying what it leaves out. KW II Theorems 8.2 and 8.4, the dyadic branch of Lemma 7.10 and KW I Theorem 4.1 remain comment sketches, because their local conditions at p cannot be stated at the pinned libraries; so do the definitions outside §7.6/§8.

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
  statements, each with its hypotheses, and which formulations avoid the global-finiteness argument. RS-08's keeps say
  that KW I Theorem 4.1 is assembled in PotentialModularityAndCompatibleSystems R24.4; by the confirmed finding
  RT-AREA-langlands-2/12 it is an output of R22.5 and R22.6 (below), and that sentence of the keeps is the maintainer's
  to amend. R21.4 is imported only on the exact ordinary overlap.
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
  - Dickson's classification (ArithmeticGaloisRepresentations R01.4), the p-adic monodromy theorem (PadicHodgeTheory R06.3),
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
take these, not "ρ̄ is modular"; converting one into the other is the weight part of Serre's conjecture
(`alpha-beta-from-modularity-over-q`, in this layer).

**Lemma: solvable base change** (node `solvable-base-change-reduction`). Field existence imports `PotentialModularityAndCompatibleSystems:R23.1/cht-soluble-prescribed-completions`; automorphic descent imports R17.4. The field with prescribed completions exists by
Clozel–Harris–Taylor's Lemma 4.1.2 (requested from PotentialModularityAndCompatibleSystems R23.1; Gee's Fact 4.27), and
in the allowable case by R22.1/allowable-base-change-existence; no automorphic input is involved. Descent of modularity
along solvable totally real extensions (Gee 4.25) is requested from GL2AutomorphicRepresentationsAndTransfer R17.4.

**Theorem: the Khare–Wintenberger lifting theorem for odd p** (node `kw-odd-prime-lifting`; planet; KW II Theorem 9.7).
- Hypotheses: F unramified at p, ρ̄|G_{F(μ_p)} absolutely irreducible, (α) and (β).
- The lift is totally odd, of type (A) crystalline of weight 2 ≤ k ≤ p + 1, (B) weight 2 and crystalline over
  ℚ_p^{nr}(μ_p), or (C) semistable weight 2 of the form (γ_vχ_p ∗; 0 γ_v).
- The proof is base change, then this packet’s R22.1/theorem-8-4-prescribed-modular-lifts, then R22.3’s generic-fibre R = T. It uses neither KW II Theorem
  10.1 nor potential modularity.

**Lemma: from "ρ̄ modular" to (α) and (β)** (node `alpha-beta-from-modularity-over-q`; KW II §10.2 and p. 54). A modular
ρ̄ of S-type over ℚ arises in weight k(ρ̄) at a level prime to p and in weight 2 at level Np; base change along a
soluble totally real F unramified at p gives (α) and (β) over F (for p = 2: (β), and (α) when k(ρ̄) = 2). Stated in
full in "KW I Theorem 4.1 as an output of R22.5 and R22.6" below.

**Theorem: KW I Theorem 4.1(2)** (node `kw-i-theorem-4-1-odd-prime`; planet "KW I Theorem 4.1 for odd p"). For p > 2,
ρ̄|_{ℚ(μ_p)} absolutely irreducible and ρ̄ modular: a finitely ramified lift that is crystalline of weight 2 ≤ k ≤ p + 1,
or potentially semistable of weight 2, is modular. Stated in full in the same section.

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

**Application: what an application of Theorem 1.4 must verify** (node `application-requirements`). The contract is:
(i) ρ̄|_{G_{ℚ(√p*)}} absolutely irreducible; (ii) both representations de Rham with Hodge–Tate weights {0, k − 1},
k ≥ 2, not necessarily crystalline; (iii) oddness; (iv) no condition of ordinarity; (v) one of the two modular, or
solvable residual image with Langlands–Tunnell. DP apply Theorem 1.4 at:
- w (Paso 1), q (Paso 2), each odd ramified p_i (Paso 3), N (Paso 5) and 5 (Paso 6);
- 3 in Lemma 2.3.

The node records which lemma of the source gives (i) at each use. The verification itself belongs to the nodes of
ClassicalSerreModularity R33.1–R33.5 that apply the theorem; R33.1/dp-modularity-lifting-inputs cites this node, and
this node has no prerequisite in ClassicalSerreModularity. The p = 3 uses (Paso 3, Lemma 2.3) are why the p = 3
theorem is needed.

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

- **All eight stages remain partial**, following the independent needs_changes review. The §8 repair closes the gap on the field supplier; the declaration, finite-presentation, component, multiplicity and independence gaps remain, and so does the typed-API gap for the definitions outside §7.6/§8.
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
The new theorem statements are conditional on actual α/β witnesses. Residual modularity does not itself produce the global lift in minimal-level-data. R20.3/R20.6 weight and level results verify α/β over ℚ in R22.5/alpha-beta-from-modularity-over-q; potential modularity verifies them at R24.1. Neither downstream proof is used to define the predicates. Theorem 8.2 proves its source cases simultaneously; its unused extra branch is retained for source coverage. General quaternionic forms, freeness and algebraic degeneracy results are imported from R18.3 through R18.6, while compatibility of the attached Galois representations comes from R19.4/R19.5.

### Allowable base change for the KW residual problem
`GL2ModularityLifting:R22.1/allowable-base-change` (definition).

Let ρ̄ : G_ℚ → GL₂(𝔽) be continuous, absolutely irreducible and totally odd, and F a totally real number field, unramified at p and split at p if ρ̄|_{D_p} is irreducible, with ρ̄|_{G_F} of non-solvable image if p = 2 and ρ̄|_{G_{F(μ_p)}} absolutely irreducible if p > 2 (KW II §7.6.2). An allowable base change is a finite extension F′/F that is (1) totally real; (2) soluble, in the sense that there is a tower F = F₀ ⊂ F₁ ⊂ … ⊂ F_n = F′ with every F_{i+1}/F_i Galois with soluble group; (3) of even degree; (4) unramified at the places above p, and split at them if ρ̄|_{D_p} is irreducible; (5) such that im ρ̄|_{G_{F′}} = im ρ̄|_{G_F} and ρ̄|_{G_{F′(μ_p)}} is absolutely irreducible. It is a property of an actual extension and of the restricted representation. That such extensions exist with prescribed completions is R22.1/allowable-base-change-existence, and extra splitting conditions in an application are stated there, not here.

**Hypotheses and conventions.**
- F is unramified at p, and split at p if the local residual representation is irreducible; p = 2 uses non-solvable residual image, p > 2 cyclotomic absolute irreducibility.
- KW II do not define 'solvable extension'. The tower form is what their uses need and what their constructions give: Langlands' base change and descent are applied one cyclic step at a time, and the field F_r of the proof of Theorem 8.4 is a tower of quadratic extensions that need not be Galois over F. A Galois extension with soluble group is the case n = 1.
- For p = 2 condition (5) keeps the image non-solvable; the absolute irreducibility over F′(μ₂) = F′ is then automatic.
- 'ρ̄|_{D_p} is irreducible' means absolutely irreducible, as everywhere in KW II §§7–8. An unramified ρ̄|_{D_p} has cyclic image and is reducible over 𝔽̄_p, although it can be irreducible over 𝔽; read over 𝔽, Lemma 8.1 would ask for a field both split at p and making ρ̄ trivial there.
- Definition 7.9 prints im(ρ̄) = im(ρ̄|_{F′}). Condition (5) is the relative form ρ̄(G_{F′}) = ρ̄(G_F), which is what the paragraph after the definition proves (linear disjointness from the fixed field of the kernel of ρ̄|_F) and what composition needs; for the fields KW II construct the two agree, since ρ̄(G_F) = ρ̄(G_ℚ).

**Construction.**
- KW II Definition 7.9, with the restriction maps G_{F′} ⊂ G_F ⊂ G_ℚ and the tower form of solubility.
- Composition: if F′/F is allowable for ρ̄ and F″/F′ is allowable for ρ̄ (over the base F′, which again satisfies the conditions of §7.6.2), then F″/F is allowable: the towers concatenate, degrees multiply, and conditions (1), (4), (5) are transitive.
- Additional splitting requirements of an application are separate from the definition.

**API.**
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.toExtension` (projection): The extension F′/F, as an intermediate field of a fixed algebraic closure of F, with the inclusion G_{F′} ⊂ G_F.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.degree_even` (characterisation): [F′ : F] is even.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.image_eq` (compatibility): ρ̄(G_{F′}) = ρ̄(G_F), and ρ̄|_{G_{F′(μ_p)}} is absolutely irreducible.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.comp` (functoriality): If F′/F is allowable and F″/F′ is allowable (over the base F′), then F″/F is allowable.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.solubleTower` (projection): A tower F = F₀ ⊂ … ⊂ F_n = F′ in which every step is Galois with soluble group; for F′/F Galois with soluble group the tower has one step.
- `TauCeti.ModularityLifting.KW.AllowableBaseChange.totallyReal` (projection): F′ is totally real.

**Unit tests.**
- `allowable_odd_degree` (non-example): If [F′ : F] = 3 then F′/F is not an allowable base change, whatever ρ̄ is.
- `allowable_image_loss` (non-example): If ρ̄(G_{F′}) is a proper subgroup of ρ̄(G_F), then F′/F is not allowable, even if F′/F is totally real and quadratic.
- `allowable_comp_degree` (example): If F′/F and F″/F′ are allowable then F″/F is allowable; for two quadratic steps [F″ : F] = 4.
- `allowable_trivial_extension` (degenerate): The trivial extension F′ = F is not allowable: its degree 1 is odd.

**Checks.**
- An extension of odd degree is not allowable.
- A soluble totally real extension of even degree on which the residual image shrinks is not allowable.
- A non-normal cubic extension is not allowable even if its Galois closure has group S₃: it has odd degree, and it is not the top of a tower of Galois steps.
- For p > 2, Theorem 8.2 asks in addition that the allowable base change be split at all places above p.

**Imports.** `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`.

**Sources.** KW2-2009, Definition 7.9, p. 68; KW2-2009, §7.6.2, after Definition 7.9, p. 68.

### Existence of allowable base changes with prescribed completions
`GL2ModularityLifting:R22.1/allowable-base-change-existence` (lemma).

Let F and ρ̄ be as in KW II §7.6.2 (F totally real, unramified at p, split at p if ρ̄|_{D_p} is irreducible; ρ̄|_{G_F} of non-solvable image if p = 2, and ρ̄|_{G_{F(μ_p)}} absolutely irreducible if p > 2). Let S₀ be a finite set of finite places of F containing the places above p, and for v ∈ S₀ let E_v/F_v be a finite Galois extension, unramified if v | p and equal to F_v if v | p and ρ̄|_{D_p} is irreducible. Let L/F be a finite extension. Then there is a finite Galois extension F′/F with soluble Galois group such that: (1) F′ is totally real; (2) [F′ : F] is even; (3) F′_w ≅ E_v over F_v for every v ∈ S₀ and every place w | v of F′, so that F′/F is unramified above p, split at each v with E_v = F_v, and split above p when ρ̄|_{D_p} is irreducible; (4) F′ is linearly disjoint over F from L, from the fixed field K of ker ρ̄|_{G_F} and from K(μ_p), so that ρ̄(G_{F′}) = ρ̄(G_F) and ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)}). (5) If every E_v, v ∈ S₀, has degree at most 2 over F_v, then F′ can be taken quadratic over F. In particular F′/F is an allowable base change (R22.1/allowable-base-change) with the prescribed completions at S₀. The base F′ again satisfies the conditions of §7.6.2, so the statement can be applied repeatedly, and the resulting towers are allowable over F.

**Hypotheses and conventions.**
- At a place above p only an unramified E_v may be prescribed, and only the trivial one when ρ̄|_{D_p} is irreducible. A nontrivial unramified E_v above p occurs in Lemma 8.1 (to make ρ̄ trivial above p when it is unramified there), in the dyadic branch with k(ρ̄) = 4 and in type (C) with k(ρ̄) = 2, the two cases in which Theorem 8.4 does not promise splitting at p.
- Evenness comes from one auxiliary place with the unramified quadratic extension prescribed, not from the places of S₀; without it F′ = F would satisfy (1), (3) and (4).
- KW II's second criterion, for dihedral projective image (a prime split in the field cut out by the projective image and inert in F(μ_p)), is not needed: disjointness from K(μ_p) preserves the image over the cyclotomic field.
- KW II cite Lemma 2.2 of Taylor's 'On icosahedral Artin representations II' for this; that paper was not read. The statement is derived here from Clozel–Harris–Taylor's Lemma 4.1.2, which was read and is requested from PotentialModularityAndCompatibleSystems R23.1.
- No automorphic input is used: this is existence of a field, not GL2AutomorphicRepresentationsAndTransfer R17.4's base change.
- 'ρ̄|_{D_p} is irreducible' means absolutely irreducible (see R22.1/allowable-base-change).
- Clause (5) matters: Lemma 4.1.2 controls the completions but not the global degree, and the proof of Theorem 8.4 needs extensions of degree exactly 2 (KW II p. 77: each F_i/F_{i−1} is quadratic, with one place above v_i's neighbours and two above v_i). For exponent 2 no class field theory is needed, only weak approximation.

**Proof outline.**
- Auxiliary place. Choose a finite place u of F outside S₀, not above p, and let E_u be the unramified quadratic extension of F_u.
- Apply Clozel–Harris–Taylor's Lemma 4.1.2 (requested from PotentialModularityAndCompatibleSystems R23.1) to F, to D the Galois closure over F of L·K(μ_p), and to the set S = S₀ ∪ {u} ∪ {real places of F}, with the given E_v at S₀, E_u at u and E_v = F_v = ℝ at the real places. It gives a finite soluble Galois F′/F, linearly disjoint from D, with F′_w ≅ E_v for all w | v ∈ S.
- Totally real: every real place of F splits completely in F′. Even degree: F′/F is Galois, so the local degree [F′_w : F_u] = 2 divides [F′ : F]. The conditions at p are read off (3).
- Images. F′ is linearly disjoint from K(μ_p) over F, so restriction is an isomorphism Gal(F′K(μ_p)/F′) ≅ Gal(K(μ_p)/F) carrying the subgroup that fixes μ_p to the subgroup that fixes μ_p. Hence ρ̄(G_{F′}) = ρ̄(G_F) and ρ̄(G_{F′(μ_p)}) = ρ̄(G_{F(μ_p)}); absolute irreducibility over F′(μ_p), and non-solvability at p = 2, are properties of these images (ArithmeticGaloisRepresentations R01.4).
- Quadratic case (5). Write E_v = F_v(√d_v) with d_v ∈ F_v^× (d_v = 1 if E_v = F_v). Choose a finite place z of F outside S₀, not above 2, that splits completely in D (Chebotarev for the trivial class; Tau Ceti Chebotarev, Layer 10), and a non-square unit d_z of F_z. The squares are open in each F_v^×, so by weak approximation there is d ∈ F^× that is totally positive, lies in d_v·(F_v^×)² for v ∈ S₀ and in d_z·(F_z^×)². Put F′ = F(√d). It is totally real, quadratic (z is inert), with completions E_v at S₀; and F′ is not contained in D, because z is inert in F′ and splits completely in D, so F′ ∩ D = F. No auxiliary place u is needed, since the degree is 2.
- Iteration. F′ is totally real, unramified at p and split at p when required, with the same residual images, so §7.6.2 holds over F′; a tower of such steps is allowable over F by the composition property of R22.1/allowable-base-change.

**Checks.**
- F = ℚ, p = 5, S₀ = {5} with E₅ = ℚ₅, u = 3: ℚ(√11) is real quadratic, 5 splits in it (11 ≡ 1 mod 5) and 3 is inert (11 ≡ 2 mod 3). Disjointness from K is a further condition, which is why D enters the construction.
- With S₀ = {v | p} and every E_v = F_v the lemma gives the allowable base changes 'split at p' of Theorem 8.2.
- Prescribing the unramified extension of degree m at the places of a finite set makes the p-part of the residue-field unit groups there as large as required; this is the use in the proof of Theorem 8.2 (order divisible by the p-part of 2p(4N_w)).
- Over the field F_{i−1} of the proof of Theorem 8.4, clause (5) with the trivial extension at the places above v_i and the unramified quadratic extension at the places above the other v_j gives a quadratic F_i, with v_j inert for j ≠ i and split for j = i. Without clause (5) the degree of F_i could be a larger even number, and the count of places above v_1, …, v_i in the proof would be wrong.
- Without the real places in S the extension could be totally complex, and the Hilbert modular setting would be lost.

**Imports.** `GL2ModularityLifting:R22.1/allowable-base-change`, `PotentialModularityAndCompatibleSystems:R23.1/cht-soluble-prescribed-completions`, `ArithmeticGaloisRepresentations:R01.4`, `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.

**Sources.** CHT-2008, Lemma 4.1.2, statement p. 116 and proof p. 117; KW2-2009, §7.6.2, paragraph after Definition 7.9, p. 68; KW2-2009, §7.6.2, p. 68.

### The residual hypotheses (α) and (β) persist under allowable base change
`GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change` (lemma).

Let F and ρ̄ be as in KW II §7.6.2 and F′/F an allowable base change. If ρ̄|_{G_F} satisfies (α) with witness π, then ρ̄|_{G_{F′}} satisfies (α) with witness the base change π_{F′}; likewise for (β). More precisely π_{F′} is cuspidal, it is discrete series of the same parallel weight at every infinite place of F′, ρ̄_{π_{F′}} ≅ ρ̄_π|_{G_{F′}}, and for places w | v | p: π_{F′,w} is unramified if π_v is, and its conductor exponent is at most 1 if that of π_v is.

**Hypotheses and conventions.**
- The tower form of solubility in R22.1/allowable-base-change is what is used: base change is applied along each cyclic step of prime degree.
- Cuspidality of each base change uses that the restriction of ρ̄ stays absolutely irreducible (condition (5) of the definition): a cuspidal π whose base change along a cyclic extension is not cuspidal is automorphically induced from that extension, and then ρ_π restricted to it is reducible.
- F′/F is unramified above p, and for an unramified local extension the conductor exponent of the local base change equals that of π_v.
- The definitions of (α) and (β) do not contain this transport; KW II use it without comment whenever they 'reinitialise' the base field.

**Proof outline.**
- Refine the tower of R22.1/allowable-base-change to cyclic steps of prime degree, each Galois over the previous field and totally real.
- For one cyclic step apply Langlands' base change (GL2AutomorphicRepresentationsAndTransfer R17.4): it exists, is compatible with local base change at every place, and is cuspidal by the irreducibility remark above.
- Local behaviour. At infinite places the extension of completions is ℝ/ℝ and the weight is unchanged. At w | v | p the extension F′_w/F_v is unramified: an unramified principal series stays unramified, and the conductor exponent is unchanged in general.
- Galois side. ρ_{π_{F′}} ≅ ρ_π|_{G_{F′}} by comparison of Frobenius traces at the unramified places (AutomorphicGaloisRepresentations R19.2), hence the same for the residual representations.

**Checks.**
- F′/F quadratic, π unramified at v | p inert in F′: π_{F′,w} is unramified, so an (α)-witness base-changes to an (α)-witness.
- A Steinberg component at v | p (conductor exponent 1) base-changes along an unramified extension to a Steinberg component: a (β)-witness stays a (β)-witness and does not become an (α)-witness.
- If the residual image shrank over F′ so that ρ̄|_{G_{F′}} were reducible, π_{F′} could fail to be cuspidal; this is excluded by the definition of allowable.

**Imports.** `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`, `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `AutomorphicGaloisRepresentations:R19.2`.

**Sources.** KW2-2009, §7.6.2, after Definition 7.9, p. 68.

### Lemma 8.1: the initial totally real field
`GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice` (theorem).

For S-type ρ̄ : G_ℚ → GL₂(𝔽), with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2, cyclotomic irreducibility for p > 2 and non-solvable image for p = 2, there exists F/ℚ solvable, totally real of even degree, unramified at p, split at p if ρ̄|D_p is irreducible or k(ρ̄) = p + 1, preserving the relevant residual image hypotheses. The restriction is unramified away from p, and is trivial at places above p if ρ̄|D_p is unramified. The following paragraph SUPPOSES a suitable determinant character ψ given; its existence is not part of Lemma 8.1.

**Hypotheses and conventions.**
- The representation and residual image hypotheses are those of the opening of KW II §8, p. 69.

**Proof outline.**
- Local prescriptions over ℚ. At each prime q ≠ p where ρ̄ is ramified let E_q be the extension of ℚ_q cut out by ρ̄|_{D_q}, a finite Galois extension over which ρ̄ becomes trivial. At p let E_p be the unramified extension of degree the order of ρ̄(Frob_p) if ρ̄|_{D_p} is unramified, and E_p = ℚ_p otherwise; in particular E_p = ℚ_p when ρ̄|_{D_p} is absolutely irreducible or k(ρ̄) = p + 1, since ρ̄|_{D_p} is then ramified.
- Apply R22.1/allowable-base-change-existence over the base ℚ, with S₀ the set of these primes. The base ℚ satisfies §7.6.2 by the residual hypotheses at the opening of §8. The output F/ℚ is soluble and Galois, totally real, of even degree, unramified at p and split at p in the two cases required, with the prescribed completions.
- Unramified away from p: at a place above q the completion of F contains E_q, over which ρ̄ is trivial. Trivial above p when ρ̄|_{D_p} is unramified: the completion is E_p, which the Frobenius of order the order of ρ̄(Frob_p) cuts out.
- The image hypotheses over F and F(μ_p) are conclusion (4) of the existence lemma. KW II omit the proof of Lemma 8.1; this is the construction it leaves to the reader.

**Checks.**
- Distinguish unramified at p from split at p.
- Check residual triviality at p only under the source’s unramified hypothesis.
- Do not promote the subsequent assumed ψ to a conclusion of this lemma.

**Imports.** `GL2ModularityLifting:R22.1/allowable-base-change-existence`, `ArithmeticGaloisRepresentations:R01.3`, `ArithmeticGaloisRepresentations:R01.4`.

**Sources.** KW2-2009, §8 opening and Lemma 8.1, pp. 69–70.

### The determinant characters of KW II §8.1
`GL2ModularityLifting:R22.1/determinant-character-kinds` (definition).

Fix the field of Lemma 8.1 and an arithmetic idele class character ψ unramified outside p such that χ_pρ_ψ lifts det ρ̄ and is totally odd. The local alternatives on 𝒪*_{F_p} are (i) N(u)^(2−k(ρ̄)), (ii) ω_p^(k(ρ̄)−2), and (iii) N(u)^(1−p) when k(ρ̄) = 2. These are predicates on the given ψ, not disjoint tags or a character-existence assertion. For p = 2 only (ii) is used.

**Hypotheses and conventions.**
- The norm exponents are integers; ψ is on the finite ideles modulo F* in KW’s convention.

**Construction.**
- Specify the given character and its Galois/class-field-theory comparison.
- Allow simultaneous satisfaction of (i) and (ii) at weight 2.

**API.**
- `TauCeti.ModularityLifting.KW.kindIExponent` (data): The integer 2 − k.
- `TauCeti.ModularityLifting.KW.kindIIExponent` (data): The integer k − 2 for the Teichmüller character.
- `TauCeti.ModularityLifting.KW.kindIIIExponent` (data): The integer 1 − p, admissible only at residual weight 2.
- `TauCeti.ModularityLifting.KW.kindsI_II_at_two` (compatibility): At k(ρ̄) = 2 kinds (i) and (ii) are the same condition on ψ: trivial on the units above p.
- `TauCeti.ModularityLifting.KW.IsKindI` (characterisation): ψ is of kind (i): its restriction to the units above p is u ↦ N(u)^{2−k(ρ̄)}, N the product of the local norms to ℤ_p^×.
- `TauCeti.ModularityLifting.KW.IsKindII` (characterisation): ψ is of kind (ii): its restriction to the units above p is u ↦ τ(N(u))^{k(ρ̄)−2}, τ the Teichmüller character of ℤ_p^×; this is the character corresponding to ω_p^{k(ρ̄)−2}.
- `TauCeti.ModularityLifting.KW.IsKindIII` (characterisation): ψ is of kind (iii): k(ρ̄) = 2 and the restriction of ψ to the units above p is u ↦ N(u)^{1−p}.

**Unit tests.**
- `determinant_overlap_weight_two` (example): At k = 2 the exponents of kinds (i) and (ii) are both 0, and ψ is of kind (i) if and only if it is of kind (ii).
- `determinant_negative_exponent` (example): Kind (iii) at p = 3 has exponent −2, so the norm character is inverted.
- `determinant_third_needs_weight_two` (non-example): At residual weight 4 no ψ is of kind (iii): the predicate contains k(ρ̄) = 2.

**Checks.**
- At k = 2 the exponents 2−k and k−2 are both zero, so kinds (i) and (ii) coincide locally.
- At p = 3, kind (iii) has exponent −2, not truncated natural subtraction.
- At p = 2 do not use the kind-(i)/(iii) branches in the lifting theorem.

**Imports.** `GL2ModularityLifting:R22.1/lemma-8-1-residual-field-choice`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`.

**Sources.** KW2-2009, §8.1, paragraph after Lemma 8.1 and Remark, p. 70.

### Lemma 7.10: adjustment of determinant characters
`GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment` (lemma).

Let ψ, ψ′ be arithmetic characters with the same reduction and equal restrictions to an open subgroup of 𝒪*_{F_p}; assume their restrictions to 𝒪*_{F_v} agree for a finite set V of finite places. After enlarging coefficients, there is a finite-order p-power character ζ, unramified at V, and a totally real solvable extension F′/F, disjoint from any prescribed finite extension and split at V, such that ζ²|_{F′} ψ_{F′} = ψ′_{F′}. For odd p take the unique square root of ψ′/ψ in its p-primary finite-order character group and F′ = F. The dyadic branch needs a local-character extension theorem followed by a split extension; it is not an unrestricted global square-root assertion.

**Hypotheses and conventions.**
- The ratio ψ′/ψ is of finite order, p-primary and totally even. Both local compatibility hypotheses are essential.
- KW II's convention: characters of F*\(𝔸_F^∞)*, that is, idele class characters trivial at the infinite places.
- KW II appeal to the Grunwald–Wang theorem (Artin–Tate, Chapter 10, Theorem 5) for p = 2. What the argument uses is the extension of finitely many local characters of 2-power order to a global character of 2-power order; no global character of prescribed exact order is needed, so the special case of Grunwald–Wang does not arise. It is supplied by Clozel–Harris–Taylor's Lemma 4.1.1 with the 2-primary projection.

**Proof outline.**
- For odd p, squaring is an automorphism of the finite p-group of characters generated by ψ′/ψ; take ζ its square root there and F′ = F.
- For p = 2, fix a finite Galois L/F from which F′ is to be disjoint and a finite set W of places, unramified in L and for ψ, ψ′, whose Frobenius elements meet every conjugacy class of Gal(L/F). At v ∈ V ∪ W the character (ψ′/ψ)_v is unramified of 2-power order (the restrictions to the local units agree), so after enlarging 𝒪 it has an unramified square root ζ_v of 2-power order.
- Extend. By Clozel–Harris–Taylor's Lemma 4.1.1 (requested from PotentialModularityAndCompatibleSystems R23.1) applied to S = V ∪ W ∪ {real places}, with ζ_v at V ∪ W and the trivial character at the real places, there is a finite-order idele class character with these local components; its 2-primary component ζ has 2-power order and the same local components, because they have 2-power order. ζ is unramified at V and trivial at the infinite places.
- The field. ζ²ψ/ψ′ is a finite-order character of 2-power order, trivial at the real places and on F_v* for v ∈ V ∪ W. By global class field theory (Tau Ceti ClassFieldTheory, Layer 12) its kernel cuts out a cyclic extension F′/F, totally real and split at V ∪ W, over which ζ²ψ and ψ′ agree. F′ ∩ L is Galois over F and split at W, so every Frobenius class of Gal(F′ ∩ L/F) is trivial and F′ ∩ L = F: F′ is linearly disjoint from L.

**Checks.**
- For p = 2 a quadratic character has no square root in the group it generates; this is why a field extension is needed.
- Prescribed splitting at V is retained, and ζ is unramified at V.
- F′ = F in the odd-p argument is allowed here; this lemma does not assert that F′/F has the even degree of Definition 7.9. In its uses it is followed by an allowable base change (R22.1/allowable-base-change-existence).
- The global character produced by Lemma 4.1.1 may have order divisible by odd primes; only its 2-primary component is used.

**Imports.** `GL2ModularityLifting:R22.1/determinant-character-kinds`, `PotentialModularityAndCompatibleSystems:R23.1/cht-character-extension`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-12-separate-arithmetic-global-existence-the-norm-index-and-the-global-correspondence`, `ArithmeticGaloisRepresentations:R01.3`.

**Sources.** KW2-2009, Lemma 7.10 and proof, p. 69; CHT-2008, Lemma 4.1.1, p. 116.

### Theorem 8.2: minimal modular lifts in all source cases
`GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts` (theorem; planet "Minimal modular lifts").

Let ρ̄, F, ψ satisfy §8.1. For p > 2 assume both α and β; for p = 2 assume β and α when k(ρ̄) = 2. Choose π as α in case (a) (β is also allowed when k = 2), β in cases (b)/(c), and α when p = k = 2 or β in the dyadic branch. Let Σ be a subset of the Steinberg places of π; if π is a β witness and k = 2, include its Steinberg places above p. After an allowable F″/F, split above p if p > 2, there is a cuspidal π″ lifting ρ̄_{F″}, unramified outside Σ ∪ {p}, Steinberg above Σ, with central character ψ_{F″}. For p > 2: (a) ψ kind (i), parallel weight k, unramified at p outside Σ; additionally at k = 2 and Σ disjoint from p, weight p + 1 and kind (iii) are possible. (b) ψ kind (ii), k < p + 1, parallel weight 2, U₁(v) invariants above p with associated residue character factoring through norm to 𝔽_p*. (c) k = p + 1, ψ kind (ii), parallel weight 2 and U₀(v) invariants above p. For p = 2 use kind (ii), weight 2, unramified above 2 outside Σ when k = 2, and Steinberg at every place above 2 when k = 4. In the latter branch, for each unramified square root ψ′_v of ψ_v, U_{v′} has eigenvalue ψ′_v(N_{F″_{v′}/F_v}(π_{v′})) after further base change.

**Hypotheses and conventions.**
- The α and β inputs are eigenform witnesses; no theorem of residual modularity is assumed proved at R22.1.
- The three odd-p and the dyadic conclusions are proved simultaneously by KW; retain their distinct hypotheses.
- The extra weight-p+1 branch at residual weight 2, and Lemma 8.3, are not used later in KW II (Remark, p. 71).

**Proof outline.**
- Choose even-degree allowable extensions split at Σ, at the places above p and at an auxiliary w, in which the p-parts of the residue-field unit groups at the unwanted ramified places are large relative to the isotropy exponent of §7.2. They exist by R22.1/allowable-base-change-existence, prescribing unramified extensions of suitable degree at those places, and the witnesses for (α), (β) follow the base change by R22.1/alpha-beta-under-allowable-base-change.
- Transfer to the definite quaternion algebra by Jacquet–Langlands. Apply R18.3’s Lemmas 7.3/7.4 to choose nontrivial p-power characters at unwanted places, of order divisible by 4 at p = 2; compare mod-p coefficient modules, obtain a ramified principal-series lift and kill its tame character by further base change.
- Import KW Lemma 7.7 from R19.5 for the precise behavior above p. Use lemma-8-3-weight-two-to-p-plus-one only for the unused extra branch, with the integral weight-module surjection supplied by R18.3.
- Use lemma-7-10-determinant-adjustment to arrange central character ψ. At p = 2 and k = 4 use further split field choice to arrange the specified U-eigenvalue.

**Checks.**
- At k = p + 1 use (c), not (b).
- For a β witness with k = 2, Σ must contain its p-adic Steinberg places.
- An arbitrary modular residual representation without α/β witnesses does not satisfy this theorem’s input.
- Kind (iii) and weight p + 1 at k = 2 are recorded but not fed into Theorem 8.4’s crystalline boundary case.

**Imports.** `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2ModularityLifting:R22.1/allowable-base-change-existence`, `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`, `GL2ModularityLifting:R22.1/determinant-character-kinds`, `GL2ModularityLifting:R22.1/lemma-7-10-determinant-adjustment`, `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `HilbertModularVarietiesAndShimuraCurves:R18.6`, `AutomorphicGaloisRepresentations:R19.5`, `GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one`.

**Sources.** KW2-2009, Theorem 8.2, statement p. 71, simultaneous proof pp. 72–73.

### Lemma 8.3: weight two to weight p + 1
`GL2ModularityLifting:R22.1/lemma-8-3-weight-two-to-p-plus-one` (lemma).

Let D/F″ be definite and unramified at finite places outside Σ, with Σ disjoint from p, U_v = GL₂(𝒪_{F″_v}) above p, and continuous residual ψ trivial on U ∩ (𝔸^∞_{F″})*. If the absolutely irreducible residual representation arises from a non-Eisenstein maximal ideal of the away-p Hecke algebra acting on S_{2,ψ}(U,𝔽), then it arises from one acting on S_{p+1,ψ}(U,𝔽).

**Hypotheses and conventions.**
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

**Hypotheses and conventions.**
- When w_{i+1} lies above p in type (C) with residual weight 2, the weight is 2, precisely the p-adic hypothesis of KW Lemma 7.1.
- The field tower F = F₀ ⊂ … ⊂ F_r is quadratic at each step: every place of F_{i−1} above v_i splits in F_i, and every place above v_j, j ≠ i, is inert, with the residual image and cyclotomic irreducibility preserved. Each step exists by the quadratic clause (5) of R22.1/allowable-base-change-existence over F_{i−1}, prescribing the trivial extension at the places above v_i and the unramified quadratic extension at the places above the other v_j; F_r need not be Galois over F, and it is allowable in the tower sense of R22.1/allowable-base-change.

**Proof outline.**
- Apply the R18.3 Ihara-type degeneracy lemma after non-Eisenstein localization; its integral cokernel has no p-torsion at this ideal.
- Use the R18.3 algebraic level-raising input cited as Kisin Corollary 3.1.11 and Lemma 3.5.3, together with R19.4 local–global compatibility, to obtain Steinberg π_i.
- Apply R17.4 base change and R17.3 Jacquet–Langlands to transfer to F_{i+1} and retain the central character and local conditions.

**Checks.**
- A p-adic raising place in weight greater than 2 does not meet this use of Lemma 7.1.
- Field choice and automorphic base change are different inputs.
- The statement requires an actual non-Eisenstein modular witness, not an R = T assertion.

**Imports.** `HilbertModularVarietiesAndShimuraCurves:R18.6`, `AutomorphicGaloisRepresentations:R19.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.3`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`, `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2ModularityLifting:R22.1/allowable-base-change-existence`.

**Sources.** KW2-2009, Proof of Theorem 8.4, pp. 76–78, induction on p. 77.

### Theorem 8.4: modular lifts fitting the lifting data
`GL2ModularityLifting:R22.1/theorem-8-4-prescribed-modular-lifts` (theorem; planet "Modular lifts with prescribed local data").

Assume the residual hypotheses, field F and given ψ of §8.1, and α and β for p > 2 (β and α when k = 2 for p = 2). Fix actual compatible local lifts as in §8.3, with determinant ψχ_p: away from p either unramified or (γ_vχ_p *;0 γ_v), γ_v unramified and γ_v² = ψ_v; at all p-adic places simultaneously type (A), (B) or (C), with the exact KW restrictions. There exists an allowable F′/F and a cuspidal π′, discrete series of parallel weight at infinity, whose Galois representation lifts ρ̄_{F′}, fits the restricted local lifting data, is unramified at the specified unramified places and has determinant ψ_{F′}χ_p. For p > 2: (A) crystalline weight 2 ≤ k ≤ p + 1, with k = p + 1 only when F′ is split at p and k(ρ̄) = p + 1, and π′ unramified above p; (B) weight 2 crystalline over ℚ_p^nr(μ_p), WD inertia (ω_p^(k−2) ⊕ 1,0), U₁ invariants; (C) semistable non-crystalline weight 2 with prescribed γ_v and U₀ invariants. For p = 2 only crystalline weight 2 at residual weight 2, or prescribed semistable non-crystalline weight 2 at residual weight 4; π′ is respectively unramified or Steinberg above 2. Splitting at p may fail in the dyadic weight-4 branch and odd-p type (C) with residual weight 2; otherwise it can be arranged.

**Hypotheses and conventions.**
- The local lifts are inputs, not an assertion that the prescribed global modular lift already exists.
- The determinant alternatives match A to kind (i), B/C to kind (ii); p = 2 uses only kind (ii).

**Proof outline.**
- Use theorem-8-2-minimal-modular-lifts with cases (a)/(b)/(c) matching A/B/C; its unused extra weight-p+1 branch at residual weight 2 is excluded here.
- Apply prescribed-level-raising-step successively at the ramified lifting places, using the exact split/inert quadratic tower. Reapply Theorem 8.2 to remove the auxiliary neatness place.
- Use R19.5 Lemma 7.7 for compatibility at p. Remove the residual unramified quadratic sign discrepancies in the prescribed γ_v by further allowable base change, with the precise split-at-p exceptions retained. Every base change in the proof is supplied by R22.1/allowable-base-change-existence; the quadratic tower uses its clause (5).

**Checks.**
- Type B is not arbitrary potentially Barsotti–Tate type.
- Do not promise split at p in the two stated exceptions.
- The p + 1 crystalline case requires both residual weight p + 1 and splitting at p.
- Apply this theorem to construct the π field of minimal-level-data; never ask R20.6 to own this theorem.

**Imports.** `GL2ModularityLifting:R22.1/theorem-8-2-minimal-modular-lifts`, `GL2ModularityLifting:R22.1/prescribed-level-raising-step`, `GL2ModularityLifting:R22.1/allowable-base-change`, `GL2ModularityLifting:R22.1/allowable-base-change-existence`, `GL2ModularityLifting:R22.1/determinant-character-kinds`, `GlobalGaloisDeformations:R04.6/kw-deformation-data`, `AutomorphicGaloisRepresentations:R19.5`.

**Sources.** KW2-2009, §8.3, Theorem 8.4 and proof, pp. 74–78.
### Supplier boundary and remaining work

**The field and character supplier.** Findings /13 and /26 need Clozel–Harris–Taylor's Lemmas 4.1.1 and 4.1.2 (published
version, pp. 116–117): extension of a finite-order character of ∏_{v∈S} F_v^× to an idele class character; and a finite
soluble Galois extension with prescribed finite Galois completions at a finite set of places (real places allowed),
linearly disjoint from a given finite Galois extension. Finding /26 assigns them to PotentialModularityAndCompatibleSystems
R23.1. The packet requests them there with their exact statements and two refinements (the p-primary component of the
character; total reality). R23.1 now plans `cht-character-extension` with its finite-order and p-primary refinements, and `cht-soluble-prescribed-completions`. The former is the fine prerequisite of `lemma-7-10-determinant-adjustment`; the latter supplies `allowable-base-change-existence` and `solvable-base-change-reduction`. The underlying class-field and S-unit contracts remain open supplier interfaces. On the assembled stage graph R23.1 has
16 ancestors (scheme foundations, algebraic moduli and four Tau Ceti layers), none of which is a consumer of R22.1,
so the link R23.1 → R22.1 is acyclic. The requirements special to KW II (even degree, the conditions at p, disjointness
from the field cut out by ρ̄ and the p-th roots of unity, iteration in towers) are proved in this layer, in
`allowable-base-change-existence`. Its clause (5) gives quadratic extensions when every prescribed completion has
degree at most 2, by weak approximation and without class field theory; the proof of Theorem 8.4 needs extensions of
degree exactly 2, which Lemma 4.1.2 alone does not provide. R17.4 supplies automorphic base change and descent only. The packet prerequisites name those two existing supplier nodes.

R20.6's distinct Kisin type-change and Gee prescribed-weight contracts remain open; deleting the wrong KW Theorem 8.4
request did not discharge them.

For /19, delta-freeness-at-taylor-wiles-level applies R18.3’s Galois-free localized freeness and proves only the Galois-dependent rank/coinvariant control. dyadic-twists-of-forms imports the quaternionic twisting formulas and proves compatibility with the R04 deformation twists after identifying the class-field-theory characters. It does not give a second proof of Proposition 7.6.

The granularity, finite-presentation, local-type, multiplicity and globalisation gaps from the independent review remain open. The suggested file now gives typed forms, elaborating at the pinned Mathlib with unproved-declaration warnings only, of `allowable-base-change` (with a tower notion of solubility), `determinant-character-kinds` (predicates on the given character, beside the integer exponents) and the residual hypotheses (α) and (β), each with every API item and unit test of the packet under its packet name. They are stated over an "Imported interfaces" section: definitions built from Mathlib for the Galois-side notions, and data without a body for cuspidal automorphic representations (weight, conductor exponent, residual representation). The existence lemma, the transport of (α) and (β), Lemma 8.1, the passage from "ρ̄ modular" to (α), (β) and the odd-p branch of Lemma 7.10 are stated, each saying what it leaves out. KW II Theorems 8.2 and 8.4, the dyadic branch of Lemma 7.10 and KW I Theorem 4.1 remain comment sketches, because their local conditions at p cannot be stated at the pinned libraries; so do the definitions outside §7.6/§8.

## KW I Theorem 4.1 as an output of R22.5 and R22.6

Finding /12: KW II §10.2 proves KW I Theorem 4.1 from Theorem 9.7 and the weight part of Serre's conjecture, with
cited cases; it uses neither Theorem 6.1 (potential modularity) nor Theorem 10.1 (finiteness). The theorem is therefore
planned here, where Theorem 9.7 is, and its consumers in ClassicalSerreModularity cite these declarations.
On the prerequisite graph the two theorem nodes have a single ancestor in PotentialModularityAndCompatibleSystems, the
stage R23.1 of the field supplier. The packet PotentialModularityAndCompatibleSystems--R24.3 treats R24.4 as a consumer
layer (`R24.4/kw-theorem-4-1`, `R24.4/alpha-beta-from-residual-modularity`) and requests the full Theorem 4.1(2) from
R22.5; the nodes below are that export, apart from the one case recorded as a gap. This packet's restructure entry
records what remains: those two nodes should cite the export nodes, and the R22.5 text and the RS-08 keeps still place
the theorem in R24.

### From 'ρ̄ modular' over ℚ to the residual hypotheses (α) and (β)
`GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q` (lemma).

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, normalised by a twist so that 2 ≤ k(ρ̄) ≤ p + 1 when p > 2. (1) For p > 2, ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) for some N prime to p, and from S₂(Γ₁(Np)). For p = 2, ρ̄ arises from S₂(Γ₁(N)) with N odd when k(ρ̄) = 2, and from a weight-two form whose level has 2-adic valuation at most 1 in both cases k(ρ̄) = 2, 4. (2) Let F be a totally real field with a soluble tower over ℚ, unramified at p, with ρ̄|_{G_F} absolutely irreducible. Then ρ̄|_{G_F} satisfies (α) and (β) of KW II §8.2 if p > 2; if p = 2 it satisfies (β), and (α) when k(ρ̄) = 2.

**Hypotheses and conventions.**
- 'Modular' is in the sense of KW I §1: ρ̄ arises from a newform of some weight k ≥ 2 and some level.
- The optimal prime-to-p level N(ρ̄) is not needed, only some level prime to p; this is why Gross's hypothesis N > 4 is harmless (KW II §10.2).
- This is the weight part of Serre's conjecture, imported from SerreWeightAndLevelOptimisation: Edixhoven's theorem (weight k(ρ̄) at a level prime to p, from Gross's Theorem 13.10 and Coleman–Voloch), removal of the p-part of the level, and the passage to weight 2 at level Np (Gross's Propositions 8.13 and 8.18; Ribet). The supplier nodes for p = 2 and p = 3 have restrictions (ℓ ≥ 3 for the level step, ℓ > 3 or N > 3 for weight two); the cases they leave are requested from R20.6.
- No potential modularity (KW II Theorem 6.1) and no finiteness of deformation rings (Theorem 10.1) enter.
- Edixhoven's theorem produces a Katz form in characteristic p, while (α) and (β) ask for automorphic representations; the lift to characteristic zero in weight ≥ 2 is a step of the proof, not part of the weight theorem.

**Proof outline.**
- Level prime to p: ρ̄ arises from Γ₁(Np^a) for some a ≥ 0, hence from Γ₁(N) in some weight (SerreWeightAndLevelOptimisation R20.4/strip-ell-power-from-level, for p ≥ 3; R20.6 for p = 2).
- Weight k(ρ̄) at level N: Edixhoven's theorem (R20.3/edixhoven-weight-theorem), with the normalisation 2 ≤ k(ρ̄) ≤ p + 1, gives a Katz eigenform over 𝔽̄_p of type (N, k(ρ̄), ε). Lift it to characteristic zero: after enlarging N to a multiple N ≥ 5 prime to p, the reduction map on cusp forms of weight k(ρ̄) ≥ 2 is onto (AlgebraicModularFormsAndSerreWeights R15.2/integral-lattice-and-reduction-image; the cusp-sheaf H¹ has no torsion in weight ≥ 2), and the Deligne–Serre lemma gives a characteristic-zero eigenform with the same eigenvalues modulo p, hence a newform of weight k(ρ̄) and level dividing N from which ρ̄ arises (R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform). This is where the hypothesis N > 4 of KW II §10.2 enters.
- Weight 2 at level Np: R20.4/weight-two-at-level-n-ell (p > 3 or N > 3; enlarge N by an auxiliary prime if N ≤ 3). The p-component of the resulting newform has conductor exponent at most 1.
- Over F: take the cuspidal automorphic representations of GL₂(𝔸_ℚ) of these newforms and base-change them along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4); they stay cuspidal because ρ̄|_{G_F} is irreducible, their weights are parallel k(ρ̄), resp. 2, and above p they are unramified, resp. of conductor exponent at most 1, because F is unramified at p. These are witnesses for (α) and (β).

**Checks.**
- ρ̄ = E[p] for an elliptic curve E/ℚ of conductor prime to p, p ≥ 5, with E[p] irreducible: k(ρ̄) = 2, and the newform of E is at once the (α)- and the (β)-witness over ℚ.
- k(ρ̄) = p + 1 (très ramifiée): the (α)-witness has weight p + 1 and level prime to p, the (β)-witness has weight 2 and is Steinberg at p.
- For p = 2 and k(ρ̄) = 4 no (α) is asserted, as in KW II.

**Imports.** `GL2ModularityLifting:R22.5/kw-residual-modularity`, `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`, `SerreWeightAndLevelOptimisation:R20.3/edixhoven-weight-theorem`, `SerreWeightAndLevelOptimisation:R20.4/strip-ell-power-from-level`, `SerreWeightAndLevelOptimisation:R20.4/weight-two-at-level-n-ell`, `SerreWeightAndLevelOptimisation:R20.6`, `AlgebraicModularFormsAndSerreWeights:R15.6/s-type-arises-from-and-modular`, `AlgebraicModularFormsAndSerreWeights:R15.2/integral-lattice-and-reduction-image`, `AlgebraicModularFormsAndSerreWeights:R15.5/reduction-to-weight-at-least-two-and-to-a-true-eigenform`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Sources.** KW2-2009, §10.2, p. 92; KW2-2009, Proof of Theorem 6.1, solvable-image paragraph, p. 54.

### KW I Theorem 4.1(2): modularity lifting over ℚ for odd p
`GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime` (theorem; planet "KW I Theorem 4.1 for odd p").

Let p > 2 and ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a finite field of characteristic p, with ρ̄|_{ℚ(μ_p)} absolutely irreducible, and assume that ρ̄ is modular. Let ρ be a lift of ρ̄ to a p-adic representation, unramified outside a finite set of primes, that is either (i) crystalline of weight k at p with 2 ≤ k ≤ p + 1, or (ii) potentially semistable at p of weight 2. Then ρ is modular. This is an output of R22.5. Its proof, KW II §10.2, uses Theorem 9.7 (R22.5/kw-odd-prime-lifting), the weight part of Serre's conjecture and, for the cases outside Theorem 9.7, lifting theorems from the literature; it uses neither potential modularity (KW II Theorem 6.1) nor finiteness of deformation rings (KW II Theorem 10.1).

**Hypotheses and conventions.**
- Weight k means Hodge–Tate weights (k − 1, 0). The lift is odd because ρ̄ is and p is odd.
- Cases given by Theorem 9.7 (KW II §10.2, Remark): (i) for 2 ≤ k ≤ p, and for k = p + 1 when k(ρ̄) = p + 1 (type (A)); (ii) when ρ restricted to ℚ_p(μ_p) is semistable of weight 2, that is, crystalline over ℚ_p^{nr}(μ_p) (type (B)) or semistable non-crystalline (type (C)).
- Cases KW II take from the literature: (i) with k = p + 1 and k(ρ̄) = 2 (Kisin's Durham paper when the lift is non-ordinary at p, Diamond's Annals paper when it is ordinary); (ii) potentially Barsotti–Tate (Kisin, R22.5/kisin-pbt-lifting-over-q); and the semistable weight-two case 'goes back to' Wiles, Taylor–Wiles and Diamond. For k ≤ p − 1 they also cite Diamond–Flach–Guo, which Theorem 9.7 covers again.
- Case (ii) is covered completely. A potentially semistable lift of weight 2 is either potentially crystalline, hence potentially Barsotti–Tate (Kisin's theorem), or its Weil–Deligne representation has N ≠ 0; then ρ|_{D_p} is the twist of a semistable non-crystalline representation by a character η of finite order on inertia, η|_{I_p} is the restriction of a Dirichlet character of p-power conductor, and twisting ρ and ρ̄ by its inverse preserves the hypotheses and the conclusion and gives type (C). KW II do not print this reduction.
- Not planned in this packet and recorded as a gap: case (i) with k = p + 1 and k(ρ̄) = 2 for a lift non-ordinary at p (Kisin's Durham paper).
- PotentialModularityAndCompatibleSystems R24.4 is a consumer layer for this theorem: its nodes R24.4/kw-theorem-4-1 and R24.4/alpha-beta-from-residual-modularity bind the exports of R22.5 and R22.6 to KW I's hypotheses, and that packet requests the full Theorem 4.1(2) from R22.5. This node is that export. The request includes k = p + 1 with residual weight 2; for a lift non-ordinary at p that case is the gap recorded here.

**Proof outline.**
- Residual input. ρ̄ modular gives (α) and (β) over every soluble totally real F unramified at p on which ρ̄ stays absolutely irreducible (R22.5/alpha-beta-from-modularity-over-q).
- Base change. Choose an allowable F/ℚ (R22.1/allowable-base-change-existence), split at p when ρ̄|_{D_p} is irreducible or k(ρ̄) = p + 1, over which ρ|_{G_F} has the uniform shape that the proof of Theorem 9.7 starts from (R22.5/solvable-base-change-reduction).
- Theorem 9.7 (R22.5/kw-odd-prime-lifting) makes ρ|_{G_F} modular in the cases of types (A), (B), (C).
- Descent along the soluble tower returns to ℚ (GL2AutomorphicRepresentationsAndTransfer R17.4, through R22.5/solvable-base-change-reduction).
- Remaining cases: potentially crystalline lifts of weight 2 are potentially Barsotti–Tate and are R22.5/kisin-pbt-lifting-over-q; potentially semistable lifts with N ≠ 0 are reduced to type (C) by a twist by a Dirichlet character of p-power conductor; ordinary crystalline lifts of weight p + 1 with k(ρ̄) = 2 are covered by the ordinary lifting theorem (OrdinaryAutomorphicFormsAndModularityLifting R21.4, requested; KW II cite Diamond for this case); the non-ordinary lifts of weight p + 1 with k(ρ̄) = 2 are the gap.

**Checks.**
- p = 3, ρ the 3-adic Tate module of 11a1: crystalline of weight 2, residual image GL₂(𝔽₃), absolutely irreducible over ℚ(μ₃); the theorem recovers its modularity through type (A).
- Crystalline of weight p + 2 is outside (i).
- The Tate module of an elliptic curve with additive, potentially multiplicative reduction at p ≥ 5: potentially semistable with N ≠ 0, and its quadratic twist has multiplicative reduction, type (C).

**Imports.** `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`, `GL2ModularityLifting:R22.5/kw-odd-prime-lifting`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`, `GL2ModularityLifting:R22.1/allowable-base-change-existence`, `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`, `GL2ModularityLifting:R22.5/kisin-pbt-lifting-over-q`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.4`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Sources.** KW2-2009, §10.2, p. 92; KW2-2009, §10.2, Remark, p. 92; KW1-2009, Theorem 4.1, p. 7.

### KW I Theorem 4.1(1): 2-adic modularity lifting over ℚ
`GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic` (theorem; planet "KW I Theorem 4.1 at p = 2").

Let ρ̄ : G_ℚ → GL₂(𝔽), 𝔽 a finite field of characteristic 2, have non-solvable image, and assume that ρ̄ is modular. Let ρ be an odd lift of ρ̄ to a 2-adic representation, unramified outside a finite set of primes, that is either crystalline of weight 2 at 2, or semistable of weight 2 at 2, the latter case being considered only when k(ρ̄) = 4. Then ρ is modular. This is an output of R22.6, proved as in KW II §10.2 from Theorem 9.7 at p = 2 (R22.6/kw-dyadic-lifting) and the weight part of Serre's conjecture, with no use of potential modularity or of finiteness of deformation rings.

**Hypotheses and conventions.**
- Oddness is a hypothesis on the lift: det ρ(c) = −1. It cannot be read off ρ̄ in characteristic 2 (R22.6/dyadic-oddness).
- k(ρ̄) = 4 exactly when ρ̄ is not finite at 2; this matches the condition of Theorem 9.7 that the semistable non-crystalline case is considered only when the residual representation is not finite at the places above 2.
- The residual input over ℚ is 'ρ̄ modular'; it gives (β), and (α) when k(ρ̄) = 2, by R22.5/alpha-beta-from-modularity-over-q.
- KW II remark that some results towards this statement are due to Dickinson; they are not used.

**Proof outline.**
- (β), and (α) if k(ρ̄) = 2, over every soluble totally real F unramified at 2 on which the image stays non-solvable (R22.5/alpha-beta-from-modularity-over-q).
- An allowable F/ℚ (R22.1/allowable-base-change-existence) over which ρ|_{G_F} has the shape required at the start of the proof of Theorem 9.7 (R22.5/solvable-base-change-reduction); the non-solvable image is preserved.
- Theorem 9.7 at p = 2 (R22.6/kw-dyadic-lifting): ρ|_{G_F} is modular.
- Descent to ℚ along the soluble tower (GL2AutomorphicRepresentationsAndTransfer R17.4).

**Checks.**
- ρ̄ with image SL₂(𝔽₄) ≅ A₅, modular, and an odd crystalline lift of weight 2: covered.
- A semistable non-crystalline lift when ρ̄ is finite at 2 (k(ρ̄) = 2) is not covered.
- An even lift is not covered, whatever ρ̄(c) is.

**Imports.** `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`, `GL2ModularityLifting:R22.6/kw-dyadic-lifting`, `GL2ModularityLifting:R22.6/dyadic-oddness`, `GL2ModularityLifting:R22.5/solvable-base-change-reduction`, `GL2ModularityLifting:R22.1/allowable-base-change-existence`, `GL2ModularityLifting:R22.1/alpha-beta-under-allowable-base-change`, `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Sources.** KW2-2009, §10.2, p. 92; KW1-2009, Theorem 4.1, p. 7.
### The lifting application table no longer imports its consumer

Until round 3, R32.2/application-requirements had ClassicalSerreModularity R33.3/dp-dyadic-transition-and-the-order-three-type
as a prerequisite, against the direction R32.2 → R32.3 → … → R32.6 → R33.2 → R33.3 of the layers. The node is now the
contract that an application of Theorem 1.4 must verify, with the list of uses in Dieulefait–Pacetti as locators. The
verification at each use is made by the consuming nodes of ClassicalSerreModularity, and
R33.1/dp-modularity-lifting-inputs cites this node. R32.1/quadratic-cyclotomic-irreducibility cites Dickson's
classification from ArithmeticGaloisRepresentations R01.4 instead of the KW I §6 node of ClassicalSerreModularity R27.1.
No node of this packet now has a prerequisite in ClassicalSerreModularity. This does not assert independence of the
whole modern route; the globalisation audit of R31.6 remains open.
