# Main conjectures for modular forms and their families

A target-level blueprint for the cyclotomic main conjectures of modular forms, their integral normalizations, family and signed comparisons, and arithmetic consequences. This roadmap imports the proof endpoints owned by AutomorphicCongruences and the general cohomology, regulator and Iwasawa-algebra machinery owned elsewhere. Its own work is the precise formulation, comparison and transport between them.

Independent review: `REV-ModularIwasawaMainConjectures`, Codex, 2026-10-19. All 46 targets were checked: 7 verified and 39 corrected, with no new nodes. The finished pass has seven planned layers, no closed layer, nine explicit gaps and thirteen supplier requests. Accepted means that this target-level pass is sound with those recorded obligations; it does not mean a gap-free implementation. Every implementation status remains unchecked.

## Conventions and normalization

The datum uses the geometric/cohomological representation of Skinner–Urban and its determinant twist T=T_f(det ρ_f^−1), which becomes T_pE in weight two. Ordinary includes the explicitly specified weight-two multiplicative branch; good ordinary requires p∤N. The cyclotomic Z_p direction Γ and the full group Δ×Γ are kept separate, and every tame-character projection carries its coefficient and dual-action convention. The coefficient ring is O and Λ=O[[Γ]].

Skinner–Urban’s cohomological canonical period Ω_f and the differential/modular-symbol period P_f=−2πiΩ_f have different normalizations. The corrected interpolation denominator is (−2πi)^(m+1)Ω_f, or equivalently (−2πi)^m P_f. Skinner 2016 §2.4 footnote 6, p.14 records this known correction. The curve/form analytic scalar is P_f/Ω_E. Algebraicity of a period ratio does not prove it is an O-unit; every integral comparison retains this distinction.

Characteristic ideals use the actual integral lattices. In the signed formulation, a Coleman image can be a fractional Λ-lattice, while its quotient by the zeta image is still a genuine finitely generated torsion Λ-module. A rational unit comparison of Coleman maps does not by itself identify a separately Néron-normalized analytic L-function integrally. Euler factors, isogeny indices, Manin factors, Tor corrections and cyclotomic logarithms are retained when they are nonunits.

Exact MTT includes finiteness of full Sha and an exact leading coefficient. MTT_p uses only Sha[p∞] and equality up to Z_p×. The MTT regulator includes the torsion denominator; the raw determinant in the Schneider display is explicitly distinguished. Neither conjecture is a hypothesis-free consequence of writing down a characteristic ideal.

## Library baseline and ownership

The pinned source statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The following are existing ingredients, rather than claims that a modular main conjecture is formalized.

| Declaration | Module | Provides |
|---|---|---|
| `mathlib:Representation.invariants` | `Mathlib/RepresentationTheory/Invariants.lean` | The submodule of vectors fixed by every group element, used for dim ρ̄^{I_ℓ} and dim ρ̄^{D_ℓ} |
| `mathlib:ContRepresentation` | `Mathlib/RepresentationTheory/Continuous/Basic.lean` | A monoid homomorphism to continuous linear endomorphisms. This ensures continuity of each operator on the module; continuity in the group variable or of the joint action must be supplied separately for a continuous Galois representation. |
| `mathlib:Matrix.toLin'` | `Mathlib/LinearAlgebra/Matrix/ToLin.lean` | Matrices as linear maps (n → R) → (m → R), used for the unipotent rank-one quotient |
| `mathlib:PowerSeries` | `Mathlib/RingTheory/PowerSeries/Basic.lean` | Formal power series R⟦X⟧, the model O⟦X⟧ of Λ |
| `mathlib:Associated` | `Mathlib/Algebra/GroupWithZero/Associated.lean` | x and y differ by a unit, the equality of principal ideals |
| `mathlib:IsDiscreteValuationRing` | `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean` | The coefficient ring O |

Read-only ownership check on 2026-10-19: TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 and its TauCeti package a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Checked the nine post-snapshot directions, including LocalGaloisGroups and ProfiniteArithmetic for local inertia and continuous-cohomology overlap; no cyclotomic modular main-conjecture target is duplicated. OperatorTheory is an umbrella of eight roadmaps, not a missing single Suggested file. PadicMeasuresIwasawaAlgebras here is an atlas supplier, not a claim that it is a roadmap on current upstream main.

Current TauCeti already defines TauCeti.tateCurve over Z[[q]] in AlgebraicGeometry/EllipticCurve/TateCurve/Basic.lean and TauCeti.tateCurveAt in Specialization.lean, with its ellipticity and discriminant norm. Reuse these when the baseline is advanced. They do not provide point uniformization Qbar_p×/q^Z or the Tate parameter of an arbitrary split multiplicative E; those remain the upstream EllipticCurves layer-4 supplier obligation. This packet plans only the arithmetic L-invariant and its use, not a new Tate-curve construction.

Read current FieldTheory/GaloisCohomology/Kummer.lean and AlgebraicGeometry/EllipticCurve/MordellWeil/SelmerGroup.lean. The Kummer map/isomorphism and restriction/corestriction are existing inputs, and WeierstrassCurve.Affine.selmerGroup₂ is a finite 2-descent Selmer group. None is a p-infinity ordinary cyclotomic Selmer group, Coleman-map local condition or Schneider height comparison. Reuse existing cohomology and descent rather than planning them here.

The ownership split follows RS-11. Fouquet–Wan pointwise/family endpoints belong to AutomorphicCongruences L4 and BCS endpoints to its L5b; this roadmap supplies convention and lattice/period transport. L1 assembles ordinary equality from the Kato and reverse-divisibility suppliers. The proposed L1m split and imaginary-quadratic roadmap are maintainer actions, not edits to their owners.

| Imported objects | Owner |
|---|---|
| Completed group rings, characteristic ideals, μ/λ, determinant lines | PadicMeasuresIwasawaAlgebras L1, L4, L5 (atlas supplier) |
| Ordinary local conditions, Pontryagin duals, Poitou–Tate, Selmer complexes | SelmerIwasawaCohomology L1–L4 |
| Zeta elements, explicit reciprocity, Kato divisibilities | KatoEulerSystems L2–L4 |
| Wach bases, Coleman maps and their images, signed local conditions | PadicHodgeRegulators L3–L4 |
| Integral modular-symbol periods, ordinary measures, Pollack functions | ModularSymbolsPadicLFunctions L1, L2, L4 |
| Modularity, parametrizations, Tate-module comparison | EllipticCurveModularity R29.4–R29.6 |
| Manin integrality and its stated unit range | GrossZagierAndArithmeticHeights GZ.3 |
| Reverse divisibilities and pointwise/family/elliptic endpoints | AutomorphicCongruences L1, L2, L4, L5b |
| Hida approximation and Greenberg–Stevens derivative formula | OrdinaryAutomorphicFormsAndModularityLifting R21.6; PadicFamilies L1, L3 |
| Tate point uniformization; Iwasawa logarithm; Tate-parameter transcendence | Upstream EllipticCurves layer 4; ColemanIntegration L0; DiophantineApproximationAndTranscendence DT.5 |
| Anticyclotomic, Eisenstein, supersingular and multiplicative branches | HeegnerPointEulerSystems HE.8b; RankZeroOneBSD BSD.6a, BSD.7a |

## Layers and planets

| Layer | Targets | Planets |
|---|---|---|
| L0 | The three formulations | Ordinary Selmer group over Q_∞; Ordinary p-adic L-function; Iwasawa–Greenberg main conjecture; Iwasawa fundamental line; Kato's main conjecture; Signed main conjecture |
| L1 | Ordinary theorems | Skinner–Urban main conjecture; Fouquet–Wan ordinary theorem; Skinner's multiplicative-reduction theorem |
| L2 | Fouquet–Wan pointwise theorem | Fouquet–Wan pointwise main conjecture |
| L3 | Elliptic-curve dictionary and BCS | Mazur–Swinnerton-Dyer p-adic L-function; Mazur's main conjecture; BCS cyclotomic main conjecture |
| L4 | Families and signed theory | Fouquet–Wan universal-family theorem; Signed main conjecture theorem; Kobayashi–Pollack signed main conjecture |
| L5 | Consequences and examples | Euler-factor change; Rank-zero p-converse; Mazur–Tate–Teitelbaum ℒ-invariant; Mazur–Tate–Teitelbaum conjecture |
| L6 | Branch interfaces | — |

## L0. The three formulations

Fix the datum, ordinary and signed Selmer groups, canonical analytic normalization, Kato cohomology and fundamental line. The comparisons keep integral period compatibility and actual Coleman image terms explicit.

### The modular Iwasawa datum

**Definition** `L0/modular-iwasawa-datum`.

A modular Iwasawa datum D = (f, p, L, T_f) consists of: an odd prime p with fixed embeddings ι_∞ : Q̄ → C and ι_p : Q̄ → Q̄_p; a newform f ∈ S_k(Γ_1(N), ε) of weight k ≥ 2; a finite extension L/Q_p containing ι_p(Q(f)), with ring of integers O, uniformiser ϖ and residue field F; the two-dimensional L-representation ρ_f : G_Q → Aut_L(V_f) of Deligne in geometric normalisation, so that for ℓ ∤ Np the geometric Frobenius has characteristic polynomial X² − a_ℓ(f)X + ε(ℓ)ℓ^{k−1} and L(V_f, s) = L(f, s); and a G_Q-stable O-lattice T_f ⊂ V_f. Put T := T_f(det ρ_f^{-1}), V := T[1/p], A := V/T (so that T ≅ T_pE when f = f_E has weight two and trivial character), Γ := Gal(Q_∞/Q) for the cyclotomic Z_p-extension Q_∞, G_∞ := Gal(Q(μ_{p^∞})/Q) ≅ Δ × Γ with Δ ≅ (Z/p)^×, Λ := O[[Γ]], Λ(G_∞) := O[[G_∞]], γ ∈ Γ the generator corresponding to 1 + p under the cyclotomic character κ, and ι : Λ → Λ the involution induced by g ↦ g^{-1}. The residual representation ρ̄ is the reduction of T_f modulo ϖ; its semisimplification does not depend on T_f. The datum is good ordinary when p ∤ N and a_p(f) ∈ O^×; then V_f has a unique G_{Q_p}-stable line V_f^+ on which inertia acts trivially, and T^+ := (T_f ∩ V_f^+)(det ρ_f^{-1}). The ordinary datum satisfies (dist) when the two characters of G_{Q_p} on ρ̄^{ss} restricted to G_{Q_p} are distinct, and (irred) when ρ̄ is irreducible. For the multiplicative branch only, also allow a weight-two p-new form of level N₀p, p ∤ N₀, with a_p = ±1: use its unramified cohomological subline and the same saturated determinant twist (Skinner 2016 §2.1, pp.5–6). In this roadmap ordinary includes this specified semistable case; good ordinary always requires p ∤ N.

**Hypotheses.**

- p odd; f a newform; L contains the Hecke field and, for an ordinary datum, the roots of X² − a_p X + ε(p)p^{k−1}
- geometric normalisation of ρ_f, as in Skinner–Urban; Kato's V_{F_λ}(f) is related to it by the dictionary of KatoEulerSystems:L2/hecke-dual-twist-dictionary, and Fouquet–Wan's cohomological ρ_f (det = χ_cyc^{1−k} for trivial ε) by ModularIwasawaMainConjectures:L2/fw-convention-dictionary

**Proof sketch / construction.**

