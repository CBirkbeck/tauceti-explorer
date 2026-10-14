# REV-PKG-OrdinaryAutomorphicFormsAndModularityLifting

Independent package review of `research/blueprint/packages/OrdinaryAutomorphicFormsAndModularityLifting/` (README.md, Suggested.lean, metadata.toml) against the accepted plan `research/blueprint/packets/OrdinaryAutomorphicFormsAndModularityLifting.json`. Reviewer: Claude (session claude-4ywFI0), 2026-10-14. The reviewer did no part of the package job (written by Codex, session codex-Wr9UzQ).

**Verdict: accepted, with the corrections below applied in place.** The package is ready for the draft pull request as far as this roadmap's own files go. Before this roadmap can go upstream, the supplier layers must state the items listed below under "Requirements on suppliers that the suppliers do not yet state". Those are fixes to the supplier packages, outside this review's files. The README now says, for each supplier, which items the supplier states and which are still required of it.

## What was checked

1. **Upstream form.** Compared with TauCetiRoadmap `AdicSpaces/README.md` and `IntegralHeckeAndGaloisDeterminants/README.md` (current main 0d144d0), and with UPSTREAM_GUIDE.md. The README has the upstream shape: Summary, scope, conventions, exact supplier contracts, how to read the build, six layers in prose with `### k.n` targets, Checks, locators and *Needs* lines, Examples and Dependencies per layer, downstream consumers and references.
2. **Fidelity to the plan.** A script paired each of the 93 packet nodes with its README section and compared statement, hypotheses, proof steps, API names, tests and acceptance lines. All 93 targets are present, in packet order, with every API name and named test. Every difference from the packet was read. They are the packager's corrections (each checked below), the replacement of packet ids by section numbers, and the removal of source-issue ids. Added targets: §5.9 (Washington, by the packager) and §3.38 (Waldschmidt, by this review).
3. **Own words.** No source passage or section-by-section summary was found. The new §3.38 and the rewritten §5.9 are paraphrases with formulas and locators.
4. **No process.** A scripted scan for packet, node, job, review, checkpoint, gap, source-issue (E-number), "upstream", "request", "moved down", "Part II", R21 ids and "sorry" now finds nothing.
5. **Suggested.lean.** `lean-check` exit 0 before and after the edits. The only warnings are four `declaration uses sorry`, on the four theorem statements (lines 33, 39, 45 and 187 after the edit). A `run_cmd` axiom audit, run on a scratch copy, shows that `quaternionicPairing`, `traceAlong`, `PseudoRep`, `PseudoRep.trace` and `PseudoRep.det` depend only on `propext`, `Classical.choice` and `Quot.sound`. The file is 325 lines, has no sorry'd data definition and develops no theory. The four sorry'd statements are true as written: nondegeneracy under nonzero cast counts, restriction–trace adjunction, trace along a composite, and quotient-character recovery.
6. **metadata.toml** is the single line `topic = "math.NT"`, which fits.
7. `python3 research/blueprint/intake.py check-files` on the package files: 0 problems.

## Corrections made

