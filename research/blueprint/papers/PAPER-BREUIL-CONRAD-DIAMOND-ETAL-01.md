# PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01: Breuil–Conrad–Diamond–Taylor, *On the modularity of elliptic curves over Q: wild 3-adic exercises*

Christophe Breuil, Brian Conrad, Fred Diamond and Richard Taylor, J. Amer. Math. Soc. 14 (2001), no. 4, 843–939, [doi:10.1090/S0894-0347-01-00370-8](https://doi.org/10.1090/S0894-0347-01-00370-8). Read: the published PDF from the AMS (97 pages, SHA-256 `1e34130e…4cf2`), fetched 29 September 2026. Crossref records no update or erratum for the DOI (checked 29 September 2026).

Extraction by Claude Code, session `cc-fb70e5`, 29 September 2026 (issue #4510). Status: **complete**. `check_paper.py` passes.

The extraction has 126 items: 12 planned and 114 missing; the pinned libraries have none of them. Every missing item is routed once, along nine routes (two Part II and seven source routes). These counts include the independent review's corrections (last section).

## What the paper proves

**Main theorems.**
- **Theorem A (= Theorem 2.2.2).** Every elliptic curve over Q is modular.
- **Theorem B (= Theorem 2.2.1).** Every absolutely irreducible ρ̄ : G_Q → GL₂(F̄₅) with cyclotomic determinant is modular.

Theorem A follows from Theorem B and [CDT, Theorem 7.2.4]. That is the three-case argument of the introduction: mod 5, then mod 3 via Langlands–Tunnell, then three exceptional j-invariants.

**The proof of Theorem B.** After a quadratic twist, ρ̄|_{G₃} is either tamely ramified or one of five explicit wild shapes (the f = 27, 81 and 243 cases of the introduction). In each case the proof finds an elliptic curve E/Q with:
- E[5] ≅ ρ̄;
- ρ̄_{E,3} surjective;
- ρ̄_{E,3}|_{G₃} of a chosen très ramifié shape.

The ingredients are Manoharmayum's curves over Q₃ (extended in §2.3), the curve X_ρ̄ of Shepherd-Barron–Taylor and Ekedahl's Hilbert irreducibility. Then ρ_{E,3} is potentially Barsotti–Tate of one of the wild types τ₁, τ₋₁, τ₃, τ₋₃, or of an extended type τ′_i (§2.1). Langlands–Tunnell makes ρ̄_{E,3} modular. The lifting Theorems 1.4.1 and 1.4.2 then make ρ_{E,3} modular, provided the type "admits" ρ̄ and is weakly acceptable for it.

**Types and admittance (§§1, 3).**
- The paper attaches to each (extended) type τ a representation σ_τ of GL₂(Z_ℓ), U₀(ℓ) or its normaliser (after Gérardin). Lemma 1.2.1 shows that σ_τ detects the type of an admissible representation.
- "τ admits ρ̄" means that a Jordan–Hölder constituent of the reduction of σ_τ matches ρ̄. "Simply admits" means this happens with multiplicity one.
- Conjecture 1.3.1 predicts that admittance ⇔ R^D ≠ 0 and that simple admittance ⇔ acceptability, a precursor of Breuil–Mézard.
- §3 checks admittance for the wild types by Brauer characters.

**Weak acceptability (§§4–9).** This is the bulk of the paper: Theorems 2.1.2, 2.1.4 and 2.1.6.
- **§4.** Each type ring R^D is bounded by a deformation problem S defined by finite flat group schemes with descent data that are killed by 3. Uniqueness of models and Σ-filtrations are in §§4.1–4.2. Tate's theorem shows R_{V,O} → R^D factors through R^{ε,S} (§§4.4–4.6). The tangent space bound dim H¹_S(G₃, ad⁰ρ̄) ≤ 1 is reduced to the vanishing of maps θ₀, θ₁, θ_ω (§4.7).
- **§5.** Breuil modules killed by ℓ, and descent data as semilinear operators on them (Theorem 5.6.1).
- **§6.** The explicit local fields F′₁, F′₋₁, F′_{±3}, F′_i.
- **§§7–9.** Rank-one, rank-two and rank-three computations of Breuil modules with descent data. For τ′_i there are four candidate models (r, s). Three of them give R ≅ F₃[[T]] (Corollary 4.6.4), which forces characteristic-zero points into the fourth.

**§10** lists the authors' corrigenda to [CDT], including two significant errors in [CDT, §6.2] and their repair.

## What the atlas already has

- **EllipticCurveModularity** proves Theorem A by a different route: Khare–Wintenberger's strong Serre conjecture (R29.2) at infinitely many primes, a fixed newform (R29.3) and the final theorem (R29.6).
- **ClassicalSerreModularity** plans Serre's conjecture (R26–R27), and Theorem B is a case of R27.6.
- Kisin's potentially semistable deformation rings with fixed inertial type are LocalGaloisDeformationRings R08.3. The paper's R^D is their Barsotti–Tate case, and Conjecture 1.1.1 is Kisin's characterisation of their points.
- Finite flat group schemes and their classification with descent data are FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1 and R07.4.
- Potentially Barsotti–Tate lifting is GL2ModularityLifting R22.5.
- Local Langlands for GL₂ with wild cases is GL2AutomorphicRepresentationsAndTransfer R16.3, and Langlands–Tunnell is R17.5.
- Breuil–Mézard multiplicities are PadicLocalLanglandsForGL2Qp R30.5.

Nothing in the atlas plans the following:
- the wild 3-adic types and their weak acceptability;
- the deformation problems cut out by group schemes with descent data;
- the Breuil-module computations of §§6–9;
- the mod-3/mod-5 switching with prescribed 3-adic behaviour.

The pinned declaration index (Mathlib 082e2d3, Tau Ceti f790474) has nothing on Breuil modules, Barsotti–Tate or finite flat group schemes over local rings, Weil–Deligne representations, deformation rings or modularity of Galois representations. The only hits for these words are unrelated: a finite-flat centre of SL_n, Cartan–Dieudonné and modular character tables.

## Routes

1. **Part II of EllipticCurveModularity: EllipticCurveModularityWild3Adic** (62 items), titled "Modularity and modular parametrisations of elliptic curves over Q, Part II: the wild 3-adic route of Breuil–Conrad–Diamond–Taylor".
   - It carries §2 (types, the §2.1 theorems, §2.3), §3, §§4.4–4.7 and §§6–9.
   - Its final theorems are the weak acceptability Theorems 2.1.2, 2.1.4 and 2.1.6, with Theorems B and A as a second proof of the statements R27.6 and R29.6 plan.
   - The maintainer's note asks for the paper to be routed to the Serre-modularity roadmaps, whose second target is Theorem A. The route extends that target's roadmap rather than a new one, because the proof method (wild types instead of Khare–Wintenberger) is new to the atlas.
   - make_queue folds it with the sibling Part IIs of EllipticCurveModularity into DESIGN-EllipticCurveModularityPartII.
2. **Source: EllipticCurveModularity R29.6.** The introduction's six equivalent forms of modularity, and Theorem A as the statement R29.6 must match.
3. **Source: ClassicalSerreModularity R26.1, R27.6.** "Modular" and "strongly modular" for residual representations, and Theorem B as the ℓ = 5, cyclotomic-determinant case of Serre's conjecture.
4. **Source: FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1, R07.4** (43 items).
   - §§4.1–4.2: models with descent data, sup/inf, Σ-filtrations and Ext¹ injectivity.
   - §5: Breuil modules killed by ℓ, the monodromy operator, rank-one and rank-two classification, syntomic construction, base change, descent data, Lemma 5.7.1.
5. **Source: LocalGaloisDeformationRings R08.3, R08.6.** ℓ-types, the type quotients R^D, (weak) acceptability, Conjecture 1.1.1, and the functors D^S with tangent spaces H¹_S.
6. **Source: GL2ModularityLifting R22.5.** Theorems 1.4.1–1.4.2 (lifting for arbitrary (extended) types under admittance and weak acceptability) and the [CDT] corrigenda of §10.
7. **Part II: SmoothRepresentationsPartII** (coalescing with the accepted Part II of Smooth representations of local groups). σ_τ, σ_{τ′} and Lemma 1.2.1. The extraction routed them to GL2AutomorphicRepresentationsAndTransfer R16.3; the review moved them to the accepted owner of types.
8. **Source: PadicLocalLanglandsForGL2Qp R30.2, R30.5.** Admittance, the mod-ℓ representations of GL₂(Z_ℓ), U₀(ℓ) and its normaliser, and Conjecture 1.3.1.
9. **Source: InverseGaloisAndArithmeticFundamentalGroups IG.2.** Ekedahl's effective Hilbert irreducibility theorem, used in the proof of Theorem 2.2.1 (added by the review).

## Prerequisites not covered by the atlas

Each link was checked against Crossref on 29 September 2026.

- B. Conrad, F. Diamond and R. Taylor, Modularity of certain potentially Barsotti–Tate Galois representations, J. Amer. Math. Soc. 12 (1999), 521–567, doi:10.1090/s0894-0347-99-00287-8. The lifting theorem that §1.4 modifies, Prop. B.4.2 and Theorems 7.2.1 and 7.2.4; §10 of this paper corrects it.
- A. Wiles, Modular elliptic curves and Fermat's Last Theorem, Ann. of Math. 141 (1995), 443–551, doi:10.2307/2118559.
- R. Taylor and A. Wiles, Ring-theoretic properties of certain Hecke algebras, Ann. of Math. 141 (1995), 553–572, doi:10.2307/2118560.
- C. Breuil, Groupes p-divisibles, groupes finis et modules filtrés, Ann. of Math. 152 (2000), 489–549, doi:10.2307/2661391. Theorem 5.1.3.
- J. Manoharmayum, Pairs of mod 3 and mod 5 representations arising from elliptic curves, Math. Res. Lett. 6 (1999), 735–754, doi:10.4310/mrl.1999.v6.n6.a12.
- N. I. Shepherd-Barron and R. Taylor, Mod 2 and mod 5 icosahedral representations, J. Amer. Math. Soc. 10 (1997), 283–298, doi:10.1090/s0894-0347-97-00226-9.
- F. Diamond, On deformation rings and Hecke rings, Ann. of Math. 144 (1996), 137–166, doi:10.2307/2118586. The cases f = 1 and 3.
- M. Raynaud, Schémas en groupes de type (p, …, p), Bull. Soc. Math. France 102 (1974), 241–280, doi:10.24033/bsmf.1779.
- B. Conrad, Ramified deformation problems, Duke Math. J. 97 (1999), 439–514, doi:10.1215/s0012-7094-99-09718-1.
- J. Tate, p-divisible groups, Proceedings of a Conference on Local Fields (Driebergen, 1966), Springer, 1967, 158–183, doi:10.1007/978-3-642-87942-5_12.
- J. Tunnell, Artin's conjecture for representations of octahedral type, Bull. Amer. Math. Soc. 5 (1981), 173–175, doi:10.1090/s0273-0979-1981-14936-3, and R. P. Langlands, Base change for GL(2), Ann. of Math. Studies 96 (1980), which has no DOI.
- P. Gérardin (1978) and T. Ekedahl (1990), both in conference volumes without DOIs.

Khare–Wintenberger I and II are already in the paper list.

## Source issues

Twelve misprints, each checked on the page image (E1–E8 found by the extraction, E9–E12 by the independent review). None affects a result, and all are new: Crossref has no update for the DOI, and the AMS page lists no erratum.

| id | where | slip |
| --- | --- | --- |
| E1 | Corollary 2.3.2, p.866 | ρ̄₃ : G₃ → GL₃(F₃) for GL₂(F₃) |
| E2 | §6.3, p.900; §6.4, p.901 | γ₄² called the element "of order 3"; it has order 2 |
| E3 | §6.4, pp.901–902 | Gal(F′₃/Q₃(√−3)) and Gal(F′₃/Q₃) for F′₋₃ |
| E4 | Proof of Lemma 5.7.1, p.899 | "From Theorem 5.2.1" for Lemma 5.2.1(5); Γ₁ undefined |
| E5 | §8.3, p.918 | "Theorem 4.7.4, and hence Theorem 4.4.1" for Theorem 4.5.1 |
| E6 | §7.4, p.910 | second γ̂₃(e′_ω) formula is the one for γ̂₃(e′₁) |
| E7 | §5.2, p.888 | G(k′; r, a; s, b; f) := G_π(M(k′; r, a; s, b; f)), parameters in the wrong order |
| E8 | References, p.939 | Tate and Tunnell both labelled [T] |
| E9 | §6.4, p.902 | uniformiser π = α/β for (α − 1)/β (α³ = 4 is a unit) |
| E10 | §7.4, p.910 | γ̂₃(e₁) printed with g_{γ₃}e′_ω for g_{γ₃}e_ω |
| E11 | Proof of Lemma 7.2.6, p.908 | evaluated on ue′ + (b + b′u)e, copied from Lemma 7.2.5, for u²e′ + (b + b′u)ue |
| E12 | Theorem 4.6.3, p.878 | ρ mod (T²) for ρ_N mod (T²) |

**Corrigenda to [CDT].** §10 of this paper records the authors' corrigenda to [CDT]. They are errata to another paper, so they are recorded in item `cdt-corrigenda` and in the errata log rather than as source issues of this paper. The significant ones are:
- the false semisimplicity claim on p.532;
- the two errors in §6.2 (Γ = SL₂(Z) ∩ U_S fails the hypotheses of Theorem 6.1.1, and Hom(L_n, k) should be L_n ⊗ k);
- the missing hypothesis j(E) ≢ 1728 mod ℓ on p.552;
- the sign of −5(29)³/2⁵ and "isogenous to" on p.554.

## How the items were checked

- Every numbered statement of the paper appears in an item locator. The page of each was found in the PDF and compared with the locator by script.
- Statements were checked against the text of the published PDF.
- Planned statuses cite the stage texts of data/atlas.json on origin/main, 29 September 2026.
- Library searches used the pinned declaration index.

## Corrections by the independent review

REV-PAPER-BREUIL-CONRAD-DIAMOND-ETAL-01 (Claude Code, session `cc-f805bf`, 29 September 2026) made these changes:

- A `review` verdict on each of E1–E8; all are confirmed on the page images of the published PDF (SHA-256 `1e34130e…4cf2`, the recorded hash).
- New misprints E9–E12, each confirmed on the page image:
  - E9: in §6.4 the uniformiser π = α/β has negative valuation; (α − 1)/β is meant.
  - E10: in §7.4, γ̂₃(e₁) is printed with e′_ω for e_ω.
  - E11: the proof of Lemma 7.2.6 evaluates on ue′ + (b + b′u)e for u²e′ + (b + b′u)ue.
  - E12: in Theorem 4.6.3, ρ is printed for ρ_N.
- Item `local-field-F-3` now uses π = (α − 1)/β. Item `descent-data-group-schemes` now states the cocycle condition as printed: [gh] = (^g[h])∘[g].
- Statuses changed from planned to missing:
  - `breuil-modules`, `thm-5-1-3` and `thm-5-6-1`: R07.4 plans Breuil–Kisin modules, not Breuil's S-modules. They stay in route 4.
  - `mod-l-reps-compact`: R07.5 is Galois-side. Route 8 now also names R30.2.
  - `conj-1-3-1`: R30.5 plans Paškūnas's multiplicity statements, not this conjecture.
- Two cited theorems the proofs rest on are added as missing items:
  - `tate-p-divisible` ([T, Thm. 4]), routed with route 4 to R07.1;
  - `ekedahl-hilbert-irreducibility` ([E, Thm. 1.3]), on a new route 9 to InverseGaloisAndArithmeticFundamentalGroups IG.2.
- Route 7 (σ_τ and Lemma 1.2.1) changed from a source route to GL2AutomorphicRepresentationsAndTransfer R16.3 into a Part II route coalescing with SmoothRepresentationsPartII. That accepted Part II owns types, and its GL₂ types layer comes from PAPER-NEWTON-THORNE-21-B route 3.
- Route 1's brief now separates the I₃-condition of Theorems 2.1.2 and 2.1.4 from the G₃-condition of Theorem 2.1.6. Its imports now name route 7's owner, R07.1 (Tate), IG.2 (Ekedahl) and Tau Ceti ClassFieldTheory layer 5 (local Tate duality).
- Notes on `three-case-strategy`, `lem-4-7-1`, `conclusion-7-4`, `lem-7-2-6` and `thm-4-6-3`, and the summary's route and misprint counts, are updated to match.