1. Take ρ_f and its integral lattices from AutomorphicGaloisRepresentations:R19.5/ordinary-refinement-and-saturated-lattice (ordinary case) and R19.5/good-nonordinary-crystalline-wach-realisation (crystalline nonordinary case); the line V_f^+ and saturation T_f ∩ V_f^+ are the ordinary refinement supplied there (Skinner–Urban §1.1, p.2).
2. The twist by det ρ_f^{-1} is the one Skinner–Urban use to define their Selmer group (§1.1, p.2); for f = f_E the identification T ≅ T_pE comes from EllipticCurveModularity:R29.4/tate-module-comparison and the Weil pairing.
3. Λ, Λ(G_∞), the involution and the identification Λ ≅ O[[X]], γ ↦ 1 + X, are those of the completed group rings of PadicMeasuresIwasawaAlgebras:L1.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `ModularIwasawaDatum.T` | data | The twisted lattice T = T_f(det ρ_f^{-1}) with its continuous G_Q-action; V = T[1/p], A = V/T. |
| `ModularIwasawaDatum.residual` | projection | The residual representation ρ̄ = T_f/ϖT_f of G_Q over F. |
| `ModularIwasawaDatum.residual_ss_independent` | characterisation | ρ̄^{ss} is independent of the lattice T_f (Brauer–Nesbitt); if ρ̄ is irreducible, any two lattices are homothetic. |
| `ModularIwasawaDatum.changeLattice` | functoriality | A G_Q-equivariant inclusion T_f' ⊂ T_f with finite cokernel induces A' → A with finite kernel; the data D' and D share V and ρ̄^{ss}. |
| `ModularIwasawaDatum.extendCoefficients` | functoriality | For a finite extension L'/L with ring O', the datum D ⊗ O' has lattice T_f ⊗_O O' and Iwasawa algebra Λ_{O'} = Λ ⊗_O O', faithfully flat over Λ. |
| `ModularIwasawaDatum.ordinaryLine` | data | The saturated G_{Q_p}-stable line T^+ has free rank-one quotient T/T^+. In the good ordinary case the quotient’s character is the inverse of the unramified character of V_f^+, since T ≅ V_f^∨ rationally in dimension two. Thus T/T^+ is unramified; T^+ itself is generally ramified. |
| `ModularIwasawaDatum.ofEllipticCurve` | constructor | For E/Q with newform f_E (EllipticCurveModularity:R29.6/modularity-theorem), the datum with L = Q_p, T ≅ T_pE; T^+ is the kernel of reduction (the formal-group line) when p is good ordinary. |
| `ModularIwasawaDatum.cyclotomicIdentification` | equivalence | Λ ≅ O[[X]] via γ ↦ 1 + X, and Λ(G_∞) ≅ O[Δ][[Γ]] ≅ ∏_{η ∈ Δ^∨} Λ when O contains μ_{p−1}. |

**Uses.**

- Skinner–Urban §1.1, p.2: the twist T_f(det ρ_f^{-1}) and the unramified line V_f^+ define their Selmer group and Theorem 1
- ModularIwasawaMainConjectures:L0/ordinary-selmer-dual: every Selmer group of this roadmap is built from (T, T^+, A)
- ModularIwasawaMainConjectures:L2/fw-convention-dictionary: Fouquet–Wan's T ⊂ M(f)_{et,p} is compared with this T
- RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula: the elliptic instance T ≅ T_pE is the lattice of the specialised formula

**Unit tests.**

- `ModularIwasawaDatum.ofEllipticCurve_11a1_ordinary_at_7` (computation): For E = 11a1 (y² + y = x³ − x² − 10x − 20) and p = 7, a_7(E) = −2, so the datum is ordinary, and (dist) holds because on the cohomological ρ̄_f the sub-character is unramified and the quotient has the nontrivial inertia character ω⁻¹; on the determinant-twisted Tate representation these roles are dual.
- `ModularIwasawaDatum.residual_ss_independent_example` (characterisation): For an upper-triangular two-dimensional representation whose residual characters are 1 and ω, a stable lattice and an isogenous stable lattice have the same residual semisimplification 1 ⊕ ω even when their extension classes differ. Residual semisimplification, rather than equality of matrices or extension classes, is the lattice-independent output.
- `ModularIwasawaDatum.twist_weight_two` (compatibility): For f = f_E of weight two and trivial character, det ρ_f = χ_cyc^{-1} in geometric normalisation, so T = T_f(χ_cyc) ≅ T_pE; a definition omitting the twist would give T_pE^∨, whose Selmer group is not the p^∞-Selmer group of E.
- `ModularIwasawaDatum.not_ordinary_supersingular` (non-example): For E = 14a1 and p = 5, a_5 = 0, so the datum is not ordinary and has no unramified G_{Q_5}-stable line.

**Acceptance checks.**

- For f = f_E attached to 11a1 (weight 2, N = 11, ε = 1) and p = 7: a_7 = −2 ∈ Z_7^×, so the datum is ordinary; the unit root α of X² + 2X + 7 is congruent to −2 mod 7.
- Changing T_f to ϖT_f gives the same T up to the isomorphism multiplication by ϖ; changing it to a non-homothetic lattice changes T but not ρ̄^{ss}.

**Direct prerequisites.** `AutomorphicGaloisRepresentations:R19.5/ordinary-refinement-and-saturated-lattice`, `AutomorphicGaloisRepresentations:R19.5/good-nonordinary-crystalline-wach-realisation`, `EllipticCurveModularity:R29.4/tate-module-comparison`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `PadicMeasuresIwasawaAlgebras:L1`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2: fixes geometric conventions for ρ_f, the unramified G_p-stable line V_f^+, the lattice T_f and the twist T = T_f(det ρ_f^{-1}) used to define the Selmer group; Λ_{Q,O} = O[[Γ_Q]] with γ ↔ 1+p
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5: the lattice T ⊂ M(f)_{et,p}, ρ_f, ρ̄_f and Λ_Iw = Z_p[[Γ_Iw]] used for the fundamental line and Conjecture 1.5
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.1, pp.5–6: The unramified subline and ordinary filtration include the p-new multiplicative weight-two case.

### The ordinary Selmer group over Q_∞ and its dual

**Construction** `L0/ordinary-selmer-dual`. Planet: *Ordinary Selmer group over Q_∞*.

For an ordinary modular Iwasawa datum and a finite set Σ of primes not containing p, the Σ-imprimitive ordinary Selmer group is Sel^Σ(Q_∞, A) := the subgroup of H¹(Q_∞, A) of classes that are unramified at every finite place of Q_∞ not above p or Σ and whose restriction to the decomposition group at the unique place above p maps to zero in H¹(Q_{∞,p}, (T/T^+) ⊗ Q_p/Z_p); Sel(Q_∞, A) is the case Σ = ∅. Its Pontryagin dual X^Σ := Hom_cont(Sel^Σ(Q_∞, A), Q_p/Z_p) is a finitely generated Λ-module, with Λ acting on the dual through ι (the contragredient action). The same construction over Q(μ_{p^∞}) gives a Λ(G_∞)-module X^Σ(G_∞) whose η-components, for η ∈ Δ^∨, are obtained by the explicit discrete-coefficient twist A ⊗ η over Q_∞, with the local conditions twisted as well; a modular-form identification additionally uses the Hecke dual/twist dictionary.

**Hypotheses.**

- good ordinary datum, or the explicitly specified weight-two multiplicative datum
- Σ finite, p ∉ Σ; the conditions at Σ are relaxed (no condition)
- finite generation over Λ is unconditional; torsion is a theorem under hypotheses (ModularIwasawaMainConjectures:L0/ordinary-selmer-structure), never part of the definition

**Proof sketch / construction.**

1. Instantiate the Greenberg local condition SelmerIwasawaCohomology:L2/greenberg-condition at p with F^+ = T^+ and the unramified condition SelmerIwasawaCohomology:L2/unramified-condition away from pΣ, over the cyclotomic tower; the global group is SelmerIwasawaCohomology:L2/galois-selmer-group in its discrete form and the dual is SelmerIwasawaCohomology:L2/pontryagin-dual.
2. Skinner–Urban define the condition at p as vanishing in H¹(Q_{∞,p}, (T/T^+) ⊗ Q_p/Z_p) (§1.1, p.2). Since Q_{∞,p}/Q_p is totally ramified, the kernel of H¹(Q_{∞,p}, A^-) → H¹(I, A^-) is A^-/(φ − 1)A^-, which is zero whenever the unramified Frobenius eigenvalue on A^- := (T/T^+) ⊗ Q_p/Z_p is not 1; so the strict and inertial forms agree unless α = 1, and the strict form is the one used.
3. Finite generation of X^Σ follows from that of H¹(Q_Σ'/Q_∞, A)^∨ over Λ (SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler) by Nakayama over the compact local ring Λ (PadicMeasuresIwasawaAlgebras:L5).

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `OrdinarySelmer.mem_iff` | characterisation | A class c ∈ H¹(Q_∞, A) lies in Sel^Σ iff it is unramified at all finite places away from pΣ and loc_p(c) ↦ 0 in H¹(Q_{∞,p}, (T/T^+) ⊗ Q_p/Z_p). |
| `OrdinarySelmer.dual` | data | X^Σ = Hom_cont(Sel^Σ, Q_p/Z_p) with (λ·φ)(c) = φ(ι(λ)c). |
| `OrdinarySelmer.dual_fg` | structure | X^Σ is a finitely generated Λ-module. |
| `OrdinarySelmer.relax` | relation | For Σ' ⊂ Σ there is an exact sequence 0 → (⊕_{ℓ∈Σ∖Σ'} H¹(Q_{∞,ℓ}, A))^∨ → X^Σ → X^{Σ'} → 0 when X^Σ is torsion and T* has no nonzero G_Q-invariants. Require also Σ ∪ {p} to contain every prime where T ramifies, as in Skinner–Urban Proposition 3.2.18. |
| `OrdinarySelmer.changeLattice` | functoriality | A finite-index inclusion of lattices induces a map of Selmer groups whose kernel and cokernel are annihilated by a bounded power of ϖ; they need not be finite over an infinite tower. The duals become isomorphic over Λ[1/p]. Under residual irreducibility, compare homothetic lattices by the equivariant scalar isomorphism, giving equal integral characteristic ideals. |
| `OrdinarySelmer.extendCoefficients` | compatibility | X^Σ(D ⊗ O') ≅ X^Σ(D) ⊗_O O' as Λ_{O'}-modules. |
| `OrdinarySelmer.ofEllipticCurve` | compatibility | For the datum of E/Q at a good ordinary p, Sel(Q_∞, A) = lim_n Sel_{p^∞}(E/Q_n), Mazur's Selmer group. |
| `OrdinarySelmer.etaComponent` | relation | With e_η = ∣Δ∣⁻¹Σ_δ η(δ)⁻¹δ, e_ηX(G_∞) is dual to e_{η⁻¹}Sel(G_∞). By restriction/corestriction it identifies with the dual Selmer module of A ⊗ η over Q_∞, including the twisted local conditions. No assertion that a p-ramified modular twist has good ordinary level is implicit. |

**Uses.**

- Skinner–Urban Theorem 3.6.4, p.43: the characteristic ideal Ch^Σ_{Q_∞,L}(f) of X^Σ is one side of the main conjecture
- RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula: the dual X at the trivial character controls Sel_{p^∞}(E/Q)
- ModularIwasawaMainConjectures:L1/skinner-multiplicative-theorem: Fitting ideals of X^Σ modulo p^m are compared across a Hida family
- ModularIwasawaMainConjectures:L0/ordinary-cohomological-comparison: X is the third term of Kato's Poitou–Tate sequence (17.13.1)

**Unit tests.**

- `OrdinarySelmer.strict_eq_inertial_away_from_one` (characterisation): If the unramified Frobenius eigenvalue on T/T^+ is not 1 (e.g. E = 11a1 at p = 7, eigenvalue the unit root α ≡ −2 mod 7), the strict and inertial conditions at p define the same Selmer group.
- `OrdinarySelmer.unramified_eq_strict_away_from_p` (characterisation): At ℓ ≠ p the unramified and strict conditions over Q_∞ agree, because Gal(Q_ℓ^{ur}/Q_{∞,w}) has profinite order prime to p; a definition imposing the Bloch–Kato finite condition gives the same group.
- `OrdinarySelmer.ofEllipticCurve_trivial_character` (compatibility): For E = 11a1, p = 7, the Γ-coinvariants of the dual relate to Sel_{7^∞}(E/Q) with finite kernel and cokernel (Mazur control), and Sel_{7^∞}(E/Q) is finite since E(Q) and Sha(E/Q)[7^∞] are finite.
- `OrdinarySelmer.not_torsion_by_definition` (non-example): The definition does not assert that X is Λ-torsion: torsion is the theorem of Kato (17.4(1)); a construction that builds torsion into the definition would make ModularIwasawaMainConjectures:L0/ordinary-selmer-structure vacuous.

**Acceptance checks.**

- For E = 11a1 and p = 7, Sel(Q_∞, A) is the p^∞-Selmer group Sel_{7^∞}(E/Q_∞) of Mazur, and X its dual (Burungale–Castella–Skinner §1.1, p.1).
- Relaxing Σ: X^Σ surjects onto X with kernel the dual of ⊕_{ℓ∈Σ} H¹(Q_{∞,ℓ}, A) (Skinner–Urban Proposition 3.2.18, p.27) when X is torsion and T* has no G_Q-fixed vectors. Here Σ ∪ {p} contains the ramification set.

**Direct prerequisites.** `SelmerIwasawaCohomology:L2/greenberg-condition`, `SelmerIwasawaCohomology:L2/unramified-condition`, `SelmerIwasawaCohomology:L2/galois-selmer-group`, `SelmerIwasawaCohomology:L2/pontryagin-dual`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`, `L0/modular-iwasawa-datum`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2: defines Sel_{Q_∞,L}(f) as the classes unramified away from p whose restriction at p dies in H¹(Q_{∞,p}, T/T^+ ⊗ Q_p/Z_p), and X_{Q_∞,L}(f) its Pontryagin dual
- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27: Σ-imprimitive Selmer groups and the exact sequence relating X^Σ and X^{Σ'}, from Greenberg–Vatsal Corollary 2.3
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, p.1 and §2.5, p.15: the Iwasawa–Greenberg Selmer group Sel_{Q_∞,L}(f), its dual X and the Σ-imprimitive variants X^Σ
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.1, p.1: for an elliptic curve the classical Selmer group Sel_{p^∞}(E/Q_∞) and its dual X_ord(E/Q_∞), finitely generated over Λ

### Structure of the ordinary Selmer dual

**Theorem** `L0/ordinary-selmer-structure`.

Let D be an ordinary modular Iwasawa datum with trivial character. (1) X^Σ is finitely generated over Λ. (2) If p ∤ N, then X is Λ-torsion (Kato 17.4(1)); for f = f_E with E/Q non-CM and good ordinary or multiplicative at p, Z_∞ = Sel(E/Q_∞)^∨ is torsion. (3) If X^Σ is torsion, ρ̄ is irreducible, and Greenberg's local hypotheses hold (for the quoted Rubin elliptic case: E non-CM and good ordinary at p and p ∤ ∏_{q|N} #E(Q_q)_tors), then X^Σ has no nonzero finite Λ-submodule. (4) Under (3), char_Λ(X^Σ) = Fitt_Λ(X^Σ) is principal, and char_Λ(X^Σ) does not depend on the lattice T_f.

**Hypotheses.**

- ordinary datum, trivial character
- (2) uses p ∤ N for the non-elliptic case
- (3) needs X^Σ torsion and the local hypotheses of Greenberg's theorem; for Σ-imprimitive X^Σ Skinner–Urban Lemma 3.2.17(i) gives the absence of pseudo-null submodules of the local terms
- (4) the Fitting comparison is over Λ ≅ O[[X]] for modules with no nonzero finite submodule and projective dimension one

**Proof sketch / construction.**

1. (1) is ModularIwasawaMainConjectures:L0/ordinary-selmer-dual's finiteness.
2. (2) is Kato Theorem 17.4(1) as planned in KatoEulerSystems:L4/ordinary-selmer-divisibility, and for elliptic curves KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility (Rubin III.5.14–5.16).
3. (3) is Greenberg's theorem in the form SelmerIwasawaCohomology:L3/selmer-no-pseudonull, and for elliptic curves Rubin Corollary 5.17 (KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule).
4. (4) is SelmerIwasawaCohomology:L3/selmer-fitting-characteristic; lattice independence follows because irreducible ρ̄ forces homothetic lattices (Skinner–Urban §1.1, p.2).

**Acceptance checks.**

- For E = 11a1, p = 7: E has good ordinary reduction at 7, and E(Q_11) ≅ Q_11^×/q^Z for a Tate parameter q of 11-adic valuation 5, whose torsion subgroup has order dividing (11 − 1)·5 = 50, hence prime to 7; so Z_∞ has no nonzero finite submodule.
- Skinner's proof of Theorem A uses exactly (3)–(4): Ch^Σ(f_m) = F^Σ(f_m) for each member f_m of the Hida family (Skinner §1, p.3).

**Direct prerequisites.** `L0/ordinary-selmer-dual`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `KatoEulerSystems:L4/elliptic-ordinary-and-multiplicative-divisibility`, `KatoEulerSystems:L4/elliptic-no-finite-iwasawa-submodule`, `SelmerIwasawaCohomology:L3/selmer-no-pseudonull`, `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic`.

**Sources.**

- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Theorem 17.4(1), p.273: X(T) is a torsion Λ-module for a good ordinary form
- [Karl Rubin, Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf), Chapter III, Theorem 5.16 and Corollary 5.17, p.53: for non-CM E good ordinary at p with p prime to the bad local torsion orders, Z_∞ is torsion and has no nonzero finite submodule (Greenberg)
- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17(i), p.26: the local terms relating imprimitive and primitive duals are torsion with no nontrivial pseudo-null submodules
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, p.3: Greenberg's argument shows the torsion dual X^Σ has no nonzero finite submodule, so its characteristic ideal equals its Fitting ideal

### The ordinary p-adic L-function with canonical periods

**Construction** `L0/canonical-ordinary-padic-l-function`. Planet: *Ordinary p-adic L-function*.

For an ordinary datum with trivial character and p ∤ N, let α be the unit root of X² − a_p X + p^{k−1} and Ω_f^± the canonical periods of f (generators of the saturated integral period lattices, defined up to O^× ∩ Q(f)). The ordinary p-adic L-function L_f ∈ Λ is the unique element such that for every finite-order character φ of Γ with φ(γ) = ζ a primitive p^{t−1}-th root of unity and every integer 0 ≤ m ≤ k − 2, φκ^m(L_f) = e(φκ^m)·p^{t'(m+1)} m! L(f, χ_φ^{-1}ω^{-m}, m+1) / ((−2πi)^{m+1} G(χ_φ^{-1}ω^{-m}) Ω_f^{sgn((−1)^m)}), with e the interpolation factor built from α, as in Skinner–Urban §1.1 with the correction in Skinner 2016, §2.4, footnote 6 (p.14). For a finite set Σ of primes not containing p, L_f^Σ := L_f · ∏_{ℓ∈Σ} P_{T,ℓ}(ℓ^{-1}γ_ℓ), where P_{T,ℓ} is Skinner–Urban's Euler polynomial of T at ℓ (the polynomial of their Lemma 3.2.17(ii), so that the same factor appears on the Selmer side) and γ_ℓ ∈ Γ is the image of Frob_ℓ. L_f lies in Λ (not only Λ[1/p]) because the canonical periods are integral normalisations. Here χ_φ is the primitive p-power-order Dirichlet character with χ_φ(1+p) = ζ⁻¹, p^{t′} is the conductor of ω^mχ_φ, κ is the cyclotomic character with κ(γ)=1+p, and G is the Gauss sum. For the weight-two multiplicative branch replace α by a_p = ±1 and use the multiplicative interpolation factor of Skinner §2.4; the trivial value has one factor 1−α⁻¹. The integral normalization is Skinner–Urban’s canonical normalization. Its identification with a particular saturated modular-symbol lattice and Kato good dual pair must retain any period scalar; the integral comparison is the explicit gap below. Write P_f^± := −2πi Ω_f^± for the corresponding differential/modular-symbol periods. If the modular-symbol supplier calls its periods Ω, first translate that notation to P_f; do not substitute P_f for the cohomological Ω_f in this formula.

**Hypotheses.**

- ordinary, p ∤ N, trivial character
- canonical periods as supplied by ModularSymbolsPadicLFunctions:L1/integral-period-lattices; a different choice changes L_f by an element of O^×
- the measure is the ordinary branch of ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure restricted to the cyclotomic Z_p-direction through the twist by ω^{-m}
- The coefficient lattice is the one compatible with the specified canonical normalization. If a supplier measure uses a different lattice, carry its scalar rather than infer it is an O-unit.

**Proof sketch / construction.**

1. Take the ordinary integral measure μ_{f,α} on Z_p^× of ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure with the period lattice normalisation of ModularSymbolsPadicLFunctions:L1/integral-period-lattices. Translate the supplier’s differential period P_f to Ω_f=P_f/(−2πi) before writing the interpolation formula.
2. Push it to Γ through the projection Z_p^× → 1 + pZ_p ≅ Γ after the appropriate Teichmüller twist; interpolation and uniqueness are ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness.
3. The Σ-depleted function is the primitive/imprimitive comparison ModularSymbolsPadicLFunctions:L4/primitive-imprimitive-level-change.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `ordinaryPadicL` | data | L_f ∈ Λ = O[[Γ]] for an ordinary datum with chosen canonical periods. |
| `ordinaryPadicL_interpolation` | characterisation | The interpolation formula of Skinner–Urban §1.1 at every φκ^m, 0 ≤ m ≤ k−2. Use exponent m+1 for Skinner–Urban’s cohomological Ω_f, or exponent m after replacing it by P_f=−2πiΩ_f. |
| `ordinaryPadicL_unique` | extensionality | An element of Λ satisfying the interpolation formula at infinitely many characters equals L_f. |
| `ordinaryPadicL_period_unit` | relation | Canonical periods are defined up to O^× ∩ Q(f); replacing them by other canonical periods replaces L_f by a unit multiple, so the ideal (L_f) ⊂ Λ is independent of that choice. |
| `ordinaryPadicL_depleted` | relation | L_f^Σ = L_f ∏_{ℓ∈Σ} P_{T,ℓ}(ℓ^{-1}γ_ℓ), and L_f^Σ ≠ 0 iff L_f ≠ 0 (each Euler factor is a nonzero element of Λ). |
| `ordinaryPadicL_extendCoefficients` | compatibility | For O ⊂ O', L_f computed over O' is the image of L_f under Λ → Λ_{O'}. |
| `ordinaryPadicL_ne_zero` | other | L_f ≠ 0 by the nonvanishing of the required critical twists (Rohrlich), supplied by KatoEulerSystems:L4/nonvanishing-of-the-zeta-submodule-at-height-zero. The value s=1 is central only in weight two. |

**Uses.**

- Skinner–Urban Theorem 3.6.4, p.43: (L_f^Σ) is the analytic side of the equality Ch^Σ = (L_f^Σ)
- Skinner, Theorem A proof, p.3: the congruence L_{f_m}^Σ ≡ L_f^Σ mod p^m across a Hida family
- ModularIwasawaMainConjectures:L3/msd-padic-l-function: the elliptic function with Néron periods is compared with L_{f_E}
- ModularIwasawaMainConjectures:L5/mu-lambda-comparison: μ(L_f) and λ(L_f) are the analytic invariants

**Unit tests.**

- `ordinaryPadicL_period_unit_ideal` (characterisation): In weight two only Ω_f^+ enters the interpolation formula (m = 0); replacing Ω_f^+ by uΩ_f^+ with u ∈ O^× replaces L_f by u^{-1}L_f and keeps the ideal, while replacing it by ϖΩ_f^+ replaces the ideal (L_f) by (ϖ^{-1}L_f), so the integral equality can hold for at most one of the two normalisations.
- `ordinaryPadicL_trivial_character_11a1` (computation): For E = 11a1 and p = 7, the trivial-character value of the Néron-normalised function is (1 − α^{-1})² L(E,1)/Ω_E^+ = (1 − α^{-1})²/5 with α ≡ −2 mod 7, a nonzero element of Z_7.
- `ordinaryPadicL_depleted_trivial_set` (degenerate): For Σ = ∅, L_f^Σ = L_f.
- `ordinaryPadicL_not_rational_only` (non-example): L_f is integral (in Λ), not merely in Λ[1/p]: using Shimura's transcendental periods without saturating the period lattice gives a function in Λ[1/p] whose ideal may differ from (L_f) by a power of ϖ.
- `ordinaryPadicL_period_conventions` (compatibility): Replacing Ω_f by P_f=−2πiΩ_f changes the denominator (−2πi)^{m+1}Ω_f to (−2πi)^m P_f, not to (−2πi)^{m+1}P_f. In weight two the Néron comparison uses P_f.

**Acceptance checks.**

- In weight two, changing Ω_f^+ by a unit u ∈ O^× multiplies L_f by u^{-1} and leaves the ideal (L_f) unchanged; changing it by ϖ changes (L_f) by ϖ^{-1}, so the integral equality of ModularIwasawaMainConjectures:L0/ordinary-main-conjecture is sensitive to the period normalisation.
- For E = 11a1 and p = 7 at the trivial character: L(E,1)/Ω_E^+ = 1/5, so the value of the Néron-normalised function at the trivial character is (1 − α^{-1})² · 1/5, a 7-adic unit times (1 − α^{-1})² (Colmez Remark 0.10 with b = 1).

**Direct prerequisites.** `ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`, `ModularSymbolsPadicLFunctions:L4/primitive-imprimitive-level-change`, `L0/modular-iwasawa-datum`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2: the Amice–Vélu–Vishik p-adic L-function L_f ∈ O_L[[Γ_Q]] with its interpolation formula, e(φ), the Gauss sum and the canonical periods Ω_f^±
- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Conjecture 3.5.5, p.41, with the Σ-imprimitive L_f^Σ of §3.4: the Σ-imprimitive L_f^Σ and the Iwasawa–Greenberg main conjecture in terms of it
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, p.1: L_f ∈ Λ_O interpolating normalised twisted special values; the canonical period Ω_f^+ well defined up to O^× ∩ Q(f)
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.4, pp.13–15: Canonical normalization, imprimitive functions and the multiplicative interpolation factor.
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.4, equation (2.4.1) and footnote 6, p.14: The denominator is (−2πi)^{m+1} Ω_f, correcting the exponent m in some Skinner–Urban formulas; modular-symbol periods there differ by −2πi.

### The Iwasawa–Greenberg main conjecture for an ordinary form

**Definition** `L0/ordinary-main-conjecture`. Planet: *Iwasawa–Greenberg main conjecture*.

For an ordinary datum D with trivial character and p ∤ N, and a finite set Σ of primes not containing p, IMC^Σ(D) is the proposition: X^Σ is a torsion Λ-module and char_Λ(X^Σ) = (L_f^Σ) as ideals of Λ. The rational form IMC^Σ_Q(D) asserts the same equality in Λ[1/p] = Λ ⊗_{Z_p} Q_p. For f = f_E it is Mazur's main conjecture in the normalisation of ModularIwasawaMainConjectures:L3/mazur-main-conjecture. The proposition is a statement, not an axiom: conditional consequences explicitly list it as an assumption (in particular Schneider’s leading-term implication).

**Hypotheses.**

- ordinary datum, trivial character, p ∤ N
- canonical periods fixed as in ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function
- the characteristic ideal is that of PadicMeasuresIwasawaAlgebras:L4 (charIdeal over the UFD Λ ≅ O[[X]])

**Proof sketch / construction.**

1. Form X^Σ (ModularIwasawaMainConjectures:L0/ordinary-selmer-dual) and L_f^Σ (ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function).
2. Use the characteristic ideal of PadicMeasuresIwasawaAlgebras:L4 §4.6; the rational form compares ideals after extension of scalars to Λ[1/p].
3. The integral statement is meaningful only after the period normalisation is fixed; Skinner–Urban §1.1 (p.2) note the characteristic ideal depends on T_f only through its ϖ-adic valuation, and not at all when ρ̄ is irreducible.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `IMC` | data | IMC^Σ(D) : Prop, the integral equality char_Λ(X^Σ) = (L_f^Σ) with X^Σ torsion. |
| `IMC_rational` | data | IMC^Σ_Q(D) : Prop, the same equality in Λ[1/p]. |
| `IMC.toRational` | relation | IMC^Σ(D) → IMC^Σ_Q(D). |
| `IMC.iff_of_sigma` | equivalence | IMC^Σ(D) ↔ IMC^{Σ'}(D) for finite Σ, Σ' not containing p. |
| `IMC.iff_extendCoefficients` | equivalence | IMC(D) ↔ IMC(D ⊗ O') for a finite extension O'/O. |
| `IMC.iff_divisibilities` | characterisation | For X^Σ finitely generated torsion and L_f^Σ integral and nonzero, IMC^Σ(D) ↔ (L_f^Σ) ⊂ char(X^Σ) ∧ char(X^Σ) ⊂ (L_f^Σ). Without the torsion hypothesis the right side is not a replacement for the definition. |
| `IMC.greenberg_instance` | compatibility | IMC_Q(D) is the case V = V_f ⊗ det^{-1} of the Greenberg proposition SelmerIwasawaCohomology:L4/greenberg-main-conjecture, with L_p(V) = L_f. |

**Uses.**

- Skinner–Urban Theorem 3.6.4, p.43: the conclusion of the theorem
- RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula: the integral equality is specialised at the trivial character
- ModularIwasawaMainConjectures:L5/rank-zero-converse: a nonzero Selmer corank is read off from (γ − 1) | char X
- HeegnerPointEulerSystems:HE.6/zhang-rank-zero-over-K: the Skinner–Urban form is applied to g and g_K

**Unit tests.**

- `IMC.rational_of_integral` (characterisation): IMC(D) implies IMC_Q(D). Algebraically (ϖ) and (1) become equal in Λ[1/p] but differ in Λ, so a definition identifying the rational and integral forms fails this test.
- `IMC.depends_on_periods` (non-example): Replacing the canonical period of a weight-two form by ϖ times it turns a true integral equality into a false one, while the rational statement IMC_Q is unchanged: the proposition must carry the period normalisation.
- `IMC.trivial_sigma` (degenerate): For Σ = ∅, IMC^Σ is the primitive statement char(X) = (L_f).
- `IMC.greenberg_compatibility` (compatibility): For V = V_f ⊗ det^{-1}, r_V = 0 and SelmerIwasawaCohomology:L4/greenberg-main-conjecture with L_p(V) = L_f is IMC_Q(D).

**Acceptance checks.**

- IMC^Σ(D) for one Σ is equivalent to IMC^{Σ'}(D) for every Σ' (ModularIwasawaMainConjectures:L5/euler-factor-change).
- IMC(D) implies IMC_Q(D); the converse holds when μ(X) = μ(L_f) (ModularIwasawaMainConjectures:L5/mu-lambda-comparison).

**Direct prerequisites.** `L0/ordinary-selmer-dual`, `L0/canonical-ordinary-padic-l-function`, `PadicMeasuresIwasawaAlgebras:L4`, `SelmerIwasawaCohomology:L4/greenberg-main-conjecture`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2 and Conjecture 3.5.5, p.41: the Iwasawa–Greenberg main conjecture Ch_{Q_∞}(f) = (L_f) in Λ_{Q,O_L} ⊗ Q_p, integrally when ρ_f is residually irreducible
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Conjecture 2.5.1, p.15: for every finite Σ ∋ p: X^Σ torsion and Ch^Σ = (L^Σ) in Λ ⊗ Q_p, and in Λ if ρ̄_f is irreducible
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71; Appendix B.2.3, Theorem B.4, p.80: the Greenberg form of the main conjecture and its modular-form instance L^{alg}_p(f) = (L^{an}_p(f)) over Λ(Z_p^×)

### Iwasawa cohomology, the zeta element and the fundamental line

**Construction** `L0/iwasawa-fundamental-line`. Planet: *Iwasawa fundamental line*.

For a modular Iwasawa datum with the lattice T_K in Kato's normalisation (the dictionary of KatoEulerSystems:L2/hecke-dual-twist-dictionary), put H^i(T_K) := lim_n H^i_et(Z[ζ_{p^n}, 1/p], j_*T_K) for i = 1, 2, Λ(G_∞)-modules, and RΓ_Iw(T_K) the corresponding perfect complex of Λ(G_∞)-modules with j_* conditions (extension by zero is not used; ramified primes keep the j_* condition). The Iwasawa fundamental line is the invertible Λ(G_∞)-module Δ_Iw(T_K) := Det^{-1}_{Λ(G_∞)} RΓ_Iw(T_K) ⊗ Det^{-1}_{Λ(G_∞)} (T_K ⊗ Λ(G_∞))(−1)^+, and Kato's zeta element z_f ∈ H¹(T_K) ⊗ Q (KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index, the Λ-module Z(f, T_K) generated by Kato's zeta elements) defines, through the zeta morphism T_K(−1)^+ → H¹, a trivialisation triv_z : Δ_Iw(T_K) ⊗ Frac → Q(Λ(G_∞)). The same construction over Q_∞ (Λ in place of Λ(G_∞)) gives Δ_Iw over Λ = O[[Γ]], the form used by Fouquet–Wan. Here Q(Λ(G_∞)) denotes the total quotient ring, a product of fraction fields of the η-components, not a field. The primitive j_* complex is used only with its perfectness and local comparison hypotheses. For general family coefficients use Fouquet–Wan Definition 3.18’s modified local factors, not an unconditional j_* complex.

**Hypotheses.**

- p odd
- H¹(T_K) torsion-free of Λ-rank one and H²(T_K) torsion (Kato Theorem 12.4) are theorems, used to identify the determinant with an invertible fractional ideal
- the {p}-partial complex over Z[1/p] is the one in Kato's Conjecture 12.10; the Σ-partial complex over Z[1/Σ] is used in families and changes Δ by Euler factors
- The j_* / continuous comparison is only the supported comparison in the indicated degrees; do not infer a complex equivalence from the H¹ edge sequence alone.

**Proof sketch / construction.**

1. Iwasawa cohomology and its finiteness are SelmerIwasawaCohomology:L3/iwasawa-cohomology and SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler; the étale/continuous comparison is SelmerIwasawaCohomology:L3/etale-iwasawa-comparison.
2. The determinant functor and the height-one divisor of an acyclic-after-Frac perfect complex are PadicMeasuresIwasawaAlgebras:L5 §5.1 and SelmerIwasawaCohomology:L3/selmer-determinant.
3. The zeta morphism is Kato's (KatoEulerSystems:L2/rational-kato-zeta-morphism and, over deformation rings, KatoEulerSystems:L2/nakamura-twisted-zeta-morphism); Fouquet–Wan Definition 3.3 and Theorem 3.4 record it as the {p}-partial zeta morphism z(f)_Iw.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `iwasawaH1` | data | H¹(T_K) = lim_n H¹_et(Z[ζ_{p^n},1/p], j_*T_K) as a Λ(G_∞)-module. |
| `iwasawaH2` | data | H²(T_K), a torsion Λ(G_∞)-module. |
| `fundamentalLine` | data | Δ_Iw(T_K), an invertible Λ(G_∞)-module. |
| `fundamentalLine.triv` | projection | triv_z : Δ_Iw(T_K) → Q(Λ(G_∞)) induced by the zeta morphism. |
| `fundamentalLine.changeLattice` | functoriality | A finite-index inclusion T'_K ⊂ T_K induces Δ_Iw(T'_K) ≅ Δ_Iw(T_K) compatible with triv_z. |
| `fundamentalLine.baseChange` | functoriality | For a perfect complex C, det(C) ⊗ S ≅ det(C ⊗^L S) for every ring map. Identifying the latter complex and zeta map with the specialised arithmetic objects is additional: Σ-partial objects commute with the stated derived base changes; the primitive modified line requires relative purity and Iwasawa suitability (Fouquet–Wan Proposition 3.20, pp.31–32; Propositions 3.22–3.23, p.33). |
| `fundamentalLine.divisor` | characterisation | div(triv_z(Δ_Iw)) = Σ_𝔭 (length H²_𝔭 − length (H¹/Λz)_𝔭)[𝔭] over height-one primes 𝔭. |
| `fundamentalLine.sigmaPartial` | relation | Retain both the local determinant factors and the zeta factors. For primitive versus Σ-partial zeta maps, Proposition 3.28, p.35 gives z_primitive = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V^*(1)))⁻¹ z_Σ in the total fraction algebra. These factors need not be units; integral comparison uses their compatible local lines. |

**Uses.**

- Fouquet–Wan Conjecture 1.5, p.6: the cohomological main conjecture asks triv_z to be an isomorphism Δ_Iw ≅ Λ_Iw
- Fouquet–Wan Theorem 1.8, p.8: the universal-family statement is the same isomorphism over Λ ≅ O[[X1,X2,X3]]
- ModularIwasawaMainConjectures:L4/family-specialization-corrections: specialisation of Δ along arithmetic points
- HeegnerPointEulerSystems:HE.8/determinantal-heegner-element: the determinant/characteristic dictionary of HE.7s's request to L0

**Unit tests.**

- `fundamentalLine.divisor_free_rank_one` (computation): If H¹ = Λ·z' with z = (γ − 1)z' and H² ≅ Λ/(γ − 1), the divisor of triv_z(Δ_Iw) is zero, i.e. triv_z is an isomorphism.
- `fundamentalLine.degenerate_unit_zeta` (degenerate): If z generates H¹ and H² = 0, then triv_z(Δ_Iw) = Λ.
- `fundamentalLine.sign_convention` (non-example): With Det in place of Det^{-1} the divisor changes sign: a definition using Det would make Kato's divisibility read in the wrong direction.
- `fundamentalLine.compat_SIC` (compatibility): For cohomology in degrees one and two the divisor equals char H² / char(H¹/Λz) as in SelmerIwasawaCohomology:L3/selmer-determinant.

**Acceptance checks.**

- When H¹(T_K) is free of rank one and H²(T_K) is torsion, the divisor of triv_z(Δ_Iw) is char(H²) − char(H¹/Λz) (SelmerIwasawaCohomology:L3/selmer-determinant with the inverse-determinant sign convention).
- Replacing T_K by an isogenous lattice changes neither Δ_Iw ⊗ Frac nor triv_z (Fouquet–Wan p.5: the fundamental line is independent of the lattice up to canonical isomorphism).

**Direct prerequisites.** `SelmerIwasawaCohomology:L3/iwasawa-cohomology`, `SelmerIwasawaCohomology:L3/iwasawa-finiteness-euler`, `SelmerIwasawaCohomology:L3/etale-iwasawa-comparison`, `SelmerIwasawaCohomology:L3/selmer-determinant`, `PadicMeasuresIwasawaAlgebras:L5`, `KatoEulerSystems:L2/integral-zeta-submodule-and-finite-index`, `KatoEulerSystems:L2/rational-kato-zeta-morphism`, `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `L0/modular-iwasawa-datum`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5: the Λ_Iw-adic fundamental line Det^{-1}RΓ_et(Z[1/p], T ⊗ Λ_Iw) ⊗ Det^{-1}(T ⊗ Λ_Iw)(−1)^+ and its independence of T
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, and Theorem 3.4, p.24: S-partial zeta morphisms Z_Iw : T(f)_Iw(−1)^+ → H¹(Z[1/S], T(f)_Iw), existence by Kato 12.5
- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §12.10, pp.223–224: H¹ and H² as limits over Z[ζ_{p^n}, 1/p] with j_*, and the Λ-module Z(f, T) of zeta elements

### Kato's main conjecture for modular forms

**Definition** `L0/kato-main-conjecture`. Planet: *Kato's main conjecture*.

For a modular Iwasawa datum with lattice T_K in Kato's normalisation and a character η of Δ, KMC^η(T_K) is the proposition: the η-component of the zeta module Z(f, T_K) lies in H¹(T_K)^η and char_{Λ}(H¹(T_K)^η / Z(f, T_K)^η) = char_{Λ}(H²(T_K)^η). KMC(T_K) is the conjunction over η, equivalently (when H¹ is free of rank one) the assertion that the zeta morphism trivialises Δ_Iw(T_K): triv_z(Δ_Iw(T_K)) = Λ(G_∞). The rational form KMC_Q compares the ideals in Λ[1/p]. Over Q_∞ (η = 1 and Λ = O[[Γ]]) this is Fouquet–Wan's Conjecture 1.5 for M(f).

**Hypotheses.**

- p odd; for p = 2 Kato's statement excludes height-one primes containing 2
- trivial or arbitrary nebentypus: the definition does not need ε = 1
- no reduction type at p is assumed: the proposition makes sense for supercuspidal π(f)_p

**Proof sketch / construction.**

1. State the equality using the Λ-modules of ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line and the characteristic ideal of PadicMeasuresIwasawaAlgebras:L4 on η-components (the isotypic decomposition of PadicMeasuresIwasawaAlgebras:L4 §4.6).
2. The equivalence with the fundamental-line form is ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `KMC` | data | KMC^η(T_K) : Prop for η ∈ Δ^∨; KMC(T_K) := ∀ η, KMC^η(T_K). |
| `KMC_rational` | data | The equality of ideals in Λ[1/p]. |
| `KMC.iff_triv` | equivalence | When H¹(T_K) is free of rank one: KMC(T_K) ↔ triv_z(Δ_Iw(T_K)) = Λ(G_∞). |
| `KMC.iff_reverse_divisibility` | characterisation | Under Kato's (12.5.2), KMC^η ↔ char(H²)^η ⊂ char(H¹/Z)^η. |
| `KMC.changeLattice` | relation | KMC_Q is independent of the lattice; KMC is independent of the lattice when ρ̄ is irreducible. |
| `KMC.fw_form` | compatibility | The η = 1 component over Q_∞ is Fouquet–Wan Conjecture 1.5 under the dictionary ModularIwasawaMainConjectures:L2/fw-convention-dictionary. |

**Uses.**

- Fouquet–Wan Theorems 1.6–1.7, pp.6–7: their conclusion
- LLZ Corollary 6.6, p.44: equivalent to the signed main conjecture
- Kato §17.13, pp.279–280: implies the ordinary main conjecture 17.6
- ModularIwasawaMainConjectures:L5/rank-zero-converse: Fouquet–Wan Corollary 5.3 reads Selmer corank from KMC

**Unit tests.**

- `KMC.iff_triv_example` (computation): If H¹ = Λz' and Z = Λ(γ−1)z', then KMC holds iff char H² = (γ − 1).
- `KMC.rational_of_integral` (characterisation): KMC(T_K) → KMC_Q(T_K), and the converse fails in general: the rational form says nothing about μ.
- `KMC.not_stronger_conjecture` (non-example): KMC predicts nothing about the specialisation of z at the finitely many characters where the L-value vanishes (Fouquet–Wan footnote 1, p.6); it is not Fouquet–Wan's Conjecture 1.3.
- `KMC.degenerate_trivial` (degenerate): If H² = 0 and Z = H¹, KMC holds with both characteristic ideals equal to Λ.

**Acceptance checks.**

- Kato Theorem 12.5 gives the inclusion char(H¹/Z) ⊂ char(H²) under (12.5.2) (KatoEulerSystems:L4/cohomological-divisibility-one-direction), so KMC is the reverse divisibility.
- LLZ Remark 6.3: the η-component formulation is Kobayashi's §5 form of Kato's Conjecture 12.10.

**Direct prerequisites.** `L0/iwasawa-fundamental-line`, `PadicMeasuresIwasawaAlgebras:L4`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`.

**Sources.**

- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), Conjecture 12.10, pp.223–224: for every height-one prime the length of H²(T)_𝔭 equals that of (H¹(T)/Z(f,T))_𝔭, with Z(f,T) ⊂ H¹(T)
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6, and Conjecture 3.24, p.34: z(f)_Iw is a basis of Δ(M(f))_Iw, equivalently char H² = char(H¹/Λz)
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Conjecture 6.2 and Remark 6.3, p.43: the η-component form Z(T_f)^η ⊂ H¹(T_f)^η and char(H¹/Z)^η = char(H²)^η

### Zeta basis versus characteristic ideals

**Theorem** `L0/zeta-basis-characteristic-equivalence`.

Let λ be an Iwasawa-suitable classical specialisation in the sense of Fouquet–Wan Definition 3.12 (in particular ρ̄ satisfies their Assumption 2.1 and there is ℓ ∥ N, ℓ ≠ p, with dim ρ̄^{I_ℓ} = 1). Then H¹(T_λ,Iw) is free of rank one over O_Iw, the integral cone C of z(λ)_Iw has cohomology H¹/z in degree one and H² in degree two, while C ⊗ Frac(O_Iw) is acyclic (V_λ,Iw in Lemma 3.13 already denotes fraction-field coefficients), and consequently: z(λ)_Iw is a basis of Δ_Iw(T_λ) iff char H²(T_λ,Iw) = char(H¹(T_λ,Iw)/O_Iw·z(λ)_Iw). Moreover Kato's divisibility char(H¹/z) ⊂ char(H²) holds integrally for such λ.

**Hypotheses.**

- Fouquet–Wan Assumption 2.1 (ρ̄|G_{Q(√p*)} absolutely irreducible; no extension 0 → χ₁ → ρ̄|G_{Q_p} → χ₂ → 0 with χ₁^{-1}χ₂ ∈ {1, χ̄_cyc}) and Assumption 3.7
- λ Iwasawa-suitable: T_λ and T_λ*(1) relatively pure, z(ψ)_Iw nonzero for a contained O-valued specialisation
- For the integral Euler-system bound, retain the genuine unipotent inertia lift supplied by the auxiliary Steinberg prime; residual unipotence alone is insufficient (source issue E4).

**Proof sketch / construction.**

1. H¹ is torsion-free by vanishing of H⁰ of the reductions modulo regular sequences (Assumption 2.1), of depth two, hence free of rank one by Auslander–Buchsbaum–Serre (Fouquet–Wan Lemma 3.13).
2. At the auxiliary Steinberg prime choose an actual inertia element σ acting unipotently on the characteristic-zero lattice and nontrivially modulo ϖ; then T_λ/(σ − 1)T_λ is free of rank one. An arbitrary lift of a residual unipotent does not suffice; this verifies Kato's hypotheses in place of the SL₂(Z_p)-image condition (ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient), giving the integral divisibility and torsion of H².
3. With cohomology in degrees one and two only, the determinant of the cone is computed by ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line's divisor formula.

**Acceptance checks.**

- For E = 14a1 at p = 13, ℓ = 2: ord_2 Δ = 6 is prime to 13, so ρ̄ is ramified at 2 with unipotent inertia image, dim ρ̄^{I_2} = 1, and the theorem applies.
- The equivalence fails to make sense without freeness of H¹: if H¹ had torsion, Λ·z would not determine the line.

**Direct prerequisites.** `L0/iwasawa-fundamental-line`, `L1/unipotent-rank-one-quotient`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`, `SelmerIwasawaCohomology:L3/selmer-determinant`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Lemma 3.13 and its proof, pp.26–27: for an Iwasawa-suitable specialisation H¹ is free of rank one, the cone of the zeta morphism is acyclic after Frac with H¹/z and H² as cohomology, and Kato's Theorem 0.8 hypotheses hold by a unipotent element
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Definitions 3.8, 3.9, 3.12, Proposition 3.10, Lemma 3.11, pp.25–26: Euler factors, relative purity and Iwasawa-suitable specialisations
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Conjecture 1.5, p.6: the equivalence of the basis and characteristic-ideal forms

### Kato's main conjecture versus the ordinary main conjecture

**Theorem** `L0/ordinary-cohomological-comparison`.

Let D be an ordinary datum with trivial character, p ∤ N, p odd, with α the unit root, and let L_{p-adic,α,ω,γ}(f) be Kato's p-adic zeta function for a good pair (ω, γ) for the dual lattice. For every height-one prime 𝔭 of Λ not containing p there is an exact sequence of Λ_𝔭-modules 0 → (H¹/Z)_𝔭 → (H¹_loc/H¹_loc')_𝔭/(image of Z) → X_𝔭 → H²_𝔭 → 0 (Kato (17.13.1) localised), whose middle term has length ord_𝔭(L_{p-adic,α,ω,γ}(f)) by the Coleman map; hence length(X_𝔭) = ord_𝔭(L_{p-adic}) iff length(H²_𝔭) = length((H¹/Z)_𝔭). If in addition ρ̄ has a unipotent element with free rank-one coinvariants (or Kato's (12.5.2)) and p ≠ 2, the same holds at 𝔭 = (ϖ). Consequently KMC(T_K), on the η-component matched with D by Kato's twist T ↦ T(k) in (17.13.1), is equivalent to IMC(D), and KMC_Q to IMC_Q, once L_{p-adic,α,ω,γ}(f) is identified with L_f for the canonical periods (ModularIwasawaMainConjectures:L1/fw-ordinary-selmer-form for the integral identification).

**Hypotheses.**

- ordinary at p, p ∤ N, p odd
- (ω, γ) good for the dual lattice in Kato's sense (17.5), so Kato's p-adic L-function is integral
- at the height-one prime (ϖ): Kato's (12.5.2) or the rank-one unipotent substitute of Skinner §2.5 and Fouquet–Wan Lemma 3.13
- Euler and Tamagawa corrections: the sequence uses j_* conditions away from p and the Coleman image at p; no correction is discarded
- For the conclusion involving canonical L_f integrally, separately assume the O-unit period comparison of L1/fw-ordinary-selmer-form. The exact-sequence length identity itself uses Kato’s specified analytic term.

**Proof sketch / construction.**

1. Take the limit of the Poitou–Tate sequences for T(r) over Q(ζ_{p^n}) (SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate, SelmerIwasawaCohomology:L3/iwasawa-selmer-duality) to get Kato (17.13.1).
2. Show lim H¹_c of the strict condition vanishes (17.13.2) because the image of Z already has Λ-rank one, identify the local quotient with the Coleman map image (17.9; PadicHodgeRegulators:L3/rubin-coleman-map) and use finiteness of H²_loc (17.13.4).
3. Kato's explicit reciprocity (KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements) identifies the Coleman image of z with L_{p-adic,α,ω,γ}(f).
4. Compare lengths at each height-one prime; both directions of the equivalence follow from the additivity of length in the four-term sequence.

**Acceptance checks.**

- Kato 17.13 derives Theorem 17.4(2)–(3) from Theorem 12.5 by this sequence, and remarks (p.274) that Conjecture 12.10 implies the ordinary main conjecture 17.6; the length identity gives the converse as well.
- Fouquet–Wan Lemma 4.50 is the analogous equivalence with the signed or v^∨-Selmer group in place of X.

**Direct prerequisites.** `L0/kato-main-conjecture`, `L0/ordinary-main-conjecture`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `SelmerIwasawaCohomology:L3/iwasawa-selmer-duality`, `PadicHodgeRegulators:L3/rubin-coleman-map`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `L1/unipotent-rank-one-quotient`.

**Sources.**

- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), §17.13, pp.279–280: the exact sequence (17.13.1), the vanishing (17.13.2), the local identification (17.13.3) via 17.9 and finiteness (17.13.4), and the resulting length comparison at each height-one prime
- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.6, p.274: the ordinary main conjecture and the statement that Conjecture 12.10 implies it
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16: Kato's (*) can be replaced by irreducibility of ρ̄ and an element g with T/(g − 1)T free of rank one, supplied by a ramified q ∥ N
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Lemma 4.50, p.65: Conjecture 1.5 is equivalent to an equality of a local-image ideal with the characteristic ideal of a Selmer group, by Poitou–Tate as in Kobayashi's Theorem 7.4

### Signed Selmer groups from Coleman maps

**Construction** `L0/signed-selmer-dual`.

Let D be a datum with p ∤ N whose local representation at p is crystalline, and fix a good basis ν₁, ν₂ of D_cris and its lift n₁, n₂ to the Wach module (LLZ §3.3, Lemma 3.15), giving Coleman maps Col_i : H¹_Iw(Q_p, T_K) → Λ_E(G_∞), i = 1, 2 (PadicHodgeRegulators:L4/signed-local-condition). For n ≥ 0 let H¹_f(Q_{p,n}, A^*)_i be the orthogonal complement, under the local Tate pairing between H¹(Q_{p,n}, T_K) and H¹(Q_{p,n}, A^*), of the image of ker(Col_i) in H¹(Q_{p,n}, T_K); here A^* is the discrete module paired with T_K in LLZ's Definition 6.4. The i-th signed Selmer group is Sel^i(Q(μ_{p^∞}), A^*) := lim_n ker(Sel(Q(μ_{p^n}), A^*) → H¹(Q_{p,n}, A^*)/H¹_f(Q_{p,n}, A^*)_i), with Bloch–Kato conditions away from p, and X^i := its Pontryagin dual, a finitely generated Λ(G_∞)-module.

**Hypotheses.**

- p ∤ N, V_f|G_{Q_p} crystalline with the Wach-module basis fixed; the groups depend on that basis
- for supersingular f LLZ's assumption (A) (k ≥ 3 or a_p = 0) and for good ordinary f assumption (A') (k ≥ 3 and V_f not locally split) are needed for cotorsion, not for the definition

**Proof sketch / construction.**

1. The local condition on H¹_Iw(Q_p, T_K) is PadicHodgeRegulators:L4/signed-local-condition (the kernel of Col_j for the chosen good Wach basis, PadicHodgeRegulators:L4/good-wach-basis); its orthogonal complement at each finite layer is SelmerIwasawaCohomology:L1/orthogonal-complement.
2. Glue with the Bloch–Kato conditions away from p (SelmerIwasawaCohomology:L2/selmer-data) and take the direct limit; finite generation of the dual as for ModularIwasawaMainConjectures:L0/ordinary-selmer-dual.
3. The Poitou–Tate sequence H¹(T_K) → Im(Col_i) → X^i → H²(T_K) → 0 (LLZ (60)) records how X^i sits between Kato's modules.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `SignedSelmer.localCondition` | data | H¹_f(Q_{p,n}, A^*)_i, the annihilator of ker(Col_i) at level n. |
| `SignedSelmer.dual` | data | X^i, the Pontryagin dual of Sel^i, a finitely generated Λ(G_∞)-module. |
| `SignedSelmer.poitouTate` | relation | The exact sequence H¹(T_K) → Im(Col_i) → X^i → H²(T_K) → 0, injective on the left when X^i is torsion. |
| `SignedSelmer.changeBasis` | functoriality | For actual target basis b′ = b B, Col′ = B⁻¹Col in column convention, and the new signed groups use the new coordinate kernels. A general Wach basis change requires computing its induced Λ-coordinate matrix first. |
| `SignedSelmer.etaComponent` | relation | η-components X^{i,η} for η ∈ Δ^∨ over Λ. |
| `SignedSelmer.ordinary_case` | relation | For good ordinary f with the basis of LLZ §3.6, the relation (3) of LLZ p.6 gives L̃_{p,α} = ū·L̃_{p,2} with ū ∈ Λ_E(G_∞)^×, so the second Coleman map carries Kato's class to the unit-root p-adic L-function up to a unit. |

**Uses.**

- LLZ Theorem 6.5 and Corollary 6.6, pp.43–44: cotorsion and the signed reformulation of Kato's main conjecture
- RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture: Kobayashi's ± Selmer groups are the a_p = 0 case
- PadicHodgeRegulators:L4/signed-local-condition: the local condition exported there is completed to a global Selmer group here

**Unit tests.**

- `SignedSelmer.depends_on_basis` (non-example): Choose two actual Coleman coordinate systems with Col′₁ = Col₁ and Col′₂ = Col₂ − Col₁. For independent coordinate maps, the second kernels differ, so signed groups must retain their coordinate choice. This is an explicit constant Λ-coordinate transformation, not a formula for arbitrary Wach matrices.
- `SignedSelmer.kobayashi_14a1_p5` (computation): For E = 14a1 and p = 5 (a_5 = 0), the two signed Selmer groups for the basis of LLZ Proposition 5.10 are Kobayashi's Sel^−(E/Q_∞) and Sel^+(E/Q_∞).
- `SignedSelmer.trivial_kernel` (degenerate): In the displayed kernel construction, if ker Col_i = 0 then its annihilator is all local H¹ and the extra restriction is void: the result is the starting Bloch–Kato Selmer group. A construction starting from H¹ with only away-p conditions would instead give the relaxed-at-p group; these two starting objects must not be confused.

**Acceptance checks.**

- For a change b′ = b B of the actual good Λ-basis of (φ*N(T))^(ψ=0), the coordinate column changes by B⁻¹. A Wach-module change U first induces a change through φ and the Mellin comparison; its matrix must not be substituted for B without proof.
- For a_p = 0 and the basis of LLZ Proposition 5.10, X^1 and X^2 are Kobayashi's minus and plus Selmer duals (ModularIwasawaMainConjectures:L4/kobayashi-pollack-comparison).

**Direct prerequisites.** `PadicHodgeRegulators:L4/signed-local-condition`, `PadicHodgeRegulators:L4/good-wach-basis`, `SelmerIwasawaCohomology:L1/orthogonal-complement`, `SelmerIwasawaCohomology:L2/selmer-data`, `L0/modular-iwasawa-datum`, `L0/iwasawa-fundamental-line`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), §6.2, Definition 6.4 and sequence (60), p.43: the p-Selmer group, the local conditions H¹_f(Q_{p,n}, V_f/T_f(1))_i as annihilators of ker(Col_i), the signed Selmer groups Sel^i_p(f/Q_∞) and the Poitou–Tate sequence
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), §3.3, assumptions (A)–(D), p.14: the good basis of D_cris, its Wach-module lift, and the hypotheses on k, a_p and p