**Supplier contracts (the main change).** The section listed 24 contracts, with four suppliers appearing twice. It also presented every contract as something the supplier provides. A Sonnet cross-check quoted each contract item against the supplier's package README, or its packet where no package exists, and I read the quoted lines. About half of the items are not among the suppliers' present targets. The section is rewritten with one entry per supplier: *Uses* (with the supplier's own section or node), *Required in addition* (items the supplier does not yet state), and a "used in" list computed from the targets that cite the supplier. The specific corrections inside it:
- GlobalGaloisDeformations R04.3 requires a Schur residual representation for its presentation, not absolute irreducibility as the old text said. Mazur's unframed form is listed as required in addition.
- The Galois-side descent in §4.7 and §5.6 now cites GL2AutomorphicRepresentationsAndTransfer R17.6 (`R17.6/potential-modularity-interface`, conditional descent along a prime-cyclic tower). R17.4 explicitly does not state that descent.
- The invented id `PadicFamilies:L5/Deligne–Ribet-and-Eisenstein-measures` was replaced by plain text. PadicFamilies has no such node; the material is listed as required of its L5.
- §3.4 and §3.29 cited ArithmeticGaloisDuality R02.3 for the global Euler characteristic, which is in R02.4.
- TauCetiRoadmap entries were added: IntegralHeckeAndGaloisDeterminants Layers 0 and 2 (pseudocharacters, factorial-powers idempotent), ClassFieldTheory and ModularForms (level-11 newform).

**Waldschmidt now a target here (§3.38).** The old contract pointed at a "Part II" of DiophantineApproximationAndTranscendence DT.3. No such roadmap exists, and DT.3's finished package does not state the theorem. The theorem is stated as §3.38: Waldschmidt, Theorem 1.1, p. 1620 of the Bolyai 1984 article, read in the author's scan, with the consequences δ_F ≤ ⌊(d+1)/2⌋ and δ⁻_{F′} ≤ d/2 for totally real F′. This is the treatment the packager already gave Washington's theorem in §5.9. §3.30, §5.2 and §5.3 now need §3.38. The Waldschmidt reference, cited as "listed below" but missing, was added to the References.

**Mathematical corrections.**
- §2.5 and §3.13: the generators γ_j must be chosen with χ(γ_j) = ω(γ_j) = 1, for example in Gal(F̄/F(χ, μ_p)). Otherwise T_j ↦ det ρ(γ_j) − 1 is a unit, the Λ_𝒪-algebra structure is not continuous, and ε(γ_j^{−p^{r_j}}) ∉ 1 + pℤ_p, which breaks the rank-p^r freeness step. Such γ_j always exist, because [F(χ, μ_p) : F] is prime to p while Gal(L₀/F) is pro-p. SW99 §2.5 (p. 26) leaves the choice implicit. A discriminating Check, `lambdaAlgebra_gamma_choice`, was added.
- §3.2 `isOfType_wrong_order` and §3.28 `isOfIrreducibleType_wrong_sub`: the packager had made these vague to avoid a false claim about split lifts. They are now concrete tests. The first is a first-order lift (1 ηb; 0 χ̃) with b a nonzero class in H¹(D_i, k(χ⁻¹)); its only stable line reduces to 1, not χ. The second is the nonsplit case and its split analogue.
- §5.9 was restructured into the standard form. Its statement had been phrased as an instruction ("Prove that …"). The proof route now records Washington's reduction to minus parts (§2, p. 88), and the step from boundedness to eventual constancy (ℓ prime to p, so the p-parts inject along the tower).
- §4.17 also read "prove that every prime …"; it is now a statement.

**Form and wording.**
- "(the displayed correction)", a leftover from source-issue ids, appeared 12 times. Each now says what the printed text has.
- A blanket substitution had put "this comparison" into five non-comparison targets; each is now worded for its target.
- Source-section references that read as this README's sections are now prefixed "Skinner–Wiles": §2.8 "(§3.7.)", §4.2 "(§2.3)" twice, §4.8 "§6", §4.14 "§8.2", §4.15 "§8.2".
- Lowercase sentence starts left by joined hypothesis fields were fixed (14), as were the headings of §6.1 and §6.6, stray spaces and missing full stops.
- Process phrases were removed: "(use that construction)", "these rank-two instances move to this roadmap", "this is the roadmap's … checks".
- Consumer bookkeeping inside §5.5, §5.6 and §6.1 was moved to "Downstream consumers" in prose.
- The open rank-two and CM-dihedral inputs are now an explicit list under Scope and ownership. That list is the plan's gap record, stated as mathematics, with each consuming target named.

**Suggested.lean.** Added Wiles' ordered pseudo-representation `PseudoRep` (§3.7) as a real-bodied structure over a topological group with a normalising element and a commutative topological ring with 2 invertible, with `trace` and `det`. Two `example`s were added. One is the residual {1, χ, 0} of 1 ⊕ χ (the README's `pseudoRep_residual`). The other is trace 0 and determinant −1 at the normalising element. The docstring of the Ramanujan example no longer claims more than the example checks. The closing comment no longer lists `PseudoRep` among the heavy definitions.

## Requirements on suppliers that the suppliers do not yet state

These items are in the README under *Required in addition*. The targets that use them are conditional on the supplier adding them. Supplier status as of origin/main 2b2197cf3.

