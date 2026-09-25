# Review: K2SymbolsBrauer (Explicit K₂: symbols, residues and reciprocity), part T.3, stages T.3–T.7

Job `REV-K2SymbolsBrauer--T.3` (issue #439), by Claude Code, session `cc-38267a`, 24 September 2026. The packet was written by Claude Code, session cc-7b31c4 (`BP-K2SymbolsBrauer--T.3`). I had no part in it. **Status: accepted**, after the corrections below, which were made in place. The packet stays `partial`: its open gaps and requests are recorded, and two restructure proposals await the orchestrator.

## What was checked

- **Sources.**
  - Weibel, *The K-book*: the author-hosted draft of 29 August 2013 (`https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf`, SHA-256 a04f53c9…). The packet read chapter III only. The review read the sections the nodes need in chapters III, IV and V, and `readSections` lists them.
  - Weibel's errata to the published GSM 145 printing, `https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.errata.pdf`. The live file returns 404, so it was read from the Wayback Machine copy (SHA-256 ef7ed6d0…).
  - The published edition was not read, so every finding is scoped to the draft; `sourceVersions` records both files.
- **Checkers.** Three worked in parallel:

  | Checker | Scope |
  |---|---|
  | C1 | T.3:symbols and T.3:localization-comparison (9 nodes), plus the sign conventions across the packet |
  | C2 | T.4 and T.5 (10 nodes) |
  | C3 | T.6 and T.7 (8 nodes), plus all 20 original baseline declarations |

  Each checker:
  - compared every locator and excerpt with the draft's text layer;
  - opened every cited declaration at Mathlib 082e2d3 and Tau Ceti f790474;
  - read every supplier stage in `data/atlas.json`;
  - wrote its corrections as a machine-applicable patch.

  I applied the patches and resolved the overlaps between them. C1 and C2 had both written the Milnor transfer, its base change and the two Kato lemmas, and they had fixed different normalisations for the higher residues. I then validated the result.
- **What I checked myself.**
  - **Counterexamples.** I recomputed those behind E5, E9 and E11:
    - E5: over ℚ(t), {t, t − 2} has K-book tame symbol 1/2 at t = 2, while every symbol {t, c} or {c, c′} with constants c, c′ has trivial symbol there.
    - E9: λ₅{5} = 1, but λ₁₀{5} = 3 in 𝔽₅^×.
    - E11: ∂{5, 2} = 2 in Theorem III.7.3's normalisation, against 3 from the printed formula.
  - **Identities.** I derived the corrected identities {e₁,e₂} = {h,e₂}{h,e₁}⁻¹{e₁,−1} (h = e₁ − e₂) and ∂(xy) = (−1)^i λ(x)∂(y) + ∂(x)ρ(y) from the Steinberg relation and from Serre's algebra.
  - **Comparison of residues.** ∂^{Wb} = (−1)^{n−1}∂ between Theorem III.7.3's residue and the roadmap's.
  - **Hilbert symbol.** c_ℚ(3,−1) = c_ℚ(7,−1) = c_ℚ(21,−1) = −1, so c_ℚ is not bilinear.
  - **Cycles.** Both the node graph and the stage graph (atlas `requires` and `stageEdges`, plus every prerequisite of the corrected packet) are acyclic.
  - **Baseline.** Every declaration is in the pinned index under its module.
- **Checks.**
  - `python3 scripts/check_blueprint.py --index <pinned declaration index> research/blueprint/packets/K2SymbolsBrauer--T.3.json`: 0 errors, 0 warnings. The original packet also passed; the checker does not test test kinds, stage-level cycles or whether a statement is true.
  - My own validation found:
    - every test has a §12 kind;
    - every excerpt is literal and at most 300 characters;
    - no node has a prerequisite downstream of its own stage;
    - every gap and request has `neededBy`.

## Counts

| | before | after |
|---|---|---|
| nodes | 27 | 58 (36 added, 22 corrected, 5 removed) |
| API items | 46 | 119 |
| unit tests (all with a §12 kind) | 32 (none with a kind) | 69 |
| planets | 11 | 14 (at most 4 per layer) |
| baseline declarations | 20 | 69 (51 added, 2 unused ones dropped) |
| requests (all with `neededBy`) | 15 | 24 |
| gaps (all with `neededBy`) | 5 | 9 |
| restructure entries | 1 | 7 |
| source issues | none recorded | 11 |

**Verified unchanged:** none. Every original node needed a correction.

**Removed (content moved):**
- T.5/arithmetic-computations: a register rather than a declaration. It contradicted the packet's own nodes and gave K₂(𝔽_q) two owners.
- T.5/k2-of-a-finite-field: duplicated the companion part's `T.2/k2-finite-field`, which T.2 already uses, so moving it to T.5 would create a cycle.
- T.5/k2-of-the-integers-and-of-the-rationals: split into three nodes.
- T.7/comparison-and-reciprocity: duplicated the change-of-root rule and misattributed the comparison.
- T.7/etale-chern-class-and-what-is-imported: a list of imports, whose own work is now `chern-class-agreement`.

## The main corrections

**The sign conventions.** The packet's tame symbol matches the stage: ∂{u,π} = ū and ∂{π,u} = ū⁻¹. The K-book's Lemma III.6.3 symbol is exactly its inverse; at the 5-adic place of ℚ, tameSymbol 5 2 = 3 against the K-book's 2. The packet contradicted itself on the higher residues: the statement said that in degree two they are T.3's tame symbol, while the proof steps said so only "up to inversion". They are now normalised with Π on the right:
- ∂{u₁,…,u_{n−1},π} = {ū₁,…,ū_{n−1}};
- in degree two this is T.3's symbol exactly;
- ∂^{Wb} = (−1)^{n−1}∂ against Theorem III.7.3;
- every T.4 statement is unchanged by the sign, because each residue in a given degree changes by the same sign. The explicit formulas are labelled with their normalisation.

**T.3:symbols.**
- **tame-symbol.** It now fixes a uniformiser and defines the symbol through unit parts, using Tau Ceti's `Valuation.exists_eq_zpow_mul_unit_of_surjective`. Five tests on ℚ at 5 carry values.
- **tame-symbol-uniformizer-independence.** It now goes through the uniformiser-free form. `uniformizerChangeUnit`, which applies to DVR elements rather than to valuations, is dropped.
- **tame-symbol-steinberg.** The step in the K-book's exponent is rewritten, exhaustiveness of the four cases is proved, and descent and surjectivity move to the added `tame-symbol-hom`.
- **ramification-formula.** "The parity of e matters" was wrong: e² ≡ e (mod 2) makes the formula uniform. An irrelevant prerequisite was dropped.

**T.3:localization-comparison.**
- **higher-milnor-residues.** It bundled six declarations and is now split into:
  - serre-residue-algebra;
  - serre-map-steinberg;
  - serre-map-kernel (Ex. III.7.2, proved);
  - milnor-residue-product-formula (Ex. III.7.10, E11);
  - specialisation-change-of-uniformiser (Ex. III.7.1 with the errata, E9);
  - higher-ramification-formula (Ex. III.7.8).
- **finite-support.** It intersected the two exceptional sets where their union is needed, and it now holds in every degree.
- **rigidity.** It now has a proof through Hensel's lemma (`IsAdicComplete.henselianRing`, Tau Ceti's `exists_pow_eq_and_sub_one_mem_of_sub_one_mem`), and q = p is a counterexample.
- **transfer-and-norm-residue.**
  - It constructed the transfer a second time; T.4 owns the transfer under RS-28.
  - "With the appropriate exponents" was wrong: ∂_v∘N = Σ_w N∘∂_w carries no ramification index.
  - It lacked the finiteness hypothesis on the integral closure.
  - It used the Bass–Tate sequence, which closed the stage cycle T.3:localization-comparison ⇄ T.4.
  - It is now a theorem parented in T.4, keeping its id because HL.1's packet cites it.