### The signed main conjecture with the Coleman-image term

**Definition** `L0/signed-main-conjecture`. Planet: *Signed main conjecture*.

For the data of ModularIwasawaMainConjectures:L0/signed-selmer-dual, put L̃_{p,i} := Col_i(loc_p z_Kato) ∈ Λ_E(G_∞). The i-th signed main conjecture SMC^{i,η} is the proposition: X^{i,η} is Λ-torsion and char_Λ(X^{i,η}) = char_Λ(Im(Col_i)^η / Λ·L̃^η_{p,i}). Only when Im(Col_i)^η is computed to be Λ (or Λ_E rationally) does it simplify to char(X^{i,η}) = (L̃^η_{p,i}).

**Hypotheses.**

- the Coleman-image correction is part of the statement; replacing it by the principal ideal (L̃_{p,i}) is a separate theorem (ModularIwasawaMainConjectures:L4/llz-basis-adjusted-simplification)
- L̃_{p,i} depends on the Wach basis; it is related to the unbounded refined functions L̃_{p,α}, L̃_{p,β} by the logarithm matrix M of LLZ Theorem 3.25 (PadicHodgeRegulators:L4/logarithmic-matrix)
- Fix the integral Coleman domain and its actual finitely generated Λ-lattice I_i = Im Col_i inside Λ_E. For an integral statement require Z(f,T_K) ⊂ H¹(T_K), L̃_{p,i} ∈ I_i and L̃_{p,i}^η ≠ 0. The quotient I_i^η/Λ L̃^η is then a finitely generated torsion Λ-module even if I_i is fractional.

**Proof sketch / construction.**

1. Form X^{i,η} and the Λ-submodule Im(Col_i)^η ⊂ Λ_E(G_∞)^η; the quotient by L̃^η_{p,i} is torsion when L̃^η_{p,i} ≠ 0 (LLZ Corollary 3.29, Proposition 3.39).
2. Take char_Λ of the actual fractional-lattice quotient, retaining its integral Λ-module structure. LLZ Remark 6.7 does not force inversion of p: a fractional embedding of a finitely generated lattice does not change its coefficient ring. The rational version separately tensors both modules with E.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `SMC` | data | SMC^{i,η} : Prop, the equality with the Coleman-image term. |
| `SMC_rational` | data | The same equality over Λ_E(G_∞) ⊗ Q. |
| `SMC.of_image_eq_top` | relation | If Im(Col_i)^η = Λ then SMC^{i,η} ↔ char(X^{i,η}) = (L̃^η_{p,i}). |
| `SMC.changeBasis` | functoriality | Whenever each chosen integral good basis and index satisfies the torsion, nonvanishing and exact-sequence hypotheses of signed-cohomological-comparison, its corrected image-quotient assertion is equivalent to KMC. An arbitrary basis or index outside that range has no such asserted equivalence. |
| `SMC.kobayashi_form` | compatibility | At a_p = 0 and weight two, the LLZ maps have the Kobayashi kernels (1 = minus, 2 = plus). Translating analytic ideals uses the explicit Coleman images and period scalars. Proposition 5.10/Corollary 5.11 give rational unit comparisons; an integral equality of Pollack ideals also requires an integral unit normalization. |

**Uses.**

- LLZ Corollaries 6.6 and 6.8, p.44: the signed reformulation
- RankZeroOneBSD:BSD.0 request to L4: Kobayashi/Pollack signed formulation consumed by BSD.6a/bstw-signed-main-conjecture
- ModularIwasawaMainConjectures:L4/llz-signed-main-conjecture: the theorem proved in L4

**Unit tests.**

- `SMC.image_correction_needed` (non-example): For a basis with Im(Col_2) = (Σ δ_i)Λ + (γ − 1)Λ ≠ Λ (LLZ Proposition 5.21 for elliptic curves with a_p = 0), the principal-ideal statement char(X²) = (L̃_{p,2}) differs from SMC² by the nontrivial factor char(Λ/Im Col_2).
- `SMC.degenerate_full_image` (degenerate): If Im(Col_i) = Λ, SMC^i is the principal-ideal statement.
- `SMC.ordinary_specialisation` (compatibility): For good ordinary f with LLZ's §3.6 basis, (L̃_{p,2}) = (L̃_{p,α}) as ideals of Λ_E(G_∞), because ū is a unit (LLZ (3), p.6); the analytic term of SMC² is therefore the unit-root p-adic L-function.

**Acceptance checks.**

- If Im(Col_i)^η = Λ, the proposition reads char(X^{i,η}) = (L̃^η_{p,i}).
- At a_p = 0 and weight two, the LLZ maps have the Kobayashi kernels (1 = minus, 2 = plus). Translating analytic ideals uses the explicit Coleman images and period scalars. Proposition 5.10/Corollary 5.11 give rational unit comparisons; an integral equality of Pollack ideals also requires an integral unit normalization.

**Direct prerequisites.** `L0/signed-selmer-dual`, `PadicHodgeRegulators:L4/actual-coleman-image`, `PadicHodgeRegulators:L4/logarithmic-matrix`, `PadicMeasuresIwasawaAlgebras:L4`, `L0/iwasawa-fundamental-line`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44: Kato's main conjecture is equivalent to Char(Sel^i_p(f/Q_∞)^{∨,η}) = Char(Im(Col_i)^η/(L̃^η_{p,i}))
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Theorem 1.3 (= Theorem 3.25), p.5, and Remark 6.7, p.44: L̃_{p,i} = Col_i(z_Kato), the logarithm-matrix relation with L̃_{p,α}, L̃_{p,β}, and the possibility that Im(Col_i) is not in Λ_{O_E}

### The signed reformulation of Kato's main conjecture

**Theorem** `L0/signed-cohomological-comparison`.

Assume LLZ's (A) if f is supersingular at p, or (A') if f is good ordinary, and (E): some basis of T_f has image of Gal(Q̄/Q(μ_{p^∞})) containing SL₂(Z_p). Then for each η ∈ Δ^∨ (with i = 1 for every η and i = 2 for η trivial): X^{i,η} is Λ-torsion, there is an exact sequence 0 → (H¹/Z)^η → (Im(Col_i)/L̃_{p,i})^η → X^{i,η} → H²^η → 0, and KMC^η(T_K) ⟺ SMC^{i,η}. Without (E) the same holds rationally, and the divisibility ϖ^{n_i}L̃^η_{p,i} ∈ char(X^{i,η}) holds for some n_i ≥ 0.

**Hypotheses.**

- (A) for supersingular f: k ≥ 3 or a_p = 0; (A') for good ordinary f: k ≥ 3 and V_f not locally split at p
- (E) for the integral statement; the unipotent substitute of ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient supplies Kato's integral inputs but the equivalence as printed uses (E)
- the η-restriction for i = 2 is LLZ's

**Proof sketch / construction.**

1. L̃^η_{p,i} ≠ 0 under (A) or (A') (LLZ Corollary 3.29, Proposition 3.39), so the cokernel of H¹(T_K) → Im(Col_i) is torsion; with H² torsion (Kato) X^i is torsion.
2. As in Kobayashi Theorem 7.3, the first map of (60) is injective, giving (61); taking characteristic ideals in the four-term sequence gives the equivalence (LLZ Corollary 6.6).
3. Kato's divisibility Theorem 6.1(d)–(e) (KatoEulerSystems:L4/cohomological-divisibility-one-direction) gives the divisibility in Theorem 6.5.

**Acceptance checks.**

- For E = 14a1 at p = 5: a_5 = 0 gives (A); the mod-5 representation is surjective (5 is not among the nonmaximal primes 2, 3 of 14a1), hence the 5-adic image is GL₂(Z_5) and (E) holds.
- The comparison is Kato-side; it proves no divisibility by itself.

**Direct prerequisites.** `L0/kato-main-conjecture`, `L0/signed-main-conjecture`, `L0/signed-selmer-dual`, `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `SelmerIwasawaCohomology:L2/selmer-structure-poitou-tate`, `PadicHodgeRegulators:L3/explicit-reciprocity`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Theorem 6.1, Theorem 6.5 and its proof, Corollary 6.6, pp.43–44: Kato's results restated, cotorsion and the ϖ^{n_i} divisibility, the sequence (61) and the equivalence of Kato's main conjecture with the signed statement under (A)/(A') and (E)
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Corollary 3.29, p.20, and Proposition 3.39, p.22: nonvanishing of L̃_{p,i} under (A), respectively (A')

## L1. Ordinary theorems

Keep Skinner–Urban, Fouquet–Wan ordinary and Skinner multiplicative hypotheses distinct. The FW proof route is its §4.8 GU(3,1)/Beilinson–Flach route; no canonical/Gross period comparison is silently inserted.

### Residual hypotheses of the main theorems

**Definition** `L1/residual-hypothesis-predicates`.

For a two-dimensional representation ρ̄ : G_Q → GL_F(W) over a finite field F of characteristic p > 2, with decomposition and inertia groups D_ℓ ⊃ I_ℓ at each prime ℓ, define the following predicates. (irred): W has no G_Q-stable line. (dist) at p: ρ̄|D_p has a D_p-stable line on which D_p acts by χ̄₁ with quotient χ̄₂ and χ̄₁ ≠ χ̄₂. (SU_q): q ≠ p, q ∥ N and ρ̄(I_q) ≠ 1. (FW1.6_ℓ), in Fouquet–Wan's cohomological normalisation (det ρ̄ = χ̄_cyc^{1−k}): ℓ ≠ p, ℓ ∥ N, dim_F W^{I_ℓ} = 1 and dim_F W^{D_ℓ} = 0. (FWexp_ℓ(μ)): ℓ ≠ p and ρ̄|D_ℓ is a nonsplit extension 0 → μχ̄_cyc^{1−k/2} → ρ̄|D_ℓ → μχ̄_cyc^{−k/2} → 0 with μ unramified quadratic or trivial and ρ̄(I_ℓ) ≠ 1. (LocExc_p): there is no character χ̄ of D_p with (ρ̄|D_p)^{ss} ≅ χ̄ ⊕ χ̄χ̄_cyc. (ScalarExc_p): there is no χ̄ with (ρ̄|D_p)^{ss} ≅ χ̄ ⊕ χ̄. (Im): there is σ ∈ G_{Q(μ_{p^∞})} with T/(σ − 1)T free of rank one over O, for a lattice T lifting ρ̄. These predicates are evaluated on the chosen residual representation. Residual semisimplification is lattice-independent; extension and ramification data need not be. Under residual irreducibility all stable lattices are homothetic, so their residual representations agree up to isomorphism. (Im) is an integral condition on T.

**Hypotheses.**

- p odd
- the normalisation of ρ̄ matters for (FW1.6_ℓ): in the homological normalisation (det = χ̄_cyc^{k−1}) the inertia-invariant line carries a different character
- k is the weight of the form under consideration; (FWexp_ℓ) uses k even, automatic for trivial nebentypus

**Proof sketch / construction.**

1. Each predicate is a finite-dimensional linear-algebra condition on the restriction of ρ̄ to D_ℓ, I_ℓ or G_{Q(μ_{p^∞})}; use Mathlib's Representation.invariants for the invariant subspaces.
2. At a Steinberg prime ℓ ≠ p, inertia acts unipotently. For an elliptic curve, after the unramified quadratic extension in the nonsplit case, its residual inertia action is nontrivial iff p ∤ ord_ℓ(q_E) = ord_ℓ(Δ_min). This is an inertia criterion: divisibility of the valuation does not assert that q_E is a p-th power in Q_ℓ itself, where a unit obstruction can remain.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `ResidualHyp.irred` | data | Irreducibility of ρ̄ over F. |
| `DistinctCharacters` | data | (dist): the two characters of D_p on the ordinary filtration differ; for reducible ρ̄∣D_p this is also (ScalarExc_p). |
| `IsRamifiedAt` | data | (SU_q), local part: some element of I_q acts nontrivially (the condition q ∥ N is on the level). |
| `FWAuxiliaryCondition` | data | (FW1.6_ℓ), local part: dim W^{I_ℓ} = 1 and dim W^{D_ℓ} = 0, in cohomological normalisation. |
| `ResidualHyp.fwExplicit` | data | (FWexp_ℓ(μ)): the explicit twisted-Steinberg extension with μ unramified quadratic (possibly trivial), ρ̄∣I_ℓ ≠ 1. |
| `LocalExclusion` | data | (LocExc_p) for reducible ρ̄∣D_p with Jordan–Hölder characters χ₁, χ₂: the pair is not {χ, χω}. |
| `ScalarExclusion` | data | (ScalarExc_p): (ρ̄∣D_p)^{ss} is not χ̄ ⊕ χ̄; equal to DistinctCharacters in the reducible case and automatic in the irreducible case. |
| `HasRankOneImage` | data | (Im): some σ in the given subgroup has HasRankOneCoinvariants (ρ σ), i.e. T/(σ − 1)T ≅ O. |
| `FWAuxiliaryCondition.isRamifiedAt` | relation | For dim W = 2, (FW1.6_ℓ) implies IsRamifiedAt, i.e. (FW1.6_ℓ) → (SU_ℓ). |
| `localExclusion_one_iff` | relation | With ω = 1, LocalExclusion χ₁ χ₂ 1 ↔ DistinctCharacters χ₁ χ₂. |
| `ResidualHyp.fwAux_iff_nonsplit_weight_two` | equivalence | For k = 2 and ℓ ∥ N multiplicative with ρ̄(I_ℓ) ≠ 1: (FW1.6_ℓ) ↔ μ nontrivial ↔ nonsplit multiplicative reduction at ℓ. |
| `ResidualHyp.suAux_im` | relation | (SU_q) → (Im) (ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient). |
| `ResidualHyp.ramified_iff_not_pth_power` | characterisation | For E/Q with multiplicative reduction at ℓ ≠ p: ρ̄_{E,p}(I_ℓ) ≠ 1 ↔ p ∤ ord_ℓ(Δ_E^{min}). |
| `ResidualHyp.locExc_ordinary_weight_two` | characterisation | For E good ordinary at p > 3 with unit root α: (LocExc_p) ↔ ᾱ² ≠ 1; for p = 3 it always fails. |

**Uses.**

- Skinner–Urban Theorem 3.6.4, p.43: (irred), (dist) and (SU_q)
- Fouquet–Wan Theorems 1.6, 1.7, 5.1: (FW1.6_ℓ), (FWexp_ℓ), (LocExc_p) and the standing Assumption 2.1
- Burungale–Castella–Skinner Theorem 1.1.2(b): (Im)
- RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part: the rank-zero p-part consumes (SU_q), not (FW1.6_ℓ) (RT-AREA-iwasawa-1/14)

**Unit tests.**

- `ResidualHyp.example_11a1_p7` (computation): For 11a1 (Δ = −11^5, split at 11) and p = 7: (irred) holds (only 5-isogenies), (SU_11) holds (7 ∤ 5), (FW1.6_11) fails (split, so the inertia-invariant line is D_11-fixed in cohomological normalisation), (LocExc_7) holds (ā_7 = −2, and 4 ≢ 1 mod 7), (Im) holds via τ ∈ I_11.
- `ResidualHyp.example_14a1_p13` (computation): For 14a1 (Δ = −2^6·7^3, nonsplit at 2, split at 7) and p = 13: (FW1.6_2) holds (13 ∤ 6 and nonsplit), (SU_2) and (SU_7) hold, and a_13 = −4 is a 13-adic unit.
- `ResidualHyp.normalisation_matters` (non-example): In the homological normalisation (W = E[p]) the D_ℓ-invariants of the inertia-invariant line vanish iff ψ(ℓ)ℓ ≢ 1 mod p (ψ the unramified quadratic character of the reduction type); for 11a1 at p = 7 this holds although (FW1.6_11) fails in Fouquet–Wan's normalisation, so a definition in the wrong normalisation admits curves the theorem does not cover.
- `ResidualHyp.locExc_p3` (degenerate): For E good ordinary at p = 3, ā_3 ∈ {1, 2} = {±1} mod 3, so (LocExc_3) fails for every such curve.
- `HasRankOneCoinvariants.unipotent_example` (characterisation): For T = O² and σ = [[1, 1], [0, 1]], T/(σ − 1)T ≅ O, so (Im) holds; for σ = 1 and for [[1, ϖ], [0, 1]] it fails.

**Acceptance checks.**

- Weight two, cohomological normalisation, ℓ ∥ N_E multiplicative, ρ̄ ramified at ℓ: (FW1.6_ℓ) ⟺ E has nonsplit multiplicative reduction at ℓ ⟺ (FWexp_ℓ(μ)) with μ nontrivial; for k > 2 the dimension condition (FW1.6_ℓ) means μ(ℓ)ℓ^{1−k/2} ≢ 1 mod ϖ, which is neither implied by nor implies μ nontrivial.
- (SU_q) ⟸ (FW1.6_q): the second is strictly stronger; E = 11a1 at p = 7 satisfies (SU_11) but not (FW1.6_11), since 11a1 is split at 11.

**Direct prerequisites.** `mathlib:Representation.invariants`, `mathlib:ContRepresentation`, `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `L0/modular-iwasawa-datum`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2 and Theorem 3.6.4, p.43: the hypotheses (irred), (dist), a prime q ∥ N at which ρ̄_f is ramified, p ∤ N and k ≡ 2 mod p − 1
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorems 1.1, 1.6, 1.7, pp.3, 6–7; Assumption 2.1, p.17; Theorem 5.1, p.68: the dimension form of the auxiliary-prime condition, the explicit twisted-Steinberg form, the local exclusion at p and the standing Assumption 2.1
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2, p.2: the hypotheses (irr_Q) and (im)
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16: a ramified q ∥ N gives τ ∈ I_q with T_f/(ρ_f(τ) − 1)T_f free of rank one, and τ ∈ G_{Q(μ_{p^∞})}

### A ramified multiplicative prime gives a rank-one quotient

**Lemma** `L1/unipotent-rank-one-quotient`.

Let T be a free O-module of rank two with a continuous G_Q-action ρ, and q ≠ p a prime at which ρ restricted to I_q is unipotent and nontrivial modulo ϖ (as for a newform with q ∥ N, trivial character, and ρ̄ ramified at q). For τ ∈ I_q mapping to a topological generator of the tame quotient, ρ(τ) is unipotent, ρ̄(τ) ≠ 1, T/(ρ(τ) − 1)T is free of rank one over O, and τ ∈ G_{Q(μ_{p^∞})}. More generally, any σ with ρ(σ) unipotent and ρ̄(σ) ≠ 1 has T/(ρ(σ) − 1)T ≅ O.

**Hypotheses.**

- q ∥ N with π(f)_q an unramified twist of Steinberg, so that inertia acts unipotently on V_f (local–global compatibility)
- ρ̄(I_q) ≠ 1

**Proof sketch / construction.**

1. Local–global compatibility at q (AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical) makes ρ(I_q) unipotent through the tame quotient.
2. For a unipotent u ≠ 1 mod ϖ on O², u − 1 has rank one modulo ϖ, so its image is a saturated rank-one submodule and the cokernel is free of rank one (elementary divisors).
3. q is unramified in Q(μ_{p^∞}), so I_q ⊂ G_{Q(μ_{p^∞})}.

**Acceptance checks.**

- The matrix [[1, ϖ],[0, 1]] is unipotent with cokernel O/ϖ ⊕ O of (u − 1): it is not free, which is why ρ̄(τ) ≠ 1 is needed.
- Applied with q = 11 for 11a1 at p = 7, this gives (Im) for Burungale–Castella–Skinner Theorem 1.1.2(b).
- Residual unipotence is insufficient even with determinant one: g = [[1,1],[ϖ,1+ϖ]] lies in SL₂(O), but det(g−1) = −ϖ ≠ 0, ker(g−1) = 0 and coker(g−1) ≅ O/ϖ. The characteristic-zero unipotence hypothesis is essential.

**Direct prerequisites.** `mathlib:Matrix.toLin'`, `AutomorphicGaloisRepresentations:R19.4/conductor-and-local-factors-classical`, `L1/residual-hypothesis-predicates`.

**Sources.**

- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.5, pp.15–16: a ramified q ∥ N gives a unipotent ρ_f(τ) ≠ 1 mod ϖ, so T_f/(ρ_f(τ) − 1)T_f is free of rank one, with τ ∈ G_{Q(μ_{p^∞})}; this replaces Kato's SL₂(Z_p)-image hypothesis
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), proof of Lemma 3.13, pp.26–27: Lemma 3.13 uses a residual unipotent lift; the arbitrary-lift step needs the genuine inertia-unipotent repair recorded as source issue E4. Skinner §2.5 supplies this repair in the stated ramified Steinberg range.

### The Skinner–Urban ordinary main conjecture

**Theorem** `L1/su-ordinary-theorem`. Planet: *Skinner–Urban main conjecture*.

Let p ≥ 3, f ∈ S_k(Γ_0(N)) a newform with trivial character, ordinary at p with respect to L, p ∤ N, k ≡ 2 mod (p − 1), (irred) and (dist) for ρ̄, and a prime q ≠ p with q ∥ N and ρ̄ ramified at q. Then for every finite set Σ of primes not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ) = (L_f^Σ) in Λ: IMC^Σ holds integrally. In weight two this is the form p ≥ 3, f ordinary, ρ̄ irreducible, q ∥ N with ρ̄ ramified at q.

