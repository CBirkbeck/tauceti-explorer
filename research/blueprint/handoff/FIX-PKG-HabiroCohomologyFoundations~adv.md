# FIX-PKG-HabiroCohomologyFoundations~adv — fixes report

Claude (Opus 5.5), session **claude-Sgj0op**, 20 October 2026. Refs #11308.
Claim confirmed by the bot at 03:06:53 UTC. Branch
`claude-Sgj0op-fix-pkg-habiro-cohomology`. **Complete**:
`review.status = accepted`.

## Inputs

The findings file named by the issue, `research/blueprint/reviews/REV-PKG-HabiroCohomologyFoundations~adv.md`,
does not exist in the checkout or in git history. The queue entry
(`855929033`) was published without it. I therefore:

- read the three earlier package reviews (`REV-PKG-HabiroCohomologyFoundations{,~2,~3}.md`)
  and their handoffs;
- reran the binding adversarial pass of PACKAGE_REVIEW.md on the whole package;
- carried out the supplier obligation stated in the issue (FIX-PKG-RefinedTraceMethods~adv,
  "Maintainer requests", item 1).

I opened the following public sources and checked every statement I cite
or changed against them: QH arXiv 2510.04782v2, QW 2410.23078v5, KU 2510.06057v1,
TC 2410.23115v4, GSWZ 2412.04241v2, Pridham 1608.07142v4, Sch 1606.01796v1,
and Stacks tags 091N, 03OY, 06WT and 00NV. Each arXiv version read is the
latest listed on 20 October 2026. No library source was used. Nothing outside
the four deliverables was edited.

## Finding → change