| Supplier (status) | Required item | Used in |
|---|---|---|
| HilbertModularVarietiesAndShimuraCurves R18.3 (package accepted) | class set without the centre quotient; T₀(𝔭_v) and G(U_a) at p-power level; pullback/trace U_b ⊆ U_a; c_{U_a} = 1 for large a and SW Lemma 3.5/Cor. 3.6; freeness over 𝒪/πⁿ[Δ_w]; Eichler's norm theorem | §1.2–§1.5, §2.7, §2.9, §3.21 |
| GL2AutomorphicRepresentationsAndTransfer R16.6, R17.3–R17.5 (package accepted) | adelic Hilbert forms M_k(U), S_k(U) with Shimura integrality, T₀(𝔭_v), Hida's unit-eigenline classification; weight-zero Steinberg components; level-by-level JL–Shimizu Hecke isomorphism; Skinner–Wiles Duke 2001 base change; weight-0 ordinary automorphic induction (Geraghty 5.2.1) | §1.3, §2.1, §2.2, §2.4, §3.33, §5.6, §6.7, §6.12 |
| GlobalGaloisDeformations R04.3, R04.5 (package accepted) | Mazur's unframed fixed-determinant presentation; global problems with chosen local generic-fibre components and their dimension bound; preservation of residual image and avoidance fields | §3.4, §3.29, §6.7–§6.13 |
| LocalGaloisDeformationRings L7–L8 (package accepted) | nonsplit nearly ordinary versal ring (SW01 Prop. 2.1); ordered-flag condition with only the residual sub-character fixed; BLGG12 §6.1 / NT Lemma 3.1 fixed-type components, Hida-reached ordinary components, Steinberg components, BCGP weight-two convention | §3.2, §3.28, §3.29, §6.7–§6.13 |
| ArithmeticGaloisDuality D8/R02.5 (package accepted) | tangent-space identification with C/λ^m coefficients for a DVR C (SW99 (8.8)–(8.10)) | §4.8, §4.15 |
| ArithmeticGaloisRepresentations R01.4 (package needs_changes) | 2-big condition and BLGG12 Lemma 4.4.2 case division; index-3 subgroups; the F̄₅ scalar argument of §6.11 | §6.7–§6.13 |
| DeformationAndDerivedPatchingAlgebra R03.3, R03.5, R03.6 (no package) | de Smit–Rubin–Schoof Lemma 4.1 and Criterion I; Skinner–Wiles characteristic-p patching (5.1)–(5.11), Lemma 5.6, Props 5.7–5.9; Raynaud A.1–A.2 (its planned bound is weaker by one) | §4.3, §4.8, §4.9, §4.13, §4.15, §4.19 |
| PadicFamilies L0, L5 (no package) | Deligne–Ribet p-adic L-function, Hilbert Eisenstein constant terms, Chai's form, Wiles' vanishing and Λ-adic forms, (4.17) congruences; arbitrary-F Hilbert Hida family with the NT branch; T^new_N (EPW 2.2.1–2.2.2); finite-level K/𝒪 duality. Its L5 freeness and higher-weight control are conditional in its own plan. | §2.4, §2.6, §2.8, §2.11, §3.14, §3.26, §5.2, §6.3, §6.7–§6.11 |
| AutomorphicGaloisRepresentations R19.2/R19.5 (package needs_changes) | ordinary local shape at v \| ℓ for ι-ordinary π in the dual normalisation. Its R19.5 currently imports the ordinary shape from this roadmap's Layer 3, which would be circular. | §2.11, §6.11, §6.12 |
| SerreWeightAndLevelOptimisation R20.6 (package under review) | Diamond, The refined conjecture of Serre, Theorem 6.4 (χ₂-good lift); its package cites only Diamond's Theorem 1.1 | §5.7 |

Separately, the plan's open inputs (no roadmap below tier 20 states them) remain conditions on §5.8 and §6.7–§6.13. They are BLGG12 Theorem 3.5.1 and Proposition 5.1.1; the adequate-image theorem of the BLGG unitary appendix, Theorem A.4.1; Allen's dihedral case; Bellovin–Gee Proposition 4.2.6 with Thorne 2012 Theorems 9.1 and 10.2; and a corrected CM/mixed dihedral argument.

## Sources