**Hypotheses.**

- p ≥ 3; trivial character; k ≡ 2 mod p − 1 (automatic for k = 2)
- (dist) is automatic in weight two for p odd, the cohomological quotient having inertia character ω⁻¹ while the sub-character is unramified
- integrality: Skinner–Urban print it under an SL₂(Z_p)-image hypothesis; Skinner §2.5 shows (irred) and the ramified q suffice, via ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient

**Proof sketch / construction.**

1. Reverse divisibility (L_f^Σ L_{f⊗χ_K}^Σ) ⊃ Ch^Σ(f)Ch^Σ(f⊗χ_K) for an imaginary quadratic K in which p splits, the prime divisors of N/q split and q is inert: the GU(2,2) Eisenstein congruence argument of Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, owned by AutomorphicCongruences:L1.
2. Kato's divisibilities (L_f^Σ) ⊂ Ch^Σ(f) and (L_{f⊗χ_K}^Σ) ⊂ Ch^Σ(f⊗χ_K) (KatoEulerSystems:L4/ordinary-selmer-divisibility), made integral by ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient as in Skinner §2.5.
3. If the first Kato inclusion were strict the product inclusion would be strict, contradicting the reverse divisibility; so (L_f^Σ) = Ch^Σ(f) (Skinner–Urban proof of Theorem 3.6.4).
4. Independence of Σ: ModularIwasawaMainConjectures:L5/euler-factor-change; the statement for Σ = ∅ follows.

**Acceptance checks.**

- E = 11a1, p = 7: k = 2, a_7 = −2 unit, (irred), q = 11 ∥ 11 with 7 ∤ ord_11(Δ) = 5, so IMC holds integrally for 11a1 at 7.
- E = 14a1, p = 13: q = 2 (13 ∤ 6) or q = 7 (13 ∤ 3) works; a_13 = −4 is a unit.

**Direct prerequisites.** `AutomorphicCongruences:L1`, `KatoEulerSystems:L4/ordinary-selmer-divisibility`, `L1/unipotent-rank-one-quotient`, `L1/residual-hypothesis-predicates`, `L0/ordinary-main-conjecture`, `L0/ordinary-selmer-structure`, `L5/euler-factor-change`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4 and its proof, pp.43–44; Theorem 1, p.2: for f ordinary with χ = 1, k ≡ 2 mod p−1, (irred), (dist), a ramified q ∥ N and p ∤ N: Ch^Σ = (L^Σ) rationally, and integrally under the SL₂(Z_p)-image hypothesis; proof by Kato plus Corollary 3.6.3
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Theorem 2.5.2 and the following paragraph, pp.15–16; Theorem A, p.1: the same theorem with the integral conclusion under (ii) irreducible and (iii) a ramified q ∥ N, without the image hypothesis
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2: the hypothesis (mult) under which Skinner–Urban proved Mazur's conjecture

### The Fouquet–Wan ordinary theorem

**Theorem** `L1/fw-ordinary-theorem`. Planet: *Fouquet–Wan ordinary theorem*.

Let p > 2, f ∈ S_k(Γ_0(N)) an eigencuspform with p ∤ N and k ≥ 2, such that: ρ̄_f is absolutely irreducible; (FW1.6_ℓ) holds for some ℓ ∥ N (in Fouquet–Wan's cohomological normalisation); and ρ_f|G_{Q_p} is an extension 0 → χ₁ → ρ_f|G_{Q_p} → χ₂ → 0 with χ̄₁ ≠ χ̄₂. Then char(H¹(Z[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw) divides char(H²(Z[1/p], T ⊗ Λ_Iw)), and together with Kato's divisibility this gives KMC^{η=1} over Q_∞ (Fouquet–Wan Conjecture 1.5) integrally.

**Hypotheses.**

- p > 2, p ∤ N, trivial character, k ≥ 2 (no congruence condition on k)
- (FW1.6_ℓ) in cohomological normalisation; in weight two it means nonsplit multiplicative reduction at ℓ with ρ̄ ramified there
- the ordinary filtration with distinct residual characters

**Proof sketch / construction.**

1. Kato's divisibility in this range: Fouquet–Wan Lemma 3.13 verifies its hypotheses (ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence; KatoEulerSystems:L4/cohomological-divisibility-one-direction).
2. Reverse divisibility: Fouquet–Wan §4.8 — choose the auxiliary imaginary quadratic K as in §4.6, prove the two-variable Rankin–Selberg Iwasawa–Greenberg main conjecture over K by reducing it, through Beilinson–Flach explicit reciprocity and Poitou–Tate, to the GU(3,1) divisibility Theorem 7.32, in weight k (Castella–Wan Theorem 3.8 in weight two); then descend with Kato's result. The whole reverse-divisibility route is owned by AutomorphicCongruences:L2 (RS-11 owner record), which also needs KatoEulerSystems:L4 for its twist/factor separation.
3. Combine the two divisibilities at every height-one prime (ModularIwasawaMainConjectures:L0/kato-main-conjecture, KMC.iff_reverse_divisibility).
4. No canonical-versus-Gross period comparison is used: §4.8 bypasses it, and the plan records that comparison as absent rather than assumed.

**Acceptance checks.**

- E = 14a1, p = 13, ℓ = 2: hypotheses hold (nonsplit at 2, 13 ∤ 6, χ̄₁ unramified ≠ χ̄₂ with inertia character ω⁻¹), so KMC holds for 14a1 at 13.
- E = 11a1, p = 7: (FW1.6_11) fails, so this theorem does not apply even though ModularIwasawaMainConjectures:L1/su-ordinary-theorem does.

**Direct prerequisites.** `KatoEulerSystems:L4/cohomological-divisibility-one-direction`, `AutomorphicCongruences:L2`, `L0/kato-main-conjecture`, `L0/zeta-basis-characteristic-equivalence`, `L1/residual-hypothesis-predicates`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 1.6 and the preceding paragraph, pp.6–7: the hypotheses (absolute irreducibility, ℓ ∥ N with dim ρ̄^{I_ℓ} = 1 and dim ρ̄^{G_ℓ} = 0, the ordinary filtration with χ̄₁ ≠ χ̄₂) and the divisibility, which with Theorem 1.4(2) gives Conjecture 1.5; the remark that the weight restriction of Skinner–Urban was lifted by Wan and that a canonical/Gross period comparison is avoided
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §4.8, p.68: proof outline of Theorem 1.6 through Theorem 7.32, Beilinson–Flach reciprocity, Poitou–Tate and Castella–Wan Theorem 3.8, then Kato
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), footnote 2, p.7: Lemma 3.13 shows the hypotheses of Theorem 1.6 suffice for Theorem 1.4

### The ordinary Selmer form of the ordinary theorems

**Theorem** `L1/fw-ordinary-selmer-form`.

Assume the hypotheses of L1/fw-ordinary-theorem and, in addition, a proved identity L_{p-adic,α,ω,γ}(f) = u L_f with u ∈ O^× for Kato’s good pair for the dual lattice and Skinner–Urban’s canonical periods. Then IMC(D) holds integrally. Conversely, under L1/su-ordinary-theorem and this same integral period identification, KMC^{η=1}(T_K) follows from IMC. The rational comparison only needs the nonzero period scalar carried into the analytic object. The unit identification in general weight is an explicit input, not a conclusion of the rational Deligne-period quotient.

**Hypotheses.**

- ordinary, p ∤ N, p odd, trivial character
- (irred), and a rank-one unipotent element (ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient) to work at the prime (ϖ)
- Kato's good pair (ω, γ) for the dual lattice U ≅ T*(1−k) (KatoEulerSystems:L4/ordinary-selmer-divisibility, hypothesis (3))
- Integral period compatibility: the Kato good dual pair and the canonical modular-symbol periods produce a scalar in O^×. A saturated rank-one lattice in each realization alone does not prove this comparison.

**Proof sketch / construction.**

1. Apply ModularIwasawaMainConjectures:L0/ordinary-cohomological-comparison at every height-one prime, including (ϖ) by the rank-one quotient.
2. Apply Kato’s explicit reciprocity with its actual period scalar. If the integral period-compatibility input gives a unit, the analytic ideals agree. KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values supplies an algebraic period quotient, not by itself its O-unit valuation.
3. Translate Fouquet–Wan's T and Λ_Iw into the datum D by ModularIwasawaMainConjectures:L2/fw-convention-dictionary.

**Acceptance checks.**

- For the optimal semistable elliptic curve 14a1 at p=13 the Néron/canonical unit comparison is supplied by L3/curve-form-lattice-dictionary; the integral main conjecture is independently supplied by L1/su-ordinary-theorem. General-weight translation retains the period-compatibility input.
- A period choice not saturated in the integral lattice gives L_{p-adic} = ϖ^m u L_f with m ≠ 0, and the integral equality would fail by ϖ^m.

**Direct prerequisites.** `L0/ordinary-cohomological-comparison`, `L1/fw-ordinary-theorem`, `L1/su-ordinary-theorem`, `KatoEulerSystems:L3/archimedean-period-quotient-and-critical-values`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `L2/fw-convention-dictionary`.

**Sources.**

- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.4–17.6, pp.273–274, and 17.13, pp.279–280: Kato's p-adic zeta function for good (ω, γ), its integrality, and the deduction of the ordinary statement from the cohomological one
- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.5.6 and Theorem 3.6.4, pp.41–43: Kato's theorem in Skinner–Urban's normalisation of L_f and the resulting equality
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 1.6, pp.6–7: the cohomological formulation proved there

### Skinner's theorem for multiplicative reduction

**Theorem** `L1/skinner-multiplicative-theorem`. Planet: *Skinner's multiplicative-reduction theorem*.

Let p ≥ 3 and f ∈ S_2(Γ_0(N)) a newform with p ∥ N (so f is ordinary at p, k = 2, and a_p = ±1), L/Q_p as in the datum, (irred) for ρ̄_f, and a prime q ≠ p with q ∥ N and ρ̄_f ramified at q. Then for every finite Σ not containing p, X^Σ is Λ-torsion and char_Λ(X^Σ) = (L_f^Σ) in Λ, where X^Σ uses the ordinary line of the Steinberg representation at p and L_f is the Mazur–Tate–Teitelbaum p-adic L-function (with its trivial zero when a_p = 1).

**Hypotheses.**

- p ≥ 3, p ∥ N, weight two, trivial character
- (irred) and a ramified q ∥ N, q ≠ p
- the p ∤ N seed is ModularIwasawaMainConjectures:L1/su-ordinary-theorem in weights k_m ≡ 2 mod (p − 1)p^m on level N/p; it is applied only to members of the Hida family satisfying its hypotheses, which the congruence modulo p guarantees
- the imported Hida-family node OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family is stated for p ≥ 5; the case p = 3 needs the same Hida-theoretic input for p = 3 (recorded as remaining work of L1)

**Proof sketch / construction.**

1. Reductions: it suffices to prove the statement after a finite extension of L (ModularIwasawaMainConjectures:L5/coefficient-extension-invariance) and for Σ containing all primes dividing N (ModularIwasawaMainConjectures:L5/euler-factor-change).
2. Hida theory: f is the weight-two member of a Hida family (OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family); for each m > 0 there is a newform f_m ∈ S_{k_m}(Γ_0(N/p)) with k_m ≡ 2 mod (p − 1)p^m, ordinary, whose p-stabilisation is congruent to f modulo p^m.
3. The two-variable p-adic L-function of PadicFamilies:L1/branch-l-functions yields congruence of the principal ideals (L^Σ_{f_m}, p^m) = (L^Σ_f, p^m), with compatible choices of periods or their unit ambiguity. An exact equality of chosen analytic generators modulo p^m is not asserted without fixing these choices.
4. Greenberg's theorem (ModularIwasawaMainConjectures:L0/ordinary-selmer-structure) gives Ch^Σ(f_m) = Fitt(X^Σ(f_m)); the congruence gives Sel^Σ(f)[p^m] ≅ Sel^Σ(f_m)[p^m], hence (Fitt(X^Σ(f)), p^m) = (Ch^Σ(f_m), p^m) = (L^Σ_{f_m}, p^m) = (L^Σ_f, p^m) for every m.
5. Since L^Σ_f ≠ 0, Fitt(X^Σ(f)) ≠ 0, so X^Σ(f) is torsion, Greenberg's theorem gives Ch^Σ(f) = Fitt, and principal ideals agreeing modulo every p^m are equal.

**Acceptance checks.**

- For E with split multiplicative reduction at p, L_f has a trivial zero at the trivial character and the theorem is consistent with Greenberg–Stevens (ModularIwasawaMainConjectures:L5/greenberg-stevens-trivial-zero): (γ − 1) divides both sides.
- The theorem is the input requested by RankZeroOneBSD:BSD.6/rank-zero-ordinary-multiplicative-p-part for p ∥ N (RT-AREA-iwasawa-1/4(a)).

**Direct prerequisites.** `L1/su-ordinary-theorem`, `OrdinaryAutomorphicFormsAndModularityLifting:R21.6/ordinary-newform-lies-in-a-hida-family`, `PadicFamilies:L1/branch-l-functions`, `L0/ordinary-selmer-structure`, `L5/coefficient-extension-invariance`, `L5/euler-factor-change`, `SelmerIwasawaCohomology:L3/selmer-fitting-characteristic`.

**Sources.**

- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Theorem A, pp.1–2: for p ≥ 3, f ∈ S_k(Γ_0(N)) ordinary, k ≡ 2 mod p − 1, ρ̄_f irreducible and a ramified q ∥ N: Ch_L(f) = (L_f) in Λ_O; new when p | N
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, pp.3–4, and §3.1, pp.18–19: the deduction of the p | N case from p ∤ N through Hida families, the congruence of p-adic L-functions and the Fitting-ideal argument

## L2. Fouquet–Wan pointwise theorem

Import the pointwise theorem and supply the cohomological/geometric convention dictionary. The scalar residual case is excluded by the odd exponent in the determinant, so it contributes no extra assumption.

### Fouquet–Wan conventions against the modular Iwasawa datum

**Comparison** `L2/fw-convention-dictionary`.

Let f ∈ S_k(Γ_0(N)) with trivial character. Fouquet–Wan's T(f) ⊂ M(f)_{et,p} is a lattice in the cohomological realisation, with det ρ_f = χ_cyc^{1−k}, and their Λ_Iw-adic objects are RΓ_et(Z[1/p], T(f) ⊗ Λ_Iw), Δ(M(f))_Iw and the {p}-partial zeta morphism z(f)_Iw : T(f)_Iw(−1)^+ → H¹(Z[1/p], T(f)_Iw). Under the dictionary T(f) ↔ Kato's T_K (KatoEulerSystems:L2/hecke-dual-twist-dictionary) and Λ_Iw ↔ the η = 1 quotient Λ of Λ(G_∞), these are the objects H^i(T_K), Δ_Iw(T_K) and triv_z of ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line, and Fouquet–Wan's Conjecture 1.5 for M(f) is KMC^{η=1}(T_K). The half-weight twists χ_cyc^{1−k/2}, χ_cyc^{−k/2} in Fouquet–Wan's local hypothesis are integral powers because k is even for trivial character. More precisely z(f)_Iw = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V_f^*(1)))⁻¹ z(f)_Σ,Iw in the total fraction algebra (Proposition 3.28, p.35); the local determinant corrections must accompany this formula integrally.

**Hypotheses.**

- trivial nebentypus, so k is even
- the dictionary of Hecke actions and twists is the one fixed in KatoEulerSystems:L2/hecke-dual-twist-dictionary; no other convention is introduced here

**Proof sketch / construction.**

1. Compare Fouquet–Wan §1.1.1 (pp.4–5) and Definition 3.3/Theorem 3.4 (p.23) with Kato §12 and the datum's conventions term by term.
2. Fouquet–Wan's T(f)_Iw is T(f) ⊗ Λ_Iw with the Galois action twisted through Γ_Iw, matching Kato's j_*-limit over Q(ζ_{p^n}) projected to the η = 1 component (Shapiro, SelmerIwasawaCohomology:L3/iwasawa-shapiro).
3. The Σ-partial versus {p}-partial comparison uses the Euler factors of Fouquet–Wan Definition 3.8, nonzero by Lemma 3.11.

**Acceptance checks.**

- For f = f_E of weight two, T(f) = T_pE^∨ = Hom(T_pE, Z_p), while the datum's T ≅ T_pE; the dictionary is the Weil pairing and the Tate twist by one.
- Fouquet–Wan's residual hypotheses on ρ̄_f are read in this cohomological normalisation (ModularIwasawaMainConjectures:L1/residual-hypothesis-predicates).