| # | Finding (own pass unless stated) | Change |
| --- | --- | --- |
| S | Issue obligation: RefinedTraceMethods needs named, importable q-de Rham/q-Hodge objects with descent data from §§2.1–2.7 and Layer 4, not from Layer 6. | New **§4.28**: `qHodge.periodic` (+`_fil`, `_t`), `QHodgeFiltration.completion`, `QHodgeFiltration.completedQdR`, `HabiroHodgeDescent` (+`.periodic`, `.etale`). It states that every item is built from HR/DD/EDS/AI.1/PR.0–6/CR/Q3 alone and that RTM and Layer 6 are consumers. Five Checks. Pridham (Thm 1.17, 1.23) is added to §4.8 as `qHodge.framed_lambda`; GSWZ Def. 1.1 is added in §4.28 and §5.25. |
| S′ | RTM §7.6 consumes "Fil qHdg of derived qdR(ℤ/m)/ℤ" for high-powered m and cites this package for it, but no target here owned it. | New **§5.26** (Layer 5, trace-free): explicit higher-power lifts (TC Lemma 3.16, all p, α≥2), `Powerful` m, the glued pair `finiteCoefficientPair` with completion, rational and divisibility laws. Five Checks. GENERALITY: powerful m ⊇ high-powered m. |
| E1 | **Source error**, TC v4 Lemma 3.7 (p.32) and Paragraph 1.8 (p.5): the global uncompleted qdR_{(ℤ/m)/ℤ} is said to vanish rationally, so (c),(c_p) are "vacuous" and qdR_{(ℤ/p^α)/ℤ} is p-complete. In fact non-Hodge-completed dR of the zero ℚ-algebra is ℚ, so the rational corner is ℚ⟦q−1⟧ with the constant filtration. | §5.26 defines the pair by gluing the local filtrations with that constant rational corner. It proves (a)–(c_p) and records that the completion and qHdg, which RTM and TC use, are the products, unchanged. |
| G1 | GENERALITY: §5.13 restricted algebraic Habiro cohomology to ℤ although Theorems 3.11/4.11 and the étale q-Witt sheaf hold over any perfectly covered A. | §5.13 is restated over a perfectly covered Λ-base A (ℤ is the principal case). The API descriptions are generalised; two new Checks (ℤ[t] toric base; domains over ℚ and ℤ[1/2]). |
| L1 | §6.1 locator "§4.3, pp.41–44" points to the wrong section; the p=2 condition is paraphrased loosely. | Locators become KU 3.1–3.2 p.24, 4.18 p.46, 4.18a p.49 and Thm 4.27 p.50. The addendum (R2) is stated exactly (the 2-adic completion satisfies the E₁ condition, automatic when 2 is invertible). |
| N1 | §1.3 Check 2 used ⟨x⟩ for the p-completed polynomial ring, while Check 4 uses ⟨x⟩ for divided powers. | Check 2 now uses (Â_p[x])^∧_p and states the bracket convention. |
| M1 | **Source slip**, QH Lemma 4.2(a): τ*_n is called the left adjoint of the inclusion; for its formula it is the right adjoint. The README was already right. | §5.1 now warns formalisers; locators corrected to pp.53–54. |
| M2 | **Source slip**, QW Lemma 3.7: the printed relation has V_n where the proof gives F_n. The README was already right. | §3.2 now notes the misprint. |
| P1 | §4.18's proof route ("reduce to partial completions") did not match QH Lemma 3.46. | Rewritten: localise H/(q^m−1) at q^d−1 for the proper divisors d, then use the first ghost map and the monoidal Hodge filtration. |
| P2 | §5.19 said TC Lemma 3.16 concerns "extra restrictions"; it is the elementary all-p proof. | Corrected, with QH Remark 4.23 placing the p>2 / even-exponent restriction on the spherical route of §6.4. |
| C1 | §1.12 "This map is not an equivalence" was ambiguous. | It now names the map. |
| C2 | The `TauCeti.QHodge.…` API names look like existing Tau Ceti declarations. | Conventions now state that they are planned names and that none exists at either pin (no rename, per the issue). The grading convention for |β| versus even homotopy is fixed there too. |
| R1 | Suggested.lean broke the 2026-10-19 example rule: five examples and one sorry'd theorem concerned only library objects (zero map on ZMod 2, `DividedPowerAlgebra`, `cyclotomic 3`, zpow of units, `mappingCone` of 0). Three layer headers had no declarations. | Removed them; their computations remain README Checks (§1.3, §1.23, §2.1, Layer 9). Added the real-bodied `torusScaleHom` (via `AddMonoidAlgebra.lift`), its milestone `torusScaleHom_action`, two proved sign-pinning examples (x⁻¹ ↦ q⁻¹x⁻¹; exponent −5), and the integral milestone `cyclotomic_prime_decomposition` ([p]_q = p·u + (q−1)^{p−1}, u(1)=1), which §9.2 now states with p=2 and p=3 witnesses. The docstring is rewritten to the required form. |
| F | Supplier-contract paragraphs started lines with bold supplier names (the mech_check heuristic flagged them). | Reflowed; a sentence on the RTM direction was added. |

Nothing was weakened, renamed or deleted from the README's targets. The
only Lean declaration removed is the library-only
`derived_quotient_torsion_witness` (see R1).

## Pass table (statements touched or added)