- **localization-boundary.**
  - It never stated its sign, which is now stated: with the K-book's right-linear boundary, ∂{f,g} = tameSymbol g f = (tameSymbol f g)⁻¹.
  - It imported from S.3 and E.3 what the accepted RS-18 makes this layer supply to them, closing the cycles T.3:lc ⇄ S.3 and T.3:lc ⇄ E.3.
  - The requests to S.3, E.3 and HL.1 are deleted, and requests to GeneralAlgebraicKTheory K.3 and K.7 are added.

**T.4.**
- **The two old gaps were wrong.** The K-book proves Milnor's sequence (Theorem III.7.4), Kato's theorem (7.6.1) and Weil reciprocity (III.6.5.3, III.7.5.1, V.6.12.1), so "Bass and Tate are cited, not obtained" and "Weil reciprocity … not from a source that states it" are removed.
- **The proofs are decomposed.**
  - Milnor's sequence: leading-coefficient-splitting, degree-reduction (built on the corrected Ex. III.6.2, E5), residue-section and filtration-quotients.
  - The transfer: simple-transfer (Definition III.7.5), milnor-projection-formula, restriction-transfer-degree, transfer-low-degrees (the field norm, via resultants) and transfer-base-change.
  - Kato: prime-to-p-closure, p-closed-generation (Ex. III.7.6), kato-prime-degree, kato-complete-residue, constant-extension-residue and kato-commuting-square.
  - Reciprocity: projective-line-reciprocity and weil-reciprocity-symbol-form.