**Direct prerequisites.** `KatoEulerSystems:L2/hecke-dual-twist-dictionary`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`, `L0/iwasawa-fundamental-line`, `L0/kato-main-conjecture`, `L0/modular-iwasawa-datum`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §1.1.1, pp.3–5; Theorem 1.7, p.7: the cohomological realisation M(f)_{et,p}, the lattice T, ρ_f with det χ_cyc^{1−k} (as in the local hypothesis of Theorem 1.7) and the fundamental line
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Definition 3.3, p.23, Theorem 3.4, p.24; Definition 3.8, Lemma 3.11, p.25: S-partial zeta morphisms and the Euler factors relating them

### The Fouquet–Wan pointwise main conjecture

**Theorem** `L2/fw-pointwise-theorem`. Planet: *Fouquet–Wan pointwise main conjecture*.

Let p ≥ 3, F a finite field of characteristic p and ρ̄ : G_Q → GL₂(F) absolutely irreducible and odd, satisfying: (LocExc_p); and for some ℓ ≠ p, (FWexp_ℓ(μ)) — a ramified extension 0 → μχ̄_cyc^{1−k/2} → ρ̄|D_ℓ → μχ̄_cyc^{−k/2} → 0 with μ unramified quadratic (possibly trivial), and μ nontrivial if ρ̄|G_{Q_p} is irreducible. Let f ∈ S_k(Γ_0(Np^r)) be a normalised eigencuspform of weight k ≥ 2 with ρ̄_f ≅ ρ̄ and ℓ ∥ N. Then KMC^{η=1} holds for f integrally: the zeta morphism induces Δ_{O_Iw}(T(f)_Iw) ≅ O_Iw (Fouquet–Wan Conjecture 3.24 = 1.5). In particular this holds for every reduction type of f at p (crystalline, semistable, potentially semistable; principal series, Steinberg or supercuspidal π(f)_p).

**Hypotheses.**

- p ≥ 3; k ≥ 2 is even and the nebentypus is trivial. Theorem 5.1 permits level Np^r; μ is an unramified quadratic character, allowed to be trivial when the local representation at p is reducible.
- The scalar semisimplification is automatically excluded: det ρ̄_f = χ̄_cyc^(1−k) has odd exponent, whereas a scalar semisimplification has square determinant on tame inertia (Fouquet–Wan remark following Theorem 5.1, p.69).
- Assumption 2.1(1), absolute irreducibility over Q(√p*), follows from the genuine ramified unipotent at ℓ; Assumption 3.5 follows from (LocExc_p).

**Proof sketch / construction.**

1. The proof is owned by AutomorphicCongruences:L4 (RS-11 narrowing): the universal-family theorem (ModularIwasawaMainConjectures:L4/fw-universal-family-theorem) at points of X^sm via ordinary/crystalline-short points and the GU(3,1) congruence, propagated to all classical points by the height-one descent of Fouquet–Wan §§5–6.
2. This node states the endpoint in the datum's conventions: translate by ModularIwasawaMainConjectures:L2/fw-convention-dictionary, and check the residual hypotheses with ModularIwasawaMainConjectures:L1/residual-hypothesis-predicates.
3. Derive Assumption 2.1(1) from the ramified unipotent at ℓ (the image of G_{Q(√p*)} contains ρ̄(I_ℓ), and an induced-from-quadratic image has no nontrivial unipotent elements for p odd).

**Acceptance checks.**

- E = 14a1, p = 5 (supersingular, a_5 = 0): ρ̄|G_{Q_5} is irreducible, so (LocExc_5), (ScalarExc_5) hold; ℓ = 2 is nonsplit (μ nontrivial) and 5 ∤ ord_2 Δ = 6, so ρ̄ is ramified at 2; ρ̄ is absolutely irreducible (no rational 5-isogeny). KMC holds for 14a1 at p = 5.
- E = 11a1, p = 7: ρ̄|G_{Q_7} is reducible (ordinary), so Theorem 5.1 allows μ trivial at ℓ = 11 (split); with 7 ∤ 5 and ā_7² = 4 ≠ 1 the hypotheses hold, while the introduction's Theorem 1.7 (μ nontrivial) does not apply.

**Direct prerequisites.** `AutomorphicCongruences:L4`, `L2/fw-convention-dictionary`, `L1/residual-hypothesis-predicates`, `L0/kato-main-conjecture`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 1.7, p.7: statement for p > 2, f ∈ S_k(Γ_0(N)), absolutely irreducible odd ρ̄ with the local exclusion at p and the ramified twisted-Steinberg extension at ℓ with μ the nontrivial quadratic character
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 5.1, p.68: the body statement: p ≥ 3, f ∈ S_k(Γ_0(Np^r)), μ unramified quadratic and nontrivial when ρ̄|G_{Q_p} is irreducible
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Assumption 2.1, p.17, and Theorem 1.1, p.3: the standing residual assumption and the introduction's version with the scalar exclusion
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Remark immediately after Theorem 5.1, p.69: The determinant excludes scalar local semisimplifications in even weight with trivial nebentypus.

### Ordinary and signed consequences of the pointwise theorem

**Theorem** `L2/fw-ordinary-and-signed-consequences`.

Let f satisfy the hypotheses of ModularIwasawaMainConjectures:L2/fw-pointwise-theorem. (1) If moreover p ∤ N, f is ordinary at p, (dist) holds and ρ̄ satisfies (Im), and the integral period-compatibility input of L1/fw-ordinary-selmer-form holds, then IMC(D) holds integrally for the ordinary datum of f. (2) If moreover p ∤ N, f is supersingular at p with LLZ's (A) (k ≥ 3 or a_p = 0), and (E) holds, then for the LLZ basis the signed main conjectures SMC^{1,η=1} and SMC^{2,η=1} hold integrally; without (E) they hold rationally. Nothing is asserted about a bounded scalar p-adic L-function at points where none exists (infinite slope, supercuspidal π(f)_p).

**Hypotheses.**

- (1) needs the comparison hypotheses of ModularIwasawaMainConjectures:L0/ordinary-cohomological-comparison
- (2) needs the hypotheses of ModularIwasawaMainConjectures:L0/signed-cohomological-comparison; the two hypothesis sets are intersected, not merged

**Proof sketch / construction.**

1. (1): combine the pointwise theorem with ModularIwasawaMainConjectures:L0/ordinary-cohomological-comparison and the integral identification of ModularIwasawaMainConjectures:L1/fw-ordinary-selmer-form.
2. (2): combine it with ModularIwasawaMainConjectures:L0/signed-cohomological-comparison (LLZ Corollary 6.6).

**Acceptance checks.**

- (2) applies to E = 14a1 at p = 5: (A) since a_5 = 0, (E) since the mod-5 representation is surjective; so SMC^{1}, SMC^{2} hold for the LLZ basis, i.e. Kobayashi's ± main conjectures (ModularIwasawaMainConjectures:L4/kobayashi-pollack-comparison).
- (1) applies to E = 11a1 at p = 7 through Theorem 5.1, independently of ModularIwasawaMainConjectures:L1/su-ordinary-theorem.

**Direct prerequisites.** `L2/fw-pointwise-theorem`, `L0/ordinary-cohomological-comparison`, `L0/signed-cohomological-comparison`, `L1/fw-ordinary-selmer-form`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §1.1.2, p.7: the theorem allows every reduction type at p; ordinary and crystalline consequences are derived through the standard comparisons
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Corollary 6.6, p.44: equivalence of Kato's main conjecture with the signed main conjecture under (A)/(A') and (E)
- [Kazuya Kato, p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf), 17.13, pp.279–280: the ordinary comparison

## L3. Elliptic-curve dictionary and BCS

Identify the curve’s Tate lattice and Néron periods with the modular-form conventions while retaining all nonunit indices. The BCS endpoint already uses the curve’s own normalization.

### Elliptic curves against their newforms: lattices and periods

**Comparison** `L3/curve-form-lattice-dictionary`.

Let E/Q have conductor N and newform f_E (EllipticCurveModularity:R29.6/modularity-theorem), and fix the modular parametrisation φ_E : X_0(N) → E of EllipticCurveModularity:R29.5/modular-parametrisation through a Q-isogeny λ : A_{f_E} → E, with φ_E^*ω_E = c_φ·2πi f_E(z)dz. Then: (1) T_pE ≅ T for the datum of f_E with Tate lattice λ_*⁻¹(T_pE) in V_p(A_{f_E}) and the corresponding cohomological dual lattice T_f; (2) write Ω_E^± for the periods of a Néron differential ω_E and Ω_{f_E}^± for the canonical periods defined by the saturated f_E-isotypic part of H¹(X_0(N), Z_{(p)})^±; for the X_0(N)-optimal curve φ_{E,*} is surjective on integral homology, so φ_E^* identifies H¹(E(C), Z_{(p)})^± with that saturated part and Ω_E^± = ±c_φ·u^±·P_{f_E}^±, where P_{f_E}^± := −2πi Ω_{f_E}^± in Skinner–Urban’s cohomological convention with u^± ∈ Z_{(p)}^×; for a curve E' isogenous to the optimal curve the ratio is multiplied by the period ratio of the isogeny, a rational number whose p-part divides a power of the p-part of the isogeny degree; (3) for p > 2 semistable for E and φ_E optimal, p ∤ c_φ (GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit). Every nonunit factor is retained; none is assumed to be 1.

**Hypotheses.**

- E/Q, N its conductor, f_E the attached newform
- p > 3, so that H¹(X_0(N), Z_(p)) is the parabolic cohomology of Γ_0(N) with Z_(p) coefficients used to define canonical periods
- the isogeny λ is part of the data; for the X_0(N)-optimal curve λ = id
- (3) needs p > 2 semistable and φ_E optimal; otherwise c_φ is only an integer

**Proof sketch / construction.**

1. Modularity and the parametrisation: EllipticCurveModularity:R29.6/modularity-theorem and R29.5/modular-parametrisation.
2. Use R29.4/tate-module-comparison rationally, then choose λ_*⁻¹(T_pE) in V_p(A_{f_E}) and its corresponding cohomological dual lattice. Although λ_* is a rational isomorphism, λ_*T_p(A_{f_E}) can be a proper sublattice of T_pE when p divides deg λ.
3. Periods: φ_E^*ω_E = c_φ·2πi f_E(z)dz; since φ_{E,*} is surjective on H_1 for the optimal curve, φ_E^* is injective on H¹ with torsion-free cokernel, so φ_E^*H¹(E(C), Z_(p))^± is a saturated rank-one sublattice of the f_E-part, hence equal to it; pairing gives the period relation. The canonical periods are those of ModularSymbolsPadicLFunctions:L1/integral-period-lattices. Here the differential period is P_f=−2πiΩ_f, as in Skinner 2016 footnote 6, rather than the cohomological Ω_f itself.
4. Manin constant: GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit (RT-AREA-iwasawa-1/17).

**Acceptance checks.**

- For E = 11a1 (optimal, Manin constant 1) at p = 7: Ω_E^+ and P_{f_E}^+=−2πiΩ_{f_E}^+ agree up to a 7-adic unit, so L_p(E/Q) and L_{f_E} generate the same ideal of Λ.
- For a p-isogeny, the image of the source Tate lattice can be proper in T_pE, and the Néron period ratio can be nonunit (e.g. p=5 in class 11a). Track both lattice and analytic period factors. Under residual irreducibility stable lattices are homothetic, so this issue disappears for the integral irreducible branches.

**Direct prerequisites.** `EllipticCurveModularity:R29.6/modularity-theorem`, `EllipticCurveModularity:R29.5/modular-parametrisation`, `EllipticCurveModularity:R29.4/tate-module-comparison`, `ModularSymbolsPadicLFunctions:L1/integral-period-lattices`, `GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit`, `L0/modular-iwasawa-datum`.

**Sources.**

- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.20, p.258; Theorem 0.8, p.255: the parametrisation π_E with π_E^*ω_E = c_E f_E, c_E ∈ Z, and the periods Ω_E^± of the Néron differential entering the p-adic L-function
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), remark after Corollary 1.10, p.9: the modular-form period equals the Néron period up to the Manin constant
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2: integrality of L_p(E/Q) is best understood under p odd and (irr_Q), citing Greenberg–Vatsal Proposition 3.1
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.4 footnote 6, p.14: The change from cohomological canonical periods Ω_f to the periods used in modular-symbol interpolation has the factor −2πi.

### The Mazur–Swinnerton-Dyer p-adic L-function of an elliptic curve

**Construction** `L3/msd-padic-l-function`. Planet: *Mazur–Swinnerton-Dyer p-adic L-function*.

Let E/Q have good ordinary or multiplicative reduction at an odd prime p, with α the unit root of X² − a_pX + p (α = a_p = ±1 in the multiplicative case). L_p(E/Q) ∈ Λ ⊗ Q_p is the element whose associated measure μ_{E,α} on Z_p^× satisfies ∫ μ_{E,α} = (1 − α^{-1})^{b+1}·L(E,1)/Ω_E^+ with b = 1 for good and b = 0 for multiplicative reduction, and ∫ χ μ_{E,α} = p^n α^{-n} L(E, χ^{-1}, 1)/(G(χ^{-1}) Ω_E^{χ(−1)}) for χ primitive of conductor p^n > 1, restricted to the Γ-branch through 1 + pZ_p. Its analytic form is L_p(E, s) = ∫ ⟨x⟩^{s−1} μ_{E,α}. If E[p] is irreducible, L_p(E/Q) ∈ Λ.

**Hypotheses.**

- p odd, good ordinary or multiplicative reduction
- Néron-differential periods Ω_E^±, not canonical periods of f_E
- integrality in Λ requires (irr_Q) and the Manin-constant comparison of ModularIwasawaMainConjectures:L3/curve-form-lattice-dictionary

**Proof sketch / construction.**

1. Construct μ_{E,α} from the modular symbols of f_E (ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure) and rescale from canonical to Néron periods by ModularIwasawaMainConjectures:L3/curve-form-lattice-dictionary.
2. Interpolation: ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness, with the trivial-character Euler factor of ModularSymbolsPadicLFunctions:L4/euler-factor-comparison (the factor (1 − α^{-1})² for good and (1 − α^{-1}) for multiplicative reduction).

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `mazurSwinnertonDyerL` | data | L_p(E/Q) ∈ Λ ⊗ Q_p for E good ordinary or multiplicative at odd p. |
| `mazurSwinnertonDyerL_trivial_character` | simp | Its value at the trivial character is (1 − α^{-1})^{b+1} L(E,1)/Ω_E^+. |
| `mazurSwinnertonDyerL_twist` | simp | Its value at a primitive χ of conductor p^n > 1 is p^n α^{-n} L(E, χ^{-1}, 1)/(G(χ^{-1})Ω_E^{χ(−1)}). |
| `mazurSwinnertonDyerL_mem_Lambda` | other | If E[p] is irreducible then L_p(E/Q) ∈ Λ. |
| `mazurSwinnertonDyerL_isogeny` | relation | For a Q-isogeny E → E', L_p(E'/Q) = (Ω_E^+/Ω_{E'}^+)·L_p(E/Q), the period ratio being a rational number. |
| `mazurSwinnertonDyerL_eq_form` | compatibility | L_p(E/Q) = (P_{f_E}^+/Ω_E^+) L_{f_E}, where P_{f_E}^+=−2πiΩ_{f_E}^+ is the differential period corresponding to Skinner–Urban’s cohomological canonical period. The ratio is algebraic and its p-part is retained. |
| `mazurSwinnertonDyerL_analytic` | equivalence | L_p(E, s) := ∫ ⟨x⟩^{s−1} μ_{E,α}, s ∈ Z_p, and γ − 1 ↦ ⟨u⟩^{s−1} − 1 identifies the two forms. |

**Uses.**

- Burungale–Castella–Skinner Theorem 1.1.2: the analytic side of the cyclotomic equality
- Colmez Conjecture 0.12, p.256: the Mazur–Tate–Teitelbaum conjecture is stated for L_{p,α}(E, s)
- RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula: the trivial-character value enters the p-part of BSD
- ModularIwasawaMainConjectures:L5/greenberg-stevens-trivial-zero: its derivative at s = 1 in the split multiplicative case

**Unit tests.**

- `mazurSwinnertonDyerL_trivial_zero_split` (computation): If E has split multiplicative reduction at p then α = 1 and the trivial-character value is 0.
- `mazurSwinnertonDyerL_11a1_p7` (computation): For E = 11a1 at p = 7, the trivial-character value is (1 − α^{-1})²/5 ≠ 0 with α ≡ −2 mod 7.
- `mazurSwinnertonDyerL_neron_not_canonical` (non-example): For a non-optimal curve E' in the class 11a and p = 5, L_p(E'/Q) and L_{f_E} differ by the 5-adic nonunit period ratio, so using canonical periods in place of Néron periods changes the integral main conjecture for E'.
- `mazurSwinnertonDyerL_degenerate_multiplicative` (degenerate): For multiplicative reduction b = 0, so the trivial-character factor is (1 − α^{-1}), not its square.

**Acceptance checks.**

- For α = 1 (split multiplicative), (1 − α^{-1})^{b+1} = 0: the trivial zero of Colmez Remark 0.10.
- For E = 11a1 at p = 7, the value at the trivial character is (1 − α^{-1})²/5, a nonzero element of Z_7.

**Direct prerequisites.** `ModularSymbolsPadicLFunctions:L2/ordinary-integral-measure`, `ModularSymbolsPadicLFunctions:L2/interpolation-and-uniqueness`, `ModularSymbolsPadicLFunctions:L4/euler-factor-comparison`, `L3/curve-form-lattice-dictionary`, `L0/canonical-ordinary-padic-l-function`.

**Sources.**

- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.8, Definition 0.9, Remark 0.10, p.255: the distribution μ_{E,α} with its interpolation formula (including b), the function L_{p,α}(E,s) and the trivial-character value (1 − α^{-1})^{b+1} L(E,1)/Ω_E^+
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.1, pp.1–2: L_p(E/Q) ∈ Λ ⊗ Q_p attached by Mazur–Swinnerton-Dyer; integrality under (irr_Q)

### Mazur's main conjecture for an elliptic curve

**Definition** `L3/mazur-main-conjecture`. Planet: *Mazur's main conjecture*.

For E/Q and a prime p of good ordinary reduction, MMC(E, p) is the proposition: X_ord(E/Q_∞) := Sel_{p^∞}(E/Q_∞)^∨ is Λ-torsion and char_Λ(X_ord(E/Q_∞)) = (L_p(E/Q)) in Λ. MMC_Q(E, p) is the equality in Λ ⊗ Q_p. Under ModularIwasawaMainConjectures:L3/curve-form-lattice-dictionary, MMC(E, p) ⟺ IMC(D_{f_E}) when the period ratio Ω_E^+/P_{f_E}^+ (P_f=−2πiΩ_f) is a p-adic unit, and MMC_Q(E, p) ⟺ IMC_Q(D_{f_E}) always.

**Hypotheses.**

- good ordinary p (multiplicative p is covered by ModularIwasawaMainConjectures:L1/skinner-multiplicative-theorem through the form)
- the integral form carries the implicit integrality L_p(E/Q) ∈ Λ

**Proof sketch / construction.**

1. X_ord(E/Q_∞) is the ordinary Selmer dual of the datum of f_E (ModularIwasawaMainConjectures:L0/ordinary-selmer-dual, OrdinarySelmer.ofEllipticCurve).
2. L_p(E/Q) is ModularIwasawaMainConjectures:L3/msd-padic-l-function; compare with L_{f_E} by the period ratio.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `MazurMC` | data | MMC(E, p) : Prop. |
| `MazurMC_rational` | data | MMC_Q(E, p) : Prop. |
| `MazurMC.iff_IMC` | equivalence | MMC(E, p) ↔ IMC(D_{f_E}) when Ω_E^+/P_{f_E}^+ (P_f=−2πiΩ_f) ∈ Z_p^×; MMC_Q(E, p) ↔ IMC_Q(D_{f_E}). |
| `MazurMC.isogeny` | relation | For an isogeny E → E' of degree prime to p, MMC(E, p) ↔ MMC(E', p). |
| `MazurMC.toRational` | relation | MMC(E, p) → MMC_Q(E, p). |

**Uses.**

- Burungale–Castella–Skinner Theorem 1.1.2: its conclusion
- RankZeroOneBSD:BSD.6: the integral form is specialised at the trivial character
- Rodrigues Jacinto–Williams §2.2.2: the elliptic main conjecture in the introduction

**Unit tests.**

- `MazurMC.11a1_p7` (computation): MMC(11a1, 7) holds (ModularIwasawaMainConjectures:L1/su-ordinary-theorem with q = 11, or ModularIwasawaMainConjectures:L3/bcs-integral-theorem).
- `MazurMC.rational_weaker` (non-example): MMC_Q does not determine μ: it is compatible with char(X) = (p·L_p(E/Q)), which MMC excludes.
- `MazurMC.prime_to_p_isogeny` (compatibility): For p = 7 and the 5-isogenous curves 11a1, 11a2, 11a3, the three conjectures MMC(·, 7) are equivalent.

**Acceptance checks.**

- MMC(E, p) depends only on the isogeny class up to the p-part of period ratios and of the change of Selmer groups along the isogeny; both are tracked, not assumed to cancel.
- For E = 11a1 at p = 7 the period ratio is a unit, so MMC ⟺ IMC for f_E.

**Direct prerequisites.** `L0/ordinary-selmer-dual`, `L3/msd-padic-l-function`, `L0/ordinary-main-conjecture`, `L3/curve-form-lattice-dictionary`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Conjecture 1.1.1, p.1: Mazur's main conjecture: X_ord(E/Q_∞) torsion with ch_Λ = (L_p(E/Q)) in Λ
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), §2.2.2, p.6: the Iwasawa main conjecture for elliptic curves relating the p-adic L-function and p-adic arithmetic invariants

### The Burungale–Castella–Skinner rational cyclotomic theorem

**Theorem** `L3/bcs-rational-theorem`. Planet: *BCS cyclotomic main conjecture*.

Let E/Q, p > 3 a prime of good ordinary reduction with E[p] irreducible. Then X_ord(E/Q_∞) is Λ-torsion and MMC_Q(E, p) holds: char_{Λ_Q}(X_ord(E/Q_∞)) = (L_p(E/Q)) in Λ ⊗ Q_p. No ramification hypothesis on E[p] is assumed.

**Hypotheses.**

- p > 3, good ordinary, (irr_Q)
- the proof owner is AutomorphicCongruences:L5b; this node transports its endpoint into the formulation of ModularIwasawaMainConjectures:L3/mazur-main-conjecture

**Proof sketch / construction.**

1. Import AutomorphicCongruences:L5b/rational-cyclotomic-endpoint (base change to the quartic CM field, Wan's divisibility, the four-factor descent and Kato's bounds).
2. Translate its Selmer and analytic objects with ModularIwasawaMainConjectures:L3/curve-form-lattice-dictionary and ModularIwasawaMainConjectures:L3/msd-padic-l-function; the rational form needs no Manin-constant input.

**Acceptance checks.**

- Applies to 11a1 at p = 7 and to 14a1 at p = 13; it does not apply at p = 3 or at Eisenstein primes (11a1 at p = 5).
- It removes the ramification hypothesis (mult) of Skinner–Urban: 11a1 at p = 7 is covered by both, while a curve with no multiplicative prime at which E[p] ramifies (e.g. a curve of prime conductor ℓ with p | ord_ℓ Δ) is covered only here.

**Direct prerequisites.** `AutomorphicCongruences:L5b/rational-cyclotomic-endpoint`, `L3/mazur-main-conjecture`, `L3/curve-form-lattice-dictionary`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(a), p.2: for p > 3 good ordinary with (irr_Q): X_ord torsion and ch = (L_p(E/Q)) in Λ ⊗ Q_p
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3, p.2: (im) holds for large p by Serre; the prior result of Wan was conditional on a period comparison

### The Burungale–Castella–Skinner integral cyclotomic theorem

**Theorem** `L3/bcs-integral-theorem`.

Under the hypotheses of ModularIwasawaMainConjectures:L3/bcs-rational-theorem, if moreover (Im) holds — there is σ ∈ G_{Q(μ_{p^∞})} with T_pE/(σ − 1)T_pE ≅ Z_p — then MMC(E, p) holds integrally.

**Hypotheses.**

- p > 3 good ordinary, (irr_Q), (Im)
- (Im) is not interchangeable with residual surjectivity or with irreducibility without the sufficient-condition lemma ModularIwasawaMainConjectures:L3/surjective-implies-rank-one-image

**Proof sketch / construction.**

1. Import AutomorphicCongruences:L5b/integral-cyclotomic-endpoint and transport it as in the rational case.
2. The imported endpoint is already an integral statement for this elliptic curve E with its own Néron normalization. Integrality of L_p(E/Q) under (irr_Q) is L3/msd-padic-l-function. No extra semistability or Manin-constant unit hypothesis is added to the BCS theorem; the curve/form dictionary is used only when translating to a separate modular-form presentation.

**Acceptance checks.**

- 11a1 at p = 7: (Im) holds via τ ∈ I_11 (ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient), so MMC(11a1, 7) holds integrally.
- For a curve with no multiplicative prime where E[p] is ramified, (Im) can still hold through surjectivity (ModularIwasawaMainConjectures:L3/surjective-implies-rank-one-image); under (irr_Q) the essential case left out by Theorem 1.1.2 is that of residually dihedral primes (Burungale–Castella–Skinner Remark 1.1.3(iii)).

**Direct prerequisites.** `AutomorphicCongruences:L5b/integral-cyclotomic-endpoint`, `L3/bcs-rational-theorem`, `L3/surjective-implies-rank-one-image`, `L1/unipotent-rank-one-quotient`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2(b), p.2: under (im) the equality holds in Λ and Mazur's conjecture holds

### Residual surjectivity gives the rank-one image condition

**Lemma** `L3/surjective-implies-rank-one-image`.

Let E/Q, p ≥ 5, and suppose ρ̄_{E,p} : G_Q → GL₂(F_p) is surjective. Then the image of ρ_{E,p^∞} is GL₂(Z_p), the image of G_{Q(μ_{p^∞})} contains SL₂(Z_p), and σ with ρ_{E,p^∞}(σ) = [[1, 1], [0, 1]] satisfies T_pE/(σ − 1)T_pE ≅ Z_p, so (Im) holds.

**Hypotheses.**

- p ≥ 5
- residual surjectivity onto GL₂(F_p)

**Proof sketch / construction.**

1. Let H be the closed p-adic image. Its closed commutator subgroup lies in SL₂(Z_p) and reduces onto [GL₂(F_p),GL₂(F_p)]=SL₂(F_p). Serre’s SL₂ lifting lemma for p≥5 makes this subgroup SL₂(Z_p). Since det H is all Z_p× (Weil pairing), H=GL₂(Z_p).
2. Q(μ_{p^∞}) is cut out by the determinant, so G_{Q(μ_{p^∞})} maps onto SL₂(Z_p) ∩ image = SL₂(Z_p).
3. For u = [[1,1],[0,1]], u − 1 has image Z_p·e₁, so the quotient is free of rank one (ModularIwasawaMainConjectures:L1/unipotent-rank-one-quotient).

**Acceptance checks.**

- For E = 14a1 and p = 5 (5 is not a nonmaximal prime for 14a1), ρ̄_{E,5} is surjective, so (Im) holds.
- Burungale–Castella–Skinner Remark 1.1.3(i): for non-CM E, (Im) holds for all sufficiently large p by Serre's open image theorem.

**Direct prerequisites.** `L1/unipotent-rank-one-quotient`, `L1/residual-hypothesis-predicates`, `ArithmeticGaloisRepresentations:R01.6`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Remark 1.1.3(i), p.2; Theorem 1.2.2(b), p.3: (im) for large p by Serre's open image theorem; residual surjectivity (sur) as the integral hypothesis in the anticyclotomic theorem
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), assumption (E), p.43: the SL₂(Z_p)-image hypothesis used for integral statements
- [Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu, Lifting subgroups of symplectic groups over Z/ℓZ](https://arxiv.org/abs/1607.04698v2), §1, p.1, the g=1 discussion citing Serre IV.3.4 Lemma 3: A closed subgroup of SL₂(Z_p) surjecting mod p is all SL₂(Z_p) for p≥5; this is the rank-two lifting input, not LSTX’s Theorem 1 for g≥2.

## L4. Families and signed theory

Import the family endpoint and distinguish Σ-partial derived base change from primitive specialization. For signed theory, the unconditional FW-powered application here is the trivial tame component; final Néron/Pollack analytic transport is conditional.

### The Fouquet–Wan universal-family main conjecture

**Theorem** `L4/fw-universal-family-theorem`. Planet: *Fouquet–Wan universal-family theorem*.

Let ρ̄ satisfy the hypotheses of ModularIwasawaMainConjectures:L2/fw-pointwise-theorem, Σ a finite set of primes, and T_Σ the universal deformation of ρ̄ unramified outside Σ, viewed as a free module of finite rank over the regular subring Λ ≅ O[[X₁, X₂, X₃]] of the Hecke algebra. Let z_Σ : T_Σ(−1)^+ → H¹_et(Z[1/Σ], T_Σ) be Nakamura's zeta morphism. Then z_Σ induces an isomorphism triv_{z_Σ} : Δ_Σ(T_Σ) ≅ Λ of the Σ-partial fundamental line with Λ: Kato's generalised main conjecture (Fouquet–Wan Conjecture 3.30) holds for (Spec Z[1/Σ], Λ, T_Σ). The trivialisation is over Λ; nothing is asserted over a possibly singular deformation ring or Hecke algebra.

**Hypotheses.**

- the residual hypotheses of the pointwise theorem (Fouquet–Wan Theorem 5.2: the same as Theorem 5.1)
- Λ ≅ O[[X₁,X₂,X₃]] is the specified regular subring; T_Σ is free of finite rank over it
- Nakamura's zeta morphism exists under Fouquet–Wan Assumptions 2.1 and 3.5 (Theorem 3.6), for all p ≥ 3 by the remark after it

**Proof sketch / construction.**

1. The proof is owned by AutomorphicCongruences:L4 (RS-11 narrowing): reduction to points of X^sm via ordinary and crystalline-short points, the GU(3,1) congruence and Theorem 7.32, and the height-one descent.
2. The zeta morphism is KatoEulerSystems:L2/nakamura-twisted-zeta-morphism; the Σ-partial line is ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line over Λ.
3. This node exposes the endpoint with its exact coefficient ring and no strengthening.

**Acceptance checks.**

- Specialising at a classical point recovers the pointwise statement at the Σ-imprimitive level (ModularIwasawaMainConjectures:L4/family-specialization-corrections).
- When the deformation problem is unobstructed, R_Σ(ρ̄) is itself a power-series ring and the theorem is the most general cyclotomic statement (Fouquet–Wan p.8).

**Direct prerequisites.** `AutomorphicCongruences:L4`, `KatoEulerSystems:L2/nakamura-twisted-zeta-morphism`, `L0/iwasawa-fundamental-line`, `L2/fw-pointwise-theorem`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 1.8, p.8, and Theorem 5.2, p.69: for ρ̄ as in Theorem 1.7 (resp. 5.1), T_Σ free over Λ ≅ O[[X₁,X₂,X₃]] and z_Σ the zeta morphism of Theorem 3.6, triv_{z_Σ} : Δ_Σ(T_Σ) ≅ Λ; equivalently Kato's Conjecture 3.2.2 for (Spec Z[1/Σ], Λ, T_Σ)
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorem 3.6 and the remark after it, p.24; Conjecture 3.30, p.36: Nakamura's zeta morphism under Assumptions 2.1 and 3.5, valid for p ≥ 3; the family conjecture

### Specialising the family statement

**Theorem** `L4/family-specialization-corrections`.

Under L4/fw-universal-family-theorem, let ψ be a coefficient specialization from its specified regular base Λ. The Σ-partial perfect complex and line commute with derived base change, and the compatible zeta morphism induces Δ_Σ(T_Σ) ⊗^L_{Λ,ψ} S ≅ Δ_Σ(T_Σ ⊗^L_{Λ,ψ} S). For a cyclotomic specialization use ψ_Iw and S_Iw consistently on both sides. Identifying this derived coefficient object with the specialized arithmetic lattice, primitive line and zeta trivialization requires Fouquet–Wan’s relative-purity and Iwasawa-suitability conditions, using Definition 3.19 for the regular base (Definition 3.12 is for the Hecke-algebra setting). At a classical point the primitive zeta map satisfies z_primitive = (∏_{ℓ∈Σ∖{p}} Eul_ℓ(V_f^*(1)))⁻¹ z_Σ (Proposition 3.28); compatible local determinant factors accompany it. These nonzero factors need not be units. Characteristic ideals are recovered from the specialized determinant with all cohomology and Tor terms, rather than specialized term by term.

**Hypotheses.**

- For primitive arithmetic compatibility use the Iwasawa-suitable specialization of Definition 3.19 (p.31), including its condition on all lifts above the regular-base point; do not substitute a single suitable Hecke lift.
- The Σ-partial derived base change is unconditional in Lemma 3.17’s coefficient setting; the primitive modified local line uses Proposition 3.20 and relative purity.
- Euler factors and their dual/twist are those of Proposition 3.28, p.35; nonvanishing does not license cancellation inside integral lines without the local determinant comparison.

**Proof sketch / construction.**

1. Use Lemma 3.17 for perfect derived coefficient change, Definition 3.19 for suitability over the regular subring, Proposition 3.20 for primitive local compatibility and Propositions 3.22–3.23 for the zeta trivialisations.
2. Compare Σ- and {p}-partial lines by the local Euler factors (ModularIwasawaMainConjectures:L0/iwasawa-fundamental-line, fundamentalLine.sigmaPartial).
3. Translate to KMC through ModularIwasawaMainConjectures:L0/zeta-basis-characteristic-equivalence at Iwasawa-suitable points.

**Acceptance checks.**

- At a point where H⁰ or a Tor term is nonzero, termwise specialisation of char(H²) would be wrong; the determinant form remains valid.
- The family statement implies the pointwise conjecture outside a closed subset of positive codimension (Fouquet–Wan p.8); the pointwise theorem at every classical point is ModularIwasawaMainConjectures:L2/fw-pointwise-theorem.

**Direct prerequisites.** `L4/fw-universal-family-theorem`, `L0/iwasawa-fundamental-line`, `L0/zeta-basis-characteristic-equivalence`, `PadicMeasuresIwasawaAlgebras:L5`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Propositions 3.22–3.23, p.33: compatibility of the trivialisations with specialisation of Iwasawa-suitable specialisations
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Lemma 3.17 and Definitions 3.18–3.19, p.31; Proposition 3.20, p.32; Proposition 3.28, p.35: Derived coefficient change, regular-base suitability, the modified primitive line and the inverse dual Euler-factor formula.
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), remarks after Theorem 1.8, p.8: the family theorem implies Conjecture 1.5 outside a positive-codimension closed subset

### The signed main conjecture for crystalline forms

**Theorem** `L4/llz-signed-main-conjecture`. Planet: *Signed main conjecture theorem*.

Let f ∈ S_k(Γ_0(N)) with p ∤ N, crystalline at p, satisfying the hypotheses of ModularIwasawaMainConjectures:L2/fw-pointwise-theorem and LLZ's (A) if supersingular or (A') if good ordinary, together with (E). Then for the Wach basis of LLZ §3.3 (resp. §3.6) and η=1 (both i=1,2), the signed main conjecture SMC^{i,η} of ModularIwasawaMainConjectures:L0/signed-main-conjecture holds integrally, with the Coleman-image term char(Im(Col_i)^η/(L̃^η_{p,i})). The statement is proved only on the intersection of the two hypothesis sets.

**Hypotheses.**

- the hypotheses of the pointwise theorem and of LLZ Corollary 6.6 simultaneously
- the image-of-Coleman term is retained; its simplification is ModularIwasawaMainConjectures:L4/llz-basis-adjusted-simplification
- The unconditional application here is η=1. For nontrivial η, LLZ’s equivalence still applies in its allowed index range, but KMC^η must be separately supplied. A twist f⊗η generally has p-power level and nontrivial nebentypus, so the stated FW theorem cannot be invoked merely by checking residual conditions.

**Proof sketch / construction.**

1. For η=1 use KMC from L2/fw-pointwise-theorem. A nontrivial η statement is conditional on an independently proved KMC^η, with LLZ Theorem 6.5 allowing i=1 for all η and i=2 only for η=1.
2. Convert to SMC^{i,η} by ModularIwasawaMainConjectures:L0/signed-cohomological-comparison.

**Acceptance checks.**

- E = 14a1, p = 5: SMC^{1}, SMC^{2} hold for η = 1 with the LLZ basis.
- A form with k ≥ 3 that is good ordinary but locally split at p is excluded by (A').

**Direct prerequisites.** `L2/fw-pointwise-theorem`, `L0/signed-cohomological-comparison`, `L0/signed-main-conjecture`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Theorem 6.5, Corollary 6.6, pp.43–44: under (A)/(A') and (E), Kato's main conjecture is equivalent to the signed statement with the Coleman-image term
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), §1.1.2, p.7: the pointwise theorem holds for all reduction types, in particular for crystalline nonordinary points

### Removing the Coleman-image term

**Theorem** `L4/llz-basis-adjusted-simplification`.

Let f be supersingular at p with p ∤ N satisfying LLZ's (A)–(D): k ≥ 3 or a_p = 0; a_p ≠ p^j + p^{k−2−j} for 1 ≤ j ≤ k − 3; v_p(a_p) > ⌊(k − 2)/(p − 1)⌋; p ≥ k − 1. Then Col₁ : N(V)^{ψ=1} → Λ_E(G_∞) is surjective (LLZ Theorem 4.28), so Im(Col₁) = Λ_E(G_∞) and, after tensoring with Q, KMC^η is equivalent to char(X^{1,η}) = (L̃^η_{p,1}) (LLZ Corollary 6.8). For elliptic curves with a_p = 0 the images are computed integrally: Col₁ : D(T)^{ψ=1} → Λ(G_∞) is surjective and Im(Col₂) = (Σ_{i=1}^{p−1} δ_i)Λ(G_∞) + (γ − 1)Λ(G_∞) (LLZ Corollaries 5.18 and 5.22, equivalent to Kobayashi's Theorem 6.2). The simplified statement is basis-adjusted: it is the principal-ideal form for the LLZ basis, not automatically for another author's normalisation.

**Hypotheses.**

- (A)–(D) for the rational simplification
- a_p = 0 and E an elliptic curve for the integral image computation
- the basis is LLZ's; another basis changes Col by a matrix and the image by its effect

**Proof sketch / construction.**

1. Image computation: PadicHodgeRegulators:L4/actual-coleman-image (LLZ Proposition 4.7, Corollary 4.8, Theorem 4.28) and, for a_p = 0, LLZ Propositions 5.17–5.21 and Corollaries 5.18–5.22.
2. Insert Im(Col_i) into ModularIwasawaMainConjectures:L0/signed-main-conjecture (SMC.of_image_eq_top).

**Acceptance checks.**

- For a_p = 0, SMC² keeps the nontrivial factor char(Λ/Im Col₂) on its η-components where Im(Col₂)^η ≠ Λ; only for i = 1 does the principal form hold for all η.
- Assumption (D) p ≥ k − 1 holds for every weight-two form; (C) holds for a_p = 0.

**Direct prerequisites.** `PadicHodgeRegulators:L4/actual-coleman-image`, `L0/signed-main-conjecture`, `L0/signed-cohomological-comparison`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Theorem 4.28, p.30; assumptions (B)–(D), p.14: surjectivity of Col₁ under (B), (C), (D) for supersingular f
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Remark 6.7 and Corollary 6.8, p.44: the image need not lie in Λ_{O_E}; under (A)–(D) the rational main conjecture is equivalent to generation by L̃^η_{p,1}
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Propositions 5.17, 5.19 and 5.21 and Corollaries 5.18, 5.20 and 5.22, pp.38–40: images of Col₁ and Col₂ for elliptic curves with a_p = 0, equivalent to Kobayashi's Theorem 6.2

### Kobayashi's and Pollack's signed objects

**Theorem** `L4/kobayashi-pollack-comparison`. Planet: *Kobayashi–Pollack signed main conjecture*.

Let E/Q have good supersingular reduction at an odd prime p with a_p = 0. For the LLZ basis there are units a^± ∈ Λ_E(G_∞)^× with a^−·Col₁ = Col^− and a^+·Col₂ = Col^+, where Col^± are the plus and minus Coleman maps whose kernels define Kobayashi's local conditions E^±; consequently (1) the signed Selmer groups X¹, X² of ModularIwasawaMainConjectures:L0/signed-selmer-dual are Kobayashi's Sel^−(E/Q_∞)^∨ and Sel^+(E/Q_∞)^∨; (2) L̃_{p,1}, L̃_{p,2} are Pollack's L_p^−, L_p^+ up to units of Λ_E(G_∞), and the decomposition of L̃_{p,α}, L̃_{p,β} in LLZ Theorem 1.3 reduces to Pollack's decomposition with the half-logarithms log^±_p; (3) SMC^{1,η}, SMC^{2,η} are Kobayashi's minus and plus main conjectures char(Sel^∓(E/Q_∞)^{∨,η}) = char(Im(Col^∓)^η/(L_p^{∓,η})). The comparison is specific to a_p = 0; for a_p ≠ 0 the LLZ objects are not Pollack's plus/minus objects without a separate argument. The Coleman multipliers stated here lie in Λ_E×. They identify kernels integrally and carry each actual image lattice to its corresponding image lattice, hence identify the corrected image quotients when the zeta images use the same period normalization. Equality with a separately Néron-normalized Pollack function integrally requires the explicit period scalar to be a unit; without that comparison only the rational analytic identification is asserted.

**Hypotheses.**

- E/Q, p odd, good supersingular reduction with a_p = 0 (automatic for p ≥ 5 supersingular)
- the LLZ basis of Proposition 5.10
- For an integral equality with a separately normalized Pollack analytic function, require the integral period comparison and actual integral Coleman image normalization; a Λ_E-unit alone does not prove equality of principal ideals over Λ_O.

**Proof sketch / construction.**

1. LLZ Proposition 5.10 and Corollary 5.11 give the units a^± relating Col_i and Col^±.
2. Pollack's plus/minus decomposition and half-logarithms are ModularSymbolsPadicLFunctions:L4/plus-minus-decomposition and ModularSymbolsPadicLFunctions:L4/half-logarithms; Kato's reciprocity identifies Col^±(loc z) with them (KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements).
3. Kernels of unit multiples coincide, so the local conditions and hence the Selmer groups agree; insert into ModularIwasawaMainConjectures:L0/signed-main-conjecture.

**Acceptance checks.**

- E = 14a1, p = 5 (a_5 = 0): X¹ = Sel^−(E/Q_∞)^∨, X² = Sel^+(E/Q_∞)^∨.
- Supplies the Kobayashi/Pollack formulation requested by RankZeroOneBSD:BSD.0 for RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture.

**Direct prerequisites.** `L0/signed-selmer-dual`, `L0/signed-main-conjecture`, `ModularSymbolsPadicLFunctions:L4/plus-minus-decomposition`, `ModularSymbolsPadicLFunctions:L4/half-logarithms`, `KatoEulerSystems:L3/generalised-explicit-reciprocity-law-for-zeta-elements`, `PadicHodgeRegulators:L4/coleman-coordinates`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Proposition 5.10 and Corollary 5.11, pp.35–36: units a^± with a^− Col₁ = Col^− and a^+ Col₂ = Col^+
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), §1.2 after Theorem 1.3, p.6, and §5.3, pp.38–40: the decomposition reduces to Pollack's when a_p = 0; relation of ker Col^± to Kobayashi's and Lei's descriptions
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Remark 6.3, p.43: the main-conjecture formulation follows Kobayashi §5

## L5. Consequences and examples

Compare Euler factors, coefficient rings and Iwasawa invariants, then state the converse and p-adic BSD consequences with their exact hypotheses. The numerical examples distinguish checked computations, arithmetic inputs and conditional theorem applications.

### Changing the imprimitive set: Euler factors on both sides

**Theorem** `L5/euler-factor-change`. Planet: *Euler-factor change*.

Let D be an ordinary datum with trivial character, p ∤ N, and Σ' ⊂ Σ finite sets of primes not containing p. If X^Σ is Λ-torsion and T* has no nonzero G_Q-invariants, then 0 → (⊕_{ℓ∈Σ∖Σ'} H¹(Q_{∞,ℓ}, A))^∨ → X^Σ → X^{Σ'} → 0 is exact, each local term is torsion with no nonzero pseudo-null submodule and characteristic ideal (P_{T,ℓ}(ℓ^{-1}γ_ℓ)), where P_{T,ℓ} is the Euler polynomial of Skinner–Urban Lemma 3.2.17(ii) and γ_ℓ ∈ Γ is the image of Frob_ℓ; hence char(X^Σ) = char(X^{Σ'})·∏_{ℓ∈Σ∖Σ'} (P_{T,ℓ}(ℓ^{-1}γ_ℓ)). On the analytic side L_f^Σ = L_f^{Σ'}·∏_{ℓ∈Σ∖Σ'} P_{T,ℓ}(ℓ^{-1}γ_ℓ) with the same factors. Therefore IMC^Σ(D) ⟺ IMC^{Σ'}(D), integrally and rationally, and the same holds for KMC with Σ-partial lines.

**Hypotheses.**

- X^Σ torsion (it then follows for Σ')
- T* has no nonzero G_Q-invariants (true when ρ̄ is irreducible)
- the same polynomial P_{T,ℓ} must be used on both sides; using the Euler factor of V where that of its dual is meant breaks the equality
- For the displayed exact sequence require Σ ∪ {p} to contain the ramification set, as in SU Proposition 3.2.18. Comparisons between arbitrary Σ,Σ′ pass through a common larger set containing that set; no unconditional localization-surjectivity assertion is made.

**Proof sketch / construction.**

1. For a large Σ containing every ramified prime other than p, use SU Proposition 3.2.18. For arbitrary finite sets, compare each with a common larger set and cancel the identical nonzero analytic/algebraic Euler factors in the domain Λ.
2. Local terms: Skinner–Urban Lemma 3.2.17 — torsion, no pseudo-null submodules, characteristic ideal generated by the Euler polynomial at ℓ^{-1}ε_Q(frob_ℓ).
3. Analytic side: ModularSymbolsPadicLFunctions:L4/primitive-imprimitive-level-change.
4. Multiplicativity of characteristic ideals in exact sequences: PadicMeasuresIwasawaAlgebras:L4 (charIdeal_mul_of_exact).

**Acceptance checks.**

- For ℓ ∥ N with split multiplicative reduction of E, P_ℓ has degree one, and the factor (1 − ℓ^{-1}γ_ℓ^{±1}) appears on both sides; for ℓ of good reduction P_ℓ has degree two.
- Skinner Conjecture 2.5.1: the conjecture for one Σ gives it for all Σ.

**Direct prerequisites.** `L0/ordinary-main-conjecture`, `L0/ordinary-selmer-dual`, `ModularSymbolsPadicLFunctions:L4/primitive-imprimitive-level-change`, `PadicMeasuresIwasawaAlgebras:L4`, `SelmerIwasawaCohomology:L2/condition-change-triangle`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Lemma 3.2.17 and Proposition 3.2.18, pp.26–27: the local terms H¹_Σ(Q_∞, T ⊗ A*)* and their characteristic ideals ∏ P_{T,ℓ}(ℓ^{-1}ε(frob_ℓ)), and the exact sequence for Σ' ⊂ Σ
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), remark after Conjecture 2.5.1, p.15: by Lemma 2.3.4(i) and (2.4.2) the conjecture for one Σ implies it for all Σ

### Invariance under extension of coefficients

**Theorem** `L5/coefficient-extension-invariance`.

For an ordinary datum D and a finite extension L'/L with ring of integers O', X^Σ(D ⊗ O') ≅ X^Σ(D) ⊗_O O', L_f^Σ is unchanged in Λ_{O'} = Λ ⊗_O O', and char_{Λ_{O'}}(M ⊗_O O') = char_Λ(M)Λ_{O'} for every finitely generated torsion Λ-module M. Since Λ → Λ_{O'} is faithfully flat, IMC^Σ(D ⊗ O') ⟺ IMC^Σ(D), and similarly for KMC and SMC.

**Hypotheses.**

- O'/O finite (possibly ramified)
- characteristic ideals over the regular rings Λ, Λ_{O'}
- For SMC, extend the integral Coleman domain, actual image lattices and basis as well as coefficients; do not replace the transported image with the whole coefficient ring.

**Proof sketch / construction.**

1. Selmer groups commute with the flat base change ⊗_O O' (O' free over O).
2. Characteristic ideals commute with flat base change between normal noetherian domains when heights are preserved (PadicMeasuresIwasawaAlgebras:L4, base change of charIdeal).
3. For principal ideals I, J of Λ, IΛ_{O'} = JΛ_{O'} implies I = J by faithful flatness.

**Acceptance checks.**

- Skinner's proof of Theorem A first replaces L by a finite extension; this theorem justifies it.
- A ramified extension multiplies μ-invariants by the ramification index e(L'/L) on both sides, so integral equalities are preserved.

**Direct prerequisites.** `L0/ordinary-main-conjecture`, `L0/kato-main-conjecture`, `PadicMeasuresIwasawaAlgebras:L4`.

**Sources.**

- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §1, p.3, and remark after Conjecture 2.5.1, p.15 (relation (2.3.1)): it suffices to prove the main conjecture after replacing L by a finite extension; the relation between Ch^Σ_L(f) and Ch^Σ_{L₁}(f)

### μ- and λ-invariants of the two sides

**Theorem** `L5/mu-lambda-comparison`.

Let O be a complete discrete valuation ring with uniformiser ϖ, Λ = O[[X]], and f, g ∈ Λ nonzero. If (f)Λ[1/ϖ] = (g)Λ[1/ϖ] and ϖ^n | f ⟺ ϖ^n | g for all n (equal μ-invariants), then f and g are associated in Λ. Consequently: (1) IMC(D) implies μ(X) = μ(L_f) and λ(X) = λ(L_f); (2) IMC_Q(D) together with μ(X) = μ(L_f) implies IMC(D); (3) the same holds for KMC and Mazur's conjecture; in particular IMC_Q(D) and μ(L_f) = 0 = μ(X) give the integral conjecture.

**Hypotheses.**

- O a complete DVR; Λ = O[[X]] a UFD
- μ and λ invariants of PadicMeasuresIwasawaAlgebras:L4 §4.4

**Proof sketch / construction.**

1. Λ is a UFD with ϖ prime; the units of Λ[1/ϖ] are ϖ^Z·Λ^×; so (f) = (g) in Λ[1/ϖ] means f = ϖ^m u g with m ∈ Z, u ∈ Λ^×, and equal μ forces m = 0.
2. For (1): Weierstrass preparation f = ϖ^μ P u (PadicMeasuresIwasawaAlgebras:L4 §4.3–4.4) and char(X) = (ϖ^{μ(X)} char-poly) give equality of invariants.
3. Apply to f = a generator of char(X), g = L_f.

**Acceptance checks.**

- μ(X) = μ(L_f) = 0 and IMC_Q imply IMC: this is how integral statements are obtained once μ-vanishing is known.
- f = p, g = 1 have (f) = (g) in Λ[1/p] but different μ, so the μ-hypothesis is necessary.

**Direct prerequisites.** `PadicMeasuresIwasawaAlgebras:L4`, `mathlib:PowerSeries`, `mathlib:Associated`, `mathlib:IsDiscreteValuationRing`, `L0/ordinary-main-conjecture`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), §1.1, pp.1–2: the characteristic ideal depends on the lattice only through its valuation at the prime containing p; hence it is well defined in Λ ⊗ Q_p
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), Theorem 1.1.2 and Remark 1.1.3, p.2: the rational equality in Λ ⊗ Q_p and its integral strengthening are distinct statements

### The rank-zero p-converse

**Theorem** `L5/rank-zero-converse`. Planet: *Rank-zero p-converse*.

(1) (Skinner–Urban) Let E/Q, p≥3 a prime of good ordinary reduction with ρ̄_{E,p} irreducible and a prime q ≠ p, q ∥ N_E, at which ρ̄_{E,p} is ramified. If Sel_{p^∞}(E/Q) is finite then L(E,1) ≠ 0; equivalently, L(E,1) = 0 implies corank_{Z_p} Sel_{p^∞}(E/Q) ≥ 1. The same holds at p of multiplicative reduction under Skinner's Theorem C hypotheses. (2) (Fouquet–Wan) For f ∈ S_k(Γ_0(N)) satisfying the hypotheses of ModularIwasawaMainConjectures:L2/fw-pointwise-theorem with p ∤ N, the discrete Bloch–Kato Selmer group associated with a lattice in V = M(f)_{et,p}(k/2) and A=V/T is finite iff L(f, k/2) ≠ 0. (3) For f = f_E with E/Q and N not squarefull (Skinner–Urban) or arbitrary N (Wan), if rank E(Q) = 0 and Sha(E/Q)[p^∞] is finite for one sufficiently large ordinary p, then ord_{s=1}L(E,s) = 0.

**Hypotheses.**

- (1): the hypotheses of ModularIwasawaMainConjectures:L1/su-ordinary-theorem in weight two (or ModularIwasawaMainConjectures:L1/skinner-multiplicative-theorem)
- (2): the pointwise theorem's hypotheses
- (3): the range quoted by Skinner 2020 §1; the all-N case rests on Wan's thesis, cited there
- In (2) finiteness concerns the discrete p-primary Selmer group. For the Q_p-vector-space Bloch–Kato group the corresponding conclusion is zero, not finiteness of a nonzero vector space. The statement for arbitrary N in (3) is source-reported context only; no proof from the narrower ordinary theorem is asserted.

**Proof sketch / construction.**

1. (1): from IMC, (γ − 1) | char(X) iff the trivial-character value vanishes; Greenberg's control (RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula; Skinner–Urban's proof via Greenberg [Gr99] Theorem 4.1) relates X_Γ to Sel_{p^∞}(E/Q), so L(E,1) = 0 forces positive corank.
2. (2): Fouquet–Wan Corollary 5.3 — if the specialisation of z(f)_Iw at γ ↦ 1 vanishes, (γ − 1) divides char(H¹/z) = char(H²), giving positive corank; otherwise its image spans a nonzero line in H¹_f.
3. (3): Skinner 2020 §1 records this converse from the ordinary main conjecture.

**Acceptance checks.**

- E = 11a1 at p = 7: L(E,1) ≠ 0 and Sel_{7^∞}(E/Q) is finite, consistent with (1).
- (1) is the input routed from PAPER-SKINNER-20/3; the rank-one converse is RankOneConverse:PC.3/theorem-b, not this node.

**Direct prerequisites.** `L1/su-ordinary-theorem`, `L1/skinner-multiplicative-theorem`, `L2/fw-pointwise-theorem`, `RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula`, `L0/kato-main-conjecture`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 2 (= Theorem 3.6.11), pp.3 and 46: under good ordinary p, irreducible ρ̄_{E,p} and a ramified q ∥ N_E: if L(E,1) = 0 the Selmer corank is at least one
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), Theorem C, p.3: the same for good ordinary or multiplicative p
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Corollary 1.9, p.8, and Corollary 5.3 with its proof, p.69: Sel_Q(f) finite iff L(f, k/2) ≠ 0 under the hypotheses of Theorem 1.7/5.1
- [Christopher Skinner, A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294), §1, pp.1–2: for r = 0 the converse was established by Skinner–Urban (N not squarefull) and Wan (all N), needing finiteness of Sha[p^∞] for one sufficiently large ordinary p

### The ℒ-invariant of a split multiplicative curve

**Definition** `L5/tate-l-invariant`. Planet: *Mazur–Tate–Teitelbaum ℒ-invariant*.

Let E/Q_p have split multiplicative reduction, with Tate parameter q_E ∈ Q_p^×, |q_E| < 1, so that E(Q̄_p) ≅ Q̄_p^×/q_E^Z (the Tate curve). The ℒ-invariant is ℒ_p(E) := log_p(q_E)/ord_p(q_E), where log_p is Iwasawa's branch of the p-adic logarithm (log_p(p) = 0). For a weight-two newform f with p ∥ N and a_p = 1 attached to E, ℒ(V_f) := ℒ_p(E) is the Mazur–Tate–Teitelbaum ℒ-invariant.

**Hypotheses.**

- split multiplicative reduction (a_p = 1)
- Iwasawa's normalisation log_p(p) = 0; a different branch changes ℒ_p(E) by a multiple of the branch constant

**Proof sketch / construction.**

1. The Tate parameter is supplied by the Tate curve of tauceti:TauCetiRoadmap/EllipticCurves layer 4 (the analytic strand over a complete rank-one valued field).
2. The p-adic logarithm on Q_p^× with log_p(p) = 0 is not in Mathlib at the pin; it is imported from ColemanIntegration:L0/iwasawa-logarithm.

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `tateLInvariant` | data | ℒ_p(E) ∈ Q_p for E/Q_p split multiplicative. |
| `tateLInvariant_def` | characterisation | ℒ_p(E)·ord_p(q_E) = log_p(q_E). |
| `tateLInvariant_ne_zero` | other | For E/Q, ℒ_p(E) ≠ 0 (DiophantineApproximationAndTranscendence:DT.5). |
| `tateLInvariant_isogeny` | relation | Q_p-isogenous split multiplicative curves have the same ℒ-invariant (q_E changes to a power q_E^m up to roots of unity, and both numerator and denominator scale by m). |
| `tateLInvariant_ofForm` | compatibility | For f = f_E with p ∥ N and a_p = 1, ℒ(V_f) = ℒ_p(E). |

**Uses.**

- Colmez Theorem 0.11, p.255: the Greenberg–Stevens formula L'_{p,α}(E,1) = ℒ_E L(E,1)/Ω_E^+
- Colmez Conjecture 0.12(ii), p.256: the leading term of the p-adic BSD formula in the exceptional case
- RankZeroOneBSD:BSD.6/cyclotomic-specialization-formula: the split multiplicative rank-zero p-part

**Unit tests.**

- `tateLInvariant_branch` (characterisation): With log_p(p) = 0, ℒ_p(E) is independent of writing q_E = p^n u with u ∈ Z_p^×: ℒ_p(E) = log_p(u)/n.
- `tateLInvariant_valuation` (computation): For E = 11a1 at p = 11, ord_11(q_E) = ord_11(Δ) = 5, so ℒ_11(E) = log_11(q_E)/5.
- `tateLInvariant_not_nonsplit` (non-example): For nonsplit multiplicative reduction (a_p = −1) the p-adic L-function has no trivial zero and no ℒ-invariant enters; the definition is restricted to a_p = 1.

**Acceptance checks.**

- ord_p(q_E) = ord_p(Δ_E^{min}) = −ord_p(j_E) > 0.
- ℒ_p(E) ≠ 0 for E/Q (Barré-Sirieix–Diaz–Gramain–Philibert, transcendence of q_E), requested from DiophantineApproximationAndTranscendence:DT.5.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`, `ColemanIntegration:L0/iwasawa-logarithm`, `DiophantineApproximationAndTranscendence:DT.5`.