- **Locators.** Downloaded SW99, SW01, Mazur and Hida (Numdam), EPW, NT, DP, Pan and Khare (arXiv), BLGG12 and BLGG13 (author PDFs), Washington (GDZ) and Waldschmidt (author scan). A seeded random sample of 18 locators not in the packager's table, and some further spot checks, were all confirmed: the cited label is on the cited page and printed page = PDF page + 3 (SW99) or + 183 (SW01). The sample was 1.5, 2.4, 2.9, 2.10, 3.3, 3.4, 3.7, 3.20, 4.13 (×2), 4.14, 4.15, 4.17 (×2), 4.18, 4.19 (×2) and 6.1. The spot checks were EPW Theorem 2.3.1 and Propositions 2.3.2–2.3.5 (pp. 10–13, inertia coinvariants confirmed), Hida Corollary 3.7 (p. 253), Mazur Proposition II.9.7 (p. 96), SW99 Theorem A, Theorem B and Hypothesis H (pp. 74–75), (G) (p. 62), Proposition 2.15 with its domain hypothesis (p. 24), Proposition 3.20 (p. 50), Lemma 3.21 (p. 51), Pan Theorem 1.0.2 (p. 3), BLGG12 Theorem 6.1.9 (p. 44, checked on the page image: εψ of finite order and type determinant (ψε)|_I, which the text layer drops), Waldschmidt Theorem 1.1 (p. 1620) and Washington's Theorem (p. 87) with the reduction to minus parts (p. 88).
- **Unverified locators.** Raynaud's original connectedness paper, Skinner's 2009 dihedral preprint and the Skinner–Wiles Duke 2001 paper were not read in this review; the README treats them as supplier requirements or open inputs.

## Duplication against current Tau Ceti

Searched TauCetiRoadmap main 0d144d0 (including the nine roadmaps newer than the atlas snapshot and the Completed roadmaps) and the Tau Ceti library a91d3aaf by object. The search terms were Hida, ordinary projector/idempotent, Eisenstein ideal, pseudo-representation/pseudocharacter, deformation ring, Washington, Ihara, Jacquet–Langlands, Raynaud, connectedness, patching, X₀(11), Skinner–Wiles, Waldschmidt/Leopoldt, complete intersection, Cohen–Macaulay, Deligne–Ribet, definite quaternion, Chebotarev, Galois representation and p-adic logarithm. No target of this roadmap is planned upstream. The overlaps are inputs and are now cited in the supplier section:
- IntegralHeckeAndGaloisDeterminants Layer 2.3 ("Factorial powers") is the idempotent §1.1 compares with.
- Its Layer 0 is the pseudocharacter interface.
- ModularForms has the level-11 newform.
- ModularCurves leaves Mazur's Eisenstein ideal to a downstream owner.

Nothing was removed.

## Adversarial mathematics pass

Instances computed or source statements compared, target by target. "SW" means the source statement was compared with the printed page.