- **milnor-transfer-transitivity.** Its excerpt was the roadmap's own stage text attributed to the K-book. It is now Definition III.7.6 with Kato's theorem.
- **valuation-comparison.** It had a reversed prerequisite on weil-reciprocity. It also duplicated Tau Ceti AlgebraicCurves Layer 12 (the audit AUDIT-29 lists the duplicate), which is now requested; the gluing gap became that request.

**T.5.**
- **tame-kernel-sequence.**
  - It claimed that surjectivity follows from the surjectivity of each tame symbol. That is false: the cokernel of the residue sum is SK₁ (Theorem III.6.5), and for ℝ[x,y]/(x²+y²−1) SK₁ ≠ 0 (III.1.5.4).
  - Surjectivity now comes from Bass–Milnor–Serre through a new request to KTheoryLowDegrees U.4.
  - The prerequisite SpecialValuesBirchTate B.7, which closed a cycle, was dropped.
- **K₂(ℤ) and K₂(ℚ).**
  - They are split into real-sign-symbol, k2-of-the-integers and k2-of-the-rationals, with s-integer-tame-kernel-sequence added.
  - The claim that the group vanishes for every imaginary quadratic ring was an over-generalisation: K₂(ℤ[√−7]) = ℤ/2.
  - Milnor's upper bound is a gap.
- **certified-presentation.** It re-planned Mathlib's `Module.Presentation`. It is now an order certificate over `Module.Relations.Solution`, with soundness via `Function.Surjective.bijective_of_nat_card_le`.
- **Requests.** N.6 and N.8 become consumers of T.5, and B.7 and L.1 become consumer and compatibility notes.

**T.6.**
- **dennis-stein-symbol.** The stage's "1 + ab invertible" is the pre-1980 convention, and the old symbol is ⟨−r, s⟩⁻¹ in modern notation; a hypothesis now states this translation. The word and its image diag(u, u⁻¹) in E(R) are written out, and the relations (D1)–(D3) are split into dennis-stein-relations.
- **dennis-stein-presentation.** It is proved for fields from Matsumoto's theorem and cited for local rings.
- **relative-square-zero.** Commutativity was dropped from its hypotheses, although Theorem III.5.11.1(b) needs it. RefinedTraceMethods RT.3 was an inverted supplier. No relative group existed in either K2SymbolsBrauer packet; relative-steinberg-group (Keune–Loday) and relative-presentation are added, with requests to GeneralAlgebraicKTheory K.5 and KTheoryLowDegrees U.5.

**T.7.**
- **symbol-formula.** It cited the wrong passage; the Galois symbol is (6.10.2)/Proposition III.6.10.3. It also had a prerequisite on T.5/unramified-subgroup that closed the cycle T.5 → N.6 → T.7 → T.5.
- **classical-local-symbols.** Its prerequisite L.3 closed a cycle, and Moore's theorem and the split surjection belong to L.3. The quadratic Hilbert symbol is QuadraticFormInvariants 6C's and is imported (hilbert-symbol-steinberg).
- **twisted-roots-of-unity.** μ_m is Tau Ceti's `KummerCoeff`, and the Tate twists are MotivicEtaleKTheory M.1's. The node is re-scoped to the trivialisation by a primitive root and the change-of-root rule.
- **Added:** brauer-valued-symbol, local-comparison, global-reciprocity (from ClassFieldTheory Layer 10) and chern-class-agreement.

## Baseline

- **Added: 51 declarations**, each read at the pin, for example:
  - Tau Ceti's `Valuation.ord` family and the `Place` API for rational function fields (`ord_infty`, `adicOfIrreducibleResidueFieldEquiv`, `restrict`, `normResidue`);
  - Mathlib's `HenselianRing`, `Module.Relations`/`Presentation`, `resultant_eq_prod_eval`, `norm_eq_prod_roots`, `adjoinRootEquivAdjoin`, `TrivSqZeroExt.kerIdeal_sq` and `IsPrimitiveRoot.zmodEquivZPowers`;
  - Tau Ceti's `KummerCoeff`, `ker_kummerMap` and `explicitCup11_eq_neg_flip`.