**Sources.**

- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10, p.255; Remark 0.13(i), p.256: the Tate parameter q(E) of nonzero valuation, ℒ_E = log q(E)/v_p(q(E)), and its nonvanishing by Barré, Diaz, Gramain and Philibert
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), §2.4, (2.4.3), p.15: the ℒ-invariant ℒ(V_f) of a weight-two form with split multiplicative reduction at p, introduced by Mazur–Tate–Teitelbaum

### The Mazur–Tate–Teitelbaum p-adic BSD conjecture

**Definition** `L5/mtt-padic-bsd-conjecture`. Planet: *Mazur–Tate–Teitelbaum conjecture*.

Let E/Q have good ordinary or multiplicative reduction at an odd p, r = rank E(Q), α the unit root, L_{p,α}(E, s) the function of ModularIwasawaMainConjectures:L3/msd-padic-l-function, ⟨ , ⟩_{p,α} the p-adic height on Q_p ⊗ E(Q) attached to the splitting of the Hodge filtration given by the α-eigenline of Frobenius, and R_{p,α}(E) its regulator. MTT(E, p) is the proposition: (i) if α ≠ 1, ord_{s=1} L_{p,α}(E, s) ≥ r and lim_{s→1} (s − 1)^{−r} L_{p,α}(E, s) = (1 − α^{-1})^{b+1}·#Sha(E)·R_{p,α}(E)·∏_v m_v; (ii) if α = 1, the order is ≥ r + 1 and lim_{s→1} (s − 1)^{−r−1} L_{p,α}(E, s) = ℒ_p(E)·#Sha(E)·R_{p,α}(E)·∏_v m_v. Here, as in Colmez Conjecture 0.12, R_{p,α}(E) := e^{−2} det(⟨P_i, P_j⟩_{p,α}) for P_1, …, P_r spanning Q ⊗ E(Q) and generating a subgroup of index e in E(Q) (so R_{p,α}(E) = #E(Q)_tors^{−2} when r = 0), m_v is the number of components at v (m_∞ for E(R), the Tamagawa number at finite v), and Ω_E^+ satisfies m_∞Ω_E^+ = |∫_{E(R)} ω_E|. The exact proposition MTT includes finiteness of the full Sha(E/Q), so #Sha has its usual finite meaning. Define separately MTT_p: assume only Sha(E/Q)[p∞] finite and use its order in the displayed leading-term formula up to a Z_p-unit (ratio in Z_p×), retaining the same order lower bound. If the regulator is nonzero this formula gives the exact order. These exact and unit propositions are not identified.

**Hypotheses.**

- good ordinary or multiplicative p, p odd
- the p-adic height pairing is an input (the Mazur–Tate/Schneider height for ordinary E); its nondegeneracy is not known in general
- the torsion enters through the index e in the regulator, as in Colmez's normalisation of R_∞(E); the formula must not divide by #E(Q)_tors² a second time
- MTT uses full Sha finiteness; MTT_p uses only finiteness of its p-primary part. This finiteness is supplied as an input, not inferred merely by writing #Sha.

**Proof sketch / construction.**

1. State with L_{p,α}(E, s) (ModularIwasawaMainConjectures:L3/msd-padic-l-function), ℒ_p(E) (ModularIwasawaMainConjectures:L5/tate-l-invariant) and the p-adic height.
2. The p-adic height pairing and regulator are an input with no planned owner in the atlas (gap: the SelmerIwasawaCohomology Part II on p-adic heights is not yet a roadmap; NoncommutativeAndEquivariantIwasawa:NE.7/height-pairing-bockstein plans Nekovář's height only as a Bockstein map).

**Planning API.**

| Name | Role | Statement |
|---|---|---|
| `MTT` | data | MTT(E,p): finiteness of full Sha and the displayed exact leading-term/order statement. MTT_p(E,p): finiteness of Sha[p∞] and the corresponding leading coefficient up to a Z_p-unit, with #Sha[p∞]. |
| `MTT.order_lower_bound` | other | ord_{s=1} L_{p,α}(E, s) ≥ r (+1 if α = 1) is Kato's theorem (Colmez Theorem 0.15), stated separately. |
| `MTT_p.rank_zero_iff_BSD_p` | equivalence | For r=0, α≠1 and Sha[p∞] finite, MTT_p(E,p) ↔ the p-part of classical BSD. With full Sha finite, exact MTT ↔ exact classical BSD. |
| `MTT.exceptional_rank_zero` | relation | For r=0, α=1, Greenberg–Stevens identifies exact MTT with exact classical BSD; it identifies MTT_p with the p-part, since ℒ_p(E)≠0 and can be cancelled in either equality. |

**Uses.**

- Rodrigues Jacinto–Williams Remark 2.3, p.7: the p-adic BSD conjecture motivating the main conjecture
- ModularIwasawaMainConjectures:L5/schneider-padic-bsd-from-mc: the main conjecture implies it under nondegenerate heights

**Unit tests.**

- `MTT.rank_zero_good_ordinary` (computation): For E = 11a1, p = 7, r = 0, taking #Sha = 1 as an explicit arithmetic input to this numerical test: R_{p,α} = 5^{−2}, m_∞ = 1, m_11 = 5, so MTT predicts L_{7,α}(E,1) = (1 − α^{-1})²·5/25 = (1 − α^{-1})²/5, matching Colmez Remark 0.10's value (1 − α^{-1})² L(E,1)/Ω_E^+ with L(E,1)/Ω_E^+ = 1/5.
- `MTT.exceptional_order` (degenerate): For split multiplicative E with r=0 and the finiteness input, the regulator is #E(Q)_tors⁻²≠0 and ℒ_p(E)≠0, so either MTT or MTT_p predicts order exactly one, never zero.
- `MTT.height_dependence` (non-example): Using the canonical (Néron–Tate) real regulator in place of R_{p,α}(E) gives a statement with the wrong field of values: the leading coefficient lies in Q_p, the real regulator in R.

**Acceptance checks.**

- Kato's theorem (Colmez Theorem 0.15): ord_{s=1} L_{p,α}(E,s) ≥ r (≥ r + 1 if α = 1), and equality implies Sha[p^∞] finite and R_{p,α}(E) ≠ 0 — a consequence, not an assumption.
- In rank zero with α≠1 and full Sha finite, exact MTT is equivalent to the full numerical BSD formula. With only Sha[p∞] finite, MTT_p is equivalent to its p-part. Even at an anomalous ordinary prime, the nonzero factor 1−α⁻¹ cancels in the comparison; it need not be a p-adic unit.

**Direct prerequisites.** `L3/msd-padic-l-function`, `L5/tate-l-invariant`, `NoncommutativeAndEquivariantIwasawa:NE.7/height-pairing-bockstein`.

**Sources.**

- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), §0.3 (from p.254): Conjecture 0.12 and note 14, p.256: the p-adic height depending on a splitting of the Hodge filtration, its regulator R_{p,α}(E), and the conjecture in the cases α ≠ 1 and α = 1
- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Theorem 0.15, p.257: Kato's lower bound on the order of vanishing and its consequence for Sha[p^∞]
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7: the Mazur–Tate–Teitelbaum conjecture as the p-adic analogue of BSD with a p-adic regulator and an ℒ-invariant in the trivial-zero case

### Trivial zeros in analytic rank zero

**Theorem** `L5/greenberg-stevens-trivial-zero`.

Let E/Q have good ordinary or multiplicative reduction at an odd prime p with L(E,1) ≠ 0. Then ord_{s=1} L_{p,α}(E, s) ∈ {0, 1}, with order one iff E has split multiplicative reduction at p (α = 1), and in that case L'_{p,α}(E, 1) = ℒ_p(E)·L(E,1)/Ω_E^+ (Greenberg–Stevens) with ℒ_p(E) ≠ 0. Consequently, if Sha(E/Q) is finite, exact MTT(E,p) and the full classical BSD formula are equivalent; with only Sha[p∞] finite, MTT_p and the p-part are equivalent in this case.

**Hypotheses.**

- L(E,1) ≠ 0
- the derivative formula is Greenberg–Stevens' theorem, requested from PadicFamilies:L3 (it uses the Mazur–Kitagawa two-variable p-adic L-function)
- nonvanishing of ℒ_p(E) is requested from DiophantineApproximationAndTranscendence:DT.5

**Proof sketch / construction.**