| Statement | Instances tried | Result | Change |
| --- | --- | --- | --- |
| §4.28 β-localisation ≃ qHdg[β^{±1}] | unit pair R=A; coordinate pair on A[x]; localising t instead of β | unit pair gives A⟦q−1⟧[β^{±1}]; A[x] gives differential (q^r−1)x^{r−1}dx versus [r]_q via t | stated, with Checks |
| §4.28 completion leaves qHdg unchanged | A=ℚ, S=ℚ[x^{±1}] rational pair | qdR=ℚ⟦h⟧ but completed term Ω⟦h⟧ with H¹∋dx/x; qHdg equal | stated, with a Check |
| §4.28 descent datum | étale R; diagonal A→A×A; m=1 | static H=H_{R/A}, gr^{i>0}=0; two copies; T_1=qHdg | stated |
| §5.26 lifts γ̃^{(n)}_q(x^α) | p=2, n=1: P_1=−1, Q_1=1 (P=Q=1 gives 2q, wrong); reduction x^{2α}/2 | true | Check added |
| §5.26 rational corner | m=1 (zero ring): qdR_{0/ℤ}=ℚ⟦h⟧; ℚ=ℚ⊗_{ℚ[y]}ℚ along y↦0,1 and Poincaré | uncompleted object is not the empty product; completion is 0 | glued definition and source note |
| §5.26 local factor mod q−1 | dR_{(ℤ/p^α)/ℤ_p}=ℤ_p⟨y⟩/(y−p^α)^∧; class y^{[p]}−p^{αp}/p! (p=α=2: y^{[2]}−8) | nonzero p-torsion (formal preimage needs 1/p at y^{[p−1]}); D[1/p]=ℚ_p | Check; only (q−1)-torsion-freeness asserted |
| §5.26 staticity of glued qdR | ℤ_p⟦h⟧+ℚ⟦h⟧ → ℚ_p⟦h⟧ coefficientwise (ℚ_p=ℤ_p+ℤ[1/p]; CRT for several p) | surjective, so the pullback is static | stated as a target |
| §5.26 domain | m=4 (powerful, not high-powered); m=12 (exponent 1 at 3) | 4 covered by Theorem 4.22(a) at p=2; 12 excluded via §5.20 | Checks |
| §5.13 over general A | A=ℤ[t] toric (ψ^m finite free); A=ℚ; A=ℤ[1/2], A², A³ | t stays a coefficient; domains as stated | Checks |
| §5.1 adjunctions | M=Z(n+1), N∈Fil^{[0,n]}: Hom(Z(n+1),N)=N^{n+1}=0 but Hom(τ*_n Z(n+1),N)=N^n | τ*_n is not left adjoint to the inclusion; it is the right adjoint | source note |
| §3.2 dF=nFd | QW proof with [n]_{q^d}=n on (q^d−1)-torsion | printed V_n is a misprint | note |
| §6.1 hypotheses | 2 invertible ⇒ 2-adic completion 0 satisfies (E₁) | (R2) automatic | rewritten |
| `torusScaleHom` | d=1, a=1, m=−1 ↦ q⁻¹; d=2, a=(2,−1), m=(−1,3) ↦ q⁻⁵; a=0 | proved examples; action law true (B-linear, characters multiply) | added |
| `cyclotomic_prime_decomposition` | p=2: u=1; p=3: u=1+h; general binomial expansion | true for all primes | added |
| §4.8 Pridham comparison | Λ-framing with x_i of rank one; flat R | Pridham Thm 1.23 gives the coordinate complex (Ω⟦q−1⟧,(q−1)∇_q); Lη gives qΩ_□; no conflict with QW Thm 5.1 (Λ-maps only) | added |
| Existing Lean theorems | jackson_calculus (monomials, n=0, q=1); qHodge_polynomial (n=0, q=1); coefficientRelation_eval (m=0); torusScale_exists_unique (d=0, q=1) | all true as stated | unchanged |
| Existing computed Checks re-verified | §1.2, §1.3 (𝔽₂ class x^{[2]}−2), §1.8 (N_2=64, N_3=2^{14}3^{26}), §1.23, §1.26–1.28, §2.2–2.4, §2.7, §3.1–3.2 ghost/V checks, §3.15 Check 4, §3.18, §3.20, §4.1, §4.4, §4.6, §4.9, §4.12, §4.27, §5.1, §5.2, §5.9, §5.17 Checks 3–4, §8.1, §9.1, §9.2 | all true | none |

## Source issues for an errata job

These belong in `research/blueprint/errata/` through an errata job (not a
deliverable here). They are in the PROTOCOL §18 shape. Versions read: TC
arXiv v4 (sha256 4479788e…6dd4), QH v2 (591d0bdf…373b), QW v5
(c1c7426f…ed01), all latest on 20 October 2026. Searched: the arXiv
version histories and abstract pages; no correction was found.