| § | Checked | Result |
|---|---|---|
| Conventions | pairing values 6, 0, 0 over 𝔽₂, 23; trace 5, 0, 6 with weighted 3; quotient recovery β=3, α=1, (5,1) ↦ 1, product 4; twist 3·2 = 6; dual filtration; ε̄⁻²ω = ε̄⁻¹ | all correct |
| 1.1 | m = 0 gives a nilpotent t^0 = 1; 2²⁰ ≡ 1 mod 25 (order of 2 is 20); 5³ ≡ 0 mod 125; f_i \| m gives (p^{f_i}−1) \| (p^m−1); (1+x)^{p^n} ∈ 1 + m^{n+1} | correct; m ≥ 1 needed and stated |
| 1.2 | T₀(p)f = N·(translate), N a positive p-power; translation of finite order on the finite lattice | e = 0 on norm-factoring forms; correct |
| 1.3 | eH⁰ ⊗ ℂ embeds in S^D because of 1.2 | correct; finite-level JL isomorphism is a supplier requirement |
| 1.4 | one point c = 2 over ℚ, p \| c over 𝒪, free action gives identity Gram matrix, central z adjoint z⁻¹ | correct; perfectness needs unit counts |
| 1.5 | orbit–stabiliser count c_U(x)/c_V(y); weighted adjunction recomputed | correct; trace is a sum, not an average |
| 2.1 | X₀(11): a₃ = −1 unit, a₂ = −2 not a 2-adic unit; supercuspidal has no unit T₀-eigenvalue | correct |
| 2.2 | supercuspidal π_v gives eV_π = 0 | correct |
| 2.3 | Ramanujan τ(2) = −24 ≡ 2049, τ(3) = 252 ≡ 177148 mod 691; E₂(1, ψ) eigenvalue 1 + ψ(ℓ)Nm(ℓ) ≡ 1 + χ(Frob_ℓ) | correct |
| 2.4 | hypothesis is a nonunit L_p(F, −1, χω) | correct |
| 2.5 | u(1+T)^{p^r} − 1 ≡ T^{p^r} mod p needs u ≡ 1 mod p | **fixed**: γ_j with χ(γ_j) = ω(γ_j) = 1 |
| 2.6 | torsion-freeness via the norm N(λ); Auslander–Buchsbaum over the regular Λ_𝒪 | correct; "nonidentity element" in the fixed-point-free hypothesis is right (the identity fixes everything) |
| 2.7 | #M_Δ = #M^Δ for cyclic Δ and finite M; generator count #X(U′) | correct |
| 2.8 | coefficient of the identity versus augmentation on 𝒪[Δ] | correct |
| 2.9–2.10 | annihilator 1 + Nm(q) from Nm(q)+1 cosets; δ(f) = (f, −αf), γ(f₁, f₂) = αf₁ + f₂ give γδ = 0 | correct; Eichler is a supplier requirement |
| 2.11 | ε⁻²ω ≡ ε̄⁻¹; HT weights {0,2} | correct |
| 3.1 | cocycle normalisation c(σ) = b(σ)χ(σ)⁻¹ ∈ Z¹(k(χ⁻¹)) from ρ_c = (1 b; 0 χ); c = 0 gives a non-Schur split representation | correct |
| 3.2 | split lifts have both orders | **fixed** test with a first-order nonsplit local lift |
| 3.3 | the field cut out by ρ_c is not totally real (χ odd) | packager's correction right |
| 3.4 | g − r = (g′ − r′) + δ_F − d − 2t − 3#ℳ ≥ d + δ_F − 2t − 3#ℳ, using h¹ − h² = 2d for odd Schur ad⁰ | correct; R02.4 citation fixed |
| 3.5 | trace alone (x = 0 for diagonal) does not see the extension | correct |
| 3.6 | p-power-order characters trivial in characteristic p | correct |
| 3.7 | four-term identity re-expanded from b_{στ}c_{αβ}; diag(u,1) scales b by u and c by u⁻¹ | correct; now a Lean structure |
| 3.8 | s² + 4s ≤ 2s² + 4 ⟺ (s−2)² ≥ 0 | correct |
| 3.9 | c + ηh over k[η]/(η²) with h independent of c: class of ad ρ_c nonzero, same pseudo-rep | correct (packager's test right) |
| 3.10–3.11 | at reducible primes b_σ is not in the image; extension class determined only up to scalar | correct |
| 3.12 | SW99 p. 24 assumes R a domain and R → R⁺ injective | packager's correction right |
| 3.13 | (tr(gσ) − α tr σ)/(β − α) = ψ₂(σ) recomputed | correct; γ choice **fixed** |
| 3.14–3.15 | integral pseudo-rep only in the reducible case | correct |
| 3.16 | S(ℓ)Nm(ℓ) ≡ χω⁻¹(ℓ)ω(ℓ) = χ(ℓ) | correct |
| 3.17 | T_y = (β−α)⁻¹(β tr σ − tr gσ) with sub β, quotient α | correct; restored inverse right |
| 3.18–3.20 | type-dependent levels; twist T₀ ↦ T₀Ψ(λ) (printed inverse corrected) | consistent with the twisting convention |
| 3.21 | SW99 Proposition 3.20 hypotheses at v \| p | packager's correction (v, not w) right |
| 3.22 | δ + δ⁻¹ − 2 = s²/(1+s), s = 1 gives 1/2, s = −1 undefined | correct |
| 3.23–3.25 | N_𝒟 trivial gives T = T^min; level-raising eigenvalue condition | correct |
| 3.26 | localisation versus weight specialisation | correct |
| 3.27 | diagonal locus x = 0 | correct |
| 3.28 | nonsplit ρ₀\|D_i has a unique stable line | **fixed** test |
| 3.29 | same count as 3.4 | correct; nonsplit local ring is a supplier requirement |
| 3.30 | CM F′: minus units finite, minus local units rank d, δ⁻ = d; F = ℚ, imaginary quadratic: 1 > 1/2 | correct; now cites §3.38 |
| 3.31–3.35 | Carayol for absolutely irreducible ρ₀; Q = ∅ recovers the base ring | correct |
| 3.36 | distinct G_v-characters give H⁰(Hom(L, V/L)) = 0 | correct |
| 3.37 | n = 2: d_v = 5 gives dimensions 20 and ≤ 18 | correct |
| 3.38 | real quadratic d = 2 gives r_p = 1; d = 4 gives δ ≤ 2; d = 3 gives δ ≤ 2; CM non-example | new target; Theorem 1.1 read on p. 1620 |
| 4.1–4.2 | (G) compared with SW99 p. 62; d = 1 never good | correct |
| 4.3 | A = k[[x,y]], f = xy: r = 1 > d − 2 = 0 and the punctured spectrum of A/(xy) is disconnected | hypothesis r ≤ d − 2 needed |
| 4.4 | d − 2t − 3#ℳ − 1 > 1 + δ_F + #Σ + dim H follows from (G) since t, #ℳ ≤ #Σ | correct |
| 4.5–4.7 | Main Theorem: restriction of an irreducible ρ to G_L need not be irreducible; absolute irreducibility of ρ₁ comes from the cuspidal ρ_{f₁} | packager's correction right; descent now cites R17.6 |
| 4.8–4.9 | n = 0 excluded; generic-fibre conclusions only | correct |
| 4.10–4.12, 4.18 | characteristic-p finite-order eigenvalues on a pro-p subgroup are 1 | correct |
| 4.13–4.15 | ℓ(H_n/H_n²) ≤ ℓ(H₀/H₀²) + ℓ(C/δ(η)) ≤ ℓ(C/(δ∘α)(G_n)) | correct; localised R = T only |
| 4.16–4.17 | d = 40, t = 1, #ℳ₀ = 0, #Σ = 4 counterexample; d/2 > 2 + 2t + 7#(Σ∖𝒫) gives d − 2t − 3#ℳ − 4#(Σ∖𝒫) ≥ d/2 + 1 | correct (also an `example` in Suggested.lean) |
| 4.19 | Λ̃ base change and T-inversion kept | correct |
| 5.1–5.3 | compared with SW99 pp. 74–75: abelian hypotheses, ε range, k ≥ 2, Hypothesis H uniform c(ε) | correct |
| 5.4 | det ρ odd gives χ odd; ρ\|I_p ≅ (∗ ∗; 0 1) gives the pro-p condition | correct |
| 5.5 | ω² = 1 mod 3; Pan Theorem 1.0.2 excludes χ̄₁/χ̄₂\|G_{ℚ₃} = ω at p = 3 | correct |
| 5.6–5.8 | the even-degree base change: d_L/2 > 2 + 7#Σ_L implies the §4.17 bound since t + #(Σ∖𝒫) = #Σ_L | correct; restricted versus full scope kept apart |
| 5.9 | ℓ ∤ [K_{n+1}:K_n]-power argument; reduction to minus parts (p. 88) | **restructured** |
| 6.1 | level one: 11a at 11 is Steinberg, so p \| N is not crystalline | correct |
| 6.2 | independence of Serre's conjecture stated as a requirement on suppliers | acceptable |
| 6.3 | EPW (4) full cyclotomic character x ↦ ⟨x⟩x⁻¹; weight k trivial character gives det = ε^{k−1}; coinvariants | correct |
| 6.4 | two p-stabilisations, one ordinary | correct |
| 6.5 | numerator(10/12) = 5; a₅ ≡ 1 + 5; ω of order 4; a₅² = 5^{k−2} for new-at-5 forms | correct |
| 6.6 | p − 1 even, k − 1 odd; −23 ≡ 1 mod 3 | correct |
| 6.7–6.10 | BLGG12 Theorem 6.1.9 page image: εψ finite order, type determinant (ψε)\|_I; l ≥ 7 and degree > 4 separate | correct; open rank-two inputs listed |
| 6.11 | ε̄ of order p − 1 on inertia; 1 + 2 = 3 ≠ 0 in 𝔽₅; A₅ has no element of order 4 | correct |
| 6.12 | r̄ trivial at v₁ and det r̄ = ε̄_q⁻¹ give q_{v₁} ≡ 1 mod q | correct |
| 6.13 | residue size −1 mod p allows the Steinberg component; ε̄⁻²ω = ε̄⁻¹ | correct |

## Left for later jobs

- **Supplier fixes.** Add the items in the table above to the supplier packages, or move them here by a later restructuring. A supplier package that goes upstream without them leaves the corresponding targets here conditional.
- **AutomorphicGaloisRepresentations ordinary shape.** Its package must prove the ordinary local shape itself rather than import it from this roadmap (tier 20 above tier 18).
- **Forward references within layers.** These remain in *Needs* lines: §3.30 → §3.31 and §3.38; §4.6 → §4.15; §4.8 → §4.11 and §4.12; §5.2 → §5.9. They are within a layer and acyclic. They were left in place to keep the section numbers the plan and its consumers use.