1. If α ≠ 1 the value at s = 1 is (1 − α^{-1})^{b+1} L(E,1)/Ω_E^+ ≠ 0 (ModularIwasawaMainConjectures:L3/msd-padic-l-function).
2. If α = 1 the value vanishes; Greenberg–Stevens gives the derivative (PadicFamilies:L3), nonzero since ℒ_p(E) ≠ 0 (DiophantineApproximationAndTranscendence:DT.5) and L(E,1) ≠ 0.
3. Compare with ModularIwasawaMainConjectures:L5/mtt-padic-bsd-conjecture in rank zero, where R_{p,α} = #E(Q)_tors⁻².

**Acceptance checks.**

- For E = 11a1 at p = 11 (split, L(E,1) ≠ 0): the p-adic L-function has a simple zero at s = 1 with derivative ℒ_11(E)/5.
- This is the trivial-zero input of RT-AREA-iwasawa-1/4(b)–(c) for RankZeroOneBSD:BSD.6.

**Direct prerequisites.** `L3/msd-padic-l-function`, `L5/tate-l-invariant`, `PadicFamilies:L3`, `DiophantineApproximationAndTranscendence:DT.5`, `L5/mtt-padic-bsd-conjecture`.

**Sources.**

- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), Remark 0.10 and Theorem 0.11, p.255; Remark 0.13(i), p.256: the trivial zero when α = 1, the Greenberg–Stevens formula L'_{p,α}(E,1) = ℒ_E L(E,1)/Ω_E^+ and the nonvanishing of ℒ_E
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7: in analytic rank zero the p-adic L-function vanishes to order 0 or 1, the extra zero is governed by local data at p, and with Sha finite the p-adic and classical BSD conjectures are equivalent
- [Christopher Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1), (2.4.3), p.15: the Greenberg–Stevens formula d/ds L_p(f,s)|_{s=1} = ℒ(V_f) L(f,1)/(−2πiΩ_f^+)

### The main conjecture implies p-adic BSD under nondegenerate heights

**Theorem** `L5/schneider-padic-bsd-from-mc`.

Let E/Q have good ordinary reduction at an odd prime p, irreducible E[p], finite Sha(E/Q)[p^∞], and a nondegenerate cyclotomic p-adic height. Use the analytic κ-height of Schneider §7, with its comparison to the height and cyclotomic coordinate in MTT_p(E,p) fixed. Assume also the flat Néron-model/Galois ordinary Selmer comparison specified below. If MMC(E,p) holds, then ord_{s=1} L_p(E,s)=rank E(Q)=r and its leading coefficient satisfies MTT_p(E,p): L_p^{(r)}(E,1)/r! ∼_p (1−α⁻¹)^2 R_p(E) · #Sha(E/Q)[p^∞] · ∏_{ℓ|N}c_ℓ(E) / #E(Q)_tors^2. Here ∼_p denotes equality up to Z_p×. This is the p-primary, up-to-unit consequence; it is not an exact MTT identity. In this display R_p is the unnormalized determinant on a basis of the free Mordell–Weil group; thus R_{p,α} of the MTT node equals R_p/#E(Q)_tors². The torsion denominator is included exactly once.

**Hypotheses.**

- good ordinary p, ρ̄ irreducible
- Sha[p^∞] finite and ⟨ , ⟩_{p,α} nondegenerate (both are hypotheses)
- MMC(E, p) (for instance from ModularIwasawaMainConjectures:L3/bcs-integral-theorem)
- The ordinary Galois Selmer characteristic series is identified with Schneider’s algebraic Iwasawa L-function using the control/comparison request to SelmerIwasawaCohomology:L3.
- The height is Schneider’s analytic κ-height, or a height equipped with a proved normalization comparison. Keep log_p κ(γ)^r when passing from X to s; that factor is not a p-adic unit.

**Proof sketch / construction.**

1. Apply Schneider §2 Theorem 2′ (p.342) and §7 Theorems 6–7 (p.371): the algebraic Iwasawa L-function has order r and leading coefficient, up to a p-adic unit, det(height)·#Sha[p∞]·∏_v#π_v(E)·#Ẽ(F_p)^2/#E(Q)_tors^2. Theorem 6 identifies the algebraic and analytic κ-heights up to sign.
2. Compare Schneider’s flat Néron-model cohomology and its alternating characteristic factors (§§1–2) with the ordinary Galois Selmer dual. Irreducibility removes global p-power torsion terms. This is the explicit supplier obligation below, rather than an assertion that the objects are definitionally equal.
3. Use #Ẽ(F_p)=(1−α)(1−p/α), so #Ẽ(F_p)^2 ∼_p (1−α⁻¹)^2, including anomalous primes. Transfer the characteristic-series leading term through MMC(E,p).
4. Schneider evaluates in the coordinate κ(γ)^{1−s}−1; the convention here uses κ(γ)^{s−1}−1. The sign contributes a unit, while the factor log_p κ(γ)^r must be matched with the regulator normalization. Use the specified height comparison to obtain the displayed MTT_p formula.

**Acceptance checks.**

- In rank zero the regulator is 1 and the coordinate logarithm has exponent zero, yielding the p-part of the rank-zero BSD expression. This does not infer the full exact BSD formula from an integral ideal equality.
- Without nondegeneracy, the order of vanishing of char(X) at the trivial character can exceed the rank.

**Direct prerequisites.** `L3/mazur-main-conjecture`, `L5/mtt-padic-bsd-conjecture`, `NoncommutativeAndEquivariantIwasawa:NE.7/height-pairing-bockstein`, `SelmerIwasawaCohomology:L3`.

**Sources.**

- [Peter Schneider, p-adic height pairings. II](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF), §2 Theorem 2′, p.342; §7 Theorems 6–7, p.371; algebraic Iwasawa L-function in §2, p.341: Finite p-primary Sha and nondegenerate height give order equal to rank and the leading coefficient with component, reduction and torsion factors; analytic/algebraic heights agree up to sign. The L-function here is algebraic.
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), Remark 2.3, p.7: under nondegeneracy of the p-adic height pairing, the p-adic IMC for elliptic curves implies the p-adic BSD conjecture, citing Schneider 1985
- [Pierre Colmez, La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf), note 14, p.256: the algebraic (Iwasawa-theoretic) and analytic p-adic heights agree, which makes the main conjecture compatible with p-adic BSD

### The modular instances of the Greenberg and Coates–Perrin-Riou propositions

**Comparison** `L5/greenberg-and-coates-perrin-riou-instances`.

Let D be an ordinary datum with trivial character and V := V_f ⊗ det ρ_f^{-1}. (1) V is p-ordinary with Greenberg filtration F^+V = V^+ ⊗ det ρ_f^{-1}, r_V = r_{V^∨} = 0 is the criticality of the relevant twists (V^∨=Hom(V,Q_p(1)) is the Tate dual), and the trivial tame-component projection of Greenberg’s proposition (SelmerIwasawaCohomology:L4/greenberg-main-conjecture) for (V,L_p(V)) is IMC_Q(D), after descending its Selmer group over F∞^+=Q(μ_{p∞})^+ to Q∞ and identifying that projected analytic function with L_f. (2) The Coates–Perrin-Riou existence proposition for V (owned by AutomorphicPadicLFunctions:L5) is satisfied by L_f: its interpolation formula at the critical twists is the Skinner–Urban formula of ModularIwasawaMainConjectures:L0/canonical-ordinary-padic-l-function with Deligne periods Ω_f^± and the modified Euler factors at p. (3) The proposition 'Greenberg's conjecture for every ordinary V' is not proved here; nor is Greenberg's μ = λ = 0 conjecture for totally real fields.

**Hypotheses.**

- ordinary datum; the Coates–Perrin-Riou proposition in the form fixed by AutomorphicPadicLFunctions:L5
- Use the trivial character of Gal(F∞^+/Q∞), whose order (p−1)/2 is a p-adic unit; the full Greenberg proposition over F∞^+ includes other tame components. V^∨ means the Tate dual, not the untwisted linear dual.

**Proof sketch / construction.**

1. (1): unwind the Greenberg Selmer group of V over the cyclotomic Z_p-extension (SelmerIwasawaCohomology:L2/greenberg-condition) as the Skinner–Urban Selmer group. Apply finite-group inflation–restriction and the tame idempotent to descend from F∞^+ to Q∞ (order prime to p); match the same component of the analytic function. The whole conjecture over F∞^+ is not identified with just its trivial component.
2. (2): compare the interpolation factor of Coates–Perrin-Riou with Skinner–Urban's e(φ) and Gauss sums (Rodrigues Jacinto–Williams Appendix B.2–B.3).

**Acceptance checks.**

- Rodrigues Jacinto–Williams Theorem B.4 (the main conjecture for f 'under mild technical hypotheses') is made explicit by the theorems of L1–L4 with their hypotheses.
- Example 13.22 of Rodrigues Jacinto–Williams (V = Q_p(n)) is the GL(1) instance, not a modular one.

**Direct prerequisites.** `SelmerIwasawaCohomology:L4/greenberg-main-conjecture`, `AutomorphicPadicLFunctions:L5`, `L0/ordinary-main-conjecture`, `L0/canonical-ordinary-padic-l-function`, `SelmerIwasawaCohomology:L3/iwasawa-shapiro`.

**Sources.**

- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), §13.5.3, Conjecture 13.21, p.71: Greenberg's conjecture for an ordinary V: corank r_V, and if r_V = r_{V^∨} = 0 the characteristic ideal is generated by the p-adic L-function of V, whose existence Coates–Perrin-Riou conjectured
- [Joaquín Rodrigues Jacinto and Chris Williams, An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2), Appendix B.2.3–B.3(1), pp.80–81: the modular instance (Theorem B.4) and the Coates–Perrin-Riou/Panchishkin existence problem for general V

### Verified weight-two examples

**Application** `L5/weight-two-examples`.

(a) E = 11a1 = [0,−1,1,−10,−20] (N = 11, Δ = −11⁵, split at 11, torsion Z/5, only 5-isogenies, Manin constant 1) at p = 7: a_7 = −2, ordinary; ρ̄ irreducible; (SU_11) holds since 7 ∤ 5; (FW1.6_11) fails (split); (LocExc_7) holds (ā_7² = 4 ≠ 1); hence L1/su-ordinary-theorem and L3/bcs-integral-theorem give MMC(11a1,7) integrally. L2/fw-pointwise-theorem also gives KMC (Theorem 5.1 form, μ trivial allowed as ρ̄|G_{Q_7} is reducible); its independent transport to MMC uses the recorded integral period comparison, while the Fouquet–Wan ordinary theorem does not apply. (b) E = 14a1 = [1,0,1,4,−6] (N = 14, Δ = −2⁶·7³, nonsplit at 2, split at 7, isogeny degrees 1, 2, 3, 6) at p = 13: a_13 = −4, ordinary; ρ̄ irreducible (no 13-isogeny); (FW1.6_2) holds since 13 ∤ 6; so ModularIwasawaMainConjectures:L1/fw-ordinary-theorem applies. (c) E = 14a1 at p = 5: a_5 = 0, supersingular, crystalline nonordinary; ρ̄_{E,5} surjective (5 is not a nonmaximal prime); ℓ = 2 nonsplit with 5 ∤ 6; hence ModularIwasawaMainConjectures:L2/fw-pointwise-theorem gives KMC, and ModularIwasawaMainConjectures:L4/llz-signed-main-conjecture with ModularIwasawaMainConjectures:L4/kobayashi-pollack-comparison gives the LLZ actual-image signed equalities. The identification with separately Néron-normalized Kobayashi–Pollack ± analytic equalities is conditional on the unit-period comparison in L4/kobayashi-pollack-comparison.

**Hypotheses.**