- **Dropped: `TauCeti.uniformizerChangeUnit` and `FractionalIdeal.finite_factors`.** After the corrections no node uses them. The element form of finite support is `IsDedekindDomain.HeightOneSpectrum.Support.finite`.
- **Descriptions fixed:**
  - `Ideal.sum_ramification_inertia_eq_finrank`: wrong module, and it gives the rank of S over R, not [L : K].
  - `Ideal.relNorm_singleton`: gives `Algebra.intNorm`.
  - `Place.heightOneSpectrumEquiv`: only the bijection.
  - `Place.finite_setOf_ord_ne_zero`: needs `IsFunctionField`.

## Source issues

The packet recorded none. The review adds eleven, each checked at its locator in the draft and marked `confirmed`. The author's errata list was searched for every one.

| id | kind | locator | finding |
|---|---|---|---|
| E1 | misprint | III.5.11 | ⟨r, 1⟩ = 0 should read ⟨r, 1⟩ = 1 (multiplicative), for 1 − r a unit |
| E2 | misprint | III.6.2.3 | y ↦ {x, y} should be y ↦ (x, y)_F |
| E3 | gap | III.6.2.3 | (ζ, x) ≠ 1 does not give a splitting for composite m; choose x with (ζ, x) = ζ |
| E4 | gap | III.6.2.3 | the Steinberg proof has the variable order reversed and evaluates ζ at an element of E |
| E5 | error | Ex. III.6.2 | the stated factorisation is false ({t, t−2} over ℚ(t)); corrected identity given; Theorem III.7.4 stands |
| E6 | misprint | proof of Thm III.7.4 | {f₁,…,f_r} should be {f₁,…,f_n} |
| E7 | misprint | proof of Lemma III.7.4.1 | "in F" should be "in F[t]" |
| E8 | misprint (known) | proof of Prop. III.7.6.4 | N_{a/F}x should be N_{a/E}x (errata p. 272) |
| E9 | error (known) | Ex. III.7.1 | λ depends on π (errata p. 280); formula for the change |
| E10 | gap | Ex. III.7.7, III.7.9 | Ex. 7.7 is applied to a completion, which is not finite; it holds for every F′; "Lemma 7.6.3" should be Corollary 7.6.3 |
| E11 | error | Ex. III.7.10 | the product formula fails in Theorem III.7.3's normalisation; it holds as printed in the roadmap's |

## Suggested Lean file

**The old file.** It elaborated, but most of its statements were `: True := by sorry`. `CertifiedPresentation` was `dummy : Unit`, and most packet API and test names were missing. It violated §13.

**The new file.**
- It was rewritten by a separate agent against the corrected packet: 2826 lines under the packet's namespaces (`TauCeti.TameSymbol`, `TauCeti.MilnorK`, `TauCeti.K2`, `TauCeti.NormResidueSymbol`, `TauCeti.Twist`).
- Its header states the pinned conventions: the tame symbol and its inversion against the K-book, the residue with Π on the right and ∂^{Wb} = (−1)^{n−1}∂, and the transfer normalised by −∂_∞ = Σ N_p∂_p.
- **Stand-ins for the companion part's carriers.** These are honest local definitions, each documented against the companion node it replaces:
  - Milnor K-groups as a quotient of tensor powers by the Steinberg relations;
  - the Steinberg group as a `PresentedGroup`;
  - K₂ as the kernel of its action on column vectors;
  - Steinberg symbols as the commutator of h₁₂(u) and h₁₃(v).
- **What it states.**
  - 110 of the 119 API items, under the packet's names; each was checked with `#check` on its fully qualified name.
  - 64 of the 69 tests as `example`s, and one more in part, each preceded by a `-- test <name> (<kind>)` comment.
  - Every theorem node that the pinned carriers allow.
- **What is a comment instead**, each naming the missing carrier and its supplier:
  - the twists μ_m^{⊗j} for j ≠ 0, 1 (MotivicEtaleKTheory M.1: the seven `trivialisation` items and three tests);
  - QuadraticFormInvariants 6C's `hilbertSymbol`;
  - local reciprocity (ClassFieldTheory Layer 6);
  - the localisation boundary (GeneralAlgebraicKTheory K.3 and K.7);
  - the closed-point–place dictionary (AlgebraicCurves Layer 12);
  - the Galois symbol, the local invariant and the étale Chern class (M.3; ClassFieldTheory Layers 5 and 6).