1. **TC v4, Lemma 3.7, §3.1, p.32 (also Paragraph 1.8, p.5)**. Kind: error.
   *Printed:* the uncompleted global derived q-de Rham complex of ℤ/p^α
   vanishes after inverting p, because it is a module over (ℤ/p^α)[1/p]=0.
   Hence it is p-complete, and clauses (c),(c_p) of QH Definition 3.2 are
   vacuous for the product filtration on ℤ/m. *Correction:* derived de Rham
   cohomology is not a module over the ring. dR_{(ℤ/m)/ℤ}⊗ℚ ≃ dR_{0/ℚ} ≃ ℚ,
   because ℚ=ℚ⊗_{ℚ[y]}ℚ along y↦0,1 and the Poincaré lemma holds. So the
   rational corner of qdR_{(ℤ/m)/ℤ} is ℚ⟦q−1⟧ with the constant filtration.
   The product filtration is not a q-Hodge filtration on qdR_{(ℤ/m)/ℤ}; the
   correct pair is glued with that constant rational corner.
   *Affects:* the stated lemma. Its completed filtration and the q-Hodge
   complex, and hence Corollary 3.8 and the main theorems, are unchanged.
   Known: new.
2. **QH v2, Lemma 4.2(a), §4.1, p.54**. Kind: misprint. *Printed:* τ*_n is
   the left adjoint of the inclusion Fil^{[0,n]}⊂Fil^{≥0}. *Correction:*
   with the formula given (degrees ≥n+1 replaced by 0) it is the right
   adjoint. It is the left adjoint of constant extension above n; the
   proof's counit τ*_nZ(j)→Z(j) already has the right-adjoint direction.
   *Reason:* Hom(Z(n+1),N)=N^{n+1}=0, whereas Hom(τ*_nZ(n+1),N)=N^n.
   *Affects:* nothing downstream; Lemma 4.2(b),(c) and §4.1 use the correct
   adjunction. Known: new.
3. **QW v5, Lemma 3.7, §3.1, p.39**. Kind: misprint. *Printed:* d∘F_n equals
   n times d∘V_n. *Correction:* d∘F_n=n(F_n∘d), which is what the proof
   computes. Affects: nothing. Known: new.
4. **QH v2, Lemma A.5(b), proof, §A.1, p.71**. Kind: misprint. The last line
   of the proof concludes (q−1)^n where the statement and the computation
   give (q−1)^{n+1}; the second term has (q−1)^{np} with np≥n+1. Affects:
   nothing. Known: new.

## Checks run

- `lean-check …/HabiroCohomologyFoundations/Suggested.lean`: **exit 0**. Exactly seven
  `declaration uses 'sorry'` warnings (jackson_calculus, uniformDenominator_pos,
  torusScaleHom_action, torusScale_exists_unique, coefficientRelation_eval,
  qHodge_polynomial, cyclotomic_prime_decomposition); no other warning or
  error. The file has 216 lines, five real-bodied definitions, ten proved
  examples and no sorry'd data. Memory was checked first (83 GB available).
- `python3 scripts/check_sorry_data.py` on Suggested.lean: exit 0.
- The gate's `mech_check.py` (read first, run with `python3 -I` from scratch):
  0 README identifiers absent from Lean, 0 empty Lean sections, 0 round labels.
  The only bold-heading hit is the `**Summary.**` paragraph.
- `python3 research/blueprint/intake.py check-files` on the four deliverables: 0 problems.
- Mathlib API used by the new definition was read at the pin (082e2d3):
  `AddMonoidAlgebra.lift R A M`, `lift_single`, `single_mul_single`, `one_def`.
- No packet, ORDER file, other package, `content/` or `data/` file was edited.
  No language server, `lake build`, `lake update` or cache command was run,
  and nothing is left running.

## For the maintainer and the next workers

- **RefinedTraceMethods**: its "Unresolved HabiroCohomologyFoundations HQ.3–HQ.4
  contract" (README lines on Habiro contracts, §§6.10–6.13, §7.6–7.9) can now
  point to §4.28 (`qHodge.periodic`, `QHodgeFiltration.completion`,
  `HabiroHodgeDescent`) and §5.26 (`finiteCoefficientPair`). Its high-powered
  set is contained in the powerful set. Its statements use only the completed
  filtration and qHdg, which E1 leaves unchanged. If it ever needs the
  uncompleted pair on ℤ/m, it must take the glued one of §5.26, not TC's product.
- HabiroRings' own exports (perfectly covered Λ-rings, solid completion,
  relative base change, number-field comparison) are that package's job (#11307).
- Untrusted text: no issue comment, pull request or fetched page asked for
  anything outside the job; nothing suspicious was encountered.