- the reduction types, discriminants, a_p values and isogeny data are those of the minimal models (checked by point counts and against LMFDB's curve data)

**Proof sketch / construction.**

1. Compute a_p by point counting on the minimal model, a_ℓ = ±1 at the multiplicative primes, and ord_ℓ(Δ_min); ρ̄ ramified at ℓ iff p ∤ ord_ℓ(Δ_min) (ModularIwasawaMainConjectures:L1/residual-hypothesis-predicates).
2. Irreducibility of ρ̄_{E,p}: a reducible ρ̄_{E,p} gives a rational p-isogeny, excluded by the isogeny degrees; for p odd, irreducible odd representations are absolutely irreducible.
3. Check each theorem's hypothesis list in turn, recording which theorem applies and which does not.
4. Point counts independently give a_7(11a1)=−2 and a_5(14a1)=0, a_13(14a1)=−4; the Weierstrass discriminants are −161051 and −21952. Database analytic Sha values are not used as a proof of actual Sha orders.

**Acceptance checks.**

- 11a1 at p = 7: the trivial-character value of L_p is (1 − α^{-1})²/5 ≠ 0, matching finiteness of Sel_{7^∞}(E/Q).
- 14a1 at p = 5: (A) holds as a_5 = 0; (E) holds as the 5-adic image is GL₂(Z_5).

**Direct prerequisites.** `L1/su-ordinary-theorem`, `L1/fw-ordinary-theorem`, `L2/fw-pointwise-theorem`, `L3/bcs-integral-theorem`, `L4/llz-signed-main-conjecture`, `L4/kobayashi-pollack-comparison`, `L1/residual-hypothesis-predicates`.

**Sources.**

- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 1, p.2; remark after Theorem 2, p.3: the hypotheses checked for (a), and that they hold for semistable E at good ordinary p ≥ 11
- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorems 1.6, 5.1, pp.6–7, 68: the hypotheses checked for (b) and (c)
- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), assumptions (A), (E), pp.14, 43: the signed hypotheses checked for (c)
- [The LMFDB Collaboration, Elliptic curve 11.a2 (Cremona 11a1)](https://www.lmfdb.org/EllipticCurve/Q/11/a/2), Curve 11.a2, equations, modular invariants, local data and isogenies; accessed 2026-10-19: Cremona 11a1, not LMFDB 11.a1: the displayed model, conductor, discriminant, split I5 at 11, Manin constant and cyclic isogeny degrees.
- [The LMFDB Collaboration, Elliptic curve 14.a6 (Cremona 14a1)](https://www.lmfdb.org/EllipticCurve/Q/14/a/6), Curve 14.a6, local data, Galois representations and isogenies; accessed 2026-10-19: Cremona 14a1, not LMFDB 14.a1: the displayed model, nonsplit I6 at 2, split I3 at 7 and maximal p-adic image at p=5,13.

### A higher-weight example

**Application** `L5/higher-weight-example`.

Let f = η(z)⁴η(5z)⁴ = q − 4q² + 2q³ + 8q⁴ − 5q⁵ − 8q⁶ + 6q⁷ + ⋯, the newform spanning S_4(Γ_0(5)) (a_2 = −4, a_3 = 2, a_5 = −5, a_7 = 6, a_11 = 32, a_13 = −38). At p = 7: a_7 = 6 is a 7-adic unit, so f is ordinary; (dist) holds since the residual characters are unramified and ω^{−3} ≠ 1; ρ̄ is irreducible over F_7 because the Frobenius polynomial at 2 is X²−a_2X+2³, with discriminant a_2²−4·2³=−16≡5 mod 7, a nonsquare. Oddness at p≠2 makes this rank-two irreducibility absolute; π(f)_5 is the Steinberg representation twisted by the unramified character with μ(5) = −1 (from a_5 = −5 = μ(5)·5); and the inertia-invariant line has Frobenius eigenvalue μ(5)·5^{−1} ≡ 4 ≢ 1 mod 7, so dim ρ̄^{D_5} = 0 once ρ̄ is ramified at 5. Granting the ramification at 5, ModularIwasawaMainConjectures:L1/fw-ordinary-theorem gives KMC for f at p = 7; Skinner–Urban's theorem does not apply (k = 4 ≢ 2 mod 6). At p = 13, the tested prime coefficients satisfy a_ℓ≡1+ℓ³ mod 13 and 13 divides 5⁴−1. These are diagnostics of an Eisenstein congruence, not a proof of reducibility: a complete congruence/Sturm argument and residual recognition would be needed to turn this into a non-example.

**Hypotheses.**

- the q-expansion is computed from the eta product; multiplicativity a_4 = a_2² − 8, a_6 = a_2a_3, a_25 = a_5² is checked
- ramification of ρ̄_7 at 5: by Mazur's principle in weight 4 ≤ p + 1 with 5 ≢ 1 mod 7, an unramified ρ̄ would come from S_4(SL₂(Z)) = 0; the cited level-lowering statement is listed as remaining work

**Proof sketch / construction.**

1. Compute coefficients and check the Hecke relations.
2. Check ordinarity, the nonsquare Frobenius discriminant at 2 for p=7, oddness and the local residual conditions. The claimed p=7 application remains conditional on the recorded ramification-at-5 input.
3. Check (FW1.6_5) in Fouquet–Wan's normalisation.

**Acceptance checks.**

- The p=13 calculation is a diagnostic only. Finite trace agreement must not be used to conclude reducibility; the suggested file labels it accordingly.
- Kato's divisibility (k > 2) holds here without potential good reduction (Fouquet–Wan Theorem 1.4(2)).

**Direct prerequisites.** `L1/fw-ordinary-theorem`, `L1/residual-hypothesis-predicates`, `L1/su-ordinary-theorem`.

**Sources.**

- [Olivier Fouquet and Xin Wan, The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3), Theorems 1.4 and 1.6, pp.5–7: the hypotheses checked; no congruence condition on the weight
- [Christopher Skinner and Eric Urban, The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf), Theorem 3.6.4, p.43: the weight condition k ≡ 2 mod p − 1 that excludes this example

## L6. Branch interfaces

Re-export separately owned branches in their own local-condition and analytic normalizations. In particular the multiplicative anticyclotomic endpoint does not use the good-ordinary square dictionary.

### The anticyclotomic interface

**Comparison** `L6/anticyclotomic-formulation-dictionary`.

Let E/Q, p > 3 good ordinary, K imaginary quadratic with (disc), (Heeg), (spl), Λ_K^− = Z_p[[Γ_K^−]] and Λ_K^{−,ur} = Λ_K^− ⊗̂ Ẑ_p^{ur}. The Heegner point main conjecture (char(X_ord(E/K_∞^−)_tors) = char(H¹_{F_Λ}(K, T)/(κ_1^{Heeg}))²) and the Greenberg–BDP main conjecture (char(X_Gr(E/K_∞^−)) = (L_p^{BDP}(E/K)) in Λ_K^{−,ur}) are compared through HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison (the BDP square convention, the coefficient extension to Λ_K^{−,ur}, finite local cokernels and ι), and the proved branch endpoints of HeegnerPointEulerSystems:HE.8b — rational under (irr_Q), integral under (sur) — are re-exported in these formulations. The anticyclotomic equality is over Λ_K^{−,ur}, never over Λ_K^− unless the source proves the descent; rational and integral statements stay distinct.

**Hypotheses.**

- (disc): D_K odd, ≠ −3; (Heeg): every ℓ | N splits in K; (spl): p splits in K
- the proofs belong to HeegnerPointEulerSystems:HE.8b; this node is the formulation interface only

**Proof sketch / construction.**

1. Import HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture, HE.8b/integral-heegner-main-conjecture, HE.8b/rational-greenberg-bdp-main-conjecture, HE.8b/integral-greenberg-bdp-main-conjecture.
2. Use HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison and HE.8b/bdp-function-convention-comparison for the dictionary.
3. Do not identify ideals up to units with normalised elements.

**Acceptance checks.**

- Burungale–Castella–Skinner Theorems 1.2.2/1.2.4 are the two formulations of the same theorem.
- The rank-one statements of the Heegner form require H¹_{F_Λ} and X of Λ_K^−-rank one; those are part of the imported theorems.

**Direct prerequisites.** `HeegnerPointEulerSystems:HE.8b/anticyclotomic-formulation-comparison`, `HeegnerPointEulerSystems:HE.8b/bdp-function-convention-comparison`, `HeegnerPointEulerSystems:HE.8b/rational-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/integral-heegner-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/rational-greenberg-bdp-main-conjecture`, `HeegnerPointEulerSystems:HE.8b/integral-greenberg-bdp-main-conjecture`, `L0/ordinary-main-conjecture`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.2, Conjecture 1.2.1, Theorems 1.2.2 and 1.2.4, pp.2–3: the two anticyclotomic formulations, Λ_K^{−,ur}, and the rational/integral distinction under (irr_Q)/(sur)

### The Eisenstein-prime branch interface

**Comparison** `L6/eisenstein-branch-interface`.

For E/Q and a good ordinary Eisenstein prime p (E[p] reducible), the integral cyclotomic main conjectures proved in RankZeroOneBSD:BSD.7a (Castella–Grossi–Skinner Theorems A/C and the weight-two specialisation of Keller–Yin Theorem 3.0.10) are re-exported in the formulation of ModularIwasawaMainConjectures:L3/mazur-main-conjecture for the lattice and imprimitive set used there, keeping the residual-character exclusions, the local-invariant corrections at the bad primes, the distinguished lattice and the finite-submodule corrections. The irreducible-prime theorems of L1–L3 are not used for this branch.

**Hypotheses.**

- p>2, p∤N and E[p] reducible. CGS additionally requires its isogeny-kernel character at G_p to differ from 1 and ω; KY Theorem 3.0.10 has no such exclusion and includes rational p-torsion.
- the lattice is the one of the imported theorem; change of lattice multiplies characteristic ideals by explicit powers of p

**Proof sketch / construction.**

1. Import RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture and RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture.
2. Use the imported theorem’s integral Néron-normalized analytic function directly. The irreducible-prime integrality lemma of L3/msd-padic-l-function is not available here. Compare local conditions, lattices and Euler factors only under the supplier’s actual Eisenstein hypotheses; do not invoke L5’s irreducibility-based surjectivity criterion.

**Acceptance checks.**

- 11a1 at p=5 is a good ordinary Eisenstein prime with rational 5-torsion. It is excluded from the irreducible theorems of L1–L3 and from CGS’s local exclusion, but it is included in the current KY supplier endpoint, subject to its integral Néron normalization.
- Kato's divisibility is only rational at Eisenstein primes in KatoEulerSystems:L4; integral inputs come from the imported theorems (RT-AREA-iwasawa-1/5).

**Direct prerequisites.** `RankZeroOneBSD:BSD.7a/cgs-cyclotomic-main-conjecture`, `RankZeroOneBSD:BSD.7a/ky-cyclotomic-main-conjecture`, `L3/mazur-main-conjecture`, `L5/euler-factor-change`.

**Sources.**

- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.1, p.1: integrality of L_p(E/Q) is understood under (irr_Q); the Eisenstein case is separate

### The supersingular and multiplicative anticyclotomic branch interfaces

**Comparison** `L6/supersingular-and-multiplicative-branch-interface`.

(1) The signed main conjecture of Burungale–Skinner–Tian–Wan for semistable E at good supersingular p (RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture) is re-exported in the Kobayashi formulation of ModularIwasawaMainConjectures:L4/kobayashi-pollack-comparison, with the a_p = 0, semistability and residual restrictions of the source. (2) Castella's corrected anticyclotomic main conjecture at a multiplicative prime (RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture) is re-exported as char(X_ac)Λ_{R₀}=(L_p(f)) for its own strict/unrestricted local conditions and multiplicative BDP normalization, keeping its Heegner condition, split p > 3, residual irreducibility, local types, the condition at 2 and E(Q_p)[p] = 0. Neither branch is implied by L1–L4.

**Hypotheses.**

- the hypotheses of the imported theorems
- L0/L4 supply the signed formulation only in its own range (a_p = 0 for the Kobayashi identification)

**Proof sketch / construction.**

1. Import the two RankZeroOneBSD:BSD.6a endpoints and RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison.
2. For (1) use the a_p=0 kernel dictionary of L4/kobayashi-pollack-comparison and the supplier’s integral normalization. For (2) use BSD.6a/castella-anticyclotomic-main-conjecture itself with its multiplicative local conditions; L6/anticyclotomic-formulation-dictionary assumes good ordinary reduction and is not a theorem at a multiplicative prime. No Heegner-square equivalence is imported across that boundary.

**Acceptance checks.**

- 14a1 at p=5 is semistable and supersingular, hence lies in the current BSTW supplier theorem’s stated range. Additional vanishing/non-torsion hypotheses belong to the supplier’s comparison identity, rather than its base semistable main-conjecture statement.
- The withdrawn preprints of Wan (1411.6352, 1412.1767, 1607.07729) are replaced by the published or current sources owned by the suppliers; this interface cites only those.

**Direct prerequisites.** `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture`, `RankZeroOneBSD:BSD.6a/bstw-signed-main-conjecture-comparison`, `RankZeroOneBSD:BSD.6a/castella-anticyclotomic-main-conjecture`, `L4/kobayashi-pollack-comparison`, `L6/anticyclotomic-formulation-dictionary`.

**Sources.**

- [Antonio Lei, David Loeffler and Sarah Livia Zerbes, Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3), Proposition 5.10, Corollary 5.11, pp.35–36: the identification of the LLZ signed objects with Kobayashi's for a_p = 0, which the re-export uses
- [Ashay Burungale, Francesc Castella and Christopher Skinner, Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2), §1.2, pp.2–3: the anticyclotomic formulation used for the multiplicative branch

## Coverage and remaining work

### L0: planned

The ordinary, cohomological (fundamental-line) and signed formulations, their structure theorem and the two comparisons are nodes; generic Selmer/determinant machinery is imported from SelmerIwasawaCohomology and PadicMeasuresIwasawaAlgebras.

- Supply the integral Kato-good-pair/canonical-period O-unit comparison and keep the corrected cohomological/differential period convention.
- Refine local Euler/Tamagawa bookkeeping when moving from target-level to implementation; do not discard nonunit factors.

### L1: planned

Skinner–Urban form (requested by HE.0 and BSD.0, RT-AREA-iwasawa-1/14), Fouquet–Wan 1.6 form with the §4.8 route (RT-AREA-iwasawa-1/22), the Selmer form, and Skinner's p ∥ N theorem (RT-AREA-iwasawa-1/4(a)) are nodes; the reverse divisibilities are AutomorphicCongruences L1/L2 requests.

- Install the sub-layer L1m proposed in restructure for the multiplicative-reduction theorem.
- For p = 3 in L1/skinner-multiplicative-theorem, obtain from OrdinaryAutomorphicFormsAndModularityLifting:R21.6 or PadicFamilies:L1 the Hida-family membership and congruences for p = 3 (the existing node is stated for p ≥ 5).

### L2: planned

Narrowed by RS-11: Fouquet–Wan's pointwise endpoint is imported from AutomorphicCongruences:L4; the convention dictionary, hypothesis interface and consequences are nodes.

No additional layer refinement listed; applicable packet gaps and supplier requests remain binding.

### L3: planned

Narrowed by RS-11: both BCS branches are imported from AutomorphicCongruences:L5b; the curve/form dictionary (R29.5/R29.6 and GZ.3 Manin constant, RT-AREA-iwasawa-1/17, 1/23), the Mazur–Swinnerton-Dyer function, Mazur's conjecture and the sufficient-condition lemma are nodes.

No additional layer refinement listed; applicable packet gaps and supplier requests remain binding.

### L4: planned

Narrowed by RS-11: the family endpoint is imported from AutomorphicCongruences:L4; specialisation corrections, the LLZ signed theorem, the image simplification and the Kobayashi–Pollack comparison are nodes.

- The unconditional LLZ application here is η=1; a nontrivial tame-component extension needs its own KMC input.
- Supply the integral Néron/Pollack period comparison for the final analytic ± identification.

### L5: planned

Euler-factor change, coefficient extension, μ/λ, the rank-zero converse (PAPER-SKINNER-20/3), the ℒ-invariant, MTT, Greenberg–Stevens trivial zeros, Schneider's implication and the Greenberg/Coates–Perrin-Riou instances (PAPER-RODRIGUES-JACINTO-WILLIAMS-23) and verified examples are nodes.

- Cite an applicable weight-four level-lowering statement for ramification at 5 in the higher-weight example.
- Construct the cyclotomic p-adic height and supply the flat-Selmer and height-coordinate comparison required to apply Schneider’s now-read leading-term theorem.

### L6: planned

Formulation interfaces to the separately owned anticyclotomic (HE.8b), Eisenstein (BSD.7a) and supersingular/multiplicative (BSD.6a) branches.

No additional layer refinement listed; applicable packet gaps and supplier requests remain binding.

## Explicit gaps

### G1. No owner for the p-adic height pairing of an elliptic curve

The Mazur–Tate/Schneider p-adic height ⟨ , ⟩_{p,α} on E(Q) and its regulator R_{p,α}(E) are needed to state MTT and Schneider's implication. The atlas has only Nekovář's height as a Bockstein map (NoncommutativeAndEquivariantIwasawa:NE.7/height-pairing-bockstein); the 'SelmerIwasawaCohomology, Part II: p-adic height pairings' direction accepted in the review of PAPER-DISEGNI-LIU-24 is not yet a roadmap (its design job is open). Until it exists the two nodes cite NE.7 and this gap.

Needed by: `L5/mtt-padic-bsd-conjecture`, `L5/schneider-padic-bsd-from-mc`.

### G2. Flat Néron-model and ordinary Galois Selmer comparison

Schneider’s published Theorems 2′ and 7 have now been read. Applying them to MMC still needs an explicit comparison of his alternating flat Néron-model cohomology characteristic factors with X_ord(E/Q∞), plus the normalization of the analytic κ-height relative to the MTT height and X↔s coordinate. The existing Selmer L3 duality statement does not itself provide this comparison; the added L3 request states the needed output. The node is conditional on it.

Needed by: `L5/schneider-padic-bsd-from-mc`.

### G3. Ramification at 5 in the higher-weight example

For f = η(z)⁴η(5z)⁴ at p = 7, ramification of ρ̄ at 5 follows from Mazur's principle in weight 4 ≤ p + 1 (5 ≢ 1 mod 7, S_4(SL₂(Z)) = 0); the cited level-lowering statement in weight 4 has not been fixed. The example is not used by any theorem.

Needed by: `L5/higher-weight-example`.

### G4. Iwasawa main conjectures for imaginary quadratic fields (RT-AREA-iwasawa-1/5)

The Eisenstein-prime branch interface re-exports RankZeroOneBSD:BSD.7a's integral cyclotomic theorems, which rest on Rubin's two-variable main conjecture via elliptic units, the Hida–Tilouine anticyclotomic main conjecture and Hida's μ = 0 for anticyclotomic Katz p-adic L-functions, none of which any roadmap plans. The restructure entry proposes the owning roadmap; this interface carries the gap until it exists.

Needed by: `L6/eisenstein-branch-interface`.

### G5. Canonical versus Gross periods

Deducing Fouquet–Wan Theorem 1.6 from Skinner–Urban's U(2,2) argument would need a comparison of canonical and Gross periods that, as Fouquet–Wan note (p.6), is not in the literature in the required generality. The plan does not use it: L1/fw-ordinary-theorem follows the §4.8 route owned by AutomorphicCongruences:L2, and L1/su-ordinary-theorem keeps Skinner–Urban's own hypotheses. Any alternative route through the comparison must first supply it.

Needed by: .

### G6. Integral Kato-good-pair versus canonical-period comparison

The cited Kato L3 period quotient is algebraic, and the modular-symbol supplier supplies saturated lattices. Neither cited statement proves that Kato’s good pair for the dual lattice yields the same integral canonical normalization up to O× in every weight (factorials, congruence factors and dual lattices must be tracked). L1/fw-ordinary-selmer-form is explicitly conditional on this comparison; the direct Skinner–Urban theorem retains its own canonical normalization.

Needed by: `L0/canonical-ordinary-padic-l-function`, `L0/ordinary-cohomological-comparison`, `L1/fw-ordinary-selmer-form`, `L2/fw-ordinary-and-signed-consequences`.

### G7. Hida congruences at p=3 for the multiplicative theorem

Skinner’s Theorem A is valid for p≥3, but the imported R21.6 ordinary-family membership theorem is stated for p≥5. The p=3 family, good-ordinary approximants and compatible principal-ideal congruences are an additional supplier obligation, not an application of that p≥5 statement.

Needed by: `L1/skinner-multiplicative-theorem`.

### G8. Nontrivial tame components of the signed theorem

Fouquet–Wan’s pointwise theorem in this packet supplies KMC^{η=1}. Its trivial-nebentypus range does not automatically include f⊗η for nontrivial η. LLZ Theorem 6.5 further restricts i=2 to η=1. The proven signed application is restricted accordingly; any wider component theorem needs its own compatible KMC input.

Needed by: `L4/llz-signed-main-conjecture`.

### G9. Integral Pollack-period normalization

LLZ Proposition 5.10/Corollary 5.11 give units in Λ_E and equality of Coleman kernels. Restriction to the integral domain transports the actual image lattices and zeta quotients, but identification with a separately Néron-normalized Pollack L-function must still track the period scalar. The node claims that final integral analytic equality only under the unit comparison.

Needed by: `L0/signed-main-conjecture`, `L4/kobayashi-pollack-comparison`, `L5/weight-two-examples`.

## Supplier requests

### R1. `AutomorphicCongruences:L1`

Skinner–Urban's GU(2,2) reverse divisibility in its source range: for p ≥ 3, f ∈ S_k(Γ_0(N)) ordinary with trivial character, k ≡ 2 mod p − 1, (irred), (dist), p ∤ N, and an imaginary quadratic K with p split, the prime divisors of N/q split and q inert for a prime q ∥ N at which ρ̄ ramifies: Ch^Σ(f)·Ch^Σ(f ⊗ χ_K) ⊂ (L_f^Σ L_{f⊗χ_K}^Σ) for Σ ⊇ {ℓ | pND_K} (Skinner–Urban Theorem 3.6.1 and Corollary 3.6.3, pp.41–42), with the integral form requiring only (irred) and the rank-one unipotent element (Skinner 2016 §2.5). Export it in the normalisation of ModularIwasawaMainConjectures:L0/ordinary-selmer-dual and L0/canonical-ordinary-padic-l-function.

Needed by: `L1/su-ordinary-theorem`.

### R2. `AutomorphicCongruences:L2`

Fouquet–Wan §4.8's reverse divisibility for Theorem 1.6: for p > 2, f ∈ S_k(Γ_0(N)), p ∤ N, k ≥ 2, ρ̄_f absolutely irreducible, some ℓ ∥ N with dim ρ̄^{I_ℓ} = 1 and dim ρ̄^{G_ℓ} = 0 (cohomological normalisation), and the ordinary filtration with χ̄₁ ≠ χ̄₂: char(H¹(Z[1/p], T ⊗ Λ_Iw)/Λ_Iw·z(f)_Iw) | char(H²(Z[1/p], T ⊗ Λ_Iw)), proved through the GU(3,1) divisibility (Fouquet–Wan Theorem 7.32), Beilinson–Flach explicit reciprocity and Poitou–Tate as in Castella–Wan Theorem 3.8 extended to weight k, with the Kato twist/factor separation. This is RS-11's owner record; no canonical/Gross period comparison is to be assumed.

Needed by: `L1/fw-ordinary-theorem`.

### R3. `AutomorphicCongruences:L4`

Fouquet–Wan's pointwise and universal-family endpoints exactly as in Theorems 5.1–5.2 (and 1.7–1.8): (pointwise) for p ≥ 3, ρ̄ absolutely irreducible and odd with (ρ̄|G_{Q_p})^{ss} ≠ χ̄ ⊕ χ̄χ̄_cyc, ℓ ≠ p with ρ̄|D_ℓ a ramified extension 0 → μχ̄_cyc^{1−k/2} → ρ̄ → μχ̄_cyc^{−k/2} → 0 (μ unramified quadratic, nontrivial if ρ̄|G_{Q_p} is irreducible), and f ∈ S_k(Γ_0(Np^r)) with ρ̄_f ≅ ρ̄, ℓ ∥ N: the zeta morphism gives Δ_{O_Iw}(T(f)_Iw) ≅ O_Iw; (family) triv_{z_Σ} : Δ_Σ(T_Σ) ≅ Λ over the regular subring Λ ≅ O[[X₁,X₂,X₃]]. The scalar case is already excluded by the determinant argument in the remark after Theorem 5.1, p.69; no added hypothesis is requested.

Needed by: `L2/fw-pointwise-theorem`, `L4/fw-universal-family-theorem`.

### R4. `PadicMeasuresIwasawaAlgebras:L1`

The completed group rings O[[Γ]], O[[G_∞]] with the involution g ↦ g^{-1}, the identification O[[Γ]] ≅ O[[X]] by γ ↦ 1 + X, and Λ(G_∞) ≅ O[Δ][[Γ]] (the atlas supplier PadicMeasuresIwasawaAlgebras L1).

Needed by: `L0/modular-iwasawa-datum`.

### R5. `PadicMeasuresIwasawaAlgebras:L4`

charIdeal and charDivisor over Λ = O[[X]] with multiplicativity in exact sequences, pseudo-isomorphism invariance, base change along O → O', the isotypic decomposition over Λ(Δ × Γ), μ- and λ-invariants and Weierstrass preparation (the atlas supplier PadicMeasuresIwasawaAlgebras L4).

Needed by: `L0/ordinary-main-conjecture`, `L0/kato-main-conjecture`, `L0/signed-main-conjecture`, `L5/euler-factor-change`, `L5/coefficient-extension-invariance`, `L5/mu-lambda-comparison`.

### R6. `PadicMeasuresIwasawaAlgebras:L5`

Determinant lines of perfect complexes over Λ and their compatibility with base change and specialisation, and topological Nakayama for compact Λ-modules (the atlas supplier PadicMeasuresIwasawaAlgebras L5).

Needed by: `L0/ordinary-selmer-dual`, `L0/iwasawa-fundamental-line`, `L4/family-specialization-corrections`.

### R7. `PadicFamilies:L3`

Greenberg–Stevens (Invent. Math. 111 (1993), Theorem 7.1): for E/Q with split multiplicative reduction at p, L'_{p,α}(E,1) = ℒ_p(E)·L(E,1)/Ω_E^+ (Colmez Theorem 0.11), via the Mazur–Kitagawa two-variable p-adic L-function; the same request is made by RankZeroOneBSD:BSD.0 (RT-AREA-iwasawa-1/4(b)).

Needed by: `L5/greenberg-stevens-trivial-zero`.

### R8. `DiophantineApproximationAndTranscendence:DT.5`

Barré-Sirieix–Diaz–Gramain–Philibert (1996): for E/Q with split multiplicative reduction at p, the Tate parameter q_E is transcendental, hence log_p(q_E) ≠ 0 and ℒ_p(E) ≠ 0 (Colmez Remark 0.13(i)); the same request is made by RankZeroOneBSD:BSD.0 (RT-AREA-iwasawa-1/4(c)).

Needed by: `L5/tate-l-invariant`, `L5/greenberg-stevens-trivial-zero`.

### R9. `tauceti:TauCetiRoadmap/EllipticCurves#layer-4-elliptic-curves-over-local-fields--reduction-tates-algorithm-the-tate-curve-aec-vii-ataec-ivv`

The Tate curve for split multiplicative E over Q_p: q_E with |q_E|<1, uniformization E(Q̄_p)≅Q̄_p×/q_E^Z and ord_p(q_E)=ord_p Δ_min. Separately, for E multiplicative at ℓ≠p, E[p] is ramified at ℓ iff p does not divide ord_ℓ Δ_min (after the unramified quadratic splitting twist when needed). The second statement is an inertia criterion away from the coefficient prime, not q_E being a p-th power over the original local field. Current TauCeti already has the formal curve and its specialization (TauCeti.tateCurve and TauCeti.tateCurveAt); reuse those on a future baseline rather than reconstructing them. The requested extra output is point uniformization and the arithmetic local criterion.

Needed by: `L1/residual-hypothesis-predicates`, `L5/tate-l-invariant`.

### R10. `AutomorphicPadicLFunctions:L5`

The Coates–Perrin-Riou/Panchishkin existence proposition for an ordinary V attached to a motive (realisation, critical set, Deligne periods, refinement and interpolation factors), in the form against which L_f of a weight-k ordinary newform can be checked (RS-11: I.L5 imports it).

Needed by: `L5/greenberg-and-coates-perrin-riou-instances`.

### R11. `PadicFamilies:L1`

At p=3 as well as p≥5, supply the Hida-family approximation used in Skinner 2016 §3.1, pp.18–19: for an ordinary weight-two p-new f of tame level N/p with irreducible residual representation and a ramified q∥N, q≠p, choose ordinary good-at-p forms f_m of weights k_m≡2 mod (p−1)p^m with congruent representations mod p^m and (L_f^Σ,p^m)=(L_{f_m}^Σ,p^m). Keep canonical-period unit choices and the local Selmer congruence hypotheses.

Needed by: `L1/skinner-multiplicative-theorem`.

### R12. `SelmerIwasawaCohomology:L3`

For E/Q good ordinary at odd p with irreducible E[p], compare the ordinary Galois Selmer dual with the alternating flat Néron-model cohomology characteristic factors used in Schneider, p-adic height pairings II, §2 pp.340–342. Track global H⁰/H² factors, local component factors and #Ẽ(F_p)^2. Export the characteristic-series leading-term interpretation for Theorem 7 (p.371), with analytic κ-height and the factor log_p κ(γ)^r under X=κ(γ)^{±(s−1)}−1. Height construction remains with the proposed height-pairing Part II.

Needed by: `L5/schneider-padic-bsd-from-mc`.

### R13. `ArithmeticGaloisRepresentations:R01.6`

Supply Serre’s lifting lemma in the Tate-module image interface: p≥5 and H a closed subgroup of SL₂(Z_p) reducing onto SL₂(F_p) imply H=SL₂(Z_p). Together with the Weil-pairing determinant, a closed subgroup of GL₂(Z_p) reducing onto GL₂(F_p) has full image when its determinant is Z_p×. LSTX arXiv:1607.04698v2 §1 p.1 states the rank-two input and points to Serre IV.3.4 Lemma 3; its Theorem 1 is the higher-dimensional result.

Needed by: `L3/surjective-implies-rank-one-image`.

## Restructuring proposals

RT-AREA-iwasawa-1/4(a) asks for Skinner's Theorem A for p ∥ N as a layer beside L1. It is planned as ModularIwasawaMainConjectures:L1/skinner-multiplicative-theorem with parent L1.

Add a sub-layer ModularIwasawaMainConjectures:L1m 'Multiplicative reduction at p (Skinner)', requiring L1 and PadicFamilies:L1, containing L1/skinner-multiplicative-theorem; RankZeroOneBSD:BSD.6 consumes L1m for its p ∥ N bullet.

RT-AREA-iwasawa-1/5: the Eisenstein-prime branch rests on Iwasawa main conjectures for imaginary quadratic fields (Rubin's two-variable theorem via elliptic units, Hida–Tilouine Theorem 0.3, Hida's μ = 0) and on Wüthrich's integral Kato divisibility, which no roadmap plans.

Create a roadmap 'Elliptic units and the Iwasawa main conjectures for imaginary quadratic fields' (elliptic units and their Euler system, Rubin 1991/1994, Hida–Tilouine anticyclotomic form, Hida's μ = 0), importing the Katz p-adic L-function from AutomorphicPadicLFunctions:L3, Euler systems over K from EulerSystemsAndKolyvaginSystems ES.3/ES.8 and ComplexMultiplicationAndExplicitReciprocity CM.1–CM.4; add Wüthrich's integral divisibility to KatoEulerSystems:L4; link both to RankZeroOneBSD:BSD.7a and HeegnerPointEulerSystems:HE.7s; ModularIwasawaMainConjectures:L6/eisenstein-branch-interface then cites them.

## Handed red-team findings

| Finding | Disposition |
|---|---|
| RT-AREA-iwasawa-1/4 | (a) L1/skinner-multiplicative-theorem with sub-layer proposal L1m; (b) Greenberg–Stevens requested from PadicFamilies:L3 and used in L5/greenberg-stevens-trivial-zero; (c) BDGP transcendence requested from DiophantineApproximationAndTranscendence:DT.5 and used in L5/tate-l-invariant. |
| RT-AREA-iwasawa-1/5 | Recorded as a gap on L6/eisenstein-branch-interface and as a restructure proposal for a roadmap on elliptic units and imaginary-quadratic main conjectures. |
| RT-AREA-iwasawa-1/14 | L1/su-ordinary-theorem is the Skinner–Urban/Skinner Theorem A (p ∤ N) form with its own route; L1/fw-ordinary-theorem keeps FW 1.6. In Fouquet–Wan's cohomological normalisation the extra condition dim ρ̄^{G_ℓ} = 0 excludes, in weight two, every split multiplicative auxiliary prime (not only those with ℓ ≡ 1 mod p, which is the homological reading). |
| RT-AREA-iwasawa-1/17 | L3/curve-form-lattice-dictionary imports GrossZagierAndArithmeticHeights:GZ.3/manin-integrality-and-p-unit and keeps every nonunit factor. |
| RT-AREA-iwasawa-1/22 | L1/fw-ordinary-theorem follows FW §4.8 (GU(3,1) Theorem 7.32, Beilinson–Flach reciprocity, Poitou–Tate, Castella–Wan Theorem 3.8 in weight k) owned by AutomorphicCongruences:L2; the Skinner–Urban U(2,2) route is the separate L1/su-ordinary-theorem with SU's weight condition, so Wan 2015 is not needed; the canonical/Gross comparison is a recorded gap. |
| RT-AREA-iwasawa-1/23 | L3/curve-form-lattice-dictionary has EllipticCurveModularity:R29.5/modular-parametrisation and R29.6/modularity-theorem as prerequisites. |

## Source findings reviewed

The following are version-scoped mathematical descriptions in our own words. A rejected finding is retained as a review record, not presented as a source mistake. The exact reviewed copies are listed below.

### ModularIwasawaMainConjectures/E1: rejected

arXiv:2107.13726v3, Theorem 1.7 (p.7) and Theorem 5.1 (p.68), against Theorem 1.1 (p.3) and Assumption 2.1(2) (p.17)

The original allegation of a missing scalar exclusion is rejected. No extra hypothesis is to be added.

The remark immediately after Theorem 5.1 (v3, p.69) explicitly explains the omission: trivial nebentypus and even weight give det ρ̄ = χ̄_cyc^(1−k), an odd power. A scalar local semisimplification would have square determinant on tame inertia; the odd exponent is not a square character since p−1 is even. No extra scalar hypothesis or gap is needed.

### ModularIwasawaMainConjectures/E2: confirmed

arXiv:2107.13726v3, §1, paragraph after Theorem 1.1, p.3

The inertia-invariant line is the sub-line μχ̄_cyc^{1−k/2} (cohomological normalisation, as in Theorem 1.7), whose arithmetic Frobenius eigenvalue is μ(ℓ)ℓ^{1−k/2}; for k = 4 and ℓ ≡ −1 mod p with μ(ℓ) = −1 the eigenvalue is 1, and with μ(ℓ) = 1, ℓ ≢ 1 mod p it is not.

Correction or disposition: The equivalence holds in weight two. In general, with ρ̄|D_ℓ a ramified extension of μχ̄_cyc^{−k/2} by μχ̄_cyc^{1−k/2}, the condition dim ρ̄^{D_ℓ} = 0 means μ(ℓ)ℓ^{1−k/2} ≢ 1 mod ϖ, which neither implies nor is implied by μ(ℓ) = −1 when k > 2.

Review: In the cohomological normalization the inertia-fixed line has Frobenius μ(ℓ)ℓ^{1−k/2}, so absence of fixed vectors is the noncongruence of that eigenvalue to 1, not merely μ(ℓ)=−1. The weight-four tests in the finding distinguish them. The theorem statements retain their own hypotheses; this finding concerns the explanatory equivalence in the arXiv v3 remark only.

Known correction: new

Search scope: arXiv v3 text read 18 October 2026; the theorems themselves are stated with their own hypotheses, so only the remark is affected; bounded web search found no correction.

### ModularIwasawaMainConjectures/E3: confirmed

arXiv:2107.13726v3, Theorem 1.6 and the preceding paragraph, p.6

In the authors' copy of Skinner–Urban the ordinary main-conjecture statement is Theorem 3.6.4 (p.43), announced as Theorem 1 (Theorem 3.6.4) on p.2; the two numbers in Fouquet–Wan also disagree with each other. This does not establish which number in the 277-page published text was intended.

Correction or disposition: The two locators disagree internally. In the 226-page Skinner–Urban author copy actually read, the ordinary equality is Theorem 3.6.4 (p.43), deduced from Theorem 3.6.1 and Corollary 3.6.3; use that version-specific locator.

Review: Confirmed the incompatible 3.19/3.29 citations on Fouquet–Wan v3 p.6 and the 3.6.4 statement in the Skinner–Urban author copy. The correction is scoped to those texts; the Springer endpoint served an HTML challenge, so published numbering remains uncollated.

Known correction: new

Search scope: Skinner–Urban authors' copy (Columbia), §§1 and 3.6, read 18 October 2026; the published Invent. Math. numbering was not compared.

### ModularIwasawaMainConjectures/E4: confirmed

arXiv:2107.13726v3, proof of Lemma 3.13, p.26

Over Z_p, g=[[1,1],[p,1+p]] has determinant 1 and reduces to a nonidentity unipotent, but det(g−1)=−p, so ker(g−1)=0 and coker(g−1)≅Z_p/p. This refutes the matrix inference, not the main theorem. The corrected local proof uses a lift with (g−1)^2=0.

Correction or disposition: Residual unipotence alone does not give this kernel rank. Choose an actual nontrivial inertial unipotent at the ramified ℓ∥N prime, as in Skinner §2.5 pp.15–16 and L1/unipotent-rank-one-quotient, or provide another rank-one-image argument.

Review: Over Z_p, g=[[1,1],[p,1+p]] has determinant 1 and reduces to a nonidentity unipotent, but det(g−1)=−p, so ker(g−1)=0 and coker(g−1)≅Z_p/p. This refutes the matrix inference, not the main theorem. The corrected local proof uses a lift with (g−1)^2=0.

Known correction: new

Search scope: Read arXiv v3 Lemma 3.13 and Skinner 2016 §2.5 on 2026-10-19; Bounded web searches on 2026-10-19 for Fouquet Wan Lemma 3.13 correction and 2107.13726 erratum found no correction; the Castella erratum returned by the search concerns another paper. No exhaustive novelty claim.

### ModularIwasawaMainConjectures/E5: confirmed

arXiv:2107.13726v3, proof of Lemma 3.13, p.26, the complex C and its cohomology

Cohomology of a complex of fraction-field vector spaces is a vector space over that field; integral torsion modules cannot be identified with it before tensoring. The surrounding proof makes the intended acyclicity conclusion clear.

Correction or disposition: Either define C using T_{λ,Iw} and tensor only in the final step, or tensor the displayed cohomology groups with Frac(O_Iw). The packet uses the former integral cone and a separate rational acyclicity assertion.

Review: Cohomology of a complex of fraction-field vector spaces is a vector space over that field; integral torsion modules cannot be identified with it before tensoring. The surrounding proof makes the intended acyclicity conclusion clear.

Known correction: new

Search scope: Read the arXiv v3 proof on 2026-10-19 and searched 2107.13726 erratum; no matching correction was found by this bounded search.

### ModularIwasawaMainConjectures/E6: confirmed

Skinner–Urban author copy §1.1 pp.1–2 and §3.4.4 p.38; corrected by Skinner arXiv:1407.1093v1 §2.4 footnote 6 p.14

Skinner’s equation (2.4.1) and footnote 6 explicitly give the correction and explain the difference between the two period conventions. In weight two the Néron-period ratio must compare Ω_E with P_f.

Correction or disposition: Use (−2πi)^{m+1} Ω_f. Equivalently, set the differential period P_f=−2πiΩ_f and keep (−2πi)^m P_f.

Review: Skinner’s equation (2.4.1) and footnote 6 explicitly give the correction and explain the difference between the two period conventions. In weight two the Néron-period ratio must compare Ω_E with P_f.

Known correction: Skinner, Multiplicative reduction and the cyclotomic main conjecture for GL2, §2.4 equation (2.4.1) and footnote 6 (arXiv v1 p.14)

Search scope: Read the Skinner–Urban 226-page author copy at these formulas and Skinner’s correcting footnote on 2026-10-19. The published Skinner–Urban numbering was not collated.

## Sources and versions

PDF locators above refer to the listed copy’s page numbering, not an unread version of record. The packet records SHA-256 values for the downloaded PDFs and database records. All sources used for this review are publicly readable.

- **fw-2107.13726v3**: Olivier Fouquet and Xin Wan, [The Iwasawa Main Conjecture for universal families of modular motives](https://arxiv.org/abs/2107.13726v3). arXiv:2107.13726v3 (8 April 2022), 103 pp.; read 2026-10-18; independently checked at the cited locators 2026-10-19.
- **su-2014-author**: Christopher Skinner and Eric Urban, [The Iwasawa main conjectures for GL2](https://www.math.columbia.edu/~urban/eurp/MC.pdf). Invent. Math. 195 (2014), 1–277; authors' copy (226 pp.) on E. Urban's Columbia page, read 2026-10-18; page numbers below are those of this copy; independently checked at the cited locators 2026-10-19.
- **skinner-2016-arxiv**: Christopher Skinner, [Multiplicative reduction and the cyclotomic main conjecture for GL2](https://arxiv.org/abs/1407.1093v1). Pacific J. Math. 283 (2016), 171–200; arXiv:1407.1093v1 (4 July 2014), 26 pp., read 2026-10-18; page numbers are those of the arXiv PDF; independently checked at the cited locators 2026-10-19.
- **skinner-2020-arxiv**: Christopher Skinner, [A converse to a theorem of Gross, Zagier, and Kolyvagin](https://arxiv.org/abs/1405.7294). Ann. of Math. 191 (2020), 329–354; arXiv:1405.7294v1 (28 May 2014), read 2026-10-18; independently checked at the cited locators 2026-10-19.
- **bcs-2405.00270v2**: Ashay Burungale, Francesc Castella and Christopher Skinner, [Base change and Iwasawa main conjectures for GL2](https://arxiv.org/abs/2405.00270v2). arXiv:2405.00270v2 (18 March 2025), 12 pp., read 2026-10-18; independently checked at the cited locators 2026-10-19.
- **llz-0912.1263v3**: Antonio Lei, David Loeffler and Sarah Livia Zerbes, [Wach modules and Iwasawa theory for modular forms](https://arxiv.org/abs/0912.1263v3). Asian J. Math. 14 (2010), 475–528; arXiv:0912.1263v3 (18 October 2010), 45 pp., read 2026-10-18; theorem numbers are those of arXiv v3; independently checked at the cited locators 2026-10-19.
- **rjw-2309.15692v2**: Joaquín Rodrigues Jacinto and Chris Williams, [An introduction to p-adic L-functions](https://arxiv.org/abs/2309.15692v2). arXiv:2309.15692v2 (19 December 2024), 85 pp., read 2026-10-18; page numbers are those of arXiv v2; independently checked at the cited locators 2026-10-19.
- **kato-2004-asterisque-295**: Kazuya Kato, [p-adic Hodge theory and values of zeta functions of modular forms](https://www.numdam.org/item/AST_2004__295__117_0.pdf). Astérisque 295 (2004), 117–290; Numdam AST_2004__295__117_0, read 2026-10-18; printed page numbers; independently checked at the cited locators 2026-10-19.
- **rubin-euler-systems**: Karl Rubin, [Euler systems](https://swc-math.github.io/notes/files/99RubinES.pdf). Annals of Mathematics Studies 147, Princeton 2000; author's draft hosted on the SWC notes page (187 pp.), read 2026-10-18; printed page numbers; independently checked at the cited locators 2026-10-19.
- **colmez-bourbaki-919**: Pierre Colmez, [La conjecture de Birch et Swinnerton-Dyer p-adique](https://www.numdam.org/item/SB_2002-2003__45__251_0.pdf). Séminaire Bourbaki exposé 919 (2002–2003), Astérisque 294 (2004), 251–319; Numdam SB_2002-2003__45__251_0, read 2026-10-18; independently checked at the cited locators 2026-10-19.
- **schneider-1985-published**: Peter Schneider, [p-adic height pairings. II](https://ivv5hpp.uni-muenster.de/u/pschnei/publ/pap/heightII.PDF). Invent. Math. 79 (1985), 329–374; author-hosted journal scan, read 2026-10-19; printed page numbers.
- **lstx-1607.04698v2**: Aaron Landesman, Ashvin A. Swaminathan, James Tao and Yujie Xu, [Lifting subgroups of symplectic groups over Z/ℓZ](https://arxiv.org/abs/1607.04698v2). arXiv:1607.04698v2; read 2026-10-19.
- **lmfdb-11.a2**: The LMFDB Collaboration, [Elliptic curve 11.a2 (Cremona 11a1)](https://www.lmfdb.org/EllipticCurve/Q/11/a/2). Curve record accessed 2026-10-19; database evidence, not a formal certificate.
- **lmfdb-14.a6**: The LMFDB Collaboration, [Elliptic curve 14.a6 (Cremona 14a1)](https://www.lmfdb.org/EllipticCurve/Q/14/a/6). Curve record accessed 2026-10-19; database evidence, not a formal certificate.

Findings E1–E5 refer only to arXiv v3. A bounded publication/errata search found preprint citations and no version of record; no finding is asserted about an unread published version.

The Springer PDF endpoint for DOI 10.1007/s00222-013-0448-1 returned an HTML browser challenge on 2026-10-19. E3 and E6 are scoped to the 226-page author copy and do not assert a published theorem number.

## Suggested Lean file

The companion [suggested file](../suggested/ModularIwasawaMainConjectures.lean) states the light interfaces available at the pins. Heavy Galois, Selmer, p-adic L-function and determinant objects remain reader targets; no sorry-filled data definition stands in for them. It elaborated at the pinned build on 2026-10-19 with exactly eight existing declaration-uses-sorry warnings and no errors or other warnings. The integral matrix counterexample and the mod-7 nonsquare computation added during review are closed examples. This checks the prototype’s elaboration, not the mathematical proof endpoints.