- **Checks.**
  - It has no `True`, `Unit` or opaque carriers, no `Prop := sorry`, no `set_option` and no root imports.
  - It elaborates with exit code 0 against Mathlib 082e2d3 and the Tau Ceti f790474 sources. The only warnings (262) are uses of `sorry`.
  - The Tau Ceti modules it imports are not built in the local Mathlib-082e2d3 project. The 65 needed modules were therefore compiled with `lean -o` from the f790474 sources and placed first on `LEAN_PATH`, next to that project's Mathlib; the file header says so.

**Corrections to the packet found while formalising.** Each was applied in the packet and noted in the node's `checked` entry.
- **The section h_π.** T.4/residue-section and T.4/filtration-quotients still wrote the K-book's residue (∂_π{π, u₂, …} = {ū₂, …}). In the pinned normalisation that makes ∂_π ∘ h_π = (−1)^{n−1}, not the identity. h_π now puts π last, and the file states it with `Fin.snoc`.
- **A transfer test.** simple-transfer's test `milnorTransferSimple_of_mem_eq_id` must use y = {x, t − a}; the residues of {t − a, x} carry the sign (−1)^n.
- **`brauerSymbol`.** It mapped into `Additive (Br F)` with `→*`, which does not typecheck.
- **`OrderCertificate`.** A structure field and a lemma were both called `card_eq`; the field is now `card_quotient_eq`, with B in the universe of A.
- **`dennisStein_neg_inv`.** It can only be a translation of hypotheses, since no second symbol is defined. The word now writes (h_ij(1 − rs))⁻¹ explicitly: (h_ij(u))⁻¹ and h_ij(u⁻¹) differ by {u, u⁻¹}.
- **`hilbertK2_real`.** It evaluated a local-field symbol over ℝ; it is now the conic symbol there.
- **`tameSymbolHom`.** Its values in an additive target are written as 0.
- **Global reciprocity.** It multiplied elements of different groups μ_m(F_v); the values are read in μ_m(F).
- **`realSignSymbol_eq_milnorExamples`.** It referred to a companion map that has no API name; it is now stated on K^M_2(ℝ) through Matsumoto.
- **`serreAlgebra.decompose`.** Stated for degrees n + 1.

**Library findings (no packet change).**
- **The residue field at 5.** It is not `ZMod 5` in Mathlib, so the tests at 5 are stated through ring maps to `ZMod 5`.
- **`tameSymbol_place`.** It needs a transport along `P.valuation.valuationSubring = P.integers`. A Tau Ceti lemma `Place.valuationSubring_eq_integers` would remove it.
- **An instance diamond on `RatFunc ℚ`.** It forces the ℚ(t) tests to be stated over a general k(t).
- **E(R, I).** It is not pinned (KTheoryLowDegrees U.5), so K₂(R, I) is taken as the kernel of St(R, I) → E(R).
- **T.7/twisted-roots-of-unity.** Its own object τ_ζ^{(j)} cannot be given a signature until M.1 supplies μ_m^{⊗j}; the gap "The twisted coefficient module is missing from both libraries" records this.

## Questions for the orchestrator

1. **Restructure: Milnor transfers.** The packet parents the transfer, Kato's theorem and the transfer formulas in T.4, and those that realise T.3:localization-comparison's targets list it in `realises`. The atlas lists only T.3:symbols as T.4's prerequisite, so it should gain the edge T.3:localization-comparison → T.4. The alternative is to split that sub-stage into residues and transfer formulas.
2. **Restructure: curves.** The curve–place dictionary is AlgebraicCurves Layer 12's (12A–12D), and T.4/valuation-comparison imports it.
3. **The companion part.** Its summary still says T.2:symbols builds the Dennis–Stein symbols and the higher tame symbols, which contradicts this packet. The two verbatim excerpts of the removed T.5/k2-of-a-finite-field belong on T.2/k2-finite-field. It should also expose w_ij and h_ij as API; that request is open.
4. **Part README.** `research/blueprint/readmes/K2SymbolsBrauer--T.3.md` is not a deliverable of this job, so it was not edited. It repeats the contradictions corrected here (for example "under `1 + ab` invertible, with the modern sign convention") and should be regenerated from the corrected packet.
5. **HigherLocalFieldsAndHigherClassFieldTheory HL.1.** Its packet should also cite T.4/milnor-projection-formula for the projection formula.
6. **Checker.** `check_blueprint.py` reads every `tauceti:` prerequisite as a baseline declaration, so a Tau Ceti roadmap layer can be imported only through a request. The layers T.7 imports (ClassFieldTheory 4, 6, 10 and 14; ProfiniteCohomology 6, 8 and 9; LocalFieldsRamification 1; QuadraticFormInvariants 6C) are therefore requests with `neededBy`, not prerequisites.
