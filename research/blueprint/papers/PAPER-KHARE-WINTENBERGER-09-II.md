# Khare–Wintenberger, *Serre's modularity conjecture (II)*: extraction and routing

Job PAPER-KHARE-WINTENBERGER-09-II. Claude Code, session `cc-48533a`, 29 September 2026.

The machine-readable extraction is `PAPER-KHARE-WINTENBERGER-09-II.result.json`. It has 343 items (306 planned, 7 library, 30 missing), 9 routes, 6 prerequisite papers and 33 source issues. These counts include the fixes of FIX-RT-PAPER-KHARE-WINTENBERGER-09-II, described at the end.

**Version read.** The authors' copy `proofs.pdf` from Khare's UCLA page: 98 pages, PDF dated 30 May 2009, SHA-256 `53f45f8b…c86ed4`, read in full. It is the file the atlas's GL2ModularityLifting, GlobalGaloisDeformations, LocalGaloisDeformationRings and PotentialModularityAndCompatibleSystems packets already cite, by hash.

It contains the refereeing changes (§1.1 credits Diamond's observation on fixing determinants for p = 2), so it is taken to be the accepted version of Invent. Math. 178 (2009), 505–586. The Springer text could not be opened. Crossref registers no erratum. Locators are the copy's own pages.

**How it was read.** Four readers each took one of §§1–3, 4–6, 7–8 and 9–10 and drafted items with exact statements, locators and a status against the atlas. The drafts were then merged, and the items that appeared in more than one part were removed. Every candidate source issue was checked again against the text before it was recorded, and every library citation against the declaration index at the pins.

## What the paper proves

KW II proves the two technical theorems stated in KW I:

- **Theorem 4.1:** modularity lifting for lifts of modular residual representations. This includes the new 2-adic case, with non-solvable residual image.
- **Theorem 5.1:** the existence of p-adic lifts of four prescribed types, placed in almost strictly compatible systems.

The argument runs as follows.

- **§2, framed deformation theory.** Kisin's framed deformation theory with fixed determinant: framed and unframed rings, quotients by free actions of diagonalisable groups, truncations and chunks, inertia-rigid deformations, and resolutions of framed deformations.
- **§3, local deformation rings.** The rings at ∞, above p (low-weight crystalline, semistable weight 2, weight 2 crystalline over ℚ_p^{nr}(μ_p), ordinary) and away from p (inertia-rigid, and twists of semistable). Each is flat, of the expected relative dimension, with regular generic fibre (Theorem 3.1).
- **§4, global rings.** Global deformation rings and their presentations over the completed tensor product of local rings. Wiles' formula with fixed determinant bounds the dimension from below (Proposition 4.5 and Corollary 4.7).
- **§5, auxiliary primes.** Taylor–Wiles auxiliary primes, including the new twisting and class-group construction for p = 2 (§5.5).
- **§6, potential modularity.** Taylor's potential modularity, extended with the local controls the later arguments need (Theorem 6.1).
- **§7, quaternionic forms.** Forms on definite quaternion algebras over totally real fields, and ∆_Q-freeness in the presence of isotropy.
- **§8, lifts with prescribed properties.** Level lowering and modular lifts with prescribed local properties, after an allowable solvable base change (Theorems 8.2 and 8.4).
- **§9, R = T.** Taylor–Wiles–Kisin patching, with determinants fixed only locally when p = 2 (Propositions 9.2 and 9.3, Theorem 9.7).
- **§10, the two theorems.**
  - Finiteness of deformation rings from potential modularity (Theorem 10.1).
  - KW I's Theorem 4.1.
  - KW I's Theorem 5.1, through characteristic-zero points and compatible systems obtained by Brauer induction and Langlands base change.

## What the atlas already has

The atlas was organised around this paper, and almost every item has a node:

- §3: LocalGaloisDeformationRings R08.1–R08.6. R08.6 exports Theorem 3.1, Propositions 3.2, 3.3 and 3.6, and Lemmas 3.7 and 3.9.
- §§2 and 4–5: GlobalGaloisDeformations R04.1–R04.6, with Propositions 2.5–2.11 at R04.4 and Lemmas 5.1–5.12 at R04.5. The general commutative algebra is at DeformationAndDerivedPatchingAlgebra R03.
- Theorem 6.1: PotentialModularityAndCompatibleSystems R23.3 and R23.5; Moret-Bailly is at R23.1.
- §7: HilbertModularVarietiesAndShimuraCurves R18.3, R18.4 and R18.6, AutomorphicGaloisRepresentations R19.4–R19.5, and GL2ModularityLifting R22.2.
- §9: GL2ModularityLifting R22.1–R22.6.
- §10: PotentialModularityAndCompatibleSystems R24.1–R24.5.

The duality inputs are ArithmeticGaloisDuality R02.4–R02.6 and Tau Ceti ClassFieldTheory Layer 5, and Chebotarev density is Tau Ceti's Chebotarev roadmap, Layer 10.

Seven items are in the pinned libraries, all read at the pins:

- Mathlib's `cyclotomicCharacter`;
- Yoneda (`CategoryTheory.Coyoneda.fullyFaithful`, `Functor.CorepresentableBy`);
- inflation–restriction (`groupCohomology.H1InfRes_exact`);
- Weierstrass preparation (`PowerSeries.exists_isWeierstrassDivision`, `exists_isWeierstrassFactorization`);
- Henselian rings;
- an index lemma for normal subgroups;
- Tau Ceti's theorem that characters determine representations (`Representation.nonempty_equiv_of_character_eq`).

## Routes

All 30 missing items go to existing layers as sources. None needs a Part II or a new roadmap: each is a general input that a planned layer already uses, or a result that the layer's text asks for but no node states.

1. **DeformationAndDerivedPatchingAlgebra R03.1–R03.4** (12 items). The commutative algebra of complete Noetherian local 𝒪-algebras:
   - relative tangent spaces, and the tangent space of a completed tensor product;
   - Proposition 2.2(ii): a completed tensor product of domains with an 𝒪-point and regular generic fibre is again one;
   - Proposition 2.1 for non-Schur ρ̄, and deformation conditions relative to the hull;
   - regularity descent along faithfully flat local maps (Matsumura 33.B), also for R^inv_∞[1/2] in Lemma 9.6(a). The completion half (Matsumura 28.M) is planned at Tau Ceti ModularCurves Layer 4D;
   - Chevalley's comparison of ideal topologies;
   - excellence of finitely generated 𝒪-algebras, and equidimensionality of completions;
   - the maximal ideals of R[1/p], and the Jacobson property (EGA IV 10.5.8);
   - Corollary 2.3, that flat reduced quotients are determined by their points. Two nodes already invoke it without stating it.
2. **LocalGaloisDeformationRings R08.4 and R08.6.** Two inputs:
   - Lemma 3.8, the algebraisation step for the ordinary ring;
   - Kummer theory over F^nr with 𝒪-module coefficients, which defines the finite cocycles of §3.2.5 (Lemma 3.7). The μ_n Kummer isomorphism itself is planned at Tau Ceti ProfiniteCohomology Layer 9, and Tau Ceti already has the Kummer map and its kernel.
3. **PadicHodgeTheory R06.4.** Lemma 3.5(i)–(iii), the ordinarity criteria for unramified F. The layer's text asks for the criteria these branches use, but its node proves them only over ℚ_p. All three parts are planned there, and the paper is a source for the unramified case.
4. **ArithmeticGaloisDuality R02.2 and R02.4.** The Grunwald–Wang theorem, used in Theorem 6.1(iii)(b) and, for p = 2, in Lemma 7.10; and Lemma 7.10 itself. Three accepted extractions route the same theorem here. The InverseGalois packet still places it at IG.4, so the choice of a single owner is left to the maintainer.
5. **ArithmeticGaloisRepresentations R01.4.** Lemma 4.3(5): H¹(SL₂(𝔽_{2^r}), M₂(𝔽)) = 0 (Dickinson), and the list of submodules of Ad. GlobalGaloisDeformations already requests both from R01.4.
6. **GlobalGaloisDeformations R04.5 and R04.6.** Two inputs:
   - Lemma 4.3(4), the injection H¹(G_F, Z) → H¹(G_F, Ad), used when counting auxiliary primes for p = 2;
   - the arithmetic character ψ of §8.1 with its kinds (i)–(iii). It is a datum of the deformation problems that R04.6 supplies, and R04.6 already takes it by reference.
7. **PotentialModularityAndCompatibleSystems R23.3, R23.5 and R24.1.** Two inputs:
   - Khare's Lemma 4.2, which kills the mod p ramification away from p; R24.1 uses it as a hypothesis and could not locate it;
   - the dihedral-image step in the proof of Theorem 6.1.
8. **HilbertModularVarietiesAndShimuraCurves R18.3.** Two inputs:
   - Taylor's neatness lemma;
   - Khare's Lemma 2.2. KW use it in the proof of Theorem 6.1, and to make the level of Lemma 8.3 neat.
9. **SerreWeightAndLevelOptimisation R20.6** (6 items).
   - The items: Theorems 8.2 and 8.4; the weight-(p + 1) variant; Lemma 8.3 with its decomposition 𝔽[ℙ¹(k_w)] ≅ 𝟙 ⊕ V; and Kisin's level raising via Ihara's lemma, with his quadratic-tower lemma, which is the method of proof of Theorem 8.4.
   - Why R20.6: its text is to "supply the optimisation inputs used inside KW", and the GL2ModularityLifting R22.1 packet already requests these theorems from it. They are the totally real versions, after allowable base change, of results the layer so far states over ℚ.
   - Their other inputs come from routes 4, 6 and 8 and from R18.3–R18.6 (Lemma 7.1). On the assembled atlas and its links, none of these closes a cycle with R20.6.

## Source issues

There are 33 issues: 22 misprints, 8 gaps and 3 errors. E33 was added by the fix FIX-RT-PAPER-KHARE-WINTENBERGER-09-II (see the end). The independent review confirmed 31 and rejected one misprint, E13 (the bar on R̄ in §4.1.3 is printed, as an overline). Six affect a proof. None affects a stated theorem of KW I or KW II as they are used. Four were already recorded in the atlas:

- GlobalGaloisDeformations/E2 (§2.1, "surjectivity" should be "injectivity");
- PotentialModularityAndCompatibleSystems/E1 and /E2 (the pages of [33], and "part (c)" of Theorem 6.1);
- AutomorphicGaloisRepresentations/E2 (the title of [53]).

The rest are new.

**The gaps and errors that affect proofs:**

- **E29, proof of Theorem 10.1 (p. 91).** The comparison maps β : R_F^{ψ_F} → R^ψ_{ℚ,S} and α are asserted "by functoriality", but they do not exist integrally in general.
  - Why they fail: Theorem 10.1 allows the semistable local ring at primes ℓ ≠ p. Its points have infinite inertia image at ℓ and stay ramified over every finite extension, while the ring over F admits only deformations unramified outside p. An example is ρ̄ from an elliptic curve with multiplicative reduction at ℓ and p ∤ v_ℓ(Δ).
  - The repair: the choice of F kills only the ramification of the mod p universal representation τ. The comparison map exists into R̄^ψ_{ℚ,S}/(p), and that is all the finiteness argument needs.
  - In the atlas: the node PotentialModularityAndCompatibleSystems:R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring repeats the integral maps and should be corrected.
- **E11, §3.3.3, the case p = 2 (p. 36).** ρ(σ) is given eigenvalues ε and ε⁻¹, but ρ(F) swaps the two eigenlines, so the tame relation requires ε^{q+1} = 1. That fails for every level-2 character of 2-power order when q ≡ 1 mod 4. Taking the eigenvalues ε and ε^q works in general. KW I's Theorem 5.1(4), with its parity condition, uses only q ≡ 3 mod 4, where the printed choice is correct.
- **E19, Lemma 7.2(i), p > 2 (p. 61).** When ρ̄ is unramified at v and N(v) ≡ −1 mod p, the residual representation does not determine γ_v: γ and γη give the same ρ̄. So the argument that γ_v does not depend on f fails. This is the gap that Gee–Kisin, Appendix B.3, close in Kisin's §2.2 (GL2ModularityLifting/E4) by assuming N(v) ≢ −1 mod p.
- **E17, Theorem 6.1(iii)(b).** The statement allows every ℓ_i ≠ p, but the proof, by successive Grunwald–Wang applications, treats only ℓ_i ≠ 2, p. Theorem 10.1 uses the statement at ℓ_i = 2 when p is odd.
- **E14, proof of Lemma 4.6 (p. 44).** For p = 2 the cup product x_v ∪ h_v with h_v ∈ M₂(𝔽) is not defined. The independence of the choice of the g̃_v needs x_v ∈ L_v^⊥, a hypothesis the proof never invokes.
- **E10, proof of Proposition 3.2(i).** It cites Proposition 2.2, which needs domains. The inertia-rigid rings are only known to be flat with components of relative dimension 3, and the reduction to components is not given.

**Errors and gaps that affect nothing:**

- **E8, error, §3.2.2(i).** The parenthesis "finite flat … can occur only when k = 2" is false for unramified ρ̄_v, which has k = p.
- **E33, error, §3.2.4.** Savitt's ring 𝒪[[T₁, T₂]]/(T₁T₂ − p) is the weight-two ring only when 3 ≤ k(ρ̄_p) ≤ p. When k(ρ̄_p) = 2 the type is trivial, and the ring is the smooth ring of §3.2.3.
- **E20, gap, Lemma 7.2.** At places of Σ above p the proof cites only [10] and [61], where Lemma 7.7 and Corollary 7.8 are needed.
- **E23, gap, Lemma 7.1.** It is stated for compact U but applied through Corollary 7.5 to non-compact U when p = 2.
- **E24, gap, §7.5.** The check that f_χ is again a form needs χ split at S, not only unramified.

**Misprints.** Among them:

- "Proposition 9.1" for Lemma 9.1, in three places;
- a wrong superscript, F M_{n₀+1} for F M⁺_{n₀+1};
- "§5.6" for §5.5.1;
- "ω_p^{k−2}" in Corollary 7.8(ii), where k = 2 but the intended exponent is k(ρ̄) − 2;
- ρ_F for ρ_{π′} in Theorem 8.4;
- the truncated year of SGA 3 in [15] (1970).

All are listed with their corrections in the JSON.

## Prerequisite papers not yet covered by the atlas

1. Böckle, *Presentations of universal deformation rings* (2007), doi:10.1017/CBO9780511721267.003.
2. Dickinson, *On the modularity of certain 2-adic Galois representations* (Duke 2001), doi:10.1215/S0012-7094-01-10923-X.
3. Skinner–Wiles, *Base change and a problem of Serre* (Duke 2001), doi:10.1215/S0012-7094-01-10712-6.
4. Taylor, *On icosahedral Artin representations II* (Amer. J. Math. 2003), doi:10.1353/ajm.2003.0021.
5. Artin–Tate, *Class Field Theory*, Chapter X (Grunwald–Wang).
6. Wintenberger, *On p-adic geometric representations of G_ℚ* (Documenta 2006), doi:10.4171/dms/4/24.

Every DOI was confirmed on Crossref. None of these papers was read for this job. Their statements here are the ones KW II cite.

## Corrections by the independent review

REV-PAPER-KHARE-WINTENBERGER-09-II (Claude Code, session `cc-fb70e5`, 29 September 2026) made these changes:

- A `review` verdict on each of E1–E32.
- 31 are confirmed. E13 is **rejected**: the zoomed page image of p. 39 shows the bar on R̄^{□,ψ}_v in the second bullet of §4.1.3. It is set as an overline, a drawn rule that the text layer does not record.
- No item, status or route was changed.

## Fixes (FIX-RT-PAPER-KHARE-WINTENBERGER-09-II, 30 September 2026)

Claude Code, session `cc-f805bf`, issue #5028. This fix applies the ten medium findings of `RT-PAPER-KHARE-WINTENBERGER-09-II` that the verifier confirmed, with the verifier's adjustments. The six low findings are recorded but not applied. The full record is `research/blueprint/redteam/RT-PAPER-KHARE-WINTENBERGER-09-II.fixes.md`.

- **Two cycles are removed (/1).**
  - Kisin's level raising (/273) now goes to R20.6, with Theorem 8.4.
  - ψ (/254) now goes to GlobalGaloisDeformations R04.6.
  - Lemma 7.10 (/252) goes to ArithmeticGaloisDuality R02.2/R02.4.
  - Khare's Lemma 2.2 (/209) goes to HilbertModularVarietiesAndShimuraCurves R18.3. Its locator now includes its use in the proof of Theorem 8.2 (p. 73).
  - The old route 10 (GL2ModularityLifting R22.1/R22.4) is dropped.
- **Grunwald–Wang (/2).** /210 moves from InverseGalois IG.4 to R02.2/R02.4, beside three accepted extractions. Its locator now includes the proof of Lemma 7.10. The old route 8 (IG.4) is dropped, and the old routes 9 and 11 are now routes 8 and 9.
- **Presentations at p = 2 (/3).** The notes of /143, /150, /151 and /153 cite the all-p node DeformationAndDerivedPatchingAlgebra:R03.2/presentation-relations-and-dual-selmer-bound. /144 is planned at R04.3, its owner.
- **New item /341 (/4):** the p = 2 local points of Taylor's moduli problem, which KW assert "as for p ≠ 2". It is planned at R23.2 and H6, like /193, and no node states it in residual characteristic 2.
- **Savitt's ring needs 3 ≤ k(ρ̄_p) ≤ p (/5).** /92 and /93 are restricted to this range, and E33 records the error.
- **§3.2.3 at k = p and p = 2 (/6).** /91's note names the inputs that the R08.6 node lacks.
- **Statuses (/7).**
  - /32 and /60 are now missing, on route 1.
  - /291's note follows the corrected R22.6 node.
  - /310 takes E29's mod-p map γ̄.
  - Lemma 3.5 (/83, /85, /86) is planned at PadicHodgeTheory R06.4, on route 3.
- **Kisin's Corollary 3.1.11 (/8).** /273 now states its hypotheses, including the level-raising congruence, and its conclusion, and says where KW get the congruence.
- **Theorem 4.1(2) by case (/9).** /314's coverage is split among /316–/319 and Theorem 9.7.
- **Library claims (/10).**
  - /34 is split: flat descent stays missing, and the completion half is the new /342, planned at ModularCurves 4D and R03.3.
  - /98 is split: the μ_n Kummer isomorphism is the new /343, planned at ProfiniteCohomology Layer 9 and citing `TauCeti.kummerMap` and `TauCeti.ker_kummerMap`. The KW-specific rest moves to R08.6 (route 2), and route 4 now serves R02.2/R02.4.
  - /340 cites Mathlib's polynomial ascent of regularity.
